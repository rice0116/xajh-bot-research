--[[#tag push auto]]

local DlgTemplate = DlgTemplate or {new = function () return {} end}
local DlgApi  = DlgApi

local PLUN = function (v) return v or true end
--~ local PLUN = loadfile "test/plun.lua" "script/interfaces/producefortune.lua"		-- 仅用于调试，调试完毕注释此行

local Win_ProduceFortune = DlgTemplate:new({this = --[[!AUTO_1]]"Win_ProduceFortune"})

do
	local Class = Win_ProduceFortune
	local Name = --[[!AUTO_2]]"Win_ProduceFortune"

	function Class:Init ()
	end

	function Class:ShowDialog ()
		local productivityData = Production:CalcRandomProductivity()
		local luckData = Production:CalcRandomLuck()

		-- 时辰
		DlgApi.SetItemText(Name, --[[!AUTO_3]]"Txt_Time", Production:GetTimeDescription())

		-- 星级
		for iProd=1, 5 do
			DlgApi.SelectImageFrame(Name, --[[!AUTO_4]]"Img_ProduceNum"..iProd, iProd <= productivityData.level and 1 or 0)
		end
		for iLuck=1, 5 do
			DlgApi.SelectImageFrame(Name, --[[!AUTO_5]]"Img_LuckNum"..iLuck, iLuck <= luckData.level and 1 or 0)
		end

		-- 简要描述
		DlgApi.SetItemText(Name, --[[!AUTO_6]]"Txt_ProduceNum", productivityData.name)
		DlgApi.SetItemText(Name, --[[!AUTO_7]]"Txt_LuckNum", luckData.name)

		-- 详细描述
		DlgApi.SetItemText(Name, --[[!AUTO_8]]"Txt_Desc", (--[[!AUTO_9]]"%s\r%s"):format(productivityData.description, luckData.description))
	end
end

_G.Win_ProduceFortune = PLUN(Win_ProduceFortune, --[[!AUTO_10]]"Win_ProduceFortune")
