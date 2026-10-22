BaldricAction = 
{
	-- condtype == 0，表示顺序播放动作
	-- condtype == 1，表示随机播放动作
	-- time 单位/秒
--测试道具
	[4458] = 
	{
		condtype = 0,
		act = 
		{
			{name = "休闲动作1", time = 4,},
			{name = "休闲动作2", time = 3,},
			{name = "休闲动作3", time = 5,},
		},
	},

--蝴蝶背饰
	[94044] = 
	{
		condtype = 0,
		act = 
		{
			{name = "站立", time = 10,},
		},
	},

--风车男
	[96640] = 
	{
		condtype = 0,
		act = 
		{
			{name = "站立", time = 10,},
		},
	},

--风车女
	[96641] = 
	{
		condtype = 0,
		act = 
		{
			{name = "站立", time = 10,},
		},
	},

--玉镜男
	[98590] = 
	{
		condtype = 0,
		act = 
		{
			{name = "站立", time = 10,},
		},
	},

--玉镜女
	[98591] = 
	{
		condtype = 0,
		act = 
		{
			{name = "站立", time = 10,},
		},
	},

--狐尾男
	[96789] = 
	{
		condtype = 0,
		act = 
		{
			{name = "休闲动作2", time = 16,},
			{name = "休闲动作1", time = 16,},
			{name = "休闲动作3", time = 16,},
		},
	},

--狐尾女
	[96790] = 
	{
		condtype = 0,
		act = 
		{
			{name = "休闲动作2", time = 16,},
			{name = "休闲动作1", time = 16,},
			{name = "休闲动作3", time = 16,},
		},
	},

--订制蝶舞女
	[97774] = 
	{
		condtype = 0,
		act = 
		{
			{name = "站立", time = 210,},

		},
	},

--欢乐匣子男
	[93739] = 
	{
		condtype = 0,
		act = 
		{
			{name = "休闲动作2", time = 16,},
			{name = "休闲动作1", time = 16,},
			{name = "休闲动作3", time = 16,},
		},
	},

--欢乐匣子女
	[93740] = 
	{
		condtype = 0,
		act = 
		{
			{name = "休闲动作2", time = 16,},
			{name = "休闲动作1", time = 16,},
			{name = "休闲动作3", time = 16,},
		},
	}
}


-- return act.name act.time, actIndex
function BaldricAction:GetActInfo( id, actIndex )
	-- body
	local rst_actname
	local rst_acttime
	local rst_actindex
	for k,v in pairs(BaldricAction) do
		if k == id then
			if v.condtype == 0 then
				if table.getn( v.act ) > actIndex then
					rst_actindex = actIndex + 1					
				else
					rst_actindex = 1
				end
				rst_actname = v.act[rst_actindex].name
				rst_acttime = v.act[rst_actindex].time
			elseif v.condtype == 1 then
				local index_temp = math.random( table.getn( v.act ) )
				rst_actindex = index_temp
				rst_actname = v.act[rst_actindex].name
				rst_acttime = v.act[rst_actindex].time
			end
		end
	end

	return rst_actname, rst_acttime, rst_actindex
end

function BaldricAction:GetActNameByIndex( id, actIndex )
	-- body
	for k,v in pairs(BaldricAction) do
		if k == id then
			return v.act[actIndex].name
		end
	end
end

function BaldricAction:HasBaldricAction( id )
	-- body
	for k,v in pairs(BaldricAction) do
		if k == id then
			return 1
		end
	end
end