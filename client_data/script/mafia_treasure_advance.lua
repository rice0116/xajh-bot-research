--[[#encode ansi]]
--[[#tag push auto]]


--------------------------------------------------
---策划需要实现的合成概率生成函数
--

BaseRate = {}
BaseRate[1] = {0.9,0.88,0.86,0.84,0.82,0.8,0.78,0.76}
BaseRate[2] = {0.6,0.58,0.56,0.54,0.52,0.5,0.48,0.46}
BaseRate[3] = {0.2,0.18,0.16,0.14,0.12,0.1,0.08,0.06}
BaseRate[4] = {0,-0.02,-0.04,-0.06,-0.08,-0.1,-0.12,-0.14}
BaseRate[5] = {-0.17,-0.18,-0.19,-0.2,-0.21,-0.22,-0.23,-0.24}

BaseRate.QM = {}
BaseRate.QM[1] = {0.01,0.015,0.02,0.025,0.03,0.035,0.04,0.045,0.05}
BaseRate.QM[2] = {0.06,0.065,0.07,0.075,0.08,0.085,0.09,0.095,0.1}
BaseRate.QM[3] = {0.11,0.115,0.12,0.125,0.13,0.135,0.14,0.145,0.15}
BaseRate.QM[4] = {0.16,0.165,0.17,0.175,0.18,0.185,0.19,0.195,0.2}
BaseRate.QM[5] = {0.21,0.215,0.22,0.225,0.23,0.235,0.24,0.245,0.25}

function AdvanceTreasureRate(La,Lb,Qa,Qb)
	if La > 8 or La < 1 or Lb > 9 or Lb < 1 or Qa > 4 or Qa < 0 or Qb >4 or Qb < 0 then
		AdRate = 0
	else
		AdRate = BaseRate[Qa+1][La] + BaseRate.QM[Qb+1][Lb]
	end
	if AdRate < 0 then
		AdRate = 0
	elseif	AdRate > 1 then
		AdRate = 1
	end
	return AdRate
end

-------------------------------------------------------
--策划需要实现的收粮任务调整系数
function GetGatherFoodTaskRatio(lv,cityid,economy,weight,juewei_count)
	if juewei_count > 0 then
		rate = (1.25+(lv-1)*0.025)*(0.6+economy/1587600+0.1)
	else
		rate = (1.25+(lv-1)*0.025)*(0.6+economy/1587600)
	end
	if rate then
		return rate
	else
		return 1.0
	end
end


-----------------------------------------------------
--策划需要配置的帮派喊话配置

MAFIA_SPEAK_TYPE = {
	TST_ADVANCE_SUCESS	= 0,	--宝物升级喊话，帮派喊话
	TST_TRIGGERTRAP		= 1,	--盗宝触发机关，帮派喊话
	TST_STEALDEATH		= 2,	--盗宝触发机关致死，全服喊话
	TST_STEALSUCCESS	= 3,	--盗宝成功，帮派喊话
	TST_ADVANCE_FAILED	= 4,	--宝石升级失败喊话，帮派喊话
	TST_PARTY_NOTIFY	= 5,	--宴会通知喊话，帮派喊话
	TST_PARTY_END		= 6,	--宴会结束喊话，帮派喊话
	TST_TREASURE_ADD	= 7,	--玩家放入宝物
	TST_TREASURE_DEL	= 8,	--玩家销毁宝物
	TST_ACTIVITY_NOTIFY	= 9,	--活动总时间开启通知
}

TST = {}
TST = MAFIA_SPEAK_TYPE

MAFIA_SPEAK_IDS = {
	[TST.TST_ADVANCE_SUCESS]	= {16437,0},--喊话ID，和index
	[TST.TST_TRIGGERTRAP]		= {16438,0},
	[TST.TST_STEALDEATH]		= {0,0},
	[TST.TST_STEALSUCCESS]		= {16439,0},
	[TST.TST_ADVANCE_FAILED]	= {16593,0},
	[TST.TST_PARTY_NOTIFY]		= {16572,0},
	[TST.TST_PARTY_END]		= {16573,0},
	[TST.TST_TREASURE_ADD]		= {16703,0},
	[TST.TST_TREASURE_DEL]		= {16703,1},
	[TST.TST_ACTIVITY_NOTIFY]	= {2462,0},
}

------------------------------------------------------
--服务器获取喊话id的接口
function TSGetSpeakID(type)
	if(MAFIA_SPEAK_IDS[type]) then
		return unpack(MAFIA_SPEAK_IDS[type])
	else
		return unpack({0,0})
	end
end
