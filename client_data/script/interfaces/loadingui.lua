--[[#tag push auto]]


local UIManTemplate = UIManTemplate
local DlgApi  = DlgApi
local GameApi = GameApi
local Format = string.format

LoadingUI = UIManTemplate:new({this = --[[!AUTO_1]]"LoadingUI"});

--L

--logo控件位置大小

local logoposx = 0
local logoposy = 0
local logosizex = 256
local logosizey = 128
--进度条控件位置大小
local prgposx = 20
local prgposy = 478
--local prgsizex = 718
--local prgsizey = 26
local prgsizex = 773
local prgsizey = 47
--tip控件位置
local tipposx = 112
local tipposy = 450
--动画控件位置大小
local anipicsizex = 160
local anipicsizey = 160

--计算数据，三段的动作数量，比例，基础位置
local prgstart = 0.1
local prgact = 0.9
local numstart = table.getn(ANISEQSTART)
local numact = table.getn(ANISEQACT)
local numend = table.getn(ANISEQEND)
local perstart = 0.4
local peract = 0.55
local perend = 0.05
--local startx = -160
--local endx = 640
--local starty = 400
--local endy = 400

function LoadingUI:Init()
	self:RegisterEvent(LUA_EVENT_LOADING_SETWORLD, self.OnEventLoadingSetWorld);
	self:RegisterEvent(LUA_EVENT_LOADING_SETPROGRESS, self.OnEventLoadingSetProgress);
end

function LoadingUI:Release()
end

function LoadingUI:Tick()
end

function LoadingUI:ProcessEvent()
end

function LoadingUI:OnEventLoadingSetWorld(event, id, mapfile)
    math.randomseed(os.time())
	math.random()
	local ran1 = math.random(table.getn(LOADING_BACKGROUND))
	local ran2 = math.random(table.getn(LOADING_LOGIN_TIP))
	local ran3 = math.random(table.getn(LOADING_INGAME_TIP))

--	local rect_tbl = DlgApi.GetItemRect("Win_Loading", "Prgs_Loading")
--	local rect_tbt = DlgApi.GetItemRect("Win_Loading", "Img_wujian")
--	startx = -160
--	endx = rect_tbl["x"]+rect_tbl["width"]-rect_tbt["width"]
--	starty = rect_tbl["y"]-rect_tbt["height"]*0.7+rect_tbl["height"]*0.5
--	endy = starty

	if id == 0 then
	    DlgApi.SetItemText(--[[!AUTO_2]]"Win_Loading", --[[!AUTO_3]]"Txt_Tip", string.format(LOADING_TIP_STYLE, LOADING_BACKGROUND[ran1].color, LOADING_LOGIN_TIP[ran2].string))
		--DlgApi.SetImageFile("Win_Loading", "Img_Loading", string.format(LOADING_IMG_STYLE_COMMON, LOADING_BACKGROUND[ran1].file), 1)
	elseif mapfile == --[[!AUTO_4]]"N" then
	    DlgApi.SetItemText(--[[!AUTO_5]]"Win_Loading", --[[!AUTO_6]]"Txt_Tip", string.format(LOADING_TIP_STYLE, LOADING_BACKGROUND[ran1].color, LOADING_INGAME_TIP[ran3].string))
		--DlgApi.SetImageFile("Win_Loading", "Img_Loading", string.format(LOADING_IMG_STYLE_COMMON, LOADING_BACKGROUND[ran1].file), 1)
	else
	    DlgApi.SetItemText(--[[!AUTO_7]]"Win_Loading", --[[!AUTO_8]]"Txt_Tip", string.format(LOADING_TIP_STYLE, LOADING_INGAME_TIP[ran3].color, LOADING_INGAME_TIP[ran3].string))
		--DlgApi.SetImageFile("Win_Loading", "Img_Loading", string.format(LOADING_IMG_STYLE_SPECIAL, mapfile), 1)
	end
end

function LoadingUI:OnEventLoadingSetProgress(event, progress)

    local imgpathnow

	--现在是按图片播，如果可能尽可能改成按帧数播，效率更高
    if progress < perstart then
        seqnow = math.floor(progress / perstart * numstart) + 1
        imgpathnow = ANISEQSTART[seqnow]
    elseif progress < perstart + peract then
    	seqnow = math.floor((progress - perstart) / peract * numact) + 1
    	imgpathnow = ANISEQACT[seqnow]
    else
        seqnow =  math.floor((progress - perstart - peract) / perend * numend) + 1
    	imgpathnow = ANISEQEND[seqnow]
    end

	--调用DlgApi的地方（设置图片位置等）：
	--因为当前UIMan不一定是LoadingUIMan，脚本里调用会有问题，均改到程序里了

	--local str = string.format("- SetPos: %d %d\n", imgxnow, imgynow)
	--LogPrint(str)
	--DlgApi.SetImageFile ("Win_Loading", "Img_wujian", imgpathnow, 1)
	--DlgApi.SelectImageFrame ("Win_Loading", "Img_wujian", 1)
end
