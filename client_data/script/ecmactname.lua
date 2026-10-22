---This script is coded in ANSI. Be careful saving it!
---Yong Ultraedit ling cun shi yao xuan ANSI bianma!!!

---------------------------------------------------------
lua_act = {}

--player / mount input variables definition

--iLogicAct		LogicAct(UpperAct)	int		refer to Visual.lua
--iLowerAct		Lower Body Act type	int		refer to Visual.lua

--iObjectType Object类型：见Visual.lua里OBJECT_TYPE

--iWeapon		Weapon attack type	int		refer to Visual.lua
--iInGuard		Combat state		int		0false,1true
--iFaction		Faction ID			int		即职业。refer to Visual.lua
--iStance							int		See STANCE_TYPE in Visual.lua

--iGroundWater	地面、水面状态。	int		0: 地面, 1: 水中, 2: 水面
--fCurSpeed		当前的速度
--bIgnoreSpeed	取动作时是否忽略速度

--fTurnYaw		转向角度

--nCamSpecOpType 	相机特殊操作模式	int		refer to CAM_SPECOP_XXX in Visual.lua

--iPerformID	Peform ID			int		自己的技能段ID
--iAtkCount		Attack count ID		int		client only count, need further discussion.

--HitType		Attack Direction	int		自己被攻击时，与攻击者的方位关系
--DodgeMask							int		自己被攻击且有闪避时，闪避的Mask
--tStates		Visual states		tab		bool*64

--nJumpStage							跳跃（轻功）的段数，从1开始
--idEmote		Expression ID		int		refer to Visual.lua
--danceActionConfigID 跳舞配置表ID	int
--iMineID		Mine ID				int		refer to Visual.lua, mine type from npc templates.
--iItemActIdx						int		使用物品的动作索引
--tidItemUse						int		使用物品的TID
--cidItemUse						int		使用物品的classID

--eBindLoverType					int		相依相偎类型，见action.lua的BindLoverTypeEnum
--nPosInBindLover					int		相依相偎的位置。< 0表示没有相依相偎，==0表示主绑，> 0表示被绑
--bBindLoverFlag					int		相依相偎的绑定状态：See EC_CHILDBIND_xxx
--nBindLoverPhase					int		相依相偎阶段：见action.lua的BindActPhase定义
--tidBindVehicle					int		绑定对应的交通工具模板ID。 0表示没有
--nBindType							int		绑定类型：见action.lua的BindTypeEnum定义（0骑乘，1携带，2角色间绑定，3凳子。 < 0 表示没有）
--nPosInBind						int		绑定位置：0位置为主体
--bBindFlag							int		绑定状态：See EC_CHILDBIND_xxx
--nBindMax							int		绑定的最多人数（包括主体）
--nBindPhase						int		绑定的阶段：见action.lua的BindActPhase定义

local playerActMaxSpeed = 2
local npcActMaxSpeed = 1.5

testJumpType = 0

function lua_act:CanActAdjustSpeed (iAct)
	return	iAct == ObjectLogicActFlag.WALK
		or 	iAct == ObjectLogicActFlag.RUN
		or 	(iAct >= ObjectLogicActFlag.MOVEFOWARD and iAct <= ObjectLogicActFlag.MOVELEFT)
		or  (iAct >= ObjectLogicActFlag.WALK_COLLIDE_FRONT and iAct <= ObjectLogicActFlag.RUN_COLLIDE_RIGHT)
		or	iAct == ObjectLogicActFlag.CUSTOM_SPEEDUP
end

function lua_act:ReplaceSpecOpAct (iAct)
	if iAct == ObjectLogicActFlag.NONE then
		return iAct
	elseif iAct == ObjectLogicActFlag.STAND
		or iAct == ObjectLogicActFlag.WALK
		or iAct == ObjectLogicActFlag.RUN
		or iAct >= ObjectLogicActFlag.MOVEFOWARD and iAct <= ObjectLogicActFlag.MOVELEFT
		or iAct == ObjectLogicActFlag.TURN
		or iAct == ObjectLogicActFlag.FASTRUN_BREAK
		or iAct >= ObjectLogicActFlag.IDLE and iAct <= ObjectLogicActFlag.BATTLE_LOSE
		then
			return ObjectLogicActFlag.LIANSHOU
	elseif iAct >= ObjectLogicActFlag.STAND_COLLIDE_FRONT and iAct <= ObjectLogicActFlag.RUN_COLLIDE_RIGHT
		then
			return ObjectLogicActFlag.NONE
	else
		return iAct
	end
end

function lua_act:IsValidLowerAct(iLowerAct)
	return iLowerAct == ObjectLogicActFlag.NONE or iLowerAct == ObjectLogicActFlag.CASTSKILL or
		(iLowerAct >= ObjectLogicActFlag.STAND and iLowerAct <= ObjectLogicActFlag.JUMPLAND)
end

function lua_act:IsDanceAction(idEmote)
	return idEmote >= EXPRESSION_TYPE.ROLEEXP_DANCE_START and idEmote <= EXPRESSION_TYPE.ROLEEXP_DANCE_END
end

function lua_act:GetDanceActionNameWithConfig(danceActionConfigID, idEmote, idSequence)
	if not lua_act:IsDanceAction(idEmote) then
		return ACTIONSTRINGNULL
	end
	local actionIndex = (idEmote - EXPRESSION_TYPE.ROLEEXP_DANCE_START)+1
	local action = GetPlayerDanceActionWithConfigID(danceActionConfigID, actionIndex, idSequence+1)
	if action == nil then
		return ACTIONSTRINGNULL
	end
	return action.string
end

--get player / mount action
function lua_act:GetECMName (iLogicAct, iLowerAct, iObjectType,
	iWeapon, iInGuard, iFaction, iStance,
	iGroundWater, fCurSpeed, bIgnoreSpeed, fTurnYaw, nCamSpecOpType,
	iPerformID, iAtkCount, HitType, DodgeMask, tStates,
	nJumpStage, idEmote, danceActionConfigID, iMineID, iItemActIdx, tidItemUse, cidItemUse,
	eBindLoverType, nPosInBindLover, bBindLoverFlag, nBindLoverPhase,
	tidBindVehicle, nBindType, nPosInBind, bBindFlag, nBindMax, nBindPhase
	)

	--LogPrint(iLogic)
	--LogPrint(tStates[16] and "true" or "false")

	--define local vals
	local playerUpperAct = ACTIONSTRINGNULL
	local playerLowerAct = ACTIONSTRINGNULL
	local playerQueueAct = ACTIONSTRINGNULL

	local mountAct = ACTIONSTRINGNULL
	local mountMoveTurnAct = ACTIONSTRINGNULL

	local fUpperSpeed = 1.0
	local fLowerSpeed = 1.0
	local bFullAct = true
	local actionTime = -1
	
	--LogPrintA(iLogicAct)

	--local strdbg = string.format("iAct: %d, Speed: %.3f, bBindFlag %d\n", iLogicAct, fCurSpeed, bBindFlag)
	--LogPrint(strdbg)

	--绑定初始和结束动作：不调整播放速度
	local bInBindPhaseInitEnd = tidBindVehicle and (nBindPhase == BindActPhase.INIT or nBindPhase == BindActPhase.END)

	local bInCorsesBind = (eBindLoverType == BindLoverTypeEnum.CORSES_FLY) and (nPosInBindLover==1)

	if lua_act:CanActAdjustSpeed(iLogicAct) and not bInBindPhaseInitEnd and not bInCorsesBind then																								
		--local iOldAct = iLogicAct
		--local fOldSpeed = fCurSpeed
		iLogicAct, fUpperSpeed = lua_act:GetModelActionSpeed(iLogicAct, iStance, 0, fCurSpeed, bIgnoreSpeed, tidBindVehicle, iGroundWater)
		--strdbg = string.format("ActionSpeed: %.3f -> %.3f, %d -> %d\n", fOldSpeed, fCurSpeed, iOldAct, iLogicAct)
		--LogPrint(strdbg)
	end

	if lua_act:CanActAdjustSpeed(iLowerAct) and not bInBindPhaseInitEnd and not bInCorsesBind then
		iLowerAct, fLowerSpeed = lua_act:GetModelActionSpeed(iLowerAct, iStance, 0, fCurSpeed, bIgnoreSpeed, tidBindVehicle, iGroundWater)
	end

	if nCamSpecOpType == CAM_SPECOP_LOCKFACE_RUN then
		-- 相机锁方向跑动：将行走等动作均换为奔跑
		iLogicAct = lua_act:ReplaceSpecOpAct(iLogicAct)
		iLowerAct = lua_act:ReplaceSpecOpAct(iLowerAct)
	end

	--strdbg = string.format("After: Upper: %d, Lower: %d\n", iLogicAct, iLowerAct)
	--LogPrint(strdbg)

	if iLogicAct == ObjectLogicActFlag.CASTSKILL and lua_act:IsValidLowerAct(iLowerAct) then
		--上半身为技能、下半身为移动时的动作：根据下半身动作不同，有单独配置
		--strdbg = string.format("CastSkill: Lower %d, Perform %d", iLowerAct, iPerformID)
		--LogPrintA(strdbg)

		local mUpperAct = ACTIONSTRINGNULL
		local mSkillAct = ACTIONSTRINGNULL
		mUpperAct, mSkillAct, bFullAct = lua_act:GetMovablePerformAct(iLogicAct, iLowerAct, iPerformID)

		if mSkillAct ~= nil and string.len(mSkillAct) > 0 then

			--取得了下身相关的技能动作
			if mUpperAct ~= nil then
				playerUpperAct = mUpperAct
				--LogPrintA("MovableSkill: UpperAct " ..playerUpperAct)
			end

			if bFullAct or lua_act:CanActAdjustSpeed(iLowerAct) then
				playerLowerAct = mSkillAct
				--LogPrintA("MovableSkill: LowerAct " ..playerLowerAct)
			else
				playerLowerAct = lua_act:InnerGetActName(iLowerAct, iObjectType, iWeapon, iInGuard, iFaction, iGroundWater, tStates,
					iPerformID, iMineID, iCount, HitType, DodgeMask, iStandOptParam, iStance,
					eBindLoverType, nPosInBindLover, bBindLoverFlag, nBindLoverPhase,
					tidBindVehicle, nBindType, nPosInBind, bBindFlag, nBindMax, nBindPhase,
					fCurSpeed, bIgnoreSpeed, fTurnYaw, nCamSpecOpType, nJumpStage, idEmote, danceActionConfigID, iItemActIdx, tidItemUse, cidItemUse)
																			

				--strdbg = string.format("MovableSkill: LowerAct %d %s", iLowerAct, playerLowerAct)
				--LogPrintA(strdbg)
			end

			--直接返回
			--strdbg = string.format("Upper %d, %s, Lower %d, %s", iLogicAct, playerUpperAct, iLowerAct, playerLowerAct)
			--LogPrintA(strdbg)
			return playerUpperAct, playerLowerAct, playerQueueAct, mountAct, mountMoveTurnAct, fUpperSpeed, fLowerSpeed, bFullAct
		end
	end

	if iLogicAct ~= ObjectLogicActFlag.NONE then
		playerUpperAct, playerQueueAct, mountAct, mountMoveTurnAct, actionTime = lua_act:InnerGetActName(iLogicAct, iObjectType, iWeapon, iInGuard, iFaction, iGroundWater, tStates,
				iPerformID, iMineID, iCount, HitType, DodgeMask, iStandOptParam, iStance,
				eBindLoverType, nPosInBindLover, bBindLoverFlag, nBindLoverPhase,
				tidBindVehicle, nBindType, nPosInBind, bBindFlag, nBindMax, nBindPhase,
				fCurSpeed, bIgnoreSpeed, fTurnYaw, nCamSpecOpType, nJumpStage, idEmote, danceActionConfigID, iItemActIdx, tidItemUse, cidItemUse)
																		   

		--strdbg = string.format("Act %d, Upper %s, Queue %s, Mount %s, MountTurn %s\n", iLogicAct, playerUpperAct, playerQueueAct, mountAct, mountMoveTurnAct)
		--LogPrintA(strdbg)
	end

	if tidBindVehicle and nBindType == BindTypeEnum.MOUNT --骑乘时，某些动作只播上半身
		and nPosInBindLover < 0 -- 骑乘相依相偎：主被绑都有播全身动作，不播半身动作
		and (iLogicAct >= ObjectLogicActFlag.CASTSKILL and iLogicAct <= ObjectLogicActFlag.GREETING
			or iLogicAct >= ObjectLogicActFlag.IDLE and iLogicAct <= ObjectLogicActFlag.REST)
		and (lua_act:IsFlyingVehicle( tidBindVehicle ) == 0)
		and (lua_act:IsSeparatePlayActVehicle(tidBindVehicle) == 0) then
		--LogPrint("Not Full Act " .. iLogicAct .. "\n")
		bFullAct = false
	elseif iLowerAct == iLogicAct then
		playerLowerAct = playerUpperAct
		
		--strdbg = string.format("LowerAct %d, %s\n", iLowerAct, playerLowerAct)
		--LogPrintA(strdbg)
	elseif iLowerAct ~= ObjectLogicActFlag.NONE then
		playerLowerAct = lua_act:InnerGetActName(iLowerAct, iObjectType, iWeapon, iInGuard, iFaction, iGroundWater, tStates,
		 		iPerformID, iMineID, iCount, HitType, DodgeMask, iStandOptParam, iStance,
		 		eBindLoverType, nPosInBindLover, bBindLoverFlag, nBindLoverPhase,
		 		tidBindVehicle, nBindType, nPosInBind, bBindFlag, nBindMax, nBindPhase,
				 fCurSpeed, bIgnoreSpeed, fTurnYaw, nCamSpecOpType, nJumpStage, idEmote, danceActionConfigID, 
				 danceActionSequenceID, iItemActIdx, tidItemUse, cidItemUse, showNpcID, tidDecorate, musicType)

		--strdbg = string.format("LowerAct %d, %s\n", iLowerAct, playerLowerAct)
		--LogPrintA(strdbg)
	end

	--strdbg = string.format("Upper %d, %s, Lower %d, %s", iLogicAct, playerUpperAct, iLowerAct, playerLowerAct)
	--LogPrintA(strdbg)

	if string.len(playerLowerAct) > 0 and string.len(playerUpperAct) > 0
		and playerLowerAct ~= playerUpperAct then
		bFullAct = false
	end

	--走跑融合特殊速度调整
	local i_zhoupao
	i_zhoupao, _ = string.find(playerUpperAct, "走跑上下坡")
	if i_zhoupao ~= nil then
		fUpperSpeed = 1
		fLowerSpeed = 1
	end

	--LogPrint(playerUpperAct)
	return playerUpperAct, playerLowerAct, playerQueueAct, mountAct, mountMoveTurnAct, fUpperSpeed, fLowerSpeed, bFullAct, actionTime
end


function lua_act:InnerGetActName(iAct, iObjectType, iWeapon, iInGuard, iFaction, iGroundWater, tStates,
	iPerformID, iMineID, iCount, HitType, DodgeMask, iStandOptParam, iStance,
	eBindLoverType, nPosInBindLover, bBindLoverFlag, nBindLoverPhase,
	tidBindVehicle, nBindType, nPosInBind, bBindFlag, nBindMax, nBindPhase,
	fCurSpeed, bIgnoreSpeed, fTurnYaw, nCamSpecOpType, nJumpStage, idEmote, danceActionConfigID, 
	danceActionSequenceID, iItemActIdx, tidItemUse, cidItemUse, showNpcID, tidDecorate, musicType)
	--get action by event

	local playerAct = ACTIONSTRINGNULL
	local playerQueueAct = ACTIONSTRINGNULL
	local mountAct = ACTIONSTRINGNULL
	local mountMoveTurnAct = ACTIONSTRINGNULL
	local action = nil
	local queue_action = nil
	local prefix, infix, suffix
	local actionTime = -1
	local bUseBindAct = tidBindVehicle > 0 or
			(nPosInBindLover >= 0 and (eBindLoverType ~= BindLoverTypeEnum.HANDINHAND or bBindLoverFlag == EC_CHILDBIND_MODEL_BIND))
	local bInCorsesBind = bUseBindAct and (eBindLoverType == BindLoverTypeEnum.CORSES_FLY) and (nPosInBindLover==1)

	--LogPrintA(iAct)

	--LogPrint("InnerGetAct:" .. iAct .."\n")
	repeat	--[[pipiro's switch/case start	
NPC显示]]	if iAct == ObjectLogicActFlag.PLAYER_NPC_SHOW then
			action = lua_act:GetPlayerNpcShowAction(showNpcID)			
		break;end;--[[
站立]]		if iAct == ObjectLogicActFlag.STAND then
			if bUseBindAct then
			    action, actionTime, mountAct = lua_act:GetBindAction(iAct, tidBindVehicle, nBindType, nPosInBind, bBindFlag, nBindMax, nBindPhase, eBindLoverType, nPosInBindLover, nBindLoverPhase, fCurSpeed)
			elseif iGroundWater == 1 then
				--游泳站立
				action = "水中站立"
			elseif iGroundWater == 2 then
				--水上漂站立
				action = "水上站立"
			elseif iInGuard == 1 and not (nPosInBindLover >= 0 and eBindLoverType == BindLoverTypeEnum.HANDINHAND) then
				--战斗站立（但牵手时不播战斗站立）
					local weaponList = WeaponList[iWeapon+1][iStance]
			    	if weaponList == nil then
			            action = "战斗站立"
			        elseif weaponList == "空手" then
			            action = "战斗站立"
			        else
			            action = weaponList
			        end
			else
				if iStance == STANCE_TYPE.BLOCK then
					action = "格挡"
				--elseif WeaponList[iWeapon+1][iStance] == "空手" then
				--	action = "战斗站立"
				else
					action = "站立"
				end
			end

			if mountAct == ACTIONSTRINGNULL then
				mountAct = "站立"
			end
        break;end;--[[
行走]]	if iAct == ObjectLogicActFlag.WALK then
			if bUseBindAct then
		    action, actionTime, mountAct = lua_act:GetBindAction(iAct, tidBindVehicle, nBindType, nPosInBind, bBindFlag, nBindMax, nBindPhase, eBindLoverType, nPosInBindLover, nBindLoverPhase, fCurSpeed)
			elseif iGroundWater == 1 then
				--游泳行走
				action = "水中移动"
			elseif iGroundWater == 2 then
				--水上漂行走
				action = "行走"
			elseif iStance == STANCE_TYPE.BLOCK then
				action = "格挡前进"
			else
				action = "行走"
			end

			if mountAct == ACTIONSTRINGNULL then
				mountAct = "行走"
			end
        break;end;--[[
奔跑]]	if  iAct == ObjectLogicActFlag.RUN then
			--LogPrint("RUN: " ..iAct .. " " ..iStance .. " " ..nBindPhase .."\n")
			if bUseBindAct then
				action, actionTime, mountAct = lua_act:GetBindAction(iAct, tidBindVehicle, nBindType, nPosInBind, bBindFlag, nBindMax, nBindPhase, eBindLoverType, nPosInBindLover, nBindLoverPhase, fCurSpeed)
			elseif iGroundWater == 1 then
				--游泳奔跑
				action = "水中移动"
			elseif iGroundWater == 2 then
				--水上漂奔跑
				action = "水上漂"
			elseif iStance == STANCE_TYPE.BLOCK then	--需修改 and iWeapon ~= 6
				action = "格挡前进"
			elseif iInGuard == 1 then
				if iWeapon == 2 and iStance == STANCE_TYPE.TRANS1 then
					action = "御剑索敌前进"
				elseif iWeapon == 5 and iStance == STANCE_TYPE.TRANS1 then
					action = "武器索敌前进"	--不太确认干嘛的
				elseif iWeapon == 9  and iStance == STANCE_TYPE.TRANS1 then
					action = "组合索敌前进"
				elseif iWeapon == 10 and iStance == STANCE_TYPE.NORMAL then
					action = "空手索敌前进"	--不太确认干嘛的
															   
								  
											   
								   
				else
					action = "战斗奔跑"
				end
			else
				action = "奔跑"
			end

			if mountAct == ACTIONSTRINGNULL then
				mountAct = "奔跑"
				if MonsterVisual.SlowBind[tidBindVehicle] and fCurSpeed < 4.05 then
					if iGroundWater ~= 2 then
						mountAct = "小跑"
					else
						mountAct = "奔跑"
					end
				end
			end
        break;end;--[[
自定加速奔跑]]	if iAct == ObjectLogicActFlag.CUSTOM_SPEEDUP then
			if bUseBindAct then
				action, actionTime = lua_act:GetBindAction(iAct, tidBindVehicle, nBindType, nPosInBind, bBindFlag, nBindMax, nBindPhase, eBindLoverType, nPosInBindLover, nBindLoverPhase, fCurSpeed)
			elseif iGroundWater == 1 then
				action = "水中移动"
			elseif iGroundWater == 2 then
				action = "水上漂"
			else
				if tidBindVehicle and tidBindVehicle == 74369 then
					action = "抱羊加速跑"
				else
					if iInGuard == 0 then
						iWeapon = 0
						action = "加速奔跑"
					else
						if iStance == STANCE_TYPE.TRANS1 and iWeapon == 2 then
							action = "加速奔跑2"
						elseif iStance == STANCE_TYPE.TRANS1 and iWeapon == 5 then
							action = "加速奔跑2"
						elseif iStance == STANCE_TYPE.TRANS1 and iWeapon == 9 then
							action = "加速奔跑2"
						elseif iStance == STANCE_TYPE.NORMAL and iWeapon == 10 then
							action = "加速奔跑2"		
						elseif iStance == STANCE_TYPE.JUEXUE then
							action = "避邪剑法加速跑"
							iWeapon = 0
						else
							action = "加速奔跑"
						end
					end
				end
			end
			mountAct = "挥鞭"
        break;end;--[[
加速跑刹车]]	if iAct == ObjectLogicActFlag.FASTRUN_BREAK then
			if bUseBindAct then
				action, actionTime = lua_act:GetBindAction(iAct, tidBindVehicle, nBindType, nPosInBind, bBindFlag, nBindMax, nBindPhase, eBindLoverType, nPosInBindLover, nBindLoverPhase, fCurSpeed)
			else
				action = "加速奔跑缓冲"
			end
			--LogPrintA("加速跑刹车！！！：" .. action)
			if iInGuard == 0 then
				iWeapon = 0
			end
			mountAct = "刹车"
			break;end;--[[
入水]] if iAct == ObjectLogicActFlag.JUMPINTO_WATER then
			action = "入水"
			mountAct = "奔跑"
			break;end;--[[
出水]] if iAct == ObjectLogicActFlag.JUMPOUT_WATER then
			action = "出水"
			mountAct = "奔跑"
			break;end;--[[
前进]]	if  iAct == ObjectLogicActFlag.MOVEFOWARD then
			if iStance == STANCE_TYPE.BLOCK then
				action = "格挡前进"
			elseif iStance == STANCE_TYPE.TRANS1 and iWeapon == 2 then
				action = "御剑索敌前进"
			elseif iStance == STANCE_TYPE.TRANS1 and iWeapon == 5 then
				action = "武器索敌前进"
			elseif iStance == STANCE_TYPE.TRANS1 and iWeapon == 9 then
				action = "组合索敌前进"
			elseif iStance == STANCE_TYPE.NORMAL and iWeapon == 10 then
				action = "空手索敌前进"
															  
								 
			elseif iStance == STANCE_TYPE.JUEXUE then
				action = "避邪剑法索敌移动前"
				iWeapon = 0
											  
								 
			elseif iInGuard == 1 then
				action = "索敌前进"
			else
				action = "奔跑"
			end
			mountAct = "奔跑"
        break;end;--[[
右移]]	if  iAct == ObjectLogicActFlag.MOVERIGHT then
			if iStance == STANCE_TYPE.BLOCK then
				action = "格挡右移"
			elseif iStance == STANCE_TYPE.TRANS1 and iWeapon == 2 then
				action = "御剑索敌右移"
			elseif iStance == STANCE_TYPE.TRANS1 and iWeapon == 5 then
				action = "武器索敌右移"
			elseif iStance == STANCE_TYPE.TRANS1 and iWeapon == 9 then
				action = "组合索敌右移"
			elseif iStance == STANCE_TYPE.NORMAL and iWeapon == 10 then
				action = "空手索敌右移"
															  
								 
			elseif iStance == STANCE_TYPE.JUEXUE then
				action = "避邪剑法索敌移动右"
				iWeapon = 0
											  
								 
			elseif iInGuard == 1 then
				action = "索敌右移"
			else
				action = "右平移"
			end
			mountAct = "奔跑"
        break;end;--[[
后退]]	if  iAct == ObjectLogicActFlag.MOVEBACK then
			if iStance == STANCE_TYPE.BLOCK then
				action = "格挡后退"
			elseif iStance == STANCE_TYPE.TRANS1 and iWeapon == 2 then
				action = "御剑索敌后退"
			elseif iStance == STANCE_TYPE.TRANS1 and iWeapon == 5 then
				action = "武器索敌后退"
			elseif iStance == STANCE_TYPE.TRANS1 and iWeapon == 9 then
				action = "组合索敌后退"
			elseif iStance == STANCE_TYPE.NORMAL and iWeapon == 10 then
				action = "空手索敌后退"
															  
								 
			elseif iStance == STANCE_TYPE.JUEXUE then
				action = "避邪剑法索敌移动后"
				iWeapon = 0
											  
								 
			elseif iInGuard == 1 then
				action = "索敌后退"
			else
				action = "后平移"
			end
			mountAct = "奔跑"
        break;end;--[[
左移]]	if  iAct == ObjectLogicActFlag.MOVELEFT then
			if iStance == STANCE_TYPE.BLOCK then
				action = "格挡左移"
			elseif iStance == STANCE_TYPE.TRANS1 and iWeapon == 2 then
				action = "御剑索敌左移"
			elseif iStance == STANCE_TYPE.TRANS1 and iWeapon == 5 then
				action = "武器索敌左移"
			elseif iStance == STANCE_TYPE.TRANS1 and iWeapon == 9 then
				action = "组合索敌左移"
			elseif iStance == STANCE_TYPE.NORMAL and iWeapon == 10 then
				action = "空手索敌左移"
															  
								 
			elseif iStance == STANCE_TYPE.JUEXUE then
				action = "避邪剑法索敌移动左"
				iWeapon = 0
											  
								 
			elseif iInGuard == 1 then
				--LogPrintA("索敌左移\n")
				action = "索敌左移"
			else
				action = "左平移"
			end
			mountAct = "奔跑"
        break;end;--[[
起跳]]	if  iAct == ObjectLogicActFlag.JUMPSTART then
			if bUseBindAct then
			    action, actionTime = lua_act:GetBindAction(iAct, tidBindVehicle, nBindType, nPosInBind, bBindFlag, nBindMax, nBindPhase, eBindLoverType, nPosInBindLover, nBindLoverPhase, fCurSpeed)
			elseif nJumpStage == 1 then
				if iInGuard == 1 then
					action = "一段跳"
					--action = "轻功起跳"	--to liubing 去掉这行最左的--就会调轻功起跳动作
				else
					if testJumpType > 0 then
						action = "一段跳" .. testJumpType
					else
						action = "一段跳"
					end
					--action = "一段跳"
					--action = "轻功起跳"	--to liubing 去掉这行最左的--就会调轻功起跳动作
				end
			elseif nJumpStage == 2 then
				action = "二段跳"
			elseif nJumpStage == 3 then
				action = "三段跳"
			elseif nJumpStage == 4 then
				action = "四段跳"
			else
				action = "一段跳"
			end
			if iInGuard == 0 then
				iWeapon = 0
			elseif iInGuard == 1 then
				if iWeapon == 2 and iStance == 2 then
					iWeapon = 0
				elseif iWeapon == 5 and iStance == 1 then
					iWeapon = 0
				--elseif iWeapon == 7 and (iStance == 1 or iStance == 2) then
					--iWeapon = 0
				elseif iWeapon == 10 and iStance == 1 then
					iWeapon = 0
				end
			end
			mountAct = "跳起"
			--LogPrintA("iStance = " .. iStance .. ", 动作名 = " .. action)
        break;end;--[[
跳跃循环]]	if  iAct == ObjectLogicActFlag.JUMPLOOP then
			if bUseBindAct then
			    action, actionTime = lua_act:GetBindAction(iAct, tidBindVehicle, nBindType, nPosInBind, bBindFlag, nBindMax, nBindPhase, eBindLoverType, nPosInBindLover, nBindLoverPhase, fCurSpeed)
			elseif nJumpStage == 1 then
				if iInGuard == 1 then
					action = "空中循环"
				else
					action = "空中循环"
				end
			elseif nJumpStage == 2 then
				action = "空中循环"
			elseif nJumpStage == 3 then
				action = "空中循环"
			elseif nJumpStage == 4 then
				action = "空中循环"
			else
				action = "空中循环"
			end
			if iInGuard == 0 then
				iWeapon = 0
			elseif iInGuard == 1 then
				if iWeapon == 2 and iStance == 2 then
					iWeapon = 0
				elseif iWeapon == 5 and iStance == 1 then
					iWeapon = 0
				--elseif iWeapon == 7 and (iStance == 1 or iStance == 2) then
					--iWeapon = 0
				elseif iWeapon == 10 and iStance == 1 then
					iWeapon = 0
				end
			end
			mountAct = "跳空中"
        break;end;--[[
落地前缓冲]] if iAct == ObjectLogicActFlag.JUMPLAND_PREPARE then
			if bUseBindAct then
			    action, actionTime = lua_act:GetBindAction(iAct, tidBindVehicle, nBindType, nPosInBind, bBindFlag, nBindMax, nBindPhase, eBindLoverType, nPosInBindLover, nBindLoverPhase, fCurSpeed)
			else
				local tabJumpLandPrepare = lua_act.JumpLandPrepareConfig[nJumpStage]
				if tabJumpLandPrepare and string.len(tabJumpLandPrepare[1]) > 0 then
					action = tabJumpLandPrepare[1]
				end
			end
			if iInGuard == 0 then
				iWeapon = 0
			elseif iInGuard == 1 then
				if iWeapon == 2 and iStance == 2 then
					iWeapon = 0
				elseif iWeapon == 5 and iStance == 1 then
					iWeapon = 0
				--elseif iWeapon == 7 and (iStance == 1 or iStance == 2) then
					--iWeapon = 0
				elseif iWeapon == 10 and iStance == 1 then
					iWeapon = 0
				end
			end
			mountAct = "跳空中"
        break;end;--[[
着地]]	if  iAct == ObjectLogicActFlag.JUMPLAND then
		if bUseBindAct then
			action, actionTime = lua_act:GetBindAction(iAct, tidBindVehicle, nBindType, nPosInBind, bBindFlag, nBindMax, nBindPhase, eBindLoverType, nPosInBindLover, nBindLoverPhase, fCurSpeed)
		else
			if testJumpType > 0 then
				action = "落地" .. testJumpType
			else
				if nJumpStage >= 3 then
					action = "俯冲落地翻滚"
				else
					action = "落地"
				end
			end

			--[[
			if iInGuard == 1 then
				action = "战斗跳落地"
			else
				if nJumpStage == 2 then
					action = "跳落地"
				elseif nJumpStage == 3 then
					action = "落地"
				elseif nJumpStage == 4 then
					action = "落地"
				else -- 一段跳和其它情况比如正常落地
					--action = "落地"
					--if fCurSpeed < 6 then
						--action = "落地"
					--else
						--action = ACTIONSTRINGNULL
					--end
				end
			end
			]]
		end

		--if fCurSpeed < 9 then
			mountAct = "跳落地"
		--else
		--	mountAct = ACTIONSTRINGNULL
		--end

		if nJumpStage >= 3 then
			-- 俯冲落地翻滚：暂时没有 _通用 动作
		else
			if iInGuard == 0 then
				iWeapon = 0
			elseif iInGuard == 1 then
				if iWeapon == 2 and iStance == 2 then
					iWeapon = 0
				elseif iWeapon == 5 and iStance == 1 then
					iWeapon = 0
				--elseif iWeapon == 7 and (iStance == 1 or iStance == 2) then
					--iWeapon = 0
				elseif iWeapon == 10 and iStance == 1 then
					iWeapon = 0
				end
			end
		end
        break;end;--[[
原地转向]] if iAct == ObjectLogicActFlag.TURN then

			if bUseBindAct then
		    action, actionTime, mountAct = lua_act:GetBindAction(iAct, tidBindVehicle, nBindType, nPosInBind, bBindFlag, nBindMax, nBindPhase, eBindLoverType, nPosInBindLover, nBindLoverPhase, fCurSpeed)

				if nPosInBind == 0 and
					(nBindType == BindTypeEnum.MOUNT or nBindType == BindTypeEnum.CARRY
						or nBindType == BindTypeEnum.BETWEENROLE
						or eBindLoverType == BindLoverTypeEnum.HANDINHAND) then
					-- 骑乘/携带/角色间绑定：也有转身动作
					local postLR = "_R"
					if fTurnYaw > 0 then
						postLR = "_L"
					end
			    	
					iBegin, iEnd = string.find(action, "原地转身")
					if iBegin ~= nil then
						action = action .. postLR
					end
					
					mountAct = "原地转身"..postLR
		    end
			elseif iGroundWater == 1 then
				--游泳行走
				action = "水中移动"
			elseif iGroundWater == 2 then
				--水上漂行走
				action = "水上漂"
			elseif iStance == STANCE_TYPE.BLOCK then
				action = "格挡前进"
			else
				local postLR = "_R"
				if fTurnYaw > 0 then
					postLR = "_L"
				end

				if fTurnYaw > 90.0001 or fTurnYaw < -90.0001 then
					action = "原地180度转身"..postLR
				else
					action = "原地转身"..postLR
				end
			end

			if mountAct == ACTIONSTRINGNULL then
				mountAct = "行走"
			end

        break;end;--[[
        
运动中转向]] if iAct == ObjectLogicActFlag.TURN_INMOVE then

			if bUseBindAct then
		    action, actionTime, mountAct = lua_act:GetBindAction(iAct, tidBindVehicle, nBindType, nPosInBind, bBindFlag, nBindMax, nBindPhase, eBindLoverType, nPosInBindLover, nBindLoverPhase, fCurSpeed)

				mountMoveTurnAct = "运动中转身"

	    	--if fTurnYaw > 15 or fTurnYaw < -15 then
					local postLR = "_R"
					if fTurnYaw > 0 then
						postLR = "_L"
					end
					mountMoveTurnAct = mountMoveTurnAct .. postLR

					if action ~= "" then
						--LogPrintA(action)
						action = action .. postLR
					end

					--local str = string.format("TURN_INMOVE: TurnYaw %.3f, MountTurnAct %s\n", fTurnYaw, mountMoveTurnAct)
					--LogPrintA(str)
				--else
				--	mountMoveTurnAct = ACTIONSTRINGNULL
				--		--local str = string.format("TURN_INMOVE: TurnYaw %.3f, MountTurnAct %s\n", fTurnYaw, mountMoveTurnAct)
				--	--LogPrintA(str)
				--end

			else
				local postLR = "_R"
				if fTurnYaw > 0 then
					postLR = "_L"
				end

				if fTurnYaw > 90.0001 or fTurnYaw < -90.0001 then
					action = "运动180度转身"..postLR
				else
					action = "运动转身"..postLR
				end
			end

        break;end;--[[

站立前碰撞]]	if iAct == ObjectLogicActFlag.STAND_COLLIDE_FRONT then
			action = "后碰撞"
        break;end;--[[
站立后碰撞]]	if iAct == ObjectLogicActFlag.STAND_COLLIDE_BACK then
			action = "后碰撞"
        break;end;--[[
站立左碰撞]]	if iAct == ObjectLogicActFlag.STAND_COLLIDE_LEFT then
			action = "左站立碰撞"
        break;end;--[[
站立右碰撞]]	if iAct == ObjectLogicActFlag.STAND_COLLIDE_RIGHT then
			action = "右站立碰撞"
        break;end;--[[
行走前碰撞]]	if iAct == ObjectLogicActFlag.WALK_COLLIDE_FRONT then
			action = "左行走碰撞"
        break;end;--[[
行走后碰撞]]	if iAct == ObjectLogicActFlag.WALK_COLLIDE_BACK then
			action = "右行走碰撞"
        break;end;--[[
行走左碰撞]]	if iAct == ObjectLogicActFlag.WALK_COLLIDE_LEFT then
			action = "左行走碰撞"
        break;end;--[[
行走右碰撞]]	if iAct == ObjectLogicActFlag.WALK_COLLIDE_RIGHT then
			action = "右行走碰撞"
        break;end;--[[
奔跑前碰撞]]	if iAct == ObjectLogicActFlag.RUN_COLLIDE_FRONT then
			action = "右奔跑碰撞"
        break;end;--[[
奔跑后碰撞]]	if iAct == ObjectLogicActFlag.RUN_COLLIDE_BACK then
			action = "左奔跑碰撞"
        break;end;--[[
奔跑左碰撞]]	if iAct == ObjectLogicActFlag.RUN_COLLIDE_LEFT then
			action = "左奔跑碰撞"
        break;end;--[[
奔跑右碰撞]]	if iAct == ObjectLogicActFlag.RUN_COLLIDE_RIGHT then
			action = "右奔跑碰撞"
        break;end;--[[
普攻1]]	if  iAct == ObjectLogicActFlag.ATTACK1 then
    		action = ACTIONSTRINGNULL
			mountAct = ACTIONSTRINGNULL
        break;end;--[[
普攻2]]	if  iAct == ObjectLogicActFlag.ATTACK2 then
    		action = ACTIONSTRINGNULL
			mountAct = ACTIONSTRINGNULL
        break;end;--[[
技能]]	if  iAct == ObjectLogicActFlag.CASTSKILL then
			if SkillPerformAction[iPerformID] == nil then
			    action = ACTIONSTRINGNULL
			else
			    if SkillPerformAction[iPerformID].condtype == 0 then
			        action = SkillPerformAction[iPerformID].fixact
			    else
			        action = lua_act:GetSkillCondAction(iInGuard, tStates, iPerformID, iCount, iStance)
			    end
			end
			mountAct = "挥鞭"
        break;end;--[[
捡包]]	if  iAct == ObjectLogicActFlag.LOOT then
       		action = "拾取"
        break;end;--[[
采集]]	if  iAct == ObjectLogicActFlag.MINE then
			if PlayerMineAction[iMineID+1] == nil then
			    action = ACTIONSTRINGNULL
			else
				action = PlayerMineAction[iMineID+1].normalstring
			end
			mountAct = "站立"
        break;end;--[[
传送]]	if  iAct == ObjectLogicActFlag.TRANSMIT then
			if cidItemUse == 19 then
			    action = PlayerMineAction[1].normalstring
			else
				action = ACTIONSTRINGNULL
			end
			mountAct = "站立"
			break;end;--[[
使用物品]]	if  iAct == ObjectLogicActFlag.STANDOPT then
			--strdbg = string.format("STANDOPT: tid %d, cid %d, ActIdx %d\n", tidItemUse, cidItemUse, iItemActIdx)
			--LogPrint(strdbg)
			if PlayerItemAction_Special.tid[tidItemUse] then
			  action = PlayerItemAction_Special.tid[tidItemUse]
			  --strdbg = string.format(" TID has Act: %s\n", action)
				--LogPrintA(strdbg)
			elseif PlayerItemAction_Special.cid[cidItemUse] then
			  action = PlayerItemAction_Special.cid[cidItemUse]
			  --strdbg = string.format(" CID has Act: %s\n", action)
				--LogPrintA(strdbg)
			else
     		action = "站立操作"
     		local tabItemAct = PlayerItemAction[iItemActIdx + 1]
				if tabItemAct ~= nil then
					action = tabItemAct.actionname
					--strdbg = string.format(" ActIdx has Act: %s\n", action)
					--LogPrintA(strdbg)
				end
			end
			mountAct = "站立"
        break;end;--[[
演武]]	if  iAct == ObjectLogicActFlag.CREATESHOW then
       		action = CharacterTitleAction[iWeapon+1].show
			mountAct = "站立"
        break;end;--[[
登录]]	if  iAct == ObjectLogicActFlag.CREATESTAND then
       		action = CharacterTitleAction[iWeapon+1].stand
			mountAct = "站立"
        break;end;--[[
创建选性别]]	if  iAct == ObjectLogicActFlag.SELECT_GENDER then
			--LogPrintA("Create: SelectGender "..iWeapon)
       		action = CharacterTitleAction[iWeapon+1].selectgender
			--LogPrintA("Create: SelectGender "..action)
			mountAct = "站立"
        break;end;--[[
死掉]]	if  iAct == ObjectLogicActFlag.DIED then
			if iGroundWater == 0 then
       			action = "死亡"
			else
				action = "水中死亡"
			end
			mountAct = ACTIONSTRINGNULL
        break;end;--[[
死亡]]	if  iAct == ObjectLogicActFlag.DIEDLOOP then
			if iGroundWater == 0 then
       			action = "死亡循环"
       		else
       			action = "水中死亡循环"
       		end
			mountAct = ACTIONSTRINGNULL
        break;end;--[[
受伤]]	if  iAct == ObjectLogicActFlag.WOUNDED then

			--LogPrint("WoundAction\n")

			if bUseBindAct then
				-- 绑定中受伤
		    action, actionTime, mountAct = lua_act:GetBindAction(iAct, tidBindVehicle, nBindType, nPosInBind, bBindFlag, nBindMax, nBindPhase, eBindLoverType, nPosInBindLover, nBindLoverPhase, fCurSpeed)
				--LogPrintA("WoundActInBind: " .. action .. "\n")

			else

				--加入攻击方位和挨打方向的匹配逻辑
				--HitType：1-左边半身挨打；2-右边半身挨打；3-后仰半身挨打；4-前躬半身挨打；5-左边全身挨打；6-右边全身挨打；7-后仰全身挨打；8-前躬全身挨打
	
				--local strDbg = string.format("Wound: HitType %d, Stance: %d\n", HitType, iStance)
				--LogPrint(strDbg)
	
				if HitType == 1 then
					action = "受伤1"
				elseif HitType == 2 then
					action = "受伤2"
				elseif HitType == 3 then
					action = "受伤3"
				elseif HitType == 4 then
					action = "受伤4"
				elseif HitType == 5 then
					--LogPrint(iWeapon)
					if iStance == STANCE_TYPE.NORMAL and iWeapon == 6 then
						action = "受伤11"
					elseif iStance == STANCE_TYPE.TRANS1 and iWeapon == 10 then
						action = "受伤11"
					else
						action = "受伤5"
					end
				elseif HitType == 6 then
					if iStance == STANCE_TYPE.NORMAL and iWeapon == 6 then
						action = "受伤12"
					elseif iStance == STANCE_TYPE.TRANS1 and iWeapon == 10 then
						action = "受伤12"
					else
						action = "受伤6"
					end
				elseif HitType == 7 then
					if iStance == STANCE_TYPE.NORMAL and iWeapon == 6 then
						action = "受伤13"
					elseif iStance == STANCE_TYPE.TRANS1 and iWeapon == 10 then
						action = "受伤13"
					else
						action = "受伤7"
					end
				elseif HitType == 8 then
					if iStance == STANCE_TYPE.NORMAL and iWeapon == 6 then
						action = "受伤14"
					elseif iStance == STANCE_TYPE.TRANS1 and iWeapon == 10 then
						action = "受伤14"
					else
						action = "受伤8"
					end
				else
					if iStance == STANCE_TYPE.NORMAL and iWeapon == 6 then
						action = "受伤11"
					else
						action = "受伤5"
					end
				end
				
			end
			
			mountAct = "受伤动作"
			--LogPrintA("iStance = " .. iStance .. ", 动作名 = " .. action)
        break;end;--[[
闪避]]	if  iAct == ObjectLogicActFlag.DODGE then
		if iPerformID == 4460 then
			if bit.band(DodgeMask,1) > 0 then	--上
				action = "闪躲上"
			elseif bit.band(DodgeMask,2) > 0 then	--下
				action = "闪躲下"
			elseif bit.band(DodgeMask,4) > 0 then	--纵
				if math.random(2) == 1 then
					action = "原地闪躲左"
				else
					action = "原地闪躲右"
				end
			elseif bit.band(DodgeMask,8) > 0 then	--横
				action = "闪躲下"
			else
				action = "闪躲下"
			end
		end
			--LogPrint(action)
			mountAct = ACTIONSTRINGNULL
        break;end;--[[
复活]]	if  iAct == ObjectLogicActFlag.REVIVE then
    		action = "复活"
			mountAct = "站立"
        break;end;--[[
亲蜜]]	if  iAct == ObjectLogicActFlag.TWOKISS then
			if bUseBindAct then
			    action, actionTime = lua_act:GetBindAction(iAct, tidBindVehicle, nBindType, nPosInBind, bBindFlag, nBindMax, nBindPhase, eBindLoverType, nPosInBindLover, nBindLoverPhase, fCurSpeed)
    		else
    		    action = "休闲动作"
    		end
			mountAct = "休闲动作"
        break;end;--[[
传送]]	if  iAct == ObjectLogicActFlag.TRANSMIT then
			action = "回城"
			mountAct = "站立"
        break;end;--[[
表情]]	if  iAct == ObjectLogicActFlag.EXPRESSION then
			if idEmote == EXPRESSION_TYPE.ROLEEXP_TWO_KISS then --亲亲密密：两个人都做动作
				action, actionTime = lua_act:GetBindAction(ObjectLogicActFlag.TWOKISS, tidBindVehicle, nBindType, nPosInBind, bBindFlag, nBindMax, nBindPhase, eBindLoverType, nPosInBindLover, nBindLoverPhase, fCurSpeed)
														
																																																			  
			elseif nPosInBind == 0 or nPosInBindLover < 1 then --绑定时只有主乘做动作
				if lua_act:IsDanceAction(idEmote) then
					action = lua_act:GetDanceActionNameWithConfig(danceActionConfigID, idEmote)
				else
					if PlayerExpAction[idEmote + 1] == nil then
						action = ACTIONSTRINGNULL
					else
						action = PlayerExpAction[idEmote + 1].string
					end
				end
			end

			mountAct = "休闲动作"
        break;end;--[[
恢复]]	if  iAct == ObjectLogicActFlag.RESTORE then
			action = "复活"
			mountAct = "奔跑"
        break;end;--[[
休息]]	if  iAct == ObjectLogicActFlag.REST then
			action = "打坐"
			mountAct = "奔跑"
        break;end;--[[
坐下]]	if  iAct == ObjectLogicActFlag.SIT then
			action = "坐下"
			mountAct = "坐下"
        break;end;--[[
坐着]]	if  iAct == ObjectLogicActFlag.SITLOOP then
			action = "坐下循环"
			mountAct = "坐下循环"
        break;end;--[[
起身]]	if  iAct == ObjectLogicActFlag.RISE then
			action = "起身"
			mountAct = "起身"
        break;end;--[[
拉马]]	if  iAct == ObjectLogicActFlag.PULLUPHORSE then

			action, actionTime = lua_act:GetBindAction(iAct, tidBindVehicle, nBindType, nPosInBind, bBindFlag, nBindMax, nBindPhase, eBindLoverType, nPosInBindLover, nBindLoverPhase, fCurSpeed)

--			if nPosInBindLover >= 0 and nBindType == BindTypeEnum.MOUNT then
--				--骑马相依相偎
--				action = "双人原地跳跃"
--			else
--				action = "原地跳跃"
--			end

			mountAct = "原地跳跃"
        break;end;--[[
休闲]]	if  iAct == ObjectLogicActFlag.IDLE and iStance ~= STANCE_TYPE.BLOCK then
			local r, rate1, rate2, rate4, rate5, m_rate1, m_rate2, m_rate3, m_rate4, m_rate5, m_rate6,  m_rate7
			r = math.random()*100
			rate1 = 85
			rate2 = 45
			rate4 = 30
			rate5 = 15
			if r > rate1 then
				action = lua_act:get_idle_act_name( bInCorsesBind, tidBindVehicle, rate1 )
				if lua_act:IsFlyingVehicle( tidBindVehicle ) == 1 or CommonMountIdleAction[tidBindVehicle] ~= nil then
					mountAct = "休闲动作2"
				end
			elseif r > rate2 then
				action = lua_act:get_idle_act_name( bInCorsesBind, tidBindVehicle, rate2 )
				if lua_act:IsFlyingVehicle( tidBindVehicle ) == 1 or CommonMountIdleAction[tidBindVehicle] ~= nil then
					mountAct = "休闲动作3"
				end
			elseif r > rate4 then
				action = lua_act:get_idle_act_name( bInCorsesBind, tidBindVehicle, rate4 )
				if lua_act:IsFlyingVehicle( tidBindVehicle ) == 1 or CommonMountIdleAction[tidBindVehicle] ~= nil then
					mountAct = "休闲动作4"
				end
			elseif r > rate5 then
				action = lua_act:get_idle_act_name( bInCorsesBind, tidBindVehicle, rate5 )
				if lua_act:IsFlyingVehicle( tidBindVehicle ) == 1 or CommonMountIdleAction[tidBindVehicle] ~= nil then				
					mountAct = "休闲动作7"
				end
			else
				action = lua_act:get_idle_act_name( bInCorsesBind, tidBindVehicle, r )
				if lua_act:IsFlyingVehicle( tidBindVehicle ) == 1 or CommonMountIdleAction[tidBindVehicle] ~= nil then
					mountAct = "站立"
				end
			end
			if mountAct == ACTIONSTRINGNULL then			
				m_rate1 = 90
				m_rate2 = 80
				m_rate3 = 70
				m_rate4 = 60
				m_rate5 = 50
				m_rate6 = 40
				m_rate7 = 30
				if r > m_rate1 then
					mountAct = "休闲动作1"
				elseif r > m_rate2 then
					mountAct = "休闲动作2"
				elseif r > m_rate3 then
					mountAct = "休闲动作3"
				elseif r > m_rate4 then
					mountAct = "休闲动作4"
				elseif r > m_rate5 then
					mountAct = "休闲动作5"
				elseif r > m_rate6 then
					mountAct = "休闲动作6"
				elseif r > m_rate7 then
					mountAct = "休闲动作7"
				else
				    mountAct = ACTIONSTRINGNULL
				end
			end
			--LogPrintA(r .. " - " .. action .. " - " .. mountAct)
        break;end;--[[
  
被击退]]	if  iAct == ObjectLogicActFlag.BEATBACK then
			action = "被击退"
			mountAct = "受伤3"
        break;end;--[[
拿出武器]]	if iAct == ObjectLogicActFlag.DRAWWEAPON then
			--LogPrintA("================================")
			--LogPrintA("拿出武器：iStance = " .. iStance .. " iWeapon = " .. iWeapon)
			--LogPrintA("================================")
			if iStance == STANCE_TYPE.TRANS1 and iWeapon == 3 then
				action = "气宗抽刀"
			elseif iStance == STANCE_TYPE.TRANS1 and iWeapon == 4 then
				action = "双剑抽刀"
			elseif iStance == STANCE_TYPE.NORMAL and iWeapon == 6 then
				action = "双刀抽刀"
			elseif iStance == STANCE_TYPE.NORMAL and iWeapon == 7 then
				action = "鞭法抽刀"
			else
				action = "抽刀"
			end
			--LogPrintA("Stance = " .. iStance .. ",OUT: " .. action)
			mountAct = "抽刀"
        break;end;--[[
收起武器]]	if iAct == ObjectLogicActFlag.RETURNWEAPON then
			if iStance == STANCE_TYPE.TRANS1 and iWeapon == 3 then
				action = "气宗收刀"
			elseif iStance == STANCE_TYPE.TRANS1 and iWeapon == 4 then
				action = "双剑收刀"
			elseif iStance == STANCE_TYPE.NORMAL and iWeapon == 6 then
				action = "双刀收刀"
			elseif iStance == STANCE_TYPE.NORMAL and iWeapon == 7 then
				action = "鞭法收刀"
			else
				action = "收刀"
			end
			--LogPrintA("Stance = " .. iStance .. ",IN：" .. action)
			mountAct = "收刀"
        break;end;--[[
															   
												  
																							  
												  
																			   
					   
															
					  
																 
																			   
						 
															
					  
空中翻滚]]	if iAct == ObjectLogicActFlag.ROLL_INAIR then
			action = "空中前冲翻滚"
			--LogPrintA("ROLL_INAIR: JumpStage "..nJumpStage.."\n")
			if nJumpStage >= 3 then
				queue_action = "俯冲循环"				
			end
			mountAct = "" --"跳空中"
        break;end;--[[
绑定各阶段动作]]	if iAct == ObjectLogicActFlag.BINDACTION then
			action, actionTime, mountAct = lua_act:GetBindAction(iAct, tidBindVehicle, nBindType, nPosInBind, bBindFlag, nBindMax, nBindPhase, eBindLoverType, nPosInBindLover, nBindLoverPhase, fCurSpeed)
        break;end;--[[
表情回应动作]]	if iLogic == ObjectLogicActFlag.EMOTE_RESPONSE then
			--根据idEmote决定相应动作
			if nPosInBind == 0 or nPosInBindLover < 1  then
				--绑定时只有主乘做动作
				action = PlayerExpAction[idEmote + 1]
			end
        break;end;--[[
战场开局动作]]	if iAct == ObjectLogicActFlag.BATTLE_START then
			local winEmote = math.random(BATTLE_WIN_EMOTE.COUNT)
			action = PlayerExpAction[BATTLE_WIN_EMOTE[winEmote] + 1].string
			mountAct = "站立"
        break;end;--[[
战场胜利动作]]	if iAct == ObjectLogicActFlag.BATTLE_WIN then
       		action = CharacterTitleAction[iWeapon+1].show
			mountAct = "站立"
        break;end;--[[
战场失败动作]]	if iAct == ObjectLogicActFlag.BATTLE_LOSE then
			action = PlayerExpAction[EXPRESSION_TYPE.SAD + 1].string
			mountAct = "站立"
        break;end;--[[
联手下山专用]]	if  iAct == ObjectLogicActFlag.LIANSHOU then
			action = "zd_施法蓄力5_日月"
			mountAct = ACTIONSTRINGNULL
        break;end;--[[
摆摊]]	if iAct == ObjectLogicActFlag.OBJACT_BOOTH then
   			action = "摆摊循环"
        break;end;--[[
坐骑变形]]	if iAct == ObjectLogicActFlag.VEHICLE_CHANGE then
   					action, actionTime = lua_act:GetBindAction(iAct, tidBindVehicle, nBindType, nPosInBind, bBindFlag, nBindMax, nBindPhase, eBindLoverType, nPosInBindLover, nBindLoverPhase, fCurSpeed)
   					mountAct = "坐骑变形"
        	break;end;--[[
坐骑还原]]	if iAct == ObjectLogicActFlag.VEHICLE_RESTORE then
   					action, actionTime = lua_act:GetBindAction(iAct, tidBindVehicle, nBindType, nPosInBind, bBindFlag, nBindMax, nBindPhase, eBindLoverType, nPosInBindLover, nBindLoverPhase, fCurSpeed)
   					mountAct = "坐骑还原"
        	break;end;--[[
吃药]]	if iAct == ObjectLogicActFlag.TAKEMEDICINE then
					action = "连续吃药"
					break;end; --[[
飞行上升]] if iAct == ObjectLogicActFlag.FLY_RISEUP then
						action, actionTime = lua_act:GetBindAction(iAct, tidBindVehicle, nBindType, nPosInBind, bBindFlag, nBindMax, nBindPhase, eBindLoverType, nPosInBindLover, nBindLoverPhase, fCurSpeed)
						mountAct = "飞行翅膀垂直上升"
						break; end; --[[
飞行下降]] if iAct == ObjectLogicActFlag.FLY_FALLDOWN then
						action, actionTime = lua_act:GetBindAction(iAct, tidBindVehicle, nBindType, nPosInBind, bBindFlag, nBindMax, nBindPhase, eBindLoverType, nPosInBindLover, nBindLoverPhase, fCurSpeed)
						mountAct = "飞行翅膀向下"
						break; end; --[[
跳跃燕行]] if iAct == ObjectLogicActFlag.JUMP_SWALLOWMOVE then
						action = "四段跳"
						break; end; --[[
奏乐站立]] if iAct == ObjectLogicActFlag.MUSIC_STAND then
			if musicType == 0 then
				action = "弹琴站立循环"
			elseif musicType == 1 then
				action = "吹笛站立循环"
			else
				action = "站立"
			end
			break;end;--[[
奏乐开始]] if iAct == ObjectLogicActFlag.MUSIC_START then
			if musicType == 0 then
				action = "弹琴开始"
			elseif musicType == 1 then
				action = "吹笛开始"
			else
				action = "站立"
			end
			break;end;--[[
奏乐弹奏]] if iAct == ObjectLogicActFlag.MUSIC_PLAY then
			if musicType == 0 then
				action = "弹琴演奏循环"
			elseif musicType == 1 then
				action = "吹笛演奏循环"
			else
				action = "站立"
			end
			break;end;--[[
奏乐弹奏]] if iAct == ObjectLogicActFlag.MUSIC_STOP then
			if musicType == 0 then
				action = "弹琴结束"
			elseif musicType == 1 then
				action = "吹笛结束"
			else
				action = "站立"
			end
			break;end;--[[
大逃杀庆祝]]	if iAct == ObjectLogicActFlag.ESCAPE_CELEBRATE then
					action = "大逃杀吃肉"
					break;end; --[[
换子弹]]	if iAct == ObjectLogicActFlag.RELOAD then
					action = "战场换弹"
			break;end; --[[
演奏]]	if iAct == ObjectLogicActFlag.PLAY_MUSIC then
			if musicType == 0 then
				action = "弹琴演奏循环"
			elseif musicType == 1 then
				action = "吹笛演奏循环"
			else
				action = "站立"
			end
		break;end; --[[																	 
default:]]	action = ACTIONSTRINGNULL
		mountAct = ACTIONSTRINGNULL
	until true
	--get prefix/infx/suffix then playerAct

	--LogPrintA(npcactname)

	if CombineActName[action] == nil then
		playerAct	= ACTIONSTRINGNULL
	else
		prefix 	= lua_act:GetActPrefix (action, nBindType, bBindFlag, nBindMax, eBindLoverType, nPosInBindLover, bBindLoverFlag)
		--LogPrintA(prefix)
		infix	= lua_act:GetActInfix (action, nBindType, nBindPhase, nPosInBind, bBindFlag, nBindMax, eBindLoverType, nPosInBindLover, bBindLoverFlag)
		--LogPrintA(infix)
		suffix	= lua_act:GetActSuffix (action, bBindFlag, iWeapon, iFaction, tStates, iStance)
		--LogPrintA(suffix)
		repeat	--[[pipiro's switch/case start
为空跳过]]	if action == ACTIONSTRINGNULL then
				playerAct = ACTIONSTRINGNULL
        	break;end;--[[
一段文本]]	if prefix  == ACTIONSTRINGNULL then
        		playerAct = string.format(CANNAMESIMPLESTYLE, action)
        	break;end;--[[
三段拼成]]	if infix == ACTIONSTRINGNULL then
        		playerAct = string.format(CANNAMENORMALSTYLE, prefix, action, suffix)
        	break;end;--[[
default:]]		playerAct = string.format(CANFULLNAMESTYLE, prefix, action, infix, suffix)
		until true
	end
	
	if queue_action and CombineActName[queue_action] then
		--LogPrintA("QueueAct: ".. queue_action .."\n")
		prefix 	= lua_act:GetActPrefix (queue_action, nBindType, bBindFlag, nBindMax, eBindLoverType, nPosInBindLover, bBindLoverFlag)
		--LogPrintA(prefix)
		infix	= lua_act:GetActInfix (queue_action, nBindType, nBindPhase, nPosInBind, bBindFlag, nBindMax, eBindLoverType, nPosInBindLover, bBindLoverFlag)
		--LogPrintA(infix)
		suffix	= lua_act:GetActSuffix (queue_action, bBindFlag, iWeapon, iFaction, tStates, iStance)
		--LogPrintA(suffix)
		repeat	--[[pipiro's switch/case start
为空跳过]]	if queue_action == ACTIONSTRINGNULL then
				playerQueueAct = ACTIONSTRINGNULL
        	break;end;--[[
一段文本]]	if prefix  == ACTIONSTRINGNULL then
     		playerQueueAct = string.format(CANNAMESIMPLESTYLE, queue_action)
        	break;end;--[[
三段拼成]]	if infix == ACTIONSTRINGNULL then
     		playerQueueAct = string.format(CANNAMENORMALSTYLE, prefix, queue_action, suffix)
        	break;end;--[[
default:]]
		playerQueueAct = string.format(CANFULLNAMESTYLE, prefix, queue_action, infix, suffix)
		until true
	end

	--走跑融合调整
	--if iObjectType == OBJECT_TYPE.OCID_HOSTPLAYER then --HostPlayer才做走跑融合（暂时改成了全玩家都做走跑融合）]
		playerAct = string.gsub(playerAct, "pt_行走_", "pt_走跑上下坡_")
		playerAct = string.gsub(playerAct, "pt_奔跑_", "pt_走跑上下坡_")
	--end

	if TestShowItemId == 1 then
		LogPrintA("动作id：" .. iAct .. "，玩家动作：" .. playerAct .. "，骑乘动作：" .. mountAct)
	end

	--LogPrintA(playerAct)

	return playerAct, playerQueueAct, mountAct, mountMoveTurnAct, actionTime
end

-------------------------------------------
-----	Get Movable Perform Act Name ------
function lua_act:GetMovablePerformAct(iLogicAct, iLowerAct, idPerform)

	local mUpperAct = ACTIONSTRINGNULL
	local mSkillAct = ACTIONSTRINGNULL
	local bFullAct = false

	local tabPerf = MovablePerformAction[idPerform]

	if tabPerf ~= nil then
		if tabPerf[iLowerAct] ~= nil then
			mSkillAct = tabPerf[iLowerAct][1]
			bFullAct = tabPerf[iLowerAct][2]
		else
			mSkillAct = tabPerf["default"][1]
			bFullAct = tabPerf["default"][2]
		end

		if tabPerf["Upper"] and tabPerf["Upper"][iLogicAct] then
			mUpperAct = tabPerf["Upper"][iLogicAct]
			--strDbg = string.format("lua_act:GetMovablePerformAct: UpperAct %s", mUpperAct)
			--LogPrintA(strDbg)
		else
			mUpperAct = mSkillAct
		end
	end

	if mUpperAct == nil then
		mUpperAct = ACTIONSTRINGNULL
	end

	if mSkillAct == nil then
		mSkillAct = ACTIONSTRINGNULL
	end

	if bFullAct == nil then
		bFullAct = false
	end

	--local strDbg = string.format("lua_act:GetMovablePerformAct: Upper %d, Lower %d, Perform %d: UpperAct %s, SkillAct %s, bFullAct %d",
	--		iLogicAct, iLowerAct, idPerform, mUpperAct, mSkillAct, bFullAct and 1 or 0)
	--LogPrintA(strDbg)
	return mUpperAct, mSkillAct, bFullAct

end
-------------------------------------------



-------------------------------------------
--monster / NPC / pet input variables definition
--iLogic		Logic act type 		int		refer to Visual.lua
--iNPCType		NPC Type			int		See NPCLogicType in Visual.lua
--iWeapon		Weapon attack type	int		refer to Visual.lua
--iInGuard		Combat state		int		0false,1true
--iStance							int 	See STANCE_TYPE in Visual.lua
--tStates		Visual states		tab		bool*64
--iPerformID	Peform ID			int		new in xa, not skill's self-perform count.
--iTemplID		Template ID			int		monster id / npc id / pet id
--HitType		Attack Direction	int		To match attacking and behit animation's direction
--iAliasHash 	别名的哈希值
--fCurSpeed		当前的速度
--idModel 		模型ID
--bIgnoreSpeed	取动作时是否忽略速度
--nCamSpecOpType 	相机特殊操作模式	int		refer to CAM_SPECOP_XXX in Visual.lua
--tidBindVehicle					int		绑定对应的交通工具模板ID。 0表示没有
--nBindType							int		绑定类型：0骑乘，1携带，2角色间绑定，3凳子。 < 0 表示没有
--nPosInBind						int		绑定位置：0位置为主体
--bBindFlag							int		绑定状态：0-未绑，1-已绑且模型绑，2-已绑但模型未绑上
--nBindPhase						int		绑定的阶段：见action.lua的BindActPhase定义
--idEmote							int		表情id
--iDartCarState 			bool 	镖车状态: 0-无，1-免疫
--iGroundWater 				int		地面、水面状态。0: 地面, 1: 水中, 2: 水面
																			   
																	 

-- get monster / NPC / pet action
function lua_act:GetECMNameNPC(iAct, iNPCType, iWeapon, iInGuard, iStance, tStates, iPerformID, iTemplID, HitType, iAliasHash, fCurSpeed, idModel, bIgnoreSpeed, nCamSpecOpType, tidBindVehicle, nBindType, nPosInBind, bBindFlag, nBindPhase, idEmote, iDartCarState, iGroundWater)

	--define local vals
	local npcactname = ACTIONSTRINGNULL
	local npcstandname = ACTIONSTRINGNULL
	local fAdjustSpeed = 1.0
	local actionTime = 0

	iAct, fAdjustSpeed = lua_act:GetModelActionSpeedNpc(iAct, iStance, idModel, fCurSpeed, bIgnoreSpeed, tidBindVehicle, iInGuard)

	--if iNPCType == NPCLogicType.PLAYER_TRANSFORM then
	--	local strdbg = string.format("NPC iAct: %d\n", iAct)
	--	LogPrint(strdbg)
	--end

	if nCamSpecOpType == CAM_SPECOP_LOCKFACE_RUN then
		-- 相机锁方向跑动：将行走等动作均换为奔跑
		iAct = lua_act:ReplaceSpecOpAct(iAct)
	end

	local bForceSpeed = false

	--get action name by event
	repeat	--[[pipiro's switch/case start
站立]]	if iAct == ObjectLogicActFlag.STAND then
		npcactname =  lua_act:GetMonsterSpecialAction(iAct, iNPCType, iInGuard, tStates, iTemplID, iAliasHash, idModel)
		if npcactname == ACTIONSTRINGNULL then
																			   
													   
			if iNPCType == NPCLogicType.PET and iGroundWater == 1 then
				--宠物：有水中站立
				npcactname = "水中站立动作"
			elseif iDartCarState == 1 then
				npcactname = "站立免疫"
			elseif tidBindVehicle > 0 then
		    npcactname, actionTime = lua_act:GetBindAction(iAct, tidBindVehicle, nBindType, nPosInBind, bBindFlag, nBindMax, nBindPhase, -1, -1, -1, fCurSpeed)
			elseif iInGuard == 0 then
				npcactname = "站立"
			else
				npcactname = "战斗站立"
			end
		elseif npcactname == ACTIONSTRINGSPECIAL then
			npcactname = ACTIONSTRINGNULL
		end
        break;end;--[[
防御]]	if iAct == ObjectLogicActFlag.GUARD then
		--LogPrintA("GUARD！！！")
		npcactname =  lua_act:GetMonsterSpecialAction(iAct, iNPCType, iInGuard, tStates, iTemplID, iAliasHash, idModel)
		if npcactname == ACTIONSTRINGNULL then
			npcactname = "战斗站立"
		elseif npcactname == ACTIONSTRINGSPECIAL then
			npcactname = ACTIONSTRINGNULL
		end
		break;end;--[[
行走]]	if iAct == ObjectLogicActFlag.WALK then
		npcactname =  lua_act:GetMonsterSpecialAction(iAct, iNPCType, iInGuard, tStates, iTemplID, iAliasHash, idModel)
		if npcactname == ACTIONSTRINGNULL then
			if iNPCType == NPCLogicType.PET and iGroundWater == 1 then
				--宠物：有游泳动作
				npcactname = "游泳动作"
			elseif tidBindVehicle > 0 then
		    npcactname, actionTime = lua_act:GetBindAction(iAct, tidBindVehicle, nBindType, nPosInBind, bBindFlag, nBindMax, nBindPhase, -1, -1, -1, fCurSpeed)
			elseif MonsterVisual.DisableWRB and MonsterVisual.DisableWRB[idModel] then
				npcactname = "行走"
			else
				npcactname = "走跑"
				bForceSpeed = true
			end
		elseif npcactname == "行走" then
			if MonsterVisual.DisableWRB and MonsterVisual.DisableWRB[idModel] then
				npcactname = "行走"
			else
				npcactname = "走跑"
				bForceSpeed = true
			end
		elseif npcactname == ACTIONSTRINGSPECIAL then
			npcactname = ACTIONSTRINGNULL
		else
			npcactname = npcactname
		end
        break;end;--[[
奔跑]]	if iAct == ObjectLogicActFlag.RUN then
--		LogPrint("00")
		npcactname =  lua_act:GetMonsterSpecialAction(iAct, iNPCType, iInGuard, tStates, iTemplID, iAliasHash, idModel)
		if npcactname == ACTIONSTRINGNULL then
			if iNPCType == NPCLogicType.PET and iGroundWater == 1 then
				--宠物：有游泳动作
				npcactname = "游泳动作"
			elseif iDartCarState == 1 then
				npcactname = "战斗奔跑免疫"
			elseif tidBindVehicle > 0 then
		    npcactname, actionTime = lua_act:GetBindAction(iAct, tidBindVehicle, nBindType, nPosInBind, bBindFlag, nBindMax, nBindPhase, -1, -1, -1, fCurSpeed)
			elseif iNPCType == NPCLogicType.RIDE_VEHICLE or iNPCType == NPCLogicType.BECKON then
				npcactname = "奔跑"
			else
				if MonsterVisual.DisableWRB and MonsterVisual.DisableWRB[idModel] then
					npcactname = "战斗奔跑"
				else
					npcactname = "走跑"
					bForceSpeed = true
				end
			end
		elseif npcactname == "战斗奔跑" then
			if MonsterVisual.DisableWRB and MonsterVisual.DisableWRB[idModel] then
				npcactname = "战斗奔跑"
			else
				npcactname = "走跑"
				bForceSpeed = true
			end
		elseif npcactname == ACTIONSTRINGSPECIAL then
			npcactname = ACTIONSTRINGNULL
		else
			npcactname = npcactname
		end
        break;end;--[[
起跳]]	if  iAct == ObjectLogicActFlag.JUMPSTART then
		if tidBindVehicle > 0 then
		    npcactname, actionTime = lua_act:GetBindAction(iAct, tidBindVehicle, nBindType, nPosInBind, bBindFlag, nBindMax, nBindPhase, -1, -1, -1, fCurSpeed)
		else	
			npcactname = "跳起"
		end
        break;end;--[[
跳跃循环]]	if  iAct == ObjectLogicActFlag.JUMPLOOP then
		if tidBindVehicle > 0 then
		    npcactname, actionTime = lua_act:GetBindAction(iAct, tidBindVehicle, nBindType, nPosInBind, bBindFlag, nBindMax, nBindPhase, -1, -1, -1, fCurSpeed)
		else
			npcactname = "空中循环"
		end
        break;end;--[[

落地前缓冲]] if iAct == ObjectLogicActFlag.JUMPLAND_PREPARE then
		npcactname = "落地"
        break;end;--[[
着地]]	if  iAct == ObjectLogicActFlag.JUMPLAND then
		if tidBindVehicle > 0 then
		    npcactname, actionTime = lua_act:GetBindAction(iAct, tidBindVehicle, nBindType, nPosInBind, bBindFlag, nBindMax, nBindPhase, -1, -1, -1, fCurSpeed)
		else
			npcactname = "落地"
		end
        break;end;--[[
原地转向]] if iAct == ObjectLogicActFlag.TURN then
		if tidBindVehicle > 0 then
		    npcactname, actionTime = lua_act:GetBindAction(iAct, tidBindVehicle, nBindType, nPosInBind, bBindFlag, nBindMax, nBindPhase, -1, -1, -1, fCurSpeed)
		else
			npcactname = "行走"
		end
			LASTACTLOGIC = nil
        break;end;--[[
站立前碰撞]]	if iAct == ObjectLogicActFlag.STAND_COLLIDE_FRONT then
			npcactname =  lua_act:GetMonsterSpecialAction(iAct, iNPCType, iInGuard, tStates, iTemplID, iAliasHash, idModel)
			if npcactname == ACTIONSTRINGNULL then
				npcactname = "后碰撞"
			elseif npcactname == ACTIONSTRINGSPECIAL then
				npcactname = ACTIONSTRINGNULL
			end
        break;end;--[[
站立后碰撞]]	if iAct == ObjectLogicActFlag.STAND_COLLIDE_BACK then
			npcactname =  lua_act:GetMonsterSpecialAction(iAct, iNPCType, iInGuard, tStates, iTemplID, iAliasHash, idModel)
			if npcactname == ACTIONSTRINGNULL then
				npcactname = "后碰撞"
			elseif npcactname == ACTIONSTRINGSPECIAL then
				npcactname = ACTIONSTRINGNULL
			end
        break;end;--[[
站立左碰撞]]	if iAct == ObjectLogicActFlag.STAND_COLLIDE_LEFT then
			npcactname =  lua_act:GetMonsterSpecialAction(iAct, iNPCType, iInGuard, tStates, iTemplID, iAliasHash, idModel)
			if npcactname == ACTIONSTRINGNULL then
				npcactname = "左碰撞"
			elseif npcactname == ACTIONSTRINGSPECIAL then
				npcactname = ACTIONSTRINGNULL
			end
        break;end;--[[
站立右碰撞]]	if iAct == ObjectLogicActFlag.STAND_COLLIDE_RIGHT then
			npcactname =  lua_act:GetMonsterSpecialAction(iAct, iNPCType, iInGuard, tStates, iTemplID, iAliasHash, idModel)
			if npcactname == ACTIONSTRINGNULL then
				npcactname = "右碰撞"
			elseif npcactname == ACTIONSTRINGSPECIAL then
				npcactname = ACTIONSTRINGNULL
			end
        break;end;--[[
行走前碰撞]]	if iAct == ObjectLogicActFlag.WALK_COLLIDE_FRONT then
			npcactname =  lua_act:GetMonsterSpecialAction(iAct, iNPCType, iInGuard, tStates, iTemplID, iAliasHash, idModel)
			if npcactname == ACTIONSTRINGNULL then
				npcactname = "右碰撞"
			elseif npcactname == ACTIONSTRINGSPECIAL then
				npcactname = ACTIONSTRINGNULL
			end
        break;end;--[[
行走后碰撞]]	if iAct == ObjectLogicActFlag.WALK_COLLIDE_BACK then
			npcactname =  lua_act:GetMonsterSpecialAction(iAct, iNPCType, iInGuard, tStates, iTemplID, iAliasHash, idModel)
			if npcactname == ACTIONSTRINGNULL then
				npcactname = "左碰撞"
			elseif npcactname == ACTIONSTRINGSPECIAL then
				npcactname = ACTIONSTRINGNULL
			end
        break;end;--[[
行走左碰撞]]	if iAct == ObjectLogicActFlag.WALK_COLLIDE_LEFT then
			npcactname =  lua_act:GetMonsterSpecialAction(iAct, iNPCType, iInGuard, tStates, iTemplID, iAliasHash, idModel)
			if npcactname == ACTIONSTRINGNULL then
				npcactname = "左碰撞"
			elseif npcactname == ACTIONSTRINGSPECIAL then
				npcactname = ACTIONSTRINGNULL
			end
        break;end;--[[
行走右碰撞]]	if iAct == ObjectLogicActFlag.WALK_COLLIDE_RIGHT then
			npcactname =  lua_act:GetMonsterSpecialAction(iAct, iNPCType, iInGuard, tStates, iTemplID, iAliasHash, idModel)
			if npcactname == ACTIONSTRINGNULL then
				npcactname = "右碰撞"
			elseif npcactname == ACTIONSTRINGSPECIAL then
				npcactname = ACTIONSTRINGNULL
			end
        break;end;--[[
奔跑前碰撞]]	if iAct == ObjectLogicActFlag.RUN_COLLIDE_FRONT then
			npcactname =  lua_act:GetMonsterSpecialAction(iAct, iNPCType, iInGuard, tStates, iTemplID, iAliasHash, idModel)
			if npcactname == ACTIONSTRINGNULL then
				npcactname = "左碰撞"
			elseif npcactname == ACTIONSTRINGSPECIAL then
				npcactname = ACTIONSTRINGNULL
			end
        break;end;--[[
奔跑后碰撞]]	if iAct == ObjectLogicActFlag.RUN_COLLIDE_BACK then
			npcactname =  lua_act:GetMonsterSpecialAction(iAct, iNPCType, iInGuard, tStates, iTemplID, iAliasHash, idModel)
			if npcactname == ACTIONSTRINGNULL then
				npcactname = "右碰撞"
			elseif npcactname == ACTIONSTRINGSPECIAL then
				npcactname = ACTIONSTRINGNULL
			end
        break;end;--[[
奔跑左碰撞]]	if iAct == ObjectLogicActFlag.RUN_COLLIDE_LEFT then
			npcactname =  lua_act:GetMonsterSpecialAction(iAct, iNPCType, iInGuard, tStates, iTemplID, iAliasHash, idModel)
			if npcactname == ACTIONSTRINGNULL then
				npcactname = "左碰撞"
			elseif npcactname == ACTIONSTRINGSPECIAL then
				npcactname = ACTIONSTRINGNULL
			end
        break;end;--[[
奔跑右碰撞]]	if iAct == ObjectLogicActFlag.RUN_COLLIDE_RIGHT then
			npcactname =  lua_act:GetMonsterSpecialAction(iAct, iNPCType, iInGuard, tStates, iTemplID, iAliasHash, idModel)
			if npcactname == ACTIONSTRINGNULL then
				npcactname = "右碰撞"
			elseif npcactname == ACTIONSTRINGSPECIAL then
				npcactname = ACTIONSTRINGNULL
			end
        break;end;--[[
出生]]	if iAct == ObjectLogicActFlag.BORN then
		local defactname, speactname
		defactname =  lua_act:GetMonsterSpecialAction(ObjectLogicActFlag.CUSTOM_NPCBORNDEFAULT, iNPCType, iInGuard, tStates, iTemplID, iAliasHash, idModel)
		speactname =  lua_act:GetMonsterSpecialAction(iAct, iNPCType, iInGuard, tStates, iTemplID, iAliasHash, idModel)
		if speactname == ACTIONSTRINGNULL then
			if iNPCType == NPCLogicType.PET and iGroundWater == 1 then
				--宠物：有水中站立
				npcactname = "水中站立动作"
			elseif defactname == ACTIONSTRINGNULL then
   				npcactname = "休闲动作3"
			else
				npcactname = defactname
			end
		elseif npcactname == ACTIONSTRINGSPECIAL then
			npcactname = ACTIONSTRINGNULL
		else
			npcactname = speactname
		end
        break;end;--[[
召呼]]	if iAct == ObjectLogicActFlag.GREETING then
   			npcactname = "交谈"
			LASTACTLOGIC = iAct
        break;end;--[[
技能]]	if iAct == ObjectLogicActFlag.CASTSKILL then
			if SkillPerformActionNPC[iPerformID] == nil then
			    npcactname = ACTIONSTRINGNULL
			else
			    if SkillPerformActionNPC[iPerformID].condtype == 0 then
			        npcactname = SkillPerformActionNPC[iPerformID].fixact
			    else
			        npcactname = lua_act:GetSkillCondActionNPC (iInGuard, tStates, iPerformID)
				end
			end
        break;end;--[[
受伤]]	if iAct == ObjectLogicActFlag.WOUNDED then

		if iNPCType == NPCLogicType.RIDE_VEHICLE then
			npcactname = "受伤动作"

		else

			--加入攻击方位和挨打方向的匹配逻辑
			--HitType：1-左边半身挨打；2-右边半身挨打；3-后仰半身挨打；4-前躬半身挨打；5-左边全身挨打；6-右边全身挨打；7-后仰全身挨打；8-前躬全身挨打
			if HitType == 1 then
				npcactname = "受伤1"
			elseif HitType == 2 then
				npcactname = "受伤2"
			elseif HitType == 3 then
				npcactname = "受伤3"
			elseif HitType == 4 then
				npcactname = "受伤4"
			elseif HitType == 5 then
				npcactname = "受伤1"
			elseif HitType == 6 then
				npcactname = "受伤2"
			elseif HitType == 7 then
				npcactname = "受伤3"
			elseif HitType == 8 then
				npcactname = "受伤4"
			else
				npcactname = "受伤1"
			end
			if iStance == STANCE_TYPE.BLOCK then
				if MonsterVisual.ForceAction[iTemplID] then
					if MonsterVisual.ForceAction[iTemplID].canblock == true then
						if HitType == 1 or HitType == 5 then
							npcactname = "格挡击中右"
						elseif HitType == 2 or HitType == 6 then
							npcactname = "格挡击中左"
						else
							local r
							r = math.random()*100
							if r > 50 then
								npcactname = "格挡击中右"
							else
								npcactname = "格挡击中左"
							end
						end
					end
				end
			end
			--LogPrintA("iStance = " .. iStance .. ", 动作名 = " .. npcactname)
		end
        break;end;--[[
死亡]]	if iAct == ObjectLogicActFlag.DIED then
							   
												   
	   
			npcactname =  lua_act:GetMonsterSpecialAction(iAct, iNPCType, iInGuard, tStates, iTemplID, iAliasHash, idModel)
			if npcactname == ACTIONSTRINGNULL then
   				npcactname = "死亡"
	   
			end
        break;end;--[[
死亡循环]]	if iAct == ObjectLogicActFlag.DIEDLOOP then
			npcactname =  lua_act:GetMonsterSpecialAction(iAct, iNPCType, iInGuard, tStates, iTemplID, iAliasHash, idModel)
			if npcactname == ACTIONSTRINGNULL then
   				npcactname = "死亡循环"
			end
        break;end;--[[
随机休闲]]	if iAct == ObjectLogicActFlag.IDLE then
			npcactname =  lua_act:GetMonsterSpecialAction(iAct, iNPCType, iInGuard, tStates, iTemplID, iAliasHash, idModel)
			if npcactname == ACTIONSTRINGNULL then
				if iNPCType == NPCLogicType.PET and iGroundWater == 1 then
					--宠物：有水中站立动作，不播休闲（休闲是陆地上的）
					npcactname = "水中站立动作"
				else
					local numIdleActs = 2 --普通npc有2个休闲动作
					if iNPCType == NPCLogicType.PET then --宠物有4个休闲动作
						numIdleActs = 4
					end
					local randomnum = math.random(numIdleActs)
					npcactname = string.format("休闲动作%d", randomnum)
				end
			elseif npcactname == ACTIONSTRINGSPECIAL then
				npcactname = ACTIONSTRINGNULL
			end
        break;end;--[[
休闲1]]	if iAct == ObjectLogicActFlag.IDLE1 then
			if iNPCType == NPCLogicType.PET and iGroundWater == 1 then
				--宠物：有水中站立动作，不播休闲（休闲是陆地上的）
				npcactname = "水中站立动作"
			else
				npcactname = "休闲动作1"
			end
        break;end;--[[
休闲2]]	if iAct == ObjectLogicActFlag.IDLE2 then
			if iNPCType == NPCLogicType.PET and iGroundWater == 1 then
				--宠物：有水中站立动作，不播休闲（休闲是陆地上的）
				npcactname = "水中站立动作"
			else
				npcactname = "休闲动作2"
			end
        break;end;--[[
休闲3]]	if iAct == ObjectLogicActFlag.IDLE3 then
			if iNPCType == NPCLogicType.PET and iGroundWater == 1 then
				--宠物：有水中站立动作，不播休闲（休闲是陆地上的）
				npcactname = "水中站立动作"
			else
				npcactname = "休闲动作3"
			end
        break;end;--[[
休闲4]]	if iAct == ObjectLogicActFlag.IDLE4 then
			if iNPCType == NPCLogicType.PET and iGroundWater == 1 then
				--宠物：有水中站立动作，不播休闲（休闲是陆地上的）
				npcactname = "水中站立动作"
			else
				npcactname = "休闲动作4"
			end
        break;end;--[[
												  
															 
																			  
									 
	   
								
	  
					  
												  
															 
																			  
									 
	   
								
	  
					  

随机交互]]	if iAct == ObjectLogicActFlag.INTERACT then
			local randomnum = math.random(4)
			npcactname = string.format("交互动作%d", randomnum)
        break;end;--[[
交互1]]	if iAct == ObjectLogicActFlag.INTERACT1 then
			npcactname = "交互动作1"
        break;end;--[[
交互2]]	if iAct == ObjectLogicActFlag.INTERACT2 then
			npcactname = "交互动作2"
        break;end;--[[
交互3]]	if iAct == ObjectLogicActFlag.INTERACT3 then
			npcactname = "交互动作3"
        break;end;--[[
交互4]]	if iAct == ObjectLogicActFlag.INTERACT4 then
			npcactname = "交互动作4"
        break;end;--[[
索敌前进]]	if iAct == ObjectLogicActFlag.MOVEFOWARD then
--			LogPrint("11")
			npcactname = lua_act:GetMonsterSpecialAction(iAct, iNPCType, iInGuard, tStates, iTemplID, iAliasHash, idModel)
			if npcactname == ACTIONSTRINGNULL then
				if MonsterVisual.ForceAction[iTemplID] then
					if MonsterVisual.ForceAction[iTemplID].locktarget == 1 then
						npcactname = "索敌前进"
					elseif MonsterVisual.ForceAction[iTemplID].locktarget == 2 then
						npcactname = "行走"
					elseif MonsterVisual.ForceAction[iTemplID].locktarget == 4 then
						npcactname = "隐形奔跑"
					else
						npcactname = "战斗奔跑"
					end
				else
					npcactname = "战斗奔跑"
				end
			elseif npcactname == ACTIONSTRINGSPECIAL then
				npcactname = ACTIONSTRINGNULL
			else
				npcactname = npcactname
			end
        break;end;--[[
索敌右移]]	if iAct == ObjectLogicActFlag.MOVERIGHT then
--			LogPrint("22")
			npcactname =  lua_act:GetMonsterSpecialAction(iAct, iNPCType, iInGuard, tStates, iTemplID, iAliasHash, idModel)
			if npcactname == ACTIONSTRINGNULL then
				if MonsterVisual.ForceAction[iTemplID] then
					if MonsterVisual.ForceAction[iTemplID].locktarget == 1 then
						npcactname = "索敌右移"
					elseif MonsterVisual.ForceAction[iTemplID].locktarget == 2 then
						npcactname = "行走"
					elseif MonsterVisual.ForceAction[iTemplID].locktarget == 4 then
						npcactname = "隐形奔跑"
					else
						npcactname = "战斗奔跑"
					end
				else
					npcactname = "战斗奔跑"
				end
			elseif npcactname == ACTIONSTRINGSPECIAL then
				npcactname = ACTIONSTRINGNULL
			else
				npcactname = npcactname
			end
        break;end;--[[
索敌后退]]	if iAct == ObjectLogicActFlag.MOVEBACK then
--			LogPrint("33")
			npcactname =  lua_act:GetMonsterSpecialAction(iAct, iNPCType, iInGuard, tStates, iTemplID, iAliasHash, idModel)
			if npcactname == ACTIONSTRINGNULL then
				if MonsterVisual.ForceAction[iTemplID] then
					if MonsterVisual.ForceAction[iTemplID].locktarget == 1 then
						npcactname = "索敌后退"
					elseif MonsterVisual.ForceAction[iTemplID].locktarget == 2 then
						npcactname = "行走"
					elseif MonsterVisual.ForceAction[iTemplID].locktarget == 4 then
						npcactname = "隐形奔跑"
					else
						npcactname = "战斗奔跑"
					end
				else
					npcactname = "战斗奔跑"
				end
			elseif npcactname == ACTIONSTRINGSPECIAL then
				npcactname = ACTIONSTRINGNULL
			else
				npcactname = npcactname
			end
        break;end;--[[
索敌左移]]	if iAct == ObjectLogicActFlag.MOVELEFT then
--			LogPrint("44")
			npcactname =  lua_act:GetMonsterSpecialAction(iAct, iNPCType, iInGuard, tStates, iTemplID, iAliasHash, idModel)
			if npcactname == ACTIONSTRINGNULL then
				if MonsterVisual.ForceAction[iTemplID] then
					if MonsterVisual.ForceAction[iTemplID].locktarget == 1 then
						npcactname = "索敌左移"
					elseif MonsterVisual.ForceAction[iTemplID].locktarget == 2 then
						npcactname = "行走"
					elseif MonsterVisual.ForceAction[iTemplID].locktarget == 4 then
						npcactname = "隐形奔跑"
					else
						npcactname = "战斗奔跑"
					end
				else
					npcactname = "战斗奔跑"
				end
			elseif npcactname == ACTIONSTRINGSPECIAL then
				npcactname = ACTIONSTRINGNULL
			else
				npcactname = npcactname
			end
        break;end;--[[
表情回应动作]]	if iAct == ObjectLogicActFlag.EMOTE_RESPONSE then
			--TODO: 根据idEmote决定相应动作
			if iNPCType == NPCLogicType.PET then
				npcactname = string.format("交互动作%d", idEmote%4+1)
			elseif iNPCType == NPCLogicType.NPC then
				local act_id = Emote:GetEmoteActname(idEmote, 0, iAct, iTemplID)
				npcactname = string.format("休闲动作%d",act_id)
			else
				npcactname = ""
			end
        break;end;--[[
消失]]	if iAct == ObjectLogicActFlag.DISAPPEAR then
   			npcactname = ACTIONSTRINGNULL			--以后如果需要调用再具体根据NPC添加
        break;end;--[[
被击退]]	if iAct == ObjectLogicActFlag.BEATBACK then
   			npcactname = "被击退"
        break;end;--[[
消失]]	if iAct == ObjectLogicActFlag.DISAPPEAR_NOTDEAD then
		npcactname =  lua_act:GetMonsterSpecialAction(iAct, iNPCType, iInGuard, tStates, iTemplID, iAliasHash, idModel)
		if npcactname == ACTIONSTRINGNULL then
   	 		npcactname = ACTIONSTRINGNULL
		elseif npcactname == ACTIONSTRINGSPECIAL then
			npcactname = ACTIONSTRINGNULL
		end
        break;end;--[[
绑定各阶段动作]]	if iAct == ObjectLogicActFlag.BINDACTION then
			npcactname, actionTime, npcstandname = lua_act:GetBindAction(iAct, tidBindVehicle, nBindType, nPosInBind, bBindFlag, nBindMax, nBindPhase, -1, -1, -1, fCurSpeed)

			--if iNPCType == NPCLogicType.PLAYER_TRANSFORM then
			--	local strdbg = string.format("NPC BindAction: %s, VehicleName %s\n", npcactname, npcstandname)
			--	LogPrintA(strdbg)
			--end

        break;end;--[[
绑定开始飞行坐骑动作]] if iAct == ObjectLogicActFlag.BINDFLYSTART then
			if lua_act:IsFlyingVehicle( idvehicle ) then
				npcactname = "上马"
			else
				npcactname = ACTIONSTRINGNULL
			end
			break; end; --[[																							   
default:]]
		npcactname = ACTIONSTRINGNULL
	until true

	--if iNPCType == NPCLogicType.PLAYER_TRANSFORM then
	--	LogPrintA("NPC Final Act: %s, %s\n", npcactname, npcstandname)
	--end

	--return
	return npcactname, npcstandname, bForceSpeed and 1 or fAdjustSpeed
end

-- 落地前缓冲动作配置
lua_act.JumpLandPrepareConfig =
{
	--动作		--离地高度小于多少开始播。<0表示无动作
	{"空中循环", 		-1.0			},	--一段跳
	{"空中循环", 		-1.0			},	--二段跳
	{"空中循环", 		-1.0			},	--三段跳
	{"落地准备", 		6.0			},	--四段跳
	{"", 			-1.0			},	--五段跳
}

function lua_act:GetJumpLandPrepareConfig()
	return lua_act.JumpLandPrepareConfig
end

-- 获取传送类绑定的MoveAlongPathID
-- tidBind: tid of bindessence
function lua_act:GetTransportBindMoveAlongPath(tidBind)
	local tab = BindAction[BindTypeEnum.TRANSPORT][tidBind]
	if tab == nil or tab.moveAlongPath == nil then
		return 0
	else
		return tab.moveAlongPath
	end
end

-- 获取骑乘类绑定的信息
-- tidBind: tid of bindessence
function lua_act:GetMountVehicleInfo(tidBind, type)
	local tab = BindAction[type] and BindAction[type][tidBind] or nil
	return tab and tab.MountInfo or nil
end


-- get action name for mine
-- tid 模板id
-- iAliasHash 别名的哈希值
function lua_act:GetECMNameForMine (tid, iAliasHash)
	local bornAct = "出生"
	local standAct = "站立"
	local deadAct = "死亡"
	if ModelSpecialAct[tid] then
		if ModelSpecialAct[tid].allName == true then
			bornAct = ModelSpecialAct[tid].forcebornAct
			standAct = ModelSpecialAct[tid].forcestandAct
			deadAct = ModelSpecialAct[tid].forcedeadAct
		else
			if ModelSpecialAct[tid].nameList[iAliasHash] then
				bornAct = ModelSpecialAct[tid].forcebornAct
				standAct = ModelSpecialAct[tid].forcestandAct
				deadAct = ModelSpecialAct[tid].forcedeadAct
			end
		end
	end
	--LogPrintA("tid = " .. tid .. ",iAliasHash = " .. iAliasHash .. ",bornAct = " .. bornAct .. ",standAct = " .. standAct .. ",deadAct = " .. deadAct)
	--可根据tid, iAliasHash单独配置
	--...
	return bornAct, standAct, deadAct
end

----get action conditional skillact name
function lua_act:GetSkillCondAction(iInGuard, tStates, iPerformID, iCount, iStance)
	--define local vals
	local testcond

	--get action by perform
	repeat	--[[pipiro's switch/case start
光效]]	if SkillPerformAction[iPerformID].condtype == 1 then
			for k , v in pairs(SkillPerformAction[iPerformID].condtab) do
				if v.condkey == 1 then							--condkey 1：光效条件与
				    testcond = true
					for s , t in pairs(v.condval) do
						testcond = testcond and tStates[t]
			    	end
				elseif v.condkey ==2 then						--condkey 2：光效条件或
				    testcond = false
					for s , t in pairs(v.condval) do
						testcond = testcond or tStates[t]
					end
	    		end
	    		if testcond == true then
	    		    return v.condact
		    	end
	    	end
	    	return SkillPerformAction[iPerformID].fixact
		end;--[[
变形]]	if SkillPerformAction[iPerformID].condtype == 2 then
			if iStance == STANCE_TYPE.BLOCK then
			    return SkillPerformAction[iPerformID].fixact
			elseif SkillPerformAction[iPerformID].condtab[iStance] == nil then
			    return SkillPerformAction[iPerformID].fixact
			else
			    return SkillPerformAction[iPerformID].condtab[iStance].condact
			end
		end;--[[
血量]]	if SkillPerformAction[iPerformID].condtype == 3 then
    		return ACTIONSTRINGNULL
		end;--[[
计数]]	if SkillPerformAction[iPerformID].condtype == 4 then
			if SkillPerformAction[iPerformID].condtab[iCount] == nil then
			    return SkillPerformAction[iPerformID].fixact
			else
		        return SkillPerformAction[iPerformID].condtab[iCount].condact
			end
		end;--[[
default:]]
		return ACTIONSTRINGNULL
	until true
end

----get action conditional skillact name
function lua_act:GetSkillCondActionNPC (iInGuard, tStates, iPerformID)

	--get action by perform
	repeat	--[[pipiro's switch/case start
随机]]	if SkillPerformActionNPC[iPerformID].condtype == 1 then
    		local countact = table.getn(SkillPerformActionNPC[iPerformID].condact)
			local randomact = math.random(countact)
    		return SkillPerformActionNPC[iPerformID].condact[randomact]
		end;--[[
default:]]
		return ACTIONSTRINGNULL
	until true

end


----get prefix by action
function lua_act:GetActPrefix (sAction, nBindType, bBindFlag, nBindMax, eBindLoverType, nPosInBindLover, bBindLoverFlag)

	--local strDbg = string.format("GetActPreFix: Action %s, BindType %d, bBindFlag %d, eBindLoverType %d, nPosInBindLover: %d\n",
	-- 	sAction, nBindType, bBindFlag, eBindLoverType, nPosInBindLover)
  --LogPrintA(strDbg)

  if bBindFlag ~= EC_CHILDBIND_LOGICBIND_NEEDMODEL and bBindFlag ~= EC_CHILDBIND_LOGICBIND_IGNOREMODEL
  	and ((eBindLoverType ~= BindLoverTypeEnum.HANDINHAND and eBindLoverType ~= BindLoverTypeEnum.CORSES_FLY and eBindLoverType ~= BindLoverTypeEnum.DANCETODANCE) or bBindLoverFlag == EC_CHILDBIND_MODEL_BIND) then
    --check special(ride/bind), if get return

		if nPosInBindLover == 1 then
			--相依相偎被绑：
			if nBindType == BindTypeEnum.MOUNT then
				--骑马相依相偎
				return PlayerActionPrefix[7]
			else
				return PlayerActionPrefix[4]
			end

		--骑乘类绑定
		elseif nBindType == BindTypeEnum.MOUNT then
			if nPosInBindLover == 0 then
				--骑马相依相偎（主绑）
				return PlayerActionPrefix[7]
			elseif nBindMax > 1 and nBindPhase == BindActPhase.DURATION
				and nPosInBind > 0 then -- 多人骑乘:只在绑定中的非主绑是双人动作
				if CombineActName[sAction][8] == true then
				    return PlayerActionPrefix[8]
				end
			else
				if CombineActName[sAction][7] == true then
				    return PlayerActionPrefix[7]
				end
			end

		--携带类绑定
		elseif nBindType == BindTypeEnum.CARRY then
			return PlayerActionPrefix[1]

		--角色间绑定
		elseif nBindType == BindTypeEnum.BETWEENROLE then
			if CombineActName[sAction][6] == true then
			    return PlayerActionPrefix[6]
			end
		end
	end
	
	--check available, if get return
  for i=1,8 do
      if CombineActName[sAction][i] == true then
      	--strDbg = string.format("Return %d: %s\n", i, PlayerActionPrefix[i])
      	--LogPrintA(strDbg)
      	return PlayerActionPrefix[i]
      end
  end

  return ACTIONSTRINGNULL
end

----get infix by action
--bBindFlag	绑定状态：0-未绑，1-已绑且模型绑，2-已绑但模型未绑上
function lua_act:GetActInfix (sAction, nBindType, nBindPhase, nPosInBind, bBindFlag, nBindMax, eBindLoverType, nPosInBindLover, bBindLoverFlag)

	--check special(ride/bind), if get return

	--local strDbg = string.format("GetActInfix: sAction %s, BindType %d, BindPhase %d, PosInBind %d, bBindFlag %d\n",
	-- 	sAction, nBindType, nBindPhase, nPosInBind, bBindFlag)
	--LogPrintA(strDbg)

	if (bBindFlag ~= EC_CHILDBIND_LOGICBIND_NEEDMODEL and bBindFlag ~= EC_CHILDBIND_LOGICBIND_IGNOREMODEL
		 	and nBindType >= 0 and nPosInBind >= 0)
		 or nPosInBindLover >= 0 then

		if nBindPhase == BindActPhase.END
			or (eBindLoverType == BindLoverTypeEnum.HANDINHAND and bBindLoverFlag ~= EC_CHILDBIND_MODEL_BIND) then
	    return ACTIONSTRINGNULL
	   end

		local cmbActDefine = CombineActName[sAction]

		if cmbActDefine then
			if nPosInBindLover >= 0 and nBindType == BindTypeEnum.MOUNT then
				--骑马相依相偎
				return PlayerActionInfix[6]
			elseif nPosInBindLover == 0 and nBindType >= 0 and nPosInBind >= 0
				and cmbActDefine[8] == true then
				return PlayerActionInfix[8]
			elseif cmbActDefine[6] == true then
				--LogPrint("  ActDefined 6\n")
				return PlayerActionInfix[6]
			elseif cmbActDefine[7] == true then
				--LogPrint("  ActDefined 7\n")
				return PlayerActionInfix[7]
			elseif cmbActDefine[8] == true then
				--LogPrint("  ActDefined 8\n")
				return PlayerActionInfix[8]
			end
		end
	end

--	if nPosInBindLover == 1 then
--		--相依相偎被绑：
--		return PlayerActionInfix[6]
--	elseif nBindType == BindTypeEnum.MOUNT then
--		--骑乘类绑定
--		if nBindMax > 1 and nBindPhase == BindActPhase.DURATION
--			and nPosInBind > 0 then -- 多人骑乘:只在绑定中的非主绑是双人动作
--			return PlayerActionInfix[8]
--		else
--			return PlayerActionInfix[7]
--		end
--	elseif nBindType == BindTypeEnum.CARRY then
--		--携带类绑定
--		return ACTIONSTRINGNULL
--	elseif nBindType == BindTypeEnum.BETWEENROLE then
--		--角色间绑定
--		return PlayerActionInfix[6]
--	elseif nPosInBindLover == 0 then
--		--相依相偎主绑：
--		return PlayerActionInfix[6]
--	end

    --return stringnull
    return ACTIONSTRINGNULL
end

----get suffix by action
function lua_act:GetActSuffix (sAction, bBindFlag, iWeapon, iFaction, tStates, iStance)
	local suftype = CombineActName[sAction].suftype
	local suffix

	--local strDbg = string.format("GetActSuffix: sAction %s, bBindFlag %d, Weapon %d, Faction %d, Stance %d, SufTpye %d\n",
	-- 	sAction, bBindFlag, iWeapon, iFaction, iStance, suftype)
	--LogPrintA(strDbg)
	
	--define local vals	

	--get suffix by suffixtype
	repeat	--[[pipiro's switch/case start
为空]]	if  suftype == ActStringFlag.NONE then
			suffix = ACTIONSTRINGNULL
			--LogPrint("SufType == NONE\n")
        break;end;--[[
通用]]	if  suftype == ActStringFlag.COMMON then
        	suffix = FactionList[iFaction+1].s_cmn
			--LogPrint("SufType == COMMON\n")
        break;end;--[[
门派]]	if  suftype == ActStringFlag.FACTION then
			--LogPrint("SufType == FACTION\n")
    		if FactionList[iFaction+1].w_spe == iWeapon then
    		    if iStance == STANCE_TYPE.NORMAL then						-- 临时的，将来改成取武器变形相同的东西
    		        suffix = FactionList[iFaction+1].s_chg1
    		    elseif iStance == STANCE_TYPE.TRANS1 then
    		        suffix = FactionList[iFaction+1].s_chg2
    		    elseif iStance == STANCE_TYPE.TRANS2 then
    		        suffix = FactionList[iFaction+1].s_chg3
    		    else
    		        suffix = FactionList[iFaction+1].s_spe
    		    end
    		else
    		    suffix = FactionList[iFaction+1].s_spe
    		end
        	--[[suffix = FactionList[1+CombineActName[sAction].deffac].s_spe--此句用来强行指定无论在任何武器变形下，都调用相同的动作]]
        break;end;--[[
武器]]	if  suftype == ActStringFlag.WEAPON then
			if iStance > STANCE_TYPE.BLOCK then
				local weaponList = WeaponList[iWeapon+1][iStance]
				if weaponList == nil then
					suffix = FactionList[iWeapon+1].s_spe
    			elseif weaponList == "空手" then
    				suffix = FactionList[iWeapon+1].s_cmn
    			else
    				suffix = FactionList[iWeapon+1].s_spe
				end
			else
			    suffix = FactionList[iWeapon+1].s_spe
			end
        break;end;--[[
未完]]	if  suftype == ActStringFlag.NOTFINISH then
    		if FactionList[iWeapon+1].s_tmp == "完成" then
        		suffix = FactionList[iWeapon+1].s_spe
    		else
    			suffix = FactionList[iWeapon+1].s_cmn
    		end
        break;end;--[[
default:]]
		suffix = ACTIONSTRINGNULL
	until true
	-- return
    return suffix
end

-- get bind action of Specified Pos
-- bLiftLover: 0-无Tab，1-未相依相偎，2-相依相偎主绑
function lua_act:GetBindActOfPos (actTab, nBindType, nPos, bLiftLover, fCurSpeed, nBindMax, VehicleSpecActPos)

	local action_str = ACTIONSTRINGNULL
	local mount_act = ACTIONSTRINGNULL

	if actTab then

		if actTab[nPos] ~= nil then
			--	该位置有定义
			if bLiftLover > 0 then
				--local str = string.format("BindType %d, nPos %d, bLiftLover %d, nBindMax %d, VehicleSpecActPos %d",
				--	nBindType, nPos, bLiftLover, nBindMax, VehicleSpecActPos and VehicleSpecActPos or -1)
				--LogPrint(str)

				if nBindType == BindTypeEnum.TRANSPORT then
					-- 传送类：第一个是传送主体动作
					if actTab[nPos][1] ~= nil then
						mount_act = string.format(actTab[nPos][1], nPos - 1)
					end
					bLiftLover = bLiftLover + 1
					--LogPrintA("TransportAct: "..mount_act.."\n")
				elseif nBindType == BindTypeEnum.CARRY and nPos == 1 then
					-- 携带且为主绑：mount_act为被携带模型的动作
					
					local nVehicleActPos = 1 --携带物动作，默认为位置1的第一个动作
					if VehicleSpecActPos ~= nil then -- 携带物单独配置了动作位置
						nVehicleActPos = VehicleSpecActPos
					end

					if actTab[nPos + 1] and actTab[nPos + 1][nVehicleActPos] ~= nil then
						mount_act = actTab[nPos + 1][nVehicleActPos]
						--LogPrintA("CarryAct: "..mount_act.."\n")
					end

					--单人携带：看是否有单人单独动作
					if nPos == 1 and nBindMax == 1 and actTab[nPos][3] then
						bLiftLover = 3
					end
				end

				action_str = actTab[nPos][bLiftLover]

																				  
											  
	   
	
				--local str = string.format("GetBindActOfPos: Pos: %d, bLiftLover: %d, Ret: %s.\n", nPos, bLiftLover, action_str and action_str or "nil")
				--LogPrintA(str)
			
				if actTab.duration ~= nil then

				end

			else
				action_str = actTab[nPos][1]
				
				if nBindType == BindTypeEnum.CARRY and nPos == 1 and nBindMax == 1 and actTab[nPos][3] then
					--单人携带：看是否有单人单独动作
					action_str = actTab[nPos][3]
				end
				
			end
				
		elseif actTab[#actTab] ~= nil then
			--	该位置未定义：用最后一个位置定义的动作
			if bLiftLover > 0 then

				if nBindType == BindTypeEnum.TRANSPORT then
					-- 传送类：第一个是传送主体动作
					if actTab[#actTab][1] ~= nil then
						mount_act = string.format(actTab[#actTab][1], nPos - 1)
					end
					bLiftLover = bLiftLover + 1
					--LogPrintA("TransportAct: "..mount_act.."\n")
				elseif nBindType == BindTypeEnum.CARRY and nPos == 1 then
					-- 携带且为主绑：取被携带模型的动作
					if actTab[nPos + 1] and actTab[nPos + 1][1] ~= nil then
						mount_act = actTab[nPos + 1][1]
						--LogPrintA("CarryAct: "..mount_act.."\n")
					end
				end

				action_str = actTab[#actTab][bLiftLover]
			else
				action_str = actTab[#actTab]
			end
		end
	end

	return action_str, mount_act

   

											  
									   
								
	 
									
	
end

-- get bind action
function lua_act:GetBindAction (iLogicAct, tidBindVehicle, nBindType, nPosInBind, bBindFlag, nBindMax, nBindPhase, eBindLoverType, nPosInBindLover, nBindLoverPhase, fCurSpeed)

	local action_str = ACTIONSTRINGNULL
	local action_time = -1
	local main_act_str = ACTIONSTRINGNULL

	--local str = string.format("GetBindAction: Act %d, tid: %d, Act %d, Type: %d, Pos: %d, bBindFlag %d, nBindMax %d, Phase: %d, eBindLoverType %d, PosInBindLover: %d, LoverPhase: %d\n",
	--	 iLogicAct, tidBindVehicle, iLogicAct, nBindType, nPosInBind, bBindFlag, nBindMax, nBindPhase, eBindLoverType, nPosInBindLover, nBindLoverPhase)
	--LogPrintA(str)

	if nPosInBindLover == 1 then
		-- 相依相偎被绑：不管有无普通绑定都是单独一个动作
		local phaseTab = BindLoverAction[eBindLoverType] and BindLoverAction[eBindLoverType][nBindLoverPhase] or nil
		if phaseTab ~= nil then
			--LogPrintA("HasTab\n")
			action_str = lua_act:GetBindActOfPos(phaseTab[iLogicAct], nBindType, nPosInBindLover + 1,
			 1, --被绑
			 fCurSpeed, nBindMax)
			if phaseTab.duration then
				action_time = phaseTab.duration
			end
			--str = string.format("PosInBindLover == 1: %s.\n", action_str)
			--LogPrintA(str)
		end
	elseif nBindType >= 0 and BindAction[nBindType] ~= nil then
		-- 有普通绑定，且不是相依相偎被绑
		local bLiftLover = 1
		if nPosInBindLover == 0 then
			bLiftLover = 2	-- 是相依相偎主绑
		end

		local tabTid = BindAction[nBindType][tidBindVehicle]
		local tabPhase = tabTid and tabTid[nBindPhase] or nil
		if tabPhase and tabPhase.duration then
			action_time = tabPhase.duration
		end

		local tabTidAct = tabPhase and tabPhase[iLogicAct] or nil
		if tabTidAct ~= nil then
			--	有对应载具模板id的动作定义
			action_str, main_act_str = lua_act:GetBindActOfPos(tabTidAct, nBindType, nPosInBind + 1, bLiftLover, fCurSpeed, nBindMax, tabTid.VehicleSpecActPos)
			if action_str == nil then
				action_str = ACTIONSTRINGNULL
			end
   
																											   
																	
							
							  
											  
											   
		
	   
	  

			--str = string.format("GetBindAction: BindPhase: %d, bLiftLover: %d, %s, MountAct %s\n", nBindPhase, bLiftLover, action_str, main_act_str)
			--LogPrintA(str)
		else
			--	无对应载具定义，用default
			local tabDef = BindAction[nBindType]["default"]
			local tabDefPhase = tabDef and tabDef[nBindPhase] or nil
			if tabDefPhase and tabDef.duration then
				action_time = tabDef.duration
			end

			local tabDefAct = tabDefPhase and tabDefPhase[iLogicAct] or nil
			if tabDefAct ~= nil then
				action_str, main_act_str = lua_act:GetBindActOfPos(tabDefAct, nBindType, nPosInBind + 1, bLiftLover, fCurSpeed, nBindMax, tabDef.VehicleSpecActPos)

				--str = string.format("GetBindAction: Default: BindPhase: %d, Pos: %d, bLiftLover: %d, Act %s, MountAct %s\n", nBindPhase, nPosInBind + 1, bLiftLover, action_str, main_act_str)
				--LogPrintA(str)
			else
				--LogPrintA("TabDef nil!\n")
			end
		end
	elseif nPosInBindLover == 0 then
		-- 无普通绑定，且是相依相偎主绑
		local phaseTab = BindLoverAction[eBindLoverType] and BindLoverAction[eBindLoverType][nBindLoverPhase] or nil
		if phaseTab ~= nil then
			action_str = lua_act:GetBindActOfPos(phaseTab[iLogicAct], nBindType, nPosInBindLover + 1,
				 2, --相依相偎主绑
				 fCurSpeed, nBindMax)
			if phaseTab.duration then
				action_time = phaseTab.duration
			end
			--str = string.format("PosInBindLover == 0: %s.\n", action_str)
			--LogPrintA(str)
		end
	end

	--LogPrintA(fCurSpeed)
	--测试刹车打出来看，d_delcmd 169 动作测试专员，用第二个坐骑
	--LogPrintA(action_str .. "/" .. action_time .. "/" .. main_act_str)

	return action_str, action_time, main_act_str
end

-- get npc stand action
function lua_act:GetMonsterSpecialAction(iLogic, iNPCType, iInGuard, tStates, iTemplID, iAliasHash, idModel)

	local tabSpecAct = NPCSpecialAction[iTemplID]

	--LogPrint(iLogic)
	--LogPrint(tStates[45] and "true" or "false")

	if tabSpecAct then
		if tabSpecAct[iLogic] then
			--local str = string.format("SpecAction: %d, TID: %d, Hash: %d, InGuard: %d\n", iLogic, iTemplID, iAliasHash, iInGuard)
			--LogPrint(str)

			local tabThis = tabSpecAct[iLogic]

			if tabThis.cond.allTempl == true then
				if iInGuard == 0 then
					return tabThis.standactname1 or ACTIONSTRINGNULL
				else
					return tabThis.standactname2 or ACTIONSTRINGNULL
				end
			elseif tabThis.cond.state and tStates[tabThis.cond.state + 1] == true then
			--LogPrintA(iInGuard)
			--LogPrintA(tabThis.standactname1)
			--LogPrintA(tabThis.standactname2)
				if iInGuard == 0 then
					return tabThis.standactname1 or ACTIONSTRINGNULL
				else
					return tabThis.standactname2 or ACTIONSTRINGNULL
				end
			elseif tabThis.cond[iAliasHash] then
				--LogPrint("Has This Hash!\n")
				if iInGuard == 0 then
					return tabThis.standactname1 or ACTIONSTRINGNULL
				else
					return tabThis.standactname2 or ACTIONSTRINGNULL
				end
			end
		elseif iLogic >= ObjectLogicActFlag.STAND_COLLIDE_FRONT
		 and iLogic <= ObjectLogicActFlag.RUN_COLLIDE_RIGHT then
		 	-- 只要配置了SpecialAction的，就不播碰撞动作
		 	-- 虽然笼统，但可以避免一些诡异情况（比如死在地上就不能播碰撞动作）
			return ACTIONSTRINGSPECIAL
		end
	end
	return ACTIONSTRINGNULL
end

--人物动作播放速度调整
function lua_act:GetModelActionSpeed (iLogic, iStance, idModel, fCurSpeed, bIgnoreSpeed, tidBindVehicle, iGroundWater)
	if bIgnoreSpeed ~= 0 then
		return iLogic, 1
	end

	local bw = 1.5
	local bm = 4.2
	local bfast = 5.8

	if tidBindVehicle ~= 0 then
		-- TODO: 根据骑乘模板id决定基准速度
		--bw = 1.8
		--bm = 5.0
											 
		bw = 2.1
											  
	  
		   
		bm = 5.0
	 
	end

	local steadyspeed = false

	if idModel > 0 and MonsterVisual.SpecialModelSpeed[idModel] then
		bw = MonsterVisual.SpecialModelSpeed[idModel].ws
		bm = MonsterVisual.SpecialModelSpeed[idModel].ms
		steadyspeed = MonsterVisual.SpecialModelSpeed[idModel].sp
	end

	if iLogic == ObjectLogicActFlag.WALK then
		if steadyspeed then
			return iLogic, (fCurSpeed/bw < 0.2) and 0.2 or ((fCurSpeed/bw > 5) and 5 or fCurSpeed/bw)
		else
			return iLogic, (fCurSpeed/bw < 0.38) and 0.38 or ((fCurSpeed/bw > 2.62) and 2.62 or fCurSpeed/bw)
		end
	elseif iLogic == ObjectLogicActFlag.RUN
	 	or iLogic >= ObjectLogicActFlag.RUN_COLLIDE_FRONT and iLogic <= ObjectLogicActFlag.RUN_COLLIDE_RIGHT then
		if steadyspeed then
			return iLogic, (fCurSpeed/bm < 0.2) and 0.2 or ((fCurSpeed/bm > 5) and 5 or fCurSpeed/bm)
		else
			if fCurSpeed < 0.62 * bm then	--低至标准奔跑速度的60%
				local iWalkAct = ObjectLogicActFlag.WALK
				if iLogic >= ObjectLogicActFlag.RUN_COLLIDE_FRONT and iLogic <= ObjectLogicActFlag.RUN_COLLIDE_RIGHT then
					iWalkAct = iLogic - 4		-- 改为 WALK_COLLIDE_...
					--LogPrint("GetCollAct: "..iLogic..", ChangeToWalk: "..iWalkAct)
				end
				return iWalkAct, (fCurSpeed/bw < 0.38) and 0.38 or ((fCurSpeed/bw > 2.62) and 2.62 or fCurSpeed/bw)
			elseif iLogic >= ObjectLogicActFlag.RUN_COLLIDE_FRONT and iLogic <= ObjectLogicActFlag.RUN_COLLIDE_RIGHT then
				-- 大于标准奔跑速度60%：碰撞动作均播奔跑碰撞
				return iLogic, 1
			--elseif fCurSpeed > 1.39 * bm then	--高达标准奔跑速度的139%(现在是5*1.39=5.95)
			elseif fCurSpeed > 1.61 * bm then	--高达标准奔跑速度的161%(现在是5*1.61=8.05)
			--elseif fCurSpeed > 1.79 * bm then	--高达标准奔跑速度的179%(现在是5*1.79=8.95)
				if iGroundWater == 2 then
					return ObjectLogicActFlag.CUSTOM_SPEEDUP, 1.67
					--return ObjectLogicActFlag.CUSTOM_SPEEDUP, 1.48
				elseif iGroundWater == 1 then
					return ObjectLogicActFlag.CUSTOM_SPEEDUP, 1.67
				else
					return ObjectLogicActFlag.CUSTOM_SPEEDUP, 1
				end
				--暂时改成凡加速跑不改速度
				--return ObjectLogicActFlag.CUSTOM_SPEEDUP, fCurSpeed/bfast
			else
				return iLogic, 1
				--暂时改成凡奔跑不改速度
				--local fPlaySpeed = (fCurSpeed/bm < 0.62) and 0.62 or ((fCurSpeed/bm > 1.62) and 1.62 or fCurSpeed/bm)
				--return iLogic, fPlaySpeed
			end
		end
	elseif iLogic == ObjectLogicActFlag.MOVEFOWARD or iLogic == ObjectLogicActFlag.MOVERIGHT or iLogic == ObjectLogicActFlag.MOVELEFT or iLogic == ObjectLogicActFlag.MOVEBACK then
		if iStance ~= STANCE_TYPE.BLOCK then
			if steadyspeed then
				return iLogic, (fCurSpeed/bm < 0.2) and 0.2 or ((fCurSpeed/bm > 5) and 5 or fCurSpeed/bm)
			else
				if iLogic == ObjectLogicActFlag.MOVEBACK then
					return iLogic, (fCurSpeed/bm < 0.62) and 0.62 or ((fCurSpeed/bm > 1.62) and 1.62 or fCurSpeed/bm)
					--return iLogic, 1
				else
					return iLogic, (fCurSpeed/bm < 0.62) and 0.62 or ((fCurSpeed/bm > 1.62) and 1.62 or fCurSpeed/bm)
				end
			end
		else
			return iLogic, 1
		end
	elseif iLogic == ObjectLogicActFlag.CUSTOM_SPEEDUP then	--加这段，是由于程序在前冲结束后接加速跑，会预测先播一瞬间加速跑动作
		if iGroundWater == 2 then
			return ObjectLogicActFlag.CUSTOM_SPEEDUP, 1.67
			--return ObjectLogicActFlag.CUSTOM_SPEEDUP, 1.03
		elseif iGroundWater == 1 then
			return ObjectLogicActFlag.CUSTOM_SPEEDUP, 1.67
		else
			return ObjectLogicActFlag.CUSTOM_SPEEDUP, 1
		end
	else
		return iLogic, 1
	end
end

--怪物动作播放速度调整，暂时只有基准速度不同
function lua_act:GetModelActionSpeedNpc (iLogic, iStance, idModel, fCurSpeed, bIgnoreSpeed, tidBindVehicle, iInGuard)
	if bIgnoreSpeed ~= 0 then
		return iLogic, 1
	end

	local bw = 1.4
	local bm = 4
	--local bw = 1.8
	--local bm = 4.0
	if tidBindVehicle ~= 0 and tidBindVehicle ~= -1 then
		-- TODO: 根据骑乘模板id决定基准速度
		--bw = 1.8
		--bm = 5.0
  
		bw = 2.1
		bm = 5.0
	end

	local steadyspeed = false

	if idModel > 0 and MonsterVisual.SpecialModelSpeed[idModel] then
		bw = MonsterVisual.SpecialModelSpeed[idModel].ws
		bm = MonsterVisual.SpecialModelSpeed[idModel].ms
		steadyspeed = MonsterVisual.SpecialModelSpeed[idModel].sp
	end

	--LogPrintA(string.format("模型ID：%d，标准行走速度：%f，标准奔跑速度：%f，当前速度：%f",idModel,bw,bm,fCurSpeed))

	if iLogic == ObjectLogicActFlag.WALK then
		if steadyspeed then
			return iLogic, (fCurSpeed/bw < 0.2) and 0.2 or ((fCurSpeed/bw > 5) and 5 or fCurSpeed/bw)
		elseif fCurSpeed < 0.05 * bm then
			return ObjectLogicActFlag.GUARD, 1
		elseif iInGuard ~= 0 then
			return ObjectLogicActFlag.RUN, (fCurSpeed/bw < 0.38) and 0.38 or ((fCurSpeed/bw > 2.62) and 2.62 or fCurSpeed/bw)
		else
			return iLogic, (fCurSpeed/bw < 0.38) and 0.38 or ((fCurSpeed/bw > 2.62) and 2.62 or fCurSpeed/bw)
		end
	elseif iLogic == ObjectLogicActFlag.RUN then
		if steadyspeed then
			return iLogic,(fCurSpeed/bm < 0.2) and 0.2 or ((fCurSpeed/bm > 5) and 5 or fCurSpeed/bm)
		else
			if fCurSpeed < 0.05 * bm then
				return ObjectLogicActFlag.GUARD, 1
			elseif fCurSpeed < 0.62 * bm then
				if iInGuard == 0 then
					return ObjectLogicActFlag.WALK, (fCurSpeed/bw < 0.38) and 0.38 or ((fCurSpeed/bw > 2.62) and 2.62 or fCurSpeed/bw)
				else
					return ObjectLogicActFlag.WALK, (fCurSpeed/bw < 0.38) and 0.38 or ((fCurSpeed/bw > 2.62) and 2.62 or fCurSpeed/bw)
				end
			else
				local fPlaySpeed = (fCurSpeed/bm < 0.62) and 0.62 or ((fCurSpeed/bm > 1.62) and 1.62 or fCurSpeed/bm)
				--local strDbg = string.format("GetModelActionSpeed: CurSpeed %.3f, PlaySpeed: %.3f\n", fCurSpeed, fPlaySpeed)
				--LogPrint(strDbg)
				return iLogic, fPlaySpeed
			end
		end
	elseif iLogic == ObjectLogicActFlag.MOVEFOWARD or iLogic == ObjectLogicActFlag.MOVERIGHT or iLogic == ObjectLogicActFlag.MOVELEFT or iLogic == ObjectLogicActFlag.MOVEBACK then
		if MonsterVisual.ForceAction[iTemplID] then
			if MonsterVisual.ForceAction[iTemplID].locktarget == 1 then
				return iLogic, (fCurSpeed/bm < 0.62) and 0.62 or ((fCurSpeed/bm > 1.62) and 1.62 or fCurSpeed/bm)
			elseif MonsterVisual.ForceAction[iTemplID].locktarget == 2 then
				return iLogic, (fCurSpeed/bw < 0.38) and 0.38 or ((fCurSpeed/bw > 2.62) and 2.62 or fCurSpeed/bw)
			else
				return iLogic, (fCurSpeed/bm < 0.62) and 0.62 or ((fCurSpeed/bm > 1.62) and 1.62 or fCurSpeed/bm)
			end
		else
			return iLogic, (fCurSpeed/bm < 0.62) and 0.62 or ((fCurSpeed/bm > 1.62) and 1.62 or fCurSpeed/bm)
		end
--		if iStance ~= STANCE_TYPE.BLOCK then
--			if steadyspeed then
--				return iLogic, (fCurSpeed/bm < 0.2) and 0.2 or ((fCurSpeed/bm > 5) and 5 or fCurSpeed/bm)
--			else
--				return iLogic, (fCurSpeed/bm < 0.62) and 0.62 or ((fCurSpeed/bm > 1.62) and 1.62 or fCurSpeed/bm)
--			end
--		else
--			return iLogic, 1
--		end
	else
		return iLogic, 1
	end
end

--a func to Compose ECM Act Name
function lua_act:ComposePlayerActName(sAction, iFaction, iWeapon, iStance)

	--local strdbg = string.format("ComposeAct: %s, %d, %d, %d\n", sAction, iFaction, iWeapon, iStance)
	--LogPrintA(strdbg)

	local prefix = ACTIONSTRINGNULL
	for i=1,8 do
   	if CombineActName[sAction][i] == true then
  		prefix = PlayerActionPrefix[i]
  		--LogPrintA(prefix.."\n")
  	end
  end

	local playerAct = sAction
	if prefix == ACTIONSTRINGNULL then
    playerAct = string.format(CANNAMESIMPLESTYLE, sAction)

  else
		local suftype = CombineActName[sAction].suftype
		local suffix = ACTIONSTRINGNULL

		if suftype == ActStringFlag.COMMON then
      suffix = FactionList[iFaction+1].s_cmn
			--LogPrintA(suffix.." --1\n")

		elseif suftype == ActStringFlag.FACTION then
   		if FactionList[iFaction+1].w_spe == iWeapon then
  		    if iStance == STANCE_TYPE.NORMAL then						-- 临时的，将来改成取武器变形相同的东西
  		        suffix = FactionList[iFaction+1].s_chg1
  		    elseif iStance == STANCE_TYPE.TRANS1 then
  		        suffix = FactionList[iFaction+1].s_chg2
  		    elseif iStance == STANCE_TYPE.TRANS2 then
  		        suffix = FactionList[iFaction+1].s_chg3
  		    else
  		        suffix = FactionList[iFaction+1].s_spe
  		    end
  		else
  		    suffix = FactionList[iFaction+1].s_spe
  		end

  	elseif  suftype == ActStringFlag.WEAPON then
			if iStance > STANCE_TYPE.BLOCK then
				local weaponList = WeaponList[iWeapon+1][iStance]
				if weaponList == nil then
					suffix = FactionList[iWeapon+1].s_spe
    			elseif weaponList == "空手" then
    				suffix = FactionList[iWeapon+1].s_cmn
    			else
    				suffix = FactionList[iWeapon+1].s_spe
				end
			else
			    suffix = FactionList[iWeapon+1].s_spe
			end
		end

		playerAct = string.format(CANNAMENORMALSTYLE, prefix, sAction, suffix)
	end

	--LogPrintA(playerAct.." --3\n")
	return playerAct

end


--[[
采矿成功播放动作

MINE_RESULT_ACTION_CFG = {
--[62701] = "cj_采集刨_通用",
[62701] = "cj_看剑谱结束_通用",
}

function lua_act:get_mine_result_act( idMineEss )
	local strreturn = ""
	if MINE_RESULT_ACTION_CFG[idMineEss] ~= nil then
		strreturn = MINE_RESULT_ACTION_CFG[idMineEss]
	end
	return strreturn
end

]]--


MINE_RESULT_ACTION_CFG = {
[62701] = {"cj_看剑谱结束_通用",5000}
}

function lua_act:get_mine_result_act( idMineEss )
	local strreturn = ""
	local duration = 0
	if MINE_RESULT_ACTION_CFG[idMineEss] ~= nil then
		strreturn = MINE_RESULT_ACTION_CFG[idMineEss][1]
		duration = MINE_RESULT_ACTION_CFG[idMineEss][2]
	end
	return strreturn,duration
end

function lua_act:get_idle_act_name( bInCorsesBind,idvehicle, ratevalue )
	-- body
	local isFlyingVehicle = lua_act:IsFlyingVehicle( idvehicle )
	if bInCorsesBind then
		local actTable = CorsesFlyIdleAction
		if actTable == nil then
			actTable = CommonMountIdleAction["default"]
		end
		
		return actTable[ratevalue]
	elseif isFlyingVehicle == 1 then
		local actTable = FlyMountIdleAction[idvehicle]
		if actTable == nil then
			actTable = FlyMountIdleAction["default"]
		end
		
		return actTable[ratevalue] and actTable[ratevalue] or actTable["default"]
	
		--[[if ratevalue == 85 then
			return "飞行休闲动作2"
		elseif ratevalue == 45 then
			return "飞行休闲动作3"
		elseif ratevalue == 30 then
			return "飞行休闲动作4"
		elseif ratevalue == 15 then
			return "飞行休闲动作7"
		else
			return "飞行站立"
		end
		--]]
	else
		local actTable = CommonMountIdleAction[idvehicle]
		if actTable == nil then
			actTable = CommonMountIdleAction["default"]
		end
		
		return actTable[ratevalue] and actTable[ratevalue] or actTable["default"]
			
	
		--if ratevalue == 85 then
		--	return "休闲动作1"
		--elseif ratevalue == 45 then
		--	return "休闲动作2"
		--elseif ratevalue == 30 then
		--	return "休闲动作4"
		--elseif ratevalue == 15 then
		--	return "休闲动作5"
		--else
		--	return "站立"
		--end
	end			
end

function lua_act:IsFlyingVehicle( idvehicle )
	-- body
	for i,v in ipairs(FlyingVehicleList) do
		if v == idvehicle then
			return 1
		end
	end

	return 0
end

function lua_act:IsSeparatePlayActVehicle( idvehicle )
	-- body
	for i,v in ipairs(SeparatePlayActVehicleList) do
		if v == idvehicle then
			return 1
		end
	end

	return 0
end

function lua_act:IsLowerHookVehicle( idvehicle )
	for i,v in pairs(LowerHookVehicleList) do
		if i == idvehicle then
			return 1
		end
	end

	return 0
end

function lua_act:GetLowHookOffset( idvehicle, clothid, gender )
	local height = LowerHookVehicleList[idvehicle] and LowerHookVehicleList[idvehicle][gender] and LowerHookVehicleList[idvehicle][gender][clothid]
	return height or LowerHookVehicleList["default"]
end

function lua_act:IsNotAdjustPosVehicle( idvehicle )
	-- body
	for i,v in ipairs(NotAdjustPosVehicleList) do
		if v == idvehicle then
			return 1
		end
	end

	return 0
end

function lua_act:GetSpecialIdleRate( clothesid, tidDecorate )
	local tbl = SpecialIdleAction[tidDecorate]
	if tbl == nil then
		return 0
	end
	
	for i,v in ipairs(tbl.clothesid) do
		if v == clothesid then
			return tbl.rate
		end
	end
	
	return 0
end

-----------------local actionname test------------------
--[[★◆●在行后增加或去除一个“]”可取消注释●◆★--]
--include
require "Visual"
require "action"
require "monstervisual"
GameApi = {}
function GameApi.HashAString(v)
	return v
end
local a1, a2, a3, a4, s1, s2
local action_str1, action_str2, action_str3, action_str4, action_str5
local tStates = {}
local tPoints = {}
--input vals
local iLogic = 22
local iLogicAct = 22
local iLowerAct = 22
local iWeapon = 6
local iInGuard = 0
--local iRiging = 0
--local iBind = 0
local iStance = 1
local iFaction = 0
local iGroundWater = 0
local iPerformID = 829
local iMineID = 0
local iCount = 0
local iNPCType = 0
local iTemplID = 13139
local iAliasHash = "26套测试恶头陀02"
local HitType = 4
local DodgeMask = 0
local iStandOptParam = 0
local iStance = STANCE_TYPE.NORMAL
local nPosInBindLover = -1
local tidBindVehicle = 0
local nBindType = -1
local nPosInBind = 0
local nBindMax = 0
local nBindPhase = 0
local idModel = 6434
local fCurSpeed = 3.5
local bIgnoreSpeed = 0
local nBindLoverPhase = 1
local idEmote = 0

for i=1,64 do tStates[i] = false end
for j=1,9 do tPoints[j] = 100 end
--function lua_act:GetECMName (iLogic, iWeapon, iInGuard, iRiging, iBind, iFaction, tStates, iExpID, iPerformID, iMineID, iCount) --old
--function lua_act:GetECMName (iLogic, iWeapon, iInGuard, iRiging, iBind, iFaction, tStates, iExpID, iPerformID, iMineID, iCount, HitType) --old
--function lua_act:GetECMName (iLogic, iWeapon, iInGuard, iRiging, iBind, iFaction, tStates, iExpID, iPerformID, iMineID, iCount, HitType, iStandOptParam, iStance, tidCarryVehicle) --old
--function lua_act:GetECMName (iLogicAct, iLowerAct, iWeapon, iInGuard, iFaction, iGroundWater, tStates, iExpID, iPerformID, iMineID, iCount, HitType, DodgeMask, iStandOptParam, iStance, eBindLoverType, nPosInBindLover, nBindLoverPhase, tidBindVehicle, nBindType, nPosInBind, nBindMax, nBindPhase, fCurSpeed, bIgnoreSpeed, idEmote)
a1, a2, s1, _, _, _ = lua_act:GetECMName (iLogicAct, iLowerAct, iWeapon, iInGuard, iFaction, iGroundWater, tStates, iExpID, iPerformID, iMineID, iCount, HitType, DodgeMask, iStandOptParam, iStance, eBindLoverType, nPosInBindLover, nBindLoverPhase, tidBindVehicle, nBindType, nPosInBind, nBindMax, nBindPhase, fCurSpeed, bIgnoreSpeed, idEmote)
--function lua_act:GetECMNameNPC (iLogic, iWeapon, iInGuard, iFaction, tStates, iPerformID, iTemplID) --old
--function lua_act:GetECMNameNPC (iLogic, iWeapon, iInGuard, tStates, iPerformID, iTemplID, HitType) --old
--lua_act:GetECMNameNPC (iLogic, iNPCType, iWeapon, iInGuard, iStance, tStates, iPerformID, iTemplID, HitType, iAliasHash, fCurSpeed, idModel, bIgnoreSpeed, tidBindVehicle, nBindType, nPosInBind, nBindPhase, idEmote)
a3, a4, s2 = lua_act:GetECMNameNPC (iLogic, iNPCType, iWeapon, iInGuard, iStance, tStates, iPerformID, iTemplID, HitType, iAliasHash, fCurSpeed, idModel, bIgnoreSpeed, tidBindVehicle, nBindType, nPosInBind, nBindPhase, idEmote)
action_str1 = string.format("Character Action Name: %s", a1)
action_str2 = string.format("Mount Action Name: %s", a2)
action_str3 = string.format("MonsNPCPet Action Name: %s", a3)
action_str4 = string.format("Character Action Speed: %s", s1)
action_str5 = string.format("MonsNPCPet Action Speed: %s", s2)
print(action_str1)
print(action_str2)
print(action_str3)
print(action_str3)
print(action_str5)
--]]
