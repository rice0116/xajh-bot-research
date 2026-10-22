--[[#tag push auto]]


--[[
	处理界面文本中的链接
	1 将通配符文本转换成链接
	2 处理链接点击事件
]]

TextLink = {}


----------------------------------------
--
-- 将通配符文本转换成链接
--
----------------------------------------

local function applyColorCodeFunc (colorCode)
	return function (text)
		return colorCode..text
	end
end

-- [1] 为正则表达式，[2] 为处理函数，函数参数为正则表达式的捕获
local WildcardType =
{
	{
		--[[!AUTO_1]]"#ItemID_(%d+)#",
		function (ID)
			local ItemName, iQuality = GameApi.GetItemInfo(tonumber(ID))
			local link = --[[!AUTO_2]]""
			link = GameApi.GenerateCustomLuaLink(ItemName, string.format(--[[!AUTO_3]]"%s%s", --[[!AUTO_4]]"ItemID_", ID), 0xffc000)
			return link
		end
	},
	{
		--[[!AUTO_5]]"#MonsterID_(%d+)#",
		function (ID)
			local _, MonsterName = DescUtility:GetItemDBProp(tonumber(ID), ClassType.ICID_MONSTER, --[[!AUTO_6]]"t_name")
			local link = --[[!AUTO_7]]""
			link = GameApi.GenerateCustomLuaLink(MonsterName, string.format(--[[!AUTO_8]]"%s%s", --[[!AUTO_9]]"MonsterID_", ID), 0xffc000)
			return link
		end
	},

	{
		--[[!AUTO_10]]"#SX_(X)#",
		function (text)
			local ret = GameApi.GetPlayerFullProp(0)
			local link = --[[!AUTO_11]]""
			if ret.gender == 0 then
				link = --[[!AUTO_12]]"^FDF46F少侠^FDF46F"
			else
				link = --[[!AUTO_13]]"^FDF46F女侠^FDF46F"
			end
			return link
		end
	},
	{
		--[[!AUTO_14]]"#(%d+:%d+)#",
		function (text)
			local list = {}
			local l = 1
			for v in string.gmatch(text,--[[!AUTO_15]]"%d+") do
				list[l] = {}
				list[l] = v
				l = l + 1
			end
			return GameApi.GenerateEmotionWords(tonumber(list[1]), tonumber(list[2]))
		end
	},
	{
		--[[!AUTO_16]]"#NpcID_(%d+)#",
		function (ID)
			local NpcName = ObjInfo[tonumber(ID)].name
			local link = --[[!AUTO_17]]""
			link = GameApi.GenerateCustomLuaLink(NpcName, string.format(--[[!AUTO_18]]"%s%s", --[[!AUTO_19]]"NpcID_", ID), 0x0059ab)
			return link
		end
	},

	-- 以下非链接，作用是改变部分文字颜色
	{
		--[[!AUTO_20]]"#Text_([^#]+)#",		--文字部分可加颜色代码，颜色作用范围不会超出指定文字
		function (text)
			return text
		end
	},

	{--[[!AUTO_21]]"#Q1_([^%s^#]+)#", applyColorCodeFunc--[[!AUTO_22]]"^a8a8a8"},
	{--[[!AUTO_23]]"#Q2_([^%s^#]+)#", applyColorCodeFunc--[[!AUTO_24]]"^72fe00"},
	{--[[!AUTO_25]]"#Q3_([^%s^#]+)#", applyColorCodeFunc--[[!AUTO_26]]"^0184ff"},
	{--[[!AUTO_27]]"#E_([^%s^#]+)#",  applyColorCodeFunc--[[!AUTO_28]]"^a800ff"},
	{--[[!AUTO_29]]"#M_([^%s^#]+)#",  applyColorCodeFunc--[[!AUTO_30]]"^ff7d2f"},
	{--[[!AUTO_31]]"#F_([^%s^#]+)#",  applyColorCodeFunc--[[!AUTO_32]]"^fff962"},
	{--[[!AUTO_33]]"#S_([^%s^#]+)#",  applyColorCodeFunc--[[!AUTO_34]]"^ffc556"},
	{--[[!AUTO_35]]"#V_([^%s^#]+)#",  applyColorCodeFunc--[[!AUTO_36]]"^ff0000"},

}

-- 返回 gsub 的 repl 函数，f 填写 WildcardType 中的处理函数，由于在结果后需加上默认颜色代码，所以需传 colorCode 为默认颜色代码
local function applyColorCodeRepFunc (f, colorCode)
	return function (capture)
		return f(capture)..colorCode
	end
end

--应用文本颜色 (可内含其他通配符)
local function ApplyColorFormat (Content, defaultColorCode)
	local pattern = "#Text%{([^}]+)%}"
	return string.gsub(Content, pattern, function (capture) return capture..defaultColorCode end)
end

--将通配符文本转换成链接。defaultColorCode 应为文本本身的颜色。如果链接不含颜色代码，则不必传这个参数
function TextLink:ParseText(Content, defaultColorCode)
	defaultColorCode = defaultColorCode or --[[!AUTO_37]]""
	Content = ApplyColorFormat(Content, defaultColorCode)

	for _, v in pairs(WildcardType) do		-- 循环替换字符串中所有的通配符
		local pattern = v[1]
		local func = v[2]
		Content = string.gsub(Content, pattern, applyColorCodeRepFunc(func, defaultColorCode))
	end

	return defaultColorCode..Content
end

----------------------------------------
--
-- 处理链接点击事件
--
----------------------------------------

local function encodeStr (str)
	local strBuffer = {}
	for i=1, #str do
		local ch = str:byte(i)
		strBuffer[#strBuffer+1] = (--[[!AUTO_38]]"%02x"):format(ch)
	end
	return table.concat(strBuffer)
end

local function decodeStr (enStr)
	if #enStr%2 ~= 0 then
		return nil
	end

	local strBuffer = {}
	for i=1, #enStr, 2 do
		local ch = tonumber(enStr:sub(i, i+1), 16)
		if ch == nil then
			return nil
		end

		strBuffer[#strBuffer+1] = string.char(ch)
	end
	return table.concat(strBuffer)
end

do
	local str = --[[!AUTO_39]]"[&83j&(*&"
	assert(decodeStr(encodeStr(str)) == str)
	assert(decodeStr(--[[!AUTO_40]]"g1") == nil)
	assert(decodeStr(--[[!AUTO_41]]"123") == nil)
end


local LinkType =
{
	ItemID = function(ID)
		HelpSystemApi.ShowHelpUI(--[[!AUTO_42]]"Help_ALLWords", 20, -250)
		Help_ALLWords:ShowItem(ID)
	end,

	MonsterID = function(ID)
		GameApi.ShowMonsterDesc(tonumber(ID))
	end,

	NpcID = function(ID)
		TaskHelp:GetNpcInfo(tonumber(ID))
	end,

	SpecialID = function(UIname)
		local list = {}
		list["Help_ChooseWay"] = {x = -1, y = -150}
		list["Help_ChooseMenPai"] = {x = -1, y = -1}
		HelpSystemApi.ShowHelpUI(list[UIname], list[UIname].x, list[UIname].y)
	end,

	Code = function (encodedCode)
		local codeStr = decodeStr(encodedCode)
		if codeStr then
			local f, err = loadstring(codeStr)
			if f then
				pcall(f)
			end
		end
	end,
}

--点击链接处理
function TextLink:OnClickCustomLuaLink(info)
	-- 找到第一个 '_' 符号
	local typeStr, param = info:match(--[[!AUTO_43]]"^([^_]+)_(.*)")
	if typeStr and LinkType[typeStr] then
		LinkType[typeStr](param)
	end
end

--生成物品链接. ID 为物品模板ID. color 可选
function TextLink:BuildItemLink(linkStr, ID, color)
	return GameApi.GenerateCustomLuaLink(linkStr, (--[[!AUTO_44]]"ItemID_%d"):format(ID), color or 0xffc000)
end

--生成物品链接. ID 为NPC模板ID. color 可选
function TextLink:BuildNpcLink(linkStr, ID, color)
	return GameApi.GenerateCustomLuaLink(linkStr, (--[[!AUTO_45]]"NpcID_%d"):format(ID), color or 0xffc000)
end

--生成链接打开帮助界面. color 可选
function TextLink:BuildShowHelpUILink(linkStr, HelpUIname, color)
	return GameApi.GenerateCustomLuaLink(linkStr, string.format(--[[!AUTO_46]]"%s%d", --[[!AUTO_47]]"SpecialID_", UIname), color or 0xffc000)
end

--生成链接执行一段代码. codeStr 为代码文本. color 可选
function TextLink:BuildCodeLink(linkStr, codeStr, color)
	return GameApi.GenerateCustomLuaLink(linkStr, string.format(--[[!AUTO_48]]"Code_%s", encodeStr(codeStr)), color or 0xffc000)
end

--生成链接打开一个对话框. dialogName 为对话框名. color 可选
function TextLink:BuildOpenDialogLink(linkStr, dialogName, color)
	return self:BuildCodeLink(linkStr, (--[[!AUTO_49]][[DlgApi.ShowDialog("%s", true)]]):format(dialogName), color or 0xffc000)
end


--点击超链接处理
function TextLink:OnClickLuaHyperLink(info)
	-- 找到第一个 '_' 符号
	local typeStr, codeStr = info:match(--[[!AUTO_43]]"^([^_]+)_(.*)")
	local strNew = decodeStr(codeStr)

	--LogPrint(codeStr)
	--LogPrint(strNew)

	return GameApi.GenerateLuaHyperLink( typeStr, strNew )

end


------------------------------------
-- test
------------------------------------

