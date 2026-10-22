# XAJH Bot Protocol Research

這個專案記錄並實作笑傲江湖私有測試伺服器的自動化客戶端協定。目前已能完成登入、加密通道、角色列表、角色選擇、進入世界、世界物件觀測與目標選擇；攻擊封包仍在驗證階段。

專案源自一套誅仙虛擬客戶端，但笑傲江湖的登入、世界命令與戰鬥流程並不相同。現有 Java probe 是獨立實作，沒有直接重用誅仙封包號碼。

## 目前狀態

| 能力 | 狀態 |
|---|---|
| Challenge／Response 登入 | 已驗證 |
| RC4 發送、RC4+MPPC 接收 | 已驗證 |
| 角色分頁列表 | 已驗證 |
| 選角與進入世界 | 已驗證 |
| 自身角色與座標辨識 | 已驗證 |
| NPC／移動物件觀測 | 已驗證 |
| 選擇目標與伺服器回顯 | 已驗證 |
| `skills.data` 格式 25 讀取 | 已驗證 |
| command 31 離線解析 | 已驗證：38-byte 欄位、目標與座標 |
| S2C command 88 離線解析 | 部分：14-byte 布局與 `reason` |
| S2C command 86 觀測 | 部分：24-byte 布局、source role、skill ID |
| S2C command 117 解析 | 部分：34-byte 布局、role_a／role_b、value、skill ID |
| command 31 單次發送 | 4543／4542／5410 已被接受；4542 確認命中（S2C 117） |
| 自動尋怪、接近、循環攻擊 | 尚未實作 |

完整交接狀態見 [HANDOFF.md](HANDOFF.md)，協定欄位見 [docs/PROTOCOL.md](docs/PROTOCOL.md)。

## 快速開始

需求：

- 建置：JDK 8（輸出 Java 6 相容 class）
- 執行：Java 7 或以上
- 測試：Python 3

Linux／macOS：

```bash
./scripts/build.sh
./scripts/test.sh
java -jar dist/xajh-login-probe.jar --self-test
```

Windows PowerShell：

```powershell
.\scripts\build.ps1
.\scripts\test.ps1
java -jar dist\xajh-login-probe.jar --self-test
```

建立本機設定：

```bash
cp config/robot.conf.example robot.conf
```

填入自己的測試帳號與伺服器位址後：

```bash
java -jar dist/xajh-login-probe.jar \
  --host 192.0.2.10 --port 9223 \
  --account test10001 --config robot.conf --timeout 30 \
  --role-id 12345 --enter-world --observe-seconds 30 \
  --world-log captures/world.log
```

離線解析 command 31／88 擷取：

```bash
java -jar dist/xajh-login-probe.jar \
  --replay-cast-log captures/xajh-stage11-gamedata.log
```

指定 `--target-id` 時，只有在自身角色及該 NPC 都已觀測到後才發送一次選擇目標。
若要送一次 command 31，必須顯式加入 `--normal-attack-once --skill-id 4542`：

```bash
java -jar dist/xajh-login-probe.jar \
  --host 192.0.2.10 --port 9223 --account test10001 --config robot.conf \
  --role-id 12345 --enter-world --target-id 72057594037932528 \
  --normal-attack-once --skill-id 4542 --observe-seconds 10
```

目前只接受已擷取的 4543／4542／5410，且必須等待 command 204 回顯相符。
2026-10-22 實測三者都被接受；只有 4542 收到 self→target 的 S2C 117，
因此先以 4542 驗證命中，不要把 4543／5410 當傷害技。收到 self→target 的 117 時
`TARGET_SUMMARY` 會顯示 `combat_success=hit_observed`；`CAST_SUMMARY` 另分開
`outgoing_hits`／`incoming_hits`。未指定 `--normal-attack-once` 時不會發送攻擊。

## 目錄

```text
src/main/java/       Java probe 原始碼
tests/python/        TCP 整合與離線重播測試
tests/fixtures/      可公開的最小測試資料
tools/               資料解析與 Stage 11 GDB 工具
docs/                協定、階段紀錄與交接分析
config/              不含密碼的設定範例
dist/                已建置的 Java 7 可執行 JAR
scripts/             建置與測試入口
```

## 敏感檔案

請勿提交真實 `robot.conf`、密碼、完整伺服器日誌或遊戲／伺服器二進位。這些檔案已列入 `.gitignore`。需要重現靜態分析時，依 [docs/PRIVATE_INPUTS.md](docs/PRIVATE_INPUTS.md) 放入本機檔案。

## 使用範圍

此專案供自有或已授權伺服器的相容性與自動化測試使用。上傳前請確認你有權使用相關遊戲客戶端、伺服器程式與資料檔。
