# 階段成果索引

| Stage | 可重現成果 | 關鍵輸出 |
|---:|---|---|
| 1 | TCP Challenge 探測 | 36-byte 首包 |
| 2 | Challenge／Response | 抵達 KeyExchange |
| 3 | 安全通道 | RC4+MPPC，收到 OnlineAnnounce |
| 4 | 角色列表 | 分頁列出全部角色 |
| 5 | 選角 | SELECT_ROLE_OK |
| 6 | 世界初始化 | FinishLoading、自身身分 |
| 7 | 世界觀測 | 命令統計、移動物件 |
| 8 | NPC 與目標 | command 13、C2S command 10 |
| 9 | 目標狀態 | S2C command 204 回顯 |
| 10 | 資源關聯 | `skills.data` format 25 |
| 11 | 攻擊擷取準備 | glinkd 明文 command 31 GDB logger |

細節集中在 `CHANGELOG.md`、`HANDOFF.md` 與 `docs/PROTOCOL.md`，避免延續早期編碼已損壞的階段文件。
