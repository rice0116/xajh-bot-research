MineSweeping = {}

MineSweeping.success_score = 10

MineSweeping.MineInfo = {}
MineSweeping.MineInfo = {
	pos_x = -7.0,
	pos_y = 34.89,
	pos_z = 41.0,
	spacing = 2.0,					--箱子间距
	radius = 1.0,					--采集距离
	model_tid = 97206,				--模型tid
}

MineSweeping.Mine = {}
MineSweeping.Mine = {
{
	tid = 1,						--箱子id
	type = 2,						--箱子好坏类型
	count = 15,						--箱子数量
	skill_id = 11190,					--开箱子后释放技能
	monster_tid = 0,				--开箱子刷怪tid
	monster_count = 0,				--开箱子刷怪数量
	soul_tid = 0,					--掉落魂tid
},
{
	tid = 2,
	type = 2,
	count = 15,
	skill_id = 11191,
	monster_tid = 0,
	monster_count = 0,
	soul_tid = 0,
},
{
	tid = 3,
	type = 2,
	count = 30,
	skill_id = 0,
	monster_tid = 96877,
	monster_count = 5,
	soul_tid = 0,
},
{
	tid = 4,
	type = 1,
	count = 15,
	skill_id = 11192,
	monster_tid = 0,
	monster_count = 0,
	soul_tid = 0,
},
{
	tid = 5,
	type = 1,
	count = 15,
	skill_id = 0,
	monster_tid = 0,
	monster_count = 0,
	soul_tid = 8937,
},
{
	tid = 6,
	type = 2,
	count = 10,
	skill_id = 0,
	monster_tid = 96878,
	monster_count = 1,
	soul_tid = 0,
},
}

function GetSuccessScore()
	local ret = 0
	if MineSweeping.success_score ~= nil then
		ret = MineSweeping.success_score
	end
	return ret
end

function GetMinePos()            --服务器接口
	local ret_table = {}
	ret_table[1] = MineSweeping.MineInfo.pos_x
	ret_table[2] = MineSweeping.MineInfo.pos_y
	ret_table[3] = MineSweeping.MineInfo.pos_z
	ret_table[4] = MineSweeping.MineInfo.spacing
	ret_table[5] = MineSweeping.MineInfo.radius
	return unpack(ret_table)
end

function GetMineInfo()			  --客户端接口
	local ret_table = {}
	ret_table[1] = MineSweeping.MineInfo.pos_x
	ret_table[2] = MineSweeping.MineInfo.pos_y
	ret_table[3] = MineSweeping.MineInfo.pos_z
	ret_table[4] = MineSweeping.MineInfo.spacing
	ret_table[5] = MineSweeping.MineInfo.radius
	ret_table[6] = MineSweeping.MineInfo.model_tid
	return unpack(ret_table)
end

function GetMines()
	local ret_table = {}
	for k, v in pairs (MineSweeping.Mine) do
		ret_table[#ret_table + 1] = v.tid
		ret_table[#ret_table + 1] = v.type
		ret_table[#ret_table + 1] = v.count
		ret_table[#ret_table + 1] = v.skill_id
		ret_table[#ret_table + 1] = v.monster_tid
		ret_table[#ret_table + 1] = v.monster_count
		ret_table[#ret_table + 1] = v.soul_tid
	end
	return unpack(ret_table)
end

--------------------------------------------------
--客户端接口

-----------------------------------
--	扫雷副本中数字对应的GFX特效
-----------------------------------
MineSweeping.NumToGFXConfig =
{
	[0] = { "界面\\关卡提示\\扫雷数字0.gfx" },
	[1] = { "界面\\关卡提示\\扫雷数字1.gfx" },
	[2] = { "界面\\关卡提示\\扫雷数字2.gfx" },
	[3] = { "界面\\关卡提示\\扫雷数字3.gfx" },
	[4] = { "界面\\关卡提示\\扫雷数字4.gfx" },
	[5] = { "界面\\关卡提示\\扫雷数字5.gfx" },
	[6] = { "界面\\关卡提示\\扫雷数字6.gfx" },
	[7] = { "界面\\关卡提示\\扫雷数字7.gfx" },
	[8] = { "界面\\关卡提示\\扫雷数字8.gfx" },
}

MineSweeping.MineTypeGFXConfig =
{
	[1] = { "程序联入\\游乐场宝箱扫雷好箱子蓝色.gfx" },
	[2] = { "程序联入\\游乐场宝箱扫雷好箱子红色.gfx" },
}

function MineSweeping:GetGFXOfNum(num)
	if(MineSweeping.NumToGFXConfig[num]) then
		return MineSweeping.NumToGFXConfig[num][1]
	else
		return ""
	end
end

function MineSweeping:GetGFXOfMineType(type)
	if(MineSweeping.MineTypeGFXConfig[type]) then
		return MineSweeping.MineTypeGFXConfig[type][1]
	else
		return ""
	end
end

function MineSweeping:GetSuccessScore()
	local ret = 0
	if MineSweeping.success_score ~= nil then
		ret = MineSweeping.success_score
	end
	return ret
end

function MineSweeping:GetMineInfo()
	local ret_table = {}
	ret_table[1] = MineSweeping.MineInfo.pos_x
	ret_table[2] = MineSweeping.MineInfo.pos_y
	ret_table[3] = MineSweeping.MineInfo.pos_z
	ret_table[4] = MineSweeping.MineInfo.spacing
	ret_table[5] = MineSweeping.MineInfo.radius
	ret_table[6] = MineSweeping.MineInfo.model_tid
	return unpack(ret_table)
end

--------------------------------------------------
