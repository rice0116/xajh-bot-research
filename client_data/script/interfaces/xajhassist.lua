--[[#tag push auto]]

local DlgTemplate = DlgTemplate or {new = function () return {} end}
local DlgApi  = DlgApi
local pairs = pairs
local assert = assert
local type = type

-- URL配置, [标签号] = url (注意与标签显示顺序不一定相同)
local UrlConfig =
{
	--[[!AUTO_1]]"",		--被卡住了
	--[[!AUTO_2]]"http://sssonline.iwplay.com.tw/ingame/report.html",		--举报平台
	--[[!AUTO_3]]"http://sssonline.iwplay.com.tw/ingame/online.html",		--江湖活动
	--[[!AUTO_4]]"http://sssonline.iwplay.com.tw/ingame/wiki.html",		--江湖宝典
	--[[!AUTO_5]]"http://sssonline.iwplay.com.tw/ingame/bbs.html",		--游戏社区
	--[[!AUTO_6]]"http://sssonline.iwplay.com.tw/ingame/vip.html",		--服务中心
	--[[!AUTO_7]]"http://xa.wanmei.com/clientsite/survey.htm",		--问卷调查
}

Win_XAJHAssist = DlgTemplate:new({this = --[[!AUTO_8]]"Win_XAJHAssist"})

do
	local Class = Win_XAJHAssist
	local Name = --[[!AUTO_9]]"Win_XAJHAssist"

	function Class:GetUrl (which)
		return UrlConfig[which]
	end
end
