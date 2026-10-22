EscapeKill = {}

EscapeKill.ActivityInfo = {
	activity_index = 782,		--大逃杀活动索引id
	activity_tid = 10505,		--大逃杀活动tid
	wait_scene_tid = 1670,		--等待场景tid
	instance_tid = 10475,		--大逃杀副本tid
	enroll_time = 300,		--报名时间，正式为300
	base_player_num = 30,		--副本基准人数，正式为30
	player_min_level = 60,		--参加活动的最小等级
}

EscapeKill.InstInfo = {
	speed_buff_id = 1871,		--在空中飞行时不检测移动速度的buff
	falldown_speed = -6,		--飞行下降速度
	once_max_score = 60,		--杀人&采集溢出所得分数上限
	drop_range = 1,		--死亡散落矿物的范围系数
	kill_score = 10,		--杀人获得积分
	common_limit_tid = 10640,		--每周积分获得限制模版ID
	rank_score = {
		300,200,200,200,200,200,200,200,200,200,		--1~10名排名积分
		150,150,150,150,150,100,100,100,100,100,		--11~20名排名积分
		80,80,80,80,80,50,50,50,50,50,		--21~30名排名积分
		50,50,50,50,50,50,50,50,50,50,		--31~40名排名积分
		50,50,50,50,50,50,50,50,50,50,		--41~50名排名积分
		50,50,50,50,50,50,50,50,50,0,		--51~60名排名积分
	},
}

EscapeKill.EquipTid = {
	weapon = 1,		--武器tid
	armour = 2,		--防具tid
}

EscapeKill.InitInfo = {
	orgin_safe_x = 0,		--安全区初始X坐标
	orgin_safe_z = 0,		--安全区初始Z坐标
	orgin_safe_radius = 1000,		--初始安全区半径
	wait_seconds_after_jump = 30,		--副本开始后多少秒标识第一个圈
	max_distance_center = 300,		--安全区中心点离地图中地点最大距离
	recover_hp_percent = 2.0,		--安全区内脱战回血百分比
	recover_mp_percent = 2.0,		--安全区内脱战回蓝百分比
}

EscapeKill.RoundsInfo = {
		{
			wait_seconds = 120,		--通知后等待秒数（第1圈）
			radius = 500,		--半径
			damage_percent = .5,		--圈外伤害百分比（%）
			gas_shrink_seconds = 60,		--缩小用时（秒）
		},
		{
			wait_seconds = 80,		--通知后等待秒数（第2圈）
			radius = 320,		--半径
			damage_percent = .5,		--圈外伤害百分比（%）
			gas_shrink_seconds = 60,		--缩小用时（秒）
		},
		{
			wait_seconds = 80,		--通知后等待秒数（第3圈）
			radius = 160,		--半径
			damage_percent = 1,		--圈外伤害百分比（%）
			gas_shrink_seconds = 60,		--缩小用时（秒）
		},
		{
			wait_seconds = 80,		--通知后等待秒数（第4圈）
			radius = 80,		--半径
			damage_percent = 1.5,		--圈外伤害百分比（%）
			gas_shrink_seconds = 60,		--缩小用时（秒）
		},
		{
			wait_seconds = 80,		--通知后等待秒数（第5圈）
			radius = 40,		--半径
			damage_percent = 3,		--圈外伤害百分比（%）
			gas_shrink_seconds = 60,		--缩小用时（秒）
		},
		{
			wait_seconds = 80,		--通知后等待秒数（第6圈）
			radius = 20,		--半径
			damage_percent = 5,		--圈外伤害百分比（%）
			gas_shrink_seconds = 60,		--缩小用时（秒）
		},
		{
			wait_seconds = 80,		--通知后等待秒数（第7圈）
			radius = 10,		--半径
			damage_percent = 10,		--圈外伤害百分比（%）
			gas_shrink_seconds = 60,		--缩小用时（秒）
		},
		{
			wait_seconds = 80,		--通知后等待秒数（第8圈）
			radius = 0,		--半径
			damage_percent = 20,		--圈外伤害百分比（%）
			gas_shrink_seconds = 60,		--缩小用时（秒）
		},
}

EscapeKill.MineInfo = {
	{
		mine_tid = 98825,		--矿物tid
		equip_tid = 0,		--对应装备tid
		kungfu_id = 98849,		--对应技能包id
		skill_id = 11479,		--对应技能id
		max_level = 1,		--技能或装备最大等级
		position = 62,		--快捷栏位置（1、2、4、8、16、32、64、128代表8个格子）
		replace = 0,		--是否替换
		consume = 0,		--是否使用后消耗
		score = 3,		--额外采集换算分数
	},
	{
		mine_tid = 98826,		--矿物tid
		equip_tid = 0,		--对应装备tid
		kungfu_id = 99059,		--对应技能包id
		skill_id = 11483,		--对应技能id
		max_level = 1,		--技能或装备最大等级
		position = 62,		--快捷栏位置（1、2、4、8、16、32、64、128代表8个格子）
		replace = 0,		--是否替换
		consume = 0,		--是否使用后消耗
		score = 3,		--额外采集换算分数
	},
	{
		mine_tid = 99053,		--矿物tid
		equip_tid = 0,		--对应装备tid
		kungfu_id = 99060,		--对应技能包id
		skill_id = 11484,		--对应技能id
		max_level = 1,		--技能或装备最大等级
		position = 62,		--快捷栏位置（1、2、4、8、16、32、64、128代表8个格子）
		replace = 0,		--是否替换
		consume = 0,		--是否使用后消耗
		score = 3,		--额外采集换算分数
	},
	{
		mine_tid = 99054,		--矿物tid
		equip_tid = 0,		--对应装备tid
		kungfu_id = 99061,		--对应技能包id
		skill_id = 11485,		--对应技能id
		max_level = 1,		--技能或装备最大等级
		position = 62,		--快捷栏位置（1、2、4、8、16、32、64、128代表8个格子）
		replace = 0,		--是否替换
		consume = 0,		--是否使用后消耗
		score = 3,		--额外采集换算分数
	},
	{
		mine_tid = 99055,		--矿物tid
		equip_tid = 0,		--对应装备tid
		kungfu_id = 99062,		--对应技能包id
		skill_id = 11486,		--对应技能id
		max_level = 1,		--技能或装备最大等级
		position = 62,		--快捷栏位置（1、2、4、8、16、32、64、128代表8个格子）
		replace = 0,		--是否替换
		consume = 0,		--是否使用后消耗
		score = 3,		--额外采集换算分数
	},
	{
		mine_tid = 99056,		--矿物tid
		equip_tid = 0,		--对应装备tid
		kungfu_id = 99063,		--对应技能包id
		skill_id = 11487,		--对应技能id
		max_level = 1,		--技能或装备最大等级
		position = 62,		--快捷栏位置（1、2、4、8、16、32、64、128代表8个格子）
		replace = 0,		--是否替换
		consume = 0,		--是否使用后消耗
		score = 3,		--额外采集换算分数
	},
	{
		mine_tid = 99057,		--矿物tid
		equip_tid = 0,		--对应装备tid
		kungfu_id = 99064,		--对应技能包id
		skill_id = 11488,		--对应技能id
		max_level = 1,		--技能或装备最大等级
		position = 62,		--快捷栏位置（1、2、4、8、16、32、64、128代表8个格子）
		replace = 0,		--是否替换
		consume = 0,		--是否使用后消耗
		score = 3,		--额外采集换算分数
	},
	{
		mine_tid = 99058,		--矿物tid
		equip_tid = 0,		--对应装备tid
		kungfu_id = 99065,		--对应技能包id
		skill_id = 11489,		--对应技能id
		max_level = 1,		--技能或装备最大等级
		position = 62,		--快捷栏位置（1、2、4、8、16、32、64、128代表8个格子）
		replace = 0,		--是否替换
		consume = 0,		--是否使用后消耗
		score = 3,		--额外采集换算分数
	},
	{
		mine_tid = 99143,		--矿物tid
		equip_tid = 0,		--对应装备tid
		kungfu_id = 99142,		--对应技能包id
		skill_id = 11491,		--对应技能id
		max_level = 1,		--技能或装备最大等级
		position = 64,		--快捷栏位置（1、2、4、8、16、32、64、128代表8个格子）
		replace = 1,		--是否替换
		consume = 1,		--是否使用后消耗
		score = 3,		--额外采集换算分数
	},
	{
		mine_tid = 99144,		--矿物tid
		equip_tid = 0,		--对应装备tid
		kungfu_id = 99141,		--对应技能包id
		skill_id = 11493,		--对应技能id
		max_level = 1,		--技能或装备最大等级
		position = 128,		--快捷栏位置（1、2、4、8、16、32、64、128代表8个格子）
		replace = 1,		--是否替换
		consume = 1,		--是否使用后消耗
		score = 3,		--额外采集换算分数
	},
	{
		mine_tid = 98823,		--矿物tid
		equip_tid = 1,		--对应装备tid
		kungfu_id = 0,		--对应技能包id
		skill_id = 0,		--对应技能id
		max_level = 27,		--技能或装备最大等级
		position = 0,		--快捷栏位置（1、2、4、8、16、32、64、128代表8个格子）
		replace = 0,		--是否替换
		consume = 0,		--是否使用后消耗
		score = 3,		--额外采集换算分数
	},
	{
		mine_tid = 98824,		--矿物tid
		equip_tid = 2,		--对应装备tid
		kungfu_id = 0,		--对应技能包id
		skill_id = 0,		--对应技能id
		max_level = 36,		--技能或装备最大等级
		position = 0,		--快捷栏位置（1、2、4、8、16、32、64、128代表8个格子）
		replace = 0,		--是否替换
		consume = 0,		--是否使用后消耗
		score = 3,		--额外采集换算分数
	},
}

EscapeKill.BornPos = {
	{ x = .01, y = 300.01, z = 200.01 },
	{ x = 34.74, y = 300.01, z = 196.97 },
	{ x = 68.41, y = 300.01, z = 187.95 },
	{ x = 100.01, y = 300.01, z = 173.21 },
	{ x = 128.57, y = 300.01, z = 153.22 },
	{ x = 153.22, y = 300.01, z = 128.57 },
	{ x = 173.21, y = 300.01, z = 100.01 },
	{ x = 187.95, y = 300.01, z = 68.41 },
	{ x = 196.97, y = 300.01, z = 34.74 },
	{ x = 200.01, y = 300.01, z = .01 },
	{ x = 196.97, y = 300.01, z = -34.74 },
	{ x = 187.95, y = 300.01, z = -68.41 },
	{ x = 173.21, y = 300.01, z = -100.01 },
	{ x = 153.22, y = 300.01, z = -128.57 },
	{ x = 128.57, y = 300.01, z = -153.22 },
	{ x = 100.01, y = 300.01, z = -173.21 },
	{ x = 68.41, y = 300.01, z = -187.95 },
	{ x = 34.74, y = 300.01, z = -196.97 },
	{ x = .01, y = 300.01, z = -200.01 },
	{ x = -34.74, y = 300.01, z = -196.97 },
	{ x = -68.41, y = 300.01, z = -187.95 },
	{ x = -100.01, y = 300.01, z = -173.21 },
	{ x = -128.57, y = 300.01, z = -153.22 },
	{ x = -153.22, y = 300.01, z = -128.57 },
	{ x = -173.21, y = 300.01, z = -100.01 },
	{ x = -187.95, y = 300.01, z = -68.41 },
	{ x = -196.97, y = 300.01, z = -34.74 },
	{ x = -200.01, y = 300.01, z = .01 },
	{ x = -196.97, y = 300.01, z = 34.74 },
	{ x = -187.95, y = 300.01, z = 68.41 },
	{ x = -173.21, y = 300.01, z = 100.01 },
	{ x = -153.22, y = 300.01, z = 128.57 },
	{ x = -128.57, y = 300.01, z = 153.22 },
	{ x = -100.01, y = 300.01, z = 173.21 },
	{ x = -68.41, y = 300.01, z = 187.95 },
	{ x = -34.74, y = 300.01, z = 196.97 },
}

EscapeKill.ExchangeReward = {
	{
		tid = 76607,		--兑换物品id
		need_score = 20000,		--兑换需要积分
		mine_tid = 98825,		--所需采集矿id
		mine_count = 1,		--所需采集数量
		rank_number = 1,		--所需排名
	},
	{
		tid = 76616,		--兑换物品id
		need_score = 20000,		--兑换需要积分
		mine_tid = 98826,		--所需采集矿id
		mine_count = 1,		--所需采集数量
		rank_number = 1,		--所需排名
	},
	{
		tid = 76570,		--兑换物品id
		need_score = 20000,		--兑换需要积分
		mine_tid = 99053,		--所需采集矿id
		mine_count = 1,		--所需采集数量
		rank_number = 1,		--所需排名
	},
	{
		tid = 76549,		--兑换物品id
		need_score = 20000,		--兑换需要积分
		mine_tid = 99054,		--所需采集矿id
		mine_count = 1,		--所需采集数量
		rank_number = 1,		--所需排名
	},
	{
		tid = 76597,		--兑换物品id
		need_score = 20000,		--兑换需要积分
		mine_tid = 99055,		--所需采集矿id
		mine_count = 1,		--所需采集数量
		rank_number = 1,		--所需排名
	},
	{
		tid = 76563,		--兑换物品id
		need_score = 20000,		--兑换需要积分
		mine_tid = 99056,		--所需采集矿id
		mine_count = 1,		--所需采集数量
		rank_number = 1,		--所需排名
	},
	{
		tid = 76619,		--兑换物品id
		need_score = 20000,		--兑换需要积分
		mine_tid = 99057,		--所需采集矿id
		mine_count = 1,		--所需采集数量
		rank_number = 1,		--所需排名
	},
	{
		tid = 76592,		--兑换物品id
		need_score = 20000,		--兑换需要积分
		mine_tid = 99058,		--所需采集矿id
		mine_count = 1,		--所需采集数量
		rank_number = 1,		--所需排名
	},
	{
		tid = 99316,		--兑换物品id
		need_score = 200,		--兑换需要积分
		mine_tid = 98823,		--所需采集矿id
		mine_count = 0,		--所需采集数量
		rank_number = 60,		--所需排名
	},
	{
		tid = 99317,		--兑换物品id
		need_score = 190,		--兑换需要积分
		mine_tid = 98823,		--所需采集矿id
		mine_count = 0,		--所需采集数量
		rank_number = 20,		--所需排名
	},
	{
		tid = 99318,		--兑换物品id
		need_score = 180,		--兑换需要积分
		mine_tid = 98823,		--所需采集矿id
		mine_count = 0,		--所需采集数量
		rank_number = 10,		--所需排名
	},
	{
		tid = 99639,		--兑换物品id
		need_score = 1200,		--兑换需要积分
		mine_tid = 98823,		--所需采集矿id
		mine_count = 0,		--所需采集数量
		rank_number = 1,		--所需排名
	},
}

-- 服务器接口
function EscapeKill:GetActivityInfo()
	local ret_table = {}
		ret_table[1] = self.ActivityInfo.activity_index
		ret_table[2] = self.ActivityInfo.activity_tid
		ret_table[3] = self.ActivityInfo.wait_scene_tid
		ret_table[4] = self.ActivityInfo.instance_tid
		ret_table[5] = self.ActivityInfo.enroll_time
		ret_table[6] = self.ActivityInfo.base_player_num
		ret_table[7] = self.ActivityInfo.player_min_level
	return unpack(ret_table)
end

function EscapeKill:GetInstInfo()
	local ret_table = {}
		ret_table[#ret_table + 1] = self.InstInfo.speed_buff_id
		ret_table[#ret_table + 1] = self.InstInfo.once_max_score
		ret_table[#ret_table + 1] = self.InstInfo.drop_range
		ret_table[#ret_table + 1] = self.InstInfo.kill_score
		ret_table[#ret_table + 1] = self.InstInfo.common_limit_tid
		for k, v in pairs (self.InstInfo.rank_score) do
			ret_table[#ret_table + 1] = v
		end
	return unpack(ret_table)
end

function EscapeKill:GetEquipTid()
	local ret_table = {}
		ret_table[1] = self.EquipTid.weapon
		ret_table[2] = self.EquipTid.armour
	return unpack(ret_table)
end

function EscapeKill:GetMineInfo()
	local ret_table = {}
	for k, v in pairs (self.MineInfo) do
		ret_table[#ret_table + 1] = v.mine_tid
		ret_table[#ret_table + 1] = v.equip_tid
		ret_table[#ret_table + 1] = v.kungfu_id
		ret_table[#ret_table + 1] = v.skill_id
		ret_table[#ret_table + 1] = v.max_level
		ret_table[#ret_table + 1] = v.position
		ret_table[#ret_table + 1] = v.replace
		ret_table[#ret_table + 1] = v.consume
		ret_table[#ret_table + 1] = v.score
	end
	return unpack(ret_table);
end

function EscapeKill:GetSafeAreaInfo()
	local ret_table = {}
	ret_table[#ret_table + 1] = self.InitInfo.orgin_safe_x
	ret_table[#ret_table + 1] = self.InitInfo.orgin_safe_z
	ret_table[#ret_table + 1] = self.InitInfo.orgin_safe_radius
	ret_table[#ret_table + 1] = self.InitInfo.wait_seconds_after_jump
	ret_table[#ret_table + 1] = self.InitInfo.max_distance_center
	ret_table[#ret_table + 1] = self.InitInfo.recover_hp_percent
	ret_table[#ret_table + 1] = self.InitInfo.recover_mp_percent

	for k,v in pairs(self.RoundsInfo) do 
		ret_table[#ret_table + 1] = v.wait_seconds
		ret_table[#ret_table + 1] = v.radius
		ret_table[#ret_table + 1] = v.damage_percent
		ret_table[#ret_table + 1] = v.gas_shrink_seconds
	end
	
	ret_table[#ret_table + 1] = #self.RoundsInfo
	
	return unpack(ret_table)
end

function EscapeKill:GetBornPos()
	local ret_table = {}
	for k, v in pairs (self.BornPos) do
		ret_table[#ret_table + 1] = v.x
		ret_table[#ret_table + 1] = v.y
		ret_table[#ret_table + 1] = v.z
	end
	return unpack(ret_table);
end

function EscapeKill:GetExchangeReward()
	local ret_table = {}
	for k, v in pairs (self.ExchangeReward) do
		ret_table[#ret_table + 1] = v.tid
		ret_table[#ret_table + 1] = v.need_score
		ret_table[#ret_table + 1] = v.mine_tid
		ret_table[#ret_table + 1] = v.mine_count
		ret_table[#ret_table + 1] = v.rank_number
	end
	return unpack(ret_table);
end


-- 客户端接口
function EscapeKill:GetPartialActivityInfo()
	local ret_table = {}
		ret_table[1] = self.ActivityInfo.activity_tid
		ret_table[2] = self.ActivityInfo.wait_scene_tid
		ret_table[3] = self.ActivityInfo.instance_tid
		ret_table[4] = self.ActivityInfo.enroll_time
		ret_table[5] = self.ActivityInfo.player_min_level
	return unpack(ret_table)
end

function EscapeKill:GetKungfuIdAndMineId()
	local ret_table = {}
	for k, v in pairs (EscapeKill.MineInfo) do
		ret_table[#ret_table + 1] = v.kungfu_id
		ret_table[#ret_table + 1] = v.mine_tid
	end
	return unpack(ret_table);
end

function EscapeKill:GetEquipTid()
	local ret_table = {}
		ret_table[1] = self.EquipTid.weapon
		ret_table[2] = self.EquipTid.armour
	return unpack(ret_table)
end

function EscapeKill:GetEquipIdAndMineId()
	local ret_table = {}
	for k, v in pairs (EscapeKill.MineInfo) do
		ret_table[#ret_table + 1] = v.equip_tid
		ret_table[#ret_table + 1] = v.mine_tid
	end
	return unpack(ret_table);
end

function EscapeKill:GetSpeedBuffID( )	
	if EscapeKill.InstInfo.speed_buff_id ~= nil then
		return EscapeKill.InstInfo.speed_buff_id
	end
end

function EscapeKill:GetFallDownSpeed( )	
	if EscapeKill.InstInfo.falldown_speed ~= nil then
		return EscapeKill.InstInfo.falldown_speed
	end
end

function EscapeKill:GetRankScore( )	
	local ret_table = {}
		for k, v in pairs (self.InstInfo.rank_score) do
			ret_table[#ret_table + 1] = v
		end
	return unpack(ret_table)
end

function EscapeKill:GetCommonLimitTid( )	
	if EscapeKill.InstInfo.common_limit_tid ~= nil then
		return EscapeKill.InstInfo.common_limit_tid
	end
end