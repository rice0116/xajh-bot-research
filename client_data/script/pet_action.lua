--[[#tag push auto]]

-------------------------------------------
--  宠物交互脚本
-------------------------------------------

PetAction = {}

--	交互类型，1~256
local MsgIDList = {}
MsgIDList[1] = 101
MsgIDList[2] = 102
MsgIDList[3] = 103
MsgIDList[4] = 104
MsgIDList[5] = 105
MsgIDList[6] = 106
MsgIDList[7] = 107
MsgIDList[8] = 108
MsgIDList[9] = 109
MsgIDList[10] = 110
MsgIDList[11] = 111
MsgIDList[12] = 112
MsgIDList[13] = 113
MsgIDList[14] = 114
MsgIDList[15] = 115
MsgIDList[16] = 116
MsgIDList[17] = 117
MsgIDList[18] = 118
MsgIDList[19] = 119
MsgIDList[20] = 120
MsgIDList[21] = 121
MsgIDList[22] = 122
MsgIDList[23] = 123
MsgIDList[24] = 124
MsgIDList[25] = 125
MsgIDList[26] = 126
MsgIDList[27] = 127
MsgIDList[28] = 128
MsgIDList[29] = 129
MsgIDList[30] = 130
MsgIDList[31] = 131
MsgIDList[32] = 132

--	根据交互类型，取对应信息
function PetAction:GetPetAction(typePet,interact_id)
	if PetAction[typePet] and PetAction[typePet][interact_id] then
		return PetAction[typePet][interact_id]
	end
end

--获得界面显示类型
function PetAction:GetMannerInfo(typePet,valManner)
	local val_tbl = {}
	if PetAction[typePet] then
		local type_num = 0
		for k,v in pairs(PetAction[typePet].MapInfo) do
            if valManner >= v[1] then
				type_num = v[2]
			else
				break
			end
		end

		for i=1,type_num do
			val_tbl[i] = PetAction[typePet][i].ui_str
		end
	end
	return val_tbl
end

--============================================================================================
--============================================================================================

-------------------------------------------
--	以下是各个交互类型的定义
-------------------------------------------

--[[
1 鸟兽
2 随从
3 知己
--]]
PetAction[1] =
{
	[1] =
	{
		action		=	1,				--播放的交互动作编号，1~4分别代表交互动作1~4

		--聊天消息，$targetname$表示目标玩家名字， $mastername$ 表示主人名字，$petname$表示宠物名字
		chat_msgid	=	MsgIDList[1],

		--显示在界面上的文字
		ui_str	    =   --[[!AUTO_1]]"0_0_11回家吃飯",
	},

	[2] =
	{
		action		=	2,				--播放的交互动作编号，1~4分别代表交互动作1~4

		--聊天消息，$targetname$表示目标玩家名字， $mastername$ 表示主人名字
		chat_msgid	=	MsgIDList[2],

		--显示在界面上的文字
		ui_str	    =   --[[!AUTO_2]]"0_1_想死你啦",
	},

	[3] =
	{
		action		=	3,				--播放的交互动作编号，1~4分别代表交互动作1~4

		--聊天消息，$targetname$表示目标玩家名字， $mastername$ 表示主人名字
		chat_msgid	=	MsgIDList[3],

		--显示在界面上的文字
		ui_str	    =   --[[!AUTO_3]]"0_2_路過的",
	},

	[4] =
	{
		action		=	4,				--播放的交互动作编号，1~4分别代表交互动作1~4

		--聊天消息，$targetname$表示目标玩家名字， $mastername$ 表示主人名字
		chat_msgid	=	MsgIDList[4],

		--显示在界面上的文字
		ui_str	    =   --[[!AUTO_4]]"0_3_寂寞",
	},

	[5] =
	{
		action		=	4,				--播放的交互动作编号，1~4分别代表交互动作1~4

		--聊天消息，$targetname$表示目标玩家名字， $mastername$ 表示主人名字
		chat_msgid	=	MsgIDList[5],

		--显示在界面上的文字
		ui_str	    =   --[[!AUTO_5]]"0_4_冷",
	},

	[6] =
	{
		action		=	4,				--播放的交互动作编号，1~4分别代表交互动作1~4

		--聊天消息，$targetname$表示目标玩家名字， $mastername$ 表示主人名字
		chat_msgid	=	MsgIDList[6],

		--显示在界面上的文字
		ui_str	    =   --[[!AUTO_6]]"0_5_握個手",
	},

	[7] =
	{
		action		=	4,				--播放的交互动作编号，1~4分别代表交互动作1~4

		--聊天消息，$targetname$表示目标玩家名字， $mastername$ 表示主人名字
		chat_msgid	=	MsgIDList[7],

		--显示在界面上的文字
		ui_str	    =   --[[!AUTO_7]]"0_6_打一拳",
	},

	[8] =
	{
		action		=	4,				--播放的交互动作编号，1~4分别代表交互动作1~4

		--聊天消息，$targetname$表示目标玩家名字， $mastername$ 表示主人名字
		chat_msgid	=	MsgIDList[8],

		--显示在界面上的文字
		ui_str	    =   --[[!AUTO_8]]"0_7_戳一下",
	},

	[9] =
	{
		action		=	4,				--播放的交互动作编号，1~4分别代表交互动作1~4

		--聊天消息，$targetname$表示目标玩家名字， $mastername$ 表示主人名字
		chat_msgid	=	MsgIDList[9],

		--显示在界面上的文字
		ui_str	    =   --[[!AUTO_9]]"0_8_嚇一跳",
	},

	[10] =
	{
		action		=	4,				--播放的交互动作编号，1~4分别代表交互动作1~4

		--聊天消息，$targetname$表示目标玩家名字， $mastername$ 表示主人名字
		chat_msgid	=	MsgIDList[10],

		--显示在界面上的文字
		ui_str	    =   --[[!AUTO_10]]"0_9_悄悄話",
	},

	[11] =
	{
		action		=	4,				--播放的交互动作编号，1~4分别代表交互动作1~4

		--聊天消息，$targetname$表示目标玩家名字， $mastername$ 表示主人名字
		chat_msgid	=	MsgIDList[11],

		--显示在界面上的文字
		ui_str	    =   --[[!AUTO_11]]"0_10_開心",
	},

	[12] =
	{
		action		=	4,				--播放的交互动作编号，1~4分别代表交互动作1~4

		--聊天消息，$targetname$表示目标玩家名字， $mastername$ 表示主人名字
		chat_msgid	=	MsgIDList[12],

		--显示在界面上的文字
		ui_str	    =   --[[!AUTO_12]]"0_11_哭泣",
	},

	[13] =
	{
		action		=	4,				--播放的交互动作编号，1~4分别代表交互动作1~4

		--聊天消息，$targetname$表示目标玩家名字， $mastername$ 表示主人名字
		chat_msgid	=	MsgIDList[13],

		--显示在界面上的文字
		ui_str	    =   --[[!AUTO_13]]"0_12_糾結",
	},

	[14] =
	{
		action		=	4,				--播放的交互动作编号，1~4分别代表交互动作1~4

		--聊天消息，$targetname$表示目标玩家名字， $mastername$ 表示主人名字
		chat_msgid	=	MsgIDList[14],

		--显示在界面上的文字
		ui_str	    =   --[[!AUTO_14]]"0_13_疑問",
	},

	[15] =
	{
		action		=	4,				--播放的交互动作编号，1~4分别代表交互动作1~4

		--聊天消息，$targetname$表示目标玩家名字， $mastername$ 表示主人名字
		chat_msgid	=	MsgIDList[15],

		--显示在界面上的文字
		ui_str	    =   --[[!AUTO_15]]"0_14_鄙視",
	},

	[16] =
	{
		action		=	4,				--播放的交互动作编号，1~4分别代表交互动作1~4

		--聊天消息，$targetname$表示目标玩家名字， $mastername$ 表示主人名字
		chat_msgid	=	MsgIDList[16],

		--显示在界面上的文字
		ui_str	    =   --[[!AUTO_16]]"0_15_激動",
	},

	[17] =
	{
		action		=	4,				--播放的交互动作编号，1~4分别代表交互动作1~4

		--聊天消息，$targetname$表示目标玩家名字， $mastername$ 表示主人名字
		chat_msgid	=	MsgIDList[17],

		--显示在界面上的文字
		ui_str	    =   --[[!AUTO_17]]"0_16_示愛",
	},


	[18] =
	{
		action		=	4,				--播放的交互动作编号，1~4分别代表交互动作1~4

		--聊天消息，$targetname$表示目标玩家名字， $mastername$ 表示主人名字
		chat_msgid	=	MsgIDList[18],

		--显示在界面上的文字
		ui_str	    =   --[[!AUTO_18]]"0_17_認錯",
	},

	[19] =
	{
		action		=	4,				--播放的交互动作编号，1~4分别代表交互动作1~4

		--聊天消息，$targetname$表示目标玩家名字， $mastername$ 表示主人名字
		chat_msgid	=	MsgIDList[19],

		--显示在界面上的文字
		ui_str	    =   --[[!AUTO_19]]"0_18_親親",
	},

	[20] =
	{
		action		=	4,				--播放的交互动作编号，1~4分别代表交互动作1~4

		--聊天消息，$targetname$表示目标玩家名字， $mastername$ 表示主人名字
		chat_msgid	=	MsgIDList[20],

		--显示在界面上的文字
		ui_str	    =   --[[!AUTO_20]]"0_19_可愛",
	},

	[21] =
	{
		action		=	4,				--播放的交互动作编号，1~4分别代表交互动作1~4

		--聊天消息，$targetname$表示目标玩家名字， $mastername$ 表示主人名字
		chat_msgid	=	MsgIDList[21],

		--显示在界面上的文字
		ui_str	    =   --[[!AUTO_21]]"0_20_諂笑",
	},

	[22] =
	{
		action		=	4,				--播放的交互动作编号，1~4分别代表交互动作1~4

		--聊天消息，$targetname$表示目标玩家名字， $mastername$ 表示主人名字
		chat_msgid	=	MsgIDList[22],

		--显示在界面上的文字
		ui_str	    =   --[[!AUTO_22]]"0_21_耍帥",
	},

	[23] =
	{
		action		=	4,				--播放的交互动作编号，1~4分别代表交互动作1~4

		--聊天消息，$targetname$表示目标玩家名字， $mastername$ 表示主人名字
		chat_msgid	=	MsgIDList[23],

		--显示在界面上的文字
		ui_str	    =   --[[!AUTO_23]]"0_22_發呆",
	},

	[24] =
	{
		action		=	4,				--播放的交互动作编号，1~4分别代表交互动作1~4

		--聊天消息，$targetname$表示目标玩家名字， $mastername$ 表示主人名字
		chat_msgid	=	MsgIDList[24],

		--显示在界面上的文字
		ui_str	    =   --[[!AUTO_24]]"0_23_幸福",
	},

	[25] =
	{
		action		=	4,				--播放的交互动作编号，1~4分别代表交互动作1~4

		--聊天消息，$targetname$表示目标玩家名字， $mastername$ 表示主人名字
		chat_msgid	=	MsgIDList[25],

		--显示在界面上的文字
		ui_str	    =   --[[!AUTO_25]]"0_24_崇拜",
	},

	[26] =
	{
		action		=	4,				--播放的交互动作编号，1~4分别代表交互动作1~4

		--聊天消息，$targetname$表示目标玩家名字， $mastername$ 表示主人名字
		chat_msgid	=	MsgIDList[26],

		--显示在界面上的文字
		ui_str	    =   --[[!AUTO_26]]"0_25_謝謝",
	},

	[27] =
	{
		action		=	4,				--播放的交互动作编号，1~4分别代表交互动作1~4

		--聊天消息，$targetname$表示目标玩家名字， $mastername$ 表示主人名字
		chat_msgid	=	MsgIDList[27],

		--显示在界面上的文字
		ui_str	    =   --[[!AUTO_27]]"0_26_幽怨",
	},

	[28] =
	{
		action		=	4,				--播放的交互动作编号，1~4分别代表交互动作1~4

		--聊天消息，$targetname$表示目标玩家名字， $mastername$ 表示主人名字
		chat_msgid	=	MsgIDList[28],

		--显示在界面上的文字
		ui_str	    =   --[[!AUTO_28]]"0_27_告別",
	},

	[29] =
	{
		action		=	4,				--播放的交互动作编号，1~4分别代表交互动作1~4

		--聊天消息，$targetname$表示目标玩家名字， $mastername$ 表示主人名字
		chat_msgid	=	MsgIDList[29],

		--显示在界面上的文字
		ui_str	    =   --[[!AUTO_29]]"0_28_鬱悶",
	},

	[30] =
	{
		action		=	4,				--播放的交互动作编号，1~4分别代表交互动作1~4

		--聊天消息，$targetname$表示目标玩家名字， $mastername$ 表示主人名字
		chat_msgid	=	MsgIDList[30],

		--显示在界面上的文字
		ui_str	    =   --[[!AUTO_30]]"0_29_誇獎",
	},

	[31] =
	{
		action		=	4,				--播放的交互动作编号，1~4分别代表交互动作1~4

		--聊天消息，$targetname$表示目标玩家名字， $mastername$ 表示主人名字
		chat_msgid	=	MsgIDList[31],

		--显示在界面上的文字
		ui_str	    =   --[[!AUTO_31]]"0_30_悲傷",
	},

	[32] =
	{
		action		=	4,				--播放的交互动作编号，1~4分别代表交互动作1~4

		--聊天消息，$targetname$表示目标玩家名字， $mastername$ 表示主人名字
		chat_msgid	=	MsgIDList[32],

		--显示在界面上的文字
		ui_str	    =   --[[!AUTO_32]]"0_31_豪爽",
	},

	--礼貌值和打招呼数目对应关系
	MapInfo = {{0,32}},
	--,{20,4},{25,5},{35,6},{45,7},{55,8},{65,9},{75,10},{90,11},{105,12},{120,13},{135,14},{150,15},{165,16},
	--{180,17},{200,18},{220,19},{240,20},{260,21},{280,22},{300,23},{320,24},{340,25},{370,26},{400,27},{430,28},{460,29},{500,30},{600,31},{700,32}},
}

PetAction[2] =
{
	[1] =
	{
		action		=	1,				--播放的交互动作编号，1~4分别代表交互动作1~4

		--聊天消息，$targetname$表示目标玩家名字， $mastername$ 表示主人名字，$petname$表示宠物名字
		chat_msgid	=	MsgIDList[1],

		--显示在界面上的文字
		ui_str	    =   --[[!AUTO_33]]"0_0_回家吃飯",
	},

	[2] =
	{
		action		=	2,				--播放的交互动作编号，1~4分别代表交互动作1~4

		--聊天消息，$targetname$表示目标玩家名字， $mastername$ 表示主人名字
		chat_msgid	=	MsgIDList[2],

		--显示在界面上的文字
		ui_str	    =   --[[!AUTO_34]]"0_1_想死你啦",
	},

	[3] =
	{
		action		=	3,				--播放的交互动作编号，1~4分别代表交互动作1~4

		--聊天消息，$targetname$表示目标玩家名字， $mastername$ 表示主人名字
		chat_msgid	=	MsgIDList[3],

		--显示在界面上的文字
		ui_str	    =   --[[!AUTO_35]]"0_2_路過的",
	},

	[4] =
	{
		action		=	4,				--播放的交互动作编号，1~4分别代表交互动作1~4

		--聊天消息，$targetname$表示目标玩家名字， $mastername$ 表示主人名字
		chat_msgid	=	MsgIDList[4],

		--显示在界面上的文字
		ui_str	    =   --[[!AUTO_36]]"0_3_寂寞",
	},

	[5] =
	{
		action		=	4,				--播放的交互动作编号，1~4分别代表交互动作1~4

		--聊天消息，$targetname$表示目标玩家名字， $mastername$ 表示主人名字
		chat_msgid	=	MsgIDList[5],

		--显示在界面上的文字
		ui_str	    =   --[[!AUTO_37]]"0_4_冷",
	},

	[6] =
	{
		action		=	4,				--播放的交互动作编号，1~4分别代表交互动作1~4

		--聊天消息，$targetname$表示目标玩家名字， $mastername$ 表示主人名字
		chat_msgid	=	MsgIDList[6],

		--显示在界面上的文字
		ui_str	    =   --[[!AUTO_38]]"0_5_握個手",
	},

	[7] =
	{
		action		=	4,				--播放的交互动作编号，1~4分别代表交互动作1~4

		--聊天消息，$targetname$表示目标玩家名字， $mastername$ 表示主人名字
		chat_msgid	=	MsgIDList[7],

		--显示在界面上的文字
		ui_str	    =   --[[!AUTO_39]]"0_6_打一拳",
	},

	[8] =
	{
		action		=	4,				--播放的交互动作编号，1~4分别代表交互动作1~4

		--聊天消息，$targetname$表示目标玩家名字， $mastername$ 表示主人名字
		chat_msgid	=	MsgIDList[8],

		--显示在界面上的文字
		ui_str	    =   --[[!AUTO_40]]"0_7_戳一下",
	},

	[9] =
	{
		action		=	4,				--播放的交互动作编号，1~4分别代表交互动作1~4

		--聊天消息，$targetname$表示目标玩家名字， $mastername$ 表示主人名字
		chat_msgid	=	MsgIDList[9],

		--显示在界面上的文字
		ui_str	    =   --[[!AUTO_41]]"0_8_嚇一跳",
	},

	[10] =
	{
		action		=	4,				--播放的交互动作编号，1~4分别代表交互动作1~4

		--聊天消息，$targetname$表示目标玩家名字， $mastername$ 表示主人名字
		chat_msgid	=	MsgIDList[10],

		--显示在界面上的文字
		ui_str	    =   --[[!AUTO_42]]"0_9_悄悄話",
	},

	[11] =
	{
		action		=	4,				--播放的交互动作编号，1~4分别代表交互动作1~4

		--聊天消息，$targetname$表示目标玩家名字， $mastername$ 表示主人名字
		chat_msgid	=	MsgIDList[11],

		--显示在界面上的文字
		ui_str	    =   --[[!AUTO_43]]"0_10_開心",
	},

	[12] =
	{
		action		=	4,				--播放的交互动作编号，1~4分别代表交互动作1~4

		--聊天消息，$targetname$表示目标玩家名字， $mastername$ 表示主人名字
		chat_msgid	=	MsgIDList[12],

		--显示在界面上的文字
		ui_str	    =   --[[!AUTO_44]]"0_11_哭泣",
	},

	[13] =
	{
		action		=	4,				--播放的交互动作编号，1~4分别代表交互动作1~4

		--聊天消息，$targetname$表示目标玩家名字， $mastername$ 表示主人名字
		chat_msgid	=	MsgIDList[13],

		--显示在界面上的文字
		ui_str	    =   --[[!AUTO_45]]"0_12_糾結",
	},

	[14] =
	{
		action		=	4,				--播放的交互动作编号，1~4分别代表交互动作1~4

		--聊天消息，$targetname$表示目标玩家名字， $mastername$ 表示主人名字
		chat_msgid	=	MsgIDList[14],

		--显示在界面上的文字
		ui_str	    =   --[[!AUTO_46]]"0_13_疑問",
	},

	[15] =
	{
		action		=	4,				--播放的交互动作编号，1~4分别代表交互动作1~4

		--聊天消息，$targetname$表示目标玩家名字， $mastername$ 表示主人名字
		chat_msgid	=	MsgIDList[15],

		--显示在界面上的文字
		ui_str	    =   --[[!AUTO_47]]"0_14_鄙視",
	},

	[16] =
	{
		action		=	4,				--播放的交互动作编号，1~4分别代表交互动作1~4

		--聊天消息，$targetname$表示目标玩家名字， $mastername$ 表示主人名字
		chat_msgid	=	MsgIDList[16],

		--显示在界面上的文字
		ui_str	    =   --[[!AUTO_48]]"0_15_激動",
	},

	[17] =
	{
		action		=	4,				--播放的交互动作编号，1~4分别代表交互动作1~4

		--聊天消息，$targetname$表示目标玩家名字， $mastername$ 表示主人名字
		chat_msgid	=	MsgIDList[17],

		--显示在界面上的文字
		ui_str	    =   --[[!AUTO_49]]"0_16_示愛",
	},


	[18] =
	{
		action		=	4,				--播放的交互动作编号，1~4分别代表交互动作1~4

		--聊天消息，$targetname$表示目标玩家名字， $mastername$ 表示主人名字
		chat_msgid	=	MsgIDList[18],

		--显示在界面上的文字
		ui_str	    =   --[[!AUTO_50]]"0_17_認錯",
	},

	[19] =
	{
		action		=	4,				--播放的交互动作编号，1~4分别代表交互动作1~4

		--聊天消息，$targetname$表示目标玩家名字， $mastername$ 表示主人名字
		chat_msgid	=	MsgIDList[19],

		--显示在界面上的文字
		ui_str	    =   --[[!AUTO_51]]"0_18_親親",
	},

	[20] =
	{
		action		=	4,				--播放的交互动作编号，1~4分别代表交互动作1~4

		--聊天消息，$targetname$表示目标玩家名字， $mastername$ 表示主人名字
		chat_msgid	=	MsgIDList[20],

		--显示在界面上的文字
		ui_str	    =   --[[!AUTO_52]]"0_19_可愛",
	},

	[21] =
	{
		action		=	4,				--播放的交互动作编号，1~4分别代表交互动作1~4

		--聊天消息，$targetname$表示目标玩家名字， $mastername$ 表示主人名字
		chat_msgid	=	MsgIDList[21],

		--显示在界面上的文字
		ui_str	    =   --[[!AUTO_53]]"0_20_諂笑",
	},

	[22] =
	{
		action		=	4,				--播放的交互动作编号，1~4分别代表交互动作1~4

		--聊天消息，$targetname$表示目标玩家名字， $mastername$ 表示主人名字
		chat_msgid	=	MsgIDList[22],

		--显示在界面上的文字
		ui_str	    =   --[[!AUTO_54]]"0_21_耍帥",
	},

	[23] =
	{
		action		=	4,				--播放的交互动作编号，1~4分别代表交互动作1~4

		--聊天消息，$targetname$表示目标玩家名字， $mastername$ 表示主人名字
		chat_msgid	=	MsgIDList[23],

		--显示在界面上的文字
		ui_str	    =   --[[!AUTO_55]]"0_22_發呆",
	},

	[24] =
	{
		action		=	4,				--播放的交互动作编号，1~4分别代表交互动作1~4

		--聊天消息，$targetname$表示目标玩家名字， $mastername$ 表示主人名字
		chat_msgid	=	MsgIDList[24],

		--显示在界面上的文字
		ui_str	    =   --[[!AUTO_56]]"0_23_幸福",
	},

	[25] =
	{
		action		=	4,				--播放的交互动作编号，1~4分别代表交互动作1~4

		--聊天消息，$targetname$表示目标玩家名字， $mastername$ 表示主人名字
		chat_msgid	=	MsgIDList[25],

		--显示在界面上的文字
		ui_str	    =   --[[!AUTO_57]]"0_24_崇拜",
	},

	[26] =
	{
		action		=	4,				--播放的交互动作编号，1~4分别代表交互动作1~4

		--聊天消息，$targetname$表示目标玩家名字， $mastername$ 表示主人名字
		chat_msgid	=	MsgIDList[26],

		--显示在界面上的文字
		ui_str	    =   --[[!AUTO_58]]"0_25_謝謝",
	},

	[27] =
	{
		action		=	4,				--播放的交互动作编号，1~4分别代表交互动作1~4

		--聊天消息，$targetname$表示目标玩家名字， $mastername$ 表示主人名字
		chat_msgid	=	MsgIDList[27],

		--显示在界面上的文字
		ui_str	    =   --[[!AUTO_59]]"0_26_幽怨",
	},

	[28] =
	{
		action		=	4,				--播放的交互动作编号，1~4分别代表交互动作1~4

		--聊天消息，$targetname$表示目标玩家名字， $mastername$ 表示主人名字
		chat_msgid	=	MsgIDList[28],

		--显示在界面上的文字
		ui_str	    =   --[[!AUTO_60]]"0_27_告別",
	},

	[29] =
	{
		action		=	4,				--播放的交互动作编号，1~4分别代表交互动作1~4

		--聊天消息，$targetname$表示目标玩家名字， $mastername$ 表示主人名字
		chat_msgid	=	MsgIDList[29],

		--显示在界面上的文字
		ui_str	    =   --[[!AUTO_61]]"0_28_鬱悶",
	},

	[30] =
	{
		action		=	4,				--播放的交互动作编号，1~4分别代表交互动作1~4

		--聊天消息，$targetname$表示目标玩家名字， $mastername$ 表示主人名字
		chat_msgid	=	MsgIDList[30],

		--显示在界面上的文字
		ui_str	    =   --[[!AUTO_62]]"0_29_誇獎",
	},

	[31] =
	{
		action		=	4,				--播放的交互动作编号，1~4分别代表交互动作1~4

		--聊天消息，$targetname$表示目标玩家名字， $mastername$ 表示主人名字
		chat_msgid	=	MsgIDList[31],

		--显示在界面上的文字
		ui_str	    =   --[[!AUTO_63]]"0_30_悲傷",
	},

	[32] =
	{
		action		=	4,				--播放的交互动作编号，1~4分别代表交互动作1~4

		--聊天消息，$targetname$表示目标玩家名字， $mastername$ 表示主人名字
		chat_msgid	=	MsgIDList[32],

		--显示在界面上的文字
		ui_str	    =   --[[!AUTO_64]]"0_31_豪爽",
	},

	--礼貌值和打招呼数目对应关系
	MapInfo = {{0,32}},
}

PetAction[3] =
{
	[1] =
	{
		action		=	1,				--播放的交互动作编号，1~4分别代表交互动作1~4

		--聊天消息，$targetname$表示目标玩家名字， $mastername$ 表示主人名字，$petname$表示宠物名字
		chat_msgid	=	MsgIDList[1],

		--显示在界面上的文字
		ui_str	    =   --[[!AUTO_65]]"0_0_回家吃飯",
	},

	[2] =
	{
		action		=	2,				--播放的交互动作编号，1~4分别代表交互动作1~4

		--聊天消息，$targetname$表示目标玩家名字， $mastername$ 表示主人名字
		chat_msgid	=	MsgIDList[2],

		--显示在界面上的文字
		ui_str	    =   --[[!AUTO_66]]"0_1_想死你啦",
	},

	[3] =
	{
		action		=	3,				--播放的交互动作编号，1~4分别代表交互动作1~4

		--聊天消息，$targetname$表示目标玩家名字， $mastername$ 表示主人名字
		chat_msgid	=	MsgIDList[3],

		--显示在界面上的文字
		ui_str	    =   --[[!AUTO_67]]"0_2_路過的",
	},

	[4] =
	{
		action		=	4,				--播放的交互动作编号，1~4分别代表交互动作1~4

		--聊天消息，$targetname$表示目标玩家名字， $mastername$ 表示主人名字
		chat_msgid	=	MsgIDList[4],

		--显示在界面上的文字
		ui_str	    =   --[[!AUTO_68]]"0_3_寂寞",
	},

	[5] =
	{
		action		=	4,				--播放的交互动作编号，1~4分别代表交互动作1~4

		--聊天消息，$targetname$表示目标玩家名字， $mastername$ 表示主人名字
		chat_msgid	=	MsgIDList[5],

		--显示在界面上的文字
		ui_str	    =   --[[!AUTO_69]]"0_4_冷",
	},

	[6] =
	{
		action		=	4,				--播放的交互动作编号，1~4分别代表交互动作1~4

		--聊天消息，$targetname$表示目标玩家名字， $mastername$ 表示主人名字
		chat_msgid	=	MsgIDList[6],

		--显示在界面上的文字
		ui_str	    =   --[[!AUTO_70]]"0_5_握個手",
	},

	[7] =
	{
		action		=	4,				--播放的交互动作编号，1~4分别代表交互动作1~4

		--聊天消息，$targetname$表示目标玩家名字， $mastername$ 表示主人名字
		chat_msgid	=	MsgIDList[7],

		--显示在界面上的文字
		ui_str	    =   --[[!AUTO_71]]"0_6_打一拳",
	},

	[8] =
	{
		action		=	4,				--播放的交互动作编号，1~4分别代表交互动作1~4

		--聊天消息，$targetname$表示目标玩家名字， $mastername$ 表示主人名字
		chat_msgid	=	MsgIDList[8],

		--显示在界面上的文字
		ui_str	    =   --[[!AUTO_72]]"0_7_戳一下",
	},

	[9] =
	{
		action		=	4,				--播放的交互动作编号，1~4分别代表交互动作1~4

		--聊天消息，$targetname$表示目标玩家名字， $mastername$ 表示主人名字
		chat_msgid	=	MsgIDList[9],

		--显示在界面上的文字
		ui_str	    =   --[[!AUTO_73]]"0_8_嚇一跳",
	},

	[10] =
	{
		action		=	4,				--播放的交互动作编号，1~4分别代表交互动作1~4

		--聊天消息，$targetname$表示目标玩家名字， $mastername$ 表示主人名字
		chat_msgid	=	MsgIDList[10],

		--显示在界面上的文字
		ui_str	    =   --[[!AUTO_74]]"0_9_悄悄話",
	},

	[11] =
	{
		action		=	4,				--播放的交互动作编号，1~4分别代表交互动作1~4

		--聊天消息，$targetname$表示目标玩家名字， $mastername$ 表示主人名字
		chat_msgid	=	MsgIDList[11],

		--显示在界面上的文字
		ui_str	    =   --[[!AUTO_75]]"0_10_開心",
	},

	[12] =
	{
		action		=	4,				--播放的交互动作编号，1~4分别代表交互动作1~4

		--聊天消息，$targetname$表示目标玩家名字， $mastername$ 表示主人名字
		chat_msgid	=	MsgIDList[12],

		--显示在界面上的文字
		ui_str	    =   --[[!AUTO_76]]"0_11_哭泣",
	},

	[13] =
	{
		action		=	4,				--播放的交互动作编号，1~4分别代表交互动作1~4

		--聊天消息，$targetname$表示目标玩家名字， $mastername$ 表示主人名字
		chat_msgid	=	MsgIDList[13],

		--显示在界面上的文字
		ui_str	    =   --[[!AUTO_77]]"0_12_糾結",
	},

	[14] =
	{
		action		=	4,				--播放的交互动作编号，1~4分别代表交互动作1~4

		--聊天消息，$targetname$表示目标玩家名字， $mastername$ 表示主人名字
		chat_msgid	=	MsgIDList[14],

		--显示在界面上的文字
		ui_str	    =   --[[!AUTO_78]]"0_13_疑問",
	},

	[15] =
	{
		action		=	4,				--播放的交互动作编号，1~4分别代表交互动作1~4

		--聊天消息，$targetname$表示目标玩家名字， $mastername$ 表示主人名字
		chat_msgid	=	MsgIDList[15],

		--显示在界面上的文字
		ui_str	    =   --[[!AUTO_79]]"0_14_鄙視",
	},

	[16] =
	{
		action		=	4,				--播放的交互动作编号，1~4分别代表交互动作1~4

		--聊天消息，$targetname$表示目标玩家名字， $mastername$ 表示主人名字
		chat_msgid	=	MsgIDList[16],

		--显示在界面上的文字
		ui_str	    =   --[[!AUTO_80]]"0_15_激動",
	},

	[17] =
	{
		action		=	4,				--播放的交互动作编号，1~4分别代表交互动作1~4

		--聊天消息，$targetname$表示目标玩家名字， $mastername$ 表示主人名字
		chat_msgid	=	MsgIDList[17],

		--显示在界面上的文字
		ui_str	    =   --[[!AUTO_81]]"0_16_示愛",
	},


	[18] =
	{
		action		=	4,				--播放的交互动作编号，1~4分别代表交互动作1~4

		--聊天消息，$targetname$表示目标玩家名字， $mastername$ 表示主人名字
		chat_msgid	=	MsgIDList[18],

		--显示在界面上的文字
		ui_str	    =   --[[!AUTO_82]]"0_17_認錯",
	},

	[19] =
	{
		action		=	4,				--播放的交互动作编号，1~4分别代表交互动作1~4

		--聊天消息，$targetname$表示目标玩家名字， $mastername$ 表示主人名字
		chat_msgid	=	MsgIDList[19],

		--显示在界面上的文字
		ui_str	    =   --[[!AUTO_83]]"0_18_親親",
	},

	[20] =
	{
		action		=	4,				--播放的交互动作编号，1~4分别代表交互动作1~4

		--聊天消息，$targetname$表示目标玩家名字， $mastername$ 表示主人名字
		chat_msgid	=	MsgIDList[20],

		--显示在界面上的文字
		ui_str	    =   --[[!AUTO_84]]"0_19_可愛",
	},

	[21] =
	{
		action		=	4,				--播放的交互动作编号，1~4分别代表交互动作1~4

		--聊天消息，$targetname$表示目标玩家名字， $mastername$ 表示主人名字
		chat_msgid	=	MsgIDList[21],

		--显示在界面上的文字
		ui_str	    =   --[[!AUTO_85]]"0_20_諂笑",
	},

	[22] =
	{
		action		=	4,				--播放的交互动作编号，1~4分别代表交互动作1~4

		--聊天消息，$targetname$表示目标玩家名字， $mastername$ 表示主人名字
		chat_msgid	=	MsgIDList[22],

		--显示在界面上的文字
		ui_str	    =   --[[!AUTO_86]]"0_21_耍帥",
	},

	[23] =
	{
		action		=	4,				--播放的交互动作编号，1~4分别代表交互动作1~4

		--聊天消息，$targetname$表示目标玩家名字， $mastername$ 表示主人名字
		chat_msgid	=	MsgIDList[23],

		--显示在界面上的文字
		ui_str	    =   --[[!AUTO_87]]"0_22_發呆",
	},

	[24] =
	{
		action		=	4,				--播放的交互动作编号，1~4分别代表交互动作1~4

		--聊天消息，$targetname$表示目标玩家名字， $mastername$ 表示主人名字
		chat_msgid	=	MsgIDList[24],

		--显示在界面上的文字
		ui_str	    =   --[[!AUTO_88]]"0_23_幸福",
	},

	[25] =
	{
		action		=	4,				--播放的交互动作编号，1~4分别代表交互动作1~4

		--聊天消息，$targetname$表示目标玩家名字， $mastername$ 表示主人名字
		chat_msgid	=	MsgIDList[25],

		--显示在界面上的文字
		ui_str	    =   --[[!AUTO_89]]"0_24_崇拜",
	},

	[26] =
	{
		action		=	4,				--播放的交互动作编号，1~4分别代表交互动作1~4

		--聊天消息，$targetname$表示目标玩家名字， $mastername$ 表示主人名字
		chat_msgid	=	MsgIDList[26],

		--显示在界面上的文字
		ui_str	    =   --[[!AUTO_90]]"0_25_謝謝",
	},

	[27] =
	{
		action		=	4,				--播放的交互动作编号，1~4分别代表交互动作1~4

		--聊天消息，$targetname$表示目标玩家名字， $mastername$ 表示主人名字
		chat_msgid	=	MsgIDList[27],

		--显示在界面上的文字
		ui_str	    =   --[[!AUTO_91]]"0_26_幽怨",
	},

	[28] =
	{
		action		=	4,				--播放的交互动作编号，1~4分别代表交互动作1~4

		--聊天消息，$targetname$表示目标玩家名字， $mastername$ 表示主人名字
		chat_msgid	=	MsgIDList[28],

		--显示在界面上的文字
		ui_str	    =   --[[!AUTO_92]]"0_27_告別",
	},

	[29] =
	{
		action		=	4,				--播放的交互动作编号，1~4分别代表交互动作1~4

		--聊天消息，$targetname$表示目标玩家名字， $mastername$ 表示主人名字
		chat_msgid	=	MsgIDList[29],

		--显示在界面上的文字
		ui_str	    =   --[[!AUTO_93]]"0_28_鬱悶",
	},

	[30] =
	{
		action		=	4,				--播放的交互动作编号，1~4分别代表交互动作1~4

		--聊天消息，$targetname$表示目标玩家名字， $mastername$ 表示主人名字
		chat_msgid	=	MsgIDList[30],

		--显示在界面上的文字
		ui_str	    =   --[[!AUTO_94]]"0_29_誇獎",
	},

	[31] =
	{
		action		=	4,				--播放的交互动作编号，1~4分别代表交互动作1~4

		--聊天消息，$targetname$表示目标玩家名字， $mastername$ 表示主人名字
		chat_msgid	=	MsgIDList[31],

		--显示在界面上的文字
		ui_str	    =   --[[!AUTO_95]]"0_30_悲傷",
	},

	[32] =
	{
		action		=	4,				--播放的交互动作编号，1~4分别代表交互动作1~4

		--聊天消息，$targetname$表示目标玩家名字， $mastername$ 表示主人名字
		chat_msgid	=	MsgIDList[32],

		--显示在界面上的文字
		ui_str	    =   --[[!AUTO_96]]"0_31_豪爽",
	},

	--礼貌值和打招呼数目对应关系
	MapInfo = {{0,32}},
}


--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--  萌宠交互脚本
-------------------------------------------

CompanionPetCfg = {}

-- tidPet: 萌宠模板id
function CompanionPetCfg:GetCompanionPetCfg(tidPet)
	return CompanionPetCfg[tidPet]
end

function CompanionPetCfg:CompanionPetSayMsg(objType, objWid, objTid, word_idx, pet_name, master_name, target_name)
	local tabMode = ObjSpeak.PetMsgList[word_idx].Mode
	if tabMode then
		local sMsg = GameApi.PetConverSvrMsg(pet_name, master_name, target_name, ObjSpeak.PetMsgList[word_idx].Word)
		if sMsg then
			local mode = ObjSpeak:CopyTable(ObjSpeak.DisplayMode)
			mode = ObjSpeak:BestrowTable(mode, tabMode)
			ret_mode = ObjSpeak:CopyArray(mode)
		end

		--喊话API
		GameApi.ObjSpeak(objType, objWid, objTid, 0, sMsg, ret_mode)
	end
end


-- 萌宠棉花羊
CompanionPetCfg[81440] =
{
	StartBind = true, -- 是否招出的时候就绑上

	CanJumpWhenBind = true, --绑上时是否能跳

	BindHH = --[[!]]"HH_伞",  -- 人的绑定HH
	BindCC = --[[!]]"CC_push",  -- 宠的绑定CC

	Interacts =
	{
		--鼓掌
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_97]]"鼓掌", -- 界面显示名称

			Act_Player = --[[!]]"鼓掌",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作1",	--宠动作名

			pet_msgid	= 527, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--发怒
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_98]]"發怒", -- 界面显示名称

			Act_Player = --[[!]]"发怒",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作2",	--宠动作名

			pet_msgid	= 506, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--伤心
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_99]]"傷心", -- 界面显示名称

			Act_Player = --[[!]]"伤心",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作3",	--宠动作名

			pet_msgid	= 507, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--害羞
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_100]]"害羞", -- 界面显示名称

			Act_Player = --[[!]]"害羞",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作4",	--宠动作名

			pet_msgid	= 505, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--抱起抚摸
		{
			BindLimit = 1, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_101]]"撫摸", --界面显示名称

			Act_Player = --[[!]]"抱棉花羊",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作5",	--宠动作名

			pet_msgid	= 499, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--绑定蹭腿
		{
			BindLimit = 1, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_102]]"蹭腿", --界面显示名称

			Act_Player = --[[!]]"棉花羊蹭腿",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作6",	--宠动作名

			pet_msgid	= 0, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},
	},
}

-- 圣诞驯鹿
CompanionPetCfg[83077] =
{
	StartBind = true, -- 是否招出的时候就绑上

	CanJumpWhenBind = true, --绑上时是否能跳

	BindHH = --[[!]]"HH_伞",  -- 人的绑定HH
	BindCC = --[[!]]"CC_push",  -- 宠的绑定CC

	Interacts =
	{
		--鼓掌
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_103]]"鼓掌", -- 界面显示名称

			Act_Player = --[[!]]"鼓掌",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作1",	--宠动作名

			pet_msgid	= 527, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--发怒
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_104]]"發怒", -- 界面显示名称

			Act_Player = --[[!]]"发怒",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作2",	--宠动作名

			pet_msgid	= 506, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--伤心
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_105]]"傷心", -- 界面显示名称

			Act_Player = --[[!]]"伤心",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作3",	--宠动作名

			pet_msgid	= 507, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--害羞
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_106]]"害羞", -- 界面显示名称

			Act_Player = --[[!]]"害羞",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作4",	--宠动作名

			pet_msgid	= 505, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--抱起抚摸
		{
			BindLimit = 1, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_107]]"撫摸", --界面显示名称

			Act_Player = --[[!]]"抱棉花羊",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作5",	--宠动作名

			pet_msgid	= 498, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},
	},
}

-- 圣诞河马
CompanionPetCfg[92973] =
{
	StartBind = true, -- 是否招出的时候就绑上

	CanJumpWhenBind = true, --绑上时是否能跳

	BindHH = --[[!]]"HH_伞",  -- 人的绑定HH
	BindCC = --[[!]]"CC_push",  -- 宠的绑定CC

	Interacts =
	{
		--鼓掌
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_103]]"鼓掌", -- 界面显示名称

			Act_Player = --[[!]]"鼓掌",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作1",	--宠动作名

			pet_msgid	= 527, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--发怒
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_104]]"發怒", -- 界面显示名称

			Act_Player = --[[!]]"发怒",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作2",	--宠动作名

			pet_msgid	= 506, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--伤心
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_105]]"傷心", -- 界面显示名称

			Act_Player = --[[!]]"伤心",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作3",	--宠动作名

			pet_msgid	= 507, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--害羞
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_106]]"害羞", -- 界面显示名称

			Act_Player = --[[!]]"害羞",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作4",	--宠动作名

			pet_msgid	= 505, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--抱起抚摸
		{
			BindLimit = 1, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_107]]"撫摸", --界面显示名称

			Act_Player = --[[!]]"抱棉花羊",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作5",	--宠动作名

			pet_msgid	= 498, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},
	},
}

-- 熊猫
CompanionPetCfg[83475] =
{
	StartBind = true, -- 是否招出的时候就绑上

	CanJumpWhenBind = true, --绑上时是否能跳

	BindHH = --[[!]]"HH_伞",  -- 人的绑定HH
	BindCC = --[[!]]"CC_push",  -- 宠的绑定CC

	Interacts =
	{
		--鼓掌
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_108]]"鼓掌", -- 界面显示名称

			Act_Player = --[[!]]"鼓掌",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作1",	--宠动作名

			pet_msgid	= 527, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--发怒
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_109]]"發怒", -- 界面显示名称

			Act_Player = --[[!]]"发怒",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作2",	--宠动作名

			pet_msgid	= 506, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--伤心
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_110]]"傷心", -- 界面显示名称

			Act_Player = --[[!]]"伤心",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作3",	--宠动作名

			pet_msgid	= 507, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--害羞
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_111]]"害羞", -- 界面显示名称

			Act_Player = --[[!]]"害羞",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作4",	--宠动作名

			pet_msgid	= 505, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--抱起抚摸
		{
			BindLimit = 1, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_112]]"撫摸", --界面显示名称

			Act_Player = --[[!]]"抱棉花羊",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作5",	--宠动作名

			pet_msgid	= 497, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},
	},
}
-- 年兽
CompanionPetCfg[83529] =
{
	StartBind = true, -- 是否招出的时候就绑上

	CanJumpWhenBind = true, --绑上时是否能跳

	BindHH = --[[!]]"HH_伞",  -- 人的绑定HH
	BindCC = --[[!]]"CC_push",  -- 宠的绑定CC

	Interacts =
	{
		--鼓掌
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_113]]"鼓掌", -- 界面显示名称

			Act_Player = --[[!]]"鼓掌",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作1",	--宠动作名

			pet_msgid	= 527, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--发怒
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_114]]"發怒", -- 界面显示名称

			Act_Player = --[[!]]"发怒",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作2",	--宠动作名

			pet_msgid	= 506, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--伤心
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_115]]"傷心", -- 界面显示名称

			Act_Player = --[[!]]"伤心",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作3",	--宠动作名

			pet_msgid	= 507, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--害羞
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_116]]"害羞", -- 界面显示名称

			Act_Player = --[[!]]"害羞",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作4",	--宠动作名

			pet_msgid	= 505, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--抱起抚摸
		{
			BindLimit = 1, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_117]]"撫摸", --界面显示名称

			Act_Player = --[[!]]"抱棉花羊",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作5",	--宠动作名

			pet_msgid	= 496, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},
	},
}
-- 马上有钱
CompanionPetCfg[83528] =
{
	StartBind = false, -- 是否招出的时候就绑上

	CanJumpWhenBind = true, --绑上时是否能跳

	BindHH = --[[!AUTO_118]]"",  -- 人的绑定HH
	BindCC = --[[!AUTO_119]]"",  -- 宠的绑定CC

	Interacts =
	{
		--鼓掌
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_120]]"鼓掌", -- 界面显示名称

			Act_Player = --[[!]]"鼓掌",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作1",	--宠动作名

			pet_msgid	= 527, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--发怒
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_121]]"發怒", -- 界面显示名称

			Act_Player = --[[!]]"发怒",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作2",	--宠动作名

			pet_msgid	= 506, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--伤心
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_122]]"傷心", -- 界面显示名称

			Act_Player = --[[!]]"伤心",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作3",	--宠动作名

			pet_msgid	= 507, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--害羞
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_123]]"害羞", -- 界面显示名称

			Act_Player = --[[!]]"害羞",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作4",	--宠动作名

			pet_msgid	= 505, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},
	},
}
-- 火鸡
CompanionPetCfg[85173] =
{
	StartBind = true, -- 是否招出的时候就绑上

	CanJumpWhenBind = true, --绑上时是否能跳

	BindHH = --[[!]]"HH_伞",  -- 人的绑定HH
	BindCC = "CC_push",  -- 宠的绑定CC

	Interacts =
	{
		--鼓掌
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = "鼓掌", -- 界面显示名称

			Act_Player = --[[!]]"鼓掌",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作1",	--宠动作名

			pet_msgid	= 527, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},
		--发怒
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = "發怒", -- 界面显示名称

			Act_Player = --[[!]]"发怒",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作2",	--宠动作名

			pet_msgid	= 506, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},
		--伤心
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = "傷心", -- 界面显示名称

			Act_Player = --[[!]]"伤心",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作3",	--宠动作名

			pet_msgid	= 507, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},
		--害羞
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = "害羞", -- 界面显示名称

			Act_Player = --[[!]]"害羞",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作4",	--宠动作名

			pet_msgid	= 505, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},
		--抱起抚摸
		{
			BindLimit = 1, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = "撫摸", --界面显示名称

			Act_Player = --[[!]]"抱棉花羊",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作5",	--宠动作名

			pet_msgid	= 496, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},
	},
}
-- 企鹅
CompanionPetCfg[85174] =
{
	StartBind = true, -- 是否招出的时候就绑上

	CanJumpWhenBind = true, --绑上时是否能跳

	BindHH = --[[!]]"HH_伞",  -- 人的绑定HH
	BindCC = "CC_push",  -- 宠的绑定CC

	Interacts =
	{
		--鼓掌
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = "鼓掌", -- 界面显示名称

			Act_Player = --[[!]]"鼓掌",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作1",	--宠动作名

			pet_msgid	= 527, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--发怒
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = "發怒", -- 界面显示名称

			Act_Player = --[[!]]"发怒",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作2",	--宠动作名

			pet_msgid	= 506, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--伤心
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = "傷心", -- 界面显示名称

			Act_Player = --[[!]]"伤心",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作3",	--宠动作名

			pet_msgid	= 507, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--害羞
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = "害羞", -- 界面显示名称

			Act_Player = --[[!]]"害羞",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作4",	--宠动作名

			pet_msgid	= 505, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},
		--抱起抚摸
		{
			BindLimit = 1, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = "撫摸", --界面显示名称

			Act_Player = --[[!]]"抱棉花羊",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作5",	--宠动作名

			pet_msgid	= 495, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},
	},
}
-- 康师傅企鹅
CompanionPetCfg[85386] =
{
	StartBind = false, -- 是否招出的时候就绑上

	CanJumpWhenBind = true, --绑上时是否能跳

	BindHH = "",  -- 人的绑定HH
	BindCC = "",  -- 宠的绑定CC

	Interacts =
	{
		--鼓掌
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_120]]"鼓掌", -- 界面显示名称

			Act_Player = --[[!]]"鼓掌",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作1",	--宠动作名

			pet_msgid	= 527, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--发怒
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_121]]"發怒", -- 界面显示名称

			Act_Player = --[[!]]"发怒",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作2",	--宠动作名

			pet_msgid	= 506, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--伤心
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_122]]"傷心", -- 界面显示名称

			Act_Player = --[[!]]"伤心",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作3",	--宠动作名

			pet_msgid	= 507, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--害羞
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_123]]"害羞", -- 界面显示名称

			Act_Player = --[[!]]"害羞",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作4",	--宠动作名

			pet_msgid	= 505, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},
	},
}
-- 羊驼
CompanionPetCfg[85527] =
{
	StartBind = true, -- 是否招出的时候就绑上

	CanJumpWhenBind = true, --绑上时是否能跳

	BindHH = --[[!]]"HH_伞",  -- 人的绑定HH
	BindCC = "CC_push",  -- 宠的绑定CC

	Interacts =
	{
		--鼓掌
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = "鼓掌", -- 界面显示名称

			Act_Player = --[[!]]"鼓掌",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作1",	--宠动作名

			pet_msgid	= 527, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--发怒
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = "發怒", -- 界面显示名称

			Act_Player = --[[!]]"发怒",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作2",	--宠动作名

			pet_msgid	= 506, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--伤心
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = "傷心", -- 界面显示名称

			Act_Player = --[[!]]"伤心",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作3",	--宠动作名

			pet_msgid	= 507, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--害羞
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = "害羞", -- 界面显示名称

			Act_Player = --[[!]]"害羞",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作4",	--宠动作名

			pet_msgid	= 505, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},
		--抱起抚摸
		{
			BindLimit = 1, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = "撫摸", --界面显示名称

			Act_Player = --[[!]]"抱棉花羊",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作5",	--宠动作名

			pet_msgid	= 494, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},
	},
}

-- 七夕羊驼
CompanionPetCfg[90669] =
{
	StartBind = true, -- 是否招出的时候就绑上

	CanJumpWhenBind = true, --绑上时是否能跳

	BindHH = --[[!]]"HH_伞",  -- 人的绑定HH
	BindCC = "CC_push",  -- 宠的绑定CC

	Interacts =
	{
		--鼓掌
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = "鼓掌", -- 界面显示名称

			Act_Player = --[[!]]"鼓掌",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作1",	--宠动作名

			pet_msgid	= 527, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--发怒
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = "發怒", -- 界面显示名称

			Act_Player = --[[!]]"发怒",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作2",	--宠动作名

			pet_msgid	= 506, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--伤心
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = "傷心", -- 界面显示名称

			Act_Player = --[[!]]"伤心",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作3",	--宠动作名

			pet_msgid	= 507, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--害羞
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = "害羞", -- 界面显示名称

			Act_Player = --[[!]]"害羞",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作4",	--宠动作名

			pet_msgid	= 505, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},
		--抱起抚摸
		{
			BindLimit = 1, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = "撫摸", --界面显示名称

			Act_Player = --[[!]]"抱棉花羊",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作5",	--宠动作名

			pet_msgid	= 494, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},
	},
}

-- 小鸭嘎嘎
CompanionPetCfg[91163] =
{
	StartBind = true, -- 是否招出的时候就绑上

	CanJumpWhenBind = true, --绑上时是否能跳

	BindHH = --[[!]]"HH_伞",  -- 人的绑定HH
	BindCC = "CC_push",  -- 宠的绑定CC

	Interacts =
	{
		--鼓掌
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = "鼓掌", -- 界面显示名称

			Act_Player = --[[!]]"鼓掌",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作1",	--宠动作名

			pet_msgid	= 527, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--发怒
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = "發怒", -- 界面显示名称

			Act_Player = --[[!]]"发怒",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作2",	--宠动作名

			pet_msgid	= 506, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--伤心
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = "傷心", -- 界面显示名称

			Act_Player = --[[!]]"伤心",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作3",	--宠动作名

			pet_msgid	= 507, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--害羞
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = "害羞", -- 界面显示名称

			Act_Player = --[[!]]"害羞",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作4",	--宠动作名

			pet_msgid	= 505, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},
		--抱起抚摸
		{
			BindLimit = 1, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = "撫摸", --界面显示名称

			Act_Player = --[[!]]"抱棉花羊",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作5",	--宠动作名

			pet_msgid	= 477, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},
	},
}


-- 日本小萌
CompanionPetCfg[85922] =
{
	StartBind = true, -- 是否招出的时候就绑上

	CanJumpWhenBind = true, --绑上时是否能跳

	BindHH = --[[!]]"HH_伞",  -- 人的绑定HH
	BindCC = "CC_push",  -- 宠的绑定CC

	Interacts =
	{
		--鼓掌
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = "鼓掌", -- 界面显示名称

			Act_Player = --[[!]]"鼓掌",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作1",	--宠动作名

			pet_msgid	= 527, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--发怒
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = "發怒", -- 界面显示名称

			Act_Player = --[[!]]"发怒",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作2",	--宠动作名

			pet_msgid	= 506, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--伤心
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = "傷心", -- 界面显示名称

			Act_Player = --[[!]]"伤心",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作3",	--宠动作名

			pet_msgid	= 507, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--害羞
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = "害羞", -- 界面显示名称

			Act_Player = --[[!]]"害羞",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作4",	--宠动作名

			pet_msgid	= 505, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},
		--抱起抚摸
		{
			BindLimit = 1, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = "撫摸", --界面显示名称

			Act_Player = --[[!]]"抱棉花羊",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作5",	--宠动作名

			pet_msgid	= 497, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},
	},
}

-- 竖琴娃娃
CompanionPetCfg[94322] =
{
	StartBind = false, -- 是否招出的时候就绑上

	CanJumpWhenBind = true, --绑上时是否能跳

	BindHH = --[[!AUTO_118]]"",  -- 人的绑定HH
	BindCC = --[[!AUTO_119]]"",  -- 宠的绑定CC

	Interacts =
	{
		--鼓掌
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = "鼓掌", -- 界面显示名称

			Act_Player = --[[!]]"鼓掌",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作1",	--宠动作名

			pet_msgid	= 527, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--发怒
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = "發怒", -- 界面显示名称

			Act_Player = --[[!]]"发怒",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作2",	--宠动作名

			pet_msgid	= 506, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--伤心
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = "傷心", -- 界面显示名称

			Act_Player = --[[!]]"伤心",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作3",	--宠动作名

			pet_msgid	= 507, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--害羞
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = "害羞", -- 界面显示名称

			Act_Player = --[[!]]"害羞",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作4",	--宠动作名

			pet_msgid	= 505, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},
	},
}


-- 猪宝灰灰
CompanionPetCfg[85794] =
{
	StartBind = true, -- 是否招出的时候就绑上

	CanJumpWhenBind = true, --绑上时是否能跳

	BindHH = --[[!]]"HH_伞",  -- 人的绑定HH
	BindCC = --[[!]]"CC_push",  -- 宠的绑定CC

	Interacts =
	{
		--鼓掌
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!]]"鼓掌", -- 界面显示名称

			Act_Player = --[[!]]"鼓掌",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作1",	--宠动作名

			pet_msgid	= 527, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--发怒
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!]]"发怒", -- 界面显示名称

			Act_Player = --[[!]]"发怒",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作2",	--宠动作名

			pet_msgid	= 506, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--伤心
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!]]"伤心", -- 界面显示名称

			Act_Player = --[[!]]"伤心",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作3",	--宠动作名

			pet_msgid	= 507, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--害羞
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!]]"害羞", -- 界面显示名称

			Act_Player = --[[!]]"害羞",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作4",	--宠动作名

			pet_msgid	= 505, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--抱起抚摸
		{
			BindLimit = 1, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!]]"抚摸", --界面显示名称

			Act_Player = --[[!]]"抱棉花羊",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作5",	--宠动作名

			pet_msgid	= 493, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--绑定蹭腿
		{
			BindLimit = 1, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!]]"蹭腿", --界面显示名称

			Act_Player = --[[!]]"棉花羊蹭腿",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作6",	--宠动作名

			pet_msgid	= 0, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},
	},
}
-- 幼年教主猫
CompanionPetCfg[86281] =
{
	StartBind = true, -- 是否招出的时候就绑上

	CanJumpWhenBind = true, --绑上时是否能跳

	BindHH = --[[!]]"HH_伞",  -- 人的绑定HH
	BindCC = --[[!]]"CC_push",  -- 宠的绑定CC

	Interacts =
	{
		--鼓掌
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!]]"鼓掌", -- 界面显示名称

			Act_Player = --[[!]]"鼓掌",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作1",	--宠动作名

			pet_msgid	= 527, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--发怒
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!]]"发怒", -- 界面显示名称

			Act_Player = --[[!]]"发怒",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作2",	--宠动作名

			pet_msgid	= 506, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--伤心
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!]]"伤心", -- 界面显示名称

			Act_Player = --[[!]]"伤心",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作3",	--宠动作名

			pet_msgid	= 507, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--害羞
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!]]"害羞", -- 界面显示名称

			Act_Player = --[[!]]"害羞",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作4",	--宠动作名

			pet_msgid	= 505, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},
		--抱起抚摸
		{
			BindLimit = 1, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = "撫摸", --界面显示名称

			Act_Player = --[[!]]"抱棉花羊",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作5",	--宠动作名

			pet_msgid	= 492, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},
	},
}
-- 章鱼妹
CompanionPetCfg[86814] =
{
	StartBind = true, -- 是否招出的时候就绑上

	CanJumpWhenBind = true, --绑上时是否能跳

	BindHH = --[[!]]"HH_伞",  -- 人的绑定HH
	BindCC = --[[!]]"CC_push",  -- 宠的绑定CC

	Interacts =
	{
		--鼓掌
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_113]]"鼓掌", -- 界面显示名称

			Act_Player = --[[!]]"鼓掌",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作1",	--宠动作名

			pet_msgid	= 527, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--发怒
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_114]]"發怒", -- 界面显示名称

			Act_Player = --[[!]]"发怒",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作2",	--宠动作名

			pet_msgid	= 506, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--伤心
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_115]]"傷心", -- 界面显示名称

			Act_Player = --[[!]]"伤心",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作3",	--宠动作名

			pet_msgid	= 507, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--害羞
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_116]]"害羞", -- 界面显示名称

			Act_Player = --[[!]]"害羞",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作4",	--宠动作名

			pet_msgid	= 505, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--抱起抚摸
		{
			BindLimit = 1, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_117]]"撫摸", --界面显示名称

			Act_Player = --[[!]]"抱棉花羊",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作5",	--宠动作名

			pet_msgid	= 491, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},
	},
}
-- 皓月玉兔
CompanionPetCfg[87016] =
{
	StartBind = true, -- 是否招出的时候就绑上

	CanJumpWhenBind = true, --绑上时是否能跳

	BindHH = --[[!]]"HH_伞",  -- 人的绑定HH
	BindCC = --[[!]]"CC_push",  -- 宠的绑定CC

	Interacts =
	{
		--鼓掌
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_113]]"鼓掌", -- 界面显示名称

			Act_Player = --[[!]]"鼓掌",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作1",	--宠动作名

			pet_msgid	= 527, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--发怒
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_114]]"發怒", -- 界面显示名称

			Act_Player = --[[!]]"发怒",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作2",	--宠动作名

			pet_msgid	= 506, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--伤心
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_115]]"傷心", -- 界面显示名称

			Act_Player = --[[!]]"伤心",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作3",	--宠动作名

			pet_msgid	= 507, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--害羞
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_116]]"害羞", -- 界面显示名称

			Act_Player = --[[!]]"害羞",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作4",	--宠动作名

			pet_msgid	= 505, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--抱起抚摸
		{
			BindLimit = 1, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_117]]"撫摸", --界面显示名称

			Act_Player = --[[!]]"抱棉花羊",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作5",	--宠动作名

			pet_msgid	= 490, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},
	},
}
-- 小黄蛋蛋
CompanionPetCfg[86084] =
{
	StartBind = true, -- 是否招出的时候就绑上

	CanJumpWhenBind = true, --绑上时是否能跳

	BindHH = --[[!]]"HH_伞",  -- 人的绑定HH
	BindCC = --[[!]]"CC_push",  -- 宠的绑定CC

	Interacts =
	{
		--鼓掌
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_113]]"鼓掌", -- 界面显示名称

			Act_Player = --[[!]]"鼓掌",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作1",	--宠动作名

			pet_msgid	= 527, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--发怒
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_114]]"發怒", -- 界面显示名称

			Act_Player = --[[!]]"发怒",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作2",	--宠动作名

			pet_msgid	= 506, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--伤心
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_115]]"傷心", -- 界面显示名称

			Act_Player = --[[!]]"伤心",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作3",	--宠动作名

			pet_msgid	= 507, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--害羞
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_116]]"害羞", -- 界面显示名称

			Act_Player = --[[!]]"害羞",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作4",	--宠动作名

			pet_msgid	= 505, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--抱起抚摸
		{
			BindLimit = 1, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_117]]"撫摸", --界面显示名称

			Act_Player = --[[!]]"抱棉花羊",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作5",	--宠动作名

			pet_msgid	= 489, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},
	},
}

-- 小萌蛋蛋
CompanionPetCfg[86085] =
{
	StartBind = true, -- 是否招出的时候就绑上

	CanJumpWhenBind = true, --绑上时是否能跳

	BindHH = --[[!]]"HH_伞",  -- 人的绑定HH
	BindCC = --[[!]]"CC_push",  -- 宠的绑定CC

	Interacts =
	{
		--鼓掌
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_113]]"鼓掌", -- 界面显示名称

			Act_Player = --[[!]]"鼓掌",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作1",	--宠动作名

			pet_msgid	= 527, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--发怒
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_114]]"發怒", -- 界面显示名称

			Act_Player = --[[!]]"发怒",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作2",	--宠动作名

			pet_msgid	= 506, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--伤心
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_115]]"傷心", -- 界面显示名称

			Act_Player = --[[!]]"伤心",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作3",	--宠动作名

			pet_msgid	= 507, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--害羞
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_116]]"害羞", -- 界面显示名称

			Act_Player = --[[!]]"害羞",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作4",	--宠动作名

			pet_msgid	= 505, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--抱起抚摸
		{
			BindLimit = 1, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_117]]"撫摸", --界面显示名称

			Act_Player = --[[!]]"抱棉花羊",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作5",	--宠动作名

			pet_msgid	= 489, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},
	},
}


-- 报恩彩羽
CompanionPetCfg[87856] =
{
	StartBind = true, -- 是否招出的时候就绑上

	CanJumpWhenBind = true, --绑上时是否能跳

	BindHH = --[[!]]"HH_伞",  -- 人的绑定HH
	BindCC = --[[!]]"CC_push",  -- 宠的绑定CC

	Interacts =
	{
		--鼓掌
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_113]]"鼓掌", -- 界面显示名称

			Act_Player = --[[!]]"鼓掌",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作1",	--宠动作名

			pet_msgid	= 527, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--发怒
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_114]]"發怒", -- 界面显示名称

			Act_Player = --[[!]]"发怒",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作2",	--宠动作名

			pet_msgid	= 506, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--伤心
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_115]]"傷心", -- 界面显示名称

			Act_Player = --[[!]]"伤心",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作3",	--宠动作名

			pet_msgid	= 507, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--害羞
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_116]]"害羞", -- 界面显示名称

			Act_Player = --[[!]]"害羞",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作4",	--宠动作名

			pet_msgid	= 505, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--抱起抚摸
		{
			BindLimit = 1, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_117]]"撫摸", --界面显示名称

			Act_Player = --[[!]]"抱棉花羊",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作5",	--宠动作名

			pet_msgid	= 488, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},
	},
}
-- 白狐宝宝
CompanionPetCfg[88160] =
{
	StartBind = true, -- 是否招出的时候就绑上

	CanJumpWhenBind = true, --绑上时是否能跳

	BindHH = --[[!]]"HH_伞",  -- 人的绑定HH
	BindCC = --[[!]]"CC_push",  -- 宠的绑定CC

	Interacts =
	{
		--鼓掌
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_113]]"鼓掌", -- 界面显示名称

			Act_Player = --[[!]]"鼓掌",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作1",	--宠动作名

			pet_msgid	= 527, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--发怒
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_114]]"發怒", -- 界面显示名称

			Act_Player = --[[!]]"发怒",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作2",	--宠动作名

			pet_msgid	= 506, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--伤心
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_115]]"傷心", -- 界面显示名称

			Act_Player = --[[!]]"伤心",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作3",	--宠动作名

			pet_msgid	= 507, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--害羞
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_116]]"害羞", -- 界面显示名称

			Act_Player = --[[!]]"害羞",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作4",	--宠动作名

			pet_msgid	= 505, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--抱起抚摸
		{
			BindLimit = 1, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_117]]"撫摸", --界面显示名称

			Act_Player = --[[!]]"抱棉花羊",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作5",	--宠动作名

			pet_msgid	= 487, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},
	},
}
-- 赤胆剑灵
CompanionPetCfg[87278] =
{
	StartBind = false, -- 是否招出的时候就绑上

	CanJumpWhenBind = true, --绑上时是否能跳

	BindHH = "",  -- 人的绑定HH
	BindCC = "",  -- 宠的绑定CC

	Interacts =
	{
		--鼓掌
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_120]]"鼓掌", -- 界面显示名称

			Act_Player = --[[!]]"鼓掌",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作1",	--宠动作名

			pet_msgid	= 527, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--发怒
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_121]]"發怒", -- 界面显示名称

			Act_Player = --[[!]]"发怒",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作2",	--宠动作名

			pet_msgid	= 506, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--伤心
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_122]]"傷心", -- 界面显示名称

			Act_Player = --[[!]]"伤心",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作3",	--宠动作名

			pet_msgid	= 507, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--害羞
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_123]]"害羞", -- 界面显示名称

			Act_Player = --[[!]]"害羞",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作4",	--宠动作名

			pet_msgid	= 505, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},
	},
}
-- 黑色猫咪
CompanionPetCfg[88320] =
{
	StartBind = true, -- 是否招出的时候就绑上

	CanJumpWhenBind = true, --绑上时是否能跳

	BindHH = --[[!]]"HH_伞",  -- 人的绑定HH
	BindCC = --[[!]]"CC_push",  -- 宠的绑定CC

	Interacts =
	{
		--鼓掌
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_113]]"鼓掌", -- 界面显示名称

			Act_Player = --[[!]]"鼓掌",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作1",	--宠动作名

			pet_msgid	= 527, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--发怒
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_114]]"發怒", -- 界面显示名称

			Act_Player = --[[!]]"发怒",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作2",	--宠动作名

			pet_msgid	= 506, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--伤心
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_115]]"傷心", -- 界面显示名称

			Act_Player = --[[!]]"伤心",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作3",	--宠动作名

			pet_msgid	= 507, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--害羞
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_116]]"害羞", -- 界面显示名称

			Act_Player = --[[!]]"害羞",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作4",	--宠动作名

			pet_msgid	= 505, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--抱起抚摸
		{
			BindLimit = 1, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_117]]"撫摸", --界面显示名称

			Act_Player = --[[!]]"抱棉花羊",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作5",	--宠动作名

			pet_msgid	= 484, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},
	},
}
-- 白色猫咪
CompanionPetCfg[88321] =
{
	StartBind = true, -- 是否招出的时候就绑上

	CanJumpWhenBind = true, --绑上时是否能跳

	BindHH = --[[!]]"HH_伞",  -- 人的绑定HH
	BindCC = --[[!]]"CC_push",  -- 宠的绑定CC

	Interacts =
	{
		--鼓掌
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_113]]"鼓掌", -- 界面显示名称

			Act_Player = --[[!]]"鼓掌",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作1",	--宠动作名

			pet_msgid	= 527, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--发怒
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_114]]"發怒", -- 界面显示名称

			Act_Player = --[[!]]"发怒",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作2",	--宠动作名

			pet_msgid	= 506, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--伤心
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_115]]"傷心", -- 界面显示名称

			Act_Player = --[[!]]"伤心",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作3",	--宠动作名

			pet_msgid	= 507, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--害羞
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_116]]"害羞", -- 界面显示名称

			Act_Player = --[[!]]"害羞",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作4",	--宠动作名

			pet_msgid	= 505, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--抱起抚摸
		{
			BindLimit = 1, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_117]]"撫摸", --界面显示名称

			Act_Player = --[[!]]"抱棉花羊",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作5",	--宠动作名

			pet_msgid	= 485, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},
	},
}
-- 黑脸兜兜
CompanionPetCfg[88436] =
{
	StartBind = true, -- 是否招出的时候就绑上

	CanJumpWhenBind = true, --绑上时是否能跳

	BindHH = --[[!]]"HH_伞",  -- 人的绑定HH
	BindCC = --[[!]]"CC_push",  -- 宠的绑定CC

	Interacts =
	{
		--鼓掌
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_113]]"鼓掌", -- 界面显示名称

			Act_Player = --[[!]]"鼓掌",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作1",	--宠动作名

			pet_msgid	= 527, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--发怒
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_114]]"發怒", -- 界面显示名称

			Act_Player = --[[!]]"发怒",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作2",	--宠动作名

			pet_msgid	= 506, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--伤心
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_115]]"傷心", -- 界面显示名称

			Act_Player = --[[!]]"伤心",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作3",	--宠动作名

			pet_msgid	= 507, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--害羞
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_116]]"害羞", -- 界面显示名称

			Act_Player = --[[!]]"害羞",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作4",	--宠动作名

			pet_msgid	= 505, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--抱起抚摸
		{
			BindLimit = 1, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_117]]"撫摸", --界面显示名称

			Act_Player = --[[!]]"抱棉花羊",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作5",	--宠动作名

			pet_msgid	= 486, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},
	},
}
-- 羊驼小新
CompanionPetCfg[89423] =
{
	StartBind = true, -- 是否招出的时候就绑上

	CanJumpWhenBind = true, --绑上时是否能跳

	BindHH = --[[!]]"HH_伞",  -- 人的绑定HH
	BindCC = --[[!]]"CC_push",  -- 宠的绑定CC

	Interacts =
	{
		--鼓掌
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_113]]"鼓掌", -- 界面显示名称

			Act_Player = --[[!]]"鼓掌",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作1",	--宠动作名

			pet_msgid	= 527, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--发怒
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_114]]"發怒", -- 界面显示名称

			Act_Player = --[[!]]"发怒",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作2",	--宠动作名

			pet_msgid	= 506, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--伤心
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_115]]"傷心", -- 界面显示名称

			Act_Player = --[[!]]"伤心",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作3",	--宠动作名

			pet_msgid	= 507, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--害羞
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_116]]"害羞", -- 界面显示名称

			Act_Player = --[[!]]"害羞",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作4",	--宠动作名

			pet_msgid	= 505, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--抱起抚摸
		{
			BindLimit = 1, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_117]]"撫摸", --界面显示名称

			Act_Player = --[[!]]"抱棉花羊",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作5",	--宠动作名

			pet_msgid	= 480, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},
	},
}
-- 萌犬小顺
CompanionPetCfg[89424] =
{
	StartBind = true, -- 是否招出的时候就绑上

	CanJumpWhenBind = true, --绑上时是否能跳

	BindHH = --[[!]]"HH_伞",  -- 人的绑定HH
	BindCC = --[[!]]"CC_push",  -- 宠的绑定CC

	Interacts =
	{
		--鼓掌
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_113]]"鼓掌", -- 界面显示名称

			Act_Player = --[[!]]"鼓掌",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作1",	--宠动作名

			pet_msgid	= 527, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--发怒
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_114]]"發怒", -- 界面显示名称

			Act_Player = --[[!]]"发怒",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作2",	--宠动作名

			pet_msgid	= 506, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--伤心
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_115]]"傷心", -- 界面显示名称

			Act_Player = --[[!]]"伤心",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作3",	--宠动作名

			pet_msgid	= 507, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--害羞
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_116]]"害羞", -- 界面显示名称

			Act_Player = --[[!]]"害羞",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作4",	--宠动作名

			pet_msgid	= 505, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--抱起抚摸
		{
			BindLimit = 1, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_117]]"撫摸", --界面显示名称

			Act_Player = --[[!]]"抱棉花羊",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作5",	--宠动作名

			pet_msgid	= 481, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},
	},
}
-- 鼠标小易
CompanionPetCfg[89425] =
{
	StartBind = true, -- 是否招出的时候就绑上

	CanJumpWhenBind = true, --绑上时是否能跳

	BindHH = --[[!]]"HH_伞",  -- 人的绑定HH
	BindCC = --[[!]]"CC_push",  -- 宠的绑定CC

	Interacts =
	{
		--鼓掌
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_113]]"鼓掌", -- 界面显示名称

			Act_Player = --[[!]]"鼓掌",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作1",	--宠动作名

			pet_msgid	= 527, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--发怒
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_114]]"發怒", -- 界面显示名称

			Act_Player = --[[!]]"发怒",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作2",	--宠动作名

			pet_msgid	= 506, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--伤心
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_115]]"傷心", -- 界面显示名称

			Act_Player = --[[!]]"伤心",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作3",	--宠动作名

			pet_msgid	= 507, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--害羞
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_116]]"害羞", -- 界面显示名称

			Act_Player = --[[!]]"害羞",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作4",	--宠动作名

			pet_msgid	= 505, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--抱起抚摸
		{
			BindLimit = 1, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_117]]"撫摸", --界面显示名称

			Act_Player = --[[!]]"抱棉花羊",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作5",	--宠动作名

			pet_msgid	= 482, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},
	},
}
-- 企鹅阿腾
CompanionPetCfg[89426] =
{
	StartBind = true, -- 是否招出的时候就绑上

	CanJumpWhenBind = true, --绑上时是否能跳

	BindHH = --[[!]]"HH_伞",  -- 人的绑定HH
	BindCC = --[[!]]"CC_push",  -- 宠的绑定CC

	Interacts =
	{
		--鼓掌
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_113]]"鼓掌", -- 界面显示名称

			Act_Player = --[[!]]"鼓掌",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作1",	--宠动作名

			pet_msgid	= 527, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--发怒
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_114]]"發怒", -- 界面显示名称

			Act_Player = --[[!]]"发怒",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作2",	--宠动作名

			pet_msgid	= 506, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--伤心
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_115]]"傷心", -- 界面显示名称

			Act_Player = --[[!]]"伤心",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作3",	--宠动作名

			pet_msgid	= 507, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--害羞
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_116]]"害羞", -- 界面显示名称

			Act_Player = --[[!]]"害羞",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作4",	--宠动作名

			pet_msgid	= 505, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--抱起抚摸
		{
			BindLimit = 1, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_117]]"撫摸", --界面显示名称

			Act_Player = --[[!]]"抱棉花羊",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作5",	--宠动作名

			pet_msgid	= 483, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},
	},
}
-- 松鼠比丘
CompanionPetCfg[89912] =
{
	StartBind = true, -- 是否招出的时候就绑上

	CanJumpWhenBind = true, --绑上时是否能跳

	BindHH = --[[!]]"HH_伞",  -- 人的绑定HH
	BindCC = --[[!]]"CC_push",  -- 宠的绑定CC

	Interacts =
	{
		--鼓掌
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_113]]"鼓掌", -- 界面显示名称

			Act_Player = --[[!]]"鼓掌",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作1",	--宠动作名

			pet_msgid	= 527, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--发怒
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_114]]"發怒", -- 界面显示名称

			Act_Player = --[[!]]"发怒",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作2",	--宠动作名

			pet_msgid	= 506, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--伤心
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_115]]"傷心", -- 界面显示名称

			Act_Player = --[[!]]"伤心",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作3",	--宠动作名

			pet_msgid	= 507, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--害羞
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_116]]"害羞", -- 界面显示名称

			Act_Player = --[[!]]"害羞",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作4",	--宠动作名

			pet_msgid	= 505, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--抱起抚摸
		{
			BindLimit = 1, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_117]]"撫摸", --界面显示名称

			Act_Player = --[[!]]"抱棉花羊",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作5",	--宠动作名

			pet_msgid	= 483, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},
	},
}
-- 熊喵喵喵
CompanionPetCfg[89982] =
{
	StartBind = true, -- 是否招出的时候就绑上

	CanJumpWhenBind = true, --绑上时是否能跳

	BindHH = --[[!]]"HH_伞",  -- 人的绑定HH
	BindCC = --[[!]]"CC_push",  -- 宠的绑定CC

	Interacts =
	{
		--鼓掌
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_113]]"鼓掌", -- 界面显示名称

			Act_Player = --[[!]]"鼓掌",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作1",	--宠动作名

			pet_msgid	= 527, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--发怒
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_114]]"發怒", -- 界面显示名称

			Act_Player = --[[!]]"发怒",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作2",	--宠动作名

			pet_msgid	= 506, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--伤心
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_115]]"傷心", -- 界面显示名称

			Act_Player = --[[!]]"伤心",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作3",	--宠动作名

			pet_msgid	= 507, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--害羞
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_116]]"害羞", -- 界面显示名称

			Act_Player = --[[!]]"害羞",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作4",	--宠动作名

			pet_msgid	= 505, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--抱起抚摸
		{
			BindLimit = 1, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_117]]"撫摸", --界面显示名称

			Act_Player = --[[!]]"抱棉花羊",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作5",	--宠动作名

			pet_msgid	= 479, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},
	},
}

-- 坏坏波达
CompanionPetCfg[92674] =
{
	StartBind = true, -- 是否招出的时候就绑上

	CanJumpWhenBind = true, --绑上时是否能跳

	BindHH = --[[!]]"HH_伞",  -- 人的绑定HH
	BindCC = --[[!]]"CC_push",  -- 宠的绑定CC

	Interacts =
	{
		--鼓掌
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_113]]"鼓掌", -- 界面显示名称

			Act_Player = --[[!]]"鼓掌",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作1",	--宠动作名

			pet_msgid	= 527, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--发怒
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_114]]"發怒", -- 界面显示名称

			Act_Player = --[[!]]"发怒",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作2",	--宠动作名

			pet_msgid	= 506, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--伤心
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_115]]"傷心", -- 界面显示名称

			Act_Player = --[[!]]"伤心",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作3",	--宠动作名

			pet_msgid	= 507, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--害羞
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_116]]"害羞", -- 界面显示名称

			Act_Player = --[[!]]"害羞",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作4",	--宠动作名

			pet_msgid	= 505, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--抱起抚摸
		{
			BindLimit = 1, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_117]]"撫摸", --界面显示名称

			Act_Player = --[[!]]"抱棉花羊",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作5",	--宠动作名

			pet_msgid	= 479, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},
	},
}

-- 坏坏波比
CompanionPetCfg[92675] =
{
	StartBind = true, -- 是否招出的时候就绑上

	CanJumpWhenBind = true, --绑上时是否能跳

	BindHH = --[[!]]"HH_伞",  -- 人的绑定HH
	BindCC = --[[!]]"CC_push",  -- 宠的绑定CC

	Interacts =
	{
		--鼓掌
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_113]]"鼓掌", -- 界面显示名称

			Act_Player = --[[!]]"鼓掌",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作1",	--宠动作名

			pet_msgid	= 527, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--发怒
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_114]]"發怒", -- 界面显示名称

			Act_Player = --[[!]]"发怒",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作2",	--宠动作名

			pet_msgid	= 506, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--伤心
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_115]]"傷心", -- 界面显示名称

			Act_Player = --[[!]]"伤心",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作3",	--宠动作名

			pet_msgid	= 507, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--害羞
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_116]]"害羞", -- 界面显示名称

			Act_Player = --[[!]]"害羞",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作4",	--宠动作名

			pet_msgid	= 505, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--抱起抚摸
		{
			BindLimit = 1, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_117]]"撫摸", --界面显示名称

			Act_Player = --[[!]]"抱棉花羊",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作5",	--宠动作名

			pet_msgid	= 479, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},
	},
}

-- 霸气猴王
CompanionPetCfg[93410] =
{
	StartBind = false, -- 是否招出的时候就绑上

	CanJumpWhenBind = true, --绑上时是否能跳

	BindHH = --[[!]]"",  -- 人的绑定HH
	BindCC = --[[!]]"",  -- 宠的绑定CC

	Interacts =
	{
		--鼓掌
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_113]]"鼓掌", -- 界面显示名称

			Act_Player = --[[!]]"鼓掌",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作1",	--宠动作名

			pet_msgid	= 527, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--发怒
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_114]]"發怒", -- 界面显示名称

			Act_Player = --[[!]]"发怒",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作2",	--宠动作名

			pet_msgid	= 506, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--伤心
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_115]]"傷心", -- 界面显示名称

			Act_Player = --[[!]]"伤心",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作3",	--宠动作名

			pet_msgid	= 507, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--害羞
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_116]]"害羞", -- 界面显示名称

			Act_Player = --[[!]]"害羞",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作4",	--宠动作名

			pet_msgid	= 505, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--欢呼
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_116]]"歡呼", -- 界面显示名称

			Act_Player = --[[!]]"欢呼",	-- 玩家动作名
			Act_Pet = --[[!]]"休闲动作3",	--宠动作名

			pet_msgid	= 496, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

	},
}

-- 螳螂
CompanionPetCfg[93417] =
{
	StartBind = false, -- 是否招出的时候就绑上

	CanJumpWhenBind = true, --绑上时是否能跳

	BindHH = --[[!]]"",  -- 人的绑定HH
	BindCC = --[[!]]"",  -- 宠的绑定CC

	Interacts =
	{
		--鼓掌
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_113]]"鼓掌", -- 界面显示名称

			Act_Player = --[[!]]"鼓掌",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作1",	--宠动作名

			pet_msgid	= 527, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--发怒
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_114]]"發怒", -- 界面显示名称

			Act_Player = --[[!]]"发怒",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作2",	--宠动作名

			pet_msgid	= 506, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--伤心
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_115]]"傷心", -- 界面显示名称

			Act_Player = --[[!]]"伤心",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作3",	--宠动作名

			pet_msgid	= 507, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--害羞
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_116]]"害羞", -- 界面显示名称

			Act_Player = --[[!]]"害羞",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作4",	--宠动作名

			pet_msgid	= 505, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

	},
}

-- 蝴蝶宝宝
CompanionPetCfg[86728] =
{
	StartBind = false, -- 是否招出的时候就绑上

	CanJumpWhenBind = true, --绑上时是否能跳

	BindHH = --[[!]]"",  -- 人的绑定HH
	BindCC = --[[!]]"",  -- 宠的绑定CC

	Interacts =
	{
		--鼓掌
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_113]]"鼓掌", -- 界面显示名称

			Act_Player = --[[!]]"鼓掌",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作1",	--宠动作名

			pet_msgid	= 527, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--发怒
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_114]]"發怒", -- 界面显示名称

			Act_Player = --[[!]]"发怒",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作2",	--宠动作名

			pet_msgid	= 506, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--伤心
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_115]]"傷心", -- 界面显示名称

			Act_Player = --[[!]]"伤心",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作3",	--宠动作名

			pet_msgid	= 507, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--害羞
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_116]]"害羞", -- 界面显示名称

			Act_Player = --[[!]]"害羞",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作4",	--宠动作名

			pet_msgid	= 505, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

	},
}

-- 女帝
CompanionPetCfg[93234] =
{
	StartBind = false, -- 是否招出的时候就绑上

	CanJumpWhenBind = true, --绑上时是否能跳

	BindHH = --[[!]]"",  -- 人的绑定HH
	BindCC = --[[!]]"",  -- 宠的绑定CC

	Interacts =
	{
		--鼓掌
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_113]]"鼓掌", -- 界面显示名称

			Act_Player = --[[!]]"鼓掌",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作1",	--宠动作名

			pet_msgid	= 527, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--发怒
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_114]]"發怒", -- 界面显示名称

			Act_Player = --[[!]]"发怒",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作2",	--宠动作名

			pet_msgid	= 475, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--伤心
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_115]]"傷心", -- 界面显示名称

			Act_Player = --[[!]]"伤心",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作4",	--宠动作名

			pet_msgid	= 507, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--害羞
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_116]]"害羞", -- 界面显示名称

			Act_Player = --[[!]]"害羞",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作3",	--宠动作名

			pet_msgid	= 505, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--舞蹈
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!]]"舞蹈", --界面显示名称

			Act_Player = --[[!]]"亲吻",	-- 玩家动作名
			Act_Pet = --[[!]]"施法动作2",	--宠动作名

			pet_msgid	= 476, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},
	},
}

-- 仙草小鹿
CompanionPetCfg[90488] =
{
	StartBind = true, -- 是否招出的时候就绑上

	CanJumpWhenBind = true, --绑上时是否能跳

	BindHH = --[[!]]"HH_伞",  -- 人的绑定HH
	BindCC = --[[!]]"CC_push",  -- 宠的绑定CC

	Interacts =
	{
		--鼓掌
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_113]]"鼓掌", -- 界面显示名称

			Act_Player = --[[!]]"鼓掌",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作1",	--宠动作名

			pet_msgid	= 527, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--发怒
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_114]]"發怒", -- 界面显示名称

			Act_Player = --[[!]]"发怒",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作2",	--宠动作名

			pet_msgid	= 506, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--伤心
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_115]]"傷心", -- 界面显示名称

			Act_Player = --[[!]]"伤心",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作3",	--宠动作名

			pet_msgid	= 507, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--害羞
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_116]]"害羞", -- 界面显示名称

			Act_Player = --[[!]]"害羞",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作4",	--宠动作名

			pet_msgid	= 505, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--抱起抚摸
		{
			BindLimit = 1, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_117]]"撫摸", --界面显示名称

			Act_Player = --[[!]]"抱棉花羊",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作5",	--宠动作名

			pet_msgid	= 478, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},
	},
}

-- 龙猫等等
CompanionPetCfg[92242] =
{
	StartBind = true, -- 是否招出的时候就绑上

	CanJumpWhenBind = true, --绑上时是否能跳

	BindHH = --[[!]]"HH_伞",  -- 人的绑定HH
	BindCC = --[[!]]"CC_push",  -- 宠的绑定CC

	Interacts =
	{
		--鼓掌
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_113]]"鼓掌", -- 界面显示名称

			Act_Player = --[[!]]"鼓掌",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作1",	--宠动作名

			pet_msgid	= 527, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--发怒
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_114]]"發怒", -- 界面显示名称

			Act_Player = --[[!]]"发怒",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作2",	--宠动作名

			pet_msgid	= 506, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--伤心
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_115]]"傷心", -- 界面显示名称

			Act_Player = --[[!]]"伤心",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作3",	--宠动作名

			pet_msgid	= 507, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--害羞
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_116]]"害羞", -- 界面显示名称

			Act_Player = --[[!]]"害羞",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作4",	--宠动作名

			pet_msgid	= 505, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--抱起抚摸
		{
			BindLimit = 1, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_117]]"撫摸", --界面显示名称

			Act_Player = --[[!]]"抱棉花羊",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作5",	--宠动作名

			pet_msgid	= 478, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},
	},
}

-- 浣熊多多
CompanionPetCfg[93809] =
{
	StartBind = true, -- 是否招出的时候就绑上

	CanJumpWhenBind = true, --绑上时是否能跳

	BindHH = --[[!]]"HH_伞",  -- 人的绑定HH
	BindCC = --[[!]]"CC_push",  -- 宠的绑定CC

	Interacts =
	{
		--鼓掌
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_113]]"鼓掌", -- 界面显示名称

			Act_Player = --[[!]]"鼓掌",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作1",	--宠动作名

			pet_msgid	= 527, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--发怒
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_114]]"發怒", -- 界面显示名称

			Act_Player = --[[!]]"发怒",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作2",	--宠动作名

			pet_msgid	= 506, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--伤心
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_115]]"傷心", -- 界面显示名称

			Act_Player = --[[!]]"伤心",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作3",	--宠动作名

			pet_msgid	= 507, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--害羞
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_116]]"害羞", -- 界面显示名称

			Act_Player = --[[!]]"害羞",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作4",	--宠动作名

			pet_msgid	= 505, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--抱起抚摸
		{
			BindLimit = 1, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_117]]"撫摸", --界面显示名称

			Act_Player = --[[!]]"抱棉花羊",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作5",	--宠动作名

			pet_msgid	= 478, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},
	},
}

-- 企鹅小腾
CompanionPetCfg[93810] =
{
	StartBind = true, -- 是否招出的时候就绑上

	CanJumpWhenBind = true, --绑上时是否能跳

	BindHH = --[[!]]"HH_伞",  -- 人的绑定HH
	BindCC = --[[!]]"CC_push",  -- 宠的绑定CC

	Interacts =
	{
		--鼓掌
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_113]]"鼓掌", -- 界面显示名称

			Act_Player = --[[!]]"鼓掌",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作1",	--宠动作名

			pet_msgid	= 527, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--发怒
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_114]]"發怒", -- 界面显示名称

			Act_Player = --[[!]]"发怒",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作2",	--宠动作名

			pet_msgid	= 506, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--伤心
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_115]]"傷心", -- 界面显示名称

			Act_Player = --[[!]]"伤心",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作3",	--宠动作名

			pet_msgid	= 507, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--害羞
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_116]]"害羞", -- 界面显示名称

			Act_Player = --[[!]]"害羞",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作4",	--宠动作名

			pet_msgid	= 505, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--抱起抚摸
		{
			BindLimit = 1, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_117]]"撫摸", --界面显示名称

			Act_Player = --[[!]]"抱棉花羊",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作5",	--宠动作名

			pet_msgid	= 478, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},
	},
}

-- 羊驼小新
CompanionPetCfg[93811] =
{
	StartBind = true, -- 是否招出的时候就绑上

	CanJumpWhenBind = true, --绑上时是否能跳

	BindHH = --[[!]]"HH_伞",  -- 人的绑定HH
	BindCC = --[[!]]"CC_push",  -- 宠的绑定CC

	Interacts =
	{
		--鼓掌
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_113]]"鼓掌", -- 界面显示名称

			Act_Player = --[[!]]"鼓掌",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作1",	--宠动作名

			pet_msgid	= 527, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--发怒
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_114]]"發怒", -- 界面显示名称

			Act_Player = --[[!]]"发怒",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作2",	--宠动作名

			pet_msgid	= 506, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--伤心
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_115]]"傷心", -- 界面显示名称

			Act_Player = --[[!]]"伤心",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作3",	--宠动作名

			pet_msgid	= 507, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--害羞
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_116]]"害羞", -- 界面显示名称

			Act_Player = --[[!]]"害羞",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作4",	--宠动作名

			pet_msgid	= 505, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--抱起抚摸
		{
			BindLimit = 1, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_117]]"撫摸", --界面显示名称

			Act_Player = --[[!]]"抱棉花羊",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作5",	--宠动作名

			pet_msgid	= 478, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},
	},
}

-- 妖气章鱼
CompanionPetCfg[93812] =
{
	StartBind = true, -- 是否招出的时候就绑上

	CanJumpWhenBind = true, --绑上时是否能跳

	BindHH = --[[!]]"HH_伞",  -- 人的绑定HH
	BindCC = --[[!]]"CC_push",  -- 宠的绑定CC

	Interacts =
	{
		--鼓掌
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_113]]"鼓掌", -- 界面显示名称

			Act_Player = --[[!]]"鼓掌",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作1",	--宠动作名

			pet_msgid	= 527, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--发怒
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_114]]"發怒", -- 界面显示名称

			Act_Player = --[[!]]"发怒",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作2",	--宠动作名

			pet_msgid	= 506, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--伤心
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_115]]"傷心", -- 界面显示名称

			Act_Player = --[[!]]"伤心",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作3",	--宠动作名

			pet_msgid	= 507, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--害羞
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_116]]"害羞", -- 界面显示名称

			Act_Player = --[[!]]"害羞",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作4",	--宠动作名

			pet_msgid	= 505, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--抱起抚摸
		{
			BindLimit = 1, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_117]]"撫摸", --界面显示名称

			Act_Player = --[[!]]"抱棉花羊",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作5",	--宠动作名

			pet_msgid	= 478, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},
	},
}
-- 竖琴娃娃
CompanionPetCfg[95747] =
{
	StartBind = false, -- 是否招出的时候就绑上

	CanJumpWhenBind = true, --绑上时是否能跳

	BindHH = --[[!AUTO_118]]"",  -- 人的绑定HH
	BindCC = --[[!AUTO_119]]"",  -- 宠的绑定CC

	Interacts =
	{
		--鼓掌
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_120]]"鼓掌", -- 界面显示名称

			Act_Player = --[[!]]"鼓掌",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作1",	--宠动作名

			pet_msgid	= 527, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--发怒
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_121]]"發怒", -- 界面显示名称

			Act_Player = --[[!]]"发怒",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作2",	--宠动作名

			pet_msgid	= 506, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--伤心
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_122]]"傷心", -- 界面显示名称

			Act_Player = --[[!]]"伤心",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作3",	--宠动作名

			pet_msgid	= 507, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--害羞
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_123]]"害羞", -- 界面显示名称

			Act_Player = --[[!]]"害羞",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作4",	--宠动作名

			pet_msgid	= 505, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},
	},
}
-- 仙草小鹿
CompanionPetCfg[95748] =
{
	StartBind = false, -- 是否招出的时候就绑上

	CanJumpWhenBind = true, --绑上时是否能跳

	BindHH = --[[!AUTO_118]]"",  -- 人的绑定HH
	BindCC = --[[!AUTO_119]]"",  -- 宠的绑定CC

	Interacts =
	{
		--鼓掌
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_120]]"鼓掌", -- 界面显示名称

			Act_Player = --[[!]]"鼓掌",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作1",	--宠动作名

			pet_msgid	= 527, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--发怒
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_121]]"發怒", -- 界面显示名称

			Act_Player = --[[!]]"发怒",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作2",	--宠动作名

			pet_msgid	= 506, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--伤心
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_122]]"傷心", -- 界面显示名称

			Act_Player = --[[!]]"伤心",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作3",	--宠动作名

			pet_msgid	= 507, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--害羞
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_123]]"害羞", -- 界面显示名称

			Act_Player = --[[!]]"害羞",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作4",	--宠动作名

			pet_msgid	= 505, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},
	},
}
-- 长剑萝莉
CompanionPetCfg[95976] =
{
	StartBind = false, -- 是否招出的时候就绑上

	CanJumpWhenBind = true, --绑上时是否能跳

	BindHH = --[[!AUTO_118]]"",  -- 人的绑定HH
	BindCC = --[[!AUTO_119]]"",  -- 宠的绑定CC

	Interacts =
	{
		--鼓掌
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_120]]"鼓掌", -- 界面显示名称

			Act_Player = --[[!]]"鼓掌",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作1",	--宠动作名

			pet_msgid	= 527, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--发怒
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_121]]"發怒", -- 界面显示名称

			Act_Player = --[[!]]"发怒",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作2",	--宠动作名

			pet_msgid	= 506, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--伤心
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_122]]"傷心", -- 界面显示名称

			Act_Player = --[[!]]"伤心",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作3",	--宠动作名

			pet_msgid	= 507, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--害羞
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_123]]"害羞", -- 界面显示名称

			Act_Player = --[[!]]"害羞",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作4",	--宠动作名

			pet_msgid	= 505, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},
	},
}
-- 竖琴娃娃
CompanionPetCfg[96296] =
{
	StartBind = false, -- 是否招出的时候就绑上

	CanJumpWhenBind = true, --绑上时是否能跳

	BindHH = --[[!AUTO_118]]"",  -- 人的绑定HH
	BindCC = --[[!AUTO_119]]"",  -- 宠的绑定CC

	Interacts =
	{
		--鼓掌
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_120]]"鼓掌", -- 界面显示名称

			Act_Player = --[[!]]"鼓掌",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作1",	--宠动作名

			pet_msgid	= 527, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--发怒
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_121]]"發怒", -- 界面显示名称

			Act_Player = --[[!]]"发怒",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作2",	--宠动作名

			pet_msgid	= 506, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--伤心
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_122]]"傷心", -- 界面显示名称

			Act_Player = --[[!]]"伤心",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作3",	--宠动作名

			pet_msgid	= 507, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--害羞
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_123]]"害羞", -- 界面显示名称

			Act_Player = --[[!]]"害羞",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作4",	--宠动作名

			pet_msgid	= 505, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},
	},
}
-- 暗之子
CompanionPetCfg[96326] =
{
	StartBind = false, -- 是否招出的时候就绑上

	CanJumpWhenBind = true, --绑上时是否能跳

	BindHH = --[[!AUTO_118]]"",  -- 人的绑定HH
	BindCC = --[[!AUTO_119]]"",  -- 宠的绑定CC

	Interacts =
	{
		--鼓掌
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_120]]"鼓掌", -- 界面显示名称

			Act_Player = --[[!]]"鼓掌",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作1",	--宠动作名

			pet_msgid	= 527, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--发怒
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_121]]"發怒", -- 界面显示名称

			Act_Player = --[[!]]"发怒",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作2",	--宠动作名

			pet_msgid	= 506, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--伤心
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_122]]"傷心", -- 界面显示名称

			Act_Player = --[[!]]"伤心",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作3",	--宠动作名

			pet_msgid	= 507, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--害羞
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_123]]"害羞", -- 界面显示名称

			Act_Player = --[[!]]"害羞",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作4",	--宠动作名

			pet_msgid	= 505, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},
	},
}
-- 圣诞萌宠
CompanionPetCfg[96500] =
{
	StartBind = false, -- 是否招出的时候就绑上

	CanJumpWhenBind = true, --绑上时是否能跳

	BindHH = --[[!AUTO_118]]"",  -- 人的绑定HH
	BindCC = --[[!AUTO_119]]"",  -- 宠的绑定CC

	Interacts =
	{
		--鼓掌
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_120]]"鼓掌", -- 界面显示名称

			Act_Player = --[[!]]"鼓掌",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作1",	--宠动作名

			pet_msgid	= 527, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--发怒
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_121]]"發怒", -- 界面显示名称

			Act_Player = --[[!]]"发怒",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作2",	--宠动作名

			pet_msgid	= 506, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--伤心
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_122]]"傷心", -- 界面显示名称

			Act_Player = --[[!]]"伤心",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作3",	--宠动作名

			pet_msgid	= 507, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--害羞
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_123]]"害羞", -- 界面显示名称

			Act_Player = --[[!]]"害羞",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作4",	--宠动作名

			pet_msgid	= 505, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},
	},
}
-- 心月狐萝
CompanionPetCfg[96814] =
{
	StartBind = false, -- 是否招出的时候就绑上

	CanJumpWhenBind = true, --绑上时是否能跳

	BindHH = --[[!AUTO_118]]"",  -- 人的绑定HH
	BindCC = --[[!AUTO_119]]"",  -- 宠的绑定CC

	Interacts =
	{
		--鼓掌
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_120]]"鼓掌", -- 界面显示名称

			Act_Player = --[[!]]"鼓掌",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作1",	--宠动作名

			pet_msgid	= 527, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--发怒
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_121]]"發怒", -- 界面显示名称

			Act_Player = --[[!]]"发怒",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作2",	--宠动作名

			pet_msgid	= 506, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--伤心
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_122]]"傷心", -- 界面显示名称

			Act_Player = --[[!]]"伤心",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作3",	--宠动作名

			pet_msgid	= 507, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--害羞
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_123]]"害羞", -- 界面显示名称

			Act_Player = --[[!]]"害羞",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作4",	--宠动作名

			pet_msgid	= 505, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},
	},
}

-- 小海狮
CompanionPetCfg[97643] =
{
	StartBind = false, -- 是否招出的时候就绑上

	CanJumpWhenBind = true, --绑上时是否能跳

	BindHH = --[[!AUTO_118]]"",  -- 人的绑定HH
	BindCC = --[[!AUTO_119]]"",  -- 宠的绑定CC

	Interacts =
	{
		--鼓掌
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_120]]"鼓掌", -- 界面显示名称

			Act_Player = --[[!]]"鼓掌",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作1",	--宠动作名

			pet_msgid	= 527, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--发怒
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_121]]"發怒", -- 界面显示名称

			Act_Player = --[[!]]"发怒",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作2",	--宠动作名

			pet_msgid	= 506, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--伤心
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_122]]"傷心", -- 界面显示名称

			Act_Player = --[[!]]"伤心",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作3",	--宠动作名

			pet_msgid	= 507, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--害羞
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_123]]"害羞", -- 界面显示名称

			Act_Player = --[[!]]"害羞",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作4",	--宠动作名

			pet_msgid	= 505, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},
	},
}

-- 运营用暗之子
CompanionPetCfg[99936] =
{
	StartBind = false, -- 是否招出的时候就绑上

	CanJumpWhenBind = true, --绑上时是否能跳

	BindHH = --[[!AUTO_118]]"",  -- 人的绑定HH
	BindCC = --[[!AUTO_119]]"",  -- 宠的绑定CC

	Interacts =
	{
		--鼓掌
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_120]]"鼓掌", -- 界面显示名称

			Act_Player = --[[!]]"鼓掌",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作1",	--宠动作名

			pet_msgid	= 527, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--发怒
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_121]]"發怒", -- 界面显示名称

			Act_Player = --[[!]]"发怒",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作2",	--宠动作名

			pet_msgid	= 506, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--伤心
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_122]]"傷心", -- 界面显示名称

			Act_Player = --[[!]]"伤心",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作3",	--宠动作名

			pet_msgid	= 507, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--害羞
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_123]]"害羞", -- 界面显示名称

			Act_Player = --[[!]]"害羞",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作4",	--宠动作名

			pet_msgid	= 505, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},
	},
}

-- 运营用竖琴娃娃
CompanionPetCfg[99937] =
{
	StartBind = false, -- 是否招出的时候就绑上

	CanJumpWhenBind = true, --绑上时是否能跳

	BindHH = --[[!AUTO_118]]"",  -- 人的绑定HH
	BindCC = --[[!AUTO_119]]"",  -- 宠的绑定CC

	Interacts =
	{
		--鼓掌
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_120]]"鼓掌", -- 界面显示名称

			Act_Player = --[[!]]"鼓掌",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作1",	--宠动作名

			pet_msgid	= 527, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--发怒
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_121]]"發怒", -- 界面显示名称

			Act_Player = --[[!]]"发怒",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作2",	--宠动作名

			pet_msgid	= 506, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--伤心
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_122]]"傷心", -- 界面显示名称

			Act_Player = --[[!]]"伤心",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作3",	--宠动作名

			pet_msgid	= 507, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--害羞
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_123]]"害羞", -- 界面显示名称

			Act_Player = --[[!]]"害羞",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作4",	--宠动作名

			pet_msgid	= 505, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},
	},
}

-- 运营用圣诞萌宠
CompanionPetCfg[99938] =
{
	StartBind = false, -- 是否招出的时候就绑上

	CanJumpWhenBind = true, --绑上时是否能跳

	BindHH = --[[!AUTO_118]]"",  -- 人的绑定HH
	BindCC = --[[!AUTO_119]]"",  -- 宠的绑定CC

	Interacts =
	{
		--鼓掌
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_120]]"鼓掌", -- 界面显示名称

			Act_Player = --[[!]]"鼓掌",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作1",	--宠动作名

			pet_msgid	= 527, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--发怒
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_121]]"發怒", -- 界面显示名称

			Act_Player = --[[!]]"发怒",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作2",	--宠动作名

			pet_msgid	= 506, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--伤心
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_122]]"傷心", -- 界面显示名称

			Act_Player = --[[!]]"伤心",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作3",	--宠动作名

			pet_msgid	= 507, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--害羞
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_123]]"害羞", -- 界面显示名称

			Act_Player = --[[!]]"害羞",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作4",	--宠动作名

			pet_msgid	= 505, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},
	},
}

-- 小鸡喔喔
CompanionPetCfg[100126] =
{
	StartBind = false, -- 是否招出的时候就绑上

	CanJumpWhenBind = true, --绑上时是否能跳

	BindHH = --[[!AUTO_118]]"",  -- 人的绑定HH
	BindCC = --[[!AUTO_119]]"",  -- 宠的绑定CC

	Interacts =
	{
		--鼓掌
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_120]]"鼓掌", -- 界面显示名称

			Act_Player = --[[!]]"鼓掌",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作1",	--宠动作名

			pet_msgid	= 527, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--发怒
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_121]]"發怒", -- 界面显示名称

			Act_Player = --[[!]]"发怒",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作2",	--宠动作名

			pet_msgid	= 506, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--伤心
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_122]]"傷心", -- 界面显示名称

			Act_Player = --[[!]]"伤心",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作3",	--宠动作名

			pet_msgid	= 507, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--害羞
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_123]]"害羞", -- 界面显示名称

			Act_Player = --[[!]]"害羞",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作4",	--宠动作名

			pet_msgid	= 505, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},
	},
}

-- 法老猫
CompanionPetCfg[100518] =
{
	StartBind = false, -- 是否招出的时候就绑上

	CanJumpWhenBind = true, --绑上时是否能跳

	BindHH = --[[!AUTO_118]]"",  -- 人的绑定HH
	BindCC = --[[!AUTO_119]]"",  -- 宠的绑定CC

	Interacts =
	{
		--鼓掌
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_120]]"鼓掌", -- 界面显示名称

			Act_Player = --[[!]]"鼓掌",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作1",	--宠动作名

			pet_msgid	= 527, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--发怒
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_121]]"發怒", -- 界面显示名称

			Act_Player = --[[!]]"发怒",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作2",	--宠动作名

			pet_msgid	= 506, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--伤心
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_122]]"傷心", -- 界面显示名称

			Act_Player = --[[!]]"伤心",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作3",	--宠动作名

			pet_msgid	= 507, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--害羞
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_123]]"害羞", -- 界面显示名称

			Act_Player = --[[!]]"害羞",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作4",	--宠动作名

			pet_msgid	= 505, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},
	},
}

-- 求爱用蓝凤凰
CompanionPetCfg[99180] =
{
	StartBind = false, -- 是否招出的时候就绑上

	CanJumpWhenBind = true, --绑上时是否能跳

	BindHH = --[[!AUTO_118]]"",  -- 人的绑定HH
	BindCC = --[[!AUTO_119]]"",  -- 宠的绑定CC

	Interacts =
	{
		--鼓掌
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_120]]"鼓掌", -- 界面显示名称

			Act_Player = --[[!]]"鼓掌",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作1",	--宠动作名
			pet_msgid	= 538, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--发怒
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_121]]"發怒", -- 界面显示名称

			Act_Player = --[[!]]"发怒",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作2",	--宠动作名

			pet_msgid	= 539, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--伤心
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_122]]"傷心", -- 界面显示名称

			Act_Player = --[[!]]"伤心",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作3",	--宠动作名

			pet_msgid	= 540, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--害羞
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_123]]"害羞", -- 界面显示名称

			Act_Player = --[[!]]"害羞",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作4",	--宠动作名

			pet_msgid	= 541, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},
	},
}

-- 求爱用任盈盈
CompanionPetCfg[99181] =
{
	StartBind = false, -- 是否招出的时候就绑上

	CanJumpWhenBind = true, --绑上时是否能跳

	BindHH = --[[!AUTO_118]]"",  -- 人的绑定HH
	BindCC = --[[!AUTO_119]]"",  -- 宠的绑定CC

	Interacts =
	{
		--鼓掌
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_120]]"鼓掌", -- 界面显示名称

			Act_Player = --[[!]]"鼓掌",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作1",	--宠动作名

			pet_msgid	= 542, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--发怒
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_121]]"發怒", -- 界面显示名称

			Act_Player = --[[!]]"发怒",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作2",	--宠动作名

			pet_msgid	= 543, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--伤心
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_122]]"傷心", -- 界面显示名称

			Act_Player = --[[!]]"伤心",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作3",	--宠动作名

			pet_msgid	= 544, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--害羞
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_123]]"害羞", -- 界面显示名称

			Act_Player = --[[!]]"害羞",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作4",	--宠动作名

			pet_msgid	= 545, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},
	},
}

-- 求爱用岳灵珊
CompanionPetCfg[99182] =
{
	StartBind = false, -- 是否招出的时候就绑上

	CanJumpWhenBind = true, --绑上时是否能跳

	BindHH = --[[!AUTO_118]]"",  -- 人的绑定HH
	BindCC = --[[!AUTO_119]]"",  -- 宠的绑定CC

	Interacts =
	{
		--鼓掌
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_120]]"鼓掌", -- 界面显示名称

			Act_Player = --[[!]]"鼓掌",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作1",	--宠动作名

			pet_msgid	= 546, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--发怒
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_121]]"發怒", -- 界面显示名称

			Act_Player = --[[!]]"发怒",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作2",	--宠动作名

			pet_msgid	= 547, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--伤心
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_122]]"傷心", -- 界面显示名称

			Act_Player = --[[!]]"伤心",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作3",	--宠动作名

			pet_msgid	= 548, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--害羞
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_123]]"害羞", -- 界面显示名称

			Act_Player = --[[!]]"害羞",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作4",	--宠动作名

			pet_msgid	= 549, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},
	},
}

-- 求爱用林平之
CompanionPetCfg[99183] =
{
	StartBind = false, -- 是否招出的时候就绑上

	CanJumpWhenBind = true, --绑上时是否能跳

	BindHH = --[[!AUTO_118]]"",  -- 人的绑定HH
	BindCC = --[[!AUTO_119]]"",  -- 宠的绑定CC

	Interacts =
	{
		--鼓掌
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_120]]"鼓掌", -- 界面显示名称

			Act_Player = --[[!]]"鼓掌",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作1",	--宠动作名

			pet_msgid	= 550, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--发怒
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_121]]"發怒", -- 界面显示名称

			Act_Player = --[[!]]"发怒",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作2",	--宠动作名

			pet_msgid	= 551, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--伤心
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_122]]"傷心", -- 界面显示名称

			Act_Player = --[[!]]"伤心",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作3",	--宠动作名

			pet_msgid	= 552, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--害羞
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_123]]"害羞", -- 界面显示名称

			Act_Player = --[[!]]"害羞",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作4",	--宠动作名

			pet_msgid	= 553, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},
	},
}

-- 求爱用仪琳
CompanionPetCfg[99184] =
{
	StartBind = false, -- 是否招出的时候就绑上

	CanJumpWhenBind = true, --绑上时是否能跳

	BindHH = --[[!AUTO_118]]"",  -- 人的绑定HH
	BindCC = --[[!AUTO_119]]"",  -- 宠的绑定CC

	Interacts =
	{
		--鼓掌
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_120]]"鼓掌", -- 界面显示名称

			Act_Player = --[[!]]"鼓掌",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作1",	--宠动作名

			pet_msgid	= 554, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--发怒
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_121]]"發怒", -- 界面显示名称

			Act_Player = --[[!]]"发怒",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作2",	--宠动作名

			pet_msgid	= 555, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--伤心
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_122]]"傷心", -- 界面显示名称

			Act_Player = --[[!]]"伤心",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作3",	--宠动作名

			pet_msgid	= 556, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--害羞
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_123]]"害羞", -- 界面显示名称

			Act_Player = --[[!]]"害羞",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作4",	--宠动作名

			pet_msgid	= 557, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},
	},
}

-- 求爱用田伯光
CompanionPetCfg[99185] =
{
	StartBind = false, -- 是否招出的时候就绑上

	CanJumpWhenBind = true, --绑上时是否能跳

	BindHH = --[[!AUTO_118]]"",  -- 人的绑定HH
	BindCC = --[[!AUTO_119]]"",  -- 宠的绑定CC

	Interacts =
	{
		--鼓掌
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_120]]"鼓掌", -- 界面显示名称

			Act_Player = --[[!]]"鼓掌",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作1",	--宠动作名

			pet_msgid	= 558, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--发怒
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_121]]"發怒", -- 界面显示名称

			Act_Player = --[[!]]"发怒",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作2",	--宠动作名

			pet_msgid	= 559, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--伤心
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_122]]"傷心", -- 界面显示名称

			Act_Player = --[[!]]"伤心",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作3",	--宠动作名

			pet_msgid	= 560, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--害羞
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_123]]"害羞", -- 界面显示名称

			Act_Player = --[[!]]"害羞",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作4",	--宠动作名

			pet_msgid	= 561, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},
	},
}

-- 求爱用令狐冲
CompanionPetCfg[99186] =
{
	StartBind = false, -- 是否招出的时候就绑上

	CanJumpWhenBind = true, --绑上时是否能跳

	BindHH = --[[!AUTO_118]]"",  -- 人的绑定HH
	BindCC = --[[!AUTO_119]]"",  -- 宠的绑定CC

	Interacts =
	{
		--鼓掌
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_120]]"鼓掌", -- 界面显示名称

			Act_Player = --[[!]]"鼓掌",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作1",	--宠动作名

			pet_msgid	= 562, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--发怒
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_121]]"發怒", -- 界面显示名称

			Act_Player = --[[!]]"发怒",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作2",	--宠动作名

			pet_msgid	= 563, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--伤心
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_122]]"傷心", -- 界面显示名称

			Act_Player = --[[!]]"伤心",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作3",	--宠动作名

			pet_msgid	= 564, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},

		--害羞
		{
			BindLimit = 0, -- 0:非绑定才能交互，1:需要绑定才能交互
			UIShowName = --[[!AUTO_123]]"害羞", -- 界面显示名称

			Act_Player = --[[!]]"害羞",	-- 玩家动作名
			Act_Pet = --[[!]]"交互动作4",	--宠动作名

			pet_msgid	= 565, -- 宠物聊天消息, 见obj_speak_data.lua里的表 ObjSpeak.PetMsgList
		},
	},
}