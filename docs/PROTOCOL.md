# 協定筆記

所有多位元欄位除 compact integer 外均按目前觀測以 little-endian 表示。

## 外層 GNET 流程

| 階段 | Protocol type | 說明 |
|---|---:|---|
| Challenge | 1 | version、nonce、edition、algo、status |
| Response | client | account、HMAC-MD5、userid 等 |
| KeyExchange | 2 | 16-byte nonce |
| Secure reply | 4 | 加密通道建立後回覆 |
| OnlineAnnounce | server | userid、zoneid |
| Role list reply | 83 | 分頁角色列表 |
| GameDataSend | 52 | 內含世界命令 payload |

傳送方向使用 RC4；接收方向使用 RC4 後再做 MPPC 解壓縮。程式包含 compact integer、Octets、RC4、MPPC overlapping match 的自測。

## 已驗證的世界命令

| 方向 | Command | 長度 | 意義 | 依據 |
|---|---:|---:|---|---|
| C2S | 10 | 10 | 選擇目標 | `xajh.exe` builder 及伺服器回顯 |
| C2S | 11 | 2 | 清除目標 | 客戶端清零 current target 後呼叫 |
| C2S | 31 | 38 | 施放技能 | `xajh.exe` builder；欄位語義待擷取 |
| S2C | 13 | variable | NPC／實體列表 | Stage 8 parser 與實際世界封包 |
| S2C | 26 | 30 | 移動物件更新 | 重複座標更新觀測 |
| S2C | 204 | 18 | 當前目標回顯 | role ID、target ID、狀態旗標 |

### C2S command 10

```text
offset  size  field
0       2     command = 10
2       8     target_id
```

### C2S command 31 靜態布局

客戶端 builder 位於 `xajh.exe` VA `0x00cccd50`，總長度固定 38。以下只記錄寬度，名稱在 Stage 11 擷取前保持未知：

```text
offset  size
0       2      command = 31
2       4      unknown_1
6       1      unknown_2
7       2      unknown_3
9       1      unknown_4
10      1      unknown_5
11      2      unknown_6
13      4      unknown_7
17      4      unknown_8
21      4      unknown_9
25      4      x_or_vector_1
29      4      y_or_vector_2
33      4      z_or_vector_3
37      1      unknown_10
```

不要在取得至少兩份對照樣本前為未知欄位命名或發送。

## 世界載入與身分

- 選角成功後取得 world tid、scene tag、位置與 auth 欄位。
- `FinishLoading` 後才統計世界封包。
- 自身角色必須以預期 role ID 驗證。
- 目標只能從已解析 NPC 集合中選取；分類與 hostility 尚未完全解析。

## `skills.data`

- format version：25
- sections：11
- 第一區：10,575 筆資源定義
- 名稱：UTF-16LE
- 此檔偏向動畫／特效資源，不等同角色技能書或已學技能列表。
