--[[#tag push auto]]

local DlgTemplate = DlgTemplate
local DlgApi  = DlgApi

Win_CharHeadClose= DlgTemplate:new({this = --[[!AUTO_1]]"Win_CharHeadClose"})

function Win_CharHeadClose:Init()

    self:RegisterEvent(--[[!AUTO_2]]"Btn_Close", self.OnClose);
end

function Win_CharHeadClose:OnClose()
	  DlgApi.ShowDialog(--[[!AUTO_3]]"Win_CharHeadClose", false);
	  DlgApi.ShowDialog(--[[!AUTO_4]]"Win_CharHead", true);
end
