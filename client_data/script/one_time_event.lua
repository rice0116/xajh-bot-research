local LuckGrab=
{
	{
		--一次性活动id
		["event_id"] = 1,
		["avtivity_index"] = 860,
		--区id， 最小值， 最大值， 可领取人数， 奖励类型， 奖励模板id
		[0] = {200, 800, 3, 14, 10743},
	},
}
function GetLuckGrabInfo(zoneid)
	local ret = {};
	for k,v in pairs(LuckGrab) do
		local zoneinfo = v[zoneid];
		if zoneinfo == nil then
			zoneinfo = v[0]
		end
		if zoneinfo ~= nil then
			table.insert(ret,v["avtivity_index"])
			table.insert(ret,v["event_id"])
			for k,v in pairs(zoneinfo) do
				table.insert(ret,v)
			end
		end
	end
	return unpack(ret);
end
