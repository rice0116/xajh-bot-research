# 專案交接與續作狀態

這份文件是後續工作開始時的主要入口。請先讀本文件，再讀 `docs/PROTOCOL.md` 與最新 `CHANGELOG.md`。

## 已驗證的測試環境

- glink host：由本機 `robot.conf` 設定，測試埠為 9223。
- 伺服器首包：Challenge version 386，edition bytes `64 66 38 65 38 31 34`（`df8e814`）。
- Linux 執行環境曾使用 OpenJDK 1.7.0_261。
- 建置輸出使用 `javac -source 1.6 -target 1.6`。
- 已驗證角色範例：level 40、profession 3（五毒）、scene tag 75。公開專案不保存真實帳號、密碼、角色 ID 或內網位址。

## 目前程式行為

`XajhLoginProbe.java` 會：

1. 連線並解析 Challenge。
2. 用設定檔密碼產生 HMAC-MD5 Response。
3. 完成 KeyExchange，建立 RC4 發送及 RC4+MPPC 接收。
4. 解析 OnlineAnnounce。
5. 取得完整角色列表。
6. 選角、進入世界並完成 loading 流程。
7. 驗證自身角色，觀測 NPC、移動物件及命令分布。
8. 可選擇一次已觀測目標，並等待 command 204 回顯。
9. 可載入 `skills.data`，但只做資源 ID 關聯分析。

它不會發送移動、技能或攻擊封包。

## 下一個明確工作

使用 `tools/xajh_stage11_capture_attack.gdb` 在測試伺服器的 `glinkd` 擷取官方客戶端的一次普通攻擊：

```bash
gdb -q -p "$(pidof glinkd)" -x /path/to/xajh_stage11_capture_attack.gdb
```

官方客戶端選中一隻近距離可攻擊怪物並只按一次普通攻擊。之後在 GDB 按 `Ctrl-C`：

```gdb
detach
quit
```

取得 `xajh-stage11-gamedata.log`。需要同時包含 command 10 與 command 31；若有多名玩家同時施法，記下測試時間或在低流量環境重做。

## Stage 12 實作準則

1. 將 38 bytes command 31 逐欄位比對 `docs/PROTOCOL.md` 的靜態布局。
2. 再擷取第二次不同目標或不同座標的普通攻擊，區分常數、技能 ID、目標 ID與座標。
3. 先加入離線 parser 與 fixture，不能先發封包。
4. 新增 `--normal-attack-once` 時必須顯式指定，且要求：
   - `--enter-world`
   - 正 role ID
   - 正 target ID
   - self verified
   - target observed in NPC data
   - command 204 target echo matches
5. 僅發送一次，隨後觀測伺服器回覆；循環攻擊留到下一階段。

## 已排除的錯誤方向

- 誅仙 `NORMAL_ATTACK=3` 不能直接套用到笑傲江湖。
- 笑傲江湖 command 11 是取消目標。
- `skills.data` 的資源 ID 不是已學會技能 ID。
- command 17 中的 1071 是五毒站立動畫關聯，不能直接施放。
- 不應在未確認欄位前猜 command 31。

## 本機私有輸入

靜態分析需要時，把 `xajh.exe`、`glinkd`、`elements.data`、`skills.data` 放在本機工作區，絕對不要提交。已知 SHA-256 見 `docs/PRIVATE_INPUTS.md`。

## 完成定義

「自動攻擊／打怪」至少需要：普通攻擊封包、攻擊結果辨識、目標存活狀態、距離判斷、移動協定、尋找下一目標、超時與停止條件。目前只完成目標選擇，不能宣稱已支援自動打怪。
