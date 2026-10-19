# 安全與敏感資料

請不要在 issue、commit 或 release 中加入：

- 真實帳號或密碼
- 未遮蔽的 `robot.conf`
- 私有伺服器內網位址
- 完整生產環境封包
- 未獲授權散布的遊戲或伺服器二進位

測試使用合成帳號資料。需要討論真實封包時，先裁切為最小 fixture，並檢查其中的 account、userid、roleid、targetid、IP與路徑。
