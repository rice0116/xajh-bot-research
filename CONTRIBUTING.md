# 貢獻與續作規則

1. 每個新協定結論必須標示依據：實際封包、客戶端反組譯、伺服器反組譯或推論。
2. 推論不能寫成已驗證事實；至少兩份對照封包後才命名變動欄位。
3. 先加入離線 parser／fixture，再加入可發送封包的選項。
4. 發送世界動作的功能必須顯式啟用，預設保持觀測模式。
5. fixture 必須最小化並移除帳號、密碼、內網 IP及不必要角色資料。
6. 更新 `CHANGELOG.md`、`HANDOFF.md` 與 `docs/PROTOCOL.md`。
7. 執行 `scripts/test.sh` 或 `scripts/test.ps1`，確認自測和三組整合測試通過。

提交訊息建議使用：

```text
stage12: parse captured normal attack packet
stage12: add one-shot normal attack guard
docs: record command 31 field mapping
```
