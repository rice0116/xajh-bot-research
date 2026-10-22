--[[#tag push auto]]

local DlgTemplate = DlgTemplate or {new = function () return {} end}
local DlgApi  = DlgApi
local pairs = pairs
local assert = assert
local type = type

local function TEXT (text) return text end	--标记文本

-- 通用奖励类型配置
local RewardConfig =
{
	-- {type = 奖励类型ID, typeName = 奖励类型名称}, 排列顺序对应界面显示顺序
	-- 奖励类型ID 见 奖励发放模版 中的 所属功能
	{type = 8, typeName = TEXT--[[!AUTO_1]]"幫派紅利"},
	{type = 1, typeName = TEXT--[[!AUTO_2]]"幫派運鏢獎勵"},
	{type = 2, typeName = TEXT--[[!AUTO_3]]"幫派劫鏢獎勵"},
	{type = 3, typeName = TEXT--[[!AUTO_4]]"幫派打工獎勵"},
	{type = 4, typeName = TEXT--[[!AUTO_5]]"幫派活動獎勵"},
	{type = 5, typeName = TEXT--[[!AUTO_6]]"線上獎勵"},
	{type = 6, typeName = TEXT--[[!AUTO_7]]"升級獎勵"},
	{type = 7, typeName = TEXT--[[!AUTO_8]]"明星禮包"},
	{type = 9, typeName = TEXT--[[!AUTO_9]]"答題獎勵"},
	{type = 10, typeName = TEXT--[[!AUTO_10]]"禮包獎勵"},
	{type = 18, typeName = TEXT--[[!AUTO_18]]"英俠禮包"},
	{type = 0, typeName = TEXT--[[!AUTO_11]]"領取獎勵"},
}

Win_PayCheck = DlgTemplate:new({this = --[[!AUTO_12]]"Win_PayCheck"})

do
	local Class = Win_PayCheck
	local Name = --[[!AUTO_13]]"Win_PayCheck"

	function Class:GetAllRewardConfig ()
		return RewardConfig
	end
end
