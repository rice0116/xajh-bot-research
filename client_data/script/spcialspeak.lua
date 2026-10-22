local DlgTemplate = DlgTemplate
local DlgApi  = DlgApi
local GameApi = GameApi


Win_SpecialSpeak = DlgTemplate:new({this = "Win_SpecialSpeak"})

---------------------------------------
--界面相关配置
---------------------------------------
Win_SpecialSpeak_Cfg =
	{
		MoveInitPos1 = 0,      -- 界面在左侧移动初始位置
		MoveInitPos2 = 498,   -- 界面在右侧移动初始位置
		StopState = false,     -- 界面停止移动状态
		CloseTime = 0,         -- 界面停止移动后关闭记时
		speakid = 0,           -- 喊话配置索引
		dewTime = 0,           -- 界面停止移动后关闭时间
		Type = 0               -- 界面类型
	}

local Win_SpecialSpeak_AllItem =
{
ItemName1 = "Img_Head1",
ItemName2 = "Img_Head2",
ItemName3 = "Img_HeadBack1",
ItemName4 = "Img_HeadBack2",
ItemName5 = "Lab_Name1",
ItemName6 = "Lab_Name2"
}

local Win_SpecialSpeak_Configs = {}
Win_SpecialSpeak_Configs[1] = {PosUI = "Win_ChatInfo", x = 226, y = -180, speed = 12, Aspect = AUIDIALOG_ALIGN_LEFT}
Win_SpecialSpeak_Configs[2] = {PosUI = "Win_Broken", x = 263, y = 400, speed = -15, Aspect = AUIDIALOG_ALIGN_RIGHT}
Win_SpecialSpeak_Configs[3] = {PosUI = "", x = 100, y = 100}

local Win_SpecialSpeak_UI = {}
Win_SpecialSpeak_UI[1] = {ItemName1 = "Img_Head1", ItemName2 = "Img_HeadBack1", ItemName3 = "Lab_Name1"}
Win_SpecialSpeak_UI[2] = {ItemName1 = "Img_Head2", ItemName2 = "Img_HeadBack2", ItemName3 = "Lab_Name2"}
Win_SpecialSpeak_UI[3] = {ItemName1 = "", ItemName2 = "", ItemName3 = ""}


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
Win_SpecialSpeak_Cfg.speakid = EctypeUI_Type
Win_SpecialSpeak_Cfg.dewTime = Ectype.EctypeBroadcast[Win_SpecialSpeak_Cfg.speakid].TimeOut * 1000
self:SetItem()
end

---------------------------------------
--计时
---------------------------------------
function Win_SpecialSpeak:Tick(deltatime)
	if Win_SpecialSpeak_Cfg.CloseTime < Win_SpecialSpeak_Cfg.dewTime then
	   Win_SpecialSpeak_Cfg.CloseTime = Win_SpecialSpeak_Cfg.CloseTime + 30
	else
	   DlgApi.ShowDialog("Win_SpecialSpeak", false)
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
--填充界面控件
---------------------------------------
function Win_SpecialSpeak:SetItem()
	local content =
	{
	Ectype.EctypeBroadcast[Win_SpecialSpeak_Cfg.speakid].Content,
	Ectype.EctypeBroadcast[Win_SpecialSpeak_Cfg.speakid].NpcName,
	Ectype.EctypeBroadcast[Win_SpecialSpeak_Cfg.speakid].HeadPath
	}
	local item = Win_SpecialSpeak_UI[Win_SpecialSpeak_Cfg.speakid]
	DlgApi.SetItemText(self.this, "Txt_Content", content[1])
	DlgApi.SetItemText(self.this, "Lab_Name1", content[2])
	DlgApi.SetImageFile(self.this, "Img_Head1", content[3], 1)
end

---------------------------------------
--设置界面初始位置
---------------------------------------
function Win_SpecialSpeak:SetInitPos(UI_tbl, Aspect)
DlgApi.SetDialogPosition(self.this, 0, UI_tbl.y, UI_tbl.PosUI, AUIDIALOG_ALIGN_OUTSIDE, UI_tbl.Aspect, AUIDIALOG_ALIGN_INSIDE, AUIDIALOG_ALIGN_BOTTOM)
end

---------------------------------------
--界面移动动画
---------------------------------------
function Win_SpecialSpeak:SetMovePos(x, UI_tbl)
DlgApi.SetDialogPosition(self.this, x, UI_tbl.y, UI_tbl.PosUI, AUIDIALOG_ALIGN_OUTSIDE, AUIDIALOG_ALIGN_LEFT, AUIDIALOG_ALIGN_INSIDE, AUIDIALOG_ALIGN_BOTTOM)
end

