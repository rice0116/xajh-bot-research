--[[#tag push auto]]


local DlgTemplate = DlgTemplate or {new = function () return {} end}
local DlgApi  = DlgApi
local pairs = pairs
local assert = assert
local type = type


Win_InstanceTurnover = DlgTemplate:new({this = --[[!AUTO_13]]"Win_InstanceTurnover"})

do
	local Class = Win_InstanceTurnover
	local Name = --[[!AUTO_14]]"Win_InstanceTurnover"
	
	local OpeLastTime = 15
	local CardBGMusicID = 100
	local BattleBGMusicID = {}  
	BattleBGMusicID[0] = 5    --翻牌背景音
	BattleBGMusicID[1] = 235		--第一轮战斗背景音
	BattleBGMusicID[2] = 235
	BattleBGMusicID[3] = 235
	BattleBGMusicID[4] = 249
	BattleBGMusicID[5] = 236
	
	local config =
	{
		{ icon_path = "XAJH\\桃谷\\副本翻牌男01.tga", },
		{ icon_path = "XAJH\\桃谷\\副本翻牌男02.tga", },
		{ icon_path = "XAJH\\桃谷\\副本翻牌男03.tga", },
		{ icon_path = "XAJH\\桃谷\\副本翻牌男04.tga", },
		{ icon_path = "XAJH\\桃谷\\副本翻牌男05.tga", },
		{ icon_path = "XAJH\\桃谷\\副本翻牌男06.tga", },
		{ icon_path = "XAJH\\桃谷\\副本翻牌男07.tga", },
		{ icon_path = "XAJH\\桃谷\\副本翻牌男08.tga", },
		{ icon_path = "XAJH\\桃谷\\副本翻牌男09.tga", },
		{ icon_path = "XAJH\\桃谷\\副本翻牌男10.tga", },
		{ icon_path = "XAJH\\桃谷\\副本翻牌女01.tga", },
		{ icon_path = "XAJH\\桃谷\\副本翻牌女02.tga", },
		{ icon_path = "XAJH\\桃谷\\副本翻牌女03.tga", },
		{ icon_path = "XAJH\\桃谷\\副本翻牌女04.tga", },
		{ icon_path = "XAJH\\桃谷\\副本翻牌女05.tga", },
		{ icon_path = "XAJH\\桃谷\\副本翻牌女06.tga", },
		{ icon_path = "XAJH\\桃谷\\副本翻牌女07.tga", },
		{ icon_path = "XAJH\\桃谷\\副本翻牌女08.tga", },
		{ icon_path = "XAJH\\桃谷\\副本翻牌女09.tga", },
		{ icon_path = "XAJH\\桃谷\\副本翻牌女10.tga", },
	}

	function Class:GetIconPath (which)
		return config[which].icon_path
	end
	
	function Class:GetBGMusicID (turn)
		return BattleBGMusicID[turn]
	end
	
	function Class:GetOpeLastTime ()
		return OpeLastTime
	end
end
