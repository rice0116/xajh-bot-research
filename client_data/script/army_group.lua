ArmyGroup = {}

ArmyGroup.Info = {
	activity_index = 901,			--整个军团活动索引
	activity_id = 10799,			--整个军团活动ID
	join_activity_index = 902,		--报名加入活动索引
	join_activity_id = 10910,		--报名加入活动ID
	join_level = 70,			    --参加等级
	select_faction_level = 1,		--帮派报名军团等级限制
	vote_activity_index = 903,		--选举活动索引
	vote_activity_id = 10911,		--选举活动ID
	finish_rank_index = 904,		--最后排名活动索引
	finish_rank_id = 10912,			--最后排名活动ID
	receive_rank_index = 905,		--最后领取活动索引
	receive_rank_id = 10913,		--最后领取活动ID
	win_score = 2,					--胜利分数
	lose_score = 0,					--战败分数
	draw_score = 1,					--平分数
}
ArmyGroup.Name = {
	[1] = "青龙",					--军团名字
	[2] = "白虎",
	[3] = "朱雀",
	[4] = "玄武",
--	[5] = "英招",
--	[6] = "赤炎",
--	[7] = "乘黄",
--	[8] = "长右",
}
ArmyGroup.ZoneInfo = {
	[1] = {2304, 2305, 2308, 2320, 20486, 20665, 20664, 20662, 20629, 20582, 20660, 20658, 20657, 20494, 20653, 20638, 20650, 20666, 20489, 20667},			--军团对应支持的服务器
	[2] = {2304, 2305, 2308, 20486, 20665, 20664, 20662, 20629, 20582, 20660, 20658, 20657, 20494, 20653, 20638, 20650, 20666, 20489, 20667},
	[3] = {2304, 2305, 2308, 20486, 20665, 20664, 20662, 20629, 20582, 20660, 20658, 20657, 20494, 20653, 20638, 20650, 20666, 20489, 20667},
	[4] = {2304, 2305, 2308, 20486, 20665, 20664, 20662, 20629, 20582, 20660, 20658, 20657, 20494, 20653, 20638, 20650, 20666, 20489, 20667},
	--[5] = {2304, 2305, 20486, 20665, 20664, 20662, 20629, 20582, 20660, 20658, 20657, 20494, 20653, 20638, 20650, 20666, 20489, 20667},
	--[6] = {2304, 2305, 20486, 20665, 20664, 20662, 20629, 20582, 20660, 20658, 20657, 20494, 20653, 20638, 20650, 20666, 20489, 20667},
	--[7] = {2304, 2305, 20486, 20665, 20664, 20662, 20629, 20582, 20660, 20658, 20657, 20494, 20653, 20638, 20650, 20666, 20489, 20667},
	--[8] = {2304, 2305, 20486, 20665, 20664, 20662, 20629, 20582, 20660, 20658, 20657, 20494, 20653, 20638, 20650, 20666, 20489, 20667},
}
ArmyGroup.VoteInfo = {
	candidate_item_tid = 91154,		--参选需要物品
	candidate_item_count = 25,		--参选需要物品数量
	vote_vip_level = 2,				--投票需要vip等级
}
ArmyGroup.SceneInfo = {
	scene_tid = 1675,			--军团驻地场景
	pos = {-154.361,323.113,211.18},		--进入军团驻地坐标
	pos_radius = 5.0,			--进入军团驻地坐标偏移范围
}
ArmyGroup.MeleeInfo = {
	activity_index = 884,		--活动索引
	melee_tid = 10766,			--军团站副本tid
	scene_id = 155,				--军团战场景ID
}
ArmyGroup.MeleeMatch = {
	{
		begin_time = {year=2018, month=6, day=2, hour=18, min=0, sec=0},
		army_group = {{1,2},{3,4}},
		show_time_begin = {year=2018, month=5, day=28, hour=18, min=0, sec=0},
		show_time_end = {year=2018, month=6, day=15, hour=18, min=0, sec=0},
	},
	{
		begin_time = {year=2018, month=6, day=3, hour=18, min=0, sec=0},
		army_group = {{1,3},{2,4}},
		show_time_begin = {year=2018, month=5, day=28, hour=18, min=0, sec=0},
		show_time_end = {year=2018, month=6, day=15, hour=18, min=0, sec=0},
	},
	{
		begin_time = {year=2018, month=6, day=9, hour=18, min=0, sec=0},
		army_group = {{1,4},{2,3}},
		show_time_begin = {year=2018, month=5, day=28, hour=18, min=0, sec=0},
		show_time_end = {year=2018, month=6, day=15, hour=18, min=0, sec=0},
	},
	
}

ArmyGroup.Reward = {
	{
		rank = 1,
		leader_reward_tid = 0,		--军团长奖励模板
		member_reawrd_tid = 10870,		--个人奖励模板
		faction_reward_tid = 10871,		--分配给帮派的奖励模板tid
		faction_reward_count = 40000,	--分配给帮派的奖励数量
	};
	{
		rank = 2,
		leader_reward_tid = 0,
		member_reawrd_tid = 10966,
		faction_reward_tid = 10871,
		faction_reward_count = 24000,
	};
	{
		rank = 3,
		leader_reward_tid = 0,
		member_reawrd_tid = 10967,
		faction_reward_tid = 10871,
		faction_reward_count = 16000,
	};
	{
		rank = 4,
		leader_reward_tid = 0,
		member_reawrd_tid = 10968,
		faction_reward_tid = 10871,
		faction_reward_count = 2000,
	};


}

function ArmyGroup:GetInfo()
	local ret_table = {}
	ret_table[#ret_table + 1] = self.Info.activity_index
	ret_table[#ret_table + 1] = self.Info.join_activity_index
	ret_table[#ret_table + 1] = self.Info.join_level
	ret_table[#ret_table + 1] = self.Info.select_faction_level
	ret_table[#ret_table + 1] = self.Info.vote_activity_index
	ret_table[#ret_table + 1] = self.Info.finish_rank_index
	ret_table[#ret_table + 1] = self.Info.receive_rank_index
	ret_table[#ret_table + 1] = self.Info.win_score
	ret_table[#ret_table + 1] = self.Info.lose_score
	ret_table[#ret_table + 1] = self.Info.draw_score
	return unpack(ret_table)
end
function ArmyGroup:GetZoneInfo()
	local ret_table = {}
	ret_table[1] = #self.ZoneInfo
	for k, v in pairs (self.ZoneInfo) do
		ret_table[#ret_table + 1] = k
		ret_table[#ret_table + 1] = #v
		for zk, zv in pairs (v) do
			ret_table[#ret_table + 1] = zv
		end
	end
	return unpack(ret_table)
end
function ArmyGroup:GetVoteInfo()
	local ret_table = {}
	ret_table[#ret_table + 1] = self.VoteInfo.candidate_item_tid
	ret_table[#ret_table + 1] = self.VoteInfo.candidate_item_count
	ret_table[#ret_table + 1] = self.VoteInfo.vote_vip_level
	return unpack(ret_table)
end
function ArmyGroup:GetSceneInfo()
	local ret_table = {}
	ret_table[#ret_table + 1] = self.SceneInfo.scene_tid
	ret_table[#ret_table + 1] = self.SceneInfo.pos[1]
	ret_table[#ret_table + 1] = self.SceneInfo.pos[2]
	ret_table[#ret_table + 1] = self.SceneInfo.pos[3]
	ret_table[#ret_table + 1] = self.SceneInfo.pos_radius
	return unpack(ret_table)
end
function ArmyGroup:GetMeleeInfo()
	local ret_table = {}
	ret_table[#ret_table + 1] = self.MeleeInfo.activity_index
	ret_table[#ret_table + 1] = self.MeleeInfo.melee_tid
	return unpack(ret_table)
end
function ArmyGroup:GetMeleeMatch()
	local ret_table = {}
	ret_table[1] = #self.MeleeMatch
	for k, v in pairs (self.MeleeMatch) do
		ret_table[#ret_table + 1] = os.time(v.begin_time)
		ret_table[#ret_table + 1] = #(v.army_group)
		for ak, av in pairs (v.army_group) do
			ret_table[#ret_table + 1] = av[1] 
			ret_table[#ret_table + 1] = av[2] 
		end
	end
	return unpack(ret_table)
end

function ArmyGroup:GetMeleeMatchShow()
	local ret_table = {}
	ret_table[1] = #self.MeleeMatch
	for k, v in pairs (self.MeleeMatch) do
		ret_table[#ret_table + 1] = os.time(v.begin_time)
		ret_table[#ret_table + 1] = os.time(v.show_time_begin)
		ret_table[#ret_table + 1] = os.time(v.show_time_end)
		ret_table[#ret_table + 1] = #(v.army_group)
		for ak, av in pairs (v.army_group) do
			ret_table[#ret_table + 1] = av[1] 
			ret_table[#ret_table + 1] = av[2] 
		end
	end
	return unpack(ret_table)
end

function ArmyGroup:GetReward()
	local ret_table = {}
	ret_table[1] = #self.Reward
	for k, v in pairs (self.Reward) do
		ret_table[#ret_table + 1] = v.rank
		ret_table[#ret_table + 1] = v.leader_reward_tid
		ret_table[#ret_table + 1] = v.member_reawrd_tid
		ret_table[#ret_table + 1] = v.faction_reward_tid
		ret_table[#ret_table + 1] = v.faction_reward_count
	end
	return unpack(ret_table)
end

function ArmyGroup:GetRewardCount( rank )
	-- body
	for k,v in pairs(self.Reward) do
		if v.rank == rank then
			return v.faction_reward_count
		end
	end

	return 1
end

function ArmyGroup:GetArmyGroupCount()
	return #ArmyGroup.Name
end

function ArmyGroup:GetArmyGroupName( id )
	-- body
	return ArmyGroup.Name[id]
end

function ArmyGroup:GetInstanceId( ... )
	-- body
	return ArmyGroup.MeleeInfo.melee_tid
end


function ArmyGroup:GetSceneId( ... )
	-- body
	return ArmyGroup.MeleeInfo.scene_id
end

function ArmyGroup:GetStationSceneId( ... )
	-- body
	return ArmyGroup.SceneInfo.scene_tid
end

function ArmyGroup:GetActivityId( )
	-- body
	local ret_table = {}
	ret_table[#ret_table + 1] = ArmyGroup.Info.activity_id
	ret_table[#ret_table + 1] = ArmyGroup.Info.join_activity_id
	ret_table[#ret_table + 1] = ArmyGroup.Info.vote_activity_id
	ret_table[#ret_table + 1] = ArmyGroup.Info.finish_rank_id
	ret_table[#ret_table + 1] = ArmyGroup.Info.receive_rank_id

	return unpack(ret_table)
end

function ArmyGroup:GetJoinLevel()
	return ArmyGroup.Info.join_level
end