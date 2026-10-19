# 不納入 Git 的私有輸入

以下檔案用於相容性與靜態分析，因體積、授權或敏感資料原因不納入儲存庫。

| 檔案 | 用途 | 已知資訊 |
|---|---|---|
| `xajh.exe` | 客戶端封包建構器與 AutoAttack 路徑分析 | 18,026,496 bytes |
| `glinkd` | 解密後 GamedataSend 觀測 | ELF32 i386、ET_EXEC |
| `elements.data` | 遊戲元素資料 | SHA-256 `FEB926...`（原工作階段只保存此前綴） |
| `skills.data` | 動畫／技能資源關聯 | SHA-256 `D92B5A1A14322BABDBD33392A155184DEC523975077E79B4DC81033D5193E350` |
| `robot.conf` | 帳號、密碼與伺服器位址 | 永遠不要提交 |
| `*.log` | 世界封包與帳號／角色資訊 | 預設忽略 |

放置方式建議：

```text
private/
  xajh.exe
  glinkd
  elements.data
  skills.data
robot.conf
captures/
```

如需分享重現資料，應建立最小化、去識別化 fixture，只保留解析該行為所需的 bytes。
