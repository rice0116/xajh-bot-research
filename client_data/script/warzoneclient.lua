WarZone = {}

WarZone.OpenOffset = {

	[1]	= 0,
	[2]	= 10,
	[3]	= 0,
	[4]	= 0,
	[5] = 0,
	[6] = 0,
	[7] = 0,
	
}

function WarZone:GetWarZoneOpenOffset(war_zone_id)
	if WarZone.OpenOffset[war_zone_id] then
		return WarZone.OpenOffset[war_zone_id]
	end
	return 0
end

WarZone.Name = {

	[1] = "WUGAME",
	[2] = "WUGAME2",
	[3] = "燕台笳鼓",
	[4] = "萧关逢骑",
	[5] = "吹角连营",
	[6] = "大漠孤烟",
	[7] = "研发专用",
	[8] = "天下之争",
	
}

function WarZone:GetWarZoneName(war_zone_id)
	if WarZone.Name[war_zone_id] then
		return WarZone.Name[war_zone_id]
	end
	return "0"
end