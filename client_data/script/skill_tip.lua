--[[#tag push auto]]

--  created:   2009.08.04
--  author:    djh
--  技能描述





------------------------------------------------------------------------------------------------------------------

--路径管理器类型




DATA_PATH_MAN  = 0
SKILL_PATH_MAN = 1
--获得图标路径函数说明:
--全路径: GetFilePathByID(idIcon,idManager)
--文件名: GetFileNameByID(idIcon,idManager)
--idManager:  DATA_PATH_MAN | SKILL_PATH_MAN

--API函数接口--
--GameApi.GetSkillEssence()
--GameApi.GetSkillProcess()
--GameApi.GetFileNameByID()
--GameApi.GetSkillClass()
--GameApi.GetSkillPack()
--GameApi.GetSkillSource()
--GameApi.GetSkillLimit()
--GameApi.GetSkillTable()
--GameApi.GetSkillSubObjProc()
--GameApi.GetSkillSubObjRepProc()       子物体替换技能段数据

SkillTip = {}

SkillTip.SkillCode =
{
	--施放检查返回码
	CHKCASTSKL_FAILED =	-1,		--	Failed (or all unknown error)
	CHKCASTSKL_OK =	0,			--	ok, host can cast the skill aaaaaaaaaaaaaaaa
	CHKCASTSKL_INVALID_SKL = 1,		--	invalid skill
	CHKCASTSKL_INVALID_WEAPON = 2,		--	invalid weapon
	CHKCASTSKL_NOTENOUGH_MP = 3,		--	not enough mp
	CHKCASTSKL_NOTENOUGH_RAGE = 4,		--	not enough rage
	CHKCASTSKL_NOTENOUGH_ITEM = 5,		--	not enough item
	CHKCASTSKL_INVALID_TARGET = 6,		--	invalid target
	CHKCASTSKL_TARGET_TOOFAR = 7,		--	target is too far
	CHKCASTSKL_SKILL_COOLING = 8,		--	skill is cooling aaaaaaaaaaaaaaaaaaaa
	CHKCASTSKL_SKILL_USING = 9,		--	another skill is be used
	CHKCASTSKL_TARGET_TOONEAR = 10,		--	target is too near
	CHKCASTSKL_TARGET_NOTFRONT = 11,	--	target isn't in front of us
	CHKCASTSKL_HOST_STUN = 12,		--	host is in stun state
	CHKCASTSKL_WRONG_SKLCASTSTATE = 13,	--	wrong skill cast state
	CHKCASTSKL_NEED_TARGET = 14,		--	need a target aaaaaaaaaaaaaaaaaaaa
	CHKCASTSKL_HOST_DEAD = 15,		--	host is in dead state
	CHKCASTSKL_HOST_FIGHT = 16,		--	host is in fight
	CHKCASTSKL_HOST_WRONGSTATE = 17,	--	host is in all other wrong states
	CHKCASTSKL_SKILLMOVE_CHKFAIL = 18,	--	Check Skill Move Failed
	CHKCASTSKL_STATE_TRANSFAIL = 19,	--	State Transfer Failed
	CHKCASTSKL_TARGET_NOTMATCH = 20,	--	target is not match
	CHKCASTSKL_TARGET_HIGHLEVEL = 21,	--	target's level is higher than player
	CHKCASTSKL_PETPACK_FULL = 22,		--	Pet pack is full
	CHKCASTSKL_VEHICLE_LIMIT = 23,		--	bind vehicle's limitation
	CHKCASTSKL_POSSKL_INVALIDPOS = 24,	--	Pos Skill Invalid Pos
	CHKCASTSKL_EXEC_CMD = 25,		--	Execute Command
	CHKCASTSKL_NOTENOUGH_STRENGTH = 26,	--	not enough strength

	--施放技能的返回码

	CASTSKL_BEGIN		= 100,
	CASTSKL_INVALID_ITEM = 101,			--	Item Skill: Invalid Item
	CASTSKL_CANNOT_COMBO = 102,			--	Skill Sequence: Cannot find next Combo Skill
	CASTSKL_NOTCAST_THISTIME = 103,		--	Not Cast This Time
	CASTSKL_OK_SENT = 104,				--	Cast Skill OK and Sent To Server
	CASTSKL_WAITING_TO_BUFFER = 105,	--	Cannot Buffer Skill now but Can Later
	CASTSKL_BUFFERED_NOTSENT = 106,		--	Skill Buffered and NOT Sent To Server
	CASTSKL_TRACING = 107,				--	Skill is Tracing
	CASTSKL_CHARGING = 108,				--	Skill is Charging
	CASTSKL_CHARGE_STOPPED = 109,		--	SkillCharge is Stopped just now
	CASTSKL_PRESSUP_IGNORE = 110,		--	Ignore PressUp
	CASTSKL_SKILLMASHING = 111,			--	SkillMash (increased press count)
}


------------------------------------------------------------------------------------------------------------------
----------------------------------------------技能TIP描述用函数---------------------------------------------------
------------------------------------------------------------------------------------------------------------------
--技能的连打循环次数
SKILL_CYCLE_COUNT = {}

--取得并整理技能TIP引用的数据

--1. 从接口处取得原始的数据，再转化成TIP显示的格式

--2. 仅在此函数内调用一次GameApi去取技能数据，以减少GameApi调用次数
function GetSkillData(idSkill,level)
	if level < 1 then level = 1 end		--未学习时显示1级技能的数据
	-------------------------------------------------------------------------------------------------------
	------（TIP的技能引用数据）------
	local skill = {}
	skill.special = 0				--特殊标记（无具体用处）


	--技能模板--
	skill.name = --[[!AUTO_1]]""					--名称
	skill.iconpath = 0					--图标pathid
	skill.profession = 0			--职业分类mask值，-1表示error，0表示空白
	skill.max_lv = 0				--最高生效等级

	skill.combo_type = 0			--连击类型：0非连招，1起，2承，3转，4合，5续，6替，7待

	--skill.combo_specific = 0		--连击特点：0无，1承接，2转折，3通用
	--skill.pose = 0 					--所属姿态

	skill.cd_type = 0				--CD组

	skill.cd_time = 0				--CD时间（毫秒）
	skill.mp_limit = {0,0,0,0}		--消耗限制（1内力2怒气3破绽4体力）

	skill.enhance_skill_id = 0			--强化技能id
	skill.cancast_in_qinggong = false			--是否轻功中可用

	skill.item_limit_id = 0			--吟唱限制物品ID
	skill.item_limit_number = 0		--吟唱限制物品数量
	skill.attack_type = 0			--使用方式，是否选目标之类

	skill.attack_isdirect = false 	--是否有面向

	skill.attack_angle = 0			--面向角度
	skill.attack_maxdistance = 0	--吟唱最大距离

	skill.attack_mindistance = 0	--吟唱最小距离

	skill.process_number = 0		--技能段的显示数量

	skill.process_real_number = 0	--技能段的实际数量（部分技能段数据在TIP内被忽略）

	skill.process_id = {}		--技能段的id
	skill.process_name = {}		--技能段的模板名
	skill.judge_type = 0
	skill.new_param_9 = 0			--战意

		----（测试用数据）

		skill.show_type = 0					--技能显示参考

		skill.show_effect = 0				--点选的显示效果
		skill.auto_type = 0					--影响自动攻击的类型


	--技能分类模板--
	skill.type = 0					--技能类型

	skill.use_type = 0				--技能使用方式

	skill.isblink = false			--是否瞬发

		----（测试用数据）

		--skill.bar_type = 0					--技能的计时显示类型

	--技能来源模板--
	skill.learn_max_lv = 0			--学习技能的等级上限
	skill.learn_pre_skill = 0		--学习需要的前提技能

	skill.learn_pre_skill_lv = 0	--学习需要的前提技能的等级
	skill.learn_player_level = {}	--学习技能人物等级需求序列

		----（测试用数据）

		skill.learn_type = 0				--技能来源类型

	--技能限制模板--
		----（测试用数据）

		skill.weapon_limit = 0				--技能的武器限制
		skill.target_limit = 0				--技能的目标限制
		skill.fight_state_limit = 0			--技能的战斗状态限制

	--技能过程模板--
	skill.pray_type = 0					--技能过程的类别，-1表示error，0直接（站定/移动施放）1吟唱2通道3站定蓄力4移动蓄力5连打6站定循环7移动循环8瞬发9被动
	skill.pray_time = 0					--基础吟唱时间（吟唱通道蓄力的时间）
	skill.cycle_time = 0				--连打循环的单段时间

	skill.charge_isinterrupt = 0		--蓄力是否被中断，0不中断 1挨打中断 2闪躲中断
	skill.ismovable_perform = false		--判定的过程是否可移动
	skill.mp_use = {0,0,0,0}			--全部过程的消耗限制mp之和（1内力2怒气3破绽4体力）

	skill.item_use_id = 0				--消耗物品ID
	skill.item_use_number = 0			--消耗物品数量

	--skill.exit_condition = 0			--技能过程的退出条件

	skill.cycle_count = 0				--循环次数（连打段 循环段），-1时表示没有手动填技能的连打or循环次数
	skill.charge_time = 0				--额外蓄力时间
	--skill.break_condition = 0			--技能过程的中断条件
	--skill.isaffect_bysight = false	--是否受视距影响

	skill.target_pozhan = 0				--目标破绽
	skill.self_pozhan = 0				--自身破绽
	skill.dodge_position = {0,0,0,0}	--闪避方位
	skill.gain_rage = 0					--怒气积累
	skill.isweak = false				--是否全弱点

	skill.isdamage = false				--技能过程是否有damage（某些子物体技能，技能本身的过程不带damage）

	skill.range_type = 0				--过程的目标影响对象

	skill.attack_range = -1				--攻击范围类型（默认为-1表示ERROR）0目标单体 1目标周围 2自身 3直线 4选目标直线 5扇形 6选目标扇形 7自身周围 8选目标区域（包含技能生成子物体的周围） 9以子物体为目标的周围 10技能生成子物体的周围（非选目标区域） 11自动目标区域（位移闪躲） 12遥控子物体攻击 13以宠物为目标
	skill.move_type = 0					--位移类型：-1表示error
	skill.move_scale = 0				--位移的距离比例

	skill.move_angle = 0				--位移的角度

	skill.move_max_distance = 0			--最大位移

	skill.move_min_distance = 0			--最小位移

	skill.isarrest = false				--是否是投技
	skill.target_number = 0				--群攻人数上限
	skill.control_type = 0				--大控制效果

	skill.control_time = 0				--大控制时间

	skill.control_distance = 0			--大控制距离

	skill.push_distance = 0				--技能的推开距离
	skill.subtype = 0					--技能的子物体类型（0不带子物体，1带子物体且技能无判定，2带子物体且技能自身带判定，3遥控子物体）

	--子物体相关

	--（每技能段一份子物体数据）

	--（子物体数据只放在skill和subobject里，不放在process内）
	skill.subobject_id = {}				--技能段附带子物体ID（-1表示子物体替换技能段）

	skill.subobject_type = {}			--技能段是否带子物体类型（0不带子物体，1带子物体且技能无判定，2带子物体且技能自身带判定，3遥控子物体）
	skill.subobject_name = --[[!AUTO_2]]""			--子物体的手写名字描述
	skill.subobject_cast = --[[!AUTO_3]]""			--附带子物体时的技能类型手写描述

	skill.subobject_gen_distance = 0	--子物体生成距离


		----（测试用数据）
		skill.combo_times = 0						--连击数

		skill.time = 0								--技能总持续时间

		skill.delay_type = 0						--延时类型
		skill.delay_time = 0						--基础延时
		skill.delay_speed = 0						--延时飞行速度
		skill.affect_radius = 0						--过程的目标影响半径范围

		skill.affect_distance = 0					--过程的目标影响长度范围

		skill.affect_angle = 0						--过程的目标影响角度范围

		skill.buff_id = {}							--状态id
		skill.buff_time = {}						--状态时间
		skill.buff_probability = {}					--状态成功率
		skill.buff_param = {}						--状态参数

		skill.target_buff_id = {0,0,0,0}				--目标状态id
		skill.target_buff_time = {0,0,0,0}			--目标状态时间

		skill.target_buff_probability = {0,0,0,0}		--目标状态成功率
		skill.target_buff_param = {{0,0,0,0,0},{0,0,0,0,0},{0,0,0,0,0},{0,0,0,0,0}}		--目标状态参数

		skill.self_buff_id = {0,0,0,0}				--自身状态id
		skill.self_buff_time = {0,0,0,0}				--自身状态时间

		skill.self_buff_probability = {0,0,0,0}		--自身状态成功率
		skill.self_buff_param = {{0,0,0,0,0},{0,0,0,0,0},{0,0,0,0,0},{0,0,0,0,0}}		--自身状态参数

		--skill.hp_steal_type = 0		--吸血类型
		--skill.hp_steal_percent = 0		--吸血百分比参数

		skill.dodge_pozhan_up = 0	--被闪避后自身破绽增加比例
		skill.block_pozhan_up = 0	--被格挡后自身破绽增加点数
		skill.process_isdodgebreak = {}		--过程段是否可被战术技能取消


	-------------------------------------------------------------------------------------------------------
	------（TIP的技能过程引用数据）------
	local process = {}
	--技能过程模板--
	process.type = {}					--过程的类别

	process.move_type = {}				--过程的位移类型

	process.move_max_distance = {}				--过程的最大位移

	process.damage_type = {}				--过程的伤害类型

	process.combo = {}						--过程的连击数

		--伤害数据
	process.attack = {}						--附加外功攻击力

	process.ratio = {}						--附加外功攻击倍率
	process.mag_attack = {}						--附加内功攻击力

	process.mag_ratio = {}						--附加内功攻击倍率
	process.element_damage_type = {}		--属性伤害类型，0无1倍率2点数
	process.element_damage_number = {}		--属性伤害数值


	process.hit_rate = {}					--附加命中率

	process.crit_rate = {}					--附加暴击
	process.crit_damage = {}				--附加暴伤
	process.dodge_position = {{},{},{},{}}	--闪避方位
	process.hit_position = {{},{},{},{}}	--判定针对
	process.isattack_qinggong = {}			--攻击高空
	--process.check_position = {{},{},{},{}}	--克制方位
	--process.check_type = {}					--克制效果类型
	--process.check_number = {}				--克制效果类型参数

		--（测试用数据）

		process.set_speed = {}					--可移动段的当前移动速度限制
	-------------------------------------------------------------------------------------------------------
	------（TIP的子物体过程引用数据）------
	local subobject = {}
	--子物体过程模板--
	subobject.damage_type = {}
	subobject.combo = {}
	subobject.attack = {}
	subobject.ratio = {}
	subobject.mag_attack = {}
	subobject.mag_ratio = {}
	subobject.element_damage_type = {}
	subobject.element_damage_number = {}
	subobject.affect_radius = {}
	-------------------------------------------------------------------------------------------------------
	--取得技能原始数据，并整理成技能TIP数据
	local skill_essence = GameApi.GetSkillEssence(idSkill,level)

	skill.name = skill_essence["display_name"]
	skill.iconpath = skill_essence["icon_path"]
	skill.profession = skill_essence["mask_character"]
	skill.max_lv = skill_essence["level_max"]
	local c_mask = skill_essence["combo_mask"]
	if c_mask >= 1 then skill.combo_type = 1 + math.floor(math.log(c_mask)/math.log(2)) end
	skill.cd_type = skill_essence["cooldown_id"]
	skill.cd_time = skill_essence["cooldown_single_time"]
	skill.mp_limit = {skill_essence["intonate_limit_mp"][1],skill_essence["intonate_limit_mp"][2],skill_essence["intonate_limit_mp"][3],skill_essence["intonate_limit_mp"][4]}
	LogPrint(skill.mp_limit[1])
	skill.item_limit_id = skill_essence["intonate_limit_item"]
	skill.item_limit_number = skill_essence["intonate_limit_item_ex"]
	skill.attack_type = skill_essence["attack_type"]
	skill.attack_isdirect = skill_essence["need_target_dir"]
	skill.attack_angle = skill_essence["target_dir_angle"]
	skill.attack_maxdistance = skill_essence["auto_move_distance"]
	skill.attack_mindistance = skill_essence["auto_back_distance"]
	skill.show_type = skill_essence["display_ref"]
	skill.show_effect = skill_essence["display_effect"]
	skill.auto_type = skill_essence["affect_auto_attack"]
	if skill_essence["cancast_in_qinggong"] == 1 then skill.cancast_in_qinggong = true end
	skill.enhance_skill_id = skill_essence["enhance_skill_id"]
	skill.judge_type = skill_essence["skill_judge_type"]
	skill.new_param_9 = skill_essence["skill_new_param_9"]

	local skill_class = GameApi.GetSkillClass(idSkill)
	skill.type = skill_class["type"]
	skill.use_type = skill_class["use_way"]
	if skill_class["time_type"] == 1 then skill.isblink = true end

	local skill_source = GameApi.GetSkillSource(idSkill)
	skill.learn_max_lv = skill_source["learn_level_max"]
	skill.learn_pre_skill = skill_source["learn_pre_id"]
	skill.learn_pre_skill_lv = skill_source["learn_pre_level"]
	skill.learn_player_level = skill_source["learn_pre_level_sq"]
	skill.learn_type = skill_source["source"]

	local skill_limit = GameApi.GetSkillLimit(idSkill)
	skill.weapon_limit = skill_limit["weapon_limit"]
	skill.target_limit = skill_limit["target_limit"]
	skill.fight_state_limit = skill_limit["fight_state_limit"]


	local real_per = 0
	if skill.type == 3 or skill.type == 4 then
		skill.pray_type = 9
	end

	local skill_process = {}
	for per = 1,16 do
		if skill_essence["process_id"][per] > 0 then
			skill_process = GameApi.GetSkillProcess(idSkill,per-1,level)
			skill.process_real_number = skill.process_real_number + 1		--计算技能段的实际数量

			skill.process_id[per] = skill_essence["process_id"][per]
			skill.process_name[per] = skill_process["name"]
			skill.process_isdodgebreak[per] = skill_process["self_account_data"][46]	--过程段是否可被战术技能取消

		if not CheckIgnoreSkillProcess(skill_essence["process_id"][per]) then
			skill.special = 1
		else
			skill.process_number = skill.process_number + 1		--计算技能段的显示数量

			real_per = real_per + 1 		--段计数

			if skill.type ~= 3 and skill.type ~= 4 then
				if per == 1 then													--8：瞬发

					if skill_process["type"] == 1 and skill.isblink then
						skill.pray_type = 8
					end
				end
				if skill.pray_type == 0 then
					if skill_process["type"] == 0 then								--1：准备xx秒（吟唱）

						skill.pray_type = 1
						skill.pray_time = skill_process["duration"]
					end
					if skill_process["type"] == 12 then 							--2：持续xx秒（通道）

						skill.pray_type = 2
						skill.pray_time = skill_process["duration"]
					end
					if skill_process["type"] == 11 then 							--3：站定蓄力xx秒

						skill.pray_type = 3
						skill.pray_time = skill_process["duration"]
					end
					if skill_process["type"] == 111 then
						skill.pray_type = 3
						skill.pray_time = skill_process["duration"]
						skill.charge_isinterrupt = 1
					end
					if skill_process["type"] == 112 then
						skill.pray_type = 3
						skill.pray_time = skill_process["duration"]
						skill.charge_isinterrupt = 2
					end
					if skill_process["type"] == 41 then								--4：移动蓄力xx秒

						skill.pray_type = 4
						skill.pray_time = skill_process["duration"]
					end
					if skill_process["type"] == 411 then
						skill.pray_type = 4
						skill.pray_time = skill_process["duration"]
						skill.charge_isinterrupt = 1
					end
					if skill_process["type"] == 412 then
						skill.pray_type = 4
						skill.pray_time = skill_process["duration"]
						skill.charge_isinterrupt = 2
					end
					if skill_process["type"] == 31 then								--5：连打
						skill.pray_type = 5
						skill.cycle_time = skill_process["duration"]
					end
					if skill_process["type"] == 3 then								--6：站定重复施放n次

						skill.pray_type = 6
						skill.cycle_time = skill_process["duration"]
					end
					if skill_process["type"] == 4 then								--7：移动重复施放n次

						skill.pray_type = 7
						skill.cycle_time = skill_process["duration"]
					end
				elseif skill.pray_type ~= -1 then
					if skill_process["type"] ~= 1 and skill_process["type"] ~= 2 and skill_process["type"] ~= 42 and skill_process["type"] ~= 101 then
						if skill_process["type"] ~= 3 and skill_process["type"] ~= 4 and skill_process["type"] ~= 12 then
							if skill_process["type"] == 11 or skill_process["type"] == 111 or skill_process["type"] == 112 then
								skill.pray_type = 10		--10：重复站定蓄力

							elseif skill_process["type"] == 41 or skill_process["type"] == 411 or skill_process["type"] == 412 then
								skill.pray_type = 11		--11：重复移动蓄力

							else skill.pray_type = -1 end									--(-1)：error
						else
							skill.cycle_time = skill_process["duration"]
						end
					end
				end
			else skill.pray_type = 9												--9：被动生效

			end
			if skill_process["damage_type"] == 0 or skill_process["damage_type"] == 1 then
				if skill_process["type"] == 42 or skill_process["type"] == 4 then
					skill.ismovable_perform = true
				end
			end

			for n1 = 1, 4 do
				skill.mp_use[n1] = skill.mp_use[n1] + math.ceil(skill_process["fire_limit"][n1])
			end
			skill.item_use_id = skill_process["limit_item"]
			skill.item_use_number = skill_process["limit_item_ex"]
			if skill_process["type"] == 3 or skill_process["type"] == 4 or skill_process["type"] == 31 then
				if SKILL_CYCLE_COUNT[idSkill] then
					skill.cycle_count = SKILL_CYCLE_COUNT[idSkill]
				else
					skill.cycle_count = -1
				end
			end
			skill.time = skill.time + skill_process["duration"] * 0.001			--连打or循环时不显示技能总时长，显示单段时长//蓄力时skill.time为最短技能时长，加上额外蓄力时间就是最长技能时长


			if skill_process["type"] == 11 or skill_process["type"] == 111 or skill_process["type"] == 112 or skill_process["type"] == 41 or skill_process["type"] == 411 or skill_process["type"] == 412 then
				skill.charge_time = skill_process["max_charge_time"]
			end
			if skill_process["type"] == 3 or skill_process["type"] == 31 or skill_process["type"] == 4 then
				if skill_process["damage_type"] == 0 or skill_process["damage_type"] == 1 then
					skill.target_pozhan = skill_process["target_account_data"][4]
				end
				skill.self_pozhan = skill_process["self_account_data"][10]
			else
				if skill_process["damage_type"] == 0 or skill_process["damage_type"] == 1 then
					skill.target_pozhan = skill.target_pozhan + skill_process["target_account_data"][4]
				end
				skill.self_pozhan = skill.self_pozhan + skill_process["self_account_data"][10]
			end
			if skill_process["self_account_data"][10] > 0 then
				skill.dodge_pozhan_up = skill_process["self_account_data"][47]
				skill.block_pozhan_up = skill_process["self_account_data"][48]
			end
			skill.gain_rage = skill.gain_rage + skill_process["self_account_data"][34]
			for n2 = 1, 4 do
				skill.dodge_position[n2] = skill.dodge_position[n2] + skill_process["self_account_data"][13+n2]
				if skill.dodge_position[n2] > 1 then skill.dodge_position[n2] = 1 end
			end
			skill.combo_times = skill.combo_times + skill_process["self_account_data"][9]
			if skill_process["target_affect_dt"] > 0 then
				skill.delay_type = skill_process["target_affect_dt"]
				skill.delay_time = skill_process["target_affect_dl"]
				skill.delay_speed = skill_process["target_affect_fs"]
			end

			if skill_process["target_affect_obj"] > 0 then
				if skill_process["target_affect_obj"] > 0 and skill_process["damage_type"] < 2 then
					skill.range_type = skill_process["target_affect_obj"]
				end
				skill.affect_radius = skill_process["target_affect_radius"]
				skill.affect_distance = skill_process["target_affect_lenght"]
				skill.affect_angle = skill_process["target_affect_angle"]
			end
			if skill_process["move_type"] > 0 and skill_process["move_type"] < 5 then
				if skill.move_type == 0 or skill.move_type == skill_process["move_type"] then
					skill.move_type = skill_process["move_type"]
					skill.move_scale = skill_process["move_dis_scale"]
					skill.move_angle = skill_process["move_dir_angle"]
					skill.move_max_distance = skill.move_max_distance + skill_process["move_dis_max"]
					skill.move_min_distance = skill.move_min_distance + skill_process["move_dis_min"]
				else
					skill.move_type = -1
				end
			end
			if skill_process["self_account_data"][33] == 2 then skill.isarrest = true end
			if skill_process["self_account_data"][35] > skill.target_number then skill.target_number = skill_process["self_account_data"][35] end
			if skill_process["self_account_data"][27] > skill.control_type then
				skill.control_type = skill_process["self_account_data"][27]
				skill.control_time = skill_process["self_account_data"][28]
				skill.control_distance = skill_process["self_account_data"][29]
			end
			skill.push_distance = skill_process["pick_min"]

			skill.buff_id[per] = {}
			skill.buff_time[per] = {}
			skill.buff_param[per] = {}
			skill.buff_probability[per] = {}
			for n6 = 1, 12 do
				if skill_process["states"][n6]["state_id"] > 0 then
					skill.buff_id[per][n6] = skill_process["states"][n6]["state_id"]
					skill.buff_time[per][n6] = skill_process["states"][n6]["state_time"]
					skill.buff_probability[per][n6] = skill_process["states"][n6]["state_probability"]
					skill.buff_param[per][n6] = {}
					for s = 1,5 do
						skill.buff_param[per][n6][s] = skill_process["states"][n6]["state_param"][s]
					end
				else
					skill.buff_id[per][n6] = 0
				end
			end

			process.type[real_per] = skill_process["type"]
			process.move_type[real_per] = skill_process["move_type"]
			process.move_max_distance[real_per] = skill_process["move_dis_max"]
			process.damage_type[real_per] = skill_process["damage_type"]

			--内外功伤害数据

			if process.damage_type[real_per] == 0 or process.damage_type[real_per] == 1 then
				process.attack[real_per] = skill_process["damage_skill_external"]
				process.ratio[real_per] = skill_process["scale_skill_external"]
				process.mag_attack[real_per] = skill_process["damage_skill_internal"]
				process.mag_ratio[real_per] = skill_process["scale_skill_internal"]
			end
			--8项属性伤害数据

			process.element_damage_type[real_per] = {}
			process.element_damage_number[real_per] = {}
			for e_t = 1,8 do
				process.element_damage_type[real_per][e_t] = skill_process["ext_damage"][e_t]["ext_damage_type"]
				process.element_damage_number[real_per][e_t] = skill_process["ext_damage"][e_t]["ext_damage_vale"]
			end

			if skill_process["damage_type"] == 0 or skill_process["damage_type"] == 1 then
				skill.isdamage = true
			end
			process.hit_rate[real_per] = skill_process["self_account_data"][3]
			process.crit_rate[real_per] = skill_process["self_account_data"][4]
			process.crit_damage[real_per] = skill_process["self_account_data"][5]
			process.combo[real_per] = skill_process["self_account_data"][9]

			local h_mask = skill_process["self_account_data"][12]
			for n3 = 1, 4 do
				if h_mask >= 2^(4-n3) then
					process.hit_position[5-n3][real_per] = 1
					h_mask = h_mask - 2^(4-n3)
				else process.hit_position[5-n3][real_per] = 0
				end
			end
			if skill_process["self_account_data"][13] > 0 then process.isattack_qinggong[real_per] = true else process.isattack_qinggong[real_per] = false end
			--for n4 = 1, 4 do
			--	process.check_position[n4][real_per] = skill_process["self_account_data"][17+n4]
			--end
			for n5 = 1, 4 do
				process.dodge_position[n5][real_per] = skill_process["self_account_data"][13+n5]
			end
			if skill_process["self_account_data"][19] > 0 then skill.isweak = true end
			--process.check_type[real_per] = skill_process["self_account_data"][30]
			--process.check_number[real_per] = skill_process["self_account_data"][31]
			process.set_speed[real_per] = skill_process["self_account_data"][26]

			skill.subobject_id[real_per] = 0
			skill.subobject_type[real_per] = 0
			subobject.damage_type[real_per] = 0
			subobject.combo[real_per] = 0
			subobject.attack[real_per] = 0
			subobject.ratio[real_per] = 0
			subobject.mag_attack[real_per] = 0
			subobject.mag_ratio[real_per] = 0
			subobject.element_damage_type[real_per] = {}
			subobject.element_damage_number[real_per] = {}
			subobject.affect_radius[real_per] = 0

			--取子物体过程数据
			if skill_process["subobj[0].subobj_id"] > 0 then
				skill.subobject_id[real_per] = skill_process["subobj[0].subobj_id"]
				if skill_process["damage_type"] == 2 then
					skill.subobject_type[real_per] = 1
				else skill.subobject_type[real_per] = 2
				end
				if SKILL_SUBOBJECT_NAME[skill_process["subobj[0].subobj_id"]] then skill.subobject_name = SKILL_SUBOBJECT_NAME[skill_process["subobj[0].subobj_id"]]
				else skill.subobject_name = SKILL_SUBOBJECT_NAME[-1] end
				if SKILL_SUBOBJECT_CAST[skill_process["subobj[0].subobj_id"]] then skill.subobject_cast = SKILL_SUBOBJECT_CAST[skill_process["subobj[0].subobj_id"]]
				else skill.subobject_cast = SKILL_SUBOBJECT_CAST[-1] end
				skill.subobject_gen_distance = skill_process["subobj[0].subobj_gen_distance"]

				local skill_subobject_data = {}
				skill_subobject_data[per] = GameApi.GetSkillSubObjProc(idSkill,skill_essence["process_id"][per],level)
				skill_subobject = skill_subobject_data[per]
				if skill_subobject then
					--if skill.control_type < 4 then			--0~3表示没有打入控制
						skill.control_type = skill_subobject["self_account_data"][27]
						skill.control_time = skill_subobject["self_account_data"][28]
						skill.control_distance = skill_subobject["self_account_data"][29]
					--end

					skill.target_pozhan = skill.target_pozhan + skill_subobject["target_account_data"][4]           --子物体会给目标加破绽
					if skill_subobject["self_account_data"][35] > skill.target_number then skill.target_number = skill_subobject["self_account_data"][35] end
					for m1 = 1, 4 do
						skill.mp_use[m1] = skill.mp_use[m1] + math.ceil(skill_subobject["fire_limit"][m1])
					end
					subobject.damage_type[real_per] = skill_subobject["damage_type"]
					subobject.combo[real_per] = skill_subobject["self_account_data"][9]

					--内外功伤害数据

					if subobject.damage_type[real_per] == 0 or subobject.damage_type[real_per] == 1 then
						subobject.attack[real_per] = skill_subobject["damage_skill_external"]
						subobject.ratio[real_per] = skill_subobject["scale_skill_external"]
						subobject.mag_attack[real_per] = skill_subobject["damage_skill_internal"]
						subobject.mag_ratio[real_per] = skill_subobject["scale_skill_internal"]
					end
					--8项属性伤害数据

					subobject.element_damage_type[real_per] = {}
					subobject.element_damage_number[real_per] = {}
					for e_t = 1,8 do
						subobject.element_damage_type[real_per][e_t] = skill_subobject["ext_damage"][e_t]["ext_damage_type"]
						subobject.element_damage_number[real_per][e_t] = skill_subobject["ext_damage"][e_t]["ext_damage_vale"]
					end

					subobject.affect_radius[real_per] = skill_subobject["target_affect_radius"]

					--[[for n = 1, 4 do
						if skill_subobject["states"][n]["state_id"] > 0 then
							skill.target_buff_id[n] = skill_subobject["states"][n]["state_id"]
							skill.target_buff_time[n] = skill_subobject["states"][n]["state_time"]
							skill.target_buff_probability[n] = skill_subobject["states"][n]["state_probability"]
							for s = 1,5 do
								skill.target_buff_param[n][s] = skill_subobject["states"][n]["state_param"][s]
							end
						end
						if skill_subobject["states"][n+4]["state_id"] > 0 then
							skill.self_buff_id[n] = skill_subobject["states"][n+4]["state_id"]
							skill.self_buff_time[n] = skill_subobject["states"][n+4]["state_time"]
							skill.self_buff_probability[n] = skill_subobject["states"][n+4]["state_probability"]
							for s = 1,5 do
								skill.self_buff_param[n][s] = skill_subobject["states"][n+4]["state_param"][s]
							end
						end
					end]]

				end
			end

			--取子物体替换过程段数据

			local skill_rep_process_data = {}
			skill_rep_process_data[per] = GameApi.GetSkillSubObjRepProc(idSkill,skill_essence["process_id"][per],level)
			skill_rep_process = skill_rep_process_data[per]
			if skill_rep_process then
				skill.subobject_type[real_per] = 3
				skill.subobject_id[real_per] = -1    --标记-1表示替换过程段

				--if skill.control_type < 4 then			--0~3表示没有打入控制
					skill.control_type = skill_rep_process["self_account_data"][27]
					skill.control_time = skill_rep_process["self_account_data"][28]
					skill.control_distance = skill_rep_process["self_account_data"][29]
				--end

				skill.target_pozhan = skill.target_pozhan + skill_rep_process["target_account_data"][4]
				if skill_rep_process["self_account_data"][35] > skill.target_number then skill.target_number = skill_rep_process["self_account_data"][35] end
				for m2 = 1, 4 do
					skill.mp_use[m2] = skill.mp_use[m2] + math.ceil(skill_rep_process["fire_limit"][m2])
				end
				subobject.damage_type[real_per] = skill_rep_process["damage_type"]
				subobject.combo[real_per] = skill_rep_process["self_account_data"][9]

					--内外功伤害数据

					if subobject.damage_type[real_per] == 0 or subobject.damage_type[real_per] == 1 then
						subobject.attack[real_per] = skill_rep_process["damage_skill_external"]
						subobject.ratio[real_per] = skill_rep_process["scale_skill_external"]
						subobject.mag_attack[real_per] = skill_rep_process["damage_skill_internal"]
						subobject.mag_ratio[real_per] = skill_rep_process["scale_skill_internal"]
					end
					--8项属性伤害数据

					subobject.element_damage_type[real_per] = {}
					subobject.element_damage_number[real_per] = {}
					for e_t = 1,8 do
						subobject.element_damage_type[real_per][e_t] = skill_rep_process["ext_damage"][e_t]["ext_damage_type"]
						subobject.element_damage_number[real_per][e_t] = skill_rep_process["ext_damage"][e_t]["ext_damage_vale"]
					end

   				subobject.affect_radius[real_per] = skill_rep_process["target_affect_radius"]

				--[[for n = 1, 4 do
					if skill_rep_process["states"][n]["state_id"] > 0 then
						skill.target_buff_id[n] = skill_rep_process["states"][n]["state_id"]
						skill.target_buff_time[n] = skill_rep_process["states"][n]["state_time"]
						skill.target_buff_probability[n] = skill_rep_process["states"][n]["state_probability"]
						for s = 1,5 do
							skill.target_buff_param[n][s] = skill_rep_process["states"][n]["state_param"][s]
						end
					end
					if skill_rep_process["states"][n+4]["state_id"] > 0 then
						skill.self_buff_id[n] = skill_rep_process["states"][n+4]["state_id"]
						skill.self_buff_time[n] = skill_rep_process["states"][n+4]["state_time"]
						skill.self_buff_probability[n] = skill_rep_process["states"][n+4]["state_probability"]
						for s = 1,5 do
							skill.self_buff_param[n][s] = skill_rep_process["states"][n+4]["state_param"][s]
						end
					end
				end]]
			end
		end
		else break end
	end

	for k,v in ipairs(skill.subobject_type) do
		if v == 1 and skill.subtype < 1 then skill.subtype = 1 end
		if v == 2 and skill.subtype < 2 then skill.subtype = 2 end
		if v == 3 then skill.subtype = 3 end
	end
	--计算技能的攻击范围类型skill.attack_range
	--默认值-1表示ERROR
	--技能带判定且同时有子物体时，attack_range只表示技能判定的攻击范围
	--0目标单体 1目标周围 2自身 3直线 4选目标直线 5扇形 6选目标扇形 7自身周围 8选目标区域（包含技能生成子物体的周围）
	--9以子物体为目标的周围 10技能生成子物体的周围（非选目标区域） 11自动目标区域（位移闪躲） 12遥控子物体攻击 13以宠物为目标
	if skill.attack_type ~= 2 and skill.attack_type ~= 21 and skill.attack_type ~= 22 then
		if skill.subtype == 1 then skill.attack_range = 10 end
	end
	if skill.attack_type == 0 or skill.attack_type == 5 or skill.attack_type == 6 then
		if skill.range_type == 0 then skill.attack_range = 0 end
		if skill.range_type == 1 then skill.attack_range = 1 end
		if skill.range_type == 3 or skill.range_type == 10 then skill.attack_range = 4 end
		if skill.range_type == 4 then skill.attack_range = 6 end
		if skill.range_type == 5 or skill.range_type == 9 then skill.attack_range = 7 end
	elseif skill.attack_type == 1 or skill.attack_type == 11 then
		if skill.range_type == 0 or skill.range_type == 2 then skill.attack_range = 2 end
		if skill.range_type == 3 then skill.attack_range = 3 end
		if skill.range_type == 4 then skill.attack_range = 5 end
		if skill.range_type == 5 or skill.range_type == 9 then skill.attack_range = 7 end
	elseif skill.attack_type == 2 or skill.attack_type == 22 then skill.attack_range = 8
	elseif skill.attack_type == 21 then skill.attack_range = 11
	elseif skill.attack_type == 3 then skill.attack_range = 9								--以遥控子物体为目标

	elseif skill.attack_type == 4 then skill.attack_range = 13								--以宠物为目标
	end
	if not skill.isdamage then
		if skill.subtype == 3 then skill.attack_range = 12 end           				--遥控子物体攻击

	end
	return skill, process, subobject
end

----------------------特例处理----------------------
--部分含跳过技能段的技能，只取部分技能段的数据

--返回值：true正常，false表示在TIP忽略该过程段的数据

function CheckIgnoreSkillProcess(id)
	local chk = true
	if IGNORE_SPECIAL_PROCESS then
		local num = table.getn(IGNORE_SPECIAL_PROCESS)
		for i = 1, num do
			if id == IGNORE_SPECIAL_PROCESS[i] then
				chk = false
				break
			end
		end
	end
	return chk
end
----------------------------------------------------

--数字及文本的强调颜色
function GetNumColour(num,color)
	local num_colour = --[[!AUTO_4]]""
	num_colour = string.format(--[[!AUTO_5]]"%s%s%s",COLOUR_NEW_0,num,COLOUR_NEW_0)
	return num_colour
end

--取得：技能图标路径

function GetIcon(idSkill,iconpath,show_type,combo_type)
	local pathid = 0
	--if show_type == 1 or show_type == 5 then
		--姿态技能使用模板中填的图标，其他武学类技能使用“起承转合替续待”的图标
		--for i = 1, table.getn(ZITAI_SKILL_ID) do
		--	if idSkill == ZITAI_SKILL_ID[i] then pathid = iconpath break
		--	else
		--		if combo_type == 0 then pathid = 7 else pathid = combo_type end
		--		pathid = 11182 + pathid
		--	end
		--end
	--else
		pathid = iconpath
	--end
	return GameApi.GetFileNameByID(pathid,SKILL_PATH_MAN)
end

--取得：名字

function GetSkillDesc_Name(name,show_type)
	local name_color = --[[!AUTO_6]]""
	if show_type == 5 then name_color = COLOUR_NEW_2
	elseif show_type == 6 then name_color = COLOUR_NEW_3
	else name_color = COLOUR_NEW_1
	end
	return string.format(--[[!AUTO_7]]"%s%s%s",name_color,name,COLOUR_NEW_0)
end

--（测试文本）取得：id
function GetSkillTestDesc_SkillID(idSkill)
	return string.format(--[[!AUTO_8]]"%s%s%s%s%s",COLOUR_NEW_11,--[[!AUTO_9]]"(",idSkill,--[[!AUTO_10]]")",COLOUR_NEW_0)
end

--取得：等级描述

function GetSkillDesc_Level(level,islearn)
	if level == 0 or islearn == false then return string.format(--[[!AUTO_11]]"%s%s%s",COLOUR_NEW_9,SKILLDESC_NO_LEARN,COLOUR_NEW_0)
	elseif level >= 1 then return string.format(--[[!AUTO_12]]"%s%s%s",COLOUR_NEW_0,string.format(SKILLDESC_SKILL_LEVEL,level),COLOUR_NEW_0)
	else return ERROR_SKILL_LEVEL
	end
end

--取得：门派

function GetSkillDesc_Profession(show_type,profession)
	local showtype_desc = --[[!AUTO_13]]""
	if show_type == 2 then
		showtype_desc = SKILL_SHOWTYPE_DESC[2]
	elseif SKILL_PROFESSION[profession] then
		showtype_desc = string.format(SKILLDESC_PROFESSION_TITLE,string.format(--[[!AUTO_14]]"%s%s%s",COLOUR_NEW_0,SKILL_PROFESSION[profession],COLOUR_NEW_0))
	else showtype_desc = string.format(SKILLDESC_PROFESSION_TITLE,string.format(--[[!AUTO_15]]"%s%s%s",COLOUR_NEW_0,SKILL_PROFESSION[-1],COLOUR_NEW_0)) end
	return showtype_desc
end

--取得：招式类型

function GetSkillDesc_ShowType(show_type,profession,combo_type)
	local showtype_desc = --[[!AUTO_16]]""
	if SKILLPACK_COMBO_TITLE[combo_type] and SKILLPACK_COMBO_TITLE[combo_type] ~= --[[!AUTO_17]]"" then
		showtype_desc = string.format(SKILLDESC_SHOWTYPE_TITLE,string.format(--[[!AUTO_18]]"%s%s%s",COLOUR_NEW_0,SKILLPACK_COMBO_TITLE[combo_type],COLOUR_NEW_0))
	else showtype_desc = ERROR_SKILL_TYPE end
	return showtype_desc
end

--取得：施放类型描述

function GetSkillDesc_PrayType(pray_type,pray_time,cycle_count,charge_time)
	local pray_desc = --[[!AUTO_19]]""
	if SKILL_PRAY_DESC[pray_type] then
		pray_desc = string.format(--[[!AUTO_20]]"%s%s%s",COLOUR_NEW_0,SKILL_PRAY_DESC[pray_type],COLOUR_NEW_0)
		if pray_type == 1 then pray_desc = string.format(pray_desc,pray_time*0.001) end
		if pray_type == 3 or pray_type == 4 then
			if charge_time == 0 then
				pray_desc = string.format(pray_desc,pray_time*0.001)
			else
				pray_desc = string.format(pray_desc,string.format(--[[!AUTO_21]]"%s-%s",pray_time*0.001,(pray_time + charge_time)*0.001))
			end
		end
		if pray_type == 5 then
			if cycle_count == -1 then pray_desc = string.format(--[[!AUTO_22]]"%s%s%s",COLOUR_NEW_0,SKILL_PRAY_DESC[-3],COLOUR_NEW_0)
			else pray_desc = string.format(pray_desc,cycle_count)
			end
		end
		if pray_type == 6 or pray_type == 7 then
			if cycle_count == -1 then pray_desc = string.format(--[[!AUTO_23]]"%s%s%s",COLOUR_NEW_0,SKILL_PRAY_DESC[-2],COLOUR_NEW_0)
			else pray_desc = string.format(pray_desc,cycle_count)
			end
		end
		pray_desc = string.format(SKILLDESC_PRAYTYPE_TITLE,pray_desc)
	else pray_desc = SKILL_PRAY_DESC[-1]
	end
	return pray_desc
end

--取得：连招类型

function GetSkillDesc_ComboType(show_type,combo_type,pray_type)
	local combotype_desc = --[[!AUTO_24]]""
	if show_type == 1 or show_type == 5 then
		if pray_type ~= 9 then
			if SKILL_COMBO_TYPE[combo_type] then
				combotype_desc = string.format(--[[!AUTO_25]]"%s%s%s",COLOUR_NEW_0,SKILL_COMBO_TYPE[combo_type],COLOUR_NEW_0)
			else combotype_desc = SKILL_COMBO_TYPE[-1] end
		end
	end
	return combotype_desc
end

--取得：连招特性

--[[
function GetSkillDesc_ComboSpecific(show_type,combo_specific,pray_type)
	local combo_specific_desc = ""
	if show_type == 1 or show_type == 5 then
		if pray_type ~= 9 then
			if SKILL_COMBO_SPECIFIC[combo_specific] then
				combo_specific_desc = string.format("%s%s%s",COLOUR_NEW_5,SKILL_COMBO_SPECIFIC[combo_specific],COLOUR_NEW_0)
			end
		end
	end
	return combo_specific_desc
end
]]

--（测试文本）取得：技能测试信息title
function GetSkillTestDesc_TestTitle()
	return string.format(--[[!AUTO_26]]"%s%s%s",COLOUR_NEW_11,SKILLDESC_SKILL_TESTDATA,COLOUR_NEW_0)
end

--（测试文本）取得：连击次数

function GetSkillTestDesc_ComboTimes(combo_times)
	return string.format(--[[!AUTO_27]]"%s%s%s",COLOUR_NEW_11,string.format(SKILLDESC_ATTACK_TIMES,combo_times),COLOUR_NEW_0)
end

--（测试文本）取得：影响普攻

function GetSkillTestDesc_AutoType(auto_type)
	if SKILL_AUTO_TYPE[auto_type] then return string.format(--[[!AUTO_28]]"%s%s%s",COLOUR_NEW_11,SKILL_AUTO_TYPE[auto_type],COLOUR_NEW_0)
	else return SKILL_AUTO_TYPE[-1] end
end

--（测试文本）取得：怒气积累
function GetSkillTestDesc_GainRage(gain_rage)
	return string.format(--[[!AUTO_29]]"%s%s%s",COLOUR_NEW_11,string.format(SKILLDESC_GAIN_RAGE,gain_rage),COLOUR_NEW_0)
end

--（测试文本）取得：被闪和挡时的自身破绽增量

function GetSkillTestDesc_SpecialPozhanUp(dodge_pozhan_up,block_pozhan_up)
	local text,text1, text2 = --[[!AUTO_30]]"",--[[!AUTO_31]]"",--[[!AUTO_32]]""
	if dodge_pozhan_up ~= 0 then text1 = string.format(SKILLDESC_POZHANUP_DODGE,string.format(--[[!AUTO_33]]"+%s%s",math.floor(dodge_pozhan_up*10000)*0.01,--[[!AUTO_34]]"%"))	end
	if block_pozhan_up ~= 0 then text2 = string.format(SKILLDESC_POZHANUP_BLOCK,string.format(--[[!AUTO_35]]"+%s",block_pozhan_up)) end
	if text1 ~= --[[!AUTO_36]]"" and text2 ~= --[[!AUTO_37]]"" then text = string.format(--[[!AUTO_38]]"%s%s%s",COLOUR_NEW_11,string.format(--[[!AUTO_39]]"%s%2s%s",text1,--[[!AUTO_40]]"",text2),COLOUR_NEW_0)
	elseif text1 ~= --[[!AUTO_41]]"" or text2 ~= --[[!AUTO_42]]"" then text = string.format(--[[!AUTO_43]]"%s%s%s",COLOUR_NEW_11,string.format(--[[!AUTO_44]]"%s%s",text1,text2),COLOUR_NEW_0)
	end
	return text
end

--（测试文本）取得：延时类型

function GetSkillTestDesc_DelayType(delay_type,delay_time,delay_speed)
	local delaytype_desc = --[[!AUTO_45]]""
	if SKILL_DELAY_TYPE[delay_type] then
		if delay_type == 1 then delaytype_desc = string.format(--[[!AUTO_46]]"%s%s%s",COLOUR_NEW_11,string.format(SKILL_DELAY_TYPE[1],delay_time/1000),COLOUR_NEW_0) end
		if delay_type == 2 then delaytype_desc = string.format(--[[!AUTO_47]]"%s%s%s",COLOUR_NEW_11,string.format(SKILL_DELAY_TYPE[2],delay_speed),COLOUR_NEW_0) end
	else
		delaytype_desc = SKILL_DELAY_TYPE[-1]
	end
	return delaytype_desc
end

--（测试文本）取得：子物体ID
function GetSkillTestDesc_SubObject(subobject_type,subobject_id)
	local subobject_desc = --[[!AUTO_48]]""
	local count = 0
	for k,v in ipairs(subobject_id) do
		if subobject_type[k] == 1 or subobject_type[k] == 2 then
			count = count + 1
			if subobject_desc ~= --[[!AUTO_49]]"" then subobject_desc = string.format(--[[!AUTO_50]]"%s%s\r%s",COLOUR_NEW_11,subobject_desc,string.format(SKILLDESC_SUBOBJECT_DATA,count,v))
			else subobject_desc = string.format(--[[!AUTO_51]]"%s%s",COLOUR_NEW_11,string.format(SKILLDESC_SUBOBJECT_DATA,count,v))
			end
		end
	end
	return subobject_desc
end

--（测试文本）取得：CD数据
function GetSkillTestDesc_CDData(cd_type,cd_time)
	if cd_type > 0 then
		return string.format(--[[!AUTO_52]]"%s%s%s",COLOUR_NEW_11,string.format(SKILLDESC_CD_DATA,cd_time*0.001,cd_type),COLOUR_NEW_0)
	else return --[[!AUTO_53]]"" end
end

--（测试文本）取得：招式时间

function GetSkillTestDesc_SkillTime(skilltime)
	return string.format(--[[!AUTO_54]]"%s%s%s",COLOUR_NEW_11,string.format(SKILLDESC_PROCESS_TIME,skilltime),COLOUR_NEW_0)
end

--（测试文本）取得：强化技能ID
function GetSkillTestDesc_EnhanceId(enhance_skill_id)
	if enhance_skill_id > 0 then return string.format(--[[!AUTO_55]]"%s%s%s",COLOUR_NEW_11,string.format(SKILLDESC_ENHANCEID,enhance_skill_id),COLOUR_NEW_0)
	else return --[[!AUTO_56]]"" end
end

--（测试文本）取得：是否能在轻功中使用
function GetSkillTestDesc_CastInQinggong(cancast_in_qinggong)
	if cancast_in_qinggong then return string.format(--[[!AUTO_57]]"%s%s%s",COLOUR_NEW_11,SKILLDESC_CANCAST_INQINGGONG,COLOUR_NEW_0)
	else return --[[!AUTO_58]]"" end
end

--（测试文本）取得：群攻上限

function GetSkillTestDesc_TargetNumber(target_number)
	if target_number > 1 then
		return string.format(--[[!AUTO_59]]"%s%s%s",COLOUR_NEW_11,string.format(SKILLDESC_TARGET_NUMBER,target_number),COLOUR_NEW_0)
	else return --[[!AUTO_60]]"" end
end

--（测试文本）取得：技能过程信息

function GetSkillTestDesc_ProcessData(process_real_number,process_id,process_name,process_isdodgebreak)
	local process_desc = --[[!AUTO_61]]""
	local isdodgebreak_desc = {}
	if process_real_number < 1 then
		process_desc = ERROR_PROCESS_DATA
	else
		for i = 1, process_real_number do
			if process_isdodgebreak[i] == 1 then isdodgebreak_desc[i] = string.format(--[[!AUTO_62]]"%s%s%s",COLOUR_NEW_6,--[[!AUTO_63]]"(c)",COLOUR_NEW_0) else isdodgebreak_desc[i] = --[[!AUTO_64]]"" end
			if process_desc ~= --[[!AUTO_65]]"" then
				process_desc = string.format(--[[!AUTO_66]]"%s%s%s%s%s%s%s%s",process_desc,--[[!AUTO_67]]"\r",isdodgebreak_desc[i],COLOUR_NEW_11,process_id[i],--[[!AUTO_68]]" ",process_name[i],COLOUR_NEW_0)
			else process_desc = string.format(--[[!AUTO_69]]"%s%s%s%s%s%s",isdodgebreak_desc[i],COLOUR_NEW_11,process_id[i],--[[!AUTO_70]]" ",process_name[i],COLOUR_NEW_0)
			end
		end
	end
	return process_desc
end

--取得：技能攻击类型描述（攻击/祝福/诅咒分类以及范围信息）

function GetSkillDesc_AttackType(subtype,skilltype,attack_type,attack_range,subobject_name,subobject_cast,profession,isPack)     --isPack：是否技能包tip
	local color1 = --[[!AUTO_71]]""
	local color2 = --[[!AUTO_72]]""
	local attack_type_desc = --[[!AUTO_73]]""

	if isPack then
		color1 = COLOUR_NEW_8
		color2 = COLOUR_NEW_8
	else
		color2 = COLOUR_NEW_8
	end

	if skilltype == 3 or skilltype == 4 then attack_type_desc = --[[!AUTO_74]]""		--被动和辅助技能不显示
	elseif skilltype == 5 then attack_type_desc = string.format(--[[!AUTO_75]]"%s%s%s",color2,SKILLDESC_FRIEND_BUFF,COLOUR_NEW_0)
	else
		if subtype == 1 then
			attack_type_desc = string.format(--[[!AUTO_76]]"%s%s%s",color2,subobject_cast,COLOUR_NEW_0)           --子物体显示手写类型描述

		elseif attack_range ~= 12 then
			if attack_range == -1 then
				attack_type_desc = ERROR_SKILL_TYPE
			else
				if SKILL_ATTACK_TYPE[skilltype * 100 + attack_range] and SKILL_ATTACK_TYPE[skilltype * 100 + attack_range] ~= --[[!AUTO_77]]"" then
					attack_type_desc = string.format(--[[!AUTO_78]]"%s%s%s",color2,SKILL_ATTACK_TYPE[skilltype * 100 + attack_range],COLOUR_NEW_0)
					if attack_range == 10 then attack_type_desc = string.format(attack_type_desc,subobject_name) end			--遥控子物体为目标时显示手写子物体名称
				else attack_type_desc = ERROR_SKILL_TYPE
				end
			end
		else
			local prof = math.floor(math.log(profession)/math.log(2))
			attack_type_desc = string.format(--[[!AUTO_79]]"%s%s%s",color2,SKILL_SUBOBJECT_ATTTYPE[skilltype + 1 + prof * 100],COLOUR_NEW_0)
		end
	end
	--if isPack then
	--	attack_type_desc = string.format("%s%s%s",color1,PACKDESC_PERTYPE_TITLE,attack_type_desc)
	--end
	return attack_type_desc
end

--取得：攻击距离/范围
function GetSkillDesc_AttackDistance(skilltype,attack_range,subobject_gen_distance,attack_maxdistance,affect_radius,affect_distance,isarrest)
	local attack_distance_desc = --[[!AUTO_80]]""
	local attdis = 0
	local color = COLOUR_NEW_8

	if skilltype ~= 3 and skilltype ~= 4 then
		--LogPrint(attack_range)
		if attack_range == 0 or attack_range == 1 or attack_range == 4 or attack_range == 6 or attack_range == 8 or attack_range == 13 then
			attdis = attack_maxdistance
		elseif attack_range == 3 then
			attdis = affect_distance
		elseif attack_range == 5 or attack_range == 7 then
			attdis = affect_radius
		elseif attack_range == 10 then
			attdis = subobject_gen_distance
		end
		if attdis < 20 and attdis >= 0 then
			if attdis >= 11 then attack_distance_desc = string.format(--[[!AUTO_81]]"%s%s",color,SKILL_ATTACK_DISTANCE[4])
			elseif attdis >= 7 then attack_distance_desc = string.format(--[[!AUTO_82]]"%s%s",color,SKILL_ATTACK_DISTANCE[3])
			elseif attdis >= 4 then attack_distance_desc = string.format(--[[!AUTO_83]]"%s%s",color,SKILL_ATTACK_DISTANCE[2])
			elseif attdis > 0 then	attack_distance_desc = string.format(--[[!AUTO_84]]"%s%s",color,SKILL_ATTACK_DISTANCE[1])
			--投技
			elseif attdis == 0 and isarrest == 1 then attack_distance_desc = string.format(--[[!AUTO_85]]"%s%s",color,SKILL_ATTACK_DISTANCE[0])
			end
		end
	end

	return attack_distance_desc
end

--取得：技能施放的体力和怒气限制
function GetSkillDesc_MPLimit(skilltype,mp_limit)
	local mp_limit_desc,desc1,desc2 = --[[!AUTO_86]]"",--[[!AUTO_87]]"",--[[!AUTO_88]]"",--[[!AUTO_89]]""
	local color = COLOUR_NEW_8

	if skilltype ~= 3 and skilltype ~= 4 then
		if mp_limit[2] > 0 then desc1 = string.format(--[[!AUTO_90]]"%d%s",math.floor(mp_limit[2]/100),SKILL_MP_NAME[2]) end    --怒气（显示几颗豆）

		if mp_limit[4] > 0 then desc2 = string.format(--[[!AUTO_91]]"%d%s",mp_limit[4],SKILL_MP_NAME[4]) end    --体力
	end
	if desc1 ~= --[[!AUTO_92]]"" and desc2 ~= --[[!AUTO_93]]"" then mp_limit_desc = string.format(--[[!AUTO_94]]"%s%s%2s%s%s",color,desc1,--[[!AUTO_95]]"",desc2,COLOUR_NEW_0)
	elseif desc1 ~= --[[!AUTO_96]]"" or desc2 ~= --[[!AUTO_97]]"" then mp_limit_desc = string.format(--[[!AUTO_98]]"%s%s%s%s",color,desc1,desc2,COLOUR_NEW_0)
	end
	return mp_limit_desc
end

--技能主体描述：招式冷却
function GetSkillDesc_CDTime(skilltype,cd_type,cd_time,isPack)
	local desc = --[[!AUTO_99]]""
	if skilltype ~= 3 and skilltype ~= 4 then
		if cd_time == 0 then
			desc = PACKDESC_CD1_TITLE
		elseif cd_time < 60000 then
			desc = string.format(PACKDESC_CD2_TITLE,cd_time/1000)
		elseif cd_time < 3600000 then
			desc = string.format(PACKDESC_CD3_TITLE,math.floor(cd_time/60000))
		else
			desc = string.format(PACKDESC_CD4_TITLE,math.floor(cd_time/3600000))
		end
	end
	return desc
end

--技能主体描述：内力消耗

function GetSkillDesc_MPUse(skilltype,mp_use,cycle_count)
	local desc = --[[!AUTO_100]]""
	if skilltype ~= 3 and skilltype ~= 4 then
		if mp_use[1] > 0 then
			if cycle_count ~= 0 then
			desc = string.format(PACKDESC_MPUSE_TITLE[1],mp_use[1])
			else desc = string.format(PACKDESC_MPUSE_TITLE[1],mp_use[1])
			end
		elseif mp_use[2] > 0 then
			if cycle_count ~= 0 then
			desc = string.format(PACKDESC_MPUSE_TITLE[2],mp_use[2])
			else desc = string.format(PACKDESC_MPUSE_TITLE[2],mp_use[2])
			end
		--[[elseif mp_use[4] > 0 then
			if cycle_count ~= 0 then
			desc = string.format(PACKDESC_MPUSE_TITLE[4],mp_use[4])
			else desc = string.format(PACKDESC_MPUSE_TITLE[4],mp_use[4])
			end]]
		else
			desc = PACKDESC_NOMPUSE_TITLE
		end
	end
	return desc
end

--技能主体描述：出招限制
function GetSkillDesc_UseLimit(skilltype,attack_mindistance,fight_state_limit,attack_type)
	local desc = --[[!AUTO_101]]""
	if skilltype ~= 3 and skilltype ~= 4 then
		if fight_state_limit > 0 and SKILLDESC_USELIMIT_INFIGHT[fight_state_limit] then
			desc = string.format(--[[!AUTO_102]]"%s%s%s%s",COLOUR_NEW_8,SKILLDESC_USELIMIT_TITLE,COLOUR_NEW_0,SKILLDESC_USELIMIT_INFIGHT[fight_state_limit])
		elseif attack_mindistance > 0 then
			if attack_type == 2 or attack_type == 21 or attack_type == 22 then
				desc = string.format(--[[!AUTO_103]]"%s%s%s%s",COLOUR_NEW_8,SKILLDESC_USELIMIT_TITLE,COLOUR_NEW_0,SKILLDESC_USELIMIT_CLOSEREGION)
			else desc = string.format(--[[!AUTO_104]]"%s%s%s%s",COLOUR_NEW_8,SKILLDESC_USELIMIT_TITLE,COLOUR_NEW_0,SKILLDESC_USELIMIT_CLOSETARGET)
			end
		end
	end
	return desc
end

--技能主体描述：招式位移
function GetSkillDesc_MoveDistance(move_type,move_scale,move_angle,move_max_distance,move_min_distance,attack_type,attack_maxdistance,attack_mindistance)
	local desc = --[[!AUTO_105]]""
	local move_desc = --[[!AUTO_106]]""

	if skilltype ~= 3 and skilltype ~= 4 then
		if move_type == 1 or move_type == 3 then
			if move_max_distance < 0 then
				move_desc = SKILL_MOVE_TYPE[-1]
			elseif attack_type == 3 then move_desc = SKILL_MOVE_TYPE[-1]
			elseif attack_type == 21 then move_desc = SKILL_MOVE_TYPE[0]
			elseif attack_type == 2 or attack_type == 22 then
				--if move_scale*attack_maxdistance <= move_max_distance and move_scale*attack_mindistance >= move_min_distance then
					move_desc = SKILL_MOVE_TYPE[3]
				--else move_desc = SKILL_MOVE_TYPE[0]
				--end
			else
				if move_scale*attack_maxdistance <= move_max_distance and move_scale*attack_mindistance >= move_min_distance then
					if move_scale > 1 then move_desc = SKILL_MOVE_TYPE[2] else move_desc = SKILL_MOVE_TYPE[1] end
				else move_desc = SKILL_MOVE_TYPE[8]
				end
			end
			if move_desc ~= SKILL_MOVE_TYPE[-1] then
				desc = string.format(--[[!AUTO_107]]"%s%s%s%s",COLOUR_NEW_8,SKILLDESC_MOVEDIS_TITLE,COLOUR_NEW_0,string.format(move_desc,GetNumColour(move_max_distance)))
			end
		end
		if move_type == 2 or move_type == 4 then
			if move_max_distance <= 0 then
				move_desc = SKILL_MOVE_TYPE[-1]
			elseif move_angle == 0 then move_desc = SKILL_MOVE_TYPE[4]
			elseif move_angle == 180 then move_desc = SKILL_MOVE_TYPE[5]
			elseif move_angle == 270 then move_desc = SKILL_MOVE_TYPE[6]
			elseif move_angle == 90 then move_desc = SKILL_MOVE_TYPE[7]
			else move_desc = SKILL_MOVE_TYPE[0]
			end
			if move_desc ~= SKILL_MOVE_TYPE[-1] then
				desc = string.format(--[[!AUTO_108]]"%s%s%s%s",COLOUR_NEW_8,SKILLDESC_MOVEDIS_TITLE,COLOUR_NEW_0,string.format(move_desc,GetNumColour(move_max_distance)))
			end
		end
	end
	return desc
end

--技能主体描述：破绽变化
function GetSkillDesc_Pozhan(skilltype,target_pozhan,self_pozhan,cycle_count)
	local desc,self_desc,target_desc = --[[!AUTO_109]]"",--[[!AUTO_110]]"",--[[!AUTO_111]]""
	if skilltype ~= 3 and skilltype ~= 4 then
		if self_pozhan > 0 then
			self_desc = string.format(SKILLDESC_POZHAN_SELF,GetNumColour(string.format(--[[!AUTO_112]]"+%d",self_pozhan)))
		elseif self_pozhan < 0 then
			self_desc = string.format(SKILLDESC_POZHAN_SELF,GetNumColour(self_pozhan))
		end
		if target_pozhan > 0 then
			target_desc = string.format(SKILLDESC_POZHAN_TARGET,GetNumColour(string.format(--[[!AUTO_113]]"+%d",target_pozhan)))
		elseif target_pozhan < 0 then
			target_desc = string.format(SKILLDESC_POZHAN_TARGET,GetNumColour(target_pozhan))
		end
		if self_desc ~= --[[!AUTO_114]]"" and target_desc ~= --[[!AUTO_115]]"" then
			desc = string.format(--[[!AUTO_116]]"%s%2s%s",self_desc,--[[!AUTO_117]]"",target_desc)
		elseif self_desc ~= --[[!AUTO_118]]"" or target_desc ~= --[[!AUTO_119]]"" then
			desc = string.format(--[[!AUTO_120]]"%s%s",self_desc,target_desc)
		end
		if desc ~= --[[!AUTO_121]]"" then
			if cycle_count ~= 0 then
				desc = string.format(--[[!AUTO_122]]"%s%s%s%s",COLOUR_NEW_8,SKILLDESC_POZHAN_TITLE,COLOUR_NEW_0,string.format(--[[!AUTO_123]]"%s%s",SKILLDESC_POZHAN_PERHIT,desc))
			else
				desc = string.format(--[[!AUTO_124]]"%s%s%s%s",COLOUR_NEW_8,SKILLDESC_POZHAN_TITLE,COLOUR_NEW_0,desc)
			end
		end
	end
	return desc
end

--技能主体描述：破绽控制
function GetSkillDesc_PozhanStun(skilltype,control_type,control_distance)
	local stun_type = 0
	local desc = --[[!AUTO_125]]""
	if skilltype ~= 3 and skilltype ~= 4 then
		if control_type ~= 0 then
			if control_type == 4 or control_type == 1 then
				if control_distance > 0 then stun_type = 4
				else stun_type = 1 end
			elseif control_type == 5 or control_type == 2 then
				if control_distance == -1 then stun_type = 6
				elseif control_distance > 0 then stun_type = 5
				else stun_type = 2 end
			elseif control_type == 6 or control_type == 3 then stun_type = 3
			else stun_type = 0
			end
			if SKILL_STUN_TYPE[stun_type] and SKILL_STUN_TYPE[stun_type] ~= --[[!AUTO_126]]"" then
				desc = string.format(--[[!AUTO_127]]"%s%s%s%s",COLOUR_NEW_8,SKILLDESC_POZHANSTUN_TITLE,COLOUR_NEW_0,SKILL_STUN_TYPE[stun_type])
			end
		end
	end
	return desc
end

--技能手写描述

function GetSkillDesc_DetailDesc(idSkill,skill,process,subobject)
	local detail_desc = --[[!AUTO_128]]""
	local is_nodetail = false       --true时显示测试用的技能伤害信息

	if SKILL_DETAIL_DESC_EX[idSkill] then
		detail_desc = SetWildcardText(SKILL_DETAIL_DESC_EX[idSkill],skill,process,subobject)
	elseif SKILL_DETAIL_DESC[idSkill] then
		detail_desc = SetWildcardText(SKILL_DETAIL_DESC[idSkill],skill,process,subobject)
	else
		is_nodetail = true
		--detail_desc = SKILL_DETAIL_DESC[-1]
	end
	return detail_desc,is_nodetail
end

--技能补充描述

function GetSkillDesc_ExtraText(skilltype,charge_isinterrupt,isweak)
	local extra_text = --[[!AUTO_129]]""
	if skilltype ~= 3 and skilltype ~= 4 then
		if charge_isinterrupt > 0 and SKILLDESC_CHARGE_INTERRUPT[charge_isinterrupt] then extra_text = SKILLDESC_CHARGE_INTERRUPT[charge_isinterrupt] end
		if isweak then extra_text = string.format(--[[!AUTO_130]]"%s%s",extra_text,SKILLDESC_IS_WEAK) end
	end
	return extra_text
end

--技能升级效果描述

function GetSkillDesc_LevelupText(idSkill,level)
	local levelup_text = --[[!AUTO_131]]""
	if level >= 1 then
		local skill,process,subobject = GetSkillData(idSkill,level+1)
		if level+1 <= math.min(skill.max_lv,skill.learn_max_lv) then
			if SKILL_LEVELUP_DESC[idSkill] then
				levelup_text = string.format(--[[!AUTO_132]]"%s%s%s%s",COLOUR_NEW_8,LEVELUPDESC_TITLE,COLOUR_NEW_0,SetWildcardText(SKILL_LEVELUP_DESC[idSkill],skill,process,subobject))
			else
				local default_text = --[[!AUTO_133]]""
				local a_num = 0
				for i = 1, skill.process_number do
					if process.type[i] == 1 or process.type[i] == 3 or process.type[i] == 31 or process.type[i] == 4 or process.type[i] == 42 then
						if process.damage_type[i] == 0 or process.damage_type[i] == 1 or skill.subobject_type[i] ~= 0 then
							a_num = a_num + 1
						end
					end
				end
				if a_num == 0 then default_text = SKILL_LEVELUP_DESC[-1]
				elseif a_num == 1 then default_text = SetWildcardText(string.format(LEVELUPDESC_DEFAULT_ONEHIT,--[[!AUTO_134]]"#damage#"),skill,process,subobject)
				else
					local damage_txt = --[[!AUTO_135]]""
					for k = 1, a_num do
						if k == 1 then damage_txt = --[[!AUTO_136]]"#damage#"
						else damage_txt = string.format(--[[!AUTO_137]]"%s%s%s",damage_txt,SKILL_PUNCTRUTION_COMMA,string.format(--[[!AUTO_138]]"#damage%d#",k)) end
					end
					default_text = SetWildcardText(string.format(LEVELUPDESC_DEFAULT_HITS,damage_txt),skill,process,subobject)
				end
				levelup_text = string.format(--[[!AUTO_139]]"%s%s%s%s",COLOUR_NEW_8,LEVELUPDESC_TITLE,COLOUR_NEW_0,default_text)
			end
		end
	end
	return levelup_text
end

--技能第几击描述
function GetSkillDesc_PerHit(is_nodetail,skilltype,pray_type,process_number,damage_type,hit_position,dodge_position,attack,ratio,mag_attack,mag_ratio,element_damage_type,element_damage_number,combo,isattack_qinggong)
	local desc = --[[!AUTO_140]]""
	local a_num = 0      --攻击判定次数

	local perhit_desc = {}
	local damage_desc = {}
	local hitposition_desc = {}
	local isattackqinggong_desc = {}
	local dodgeposition_desc = {}
	--local checkposition_desc = {}

	if skilltype == 0 then
		for k = 1,process_number do
			if damage_type[k] == 0 or damage_type[k] == 1 then
				a_num = a_num + 1
				perhit_desc[a_num] = --[[!AUTO_141]]""
				damage_desc[a_num] = --[[!AUTO_142]]""
				hitposition_desc[a_num] = --[[!AUTO_143]]""
				isattackqinggong_desc[a_num] = --[[!AUTO_144]]""
				dodgeposition_desc[a_num] = --[[!AUTO_145]]""
				--checkposition_desc[a_num] = ""

				if GetSkillPostion({hit_position[1][k],hit_position[2][k],hit_position[3][k],hit_position[4][k]}) ~= --[[!AUTO_146]]"" then
					hitposition_desc[a_num] = string.format(SKILLDESC_HIT_POSITION,GetNumColour(GetSkillPostion({hit_position[1][k],hit_position[2][k],hit_position[3][k],hit_position[4][k]})))
				else
					hitposition_desc[a_num] = SKILLDESC_NO_HITPOSITION
				end
				if isattack_qinggong[k] then isattackqinggong_desc[a_num] = string.format(--[[!AUTO_147]]"\r%2s%s",--[[!AUTO_148]]"",SKILLDESC_ISATTACK_QINGGONG) end
				if GetSkillPostion({dodge_position[1][k],dodge_position[2][k],dodge_position[3][k],dodge_position[4][k]}) ~= --[[!AUTO_149]]"" then
					dodgeposition_desc[a_num] = string.format(SKILLDESC_DODGE_POSITION,GetNumColour(GetSkillPostion({dodge_position[1][k],dodge_position[2][k],dodge_position[3][k],dodge_position[4][k]})))
					dodgeposition_desc[a_num] = string.format(--[[!AUTO_150]]"\r%2s%s",--[[!AUTO_151]]"",dodgeposition_desc[a_num])
				end
				--if GetSkillPostion({check_position[1][k],check_position[2][k],check_position[3][k],check_position[4][k]}) ~= "" then
				--	checkposition_desc[a_num] = string.format(SKILLDESC_CHECK_POSITION,GetNumColour(GetSkillPostion({check_position[1][k],check_position[2][k],check_position[3][k],check_position[4][k]})))
				--	checkposition_desc[a_num] = string.format("\r%2s%s","",checkposition_desc[a_num])
				--end
				if is_nodetail then
					hitposition_desc[a_num] = string.format(--[[!AUTO_152]]"\r%2s%s",--[[!AUTO_153]]"",hitposition_desc[a_num])
					----------------------------------------------------------------------------------
					--测试用伤害文本

					--仅显示该技能段的内外功和属性伤害，不包含子物体伤害
					local sub_combo
					if combo[k] >= 1 then sub_combo = combo[k] else sub_combo = 1 end
					local is_edamage = false
					local phy_a, phy_r, mag_a, mag_r
					local ele_a = {0,0,0,0,0,0,0,0}
					local ele_r = {0,0,0,0,0,0,0,0}
					phy_a = math.floor(attack[k]/sub_combo)
					phy_r = math.floor(ratio[k]/sub_combo*100)
					mag_a = math.floor(mag_attack[k]/sub_combo)
					mag_r = math.floor(mag_ratio[k]/sub_combo*100)
					for e_t = 1, 8 do
						if element_damage_type[k][e_t] == 1 then
							ele_r = math.floor((element_damage_number[k][e_t]/sub_combo)*100)
							is_edamage = true
						end
						if element_damage_type[k][e_t] == 2 then
							ele_a = math.floor(element_damage_number[k][e_t]/sub_combo)
							is_edamage = true
						end
					end

					local desc1,desc2 = --[[!AUTO_154]]"",--[[!AUTO_155]]""		--desc1内外功 desc2附加属性伤害

					local phy_desc = --[[!AUTO_156]]""
					local mag_desc = --[[!AUTO_157]]""
					local etype_desc = --[[!AUTO_158]]""
					local element_desc = {--[[!AUTO_159]]"",--[[!AUTO_160]]"",--[[!AUTO_161]]"",--[[!AUTO_162]]"",--[[!AUTO_163]]"",--[[!AUTO_164]]"",--[[!AUTO_165]]"",--[[!AUTO_166]]""}
					if phy_r > 0 and phy_a > 0 then phy_desc = string.format(--[[!AUTO_167]]"%s%s",GetNumColour(string.format(--[[!AUTO_168]]"%s%s%s%s",phy_r,--[[!AUTO_169]]"%",--[[!AUTO_170]]" + ",phy_a)),SKILL_DAMAGE_TYPE[0])
					elseif phy_r > 0 then phy_desc = string.format(--[[!AUTO_171]]"%s%s",GetNumColour(string.format(--[[!AUTO_172]]"%s%s",phy_r,--[[!AUTO_173]]"%")),SKILL_DAMAGE_TYPE[0])
					elseif phy_a > 0 then phy_desc = string.format(--[[!AUTO_174]]"%s%s",GetNumColour(tostring(phy_a)),SKILL_DAMAGE_TYPE[0])
					end
					if mag_r > 0 and mag_a > 0 then mag_desc = string.format(--[[!AUTO_175]]"%s%s",GetNumColour(string.format(--[[!AUTO_176]]"%s%s%s%s",mag_r,--[[!AUTO_177]]"%",--[[!AUTO_178]]" + ",mag_a)),SKILL_DAMAGE_TYPE[1])
					elseif mag_r > 0 then mag_desc = string.format(--[[!AUTO_179]]"%s%s",GetNumColour(string.format(--[[!AUTO_180]]"%s%s",mag_r,--[[!AUTO_181]]"%")),SKILL_DAMAGE_TYPE[1])
					elseif mag_a > 0 then mag_desc = string.format(--[[!AUTO_182]]"%s%s",GetNumColour(tostring(mag_a)),SKILL_DAMAGE_TYPE[1])
					end
					if phy_desc ~= --[[!AUTO_183]]"" and mag_desc ~= --[[!AUTO_184]]"" then desc1 = string.format(SKILLDESC_DAMAGE_NORTYPE,phy_desc,mag_desc)
					elseif phy_desc ~= --[[!AUTO_185]]"" or mag_desc ~= --[[!AUTO_186]]"" then desc1 = string.format(--[[!AUTO_187]]"%s%s",phy_desc,mag_desc)
					end

					if is_edamage then
						local t_num = 0
						for i = 1, 8 do
							if mag_r[i] > 0 or mag_a[i] > 0 then
								t_num = t_num + 1
								if SKILL_ELEMENT_TYPE[i] then etype_desc = SKILL_ELEMENT_TYPE[i] else etype_desc = SKILL_ELEMENT_TYPE[-1] end
								if mag_r[i] > 0 and mag_a[i] > 0 then
									element_desc[i] = string.format(--[[!AUTO_188]]"%s%s",GetNumColour(string.format(--[[!AUTO_189]]"%s%s%s%s", mag_r[i],--[[!AUTO_190]]"%",--[[!AUTO_191]]" + ", mag_a[i])),etype_desc)
								elseif mag_r[i] > 0 then element_desc[i] = string.format(--[[!AUTO_192]]"%s%s",GetNumColour(string.format(--[[!AUTO_193]]"%s%s", mag_r[i],--[[!AUTO_194]]"%")),etype_desc)
								else element_desc[i] = string.format(--[[!AUTO_195]]"%s%s",GetNumColour(tostring(mag_a[i])),etype_desc)
								end
								if t_num == 1 then desc2 = element_desc[i] else desc2 = string.format(SKILLDESC_DAMAGE_ELETYPE,desc2,element_desc[i]) end
							end
						end
					end

					if desc1 ~= --[[!AUTO_196]]"" and desc2 ~= --[[!AUTO_197]]"" then damage_desc[a_num] = string.format(--[[!AUTO_198]]"%2s%s",--[[!AUTO_199]]"",string.format(SKILLDESC_DAMAGE_TOTAL,desc1,desc2))
					elseif desc1 ~= --[[!AUTO_200]]"" or desc2 ~= --[[!AUTO_201]]"" then damage_desc[a_num] = string.format(--[[!AUTO_202]]"%2s%s",--[[!AUTO_203]]"",string.format(--[[!AUTO_204]]"%s%s",desc1,desc2))
					else damage_desc[a_num] = string.format(--[[!AUTO_205]]"%2s%s",--[[!AUTO_206]]"",SKILLDESC_DAMAGE_NONE)
					end
					----------------------------------------------------------------------------------
				else
					hitposition_desc[a_num] = string.format(--[[!AUTO_207]]"%2s%s",--[[!AUTO_208]]"",hitposition_desc[a_num])
				end
				if pray_type == 5 or pray_type == 6 or pray_type == 7 then
					break
				else
					if a_num >= 1 and a_num <= 10 then
						perhit_desc[a_num] = string.format(--[[!AUTO_209]]"%s%s%s",COLOUR_NEW_5,SKILL_PERHIT_DESC[a_num],COLOUR_NEW_0)
					else perhit_desc[a_num] = string.format(--[[!AUTO_210]]"%s%s%s",COLOUR_NEW_5,SKILL_PERHIT_DESC[0],COLOUR_NEW_0) end
				end
			end
		end
	end
	if a_num > 0 then
		if a_num == 1 then perhit_desc[1] = --[[!AUTO_211]]"" end
		for i = 1, a_num do
			if i == 1 then
				desc = string.format(--[[!AUTO_212]]"%s%s%s%s%s",perhit_desc[i],damage_desc[a_num],hitposition_desc[i],isattackqinggong_desc[i],dodgeposition_desc[i])
			else
				desc = string.format(--[[!AUTO_213]]"%s\r%s%s%s%s%s",desc,perhit_desc[i],damage_desc[a_num],hitposition_desc[i],isattackqinggong_desc[i],dodgeposition_desc[i])
			end
		end
	end
	return desc
end

--技能TIP模式切换描述
function GetSkillDesc_TipChange(mode)
	local desc = --[[!AUTO_214]]""

	if SKILL_TIP_MODE[mode] then
		local str1,str2 = GameApi.GetLogicKeyCombine(114)
		if str1 == --[[!AUTO_215]]"" then	str1 = NO_SETTING_KEYBOARD	end
		local mode_desc = string.format(SKILL_TIP_MODE[mode],str1)
		desc = string.format(--[[!AUTO_216]]"%s%s%s",COLOUR_NEW_11,mode_desc,COLOUR_NEW_0)
	end
	return desc
end

--技能背景描述

function GetSkillDesc_TipRemark(idSkill)
	local desc = --[[!AUTO_217]]""
	if SKILL_TIP_REMARK[idSkill] then
		desc = SKILL_TIP_REMARK[idSkill]
	else
		--desc = SKILL_TIP_REMARK[-1]
	end
	return desc
end

--手写描述的通配符替换

function SetWildcardText(desc,skill,process,subobject)
	----------------------------------------------------------------------------------------------
	--	通配符							说明										显示格式
	----------------------------------------------------------------------------------------------
	--	#a#								判定攻击的次数（循环和连打段算1次）			int
	--	#c#								总连击次数									int
	--	#time#							连打技能和循环技能的单段时间				float，单位：秒

	--	#number#						群攻人数上限								int
	--	#d#								技能总伤害（不含子物体，循环连打段只算1次）	一段伤害文本，格式：“n%+m的内功伤害和n%的火焰伤害”
	--	#combo1# ～ #combo16#			第n次判定的连击次数							int
	--										#combo#会被默认识别为#combo1#
	--	#damage1# ～ #damage16#			第n次判定的伤害（内外功+属性伤害）			一段伤害文本，格式：“n%+m的内功伤害和n%的火焰伤害”

	--										#damage#会被默认识别为#damage1#
	--	#crit1# ～ #crit16#				第n次判定的技能附加暴击率					百分比

	--										#crit#会被默认识别为#crit1#
	--	#sdamage1# ～ #sdamage16#		第n次判定的子物体伤害（内外功+属性伤害）	一段伤害文本，格式：“n%+m的内功伤害和n%的火焰伤害”

	--										#sdamage#会被默认识别为#sdamage1#
	--	#sradius1# ～ #sradius16#		第n次判定的子物体伤害半径					int
	--										#sradius#会被默认识别为#sradius1#
	--	#tbufftime1# ～ #tbufftime4#	目标第1个—第4个BUFF持续时间					float，单位：秒

	--	#sbufftime1# ～ #sbufftime4#	自身第1个—第4个BUFF持续时间					float，单位：秒

	--	#tbuffnum1_1# ～ #tbuffnum4_5#	自身第1个—第4个BUFF状态参数					默认显示整数（后面不加 @f@p），后面加 @f 表示float浮点，后面加 @p 表示percent百分比

	--	#sbuffnum1_1# ～ #sbuffnum4_5#	自身第1个—第4个BUFF状态参数					默认显示整数（后面不加 @f@p），后面加 @f 表示float浮点，后面加 @p 表示percent百分比


	--	#subtbufftime1# ～ #subtbufftime4#	子物体目标第1个—第4个BUFF持续时间					float，单位：秒

	--	#subsbufftime1# ～ #subsbufftime4#	子物体自身第1个—第4个BUFF持续时间					float，单位：秒

	--	#subtbuffnum1_1# ～ #subtbuffnum4_5#	子物体自身第1个—第4个BUFF状态参数					默认显示整数（后面不加 @f@p），后面加 @f 表示float浮点，后面加 @p 表示percent百分比

	--	#subsbuffnum1_1# ～ #subsbuffnum4_5#	子物体自身第1个—第4个BUFF状态参数					默认显示整数（后面不加 @f@p），后面加 @f 表示float浮点，后面加 @p 表示percent百分比

	----------------------------------------------------------------------------------------------
	--注：
	--1. 伤害文本中，内外功和属性伤害的数值是已经除以当前技能段的连击数之后的数；

	--2. 属性伤害显示根据类型，倍率显示百分比，点数显示点数，属性伤害同样会除以连击数；
	--3. 技能段如果带子物体判定（或带子物体替换过程段），也认为该技能段带判定。

	if desc and desc ~= --[[!AUTO_218]]"" then
		local n,m
		local find_combo, find_damage, find_crit
		local find_sdamage, find_sradius
		local find_tbufftime, find_sbufftime
		local find_tbuffnum, find_sbuffnum, find_tbuffnum_f, find_sbuffnum_f, find_tbuffnum_p, find_sbuffnum_p
		local player_data = GameApi.GetPlayerFullProp(0)        --player_data.phy_attack：外功攻击力（属性伤害会折算成外功攻击力的百分比）

		local a_num = 0      --判定次数计数
		--att_data：整理后的判定数据

		local att_data = {
			--技能段自身判定
			is_self_att = {},
			combo = {},
			crit = {},				--百分比

			dtype = {},				--0外功1内攻-1无伤害判定时的标识

			--内外功伤害

			attack = {},
			ratio = {},
			mag_attack = {},
			mag_ratio = {},
			is_edamage = {},
			element_damage_a = {},
			element_damage_r = {},
			--子物体判定

			is_sub_att = {},
			sub_radius = {},
			sub_dtype = {},			--0外功1内攻-1无伤害判定时的标识

			--内外功伤害

			sub_attack = {},
			sub_ratio = {},
			sub_mag_attack = {},
			sub_mag_ratio = {},
			sub_is_edamage = {},
			sub_element_damage_a = {},
			sub_element_damage_r = {},
		}
		local totaldamage = {
			phy_r = 0,		--判定的外功总伤害

			phy_a = 0,
			mag_r = 0,		--判定的内功总伤害

			mag_a = 0,
			element_r = {0,0,0,0,0,0,0,0},	--判定的属性总伤害倍率 1冰 2火 3毒 4土

			element_a = {0,0,0,0,0,0,0,0},	--判定的属性总伤害点数

		}
		for i = 1, skill.process_number do
			if process.type[i] == 1 or process.type[i] == 3 or process.type[i] == 31 or process.type[i] == 4 or process.type[i] == 42 then
				if process.damage_type[i] == 0 or process.damage_type[i] == 1 or skill.subobject_type[i] ~= 0 then
					a_num = a_num + 1
					att_data.is_self_att[a_num] = false
					att_data.is_sub_att[a_num] = false
				end

				--技能段自身判定
				if process.damage_type[i] == 0 or process.damage_type[i] == 1 then
					att_data.is_self_att[a_num] = true

					att_data.combo[a_num] = process.combo[i]
					att_data.crit[a_num] = process.crit_rate[i]
					att_data.dtype[a_num] = process.damage_type[i]

					local sub_combo
					if process.combo[i] >= 1 then sub_combo = process.combo[i] else sub_combo = 1 end
					att_data.attack[a_num] = math.floor(process.attack[i] / sub_combo)
					att_data.ratio[a_num] = math.floor((process.ratio[i]/sub_combo)*100)
					att_data.mag_attack[a_num] = math.floor(process.mag_attack[i] / sub_combo)
					att_data.mag_ratio[a_num] = math.floor((process.mag_ratio[i]/sub_combo)*100)

					att_data.element_damage_a[a_num] = {0,0,0,0,0,0,0,0}
					att_data.element_damage_r[a_num] = {0,0,0,0,0,0,0,0}
					att_data.is_edamage[a_num] = false
					for e_t = 5,5 do
						if process.element_damage_type[i][e_t] == 1 then
							att_data.element_damage_r[a_num][e_t] = math.floor((process.element_damage_number[i][e_t]/sub_combo)*100)
							att_data.is_edamage[a_num] = true
						end
						if process.element_damage_type[i][e_t] == 2 then
							att_data.element_damage_a[a_num][e_t] = math.floor(process.element_damage_number[i][e_t] / sub_combo)
							att_data.is_edamage[a_num] = true
						end
					end

					--统计总伤害：
					if att_data.dtype[a_num] == 0 or att_data.dtype[a_num] == 1 then
						totaldamage.phy_r = totaldamage.phy_r + process.ratio[i]*100
						totaldamage.phy_a = totaldamage.phy_a + process.attack[i]
						totaldamage.mag_r = totaldamage.mag_r + process.mag_ratio[i]*100
						totaldamage.mag_a = totaldamage.mag_a + process.mag_attack[i]
					end
					for e_n = 1, 8 do
						if process.element_damage_type[i][e_n] == 1 then
							totaldamage.element_r[e_n] = totaldamage.element_r[e_n] + process.element_damage_number[i][e_n]*100
						end
						if process.element_damage_type[i][e_n] == 2 then
							totaldamage.element_a[e_n] = totaldamage.element_a[e_n] + process.element_damage_number[i][e_n]
						end
					end
				end

				--子物体判定

				if skill.subobject_type[i] ~= 0 then
					att_data.is_sub_att[a_num] = true

					att_data.sub_radius[a_num] = subobject.affect_radius[i]
					att_data.sub_dtype[a_num] = subobject.damage_type[i]
					local sub_combo
					if subobject.combo[i] >= 1 then sub_combo = subobject.combo[i] else sub_combo = 1 end
					att_data.sub_attack[a_num] = math.floor(subobject.attack[i] / sub_combo)
					att_data.sub_ratio[a_num] = math.floor((subobject.ratio[i]/sub_combo)*100)
					att_data.sub_mag_attack[a_num] = math.floor(subobject.mag_attack[i] / sub_combo)
					att_data.sub_mag_ratio[a_num] = math.floor((subobject.mag_ratio[i]/sub_combo)*100)

					att_data.sub_element_damage_a[a_num] = {0,0,0,0,0,0,0,0}
					att_data.sub_element_damage_r[a_num] = {0,0,0,0,0,0,0,0}
					att_data.sub_is_edamage[a_num] = false
					for e_t = 5, 5 do
						if subobject.element_damage_type[i][e_t] == 1 then
							att_data.sub_element_damage_r[a_num][e_t] = math.floor((subobject.element_damage_number[i][e_t]/sub_combo)*100)
							att_data.sub_is_edamage[a_num] = true
						end
						if subobject.element_damage_type[i][e_t] == 2 then
							att_data.sub_element_damage_a[a_num][e_t] = math.floor(subobject.element_damage_number[i][e_t] / sub_combo)
							att_data.sub_is_edamage[a_num] = true
						end
					end
				end

			end
		end

		--通配符默认处理

		n,m = string.find(desc,--[[!AUTO_219]]"#combo#")
		if n and m then desc = string.gsub(desc,--[[!AUTO_220]]"#combo#",--[[!AUTO_221]]"#combo1#") end
		n,m = string.find(desc,--[[!AUTO_222]]"#damage#")
		if n and m then desc = string.gsub(desc,--[[!AUTO_223]]"#damage#",--[[!AUTO_224]]"#damage1#") end
		n,m = string.find(desc,--[[!AUTO_225]]"#crit#")
		if n and m then desc = string.gsub(desc,--[[!AUTO_226]]"#crit#",--[[!AUTO_227]]"#crit1#") end
		n,m = string.find(desc,--[[!AUTO_228]]"#sdamage#")
		if n and m then desc = string.gsub(desc,--[[!AUTO_229]]"#sdamage#",--[[!AUTO_230]]"#sdamage1#") end
		n,m = string.find(desc,--[[!AUTO_231]]"#sradius#")
		if n and m then desc = string.gsub(desc,--[[!AUTO_232]]"#sradius#",--[[!AUTO_233]]"#sradius1#") end

--------------------------------------------------------
		--替换通配符--
		n,m = string.find(desc,--[[!AUTO_234]]"#d#")
		if n and m then
			local total_damage_desc = --[[!AUTO_235]]""
			local desc1,desc2 = --[[!AUTO_236]]"",--[[!AUTO_237]]""		--desc1内外功 desc2附加属性伤害

			local phy_desc = --[[!AUTO_238]]""
			local mag_desc = --[[!AUTO_239]]""
			local etype_desc = --[[!AUTO_240]]""
			local element_desc = {--[[!AUTO_241]]"",--[[!AUTO_242]]"",--[[!AUTO_243]]"",--[[!AUTO_244]]"",--[[!AUTO_245]]"",--[[!AUTO_246]]"",--[[!AUTO_247]]"",--[[!AUTO_248]]""}
			if math.floor(totaldamage.phy_r) > 0 and math.floor(totaldamage.phy_a) > 0 then phy_desc = string.format(--[[!AUTO_249]]"%s%s",GetNumColour(string.format(--[[!AUTO_250]]"%s%s%s%s",math.floor(totaldamage.phy_r),--[[!AUTO_251]]"%%",--[[!AUTO_252]]" + ",math.floor(totaldamage.phy_a))),SKILL_DAMAGE_TYPE[0])
			elseif math.floor(totaldamage.phy_r) > 0 then phy_desc = string.format(--[[!AUTO_253]]"%s%s",GetNumColour(string.format(--[[!AUTO_254]]"%s%s",math.floor(totaldamage.phy_r),--[[!AUTO_255]]"%%")),SKILL_DAMAGE_TYPE[0])
			elseif math.floor(totaldamage.phy_a) > 0 then phy_desc = string.format(--[[!AUTO_256]]"%s%s",GetNumColour(tostring(math.floor(totaldamage.phy_a))),SKILL_DAMAGE_TYPE[0])
			end
			if math.floor(totaldamage.mag_r) > 0 and math.floor(totaldamage.mag_a) > 0 then mag_desc = string.format(--[[!AUTO_257]]"%s%s",GetNumColour(string.format(--[[!AUTO_258]]"%s%s%s%s",math.floor(totaldamage.mag_r),--[[!AUTO_259]]"%%",--[[!AUTO_260]]" + ",math.floor(totaldamage.mag_a))),SKILL_DAMAGE_TYPE[1])
			elseif math.floor(totaldamage.mag_r) > 0 then mag_desc = string.format(--[[!AUTO_261]]"%s%s",GetNumColour(string.format(--[[!AUTO_262]]"%s%s",math.floor(totaldamage.mag_r),--[[!AUTO_263]]"%%")),SKILL_DAMAGE_TYPE[1])
			elseif math.floor(totaldamage.mag_a) > 0 then mag_desc = string.format(--[[!AUTO_264]]"%s%s",GetNumColour(tostring(math.floor(totaldamage.mag_a))),SKILL_DAMAGE_TYPE[1])
			end
			if phy_desc ~= --[[!AUTO_265]]"" and mag_desc ~= --[[!AUTO_266]]"" then desc1 = string.format(SKILLDESC_DAMAGE_NORTYPE,phy_desc,mag_desc)
			elseif phy_desc ~= --[[!AUTO_267]]"" or mag_desc ~= --[[!AUTO_268]]"" then desc1 = string.format(--[[!AUTO_269]]"%s%s",phy_desc,mag_desc)
			end

			local t_num = 0
			for i = 1, 8 do
				if math.floor(totaldamage.element_r[i]) > 0 or math.floor(totaldamage.element_a[i]) > 0 then
					t_num = t_num + 1
					if SKILL_ELEMENT_TYPE[i] then etype_desc = SKILL_ELEMENT_TYPE[i] else etype_desc = SKILL_ELEMENT_TYPE[-1] end
					if math.floor(totaldamage.element_r[i]) > 0 and math.floor(totaldamage.element_a[i]) > 0 then
						element_desc[i] = string.format(--[[!AUTO_270]]"%s%s",GetNumColour(string.format(--[[!AUTO_271]]"%s%s%s%s", math.floor(totaldamage.element_r[i]),--[[!AUTO_272]]"%%",--[[!AUTO_273]]" + ", math.floor(totaldamage.element_a[i]))),etype_desc)
					elseif math.floor(totaldamage.element_r[i]) > 0 then element_desc[i] = string.format(--[[!AUTO_274]]"%s%s",GetNumColour(string.format(--[[!AUTO_275]]"%s%s", math.floor(totaldamage.element_r[i]),--[[!AUTO_276]]"%%")),etype_desc)
					else element_desc[i] = string.format(--[[!AUTO_277]]"%s%s",GetNumColour(tostring(math.floor(totaldamage.element_a[i]))),etype_desc)
					end
					if t_num == 1 then desc2 = element_desc[i] else desc2 = string.format(SKILLDESC_DAMAGE_ELETYPE,desc2,element_desc[i]) end
				end
			end

			if desc1 ~= --[[!AUTO_278]]"" and desc2 ~= --[[!AUTO_279]]"" then total_damage_desc = string.format(SKILLDESC_DAMAGE_TOTAL,desc1,desc2)
			elseif desc1 ~= --[[!AUTO_280]]"" or desc2 ~= --[[!AUTO_281]]"" then total_damage_desc = string.format(--[[!AUTO_282]]"%s%s",desc1,desc2)
			else total_damage_desc = SKILLDESC_DAMAGE_NONE
			end
			desc = string.gsub(desc,--[[!AUTO_283]]"#d#",total_damage_desc)
		end

--------------------------------------------------------
		n,m = string.find(desc,--[[!AUTO_284]]"#a#")
		if n and m then
			desc = string.gsub(desc,--[[!AUTO_285]]"#a#",GetNumColour(a_num))
		end
		n,m = string.find(desc,--[[!AUTO_286]]"#c#")
		if n and m then
			desc = string.gsub(desc,--[[!AUTO_287]]"#c#",GetNumColour(skill.combo_times))
		end
		n,m = string.find(desc,--[[!AUTO_288]]"#time#")
		if n and m then
			desc = string.gsub(desc,--[[!AUTO_289]]"#time#",GetNumColour(skill.cycle_time*0.001))
		end
		n,m = string.find(desc,--[[!AUTO_290]]"#number#")
		if n and m then
			desc = string.gsub(desc,--[[!AUTO_291]]"#number#",GetNumColour(skill.target_number))
		end

		for buff_num = 1, 4 do
			find_tbufftime = string.format(--[[!AUTO_292]]"#tbufftime%d#",buff_num)
			n,m = string.find(desc,find_tbufftime)
			if n and m then
				desc = string.gsub(desc,find_tbufftime,GetNumColour(skill.target_buff_time[buff_num]*0.001))
			end
			find_sbufftime = string.format(--[[!AUTO_293]]"#sbufftime%d#",buff_num)
			n,m = string.find(desc,find_sbufftime)
			if n and m then
				desc = string.gsub(desc,find_sbufftime,GetNumColour(skill.self_buff_time[buff_num]*0.001))
			end

			for p = 1,5 do
				find_tbuffnum_f = string.format(--[[!AUTO_294]]"#tbuffnum%d_%d#@f",buff_num,p)
				n,m = string.find(desc,find_tbuffnum_f)
				if n and m then
					desc = string.gsub(desc,find_tbuffnum_f,GetNumColour(skill.target_buff_param[buff_num][p]))
				end
				find_sbuffnum_f = string.format(--[[!AUTO_295]]"#sbuffnum%d_%d#@f",buff_num,p)
				n,m = string.find(desc,find_sbuffnum_f)
				if n and m then
					desc = string.gsub(desc,find_sbuffnum_f,GetNumColour(skill.self_buff_param[buff_num][p]))
				end

				find_tbuffnum_p = string.format(--[[!AUTO_296]]"#tbuffnum%d_%d#@p",buff_num,p)
				n,m = string.find(desc,find_tbuffnum_p)
				if n and m then
					desc = string.gsub(desc,find_tbuffnum_p,GetNumColour(string.format(--[[!AUTO_297]]"%s%s",skill.target_buff_param[buff_num][p]*100,--[[!AUTO_298]]"%%")))
				end
				find_sbuffnum_p = string.format(--[[!AUTO_299]]"#sbuffnum%d_%d#@p",buff_num,p)
				n,m = string.find(desc,find_sbuffnum_p)
				if n and m then
					desc = string.gsub(desc,find_sbuffnum_p,GetNumColour(string.format(--[[!AUTO_300]]"%s%s",skill.self_buff_param[buff_num][p]*100,--[[!AUTO_301]]"%%")))
				end
			end

			for q = 1,5 do
				find_tbuffnum = string.format(--[[!AUTO_302]]"#tbuffnum%d_%d#",buff_num,q)
				n,m = string.find(desc,find_tbuffnum)
				if n and m then
					desc = string.gsub(desc,find_tbuffnum,GetNumColour(math.ceil(skill.target_buff_param[buff_num][q])))
				end
				find_sbuffnum = string.format(--[[!AUTO_303]]"#sbuffnum%d_%d#",buff_num,q)
				n,m = string.find(desc,find_sbuffnum)
				if n and m then
					desc = string.gsub(desc,find_sbuffnum,GetNumColour(math.ceil(skill.self_buff_param[buff_num][q])))
				end
			end
		end

		if a_num >= 1 then
			for k = 1, a_num do
				if att_data.is_self_att[k] then
					find_combo = string.format(--[[!AUTO_304]]"#combo%d#",k)
					n,m = string.find(desc,find_combo)
					if n and m then
						desc = string.gsub(desc,find_combo,GetNumColour(att_data.combo[k]))
					end
					find_crit = string.format(--[[!AUTO_305]]"#crit%d#",k)
					n,m = string.find(desc,find_crit)
					if n and m then
						desc = string.gsub(desc,find_crit,GetNumColour(att_data.crit[k]))
					end
----------------------------------------------------------------------------
					find_damage = string.format(--[[!AUTO_306]]"#damage%d#",k)
					n,m = string.find(desc,find_damage)
					if n and m then
						local total_damage_desc = --[[!AUTO_307]]""
						local desc1,desc2 = --[[!AUTO_308]]"",--[[!AUTO_309]]""		--desc1内外功 desc2附加属性伤害

						local phy_desc = --[[!AUTO_310]]""
						local mag_desc = --[[!AUTO_311]]""
						local etype_desc = --[[!AUTO_312]]""
						local element_desc = {--[[!AUTO_313]]"",--[[!AUTO_314]]"",--[[!AUTO_315]]"",--[[!AUTO_316]]"",--[[!AUTO_317]]"",--[[!AUTO_318]]"",--[[!AUTO_319]]"",--[[!AUTO_320]]""}
						if att_data.ratio[k] > 0 and att_data.attack[k] > 0 then phy_desc = string.format(--[[!AUTO_321]]"%s%s",GetNumColour(string.format(--[[!AUTO_322]]"%s%s%s%s",att_data.ratio[k],--[[!AUTO_323]]"%%",--[[!AUTO_324]]" + ",att_data.attack[k])),SKILL_DAMAGE_TYPE[0])
						elseif att_data.ratio[k] > 0 then phy_desc = string.format(--[[!AUTO_325]]"%s%s",GetNumColour(string.format(--[[!AUTO_326]]"%s%s",att_data.ratio[k],--[[!AUTO_327]]"%%")),SKILL_DAMAGE_TYPE[0])
						elseif att_data.attack[k] > 0 then phy_desc = string.format(--[[!AUTO_328]]"%s%s",GetNumColour(tostring(att_data.attack[k])),SKILL_DAMAGE_TYPE[0])
						end
						if att_data.mag_ratio[k] > 0 and att_data.mag_attack[k] > 0 then mag_desc = string.format(--[[!AUTO_329]]"%s%s",GetNumColour(string.format(--[[!AUTO_330]]"%s%s%s%s",att_data.mag_ratio[k],--[[!AUTO_331]]"%%",--[[!AUTO_332]]" + ",att_data.mag_attack[k])),SKILL_DAMAGE_TYPE[1])
						elseif att_data.mag_ratio[k] > 0 then mag_desc = string.format(--[[!AUTO_333]]"%s%s",GetNumColour(string.format(--[[!AUTO_334]]"%s%s",att_data.mag_ratio[k],--[[!AUTO_335]]"%%")),SKILL_DAMAGE_TYPE[1])
						elseif att_data.mag_attack[k] > 0 then mag_desc = string.format(--[[!AUTO_336]]"%s%s",GetNumColour(tostring(att_data.mag_attack[k])),SKILL_DAMAGE_TYPE[1])
						end
						if phy_desc ~= --[[!AUTO_337]]"" and mag_desc ~= --[[!AUTO_338]]"" then desc1 = string.format(SKILLDESC_DAMAGE_NORTYPE,phy_desc,mag_desc)
						elseif phy_desc ~= --[[!AUTO_339]]"" or mag_desc ~= --[[!AUTO_340]]"" then desc1 = string.format(--[[!AUTO_341]]"%s%s",phy_desc,mag_desc)
						end

						if att_data.is_edamage[k] then
							local t_num = 0
							for i = 1, 8 do
								if att_data.element_damage_r[k][i] > 0 or att_data.element_damage_a[k][i] > 0 then
									t_num = t_num + 1
									if SKILL_ELEMENT_TYPE[i] then etype_desc = SKILL_ELEMENT_TYPE[i] else etype_desc = SKILL_ELEMENT_TYPE[-1] end
									if att_data.element_damage_r[k][i] > 0 and att_data.element_damage_a[k][i] > 0 then
										element_desc[i] = string.format(--[[!AUTO_342]]"%s%s",GetNumColour(string.format(--[[!AUTO_343]]"%s%s%s%s", att_data.element_damage_r[k][i],--[[!AUTO_344]]"%%",--[[!AUTO_345]]" + ", att_data.element_damage_a[k][i])),etype_desc)
									elseif att_data.element_damage_r[k][i] > 0 then element_desc[i] = string.format(--[[!AUTO_346]]"%s%s",GetNumColour(string.format(--[[!AUTO_347]]"%s%s", att_data.element_damage_r[k][i],--[[!AUTO_348]]"%%")),etype_desc)
									else element_desc[i] = string.format(--[[!AUTO_349]]"%s%s",GetNumColour(tostring(att_data.element_damage_a[k][i])),etype_desc)
									end
									if t_num == 1 then desc2 = element_desc[i] else desc2 = string.format(SKILLDESC_DAMAGE_ELETYPE,desc2,element_desc[i]) end
								end
							end
						end

						if desc1 ~= --[[!AUTO_350]]"" and desc2 ~= --[[!AUTO_351]]"" then total_damage_desc = string.format(SKILLDESC_DAMAGE_TOTAL,desc1,desc2)
						elseif desc1 ~= --[[!AUTO_352]]"" or desc2 ~= --[[!AUTO_353]]"" then total_damage_desc = string.format(--[[!AUTO_354]]"%s%s",desc1,desc2)
						else total_damage_desc = SKILLDESC_DAMAGE_NONE
						end

						desc = string.gsub(desc,find_damage,total_damage_desc)
					end
----------------------------------------------------------------------------
				end
				if att_data.is_sub_att[k] then
----------------------------------------------------------------------------
					find_sdamage = string.format(--[[!AUTO_355]]"#sdamage%d#",k)
					n,m = string.find(desc,find_sdamage)
					if n and m then
						local total_damage_desc = --[[!AUTO_356]]""
						local desc1,desc2 = --[[!AUTO_357]]"",--[[!AUTO_358]]""		--desc1内外功 desc2附加属性伤害

						local phy_desc = --[[!AUTO_359]]""
						local mag_desc = --[[!AUTO_360]]""
						local etype_desc = --[[!AUTO_361]]""
						local element_desc = {--[[!AUTO_362]]"",--[[!AUTO_363]]"",--[[!AUTO_364]]"",--[[!AUTO_365]]"",--[[!AUTO_366]]"",--[[!AUTO_367]]"",--[[!AUTO_368]]"",--[[!AUTO_369]]""}
						if att_data.sub_ratio[k] > 0 and att_data.sub_attack[k] > 0 then phy_desc = string.format(--[[!AUTO_370]]"%s%s",GetNumColour(string.format(--[[!AUTO_371]]"%s%s%s%s",att_data.sub_ratio[k],--[[!AUTO_372]]"%%",--[[!AUTO_373]]" + ",att_data.sub_attack[k])),SKILL_DAMAGE_TYPE[0])
						elseif att_data.sub_ratio[k] > 0 then phy_desc = string.format(--[[!AUTO_374]]"%s%s",GetNumColour(string.format(--[[!AUTO_375]]"%s%s",att_data.sub_ratio[k],--[[!AUTO_376]]"%%")),SKILL_DAMAGE_TYPE[0])
						elseif att_data.sub_attack[k] > 0 then phy_desc = string.format(--[[!AUTO_377]]"%s%s",GetNumColour(tostring(att_data.sub_attack[k])),SKILL_DAMAGE_TYPE[0])
						end
						if att_data.sub_mag_ratio[k] > 0 and att_data.sub_mag_attack[k] > 0 then mag_desc = string.format(--[[!AUTO_378]]"%s%s",GetNumColour(string.format(--[[!AUTO_379]]"%s%s%s%s",att_data.sub_mag_ratio[k],--[[!AUTO_380]]"%%",--[[!AUTO_381]]" + ",att_data.sub_mag_attack[k])),SKILL_DAMAGE_TYPE[1])
						elseif att_data.sub_mag_ratio[k] > 0 then mag_desc = string.format(--[[!AUTO_382]]"%s%s",GetNumColour(string.format(--[[!AUTO_383]]"%s%s",att_data.sub_mag_ratio[k],--[[!AUTO_384]]"%%")),SKILL_DAMAGE_TYPE[1])
						elseif att_data.sub_mag_attack[k] > 0 then mag_desc = string.format(--[[!AUTO_385]]"%s%s",GetNumColour(tostring(att_data.sub_mag_attack[k])),SKILL_DAMAGE_TYPE[1])
						end
						if phy_desc ~= --[[!AUTO_386]]"" and mag_desc ~= --[[!AUTO_387]]"" then desc1 = string.format(SKILLDESC_DAMAGE_NORTYPE,phy_desc,mag_desc)
						elseif phy_desc ~= --[[!AUTO_388]]"" or mag_desc ~= --[[!AUTO_389]]"" then desc1 = string.format(--[[!AUTO_390]]"%s%s",phy_desc,mag_desc)
						end

						if att_data.sub_is_edamage[k] then
							local t_num = 0
							for i = 1, 8 do
								if att_data.sub_element_damage_r[k][i] > 0 or att_data.sub_element_damage_a[k][i] > 0 then
									t_num = t_num + 1
									if SKILL_ELEMENT_TYPE[i] then etype_desc = SKILL_ELEMENT_TYPE[i] else etype_desc = SKILL_ELEMENT_TYPE[-1] end
									if att_data.sub_element_damage_r[k][i] > 0 and att_data.sub_element_damage_a[k][i] > 0 then
										element_desc[i] = string.format(--[[!AUTO_391]]"%s%s",GetNumColour(string.format(--[[!AUTO_392]]"%s%s%s%s", att_data.sub_element_damage_r[k][i],--[[!AUTO_393]]"%%",--[[!AUTO_394]]" + ", att_data.sub_element_damage_a[k][i])),etype_desc)
									elseif att_data.sub_element_damage_r[k][i] > 0 then element_desc[i] = string.format(--[[!AUTO_395]]"%s%s",GetNumColour(string.format(--[[!AUTO_396]]"%s%s", att_data.sub_element_damage_r[k][i],--[[!AUTO_397]]"%%")),etype_desc)
									else element_desc[i] = string.format(--[[!AUTO_398]]"%s%s",GetNumColour(tostring(att_data.sub_element_damage_a[k][i])),etype_desc)
									end
									if t_num == 1 then desc2 = element_desc[i] else desc2 = string.format(SKILLDESC_DAMAGE_ELETYPE,desc2,element_desc[i]) end
								end
							end
						end

						if desc1 ~= --[[!AUTO_399]]"" and desc2 ~= --[[!AUTO_400]]"" then total_damage_desc = string.format(SKILLDESC_DAMAGE_TOTAL,desc1,desc2)
						elseif desc1 ~= --[[!AUTO_401]]"" or desc2 ~= --[[!AUTO_402]]"" then total_damage_desc = string.format(--[[!AUTO_403]]"%s%s",desc1,desc2)
						else total_damage_desc = SKILLDESC_DAMAGE_NONE
						end

						desc = string.gsub(desc,find_sdamage,total_damage_desc)
					end
----------------------------------------------------------------------------
					find_sradius = string.format(--[[!AUTO_404]]"#sradius%d#",k)
					n,m = string.find(desc,find_sradius)
					if n and m then
						desc = string.gsub(desc,find_sradius,GetNumColour(att_data.sub_radius[k]))
					end
				end

			end
		end
		return desc
	else return --[[!AUTO_405]]""
	end
end

--方位信息
function GetSkillPostion(tab)						--tab=(x,x,x,x)，x为0或1
	local desc = --[[!AUTO_406]]""
	local sum = 0
	for i = 1,4 do
		if tab[i] == 1 then
			if desc == --[[!AUTO_407]]"" then desc = SKILL_POSITION_TYPE[i]
			else desc = string.format(--[[!AUTO_408]]"%s%2s%s",desc,--[[!AUTO_409]]"",SKILL_POSITION_TYPE[i]) end
			sum = sum + 1
		end
	end
	if sum == 4 then desc = SKILL_POSITION_TYPE[0] end
	return desc
end

--星级，技能暂时不用

function GetTipstar(idSkill,level)
	return --[[!AUTO_410]]"-1_0"
end

--取得技能特性文本

--t_mode=0 技能TIP特性简单，t_mode=1 技能TIP特性详细




--isPack 是否技能包Tip
function GetSkillSpecificDesc(idSkill,skill,process,subobject,t_mode,isPack)
	local skill_specfic_desc = --[[!AUTO_411]]""
	-----------------------------------------------
	----生成技能特性表----
	local SkillSpecific = {}    --技能特性表，用字符表示
	if skill.isarrest then
		table.insert(SkillSpecific,--[[!AUTO_412]]"SPEC_ARREST")
	end
	if skill.ismovable_perform then
		table.insert(SkillSpecific,--[[!AUTO_413]]"SPEC_MOVABLE")
	end

	local isspec_tab = {}
	local c_mask = {}
	for per = 1, skill.process_number do
		if process.element_damage_type[per] == 1 then isspec_tab[1] = 1 end
		if process.element_damage_type[per] == 2 then isspec_tab[2] = 1 end
		if process.element_damage_type[per] == 3 then isspec_tab[3] = 1 end
		if skill.push_distance >= 5 then isspec_tab[5] = 1 end
		c_mask[per] = process.check_type[per]
		if c_mask[per] > 0 then
			if c_mask[per] >=8 then c_mask[per] = c_mask[per] - 8 end
			if c_mask[per] >=4 then
				c_mask[per] = c_mask[per] - 4
				if skill.control_type == 4 and skill.control_distance == 0 then isspec_tab[13] = 1 end
				if skill.control_type == 5 and skill.control_distance == 0 then isspec_tab[14] = 1 end
				if skill.control_type == 6 then isspec_tab[15] = 1 end
				if skill.control_type == 4 and skill.control_distance > 0 then isspec_tab[19] = 1 end
				if skill.control_type == 5 and skill.control_distance > 0  then isspec_tab[20] = 1 end
				if skill.control_type == 5 and skill.control_distance == -1 then isspec_tab[21] = 1 end
			end
			if skill.control_type > 0 then
				if c_mask[per] >=2 then isspec_tab[12] = 1 else isspec_tab[11] = 1	end
			end
		end
		if process.move_type[per] == 2 or process.move_type[per] == 4 then
			if process.move_max_distance[per] > 4 and process.damage_type[per] < 2 then
				isspec_tab[18] = 1
			end
		end
	end
	if isspec_tab[18] == 1 then table.insert(SkillSpecific,--[[!AUTO_414]]"SPEC_PIERCE") end
	if isspec_tab[5] == 1 then table.insert(SkillSpecific,--[[!AUTO_415]]"SPEC_PUSHFAR") end
	if isspec_tab[1] == 1 then table.insert(SkillSpecific,--[[!AUTO_416]]"SPEC_ELEMENTDAMAGE_1") end
	if isspec_tab[2] == 1 then table.insert(SkillSpecific,--[[!AUTO_417]]"SPEC_ELEMENTDAMAGE_2") end
	if isspec_tab[3] == 1 then table.insert(SkillSpecific,--[[!AUTO_418]]"SPEC_ELEMENTDAMAGE_3") end
	if isspec_tab[11] == 1 then table.insert(SkillSpecific,--[[!AUTO_419]]"SPEC_COUNTERUP_1") end
	if isspec_tab[12] == 1 then table.insert(SkillSpecific,--[[!AUTO_420]]"SPEC_COUNTERUP_2") end
	if isspec_tab[13] == 1 then table.insert(SkillSpecific,--[[!AUTO_421]]"SPEC_COUNTERUP_3") end
	if isspec_tab[14] == 1 then table.insert(SkillSpecific,--[[!AUTO_422]]"SPEC_COUNTERUP_4") end
	if isspec_tab[15] == 1 then table.insert(SkillSpecific,--[[!AUTO_423]]"SPEC_COUNTERUP_5") end
	if isspec_tab[19] == 1 then table.insert(SkillSpecific,--[[!AUTO_424]]"SPEC_COUNTERUP_6") end
	if isspec_tab[20] == 1 then table.insert(SkillSpecific,--[[!AUTO_425]]"SPEC_COUNTERUP_7") end
	if isspec_tab[21] == 1 then table.insert(SkillSpecific,--[[!AUTO_426]]"SPEC_COUNTERUP_8") end

	-----------------------------------------------
	----往表内插入特殊技能自带的特性----
	local Skill_SelfSpecific = {}	--定义部分技能无法通过模板参数判断的特殊特性




	Skill_SelfSpecific[0] = {--[[!AUTO_427]]"SPEC_CRASH",--[[!AUTO_428]]"SPEC_SPLIT"}   --0号技能自带特性，测试用（勿删）





	--结尾--
	if Skill_SelfSpecific[idSkill] then
		for self_specnum = 1, table.getn(Skill_SelfSpecific[idSkill]) do
			table.insert(SkillSpecific,Skill_SelfSpecific[idSkill][self_specnum])
		end
	end
	-----------------------------------------------
	----拼成显示文本----
	--简单描述只罗列特性名，详细描述需要列出特性描述文本




	if table.getn(SkillSpecific) > 0 then
		for n = 1, table.getn(SkillSpecific) do
			if isPack then
				if n == 1 then
					skill_specfic_desc = string.format(--[[!AUTO_429]]"%s%s", COLOUR_NEW_5,SKILLSPEC_NAME[SkillSpecific[n]])
				else
					skill_specfic_desc = string.format(--[[!AUTO_430]]"%s%s%s",skill_specfic_desc,--[[!AUTO_431]]" ",string.format(--[[!AUTO_432]]"%s%s", COLOUR_NEW_5,SKILLSPEC_NAME[SkillSpecific[n]]))
				end
			else
				if t_mode == 1 then
					skill_specfic_desc = string.format(--[[!AUTO_433]]"%s%s%s",skill_specfic_desc,--[[!AUTO_434]]"\r",string.format(--[[!AUTO_435]]"%2s%s%s%s%s%s",--[[!AUTO_436]]"",COLOUR_NEW_5,SKILLSPEC_NAME[SkillSpecific[n]],COLOUR_NEW_0,--[[!AUTO_437]]" ",GetSkillSpecificData(SkillSpecific[n],skill,process,subobject)))
				else
					if skill_specfic_desc == --[[!AUTO_438]]"" then
						skill_specfic_desc = string.format(--[[!AUTO_439]]"%2s%s",--[[!AUTO_440]]"",string.format(--[[!AUTO_441]]"%s%s", COLOUR_NEW_5,SKILLSPEC_NAME[SkillSpecific[n]]))
					else skill_specfic_desc = string.format(--[[!AUTO_442]]"%s%s%s",skill_specfic_desc,--[[!AUTO_443]]" ",string.format(--[[!AUTO_444]]"%s%s", COLOUR_NEW_5,SKILLSPEC_NAME[SkillSpecific[n]]))
					end
				end
			end
		end
		if isPack then
			skill_specfic_desc = string.format(--[[!AUTO_445]]"%s%s%s%s",COLOUR_NEW_8,PACKDESC_SPEC_TITLE,COLOUR_NEW_0,skill_specfic_desc)
		else
			if t_mode == 0 then
				skill_specfic_desc = string.format(--[[!AUTO_446]]"%s%s",string.format(--[[!AUTO_447]]"%s%s%s", COLOUR_NEW_7, SKILLSPEC_TITLE,--[[!AUTO_448]]""),skill_specfic_desc)
			else
				skill_specfic_desc = string.format(--[[!AUTO_449]]"%s%s",string.format(--[[!AUTO_450]]"%s%s", COLOUR_NEW_7, SKILLSPEC_TITLE),skill_specfic_desc)
			end
		end
	end
	return skill_specfic_desc
end

--往单个特性描述文本中插入参数
function GetSkillSpecificData(spec_string,skill,process,subobject)
	local spec_desc = --[[!AUTO_451]]""
	spec_desc = SKILLSPEC_DESC[spec_string]
	--SPEC_ELEMENTDAMAGE_1    冰寒
	--SPEC_ELEMENTDAMAGE_2    灼烧
	--SPEC_ELEMENTDAMAGE_3    腐毒
	--SPEC_COUNTERUP_6    压制（震飞）
	--SPEC_COUNTERUP_7    压制（击退）


	local elementdamage = 0
	if spec_string == --[[!AUTO_452]]"SPEC_ELEMENTDAMAGE_1" then
		for per = 1, skill.process_number do
			if process.element_damage_type[per] == 1 then
				elementdamage = elementdamage + process.element_damage_number[per]
			end
		end
		spec_desc = string.format(spec_desc, GetNumColour(string.format(--[[!AUTO_453]]"%d%s",elementdamage*100,--[[!AUTO_454]]"%")))
	end
	if spec_string == --[[!AUTO_455]]"SPEC_ELEMENTDAMAGE_2" then
		for per = 1, skill.process_number do
			if process.element_damage_type[per] == 2 then
				elementdamage = elementdamage + process.element_damage_number[per]
			end
		end
		spec_desc = string.format(spec_desc, GetNumColour(string.format(--[[!AUTO_456]]"%d%s",elementdamage*100,--[[!AUTO_457]]"%")))
	end
	if spec_string == --[[!AUTO_458]]"SPEC_ELEMENTDAMAGE_3" then
		for per = 1, skill.process_number do
			if process.element_damage_type[per] == 3 then
				elementdamage = elementdamage + process.element_damage_number[per]
			end
		end
		spec_desc = string.format(spec_desc, GetNumColour(string.format(--[[!AUTO_459]]"%d%s",elementdamage*100,--[[!AUTO_460]]"%")))
	end
	if spec_string == --[[!AUTO_461]]"SPEC_COUNTERUP_6" or spec_string == --[[!AUTO_462]]"SPEC_COUNTERUP_7" then
		spec_desc = string.format(spec_desc, GetNumColour(skill.control_distance))
	end

	return spec_desc
end

---------------------------技能TIP显示函数-----------------------------
function SkillTip:GetSkillTipAsVector(idSkill,level,mode)
	----------------------宠物用技能描述




	local skill_essence = GameApi.GetSkillEssence(idSkill,level)
	if skill_essence["display_ref"] == 8 or skill_essence["display_ref"] == 4 then
		return SkillTip:GetPetSkillTip(idSkill,level,mode)
	end

	----------------------人物用技能描述
	local skill,process,subobject = GetSkillData(idSkill,level)
	mode = 1 - mode       --默认显示mode 1

	--islearn：记录该技能是否学会的标识
	local islearn
	if level <= 1 then
		local now_skill_data = GameApi.GetSkillTable()
		if now_skill_data[idSkill] then islearn = true else islearn = false end
	else islearn = true
	end

	-->>Tip是否显示测试信息<< false不显示，true显示
	local isTestMode = false
	if TestShowItemId and TestShowItemId == 1 then
		isTestMode = true
	end

	--名称
	local tiptitle = --[[!AUTO_463]]""
	if isTestMode and mode == 1 then
		tiptitle = string.format(--[[!AUTO_464]]"%s%s",GetSkillDesc_Name(skill.name,skill.show_type),GetSkillTestDesc_SkillID(idSkill))
	else
		tiptitle = GetSkillDesc_Name(skill.name,skill.show_type)
	end

	--图标
	local tipicon = GetIcon(idSkill,skill.iconpath,skill.show_type,skill.combo_type)
	local tipinf01 = --[[!AUTO_465]]""
	local icon_type = --[[!AUTO_466]]"0"

	--技能等级 类型 出招
	if skill_essence["display_ref"] == 7 then
		icon_type = --[[!AUTO_467]]"1"
		local skilldesc_level = string.format(--[[!AUTO_468]]"%s%s%s",COLOUR_NEW_0,string.format(MIJI_LEVEL_DESC,level),COLOUR_NEW_0)
		local skilldesc_profession = GetSkillDesc_Profession(skill.show_type,skill.profession)
		local skilldesc_showtype = GetSkillDesc_ShowType(skill.show_type,skill.profession,skill.combo_type)
		local skilldesc_praytype = GetSkillDesc_PrayType(skill.pray_type,skill.pray_time,skill.cycle_count,skill.charge_time)
		local skillDesc_mpuse = GetSkillDesc_MPUse(skill.show_type,skill.mp_use,skill.cycle_count)

		local skilldesc_level_nocolor = string.gsub(skilldesc_level,--[[!AUTO_469]]"%^[%dA-Fa-f][%dA-Fa-f][%dA-Fa-f][%dA-Fa-f][%dA-Fa-f][%dA-Fa-f]",--[[!AUTO_470]]"")
		local skillDesc_mpuse_nocolor = string.gsub(skillDesc_mpuse,--[[!AUTO_471]]"%^[%dA-Fa-f][%dA-Fa-f][%dA-Fa-f][%dA-Fa-f][%dA-Fa-f][%dA-Fa-f]",--[[!AUTO_472]]"")
		number_count_1 = select(2,string.gsub(skilldesc_level_nocolor,--[[!AUTO_473]]"[%d-]",--[[!AUTO_474]]""))
		number_count_2 = select(2,string.gsub(skillDesc_mpuse_nocolor,--[[!AUTO_475]]"[%d-]",--[[!AUTO_476]]""))
		for i = 1,32-(string.len(skilldesc_level_nocolor)+string.len(skillDesc_mpuse_nocolor))-number_count_1-number_count_2 do
			skillDesc_mpuse = --[[!AUTO_477]]" " .. skillDesc_mpuse
		end
		local is_active = SkillApi.IsMijiActiveByID(idSkill)

		local weight_desc = string.format(MIJI_WEIGHT_POINT,skill_essence["sutra_activate_weight"])
		if is_active == true then
			tipinf01 = string.format(--[[!AUTO_478]]"%s%s\r%s\r\r%s%s",skilldesc_level,skillDesc_mpuse,weight_desc,COLOUR_NEW_6,MIJI_ACTIVE_STATE[1])
		else
			tipinf01 = string.format(--[[!AUTO_479]]"%s%s\r%s\r\r%s%s",skilldesc_level,skillDesc_mpuse,weight_desc,COLOUR_NEW_9,MIJI_ACTIVE_STATE[0])
		end
	else
		local skilldesc_level = GetSkillDesc_Level(level,islearn)
		local skilldesc_profession = GetSkillDesc_Profession(skill.show_type,skill.profession)
		local skilldesc_showtype = GetSkillDesc_ShowType(skill.show_type,skill.profession,skill.combo_type)
		local skilldesc_praytype = GetSkillDesc_PrayType(skill.pray_type,skill.pray_time,skill.cycle_count,skill.charge_time)
		local skillDesc_mpuse = GetSkillDesc_MPUse(skill.show_type,skill.mp_use,skill.cycle_count)

		local skilldesc_level_nocolor = string.gsub(skilldesc_level,--[[!AUTO_480]]"%^[%dA-Fa-f][%dA-Fa-f][%dA-Fa-f][%dA-Fa-f][%dA-Fa-f][%dA-Fa-f]",--[[!AUTO_481]]"")
		local skillDesc_mpuse_nocolor = string.gsub(skillDesc_mpuse,--[[!AUTO_482]]"%^[%dA-Fa-f][%dA-Fa-f][%dA-Fa-f][%dA-Fa-f][%dA-Fa-f][%dA-Fa-f]",--[[!AUTO_483]]"")
		number_count_1 = select(2,string.gsub(skilldesc_level_nocolor,--[[!AUTO_484]]"[%d-]",--[[!AUTO_485]]""))
		number_count_2 = select(2,string.gsub(skillDesc_mpuse_nocolor,--[[!AUTO_486]]"[%d-]",--[[!AUTO_487]]""))
		for i = 1,32-(string.len(skilldesc_level_nocolor)+string.len(skillDesc_mpuse_nocolor))-number_count_1-number_count_2 do
			skillDesc_mpuse = --[[!AUTO_488]]" " .. skillDesc_mpuse
		end
		tipinf01 = string.format(--[[!AUTO_489]]"%s\r%s%s\r%s",skilldesc_profession,skilldesc_level,skillDesc_mpuse,skilldesc_praytype)
	end
	--连招类型
	--local tipinf02 = GetSkillDesc_ComboType(skill.show_type,skill.combo_type,skill.pray_type)
	local tipinf02 = --[[!AUTO_490]]""
	local tipinf03 = --[[!AUTO_491]]""

	--星级，技能暂时不用



	local tipstar = GetTipstar(idSkill,level)

	--攻击类型
	local tiplimitleft = --[[!AUTO_492]]""
	--2013.1.4 临时改成多技能的技能包不显示第x式，且只显示第一个技能的文字描述（当前多技能的技能包中，每个技能的文字描述都是一样的）；技能攻击类型改成强制显示
	--if mode == 1 then
		--tiplimitleft = GetSkillDesc_AttackType(skill.subtype,skill.type,skill.attack_type,skill.attack_range,skill.subobject_name,skill.subobject_cast,skill.profession,false)
	--end
	--距离限制/怒气 体力限制
	local tiplimitright = --[[!AUTO_493]]""
	--2013.1.4 临时改成多技能的技能包不显示第x式，且只显示第一个技能的文字描述（当前多技能的技能包中，每个技能的文字描述都是一样的）；技能攻击类型改成强制显示
	--if mode == 1 then
		local mp_limit_desc = GetSkillDesc_MPLimit(skill.type,skill.mp_limit)
		local attack_distance_desc = GetSkillDesc_AttackDistance(skill.type,skill.attack_range,skill.subobject_gen_distance,skill.attack_maxdistance,skill.affect_radius,skill.affect_distance,skill.isarrest)
		if mp_limit_desc ~= --[[!AUTO_494]]"" and attack_distance_desc ~= --[[!AUTO_495]]"" then
			tiplimitright = string.format(--[[!AUTO_496]]"%s%s%s",attack_distance_desc,SKILL_PUNCTRUTION_COMMA,mp_limit_desc)
		elseif mp2_limit_desc ~= --[[!AUTO_497]]"" or attack_distance_desc ~= --[[!AUTO_498]]"" then
			tiplimitright = string.format(--[[!AUTO_499]]"%s%s",attack_distance_desc,mp_limit_desc)
		end
		tiplimitright = --[[!AUTO_500]]""
	--end

	--（测试信息）
	--技能特性（暂时隐藏）




	--主体描述
	local tiplimitskill = --[[!AUTO_501]]""
	local tiplimitskill_1, tiplimitskill_2 = --[[!AUTO_502]]"",--[[!AUTO_503]]""
	if isTestMode and mode == 1 then
		tiplimitskill_1 = GetSkillTestDesc_TestTitle()
		local test_data = {
			GetSkillTestDesc_EnhanceId(skill.enhance_skill_id),
			GetSkillTestDesc_CastInQinggong(skill.cancast_in_qinggong),
			GetSkillTestDesc_GainRage(skill.gain_rage),
			GetSkillTestDesc_ComboTimes(skill.combo_times),
			GetSkillTestDesc_AutoType(skill.auto_type),
			GetSkillTestDesc_CDData(skill.cd_type,skill.cd_time),
			GetSkillTestDesc_DelayType(skill.delay_type,skill.delay_time,skill.delay_speed),
			GetSkillTestDesc_SubObject(skill.subobject_type,skill.subobject_id),
			GetSkillTestDesc_SkillTime(skill.time),
			GetSkillTestDesc_TargetNumber(skill.target_number),
			GetSkillTestDesc_SpecialPozhanUp(skill.dodge_pozhan_up,skill.block_pozhan_up),
			GetSkillTestDesc_ProcessData(skill.process_real_number,skill.process_id,skill.process_name,skill.process_isdodgebreak),
		}
		for i = 1, table.getn(test_data) do
			if test_data[i] ~= --[[!AUTO_504]]"" then
				if i == 1 or i == 3 or i == 5 or i == 7 or i == 8 or i == 9 or i == 11 or i == 12 then
					tiplimitskill_1 = string.format(--[[!AUTO_505]]"%s\r%s",tiplimitskill_1,test_data[i])
				else tiplimitskill_1 = string.format(--[[!AUTO_506]]"%s%3s%s",tiplimitskill_1,--[[!AUTO_507]]"",test_data[i])
				end
			end
		end
	end
	--[[
	if GetSkillSpecificDesc(idSkill,skill,process,subobject,mode,false) ~= "" then
		if tiplimitskill_1 ~= "" then
			tiplimitskill_1 = string.format("%s\r%s",tiplimitskill_1,GetSkillSpecificDesc(idSkill,skill,process,subobject,mode,false))
		else tiplimitskill_1 = GetSkillSpecificDesc(idSkill,skill,process,subobject,mode,false)
		end
	end
	]]
	local list_num = 0
	if mode == 1 then
		local main_data = {
				GetSkillDesc_CDTime(skill.type,skill.cd_type,skill.cd_time,false),
				GetSkillDesc_MPUse(skill.type,skill.mp_use,skill.cycle_count),
				GetSkillDesc_UseLimit(skill.type,skill.attack_mindistance,skill.fight_state_limit,skill.attack_type),
				GetSkillDesc_MoveDistance(skill.move_type,skill.move_scale,skill.move_angle,skill.move_max_distance,skill.move_min_distance,skill.attack_type,skill.attack_maxdistance,skill.attack_mindistance),
				GetSkillDesc_Pozhan(skill.type,skill.target_pozhan,skill.self_pozhan,skill.cycle_count),
				GetSkillDesc_PozhanStun(skill.type,skill.control_type,skill.control_distance),
		}
		for i = 1, table.getn(main_data) do
			if main_data[i] ~= --[[!AUTO_508]]"" then
				list_num = list_num + 1
				if list_num == 1 then
					tiplimitskill_2 = main_data[i]
				else tiplimitskill_2 = string.format(--[[!AUTO_509]]"%s\r%s",tiplimitskill_2,main_data[i])
				end
			end
		end
	end
	if tiplimitskill_1 ~= --[[!AUTO_510]]"" then tiplimitskill = string.format(--[[!AUTO_511]]"%s\r%s",tiplimitskill_1,tiplimitskill_2) else tiplimitskill = tiplimitskill_2 end
	tiplimitskill = --[[!AUTO_512]]""

	--手写描述/每击描述/切换描述
	local tipstrengthen = --[[!AUTO_513]]""
	local detail_desc,is_nodetail = GetSkillDesc_DetailDesc(idSkill,skill,process,subobject)
	tipstrengthen = detail_desc
	if mode == 1 then
		--2013.1.4 临时改成多技能的技能包不显示第x式，且只显示第一个技能的文字描述（当前多技能的技能包中，每个技能的文字描述都是一样的）；技能攻击类型改成强制显示
		--[[
		if GetSkillDesc_ExtraText(skill.type,skill.charge_isinterrupt,skill.isweak) ~= "" then
			--if string.len(detail_desc) <= 64 then
				tipstrengthen = string.format("%s%s",tipstrengthen,GetSkillDesc_ExtraText(skill.type,skill.charge_isinterrupt,skill.isweak))
			--else tipstrengthen = string.format("%s\r%s",tipstrengthen,GetSkillDesc_ExtraText(skill.type,skill.charge_isinterrupt,skill.isweak))
			--end
		end
		]]
		if isTestMode then
			if GetSkillDesc_PerHit(is_nodetail,skill.type,skill.pray_type,skill.process_number,process.damage_type,process.hit_position,process.dodge_position,process.attack,process.ratio,process.mag_attack,process.mag_ratio,process.element_damage_type,process.element_damage_number,process.combo,process.isattack_qinggong) ~= --[[!AUTO_514]]"" then
				if detail_desc ~= --[[!AUTO_515]]"" then
					tipstrengthen = string.format(--[[!AUTO_516]]"%s\r%s",tipstrengthen,GetSkillDesc_PerHit(is_nodetail,skill.type,skill.pray_type,skill.process_number,process.damage_type,process.hit_position,process.dodge_position,process.attack,process.ratio,process.mag_attack,process.mag_ratio,process.element_damage_type,process.element_damage_number,process.combo,process.isattack_qinggong))
				else tipstrengthen = GetSkillDesc_PerHit(is_nodetail,skill.type,skill.pray_type,skill.process_number,process.damage_type,process.hit_position,process.dodge_position,process.attack,process.ratio,process.mag_attack,process.mag_ratio,process.element_damage_type,process.element_damage_number,process.combo,process.isattack_qinggong)
				end
			end
		end
	end

	--升级效果描述
	local tipdesc = --[[!AUTO_517]]""
	if mode == 1 then
		--tipdesc = GetSkillDesc_LevelupText(idSkill,level)
	end

	--背景描述
	local tipremark = --[[!AUTO_518]]""
	if skill_essence["display_ref"] ~= 7 then
		if GetSkillDesc_TipRemark(idSkill) ~= --[[!AUTO_519]]"" then
			tipremark = GetSkillDesc_TipRemark(idSkill)
		else
			tipremark = GetSkillDesc_TipChange(mode)
		end
	end

	local tiplabmoney = --[[!AUTO_520]]""
	local tipmoney1 = --[[!AUTO_521]]""
	local tipmoney2 = --[[!AUTO_522]]""
	local tipmoney3 = --[[!AUTO_523]]""
	local tipmoney4 = --[[!AUTO_524]]""
	local tiplabfame = --[[!AUTO_525]]""
	local tipfame = --[[!AUTO_526]]""
	local tiplabexchange = --[[!AUTO_527]]""
	local tipexchange = --[[!AUTO_528]]""
	local tipexchangepic = --[[!AUTO_529]]""
	local tiplabxcash = --[[!AUTO_530]]""
	local tipgold1 = --[[!AUTO_531]]""
	local tipgold2 = --[[!AUTO_532]]""

	local skill_desctip = {}
	skill_desctip["icontype"] = icon_type
	skill_desctip["title"] = tiptitle
	skill_desctip["icon"] = tipicon
	skill_desctip["info1"] = tipinf01
	skill_desctip["info2"] = tipinf02
	skill_desctip["info3"] = tipinf03
	skill_desctip["star"] = tipstar
	skill_desctip["limitleft"] = tiplimitleft
	skill_desctip["limitright"] = tiplimitright
	skill_desctip["limitskill"] = tiplimitskill
	skill_desctip["desc"] = tipdesc
	skill_desctip["strengthen"] = tipstrengthen
	skill_desctip["remark"] = tipremark

	return skill_desctip
end



------------------------------------------------------------------------------------------------------------------
----------------------------------------------技能包TIP描述用函数-------------------------------------------------
------------------------------------------------------------------------------------------------------------------

--取得并整理技能包TIP的引用数据



function GetSkillPackData(idPack)
	local pack = {}
	pack.name = --[[!AUTO_533]]""
	pack.iconpath = 0
	pack.type = 0
	pack.profession = 0
	pack.number = 0
	pack.skill_id = {}
	pack.skill_lv = {}
	pack.skill = {}
	pack.process = {}
	pack.subobject = {}
	pack.ui_skill = {0,0,0,0}

	local packinfo = {}
	local skill_level = GameApi.GetSkillTable(true)
	--SkillApi.GetSkillLevel()
	if idPack <= 1000 then --规定id不足1000的为自创连招（官方技能包id最小值为1601）


		local user_pack = GameApi.GetUserSkillPackInfo(idPack)
		packinfo["name"] = user_pack["pack_name"]
		packinfo["file_icon"] = user_pack["pack_icon"]
		packinfo["type"] = -1   --自创连招的技能包类型为-1
		packinfo["prof_limit_mask"] = 0   --自创连招取到的职业类型为nil，此处强行设成0
		packinfo["id_skills"] = {}
		for pro = 1,table.getn(user_pack["skill_array"]) do
			 packinfo["id_skills"][pro] = user_pack["skill_array"][pro]
		end
	elseif idPack > 1073741824 then			--400xxxxx(16进制)为界面连招的索引。转成2进制后，最后4位为索引（Q技能为0，E技能为1……依次类推），往前16位为武学ID。


		local user_pack = GameApi.GetUserSkillPackInfo(idPack)
		packinfo["name"] = --[[!AUTO_534]]""
		packinfo["file_icon"] = 0
		packinfo["type"] = -2  		 --界面连招的技能包类型为-2
		packinfo["prof_limit_mask"] = 0
		packinfo["id_skills"] = {}
		for pro = 1,4 do    	--界面连招的特别处理，肯定为4招，且起承转合任一格为空时，技能id和lv为0
			packinfo["id_skills"][pro] = user_pack["skill_array"][pro]
		end
	else
		packinfo = GameApi.GetSkillPack(idPack)
	end

	if packinfo["type"] == -2 then			--界面连招的特别处理，肯定为4招，且起承转合任一格为空时，技能id和lv为0
		local num = ((idPack/16)-math.floor(idPack/16))*16
		if num == 0 then pack.name = SKILLPACK_LEFT_NAME
		elseif num == 1 then pack.name = SKILLPACK_RIGHT_NAME
		end
		pack.type = packinfo["type"]
		pack.number = 0
		for i = 1, 4 do
			if packinfo["id_skills"][i] > 0 then
				local p_skill,p_process,p_subobject
				pack.number = pack.number + 1
				table.insert(pack.skill_id,packinfo["id_skills"][i])
				if skill_level[packinfo["id_skills"][i]] then
					pack.ui_skill[i] = 1
					p_skill,p_process,p_subobject = GetSkillData(packinfo["id_skills"][i],skill_level[packinfo["id_skills"][i]])
					table.insert(pack.skill,p_skill)
					table.insert(pack.process,p_process)
					table.insert(pack.subobject,p_subobject)
					table.insert(pack.skill_lv,SkillApi.GetSkillLevelByID(packinfo["id_skills"][i]))
					LogPrint(--[[!AUTO_535]]"skill_id:")
					LogPrint(--[[!AUTO_536]]"skill_level:" .. SkillApi.GetSkillLevelByID(packinfo["id_skills"][i]))
					if pack.number == 1 then
						pack.iconpath = pack.skill[pack.number]["iconpath"]
						pack.profession = pack.skill[pack.number]["profession"]
					end
				else
					p_skill,p_process,p_subobject = GetSkillData(packinfo["id_skills"][i],0)
					table.insert(pack.skill,p_skill)
					table.insert(pack.process,p_process)
					table.insert(pack.subobject,p_subobject)
					table.insert(pack.skill_lv,0)
				end
			end
		end
	else
		pack.name = packinfo["name"]
		pack.iconpath = packinfo["file_icon"]
		pack.type = packinfo["type"]
		pack.profession = packinfo["prof_limit_mask"]
		pack.number = table.getn(packinfo["id_skills"])

		for i = 1, pack.number do
			pack.skill_id[i] = packinfo["id_skills"][i]
			if skill_level[packinfo["id_skills"][i]] then
				pack.skill[i],pack.process[i],pack.subobject[i] = GetSkillData(packinfo["id_skills"][i],skill_level[packinfo["id_skills"][i]])
				pack.skill_lv[i] = SkillApi.GetSkillLevelByID(packinfo["id_skills"][i])
			else
				pack.skill[i],pack.process[i],pack.subobject[i] = GetSkillData(packinfo["id_skills"][i],0)
				pack.skill_lv[i] = 0
			end
		end
	end
	return pack
end

--取得：技能包名字
function GetSkillPackDesc_Name(name,packtype)
	local name_color = --[[!AUTO_537]]""
	if packtype == 2 then name_color = COLOUR_NEW_3
	elseif packtype == 1 then name_color = COLOUR_NEW_2
	elseif packtype == -1 then name_color = COLOUR_NEW_0
	elseif packtype == -2 then name_color = COLOUR_NEW_1
	else name_color = COLOUR_NEW_1
	end
	return string.format(--[[!AUTO_538]]"%s%s%s",name_color,name,COLOUR_NEW_0)
end

--取得：技能包中第一个技能的等级
function GetSkillPackDesc_FirstSkillLv(number,judge_type,skill_lv,skill_id)
	local first_lv = 0
	if number > 0 then
		first_lv = skill_lv[1]
		--islearn：记录该技能是否学会的标识
		if first_lv == 0 then return string.format(--[[!AUTO_539]]"%s%s%s",COLOUR_NEW_9,SKILLDESC_NO_LEARN,COLOUR_NEW_0)
		elseif first_lv >= 1 then
			local equip_add = SkillApi.GetSkillAddOnLevelByID(skill_id[1])
			if equip_add > 0 then
				first_lv = string.format(--[[!AUTO_540]]"%s%s%s",COLOUR_NEW_5,first_lv,COLOUR_NEW_0)
			end
			if judge_type > 1 then
				return string.format(--[[!AUTO_541]]"%s%s%s",COLOUR_NEW_0,string.format(SKILLDESC_SKILL_LEVEL,first_lv),COLOUR_NEW_0)
			else
				return string.format(--[[!AUTO_542]]"%s%s%s",COLOUR_NEW_0,string.format(SKILLDESC_SKILL_LEVEL_2,first_lv),COLOUR_NEW_0)
			end
		else return ERROR_SKILL_LEVEL
		end
	else
		return ERROR_SKILL_LEVEL
	end
end

--取得：技能包图标路径
function GetSkillPackDesc_Icon(iconpath)
	return GameApi.GetFileNameByID(iconpath,DATA_PATH_MAN)
end

--（测试文本）取得：技能包测试信息title
function GetSkillPackTestDesc_TestTitle()
	return string.format(--[[!AUTO_543]]"%s%s%s",COLOUR_NEW_11,SKILLDESC_SEQ_TESTDATA,COLOUR_NEW_0)
end

--（测试文本）取得：技能包id
function GetSkillPackTestDesc_PackID(idPack)
	return string.format(--[[!AUTO_544]]"%s%s%s%s%s",COLOUR_NEW_11,--[[!AUTO_545]]"(",idPack,--[[!AUTO_546]]")",COLOUR_NEW_0)
end

--（测试文本）取得：技能包总时长



function GetSkillPackTestDesc_SkillTime(number,skill)
	local desc = 0
	for i = 1, number do
		local skilldata = skill[i]
		desc = desc + skilldata.time
	end
	return string.format(--[[!AUTO_547]]"%s%s%s",COLOUR_NEW_11,string.format(PACKDESC_PROCESS_TIME,desc),COLOUR_NEW_0)
end

--（测试文本）取得：技能包总连击



function GetSkillPackTestDesc_ComboTimes(number,skill)
	local desc = 0
	for i = 1, number do
		local skilldata = skill[i]
		desc = desc + skilldata.combo_times
	end
	return string.format(--[[!AUTO_548]]"%s%s%s",COLOUR_NEW_11,string.format(SKILLDESC_ATTACK_TIMES,desc),COLOUR_NEW_0)
end

--（测试文本）取得：技能包内的技能id序列
function GetSkillPackTestDesc_SkillID(number,skill_id)
	local desc = --[[!AUTO_549]]""
	for i = 1, number do
		if i == 1 then
			desc = skill_id[i]
		elseif i%5 == 0 then
			desc = string.format(--[[!AUTO_550]]"%s\r%s%s",desc,--[[!AUTO_551]]"",skill_id[i])
		else desc = string.format(--[[!AUTO_552]]"%s%2s%s",desc,--[[!AUTO_553]]"",skill_id[i])
		end
	end
	return string.format(--[[!AUTO_554]]"%s%s%s",COLOUR_NEW_11,string.format(PACKDESC_SKILL_ID,desc),COLOUR_NEW_0)
end

--（测试文本）取得：技能包的技能群攻上限序列



function GetSkillPackTestDesc_TargetNumber(number,skill)
	local desc = --[[!AUTO_555]]""
	for i = 1, number do
		local skilldata = skill[i]
		if i == 1 then
			desc = skilldata.target_number
		else desc = string.format(--[[!AUTO_556]]"%s-%s",desc,skilldata.target_number)
		end
	end
	return string.format(--[[!AUTO_557]]"%s%s%s",COLOUR_NEW_11,string.format(SKILLDESC_TARGET_NUMBER,desc),COLOUR_NEW_0)
end

--（测试文本）取得：技能包的技能连击类型序列



function GetSkillPackTestDesc_SkillCombo(number,skill)
	local desc = --[[!AUTO_558]]""
	for i = 1, number do
		local skilldata = skill[i]
		local combotxt
		if SKILLPACK_COMBO_TESTDESC[skilldata.combo_type] and SKILLPACK_COMBO_TESTDESC[skilldata.combo_type] ~= --[[!AUTO_559]]"" then
			combotxt = SKILLPACK_COMBO_TESTDESC[skilldata.combo_type]
		else combotxt = string.format(--[[!AUTO_560]]"%s%s",SKILLPACK_COMBO_TESTDESC[skilldata.combo_type],COLOUR_NEW_11)
		end
		if i == 1 then
			desc = combotxt
		else
			desc = string.format(--[[!AUTO_561]]"%s-%s",desc,combotxt)
		end
	end
	return string.format(--[[!AUTO_562]]"%s%s%s",COLOUR_NEW_11,string.format(PACKDESC_SKILL_COMBO,desc),COLOUR_NEW_0)
end

--取得：门派



function GetSkillPackDesc_PROFESSION(packtype,profession)
	local type_desc = --[[!AUTO_563]]""
	if packtype == -1 then
		type_desc = --[[!AUTO_564]]""
	else
		if SKILL_PROFESSION[profession] then
			type_desc = string.format(PACKDESC_PROFESSION_TITLE,string.format(--[[!AUTO_565]]"%s%s%s",COLOUR_NEW_0,SKILL_PROFESSION[profession],COLOUR_NEW_0))
		else type_desc = string.format(PACKDESC_PROFESSION_TITLE,string.format(--[[!AUTO_566]]"%s%s%s",COLOUR_NEW_0,SKILL_PROFESSION[-1],COLOUR_NEW_0)) end
	end
	return type_desc
end

--取得：技能包类型
function GetSkillPackDesc_ShowType(packtype,profession,skill,packnumber)
	local type_desc = --[[!AUTO_567]]""
	if packtype == -1 then
		type_desc = string.format(PACKDESC_SHOWTYPE_TITLE,string.format(--[[!AUTO_568]]"%s%s%s",COLOUR_NEW_0,SKILLPACK_TYPE_DESC[-1],COLOUR_NEW_0))
	elseif packtype == -2 then
		type_desc = string.format(PACKDESC_SHOWTYPE_TITLE,string.format(--[[!AUTO_569]]"%s%s%s",COLOUR_NEW_0,SKILLPACK_TYPE_DESC[-2],COLOUR_NEW_0))
	else
		type_desc = string.format(PACKDESC_SHOWTYPE_TITLE,string.format(--[[!AUTO_570]]"%s%s%s",COLOUR_NEW_0,SKILLPACK_TYPE_DESC[packtype],COLOUR_NEW_0))
		--if packnumber == 1 then
		--	if SKILLPACK_COMBO_TITLE[skill[1]["combo_type"]] and SKILLPACK_COMBO_TITLE[skill[1]["combo_type"]] ~= "" then
		--		type_desc = SKILLPACK_COMBO_TITLE[skill[1]["combo_type"]]
		--	else type_desc = ERROR_PACK_TYPE end
		--else
		--	local combotxt = ""
		--	for i = 1, packnumber do
		--		if SKILLPACK_COMBO_TESTDESC[skill[i]["combo_type"]] and SKILLPACK_COMBO_TESTDESC[skill[i]["combo_type"]] ~= "" then
		--			combotxt = SKILLPACK_COMBO_TESTDESC[skill[i]["combo_type"]]
		--		else type_desc = ERROR_PACK_TYPE end
		--		if i == 1 then
		--			type_desc = combotxt
		--		else
		--			type_desc = string.format("%s-%s",type_desc,combotxt)
		--		end
		--	end
		--end
		--type_desc = string.format(PACKDESC_SHOWTYPE_TITLE,string.format("%s%s%s",COLOUR_NEW_0,type_desc,COLOUR_NEW_0))
	end
	return type_desc
end

--取得：技能包施放类型描述
function GetSkillPackDesc_PrayType(number,skill)
	local text = --[[!AUTO_571]]""
	if number == 1 then text = string.format(--[[!AUTO_572]]"%s%s%s",COLOUR_NEW_0,GetSkillDesc_PrayType(skill[1].pray_type,skill[1].pray_time,skill[1].cycle_count,skill[1].charge_time),COLOUR_NEW_0)
	elseif number > 1 then text = string.format(--[[!AUTO_573]]"%s%s%s",COLOUR_NEW_0,string.format(SKILLDESC_PRAYTYPE_TITLE,SKILL_PRAY_DESC[-4]),COLOUR_NEW_0)
	else text = SKILL_PRAY_DESC[-1]
	end
	return text
end

--取得：技能包消耗描述
function GetSkillPackDesc_MpUse(skill_pack,mp_type)
	local mp_use = 0
	local mp_use_desc = --[[!AUTO_574]]""

	for i = 1 ,#skill_pack do
		--mp_type:1内力 2怒气 3破绽 4体力
		mp_use = mp_use+skill_pack[i].mp_limit[mp_type]
	end

	if mp_use>0 then
		mp_use_desc = string.format(PACKDESC_MPUSE_TITLE[mp_type],mp_use)
	else	mp_use_desc = PACKDESC_NOMPUSE_TITLE
	end

	return mp_use_desc
end

----取得：技能包冷却描述
function GetSkillPackDesc_CoolDown(skill_pack)
	local skill_id = skill_pack.skill_id[1]
	local buff_id = skill_pack.skill[1].buff_id
	local buff_param = skill_pack.skill[1].buff_param
	local cooldown = 0
	local cooldown_desc = --[[!AUTO_575]]""
	LogPrint("cooldown1:" .. cooldown)
	if Temp_Skill_CDTime[skill_id] then
		cooldown = Temp_Skill_CDTime[skill_id]
	else
		for i = 1,16 do
			for j = 9,12 do
				if buff_id and buff_id[i] and buff_id[i][j] and buff_id[i][j] > 0 then
					local skill_process_id = skill_pack.skill[1].process_id[i]
					local skill_state = GameApi.GetSkillState(skill_id,skill_process_id,j-1)
					if skill_state then
						for k = 1,5 do
							 if skill_state.effect[k].effect == 184 then
								LogPrint("1111111111111111111111111111")
								cooldown = buff_param[i][j][k]
								break
							 end
						end
					end
				end

				if cooldown > 0 then
					break
				end
			end
			if cooldown > 0 then
				break
			end
		end
	end
	LogPrint("cooldown2:" .. cooldown)

	if cooldown <= 0 or Temp_Skill_CDTime[skill_id] then
		cooldown = skill_pack.skill[1].cd_time
	end

	if cooldown == 0 then
		cooldown_desc = PACKDESC_CD1_TITLE
	elseif cooldown < 60000 then
		cooldown_desc = string.format(PACKDESC_CD2_TITLE,cooldown/1000)
	elseif cooldown < 3600000 then
		cooldown_desc = string.format(PACKDESC_CD3_TITLE,math.floor(cooldown/60000))
	else
		cooldown_desc = string.format(PACKDESC_CD4_TITLE,math.floor(cooldown/3600000))
	end
	return cooldown_desc
end

--技能包补充描述（手写说明）
function GetSkillPackDesc_DetailDesc(mode,idPack,pack,profession,skill)
	local detail_desc = --[[!AUTO_576]]""
	if mode == 1 then
		if SKILLPACK_DETAIL_DESC[idPack] then
			detail_desc = SKILLPACK_DETAIL_DESC[idPack]
		else
			if pack.type == -1 then
				detail_desc = PACKDESC_USER_DESC
			else
				local combo = skill[1]["combo_type"] 	--0非连招，1起，2承，3转，4合，5续，6替，7待




				if pack.number > 1 then
					for i = 2, pack.number do
						if skill[i]["combo_type"] ~= combo then combo = -1 break end
					end
				end
				if SKILLPACK_COMBO_TITLE[combo] and SKILLPACK_COMBO_TITLE[combo] ~= --[[!AUTO_577]]"" and SKILLPACK_COMBO_DESC[combo] then
					detail_desc = string.format(--[[!AUTO_578]]"%s%s%s%s%s",COLOUR_NEW_8,SKILLPACK_COMBO_TITLE[combo],SKILL_PUNCTRUTION_COLON,COLOUR_NEW_0,SKILLPACK_COMBO_DESC[combo])
				elseif SKILLPACK_COMBO_TITLE[combo] and SKILLPACK_COMBO_TITLE[combo] ~= --[[!AUTO_579]]"" then detail_desc = string.format(--[[!AUTO_580]]"%s%s",COLOUR_NEW_8,SKILLPACK_COMBO_TITLE[combo])
				end
			end
		end
	end
	return detail_desc
end

--技能包每招描述
function GetSkillPackDesc_PerSkill(idPack,pack,mode,packtype)
	local perskill_desc = --[[!AUTO_581]]""
	local perskill, combotype, skillname, skilldetail = --[[!AUTO_582]]"",--[[!AUTO_583]]"",--[[!AUTO_584]]"",--[[!AUTO_585]]""
		if pack.number > 0 then
			--local title = string.format(PACKDESC_SKILL_NUMBER,GetNumColour(pack.number))
			for i = 1, pack.number do
				perskill, combotype, skillname = --[[!AUTO_586]]"",--[[!AUTO_587]]"",--[[!AUTO_588]]""
				local skill,process,subobject = pack.skill[i],pack.process[i],pack.subobject[i]
				--第几式
				--if packtype == -2 then
				--	if SKILLPACK_COMBO_TITLE[pack.skill[i]["combo_type"]] and SKILLPACK_COMBO_TITLE[pack.skill[i]["combo_type"]]~="" then
				--		perskill = string.format("%s%s%s",COLOUR_NEW_5,SKILLPACK_COMBO_TITLE[pack.skill[i]["combo_type"]],COLOUR_NEW_0)
				--	end
				--else
					if SKILLPACK_PER_SKILL[i] then perskill = string.format(--[[!AUTO_589]]"%s%s%s",COLOUR_NEW_5,SKILLPACK_PER_SKILL[i],COLOUR_NEW_0) else perskill = string.format(--[[!AUTO_590]]"%s%s%s",COLOUR_NEW_7,string.format(SKILLPACK_PER_SKILL[0],i),COLOUR_NEW_0) end
				--end
				--非连招/起承转合……
				--if skill.show_type == 1 or skill.show_type == 5 then
				--	if skill.pray_type ~= 9 then
				--		if SKILL_COMBO_TYPE[skill.combo_type] then
				--			combotype = string.format("%s%s%s%s%s",COLOUR_NEW_5,"(",SKILL_COMBO_TYPE[skill.combo_type],")",COLOUR_NEW_0)
				--		end
				--	end
				--end
				--技能名
				skillname = string.format(--[[!AUTO_591]]"%s%s%s",COLOUR_NEW_5,skill.name,COLOUR_NEW_0)
				--单技能描述（仅在mode=1时显示）
				--0. 技能攻击类型描述
				--1. 招式CD
				--2. 体力 怒气需求
				--3. 技能手写描述
				--4. 技能特性
	--			if pack.type >= 0 then
					local desc0,desc1,desc2,desc3,desc4 = --[[!AUTO_592]]"",--[[!AUTO_593]]"",--[[!AUTO_594]]"",--[[!AUTO_595]]"",--[[!AUTO_596]]"",--[[!AUTO_597]]""
					--技能攻击类型描述/体力（怒气）需求
					--if pack.number ~= 1 or pack.type == -1 or pack.type == -2 then		--非自编和界面连招，如果只有1招时则跳过不显示技能攻击类型描述和体力（怒气）需求
						--2013.1.4 临时改成多技能的技能包不显示第x式，且只显示第一个技能的文字描述（当前多技能的技能包中，每个技能的文字描述都是一样的）；技能攻击类型改成强制显示
						--if mode == 1 then
							--if GetSkillDesc_MPLimit(skill.type,skill.mp_limit) ~= "" then
							--	desc0 = string.format("%s%s%s",GetSkillDesc_AttackType(skill.subtype,skill.type,skill.attack_type,skill.attack_range,skill.subobject_name,skill.subobject_cast,skill.profession,true),SKILL_PUNCTRUTION_COMMA,GetSkillDesc_MPLimit(skill.type,skill.mp_limit))
							--else desc0 = GetSkillDesc_AttackType(skill.subtype,skill.type,skill.attack_type,skill.attack_range,skill.subobject_name,skill.subobject_cast,skill.profession,true) end
						--end

					--end
					--备用
					--desc1 = ""
					--招式CD（暂时隐藏）
					--desc2 = GetSkillDesc_CDTime(skill.type,skill.cd_type,skill.cd_time,true)
					--技能特性（暂时隐藏）


					--desc3 = GetSkillSpecificDesc(pack.skill_id[i],skill,process,subobject,mode,true)
					--技能手写描述

					if SKILL_DETAIL_DESC_EX[pack.skill_id[i]] then
						desc4 = SetWildcardText(SKILL_DETAIL_DESC_EX[pack.skill_id[i]],skill,process,subobject)
					elseif SKILL_DETAIL_DESC[pack.skill_id[i]] then
						desc4 = SetWildcardText(SKILL_DETAIL_DESC[pack.skill_id[i]],skill,process,subobject)
					else
						--detail_desc = SKILL_DETAIL_DESC[-1]
					end
					--组合单技能描述--
					skilldetail = --[[!AUTO_598]]""
					if desc0 ~= --[[!AUTO_599]]"" then skilldetail = desc0 end
					--if desc1 ~= "" and skilldetail ~= "" then
					--	skilldetail = string.format("%s\r%s",skilldetail,desc1)
					--else skilldetail = string.format("%s%s",skilldetail,desc1)
					--end
					--if desc2 ~= "" and skilldetail ~= "" then
					--	skilldetail = string.format("%s\r%s",skilldetail,desc2)
					--else skilldetail = string.format("%s%s",skilldetail,desc2)
					--end
					--if desc3 ~= "" and skilldetail ~= "" then
					--	skilldetail = string.format("%s\r%s",skilldetail,desc3)
					--else skilldetail = string.format("%s%s",skilldetail,desc3)
					--end
					if desc4 ~= --[[!AUTO_600]]"" and skilldetail ~= --[[!AUTO_601]]"" then
						skilldetail = string.format(--[[!AUTO_602]]"%s\r%s",skilldetail,desc4)
					else skilldetail = string.format(--[[!AUTO_603]]"%s%s",skilldetail,desc4)
					end
	--			end
				------组合每招描述------
				--2013.1.4 临时改成多技能的技能包不显示第x式，且只显示第一个技能的文字描述（当前多技能的技能包中，每个技能的文字描述都是一样的）；技能攻击类型改成强制显示
				--if pack.number == 1 and pack.type ~= -1 and pack.type ~= -2 then		--非自编和界面连招，如果只有1招时不显示第X式
					perskill_desc = skilldetail
				--2013.1.4 临时改成多技能的技能包不显示第x式，且只显示第一个技能的文字描述（当前多技能的技能包中，每个技能的文字描述都是一样的）；技能攻击类型改成强制显示
				--[[
				else
					if i == 1 then
						if skilldetail == "" then
						--	perskill_desc = string.format("%s%2s%s%2s%s",perskill,"",combotype,"",skillname)
							perskill_desc = string.format("%s%2s%s",perskill,"",skillname)
						--else perskill_desc = string.format("%s%2s%s%2s%s\r%s%s",perskill,"",combotype,"",skillname,"",skilldetail)
						else perskill_desc = string.format("%s%2s%s\r%s%s",perskill,"",skillname,"",skilldetail)
						end
					else
						if skilldetail == "" then
						--	perskill_desc = string.format("%s\r%s%2s%s%2s%s",perskill_desc,perskill,"",combotype,"",skillname)
							perskill_desc = string.format("%s\r%s%2s%s",perskill_desc,perskill,"",skillname)
						--else perskill_desc = string.format("%s\r%s%2s%s%2s%s\r%s%s",perskill_desc,perskill,"",combotype,"",skillname,"",skilldetail)
						else perskill_desc = string.format("%s\r%s%2s%s\r%s%s",perskill_desc,perskill,"",skillname,"",skilldetail)
						end
					end
				end
				]]
			end
			--if pack.number > 1 then
			--	perskill_desc = string.format("%s\r%s",title,perskill_desc)
			--end
		else
			perskill_desc = ERROR_PACK_NUMBER
		end
	return perskill_desc
end

--技能包TIP模式切换描述
function GetSkillPackDesc_TipChange(mode)
	local desc = --[[!AUTO_604]]""
	--if pack.type ~= -1 then
		--2013.1.4 临时改成多技能的技能包不显示第x式，且只显示第一个技能的文字描述（当前多技能的技能包中，每个技能的文字描述都是一样的）；技能攻击类型改成强制显示
		if SKILL_TIP_MODE[mode] then
			local str1,str2 = GameApi.GetLogicKeyCombine(114)
			if str1 == --[[!AUTO_605]]"" then	str1 = NO_SETTING_KEYBOARD	end
			local mode_desc = string.format(SKILL_TIP_MODE[mode],str1)
			desc = string.format(--[[!AUTO_606]]"%s%s%s",COLOUR_NEW_11,mode_desc,COLOUR_NEW_0)
		end
	--end
	return desc
end

--技能包背景描述
function GetSkillPackDesc_TipRemark(idPack)
	local desc = --[[!AUTO_607]]""
	if SKILLPACK_TIP_REMARK[idPack] then
		desc = SKILLPACK_TIP_REMARK[idPack]
	else
		--desc = SKILLPACK_TIP_REMARK[-1]
	end
	return desc
end

function GetSkillNewDamageDesc(pack)
	local damage_desc = --[[!AUTO_608]]""
	local first = true
	for i = 1, pack.number do
		if SKILL_DAMAGE_DESC_EX[pack.skill_id[i]] and SKILL_DAMAGE_DESC_EX[pack.skill_id[i]] ~= --[[!AUTO_609]]"" then
			local skill,process,subobject = pack.skill[i],pack.process[i],pack.subobject[i]
			if first == true then
				damage_desc = SetWildcardText(SKILL_DAMAGE_DESC_EX[pack.skill_id[i]],skill,process,subobject)
				first = false
			else
				damage_desc = damage_desc .. --[[!AUTO_610]]"\r" .. SetWildcardText(SKILL_DAMAGE_DESC_EX[pack.skill_id[i]],skill,process,subobject)
			end
		end
	end

	return damage_desc
end

--在字符串末尾添加字符串
function AddStringToBehind(str,add_str,insert_str)
	if str ~= --[[!AUTO_611]]"" then
		str = str .. insert_str .. add_str
	else
		str = add_str
	end

	return str
end

--秘笈是否已激活
function MijiIsActive(miji_skill_id)
	return SkillApi.IsMijiActiveByID(miji_skill_id)
end

---------------------------技能包TIP显示函数-----------------------------
function SkillTip:GetSkillPackTipAsVector(idPack,level,point,mode)
	local pack = GetSkillPackData(idPack)
	LogPrint(--[[!AUTO_1469]]"mode:" .. mode)
	mode = 1 - mode       --默认显示mode 1

	-->>Tip是否显示测试信息<< false不显示，true显示
	local isTestMode = false
	if TestShowItemId and TestShowItemId == 1 then
		isTestMode = true
	end

	----------------------------------
	--名字
	local tiptitle_pack = --[[!AUTO_612]]""
	if isTestMode and mode == 1 then
		tiptitle_pack = string.format(--[[!AUTO_613]]"%s%s",GetSkillPackDesc_Name(pack.name,pack.type),GetSkillPackTestDesc_PackID(idPack))
	else tiptitle_pack = GetSkillPackDesc_Name(pack.name,pack.type)
	end

	--图标
	local tipicon_pack = --[[!AUTO_614]]""
	tipicon_pack = GetSkillPackDesc_Icon(pack.iconpath)

	local tipinf01_pack = --[[!AUTO_615]]""
	local tipinf02_pack = --[[!AUTO_616]]""
	local tipinf03_pack = --[[!AUTO_617]]""
	local tipstar_pack = --[[!AUTO_618]]""
	local tiplimitleft_pack = --[[!AUTO_619]]""
	local tiplimitright_pack = --[[!AUTO_620]]""
	local tiplimitskill_pack = --[[!AUTO_621]]""
	local tipdesc_pack = --[[!AUTO_622]]""
	local tipperskill_pack = --[[!AUTO_623]]""
	local tipremark_pack = --[[!AUTO_624]]""

	----------------------------------
	--if pack.number ~= 1 or pack.type == -1 or pack.type == -2 then
		--技能包类型
	if GetSkillPackDesc_PROFESSION(pack.type,pack.profession) ~= --[[!AUTO_625]]"" then
		local prof_desc = GetSkillPackDesc_PROFESSION(pack.type,pack.profession)
		local showtype_desc = GetSkillPackDesc_ShowType(pack.type,pack.profession,pack.skill,pack.number)
		LogPrint(--[[!AUTO_626]]"skill_lv:" .. pack.skill_lv[1])
		local skill_lv_desc = GetSkillPackDesc_FirstSkillLv(1,pack.skill[1].judge_type,pack.skill_lv,pack.skill_id)
		local mp_user_desc = GetSkillPackDesc_MpUse(pack.skill,1)
		local praytype_desc = GetSkillPackDesc_PrayType(pack.number,pack.skill)
		local cd_desc = GetSkillPackDesc_CoolDown(pack)
		LogPrint("cd_desc:" .. cd_desc)

		local skill_lv_desc_nocolor = string.gsub(skill_lv_desc,--[[!AUTO_627]]"%^[%dA-Fa-f][%dA-Fa-f][%dA-Fa-f][%dA-Fa-f][%dA-Fa-f][%dA-Fa-f]",--[[!AUTO_628]]"")
		local mp_user_desc_nocolor = string.gsub(mp_user_desc,--[[!AUTO_629]]"%^[%dA-Fa-f][%dA-Fa-f][%dA-Fa-f][%dA-Fa-f][%dA-Fa-f][%dA-Fa-f]",--[[!AUTO_630]]"")
		local number_count_1 = select(2,string.gsub(skill_lv_desc_nocolor,--[[!AUTO_631]]"[%d-]",--[[!AUTO_632]]""))
		local number_count_2 = select(2,string.gsub(mp_user_desc_nocolor,--[[!AUTO_633]]"[%d-]",--[[!AUTO_634]]""))
		for i = 1,33-(string.len(skill_lv_desc_nocolor)+string.len(mp_user_desc_nocolor))-number_count_1-number_count_2 do
			mp_user_desc = --[[!AUTO_635]]" " .. mp_user_desc
		end

		local praytype_desc_nocolor = string.gsub(praytype_desc,--[[!AUTO_636]]"%^[%dA-Fa-f][%dA-Fa-f][%dA-Fa-f][%dA-Fa-f][%dA-Fa-f][%dA-Fa-f]",--[[!AUTO_637]]"")
		local cd_desc_nocolor = string.gsub(cd_desc,--[[!AUTO_638]]"%^[%dA-Fa-f][%dA-Fa-f][%dA-Fa-f][%dA-Fa-f][%dA-Fa-f][%dA-Fa-f]",--[[!AUTO_639]]"")
		number_count_1 = select(2,string.gsub(praytype_desc_nocolor,--[[!AUTO_640]]"[%d-]",--[[!AUTO_641]]""))
		number_count_2 = select(2,string.gsub(cd_desc_nocolor,--[[!AUTO_642]]"[%d-]",--[[!AUTO_643]]""))

		--for i = 1,32-(string.len(praytype_desc_nocolor)+string.len(cd_desc_nocolor))-number_count_1-number_count_2 do
		--	cd_desc = " " .. cd_desc
		--end

		tipinf01_pack = string.format(--[[!AUTO_644]]"%s%s\r%s%s\r%s\r%s",prof_desc,showtype_desc,skill_lv_desc,mp_user_desc,praytype_desc,cd_desc)
	else
		tipinf01_pack = string.format(--[[!AUTO_645]]"%s%5s\r%s%5s",GetSkillPackDesc_ShowType(pack.type,pack.profession,pack.skill,pack.number),GetSkillPackDesc_PrayType(pack.number,pack.skill))
	end
	
	local new_param_9 = pack.skill[1].new_param_9
	if new_param_9 and new_param_9 ~= 0 then
		tipinf02_pack = string.format(ZHANYI_DESC, new_param_9)
	else
		tipinf02_pack = 0
	end

	--星级（技能暂时不用）
	tipstar_pack = GetTipstar(idPack,level)

	--（测试信息）
	if isTestMode and mode == 1 then
		tiplimitskill_pack = GetSkillPackTestDesc_TestTitle()
		local test_data = {
			GetSkillPackTestDesc_SkillTime(pack.number,pack.skill),
			GetSkillPackTestDesc_ComboTimes(pack.number,pack.skill),
			GetSkillPackTestDesc_SkillID(pack.number,pack.skill_id),
			GetSkillPackTestDesc_TargetNumber(pack.number,pack.skill),
			GetSkillPackTestDesc_SkillCombo(pack.number,pack.skill),
		}
		for i = 1, table.getn(test_data) do
			if test_data[i] ~= --[[!AUTO_646]]"" then
				if i == 1 or i == 3 or i == 4 or i == 5 then
					tiplimitskill_pack = string.format(--[[!AUTO_647]]"%s\r%s",tiplimitskill_pack,test_data[i])
				else tiplimitskill_pack = string.format(--[[!AUTO_648]]"%s%3s%s",tiplimitskill_pack,--[[!AUTO_649]]"",test_data[i])
				end
			end
		end
	end
	--技能伤害描述
	LogPrint(--[[!AUTO_1470]]"mode:" .. mode)
	if mode == 1 then
		tipdesc_pack = GetSkillNewDamageDesc(pack)
	end

	--每招描述/补充描述
	--GetSkillPackDesc_DetailDesc(mode,idPack,pack,pack.profession,pack.skill)
	tipperskill_pack = GetSkillPackDesc_PerSkill(idPack,pack,mode,pack.type)
	--切换描述/背景描述
	if GetSkillPackDesc_TipRemark(idPack) ~= --[[!AUTO_650]]"" then
		tipremark_pack = GetSkillPackDesc_TipRemark(idPack)
	else
		if mode == 1 and NORMAL_MIJI_DATA[pack.skill_id[1]] then
			local normal_miji_id = 0
			for i = 1,3 do
				if MijiIsActive(NORMAL_MIJI_DATA[pack.skill_id[1]][i]) then
					local normal_miji_essence = GameApi.GetSkillEssence(NORMAL_MIJI_DATA[pack.skill_id[1]][i],1)
					tipremark_pack = AddStringToBehind(tipremark_pack,string.format(MIJI_NAME_DESC,COLOUR_NEW_6,normal_miji_essence["display_name"],COLOUR_NEW_0,string.format(MIJI_DATA_DESC[i],"")),--[[!AUTO_652]]"\r")
				end
			end

			local miji_skill_id = pack.skill[1].enhance_skill_id
			if miji_skill_id > 0 then
				local miji_skill_essence = GameApi.GetSkillEssence(miji_skill_id,1)
				local is_active = MijiIsActive(miji_skill_id)
				local key_str = GameApi.GetSkillSeqShortcutName(idPack)

				local ctrl_str
				if key_str and #key_str > 0 then
					ctrl_str = string.format(MIJI_CTRL_DESC,key_str)
				else
					ctrl_str = MIJI_CTRL_DESC_NO_KEY
				end

				if is_active == true then
					tipremark_pack = AddStringToBehind(tipremark_pack,string.format(MIJI_NAME_DESC,COLOUR_NEW_6,miji_skill_essence["display_name"],COLOUR_NEW_0,ctrl_str),--[[!AUTO_653]]"\r")
				end
			end

			if tipremark_pack ~= --[[!AUTO_654]]"" then
				tipremark_pack = ACTIVED_MIJI_LABEL .. --[[!AUTO_655]]"\r" .. tipremark_pack
			end
		end

		tipremark_pack = AddStringToBehind(tipremark_pack,GetSkillPackDesc_TipChange(mode),--[[!AUTO_656]]"\r\r")
	end
--[[
	----------------------------------
	else			--非自编和界面连招，如果只有1招时显示技能TIP的样式



		local skill,process,subobject = pack.skill[1],pack.process[1],pack.subobject[1]
		local first_lv = pack.skill_lv[1]
		--技能等级 类型 出招
		tipinf01_pack = string.format("%s\r%s\r%s",GetSkillPackDesc_FirstSkillLv(pack.number,pack.skill[1].judge_type,pack.skill_lv),GetSkillDesc_Profession(skill.show_type,skill.profession),GetSkillDesc_ShowType(skill.show_type,skill.profession,skill.combo_type))
		tipinf01_pack = string.format("%s\r%s",tipinf01_pack,GetSkillDesc_PrayType(skill.pray_type,skill.pray_time,skill.cycle_count,skill.charge_time))

		--星级（技能暂时不用）
		tipstar_pack = GetTipstar(idPack,level)

		--攻击类型
		if mode == 1 then
			tiplimitleft_pack = GetSkillDesc_AttackType(skill.subtype,skill.type,skill.attack_type,skill.attack_range,skill.subobject_name,skill.subobject_cast,skill.profession,false)
		end

		--距离限制/怒气 体力限制
		if mode == 1 then
			local mp_limit_desc = GetSkillDesc_MPLimit(skill.type,skill.mp_limit)
			local attack_distance_desc = GetSkillDesc_AttackDistance(skill.type,skill.attack_range,skill.subobject_gen_distance,skill.attack_maxdistance,skill.affect_radius,skill.affect_distance,skill.isarrest)
			if mp_limit_desc ~= "" and attack_distance_desc ~= "" then
				tiplimitright_pack = string.format("%s%s%s",attack_distance_desc,SKILL_PUNCTRUTION_COMMA,mp_limit_desc)
			elseif mp2_limit_desc ~= "" or attack_distance_desc ~= "" then
				tiplimitright_pack = string.format("%s%s",attack_distance_desc,mp_limit_desc)
			end
		end

		--主体描述
		local tiplimitskill_1, tiplimitskill_2 = "",""
		if isTestMode and mode == 1 then
			tiplimitskill_1 = GetSkillPackTestDesc_TestTitle()
			local test_data = {
				GetSkillTestDesc_EnhanceId(skill.enhance_skill_id),
				GetSkillTestDesc_CastInQinggong(skill.cancast_in_qinggong),
				GetSkillPackTestDesc_SkillID(pack.number,pack.skill_id),
				GetSkillTestDesc_GainRage(skill.gain_rage),
				GetSkillTestDesc_ComboTimes(skill.combo_times),
				GetSkillTestDesc_AutoType(skill.auto_type),
				GetSkillTestDesc_CDData(skill.cd_type,skill.cd_time),
				GetSkillTestDesc_DelayType(skill.delay_type,skill.delay_time,skill.delay_speed),
				GetSkillTestDesc_SubObject(skill.subobject_type,skill.subobject_id),
				GetSkillTestDesc_SkillTime(skill.time),
				GetSkillTestDesc_TargetNumber(skill.target_number),
				GetSkillTestDesc_SpecialPozhanUp(skill.dodge_pozhan_up,skill.block_pozhan_up),
				GetSkillTestDesc_ProcessData(skill.process_real_number,skill.process_id,skill.process_name,skill.process_isdodgebreak),
			}
			for i = 1, table.getn(test_data) do
				if test_data[i] ~= "" then
					if i == 1 or i == 3 or i == 5 or i == 7 or i == 8 or i == 9 or i == 11 or i == 12 then
						tiplimitskill_1 = string.format("%s\r%s",tiplimitskill_1,test_data[i])
					else tiplimitskill_1 = string.format("%s%3s%s",tiplimitskill_1,"",test_data[i])
					end
				end
			end
		end
		local list_num = 0
		if mode == 1 then
			local main_data = {
					GetSkillDesc_CDTime(skill.type,skill.cd_type,skill.cd_time,false),
					GetSkillDesc_MPUse(skill.type,skill.mp_use,skill.cycle_count),
					GetSkillDesc_UseLimit(skill.type,skill.attack_mindistance,skill.fight_state_limit,skill.attack_type),
					GetSkillDesc_MoveDistance(skill.move_type,skill.move_scale,skill.move_angle,skill.move_max_distance,skill.move_min_distance,skill.attack_type,skill.attack_maxdistance,skill.attack_mindistance),
					GetSkillDesc_Pozhan(skill.type,skill.target_pozhan,skill.self_pozhan,skill.cycle_count),
					GetSkillDesc_PozhanStun(skill.type,skill.control_type,skill.control_distance),
			}
			for i = 1, table.getn(main_data) do
				if main_data[i] ~= "" then
					list_num = list_num + 1
					if list_num == 1 then
						tiplimitskill_2 = main_data[i]
					else tiplimitskill_2 = string.format("%s\r%s",tiplimitskill_2,main_data[i])
					end
				end
			end
		end
		if tiplimitskill_1 ~= "" then tiplimitskill_pack = string.format("%s\r%s",tiplimitskill_1,tiplimitskill_2) else tiplimitskill_pack = tiplimitskill_2 end

		--手写描述/每击描述/切换描述
		local detail_desc,is_nodetail = GetSkillDesc_DetailDesc(pack.skill_id[1],skill,process,subobject)
		tipperskill_pack = detail_desc
		if mode == 1 then
			if GetSkillDesc_ExtraText(skill.type,skill.charge_isinterrupt,skill.isweak) ~= "" then
				--if string.len(detail_desc) <= 64 then
					tipperskill_pack = string.format("%s%s",tipperskill_pack,GetSkillDesc_ExtraText(skill.type,skill.charge_isinterrupt,skill.isweak))
				--else tipperskill_pack = string.format("%s\r%s",tipperskill_pack,GetSkillDesc_ExtraText(skill.type,skill.charge_isinterrupt,skill.isweak))
				--end
			end
			if isTestMode then
				if GetSkillDesc_PerHit(is_nodetail,skill.type,skill.pray_type,skill.process_number,process.damage_type,process.hit_position,process.dodge_position,process.attack,process.ratio,process.mag_attack,process.mag_ratio,process.element_damage_type,process.element_damage_number,process.combo,process.isattack_qinggong) ~= "" then
					if detail_desc ~= "" then
						tipperskill_pack = string.format("%s\r%s",tipperskill_pack,GetSkillDesc_PerHit(is_nodetail,skill.type,skill.pray_type,skill.process_number,process.damage_type,process.hit_position,process.dodge_position,process.attack,process.ratio,process.mag_attack,process.mag_ratio,process.element_damage_type,process.element_damage_number,process.combo,process.isattack_qinggong))
					else tipperskill_pack = GetSkillDesc_PerHit(is_nodetail,skill.type,skill.pray_type,skill.process_number,process.damage_type,process.hit_position,process.dodge_position,process.attack,process.ratio,process.mag_attack,process.mag_ratio,process.element_damage_type,process.element_damage_number,process.combo,process.isattack_qinggong)
					end
				end
			end
		end

		--升级效果描述
		if mode == 1 then
			tipdesc_pack = GetSkillDesc_LevelupText(pack.skill_id[1],first_lv)
		end

		--背景描述
		if GetSkillDesc_TipRemark(pack.skill_id[1]) ~= "" then
			tipremark_pack = GetSkillDesc_TipRemark(pack.skill_id[1])
		else
			tipremark_pack = GetSkillDesc_TipChange(mode)
		end
	end
	----------------------------------
--]]

	local tipmoney1_pack = --[[!AUTO_657]]""
	local tipmoney2_pack = --[[!AUTO_658]]""
	local tipmoney3_pack = --[[!AUTO_659]]""
	local tipmoney4_pack = --[[!AUTO_660]]""
	local tiplabmoney_pack = --[[!AUTO_661]]""
	local tiplabfame_pack = --[[!AUTO_662]]""
	local tipfame_pack = --[[!AUTO_663]]""
	local tiplabexchange_pack = --[[!AUTO_664]]""
	local tipexchange_pack = --[[!AUTO_665]]""
	local tipexchangepic_pack = --[[!AUTO_666]]""
	local tiplabxcash_pack = --[[!AUTO_667]]""
	local tipgold1_pack = --[[!AUTO_668]]""
	local tipgold2_pack = --[[!AUTO_669]]""


	local skillpack_desctip = {}
	skillpack_desctip["title"] = tiptitle_pack
	skillpack_desctip["icon"] = tipicon_pack
	skillpack_desctip["info1"] = tipinf01_pack
	skillpack_desctip["info2"] = tipinf02_pack
	skillpack_desctip["info3"] = tipinf03_pack
	skillpack_desctip["star"] = tipstar_pack
	skillpack_desctip["limitleft"] = tiplimitleft_pack
	skillpack_desctip["limitright"] = tiplimitright_pack
	skillpack_desctip["limitskill"] = tiplimitskill_pack
	skillpack_desctip["desc"] = tipperskill_pack
	skillpack_desctip["strengthen"] = tipdesc_pack
	skillpack_desctip["remark"] = tipremark_pack

	return skillpack_desctip
end



------------------------------------------------------------------------------------------------------------------
--------------------------------------技能升级信息提示------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------
--isSkill : 技能(true)  技能包(false)
--isLearn : 学习(true)  升级(false)
--tid     : 模板ID
--level   : 等级
--point   : 熟练度




function SkillTip:GetLearnSkillMsg(tid,level,point,isSkill,isLearn)--技能升级信息提示

	local learn_desc = --[[!AUTO_670]]""
	if isSkill then      --技能

		local skill_essence = {}
		skill_essence = GameApi.GetSkillEssence(tid,level)
		--if skill_essence["display_ref"] > 0 then								--display_ref=0为隐藏技能，隐藏技能升级和学习时不显示信息
		if skill_essence["display_ref"] == 7 then
			if skill_essence["display_name"] and skill_essence["display_name"] ~= --[[!AUTO_671]]"" then
				if SKILL_LEVEL_TEXT[level] then
				learn_desc = string.format(SKILL_LEARN_DESC[2] ,skill_essence["display_name"],SKILL_LEVEL_TEXT[level])
				else learn_desc = string.format(SKILL_LEARN_DESC[2] ,skill_essence["display_name"],level)
				end
			end
		else
			if isLearn  then  --学习
				if skill_essence["display_name"] and skill_essence["display_name"] ~= --[[!AUTO_672]]"" then
					if SKILL_LEVEL_TEXT[level] then
					learn_desc = string.format(SKILL_LEARN_DESC[1],skill_essence["display_name"],SKILL_LEVEL_TEXT[level])
					else learn_desc = string.format(SKILL_LEARN_DESC[1],skill_essence["display_name"],level)
					end
				end
			else             --升级
				if skill_essence["display_name"] and skill_essence["display_name"] ~= --[[!AUTO_673]]"" then
					if SKILL_LEVEL_TEXT[level] then
					learn_desc = string.format(SKILL_LEARN_DESC[1],skill_essence["display_name"],SKILL_LEVEL_TEXT[level])
					else learn_desc = string.format(SKILL_LEARN_DESC[1],skill_essence["display_name"],level)
					end
				end
			end
		end
		--end
	else                 --技能包
	    local skillpack_essence = {}
		skillpack_essence = GameApi.GetSkillPack(tid)
		if isLearn then  --学习
			if skillpack_essence["name"]  then
			learn_desc = string.format(SKILL_LEARN_DESC[0],skillpack_essence["name"])
			end
		else
		    if skillpack_essence["name"]  then           --升级
			learn_desc = string.format(SKILL_LEARN_DESC[1],skillpack_essence["name"],level)
		    end
		end
	end
	if learn_desc and learn_desc ~= --[[!AUTO_674]]"" then
		learn_desc = string.format(--[[!AUTO_675]]"%s%s",COLOUR_NEW_12,learn_desc)
		return learn_desc
	else return --[[!AUTO_676]]""
	end
end



------------------------------------------------------------------------------------------------------------------
--------------------------------------门派技能对应的姿态表--------------------------------------------------------
------------------------------------------------------------------------------------------------------------------

SkillTip.Stance =
{
	--门派少林
	[1] =
	{
		--技能对于姿态




		[908] = 0,--戒备
		[803] = 1,--长棍
		[805] = 2,--拳掌
		--[804] = 3,--三节棍




	},
	--门派武当
	[2] =
	{
		--技能对于姿态




		[2345] = 0,--戒备
		[2343] = 1,--举剑
		[2344] = 2,--御剑
		--[2343] = 3,--戒备
	},
	--门派华山
	[3] =
	{
		--技能对于姿态




		[2074] = 0,--戒备
		[2075] = 1,--剑宗
		[2076] = 2,--气宗
		--[2074] = 3,--戒备
	},
	--门派恒山
	[4] =
	{
		--技能对于姿态




		[2893] = 0,--戒备
		[2891] = 1,--格挡
		[2892] = 2,--双剑
		--[2074] = 3,--戒备
	},
	--门派衡山
	[5] =
	{
		--技能对于姿态




		[2854] = 0,--戒备
		[2852] = 1,--拔刀
		[2853] = 2,--幻影
		--[2074] = 3,--戒备
	},
	--门派日月
	[6] =
	{
		--技能对于姿态




		[2908] = 0,--戒备
		[2906] = 1,--合刀
		[2907] = 2,--链刀
		--[2074] = 3,--戒备
	},
	--门派五毒
	[7] =
	{
		--技能对于姿态




		[2210] = 0,--戒备
		[2211] = 1,--举鞭
		[2212] = 2,--蛊毒
		--[2210] = 3,--戒备
	},

	--门派逍遥
	[8] =
	{
		--技能对于姿态




		[2249] = 0,--戒备
		[2250] = 1,--常规
		[2251] = 2,--折梅
		--[2249] = 3,--戒备
	},
	--门派唐门
	[9] =
	{
		--技能对于姿态




		[2557] = 0,--戒备
		[2555] = 1,--常规
		[2556] = 2,--火器
		--[2557] = 3,--戒备
	},
	--门派峨眉
	[10] =
	{
		--技能对于姿态




		[2905] = 0,--戒备
		[2903] = 1,--姿态1
		[2904] = 2,--姿态2
		--[2557] = 3,--戒备
	},
}

function SkillTip:GetSkillStances()--门派技能对应的姿态表
	return  SkillTip.Stance
end

-------------------------------------------------------------------------------------------------
-------------------------------------界面修炼显示及修炼TIP---------------------------------------
-------------------------------------------------------------------------------------------------
--bOK,val = GameApi.GetItemDBProp(id,1006,prop)
--id：修炼模板id，prop：字符串，模板名称

--bOK：true/false，val：模板值

--自定义事件LINK：GameApi.GenerateCustomLuaLink(name,info,color)
--根据修炼id取修炼模板数据


function GetPractiseData(id)
	-------------------------------------
	local p_data = {}
	_,p_data["name"] = GameApi.GetItemDBProp(id,1006,--[[!]]"修炼服务名")
	_,p_data["icon"] = GameApi.GetItemDBProp(id,1006,--[[!]]"图标名称")
	_,p_data["type"] = GameApi.GetItemDBProp(id,1006,--[[!]]"修炼分类")
	_,p_data["min_lv"] = GameApi.GetItemDBProp(id,1006,--[[!]]"最小等级限制")
	_,p_data["max_lv"] = GameApi.GetItemDBProp(id,1006,--[[!]]"最大等级限制")
	_,p_data["prof"] = GameApi.GetItemDBProp(id,1006,--[[!]]"职业限制")
	_,p_data["gender"] = GameApi.GetItemDBProp(id,1006,--[[!]]"性别限制")
	_,p_data["skillpack"] = GameApi.GetItemDBProp(id,1006,--[[!]]"修炼前提已学技能包ID")
	_,p_data["skill"] = GameApi.GetItemDBProp(id,1006,--[[!]]"修炼前提已学技能ID")
	_,p_data["skill_min_lv"] = GameApi.GetItemDBProp(id,1006,--[[!]]"修炼前提已学技能最低等级")
	_,p_data["skill_max_lv"] = GameApi.GetItemDBProp(id,1006,--[[!]]"修炼前提已学技能最高等级")
	_,p_data["time"] = GameApi.GetItemDBProp(id,1006,--[[!]]"修炼时长（秒）")
	_,p_data["per"] = GameApi.GetItemDBProp(id,1006,--[[!]]"修炼段数")

	p_data["is_skill_lvup"] = {}
	_,p_data["is_skill_lvup"][0] = GameApi.GetItemDBProp(id,1006,--[[!]]"修炼成功是否提升前提已学技能等级")
	_,p_data["is_skill_lvup"][1] = GameApi.GetItemDBProp(id,1006,--[[!]]"修炼失败是否提升前提已学技能等级")

	p_data["probability"],p_data["gongli"] = {},{}
	for lv = 0,20 do
		local prop_1,prop_2 = --[[!AUTO_677]]"", --[[!AUTO_678]]""
		if lv == 0 then
			prop_1 = --[[!]]"无前提技能时的修炼成功率"
			prop_2 = --[[!]]"无前提技能时的每段功力消耗"
		elseif lv == 20 then
			prop_1 = --[[!]]"前提技能等级20+时的修炼成功率"
			prop_2 = --[[!]]"前提技能等级20+时的每段功力消耗"
		else
			prop_1 = string.format(--[[!AUTO_679]]"%s%s%s",--[[!]]"前提技能等级",lv,--[[!]]"时的修炼成功率")
			prop_2 = string.format(--[[!AUTO_680]]"%s%s%s",--[[!]]"前提技能等级",lv,--[[!]]"时的每段功力消耗")
		end
		_,p_data["probability"][lv] = GameApi.GetItemDBProp(id,1006,prop_1)
		_,p_data["gongli"][lv] = GameApi.GetItemDBProp(id,1006,prop_2)
	end
	-------------------------------------
	return p_data
end

--根据修炼id判断修炼状态（0：可用 1：已完成 2：不可用 -1：不显示）

--t_id：修炼界面的分类，从0开始（如果t_id=-1表示为修炼tip调用）

function GetPractiseState(skill_data,player_data,p_data,t_id)
	local prac_state = 0

	if t_id == p_data["type"] or t_id == -1 then
		------------------------------------------------------------------------------
		--等级上限
		if player_data.level > p_data["max_lv"] then return -1 end
		--性别
		if player_data.gender ~= p_data["gender"] and p_data["gender"] ~= 2 then return -1 end
		--门派
		--[[
		local prof_mask = p_data["prof"]
		local prof_tab = {}
		for p_id = 0,31 do
			if prof_mask >= 2^(31-p_id) then
				prof_tab[31-p_id] = 1
				prof_mask = prof_mask - 2^(31-p_id)
			else prof_tab[31-p_id] = 0 end
		end
		if prof_tab[player_data.prof] ~= 1 then return -1 end
		]]
		------------------------------------------------------------------------------

		------------------------------------------------------------------------------
		--等级下限
		if player_data.level < p_data["min_lv"] then prac_state = 2 end
		--技能包
		if p_data["skillpack"] > 0 then
			local packinfo = GetSkillPackData(p_data["skillpack"])
			local pack_islearn = true
			if packinfo.number > 0 then
				for i = 1 , packinfo.number do
					if not skill_data[packinfo.skill_id[i]] then
						pack_islearn = false
						break
					end
				end
			end
			if not pack_islearn then prac_state = 2 end
		end
		if p_data["skill"] > 0 then
			--技能上限




			if skill_data[p_data["skill"]] and skill_data[p_data["skill"]] > p_data["skill_max_lv"] then prac_state = 1 end
			--技能下限




			if not skill_data[p_data["skill"]] then prac_state = 2
			elseif skill_data[p_data["skill"]] < p_data["skill_min_lv"] then prac_state = 2
			end
		end
		return prac_state
		------------------------------------------------------------------------------
	else return -1 end
end

--修炼文本的通配符替换

--#name：前提套路名称

--#maxlv：最大等级

--$p,$f,$i：每个$符号代表数组val中的一个值，依次显示（强调颜色，其中p f i对应显示格式分别为：百分比、小数、整数）
function SetPractiseWildcardText(p_data,text,val)
	local desc = text
	local n,m

	n,m = string.find(desc,--[[!AUTO_681]]"#name")
	if n and m then
		local pack_data = GameApi.GetSkillPack(p_data["skillpack"])
		desc = string.gsub(desc,--[[!AUTO_682]]"#name",pack_data["name"])
	end
	n,m = string.find(desc,--[[!AUTO_683]]"#maxlv")
	if n and m then
		if SKILL_LEVEL_TEXT[p_data["skill_max_lv"]+1] then desc = string.gsub(desc,--[[!AUTO_684]]"#maxlv",SKILL_LEVEL_TEXT[p_data["skill_max_lv"]+1])
		else desc = string.gsub(desc,--[[!AUTO_685]]"#maxlv",p_data["skill_max_lv"]+1) end
	end
	if val and table.getn(val) > 0 then
		local co = 0
		for i = 1,table.getn(val) do
			n,m = string.find(desc,--[[!AUTO_686]]"$%a")
			if n and m then
				co = co + 1
				if val[co] then
					if string.sub(desc,n,m) == --[[!AUTO_687]]"$p" then
						desc = string.format(--[[!AUTO_688]]"%s%s%s",string.sub(desc,1,n-1),GetNumColour(string.format(--[[!AUTO_689]]"%s%s",val[co]*100,--[[!AUTO_690]]"%")),string.sub(desc,m+1,-1))
					elseif string.sub(desc,n,m) == --[[!AUTO_691]]"$i" then
						desc = string.format(--[[!AUTO_692]]"%s%s%s",string.sub(desc,1,n-1),GetNumColour(math.floor(val[co])),string.sub(desc,m+1,-1))
					else
						desc = string.format(--[[!AUTO_693]]"%s%s%s",string.sub(desc,1,n-1),GetNumColour(val[co]),string.sub(desc,m+1,-1))
					end
				end
			else break end
		end
	end
	return desc
end

------------------------------------------------
----------------界面修炼分类显示----------------
------------------------------------------------
function SkillTip:GetProfPractise(t_id)
	local skill_data = GameApi.GetSkillTable()
	local player_data = GameApi.GetPlayerBasicProp(0)

	local practise = {} 	--practise[0]：可使用的修炼组，practise[1]：已完成的修炼组，practise[2]：不可使用的修炼组


	practise[0],practise[1],practise[2] = {},{},{}

	for i = 1,table.getn(PRACTISE_ALLID_LIST[player_data.prof]) do
		local p_data = GetPractiseData(PRACTISE_ALLID_LIST[player_data.prof][i])
		local p_type = GetPractiseState(skill_data,player_data,p_data,t_id)
		local tab = {}
		if p_type >= 0 then
			--tab[1]：修炼id
			tab[1] = PRACTISE_ALLID_LIST[player_data.prof][i]
			--tab[2]：对应id的简要说明




			if p_type == 0 then
				local lv = 0
				if skill_data[p_data["skill"]] then
					if skill_data[p_data["skill"]] > 20 then lv = 20
					else lv = skill_data[p_data["skill"]] end
				end
				tab[2] = string.format(--[[!AUTO_694]]"%s%s%s",COLOUR_NEW_5,string.format(PRACDESC_USE_GONGLI,p_data["gongli"][lv]*p_data["per"]),COLOUR_NEW_0)
			elseif p_type == 1 then
				tab[2] = string.format(--[[!AUTO_695]]"%s%s%s",COLOUR_NEW_9,PRACPROMPT_LEVEL_MAX,COLOUR_NEW_0)
			else
				if player_data.level < p_data["min_lv"] then
					tab[2] = string.format(--[[!AUTO_696]]"%s%s%s",COLOUR_NEW_8,string.format(PRACPROMPT_LEVEL_NOTENOUGH,string.format(--[[!AUTO_697]]"%s%s",COLOUR_NEW_8,p_data["min_lv"])),COLOUR_NEW_0)
				elseif p_data["skillpack"] > 0 then
					local packinfo = GetSkillPackData(p_data["skillpack"])
					local pack_islearn = true
					if packinfo.number > 0 then
						for n = 1 , packinfo.number do
							if not skill_data[packinfo.skill_id[n]] then
								pack_islearn = false
								break
							end
						end
					end
					if not pack_islearn then
						tab[2] = string.format(--[[!AUTO_698]]"%s%s%s",COLOUR_NEW_8,string.format(PRACPROMPT_NEED_LEARNSKILL,packinfo.name),COLOUR_NEW_0)
					elseif p_data["skill"] > 0 and not skill_data[p_data["skill"]] then
						if PRACTISE_SKILL_EFFECT[p_data["skill"]].iditem then
							local id_item = PRACTISE_SKILL_EFFECT[p_data["skill"]].iditem
							local link = GameApi.GenerateCustomLuaLink(GameApi.GetItemName(id_item), string.format(--[[!AUTO_699]]"%s%d", --[[!AUTO_700]]"ItemID_", id_item), 0xc3dbff)
							tab[2] = string.format(--[[!AUTO_701]]"%s%s%s",COLOUR_NEW_8,string.format(PRACPROMPT_NEED_ITEM,link),COLOUR_NEW_0)
						end
					end
				end
			end
			--往对应的数组中插入tab
			table.insert(practise[p_type],tab)
		end
	end

	--[[
	--测试打印结果--
	-----------------------------------------------------------------------
	local p1,p2,p3 = practise[0],practise[1],practise[2]
	LogPrint("----------------------------------------------")
	LogPrint("1：可以使用的修炼服务")
	LogPrint("----------------------------------------------")
	if p1 then
		for n1 = 1, table.getn(p1) do
			_,p_name = GameApi.GetItemDBProp(p1[n1][1],1006,"修炼服务名")
			LogPrint(p_name)
			LogPrint(p1[n1][2])
		end
	end
	LogPrint("----------------------------------------------")
	LogPrint("2：已经完成的修炼服务")
	LogPrint("----------------------------------------------")
	if p2 then
		for n2 = 1, table.getn(p2) do
			_,p_name = GameApi.GetItemDBProp(p2[n2][1],1006,"修炼服务名")
			LogPrint(p_name)
			LogPrint(p2[n2][2])
		end
	end
	LogPrint("----------------------------------------------")
	LogPrint("3：未激活的修炼服务")
	LogPrint("----------------------------------------------")
	if p3 then
		for n3 = 1, table.getn(p3) do
			_,p_name = GameApi.GetItemDBProp(p3[n3][1],1006,"修炼服务名")
			LogPrint(p_name)
			LogPrint(p3[n3][2])
		end
	end
	-----------------------------------------------------------------------
	]]

	return practise[0],practise[1],practise[2]
end

-------------------------------------------
----------------修炼TIP显示----------------
-------------------------------------------
function SkillTip:GetPractiseTipAsVector(id)
	local skill_data = GameApi.GetSkillTable()
	local player_data = GameApi.GetPlayerBasicProp(0)
	local p_data = GetPractiseData(id)

	local prac_skillpack = p_data["skillpack"]
	local prac_skill = p_data["skill"]
	local prac_needlv_min = p_data["skill_min_lv"]
	local prac_needlv_max = p_data["skill_max_lv"]
	local prac_prof = p_data["prof"]
	local prac_type = p_data["type"]
	local prac_time = p_data["time"] * p_data["per"]
	local prac_probability = p_data["probability"]
	local prac_gongli = p_data["gongli"]
	local prac_needlv = p_data["min_lv"]
	local p_type = GetPractiseState(skill_data,player_data,p_data,-1)

	-->>Tip是否显示测试信息<< false不显示，true显示
	local isTestMode = false
	if TestShowItemId and TestShowItemId == 1 then
		isTestMode = true
	end

	-------------------
	--名字
	local tiptitle = --[[!AUTO_702]]""
	if isTestMode then tiptitle = string.format(--[[!AUTO_703]]"%s%s%s%s%s%s%s","",p_data["name"],COLOUR_NEW_11,--[[!AUTO_704]]"(",id,--[[!AUTO_705]]")",COLOUR_NEW_0)
	else tiptitle = string.format(--[[!AUTO_706]]"%s%s%s","",p_data["name"],COLOUR_NEW_0)
	end

	--图标
	local tipicon = --[[!AUTO_707]]""
	tipicon = GameApi.GetFileNameByID(p_data["icon"],DATA_PATH_MAN)
	local tipinf01 = --[[!AUTO_708]]""

	--第几重
	local prac_lv = 1
	if prac_skill > 0 then
		if skill_data[prac_skill] then prac_lv = skill_data[prac_skill] end
	end
	
	if p_type == 0 or p_type == 1 then
		if SKILL_LEVEL_TEXT[prac_lv] then
			tipinf01 = string.format(--[[!AUTO_709]]"%s%s%s",COLOUR_NEW_0,string.format(PRACDESC_PRACTISE_LEVEL,prac_lv),COLOUR_NEW_0)
		else tipinf01 = string.format(--[[!AUTO_710]]"%s%s%s",COLOUR_NEW_0,string.format(PRACDESC_PRACTISE_LEVEL,prac_lv),COLOUR_NEW_0) end
	else
		tipinf01 = string.format(--[[!AUTO_711]]"%s%s%s",COLOUR_NEW_9,PRACDESC_PRACTISE_NOACTIVE,COLOUR_NEW_0)
	end
	--门派
	--[[
	local prof_mask = p_data["prof"]
	local prof_tab = {}
	local prof_color = ""
	for p_id = 0,31 do
		if prof_mask >= 2^(31-p_id) then
			prof_tab[31-p_id] = 1
			prof_mask = prof_mask - 2^(31-p_id)
		else prof_tab[31-p_id] = 0 end
	end
	if prof_tab[player_data.prof] ~= 1 then prof_color = COLOUR_NEW_9 else prof_color = COLOUR_NEW_0 end
	]]
	--if SKILL_PROFESSION[prac_prof] then
	--	tipinf01 = string.format(--[[!AUTO_712]]"%s\r%s%s%s",tipinf01,COLOUR_NEW_0,string.format(PRACDESC_PROFESSION_TITLE,string.format(--[[!AUTO_713]]"%s%s",COLOUR_NEW_0,SKILL_PROFESSION[prac_prof])),COLOUR_NEW_0)
	--else tipinf01 = string.format(--[[!AUTO_714]]"%s\r%s%s%s",tipinf01,COLOUR_NEW_0,string.format(PRACDESC_PROFESSION_TITLE,string.format(--[[!AUTO_715]]"%s%s",COLOUR_NEW_0,SKILL_PROFESSION[-1])),COLOUR_NEW_0) end
	--类别
	--if PRACTISE_TYPE_DESC[prac_type] and PRACTISE_TYPE_DESC[prac_type] ~= --[[!AUTO_716]]"" then
	--	tipinf01 = string.format(--[[!AUTO_717]]"%s\r%s%s%s",tipinf01,COLOUR_NEW_0,string.format(PRACDESC_PRACTISE_TYPE,PRACTISE_TYPE_DESC[prac_type]),COLOUR_NEW_0)
	--end
	--时长
	if prac_time >= 3600 then
		tipinf01 = string.format(--[[!AUTO_718]]"%s\r%s%s%s",tipinf01,COLOUR_NEW_0,string.format(PRACDESC_PRACTISE_TIME,string.format(--[[!AUTO_719]]"%s%s",math.floor(prac_time/3600),PRACDESC_HOUR)),COLOUR_NEW_0)
	elseif prac_time >= 60 then
		tipinf01 = string.format(--[[!AUTO_720]]"%s\r%s%s%s",tipinf01,COLOUR_NEW_0,string.format(PRACDESC_PRACTISE_TIME,string.format(--[[!AUTO_721]]"%s%s",math.floor(prac_time/60),PRACDESC_MINUTE)),COLOUR_NEW_0)
	elseif prac_time >= 0 then
		tipinf01 = string.format(--[[!AUTO_722]]"%s\r%s%s%s",tipinf01,COLOUR_NEW_0,string.format(PRACDESC_PRACTISE_TIME,string.format(--[[!AUTO_723]]"%s%s",prac_time,PRACDESC_SECOND)),COLOUR_NEW_0)
	end

	--（暂时不用）
	local tipinf02 = --[[!AUTO_724]]""
	local tipinf03 = --[[!AUTO_725]]""
	local tipstar = --[[!AUTO_726]]"-1_0"

	--（暂时不用）
	local tiplimitleft, tiplimitright = --[[!AUTO_727]]"",--[[!AUTO_728]]""

	--消耗功力，成功机率
	local tiplimitskill = --[[!AUTO_729]]""
	if p_type == 0 then
		if prac_skill > 0 then
			local lv = 0
			if skill_data[prac_skill] then
				if skill_data[prac_skill] > 20 then lv = 20
				else lv = skill_data[prac_skill] end
			end
			tiplimitskill = string.format(--[[!AUTO_730]]"%s%s%s",COLOUR_NEW_8,string.format(PRACDESC_USE_GONGLI,GetNumColour(prac_gongli[lv]*p_data["per"])),COLOUR_NEW_0)
			tiplimitskill = string.format(--[[!AUTO_731]]"%s\r%s%s%s",tiplimitskill,COLOUR_NEW_8,string.format(PRACDESC_SUCCEED_PROBABILITY,GetNumColour(string.format(--[[!AUTO_732]]"%s%s",GetPractiseProText(prac_probability[lv]*100),--[[!AUTO_733]]""))),COLOUR_NEW_0)
		else
			tiplimitskill = string.format(--[[!AUTO_734]]"%s%s%s",COLOUR_NEW_8,string.format(PRACDESC_USE_GONGLI,GetNumColour(prac_gongli[0]*p_data["per"])),COLOUR_NEW_0)
			tiplimitskill = string.format(--[[!AUTO_735]]"%s\r%s%s%s",tiplimitskill,COLOUR_NEW_8,string.format(PRACDESC_SUCCEED_PROBABILITY,GetNumColour(string.format(--[[!AUTO_736]]"%s%s",GetPractiseProText(prac_probability[0]*100),--[[!AUTO_737]]""))),COLOUR_NEW_0)
		end
	end

	--修炼功能描述
	local tipstrengthen = --[[!AUTO_738]]""
	if GetPractiseState(skill_data,player_data,p_data,-1) ~= 1 then
		--修炼作用
		if PRACTISE_PER_DESC[id] and PRACTISE_PER_DESC[id] ~= --[[!AUTO_739]]"" then
			tipstrengthen = string.format(--[[!AUTO_740]]"%s%s%s%s%s",COLOUR_NEW_5,PRACDESC_DETAIL_TITLE,COLOUR_NEW_0,PRACTISE_PER_DESC[id],COLOUR_NEW_0)
		else
			if PRACTISE_DETAIL_DESC[prac_type] and PRACTISE_DETAIL_DESC[prac_type] ~= --[[!AUTO_741]]"" then
				tipstrengthen = string.format(--[[!AUTO_742]]"%s%s%s%s%s",COLOUR_NEW_5,PRACDESC_DETAIL_TITLE,COLOUR_NEW_0,SetPractiseWildcardText(p_data,PRACTISE_DETAIL_DESC[prac_type],nil),COLOUR_NEW_0)
			end
		end
	end

	--修炼技能效果




	local tipdesc = --[[!AUTO_743]]""
	local v_tab = nil
	local v_tab_now,v_tab_next = {},{}
	if PRACTISE_SKILL_EFFECT[prac_skill] then
		if PRACTISE_SKILL_EFFECT[prac_skill].val and table.getn(PRACTISE_SKILL_EFFECT[prac_skill].val) > 0 then
			v_tab = PRACTISE_SKILL_EFFECT[prac_skill].val
		end
	end
	if prac_skill > 0 then
		LogPrint(prac_skill)
		if PRACTISE_SKILL_EFFECT[prac_skill].text and PRACTISE_SKILL_EFFECT[prac_skill].text ~= --[[!AUTO_744]]"" then
			local s_lv = 0
			if skill_data[prac_skill] then s_lv = skill_data[prac_skill] end
			if p_type == 0 or p_type == 1 then
				tipdesc = string.format(--[[!AUTO_745]]"%s%s%s",COLOUR_NEW_8,PRACDESC_NOWLEVEL_TITLE,COLOUR_NEW_0)
				for i = 1, table.getn(v_tab) do
					v_tab_now[i] = v_tab[i]*s_lv
				end
				tipdesc = string.format(--[[!AUTO_746]]"%s%s",tipdesc,SetPractiseWildcardText(p_data,PRACTISE_SKILL_EFFECT[prac_skill].text,v_tab_now))
			end
			if p_type == 0 then
				tipdesc = string.format(--[[!AUTO_747]]"%s\r%s%s%s",tipdesc,COLOUR_NEW_8,PRACDESC_NEXTLEVEL_TITLE,COLOUR_NEW_0)
				for p = 1, table.getn(v_tab) do
					v_tab_next[p] = v_tab[p]*(s_lv+1)
				end
				tipdesc = string.format(--[[!AUTO_748]]"%s%s",tipdesc,SetPractiseWildcardText(p_data,PRACTISE_SKILL_EFFECT[prac_skill].text,v_tab_next))
			end
		end
	end

	--修炼特殊提示
	local tipremark = --[[!AUTO_749]]""
	if p_type == 1 then
		tipremark = string.format(--[[!AUTO_750]]"%s%s%s",COLOUR_NEW_10,PRACPROMPT_LEVEL_MAX,COLOUR_NEW_0)
	elseif p_type == 2 then
		if player_data.level < prac_needlv then
			tipremark = string.format(--[[!AUTO_751]]"%s%s%s",COLOUR_NEW_10,string.format(PRACPROMPT_LEVEL_NOTENOUGH,prac_needlv),COLOUR_NEW_0)
		elseif prac_skillpack > 0 then
			local packinfo = GetSkillPackData(prac_skillpack)
			local pack_islearn = true
			if packinfo.number > 0 then
				for i = 1 , packinfo.number do
					if not skill_data[packinfo.skill_id[i]] then
						pack_islearn = false
						break
					end
				end
			end
			if not pack_islearn then
				tipremark = string.format(--[[!AUTO_752]]"%s%s%s",COLOUR_NEW_10,string.format(PRACPROMPT_NEED_LEARNSKILL,packinfo.name),COLOUR_NEW_0)
			elseif prac_skill > 0 and not skill_data[prac_skill] then
				if PRACTISE_SKILL_EFFECT[prac_skill].iditem then
					local id_item = PRACTISE_SKILL_EFFECT[prac_skill].iditem
					tipremark = string.format(--[[!AUTO_753]]"%s%s%s",COLOUR_NEW_10,string.format(PRACPROMPT_NEED_ITEM,GameApi.GetItemName(id_item)),COLOUR_NEW_0)
				end
			end
		end
	end

	-------------------
	local practise_desctip = {}
	practise_desctip["title"] = tiptitle
	practise_desctip["icon"] = tipicon
	practise_desctip["info1"] = tipinf01
	practise_desctip["info2"] = tipinf02
	practise_desctip["info3"] = tipinf03
	practise_desctip["star"] = tipstar
	practise_desctip["limitleft"] = tiplimitleft
	practise_desctip["limitright"] = tiplimitright
	practise_desctip["limitskill"] = tiplimitskill
	practise_desctip["strengthen"] = tipstrengthen
	practise_desctip["desc"] = tipdesc
	practise_desctip["remark"] = tipremark
	return practise_desctip
end

function GetPractiseProText(pro)
	if pro >= 50 then
		return PRACDESC_PROBABILITY_TEXT[1]
	elseif pro >= 30 then
		return PRACDESC_PROBABILITY_TEXT[2]
	elseif pro >= 10 then
		return PRACDESC_PROBABILITY_TEXT[3]
	else
		return PRACDESC_PROBABILITY_TEXT[4]
	end
end

------------------------------------------------------------------------------------------------------------------
--------------------------------------宠物用功能函数--------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------
--宠物技能描述函数




function SkillTip:GetPetSkillTip(idSkill,level,mode)
	local tiptitle = --[[!AUTO_754]]""
	local tipicon = --[[!AUTO_755]]""
	local tipinf01 = --[[!AUTO_756]]""
	local tipinf02 = --[[!AUTO_757]]""
	local tipinf03 = --[[!AUTO_758]]""
	local tipstar = --[[!AUTO_759]]""
	local tiplimitleft = --[[!AUTO_760]]""
	local tiplimitright = --[[!AUTO_761]]""
	local tiplimitskill = --[[!AUTO_762]]""
	local tipdesc = --[[!AUTO_763]]""
	local tipremark = --[[!AUTO_764]]""
	local tiplabmoney = --[[!AUTO_765]]""
	local tipmoney1 = --[[!AUTO_766]]""
	local tipmoney2 = --[[!AUTO_767]]""
	local tipmoney3 = --[[!AUTO_768]]""
	local tipmoney4 = --[[!AUTO_769]]""
	local tiplabfame = --[[!AUTO_770]]""
	local tipfame = --[[!AUTO_771]]""
	local tiplabexchange = --[[!AUTO_772]]""
	local tipexchange = --[[!AUTO_773]]""
	local tipexchangepic = --[[!AUTO_774]]""
	local tiplabxcash = --[[!AUTO_775]]""
	local tipgold1 = --[[!AUTO_776]]""
	local tipgold2 = --[[!AUTO_777]]""
	local skill_essence = GameApi.GetSkillEssence(idSkill,level)
	local skill_type = 0
	local level_limit
	local enhance_id
	local enhance_level = 0
	local flag = false

	tiptitle = string.format(--[[!AUTO_778]]"%s%s",COLOUR_NEW_0,skill_essence["display_name"])
	tipicon = GameApi.GetFileNameByID(skill_essence["icon_path"],SKILL_PATH_MAN)

	if PET_SKILL_DESC[idSkill] then
		skill_type = PET_SKILL_DESC[idSkill].skilltype
		if skill_type == 7 or skill_type ==8 then
			tipinf01 = string.format(--[[!AUTO_779]]"类型：%s",GetPetSkillType(idSkill,level,skill_essence))
			--tipinf02 = ""
		elseif skill_type == 1 then
			tipinf01 = string.format(--[[!AUTO_780]]"类型：%s\r%s\r距离：%s",GetPetSkillType(idSkill,level,skill_essence),GetPetSkillCoolDown(idSkill,level,skill_essence),GetPetSkillCastDistance(idSkill,level,skill_essence),GetPetSkillCost(idSkill,skill_essence))
			--tipinf02 = string.format("%s\r%s\r%s"," ",GetPetSkillCastDistance(idSkill,level,skill_essence),GetPetSkillCost(idSkill,skill_essence))
		elseif skill_type == 9 then
			tipinf01 = string.format(--[[!AUTO_781]]"类型：%s\r%s\r距离：%s",GetPetSkillType(idSkill,level,skill_essence),GetPetSkillPrayTime(idSkill,level,skill_essence),GetPetSkillCastDistance(idSkill,level,skill_essence),PET_SKILL_CAST_TIEM[idSkill])
			--tipinf02 = string.format("%s\r%s\r"," ",GetPetSkillCastDistance(idSkill,level,skill_essence))
		elseif skill_type == 10 then
			tipinf01 = string.format(--[[!AUTO_782]]"类型：%s",GetPetSkillType(idSkill,level,skill_essence))
		else
			tipinf01 = string.format(--[[!AUTO_783]]"类型：%s\r%s\r距离：%s",GetPetSkillType(idSkill,level,skill_essence),GetPetSkillCoolDown(idSkill,level,skill_essence),GetPetSkillCastDistance(idSkill,level,skill_essence))
			--tipinf02 = string.format("%s\r%s\r"," ",GetPetSkillCastDistance(idSkill,level,skill_essence))
		end
		if skill_essence["intonate_limit_mp"][3] > 0 then
			tipinf01 = string.format("%s\r怒气：%s点",tipinf01,skill_essence["intonate_limit_mp"][3])
		end
	else
		tipinf01 = --[[!AUTO_784]]""
		tipinf02 = --[[!AUTO_785]]""
	end

	tipstar = GetTipstar(idSkill,level)
	tiplimitskill = GetPetSkillIsAuto(idSkill)

	if skill_type == 8 or skill_type == 9 then
		level_limit = 20
	else
		level_limit = 5
	end

	tipdesc = string.format(--[[!AUTO_786]]"%s%s\r%s",PET_SKILL_COLOR[1],PET_SKILL_LEVEL[level],GetPetSkillDescText(idSkill,level))
	if level < level_limit then
		if mode == 1 then
			tipdesc = string.format(--[[!AUTO_787]]"%s\r\r%s\r%s",tipdesc,PET_SKILL_TEMP_TEXT01,GetPetSkillDescText(idSkill,level+1))
		end
	else
		tipdesc = string.format(--[[!AUTO_788]]"%s\r\r%s",tipdesc,PET_SKILL_TEMP_TEXT02)
	end

	--宠物强化技能文字




	if PET_SKILL_DESC[idSkill] and PET_SKILL_DESC[idSkill].idenhance > 0 then
		enhance_id = PET_SKILL_DESC[idSkill].idenhance
		local fs_list = GameApi.GetPetFightSkill(iPetIndex)
		local i
		for i = 2, 4 do
			if PETAI_FIGHT_SKILL_LIST[i] and PETAI_FIGHT_SKILL_LIST[i]["id"] == enhance_id then --PETAI_FIGHT_SKILL_LIST引自Pet_ai.lua
				flag = true
				enhance_level = PETAI_FIGHT_SKILL_LIST[i]["level"]
				break
			end
		end
		--tipdesc = string.format("%s\r\r%s",tipdesc,GetPetSkillEnhanceText(idSkill,level,skill_essence,flag,enhance_level))
	end

	--怒气技升级提示文字
	if PET_SKILL_DESC[idSkill] and PET_SKILL_DESC[idSkill].skilltype == 1 then
		--tipdesc = string.format("%s\r\r%s",tipdesc,PET_XPSKILL_LEVEL_UP[level])
	end

	if mode == 1 then
		tipdesc = string.format(--[[!AUTO_789]]"%s\r \r%s",tipdesc,PET_SKILL_TEMP_TEXT04)
	elseif mode == 0 then
		tipdesc = string.format(--[[!AUTO_790]]"%s\r \r%s",tipdesc,PET_SKILL_TEMP_TEXT03)
	end

	tipremark = string.format(--[[!AUTO_791]]"%s%s\r",PET_SKILL_COLOR[2],GetPetTipremark(idSkill,level,mode))

	local petskill_desctip = {}
	petskill_desctip["title"] = tiptitle
	petskill_desctip["icon"] = tipicon
	petskill_desctip["info1"] = tipinf01
	petskill_desctip["info2"] = tipinf02
	petskill_desctip["info3"] = tipinf03
	petskill_desctip["star"] = tipstar
	petskill_desctip["limitleft"] = tiplimitleft
	petskill_desctip["limitright"] = tiplimitright
	petskill_desctip["limitskill"] = tiplimitskill
	petskill_desctip["desc"] = tipdesc
	petskill_desctip["remark"] = tipremark

	return petskill_desctip
	--return tiptitle,tipicon,tipinf01,tipinf02,tipinf03,tipstar,tiplimitleft,tiplimitright,tiplimitskill,tipdesc,tipremark,tiplabmoney,tipmoney1,tipmoney2,tipmoney3,tipmoney4,tiplabfame,tipfame,tiplabexchange,tipexchange,tipexchangepic,tiplabxcash,tipgold1,tipgold2
end

--返回宠物技能类型




function GetPetSkillType(idSkill,level,skill_essence)
	local class_id = skill_essence["class_id"]

	--[[if PET_SKILL_DESC[idSkill] and class_id ~= 14 then
		return PET_SKILL_TYPE[PET_SKILL_DESC[idSkill].skilltype]
	elseif class_id == 14 then
		return PET_SKILL_TYPE[PET_SKILL_DESC[idSkill].skilltype]
	end]]
	LogPrint(PET_SKILLCASTTYPE[1][1])
	for k,v in pairs(PET_SKILLCASTTYPE) do
		for i,j in pairs(v) do
			if j == idSkill then
				return PET_SKILL_SUBTYPE[k]
			end
		end
	end

	return --[[!AUTO_792]]""
end

--返回宠物技能吟唱时间




function GetPetSkillPrayTime(idSkill,level,skill_essence)
	local skill_process
	local class_id = skill_essence["class_id"]

	if class_id ~= 14 then
		skill_process = GameApi.GetSkillProcess(idSkill,0,level)
		if skill_process["duration"] == 0 then
			return PET_SKILL_PRAYTIME[1]
		else
			return string.format(PET_SKILL_PRAYTIME[2],skill_process["duration"]/1000)
		end
	else
		skill_process = GameApi.GetSkillProcess(idSkill,0,level)
		if level <= 0 then
			return --[[!AUTO_793]]""
		else
			return string.format(PET_SKILL_PRAYTIME[2],skill_process["duration"]/1000)
		end
	end
end

--返回宠物技能冷却时间




function GetPetSkillCoolDown(idSkill,level,skill_essence)
	local class_id = skill_essence["class_id"]

	if class_id == 29 or level <= 0 then
		return --[[!AUTO_794]]""
	elseif skill_essence["cooldown_single_time"] >= 3600000 then
		return string.format(PET_SKILL_COOLDOWN[2],skill_essence["cooldown_single_time"]/3600000,PET_TIME_UNIT[1])
	elseif skill_essence["cooldown_single_time"] >= 60000 then
		return string.format(PET_SKILL_COOLDOWN[2],skill_essence["cooldown_single_time"]/60000,PET_TIME_UNIT[2])
	elseif skill_essence["cooldown_single_time"] > 0 then
		return string.format(PET_SKILL_COOLDOWN[2],skill_essence["cooldown_single_time"]/1000,PET_TIME_UNIT[3])
	else
		return --[[!AUTO_795]]""
	end
end

--返回宠物技能施放距离




function GetPetSkillCastDistance(idSkill,level,skill_essence)
	local class_id = skill_essence["class_id"]
	if class_id ~= 29 and level > 0 then
		return string.format(PET_SKILL_CAST_DISTANCE,skill_essence["auto_move_distance"])
	else
		return --[[!AUTO_796]]""
	end
end
--返回宠物技能消耗




function GetPetSkillCost(idSkill,skill_essence)
	--[[if skill_essence["intonate_limit_mp"][3] > 0 then
		return string.format(PET_SKILL_COST[2],skill_essence["intonate_limit_mp"][3])
	else
		return PET_SKILL_COST[1]
	end]]
	return --[[!AUTO_797]]""
end

--返回技能是否自动施放描述




function GetPetSkillIsAuto(idSkill)
	if PetAI.SkillCfg[idSkill] then
		if PetAI.SkillCfg[idSkill].CastType == PetSkillCastType.AUTO then
			return PET_SKILL_CAST_AUTO_DESC
		elseif PetAI.SkillCfg[idSkill].CastType == PetSkillCastType.MANUAL then
			return PET_SKILL_CAST_MANUAL_DESC
		elseif PetAI.SkillCfg[idSkill].CastType == PetSkillCastType.PASSIVE then
			if PET_SKILL_DESC[idSkill] and PET_SKILL_DESC[idSkill].skilltype == 7 then
				return PET_SKILL_CAST_GENIUS_DESC
			else
				return PET_SKILL_CAST_PASSIVE_DESC
			end
		end
	elseif idSkill == 315 or idSkill == 316 or idSkill == 317 then
		return PET_SKILL_CAST_CATCH_DESC
	else
		return --[[!AUTO_798]]""
	end
end

--返回宠物技能强化文字描述




function GetPetSkillEnhanceText(idSkill,level,skill_essence,flag,enhance_level)
	--[[if PET_SKILL_DESC[idSkill] and PET_SKILL_DESC[idSkill].idenhance > 0 then
		local skill_name = skill_essence["display_name"]
		local enhance_essence = GameApi.GetSkillEssence(PET_SKILL_DESC[idSkill].idenhance,1)
		local enhance_name = enhance_essence["display_name"]

		if flag == true then
			return string.format(PET_ENHANCE_SKILL_DESC[1],enhance_level,enhance_name)
		else
			return string.format(PET_ENHANCE_SKILL_DESC[2],enhance_name)
		end
	else

	end]]
	return --[[!AUTO_799]]""
end

--返回宠物技能描述文字




function GetPetTipremark(idSkill,level,mode)
	if PET_SKILL_DESC[idSkill] then
		return PET_SKILL_DESC[idSkill].desc
	else
		return --[[!AUTO_800]]""
	end
end

--技能描述文字通配符：
--伤害点数：#d#
--倍率：#ra#
--范围：#r#
--状态：#s#
--破绽值：#p#
--强化：#qh#
--状态持续时间：#st#
--状态参数1：#sv1#
--状态参数2：#sv2#
--状态参数3：#sv3#
--复活百分比：#rv#
--捕捉技能冷却时间：#cd#
--自身与目标等级差：#lv#
PET_SKILL_CHAR_DAMAGE = --[[!AUTO_801]]"#d#"
PET_SKILL_CHAR_RATIO = --[[!AUTO_802]]"#ra#"
PET_SKILL_CHAR_RANGE = --[[!AUTO_803]]"#r#"
PET_SKILL_CHAR_STATE = --[[!AUTO_804]]"#s#"
PET_SKILL_CHAR_POZHAN = --[[!AUTO_805]]"#p#"
PET_SKILL_CHAR_ENHANCE = --[[!AUTO_806]]"#qh#"
PET_SKILL_CHAR_STATE_TIME = --[[!AUTO_807]]"#st#"
PET_SKILL_CHAR_STATE_VAR1 = --[[!AUTO_808]]"#sv1#"
PET_SKILL_CHAR_STATE_VAR2 = --[[!AUTO_809]]"#sv2#"
PET_SKILL_CHAR_STATE_VAR3 = --[[!AUTO_810]]"#sv3#"
PET_SKILL_CHAR_REVIVE = --[[!AUTO_811]]"#rv#"
PET_SKILL_CHAR_PRAYTIME = --[[!AUTO_812]]"#pt#"
PET_SKILL_CHAR_LEVEL = --[[!AUTO_813]]"#lv#"

--返回宠物技能数值描述文字




function GetPetSkillDescText(idSkill,level)
	local skill_essence = GameApi.GetSkillEssence(idSkill,level)
	local class_id = skill_essence["class_id"]
	local skill_process
	local skill_state
	local id_perform
	local damage_text
	local ratio_text
	local range_text
	local state_text
	local pozhan_text
	local enhance_text
	local state_time_text
	local state_var1_text
	local state_var2_text
	local state_var3_text
	local revive_text
	local desc_text
	local i,j

	if skill_essence["process_id"][1] ~= 0 and PET_SKILL_DESC[idSkill] and PET_SKILL_DESC[idSkill] ~= --[[!AUTO_814]]"" and class_id ~= 29 and class_id ~= 14 then
		if PET_SKILL_DESC[idSkill].skilltype == 10 then
			id_perform = 0
		else
			id_perform = 1
		end
		skill_process = GameApi.GetSkillProcess(idSkill,id_perform,level)
		desc_text = PET_SKILL_DESC[idSkill].skilltext

		i,j = string.find(desc_text,PET_SKILL_CHAR_DAMAGE)
		if i and j then
			damage_text = math.ceil(skill_process["self_account_data"][1])
			desc_text = string.gsub(desc_text,PET_SKILL_CHAR_DAMAGE,damage_text)
		end
		i,j = string.find(desc_text,PET_SKILL_CHAR_RATIO)
		if i and j then
			ratio_text = string.format(--[[!AUTO_815]]"%s%s", math.ceil(skill_process["self_account_data"][2]*100),--[[!AUTO_816]]"%%")
			desc_text = string.gsub(desc_text,PET_SKILL_CHAR_RATIO,ratio_text)
		end
		i,j = string.find(desc_text,PET_SKILL_CHAR_RANGE)
		if i and j then
			range_text = skill_process["target_affect_radius"]
			desc_text = string.gsub(desc_text,PET_SKILL_CHAR_RANGE,range_text)
		end
		i,j = string.find(desc_text,PET_SKILL_CHAR_POZHAN)
		if i and j then
			pozhan_text = skill_process["target_account_data"][4]
			desc_text = string.gsub(desc_text,PET_SKILL_CHAR_POZHAN,pozhan_text)
		end
		i,j = string.find(desc_text,PET_SKILL_CHAR_STATE_TIME)
		if i and j then
			local state_time = skill_process["states"][1]["state_time"]
			if state_time >= 3600000 then
				state_time_text = string.format(--[[!AUTO_817]]"%s%s",state_time/3600000,PET_TIME_UNIT[1])
			elseif state_time >= 60000 then
				state_time_text = string.format(--[[!AUTO_818]]"%s%s",state_time/60000,PET_TIME_UNIT[2])
			elseif state_time > 0 then
				state_time_text = string.format(--[[!AUTO_819]]"%s%s",state_time/1000,PET_TIME_UNIT[3])
			else
				state_time_text = --[[!AUTO_820]]"0"
			end
			desc_text = string.gsub(desc_text,PET_SKILL_CHAR_STATE_TIME,state_time_text)
		end
		i, j = string.find(desc_text,PET_SKILL_CHAR_STATE_VAR1)
		if i and j then
			state_var1_text = math.ceil(skill_process["states"][1]["state_param"][1])
			desc_text = string.gsub(desc_text,PET_SKILL_CHAR_STATE_VAR1,state_var1_text)
		end
		i, j = string.find(desc_text,PET_SKILL_CHAR_STATE_VAR2)
		if i and j then
			state_var2_text = math.ceil(skill_process["states"][1]["state_param"][2])
			desc_text = string.gsub(desc_text,PET_SKILL_CHAR_STATE_VAR2,state_var2_text)
		end
		i ,j = string.find(desc_text,PET_SKILL_CHAR_STATE_VAR3)
		if i and j then
			state_var3_text = math.ceil(skill_process["states"][1]["state_param"][3])
			desc_text = string.gsub(desc_text,PET_SKILL_CHAR_STATE_VAR3,state_var3_text)
		end
		i ,j = string.find(desc_text,PET_SKILL_CHAR_REVIVE)
		if i and j then
			revive_text = string.format(--[[!AUTO_821]]"%s%s",math.ceil(skill_process["states"][1]["state_param"][1]*100),--[[!AUTO_822]]"%%")
			desc_text = string.gsub(desc_text,PET_SKILL_CHAR_REVIVE,revive_text)
		end
		return desc_text
	elseif class_id == 29 and PET_SKILL_DESC[idSkill] ~= --[[!AUTO_823]]"" then
		id_perform = 0
		skill_process = GameApi.GetSkillProcess(idSkill,id_perform,level)
		desc_text = PET_SKILL_DESC[idSkill].skilltext

		i ,j = string.find(desc_text,PET_SKILL_CHAR_ENHANCE)
		if i and j then
			enhance_text = PET_SKILL_ENHANCE_RATIO[level]
			desc_text = string.gsub(desc_text,PET_SKILL_CHAR_ENHANCE,enhance_text)
		end
		i ,j = string.find(desc_text,PET_SKILL_CHAR_STATE_VAR1)
		if i and j then
			state_var1_text = skill_process["states"][1]["state_param"][1]
			desc_text = string.gsub(desc_text,PET_SKILL_CHAR_STATE_VAR1,state_var1_text)
		end
		return desc_text
	elseif class_id == 14 and PET_SKILL_DESC[idSkill] ~= --[[!AUTO_824]]"" then
		local praytime_text
		local level_text = --[[!AUTO_825]]""

		id_perform = 0
		skill_process = GameApi.GetSkillProcess(idSkill,id_perform,level)
		desc_text = PET_SKILL_DESC[idSkill].skilltext

		i ,j = string.find(desc_text,PET_SKILL_CHAR_PRAYTIME)
		if i and j then
			praytime_text = skill_process["duration"]/1000
			desc_text = string.gsub(desc_text,PET_SKILL_CHAR_PRAYTIME,praytime_text)
		end
		i ,j = string.find(desc_text,--[[!AUTO_826]]"#suc#")
		if i and j then
			if idSkill == 315 then
				level_text = string.format(--[[!AUTO_827]]"%s",30+(level-1)*2.5)
			elseif idSkill == 316 or idSkill == 317 then
				level_text = string.format(--[[!AUTO_828]]"%s",25+(level-1)*2.5)
			end
			desc_text = string.gsub(desc_text,--[[!AUTO_829]]"#suc#",level_text)
		end
		return desc_text
	else
		return --[[!AUTO_830]]""
	end
end

--宠物生活技能描述




function SkillTip:GetPetLiveSkill(index)
	local pet_liveskill_tip = {}

	pet_liveskill_tip["title"] = string.format(--[[!AUTO_831]]"%s%s",COLOUR_NEW_0,PET_LIVESKILL_NAME[index])
	pet_liveskill_tip["icon"] = PET_LIVESKILL_ICON[index]
	pet_liveskill_tip["info1"] = string.format(--[[!AUTO_832]]"%s\r%s",PET_LIVESKILL_TYPE,PET_LIVESKILL_COST[index])
	--pet_liveskill_tip["limitskill"] = PET_LIVESKILL_COST[index]
	pet_liveskill_tip["desc"] = string.format(--[[!AUTO_833]]"%s%s",PET_SKILL_COLOR[1],PET_LIVESKILL_TEXT[index])
	pet_liveskill_tip["remark"] = string.format(--[[!AUTO_834]]"%s%s",PET_SKILL_COLOR[2],PET_LIVESKILL_DESC[index])

	return pet_liveskill_tip
end

--视频文件配置
SkillTip.VideoPath =
{
	WuXue =
	{
		[38094] = --[[!AUTO_835]]"music\\video\\38094.avi",	--江湖拳法通用

		[38095] = --[[!AUTO_836]]"music\\video\\38095.avi",	--少林棍法通用
		[38096] = --[[!AUTO_837]]"music\\video\\38096.avi",	--武当剑法通用
		[38097] = --[[!AUTO_838]]"music\\video\\38097.avi",	--华山剑法通用
		[38098] = --[[!AUTO_839]]"music\\video\\38098.avi",	--恒山剑法通用
		[38099] = --[[!AUTO_840]]"music\\video\\38099.avi",	--衡山气功通用
		[38100] = --[[!AUTO_841]]"music\\video\\38100.avi",	--日月刀法通用
		[38101] = --[[!AUTO_842]]"music\\video\\38101.avi",	--五仙鞭法通用
		[38102] = --[[!AUTO_843]]"music\\video\\38102.avi",	--逍遥扇法通用
		[38103] = --[[!AUTO_844]]"music\\video\\38103.avi",	--唐门暗器通用
		[38104] = --[[!AUTO_845]]"music\\video\\38104.avi",	--峨嵋气功通用

		[23127] = --[[!AUTO_846]]"music\\video\\23127.avi",	--少林普渡杖法通用
		[23128] = --[[!AUTO_847]]"music\\video\\23128.avi",	--少林罗汉拳法通用

		[23132] = --[[!AUTO_848]]"music\\video\\23132.avi",	--武当太极剑法通用
		[23133] = --[[!AUTO_849]]"music\\video\\23133.avi",	--武当真武剑法通用

		[23137] = --[[!AUTO_850]]"music\\video\\23137.avi",	--华山剑宗武学通用
		[23138] = --[[!AUTO_851]]"music\\video\\23138.avi",	--华山气宗武学通用

		[23142] = --[[!AUTO_852]]"music\\video\\23142.avi",	--恒山绵针剑法通用
		[23143] = --[[!AUTO_853]]"music\\video\\23143.avi",	--恒山万花剑法通用

		[23147] = --[[!AUTO_854]]"music\\video\\23147.avi",	--衡山回风落雁剑通用
		[23148] = --[[!AUTO_855]]"music\\video\\23148.avi",	--衡山百变幻雾剑通用

		[23152] = --[[!AUTO_856]]"music\\video\\23152.avi",	--日月擒月刀法通用
		[23153] = --[[!AUTO_857]]"music\\video\\23153.avi",	--日月逐日刀法通用

		[23157] = --[[!AUTO_858]]"music\\video\\23157.avi",	--五仙金蛇鞭法通用
		[23158] = --[[!AUTO_859]]"music\\video\\23158.avi",	--五仙融血秘咒通用

		[23162] = --[[!AUTO_860]]"music\\video\\23162.avi",	--逍遥小无相功通用
		[23163] = --[[!AUTO_861]]"music\\video\\23163.avi",	--逍遥折梅寒手通用

		[23167] = --[[!AUTO_862]]"music\\video\\23167.avi",	--唐门满天花雨通用
		[23168] = --[[!AUTO_863]]"music\\video\\23168.avi",	--唐门霹雳雷火通用

		[23172] = --[[!AUTO_864]]"music\\video\\23172.avi",	--峨嵋九阴真经通用
		[23173] = --[[!AUTO_865]]"music\\video\\23173.avi",	--峨嵋九阳神功通用

		[88441] = --[[!AUTO_845]]"music\\video\\88441.avi",	--独孤独孤刀法
		[88442] = --[[!AUTO_845]]"music\\video\\88442.avi",	--独孤九溟神功
	},
	WuXueName =
	{
		[38094] = --[[!AUTO_866]]"江湖拳法",	--江湖拳法通用

		[38095] = --[[!AUTO_867]]"少林棍法",	--少林棍法通用
		[38096] = --[[!AUTO_868]]"武当剑法",	--武当剑法通用
		[38097] = --[[!AUTO_869]]"华山剑法",	--华山剑法通用
		[38099] = --[[!AUTO_870]]"衡山气功",	--恒山剑法通用
		[38098] = --[[!AUTO_871]]"恒山剑法",	--衡山气功通用
		[38100] = --[[!AUTO_872]]"日月刀法",	--日月刀法通用
		[38101] = --[[!AUTO_873]]"五仙鞭法",	--五仙鞭法通用
		[38102] = --[[!AUTO_874]]"逍遥扇法",	--逍遥扇法通用
		[38103] = --[[!AUTO_875]]"唐门暗器",	--唐门暗器通用
		[38104] = --[[!AUTO_876]]"峨嵋气功",	--峨嵋气功通用
		[88441] = --[[!AUTO_876]]"独孤刀法",	--独孤刀法通用

		[23127] = --[[!AUTO_877]]"普渡杖法",	--少林普渡杖法通用
		[23128] = --[[!AUTO_878]]"罗汉拳法",	--少林罗汉拳法通用

		[23132] = --[[!AUTO_879]]"太极剑法",	--武当太极剑法通用
		[23133] = --[[!AUTO_880]]"真武剑法",	--武当真武剑法通用

		[23137] = --[[!AUTO_881]]"剑宗武学",	--华山剑宗武学通用
		[23138] = --[[!AUTO_882]]"气宗武学",	--华山气宗武学通用

		[23147] = --[[!AUTO_883]]"回风落雁剑",	--恒山绵针剑法通用
		[23148] = --[[!AUTO_884]]"百变幻雾剑",	--恒山万花剑法通用

		[23142] = --[[!AUTO_885]]"绵针剑法",	--衡山回风落雁剑通用
		[23143] = --[[!AUTO_886]]"万花剑法",	--衡山百变幻雾剑通用

		[23152] = --[[!AUTO_887]]"擒月刀法",	--日月擒月刀法通用
		[23153] = --[[!AUTO_888]]"逐日刀法",	--日月逐日刀法通用

		[23157] = --[[!AUTO_889]]"金蛇鞭法",	--五仙金蛇鞭法通用
		[23158] = --[[!AUTO_890]]"融血秘咒",	--五仙融血秘咒通用

		[23162] = --[[!AUTO_891]]"小无相功",	--逍遥小无相功通用
		[23163] = --[[!AUTO_892]]"天山六阳掌",	--逍遥折梅寒手通用

		[23167] = --[[!AUTO_893]]"漫天花雨",	--唐门满天花雨通用
		[23168] = --[[!AUTO_894]]"霹雳雷火",	--唐门霹雳雷火通用

		[23172] = --[[!AUTO_895]]"灭绝摧心手",	--峨嵋九阴真经通用
		[23173] = --[[!AUTO_896]]"金顶炎阳掌",	--峨嵋九阳神功通用

		[88442] = --[[!AUTO_896]]"九溟神功",	--独孤九溟神功通用
	},
	TaoLu =
	{
		--江湖拳法
		[18689] = --[[!AUTO_897]]"music\\video\\18689.avi",    --江湖拳法
		[18690] = --[[!AUTO_898]]"music\\video\\18690.avi",    --江湖脚法
		[38004] = --[[!AUTO_899]]"music\\video\\38004.avi",
		[38005] = --[[!AUTO_900]]"music\\video\\38005.avi",
		[38006] = --[[!AUTO_901]]"music\\video\\38006.avi",
		[38007] = --[[!AUTO_902]]"music\\video\\38007.avi",
		[38008] = --[[!AUTO_903]]"music\\video\\38008.avi",
		[38009] = --[[!AUTO_904]]"music\\video\\38009.avi",
		[38175] = --[[!AUTO_905]]"music\\video\\38175.avi",
		[38176] = --[[!AUTO_906]]"music\\video\\38176.avi",
		[38177] = --[[!AUTO_907]]"music\\video\\38177.avi",
		[38179] = --[[!AUTO_908]]"music\\video\\38179.avi",
		[38180] = --[[!AUTO_909]]"music\\video\\38180.avi",
		[38181] = --[[!AUTO_910]]"music\\video\\38181.avi",
		[38182] = --[[!AUTO_911]]"music\\video\\38182.avi",
		[38183] = --[[!AUTO_912]]"music\\video\\38183.avi",
		[38184] = --[[!AUTO_913]]"music\\video\\38184.avi",
		[38185] = --[[!AUTO_914]]"music\\video\\38185.avi",
		[38186] = --[[!AUTO_915]]"music\\video\\38186.avi",
		[38187] = --[[!AUTO_916]]"music\\video\\38187.avi",
		[38188] = --[[!AUTO_917]]"music\\video\\38188.avi",
		[38191] = --[[!AUTO_918]]"music\\video\\38191.avi",
		[38192] = --[[!AUTO_919]]"music\\video\\38192.avi",
		[38193] = --[[!AUTO_920]]"music\\video\\38193.avi",
		[38194] = --[[!AUTO_921]]"music\\video\\38194.avi",
		[38195] = --[[!AUTO_922]]"music\\video\\38195.avi",
		[38196] = --[[!AUTO_923]]"music\\video\\38196.avi",
		[38197] = --[[!AUTO_924]]"music\\video\\38197.avi",
		[38198] = --[[!AUTO_925]]"music\\video\\38198.avi",
		[72905] = --[[!AUTO_926]]"music\\video\\72905.avi",
		[38010] = --[[!AUTO_927]]"music\\video\\38010.avi",
		[38011] = --[[!AUTO_928]]"music\\video\\38011.avi",
		[38012] = --[[!AUTO_929]]"music\\video\\38012.avi",
		[38013] = --[[!AUTO_930]]"music\\video\\38013.avi",
		[38014] = --[[!AUTO_931]]"music\\video\\38014.avi",
		[38015] = --[[!AUTO_932]]"music\\video\\38015.avi",
		[38199] = --[[!AUTO_933]]"music\\video\\38199.avi",
		[38200] = --[[!AUTO_934]]"music\\video\\38200.avi",
		[38203] = --[[!AUTO_935]]"music\\video\\38203.avi",
		[38204] = --[[!AUTO_936]]"music\\video\\38204.avi",
		[38205] = --[[!AUTO_937]]"music\\video\\38205.avi",
		[38206] = --[[!AUTO_938]]"music\\video\\38206.avi",
		[38207] = --[[!AUTO_939]]"music\\video\\38207.avi",
		[38208] = --[[!AUTO_940]]"music\\video\\38208.avi",
		[38209] = --[[!AUTO_941]]"music\\video\\38209.avi",
		[38210] = --[[!AUTO_942]]"music\\video\\38210.avi",
		[38211] = --[[!AUTO_943]]"music\\video\\38211.avi",
		[38215] = --[[!AUTO_944]]"music\\video\\38215.avi",
		[38216] = --[[!AUTO_945]]"music\\video\\38216.avi",
		[38217] = --[[!AUTO_946]]"music\\video\\38217.avi",
		[38218] = --[[!AUTO_947]]"music\\video\\38218.avi",
		[38219] = --[[!AUTO_948]]"music\\video\\38219.avi",
		[38220] = --[[!AUTO_949]]"music\\video\\38220.avi",
		[38221] = --[[!AUTO_950]]"music\\video\\38221.avi",
		[38222] = --[[!AUTO_951]]"music\\video\\38222.avi",
		[38016] = --[[!AUTO_952]]"music\\video\\38016.avi",
		[38017] = --[[!AUTO_953]]"music\\video\\38017.avi",
		[38018] = --[[!AUTO_954]]"music\\video\\38018.avi",
		[38019] = --[[!AUTO_955]]"music\\video\\38019.avi",
		[38020] = --[[!AUTO_956]]"music\\video\\38020.avi",
		[38021] = --[[!AUTO_957]]"music\\video\\38021.avi",
		[38223] = --[[!AUTO_958]]"music\\video\\38223.avi",
		[38227] = --[[!AUTO_959]]"music\\video\\38227.avi",
		[38228] = --[[!AUTO_960]]"music\\video\\38228.avi",
		[38229] = --[[!AUTO_961]]"music\\video\\38229.avi",
		[38230] = --[[!AUTO_962]]"music\\video\\38230.avi",
		[38231] = --[[!AUTO_963]]"music\\video\\38231.avi",
		[38232] = --[[!AUTO_964]]"music\\video\\38232.avi",
		[38233] = --[[!AUTO_965]]"music\\video\\38233.avi",
		[38234] = --[[!AUTO_966]]"music\\video\\38234.avi",
		[38235] = --[[!AUTO_967]]"music\\video\\38235.avi",
		[38239] = --[[!AUTO_968]]"music\\video\\38239.avi",
		[38240] = --[[!AUTO_969]]"music\\video\\38240.avi",
		[38241] = --[[!AUTO_970]]"music\\video\\38241.avi",
		[38242] = --[[!AUTO_971]]"music\\video\\38242.avi",
		[38243] = --[[!AUTO_972]]"music\\video\\38243.avi",
		[38244] = --[[!AUTO_973]]"music\\video\\38244.avi",
		[38245] = --[[!AUTO_974]]"music\\video\\38245.avi",
		[38022] = --[[!AUTO_975]]"music\\video\\38022.avi",
		[38023] = --[[!AUTO_976]]"music\\video\\38023.avi",
		[38024] = --[[!AUTO_977]]"music\\video\\38024.avi",
		[38025] = --[[!AUTO_978]]"music\\video\\38025.avi",
		[38026] = --[[!AUTO_979]]"music\\video\\38026.avi",
		[38027] = --[[!AUTO_980]]"music\\video\\38027.avi",
		[38247] = --[[!AUTO_981]]"music\\video\\38247.avi",
		[38248] = --[[!AUTO_982]]"music\\video\\38248.avi",
		[38251] = --[[!AUTO_983]]"music\\video\\38251.avi",
		[38252] = --[[!AUTO_984]]"music\\video\\38252.avi",
		[38253] = --[[!AUTO_985]]"music\\video\\38253.avi",
		[38254] = --[[!AUTO_986]]"music\\video\\38254.avi",
		[38255] = --[[!AUTO_987]]"music\\video\\38255.avi",
		[38256] = --[[!AUTO_988]]"music\\video\\38256.avi",
		[38257] = --[[!AUTO_989]]"music\\video\\38257.avi",
		[38258] = --[[!AUTO_990]]"music\\video\\38258.avi",
		[38259] = --[[!AUTO_991]]"music\\video\\38259.avi",
		[38260] = --[[!AUTO_992]]"music\\video\\38260.avi",
		[38263] = --[[!AUTO_993]]"music\\video\\38263.avi",
		[38264] = --[[!AUTO_994]]"music\\video\\38264.avi",
		[38265] = --[[!AUTO_995]]"music\\video\\38265.avi",
		[38266] = --[[!AUTO_996]]"music\\video\\38266.avi",
		[38267] = --[[!AUTO_997]]"music\\video\\38267.avi",
		[38268] = --[[!AUTO_998]]"music\\video\\38268.avi",
		[38269] = --[[!AUTO_999]]"music\\video\\38269.avi",
		[38270] = --[[!AUTO_1000]]"music\\video\\38270.avi",
		[38028] = --[[!AUTO_1001]]"music\\video\\38028.avi",
		[38029] = --[[!AUTO_1002]]"music\\video\\38029.avi",
		[38030] = --[[!AUTO_1003]]"music\\video\\38030.avi",
		[38031] = --[[!AUTO_1004]]"music\\video\\38031.avi",
		[38032] = --[[!AUTO_1005]]"music\\video\\38032.avi",
		[38033] = --[[!AUTO_1006]]"music\\video\\38033.avi",
		[38271] = --[[!AUTO_1007]]"music\\video\\38271.avi",
		[38275] = --[[!AUTO_1008]]"music\\video\\38275.avi",
		[38276] = --[[!AUTO_1009]]"music\\video\\38276.avi",
		[38277] = --[[!AUTO_1010]]"music\\video\\38277.avi",
		[38278] = --[[!AUTO_1011]]"music\\video\\38278.avi",
		[38279] = --[[!AUTO_1012]]"music\\video\\38279.avi",
		[38280] = --[[!AUTO_1013]]"music\\video\\38280.avi",
		[38281] = --[[!AUTO_1014]]"music\\video\\38281.avi",
		[38283] = --[[!AUTO_1015]]"music\\video\\38283.avi",
		[38287] = --[[!AUTO_1016]]"music\\video\\38287.avi",
		[38288] = --[[!AUTO_1017]]"music\\video\\38288.avi",
		[38289] = --[[!AUTO_1018]]"music\\video\\38289.avi",
		[38290] = --[[!AUTO_1019]]"music\\video\\38290.avi",
		[38291] = --[[!AUTO_1020]]"music\\video\\38291.avi",
		[38293] = --[[!AUTO_1021]]"music\\video\\38293.avi",
		[38292] = --[[!AUTO_1021]]"music\\video\\38292.avi",
		[38294] = --[[!AUTO_1021]]"music\\video\\38294.avi",
		[38034] = --[[!AUTO_1022]]"music\\video\\38034.avi",
		[38035] = --[[!AUTO_1023]]"music\\video\\38035.avi",
		[38036] = --[[!AUTO_1024]]"music\\video\\38036.avi",
		[38037] = --[[!AUTO_1025]]"music\\video\\38037.avi",
		[38038] = --[[!AUTO_1026]]"music\\video\\38038.avi",
		[38039] = --[[!AUTO_1027]]"music\\video\\38039.avi",
		[38295] = --[[!AUTO_1028]]"music\\video\\38295.avi",
		[38296] = --[[!AUTO_1029]]"music\\video\\38296.avi",
		[38299] = --[[!AUTO_1030]]"music\\video\\38299.avi",
		[38300] = --[[!AUTO_1031]]"music\\video\\38300.avi",
		[38301] = --[[!AUTO_1032]]"music\\video\\38301.avi",
		[38302] = --[[!AUTO_1033]]"music\\video\\38302.avi",
		[38303] = --[[!AUTO_1034]]"music\\video\\38303.avi",
		[38304] = --[[!AUTO_1035]]"music\\video\\38304.avi",
		[38305] = --[[!AUTO_1036]]"music\\video\\38305.avi",
		[38307] = --[[!AUTO_1037]]"music\\video\\38307.avi",
		[38311] = --[[!AUTO_1038]]"music\\video\\38311.avi",
		[38312] = --[[!AUTO_1039]]"music\\video\\38312.avi",
		[38313] = --[[!AUTO_1040]]"music\\video\\38313.avi",
		[38314] = --[[!AUTO_1041]]"music\\video\\38314.avi",
		[38315] = --[[!AUTO_1042]]"music\\video\\38315.avi",
		[38316] = --[[!AUTO_1043]]"music\\video\\38316.avi",
		[38317] = --[[!AUTO_1044]]"music\\video\\38317.avi",
		[38040] = --[[!AUTO_1045]]"music\\video\\38040.avi",
		[38041] = --[[!AUTO_1046]]"music\\video\\38041.avi",
		[38042] = --[[!AUTO_1047]]"music\\video\\38042.avi",
		[38043] = --[[!AUTO_1048]]"music\\video\\38043.avi",
		[38044] = --[[!AUTO_1049]]"music\\video\\38044.avi",
		[38045] = --[[!AUTO_1050]]"music\\video\\38045.avi",
		[38319] = --[[!AUTO_1051]]"music\\video\\38319.avi",
		[38320] = --[[!AUTO_1052]]"music\\video\\38320.avi",
		[38323] = --[[!AUTO_1053]]"music\\video\\38323.avi",
		[38324] = --[[!AUTO_1054]]"music\\video\\38324.avi",
		[38325] = --[[!AUTO_1055]]"music\\video\\38325.avi",
		[38326] = --[[!AUTO_1056]]"music\\video\\38326.avi",
		[38327] = --[[!AUTO_1057]]"music\\video\\38327.avi",
		[38328] = --[[!AUTO_1058]]"music\\video\\38328.avi",
		[38329] = --[[!AUTO_1059]]"music\\video\\38329.avi",
		[38330] = --[[!AUTO_1060]]"music\\video\\38330.avi",
		[71762] = --[[!AUTO_1061]]"music\\video\\71762.avi",
		[38331] = --[[!AUTO_1062]]"music\\video\\38331.avi",
		[38335] = --[[!AUTO_1063]]"music\\video\\38335.avi",
		[38336] = --[[!AUTO_1064]]"music\\video\\38336.avi",
		[38337] = --[[!AUTO_1065]]"music\\video\\38337.avi",
		[38338] = --[[!AUTO_1066]]"music\\video\\38338.avi",
		[38339] = --[[!AUTO_1067]]"music\\video\\38339.avi",
		[38340] = --[[!AUTO_1068]]"music\\video\\38340.avi",
		[38341] = --[[!AUTO_1069]]"music\\video\\38341.avi",
		[38342] = --[[!AUTO_1070]]"music\\video\\38342.avi",
		[71770] = --[[!AUTO_1071]]"music\\video\\71770.avi",
		[71771] = --[[!AUTO_1072]]"music\\video\\71771.avi",
		[71772] = --[[!AUTO_1073]]"music\\video\\71772.avi",
		[38046] = --[[!AUTO_1074]]"music\\video\\38046.avi",
		[38047] = --[[!AUTO_1075]]"music\\video\\38047.avi",
		[38048] = --[[!AUTO_1076]]"music\\video\\38048.avi",
		[38049] = --[[!AUTO_1077]]"music\\video\\38049.avi",
		[38050] = --[[!AUTO_1078]]"music\\video\\38050.avi",
		[38051] = --[[!AUTO_1079]]"music\\video\\38051.avi",
		[38343] = --[[!AUTO_1080]]"music\\video\\38343.avi",
		[38347] = --[[!AUTO_1081]]"music\\video\\38347.avi",
		[38348] = --[[!AUTO_1082]]"music\\video\\38348.avi",
		[38349] = --[[!AUTO_1083]]"music\\video\\38349.avi",
		[38350] = --[[!AUTO_1084]]"music\\video\\38350.avi",
		[38351] = --[[!AUTO_1085]]"music\\video\\38351.avi",
		[38352] = --[[!AUTO_1086]]"music\\video\\38352.avi",
		[38353] = --[[!AUTO_1087]]"music\\video\\38353.avi",
		[38354] = --[[!AUTO_1088]]"music\\video\\38354.avi",
		[38355] = --[[!AUTO_1089]]"music\\video\\38355.avi",
		[38356] = --[[!AUTO_1090]]"music\\video\\38356.avi",
		[38359] = --[[!AUTO_1091]]"music\\video\\38359.avi",
		[38360] = --[[!AUTO_1092]]"music\\video\\38360.avi",
		[38361] = --[[!AUTO_1093]]"music\\video\\38361.avi",
		[38362] = --[[!AUTO_1094]]"music\\video\\38362.avi",
		[38363] = --[[!AUTO_1095]]"music\\video\\38363.avi",
		[38364] = --[[!AUTO_1096]]"music\\video\\38364.avi",
		[38365] = --[[!AUTO_1097]]"music\\video\\38365.avi",
		[38366] = --[[!AUTO_1098]]"music\\video\\38366.avi",
		[38052] = --[[!AUTO_1099]]"music\\video\\38052.avi",
		[38053] = --[[!AUTO_1100]]"music\\video\\38053.avi",
		[38054] = --[[!AUTO_1101]]"music\\video\\38054.avi",
		[38055] = --[[!AUTO_1102]]"music\\video\\38055.avi",
		[38056] = --[[!AUTO_1103]]"music\\video\\38056.avi",
		[38057] = --[[!AUTO_1104]]"music\\video\\38057.avi",
		[38367] = --[[!AUTO_1105]]"music\\video\\38367.avi",
		[38371] = --[[!AUTO_1106]]"music\\video\\38371.avi",
		[38372] = --[[!AUTO_1107]]"music\\video\\38372.avi",
		[38373] = --[[!AUTO_1108]]"music\\video\\38373.avi",
		[38374] = --[[!AUTO_1109]]"music\\video\\38374.avi",
		[38375] = --[[!AUTO_1110]]"music\\video\\38375.avi",
		[38376] = --[[!AUTO_1111]]"music\\video\\38376.avi",
		[38379] = --[[!AUTO_1112]]"music\\video\\38379.avi",
		[38383] = --[[!AUTO_1113]]"music\\video\\38383.avi",
		[38384] = --[[!AUTO_1114]]"music\\video\\38384.avi",
		[38385] = --[[!AUTO_1115]]"music\\video\\38385.avi",
		[38386] = --[[!AUTO_1116]]"music\\video\\38386.avi",
		[38387] = --[[!AUTO_1117]]"music\\video\\38387.avi",
		[38388] = --[[!AUTO_1118]]"music\\video\\38388.avi",
		[38389] = --[[!AUTO_1119]]"music\\video\\38389.avi",
		[38390] = --[[!AUTO_1120]]"music\\video\\38390.avi",
		[38058] = --[[!AUTO_1121]]"music\\video\\38058.avi",
		[38059] = --[[!AUTO_1122]]"music\\video\\38059.avi",
		[38060] = --[[!AUTO_1123]]"music\\video\\38060.avi",
		[38061] = --[[!AUTO_1124]]"music\\video\\38061.avi",
		[38062] = --[[!AUTO_1125]]"music\\video\\38062.avi",
		[38063] = --[[!AUTO_1126]]"music\\video\\38063.avi",
		[38391] = --[[!AUTO_1127]]"music\\video\\38391.avi",
		[38392] = --[[!AUTO_1128]]"music\\video\\38392.avi",
		[38393] = --[[!AUTO_1129]]"music\\video\\38393.avi",
		[38395] = --[[!AUTO_1130]]"music\\video\\38395.avi",
		[38396] = --[[!AUTO_1131]]"music\\video\\38396.avi",
		[38397] = --[[!AUTO_1132]]"music\\video\\38397.avi",
		[38398] = --[[!AUTO_1133]]"music\\video\\38398.avi",
		[38399] = --[[!AUTO_1134]]"music\\video\\38399.avi",
		[38400] = --[[!AUTO_1135]]"music\\video\\38400.avi",
		[38401] = --[[!AUTO_1136]]"music\\video\\38401.avi",
		[38402] = --[[!AUTO_1137]]"music\\video\\38402.avi",
		[38403] = --[[!AUTO_1138]]"music\\video\\38403.avi",
		[38407] = --[[!AUTO_1139]]"music\\video\\38407.avi",
		[38408] = --[[!AUTO_1140]]"music\\video\\38408.avi",
		[38409] = --[[!AUTO_1141]]"music\\video\\38409.avi",
		[38410] = --[[!AUTO_1142]]"music\\video\\38410.avi",
		[38411] = --[[!AUTO_1143]]"music\\video\\38411.avi",
		[38412] = --[[!AUTO_1144]]"music\\video\\38412.avi",
		[38413] = --[[!AUTO_1145]]"music\\video\\38413.avi",
		[38414] = --[[!AUTO_1146]]"music\\video\\38414.avi",
		[88378] = --[[!AUTO_1147]]"music\\video\\88378.avi",
		[88380] = --[[!AUTO_1148]]"music\\video\\88380.avi",
		[88381] = --[[!AUTO_1149]]"music\\video\\88381.avi",
		[88382] = --[[!AUTO_1150]]"music\\video\\88382.avi",
		[88383] = --[[!AUTO_1151]]"music\\video\\88383.avi",
		[88384] = --[[!AUTO_1152]]"music\\video\\88384.avi",
		[88386] = --[[!AUTO_1153]]"music\\video\\88386.avi",
		[88388] = --[[!AUTO_1154]]"music\\video\\88388.avi",
		[88389] = --[[!AUTO_1155]]"music\\video\\88389.avi",
		[88390] = --[[!AUTO_1156]]"music\\video\\88390.avi",
		[88391] = --[[!AUTO_1157]]"music\\video\\88391.avi",
		[88392] = --[[!AUTO_1158]]"music\\video\\88392.avi",
		[88393] = --[[!AUTO_1159]]"music\\video\\88393.avi",
		[88394] = --[[!AUTO_1160]]"music\\video\\88394.avi",
		[88395] = --[[!AUTO_1161]]"music\\video\\88395.avi",
		[88396] = --[[!AUTO_1162]]"music\\video\\88396.avi",
		[88397] = --[[!AUTO_1163]]"music\\video\\88397.avi",
		[88398] = --[[!AUTO_1164]]"music\\video\\88398.avi",
		[88399] = --[[!AUTO_1165]]"music\\video\\88399.avi",
		[92902] = --[[!AUTO_1166]]"music\\video\\92902.avi",
		[92903] = --[[!AUTO_1167]]"music\\video\\92903.avi",
	},

	XPSkill =
	{

		[6104] = --[[!AUTO_1147]]"music\\video\\Skill6104.avi",    --少林
		[6105] = --[[!AUTO_1148]]"music\\video\\Skill6105.avi",    --武当
		[6106] = --[[!AUTO_1149]]"music\\video\\Skill6106.avi",    --华山
		[6107] = --[[!AUTO_1150]]"music\\video\\Skill6107.avi",    --恒山
		[6108] = --[[!AUTO_1151]]"music\\video\\Skill6108.avi",    --衡山
		[6109] = --[[!AUTO_1152]]"music\\video\\Skill6109.avi",    --日月
		[6110] = --[[!AUTO_1153]]"music\\video\\Skill6110.avi",    --五仙
		[6111] = --[[!AUTO_1154]]"music\\video\\Skill6111.avi",    --逍遥
		[6112] = --[[!AUTO_1155]]"music\\video\\Skill6112.avi",    --唐门
		[6113] = --[[!AUTO_1156]]"music\\video\\Skill6113.avi",    --峨眉
		[10304] = --[[!AUTO_1157]]"music\\video\\Skill10304.avi",    --独孤
	}
}

--武学面板描述返回
function SkillTip:GetWuXueDesc(wuxueid, skillseqid)
	if wuxueid > 0 then		--武学面板：wuxueid大于0时，wuxueid为武学ID，显示武学介绍
		local WuxueName,WuxueIconID
		local wuxuetext = {}
		local videopath = --[[!AUTO_1157]]""

		if WUXUE_DESC1[wuxueid] then
			WuxueName = --[[!AUTO_1158]]"……"
			WuxueIconID = 0
			if WUXUE_DESC1[wuxueid] and WUXUE_DESC1[wuxueid] ~= --[[!AUTO_1159]]"" then
				wuxuetext[1] = string.format(--[[!AUTO_1160]]"%6s%s",--[[!AUTO_1161]]"",WUXUE_DESC1[wuxueid])
			else
				wuxuetext[1] = WUXUE_DESC1[-1]
			end
			if WUXUE_DESC3[wuxueid] and WUXUE_DESC3[wuxueid] ~= --[[!AUTO_1162]]"" then
				local wuxue_type,wuxue_version = SkillTip:DivideWuXueType(WUXUE_DESC3[wuxueid])
				wuxuetext[2] = wuxue_version
				wuxuetext[3] = wuxue_type
			else
				wuxuetext[2] = --[[!AUTO_1163]]""
				wuxuetext[3] = WUXUE_DESC3[-1]
			end
		else
			WuxueName = WUXUE_ALL_TITLE
			WuxueIconID = WUXUE_ALL_ICONID
			wuxuetext[1] = WUXUE_ALL_DESC
			wuxuetext[2] = WUXUE_SELF_TITLE
			wuxuetext[3] = WUXUE_SELF_DESC
		end
		videopath = SkillTip.VideoPath.WuXue[wuxueid] or --[[!AUTO_1164]]""
		--分别放到控件：Lab_MainName，Img_MainIcon，Lab_MainDesc，Lab_Learn，Txt_Level，及视频
		return wuxuetext[1], wuxuetext[2], wuxuetext[3], videopath
		--return WuxueName, WuxueIconID, wuxuetext[1], wuxuetext[2], wuxuetext[3], videopath
	else						--武学面板：wuxueid等于0时，表示是套路，显示套路介绍
		local SkillSeQName,SkillSeQIconID
		local skillseq_text = {}
		local videopath = --[[!AUTO_1165]]""
		local pack = GetSkillPackData(skillseqid)
		local isTestMode = false
		if TestShowItemId and TestShowItemId == 1 then
			isTestMode = true
		end
		if isTestMode then
			SkillSeQName = string.format(--[[!AUTO_1166]]"%s%s",pack.name,GetSkillPackTestDesc_PackID(skillseqid))
		else SkillSeQName = pack.name
		end
		SkillSeQIconID = pack.iconpath

		if pack.type == -2 then
			--套路描述
			local num = ((skillseqid/16)-math.floor(skillseqid/16))*16
			local wuxueid = (skillseqid-1073741824-num)/16
			local wuxue_name = --[[!AUTO_1167]]""
			if WUXUE_DESC2[wuxueid] and WUXUE_DESC2[wuxueid] ~= --[[!AUTO_1168]]"" then wuxue_name = WUXUE_DESC2[wuxueid] end
			if num == 0 then skillseq_text[1] = string.format(--[[!AUTO_1169]]"%6s%s",--[[!AUTO_1170]]"",PACKDESC_LEFT_DESC)
			elseif num == 1 then skillseq_text[1] = string.format(--[[!AUTO_1171]]"%6s%s",--[[!AUTO_1172]]"",PACKDESC_RIGHT_DESC)
			end
			--修习条件
			skillseq_text[2] = SKILL_NONE_TEXT
			--当前技能等级


			--skillseq_text[3] = GetSkillPackDesc_FirstSkillLv(pack.number,pack.skill_lv)
			skillseq_text[3] = --[[!AUTO_1173]]""
		else
			--套路描述
			if SKILL_DETAIL_DESC_EX[pack.skill_id[1]] then
				skillseq_text[1] = string.format(--[[!AUTO_1174]]"%6s%s",--[[!AUTO_1175]]"",SetWildcardText(SKILL_DETAIL_DESC_EX[pack.skill_id[1]],pack.skill[1],pack.process[1],pack.subobject[1]))
			else
				skillseq_text[1] = string.format(--[[!AUTO_1176]]"%6s%s",--[[!AUTO_1177]]"",SetWildcardText(SKILL_DETAIL_DESC[pack.skill_id[1]],pack.skill[1],pack.process[1],pack.subobject[1]))
			end
			--修习条件
			if pack.type ~= -1 and pack.skill[1]["learn_player_level"][1] > 1 then
				skillseq_text[2] = string.format(SKILLDESC_LEVEL_TITLE,pack.skill[1]["learn_player_level"][1])
			else skillseq_text[2] = SKILL_NONE_TEXT
			end
			--当前技能等级


			--skillseq_text[3] = GetSkillPackDesc_FirstSkillLv(pack.number,pack.skill_lv)
			skillseq_text[3] = --[[!AUTO_1178]]""
		end

		videopath = SkillTip.VideoPath.TaoLu[skillseqid] or --[[!AUTO_1179]]""
		--分别放到控件：Lab_MainName，Img_MainIcon，Lab_MainDesc，Lab_Learn，Txt_Level，及视频
		return skillseq_text[1], skillseq_text[2], skillseq_text[3], videopath
		--return SkillSeQName, SkillSeQIconID, skillseq_text[1], skillseq_text[2], skillseq_text[3], videopath
	end
end


SkillTip.WuxueDefaultSkill =
{
	[23127] = {{1026, 988, 960, 980}, {4822, 4823, 4824, 4825},},		--少林普渡杖法
	[23128] = {{4829, 4839, 2033, 2034}, {0, 968, 969, 0},},		--少林罗汉拳法

	[23132] = {{2656, 2533, 2535, 2536}, {0, 2541, 2542, 0},},		--武当太极剑法
	[23133] = {{2660, 2547, 2680, 2571}, {2662, 0, 0, 0},},			--武当真武剑法

	[23137] = {{2041, 2042, 2043, 2044}, {3602, 834, 838, 852},},		--华山剑宗剑法
	[23138] = {{953, 3579, 3580, 1027}, {1353, 0, 0, 0},},			--华山气宗剑法

	[23142] = {{2883, 2884, 2885, 2886}, {934, 2933, 2934, 950},},		--恒山棉针剑法
	[23143] = {{2920, 2917, 2918, 2919}, {2887, 2888, 2889, 2890},},	--恒山万花剑法

	[23147] = {{2837, 2838, 2839, 2840}, {4711, 0, 0, 0},},			--衡山回风落雁剑

	[23148] = {{2877, 2878, 2879, 2844}, {2875, 0, 0, 0},},			--衡山百变幻雾剑


	[23152] = {{1034, 3028, 4079, 4095}, {3029, 1036, 1043, 4078},},	--日月擒月刀法

	[23153] = {{4901, 4902, 4903, 4904}, {4088, 0, 0, 0},},			--日月逐日剑法

	[23157] = {{4749, 2201, 4750, 2064}, {2062, 0, 0, 0},},			--五仙金蛇鞭法
	[23158] = {{4762, 4763, 4764, 4756}, {4757, 0, 0, 0},},			--五仙融血密咒

	[23162] = {{4778, 4779, 4780, 4781}, {862, 0, 0, 0},},			--逍遥小无相功
	[23163] = {{2239, 2230, 2232, 2233}, {0, 860, 878, 0},},		--逍遥折梅寒手

	[23167] = {{4173, 3581, 920, 929}, {931, 0, 0, 0},},			--唐门满天花雨
	[23168] = {{4188, 4188, 4188, 4188}, {2622, 0, 0, 0},},			--唐门霹雳雷火

	[23172] = {{3033, 3034, 3035, 3037}, {0, 3039, 3045, 3046},},		--峨嵋九阴真经
	[23173] = {{3048, 3049, 3050, 3051}, {4675, 0, 0, 0},},			--峨嵋九阳神功
}

--武学默认组合招式
function SkillTip:GetWuXueDefaultSkill(idWuXue, idx)
	if SkillTip.WuxueDefaultSkill[idWuXue] then
		return SkillTip.WuxueDefaultSkill[idWuXue][idx]
	else
		return {0, 0, 0, 0}
	end
end


--门派技能教学npc表




SkillTip.ProfNpcInfo =
{
	{prof = 0,npc = 1002},
	{prof = 1,npc = 3108},
	{prof = 2,npc = 2716},
	{prof = 3,npc = 3777},
	{prof = 4,npc = 3831},
	{prof = 5,npc = 3768},
	{prof = 6,npc = 3804},
	{prof = 7,npc = 3822},
	{prof = 8,npc = 3786},
	{prof = 9,npc = 3795},
	{prof = 10,npc = 3813},
}

--特殊技能教学npc表

SkillTip.SkillSeqNpcInfo =
{
	{skillseq = 9128,npc = 3108},--test少林野马追风去门派掌门学
}

function SkillTip:GetProfNpcInfo()--门派技能教学




	return SkillTip.ProfNpcInfo
end

function SkillTip:GetSkillSeqNpcInfo()--特殊技能教学




	return SkillTip.SkillSeqNpcInfo
end


--[[
格式：  duration,direction,prgs_img, back_img,suggestPos
duration: 本段的时间段长度（毫秒）
direction: LEFT_TO_RIGHT 和 RIGHT_TO_LEFT
prgs_img:
back_img:
suggestPos: 0.0 - 1.0 的数，表示推荐的松手位置。 如果不做任何推荐，就填 -1
]]--
local LEFT_TO_RIGHT = 0
local RIGHT_TO_LEFT = 1
local SKILL_GROGRESS_SEGMENTS = {}
SKILL_GROGRESS_SEGMENTS[6103]=
{
	{2300,	LEFT_TO_RIGHT,		--[[!AUTO_1180]]"XAJH\\进度条\\技能释放蓄力条.tga",	--[[!AUTO_1181]]"XAJH\\进度条\\施法条条.tga",	-1,-1},
	{-1,	RIGHT_TO_LEFT,		--[[!AUTO_1182]]"XAJH\\进度条\\技能释放蓄力条.tga",	--[[!AUTO_1183]]"XAJH\\进度条\\施法条条.tga",	-1,-1},
}--少林铜山西崩
SKILL_GROGRESS_SEGMENTS[4834]=
{
	{2000,	LEFT_TO_RIGHT,		--[[!AUTO_1184]]"XAJH\\进度条\\技能释放蓄力条.tga",	--[[!AUTO_1185]]"XAJH\\进度条\\施法条条.tga",	-1,-1},
	{-1,	RIGHT_TO_LEFT,		--[[!AUTO_1186]]"XAJH\\进度条\\技能释放蓄力条.tga",	--[[!AUTO_1187]]"XAJH\\进度条\\施法条条.tga",	-1,-1},
}--少林金刚伏魔
--SKILL_GROGRESS_SEGMENTS[4687]=
--{
--	{1500,	LEFT_TO_RIGHT,		--[[!AUTO_1188]]"XAJH\\进度条\\技能释放蓄力条.tga",	--[[!AUTO_1189]]"XAJH\\进度条\\施法条条.tga",	-1,-1},
--	{-1,	RIGHT_TO_LEFT,		--[[!AUTO_1190]]"XAJH\\进度条\\技能释放蓄力条.tga",	--[[!AUTO_1191]]"XAJH\\进度条\\施法条条.tga",	-1,-1},
--}--恒山万流归宗
SKILL_GROGRESS_SEGMENTS[4712]=
{
	{401,	LEFT_TO_RIGHT,		--[[!AUTO_1192]]"XAJH\\进度条\\技能释放蓄力条.tga",	--[[!AUTO_1193]]"XAJH\\进度条\\施法条条.tga",	-1,-1},
	{-1,	RIGHT_TO_LEFT,		--[[!AUTO_1194]]"XAJH\\进度条\\技能释放蓄力条.tga",	--[[!AUTO_1195]]"XAJH\\进度条\\施法条条.tga",	-1,-1},
}--衡山剑落双雁
SKILL_GROGRESS_SEGMENTS[4714]=
{
	{401,	LEFT_TO_RIGHT,		--[[!AUTO_1196]]"XAJH\\进度条\\技能释放蓄力条.tga",	--[[!AUTO_1197]]"XAJH\\进度条\\施法条条.tga",	-1,-1},
	{-1,	RIGHT_TO_LEFT,		--[[!AUTO_1198]]"XAJH\\进度条\\技能释放蓄力条.tga",	--[[!AUTO_1199]]"XAJH\\进度条\\施法条条.tga",	-1,-1},
}--衡山同雁三决
SKILL_GROGRESS_SEGMENTS[4716] =
{
	{401,	LEFT_TO_RIGHT,		--[[!AUTO_1200]]"XAJH\\进度条\\技能释放蓄力条.tga",	--[[!AUTO_1201]]"XAJH\\进度条\\施法条条.tga",	-1,-1},
	{-1,	RIGHT_TO_LEFT,		--[[!AUTO_1202]]"XAJH\\进度条\\技能释放蓄力条.tga",	--[[!AUTO_1203]]"XAJH\\进度条\\施法条条.tga",	-1,-1},
}--衡山炽翼千羽
SKILL_GROGRESS_SEGMENTS[4713] =
{
	{401,	LEFT_TO_RIGHT,		--[[!AUTO_1204]]"XAJH\\进度条\\技能释放蓄力条.tga",	--[[!AUTO_1205]]"XAJH\\进度条\\施法条条.tga",	-1,-1},
	{-1,	RIGHT_TO_LEFT,		--[[!AUTO_1206]]"XAJH\\进度条\\技能释放蓄力条.tga",	--[[!AUTO_1207]]"XAJH\\进度条\\施法条条.tga",	-1,-1},
}--衡山长啸落雁
SKILL_GROGRESS_SEGMENTS[2624] =
{
	{1001,	LEFT_TO_RIGHT,		--[[!AUTO_1204]]"XAJH\\进度条\\技能释放蓄力条.tga",	--[[!AUTO_1205]]"XAJH\\进度条\\施法条条.tga",	-1,-1},
	{-1,	RIGHT_TO_LEFT,		--[[!AUTO_1206]]"XAJH\\进度条\\技能释放蓄力条.tga",	--[[!AUTO_1207]]"XAJH\\进度条\\施法条条.tga",	-1,-1},
}--唐门百步穿杨
SKILL_GROGRESS_SEGMENTS[2685] =
{
        --{2000,	LEFT_TO_RIGHT,		"XAJH\\进度条\\施法条条.tga",		"",				-1,-1},
	{-1,	LEFT_TO_RIGHT,		--[[!AUTO_1208]]"XAJH\\进度条\\技能释放蓄力条.tga",	--[[!AUTO_1209]]"XAJH\\进度条\\施法条条.tga",	2000,3000},
}--门派通用调息
SKILL_GROGRESS_SEGMENTS[8950] =
{
	{500,	LEFT_TO_RIGHT,		--[[!AUTO_1210]]"XAJH\\进度条\\技能释放蓄力条.tga",	--[[!AUTO_1211]]"XAJH\\进度条\\施法条条.tga",	-1,-1},
	{2000,	LEFT_TO_RIGHT,		--[[!AUTO_1212]]"XAJH\\进度条\\人物属性进度条-黄.tga",	--[[!AUTO_1213]]"XAJH\\进度条\\技能释放蓄力条.tga",	-1,-1},
	{-1,	RIGHT_TO_LEFT,		--[[!AUTO_1214]]"XAJH\\进度条\\人物属性进度条-黄.tga",	--[[!AUTO_1215]]"XAJH\\进度条\\施法条条.tga",	-1,-1},
}--江湖绝学寒冰神掌
SKILL_GROGRESS_SEGMENTS[8955] =
{
	{800,	LEFT_TO_RIGHT,		--[[!AUTO_1216]]"XAJH\\进度条\\技能释放蓄力条.tga",	--[[!AUTO_1217]]"XAJH\\进度条\\施法条条.tga",	-1,-1},
	{1800,	LEFT_TO_RIGHT,		--[[!AUTO_1218]]"XAJH\\进度条\\人物属性进度条-绿.tga",	--[[!AUTO_1219]]"XAJH\\进度条\\技能释放蓄力条.tga",	-1,-1},
	{2800,	LEFT_TO_RIGHT,		--[[!AUTO_1220]]"XAJH\\进度条\\人物属性进度条-黄.tga",	--[[!AUTO_1221]]"XAJH\\进度条\\人物属性进度条-绿.tga",	-1,-1},
	{3800,	LEFT_TO_RIGHT,		--[[!AUTO_1222]]"XAJH\\进度条\\人物属性进度条-红.tga",	--[[!AUTO_1223]]"XAJH\\进度条\\人物属性进度条-黄.tga",	-1,-1},
	{4800,	LEFT_TO_RIGHT,		--[[!AUTO_1224]]"XAJH\\进度条\\紫色小血条.tga",	--[[!AUTO_1225]]"XAJH\\进度条\\人物属性进度条-红.tga",	-1,-1},
}--江湖绝学大海无量



function GetSkillProgressSegments()
	return SKILL_GROGRESS_SEGMENTS
end



--生活技能描述




function SkillTip:GetLiveSkillTip(index)
	local liveskill_tip = {}
	local skill_info = {
			{id = 6987,name = --[[!AUTO_1226]]"种植",icon = {[1] = --[[!AUTO_1227]]"00111种植.dds",[2] = --[[!AUTO_1228]]"00111种植.dds",[3] = --[[!AUTO_1229]]"00112种植.dds",[4] = --[[!AUTO_1230]]"00112种植.dds",[5] = --[[!AUTO_1231]]"00113种植.dds",[6] = --[[!AUTO_1232]]"00113种植.dds",[7] = --[[!AUTO_1233]]"00114种植.dds",[8] = --[[!AUTO_1234]]"00114种植.dds",[9] = --[[!AUTO_1235]]"00115种植.dds",[10] = --[[!AUTO_1236]]"00115种植.dds",[11] = --[[!AUTO_1237]]"00116种植.dds",[12] = --[[!AUTO_1238]]"00116种植.dds",[13] = --[[!AUTO_1239]]"00117种植.dds",[14] = --[[!AUTO_1240]]"00117种植.dds",[15] = --[[!AUTO_1241]]"00118种植.dds",[16] = --[[!AUTO_1242]]"00118种植.dds",[17] = --[[!AUTO_1243]]"00119种植.dds",[18] = --[[!AUTO_1244]]"00119种植.dds",[19] = --[[!AUTO_1245]]"00120种植.dds",[20] = --[[!AUTO_1246]]"00120种植.dds"}},
			{id = 6988,name = --[[!AUTO_1247]]"采矿",icon = {[1] = --[[!AUTO_1248]]"00001采矿.dds",[2] = --[[!AUTO_1249]]"00001采矿.dds",[3] = --[[!AUTO_1250]]"00002采矿.dds",[4] = --[[!AUTO_1251]]"00002采矿.dds",[5] = --[[!AUTO_1252]]"00003采矿.dds",[6] = --[[!AUTO_1253]]"00003采矿.dds",[7] = --[[!AUTO_1254]]"00004采矿.dds",[8] = --[[!AUTO_1255]]"00004采矿.dds",[9] = --[[!AUTO_1256]]"00005采矿.dds",[10] = --[[!AUTO_1257]]"00005采矿.dds",[11] = --[[!AUTO_1258]]"00006采矿.dds",[12] = --[[!AUTO_1259]]"00006采矿.dds",[13] = --[[!AUTO_1260]]"00007采矿.dds",[14] = --[[!AUTO_1261]]"00007采矿.dds",[15] = --[[!AUTO_1262]]"00008采矿.dds",[16] = --[[!AUTO_1263]]"00008采矿.dds",[17] = --[[!AUTO_1264]]"00009采矿.dds",[18] = --[[!AUTO_1265]]"00009采矿.dds",[19] = --[[!AUTO_1266]]"00010采矿.dds",[20] = --[[!AUTO_1267]]"00010采矿.dds"}},
			{id = 6989,name = --[[!AUTO_1268]]"养殖",icon = {[1] = --[[!AUTO_1269]]"06986养殖1.dds",[2] = --[[!AUTO_1270]]"06986养殖1.dds",[3] = --[[!AUTO_1271]]"06987养殖2.dds",[4] = --[[!AUTO_1272]]"06987养殖2.dds",[5] = --[[!AUTO_1273]]"06988养殖3.dds",[6] = --[[!AUTO_1274]]"06988养殖3.dds",[7] = --[[!AUTO_1275]]"06989养殖4.dds",[8] = --[[!AUTO_1276]]"06989养殖4.dds",[9] = --[[!AUTO_1277]]"06990养殖5.dds",[10] = --[[!AUTO_1278]]"06990养殖5.dds",[11] = --[[!AUTO_1279]]"06991养殖6.dds",[12] = --[[!AUTO_1280]]"06991养殖6.dds",[13] = --[[!AUTO_1281]]"06992养殖7.dds",[14] = --[[!AUTO_1282]]"06992养殖7.dds",[15] = --[[!AUTO_1283]]"06993养殖8.dds",[16] = --[[!AUTO_1284]]"06993养殖8.dds",[17] = --[[!AUTO_1285]]"06994养殖9.dds",[18] = --[[!AUTO_1286]]"06994养殖9.dds",[19] = --[[!AUTO_1287]]"06995养殖10.dds",[20] = --[[!AUTO_1288]]"06995养殖10.dds"}},
			{id = 6990,name = --[[!AUTO_1289]]"锻造",icon = {[1] = --[[!AUTO_1290]]"00031锻造.dds",[2] = --[[!AUTO_1291]]"00031锻造.dds",[3] = --[[!AUTO_1292]]"00032锻造.dds",[4] = --[[!AUTO_1293]]"00032锻造.dds",[5] = --[[!AUTO_1294]]"00033锻造.dds",[6] = --[[!AUTO_1295]]"00033锻造.dds",[7] = --[[!AUTO_1296]]"00034锻造.dds",[8] = --[[!AUTO_1297]]"00034锻造.dds",[9] = --[[!AUTO_1298]]"00035锻造.dds",[10] = --[[!AUTO_1299]]"00035锻造.dds",[11] = --[[!AUTO_1300]]"00036锻造.dds",[12] = --[[!AUTO_1301]]"00036锻造.dds",[13] = --[[!AUTO_1302]]"00037锻造.dds",[14] = --[[!AUTO_1303]]"00037锻造.dds",[15] = --[[!AUTO_1304]]"00038锻造.dds",[16] = --[[!AUTO_1305]]"00038锻造.dds",[17] = --[[!AUTO_1306]]"00039锻造.dds",[18] = --[[!AUTO_1307]]"00039锻造.dds",[19] = --[[!AUTO_1308]]"00040锻造.dds",[20] = --[[!AUTO_1309]]"00040锻造.dds"}},
			{id = 6991,name = --[[!AUTO_1310]]"缝纫",icon = {[1] = --[[!AUTO_1311]]"00041缝纫.dds",[2] = --[[!AUTO_1312]]"00041缝纫.dds",[3] = --[[!AUTO_1313]]"00042缝纫.dds",[4] = --[[!AUTO_1314]]"00042缝纫.dds",[5] = --[[!AUTO_1315]]"00043缝纫.dds",[6] = --[[!AUTO_1316]]"00043缝纫.dds",[7] = --[[!AUTO_1317]]"00044缝纫.dds",[8] = --[[!AUTO_1318]]"00044缝纫.dds",[9] = --[[!AUTO_1319]]"00045缝纫.dds",[10] = --[[!AUTO_1320]]"00045缝纫.dds",[11] = --[[!AUTO_1321]]"00046缝纫.dds",[12] = --[[!AUTO_1322]]"00046缝纫.dds",[13] = --[[!AUTO_1323]]"00047缝纫.dds",[14] = --[[!AUTO_1324]]"00047缝纫.dds",[15] = --[[!AUTO_1325]]"00048缝纫.dds",[16] = --[[!AUTO_1326]]"00048缝纫.dds",[17] = --[[!AUTO_1327]]"00049缝纫.dds",[18] = --[[!AUTO_1328]]"00049缝纫.dds",[19] = --[[!AUTO_1329]]"00050缝纫.dds",[20] = --[[!AUTO_1330]]"00050缝纫.dds"}},
			{id = 6992,name = --[[!AUTO_1331]]"巧匠",icon = {[1] = --[[!AUTO_1332]]"00051巧匠.dds",[2] = --[[!AUTO_1333]]"00051巧匠.dds",[3] = --[[!AUTO_1334]]"00052巧匠.dds",[4] = --[[!AUTO_1335]]"00052巧匠.dds",[5] = --[[!AUTO_1336]]"00053巧匠.dds",[6] = --[[!AUTO_1337]]"00053巧匠.dds",[7] = --[[!AUTO_1338]]"00054巧匠.dds",[8] = --[[!AUTO_1339]]"00054巧匠.dds",[9] = --[[!AUTO_1340]]"00055巧匠.dds",[10] = --[[!AUTO_1341]]"00055巧匠.dds",[11] = --[[!AUTO_1342]]"00056巧匠.dds",[12] = --[[!AUTO_1343]]"00056巧匠.dds",[13] = --[[!AUTO_1344]]"00057巧匠.dds",[14] = --[[!AUTO_1345]]"00057巧匠.dds",[15] = --[[!AUTO_1346]]"00058巧匠.dds",[16] = --[[!AUTO_1347]]"00058巧匠.dds",[17] = --[[!AUTO_1348]]"00059巧匠.dds",[18] = --[[!AUTO_1349]]"00059巧匠.dds",[19] = --[[!AUTO_1350]]"00060巧匠.dds",[20] = --[[!AUTO_1351]]"00060巧匠.dds"}},
			{id = 6993,name = --[[!AUTO_1352]]"制药",icon = {[1] = --[[!AUTO_1353]]"00061制药.dds",[2] = --[[!AUTO_1354]]"00061制药.dds",[3] = --[[!AUTO_1355]]"00062制药.dds",[4] = --[[!AUTO_1356]]"00062制药.dds",[5] = --[[!AUTO_1357]]"00063制药.dds",[6] = --[[!AUTO_1358]]"00063制药.dds",[7] = --[[!AUTO_1359]]"00064制药.dds",[8] = --[[!AUTO_1360]]"00064制药.dds",[9] = --[[!AUTO_1361]]"00065制药.dds",[10] = --[[!AUTO_1362]]"00065制药.dds",[11] = --[[!AUTO_1363]]"00066制药.dds",[12] = --[[!AUTO_1364]]"00066制药.dds",[13] = --[[!AUTO_1365]]"00067制药.dds",[14] = --[[!AUTO_1366]]"00067制药.dds",[15] = --[[!AUTO_1367]]"00068制药.dds",[16] = --[[!AUTO_1368]]"00068制药.dds",[17] = --[[!AUTO_1369]]"00069制药.dds",[18] = --[[!AUTO_1370]]"00069制药.dds",[19] = --[[!AUTO_1371]]"00070制药.dds",[20] = --[[!AUTO_1372]]"00070制药.dds"}},
			{id = 6994,name = --[[!AUTO_1373]]"烹饪",icon = {[1] = --[[!AUTO_1374]]"00071烹饪.dds",[2] = --[[!AUTO_1375]]"00071烹饪.dds",[3] = --[[!AUTO_1376]]"00072烹饪.dds",[4] = --[[!AUTO_1377]]"00072烹饪.dds",[5] = --[[!AUTO_1378]]"00073烹饪.dds",[6] = --[[!AUTO_1379]]"00073烹饪.dds",[7] = --[[!AUTO_1380]]"00074烹饪.dds",[8] = --[[!AUTO_1381]]"00074烹饪.dds",[9] = --[[!AUTO_1382]]"00075烹饪.dds",[10] = --[[!AUTO_1383]]"00075烹饪.dds",[11] = --[[!AUTO_1384]]"00076烹饪.dds",[12] = --[[!AUTO_1385]]"00076烹饪.dds",[13] = --[[!AUTO_1386]]"00077烹饪.dds",[14] = --[[!AUTO_1387]]"00077烹饪.dds",[15] = --[[!AUTO_1388]]"00078烹饪.dds",[16] = --[[!AUTO_1389]]"00078烹饪.dds",[17] = --[[!AUTO_1390]]"00079烹饪.dds",[18] = --[[!AUTO_1391]]"00079烹饪.dds",[19] = --[[!AUTO_1392]]"00080烹饪.dds",[20] = --[[!AUTO_1393]]"00080烹饪.dds"}},
			{id = 6995,name = --[[!AUTO_1394]]"伐木",icon = {[1] = --[[!AUTO_1395]]"00021伐木.dds",[2] = --[[!AUTO_1396]]"00021伐木.dds",[3] = --[[!AUTO_1397]]"00022伐木.dds",[4] = --[[!AUTO_1398]]"00022伐木.dds",[5] = --[[!AUTO_1399]]"00023伐木.dds",[6] = --[[!AUTO_1400]]"00023伐木.dds",[7] = --[[!AUTO_1401]]"00024伐木.dds",[8] = --[[!AUTO_1402]]"00024伐木.dds",[9] = --[[!AUTO_1403]]"00025伐木.dds",[10] = --[[!AUTO_1404]]"00025伐木.dds",[11] = --[[!AUTO_1405]]"00026伐木.dds",[12] = --[[!AUTO_1406]]"00026伐木.dds",[13] = --[[!AUTO_1407]]"00027伐木.dds",[14] = --[[!AUTO_1408]]"00027伐木.dds",[15] = --[[!AUTO_1409]]"00028伐木.dds",[16] = --[[!AUTO_1410]]"00028伐木.dds",[17] = --[[!AUTO_1411]]"00029伐木.dds",[18] = --[[!AUTO_1412]]"00029伐木.dds",[19] = --[[!AUTO_1413]]"00030伐木.dds",[20] = --[[!AUTO_1414]]"00030伐木.dds"}},
			{id = 14323,name = --[[!AUTO_1415]]"钓鱼",icon = {[1] = --[[!AUTO_1416]]"00081钓鱼.dds",[2] = --[[!AUTO_1417]]"00081钓鱼.dds",[3] = --[[!AUTO_1418]]"00082钓鱼.dds",[4] = --[[!AUTO_1419]]"00082钓鱼.dds",[5] = --[[!AUTO_1420]]"00083钓鱼.dds",[6] = --[[!AUTO_1421]]"00083钓鱼.dds",[7] = --[[!AUTO_1422]]"00084钓鱼.dds",[8] = --[[!AUTO_1423]]"00084钓鱼.dds",[9] = --[[!AUTO_1424]]"00085钓鱼.dds",[10] = --[[!AUTO_1425]]"00085钓鱼.dds",[11] = --[[!AUTO_1426]]"00086钓鱼.dds",[12] = --[[!AUTO_1427]]"00086钓鱼.dds",[13] = --[[!AUTO_1428]]"00087钓鱼.dds",[14] = --[[!AUTO_1429]]"00087钓鱼.dds",[15] = --[[!AUTO_1430]]"00088钓鱼.dds",[16] = --[[!AUTO_1431]]"00088钓鱼.dds",[17] = --[[!AUTO_1432]]"00089钓鱼.dds",[18] = --[[!AUTO_1433]]"00089钓鱼.dds",[19] = --[[!AUTO_1434]]"00090钓鱼.dds",[20] = --[[!AUTO_1435]]"00090钓鱼.dds"}},
			{id = 85337,name = "暗器",icon = {[1] = "11651暗器囊.dds",[2] =  "11651暗器囊.dds",[3] =  "11651暗器囊.dds",[4] =  "11651暗器囊.dds",[5] =  "11651暗器囊.dds",[6] =  "11651暗器囊.dds",[7] =  "11651暗器囊.dds",[8] =  "11651暗器囊.dds",[9] =  "11651暗器囊.dds",[10] =  "11651暗器囊.dds",[11] =  "11651暗器囊.dds",[12] =  "11651暗器囊.dds",[13] =  "11651暗器囊.dds",[14] =  "11651暗器囊.dds",[15] =  "11651暗器囊.dds",[16] =  "11651暗器囊.dds",[17] =  "11651暗器囊.dds",[18] =  "11651暗器囊.dds",[19] =  "11651暗器囊.dds",[20] =  "11651暗器囊.dds"}},
			}
	local player_level = GameApi.GetPlayerFullProp(0)["level"]
	local cur_point = GameApi.GetPlayerFullProp(0)["cur_prodskill_point"]
	local prod_skill_tbl = GameApi.GetUserProdSkillInfo()
	local id_skill
	local skill_level = 0
	local learned_count = 0
	--local cost_point
	--local level_limit
	local levellimit = {
							[6987] = 20,
							[6988] = 30,
							[6989] = 30,
							[6990] = 30,
							[6991] = 30,
							[6992] = 30,
							[6993] = 20,
							[6994] = 20,
							[6995] = 30,
							[14323] = 30,
							[85337] = 45
						}
	local costpoint = {
							[6987] = 0,
							[6988] = 1,
							[6989] = 0,
							[6990] = 1,
							[6991] = 1,
							[6992] = 1,
							[6993] = 1,
							[6994] = 1,
							[6995] = 1,
							[14323] = 1,
							[85337] = 1
						}
	for k,v in pairs(prod_skill_tbl) do
		id_skill = v["skill_id"]
		skill_level = v["skill_level"]
		if skill_level > 0 and id_skill ~= 6987 and id_skill~= 6989 then  --种植和养殖不耗点，所以技能是这两个就不计算扣掉的点




		   learned_count = learned_count + 1
		end
	end
	for k,v in pairs(prod_skill_tbl) do
		id_skill = v["skill_id"]
		skill_level = v["skill_level"]
		--local cur_point = v["cur_point"]
		--local max_point = v["max_point"]
		--cost_point = v["consume_prod_point"]
		--level_limit = v["player_level_limit"]
		if id_skill == index then
			break
		end
	end

	if  skill_level ~= 0 then
		if	LiveSkill_Produce[index] == --[[!AUTO_1436]]"" then
			liveskill_tip["desc"] = LiveSkill_DependSkill[index]
		else
			liveskill_tip["desc"] = string.format(--[[!AUTO_1437]]"%s\r%s",LiveSkill_DependSkill[index],LiveSkill_Produce[index])
		end
	else
		liveskill_tip["info1"] = --[[!AUTO_1438]]""
		if	player_level < levellimit[index] then
			liveskill_tip["info1"] = --[[!AUTO_1439]]"^FD2D31"
		end
		liveskill_tip["info1"] = string.format(--[[!AUTO_1440]]"%s%s",liveskill_tip["info1"],LiveSkill_LearnLevel[index])

		if LiveSkill_PointCost[index] and LiveSkill_PointCost[index] ~= --[[!AUTO_1441]]"" then
			if costpoint[index] <= cur_point - learned_count then
				liveskill_tip["info1"] = string.format(--[[!AUTO_1442]]"%s\r^ffffff%s",liveskill_tip["info1"],LiveSkill_PointCost[index])
			else
				liveskill_tip["info1"] = string.format(--[[!AUTO_1443]]"%s\r^FD2D31%s",liveskill_tip["info1"],LiveSkill_PointCost[index])
			end
		end

		if	LiveSkill_Produce[index] == --[[!AUTO_1444]]"" then
			liveskill_tip["desc"] = LiveSkill_DependSkill[index]
		else
			liveskill_tip["desc"] = string.format(--[[!AUTO_1445]]"%s\r%s",LiveSkill_DependSkill[index],LiveSkill_Produce[index])
		end
	end

	if skill_level >=1 and skill_level < 5 then
		if LiveSkill_LvUpNotice[index] then
			liveskill_tip["remark"] = string.format(--[[!AUTO_1446]]"%s%s",COLOUR_NEW_10,LiveSkill_LvUpNotice[index][1])
		end
	elseif skill_level >=5 and skill_level <= 10 then
		if LiveSkill_LvUpNotice[index] then
			liveskill_tip["remark"] = string.format(--[[!AUTO_1447]]"%s%s",COLOUR_NEW_10,LiveSkill_LvUpNotice[index][2])
		end
	end

	for i = 1 ,#skill_info do
		if skill_info[i].id == index then
			--LogPrint(i)
			liveskill_tip["title"] = skill_info[i].name
			if skill_level == 0 then
				liveskill_tip["icon"] = skill_info[i].icon[1]
			else
				liveskill_tip["icon"] = skill_info[i].icon[skill_level]
			end
			break
		end
	end

	return liveskill_tip
end

-- 武学描述
function SkillTip:GetWuxueTip(tid,cid)
	tbl = {}
	if WUXUE_DESC1[tid] then
		--描述面板表头
		local _, sTitle = DescUtility:GetItemDBProp(tid,cid,--[[!AUTO_1448]]"t_name")
		if TestShowItemId and TestShowItemId == 1 then --调试模式d_script TestShowItemId = 1
			tbl["title"] = sTitle .. --[[!AUTO_1449]]"(" .. tid .. --[[!AUTO_1450]]")"
		else
			tbl["title"] = sTitle
		end
		--描述面板图标
		local bIcon, sIcon = DescUtility:GetItemDBProp(tid,cid,--[[!]]"图标路径名")
		tbl["icon"] = bIcon and sIcon or --[[!AUTO_1451]]"00752未知物品.dds"
		--描述面板表头
		--1最多3行，2最多1行，3最多2行（用\r分割）
		local wuxue_type
		if WUXUE_DESC3[tid] then
			wuxue_type =  SkillTip:DivideWuXueType(WUXUE_DESC3[tid])
		else
			wuxue_type = --[[!AUTO_1452]]""
		end
		tbl["info1"] = wuxue_type
		--描述面板星级
		--s_t，s代表星数，-1不显示。t代表显示方案，0为正常，1为同步闪烁，2为待定

		tbl["star"] = --[[!AUTO_1453]]"-1_0"
		--描述面板限制（左）与消耗（右）
		--用\r分割
		--描述面板描述信息
		--用\r分割
		tbl["strengthen"] = WUXUE_DESC1[tid] or --[[!AUTO_1454]]""
		--描述面板属性信息

		--用\r分割
		--描述面板附加信息
		--用\r分割
		tbl["desc"] = WUXUE_DESC2[tid] or --[[!AUTO_1455]]""
		--描述面板价格信息
		--单位依次：文、贯、金、玉
		--描述面板声望消耗信息

		--描述面板物品兑换信息
		--描述面板元宝信息
		--单位依次：银元、金元
	else
		--描述面板表头
		local sTitle = --[[!AUTO_1456]]"自创武学"
		if TestShowItemId and TestShowItemId == 1 then --调试模式d_script TestShowItemId = 1
			tbl["title"] = sTitle .. --[[!AUTO_1457]]"(" .. tid .. --[[!AUTO_1458]]")"
		else
			tbl["title"] = sTitle
		end
		--描述面板图标
		tbl["icon"] = --[[!AUTO_1459]]"06568自创武学.dds"
		--描述面板表头
		--1最多3行，2最多1行，3最多2行（用\r分割）
		tbl["info1"] = WUXUE_SELF_DESC
		--描述面板星级
		--s_t，s代表星数，-1不显示。t代表显示方案，0为正常，1为同步闪烁，2为待定
		tbl["star"] = --[[!AUTO_1460]]"-1_0"
		--描述面板限制（左）与消耗（右）
		--用\r分割
		--描述面板描述信息
		--用\r分割
		tbl["strengthen"] = WUXUE_ALL_DESC
		--描述面板属性信息
		--用\r分割
		--描述面板附加信息
		--用\r分割
		tbl["desc"] = WUXUE_SELF_TITLE
		--描述面板价格信息
		--单位依次：文、贯、金、玉
		--描述面板声望消耗信息
		--描述面板物品兑换信息
		--描述面板元宝信息
		--单位依次：银元、金元
	end

	tbl["remark"] =  WUXUE_CHANGE_DESC
	return tbl
end

function SkillTip:DivideWuXueType(wuxuetype)
	local str1,str2 = string.match(wuxuetype,--[[!AUTO_1461]]"([^\\]+)\\(.*)")

	return str1,str2
end

--怒气技能面板，技能视频，描述
function SkillTip:GetXPSkillDesc(XPSkillID)
	local XPVideo = --[[!AUTO_1462]]""
	local XPDesc = --[[!AUTO_1463]]""
	if XPSkillID > 0 then
		XPVideo = SkillTip.VideoPath.XPSkill[XPSkillID]
		XPDesc = SKILL_DETAIL_DESC[XPSkillID]

	end
	return XPVideo,XPDesc
end


function SkillTip:GetElementAttr(p_id)
	for k,v in pairs(ElementAttr) do
		if v.ID == p_id then
			return v.attr1,v.attr2,v.attr3,v.attr4,v.attr5
		end
	end

	return --[[!AUTO_1464]]"0",--[[!AUTO_1465]]"0",--[[!AUTO_1466]]"0",--[[!AUTO_1467]]"0",--[[!AUTO_1468]]"0"
end

--武魂激活的技能， 对技能效果简短描述
SkillTip.KungfuSoulActiveSkill = 
{
	--[skillid] = 描述信息
    [10509]={"^00ff00","回复体力20点",},
    [10510]={"^00ff00","回复体力35点",},
    [10511]={"^3485ff","回复体力50点",},
    [10512]={"^3485ff","回复体力65点",},
    [10513]={"^ce58ff","回复体力80点",},
    [10514]={"^00ff00","回复生命15%",},
    [10515]={"^00ff00","回复生命20%",},
    [10516]={"^3485ff","回复生命25%",},
    [10517]={"^3485ff","回复生命30%",},
    [10518]={"^ce58ff","回复生命40%",},
    [10519]={"^00ff00","回复怒气100点",},
    [10520]={"^00ff00","回复怒气200点",},
    [10521]={"^3485ff","回复怒气300点",},
    [10522]={"^3485ff","回复怒气400点",},
    [10523]={"^ce58ff","回复怒气500点",},
    [10524]={"^00ff00","内外攻伤害减免20%,持续4秒",},
    [10525]={"^00ff00","内外攻伤害减免35%,持续4秒",},
    [10526]={"^3485ff","内外攻伤害减免50%,持续4秒",},
    [10527]={"^3485ff","内外攻伤害减免65%,持续4秒",},
    [10528]={"^ce58ff","内外攻伤害减免80%,持续4秒",},
    [10529]={"^00ff00","外功攻击提升15%,持续8秒",},
    [10530]={"^00ff00","外功攻击提升25%,持续8秒",},
    [10531]={"^3485ff","外功攻击提升35%,持续8秒",},
    [10532]={"^3485ff","外功攻击提升45%,持续8秒",},
    [10533]={"^ce58ff","外功攻击提升60%,持续8秒",},
    [10534]={"^00ff00","内功攻击提升15%,持续8秒",},
    [10535]={"^00ff00","内功攻击提升25%,持续8秒",},
    [10536]={"^3485ff","内功攻击提升35%,持续8秒",},
    [10537]={"^3485ff","内功攻击提升45%,持续8秒",},
    [10538]={"^ce58ff","内功攻击提升60%,持续8秒",},
    [10539]={"^00ff00","俊足，并获得微量移动速度提升,持续6秒",},
    [10540]={"^00ff00","俊足，并获得少量移动速度提升,持续6秒",},
    [10541]={"^3485ff","俊足，并获得中量移动速度提升,持续6秒",},
    [10542]={"^3485ff","俊足，并获得大量移动速度提升,持续6秒",},
    [10543]={"^ce58ff","俊足，并获得巨量移动速度提升,持续6秒",},
    [10544]={"^00ff00","1秒内刚体",},
    [10545]={"^00ff00","2秒内刚体",},
    [10546]={"^3485ff","3秒内刚体",},
    [10547]={"^3485ff","4秒内刚体",},
    [10548]={"^ce58ff","5秒内刚体",},
    [10549]={"^00ff00","1秒内霸体",},
    [10550]={"^00ff00","1.5秒内霸体",},
    [10551]={"^3485ff","2秒内霸体",},
    [10552]={"^3485ff","2.5秒内霸体",},
    [10553]={"^ce58ff","3秒内霸体",},
    [10554]={"^00ff00","回复微量的蓝",},
    [10555]={"^00ff00","回复少量的蓝",},
    [10556]={"^3485ff","回复中量的蓝",},
    [10557]={"^3485ff","回复大量的蓝",},
    [10558]={"^ce58ff","回复巨量的蓝",},
    [10559]={"^00ff00","冰抗提升40%,持续8秒",},
    [10560]={"^00ff00","冰抗提升55%,持续8秒",},
    [10561]={"^3485ff","冰抗提升70%,持续8秒",},
    [10562]={"^3485ff","冰抗提升85%,持续8秒",},
    [10563]={"^ce58ff","冰抗提升100%,持续8秒",},
    [10564]={"^00ff00","火抗提升40%,持续8秒",},
    [10565]={"^00ff00","火抗提升55%,持续8秒",},
    [10566]={"^3485ff","火抗提升70%,持续8秒",},
    [10567]={"^3485ff","火抗提升85%,持续8秒",},
    [10568]={"^ce58ff","火抗提升100%,持续8秒",},
    [10569]={"^00ff00","毒抗提升40%,持续8秒",},
    [10570]={"^00ff00","毒抗提升55%,持续8秒",},
    [10571]={"^3485ff","毒抗提升70%,持续8秒",},
    [10572]={"^3485ff","毒抗提升85%,持续8秒",},
    [10573]={"^ce58ff","毒抗提升100%,持续8秒",},
    [10574]={"^00ff00","土抗提升40%,持续8秒",},
    [10575]={"^00ff00","土抗提升55%,持续8秒",},
    [10576]={"^3485ff","土抗提升70%,持续8秒",},
    [10577]={"^3485ff","土抗提升85%,持续8秒",},
    [10578]={"^ce58ff","土抗提升100%,持续8秒",},
    [10579]={"^00ff00","外攻防御提高50%,持续8秒",},
    [10580]={"^00ff00","外攻防御提高80%,持续8秒",},
    [10581]={"^3485ff","外攻防御提高110%,持续8秒",},
    [10582]={"^3485ff","外攻防御提高140%,持续8秒",},
    [10583]={"^ce58ff","外攻防御提高180%,持续8秒",},
    [10584]={"^00ff00","内攻防御提高50%,持续8秒",},
    [10585]={"^00ff00","内攻防御提高80%,持续8秒",},
    [10586]={"^3485ff","内攻防御提高110%,持续8秒",},
    [10587]={"^3485ff","内攻防御提高140%,持续8秒",},
    [10588]={"^ce58ff","内攻防御提高180%,持续8秒",},
}

function SkillTip:GetKungfuSoulActiveSkillDesc( skillid, times  )
	local desc = SkillTip.KungfuSoulActiveSkill[skillid] or SkillTip.KungfuSoulActiveSkill[0]
	local strTimes = string.format( "觉醒%d次:", times )
	local strDesc = desc[1] .. strTimes .. desc[2]
	return strDesc
end

function SkillTip:GetKungfuSoulUnactiveSkillDesc( skillid, times  )
	local desc = SkillTip.KungfuSoulActiveSkill[skillid] or SkillTip.KungfuSoulActiveSkill[0]
	local strTimes = string.format( "觉醒%d次:", times )
	local strDesc = "^bbbbbb" .. strTimes .. desc[2]
	return strDesc
end



