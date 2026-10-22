ServerClientCommon = {}

ServerClientCommon.RecallRewardInOldServerConfig = {}  --再战江湖
ServerClientCommon.RecallRewardInOldServerConfig =
{
--老服领奖: 索引,奖励，条件值，总领奖次数
	--上线奖励
	{index = 1, award_id = 10560, condition = 1, reward_times_limit_total = 7, AwardItemID1 = 91253,AwardItemNum1 = 5,AwardItemID2 = 91124,AwardItemNum2 = 2,AwardItemID3 = 94039,AwardItemNum3 = 30,AwardItemID4 = 94986,AwardItemNum4 = 1,AwardItemID5 = -1,AwardItemNum5 = -1},
	--消耗40元宝
	{index = 2, award_id = 10561, condition = 40, reward_times_limit_total = 7, AwardItemID1 = 91253,AwardItemNum1 = 1,AwardItemID2 = 86713,AwardItemNum2 = 10,AwardItemID3 = -1,AwardItemNum3 = -1,AwardItemID4 = -1,AwardItemNum4 = -1,AwardItemID5 = -1,AwardItemNum5 = -1},
	--消耗400元宝
	{index = 3, award_id = 10562, condition = 400, reward_times_limit_total = 7, AwardItemID1 = 94020,AwardItemNum1 = 20,AwardItemID2 = 96470,AwardItemNum2 = 15,AwardItemID3 = -1,AwardItemNum3 = -1,AwardItemID4 = -1,AwardItemNum4 = -1,AwardItemID5 = -1,AwardItemNum5 = -1},
	--活跃度达到50
	{index = 4, award_id = 10563, condition = 50, reward_times_limit_total = 7, AwardItemID1 = 91403,AwardItemNum1 = 20,AwardItemID2 = 87803,AwardItemNum2 = 5,AwardItemID3 = 91114,AwardItemNum3 = 1,AwardItemID4 = 87250,AwardItemNum4 = 1,AwardItemID5 = -1,AwardItemNum5 = -1},
	--活跃度达到70
	{index = 5, award_id = 10564, condition = 70, reward_times_limit_total = 7, AwardItemID1 = 91253,AwardItemNum1 = 1,AwardItemID2 = 86713,AwardItemNum2 = 3,AwardItemID3 = 91124,AwardItemNum3 = 1,AwardItemID4 = 97497,AwardItemNum4 = 1,AwardItemID5 = -1,AwardItemNum5 = -1},
	--完成一次绿竹
	{index = 6, award_id = 10565, condition = 1, reward_times_limit_total = 7, AwardItemID1 = 99193,AwardItemNum1 = 1,AwardItemID2 = 88459,AwardItemNum2 = 30,AwardItemID3 = 95789,AwardItemNum3 = 1,AwardItemID4 = 97497,AwardItemNum4 = 1,AwardItemID5 = -1,AwardItemNum5 = -1},
	--完成盟主以上难度
	{index = 7, award_id = 10566, condition = 1, reward_times_limit_total = 7, AwardItemID1 = 94039,AwardItemNum1 = 10,AwardItemID2 = 88459,AwardItemNum2 = 30,AwardItemID3 = 86707,AwardItemNum3 = 3,AwardItemID4 = 97497,AwardItemNum4 = 1,AwardItemID5 = -1,AwardItemNum5 = -1},
	--完成3次百毒
	{index = 8, award_id = 10567, condition = 3, reward_times_limit_total = 7, AwardItemID1 = 81535,AwardItemNum1 = 5,AwardItemID2 = 96528,AwardItemNum2 = 20,AwardItemID3 = 88459,AwardItemNum3 = 30,AwardItemID4 = 97497,AwardItemNum4 = 1,AwardItemID5 = -1,AwardItemNum5 = -1},
}

ServerClientCommon.RecallRewardInNewServerConfig = {}  --江山社稷
ServerClientCommon.RecallRewardInNewServerConfig =
{
--幸运玩家领取宝银:索引，等级，奖励，比例
	{index = 1, level = 45, award_id = 10568, ratio = 10, AwardItemID1 = 81535,AwardItemNum1 = 3,AwardItemID2 = 86707,AwardItemNum2 = 2,AwardItemID3 = -1,AwardItemNum3 = -1},
	{index = 2, level = 55, award_id = 10569, ratio = 15, AwardItemID1 = 81535,AwardItemNum1 = 4,AwardItemID2 = 86707,AwardItemNum2 = 3,AwardItemID3 = 91154,AwardItemNum3 = 5},
	{index = 3, level = 65, award_id = 10570, ratio = 20, AwardItemID1 = 82032,AwardItemNum1 = 50,AwardItemID2 = 99193,AwardItemNum2 = 1,AwardItemID3 = -1,AwardItemNum3 = -1},
	{index = 4, level = 75, award_id = 10571, ratio = 25, AwardItemID1 = 76526,AwardItemNum1 = 5,AwardItemID2 = 86707,AwardItemNum2 = 5,AwardItemID3 = 99193,AwardItemNum3 = 1},
	{index = 5, level = 85, award_id = 10572, ratio = 30, AwardItemID1 = 87803,AwardItemNum1 = 20,AwardItemID2 = 91253,AwardItemNum2 = 1,AwardItemID3 = -1,AwardItemNum3 = -1},
}

ServerClientCommon.RecallOnlineAwardsConfig = {} --全服在线奖励
ServerClientCommon.RecallOnlineAwardsConfig =
{
--在线时长（单位：秒） 通用奖励模板ID
	{online_time = 1800, awards_id = 10573, tips = "倒计时结束即可获得\r^ff0000换镖令*1"},
	{online_time = 5400, awards_id = 10574, tips = "倒计时结束即可获得\r^ff0000风物石*5"},
	{online_time = 16200, awards_id = 10575, tips = "倒计时结束即可获得\r^ff0000宝石结晶*3"},
	{online_time = 37800, awards_id = 10576, tips = "倒计时结束即可获得\r^ff0000风云令*1\r^ffffff使用将可能获得1级角刺珊瑚、星尘砂、月尘砂、龙涎草等多种奖励！"},
}

ServerClientCommon.RecallLevelUpAwardsConfig = {} --全服升级奖励
ServerClientCommon.RecallLevelUpAwardsConfig =
{
--升级奖励:等级，通用奖励模板ID
	{level = 15, awards_id = 10616, AwardItemID1 = 99189,AwardItemNum1 = 1,AwardItemID2 = -1,AwardItemNum2 = -1,AwardItemID3 = -1,AwardItemNum3 = -1,AwardItemID4 = -1,AwardItemNum4 = -1,AwardItemID5 = -1,AwardItemNum5 = -1},
	{level = 25, awards_id = 10617, AwardItemID1 = 91154,AwardItemNum1 = 2,AwardItemID2 = 44806,AwardItemNum2 = 10,AwardItemID3 = 28315,AwardItemNum3 = 1,AwardItemID4 = -1,AwardItemNum4 = -1,AwardItemID5 = -1,AwardItemNum5 = -1},
	{level = 35, awards_id = 10618, AwardItemID1 = 91154,AwardItemNum1 = 3,AwardItemID2 = 86707,AwardItemNum2 = 3,AwardItemID3 = 67098,AwardItemNum3 = 1,AwardItemID4 = -1,AwardItemNum4 = -1,AwardItemID5 = -1,AwardItemNum5 = -1},
	{level = 45, awards_id = 10619, AwardItemID1 = 81535,AwardItemNum1 = 7,AwardItemID2 = 86707,AwardItemNum2 = 3,AwardItemID3 = -1,AwardItemNum3 = -1,AwardItemID4 = -1,AwardItemNum4 = -1,AwardItemID5 = -1,AwardItemNum5 = -1},
	{level = 55, awards_id = 10620, AwardItemID1 = 67098,AwardItemNum1 = 1,AwardItemID2 = 94022,AwardItemNum2 = 1,AwardItemID3 = 99191,AwardItemNum3 = 1,AwardItemID4 = -1,AwardItemNum4 = -1,AwardItemID5 = -1,AwardItemNum5 = -1},
	{level = 65, awards_id = 10621, AwardItemID1 = 94022,AwardItemNum1 = 1,AwardItemID2 = 86707,AwardItemNum2 = 5,AwardItemID3 = 87803,AwardItemNum3 = 5,AwardItemID4 = 94986,AwardItemNum4 = 1,AwardItemID5 = 99192,AwardItemNum5 = 1},
	{level = 75, awards_id = 10622, AwardItemID1 = 94022,AwardItemNum1 = 1,AwardItemID2 = 87803,AwardItemNum2 = 5,AwardItemID3 = 82032,AwardItemNum3 = 50,AwardItemID4 = 86713,AwardItemNum4 = 1,AwardItemID5 = 96407,AwardItemNum5 = 1},
	{level = 85, awards_id = 10623, AwardItemID1 = 94022,AwardItemNum1 = 1,AwardItemID2 = 96528,AwardItemNum2 = 100,AwardItemID3 = 96470,AwardItemNum3 = 20,AwardItemID4 = 94987,AwardItemNum4 = 1,AwardItemID5 = -1,AwardItemNum5 = -1},
}

ServerClientCommon.FactionBrew = {}
ServerClientCommon.FactionBrew =
{
	--酿酒相关数据
	[0] =
	{
		--所需声望与值，其中粮食：20，水果：21，酒曲：22
		{
			need_rep = { [20] =  5 , [21] = 5 , [22] = 5 },
			award_id = 10926
		},
		{
			need_rep = { [20] =  8 , [21] = 14 , [22] = 8 },
			award_id = 10927
		},
		{
			need_rep = { [20] =  18 , [21] = 19 , [22] = 23 },
			award_id = 10928
		},
		{
			need_rep = { [20] =  33 , [21] = 29 , [22] = 28 },
			award_id = 10929
		},
		{
			need_rep = { [20] =  48 , [21] = 44 , [22] = 58 },
			award_id = 10930
		},
	},
}

--服务器调用接口
function GetFactionValidRepReward()
    local ret_table = {}
    --最终返回数据格式
    --活动数量，
    	--活动id , 内容条数
    		--所需声望数，声望id，声望值，奖励id

	local active_num = 0;
	for k,v in pairs(ServerClientCommon.FactionBrew) do
	    active_num = active_num + 1;
	end
	ret_table[#ret_table + 1] = active_num				--活动数量

	for k_active,v_active in pairs(ServerClientCommon.FactionBrew) do
	    ret_table[#ret_table + 1] = k_active;			--活动id
	    ret_table[#ret_table + 1] = #v_active			--内容条数
	    for k_item,v_item in pairs(v_active) do
	        local rep_map = v_item.need_rep;
	       	local rep_num = 0;
	       	for k_rep,v_rep in pairs(rep_map) do
	       	    rep_num = rep_num + 1;					--需要声望数量
	       	end
	       	ret_table[#ret_table + 1] = rep_num;
	       	for k_rep,v_rep in pairs(rep_map) do
	       	    ret_table[#ret_table + 1] = k_rep;		--声望id
	       	    ret_table[#ret_table + 1] = v_rep;		--声望值
	       	end
	       	ret_table[#ret_table + 1] = v_item.award_id	--奖励id
	    end
	end

	return unpack(ret_table)
end

function GetRecallRewardInOldServer()
    local ret_table = {}
  	for k,v in pairs(ServerClientCommon.RecallRewardInOldServerConfig) do
		ret_table[#ret_table + 1] = v.index
		ret_table[#ret_table + 1] = v.award_id
		ret_table[#ret_table + 1] = v.condition
		ret_table[#ret_table + 1] = v.reward_times_limit_total
	end
  	return unpack(ret_table)
end

function GetRecallRewardInNewServer()
    local ret_table = {}
  	for k,v in pairs(ServerClientCommon.RecallRewardInNewServerConfig) do
		ret_table[#ret_table + 1] = v.index
		ret_table[#ret_table + 1] = v.level
		ret_table[#ret_table + 1] = v.award_id
		ret_table[#ret_table + 1] = v.ratio
	end
  	return unpack(ret_table)
end

function GetRecallOnlineAwards()
	local ret_table = {}
	for k,v in pairs(ServerClientCommon.RecallOnlineAwardsConfig) do
		ret_table[#ret_table + 1] = v.online_time
		ret_table[#ret_table + 1] = v.awards_id
	end
	return unpack(ret_table)
end

function GetLevelUpAwards()
  	local ret_table = {}
  	for k,v in pairs(ServerClientCommon.RecallLevelUpAwardsConfig) do
  		ret_table[#ret_table + 1] = v.level
			ret_table[#ret_table + 1] = v.awards_id
		end
  	return unpack(ret_table)

end

--客户端调用接口
function ServerClientCommon:GetFactionBrewingCfg( id, index )
	if ServerClientCommon.FactionBrew[id] ~= nil then
		if ServerClientCommon.FactionBrew[id][index] ~= nil then
			local ret_table = ServerClientCommon.FactionBrew[id][index]
			return ret_table.need_rep, ret_table.award_id
		end
	end
end

function ServerClientCommon:GetPlayerOnlineTimeList()
	local ret_table = {}

	for k, v in pairs (ServerClientCommon.RecallOnlineAwardsConfig) do
		ret_table[#ret_table + 1] = v.online_time
	end
	return ret_table
end

function ServerClientCommon:GetPlayerOnlineAwardTips( index )
	local index_table = ServerClientCommon.RecallOnlineAwardsConfig[index]
	if index_table == nil then
		return
	end

	if index_table.tips ~= nil then
		return index_table.tips
	end
end

function ServerClientCommon:GetPlayerRewardLevel()
	local ret_table = {}

	for k, v in pairs (ServerClientCommon.RecallLevelUpAwardsConfig) do
		ret_table[#ret_table + 1] = v.level
	end
	return ret_table
end

function ServerClientCommon:GetLevelAwardConfig( index )
    local award_table = ServerClientCommon.RecallLevelUpAwardsConfig[index]
    if award_table == nil then
        return
    end

    return award_table.AwardItemID1, award_table.AwardItemNum1, award_table.AwardItemID2, award_table.AwardItemNum2, award_table.AwardItemID3, award_table.AwardItemNum3, award_table.AwardItemID4, award_table.AwardItemNum4, award_table.AwardItemID5, award_table.AwardItemNum5
end

function ServerClientCommon:GetJJSJAwardLevel( )
	local ret_table = {}

	for k, v in pairs (ServerClientCommon.RecallRewardInNewServerConfig) do
		ret_table[#ret_table + 1] = v.level
	end
	return ret_table
end

function ServerClientCommon:GetJJSJAwardConfig( index )
    local award_table = ServerClientCommon.RecallRewardInNewServerConfig[index]
    if award_table == nil then
        return
    end

    return award_table.AwardItemID1, award_table.AwardItemNum1, award_table.AwardItemID2, award_table.AwardItemNum2, award_table.AwardItemID3, award_table.AwardItemNum3
end

function ServerClientCommon:GetJJSJReputionAwardRatio( )
	local ret_table = {}

	for k, v in pairs (ServerClientCommon.RecallRewardInNewServerConfig) do
		ret_table[#ret_table + 1] = v.ratio
	end
	return ret_table
end

function ServerClientCommon:GetZZJHAwardConfig( index )
    local award_table = ServerClientCommon.RecallRewardInOldServerConfig[index]
    if award_table == nil then
        return
    end

    return award_table.AwardItemID1, award_table.AwardItemNum1, award_table.AwardItemID2, award_table.AwardItemNum2, award_table.AwardItemID3, award_table.AwardItemNum3, award_table.AwardItemID4, award_table.AwardItemNum4, award_table.AwardItemID5, award_table.AwardItemNum5
end
