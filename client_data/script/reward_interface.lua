
function Reward_Init(reward,creature_ptr)
	reward.Creature			= creature_ptr
	reward.GetPlayerLevel		= __REWARD_GetPlayerLevel
	--镖车途径城市数
	reward.GetEscortPathLength	= __REWARD_GetEscortCityCount
	--帮派参数
	reward.GetFactionParam		= __REWARD_GetEscortFactionParam
	--镖车货物品质
	reward.GetEscortGoodsQuality	= __REWARD_GetEscortGoodsQuality
end


--获取奖励倍率的通用入口
--预留了四个int型参数，尽量不要使用这几个参数，需要什么属性尽量用Get函数去取
function Get_Reward_Ratio_Entrance(player_ptr,reward_type,param1,param2,param3,param4)
	local reward = {}
	Reward_Init(reward,player_ptr)
	return Get_Reward_Ratio(reward,reward_type,param1,param2,param3,param4)
end


---------------------------------------------------

function Get_Reward_Ratio(reward,reward_type,param1,param2,param3,param4)
	--策划需要实现的接口	
	print("策划必须实现的接口 Get_Reward_Ratio(reward,reward_type,param1,param2,param3,param4)")
	return 1,1,1 --总数，第一个倍率重复次数，第一个倍率
end

OnlineReward = {}
LevelUpReward = {}
EscortEvent = {}
EscortEvent.Events = {}
EscortEvent.Config = {}
EscortMeet = {}
PartTimeEscort = {}
SkillReward = {}
AchieveReward = {}
NationEscortReward = {}
KillAllReward = {}
CommonEscortCfg = {}
DailyEscortCfg = {}

--帮派大镖
CommonEscortCfg[1] = {}
CommonEscortCfg[1].tid = 100281		--镖车模版
CommonEscortCfg[1].path_scenes = {81, 79, 75}

--帮派个人镖
DailyEscortCfg.tid = 100280		--镖车模版
DailyEscortCfg.path_scenes = {75, 67}	--场景
DailyEscortCfg.double_reward_time ={14, 15, 18, 19} --双倍时间{{开始，结束}， {开始，结束}..}
DailyEscortCfg.reward_tids = {10903,10905,10904,10906,10907,10908} --{完好的镖货， 被劫的镖货， 完好的贵重镖货， 被劫的贵重镖货，劫取的镖货， 劫取的贵重镖货}
DailyEscortCfg.consume_item = 83846 --消耗道具
DailyEscortCfg.consume_item_num = 1 -- 消耗道具的数量
DailyEscortCfg.bind_tid = 86035 --帮派绑定模板id
DailyEscortCfg.escort_machine_life_time = 7200 --镖车生存时间
DailyEscortCfg.rob_daily_escort_use_limit_tid = 11006   --劫镖次数限制

-----------------------------------------------

--服务器接口

function GetEscortScenes(escort_type)
	return unpack(CommonEscortCfg[1].path_scenes)
end

function GetEscortTid(escort_type)
	return CommonEscortCfg[1].tid
end

function GetDailyEscortScenes()
	return unpack(DailyEscortCfg.path_scenes)
end

function GetDailyEscortTid()
	return DailyEscortCfg.tid
end

function GetDailyEscortDoubleRewardTime()
	return unpack(DailyEscortCfg.double_reward_time)
end

function GetDailyEscortRewardTids()
	return unpack(DailyEscortCfg.reward_tids)
end

function GetDailyEscortComsumeItemId()
	return DailyEscortCfg.consume_item
end

function GetDailyEscortComsumeItemNum()
	return DailyEscortCfg.consume_item_num
end

function GetDailyEscortBindTid()
	return DailyEscortCfg.bind_tid
end

function GetDailyEscortMachineLifeTime()
	return DailyEscortCfg.escort_machine_life_time
end

function GetDailyEscortRobCountLimitTid()
    return DailyEscortCfg.rob_daily_escort_use_limit_tid
end

function GetEscortEvent(event,count)
	math.randomseed(os.time())
	if count < event.max_times and math.random() < event.odds then
		--在list里选一个id，注意归一化
		local total_prob = 0
		for i = 1,#event.list do
			total_prob = total_prob + event.list[i].prob
		end
		if total_prob == 0 then
			return 0
		end
		local rand = math.random() * total_prob
		for i = 1,#event.list do
			if rand <= event.list[i].prob then
				return event.list[i].id
			else
				rand = rand - event.list[i].prob
			end
		end
	end
	return 0
end

--type(0:trap,1:adventure),tid
--决定触发陷阱或奇遇id
function GetEscortPathEvent(escort_machine,trap_count,adv_count)
	--print("escort_machine=",escort_machine,",trap_count=",trap_count,",adv_count=",adv_count)
	local conf_index =  EscortEvent.Config[escort_machine]
	if conf_index == nil or EscortEvent.Events[conf_index] == nil then
		return 0,0
	end
	local conf = EscortEvent.Events[conf_index]
	--优先触发陷阱
	local trap_id = GetEscortEvent(conf.trap,trap_count)
	--print("trap_id=",trap_id)
	if trap_id > 0 then
		return 0,trap_id
	end
	local adv_id = GetEscortEvent(conf.adventure,adv_count)
	--print("adv_id=",adv_id)
	return 1,adv_id
end

function GetEscortStationEvent(escort_machine,poison_count)
	local conf_index =  EscortEvent.Config[escort_machine]
	if conf_index == nil or EscortEvent.Events[conf_index] == nil then
		return 0
	end
	return GetEscortEvent(EscortEvent.Events[conf_index].poison,poison_count)
end

--result,player_speak,npc_speak,npc_delay,machine_delay
function GetEscortMeetConfig(config_id)
	local conf = EscortMeet[config_id]
	if conf == nil then return 0 end
	math.randomseed(os.time());math.random();math.random()
	local npc_speak,machine_delay,result
	local npc_speak_delay = conf.delay[1]
	if math.random(1,100) < 100 * conf.prob then
		npc_speak = conf.speak[2]
		machine_delay = conf.delay[2]
		result = 1
	else
		npc_speak = conf.speak[3]
		machine_delay = npc_speak_delay --npc回话的同时开打
		result = 0
	end
	return result,conf.speak[1],npc_speak,npc_speak_delay,machine_delay
end

--src,dst,tid
function GetPartTimeEscortConfig(is_rob)
	local index = 0
	if is_rob then index = 1 end
	local conf =  PartTimeEscort[index]
	if conf == nil then return 0 end
	if conf[3] == nil or #conf[3] < 1 then return 0 end
	local tid_index = math.random(1, #conf[3])
	return conf[1],conf[2],conf[3][tid_index]
end

--reward_num, {time, level_num, {level, reward}}
function GetOnlineRewardConfig()
	local reward_num = #OnlineReward
	local activity = 0
	if OnlineRewardActivity ~= nil then
		activity = OnlineRewardActivity
	end
	local ret_tbl = {}
	for i = 1,reward_num do
		local conf = OnlineReward[i]
		if conf == nil then
			print("OnlineReward[",i,"] not exist")
			return 0
		end
		ret_tbl[#ret_tbl + 1] = conf.time
		ret_tbl[#ret_tbl + 1] = #conf.reward
		for j = 1,#conf.reward do
			ret_tbl[#ret_tbl + 1] = conf.reward[j].level
			ret_tbl[#ret_tbl + 1] = conf.reward[j].reward_id
		end
	end
	ret_tbl[#ret_tbl + 1] = activity
	return reward_num, unpack(ret_tbl)
end

function GetLevelUpReward(new_level)
	if LevelUpReward[new_level] == nil then	return 0 end
	return LevelUpReward[new_level]
end

function GetSkillRewardConfig(config_id)
	local conf = SkillReward[config_id]
	if conf == nil then return 0 end
	math.randomseed(os.time());math.random();math.random()
	local money =  math.random(conf[2],conf[3])
	return conf[1],money,conf[4]
end

--reward_num, { index, reward_tid }
function GetFreshmanRewardConfig()
	local reward_num = #FreshmanReward
	local ret_tbl = {}
	for k,v in pairs(FreshmanReward) do
		ret_tbl[#ret_tbl + 1] = v.index
		ret_tbl[#ret_tbl + 1] = v.reward_tid
	end
	return reward_num, unpack(ret_tbl)
end

function GetAchieveReward(achieve_tid)
	if AchieveReward[achieve_tid] == nil then
		return 0
	end

	return AchieveReward[achieve_tid].activity_id , AchieveReward[achieve_tid].limit_id, AchieveReward[achieve_tid].reward_id
end

function GetNationEscortReward(npc_tid, is_high, is_rob)
	local v = NationEscortReward[npc_tid]
	if v ~= nil then
		if is_rob then
			return v[3]
		elseif is_high then
			return v[1]
		else
			return v[2]
		end
	end
	return 0
end

function GetNationEscortRobRepu(npc_tid)
	local v = NationEscortReward[npc_tid]
	if v ~= nil then
		return v[4]
	end
	return 0
end

function GetKillAllRewardConfig()
	local reward_num = #KillAllReward
	local ret_tbl = {}
	for k,v in pairs(KillAllReward) do
		ret_tbl[#ret_tbl + 1] = v.rank
		ret_tbl[#ret_tbl + 1] = v.reward_tid
	end
	return reward_num, unpack(ret_tbl)
end

xdofile("config/script/reward_data.lua")
