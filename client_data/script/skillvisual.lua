---------------------------------------------------------------
-- 	技能表现脚本：Perform/控制状态相关的动作、位移等逻辑相关表现
--	Creator: Guo  Jie, 2010.2.1
---------------------------------------------------------------

SkillVisual = {}
SkillVisual.CtrlStateParam = {}
SkillVisual.SmallCtrlParam = {}
SkillVisual.PerformParam = {}
SkillVisual.PerformParam_Replace = {}

----------------------------------------------
--------- 一些function和常数的定义  ---------
----------------------------------------------

--	SkillVisual播放通道
local SKILLVIS_CHN_MAIN				= 0	--	主通道
local SKILLVIS_CHN_PARA_ACT			= 1	--	并行动作通道（只播动作，不管位移）

--	动作通道
local ACT_CHANNEL_FULLWOUND		= 3		--	全身受伤融合通道
local ACT_CHANNEL_UPPERWOUND	= 4		--	上半身受伤通道
local ACT_CHANNEL_FULLWOUND_EXCLU = 7 --全身受伤独占通道

-- 	控制状态
SkillVisual.CTRLSTATEID_BEATAIR 			= 1 	--	击飞
SkillVisual.CTRLSTATEID_BEATCOLLAPSE 	= 2 	--	击溃
SkillVisual.CTRLSTATEID_BEATDOWN 			= 3 	--	击倒
SkillVisual.CTRLSTATEID_BAOQI			= 5  --内力互拼 爆气
SkillVisual.CTRLSTATEID_WOUND_BLOCK		= 15 	--	格挡时受伤

--	用这个值来表示NPC职业类型
SkillVisual.NPCPROF_DEFAULT = 31
----------------------------------------------
------------   大控制表现  --------------
----------------------------------------------
local pt_attcck_countnumber = 0

-- nBeAtkPerfID: 被攻击的performID
-- nCycleCount: 循环段的已循环次数。如果不是循环段则为0。如果是循环段，第一次perform就算1，之后累加
-- woundType: 1-左边半身挨打；2-右边半身挨打；3-后仰半身挨打；4-前躬半身挨打；5-左边全身挨打；6-右边全身挨打；7-后仰全身挨打；8-前躬全身挨打
-- bInGuard
function SkillVisual:GetCtrlStateVisual(iTemplID, iStance, idCtrlSt, bPush, bPull, bWound, prof, weapontype, woundType, nBeAtkPerfID, nCycleCount, nCurLogicAct, bInGuard)

	local tabReturn = nil

	--local strdbg = string.format("GetCtrlStateVisual: %d, Push %d, Pull %d, Wound %d, Stance: %d, Prof: %d, Weapon: %d\n",
	--			idCtrlSt, bPush and 1 or 0, bPull and 1 or 0, bWound and 1 or 0, iStance, prof, weapontype)
	--LogPrint(strdbg)

	tabReturn = SkillVisual.CtrlStateParam[idCtrlSt]	
	if tabReturn ~= nil then
		if bPush then
			tabReturn = tabReturn["Push"]
		elseif bPull then
			tabReturn = tabReturn["Pull"]
		elseif bWound then
			tabReturn = tabReturn["Wound"]
		else
			tabReturn = tabReturn["None"]
		end
		
		local numSeg = 1	--1：上升段，2：下降段
		local up_endtime = 0
		if idCtrlSt == SkillVisual.CTRLSTATEID_WOUND_BLOCK then
			-- 格挡受伤：
			tabReturn = SkillVisual.CtrlStateParam[idCtrlSt]
			tabReturn["PlayChn"] = SKILLVIS_CHN_PARA_ACT -- -- 作为并行动作通道（只播动作，不冲主运动通道）
			-- mid动态生成
			local tabECM = tabReturn.ModifyECM
			if tabECM ~= nil then
				for k,v in pairs(tabECM) do

					v.weight = 1 	-- 默认权重为1

					-- 格挡受伤：默认在全身受伤独占通道
					v.actchn = ACT_CHANNEL_FULLWOUND_EXCLU
					if woundType >= 1 and woundType <= 4 then
						-- 但上身受伤（移动中受伤）还在上身通道播
						v.actchn = ACT_CHANNEL_UPPERWOUND
					end

					if woundType ~= 0 then

						-- 当有woundType的时候根据受伤方向来播放格挡击中
						-- LogPrint(woundType)
						if prof == SkillVisual.NPCPROF_DEFAULT then
							-- NPC
							if nCurLogicAct == ObjectLogicActFlag.CASTSKILL then
								v.weight = 0.3	-- 正在播技能动作：权重降低
							end
							if woundType == 1 or woundType == 5 then
								v.mid = "受伤1"
							elseif woundType == 2 or woundType == 6 then
								v.mid = "受伤2"
							elseif woundType == 3 or woundType == 7 then
								v.mid = "受伤3"
							elseif woundType == 4 or woundType == 8 then
								v.mid = "受伤4"
							else
								local r = math.random()*100
								if r > 50 then
									v.mid = "受伤2"
								else
									v.mid = "受伤1"
								end
							end

							-- 特殊怪配置
							if MonsterVisual.ForceAction[iTemplID] and MonsterVisual.ForceAction[iTemplID].canblock == true then

								if woundType == 1 or woundType == 5 then
									v.mid = "格挡击中左"
								elseif woundType == 2 or woundType == 6 then
									v.mid = "格挡击中右"
								else
									local r
									r = math.random()*100
									if r > 50 then
										v.mid = "格挡击中左"
									else
										v.mid = "格挡击中右"
									end
								end
							end

						else
							-- Player
							LogPrintA("woundType:" .. woundType)
							if woundType == 5 then
								v.mid = "格挡击中1"
							elseif woundType == 6 then
								v.mid = "格挡击中2"
							elseif woundType == 7 then
								v.mid = "格挡击中3"
							elseif woundType == 8 then
								v.mid = "格挡击中4"
							end
						end

					else
						-- woundType为0时
						
						if prof == SkillVisual.NPCPROF_DEFAULT then
							-- NPC

							if nCurLogicAct == ObjectLogicActFlag.CASTSKILL then
								v.weight = 0.3	-- 正在播技能动作：权重降低
							end

							-- 用受伤
							local r = math.random()*100
							if r > 50 then
								v.mid = "受伤2"
							else
								v.mid = "受伤1"
							end
						else
							-- Player

							-- 用格挡序列
							v.mid = SkillVisual:GetBlockWoundAct()
						end
					end
												
					if v.mid ~= nil and v.mid ~= "" then
						v.newecm = SkillVisual:ComposeActName(v.pre, v.mid, prof, iStance, weapontype, iPerformID, bInGuard)
						-- LogPrint("BlockWoundAct: "..v.newecm.."\n")
					end
				end
			end

		elseif bWound then

			--	击飞、击晕、击倒中受伤：
			tabReturn["PlayChn"] = SKILLVIS_CHN_PARA_ACT -- -- 作为并行动作通道（只播动作，不冲主运动通道）
					
			if tabECM ~= nil then

				for k,v in pairs(tabECM) do

					v.actchn = ACT_CHANNEL_FULLWOUND_EXCLU --击飞、击晕、击倒中受伤：在全身独占通道

					if prof == SkillVisual.NPCPROF_DEFAULT then
						-- NPC
						v.weight = 1.0
						v.end_time = -500

						if iPerformID == CTRLSTATEID_WOUND_BEATCOLLAPSE then
							-- 击晕中受伤：
							v.end_time = -1 --击晕结束之前不播起身
							-- 击晕中受伤：
							--	mid动态生成
							if woundType == 1 or woundType == 5 then
								v.mid = "受伤3"
							elseif woundType == 2 or woundType == 6 then
								v.mid = "受伤4"
							elseif woundType == 3 or woundType == 7 then
								v.mid = "受伤3"
							elseif woundType == 4 or woundType == 8 then
								v.mid = "受伤4"
							else
								local r = math.random()*100
								if r > 50 then
									v.mid = "受伤3"
								else
									v.mid = "受伤4"
								end
							end
						end

					else
						-- Player
						v.weight = 1.0
						v.end_time = -500 --击飞、击倒结束之前500ms要播起身

						if iPerformID == CTRLSTATEID_WOUND_BEATCOLLAPSE then
							-- 击晕中受伤：
							v.end_time = -1 --击晕结束之前不播起身
							--	mid动态生成
							--LogPrintA("攻击方位是:"..woundType)
							if woundType ~= 0 then	
								if woundType == 5 then
									v.mid = "击晕受伤5"
								elseif woundType == 6 then
									v.mid = "击晕受伤6"
								elseif woundType == 7 then
									v.mid = "击晕受伤7"
								else
									v.mid = "击晕受伤7"
								end	
							else
								v.mid = SkillVisual:GetBlockWoundAct()
							end
						end
					end

					if v.mid ~= nil and v.mid ~= "" then
						v.newecm = SkillVisual:ComposeActName(v.pre, v.mid, prof, iStance, weapontype, iPerformID, bInGuard)
					end
					-- LogPrint("WoundAct: "..v.newecm.."\n")
				end
			end
		end

		if tabReturn and tabReturn.ModifyECM ~= nil then
			-- 拼动作名
			for k,v in pairs(tabReturn.ModifyECM) do
				-- mid为空或""：表示不改变当前动作
				if v.mid ~= nil and v.mid ~= "" then
					v.newecm = SkillVisual:ComposeActName(v.pre, v.mid, prof, iStance, weapontype, 0, 0)
				end
				--local str
				--str = string.format("StateID: %d, name: %s\n", iPerformID, v.newecm)
				--LogPrint(str)		
			end
		end
	end

	return tabReturn
end

--这个全局变量和数组是为了做出随机格挡效果，并且和前一次的格挡动作不一样，如果做真随机，不断的repeat太费资源，所以做了这种伪随机，按手工的排序播放，数组元素为30
local skillvisual_block_wound_index = 0
SkillVisual.BlockWoundActArr =
{
	"格挡击中1","格挡击中2","格挡击中3",
	"格挡击中1","格挡击中2","格挡击中3",
	"格挡击中1","格挡击中2","格挡击中3",
	"格挡击中1","格挡击中2","格挡击中3",
	"格挡击中1","格挡击中2","格挡击中3",
	"格挡击中1","格挡击中2","格挡击中3",
	"格挡击中1","格挡击中2","格挡击中3",
	"格挡击中1","格挡击中2","格挡击中3",
	"格挡击中1","格挡击中2","格挡击中3",
	"格挡击中1","格挡击中2","格挡击中3",
}
function SkillVisual:GetBlockWoundAct()
	skillvisual_block_wound_index = skillvisual_block_wound_index + 1
	if skillvisual_block_wound_index > 30 then
		skillvisual_block_wound_index = 1
	end
	return SkillVisual.BlockWoundActArr[skillvisual_block_wound_index]
end

----------------------------------------------
------------   小控制表现  --------------
----------------------------------------------

--	小控制状态：用主通道（小控制不会与大控制并存）
-- idCtrlSt: CTRLSTATEID_xxx
-- bPush, bPull, bWound
-- idSkill: 小控制或者投技技能id
function SkillVisual:GetSmallCtrlStVisual(iTemplID, idCtrlSt, bPush, bPull, bWound, prof, iStance, weapontype, idSkill)

	local tabReturn = nil

	--local strdbg = string.format("GetSmallCtrlStVisual: %d, Push %d, Pull %d, Wound %d\n", idCtrlSt, bPush and 1 or 0, bPull and 1 or 0, bWound and 1 or 0)
	--LogPrint(strdbg)
	
	local tab = SkillVisual.SmallCtrlParam[idCtrlSt]	
	if tab ~= nil then
		if bPush then
			tab = tab["Push"]
		elseif bPull then
			tab = tab["Pull"]
		elseif bWound then
			tab = tab["Wound"]
		else
			tab = tab["None"]
		end

		if tab ~= nil then
			tabReturn = tab[idSkill]
			if tabReturn == nil then
				tabReturn = tab[0]
			end
		end

		if tabReturn and tabReturn.ModifyECM ~= nil then
			-- 拼动作名
			for k,v in pairs(tabReturn.ModifyECM) do
				-- mid为空或""：表示不改变当前动作
				if v.mid ~= nil and v.mid ~= "" then
					v.newecm = SkillVisual:ComposeActName(v.pre, v.mid, prof, iStance, weapontype, 0, 0)
				end
				--local str
				--str = string.format("StateID: %d, name: %s\n", iPerformID, v.newecm)
				--LogPrint(str)		
			end
		end
	end

	return tabReturn
end

----------------------------------------------
------------   Perform表现  --------------
----------------------------------------------
function SkillVisual:GetPerformVisual(iTemplID, iStance, iPerformID, bPush, bPull, bWound, prof, weapontype, woundType, nBeAtkPerfID, nCycleCount, nCurLogicAct, bInGuard)

	--local str
	--str = string.format("GetPerformVisual: iPerformID %d, Push %d, Pull %d, Wound %d\n", iPerformID, bPush and 1 or 0, bPull and 1 or 0, bWound and 1 or 0)
	--LogPrint(str)

	local tabReturn
	
	if SkillVisual.PerformParam[iPerformID] then
		tabReturn = SkillVisual.PerformParam[iPerformID]
	elseif SkillVisual.PerformParam_Replace[iPerformID] then
		tabReturn = SkillVisual.PerformParam[SkillVisual.PerformParam_Replace[iPerformID]]
	end

	if tabReturn ~= nil then
		--LogPrint("GetPerformVisual: TabReturn Not nil\n")

		local tabECM = tabReturn.ModifyECM
		if tabECM ~= nil then
			-- 拼动作名
			for k,v in pairs(tabECM) do
				-- mid为空或""：表示不改变当前动作

				if v.mid ~= nil and v.mid ~= "" then
					
					--------下面是普通攻击随机动作
					if iPerformID == 1582 then
						local pt_attack_numrandom = math.random()
						local pt_attack_textrandom = ""
						--LogPrint(pt_attack_numrandom)
						if pt_attack_numrandom > 0.5 then
							pt_attack_textrandom = "攻击1"
							if pt_attcck_countnumber >= 0 then
							pt_attcck_countnumber = pt_attcck_countnumber + 1
							else pt_attcck_countnumber = 1
							end
						else pt_attack_textrandom = "攻击2"
							if pt_attcck_countnumber <= 0 then
							pt_attcck_countnumber = pt_attcck_countnumber - 1
							else pt_attcck_countnumber = -1
							end
						end
						--LogPrint(pt_attcck_countnumber)
						if pt_attcck_countnumber >= 3 then
							pt_attack_textrandom = "攻击2"
							pt_attcck_countnumber = -1
						elseif pt_attcck_countnumber <= -3 then
							pt_attack_textrandom = "攻击1"
							pt_attcck_countnumber = 1
						end
						--LogPrint(pt_attcck_countnumber)
						v.newecm = SkillVisual:ComposeActName(v.pre, pt_attack_textrandom, prof, iStance, weapontype, iPerformID, bInGuard)
					else
					--------上面是普通攻击随机动作

					v.newecm = SkillVisual:ComposeActName(v.pre, v.mid, prof, iStance, weapontype, iPerformID, bInGuard)
					end
				end
				--local str
				--str = string.format("StateID: %d, name: %s\n", iPerformID, v.newecm)
				--LogPrintA(str)
			end
		end

		if tabECM ~= nil then

			for k,v in pairs(tabECM) do

				-- 循环段：动画速度必须填speed_arr
				if nCycleCount > 0 and v.speed_arr ~= nil then				
					local nArr = #v.speed_arr
				
					-- 根据已循环次数取播放速度
					if nArr >= nCycleCount then
						v.anispeed = v.speed_arr[nCycleCount]
					elseif nArr > 0 then
						v.anispeed = v.speed_arr[nArr]
					end
				end
			end
		end
	end

	return tabReturn
end

--a func to Compose ECM Act Name
function SkillVisual:ComposeActName(pre, mid, prof, stance, weapontype, iPerformID, bInGuard)
	local actname, prop
	local post

	if prof ~= SkillVisual.NPCPROF_DEFAULT then
		-- Player:

		--some codes to combine a ECMNAME depends on prof just like ecmactname.lua
		--post = FactionList[prof + 1].s_spe
		
		post = FactionList[weapontype + 1].s_spe
		if bInGuard == false then
			if SkillVisual.PerformParam[iPerformID] and SkillVisual.PerformParam[iPerformID]["ModifyECM"] and SkillVisual.PerformParam[iPerformID]["ModifyECM"][1].unguardnormal then
				if SkillVisual.PerformParam[iPerformID]["ModifyECM"][1].unguardnormal == 1 then
					post = FactionList[1].s_spe
				end
			elseif SkillVisual.PerformParam_Replace[iPerformID] then
				local replace_pid = SkillVisual.PerformParam_Replace[iPerformID]
				if SkillVisual.PerformParam[replace_pid] and SkillVisual.PerformParam[replace_pid]["ModifyECM"] and SkillVisual.PerformParam[replace_pid]["ModifyECM"][1].unguardnormal then
					if SkillVisual.PerformParam[replace_pid]["ModifyECM"][1].unguardnormal == 1 then
						post = FactionList[1].s_spe
					end
				end
			end
		end
		local prename = ""
		if pre ~= nil then
			if pre[stance + 1] ~= nil then
				prename = pre[stance + 1]
			elseif pre[1] ~= nil then
				prename = pre[1]
			end
		end

		actname = string.format(CANNAMENORMALSTYLE, prename, mid, post)
		
		--local str = string.format("SkillVis::ComposeActName: %s <- pre %s, mid %s, prof %d, stance %d, weapon %d\n", actname, prename, mid, prof, stance, weapontype)
		--LogPrintA(str)
	else
		-- NPC
		actname = mid

		--local str = string.format("SkillVis::ComposeActName: weapontype %d, actname %s\n", weapontype, actname)
		--LogPrintA(str)
	end

	return actname
end

function SkillVisual:GetWuluoConfig()
	return SkillVisual.WuluoConfig.modelpath,
					SkillVisual.WuluoConfig.headskin,
					SkillVisual.WuluoConfig.clothesskin,
					SkillVisual.WuluoConfig.hairskin,
					SkillVisual.WuluoConfig.ToSkillPerform,
					SkillVisual.WuluoConfig.ToSkillGfx,
					SkillVisual.WuluoConfig.ToOriginPerform,
					SkillVisual.WuluoConfig.ToOriginGfx,
					SkillVisual.WuluoConfig.portraitOffset_x,
					SkillVisual.WuluoConfig.portraitOffset_y,
					SkillVisual.WuluoConfig.portraitOffset_z,
					SkillVisual.WuluoConfig.stance_id,
					SkillVisual.WuluoConfig.specialSkill
end

function SkillVisual:GetWuluoCustomClothes( clothesid )
	return SkillVisual.CustomWuluoConfig["clothes"][clothesid]
end

function SkillVisual:GetWuluoCustomHair( hairid )
	-- body
	return SkillVisual.CustomWuluoConfig["hair"][hairid]
end