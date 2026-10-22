CatchCoin = {}

CatchCoin.success_score = 150		--达到分数通关

CatchCoin.once_count = 8			--每次掉落多少物品

CatchCoin.speed = 4					--掉落速度

CatchCoin.bomb_failed = 3			--碰到炸弹多少次失败

CatchCoin.drop_bomb_time = 10		--碰到大恶魔掉落炸弹时间

CatchCoin.Pos = {}
CatchCoin.Pos = {
	{87.0, 71.0, -378.0},				--掉落位置
	
	{88.0, 75.0, -378.0},
	{91.0, 71.0, -363.0},
	{92.0, 75.0, -363.0},
	{82.0, 71.0, -351.0},
	{83.0, 75.0, -351.0},
	{51.0, 71.0, -354.0},
	{52.0, 75.0, -354.0},
	{108.0, 71.0, -354.0},
	{109.0, 75.0, -354.0},
	{92.0, 71.0, -335.0},
	{93.0, 75.0, -335.0},
	{71.0, 71.0, -336.0},
	{70.0, 75.0, -336.0},
	{62.0, 71.0, -346.0},
	{63.0, 75.0, -346.0},
	{94.0, 71.0, -361.0},
	{95.0, 75.0, -361.0},
	{83.0, 71.0, -347.0},
	{84.0, 75.0, -347.0},
	{60.0, 71.0, -374.0},
	{61.0, 75.0, -374.0},
	{73.0, 71.0, -378.0},
	{74.0, 75.0, -378.0},
	{91.0, 71.0, -348.0},
	{92.0, 75.0, -348.0},
	{77.0, 71.0, -348.0},
	{78.0, 75.0, -348.0},
	{103.0, 71.0, -359.0},
	{104.0, 75.0, -359.0},
	{102.0, 71.0, -375.0},
	{103.0, 75.0, -375.0},
	{51.0, 71.0, -340.0},
	{52.0, 75.0, -340.0},
	{54.0, 71.0, -365.0},
	{55.0, 75.0, -365.0},
	{88.0, 71.0, -366.0},
	{89.0, 75.0, -366.0},
	{62.0, 71.0, -347.0},
	{63.0, 75.0, -347.0},
}

CatchCoin.Item = {}
CatchCoin.Item = {
{
	effect_type = 1,				--效果类型 1：金币、2：宝箱、3：炸弹、4：金色附带、5：白色福袋、6：红色福袋、7：大财神
	
	effect_value = 3,				--效果值
	
	rate = 40,						--掉落概率，总数100
	tid = 97241,						--模板ID
},
{
	effect_type = 2,
	effect_value = 10,
	rate = 15,
	tid = 97242,
},
{
	effect_type = 3,
	effect_value = 11263,
	rate = 25,
	tid = 97243,
},
{
	effect_type = 4,
	effect_value = 5,
	rate = 5,
	tid = 97246,
},
{
	effect_type = 5,
	effect_value = 11264,
	rate = 5,
	tid = 97244,
},
{
	effect_type = 6,
	effect_value = 11262,
	rate = 5,
	tid = 97245,
},
{
	effect_type = 7,
	effect_value = 5,
	rate = 5,
	tid = 97247,
},
}

function GetSuccessScore()
	local ret = 0
	if CatchCoin.success_score ~= nil then
		ret = CatchCoin.success_score
	end
	return ret
end

function GetOnceCount()
	local ret = 0
	if CatchCoin.once_count ~= nil then
		ret = CatchCoin.once_count
	end
	return ret
end

function GetSpeed()
	local ret = 0
	if CatchCoin.speed ~= nil then
		ret = CatchCoin.speed
	end
	return ret
end

function GetBombFailed()
	local ret = 0
	if CatchCoin.bomb_failed ~= nil then
		ret = CatchCoin.bomb_failed
	end
	return ret
end

function GetDropBombTime()
	local ret = 0
	if CatchCoin.drop_bomb_time ~= nil then
		ret = CatchCoin.drop_bomb_time
	end
	return ret
end

function GetCoinPos()
	local ret_table = {}
	for k, v in pairs (CatchCoin.Pos) do
		ret_table[#ret_table + 1] = v[1]
		ret_table[#ret_table + 1] = v[2]
		ret_table[#ret_table + 1] = v[3]
	end
return unpack(ret_table)
end

function GetItem()
	local ret_table = {}
	for k, v in pairs (CatchCoin.Item) do
		ret_table[#ret_table + 1] = v.effect_type
		ret_table[#ret_table + 1] = v.effect_value
		ret_table[#ret_table + 1] = v.rate
	end
	return unpack(ret_table)
end

--------------------------------------------------
--客户端接口
function CatchCoin:GetItemInfo()
	local ret_table = {}
	for k, v in pairs (CatchCoin.Item) do
		ret_table[#ret_table + 1] = v.effect_type
		ret_table[#ret_table + 1] = v.tid
	end
	return ret_table
end

function CatchCoin:GetInstanceInfo()
	local speed = 0
	local score = 0
	
	if CatchCoin.speed ~= nil then
		speed = CatchCoin.speed
	end
	
	if CatchCoin.success_score ~= nil then
		score = CatchCoin.success_score
	end
	return score, speed
end


--------------------------------------------------
