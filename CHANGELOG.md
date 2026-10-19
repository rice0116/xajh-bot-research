# 更新歷程

本專案以階段編號記錄協定能力；日期採目前整理日 2026-10-19。

## Unreleased

- Stage 12：等待 `xajh-stage11-gamedata.log`，解析五毒普通攻擊 command 31。
- 預計加入受限的 `--normal-attack-once`，必須先完成自身、目標與伺服器目標回顯驗證。

## Stage 11 — 2026-10-19

- 從 `xajh.exe` 驗證 command 10 是選擇目標，command 11 是取消目標。
- 確認 `AutoAttack` 先形成 action type 9/10，最終施法為 38-byte command 31。
- 定位非 PIE `glinkd` 的 `GNET::GamedataSend::Process`：`0x081f7a9e`。
- 新增 GDB 腳本，在解密後過濾 command 10 與 command 31。

## Stage 10 — 2026-10-19

- 實作 `skills.data` format 25、11 sections 的嚴格解析。
- 載入第一區 10,575 筆 ID／UTF-16LE 名稱。
- 加入世界封包整數關聯分析及離線重播。
- 確認職業值 3 對應五毒；資源 1071 是戰鬥站立動畫，不能視為戰鬥技能 ID。

## Stage 9

- 實作目標選擇後的伺服器回顯解析。
- command 204 確認所選 target ID。

## Stage 8

- 解析 command 13 NPC 清單。
- 實作 C2S command 10：`u16 command + u64 target_id`。

## Stage 7

- 建立世界命令統計、未知封包保存與移動物件追蹤。
- 驗證自身角色、場景及座標。

## Stage 6

- 選角後完成世界初始化與 `FinishLoading` 流程。

## Stage 5

- 實作角色選擇並解析選角成功回覆。

## Stage 4

- 實作角色列表分頁與角色基本資料解析。

## Stage 3

- 完成 KeyExchange、RC4 上行與 RC4+MPPC 下行。

## Stage 2

- 完成 Challenge／Response，抵達 KeyExchange。

## Stage 1

- 建立 Challenge 探測器及 compact integer／Octets 基礎解析。
