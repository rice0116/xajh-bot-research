--[[#encode ansi]]
--[[#tag push auto]]
FactionCityClient = {}
--策划需要填写的数据

--导出开始标志
--拍卖时间
AuctionTime = {
	["weekday"] = 7,
	["hour"] = 14,
	["min"] = 0,
}

--分舵数建设度对应表
Subs2Cons = {
	[1] = 0,
	[2] = 0,
	[3] = 0,
	[4] = 0,
	[5] = 0,
	[6] = 0,
	[7] = 0,
	[8] = 0,
	[9] = 0,
	[10] = 0,
	[11] = 0,
	[12] = 0,
	[13] = 0,
	[14] = 0,
	[15] = 0,
	[16] = 0,
}

--城市基本数据
FactionCity = {
	--新衡山城
	[67] = {
		["citylevel"] = 2,--地图等级
		["economy_init"] = 189000,--初始经济值
		["economy_upper"] = 189000,--经济值上限
		["security_init"] = 50,--治安值初始值
		["security_upper"] = 100,--治安值上限
		["industry_init"] = 50,--工业值初始值
		["industry_upper"] = 100,--工业值上限
		["sub_power_lower"] = 0,--开启分舵最小新势力
		["sub_limit"] = 500,--分舵最大值
		["main_limit"] = 200,--总舵最大值
		["main_power_lower"] = 0,--开启总舵最小新势力
		["init_king"] = 4,--初始龙头
		["can_player_king"] = 0,--是否允许玩家当龙头
		["isopen"] = 1,--是否开放
		["icon"] = [====[worldmaps\x57.dds]====],--场景配图
		["base_task"] = 200,--红利任务数量
		["escort"] = 50,--押镖次数
	},
	--新福州城
	[68] = {
		["citylevel"] = 2,--地图等级
		["economy_init"] = 189000,--初始经济值
		["economy_upper"] = 189000,--经济值上限
		["security_init"] = 50,--治安值初始值
		["security_upper"] = 100,--治安值上限
		["industry_init"] = 50,--工业值初始值
		["industry_upper"] = 100,--工业值上限
		["sub_power_lower"] = 0,--开启分舵最小新势力
		["sub_limit"] = 500,--分舵最大值
		["main_limit"] = 200,--总舵最大值
		["main_power_lower"] = 0,--开启总舵最小新势力
		["init_king"] = 4,--初始龙头
		["can_player_king"] = 0,--是否允许玩家当龙头
		["isopen"] = 1,--是否开放
		["icon"] = [====[worldmaps\x59.dds]====],--场景配图
		["base_task"] = 200,--红利任务数量
		["escort"] = 50,--押镖次数
	},
	--福州郊外
	[72] = {
		["citylevel"] = 4,--地图等级
		["economy_init"] = 50400,--初始经济值
		["economy_upper"] = 50400,--经济值上限
		["security_init"] = 50,--治安值初始值
		["security_upper"] = 100,--治安值上限
		["industry_init"] = 50,--工业值初始值
		["industry_upper"] = 100,--工业值上限
		["sub_power_lower"] = 0,--开启分舵最小新势力
		["sub_limit"] = 80,--分舵最大值
		["main_limit"] = 20,--总舵最大值
		["main_power_lower"] = 0,--开启总舵最小新势力
		["init_king"] = 4,--初始龙头
		["can_player_king"] = 1,--是否允许玩家当龙头
		["isopen"] = 1,--是否开放
		["icon"] = [====[worldmaps\x63.dds]====],--场景配图
		["base_task"] = 40,--红利任务数量
		["escort"] = 30,--押镖次数
	},
	--衡山郊外
	[4] = {
		["citylevel"] = 4,--地图等级
		["economy_init"] = 50400,--初始经济值
		["economy_upper"] = 50400,--经济值上限
		["security_init"] = 50,--治安值初始值
		["security_upper"] = 100,--治安值上限
		["industry_init"] = 50,--工业值初始值
		["industry_upper"] = 100,--工业值上限
		["sub_power_lower"] = 0,--开启分舵最小新势力
		["sub_limit"] = 80,--分舵最大值
		["main_limit"] = 20,--总舵最大值
		["main_power_lower"] = 0,--开启总舵最小新势力
		["init_king"] = 4,--初始龙头
		["can_player_king"] = 1,--是否允许玩家当龙头
		["isopen"] = 1,--是否开放
		["icon"] = [====[worldmaps\x24.dds]====],--场景配图
		["base_task"] = 40,--红利任务数量
		["escort"] = 30,--押镖次数
	},
	--武当山
	[69] = {
		["citylevel"] = 3,--地图等级
		["economy_init"] = 75600,--初始经济值
		["economy_upper"] = 75600,--经济值上限
		["security_init"] = 50,--治安值初始值
		["security_upper"] = 100,--治安值上限
		["industry_init"] = 50,--工业值初始值
		["industry_upper"] = 100,--工业值上限
		["sub_power_lower"] = 0,--开启分舵最小新势力
		["sub_limit"] = 70,--分舵最大值
		["main_limit"] = 30,--总舵最大值
		["main_power_lower"] = 0,--开启总舵最小新势力
		["init_king"] = 1,--初始龙头
		["can_player_king"] = 1,--是否允许玩家当龙头
		["isopen"] = 1,--是否开放
		["icon"] = [====[worldmaps\x48.dds]====],--场景配图
		["base_task"] = 90,--红利任务数量
		["escort"] = 40,--押镖次数
	},
	--华山
	[76] = {
		["citylevel"] = 3,--地图等级
		["economy_init"] = 75600,--初始经济值
		["economy_upper"] = 75600,--经济值上限
		["security_init"] = 50,--治安值初始值
		["security_upper"] = 100,--治安值上限
		["industry_init"] = 50,--工业值初始值
		["industry_upper"] = 100,--工业值上限
		["sub_power_lower"] = 0,--开启分舵最小新势力
		["sub_limit"] = 70,--分舵最大值
		["main_limit"] = 30,--总舵最大值
		["main_power_lower"] = 0,--开启总舵最小新势力
		["init_king"] = 2,--初始龙头
		["can_player_king"] = 1,--是否允许玩家当龙头
		["isopen"] = 1,--是否开放
		["icon"] = [====[worldmaps\x65.dds]====],--场景配图
		["base_task"] = 90,--红利任务数量
		["escort"] = 40,--押镖次数
	},
	--洛阳城
	[75] = {
		["citylevel"] = 1,--地图等级
		["economy_init"] = 151200,--初始经济值
		["economy_upper"] = 151200,--经济值上限
		["security_init"] = 50,--治安值初始值
		["security_upper"] = 100,--治安值上限
		["industry_init"] = 50,--工业值初始值
		["industry_upper"] = 100,--工业值上限
		["sub_power_lower"] = 0,--开启分舵最小新势力
		["sub_limit"] = 60,--分舵最大值
		["main_limit"] = 40,--总舵最大值
		["main_power_lower"] = 0,--开启总舵最小新势力
		["init_king"] = 0,--初始龙头
		["can_player_king"] = 1,--是否允许玩家当龙头
		["isopen"] = 1,--是否开放
		["icon"] = [====[worldmaps\x64.dds]====],--场景配图
		["base_task"] = 140,--红利任务数量
		["escort"] = 100,--押镖次数
	},
	--朱仙镇
	[79] = {
		["citylevel"] = 4,--地图等级
		["economy_init"] = 100800,--初始经济值
		["economy_upper"] = 100800,--经济值上限
		["security_init"] = 50,--治安值初始值
		["security_upper"] = 100,--治安值上限
		["industry_init"] = 50,--工业值初始值
		["industry_upper"] = 100,--工业值上限
		["sub_power_lower"] = 400000,--开启分舵最小新势力
		["sub_limit"] = 65,--分舵最大值
		["main_limit"] = 35,--总舵最大值
		["main_power_lower"] = 600000,--开启总舵最小新势力
		["init_king"] = 0,--初始龙头
		["can_player_king"] = 1,--是否允许玩家当龙头
		["isopen"] = 1,--是否开放
		["icon"] = [====[worldmaps\x68.dds]====],--场景配图
		["base_task"] = 120,--红利任务数量
		["escort"] = 30,--押镖次数
	},
	--药王谷
	[71] = {
		["citylevel"] = 4,--地图等级
		["economy_init"] = 100800,--初始经济值
		["economy_upper"] = 100800,--经济值上限
		["security_init"] = 50,--治安值初始值
		["security_upper"] = 100,--治安值上限
		["industry_init"] = 50,--工业值初始值
		["industry_upper"] = 100,--工业值上限
		["sub_power_lower"] = 400000,--开启分舵最小新势力
		["sub_limit"] = 65,--分舵最大值
		["main_limit"] = 35,--总舵最大值
		["main_power_lower"] = 600000,--开启总舵最小新势力
		["init_king"] = 4,--初始龙头
		["can_player_king"] = 1,--是否允许玩家当龙头
		["isopen"] = 1,--是否开放
		["icon"] = [====[worldmaps\x61.dds]====],--场景配图
		["base_task"] = 120,--红利任务数量
		["escort"] = 30,--押镖次数
	},
	--泰山
	[78] = {
		["citylevel"] = 4,--地图等级
		["economy_init"] = 75600,--初始经济值
		["economy_upper"] = 75600,--经济值上限
		["security_init"] = 50,--治安值初始值
		["security_upper"] = 100,--治安值上限
		["industry_init"] = 50,--工业值初始值
		["industry_upper"] = 100,--工业值上限
		["sub_power_lower"] = 400000,--开启分舵最小新势力
		["sub_limit"] = 70,--分舵最大值
		["main_limit"] = 30,--总舵最大值
		["main_power_lower"] = 600000,--开启总舵最小新势力
		["init_king"] = 0,--初始龙头
		["can_player_king"] = 1,--是否允许玩家当龙头
		["isopen"] = 1,--是否开放
		["icon"] = [====[worldmaps\x67.dds]====],--场景配图
		["base_task"] = 90,--红利任务数量
		["escort"] = 30,--押镖次数
	},
	--少室山
	[77] = {
		["citylevel"] = 3,--地图等级
		["economy_init"] = 75600,--初始经济值
		["economy_upper"] = 75600,--经济值上限
		["security_init"] = 50,--治安值初始值
		["security_upper"] = 100,--治安值上限
		["industry_init"] = 50,--工业值初始值
		["industry_upper"] = 100,--工业值上限
		["sub_power_lower"] = 400000,--开启分舵最小新势力
		["sub_limit"] = 70,--分舵最大值
		["main_limit"] = 30,--总舵最大值
		["main_power_lower"] = 600000,--开启总舵最小新势力
		["init_king"] = 0,--初始龙头
		["can_player_king"] = 1,--是否允许玩家当龙头
		["isopen"] = 1,--是否开放
		["icon"] = [====[worldmaps\x66.dds]====],--场景配图
		["base_task"] = 90,--红利任务数量
		["escort"] = 40,--押镖次数
	},
	--五霸岗
	[81] = {
		["citylevel"] = 4,--地图等级
		["economy_init"] = 63000,--初始经济值
		["economy_upper"] = 63000,--经济值上限
		["security_init"] = 50,--治安值初始值
		["security_upper"] = 100,--治安值上限
		["industry_init"] = 50,--工业值初始值
		["industry_upper"] = 100,--工业值上限
		["sub_power_lower"] = 400000,--开启分舵最小新势力
		["sub_limit"] = 75,--分舵最大值
		["main_limit"] = 25,--总舵最大值
		["main_power_lower"] = 600000,--开启总舵最小新势力
		["init_king"] = 5,--初始龙头
		["can_player_king"] = 1,--是否允许玩家当龙头
		["isopen"] = 1,--是否开放
		["icon"] = [====[worldmaps\x70.dds]====],--场景配图
		["base_task"] = 60,--红利任务数量
		["escort"] = 30,--押镖次数
	},
	--余杭
	[82] = {
		["citylevel"] = 3,--地图等级
		["economy_init"] = 151200,--初始经济值
		["economy_upper"] = 151200,--经济值上限
		["security_init"] = 50,--治安值初始值
		["security_upper"] = 100,--治安值上限
		["industry_init"] = 50,--工业值初始值
		["industry_upper"] = 100,--工业值上限
		["sub_power_lower"] = 600000,--开启分舵最小新势力
		["sub_limit"] = 60,--分舵最大值
		["main_limit"] = 40,--总舵最大值
		["main_power_lower"] = 900000,--开启总舵最小新势力
		["init_king"] = 7,--初始龙头
		["can_player_king"] = 1,--是否允许玩家当龙头
		["isopen"] = 1,--是否开放
		["icon"] = [====[worldmaps\x71.dds]====],--场景配图
		["base_task"] = 140,--红利任务数量
		["escort"] = 40,--押镖次数
	},
	--仙霞岭
	[83] = {
		["citylevel"] = 4,--地图等级
		["economy_init"] = 100800,--初始经济值
		["economy_upper"] = 100800,--经济值上限
		["security_init"] = 50,--治安值初始值
		["security_upper"] = 100,--治安值上限
		["industry_init"] = 50,--工业值初始值
		["industry_upper"] = 100,--工业值上限
		["sub_power_lower"] = 600000,--开启分舵最小新势力
		["sub_limit"] = 65,--分舵最大值
		["main_limit"] = 35,--总舵最大值
		["main_power_lower"] = 900000,--开启总舵最小新势力
		["init_king"] = 7,--初始龙头
		["can_player_king"] = 1,--是否允许玩家当龙头
		["isopen"] = 1,--是否开放
		["icon"] = [====[worldmaps\x72.dds]====],--场景配图
		["base_task"] = 120,--红利任务数量
		["escort"] = 30,--押镖次数
	},
	--仙愁峡
	[80] = {
		["citylevel"] = 4,--地图等级
		["economy_init"] = 63000,--初始经济值
		["economy_upper"] = 63000,--经济值上限
		["security_init"] = 50,--治安值初始值
		["security_upper"] = 100,--治安值上限
		["industry_init"] = 50,--工业值初始值
		["industry_upper"] = 100,--工业值上限
		["sub_power_lower"] = 600000,--开启分舵最小新势力
		["sub_limit"] = 75,--分舵最大值
		["main_limit"] = 25,--总舵最大值
		["main_power_lower"] = 900000,--开启总舵最小新势力
		["init_king"] = 7,--初始龙头
		["can_player_king"] = 1,--是否允许玩家当龙头
		["isopen"] = 1,--是否开放
		["icon"] = [====[worldmaps\x69.dds]====],--场景配图
		["base_task"] = 60,--红利任务数量
		["escort"] = 30,--押镖次数
	},
		--伪衡山城
	[6700] = {
		["citylevel"] = 2,--地图等级
		["economy_init"] = 189000,--初始经济值
		["economy_upper"] = 189000,--经济值上限
		["security_init"] = 50,--治安值初始值
		["security_upper"] = 100,--治安值上限
		["industry_init"] = 50,--工业值初始值
		["industry_upper"] = 100,--工业值上限
		["sub_power_lower"] = 0,--开启分舵最小新势力
		["sub_limit"] = 500,--分舵最大值
		["main_limit"] = 200,--总舵最大值
		["main_power_lower"] = 0,--开启总舵最小新势力
		["init_king"] = 4,--初始龙头
		["can_player_king"] = 1,--是否允许玩家当龙头
		["isopen"] = 1,--是否开放
		["icon"] = [====[worldmaps\x57.dds]====],--场景配图
		["base_task"] = 200,--红利任务数量
		["escort"] = 50,--押镖次数
	},
	--伪福州城
	[6800] = {
		["citylevel"] = 2,--地图等级
		["economy_init"] = 189000,--初始经济值
		["economy_upper"] = 189000,--经济值上限
		["security_init"] = 50,--治安值初始值
		["security_upper"] = 100,--治安值上限
		["industry_init"] = 50,--工业值初始值
		["industry_upper"] = 100,--工业值上限
		["sub_power_lower"] = 0,--开启分舵最小新势力
		["sub_limit"] = 500,--分舵最大值
		["main_limit"] = 200,--总舵最大值
		["main_power_lower"] = 0,--开启总舵最小新势力
		["init_king"] = 4,--初始龙头
		["can_player_king"] = 1,--是否允许玩家当龙头
		["isopen"] = 1,--是否开放
		["icon"] = [====[worldmaps\x59.dds]====],--场景配图
		["base_task"] = 200,--红利任务数量
		["escort"] = 50,--押镖次数
	},
}
--导出结束标志

--如果地图经济值上限有调整，需要同步修改mafia_treasure_Advance.lua中策划接口中使用的经济总值

--服务器接口
function GetAllCityInfo()
        local __func_getonecity = __script_LoadOneCity

        for k,v in pairs(FactionCity) do
			local citylevel = v["citylevel"]
			local economy_init = v["economy_init"]
			local economy_upper = v["economy_upper"]
			local security_init = v["security_init"]
			local security_upper = v["security_upper"]
			local industry_init = v["industry_init"]
			local industry_upper = v["industry_upper"]
			local sub_power_lower = v["sub_power_lower"]
			local sub_limit = v["sub_limit"]
			local main_limit = v["main_limit"]
			local main_power_lower = v["main_power_lower"]
			local init_king = v["init_king"]
			local can_player_king = v["can_player_king"]
			local isopen = v["isopen"]
			local escort = v["escort"]
			if(__func_getonecity(escort,isopen,can_player_king,init_king,main_power_lower,main_limit,sub_limit,sub_power_lower,industry_upper,industry_init,security_upper,security_init,economy_upper,economy_init,citylevel,k) ~= 0) then
				return -1
			end
	end
	return 0
end

function GetAuctionTime()
	return AuctionTime["weekday"],AuctionTime["hour"],AuctionTime["min"]
end

function GetSubNeedContruction()
	cvtables = {}
	local ncount = 0;
	for k,v in pairs(Subs2Cons) do
		ncount = ncount + 1
		cvtables[ncount] = k
		ncount = ncount + 1
		cvtables[ncount] = v
	end
	cvtables[ncount + 1] = ncount;
	return unpack(cvtables)
end

function GenerateMoneyTaskCount(citys)
	local person_count = ComputePersonCount(citys);
	local city_count = {}
	for k,v in pairs(citys) do
		city_count[k] =  ComputeMoneyTask(k,v["isking"],v["economy"],v["weight"])
	end
	return city_count,person_count
end

--策划接口
function ComputeMoneyTask(cityid,isking,economy,weight)
	TaskCount = math.ceil(FactionCity[cityid]["base_task"] * weight/100)
	if TaskCount then
		return TaskCount
	else
		return 0
	end
end

function ComputePersonCount(citys)
	local n = 0
	for k,v in pairs(citys) do
		n = n + 1
	end
	return n
end

--客户端接口
function FactionCityClient:GetInitKing(city_id)
	if FactionCity[city_id] then
		return FactionCity[city_id]["init_king"]
	else
		return 0
	end
end

function FactionCityClient:GetCityPic(city_id)
	if FactionCity[city_id] then
		return FactionCity[city_id]["icon"]
	else
		return 0
	end
end

function FactionCityClient:GetAvailableSubNum(build_value)
	local SubNum = 0
	local MaxSub = 0

	for k,v in pairs(Subs2Cons) do
		if build_value >= v and v >= MaxSub then
			SubNum = k
			MaxSub =v
		end
	end

	return SubNum
end

function FactionCityClient:GetMaxValueOfCity(city_id)
	if FactionCity[city_id] then
		return FactionCity[city_id]["economy_upper"],FactionCity[city_id]["security_upper"],FactionCity[city_id]["industry_upper"]
	else
		return 0,0,0
	end
end

function FactionCityClient:CanBePlayerKing(city_id)
	if FactionCity[city_id] and FactionCity[city_id]["can_player_king"] == 1 then
		return true
	else
		return false
	end
end

function FactionCityClient:GetCityEscort(city_id)
	if FactionCity[city_id] then
		return FactionCity[city_id]["escort"]
	else
		return 0
	end
end

--返回帮派配置
function FactionCityClient:GetFactionConfig(city_id)
	if FactionCity[city_id] then
		return FactionCity[city_id]
	else
		return 0
	end
end
