# Stage 11：普通攻擊封包擷取

## 靜態分析結論

- C2S command 10：選擇目標，10 bytes。
- C2S command 11：取消目標，2 bytes。
- 客戶端 `AutoAttack` 依目標類型建立 action type 9/10。
- 最終技能封包使用 C2S command 31，固定 38 bytes。
- `glinkd` 是 ELF32 i386 ET_EXEC，`GNET::GamedataSend::Process` 位於 `0x081f7a9e`。
- GamedataSend 物件的 `+8` 是已解密遊戲 payload 的 Octets。

## 擷取

在測試伺服器執行：

```bash
gdb -q -p "$(pidof glinkd)" -x /path/to/tools/xajh_stage11_capture_attack.gdb
```

以官方客戶端選中近距離怪物並只做一次普通攻擊。回到 GDB 按 `Ctrl-C`：

```gdb
detach
quit
```

輸出 `xajh-stage11-gamedata.log` 應包含：

```text
C2S_GAME_DATA command=10 length=10 target-select
C2S_GAME_DATA command=31 length=38 cast-skill
```

將日誌放入本機 `captures/`，不要直接提交含真實角色資訊的原始版本。Stage 12 應從中建立最小、去識別化 fixture。
