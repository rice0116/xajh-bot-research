local DlgTemplate = DlgTemplate or {new = function () return {} end}
local DlgApi  = DlgApi
local pairs = pairs
local assert = assert
local type = type

Win_QuestStorage1 = DlgTemplate:new({this = "Win_QuestStorage1"})

do
	local Class = Win_QuestStorage1
	local Name = "Win_QuestStorage1"

	function Class:GetExtraAwardTask (taskSetId, totalFinishCount)
		if totalFinishCount < 3 then		--第1轮
			return 5863
		elseif totalFinishCount < 6 then	--第2轮
			return 5864
		elseif totalFinishCount < 9 then
			return 5865
		elseif totalFinishCount < 12 then
			return 5866
		elseif totalFinishCount < 15 then
			return 5867
		else		--第5轮后无额外奖励
			return 0
		end
	end
end
