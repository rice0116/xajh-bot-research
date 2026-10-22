--个人摇摇乐收费标准
local PersonalLotteryCost =
{
	--配置中的count为一个收费阶段的下限，最后一个表示之后的无限个都是那么多
	--count=11， cost=10表示从11开始收费10元宝 
	{count = 1, cost = 10},
	{count = 2, cost = 40},
	{count = 3, cost = 80},
	{count = 4, cost = 120},
	{count = 5, cost = 150},
}

PersonalLottery = PersonalLottery or {}

function PersonalLottery:GetCost(count)
	local currentCost = 0
	for i=1, #PersonalLotteryCost do
		local oneConfig = PersonalLotteryCost[i]
		
		if oneConfig.count > count then
			break
		end
		
		currentCost = oneConfig.cost
	end

	return currentCost
end

--~ print(PersonalLottery:GetCost(0))	--> 0
--~ print(PersonalLottery:GetCost(1))	--> 10
--~ print(PersonalLottery:GetCost(18))	--> 40
--~ print(PersonalLottery:GetCost(19))	--> 50
--~ print(PersonalLottery:GetCost(20))	--> 50
--~ print(PersonalLottery:GetCost(120))	--> 50

local PersonalLotteryResultDesc =
{
	[0] = "风平浪静",
	[1] = "柳暗花明",
	[2] = "时来运转",
	[3] = "顺水行舟",
	[4] = "势如破竹",
	[5] = "吉祥如意",
	[6] = "大吉大利",
}

function PersonalLottery:GetResultDesc (winCount)
	return PersonalLotteryResultDesc[winCount]
end

--~ print(PersonalLottery:GetResultDesc(0))		-->win 0
--~ print(PersonalLottery:GetResultDesc(6))		-->win 6
