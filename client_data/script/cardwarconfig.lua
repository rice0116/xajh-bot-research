CardWarConfig = {}

CardWarConfig.InstancePro = {}
CardWarConfig.InstancePro[1615] = 
{
	[1] = {10},
	[2] = {0,0,0,1,0,1,0,1,0,1},
}

CardWarConfig.IgnorePosCheckSkill = {}
CardWarConfig.IgnorePosCheckSkill = 
{
	10986,
}

function CardWarConfig:CardWarInstanceBoardInfo( idSence, idBoard )
	
	local tempInfo = CardWarConfig.InstancePro[idSence]
	if tempInfo ~= nil then
		local boardInfo = tempInfo[2][idBoard]
		if boardInfo ~= nil then
			return boardInfo
		end
	end
end

function CardWarConfig:CardWarInstanceBoardCount( idSence )
	
	local tempInfo = CardWarConfig.InstancePro[idSence]
	if tempInfo ~= nil then
		local boardCount = tempInfo[1]
		if boardCount ~= nil then
			return boardCount[1]
		end
	end
end

function CardWarConfig:CardWarSkillIgnorePosCheckFilter( idSkill )
	
	if idSkill ~= nil then
		for i=1,#CardWarConfig.IgnorePosCheckSkill do
			if idSkill == CardWarConfig.IgnorePosCheckSkill[i] then
				return true
			end
		end
	end

	return false
end