--[[#tag push auto]]
AnimaEquipment = {}

--注灵消耗道具
AnimaEquipment.AnimaZhulingItem = {
	{20, 94029, 1},
	{50, 94031, 1},
	{80, 94032, 1},
	{160, 94034, 1},
	{240, 94036, 1},
	{280, 94036, 1},
}

-- 注灵概率
AnimaEquipment.AnimaZhulingProb = {
    {20,  100},
    {50,  90},
    {80,  80},
    {160, 70},
    {240, 60},
    {280, 40},
}

function AnimaEquipment:GetZhulingItemInfo(level)

	for i = 1, #AnimaEquipment.AnimaZhulingItem do
		if level < AnimaEquipment.AnimaZhulingItem[i][1] then
			return AnimaEquipment.AnimaZhulingItem[i][2],  AnimaEquipment.AnimaZhulingItem[i][3]
		end
	end

	return 0, 0

end

function AnimaEquipment:GetZhulingProb(level)

	for i = 1, #AnimaEquipment.AnimaZhulingProb do
		if level < AnimaEquipment.AnimaZhulingProb[i][1] then
			return AnimaEquipment.AnimaZhulingProb[i][2]
		end
	end

	return 0

end