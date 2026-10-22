--[[#tag push auto]]

local DlgTemplate = DlgTemplate
local DlgApi  = DlgApi
local GameApi = GameApi

--ExInEdMode("Win_SpecialSpeak")

Win_SpecialSpeak = DlgTemplate:new({this = --[[!AUTO_1]]"Win_SpecialSpeak"})

---------------------------------------
--界面相关配置
---------------------------------------
Win_SpecialSpeak_Cfg =
{
	MoveInitPos1 	= 0,      -- 界面在左侧移动初始位置
	MoveInitPos2 	= 498,    -- 界面在右侧移动初始位置
	StopState 		= false,  -- 界面停止移动状态
	CloseTime 		= 0,      -- 界面停止移动后关闭记时
	speakid 		= 0,      -- 喊话配置索引
	dewTime 		= 0,      -- 界面停止移动后关闭时间
	Type 			= 0,      -- 界面类型
	Start 			= 1,
	canClose 		= false,  -- 界面关闭状态
	alpha 			= 255,
	scale           = 1,
}

local Win_SpecialSpeak_AllItem =
{
ItemName1 = --[[!AUTO_2]]"Img_Head1",
ItemName2 = --[[!AUTO_3]]"Img_Head2",
ItemName3 = --[[!AUTO_4]]"Img_HeadBack1",
ItemName4 = --[[!AUTO_5]]"Img_HeadBack2",
ItemName5 = --[[!AUTO_6]]"Lab_Name1",
ItemName6 = --[[!AUTO_7]]"Lab_Name2"
}

local Win_SpecialSpeak_Configs = {}
Win_SpecialSpeak_Configs[1] = {PosUI = --[[!AUTO_8]]"Win_ChatInfo", x = 226, y = -180, speed = 12, Aspect = AUIDIALOG_ALIGN_LEFT}
Win_SpecialSpeak_Configs[2] = {PosUI = --[[!AUTO_9]]"Win_Broken", x = 263, y = 400, speed = -15, Aspect = AUIDIALOG_ALIGN_RIGHT}
Win_SpecialSpeak_Configs[3] = {PosUI = --[[!AUTO_10]]"", x = 100, y = 100}

local Win_SpecialSpeak_UI = {}
Win_SpecialSpeak_UI[1] = {ItemName1 = --[[!AUTO_11]]"Img_Head1", ItemName2 = --[[!AUTO_12]]"Img_HeadBack1", ItemName3 = --[[!AUTO_13]]"Lab_Name1"}
Win_SpecialSpeak_UI[2] = {ItemName1 = --[[!AUTO_14]]"Img_Head2", ItemName2 = --[[!AUTO_15]]"Img_HeadBack2", ItemName3 = --[[!AUTO_16]]"Lab_Name2"}
Win_SpecialSpeak_UI[3] = {ItemName1 = --[[!AUTO_17]]"", ItemName2 = --[[!AUTO_18]]"", ItemName3 = --[[!AUTO_19]]""}

local Win_SpecialSpeak_Postion =
{
	["Img_Head1"] =
	{
		[1] = {-150, 0},
		[2] = {-130, 30},
		[3] = {-110, 60},
		[4] = {-90, 80},
		[5] = {-70, 100},
		[6] = {-50, 120},
		[7] = {-40, 140},
		[8] = {-30, 160},
		[9] = {-20, 180},
		[10] = {-10, 200},
		[11] = {0, 210},
		[12] = {5, 220},
		[13] = {10, 230},
		[14] = {15, 240},
		[15] = {20, 250},
		[16] = {25, 255},
	},
	["Control_Img_Back"] =
	{
		[1] = {200, 0},
		[2] = {180, 30},
		[3] = {160, 60},
		[4] = {140, 80},
		[5] = {120, 100},
		[6] = {100, 120},
		[7] = {80, 140},
		[8] = {60, 160},
		[9] = {50, 180},
		[10] = {40, 200},
		[11] = {30, 210},
		[12] = {20, 220},
		[13] = {15, 230},
		[14] = {10, 240},
		[15] = {5, 250},
		[16] = {0, 255},
	},
}

---------------------------------------
--界面初始化
---------------------------------------
function Win_SpecialSpeak:Init()

end

---------------------------------------
--界面开启
---------------------------------------
function Win_SpecialSpeak:ShowDialog()
Win_SpecialSpeak_Cfg.MoveInitPos1 = 0
Win_SpecialSpeak_Cfg.MoveInitPos2 = 498
Win_SpecialSpeak_Cfg.CloseTime = 0
Win_SpecialSpeak_Cfg.StopState = false
Win_SpecialSpeak_Cfg.dewTime = 0
Win_SpecialSpeak_Cfg.Type = 1
Win_SpecialSpeak_Cfg.Start = 1
Win_SpecialSpeak_Cfg.End = 16
Win_SpecialSpeak_Cfg.scale = DlgApi.GetDialogScale(self.this)
DlgApi.SetDialogPosition(self.this, 0, -20 * Win_SpecialSpeak_Cfg.scale, --[[!AUTO_20]]"Win_ChatInfo", AUIDIALOG_ALIGN_INSIDE, AUIDIALOG_ALIGN_LEFT, AUIDIALOG_ALIGN_OUTSIDE, AUIDIALOG_ALIGN_TOP)
self:SetItemInfo(Win_SpecialSpeak_Postion["Img_Head1"][1][1], Win_SpecialSpeak_Postion["Control_Img_Back"][1][1] ,Win_SpecialSpeak_Postion["Img_Head1"][1][2])
DlgApi.SetItemAlpha (self.this, --[[!AUTO_21]]"Lab_Name1", 255)
DlgApi.SetItemAlpha (self.this, --[[!AUTO_22]]"Img_Camp",255)
DlgApi.SetItemAlpha (self.this, --[[!AUTO_23]]"Txt_Content",255)
Win_SpecialSpeak_Cfg.alpha = 255
Win_SpecialSpeak_Cfg.canClose = false
DlgApi.EnableDialog(self.this, false)
end

function Win_SpecialSpeak:SetItemInfo(x1, x2, alpha)
	DlgApi.SetItemPos(--[[!AUTO_24]]"Win_SpecialSpeak", --[[!AUTO_25]]"Img_Head1", x1 * Win_SpecialSpeak_Cfg.scale, -10 * Win_SpecialSpeak_Cfg.scale)
	DlgApi.SetItemPos(--[[!AUTO_26]]"Win_SpecialSpeak", --[[!AUTO_27]]"Control_Img_Back", x2 * Win_SpecialSpeak_Cfg.scale, 0 * Win_SpecialSpeak_Cfg.scale)
	DlgApi.SetItemAlpha (--[[!AUTO_28]]"Win_SpecialSpeak", --[[!AUTO_29]]"Img_Head1", alpha)
	DlgApi.SetItemAlpha (--[[!AUTO_30]]"Win_SpecialSpeak", --[[!AUTO_31]]"Control_Img_Back",alpha)
end

---------------------------------------
--设置文字 头像 和 NPC名称显示
---------------------------------------
function Win_SpecialSpeak:ShowContent(speakText, npcName, HeadPath, dewTime)
	Win_SpecialSpeak_Cfg.dewTime = dewTime
	DlgApi.SetItemText(self.this, --[[!AUTO_32]]"Txt_Content", speakText)
	DlgApi.SetItemText(self.this, --[[!AUTO_33]]"Lab_Name1", npcName)
	DlgApi.SetImageFile(self.this, --[[!AUTO_34]]"Img_Head1", HeadPath, 1)
end

---------------------------------------
--计时
---------------------------------------
function Win_SpecialSpeak:Tick(deltatime)
	--界面关闭时间倒计时
	if Win_SpecialSpeak_Cfg.CloseTime < Win_SpecialSpeak_Cfg.dewTime then
	   Win_SpecialSpeak_Cfg.CloseTime = Win_SpecialSpeak_Cfg.CloseTime + deltatime
	else
		Win_SpecialSpeak_Cfg.canClose = true
	end

	--界面淡出关闭
	if Win_SpecialSpeak_Cfg.canClose then
		if Win_SpecialSpeak_Cfg.alpha > 20 then
			Win_SpecialSpeak_Cfg.alpha = Win_SpecialSpeak_Cfg.alpha - 20
			DlgApi.SetItemAlpha (self.this, --[[!AUTO_35]]"Img_Head1", Win_SpecialSpeak_Cfg.alpha)
			DlgApi.SetItemAlpha (self.this, --[[!AUTO_36]]"Control_Img_Back",Win_SpecialSpeak_Cfg.alpha)
			DlgApi.SetItemAlpha (self.this, --[[!AUTO_37]]"Lab_Name1", Win_SpecialSpeak_Cfg.alpha)
			DlgApi.SetItemAlpha (self.this, --[[!AUTO_38]]"Img_Camp",Win_SpecialSpeak_Cfg.alpha)
			DlgApi.SetItemAlpha (self.this, --[[!AUTO_39]]"Txt_Content",Win_SpecialSpeak_Cfg.alpha)
			Win_SpecialSpeak:SetItemInfo(
				Win_SpecialSpeak_Postion["Img_Head1"][Win_SpecialSpeak_Cfg.End][1],
				Win_SpecialSpeak_Postion["Control_Img_Back"][Win_SpecialSpeak_Cfg.End][1],
				Win_SpecialSpeak_Cfg.alpha)
			Win_SpecialSpeak_Cfg.End = Win_SpecialSpeak_Cfg.End - 1
		else
			DlgApi.ShowDialog(--[[!AUTO_40]]"Win_SpecialSpeak", false)
		end
	end

	--界面淡入效果
	if Win_SpecialSpeak_Cfg.Start <= #(Win_SpecialSpeak_Postion["Img_Head1"]) then
		Win_SpecialSpeak:SetItemInfo(
						Win_SpecialSpeak_Postion["Img_Head1"][Win_SpecialSpeak_Cfg.Start][1],
						Win_SpecialSpeak_Postion["Control_Img_Back"][Win_SpecialSpeak_Cfg.Start][1],
						Win_SpecialSpeak_Postion["Img_Head1"][Win_SpecialSpeak_Cfg.Start][2])
		Win_SpecialSpeak_Cfg.Start = Win_SpecialSpeak_Cfg.Start + 1
	end
end

---------------------------------------
--左边移动函数
---------------------------------------
function Win_SpecialSpeak:MoveLeft()
	if Win_SpecialSpeak_Cfg.MoveInitPos1 < Win_SpecialSpeak_Configs[Win_SpecialSpeak_Cfg.Type].x then
		Win_SpecialSpeak_Cfg.MoveInitPos1 = Win_SpecialSpeak_Cfg.MoveInitPos1 + Win_SpecialSpeak_Configs[Win_SpecialSpeak_Cfg.Type].speed
		self:SetMovePos(Win_SpecialSpeak_Cfg.MoveInitPos1, Win_SpecialSpeak_Configs[Win_SpecialSpeak_Cfg.Type])
	else
		self:SetMovePos(Win_SpecialSpeak_Configs[Win_SpecialSpeak_Cfg.Type].x, Win_SpecialSpeak_Configs[Win_SpecialSpeak_Cfg.Type])
		Win_SpecialSpeak_Cfg.StopState = true
	end
end
---------------------------------------
--右边移动函数
---------------------------------------
function Win_SpecialSpeak:MoveRight()
	if Win_SpecialSpeak_Cfg.MoveInitPos2 > Win_SpecialSpeak_Configs[Win_SpecialSpeak_Cfg.Type].x then
		Win_SpecialSpeak_Cfg.MoveInitPos2 = Win_SpecialSpeak_Cfg.MoveInitPos2 + Win_SpecialSpeak_Configs[Win_SpecialSpeak_Cfg.Type].speed
		self:SetMovePos(Win_SpecialSpeak_Cfg.MoveInitPos2, Win_SpecialSpeak_Configs[Win_SpecialSpeak_Cfg.Type])
	else
		self:SetMovePos(Win_SpecialSpeak_Configs[Win_SpecialSpeak_Cfg.Type].x, Win_SpecialSpeak_Configs[Win_SpecialSpeak_Cfg.Type])
		LogPrint(Win_SpecialSpeak_Cfg.MoveInitPos2)
		Win_SpecialSpeak_Cfg.StopState = true
	end
end
---------------------------------------
--关闭所有控件
---------------------------------------
function Win_SpecialSpeak:CloseAllItem()
	for k, v in pairs(Win_SpecialSpeak_AllItem) do
		DlgApi.ShowItem(self.this, v, false);
	end
end

---------------------------------------
--开启需要显示的界面
---------------------------------------
function Win_SpecialSpeak:ShowTpyeItem(UI_tbl)
	self:SetItem()
end

---------------------------------------
--设置界面初始位置
---------------------------------------
function Win_SpecialSpeak:SetInitPos(UI_tbl)
DlgApi.SetDialogPosition(self.this, 0, UI_tbl.y, UI_tbl.PosUI, AUIDIALOG_ALIGN_OUTSIDE, UI_tbl.Aspect, AUIDIALOG_ALIGN_INSIDE, AUIDIALOG_ALIGN_BOTTOM)
end

---------------------------------------
--界面移动动画
---------------------------------------
function Win_SpecialSpeak:SetMovePos(x, UI_tbl)
DlgApi.SetDialogPosition(self.this, x, UI_tbl.y, UI_tbl.PosUI, AUIDIALOG_ALIGN_OUTSIDE, AUIDIALOG_ALIGN_LEFT, AUIDIALOG_ALIGN_INSIDE, AUIDIALOG_ALIGN_BOTTOM)
end

