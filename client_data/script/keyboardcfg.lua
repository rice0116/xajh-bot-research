--[[#tag push auto]]

KeyBoardCfg = {}

-- from EC_LOGICKEY_ENUM @ EC_InputFilter.h (v64, 13-02-27)
KeyBoardCfg.LOGICKEY_ENUM =
{
	INVALID		= 0,

	--	Move keys
	HP_MOVE_FORWARD =	1,	--	Move forward
	HP_MOVE_BACK = 2,			--	Move back
	HP_MOVE_LEFT = 3,			--	Move left
	HP_MOVE_RIGHT = 4,			--	Move right
	HP_MOVE_TOGGLE = 5,		--	Move toggle

	--	Camera keys
	HP_PUSHCAMERA	=	21,	--	Push camera
	HP_PULLCAMERA = 22,			--	Pull camera

	--	Operation keys
	HP_OPERATION	=	31,	--	Operation (mine, loot, etc)
	HP_BEHAVIOR = 32,			--	Behavior (jump, etc)
	HP_SKILL_DODGE = 33,		--	Dodge
	HP_SKILL_BLOCK = 34,		--	Block
	HP_SKILL_CHARGE = 35,		--	Charge
	SUMMON_DEFAULTPET = 36,		--	summon the default Pet
	SUMMON_DEFAULTMOUNT = 37,	--	summon the default Mount

	--	Chat keys
	UI_CHAT_ENTER	=	41,	--	enter chat
	UI_CHAT_REPLY = 42,			--	Reply

	--	Select keys
	HP_AUTOSELECT	=	61,	--	Auto select monster
	HP_SELFACTION = 62,			--	Self action key
	HP_SEL_SELF = 63,			--	Select host player himself
	HP_SEL_TM1 = 64,			--	Select team member 1
	HP_SEL_TM2 = 65,			--	Select team member 2
	HP_SEL_TM3 = 66,			--	Select team member 3
	HP_SEL_TM4 = 67,			--	Select team member 4
	HP_SEL_TM5 = 68,			--	Select team member 5
	HP_ASSIST = 69,				--	Assist target

	--	UI panel keys
	UI_SHOWDLG_CHARACTER = 81,	--	show dialog character
	UI_SHOWDLG_INVENTORY = 82,	--	show dialog inventory
	UI_SHOWDLG_ANQI = 83,		--	show dialog ANQI
	UI_SHOWDLG_SKILL = 84,		--	show dialog skill
	UI_SHOWDLG_TASK = 85,		--	show dialog task
	UI_SHOWDLG_FRIEND = 86,		--	show dialog friend
	UI_SHOWDLG_PET = 87,		--86 show dialog pet
	UI_SHOWDLG_PRODUCE = 88,	--	show dialog produce
	UI_SHOWDLG_TEAM = 89,		--	show dialog team
	UI_SHOWDLG_RANKLIST = 90,	--	show dialog rank list
	UI_SHOWDLG_CASHSHOP = 91,	--	show dialog cash shop
	UI_SHOWDLG_WORLDMAP = 92,	--91 show dialog world map
	--UI_SHOWDLG_HOME,		--  show dialog home
	UI_SHOWDLG_MAIL = 93,		--  show dialog mail
	UI_SHOWDLG_SOCIAL = 94,		-- show dialog social
	--UI_SHOWDLG_HELP,		--	show dialog action edit
	UI_SHOWDLG_ACTION = 95,		--96 show dialog character
	UI_SHOW_ALLPANELS = 96,		--  show all panels

	--	System keys
	SYS_PRINT_SCREEN = 111,--	Print screen
	SYS_TAKEPICTURE = 112,		--	Enter / Leave picture taking
	SYS_BOSS = 113,				--	Boss key
	SYS_DETAILTIP = 114,			--	Detail Tip
	SYS_HIDEELSEPLAYER = 115,	--	Hide else player
	SYS_VIDEOSETTING = 116,		--	Video Setting

	--	Shortcut setting
	--UI_SHOW_SC_1	= 151,	--	show shortcuts 1
	--UI_SHOW_SC_2,			--	show shortcuts 2
	--UI_SHOW_SC_3,			--	show shortcuts 3
	--UI_SHOW_SC_4,			--	show shortcuts 4
	--UI_SHOW_SC_5,			--	show shortcuts 5
	--UI_LOCK_SC,			--	lock / unlock all shortcuts

	--	Shortcut keys
	HP_SHORTCUT_LEFT	= 171,
	HP_SHORTCUT_RIGHT = 172,
	HP_SHORTCUT_ELITE1 = 173,
	HP_SHORTCUT_ELITE2 = 174,
	HP_SHORTCUT_ELITE3 = 175,
	HP_SHORTCUT_ELITE4 = 176,
	HP_SHORTCUT_ELITE5 = 177,
	HP_SHORTCUT_ELITE6 = 178,
	HP_SHORTCUT_ELITE7 = 179,
	HP_SHORTCUT_ELITE8 = 180,
	HP_SHORTCUT_DEFINED = 181,

	--HP_SHORTCUT_COMMON_GROUP,
	HP_SHORTCUT_COMMON1 = 182,
	HP_SHORTCUT_COMMON2 = 183,
	HP_SHORTCUT_COMMON3 = 184,
	HP_SHORTCUT_COMMON4 = 185,
	HP_SHORTCUT_COMMON5 = 186,
	HP_SHORTCUT_COMMON6 = 187,
	HP_SHORTCUT_COMMON7 = 188,
	HP_SHORTCUT_COMMON8 = 189,

	--HP_SHORTCUT_END = HP_SHORTCUT_COMMON4,

	HP_SWITCH_WUXUE = 190,
	--HP_XPSKILL,
	SYS_ALT = 191,			--	System alt, 显示, 不可配置
	SYS_CTRL = 192,			--	System control, 显示, 不可配置
	HP_SWITCH_WUXUE1 = 193,  --  切换武学1-12
	HP_SWITCH_WUXUE2 = 194,
	HP_SWITCH_WUXUE3 = 195,
	HP_SWITCH_WUXUE4 = 196,
	HP_SWITCH_WUXUE5 = 197,
	HP_SWITCH_WUXUE6 = 198,
	HP_SWITCH_WUXUE7 = 199,
	HP_SWITCH_WUXUE8 = 200,
	HP_SWITCH_WUXUE9 = 201,
	HP_SWITCH_WUXUE10 = 202,
	HP_SWITCH_WUXUE11 = 203,
	HP_SWITCH_WUXUE12 = 204,
-- 	HP_SHORTCUT_GROUP2,
-- 	HP_SHORTCUT_2_1	= HP_SHORTCUT_GROUP2,
-- 	HP_SHORTCUT_2_2,
-- 	HP_SHORTCUT_2_3,
-- 	HP_SHORTCUT_2_4,
-- 	HP_SHORTCUT_2_5,
-- 	HP_SHORTCUT_2_6,
-- 	HP_SHORTCUT_2_7,
-- 	HP_SHORTCUT_2_8,
--
-- 	HP_SHORTCUT_GROUP3,
-- 	HP_SHORTCUT_3_1	= HP_SHORTCUT_GROUP3,
-- 	HP_SHORTCUT_3_2,
-- 	HP_SHORTCUT_3_3,
-- 	HP_SHORTCUT_3_4,
-- 	HP_SHORTCUT_3_5,
-- 	HP_SHORTCUT_3_6,
-- 	HP_SHORTCUT_3_7,
-- 	HP_SHORTCUT_3_8,

-- 	HP_SHORTCUT_TEMP1,
-- 	HP_SHORTCUT_TEMP2,
-- 	HP_SHORTCUT_TEMP3,
-- 	HP_SHORTCUT_TEMP4,

--	HP_SHORTCUT_COMBO,
}

--[[#tag push from_excel]]
KeyBoardCfg.list_cfg =
{
	[1] =
	{
		{logickey = 81, name = "人物", desc = "打開/關閉人物介面"},
		{logickey = 82, name = "包裹", desc = "打開/關閉包裹介面"},
		{logickey = 83, name = "暗器", desc = "打開/關閉暗器介面"},
		{logickey = 84, name = "技能", desc = "打開/關閉技能介面"},
		{logickey = 85, name = "任務", desc = "打開/關閉任務介面"},
		{logickey = 86, name = "好友", desc = "打開/關閉好友介面"},
		{logickey = 87, name = "門徒", desc = "打開/關閉門徒介面"},
		{logickey = 88, name = "生產", desc = "打開/關閉生產介面"},
		{logickey = 89, name = "組隊", desc = "打開/關閉組隊介面"},
		{logickey = 90, name = "排行", desc = "打開/關閉排行榜"},
		{logickey = 91, name = "商城", desc = "打開/關閉商城介面"},
		{logickey = 92, name = "世界", desc = "打開/關閉世界地圖"},
		{logickey = 93, name = "郵件", desc = "打開/關閉郵件介面"},
		{logickey = 94, name = "幫派", desc = "打開/關閉幫派介面"},
		{logickey = 95, name = "動作", desc = "打開/關閉動作介面"},
		{logickey = 96, name = "介面", desc = "隱藏/顯示使用者介面"},
		{logickey = 1, name = "前進", desc = "前進"},
		{logickey = 2, name = "後退", desc = "後退"},
		{logickey = 3, name = "左轉", desc = "左轉"},
		{logickey = 4, name = "右轉", desc = "右轉"},
		{logickey = 5, name = "自動\r前進", desc = "自動前進"},
		{logickey = 21, name = "鏡頭\r拉近", desc = "鏡頭拉近"},
		{logickey = 22, name = "鏡頭\r拉遠", desc = "鏡頭拉遠"},
		{logickey = 31, name = "操作", desc = "操作鍵"},
		{logickey = 32, name = "行為", desc = "行為鍵"},
		{logickey = 33, name = "戒備", desc = "戒備"},
		{logickey = 114, name = "詳細\r描述", desc = "顯示詳細描述"},
		{logickey = 115, name = "隱藏\r玩家", desc = "隱藏周圍玩家"},
		{logickey = 116, name = "視覺\r效果", desc = "開啟/關閉高低視覺效果"},
		{logickey = 113, name = "老闆", desc = "老闆鍵"},
		{logickey = 35, name = "召出\r門徒", desc = "召出默認門徒"},
		{logickey = 36, name = "召出\r坐騎", desc = "召出預設坐騎"},
		{logickey = 37, name = "加速跑", desc = "加速跑"},
		{logickey = 41, name = "聊天\r對話", desc = "輸入聊天對話"},
		{logickey = 42, name = "密語\r回覆", desc = "回復私聊信息"},
		{logickey = 61, name = "一鍵\r選怪", desc = "一鍵選怪"},
		{logickey = 62, name = "自我\r施法", desc = "自我施法"},
		{logickey = 63, name = "選擇\r自己", desc = "選擇自己"},
		{logickey = 64, name = "隊友1", desc = "選擇隊友1"},
		{logickey = 65, name = "隊友2", desc = "選擇隊友2"},
		{logickey = 66, name = "隊友3", desc = "選擇隊友3"},
		{logickey = 67, name = "隊友4", desc = "選擇隊友4"},
		{logickey = 68, name = "隊友5", desc = "選擇隊友5"},
		{logickey = 69, name = "協助\r目標", desc = "協助目標"},
		{logickey = 111, name = "截圖", desc = "截圖"},
		{logickey = 112, name = "相機\r模式", desc = "照相機模式"},
		nil,
	},

	[2] =
	{
		{logickey = 171, name = "左鍵\r快捷", desc = "左鍵快速鍵"},
		{logickey = 172, name = "右鍵\r快捷", desc = "右鍵快速鍵"},
		{logickey = 173, name = "絕技\r捷1", desc = "絕技1快速鍵"},
		{logickey = 174, name = "絕技\r捷2", desc = "絕技2快速鍵"},
		{logickey = 175, name = "絕技\r捷3", desc = "絕技3快速鍵"},
		{logickey = 176, name = "絕技\r捷4", desc = "絕技4快速鍵"},
		{logickey = 177, name = "絕技\r捷5", desc = "絕技5快速鍵"},
		{logickey = 178, name = "絕技\r捷6", desc = "絕技6快速鍵"},
		{logickey = 179, name = "絕技\r捷7", desc = "絕技7快速鍵"},
		{logickey = 180, name = "絕技\r捷8", desc = "絕技8快速鍵"},
		{logickey = 181, name = "自創\r套路", desc = "自創套路快速鍵"},
		{logickey = 182, name = "主快\r捷1", desc = "道具欄快速鍵1"},
		{logickey = 183, name = "主快\r捷2", desc = "道具欄快速鍵2"},
		{logickey = 184, name = "主快\r捷3", desc = "道具欄快速鍵3"},
		{logickey = 185, name = "主快\r捷4", desc = "道具欄快速鍵4"},
		{logickey = 186, name = "主快\r捷5", desc = "道具欄快速鍵5"},
		{logickey = 187, name = "主快\r捷6", desc = "道具欄快速鍵6"},
		{logickey = 188, name = "主快\r捷7", desc = "道具欄快速鍵7"},
		{logickey = 189, name = "主快\r捷8", desc = "道具欄快速鍵8"},
		{logickey = 191, name = "強化\r技", desc = "強化技釋放複合鍵"},
		{logickey = 192, name = "顯示\r血條", desc = "顯示頭頂血條"},

		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
	}
}
--[[#tag pop]]



function KeyBoardCfg : GetConfig()
	return KeyBoardCfg.list_cfg
end
