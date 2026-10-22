--[[#tag push auto]]

local UIManTemplate = UIManTemplate
local DlgApi  = DlgApi
local GameApi = GameApi
local Format = string.format

LoginUI = UIManTemplate:new({this = --[[!AUTO_1]]"LoginUI"});

function LoginUI:Init()
	self:RegisterEvent(LUA_EVENT_LOADING_SETWORLD, self.OnEventLoadingSetWorld);
	self:RegisterEvent(LUA_EVENT_LOADING_SETPROGRESS, self.OnEventLoadingSetProgress);
end

function LoginUI:Release()
end

function LoginUI:Tick()
end

function LoginUI:ProcessEvent()
end

function LoginUI:OnEventLoadingSetWorld(event, id, mapfile)
    math.randomseed(os.time())
	math.random()
	local ran1 = math.random(table.getn(LOADING_BACKGROUND))
	local ran2 = math.random(table.getn(LOADING_LOGIN_TIP))
	local ran3 = math.random(table.getn(LOADING_INGAME_TIP))
	if id == 0 then
	    DlgApi.SetItemText(--[[!AUTO_2]]"Win_Loading", --[[!AUTO_3]]"Txt_Tip", string.format(LOADING_TIP_STYLE, LOADING_BACKGROUND[ran1].color, LOADING_LOGIN_TIP[ran2].string))
		DlgApi.SetImageFile(--[[!AUTO_4]]"Win_Loading", --[[!AUTO_5]]"Img_Loading", string.format(LOADING_IMG_STYLE_COMMON, LOADING_BACKGROUND[ran1].file), 1)
	elseif mapfile == --[[!AUTO_6]]"N" then
	    DlgApi.SetItemText(--[[!AUTO_7]]"Win_Loading", --[[!AUTO_8]]"Txt_Tip", string.format(LOADING_TIP_STYLE, LOADING_BACKGROUND[ran1].color, LOADING_INGAME_TIP[ran3].string))
		DlgApi.SetImageFile(--[[!AUTO_9]]"Win_Loading", --[[!AUTO_10]]"Img_Loading", string.format(LOADING_IMG_STYLE_COMMON, LOADING_BACKGROUND[ran1].file), 1)
	else
	    DlgApi.SetItemText(--[[!AUTO_11]]"Win_Loading", --[[!AUTO_12]]"Txt_Tip", string.format(LOADING_TIP_STYLE, LOADING_INGAME_TIP[ran3].color, LOADING_INGAME_TIP[ran3].string))
		DlgApi.SetImageFile(--[[!AUTO_13]]"Win_Loading", --[[!AUTO_14]]"Img_Loading", string.format(LOADING_IMG_STYLE_SPECIAL, mapfile), 1)
	end
end

function LoginUI:OnEventLoadingSetProgress(event, progress)
	DlgApi.SetProgress(--[[!AUTO_15]]"Win_Loading", --[[!AUTO_16]]"Prgs_Loading", progress);
end
