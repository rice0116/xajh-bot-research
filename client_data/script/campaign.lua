--[[#tag push auto]]
Campaign = {}
Campaign.Config = {}
Campaign.InstanceRepTask = {}
Campaign.ForbidCode = {}

--活动类型,1－6分别表示: 1福利，2任务，3历练，4活动，5社交，6江湖。

--[[
人数填写规则：
不限人数：min = 1，max = 0
n人以上： min = n，max = 0(这里n要大于2，n=1为不限人数，参见第一条）
最少m人，最多n人：min = m，max = n（n需要大于m，否则逻辑上不对）
n人：min = max = n
单人还是组队通过min是否大于1来判断

奖励填写规则：
award项最多可以填四条，每条包括奖励的图标和悬浮文字
每条奖励可以泛指一类奖励内容，如经验、金钱等，也可以是具体的一类物品，比如宠物技能书
当奖励类型不足四条时，可以只填写1-3条

时间填写规则：
Month（月）：
0	{1-12}		-1		-2			-N
每月	1-12月		奇数月	偶数月		能被N整除的月份

Day（公历日期）：

0	{1-31}		-1		-2			-N
每日	1-31号		奇数日	偶数日		能被N整除的日期

WDay（星期日期）：

7	{0-6}			-1
每日	周日至周六	工作日（周一-周五）


IsRegular：指从00：00到24：00的全天日常活动，true表示日常活动，false表示非日常

Segment
第一项：Hour（开始时刻：时）
{0-23}		24			-N
0时至23时		每小时		能被N整除的小时

第二项：Min（开始时刻：分）
{0-59}
0分至59分
第三项：Last（持续时间，单位为分钟）
数字代表持续的分钟数

0718日新增项：
Quality：活动品质/推荐度，1——白，2——蓝，3——紫，4——黄，5——特别推荐
CountNum：活动计次，Type表示计次类型，ID表示关联的ID
	Type为0时，表示此活动不计次，Id填0；
	Type为1时，表示任务计次，Id为任务的ID；
	Type为2时，表示库任务计次，Id为任务库的ID；
	Type为3时，表示任务类型计次，Id为特殊id表里的威武令每日上限；
	Type为4时，表示副本计次，Id为副本的ID；
	Type为5时，表示声望计次，Id为声望的ID；

IfSpecial：	是否是特殊活动，特殊活动会显示推荐标签，一般为每周、每月的福利活动和节日活动
LuckyAward：	活动为幸运活动时的推荐文字



]]--

function Campaign:GetRepTask(idRep)
	return Campaign.InstanceRepTask[idRep]
end

Campaign.InstanceRepTask[45] = 2779
Campaign.InstanceRepTask[92] = 3154

Campaign.ForbidCode[1]= --[[!AUTO_1]]"^ff0000全服30級以上的玩家人數達到30活動才會開啟。^000000"
Campaign.ForbidCode[2]= --[[!AUTO_2]]"^ff0000全服角色數量達到500後的24小時活動才會開啟。^000000"
Campaign.ForbidCode[3]= --[[!AUTO_3]]"^ff0000全服角色數量達到500後的24小時活動才會開啟。^000000"
Campaign.ForbidCode[4]= --[[!AUTO_4]]"^ff0000全服角色數量達到500後的24小時活動才會開啟。^000000"
Campaign.ForbidCode[5]= --[[!AUTO_5]]"^ff0000全服角色數量達到500後的24小時活動才會開啟。^000000"
Campaign.ForbidCode[6]= --[[!AUTO_6]]"^ff0000新伺服器要開服7天後活動才會開啟。^000000"
Campaign.ForbidCode[7]= "^ff0000全服角色數量達到500後的72小時活動才會開啟。^000000"

function Campaign:GetForbidReason(forbid_code)
	if Campaign.ForbidCode[forbid_code] then
		return Campaign.ForbidCode[forbid_code]
	else
		return --[[!AUTO_7]]"---"
	end
end

function Campaign:GetConfig()
	return Campaign.Config
end

--[[活动显示配置参数]]


--[[Campaign.Config[1] =
{
	ID = 3189,
	Name = "【活动】天下无贼",
	Icon = 11707,
	Type = 1,
	Level = {Min = 0, Max = 0},
	PlayerNum = {Min = 3, Max = 6},
	DelvNpc = {3609},
	location = "",
	TaskLimit = {TaskID = 1237, Times = 5},
	Desc = "      大明开国已近二百年，如今朝纲不振，四境奸贼横行，残害百姓。一代青天海瑞忧国忧民，乃颁下政令，许以重赏，寻仁人志士前往诛之！",
	--直接对应活动列表中的奖励类型，0-空，1-经验，2-金钱，3-物品，一共3个数都要填，数值超出0-3视为无效
	--后面的数不为0时，前面的数也不要填0，否则界面显示会空一位
	AwardType = {1,3,0},      --顺序为图标显示位置，数值为 1 exp，2金钱，3道具
	Award = {
	{icon = 11191 , tip = "大量经验"},
	{icon = 5032 , tip = "英雄令"},

	},
	ReportTime = false,
	Time =
	{
			Month = {0},
			Day = {0},
			WDay = {7},
			IsRegular = true,
			Segment = {{0,0,0}},
	},
	TimeDesc = "全天开放",
	Quality = 2,
	CountNum = {Type = 1,ID = 3966},
	IfSpecial = false,
	LuckyAward = "幸运答题可以获得额外的经验和声望奖励哦",
	IfQuickTeam = true,
}														]]

Campaign.Config[1] =
{
	ID = {3541},
	Name = --[[!AUTO_8]]"【江湖】猛龍過江",
	Icon = 11706,
	Type = 1,
	Level = {Min = 35, Max = 0},
	PlayerNum = {Min = 1, Max = 1},
	DelvNpc = {71445},
	location = --[[!AUTO_9]]"",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = --[[!AUTO_10]]"      猛龍過江，進入其他伺服器進行戰鬥，只有經過鮮血的洗禮，才能成為真的英雄。\r      伺服器達到特定條件後開啟猛龍過江。",
	AwardType = {3,0,0},
	Award = {
	{icon = 11193 , tip = --[[!AUTO_11]]"遊俠戰績"},
	},
	ReportTime = false,
	Time =
	{
		Month = {0},
		Day = {0},
		WDay = {7},
		IsRegular = false,
		Segment = {{18,0,120}},
	},
	TimeDesc = --[[!AUTO_12]]"每天（除週二和周日）18：00-20：00",
	Quality = 25,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = --[[!AUTO_13]]"",
	IfQuickTeam = false,
	DisplayToday = false,
}


Campaign.Config[2] =
{
	ID = {3191},
	Name = --[[!AUTO_14]]"【每日】綠竹幻想鄉",
	Icon = 11708,
	Type = 1,
	Level = {Min = 30, Max = 0},
	PlayerNum = {Min = 3, Max = 6},
	DelvNpc = {19331},
	location = --[[!AUTO_15]]"",
	TaskLimit = {TaskID = 1237, Times = 5},
	Desc = --[[!AUTO_16]]"      洛陽綠竹林中每天都有動物啃咬竹林作怪。綠竹翁不堪其擾，請求各位前來助他驅趕。有可能會遇到猴、熊兩種動物，需要用不同方法來對付它們。\r      活動時間：12:00-14:00,20:00-22:00 0:00-2:00",
	AwardType = {1,3,0},
	Award = {
	{icon = 11191 , tip = --[[!AUTO_17]]"大量經驗"},
	{icon = 2230 , tip = --[[!AUTO_18]]"寶石及相關道具"},
	{icon = 11192 , tip = --[[!AUTO_19]]"少量金錢"},
	},
	ReportTime = true,
	Time =
	{
		Month = {0},
		Day = {0},
		WDay = {7},
		IsRegular = false,
		Segment = {{12,0,120},{20,00,120}},
	},
	TimeDesc = --[[!AUTO_20]]"每天12：00-13：59、19：00-20：59",
	Quality = 87,
	CountNum = {Type = 4,ID = 169},
	IfSpecial = false,
	LuckyAward = --[[!AUTO_21]]"",
	IfQuickTeam = true,
}



Campaign.Config[3] =
{
	ID = {3192},
	Name = --[[!AUTO_22]]"【尋寶】龍嶺迷窟",
	Icon = 11706,
	Type = 1,
	Level = {Min = 40, Max = 0},
	PlayerNum = {Min = 3, Max = 6},
	DelvNpc = {0},
	location = --[[!AUTO_23]]"野外地點刷新",
	TaskLimit = {TaskID = 1237, Times = 5},
	Desc = --[[!AUTO_24]]"      活動時間：每天10:00-19:00的雙數整點開啟，持續45分鐘。\r      在福州郊外、衡山郊外、武當山、藥王穀、少室山，華山，會出現龍嶺迷窟的入口。迷窟中可能遇到各種神秘事件，並隱藏著神秘寶物。",
	AwardType = {3,0,0},
	Award = {
	{icon = 2230 , tip = --[[!AUTO_25]]"寶石及相關道具"},
	{icon = 3368 , tip = --[[!AUTO_26]]"生產材料"},
	{icon = 11192 , tip = --[[!AUTO_27]]"少量金錢"},
	},
	ReportTime = false,
	Time =
	{
		Month = {0},
		Day = {0},
		WDay = {7},
		IsRegular = false,
		Segment = {{10,00,45},{12,00,45},{14,00,45},{16,00,45},{18,00,45}},
	},
	TimeDesc = --[[!AUTO_28]]"每天10:00-19:00",
	Quality = 76,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = --[[!AUTO_29]]"",
	IfQuickTeam = true,
}

--[[
Campaign.Config[19] =
{
	ID = {3194},
	Name = "【活动】天下无忧",
	Icon = 11707,
	Type = 1,
	Level = {Min = 40, Max = 0},
	PlayerNum = {Min = 1, Max = 1},
	DelvNpc = {59652},
	location = "",
	TaskLimit = {TaskID = 4972, Times = 50},
	Desc = "      丐帮，天下第一大帮，以侠义闻名江湖。帮主解风古道热肠，岂能容忍世间不平事如此之多？若有江湖少侠，愿为天下百姓排忧解难，解风将以丐帮珍宝重谢！",
	AwardType = {1,2,3},
	Award = {
	{icon = 6504 , tip = "装备强化材料"},
	{icon = 6514 , tip = "师门卷轴"},
	},
	ReportTime = false,
	Time =
	{
		Month = {0},
		Day = {0},
		WDay = {7},
		IsRegular = true,
		Segment = {{0,0,0}},
	},
	TimeDesc = "全天开放",
	Quality = 2,
	CountNum = {Type = 1,ID = 4972},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = false,
}

Campaign.Config[20] =
{
	ID = {3188},
	Name = "【活动】剿匪百刃帮",
	Icon = 11707,
	Type = 1,
	Level = {Min = 10, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {0},
	location = "部分野外地图",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      近几日州府仓库屡屡被盗，据线报此乃百刃帮众匪所为。今江湖传闻有歹人流窜于各主城周边地区^0059ab（福州郊外、衡山郊外、武当山、华山、药王谷、少室山等地图），形容相貌极似百刃帮众匪，州府特发通缉令，邀各路豪侠前去缉拿。",
	AwardType = {3,0,0},
	Award = {
	{icon = 3368 , tip = "生产材料"},
	},
	ReportTime = false,
	Time =
	{
		Month = {0},
		Day = {0},
		WDay = {7},
		IsRegular = false,
		Segment = {{0,30,60},{1,30,60},{2,30,60},{3,30,60},{4,30,60},{5,30,60},{6,30,60},{7,30,60},{8,30,60},{9,30,60},{10,30,60},{11,30,60},{12,30,60},{13,30,60},{14,30,60},{15,30,60},{16,30,60},{17,30,60},{18,30,60},{19,30,60},{20,30,60},{21,30,60},{22,30,60},{23,30,60}},
	},
	TimeDesc = "全天开放",
	Quality = 2,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = false,
}
--]]
--[[Campaign.Config[21] =
{
	ID = {3190},
	Name = "【活动】决战武尊堂",
	Icon = 11707,
	Type = 1,
	Level = {Min = 20, Max = 0},
	PlayerNum = {Min = 6, Max = 6},
	DelvNpc = {65599},
	location = "",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      五岳剑派盟主左冷禅广邀天下英豪，在嵩山封禅台武尊堂举行比武大会，以武会友，决战武林之巅！",
	AwardType = {3,0,0},
	Award = {
	{icon = 11481 , tip = "扩包道具"},
	{icon = 9141 , tip = "功力药品"},
	{icon = 2230 , tip = "宝石"},

	},
	ReportTime = true,
	Time =
	{
		Month = {0},
		Day = {0},
		WDay = {6},
		IsRegular = false,
		Segment = {{20,00,120}},
	},
	TimeDesc = "20：00-21：59",
	Quality = 2,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = true,
}
]]
Campaign.Config[22] =
{
	ID = {3193,3207,3208,3209,3210,3211,3212,3213,3214,3215,9009,10634},
	Name = --[[!AUTO_89]]"【秘笈】百毒入侵",
	Icon = 14662,
	Type = 1,
	Level = {Min = 40, Max = 0},
	PlayerNum = {Min = 3, Max = 6},
	DelvNpc = {0},
	location = --[[!AUTO_90]]"各大門派地點刷新",
	TaskLimit = {TaskID = 1237, Times = 5},
	Desc = --[[!AUTO_91]]"      活動時間：每天10:00-19:00的單數整點開啟，持續45分鐘。\r      神秘莫測的百毒道人，派出毒蟲圍攻各大門派奪取天下武功秘笈，為奪回被盜的秘笈，必須冒險前往百毒禁地一戰。",
	AwardType = {3,0,0},
	Award = {
	{icon = 9141 , tip = --[[!AUTO_92]]"功力藥品"},
	{icon = 3138 , tip = --[[!AUTO_93]]"門派秘笈"},
	{icon = 3014 , tip = --[[!AUTO_94]]"傳功道具"},
	{icon = 11192 , tip = --[[!AUTO_95]]"少量金錢"},

	},
	ReportTime = false,
	Time =
	{
		Month = {0},
		Day = {0},
		WDay = {7},
		IsRegular = false,
		Segment = {{11,0,45},{13,0,45},{15,0,45},{17,0,45},{19,0,45}},
	},
	TimeDesc = --[[!AUTO_96]]"每天10:00-19:00",
	Quality = 85,
	CountNum = {Type = 4,ID = 3042},
	IfSpecial = false,
	LuckyAward = --[[!AUTO_97]]"",
	IfQuickTeam = true,
}

--[[
--特殊专属活动
Campaign.Config[23] =
{
	ID = {4259},
	Name = "【活动】江湖榜",
	Icon = 14662,
	Type = 1,
	Level = {Min = 20, Max = 0},
	PlayerNum = {Min = 1, Max = 1},
	DelvNpc = {68169},
	location = "",
	TaskLimit = {TaskID = 0, Times = 5},
	Desc = "      衡山城有间茶馆，网罗江湖各道消息，有需求者在这里通过说书人柳敬亭寻找有志者完成他们所需办的事情。每日只能接取五轮十五次，若有侠士敢于犯险取下江湖榜上之木牌并完成，挂牌之人自当通过柳敬亭重赏！",
	AwardType = {1,2,3},
	Award = {
	{icon = 11191 , tip = "少量经验"},
	{icon = 11192 , tip = "少量金钱"},
	{icon = 5032 ,  tip = "英雄令"},
	},
	ReportTime = false,
	Time =
	{
			Month = {0},
			Day = {0},
			WDay = {7},
			IsRegular = true,
			Segment = {{0,0,0}},
	},
	TimeDesc = "全天开放(每日5轮，每轮3次)",
	Quality = 2,
	CountNum = {Type = 2,ID = 1},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = false,
}
--]]

--活动
Campaign.Config[28] =
{
	ID = {6560},
	Name = --[[!AUTO_170]]"【比武】跨服匹配賽",
	Icon = 19939,
	Type = 1,
	Level = {Min = 40, Max = 0},
	PlayerNum = {Min = 1, Max = 1},
	DelvNpc = {0},
	location = --[[!AUTO_171]]"比武場",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = --[[!AUTO_172]]"      週一至週五20:30-22:00、週六週日14:00-16:00 20:30-22:00，在配對比武場內雲集各門派高手，由系統自動為您挑選實力相近對手，更能體現您的真實水準，並可突破2200積分上限，衝擊排行榜更高排名！",
	AwardType = {1,0,0},
	Award = {
	{icon = 11191 , tip = --[[!AUTO_173]]"競技積分、血戰積分"},
	{icon = 9141 , tip = --[[!AUTO_174]]"功力藥品"},
	},
	ReportTime = true,
	Time =
	{
		Month = {0},
		Day = {0},
		WDay = {-1},
		IsRegular = false,
		Segment = {{20,30,90}},
	},
	TimeDesc = --[[!AUTO_175]]"週一至週五20:30-22:00、週六周日14:00-16:00 20:30-22:00",
	Quality = 15,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = --[[!AUTO_176]]"",
	IfQuickTeam = false,
	DisplayToday = false,
}

--珍兽岛

Campaign.Config[29] =
{
	ID = {5892},
	Name = --[[!AUTO_177]]"【爭奪】珍獸島",
	Icon = 7022,
	Type = 2,
	Level = {Min = 50, Max = 0},
	PlayerNum = {Min = 1, Max = 1},
	DelvNpc = {0},
	location = --[[!AUTO_178]]"珍獸島",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = --[[!AUTO_179]]"      每週日開啟，仙獸島爭奪！",
	AwardType = {1,3,0},
	Award = {
	{icon = 11224 , tip = --[[!AUTO_180]]"六星、七星裝備"},
	{icon = 909 , tip = --[[!AUTO_181]]"江湖絕學殘卷"},
	{icon = 11191 , tip = --[[!AUTO_182]]"少量經驗"},
	},
	ReportTime = false,
	Time =
	{
		Month = {0},
		Day = {0},
		WDay = {0},
		IsRegular = false,
		Segment = {{20,30,120}, },
	},
	TimeDesc = --[[!AUTO_183]]"週日20:00-22:00",
	Quality = 97,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = --[[!AUTO_184]]"",
	IfQuickTeam = false,
}

--比武场匹配（活动提示用，界面不显示）
Campaign.Config[30] =
{
	ID = {4794},
	Name = --[[!AUTO_185]]"【比武】全服配對賽",
	DisPlay = false,
	Icon = 19939,
	Type = 1,
	Level = {Min = 40, Max = 0},
	PlayerNum = {Min = 1, Max = 1},
	DelvNpc = {0},
	location = --[[!AUTO_186]]"比武場",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = --[[!AUTO_187]]"      週一至週五20:30-22:00、週六週日14:00-16:00 20:30-22:00，在配對比武場內雲集各門派高手，由系統自動為您挑選實力相近對手，更能展現您的真實水準，並可突破2200積分上限，衝擊排行榜更高排名！",
	AwardType = {1,0,0},
	Award = {
	{icon = 11191 , tip = --[[!AUTO_188]]"競技積分、血戰積分"},
	{icon = 9141 , tip = --[[!AUTO_189]]"功力藥品"},
	},
	ReportTime = true,
	Time =
	{
		Month = {0},
		Day = {0},
		WDay = {0},
		IsRegular = false,
		Segment = {{14,0,120},{20,30,90}},
	},
	TimeDesc = --[[!AUTO_190]]"週一至週五20:30-22:00、週六週日14:00-16:00 20:30-22:00",
	Quality = 15,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = --[[!AUTO_191]]"",
	IfQuickTeam = false,
	DisplayToday = false,
}

--比武场匹配（活动提示用，界面不显示）
Campaign.Config[43] =
{
	ID = {4794},
	Name = "【比武】全服匹配賽",
	--DisPlay = false,
	Icon = 19939,
	Type = 1,
	Level = {Min = 40, Max = 0},
	PlayerNum = {Min = 1, Max = 1},
	DelvNpc = {0},
	location = "比武場",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      週一至週五20:30-22:00、週六周日14:00-16:00 20:30-22:00，在匹配比武場內雲集各門派高手，由系統自動為您挑選實力相近對手，更能體現您的真實水準，並可突破2200積分上限，衝擊排行榜更高排名！",
	AwardType = {1,0,0},
	Award = {
	{icon = 11191 , tip = "競技積分、血戰積分"},
	{icon = 9141 , tip = "功力藥品"},
	},
	ReportTime = true,
	Time =
	{
		Month = {0},
		Day = {0},
		WDay = {0,6},
		IsRegular = false,
		Segment = {{14,0,120},{20,30,90}},
	},
	TimeDesc = "週一至週五20:30-22:00、週六周日14:00-16:00 20:30-22:00",
	Quality = 15,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = false,
	DisplayToday = false,
}


--武道会竞猜
Campaign.Config[44] =
{
	ID = {6180},
	Name = "武道會狀元競猜",
	Icon = 19939,
	Type = 1,
	Level = {Min = 30, Max = 0},
	PlayerNum = {Min = 1, Max = 1},
	DelvNpc = {0},
	location = "比武場管理員或洛陽瘋癲老頭",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      活動時間：本賽季（每月15日22:00至下月15日20:10）開始至武道會開始前。\r      在天下第一武道會預備階段，所有30級以上玩家均可在比武場管理員或洛陽瘋癲老頭處參與武狀元競猜，成功預測武狀元可得到豐厚獎勵，快來參加吧。",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "豐厚獎勵"},
	},
	ReportTime = false,
	Time =
	{
		Month = {0},
		Day = {0},
		WDay = {7},
		IsRegular = false,
		Segment = {{1,0,1320}},
	},
	TimeDesc = "本賽季（每月15日22:00至下月15日20:10）開始至武道會開始前",
	Quality = 12,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = false,
	DisplayToday = false,
}

--武道会比武
Campaign.Config[45] =
{
	ID = {6181},
	Name = "天下第一武道會",
	Icon = 19939,
	Type = 1,
	Level = {Min = 30, Max = 0},
	PlayerNum = {Min = 1, Max = 1},
	DelvNpc = {0},
	location = "比武場-武道會",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      活動時間：每月第四個週五19:50~21:30\r      天下第一武道會，雲集各路豪俠！在上賽季中進入競技積分排行榜前32名的俠士將受邀參加，在比賽中每成功晉級一輪，均可獲得豐厚獎勵，成功奪魁者更可獲得獨有稱號，並在衡山城中鑄像，供世人瞻仰。",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "豐厚獎勵"},
	},
	ReportTime = false,
	Time =
	{
		Month = {0},
		Day = {0},
		WDay = {45},
		IsRegular = false,
		Segment = {{19,50,100}},
	},
	TimeDesc = "每月第四個週五19:50~21:30",
	Quality = 13,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = false,
	DisplayToday = false,
}


--九层妖楼
Campaign.Config[51] =
{
	ID = {6267},
	Name = "【秘寶】九層妖樓",
	Icon = 14662,
	Type = 1,
	Level = {Min = 60, Max = 0},
	PlayerNum = {Min = 3, Max = 6},
	DelvNpc = {0},
	location = "60級和60級以上的地宮深處",
	TaskLimit = {TaskID = 1237, Times = 5},
	Desc = "      活動時間：每天15-23的單數整點10分開啟，持續50分鐘。\r      友情提示：妖樓內邪物強大，建議滿隊進入！\r      傳說中藏有海量財寶的九層妖樓中藏有何種財寶？神秘的冰川女屍和他的五大守護獸實力如何？真像即將隨著妖樓一起現世。",
	AwardType = {3,0,0},
	Award = {
	{icon = 11239 , tip = "擊殺掉落：大量經驗、\r大量寶石及相關道具、\r星塵砂、大還丹、精煉石、秘笈書卷。\r注：掉落的道具均可交易。"},
	{icon = 11240 , tip = "每日首次通關：星塵砂*5\r注：通關每人獎勵的的道具均可交易。"},
	{icon = 11241 , tip = "每日第二次通關：木質齒輪*5\r注：通關每人獎勵的的道具均可交易。"},
	{icon = 11242 , tip = "每日第三次通關：秘笈書卷*2、高級秘笈書卷*1\r注：通關每人獎勵的的道具均可交易。"},
	},
	ReportTime = false,
	Time =
	{
		Month = {0},
		Day = {0},
		WDay = {7},
		IsRegular = false,
		Segment = {{15,10,49},{17,10,49},{19,10,49},{21,10,49},{23,10,49}},
	},
	TimeDesc = "每天15：10-23：59",
	Quality = 84,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = true,
}


--青城战场
Campaign.Config[87] =
{
	ID = {6998},
	Name = "<戰場>鏖戰青城",
	Icon = 11708,
	Type = 2,
	Level = {Min = 60, Max = 0},
	PlayerNum = {Min = 6, Max = 6},
	DelvNpc = {},
	location = "戰場入口（活動按鈕右側）",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       每週一、三、五、日晚上20:00~23:00，鏖戰青城戰場現已全面開啟，在青城戰場中，各路豪俠集聚青城，翹首以盼此番武林盛況。\r    勝負規則：在規定7分鐘時間內，擊殺數最多一方將獲得勝利，若雙方擊殺數相同，則剩餘血量較多一方獲勝。贏得3點個人積分，即可向戰場活動接引人姚玄策領取每日鏖戰青城戰場首勝獎勵。",
	AwardType = {1,0,0},
	Award = {
	{icon = 11191 , tip = "個人積分"},
	},
	ReportTime = true,
	Time =
	{
		Month = {0},
		Day = {0},
		WDay = {1,3,5,0},
		IsRegular = true,
		Segment = {{20,00,180}},
	},
	TimeDesc = "每週一、三、五、日晚上20:00~23:00",
	Quality = 67,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = true,
}

--洛阳战场
Campaign.Config[88] =
{
	ID = {7000},
	Name = "<戰場>洛陽獅會",
	Icon = 11708,
	Type = 2,
	Level = {Min = 60, Max = 0},
	PlayerNum = {Min = 6, Max = 6},
	DelvNpc = {},
	location = "戰場入口（活動按鈕右側）",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       每週二、四、六、日晚上20:00~23:00，洛陽獅會戰場現已全面開啟，在獅會戰場中，各路豪俠齊聚洛陽，奪取獅王稱號。\r    勝負規則：在規定7分鐘時間內，將戰場下方的金獅送回己方舞獅台，每奪回1次得1分，奪得金獅數量最多一方將獲得勝利，若雙方金獅數量相同，則剩餘血量較多一方獲勝。贏得3點個人積分，即可向戰場活動接引人姚玄策領取每日鏖戰青城戰場首勝獎勵。",
	AwardType = {1,0,0},
	Award = {
	{icon = 11191 , tip = "個人積分"},
	},
	ReportTime = true,
	Time =
	{
		Month = {0},
		Day = {0},
		WDay = {2,4,6,0},
		IsRegular = true,
		Segment = {{20,00,180}},
	},
	TimeDesc = "每週二、四、六、日晚上20:00~23:00",
	Quality = 67,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = true,
}



--躲猫猫活动
Campaign.Config[98] =
{
	ID = {7002},
	Name = "【活動戰場】捉迷藏",
	Icon = 11708,
	Type = 2,
	Level = {Min = 60, Max = 0},
	PlayerNum = {Min = 16, Max = 16},
	DelvNpc = {},
	location = "",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      變各種東西，藏起來！尋找小夥伴，抓住他！\r 每局20分鐘；跨服匹配，滿人就開!\r參與方式：在活動開啟期間內，由戰場->活動戰場介面進入\r活動獎勵：參與捉迷藏將可獲得捉迷藏積分，在洛陽“小夥伴”處兌換稀有道具。 \r活動時間：每週三21:00——23:00。\r報名條件：60級以上玩家均可參加。",
	AwardType = {1,3,0},
	Award = {
	{icon = 11191 , tip = "海量經驗"},
	{icon = 2230 , tip = "變身卡、星辰砂、消業丸"},
	},
	ReportTime = true,
	Time =
	{
		Month = {0},
		Day = {0},
		WDay = {3},
		IsRegular = false,
		Segment = {{21,00,120}},
	},
	TimeDesc = "每週三21:00——23:00",
	Quality = 65,
	CountNum = {Type = 4,ID = 6266},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = true,
}


--躲猫猫活动（仅用于提示，界面不显示）
Campaign.Config[99] =
{
	ID = {7002},
	Name = "【活動戰場】捉迷藏",
	Display = false,
	Icon = 11708,
	Type = 2,
	Level = {Min = 60, Max = 0},
	PlayerNum = {Min = 16, Max = 16},
	DelvNpc = {},
	location = "洛陽城 小夥伴",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      變各種東西，藏起來！尋找小夥伴，抓住他！\r 每局20分鐘；跨服匹配，滿人就開!\r參與方式：在活動開啟期間內，由戰場->活動戰場介面進入\r活動獎勵：參與捉迷藏將可獲得捉迷藏積分，在洛陽“小夥伴”處兌換稀有道具。 \r活動時間：每週三21:00——23:00。\r報名條件：60級以上玩家均可參加。",
	AwardType = {1,3,0},
	Award = {
	{icon = 11191 , tip = "海量經驗"},
	{icon = 2230 , tip = "變身卡、星辰砂、消業丸"},
	},
	ReportTime = true,
	Time =
	{
		Month = {0},
		Day = {0},
		WDay = {3},
		IsRegular = false,
		Segment = {{21,00,120}},
	},
	TimeDesc = "每週三21:00——23:00",
	Quality = 65,
	CountNum = {Type = 4,ID = 6266},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = true,
}
--[[
--<炫动江湖>宝石免费换
Campaign.Config[114] =
{
	ID = {7524},
	Name = "炫动江湖，宝石免费换",
	Icon = 11708,
	Type = 1,
	Level = {Min = 1, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {},
	location = "福州城、衡山城、洛阳城",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       2014年8月29日-2014年9月7日，在活动期间累计在线时长分别超过24、48、72、96、120小时，即可获取相应的礼包一份。",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {8},
		Day = {29,30,31},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2014年8月29日-2014年9月7日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = true,
}
--<炫动江湖>宝石免费换（续）
Campaign.Config[115] =
{
	ID = {7524},
	Name = "炫动江湖，宝石免费换",
	Icon = 11708,
	Type = 1,
	Level = {Min = 1, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {},
	location = "福州城、衡山城、洛阳城",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       2014年8月29日-2014年9月7日，在活动期间累计在线时长分别超过24、48、72、96、120小时，即可获取相应的礼包一份。",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {9},
		Day = {1,2,3,4,5,6,7,8,9},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2014年8月29日-2014年9月7日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = true,
}
--<炫动江湖>道具不绑定
Campaign.Config[116] =
{
	ID = {7525},
	Name = "炫动江湖，道具不绑定",
	Icon = 11708,
	Type = 1,
	Level = {Min = 1, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {},
	location = "",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       2014年9月25日21:00-22:00，活动期间只要在线，每15分钟可获得一个大礼包！",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {9},
		Day = {25},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2014年9月25日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = true,
}
--<炫动江湖>大转盘
Campaign.Config[117] =
{
	ID = {7526},
	Name = "大转盘助你炫动江湖",
	Icon = 11708,
	Type = 1,
	Level = {Min = 1, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {77089},
	location = "福州城、衡山城、洛阳城东方姑娘处",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       2014年9月1日-2014年9月7日，每晚20:30-22:00，活动期间副本通关获得转盘币，去东方姑娘处可兑换大转盘进行抽奖！",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {9},
		Day = {1,2,3,4,5,6,7},
		WDay = {7},
		IsRegular = true,
		Segment = {{20,00,120}},
	},
	TimeDesc = "2014年9月1日-2014年9月7日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = true,
}
--<炫动江湖>和教主一起再战江湖
Campaign.Config[118] =
{
	ID = {7527},
	Name = "和教主一起再战江湖",
	Icon = 11708,
	Type = 1,
	Level = {Min = 1, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {77089},
	location = "福州城、衡山城、洛阳城东方姑娘处",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       2014年8月29日-2014年9月29日，活动期间只要是7月29日后未登录游戏的玩家，可找东方姑娘领取再战江湖奖励！",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {8},
		Day = {29,30,31},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2014年8月29日-2014年9月29日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = true,
}
--<炫动江湖>和教主一起再战江湖（续）
Campaign.Config[119] =
{
	ID = {7527},
	Name = "和教主一起再战江湖",
	Icon = 11708,
	Type = 1,
	Level = {Min = 1, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {77089},
	location = "福州城、衡山城、洛阳城东方姑娘处",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       2014年8月29日-2014年9月29日，活动期间只要是7月29日后未登录游戏的玩家，可找东方姑娘领取再战江湖奖励！",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {9},
		Day = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2014年8月29日-2014年9月29日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = true,
}
--<炫动江湖>装备做不停
Campaign.Config[120] =
{
	ID = {7605},
	Name = "炫动江湖，装备做不停",
	Icon = 11708,
	Type = 1,
	Level = {Min = 20, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {77089},
	location = "福州城、衡山城、洛阳城东方姑娘处",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       2014年11月15日-2014年12月15日，每逢周六周日晚20:00-22:00，手工套装打造几率大幅提升，活动期间，可前往东方姑娘处领取三级滋补丹5个！",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "精力药品"},
	},
	ReportTime = true,
	Time =
	{
		Month = {11},
		Day = {15,16,22,23,29,30},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2014年11月15日-2014年12月15日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = true,
}
--<炫动江湖>装备做不停（续）
Campaign.Config[121] =
{
	ID = {7605},
	Name = "炫动江湖，装备做不停",
	Icon = 11708,
	Type = 1,
	Level = {Min = 20, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {77089},
	location = "福州城、衡山城、洛阳城东方姑娘处",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       2014年11月15日-2015年1月18日，每逢周六周日晚20:00-22:00，手工套装打造几率大幅提升，活动期间，可前往东方姑娘处领取三级滋补丹5个！",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "精力药品"},
	},
	ReportTime = true,
	Time =
	{
		Month = {12},
		Day = {6,7,13,14},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2014年11月15日-2014年12月15日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = true,
}
--<炫动江湖>橙色镖车奖不停
Campaign.Config[122] =
{
	ID = {7528},
	Name = "炫动江湖，橙色镖车奖不停",
	Icon = 11708,
	Type = 1,
	Level = {Min = 34, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {86285},
	location = "孙镇疆",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       2014年12月20日-2015年1月18日，每逢周六周日，活动期间，与NPC孙镇疆对话，免费获得橙镖令！运送或劫取橙色镖车成功，所得奖励比普通镖车更丰厚！",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {12},
		Day = {20,21,27,28},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2014年12月20日-2015年1月18日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = true,
}
--<炫动江湖>橙色镖车奖不停（续）
Campaign.Config[123] =
{
	ID = {7528},
	Name = "炫动江湖，橙色镖车奖不停",
	Icon = 11708,
	Type = 1,
	Level = {Min = 34, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {86285},
	location = "孙镇疆",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       2014年12月20日-2015年1月18日，每逢周六周日，活动期间，与NPC孙镇疆对话，免费获得橙镖令！运送或劫取橙色镖车成功，所得奖励比普通镖车更丰厚！",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {1},
		Day = {3,4,10,11,17,18},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2014年12月20日-2015年1月18日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = true,
}
----<炫动江湖>签到领奖
Campaign.Config[124] =
{
	ID = {7539},
	Name = "炫动江湖，每日签到送",
	Icon = 11708,
	Type = 1,
	Level = {Min = 35, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {77089},
	location = "福州城、衡山城、洛阳城 东方姑娘",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       2014年8月29日-2014年9月17日，活动开启期间，每天至东方姑娘处签到可获得奖励，连续签到还可获得丰厚大奖。",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {8},
		Day = {29,30,31},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2014年8月29日-2014年9月17日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = true,
}

----<炫动江湖>签到领奖(续)
Campaign.Config[125] =
{
	ID = {7539},
	Name = "炫动江湖，每日签到送",
	Icon = 11708,
	Type = 1,
	Level = {Min = 35, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {77089},
	location = "福州城、衡山城、洛阳城 东方姑娘",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       2014年8月29日-2014年9月17日，活动开启期间，每天至东方姑娘处签到可获得奖励，连续签到还可获得丰厚大奖。",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {9},
		Day = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2014年8月29日-2014年9月17日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = true,
}
-]]
--支援边疆
--支援边疆
Campaign.Config[159] =
{
	ID = {7397},
	Name = "【每日】支援邊疆",
	Icon = 11707,
	Type = 1,
	Level = {Min = 35, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {86285},
	location = "天下會",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       每日12:00--23：59，憑藉邊疆密函領取支援邊疆任務，每天可以免費獲得三個邊疆密函，也可以到商城購買額外的邊疆密函用於第四次任務的領取，活動每天只限四次",
	AwardType = {1,0,0},
	Award = {
	{icon = 11191 , tip = "海量經驗 武勳值"},
	},
	ReportTime = true,
	Time =
	{
		Month = {0},
		Day = {0},
		WDay = {7},
		IsRegular = false,
		Segment = {{12,00,720}},
	},
	TimeDesc = "每日 12:00-23:59",
	Quality = 41,
	CountNum = {Type = 1,ID = 8623},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = false,
}
--紧急支援
Campaign.Config[160] =
{
	ID = {7399},
	Name = "【每日】緊急支援",
	Icon = 11707,
	Type = 1,
	Level = {Min = 35, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {},
	location = "天下會",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       每天支援邊疆活動期間，盟主和蒼穹賢士可以找到天下會軍開始進行師緊急支援活動，活動期間參加支援邊疆獲得的獎勵將更加豐厚，如果當前有盟主在位，20:00時會自動開始一次活動，活動持續4小時",
	AwardType = {1,0,0},
	Award = {
	{icon = 11191 , tip = "海量經驗 武勳值"},
	},
	ReportTime = true,
	Time =
	{
		Month = {0},
		Day = {0},
		WDay = {7},
		IsRegular = true,
		Segment = {{20,00,240}},
	},
	TimeDesc = "每日 20:00-23:59",
	Quality = 55,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = false,
}
--峨眉山跑酷
Campaign.Config[161] =
{
	ID = {7521},
	Name = "峨眉山跑酷",
	Icon = 11707,
	Type = 2,
	Level = {Min = 60, Max = 0},
	PlayerNum = {Min = 20, Max = 0},
	DelvNpc = {},
	location = "戰場-活動戰場",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "每週一21：00-23：00可以在戰場-活動戰場中參加峨眉山跑酷，金頂在召喚大家哦",
	AwardType = {1,0,0},
	Award = {
	{icon = 3368 , tip = "稀有生產材料"},
	},
	ReportTime = true,
	Time =
	{
		Month = {0},
		Day = {0},
		WDay = {1},
		IsRegular = true,
		Segment = {{21,00,120}},
	},
	TimeDesc = "每週一 21:00-23:00",
	Quality = 65,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = false,
}
--[[
----中秋桂树
Campaign.Config[162] =
{
	ID = {5985},
	Name = "【中秋】采花酿桂酒",
	Icon = 11708,
	Type = 1,
	Level = {Min = 20, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {77089},
	location = "福州城、衡山城、洛阳城 东方姑娘",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       中秋佳节，酒仙娘子降临凡间，东方姑娘让你采一些桂花交给桂十三姨，可以换取醇厚甜美的桂花酒哦！",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {9},
		Day = {5,6,7,8,9,10,11},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2014年9月5日-2014年9月11日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = true,
}
----江山不夜
Campaign.Config[163] =
{
	ID = {7615},
	Name = "【国庆不打烊】江山不夜",
	Icon = 11708,
	Type = 1,
	Level = {Min = 20, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {77089},
	location = "福州城、衡山城、洛阳城 东方姑娘",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       10月1日~10月5日，去东方姑娘处领取烟花币，前往福州郊外、余杭、铸剑谷、剑阁，找到烟花商人购买烟花，在你想要许愿的地方释放烟花，即可获得奖励！在这热闹的国庆，我们约上小伙伴们一起比比谁的烟花更美吧！",
	AwardType = {1,0,0},
	Award = {
	{icon = 11191 , tip = "经验"},
	{icon = 11192 , tip = "少量金钱"},	
	},
	ReportTime = true,
	Time =
	{
		Month = {10},
		Day = {1,2,3,4,5},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2014年10月1日-2014年10月5日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = true,
}
----国庆宝珠消消乐
Campaign.Config[164] =
{
	ID = {7616},
	Name = "【国庆不打烊】萌宠消消乐",
	Icon = 11708,
	Type = 1,
	Level = {Min = 30, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {77089},
	location = "福州城、衡山城、洛阳城 东方姑娘",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       活动期间，去东方姑娘处领取任务，开始小游戏“萌宠消消乐”，该游戏是消除游戏，把三个或三个以上相同的萌宠移动到一起即可消除获得分数，在规定时间内达到相应分数即可过关！该游戏无限次进行，但只有前两次有奖励哟。",
	AwardType = {1,0,0},
	Award = {
	{icon = 12384 , tip = "星尘砂"},
	{icon = 11192 , tip = "少量金钱"},
	},
	ReportTime = true,
	Time =
	{
		Month = {10},
		Day = {1,2,3,4,5,6,7},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2014年10月1日-2014年10月7日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = true,
}
----国庆双倍经验
Campaign.Config[165] =
{
	ID = {7617},
	Name = "【国庆不打烊】经验疯狂送",
	Icon = 11708,
	Type = 1,
	Level = {Min = 1, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {},
	location = "",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       国庆期间，10月1日、10月3日、10月6日、10月7日晚上19~20点双倍经验开启，各位少侠女侠大侠们，走过撸过不要错过！",
	AwardType = {1,0,0},
	Award = {
	{icon = 11191 , tip = "海量经验"},
	},
	ReportTime = true,
	Time =
	{
		Month = {10},
		Day = {1,3,6,7},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2014年10月1日-2014年10月7日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = true,
}
----国庆躲猫猫
Campaign.Config[166] =
{
	ID = {7002},
	Name = "【国庆不打烊】普天同庆·捉迷藏",
	Icon = 11708,
	Type = 7,
	Level = {Min = 60, Max = 0},
	PlayerNum = {Min = 16, Max = 16},
	DelvNpc = {},
	location = "",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      国庆期间，10月1日~10月7日，每晚20~21点，捉迷藏活动开启！快来吧一起游戏吧，变各种东西，藏起来！寻找小伙伴，抓住他！\r 每局20分钟；跨服匹配，满人就开!\r参与方式：在活动开启期间内，由战场->活动战场界面进入\r活动奖励：参与捉迷藏将可获得捉迷藏积分，在洛阳“小伙伴”处兑换稀有道具。 \r特别说明：每天最多玩3次。\r报名条件：60级以上玩家均可参加。 ",
	AwardType = {1,3,0},
	Award = {
	{icon = 11191 , tip = "海量经验"},
	{icon = 2230 , tip = "变身卡、星尘砂、消业丸"},
	},
	ReportTime = true,
	Time =
	{
		Month = {10},
		Day = {1,2,3,4,5,6,7},
		WDay = {7},
		IsRegular = false,
		Segment = {{20,00,60}},
	},
	TimeDesc = "10月1日-10月7日20:00——21:00",
	Quality = 5,
	CountNum = {Type = 4,ID = 6266},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = true,
}
--放开那奸细
Campaign.Config[167] =
{
	ID = {7619},
	Name = "【国庆不打烊】放开那奸细",
	Icon = 11708,
	Type = 1,
	Level = {Min = 30, Max = 0},
	PlayerNum = {Min = 3, Max = 5},
	DelvNpc = {84982},
	location = "洛阳城 冀飞虎",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       2014年10月1日-2014年10月10日，蒙古入侵！有奸细混入阴山草原，请侠士们三人以上六人以内组队找冀飞虎接取任务，进入阴山草原查出奸细，将奸细一举歼灭，卫我河山！",
	AwardType = {1,0,0},
	Award = {
	{icon = 18156 , tip = "转盘大礼包"},
	{icon = 11192 , tip = "少量金钱"},
	},
	ReportTime = true,
	Time =
	{
		Month = {10},
		Day = {1,2,3,4,5,6,7,8,9,10},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2014年10月1日-2014年10月10日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = true,
}
-]]

--天下会官员福利
Campaign.Config[168] =
{
	ID = {7522},
	Name = "【福利】天下會軍餉",
	Icon = 11707,
	Type = 2,
	Level = {Min = 30, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {86723},
	location = "天下會",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       天下會官員軍餉發放！今日13:00至23:00，十大官員和飛龍軍均可前往天下會群雄殿找天下會總管領取官員專屬禮包！特別提醒：十大官員的紫裝現已用禮盒包裝,與軍餉一起發放.最終產出的部件位置和屬性未知,但裝備等級與自身等級掛鉤！",
	AwardType = {0,0,0},
	Award = {
	},
	ReportTime = false,
	Time =
	{
		Month = {0},
		Day = {0},
		WDay = {0},
		IsRegular = false,
		Segment = {{13,00,600}},
	},
	TimeDesc = "     每週日，13：00-22：59",
	Quality = 65,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = false,
	DisplayToday = true,
}
--[[
--帮派精英赛
Campaign.Config[171] =
{
	ID = {7639},
	Name = "帮派精英赛",
	Icon = 11708,
	Type = 1,
	Level = {Min = 1, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {},
	location = "",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       2014年10月31日-2014年11月12日，活动期间，每天14：00～16：00以及21：00～23：00，嘉州（651，308）、仙愁峡（709，-240）、西安（425，84）会分别出现北冥玄狼、剑冢护灵、圣火蛮牛。打败它们可以获得流光晶石，帮主可使用流光晶石为自己获得精英帮派积分，从而为帮会赢取参加精英帮派挑战赛的资格。群雄逐鹿，就在此刻，侠士们还等什么？先下手为强吧！",
	AwardType = {1,0,0},
	Award = {
	{icon = 906 , tip = "精英帮派积分 流光晶石"},
	},
	ReportTime = true,
	Time =
	{
		Month = {10},
		Day = {31},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2014年10月31日-2014年11月12日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = false,
}
--帮派精英赛（续）
Campaign.Config[172] =
{
	ID = {7639},
	Name = "帮派精英赛",
	Icon = 11708,
	Type = 1,
	Level = {Min = 1, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {},
	location = "",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       2014年10月31日-2014年11月12日，活动期间，每天14：00～16：00以及21：00～23：00，嘉州（651，308）、仙愁峡（709，-240）、西安（425，84）会分别出现北冥玄狼、剑冢护灵、圣火蛮牛。打败它们可以获得流光晶石，帮主可使用流光晶石为自己获得精英帮派积分，从而为帮会赢取参加精英帮派挑战赛的资格。群雄逐鹿，就在此刻，侠士们还等什么？先下手为强吧！",
	AwardType = {1,0,0},
	Award = {
	{icon = 906 , tip = "精英帮派积分 流光晶石"},
	},
	ReportTime = true,
	Time =
	{
		Month = {11},
		Day = {1,2,3,4,5,6,7,8,9,10,11,12},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2014年10月31日-2014年11月12日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = false,
}
-]]
--光棍节情侣
Campaign.Config[173] =
{
	ID = {6296},
	Name = "【光棍】相思竹，寄相思",
	Icon = 11708,
	Type = 3,
	Level = {Min = 30, Max = 0},
	PlayerNum = {Min = 2, Max = 2},
	DelvNpc = {77615},
	location = "福州城月老處。",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      2017年11月11日-11月15日，已婚夫妻可在月老處領取相思竹，秀恩愛，寄相思！",
	AwardType = {1,0,0},
	Award = {
	{icon = 11191 , tip = "經驗"},
	{icon = 26536 , tip = "靈草"},
	},
	ReportTime = true,
	Time =
	{
		Month = {11},
		Day = {11,12,13,14,15},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2017年11月11日-11月15日",
	Quality = 99.01,
	CountNum = {Type = 1,ID = 7733},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = true,
}

--光棍节单身
Campaign.Config[174] =
{
	ID = {6296},
	Name = "【光棍】拆散一對是一對",
	Icon = 11708,
	Type = 3,
	Level = {Min = 30, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {77616},
	location = "福州城田伯光處。",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      2017年11月11日-11月15日，單身俠士可在福州城田伯光處領取一把怨念斧，去福州郊外砍掉秀恩愛的相思竹！",
	AwardType = {1,0,0},
	Award = {
	{icon = 11191 , tip = "經驗"},
	{icon = 26536 , tip = "靈草"},
	},
	ReportTime = true,
	Time =
	{
		Month = {11},
		Day = {11,12,13,14,15},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2017年11月11日-11月15日",
	Quality = 99.02,
	CountNum = {Type = 1,ID = 7735},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = true,
}
--光棍节买买买
Campaign.Config[175] =
{
	ID = {7629},
	Name = "【光棍】雙十一買買買",
	Icon = 11708,
	Type = 3,
	Level = {Min = 30, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {77089},
	location = "福州城、衡山城、洛陽城 東方姑娘",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       2017年11月11日-11月15日晚上20：00-21：00，找東方姑娘接受任務，去衡山城的絕版商人那里購買相應的奢侈品！絕版商人會在衡山城四個地點（倉庫旁邊、驛站旁邊、幫會管理員旁邊、東方姑娘旁邊）之一刷新，找到這個逗筆，少俠們看著辦吧！",
	AwardType = {1,0,0},
	Award = {
	{icon = 11191 , tip = "經驗"},
	{icon = 26502 , tip = "月塵砂"},
	},
	ReportTime = true,
	Time =
	{
		Month = {11},
		Day = {11,12,13,14,15},
		WDay = {7},
		IsRegular = true,
		Segment = {{20,00,60}},
	},
	TimeDesc = "2017年11月11日-11月15日",
	Quality = 99.03,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = true,
}

--番邦入侵
Campaign.Config[176] =
{
	ID = {7611},
	Name = "【活動】番邦入侵",
	Icon = 11708,
	Type = 2,
	Level = {Min = 70, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {},
	location = "",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       每週六12：00-18:00之間，只要有盟主在位，盟主和蒼穹賢士可以打開一次番邦入侵活動，活動開始後所有玩家可以使用武勳道具【禦敵戰旗】進入邊疆進行活動享受前所未有的征戰榮耀！活動持續1小時，請所有英雄務必在1小時內解決戰鬥！如果盟主沒有打開則天下會武林盟會在18點自動開始",
	AwardType = {1,0,0},
	Award = {
	
	{icon = 11242 , tip = "絕學殘章及殘頁"},
	
	},
	ReportTime = false,
	Time =
	{
		Month = {0},
		Day = {0},
		WDay = {6},
		IsRegular = true,
		Segment = {{12,00,360}},
	},
	TimeDesc = "每週六12:00-18:00",
	Quality = 96,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = false,
}
--[[
--<炫动江湖>装备做不停（续2）
Campaign.Config[177] =
{
	ID = {7605},
	Name = "完美十周年，装备做不停",
	Icon = 11708,
	Type = 1,
	Level = {Min = 20, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {77089},
	location = "福州城、衡山城、洛阳城东方姑娘处",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "        十周年，我们一起有钱任性；十周年，我们一起剁过的手；十年踪迹十年心，各位男神女神们，未来的十周年我们还一起笑傲江湖吧！2014年12月20日-2015年1月18日，每逢周六周日晚20:00-22:00，手工套装打造几率大幅提升，活动期间，可前往东方姑娘处领取三级滋补丹5个！",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "精力药品"},
	},
	ReportTime = true,
	Time =
	{
		Month = {1},
		Day = {3,4,10,11,17,18},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2014年12月20日-2015年1月18日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = true,
}
--<炫动江湖>装备做不停（续3）
Campaign.Config[178] =
{
	ID = {7605},
	Name = "完美十周年，装备做不停",
	Icon = 11708,
	Type = 1,
	Level = {Min = 20, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {77089},
	location = "福州城、衡山城、洛阳城东方姑娘处",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "        十周年，我们一起有钱任性；十周年，我们一起剁过的手；十年踪迹十年心，各位男神女神们，未来的十周年我们还一起笑傲江湖吧！2014年12月20日-2015年1月18日，每逢周六周日晚20:00-22:00，手工套装打造几率大幅提升，活动期间，可前往东方姑娘处领取三级滋补丹5个！",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "精力药品"},
	},
	ReportTime = true,
	Time =
	{
		Month = {12},
		Day = {20,21,27,28},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2014年12月20日-2015年1月18日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = true,
}
-]]
--天下通缉
Campaign.Config[179] =
{
	ID = {7642},
	Name = "【活動】天下通緝",
	Icon = 11708,
	Type = 1,
	Level = {Min = 60, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {86723},
	location = "天下會總管",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      每天12：00—22：00之間，盟主和蒼穹賢士可以打開一次天下通緝活動，眾俠士可在天下會總管李岩處領取本日任務，完成後可獲得豐厚回報！活動持續時間為2小時。",
	AwardType = {1,0,0},
	Award = {
        {icon = 4853 , tip = "換鏢令"},
        {icon = 11191 , tip = "海量經驗"},
	{icon = 11192 , tip = "海量金錢"},
	{icon = 11193 , tip = "武勳值"},
	},
	ReportTime = false,
	Time =
	{
		Month = {0},
		Day = {0},
		WDay = {7},
		IsRegular = false,
		Segment = {{12,00,600}},
	},
	TimeDesc = "每日 12：00—22：00",
	Quality = 14,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = true,
	DisplayToday = false,
}
--[[--千秋美酒
Campaign.Config[180] =
{
	ID = {7739},
	Name = "千秋美酒",
	Icon = 11708,
	Type = 1,
	Level = {Min = 30, Max = 0},
	PlayerNum = {Min = 3, Max = 6},
	DelvNpc = {77089},
	location = "福州城、衡山城、洛阳城 东方姑娘",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       祖千秋酒瘾又犯了，准备了许多材料准备酿造新酒，不想有一些小贼出来捣乱，他委托东方姑娘找人帮助他赶走小贼，快去找东方姑娘接取任务吧！",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {0},
		Day = {0},
		WDay = {5},
		IsRegular = true,
		Segment = {{21,00,120}},
	},
	TimeDesc = "2014年12月1日-2014年12月7日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = true,
}]]--
--[[
----桃谷六仙
Campaign.Config[181] =
{
	ID = {7740},
	Name = "【火爆年末】智斗六仙",
	Icon = 11708,
	Type = 1,
	Level = {Min = 30, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {77089},
	location = "福州城、衡山城、洛阳城 东方姑娘",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       自从不戒和尚在你的帮助下战胜了桃谷六仙后，桃谷六仙就很不甘心！他们终日缠着仪琳要让仪琳当裁判，再和不戒和尚比赛跑圈！这种千载难逢的戏弄桃谷六仙的机会你怎么能错过呢？快去找东方姑娘接取任务吧！",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {12},
		Day = {8,9,10,11,12,13,14},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2014年12月8日-2014年12月14日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = true,
}
----统统连起来吧
Campaign.Config[182] =
{
	ID = {7741},
	Name = "【火爆年末】统统连起来吧",
	Icon = 11708,
	Type = 1,
	Level = {Min = 20, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {77089},
	location = "福州城、衡山城、洛阳城 东方姑娘",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       亲爱的，辛苦了一年是不是累了？来一发休闲游戏放松一下吧！活动期间去东方姑娘处接取任务，可以进行萌萌的连连看游戏呢，共有三种难度，大神关更可无限畅玩，但每天只有第一次玩有奖励！*为了每天都能正常接取大神关游戏，请尽量不要跨天玩耍。",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {12},
		Day = {15,16,17,18,19,20,21},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2014年12月15日-2014年12月21日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = true,
}
--]]
----全民COS圣诞老人
Campaign.Config[183] =
{
	ID = {7628},
	Name = "全民COS圣诞老人",
	Icon = 11708,
	Type = 3,
	Level = {Min = 30, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {77089},
	location = "福州城、衡山城、洛陽城 東方姑娘",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       圣诞老人最近正在四处奔走相亲打算梅开二度，趁这个时候，快去找东方姑娘帮圣诞老人发礼品，享受cos圣诞老人的节日乐趣的同时，还能获得丰富的大奖哦！2017年12月25日——2017年12月31日活动期间，还能参加相关圣诞活动获得“圣诞礼包”，对其他玩家使用圣诞礼包，该玩家可以获得奖励。每人每天最多只能收到8个“圣诞礼包”的奖励，超过8个以后，即使能再接收“圣诞礼包”，也不会再获得奖励！",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "豐厚獎勵"},
	},
	ReportTime = true,
	Time =
	{
		Month = {12},
		Day = {25,26,27,28,29,30,31},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2017年12月25日——2017年12月31日",
	Quality = 99.04,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = false,
}
--[[
----整点在线送风物石
Campaign.Config[184] =
{
	ID = {7743},
	Name = "【火爆年末】每日领取风物石",
	Icon = 11708,
	Type = 1,
	Level = {Min = 30, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {77089},
	location = "福州城、衡山城、洛阳城 东方姑娘",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       从12月19日起至12月24日，玩家朋友们在21：00—22：00登录游戏，就可以找东方姑娘领取这个阶段的在线奖励——风物石！",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {12},
		Day = {19,20,21,22,23,24},
		WDay = {7},
		IsRegular = true,
		Segment = {{21,00,60}},
	},
	TimeDesc = "2014年12月19日-2014年12月24日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = false,
}
----整点在线送双倍经验
Campaign.Config[185] =
{
	ID = {7747},
	Name = "【火爆年末】每日领取双倍经验",
	Icon = 11708,
	Type = 1,
	Level = {Min = 30, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {77089},
	location = "福州城、衡山城、洛阳城 东方姑娘",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       从12月19日起至12月24日，玩家朋友们在19：00—20：00登录游戏，就可以找东方姑娘领取这个阶段的在线奖励——1小时双倍经验！年末了，快让等级飞起来吧！",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {12},
		Day = {19,20,21,22,23,24},
		WDay = {7},
		IsRegular = true,
		Segment = {{19,00,60}},
	},
	TimeDesc = "2014年12月19日-2014年12月24日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = false,
}
----整点在线送宝石碎片
Campaign.Config[186] =
{
	ID = {7748},
	Name = "【火爆年末】每日领取宝石碎片",
	Icon = 11708,
	Type = 1,
	Level = {Min = 30, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {77089},
	location = "福州城、衡山城、洛阳城 东方姑娘",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       从12月19日起至12月24日，玩家朋友们在20：00—21：00登录游戏，就可以找东方姑娘领取这个阶段的在线奖励——宝石碎片！",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {12},
		Day = {19,20,21,22,23,24},
		WDay = {7},
		IsRegular = true,
		Segment = {{20,00,60}},
	},
	TimeDesc = "2014年12月19日-2014年12月24日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = false,
}
----消费大回馈
Campaign.Config[187] =
{
	ID = {7744},
	Name = "【火爆年末】消费大回馈",
	Icon = 11708,
	Type = 1,
	Level = {Min = 1, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {},
	location = "",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       从12月19日起至12月31日，玩家朋友们在商城内进行第一次元宝消费，即可获得丰富的回馈奖励！",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {12},
		Day = {19,20,21,22,23,24,25,26,27,28,29,30,31},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2014年12月19日-2014年12月31日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = false,
}
-]]
----【活动】夺羊大战
Campaign.Config[188] =
{
	ID = {7688},
	Name = "【活動】奪羊大戰",
	Icon = 11708,
	Type = 2,
	Level = {Min = 60, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {},
	location = "戰場-活動戰場",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       每週二晚上21：00～23：00,玩家朋友們可以通過跨服匹配找到對手進行6v6趕羊大賽！找到5個配合默契的小夥伴一起參賽，更有利於獲得勝利哦！",
	AwardType = {1,0,0},
	Award = {
	{icon = 21058 , tip = "密寶文書"},
        {icon = 18100 , tip = "2級精煉石"},
        {icon = 9141 , tip = "一級大還丹"},
	},
	ReportTime = true,
	Time =
	{
		Month = {0},
		Day = {0},
		WDay = {2},
		IsRegular = false,
		Segment = {{21,00,120}},
	},
	TimeDesc = "每週二 21：00～23：00",
	Quality = 65,
	CountNum = {Type = 4,ID = 7687},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = true,
}
--决战黑木崖
Campaign.Config[189] =
{
	ID = {7686},
	Name = "【活動】決戰黑木崖",
	Icon = 11708,
	Type = 2,
	Level = {Min = 1, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {86983},
	location = "天下會盟主雕像",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      週五21：00—22：00之間，盟主和蒼穹賢士可以預約決戰黑木崖活動，預約成功後當天22：00-22:30持有決殺令的玩家以及天下會所有官員可以到天下會盟主雕像處進入黑木崖之塔，活動打開者會直接獲得一份大獎，展開大亂鬥，看誰能最先走到黑木崖之塔的頂層！活動結束後進行排名，獎勵空前，驚喜不斷！請務必保證任務列表未滿",
	AwardType = {1,0,0},
	Award = {
          {icon = 2230 , tip = "暗器提升道具"},
	  {icon = 11193 , tip = "風物石"},
	},
	ReportTime = false,
	Time =
	{
		Month = {0},
		Day = {0},
		WDay = {5},
		IsRegular = false,
		Segment = {{22,00,30}},
	},
	TimeDesc = "週五 22：00—22：30",
	Quality = 75,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = false,
}
--[[
--元旦酿屠苏酒
Campaign.Config[190] =
{
	ID = {7622},
	Name = "【元旦】酿屠苏酒",
	Icon = 11708,
	Type = 1,
	Level = {Min = 20, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {77089},
	location = "福州城、衡山城、洛阳城 东方姑娘",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      2018年1月1日-1月7日，找东方姑娘接取活动任务，并按她的提示去寻找酿造屠苏酒的材料。屠苏酒酿成之后，饮下即可获得2级大还丹、3级精炼石、星尘砂、风物石、密宝文书、双倍经验等丰富的奖励。机会难得，不要错过哦！",
	AwardType = {1,0,0},
	Award = {
	{icon = 11191 , tip = "海量经验"},
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {1},
		Day = {1,2,3,4,5,6,7},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2015年1月1日-1月6日",
	Quality = 5,
	CountNum = {Type = 1,ID = 7735},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = false,
}

--双节活动打雪仗1
Campaign.Config[191] =
{
	ID = {6586},
	Name = "【双节】打雪仗",
	Icon = 11708,
	Type = 1,
	Level = {Min = 50, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {77089},
	location = "福州城、衡山城、洛阳城东方姑娘处。",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      2017年1月1日-2017年1月10日，为庆贺元旦，小伙伴们一起来愉快的玩耍吧！东方姑娘会送你小雪球，扔给其他玩家，可将对方变成小雪人或新年礼盒！成功恶搞别人后，你会获得奖励哦！还有机会获得五彩雪球，可将对方变成华丽的大雪人、圣诞树、大饺子、果盘之一，你获得的奖励更丰厚！",
	AwardType = {1,0,0},
	Award = {
	{icon = 11191 , tip = "经验"},
	},
	ReportTime = true,
	Time =
	{
		Month = {1},
		Day = {1,2,3,4,5,6,7,8,9,10},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2017年1月1日-2017年1月10日",
	Quality = 5,
	CountNum = {Type = 1,ID = 7755},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = true,
}

--双节活动堆雪人
Campaign.Config[192] =
{
	ID = {6586},
	Name = "【元旦】冰雪风情",
	Icon = 11708,
	Type = 1,
	Level = {Min = 35, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {77089},
	location = "福州城、衡山城、洛阳城东方姑娘处。",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       2017年1月1日-2017年1月10日，茫茫的白雪覆盖大地，在这辞旧迎新的日子里，何不堆一个漂亮的雪人放松心情？快去问东方姑娘要堆雪人的必备材料吧！",
	AwardType = {1,0,0},
	Award = {
	{icon = 11191 , tip = "经验"},
	},
	ReportTime = true,
	Time =
	{
		Month = {1},
		Day = {1,2,3,4,5,6,7,8,9,10},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2017年1月1日-2017年1月10日",
	Quality = 5,
	CountNum = {Type = 1,ID = 7758},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = true,
}
--]]
--桃谷迷阵
Campaign.Config[193] =
{
	ID = {7981},
	Name = "桃谷迷陣",
	Icon = 11708,
	Type = 2,
	Level = {Min = 30, Max = 0},
	PlayerNum = {Min = 3, Max = 3},
	DelvNpc = {87857},
	location = "衡山城桃谷迷陣傳送使",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       在桃谷之中隱藏著一股十分強大的殺氣，據說是因為在迷陣之下埋藏著東廠的信物。每週四晚21:00至23:00，可三人組隊前往桃谷迷陣一探究竟，只有一次機會，挑戰成功即可換來終身富貴... 前半小時參與的隊伍可獲得特殊BUFF哦！",
	AwardType = {1,0,0},
	Award = {
	{icon = 11191 , tip = "大量經驗"},
	{icon = 3280 , tip = "風物石"},
	},
	ReportTime = true,
	Time =
	{
		Month = {0},
		Day = {0},
		WDay = {4},
		IsRegular = true,
		Segment = {{21,00,120}},
	},
	TimeDesc = "每週四21:00-23:00",
	Quality = 65,
	CountNum = {Type = 4,ID = 7630},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = true,
}--[[
--匆匆那年
Campaign.Config[194] =
{
	ID = {8000},
	Name = "【囍迎新春】时光回溯，匆匆那年",
	Icon = 11708,
	Type = 1,
	Level = {Min = 30, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {88355},
	location = "福州郊外回忆之门。",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       2015年2月5日-2015年2月14日，福州郊外出现了一个回忆之门，通过回忆之门可以抵达记忆中的孤剑村进行一次回忆，完成回忆副本有机会获得“时间碎片”“记忆碎片”“友情碎片”“爱情碎片”，每样碎片集齐三个可以找回忆之门兑换额外的神秘奖励！",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {2},
		Day = {5,6,7,8,9,10,11,12,13,14},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2015年2月5日-2015年2月14日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = true,
}
--累计在线得好礼
Campaign.Config[195] =
{
	ID = {8001},
	Name = "【囍迎新春】在线得好礼",
	Icon = 11708,
	Type = 1,
	Level = {Min = 30, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {77089},
	location = "福州城、衡山城、洛阳城东方姑娘处。",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       2015年2月5日—2015年2月14日，登录找东方姑娘接四个任务。累计在线15分钟，45分钟，90分钟，145分钟，分别获得祝福礼盒，精致礼盒，华丽礼盒，土豪礼盒！",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {2},
		Day = {5,6,7,8,9,10,11,12,13,14},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2015年2月5日—2015年2月14日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = true,
}
----<囍迎新春>签到领奖
Campaign.Config[196] =
{
	ID = {7994},
	Name = "【囍迎新春】每日签到",
	Icon = 11708,
	Type = 1,
	Level = {Min = 20, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {77089},
	location = "福州城、衡山城、洛阳城 东方姑娘",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       2015年1月28日-2015年2月28日，活动开启期间，每天至东方姑娘处签到可获得奖励，累计签到7次、14次、21次以及28次还可获得额外的丰厚大奖。",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {1},
		Day = {28,29,30,31},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2015年1月28日-2015年2月28日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = false,
}

----<囍迎新春>签到领奖(续)
Campaign.Config[197] =
{
	ID = {7994},
	Name = "【囍迎新春】每日签到",
	Icon = 11708,
	Type = 1,
	Level = {Min = 20, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {77089},
	location = "福州城、衡山城、洛阳城 东方姑娘",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       2015年1月28日-2015年2月28日，活动开启期间，每天至东方姑娘处签到可获得奖励，累计签到7次、14次、21次以及28次还可获得额外的丰厚大奖。",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {2},
		Day = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2015年1月28日-2015年2月28日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = false,
}
----【囍迎新春】番邦入侵
Campaign.Config[198] =
{
	ID = {7611},
	Name = "【囍迎新春】番邦入侵",
	Icon = 11708,
	Type = 7,
	Level = {Min = 70, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {},
	location = "",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      2015年2月1日~2015年2月28日期间，每周日晚上18点~19点，番邦入侵活动再次开启！活动开启后所有玩家可以使用武勋道具【御敌战旗】进入边疆进行活动享受前所未有的征战荣耀！活动持续1小时，请所有英雄务必在1小时内解决战斗！赶快准备好加入战斗吧，丰厚大奖等你来拿！ ",
	AwardType = {1,0,0},
	Award = {
	{icon = 11242 , tip = "绝学残章及残页"},	
	},
	ReportTime = true,
	Time =
	{
		Month = {2},
		Day = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28},
		WDay = {7},
		IsRegular = false,
		Segment = {{18,00,60}},
	},
	TimeDesc = "2015年2月1日-2015年2月28日每周日晚上18:00——19:00",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = true,
}
----【情人节】不一样的烟火
Campaign.Config[199] =
{
	ID = {7996},
	Name = "【情人节】不一样的烟火",
	Icon = 11708,
	Type = 7,
	Level = {Min = 20, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {},
	location = "",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      2015年2月4日~2015年2月25日，活动期间冲进烟花榜的300名玩家，都将在活动结束后获得相应的绝版称号（前十均为绝版情侣称号，并有额外情人节礼包）！排名第一的玩家，还将获得全服独一无二的情侣背部挂件——心锁恋芝！快与亲爱的ta一起放烟花，享受浪漫的二人世界吧!获奖的玩家打开游戏界面右下角的排行榜，即可在烟花榜下方点击按钮领取奖励。玩家需要在活动结束后一周之内领取相应奖励，否则会与大奖失之交臂哦~！ ",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},	
	},
	ReportTime = true,
	Time =
	{
		Month = {2},
		Day = {4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2015年2月4日-2015年2月25日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = true,
}
----【囍迎新春】春节世界BOSS
Campaign.Config[200] =
{
	ID = {7995},
	Name = "【囍迎新春】世界BOSS疯狂献礼",
	Icon = 11708,
	Type = 7,
	Level = {Min = 30, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {},
	location = "",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      2015年2月20日-2015年2月26日活动期间，每日中午12：30以及晚间21：30，邪恶的年兽将在少室山和武当山脚两处同时出现，快去打败它们，保卫春节的安宁，抢夺珍贵的年货吧！年兽所掉落的奖励，周围的玩家都可拾取哦！年兽死亡以后东方姑娘将现身致谢，存在30分钟，在这时间内玩家都可以找她领取额外的新年奖励。 ",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},	
	},
	ReportTime = true,
	Time =
	{
		Month = {2},
		Day = {20,21,22,23,24,25,26},
		WDay = {7},
		IsRegular = false,
		Segment = {{12,30,120},{21,30,120}},
	},
	TimeDesc = "2015年2月20日——2015年2月26日，每日中午12：30以及晚间21：30",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = true,
}

--春节活动春联对对贴
Campaign.Config[210] =
{
	ID = {6948},
	Name = "【春节】春联对对贴",
	Icon = 11708,
	Type = 1,
	Level = {Min = 20, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {77089},
	location = "福州城、衡山城、洛阳城东方姑娘处。",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      2016年2月5日-2016年2月14日，领取任务后拿着东方姑娘给你的几副春联寻找三大主城内还没有贴春联的民户，将春联贴到民户的大门上，即可找东方姑娘领取岁岁平安！",
	AwardType = {1,0,0},
	Award = {
	{icon = 11191 , tip = "经验"},
	},
	ReportTime = true,
	Time =
	{
		Month = {2},
		Day = {5,6,7,8,9,10,11,12,13,14},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2016年2月5日-2016年2月14日",
	Quality = 5,
	CountNum = {Type = 1,ID = 7899},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = true,
}
--春节活动团圆宴
Campaign.Config[211] =
{
	ID = {6949},
	Name = "【春节】团圆宴",
	Icon = 11708,
	Type = 1,
	Level = {Min = 20, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {77089},
	location = "福州城、衡山城、洛阳城东方姑娘处。",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      2016年2月5日-2016年2月14日，每晚20:00—23:00，前往三大主城的广场宴会区，和众侠士一同享用新春团圆宴,饭饱喝足后，自动获得奖励岁岁平安！",
	AwardType = {1,0,0},
	Award = {
	{icon = 11191 , tip = "经验"},
	},
	ReportTime = true,
	Time =
	{
		Month = {2},
		Day = {5,6,7,8,9,10,11,12,13,14},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2016年2月5日-2016年2月14日",
	Quality = 5,
	CountNum = {Type = 1,ID = 7901},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = true,
}
--春节活动抢头香
Campaign.Config[212] =
{
	ID = {6950},
	Name = "【春节】抢头香",
	Icon = 11708,
	Type = 1,
	Level = {Min = 20, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {77089},
	location = "福州城、衡山城、洛阳城东方姑娘处。",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      2016年2月5日-2016年2月14日，前往至少三座寺庙敬上新年的第一炷香，获取相应数量的“新春福禄”，交给东方姑娘后可获得奖励岁岁平安及锦绣坊印花哦！",
	AwardType = {1,0,0},
	Award = {
	{icon = 11191 , tip = "经验"},
	},
	ReportTime = true,
	Time =
	{
		Month = {2},
		Day = {5,6,7,8,9,10,11,12,13,14},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2016年2月5日-2016年2月14日",
	Quality = 5,
	CountNum = {Type = 1,ID = 7902},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = true,
}
--春节活动上元灯会
Campaign.Config[213] =
{
	ID = {6952},
	Name = "【春节】上元节",
	Icon = 11708,
	Type = 1,
	Level = {Min = 20, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {77089},
	location = "福州城、衡山城、洛阳城东方姑娘处。",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      2016年2月22日-2016年2月29日，前往三大主城的上元灯节街区找灯谜NPC猜灯谜，猜对一个灯谜会获得一个任务物品“灯谜奖励”，获得3个“灯谜奖励”后可完成东方姑娘的任务，获得岁岁平安。",
	AwardType = {1,0,0},
	Award = {
	{icon = 11191 , tip = "经验"},
	},
	ReportTime = true,
	Time =
	{
		Month = {2},
		Day = {22,23,24,25,26,27,28,29},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2016年2月22日-2016年2月29日",
	Quality = 5,
	CountNum = {Type = 1,ID = 7988},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = true,
}

----【心动独孤】新门派直升70级
Campaign.Config[214] =
{
	ID = {8279},
	Name = "【心动独孤】新门派直升70级",
	Icon = 11708,
	Type = 7,
	Level = {Min = 1, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {},
	location = "",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      2015年4月17日-2015年5月17日，活动时间内，85及85以上的角色均可获得一份珍贵的礼物道具“霜天奇罗香”，“霜天奇罗香”只能赠送给同一帐号下任一加入新门派独孤的小号。该小号获得“霜天奇罗香”之后，即可找东方姑娘接取相关任务，享受直升70级的畅爽特权！ ",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},	
	},
	ReportTime = true,
	Time =
	{
		Month = {4},
		Day = {17,18,19,20,21,22,23,24,25,26,27,28,29,30},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2015年4月17日-2015年5月17日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = true,
}
----【心动独孤】新门派直升70级-续
Campaign.Config[215] =
{
	ID = {8279},
	Name = "【心动独孤】新门派直升70级",
	Icon = 11708,
	Type = 7,
	Level = {Min = 1, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {},
	location = "",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      2015年4月17日——2015年5月17日，活动时间内，85及85以上的角色均可获得一份珍贵的礼物道具“霜天奇罗香”，“霜天奇罗香”只能赠送给同一帐号下任一加入新门派独孤的小号。该小号获得“霜天奇罗香”之后，即可找东方姑娘接取相关任务，享受直升70级的畅爽特权！ ",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},	
	},
	ReportTime = true,
	Time =
	{
		Month = {5},
		Day = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2015年4月17日-2015年5月17日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = true,
}
----【心动独孤】每日签到
Campaign.Config[216] =
{
	ID = {8285},
	Name = "【心动独孤】每日签到",
	Icon = 11708,
	Type = 7,
	Level = {Min = 20, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {},
	location = "",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      2015年4月17日-2015年5月17日，活动开启期间，每天至东方姑娘处签到可获得奖励，累计签到7次、14次、21次以及28次还可获得额外的丰厚大奖。 ",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},	
	},
	ReportTime = true,
	Time =
	{
		Month = {4},
		Day = {17,18,19,20,21,22,23,24,25,26,27,28,29,30},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2015年4月17日-2015年5月17日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = true,
}
----【心动独孤】每日签到-续
Campaign.Config[217] =
{
	ID = {8285},
	Name = "【心动独孤】每日签到",
	Icon = 11708,
	Type = 7,
	Level = {Min = 20, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {},
	location = "",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      2015年4月17日-2015年5月17日，活动开启期间，每天至东方姑娘处签到可获得奖励，累计签到7次、14次、21次以及28次还可获得额外的丰厚大奖。 ",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},	
	},
	ReportTime = true,
	Time =
	{
		Month = {5},
		Day = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2015年4月17日-2015年5月17日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = true,
}
----【心动独孤】每日领宝银
Campaign.Config[218] =
{
	ID = {8281},
	Name = "【心动独孤】每日领宝银",
	Icon = 11708,
	Type = 7,
	Level = {Min = 30, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {},
	location = "",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      2015年4月17日-2015年5月17日，活动开启期间，满足条件的玩家均可找东方姑娘领取一份宝银哦。 ",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},	
	},
	ReportTime = true,
	Time =
	{
		Month = {4},
		Day = {17,18,19,20,21,22,23,24,25,26,27,28,29,30},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2015年4月17日-2015年5月17日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = true,
}
----【心动独孤】每日领宝银-续
Campaign.Config[219] =
{
	ID = {8281},
	Name = "【心动独孤】每日领宝银",
	Icon = 11708,
	Type = 7,
	Level = {Min = 30, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {},
	location = "",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      2015年4月17日-2015年5月17日，活动开启期间，满足条件的玩家均可找东方姑娘领取一份宝银哦。 ",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},	
	},
	ReportTime = true,
	Time =
	{
		Month = {5},
		Day = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2015年4月17日-2015年5月17日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = true,
}
----【心动独孤】每日领宝石
Campaign.Config[220] =
{
	ID = {8282},
	Name = "【心动独孤】每日领宝石",
	Icon = 11708,
	Type = 7,
	Level = {Min = 30, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {},
	location = "",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      2015年4月17日-2015年4月20日每晚20：00—22：00，满足条件的玩家均可找东方姑娘领取一份宝石兑换券，凭此券玩家可找东方姑娘领取心动宝石兑换礼盒，使用礼盒可获得各种等级的宝石，至高为六级，最低为宝石碎片。 ",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},	
	},
	ReportTime = true,
	Time =
	{
		Month = {4},
		Day = {17,18,19,20},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2015年4月17日-2015年4月20日每晚20：00—22：00",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = true,
}
----【心动独孤】每日领特效
Campaign.Config[221] =
{
	ID = {8280},
	Name = "【心动独孤】每日领特效",
	Icon = 11708,
	Type = 7,
	Level = {Min = 20, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {},
	location = "",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      2015年4月17日-2015年4月26日，活动开启期间，满足条件的玩家均可找衡山城的柳敬亭接取独孤支线任务，完成任务之后，玩家可以获得丰富的奖励以及华丽的特效。 ",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},	
	},
	ReportTime = true,
	Time =
	{
		Month = {4},
		Day = {17,18,19,20,21,22,23,24,25,26},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2015年4月17日-2015年4月26日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = true,
}
----【缤纷五月】周末橙色镖车
Campaign.Config[222] =
{
	ID = {7528},
	Name = "【缤纷五月】周末橙色镖车",
	Icon = 11708,
	Type = 7,
	Level = {Min = 35, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {},
	location = "",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      2015年5月23日-2015年5月24日,以及2015年5月30日-2015年5月31日，每位玩家可NPC孙镇疆对话，免费获得橙镖令！运送橙色镖车成功，截取橙色镖车成功，所得比普通镖车奖励更为丰厚！ ",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},	
	},
	ReportTime = true,
	Time =
	{
		Month = {5},
		Day = {23,24,30,31},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2015年5月23日-2015年5月24日,以及2015年5月30日-2015年5月31日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = true,
}
----【缤纷五月】周末装备打造
Campaign.Config[223] =
{
	ID = {7605},
	Name = "【缤纷五月】周末装备打造",
	Icon = 11708,
	Type = 7,
	Level = {Min = 20, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {},
	location = "",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      2015年5月23日-2015年5月24日,以及2015年5月30日-2015年5月31日，打造装备成功的几率将大幅度提升。 ",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},	
	},
	ReportTime = true,
	Time =
	{
		Month = {5},
		Day = {23,24,30,31},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2015年5月23日-2015年5月24日,以及2015年5月30日-2015年5月31日期间",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = true,
}
----【缤纷五月】周末全服双倍
Campaign.Config[224] =
{
	ID = {8314},
	Name = "【缤纷五月】周末全服双倍",
	Icon = 11708,
	Type = 7,
	Level = {Min = 1, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {},
	location = "",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      2015年5月23日-2015年5月24日,以及2015年5月30日-2015年5月31日期间晚上18：00-23：00，全服玩家都将获得双倍经验时间。 ",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},	
	},
	ReportTime = true,
	Time =
	{
		Month = {5},
		Day = {23,24,30,31},
		WDay = {7},
		IsRegular = true,
		Segment = {{18,00,300}},
	},
	TimeDesc = "2015年5月23日-2015年5月24日,以及2015年5月30日-2015年5月31日期间晚上18：00-23：00",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = true,
}
----【心动独孤】回归礼包送不停
Campaign.Config[225] =
{
	ID = {8284},
	Name = "【心动独孤】回归礼包送不停",
	Icon = 11708,
	Type = 7,
	Level = {Min = 60, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {},
	location = "",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      还记得当初的峥嵘岁月吗？还记得那个为你出生入死的兄弟吗？还记得那个与你花前月下的ta吗？2015年4月17日——2015年5月17日活动时间内，累计14天、30天以及90天未上线的玩家上线，即可找东方姑娘领取相对应的回归大礼包！ ",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},	
	},
	ReportTime = true,
	Time =
	{
		Month = {4},
		Day = {17,18,19,20,21,22,23,24,25,26,27,28,29,30},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2015年4月17日-2015年5月17日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = true,
}
----【心动独孤】回归礼包送不停-续
Campaign.Config[226] =
{
	ID = {8284},
	Name = "【心动独孤】回归礼包送不停",
	Icon = 11708,
	Type = 7,
	Level = {Min = 60, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {},
	location = "",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      还记得当初的峥嵘岁月吗？还记得那个为你出生入死的兄弟吗？还记得那个与你花前月下的ta吗？2015年4月17日——2015年5月17日活动时间内，累计14天、30天以及90天未上线的玩家上线，即可找东方姑娘领取相对应的回归大礼包！ ",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},	
	},
	ReportTime = true,
	Time =
	{
		Month = {5},
		Day = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2015年4月17日-2015年5月17日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = true,
}
----【心动独孤】商城消费大回馈
Campaign.Config[227] =
{
	ID = {7744},
	Name = "【心动独孤】商城消费大回馈",
	Icon = 11708,
	Type = 7,
	Level = {Min = 1, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {},
	location = "",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      2015年4月18日-2015年4月30日，活动时间内，只要您在商城内进行第一次消费，即可获得丰富的奖励。 ",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},	
	},
	ReportTime = true,
	Time =
	{
		Month = {4},
		Day = {18,19,20,21,22,23,24,25,26,27,28,29,30},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2015年4月18日-2015年4月30日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = true,
}
-]]
----力挽狂沙
Campaign.Config[228] =
{
	ID = {8363},
	Name = "【活動】力挽狂沙",
	Icon = 11708,
	Type = 2,
	Level = {Min = 80, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {89848},
	location = "洛陽城 刑毅淘",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       活動時間：每週六、周日 12：00-24：00。\r      漠北之地，黃沙漫漫，隱世村寨陷入太昊之爭。江湖叵測，人心難料，師出名門亦有亂世之心。傳聞臥龍寨將有太昊神器現世，引來一批強盜前來搶奪，在寨中殘害居民。江湖各派前來相救，不料這批賊人並非烏合之眾，有正派之人暗中支持。",
	AwardType = {1,0,0},
	Award = {
	{icon = 3395 , tip = "稀有神器升級材料"},
	},
	ReportTime = true,
	Time =
	{
		Month = {0},
		Day = {0},
		WDay = {6,0},
		IsRegular = true,
		Segment = {{12,00,720}},
	},
	TimeDesc = "每週六、周日 12：00-24：00",
	Quality = 56,
	CountNum = {Type = 1,ID = 9216},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = true,
}
----【活动】千秋美酒
Campaign.Config[229] =
{
	ID = {8364},
	Name = "【活動】千秋美酒",
	Icon = 11708,
	Type = 2,
	Level = {Min = 30, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {89854},
	location = "洛陽城 祖千秋",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       活動時間：每週五 21：00-23：00。\r      祖千秋委託各位俠士幫助釀造各種美酒。按照祖千秋的要求收集水果、糧食、毒蟲、泉水四種材料，並守護材料不被偷走，即可釀出美酒。當商人出發離開小鎮時，俠士們要保護他們不被搶劫。最終根據釀造的酒的品質和保護商人的成果，以及完成活動的時間，可獲得對應的獎勵。",
	AwardType = {1,0,0},
	Award = {
	{icon = 11191 , tip = "海量經驗"},
        {icon = 18156 , tip = "大禮包，內容豐富哦"},
	},
	ReportTime = true,
	Time =
	{
		Month = {0},
		Day = {0},
		WDay = {5},
		IsRegular = true,
		Segment = {{21,00,120}},
	},
	TimeDesc = "每五 21：00～23：00",
	Quality = 61,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = true,
}

--[[
--货殖活动
Campaign.Config[231] =
{
	ID = {8274},
	Name = "【每日】货殖八方",
	Icon = 11708,
	Type = 6,
	Level = {Min = 1, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {},
	location = "",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       每日中午12:30~13:30，领取帮派特产，向其他帮派销售，让货殖之事遍及天下。\r       相关规则：活动开始后首先要向本帮账房先生申领特产，然后到指定的特产供应商那里领取特产，最后寻找下游帮派的特产收购商出售。山寨->工坊->镖局->山寨，关系链中每一个帮派，都是它前面帮派的下游。",
	AwardType = {1,0,0},
	Award = {
	{icon = 2230 , tip = "珍贵道具"},
	{icon = 11191 , tip = "大量经验"},
	},
	ReportTime = true,
	Time =
	{
		Month = {0},
		Day = {0},
		WDay = {7},
		IsRegular = false,
		Segment = {{12,30,60}},
	},
	TimeDesc = "每日中午12:30~13:30",
	Quality = 5,
	CountNum = {Type = 8,ID = 8273},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = false,
}

--货殖预告
Campaign.Config[232] =
{
	ID = {8275},
	Name = "货殖预告",
	Icon = 11708,
	Type = 6,
	Level = {Min = 1, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {},
	location = "",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       预告次日活动中各帮出产物",
	AwardType = {1,0,0},
	Award = {
	{icon = 2230 , tip = "珍贵道具"},
	{icon = 11191 , tip = "大量经验"},
	},
	ReportTime = false,
	Time =
	{
		Month = {0},
		Day = {0},
		WDay = {7},
		IsRegular = false,
		Segment = {{14,0,5}},
	},
	TimeDesc = "",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = false,
	Display = false
}

----【心动独孤】每日领取高级炼化石
Campaign.Config[233] =
{
	ID = {8372},
	Name = "【心动独孤】每日领取高级炼化石",
	Icon = 11708,
	Type = 7,
	Level = {Min = 50, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {77089},
	location = "福州城、衡山城、洛阳城 东方姑娘",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      2015年4月29日-2015年5月5日活动时间内，满足活动条件的玩家，每日可找东方姑娘领取300个高级炼化石！时间有限，千万不要错过哦~！ ",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},	
	},
	ReportTime = true,
	Time =
	{
		Month = {4},
		Day = {29,30},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2015年4月29日-2015年5月5日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = true,
}
----【心动独孤】每日领取高级炼化石
Campaign.Config[234] =
{
	ID = {8372},
	Name = "【心动独孤】每日领取高级炼化石",
	Icon = 11708,
	Type = 7,
	Level = {Min = 50, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {77089},
	location = "福州城、衡山城、洛阳城 东方姑娘",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      2015年4月29日-2015年5月5日活动时间内，满足活动条件的玩家，每日可找东方姑娘领取300个高级炼化石！时间有限，千万不要错过哦~！ ",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},	
	},
	ReportTime = true,
	Time =
	{
		Month = {5},
		Day = {1,2,3,4,5},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2015年4月29日-2015年5月5日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = true,
}
----【心动独孤】领取结晶礼盒
Campaign.Config[235] =
{
	ID = {8382},
	Name = "【心动独孤】领取结晶礼盒",
	Icon = 11708,
	Type = 7,
	Level = {Min = 70, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {77089},
	location = "福州城、衡山城、洛阳城 东方姑娘",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      2015年4月29日-2015年5月1日活动时间内，满足活动条件的玩家可找东方姑娘领取一个结晶礼盒！开启礼盒之后，玩家可以获得丰富的熔炼结晶，炉鼎品阶越高，开启礼盒之后获得的结晶越丰富。每位玩家只能领取一次哦。 ",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},	
	},
	ReportTime = true,
	Time =
	{
		Month = {4},
		Day = {29,30},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2015年4月29日-2015年5月1日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = true,
}
----【心动独孤】领取结晶礼盒-续
Campaign.Config[236] =
{
	ID = {8382},
	Name = "【心动独孤】领取结晶礼盒",
	Icon = 11708,
	Type = 7,
	Level = {Min = 70, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {77089},
	location = "福州城、衡山城、洛阳城 东方姑娘",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      2015年4月29日-2015年5月1日活动时间内，满足活动条件的玩家可找东方姑娘领取一个结晶礼盒！开启礼盒之后，玩家可以获得丰富的熔炼结晶，炉鼎品阶越高，开启礼盒之后获得的结晶越丰富。每位玩家只能领取一次哦。 ",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},	
	},
	ReportTime = true,
	Time =
	{
		Month = {5},
		Day = {1},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2015年4月29日-2015年5月1日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = true,
}
----【心动独孤】在线领宝石
Campaign.Config[237] =
{
	ID = {8373},
	Name = "【心动独孤】在线领宝石",
	Icon = 11708,
	Type = 7,
	Level = {Min = 1, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {},
	location = "",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      2015年4月29日-2015年5月8日活动时间内，玩家累计在线时长超过一定时长，即可获得相应数量的宝石碎片及双倍经验丹，在线时间越长，奖励越丰富。 ",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},	
	},
	ReportTime = true,
	Time =
	{
		Month = {4},
		Day = {29,30},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2015年4月29日-2015年5月8日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = true,
}
----【心动独孤】在线领宝石-续
Campaign.Config[238] =
{
	ID = {8373},
	Name = "【心动独孤】在线领宝石",
	Icon = 11708,
	Type = 7,
	Level = {Min = 1, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {},
	location = "",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      2015年4月29日-2015年5月8日活动时间内，玩家累计在线时长超过一定时长，即可获得相应数量的宝石碎片及双倍经验丹，在线时间越长，奖励越丰富。 ",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},	
	},
	ReportTime = true,
	Time =
	{
		Month = {5},
		Day = {1,2,3,4,5,6,7,8},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2015年4月29日-2015年5月8日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = true,
}
----【缤纷五月】天降幸运星
Campaign.Config[239] =
{
	ID = {8385},
	Name = "【缤纷五月】天降幸运星",
	Icon = 11708,
	Type = 7,
	Level = {Min = 1, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {77089},
	location = "福州城、衡山城、洛阳城 东方姑娘",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      2015年5月27日-2015年6月1日活动时间内，玩家每天上线即可找东方姑娘领取【天降幸运星】系列任务，累计时长分别达到30分钟，60分钟，120分钟，240分钟，360分钟，480分钟，720分钟，900分钟（之后不再累计），可获得1个幸运星（每天最多获得8颗幸运星）。使用幸运星，可以随机获得绝学，宝石，银两等等珍贵礼物哦。 ",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},	
	},
	ReportTime = true,
	Time =
	{
		Month = {5},
		Day = {27,28,29,30,31},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2015年5月27日-2015年6月1日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = true,
}
----【缤纷五月】天降幸运星-续
Campaign.Config[240] =
{
	ID = {8385},
	Name = "【缤纷五月】天降幸运星",
	Icon = 11708,
	Type = 7,
	Level = {Min = 1, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {77089},
	location = "福州城、衡山城、洛阳城 东方姑娘",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      2015年5月27日-2015年6月1日活动时间内，玩家每天上线即可找东方姑娘领取【天降幸运星】系列任务，累计时长分别达到30分钟，60分钟，120分钟，240分钟，360分钟，480分钟，720分钟，900分钟（之后不再累计），可获得1个幸运星（每天最多获得8颗幸运星）。使用幸运星，可以随机获得绝学，宝石，银两等等珍贵礼物哦。 ",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},	
	},
	ReportTime = true,
	Time =
	{
		Month = {6},
		Day = {1},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2015年5月27日-2015年6月1日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = true,
}
----【周年庆】每日领取活力药
Campaign.Config[241] =
{
	ID = {8419},
	Name = "【周年庆】每日领取活力药",
	Icon = 11708,
	Type = 7,
	Level = {Min = 1, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {77089},
	location = "福州城、衡山城、洛阳城 东方姑娘",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      6月24日—7月1日每天18:00-22:00，活动时间内可找东方姑娘领取任务，领取任务后只要累计在线1小时，即可获得2个活力药（包含活力50点） ",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},	
	},
	ReportTime = true,
	Time =
	{
		Month = {6},
		Day = {24,25,26,27,28,29,30},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2015年6月24日-2015年7月1日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = true,
}
----【周年庆】每日领取活力药-续
Campaign.Config[242] =
{
	ID = {8419},
	Name = "【周年庆】每日领取活力药",
	Icon = 11708,
	Type = 7,
	Level = {Min = 1, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {77089},
	location = "福州城、衡山城、洛阳城 东方姑娘",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      6月24日—7月1日每天18:00-22:00，活动时间内可找东方姑娘领取任务，领取任务后只要累计在线1小时，即可获得2个活力药（包含活力50点） ",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},	
	},
	ReportTime = true,
	Time =
	{
		Month = {7},
		Day = {1},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2015年6月24日-2015年7月1日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = true,
}
----【周年庆】每日领取琉璃材料
Campaign.Config[243] =
{
	ID = {8420},
	Name = "【周年庆】每日领取琉璃材料",
	Icon = 11708,
	Type = 7,
	Level = {Min = 60, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {77089},
	location = "福州城、衡山城、洛阳城 东方姑娘",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      2015年6月26日-2015年7月5日活动时间内，每日活跃度达到一定阶段，可以找东方姑娘额外领取6.28周年庆感恩奖励。活跃度达到35，获得绑银10D；活跃度达到50，获得琉璃护符材料一套；活跃度达到70，获得琉璃戒指材料两套；满足活跃度70后，还将额外获得星辰砂礼包（可以开出随机数量的星辰砂）一份哦！ ",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},	
	},
	ReportTime = true,
	Time =
	{
		Month = {6},
		Day = {26,27,28,29,30},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2015年6月26日-2015年7月5日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = true,
}
----【周年庆】每日领取琉璃材料-续
Campaign.Config[244] =
{
	ID = {8420},
	Name = "【周年庆】每日领取琉璃材料",
	Icon = 11708,
	Type = 7,
	Level = {Min = 60, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {77089},
	location = "福州城、衡山城、洛阳城 东方姑娘",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      2015年6月26日-2015年7月5日活动时间内，每日活跃度达到一定阶段，可以找东方姑娘额外领取6.28周年庆感恩奖励。活跃度达到35，获得绑银10D；活跃度达到50，获得琉璃护符材料一套；活跃度达到70，获得琉璃戒指材料两套；满足活跃度70后，还将额外获得星辰砂礼包（可以开出随机数量的星辰砂）一份哦！ ",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},	
	},
	ReportTime = true,
	Time =
	{
		Month = {7},
		Day = {1,2,3,4,5},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2015年6月26日-2015年7月5日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = true,
}
----【周年庆】每日领取手工材料
Campaign.Config[245] =
{
	ID = {8421},
	Name = "【周年庆】每日领取手工材料",
	Icon = 11708,
	Type = 7,
	Level = {Min = 70, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {},
	location = "",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      2015年7月6日—2015年7月23日活动时间内，玩家每日活跃度达到一定阶段，可以找东方姑娘额外领取6.28周年庆感恩奖励。活跃度达到35，获得绑银10D；活跃度达到50，获得手工套装材料礼包一份，可开出对应等级的手工装备材料一套；活跃度70，获得“装备材料”大礼包，随机获得对应等级的手工装备材料两套；满足活跃度70后，还将额外获得装备精华礼包一份，可以开出随机数量的装备精华（此装备精华只能用于升级炉鼎）。 ",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},	
	},
	ReportTime = true,
	Time =
	{
		Month = {7},
		Day = {6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2015年7月6日—2015年7月23日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = true,
}
----【周年庆】每日领取木质齿轮
Campaign.Config[246] =
{
	ID = {8422},
	Name = "【周年庆】每日领取木质齿轮",
	Icon = 11708,
	Type = 7,
	Level = {Min = 30, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {},
	location = "",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      2015年7月24日—2015年7月31日活动时间内，玩家上线后即可找东方姑娘领取一定数量的木质齿轮。 ",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},	
	},
	ReportTime = true,
	Time =
	{
		Month = {7},
		Day = {24,25,26,27,28,29,30,31},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2015年7月24日—2015年7月31日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = true,
}
----【周年庆】在线领宝石
Campaign.Config[247] =
{
	ID = {8423},
	Name = "【周年庆】在线领宝石",
	Icon = 11708,
	Type = 7,
	Level = {Min = 1, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {},
	location = "",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      2015年6月27日-2015年7月8日活动时间内，玩家累计在线时长超过一定时长，即可获得相应数量的宝石碎片及双倍经验丹，在线时间越长，奖励越丰富。 ",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},	
	},
	ReportTime = true,
	Time =
	{
		Month = {6},
		Day = {27,28,29,30},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2015年6月27日-2015年7月8日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = true,
}
----【周年庆】在线领宝石-续
Campaign.Config[248] =
{
	ID = {8423},
	Name = "【周年庆】在线领宝石",
	Icon = 11708,
	Type = 7,
	Level = {Min = 1, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {},
	location = "",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      2015年6月27日-2015年7月8日活动时间内，玩家累计在线时长超过一定时长，即可获得相应数量的宝石碎片及双倍经验丹，在线时间越长，奖励越丰富。 ",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},	
	},
	ReportTime = true,
	Time =
	{
		Month = {7},
		Day = {1,2,3,4,5,6,7,8},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2015年6月27日-2015年7月8日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = true,
}
----【周年庆】每日签到
Campaign.Config[249] =
{
	ID = {8424},
	Name = "【周年庆】每日签到",
	Icon = 11708,
	Type = 7,
	Level = {Min = 20, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {},
	location = "",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      2015年6月17日-2015年7月20日，活动开启期间，每天至东方姑娘处签到可获得奖励，累计签到7次、14次、21次以及28次还可获得额外的丰厚大奖。 ",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},	
	},
	ReportTime = true,
	Time =
	{
		Month = {6},
		Day = {17,18,19,20,21,22,23,24,25,26,27,28,29,30},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2015年6月17日-2015年7月20日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = true,
}
----【周年庆】每日签到-续
Campaign.Config[250] =
{
	ID = {8424},
	Name = "【周年庆】每日签到",
	Icon = 11708,
	Type = 7,
	Level = {Min = 20, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {},
	location = "",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      2015年6月17日-2015年7月20日，活动开启期间，每天至东方姑娘处签到可获得奖励，累计签到7次、14次、21次以及28次还可获得额外的丰厚大奖。 ",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},	
	},
	ReportTime = true,
	Time =
	{
		Month = {7},
		Day = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2015年6月17日-2015年7月20日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = true,
}
----【周年庆】全服双倍
Campaign.Config[251] =
{
	ID = {8436},
	Name = "【周年庆】全服双倍",
	Icon = 11708,
	Type = 7,
	Level = {Min = 1, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {},
	location = "",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      2015年6月27日——2015年7月5日期间，每晚18：00-23：00，全服玩家都将获得双倍经验时间。 ",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},	
	},
	ReportTime = true,
	Time =
	{
		Month = {6},
		Day = {27,28,29,30},
		WDay = {7},
		IsRegular = true,
		Segment = {{18,00,300}},
	},
	TimeDesc = "2015年6月27日——2015年7月5日期间，每晚18：00-23：00",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = true,
}
----【周年庆】全服双倍-续
Campaign.Config[252] =
{
	ID = {8436},
	Name = "【周年庆】全服双倍",
	Icon = 11708,
	Type = 7,
	Level = {Min = 1, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {},
	location = "",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      2015年6月27日——2015年7月5日期间，每晚18：00-23：00，全服玩家都将获得双倍经验时间。 ",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},	
	},
	ReportTime = true,
	Time =
	{
		Month = {7},
		Day = {1,2,3,4,5},
		WDay = {7},
		IsRegular = true,
		Segment = {{18,00,300}},
	},
	TimeDesc = "2015年6月27日——2015年7月5日期间，每晚18：00-23：00",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = true,
}
----【八月活动】经验爽一夏
Campaign.Config[253] =
{
	ID = {8456},
	Name = "【浪漫七夕】活跃度奖励",
	Icon = 11708,
	Type = 7,
	Level = {Min = 50, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {77088},
	location = "洛阳城 东方姑娘",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      2015年8月19日-2015年8月29日每日19：00至22：00开启，活动开启期间，活跃度达到50的玩家可至洛阳东方姑娘处领取奖励朱雀令，朱雀令可于东方姑娘处换取丰厚奖励。 友情提示：朱雀令每人每天只能领一个，要慎重使用哦～",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},	
	},
	ReportTime = true,
	Time =
	{
		Month = {8},
		Day = {19,20,21,22,23,24,25,26,27,28,29},
		WDay = {7},
		IsRegular = true,
		Segment = {{19,00,180}},
	},
	TimeDesc = "2015年8月19日-2015年8月29日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = true,
}
----【八月活动】装备制造“翻”一夏
Campaign.Config[254] =
{
	ID = {8457},
	Name = "【浪漫七夕】装备制造翻一夏",
	Icon = 11708,
	Type = 7,
	Level = {Min = 1, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {},
	location = "",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      2015年7月29日-2015年8月29日，逢周末（周六日均含），活动开启期间，装备打造成功几率提升。 ",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},	
	},
	ReportTime = true,
	Time =
	{
		Month = {8},
		Day = {1,2,8,9,15,16,22,23,29},
		WDay = {7},
		IsRegular = true,
		Segment = {{0,00,1440}},
	},
	TimeDesc = "2015年7月29日-2015年8月29日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = true,
}
----【浪漫七夕】玫瑰绽放
Campaign.Config[255] =
{
	ID = {8464},
	Name = "【浪漫七夕】玫瑰绽放",
	Icon = 11708,
	Type = 7,
	Level = {Min = 1, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {},
	location = "",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      2015年8月19日~2015年8月25日，活动期间冲进情圣榜以及花魁榜的300名玩家，都将在活动结束后获得相应的绝版称号！排名前五的玩家，还将分别获得对应排名的奖励礼包！快对亲爱的ta使用玫瑰，享受浪漫的二人世界吧!\r    情圣榜与花魁榜奖励统一从8月25日0点10分开始发奖，获奖的玩家打开游戏界面右下角的排行榜，即可在情圣榜或花魁榜下方点击按钮领取奖励。玩家需要在2015年8月31日之前领取相应奖励，否则会与大奖失之交臂哦~！ ",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},	
	},
	ReportTime = true,
	Time =
	{
		Month = {8},
		Day = {19,20,21,22,23,24,25},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2015年8月19日-2015年8月25日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = true,
}

----【浪漫七夕】保卫姻缘树
Campaign.Config[256] =
{
	ID = {8461},
	Name = "【浪漫七夕】保卫姻缘树",
	Icon = 11708,
	Type = 7,
	Level = {Min = 30, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {90546},
	location = "洛阳城 红娘",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      2016年8月9日—2015年8月16日，满足条件的玩家可找红娘（洛阳城东方姑娘旁边）领取姻缘树种子，并找到有缘人一起进入副本将种子种下。姻缘树极其珍贵，种下之后肯定会有很多毒虫与宵小来偷取，与有缘人一起保护好姻缘树，直到它长大。姻缘树长大之后，就可以采集姻缘果啦，使用姻缘果后，可以获得丰厚的奖励哦。 ",
	AwardType = {1,0,0},
	Award = {
	{icon = 11191 , tip = "海量经验"},
	{icon = 12384 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {8},
		Day = {9,10,11,12,13,14,15,16},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2016年8月9日-2016年8月16日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = true,
}

----【浪漫七夕】每日签到
Campaign.Config[257] =
{
	ID = {8462},
	Name = "【浪漫七夕】每日签到",
	Icon = 11708,
	Type = 7,
	Level = {Min = 20, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {77089},
	location = "福州城、衡山城、洛阳城 东方姑娘",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      2015年8月19日—2015年9月23日，每日上线即可找东方姑娘签到。每次签到都可以获得一定数量的奖励，越往后奖励越丰富哦！领奖前请预留1个包裹空位，并确认已接任务未满。 ",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},	
	},
	ReportTime = true,
	Time =
	{
		Month = {8},
		Day = {19,20,21,22,23,24,25,26,27,28,29,30,31},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2015年8月19日-2015年9月23日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = true,
}
----【浪漫七夕】每日签到-续
Campaign.Config[258] =
{
	ID = {8462},
	Name = "【浪漫七夕】每日签到",
	Icon = 11708,
	Type = 7,
	Level = {Min = 20, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {77089},
	location = "福州城、衡山城、洛阳城 东方姑娘",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      2015年8月19日—2015年9月23日，每日上线即可找东方姑娘签到。每次签到都可以获得一定数量的奖励，越往后奖励越丰富哦！领奖前请预留1个包裹空位，并确认已接任务未满。 ",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},	
	},
	ReportTime = true,
	Time =
	{
		Month = {9},
		Day = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2015年8月19日-2015年9月23日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = true,
}
----【浪漫七夕】青龙令兑换
Campaign.Config[259] =
{
	ID = {8468},
	Name = "【浪漫七夕】青龙令兑换",
	Icon = 11708,
	Type = 7,
	Level = {Min = 1, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {90614},
	location = "衡山城 青龙使者",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      活跃度达到70的玩家，可找衡山城青龙使者（东方姑娘旁边）兑换琉璃材料或者手工材料。（不受活动时间限制，可一直领取）\r    此外，2015年8月19日—2015年9月19日期间，集齐7枚青龙令的玩家，还可找青龙使者兑换活跃用户奖励！（2015年9月19日之后不能再进行兑换） ",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "琉璃材料礼包及手工材料礼包"},	
	},
	ReportTime = true,
	Time =
	{
		Month = {8},
		Day = {19,20,21,22,23,24,25,26,27,28,29,30,31},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2015年8月19日-2015年9月19日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = true,
}
----【浪漫七夕】青龙令兑换-续
Campaign.Config[260] =
{
	ID = {8468},
	Name = "【浪漫七夕】青龙令兑换",
	Icon = 11708,
	Type = 7,
	Level = {Min = 1, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {90614},
	location = "衡山城 青龙使者",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      活跃度达到70的玩家，可找衡山城青龙使者（东方姑娘旁边）兑换琉璃材料或者手工材料。（不受活动时间限制，可一直领取）\r    此外，2015年8月19日—2015年9月19日期间，集齐7枚青龙令的玩家，还可找青龙使者兑换活跃用户奖励！（2015年9月19日之后不能再进行兑换） ",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "琉璃材料礼包及手工材料礼包"},	
	},
	ReportTime = true,
	Time =
	{
		Month = {9},
		Day = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2015年8月19日-2015年9月19日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = true,
}
----【浪漫七夕】老玩家回归有奖
Campaign.Config[261] =
{
	ID = {8463},
	Name = "【浪漫七夕】老玩家回归有奖",
	Icon = 11708,
	Type = 7,
	Level = {Min = 60, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {77089},
	location = "福州城、衡山城、洛阳城 东方姑娘",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      2015年8月19日—2015年9月1日期间，累计30天、60天以及90天未上线的玩家上线，即可找东方姑娘领取相对应的回归大礼包！ ",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},	
	},
	ReportTime = true,
	Time =
	{
		Month = {8},
		Day = {19,20,21,22,23,24,25,26,27,28,29,30,31},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2015年8月19日-2015年9月1日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = true,
}
----【浪漫七夕】老玩家回归有奖-续
Campaign.Config[262] =
{
	ID = {8463},
	Name = "【浪漫七夕】老玩家回归有奖",
	Icon = 11708,
	Type = 7,
	Level = {Min = 60, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {77089},
	location = "福州城、衡山城、洛阳城 东方姑娘",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      2015年8月19日—2015年9月1日期间，累计30天、60天以及90天未上线的玩家上线，即可找东方姑娘领取相对应的回归大礼包！ ",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},	
	},
	ReportTime = true,
	Time =
	{
		Month = {9},
		Day = {1},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2015年8月19日-2015年9月1日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = true,
}
----【浪漫七夕】采花大盗
Campaign.Config[263] =
{
	ID = {8460},
	Name = "【每日】采花大盗",
	Icon = 11708,
	Type = 1,
	Level = {Min = 60, Max = 0},
	PlayerNum = {Min = 2, Max = 0},
	DelvNpc = {84982},
	location = "洛阳城 冀飞虎",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      每天12：00——14：00，20：00——22：00，满足条件的玩家找洛阳城冀飞虎接取除恶任务，获得除恶令之后2人以上组队前往剑阁找到采花大盗孟波波，并进入副本杀掉他。\r    完成副本之后可获得不亚于绿竹活动的经验奖励！同时还有机会获得星尘砂、“侠”字令牌、“义”字令牌等。每集齐一套“侠”“义”，可找冀飞虎兑换额外的经验奖励以及彩票礼包。 ",
	AwardType = {1,0,0},
	Award = {
	{icon = 11191 , tip = "海量经验"},
	{icon = 12384 , tip = "星尘砂"},
	},
	ReportTime = true,
	Time =
	{
		Month = {0},
		Day = {0},
		WDay = {7},
		IsRegular = false,
		Segment = {{12,0,120},{20,00,120}},
	},
	TimeDesc = "每天12：00-13：59、19：00-20：59",
	Quality = 2,
	CountNum = {Type = 0,ID = 8445},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = true,
}

----【双节狂欢】烟火大会
Campaign.Config[267] =
{
	ID = {8564},
	Name = "【双节狂欢】烟火大会",
	Icon = 11708,
	Type = 7,
	Level = {Min = 20, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {88325},
	location = "洛阳城 烟景风华",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      2015年9月27日-2015年10月10日，洛阳城中秋烟火大会开始啦！活动开启期间，玩家燃放烟花可获得喜悦度，凭借喜悦度可在洛阳城烟景风华处领取奖励！同时，洛阳城倾世也为情圣和花魁们准备了礼物！活动开启期间，赠送玫瑰可获得情圣值，收到玫瑰可获得花魁值，凭情圣值和花魁值可于洛阳城倾世处换取惊喜奖励。 ",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141, tip = "丰厚奖励"},	
	},
	ReportTime = true,
	Time =
	{
		Month = {9},
		Day = {27,28,29,30,31},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2015年9月27日-2015年10月10日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = true,
}
----【双节狂欢】烟火大会-续
Campaign.Config[268] =
{
	ID = {8564},
	Name = "【双节狂欢】烟火大会",
	Icon = 11708,
	Type = 7,
	Level = {Min = 20, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {88325},
	location = "洛阳城 烟景风华",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      2015年9月27日-2015年10月10日，洛阳城中秋烟火大会开始啦！活动开启期间，玩家燃放烟花可获得喜悦度，凭借喜悦度可在洛阳城烟景风华处领取奖励！喜悦度达到10000点和100000点的玩家还可获得绝版“烟火大会优胜”及“烟火大会王者”称号！同时，洛阳城倾世也为情圣和花魁们准备了礼物！活动开启期间，赠送玫瑰可获得情圣值，收到玫瑰可获得花魁值，凭情圣值和花魁值可于洛阳城倾世处换取惊喜奖励。 ",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141, tip = "丰厚奖励"},	
	},
	ReportTime = true,
	Time =
	{
		Month = {10},
		Day = {1,2,3,4,5,6,7,8,9,10},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2015年9月27日-2015年10月10日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = true,
}
----【双节狂欢】琉璃图纸，再现中原
Campaign.Config[269] =
{
	ID = {8563},
	Name = "【双节狂欢】图纸谜踪",
	Icon = 11708,
	Type = 7,
	Level = {Min = 20, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {91100},
	location = "洛阳城 仪琳",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      与恒山灭门有巨大关联的武器图纸残卷的消息突然又开始在江湖上流传了，路过洛阳的仪琳非常担心！赶紧去福州郊外帮仪琳寻找武器图纸残卷，揭露当年那些尘封的秘密！2015年10月1日-2015年10月10日，活动开启期间，整点福州郊外的气象将会改变，一些不为人知的隐秘地点将显露出来，并存在十分钟，听说找到它们的人将会有神秘发现！友情提示：前往探查前请确保包裹至少留有5个空位！ ",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141, tip = "丰厚奖励"},	
	},
	ReportTime = true,
	Time =
	{
		Month = {10},
		Day = {1,2,3,4,5,6,7,8,9,10},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2015年10月1日-2015年10月10日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = true,
}
----【双节狂欢】迎中秋寻月饼
Campaign.Config[270] =
{
	ID = {8495},
	Name = "【双节狂欢】迎中秋寻月饼",
	Icon = 11708,
	Type = 7,
	Level = {Min = 30, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {90717},
	location = "洛阳城 中秋玉兔",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      2015年9月27日-2015年10月10日，每天20:00至21:00，活动开启期间，玩家可前往洛阳城活动NPC“中秋玉兔”处领取活动任务，完成后可获得丰厚奖励。 ",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},	
	},
	ReportTime = true,
	Time =
	{
		Month = {9},
		Day = {27,28,29,30},
		WDay = {7},
		IsRegular = true,
		Segment = {{0,00,1440}},
	},
	TimeDesc = "2015年9月27日-2015年10月10日,每天20:00至21:00",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = true,
}
----【双节狂欢】迎中秋寻月饼（续）
Campaign.Config[271] =
{
	ID = {8495},
	Name = "【双节狂欢】迎中秋寻月饼",
	Icon = 11708,
	Type = 7,
	Level = {Min = 30, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {90717},
	location = "洛阳城 中秋玉兔",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      2015年9月27日-2015年10月10日，每天20:00至21:00，活动开启期间，玩家可前往洛阳城活动NPC“中秋玉兔”处领取活动任务，完成后可获得丰厚奖励。 ",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},	
	},
	ReportTime = true,
	Time =
	{
		Month = {10},
		Day = {1,2,3,4,5,6,7,8,9,10},
		WDay = {7},
		IsRegular = true,
		Segment = {{0,00,1440}},
	},
	TimeDesc = "2015年9月27日-2015年10月10日,每天20:00至21:00",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = true,
}
----【双节狂欢】归家之路
Campaign.Config[272] =
{
	ID = {8554},
	Name = "【双节狂欢】归家之路",
	Icon = 11708,
	Type = 7,
	Level = {Min = 30, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {91100},
	location = "洛阳城 仪琳",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      2015年9月27日-2015年10月10日，每日20:00至21:00，活动开启期间，大于等于30级的玩家可在洛阳城活动NPC“仪琳”活动任务“迷失的弟子”，野外地图：福州郊外、衡山郊外、武当山、华山、药王谷、少室山、朱仙镇、五霸岗中将刷新NPC“恒山派迷路弟子”，该NPC分两种，分别可以兑换两种不同的物资————“布匹”和“粮米”，每个地图只会出现其中一种。玩家在活动开启时间内找到NPC兑换齐两种物资后交给“仪琳”即可完成任务。\r      恒山派即将归来，门派隐去后散布流离在江湖各地的恒山派弟子也都赶回来协助重建门派，其中不乏很多年轻的弟子。他们回门派后都按照门派分配的工作下山采购物资，可是多年未归恒山，对路途不熟，在各地迷了路。仪琳把恒山派信物交给你，让你快去各地找到迷路的年轻弟子，以信物为证带回物资，以防嵩山派插手从中作梗。 ",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141, tip = "丰厚奖励"},	
	},
	ReportTime = true,
	Time =
	{
		Month = {9},
		Day = {27,28,29,30},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2015年9月27日-2015年10月10日，每天20:00至21:00",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = true,
}
----【双节狂欢】归家之路（续）
Campaign.Config[273] =
{
	ID = {8554},
	Name = "【双节狂欢】归家之路",
	Icon = 11708,
	Type = 7,
	Level = {Min = 30, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {91100},
	location = "洛阳城 仪琳",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      2015年9月27日-2015年10月10日，每日20:00至21:00，活动开启期间，大于等于30级的玩家可在洛阳城活动NPC“仪琳”活动任务“迷失的弟子”，野外地图：福州郊外、衡山郊外、武当山、华山、药王谷、少室山、朱仙镇、五霸岗中将刷新NPC“恒山派迷路弟子”，该NPC分两种，分别可以兑换两种不同的物资————“布匹”和“粮米”，每个地图只会出现其中一种。玩家在活动开启时间内找到NPC兑换齐两种物资后交给“仪琳”即可完成任务。\r      恒山派即将归来，门派隐去后散布流离在江湖各地的恒山派弟子也都赶回来协助重建门派，其中不乏很多年轻的弟子。他们回门派后都按照门派分配的工作下山采购物资，可是多年未归恒山，对路途不熟，在各地迷了路。仪琳把恒山派信物交给你，让你快去各地找到迷路的年轻弟子，以信物为证带回物资，以防嵩山派插手从中作梗。 ",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141, tip = "丰厚奖励"},	
	},
	ReportTime = true,
	Time =
	{
		Month = {10},
		Day = {1,2,3,4,5,6,7,8,9,10},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2015年9月27日-2015年10月10日，每天20:00至21:00",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = true,
}
----【双节狂欢】除恶五霸岗
Campaign.Config[274] =
{
	ID = {8545},
	Name = "【双节狂欢】除恶五霸岗",
	Icon = 11708,
	Type = 7,
	Level = {Min = 30, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {},
	location = "",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      2015年10月1日-2015年10月8日，活动开启期间，每日20:00至24:00，五霸岗（坐标433,335）将刷新世界BOSS“欧炼子”，等级大于等于30级的玩家皆可前往参与击杀，参与击杀的玩家将获得BOSS掉落的丰厚活动奖励！据说，击杀BOSS后还会出现额外的隐藏任务哦~（PS：隐藏任务的开启只持续30分钟，各位英雄请注意时间哦~）\r      国庆大喜，普天同庆，但就在这个大好日子里，潜伏在嵩山剑派的卧底探子得到可靠消息，称有一名为欧炼子的人一直在隐秘地为嵩山剑派铸剑，残害生灵，助纣为虐，十恶不赦！据悉，此人乃是春秋战国时期著名铸剑大师欧冶子的后人，江湖传言其为嵩山派炼剑敛财无数，甚至可能还珍藏有其先祖所铸的前朝宝剑，龙渊、湛卢和鱼肠！此次，江湖众人设计在五霸岗引他出山。到时，众英雄会尽数聚集五霸岗截杀恶人欧炼子，夺其珍宝，也为武林除害。",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},	
	},
	ReportTime = true,
	Time =
	{
		Month = {10},
		Day = {1,2,3,4,5,6,7,8},
		WDay = {7},
		IsRegular = true,
		Segment = {{0,00,1440}},
	},
	TimeDesc = "2015年10月1日-2015年10月8日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = true,
}


----【双节狂欢】月宫迷城
Campaign.Config[275] =
{
	ID = {8559},
	Name = "【双节狂欢】月宫迷城",
	Icon = 11708,
	Type = 7,
	Level = {Min = 30, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {84982},
	location = "洛阳城 冀飞虎",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      蒙古草原中部传来轰隆一声响，经斥候禀报，一似幻似真海市蜃楼凭空出现，都传是九天之上的月宫降临人间！2016年9月14日——2016年9月20日活动期间，找洛阳城冀飞虎领取任务后，可三人以上组队进入副本“月宫迷城”，挑战成功后可获得丰厚大奖！ ",
	AwardType = {1,0,0},
	Award = {
	{icon = 11191 , tip = "海量经验"},
	{icon = 9141 , tip = "其他丰厚大奖"},
	},
	ReportTime = true,
	Time =
	{
		Month = {9},
		Day = {14,15,16,17,18,19,20},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2016年9月14日——2016年9月20日",
	Quality = 2,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = true,
}


----【双节狂欢】血战药王庙
Campaign.Config[278] =
{
	ID = {8559},
	Name = "【重阳】除恶驱邪",
	Icon = 11708,
	Type = 7,
	Level = {Min = 30, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {84982},
	location = "洛阳城 冀飞虎",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      九月初九，逢凶之日，每到此间，总有邪祟趁虚而入，为祸人间。古有淮南桓景访仙学艺，为民除害。如今古人已逝，还望众侠士肩负起除魔卫道之责。2016年10月9日-2016年10月15日活动期间，每日可在主城冀飞虎处领取任务，进入除恶驱邪副本消除为祸人间的邪祟，任务完成即可获得奖励。 ",
	AwardType = {1,0,0},
	Award = {
	{icon = 11191 , tip = "海量经验"},
	{icon = 12384 , tip = "星尘砂、月尘砂"},
	{icon = 9141 , tip = "其他丰厚大奖"},
	},
	ReportTime = true,
	Time =
	{
		Month = {10},
		Day = {9,10,11,12,13,14,15},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2016年10月9日-2016年10月15日",
	Quality = 2,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = true,
}

--双节狂欢【老玩家回归】
Campaign.Config[279] =
{
	ID = {8558},
	Name = "老玩家回归",
	Icon = 14662,
	Type = 1,
	Level = {Min = 30, Max = 0},
	PlayerNum = {Min = 1, Max = 1},
	DelvNpc = {91189},
	location = "衡山城 回归大使",
	TaskLimit = {TaskID = 0, Times = 5},
	Desc = "      超过30天未上线的玩家，可找衡山城的回归大使（M地图“归”字）领取老玩家回归BUFF，BUFF含8小时双倍经验。此外，凭借此BUFF还可在回归大使处领取包括绿竹、飞龙令、除恶令、妖楼、盟主等挑战任务，挑战成功后奖励多多！\r    玩家身上带有回归BUFF的时候，还可在回归大使处接取再战江湖，集齐“再”“战”“江”“湖”四种令牌之后的奖励更加丰厚！（再战江湖任务每月28日12点12分刷新）",
	AwardType = {1,2,3},
	Award = {
	{icon = 11191 , tip = "海量经验"},
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = false,
	Time =
	{
			Month = {0},
			Day = {0},
			WDay = {7},
			IsRegular = true,
			Segment = {{0,0,0}},
	},
	TimeDesc = "全天开放",
	Quality = 2,
	CountNum = {Type = 2,ID = 1},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = false,
}
----【中秋活动】每日签到
Campaign.Config[280] =
{
	ID = {8484},
	Name = "【双节狂欢】每日签到",
	Icon = 11708,
	Type = 7,
	Level = {Min = 20, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {91031},
	location = "洛阳城 活动大使",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      2015年10月1日-2015年11月4日，活动开启期间，玩家每日均可在洛阳城活动大使处进行签到，点击签到按钮即可获得大量奖励，坚持签到奖励更丰富！友情提示：签到领取奖励请确保接受任务数量未满，且包裹留有至少一个空位。 ",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141, tip = "丰厚奖励"},	
	},
	ReportTime = true,
	Time =
	{
		Month = {10},
		Day = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2015年10月1日-2015年11月4日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = true,
}
----【中秋活动】每日签到-续
Campaign.Config[281] =
{
	ID = {8484},
	Name = "【双节狂欢】每日签到",
	Icon = 11708,
	Type = 7,
	Level = {Min = 20, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {91031},
	location = "洛阳城 活动大使",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      2015年10月1日-2015年11月4日，活动开启期间，玩家每日均可在洛阳城活动大使处进行签到，点击签到按钮即可获得大量奖励，坚持签到奖励更丰富！友情提示：签到领取奖励请确保接受任务数量未满，且包裹留有至少一个空位。 ",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141, tip = "丰厚奖励"},	
	},
	ReportTime = true,
	Time =
	{
		Month = {11},
		Day = {1,2,3,4},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2015年10月1日-2015年11月4日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = true,
}
--<万圣节福利>黄金镖车奖不停
Campaign.Config[282] =
{
	ID = {7528},
	Name = "【万圣节福利】黄金镖车奖不停",
	Icon = 11708,
	Type = 1,
	Level = {Min = 35, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {86285},
	location = "孙镇疆",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       2015年10月28日-2015年11月3日，与NPC孙镇疆对话，免费获得特殊镖车——黄金镖车！运送黄金镖车成功，经验翻倍！截取黄金镖车成功，所得翻倍！",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {10},
		Day = {28,29,30,31},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2015年10月28日-2015年11月3日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = true,
}
--<万圣节福利>黄金镖车奖不停-续
Campaign.Config[283] =
{
	ID = {7528},
	Name = "【万圣节福利】黄金镖车奖不停",
	Icon = 11708,
	Type = 1,
	Level = {Min = 35, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {86285},
	location = "孙镇疆",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       2015年10月28日-2015年11月3日期间，与NPC孙镇疆对话，免费获得特殊镖车——黄金镖车！运送黄金镖车成功，经验翻倍！截取黄金镖车成功，所得翻倍！",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {11},
		Day = {1,2,3},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2015年10月28日-2015年11月3日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = true,
}
--<万圣节福利>装备做不停
Campaign.Config[284] =
{
	ID = {7528},
	Name = "【万圣节福利】装备做不停",
	Icon = 11708,
	Type = 1,
	Level = {Min = 1, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {77089},
	location = "福州城、衡山城、洛阳城东方姑娘处",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       2015年10月28日-2015年11月3日期间每晚20：00——24：00，装备打造合成几率增加10%，特殊材料掉率翻倍，活动期间，可前往东方姑娘处领取三级滋补丹5个！",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {10},
		Day = {28,29,30,31},
		WDay = {7},
		IsRegular = true,
		Segment = {{20,00,240}},
	},
	TimeDesc = "2014年8月29日-2014年9月29日期间每晚20：00——24：00",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = true,
}
--<万圣节福利>装备做不停-续
Campaign.Config[285] =
{
	ID = {7528},
	Name = "【万圣节福利】装备做不停",
	Icon = 11708,
	Type = 1,
	Level = {Min = 1, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {77089},
	location = "福州城、衡山城、洛阳城东方姑娘处",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       2015年10月28日-2015年11月3日期间每晚20：00——24：00，装备打造合成几率增加10%，特殊材料掉率翻倍，活动期间，可前往东方姑娘处领取三级滋补丹5个！",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {11},
		Day = {1,2,3},
		WDay = {7},
		IsRegular = true,
		Segment = {{20,00,240}},
	},
	TimeDesc = "2014年8月29日-2014年9月29日期间每晚20：00——24：00",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = true,
}
----2015PK赛BOSS
Campaign.Config[286] =
{
	ID = {8587},
	Name = "2015帮派PK赛BOSS",
	Icon = 11708,
	Type = 7,
	Level = {Min = 1, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {},
	location = "",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      活动期间，2015年10月14日——2015年10月20日期间每晚19：50——24：00，帮派PK赛BOSS将在少室山（533.-313）、五霸岗（442.334）、华山（270.61）三地同时出现，快去打败它们，抢夺珍贵的“武林盟密信”！BOSS掉落最终归属伤害最高的队伍，玩家拾到“武林盟密信”之后请交易给帮主，活动截止后，官方工作人员将统计各帮主包裹内的密信数量，密信较多的帮派将获得晋级下一轮跨服PK赛资格！ ",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},	
	},
	ReportTime = true,
	Time =
	{
		Month = {10},
		Day = {14,15,16,17,18,19,20},
		WDay = {7},
		IsRegular = false,
		Segment = {{19,50,250}},
	},
	TimeDesc = "2015年10月14日——2015年10月20日期间每晚19：50——24：00",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = true,
}
----【恒山归来】喜讯频传
Campaign.Config[287] =
{
	ID = {8737},
	Name = "【恒山归来】喜讯频传",
	Icon = 11708,
	Type = 7,
	Level = {Min = 40, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {91433},
	location = "恒山派 仪琳",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      （恒山派专属）2015年11月19日-2015年11月24日,活动开启期间每日恒山派玩家可在仪琳处接取相关任务，前往同为佛教弟子的少林派峨嵋派，通知掌门恒山重建的喜讯，并在少林派参拜佛像，为恒山祈福。完成后可获得惊喜奖励。友情提示：参加活动请保证包裹至少留有3个空位。 ",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141, tip = "丰厚奖励"},	
	},
	ReportTime = true,
	Time =
	{
		Month = {11},
		Day = {19,20,21,22,23,24},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2015年11月19日-2015年11月24日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = true,
}
----【恒山归来】恒山弟子召集令
Campaign.Config[288] =
{
	ID = {8735},
	Name = "【恒山归来】弟子召集令",
	Icon = 11708,
	Type = 7,
	Level = {Min = 60, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {91433},
	location = "恒山派 仪琳",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      （恒山派专属）2015年11月13日-2015年11月19日,活动开启期间每日恒山派玩家可在仪琳处领取恒山弟子召集令，前往衡山郊外寻找恒山云游弟子，通知她们回归门派。成功寻回恒山云游弟子后可获得惊喜奖励。 ",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141, tip = "丰厚奖励"},	
	},
	ReportTime = true,
	Time =
	{
		Month = {11},
		Day = {13,14,15,16,17,18,19},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2015年11月13日-2015年11月19日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = true,
}
----【恒山归来】重建恒山
Campaign.Config[289] =
{
	ID = {8736},
	Name = "【恒山归来】重建恒山",
	Icon = 11708,
	Type = 7,
	Level = {Min = 20, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {91433},
	location = "恒山派 仪琳",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      （恒山派专属）2015年11月13日-2015年11月19日,活动开启期间每日恒山派玩家可在仪琳处接到任务，完成相关恒山派的重建工作，完成后可获得奖励。连续完成7天还可在仪琳处领取称号“恒山精英”。 ",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141, tip = "丰厚奖励"},	
	},
	ReportTime = true,
	Time =
	{
		Month = {11},
		Day = {13,14,15,16,17,18,19},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2015年11月13日-2015年11月19日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = true,
}
----【恒山归来】签到赢“壕”礼
Campaign.Config[290] =
{
	ID = {8729},
	Name = "【恒山归来】签到赢“壕”礼",
	Icon = 11708,
	Type = 7,
	Level = {Min = 20, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {91031},
	location = "洛阳城 活动大使",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      2015年11月13日-2015年12月18日，活动开启期间，玩家每日均可在洛阳城活动大使处进行签到，点击签到按钮即可获得大量奖励，坚持签到奖励更丰富！友情提示：签到领取奖励请确保接受任务数量未满，且包裹留有至少一个空位。 ",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141, tip = "丰厚奖励"},	
	},
	ReportTime = true,
	Time =
	{
		Month = {11},
		Day = {13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2015年11月13日-2015年12月18日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = true,
}
----【恒山归来】签到赢“壕”礼-续
Campaign.Config[291] =
{
	ID = {8729},
	Name = "【恒山归来】签到赢“壕”礼",
	Icon = 11708,
	Type = 7,
	Level = {Min = 20, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {91031},
	location = "洛阳城 活动大使",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      2015年11月13日-2015年12月18日，活动开启期间，玩家每日均可在洛阳城活动大使处进行签到，点击签到按钮即可获得大量奖励，坚持签到奖励更丰富！友情提示：签到领取奖励请确保接受任务数量未满，且包裹留有至少一个空位。 ",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141, tip = "丰厚奖励"},	
	},
	ReportTime = true,
	Time =
	{
		Month = {12},
		Day = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2015年11月13日-2015年12月18日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = true,
}
----【恒山归来】六级宝石免费送
Campaign.Config[292] =
{
	ID = {8513},
	Name = "【恒山归来】六级宝石免费送",
	Icon = 11708,
	Type = 7,
	Level = {Min = 60, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {91031},
	location = "洛阳城 活动大使",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      2015年11月13日-2015年11月19日，每日20:00-22:00，活动开启期间，等级大于等于60级的玩家与活动大使对话，接取任务即可领取活动奖励礼包“宝石匣子”，开启后即可随机获得丰厚的奖励！\r      请注意，这种奢侈的礼物一人只有一个，开启前请记得洗脸。",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141, tip = "丰厚奖励"},	
	},
	ReportTime = true,
	Time =
	{
		Month = {11},
		Day = {13,14,15,16,17,18,19},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2015年11月13日-2015年11月19日，每日20:00-22:00",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = true,
}
----【恒山归来】在线即送双倍经验
Campaign.Config[293] =
{
	ID = {8514},
	Name = "【恒山归来】在线擒豪礼",
	Icon = 11708,
	Type = 7,
	Level = {Min = 60, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {},
	location = "",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      2015年11月20日-2015年11月26日，每日20:00-22:00，活动开启期间，等级大于等于60级的玩家与活动大使对话，接取任务后，在线2小时即可获得活动奖励礼包“江湖豪礼”，开启后即可随机获得丰厚的活动奖励哟~\r      PS：任务每天都可以接取，奖励每天都可以拿到哦~",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141, tip = "丰厚奖励"},	
	},
	ReportTime = true,
	Time =
	{
		Month = {11},
		Day = {20,21,22,23,24,25,26},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2015年11月20日-2015年11月26日，每日20:00-22:00",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = true,
}
----【恒山归来】高级宝石，在线即领
Campaign.Config[294] =
{
	ID = {8515},
	Name = "【恒山归来】宝石送不停",
	Icon = 11708,
	Type = 7,
	Level = {Min = 1, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {},
	location = "",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      2015年11月13日-2015年11月20日，活动开启期间，玩家累计在线一定时长即可获得活动奖励，累计时长越长则奖励就越丰厚，累计在线时长满120小时后必可获得“宝石匣子”，开启匣子惊喜多多~速速在线刷刷刷走起吧！ ",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141, tip = "丰厚奖励"},	
	},
	ReportTime = true,
	Time =
	{
		Month = {11},
		Day = {13,14,15,16,17,18,19,20},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2015年11月13日-2015年11月20日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = true,
}

--恒山归来【老玩家回归】
Campaign.Config[295] =
{
	ID = {8905},
	Name = "【恒山归来】老玩家回归",
	Icon = 14662,
	Type = 1,
	Level = {Min = 30, Max = 0},
	PlayerNum = {Min = 1, Max = 1},
	DelvNpc = {91189},
	location = "衡山城 回归大使",
	TaskLimit = {TaskID = 0, Times = 5},
	Desc = "      2015年11月13日-2015年11月19日活动期间，超过30天未上线的玩家，可找衡山城的回归大使（M地图“归”字）领取任务“集齐四字信物”！完成绿竹、飞龙令、除恶令、妖楼、盟主等挑战任务，则有机会集齐“恒”“山”“归”“来”四字，兑换丰厚大奖！",
	AwardType = {1,2,3},
	Award = {
	{icon = 11191 , tip = "海量经验"},
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {11},
		Day = {13,14,15,16,17,18,19},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2015年11月13日-2015年11月19日",
	Quality = 2,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = false,
}
--恒山归来【宝箱砸不停】
Campaign.Config[296] =
{
	ID = {8906},
	Name = "【恒山归来】宝箱砸不停",
	Icon = 14662,
	Type = 1,
	Level = {Min = 30, Max = 0},
	PlayerNum = {Min = 1, Max = 1},
	DelvNpc = {3828},
	location = "恒山派 掌门",
	TaskLimit = {TaskID = 0, Times = 5},
	Desc = "      2015年11月13日-2015年11月24日，玩家朋友们可前往恒山派掌门处，3人以上组队进入副本恒山藏宝室！藏宝室仅开启5分钟时间，其中共有15种宝箱，不同的宝箱将开出不同数量的珍宝！累计获得的珍宝越多，最终能领取的奖励也将越多哦！\r      有些宝箱看起来富贵华丽，其实珍宝缺缺。而有些宝箱看似平凡无奇，其实内有乾坤！你能否找到珍宝最多的宝箱呢？",
	AwardType = {1,2,3},
	Award = {
	{icon = 11191 , tip = "海量经验"},
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {11},
		Day = {13,14,15,16,17,18,19,20,21,22,23,24},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2015年11月13日-2015年11月24日",
	Quality = 2,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = false,
}
-]]
--论剑大会
Campaign.Config[297] =
{
	ID = {8874},
	Name = "【活動】論劍大會",
	Icon = 11708,
	Type = 2,
	Level = {Min = 70, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {},
	location = "",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       每週五19：00-20:00之間，所有等級達到70的玩家都可以在“戰場”-“活動戰場”介面報名參加論劍大會，通過奪旗和擊殺敵對陣營玩家獲取積分！個人積分達到50分後即可獲得獎勵，積分排名越高獲取獎勵越豐厚！",
	AwardType = {1,0,0},
	Award = {
	{icon = 11191 , tip = "海量交易幣"},
	{icon = 9141 , tip = "星塵砂、大還丹、風物石、煉化石"},
	
	},
	ReportTime = true,
	Time =
	{
		Month = {0},
		Day = {0},
		WDay = {5},
		IsRegular = false,
		Segment = {{19,00,60}},
	},
	TimeDesc = "每週五19:00-20:00",
	Quality = 88,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = false,
}
----【冬日回馈】武勋大放送
--[[Campaign.Config[298] =
{
	ID = {8985},
	Name = "【冬日酬勤】助力边疆",
	Icon = 11708,
	Type = 7,
	Level = {Min = 35, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {86285},
	location = "天下会 孙镇疆",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      2015年11月27日至2015年12月22日，边疆大将号召大家助力边疆防务，参与物资运送者必有重谢！活动开启期间，玩家每日均可在天下会孙镇疆处领取一个橙镖令，且成功完成一次押镖的玩家还可在孙镇疆处领取150点武勋的额外奖励，武勋奖励周末翻倍，快来参加吧！友情提示：武勋奖励每人每日仅可领取一次。 ",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141, tip = "丰厚奖励"},	
	},
	ReportTime = true,
	Time =
	{
		Month = {11},
		Day = {27,28,29,30},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2015年11月27日-2015年12月22日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = true,
}
----【冬日回馈】武勋大放送--续
Campaign.Config[299] =
{
	ID = {8985},
	Name = "【冬日酬勤】助力边疆",
	Icon = 11708,
	Type = 7,
	Level = {Min = 35, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {86285},
	location = "天下会 孙镇疆",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      2015年11月27日至2015年12月22日，边疆大将号召大家助力边疆防务，参与物资运送者必有重谢！活动开启期间，玩家每日均可在天下会孙镇疆处领取一个橙镖令，且成功完成一次押镖的玩家还可在孙镇疆处领取150点武勋的额外奖励，武勋奖励周末翻倍，快来参加吧！友情提示：武勋奖励每人每日仅可领取一次。 ",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141, tip = "丰厚奖励"},	
	},
	ReportTime = true,
	Time =
	{
		Month = {12},
		Day = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2015年11月27日-2015年12月22日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = true,
}]]--

--论剑大会喊话
Campaign.Config[300] =
{
	ID = {9002},
	Name = "【活動】論劍大會",
	Icon = 11708,
	Type = 2,
	Level = {Min = 70, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {},
	location = "",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       每週五19：00-20:00之間，所有等級達到70的玩家都可以在“戰場”-“活動戰場”介面報名參加論劍大會，通過奪旗和擊殺敵對陣營玩家獲取積分！個人積分達到50分後即可獲得獎勵，積分排名越高獲取獎勵越豐厚",
	AwardType = {1,0,0},
	Award = {
	
	{icon = 9141 , tip = "豐厚獎勵"},
	
	},
	ReportTime = true,
	Time =
	{
		Month = {0},
		Day = {0},
		WDay = {5},
		IsRegular = false,
		Segment = {{19,3,10}},
	},
	TimeDesc = "每週五19:00-20:00",
	Quality = 88,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = false,
	Display = false
}

--跨服论剑大会
Campaign.Config[301] =
{
	ID = {9004},
	Name = "【活動】論劍大會",
	Icon = 11708,
	Type = 2,
	Level = {Min = 70, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {},
	location = "",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       每周六19：00-20:00之间，所有等级达到70的玩家都可以在“战场”-“活动战场”界面报名参加跨服论剑大会，通过夺旗和击杀敌对阵营玩家获取积分！个人积分达到50分后即可获得奖励，积分排名越高获取奖励越丰厚",
	AwardType = {1,0,0},
	Award = {
	
	{icon = 9141 , tip = "豐厚獎勵"},
	
	},
	ReportTime = true,
	Time =
	{
		Month = {0},
		Day = {0},
		WDay = {6},
		IsRegular = false,
		Segment = {{19,00,60}},
	},
	TimeDesc = "每周六19:00-20:00",
	Quality = 88,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = false,
}

--跨服论剑大会喊话
Campaign.Config[302] =
{
	ID = {9005},
	Name = "【活動】論劍大會喊話",
	Icon = 11708,
	Type = 2,
	Level = {Min = 70, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {},
	location = "",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       每週日19：00-20:00之間，所有等級達到70的玩家都可以在“戰場”-“活動戰場”介面報名參加跨服論劍大會，通過奪旗和擊殺敵對陣營玩家獲取積分！個人積分達到50分後即可獲得獎勵，積分排名越高獲取獎勵越豐厚",
	AwardType = {1,0,0},
	Award = {
	
	{icon = 9141 , tip = "豐厚獎勵"},
	
	},
	ReportTime = true,
	Time =
	{
		Month = {0},
		Day = {0},
		WDay = {5},
		IsRegular = false,
		Segment = {{19,3,10}},
	},
	TimeDesc = "每週日19:03-19:13",
	Quality = 88,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = false,
	Display = false
}

--[[
----【独孤立派】迎战不速之客
Campaign.Config[303] =
{
	ID = {8992},
	Name = "【独孤立派】迎战不速之客",
	Icon = 11708,
	Type = 7,
	Level = {Min = 60, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {92731},
	location = "独孤 独孤勒余",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      （独孤门派专属）2015年12月25日-2015年12月31日，活动开启期间，等级大于等于60的独孤门派玩家每日可以前往独孤门派基地在NPC“独孤勒余”处接取活动任务进入活动副本————迎战不速之客，完成活动副本后即可完成活动任务领取丰厚的活动奖励哦！ ",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141, tip = "丰厚奖励"},	
	},
	ReportTime = true,
	Time =
	{
		Month = {12},
		Day = {25,26,27,28,29,30,31},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2015年12月25日-2015年12月31日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = true,
}

----【火爆年末】夺回饺子馅1
Campaign.Config[304] =
{
	ID = {8989},
	Name = "【火爆年末】夺回饺子馅",
	Icon = 11708,
	Type = 7,
	Level = {Min = 50, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {92825},
	location = "洛阳城 令狐冲",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      2017年1月1日-1月10日活动期间，等级大于等于50的玩家每日可以到洛阳城的活动NPC“令狐冲”处接取活动任务“夺回饺子馅”，接取任务后按照提示收集制作饺子的材料完成系列任务，即可获得丰厚奖励哟~ ",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141, tip = "丰厚奖励"},	
	},
	ReportTime = true,
	Time =
	{
		Month = {1},
		Day = {1,2,3,4,5,6,7,8,9,10},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2017年1月1日-1月10日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = true,
}
--]]
----【火爆年末】礼物保卫战
Campaign.Config[305] =
{
	ID = {8969},
	Name = "【火爆年末】礼物保卫战",
	Icon = 11708,
	Type = 3,
	Level = {Min = 50, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {92656},
	location = "洛阳城 圣诞大使",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      2017年12月25日-12月31日活动期间，等级大于等于50的玩家每日可以组队（至少3人），从洛阳城的活动NPC“圣诞大使”处进入活动副本————圣诞礼物保卫战，完成活动副本后即可获得圣诞礼包等多种丰厚的活动奖励！\r      PS：每日上午8:00重置副本进入次数。",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141, tip = "丰厚奖励"},	
	},
	ReportTime = true,
	Time =
	{
		Month = {12},
		Day = {25,26,27,28,29,30,31},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2017年12月25日-12月31日",
	Quality = 99.05,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = true,
}

--[[
----【独孤】佳人再难得
Campaign.Config[306] =
{
	ID = {9016},
	Name = "【独孤立派】佳人难得",
	Icon = 11708,
	Type = 1,
	Level = {Min = 40, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {92835},
	location = "独孤 独孤鸣",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       （独孤门派专属）独孤门派最终开宗立派，独孤客的好友东方姑娘原本说好前来帮忙，最终却由于生病了没有来成，代掌门十分担心东方姑娘身体如何，带束花去探望东方姑娘。2015年12月25日-12月31日，活动开启期间，独孤门派玩家可前往代掌门独孤鸣处领取相关探望东方姑娘的任务，完成即可获得奖励。",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {12},
		Day = {25,26,27,28,29,30,31},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2015年12月25日-12月31日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = false,
}

----【独孤】欢迎仪式
Campaign.Config[307] =
{
	ID = {9017},
	Name = "【独孤立派】欢迎仪式",
	Icon = 11708,
	Type = 1,
	Level = {Min = 20, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {92835},
	location = "独孤 独孤鸣",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       （独孤门派专属）独孤门派最终开宗立派，代掌门决定设宴欢迎各位，并庆祝门派创立，作为门派的一员理应帮助准备。2015年12月25日-12月31日，活动开启期间，独孤门派玩家可前往代掌门独孤鸣处领取欢迎宴会准备的相关任务，完成即可获得奖励。且参与活动即可获得称号“独孤元老”，称号可在2016年1月3日前于独孤鸣处领取，逾期不可再领。",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {12},
		Day = {25,26,27,28,29,30,31},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2015年12月25日-12月31日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = false,
}

----【双旦】世界boss
Campaign.Config[308] =
{
	ID = {8999},
	Name = "【火爆年末】六道叛逆",
	Icon = 11708,
	Type = 1,
	Level = {Min = 20, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {},
	location = "",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       六道轮回中的叛逆盗出了轮回中的各种宝物，潜逃了出来，幽隐无奈，委托人前往追捕逆贼，降伏了六道叛逆者即可拥有他们盗走的财宝，顿时引发了无数江湖好汉竞相追捕！\r       2016年1月6日-2016年1月20日期间的周二、周四、周六以及周日，每日19：00-23：00，玩家皆可前往华山、少室山、五霸岗等地，捉拿六道叛贼，抢夺他们身上携有的绝学章节、绝学残页、极品武魂、超级幸运剂、转运珠等宝物！贡献多者，所得越多！（友情提示：世界Boss活动掉落均为不绑定，开启期间每日仅刷新一次且仅在0线刷新）",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {1},
		Day = {6,7,8,9,10,11,12,13,14,15,16,17,18,19,20},
		WDay = {7},
		IsRegular = true,
		Segment = {{19,00,240}},
	},
	TimeDesc = "2016年1月6日-2016年1月20日期间的周二、周四、周六以及周日的19：00-23：00",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = false,
}

----【双旦】暖心冬日
Campaign.Config[309] =
{
	ID = {9003},
	Name = "【火爆年末】暖心冬日",
	Icon = 11708,
	Type = 1,
	Level = {Min = 60, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {77088},
	location = "洛阳城 东方姑娘",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       最近那位欧罗巴来的神秘老人告诉了东方姑娘他家乡这个时节的传统菜谱，东方姑娘跃跃欲试，想要准备冬日的暖心火鸡大餐让他感受到家的感觉。2015年12月23日-12月31日，活动开启期间，玩家皆可在洛阳城东方姑娘处接取相关任务，前往五霸岗寻求迎宾客栈老板娘的帮助，准备好暖心的冬日火鸡大餐，东方姑娘必有重谢。",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {12},
		Day = {23,24,25,26,27,28,29,30,31},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2015年12月23日-12月31日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = false,
}



----【火爆年末】圣诞礼包送不停
Campaign.Config[310] =
{
	ID = {9012},
	Name = "【火爆年末】圣诞礼包送不停",
	Icon = 11708,
	Type = 7,
	Level = {Min = 30, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {},
	location = "",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      2015年12月23日-2015年12月31日，活动开启期间，参加相关圣诞活动可以获得“圣诞礼包”，对其他玩家使用圣诞礼包，该玩家可以获得奖励。每人每天最多只能收到8个“圣诞礼包”的奖励，超过8个以后，即使能再接收“圣诞礼包”，也不会再获得奖励！ ",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141, tip = "丰厚奖励"},	
	},
	ReportTime = true,
	Time =
	{
		Month = {12},
		Day = {23,24,25,26,27,28,29,30,31},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2015年12月23日-2015年12月31日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = true,
}

----整点在线领豪侠BUFF
Campaign.Config[311] =
{
	ID = {7743},
	Name = "【火爆年末】整点在线领豪侠BUFF",
	Icon = 11708,
	Type = 1,
	Level = {Min = 30, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {77089},
	location = "福州城、衡山城、洛阳城 东方姑娘",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       从1月1日-1月7日，玩家朋友们在19：00—20：00登录游戏，就可以找东方姑娘领取豪侠BUFF！豪侠BUFF可为各位大侠增加10000血上限、1000内功攻击以及1000外功攻击！",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {1},
		Day = {1,2,3,4,5,6,7},
		WDay = {7},
		IsRegular = true,
		Segment = {{19,00,60}},
	},
	TimeDesc = "2016年1月1日-2016年1月7日晚上19：00—20：00",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = false,
}
----整点在线领双倍经验
Campaign.Config[312] =
{
	ID = {7747},
	Name = "【火爆年末】整点在线领双倍经验",
	Icon = 11708,
	Type = 1,
	Level = {Min = 30, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {77089},
	location = "福州城、衡山城、洛阳城 东方姑娘",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       从1月1日-1月7日，玩家朋友们在20：00—21：00登录游戏，就可以找东方姑娘领取这个阶段的在线奖励——1小时双倍经验！",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {1},
		Day = {1,2,3,4,5,6,7},
		WDay = {7},
		IsRegular = true,
		Segment = {{20,00,60}},
	},
	TimeDesc = "2016年1月1日-2016年1月7日晚上20：00—21：00",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = false,
}
----整点在线领酬勤大礼包
Campaign.Config[313] =
{
	ID = {7748},
	Name = "【火爆年末】整点在线领酬勤大礼包",
	Icon = 11708,
	Type = 1,
	Level = {Min = 30, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {77089},
	location = "福州城、衡山城、洛阳城 东方姑娘",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       从1月1日-1月7日，玩家朋友们在21:00-22:00在线，就可以找东方姑娘领取这个阶段的在线奖励——酬勤大礼包！",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {1},
		Day = {1,2,3,4,5,6,7},
		WDay = {7},
		IsRegular = true,
		Segment = {{21,00,60}},
	},
	TimeDesc = "2016年1月1日-2016年1月7日晚上21:00-22:00",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = false,
}


----【阳春三月】最强连连看
Campaign.Config[314] =
{
	ID = {7741},
	Name = "最强连连看",
	Icon = 11708,
	Type = 7,
	Level = {Min = 30, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {},
	location = "",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      国庆佳节，一起来连连看吧！2016年10月1日-2016年10月7日活动期间，找东方姑娘开启连连看，并在规定时间内达到相应分数即可过关，获得奖励。该任务可无限完成，第一次完成获得奖励经验、星尘砂和灵草，第二次只有月尘砂和灵草，之后无奖励。按完成10、50、100、666、1000次，奖励特殊趣味称号。 ",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141, tip = "丰厚奖励"},	
	},
	ReportTime = true,
	Time =
	{
		Month = {10},
		Day = {1,2,3,4,5,6,7},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2016年10月1日-2016年10月7日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = true,
}

--]]

----元旦酿屠苏酒1
Campaign.Config[316] =
{
	ID = {9013},
	Name = "【火爆年末】元旦酿屠苏酒",
	Icon = 11708,
	Type = 3,
	Level = {Min = 30, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {84982},
	location = "洛阳城 冀飞虎",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       洛阳城附近酿造屠苏酒的材料被邪恶的地头蛇霸占了，快去帮助村民们打败可恶的地头蛇，帮助洛阳城附近的村民酿造屠苏酒吧！2018年1月1日-1月7日，活动期间，3人以上组队前往冀飞虎处，进入副本完成挑战！\r       PS：每日上午8:00重置副本进入次数。",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {1},
		Day = {1,2,3,4,5,6,7},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2018年1月1日-1月10日",
	Quality = 99.06,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = false,
}
--[[
----花缘传情-
Campaign.Config[317] =
{
	ID = {9014},
	Name = "【圣诞情语】花堪折时直须折",
	Icon = 11708,
	Type = 1,
	Level = {Min = 30, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {},
	location = "",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       只有怒放的鲜花，才能让她心花怒放~!\r    2016年12月14日-12月24日，活动期间冲进情圣榜以及花魁榜前10名的玩家，都将在活动结束后获得相应的奖励！排名第一的玩家，还将获得稀有特效时装一件（女装为双体型特效时装，萝莉成女皆可穿）！爱她，就给她最美的吧~！\r    获奖的玩家打开游戏界面右下角的排行榜，即可在情圣榜或花魁榜下方点击按钮领取奖励！！",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {12},
		Day = {14,15,16,17,18,19,20,21,22,23,24},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2016年12月14日-12月24日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = false,
}
----【囍迎新春】在线时长领豪礼
Campaign.Config[318] =
{
	ID = {9056},
	Name = "【囍迎新春】在线时长领豪礼",
	Icon = 11708,
	Type = 1,
	Level = {Min = 1, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {},
	location = "",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       囍迎新春，2016年1月13日-2016年1月19日，活动开启期间，玩家累计时长达到24、48、72、96、120小时，可分为获得风物碎片1、2、3、4、5个，集齐5个碎片找洛阳城方一民兑换风物志礼包，要踊跃参加。",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {1},
		Day = {13,14,15,16,17,18,19},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2016年1月13日-1月19日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = false,
}
----【囍迎新春】在线即领黄金宝箱
Campaign.Config[319] =
{
	ID = {9057},
	Name = "【囍迎新春】在线即领黄金宝箱",
	Icon = 11708,
	Type = 1,
	Level = {Min = 30, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {77089},
	location = "洛阳城 东方姑娘",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       囍迎新春，2016年1月20日-2016年3月2日，活动开启期间，玩家上线即可领取黄金宝箱，只能领取一次哟！\r       在2016年1月27日-2016年2月6日期间，每天可领取2把黄金钥匙，要等待2小时哟！\r       在2016年2月7日-2016年2月15日期间，每天可领取8把黄金钥匙，要等待2小时哟！\r       在2016年2月16日-2016年3月2日期间，每天可领取2把黄金钥匙，要等待2小时哟！",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {1},
		Day = {20,21,22,23,24,25,26,27,28,29,30,31},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2016年1月20日-3月2日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = false,
}
----【囍迎新春】在线即领黄金宝箱-续
Campaign.Config[320] =
{
	ID = {9057},
	Name = "【囍迎新春】在线即领黄金宝箱",
	Icon = 11708,
	Type = 1,
	Level = {Min = 30, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {77089},
	location = "洛阳城 东方姑娘",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       囍迎新春，2016年1月20日-2016年3月2日，活动开启期间，玩家上线即可领取黄金宝箱，只能领取一次哟！\r       在2016年1月27日-2016年2月6日期间，每天可领取2把黄金钥匙，要等待2小时哟！\r       在2016年2月7日-2016年2月15日期间，每天可领取8把黄金钥匙，要等待2小时哟！\r       在2016年2月16日-2016年3月2日期间，每天可领取2把黄金钥匙，要等待2小时哟！",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {2},
		Day = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2016年1月20日-3月2日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = false,
}
----【囍迎新春】在线即领黄金宝箱-续续
Campaign.Config[321] =
{
	ID = {9057},
	Name = "【囍迎新春】在线即领黄金宝箱",
	Icon = 11708,
	Type = 1,
	Level = {Min = 30, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {77089},
	location = "洛阳城 东方姑娘",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       囍迎新春，2016年1月20日-2016年3月2日，活动开启期间，玩家上线即可领取黄金宝箱，只能领取一次哟！\r       在2016年1月27日-2016年2月6日期间，每天可领取2把黄金钥匙，要等待2小时哟！\r       在2016年2月7日-2016年2月15日期间，每天可领取8把黄金钥匙，要等待2小时哟！\r       在2016年2月16日-2016年3月2日期间，每天可领取2把黄金钥匙，要等待2小时哟！",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {3},
		Day = {1,2},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2016年1月20日-3月2日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = false,
}
----【囍迎新春】花灯制作
Campaign.Config[322] =
{
	ID = {9064},
	Name = "【囍迎新春】花灯制作",
	Icon = 11708,
	Type = 1,
	Level = {Min = 30, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {77089},
	location = "洛阳城 东方姑娘",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       囍迎新春，2016年2月22日-2016年2月27日，活动开启期间，玩家帮助东方姑娘收集材料，在东方姑娘的指导下制作花灯并获得丰厚奖励。",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {2},
		Day = {22,23,24,25,26,27},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2016年2月22日-2月27日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = false,
}
----【囍迎新春】放花灯任务
Campaign.Config[323] =
{
	ID = {9068},
	Name = "【囍迎新春】放花灯任务",
	Icon = 11708,
	Type = 1,
	Level = {Min = 30, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {77089},
	location = "洛阳城 东方姑娘",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       囍迎新春，2016年2月22日-2016年2月27日19：00-23：00，活动开启期间，玩家帮助东方姑娘找到宫女元宵，放飞元宵花灯",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {2},
		Day = {22,23,24,25,26,27},
		WDay = {7},
		IsRegular = true,
		Segment = {{19,00,240}},
	},
	TimeDesc = "2016年2月22日-2016年2月27日19：00-23：00",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = false,
}
----【囍迎新春】元宵节签到
Campaign.Config[324] =
{
	ID = {9063},
	Name = "【囍迎新春】元宵节签到",
	Icon = 11708,
	Type = 1,
	Level = {Min = 20, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {91031},
	location = "洛阳城 活动大使",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      囍迎新春，2016年2月22日-2016年3月26日活动开启期间，玩家每日上线可找活动大使签到",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {2},
		Day = {22,23,24,25,26,27,28,29},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2016年2月22日-2016年3月26日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = false,
}

----【囍迎新春】元宵节代币商店
Campaign.Config[325] =
{
	ID = {8000},
	Name = "【囍迎新春】元宵节代币商店",
	Icon = 11708,
	Type = 1,
	Level = {Min = 1, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {83079},
	location = "洛阳城 福海",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      囍迎新春，2016年2月1日-2016年2月29日活动开启期间，玩家可在各大主城东方姑娘旁边的商人福海处，使用代币兑换道具",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {2},
		Day = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2016年2月1日-2016年2月29日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = false,
}
----【囍迎新春】元宵节签到-续
Campaign.Config[326] =
{
	ID = {9063},
	Name = "【囍迎新春】元宵节签到",
	Icon = 11708,
	Type = 1,
	Level = {Min = 20, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {91031},
	location = "洛阳城 活动大使",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      囍迎新春，2016年2月22日-2016年3月26日活动开启期间，玩家每日上线可找活动大使签到",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
                Month = {3},
		Day = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2016年2月22日-2016年3月26日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = false,
}

----【情人节】情人节
Campaign.Config[327] =
{
	ID = {9089},
	Name = "【情人节】情有独钟",
	Icon = 11708,
	Type = 1,
	Level = {Min = 1, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {77089},
	location = "洛阳城 东方姑娘",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       2016年2月14日-2016年2月24日，活动期间冲进情圣榜以及花魁榜前10名的玩家，都将在活动结束后获得相应的奖励！排名第一的玩家，还将稀有特效时装一件（女装为双体型特效时装，萝莉成女皆可穿）！快对亲爱的ta使用鲜花，享受浪漫的二人世界吧!\r    获奖的玩家打开游戏界面右下角的排行榜，即可在情圣榜或花魁榜下方点击按钮领取奖励！！",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {2},
		Day = {14,15,16,17,18,19,20,21,22,23,24},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2016年2月14日-2016年2月24日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = false,
}

----【元宵节】元宵副本
Campaign.Config[319] =
{
	ID = {9055},
	Name = "【囍迎新春】元宵盛宴",
	Icon = 11708,
	Type = 1,
	Level = {Min = 30, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {62916},
	location = "洛阳城 福王",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       2017年2月11日-2017年2月21日，三人以上组队前往洛阳城福王处进入副本，完成挑战以后即可以获得丰富的奖励！！",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {2},
		Day = {11,12,13,14,15,16,17,18,19,20,21},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2017年2月11日-2017年2月21日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = false,
}

----【女生节】玫瑰赠佳人
Campaign.Config[329] =
{
	ID = {9163},
	Name = "【女生节】玫瑰赠佳人",
	Icon = 11708,
	Type = 1,
	Level = {Min = 70, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {77089},
	location = "洛阳城 东方姑娘",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       2016年3月7日晚上18点至22点，满足条件的玩家可找东方姑娘领取一朵玫瑰，在这个特殊的节日，将玫瑰送给心爱的她，让她领悟你对她深情的爱意吧！\r玫瑰榜及情圣榜的第一名，分别还能获得花魁及情圣的红色称号哦 ",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {3},
		Day = {7},
		WDay = {7},
		IsRegular = true,
		Segment = {{18,00,240}},
	},
	TimeDesc = "2016年3月7日晚上18点至22点",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = false,
}
----【妇女节】兔宝送福利
Campaign.Config[330] =
{
	ID = {9164},
	Name = "【妇女节】兔宝送福利",
	Icon = 11708,
	Type = 1,
	Level = {Min = 1, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {77089},
	location = "洛阳城 东方姑娘",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       笑傲江湖全体工作人员，祝所有女玩家们节日快乐！2016年3月8日活动当天，所有女玩家都可找东方姑娘领取限时的腰部配饰兔宝儿，享受节日乐趣，同时还能获得福利双倍经验BUFF哦！",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {3},
		Day = {8},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2016年3月8日活动当天",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = false,
}
----【植树节】植树迎春
Campaign.Config[331] =
{
	ID = {9165},
	Name = "【植树节】植树迎春",
	Icon = 11708,
	Type = 1,
	Level = {Min = 20, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {77089},
	location = "洛阳城 东方姑娘",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      2016年3月12日-2016年3月18日活动期间，不同等级的玩家，可以找东方姑娘接取相应等级的种植任务，即领取树苗到特定地点栽种。等级越高，可接取的任务越多。每完成一个植树任务，都有机会获得“大自然的馈赠”“春天的馈赠”“花神的馈赠”。集齐三种馈赠物品，还可找我兑换酬勤大礼包，开启根骨丹、星尘砂等珍贵道具！",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {3},
		Day = {12,13,14,15,16,17,18},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2016年3月12日-2016年3月18日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = false,
}
----【愚人活动】烹饪美食
Campaign.Config[332] =
{
	ID = {9190},
	Name = "【愚人活动】烹饪美食",
	Icon = 11708,
	Type = 1,
	Level = {Min = 30, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {77089},
	location = "福州城 东方姑娘",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      2016年4月1日-2016年4月3日活动期间，东方姑娘决定宴请各位大侠，但是由于人手不够，需要大家的帮忙，完成最终任务可获得海量经验。",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {4},
		Day = {1,2,3},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2016年4月1日-2016年4月3日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = false,
}
----【愚人活动】鸿门豪宴
Campaign.Config[333] =
{
	ID = {9191},
	Name = "【愚人活动】鸿门豪宴",
	Icon = 11708,
	Type = 1,
	Level = {Min = 30, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {},
	location = "",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      2016年4月1日-2016年4月3日活动期间，晚上18点的福王府开席，一直持续到到21点！咳咳……但是据说东方姑娘手中掌握了整蛊他人的新方法，虽然奖励多多，但是到时候大家还是要小心点哦！参加宴席可获得高级炼化石，二级大还丹与海量经验",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {4},
		Day = {1,2,3},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2016年4月1日-2016年4月3日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = false,
}

----【清明】英雄美人墓
Campaign.Config[334] =
{
	ID = {9025},
	Name = "【清明】英雄美人墓",
	Icon = 11708,
	Type = 1,
	Level = {Min = 30, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {84928},
	location = "洛阳城 冀飞虎",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      2017年4月4日-2017年4月6日活动期间，80级以上玩家找冀飞虎接任务前往阴山草原昭君墓为昭君祭扫坟墓，80级以下玩家找冀飞虎接任务前往福州郊外古墓旧址为独孤求败敬上一杯酒。",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {4},
		Day = {4,5,6},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2017年4月4日-2017年4月6日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = false,
}

----【清明】春色满城迎醉猴
Campaign.Config[335] =
{
	ID = {9192},
	Name = "双节boss来袭",
	Icon = 11708,
	Type = 1,
	Level = {Min = 30, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {},
	location = "",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      2017年12月25日~2018年1月1日期间，每日19:30在少室山、华山以及五霸岗三个地图分别刷新一个双节boss，只存在两小时。双节boss掉落绝学章节、极品武魂、阵石精华、灵草等珍贵道具，掉落归属仇恨最高的队伍。BOSS死亡后会刷新30枚宝箱，宝箱可开出绝学书盒、2级刺珊瑚、2级角珊瑚、极品武魂、绝学章节、强化+6必成符、根骨丹等丰富奖励，柳枝可以通过洛阳城冀飞虎兑换各种珍贵道具哦。",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {12},
		Day = {4,5,6},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2017年4月4日-2017年4月6日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = false,
}


----【大侠回归季】重返江湖
Campaign.Config[336] =
{
	ID = {9181},
	Name = "【大侠回归季】重返江湖",
	Icon = 11708,
	Type = 1,
	Level = {Min = 30, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {91189},
	location = "衡山城 回归大使",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      2016年4月8日-2016年4月21日活动期间，连续30天未登陆游戏的玩家，前往衡山城回归大使处领取回归礼包并在回归的一周之内，每天可领取每日登陆礼包",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {4},
		Day = {8,9,10,11,12,13,14,15,16,17,18,19,20,21},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2016年4月8日-2016年4月21日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = false,
}
----【大侠回归季】夺宝奇兵
Campaign.Config[337] =
{
	ID = {9186},
	Name = "【大侠回归季】夺宝奇兵",
	Icon = 11708,
	Type = 1,
	Level = {Min = 20, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {84928},
	location = "洛阳城 冀飞虎",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      2016年4月8日8点-2016年4月17日活动期间，玩家每日可免费在洛阳城冀飞虎对话领取一个门票，进入夺宝奇兵副本，从第2次起，需在商城购买道具君子酒，换取门票狼跋令，每日最高可进入夺宝奇兵副本10次。",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {4},
		Day = {8,9,10,11,12,13,14,15,16,17},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2016年4月8日-2016年4月17日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = false,
}
----【大侠回归季】签到即送
Campaign.Config[338] =
{
	ID = {9189},
	Name = "【大侠回归季】签到即送",
	Icon = 11708,
	Type = 1,
	Level = {Min = 20, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {91031},
	location = "洛阳城 活动大使",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      2016年04月08日-2016年05月08日活动开启期间，玩家每日上线可找活动大使签到，领取奖励",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {4},
		Day = {8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2016年04月08日-2016年05月08日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = false,
}
----【大侠回归季】签到即送-续
Campaign.Config[339] =
{
	ID = {9189},
	Name = "【大侠回归季】签到即送",
	Icon = 11708,
	Type = 1,
	Level = {Min = 20, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {91031},
	location = "洛阳城 活动大使",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      2016年04月08日-2016年05月08日活动开启期间，玩家每日上线可找活动大使签到，领取奖励",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {5},
		Day = {1,2,3,4,5,6,7,8},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2016年04月08日-2016年05月08日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = false,
}
----【大侠回归】在线必得
Campaign.Config[340] =
{
	ID = {9182},
	Name = "【大侠回归】在线必得",
	Icon = 11708,
	Type = 1,
	Level = {Min = 30, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {77089},
	location = "福州城 东方姑娘",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      2016年4月8日晚20：30-21：30活动期间，在线的玩家可在三大主城东方姑娘处领取笑傲江湖宝盒",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {4},
		Day = {8},
		WDay = {7},
		IsRegular = true,
		Segment = {{20,30,60}},
	},
	TimeDesc = "2016年4月8日晚20：30-21：30",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = false,
}
----【大侠回归】在线必得
Campaign.Config[341] =
{
	ID = {9183},
	Name = "【大侠回归】在线必得",
	Icon = 11708,
	Type = 1,
	Level = {Min = 30, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {77089},
	location = "福州城 东方姑娘",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      2016年4月9日晚20：30-21：30活动期间，在线的玩家可在三大主城东方姑娘处领取人在江湖宝盒",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {4},
		Day = {9},
		WDay = {7},
		IsRegular = true,
		Segment = {{20,30,60}},
	},
	TimeDesc = "2016年4月9日晚20：30-21：30",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = false,
}
----【大侠回归】在线必得
Campaign.Config[342] =
{
	ID = {9184},
	Name = "【大侠回归】在线必得",
	Icon = 11708,
	Type = 1,
	Level = {Min = 30, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {77089},
	location = "福州城 东方姑娘",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      2016年4月10日晚20：30-21：30活动期间，在线的玩家可在三大主城东方姑娘处领取一统江湖宝盒",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {4},
		Day = {10},
		WDay = {7},
		IsRegular = true,
		Segment = {{20,30,60}},
	},
	TimeDesc = "2016年4月10日晚20：30-21：30",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = false,
}
----【豪礼相送】在线豪礼任你拿
Campaign.Config[343] =
{
	ID = {9185},
	Name = "【豪礼相送】在线豪礼任你拿",
	Icon = 11708,
	Type = 1,
	Level = {Min = 30, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {77089},
	location = "福州城 东方姑娘",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      2016年4月18日-2016年4月28日晚20：30-21：30活动期间，在线的玩家可在三大主城东方姑娘处领取翡翠匣",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {4},
		Day = {18,19,20,21,22,23,24,25,26,27,28},
		WDay = {7},
		IsRegular = true,
		Segment = {{20,30,60}},
	},
	TimeDesc = "2016年4月18日-2016年4月28日晚20：30-21：30",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = false,
}
----【绝学狂欢】绝学任你拿
Campaign.Config[344] =
{
	ID = {9187},
	Name = "【绝学狂欢】绝学任你拿",
	Icon = 11708,
	Type = 1,
	Level = {Min = 30, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {77089},
	location = "福州城 东方姑娘",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      2016年4月8日-2016年4月15日活动期间，寻找仙愁侠中的武林盟信使带回宝箱，用宝箱在冀飞虎处兑换绝世宝匣。",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {4},
		Day = {8,9,10,11,12,13,14,15},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2016年4月8日-2016年4月15日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = false,
}
--]]
--地脉之变
Campaign.Config[345] =
{
	ID = {9132},
	Name = "【活動】地脈之變",
	Icon = 11708,
	Type = 2,
	Level = {Min = 1, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {},
	location = "",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       每週六15:00-16:00之間，因天下地脈有變以致地脈鬼鼎現世，將之消滅可獲得幫派威望權杖，交予幫派帳房先生能提升幫派威望，讓幫派有機會拍得更多龍頭。活動期間，每個勢力相關場景僅出現一個地脈鬼鼎，想要獲得威望權杖的大俠可要抓緊時間了。地脈鬼鼎所在位置會在M鍵地圖內以圖示和TIPS的形式作出提示。",
	AwardType = {1,0,0},
	Award = {

	{icon = 26191 , tip = "幫派威望權杖"},
	
	},
	ReportTime = true,
	Time =
	{
		Month = {0},
		Day = {0},
		WDay = {6},
		IsRegular = false,
		Segment = {{15,00,60}},
	},
	TimeDesc = "每週六15:00-16:00",
	Quality = 21,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = false,
	DisplayToday = false,
}
--[[
----【五一活动】劳动最快乐
Campaign.Config[346] =
{
	ID = {9219},
	Name = "【五一活动】劳动最快乐",
	Icon = 11708,
	Type = 1,
	Level = {Min = 30, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {91031},
	location = "洛阳城 活动大使",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      2017年5月1日-2017年5月8日活动期间，玩家每日上线可找活动大使领取任务帮助农民伯伯采集木材、修理农具、休整田地，完成后可获得灵草以及大量经验。",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "灵草、大量经验"},
	},
	ReportTime = true,
	Time =
	{
		Month = {5},
		Day = {1,2,3,4,5,6,7,8},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2017年05月01日-2017年05月08日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = false,
}
----【五一活动】登录有礼
Campaign.Config[347] =
{
	ID = {9221},
	Name = "【五一活动】登录有礼",
	Icon = 11708,
	Type = 1,
	Level = {Min = 70, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {91031},
	location = "洛阳城 活动大使",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      2017年5月1日-2017年5月8日活动期间，玩家每日上线可找活动大使领取“劳动宝箱”与大量经验，打开宝箱可获得幸运剂、滋补丹、传奇装备材料、手工装备材料、根骨丹、武魂经验丹、2级大还丹等丰富奖励。",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {5},
		Day = {1,2,3,4,5,6,7,8},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2017年04月30日-2017年05月08日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = false,
}

----【五一活动】劳动最美
Campaign.Config[349] =
{
	ID = {9220},
	Name = "【五一活动】劳动最美",
	Icon = 11708,
	Type = 1,
	Level = {Min = 30, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {91031},
	location = "洛阳城 活动大使",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      2017年5月1日-2017年5月8日活动期间，活跃值达到50的玩家，可找活动大使领取大量经验奖励！活跃值达到70的玩家，可找活动大使额外领取一枚青龙令！",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {5},
		Day = {1,2,3,4,5,6,7,8},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2017年5月1日-2017年5月8日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = false,
}

----【五一活动】世界boss
Campaign.Config[350] =
{
	ID = {8999},
	Name = "【五一活动】世界boss",
	Icon = 11708,
	Type = 1,
	Level = {Min = 30, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {},
	location = "",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      2016年5月4日-2016年5月8日19：00-20：00活动期间，五霸岗、华山、少室山三个地图将在随机地点刷新世界BOSS，玩家击杀BOSS后可获得丰富的奖励（BOSS掉落归属仇恨最高的队伍）。BOSS死亡后会随机刷新一定数量的宝箱，开启宝箱可获得各种珍贵道具。",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {5},
		Day = {4,5,6,7,8},
		WDay = {7},
		IsRegular = true,
		Segment = {{19,00,60}},
	},
	TimeDesc = "2016年5月4日-2016年5月8日19：00-20：00",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = false,
}
----【5.20】咱们结婚吧
Campaign.Config[351] =
{
	ID = {9231},
	Name = "【5.20】咱们结婚吧",
	Icon = 11708,
	Type = 1,
	Level = {Min = 30, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {},
	location = "",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      2016年5月18日-2016年5月31日活动期间，双人组队前往月老处进入一线牵副本，每天可以进入5次副本，第一次免费，从第二次开始分别需要2个、4个、6个，8个“姻缘签”。姻缘签可在商城购买，完成副本后可获得海量经验以及“永结同心”大礼包，大礼包可开出丰厚奖励与“鲜花种子”，“鲜花种子”可在月老处兑换鲜花。",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {5},
		Day = {18,19,20,21,22,23,24,25,26,27,28,29,30,31},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2016年5月18日-2016年5月31日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = false,
}

----【520】把爱秀出来
Campaign.Config[352] =
{
	ID = {9231},
	Name = "【520】把爱秀出来",
	Icon = 11708,
	Type = 1,
	Level = {Min = 1, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {},
	location = "",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       2016年5月18日-2016年5月24日，活动期间冲进情圣榜以及花魁榜前10名的玩家，都将在活动结束后获得相应的奖励！排名第一的玩家，还将珍贵的特效蝴蝶翅膀（限时）！快对亲爱的ta使用鲜花，享受浪漫的二人世界吧!\r    获奖的玩家打开游戏界面右下角的排行榜，即可在情圣榜或花魁榜下方点击按钮领取奖励！！（请于2016年6月1日0点之前领取奖励，过期作废。）",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {5},
		Day = {18,19,20,21,22,23,24,25,26,27,28,29,30,31},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2016年5月18日-2016年5月24日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = false,
}
----【端午节】饮雄黄
Campaign.Config[353] =
{
	ID = {9230},
	Name = "【端午节】饮雄黄",
	Icon = 11708,
	Type = 1,
	Level = {Min = 30, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {},
	location = "",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      2016年6月9日-2016年6月19日活动期间，前往活动大使处领取任务，通关绿竹、飞龙令、盟主、六道、绝情谷，均可获得“雄黄酒”，饮下雄黄酒后可获得一枚“平安符”，平安符可在活动大使处兑换各种道具。",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {6},
		Day = {9,10,11,12,13,14,15,16,17,18,19},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2016年6月9日-2016年6月19日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = false,
}
----【端午节】五色新丝缠角粽
Campaign.Config[354] =
{
	ID = {9229},
	Name = "【端午节】五色新丝缠角粽",
	Icon = 11708,
	Type = 1,
	Level = {Min = 30, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {91031},
	location = "洛阳城 活动大使",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      2016年6月9日-2016年6月19日活动期间，可找活动大使领取“竹叶”，同时接取“糯米”“粽焰”“调料”任务，分别完成绿竹、飞龙令以及绝情谷即可获得相应材料。在洛阳城周掌勺的指导下包粽子，可选择获得甜粽与咸粽，开出不同的奖励。",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {6},
		Day = {9,10,11,12,13,14,15,16,17,18,19},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2016年6月9日-2016年6月19日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = false,
}
----【端午节】驱五毒，佩香包
Campaign.Config[355] =
{
	ID = {9240},
	Name = "【端午节】驱五毒，佩香包",
	Icon = 11708,
	Type = 1,
	Level = {Min = 30, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {91031},
	location = "",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      2016年6月9日-2016年6月19日20：00-23：00活动期间，可找活动大使领取驱五毒BUFF， 驱五毒BUFF可为各位大侠增加10000血上限、1000内功攻击以及1000外功攻击。在五霸岗、华山、少室山、衡山郊外、余杭有五毒BOSS出没，玩家击杀BOSS后可获得丰富的奖励（BOSS掉落归属仇恨最高的队伍）。BOSS死亡后会随机刷新一定数量的宝箱，开启宝箱可获得各种珍贵道具。",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {6},
		Day = {9,10,11,12,13,14,15,16,17,18,19},
		WDay = {7},
		IsRegular = true,
		Segment = {{20,00,180}},
	},
	TimeDesc = "2016年6月9日-2016年6月19日20：00-23：00",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = false,
}
----【重返江湖】回归有礼
Campaign.Config[356] =
{
	ID = {9649},
	Name = "【重返江湖】回归有礼",
	Icon = 11708,
	Type = 1,
	Level = {Min = 30, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {91031},
	location = "洛阳城 活动大使",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      2016年6月17日-2016年7月1日与NPC活动大使或者东方姑娘对话，获得回归称号：“【荣耀归来】”，领取“荣耀礼包”。6.17-6.23期间每天还可前往“活动大使”处领取每日登陆礼包。同时还能接取彩蛋任务，领取荣耀宝盒一个，有几率开出海量经验、高级炼化石、白银碎片、黄金碎片、琉璃武器（不绑定）。",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {6},
		Day = {17,18,19,20,21,22,23,24,25,26,27,28,29,30},
		WDay = {7},
		IsRegular = true,
		Segment = {{20,00,180}},
	},
	TimeDesc = "2016年6月17日-2016年7月1日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = false,
}
----【重返江湖】回归有礼-续
Campaign.Config[357] =
{
	ID = {9649},
	Name = "【重返江湖】回归有礼",
	Icon = 11708,
	Type = 1,
	Level = {Min = 30, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {91031},
	location = "洛阳城 活动大使",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      2016年6月17日-2016年7月1日与NPC活动大使或者东方姑娘对话，获得回归称号：“【荣耀归来】”，领取“荣耀礼包”。6.17-6.23期间每天还可前往“活动大使”处领取每日登陆礼包。同时还能接取彩蛋任务，领取荣耀宝盒一个，有几率开出海量经验、高级炼化石、白银碎片、黄金碎片、琉璃武器（不绑定）。",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {7},
		Day = {1},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2016年6月17日-2016年7月1日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = false,
}
----【三周年】天降宝石
Campaign.Config[358] =
{
	ID = {9650},
	Name = "【三周年】天降宝石",
	Icon = 11708,
	Type = 1,
	Level = {Min = 30, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {91031},
	location = "洛阳城 活动大使",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      2016年6月17日-2016年6月20日，活动期间内每日找活动大使领取任务，累计在线时长分别60分钟，120分钟，240分钟，360分钟时，即可获得宝石兑换券（可交易）。使用宝石兑换券之后，可随机获得各种等级的宝石，至高为六级，最低为3级宝石碎片。宝石兑换券有一定时间限制（获得后24小时后消失），过期则自动消失，且每人每天至多有5次使用机会。",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {6},
		Day = {17,18,19,20},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2016年6月17日-2016年6月20日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = false,
}
----【三周年】领取勋章
Campaign.Config[359] =
{
	ID = {9651},
	Name = "【三周年】领取勋章",
	Icon = 11708,
	Type = 1,
	Level = {Min = 1, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {91031},
	location = "",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      周年庆期间，6.28当日登陆游戏，即可找活动大使一枚特制徽章（全资质+10），及特殊称号【不悔青春 江湖有你·叁】",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {6},
		Day = {28},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2016年6月28日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = false,
}
----日出东方签到
Campaign.Config[360] =
{
	ID = {9630},
	Name = "日出东方签到",
	Icon = 11708,
	Type = 1,
	Level = {Min = 20, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {91031},
	location = "洛阳城 活动大使",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      日出东方，2016年6月17日-2016年7月17日活动开启期间，玩家每日上线可找活动大使签到",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {6},
		Day = {17,18,19,20,21,22,23,24,25,26,27,28,29,30},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2016年6月17日-2016年7月17日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = false,
}
----日出东方签到-续
Campaign.Config[361] =
{
	ID = {9630},
	Name = "日出东方签到",
	Icon = 11708,
	Type = 1,
	Level = {Min = 20, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {91031},
	location = "洛阳城 活动大使",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      2016年6月17日-2016年7月17日活动开启期间，玩家每日上线可找活动大使签到，领取奖励",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {7},
		Day = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2016年6月17日-2016年7月17日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = false,
}
----【日出东方】岛主的嘱托-朱雀宝盒
Campaign.Config[362] =
{
	ID = {9625},
	Name = "【日出东方】岛主的嘱托",
	Icon = 11708,
	Type = 1,
	Level = {Min = 30, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {},
	location = "",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      2016年6月22、25日20：30-21：30活动期间，前往蓬莱仙岛找蓬莱岛主获得海量经验与朱雀宝盒，开启宝盒可获得残页、绝学书盒，获得绝学书盒时会额外获得称号【运气最佳宝宝】",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {6},
		Day = {22,25},
		WDay = {7},
		IsRegular = true,
		Segment = {{20,30,60}},
	},
	TimeDesc = "2016年6月22、25日20：30-21：30",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = false,
}
----【日出东方】岛主的嘱托-玄武宝盒
Campaign.Config[363] =
{
	ID = {9626},
	Name = "【日出东方】岛主的嘱托",
	Icon = 11708,
	Type = 1,
	Level = {Min = 30, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {},
	location = "",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      2016年6月23、26日20：30-21：30活动期间，前往蓬莱仙岛找蓬莱岛主获得海量经验与玄武宝盒，开启宝盒可获得黄金武器碎片、白银武器碎片、琉璃武器，获得琉璃武器时会额外获得称号【运气最佳宝宝】",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {6},
		Day = {23,26},
		WDay = {7},
		IsRegular = true,
		Segment = {{20,30,60}},
	},
	TimeDesc = "2016年6月23、26日20：30-21：30",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = false,
}
----【日出东方】岛主的嘱托-青龙宝盒
Campaign.Config[364] =
{
	ID = {9627},
	Name = "【日出东方】岛主的嘱托",
	Icon = 11708,
	Type = 1,
	Level = {Min = 30, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {},
	location = "",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      2016年6月24、27日20：30-21：30活动期间，前往蓬莱仙岛找蓬莱岛主获得海量经验与青龙宝盒，开启宝盒可获得六道轮回的奖励数量、六品武魂，获得六品武魂时会额外获得称号【运气最佳宝宝】",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {6},
		Day = {24,27},
		WDay = {7},
		IsRegular = true,
		Segment = {{20,30,60}},
	},
	TimeDesc = "2016年6月24、27日20：30-21：30",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = false,
}
----【三周年】全民宝石狂欢
Campaign.Config[365] =
{
	ID = {9628},
	Name = "【三周年】全民宝石狂欢",
	Icon = 11708,
	Type = 1,
	Level = {Min = 30, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {91031},
	location = "洛阳城 活动大使",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      2016年6月28日20：00-20：30活动期间，前往洛阳城活动大使处领取“三周年感恩回馈礼包”，开启礼包可随机获得黄金武器碎片、白银武器碎片、高级炼化石、黄金武器、白银武器、琉璃武器。",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {6},
		Day = {28},
		WDay = {7},
		IsRegular = true,
		Segment = {{20,00,30}},
	},
	TimeDesc = "2016年6月28日20：00-20：30",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = false,
}
----【三周年】全民经验大狂欢
Campaign.Config[366] =
{
	ID = {9628},
	Name = "【三周年】全民经验大狂欢",
	Icon = 11708,
	Type = 1,
	Level = {Min = 30, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {91031},
	location = "洛阳城 活动大使",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      2016年6月28日至6月30日18：00-22：00活动期间，前往洛阳城活动大使处领取活力草并且在活动期间内全服开启双倍经验。",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {6},
		Day = {28,29,30},
		WDay = {7},
		IsRegular = true,
		Segment = {{18,00,240}},
	},
	TimeDesc = "2016年6月28日至6月30日18：00-22：00",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = false,
}
----【三周年】在线领宝石
Campaign.Config[367] =
{
	ID = {9774},
	Name = "在线领宝石",
	Icon = 11708,
	Type = 7,
	Level = {Min = 1, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {},
	location = "",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      2016年8月18日10点-2016年8月24日早上8点，活动时间内玩家累计在线时长超过一定时长，即可获得相应数量的宝石碎片及灵草，在线时间越长，奖励越丰富。 ",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},	
	},
	ReportTime = true,
	Time =
	{
		Month = {8},
		Day = {18,19,20,21,22,23,24},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2016年8月18日10点-2016年8月24日早上8点",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = true,
}

----【浪漫七夕】火树银花不夜天
Campaign.Config[369] =
{
	ID = {9732},
	Name = "【浪漫七夕】火树银花不夜天",
	Icon = 11708,
	Type = 7,
	Level = {Min = 30, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {91031},
	location = "洛阳城 活动大使",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      2016年8月9日-2016年8月16日活动期间，大于等于30级玩家每天皆可找活动大使接取火树银花任务，前往剑阁花海、铸剑谷断情谷、峨嵋派浣玉斋三个地方欣赏美景，燃放烟花。完成任务后，可以获得丰厚的奖励哦。 ",
	AwardType = {1,0,0},
	Award = {
	{icon = 11191 , tip = "海量经验"},
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {8},
		Day = {9,10,11,12,13,14,15,16},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2016年8月9日-2016年8月16日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = true,
}


----【浪漫七夕】金风玉露 花满人间
Campaign.Config[370] =
{
	ID = {9733},
	Name = "【浪漫七夕】花满人间",
	Icon = 11708,
	Type = 7,
	Level = {Min = 1, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {91031},
	location = "洛阳城 活动大使",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      2016年8月9日-2016年8月24日活动期间，70级以上玩家可找活动大使领取一朵玫瑰，每位玩家只能领一次。商城新上架99朵蓝色妖姬、999朵蓝色妖姬、9999朵蓝色妖姬，玩家对其他玩家使用后可以分别获得相应的情圣值与花魁值。\r       8月份的情圣榜与花魁榜奖励除了原有称号之外，还将附送额外的大礼包，可以开出橙镖令、月尘砂、根骨丹、灵草等各种珍贵道具，前十名均可获得（第一名数量最多）！此外，第一名还将获得超炫限时特效翅膀背饰哦！ ",
	AwardType = {1,0,0},
	Award = {
	{icon = 11191 , tip = "海量经验"},
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {8},
		Day = {9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2016年8月9日-2016年8月24日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = true,
}
----【浪漫七夕】七夕BOSS大暴走
Campaign.Config[371] =
{
	ID = {9734},
	Name = "【浪漫七夕】BOSS大暴走",
	Icon = 11708,
	Type = 7,
	Level = {Min = 50, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {},
	location = "",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      2016年8月9日-2016年8月23日活动期间，每晚间20：00—23：00，在少室山、五霸岗、华山三处同时刷新世界BOSS，BOSS所掉落的大量物品，掉落归属仇恨最高的队伍。BOSS死亡后刷新宝箱，50级以上的玩家可开启。 ",
	AwardType = {1,0,0},
	Award = {
	{icon = 11191 , tip = "海量经验"},
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {8},
		Day = {9,10,11,12,13,14,15,16,17,18,19,20,21,22,23},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2016年8月9日-2016年8月23日活动期间，每晚间20：00—23：00",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = true,
}

----【浪漫七夕】双人重返江湖
Campaign.Config[372] =
{
	ID = {9735},
	Name = "【浪漫七夕】夫妻重返江湖",
	Icon = 11708,
	Type = 7,
	Level = {Min = 30, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {91031},
	location = "洛阳城 活动大使",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      2016年8月9日-2016年8月23日活动期间，累计30天没上线的夫妻玩家，可组队找活动大使接取任务，领取丰富的回归大礼。每位回归玩家只能完成一次。 ",
	AwardType = {1,0,0},
	Award = {
	{icon = 11191 , tip = "海量经验"},
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {8},
		Day = {9,10,11,12,13,14,15,16,17,18,19,20,21,22,23},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2016年8月9日-2016年8月23日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = true,
}
----【浪漫七夕】中元节除恶
Campaign.Config[373] =
{
	ID = {9736},
	Name = "【浪漫七夕】中元节除恶",
	Icon = 11708,
	Type = 7,
	Level = {Min = 30, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {84982},
	location = "洛阳城 冀飞虎",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      2016年8月17日-2016年8月23日活动期间，最近武当山脚出现了一批恶棍，装神弄鬼，骗人钱财，夺人性命，十分可恶！据武当派调查，似是小混混假扮的恶鬼在四处为恶，但事情并没有这么简单！活动期间，三人以上组队前往洛阳冀飞虎处，进入副本“中元节除恶”，去打败小混混扮的恶鬼，并找出罪魁祸首消灭之！完成副本后可获得海量经验与平安符（可随机开出橙镖令、根骨丹、三级宝石碎片、灵草）。 ",
	AwardType = {1,0,0},
	Award = {
	{icon = 11191 , tip = "海量经验"},
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {8},
		Day = {17,18,19,20,21,22,23},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2016年8月17日-2016年8月23日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = true,
}
----【中秋节】仙子降花朝
Campaign.Config[374] =
{
	ID = {9898},
	Name = "【中秋节】仙子降花朝",
	Icon = 11708,
	Type = 7,
	Level = {Min = 30, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {91031},
	location = "洛阳城 活动大使",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      洛阳城中的花朝阁据说来了一位嫦娥仙子，城中人们议论纷纷，都想一睹仙子芳容。但这花朝阁可不好闯，花朝阁阁主为各位侠士设计了三个难题，唯有破解这三道题的侠士才能见到嫦娥仙子。2016年9月14日-2016年9月20日活动期间，满足条件的玩家找活动大使开启任务，如果在任务中答错，则任务失败，需放弃重接。 ",
	AwardType = {1,0,0},
	Award = {
	{icon = 11191 , tip = "海量经验"},
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {9},
		Day = {14,15,16,17,18,19,20},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2016年9月14日-2016年9月20日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = true,
}
----【中秋节】杖打天狗护玉盘
Campaign.Config[375] =
{
	ID = {9897},
	Name = "【中秋节】杖打天狗护玉盘",
	Icon = 11708,
	Type = 7,
	Level = {Min = 30, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {},
	location = "",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      古时有兽曰天狗，其状如狸而白首，其音如榴榴，所堕及炎火，凶可吞日月。仲秋团圆节，本是家家团圆共赏明月之时，天狗却出来捣乱，不仅想要吞噬日月，其身所带的炎火也使所到之处寸草不生。2016年9月14日-2016年9月20日活动期间每日晚7点至11点，每到月亮初上之时，它便会出现在阴山、蓬莱仙岛以及夜岚谷，需要天下侠士齐心协力共同击退它。BOSS死亡后会刷新宝箱。 ",
	AwardType = {1,0,0},
	Award = {
	{icon = 11191 , tip = "海量经验"},
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {9},
		Day = {14,15,16,17,18,19,20},
		WDay = {7},
		IsRegular = false,
		Segment = {{19,00,240}},
	},
	TimeDesc = "2016年9月14日-2016年9月20日活动期间每日晚7点至11点",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = true,
}
----【教师节】遍访名师增见闻
Campaign.Config[376] =
{
	ID = {9899},
	Name = "【教师节】遍访名师增见闻",
	Icon = 11708,
	Type = 7,
	Level = {Min = 30, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {91031},
	location = "洛阳城 活动大使",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      春蚕到死丝方尽，蜡炬成灰泪始干。诸位大侠从初涉江湖到如今独步江湖，期间经历的风风雨雨自不必多言，回顾过往，可曾想起悉心教导尔等武学的门派习武导师。2016年9月10日-2016年9月12日活动期间，每日都找活动大使接取任务，处理来自其他门派的习武导师的帮助需求，为习武导师做些力所能及的事情。在活动结束前，拜访过所有门派的习武导师还可获得一个“尊师重道”的称号。 ",
	AwardType = {1,0,0},
	Award = {
	{icon = 11191 , tip = "海量经验"},
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {9},
		Day = {10,11,12},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2016年9月10日-2016年9月12日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = true,
}


----【中秋节】把酒邀月相为伴
Campaign.Config[377] =
{
	ID = {9918},
	Name = "【中秋节】把酒邀月相为伴",
	Icon = 11708,
	Type = 7,
	Level = {Min = 30, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {91031},
	location = "洛阳城 活动大使",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      2016年9月14日-2016年9月20日活动期间，玩家在洛阳主城活动大使处领取到四样不同的道具，四种道具上有相应古诗词对应四处赏月佳景，在指定位置处品味美酒欣赏圆月可获得活动奖励。 ",
	AwardType = {1,0,0},
	Award = {
	{icon = 11191 , tip = "海量经验"},
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {9},
		Day = {14,15,16,17,18,19,20},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2016年9月14日-2016年9月20日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = true,
}
----黄金钥匙开宝箱
Campaign.Config[378] =
{
	ID = {9929},
	Name = "黄金钥匙开宝箱",
	Icon = 11708,
	Type = 1,
	Level = {Min = 60, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {91031},
	location = "洛阳城 活动大使",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       1.2016年9月23日—2016年10月7日活动期间，首次登陆游戏后将获得神秘宝箱40个。每日在线累计60分钟,120分钟时，240分钟，360分钟时，即可获得黄金钥匙。（可交易）\r 2.使用黄金钥匙开启宝箱后，可随机获得灵草，宝石碎片，绝学章节，绝学残页，极品武魂，固元符，强化+6必成符（概率小），强化+12必成符（没有概率）等珍稀道具。\r3.黄金钥匙有一定的时间限制（获得后24小时后消失），过期则自动消失，且每人每天至多有5次使用黄金钥匙的机会。\r4.活动结束后，玩家已经领取，但未完成的任务将自动判定为失败。\r5.小窍门：每日20:00~21:00时，开启宝箱获得极品道具的概率将翻倍噢！",
	AwardType = {1,0,0},
	Award = {
	{icon = 11224 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {9},
		Day = {23,24,25,26,27,28,29,30},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2016年9月23日-2016年10月7日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = true,
}
----黄金钥匙开宝箱-续
Campaign.Config[379] =
{
	ID = {9929},
	Name = "黄金钥匙开宝箱",
	Icon = 11708,
	Type = 1,
	Level = {Min = 60, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {91031},
	location = "洛阳城 活动大使",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       1.2016年9月23日—2016年10月7日活动期间，首次登陆游戏后将获得神秘宝箱40个。每日在线累计60分钟,120分钟时，240分钟，360分钟时，即可获得黄金钥匙。（可交易） \r2.使用黄金钥匙开启宝箱后，可随机获得灵草，宝石碎片，绝学章节，绝学残页，极品武魂，固元符，强化+6必成符（概率小），强化+12必成符（没有概率）等珍稀道具。\r3.黄金钥匙有一定的时间限制（获得后24小时后消失），过期则自动消失，且每人每天至多有5次使用黄金钥匙的机会。\r4.活动结束后，玩家已经领取，但未完成的任务将自动判定为失败。\r5.小窍门：每日20:00~21:00时，开启宝箱获得极品道具的概率将翻倍噢！",
	AwardType = {1,0,0},
	Award = {
	{icon = 11224 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {10},
		Day = {1,2,3,4,5,6,7},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2016年9月23日-2016年10月7日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = true,
}
----整点在线得壕礼
Campaign.Config[380] =
{
	ID = {9930},
	Name = "整点在线得壕礼",
	Icon = 11708,
	Type = 1,
	Level = {Min = 30, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {91031},
	location = "洛阳城 活动大使",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      凡是在2016年9月23日-2016年9月28日 每日20:30~21:00活动期间，与洛阳城活动大使对话，即可获得玲珑匣*1。开启玲珑匣，必得海量经验，有几率开出高级炼化石，白银碎片，黄金碎片，琉璃武器（不绑定），绝学章节，残页。",
	AwardType = {1,0,0},
	Award = {
	{icon = 11224 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {9},
		Day = {23,24,25,26,27,28},
		WDay = {7},
		IsRegular = true,
		Segment = {{20,30,30}},
	},
	TimeDesc = "2016年9月23日-2016年9月28日 每日20:30~21:00",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = true,
}
----每日任务得神器
Campaign.Config[381] =
{
	ID = {9936},
	Name = "每日任务得神器",
	Icon = 11708,
	Type = 1,
	Level = {Min = 30, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {91031},
	location = "洛阳城 活动大使",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      活动期间，在洛阳活动大使处接取每日任务，完成即可获得丰厚奖励。第一天23日：玩家每参加一次最新副本，即可获得灵草*10，元气碎片*1。第二天24日：玩家使用2个最新版彩票，即可获得根骨丹*1（绑定），元气碎片*1。第三天25日：玩家成功完成一次竞技场比武，即可获得3级大还丹*10 ；元气碎片*1；第四天26日：玩家活跃度达到70，找NPC可领取连城令*5（绑定），元气碎片*1。第五天27日：玩家成功通关一次玄界化境，将获得翡翠匣*1。（开启后可获得绝学章节及极品武魂）；元气碎片*1。获得的元气碎片可在大使处换取高级炼化石或者新版体验武器（限时）",
	AwardType = {1,0,0},
	Award = {
	{icon = 26536 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {9},
		Day = {23,24,25,26,27},
		WDay = {7},
		IsRegular = true,
		Segment = {{0,0,0}},
	},
	TimeDesc = "2016年9月23日-2016年9月27日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = true,
}
--英雄荣耀归来 等级直升
Campaign.Config[382] =
{
	ID = {9938},
	Name = "荣耀归来",
	Icon = 11708,
	Type = 1,
	Level = {Min = 30, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {91189},
	location = "衡山城 回归大使",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       2016年9月23日—2016年10月7日，大于30天以上未登录游戏的玩家，登陆游戏后可去衡山城回归大使处领取直升礼包。一周内，每日还可在活动大使处领取额外登陆礼包。",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {9},
		Day = {23,24,25,26,27,28,29,30},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2016年9月23日—2016年10月7日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = false,
}
--英雄荣耀归来 等级直升-续
Campaign.Config[383] =
{
	ID = {9938},
	Name = "荣耀归来",
	Icon = 11708,
	Type = 1,
	Level = {Min = 30, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {91189},
	location = "衡山城 回归大使",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       2016年9月23日—2016年10月7日，大于30天以上未登录游戏的玩家，登陆游戏后可去衡山城回归大使处领取直升礼包。一周内，每日还可在活动大使处领取额外登陆礼包。",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {10},
		Day = {1,2,3,4,5,6,7},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2016年9月23日—2016年10月7日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = false,
}
--]]
----4V1对抗副本
Campaign.Config[384] =
{
	ID = {9928},
	Name = "【每日】秦陵對決",
	Icon = 27225,
	Type = 1,
	Level = {Min = 95, Max = 0},
	PlayerNum = {Min = 5, Max = 6},
	DelvNpc = {},
	location = "",
	TaskLimit = {TaskID = 1237, Times = 5},
	Desc = "      每日11:30-14:30以及20:00-23：00，秦陵對抗副本模式中，玩家將每日限次通過全服匹配機制，分配到一個副本中，並根據隱藏評分分成挑戰組和防守組兩個對立勢力。挑戰組（4人）正常挑戰副本，防守組（1人）為副本操控者。副本操控者將進入上帝視角，通過全新介面，副本操控者將使用設計好的特殊卡牌技能阻止闖關玩家進行副本。副本獎勵將根據雙方表現而定。",
	AwardType = {1,0,0},
	Award = {
	{icon = 11191 , tip = "豐厚獎勵"},
	},
	ReportTime = true,
	Time =
	{
		Month = {0},
		Day = {0},
		WDay = {7},
		IsRegular = false,
		Segment = {{11,30,180},{20,00,180}},
	},
	TimeDesc = "每日11:30-14:30以及20:00-23：00",
	Quality = 86,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = true,
}
--[[

----放开那个奸细-续
Campaign.Config[385] =
{
	ID = {7619},
	Name = "【国庆不打烊】放开那个奸细",
	Icon = 11708,
	Type = 1,
	Level = {Min = 30, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {84982},
	location = "洛阳城 冀飞虎",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       2016年10月1日-2016年10月7日活动期间，去冀飞虎将军处领取任务，进入阴山草原副本，3名入场玩家随机一名变成奸细，血蓝达到怪物标准，其他玩家把他打死，才发现上当，死去的玩家复活，3人一起对付真正的奸细BOSS，打死BOSS后出图领取奖励。",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {10},
		Day = {1,2,3,4,5,6,7},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2016年10月1日-2016年10月7日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = true,
}
----戎马丹心-续
Campaign.Config[386] =
{
	ID = {9921},
	Name = "【国庆不打烊】戎马丹心",
	Icon = 11708,
	Type = 1,
	Level = {Min = 30, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {91031},
	location = "洛阳城 活动大使",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       出鞘剑，赤血燃，将士铁甲不惧染尘亦坚守四方，保家卫国。正值佳节，众侠士代表朝廷嘉奖镇守四方的将士，并将以此为榜样。2016年10月1日-2016年10月7日活动期间，玩家需要到指定地点拜访镇守在四处的将士，并向他们奉上慰问礼品，并可以接受他们的委托，帮助他们解决一些难题。\r       1、遍访忠良，从活动大使处接受任务，需要拜访的将士为孙镇疆（天下会）、翼飞虎（阴山）、徐梁（洛阳）、破敌（边境），向他们赠送朝廷所送下的“精忠报国”牌匾/令牌。\r       2、，从活动大使处接受任务，依次在边境慰问三位边防将士，并像他们学习博斗之术。学习完成后获得限时称号【赤子丹心】。\r       3、边疆急召，在边境指挥使处领取战斗物资，交给铁匠铺老板秦略，在活动期间可多次完成该任务。运送次数达到一定次数，可以获得特殊称号。",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {10},
		Day = {1,2,3,4,5,6,7},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2016年10月1日-2016年10月7日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = true,
}
----<国庆>签到领奖
Campaign.Config[387] =
{
	ID = {9919},
	Name = "【国庆】每日签到",
	Icon = 11708,
	Type = 1,
	Level = {Min = 20, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {91031},
	location = "福州城、衡山城、洛阳城 活动大使",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       2016年9月23日—2016年10月30日，活动开启期间，每天至活动大使处签到可获得奖励，越往后奖励越丰富。",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {9},
		Day = {23,24,25,26,27,28,29,30},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2016年9月23日—2016年10月30日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = false,
}

----<国庆>签到领奖-续
Campaign.Config[388] =
{
	ID = {9919},
	Name = "【国庆】每日签到",
	Icon = 11708,
	Type = 1,
	Level = {Min = 20, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {91031},
	location = "福州城、衡山城、洛阳城 活动大使",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       2016年9月23日—2016年10月30日，活动开启期间，每天至活动大使处签到可获得奖励，越往后奖励越丰富。",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {10},
		Day = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2016年9月23日—2016年10月30日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = false,
}
--每日领取活力草
Campaign.Config[389] =
{
	ID = {9963},
	Name = "每日领取活力草",
	Icon = 11708,
	Type = 1,
	Level = {Min = 1, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {91031},
	location = "福州城、衡山城、洛阳城 活动大使",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       2016年11月2日-11月6日每天18：00—22：00，活动时间内，玩家上线找活动大使领取任务后，累计在线1小时，即可获得2个活力草。玩家使用活力草后可获得50点活力。活力草须在24小时内使用，过期将自动消失。",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {11},
		Day = {2,3,4,5,6},
		WDay = {7},
		IsRegular = true,
		Segment = {{18,00,240}},
	},
	TimeDesc = "2016年11月2日-11月6日每天18：00—22：00",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = false,
}
--全服双倍
Campaign.Config[390] =
{
	ID = {9964},
	Name = "全服双倍",
	Icon = 11708,
	Type = 1,
	Level = {Min = 1, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {},
	location = "",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       2016年11月6日-11月12日每天18：00—23：00，活动时间内，全服双倍开启。",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {11},
		Day = {6,7,8,9,10,11,12},
		WDay = {7},
		IsRegular = true,
		Segment = {{18,00,300}},
	},
	TimeDesc = "2016年11月6日-11月12日每天18：00—23：00",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = false,
}
--活跃度送豪礼
Campaign.Config[391] =
{
	ID = {9965},
	Name = "活跃度送豪礼",
	Icon = 11708,
	Type = 1,
	Level = {Min = 60, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {91031},
	location = "福州城、衡山城、洛阳城 活动大使",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       2016年11月9日-11月16日活动时间内，满足活动条件的玩家每日活跃度达到一定阶段，可以找活动大使额外领取光棍节福利。\r       活跃度35，奖励绑银10D；\r       活跃度50，奖励传奇装备材料一套；\r       活跃度70，奖励装备材料礼包两套以及月尘砂礼包（可开出随机数量的月尘砂）一份。",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {11},
		Day = {9,10,11,12,13,14,15,16},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2016年11月6日-11月12日每天18：00—23：00",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = false,
}
--在线送豪礼
Campaign.Config[392] =
{
	ID = {9966},
	Name = "在线送豪礼",
	Icon = 11708,
	Type = 1,
	Level = {Min = 1, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {},
	location = "",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       2016年11月16日-11月23日维护前，活动期间玩家累计在线时长超过一定时长，即可获得相应数量的宝石碎片，在线时间越长，奖励越丰富。\r       24小时：三级宝石碎片4个；\r       48小时：蓝色风物志碎片*1，三级宝石碎片6个；\r       72小时：蓝色风物志碎片*2，三级宝石碎片8个；\r       96小时：蓝色风物志碎片*3，三级宝石碎片10个；\r       120小时：蓝色风物志碎片*4，三级宝石碎片15个。",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {11},
		Day = {16,17,18,19,20,21,22},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2016年11月16日-11月23日维护前",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = false,
}
--缉拿小虎
Campaign.Config[393] =
{
	ID = {9989},
	Name = "缉拿小虎",
	Icon = 11708,
	Type = 1,
	Level = {Min = 40, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {},
	location = "衡山城",
	location = "",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       2016年12月14日维护后-12月19日，活动期间衡山城将在每日8:00后随机刷新1个NPC小虎。对小虎做表情“招手”，即可获得星尘砂*50。之后在线满1小时、3小时、5小时，还可分别获得：三级宝石碎片*3、驱虫香根礼包、月尘砂礼包。",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {12},
		Day = {14,15,16,17,18,19},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2016年12月14日维护后-12月19日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = false,
}
--签到活动
Campaign.Config[394] =
{
	ID = {10000},
	Name = "【火爆年末】每日签到",
	Icon = 11708,
	Type = 1,
	Level = {Min = 20, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {},
	location = "",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      2016年12月21日——2017年1月24日，活动期间点击游戏屏幕左上角小地图下方的签到图标，即可打开签到界面。签到后玩家朋友们将获得各种丰厚的奖励，累计签到次数越多，奖励就越丰富哦！",
	AwardType = {1,0,0},
	Award = {
	{icon = 11191 , tip = "经验"},
	},
	ReportTime = true,
	Time =
	{
		Month = {12},
		Day = {21,22,23,24,25,26,27,28,29,30,31},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2016年12月21日——2017年1月24日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = true,
}
--签到活动-续
Campaign.Config[395] =
{
	ID = {10000},
	Name = "【火爆年末】每日签到",
	Icon = 11708,
	Type = 1,
	Level = {Min = 20, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {},
	location = "",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      2016年12月21日——2017年1月24日，活动期间点击游戏屏幕左上角小地图下方的签到图标，即可打开签到界面。签到后玩家朋友们将获得各种丰厚的奖励，累计签到次数越多，奖励就越丰富哦！",
	AwardType = {1,0,0},
	Award = {
	{icon = 11191 , tip = "经验"},
	},
	ReportTime = true,
	Time =
	{
		Month = {1},
		Day = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2016年12月21日——2017年1月24日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = true,
}
--世界BOSS
Campaign.Config[396] =
{
	ID = {9734},
	Name = "【火爆年末】天降宝箱",
	Icon = 11708,
	Type = 1,
	Level = {Min = 40, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {},
	location = "",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      2016年12月25日——2017年1月2日，华山、少室山以及五霸岗每2个小时刷新一次boss！玩家击杀boss后，boss会掉落宝箱。打开宝箱可任意获得烟花、风物石、1朵玫瑰、限时坐骑、限时宠物以及限时琉璃武器等豪华大礼。PS：玩家采集宝箱需要10S，期间可被技能打断！",
	AwardType = {1,0,0},
	Award = {
	{icon = 11191 , tip = "经验"},
	},
	ReportTime = true,
	Time =
	{
		Month = {12},
		Day = {25,26,27,28,29,30,31},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2016年12月25日——2017年1月2日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = true,
}
--世界BOSS-续
Campaign.Config[397] =
{
	ID = {9734},
	Name = "【火爆年末】天降宝箱",
	Icon = 11708,
	Type = 1,
	Level = {Min = 40, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {},
	location = "",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      2016年12月25日——2017年1月2日，华山、少室山以及五霸岗每2个小时刷新一次boss！玩家击杀boss后，boss会掉落宝箱。打开宝箱可任意获得烟花、风物石、1朵玫瑰、限时坐骑、限时宠物以及限时琉璃武器等豪华大礼。PS：玩家采集宝箱需要10S，期间可被技能打断！",
	AwardType = {1,0,0},
	Award = {
	{icon = 11191 , tip = "经验"},
	},
	ReportTime = true,
	Time =
	{
		Month = {1},
		Day = {1,2},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2016年12月25日——2017年1月2日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = true,
}
--签到活动
Campaign.Config[398] =
{
	ID = {9014},
	Name = "【火爆年末】灵草兑换",
	Icon = 11708,
	Type = 1,
	Level = {Min = 20, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {},
	location = "",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      2016年12月21日（维护后）-2016年12月24日期间，找东方姑娘接取花缘任务，只要对其他玩家使用鲜花，即可获得一定数量的灵草；每日每种“花缘任务”只能领取一次，领取任务后对其他玩家使用玫瑰，都可以获得相应的灵草奖励，玫瑰品阶越高，奖励越丰富；\r       1朵玫瑰对应1株灵草，99朵玫瑰对应20株灵草，999朵玫瑰对应50株灵草，9999朵玫瑰对应200株灵草。",
	AwardType = {1,0,0},
	Award = {
	{icon = 11191 , tip = "经验"},
	},
	ReportTime = true,
	Time =
	{
		Month = {12},
		Day = {21,22,23,24},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2016年12月21日（维护后）-2016年12月24日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = true,
}
--圣诞礼袜
Campaign.Config[399] =
{
	ID = {9972},
	Name = "【火爆年末】圣诞礼袜",
	Icon = 25821,
	Type = 1,
	Level = {Min = 30, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {96408},
	location = "洛阳城 圣诞老人",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       活动时间：12月23日-31日\r      活动期间，每天在圣诞老人处领取圣诞袜，将圣诞袜绑在洛阳城中的圣诞树上，累积在线时间超过60分钟，圣诞老人就会把装好礼物的袜子塞在你的包裹里（获得礼包“圣诞礼袜”），打开就能获得意想不到的奖励（随机）！圣诞树只在冰雪新愿活动之后刷新，各位侠士务必抓紧时间完成任务哟~",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {12},
		Day = {23,24,25,26,27,28,29,30,31},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2016年12月23日-12月31日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = false,
}
--瑞雪寻宝
Campaign.Config[400] =
{
	ID = {9973},
	Name = "【火爆年末】瑞雪寻宝",
	Icon = 21382,
	Type = 1,
	Level = {Min = 30, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {96408},
	location = "洛阳城",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       活动时间：12月23日-31日 每日12:00-12:15,19:00-19:15\r      贪玩的雪人们将圣诞老人的礼物偷偷藏在了洛阳城的各个角落。寻找礼物或从雪人手中抢夺礼物，每日集齐20个还给圣诞老人，就能获得圣诞老人的报酬~",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {12},
		Day = {23,24,25,26,27,28,29,30,31},
		WDay = {7},
		IsRegular = false,
		Segment = {{12,00,15},{19,00,15}},
	},
	TimeDesc = "2016年12月23日-12月31日每日12:00-12:15,19:00-19:15",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = true,
}
--平安夜大餐
Campaign.Config[401] =
{
	ID = {9996},
	Name = "【火爆年末】平安夜大餐",
	Icon = 5027,
	Type = 1,
	Level = {Min = 30, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {96408},
	location = "洛阳城 圣诞老人",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       活动时间：12月24日\r      对吃货来说，爱TA就是请TA吃大餐！平安夜的时候，圣诞老人会赠送大家平安夜大餐，不同的美味佳肴有不同的功效。大家一起分享平安夜大餐吧~",
	AwardType = {1,0,0},
	Award = {
	{icon = 5027 , tip = "平安夜大餐"},
	},
	ReportTime = true,
	Time =
	{
		Month = {12},
		Day = {24},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2016年12月24日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = false,
}
--在线得圣诞星
Campaign.Config[402] =
{
	ID = {9997},
	Name = "【火爆年末】在线得圣诞星",
	Icon = 11708,
	Type = 1,
	Level = {Min = 40, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {91031},
	location = "洛阳城 活动大使",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       活动时间：12月21日-28日\r      活动期间内，找活动大使领取任务，累计时长分别60分钟、120分钟、240分钟、360分钟、480分钟、720分钟、900分钟即可获得幸运星。幸运星，可以随机开出风物石，根骨丹，武魂经验丹，3级宝石碎片，角珊瑚，刺珊瑚道具。完成120分钟任务后，还将额外获得活力草*1。",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {12},
		Day = {21,22,23,24,25,26,27,28},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2016年12月21日-12月28日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = false,
}

--铃儿叮当
Campaign.Config[403] =
{
	ID = {10008},
	Name = "【火爆年末】铃儿叮当",
	Icon = 11708,
	Type = 1,
	Level = {Min = 40, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {96408},
	location = "洛阳城 圣诞老人",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       活动时间：12月21日——1月11日\r      圣诞老人在偷懒哦！快去叫醒他领取礼物吧~!",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {12},
		Day = {21,22,23,24,25,26,27,28,29,30,31},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2016年12月21日——1月11日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = false,
}
--铃儿叮当-续
Campaign.Config[404] =
{
	ID = {10008},
	Name = "【火爆年末】铃儿叮当",
	Icon = 11708,
	Type = 1,
	Level = {Min = 40, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {96408},
	location = "洛阳城 圣诞老人",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       活动时间：12月21日——1月11日\r      圣诞老人在偷懒哦！快去叫醒他领取礼物吧~!",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {1},
		Day = {1,2,3,4,5,6,7,8,9,10,11},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2016年12月21日——1月11日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = false,
}

--元旦财神到副本
Campaign.Config[405] =
{
	ID = {10010},
	Name = "【火爆年末】财神到",
	Icon = 11708,
	Type = 1,
	Level = {Min = 30, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {84982},
	location = "洛阳城 冀飞虎",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       活动时间：1月1日——1月10日\r      元旦佳节，玉帝派财神下凡为人们送去财运。但却有邪祟趁机作乱，妄图阻挠财神之行。财神委托侠士们组队护送他、清理沿途的邪祟，并允诺各位侠士，在到达终点之后，就有好礼相送~",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {1},
		Day = {1,2,3,4,5,6,7,8,9,10},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2017年1月1日——1月10日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = false,
}
----【囍迎新春】代币商店
Campaign.Config[406] =
{
	ID = {8000},
	Name = "【囍迎新春】代币商店",
	Icon = 11708,
	Type = 1,
	Level = {Min = 1, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {83079},
	location = "洛阳城 福海",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      囍迎新春，2017年1月25日-2017年2月27日活动期间，玩家可在各大主城东方姑娘旁边的商人福海处，使用代币兑换各种珍贵道具。\r       活动结束将不能再进行兑换，各位大侠请抓紧时间哦~！",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {1},
		Day = {25,26,27,28,29,30,31},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2017年1月25日-2017年2月27日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = false,
}
----【囍迎新春】代币商店-续
Campaign.Config[407] =
{
	ID = {8000},
	Name = "【囍迎新春】代币商店",
	Icon = 11708,
	Type = 1,
	Level = {Min = 1, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {83079},
	location = "洛阳城 福海",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      囍迎新春，2017年1月25日-2017年2月27日活动期间，玩家可在各大主城东方姑娘旁边的商人福海处，使用代币兑换各种珍贵道具。\r       活动结束将不能再进行兑换，各位大侠请抓紧时间哦~！",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {2},
		Day = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2017年1月25日-2017年2月27日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = false,
}
--]]
----【囍迎新春】在线即领黄金宝箱
Campaign.Config[408] =
{
	ID = {9057},
	Name = "【囍迎新春】在线即领黄金宝箱",
	Icon = 11708,
	Type = 1,
	Level = {Min = 30, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {77089},
	location = "洛阳城 东方姑娘",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       囍迎新春，2018年1月17日-2018年2月28日，活动期间，玩家上线即可领取黄金宝箱，只能领取一次哟！\r       在2018年1月17日——2018年2月13日期间，每天可领取2把黄金钥匙，要等待2小时哟！\r       在2018年2月14日——2018年2月22日期间，每天可领取8把黄金钥匙，要等待2小时哟！\r       在2018年2月23日——2018年2月28日期间，每天可领取2把黄金钥匙，要等待2小时哟！",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {1},
		Day = {17,18,19,20,21,22,23,24,25,26,27,28,29,30,31},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2018年1月17日-2018年2月28日",
	Quality = 99.6,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = false,
}
----【囍迎新春】在线即领黄金宝箱-续
Campaign.Config[409] =
{
	ID = {9057},
	Name = "【囍迎新春】在线即领黄金宝箱",
	Icon = 11708,
	Type = 1,
	Level = {Min = 30, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {77089},
	location = "洛阳城 东方姑娘",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       囍迎新春，2018年1月17日-2018年2月28日，活动期间，玩家上线即可领取黄金宝箱，只能领取一次哟！\r       在2018年1月17日——2018年2月13日期间，每天可领取2把黄金钥匙，要等待2小时哟！\r       在2018年2月14日——2018年2月22日期间，每天可领取8把黄金钥匙，要等待2小时哟！\r       在2018年2月23日——2018年2月28日期间，每天可领取2把黄金钥匙，要等待2小时哟！",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {2},
		Day = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2018年1月17日-2018年2月28日",
	Quality = 99.6,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = false,
}
--[[
----【囍迎新春】花灯制作
Campaign.Config[410] =
{
	ID = {9064},
	Name = "【囍迎新春】花灯制作",
	Icon = 11708,
	Type = 1,
	Level = {Min = 30, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {77089},
	location = "洛阳城 东方姑娘",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       囍迎新春，2017年2月11日-2017年2月21日，活动期间，玩家帮助东方姑娘收集材料，在东方姑娘的指导下制作花灯并获得丰厚奖励。",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {2},
		Day = {11,12,13,14,15,16,17,18,19,20,21},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2017年2月11日-2017年2月21日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = false,
}
----【囍迎新春】放花灯任务
Campaign.Config[411] =
{
	ID = {9068},
	Name = "【囍迎新春】放花灯任务",
	Icon = 11708,
	Type = 1,
	Level = {Min = 30, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {77089},
	location = "洛阳城 东方姑娘",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       囍迎新春，2017年2月11日-2017年2月21日每日19:00-23:00，活动期间，玩家帮助东方姑娘找到宫女元宵，放飞元宵花灯",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {2},
		Day = {11,12,13,14,15,16,17,18,19,20,21},
		WDay = {7},
		IsRegular = true,
		Segment = {{19,00,240}},
	},
	TimeDesc = "2017年2月11日-2017年2月21日每日19:00-23:00",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = false,
}
----【囍迎新春】放开那个BOSS
Campaign.Config[412] =
{
	ID = {8999},
	Name = "【囍迎新春】放开那个BOSS",
	Icon = 11708,
	Type = 1,
	Level = {Min = 50, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {},
	location = "",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       六道轮回中的叛逆盗出了轮回中的各种宝物，潜逃了出来，幽隐无奈，委托人前往追捕逆贼，降伏了六道叛逆者即可拥有他们盗走的财宝，顿时引发了无数江湖好汉竞相追捕！\r       2017年1月18日-2017年1月27日期间每天晚上19点至23点，玩家皆可前往华山、少室山、五霸岗三地，捉拿六道叛贼，抢夺他们身上携有的绝学章节、绝学残页、极品武魂、极品装备、转运珠等宝物！（友情提示：世界Boss活动掉落均为不绑定，归属仇恨最高的队伍，活动期间每日仅刷新一次且仅在0线刷新）",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {1},
		Day = {18,19,20,21,22,23,24,25,26,27},
		WDay = {7},
		IsRegular = true,
		Segment = {{19,00,240}},
	},
	TimeDesc = "2017年1月18日-2017年1月27日期间每天晚上19点至23点",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = false,
}
----<囍迎新春>花香伴你升级
Campaign.Config[413] =
{
	ID = {10024},
	Name = "【囍迎新春】花香伴你升级",
	Icon = 11708,
	Type = 1,
	Level = {Min = 30, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {96577},
	location = "洛阳城 香雪海",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       2017年1月18日-2017年1月24日，活动期间找香雪海接取花缘任务，只要对其他玩家使用鲜花，即可获得海量经验；每日每种“花缘任务”只能领取一次，领取任务后对其他玩家使用鲜花，都可以获得相应的经验奖励，鲜花品阶越高，奖励越丰富；此外，排行榜前十名的玩家，还可获得额外奖励，第一名还将赢得特效时装哦！",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {1},
		Day = {18,19,20,21,22,23,24},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2017年1月18日-2017年1月24日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = false,
}
----<囍迎新春>站街拿好礼
Campaign.Config[414] =
{
	ID = {10019},
	Name = "【囍迎新春】在线拿好礼",
	Icon = 11708,
	Type = 1,
	Level = {Min = 30, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {91031},
	location = "洛阳城 福州城 衡山城 活动大使",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       2017年1月25日8:00——2017年2月1日8:00，活动期间玩家上线后即找活动大使接任务，每天累计在线30分钟，60分钟，120分钟，180分钟即可领取相应奖励！\r       30分钟：3级宝石碎片*5；\r       60分钟：连城令*15，除恶令*1（任务道具）；\r       120分钟：灵草*20，除恶令*1（任务道具）；\r       180分钟：月辰砂*5，除恶令*1（任务道具）",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {1},
		Day = {25,26,27,28,29,30,31},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2017年1月25日8:00——2017年2月1日8:00",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = false,
}
----<囍迎新春>站街拿好礼-续
Campaign.Config[415] =
{
	ID = {10019},
	Name = "【囍迎新春】在线拿好礼",
	Icon = 11708,
	Type = 1,
	Level = {Min = 30, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {91031},
	location = "洛阳城 福州城 衡山城 活动大使",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       2017年1月25日8:00——2017年2月1日8:00，活动期间玩家上线后即找活动大使接任务，每天累计在线30分钟，60分钟，120分钟，180分钟即可领取相应奖励！\r       30分钟：3级宝石碎片*5；\r       60分钟：连城令*15，除恶令*1（任务道具）；\r       120分钟：灵草*20，除恶令*1（任务道具）；\r       180分钟：月辰砂*5，除恶令*1（任务道具）",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {2},
		Day = {1},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = " 2017年1月25日8:00——2017年2月1日8:00",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = false,
}

----<囍迎新春>活跃度兑换奖励
Campaign.Config[417] =
{
	ID = {10020},
	Name = "【囍迎新春】活跃度兑换奖励",
	Icon = 11708,
	Type = 1,
	Level = {Min = 30, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {91031},
	location = "洛阳城 福州城 衡山城 活动大使",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       2017年2月1日8:00~2017年2月8日 8:00，活动期间，每日活跃度达成以下，即可找活动大使领取丰厚大礼。\r       20活跃度 领取3级宝石碎片*5；\r       50活跃度 领取蓝色风物志碎片*1；\r       70活跃度 活力草*1",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {2},
		Day = {1,2,3,4,5,6,7,8},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2017年2月1日8:00~2017年2月8日8:00",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = false,
}
----<囍迎新春>秦陵对决血符福利
Campaign.Config[418] =
{
	ID = {10022},
	Name = "【囍迎新春】血符福利",
	Icon = 11708,
	Type = 1,
	Level = {Min = 95, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {96101},
	location = "秦陵对决 青乌子",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       2017年2月8日8:00~2017年2月15日8:00，活动期间，完成一次秦岭对决后，可找副本中的NPC青乌子领取200枚血符，每天只能领取一次。",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {2},
		Day = {8,9,10,11,12,13,14,15},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2017年2月8日8:00~2017年2月15日8:00",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = false,
}
----<囍迎新春>领取橙镖令
Campaign.Config[419] =
{
	ID = {10023},
	Name = "【囍迎新春】橙镖助力",
	Icon = 11708,
	Type = 1,
	Level = {Min = 35, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {86285},
	location = "天下会 孙镇疆",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       2017年2月8日8:00~2017年2月15日8:00，活动期间，完成一次支援边疆任务后，可找天下会NPC孙镇疆领取一个橙镖令，每天只能领取一次",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {2},
		Day = {8,9,10,11,12,13,14,15},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2017年2月8日8:00~2017年2月15日8:00",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = false,
}

--春节活动春联对对贴
Campaign.Config[420] =
{
	ID = {6948},
	Name = "【囍迎新春】春联对对贴",
	Icon = 11708,
	Type = 1,
	Level = {Min = 20, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {77089},
	location = "福州城、衡山城、洛阳城东方姑娘处。",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      2017年1月27日-2017年2月10日，领取任务后拿着东方姑娘给你的几副春联寻找三大主城内还没有贴春联的民户，将春联贴到民户的大门上，即可找东方姑娘领取岁岁平安！",
	AwardType = {1,0,0},
	Award = {
	{icon = 11191 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {1},
		Day = {27,28,29,30,31},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2017年1月27日-2017年2月10日",
	Quality = 5,
	CountNum = {Type = 1,ID = 7899},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = true,
}
--春节活动春联对对贴-续
Campaign.Config[421] =
{
	ID = {6948},
	Name = "【囍迎新春】春联对对贴",
	Icon = 11708,
	Type = 1,
	Level = {Min = 20, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {77089},
	location = "福州城、衡山城、洛阳城东方姑娘处。",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      2017年1月27日-2017年2月10日，领取任务后拿着东方姑娘给你的几副春联寻找三大主城内还没有贴春联的民户，将春联贴到民户的大门上，即可找东方姑娘领取岁岁平安！",
	AwardType = {1,0,0},
	Award = {
	{icon = 11191 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {2},
		Day = {1,2,3,4,5,6,7,8,9,10},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2017年1月27日-2017年2月10日",
	Quality = 5,
	CountNum = {Type = 1,ID = 7899},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = true,
}
--春节活动团圆宴
Campaign.Config[422] =
{
	ID = {6949},
	Name = "【囍迎新春】团圆宴",
	Icon = 11708,
	Type = 1,
	Level = {Min = 20, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {77089},
	location = "福州城、衡山城、洛阳城东方姑娘处。",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      2017年1月27日-2017年2月10日，每晚20:00—23:00，前往三大主城的广场宴会区，和众侠士一同享用新春团圆宴,饭饱喝足后，自动获得奖励岁岁平安！",
	AwardType = {1,0,0},
	Award = {
	{icon = 11191 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {1},
		Day = {27,28,29,30,31},
		WDay = {7},
		IsRegular = true,
		Segment = {{20,00,180}},
	},
	TimeDesc = "2017年1月27日-2017年2月10日",
	Quality = 5,
	CountNum = {Type = 1,ID = 7901},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = true,
}
--春节活动团圆宴-续
Campaign.Config[423] =
{
	ID = {6949},
	Name = "【囍迎新春】团圆宴",
	Icon = 11708,
	Type = 1,
	Level = {Min = 20, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {77089},
	location = "福州城、衡山城、洛阳城东方姑娘处。",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      2017年1月27日-2017年2月10日，每晚20:00—23:00，前往三大主城的广场宴会区，和众侠士一同享用新春团圆宴,饭饱喝足后，自动获得奖励岁岁平安！",
	AwardType = {1,0,0},
	Award = {
	{icon = 11191 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {2},
		Day = {1,2,3,4,5,6,7,8,9,10},
		WDay = {7},
		IsRegular = true,
		Segment = {{20,00,180}},
	},
	TimeDesc = "2017年1月27日-2017年2月10日",
	Quality = 5,
	CountNum = {Type = 1,ID = 7901},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = true,
}
--春节活动抢头香
Campaign.Config[424] =
{
	ID = {6950},
	Name = "【囍迎新春】抢头香",
	Icon = 11708,
	Type = 1,
	Level = {Min = 20, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {77089},
	location = "福州城、衡山城、洛阳城东方姑娘处。",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      2017年1月27日-2017年2月10日，前往至少三座寺庙敬上新年的第一炷香，获取相应数量的“新春福禄”，交给东方姑娘后可获得奖励岁岁平安及锦绣坊印花哦！",
	AwardType = {1,0,0},
	Award = {
	{icon = 11191 , tip = "经验"},
	},
	ReportTime = true,
	Time =
	{
		Month = {1},
		Day = {27,28,29,30,31},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2017年1月27日-2017年2月10日",
	Quality = 5,
	CountNum = {Type = 1,ID = 7902},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = true,
}
--春节活动抢头香-续
Campaign.Config[425] =
{
	ID = {6950},
	Name = "【囍迎新春】抢头香",
	Icon = 11708,
	Type = 1,
	Level = {Min = 20, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {77089},
	location = "福州城、衡山城、洛阳城东方姑娘处。",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      2017年1月27日-2017年2月10日，前往至少三座寺庙敬上新年的第一炷香，获取相应数量的“新春福禄”，交给东方姑娘后可获得奖励岁岁平安及锦绣坊印花哦！",
	AwardType = {1,0,0},
	Award = {
	{icon = 11191 , tip = "经验"},
	},
	ReportTime = true,
	Time =
	{
		Month = {2},
		Day = {1,2,3,4,5,6,7,8,9,10},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2017年1月27日-2017年2月10日",
	Quality = 5,
	CountNum = {Type = 1,ID = 7902},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = true,
}
--春节活动上元灯会
Campaign.Config[426] =
{
	ID = {6952},
	Name = "【囍迎新春】上元节",
	Icon = 11708,
	Type = 1,
	Level = {Min = 20, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {77089},
	location = "福州城、衡山城、洛阳城东方姑娘",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      2017年2月11日-2017年2月21日，前往三大主城的上元灯节街区找灯谜NPC猜灯谜，猜对一个灯谜会获得一个任务物品“灯谜奖励”，获得3个“灯谜奖励”后可完成东方姑娘的任务，获得岁岁平安。",
	AwardType = {1,0,0},
	Award = {
	{icon = 11191 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {2},
		Day = {11,12,13,14,15,16,17,18,19,20,21},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2017年2月11日-2017年2月21日",
	Quality = 5,
	CountNum = {Type = 1,ID = 7988},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = true,
}
--签到活动
Campaign.Config[427] =
{
	ID = {10018},
	Name = "【囍迎新春】每日签到",
	Icon = 11708,
	Type = 1,
	Level = {Min = 20, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {},
	location = "",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      2017年2月11日——2017年3月20日，活动期间点击游戏屏幕左上角小地图下方的签到图标，即可打开签到界面。签到后玩家朋友们将获得各种丰厚的奖励，累计签到次数越多，奖励就越丰富哦！",
	AwardType = {1,0,0},
	Award = {
	{icon = 11191 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {2},
		Day = {11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2017年2月11日——2017年3月20日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = true,
}
--签到活动-续
Campaign.Config[428] =
{
	ID = {10018},
	Name = "【囍迎新春】每日签到",
	Icon = 11708,
	Type = 1,
	Level = {Min = 20, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {},
	location = "",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      2017年2月11日——2017年3月20日，活动期间点击游戏屏幕左上角小地图下方的签到图标，即可打开签到界面。签到后玩家朋友们将获得各种丰厚的奖励，累计签到次数越多，奖励就越丰富哦！",
	AwardType = {1,0,0},
	Award = {
	{icon = 11191 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {3},
		Day = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2017年2月11日——2017年3月20日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = true,
}
----【情人节】海誓山盟
Campaign.Config[429] =
{
	ID = {10036},
	Name = "【情人节】海誓山盟",
	Icon = 11708,
	Type = 1,
	Level = {Min = 1, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {77089},
	location = "洛阳城 东方姑娘",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       今年情人节，来点儿新惊喜！即日起，商城将永久上架首款改变天气的浪漫鲜花“海誓山盟”，使用后玩家所处地图将下起梦幻的萌心之雨哦！此外，2017年2月13日-2017年2月25日0点10分，活动期间冲进情圣榜以及花魁榜前10名的玩家，都将在活动结束后获得相应的奖励！排名第一的玩家，还将特效蝴蝶翅膀（限时60天）！快对亲爱的ta使用鲜花，享受浪漫的二人世界吧!\r    获奖的玩家打开游戏界面右下角的排行榜，即可在情圣榜或花魁榜下方点击按钮领取奖励！！",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {2},
		Day = {13,14,15,16,17,18,19,20,21,22,23,24,25},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2017年2月13日-2017年2月25日0点10分",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = false,
}
----<春光好>活跃度兑换奖励
Campaign.Config[437] =
{
	ID = {10043},
	Name = "【春光好】活跃度兑换奖励",
	Icon = 11708,
	Type = 1,
	Level = {Min = 1, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {91031},
	location = "洛阳城 福州城 衡山城 活动大使",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       2017年3月15日~2017年3月19日活动期间，每日完成50活跃度任务即可额外获取手工装备材料礼包*1.每日完成70活跃度任务即可额外获取传奇套装材料礼包*1",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {3},
		Day = {15,16,17,18,19},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2017年3月15日~3月19日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = false,
}
----<春光好>每日神秘大礼
Campaign.Config[438] =
{
	ID = {10050},
	Name = "【春光好】每日神秘大礼",
	Icon = 11708,
	Type = 1,
	Level = {Min = 1, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {91031},
	location = "洛阳城 福州城 衡山城 活动大使",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       2017年3月22日~2017年3月26日活动期间，每日完成指定任务，即可获得神秘大礼\r       3月22日：当日找活动大使接取任务之后，完成盟主难度以上的副本一次（包含绝世本）  额外获得灵草*20\r       3月23日：当日参加秦岭对决一次可额外在中央服兑换使者青乌子处领取奖励  额外获得血符*100\r       3月24日：当日找活动大使接取任务之后，完成70活跃度任务    额外获得魂石*500\r       3月25日：当日完成天下会拉镖任务一次  即可找孙镇疆额外获得橙镖令*1 \r       3月26日：当日找活动大使接取任务之后，完成3次妖楼任务 可额外获得月辰砂*10 ",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {3},
		Day = {22,23,24,25,26},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2017年3月22日~2017年3月26日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = false,
}
----<七夕>拈花一笑
Campaign.Config[439] =
{
	ID = {10051},
	Name = "【七夕】鲜花助力升级",
	Icon = 11708,
	Type = 1,
	Level = {Min = 30, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {96577},
	location = "洛阳城 香雪海",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       8月25日8点~8月31日，活动期间找香雪海接取花缘任务，只要对其他玩家使用鲜花，即可获得海量经验；每日每种“花缘任务”只能领取一次，领取任务后对其他玩家使用鲜花，都可以获得相应的经验奖励，鲜花品阶越高，奖励越丰富！（新服八荒四海、绝世高手不开此活动）",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {8},
		Day = {25,26,27,28,29,30,31},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = " 8月25日8点~8月31日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = false,
}
----<春光好>花堪折时直须折
Campaign.Config[440] =
{
	ID = {10058},
	Name = "【春光好】花堪折时直须折",
	Icon = 11708,
	Type = 1,
	Level = {Min = 1, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {},
	location = "",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       2017年4月19日~2017年4月25日0点10分，活动期间冲进情圣榜以及花魁榜的前十名玩家，都将在活动结束后获得相应的礼包与称号奖励，打开礼包可获得丰富的灵草、橙镖令、根骨丹等奖励，第一名还将获得特效蝴蝶翅膀（限时60天）！快对亲爱的ta使用浪漫鲜花，享受甜蜜的二人世界吧!\r    情圣榜与花魁榜从4月25日0点10分开始发奖，获奖的玩家打开游戏界面右下角的排行榜，即可在情圣榜或花魁榜下方点击按钮领取奖励。玩家需要在4月30日24点之前领取相应奖励，否则会与大奖失之交臂哦~！",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {4},
		Day = {19,20,21,22,23,24,25},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2017年4月19日~2017年4月25日0点10分",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = false,
}
----<春光好>女生节活动
Campaign.Config[441] =
{
	ID = {10055},
	Name = "【女神节】心愿得偿",
	Icon = 11708,
	Type = 1,
	Level = {Min = 30, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {91031},
	location = "洛阳城 福州城 衡山城 活动大使",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "        3月8日女神节，活动大使为各位女侠们准备了小礼物，可有两位女侠的礼物她却不知道如何准备。寒来暑往，这二人在洛阳城中陪伴了玩家一年又一年，你是否也想听听她们的愿望？这愿望背后还揭开了一段十年前的往事……完成任务即可获得大量经验及专属配饰。",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {3},
		Day = {8},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2018年3月8日",
	Quality = 99.6,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = false,
}
----<春光好>三月在线活动
Campaign.Config[442] =
{
	ID = {10056},
	Name = "【春光好】在线得春日礼盒",
	Icon = 11708,
	Type = 1,
	Level = {Min = 30, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {91031},
	location = "洛阳城 福州城 衡山城 活动大使",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       2017年3月8日~2017年3月12日活动期间，玩家每日累计在线1、3、5、7小时即可获得春日礼盒，打开春日礼盒可获得风物石、根骨丹、武魂经验丹、3级宝石碎片、角珊瑚、刺珊瑚。春日礼盒时限为24小时，过期自动消失",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {3},
		Day = {8,9,10,11,12},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2017年3月8日~3月12日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = false,
}
----<春光好>植树节众木成林
Campaign.Config[443] =
{
	ID = {10061},
	Name = "【春光好】众木成林",
	Icon = 11708,
	Type = 1,
	Level = {Min = 30, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {91031},
	location = "洛阳城 福州城 衡山城 活动大使",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       3月12-14日每天12:00-12:20、19:00-19:20，玩家可在活动大使处接任务，领取1枚巨树种子。活动时间内在仙愁峡寻找“树坑”，种下一棵树，消耗一枚种子。种树完成后即可获得奖励。",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {3},
		Day = {12,13,14},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2017年3月12日~3月14日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = false,
}
----<春光好>植树节护林卫士
Campaign.Config[444] =
{
	ID = {10062},
	Name = "【春光好】护林卫士",
	Icon = 11708,
	Type = 1,
	Level = {Min = 30, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {91031},
	location = "洛阳城 福州城 衡山城 活动大使",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       近日来，仙愁峡出现了一支谋求暴利的伐木团伙，肆意地砍伐给仙愁峡居民带来了极大的困扰。3月12日-14日活动期间玩家可向活动大使接取任务，给伐木团伙一些“警告”，让他们知道保护树木的重要性，并为巨树浇水，使森林重焕生机。",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {3},
		Day = {12,13,14},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2017年3月12日~3月14日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = false,
}
----<愚人节>愚人糖果
Campaign.Config[446] =
{
	ID = {10081},
	Name = "【愚人节】愚人糖果",
	Icon = 11708,
	Type = 1,
	Level = {Min = 30, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {91031},
	location = "洛阳城 福州城 衡山城 活动大使",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      活动期间4月1日-3日，在洛阳城的活动大使处领取愚人节糖果，并散发给你觉得“愚蠢”的玩家。第一次收到糖果的玩家会获得称号",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {4},
		Day = {1,2,3},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2017年4月1日~4月3日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = false,
}
----<春光好>在线得注灵道具
Campaign.Config[447] =
{
	ID = {10110},
	Name = "【春光好】在线得注灵道具",
	Icon = 11708,
	Type = 1,
	Level = {Min = 1, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {91031},
	location = "洛阳城 福州城 衡山城 活动大使",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      活动期间4月12日-19日，在线满24、48、72、120小时，可获得灵草礼包、三级宝石碎片、金蚕果等道具。",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {4},
		Day = {12,13,14,15,16,17,18,19},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2017年4月12日~4月19日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = false,
}
----<春光好>在线得琉璃武器
Campaign.Config[448] =
{
	ID = {10109},
	Name = "【春光好】在线得琉璃武器",
	Icon = 11708,
	Type = 1,
	Level = {Min = 70, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {91031},
	location = "洛阳城 福州城 衡山城 活动大使",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      活动期间4月14日-16日，每天20:30-21:30与活动大使对话即可得宝盒。打开宝盒可获得海量经验，14、15、16日还分别有概率获得残页、绝学章节、绝学书盒；黄金、白银武器碎片、琉璃武器；6品武魂。",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {4},
		Day = {14,15,16},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2017年4月14日~4月16日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = false,
}
----<春光好>满活跃送月尘砂
Campaign.Config[449] =
{
	ID = {10101},
	Name = "【春光好】满活跃送月尘砂",
	Icon = 11708,
	Type = 1,
	Level = {Min = 60, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {91031},
	location = "洛阳城 福州城 衡山城 活动大使",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      2017年4月21日-2017年4月23日活动时间内，每日活跃度达到一定阶段，可以找活动大使额外领取活跃度奖励。活跃度35，获得星尘砂*10；活跃度50，获得传奇装备材料一套；活跃度70，获得装备材料礼包两套；满足活跃度70后，还将额外获得月尘砂礼包一份哦（可开出数量的月尘砂）。",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {4},
		Day = {21,22,23},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2017年4月21日-2017年4月23日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = false,
}
----<春光好>周末在线得好礼
Campaign.Config[450] =
{
	ID = {10102},
	Name = "【春光好】周末在线得好礼",
	Icon = 11708,
	Type = 1,
	Level = {Min = 60, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {91031},
	location = "洛阳城 福州城 衡山城 活动大使",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      2017年4月28日，2017年4月29日，2017年4月30日期间每日18:00-24：00，玩家每日累计足够在线时长即可获得丰厚奖励。每日18:00后累计在线1小时：星尘砂礼包（打开后获得星尘砂5~40个）每日18:00后累计在线2小时：月尘砂礼包（打开后获得月尘砂3~10个）每日18:00后累计在线4小时：灵草礼包（打开后获得灵草10~30个）",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {4},
		Day = {28,29,30},
		WDay = {7},
		IsRegular = true,
		Segment = {{18,00,360}},
	},
	TimeDesc = "2017年4月28日，2017年4月29日，2017年4月30日期间每日18:00-24：00",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = false,
}

----<春光好>周末在线得好礼12
Campaign.Config[451] =
{
	ID = {10170},
	Name = "【周末在线】好礼拿不停",
	Icon = 11708,
	Type = 1,
	Level = {Min = 60, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {91031},
	location = "洛阳城 福州城 衡山城 活动大使",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      2017年5月6日，2017年5月7日,2017年5月13日以及2017年5月14日四天的每日18:00-24：00，玩家每日累计足够在线时长即可获得丰厚奖励。每日18:00后累计在线1小时：风物石礼包（打开后获得风物石10~40个）每日18:00后累计在线2小时：宝石结晶礼包（打开后获得宝石结晶10~30个）每日18:00后累计在线3.5小时：3级宝石碎片礼包（打开后获得3级宝石碎片7~14个）",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {5},
		Day = {6,7,13,14},
		WDay = {7},
		IsRegular = true,
		Segment = {{18,00,360}},
	},
	TimeDesc = "2017年5月13日，2017年5月14日期间每日18:00-24：00",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = false,
}
----签到领奖
Campaign.Config[452] =
{
	ID = {10202},
	Name = "每日签到",
	Icon = 11708,
	Type = 1,
	Level = {Min = 20, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {},
	location = "",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       2017年5月19日—2017年6月25日，活动期间，在游戏界面签到处，成功签到，即可获得多种壕礼！",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {5},
		Day = {19,20,21,22,23,24,25,26,27,28,29,30,31},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2017年5月19日—2017年6月25日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = false,
}
----签到领奖-续
Campaign.Config[453] =
{
	ID = {10202},
	Name = "每日签到",
	Icon = 11708,
	Type = 1,
	Level = {Min = 20, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {},
	location = "",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       2017年5月19日—2017年6月25日，活动期间，在游戏界面签到处，成功签到，即可获得多种壕礼！",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {6},
		Day = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2017年5月19日—2017年6月25日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = false,
}
----每日任务
Campaign.Config[454] =
{
	ID = {10201},
	Name = "宠物带回家",
	Icon = 11708,
	Type = 1,
	Level = {Min = 30, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {91031},
	location = "洛阳城 福州城 衡山城 活动大使",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       2017年5月19日—2017年5月23日，每日登录游戏后在活动大使处领取每日任务，完成后即可获得不同奖励。\r       5月19日：成功完成一次鏖战青城任务，可额外获得100个金蚕果，和宠物碎片一个。\r       5月20日：本日活跃度满70，额外获得3级宝石碎片*7，和宠物碎片一个\r       5月21日：本日累计在线时间达到3个小时，将获得风物石*50，和宠物碎片一个\r       5月22日：进入墟市完成挑战，额外获得1级阵石5个，和宠物碎片一个。\r       5月23日：完成一次秦岭对决，额外获得100个血符，和宠物碎片一个。\r       集齐5个宠物碎片，可在NPC活动大使处兑换宠物礼盒，打开后必得极品宠物仙草小鹿（限时15天），更有机会获得永久宠物（长剑萝莉）。",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {5},
		Day = {19,20,21,22,23},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2017年5月19日—2017年5月23日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = false,
}
----欢乐礼盒
Campaign.Config[455] =
{
	ID = {10203},
	Name = "天降豪礼",
	Icon = 11708,
	Type = 1,
	Level = {Min = 50, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {97391},
	location = "洛阳城 欢乐少女",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       2017年5月24日，5月25日，2017年5月26日，5月27日，5月28日,5月29日以及5月30日，活动期间每晚20:00~21:00，在洛阳城NPC欢乐少女（活动大使旁边）处，使用40枚欢乐币可兑换不同类型的欢乐礼盒。礼盒可开出纯白、纯黑等染色、白银黄金琉璃武器、连城令以及绝学章节等丰厚大奖！PS：每次完成龙陵，百毒，绿竹，妖楼活动，均可额外获得道具“欢乐币”（可交易）",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {5},
		Day = {24,25,26,27,28,29,30},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2017年5月19日—2017年6月25日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = false,
}
----整点在线
Campaign.Config[456] =
{
	ID = {10206},
	Name = "策划大放送",
	Icon = 11708,
	Type = 1,
	Level = {Min = 30, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {91031},
	location = "洛阳城 福州城 衡山城 活动大使",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       2017年5月19日,5月20日以及5月21日，每晚19:30~19:55，20:00~20:25,21：30~21:55，活动时间内，在洛阳城NPC活动大使处领取礼盒。（小贴士，只要在活动时间在活动大使处接任务，3个礼盒全部都可以领取哟）！",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {5},
		Day = {19,20,21},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2017年5月19日—2017年6月25日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = false,
}
----回归福利
Campaign.Config[457] =
{
	ID = {10207},
	Name = "回归专属豪礼",
	Icon = 11708,
	Type = 1,
	Level = {Min = 60, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {91189},
	location = "衡山城 回归大使",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       2017年5月19日—2017年7月1日，活动期间，凡是14日以上或者30日以上未登录游戏的玩家，大于等于60级且有充值记录，即可找衡山城回归大使领取相应的回归福利！",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {5},
		Day = {19,20,21,22,23,24,25,26,27,28,29,30,31},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2017年5月19日—2017年7月1日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = false,
}

----回归福利-续
Campaign.Config[458] =
{
	ID = {10207},
	Name = "回归专属豪礼",
	Icon = 11708,
	Type = 1,
	Level = {Min = 60, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {91189},
	location = "衡山城 回归大使",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       2017年5月19日—2017年7月1日，活动期间，凡是14日以上或者30日以上未登录游戏的玩家，大于等于60级且有充值记录，即可找衡山城回归大使领取相应的回归福利！",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {6},
		Day = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2017年5月19日—2017年7月1日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = false,
}
----回归福利-续续
Campaign.Config[459] =
{
	ID = {10207},
	Name = "回归专属豪礼",
	Icon = 11708,
	Type = 1,
	Level = {Min = 60, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {91189},
	location = "衡山城 回归大使",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       2017年5月19日—2017年7月1日，活动期间，凡是14日以上或者30日以上未登录游戏的玩家，大于等于60级且有充值记录，即可找衡山城回归大使领取相应的回归福利！",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {7},
		Day = {1},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2017年5月19日—2017年7月1日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = false,
}
----满活跃度送壕礼
Campaign.Config[460] =
{
	ID = {10208},
	Name = "灵草大派送",
	Icon = 11708,
	Type = 1,
	Level = {Min = 30, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {91031},
	location = "洛阳城 福州城 衡山城 活动大使",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       2017年5月19日-2017年5月24日 （维护前），凡是在活动期间，每日活跃度达到70的玩家，均可额外获得金蚕果*5，灵草*10的奖励！",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {5},
		Day = {19,20,21,22,23,24},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2017年5月19日-2017年5月24日 （维护前）",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = false,
}
----神秘壕礼
Campaign.Config[461] =
{
	ID = {10209},
	Name = "武魂等你拿",
	Icon = 11708,
	Type = 1,
	Level = {Min = 60, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {91031},
	location = "洛阳城 福州城 衡山城 活动大使",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       2017年5月19日—2017年5月26日，活动期间，首次登陆游戏后，在洛阳城NPC活动大使处，可领取神秘宝箱40个。每日在线累计60分钟,120分钟时，240分钟，360分钟时，即可获得黄金钥匙。（可交易） 2.使用黄金钥匙打开宝箱后，可获得灵草，宝石碎片，绝学章节，绝学残页，极品武魂，固元符，强化+6必成符，强化+12必成符等珍稀道具。3.黄金钥匙有一定的时间限制，过期则自动消失，且每人每天至多有5次使用黄金钥匙的机会。PS：小窍门：每日20:00~21:00时，打开宝箱获得极品道具的概率将翻倍噢！",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {5},
		Day = {19,20,21,22,23,24,25,26},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2017年5月19日—2017年5月26日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = false,
}
----充值回馈
Campaign.Config[462] =
{
	ID = {10256},
	Name = "充值回馈，返还宝银",
	Icon = 11708,
	Type = 1,
	Level = {Min = 1, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {91031},
	location = "洛阳城 千小伊",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       2017年5月19日10:00~2017年5月26日 8:30，在活动时间内，根据玩家的历史充值在洛阳城千小伊处（424,5），领取充值元宝数5%的宝银。历史充值结算时间：公测截止到5月19日 8:00。宝银领取上限为80000（价值2000元），超过上限不再返还。领取的宝银记录在角色上，一个角色仅可领取一次。同时只记录本服充值元宝数量，每个服务器的角色只可领取本服宝银！",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {5},
		Day = {19,20,21,22,23,24,25,26},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2017年5月19日10:00~2017年5月26日 8:30",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = false,
}
--]]
----墟市
Campaign.Config[463] =
{
	ID = {10069},
	Name = "【每日】墟市",
	Icon = 27225,
	Type = 1,
	Level = {Min = 60, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {},
	location = "",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      每日20:30-23：00，等級達到60級的玩家可從“戰場”——“活動戰場”處進入墟市。進入墟市後通過擲骰來前進，前進到某格後需要完成對應的玩法才可繼續擲股。如果挑戰玩法失敗可以再次挑戰，也可買通該格守衛前進。通關後即可獲得獎勵，每日第1名、第2-10名、第11-100名完成的俠士還可獲得額外的豐厚獎勵！",
	AwardType = {1,0,0},
	Award = {
	{icon = 11191 , tip = "豐厚獎勵"},
	},
	ReportTime = true,
	Time =
	{
		Month = {0},
		Day = {0},
		WDay = {7},
		IsRegular = false,
		Segment = {{20,30,150}},
	},
	TimeDesc = "每日20:30-23：00",
	Quality = 95,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = true,
}
--[[
----【端午节】饮雄黄
Campaign.Config[464] =
{
	ID = {9230},
	Name = "【端午节】饮雄黄",
	Icon = 11708,
	Type = 1,
	Level = {Min = 30, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {},
	location = "",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      2017年5月30日-2017年6月5日活动期间，前往活动大使处领取任务，通关绿竹、飞龙令、盟主、六道、绝情谷，均可获得“雄黄酒”，饮下雄黄酒后可获得一枚“平安符”，平安符可在活动大使处兑换各种道具。",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {5},
		Day = {30,31},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2017年5月30日-2017年6月5日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = false,
}
----【端午节】饮雄黄-续
Campaign.Config[465] =
{
	ID = {9230},
	Name = "【端午节】饮雄黄",
	Icon = 11708,
	Type = 1,
	Level = {Min = 30, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {},
	location = "",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      2017年5月30日-2017年6月5日活动期间，前往活动大使处领取任务，通关绿竹、飞龙令、盟主、六道、绝情谷，均可获得“雄黄酒”，饮下雄黄酒后可获得一枚“平安符”，平安符可在活动大使处兑换各种道具。",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {6},
		Day = {1,2,3,4,5},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2017年5月30日-2017年6月5日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = false,
}
----【端午节】五色新丝缠角粽
Campaign.Config[466] =
{
	ID = {9229},
	Name = "【端午节】五色新丝缠角粽",
	Icon = 11708,
	Type = 1,
	Level = {Min = 30, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {91031},
	location = "洛阳城 活动大使",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      2017年5月30日-2017年6月5日活动期间，可找活动大使领取“竹叶”，同时接取“糯米”“粽焰”“调料”任务，分别完成绿竹、飞龙令以及绝情谷即可获得相应材料。在洛阳城周掌勺的指导下包粽子，可选择获得甜粽与咸粽，开出不同的奖励。",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {5},
		Day = {30,31},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2017年5月30日-2017年6月5日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = false,
}
----【端午节】五色新丝缠角粽-续
Campaign.Config[467] =
{
	ID = {9229},
	Name = "【端午节】五色新丝缠角粽",
	Icon = 11708,
	Type = 1,
	Level = {Min = 30, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {91031},
	location = "洛阳城 活动大使",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      2017年5月30日-2017年6月5日活动期间，可找活动大使领取“竹叶”，同时接取“糯米”“粽焰”“调料”任务，分别完成绿竹、飞龙令以及绝情谷即可获得相应材料。在洛阳城周掌勺的指导下包粽子，可选择获得甜粽与咸粽，开出不同的奖励。",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {6},
		Day = {1,2,3,4,5},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2017年5月30日-2017年6月5日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = false,
}

----【端午节】驱五毒，佩香包
Campaign.Config[468] =
{
	ID = {9240},
	Name = "【端午节】驱五毒，佩香包",
	Icon = 11708,
	Type = 1,
	Level = {Min = 30, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {91031},
	location = "",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      2017年5月30日-2017年6月5日20：00-23：00活动期间，可找活动大使领取驱五毒BUFF， 驱五毒BUFF可为各位大侠增加10000血上限、1000内功攻击以及1000外功攻击。在五霸岗、华山、少室山、衡山郊外、余杭有五毒BOSS出没，玩家击杀BOSS后可获得丰富的奖励（BOSS掉落归属仇恨最高的队伍）。BOSS死亡后会刷新一定数量的宝箱，打开宝箱可获得各种珍贵道具。",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {5},
		Day = {30,31},
		WDay = {7},
		IsRegular = true,
		Segment = {{20,00,180}},
	},
	TimeDesc = "2017年5月30日-2017年6月5日20：00-23：00",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = false,
}
----【端午节】驱五毒，佩香包-续
Campaign.Config[469] =
{
	ID = {9240},
	Name = "【端午节】驱五毒，佩香包",
	Icon = 11708,
	Type = 1,
	Level = {Min = 30, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {91031},
	location = "",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      2017年5月30日-2017年6月5日20：00-23：00活动期间，可找活动大使领取驱五毒BUFF， 驱五毒BUFF可为各位大侠增加10000血上限、1000内功攻击以及1000外功攻击。在五霸岗、华山、少室山、衡山郊外、余杭有五毒BOSS出没，玩家击杀BOSS后可获得丰富的奖励（BOSS掉落归属仇恨最高的队伍）。BOSS死亡后会刷新一定数量的宝箱，打开宝箱可获得各种珍贵道具。",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {6},
		Day = {1,2,3,4,5},
		WDay = {7},
		IsRegular = true,
		Segment = {{20,00,180}},
	},
	TimeDesc = "2017年5月30日-2017年6月5日20：00-23：00",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = false,
}
--]]
----地宫BOSS
Campaign.Config[470] =
{
	ID = {10265},
	Name = "【每日】地宮boss",
	Icon = 27225,
	Type = 1,
	Level = {Min = 90, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {},
	location = "",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      每日11點、17點、23點，西王母宮上層、西王母宮下層以及秦皇陵地宮一至四層，將同時刷新地宮boss，歡迎各位玩家前去挑戰！成功擊敗地宮boss，玩家將獲得永久長劍蘿莉、靈草、戰技丹等豐富獎勵！Boss掉落歸屬仇恨最高的隊伍！此外，boss刷新後只能存在2個小時，請前往挑戰的玩家抓緊時間。",
	AwardType = {1,0,0},
	Award = {
	{icon = 11191 , tip = "豐厚獎勵"},
	},
	ReportTime = true,
	Time =
	{
		Month = {0},
		Day = {0},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "每日11點、17點、23點",
	Quality = 89,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = true,
}
--[[
----4周年“摇一摇”得大奖
Campaign.Config[471] =
{
	ID = {10275},
	Name = "4周年“摇一摇”得大奖",
	Icon = 11708,
	Type = 1,
	Level = {Min = 30, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {97680},
	location = "福州城 周年庆大使",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       2017年6月25日00:00~2017年7月8日23:55活动期间内，玩家每天可在周年庆大使处(福州城活动大使旁边)领取一个免费的“传说签筒”。每使用一次”传说签筒”（点击右键使用）,玩家即可获得1~6个“上上签”。使用不同数量的上上签，即可在周年庆大使处领取不同奖励。每个玩家每日只可使用上上签兑换奖励1次（建议摇到满意“上上签”数再进行领取），“上上签”数量越多获得奖励越高。\r      玩家还可在商城购买“签筒兑换凭证”找周年庆大使兑换签筒，继续摇一摇以增加“上上签”的数量，使用一次“签筒”可获得0~6个“上上签”，每个玩家每日最多使用签筒10次。",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {6},
		Day = {25,26,27,28,29,30},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "6月25日00:00~7月8日23:55",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = false,
}
----4周年“摇一摇”得大奖-续
Campaign.Config[472] =
{
	ID = {10275},
	Name = "4周年“摇一摇”得大奖",
	Icon = 11708,
	Type = 1,
	Level = {Min = 30, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {97680},
	location = "福州城 周年庆大使",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       2017年6月25日00:00~2017年7月8日23:55活动期间内，玩家每天可在周年庆大使处(福州城活动大使旁边)领取一个免费的“传说签筒”。每使用一次”传说签筒”（点击右键使用）,玩家即可获得1~6个“上上签”。使用不同数量的上上签，即可在周年庆大使处领取不同奖励。每个玩家每日只可使用上上签兑换奖励1次（建议摇到满意“上上签”数再进行领取），“上上签”数量越多获得奖励越高。\r      玩家还可在商城购买“签筒兑换凭证”找周年庆大使兑换签筒，继续摇一摇以增加“上上签”的数量，使用一次“签筒”可获得0~6个“上上签”，每个玩家每日最多使用签筒10次。",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {7},
		Day = {1,2,3,4,5,6,7,8},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "6月25日00:00~7月8日23:55",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = false,
}
----齐心协力，抵抗周年boss
Campaign.Config[473] =
{
	ID = {10276},
	Name = "齐心协力，抵抗周年boss",
	Icon = 11708,
	Type = 1,
	Level = {Min = 1, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {97679},
	location = "感恩的小猫",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       2017年6月22日00:00~2017年6月29日23:59活动期间内，每日15:00~20:00衡山郊外，由15:00开始，每隔1小时刷新1只周年boss，若未被击杀1小时后将消失。请各位玩家组队前往击杀，击杀boss后，boss被击杀的地方将出现NPC感恩的小猫，所有玩家在指定时间与感恩的小猫对话即可获得奖励“4周年boss宝箱”，以及任务道具“周年boss信笺”，玩家可凭借boss信笺，参与“boss信笺，换大奖“活动。PS：感恩的小猫将在击杀boss后的30分钟消失。",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {6},
		Day = {22,23,24,25,26,27,28,29},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2017年6月22日00:00~2017年6月29日23:59",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = false,
}
--]]
--通天塔
Campaign.Config[474] =
{
	ID = {10266},
	Name = "【活動】蕩魔少林",
	Icon = 11708,
	Type = 1,
	Level = {Min = 110, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {},
	location = "",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       每天21：00-22:30之間，所有等級達到110的玩家都可以在“戰場”-“活動戰場”介面報名參加蕩魔少林，通過擊殺怪物獲得大量經驗！",
	AwardType = {1,0,0},
	Award = {
	
	{icon = 9141 , tip = "海量經驗"},
	
	},
	ReportTime = true,
	Time =
	{
		Month = {0},
		Day = {0},
		WDay = {7},
		IsRegular = false,
		Segment = {{21,00,90}},
	},
	TimeDesc = "每天21:00-22:30",
	Quality = 64,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = false,
}--[[
----boss信笺，换大奖
Campaign.Config[475] =
{
	ID = {10277},
	Name = "boss信笺，换大奖",
	Icon = 11708,
	Type = 1,
	Level = {Min = 1, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {97680},
	location = "福州城 周年庆大使",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      6月28日00:00~7月5日23:59活动期间内，玩家都可凭借“神奇的信笺”前往周年庆大使处兑换“周年庆信笺”，每位玩家每日只能兑换6次。获得“周年庆信笺”之后，即可在福州城周年庆大使的商店兑换相应奖励啦！",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {6},
		Day = {28,29,30},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "6月28日00:00~7月5日23:59",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = false,
}
----boss信笺，换大奖-续
Campaign.Config[476] =
{
	ID = {10277},
	Name = "boss信笺，换大奖",
	Icon = 11708,
	Type = 1,
	Level = {Min = 1, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {97680},
	location = "福州城 周年庆大使",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      6月28日00:00~7月5日23:59活动期间内，玩家都可凭借“神奇的信笺”前往周年庆大使处兑换“周年庆信笺”，每位玩家每日只能兑换6次。获得“周年庆信笺”之后，即可在福州城周年庆大使的商店兑换相应奖励啦！",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {7},
		Day = {1,2,3,4,5},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "6月28日00:00~7月5日23:59",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = false,
}

----集藏宝图，寻新门派永久外观
Campaign.Config[477] =
{
	ID = {10278},
	Name = "集藏宝图，寻新门派永久外观",
	Icon = 11708,
	Type = 1,
	Level = {Min = 1, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {},
	location = "",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       7月5日维护后~7月13日 23:59分活动期间内，活动期间，每日15:00~22:00期间，每个整点，蓬莱仙岛，蒙古草原，平凉三处天象都会出现异状，玩家可在这三处地图，寻找到新门派仙踪宝盒。开启仙踪宝盒后，将有机会获得以下道具：除恶令、赤焰结晶、千里传音、仙踪图碎片（1~4）（不绑定）。\r      仙踪图碎片5获得途径说明：玩家可在活动同时关注官方网站，论坛，贴吧活动",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {7},
		Day = {5,6,7,8,9,10,11,12,13},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "7月5日维护后~7月13日 23:59分",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = false,
}
--]]
----2017PK赛
Campaign.Config[478] =
{
	ID = {10271},
	Name = "戰隊PK賽",
	Icon = 11708,
	Type = 1,
	Level = {Min = 1, Max = 0},
	PlayerNum = {Min = 3, Max = 6},
	DelvNpc = {70658},
	location = "瘋癲老頭",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      7月5日至7月13日活動開啟時間：戰隊PK賽進行期間每天的18：00-19：00，每天進行三輪，各戰隊的成員需要組隊到洛陽瘋癲老頭處進行報名，三輪報名時間分別為：18：00-18：05、18：20-18：25、18：40-18：45",
	AwardType = {1,3,0},
	Award = {
	{icon = 11191 , tip = "豐厚大獎"},
	},
	ReportTime = true,
	Time =
	{
		Month = {7},
		Day = {5,6,7,8,9,10,11,12,13},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "每天的18：00-19：00",
	Quality = 99.07,
	CountNum = {Type = 4,ID = 169},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = true,
}
--[[
----签到领奖
Campaign.Config[479] =
{
	ID = {10363},
	Name = "每日签到",
	Icon = 11708,
	Type = 1,
	Level = {Min = 20, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {},
	location = "",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       2017年7月14日—2017年8月25日，活动期间，在游戏界面签到处，成功签到，即可获得多种壕礼！",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {7},
		Day = {14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2017年7月14日—2017年8月25日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = false,
}
----签到领奖-续
Campaign.Config[480] =
{
	ID = {10363},
	Name = "每日签到",
	Icon = 11708,
	Type = 1,
	Level = {Min = 20, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {},
	location = "",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       2017年7月14日—2017年8月25日，活动期间，在游戏界面签到处，成功签到，即可获得多种壕礼！",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {8},
		Day = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2017年7月14日—2017年8月25日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = false,
}
----整点在线，豪礼拿到手软
Campaign.Config[481] =
{
	ID = {10363},
	Name = "整点在线，豪礼拿到手软",
	Icon = 11708,
	Type = 1,
	Level = {Min = 30, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {91031},
	location = "洛阳城 福州城 衡山城 活动大使",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       2017年07月14日,07月15日，07月16日期间，每晚19:30~19:55，20:00~20:25,21：30~21:55，在洛阳城NPC活动大使处领取相应时间段的礼盒。（小贴士，只要在活动时间在活动大使处接任务，3个礼盒全部都可以领取哟）！",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {7},
		Day = {14,15,16},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2017年7月14日—2017年8月25日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = false,
}
----齐心协力抵抗昆仑boss
Campaign.Config[482] =
{
	ID = {10359},
	Name = "齐心协力抵抗昆仑boss",
	Icon = 11708,
	Type = 1,
	Level = {Min = 50, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {},
	location = "",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       7月17日~22日期间每日15:00~23:00，由15:00开始，新地图昆仑山每隔1小时刷新1只boss，若未被击杀1小时后将消失。boss实力很强，请各位玩家组队前往击杀，Boss被击杀后，boss被击杀的地方将会出现NPC绝世高手，本服所有玩家在指定时间与绝世高手对话即可获得奖励“绝世高手奖励”，以及任务道具“绝世高手召集令”，玩家可凭借绝世高手召集令，参与“召集绝世高手“活动。备注：绝世高手将在击杀boss后的30分钟消失。",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {7},
		Day = {17,18,19,20,21,22},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "7月17日~22日，每日15:00~23:00",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = false,
}
----召集绝世高手，领幸运大奖
Campaign.Config[483] =
{
	ID = {10360},
	Name = "召集绝世高手，领幸运大奖",
	Icon = 11708,
	Type = 1,
	Level = {Min = 50, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {},
	location = "",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       7月19日~7月26日，每日21:30~22:30期间，玩家可在余杭点击“绝世高手召集令”随机召唤一名绝世高手。玩家击杀召唤出来的绝世高手后，可获得绝世高手秘笈以及对应的高手碎片。击杀假东方不败后，将不会得到绝世高手秘笈及对应高手碎片！玩家每日最多使用“绝世高手召集令”6次。使用东方不败，任盈盈，令狐冲，林平之，岳不群，岳灵珊对应的碎片，可在活动大使处兑换“绝世高手buff”。每日只可兑换一次buff。使用绝世高手buff后，有神秘的特效，且获得1小时双倍。",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {7},
		Day = {19,20,21,22,23,24,25,26},
		WDay = {7},
		IsRegular = true,
		Segment = {{21,30,60}},
	},
	TimeDesc = "7月19日~7月26日，每日21:30~22:30期间",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = false,
}
----满活跃度送豪礼
Campaign.Config[484] =
{
	ID = {10361},
	Name = "满活跃度送豪礼",
	Icon = 11708,
	Type = 1,
	Level = {Min = 50, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {91031},
	location = "洛阳城 福州城 衡山城 活动大使",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       7月14日~7月21日活动期间，活跃额外送好礼。活动期间，玩家每日完成指定活跃度，即可额外获得活跃度壕礼。完成50额外活跃度，可在活动使者处获得根骨丹*5；完成70额外活跃度，可在活动使者处获得金蚕果*10。",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {7},
		Day = {14,15,16,17,18,19,20,21},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "7月14日~7月21日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = false,
}

----双倍经验，助力江湖
Campaign.Config[485] =
{
	ID = {10362},
	Name = "双倍经验，助力江湖",
	Icon = 11708,
	Type = 1,
	Level = {Min = 1, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {},
	location = "",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       7月14日~7月16日，7月21日~7月23日，7月28日~7月30日18:00~22:00活动期间，全服开启双倍经验。",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {7},
		Day = {14,15,16,21,22,23,28,29,30},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "7月14日~7月16日，7月21日~7月23日，7月28日~7月30日18:00~22:00活动期间",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = false,
}

----7月底在线
Campaign.Config[486] =
{
	ID = {10467},
	Name = "在线拿豪礼 乐享灵草、结晶",
	Icon = 11708,
	Type = 1,
	Level = {Min = 1, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {},
	location = "",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       7月26日维护后~7月30日23:59活动期间，每日在线累计达到1、3、6小时，即可分别获得丰厚的活力草、宝石结晶、灵草奖励。",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {7},
		Day = {26,27,28,29,30},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "7月26日~7月30日活动期间",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = false,
}
----7月底活力
Campaign.Config[487] =
{
	ID = {10468},
	Name = "‘活力’不叫事，挂机不停歇",
	Icon = 11708,
	Type = 1,
	Level = {Min = 1, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {},
	location = "",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       2017年7月28日—2017年8月2日 每天18:00-22:00活动时间内，玩家上线后找活动大使领取任务后，累计在线2小时，即可获得活力药，活力草限制使用时间为24小时。",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {7},
		Day = {28,29,30,31},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2017年7月28日—2017年8月2日 每天18:00-22:00",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = false,
}
----7月底活力续
Campaign.Config[488] =
{
	ID = {10468},
	Name = "‘活力’不叫事，挂机不停歇",
	Icon = 11708,
	Type = 1,
	Level = {Min = 1, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {},
	location = "",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       2017年7月28日—2017年8月2日 每天18:00-22:00活动时间内，玩家上线后找活动大使领取任务后，累计在线2小时，即可获得活力药，活力草限制使用时间为24小时。",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {8},
		Day = {1,2},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2017年7月28日—2017年8月2日 每天18:00-22:00",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = false,
}
----7月底在线改
Campaign.Config[489] =
{
	ID = {10471},
	Name = "在线拿豪礼 乐享灵草、结晶",
	Icon = 11708,
	Type = 1,
	Level = {Min = 1, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {91031},
	location = "洛阳城 活动大使",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       8月2日维护后~8月6日23:59活动期间，每日在线累计达到1、3、6小时，即可分别获得丰厚的活力草、宝石结晶、灵草奖励。",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {8},
		Day = {2,3,4,5,6},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "8月2日~8月6日活动期间",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = false,
}
----种玫瑰，得壕礼
Campaign.Config[490] =
{
	ID = {10476},
	Name = "种玫瑰，得壕礼",
	Icon = 11708,
	Type = 1,
	Level = {Min = 50, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {91031},
	location = "洛阳城 活动大使",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       8月9日-8月16日活动时间内，玩家可每天上线在活动大使处领取玫瑰花种子，并且可在福州郊外进行种植，种植后，累计在线1小时后采集，可获得1个鲜花币，5个风物石。累计在线3小时后采集，可获得3个鲜花币，灵草礼包（打开后可获得3~5棵灵草）。累计在线5小时后采集，可获得5个鲜花币，金蚕果礼包（打开后获得5~10个金蚕果）。备注：每日只可获得一次奖励。",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {8},
		Day = {9,10,11,12,13,14,15,16},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "8月9日-8月16日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = false,
}

----英雄救美
Campaign.Config[491] =
{
	ID = {10477},
	Name = "英雄救美",
	Icon = 11708,
	Type = 1,
	Level = {Min = 40, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {91031},
	location = "洛阳城 活动大使",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       七夕将近，洛阳城大街小巷弥漫着快乐的气息，近期采花盗盗田伯光作案猖獗，掳走不少即将进入新婚殿堂的少女，并将他们隐匿在昆仑!8月17日~8月22日期间每晚20:00~23:59，活动时间内，每个整点昆仑将随机刷出一批“被田伯光掳走的少女”，刷新后20分钟消失。少侠们需在活动时间内，先找活动大使接到解救任务，再前往昆仑山寻找遇险少女，拯救被田伯光掳走并迷惑掉的少女！解救成功之后，会有丰厚的奖励哦！玩家成功解救少女后，必得10个鲜花币，并且可以获得以下物品的一种：（每日只可获得一次奖励）灵草*10,根骨丹*10，强化石*10，高级炼化石*60，阵石精华*1，红宝石染色剂*1，纯白染色剂*1，纯黑染色剂*1，金蚕果*20。",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {8},
		Day = {17,18,19,20,21,22},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "8月9日-8月16日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = false,
}
----周末双倍大狂欢
Campaign.Config[492] =
{
	ID = {10478},
	Name = "周末双倍大狂欢",
	Icon = 11708,
	Type = 1,
	Level = {Min = 1, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {},
	location = "",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "        8月18日，8月19日，8月25日，8月26日，9月1日，9月2日活动期间内，每晚20:00~22:00全服将开启双倍经验俩小时，并且当天满70活跃度的玩家可在活动大使处接取周末狂欢活动，已满70活跃度的玩家在对话后可获得1小时双倍经验buff，可在系统双倍时使用，经验效果更佳！",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {8},
		Day = {18,19,25,26},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "8月9日-8月16日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = false,
}
----周末双倍大狂欢--续
Campaign.Config[493] =
{
	ID = {10478},
	Name = "周末双倍大狂欢",
	Icon = 11708,
	Type = 1,
	Level = {Min = 1, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {},
	location = "",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "        8月18日，8月19日，8月25日，8月26日，9月1日，9月2日活动期间内，每晚20:00~22:00全服将开启双倍经验俩小时，并且当天满70活跃度的玩家可在活动大使处接取周末狂欢活动，已满70活跃度的玩家在对话后可获得1小时双倍经验buff，可在系统双倍时使用，经验效果更佳！",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {9},
		Day = {1,2},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "8月9日-8月16日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = false,
}

----五岳之巅之临阵磨枪
Campaign.Config[494] =
{
	ID = {10479},
	Name = "五岳之巅之临阵磨枪",
	Icon = 11708,
	Type = 1,
	Level = {Min = 1, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {70658},
	location = "洛阳城 疯癫老头",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       8月16日至8月22日每日19点至20点，成功创建战队的玩家在活动时间内，每日在洛阳城的疯癫老头（350，158）处，报名参加比赛，且19点至20点进行三轮比赛。活动期间玩家每日可在疯癫老头处领取“五岳之巅临阵磨枪”任务，集齐三枚“五岳信物”，即可找疯癫老头领取天然染色剂*5，灵草*8，除恶令*2。PS：参加活动需要加入战队并拥有2017年PK赛专属称号才能进入比赛场地；只有参加活动的战队队员才能获得奖励；战斗中将无法使用绝学技能与宝典技能。",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {8},
		Day = {16,17,18,19,20,21,22},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "8月16日至8月22日每日19点至20点",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = false,
}
----七夕副本抢亲
Campaign.Config[495] =
{
	ID = {10487},
	Name = "【七夕】抢亲（副本）",
	Icon = 11708,
	Type = 1,
	Level = {Min = 30, Max = 0},
	PlayerNum = {Min = 3, Max = 0},
	DelvNpc = {98710},
	location = "洛阳城 文祯卿",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       书生文祯卿与将军府中的小姐冰荷相恋，将军却不愿意女儿嫁给一个不习武之人。将军为冰荷主持了比武招亲，文祯卿委托侠士们参加比武招亲，阻止别人娶走冰荷。8月23日维护后~8月31日活动期间，组队在洛阳城文祯卿（425，37）处领取任务并完成副本即可获得丰厚奖励。",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {8},
		Day = {23,24,25,26,27,28,29,30,31},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "8月23日~8月31日活动期间",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = false,
}
----七夕副本佳期会
Campaign.Config[496] =
{
	ID = {10487},
	Name = "【七夕】佳期会（单人副本）",
	Icon = 11708,
	Type = 1,
	Level = {Min = 30, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {98710},
	location = "洛阳城 文祯卿",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       游人如织的回雁楼，近日却传出闹鬼的消息，变得门庭冷落。文祯卿收到一封故友来信，信中所述似与回雁楼有关。文祯卿请你去一探究竟，为他新写的话本故事《人鬼别》提供素材。8月23日维护后~8月31日活动期间，在洛阳城文祯卿（425，37）处领取任务并完成副本即可获得丰厚奖励。",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {8},
		Day = {23,24,25,26,27,28,29,30,31},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "8月23日~8月31日活动期间",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = false,
}
----每日任务拿大奖
Campaign.Config[497] =
{
	ID = {10495},
	Name = "【七夕】每日任务拿大奖",
	Icon = 11708,
	Type = 1,
	Level = {Min = 50, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {91031},
	location = "洛阳城 活动大使",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       2017年8月23日维护后-2017年8月29日23:59时，活动期间，每日在NPC活动大使处领取每日任务，完成后即可获得每日对应奖励。完成每日任务后将额外获得【春风十里不如你】7个字牌对应的字牌。字牌可以进行交易，集齐7个字牌可在洛阳城七夕兑换NPC小漠漠处兑换七夕特殊称号“春风十里不如你”，及获得海量经验。\r      1.8月23日，本日在商城任意消费一次，即可获得1个橙镖令，及令牌【春】。\r      2.8月24日，完成一次天下会运镖，即可获得10个月尘砂，及令牌【风】。\r      3.8月25日，在线达到3个小时，即可获得7个三级宝石碎片，及令牌【十】。\r      4.8月26日，本日完成妖楼6次，即可获得1级阵石礼包*10，及令牌【里】\r      5.8月27日，本日在线达到3个小时，即可获得风物石礼包（可随机获得10~15个风物石），及令牌【不】。\r      6.8月28日，本日送【一朵玫瑰】给其他玩家，即可获得特殊BUFF（一小时双倍经验）及令牌【如】。\r      7.8月29日，本日燃放一次烟花，即可获得金蚕果*10及令牌【你】。",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {8},
		Day = {23,24,25,26,27,28,29},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2017年8月23日维护后-2017年8月29日23:59时",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = false,
}
----燃放烟花，爱的祝福
Campaign.Config[498] =
{
	ID = {10496},
	Name = "【七夕】夫妻专属烟花",
	Icon = 11708,
	Type = 1,
	Level = {Min = 40, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {2704},
	location = "洛阳城 熊童贤",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       8月27日-8月29日活动期间，拥有配偶的玩家可每日在熊童贤处领取4枚烟花，需要玩家在每晚20:30至21:30期间，前往夜阑谷、泰山、剑阁、福州郊外海边分别与配偶燃放烟花，燃放完成后，可在熊童贤处领取丰厚奖励。",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {8},
		Day = {27,28,29},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "8月27日-8月29日活动期间",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = false,
}
----挚爱问答，爱的宣言 
Campaign.Config[499] =
{
	ID = {10497},
	Name = "【七夕】夫妻问答",
	Icon = 11708,
	Type = 1,
	Level = {Min = 50, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {2704},
	location = "洛阳城 熊童贤",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       8月27日-8月29日活动期间，已婚玩家可在洛阳熊童贤处领取任务，回答熊童贤提出的关于七夕的三道问题，完成后需要在墙上题字关于爱的誓言后完成任务，任务完成后可获得熊童贤给出的桃花锦囊（开启后必得：宝石结晶*10，额外获得灵草*10、英侠通宝*5、蓝色风物碎片*1以及限时17年七夕绝版配饰的其中之一）",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {8},
		Day = {27,28,29},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "8月27日-8月29日活动期间",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = false,
}
--]]
----七夕鲜花币兑好礼 
Campaign.Config[500] =
{
	ID = {10498},
	Name = "【七夕】鮮花幣兌好禮",
	Icon = 11708,
	Type = 3,
	Level = {Min = 30, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {98788},
	location = "洛陽城 小漠漠",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       8月23日維護後-9月6日0時，活動時間內玩家每天可在活動內獲得鮮花幣，可在NPC小漠漠處進行兌換。",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "豐厚獎勵"},
	},
	ReportTime = true,
	Time =
	{
		Month = {8},
		Day = {23,24,25,26,27,28,29,30,31},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "8月23日維護後-9月6日0時",
	Quality = 99.08,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = false,
}

----七夕鲜花币兑好礼-续 
Campaign.Config[501] =
{
	ID = {10498},
	Name = "【七夕】鮮花幣兌好禮",
	Icon = 11708,
	Type = 3,
	Level = {Min = 30, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {98788},
	location = "洛陽城 小漠漠",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       8月23日維護後-9月6日0時，活動時間內玩家每天可在活動內獲得鮮花幣，可在NPC小漠漠處進行兌換。",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "豐厚獎勵"},
	},
	ReportTime = true,
	Time =
	{
		Month = {9},
		Day = {1,2,3,4,5},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "8月23日維護後-9月6日0時",
	Quality = 99.09,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = false,
}

----七夕花缘传情-
Campaign.Config[502] =
{
	ID = {10500},
	Name = "五年之约·浪漫携手",
	Icon = 11708,
	Type = 1,
	Level = {Min = 30, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {},
	location = "",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       五年之约，浪漫江湖游，感谢有你一直的陪伴与守候。\r    2018年5月16日-2018年5月25日0点10分，活动期间冲进情圣榜以及花魁榜前10名的玩家，都将在活动结束后获得相应排名的豪华大礼包奖励！排名第一的玩家，还将获得15个红宝石染色剂！\r    获奖的玩家打开游戏界面右下角的排行榜，即可在情圣榜或花魁榜下方点击按钮领取奖励！！",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "豐厚獎勵"},
	},
	ReportTime = true,
	Time =
	{
		Month = {5},
		Day = {16,17,18,19,20,21,22,23,24,25},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2018年3月14日-2018年3月25日0点10分",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = false,
}
--[[
----七夕花缘传情-续
Campaign.Config[503] =
{
	ID = {10500},
	Name = "【双节狂欢】花堪折时直须折",
	Icon = 11708,
	Type = 1,
	Level = {Min = 30, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {},
	location = "",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       只有怒放的鲜花，才能让她心花怒放~!\r    2017年12月20日-2017年12月25日00:10，活动期间冲进情圣榜以及花魁榜前10名的玩家，都将在活动结束后获得相应排名的豪华大礼包奖励！排名第一的玩家，还将获得圣诞专属永久特效时装！爱她，就给她最美的吧~！\r    获奖的玩家打开游戏界面右下角的排行榜，即可在情圣榜或花魁榜下方点击按钮领取奖励！！",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {12},
		Day = {20,21,22,23,24,25},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2017年12月20日-2017年10月25日00:10",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = false,
}
----2017年9月在线送琉璃1
Campaign.Config[504] =
{
	ID = {10511},
	Name = "【秋日馈赠】在线即送琉璃武器",
	Icon = 11708,
	Type = 1,
	Level = {Min = 40, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {91031},
	location = "洛阳城 活动大使",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       活动期间与活动大使进行对话，即可获得以下的奖励：\r    2017年9月8日 20:30—21:30 硕果盒    必得海量经验，随机得残页、绝学章节、绝学书盒\r    2017年9月9日 20:30—21:30 秋实盒  必得海量经验，随机得黄金武器碎片、白银武器碎片、高级炼化石*300，白银武器，黄金武器，琉璃武器。\r    2017年9月10日 20:30—21:30五谷宝盒  必得海量经验，随机得宝银。",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {9},
		Day = {8},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "9月8日~9月10日活动期间",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = false,
}
----2017年9月在线送琉璃2
Campaign.Config[505] =
{
	ID = {10512},
	Name = "【秋日馈赠】在线即送琉璃武器",
	Icon = 11708,
	Type = 1,
	Level = {Min = 40, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {91031},
	location = "洛阳城 活动大使",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       活动期间与活动大使进行对话，即可获得以下的奖励：\r    2017年9月8日 20:30—21:30 硕果盒    必得海量经验，随机得残页、绝学章节、绝学书盒\r    2017年9月9日 20:30—21:30 秋实盒  必得海量经验，随机得黄金武器碎片、白银武器碎片、高级炼化石*300，白银武器，黄金武器，琉璃武器。\r    2017年9月10日 20:30—21:30五谷宝盒  必得海量经验，随机得宝银。",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {9},
		Day = {9},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "9月8日~9月10日活动期间",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = false,
}
----2017年9月在线送琉璃3
Campaign.Config[506] =
{
	ID = {10513},
	Name = "【秋日馈赠】在线即送琉璃武器",
	Icon = 11708,
	Type = 1,
	Level = {Min = 40, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {91031},
	location = "洛阳城 活动大使",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       活动期间与活动大使进行对话，即可获得以下的奖励：\r    2017年9月8日 20:30—21:30 硕果盒    必得海量经验，随机得残页、绝学章节、绝学书盒\r    2017年9月9日 20:30—21:30 秋实盒  必得海量经验，随机得黄金武器碎片、白银武器碎片、高级炼化石*300，白银武器，黄金武器，琉璃武器。\r    2017年9月10日 20:30—21:30五谷宝盒  必得海量经验，随机得宝银。",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {9},
		Day = {10},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "9月8日~9月10日活动期间",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = false,
}
----2017年9月在线送宝石
Campaign.Config[507] =
{
	ID = {10514},
	Name = "【秋日馈赠】在线送宝石灵草",
	Icon = 11708,
	Type = 1,
	Level = {Min = 1, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {},
	location = "",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       2017年9月8日~15日活动期间，达到对应的在线时长即可获得奖励：\r    24小时 灵草礼包，宝石礼包*1\r    48小时 灵草礼包*2，宝石礼包*2\r    72小时 灵草礼包*4，宝石礼包*3\r    120小时 灵草礼包*6，宝石礼包*4",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {9},
		Day = {8,9,10,11,12,13,14,15},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "9月8日~9月15日活动期间",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = false,
}
----2017年9月在线周末双倍
Campaign.Config[508] =
{
	ID = {10515},
	Name = "【秋日馈赠】周末双倍嗨翻天",
	Icon = 11708,
	Type = 1,
	Level = {Min = 1, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {},
	location = "",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       活动期间2017年9月8日—2017年9月10日 、9月15日—2017年9月17日 、9月22—9月24日每日18:00~23:00开启全服双倍经验。",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {9},
		Day = {8,9,10,15,16,17,22,23,24},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "9月8日~9月10日、9月15日-9月17日、9月22日-9月24日活动期间",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = false,
}
----2017年9月在线拿宝银
Campaign.Config[509] =
{
	ID = {10516},
	Name = "【秋日馈赠】在线拿宝银",
	Icon = 11708,
	Type = 1,
	Level = {Min = 40, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {91031},
	location = "洛阳城 活动大使",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       活动时间：9月23日~9月30日\r    活动内容：活动期间，每日在线1小时，3小时，5小时可获得以下奖励。\r    在线1小时，橙镖令*1\r    在线3小时，活力草*1，灵草礼包\r    在线5小时，宝银*400。",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {9},
		Day = {23,24,25,26,27,28,29,30},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "9月23日~9月30日活动期间",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = false,
}
----2017年9月在线宝石结晶
Campaign.Config[510] =
{
	ID = {10517},
	Name = "【秋日馈赠】活跃赠宝石结晶",
	Icon = 11708,
	Type = 1,
	Level = {Min = 60, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {91031},
	location = "洛阳城 活动大使",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       活动期间9月15日~9月22日，每日活动度达到70可额外获得以下奖励：宝石结晶*10。",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {9},
		Day = {15,16,17,18,19,20,21,22},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "9月15日~9月22日活动期间",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = false,
}
----2017年国庆花好月圆
Campaign.Config[511] =
{
	ID = {10531},
	Name = "【双节狂欢】花好月圆",
	Icon = 11708,
	Type = 1,
	Level = {Min = 40, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {94636},
	location = "蓬莱 颜轻眉",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       10月4日、5日，每日20:30~21:00烟花大会期间，可至蓬莱仙岛颜轻眉处凭借‘花’‘好’‘月’‘圆’兑换节日烟花。燃放烟花即可获得丰厚奖励。烟花限时半小时。",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {10},
		Day = {4,5},
		WDay = {7},
		IsRegular = true,
		Segment = {{20,30,30}},
	},
	TimeDesc = "10月4日~10月5日活动期间每晚8点半至9点",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = false,
}
----2017年国庆杖打天狗护玉盘
Campaign.Config[512] =
{
	ID = {9897},
	Name = "【双节狂欢】杖打天狗护玉盘",
	Icon = 11708,
	Type = 7,
	Level = {Min = 30, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {},
	location = "",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      古时有兽曰天狗，其状如狸而白首，其音如榴榴，所堕及炎火，凶可吞日月。仲秋团圆节，本是家家团圆共赏明月之时，天狗却出来捣乱，不仅想要吞噬日月，其身所带的炎火也使所到之处寸草不生。2017年10月1日-2017年10月10日活动期间每日晚7点至11点，每到月亮初上之时，它便会出现在阴山、蓬莱仙岛以及夜岚谷，需要天下侠士齐心协力共同击退它。BOSS死亡后会刷新宝箱。 ",
	AwardType = {1,0,0},
	Award = {
	{icon = 11191 , tip = "海量经验"},
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {10},
		Day = {1,2,3,4,5,6,7,8,9,10},
		WDay = {7},
		IsRegular = false,
		Segment = {{19,00,240}},
	},
	TimeDesc = "2017年10月1日-2017年10月10日活动期间每日晚7点至11点",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = true,
}
----2017年国庆中秋盛宴
Campaign.Config[513] =
{
	ID = {10533},
	Name = "【双节狂欢】中秋盛宴",
	Icon = 11708,
	Type = 1,
	Level = {Min = 30, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {91031},
	location = "洛阳城 活动大使",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       活动期间10月4、5、6日，每天晚上20:00-21:00洛阳城白马寺的僧侣们都会向周围的居民布施斋饭，这些特制的斋饭不仅能填饱肚子，还附带了高僧们的法力加持，食用不同的斋饭可获得不同的buff效果。采集3份斋饭即可完成任务，获得活动大使赠予的额外奖励。",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {10},
		Day = {4,5,6},
		WDay = {7},
		IsRegular = true,
		Segment = {{20,00,60}},
	},
	TimeDesc = "10月4日-10月6日每晚8点至9点",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = false,
}
----2017年国庆斩桂树副本
Campaign.Config[514] =
{
	ID = {10534},
	Name = "【双节狂欢】斩桂树（副本）",
	Icon = 11708,
	Type = 1,
	Level = {Min = 30, Max = 0},
	PlayerNum = {Min = 3, Max = 0},
	DelvNpc = {84982},
	location = "洛阳城 冀飞虎",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       活动期间10月1日~10月10日，组队前往洛阳城的冀飞虎处可进入副本。为了纪念吴刚伐桂的传说，武林盟主派遣诸位侠士在中秋期间一同砍伐桂树。砍伐桂树时，将会受到数波守护桂树的精灵攻击。摆脱精灵的干扰，成功砍伐桂树即可完成副本，并获得武林盟主赐予的奖励以及专属称号。",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {10},
		Day = {1,2,3,4,5,6,7,8,9,10},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "10月1日~10月10日活动期间",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = false,
}
----2017年国庆8天乐，全民一起乐
Campaign.Config[515] =
{
	ID = {10546},
	Name = "【双节狂欢】全民在线一起乐",
	Icon = 11708,
	Type = 1,
	Level = {Min = 1, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {91031},
	location = "洛阳城 活动大使",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       9月30日~10月8日活动期间，玩家每日可在活动大使处领取任务，达到对应的在线时间即可领取对应的奖励。在线1小时，橙镖令*1；在线3小时，活力草*1（限时24小时），双倍经验药*1；在线6小时，蓝色风物志碎片*1，根骨丹*5，月兔的祝福*1",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {9},
		Day = {30},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "9月30日~10月8日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = false,
}
----2017年国庆8天乐，全民一起乐-续
Campaign.Config[516] =
{
	ID = {10546},
	Name = "【双节狂欢】全民在线一起乐",
	Icon = 11708,
	Type = 1,
	Level = {Min = 1, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {91031},
	location = "洛阳城 活动大使",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       9月30日~10月8日活动期间，玩家每日可在活动大使处领取任务，达到对应的在线时间即可领取对应的奖励。在线1小时，橙镖令*1；在线3小时，活力草*1（限时24小时），双倍经验药*1；在线6小时，蓝色风物志碎片*1，根骨丹*5，月兔的祝福*1",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {10},
		Day = {1,2,3,4,5,6,7,8},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "9月30日~10月8日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = false,
}
----2017年神器，染色剂，宝银免费送！
Campaign.Config[517] =
{
	ID = {10547},
	Name = "【双节狂欢】神器宝银免费送",
	Icon = 11708,
	Type = 1,
	Level = {Min = 70, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {91031},
	location = "洛阳城 活动大使",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       10.1~10.8活动期间，完成一次龙陵、百毒、绿竹、妖楼、飞龙令、绝情谷活动，均可额外获得 “繁荣富强”中的一个字（可交易）。使用“繁荣富强”四个字，可找活动大使兑换道具“祈福帖”。且每晚20:00-21:00，在活动大使处可使用祈福帖，兑换道具“祈福礼包”以及月兔的祝福*1。PS：第一次为免费兑换，第二次兑换消耗10D，第三次兑换消耗20D。每日最多兑换祈福礼包3次。",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {10},
		Day = {1,2,3,4,5,6,7,8},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "10.1~10.8",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = false,
}
----签到领奖
Campaign.Config[518] =
{
	ID = {10549},
	Name = "【双节狂欢】每日签到",
	Icon = 11708,
	Type = 1,
	Level = {Min = 20, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {},
	location = "",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       2017年10月1日—2017年11月10日，活动期间，在游戏界面签到处，成功签到，即可获得多种壕礼！",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {10},
		Day = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2017年10月1日—2017年11月10日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = false,
}
----签到领奖-续
Campaign.Config[519] =
{
	ID = {10549},
	Name = "【双节狂欢】每日签到",
	Icon = 11708,
	Type = 1,
	Level = {Min = 20, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {},
	location = "",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       2017年10月1日—2017年11月10日，活动期间，在游戏界面签到处，成功签到，即可获得多种壕礼！",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {11},
		Day = {1,2,3,4,5,6,7,8,9,10},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2017年10月1日—2017年11月10日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = false,
}
----中秋前夕，缘聚蓬莱
Campaign.Config[520] =
{
	ID = {10548},
	Name = "【双节狂欢】中秋缘聚蓬莱",
	Icon = 11708,
	Type = 1,
	Level = {Min = 40, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {},
	location = "",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       10月2日 ，10月3日，活动期间，每晚21:00~24:00期间，每个整点蓬莱仙岛都会刷新出一批宝盒，采集该宝盒后，将获得“花好月圆”中的一个字，月兔的祝福*1以及驱虫香根*10。每个玩家每日最多可采集该宝盒2次。",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {10},
		Day = {2,3},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2017年10月2日—2017年11月3日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = false,
}
----双节全服双倍
Campaign.Config[521] =
{
	ID = {10550},
	Name = "【双节狂欢】全服双倍",
	Icon = 11708,
	Type = 1,
	Level = {Min = 1, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {},
	location = "",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       2017年10月9日—2017年10月15日18：00-22：00，活动期间，全服开始双倍经验。",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {10},
		Day = {9,10,11,12,13,14,15},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2017年10月9日—2017年10月15日18：00-22：00",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = false,
}
----双节生产翻倍
Campaign.Config[522] =
{
	ID = {10551},
	Name = "【双节狂欢】生产翻倍",
	Icon = 11708,
	Type = 1,
	Level = {Min = 1, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {},
	location = "",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       2017年10月9日—2017年10月15日，活动期间全服手工生产成功几率翻倍。",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {10},
		Day = {9,10,11,12,13,14,15},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2017年10月9日—2017年10月15日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = false,
}
--]]
----知音任务活动列表
Campaign.Config[523] =
{
	ID = {10527},
	Name = "知音任务",
	Icon = 11708,
	Type = 1,
	Level = {Min = 40, Max = 0},
	PlayerNum = {Min = 2, Max = 2},
	DelvNpc = {74134},
	location = "洛阳城 令狐冲",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       近日，江湖上出现了一位神秘的调香大师，据说他的香料可以使死人复生、活人青春永驻。令狐冲恰好有他的消息，感兴趣的侠士们不妨去一探究竟。此任务需要考验队员的默契程度，需要互为知己的一男一女两位玩家共同前往才可接取。若你身旁恰无另一半，也可以试试亲友界面的“知音（好友推荐）”功能！完成系列任务后，可获得海量经验、专属称号、专属外观、烟花、好友度丰厚奖励，已结为夫妻的二人共同完成，还可获得神秘奖励哟。（知音任务为周常，每周一0点刷新）",
	AwardType = {1,3,0},
	Award = {
	{icon = 11191 , tip = "海量经验"},
	{icon = 12142 , tip = "烟花"},
	{icon = 12140 , tip = "好友度礼物"},
	{icon = 28616 , tip = "专属外观"},
	},
	ReportTime = false,
	Time =
	{
		Month = {0},
		Day = {0},
		WDay = {7},
		IsRegular = true,
		Segment = {{0,0,0}},
	},
	TimeDesc = "全天开放",
	Quality = 99.69,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = false,
}
--[[
----【双节狂欢】血战药王庙
Campaign.Config[524] =
{
	ID = {8560},
	Name = "【重阳】除恶驱邪",
	Icon = 11708,
	Type = 7,
	Level = {Min = 30, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {84982},
	location = "洛阳城 冀飞虎",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      九月初九，逢凶之日，每到此间，总有邪祟趁虚而入，为祸人间。古有淮南桓景访仙学艺，为民除害。如今古人已逝，还望众侠士肩负起除魔卫道之责。2017年10月28日-2017年11月3日活动期间，每日可在主城冀飞虎处领取任务，进入除恶驱邪副本消除为祸人间的邪祟，任务完成即可获得奖励。 ",
	AwardType = {1,0,0},
	Award = {
	{icon = 11191 , tip = "海量经验"},
	{icon = 12384 , tip = "星尘砂、月尘砂"},
	{icon = 9141 , tip = "其他丰厚大奖"},
	},
	ReportTime = true,
	Time =
	{
		Month = {10},
		Day = {28,29,30,31},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2017年10月28日-2017年11月3日",
	Quality = 2,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = true,
}
----【双节狂欢】血战药王庙-续
Campaign.Config[525] =
{
	ID = {8560},
	Name = "【重阳】除恶驱邪",
	Icon = 11708,
	Type = 7,
	Level = {Min = 30, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {84982},
	location = "洛阳城 冀飞虎",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      九月初九，逢凶之日，每到此间，总有邪祟趁虚而入，为祸人间。古有淮南桓景访仙学艺，为民除害。如今古人已逝，还望众侠士肩负起除魔卫道之责。2017年10月28日-2016年11月3日活动期间，每日可在主城冀飞虎处领取任务，进入除恶驱邪副本消除为祸人间的邪祟，任务完成即可获得奖励。 ",
	AwardType = {1,0,0},
	Award = {
	{icon = 11191 , tip = "海量经验"},
	{icon = 12384 , tip = "星尘砂、月尘砂"},
	{icon = 9141 , tip = "其他丰厚大奖"},
	},
	ReportTime = true,
	Time =
	{
		Month = {11},
		Day = {1,2,3},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2017年10月28日-2016年11月3日",
	Quality = 2,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = true,
}

----准点在线，宝银白送了！
Campaign.Config[526] =
{
	ID = {10610},
	Name = "准点在线，宝银白送了！",
	Icon = 11708,
	Type = 1,
	Level = {Min = 1, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {91031},
	location = "洛阳城 活动大使",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       2017年10月27日，10月28日，10月29日，每日21:00——21：30活动期间，上线找活动大使接取在线任务，即可获得每日礼盒。打开礼盒可获得绝学、宝银、根骨丹以及海量经验等丰富奖励。",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {10},
		Day = {27,28,29},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "10.1~10.8",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = false,
}

----持续在线，每30分钟惊喜不断
Campaign.Config[527] =
{
	ID = {10611},
	Name = "持续在线，每30分钟惊喜不断",
	Icon = 11708,
	Type = 1,
	Level = {Min = 1, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {91031},
	location = "洛阳城 活动大使",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       2017年10月27日~2017年11月10日活动期间，玩家可在活动大使处领取90个宝箱，并需要每日登录后，在活动大使处分别领取对应的在线时长的任务。领取任务后，玩家每在线30分钟，就会得到1个宝箱钥匙（绑定）。使用钥匙打开宝箱即可获得对应奖励。备注：每个玩家每日最多获得6个钥匙。",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {10},
		Day = {27,28,29,30,31},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2017年10月27日~2017年11月10日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = false,
}

----持续在线，每30分钟惊喜不断-续
Campaign.Config[528] =
{
	ID = {10611},
	Name = "持续在线，每30分钟惊喜不断",
	Icon = 11708,
	Type = 1,
	Level = {Min = 1, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {91031},
	location = "洛阳城 活动大使",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       2017年10月27日~2017年11月10日活动期间，玩家可在活动大使处领取90个宝箱，并需要每日登录后，在活动大使处分别领取对应的在线时长的任务。领取任务后，玩家每在线30分钟，就会得到1个宝箱钥匙（绑定）。使用钥匙打开宝箱即可获得对应奖励。备注：每个玩家每日最多获得6个钥匙。",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {11},
		Day = {1,2,3,4,5,6,7,8,9,10},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2017年10月27日~2017年11月10日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = false,
}
----全民杀“鸡” 抢宝银
Campaign.Config[529] =
{
	ID = {10613},
	Name = "全民杀“鸡” 抢壕礼",
	Icon = 11708,
	Type = 1,
	Level = {Min = 40, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {91031},
	location = "洛阳城 活动大使",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      2017年10月27日~2017年11月3日，每日18:00~24:00的每个整点，衡山郊外、少室山、武当山脚三处，将刷新 “鸡”（名称下标注【杀鸡活动】），各位侠士可前往杀鸡，未被及时斩杀的鸡将于刷新后的15分钟消失。侠士斩杀鸡后分为2种情况，第一种情况，鸡说“谁让我生来是鸡”。代表玩家成功斩杀鸡，可获得“杀鸡大礼包”。第二种情况：鸡说“对不起，我是一毛不拔的铁公鸡”，则玩家只能获得一根鸡毛，集齐10根鸡毛可兑换称号。大侠在杀鸡之前需要在活动大使处领取“杀鸡任务哦”~每个玩家每日最多成功杀鸡3次~",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {10},
		Day = {27,28,29,30,31},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2017年10月27日~2017年11月3日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = false,
}
----全民杀“鸡” 抢宝银续
Campaign.Config[530] =
{
	ID = {10613},
	Name = "全民杀“鸡” 抢壕礼",
	Icon = 11708,
	Type = 1,
	Level = {Min = 40, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {91031},
	location = "洛阳城 活动大使",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      2017年10月27日~2017年11月3日，每日18:00~24:00的每个整点，衡山郊外、少室山、武当山脚三处，将刷新 “鸡”（名称下标注【杀鸡活动】），各位侠士可前往杀鸡，未被及时斩杀的鸡将于刷新后的15分钟消失。侠士斩杀鸡后分为2种情况，第一种情况，鸡说“谁让我生来是鸡”。代表玩家成功斩杀鸡，可获得“杀鸡大礼包”。第二种情况：鸡说“对不起，我是一毛不拔的铁公鸡”，则玩家只能获得一根鸡毛，集齐10根鸡毛可兑换称号。大侠在杀鸡之前需要在活动大使处领取“杀鸡任务哦”~每个玩家每日最多成功杀鸡3次~",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {11},
		Day = {1,2,3},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2017年10月27日~2017年11月3日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = false,
}
----每日活跃度70，换惊喜豪礼
Campaign.Config[531] =
{
	ID = {10614},
	Name = "活跃度换宝银",
	Icon = 11708,
	Type = 1,
	Level = {Min = 40, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {91031},
	location = "洛阳城 活动大使",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "     2017年11月8日~2017年11月22日每日活跃度达成70，即可额外获得200宝银，1棵活力草以及‘唯我吃鸡’四字中的任意一个字。集齐‘唯我吃鸡’四字可在活动大使处换得兑换牌，每晚20:00~21:00期间，玩家使用‘唯我吃鸡兑换牌’可在洛阳城活动大使处兑换不同的礼包。备注：每个玩家每日只可换取一次兑换牌。可选择兑换以下道具：（每兑换一个奖励都需要消耗一个兑换牌）根骨丹*10；灵草*10；活力草*1；高级炼化石*60；强化必成+6 *1",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {11},
		Day = {8,9,10,11,12,13,14,15,16,17,18,19,20,21,22},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2017年11月8日~2017年11月22日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = false,
}
----全服双倍
Campaign.Config[532] =
{
	ID = {10615},
	Name = "双倍经验助力江湖",
	Icon = 11708,
	Type = 7,
	Level = {Min = 1, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {},
	location = "",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      2017年10月27日~2017年11月3日，12:00~22:00，全服玩家都将获得双倍经验时间。 ",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},	
	},
	ReportTime = true,
	Time =
	{
		Month = {10},
		Day = {27,28,29,30,31},
		WDay = {7},
		IsRegular = true,
		Segment = {{12,00,600}},
	},
	TimeDesc = "2017年10月27日-2017年11月3日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = true,
}
----全服双倍续
Campaign.Config[533] =
{
	ID = {10615},
	Name = "双倍经验助力江湖",
	Icon = 11708,
	Type = 7,
	Level = {Min = 1, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {},
	location = "",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      2017年10月27日~2017年11月3日，12:00~22:00，全服玩家都将获得双倍经验时间。 ",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},	
	},
	ReportTime = true,
	Time =
	{
		Month = {11},
		Day = {1,2,3},
		WDay = {7},
		IsRegular = true,
		Segment = {{12,00,600}},
	},
	TimeDesc = "2017年10月27日-2017年11月3日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = true,
}
--]]
--大逃杀战场
Campaign.Config[534] =
{
	ID = {10505},
	Name = "<战场>大逃杀",
	Icon = 11708,
	Type = 1,
	Level = {Min = 60, Max = 0},
	PlayerNum = {Min = 1, Max = 1},
	DelvNpc = {},
	location = "战场入口（活动按钮右侧）",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       周一至五12、22整点，周六日12、14、16、20、22整点，等级达到60即可在“战场”界面点击“大逃杀”界面进入活动场景，在战场中尽可能存活，赢得绝学、必成符、宝石等奖励！",
	AwardType = {3,0,0},
	Award = {
	{icon = 12371 , tip = "绝学总谱"},
	{icon = 26533 , tip = "必成符"},
	{icon = 13867 , tip = "角刺等宝石"},
	{icon = 12172 , tip = "优质染色剂"},
	},
	ReportTime = true,
	Time =
	{
		Month = {0},
		Day = {0},
		WDay = {-1},
		IsRegular = true,
		Segment = {{11,59,6},{21,59,6}},
	},
	TimeDesc = "每周周一至五12:00和22:00，周六日12、14、16、20、22整点",
	Quality = 98,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = true,
}
--[[
--在线即送注灵道具
Campaign.Config[535] =
{
	ID = {10688},
	Name = "在线送注灵道具",
	Icon = 11708,
	Type = 1,
	Level = {Min = 1, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {99768},
	location = "福州城、衡山城、洛阳城 东方教主",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       11月29日~12月6日活动期间，在线时长达到24、48、72、120小时即可获得对应数目的灵草礼包、三级宝石碎片、金蚕果奖励。",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},	
	},
	ReportTime = true,
	Time =
	{
		Month = {11},
		Day = {29,30},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2017年11月29日-12月6日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = true,
}
--在线即送注灵道具-续
Campaign.Config[536] =
{
	ID = {10688},
	Name = "在线送注灵道具",
	Icon = 11708,
	Type = 1,
	Level = {Min = 1, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {99768},
	location = "福州城、衡山城、洛阳城 东方教主",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       11月29日~12月6日活动期间，在线时长达到24、48、72、120小时即可获得对应数目的灵草礼包、三级宝石碎片、金蚕果奖励。",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},	
	},
	ReportTime = true,
	Time =
	{
		Month = {12},
		Day = {1,2,3,4,5,6},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2017年11月29日-12月6日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = true,
}
--在线送琉璃武器绝学武魂
Campaign.Config[537] =
{
	ID = {10689},
	Name = "【感恩节】在线得壕礼",
	Icon = 11708,
	Type = 1,
	Level = {Min = 70, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {99768},
	location = "福州城、衡山城、洛阳城 东方教主",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       11月24日~26日每晚20:30~21:00活动期间，70级以上玩家与东方教主进行对话，即可获得海量经验与感恩节礼盒，礼盒有概率开出残页、绝学章节、绝学书盒、黄金白银武器碎片、琉璃武器、极品武魂等。",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},	
	},
	ReportTime = true,
	Time =
	{
		Month = {11},
		Day = {24},
		WDay = {7},
		IsRegular = true,
		Segment = {{20,30,30}},
	},
	TimeDesc = "2017年11月24日-11月26日每晚20:30~21:00",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = true,
}
--在线送琉璃武器绝学武魂2
Campaign.Config[538] =
{
	ID = {10690},
	Name = "【感恩节】在线得壕礼",
	Icon = 11708,
	Type = 1,
	Level = {Min = 70, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {99768},
	location = "福州城、衡山城、洛阳城 东方教主",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       11月24日~26日每晚20:30~21:00活动期间，70级以上玩家与东方教主进行对话，即可获得海量经验与感恩节礼盒，礼盒有概率开出残页、绝学章节、绝学书盒、黄金白银武器碎片、琉璃武器、极品武魂等。",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},	
	},
	ReportTime = true,
	Time =
	{
		Month = {11},
		Day = {25},
		WDay = {7},
		IsRegular = true,
		Segment = {{20,30,30}},
	},
	TimeDesc = "2017年11月24日-11月26日每晚20:30~21:00",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = true,
}
--在线送琉璃武器绝学武魂3
Campaign.Config[539] =
{
	ID = {10691},
	Name = "【感恩节】在线得壕礼",
	Icon = 11708,
	Type = 1,
	Level = {Min = 70, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {99768},
	location = "福州城、衡山城、洛阳城 东方教主",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       11月24日~26日每晚20:30~21:00活动期间，70级以上玩家与东方教主进行对话，即可获得海量经验与感恩节礼盒，礼盒有概率开出残页、绝学章节、绝学书盒、黄金白银武器碎片、琉璃武器、极品武魂等。",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},	
	},
	ReportTime = true,
	Time =
	{
		Month = {11},
		Day = {26},
		WDay = {7},
		IsRegular = true,
		Segment = {{20,30,30}},
	},
	TimeDesc = "2017年11月24日-11月26日每晚20:30~21:00",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = true,
}
--满活跃度送宝银
Campaign.Config[540] =
{
	ID = {10692},
	Name = "满活跃度送宝银",
	Icon = 11708,
	Type = 1,
	Level = {Min = 60, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {99768},
	location = "福州城、衡山城、洛阳城 东方教主",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       11月22日~11月29日，活动时间内，60级以上玩家每日活跃度达到一定阶段，可以找东方教主额外领取感恩节奖励。\r 活跃度50，获得传奇装备材料*2； \r活跃度70，宝石结晶*10，装备材料礼包*2，宝银*400； \r满足活跃度70后，还将额外获得月辰砂礼包一份。",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},	
	},
	ReportTime = true,
	Time =
	{
		Month = {11},
		Day = {22,23,24,25,26,27,28,29},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2017年11月22日-11月29日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = true,
}
--周末在线得月辰砂
Campaign.Config[541] =
{
	ID = {10693},
	Name = "周末在线得月尘砂",
	Icon = 11708,
	Type = 1,
	Level = {Min = 60, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {99768},
	location = "福州城、衡山城、洛阳城 东方教主",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       12月1日~3日每晚18:00后，60级以上玩家可在东方教主处接取任务，每日累计足够在线时长即可获得丰厚奖励。\r每日18:00后累计在线1小时：星辰砂礼包\r每日18:00后累计在线2小时：月辰砂礼包\r每日18:00后累计在线4小时：灵草礼包",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},	
	},
	ReportTime = true,
	Time =
	{
		Month = {12},
		Day = {1,2,3},
		WDay = {7},
		IsRegular = true,
		Segment = {{18,00,360}},
	},
	TimeDesc = "2017年12月1日-12月3日每晚18:00后",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = true,
}

----【清明】春色满城迎醉猴
Campaign.Config[542] =
{
	ID = {9192},
	Name = "双节boss来袭",
	Icon = 11708,
	Type = 1,
	Level = {Min = 30, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {},
	location = "",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      2017年12月25日~2018年1月1日期间，每日19:30在少室山、华山以及五霸岗三个地图分别刷新一个双节boss，只存在两小时。双节boss掉落绝学章节、极品武魂、阵石精华、灵草等珍贵道具，掉落归属仇恨最高的队伍。BOSS死亡后会刷新30枚宝箱，宝箱可开出2级刺珊瑚、2级角珊瑚、极品武魂、绝学章节、强化+6必成符、根骨丹等丰富奖励。",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {12},
		Day = {25,26,27,28,29,30,31},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2017年12月25日~2018年1月1日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = false,
}

----【清明】春色满城迎醉猴-续
Campaign.Config[543] =
{
	ID = {9192},
	Name = "双节boss来袭",
	Icon = 11708,
	Type = 1,
	Level = {Min = 30, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {},
	location = "",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      2017年12月25日~2018年1月1日期间，每日19:30在少室山、华山以及五霸岗三个地图分别刷新一个双节boss，只存在两小时。双节boss掉落绝学章节、极品武魂、阵石精华、灵草等珍贵道具，掉落归属仇恨最高的队伍。BOSS死亡后会刷新30枚宝箱，宝箱可开出2级刺珊瑚、2级角珊瑚、极品武魂、绝学章节、强化+6必成符、根骨丹等丰富奖励。",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {1},
		Day = {1},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2017年12月25日~2018年1月1日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = false,
}
--双节活动打雪仗
Campaign.Config[544] =
{
	ID = {6586},
	Name = "【双节】打雪仗",
	Icon = 11708,
	Type = 1,
	Level = {Min = 50, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {77089},
	location = "福州城、衡山城、洛阳城东方姑娘处。",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      2017年12月25日——2018年1月5日，为庆贺双节，小伙伴们一起来愉快的玩耍吧！东方姑娘会送你小雪球，扔给其他玩家，可将对方变成小雪人或新年礼盒！成功恶搞别人后，你会获得奖励哦！还有机会获得五彩雪球，可将对方变成华丽的大雪人、圣诞树、大饺子、果盘之一，你获得的奖励更丰厚！",
	AwardType = {1,0,0},
	Award = {
	{icon = 11191 , tip = "经验"},
	},
	ReportTime = true,
	Time =
	{
		Month = {12},
		Day = {25,26,27,28,29,30,31},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2017年12月25日——2018年1月5日",
	Quality = 5,
	CountNum = {Type = 1,ID = 7755},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = true,
}
--双节活动打雪仗-续
Campaign.Config[545] =
{
	ID = {6586},
	Name = "【双节】打雪仗",
	Icon = 11708,
	Type = 1,
	Level = {Min = 50, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {77089},
	location = "福州城、衡山城、洛阳城东方姑娘处。",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      2017年12月25日——2018年1月5日，为庆贺双节，小伙伴们一起来愉快的玩耍吧！东方姑娘会送你小雪球，扔给其他玩家，可将对方变成小雪人或新年礼盒！成功恶搞别人后，你会获得奖励哦！还有机会获得五彩雪球，可将对方变成华丽的大雪人、圣诞树、大饺子、果盘之一，你获得的奖励更丰厚！",
	AwardType = {1,0,0},
	Award = {
	{icon = 11191 , tip = "经验"},
	},
	ReportTime = true,
	Time =
	{
		Month = {1},
		Day = {1,2,3,4,5},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2017年12月25日——2018年1月5日",
	Quality = 5,
	CountNum = {Type = 1,ID = 7755},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = true,
}

--双节活动堆雪人
Campaign.Config[546] =
{
	ID = {6586},
	Name = "【双节】冰雪风情",
	Icon = 11708,
	Type = 1,
	Level = {Min = 35, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {77089},
	location = "福州城、衡山城、洛阳城东方姑娘处。",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       2017年12月25日——2018年1月5日，茫茫的白雪覆盖大地，在这辞旧迎新的日子里，何不堆一个漂亮的雪人放松心情？快去问东方姑娘要堆雪人的必备材料吧！",
	AwardType = {1,0,0},
	Award = {
	{icon = 11191 , tip = "经验"},
	},
	ReportTime = true,
	Time =
	{
		Month = {12},
		Day = {25,26,27,28,29,30,31},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2017年12月25日——2018年1月5日",
	Quality = 5,
	CountNum = {Type = 1,ID = 7758},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = true,
}
--双节活动堆雪人-续
Campaign.Config[547] =
{
	ID = {6586},
	Name = "【双节】冰雪风情",
	Icon = 11708,
	Type = 1,
	Level = {Min = 35, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {77089},
	location = "福州城、衡山城、洛阳城东方姑娘处。",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       2017年12月25日——2018年1月5日，茫茫的白雪覆盖大地，在这辞旧迎新的日子里，何不堆一个漂亮的雪人放松心情？快去问东方姑娘要堆雪人的必备材料吧！",
	AwardType = {1,0,0},
	Award = {
	{icon = 11191 , tip = "经验"},
	},
	ReportTime = true,
	Time =
	{
		Month = {1},
		Day = {1,2,3,4,5},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2017年12月25日——2018年1月5日",
	Quality = 5,
	CountNum = {Type = 1,ID = 7758},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = true,
}
--全服圣诞加速度
Campaign.Config[548] =
{
	ID = {10714},
	Name = "全服圣诞加速度",
	Icon = 11708,
	Type = 7,
	Level = {Min = 1, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {},
	location = "",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       2017年12月22日~2018年1月7日期间，每周五，周六，周日13:00~22:00期间，开启全服双倍经验。",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},	
	},
	ReportTime = true,
	Time =
	{
		Month = {12},
		Day = {22,23,24,25,26,27,28,29,30,31},
		WDay = {7},
		IsRegular = true,
		Segment = {{13,00,540}},
	},
	TimeDesc = "2017年12月22日-2018年1月7日13:00-22:00",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = true,
}
--全服圣诞加速度-续
Campaign.Config[549] =
{
	ID = {10714},
	Name = "全服圣诞加速度",
	Icon = 11708,
	Type = 7,
	Level = {Min = 1, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {},
	location = "",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       2017年12月22日~2018年1月7日期间，每周五，周六，周日13:00~22:00期间，开启全服双倍经验。",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},	
	},
	ReportTime = true,
	Time =
	{
		Month = {1},
		Day = {1,2,3,4,5,6,7},
		WDay = {7},
		IsRegular = true,
		Segment = {{13,00,540}},
	},
	TimeDesc = "2017年12月22日-2018年1月7日13:00-22:00",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = true,
}
--累计在线得活力
Campaign.Config[550] =
{
	ID = {10715},
	Name = "累计在线得活力",
	Icon = 11708,
	Type = 1,
	Level = {Min = 1, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {99768},
	location = "福州城、衡山城、洛阳城 东方教主",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       12月20日—12月23日 每天18:00-22:00活动时间内，玩家上线后找东方教主领取任务后，累计在线1小时，即可获得2个50点活力药（限时24小时）。",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},	
	},
	ReportTime = true,
	Time =
	{
		Month = {12},
		Day = {20,21,22,23},
		WDay = {7},
		IsRegular = true,
		Segment = {{18,00,240}},
	},
	TimeDesc = "12月20日—12月23日 每天18:00-22:00",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = true,
}
--活跃度送豪礼
Campaign.Config[551] =
{
	ID = {10716},
	Name = "冲活跃送惊喜好礼",
	Icon = 11708,
	Type = 3,
	Level = {Min = 30, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {99768},
	location = "福州城、衡山城、洛阳城 东方教主",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       3月7日至3月13日活动期间内，30级以上的少侠们每日活跃度达到要求后可至东方教主处领取不同好礼。（每日1次、每天8点刷新）\r奖励：\r活跃度达到35获得月尘砂*3\r活跃度达到50获得金蚕果*10\r活跃度达到70获得龙涎草*1",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},	
	},
	ReportTime = true,
	Time =
	{
		Month = {3},
		Day = {7,8,9,10,11,12,13},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2018年3月7日~2018年3月13日",
	Quality = 99.6,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = true,
}
--活跃度送豪礼-续
Campaign.Config[552] =
{
	ID = {10716},
	Name = "活跃度送豪礼",
	Icon = 11708,
	Type = 1,
	Level = {Min = 60, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {99768},
	location = "福州城、衡山城、洛阳城 东方教主",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       2017年12月25日~2018年1月1日，活动时间内，每日活跃度达到一定阶段，可以找东方教主额外领取双节奖励。 \r活跃度35，获得绑银10D； \r活跃度50，获得传奇装备材料礼包两套； \r活跃度70，获得装备材料礼包两套； \r满足活跃度70后，还将额外获得月辰砂礼包一份。",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},	
	},
	ReportTime = true,
	Time =
	{
		Month = {1},
		Day = {1},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2017年12月25日~2018年1月1日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = true,
}
--2018元旦跨年倒数活动
Campaign.Config[553] =
{
	ID = {10725},
	Name = "【元旦】跨年倒数",
	Icon = 11708,
	Type = 1,
	Level = {Min = 30, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {99768},
	location = "洛阳城 东方教主",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       2017年的最后一天，让我们在笑傲一起跨年~ \r12月31日的12:00、20:00、23:00、23:50、23:55、23:58、24:00玩家可分别向东方教主领取跨年倒数道具。右键点击发送广播喊话，即可完成任务，获得经验奖励及新年彩票。 \r任务均限时，在下一个时间点的任务更新之前可接取。新年彩票需在2018年0点之后才可开启。开启新年彩票必得天然染色剂*2，还可能获得丰厚的外观奖励。",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {12},
		Day = {31},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2017年12月31日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = false,
}
--2018元旦新年签活动
Campaign.Config[554] =
{
	ID = {10726},
	Name = "【元旦】新年签",
	Icon = 11708,
	Type = 1,
	Level = {Min = 30, Max = 0},
	PlayerNum = {Min = 3, Max = 0},
	DelvNpc = {99768},
	location = "洛阳城 东方教主",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       2018年1月1日-1月7日活动期间，每日玩家可在洛阳城的东方教主处抽取一枚新年签。和拥有相同新年签的玩家组队≥3人，共同至福缘神算处完成后续任务即可获得经验、战技丹、灵草奖励。新年签有效时限为24小时。",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {1},
		Day = {1,2,3,4,5,6,7},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2018年1月1日-1月7日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = false,
}
--元旦财神到副本
Campaign.Config[555] =
{
	ID = {10010},
	Name = "【元旦】财神到",
	Icon = 11708,
	Type = 1,
	Level = {Min = 30, Max = 0},
	PlayerNum = {Min = 3, Max = 0},
	DelvNpc = {84982},
	location = "洛阳城 冀飞虎",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       活动时间：1月1日——1月7日\r      元旦佳节，玉帝派财神下凡为人们送去财运。但却有邪祟趁机作乱，妄图阻挠财神之行。财神委托侠士们组队护送他、清理沿途的邪祟，并允诺各位侠士，在到达终点之后，就有好礼相送~",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {1},
		Day = {1,2,3,4,5,6,7},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2017年1月1日——1月7日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = false,
}
--20181月在线活动活跃度
Campaign.Config[556] =
{
	ID = {10736},
	Name = "【新年】冲活跃度拿豪礼",
	Icon = 11708,
	Type = 1,
	Level = {Min = 60, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {99768},
	location = "洛阳城 东方教主",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      2018年1月3日至2018年1月10日活动时间内，每日活跃度达到70满时，可在NPC处额外领取活跃度奖励：血符碎片*120、风物石*5、金蚕果*10",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {1},
		Day = {3,4,5,6,7,8,9,10},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2018年1月3日-1月10日",
	Quality = 5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = false,
}
--20181月在线活动累计在线
Campaign.Config[557] =
{
	ID = {10900},
	Name = "昼夜不眠争做挂机王",
	Icon = 11708,
	Type = 3,
	Level = {Min = 1, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {},
	location = "",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      2018年3月9日8点-3月16日8点活动时间内累计在线时间达到达到固定时间可获得额外好礼：\r累计在线8小时、获得蓝色风物碎片*3\r累计在线40小时、获得除恶令*5\r累计在线80小时、金蚕果*40\r累计在线120小时、灵草*30",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {3},
		Day = {9,10,11,12,13,14,15,16},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2018年3月9日-3月16日",
	Quality = 99.6,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = false,
}
----签到领奖
Campaign.Config[558] =
{
	ID = {10549},
	Name = "【囍迎新春】每日签到",
	Icon = 11708,
	Type = 3,
	Level = {Min = 20, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {},
	location = "",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       2018年1月17日—2018年2月28日，活动期间，在游戏界面签到处，成功签到，即可获得多种壕礼！",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {1},
		Day = {17,18,19,20,21,22,23,24,25,26,27,28,29,30,31},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2018年1月17日—2018年2月28日",
	Quality = 99.61,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = false,
	DisplayToday = true,
}
----签到领奖-续
Campaign.Config[559] =
{
	ID = {10549},
	Name = "【囍迎新春】每日签到",
	Icon = 11708,
	Type = 3,
	Level = {Min = 20, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {},
	location = "",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       2018年1月17日—2018年2月28日，活动期间，在游戏界面签到处，成功签到，即可获得多种壕礼！",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {2},
		Day = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2018年1月17日—2018年2月28日",
	Quality = 99.61,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = false,
	DisplayToday = true,
}
--春节活动春联对对贴
Campaign.Config[560] =
{
	ID = {6948},
	Name = "【春节】春联对对贴",
	Icon = 11708,
	Type = 3,
	Level = {Min = 20, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {77089},
	location = "福州城、衡山城、洛阳城东方姑娘处。",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      2018年2月14日-2018年2月22日，领取任务后拿着东方姑娘给你的几副春联寻找三大主城内还没有贴春联的民户，将春联贴到民户的大门上，即可找东方姑娘领取丰厚奖励！",
	AwardType = {1,0,0},
	Award = {
	{icon = 11191 , tip = "经验"},
	},
	ReportTime = true,
	Time =
	{
		Month = {2},
		Day = {14,15,16,17,18,19,20,21,22},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2018年2月14日-2018年2月22日",
	Quality = 99.62,
	CountNum = {Type = 1,ID = 7899},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = true,
	DisplayToday = true,
}
--春节活动团圆宴
Campaign.Config[561] =
{
	ID = {6949},
	Name = "【春节】团圆宴",
	Icon = 11708,
	Type = 3,
	Level = {Min = 20, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {77089},
	location = "福州城、衡山城、洛阳城东方姑娘处。",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      2018年2月14日-2018年2月22日，每晚20:00-23:00，前往三大主城的广场宴会区，和众侠士一同享用新春团圆宴,饭饱喝足后，自动获得丰厚奖励！",
	AwardType = {1,0,0},
	Award = {
	{icon = 11191 , tip = "经验"},
	},
	ReportTime = true,
	Time =
	{
		Month = {2},
		Day = {14,15,16,17,18,19,20,21,22},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2018年2月14日-2018年2月22日",
	Quality = 99.63,
	CountNum = {Type = 1,ID = 7901},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = true,
	DisplayToday = true,
}
--春节活动抢头香
Campaign.Config[562] =
{
	ID = {6950},
	Name = "【春节】抢头香",
	Icon = 11708,
	Type = 3,
	Level = {Min = 20, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {77089},
	location = "福州城、衡山城、洛阳城东方姑娘处。",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      2018年2月14日-2018年2月22日，前往至少三座寺庙敬上新年的第一炷香，可以获得丰富的奖励哦！",
	AwardType = {1,0,0},
	Award = {
	{icon = 11191 , tip = "经验"},
	},
	ReportTime = true,
	Time =
	{
		Month = {2},
		Day = {14,15,16,17,18,19,20,21,22},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2018年2月14日-2018年2月22日",
	Quality = 99.64,
	CountNum = {Type = 1,ID = 7902},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = true,
	DisplayToday = true,
}
--春节活动上元灯会
Campaign.Config[563] =
{
	ID = {6952},
	Name = "【春节】上元节",
	Icon = 11708,
	Type = 3,
	Level = {Min = 20, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {77089},
	location = "福州城、衡山城、洛阳城东方姑娘处。",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      2018年2月27日-2018年3月6日，前往洛阳城的上元灯节街区找灯谜NPC猜灯谜，猜对一个灯谜会获得一个任务物品“灯谜奖励”，获得3个“灯谜奖励”后可完成东方姑娘的任务，获得丰厚奖励。",
	AwardType = {1,0,0},
	Award = {
	{icon = 11191 , tip = "经验"},
	},
	ReportTime = true,
	Time =
	{
		Month = {2},
		Day = {27,28},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2018年2月27日-2018年3月6日",
	Quality = 99.6,
	CountNum = {Type = 1,ID = 7988},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = true,
	DisplayToday = true,
}
--春节活动上元灯会-续
Campaign.Config[564] =
{
	ID = {6952},
	Name = "【春节】上元节",
	Icon = 11708,
	Type = 3,
	Level = {Min = 20, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {77089},
	location = "福州城、衡山城、洛阳城东方姑娘处。",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      2018年2月27日-2018年3月6日，前往洛阳城的上元灯节街区找灯谜NPC猜灯谜，猜对一个灯谜会获得一个任务物品“灯谜奖励”，获得3个“灯谜奖励”后可完成东方姑娘的任务，获得丰厚奖励。",
	AwardType = {1,0,0},
	Award = {
	{icon = 11191 , tip = "经验"},
	},
	ReportTime = true,
	Time =
	{
		Month = {3},
		Day = {1,2,3,4,5,6},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2018年2月27日-2018年3月6日",
	Quality = 99.6,
	CountNum = {Type = 1,ID = 7988},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = true,
	DisplayToday = true,
}
----【元宵节】元宵副本
Campaign.Config[565] =
{
	ID = {9055},
	Name = "【囍迎新春】元宵盛宴",
	Icon = 11708,
	Type = 3,
	Level = {Min = 30, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {62916},
	location = "洛阳城 福王",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       2018年2月27日-2018年3月6日，三人以上组队前往洛阳城福王处进入副本，完成挑战以后即可以获得丰富的奖励！！",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {2},
		Day = {27,28},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2018年2月27日-2018年3月6日",
	Quality = 99.6,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = false,
	DisplayToday = true,
}
----【元宵节】元宵副本-续
Campaign.Config[566] =
{
	ID = {9055},
	Name = "【囍迎新春】元宵盛宴",
	Icon = 11708,
	Type = 3,
	Level = {Min = 30, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {62916},
	location = "洛阳城 福王",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       2018年2月27日-2018年3月6日，三人以上组队前往洛阳城福王处进入副本，完成挑战以后即可以获得丰富的奖励！！",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {3},
		Day = {1,2,3,4,5,6},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2018年2月27日-2018年3月6日",
	Quality = 99.6,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = false,
	DisplayToday = true,
}
--2018年春节累计满活跃送豪礼
Campaign.Config[567] =
{
	ID = {10763},
	Name = "【春节】活跃度送豪礼",
	Icon = 11708,
	Type = 3,
	Level = {Min = 1, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {99768},
	location = "福州城、衡山城、洛阳城 东方教主",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      2018年2月12日-2018年2月22日，每日活跃度达成以下，即可领取丰厚大礼。\r20活跃度 领取3级宝石碎片*5\r50活跃度 领取蓝色风物志碎片*1\r70活跃度 活力草*1",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {2},
		Day = {12,13,14,15,16,17,18,19,20,21,22},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2018年2月12日-2018年2月22日",
	Quality = 99.6,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = false,
	DisplayToday = true,
}
--2018年春节世界boss
Campaign.Config[568] =
{
	ID = {10764},
	Name = "【春节】铲除年兽拿绝学",
	Icon = 11708,
	Type = 3,
	Level = {Min = 1, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {},
	location = "",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      1.2018年2月12日-2月22日每日中午14：30以及晚间21：30，在少室山与武当山脚两处同时刷新世界BOSS年兽。\r2.BOSS刷新后两个小时内，玩家不击杀，则自动消失。\r3.击杀BOSS可掉落大量宝箱，周围玩家都可拾取。\r4.BOSS死亡以后，会刷出新年活动NPC，存在30分钟，在这时间内全服玩家都可以找NPC领取额外的新年奖励。\r5.BOSS只掉落大量经验，归属伤害最高的队伍。\,6.每个玩家每天可向击杀BOSS后出现的NPC领取一次新年奖励：灵草*4，开启宝箱必得灵草*2，有概率获得绝学章节、六星宠物、极品武魂、活力草、橙镖令、绝学残页、三级宝石碎片、根骨丹、武魂经验丹、星尘砂。",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {2},
		Day = {12,13,14,15,16,17,18,19,20,21,22},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2018年2月12日-2018年2月22日",
	Quality = 99.6,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = false,
	DisplayToday = true,
}
--2018年春节灯缘
Campaign.Config[569] =
{
	ID = {10765},
	Name = "【元宵佳节】灯缘",
	Icon = 11708,
	Type = 3,
	Level = {Min = 30, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {99768},
	location = "福州城、衡山城、洛阳城 东方教主",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      今年元夜时，月与灯依旧；不见去年人，泪满春衫袖。衡山城的李沫竹去年元宵节遇到一个男子便一直念念不忘，可惜当时却没有留下他的姓名，唯一的线索只有去年他赠送的一盏花灯。李沫竹委托你根据花灯提供的信息找到那名男子。2018年2月27日-3月3日活动期间内完成任务即可获得大量经验、星辰砂*10、三级大还丹*5",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {2},
		Day = {27,28},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2018年2月27日-2018年3月3日",
	Quality = 99.6,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = false,
	DisplayToday = true,
}
--2018年春节灯缘-续
Campaign.Config[570] =
{
	ID = {10765},
	Name = "【元宵佳节】灯缘",
	Icon = 11708,
	Type = 3,
	Level = {Min = 30, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {99768},
	location = "福州城、衡山城、洛阳城 东方教主",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      今年元夜时，月与灯依旧；不见去年人，泪满春衫袖。衡山城的李沫竹去年元宵节遇到一个男子便一直念念不忘，可惜当时却没有留下他的姓名，唯一的线索只有去年他赠送的一盏花灯。李沫竹委托你根据花灯提供的信息找到那名男子。2018年2月27日-3月3日活动期间内完成任务即可获得大量经验、星辰砂*10、三级大还丹*5",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {3},
		Day = {1,2,3},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2018年2月27日-2018年3月3日",
	Quality = 99.6,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = false,
	DisplayToday = true,
}
--2018年春节知音
Campaign.Config[571] =
{
	ID = {10767},
	Name = "【情人节】知音相伴",
	Icon = 11708,
	Type = 3,
	Level = {Min = 40, Max = 0},
	PlayerNum = {Min = 2, Max = 2},
	DelvNpc = {74134},
	location = "洛阳城 令狐冲",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      2018年2月12日-2月18日一周内完成知音任务可获得额外经验、三级宝石碎片*3、宝银*50的奖励。",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "丰厚奖励"},
	},
	ReportTime = true,
	Time =
	{
		Month = {2},
		Day = {12,13,14,15,16,17,18},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2018年2月12日-2018年2月18日",
	Quality = 99.6,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = false,
	DisplayToday = true,
}
--]]
Campaign.Config[572] =
{
	ID = {6560},
	Name = --[[!AUTO_170]]"【比武】跨服匹配赛",
	Icon = 19939,
	Type = 1,
	Level = {Min = 40, Max = 0},
	PlayerNum = {Min = 1, Max = 1},
	DelvNpc = {0},
	location = --[[!AUTO_171]]"比武场",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = --[[!AUTO_172]]"      周一至周五20:30-22:00、周六周日14:00-16:00 20:30-22:00，在匹配比武场内云集各门派高手，由系统自动为您挑选实力相近对手，更能体现您的真实水准，并可突破2200积分上限，冲击排行榜更高排名！",
	AwardType = {1,0,0},
	Award = {
	{icon = 11191 , tip = --[[!AUTO_173]]"竞技积分、血战积分"},
	{icon = 9141 , tip = --[[!AUTO_174]]"功力药品"},
	},
	ReportTime = true,
	Time =
	{
		Month = {0},
		Day = {0},
		WDay = {0,6},
		IsRegular = false,
		Segment = {{14,00,120},{20,30,90}},
	},
	TimeDesc = --[[!AUTO_175]]"周一至周五20:30-22:00、周六周日14:00-16:00 20:30-22:00",
	Quality = 15,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = --[[!AUTO_176]]"",
	IfQuickTeam = false,
}

Campaign.Config[573] =
{
	ID = {4794},
	Name = "【比武】全服匹配赛",
	--DisPlay = false,
	Icon = 19939,
	Type = 1,
	Level = {Min = 40, Max = 0},
	PlayerNum = {Min = 1, Max = 1},
	DelvNpc = {0},
	location = "比武场",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      周一至周五20:30-22:00、周六周日14:00-16:00 20:30-22:00，在匹配比武场内云集各门派高手，由系统自动为您挑选实力相近对手，更能体现您的真实水准，并可突破2200积分上限，冲击排行榜更高排名！",
	AwardType = {1,0,0},
	Award = {
	{icon = 11191 , tip = "竞技积分、血战积分"},
	{icon = 9141 , tip = "功力药品"},
	},
	ReportTime = true,
	Time =
	{
		Month = {0},
		Day = {0},
		WDay = {-1},
		IsRegular = false,
		Segment = {{20,30,90}},
	},
	TimeDesc = "周一至周五20:30-22:00、周六周日14:00-16:00 20:30-22:00",
	Quality = 15,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = false,
}

--大逃杀战场周末
Campaign.Config[574] =
{
	ID = {10505},
	Name = "<战场>大逃杀",
	Icon = 11708,
	Type = 1,
	Level = {Min = 60, Max = 0},
	PlayerNum = {Min = 1, Max = 1},
	DelvNpc = {},
	location = "战场入口（活动按钮右侧）",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       周一至五12、22整点，周六日12、14、16、20、22整点，等级达到60即可在“战场”界面点击“大逃杀”界面进入活动场景，在战场中尽可能存活，赢得绝学、必成符、宝石等奖励！",
	AwardType = {3,0,0},
	Award = {
	{icon = 12371 , tip = "绝学总谱"},
	{icon = 26533 , tip = "必成符"},
	{icon = 13867 , tip = "角刺等宝石"},
	{icon = 12172 , tip = "优质染色剂"},
	},
	ReportTime = true,
	Time =
	{
		Month = {0},
		Day = {0},
		WDay = {0,6},
		IsRegular = true,
		Segment = {{11,59,6},{13,59,6},{16,59,6},{19,59,6},{21,59,6}},
	},
	TimeDesc = "每周周一至五12:00和22:00，周六日12、14、16、20、22整点",
	Quality = 98,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = true,
}

--飞龙令
Campaign.Config[575] =
{
	ID = {10739},
	Name = "【活动】飞龙令",
	Icon = 11707,
	Type = 1,
	Level = {Min = 30, Max = 0},
	PlayerNum = {Min = 1, Max = 1},
	DelvNpc = {85976},
	location = "洛阳城 徐梁",
	TaskLimit = {TaskID = 8584, Times = 1},
	Desc = "      明军已派遣大将军陆海将飞龙令从敦煌运往阴山草原。这一路诸多凶险，请速速前往敦煌协助陆海将军！30级以上的玩家，可三人组队前往洛阳城徐梁处接取飞龙令任务，完成三环副本获得最终奖励。",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "豐厚獎勵"},
	},
	ReportTime = true,
	Time =
	{
		Month = {0},
		Day = {0},
		WDay = {7},
		IsRegular = true,
		Segment = {{0,0,0}},
	},
	TimeDesc = "全天开放",
	Quality = 98,
	CountNum = {Type = 4,ID = 7307},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = false,
	DisplayToday = true,
}
--绝情谷
Campaign.Config[576] =
{
	ID = {10740},
	Name = "【活动】绝情谷",
	Icon = 11707,
	Type = 1,
	Level = {Min = 45, Max = 0},
	PlayerNum = {Min = 1, Max = 1},
	DelvNpc = {79707},
	location = "洛阳城 游迅",
	TaskLimit = {TaskID = 7705, Times = 1},
	Desc = "      人为财死，鸟为食亡。想去绝情谷，只要等级达到45级，每天就可找洛阳城游迅领取地图一张，三人组队就可以去了！奖励丰厚哦！",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "豐厚獎勵"},
	},
	ReportTime = true,
	Time =
	{
		Month = {0},
		Day = {0},
		WDay = {7},
		IsRegular = true,
		Segment = {{0,0,0}},
	},
	TimeDesc = "全天开放",
	Quality = 98,
	CountNum = {Type = 4,ID = 4691},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = false,
	DisplayToday = true,
}

--风火连城

Campaign.Config[577] =
{
	ID = {10775},
	Name = "<战场>风火连城",
	Icon = 11708,
	Type = 1,
	Level = {Min = 80, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {},
	location = "战场入口（活动按钮右侧）",
	TaskLimit = {TaskID = 0, Times = 5},
	Desc = "      等级达到80级的侠士可以在风火大战中一展身手啦!\r1.战场开启时间：每日11:00-23:00\r进入战场的侠士会被系统分配到2个阵营，击杀对方侠士、信使、防御塔以及野外怪物均会获得个人积分。个人积分达到50分可获得初级奖励，达到500分可获得高级奖励，达到1500分将可获得额外的巨额奖励。",
	AwardType = {1,3,0},
	Award = {
	{icon = 11191 , tip = "海量经验"},
	{icon = 25971 , tip = "战技丹"},
	},
	ReportTime = true,
	Time =	
	{

		Month = {0},
		Day = {0},
		WDay = {7},
		IsRegular = false,
		Segment = {{11,0,720}},
	},
	TimeDesc = "每天11：00-23：00",
	Quality = 78,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = false,
	DisplayToday = true,
}
--20183月周末双倍大放送
Campaign.Config[578] =
{
	ID = {10868},
	Name = "周末双倍大放送",
	Icon = 11708,
	Type = 3,
	Level = {Min = 30, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {99768},
	location = "福州城、衡山城、洛阳城 东方教主",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      横跨整个3月每逢周五周六的20：00至22：00（即3月9日、3月10日、3月16日、3月17日、3月23日、3月24日、3月30日、3月31日）30级以上的玩家可在活动大使处领取双倍BUFF1个（持续一小时），少侠可在期间努力提升自身等级。",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "豐厚獎勵"},
	},
	ReportTime = true,
	Time =
	{
		Month = {3},
		Day = {9,10,16,17,23,24,30,31},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2018年3月7日-3月13日",
	Quality = 99.6,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = false,
}
--20183月停服维护补偿
Campaign.Config[579] =
{
	ID = {10901},
	Name = "停服维护补偿",
	Icon = 11708,
	Type = 3,
	Level = {Min = 30, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {99768},
	location = "福州城、衡山城、洛阳城 东方教主",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      3月9日维护后一周内，30级以上的玩家可至东方教主处领取维护补偿：1小时双倍经验药*2、金蚕果*10",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "豐厚獎勵"},
	},
	ReportTime = true,
	Time =
	{
		Month = {3},
		Day = {9,10,11,12,13,14,15},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2018年3月9日-3月15日",
	Quality = 99.5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = false,
}
--20183月在线副本
Campaign.Config[580] =
{
	ID = {10909},
	Name = "挑战陈圣王",
	Icon = 11708,
	Type = 3,
	Level = {Min = 60, Max = 0},
	PlayerNum = {Min = 3, Max = 6},
	DelvNpc = {84982},
	location = "洛陽城 冀飛虎",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      春分前后的民俗节日有二月十五日开漳圣王诞辰：开漳圣王又称陈圣王，为唐代武进士陈元光，对漳洲有功，死后成为漳洲守护神。3月14日-21日活动期间内，60级以上的玩家可在每日活动内收集拜访圣王用的材料，集齐材料后可至冀飞虎处兑换“拜神帖”，当组队成员都拥有拜神帖即可从冀飞虎处进入副本，打败圣王可获得丰富经验奖励及道具奖励。\r活动期间内完成以下活动可获得拜神道具，用于合成拜神帖：\r每日前四次完成百毒入侵后可获得，每次可得拜神水果一份。\r每日前三次完成妖楼活动可获得，每次可得拜神酒食一份。\r每日第一次完成日常天下会运镖可获得，拜神香烛一份\r每日完成绿竹幻想活动1次可获得，拜神香油钱一份。\r拜神帖合成：\r4份拜神水果+3份拜神酒食+1份拜神香烛+1份拜神香油钱，可合成1份拜神帖。\r通关奖励：海量经验、金蚕果*20、灵草*15",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "豐厚獎勵"},
	},
	ReportTime = true,
	Time =
	{
		Month = {3},
		Day = {14,15,16,17,18,19,20,21},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2018年3月14日-3月21日",
	Quality = 99.6,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = false,
}
--2018年3月活跃度活动
Campaign.Config[581] =
{
	ID = {10920},
	Name = "领专服福利，享少年江湖",
	Icon = 11708,
	Type = 3,
	Level = {Min = 30, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {99768},
	location = "福州城、衡山城、洛阳城 东方教主",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      2018年3月27日~2018年4月3日活动期间，每日达成活跃度70即可领取丰厚奖励\r1.达成活跃50额外领取3个换镖令\r2.达成活跃度70额外领取200宝银，及“乐享碎片”\r3.集齐7个碎片可在专属活动NPC完美青年大使处兑换称号【就享不一样】",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "豐厚獎勵"},
	},
	ReportTime = true,
	Time =
	{
		Month = {3},
		Day = {27,28,29,30,31},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2018年3月27日~2018年4月3日",
	Quality = 99.5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = false,
}
--2018年3月活跃度活动-续
Campaign.Config[582] =
{
	ID = {10920},
	Name = "领专服福利，享少年江湖",
	Icon = 11708,
	Type = 3,
	Level = {Min = 30, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {99768},
	location = "福州城、衡山城、洛阳城 东方教主",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      2018年3月27日~2018年4月3日活动期间，每日达成活跃度70即可领取丰厚奖励\r1.达成活跃50额外领取3个换镖令\r2.达成活跃度70额外领取200宝银，及“乐享碎片”\r3.集齐7个碎片可在专属活动NPC完美青年大使处兑换称号【就享不一样】",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "豐厚獎勵"},
	},
	ReportTime = true,
	Time =
	{
		Month = {4},
		Day = {1,2,3},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2018年3月27日~2018年4月3日",
	Quality = 99.5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = false,
}

--2018年3月双倍活动
Campaign.Config[583] =
{
	ID = {10921},
	Name = "双倍经验助力，享少年江湖",
	Icon = 11708,
	Type = 3,
	Level = {Min = 30, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {},
	location = "",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      2018年3月27日~2018年4月3日活动期间，每日19:00~22：00期间全服开启双倍经验",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "豐厚獎勵"},
	},
	ReportTime = true,
	Time =
	{
		Month = {3},
		Day = {27,28,29,30,31},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2018年3月27日~2018年4月3日",
	Quality = 99.5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = false,
}
--2018年3月双倍活动-续
Campaign.Config[584] =
{
	ID = {10921},
	Name = "双倍经验助力，享少年江湖",
	Icon = 11708,
	Type = 3,
	Level = {Min = 30, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {},
	location = "",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      2018年3月27日~2018年4月3日活动期间，每日19:00~22：00期间全服开启双倍经验",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "豐厚獎勵"},
	},
	ReportTime = true,
	Time =
	{
		Month = {4},
		Day = {1,2,3},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2018年3月27日~2018年4月3日",
	Quality = 99.5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = false,
}

--2018年3月清明节活动
Campaign.Config[585] =
{
	ID = {10922},
	Name = "【清明】习俗知多少",
	Icon = 11708,
	Type = 3,
	Level = {Min = 30, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {99768},
	location = "福州城、衡山城、洛阳城 东方教主",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      2018年4月4日——2018年4月10日活动期间，找主城的东方教主接取清明“习俗知多少”系列任务，选择不同的习俗任务，完成后不仅能获得相应的丰厚奖励（其中习俗之一完成后会发放双倍经验BUFF哦~），还可分别获得“清”“明”“时”“节”四字令牌，集齐四个令牌，即可找东方教主兑换灵草30棵、清明专属称号以及清明背饰。",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "豐厚獎勵"},
	},
	ReportTime = true,
	Time =
	{
		Month = {4},
		Day = {4,5,6,7,8,9,10},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2018年4月4日——2018年4月10日",
	Quality = 99.5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = false,
}
--2018年周年boss
Campaign.Config[586] =
{
	ID = {10764},
	Name = "【周年庆】齐心协力平息BOSS叛乱",
	Icon = 11708,
	Type = 3,
	Level = {Min = 1, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {},
	location = "",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      1.2018年3月27日-4月3日每日晚间21：30，在少室山与武当山脚两处同时刷新世界BOSS蛮族公主。\r2.BOSS刷新后两个小时内，玩家不击杀，则自动消失。\r3.击杀BOSS可掉落大量宝箱，周围玩家都可拾取。\r4.BOSS死亡以后，会刷出NPC江湖少年郎，存在30分钟，在这时间内全服玩家都可以找NPC领取额外的奖励。\r5.BOSS只掉落大量经验，归属伤害最高的队伍。\,6.每个玩家每天可向击杀BOSS后出现的NPC领取一次奖励：灵草*4，开启宝箱必得灵草*2，有概率获得绝学章节、六星宠物、极品武魂、活力草、橙镖令、绝学残页、三级宝石碎片、根骨丹、武魂经验丹、星尘砂。",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "豐厚獎勵"},
	},
	ReportTime = true,
	Time =
	{
		Month = {4},
		Day = {1,2,3},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2018年3月27日-2018年4月3日",
	Quality = 99.6,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = false,
	DisplayToday = true,
}
--2018年周年boss
Campaign.Config[587] =
{
	ID = {10764},
	Name = "【周年庆】齐心协力平息BOSS叛乱",
	Icon = 11708,
	Type = 3,
	Level = {Min = 1, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {},
	location = "",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      1.2018年3月27日-4月3日每日晚间21：30，在少室山与武当山脚两处同时刷新世界BOSS蛮族公主。\r2.BOSS刷新后两个小时内，玩家不击杀，则自动消失。\r3.击杀BOSS可掉落大量宝箱，周围玩家都可拾取。\r4.BOSS死亡以后，会刷出NPC江湖少年郎，存在30分钟，在这时间内全服玩家都可以找NPC领取额外的奖励。\r5.BOSS只掉落大量经验，归属伤害最高的队伍。\,6.每个玩家每天可向击杀BOSS后出现的NPC领取一次奖励：灵草*4，开启宝箱必得灵草*2，有概率获得绝学章节、六星宠物、极品武魂、活力草、橙镖令、绝学残页、三级宝石碎片、根骨丹、武魂经验丹、星尘砂。",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "豐厚獎勵"},
	},
	ReportTime = true,
	Time =
	{
		Month = {3},
		Day = {27,28,29,30,31},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2018年3月27日-2018年4月3日",
	Quality = 99.6,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = false,
	DisplayToday = true,
}
--2018年3月清明节活动
Campaign.Config[588] =
{
	ID = {10919},
	Name = "【清明】春之祭",
	Icon = 11708,
	Type = 3,
	Level = {Min = 30, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {99768},
	location = "福州城、衡山城、洛阳城 东方教主",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      4月4日-4月10日活动期间，找东方教主接取任务，按步骤完成春日祭祀即可获得灵草*10、大量经验。累计击杀5次邪祟BOSS（在花朝阁的东方姑娘处接任务），还可以获得专属称号、限时坐骑。",
	AwardType = {1,0,0},
	Award = {
	{icon = 9141 , tip = "豐厚獎勵"},
	},
	ReportTime = true,
	Time =
	{
		Month = {4},
		Day = {4,5,6,7,8,9,10},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2018年4月4日——2018年4月10日",
	Quality = 99.5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = false,
}
----4月大版黄金钥匙开宝箱
Campaign.Config[589] =
{
	ID = {9929},
	Name = "在线开宝箱",
	Icon = 11708,
	Type = 1,
	Level = {Min = 1, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {91031},
	location = "洛陽城 活動大使",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       2018年04月20日~2018年05月10日活动时间内，玩家可在活动大使处领取90个宝箱，并需要每日登录后，在活动大使处分别领取对应的在线时长的任务。（>0<大侠们千万记得上线先领取任务）\r领取任务后，玩家每在线30分钟，就会得到1个宝箱钥匙。使用钥匙打开宝箱即可获得对应奖励。备注：每个玩家每日最多获得6个钥匙，每日开启宝箱的次数不做限制。\r开启宝箱将获得以下奖励：20点活力龙涎草（必得），以下道具随机获得：根骨丹*2，武魂经验丹*20，高级炼化石*15，星尘砂*2",
	AwardType = {1,0,0},
	Award = {
	{icon = 11224 , tip = "豐厚獎勵"},
	},
	ReportTime = true,
	Time =
	{
		Month = {4},
		Day = {20,21,22,23,24,25,26,27,28,29,30},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2018年4月20日-2018年5月10日",
	Quality = 99.5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = true,
}
----4月大版黄金钥匙开宝箱
Campaign.Config[590] =
{
	ID = {9929},
	Name = "在线开宝箱",
	Icon = 11708,
	Type = 1,
	Level = {Min = 1, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {91031},
	location = "洛陽城 活動大使",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       2018年04月20日~2018年05月10日活动时间内，玩家可在活动大使处领取90个宝箱，并需要每日登录后，在活动大使处分别领取对应的在线时长的任务。（>0<大侠们千万记得上线先领取任务）\r领取任务后，玩家每在线30分钟，就会得到1个宝箱钥匙。使用钥匙打开宝箱即可获得对应奖励。备注：每个玩家每日最多获得6个钥匙，每日开启宝箱的次数不做限制。\r开启宝箱将获得以下奖励：20点活力龙涎草（必得），以下道具随机获得：根骨丹*2，武魂经验丹*20，高级炼化石*15，星尘砂*2",
	AwardType = {1,0,0},
	Award = {
	{icon = 11224 , tip = "豐厚獎勵"},
	},
	ReportTime = true,
	Time =
	{
		Month = {5},
		Day = {1,2,3,4,5,6,7,8,9,10},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2018年4月20日-2018年5月10日",
	Quality = 99.5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = true,
}

----4月大版70活跃度
Campaign.Config[591] =
{
	ID = {10975},
	Name = "70活跃度换惊喜豪礼",
	Icon = 11708,
	Type = 1,
	Level = {Min = 1, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {99768},
	location = "洛阳城 东方教主",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       2018年04月29日~2018年05月10日活动期间，活跃度达到70的玩家，即可找东方教主领取200宝银、1棵新鲜的龙涎草以及“帮派风云”四字中的任意一个字。集齐“帮派风云”四字，可找东方教主兑换奖励凭证。奖励凭证可在东方教主处购买根骨丹、灵草、新鲜的龙涎草等珍贵道具。PS：每位玩家每日只能兑换一次，总兑换次数不可超过5次。",
	AwardType = {1,0,0},
	Award = {
	{icon = 11224 , tip = "豐厚獎勵"},
	},
	ReportTime = true,
	Time =
	{
		Month = {4},
		Day = {29,30},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2018年4月29日-2018年5月10日",
	Quality = 99.5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = true,
}
----4月大版70活跃度-续
Campaign.Config[592] =
{
	ID = {10975},
	Name = "70活跃度换惊喜豪礼",
	Icon = 11708,
	Type = 1,
	Level = {Min = 1, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {99768},
	location = "洛阳城 东方教主",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       2018年04月29日~2018年05月10日活动期间，活跃度达到70的玩家，即可找东方教主领取200宝银、1棵新鲜的龙涎草以及“帮派风云”四字中的任意一个字。集齐“帮派风云”四字，可找东方教主兑换奖励凭证。奖励凭证可在东方教主处购买根骨丹、灵草、新鲜的龙涎草等珍贵道具。PS：每位玩家每日只能兑换一次，总兑换次数不可超过5次。",
	AwardType = {1,0,0},
	Award = {
	{icon = 11224 , tip = "豐厚獎勵"},
	},
	ReportTime = true,
	Time =
	{
		Month = {5},
		Day = {1,2,3,4,5,6,7,8,9,10},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2018年4月29日-2018年5月10日",
	Quality = 99.5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = true,
}
----4月大版双倍经验
Campaign.Config[593] =
{
	ID = {10977},
	Name = "全服双倍，经验疯狂送",
	Icon = 11708,
	Type = 1,
	Level = {Min = 1, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {},
	location = "",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       2018年04月20日~2018年04月29日活动期间，每日晚上18：00~22：00点双倍经验开启，各位少侠女侠大侠们，走过撸过不要错过！",
	AwardType = {1,0,0},
	Award = {
	{icon = 11191 , tip = "海量经验"},
	},
	ReportTime = true,
	Time =
	{
		Month = {4},
		Day = {20,21,22,23,24,25,26,27,28,29,30},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2018年4月20日-2018年04月29日",
	Quality = 99.5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = true,
}

Campaign.Config[594] =
{
	ID = {10799},
	Name = "<军团战场>葬魂崖",
	Icon = 11708,
	Type = 1,
	Level = {Min = 70, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {},
	location = "战场入口（活动按钮右侧）",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      葬魂谷地脉发生异变，涌现出巨大的力量，善加利用可炼成神兵利器，请各帮主带领帮众加入葬魂谷地脉灵气的争夺吧！\r      需要等级达到70级方可参加，详情请点击战场--军团信息--战场介绍查看。",
	AwardType = {1,3,0},
	Award = {
	{icon = 11191 , tip = "海量经验"},
	{icon = 9141 , tip = "豐厚獎勵"},
	},
	ReportTime = true,
	Time =
	{
		Month = {0},
		Day = {0},
		WDay = {7},
		IsRegular = false,
		Segment = {{8,0,960}},
	},
	TimeDesc = "",
	Quality = 98,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = false,
}
----新地宫BOSS
Campaign.Config[595] =
{
	ID = {11012},
	Name = "【每日】戒色禅师",
	Icon = 27225,
	Type = 1,
	Level = {Min = 110, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {},
	location = "",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "      每日21点，秦皇陵地宫第四层将同时刷新两个戒色禅师，欢迎各位玩家前去挑战！成功击败戒色禅师，玩家将获得淬炼石·九等丰富奖励！Boss掉落归属仇恨最高的队伍！此外，boss刷新后只能存在2个小时，请前往挑战的玩家抓紧时间。",
	AwardType = {1,0,0},
	Award = {
	{icon = 11191 , tip = "豐厚獎勵"},
	},
	ReportTime = true,
	Time =
	{
		Month = {0},
		Day = {0},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "每日21点",
	Quality = 89,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = false,
	LuckyAward = "",
	IfQuickTeam = true,
}
Campaign.Config[596] =
{
	ID = {11022},
	Name = "5月在线不停歇",
	Icon = 11708,
	Type = 1,
	Level = {Min = 1, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {},
	location = "",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       5月9日-5月15日活动时间内在线时间达到任务要求时可获得对应奖励。\r      1、累计在线4小时可获得风物石*30\r      2、累计在线24小时可获得玲珑丹*99\r      3、累计在线48小时可获得蓝色风物志碎片*5\r      4、累计在线120小时可获得灵草*30",
	AwardType = {1,0,0},
	Award = {
	{icon = 11224 , tip = "豐厚獎勵"},
	},
	ReportTime = true,
	Time =
	{
		Month = {5},
		Day = {9,10,11,12,13,14,15},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2018年5月9日-2018年5月15日",
	Quality = 99.5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = true,
}
Campaign.Config[597] =
{
	ID = {11023},
	Name = "冲活跃度拿好礼",
	Icon = 11708,
	Type = 1,
	Level = {Min = 1, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {99768},
	location = "洛阳城 东方教主",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       5月11日至5月15日活动期间每日活跃度达到70即可在洛阳的东方教主处领取5月活跃度礼包一个，礼包奖励如下。奖励：\r      灵草*8、至尊礼包兑换券*1\r      持兑换券可在5月18日至东方教主处兑换礼包开启（兑换券最多可以兑换4次，开启可获得宝石结晶等丰厚奖励）。",
	AwardType = {1,0,0},
	Award = {
	{icon = 11224 , tip = "豐厚獎勵"},
	},
	ReportTime = true,
	Time =
	{
		Month = {5},
		Day = {11,12,13,14,15},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2018年5月11日-2018年5月15日",
	Quality = 99.5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = true,
}
Campaign.Config[598] =
{
	ID = {11024},
	Name = "<护士节>女侠拿好礼",
	Icon = 11708,
	Type = 1,
	Level = {Min = 1, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {99768},
	location = "洛阳城 东方教主",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       活动期间所有30级以上的江湖女侠客可在洛阳城的东方教主处领取护士节专属奖励一份，\r      内含成女时装（医者衣（时限14天）、医者帽（时限14天））50点活力草*2\r      内含萝莉湘君（湘君衣（湘君14天）、湘君帽（时限14天））50点活力草*2\r      备注：每个女性角色只能根据当时体型领取一份奖励。不可重复领取多个体型。",
	AwardType = {1,0,0},
	Award = {
	{icon = 11224 , tip = "豐厚獎勵"},
	},
	ReportTime = true,
	Time =
	{
		Month = {5},
		Day = {12},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2018年5月12日",
	Quality = 99.5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = true,
}
----至尊礼包兑换
Campaign.Config[599] =
{
	ID = {11039},
	Name = "至尊礼包兑换",
	Icon = 11708,
	Type = 1,
	Level = {Min = 1, Max = 0},
	PlayerNum = {Min = 1, Max = 0},
	DelvNpc = {99768},
	location = "洛阳城 东方教主",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       活动时间内，玩家可凭至尊礼包兑换券于5月18号20：00、20：30、21：30、22：00找东方教主兑换5月至尊礼包，活动期间4个时间段内每人最多可兑换4次，每个时间段兑换开启10分钟。打开至尊礼包可获得小点心与宝石结晶，还有机会获得任意绝学章节、根骨丹、金蚕果、必成符等丰富奖励。",
	AwardType = {1,0,0},
	Award = {
	{icon = 11224 , tip = "豐厚獎勵"},
	},
	ReportTime = true,
	Time =
	{
		Month = {5},
		Day = {18},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2018年5月18日",
	Quality = 99.5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = true,
}
Campaign.Config[600] =
{
	ID = {11042},
	Name = "<520>喜结良缘",
	Icon = 11708,
	Type = 1,
	Level = {Min = 1, Max = 0},
	PlayerNum = {Min = 2, Max = 2},
	DelvNpc = {99768},
	location = "洛阳城 东方教主",
	TaskLimit = {TaskID = 0, Times = 0},
	Desc = "       5月20日~5月21日夫妻组队前往东方教主处，即可领取喜结良缘礼包（只可领取一次）。礼包内含：结婚礼服*1（限时30天）、书 至爱极星*5、天然染色剂*30（绑定）",
	AwardType = {1,0,0},
	Award = {
	{icon = 11224 , tip = "豐厚獎勵"},
	},
	ReportTime = true,
	Time =
	{
		Month = {5},
		Day = {20,21},
		WDay = {7},
		IsRegular = true,
		Segment = {{00,00,00}},
	},
	TimeDesc = "2018年5月20日-5月21日",
	Quality = 99.5,
	CountNum = {Type = 0,ID = 0},
	IfSpecial = true,
	LuckyAward = "",
	IfQuickTeam = true,
}














-- 推荐活动算法
local candidateCamp =   -- 候选推荐活动, 格式 [id] = true
{
    petlvlow = {[7] = true, [8] = true};
}

local TEXT = function (v) return v end
-- 返回: campaign_id, reasonType, reasonString
function Campaign:Recommend()
    do
        return  --D 现在成就还没有，先在脚本里注掉吧~
    end
    local playerProp = GameApi.GetPlayerBasicProp(0)
	local playerLevel = playerProp.level

    -- 符合推荐条件的活动
    local campSpecial = {}               -- 特殊活动
    local campNew = {}                   -- 升级而可做的新活动
    local campPetlvlow = {}              -- 宠物等级过低，在 candidateCamp.petlvlow 中选
    local campNeverReceived = {}         -- 没完成的活动
    local campTimeLimited = {}           -- 限时活动

    -- 遍历，找出所有符合推荐条件的活动
    for iCamp, camp in pairs(Campaign.Config) do
        local campId = camp.ID

        if GameApi.CanAttendActivity(campId) then  -- 排除不可做的活动
            -- 特殊活动 -- 不推荐此类活动
            --if camp.IfSpecial then
                --campSpecial[#campSpecial+1] = camp
            --end

            local bHasEverReceived = GameApi.HasEverFinishedActivity(campId)    -- 曾经完成过此活动

            -- 升级而可做的新活动
            if not bHasEverReceived and camp.Level.Min == playerLevel then        -- 没做过
                campNew[#campNew+1] = camp
            end

            -- 宠物等级过低
            if candidateCamp.petlvlow[campId] then
                campPetlvlow[#campPetlvlow+1] = camp
            end

            -- 没做过的活动
            if not bHasEverReceived then
                campNeverReceived[#campNeverReceived+1] = camp
            end

            -- 限时活动
            if not camp.Time.IsRegular then
				campNeverReceived[#campNeverReceived+1] = camp
            end
        end
    end

    -- 在符合条件的活动中选择一个
    local function selectCampaign (list)
        local i = math.random(1, #list)
        return list[i], i
    end

    if #campSpecial > 0 then
        local camp = selectCampaign(campSpecial)
        return camp.ID, --[[!AUTO_122]]"special", camp.recommendReason     -- 推荐理由写在特殊活动数据里

    elseif #campNew > 0 then
        local camp = selectCampaign(campNew)
        return camp.ID, --[[!AUTO_123]]"new", TEXT--[[!AUTO_124]]"這是一個您升級後新活動，全新精彩玩法，等您來體驗！"

    elseif #campPetlvlow > 0 then
        local camp = selectCampaign(campPetlvlow)
        return camp.ID, --[[!AUTO_125]]"petlvlow", TEXT--[[!AUTO_126]]"您的寵物等級很低，參加活動快速提升寵物等級吧！"

    elseif #campNeverReceived > 0 then
        local camp = selectCampaign(campNeverReceived)
        return camp.ID, --[[!AUTO_127]]"neverreceived", TEXT--[[!AUTO_128]]"和您等級相同的人經常參與，您卻一再錯過的活動"

    elseif #campTimeLimited > 0 then
        local camp = selectCampaign(campTimeLimited)
        return camp.ID, --[[!AUTO_129]]"timelimited", TEXT--[[!AUTO_130]]"目前時間正在進行這個活動，時間有限，不容錯過。"
    end
end

--
-- test begin
--~ do
--~     GameApi = {}
--~     setmetatable(GameApi, {__index=function (t, k) return function (v) return v end end})
--~     print(Campaign:Recommend())
--~ end
-- test end
--
----------------------------------------------------------------
--活动喊话相关
----------------------------------------------------------------


local SpecialEventSpeaker = {}
SpecialEventSpeaker[3] = {}
SpecialEventSpeaker[3].text = --[[!AUTO_131]]"小道消息：福州、衡山、洛陽周邊地圖天色異變，傳說中的龍嶺迷窟及大批財寶將在%d分鐘後現世！"
SpecialEventSpeaker[3].defult = --[[!AUTO_132]]"小道消息：福州郊外、衡山郊外、武當山、華山、藥王谷、少室山出現了龍嶺迷窟入口，一大波冒險者正在前往尋找！"
SpecialEventSpeaker[3].func =
function(pre_min, tids_tbl, text, tbl)
	local str = tbl.defult
	if pre_min < 1 then
		return str
	end
	return string.format(text, pre_min)
end
SpecialEventSpeaker[3].func1 =
function(tids_tbl, tbl)
	local str = --[[!AUTO_133]]""
	return string.format(str)
end
--[[
SpecialEventSpeaker[21] = {}
SpecialEventSpeaker[21].text = "通告：『决战武尊堂』活动将在%d分钟后开始，各路英雄可以到衡山城报名！"
SpecialEventSpeaker[21].defult = "通告：『决战武尊堂』正式开始，各路英雄谁能夺魁? 让我们拭目以待！"
SpecialEventSpeaker[21].func =
function(pre_min, tids_tbl, text, tbl)
	local str = tbl.defult
	if pre_min < 1 then
		return str
	end
	return string.format(text, pre_min)
end
SpecialEventSpeaker[21].func1 =
function(tids_tbl, tbl)
	local str = ""
	return string.format(str)
end
]]
SpecialEventSpeaker[22] = {}
SpecialEventSpeaker[22].text = --[[!AUTO_134]]"江湖快報：百毒道人打算%s分鐘後派毒獸前往%s搶奪秘笈，看樣子少不了一場惡戰！"
SpecialEventSpeaker[22][3193] = --[[!AUTO_135]]"少林"
SpecialEventSpeaker[22][3207] = --[[!AUTO_136]]"武當"
SpecialEventSpeaker[22][3208] = --[[!AUTO_137]]"華山"
SpecialEventSpeaker[22][3209] = --[[!AUTO_138]]"恆山"
SpecialEventSpeaker[22][3210] = --[[!AUTO_139]]"衡山"
SpecialEventSpeaker[22][3211] = --[[!AUTO_140]]"日月"
SpecialEventSpeaker[22][3212] = --[[!AUTO_141]]"五仙"
SpecialEventSpeaker[22][3213] = --[[!AUTO_142]]"逍遙"
SpecialEventSpeaker[22][3214] = --[[!AUTO_143]]"唐門"
SpecialEventSpeaker[22][3215] = --[[!AUTO_144]]"峨嵋"
SpecialEventSpeaker[22][9009] = --[[!AUTO_144]]"獨孤"
SpecialEventSpeaker[22][10634] = --[[!AUTO_144]]"玲瓏"
SpecialEventSpeaker[22].func =
function(pre_min, tids_tbl, text, tbl)
	local str = --[[!AUTO_145]]""
	local str0 = --[[!AUTO_146]]"江湖快報：百毒道人所派的毒獸正在入侵%s，三門派掌門已發下號令，請江湖俠士前往截殺！"
	for i = 1 , #tids_tbl do
		if i == #tids_tbl then
			str = string.format(--[[!AUTO_147]]"%s%s", str, tostring(tbl[tids_tbl[i]]))
		else
			str = string.format(--[[!AUTO_148]]"%s%s、", str, tostring(tbl[tids_tbl[i]]))
		end
	end
	if pre_min < 1 then
		return string.format(str0, str)
	end
	return string.format(text, pre_min, str)
end
SpecialEventSpeaker[22].func1 =
function(tids_tbl, tbl)
	local str = --[[!AUTO_149]]""
	local str0 = --[[!AUTO_150]]"^22aa22★開放中★^ff0000本次入侵門派：%s^000000"
	for i = 1 , #tids_tbl do
		if i == #tids_tbl then
			str = string.format(--[[!AUTO_151]]"%s%s", str, tostring(tbl[tids_tbl[i]]))
		else
			str = string.format(--[[!AUTO_152]]"%s%s、", str, tostring(tbl[tids_tbl[i]]))
		end
	end
	return string.format(str0, str)
end

SpecialEventSpeaker[28] = {}
SpecialEventSpeaker[28].text = --[[!AUTO_167]]"通告：【比武場】跨服配對賽活動將在%d分鐘後開始！"
SpecialEventSpeaker[28].defult = --[[!AUTO_168]]"通告：【比武場】跨服配對賽正式開始，各路俠士可前往比武場以武會友！"
SpecialEventSpeaker[28].func =
function(pre_min, tids_tbl, text, tbl)
	local str = tbl.defult
	if pre_min < 1 then
		return str
	end
	return string.format(text, pre_min)
end
SpecialEventSpeaker[28].func1 =
function(tids_tbl, tbl)
	local str = --[[!AUTO_169]]""
	return string.format(str)
end

SpecialEventSpeaker[30] = {}
SpecialEventSpeaker[30].text = "通告：【比武場】跨服匹配賽活動將在%d分鐘後開始！"
SpecialEventSpeaker[30].defult = "通告：【比武場】跨服匹配賽正式開始，各路俠士可前往比武場以武會友！"
SpecialEventSpeaker[30].func =
function(pre_min, tids_tbl, text, tbl)
	local str = tbl.defult
	if pre_min < 1 then
		return str
	end
	return string.format(text, pre_min)
end
SpecialEventSpeaker[30].func1 =
function(tids_tbl, tbl)
	local str = ""
	return string.format(str)
end

SpecialEventSpeaker[43] = {}
SpecialEventSpeaker[43].text = "通告：【比武場】全服匹配賽活動將在%d分鐘後開始！"
SpecialEventSpeaker[43].defult = "通告：【比武場】全服匹配賽正式開始，各路俠士可前往比武場以武會友！"
SpecialEventSpeaker[43].func =
function(pre_min, tids_tbl, text, tbl)
	local str = tbl.defult
	if pre_min < 1 then
		return str
	end
	return string.format(text, pre_min)
end
SpecialEventSpeaker[43].func1 =
function(tids_tbl, tbl)
	local str = ""
	return string.format(str)
end

SpecialEventSpeaker[44] = {}
SpecialEventSpeaker[44].text = "通告：武道會競猜活動即將開始！"
SpecialEventSpeaker[44].defult = "通告：武道會競猜活動正式開始，各路俠士可前往擂臺總管或洛陽瘋癲老頭處參與！"
SpecialEventSpeaker[44].func =
function(pre_min, tids_tbl, text, tbl)
	local str = tbl.defult
	if pre_min < 1 then
		return str
	end
	return string.format(text, pre_min)
end
SpecialEventSpeaker[44].func1 =
function(tids_tbl, tbl)
	local str = ""
	return string.format(str)
end


SpecialEventSpeaker[45] = {}
SpecialEventSpeaker[45].text = "通告：天下第一武道會即將開始，請各位參賽俠士做好準備！"
SpecialEventSpeaker[45].defult = "通告：天下第一武道會正式開始進入準備階段，請各位參賽俠士至比武場-武道會房間備賽！"
SpecialEventSpeaker[45].func =
function(pre_min, tids_tbl, text, tbl)
	local str = tbl.defult
	if pre_min < 1 then
		return str
	end
	return string.format(text, pre_min)
end
SpecialEventSpeaker[45].func1 =
function(tids_tbl, tbl)
	local str = ""
	return string.format(str)
end

SpecialEventSpeaker[87] = {}
SpecialEventSpeaker[87].text = "通告：【戰場】鏖戰青城戰場將在%d分鐘後開始！"
SpecialEventSpeaker[87].defult = "通告：【戰場】鏖戰青城戰場正式開始，歡迎各路俠士來戰！"
SpecialEventSpeaker[87].func =
function(pre_min, tids_tbl, text, tbl)
	local str = tbl.defult
	if pre_min < 1 then
		return str
	end
	return string.format(text, pre_min)
end
SpecialEventSpeaker[87].func1 =
function(tids_tbl, tbl)
	local str = ""
	return string.format(str)
end

SpecialEventSpeaker[88] = {}
SpecialEventSpeaker[88].text = "通告：【戰場】洛陽獅會戰場將在%d分鐘後開始！"
SpecialEventSpeaker[88].defult = "通告：【戰場】洛陽獅會戰場正式開始，各路俠士可前往戰場大戰三百回合！"
SpecialEventSpeaker[88].func =
function(pre_min, tids_tbl, text, tbl)
	local str = tbl.defult
	if pre_min < 1 then
		return str
	end
	return string.format(text, pre_min)
end
SpecialEventSpeaker[88].func1 =
function(tids_tbl, tbl)
	local str = ""
	return string.format(str)
end


SpecialEventSpeaker[98] = {}
SpecialEventSpeaker[98].text = "通告：【活動戰場】捉迷藏將在%d分鐘後開始！"
SpecialEventSpeaker[98].defult = "通告：【活動戰場】捉迷藏正式開始，各路俠士快帶上小夥伴來參加吧！"
SpecialEventSpeaker[98].func =
function(pre_min, tids_tbl, text, tbl)
	local str = tbl.defult
	if pre_min < 1 then
		return str
	end
	return string.format(text, pre_min)
end
SpecialEventSpeaker[98].func1 =
function(tids_tbl, tbl)
	local str = ""
	return string.format(str)
end


SpecialEventSpeaker[99] = {}
SpecialEventSpeaker[99].text = "通告：【活動戰場】捉迷藏將在%d分鐘後開始！"
SpecialEventSpeaker[99].defult = "通告：【活動戰場】捉迷藏正式開始，各路俠士快帶上小夥伴來參加吧！"
SpecialEventSpeaker[99].func =
function(pre_min, tids_tbl, text, tbl)
	local str = tbl.defult
	if pre_min < 1 then
		return str
	end
	return string.format(text, pre_min)
end
SpecialEventSpeaker[99].func1 =
function(tids_tbl, tbl)
	local str = ""
	return string.format(str)
end



SpecialEventSpeaker[106] = {}
SpecialEventSpeaker[106].text = "通告：珍獸大逆襲活動BOSS將在%d分鐘後出現在衡山城郊外，各路俠士快帶上小夥伴一同前往挑戰吧！"
SpecialEventSpeaker[106].defult = "通告：珍獸大逆襲活動BOSS出現在衡山城郊外，各路俠士快帶上小夥伴一同前往挑戰吧！"
SpecialEventSpeaker[106].func =
function(pre_min, tids_tbl, text, tbl)
	local str = tbl.defult
	if pre_min < 1 then
		return str
	end
	return string.format(text, pre_min)
end
SpecialEventSpeaker[106].func1 =
function(tids_tbl, tbl)
	local str = ""
	return string.format(str)
end



SpecialEventSpeaker[107] = {}
SpecialEventSpeaker[107].text = "通告：珍獸大逆襲活動BOSS將在%d分鐘後出現在衡山城郊外，各路俠士快帶上小夥伴一同前往挑戰吧！"
SpecialEventSpeaker[107].defult = "通告：珍獸大逆襲活動BOSS出現在衡山城郊外，各路俠士快帶上小夥伴一同前往挑戰吧！"
SpecialEventSpeaker[107].func =
function(pre_min, tids_tbl, text, tbl)
	local str = tbl.defult
	if pre_min < 1 then
		return str
	end
	return string.format(text, pre_min)
end
SpecialEventSpeaker[107].func1 =
function(tids_tbl, tbl)
	local str = ""
	return string.format(str)
end

SpecialEventSpeaker[108] = {}
SpecialEventSpeaker[108].text = "通告：珍獸大逆襲活動BOSS將在%d分鐘後出現在衡山城郊外，各路俠士快帶上小夥伴一同前往挑戰吧！"
SpecialEventSpeaker[108].defult = "通告：珍獸大逆襲活動BOSS出現在衡山城郊外，各路俠士快帶上小夥伴一同前往挑戰吧！"
SpecialEventSpeaker[108].func =
function(pre_min, tids_tbl, text, tbl)
	local str = tbl.defult
	if pre_min < 1 then
		return str
	end
	return string.format(text, pre_min)
end
SpecialEventSpeaker[108].func1 =
function(tids_tbl, tbl)
	local str = ""
	return string.format(str)
end


SpecialEventSpeaker[109] = {}
SpecialEventSpeaker[109].text = "通告：珍獸大逆襲活動BOSS將在%d分鐘後出現在衡山城郊外，各路俠士快帶上小夥伴一同前往挑戰吧！"
SpecialEventSpeaker[109].defult = "通告：珍獸大逆襲活動BOSS出現在衡山城郊外，各路俠士快帶上小夥伴一同前往挑戰吧！"
SpecialEventSpeaker[109].func =
function(pre_min, tids_tbl, text, tbl)
	local str = tbl.defult
	if pre_min < 1 then
		return str
	end
	return string.format(text, pre_min)
end
SpecialEventSpeaker[109].func1 =
function(tids_tbl, tbl)
	local str = ""
	return string.format(str)
end


SpecialEventSpeaker[110] = {}
SpecialEventSpeaker[110].text = "通告：珍獸大逆襲活動BOSS將在%d分鐘後出現在衡山城郊外，各路俠士快帶上小夥伴一同前往挑戰吧！"
SpecialEventSpeaker[110].defult = "通告：珍獸大逆襲活動BOSS出現在衡山城郊外，各路俠士快帶上小夥伴一同前往挑戰吧！"
SpecialEventSpeaker[110].func =
function(pre_min, tids_tbl, text, tbl)
	local str = tbl.defult
	if pre_min < 1 then
		return str
	end
	return string.format(text, pre_min)
end
SpecialEventSpeaker[110].func1 =
function(tids_tbl, tbl)
	local str = ""
	return string.format(str)
end

SpecialEventSpeaker[161] = {}
SpecialEventSpeaker[161].text = "通告：【峨眉山跑酷】活動將在%d分鐘後開始！"
SpecialEventSpeaker[161].defult = "通告：【峨眉山跑酷】活動正式開始，各路俠士可在戰場-活動戰場中參加活動，來吧，一決高下！"
SpecialEventSpeaker[161].func =
function(pre_min, tids_tbl, text, tbl)
	local str = tbl.defult
	if pre_min < 1 then
		return str
	end
	return string.format(text, pre_min)
end
SpecialEventSpeaker[161].func1 =
function(tids_tbl, tbl)
	local str = ""
	return string.format(str)
end

SpecialEventSpeaker[29] = {}
SpecialEventSpeaker[29].text1 = --[[!AUTO_199]]"江湖快報：珍獸島內氣息湧動，想必%s分鐘後即將有珍獸現世，擊殺之可以獲得江湖失傳多年的秘寶。"
SpecialEventSpeaker[29].text2 = --[[!AUTO_200]]"江湖快報：珍獸島內的聖獸將於%s分鐘後現世，各方豪傑正在透過洛陽城北幫派管理員旁的傳送使趕赴島上。"
SpecialEventSpeaker[29].text3 = --[[!AUTO_201]]"江湖快報：珍獸島內的聖獸%s，歡迎大俠透過洛陽城北幫派管理員旁的傳送使趕赴島上組團挑戰！"
SpecialEventSpeaker[29][5892] = --[[!AUTO_202]]"『北冥玄狼』出現在島中部，其他聖獸也將陸續登場"
SpecialEventSpeaker[29][5893] = --[[!AUTO_203]]"『琅寰神獸』出現在島西北部"
SpecialEventSpeaker[29][5894] = --[[!AUTO_204]]"『活死人蠍』出現在島西南部"
SpecialEventSpeaker[29][5895] = --[[!AUTO_205]]"『劍塚護靈』出現在島東北部"
SpecialEventSpeaker[29][5896] = --[[!AUTO_206]]"『聖火蠻牛』出現在島東南部"
SpecialEventSpeaker[29].func =
function(pre_min, tids_tbl, text, tbl)
	local str = --[[!AUTO_207]]""
	--for i = 1 , #tids_tbl do
		--if i == #tids_tbl then
			--str = string.format("%s%s", str, tostring(tbl[tids_tbl[i]]))
		--else
			--str = string.format("%s%s、", str, tostring(tbl[tids_tbl[i]]))
		--end
	--end
	str = string.format(--[[!AUTO_208]]"%s%s", str, tostring(tbl[5892]))
	if pre_min > 20 then
		return string.format(tbl.text1, pre_min)
	elseif pre_min > 10 then
		return string.format(tbl.text2, pre_min)
	else
		return string.format(tbl.text3, str)
	end
end
SpecialEventSpeaker[29].func1 =
function(tids_tbl, tbl)
	local str = --[[!AUTO_209]]""
	local str0 = --[[!AUTO_210]]"^22aa22★開放中★^ff0000 %s^000000"
	--for i = 1 , #tids_tbl do
		--if i == #tids_tbl then
			--str = string.format("%s%s", str, tostring(tbl[tids_tbl[i]]))
		--else
			--str = string.format("%s%s、", str, tostring(tbl[tids_tbl[i]]))
		--end
	--end
	str = string.format(--[[!AUTO_211]]"%s%s", str, tostring(tbl[5892]))
	return string.format(str0, str)
end


SpecialEventSpeaker[51] = {}
SpecialEventSpeaker[51].text = "小道消息：60級和以上的地宮中湧出了大量霧氣，傳說中的九層妖樓入口將在%d分鐘後出現！"
SpecialEventSpeaker[51].defult = "小道消息：充滿神秘氣息的九層妖樓秘道，出現在了60級和以上的地宮“深處”，海量財富等著各位俠士前去奪取！"
SpecialEventSpeaker[51].func =
function(pre_min, tids_tbl, text, tbl)
	local str = tbl.defult
	if pre_min < 1 then
		return str
	end
	return string.format(text, pre_min)
end
SpecialEventSpeaker[51].func1 =
function(tids_tbl, tbl)
	local str = ""
	return string.format(str)
end

SpecialEventSpeaker[231] = {}
SpecialEventSpeaker[231].text = "通告：貨殖八方活動即將在%d分鐘後開始，請各位俠士做好準備！"
SpecialEventSpeaker[231].defult = "通告：貨殖八方活動正式開始，請各位俠士速回本幫基地向帳房先生申領特產以參與活動！"
SpecialEventSpeaker[231].func =
function(pre_min, tids_tbl, text, tbl)
	local str = tbl.defult
	if pre_min < 1 then
		return str
	end
	return string.format(text, pre_min)
end
SpecialEventSpeaker[231].func1 =
function(tids_tbl, tbl)
	local str = ""
	return string.format(str)
end

SpecialEventSpeaker[232] = {}
SpecialEventSpeaker[232].text = "通告：明日貨殖八方活動中各幫出產物已經發佈，請各幫幫主向本幫的特產收購商確認並及時調整收購類型！"
SpecialEventSpeaker[232].defult = "通告：明日貨殖八方活動中各幫出產物已經發佈，請各幫幫主向本幫的特產收購商確認並及時調整收購類型！"
SpecialEventSpeaker[232].func =
function(pre_min, tids_tbl, text, tbl)
	local str = tbl.defult
	if pre_min < 1 then
		return str
	end
	return string.format(text, pre_min)
end
SpecialEventSpeaker[232].func1 =
function(tids_tbl, tbl)
	local str = ""
	return string.format(str)
end

SpecialEventSpeaker[297] = {}
SpecialEventSpeaker[297].text = "通告：論劍大會活動即將在%d分鐘後開始，請各位俠士做好準備！"
SpecialEventSpeaker[297].defult = "通告：論劍大會活動正式開始，請各位俠士通過戰場介面的活動戰場分頁參與活動！"
SpecialEventSpeaker[297].func =
function(pre_min, tids_tbl, text, tbl)
	local str = tbl.defult
	if pre_min < 1 then
		return str
	end
	return string.format(text, pre_min)
end
SpecialEventSpeaker[297].func1 =
function(tids_tbl, tbl)
	local str = ""
	return string.format(str)
end

SpecialEventSpeaker[301] = {}
SpecialEventSpeaker[301].text = "通告：跨服論劍大會活動即將在%d分鐘後開始，請各位俠士做好準備！"
SpecialEventSpeaker[301].defult = "通告：跨服論劍大會活動正式開始，請各位俠士通過戰場介面的活動戰場分頁參與活動！"
SpecialEventSpeaker[301].func =
function(pre_min, tids_tbl, text, tbl)
	local str = tbl.defult
	if pre_min < 1 then
		return str
	end
	return string.format(text, pre_min)
end
SpecialEventSpeaker[301].func1 =
function(tids_tbl, tbl)
	local str = ""
	return string.format(str)
end


SpecialEventSpeaker[345] = {}
SpecialEventSpeaker[345].text = "通告：地脈之變活動即將在%d分鐘後開始，請各位俠士做好準備！"
SpecialEventSpeaker[345].defult = "通告：地脈之變活動正式開始，請各位俠士前往各地消滅地脈鬼鼎！"
SpecialEventSpeaker[345].func =
function(pre_min, tids_tbl, text, tbl)
	local str = tbl.defult
	if pre_min < 1 then
		return str
	end
	return string.format(text, pre_min)
end
SpecialEventSpeaker[345].func1 =
function(tids_tbl, tbl)
	local str = ""
	return string.format(str)
end


SpecialEventSpeaker[384] = {}
SpecialEventSpeaker[384].text = "通告：秦陵古墓PK副本將在%d分鐘後開始，請眾少俠做好準備。活動開始後，您可以通過螢幕左上副本按鈕，選擇秦陵對決進入副本。"
SpecialEventSpeaker[384].defult = "秦陵古墓PK副本已開始，祝君好運！您可以通過螢幕左上副本按鈕，選擇秦陵對決進入副本。"
SpecialEventSpeaker[384].func =
function(pre_min, tids_tbl, text, tbl)
	local str = tbl.defult
	if pre_min < 1 then
		return str
	end
	return string.format(text, pre_min)
end
SpecialEventSpeaker[384].func1 =
function(tids_tbl, tbl)
	local str = ""
	return string.format(str)
end

SpecialEventSpeaker[474] = {}
SpecialEventSpeaker[474].text = "通告：蕩魔少林活動即將在%d分鐘後開始，請各位俠士做好準備！"
SpecialEventSpeaker[474].defult = "通告：蕩魔少林活動正式開始，請各位對實力有自信俠士前往！"
SpecialEventSpeaker[474].func =
function(pre_min, tids_tbl, text, tbl)
	local str = tbl.defult
	if pre_min < 1 then
		return str
	end
	return string.format(text, pre_min)
end
SpecialEventSpeaker[474].func1 =
function(tids_tbl, tbl)
	local str = ""
	return string.format(str)
end


local EventSpeaker = {}
EventSpeaker[3191] = --[[!AUTO_154]]"告示：一大群萌獸正聚於城中，洛陽名宿綠竹翁發佈公告，邀請天下義士前往守護綠竹巷！"
EventSpeaker[3541] = --[[!AUTO_155]]"不是英雄不自強，不是猛龍不過江！【猛龍過江第四賽季】熱血開打！請天下英雄豪傑速至福州城【帶頭大哥】處，猛龍過江，一戰方休！"
EventSpeaker[4644] = --[[!AUTO_156]]"每日登陸有禮活動開始，活動期間內，每日可前往洛陽城，福州城和衡山城找東方姑娘領取每日豐厚的禮品獎勵！"
EventSpeaker[4645] = --[[!AUTO_157]]"線上發獎活動開始，可前往洛陽城，福州城和衡山城找東方姑娘領取線上獎勵，每15分鐘一次，快來領取吧！"
EventSpeaker[4646] = --[[!AUTO_158]]"寶箱相隨活動開始，活動期間內，擊殺營地，地宮，副本及活動中的怪物時，會獲得寶箱兌換卷。在東方姑娘處可兌換相應寶箱"
EventSpeaker[7522] = "天下會發放官員軍餉！今日13:00至23:00，十大官員和飛龍軍均可前往天下會群雄殿總管處領取官員專屬禮包！特別提醒：十大官員的紫裝現已用禮盒包裝,與軍餉一起發放.最終產出的部件位置和屬性未知,但裝備等級與自身等級掛鉤！"
EventSpeaker[7397] = "通告：支援邊疆活動已開始並將在23:59結束，請各位英雄速去參加，為天下會效力！！！海量經驗、武勳等待你！！！"
EventSpeaker[7399] = "通告：緊急支援活動已開始，活動將持續4小時，請各位英雄速去參加支援邊疆活動，獲得的獎勵將更加豐厚"
EventSpeaker[7519] = "雪鎮之爭的進攻已經開始了，請大家到天下會廣場東方勇（264，-110）處進入戰場。"
EventSpeaker[7547] = "雪鎮之爭的防守已經開始了，請大家到天下會廣場西門智（264，-125）處加入戰場。"
EventSpeaker[7639] = "幫派精英賽BOSS已經在嘉州（651，308）、仙愁峽（709，-240）、西安（425，84）出現！諸幫派請速去剿殺，贏取精英幫派積分！"
EventSpeaker[7611] = "通告：番邦開始入侵我天下會邊疆大營，請所有持有【禦敵戰旗】的將士速速到達大營準備應戰，擊潰番邦，獲得絕世秘笈！一統天下的重任就交給你們了！！！"
EventSpeaker[7642] = "通告：天下通緝活動已經開始！請各位俠士為了天下會的榮譽奮起抗戰吧！豐厚獎勵，至高的榮譽在等著你！！"
EventSpeaker[7684] = "緊急通告：決戰黑木崖活動將在1小時後開始，天下會盟主或蒼穹賢士請抓緊時間到天下會軍師處進行預約，否則活動無法開始,活動啟動成功後啟動者將獲得一份豐厚大獎！！"
EventSpeaker[7685] = "緊急通告：天下會決戰黑木崖活動已經預約成功，請持有決殺令的大俠以及天下會所有官員做好準備，22點時到天下會盟主雕像處（天下會 358 258）進入黑木崖之塔，全員大亂鬥即將開始，獎勵空前，驚喜不斷！！請務必保證任務列表未滿，否則將無法順利登頂！"
EventSpeaker[7686] = "緊急通告：決戰黑木崖活動已經開始，持有決殺令的大俠以及天下會所有官員，請立即到天下會盟主雕像處（天下會 358 258），進入黑木崖之塔，全民大亂鬥，看誰有能力突破障礙，沖到塔頂，獎勵空前，驚喜不斷！！請務必保證任務列表未滿，否則將無法順利登頂！！"
EventSpeaker[7688] = "通告：奪羊大戰活動已經開始，活動持續2小時，可從“戰場-活動戰場-奪羊大戰”頁面參加。各位有愛俠士快來趕小羊贏取密寶文書、精煉石、大還丹等豐厚獎勵吧！"
EventSpeaker[7981] = "通告：桃穀迷陣活動已經開始，活動持續2小時，可前往“衡山城-桃穀迷陣傳送使（270,135）”處組隊參加。各位達到30級的俠士均可三人組隊進入迷陣（僅一次機會哦），破陣成功可兌換風物石和海量經驗獎勵！"
EventSpeaker[7995] = "通告：【囍迎新春】世界BOSS瘋狂獻禮活動已經開始，活動持續2小時，請諸位大俠迅速前往武當山腳以及少室山參加，贏取金色寶物碎片、年獸萌寵、缺一門、橙鏢令、轉運珠、密保文書、風物石等豐厚獎勵吧！"
EventSpeaker[8364] = "通告：【千秋美酒】活動已經開始，活動持續2小時，請諸位大俠迅速前往洛陽祖千秋處參加，贏取海量經驗，更有神秘獎勵等著你！"
EventSpeaker[8563] = "通告： 福州郊外的氣象發生了變化，一些不為人知的隱秘地點出現了！快去尋找傳說中的武器圖紙殘卷，揭開當年那些塵封的秘密。"
EventSpeaker[8545] = "通告： 五霸崗英雄齊聚，世界BOSS歐煉子已出山應戰，各路豪傑請速速前往除惡奪寶！"
EventSpeaker[8587] = "通告： 2015PK賽BOSS已經刷新，請各位大俠分別前往少室山、五霸崗、華山三地進行擊殺，搶奪珍貴的“武林盟密信”！"
EventSpeaker[9002] = "通告： 論劍大會活動正式開始，請各位俠士通過戰場介面的活動戰場分頁參與活動！"
EventSpeaker[9005] = "通告： 跨服論劍大會活動正式開始，請各位俠士通過戰場介面的活動戰場分頁參與活動！"
EventSpeaker[8999] = "江湖消息：據稱有人在華山、五霸崗、少室山等地目擊了叛逆北冥玄狼、聖火蠻牛、輪回逆衛！前往協助平叛者必不會空手而歸！"
EventSpeaker[9734] = "江湖消息：據稱有人在華山、五霸崗、少室山目擊了七夕BOSS布衣羅刹、毒達摩以及無間獄使者！各路豪傑請速速前往除惡奪寶！"
EventSpeaker[9897] = "江湖消息：據稱有人在陰山草原、蓬萊仙島、夜嵐穀三地目擊了天狗現世！前往協助擊敗天狗，海量經驗、絕學章節、靈草、月塵砂等珍貴道具等你拿！"
EventSpeaker[9928] = "告示：秦陵古墓PK副本已開始，祝君好運！您可以通過螢幕左上副本按鈕，選擇秦陵對決進入副本！"
EventSpeaker[9989] = "通告：小虎又出現在了衡山城，大家快去緝拿它獲得豐厚獎勵！"
EventSpeaker[9973] = "通告：【瑞雪尋寶】活動已經開始，活動持續15分鐘，請諸位大俠迅速前往洛陽尋找被頑皮雪人藏起來的聖誕禮物，還給聖誕老人換取獎勵！"
EventSpeaker[10015] = "通告：金玉滿堂戰場已經開始，24點前截止。各位俠士在酣戰之前別忘了向洛陽城的墨淵、戰場中的招財使接取緝拿招財樹任務，奪得豐厚獎勵！"
EventSpeaker[10061] = "通告：【眾木成林】活動已經開始，開放時間20分鐘，請各位俠士在活動大使處領取任務，赴仙愁峽栽種神樹！"
EventSpeaker[10069] = "通告：【墟市】活動已經開始，請各位俠士從遊戲介面左上角“戰場”按鈕處，選擇進入墟市參與相關活動！獎勵豐富哦！"
EventSpeaker[10265] = "通告： 地宮BOSS已經刷新，請各位大俠分別前往西王母宮上層、西王母宮下層以及秦皇陵地宮進行擊殺，海量獎勵等你拿哦！"
EventSpeaker[10531] = "通告：【花好月圓】活動已開啟，開放時間30分鐘，請各位俠士前往蓬萊的顏輕眉處領取節日煙花！"
EventSpeaker[10533] = "通告：【中秋盛宴】活動已開啟，開放時間1小時，請各位俠士前往洛陽城的活動大使處接取任務！"
EventSpeaker[10558] = "通告： 10月27日到11月26日期間，與好友一起組隊參與百毒入侵活動，即可獲得少年主角信物碎片，好友越多，好友度越高，則獎勵越豐厚！"
EventSpeaker[10613] = "通告：【全民殺雞搶壕禮】活動已開啟，請大俠們速速前往衡山郊外、少室山、武當山腳殺雞！未被及時斬殺的雞將於刷新後的15分鐘消失。"
EventSpeaker[10635] = "通告：【活躍度換寶銀】兌換已開啟，請持有唯我吃雞兌換牌的俠士去往活動大使處挑選獎勵。"
EventSpeaker[10505] = "通告：<戰場>大逃殺入口已打開，生存戰即將打響！60級以上玩家點擊“戰場-大逃殺”即可參與。"
EventSpeaker[10689] = "通告：<感恩節>線上得壕禮任務已開啟，70級以上玩家21點之前前往三大主城的東方教主處可領取感恩節禮盒，笑傲江湖，感謝有你一路相伴！"
EventSpeaker[10690] = "通告：<感恩節>線上得壕禮任務已開啟，70級以上玩家21點之前前往三大主城的東方教主處可領取感恩節禮盒，笑傲江湖，感謝有你一路相伴！"
EventSpeaker[10691] = "通告：<感恩節>線上得壕禮任務已開啟，70級以上玩家21點之前前往三大主城的東方教主處可領取感恩節禮盒，笑傲江湖，感謝有你一路相伴！"
EventSpeaker[10693] = "通告：週末線上活動已開啟，60級以上玩家前往東方教主處可領取任務，贏得大量星塵砂、月塵砂、靈草獎勵！"
EventSpeaker[10764] = "通告：蛮族公主（周年BOSS）在武当山脚和少室山出没，各位侠士速速前往击杀！参与击杀的所有人都可以获得少年江湖郎的赠礼。"
EventSpeaker[10914] = "葬魂崖地脉灵气开始涌现！请各位帮主带领兄弟们速速前往军团驻地，进入葬魂崖战场，展开一番激战吧！"
EventSpeaker[10917] = "帮派酿酒活动将在10分钟后截止，还未完成的侠士请前往帮派基地“酒”字处完成。已经完成的侠士可在10分钟后回帮领取奖励。"
EventSpeaker[10918] = "帮派酿酒活动的发奖将在10分钟后截止，所有帮派正式成员可至帮派基地“酒”字处领取奖励。"
EventSpeaker[11012] = "通告：戒色禅师已经刷新，请各位大侠分别前往秦皇陵地宫第四层进行挑战，淬炼石·九等海量奖励等你拿哦！"
EventSpeaker[11015] = "通告：帮派军团战团长选举正在火热进行中，请有投票权的大侠前往军团大管家处，投出自己宝贵的一票！"
EventSpeaker[11016] = "葬魂崖之战将在10分钟之后开始！请各位帮主带领兄弟们前往军团驻地，军团长做好出战安排，准备大干一场吧！"
EventSpeaker[11041] = "葬魂崖战场测试赛季的激战已结束，请参战的各位少侠前往军团驻地军团大管家处，领取您的荣誉证明。感谢您的参与！"





function Campaign:isSpecicalEvent(EventID)
	for k, v in pairs(Campaign.Config) do
		if #v.ID > 1 then
			for i = 1, #v.ID do
				if EventID == v.ID[i] then
					return true, k
				end
			end
		else
			if EventID == v.ID[1] then
				if SpecialEventSpeaker[k] then
					return true, k
				end
			end
		end
	end
	return false, EventID
end

function Campaign:GetCampaignSpeakingString(pre_min, tids_tbl)
	local Speak_Text = ""
	for i = 1 , #tids_tbl do
		local isSpecical, ID = self:isSpecicalEvent(tids_tbl[i])
		if isSpecical then
			Speak_Text =  SpecialEventSpeaker[ID].func(pre_min, tids_tbl, SpecialEventSpeaker[ID].text, SpecialEventSpeaker[ID])
			return TextLink:ParseText(Speak_Text)
		else
			if EventSpeaker[ID] then
				Speak_Text = string.format(EventSpeaker[ID], pre_min)
				return TextLink:ParseText(Speak_Text)
			else
				return ""
			end
		end
	end
	return TextLink:ParseText(Speak_Text)
end

function Campaign:GetCampaignLocationString(tids_tbl)
	local desc_Text = ""
	for i = 1 , #tids_tbl do
		local isSpecical, ID = self:isSpecicalEvent(tids_tbl[i])
		if isSpecical then
			desc_Text =  SpecialEventSpeaker[ID].func1(tids_tbl, SpecialEventSpeaker[ID])
			return TextLink:ParseText(desc_Text)
		else
			return TextLink:ParseText(desc_Text)
		end
	end
	return TextLink:ParseText(desc_Text)
end
