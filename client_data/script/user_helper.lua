----------------------战斗辅助脚本说明---------------------

-------------------------需使用接口------------------------

--获取角色信息：GameApi.GetPlayerFullProp (0)
--[hp]        ----> 当前血量
--[maxhp]     ----> 血量上限
--[mp1]       ----> 当前内力
--[maxmp1]    ----> 内力上限
--[mp2]       ----> 当前怒气
--[maxmp2]    ----> 怒气上限
--[mp3]       ----> 当前破绽
--[mp4]       ----> 当前体力
--[maxmp4]    ----> 体力上限
--显示提示信息：GameApi.AddSystemHint()
--物品是否存在：GameApi.HaveItem(id)
--使用物品：GameApi.UseItemByID(id)
--操作模式：GameApi.SetOperationMode(bool)
--是否有心法Buff: GameApi.HostHasSutra() 返回0表示无心法，反回其他表示有心法
--是否有心法状态：GameApi.PlayerHasBuffState(0, buffid)
--使用普通技能：GameApi.UseNormalSkillByID(skill_ID)
--判断是否有招出宠物：GameApi.HasSummonedPet()
--召出宠物：GameApi.SummonPet(pet_index)

UserHelper = {}

--血瞬回药ID及等级限制
UserHelper.HPITEM = {}
UserHelper.HPITEM[1] = {38506,1}
UserHelper.HPITEM[2] = {38715,1}
UserHelper.HPITEM[3] = {38720,1}
UserHelper.HPITEM[4] = {5486,10}
UserHelper.HPITEM[5] = {25659,10}
UserHelper.HPITEM[6] = {25669,10}
UserHelper.HPITEM[7] = {5487,20}
UserHelper.HPITEM[8] = {25660,20}
UserHelper.HPITEM[9] = {25670,20}
UserHelper.HPITEM[10] = {5488,30}
UserHelper.HPITEM[11] = {25661,30}
UserHelper.HPITEM[12] = {25671,30}
UserHelper.HPITEM[13] = {75452,30}
UserHelper.HPITEM[14] = {5489,40}
UserHelper.HPITEM[15] = {25662,40}
UserHelper.HPITEM[16] = {25672,40}
UserHelper.HPITEM[17] = {5490,50}
UserHelper.HPITEM[18] = {25663,50}
UserHelper.HPITEM[19] = {25673,50}
UserHelper.HPITEM[20] = {5491,60}
UserHelper.HPITEM[21] = {25664,60}
UserHelper.HPITEM[22] = {25674,60}
UserHelper.HPITEM[23] = {5492,70}
UserHelper.HPITEM[24] = {25665,70}
UserHelper.HPITEM[25] = {25675,70}
UserHelper.HPITEM[26] = {5493,80}
UserHelper.HPITEM[27] = {25666,80}
UserHelper.HPITEM[28] = {25676,80}
UserHelper.HPITEM[29] = {5494,90}
UserHelper.HPITEM[30] = {25667,90}
UserHelper.HPITEM[31] = {25677,90}
UserHelper.HPITEM[32] = {5495,100}
UserHelper.HPITEM[33] = {25668,100}
UserHelper.HPITEM[34] = {25678,100}


--蓝瞬回药ID及等级限制
UserHelper.MPITEM = {}
UserHelper.MPITEM[1] = {38697,1}
UserHelper.MPITEM[2] = {38698,1}
UserHelper.MPITEM[3] = {38709,1}
UserHelper.MPITEM[4] = {5497,10}
UserHelper.MPITEM[5] = {25679,10}
UserHelper.MPITEM[6] = {25689,10}
UserHelper.MPITEM[7] = {5498,20}
UserHelper.MPITEM[8] = {25680,20}
UserHelper.MPITEM[9] = {25690,20}
UserHelper.MPITEM[10] = {5499,30}
UserHelper.MPITEM[11] = {25681,30}
UserHelper.MPITEM[12] = {25691,30}
UserHelper.MPITEM[13] = {75453,30}
UserHelper.MPITEM[14] = {5500,40}
UserHelper.MPITEM[15] = {25682,40}
UserHelper.MPITEM[16] = {25692,40}
UserHelper.MPITEM[17] = {5501,50}
UserHelper.MPITEM[18] = {25683,50}
UserHelper.MPITEM[19] = {25693,50}
UserHelper.MPITEM[20] = {5502,60}
UserHelper.MPITEM[21] = {25684,60}
UserHelper.MPITEM[22] = {25694,60}
UserHelper.MPITEM[23] = {5503,70}
UserHelper.MPITEM[24] = {25685,70}
UserHelper.MPITEM[25] = {25695,70}
UserHelper.MPITEM[26] = {5504,80}
UserHelper.MPITEM[27] = {25686,80}
UserHelper.MPITEM[28] = {25696,80}
UserHelper.MPITEM[29] = {5505,90}
UserHelper.MPITEM[30] = {25687,90}
UserHelper.MPITEM[31] = {25697,90}
UserHelper.MPITEM[32] = {5506,100}
UserHelper.MPITEM[33] = {25688,100}
UserHelper.MPITEM[34] = {25698,100}

--血持续回复药ID及等级限制
UserHelper.sonHPITEM = {}
UserHelper.sonHPITEM[1] = {38485,1}
UserHelper.sonHPITEM[2] = {38507,1}
UserHelper.sonHPITEM[3] = {38528,1}
UserHelper.sonHPITEM[4] = {38486,10}
UserHelper.sonHPITEM[5] = {38508,10}
UserHelper.sonHPITEM[6] = {38529,10}
UserHelper.sonHPITEM[7] = {38487,20}
UserHelper.sonHPITEM[8] = {38509,20}
UserHelper.sonHPITEM[9] = {38530,20}
UserHelper.sonHPITEM[10] = {38488,30}
UserHelper.sonHPITEM[11] = {38510,30}
UserHelper.sonHPITEM[12] = {38531,30}
UserHelper.sonHPITEM[13] = {38489,40}
UserHelper.sonHPITEM[14] = {38511,40}
UserHelper.sonHPITEM[15] = {38532,40}
UserHelper.sonHPITEM[16] = {38490,50}
UserHelper.sonHPITEM[17] = {38512,50}
UserHelper.sonHPITEM[18] = {38533,50}
UserHelper.sonHPITEM[19] = {38491,60}
UserHelper.sonHPITEM[20] = {38513,60}
UserHelper.sonHPITEM[21] = {38534,60}
UserHelper.sonHPITEM[22] = {38492,70}
UserHelper.sonHPITEM[23] = {38514,70}
UserHelper.sonHPITEM[24] = {38535,70}
UserHelper.sonHPITEM[25] = {38493,80}
UserHelper.sonHPITEM[26] = {38515,80}
UserHelper.sonHPITEM[27] = {38536,80}
UserHelper.sonHPITEM[28] = {38494,90}
UserHelper.sonHPITEM[29] = {38516,90}
UserHelper.sonHPITEM[30] = {38537,90}
UserHelper.sonHPITEM[31] = {38495,100}
UserHelper.sonHPITEM[32] = {38517,100}
UserHelper.sonHPITEM[33] = {38538,100}

--蓝持续回复药ID及等级限制
UserHelper.sonMPITEM = {}
UserHelper.sonMPITEM[1] = {38549,1}
UserHelper.sonMPITEM[2] = {38570,1}
UserHelper.sonMPITEM[3] = {38591,1}
UserHelper.sonMPITEM[4] = {38550,10}
UserHelper.sonMPITEM[5] = {38571,10}
UserHelper.sonMPITEM[6] = {38592,10}
UserHelper.sonMPITEM[7] = {38551,20}
UserHelper.sonMPITEM[8] = {38572,20}
UserHelper.sonMPITEM[9] = {38593,20}
UserHelper.sonMPITEM[10] = {38552,30}
UserHelper.sonMPITEM[11] = {38573,30}
UserHelper.sonMPITEM[12] = {38594,30}
UserHelper.sonMPITEM[13] = {38553,40}
UserHelper.sonMPITEM[14] = {38574,40}
UserHelper.sonMPITEM[15] = {38595,40}
UserHelper.sonMPITEM[16] = {38554,50}
UserHelper.sonMPITEM[17] = {38575,50}
UserHelper.sonMPITEM[18] = {38596,50}
UserHelper.sonMPITEM[19] = {38555,60}
UserHelper.sonMPITEM[20] = {38576,60}
UserHelper.sonMPITEM[21] = {38597,60}
UserHelper.sonMPITEM[22] = {38556,70}
UserHelper.sonMPITEM[23] = {38577,70}
UserHelper.sonMPITEM[24] = {38598,70}
UserHelper.sonMPITEM[25] = {38557,80}
UserHelper.sonMPITEM[26] = {38578,80}
UserHelper.sonMPITEM[27] = {38599,80}
UserHelper.sonMPITEM[28] = {38558,90}
UserHelper.sonMPITEM[29] = {38579,90}
UserHelper.sonMPITEM[30] = {38600,90}
UserHelper.sonMPITEM[31] = {38559,100}
UserHelper.sonMPITEM[32] = {38580,100}
UserHelper.sonMPITEM[33] = {38601,100}

--心法
--心法
UserHelper.HeartSkill = {}
--少林
UserHelper.HeartSkill[1] = 245
--武当
UserHelper.HeartSkill[2] = 2551
--华山
UserHelper.HeartSkill[3] = 1403
--恒山
UserHelper.HeartSkill[4] = 2696
--衡山
UserHelper.HeartSkill[5] = 2699
--日月
UserHelper.HeartSkill[6] = 2702
--五仙
UserHelper.HeartSkill[7] = 2216
--逍遥
UserHelper.HeartSkill[8] = 2255
--唐门
UserHelper.HeartSkill[9] = 2563


--挂机配置
UserHelper.configs =
{
	DanderLayer    = 0,        	-- 怒气层数
	CanHPHint    = false,    	-- 使用过血药状态
	CanMPHint    = false,    	-- 使用过蓝药状态
	CanForceHint = false,    	-- 使用过体力药状态
	HPTime,        			-- 使用过血药间隔时间
	MPTime,        			-- 使用过蓝药间隔时间
	HPHintTime,        		-- 血量提醒间隔时间
	HPHintState,       		-- 血量提醒状态
	HPHintSpaceTime,		-- 血量回复间隔时间
	MPHintTime,        		-- 蓝量提醒间隔时间
	ForceHintTime      		-- 体力提醒间隔时间
}


--角色属性信息
UserHelper.PlayerInfo =
{
    --角色自身信息
	HostRet = {},

    -- 当前血量百分比
	HP_PERCENT  = function ()
				  local ret = UserHelper.PlayerInfo.HostRet
				  return math.floor((ret.hp / ret.maxhp) * 100) / 100
				  end,

	-- 当前内力百分比
	MP1_PERCENT = function ()
				  local ret = UserHelper.PlayerInfo.HostRet
				  return math.floor((ret.mp1 / ret.maxmp1) * 100) / 100
				  end,

	-- 当前怒气层数
	MP2         = function ()
				  local ret = UserHelper.PlayerInfo.HostRet
				  return math.floor(ret.mp2 / 100)
				  end,

	-- 当前破绽
	MP3         = function ()
				  local ret = UserHelper.PlayerInfo.HostRet
	              return ret.mp3
				  end,

	-- 当前体力百分比
	MP4_PERCENT = function ()
				  local ret = UserHelper.PlayerInfo.HostRet
				  return math.floor((ret.mp4 / ret.maxmp4) * 100) / 100
				  end,

	--当前等级
	LEVEL       = function ()
				  local ret = UserHelper.PlayerInfo.HostRet
				  return ret.level
				  end,

	--角色门派
	PROF        = function ()
				  local ret = UserHelper.PlayerInfo.HostRet
				  return ret.prof
				  end
}

UserHelper.TickTime = 2000

UserHelper.Cfg =
{
  AutoHP			= false,	--自动回血
	AutoMP			= false,	--自动回蓝
	LimitHP			= 0,		--回血阀值
	LimitMP			= 0,		--回蓝阀值
	HintLowHP		= false,	--低血提示
	HintLowMP		= false,	--低蓝提示
	HintFullSwim		= false,	--满眩晕提示
	HintAngryUp		= false,	--怒气加层提示
	HintLowForce		= false,	--低体力提示
	AutoPrimarySutra	= false,	--自动初级心法
	AutoRelivePet		= false,	--宠物自动复活
	AutoRelivePlayer	= false,	--玩家自动复活
	AutoSummonedPet		= false,	--自动召宠
	AutoDismount		= false,	--自动下马
}

function UserHelper:GetTickTime()
	return UserHelper.TickTime
end

numberlist = {}
numberlist[0] = ""
numberlist[1] = "一"
numberlist[2] = "二"
numberlist[3] = "三"
numberlist[4] = "四"
numberlist[5] = "五"

--提示信息配置（临时）
UserHelper_Text_Config = {}
UserHelper_Text_Config[1] = "^ff0000气血值过低！"
UserHelper_Text_Config[2] = "^ff0000内力值过低！"
UserHelper_Text_Config[3] = "^ff0000体力即将耗尽！"
UserHelper_Text_Config[4] = "^ff0000眩晕槽已满！"
UserHelper_Text_Config[5] = "^c0a020怒气已满一格！"

function UserHelper:OnSetting(cfgTbl)
	UserHelper.Cfg.AutoHP			= cfgTbl["AutoHP"]        		-- 是否自动吃血
	UserHelper.Cfg.AutoMP			= cfgTbl["AutoMP"]        		-- 是否自动吃蓝
	UserHelper.Cfg.LimitHP			= cfgTbl["LimitHP"]       		-- 血下限设置值
	UserHelper.Cfg.LimitMP			= cfgTbl["LimitMP"]       		-- 蓝下限设置值
	UserHelper.Cfg.HintLowHP		= cfgTbl["HintLowHP"]     		-- 回血提示设置值
	UserHelper.Cfg.HintLowMP		= cfgTbl["HintLowMP"]     		-- 回蓝提示设置值
	UserHelper.Cfg.HintFullSwim		= cfgTbl["HintFullSwim"]  		-- 破绽过高提示设置值
	UserHelper.Cfg.HintAngryUp		= cfgTbl["HintAngryUp"]   		-- 怒气满一层设置值
	UserHelper.Cfg.HintLowForce		= cfgTbl["HintLowForce"]  		-- 体力过低提示设置值
	UserHelper.Cfg.AutoPrimarySutra		= cfgTbl["AutoPrimarySutra"]	-- 自动使用心法
	UserHelper.Cfg.AutoRelivePet		= cfgTbl["AutoRelivePet"]		-- 自动复活宠物
	UserHelper.Cfg.AutoRelivePlayer		= cfgTbl["AutoRelivePlayer"]	-- 自动复活玩家
	UserHelper.Cfg.AutoSummonedPet		= cfgTbl["AutoSummonedPet"]		--自动召宠
	UserHelper.Cfg.AutoDismount		= cfgTbl["AutoDismount"]		--自动下马

	--初始化
	UserHelper.configs.DanderLayer       = 0
	UserHelper.configs.HPHintTime        = UserHelperTime:new()
	UserHelper.configs.HPHintSpaceTime   = UserHelperTime:new()
	UserHelper.configs.MPHintTime        = UserHelperTime:new()
	UserHelper.configs.ForceHintTime     = UserHelperTime:new()
	UserHelper.configs.HPTime			 = UserHelperTime:new()
	UserHelper.configs.MPTime			 = UserHelperTime:new()
	UserHelper.configs.CanHPHint         = true
	UserHelper.configs.CanMPHint         = true
	UserHelper.configs.CanForceHint      = true
	UserHelper.configs.HPHintState       = false
	UserHelper.configs.HPHintTime:setPeriod(0)
	UserHelper.configs.MPHintTime:setPeriod(0)
	UserHelper.configs.HPHintSpaceTime:setPeriod(450)
	UserHelper.configs.ForceHintTime:setPeriod(0)
	UserHelper.configs.HPTime:setPeriod(0)
	UserHelper.configs.MPTime:setPeriod(0)
end

function UserHelper:OnTick(deltaTime)
	local delta_time = 2
	UserHelper.PlayerInfo.HostRet = GameApi.GetPlayerFullProp(0)
	if UserHelper.PlayerInfo.HostRet.level >= 20 then
		--血提示间隔计时
		if GameApi.IsFighting() then
			if UserHelper.configs.HPHintTime:IncTime(delta_time) then UserHelper.configs.CanHPHint = true end
			if UserHelper.configs.MPHintTime:IncTime(delta_time) then UserHelper.configs.CanMPHint = true end
			if UserHelper.configs.ForceHintTime:IncTime(delta_time) then UserHelper.configs.CanForceHint = true end
			--血少提示
			UserHelper:HintLowHP(delta_time)

			--蓝少提示
			UserHelper:HintLowMP()

			--以下3项提示要求玩家等级大于10
			if UserHelper.PlayerInfo.LEVEL() > 10 then
			--破绽提示
			UserHelper:HintFullSwim()

			--怒气满提示
			UserHelper:HintAngryUp()

			--体力少提示
			UserHelper:HintLowForce()
			end

			--[[
			--自动吃血
			if UserHelper.configs.HPTime:IncTime(delta_time) then UserHelper:AutoHP() end

			--自动吃蓝
			if UserHelper.configs.MPTime:IncTime(delta_time) then UserHelper:AutoMP() end
			--]]
		end

			--自动召宠
			--UserHelper:SummonPet()

			--自动使用心法
			--UserHelper:AutoPrimarySutra()
	end
end

---------------------------------------
--间隔计时
---------------------------------------
UserHelperTime =
{
	m_Period = 0,
	m_Time 	 = 0
}

function UserHelperTime:new(o)
	o = o or {}
	setmetatable(o, self)
	self.__index = self
	return o
end

function UserHelperTime:setPeriod(step)
	m_Period = step
	return m_Period
end

function UserHelperTime:IncTime(step)
	if self.m_Time <= m_Period then self.m_Time = self.m_Time + step end
	return (self.m_Time >= m_Period)
end

function UserHelperTime:Reset()
	self.m_Time = 0
end
---------------------------------------
--调用自动回血
---------------------------------------
function UserHelper:AutoHP()
	if UserHelper.Cfg.AutoHP then
		if UserHelper.Cfg.LimitHP >= UserHelper.PlayerInfo.HP_PERCENT() then
			UserHelper:UsePotin(UserHelper.HPITEM)
			UserHelper.configs.HPTime:Reset()
			UserHelper.configs.HPTime:setPeriod(15)
			return true
		end
	end
end

---------------------------------------
--调用自动回蓝
---------------------------------------
function UserHelper:AutoMP()
	if UserHelper.Cfg.AutoMP then
		if UserHelper.Cfg.LimitMP >= UserHelper.PlayerInfo.MP1_PERCENT() then
			UserHelper:UsePotin(UserHelper.MPITEM)
			UserHelper.configs.MPTime:Reset()
			UserHelper.configs.MPTime:setPeriod(15)
			return true
		end
	end
end

---------------------------------------
--调用显示血量低提示
---------------------------------------
function UserHelper:HintLowHP(Time)
	if UserHelper.Cfg.HintLowHP then
		if 0.2 <= UserHelper.PlayerInfo.HP_PERCENT() then
			UserHelper.configs.HPHintState = false
		else
			if UserHelper.configs.HPHintState then
				if UserHelper.configs.HPHintSpaceTime:IncTime(Time) then UserHelper:RestHPHintSpaceTime() end
				return true
			end
			if UserHelper.configs.CanHPHint then UserHelper:RestHPHintTime() end
		end
	end
	return false
end

--重置间隔时间
function UserHelper:RestHPHintSpaceTime()
	UserHelper:ShowHint(1)
	UserHelper.configs.HPHintSpaceTime:Reset()
	UserHelper.configs.HPHintSpaceTime:setPeriod(15)
end

--重置提示时间
function UserHelper:RestHPHintTime()
	UserHelper:ShowHint(1)
	UserHelper.configs.HPHintTime:Reset()
	UserHelper.configs.HPHintTime:setPeriod(2)
	UserHelper.configs.CanHPHint = false
	UserHelper.configs.HPHintState = true
end

---------------------------------------
--调用显示内力低提示
---------------------------------------
function UserHelper:HintLowMP()
	if UserHelper.Cfg.HintLowMP and UserHelper.configs.CanMPHint then
		if 0.2 >= UserHelper.PlayerInfo.MP1_PERCENT() then
			UserHelper:ShowHint(2)
			UserHelper.configs.MPHintTime:Reset()
			UserHelper.configs.CanMPHint = false
			UserHelper.configs.MPHintTime:setPeriod(2)
			return true
		end
	end
	return false
end

---------------------------------------
--调用怒气满提示
---------------------------------------
function UserHelper:HintAngryUp()
	if UserHelper.Cfg.HintAngryUp then
		if UserHelper.PlayerInfo.MP2() > UserHelper.configs.DanderLayer
		and UserHelper.PlayerInfo.MP2() <= 5 then
			UserHelper.configs.DanderLayer = UserHelper.configs.DanderLayer + 1
			UserHelper:ShowHint(5)
			return true
		end
	end
	return false
end

---------------------------------------
--调用破绽满提示
---------------------------------------
function UserHelper:HintFullSwim()
	if UserHelper.Cfg.HintFullSwim then
		if 80 <= UserHelper.PlayerInfo.MP3() then
			UserHelper:ShowHint(4)
			return true
		end
	end
	return false
end

---------------------------------------
--调用显示体力低提示
---------------------------------------
function UserHelper:HintLowForce()
	if UserHelper.Cfg.HintLowForce and UserHelper.configs.CanForceHint then
		if 0.2 >= UserHelper.PlayerInfo.MP4_PERCENT() then
			UserHelper:ShowHint(3)
			UserHelper.configs.ForceHintTime:Reset()
			UserHelper.configs.CanForceHint = false
			UserHelper.configs.ForceHintTime:setPeriod(2)
			return true
		end
	end
	return false
end

---------------------------------------
--使用心法
---------------------------------------
function UserHelper:AutoPrimarySutra()
	if AutoPrimarySutra and UserHelper.PlayerInfo.PROF() ~= 0 then
		UserHelper:UseHeartSkill(UserHelper.HeartSkill)
	end
end

---------------------------------------
--显示提示函数
---------------------------------------
function UserHelper:ShowHint(HintID)
	local HintInfo = UserHelper_Text_Config[HintID]
	if HintInfo then
		GameApi.AddSystemHint(HintInfo)
	end
end

---------------------------------------
--使用药品
---------------------------------------
function UserHelper:UsePotin(itemtabl)
	for i = #itemtabl, 1, -1 do
		if GameApi.HaveItem(itemtabl[i][1]) then
			if UserHelper.PlayerInfo.LEVEL() >= itemtabl[i][2] then
				GameApi.UseItemByID(itemtabl[i][1])
				return true
			end
		end
	end
	return false
end

---------------------------------------
--使用心法
---------------------------------------
function UserHelper:UseHeartSkill(skilltbl)
	if GameApi.HostHasSutra() == 0 then
		GameApi.UseNormalSkillByID(skilltbl[UserHelper.PlayerInfo.PROF()])
		return true
	end
	return false
end

---------------------------------------
--召唤宠物
---------------------------------------
function UserHelper:SummonPet()
	if UserHelper.Cfg.AutoSummonedPet and not GameApi.HasSummonedPet() then
		GameApi.SummonPet(-1)
		return true
	end
	return false
end
