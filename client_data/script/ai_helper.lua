--[[#encode ansi]]
--[[#tag push auto]]
--dofile("helper_util.lua")

AI_Helper = {}
AI_Helper.Player	 = {}
AI_Helper.ValidNum	 = 2
AI_Helper.GlobalFlag = 0

math.randomseed(os.time())
math.random()

function AI_Helper:Copy(sPlayer)
	if sPlayer == nil then
		return nil
	end

	local sTbl={}
	for k, v in pairs(sPlayer) do
		if type(v) == --[[!AUTO_1]][====[table]====] then
			sTbl[k] = AI_Helper:Copy(v)
		else
			sTbl[k] = v
		end
	end
	local mt = getmetatable(sPlayer)
	setmetatable(sTbl, mt)
    return sTbl
end

function AI_Helper:Init(idPlayer,idxAI)
end

function AI_Helper:Start(idPlayer,idxAI)
	if AI_Helper.Player[idPlayer] then
		AI_Helper:Stop(idPlayer)
	end

	--随机AI
	if idxAI < 0 then
		idxAI = math.random(1,AI_Helper.ValidNum)
	end

	--默认AI
	if AI_Helper.Player[idxAI] == nil then
		idxAI = 0
	end

	--创建玩家AI
	AI_Helper.Player[idPlayer] = AI_Helper:Copy(AI_Helper.Player[idxAI])
	AI_Helper.Player[idPlayer].PlayerId = idPlayer

	AI_Helper.Player[idPlayer].OnStart(AI_Helper.Player[idPlayer])
end

function AI_Helper:Reset(idPlayer)
	if AI_Helper.Player[idPlayer] then
		AI_Helper.Player[idPlayer].OnReset(AI_Helper.Player[idPlayer])
	end
end

function AI_Helper:Tick(idPlayer,dwPeriod)
	if AI_Helper.Player[idPlayer] then
		AI_Helper.Player[idPlayer].OnTick(AI_Helper.Player[idPlayer],dwPeriod)
	end
end

function AI_Helper:Stop(idPlayer)
	if AI_Helper.Player[idPlayer] then
		AI_Helper.Player[idPlayer].OnStop(AI_Helper.Player[idPlayer])
		AI_Helper.Player[idPlayer] = nil
	end
end

-------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------
PlayerState =
{
	STATE_IDLE			= 0,	--空闲
	STATE_HEALHP		= 1,	--补血
	STATE_HEALMP		= 2,	--补蓝
	STATE_PICKLOOT		= 3,	--拾取
	STATE_SELMONSTER	= 4,	--选怪
	STATE_FIGHTING		= 5,	--战斗
	STATE_DEAD			= 6,	--死亡
	STATE_ACTION		= 7,	--动作
	STATE_PATH			= 8,	--寻径

	IsTimeLimitState = function(state)
		if state ~= STATE_FIGHTING then
			return true
		end
		return false
	end
}

-------------------------------------------------------------------------------------------------
--默认策略(无操作,打酱油)
-------------------------------------------------------------------------------------------------
AI_Helper.Player[0] =
{
	-------------------------------------------------------------------
	AIIndex				= 0,			--AI索引
	PlayerId			= 0,			--玩家ID
	OptTimer			= nil,			--操作计时
	IsStart				= false,		--是否已经启动
	State				= 0,			--当前状态
	SceneId				= 4,			--场景ID
	IdleTime			= 3000,			--休闲时间
	-------------------------------------------------------------------
	--开始
	OnStart = function(this)
		if this.IsStart == false then
			this.IsStart = true
			this.OptTimer = ECTimer:New()
			this.OptTimer:SetPeriod(this.IdleTime)
		end
	end,

	--重置
	OnReset = function(this)
		this.OptTimer:Reset()
		this.State = 0
	end,

	--更新
	OnTick = function(this,dwPeriod)
		if this.OptTimer:IsValid() then
			if this.OptTimer:IsEnd() then
				this.OptTimer:Reset()
			else
				this.OptTimer:IncTime(dwPeriod)
			end
		end
	end,

	--停止
	OnStop = function(this)
		this.OptTimer = nil
		this.State    = 0
		this.IsStart  = false
	end,
}

-------------------------------------------------------------------------------------------------
--观光策略
-------------------------------------------------------------------------------------------------
AI_Helper.Player[1] =
{
	-------------------------------------------------------------------
	AIIndex				= 1,			--AI索引
	PlayerId			= 0,			--玩家ID
	PropTbl				= nil,			--玩家属性表
	OptTimer			= nil,			--操作计时
	IsStart				= false,		--是否已经启动
	State				= 0,			--当前状态
	SearchTime			= 15000,		--寻径时间
	ActionTime			= 4000,			--Pose时间
	IdleTime			= 2000,			--休闲时间
	HpItem				= 3619,			--回血物品
	HpRatio				= 0.4,			--回血阀值
	HpTime				= 2000,			--回血操作时间
	MpItem				= 5217,			--回蓝物品
	MpRatio				= 0.4,			--回蓝阀值
	MpTime				= 2000,			--回蓝操作时间
	SceneId				= 4,			--场景ID(福州城)
	SceneObjPos			= {},			--场景物体位置
	-------------------------------------------------------------------
	DebugRobot = function(this)
		if GameApi.IsHostPlayerDead() then
			GameApi.RunConsoleCmd(--[[!AUTO_2]][====[d_cmd 2048]====])
		end

		--获取药品
		--GameApi.RunConsoleCmd("d_cmd 2001 3619 200")
		--GameApi.RunConsoleCmd("d_cmd 2001 5217 200")

		--随机寻径时间
		this.SearchTime = this.SearchTime + math.random(this.SearchTime)
		this.ActionTime = this.ActionTime + math.random(this.ActionTime)

		--随机位置
		local sCmd = nil
		while sCmd ==nil do
			local iIdx = math.random(#this.SceneObjPos)
			local bIn  = GameApi.IsPosInPassMap(this.SceneObjPos[iIdx].X,this.SceneObjPos[iIdx].Z)
			if bIn then
				sCmd = string.format(--[[!AUTO_3]][====[d_cmd 2008 %d %d %d]====],this.SceneId,this.SceneObjPos[iIdx].X,this.SceneObjPos[iIdx].Z)
			end
		end

		GameApi.RunConsoleCmd(sCmd)
	end,

	--开始
	OnStart = function(this)
		if this.IsStart == false then
			this.IsStart = true
			this.OptTimer = ECTimer:New()
			this.OptTimer:SetPeriod(this.IdleTime)

			this.InitObjInfo(this)
			this.DebugRobot(this)
		end
	end,

	--重置
	OnReset = function(this)
		this.OptTimer:Reset()
		this.State = 0
	end,

	--更新
	OnTick = function(this,dwPeriod)
		if this.OptTimer:IsValid() then
			if this.OptTimer:IsEnd() then
				this.OptTimer:Reset()

				if this.State == PlayerState.STATE_PATH then
					this.StopAutoMove(this)
				elseif this.State == PlayerState.STATE_ACTION then
					this.SearchPath(this)
				elseif this.State == PlayerState.STATE_IDLE then
					this.PlayAction(this)
				end

			else
				this.OptTimer:IncTime(dwPeriod)
			end
		end

		this.PropTbl = GameApi.GetPlayerFullProp(0)
		this.HealHp(this)
		this.HealMp(this)
	end,

	--停止
	OnStop = function(this)
		this.OptTimer = nil
		this.State    = 0
		this.IsStart  = false
	end,

	--当前场景物体信息
	InitObjInfo = function(this)
		for k,v in pairs(ObjInfo) do
			if v.SID == this.SceneId then
				local iIdx = #this.SceneObjPos + 1
				this.SceneObjPos[iIdx] = {}
				this.SceneObjPos[iIdx].Id = k
				this.SceneObjPos[iIdx].X  = v.x
				this.SceneObjPos[iIdx].Y  = v.y
				this.SceneObjPos[iIdx].Z  = v.z
			end
		end
	end,

	--停止寻径
	StopAutoMove = function(this)
		this.State = PlayerState.STATE_IDLE
		this.OptTimer:Reset()
		this.OptTimer:SetPeriod(this.IdleTime)
		GameApi.StopAutoMove()
	end,

	--自动寻径
	SearchPath = function(this)
		this.State = PlayerState.STATE_PATH
		this.OptTimer:Reset()
		this.OptTimer:SetPeriod(this.SearchTime)

		local bIn  = false
		local iIdx = 0
		while bIn == false do
			iIdx = math.random(#this.SceneObjPos)
			bIn  = GameApi.IsPosInPassMap(this.SceneObjPos[iIdx].X,this.SceneObjPos[iIdx].Z)
		end
		GameApi.AutoSearchPathWithScriptCB(this.SceneObjPos[iIdx].X,this.SceneObjPos[iIdx].Y,this.SceneObjPos[iIdx].Z,this.SceneId)
	end,

	--休闲动作
	PlayAction = function(this)
		this.State = PlayerState.STATE_ACTION
		this.OptTimer:Reset()
		this.OptTimer:SetPeriod(this.ActionTime)

		local iPose = math.random(12) - 1
		GameApi.PlayEmotePos(iPose)
	end,

	--补血逻辑
	HealHp = function(this)
		local hp_ratio = this.PropTbl["hp"] / this.PropTbl["maxhp"]
		if hp_ratio <= this.HpRatio then
			GameApi.UseItemByID(this.HpItem)
		end
	end,

	--补蓝逻辑
	HealMp = function(this)
		local mp_ratio = this.PropTbl["mp1"] / this.PropTbl["maxmp1"]
		if mp_ratio <= this.MpRatio then
			GameApi.UseItemByID(this.MpItem)
		end
	end,
}

-------------------------------------------------------------------------------------------------
--仙霞岭杀怪策略
-------------------------------------------------------------------------------------------------
AI_Helper.Player[2] =
{
	-------------------------------------------------------------------
	AIIndex				= 2,			--AI索引
	PropTbl				= nil,			--玩家属性表
	PlayerId			= 0,			--玩家ID
	OptTimer			= nil,			--操作计时
	IsStart				= false,		--是否已经启动
	HpItem				= 3619,			--回血物品
	HpRatio				= 0.5,			--回血阀值
	MpItem				= 5217,			--回蓝物品
	MpRatio				= 0.5,			--回蓝阀值
	State				= 0,			--当前状态
	SelTarget			= 0,			--当前选中目标ID
	IdleTime			= 5000,			--休闲时间
	MapId				= 4,			--地图ID
	-------------------------------------------------------------------
	DebugRobot = function(this)
		--原地复活
		if GameApi.IsHostPlayerDead() then
			GameApi.RunConsoleCmd(--[[!AUTO_4]][====[d_cmd 2048]====])
		end

		--补血补蓝
		GameApi.UseItemByID(this.HpItem)
		GameApi.UseItemByID(this.MpItem)

		--随机点
		local pos_tbl =
		{
			{X=54, Y=216},
			{X=92, Y=163},
			{X=37, Y=91 },
			{X=67, Y=49 },
			{X=149,Y=42 },
			{X=242,Y=63 },
			{X=203,Y=115},
			{X=179,Y=151},
		}
		local map_offset = {X=-128,Y=-128}

		--随机怪群(仙霞岭)
		AI_Helper.GlobalFlag = AI_Helper.GlobalFlag + 1
		local sCmd = string.format(--[[!AUTO_5]][====[d_cmd 2008 %d %d %d]====],this.MapId,pos_tbl[AI_Helper.GlobalFlag].X+map_offset.X,pos_tbl[AI_Helper.GlobalFlag].Y+map_offset.Y)
		if AI_Helper.GlobalFlag >= #pos_tbl then
			AI_Helper.GlobalFlag = 0
		end

		--随机位置点
		GameApi.RunConsoleCmd(sCmd)

		--随机怪
		GameApi.FlyToRandMonster(this.MapId)

		--初始休闲
		this.State = PlayerState.STATE_IDLE
		this.OptTimer:Reset()
		this.OptTimer:SetPeriod(this.IdleTime)
	end,

	--开始
	OnStart = function(this)
		if this.IsStart == false then
			this.IsStart = true
			this.OptTimer = ECTimer:New()
			this.DebugRobot(this)
		end
	end,

	--重置
	OnReset = function(this)
		this.OptTimer:Reset()
		this.State = 0
	end,

	--更新
	OnTick = function(this,dwPeriod)
		if this.OptTimer:IsValid() then
			if this.OptTimer:IsEnd() then
				this.OptTimer:Reset()
			else
				this.OptTimer:IncTime(dwPeriod)
				return
			end
		end

		this.PropTbl   = GameApi.GetPlayerFullProp(0)
		this.SelTarget = this.PropTbl["sel_target"]

		if this.PropTbl["is_dead"] == true then
			this.Revive(this)
			return
		else
			this.HealHp(this)
			this.HealMp(this)
		end

		if this.State == PlayerState.STATE_FIGHTING then
			if this.SelTarget <= 0 or GameApi.IsMonsterValid(this.SelTarget) == false then
				this.State = PlayerState.STATE_IDLE
				this.OptTimer:Reset()
				this.OptTimer:SetPeriod(this.IdleTime)
			else
				if GameApi.IsAttacking() == false then
					GameApi.AutoAttack()
				end
			end
		else
			this.Fighting(this)
		end
	end,

	--停止
	OnStop = function(this)
		this.OptTimer = nil
		this.State    = 0
		this.IsStart  = false
	end,

	--战斗
	Fighting = function(this)
		if this.State == PlayerState.STATE_IDLE then
			if this.SelTarget <= 0 or GameApi.IsMonsterValid(this.SelTarget) == false then
				if this.SelTarget <= 0 then
					local npc_num,npc_tbl = GameApi.GetAttackMeList()
					if npc_num > 0 then
						local idx = math.random(1,npc_num)
						this.SelTarget = GameApi.AutoClickMonster(npc_tbl[idx])
					end
				end

				if this.SelTarget <= 0 then
					local npc_num,npc_tbl = GameApi.GetCanAttackNpcList()
					if npc_num > 0 then
						local idx = math.random(1,npc_num)
						this.SelTarget = GameApi.AutoClickMonster(npc_tbl[idx])
					end
				end
			end

			if this.SelTarget > 0 then
				GameApi.AutoAttack()
				this.State = PlayerState.STATE_FIGHTING
			else
				this.State = PlayerState.STATE_IDLE
				this.OptTimer:Reset()
				this.OptTimer:SetPeriod(this.IdleTime)
			end
		end
	end,

	--补血逻辑
	HealHp = function(this)
		local hp_ratio = this.PropTbl["hp"] / this.PropTbl["maxhp"]
		if hp_ratio <= this.HpRatio and this.PropTbl["is_dead"] == false then
			if GameApi.UseItemByID(this.HpItem) == false then
				if GameApi.GetItemNumByID(this.HpItem) <= 0 then
					local sCmd = string.format(--[[!AUTO_6]][====[d_cmd 2001 %d 100]====],this.HpItem)
					GameApi.RunConsoleCmd(sCmd)
				else
					LogPrint(--[[!AUTO_7]][====[AI::HealHp Error.
]====])
				end
			end
		end
	end,

	--补蓝逻辑
	HealMp = function(this)
		local mp_ratio = this.PropTbl["mp1"] / this.PropTbl["maxmp1"]
		if mp_ratio <= this.MpRatio and this.PropTbl["is_dead"] == false then
			if GameApi.UseItemByID(this.MpItem) == false then
				if GameApi.GetItemNumByID(this.MpItem) <= 0 then
					local sCmd = string.format(--[[!AUTO_8]][====[d_cmd 2001 %d 100]====],this.MpItem)
					GameApi.RunConsoleCmd(sCmd)
				else
					LogPrint(--[[!AUTO_9]][====[AI::HealMp Error.
]====])
				end
			end
		end
	end,

	--自动复活
	Revive = function(this)
		if this.PropTbl["is_dead"] == true then
			GameApi.RunConsoleCmd(--[[!AUTO_10]][====[d_cmd 2048]====])

			this.State = PlayerState.STATE_IDLE
			this.OptTimer:Reset()
			this.OptTimer:SetPeriod(this.ReliveTime)

			--补血补蓝
			GameApi.UseItemByID(this.HpItem)
			GameApi.UseItemByID(this.MpItem)

			this.SelTarget = 0
		end
	end
}

-------------------------------------------------------------------------------------------------
--杀怪策略使用技能
-------------------------------------------------------------------------------------------------
AI_Helper.Player[3] =
{
	-------------------------------------------------------------------
	AIIndex				= 3,			--AI索引
	PropTbl				= nil,			--玩家属性表
	PlayerId			= 0,			--玩家ID
	OptTimer			= nil,			--操作计时
	SkillTimer			= nil,			--释放技能计时
	IsStart				= false,		--是否已经启动
	HpItem				= 3619,			--回血物品
	HpRatio				= 0.5,			--回血阀值
	MpItem				= 5217,			--回蓝物品
	MpRatio				= 0.5,			--回蓝阀值
	State				= 0,			--当前状态
	SelTarget			= 0,			--当前选中目标ID
	IdleTime			= 5000,			--休闲时间
	SkillInterval       = 2000,			--技能释放间隔
	MapId				= 4,			--地图ID
	-------------------------------------------------------------------
	DebugRobot = function(this)
		--原地复活
		if GameApi.IsHostPlayerDead() then
			GameApi.RunConsoleCmd(--[[!AUTO_11]][====[d_cmd 2048]====])
		end

		--补血补蓝
		GameApi.UseItemByID(this.HpItem)
		GameApi.UseItemByID(this.MpItem)

		--随机点
		local pos_tbl =
		{
			{X=54, Y=216},
			{X=92, Y=163},
			{X=37, Y=91 },
			{X=67, Y=49 },
			{X=149,Y=42 },
			{X=242,Y=63 },
			{X=203,Y=115},
			{X=179,Y=151},
		}
		local map_offset = {X=-128,Y=-128}

		--打开pk模式
		GameApi.SetPKMask(1)

		AI_Helper.GlobalFlag = AI_Helper.GlobalFlag + 1
		local sCmd = string.format(--[[!AUTO_12]][====[d_cmd 2008 %d %d %d]====],this.MapId,pos_tbl[AI_Helper.GlobalFlag].X+map_offset.X,pos_tbl[AI_Helper.GlobalFlag].Y+map_offset.Y)
		if AI_Helper.GlobalFlag >= #pos_tbl then
			AI_Helper.GlobalFlag = 0
		end

		--随机位置点
		GameApi.RunConsoleCmd(sCmd)

		--随机怪
		GameApi.FlyToRandMonster(this.MapId)

		--初始休闲
		this.State = PlayerState.STATE_IDLE
		this.OptTimer:Reset()
		this.SkillTimer:Reset()
		this.OptTimer:SetPeriod(this.IdleTime)
		this.SkillTimer:SetPeriod(this.SkillInterval)

	end,

	--开始
	OnStart = function(this)
		if this.IsStart == false then
			this.IsStart = true
			this.OptTimer = ECTimer:New()
			this.SkillTimer = ECTimer:New()
			this.DebugRobot(this)
		end
	end,

	--重置
	OnReset = function(this)
		this.OptTimer:Reset()
		this.SkillTimer:Reset()
		this.State = 0
	end,

	--更新
	OnTick = function(this,dwPeriod)


		if this.SkillTimer:IsValid() then

			if this.SkillTimer:IsEnd() then
				this.SkillTimer:Reset()
				this.SkillTimer:SetPeriod(this.SkillInterval)
				if this.State == PlayerState.STATE_FIGHTING then
					GameApi.UseRandomSkill()

				end

			else
				this.SkillTimer:IncTime(dwPeriod)
			end
		else
			this.SkillTimer:Reset()
			this.SkillTimer:SetPeriod(this.SkillInterval)
		end
		if this.OptTimer:IsValid() then
			if this.OptTimer:IsEnd() then
				this.OptTimer:Reset()
			else
				this.OptTimer:IncTime(dwPeriod)
				return
			end
		end

		this.PropTbl   = GameApi.GetPlayerFullProp(0)
		this.SelTarget = this.PropTbl["sel_target"]

		if this.PropTbl["is_dead"] == true then
			this.Revive(this)
			return
		else
			this.HealHp(this)
			this.HealMp(this)
		end

		if this.State == PlayerState.STATE_FIGHTING then
			if this.SelTarget <= 0 or GameApi.IsMonsterValid(this.SelTarget) == false then
				this.State = PlayerState.STATE_IDLE
				this.OptTimer:Reset()
				this.OptTimer:SetPeriod(this.IdleTime)
			else
				if GameApi.IsAttacking() == false then
					GameApi.AutoAttack()

				else
				    --GameApi.UseRandomSkill()
				end
			end
		else
			this.Fighting(this)
		end
	end,

	--停止
	OnStop = function(this)
		this.OptTimer = nil
		this.State    = 0
		this.IsStart  = false
	end,

	--战斗
	Fighting = function(this)
		if this.State == PlayerState.STATE_IDLE then
			if this.SelTarget <= 0 or GameApi.IsMonsterValid(this.SelTarget) == false then
				if this.SelTarget <= 0 then
					local npc_num,npc_tbl = GameApi.GetAttackMeList()
					if npc_num > 0 then
						local idx = math.random(1,npc_num)
						this.SelTarget = GameApi.AutoClickMonster(npc_tbl[idx])
					end
				end

				if this.SelTarget <= 0 then
					local npc_num,npc_tbl = GameApi.GetCanAttackNpcList()
					if npc_num > 0 then
						local idx = math.random(1,npc_num)
						this.SelTarget = GameApi.AutoClickMonster(npc_tbl[idx])
					end
				end
			end

			if this.SelTarget > 0 then
				GameApi.AutoAttack()
				this.State = PlayerState.STATE_FIGHTING

			else
				this.State = PlayerState.STATE_IDLE
				this.OptTimer:Reset()
				this.OptTimer:SetPeriod(this.IdleTime)
			end
		end
	end,


	--补血逻辑
	HealHp = function(this)
		local hp_ratio = this.PropTbl["hp"] / this.PropTbl["maxhp"]
		if hp_ratio <= this.HpRatio and this.PropTbl["is_dead"] == false then
			if GameApi.UseItemByID(this.HpItem) == false then
				if GameApi.GetItemNumByID(this.HpItem) <= 0 then
					local sCmd = string.format(--[[!AUTO_13]][====[d_cmd 2001 %d 100]====],this.HpItem)
					GameApi.RunConsoleCmd(sCmd)
				else
					LogPrint(--[[!AUTO_14]][====[AI::HealHp Error.
]====])
				end
			end
		end
	end,

	--补蓝逻辑
	HealMp = function(this)
		local mp_ratio = this.PropTbl["mp1"] / this.PropTbl["maxmp1"]
		if mp_ratio <= this.MpRatio and this.PropTbl["is_dead"] == false then
			if GameApi.UseItemByID(this.MpItem) == false then
				if GameApi.GetItemNumByID(this.MpItem) <= 0 then
					local sCmd = string.format(--[[!AUTO_15]][====[d_cmd 2001 %d 100]====],this.MpItem)
					GameApi.RunConsoleCmd(sCmd)
				else
					LogPrint(--[[!AUTO_16]][====[AI::HealMp Error.
]====])
				end
			end
		end
	end,

	--自动复活
	Revive = function(this)
		if this.PropTbl["is_dead"] == true then
			GameApi.RunConsoleCmd(--[[!AUTO_17]][====[d_cmd 2048]====])

			this.State = PlayerState.STATE_IDLE
			this.OptTimer:Reset()
			this.OptTimer:SetPeriod(this.ReliveTime)

			--补血补蓝
			GameApi.UseItemByID(this.HpItem)
			GameApi.UseItemByID(this.MpItem)

			this.SelTarget = 0
		end
	end
}


-------------------------------------------------------------------------------------------------
--杀怪策略使用技能
-------------------------------------------------------------------------------------------------
AI_Helper.Player[4] =
{
	-------------------------------------------------------------------
	AIIndex				= 3,			--AI索引
	PropTbl				= nil,			--玩家属性表
	PlayerId			= 0,			--玩家ID
	OptTimer			= nil,			--操作计时
	SkillTimer			= nil,			--释放技能计时
	IsStart				= false,		--是否已经启动
	HpItem				= 3619,			--回血物品
	HpRatio				= 0.5,			--回血阀值
	MpItem				= 5217,			--回蓝物品
	MpRatio				= 0.5,			--回蓝阀值
	State				= 0,			--当前状态
	SelTarget			= 0,			--当前选中目标ID
	IdleTime			= 5000,			--休闲时间
	SkillInterval       = 2000,			--技能释放间隔
	MoveInterval        = 30000,			--自动移动时间
	TargetInterval      = 0,		    --攻击玩家切换间隔根,据释放技能次数
	MapId				= 4,			--地图ID

	-------------------------------------------------------------------
	DebugRobot = function(this)
		--原地复活
		if GameApi.IsHostPlayerDead() then
			GameApi.RunConsoleCmd(--[[!AUTO_18]][====[d_cmd 2048]====])
		end

		--补血补蓝
		GameApi.UseItemByID(this.HpItem)
		GameApi.UseItemByID(this.MpItem)

			--随机点
		local pos_tbl =
		{
			{X=50,Y=-30},
			{X=67,Y=-16},
			{X=-79,Y=-59},
			{X=-52,Y=91},
			{X=29,Y=155},
			{X=156,Y=-3},
			{X=130,Y=-27},
			{X=-91,Y=-2},
			{X=52,Y=-140},
			{X=50,Y=-30},
			{X=-61,Y=-82},
			{X=-59,Y=-30},
			{X=156,Y=-3},
			{X=52,Y=-140},
		}
		local map_offset = {X=1,Y=1}

		--打开pk模式
		GameApi.SetPKMask(1)

		AI_Helper.GlobalFlag = AI_Helper.GlobalFlag + 1
		local posIndex = math.random(#pos_tbl)
		--local sCmd = string.format("d_cmd 2008 %d %d %d",this.MapId,pos_tbl[AI_Helper.GlobalFlag].X+map_offset.X,pos_tbl[AI_Helper.GlobalFlag].Y+map_offset.Y)
		local sCmd = string.format(--[[!AUTO_19]][====[d_cmd 2008 %d %d %d]====],this.MapId,pos_tbl[posIndex].X+map_offset.X,pos_tbl[posIndex].Y+map_offset.Y)
		if AI_Helper.GlobalFlag >= #pos_tbl then
			AI_Helper.GlobalFlag = 0
		end

		--随机位置点
		GameApi.RunConsoleCmd(sCmd)

		--随机怪
		GameApi.FlyToRandMonster(this.MapId)

		--初始休闲
		this.State = PlayerState.STATE_IDLE
		this.OptTimer:Reset()
		this.SkillTimer:Reset()
		this.OptTimer:SetPeriod(this.IdleTime)
		this.SkillTimer:SetPeriod(this.SkillInterval)

	end,

	--开始
	OnStart = function(this)
		if this.IsStart == false then
			this.IsStart = true
			this.OptTimer = ECTimer:New()
			this.SkillTimer = ECTimer:New()
			this.DebugRobot(this)
		end
	end,

	--重置
	OnReset = function(this)
		this.OptTimer:Reset()
		this.SkillTimer:Reset()
		this.State = 0
	end,

	--更新
	OnTick = function(this,dwPeriod)


		if this.SkillTimer:IsValid() then
			if this.SkillTimer:IsEnd() then
				this.SkillTimer:Reset()
				this.SkillTimer:SetPeriod(this.SkillInterval)
				if this.State == PlayerState.STATE_FIGHTING then
					GameApi.UseRandomSkill()
					this.TargetInterval = this.TargetInterval+1;
				end

			else
				this.SkillTimer:IncTime(dwPeriod)
			end
		else
			this.SkillTimer:Reset()
			this.SkillTimer:SetPeriod(this.SkillInterval)
		end
		if this.OptTimer:IsValid() then
			if this.OptTimer:IsEnd() then
				this.OptTimer:Reset()
			else
				this.OptTimer:IncTime(dwPeriod)
				return
			end
		end

		this.PropTbl   = GameApi.GetPlayerFullProp(0)
		this.SelTarget = this.PropTbl["sel_target"]

		if this.PropTbl["is_dead"] == true then
			this.Revive(this)
			return
		else
			this.HealHp(this)
			this.HealMp(this)
		end


		if this.TargetInterval > 3 then
			this.State = PlayerState.STATE_IDLE
			this.OptTimer:Reset()
			this.OptTimer:SetPeriod(this.IdleTime)
			this.TargetInterval = 0
			this.SelTarget = 0

			--自动寻径
			local findpos_tbl =
			{
				{X=50,Y=-30},
				{X=67,Y=-16},
				{X=-79,Y=-59},
				{X=-52,Y=91},
				{X=29,Y=155},
				{X=156,Y=-3},
				{X=130,Y=-27},
				{X=-91,Y=-2},
				{X=52,Y=-140},
				{X=50,Y=-30},
				{X=-61,Y=-82},
				{X=-59,Y=-30},
				{X=156,Y=-3},
				{X=52,Y=-140},
			}
			this.OptTimer:SetPeriod(this.MoveInterval)
			local iIdx = math.random(#findpos_tbl)
			local iPose = math.random(12) - 1
			GameApi.PlayEmotePos(iPose)
			--GameApi.AutoSearchPathWithScriptCB(findpos_tbl[iIdx].X,0,findpos_tbl[iIdx].Y,this.MapId)
			local sCmd = string.format(--[[!AUTO_20]][====[d_cmd 2008 %d %d %d]====],this.MapId,findpos_tbl[iIdx].X,findpos_tbl[iIdx].Y)
			GameApi.RunConsoleCmd(sCmd)
			--/
		end

		if this.State == PlayerState.STATE_FIGHTING then
			if this.SelTarget <= 0 or GameApi.IsObjectValid(this.SelTarget) == false then
				this.State = PlayerState.STATE_IDLE
				this.OptTimer:Reset()
				this.OptTimer:SetPeriod(this.IdleTime)
			else
				if GameApi.IsAttacking() == false then
					GameApi.AutoAttack()

				else
				    --GameApi.UseRandomSkill()
				end
			end
		else
			this.Fighting(this)
		end
	end,

	--停止
	OnStop = function(this)
		this.OptTimer = nil
		this.State    = 0
		this.IsStart  = false
	end,

	--战斗
	Fighting = function(this)
		if this.State == PlayerState.STATE_IDLE then
			if this.SelTarget <= 0 or GameApi.IsObjectValid(this.SelTarget) == false then
				if this.SelTarget <= 0 then
					local player_num,player_tbl = GameApi.GetNearPlayerList()
					if player_num > 0 then
						local idx = math.random(1,player_num)
						this.SelTarget = GameApi.AutoClickPlayer(player_tbl[idx])
					end
				end

			end

			if this.SelTarget > 0 then
				GameApi.AutoAttack()
				this.State = PlayerState.STATE_FIGHTING

			else
				this.State = PlayerState.STATE_IDLE
				this.OptTimer:Reset()
				this.OptTimer:SetPeriod(this.IdleTime)
			end
		end
	end,


	--补血逻辑
	HealHp = function(this)
		local hp_ratio = this.PropTbl["hp"] / this.PropTbl["maxhp"]
		if hp_ratio <= this.HpRatio and this.PropTbl["is_dead"] == false then
			if GameApi.UseItemByID(this.HpItem) == false then
				if GameApi.GetItemNumByID(this.HpItem) <= 0 then
					local sCmd = string.format(--[[!AUTO_21]][====[d_cmd 2001 %d 100]====],this.HpItem)
					GameApi.RunConsoleCmd(sCmd)
				else
					LogPrint(--[[!AUTO_22]][====[AI::HealHp Error.
]====])
				end
			end
		end
	end,

	--补蓝逻辑
	HealMp = function(this)
		local mp_ratio = this.PropTbl["mp1"] / this.PropTbl["maxmp1"]
		if mp_ratio <= this.MpRatio and this.PropTbl["is_dead"] == false then
			if GameApi.UseItemByID(this.MpItem) == false then
				if GameApi.GetItemNumByID(this.MpItem) <= 0 then
					local sCmd = string.format(--[[!AUTO_23]][====[d_cmd 2001 %d 100]====],this.MpItem)
					GameApi.RunConsoleCmd(sCmd)
				else
					LogPrint(--[[!AUTO_24]][====[AI::HealMp Error.
]====])
				end
			end
		end
	end,

	--自动复活
	Revive = function(this)
		if this.PropTbl["is_dead"] == true then
			GameApi.RunConsoleCmd(--[[!AUTO_25]][====[d_cmd 2048]====])

			this.State = PlayerState.STATE_IDLE
			this.OptTimer:Reset()
			this.OptTimer:SetPeriod(this.ReliveTime)

			--补血补蓝
			GameApi.UseItemByID(this.HpItem)
			GameApi.UseItemByID(this.MpItem)

			this.SelTarget = 0
		end
	end
}
