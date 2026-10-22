--[[#tag push auto]]

local DlgTemplate = DlgTemplate or {new = function () return {} end}
local DlgApi  = DlgApi

Win_TaskPublishList = DlgTemplate:new()

do
	local Class = Win_TaskPublishList

	function Class:get_deposit_money ()
		return 100
	end
end
