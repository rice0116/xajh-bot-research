local DlgTemplate = DlgTemplate
local DlgApi  = DlgApi
local GameApi = GameApi

--ExInEdMode("Win_SpeakSingleLine")

Win_SpeakSingleLine = DlgTemplate:new({this = "Win_SpeakSingleLine"})

---------------------------------------
--界面相关配置
---------------------------------------
Win_SpeakSingleLine_Cfg =
{
	MoveInitPos1 	= -1,      -- 界面在左侧移动初始位置
	MoveInitPos2 	= 100,    -- 界面在右侧移动初始位置
	StopState 		= false,  -- 界面停止移动状态
	CloseTime 		= 0,      -- 界面停止移动后关闭记时
	speakid 		= 0,      -- 喊话配置索引
	dewTime 		= 0,      -- 界面停止移动后关闭时间
	Type 			= 0,      -- 界面类型
	Start 			= 1,
	canClose 		= false,  -- 界面关闭状态
	alpha 			= 255,
}

local Win_SpeakSingleLine_AllItem =
{
ItemName1 = "Img_Head1",

}


---------------------------------------
--界面初始化
---------------------------------------
function Win_SpeakSingleLine:Init()

end

---------------------------------------
--界面开启
---------------------------------------
function Win_SpeakSingleLine:ShowDialog()
Win_SpeakSingleLine_Cfg.MoveInitPos1 = -1
Win_SpeakSingleLine_Cfg.MoveInitPos2 = 100
Win_SpeakSingleLine_Cfg.CloseTime = 0
Win_SpeakSingleLine_Cfg.StopState = false
Win_SpeakSingleLine_Cfg.dewTime = 0
Win_SpeakSingleLine_Cfg.Type = 1
Win_SpeakSingleLine_Cfg.Start = 1
Win_SpeakSingleLine_Cfg.End = 16


DlgApi.SetItemAlpha (self.this, "Txt_Content",255)
DlgApi.SetItemAlpha (self.this, "Img_Head1",255)
Win_SpeakSingleLine_Cfg.alpha = 255
Win_SpeakSingleLine_Cfg.canClose = false
end



---------------------------------------
--设置文字 头像 和 NPC名称显示
---------------------------------------
function Win_SpeakSingleLine:ShowContent(speakText, npcName, HeadPath, dewTime)
	Win_SpeakSingleLine_Cfg.dewTime = dewTime
	DlgApi.SetItemText(self.this, "Txt_Content", speakText)

end

---------------------------------------
--计时
---------------------------------------
function Win_SpeakSingleLine:Tick(deltatime)
	--界面关闭时间倒计时
	if Win_SpeakSingleLine_Cfg.CloseTime < Win_SpeakSingleLine_Cfg.dewTime then
	   Win_SpeakSingleLine_Cfg.CloseTime = Win_SpeakSingleLine_Cfg.CloseTime + deltatime
	else
		Win_SpeakSingleLine_Cfg.canClose = true
	end

	--界面淡出关闭
	if Win_SpeakSingleLine_Cfg.canClose then
	
			DlgApi.ShowDialog("Win_SpeakSingleLine", false)
	end
	

end


---------------------------------------
--关闭所有控件
---------------------------------------
function Win_SpeakSingleLine:CloseAllItem()
	for k, v in pairs(Win_SpeakSingleLine_AllItem) do
		DlgApi.ShowItem(self.this, v, false);
	end
end

---------------------------------------
--开启需要显示的界面
---------------------------------------
function Win_SpeakSingleLine:ShowTpyeItem(UI_tbl)
	self:SetItem()
end

---------------------------------------
--设置界面初始位置
---------------------------------------
function Win_SpeakSingleLine:SetInitPos(UI_tbl)
DlgApi.SetDialogPosition(self.this, 0, UI_tbl.y, UI_tbl.PosUI, AUIDIALOG_ALIGN_OUTSIDE, UI_tbl.Aspect, AUIDIALOG_ALIGN_INSIDE, AUIDIALOG_ALIGN_BOTTOM)
end



