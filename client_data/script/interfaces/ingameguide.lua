--[[#tag push auto]]

------定义指引列表

INGAME_GUIDE_LIST = {}
INGAME_GUIDE_LIST[1] = {condition = 1 , content = 2}

------游戏指引界面，大小为0，完全隐藏

local Dlp = DlgTemplate
local DlgApi  = DlgApi
local GameApi = GameApi
local Format = string.format

Win_Ingameguide = Dlp:new({this = --[[!AUTO_1]]"Win_IngameGuide"})

function Win_Ingameguide:Init()
--    self:RegisterEvent("Btn_Close", self.OnClose);
--    self:RegisterEvent(WM_LBUTTONDOWN, self.OnLButtonDown);
end

function Win_Ingameguide:OnClose()
--	  DlgApi.ShowDialog("Win_Ingameguide", true);
end

function Win_Ingameguide:OnLButtonDown(name)
--	if name == "Img_Head" then
--		local id = GameApi.GetSelfID();
--		GameApi.SelectTarget(id);
--	end
end

function Win_Ingameguide:Tick()
--   local ret = GameApi.GetPlayerBasicProp(0);
--   DlgApi.SetItemText(self.this, "Txt_Name", ret.name);
--   DlgApi.SetItemText(self.this, "Txt_LV", Format("%d", ret.level));
--   GameApi.SetHostPortrait(self.this, "Img_Head");
end
