# 專案交接與續作狀態

這份文件是後續工作開始時的主要入口。請先讀本文件，再讀 `docs/PROTOCOL.md` 與最新 `CHANGELOG.md`。

## 已驗證的測試環境

- glink host：由本機 `robot.conf` 設定，測試埠為 9223。
- 伺服器首包：Challenge version 386，edition bytes `64 66 38 65 38 31 34`（`df8e814`）。
- Linux 執行環境曾使用 OpenJDK 1.7.0_261。
- 建置輸出使用 `javac -source 1.6 -target 1.6`。
- 已驗證角色範例：level 40、profession 3（五毒）、scene tag 75。公開專案不保存真實帳號、密碼、角色 ID 或內網位址。

## 2026-10-21 追加私有輸入

- `glinkd/glinkd` SHA-256 `F690F2AC5621C71A92184759222443C9C6316175788386151106ED24FB91CF70`；
  `GNET::GamedataSend::Process` 在 `0x081f7a9e`（228 bytes，
  `gamedatasend.hpp:20`）。這靜態驗證了 Stage 11 GDB 腳本的位址與 payload 公式。
- 客戶端 `GameDataSend` type 是 34；glinkd 內部 C2S 是 75、S2C 是 74。
  舊文件的 52 是錯的。`S2CGamedataSend` 的 payload 在 `+0xc`，不是 `+8`。
- `gamedbd/` 是角色資料庫常駐程式，不是 gameserver；沒有 command 31 builder／parser。
  它的 `default_roles.xml`／`sys_roles.xml` 可用來對照技能 ID，但不能產生攻擊封包。
- `gamedbd` 的 `skills` Octets 格式已由 26 筆模板驗證：
  `u8 version=1 + u32 count + count*(u16 skill_id,u8 level)`。
- `skills.data` 名稱顯示 2711／5469／5470 是「通用新手普攻技能」。這是 Stage 12
  的 skill ID 線索，尚未由 command 31 封包驗證。

## 目前程式行為

`XajhLoginProbe.java` 會：

1. 連線並解析 Challenge。
2. 用設定檔密碼產生 HMAC-MD5 Response。
3. 完成 KeyExchange，建立 RC4 發送及 RC4+MPPC 接收。
4. 解析 OnlineAnnounce；若先收到 GNET type 11 `ServerMessage`，解析
   `errcode`／`localsid`，DS code 11 會標示帳號已在登錄狀態並停止。
5. 取得完整角色列表。
6. 選角、進入世界並完成 loading 流程。
7. 驗證自身角色，觀測 NPC、移動物件及命令分布；command 13 支援
   `flags=0x2c`／`0x4800002c`。`template_id` 不是 command 10 的 `target_id`。
8. 可選擇一次已觀測目標，並等待 command 204 回顯。
9. 可載入 `skills.data`，但只做資源 ID 關聯分析。
10. 可用 `--replay-cast-log` 離線解析 command 31、S2C 88 與 S2C 117；不發送封包。
11. 可用 `--normal-attack-once --skill-id 4542` 在目標回顯相符後送出一次
    command 31；預設關閉，只送一次，並解析 S2C 86／88／117／65。

未指定 `--normal-attack-once` 時不會發送移動、技能或攻擊封包。

## 下一個明確工作

2026-10-21 已取得兩組 command 31 樣本（7 個 cast、2 個目標）並完成離線 parser
與受限的單次發送器。`skill_id`（offset 7）、`target_id`（offset 17）、
`position`（offset 25）已確認；`arg1`、`arg2` 等欄位仍只記錄樣本值。

2026-10-22 已在真實測試伺服器對 TID 62030「嵩山精英」各送出一次 4543、4542、5410：
三者都收到兩筆 S2C 86、沒有 S2C 88；只有 4542 另收到一筆 self→target 的 S2C 117
（`value_f32=185.0`、`skill_id=4542`）。這是首次確認命中，不只是「伺服器接受」。
目標在 4542 命中後仍出現在 command 26，並以 0x2079／0x207a 反擊，因此沒有死亡。

- 下一步重複單發 4542，確認 117 可重現、目標 HP 是否下降，再決定較長間隔的循環。
- 4543／5410 只看到 86、沒有 117；先當成前置／非傷害技能，不要拿來做傷害迴圈。
- 117 也會送到攻擊者，且怪物打玩家時同樣有 117；判定時要比對 `role_a`／`role_b`。
- 若帳號回 `ServerMessage errcode=11`，先處理重複登入，不要改攻擊封包。
- 目標要用 command 13 的實例 ID，不是 `MONSTER_ESSENCE` 的 template ID。

若需要新樣本，使用 `tools/xajh_stage11_capture_attack.gdb` 在測試伺服器的 `glinkd`
重新擷取。先確認測試主機的 `glinkd` SHA-256 是 `F690...CF70`；其他 build 的
`0x081f7a9e` 不保證有效。

```bash
pgrep -a glinkd
ss -tnp | grep 9223
gdb -q -p <PID> -x /path/to/xajh_stage11_capture_attack.gdb
```

腳本不會自己 attach；若出現 `The program is not being run`，先用 `pgrep -a glinkd`
確認 PID。若有多個 PID，用 `ss -ltnp | grep 9223` 或 `ss -tnp | grep 9223`
找實際處理連線的程序；`gdb -p` 只接受單一 PID。

官方客戶端選中一隻近距離可攻擊怪物並只按一次普通攻擊。之後在 GDB 按 `Ctrl-C`：

```gdb
detach
quit
```

取得 `xajh-stage11-gamedata.log`。需要同時包含 command 10、command 31，以及
S2C 86／88（最好也有 117／65）；若有多名玩家同時施法，記下測試時間或在低流量環境重做。

## Stage 12 實作準則

1. command 31 的 `skill_id`、`target_id`、`position` 已由兩組樣本確認；
   `arg1`、`arg2`、`arg4`–`arg7`、`arg10` 仍保持原始欄位名。
2. 樣本使用 4543／4542／5410（華山門派通用技能）；不可直接當成所有職業的普攻 ID。
3. 離線 parser、fixture 與單次發送器已完成；合成 TCP 測試通過。
   2026-10-22 真實伺服器接受 4543／4542／5410；4542 產生 S2C 117
   （`value_f32=185.0`），是第一個確認命中；目標未死。
4. `--normal-attack-once` 必須顯式指定 `--skill-id`，目前只接受已擷取的
   4543／4542／5410，且要求：
   - `--enter-world`
   - 正 role ID
   - 正 target ID
   - self verified
   - target observed in NPC data
   - command 204 target echo matches
5. 僅發送一次，隨後觀測伺服器回覆；循環攻擊留到下一階段。
6. 成功判定要等 S2C 86／88／117／65，不可只看 C2S 已送出；117 才是命中線索，
   且會送到攻擊者。
7. 未知 skill ID 直接拒絕；不要用猜測的 `arg1`／`arg2` 擴大支援範圍。

## 已排除的錯誤方向

- 誅仙 `NORMAL_ATTACK=3` 不能直接套用到笑傲江湖。
- 笑傲江湖 command 11 是取消目標。
- `skills.data` 的資源 ID 不是已學會技能 ID。
- command 17 中的 1071 是五毒站立動畫關聯，不能直接施放。
- 不應在未確認欄位前猜 command 31。

## 本機私有輸入

靜態分析需要時，把 `xajh.exe`、`glinkd/`、`gamedbd/`、`elements.data`、`skills.data` 放在本機工作區，絕對不要提交。已知 SHA-256 見 `docs/PRIVATE_INPUTS.md`。

## 完成定義

「自動攻擊／打怪」至少需要：普通攻擊封包、攻擊結果辨識、目標存活狀態、距離判斷、移動協定、尋找下一目標、超時與停止條件。目前只完成目標選擇，不能宣稱已支援自動打怪。
