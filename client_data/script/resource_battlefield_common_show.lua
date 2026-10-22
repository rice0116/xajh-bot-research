ResourceBattleFieldCommonShow = {}

CommonShowHead = 
{
	[0] = 83890,		-- 男性
	[1] = 83891,		-- 女性
}

CommonShowWeapon = 
{
	[0] = 26136,		-- 新手
	[1] = 83800,		-- 少林
	[2] = 83818,		-- 武当
	[3] = 83788,		-- 华山
	[4] = 83776,		-- 恒山
	[5] = 83782,		-- 衡山
	[6] = 83794,		-- 日月
	[7] = 83812,		-- 武仙
	[8] = 83824,		-- 逍遥
	[9] = 83806,		-- 唐门
	[10] = 83770,		-- 峨眉
	[11] = 88563,		-- 独孤
}

CommonShowCloth = 
{
	[0] = 87989,		-- 男性
	[1] = 87990,		-- 女性
}

CommonShowClothNotFashion = 
{
	[0] = 95914,			-- 男性
	[1] = 95915,			-- 女性
}

function ResourceBattleFieldCommonShow:GetShowWeapon( prof )
	return CommonShowWeapon[prof]
end

function ResourceBattleFieldCommonShow:GetShowCloth( gender, inFashion )
	-- body
	if inFashion == 1 then
		return CommonShowCloth[gender]
	else
		return CommonShowClothNotFashion[gender]
	end
end

function ResourceBattleFieldCommonShow:GetShowHead( gender )
	-- body
	return CommonShowHead[gender]
end

function ResourceBattleFieldCommonShow:GetShowName( ... )
	-- body
	return "神秘人"
end