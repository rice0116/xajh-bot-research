--[[#tag push auto]]
---------------------------------------------------------------
--  created:   2009.11.30
--  author:    djh
--
--  伤害描述
---------------------------------------------------------------

DamageDesc = {}

--主动者

DamageDesc.CASTER = 0
--被动者

DamageDesc.TARGET = 1
--治疗
DamageDesc.DOCTOR = 2

DamageDesc.GP_DAMAGE_IMMUNE	= 0x00000100	--	免疫攻击
DamageDesc.GP_DAMAGE_MISS	= 0x00000200	--	未命中

DamageDesc.GP_DAMAGE_CRIT	= 0x00000400	--	此次攻击是爆击

DamageDesc.GP_DAMAGE_ABSORB	= 0X00000800	--	吸收

DamageDesc.GP_DAMAGE_SKILL	= 0x80000000	--	This damaged caused by skill

DamageDesc.GP_DAMAGE_HUIXIN	= 0x00010000	--	会心
DamageDesc.GP_DAMAGE_DIYU	= 0x00020000	--	抵御

--	GP_DAMAGE_MISS_UPPER		= 0x00000001,	//	上闪避(攻击上面时不能命中)
--	GP_DAMAGE_MISS_LOWER		= 0x00000002,	//	下闪避

--	GP_DAMAGE_MISS_STRAIGHT		= 0x00000004,	//	纵(刺)闪避
--	GP_DAMAGE_MISS_HORIZONTAL	= 0x00000008,	//	横(扫)闪避
--	GP_DAMAGE_MISS_DIRECTIONAL	= 0x0000000F,	//	所有方向闪避

--
--	GP_DAMAGE_INHIBITED		= 0x00000010,	//	被克制

--	GP_DAMAGE_BREAK			= 0x00000020,	//	被打断

--	GP_DAMAGE_RESIST		= 0x00000040,	//	抵抗
--
--	GP_DAMAGE_IMMUNE		= 0x00000100,	//	免疫攻击
--	GP_DAMAGE_MISS			= 0x00000200,	//	未命中

--	GP_DAMAGE_CRIT			= 0x00000400,	//	此次攻击是爆击

--	GP_DAMAGE_ABSORB		= 0X00000800,	//	此次攻击被吸收

--
--	GP_DAMAGE_SUSPEND		= 0x00001000,	//	击飞
--	GP_DAMAGE_COLLAPSE		= 0x00002000,	//	击溃
--	GP_DAMAGE_TUMBLE		= 0x00004000,	//	击倒

--	GP_DAMAGE_MOVE			= 0x00008000,	//	非控制位移

--
--	GP_DAMAGE_SUSPEND		= 0x00001000,	//	击飞
--	GP_DAMAGE_COLLAPSE		= 0x00002000,	//	击溃
--
--	//	Defined by client
--	GP_DAMAGE_GRADUAL_HURT		= 0x40000000,	//	This damaged is GRADUAL HURT
--	GP_DAMAGE_SKILL			= 0x80000000,	//	This damaged caused by skill


DamageDesc.COLOR_NORMAL		= GAME_UI_COLOR[--[[!]]"战白"].str
DamageDesc.COLOR_AGGRESSIVE	= GAME_UI_COLOR[--[[!]]"战黄"].str
DamageDesc.COLOR_PASSIVE	= GAME_UI_COLOR[--[[!]]"战红"].str

--damageType         主动或者被动

--idSkill            技能id
--levelSkill         技能等级

--nFlag              标记(用位与操作判断GP_DAMAGE_*类型)
--nBlood             血量(攻击,治疗)
--szName             名称(如果damageType为主动,那么szName表示被攻击对象名,否则szName表示玩家自己的名称)

function DamageDesc:GetDamageInfo(damageType,idSkill,levelSkill,nFlag,nBlood,szName,isPet,petName)
	if isPet == false then
		--玩家
		return DamageDesc:GetHostDamageInfo(damageType,idSkill,levelSkill,nFlag,nBlood,szName)
	else
		--宠物
		return DamageDesc:GetPetDamageInfo(damageType,idSkill,levelSkill,nFlag,nBlood,szName,petName)
	end
	return --[[!AUTO_1]]"無傷害資訊"
end

function DamageDesc:GetHostDamageInfo(damageType,idSkill,levelSkill,nFlag,nBlood,szName)
	local combatMsg = --[[!AUTO_2]]""

	local skillTbl  = nil

	if damageType == DamageDesc.CASTER or damageType == DamageDesc.TARGET then
		skillTbl = GameApi.GetSkillEssence(idSkill)
	end

	local bIsAttackImmune   = false --免疫
	local bIsAttackDodged   = false --闪避
	local bIsAttackCritical = false --暴击
	local bIsAttackAbsorbed = false --吸收
	local bIsAttackHuixin	= false	--会心
	local bIsAttackDiyu	= false	--抵御

	--检查一个攻击是否存在免疫、闪避、暴击、伤害吸收


	if bit.band(nFlag,DamageDesc.GP_DAMAGE_IMMUNE) == DamageDesc.GP_DAMAGE_IMMUNE then
		bIsAttackImmune = true
	end

	if bit.band(nFlag,DamageDesc.GP_DAMAGE_MISS) == DamageDesc.GP_DAMAGE_MISS then
		bIsAttackDodged = true
	end

	if bit.band(nFlag,DamageDesc.GP_DAMAGE_CRIT) == DamageDesc.GP_DAMAGE_CRIT then
		bIsAttackCritical = true
	end

	if bit.band(nFlag,DamageDesc.GP_DAMAGE_ABSORB) == DamageDesc.GP_DAMAGE_ABSORB then
		bIsAttackAbsorbed = true
	end

	if bit.band(nFlag,DamageDesc.GP_DAMAGE_HUIXIN) == DamageDesc.GP_DAMAGE_HUIXIN then
		bIsAttackHuixin = true
	end

	if bit.band(nFlag,DamageDesc.GP_DAMAGE_DIYU) == DamageDesc.GP_DAMAGE_DIYU then
		bIsAttackDiyu = true
	end

	--整理显示颜色、各战斗单位名称等文字

	--之所以把“你”这个整理成通常情况，是怕后出现第三者显示需求，例如其它两个玩家互打
	local stringcolor   = --[[!AUTO_3]]""
	local stringsubject = --[[!AUTO_4]]""
	local stringobject  = --[[!AUTO_5]]""

	if damageType == DamageDesc.CASTER then
   		if skillTbl and skillTbl["display_name"] and string.len(skillTbl["display_name"]) == 0 then
			stringcolor = DamageDesc.COLOR_NORMAL
		else
			stringcolor = DamageDesc.COLOR_AGGRESSIVE
		end
		stringsubject = COMBAT_TIP_SELF
		stringobject  = szName
	elseif damageType == DamageDesc.TARGET then
		stringcolor   = DamageDesc.COLOR_PASSIVE
		stringsubject = szName
		stringobject  = COMBAT_TIP_SELF
	elseif damageType == DamageDesc.DOCTOR then
		stringcolor   = DamageDesc.COLOR_AGGRESSIVE
		stringsubject = COMBAT_TIP_SELF
	end

	--整理技能名称，伤害名称，回复名称

	local stringskill   = --[[!AUTO_6]]""
	local stringdamage  = --[[!AUTO_7]]""
	local stringrecover = --[[!AUTO_8]]""

	if skillTbl and skillTbl["display_name"] then
		if string.len(skillTbl["display_name"]) == 0 then
		    if bIsAttackImmune or bIsAttackDodged then
		    	stringskill = COMBAT_TIP_NOTSKILL2
		    else
		    	stringskill = COMBAT_TIP_NOTSKILL1
		    end
		else
			if stringsubject == --[[!AUTO_9]]"" then
				stringskill = skillTbl["display_name"]
			else
				stringskill = string.format(COMBAT_TIP_SKILL,skillTbl["display_name"])
			end
		end
	end

	--这项其实同时带了暴击和吸收的情况，吸收可能为不完全吸收，仍为有伤害，因此是三项并存的。

	--stringdamage = string.format("%s%s%s", bIsAttackCritical and COMBAT_TIP_DAMAGE_CRITIC or "", COMBAT_TIP_DAMAGE_NORMAL, bIsAttackAbsorbed and COMBAT_TIP_DAMAGE_ABSORB or "")
	stringdamage = string.format(--[[!AUTO_10]]"%s%s%s%s", COMBAT_TIP_DAMAGE_NORMAL, bIsAttackHuixin and COMBAT_TIP_DAMAGE_HUIXIN or --[[!AUTO_11]]"", bIsAttackDiyu and COMBAT_TIP_DAMAGE_DIYU or --[[!AUTO_12]]"", bIsAttackAbsorbed and COMBAT_TIP_DAMAGE_ABSORB or --[[!AUTO_13]]"")
	stringrecover = COMBAT_TIP_HEAL_HP

	--整理战斗信息
	if damageType == DamageDesc.CASTER or damageType == DamageDesc.TARGET then
		if bIsAttackImmune then
			combatMsg = string.format(COMBAT_TIP_IMMUNE, stringcolor, stringsubject, stringskill, stringobject)
		elseif bIsAttackDodged then
			combatMsg = string.format(COMBAT_TIP_MISS, stringcolor, stringsubject, stringskill, stringobject)
		else
			combatMsg = string.format(COMBAT_TIP_DAMAGE, stringcolor, stringsubject, stringskill, stringobject, nBlood, stringdamage)
		end
	elseif damageType == DamageDesc.DOCTOR then
		combatMsg = string.format(COMBAT_TIP_HEAL, stringcolor, stringsubject, nBlood, stringrecover)
	end

	return combatMsg
end

function DamageDesc:GetPetDamageInfo(damageType,idSkill,levelSkill,nFlag,nBlood,szName,petName)
	local skillname = GameApi.GetSkillName(idSkill)

	if damageType == DamageDesc.CASTER then
		if PetAI.SkillCfg[idSkill] then
	   		return string.format(--[[!AUTO_14]]"門徒%s使用%s對%s造成%d點傷害",petName,skillname,szName,nBlood)
		else
			return string.format(--[[!AUTO_15]]"門徒%s對%s造成%d點傷害",petName,szName,nBlood)
		end
	elseif damageType == DamageDesc.TARGET then
		return string.format(--[[!AUTO_16]]"門徒%s受到%d點傷害",petName,nBlood)
	else
		return --[[!AUTO_17]]"錯誤的門徒傷害資訊"
	end
end

--is_skill_damage 是否为技能伤害

--damage_num	  伤害数

--is_player       是否为玩家

--is_host         是否为自己


IMG_POPUPNUM_RED	= 128
IMG_POPUPNUM_YELLOW	= 129
IMG_POPUPNUM_WHITE	= 130

function DamageDesc:BubbleDamageNum(is_skill_damage,damage_num,is_player,is_host)
	local scale = 0.75
	local color = 0xffffff
	local image

	if is_host == true then
	    image = IMG_POPUPNUM_RED
	elseif is_player == true then
	    if is_skill_damage == true then
	        image = IMG_POPUPNUM_YELLOW
	    else
	        image = IMG_POPUPNUM_WHITE
	    end
	end

	return image,color,scale
end
