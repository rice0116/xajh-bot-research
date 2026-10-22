------------------------------------------------
--***	说明
------------------------------------------------
-- start_time/end_time：负数表示离状态结束还有多少时间。-1表示结束。
-- seektime：负数表示离动作结束还有多少时间。-1表示结束。
-- HMove/VMove，除了最后一项，每一项都需要写明init_speed。最后一项的init_speed是程序算以保证到达目的点。

local SPEEDFLAG_AUTO		= 0	--	init_speed由程序自动决定。不写speed_flag的话默认是这个
local SPEEDFLAG_FORCEDEFINE	= 1	--	强制使用定义的init_speed，程序里不做计算
local SPEEDFLAG_NEEDCALC	= 2	--	不使用init_speed，程序里自行计算
local SPEEDFLAG_FORCE_BELOW	= 3	--	程序里计算的值，强制小于定义的init_speed

------------------------------------------------
--***	大控制状态
------------------------------------------------
SkillVisual.CtrlStateParam =
{
	-------------------------------------------------------
	--hint:大控制－－击飞
	-------------------------------------------------------
	[SkillVisual.CTRLSTATEID_BEATAIR] =
	{
		["None"] = --原地
		{
			["ModifyECM"] =
			{
				{start_time = 0, newecm = "", seektime = 0, transtime = 0, anispeed = 100, pre = {"pt"}, mid = "被击飞"},
				-- 控制最后500ms：播动作最后500ms
				{start_time = -300, newecm = "", seektime = -1000, transtime = 100, anispeed = 200, pre = {"pt"}, mid = "被击飞"},
			},
			["HMove"] = { {start_time = 0, end_time = -1, hacc = -50}, },
			-- 上升段：end_time由init_speed/-vg动态计算
			-- 下降段：begintime为上升段的end_time
			["VMove"] =
			{
				{start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW, }, -- 上升段
		  	--{start_time = 500, end_time = -300, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW, }, -- 下降段
		  	-- 最后300毫秒：躺地上不动
		  	--{start_time = -300, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW},
			},
		},
		["Push"] = --击退
		{
			["ModifyECM"] =
			{
				{start_time = 0, newecm = "", seektime = 0, transtime = 0, anispeed = 100, pre = {"pt"}, mid = "被击飞"},
				-- 控制最后500ms：播动作最后500ms
				{start_time = -300, newecm = "", seektime = -1000, transtime = 100, anispeed = 200, pre = {"pt"}, mid = "被击飞"},
			},
			["HMove"] = { {start_time = 0, end_time = -1, hacc = -50}, },
			-- 上升段：end_time由init_speed/-vg动态计算
			-- 下降段：begintime为上升段的end_time
			["VMove"] =
			{
				{start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW, }, -- 上升段
		  	--{start_time = 500, end_time = -300, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW, }, -- 下降段
		  	-- 最后300毫秒：躺地上不动
		  	--{start_time = -300, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW},
			},
		},
		["Pull"] = --拉回
		{
			["ModifyECM"] =
			{
				{start_time = 0, newecm = "", seektime = 0, transtime = 0, anispeed = 100, pre = {"pt"}, mid = "被击飞"},
				-- 控制最后500ms：播动作最后500ms
				{start_time = -300, newecm = "", seektime = -1000, transtime = 100, anispeed = 200, pre = {"pt"}, mid = "被击飞"},
			},
			["HMove"] = { {start_time = 0, end_time = -1, hacc = -50}, },
			-- 上升段：end_time由init_speed/-vg动态计算
			-- 下降段：begintime为上升段的end_time
			["VMove"] =
			{
				{start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW, }, -- 上升段
		  	--{start_time = 500, end_time = -300, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW, }, -- 下降段
		  	-- 最后300毫秒：躺地上不动
		  	--{start_time = -300, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW},
			},
		},
		["Wound"] = --受伤
		{
			--["PlayChn"] = SKILLVIS_CHN_PARA_ACT, -- 作为并行动作通道（不冲主通道）
			["ModifyECM"] =
			{
				{start_time = 0, newecm = "", seektime = 0, transtime = 0, anispeed = 100, pre = {"pt"}, mid = "被击飞"},
			},
			-- 上升段：init_speed由defense的变化百分比动态计算，end_time由init_speed/-vg动态计算
			-- 下降段：start_time为上升段的end_time
			["VMove"] =
			{
				{start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW},
				--{start_time = 200, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW},
			},
		},
	},
	-------------------------------------------------------
	--hint:大控制－－击溃
	-------------------------------------------------------
	[SkillVisual.CTRLSTATEID_BEATCOLLAPSE] =
	{
		["None"] = --原地
		{
			["ModifyECM"] =
			{
				-- Key表示起始时间
				{start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100, pre = {"pt"}, mid = "被击晕"},
				-- 控制最后500ms：播动作最后500ms
				--{start_time = -500, newecm = "", seektime = -500, transtime = 100, anispeed = 100, pre = {"pt"}, mid = "被击晕"},
			},
			["HMove"] = { {start_time = 0, end_time = -1, hacc = -50}, },
			--	得落到地上
			["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
		},
		["Push"] = --击退
		{
			["ModifyECM"] =
			{
				-- Key表示起始时间
				{start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100, pre = {"pt"}, mid = "被击晕"},
				-- 控制最后500ms：播动作最后500ms
				--{start_time = -500, newecm = "", seektime = -500, transtime = 100, anispeed = 100, pre = {"pt"}, mid = "被击晕"},
			},
			["HMove"] = { {start_time = 0, end_time = -1, hacc = -50}, },
			--	得落到地上
			["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
		},
		["Pull"] = --拉回
		{
			["ModifyECM"] =
			{
				-- Key表示起始时间
				{start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100, pre = {"pt"}, mid = "被击晕"},
				-- 控制最后500ms：播动作最后500ms
				--{start_time = -500, newecm = "", seektime = -500, transtime = 100, anispeed = 100, pre = {"pt"}, mid = "被击晕"},
			},
			["HMove"] = { {start_time = 0, end_time = -1, hacc = -50}, },
			--	得落到地上
			["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
		},
		["Wound"] = --受伤
		{
			--["PlayChn"] = SKILLVIS_CHN_PARA_ACT, -- -- 作为并行动作通道（不冲主通道）
			["ModifyECM"] =
			{
				{start_time = 0, newecm = "", seektime = 0, transtime = 0, anispeed = 100, pre = {"pt"}, mid = "被击晕", },
			},
			["VMove"] =
			{
				{start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW},
			},
		},
	},
	-------------------------------------------------------
	--hint:大控制－－击倒
	-------------------------------------------------------
	[SkillVisual.CTRLSTATEID_BEATDOWN] =
	{
		["None"] = --原地
		{
			["ModifyECM"] =
			{
				--Key表示起始时间
				{start_time = 0, newecm = "", seektime = 0, transtime = 0, anispeed = 100, pre = {"pt"}, mid = "被击倒",},
				 -- 控制最后500ms：播动作最后500ms
				{start_time = -500, newecm = "", seektime = -1000, transtime = 100, anispeed = 200, pre = {"pt"}, mid = "被击倒"},
			},
			["HMove"] = { {start_time = 0, end_time = -1, hacc = -50}, },
			--	得落到地上
			["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
		},
		["Push"] = --击退
		{
			["ModifyECM"] =
			{
				--Key表示起始时间
				{start_time = 0, newecm = "", seektime = 0, transtime = 0, anispeed = 100, pre = {"pt"}, mid = "被击倒",},
				 -- 控制最后500ms：播动作最后500ms
				{start_time = -500, newecm = "", seektime = -1000, transtime = 100, anispeed = 200, pre = {"pt"}, mid = "被击倒"},
			},
			["HMove"] = { {start_time = 0, end_time = -1, hacc = -50}, },
			--	得落到地上
			["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
		},
		["Pull"] = --拉回
		{
			["ModifyECM"] =
			{
				--Key表示起始时间
				{start_time = 0, newecm = "", seektime = 0, transtime = 0, anispeed = 100, pre = {"pt"}, mid = "被击倒",},
				 -- 控制最后500ms：播动作最后500ms
				{start_time = -500, newecm = "", seektime = -1000, transtime = 100, anispeed = 200, pre = {"pt"}, mid = "被击倒"},
			},
			["HMove"] = { {start_time = 0, end_time = -1, hacc = -50}, },
			--	得落到地上
			["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
		},
		["Wound"] = --受伤
		{
			--["PlayChn"] = SKILLVIS_CHN_PARA_ACT, -- -- 作为并行动作通道（不冲主通道）
			["ModifyECM"] =
			{
				{start_time = 0, newecm = "", seektime = 250, transtime = 100, anispeed = 100, pre = {"pt"}, mid = "被击倒",},
			},
			["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
		},
	},
	-------------------------------------------------------
	--hint:格挡受伤
	-------------------------------------------------------
	[SkillVisual.CTRLSTATEID_WOUND_BLOCK] =
	{
		["ModifyECM"] =
		{
			{start_time = 0, newecm = "", seektime = 0, transtime = 0, anispeed = 100, pre = {"zs"}, mid = "",}, --mid动态生成
		},

		["VMove"] = { {start_time = 0, end_time = 5000, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
}

------------------------------------------------
--***	小控制状态
------------------------------------------------
-- idThrowSkill: 投技技能id
SkillVisual.SmallCtrlParam =
{
	-------------------------------------------------------
	--hint:小控制－－击飞
	-------------------------------------------------------
	[SkillVisual.CTRLSTATEID_BEATAIR] =
	{
		["None"] = --原地
		{
			[0] = -- 默认配置
			{
				["ModifyECM"] =
				{
					{start_time = 0, newecm = "", seektime = 0, transtime = 0, anispeed = 100, pre = {"pt"}, mid = "被击飞"},
					{start_time = -300, newecm = "", seektime = -1000, transtime = 200, anispeed = 100, pre = {"pt"}, mid = "被击飞"},
				},
				["HMove"] = { {start_time = 0, end_time = -1, hacc = -50}, },
				["VMove"] =
				{
					--上升段：500ms飞?米高，加速-40 -> 初速18
					{start_time = 100, end_time = 600, vg = -40, init_speed = 18, speed_flag = SPEEDFLAG_FORCEDEFINE,},
					--下降段：初速0，加速-20，下降?米 -> 耗时700ms
					{start_time = 600, end_time = 1300, vg = -20, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,},
					--模拟弹地1次：500ms
					{start_time = 1300, end_time = 1800, vg = -20, init_speed = 6, speed_flag = SPEEDFLAG_NEEDCALC,},
					--模拟弹地2次：350ms
					{start_time = 1850, end_time = 2200, vg = -20, init_speed = 3, speed_flag = SPEEDFLAG_NEEDCALC,},
					--最后250毫秒：躺地上不动
					{start_time = -250, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW},
				},
			},
			--[[[0] = -- 默认配置
			{
				["ModifyECM"] =
				{
					{start_time = 0, newecm = "", seektime = 0, transtime = 0, anispeed = 100, pre = {"pt"}, mid = "被击飞"},
					{start_time = -300, newecm = "", seektime = -1000, transtime = 200, anispeed = 100, pre = {"pt"}, mid = "被击飞"},
				},
				["HMove"] = { {start_time = 0, end_time = -1, hacc = -50}, },
				["VMove"] = {
				{
					start_time = 0, end_time = -1, vg = -10, init_speed = 0, speed_flag = SPEEDFLAG_FORCEDEFINE,},
					-- 最后250毫秒：躺地上不动
					--{start_time = -250, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW},
				},
			},
			]]

			-- 根据技能id做特殊配置
		},
		["Push"] = --击退
		{
			[0] = -- 默认配置
			{
				["ModifyECM"] =
				{
					--[[
					{start_time = 0, end_time = 1300, newecm = "", seektime = 0, transtime = 0, anispeed = 100, pre = {"pt"}, mid = "被击飞"},
					{start_time = 1301, end_time = 1400, newecm = "", seektime = 500, transtime = 0, anispeed = 100, pre = {"pt"}, mid = "被击飞"},
					{start_time = 1401, end_time = 1850, newecm = "", seektime = 1401, transtime = 0, anispeed = 100, pre = {"pt"}, mid = "被击飞"},
					{start_time = 1851, end_time = 1950, newecm = "", seektime = 500, transtime = 0, anispeed = 100, pre = {"pt"}, mid = "被击飞"},
					{start_time = 1951, end_time = -1, newecm = "", seektime = 1951, transtime = 0, anispeed = 100, pre = {"pt"}, mid = "被击飞"},
					]]
					{start_time = 0, newecm = "", seektime = 0, transtime = 0, anispeed = 100, pre = {"pt"}, mid = "被击飞"},
					--{start_time = -300, newecm = "", seektime = -1000, transtime = 100, anispeed = 200, pre = {"pt"}, mid = "被击飞"},
				},
				["HMove"] =
				{
					{start_time = 100, end_time = 2000, hacc = -20, },
					--{start_time = 0, end_time = 320, hacc = 62, },
					--{start_time = 321, end_time = -1500, hacc = -30, },
					--{start_time = 0, end_time = 1800, hacc = -20, },
				},
				["VMove"] =
				{
					--start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCEDEFINE,},
					--{start_time = 150, end_time = 500, vg = -32, init_speed = 40, speed_flag = SPEEDFLAG_FORCEDEFINE,},
					--start_time = 0, end_time = 2000, vg = -16, init_speed = 6.93, speed_flag = SPEEDFLAG_FORCEDEFINE,},
					--最后250毫秒：躺地上不动
					--{start_time = -250, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW},
					--上升段：500ms飞?米高，加速-40 -> 初速18
					{start_time = 100, end_time = 600, vg = -40, init_speed = 18, speed_flag = SPEEDFLAG_FORCEDEFINE,},
					--下降段：初速0，加速-20，下降?米 -> 耗时700ms
					{start_time = 600, end_time = 1300, vg = -20, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW, end_gfx = "人物\\地形触发通用效果\\倒地通用\\",},
					--模拟弹地1次：500ms
					{start_time = 1300, end_time = 1800, vg = -20, init_speed = 6, speed_flag = SPEEDFLAG_NEEDCALC, end_gfx = "人物\\地形触发通用效果\\倒地通用\\", },
					--模拟弹地2次：350ms
					{start_time = 1850, end_time = 2200, vg = -20, init_speed = 3, speed_flag = SPEEDFLAG_NEEDCALC, end_gfx = "人物\\地形触发通用效果\\倒地通用\\", },
					--最后250毫秒：躺地上不动
					{start_time = -250, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW},
				},
			},
			--[[
			[0] = -- 默认配置
			{
				["ModifyECM"] =
				{
					{start_time = 0, newecm = "", seektime = 0, transtime = 0, anispeed = 100, pre = {"pt"}, mid = "被击飞"},
					{start_time = -300, newecm = "", seektime = -1000, transtime = 100, anispeed = 200, pre = {"pt"}, mid = "被击飞"},
				},
				["HMove"] = { {start_time = 0, end_time = -1, hacc = -50}, },
				["VMove"] = {
				{
					start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCEDEFINE,},
					-- 最后250毫秒：躺地上不动
					--{start_time = -250, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW},
				},
			},
			]]

			-- 根据投技技能id做特殊配置

			[4893] = -- 武当迎风掸尘(V5_zd_背剑柔掌_武当)
			{
				["ModifyECM"] =
				{
					{start_time = 0, newecm = "", seektime = 0, transtime = 0, anispeed = 100, pre = {"pt"}, mid = "被击飞"},
				},
				["HMove"] =
				{
					{start_time = 0, end_time = 1000, hacc = -20, },
				},
				["VMove"] =
				{
					--上升段：300ms飞?米高，加速-40 -> 初速9
					{start_time = 0, end_time = 300, vg = -40, init_speed = 9, speed_flag = SPEEDFLAG_FORCEDEFINE,},
					--下降段：初速0，加速-20，下降?米 -> 耗时300ms
					{start_time = 300, end_time = 600, vg = -20, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW, end_gfx = "人物\\地形触发通用效果\\倒地通用\\",},
					--模拟弹地1次：300ms
					{start_time = 650, end_time = 950, vg = -20, init_speed = 3, speed_flag = SPEEDFLAG_NEEDCALC, end_gfx = "人物\\地形触发通用效果\\倒地通用\\", },
					--最后250毫秒：躺地上不动
					{start_time = -250, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW},
				},
			},
			[4690] = -- 恒山拨云见日(V5_zd_双剑绕踢_恒山)
			{
				["ModifyECM"] =
				{
					{start_time = 0, newecm = "", seektime = 0, transtime = 0, anispeed = 100, pre = {"pt"}, mid = "被击飞"},
				},
				["HMove"] =
				{
					{start_time = 0, end_time = 1000, hacc = -20, },
				},
				["VMove"] =
				{
					--上升段：300ms飞?米高，加速-40 -> 初速9
					{start_time = 0, end_time = 300, vg = -40, init_speed = 9, speed_flag = SPEEDFLAG_FORCEDEFINE,},
					--下降段：初速0，加速-20，下降?米 -> 耗时300ms
					{start_time = 300, end_time = 600, vg = -20, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW, end_gfx = "人物\\地形触发通用效果\\倒地通用\\",},
					--模拟弹地1次：300ms
					{start_time = 650, end_time = 950, vg = -20, init_speed = 3, speed_flag = SPEEDFLAG_NEEDCALC, end_gfx = "人物\\地形触发通用效果\\倒地通用\\", },
					--最后250毫秒：躺地上不动
					{start_time = -250, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW},
				},
			},
			[3604] = -- 华山诗剑会友(V4_zd_气宗投技_华山)
			{
				["ModifyECM"] =
				{
					{start_time = 0, newecm = "", seektime = 0, transtime = 0, anispeed = 100, pre = {"pt"}, mid = "被击飞"},
				},
				["HMove"] =
				{
					{start_time = 100, end_time = 2000, hacc = -20, },
				},
				["VMove"] =
				{
					--上升段：500ms飞?米高，加速-40 -> 初速9
					{start_time = 100, end_time = 600, vg = -40, init_speed = 12, speed_flag = SPEEDFLAG_FORCEDEFINE,},
					--下降段：初速0，加速-40，下降?米 -> 耗时700ms
					{start_time = 600, end_time = 1300, vg = -20, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW, end_gfx = "人物\\地形触发通用效果\\倒地通用\\",},
					--模拟弹地1次：500ms
					{start_time = 1300, end_time = 1800, vg = -20, init_speed = 6, speed_flag = SPEEDFLAG_NEEDCALC, end_gfx = "人物\\地形触发通用效果\\倒地通用\\", },
					--模拟弹地2次：350ms
					{start_time = 1850, end_time = 2200, vg = -20, init_speed = 3, speed_flag = SPEEDFLAG_NEEDCALC, end_gfx = "人物\\地形触发通用效果\\倒地通用\\", },
					--最后250毫秒：躺地上不动
					{start_time = -250, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW},
				},
			},
			[4185] = -- 唐门凶鹰袭兔(V3_zzd_拳套抓投_唐门)
			{
				["ModifyECM"] =
				{
					{start_time = 0, newecm = "", seektime = 0, transtime = 0, anispeed = 100, pre = {"pt"}, mid = "被击飞"},
				},
				["HMove"] =
				{
					{start_time = 100, end_time = 2000, hacc = -20, },
				},
				["VMove"] =
				{
					--上升段：500ms飞?米高，加速-40 -> 初速9
					{start_time = 100, end_time = 600, vg = -40, init_speed = 12, speed_flag = SPEEDFLAG_FORCEDEFINE,},
					--下降段：初速0，加速-40，下降?米 -> 耗时700ms
					{start_time = 600, end_time = 1300, vg = -20, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW, end_gfx = "人物\\地形触发通用效果\\倒地通用\\",},
					--模拟弹地1次：500ms
					{start_time = 1300, end_time = 1800, vg = -20, init_speed = 6, speed_flag = SPEEDFLAG_NEEDCALC, end_gfx = "人物\\地形触发通用效果\\倒地通用\\", },
					--模拟弹地2次：350ms
					{start_time = 1850, end_time = 2200, vg = -20, init_speed = 3, speed_flag = SPEEDFLAG_NEEDCALC, end_gfx = "人物\\地形触发通用效果\\倒地通用\\", },
					--最后250毫秒：躺地上不动
					{start_time = -250, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW},
				},
			},
			[6099] = -- 老头子的小小投掷(SkillBaseData\技能\30\名人16老头子绝技2\名人16老头子绝技2.tmpl)
			{
				["ModifyECM"] =
				{
					{start_time = 0, newecm = "", seektime = 0, transtime = 0, anispeed = 100, pre = {"pt"}, mid = "被击飞"},
				},
				["HMove"] =
				{
					{start_time = 0, end_time = 800, hacc = -20, },
				},
				["VMove"] =
				{
					--上升段：300ms飞?米高，加速-40 -> 初速9
					{start_time = 0, end_time = 300, vg = -60, init_speed = 18, speed_flag = SPEEDFLAG_FORCEDEFINE,},
					--下降段：初速0，加速-20，下降?米 -> 耗时300ms
					{start_time = 300, end_time = 800, vg = -40, init_speed = 0, speed_flag = SPEEDFLAG_FORCEDEFINE, end_gfx = "人物\\地形触发通用效果\\倒地通用\\",},
					--最后250毫秒：躺地上不动
					--{start_time = 750, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW},
				},
			},

			--按照技能ID的特殊配置
			[4833] = -- 少林挟山超海(V5_zd_前顶_少林)
			{
				["ModifyECM"] =
				{
					{start_time = 0, newecm = "", seektime = 0, transtime = 0, anispeed = 100, pre = {"pt"}, mid = "被击飞"},
				},
				["HMove"] =
				{
					{start_time = 0, end_time = 1000, hacc = -20, },
				},
				["VMove"] =
				{
					--上升段：300ms飞?米高，加速-40 -> 初速9
					{start_time = 0, end_time = 300, vg = -40, init_speed = 9, speed_flag = SPEEDFLAG_FORCEDEFINE,},
					--下降段：初速0，加速-20，下降?米 -> 耗时300ms
					{start_time = 300, end_time = 600, vg = -20, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW, end_gfx = "人物\\地形触发通用效果\\倒地通用\\",},
					--模拟弹地1次：300ms
					{start_time = 650, end_time = 950, vg = -20, init_speed = 3, speed_flag = SPEEDFLAG_NEEDCALC, end_gfx = "人物\\地形触发通用效果\\倒地通用\\", },
					--最后250毫秒：躺地上不动
					{start_time = -250, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW},
				},
			},
			[4891] = -- 武当三环套月(V5_zd_斗转星移1_武当)
			{
				["ModifyECM"] =
				{
					{start_time = 0, newecm = "", seektime = 0, transtime = 0, anispeed = 100, pre = {"pt"}, mid = "被击飞"},
				},
				["HMove"] =
				{
					{start_time = 0, end_time = 1000, hacc = -20, },
				},
				["VMove"] =
				{
					--上升段：300ms飞?米高，加速-40 -> 初速9
					{start_time = 0, end_time = 300, vg = -40, init_speed = 9, speed_flag = SPEEDFLAG_FORCEDEFINE,},
					--下降段：初速0，加速-20，下降?米 -> 耗时300ms
					{start_time = 300, end_time = 600, vg = -20, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW, end_gfx = "人物\\地形触发通用效果\\倒地通用\\",},
					--模拟弹地1次：300ms
					{start_time = 650, end_time = 950, vg = -20, init_speed = 3, speed_flag = SPEEDFLAG_NEEDCALC, end_gfx = "人物\\地形触发通用效果\\倒地通用\\", },
					--最后250毫秒：躺地上不动
					{start_time = -250, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW},
				},
			},
			[4892] = -- 武当青龙摆尾(V5_zd_运剑前刺_武当)
			{
				["ModifyECM"] =
				{
					{start_time = 0, newecm = "", seektime = 0, transtime = 0, anispeed = 100, pre = {"pt"}, mid = "被击飞"},
				},
				["HMove"] =
				{
					{start_time = 0, end_time = 1000, hacc = -20, },
				},
				["VMove"] =
				{
					--上升段：300ms飞?米高，加速-40 -> 初速9
					{start_time = 0, end_time = 300, vg = -40, init_speed = 9, speed_flag = SPEEDFLAG_FORCEDEFINE,},
					--下降段：初速0，加速-20，下降?米 -> 耗时300ms
					{start_time = 300, end_time = 600, vg = -20, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW, end_gfx = "人物\\地形触发通用效果\\倒地通用\\",},
					--模拟弹地1次：300ms
					{start_time = 650, end_time = 950, vg = -20, init_speed = 3, speed_flag = SPEEDFLAG_NEEDCALC, end_gfx = "人物\\地形触发通用效果\\倒地通用\\", },
					--最后250毫秒：躺地上不动
					{start_time = -250, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW},
				},
			},
			[2674] = -- 武当拨云瞻日(V2_YJ_zd1_飞剑狂刺_武当)
			{
				["ModifyECM"] =
				{
					{start_time = 0, newecm = "", seektime = 0, transtime = 0, anispeed = 100, pre = {"pt"}, mid = "被击飞"},
				},
				["HMove"] =
				{
					{start_time = 0, end_time = 1000, hacc = -20, },
				},
				["VMove"] =
				{
					--上升段：300ms飞?米高，加速-40 -> 初速9
					{start_time = 0, end_time = 300, vg = -40, init_speed = 9, speed_flag = SPEEDFLAG_FORCEDEFINE,},
					--下降段：初速0，加速-20，下降?米 -> 耗时300ms
					{start_time = 300, end_time = 600, vg = -20, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW, end_gfx = "人物\\地形触发通用效果\\倒地通用\\",},
					--模拟弹地1次：300ms
					{start_time = 650, end_time = 950, vg = -20, init_speed = 3, speed_flag = SPEEDFLAG_NEEDCALC, end_gfx = "人物\\地形触发通用效果\\倒地通用\\", },
					--最后250毫秒：躺地上不动
					{start_time = -250, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW},
				},
			},
			[4899] = -- 日月罗刹索命(蓄力击飞、当身摔投)
			{
				["ModifyECM"] =
				{
					{start_time = 0, newecm = "", seektime = 0, transtime = 0, anispeed = 100, pre = {"pt"}, mid = "被击飞"},
				},
				["HMove"] =
				{
					{start_time = 0, end_time = 1000, hacc = -20, },
				},
				["VMove"] =
				{
					--上升段：300ms飞?米高，加速-40 -> 初速9
					{start_time = 0, end_time = 300, vg = -40, init_speed = 9, speed_flag = SPEEDFLAG_FORCEDEFINE,},
					--下降段：初速0，加速-20，下降?米 -> 耗时300ms
					{start_time = 300, end_time = 600, vg = -20, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW, end_gfx = "人物\\地形触发通用效果\\倒地通用\\",},
					--模拟弹地1次：300ms
					{start_time = 650, end_time = 950, vg = -20, init_speed = 3, speed_flag = SPEEDFLAG_NEEDCALC, end_gfx = "人物\\地形触发通用效果\\倒地通用\\", },
					--最后250毫秒：躺地上不动
					{start_time = -250, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW},
				},
			},
			[6610] = -- 日月罗刹索命(蓄力击飞、当身摔投)
			{
				["ModifyECM"] =
				{
					{start_time = 0, newecm = "", seektime = 0, transtime = 0, anispeed = 100, pre = {"pt"}, mid = "被击飞"},
				},
				["HMove"] =
				{
					{start_time = 0, end_time = 1000, hacc = -20, },
				},
				["VMove"] =
				{
					--上升段：300ms飞?米高，加速-40 -> 初速9
					{start_time = 0, end_time = 300, vg = -40, init_speed = 9, speed_flag = SPEEDFLAG_FORCEDEFINE,},
					--下降段：初速0，加速-20，下降?米 -> 耗时300ms
					{start_time = 300, end_time = 600, vg = -20, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW, end_gfx = "人物\\地形触发通用效果\\倒地通用\\",},
					--模拟弹地1次：300ms
					{start_time = 650, end_time = 950, vg = -20, init_speed = 3, speed_flag = SPEEDFLAG_NEEDCALC, end_gfx = "人物\\地形触发通用效果\\倒地通用\\", },
					--最后250毫秒：躺地上不动
					{start_time = -250, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW},
				},
			},
			[4905] = -- 日月搅海穿云(V5_zd_双膝升龙_日月)
			{
				["ModifyECM"] =
				{
					{start_time = 0, newecm = "", seektime = 0, transtime = 0, anispeed = 100, pre = {"pt"}, mid = "被击飞"},
				},
				["HMove"] =
				{
					{start_time = 0, end_time = 1000, hacc = -20, },
				},
				["VMove"] =
				{
					--上升段：300ms飞?米高，加速-40 -> 初速9
					{start_time = 0, end_time = 300, vg = -40, init_speed = 9, speed_flag = SPEEDFLAG_FORCEDEFINE,},
					--下降段：初速0，加速-20，下降?米 -> 耗时300ms
					{start_time = 300, end_time = 600, vg = -20, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW, end_gfx = "人物\\地形触发通用效果\\倒地通用\\",},
					--模拟弹地1次：300ms
					{start_time = 650, end_time = 950, vg = -20, init_speed = 3, speed_flag = SPEEDFLAG_NEEDCALC, end_gfx = "人物\\地形触发通用效果\\倒地通用\\", },
					--最后250毫秒：躺地上不动
					{start_time = -250, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW},
				},
			},
			[4088] = -- 日月蛇行无迹(V2_zd_下踹_日月)
			{
				["ModifyECM"] =
				{
					{start_time = 0, newecm = "", seektime = 0, transtime = 0, anispeed = 100, pre = {"pt"}, mid = "被击飞"},
				},
				["HMove"] =
				{
					{start_time = 0, end_time = 1000, hacc = -20, },
				},
				["VMove"] =
				{
					--上升段：300ms飞?米高，加速-40 -> 初速9
					{start_time = 0, end_time = 300, vg = -40, init_speed = 9, speed_flag = SPEEDFLAG_FORCEDEFINE,},
					--下降段：初速0，加速-20，下降?米 -> 耗时300ms
					{start_time = 300, end_time = 600, vg = -20, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW, end_gfx = "人物\\地形触发通用效果\\倒地通用\\",},
					--模拟弹地1次：300ms
					{start_time = 650, end_time = 950, vg = -20, init_speed = 3, speed_flag = SPEEDFLAG_NEEDCALC, end_gfx = "人物\\地形触发通用效果\\倒地通用\\", },
					--最后250毫秒：躺地上不动
					{start_time = -250, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW},
				},
			},
			[4755] = -- 五仙金蛇狂舞(V5_zd1_双边绕循环_五毒)
			{
				["ModifyECM"] =
				{
					{start_time = 0, newecm = "", seektime = 0, transtime = 0, anispeed = 100, pre = {"pt"}, mid = "被击飞"},
				},
				["HMove"] =
				{
					{start_time = 0, end_time = 1000, hacc = -20, },
				},
				["VMove"] =
				{
					--上升段：300ms飞?米高，加速-40 -> 初速9
					{start_time = 0, end_time = 300, vg = -40, init_speed = 9, speed_flag = SPEEDFLAG_FORCEDEFINE,},
					--下降段：初速0，加速-20，下降?米 -> 耗时300ms
					{start_time = 300, end_time = 600, vg = -20, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW, end_gfx = "人物\\地形触发通用效果\\倒地通用\\",},
					--模拟弹地1次：300ms
					{start_time = 650, end_time = 950, vg = -20, init_speed = 3, speed_flag = SPEEDFLAG_NEEDCALC, end_gfx = "人物\\地形触发通用效果\\倒地通用\\", },
					--最后250毫秒：躺地上不动
					{start_time = -250, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW},
				},
			},
			[4759] = -- 五仙仙狐幻音(V5_zd_施法攻击8_五毒)
			{
				["ModifyECM"] =
				{
					{start_time = 0, newecm = "", seektime = 0, transtime = 0, anispeed = 100, pre = {"pt"}, mid = "被击飞"},
				},
				["HMove"] =
				{
					{start_time = 0, end_time = 1000, hacc = -20, },
				},
				["VMove"] =
				{
					--上升段：300ms飞?米高，加速-40 -> 初速9
					{start_time = 0, end_time = 300, vg = -40, init_speed = 9, speed_flag = SPEEDFLAG_FORCEDEFINE,},
					--下降段：初速0，加速-20，下降?米 -> 耗时300ms
					{start_time = 300, end_time = 600, vg = -20, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW, end_gfx = "人物\\地形触发通用效果\\倒地通用\\",},
					--模拟弹地1次：300ms
					{start_time = 650, end_time = 950, vg = -20, init_speed = 3, speed_flag = SPEEDFLAG_NEEDCALC, end_gfx = "人物\\地形触发通用效果\\倒地通用\\", },
					--最后250毫秒：躺地上不动
					{start_time = -250, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW},
				},
			},
			[2244] = -- 逍遥离合无常(V1_zd_爆头踢_逍遥)
			{
				["ModifyECM"] =
				{
					{start_time = 0, newecm = "", seektime = 0, transtime = 0, anispeed = 100, pre = {"pt"}, mid = "被击飞"},
				},
				["HMove"] =
				{
					{start_time = 0, end_time = 1000, hacc = -20, },
				},
				["VMove"] =
				{
					--上升段：300ms飞?米高，加速-40 -> 初速9
					{start_time = 0, end_time = 300, vg = -40, init_speed = 9, speed_flag = SPEEDFLAG_FORCEDEFINE,},
					--下降段：初速0，加速-20，下降?米 -> 耗时300ms
					{start_time = 300, end_time = 600, vg = -20, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW, end_gfx = "人物\\地形触发通用效果\\倒地通用\\",},
					--模拟弹地1次：300ms
					{start_time = 650, end_time = 950, vg = -20, init_speed = 3, speed_flag = SPEEDFLAG_NEEDCALC, end_gfx = "人物\\地形触发通用效果\\倒地通用\\", },
					--最后250毫秒：躺地上不动
					{start_time = -250, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW},
				},
			},
			[2246] = -- 逍遥无色无相(V1_zd_双向踢_逍遥)
			{
				["ModifyECM"] =
				{
					{start_time = 0, newecm = "", seektime = 0, transtime = 0, anispeed = 100, pre = {"pt"}, mid = "被击飞"},
				},
				["HMove"] =
				{
					{start_time = 0, end_time = 1000, hacc = -20, },
				},
				["VMove"] =
				{
					--上升段：300ms飞?米高，加速-40 -> 初速9
					{start_time = 0, end_time = 300, vg = -40, init_speed = 9, speed_flag = SPEEDFLAG_FORCEDEFINE,},
					--下降段：初速0，加速-20，下降?米 -> 耗时300ms
					{start_time = 300, end_time = 600, vg = -20, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW, end_gfx = "人物\\地形触发通用效果\\倒地通用\\",},
					--模拟弹地1次：300ms
					{start_time = 650, end_time = 950, vg = -20, init_speed = 3, speed_flag = SPEEDFLAG_NEEDCALC, end_gfx = "人物\\地形触发通用效果\\倒地通用\\", },
					--最后250毫秒：躺地上不动
					{start_time = -250, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW},
				},
			},
			[926] = -- 唐门洞破乾坤(V3_zd_转炮炮击_唐门)
			{
				["ModifyECM"] =
				{
					{start_time = 0, newecm = "", seektime = 0, transtime = 0, anispeed = 100, pre = {"pt"}, mid = "被击飞"},
				},
				["HMove"] =
				{
					{start_time = 0, end_time = 1000, hacc = -20, },
				},
				["VMove"] =
				{
					--上升段：300ms飞?米高，加速-40 -> 初速9
					{start_time = 0, end_time = 300, vg = -40, init_speed = 9, speed_flag = SPEEDFLAG_FORCEDEFINE,},
					--下降段：初速0，加速-20，下降?米 -> 耗时300ms
					{start_time = 300, end_time = 600, vg = -20, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW, end_gfx = "人物\\地形触发通用效果\\倒地通用\\",},
					--模拟弹地1次：300ms
					{start_time = 650, end_time = 950, vg = -20, init_speed = 3, speed_flag = SPEEDFLAG_NEEDCALC, end_gfx = "人物\\地形触发通用效果\\倒地通用\\", },
					--最后250毫秒：躺地上不动
					{start_time = -250, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW},
				},
			},
			[1389] = -- 峨嵋黑虎掏心(V1_zd_三连击_峨嵋)
			{
				["ModifyECM"] =
				{
					{start_time = 0, newecm = "", seektime = 0, transtime = 0, anispeed = 100, pre = {"pt"}, mid = "被击飞"},
				},
				["HMove"] =
				{
					{start_time = 0, end_time = 1000, hacc = -20, },
				},
				["VMove"] =
				{
					--上升段：300ms飞?米高，加速-40 -> 初速9
					{start_time = 0, end_time = 300, vg = -40, init_speed = 9, speed_flag = SPEEDFLAG_FORCEDEFINE,},
					--下降段：初速0，加速-20，下降?米 -> 耗时300ms
					{start_time = 300, end_time = 600, vg = -20, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW, end_gfx = "人物\\地形触发通用效果\\倒地通用\\",},
					--模拟弹地1次：300ms
					{start_time = 650, end_time = 950, vg = -20, init_speed = 3, speed_flag = SPEEDFLAG_NEEDCALC, end_gfx = "人物\\地形触发通用效果\\倒地通用\\", },
					--最后250毫秒：躺地上不动
					{start_time = -250, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW},
				},
			},
			[3053] = -- 峨嵋仙女散花(V1_zd_群爆法_峨嵋)
			{
				["ModifyECM"] =
				{
					{start_time = 0, newecm = "", seektime = 0, transtime = 0, anispeed = 100, pre = {"pt"}, mid = "被击飞"},
				},
				["HMove"] =
				{
					{start_time = 0, end_time = 1000, hacc = -20, },
				},
				["VMove"] =
				{
					--上升段：300ms飞?米高，加速-40 -> 初速9
					{start_time = 0, end_time = 300, vg = -40, init_speed = 9, speed_flag = SPEEDFLAG_FORCEDEFINE,},
					--下降段：初速0，加速-20，下降?米 -> 耗时300ms
					{start_time = 300, end_time = 600, vg = -20, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW, end_gfx = "人物\\地形触发通用效果\\倒地通用\\",},
					--模拟弹地1次：300ms
					{start_time = 650, end_time = 950, vg = -20, init_speed = 3, speed_flag = SPEEDFLAG_NEEDCALC, end_gfx = "人物\\地形触发通用效果\\倒地通用\\", },
					--最后250毫秒：躺地上不动
					{start_time = -250, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW},
				},
			},
			-- 根据投技技能id做特殊配置
			--[[[3703] = -- 华山剑宗跳跃投技青山隐隐
			{
				["ModifyECM"] =
				{
					{start_time = 0, newecm = "", seektime = 0, transtime = 0, anispeed = 100, pre = {"pt"}, mid = "被击飞"},
					--{start_time = -500, newecm = "", seektime = -500, transtime = 100, anispeed = 200, pre = {"pt"}, mid = "被击飞"},
				},
				["HMove"] = { {start_time = 0, end_time = 800, hacc = -5}, },
				["VMove"] =
				{
					{start_time = 0, end_time = 500, vg = -30, init_speed = 2, speed_flag = SPEEDFLAG_NEEDCALC, },
					--	得落到地上
					{start_time = 500, end_time = -1, vg = -30, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW, },
				},
			},
			[3604] = -- 华山气宗投技
			{
				["ModifyECM"] =
				{
					{start_time = 0, newecm = "", seektime = 0, transtime = 0, anispeed = 100, pre = {"pt"}, mid = "被击飞"},
					{start_time = -300, newecm = "", seektime = -1000, transtime = 100, anispeed = 200, pre = {"pt"}, mid = "被击飞"},
				},
				["HMove"] = { {start_time = 0, end_time = 600, hacc = -5}, },
				["VMove"] =
				{
					{start_time = 0, end_time = 200, vg = -1, init_speed = 1, speed_flag = SPEEDFLAG_NEEDCALC, },
					--	得落到地上
					{start_time = 200, end_time = -1, vg = -5, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW, },
				},
			},
			[2641] = -- 唐门必杀1
			{
				["ModifyECM"] =
				{
					{start_time = 0, newecm = "", seektime = 0, transtime = 0, anispeed = 100, pre = {"pt"}, mid = "被击飞"},
					{start_time = -300, newecm = "", seektime = -1000, transtime = 100, anispeed = 200, pre = {"pt"}, mid = "被击飞"},
				},
				["HMove"] = { {start_time = 0, end_time = 500, hacc = -5}, },
				["VMove"] =
				{
					{start_time = 0, end_time = 500, vg = -100, init_speed = 2, speed_flag = SPEEDFLAG_NEEDCALC, },
					--	得落到地上
					{start_time = 500, end_time = -1, vg = -100, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW, },
				},
			},
			[4084] = --日月怀中抱妹杀
			{
				["ModifyECM"] =
				{
					{start_time = 0, newecm = "", seektime = 0, transtime = 0, anispeed = 100, pre = {"pt"}, mid = "被击飞"},
					{start_time = -300, newecm = "", seektime = -1000, transtime = 100, anispeed = 200, pre = {"pt"}, mid = "被击飞"},
				},
				["HMove"] = { {start_time = 0, end_time = 50, hacc = -100}, },
				--["VMove"] =
				{
					{start_time = 0, end_time = 350, vg = -10, init_speed = 2, speed_flag = SPEEDFLAG_NEEDCALC, },
					--	得落到地上
					{start_time = 500, end_time = -1, vg = -10, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW, },
				},
			},
			[4148] = --日月怀中抱妹杀2
			{
				["ModifyECM"] =
				{
					{start_time = 0, newecm = "", seektime = 0, transtime = 0, anispeed = 100, pre = {"pt"}, mid = "被击飞"},
					{start_time = -300, newecm = "", seektime = -1000, transtime = 100, anispeed = 200, pre = {"pt"}, mid = "被击飞"},
				},
				["HMove"] = { {start_time = 0, end_time = 50, hacc = -100}, },
				["VMove"] =
				{
					{start_time = 0, end_time = 350, vg = -10, init_speed = 2, speed_flag = SPEEDFLAG_NEEDCALC, },
					--	得落到地上
					{start_time = 500, end_time = -1, vg = -10, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW, },
				},
			},
			[4088] = -- 日月抹脖子
			{
				["ModifyECM"] =
				{
					{start_time = 0, newecm = "", seektime = 0, transtime = 0, anispeed = 100, pre = {"pt"}, mid = "被击飞"},
					{start_time = -300, newecm = "", seektime = -1000, transtime = 100, anispeed = 200, pre = {"pt"}, mid = "被击飞"},
				},
				["HMove"] = { {start_time = 0, end_time = 200, hacc = -50}, },
				["VMove"] =
				{
					{start_time = 0, end_time = 500, vg = -2, init_speed = 2, speed_flag = SPEEDFLAG_NEEDCALC, },
					--	得落到地上
					{start_time = 500, end_time = -1, vg = -100, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW, },
				},
			},
			[4184] = -- 唐门炮轰抓投
			{
				["ModifyECM"] =
				{
					{start_time = 0, newecm = "", seektime = 0, transtime = 0, anispeed = 100, pre = {"pt"}, mid = "被击飞"},
					{start_time = -300, newecm = "", seektime = -1000, transtime = 100, anispeed = 200, pre = {"pt"}, mid = "被击飞"},
				},
				["HMove"] = { {start_time = 0, end_time = 1000, hacc = -50}, },
				["VMove"] =
				{
					{start_time = 0, end_time = 1000, vg = -50, init_speed = 0, speed_flag = SPEEDFLAG_NEEDCALC, },
					--	得落到地上
					{start_time = 1000, end_time = 1300, vg = -300, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW, },
				},
			},
			[4185] = -- 唐门拳套摔投
			{
				["ModifyECM"] =
				{
					{start_time = 0, newecm = "", seektime = 0, transtime = 0, anispeed = 100, pre = {"pt"}, mid = "被击飞"},
					{start_time = -300, newecm = "", seektime = -1000, transtime = 100, anispeed = 200, pre = {"pt"}, mid = "被击飞"},
				},
				["HMove"] = { {start_time = 0, end_time = 700, hacc = -50}, },
				["VMove"] =
				{
					{start_time = 0, end_time = 700, vg = -2, init_speed = 2, speed_flag = SPEEDFLAG_NEEDCALC, },
					--	得落到地上
					{start_time = 700, end_time = -1, vg = -100, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW, },
				},
			},]]
		},
		["Pull"] = --拉回
		{
			[0] = -- 默认配置
			{
				["ModifyECM"] =
				{
					{start_time = 0, newecm = "", seektime = 0, transtime = 0, anispeed = 100, pre = {"pt"}, mid = "被击飞"},
					{start_time = -300, newecm = "", seektime = -1000, transtime = 200, anispeed = 100, pre = {"pt"}, mid = "被击飞"},
				},
				["HMove"] = { {start_time = 0, end_time = -1, hacc = -50}, },
				["VMove"] = {
				{
					start_time = 0, end_time = -1, vg = -10, vg = -10, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,},
					-- 最后250毫秒：躺地上不动
					--{start_time = -250, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW},
				},
			},
			-- 根据投技技能id做特殊配置
		},
	},

	-------------------------------------------------------
	--hint:小控制－－击溃
	-------------------------------------------------------
	[SkillVisual.CTRLSTATEID_BEATCOLLAPSE] =
	{
		["None"] = --原地
		{
			[0] = -- 默认配置
			{
				["ModifyECM"] =
				{
					-- Key表示起始时间
					{start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100, pre = {"pt"}, mid = "被击晕"},-- 控制最后500ms：播动作最后500ms
					--{start_time = -500, newecm = "", seektime = -500, transtime = 100, anispeed = 100, pre = {"pt"}, mid = "被击晕"},
				},
				["HMove"] = { {start_time = 0, end_time = -1, hacc = -50}, },
				--	得落到地上
				["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW}, },
			},
			[4913] = -- 魔教毒花睡眠
			{
				["ModifyECM"] =
				{
					-- Key表示起始时间
					{start_time = 0, newecm = "", seektime = 0, transtime = 0, anispeed = 100, pre = {"pt"}, mid = "死亡循环"},
				},
			},
			[9009] = -- 嵩山宝塔刽子手单体蜂群
			{
				["ModifyECM"] =
				{
					-- Key表示起始时间
					{start_time = 0, newecm = "", seektime = 0, transtime = 0, anispeed = 100, pre = {"pt"}, mid = "死亡循环"},
				},
			},
			[9226] = -- 绝情谷毒藤突刺
			{
				["ModifyECM"] =
				{
					-- Key表示起始时间
					{start_time = 0, newecm = "", seektime = 0, transtime = 0, anispeed = 100, pre = {"pt"}, mid = "死亡循环"},
				},
			},
			[8967] = -- S绝学吸星大法
			{
				["HMove"] = { {start_time = 0, end_time = 1, hacc = -50}, },
				--	得落到地上
				["VMove"] = { {start_time = 0, end_time = 1, vg = -16, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
			},
			[9108] = -- S绝学凌波微步
			{
				["HMove"] = { {start_time = 0, end_time = 1, hacc = -50}, },
				--	得落到地上
				["VMove"] = { {start_time = 0, end_time = 1, vg = -16, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
			},
		},
		["Push"] = --击退
		{
			[0] = -- 默认配置
			{
				["ModifyECM"] =
				{
					-- Key表示起始时间
					{start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100, pre = {"pt"}, mid = "被击退"},-- 控制最后500ms：播动作最后500ms
					--{start_time = -500, newecm = "", seektime = -500, transtime = 100, anispeed = 100, pre = {"pt"}, mid = "被击退"},
				},
				["HMove"] = { {start_time = 0, end_time = -1, hacc = -50}, },
				--	得落到地上
				["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW}, },
			},
			-- 根据投技技能id做特殊配置
			[8948] = -- 沾衣十八跌
			{
				["ModifyECM"] =
				{
					-- Key表示起始时间
					{start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100, pre = {"pt"}, mid = "被击退"},-- 控制最后500ms：播动作最后500ms
					--{start_time = -500, newecm = "", seektime = -500, transtime = 100, anispeed = 100, pre = {"pt"}, mid = "受伤3"},
				},
				["HMove"] = {
					--{start_time = 0, end_time = -1, hacc = -10},
					{start_time = 0, end_time = 200, hacc = 10},
					--{start_time = 300, end_time = 500, hacc = -5},
				},
				--	得落到地上
				["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW}, },
			},
			[8965] = -- 降龙十八掌
			{
				["ModifyECM"] =
				{
					-- Key表示起始时间
					{start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100, pre = {"pt"}, mid = "被击退"},-- 控制最后500ms：播动作最后500ms
					--{start_time = -500, newecm = "", seektime = -500, transtime = 100, anispeed = 100, pre = {"pt"}, mid = "受伤3"},
				},
				["HMove"] = {
					--{start_time = 0, end_time = -1, hacc = -10},
					{start_time = 0, end_time = 1000, hacc = -10},
					--{start_time = 300, end_time = 500, hacc = -5},
				},
				--	得落到地上
				["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW}, },
			},
		},
		["Pull"] = --拉回
		{
			[0] = -- 默认配置
			{
				["ModifyECM"] =
				{
					-- Key表示起始时间
					{start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100, pre = {"pt"}, mid = "被击晕"},-- 控制最后500ms：播动作最后500ms
					--{start_time = -500, newecm = "", seektime = -500, transtime = 100, anispeed = 100, pre = {"pt"}, mid = "受伤3"},
				},
				["HMove"] = { {start_time = 0, end_time = -1, hacc = -50}, },
				--	得落到地上
				["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW}, },
			},
			-- 根据投技技能id做特殊配置
			[2661] = -- 万岳朝宗
			{
				["ModifyECM"] =
				{
					-- Key表示起始时间
					{start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100, pre = {"pt"}, mid = "被击晕"},-- 控制最后500ms：播动作最后500ms
					--{start_time = -500, newecm = "", seektime = -500, transtime = 100, anispeed = 100, pre = {"pt"}, mid = "受伤3"},
				},
				["HMove"] = { {start_time = 0, end_time = -200, hacc = -10}, },
				--	得落到地上
				["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW}, },
			},
			[4574] = -- 索命连环
			{
				["ModifyECM"] =
				{
					-- Key表示起始时间
					{start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100, pre = {"pt"}, mid = "被击晕"},-- 控制最后500ms：播动作最后500ms
					--{start_time = -500, newecm = "", seektime = -500, transtime = 100, anispeed = 100, pre = {"pt"}, mid = "受伤3"},
				},
				["HMove"] = { {start_time = 50, end_time = 300, hacc = -20}, },
				--	得落到地上
				["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW}, },
			},
			[6246] = -- 索命连环强化
			{
				["ModifyECM"] =
				{
					-- Key表示起始时间
					{start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100, pre = {"pt"}, mid = "被击晕"},-- 控制最后500ms：播动作最后500ms
					--{start_time = -500, newecm = "", seektime = -500, transtime = 100, anispeed = 100, pre = {"pt"}, mid = "受伤3"},
				},
				["HMove"] = { {start_time = 50, end_time = 300, hacc = -20}, },
				--	得落到地上
				["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW}, },
			},
			[5917] = -- 摧心离合
			{
				["ModifyECM"] =
				{
					-- Key表示起始时间
					{start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100, pre = {"pt"}, mid = "被击晕"},-- 控制最后500ms：播动作最后500ms
					--{start_time = -500, newecm = "", seektime = -500, transtime = 100, anispeed = 100, pre = {"pt"}, mid = "受伤3"},
				},
				["HMove"] = { {start_time = 100, end_time = 300, hacc = 0}, },
				--	得落到地上
				["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW}, },
			},
	                [6814] = -- 摧心离合真诀
			{
				["ModifyECM"] =
				{
					-- Key表示起始时间
					{start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100, pre = {"pt"}, mid = "被击晕"},-- 控制最后500ms：播动作最后500ms
					--{start_time = -500, newecm = "", seektime = -500, transtime = 100, anispeed = 100, pre = {"pt"}, mid = "受伤3"},
				},
				["HMove"] = { {start_time = 100, end_time = 300, hacc = 0}, },
				--	得落到地上
				["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW}, },
			},
			[8966] = -- 乾坤大挪移
			{
				["ModifyECM"] =
				{
					-- Key表示起始时间
					{start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100, pre = {"pt"}, mid = "被击晕"},-- 控制最后500ms：播动作最后500ms
					--{start_time = -500, newecm = "", seektime = -500, transtime = 100, anispeed = 100, pre = {"pt"}, mid = "受伤3"},
				},
				["HMove"] = { {start_time = 0, end_time = 1, hacc = -20}, },
				--	得落到地上
				["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW}, },
			},
			[10998] = -- 卡牌睡眠
			{
				["ModifyECM"] =
				{
					-- Key表示起始时间
					{start_time = 0, newecm = "", seektime = 0, transtime = 0, anispeed = 100, pre = {"pt"}, mid = "死亡循环"},
				},
			},
		},

	},
	-------------------------------------------------------
	--hint:小控制－－击倒
	-------------------------------------------------------
	[SkillVisual.CTRLSTATEID_BEATDOWN] =
	{
		["None"] = --原地
		{
			[0] = -- 默认配置
			{
				["ModifyECM"] =
				{
					--Key表示起始时间
					{start_time = 0, newecm = "", seektime = 0, transtime = 0, anispeed = 100, pre = {"pt"}, mid = "被击倒",},
					{start_time = -500, newecm = "", seektime = -1000, transtime = 100, anispeed = 200, pre = {"pt"}, mid = "被击倒"},
				},
				["HMove"] = { {start_time = 0, end_time = -1, hacc = -50}, },
				--	得落到地上
				["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
			},
			-- 根据投技技能id做特殊配置

		},
		["Push"] = --击退
		{
			[0] = -- 默认配置
			{
				["ModifyECM"] =
				{
					--Key表示起始时间
					{start_time = 0, end_time = -1, newecm = "", seektime = 0, transtime = 0, anispeed = 100, pre = {"pt"}, mid = "被击倒",},
				},
				["HMove"] = { {start_time = 0, end_time = -1, hacc = -50}, },
				--	得落到地上
				["VMove"] = { {start_time = 0, end_time = -1, vg = -16, init_speed = 0, speed_flag = SPEEDFLAG_FORCEDEFINE,}, },
			},
			-- 根据投技技能id做特殊配置
			[4751] = -- 五仙软虹蛛索(V5_zd_抓投1_五毒)
			{
				["ModifyECM"] =
				{
					--Key表示起始时间
					{start_time = 0, end_time = -1, newecm = "", seektime = 0, transtime = 100, anispeed = 100, pre = {"pt"}, mid = "被击倒",},
				},
				["HMove"] = { {start_time = 0, end_time = 1, hacc = -50}, },
				--	得落到地上
				["VMove"] = { {start_time = 0, end_time = 1, vg = -16, init_speed = 0, speed_flag = SPEEDFLAG_FORCEDEFINE,}, },
			},
			[8579] = -- 五仙银丝飞翼(zd_鞭缠踩人_五毒)
			{
				["ModifyECM"] =
				{
					--Key表示起始时间
					{start_time = 0, end_time = -1, newecm = "", seektime = 0, transtime = 100, anispeed = 100, pre = {"pt"}, mid = "被击倒",},
				},
				["HMove"] = { {start_time = 0, end_time = 1, hacc = -50}, },
				--	得落到地上
				["VMove"] = { {start_time = 0, end_time = 1, vg = -16, init_speed = 0, speed_flag = SPEEDFLAG_FORCEDEFINE,}, },
			},
			[3703] = -- 华山无边落木(V4_zd_剑宗跳跃投技1_华山)
			{
				["ModifyECM"] =
				{
					--Key表示起始时间
					{start_time = 0, end_time = -1, newecm = "", seektime = 0, transtime = 100, anispeed = 100, pre = {"pt"}, mid = "被击倒",},
				},
				["HMove"] = { {start_time = 0, end_time = 1, hacc = -50}, },
				--	得落到地上
				["VMove"] = { {start_time = 0, end_time = 1, vg = -16, init_speed = 0, speed_flag = SPEEDFLAG_FORCEDEFINE,}, },
			},
			[4900] = -- 日月六道轮回(V5_zd_旋转摔投_日月)
			{
				["ModifyECM"] =
				{
					--Key表示起始时间
					{start_time = 0, end_time = -1, newecm = "", seektime = 0, transtime = 100, anispeed = 100, pre = {"pt"}, mid = "被击倒",},
				},
				["HMove"] = { {start_time = 0, end_time = 1, hacc = -50}, },
				--	得落到地上
				["VMove"] = { {start_time = 0, end_time = 1, vg = -16, init_speed = 0, speed_flag = SPEEDFLAG_FORCEDEFINE,}, },
			},
			[4671] = -- 峨嵋麒麟反挂(V5_zd_气功摔投_峨嵋)
			{
				["ModifyECM"] =
				{
					--Key表示起始时间
					{start_time = 0, end_time = -1, newecm = "", seektime = 0, transtime = 100, anispeed = 100, pre = {"pt"}, mid = "被击倒",},
				},
				["HMove"] = { {start_time = 0, end_time = 1, hacc = -50}, },
				--	得落到地上
				["VMove"] = { {start_time = 0, end_time = 1, vg = -16, init_speed = 0, speed_flag = SPEEDFLAG_FORCEDEFINE,}, },
			},
		},
		["Pull"] = --拉近
		{
			[0] = -- 默认配置
			{
				["ModifyECM"] =
				{
					--Key表示起始时间
					{start_time = 0, newecm = "", seektime = 0, transtime = 0, anispeed = 100, pre = {"pt"}, mid = "被击倒",},
					{start_time = -500, newecm = "", seektime = -1000, transtime = 100, anispeed = 200, pre = {"pt"}, mid = "被击倒"},
				},
				["HMove"] = { {start_time = 0, end_time = -1, hacc = -50}, },
				--	得落到地上
				["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
			},
			-- 根据投技技能id做特殊配置
		},
	},

	[SkillVisual.CTRLSTATEID_BAOQI] =
	{
		["Push"] = --击退
		{
			[0] = -- 默认配置
			{
				["ModifyECM"] = { {start_time = 0, end_time = -1, newecm = "zd_战斗大师拼内力守_通用", seektime = 0, transtime = 0, anispeed = 100},	},
			},
		},
	},
}

----------------------------------------------
------------   Perform表现配置  --------------
----------------------------------------------
SkillVisual.PerformParam =
{
	------------------------------------------------
	--hint	00新手及门派通用技能
	------------------------------------------------
	[290] =		--SkillBaseData\技能过程\1\宠物捕捉专用吟唱过程\宠物捕捉专用吟唱过程.tmpl
	{
			["ModifyECM"] = { {start_time = 750, newecm = "cj_捕获循环_通用", seektime = 0, transtime = 150, anispeed = 100},	},
			["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[292] =		--SkillBaseData\技能过程\1\宠物下毒专用吟唱过程\宠物下毒专用吟唱过程.tmpl
	{
		["ModifyECM"] = { {start_time = 750, newecm = "cj_恐吓循环_通用", seektime = 0, transtime = 150, anispeed = 100},	},
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[294] =		--SkillBaseData\技能过程\1\宠物收养专用吟唱过程\宠物收养专用吟唱过程.tmpl
	{
		["ModifyECM"] = { {start_time = 750, newecm = "cj_招揽循环_通用", seektime = 0, transtime = 150, anispeed = 100},	},
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[5396] =  --1品药
	{
		["ModifyECM"] = { {start_time = 0, newecm = "zs_喝药_华山", seektime = 0, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -10, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[5399] =  --2品药
	{
		["ModifyECM"] = { {start_time = 0, newecm = "zs_喝药_华山", seektime = 0, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -10, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[5402] =  --3品药
	{
		["ModifyECM"] = { {start_time = 0, newecm = "zs_喝药_华山", seektime = 0, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -10, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[3813] = --	闪躲前	SkillBaseData\技能过程\4\zs_闪躲前_华山_出招\zs_闪躲前_华山_出招.tmpl
	{
		["ModifyECM"] = { {start_time = 0, newecm = "",
						seektime = 0, transtime = 50, anispeed = 83, pre = {"zs"}, mid = "闪躲前", unguardnormal = 1,}, },
		["HMove"] =	{
				{start_time = 0, end_time = 300, hacc = 80},
				{start_time = 301, end_time = 600, hacc = 0},
				},
		["VMove"] = { {start_time = 0, end_time = -1, vg = -22, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[3814] = --	闪躲后	SkillBaseData\技能过程\4\zs_闪躲后_华山_出招\zs_闪躲后_华山_出招.tmpl
	{
		["ModifyECM"] = { {start_time = 0, newecm = "",
						seektime = 0, transtime = 50, anispeed = 100, pre = {"zs"}, mid = "闪躲后", unguardnormal = 1,}, },
		["HMove"] =	{
				{start_time = 0, end_time = 240, hacc = 80},
				{start_time = 241, end_time = 600, hacc = -10},
				},
		["VMove"] = {
		{start_time = 0, end_time = -200, vg = -50, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,},
		},
	},
	[4394] = --	闪躲左	SkillBaseData\技能过程\4\华山原地闪躲上下_过程\华山原地闪躲上下_过程.tmpl
	{
		["ModifyECM"] = { {start_time = 0, newecm = "",
						seektime = 0, transtime = 50, anispeed = 100, pre = {"zs"}, mid = "闪躲左", unguardnormal = 1,}, },
		["HMove"] =	{
				{start_time = 0, end_time = 200, hacc = 240},
				{start_time = 201, end_time = 500, hacc = -10},
				},
		["VMove"] = { {start_time = 0, end_time = -1, vg = -50, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[4395] = --	闪躲右	SkillBaseData\技能过程\4\华山原地闪躲左右_过程\华山原地闪躲左右_过程.tmpl
	{
		["ModifyECM"] = { {start_time = 0, newecm = "",
						seektime = 0, transtime = 50, anispeed = 100, pre = {"zs"}, mid = "闪躲右", unguardnormal = 1,}, },
		["HMove"] =	{
				{start_time = 0, end_time = 200, hacc = 240},
				{start_time = 201, end_time = 500, hacc = -10},
				},
		["VMove"] = {
		{start_time = 0, end_time = -200, vg = -50, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,},
		},
	},
	[9452] = --	闪躲前空中	SkillBaseData\技能过程\4\PTV3_zs_空中闪躲前_通用_出招\PTV3_zs_空中闪躲前_通用_出招.tmpl
	{
		["ModifyECM"] = { {start_time = 0, newecm = "zs_空中闪躲前_通用",
						seektime = 0, transtime = 50, anispeed = 50}, },
		["HMove"] = { {start_time = 0, end_time = -1, hacc = -20}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -16, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[9453] = --	闪躲后空中	SkillBaseData\技能过程\4\PTV3_zs_空中闪躲后_通用_出招\PTV3_zs_空中闪躲后_通用_出招.tmpl
	{
		["ModifyECM"] = { {start_time = 0, newecm = "zs_空中闪躲后_通用",
						seektime = 0, transtime = 50, anispeed = 100}, },
		["HMove"] = { {start_time = 50, end_time = -1, hacc = -20}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -16, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
		--["VMove"] = { {start_time = 0, end_time = -400, vg = 9.8, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[9454] = --	闪躲左空中	SkillBaseData\技能过程\4\PTV3_zs_空中闪躲左_通用_出招\PTV3_zs_空中闪躲左_通用_出招.tmpl
	{
		["ModifyECM"] = { {start_time = 0, newecm = "zs_空中闪躲左_通用",
						seektime = 0, transtime = 50, anispeed = 100}, },
		["HMove"] = { {start_time = 50, end_time = -1, hacc = -20}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -16, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[9455] = --	闪躲右空中	SkillBaseData\技能过程\4\PTV3_zs_空中闪躲右_通用_出招\PTV3_zs_空中闪躲右_通用_出招.tmpl
	{
		["ModifyECM"] = { {start_time = 0, newecm = "zs_空中闪躲右_通用",
						seektime = 0, transtime = 50, anispeed = 100,}, },
		["HMove"] = { {start_time = 50, end_time = -1, hacc = -20}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -16, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[10945] = --	地面受身	SkillBaseData\技能过程\1\V5_全门派通用地面受身移动段\V5_全门派通用地面受身移动段.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = -20}, },
		["VMove"] = {
		{start_time = 0, end_time = -100, vg = -16, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,end_gfx = "人物\\地形触发通用效果\\倒地通用\\"},
		},
	},
	[10946] = --	地面受身	SkillBaseData\技能过程\1\V5_全门派通用地面受身硬直段\V5_全门派通用地面受身硬直段.tmpl
	{
		["VMove"] = {
		{start_time = 0, end_time = -200, vg = -16, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,end_gfx = "人物\\地形触发通用效果\\倒地通用\\"},
		},
	},
	[10948] = --	空中受身	SkillBaseData\技能过程\1\V5_全门派通用空中受身移动段\V5_全门派通用空中受身移动段.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = -100, hacc = -20}, },
		["VMove"] = {
		{start_time = 0, end_time = 650, vg = -5, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW, end_gfx = "人物\\地形触发通用效果\\倒地通用\\"},
		{start_time = 651, end_time = -1, vg = -16, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,},
		},
	},
	--[[
	[3813] = --	闪躲前	SkillBaseData\技能过程\4\zs_闪躲前_华山_出招\zs_闪躲前_华山_出招.tmpl
	{
		["ModifyECM"] = { {start_time = 0, newecm = "",
						seektime = 0, transtime = 50, anispeed = 83, pre = {"zs"}, mid = "闪躲前", unguardnormal = 1,}, },
		["HMove"] =	{
				--{start_time = 0, end_time = 700, hacc = -20},
				{start_time = 0, end_time = 300, hacc = 80},
				{start_time = 301, end_time = 600, hacc = 0},
				--{start_time = 0, end_time = 280, hacc = 100},
				--{start_time = 281, end_time = 700, hacc = -20},
				},
		["VMove"] = { {start_time = 0, end_time = -1, vg = -22, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[3814] = --	闪躲后	SkillBaseData\技能过程\4\zs_闪躲后_华山_出招\zs_闪躲后_华山_出招.tmpl
	{
		["ModifyECM"] = { {start_time = 0, newecm = "",
						seektime = 0, transtime = 50, anispeed = 75, pre = {"zs"}, mid = "闪躲后", unguardnormal = 1,}, },
		["HMove"] =	{
				{start_time = 0, end_time = 320, hacc = 100},
				{start_time = 321, end_time = 800, hacc = -10},
				--{start_time = 0, end_time = 600, hacc = -150},
				},
		["VMove"] = {
		{start_time = 0, end_time = -200, vg = 50, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,},
		},
	},
	[4394] = --	闪躲左	SkillBaseData\技能过程\4\华山原地闪躲上下_过程\华山原地闪躲上下_过程.tmpl
	{
		["ModifyECM"] = { {start_time = 0, newecm = "",
						seektime = 0, transtime = 50, anispeed = 72, pre = {"zs"}, mid = "闪躲左", unguardnormal = 1,}, },
		["HMove"] =	{
				{start_time = 0, end_time = 280, hacc = 160},
				{start_time = 281, end_time = 700, hacc = -10},
				--{start_time = 0, end_time = 280, hacc = -80},
				},
		["VMove"] = { {start_time = 0, end_time = -1, vg = 50, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[4395] = --	闪躲右	SkillBaseData\技能过程\4\华山原地闪躲左右_过程\华山原地闪躲左右_过程.tmpl
	{
		["ModifyECM"] = { {start_time = 0, newecm = "",
						seektime = 0, transtime = 50, anispeed = 75, pre = {"zs"}, mid = "闪躲右", unguardnormal = 1,}, },
		["HMove"] =	{
				{start_time = 0, end_time = 320, hacc = 100},
				{start_time = 321, end_time = 800, hacc = -10},
				--{start_time = 0, end_time = 600, hacc = -150},
				},
		["VMove"] = {
		{start_time = 0, end_time = -200, vg = 50, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,},
		},
	},
	[9452] = --	闪躲前空中	SkillBaseData\技能过程\4\PTV3_zs_空中闪躲前_通用_出招\PTV3_zs_空中闪躲前_通用_出招.tmpl
	{
		["ModifyECM"] = { {start_time = 0, newecm = "zs_空中闪躲前_通用",
						seektime = 0, transtime = 100, anispeed = 61}, },
		["HMove"] = { {start_time = 0, end_time = -225, hacc = -20}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -10, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[9453] = --	闪躲后空中	SkillBaseData\技能过程\4\PTV3_zs_空中闪躲后_通用_出招\PTV3_zs_空中闪躲后_通用_出招.tmpl
	{
		["ModifyECM"] = { {start_time = 0, newecm = "zs_空中闪躲后_通用",
						seektime = 0, transtime = 100, anispeed = 61}, },
		["HMove"] = { {start_time = 0, end_time = -225, hacc = -20}, },
		["VMove"] = { {start_time = 0, end_time = -225, vg = 9.8, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[9454] = --	闪躲左空中	SkillBaseData\技能过程\4\PTV3_zs_空中闪躲左_通用_出招\PTV3_zs_空中闪躲左_通用_出招.tmpl
	{
		["ModifyECM"] = { {start_time = 0, newecm = "zs_空中闪躲左_通用",
						seektime = 0, transtime = 100, anispeed = 61}, },
		["HMove"] = { {start_time = 0, end_time = -225, hacc = -20}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -10, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[9455] = --	闪躲右空中	SkillBaseData\技能过程\4\PTV3_zs_空中闪躲右_通用_出招\PTV3_zs_空中闪躲右_通用_出招.tmpl
	{
		["ModifyECM"] = { {start_time = 0, newecm = "zs_空中闪躲右_通用",
						seektime = 0, transtime = 100, anispeed = 61,}, },
		["HMove"] = { {start_time = 0, end_time = -225, hacc = -20}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -10, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	]]--
	[4460] =	--SkillBaseData\技能过程\1\01V1通用侧向闪躲技能_过程1\01V1通用侧向闪躲技能_过程1.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 100, anispeed = 100, pre = {"zs"}, mid = "原地闪躲左"},},
		["ModifyECM"] = {	{start_time = 0, newecm = "", seektime = 0, transtime = 100, anispeed = 100, pre = {"zs"}, mid = "原地闪躲左", },
					{start_time = 500, newecm = "", seektime = 0, transtime = 100, anispeed = 100, pre = {"pt"}, mid = "战斗站立"},},
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[5281] =	--SkillBaseData\技能过程\1\01V1通用调息技能_过程1\01V1通用调息技能_过程1.tmpl
	{
		["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 100, anispeed = 100},},

	},
	[6354] =   	--SkillBaseData\技能过程\1\01V1通用全门派蓄力格挡技能_过程1\01V1通用全门派蓄力格挡技能_过程1.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, newecm = "", seektime = 0, transtime = 200, anispeed = 100,pre = {"zs"}, mid = "格挡", },
		},
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[19121] =   	--SkillBaseData\技能过程\1\PTV1_通用绝对防御\PTV1_通用绝对防御.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, newecm = "", seektime = 0, transtime = 200, anispeed = 100,pre = {"zs"}, mid = "格挡", },
		},
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[21143] =   	--SkillBaseData\技能过程\1\武魂通用解控技能免控\武魂通用解控技能免控.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, newecm = "", seektime = 0, transtime = 200, anispeed = 100,pre = {"zs"}, mid = "武魂", },
		},
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[6018] =   	--SkillBaseData\技能过程\1\01V1职业治疗1级技能(单体治疗)_出招\01V1职业治疗1级技能(单体治疗)_出招.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, newecm = "", seektime = 0, transtime = 100, anispeed = 100, pre = {"pt"}, mid = "传功", },
		},
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[6019] =   	--SkillBaseData\技能过程\1\01V1职业治疗1级技能(单体治疗)_收招\01V1职业治疗1级技能(单体治疗)_收招.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, newecm = "", seektime = 0, transtime = 100, anispeed = 100,pre = {"pt"}, mid = "传功持续", },
		},
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[6028] =   	--SkillBaseData\技能过程\1\01V1职业治疗(药师)5级技能(单体瞬回治疗)_出招\01V1职业治疗(药师)5级技能(单体瞬回治疗)_出招.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, newecm = "", seektime = 0, transtime = 100, anispeed = 100, pre = {"pt"}, mid = "传功", },
		},
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[6029] =   	--SkillBaseData\技能过程\1\01V1职业治疗(药师)5级技能(单体瞬回治疗)_收招\01V1职业治疗(药师)5级技能(单体瞬回治疗)_收招.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, newecm = "", seektime = 0, transtime = 100, anispeed = 100,pre = {"pt"}, mid = "传功持续", },
		},
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[6030] =   	--SkillBaseData\技能过程\1\01V1职业治疗(药师)9级技能(驱散)_出招\01V1职业治疗(药师)9级技能(驱散)_出招.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, newecm = "", seektime = 0, transtime = 100, anispeed = 100, pre = {"pt"}, mid = "传功", },
		},
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[6031] =   	--SkillBaseData\技能过程\1\01V1职业治疗(药师)9级技能(驱散)_收招\01V1职业治疗(药师)9级技能(驱散)_收招.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, newecm = "", seektime = 0, transtime = 100, anispeed = 100,pre = {"pt"}, mid = "传功持续", },
		},
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[19122] =   	--SkillBaseData\技能过程\1\PTV1_通用解除控制2\PTV1_通用解除控制2.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, newecm = "", seektime = 0, transtime = 200, anispeed = 100,pre = {"zs"}, mid = "暴气", },
		},
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	------------------------------------------------
	--hint	01-10门派通用行为动作
	------------------------------------------------
	[1280] =	--少林切换到长棍	SkillBaseData\技能过程\2\测试少林武器变形过程1\测试少林武器变形过程1.tmpl
	{
		["ModifyECM"] =	{ {start_time = 0, newecm = "zs_战斗休闲2_少林", seektime = 700, transtime = 100, anispeed = 120,	}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[1282] =	--少林切换到三节棍	SkillBaseData\技能过程\2\测试少林武器变形过程3\测试少林武器变形过程3.tmpl
	{
		["ModifyECM"] =	{ {start_time = 0, newecm = "zs_战斗休闲2_少林", seektime = 0, transtime = 100, anispeed = 75,	}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[4626] =	--SkillBaseData\技能过程\3\切换姿态御剑\切换姿态御剑.tmpl
	{
		["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 200}, },
		--["HMove"] = { {start_time = 200, end_time = 700, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[3717] =  --少林轻功1
	{
		["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -7, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[3718] =  --少林轻功2
	{
		["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -5, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[5022] =  --武当轻功1
	{
		["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -7, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[5023] =  --武当轻功2
	{
		["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -5, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[4344] =  --华山轻功1
	{
		["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -7, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[4345] =  --华山轻功2
	{
		["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -5, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[5525] =  --衡山轻功1
	{
		["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -10, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[5526] =  --衡山轻功2
	{
		["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -10, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[4450] =  --逍遥轻功1
	{
		["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -10, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[4375] =  --五毒轻功1
	{
		["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[4376] =  --五毒轻功2
	{
		["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -10, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[4451] =  --逍遥轻功2
	{
		["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -10, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[5037] =  --唐门轻功1
	{
		["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -10, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[5038] =  --唐门轻功2
	{
		["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -10, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	------------------------------------------------
	--hint	01少林武学
	------------------------------------------------
	[1632] =  	--SkillBaseData\技能过程\2\V1_zd_小右下劈_少林_出招\V1_zd_小右下劈_少林_出招.tmpl
	{
		["ModifyECM"] = { {start_time = 0, newecm = "zd_小右下劈_少林", seektime = 0, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[9224] =	--SkillBaseData\技能过程\2\V5_zd1_旋转右抡_少林_出招\V5_zd1_旋转右抡_少林_出招.tmpl

	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[9226] =	--SkillBaseData\技能过程\2\V5_zd1_三节棍左双抡_少林_出招\V5_zd1_三节棍左双抡_少林_出招.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = 0, end_time = 200, hacc = -10}, },
		["VMove"] = { {start_time = 0, end_time = 200, vg = -10, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[9229] =	--SkillBaseData\技能过程\2\V5_zd1_左扫_少林_出招\V5_zd1_左扫_少林_出招.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = 0, end_time = 400, hacc = -10}, },
		["VMove"] = { {start_time = 0, end_time = 400, vg = -10, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[9231] =	--SkillBaseData\技能过程\2\V5_zd1_双绕大右扫_少林_出招\V5_zd1_双绕大右扫_少林_出招.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = 0, end_time = -1, hacc = -5}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -10, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[9232] =	--SkillBaseData\技能过程\2\V5_zd1_双绕大右扫_少林_收招1\V5_zd1_双绕大右扫_少林_收招1.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = 0, end_time = -1, hacc = -20}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -10, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[1584] =	--SkillBaseData\技能过程\2\V1_zd_左挑_少林_出招\V1_zd_左挑_少林_出招.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 75}, },
		["HMove"] = { {start_time = 300, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 300, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[1631] =	--SkillBaseData\技能过程\2\V1_zd_左碓转棍_少林_收招2\V1_zd_左碓转棍_少林_收招2.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 75}, },
		["HMove"] = { {start_time = 0, end_time = 200, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = 200, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[9233] =	--SkillBaseData\技能过程\2\V5_zd1_前冲棍_少林_出招\V5_zd1_前冲棍_少林_出招.tmpl
	{
		["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = 250, end_time = -100, hacc = 0}, },
		["VMove"] = { {start_time = 250, end_time = -100, vg = -20, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[9234] =	--SkillBaseData\技能过程\2\V5_zd1_前冲棍_少林_收招1\V5_zd1_前冲棍_少林_收招1.tmpl
	{
		["ModifyECM"] = { {start_time = 0, newecm = "zd1_前冲棍_少林", seektime = 600, transtime = 150, anispeed = 120}, },
		--["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[3815] =	--SkillBaseData\技能过程\2\V2_zd_翻身力劈_少林_出招\V2_zd_翻身力劈_少林_出招.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = 100, end_time = 400, hacc = 0}, },
		["VMove"] = { {start_time = 100, end_time = 400, vg = -400, init_speed = 00, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[9239] =	--SkillBaseData\技能过程\2\V5_zd1_转身抽棍_少林_出招\V5_zd1_转身抽棍_少林_出招.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = 0, end_time = 200, hacc = -10}, },
		["VMove"] = { {start_time = 0, end_time = 200, vg = -10, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[9241] =	--SkillBaseData\技能过程\2\V5_zd_三节棍腾空下劈_少林_出招\V5_zd_三节棍腾空下劈_少林_出招.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = 50, end_time = -1, hacc = 10}, },
		["VMove"] = { {start_time = 200, end_time = -1, vg = -100, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[9242] =	--SkillBaseData\技能过程\2\V5_zd_三节棍腾空下劈_少林_收招1\V5_zd_三节棍腾空下劈_少林_收招1.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -100, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[9243] =	--SkillBaseData\技能过程\2\V5_zd_三节棍腾空下劈_少林_收招2\V5_zd_三节棍腾空下劈_少林_收招2.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = 0, end_time = 200, hacc = -20}, },
		["VMove"] = { {start_time = 0, end_time = 200, vg = -100, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[9245] =	--SkillBaseData\技能过程\2\V5_zd_罗汉拳_少林_出招\V5_zd_罗汉拳_少林_出招.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = -100, end_time = -1, hacc = -10}, },
		["VMove"] = { {start_time = -100, end_time = -1, vg = -10, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[1606] =  	--SkillBaseData\技能过程\2\V1_zd_左重拳_少林_出招\V1_zd_左重拳_少林_出招.tmpl
	{
		["ModifyECM"] = { {start_time = 0, newecm = "zd_左重拳_少林", seektime = 250, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[3783] =	--SkillBaseData\技能过程\2\V2_zd_跨步冲拳_少林_出招\V2_zd_跨步冲拳_少林_出招.tmpl
	{
		["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 100, anispeed = 100}, },
		["HMove"] = { {start_time = 150, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 100, end_time = -1, vg = -20, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[3784] =	--SkillBaseData\技能过程\2\V2_zd_跨步冲拳_少林_收招\V2_zd_跨步冲拳_少林_收招.tmpl
	{
		["ModifyECM"] = { {start_time = 0, newecm = "zd_跨步冲拳_少林", seektime = 600, transtime = 150, anispeed = 100}, },
		--["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[9255] =	--SkillBaseData\技能过程\2\V5_zd_乱打重拳_少林_出招\V5_zd_乱打重拳_少林_出招.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = -150, end_time = -1, hacc = -10}, },
		["VMove"] = { {start_time = -150, end_time = -1, vg = -10, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[9257] =	--SkillBaseData\技能过程\2\V5_zd_空中连环腿_少林_出招\V5_zd_空中连环腿_少林_出招.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = -200, end_time = -1, hacc = 10}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_FORCEDEFINE,}, },
	},
	[9258] =	--SkillBaseData\技能过程\2\V5_zd_空中连环腿_少林_收招1\V5_zd_空中连环腿_少林_收招1.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_FORCEDEFINE,}, },
	},
	[9259] =	--SkillBaseData\技能过程\2\V5_zd_空中连环腿_少林_收招2\V5_zd_空中连环腿_少林_收招2.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_FORCEDEFINE,}, },
	},
	[9260] =	--SkillBaseData\技能过程\2\V5_zd_空中连环腿_少林_收招3\V5_zd_空中连环腿_少林_收招3.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_FORCEDEFINE,}, },
	},
	[9261] =	--SkillBaseData\技能过程\2\V5_zd_空中连环腿_少林_收招4\V5_zd_空中连环腿_少林_收招4.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_FORCEDEFINE,}, },
	},
	[9262] =	--SkillBaseData\技能过程\2\V5_zd_空中连环腿_少林_收招5\V5_zd_空中连环腿_少林_收招5.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = 0, end_time = 200, hacc = -10}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_FORCEDEFINE,}, },
	},
	[15913] = --SkillBaseData\技能过程\2\V6_zd_旋风终结踢_少林_出招\V6_zd_旋风终结踢_少林_出招.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = 0, end_time = 200, hacc = -10}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_FORCEDEFINE,}, },
	},
	[15914] = --SkillBaseData\技能过程\2\V6_zd_旋风终结踢_少林_收招\V6_zd_旋风终结踢_少林_收招.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = 0, end_time = 200, hacc = -10}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -10, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[9264] =	--SkillBaseData\技能过程\2\V5_zd_前顶_少林_收招1\V5_zd_前顶_少林_收招1.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = 0, end_time = 300, hacc = -20}, },
		["VMove"] = { {start_time = 0, end_time = 300, vg = -10, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	------------------------------------------------
	--hint	02武当武学
	------------------------------------------------
	[7997] =	--SkillBaseData\技能过程\3\zd_横扫四连1_武当_出招\zd_横扫四连1_武当_出招.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = -200, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = -200, end_time = -1, vg = -10, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[7999] =	--SkillBaseData\技能过程\3\zd_横扫四连2_武当_出招\zd_横扫四连2_武当_出招.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -10, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[8001] =	--SkillBaseData\技能过程\3\zd_横扫四连34_武当_出招\zd_横扫四连34_武当_出招.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -10, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[8003] =	--SkillBaseData\技能过程\3\zd_横扫四连34_武当_收招3\zd_横扫四连34_武当_收招3.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = 0, end_time = 300, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = 300, vg = -10, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[4952] =	--SkillBaseData\技能过程\3\zd1_海底揽月_出招\zd1_海底揽月_出招.tmpl
	{
		["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 100, anispeed = 100}, },
		["HMove"] = { {start_time =250, end_time = 450, hacc = 15}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -10, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[15915] =	--SkillBaseData\技能过程\3\v6_zd_前靠转身推掌1_武当_收招\v6_zd_前靠转身推掌1_武当_收招.tmpl
	{
		["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 100, anispeed = 100}, },
		["HMove"] = { {start_time =0, end_time = 300, hacc = 10}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -10, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[5219] =  		--SkillBaseData\技能过程\3\zd_升龙剑_武当_出招\zd_升龙剑_武当_出招.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 100, anispeed = 10}, },
		["HMove"] = { {start_time = 200, end_time = 400, hacc = -10,}, },
		["VMove"] = { {start_time = 250, end_time = 700, vg = -49.8, init_speed = 10, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[5221] =	--SkillBaseData\技能过程\3\zd_升龙剑1_武当_出招\zd_升龙剑1_武当_出招.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -10, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[5222] =	--SkillBaseData\技能过程\3\zd_升龙剑2_武当_收招1\zd_升龙剑2_武当_收招1.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = 0, end_time = 450, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = 450, vg = -10, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[7995] =	--SkillBaseData\技能过程\3\zd_跳下钻(不切换姿态)_武当_出招\zd_跳下钻(不切换姿态)_武当_出招.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = 150, end_time = 1000, hacc = 0}, },
		["VMove"] = { {start_time = 150, end_time = 1000, vg = -50, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[5223] =	--SkillBaseData\技能过程\3\zd_肘撞_武当_出招\zd_肘撞_武当_出招.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = -100, end_time = -1, hacc = -10}, },
		["VMove"] = { {start_time = -100, end_time = -1, vg = -10, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[5226] =	--SkillBaseData\技能过程\3\zd_双侧掌侧甩掌_武当_收招1\zd_双侧掌侧甩掌_武当_收招1.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = -200, end_time = -1, hacc = -10}, },
		["VMove"] = { {start_time = -200, end_time = -1, vg = -10, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[9306] =	--SkillBaseData\技能过程\3\V5_zd_御剑传送_武当_出招\V5_zd_御剑传送_武当_出招.tmpl
	{
		["ModifyECM"] = { {start_time = 0, newecm = "zd_御剑传送_武当", seektime = 0, transtime = 100, anispeed = 100}, },
		["HMove"] = { {start_time = 350, end_time = 450, hacc = 10}, },
		["VMove"] = { {start_time = 350, end_time = 450, vg = -10, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[15890] =	--SkillBaseData\技能过程\3\v6_zd_转身劈剑_武当_出招\v6_zd_转身劈剑_武当_出招.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 100, anispeed = 100}, },
		["HMove"] = { {start_time = 250, end_time = 400, hacc = 10}, },
		["VMove"] = { {start_time =250, end_time =-1, vg = -10, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[15950] =	--SkillBaseData\技能过程\3\v6_zd_转身劈剑_武当_出招\v6_zd_转身劈剑_武当_出招.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 100, anispeed = 100}, },
		["HMove"] = { {start_time = 150, end_time =300, hacc = 15}, },
		["VMove"] = { {start_time =0, end_time =-1, vg = -10, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[15996] =	--SkillBaseData\技能过程\3\V6_zd_进步崩拳_武当_出招\V6_zd_进步崩拳_武当_出招.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 100, anispeed = 100}, },
		["HMove"] = { {start_time = 350, end_time =600, hacc = 15}, },
		["VMove"] = { {start_time =0, end_time =-1, vg = -10, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[16231] =	--SkillBaseData\技能过程\3\V6_zd_前冲挑剑_武当_收招1\V6_zd_前冲挑剑_武当_收招1.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 100, anispeed = 100}, },
		["HMove"] = { {start_time = 50, end_time =200, hacc = 15}, },
		["VMove"] = { {start_time =0, end_time =-1, vg = -10, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	------------------------------------------------
	--hint	03华山武学
	------------------------------------------------
	[19039] =   	--华山通用技能4
	{
		--["ModifyECM"] = {
		--{start_time = 0, newecm = "", seektime = 0, transtime = 0, anispeed = 100, },
		--},
		["HMove"] = { {start_time = 0, end_time = -1, hacc = -10}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_FORCEDEFINE,}, },
	},
	[3797] =	--SkillBaseData\技能过程\4\V1_zd_刺_华山_出招\V1_zd_刺_华山_出招.tmpl
	{
		--["ModifyECM"] = { {start_time = 350, newecm = "zd_三节棍左双抡_少林", seektime = 0, transtime = 100, anispeed = 100}, },
		["HMove"] = { {start_time = 0, end_time = 100, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[3802] =	--左右侧划	SkillBaseData\技能过程\4\V1_zd_上划竖劈_华山_出招\V1_zd_上划竖劈_华山_出招.tmpl
	{
		["ModifyECM"] =	{ {start_time = 0, newecm = "zd_转身右划_华山", seektime = 0, transtime = 150, anispeed = 100},},
		--["HMove"] = { {start_time = 150, end_time = 500, hacc = 0}, },
		--["VMove"] = { {start_time = 150, end_time = 500, vg = -300, init_speed = 100, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	-------hint	华山风伴流云技能
	[6389] =   	--剑宗疾风直刺	SkillBaseData\技能过程\4\zd_剑宗疾风直刺_华山_出招\zd_剑宗疾风直刺_华山_出招.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, airecm = "zd_剑宗空中疾风直刺_华山", seektime = 0, transtime = 100, anispeed = 100, },
		},
		--["HMove"] = { {start_time = 0, end_time = 150, hacc = 0}, },
		["VMove"] = { {start_time = 500, end_time = -1, vg = -250, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[6390] =   	--剑宗疾风直刺	SkillBaseData\技能过程\4\zd_剑宗疾风直刺_华山_收招\zd_剑宗疾风直刺_华山_收招.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, newecm = "", seektime = 0, transtime = 250, anispeed = 120, },
		},
		["HMove"] = { {start_time = 0, end_time = 150, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -100, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[1314] =  	--SkillBaseData\技能过程\4\zd_跨步右砍_华山_收招\zd_跨步右砍_华山_收招.tmpl
	{
		["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = 0, end_time = 150, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[1322] =	-- 位移穿刺2	SkillBaseData\技能过程\4\zd_右劈_华山_收招\zd_右劈_华山_收招.tmpl
	{
		["ModifyECM"] =	{
		{start_time = 0, newecm = "", seektime = 0, transtime = 0, anispeed = 110},
		--{start_time = 300, newecm = "", seektime = 600, transtime = 150, anispeed = 200},
		},
		["HMove"] = { {start_time = 0, end_time = 150, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[1349] =  	--SkillBaseData\技能过程\4\zd_旋转下劈剑_华山_出招\zd_旋转下劈剑_华山_出招.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 100, anispeed = 100}, },
		["HMove"] = { {start_time = 200, end_time = 700, hacc = 0}, },
		["VMove"] = { {start_time = 200, end_time = 700, vg = -75, init_speed = 100, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[8138] =	-- 位移穿刺2	SkillBaseData\技能过程\1\个人测试技能4_收招5\个人测试技能4_收招5.tmpl
	{
		["ModifyECM"] =	{
		{start_time = 0, newecm = "", seektime = 0, transtime = 0, anispeed = 110},
		--{start_time = 300, newecm = "", seektime = 600, transtime = 150, anispeed = 200},
		},
		["HMove"] = { {start_time = 0, end_time = 150, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[6397] =   	---SkillBaseData\技能过程\4\zd_气宗投技_华山_抓住\zd_气宗投技_华山_抓住.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, newecm = "zd_气宗投技分拆2段_华山", seektime = 0, transtime = 100, anispeed = 100, },
		},
		--["HMove"] = { {start_time = 0, end_time = 300, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[6388] =   	--人剑合一	SkillBaseData\技能过程\4\zd_人剑合一_华山_收招\zd_人剑合一_华山_收招.tmpl
	{
		--["ModifyECM"] = {
		--{start_time = 0, newecm = "", seektime = 0, transtime = 100, anispeed = 100, },
		--},
		["HMove"] = { {start_time = 0, end_time = 200, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[6701] =	--SkillBaseData\技能过程\4\zd_剑宗跳跃投技1_华山_出招\zd_剑宗跳跃投技1_华山_出招.tmpl
	{
		["ModifyECM"] =	{ {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 90},	},
		["HMove"] = { {start_time = 150, end_time = 600, hacc = 0}, },
		["VMove"] = { {start_time = 150, end_time = 600, vg = -150, init_speed = 150, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[6703] =	--SkillBaseData\技能过程\4\zd_剑宗跳跃投技1_华山_抓住\zd_剑宗跳跃投技1_华山_抓住.tmpl
	{
		["ModifyECM"] =	{ {start_time = 0, newecm = "zd_剑宗跳投技1分段_华山", seektime = 0, transtime = 150, anispeed = 90},},
		--["HMove"] = { {start_time = 150, end_time = 500, hacc = 0}, },
		--["VMove"] = { {start_time = 150, end_time = 600, vg = -120, init_speed = 100, speed_flag = SPEEDFLAG_FORCE_BELOW,},},
	},
	[1346] = --转身跳砍收招
	{
		["ModifyECM"] =	{ {start_time = 0, newecm = "", seektime = 0, transtime = 100, anispeed = 100},	},
		["HMove"] = { {start_time = 0, end_time = 300, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = 400, vg = -50, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[5389] =  	--SkillBaseData\技能过程\4\zd_跨步横向剑气_华山_收招1\zd_跨步横向剑气_华山_收招1.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "zd_跨步横向剑气_华山", seektime = 200, transtime = 300, anispeed = 100},},
		--["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[2375] =	--SkillBaseData\技能过程\4\V1_zd_右劈剑气_华山_出招\V1_zd_右劈剑气_华山_出招.tmpl
	{
		["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 100, anispeed = 75},},
		--["VMove"] = { {start_time = 600, end_time = 1100, vg = -50, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[17476] = --转身跳砍出招
	{
		["ModifyECM"] =	{ {start_time = 0, newecm = "zd_转身跳砍空中强化_华山", seektime = 250, transtime = 150, anispeed = 150},	},
		--["HMove"] = { {start_time = 0, end_time = 600, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = -10, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[1345] = --转身跳砍出招
	{
		["ModifyECM"] =	{ {start_time = 0, newecm = "zd_转身跳砍空中_华山", seektime = 250, transtime = 150, anispeed = 150},	},
		--["HMove"] = { {start_time = 0, end_time = 600, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = -10, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[17477] = --转身跳砍收招
	{
		["ModifyECM"] =	{ {start_time = 0, newecm = "", seektime = 0, transtime = 100, anispeed = 100},	},
		["HMove"] = { {start_time = 0, end_time = 300, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = 400, vg = -50, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[1336] =	--SkillBaseData\技能过程\4\zd_大斜上挑_华山_收招\zd_大斜上挑_华山_收招.tmpl
	{
		--["ModifyECM"] =	{ {start_time = 0, newecm = "zd_大斜上挑_华山", seektime = 0, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	------------------------------------------------
	--hint	04恒山武学
	------------------------------------------------
	[1529] =	--SkillBaseData\技能过程\5\zd_垛击_恒山_出招\zd_垛击_恒山_出招.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = -100, end_time = -1, hacc = -10}, },
		["VMove"] = { {start_time = -100, end_time = -1, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[5679] =	--SkillBaseData\技能过程\5\zd_右直刺_恒山_出招\zd_右直刺_恒山_出招.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = -100, end_time = -1, hacc = -10}, },
		["VMove"] = { {start_time = -100, end_time = -1, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[5681] =	--SkillBaseData\技能过程\5\zd_转身反手刺_恒山_出招\zd_转身反手刺_恒山_出招.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = -100, end_time = -1, hacc = -10}, },
		["VMove"] = { {start_time = -100, end_time = -1, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[1563] =	--SkillBaseData\技能过程\5\zd_单脚刺_恒山_出招\zd_单脚刺_恒山_出招.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = -100, end_time = -1, hacc = -10}, },
		["VMove"] = { {start_time = -100, end_time = -1, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[1535] =	--SkillBaseData\技能过程\5\zd_前跪刺_恒山_出招\zd_前跪刺_恒山_出招.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = 0, end_time = 150, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = 150, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[1536] =	--SkillBaseData\技能过程\5\zd_前跪刺_恒山_收招1\zd_前跪刺_恒山_收招1.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = 0, end_time = 200, hacc = -20}, },
		["VMove"] = { {start_time = 0, end_time = 200, vg =-10, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[5677] =	--SkillBaseData\技能过程\5\zd_醉窝直刺_恒山_出招\zd_醉窝直刺_恒山_出招.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = -200, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = -200, end_time = -1, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[5710] =	--SkillBaseData\技能过程\5\V1_zd_醉窝直刺_恒山_收招3\V1_zd_醉窝直刺_恒山_收招3.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = 100, end_time = 350, hacc = 10}, },
		["VMove"] = { {start_time = 100, end_time = 350, vg = -10, init_speed = 0,speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[8785] =	--SkillBaseData\技能过程\5\V5_zd_大跳劈腿_恒山_收招1\V5_zd_大跳劈腿_恒山_收招1.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = 0, end_time = 200, hacc = -20}, },
		["VMove"] = { {start_time = 0, end_time = 200, vg =-10, init_speed = 0,speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[8757] =	--SkillBaseData\技能过程\5\V5_zd_舞剑砍_恒山_出招\V5_zd_舞剑砍_恒山_出招.tmpl
	{
		["ModifyECM"] = { {start_time = 0, newecm = "zd_舞剑砍_恒山", seektime = 1400, transtime = 0, anispeed = 100}, },
		--["HMove"] = { {start_time = 0, end_time = 1250, hacc = -5}, },
		["VMove"] = { {start_time = 0, end_time = 1250, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[8763] =	--SkillBaseData\技能过程\5\V5_zd_舞动双刺_恒山_出招\V5_zd_舞动双刺_恒山_出招.tmpl
	{
		["ModifyECM"] = { {start_time = 0, newecm = "zd_舞动双刺_恒山", seektime = 1000, transtime = 0, anispeed = 100}, },
		--["HMove"] = { {start_time = 700, end_time = -1, hacc = 5}, },
		["VMove"] = { {start_time = 700, end_time = -1, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[8749] =	--SkillBaseData\技能过程\5\V5_zd_双剑夹击_恒山_出招\V5_zd_双剑夹击_恒山_出招.tmpl
	{
		["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 100, anispeed = 100}, },
		["HMove"] = { {start_time = 200, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 200, end_time = -1, vg = -20, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[8750] =	--SkillBaseData\技能过程\5\V5_zd_双剑夹击_恒山_收招1\V5_zd_双剑夹击_恒山_收招1.tmpl
	{
		["ModifyECM"] = { {start_time = 0, newecm = "zd_双剑夹击_恒山", seektime = 400, transtime = 150, anispeed = 100}, },
		--["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[8751] =	--SkillBaseData\技能过程\5\V5_zd_双剑开路_恒山_出招\V5_zd_双剑开路_恒山_出招.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = 0, end_time = 200, hacc = -10}, },
		["VMove"] = { {start_time = 0, end_time = 200, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[5605] =	--SkillBaseData\技能过程\5\V2_zd_双剑普攻1_恒山_出招\V2_zd_双剑普攻1_恒山_出招.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = -100, end_time = -1, hacc = -10}, },
		["VMove"] = { {start_time = -100, end_time = -1, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[5612] =	--SkillBaseData\技能过程\5\V2_zd_双剑普攻4_恒山_出招\V2_zd_双剑普攻4_恒山_出招.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = -250, end_time = -1, hacc = -10}, },
		["VMove"] = { {start_time = -250, end_time = -1, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[1533] =	--SkillBaseData\技能过程\5\zd_舞剑旋转砍_恒山_出招\zd_舞剑旋转砍_恒山_出招.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = 0, end_time = -1, hacc = -3}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[1534] =	--SkillBaseData\技能过程\5\zd_舞剑旋转砍_恒山_收招1\zd_舞剑旋转砍_恒山_收招1.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -10, init_speed = 0,speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[1539] =	--SkillBaseData\技能过程\5\zd_双向舞剑_恒山_出招\zd_双向舞剑_恒山_出招.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = 250, end_time = -100, hacc = 0}, },
		["VMove"] = { {start_time = 250, end_time = -100, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[1540] =	--SkillBaseData\技能过程\5\zd_双向舞剑_恒山_收招1\zd_双向舞剑_恒山_收招1.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = 200, end_time = -200, hacc = 0}, },
		["VMove"] = { {start_time = 200, end_time = -200, vg = -10, init_speed = 0,speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[1551] =	--SkillBaseData\技能过程\5\zd_舞剑转身砍_恒山_出招\zd_舞剑转身砍_恒山_出招.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = 150, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 150, end_time = -1, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[5695] =  	--恒山-双剑-跳爆头	SkillBaseData\技能过程\5\zd_跳爆头_恒山_收招\zd_跳爆头_恒山_收招.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 100, anispeed = 100},},
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 10}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -30, init_speed = 0,speed_flag = SPEEDFLAG_FORCE_BELOW,},
		},
	},
	[5705] =	--SkillBaseData\技能过程\5\zd_跳爆头_恒山_收招2\zd_跳爆头_恒山_收招2.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 100, anispeed = 100},},
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -10, init_speed = 0,speed_flag = SPEEDFLAG_FORCE_BELOW,},
		},
	},
	[8796] =	--SkillBaseData\技能过程\5\V1_zd_跳爆头_恒山_收招3\V1_zd_跳爆头_恒山_收招3.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 100, anispeed = 100},},
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -10, init_speed = 0,speed_flag = SPEEDFLAG_FORCE_BELOW,},
		},
	},
	[8797] =	--SkillBaseData\技能过程\5\V1_zd_跳爆头_恒山_收招4\V1_zd_跳爆头_恒山_收招4.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 100, anispeed = 100},},
		["HMove"] = { {start_time = 0, end_time = 200, hacc = -10}, },
		["VMove"] = { {start_time = 0, end_time = 200, vg =-10, init_speed = 0,speed_flag = SPEEDFLAG_FORCE_BELOW,},
		},
	},
	[5639] =  	--恒山-双剑-侧跳前刺转身劈	SkillBaseData\技能过程\5\zd_侧跳前刺转身劈_恒山_收招1\zd_侧跳前刺转身劈_恒山_收招1.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = 400, hacc = 50}, },
		["VMove"] = { {start_time = 0, end_time = 400, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[17079] =  	--恒山-双剑-侧跳前刺转身劈强化技	SkillBaseData\技能过程\5\恒山专精2绝技3_绝世秘笈强化_出招1\恒山专精2绝技3_绝世秘笈强化_出招1.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = 400, hacc = 50}, },
		["VMove"] = { {start_time = 0, end_time = 400, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[5641] =  	--恒山-双剑-飞身转体	SkillBaseData\技能过程\5\zd_飞身转体_恒山_出招\zd_飞身转体_恒山_出招.tmpl
	{
		["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 100, anispeed = 100},	},
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -30, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,},
		},
	},
--	[15993] =  	--恒山-双剑-前刺后飞	SkillBaseData\技能过程\5\V6_zd_前刺后飞_恒山_出招\V6_zd_前刺后飞_恒山_出招.tmpl
--	{
--		["ModifyECM"] = { {start_time = 0, newecm = "zd_前刺后飞_恒山", seektime = 400, transtime = 100, anispeed = 100}, },
--		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
--		["VMove"] = { {start_time = 0, end_time = -1, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,},},
--	},
--	[15995] =  	--恒山-双剑-前刺后飞	SkillBaseData\技能过程\5\V6_zd_前刺后飞_恒山_收招2\V6_zd_前刺后飞_恒山_收招2.tmpl
--	{	["ModifyECM"] = { {start_time = 0, newecm = "zd_前刺后飞_恒山", seektime = 1150, transtime = 100, anispeed = 100},},
--		["HMove"] = { {start_time = 0, end_time = 800, hacc = 0}, },
--		["VMove"] = { {start_time = 0, end_time = -1, vg = -10, init_speed = 0,speed_flag = SPEEDFLAG_FORCE_BELOW,},
--		},
--	},
	------------------------------------------------
	--hint	05衡山武学
	------------------------------------------------
        [8564] =   	--衡山冲刺	SkillBaseData\技能过程\6\DZ_衡山门派通用技能5_收招\DZ_衡山门派通用技能5_收招.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = 20, hacc = 0}, },
		["VMove"] =
		{
		{start_time = 0, end_time = -251, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,},
		--{start_time = -250, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW},
		},
	},
	[8814] =	--SkillBaseData\技能过程\6\V5_zd_拔刀闪杀后_衡山_抓住\V5_zd_拔刀闪杀后_衡山_抓住.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = 0, end_time = 1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = 1, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,},
		},
	},
	[16675] =	--衡山轻吟回风
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = 0, end_time = 10, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,},
		},
	},
	--[8817] =	--SkillBaseData\技能过程\6\V5_zd_冲锋斩1_衡山_出招\V5_zd_冲锋斩1_衡山_出招.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = -150, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = -150, end_time = -1, vg = -10, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[8824] =	--SkillBaseData\技能过程\6\V5_zd_幻影连击技能2_衡山_收招1\V5_zd_幻影连击技能2_衡山_收招1.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = 0, end_time = 100, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = 100, vg = -10, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[8826] =	--SkillBaseData\技能过程\6\V5_zd_幻影连击技能4_衡山_收招1\V5_zd_幻影连击技能4_衡山_收招1.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = 0, end_time = 100, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = 100, vg = -10, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[8828] =	--SkillBaseData\技能过程\6\V5_zd_幻影连击技能3_衡山_收招1\V5_zd_幻影连击技能3_衡山_收招1.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = 0, end_time = 100, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = 100, vg = -10, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[8860] =	--SkillBaseData\技能过程\6\V5_zd_转身撩裙剑_衡山_收招1\V5_zd_转身撩裙剑_衡山_收招1.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = 0, end_time = 100, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = 100, vg = -10, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[8834] =	--SkillBaseData\技能过程\6\V5_zd_绕身转劈_衡山_出招\V5_zd_绕身转劈_衡山_出招.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = 0, end_time = -1, hacc = -20}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -10, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[8835] =	--SkillBaseData\技能过程\6\V5_zd_绕身转劈_衡山_收招1\V5_zd_绕身转劈_衡山_收招1.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = 0, end_time = 300, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = 300, vg = -10, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[8838] =	--SkillBaseData\技能过程\6\V5_zd_突进拔双刀_衡山_出招\V5_zd_突进拔双刀_衡山_出招.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = -200, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = -100, end_time = -1, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[8840] =	--SkillBaseData\技能过程\6\V5_zd_三连刺_衡山_出招\V5_zd_三连刺_衡山_出招.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = -150, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = -150, end_time = -1, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[8844] =	--SkillBaseData\技能过程\6\V5_zd_踹三下_衡山_出招\V5_zd_踹三下_衡山_出招.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = -150, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = -150, end_time = -1, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[8848] =	--SkillBaseData\技能过程\6\V5_zd_左砍流_衡山_出招\V5_zd_左砍流_衡山_出招.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = -150, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = -150, end_time = -1, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[9576] =	--SkillBaseData\技能过程\6\V5_zd_抬剑插中间_衡山_收招B1\V5_zd_抬剑插中间_衡山_收招B1.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = 250, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 250, end_time = -1, vg = -10, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[8866] =	--SkillBaseData\技能过程\6\V5_zd_抬剑插中间_衡山_收招B2\V5_zd_抬剑插中间_衡山_收招B2.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -10, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[8870] =	--SkillBaseData\技能过程\6\V5_zd_抓剑后劈_衡山_收招B1\V5_zd_抓剑后劈_衡山_收招B1.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = 50, end_time = 600, hacc = -10}, },
		["VMove"] = { {start_time = 50, end_time = 600, vg = -30, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[8875] =	--SkillBaseData\技能过程\6\V5_zd_小右撩剑_衡山_出招\V5_zd_小右撩剑_衡山_出招.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = -150, end_time = -1, hacc = -30}, },
		["VMove"] = { {start_time = -150, end_time = -1, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[8881] =	--SkillBaseData\技能过程\6\V5_zd_终结技_衡山_收招1\V5_zd_终结技_衡山_收招1.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = 650, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 200, end_time = -1, vg = -10, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[16062] =	--SkillBaseData\技能过程\6\V6_zd_双飞刀接砸地_衡山_收招\V6_zd_双飞刀接砸地_衡山_收招.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -10, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	------------------------------------------------
	--hint	06日月武学
	------------------------------------------------
	[1736] =   	--双刀普攻 承招 小右平砍	SkillBaseData\技能过程\7\zd_小右平砍_日月_出招\zd_小右平砍_日月_出招.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, newecm = "zd_小右平砍_日月", seektime = 50, transtime = 100, anispeed = 100},
		},
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[5751] =  	--日月-双刀-上挑	SkillBaseData\技能过程\7\zd_上挑_日月_出招\zd_上挑_日月_出招.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = 200, hacc = 60}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[1740] =  	--日月-双刀-反手上挑	SkillBaseData\技能过程\7\zd_反手上挑_日月_出招\zd_反手上挑_日月_出招.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = 200, hacc = 60}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[7449] =   	--zd_日月扔飞刀_日月	SkillBaseData\技能过程\7\zd_原地扔飞刀_日月_出招\zd_原地扔飞刀_日月_出招.tmpl
	{
		--["ModifyECM"] = {
		--{start_time = 0, newecm = "", seektime = 0, transtime = 100, anispeed = 100},
		--},
		--["HMove"] = { {start_time = 50, end_time = 100, hacc = 0}, },
		["VMove"] = { {start_time = 100, end_time = 600, vg = -50, init_speed = 10, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[7470] =   	--zd_小右下砍1_日月	SkillBaseData\技能过程\7\zd_小右下砍1_日月_出招\zd_小右下砍1_日月_出招.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, newecm = "", seektime = 0, transtime = 100, anispeed = 100},
		},
		["HMove"] = { {start_time = 150, end_time = 350, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[7466] =   	--zd_狂风日月刀1_日月  突击	SkillBaseData\技能过程\7\zd_狂风日月刀1_日月_出招\zd_狂风日月刀1_日月_出招.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, newecm = "", seektime = 0, transtime = 100, anispeed = 100},
		},
		["HMove"] = { {start_time = 50, end_time = 100, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[7469] =   	--zd_狂风日月刀1_日月  回原点	SkillBaseData\技能过程\7\zd_狂风日月刀1_日月_收招3\zd_狂风日月刀1_日月_收招3.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, newecm = "", seektime = 0, transtime = 100, anispeed = 100},
		},
		["HMove"] = { {start_time = 300, end_time = 400, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[16676] =   	--zd_钻地_日月	SkillBaseData\技能过程\7\zd_钻地_日月_出招\zd_钻地_日月_出招.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, newecm = "", seektime = 0, transtime = 100, anispeed = 100},
		},
		["HMove"] = { {start_time = 1100, end_time = 1105, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[1766] =   	--蓄力旋杀2	SkillBaseData\技能过程\7\zd_蓄力旋杀_日月_收招1\zd_蓄力旋杀_日月_收招1.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, newecm = "zd_蓄力旋杀转刀循环_日月", seektime = 0, transtime = 100, anispeed = 100},
		},
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[5745] =   	--蓄力旋杀3	SkillBaseData\技能过程\7\zd_蓄力旋杀_日月_收招2\zd_蓄力旋杀_日月_收招2.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, newecm = "zd_蓄力旋杀_日月", seektime = 1400, transtime = 100, anispeed = 100},
		},
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[9329] =	--SkillBaseData\技能过程\7\V5_zd_旋转摔投分拆2段_日月_踹开\V5_zd_旋转摔投分拆2段_日月_踹开.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = 0, end_time = 500, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = 500, vg = -15, init_speed = 0,speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[9330] =	--SkillBaseData\技能过程\7\V5_zd_双膝升龙_日月_出招\V5_zd_双膝升龙_日月_出招.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = 150, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 150, end_time = -1, vg = -20, init_speed = 6.2, speed_flag = SPEEDFLAG_FORCEDEFINE,}, },
	},
	[9331] =	--SkillBaseData\技能过程\7\V5_zd_双膝升龙_日月_收招1\V5_zd_双膝升龙_日月_收招1.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = 100, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 100, end_time = -100, vg = -20, init_speed = 10, speed_flag = SPEEDFLAG_FORCEDEFINE,},
				{start_time = -99, end_time = -1, vg = -20, init_speed = -20,speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	--[5736] =   	--zd_锁链冲撞_日月   位移段
	--{
		--["ModifyECM"] = {
		--{start_time = 0, newecm = "", seektime = 0, transtime = 100, anispeed = 100},
		--},
		--["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 3, speed_flag = SPEEDFLAG_FORCEDEFINE,}, },
	--},
	[7473] =	--SkillBaseData\技能过程\7\zd_下踹_日月_出招\zd_下踹_日月_出招.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = 200, end_time = 700, hacc = -10}, },
		["VMove"] = { {start_time = 200, end_time = 700, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[7585] =	--SkillBaseData\技能过程\7\zd_旋踢冲天_日月_收招1\zd_旋踢冲天_日月_收招1.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -10, init_speed = 0,speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[5762] =  	--日月-双刀-跳跃俯冲	SkillBaseData\技能过程\7\zd_跳跃俯冲_日月\zd_跳跃俯冲_日月.tmpl
	{
		["ModifyECM"] = {
			{start_time = 0, newecm = "", seektime = 0, transtime = 100, anispeed = 100},
		},
		["HMove"] = { {start_time = 400, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 400, end_time = -1, vg = -200, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	------------------------------------------------
	--hint	07五仙武学
	------------------------------------------------
	-------hint	五仙鞭法
	[8588] =   	--五仙拉人	SkillBaseData\技能过程\8\DZ_五仙门派通用技能5_收招\DZ_五仙门派通用技能5_收招.tmpl
	{
		["HMove"] = { {start_time = 250, end_time = 550, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[16674] =   	--SkillBaseData\技能过程\8\DZ_五仙门派通用技能4_出招\DZ_五仙门派通用技能4_出招.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, newecm = "", seektime = 0, transtime = 100, anispeed = 100},
		},
		["HMove"] = { {start_time = 300, end_time = 400, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	{
		["ModifyECM"] = {
		{start_time = 0, newecm = "", seektime = 0, transtime = 100, anispeed = 100},
		},
		["HMove"] = { {start_time = 300, end_time = 400, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	-------hint	金蛇鞭法
	[8918] =	--SkillBaseData\技能过程\8\V5_zd_转身下扫鞭_五毒_出招\V5_zd_转身下扫鞭_五毒_出招.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = -200, end_time = -1, hacc = -10}, },
		["VMove"] = { {start_time = -200, end_time = -1, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_FORCEDEFINE,}, },
	},
	[4351] =	--SkillBaseData\技能过程\8\zd_左右抽_五毒_收招1\zd_左右抽_五毒_收招1.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = -150, end_time = -1, hacc = -10}, },
		["VMove"] = { {start_time = -150, end_time = -1, vg = -10, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[8920] =	--SkillBaseData\技能过程\8\V5_zd_向左抽_五毒_出招\V5_zd_向左抽_五毒_出招.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = 50, end_time = 250, hacc = -10}, },
		["VMove"] = { {start_time = 50, end_time = 250, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_FORCEDEFINE,}, },
	},
	[3843] =	--SkillBaseData\技能过程\8\zd_向右抽_五毒_出招\zd_向右抽_五毒_出招.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = 150, end_time = 300, hacc = -10}, },
		["VMove"] = { {start_time = 150, end_time = 300, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_FORCEDEFINE,}, },
	},
	[8932] =	--SkillBaseData\技能过程\8\V5_zd_摆手上抽_五毒_收招1\V5_zd_摆手上抽_五毒_收招1.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = 100, end_time = 250, hacc = 0},},
		["VMove"] = { {start_time = 100, end_time = 250, vg = -10, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[3836] =  	--SkillBaseData\技能过程\8\zd_双边绕_五毒_收招1\zd_双边绕_五毒_收招1.tmpl
	{
--		["ModifyECM"] = { [0] = {newecm = "", seektime = 0, transtime = 150, anispeed = 100, speed_arr = {80, 100, 120, 140, 160, 180, 200}, }, },
		["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100, speed_arr = {90, 100, 120, 130, 145, 145}, }, },
		--["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
--	动画名称			ID	播放速度	--动画速度已经调回来了，不需要了
--	V1_zd_双边绕_五毒_收招1慢1	4386	0.9
--	V1_zd_双边绕_五毒_收招1慢2	4387	0.8
--	V1_zd_双边绕_五毒_收招1快1	4388	1.1
--	V1_zd_双边绕_五毒_收招1快2	4389	1.3
--	[4386] =  	--SkillBaseData\技能过程\8\V1_zd_双边绕_五毒_收招1慢1\V1_zd_双边绕_五毒_收招1慢1.tmpl
--	{
--		["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 90}, },
--		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
--	},
--	[4387] =  	--SkillBaseData\技能过程\8\V1_zd_双边绕_五毒_收招1慢2\V1_zd_双边绕_五毒_收招1慢2.tmpl
--	{
--		["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 80}, },
--		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
--	},
--	[4388] =  	--SkillBaseData\技能过程\8\V1_zd_双边绕_五毒_收招1快1\V1_zd_双边绕_五毒_收招1快1.tmpl
--	{
--		["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 110}, },
--		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
--	},
--	[4389] =  	--SkillBaseData\技能过程\8\V1_zd_双边绕_五毒_收招1快2\V1_zd_双边绕_五毒_收招1快2.tmpl
--	{
--		["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 130}, },
--		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
--	},
	[4388] =	--SkillBaseData\技能过程\8\V1_zd_双边绕_五毒_收招1快1\V1_zd_双边绕_五毒_收招1快1.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = 300, end_time = -1, hacc = -10}, },
		["VMove"] = { {start_time = 300, end_time = -1, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_FORCEDEFINE,}, },
	},
	[4390] =	--SkillBaseData\技能过程\8\V1慢1_zd_双边绕_五毒\V1慢1_zd_双边绕_五毒.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = 250, end_time = 550, hacc = -10}, },
		["VMove"] = { {start_time = 250, end_time = 550, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_FORCEDEFINE,}, },
	},
	[8932] =	--SkillBaseData\技能过程\8\V5_zd_摆手上抽_五毒_收招1\V5_zd_摆手上抽_五毒_收招1.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = 100, end_time = 250, hacc = 0},},
		["VMove"] = { {start_time = 100, end_time = 250, vg = -10, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[15939] =	--SkillBaseData\技能过程\8\V6_zd_鞭缠踩人1_五毒_出招\V6_zd_鞭缠踩人1_五毒_出招.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = 400, end_time = -1, hacc = 0},},
		["VMove"] = { {start_time = 400, end_time = -1, vg = -25, init_speed = 8, speed_flag = SPEEDFLAG_FORCEDEFINE,}, },
	},
	[16302] =
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = 400, end_time = -1, hacc = 0},},
		["VMove"] = { {start_time = 400, end_time = -1, vg = -25, init_speed = 8, speed_flag = SPEEDFLAG_FORCEDEFINE,}, },
	},

	[15940] =
        {
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -10, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,},
		},
	},
	[15941] =
        {
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -10, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,},
		},
	},
	[15942] =
        {
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -10, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,},
		},
	},
	[16851] =  	--SkillBaseData\技能过程\8\zd_双边绕_五毒_收招1\zd_双边绕_五毒_收招1.tmpl
	{
		["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 300, anispeed = 100, speed_arr = {145, 145, 145, 145, 145, 145}, }, },},

	-------hint	融血秘咒
	[15832] =	--SkillBaseData\技能过程\8\V5_zd_转身绕鞭_五毒_出招\V5_zd_转身绕鞭_五毒_出招.tmpl
	{
	        ["ModifyECM"] = {
		{start_time = 0, newecm = "zd_施法攻击5_五毒", seektime = 1100, transtime = 100, anispeed = 62.5},
		},
        },
	[8937] =	--SkillBaseData\技能过程\8\V5_zd_转身绕鞭_五毒_出招\V5_zd_转身绕鞭_五毒_出招.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 5}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_FORCEDEFINE,}, },
	},

	[4388] =	--SkillBaseData\技能过程\8\V1_zd_双边绕_五毒_收招1快1\V1_zd_双边绕_五毒_收招1快1.tmpl(正鞭反身鞭1)
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = -200, end_time = -1, hacc = 5}, },
		["VMove"] = { {start_time = -200, end_time = -1, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_FORCEDEFINE,}, },
	},
	[4390] =	--SkillBaseData\技能过程\8\V1慢1_zd_双边绕_五毒\V1慢1_zd_双边绕_五毒.tmpl(正鞭反身鞭2)
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = -350, end_time = -150, hacc = 5}, },
		["VMove"] = { {start_time = -350, end_time = -150, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_FORCEDEFINE,}, },
	},

	[8937] =	--SkillBaseData\技能过程\8\V5_zd_转身绕鞭_五毒_出招\V5_zd_转身绕鞭_五毒_出招.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 5}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_FORCEDEFINE,}, },
	},
	[8938] =	--SkillBaseData\技能过程\8\V5_zd_转身绕鞭_五毒_收招1\V5_zd_转身绕鞭_五毒_收招1.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = 0, end_time = -1, hacc = -5}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -10, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[1834] =   	--五毒地面毒雾动作加速 	SkillBaseData\技能过程\8\zd_施法攻击6_五毒_出招\zd_施法攻击6_五毒_出招.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, newecm = "", seektime = 0, transtime = 100, anispeed = 133},
		},
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
        [8931] =        --SkillBaseData\技能过程\8\V5_zd_摆手上抽_五毒_收招1\V5_zd_摆手上抽_五毒_收招1.tmpl
        {
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -10, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,},
		},
	},

	------------------------------------------------
	--hint	08逍遥武学
	------------------------------------------------
	-------hint	逍遥扇法
        [8600] =   	--逍遥后撤	SkillBaseData\技能过程\9\DZ_逍遥门派通用技能5_收招\DZ_逍遥门派通用技能5_收招.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = 50, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	-------hint	小无相功
	[4437] =	--SkillBaseData\技能过程\9\zd_双向踢_逍遥_出招\zd_双向踢_逍遥_出招.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = -200, end_time = -1, hacc = -20}, },
		["VMove"] = { {start_time = -200, end_time = -1, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_FORCEDEFINE,}, },
	},
	[4442] =	--SkillBaseData\技能过程\9\zd_盾冲锋_逍遥_收招1\zd_盾冲锋_逍遥_收招1.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = 150, end_time = 350, hacc = 0}, },
		["VMove"] = { {start_time = 50, end_time = -200, vg = -10, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},

	-------hint	折梅手
	[15941] =	--SkillBaseData\技能过程\9\V6_zd_下铲腿改_逍遥_出招\V6_zd_下铲腿改_逍遥_出招.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = -200, end_time = -1, hacc = 0},},
		["VMove"] = { {start_time = -200, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[1366] =	--SkillBaseData\技能过程\9\zd_合扇攻击4_逍遥_收招1\zd_合扇攻击4_逍遥_收招1.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = 0, end_time = -1, hacc = -10}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -10, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[1401] =	--逍遥横扫	SkillBaseData\技能过程\9\zd_横扫_逍遥_出招\zd_横扫_逍遥_出招.tmpl(现无位移)
	{
		--["ModifyECM"] =	{ {start_time = 400, newecm = "", seektime = 150, transtime = 150, anispeed = 100},	},
		["HMove"] = { {start_time = 300, end_time = 450, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_FORCEDEFINE,}, },
	},
	[9102] =   	--投技前冲	SkillBaseData\技能过程\9\V5_zd_下压直捅_逍遥_出招\V5_zd_下压直捅_逍遥_出招.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, newecm = "", seektime = 0, transtime = 100, anispeed = 100},
		},
		["HMove"] = { {start_time = 200, end_time = -1, hacc = -1}, },
		["VMove"] = { {start_time = 200, end_time = -1, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_FORCEDEFINE,}, },
	},
	[1387] =	--逍遥侧旋踢	SkillBaseData\技能过程\9\zd_侧旋踢_逍遥_出招\zd_侧旋踢_逍遥_出招.tmpl
	{
		--["ModifyECM"] =	{ {start_time = 400, newecm = "", seektime = 150, transtime = 150, anispeed = 100},	},
		
		["HMove"] = { {start_time = 100, end_time = 500, hacc = 0}, },
		["VMove"] = { {start_time = 100, end_time = 500, vg = -100, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[15848] =	--SkillBaseData\技能过程\9\V6_zd_凌波微步显_逍遥_出招\V6_zd_凌波微步显_逍遥_出招.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = 0, end_time = 50, hacc = -10}, },
		["VMove"] = { {start_time = 0, end_time = 50, vg = 0, init_speed = 0,speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[10218] =	--SkillBaseData\技能过程\9\V5_zd_空中踩人_逍遥_出收招补段\V5_zd_空中踩人_逍遥_出收招补段.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = 0, end_time = 350, hacc = -10}, },
		["VMove"] = { {start_time = 0, end_time = 350, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,},
				--{start_time = 350, end_time = 1000, vg = -30, init_speed = 10, speed_flag = SPEEDFLAG_FORCE_BELOW,},
			},
	},
	[9583] =	--SkillBaseData\技能过程\9\V5_zd_空中踩人_逍遥_出收招\V5_zd_空中踩人_逍遥_出收招.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = 0, end_time = 350, hacc = -10}, },
		["VMove"] = { {start_time = 0, end_time = 350, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,},
				--{start_time = 350, end_time = 1000, vg = -30, init_speed = 10, speed_flag = SPEEDFLAG_FORCE_BELOW,},
			},
	},

	------------------------------------------------
	--hint	09唐门武学
	------------------------------------------------
        [8612] =   	--唐门后滚	SkillBaseData\技能过程\4\DZ_华山门派通用技能3_收招\DZ_华山门派通用技能3_收招.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = 10, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[18674] =   	--唐门鹰击长空	SkillBaseData\技能过程\10\zd_地震波_唐门(重炮)_收招\zd_地震波_唐门(重炮)_收招.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = 0, init_speed = 0,speed_flag = SPEEDFLAG_FORCE_BELOW,}, }
	},
	[7685] =	--SkillBaseData\技能过程\10\zd_后空翻射击1_唐门_出招1\zd_后空翻射击1_唐门_出招1.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_FORCEDEFINE,}, }
	},
	[7765] =	--SkillBaseData\技能过程\10\zd_拳套抓投_唐门_出招2\zd_拳套抓投_唐门_出招2.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = 0, init_speed = 0,speed_flag = SPEEDFLAG_FORCE_BELOW,}, }
	},
	[1522] =  	--唐门空中扔手雷	SkillBaseData\技能过程\10\zd_空中扔手雷_唐门_出招\zd_空中扔手雷_唐门_出招.tmpl
	{
		["ModifyECM"] = { {start_time = 0, airecm = "zd_空中丢手雷_唐门",seektime = 0, transtime = 100, anispeed = 100}, },
		--["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 200, end_time = -1, vg = -100, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[5148] =   	--zd_双枪连射_唐门	SkillBaseData\技能过程\10\zd_双枪连射_唐门_出招\zd_双枪连射_唐门_出招.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, airecm = "zd_空中双枪连射_唐门", seektime = 0, transtime = 100, anispeed = 100},
		},
	},
	[5157] =  	--唐门空中组合火炮射击	SkillBaseData\技能过程\10\zd_组合火炮射击一次_唐门_出招\zd_组合火炮射击一次_唐门_出招.tmpl
	{
		["ModifyECM"] = { {start_time = 0, airecm = "zd_空中炮击1_唐门", seektime = 0, transtime = 100, anispeed = 100}, },
	},
	[5418] =  	--唐门爆炸射击	SkillBaseData\技能过程\10\zd_转炮炮击_唐门_收招2\zd_转炮炮击_唐门_收招2.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = 150, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[7786] =  	--唐门爆炸射击  蓄力蓄满	SkillBaseData\技能过程\10\zd_转炮炮击发射1_唐门_收招1\zd_转炮炮击发射1_唐门_收招1.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = 200, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[5162] =   	--zd_狙击_唐门	SkillBaseData\技能过程\10\zd_狙击2_唐门_出招\zd_狙击2_唐门_出招.tmpl
	{
		["ModifyECM"] = {
		{start_time = 800, newecm = "zd_狙击循环_唐门", seektime = 0, transtime = 100, anispeed = 100},
		},
	},
	[5163] =   	--zd_狙击_唐门	SkillBaseData\技能过程\10\zd_狙击2_唐门_出招\zd_狙击2_唐门_出招.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, newecm = "zd_狙击发射_唐门", seektime = 0, transtime = 100, anispeed = 100},
		},
	},
	[5419] =   	--zd_狙击发射_唐门	SkillBaseData\技能过程\10\zd_狙击发射2_唐门_收招2\zd_狙击发射2_唐门_收招2.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = 100, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	--[5164] =  		--唐门喷火蓄力	SkillBaseData\技能过程\10\zd_长枪喷火蓄力准备_唐门_出招\zd_长枪喷火蓄力准备_唐门_出招.tmpl
	--{
		--["ModifyECM"] = { {start_time = 1600, newecm = "zd_长枪喷火蓄力_唐门", seektime = 0, transtime = 150, anispeed = 100}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	--},
	------------------------------------------------
	--hint	10峨嵋武学
	------------------------------------------------
	[5776] =   	--施法三连击1	SkillBaseData\技能过程\11\zd_施法三连击_峨嵋_出招\zd_施法三连击_峨嵋_出招.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, newecm = "", seektime = 0, transtime = 100, anispeed = 100},
		},
		["HMove"] = { {start_time = 300, end_time = -1, hacc = -10}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[5778] =   	--施法三连击2	SkillBaseData\技能过程\11\zd_施法三连击2_峨嵋_出招\zd_施法三连击2_峨嵋_出招.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, newecm = "zd_施法三连击_峨嵋", seektime = 600, transtime = 100, anispeed = 100},
		},
		["HMove"] = { {start_time = 300, end_time = -1, hacc = -10}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[5780] =   	--施法三连击3	SkillBaseData\技能过程\11\zd_施法三连击3_峨嵋_出招\zd_施法三连击3_峨嵋_出招.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, newecm = "zd_施法三连击_峨嵋", seektime = 1500, transtime = 100, anispeed = 100},
		},
		["HMove"] = { {start_time = 0, end_time = -1, hacc = -10}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -10, init_speed = 1.25, speed_flag = SPEEDFLAG_FORCEDEFINE,}, },
	},
	[5781] =  	--施法三连击3出招2	SkillBaseData\技能过程\11\zd_施法三连击3_峨嵋_收招1\zd_施法三连击3_峨嵋_收招1.tmpl
	{
		["HMove"] = { {start_time = 100, end_time = 400, hacc = -10}, },
		["VMove"] = { {start_time = 100, end_time = 400, vg = -10, init_speed = 1.5, speed_flag = SPEEDFLAG_FORCEDEFINE,}, },
	},
	[5782] =   	--三连抓1	SkillBaseData\技能过程\11\zd_三连抓_峨嵋_出招\zd_三连抓_峨嵋_出招.tmpl
	{
		["ModifyECM"] = {
			{start_time = 0, end_time = -1, newecm = "zd_三连抓_峨嵋", seektime = 0, transtime = 100, anispeed = 100},
		},
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[5784] =	--SkillBaseData\技能过程\11\zd_三连抓_峨嵋_收招2\zd_三连抓_峨嵋_收招2.tmpl
	{
		["ModifyECM"] = {
			{start_time = -1, end_time = -2, newecm = "zd_三连抓_峨嵋", seektime = 0, transtime = 0, anispeed = 100},
		},
	},
	[5785] =   	--三连抓2	SkillBaseData\技能过程\11\zd_三连抓2_峨嵋_出招\zd_三连抓2_峨嵋_出招.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, newecm = "zd_三连抓_峨嵋", seektime = 1000, transtime = 100, anispeed = 100},
		},
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[8723] =	--SkillBaseData\技能过程\11\V5_zd_跳跃双爪_峨嵋_出招\V5_zd_跳跃双爪_峨嵋_出招.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100}, },
		["HMove"] = {	{start_time = 0, end_time = 250, hacc = 30},
				{start_time = 250, end_time = -1, hacc = -30},
			},
		["VMove"] = {	{start_time = 0, end_time = 250, vg = -100, init_speed = 25, speed_flag = SPEEDFLAG_AUTO,},
				{start_time = 250, end_time = -1, vg = 30, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,},
			},
	},
	[5809] =  	--SkillBaseData\技能过程\11\zd_直冲四连击_峨眉_出招\zd_直冲四连击_峨眉_出招.tmpl
	{
		["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 100, anispeed = 100},},
		["HMove"] = { {start_time = 150, end_time = -1, hacc = -10}, },
		["VMove"] = { {start_time = 150, end_time = -1, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_FORCEDEFINE,}, },
	},
	[5810] =	--SkillBaseData\技能过程\11\zd_直冲四连击_峨眉_收招1\zd_直冲四连击_峨眉_收招1.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = 200, end_time = 350, hacc = -10}, },
		["VMove"] = { {start_time = 200, end_time = 350, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_FORCEDEFINE,}, },
	},
	[5811] =  	--SkillBaseData\技能过程\11\zd_直冲四连击_峨眉_收招2\zd_直冲四连击_峨眉_收招2.tmpl
	{
		["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 100, anispeed = 100},	},
		["HMove"] = { {start_time = 0, end_time = 150, hacc = -10}, },
		["VMove"] = { {start_time = 0, end_time = 150, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_FORCEDEFINE,}, },
	},
	[5812] =	--SkillBaseData\技能过程\11\zd_直冲四连击_峨眉_收招3\zd_直冲四连击_峨眉_收招3.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = -100, end_time = -1, hacc = -10}, },
		["VMove"] = { {start_time = -100, end_time = -1, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_FORCEDEFINE,}, },
	},
	[5813] =  	--SkillBaseData\技能过程\11\zd_直冲四连击_峨眉_收招4\zd_直冲四连击_峨眉_收招4.tmpl(现无位移)
	{
		["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 100, anispeed = 100},	},
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[5794] =   	--施法11	SkillBaseData\技能过程\11\zd_施法11_峨嵋_收招1\zd_施法11_峨嵋_收招1.tmpl
	{
		["ModifyECM"] = {
			{start_time = 0, newecm = "", seektime = 0, transtime = 100, anispeed = 100},
		},
		["HMove"] = { {start_time = 0, end_time = 350, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[5791] =   	--劈头盖脸	SkillBaseData\技能过程\11\zd_劈头盖脸_峨嵋_出招\zd_劈头盖脸_峨嵋_出招.tmpl
	{
		["ModifyECM"] = {
			{start_time = 0, newecm = "", seektime = 0, transtime = 100, anispeed = 100},
		},
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 150, end_time = -1, vg = -30, init_speed = 9, speed_flag = SPEEDFLAG_FORCE_BELOW,},
		},
	},
	[15928] =   	--施法11	SkillBaseData\技能过程\11\v6_zd_利爪转身_峨嵋_收招1\v6_zd_利爪转身_峨嵋_收招1.tmpl
	{
		["ModifyECM"] = {
			{start_time = 0, newecm = "", seektime = 0, transtime = 100, anispeed = 100},
		},
		["HMove"] = { {start_time = 0, end_time = 200, hacc = 30}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},--[[
	--[15915] =   	--施法11	SkillBaseData\技能过程\11\v6_zd_闪电掌6式1_峨嵋_收招\v6_zd_闪电掌6式1_峨嵋_收招.tmpl
	{
		["ModifyECM"] = {
			{start_time = 0, newecm = "", seektime = 0, transtime = 100, anispeed = 100},
		},
		["HMove"] = { {start_time = 50, end_time = 100, hacc = 30}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	--[15916] =   	--施法11	SkillBaseData\技能过程\11\v6_zd_闪电掌6式1_峨嵋_收招\v6_zd_闪电掌6式1_峨嵋_收招.tmpl
	{
		["ModifyECM"] = {
			{start_time = 0, newecm = "", seektime = 0, transtime = 100, anispeed = 100},
		},
		["HMove"] = { {start_time = 50, end_time = 100, hacc = 30}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	--[15917] =   	--施法11	SkillBaseData\技能过程\11\v6_zd_闪电掌6式2_峨嵋_收招\v6_zd_闪电掌6式2_峨嵋_收招.tmpl
	{
		["ModifyECM"] = {
			{start_time = 0, newecm = "", seektime = 0, transtime = 100, anispeed = 100},
		},
		["HMove"] = { {start_time = 50, end_time = 100, hacc = 30}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	--[15918] =   	--施法11	SkillBaseData\技能过程\11\v6_zd_闪电掌6式1_峨嵋_收招\v6_zd_闪电掌6式1_峨嵋_收招.tmpl
	{
		["ModifyECM"] = {
			{start_time = 0, newecm = "", seektime = 0, transtime = 100, anispeed = 100},
		},
		["HMove"] = { {start_time = 50, end_time = 100, hacc = 30}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	--[15919] =   	--施法11	SkillBaseData\技能过程\11\v6_zd_闪电掌6式3_峨嵋_收招\v6_zd_闪电掌6式3_峨嵋_收招.tmpl
	{
		["ModifyECM"] = {
			{start_time = 0, newecm = "", seektime = 0, transtime = 100, anispeed = 100},
		},
		["HMove"] = { {start_time = 50, end_time = 100, hacc = 30}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	--[15920] =   	--施法11	SkillBaseData\技能过程\11\v6_zd_闪电掌6式1_峨嵋_收招\v6_zd_闪电掌6式1_峨嵋_收招.tmpl
	{
		["ModifyECM"] = {
			{start_time = 0, newecm = "", seektime = 0, transtime = 100, anispeed = 100},
		},
		["HMove"] = { {start_time = 50, end_time = 100, hacc = 30}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	--[15921] =   	--施法11	SkillBaseData\技能过程\11\v6_zd_闪电掌6式4_峨嵋_收招\v6_zd_闪电掌6式4_峨嵋_收招.tmpl
	{
		["ModifyECM"] = {
			{start_time = 0, newecm = "", seektime = 0, transtime = 100, anispeed = 100},
		},
		["HMove"] = { {start_time = 50, end_time = 100, hacc = 30}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	--[15922] =   	--施法11	SkillBaseData\技能过程\11\v6_zd_闪电掌6式1_峨嵋_收招\v6_zd_闪电掌6式1_峨嵋_收招.tmpl
	{
		["ModifyECM"] = {
			{start_time = 0, newecm = "", seektime = 0, transtime = 100, anispeed = 100},
		},
		["HMove"] = { {start_time = 50, end_time = 100, hacc = 30}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	--[15923] =   	--施法11	SkillBaseData\技能过程\11\v6_zd_闪电掌6式5_峨嵋_收招\v6_zd_闪电掌6式5_峨嵋_收招.tmpl
	{
		["ModifyECM"] = {
			{start_time = 0, newecm = "", seektime = 0, transtime = 100, anispeed = 100},
		},
		["HMove"] = { {start_time = 50, end_time = 100, hacc = 30}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	--[15924] =   	--施法11	SkillBaseData\技能过程\11\v6_zd_闪电掌6式1_峨嵋_收招\v6_zd_闪电掌6式1_峨嵋_收招.tmpl
	{
		["ModifyECM"] = {
			{start_time = 0, newecm = "", seektime = 0, transtime = 100, anispeed = 100},
		},
		["HMove"] = { {start_time = 50, end_time = 100, hacc = 30}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	--[15925] =   	--施法11	SkillBaseData\技能过程\11\v6_zd_闪电掌6式6_峨嵋_收招\v6_zd_闪电掌6式6_峨嵋_收招.tmpl
	{
		["ModifyECM"] = {
			{start_time = 0, newecm = "", seektime = 0, transtime = 100, anispeed = 100},
		},
		["HMove"] = { {start_time = 50, end_time = 100, hacc = 30}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},

	[5787] =   	--施法07	SkillBaseData\技能过程\11\zd_施法07_峨嵋_出招\zd_施法07_峨嵋_出招.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 150, end_time = 500, vg = -30, init_speed = 10.5, speed_flag = SPEEDFLAG_FORCEDEFINE,},
			{start_time = 500, end_time = -1, vg = -2, init_speed = 0, speed_flag = SPEEDFLAG_FORCEDEFINE,},
		},
	},
	[5788] =   	--SkillBaseData\技能过程\11\zd_施法07_峨嵋_收招1\zd_施法07_峨嵋_收招1.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = -0.4, speed_flag = SPEEDFLAG_FORCEDEFINE,}, },
	},
	[5795] =	--SkillBaseData\技能过程\11\zd_施法07_峨嵋_收招2\zd_施法07_峨嵋_收招2.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = -0.8, speed_flag = SPEEDFLAG_FORCEDEFINE,}, },
	},
	[5796] =	--SkillBaseData\技能过程\11\zd_施法07_峨嵋_收招3\zd_施法07_峨嵋_收招3.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},]]
	------------------------------------------------
	--hint	独孤武学
	------------------------------------------------
	[20644] =	--独孤半月脚斩砸地出招
	{
		["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = 300, end_time = 400, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -150, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[20645] =   	--独孤半月脚斩砸地收招
	{
		["HMove"] = { {start_time = 0, end_time = 10, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	--[20724] =   	--独孤半月脚斩砸地踢腿收招
	{
		["HMove"] = { {start_time = 0, end_time = 10, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[20807] =	--独孤凤凰涅磐砸地出招
	{
		["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = 150, end_time = 450, hacc = 0}, },
		["VMove"] = { {start_time = 50, end_time = 400, vg = -300, init_speed = 00, SPEEDFLAG_FORCE_BELOW,}, },
	},
	[20633] =   	--独孤凰羽遮月改收招
	{
		--["ModifyECM"] = {
		--{start_time = 0, newecm = "", seektime = 0, transtime = 100, anispeed = 100, },
		--},
		["HMove"] = { {start_time = 100, end_time = 250, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[20774] =	--独孤鸟爪砸地位移出招
	{
		["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = 100, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[20659] =	--独孤鹰心雁爪砸地收招
	{
		["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = 0, end_time = 300, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[20772] =	--独孤鹰心雁爪滑铲收招
	{
		--["ModifyECM"] = {
		--{start_time = 0, newecm = "", seektime = 0, transtime = 100, anispeed = 100, },
		--},
		["HMove"] = { {start_time = 0, end_time = 250, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[20649] =	--独孤幻影剑法第一下判定收招
	{
		["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 300, transtime = 150, anispeed = 100}, },
		--["HMove"] = { {start_time = 0, end_time = 300, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	------------------------------------------------
	--hint	201606新全门派通用技能
	------------------------------------------------
	[21726] =	--独孤鹰心雁爪滑铲收招
	{
		--["ModifyECM"] = {
		--{start_time = 0, newecm = "", seektime = 0, transtime = 100, anispeed = 100, },
		--},
		["HMove"] = { {start_time = 0, end_time = 250, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[21727] =	--独孤鹰心雁爪滑铲收招
	{
		--["ModifyECM"] = {
		--{start_time = 0, newecm = "", seektime = 0, transtime = 100, anispeed = 100, },
		--},
		["HMove"] = { {start_time = 0, end_time = 250, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[21730] =	--独孤鹰心雁爪滑铲收招
	{
		--["ModifyECM"] = {
		--{start_time = 0, newecm = "", seektime = 0, transtime = 100, anispeed = 100, },
		--},
		["HMove"] = { {start_time = 0, end_time = 250, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[21578] =	--独孤鹰心雁爪滑铲收招
	{
		--["ModifyECM"] = {
		--{start_time = 0, newecm = "", seektime = 0, transtime = 100, anispeed = 100, },
		--},
		["HMove"] = { {start_time = 0, end_time = 250, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[21580] =	--独孤鹰心雁爪滑铲收招
	{
		--["ModifyECM"] = {
		--{start_time = 0, newecm = "", seektime = 0, transtime = 100, anispeed = 100, },
		--},
		["HMove"] = { {start_time = 0, end_time = 250, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	------------------------------------------------
	--hint	全门派MAX怒气技
	------------------------------------------------
	[10953] =	--SkillBaseData\技能过程\2\V5_少林终极大招_收招\V5_少林终极大招_收招.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -10, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[10956] =	--SkillBaseData\技能过程\3\V5_武当终极大招_收招\V5_武当终极大招_收招.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -10, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[10959] =	--SkillBaseData\技能过程\4\V5_华山终极大招_收招\V5_华山终极大招_收招.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -10, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[10962] =	--SkillBaseData\技能过程\5\V5_恒山终极大招_收招\V5_恒山终极大招_收招.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -10, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[10923] =	--SkillBaseData\技能过程\6\V5_衡山终极大招_收招\V5_衡山终极大招_收招.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -10, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[10926] =	--SkillBaseData\技能过程\7\V5_日月终极大招_收招\V5_日月终极大招_收招.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -10, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[10929] =	--SkillBaseData\技能过程\8\V5_五仙终极大招_收招\V5_五仙终极大招_收招.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -10, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[10932] =	--SkillBaseData\技能过程\9\V5_逍遥终极大招_收招\V5_逍遥终极大招_收招.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -10, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[10935] =	--SkillBaseData\技能过程\10\V5_唐门终极大招_收招\V5_唐门终极大招_收招.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -10, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[10938] =	--SkillBaseData\技能过程\11\V5_峨嵋终极大招_收招\V5_峨嵋终极大招_收招.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -10, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[20671] =	--SkillBaseData\技能过程\12\沧溟终极大招_收招过程\沧溟终极大招_收招过程.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -10, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	------------------------------------------------
	--hint	新版本补充技能
	------------------------------------------------
        [10842] =   	--SkillBaseData\技能过程\2\V5_zd_罗汉头撞_少林_收招\V5_zd_罗汉头撞_少林_收招.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = 150, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[10846] =	--SkillBaseData\技能过程\2\V5_zd_睡梦罗汉_少林_收招\V5_zd_睡梦罗汉_少林_收招.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = 100, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[10968] =	--SkillBaseData\技能过程\2\V5_zd_罗汉踢腿_少林_出招\V5_zd_罗汉踢腿_少林_出招.tmpl
	{
		["HMove"] = { {start_time = -150, end_time = -1, hacc = -10}, },
		["VMove"] = { {start_time = -150, end_time = -1, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_FORCEDEFINE,}, },
	},
	[10970] =	--SkillBaseData\技能过程\2\V5_zd_金刚坠_少林_出招\V5_zd_金刚坠_少林_出招.tmpl
	{
		["HMove"] = { {start_time = -250, end_time = -1, hacc = -10}, },
		["VMove"] = { {start_time = -250, end_time = -1, vg = -13.8, init_speed = 5, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[10972] =	--SkillBaseData\技能过程\2\V5_zd_通背拳_少林_出招\V5_zd_通背拳_少林_出招.tmpl
	{
		["HMove"] = { {start_time = -200, end_time = -1, hacc = -10}, },
		["VMove"] = { {start_time = -200, end_time = -1, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_FORCEDEFINE,}, },
	},
	[11204] =   	--SkillBaseData\技能过程\5\V5_zd_前冲升龙1_恒山_收招\V5_zd_前冲升龙1_恒山_收招.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = 150, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[11184] =   	--SkillBaseData\技能过程\5\V5_zd_前冲直撞1_恒山_收招\V5_zd_前冲直撞1_恒山_收招.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = 100, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[11186] =   	--SkillBaseData\技能过程\5\V5_zd_前冲直撞2_恒山_收招\V5_zd_前冲直撞2_恒山_收招.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = 100, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[15588] =	--SkillBaseData\技能过程\2\V5_zd_列焰三段1_峨嵋_出招\V5_zd_列焰三段1_峨嵋_出招.tmpl
	{
		["HMove"] = { {start_time = -150, end_time = -1, hacc = -10}, },
		["VMove"] = { {start_time = -150, end_time = -1, vg = -13.8, init_speed = 5, speed_flag = SPEEDFLAG_FORCEDEFINE,}, },
	},
	[15590] =	--SkillBaseData\技能过程\2\V5_zd_列焰三段2_峨嵋_出招\V5_zd_列焰三段2_峨嵋_出招.tmpl
	{
		["HMove"] = { {start_time = -100, end_time = -1, hacc = -10}, },
		["VMove"] = { {start_time = -100, end_time = -1, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},

	------------------------------------------------
	--hint	★★★★★江湖绝学★★★★★
	------------------------------------------------
	--[[
	[16649] =	--SkillBaseData\技能过程\1\V7_江湖绝学D2三式_出招\V7_江湖绝学D2三式_出招.tmpl
	{
		["ModifyECM"] = { {start_time = 0, newecm = "zd_太祖长拳3_通用", seektime = 0, transtime = 150, anispeed = 68.75}, },
		--["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = -10, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[16593] =	--SkillBaseData\技能过程\1\V7_江湖绝学D2_出招\V7_江湖绝学D2_出招.tmpl
	{
		["ModifyECM"] = { {start_time = 0, newecm = "zd_太祖长拳1_通用", seektime = 0, transtime = 150, anispeed = 70}, },
		--["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = -10, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	]]
	[16654] =	--SkillBaseData\技能过程\1\V7_江湖绝学D3二式_收招1\V7_江湖绝学D3二式_收招1.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = 0, end_time = -200, hacc = -20}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -16, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[16654] =	--SkillBaseData\技能过程\1\V7_江湖绝学D3二式_收招1\V7_江湖绝学D3二式_收招1.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = 0, end_time = -200, hacc = -20}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -16, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[17915] =	--SkillBaseData\技能过程\1\V7_江湖绝学S2_收招3\V7_江湖绝学S2_收招3.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = 0, end_time = -1, hacc = -20}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -16, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[17810] =	--SkillBaseData\技能过程\1\V7_江湖绝学S5_收招\V7_江湖绝学S5_收招.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = 0, end_time = -1, hacc = -20}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -16, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[17929] =	--SkillBaseData\技能过程\1\V7_江湖绝学S5_2次位移收招\V7_江湖绝学S5_2次位移收招.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = 0, end_time = -1, hacc = -20}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -16, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	
	------------------------------------------------
	--hint	大地图怪用技能
	------------------------------------------------
	-------hint	可能是最早测怪配sv
	[242] =		--SkillBaseData\技能过程\13\林福技能2过程\林福技能2过程.tmpl
	{
		["ModifyECM"] = { {start_time = 0, newecm = "技能攻击2", seektime = 0, transtime = 150, anispeed = 60},	},
		["HMove"] = { {start_time = 0, end_time = 1000, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = 1000, vg = -19.6, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	-------hint	第一批精调战术怪
	[5854] =  	--SkillBaseData\技能过程\13\百药门长老林当归_技能1_出招\百药门长老林当归_技能1_出招.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 100, anispeed = 100},	},
		["HMove"] = { {start_time = 300, end_time = 750, hacc = 0}, },
		["VMove"] = { {start_time = 300, end_time = 750, vg = -100, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[5856] =  	--SkillBaseData\技能过程\13\百药门长老林当归_技能2_出招\百药门长老林当归_技能2_出招.tmpl
	{
		["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 100, anispeed = 160},
			},
		--["HMove"] = { {start_time = 0, end_time = 0, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[5857] =  	--SkillBaseData\技能过程\13\百药门长老林当归_技能2_收招1\百药门长老林当归_技能2_收招1.tmpl
	{
		["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 3000, transtime = 100, anispeed = 100},	},
		--["HMove"] = { {start_time = 0, end_time = 0, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	-------hint	帮派副本专用技能
	[10847] =	--SkillBaseData\技能过程\30\灯奴帮派boss砸地出招\灯奴帮派boss砸地出招.tmpl
	{
		["ModifyECM"] = {{start_time = 0, end_time = 2000, newecm = "休闲动作1", seektime = 0, transtime = 100, anispeed = 100, },},
		--["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[10848] =	--SkillBaseData\技能过程\30\灯奴帮派boss砸地收招1\灯奴帮派boss砸地收招1.tmpl
	{
		["ModifyECM"] = {{start_time = 0, end_time = 2000, newecm = "坐地自爆", seektime = 0, transtime = 100, anispeed = 100, },},
		--["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[10849] =	--SkillBaseData\技能过程\30\灯奴帮派boss喷火出招\灯奴帮派boss喷火出招.tmpl
	{
		["ModifyECM"] = {{start_time = 0, end_time = -1, newecm = "吐火循环", seektime = 0, transtime = 100, anispeed = 100, },},
		--["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	--[[
	[10850] =	--SkillBaseData\技能过程\30\灯奴帮派boss喷火收招1\灯奴帮派boss喷火收招1.tmpl
	{
		--["ModifyECM"] = {{start_time = 0, end_time = -1, newecm = "", seektime = 0, transtime = 100, anispeed = 100, },},
		--["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},]]
	[3966] =
	{
		["ModifyECM"] = {{start_time = 0, end_time = -1, newecm = "", seektime = 0, transtime = 100, anispeed = 100, },},
		["HMove"] = { {start_time = 450, end_time = 800, hacc = 0}, },
		["VMove"] = { {start_time = 450, end_time = 800, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[3489] =
	{
		["ModifyECM"] = {{start_time = 0, end_time = -1, newecm = "", seektime = 0, transtime = 100, anispeed = 100, },},
		["HMove"] = { {start_time = 600, end_time = 800, hacc = 0}, },
		["VMove"] = { {start_time = 600, end_time = 800, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[3495] =
	{
		["ModifyECM"] = {{start_time = 0, end_time = -1, newecm = "", seektime = 0, transtime = 100, anispeed = 100, },},
		["HMove"] = { {start_time = 400, end_time = 500, hacc = 0}, },
		["VMove"] = { {start_time = 400, end_time = 500, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[13445] =	--翻云劫副本最终丁勉跳跃
	{
		["ModifyECM"] = {
			{start_time = 0, end_time = 450, newecm = "翻跟头跳", seektime = 0, transtime = 100, anispeed = 100, },
			{start_time = 450, end_time = 2300, newecm = "空中循环", seektime = 0, transtime = 100, anispeed = 100, },
			{start_time = 2300, end_time = -1, newecm = "落地", seektime = 0, transtime = 100, anispeed = 100, },
		},
		["HMove"] = { {start_time = 100, end_time = 2400, hacc = 0}, },
		["VMove"] = { {start_time = 100, end_time = 2400, vg = -10, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[16026] =	--许显纯开场冲出来
	{
		["HMove"] = { {start_time = 0, end_time = 1000, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = 1000, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[16036] =	--许显纯小步回旋斩出招
	{
		["HMove"] = { {start_time = 0, end_time = 650, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = 650, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[16037] =	--许显纯小步回旋斩收招
	{
		["HMove"] = { {start_time = 0, end_time = 900, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = 900, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[16079] =	--黎人洪突刺
	{
		["HMove"] = { {start_time = 0, end_time = 900, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = 900, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[16263] =	--大圣本垒打出招段
	{
		["HMove"] = { {start_time = 0, end_time = 650, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = 650, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[16264] =	--大圣本垒打大推段
	{
		["HMove"] = { {start_time = 0, end_time = 900, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = 900, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[16265] =	--大圣本垒打本垒打段
	{
		["HMove"] = { {start_time = 0, end_time = 900, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = 900, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[16267] =	--大圣瞬移
	{
		["ModifyECM"] = {
			{start_time = 0, end_time = 250, newecm = "技能攻击4", seektime = 0, transtime = 100, anispeed = 100, },
			{start_time = 250, end_time = 500, newecm = "技能攻击4", seektime = 0, transtime = 100, anispeed = 100, },
			{start_time = 500, end_time = 750, newecm = "技能攻击4", seektime = 0, transtime = 100, anispeed = 100, },
			{start_time = 750, end_time = -1, newecm = "技能攻击4", seektime = 0, transtime = 100, anispeed = 100, },
		},
		["HMove"] = { {start_time = 100, end_time = 1000, hacc = 0}, },
		["VMove"] = { {start_time = 100, end_time = 1000, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[16270] =	--大圣突击连打突击段
	{
		["HMove"] = { {start_time = 250, end_time = 750, hacc = 0}, },
		["VMove"] = { {start_time = 250, end_time = 750, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[16279] =	--大圣突击连打回跳段
	{
		["HMove"] = { {start_time = 50, end_time = 500, hacc = 0}, },
		["VMove"] = { {start_time = 50, end_time = 500, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[16251] =	--大圣后跳突进凿突进段
	{
		["HMove"] = { {start_time = 275, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 275, end_time = -1, vg = -1, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[16254] =	--大圣后跳突进挥突进段
	{
		["HMove"] = { {start_time = 575, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 575, end_time = -1, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
--[[
--------
授谱2011-1042 费彬 令狐冲
--------
]]--
	[16325] =	--费彬偶数弹突进收招
	{
		["HMove"] = { {start_time = 400, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 400, end_time = -1, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[16326] =	--费彬偶数弹突进出招
	{
		["HMove"] = { {start_time = 0, end_time = 350, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = 350, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[16330] =	--费彬spin
	{
		["HMove"] = { {start_time = 0, end_time = 350, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = 350, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[16332] =	--费彬spin
	{
		["HMove"] = { {start_time = 0, end_time = 350, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = 350, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[16334] =	--费彬spin
	{
		["HMove"] = { {start_time = 0, end_time = 350, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = 350, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[16336] =	--费彬spin
	{
		["HMove"] = { {start_time = 0, end_time = 350, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = 350, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[16338] =	--费彬spin
	{
		["HMove"] = { {start_time = 1300, end_time = 1400, hacc = 0}, },
		["VMove"] = { {start_time = 1300, end_time = 1400, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[16341] =	--费彬common1
	{
		["HMove"] = { {start_time = 0, end_time = 150, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = 150, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[16346] =	--费彬crossmove
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[16347] =	--费彬crossmove
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[16348] =	--费彬crossmove
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[16349] =	--费彬crossmove
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[16350] =	--费彬crossmove
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[16351] =	--费彬crossmove
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -32, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[16352] =	--费彬crossmove
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[16353] =	--费彬crossmove
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[16354] =	--费彬walk
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[16358] =	--费彬multiSlash
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[16359] =	--费彬multiSlash
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[16360] =	--费彬multiSlash
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[16370] =	--费彬suckMultiShot
	{
		["HMove"] = { {start_time = 400, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 400, end_time = -1, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[16371] =	--费彬suckMultiShot
	{
		["HMove"] = { {start_time = 0, end_time = 350, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = 350, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[16383] =	--令狐冲dashThrust
	{
		["HMove"] = { {start_time = 0, end_time = 550, hacc = -80}, },
		["VMove"] = { {start_time = 0, end_time = 550, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[16384] =	--令狐冲backSprint
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -32, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
--[[
--------
偷听2084-1215 贾人达
--------
]]--
	[16418] =	--贾人达跳跃
	{
		["ModifyECM"] = {
			{start_time = 0, end_time = 500, newecm = "翻跟头跳", seektime = 0, transtime = 100, anispeed = 100, },
			{start_time = 500, end_time = 1000, newecm = "落地", seektime = 0, transtime = 100, anispeed = 100, },
		},
		["HMove"] = { {start_time = 100, end_time = 500, hacc = 0}, },
		["VMove"] = { {start_time = 100, end_time = 500, vg = -16, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
--[[
--------
雨夜2481-1236 华山派众人
--------
]]--
	[18561] =	--岳不群跳出
	{
		["ModifyECM"] = {
			{start_time = 0, end_time = 450, newecm = "翻跟头跳", seektime = 0, transtime = 100, anispeed = 100, },
			{start_time = 450, end_time = 1000, newecm = "空中循环", seektime = 0, transtime = 100, anispeed = 100, },
			{start_time = 1000, end_time = -1, newecm = "落地", seektime = 0, transtime = 100, anispeed = 100, },
		},
		["HMove"] = { {start_time = 100, end_time = 1000, hacc = 0}, },
		["VMove"] = { {start_time = 100, end_time = 1000, vg = -10, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[18563] =	--宁中则跳出
	{
		["ModifyECM"] = {
			{start_time = 800, end_time = -1, newecm = "落地", seektime = 0, transtime = 100, anispeed = 100, },
		},
		["HMove"] = { {start_time = 0, end_time = 800, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = 800, vg = -10, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[18567] =	--岳灵珊跳出
	{
		["ModifyECM"] = {
			{start_time = 850, end_time = -1, newecm = "落地", seektime = 0, transtime = 100, anispeed = 100, },
		},
		["HMove"] = { {start_time = 0, end_time = 850, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = 850, vg = -10, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[18565] =	--林平之跳出
	{
		["ModifyECM"] = {
			{start_time = 1050, end_time = -1, newecm = "落地", seektime = 0, transtime = 100, anispeed = 100, },
		},
		["HMove"] = { {start_time = 0, end_time = 1050, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = 1050, vg = -10, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[18569] =	--梁发跳出
	{
		["HMove"] = { {start_time = 0, end_time = 1250, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = 1250, vg = -10, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[18571] =	--女弟子跳出
	{
		["HMove"] = { {start_time = 0, end_time = 1350, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = 1350, vg = -10, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
--[[
--------
13年七夕田伯光4719-1607 田伯光
--------
]]--

	[18102] =	--田伯光回退1
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[18105] =	--田伯光回退2
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[18109] =	--田伯光回退3
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[18110] =	--田伯光踏步
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[18113] =	--田伯光踏步
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[18114] =	--田伯光踏步
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[18117] =	--田伯光回退
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[18118] =	--田伯光跳背
	{
		["ModifyECM"] = {
			{start_time = 0, end_time = 450, newecm = "翻跟头跳", seektime = 0, transtime = 100, anispeed = 100, },
			{start_time = 450, end_time = 1000, newecm = "落地", seektime = 0, transtime = 100, anispeed = 100, },
		},
		["HMove"] = { {start_time = 100, end_time = 500, hacc = 0}, },
		["VMove"] = { {start_time = 100, end_time = 500, vg = -16, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[18121] =	--田伯光突刺
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[18124] =	--田伯光突刺
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[18127] =	--田伯光突刺
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[18130] =	--田伯光突刺
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[18133] =	--田伯光突刺
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[18134] =	--田伯光回退
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
---------------------
	[3870] =
	{
		["HMove"] = { {start_time = 350, end_time = 600, hacc = 0}, },
		["VMove"] = { {start_time = 350, end_time = 600, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[3441] =
	{
		["HMove"] = { {start_time = 100, end_time = 350, hacc = 0}, },
		["VMove"] = { {start_time = 100, end_time = 350, vg = -16, init_speed = 0, speed_flag = SPEEDFLAG_FORCEDEFINE,}, },
	},
	[3442] =
	{
		["HMove"] = { {start_time = 150, end_time = 300, hacc = 0}, },
		["VMove"] = { {start_time = 150, end_time = 300, vg = -16, init_speed = 0, speed_flag = SPEEDFLAG_FORCEDEFINE,}, },
	},
	[3515] =
	{
		["HMove"] = { {start_time = 450, end_time = 750, hacc = 0}, },
		["VMove"] = { {start_time = 450, end_time = 750, vg = -16, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[3536] =
	{
		["HMove"] = { {start_time = 0, end_time = 600, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = 600, vg = -16, init_speed = 0, speed_flag = SPEEDFLAG_FORCEDEFINE,}, },
	},
	[3517] =
	{
		["HMove"] = { {start_time = 450, end_time = 600, hacc = 0}, },
		["VMove"] = { {start_time = 450, end_time = 600, vg = -16, init_speed = 0, speed_flag = SPEEDFLAG_FORCEDEFINE,}, },
	},
	[3537] =
	{
		["HMove"] = { {start_time = 450, end_time = 600, hacc = 0}, },
		["VMove"] = { {start_time = 450, end_time = 600, vg = -16, init_speed = 0, speed_flag = SPEEDFLAG_FORCEDEFINE,}, },
	},
	[3547] =
	{
		["HMove"] = { {start_time = 450, end_time = 600, hacc = 0}, },
		["VMove"] = { {start_time = 450, end_time = 600, vg = -16, init_speed = 0, speed_flag = SPEEDFLAG_FORCEDEFINE,}, },
	},
	[3550] =
	{
		["HMove"] = { {start_time = 0, end_time = 600, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = 600, vg = -16, init_speed = 0, speed_flag = SPEEDFLAG_FORCEDEFINE,}, },
	},
	[708] =
	{
		["HMove"] = { {start_time = 0, end_time = 250, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = 250, vg = -16, init_speed = 0, speed_flag = SPEEDFLAG_FORCEDEFINE,}, },
	},
	[13577] =
	{
		["HMove"] = { {start_time = 0, end_time = 250, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = 250, vg = -16, init_speed = 0, speed_flag = SPEEDFLAG_FORCEDEFINE,}, },
	},
	[10851] =	--SkillBaseData\技能过程\30\黑衣人头目帮派boss冲锋出招\黑衣人头目帮派boss冲锋出招.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, end_time = 1650, newecm = "休闲动作2", seektime = 0, transtime = 100, anispeed = 100, },
		{start_time = 1651, end_time = -1, newecm = "技能攻击1", seektime = 750, transtime = 100, anispeed = 100, },
		},
		--["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	--[[
	[10852] =	--SkillBaseData\技能过程\30\黑衣人头目帮派boss冲锋收招1\黑衣人头目帮派boss冲锋收招1.tmpl
	{
		--["ModifyECM"] = {{start_time = 0, end_time = -1, newecm = "技能攻击1", seektime = 1100, transtime = 100, anispeed = 100, },},
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},]]
	[10853] =	--SkillBaseData\技能过程\30\叛军首领帮派boss砸地出招\叛军首领帮派boss砸地出招.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, end_time = 1000, newecm = "休闲动作2", seektime = 0, transtime = 100, anispeed = 100, },
		{start_time = 1001, end_time = 2200, newecm = "技能攻击1", seektime = 0, transtime = 100, anispeed = 100, },
		},
		--["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},

	[10854] =	--SkillBaseData\技能过程\30\叛军首领帮派boss砸地收招1\叛军首领帮派boss砸地收招1.tmpl
	{
		["ModifyECM"] = {{start_time = 0, end_time = -1, newecm = "技能攻击1", seektime = 1200, transtime = 100, anispeed = 100, },},
		--["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[10855] =	--SkillBaseData\技能过程\30\水贼头领鱼得水帮派boss排箭出招\水贼头领鱼得水帮派boss排箭出招.tmpl
	{
		["ModifyECM"] = {{start_time = 0, end_time = 1000, newecm = "休闲动作1", seektime = 1500, transtime = 100, anispeed = 100, },},
		--["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[10856] =	--SkillBaseData\技能过程\30\水贼头领鱼得水帮派boss排箭收招1\水贼头领鱼得水帮派boss排箭收招1.tmpl
	{
		["ModifyECM"] = {{start_time = 0, end_time = 1200, newecm = "技能攻击2", seektime = 1000, transtime = 100, anispeed = 100, },},
		--["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[10857] =	--SkillBaseData\技能过程\30\鬼丸一斩帮派boss旋风斩出招\鬼丸一斩帮派boss旋风斩出招.tmpl
	{
		["ModifyECM"] = {{start_time = 0, end_time = 1200, newecm = "休闲动作1", seektime = 0, transtime = 100, anispeed = 100, },},
		--["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[10858] =	--SkillBaseData\技能过程\30\鬼丸一斩帮派boss旋风斩收招1\鬼丸一斩帮派boss旋风斩收招1.tmpl
	{
		["ModifyECM"] = {{start_time = 0, end_time = 750, newecm = "技能攻击1", seektime = 300, transtime = 100, anispeed = 100, },},
		["HMove"] = { {start_time = 0, end_time = -1, hacc = -10}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	------------------------------------------------
	--hint	副本怪用技能
	------------------------------------------------
	-------hint	初版梅庄怪用技能
	[5429] =  	--SkillBaseData\技能过程\22\死牢冤魂_普通攻击1_出招\死牢冤魂_普通攻击1_出招.tmpl
	{
		["ModifyECM"] = { {start_time = 0, newecm = "普通攻击1", seektime = 0, transtime = 100, anispeed = 100},},
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[5431] =  	--SkillBaseData\技能过程\22\死牢冤魂_格挡_出招1\死牢冤魂_格挡_出招1.tmpl
	{
		["ModifyECM"] = { {start_time = 0, newecm = "格挡", seektime = 0, transtime = 100, anispeed = 100},},
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[5432] =  	--SkillBaseData\技能过程\22\死牢冤魂_普攻攻击3_出招2\死牢冤魂_普攻攻击3_出招2.tmpl
	{
		["ModifyECM"] = { {start_time = 0, newecm = "普通攻击3", seektime = 0, transtime = 100, anispeed = 100},},
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[5434] =  	--SkillBaseData\技能过程\22\死牢冤魂_技能攻击1_出招\死牢冤魂_技能攻击1_出招.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, newecm = "休闲动作2", seektime = 0, transtime = 100, anispeed = 100},
		--{start_time = 2000, newecm = "技能攻击1", seektime = 0, transtime = 100, anispeed = 100},
		},
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[5435] =  	--SkillBaseData\技能过程\22\死牢冤魂_技能攻击1_收招1\死牢冤魂_技能攻击1_收招1.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, newecm = "技能攻击1", seektime = 0, transtime = 100, anispeed = 100},
		},
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[5438] =  	--SkillBaseData\技能过程\22\刑鬼_技能攻击1_出招\刑鬼_技能攻击1_出招.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, newecm = "技能攻击1", seektime = 0, transtime = 100, anispeed = 100},
		--{start_time = 1000, newecm = "", seektime = 0, transtime = 100, anispeed = 100},
		},
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[5440] =  	--SkillBaseData\技能过程\22\刑鬼_普通攻击3_出招\刑鬼_普通攻击3_出招.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, newecm = "普通攻击3", seektime = 0, transtime = 100, anispeed = 80},

		},
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[5442] =  	--SkillBaseData\技能过程\22\刑鬼_普通攻击1_出招\刑鬼_普通攻击1_出招.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, newecm = "普通攻击1", seektime = 0, transtime = 100, anispeed = 100},
		},
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[5448] =  	--SkillBaseData\技能过程\13\腐奴_普通攻击1_出招\腐奴_普通攻击1_出招.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, newecm = "普通攻击1", seektime = 0, transtime = 100, anispeed = 100},
		},
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[5450] =  	--SkillBaseData\技能过程\13\腐奴_普通攻击3_出招\腐奴_普通攻击3_出招.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, newecm = "普通攻击3", seektime = 0, transtime = 100, anispeed = 100},
		},
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[5452] =  	--SkillBaseData\技能过程\13\腐奴_战斗奔跑_出招\腐奴_战斗奔跑_出招.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, newecm = "战斗奔跑", seektime = 0, transtime = 100, anispeed = 200},
		},
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[5453] =  	--SkillBaseData\技能过程\13\腐奴_技能攻击2_出招\腐奴_技能攻击2_出招.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, newecm = "技能攻击2", seektime = 0, transtime = 100, anispeed = 100},
		},
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},

	[5455] =  	--SkillBaseData\技能过程\13\灯奴_技能攻击1_出招\灯奴_技能攻击1_出招.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, newecm = "技能攻击1", seektime = 0, transtime = 100, anispeed = 100},
		},
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[5461] =  	--灯奴持续喷火	SkillBaseData\技能过程\13\灯奴_技能攻击1持续_收招\灯奴_技能攻击1持续_收招.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, newecm = "技能攻击1持续", seektime = 0, transtime = 100, anispeed = 100},
		},
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[5456] =  	--SkillBaseData\技能过程\13\灯奴_技能攻击1_收招\灯奴_技能攻击1_收招.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, newecm = "技能攻击1", seektime = 1200, transtime = 100, anispeed = 100},
		},
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[5457] =  	--SkillBaseData\技能过程\24\山鬼_普通攻击1_出招\山鬼_普通攻击1_出招.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, newecm = "普通攻击1", seektime = 0, transtime = 100, anispeed = 100},
		},
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[5459] =  	--SkillBaseData\技能过程\24\山鬼_休闲动作1_出招\山鬼_休闲动作1_出招.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, newecm = "休闲动作1", seektime = 0, transtime = 100, anispeed = 100},
		},
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	-------hint	授谱评书本用技能
	[5823] =  	--SkillBaseData\技能过程\29\授谱初级费彬_横扫_收招\授谱初级费彬_横扫_收招.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 100, anispeed = 100},	},
		["HMove"] = { {start_time = 0, end_time = 100, hacc = 0}, },
		--["VMove"] = { {start_time = 300, end_time = 750, vg = -100, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[5824] =  	--SkillBaseData\技能过程\29\授谱初级费彬_前刺_出招\授谱初级费彬_前刺_出招.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 100, anispeed = 100},	},
		["HMove"] = { {start_time = 400, end_time = 550, hacc = 0}, },
		--["VMove"] = { {start_time = 300, end_time = 750, vg = -100, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[5832] =  	--SkillBaseData\技能过程\29\授谱初级费彬_三段连击_收招1\授谱初级费彬_三段连击_收招1.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 100, anispeed = 100},	},
		["HMove"] = { {start_time = 0, end_time = 100, hacc = 0}, },
		--["VMove"] = { {start_time = 300, end_time = 750, vg = -100, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[5838] =  	--SkillBaseData\技能过程\29\授谱中级费彬_嵩阳连击_收招1\授谱中级费彬_嵩阳连击_收招1.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 100, anispeed = 100},	},
		["HMove"] = { {start_time = 0, end_time = 100, hacc = 0}, },
		--["VMove"] = { {start_time = 300, end_time = 750, vg = -100, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[5881] =  	--SkillBaseData\技能过程\29\授谱初级陆柏_空翻剑光_出招\授谱初级陆柏_空翻剑光_出招.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 3000, transtime = 100, anispeed = 100},	},
		["HMove"] = { {start_time = 600, end_time = 1150, hacc = 0}, },
		--["VMove"] = { {start_time = 450, end_time = -1, vg = -30, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[5883] =  	--SkillBaseData\技能过程\29\授谱初级陆柏_空翻三击_出招\授谱初级陆柏_空翻三击_出招.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 3000, transtime = 100, anispeed = 100},	},
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = -30, init_speed = 0, speed_flag = SPEEDFLAG_FORCEDEFINE,}, },
	},
	[5884] =  	--SkillBaseData\技能过程\29\授谱初级陆柏_空翻三击_收招1\授谱初级陆柏_空翻三击_收招1.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 3000, transtime = 100, anispeed = 100},	},
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_FORCEDEFINE,}, },
	},
	[5893] =  	--SkillBaseData\技能过程\29\授谱初级丁勉_上踢_出招\授谱初级丁勉_上踢_出招.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 3000, transtime = 100, anispeed = 100},	},
		["HMove"] = { {start_time = 150, end_time = -100, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_FORCEDEFINE,}, },
	},
	[5904] =  	--SkillBaseData\技能过程\29\授谱中级丁勉_必杀连招_出招\授谱中级丁勉_必杀连招_出招.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 3000, transtime = 100, anispeed = 100},	},
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_FORCEDEFINE,}, },
	},
	[5905] =  	--SkillBaseData\技能过程\29\授谱中级丁勉_必杀连招_连环拳收招1\授谱中级丁勉_必杀连招_连环拳收招1.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 3000, transtime = 100, anispeed = 100},	},
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_FORCEDEFINE,}, },
	},
	[5907] =  	--SkillBaseData\技能过程\29\授谱中级丁勉_必杀连招_右拳收招3\授谱中级丁勉_必杀连招_右拳收招3.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 3000, transtime = 100, anispeed = 100},	},
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_FORCEDEFINE,}, },
	},
	[5916] =  	--SkillBaseData\技能过程\29\授谱高级左冷禅_前刺_收招1\授谱高级左冷禅_前刺_收招1.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 3000, transtime = 100, anispeed = 100},	},
		["HMove"] = { {start_time = -150, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_FORCEDEFINE,}, },
	},
	[5921] =  	--SkillBaseData\技能过程\29\授谱高级左冷禅_旋风腿_收招1\授谱高级左冷禅_旋风腿_收招1.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 3000, transtime = 100, anispeed = 100},	},
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[5922] =  	--SkillBaseData\技能过程\29\授谱高级左冷禅_旋风腿_收招2\授谱高级左冷禅_旋风腿_收招2.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 3000, transtime = 100, anispeed = 100},	},
		["HMove"] = { {start_time = 200, end_time = 900, hacc = 0}, },
		--["VMove"] = { {start_time = 200, end_time = 700, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[5923] =  	--SkillBaseData\技能过程\29\授谱高级左冷禅_旋风腿_收招3\授谱高级左冷禅_旋风腿_收招3.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 3000, transtime = 100, anispeed = 100},	},
		--["HMove"] = { {start_time = 200, end_time = 900, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[5942] =  	--SkillBaseData\技能过程\29\授谱中级陆柏_鹤翅百扫_收招5\授谱中级陆柏_鹤翅百扫_收招5.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 3000, transtime = 100, anispeed = 100},	},
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -100, init_speed = 0, speed_flag = SPEEDFLAG_FORCEDEFINE,}, },
	},
	[5943] =  	--SkillBaseData\技能过程\29\授谱中级陆柏_鹤翅百扫_收招6\授谱中级陆柏_鹤翅百扫_收招6.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 3000, transtime = 100, anispeed = 100},	},
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_FORCEDEFINE,}, },
	},
	[6104] =  	--SkillBaseData\技能过程\29\授谱中级丁勉_大气功波_后逃\授谱中级丁勉_大气功波_后逃.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 3000, transtime = 100, anispeed = 100},	},
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_FORCEDEFINE,}, },
	},
	[6026] =  	--SkillBaseData\技能过程\29\授谱中级陆柏_仙鹤连打_奔跑\授谱中级陆柏_仙鹤连打_奔跑.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 3000, transtime = 100, anispeed = 100},	},
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_FORCEDEFINE,}, },
	},
	-------hint	雨夜评书本用技能
	[6143] =  	--SkillBaseData\技能过程\29\雨夜灵火火_翻身刺_出招\雨夜灵火火_翻身刺_出招.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 3000, transtime = 100, anispeed = 100},	},
		["HMove"] = { {start_time = 550, end_time = 800, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_FORCEDEFINE,}, },
	},
	[6167] =  	--SkillBaseData\技能过程\29\中级雨夜焦雨借尸还魂_出招\中级雨夜焦雨借尸还魂_出招.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 3000, transtime = 100, anispeed = 100},	},
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_FORCEDEFINE,}, },
	},
	-------hint	活动绿竹巷用技能
	[6375] =  	--SkillBaseData\技能过程\29\绿竹巷美猴王_三连击_出招2\绿竹巷美猴王_三连击_出招2.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 500, transtime = 100, anispeed = 100},	},
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_FORCEDEFINE,}, },
	},
	[6377] =  	--SkillBaseData\技能过程\29\绿竹巷美猴王_三连击_出招3\绿竹巷美猴王_三连击_出招3.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 400, transtime = 100, anispeed = 100},	},
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_FORCEDEFINE,}, },
	},
	[6500] =  	--SkillBaseData\技能过程\29\绿竹巷牛魔王_冲刺_收招1\绿竹巷牛魔王_冲刺_收招1.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 400, transtime = 100, anispeed = 100},	},
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_FORCEDEFINE,}, },
	},
	[6501] =  	--SkillBaseData\技能过程\29\绿竹巷牛魔王_冲刺_收招2\绿竹巷牛魔王_冲刺_收招2.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 400, transtime = 100, anispeed = 100},	},
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_FORCEDEFINE,}, },
	},
	[6503] =  	--SkillBaseData\技能过程\29\绿竹巷牛魔王_蛮牛冲_收招1\绿竹巷牛魔王_蛮牛冲_收招1.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 400, transtime = 100, anispeed = 100},	},
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_FORCEDEFINE,}, },
	},
	[6504] =  	--SkillBaseData\技能过程\29\绿竹巷牛魔王_蛮牛冲_收招2\绿竹巷牛魔王_蛮牛冲_收招2.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 400, transtime = 100, anispeed = 100},	},
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_FORCEDEFINE,}, },
	},
	[6505] =  	--SkillBaseData\技能过程\29\绿竹巷牛魔王_蛮牛冲_收招3\绿竹巷牛魔王_蛮牛冲_收招3.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 400, transtime = 100, anispeed = 100},	},
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_FORCEDEFINE,}, },
	},
	[6514] =  	--SkillBaseData\技能过程\29\绿竹巷牛魔王_狂暴_收招\绿竹巷牛魔王_狂暴_收招.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 400, transtime = 100, anispeed = 100},	},
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_FORCEDEFINE,}, },
	},
	[6371] =  	--SkillBaseData\技能过程\29\绿竹巷美猴王_大跳劈_出招\绿竹巷美猴王_大跳劈_出招.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 100, anispeed = 100},	},
		["HMove"] = { {start_time = 300, end_time = 1700, hacc = 0}, },
		["VMove"] = { {start_time = 300, end_time = 1700, vg = -10, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	-------hint	活动绿竹巷技能V2
	[9025] =  	--SkillBaseData\技能过程\27\绿竹巷新版模式1功夫熊瞬退1_过程\绿竹巷新版模式1功夫熊瞬退1_过程.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 400, transtime = 100, anispeed = 100},	},
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = 450, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[9026] =  	--SkillBaseData\技能过程\27\绿竹巷新版模式1功夫熊瞬退2_过程\绿竹巷新版模式1功夫熊瞬退2_过程.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 400, transtime = 100, anispeed = 100},	},
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = 450, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[9027] =  	--SkillBaseData\技能过程\27\绿竹巷新版模式1功夫熊瞬退3_过程\绿竹巷新版模式1功夫熊瞬退3_过程.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 400, transtime = 100, anispeed = 100},	},
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = 450, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[9028] =  	--SkillBaseData\技能过程\27\绿竹巷新版模式1功夫熊转圈_出招\绿竹巷新版模式1功夫熊转圈_出招.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 400, transtime = 100, anispeed = 100},	},
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = 450, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[9032] =  	--SkillBaseData\技能过程\27\绿竹巷新版模式1剑客熊风车舞_收招1\绿竹巷新版模式1剑客熊风车舞_收招1.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 400, transtime = 100, anispeed = 100},	},
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = 450, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[9038] =  	--SkillBaseData\技能过程\27\绿竹巷新版模式1黑熊王钻地旋风_位移1\绿竹巷新版模式1黑熊王钻地旋风_位移1.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 400, transtime = 100, anispeed = 100},	},
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = 450, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[9039] =  	--SkillBaseData\技能过程\27\绿竹巷新版模式1黑熊王钻地旋风_位移2\绿竹巷新版模式1黑熊王钻地旋风_位移2.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 400, transtime = 100, anispeed = 100},	},
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = 450, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[9040] =  	--SkillBaseData\技能过程\27\绿竹巷新版模式1黑熊王钻地旋风_位移3\绿竹巷新版模式1黑熊王钻地旋风_位移3.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 400, transtime = 100, anispeed = 100},	},
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = 450, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[9041] =  	--SkillBaseData\技能过程\27\绿竹巷新版模式1黑熊王钻地旋风_位移4\绿竹巷新版模式1黑熊王钻地旋风_位移4.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 400, transtime = 100, anispeed = 100},	},
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = 450, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[9042] =  	--SkillBaseData\技能过程\27\绿竹巷新版模式1黑熊王钻地旋风_位移5\绿竹巷新版模式1黑熊王钻地旋风_位移5.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 400, transtime = 100, anispeed = 100},	},
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = 450, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[9043] =  	--SkillBaseData\技能过程\27\绿竹巷新版模式1黑熊王钻地旋风_位移6\绿竹巷新版模式1黑熊王钻地旋风_位移6.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 400, transtime = 100, anispeed = 100},	},
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = 450, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[9054] =  	--SkillBaseData\技能过程\27\绿竹巷新版模式1黑熊王震地_飞行\绿竹巷新版模式1黑熊王震地_飞行.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 400, transtime = 100, anispeed = 100},	},
		["HMove"] = { {start_time = 0, end_time = 400, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = 450, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[9057] =  	--SkillBaseData\技能过程\27\绿竹巷新版模式1黑熊王横扫_飞行\绿竹巷新版模式1黑熊王横扫_飞行.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 400, transtime = 100, anispeed = 100},	},
		["HMove"] = { {start_time = 0, end_time = 300, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = 450, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[9066] =  	--SkillBaseData\技能过程\27\绿竹巷新版模式3力士猴后退再前踢_后跳\绿竹巷新版模式3力士猴后退再前踢_后跳.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 400, transtime = 100, anispeed = 100},	},
		["HMove"] = { {start_time = 0, end_time = 500, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = 450, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[9067] =  	--SkillBaseData\技能过程\27\绿竹巷新版模式3力士猴后退再前踢_前冲\绿竹巷新版模式3力士猴后退再前踢_前冲.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 400, transtime = 100, anispeed = 100},	},
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = 450, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[9088] =  	--SkillBaseData\技能过程\27\绿竹巷新版模式3美猴王筋斗云_飞行\绿竹巷新版模式3美猴王筋斗云_飞行.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 400, transtime = 100, anispeed = 100},	},
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = 450, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},

	[9083] =  	--SkillBaseData\技能过程\27\绿竹巷新版模式3美猴王分身_过程\绿竹巷新版模式3美猴王分身_过程.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 400, transtime = 100, anispeed = 100},	},
		["HMove"] = { {start_time = 550, end_time = 950, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = -30, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	-------hint	青城评书本用技能
	[7850] =  	--SkillBaseData\技能过程\29\评书青城弟子B飞行_收招1\评书青城弟子B飞行_收招1.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 400, transtime = 100, anispeed = 100},	},
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[7851] =  	--SkillBaseData\技能过程\29\评书青城弟子B飞行_收招2\评书青城弟子B飞行_收招2.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 400, transtime = 100, anispeed = 100},	},
		["HMove"] = { {start_time = 0, end_time = 150, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = 150, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[7870] =  	--SkillBaseData\技能过程\29\评书青城侯人英轮舞_收招1\评书青城侯人英轮舞_收招1.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 400, transtime = 100, anispeed = 100},	},
		["HMove"] = { {start_time = 300, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = 350, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[7896] =  	--SkillBaseData\技能过程\29\评书青城侯人英御剑飞行_后跳\评书青城侯人英御剑飞行_后跳.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 400, transtime = 100, anispeed = 100},	},
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[7873] =  	--SkillBaseData\技能过程\29\评书青城侯人英御剑飞行_收招\评书青城侯人英御剑飞行_收招.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 400, transtime = 100, anispeed = 100},	},
		["HMove"] = { {start_time = 0, end_time = 450, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = 450, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[7866] =  	--SkillBaseData\技能过程\29\评书青城通用跳跃_空中循环\评书青城通用跳跃_空中循环.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 400, transtime = 100, anispeed = 100},	},
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -20, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[7885] =  	--SkillBaseData\技能过程\29\评书青城洪人雄风车_收招3\评书青城洪人雄风车_收招3.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 400, transtime = 100, anispeed = 100},	},
		["HMove"] = { {start_time = 0, end_time = 700, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = 700, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[7891] =  	--SkillBaseData\技能过程\29\评书青城罗人杰格挡突刺_前冲\评书青城罗人杰格挡突刺_前冲.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 400, transtime = 100, anispeed = 100},	},
		["HMove"] = { {start_time = 0, end_time = 550, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = 550, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[7990] =  	--SkillBaseData\技能过程\29\评书青城四秀逃跑_空中循环\评书青城四秀逃跑_空中循环.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 400, transtime = 100, anispeed = 100},	},
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -8, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[8026] =  	--SkillBaseData\技能过程\29\评书青城弟子跳跃靠近_空中循环\评书青城弟子跳跃靠近_空中循环.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 400, transtime = 100, anispeed = 100},	},
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -25, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[8029] =  	--SkillBaseData\技能过程\29\评书青城侯人英御剑飞行_出招2\评书青城侯人英御剑飞行_出招2.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 400, transtime = 100, anispeed = 100},	},
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[8030] =  	--SkillBaseData\技能过程\29\评书青城侯人英御剑飞行_收招2\评书青城侯人英御剑飞行_收招2.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 400, transtime = 100, anispeed = 100},	},
		["HMove"] = { {start_time = 0, end_time = 450, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = 450, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[8031] =  	--SkillBaseData\技能过程\29\评书青城侯人英御剑飞行_出招3\评书青城侯人英御剑飞行_出招3.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 400, transtime = 100, anispeed = 100},	},
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[8032] =  	--SkillBaseData\技能过程\29\评书青城侯人英御剑飞行_收招3\评书青城侯人英御剑飞行_收招3.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 400, transtime = 100, anispeed = 100},	},
		["HMove"] = { {start_time = 0, end_time = 450, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = 450, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[8077] =  	--SkillBaseData\技能过程\29\评书青城弟子B飞行_前置\评书青城弟子B飞行_前置.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 400, transtime = 100, anispeed = 100},	},
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = 450, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[8092] =  	--SkillBaseData\技能过程\29\评书青城二测黎人洪定位器飞行_收招\评书青城二测黎人洪定位器飞行_收招.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 400, transtime = 100, anispeed = 100},	},
		["HMove"] = { {start_time = 0, end_time = 150, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = 450, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[8093] =  	--SkillBaseData\技能过程\29\评书青城二测黎人洪定位器飞行2_收招\评书青城二测黎人洪定位器飞行2_收招.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 400, transtime = 100, anispeed = 100},	},
		["HMove"] = { {start_time = 0, end_time = 150, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = 450, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[8101] =  	--SkillBaseData\技能过程\29\评书青城二测吉人通突刺_收招\评书青城二测吉人通突刺_收招.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 400, transtime = 100, anispeed = 100},	},
		["HMove"] = { {start_time = 0, end_time = 150, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = 450, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[8102] =  	--SkillBaseData\技能过程\29\评书青城二测贾人达下劈_出招\评书青城二测贾人达下劈_出招.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 400, transtime = 100, anispeed = 100},	},
		["HMove"] = { {start_time = 2350, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 650, end_time = 3100, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[8105] =  	--SkillBaseData\技能过程\29\评书青城二测罗人杰必杀_前冲1\评书青城二测罗人杰必杀_前冲1.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 400, transtime = 100, anispeed = 100},	},
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = 450, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[8106] =  	--SkillBaseData\技能过程\29\评书青城二测罗人杰必杀_前冲2\评书青城二测罗人杰必杀_前冲2.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 400, transtime = 100, anispeed = 100},	},
		["HMove"] = { {start_time = 0, end_time = 450, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = 450, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[8111] =  	--SkillBaseData\技能过程\29\评书青城二测于人豪必杀_收招\评书青城二测于人豪必杀_收招.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 400, transtime = 100, anispeed = 100},	},
		["HMove"] = { {start_time = 0, end_time = 100, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = 450, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[8113] =  	--SkillBaseData\技能过程\29\评书青城二测洪人雄必杀_收招1\评书青城二测洪人雄必杀_收招1.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 400, transtime = 100, anispeed = 100},	},
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = 450, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[8114] =  	--SkillBaseData\技能过程\29\评书青城二测洪人雄必杀_收招2\评书青城二测洪人雄必杀_收招2.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 400, transtime = 100, anispeed = 100},	},
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = 450, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[8115] =  	--SkillBaseData\技能过程\29\评书青城二测洪人雄必杀_收招3\评书青城二测洪人雄必杀_收招3.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 400, transtime = 100, anispeed = 100},	},
		["HMove"] = { {start_time = 0, end_time = 400, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = 450, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[8125] =  	--SkillBaseData\技能过程\29\评书青城二测侯人英必杀_出招\评书青城二测侯人英必杀_出招.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 400, transtime = 100, anispeed = 100},	},
		["HMove"] = { {start_time = 0, end_time = 200, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = 450, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[8117] =  	--SkillBaseData\技能过程\29\评书青城二测侯人英必杀_飞行\评书青城二测侯人英必杀_飞行.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 400, transtime = 100, anispeed = 100},	},
		["HMove"] = { {start_time = 0, end_time = 350, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = 450, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[8118] =  	--SkillBaseData\技能过程\29\评书青城二测侯人英必杀_出招1\评书青城二测侯人英必杀_出招1.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 400, transtime = 100, anispeed = 100},	},
		["HMove"] = { {start_time = 350, end_time = 550, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = 450, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[8119] =  	--SkillBaseData\技能过程\29\评书青城二测侯人英必杀_飞行1\评书青城二测侯人英必杀_飞行1.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 400, transtime = 100, anispeed = 100},	},
		["HMove"] = { {start_time = 0, end_time = 350, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = 450, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[8120] =  	--SkillBaseData\技能过程\29\评书青城二测侯人英必杀_出招2\评书青城二测侯人英必杀_出招2.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 400, transtime = 100, anispeed = 100},	},
		["HMove"] = { {start_time = 350, end_time = 550, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = 450, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[8121] =  	--SkillBaseData\技能过程\29\评书青城二测侯人英必杀_飞行2\评书青城二测侯人英必杀_飞行2.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 400, transtime = 100, anispeed = 100},	},
		["HMove"] = { {start_time = 0, end_time = 350, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = 450, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[15999] =  	--SkillBaseData\技能过程\29\评书青城余沧海普攻1\评书青城余沧海普攻1.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 400, transtime = 100, anispeed = 100},	},
		["HMove"] = { {start_time = 0, end_time = 200, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = 450, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	-------hint	联手评书本用技能
	[7822] =   	--联手产品演示_通用跳跃
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -8, init_speed = 8, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[7898] =   	--联手产品演示_剧情峡谷突破_a江湖刺客技能	SkillBaseData\技能过程\29\联手产品演示_剧情峡谷突破_a江湖刺客技能1段1\联手产品演示_剧情峡谷突破_a江湖刺客技能1段1.tmpl
	{
		["HMove"] = { {start_time = 250, end_time = -1, hacc = 0}, },
	},
	[7899] =	--联手产品演示_剧情峡谷突破_a江湖刺客技能	SkillBaseData\技能过程\29\联手产品演示_剧情峡谷突破_a江湖刺客技能1段1\联手产品演示_剧情峡谷突破_a江湖刺客技能1段2.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, newecm = "技能攻击2", seektime = 400, transtime = 100, anispeed = 100},
		},
		["HMove"] = { {start_time = 250, end_time = -1, hacc = 0}, },
	},
	[7900] =	--联手产品演示_剧情峡谷突破_a江湖刺客技能	SkillBaseData\技能过程\29\联手产品演示_剧情峡谷突破_a江湖刺客技能1段2\联手产品演示_剧情峡谷突破_a江湖刺客技能1段3.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, newecm = "技能攻击2", seektime = 800, transtime = 100, anispeed = 100},
		},
		["HMove"] = { {start_time = 150, end_time = 400, hacc = 0}, },
	},
	[7901] =	--联手产品演示_剧情峡谷突破_a江湖刺客技能	SkillBaseData\技能过程\29\联手产品演示_剧情峡谷突破_a江湖刺客技能1段3\联手产品演示_剧情峡谷突破_a江湖刺客技能1段4.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, newecm = "技能攻击2", seektime = 1300, transtime = 100, anispeed = 100},
		},
		["HMove"] = { {start_time = 400, end_time = 850, hacc = 0}, },
	},
	[7906] =	--联手产品演示_剧情亭中御敌_1侯人雄技能过程1
	{
		["HMove"] = { {start_time = 550, end_time = -1, hacc = 0}, },
	},
	[7907] =	--联手产品演示_剧情亭中御敌_1侯人雄技能过程2
	{
		["HMove"] = { {start_time = 0, end_time = 200, hacc = 0}, },
	},
	[7909] =	--联手产品演示_剧情亭中御敌_1侯人雄技能过程4
	{
		["HMove"] = { {start_time = 0, end_time = 200, hacc = 0}, },
	},
	[7910] =	--联手产品演示_剧情亭中御敌_1青城弟子技能 第一段
	{
		["HMove"] = { {start_time = 450, end_time = -1, hacc = 0}, },
	},
	[7920] =	--联手产品演示_剧情亭中御敌_3铜锤黑衣人技能4
	{
		["HMove"] = { {start_time = 0, end_time = 150, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -12, init_speed = 0, speed_flag = SPEEDFLAG_FORCEDEFINE,}, },
	},
	[7922] =	--联手产品演示_剧情亭中御敌_4长枪黑衣人技能2
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCEDEFINE,}, },
	},
	[7923] =	--联手产品演示_剧情亭中御敌_4长枪黑衣人技能3
	{
		["HMove"] = { {start_time = 0, end_time = 400, hacc = 0}, },
	},
    [7927] =		--联手产品演示_剧情亭中御敌_5链锤大汉技能2
	{
        ["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCEDEFINE,}, },
	},
	[7929] =	--联手产品演示_剧情亭中御敌_5软鞭大汉技能2
	{
        ["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCEDEFINE,}, },
	},
	[7983] =	--联手产品演示_剧情亭中御敌_5软鞭大汉技能3
	{
		["VMove"] = { {start_time = 0, end_time = 400, vg = -20, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[7930] =	--联手产品演示_剧情亭中御敌_6天乙道人技能1
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -20, init_speed = 17.6, speed_flag = SPEEDFLAG_FORCEDEFINE,}, },
	},
	[7931] =	--联手产品演示_剧情亭中御敌_6天乙道人技能2
	{
		["VMove"] = { {start_time = 0, end_time = -1, vg = -5, init_speed = 5, speed_flag = SPEEDFLAG_FORCEDEFINE,}, },
	},
	[7932] =	--联手产品演示_剧情亭中御敌_6天乙道人技能3
	{
		["VMove"] = { {start_time = 0, end_time = -1, vg = -250, init_speed = 0, speed_flag = SPEEDFLAG_FORCEDEFINE,}, },
	},
	[7934] =	--联手产品演示_剧情亭中御敌_7泰山护门技能1
	{
		["HMove"] = { {start_time = 250, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 250, end_time = -1, vg = -40, init_speed = 15, speed_flag = SPEEDFLAG_FORCEDEFINE,}, },
	},
	[7935] =	--联手产品演示_剧情亭中御敌_7泰山护门技能2
	{
		["VMove"] = { {start_time = 0, end_time = -1, vg = -1, init_speed = 1, speed_flag = SPEEDFLAG_FORCEDEFINE,}, },
	},
	[7936] =	--联手产品演示_剧情亭中御敌_7泰山护门技能3
	{
		["VMove"] = { {start_time = 0, end_time = 200, vg = -1500, init_speed = 0, speed_flag = SPEEDFLAG_FORCEDEFINE,}, },
	},
	[7946] =	--联手产品演示_剧情峡谷突破_a江湖刺客技能2过程1
	{
		["HMove"] = { {start_time = 400, end_time = -1, hacc = 0}, },
	},
	[7950] =	--联手产品演示_剧情峡谷突破_a江湖黑手技能1过程1
	{
		["HMove"] = { {start_time = 500, end_time = -1, hacc = 0}, },
	},
	[7952] =	--联手产品演示_剧情峡谷突破_a江湖黑手技能1过程3
	{
		["HMove"] = { {start_time = 400, end_time = -1, hacc = 0}, },
	},
	[7953] =	--联手产品演示_剧情峡谷突破_a江湖黑手技能1过程4
	{
		["HMove"] = { {start_time = 400, end_time = -1, hacc = 0}, },
	},
	[7988] =	--联手产品演示_剧情亭中御敌_8衡山剑客技能3
	{
		["HMove"] = { {start_time = 0, end_time = 300, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = 300, vg = -10, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[7961] =	--联手产品演示_剧情亭中御敌_a江湖黑手技能5过程2
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -8, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[8018] =	--联手产品演示_剧情亭中御敌_a江湖黑手技能5_2
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -8, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[8019] =	--联手产品演示_剧情亭中御敌_a江湖黑手技能5_3
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -8, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[8020] =	--联手产品演示_剧情亭中御敌_a江湖黑手技能5_4
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -8, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[8021] =	--联手产品演示_剧情亭中御敌_a江湖黑手技能5_5
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -8, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[8022] =	--联手产品演示_剧情亭中御敌_a江湖黑手技能5_6
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -8, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[8023] =	--联手产品演示_剧情亭中御敌_a江湖黑手技能5_7
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -8, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[8024] =	--联手产品演示_剧情亭中御敌_a江湖黑手技能5_8
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -8, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[8080] =	--联手产品演示向问天跳跃_空中循环
	{
		["ModifyECM"] = {
		{start_time = 0, newecm = "翻跟头跳", seektime = 0, transtime = 100, anispeed = 100, },
		{start_time = 450, newecm = "空中循环", seektime = 0, transtime = 100, anispeed = 100, },
		},
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -20, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[8091] =	--联手产品演示_剧情亭中御敌_7泰山护门技能测试
	{
		["HMove"] = { {start_time = 250, end_time = 500, hacc = 0}, },
		["VMove"] = {
		               {start_time = 250, end_time = 500, vg = -40, init_speed = 15, speed_flag = SPEEDFLAG_FORCEDEFINE,},
		               {start_time = 500, end_time = 1000, vg = -1, init_speed = 1, speed_flag = SPEEDFLAG_FORCEDEFINE,},
                       {start_time = 1000, end_time = 1200, vg = -1000, init_speed = 0, speed_flag = SPEEDFLAG_FORCEDEFINE,},
			        },
	},
	-------hint	怪物行为丰富测试
	[8160] =  	   --通用_副本怪物行为表现02_小跳跃前进技能段1
	{
		["HMove"] = { {start_time = 250, end_time = 1050, hacc = 0}, },
	},
	[8161] =  	   --通用_副本怪物行为表现03_小跳跃后退技能段1
	{
		["HMove"] = { {start_time = 250, end_time = 1150, hacc = 0}, },
	},
	[8162] =  	   --通用_副本怪物行为表现04_小幅左空翻技能段1
	{
		["HMove"] = { {start_time = 150, end_time = 550, hacc = 0}, },
	},
	[8163] =  	   --通用_副本怪物行为表现05_小幅右空翻技能段1
	{
		["HMove"] = { {start_time = 150, end_time = 550, hacc = 0}, },
	},
	[8165] =  	   --通用_副本怪物行为表现07_索敌慢速左移技能段1
	{
		["HMove"] = { {start_time = 600, end_time = 1600, hacc = 0}, },
	},
	[8166] =  	   --通用_副本怪物行为表现08_索敌慢速右移技能段1
	{
		["HMove"] = { {start_time = 750, end_time = 1600, hacc = 0}, },
	},
	[8167] =  	   --通用_副本怪物行为表现09_索敌慢速前进技能段1
	{
		["HMove"] = { {start_time = 450, end_time = 1250, hacc = 0}, },
	},
	[8168] =  	   --通用_副本怪物行为表现10_索敌慢速后退技能段1
	{
		["HMove"] = { {start_time = 700, end_time = 1550, hacc = 0}, },
	},
	[8170] =  	   --通用_副本怪物行为表现12_索敌前滚闪避技能段1
	{
		["HMove"] = { {start_time = 50, end_time = 1200, hacc = 0}, },
	},
	[8171] =  	   --通用_副本怪物行为表现13_索敌后滚闪避技能段1
	{
		["HMove"] = { {start_time = 50, end_time = 1200, hacc = 0}, },
	},
	[8172] =  	   --通用_副本怪物行为表现14_索敌左滚闪避技能段1
	{
		["HMove"] = { {start_time = 0, end_time = 600, hacc = 0}, },
	},
	[8173] =  	   --通用_副本怪物行为表现15_索敌右滚闪避技能段1
	{
		["HMove"] = { {start_time = 0, end_time = 600, hacc = 0}, },
	},
	[8175] =  	   --通用_副本怪物行为表现17_连续空挥示威技能段1
	{
		["HMove"] = {
		              {start_time = 550, end_time = 675, hacc = 0},
					  {start_time = 875, end_time = 1000, hacc = 0},
					  {start_time = 1175, end_time = 1375, hacc = 0},
					},
	},
	-------hint	东厂评书本用技能
	[8240] =   		--东厂盗宝_射手后跃
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -10, init_speed = 6, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[8250] =   		--东厂盗宝_机关人震地
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -40, init_speed = 20, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[8253] =   		--东厂盗宝_机关人冲撞
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
	},
	[8279] =   		--东厂盗宝_提督太监幻影步
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
	},
	[8267] =   		--东厂_百户倒挂金钟_段2
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -100, init_speed = 100, speed_flag = SPEEDFLAG_FORCEDEFINE,}, },
	},
	-------hint	梅庄外围技能
	[10819] =  	--SkillBaseData\技能过程\29\水榭_黑白子_弃子_冲锋_技能伤害_过程\水榭_黑白子_弃子_冲锋_技能伤害_过程.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 400, transtime = 100, anispeed = 100},	},
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = 450, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[10878] =  	--SkillBaseData\技能过程\29\水榭_落棋洲令使_入场技能_起手_过程\水榭_落棋洲令使_入场技能_起手_过程.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -50, init_speed = 20, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[10879] =  	--SkillBaseData\技能过程\29\水榭_落棋洲令使_逃跑技能_起手_过程\水榭_落棋洲令使_逃跑技能_起手_过程.tmpl
	{
		["HMove"] = { {start_time = 250, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 250, end_time = -1, vg = -50, init_speed = 20, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[10883] =  	--SkillBaseData\技能过程\29\水榭_落棋洲十胜勇_入场技能_起手_过程\水榭_落棋洲十胜勇_入场技能_起手_过程.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = 500, vg = -30, init_speed = 20, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[10913] =  	--SkillBaseData\技能过程\29\水榭_战斗版面02_杂兵_突刺_伤害_显示\水榭_战斗版面02_杂兵_突刺_伤害_显示.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 400, transtime = 100, anispeed = 100},	},
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = 450, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[10916] =  	--SkillBaseData\技能过程\29\水榭_战斗版面02_令使入场_起手_过程\水榭_战斗版面02_令使入场_起手_过程.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -50, init_speed = 20, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[11115] =  	--SkillBaseData\技能过程\29\水榭_黑白子_落子_冲刺收招_过程\水榭_黑白子_落子_冲刺收招_过程.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 400, transtime = 100, anispeed = 100},	},
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = 450, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[11137] =  	--SkillBaseData\技能过程\29\水榭_丁坚（落雪仙）_一字电剑_突进伤害_过程\水榭_丁坚（落雪仙）_一字电剑_突进伤害_过程.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 400, transtime = 100, anispeed = 100},	},
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = 450, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[11139] =  	--SkillBaseData\技能过程\29\水榭_丁坚（落雪仙）_一字电剑_突进伤害_过程02\水榭_丁坚（落雪仙）_一字电剑_突进伤害_过程02.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 400, transtime = 100, anispeed = 100},	},
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = 450, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[11140] =  	--SkillBaseData\技能过程\29\水榭_丁坚（落雪仙）_一字电剑_突进伤害_过程03\水榭_丁坚（落雪仙）_一字电剑_突进伤害_过程03.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 400, transtime = 100, anispeed = 100},	},
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = 450, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[17820] =  	--SkillBaseData\技能过程\29\梅庄外围丁坚旋风舞前进\梅庄外围丁坚旋风舞前进.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
	},
	[17821] =  	--SkillBaseData\技能过程\29\梅庄外围丁坚旋风舞起手转向2\梅庄外围丁坚旋风舞起手转向2.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = 1, hacc = 0}, },
	},
	[17822] =  	--SkillBaseData\技能过程\29\梅庄外围丁坚旋风舞前进2\梅庄外围丁坚旋风舞前进2.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
	},
	[17823] =  	--SkillBaseData\技能过程\29\梅庄外围丁坚旋风舞起手转向3\梅庄外围丁坚旋风舞起手转向3.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = 1, hacc = 0}, },
	},
	[17824] =  	--SkillBaseData\技能过程\29\梅庄外围丁坚旋风舞前进3\梅庄外围丁坚旋风舞前进3.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
	},
	[17825] =  	--SkillBaseData\技能过程\29\梅庄外围丁坚旋风舞起手转向3\梅庄外围丁坚旋风舞起手转向4.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = 1, hacc = 0}, },
	},
	[17826] =  	--SkillBaseData\技能过程\29\梅庄外围丁坚旋风舞前进3\梅庄外围丁坚旋风舞前进4.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
	},
	-------hint	魔教评书本用技能
	[8977] =  	--SkillBaseData\技能过程\29\魔教夺宝_魔教长老_瞬步段数1\魔教夺宝_魔教长老_瞬步段数1.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 400, transtime = 100, anispeed = 100},	},
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = 450, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[8212] =  	--魔教夺宝_魔教坛主_刺地攻击段数4
	{
		["HMove"] = { {start_time = 0, end_time = 225, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = 225, vg = -150, init_speed = 15, speed_flag = SPEEDFLAG_FORCEDEFINE,}, },
	},
	[9108] =  	--SkillBaseData\技能过程\29\魔教夺宝_魔教坛主_吸取能量正向移动\魔教夺宝_魔教坛主_吸取能量正向移动.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 400, transtime = 100, anispeed = 100},	},
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = 450, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[9109] =  	--SkillBaseData\技能过程\29\魔教夺宝_魔教坛主_吸取能量反向移动\魔教夺宝_魔教坛主_吸取能量反向移动.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 400, transtime = 100, anispeed = 100},	},
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = 450, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[9111] =  	--SkillBaseData\技能过程\29\副本_魔教夺宝_坛主_冲剑_过程02_冲刺伤害\副本_魔教夺宝_坛主_冲剑_过程02_冲刺伤害.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 400, transtime = 100, anispeed = 100},	},
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = 450, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[19592] =  	--SkillBaseData\技能过程\29\副本_魔教夺宝_坛主_冲剑_过程02_冲刺伤害\副本_魔教夺宝_坛主_冲剑_过程02_冲刺伤害.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 400, transtime = 100, anispeed = 100},	},
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = 450, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[19580] =  	--SkillBaseData\技能过程\29\副本_魔教夺宝_坛主_冲剑_过程02_冲刺伤害\副本_魔教夺宝_坛主_冲剑_过程02_冲刺伤害.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 400, transtime = 100, anispeed = 100},	},
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = 450, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[9274] =  	--SkillBaseData\技能过程\29\魔教夺宝_魔教坛主_跳跃段数2\魔教夺宝_魔教坛主_跳跃段数2.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 400, transtime = 100, anispeed = 100},	},
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -30, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[19324] =  	--SkillBaseData\技能过程\29\魔教夺宝_魔教坛主_跳跃段数2\魔教夺宝_魔教坛主_跳跃段数2.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 400, transtime = 100, anispeed = 100},	},
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -30, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	-------hint	青城深渊评书本用
	[9159] =  	   --青城深渊_木高峰一阶_落雷空中
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -20, init_speed = 0, speed_flag = SPEEDFLAG_FORCEDEFINE,}, },
	},
	[9171] =  	   --青城深渊_木高峰二阶_连刺空中
	{
		["HMove"] = { {start_time = 0, end_time = 475, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = 475, vg = -10, init_speed = 0, speed_flag = SPEEDFLAG_FORCEDEFINE,}, },
	},
	[9202] =  	   --青城深渊_林平之_剑雨消失
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -30, init_speed = 0, speed_flag = SPEEDFLAG_FORCEDEFINE,}, },
	},
	-------hint	20级镖局血案副本
	[9627] =   	--SkillBaseData\技能过程\29\镖局血案_持棍镖头技能旋风斩_收招1\镖局血案_持棍镖头技能旋风斩_收招1.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 10}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_FORCEDEFINE,}, },
	},
	[9628] =   	--SkillBaseData\技能过程\29\镖局血案_持棍镖头技能旋风斩_收招1\镖局血案_持棍镖头技能旋风斩_收招2.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_FORCEDEFINE,}, },
	},
	[9629] =   	--SkillBaseData\技能过程\29\镖局血案_持棍镖头技能旋风斩_收招1\镖局血案_持棍镖头技能旋风斩_收招3.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_FORCEDEFINE,}, },
	},
	[9630] =   	--SkillBaseData\技能过程\29\镖局血案_持棍镖头技能旋风斩_收招1\镖局血案_持棍镖头技能旋风斩_收招4.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = -10}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_FORCEDEFINE,}, },
	},
	[9648] =   	--SkillBaseData\技能过程\29\镖局血案_假面刺客技能四连打_出招\镖局血案_假面刺客技能四连打_出招.tmpl
	{
		["HMove"] = { {start_time = -200, end_time = -1, hacc = -20}, },
		["VMove"] = { {start_time = -200, end_time = -1, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_FORCEDEFINE,}, },
	},
	[9651] =   	--SkillBaseData\技能过程\29\镖局血案_假面刺客技能四连打_收招3\镖局血案_假面刺客技能四连打_收招3.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = 150, hacc = -10}, },
		["VMove"] = { {start_time = 0, end_time = 150, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_FORCEDEFINE,}, },
	},
	[9662] =   	--SkillBaseData\技能过程\29\镖局血案_蒙面杀手技能冲刺_出招\镖局血案_蒙面杀手技能冲刺_出招.tmpl
	{
		["HMove"] = { {start_time = 500, end_time = -1, init_speed = 10, hacc = 0}, },
		["VMove"] = { {start_time = 500, end_time = -1, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_FORCEDEFINE,}, },
	},
	[9668] =   	--SkillBaseData\技能过程\29\镖局血案_蒙面杀手技能连砍_收招1\镖局血案_蒙面杀手技能连砍_收招1.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = -100, hacc = -10}, },
		["VMove"] = { {start_time = 0, end_time = -100, vg = 9.8, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[9675] =   	--SkillBaseData\技能过程\29\镖局血案_青面暴僧技能冲锋三连_收招1\镖局血案_青面暴僧技能冲锋三连_收招1.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = -100, hacc = -20}, },
		["VMove"] = { {start_time = 0, end_time = -100, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_FORCEDEFINE,}, },
	},
	[9683] =   	--SkillBaseData\技能过程\29\镖局血案_青面暴僧技能冲锋三连_收招2\镖局血案_青面暴僧技能冲锋三连_收招2.tmpl
	{
		["ModifyECM"] = { {start_time = 0, newecm = "普通攻击2", seektime = 200, transtime = 100, anispeed = 100, },},
	},
	[9685] =   	--SkillBaseData\技能过程\29\镖局血案_青面暴僧技能冲锋三连_收招4\镖局血案_青面暴僧技能冲锋三连_收招4.tmpl
	{
		["ModifyECM"] = { {start_time = 0, newecm = "普通攻击1", seektime = 300, transtime = 100, anispeed = 100, },},
	},
	-------hint	10级郊外酒肆副本
	[10352] =   	--SkillBaseData\技能过程\27\酒肆余人彦风车_旋转0度\酒肆余人彦风车_旋转0度.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
	},
	[10353] =   	--SkillBaseData\技能过程\27\酒肆余人彦风车_旋转60度\酒肆余人彦风车_旋转60度.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
	},
	[10354] =   	--SkillBaseData\技能过程\27\酒肆余人彦风车_旋转320度\酒肆余人彦风车_旋转320度.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
	},
	[10355] =   	--SkillBaseData\技能过程\27\酒肆余人彦风车_旋转循环\酒肆余人彦风车_旋转循环.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
	},
	[10366] =   	--SkillBaseData\技能过程\27\酒肆弟子普通攻击2_前置\酒肆弟子普通攻击2_前置.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
	},
	[10364] =   	--SkillBaseData\技能过程\27\酒肆余人彦翻跟头跳_起跳\酒肆余人彦翻跟头跳_起跳.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -30, init_speed = 0, speed_flag = SPEEDFLAG_FORCEDEFINE,}, },
	},
	-------hint	百毒禁地技能配置
	[10654] =   	--SkillBaseData\技能过程\26\百毒禁地小飞蛾减速刺收招1\百毒禁地小飞蛾减速刺收招1.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = 150, hacc = -20}, },
		["VMove"] = { {start_time = 0, end_time = 150, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_FORCEDEFINE,}, },
	},
	[10655] =   	--SkillBaseData\技能过程\26\百毒禁地精英飞蛾冲锋直刺出招\百毒禁地精英飞蛾冲锋直刺出招.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, end_time = -1, newecm = "技能攻击1", seektime = 300, transtime = 100, anispeed = 100, },
		},
		["HMove"] = { {start_time = 0, end_time = -1, hacc = -20}, },
		["VMove"] = { {start_time = 0, end_time = -100, vg = -9.8, init_speed = 10, speed_flag = SPEEDFLAG_FORCEDEFINE,},
				{start_time = -100, end_time = -1, vg = 0, init_speed = -100, speed_flag = SPEEDFLAG_FORCEDEFINE,},},
	},
	[10656] =   	--SkillBaseData\技能过程\26\百毒禁地精英飞蛾冲锋直刺收招1\百毒禁地精英飞蛾冲锋直刺收招1.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, end_time = -1, newecm = "空中急出生", seektime = 1000, transtime = 100, anispeed = 200, },
		},
		["HMove"] = { {start_time = 0, end_time = 350, hacc = -20}, },
		["VMove"] = { {start_time = 0, end_time = 350, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_FORCEDEFINE,}, },
	},
	[10661] =   	--SkillBaseData\技能过程\26\百毒禁地近战蜘蛛快速冲锋出招\百毒禁地近战蜘蛛快速冲锋出招.tmpl
	{
		["HMove"] = { {start_time = 100, end_time = 400, hacc = -10}, },
		["VMove"] = { {start_time = 100, end_time = 400, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_FORCEDEFINE,}, },
	},
	[10662] =   	--SkillBaseData\技能过程\26\百毒禁地近战蜘蛛快速冲锋收招1\百毒禁地近战蜘蛛快速冲锋收招1.tmpl
	{
		["HMove"] = { {start_time = 100, end_time = 400, hacc = -10}, },
		["VMove"] = { {start_time = 100, end_time = 400, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_FORCEDEFINE,}, },
	},
	[10665] =   	--SkillBaseData\技能过程\26\百毒禁地远程蜘蛛原地蛛网出招\百毒禁地远程蜘蛛原地蛛网出招.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = -10}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = 0, init_speed = 3, speed_flag = SPEEDFLAG_FORCEDEFINE,}, },
	},
	[10666] =   	--SkillBaseData\技能过程\26\百毒禁地远程蜘蛛原地蛛网收招1\百毒禁地远程蜘蛛原地蛛网收招1.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, end_time = 1000, newecm = "垂直落网", seektime = 500, transtime = 100, anispeed = 250, },
		},
		["HMove"] = { {start_time = 0, end_time = 50, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -19.8, init_speed = -20, speed_flag = SPEEDFLAG_FORCEDEFINE,},},
	},
	[10667] =   	--SkillBaseData\技能过程\26\百毒禁地精英蜘蛛全体拉回出招\百毒禁地精英蜘蛛全体拉回出招.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, end_time = 1000, newecm = "拉回蛛网", seektime = 700, transtime = 100, anispeed = 100, },
		},
		--["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_FORCEDEFINE,},},
	},
	[10669] =   	--SkillBaseData\技能过程\26\百毒禁地精英蜘蛛原地蛛网出招\百毒禁地精英蜘蛛原地蛛网出招.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, end_time = 500, newecm = "拉回蛛网", seektime = 0, transtime = 100, anispeed = 150, },
		},
		--["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_FORCEDEFINE,},},
	},
	[10670] =   	--SkillBaseData\技能过程\26\百毒禁地精英蜘蛛原地蛛网收招1\百毒禁地精英蜘蛛原地蛛网收招1.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, end_time = 1000, newecm = "拉回蛛网", seektime = 700, transtime = 100, anispeed = 100, },
		},
		--["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_FORCEDEFINE,},},
	},
	[10672] =   	--SkillBaseData\技能过程\26\百毒禁地飞蛾BOSS周围击退收招1\百毒禁地飞蛾BOSS周围击退收招1.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = 500, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = 500, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_FORCEDEFINE,},},
	},
	[10677] =   	--SkillBaseData\技能过程\26\百毒禁地飞蛾BOSS中央归位出招\百毒禁地飞蛾BOSS中央归位出招.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, end_time = 2000, newecm = "破茧而出出生", seektime = 1500, transtime = 100, anispeed = 62, },
		},
		["HMove"] = { {start_time = 750, end_time = 1500, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_FORCEDEFINE,},},
	},
	[10679] =   	--SkillBaseData\技能过程\26\百毒禁地飞蛾BOSS全场群攻出招\百毒禁地飞蛾BOSS全场群攻出招.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, end_time = 10000, newecm = "破茧而出出生", seektime = 3500, transtime = 100, anispeed = 25, },
		},
		--["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_FORCEDEFINE,},},
	},
	[10687] =   	--SkillBaseData\技能过程\26\百毒禁地蜘蛛BOSS前冲出招\百毒禁地蜘蛛BOSS前冲出招.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, end_time = -1, newecm = "前冲", seektime = 0, transtime = 100, anispeed = 100, },
		},
		--["HMove"] = { {start_time = 0, end_time = -1, hacc = -20}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_FORCEDEFINE,}, },
	},
	[10688] =   	--SkillBaseData\技能过程\26\百毒禁地蜘蛛BOSS前冲收招1\百毒禁地蜘蛛BOSS前冲收招1.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, end_time = -1, newecm = "行走", seektime = 0, transtime = 200, anispeed = 110, },
		},
		["HMove"] = { {start_time = 0, end_time = 250, hacc = -20}, },
		["VMove"] = { {start_time = 0, end_time = 250, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_FORCEDEFINE,}, },
	},
	[10689] =   	--SkillBaseData\技能过程\26\百毒禁地蜘蛛BOSS周围击退出招\百毒禁地蜘蛛BOSS周围击退出招.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, end_time = -1, newecm = "周围击退", seektime = 0, transtime = 100, anispeed = 100, },
		},
		["HMove"] = { {start_time = 1200, end_time = -1, hacc = -5}, },
		["VMove"] = { {start_time = 1200, end_time = -1, vg = 0, init_speed = 6, speed_flag = SPEEDFLAG_FORCEDEFINE,}, },
	},
	[10690] =   	--SkillBaseData\技能过程\26\百毒禁地蜘蛛BOSS周围击退收招1\百毒禁地蜘蛛BOSS周围击退收招1.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = 1000, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = 1000, vg = -19.8, init_speed = -50, speed_flag = SPEEDFLAG_FORCEDEFINE,}, },
	},
	[10691] =   	--SkillBaseData\技能过程\26\百毒禁地蜘蛛BOS召唤蛛网出招\百毒禁地蜘蛛BOS召唤蛛网出招.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, end_time = -1, newecm = "隐藏蛛网", seektime = 0, transtime = 100, anispeed = 50, },
		},
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_FORCEDEFINE,}, },
	},
	[10692] =   	--SkillBaseData\技能过程\26\百毒禁地蜘蛛BOS召唤蛛网收招1\百毒禁地蜘蛛BOS召唤蛛网收招1.tmpl
	{
		["HMove"] = { {start_time = 600, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 600, end_time = -1, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_FORCEDEFINE,}, },
	},
	[10695] =   	--SkillBaseData\技能过程\26\百毒禁地蜘蛛BOS飞回出招\百毒禁地蜘蛛BOS飞回出招.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, end_time = 600, newecm = "前冲", seektime = 1750, transtime = 100, anispeed = 100, },
		},
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -100, init_speed = 60, speed_flag = SPEEDFLAG_FORCEDEFINE,}, },
	},
	[10696] =   	--SkillBaseData\技能过程\26\百毒禁地蜘蛛BOS飞回收招1\百毒禁地蜘蛛BOS飞回收招1.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, end_time = 900, newecm = "前冲", seektime = 4000, transtime = 100, anispeed = 100, },
		},
		["HMove"] = { {start_time = 0, end_time = 100, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = 500, vg = -100, init_speed = -50, speed_flag = SPEEDFLAG_FORCEDEFINE,}, },
	},
	[10703] =   	--SkillBaseData\技能过程\26\百毒禁地蜈蚣精英长距吐火出招\百毒禁地蜈蚣精英长距吐火出招.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, end_time = 1100, newecm = "技能攻击4", seektime = 0, transtime = 100, anispeed = 100, },
		},
		--["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_FORCEDEFINE,}, },
	},	[10704] =   	--SkillBaseData\技能过程\26\百毒禁地蜈蚣精英长距吐火出招\百毒禁地蜈蚣精英长距吐火出招.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, end_time = 900, newecm = "技能攻击4", seektime = 1100, transtime = 100, anispeed = 100, },
		{start_time = 901, end_time = 1800, newecm = "技能攻击4", seektime = 1100, transtime = 100, anispeed = 100, },
		{start_time = 1801, end_time = 2700, newecm = "技能攻击4", seektime = 1100, transtime = 100, anispeed = 100, },
		{start_time = 2701, end_time = 3600, newecm = "技能攻击4", seektime = 1100, transtime = 100, anispeed = 100, },
		{start_time = 3601, end_time = 4500, newecm = "技能攻击4", seektime = 1100, transtime = 100, anispeed = 100, },
		{start_time = 4501, end_time = 5400, newecm = "技能攻击4", seektime = 1100, transtime = 100, anispeed = 100, },
		{start_time = 5401, end_time = 6700, newecm = "技能攻击4", seektime = 1100, transtime = 100, anispeed = 100, },
		},
		--["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_FORCEDEFINE,}, },
	},
	[10722] =   	--SkillBaseData\技能过程\26\百毒禁地蜈蚣BOSS下钻入地下收招1\百毒禁地蜈蚣BOSS下钻入地下收招1.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = 100, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_FORCEDEFINE,}, },
	},
	[10724] =   	--SkillBaseData\技能过程\26\百毒禁地蜈蚣BOSS下钻出地面收招1\百毒禁地蜈蚣BOSS下钻出地面收招1.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = 200, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_FORCEDEFINE,}, },
	},
	[10824] =   	--SkillBaseData\技能过程\26\百毒禁地新蜈蚣光球透明怪开战后退自爆出招\百毒禁地新蜈蚣光球透明怪开战后退自爆出招.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, end_time = -1, newecm = "爆炸", seektime = 0, transtime = 100, anispeed = 100, },
		},
		["HMove"] = { {start_time = 0, end_time = 500, hacc = -20}, },
		["VMove"] = { {start_time = 0, end_time = 500, vg = -9.8, init_speed = 5, speed_flag = SPEEDFLAG_FORCEDEFINE,}, },
	},
	--所有终点BOSS，动作都不理想，但先都暂时忍了，只在确认了动作周期后，统一频率

	-------hint	海中孤岛技能配置
	[10575] =   	--SkillBaseData\技能过程\27\孤岛副本丁勉拳打_出招\孤岛副本丁勉拳打_出招.tmpl
	{
		["HMove"] = { {start_time = 350, end_time = -1, hacc = 0}, },
	},
	[10577] =   	--SkillBaseData\技能过程\27\孤岛副本丁勉脚踢_出招\孤岛副本丁勉脚踢_出招.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = -100, hacc = 0}, },
	},
	[10580] =   	--SkillBaseData\技能过程\27\孤岛副本丁勉升龙拳_收招1\孤岛副本丁勉升龙拳_收招1.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
	},
	[10581] =   	--SkillBaseData\技能过程\27\孤岛副本丁勉升龙拳_收招2\孤岛副本丁勉升龙拳_收招2.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = 350, hacc = 0}, },
	},
	[10771] =   	--SkillBaseData\技能过程\27\孤岛副本丁勉绝杀大招_追击\孤岛副本丁勉绝杀大招_追击.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = -100, end_time = -1, vg = -8, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[10772] =   	--SkillBaseData\技能过程\27\孤岛副本丁勉绝杀大招_连打起手A\孤岛副本丁勉绝杀大招_连打起手A.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
	},
	[10773] =   	--SkillBaseData\技能过程\27\孤岛副本丁勉绝杀大招_连打A1\孤岛副本丁勉绝杀大招_连打A1.tmpl
	{
		["HMove"] = { {start_time = 150, end_time = -1, hacc = 0}, },
	},
	[10778] =   	--SkillBaseData\技能过程\27\孤岛副本丁勉绝杀大招_连打起手C\孤岛副本丁勉绝杀大招_连打起手C.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = 200, hacc = 0}, },
	},
	[10779] =   	--SkillBaseData\技能过程\27\孤岛副本丁勉绝杀大招_连打C1\孤岛副本丁勉绝杀大招_连打C1.tmpl
	{
		["HMove"] = { {start_time = 250, end_time = 400, hacc = 0}, },
	},
	[15202] =   	--SkillBaseData\技能过程\27\孤岛副本丁勉绝杀大招_连打C1\孤岛副本丁勉绝杀大招_连打C1.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
	},
	-------hint	叛军前哨技能配置
	[13017] =   	--SkillBaseData\技能过程\27\叛军前哨明军步兵枪刺_出招\叛军前哨明军步兵枪刺_出招.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = 150, hacc = 0}, },
	},
	[13024] =   	--SkillBaseData\技能过程\27\叛军前哨队长挥盾_收招\叛军前哨队长挥盾_收招.tmpl
	{
		["HMove"] = { {start_time = 150, end_time = 300, hacc = 0}, },
	},
	[13042] =   	--SkillBaseData\技能过程\27\叛军前哨王喜跳跃斩_出招\叛军前哨王喜跳跃斩_出招.tmpl
	{
		["HMove"] = { {start_time = 1450, end_time = 2200, hacc = 0}, },
		["VMove"] = { {start_time = 1450, end_time = 2200, vg = -30, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[13044] =   	--SkillBaseData\技能过程\27\叛军前哨王喜定位器跳跃\叛军前哨王喜定位器跳跃.tmpl
	{
		["HMove"] = { {start_time = 400, end_time = 750, hacc = 0}, },
		["VMove"] = { {start_time = 400, end_time = 750, vg = -60, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[13051] =   	--SkillBaseData\技能过程\27\叛军前哨贾儒飞行轰炸_起飞\叛军前哨贾儒飞行轰炸_起飞.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -20, init_speed = 0, speed_flag = SPEEDFLAG_FORCEDEFINE,}, },
	},
	[13052] =   	--SkillBaseData\技能过程\27\叛军前哨贾儒飞行轰炸_飞行1\叛军前哨贾儒飞行轰炸_飞行1.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_FORCEDEFINE,}, },
	},
	[13053] =   	--SkillBaseData\技能过程\27\叛军前哨贾儒飞行轰炸_飞行2\叛军前哨贾儒飞行轰炸_飞行2.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_FORCEDEFINE,}, },
	},
	[13054] =   	--SkillBaseData\技能过程\27\叛军前哨贾儒飞行轰炸_飞行3\叛军前哨贾儒飞行轰炸_飞行3.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_FORCEDEFINE,}, },
	},
	[13055] =   	--SkillBaseData\技能过程\27\叛军前哨贾儒飞行轰炸_飞行4\叛军前哨贾儒飞行轰炸_飞行4.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_FORCEDEFINE,}, },
	},
	[13056] =   	--SkillBaseData\技能过程\27\叛军前哨贾儒飞行轰炸_飞行5\叛军前哨贾儒飞行轰炸_飞行5.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_FORCEDEFINE,}, },
	},
	[13057] =   	--SkillBaseData\技能过程\27\叛军前哨贾儒飞行轰炸_落地\叛军前哨贾儒飞行轰炸_落地.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[13059] =   	--SkillBaseData\技能过程\27\叛军前哨友方令狐冲跳跃_空中循环\叛军前哨友方令狐冲跳跃_空中循环.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -30, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[13061] =   	--SkillBaseData\技能过程\27\叛军前哨友方令狐冲冲剑_出招\叛军前哨友方令狐冲冲剑_出招.tmpl
	{
		["HMove"] = { {start_time = 350, end_time = -1, hacc = 0}, },
	},
	[13064] =   	--SkillBaseData\技能过程\27\叛军前哨步兵阵法枪刺_出招\叛军前哨步兵阵法枪刺_出招.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = 150, hacc = 0}, },
	},
	-------hint	叛军本营技能配置
	[14049] =   	--SkillBaseData\技能过程\27\叛军本营骑兵阵法冲锋_循环\叛军本营骑兵阵法冲锋_循环.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
	},
	[14080] =   	--SkillBaseData\技能过程\27\叛军本营BOSS万户骑马冲锋_循环\叛军本营BOSS万户骑马冲锋_循环.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
	},
	[14063] =   	--SkillBaseData\技能过程\27\叛军本营BOSS总兵翻跟头跳_翻跟头\叛军本营BOSS总兵翻跟头跳_翻跟头.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -30, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[14072] =   	--SkillBaseData\技能过程\27\叛军本营BOSS万户步行跳跃\叛军本营BOSS万户步行跳跃.tmpl
	{
		["HMove"] = { {start_time = 250, end_time = 650, hacc = 0}, },
		["VMove"] = { {start_time = 250, end_time = 650, vg = -30, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	-------hint	云上山崖技能配置
	[15377] =   	--SkillBaseData\技能过程\27\山崖副本梭镖手跳出定位器_出招\山崖副本梭镖手跳出定位器_出招.tmpl
	{
		["HMove"] = { {start_time = 500, end_time = 1050, hacc = 0}, },
		["VMove"] = { {start_time = 500, end_time = 1050, vg = -30, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[15379] =   	--SkillBaseData\技能过程\27\山崖副本梭镖手跳回定位器_出招\山崖副本梭镖手跳回定位器_出招.tmpl
	{
		["HMove"] = { {start_time = 500, end_time = 1050, hacc = 0}, },
		["VMove"] = { {start_time = 500, end_time = 1050, vg = -30, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[15386] =   	--SkillBaseData\技能过程\27\山崖副本女徒滑行攻击1_滑行\山崖副本女徒滑行攻击1_滑行.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
	},
	[15389] =   	--SkillBaseData\技能过程\27\山崖副本女徒滑行攻击2_收招\山崖副本女徒滑行攻击2_收招.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = 400, hacc = 0}, },
	},
	[15424] =   	--SkillBaseData\技能过程\27\山崖副本玉面飞狐滑行攻击1_滑行\山崖副本玉面飞狐滑行攻击1_滑行.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
	},
	[15427] =   	--SkillBaseData\技能过程\27\山崖副本玉面飞狐滑行攻击2_收招\山崖副本玉面飞狐滑行攻击2_收招.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = 500, hacc = 0}, },
	},
	[15433] =   	--SkillBaseData\技能过程\27\山崖副本恶头陀跳入技能过程段\山崖副本恶头陀跳入技能过程段.tmpl
	{
		["HMove"] = { {start_time = 500, end_time = 850, hacc = 0}, },
		["VMove"] = { {start_time = 500, end_time = 850, vg = -20, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[15428] =   	--SkillBaseData\技能过程\27\山崖副本玉面飞狐技能攻击2全屏减速_出招\山崖副本玉面飞狐技能攻击2全屏减速_出招.tmpl
	{
		["HMove"] = { {start_time = 300, end_time = 800, hacc = 0}, },
		["VMove"] = { {start_time = 300, end_time = 800, vg = -20, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	-------hint	连云孤堡技能配置
	[15239] =   	--SkillBaseData\技能过程\29\连云堡射手_后跳射击_跳起\连云堡射手_后跳射击_跳起.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
	},
	[15240] =   	--SkillBaseData\技能过程\29\连云堡射手_后跳射击_射箭\连云堡射手_后跳射击_射箭.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
	},
	[15243] =   	--SkillBaseData\技能过程\29\连云堡刀客_跳斩_空中\连云堡刀客_跳斩_空中.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
	},
	[15254] =   	--SkillBaseData\技能过程\29\连云堡大刀_跳劈_空中\连云堡大刀_跳劈_空中.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
	},
	[15259] =   	--SkillBaseData\技能过程\29\连云堡大刀_旋风_旋转1\连云堡大刀_旋风_旋转1.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
	},
	[15260] =   	--SkillBaseData\技能过程\29\连云堡大刀_旋风_旋转2\连云堡大刀_旋风_旋转2.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
	},
	[15261] =   	--SkillBaseData\技能过程\29\连云堡大刀_旋风_旋转3\连云堡大刀_旋风_旋转3.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
	},
	[15262] =   	--SkillBaseData\技能过程\29\连云堡大刀_旋风_旋转4\连云堡大刀_旋风_旋转4.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
	},
	[15263] =   	--SkillBaseData\技能过程\29\连云堡大刀_旋风_旋转5\连云堡大刀_旋风_旋转5.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
	},
	[15264] =   	--SkillBaseData\技能过程\29\连云堡大刀_旋风_旋转6\连云堡大刀_旋风_旋转6.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
	},
	[15265] =   	--SkillBaseData\技能过程\29\连云堡大刀_旋风_旋转7\连云堡大刀_旋风_旋转7.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
	},
	[15266] =   	--SkillBaseData\技能过程\29\连云堡大刀_旋风_旋转8\连云堡大刀_旋风_旋转8.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
	},
	[16014] =   	--SkillBaseData\技能过程\29\连云堡拳师_空翻一_空\连云堡拳师_空翻一_空.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
	},
	[16017] =   	--SkillBaseData\技能过程\29\连云堡拳师_空翻二_空\连云堡拳师_空翻二_空.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
	},
	[15283] =   	--SkillBaseData\技能过程\29\连云堡醉刀_醉步_移动1\连云堡醉刀_醉步_移动1.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
	},
	[15284] =   	--SkillBaseData\技能过程\29\连云堡醉刀_醉步_移动2\连云堡醉刀_醉步_移动2.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
	},
	[15285] =   	--SkillBaseData\技能过程\29\连云堡醉刀_醉步_移动3\连云堡醉刀_醉步_移动3.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
	},
	[15286] =   	--SkillBaseData\技能过程\29\连云堡醉刀_醉步_移动4\连云堡醉刀_醉步_移动4.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
	},
	[15288] =   	--SkillBaseData\技能过程\29\连云堡醉刀_醉步_收招\连云堡醉刀_醉步_收招.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
	},
	[15289] =   	--SkillBaseData\技能过程\29\连云堡醉刀_醉舞_起手\连云堡醉刀_醉舞_起手.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
	},
	[15290] =   	--SkillBaseData\技能过程\29\连云堡醉刀_醉舞_旋转1\连云堡醉刀_醉舞_旋转1.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
	},
	[15291] =   	--SkillBaseData\技能过程\29\连云堡醉刀_醉舞_旋转2\连云堡醉刀_醉舞_旋转2.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
	},
	[15292] =   	--SkillBaseData\技能过程\29\连云堡醉刀_醉舞_旋转3\连云堡醉刀_醉舞_旋转3.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
	},
	[15293] =   	--SkillBaseData\技能过程\29\连云堡醉刀_醉舞_旋转4\连云堡醉刀_醉舞_旋转4.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
	},
	[15294] =   	--SkillBaseData\技能过程\29\连云堡醉刀_醉舞_旋转5\连云堡醉刀_醉舞_旋转5.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
	},
	[15295] =   	--SkillBaseData\技能过程\29\连云堡醉刀_醉舞_旋转6\连云堡醉刀_醉舞_旋转6.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
	},
	[15296] =   	--SkillBaseData\技能过程\29\连云堡醉刀_醉舞_旋转7\连云堡醉刀_醉舞_旋转7.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
	},
	[15297] =   	--SkillBaseData\技能过程\29\连云堡醉刀_醉舞_旋转8\连云堡醉刀_醉舞_旋转8.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
	},
	[15298] =   	--SkillBaseData\技能过程\29\连云堡醉刀_醉舞_旋转9\连云堡醉刀_醉舞_旋转9.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
	},
	[15299] =   	--SkillBaseData\技能过程\29\连云堡醉刀_醉舞_旋转10\连云堡醉刀_醉舞_旋转10.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
	},
	[15303] =   	--SkillBaseData\技能过程\29\连云堡醉刀_狂刀_冲刺\连云堡醉刀_狂刀_冲刺.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
	},
	[15315] =   	--SkillBaseData\技能过程\29\连云堡醉刀_快刀斩_前进\连云堡醉刀_快刀斩_前进.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
	},
	[15319] =   	--SkillBaseData\技能过程\29\连云堡醉刀_快刀斩_再进\连云堡醉刀_快刀斩_再进.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
	},
	[15321] =   	--SkillBaseData\技能过程\29\连云堡醉刀_快刀斩_三进\连云堡醉刀_快刀斩_三进.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
	},
	[15347] =   	--SkillBaseData\技能过程\29\连云堡滚石_碾压_位移1\连云堡滚石_碾压_位移1.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
	},
	[15348] =   	--SkillBaseData\技能过程\29\连云堡滚石_碾压_位移2\连云堡滚石_碾压_位移2.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
	},
	[15349] =   	--SkillBaseData\技能过程\29\连云堡滚石_碾压_位移3\连云堡滚石_碾压_位移3.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
	},
	[15350] =   	--SkillBaseData\技能过程\29\连云堡滚石_碾压_位移4\连云堡滚石_碾压_位移4.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
	},
	[15351] =   	--SkillBaseData\技能过程\29\连云堡滚石_碾压_位移5\连云堡滚石_碾压_位移5.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
	},
	[15438] =   	--SkillBaseData\技能过程\29\连云堡醉刀幻影_醉舞_起手\连云堡醉刀幻影_醉舞_起手.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
	},
	[15439] =   	--SkillBaseData\技能过程\29\连云堡醉刀幻影_醉舞_旋转1\连云堡醉刀幻影_醉舞_旋转1.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
	},
	[15440] =   	--SkillBaseData\技能过程\29\连云堡醉刀幻影_醉舞_旋转2\连云堡醉刀幻影_醉舞_旋转2.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
	},
	[15441] =   	--SkillBaseData\技能过程\29\连云堡醉刀幻影_醉舞_旋转3\连云堡醉刀幻影_醉舞_旋转3.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
	},
	[15442] =   	--SkillBaseData\技能过程\29\连云堡醉刀幻影_醉舞_旋转4\连云堡醉刀幻影_醉舞_旋转4.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
	},
	[15443] =   	--SkillBaseData\技能过程\29\连云堡醉刀幻影_醉舞_旋转5\连云堡醉刀幻影_醉舞_旋转5.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
	},
	[15444] =   	--SkillBaseData\技能过程\29\连云堡醉刀幻影_醉舞_旋转6\连云堡醉刀幻影_醉舞_旋转6.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
	},
	[15445] =   	--SkillBaseData\技能过程\29\连云堡醉刀幻影_醉舞_旋转7\连云堡醉刀幻影_醉舞_旋转7.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
	},
	[15446] =   	--SkillBaseData\技能过程\29\连云堡醉刀幻影_醉舞_旋转8\连云堡醉刀幻影_醉舞_旋转8.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
	},
	[15447] =   	--SkillBaseData\技能过程\29\连云堡醉刀幻影_醉舞_旋转9\连云堡醉刀幻影_醉舞_旋转9.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
	},
	[15448] =   	--SkillBaseData\技能过程\29\连云堡醉刀幻影_醉舞_旋转10\连云堡醉刀幻影_醉舞_旋转10.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
	},
	[16300] =   	--SkillBaseData\技能过程\29\连云堡巨笔_跳跃_位移\连云堡巨笔_跳跃_位移.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
	},
	[16829] =   	--SkillBaseData\技能过程\29\连云堡守崖射手_跳跃过程\连云堡守崖射手_跳跃过程.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 300, end_time = -1, vg = -40, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	-------hint	梅庄地牢技能配置
	[17747] =   	--SkillBaseData\技能过程\27\梅庄地牢剑守卫_霜火斩火冲\梅庄地牢剑守卫_霜火斩火冲.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
	},
	[17973] =   	--SkillBaseData\技能过程\27\梅庄地牢巨剑_飞刺飞行\梅庄地牢巨剑_飞刺飞行.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
	},
	[17990] =   	--SkillBaseData\技能过程\27\梅庄地牢徽记_移动循环\梅庄地牢徽记_移动循环.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
	},
	-------hint	珍兽岛技能配置
	[14475] =   	--SkillBaseData\技能过程\30\帮派BOSS金跳跃前踏技能出招\帮派BOSS金跳跃前踏技能出招.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = -200, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -200, vg = -16, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[14486] =   	--SkillBaseData\技能过程\30\帮派BOSS木高跳砸地技能收招1\帮派BOSS木高跳砸地技能收招1.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -16, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[14493] =   	--SkillBaseData\技能过程\30\帮派BOSS水近身重击技能出招\帮派BOSS水近身重击技能出招.tmpl
	{
		["HMove"] = { {start_time = -300, end_time = -1, hacc = -5}, },
		["VMove"] = { {start_time = -300, end_time = -1, vg = -16, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[14496] =   	--SkillBaseData\技能过程\30\帮派BOSS水瞬移技能收招1\帮派BOSS水瞬移技能收招1.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = 1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = 1, vg = -16, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[14502] =   	--SkillBaseData\技能过程\30\帮派BOSS火长距冲锋技能收招1\帮派BOSS火长距冲锋技能收招1.tmpl
	{
		["HMove"] = { {start_time = 400, end_time = -800, hacc = 0}, },
		["VMove"] = { {start_time = 400, end_time = -800, vg = -16, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[14516] =   	--SkillBaseData\技能过程\30\帮派BOSS土跳跃砸地技能收招1\帮派BOSS土跳跃砸地技能收招1.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = 500, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = 500, vg = -16, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[14518] =   	--SkillBaseData\技能过程\30\帮派BOSS土快速穿刺技能收招1\帮派BOSS土快速穿刺技能收招1.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = -10}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -16, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	-------hint	珍兽岛技能配置
	[18856] =   	--SkillBaseData\技能过程\30\九层妖楼死牢怨魂冲锋打背击收招1\九层妖楼死牢怨魂冲锋打背击收招1.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = 250, hacc = -10}, },
		["VMove"] = { {start_time = 0, end_time = 250, vg = -16, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[18853] =   	--SkillBaseData\技能过程\30\九层妖楼死牢怨魂普攻2收招2\九层妖楼死牢怨魂普攻2收招2.tmpl
	{
		["HMove"] = { {start_time = -250, end_time = -1, hacc = 10}, },
		["VMove"] = { {start_time = -250, end_time = -1, vg = -16, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[18876] =   	--SkillBaseData\技能过程\30\九层妖楼剑冢护剑流亡剑客冲锋收招1\九层妖楼剑冢护剑流亡剑客冲锋收招1.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = 300, hacc = -10}, },
		["VMove"] = { {start_time = 0, end_time = 300, vg = -16, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[18941] =   	--SkillBaseData\技能过程\30\九层妖楼山猴瞬移收招1\九层妖楼山猴瞬移收招1.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = 1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = 1, vg = -16, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	------------------------------------------------
	--hint	名人技能
	------------------------------------------------
	-------hint	~~~~易容名人专用技能
	--不戒和尚
	[16240] =	--SkillBaseData\技能过程\30\易容专用不戒和尚绝技1_收招\易容专用不戒和尚绝技1_收招.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = 250, hacc = -10}, },
	},
	[16242] =	--SkillBaseData\技能过程\30\易容专用不戒和尚绝技2_收招1\易容专用不戒和尚绝技2_收招1.tmpl
	{
		["VMove"] = {
		{start_time = 0, end_time = -200, vg = -16, init_speed = 16, speed_flag = SPEEDFLAG_FORCEDEFINE,},
		{start_time = -199, end_time = -1, vg = -16, init_speed = 10, speed_flag = SPEEDFLAG_FORCE_BELOW,},
		},
	},
	-------hint	红蓝方小兵技能
	--(红方)5v5战场守阵机关铁人攻击(普通攻击1)(换成了红方箭塔)
	--[[
	[10632] =	--SkillBaseData\技能过程\30\5v5战场守阵机关铁人攻击过程1\5v5战场守阵机关铁人攻击过程1.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, end_time = -1, newecm = "普通攻击1", seektime = 150, transtime = 100, anispeed = 100, },
		},
		--["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},]]
	--(红方)5v5战场仙霞金刀将攻击(普通攻击1)，换成了山贼
	[10634] =	--SkillBaseData\技能过程\30\5v5战场仙霞金刀将攻击过程1\5v5战场仙霞金刀将攻击过程1.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, end_time = -1, newecm = "普通攻击1", seektime = 0, transtime = 100, anispeed = 100, },
		},
		--["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	--(红方)5v5战场仙霞神射手攻击(技能攻击1后半段)，换成了锐射手
	[10636] =	--SkillBaseData\技能过程\30\5v5战场仙霞神射手攻击过程1\5v5战场仙霞神射手攻击过程1.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, end_time = 500, newecm = "普通攻击1", seektime = 250, transtime = 100, anispeed = 100, },
		{start_time = 501, end_time = -1, newecm = "普通攻击1", seektime = 1100, transtime = 100, anispeed = 100, },
		},
		--["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	--(红方)5v5战场青石兽攻击(普通攻击3)，换成了嗜血和尚
	[10638] =	--SkillBaseData\技能过程\30\5v5战场青石兽攻击过程1\5v5战场青石兽攻击过程1.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, end_time = -1, newecm = "普通攻击3", seektime = 0, transtime = 100, anispeed = 100, },
		},
		--["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	--(蓝方)5v5战场持械机关木人攻击(普通攻击1)(换成了蓝方箭塔)
	--[[
	[10640] =	--SkillBaseData\技能过程\30\5v5战场持械机关木人攻击过程1\5v5战场持械机关木人攻击过程1.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, end_time = -1, newecm = "普通攻击1", seektime = 150, transtime = 100, anispeed = 100, },
		},
		--["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},]]
	--(蓝方)5v5战场梅岭强盗攻击(普通攻击1)，换成了水贼
	[10642] =	--SkillBaseData\技能过程\30\5v5战场梅岭强盗攻击过程1\5v5战场梅岭强盗攻击过程1.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, end_time = -1, newecm = "普通攻击1", seektime = 100, transtime = 100, anispeed = 100, },
		},
		--["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	--(蓝方)5v5战场梅岭弩手攻击(普通攻击2后半段)，换成了弓手
	[10644] =	--SkillBaseData\技能过程\30\5v5战场梅岭弩手攻击过程1\5v5战场梅岭弩手攻击过程1.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, end_time = -1, newecm = "普通攻击1", seektime = 200, transtime = 100, anispeed = 100, },
		},
		--["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	--(蓝方)5v5战场机关驴攻击(普通攻击3)，换成了聂人屠
	[10646] =	--SkillBaseData\技能过程\30\5v5战场机关驴攻击过程1\5v5战场机关驴攻击过程1.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, end_time = 500, newecm = "技能攻击1", seektime = 0, transtime = 100, anispeed = 150, },
		{start_time = 501, end_time = -1, newecm = "技能攻击1", seektime = 750, transtime = 100, anispeed = 50, },
		},
		--["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	-------hint	(00替换文本)
	--
	[10001] =	--SkillBaseData\技能过程\30\名人(00替换文本)招式出招\名人(00替换文本)招式出招.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, end_time = -1, newecm = "", seektime = 0, transtime = 100, anispeed = 100, },
		},
		--["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	--
	[10002] =	--SkillBaseData\技能过程\30\名人(00替换文本)绝技1出招\名人(00替换文本)绝技1出招.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, end_time = -1, newecm = "", seektime = 0, transtime = 100, anispeed = 100, },
		},
		--["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	--
	[10003] =	--SkillBaseData\技能过程\30\名人(00替换文本)绝技2收招1\名人(00替换文本)绝技2收招1.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, end_time = -1, newecm = "", seektime = 0, transtime = 100, anispeed = 100, },
		},
		--["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	--
	[10004] =	--SkillBaseData\技能过程\30\名人(00替换文本)绝技3出招\名人(00替换文本)绝技3出招.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, end_time = -1, newecm = "", seektime = 0, transtime = 100, anispeed = 100, },
		},
		--["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	--
	[10005] =	--SkillBaseData\技能过程\30\名人(00替换文本)绝技4出招\名人(00替换文本)绝技4出招.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, end_time = -1, newecm = "", seektime = 0, transtime = 100, anispeed = 100, },
		},
		--["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	--
	[10006] =	--SkillBaseData\技能过程\30\名人(00替换文本)大招出招\名人(00替换文本)大招出招.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, end_time = -1, newecm = "", seektime = 0, transtime = 100, anispeed = 100, },
		},
		--["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	-------hint	01令狐冲
	--刀砍
	[10221] =	--SkillBaseData\技能过程\30\名人01令狐冲招式出招\名人01令狐冲招式出招.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, end_time = -1, newecm = "普通攻击1", seektime = 0, transtime = 100, anispeed = 200, },
		},
		--["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	--利刃剑气（减掉后一点）
	[10223] =	--SkillBaseData\技能过程\30\名人01令狐冲绝技1出招\名人01令狐冲绝技1出招.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, end_time = 1000, newecm = "普通攻击2", seektime = 0, transtime = 100, anispeed = 100, },
		},
		--["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	--美酒疗法（只用后一半，动作加速2倍）
	[10225] =	--SkillBaseData\技能过程\30\名人01令狐冲绝技2收招1\名人01令狐冲绝技2收招1.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, end_time = 1000, newecm = "休闲动作2", seektime = 1800, transtime = 100, anispeed = 2000, },
		},
		--["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	--鼓舞士气（只用后一半）
	[10227] =	--SkillBaseData\技能过程\30\名人01令狐冲绝技3出招\名人01令狐冲绝技3出招.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, end_time = 1000, newecm = "技能攻击2", seektime = 1500, transtime = 100, anispeed = 100, },
		},
		--["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	--华山剑幕（只用前一半）`
	[10229] =	--SkillBaseData\技能过程\30\名人01令狐冲绝技4出招\名人01令狐冲绝技4出招.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, end_time = 1000, newecm = "技能攻击1", seektime = 0, transtime = 100, anispeed = 100, },
		},
		--["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	--独狐九剑（收招动作没剪，但1.4秒后可以移动）
	[10231] =	--SkillBaseData\技能过程\30\名人01令狐冲大招出招\名人01令狐冲大招出招.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, end_time = -1, newecm = "普通攻击3", seektime = 0, transtime = 100, anispeed = 100, },
		},
		--["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	-------hint	02白熊
	--铲扫（前后都剪掉一点）
	[10233] =	--SkillBaseData\技能过程\30\名人02白熊招式出招\名人02白熊招式出招.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, end_time = 1000, newecm = "普通攻击1", seektime = 200, transtime = 100, anispeed = 200, },
		},
		--["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	--大杀四方（用前一半）
	[10235] =	--SkillBaseData\技能过程\30\名人02白熊绝技1出招\名人02白熊绝技1出招.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, end_time = 800, newecm = "技能攻击1", seektime = 0, transtime = 100, anispeed = 100, },
		},
		--["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	--致残打击（全用）
	[10237] =	--SkillBaseData\技能过程\30\名人02白熊绝技2收招1\名人02白熊绝技2收招1.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, end_time = 900, newecm = "普通攻击2", seektime = 700, transtime = 100, anispeed = 100, },
		},
		--["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	--无情铁手（全用）
	[10239] =	--SkillBaseData\技能过程\30\名人02白熊绝技3出招\名人02白熊绝技3出招.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, end_time = 1000, newecm = "普通攻击3", seektime = 400, transtime = 100, anispeed = 100, },
		},
		--["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	--白熊断头台（前用状态技能后半，后用技能攻击2前半）
	[10241] =	--SkillBaseData\技能过程\30\名人02白熊绝技4出招\名人02白熊绝技4出招.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, end_time = 750, newecm = "状态技能", seektime = 900, transtime = 100, anispeed = 100, },
		},
		--["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[10242] =	--SkillBaseData\技能过程\30\名人02白熊绝技4收招1\名人02白熊绝技4收招1.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, end_time = 450, newecm = "技能攻击2", seektime = 900, transtime = 100, anispeed = 100, },
		},
		["HMove"] = { {start_time = 0, end_time = 150, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = 150, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	--断地猛击（前用状态技能前半，后用技能攻击1后半，动作会更长，但1.2秒后可动）
	[10243] =	--SkillBaseData\技能过程\30\名人02白熊大招出招\名人02白熊大招出招.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, end_time = 800, newecm = "状态技能", seektime = 0, transtime = 100, anispeed = 100, },
		{start_time = 0, end_time = -1, newecm = "技能攻击1", seektime = 800, transtime = 100, anispeed = 100, },
		},
		--["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	-------hint	03黑白子
	--棋子（前后各剪一点）
	[10245] =	--SkillBaseData\技能过程\30\名人03黑白子招式出招\名人03黑白子招式出招.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, end_time = 1000, newecm = "普通攻击1", seektime = 50, transtime = 100, anispeed = 200, },
		},
		--["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	--黑色棋子（去掉后半）
	[10247] =	--SkillBaseData\技能过程\30\名人03黑白子绝技1出招\名人03黑白子绝技1出招.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, end_time = 1000, newecm = "普通攻击3", seektime = 0, transtime = 100, anispeed = 100, },
		},
		--["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	--诱捕棋盘（全用）
	[10249] =	--SkillBaseData\技能过程\30\名人03黑白子绝技2收招1\名人03黑白子绝技2收招1.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, end_time = 1000, newecm = "状态技能", seektime = 0, transtime = 100, anispeed = 120, },
		},
		--["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	--白色棋子（剪掉前一点）
	[10251] =	--SkillBaseData\技能过程\30\名人03黑白子绝技3出招\名人03黑白子绝技3出招.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, end_time = 1000, newecm = "普通攻击1", seektime = 50, transtime = 100, anispeed = 100, },
		},
		--["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[10252] =	--SkillBaseData\技能过程\30\名人03黑白子绝技3收招1\名人03黑白子绝技3收招1.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = 100, hacc = -20}, },
		["VMove"] = { {start_time = 0, end_time = 100, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	--让棋子飞（没剪动作，但3.5秒后会断）
	[10253] =	--SkillBaseData\技能过程\30\名人03黑白子绝技4出招\名人03黑白子绝技4出招.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, end_time = -1, newecm = "技能攻击1", seektime = 0, transtime = 100, anispeed = 100, },
		},
		--["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	--棋子阵（用前一半，中间循环，补收收动作，但1.9秒后可以走）
	[10255] =	--SkillBaseData\技能过程\30\名人03黑白子大招出招\名人03黑白子大招出招.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, end_time = 300, newecm = "技能攻击2", seektime = 0, transtime = 100, anispeed = 100, },
		{start_time = 301, end_time = 700, newecm = "技能攻击2", seektime = 300, transtime = 100, anispeed = 100, },
		{start_time = 701, end_time = 1100, newecm = "技能攻击2", seektime = 300, transtime = 100, anispeed = 100, },
		{start_time = 1101, end_time = 1500, newecm = "技能攻击2", seektime = 300, transtime = 100, anispeed = 100, },
		{start_time = 1501, end_time = 1900, newecm = "技能攻击2", seektime = 300, transtime = 100, anispeed = 100, },
		{start_time = 1901, end_time = -1, newecm = "技能攻击2", seektime = 700, transtime = 100, anispeed = 100, },
		},
		--["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	-------hint	04任盈盈
	--毒球（用后一半）
	[10257] =	--SkillBaseData\技能过程\30\名人04任盈盈招式出招\名人04任盈盈招式出招.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, end_time = 1000, newecm = "普通攻击2", seektime = 100, transtime = 100, anispeed = 200, },
		},
		--["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	--魔力宝珠（用后一半）
	[10259] =	--SkillBaseData\技能过程\30\名人04任盈盈绝技1出招\名人04任盈盈绝技1出招.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, end_time = 1000, newecm = "普通攻击1", seektime = 500, transtime = 100, anispeed = 100, },
		},
		--["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	--诡异妖火（只用前一半）
	[10261] =	--SkillBaseData\技能过程\30\名人04任盈盈绝技2收招1\名人04任盈盈绝技2收招1.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, end_time = 1000, newecm = "技能攻击1", seektime = 100, transtime = 100, anispeed = 100, },
		},
		--["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	--魅惑之吻（剪掉后一点）
	[10263] =	--SkillBaseData\技能过程\30\名人04任盈盈绝技3出招\名人04任盈盈绝技3出招.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, end_time = 800, newecm = "状态技能", seektime = 0, transtime = 100, anispeed = 100, },
		},
		--["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	--敏捷突袭（跳跃动作拼接）
	[10265] =	--SkillBaseData\技能过程\30\名人04任盈盈绝技4出招\名人04任盈盈绝技4出招.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, end_time = 250, newecm = "跳起", seektime = 0, transtime = 100, anispeed = 100, },
		{start_time = 251, end_time = 600, newecm = "空中循环", seektime = 0, transtime = 100, anispeed = 100, },
		{start_time = 601, end_time = 800, newecm = "落地", seektime = 0, transtime = 100, anispeed = 100, },
		},
		["HMove"] = { {start_time = 0, end_time = 500, hacc = 20}, },
		["VMove"] = { {start_time = 0, end_time = 500, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	--连环鞭击（只用后前，最后不截，但4.3秒后可以走）
	[10267] =	--SkillBaseData\技能过程\30\名人04任盈盈大招出招\名人04任盈盈大招出招.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, end_time = -1, newecm = "技能攻击3", seektime = 1600, transtime = 100, anispeed = 100, },
		},
		--["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	-------hint	05宁中则
	--剑气（全用）
	[10269] =	--SkillBaseData\技能过程\30\名人05宁中则招式出招\名人05宁中则招式出招.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, end_time = -1, newecm = "普通攻击3", seektime = 0, transtime = 100, anispeed = 200, },
		},
		--["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	--龙卷束缚（剪掉后一点）
	[10271] =	--SkillBaseData\技能过程\30\名人05宁中则绝技1出招\名人05宁中则绝技1出招.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, end_time = 1000, newecm = "普通攻击2", seektime = 0, transtime = 100, anispeed = 100, },
		},
		--["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	--祝福屏障（剪掉前一点）
	[10273] =	--SkillBaseData\技能过程\30\名人05宁中则绝技2收招1\名人05宁中则绝技2收招1.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, end_time = 1000, newecm = "状态技能", seektime = 200, transtime = 100, anispeed = 100, },
		},
		--["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	--剑气祸旋（去掉后一点）
	[10275] =	--SkillBaseData\技能过程\30\名人05宁中则绝技3出招\名人05宁中则绝技3出招.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, end_time = 1000, newecm = "普通攻击1", seektime = 500, transtime = 100, anispeed = 100, },
		},
		--["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	--终极杀阵（前半程循环几次，后半段没有剪，但会在）
	[10277] =	--SkillBaseData\技能过程\30\名人05宁中则绝技4出招\名人05宁中则绝技4出招.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, end_time = 200, newecm = "技能攻击2", seektime = 0, transtime = 100, anispeed = 100, },
		{start_time = 201, end_time = 800, newecm = "技能攻击2", seektime = 200, transtime = 100, anispeed = 100, },
		{start_time = 801, end_time = 1600, newecm = "技能攻击2", seektime = 200, transtime = 100, anispeed = 100, },
		{start_time = 1601, end_time = 2400, newecm = "技能攻击2", seektime = 200, transtime = 100, anispeed = 100, },
		{start_time = 2401, end_time = -1, newecm = "技能攻击2", seektime = 800, transtime = 100, anispeed = 100, },
		},
		--["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	--宁氏一剑（只用后一半）
	[10279] =	--SkillBaseData\技能过程\30\名人05宁中则大招出招\名人05宁中则大招出招.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, end_time = 1200, newecm = "技能攻击1", seektime = 800, transtime = 100, anispeed = 100, },
		},
		--["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	-------hint	06岳灵珊
	--剑突（后面剪一点）
	[10281] =	--SkillBaseData\技能过程\30\名人06岳灵珊招式出招\名人06岳灵珊招式出招.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, end_time = -1, newecm = "普通攻击2", seektime = 0, transtime = 100, anispeed = 160, },
		},
		--["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	--内功剑震（后面没剪，但在1秒后可以走）
	[10283] =	--SkillBaseData\技能过程\30\名人06岳灵珊绝技1出招\名人06岳灵珊绝技1出招.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, end_time = -1, newecm = "普通攻击1", seektime = 0, transtime = 100, anispeed = 100, },
		},
		--["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	--复仇哭泣（只用后一半，没有剪时间，但0.8秒后可以走）
	[10285] =	--SkillBaseData\技能过程\30\名人06岳灵珊绝技2收招1\名人06岳灵珊绝技2收招1.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, end_time = -1, newecm = "休闲动作2", seektime = 1500, transtime = 100, anispeed = 100, },
		},
		--["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	--战斗号令（全用，没有剪时间，但0.8秒后可以走）
	[10287] =	--SkillBaseData\技能过程\30\名人06岳灵珊绝技3出招\名人06岳灵珊绝技3出招.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, end_time = -1, newecm = "状态技能", seektime = 0, transtime = 100, anispeed = 100, },
		},
		--["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	--移形换位（没有剪，但1.5秒后可以走）
	[10289] =	--SkillBaseData\技能过程\30\名人06岳灵珊绝技4出招\名人06岳灵珊绝技4出招.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, end_time = -1, newecm = "技能攻击2", seektime = 0, transtime = 100, anispeed = 100, },
		},
		--["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[10290] =	--SkillBaseData\技能过程\30\名人06岳灵珊绝技4收招1\名人06岳灵珊绝技4收招1.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = 50, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = 50, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	--杀意波动（没有剪，但1.5秒后可以走）
	[10291] =	--SkillBaseData\技能过程\30\名人06岳灵珊大招出招\名人06岳灵珊大招出招.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, end_time = -1, newecm = "技能攻击1", seektime = 0, transtime = 100, anispeed = 100, },
		},
		--["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[10292] =	--SkillBaseData\技能过程\30\名人06岳灵珊大招收招1\名人06岳灵珊大招收招1.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = 200, hacc = -20}, },
		["VMove"] = { {start_time = 0, end_time = 200, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	-------hint	07向问天
	--剑斩（全用）
	[10293] =	--SkillBaseData\技能过程\30\名人07向问天招式出招\名人07向问天招式出招.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, end_time = -1, newecm = "普通攻击1", seektime = 0, transtime = 100, anispeed = 200, },
		},
		--["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	--剑刃风暴（取后半作攻击，后一半循环）
	[10295] =	--SkillBaseData\技能过程\30\名人07向问天绝技1出招\名人07向问天绝技1出招.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, end_time = 750, newecm = "技能攻击1", seektime = 1500, transtime = 100, anispeed = 150, },
		},
		--["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[10296] =	--SkillBaseData\技能过程\30\名人07向问天绝技1收招1\名人07向问天绝技1收招1.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, end_time = 500, newecm = "技能攻击1", seektime = 2400, transtime = 100, anispeed = 150, },
		},
		--["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	--治疗守卫（用后一半，加速，0.8秒后可以移动）
	[10297] =	--SkillBaseData\技能过程\30\名人07向问天绝技2收招1\名人07向问天绝技2收招1.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, end_time = -1, newecm = "休闲动作2", seektime = 1600, transtime = 100, anispeed = 200, },
		},
		--["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	--必杀剑舞（用前一半，剪前）
	[10299] =	--SkillBaseData\技能过程\30\名人07向问天绝技3出招\名人07向问天绝技3出招.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, end_time = 1000, newecm = "技能攻击1", seektime = 600, transtime = 100, anispeed = 100, },
		},
		--["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	--无敌斩击（普攻2、3，技能2）
	[10301] =	--SkillBaseData\技能过程\30\名人07向问天绝技4出招\名人07向问天绝技4出招.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, end_time = -1, newecm = "普通攻击2", seektime = 0, transtime = 100, anispeed = 100, },
		},
		["HMove"] = { {start_time = -50, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = -50, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[10733] =	--SkillBaseData\技能过程\30\名人07向问天大招收招2\名人07向问天大招收招2.tmpl（起名有问题，其　实是绝技4）
	{
		["ModifyECM"] = {
		{start_time = 0, end_time = -1, newecm = "普通攻击3", seektime = 0, transtime = 100, anispeed = 100, },
		},
		["HMove"] = { {start_time = -50, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = -50, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[10735] =	--SkillBaseData\技能过程\30\名人07向问天大招收招4\名人07向问天大招收招4.tmpl（起名有问题，其　实是绝技4）
	{
		["ModifyECM"] = {
		{start_time = 0, end_time = 500, newecm = "技能攻击2", seektime = 0, transtime = 100, anispeed = 100, },
		},
		["HMove"] = { {start_time = -50, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = -50, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[10737] =	--SkillBaseData\技能过程\30\名人07向问天大招收招6\名人07向问天大招收招6.tmpl（起名有问题，其　实是绝技4）
	{
		["ModifyECM"] = {
		{start_time = 0, end_time = 500, newecm = "技能攻击2", seektime = 500, transtime = 100, anispeed = 100, },
		},
		["HMove"] = { {start_time = -50, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = -50, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[10739] =	--SkillBaseData\技能过程\30\名人07向问天大招收招8\名人07向问天大招收招8.tmpl（起名有问题，其　实是绝技4）
	{
		["ModifyECM"] = {
		{start_time = 0, end_time = -1, newecm = "技能攻击2", seektime = 1000, transtime = 100, anispeed = 100, },
		},
		["HMove"] = { {start_time = -50, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = -50, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	--极限爆破（没有剪，但1.1秒后可以走）
	[10303] =	--SkillBaseData\技能过程\30\名人07向问天大招出招\名人07向问天大招出招.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, end_time = -1, newecm = "状态技能", seektime = 0, transtime = 100, anispeed = 100, },
		},
		--["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	-------hint	08黑熊
	--杖击（略放慢）
	[10305] =	--SkillBaseData\技能过程\30\名人08黑熊招式出招\名人08黑熊招式出招.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, end_time = -1, newecm = "普通攻击1", seektime = 0, transtime = 100, anispeed = 190, },
		},
		--["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	--强横穿刺（全用）
	[10307] =	--SkillBaseData\技能过程\30\名人08黑熊绝技1出招\名人08黑熊绝技1出招.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, end_time = -1, newecm = "普通攻击2", seektime = 0, transtime = 100, anispeed = 100, },
		},
		--["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[10308] =	--SkillBaseData\技能过程\30\名人08黑熊绝技1收招1\名人08黑熊绝技1收招1.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = 100, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = 100, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	--黑风迷阵（用前一半无限循环）
	[10309] =	--SkillBaseData\技能过程\30\名人08黑熊绝技2出招\名人08黑熊绝技2出招.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, end_time = 300, newecm = "状态技能", seektime = 0, transtime = 100, anispeed = 100, },
		},
		--["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[10310] =	--SkillBaseData\技能过程\30\名人08黑熊绝技2收招1\名人08黑熊绝技2收招1.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, end_time = 700, newecm = "状态技能", seektime = 300, transtime = 100, anispeed = 100, },
		},
		--["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	--爆裂毒气（用后一半）
	[10311] =	--SkillBaseData\技能过程\30\名人08黑熊绝技3出招\名人08黑熊绝技3出招.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, end_time = -1, newecm = "普通攻击3", seektime = 500, transtime = 100, anispeed = 100, },
		},
		--["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	--连环地震（全用，前半程减速）
	[10313] =	--SkillBaseData\技能过程\30\名人08黑熊绝技4出招\名人08黑熊绝技4出招.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, end_time = 2000, newecm = "技能攻击2", seektime = 0, transtime = 100, anispeed = 500, },
		},
		--["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[10314] =	--SkillBaseData\技能过程\30\名人08黑熊绝技4收招1\名人08黑熊绝技4收招1.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, end_time = -1, newecm = "技能攻击2", seektime = 1000, transtime = 100, anispeed = 1000, },
		},
		--["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	--熊之咆哮（剪掉前一些）
	[10315] =	--SkillBaseData\技能过程\30\名人08黑熊大招出招\名人08黑熊大招出招.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, end_time = -1, newecm = "技能攻击1", seektime = 0, transtime = 100, anispeed = 100, },
		},
		--["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	-------hint	09刘正风
	--风刃（全用）
	[10317] =	--SkillBaseData\技能过程\30\名人09刘卫风招式出招\名人09刘正风招式出招.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, end_time = -1, newecm = "普通攻击2", seektime = 0, transtime = 100, anispeed = 200, },
		},
		--["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	--竹笛声波（前半循环，后半用剩下的，1.5秒后可以走）
	[10319] =	--SkillBaseData\技能过程\30\名人09刘卫风绝技1出招\名人09刘正风绝技1出招.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, end_time = 500, newecm = "技能攻击2", seektime = 600, transtime = 100, anispeed = 100, },
		{start_time = 501, end_time = 1000, newecm = "技能攻击2", seektime = 600, transtime = 100, anispeed = 100, },
		{start_time = 1001, end_time = 1500, newecm = "技能攻击2", seektime = 600, transtime = 100, anispeed = 100, },
		{start_time = 1501, end_time = 2000, newecm = "技能攻击2", seektime = 600, transtime = 100, anispeed = 100, },
		{start_time = 2001, end_time = 2500, newecm = "技能攻击2", seektime = 600, transtime = 100, anispeed = 100, },
		{start_time = 2501, end_time = 3000, newecm = "技能攻击2", seektime = 600, transtime = 100, anispeed = 100, },
		{start_time = 3001, end_time = 3500, newecm = "技能攻击2", seektime = 600, transtime = 100, anispeed = 100, },
		{start_time = 3501, end_time = 4000, newecm = "技能攻击2", seektime = 600, transtime = 100, anispeed = 100, },
		{start_time = 4001, end_time = 4500, newecm = "技能攻击2", seektime = 600, transtime = 100, anispeed = 100, },
		{start_time = 4501, end_time = 5000, newecm = "技能攻击2", seektime = 600, transtime = 100, anispeed = 100, },
		},
		--["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[10320] =	--SkillBaseData\技能过程\30\名人09刘卫风绝技1收招1\名人09刘正风绝技1收招1.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, end_time = 500, newecm = "技能攻击2", seektime = 1400, transtime = 100, anispeed = 100, },
		},
		--["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	--绝技诅咒（不变）
	[10321] =	--SkillBaseData\技能过程\30\名人09刘卫风绝技2收招1\名人09刘正风绝技2收招1.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, end_time = -1, newecm = "普通攻击1", seektime = 0, transtime = 100, anispeed = 100, },
		},
		--["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	--内力传输（不变）
	[10323] =	--SkillBaseData\技能过程\30\名人09刘卫风绝技3出招\名人09刘正风绝技3出招.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, end_time = -1, newecm = "状态技能", seektime = 0, transtime = 100, anispeed = 100, },
		},
		--["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	--致盲之光（用后半，不剪但1秒后可以移动）
	[10325] =	--SkillBaseData\技能过程\30\名人09刘卫风绝技4出招\名人09刘正风绝技4出招.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, end_time = -1, newecm = "技能攻击1", seektime = 700, transtime = 100, anispeed = 100, },
		},
		--["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	--友军召回（用后半，暂时不剪，按段的时间中止）
	[10327] =	--SkillBaseData\技能过程\30\名人09刘卫风大招出招\名人09刘正风大招出招.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, end_time = -1, newecm = "休闲动作1", seektime = 1200, transtime = 100, anispeed = 100, },
		},
		--["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	-------hint	10东方不败
	--银针（前后都剪）
	[10329] =	--SkillBaseData\技能过程\30\名人10东方不败招式出招\名人10东方不败招式出招.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, end_time = 1000, newecm = "普通攻击2", seektime = 100, transtime = 100, anispeed = 200, },
		},
		--["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	--黑血神针（剪掉后半，加速）
	[10331] =	--SkillBaseData\技能过程\30\名人10东方不败绝技1出招\名人10东方不败绝技1出招.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, end_time = 1000, newecm = "普通攻击1", seektime = 0, transtime = 100, anispeed = 1200, },
		},
		--["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	--暗影闪烁（用后半）
	[10333] =	--SkillBaseData\技能过程\30\名人10东方不败绝技2收招1\名人10东方不败绝技2收招1.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, end_time = 300, newecm = "休闲动作1", seektime = 700, transtime = 100, anispeed = 100, },
		{start_time = 301, end_time = 600, newecm = "休闲动作1", seektime = 1500, transtime = 100, anispeed = 100, },
		},
		--["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[10334] =	--SkillBaseData\技能过程\30\名人10东方不败绝技2收招1\名人10东方不败绝技2收招1.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = 200, hacc = -20}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	--颤栗尖啸（用前半）
	[10335] =	--SkillBaseData\技能过程\30\名人10东方不败绝技3出招\名人10东方不败绝技3出招.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, end_time = 1000, newecm = "普通攻击3", seektime = 400, transtime = 100, anispeed = 100, },
		},
		--["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	--巨力光波（前后剪一点）
	[10337] =	--SkillBaseData\技能过程\30\名人10东方不败绝技4出招\名人10东方不败绝技4出招.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, end_time = 1000, newecm = "技能攻击2", seektime = 400, transtime = 100, anispeed = 100, },
		},
		--["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	--毁天灭地（全用，1.5秒后可以移动）
	[10339] =	--SkillBaseData\技能过程\30\名人10东方不败大招出招\名人10东方不败大招出招.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, end_time = -1, newecm = "技能攻击3", seektime = 0, transtime = 100, anispeed = 100, },
		},
		--["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	-------hint	11东方岚
	--震击(取后半段)
	[10992] =	--SkillBaseData\技能过程\30\名人11东方岚招式出招\名人11东方岚招式出招.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, end_time = -1, newecm = "普通攻击2", seektime = 500, transtime = 100, anispeed = 200, },
		},
		--["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	--内劲射击(取前半段)
	[10994] =	--SkillBaseData\技能过程\30\名人11东方岚绝技1出招\名人11东方岚绝技1出招.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, end_time = 600, newecm = "普通攻击3", seektime = 0, transtime = 100, anispeed = 100, },
		},
		--["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	--气波穿透(取前半段)
	[10996] =	--SkillBaseData\技能过程\30\名人11东方岚绝技2收招1\名人11东方岚绝技2收招1.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, end_time = 1000, newecm = "普通攻击1", seektime = 0, transtime = 100, anispeed = 100, },
		},
		--["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	--战术闪烁(取状态技能前半段且收招加快)
	[10998] =	--SkillBaseData\技能过程\30\名人11东方岚绝技3出招\名人11东方岚绝技3出招.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, end_time = 400, newecm = "状态技能", seektime = 0, transtime = 100, anispeed = 100, },
		{start_time = 401, end_time = 600, newecm = "状态技能", seektime = 400, transtime = 100, anispeed = 300, },
		},
		["HMove"] = { {start_time = -100, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	--无限弹幕(取最后一脚踢出)
	[11000] =	--SkillBaseData\技能过程\30\名人11东方岚绝技4出招\名人11东方岚绝技4出招.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, end_time = -1, newecm = "技能攻击2", seektime = 0, transtime = 100, anispeed = 100, },
		},
		--["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	--末日真空(取第三下攻击的前半段)
	[11002] =	--SkillBaseData\技能过程\30\名人11东方岚大招出招\名人11东方岚大招出招.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, end_time = 1050, newecm = "技能攻击1", seektime = 1700, transtime = 100, anispeed = 100, },
		},
		--["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	-------hint	12田伯光
	--空刃(取前半段)
	[11004] =	--SkillBaseData\技能过程\30\名人12田伯光招式出招\名人12田伯光招式出招.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, end_time = 500, newecm = "普通攻击1", seektime = 0, transtime = 100, anispeed = 200, },
		},
		--["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	--散射剑气(用后半部分小跳横斩)
	[11006] =	--SkillBaseData\技能过程\30\名人12田伯光绝技1出招\名人12田伯光绝技1出招.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, end_time = 1000, newecm = "技能攻击2", seektime = 500, transtime = 100, anispeed = 100, },
		},
		--["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	--烟雾迷阵(加速播放)
	[11008] =	--SkillBaseData\技能过程\30\名人12田伯光绝技2收招1\名人12田伯光绝技2收招1.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, end_time = 300, newecm = "普通攻击2", seektime = 0, transtime = 100, anispeed = 200, },
		{start_time = 301, end_time = 500, newecm = "普通攻击2", seektime = 600, transtime = 100, anispeed = 200, },
		},
		--["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	--快速冲锋(翻跟头加落地)
	[11010] =	--SkillBaseData\技能过程\30\名人12田伯光绝技3出招\名人12田伯光绝技3出招.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, end_time = 450, newecm = "翻跟头跳", seektime = 0, transtime = 100, anispeed = 100, },
		{start_time = 451, end_time = -1, newecm = "落地", seektime = 0, transtime = 100, anispeed = 100, },
		},
		["HMove"] = { {start_time = 100, end_time = -1, hacc = -10}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	--终极灭杀(后面有动作没剪掉但可以动)
	[11012] =	--SkillBaseData\技能过程\30\名人12田伯光绝技4出招\名人12田伯光绝技4出招.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, end_time = -1, newecm = "技能攻击1", seektime = 0, transtime = 100, anispeed = 100, },
		},
		--["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	--飞沙走石十三刀(先插地再跳跃后移)
	[11014] =	--SkillBaseData\技能过程\30\名人12田伯光大招出招\名人12田伯光大招出招.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, end_time = 1000, newecm = "状态技能", seektime = 0, transtime = 100, anispeed = 200, },
		{start_time = 1001, end_time = 1250, newecm = "跳起", seektime = 0, transtime = 100, anispeed = 100, },
		},
		--["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[11015] =	--SkillBaseData\技能过程\30\名人12田伯光大招收招1\名人12田伯光大招收招1.tmpl
	{
		["HMove"] = { {start_time = 500, end_time = -1, hacc = -10}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	-------hint	13绿竹翁
	--掌击(加速播放)
	[11016] =	--SkillBaseData\技能过程\30\名人13绿竹翁招式出招\名人13绿竹翁招式出招.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, end_time = -1, newecm = "普通攻击1", seektime = 0, transtime = 100, anispeed = 190, },
		},
		--["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	--竹节牵引
	[11018] =	--SkillBaseData\技能过程\30\名人13绿竹翁绝技1出招\名人13绿竹翁绝技1出招.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, end_time = -1, newecm = "普通攻击3", seektime = 0, transtime = 100, anispeed = 100, },
		},
		--["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	--绿风光环(取中间很短)
	[11020] =	--SkillBaseData\技能过程\30\名人13绿竹翁绝技2收招1\名人13绿竹翁绝技2收招1.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, end_time = 300, newecm = "普通攻击2", seektime = 300, transtime = 100, anispeed = 100, },
		},
		--["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	--隐士之怒(取前半)
	[11022] =	--SkillBaseData\技能过程\30\名人13绿竹翁绝技3出招\名人13绿竹翁绝技3出招.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, end_time = 800, newecm = "技能攻击2", seektime = 400, transtime = 100, anispeed = 100, },
		},
		--["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	--束缚诅咒(取后半)
	[11024] =	--SkillBaseData\技能过程\30\名人13绿竹翁绝技4出招\名人13绿竹翁绝技4出招.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, end_time = 850, newecm = "技能攻击2", seektime = 800, transtime = 100, anispeed = 100, },
		},
		--["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	--野火燎原(全部)
	[11026] =	--SkillBaseData\技能过程\30\名人13绿竹翁大招出招\名人13绿竹翁大招出招.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, end_time = -1, newecm = "技能攻击1", seektime = 0, transtime = 100, anispeed = 100, },
		},
		--["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	-------hint	14桃花仙
	--刺击(截掉末尾)
	[11028] =	--SkillBaseData\技能过程\30\名人14桃花仙招式出招\名人14桃花仙招式出招.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, end_time = 500, newecm = "普通攻击1", seektime = 0, transtime = 100, anispeed = 200, },
		},
		--["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	--农夫之钩
	[11030] =	--SkillBaseData\技能过程\30\名人14桃花仙绝技1出招\名人14桃花仙绝技1出招.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, end_time = -1, newecm = "普通攻击2", seektime = 0, transtime = 100, anispeed = 100, },
		},
		--["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	--迷你杀虫剂(中间剪了一点点)
	[11032] =	--SkillBaseData\技能过程\30\名人14桃花仙绝技2收招1\名人14桃花仙绝技2收招1.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, end_time = 300, newecm = "普通攻击3", seektime = 400, transtime = 100, anispeed = 200, },
		},
		--["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	--丰收之力(用前半段)
	[11034] =	--SkillBaseData\技能过程\30\名人14桃花仙绝技3出招\名人14桃花仙绝技3出招.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, end_time = -1, newecm = "休闲动作2", seektime = 0, transtime = 100, anispeed = 200, },
		},
		--["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	--奇迹之刺(前半不变，中段循环，末尾不要)
	[11036] =	--SkillBaseData\技能过程\30\名人14桃花仙绝技4出招\名人14桃花仙绝技4出招.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, end_time = -1, newecm = "技能攻击2", seektime = 0, transtime = 100, anispeed = 100, },
		},
		--["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[11037] =	--SkillBaseData\技能过程\30\名人14桃花仙绝技4收招1\名人14桃花仙绝技4收招1.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, end_time = 600, newecm = "技能攻击2", seektime = 700, transtime = 100, anispeed = 100, },
		},
		--["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	--幻影桃花斩(前半前跳，后半群攻后跳回)
	[11038] =	--SkillBaseData\技能过程\30\名人14桃花仙大招出招\名人14桃花仙大招出招.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, end_time = -1, newecm = "技能攻击1", seektime = 0, transtime = 100, anispeed = 100, },
		},
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[13529] =	--SkillBaseData\技能过程\30\名人14桃花仙大招收招2\名人14桃花仙大招收招2.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	-------hint	15童百熊
	--刀斩(去掉末尾空动作)
	[11040] =	--SkillBaseData\技能过程\30\名人15童百熊招式出招\名人15童百熊招式出招.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, end_time = -1, newecm = "普通攻击1", seektime = 0, transtime = 100, anispeed = 200, },
		},
		--["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	--内力损毁
	[11042] =	--SkillBaseData\技能过程\30\名人15童百熊绝技1出招\名人15童百熊绝技1出招.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, end_time = 650, newecm = "普通攻击3", seektime = 0, transtime = 100, anispeed = 100, },
		},
		--["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	--瞬间移动
	[11044] =	--SkillBaseData\技能过程\30\名人15童百熊绝技2收招1\名人15童百熊绝技2收招1.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, end_time = -1, newecm = "普通攻击2", seektime = 0, transtime = 100, anispeed = 200, },
		},
		["HMove"] = { {start_time = -200, end_time = -1, hacc = -20}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	--内功护盾
	[11046] =	--SkillBaseData\技能过程\30\名人15童百熊绝技3出招\名人15童百熊绝技3出招.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, end_time = 500, newecm = "休闲动作2", seektime = 1600, transtime = 100, anispeed = 100, },
		},
		--["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	--乾坤爆裂
	[11048] =	--SkillBaseData\技能过程\30\名人15童百熊绝技4出招\名人15童百熊绝技4出招.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, end_time = 900, newecm = "普通攻击3", seektime = 800, transtime = 100, anispeed = 100, },
		},
		--["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	--白虎狂乱(全用，平均循环出伤害)
	[11050] =	--SkillBaseData\技能过程\30\名人15童百熊大招出招\名人15童百熊大招出招.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, end_time = -1, newecm = "技能攻击2", seektime = 0, transtime = 100, anispeed = 100, },
		},
		--["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	-------hint	16老头子
	--拳击
	[11052] =	--SkillBaseData\技能过程\30\名人16老头子招式出招\名人16老头子招式出招.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, end_time = -1, newecm = "普通攻击1", seektime = 0, transtime = 100, anispeed = 200, },
		},
		--["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	--垃圾倾倒
	[11054] =	--SkillBaseData\技能过程\30\名人16老头子绝技1出招\名人16老头子绝技1出招.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, end_time = -1, newecm = "普通攻击3", seektime = 0, transtime = 100, anispeed = 100, },
		},
		--["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	--大力投掷
	[11056] =	--SkillBaseData\技能过程\30\名人16老头子绝技2收招1\名人16老头子绝技2收招1.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, end_time = -1, newecm = "技能攻击2", seektime = 0, transtime = 100, anispeed = 100, },
		},
		--["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	--钢筋铁骨
	[11058] =	--SkillBaseData\技能过程\30\名人16老头子绝技3出招\名人16老头子绝技3出招.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, end_time = 600, newecm = "休闲动作2", seektime = 800, transtime = 100, anispeed = 100, },
		},
		--["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	--返老还童
	[11060] =	--SkillBaseData\技能过程\30\名人16老头子绝技4出招\名人16老头子绝技4出招.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, end_time = 1000, newecm = "状态技能", seektime = 300, transtime = 100, anispeed = 100, },
		},
		--["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	--火焰之舞
	[11062] =	--SkillBaseData\技能过程\30\名人16老头子大招出招\名人16老头子大招出招.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, end_time = -1, newecm = "技能攻击1", seektime = 0, transtime = 100, anispeed = 100, },
		},
		--["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	------------------------------------------------
	--hint	宠物怪用技能
	------------------------------------------------
	----------------可能是聚贤庄用怪----------------
	[6444] =	--SkillBaseData\技能过程\32\副本打手boss技能1_收招\副本打手boss技能1_收招.tmpl
	{
		["HMove"] = { {start_time = 75, end_time = -250, hacc = 30}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[6421] =	--SkillBaseData\技能过程\32\副本人偶boss技能1_出招\副本人偶boss技能1_出招.tmpl
	{
		["HMove"] = { {start_time = 250, end_time = -1, hacc = 30}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[6475] =	--SkillBaseData\技能过程\32\副本小丫鬟boss技能4_出招\副本小丫鬟boss技能4_出招.tmpl
	{
		["ModifyECM"] = { {start_time = 0, end_time = -1, newecm = "施法动作4", seektime = 0, transtime = 150, anispeed = 20},	},
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[6477] =	--SkillBaseData\技能过程\32\副本小丫鬟boss技能4_收招2\副本小丫鬟boss技能4_收招2.tmpl
	{
		["ModifyECM"] = { {start_time = 0, end_time = -1, newecm = "施法动作4", seektime = 400, transtime = 150, anispeed = 100},	},
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	------------------------------------------------
	--hint	门派较旧版本过程（暂未使用）
	------------------------------------------------
	[188] =		--空手攻击1	SkillBaseData\技能过程\2\pt_空手攻击1_少林_出招\pt_空手攻击1_少林_出招.tmpl
	{
		["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 60},	},
		--["HMove"] = { {start_time = 0, end_time = 500, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[231] =		--转身抽棍	SkillBaseData\技能过程\2\zd1_转你脸_少林_出招\zd1_转你脸_少林_出招.tmpl
	{
		["ModifyECM"] = { {start_time = 0, newecm = "zd1_转身抽棍_少林", seektime = 300, transtime = 50, anispeed = 100},	},
		["VMove"] = { {start_time = 0, end_time = -1, vg = -100, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[1243] =	--翻滚连棍	SkillBaseData\技能过程\2\zd1_翻滚连棍_少林_出招\zd1_翻滚连棍_少林_出招.tmpl

	{
		["ModifyECM"] = { {start_time = 0, newecm = "zd_翻滚连棍_少林", seektime = 0, transtime = 150, anispeed = 100}, },
		--["HMove"] = { {start_time = 0, end_time = 500, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = 500, vg = -70, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[1260] =	--右重拳	SkillBaseData\技能过程\2\zd_右重拳_少林_出招\zd_右重拳_少林_出招.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 100, transtime = 50, anispeed = 100},	},
		--["HMove"] = { {start_time = 0, end_time = 500, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[1262] =	--左重拳	SkillBaseData\技能过程\2\zd_左重拳_少林_出招\zd_左重拳_少林_出招.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 100, transtime = 50, anispeed = 100},	},
		--["HMove"] = { {start_time = 0, end_time = 500, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[1253] =	--无影手	SkillBaseData\技能过程\2\zd_无影手_少林_收招1\zd_无影手_少林_收招1.tmpl
	{
		--["ModifyECM"] =	{ {start_time = 0, newecm = "zd_无影手_少林", seektime = 366, transtime = 50, anispeed = 100}, },
		--["HMove"] = { {start_time = 0, end_time = 500, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[1270] =	--前顶	SkillBaseData\技能过程\2\zd_前顶_少林_出招\zd_前顶_少林_出招.tmpl
	{
		["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 75},	},
		--["HMove"] = { {start_time = 0, end_time = 500, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[1447] =	--SkillBaseData\技能过程\2\zd_背转碓_少林_蓄力\zd_背转碓_少林_蓄力.tmpl
	{
		["ModifyECM"] =	{ {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 30},	},
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[144] =		--SkillBaseData\技能过程\2\zd_旋转右轮_少林_出招\zd_旋转右轮_少林_出招.tmpl
	{
		["ModifyECM"] =	{ {start_time = 0, newecm = "", seektime = 100, transtime = 100, anispeed = 100, mid = "旋转右轮", pre = {"zd", "zd1", "zd2", "zd3"}}, },
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[1448] =	--SkillBaseData\技能过程\2\pt_空手攻击3_少林_蓄力\pt_空手攻击3_少林_蓄力.tmpl
	{
		["ModifyECM"] = {
						{start_time = 0, newecm = "pt_空手攻击3起_空手", seektime = 0, transtime = 100, anispeed = 100},
						{start_time = 800, newecm = "pt_空手攻击3蓄力_空手", seektime = 0, transtime = 100, anispeed = 100},
		},
		--["HMove"] = { {start_time = 0, end_time = 2200, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = 2200, vg = -30.6, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[1597] =	--SkillBaseData\技能过程\2\V1_pt_空手攻击3_少林_收招1\V1_pt_空手攻击3_少林_收招1.tmpl
	{
		["ModifyECM"] = {{start_time = 0, newecm = "pt_空手攻击3击中_空手", seektime = 0, transtime = 100, anispeed = 100}, },
		--["HMove"] = { {start_time = 0, end_time = 2200, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = 2200, vg = -30.6, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[1590] =  	--SkillBaseData\技能过程\2\V1_pt_空手攻击1_少林_出招\V1_pt_空手攻击1_少林_出招.tmpl
	{
		["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 100, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[1592] =  	--SkillBaseData\技能过程\2\V1_pt_空手攻击2_少林_出招\V1_pt_空手攻击2_少林_出招.tmpl
	{
		["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 175, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[1600] =  	--SkillBaseData\技能过程\2\V1_pt_空手攻击4_少林_出招\V1_pt_空手攻击4_少林_出招.tmpl
	{
		["ModifyECM"] = { {start_time = 0, newecm = "pt_空手攻击4_少林", seektime = 200, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[1621] =  	--SkillBaseData\技能过程\2\V1_pt_空手攻击9_少林_出招\V1_pt_空手攻击9_少林_出招.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100}, },
		--["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 200, end_time = 600, vg = -20, init_speed = 0,speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[1634] =  	--SkillBaseData\技能过程\2\V1_zd_左上棍点_少林_出招\V1_zd_左上棍点_少林_出招.tmpl
	{
		["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 100, anispeed = 75}, },
		["HMove"] = { {start_time = 100, end_time = 300, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[1645] =  	--SkillBaseData\技能过程\2\V1_zd1_转身下劈_少林_出招\V1_zd1_转身下劈_少林_出招.tmpl
	{
		["ModifyECM"] = { {start_time = 0, newecm = "zd_转身下劈_少林", seektime = 0, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = 200, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 200, end_time = -1, vg = -300, init_speed = 0,speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[1655] =	--跳下劈棍	SkillBaseData\技能过程\2\V1_zd_跳下劈棍_少林_出招\V1_zd_跳下劈棍_少林_出招.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "zd_跳下劈棍_少林", seektime = 0, transtime = 50, anispeed = 80}, },
		--["HMove"] = { {start_time = 0, end_time = 500, hacc = 0}, },
		["VMove"] = { {start_time = 400, end_time = 800, vg = -100, init_speed = 0,speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[1657] =  	--SkillBaseData\技能过程\2\V1_zd_三节棍腾空下劈1_少林_出招\V1_zd_三节棍腾空下劈1_少林_出招.tmpl
	{
		["ModifyECM"] = { {start_time = 0, newecm = "zd_三节棍腾空下劈_少林", seektime = 500, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[1659] =  	--SkillBaseData\技能过程\2\V1_zd_三节棍腾空下劈2_少林_出招\V1_zd_三节棍腾空下劈2_少林_出招.tmpl
	{
		["ModifyECM"] = { {start_time = 0, newecm = "zd_三节棍腾空下劈_少林", seektime = 1300, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	--[[
	[9241] =  	 --少林滚翻滚出招	SkillBaseData\技能过程\2\V5_zd_三节棍腾空下劈_少林_出招\V5_zd_三节棍腾空下劈_少林_出招.tmpl
	{
		["ModifyECM"] = { {start_time = 0, end_time = 600, newecm = "zd_三节棍腾空下劈_少林", seektime = 0, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[9241] =  	 --少林滚翻滚连打	SkillBaseData\技能过程\2\V5_zd_三节棍腾空下劈_少林_出招\V5_zd_三节棍腾空下劈_少林_出招.tmpl
	{
		["ModifyECM"] = { {start_time = 0, end_time = 500, newecm = "zd_三节棍腾空下劈_少林", seektime = 600, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[9243] =  	--少林滚翻滚收招	SkillBaseData\技能过程\2\V5_zd_三节棍腾空下劈_少林_收招2\V5_zd_三节棍腾空下劈_少林_收招2.tmpl
	{
		["ModifyECM"] = { {start_time = 0, newecm = "zd_三节棍腾空下劈_少林", seektime = 1100, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[9243] =  	--少林滚翻滚结尾	SkillBaseData\技能过程\2\V5_zd_三节棍腾空下劈_少林_收招2\V5_zd_三节棍腾空下劈_少林_收招2.tmpl
	{
		["ModifyECM"] = { {start_time = 0, end_time = -2, newecm = "", seektime = 0, transtime = 150, anispeed = 100}, },
	},
]]
	[1664] =  	--SkillBaseData\技能过程\2\V1_zd_大连击1_少林_出招\V1_zd_大连击1_少林_出招.tmpl
	{
		["ModifyECM"] = { {start_time = 0, newecm = "zd_大连击1_少林", seektime = 1700, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[1716] =  	--SkillBaseData\技能过程\2\V1_zd_无影手_少林_出招2\V1_zd_无影手_少林_出招2.tmpl
	{
		["ModifyECM"] = { {start_time = 0, newecm = "zd_无影手_少林", seektime = 375, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[1717] =  	--SkillBaseData\技能过程\2\V1_zd1_旋转右抡_少林_出招2\V1_zd1_旋转右抡_少林_出招2.tmpl
	{
		["ModifyECM"] = { {start_time = 0, newecm = "zd1_旋转右抡_少林", seektime = 100, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[1720] =  	--SkillBaseData\技能过程\2\V1_zd1_旋转右抡_少林_出招3\V1_zd1_旋转右抡_少林_出招3.tmpl
	{
		["ModifyECM"] = { {start_time = 0, newecm = "zd1_旋转右抡_少林", seektime = 100, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[1650] =	--SkillBaseData\技能过程\2\V1_zd_下劈弹棍_少林_收招1\V1_zd_下劈弹棍_少林_收招1.tmpl
	{
		["ModifyECM"] = { {start_time = 0, newecm = "zd_下劈弹棍_少林", seektime = 100, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[246] =  	--SkillBaseData\技能过程\1\套路熟练空当\套路熟练空当.tmpl
	{
		["ModifyECM"] = { {start_time = 0, newecm = "zs_起手_少林", seektime = 0, transtime = 50, anispeed = 100}, },
		--["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[3787] =  	--SkillBaseData\技能过程\2\V2_zd_跨步冲棍_少林_出招\V2_zd_跨步冲棍_少林_出招.tmpl
	{
		["ModifyECM"] = { {start_time = 0, newecm = "zd_跨步冲棍_少林", seektime = 0, transtime = 100, anispeed = 200}, },
		--["HMove"] = { {start_time = 0, end_time = 400, hacc = -100}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[3788] =  	--SkillBaseData\技能过程\2\V2_zd_跨步冲棍_少林_收招\V2_zd_跨步冲棍_少林_收招.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = 0, end_time = 400, hacc = -100}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[3792] =  	--SkillBaseData\技能过程\2\zd1_三节棍普攻右扫_少林_收招\zd1_三节棍普攻右扫_少林_收招.tmpl
	{
		["ModifyECM"] = { {start_time = 350, newecm = "zd_三节棍左双抡_少林", seektime = 0, transtime = 100, anispeed = 100}, },
		--["HMove"] = { {start_time = 0, end_time = 400, hacc = -100}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[4999] =	--SkillBaseData\技能过程\3\zd_一剑穿心_武当_出招\zd_一剑穿心_武当_出招.tmpl
	{
		["ModifyECM"] = { {start_time = 0, newecm = "zd_一剑穿心_武当", seektime = 500, transtime = 100, anispeed = 175}, },
		--["HMove"] = { {start_time = 200, end_time = 750, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[4992] =  	--V2_zd_横扫2连击_武当_出招
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = 0, end_time = 300, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[4995] =  	--V2_zd_转身右重劈_武当_出招
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = 0, end_time = 450, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[5218] =  	--SkillBaseData\技能过程\3\zd_左劈剑蓄力_武当_出招\zd_左劈剑蓄力_武当_出招.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 100, anispeed = 100}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[5233] =  	--SkillBaseData\技能过程\3\zd_左劈剑蓄力_武当_出招2\zd_左劈剑蓄力_武当_出招2.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 100, anispeed = 70}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[5234] =  	--SkillBaseData\技能过程\3\zd_左劈剑蓄力_武当_收招1\zd_左劈剑蓄力_武当_收招1.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, newecm = "", seektime = 0, transtime = 100, anispeed = 75},},
		--["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[5240] =  	--SkillBaseData\技能过程\3\zd_正挑_武当_出招\zd_正挑_武当_出招.tmpl
	{
		["ModifyECM"] = { {start_time = 700, newecm = "", seektime = 0, transtime = 100, anispeed = 200},},
		--["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[2396] =  	--SkillBaseData\技能过程\3\zd_反身跳劈_武当_出招\zd_反身跳劈_武当_出招.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 100, anispeed = 75},},
		["VMove"] = { {start_time = 600, end_time = 1100, vg = -50, init_speed = 0,speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[2421] =  	--SkillBaseData\技能过程\3\zd_跳下钻_武当_出招\zd_跳下钻_武当_出招.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = 150, end_time = 1150, hacc = 0}, },
		["VMove"] = { {start_time = 150, end_time = 1150, vg = -30, init_speed = 0,speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[17478] =	--单脚斜下刺	SkillBaseData\技能过程\4\zd_单脚斜下刺_华山_出招\zd_单脚斜下刺_华山_出招.tmpl
	{
		--["ModifyECM"] =	{ {start_time = 0, newecm = "zd_单脚斜下刺_华山", seektime = 200, transtime = 150, anispeed = 100},	},
		--["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 400, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[1319] =	--横跨步竖砍	SkillBaseData\技能过程\4\zd_横跨步竖砍_华山_出招\zd_横跨步竖砍_华山_出招.tmpl
	{
		--["ModifyECM"] =	{ {start_time = 0, newecm = "zd_单脚斜下刺_华山", seektime = 200, transtime = 150, anispeed = 100},	},
		["HMove"] = { {start_time = 200, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 200, end_time = -1, vg = -300, init_speed = 40, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[1337] =	--插地	SkillBaseData\技能过程\4\zd_插地_华山_出招\zd_插地_华山_出招.tmpl
	{
		["ModifyECM"] =	{ {start_time = 0, newecm = "zd_插地_华山", seektime = 300, transtime = 150, anispeed = 100},	},
		--["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[1323] =	--身前饶剑	SkillBaseData\技能过程\4\zd_身前绕剑_华山_出招\zd_身前绕剑_华山_出招.tmpl
	{
		["ModifyECM"] =	{ {start_time = 0, newecm = "zd_身前绕剑_华山", seektime = 50, transtime = 150, anispeed = 100},	},
		--["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[1325] =	--前刺		SkillBaseData\技能过程\4\zd_前刺_华山_出招\zd_前刺_华山_出招.tmpl
	{
		["ModifyECM"] =	{ {start_time = 0, newecm = "zd_前刺_华山", seektime = 400, transtime = 150, anispeed = 100},	},
		--["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[1333] =	--侧身翻	SkillBaseData\技能过程\4\zd_侧身翻_华山_出招\zd_侧身翻_华山_出招.tmpl
	{
		["ModifyECM"] =	{ {start_time = 0, newecm = "zd_侧身翻_华山", seektime = 150, transtime = 150, anispeed = 100},	},
		--["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[1335] = 	--SkillBaseData\技能过程\4\zd_大斜上挑_华山_出招\zd_大斜上挑_华山_出招.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[1363] =  	--SkillBaseData\技能过程\4\zd_旋转上撩剑_华山_出招\zd_旋转上撩剑_华山_出招.tmpl
	{
		["ModifyECM"] = { {start_time = 0, newecm = "zd_旋转上撩剑_华山", seektime = 250, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[1351] =  	--SkillBaseData\技能过程\4\zd_左斜上挑_华山_出招\zd_左斜上挑_华山_出招.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = 150, end_time = 450, hacc = 0}, },
		["VMove"] = { {start_time = 150, end_time = 450, vg = -100, init_speed = 0,speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[1331] =  	--SkillBaseData\技能过程\4\zd_大斜上挑循环_华山_出招\zd_大斜上挑循环_华山_出招.tmpl
	{
		["ModifyECM"] = { {start_time = 0, newecm = "zd_大斜上挑循环_华山", seektime = 0, transtime = 150, anispeed = 80},},
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[1988] =	--SkillBaseData\技能过程\4\zd_剑花_华山_收招2\zd_剑花_华山_收招2.tmpl
	{
		-- 循环段：anispeed按照nCycleCount从speed_arr里取。超出的部分按最后一个值。
		["ModifyECM"] = { {start_time = 0, newecm = "zd_剑花_华山", seektime = 0, transtime = 100, anispeed = 100},},
		--["HMove"] = { {start_time = 200, end_time = 700, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[1989] =	--SkillBaseData\技能过程\4\zd_剑花_华山_收招3\zd_剑花_华山_收招3.tmpl
	{
		-- 循环段：anispeed按照nCycleCount从speed_arr里取。超出的部分按最后一个值。
		["ModifyECM"] = { {start_time = 900, newecm = "zd_身前绕剑循环_华山", seektime = 50, transtime = 150, anispeed = 100},},
		--["HMove"] = { {start_time = 200, end_time = 700, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[17829] =  	--SkillBaseData\技能过程\4\zd_右劈强化_华山_出招\zd_右劈强化_华山_出招.tmpl
	{
		["ModifyECM"] = { {start_time = 967, newecm = "zd_身前饶剑循环_华山", seektime = 0, transtime = 150, anispeed = 100},
				--{start_time = -500, newecm = "zd_右劈_华山", seektime = 0, transtime = 150, anispeed = 100},
				},
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[1992] =  	--SkillBaseData\技能过程\4\zd_跨步右砍强化_华山_出招\zd_跨步右砍强化_华山_出招.tmpl
	{
		["ModifyECM"] = { {start_time = 500, newecm = "zd_跨步右砍_华山", seektime = 0, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[1994] =  	--SkillBaseData\技能过程\4\zd_大斜上挑_华山_收招2\zd_大斜上挑_华山_收招2.tmpl
	{
		["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[1995] =  	--SkillBaseData\技能过程\4\zd_大斜上挑_华山_收招3\zd_大斜上挑_华山_收招3.tmpl
	{
		["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[1982] =  	--SkillBaseData\技能过程\4\zd_连环踢1_华山_出招\zd_连环踢1_华山_出招.tmpl
	{
		["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -50, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[1984] =  	--SkillBaseData\技能过程\4\zd_连环踢2_华山_出招\zd_连环踢2_华山_出招.tmpl
	{
		["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -50, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[1986] =  	--SkillBaseData\技能过程\4\zd_连环踢3_华山_出招\zd_连环踢3_华山_出招.tmpl
	{
		["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -50, init_speed = 0,speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[3858] =  	--SkillBaseData\技能过程\4\V1_zd_回剑准备_华山_出招\V1_zd_回剑准备_华山_出招.tmpl
	{
		["ModifyECM"] = { {start_time =450, newecm = "zd_回剑准备循环_华山", seektime = 0, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[4347] =  	--SkillBaseData\技能过程\4\V2_zd_疾风直刺_华山_出招\V2_zd_疾风直刺_华山_出招.tmpl
	{
		["ModifyECM"] = { {start_time = 0, newecm = "zd_疾风直刺_华山", seektime = 1000, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = 0, end_time = 200, hacc = 10}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[5387] =  	--SkillBaseData\技能过程\4\zd_回剑准备_华山\zd_回剑准备_华山.tmpl
	{
		["ModifyECM"] = { {start_time = 450, newecm = "zd_回剑准备循环_华山", seektime = 0, transtime = 100, anispeed = 100},},
		--["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[1421] =	--SkillBaseData\技能过程\4\zd_后撤刺_华山_出招\zd_后撤刺_华山_出招.tmpl
	{
		["ModifyECM"] =	{ {start_time = 0, newecm = "zd_后撤刺_华山", seektime = 400, transtime = 150, anispeed = 100},	},
		--["HMove"] = { {start_time = 300, end_time = 450, hacc = 0}, },
		--["VMove"] = { {start_time = 350, end_time = 800, vg = -75}, },
	},

	[8133] =   	--剑宗疾风直刺	SkillBaseData\技能过程\1\个人测试技能4_出招\个人测试技能4_出招.tmpl
	{
		--["ModifyECM"] = {
		--{start_time = 0, newecm = "", seektime = 0, transtime = 100, anispeed = 120, },
		--},
		--["HMove"] = { {start_time = 0, end_time = 150, hacc = 0}, },
		["VMove"] = { {start_time = 500, end_time = -1, vg = 250, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[8134] =   	--剑宗疾风直刺	SkillBaseData\技能过程\1\个人测试技能4_收招1\个人测试技能4_收招1.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, newecm = "", seektime = 0, transtime = 250, anispeed = 120, },
		},
		["HMove"] = { {start_time = 0, end_time = 150, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = 100, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[6308] =	--位移穿刺5	SkillBaseData\技能过程\4\zd_位移穿刺1_华山_收招\zd_位移穿刺1_华山_收招.tmpl
	{
		["ModifyECM"] = {{start_time = 0, newecm = "", seektime = 0, transtime = 100, anispeed = 100}, },
		["HMove"] = { {start_time = 0, end_time = 150, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[8136] =  	--SkillBaseData\技能过程\1\个人测试技能4_收招3\个人测试技能4_收招3.tmpl
	{
		["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = 0, end_time = 150, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[8131] =  	--SkillBaseData\技能过程\1\个人测试技能3_出招\个人测试技能3_出招.tmpl
	{
		["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 100, anispeed = 100}, },
		["HMove"] = { {start_time = 500, end_time = 1100, hacc = 0}, },
		["VMove"] = { {start_time = 500, end_time = 1100, vg = -80, init_speed = 100, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[4623] =  	--华山旋风腿出招	SkillBaseData\技能过程\4\切换姿态常规\切换姿态常规.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, newecm = "zd_旋风腿转三圈_华山", seektime = 0, transtime = 100, anispeed = 100},
		},
		["VMove"] = { {start_time = 0, end_time = -1, vg = -3, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[4624] =  	--华山旋风腿收招	SkillBaseData\技能过程\4\切换姿态御剑\切换姿态御剑.tmpl
	{
		--["ModifyECM"] = {
		--{start_time = 0, newecm = "", seektime = 300, transtime = 100, anispeed = 100},
		--},
		["VMove"] = { {start_time = 0, end_time = -1, vg = -3, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[5388] =  	--华山旋风腿收招	SkillBaseData\技能过程\4\zd_旋风腿_华山_收招2\zd_旋风腿_华山_收招2.tmpl
	{
		--["ModifyECM"] = {
		--{start_time = 0, newecm = "", seektime = 0, transtime = 100, anispeed = 100},
		--},
		["VMove"] = { {start_time = 0, end_time = -1, vg = -3, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[6622] =  	--华山旋风腿收招	SkillBaseData\技能过程\4\zd_旋风腿_华山_收招3\zd_旋风腿_华山_收招3.tmpl
	{
		--["ModifyECM"] = {
		--{start_time = 0, newecm = "", seektime = 1650, transtime = 100, anispeed = 100},
		--},
		["VMove"] = { {start_time = 0, end_time = -1, vg = -3, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[17443] =	--横跨步竖砍	SkillBaseData\技能过程\4\zd_剑宗跳跃投技_华山_出招\zd_剑宗跳跃投技_华山_出招.tmpl
	{
		--["ModifyECM"] =	{ {start_time = 0, newecm = "zd_单脚斜下刺_华山", seektime = 200, transtime = 150, anispeed = 100},	},
		["HMove"] = { {start_time = 150, end_time = 500, hacc = 0}, },
		["VMove"] = { {start_time = 150, end_time = 500, vg = -300, init_speed = 100, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[6411] =   	--zd_升龙1加强_华山	SkillBaseData\技能过程\4\zd_升龙1加强_华山_收招\zd_升龙1加强_华山_收招.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = 100, hacc = 0}, },
	},
	[5665] =  	--恒山-双剑-四段位移斩后二段1	SkillBaseData\技能过程\5\zd_四段位移斩后二段_恒山_收招\zd_四段位移斩后二段_恒山_收招.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = 300, hacc = 200}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[5707] =  	--恒山-双剑-四段位移斩后二段1	SkillBaseData\技能过程\5\zd_四段位移斩后二段_恒山_收招2\zd_四段位移斩后二段_恒山_收招2.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = 200, hacc = 200}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[5697] =  	--恒山-双剑-四段位移斩后二段2	SkillBaseData\技能过程\5\zd_四段位移斩后二段2_恒山_收招\zd_四段位移斩后二段2_恒山_收招.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = 300, hacc = 200}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[5708] =  	--恒山-双剑-四段位移斩后二段2	SkillBaseData\技能过程\5\zd_四段位移斩后二段2_恒山_收招2\zd_四段位移斩后二段2_恒山_收招2.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = 200, hacc = 200}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[5574] =  	--SkillBaseData\技能过程\6\zd_幻影消失攻击_衡山_出招\zd_幻影消失攻击_衡山_出招.tmpl
	{
		--["ModifyECM"] = {
		--{start_time = 0, newecm = "", seektime = 0, transtime = 100, anispeed = 300},
		--{start_time = 300, newecm = "zd_幻影消失_衡山", seektime = 400, transtime = 100, anispeed = 100},
		--{start_time = 600, newecm = "zd_幻影消失_衡山", seektime = 400, transtime = 100, anispeed = 100},
		--},
		["HMove"] = { {start_time = 800, end_time = 900, hacc = 50}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[5575] =  	--SkillBaseData\技能过程\6\zd_幻影消失攻击_衡山_收招\zd_幻影消失攻击_衡山_收招.tmpl
	{
		--["ModifyECM"] = {
		--{start_time = 0, newecm = "zd_幻影消失_衡山", seektime = 400, transtime = 100, anispeed = 100},
		--},
		["HMove"] = { {start_time = 150, end_time = 200, hacc = 200}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[5576] =  	--SkillBaseData\技能过程\6\zd_幻影消失攻击_衡山_收招2\zd_幻影消失攻击_衡山_收招2.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, newecm = "", seektime = 0, transtime = 100, anispeed = 100},
		},
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = 50, vg = -2000, init_speed = 100, speed_flag = SPEEDFLAG_FORCEDEFINE,},
				{start_time = 200, end_time = 450, vg = -300, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,},},
	},
	[5563] =  	--SkillBaseData\技能过程\6\zd_抬剑插中间_衡山_收招2\zd_抬剑插中间_衡山_收招2.tmpl
	{
		--["ModifyECM"] = {
		--{start_time = 0, newecm = "zd_幻影消失_衡山", seektime = 400, transtime = 100, anispeed = 100},
		--},
		["HMove"] = { {start_time = 0, end_time = 50, hacc = 200}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[5558] =  	--SkillBaseData\技能过程\6\zd_冲锋斩(幻影原地)_衡山_出招\zd_冲锋斩(幻影原地)_衡山_出招.tmpl
	{
		--["ModifyECM"] = {
		--{start_time = 0, newecm = "zd_幻影消失_衡山", seektime = 400, transtime = 100, anispeed = 100},
		--},
		["HMove"] = { {start_time = 0, end_time = 50, hacc = 200}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[1763] =  	--日月-双刀-绞杀	SkillBaseData\技能过程\7\zd_绞杀_日月_出招\zd_绞杀_日月_出招.tmpl
	{
		["ModifyECM"] = {
			{start_time = 0, newecm = "", seektime = 0, transtime = 100, anispeed = 100},
		},
		["HMove"] = { {start_time = 250, end_time = 400, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[1786] =  	--日月-双刀-倒转身旋杀	SkillBaseData\技能过程\7\zd_倒转身旋杀_日月_出招\zd_倒转身旋杀_日月_出招.tmpl
	{
		["ModifyECM"] = {
			{start_time = 0, newecm = "", seektime = 0, transtime = 100, anispeed = 100},
		},
		["HMove"] = { {start_time = 150, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 150, end_time = -1, vg = -9.8, init_speed = 6.5,speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[1787] =  	--SkillBaseData\技能过程\7\zd_倒转身旋杀_日月_收招1\zd_倒转身旋杀_日月_收招1.tmpl
	{
		["ModifyECM"] = {
			{start_time = 0, newecm = "", seektime = 0, transtime = 100, anispeed = 100},
		},
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = 550, vg = -24, init_speed = 0,speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[5730] =  	--SkillBaseData\技能过程\7\zd_高速旋转_日月_收招2\zd_高速旋转_日月_收招2.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, newecm = "zd_高速旋转_日月", seektime = 1350, transtime = 100, anispeed = 100},
		},
		--["HMove"] = { {start_time = 200, end_time = 550, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	--[7435] =   	--zd_锁链群攻_日月2	SkillBaseData\技能过程\7\zd_锁链群攻2_日月_出招\zd_锁链群攻2_日月_出招.tmpl
	--{
		--["ModifyECM"] = {
		--{start_time = 0, newecm = "zd_锁链群攻_日月", seektime = 700, transtime = 100, anispeed = 100},
		--},
		--["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	--},
	--[7437] =   	--zd_锁链群攻_日月3	SkillBaseData\技能过程\7\zd_锁链群攻3_日月_出招\zd_锁链群攻3_日月_出招.tmpl
	--{
		--["ModifyECM"] = {
		--{start_time = 0, newecm = "zd_锁链群攻_日月", seektime = 1500, transtime = 100, anispeed = 100},
		--},
		--["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	--},
	--[7439] =   	--zd_锁链群攻_日月4	SkillBaseData\技能过程\7\zd_锁链群攻4_日月_出招\zd_锁链群攻4_日月_出招.tmpl
	--{
		--["ModifyECM"] = {
		--{start_time = 0, newecm = "zd_锁链群攻_日月", seektime = 2500, transtime = 100, anispeed = 100},
		--},
		--["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	--},
	[7475] =   		--铲腿投技1
	{
		["ModifyECM"] = {
		{start_time = 0, newecm = "zd_下踹_日月", seektime = 0, transtime = 100, anispeed = 100},
		},
		["HMove"] = { {start_time = 100, end_time = 400, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[7476] =   		--铲腿投技2
	{
		["ModifyECM"] = {
		{start_time = 150, newecm = "zd_抹脖子摔投_日月", seektime = 0, transtime = 100, anispeed = 100},
		},
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[7477] =   		--铲腿投技2
	{
		["HMove"] = { {start_time = 0, end_time = 350, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[7566] =		--zd_双膝升龙_日月   1
	{
		["ModifyECM"] = {
		{start_time = 0, newecm = "", seektime = 0, transtime = 100, anispeed = 100},
		},
		["HMove"] = { {start_time = 150, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 150, end_time = -1, vg = -30, init_speed = 4.5, speed_flag = SPEEDFLAG_FORCEDEFINE,}, },
	},
	[7567] =   		--zd_双膝升龙_日月   2
	{
		["ModifyECM"] = {
		{start_time = 0, newecm = "", seektime = 0, transtime = 100, anispeed = 100},
		},
		["HMove"] = { {start_time = 100, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 100, end_time = -1, vg = -40, init_speed = 8,speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[7473] =   	--zd_下踹_日月	SkillBaseData\技能过程\7\zd_下踹_日月_出招\zd_下踹_日月_出招.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, newecm = "", seektime = 0, transtime = 100, anispeed = 100},
		},
		["HMove"] = { {start_time = 300, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 150, end_time = -1, vg = -40, init_speed = 8, speed_flag = SPEEDFLAG_FORCEDEFINE,}, },
	},
	[7607] =   	--zd_旋踢冲天锁链_日月
	{
		["ModifyECM"] = {
		{start_time = 0, newecm = "zd_旋踢冲天锁链_日月", seektime = 500, transtime = 100, anispeed = 100},
		},
		--["HMove"] = { {start_time = 300, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 150, end_time = -1, vg = -40, init_speed = 8, speed_flag = SPEEDFLAG_FORCEDEFINE,}, },
	},
	[3823] =  	--SkillBaseData\技能过程\8\zd_凤舞旋转_五毒_出招\zd_凤舞旋转_五毒_出招.tmpl
	{
		["ModifyECM"] = { {start_time =450, newecm = "zd_回剑准备循环_华山", seektime = 0, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[1835] =  	--SkillBaseData\技能过程\8\zd_施法攻击6_五毒_收招1\zd_施法攻击6_五毒_收招1.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, newecm = "", seektime = 0, transtime = 100, anispeed = 133},
		},
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[4362] =  	--SkillBaseData\技能过程\8\zd1_抽地前冲_五毒_收招\zd1_抽地前冲_五毒_收招.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 80}, },
		["HMove"] = { {start_time = 200, end_time = 700, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[1835] =  	--SkillBaseData\技能过程\8\zd_施法攻击6_五毒_收招1\zd_施法攻击6_五毒_收招1.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, newecm = "", seektime = 0, transtime = 100, anispeed = 133},
		},
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[1371] =	--逍遥合扇攻击3	SkillBaseData\技能过程\9\zd_合扇攻击3_逍遥_出招\zd_合扇攻击3_逍遥_出招.tmpl
	{
		["ModifyECM"] =	{ {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 70},	},
		--["HMove"] = { {start_time = 400, end_time = 600, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[1375] =	--逍遥下铲腿	SkillBaseData\技能过程\9\zd_下铲腿_逍遥_出招\zd_下铲腿_逍遥_出招.tmpl
	{
		--["ModifyECM"] =	{ {start_time = 0, newecm = "zd_大斜上挑_华山", seektime = 150, transtime = 150, anispeed = 100},	},
		["HMove"] = { {start_time = 400, end_time = 600, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[1393] =	--逍遥潇洒转扇	SkillBaseData\技能过程\9\zd_潇洒转扇_逍遥_出招\zd_潇洒转扇_逍遥_出招.tmpl
	{
		["ModifyECM"] =	{ {start_time = 0, newecm = "zd_潇洒转扇_逍遥", seektime = 0, transtime = 150, anispeed = 90},	},
		["HMove"] = { {start_time = 200, end_time = 500, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[1403] =	--逍遥倒钩凌空	SkillBaseData\技能过程\9\zd_倒钩凌空_逍遥_出招\zd_倒钩凌空_逍遥_出招.tmpl
	{
		--["ModifyECM"] =	{ {start_time = 400, newecm = "", seektime = 150, transtime = 150, anispeed = 100},	},
		--["HMove"] = { {start_time = 300, end_time = 450, hacc = 0}, },
		["VMove"] = { {start_time = 350, end_time = 800, vg = -75}, },
	},
	[9107] =	--SkillBaseData\技能过程\9\V5_zd_空中连踩_逍遥_收招1\V5_zd_空中连踩_逍遥_收招1.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = 250, end_time = 250, hacc = 0}, },
		["VMove"] = { {start_time = 250, end_time = 250, vg = -10, init_speed = 0,speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[1518] =	--SkillBaseData\技能过程\10\zd_后空翻_唐门_出招\zd_后空翻_唐门_出招.tmpl
	{
		["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 130}, },
		["HMove"] = { {start_time = 150, end_time = 600, hacc = 0}, },
		--["VMove"] = { {start_time = 200, end_time = -1, vg = -100, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[5159] =  	--唐门火箭跳	SkillBaseData\技能过程\10\zd_空中三连射击_唐门_出招\zd_空中三连射击_唐门_出招.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 130}, },
		["VMove"] = { {start_time = 100, end_time = -1, vg = -10, init_speed = 0,speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[5160] =  	--SkillBaseData\技能过程\10\zd_空中三连射击_唐门_收招1\zd_空中三连射击_唐门_收招1.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = 0, end_time = 1050, hacc = -50, },
					},
		["VMove"] = { {start_time = 0, end_time = 400, vg = -10, init_speed = 5, speed_flag = SPEEDFLAG_FORCEDEFINE, },
					  {start_time = 400, end_time = 1050, vg = -10, init_speed = 0,speed_flag = SPEEDFLAG_FORCE_BELOW,},
					},
	},
	[5280] =	--SkillBaseData\技能过程\10\zd_必杀1_唐门\zd_必杀1_唐门.tmpl
	{
		["ModifyECM"] = {
						{start_time = 0, newecm = "zd_拳套连续射击2_唐门", seektime = 500, transtime = 100, anispeed = 100},
		},
		--["HMove"] = { {start_time = 0, end_time = 2200, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = 2200, vg = -30.6, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[7749] =   	--zd_烟雾弹_唐门	SkillBaseData\技能过程\10\zd_转身向天炮发射_唐门_收招1\zd_转身向天炮发射_唐门_收招1.tmpl
	{
		["HMove"] = { {start_time = 100, end_time = 400, hacc = 0}, },
		["VMove"] = { {start_time = 100, end_time = 400, vg = -10, init_speed = 0,speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[2444] =  	--SkillBaseData\技能过程\11\zd_旋转下劈_峨嵋_出招\zd_旋转下劈_峨嵋_出招.tmpl
	{
		["ModifyECM"] = {
		{start_time = 0, newecm = "", seektime = 0, transtime = 100, anispeed = 100},
		},
		["HMove"] = { {start_time = 0, end_time = 1000, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	------------------------------------------------
	--名人变身
	------------------------------------------------
	[16293] =  	--SkillBaseData\技能过程\30\名人技能_过程_令狐冲_回旋剑气出招2\名人技能_过程_令狐冲_回旋剑气出招2.tmpl
	{
		["ModifyECM"] =
		{
			{start_time = 0, newecm = "", seektime = 0, transtime = 100, anispeed = 200},
		},
	},
	[16297] =  	--SkillBaseData\技能过程\30\名人技能_过程_令狐冲_吸人强刺出招2\名人技能_过程_令狐冲_吸人强刺出招2.tmpl
	{
		["ModifyECM"] =
		{
			{start_time = 0, newecm = "", seektime = 0, transtime = 100, anispeed = 200},
		},
	},
	[16404] =  	--SkillBaseData\技能过程\30\名人技能_过程_岳灵珊_大力横砍收招\名人技能_过程_岳灵珊_大力横砍收招.tmpl
	{
		["ModifyECM"] =
		{
			{start_time = 0, newecm = "", seektime = 0, transtime = 100, anispeed = 140},
		},
	},
	[16405] =  	--SkillBaseData\技能过程\30\名人技能_过程_岳灵珊_大力横砍收招\名人技能_过程_岳灵珊_大力横砍收招.tmpl
	{
		["ModifyECM"] =
		{
			{start_time = 0, newecm = "", seektime = 0, transtime = 100, anispeed = 120},
		},
	},
	[16409] =  	--SkillBaseData\技能过程\30\名人技能_过程_岳灵珊_犀牛望月收招1\名人技能_过程_岳灵珊_犀牛望月收招1.tmpl
	{
		["ModifyECM"] =
		{
			{start_time = 0, newecm = "", seektime = 0, transtime = 100, anispeed = 160},
		},
		["HMove"] = { {start_time = 0, end_time = 400, hacc = -20}, },
	},
	[16410] =  	--SkillBaseData\技能过程\30\名人技能_过程_岳灵珊_犀牛望月收招1\名人技能_过程_岳灵珊_犀牛望月收招2.tmpl
	{
		["ModifyECM"] =
		{
			{start_time = 0, newecm = "", seektime = 0, transtime = 100, anispeed = 200},
		},
	},
	------------------------------------------------
	--hint	初版全门派抓投必杀过程（暂未使用）
	------------------------------------------------
	[5176] =	--SkillBaseData\技能过程\2\zd_抓投1_少林_出招\zd_抓投1_少林_出招.tmpl	少林抓投
	{
		["ModifyECM"] =	{ {start_time = 0, newecm = "zd1_抓投1_少林", seektime = 0, transtime = 200, anispeed = 100,	}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[5178] =	--SkillBaseData\技能过程\2\zd_抓投1_少林_抓住\zd_抓投1_少林_抓住.tmpl	少林抓投2
	{
		["ModifyECM"] = { {start_time = 0, newecm = "zd1_抓投1_少林", seektime = 6000, transtime = 150, anispeed = 100},
		{start_time = 1900, newecm = "zd_震飞_少林", seektime = 200, transtime = 100, anispeed = 100},},
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -10, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[5285] =	--SkillBaseData\技能过程\2\zd1_抓投1_少林_出招\zd1_抓投1_少林_出招.tmpl	少林抓投
	{
		["ModifyECM"] =	{ {start_time = 0, newecm = "zd_抓投1_少林", seektime = 0, transtime = 200, anispeed = 100,	}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[5289] =	--SkillBaseData\技能过程\3\zd_抓投1_武当_出招\zd_抓投1_武当_出招.tmpl	武当抓投
	{
		["ModifyECM"] =	{ {start_time = 0, newecm = "zd_抓投1_武当", seektime = 0, transtime = 200, anispeed = 100,	}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[5293] =	--SkillBaseData\技能过程\4\zd_抓投1_华山_出招\zd_抓投1_华山_出招.tmpl	华山抓投
	{
		["ModifyECM"] =	{ {start_time = 0, newecm = "zd_抓投1_华山", seektime = 0, transtime = 200, anispeed = 100,	}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[5297] =	--SkillBaseData\技能过程\8\zd_抓投1_五仙_出招\zd_抓投1_五仙_出招.tmpl	五仙抓投
	{
		["ModifyECM"] =	{ {start_time = 0, newecm = "zd_抓投1_五仙", seektime = 0, transtime = 200, anispeed = 100,	}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[5301] =	--SkillBaseData\技能过程\9\zd_抓投1_逍遥_出招\zd_抓投1_逍遥_出招.tmpl	逍遥抓投
	{
		["ModifyECM"] =	{ {start_time = 0, newecm = "zd_抓投1_逍遥", seektime = 0, transtime = 200, anispeed = 100,	}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[5305] =	--SkillBaseData\技能过程\10\zd_抓投1_唐门_出招\zd_抓投1_唐门_出招.tmpl	唐门抓投
	{
		["ModifyECM"] =	{ {start_time = 0, newecm = "zd_抓投1_唐门", seektime = 0, transtime = 200, anispeed = 100,	}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[5192] =	--唐门必杀1	SkillBaseData\技能过程\10\zd_必杀1_唐门_出招\zd_必杀1_唐门_出招.tmpl
	{
		["ModifyECM"] =	{ {start_time = 0, newecm = "zd_必杀1_唐门", seektime = 0, transtime = 200, anispeed = 100,	}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[5322] =	--唐门必杀2	SkillBaseData\技能过程\10\zd_必杀2_唐门_出招\zd_必杀2_唐门_出招.tmpl
	{
		["ModifyECM"] =	{ {start_time = 0, newecm = "zd_必杀2_唐门", seektime = 0, transtime = 200, anispeed = 100,	}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[5277] =	--武当必杀	SkillBaseData\技能过程\3\zd_必杀1_武当_出招\zd_必杀1_武当_出招.tmpl
	{
		["ModifyECM"] =	{ {start_time = 0, newecm = "zd_必杀1_武当", seektime = 0, transtime = 200, anispeed = 100,	}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[5278] =	--逍遥必杀	SkillBaseData\技能过程\9\zd_必杀1_逍遥_出招\zd_必杀1_逍遥_出招.tmpl
	{
		["ModifyECM"] =	{ {start_time = 0, newecm = "zd_必杀1_逍遥", seektime = 0, transtime = 200, anispeed = 100,	}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[5279] =	--五毒必杀	SkillBaseData\技能过程\8\zd_必杀1_五毒_出招\zd_必杀1_五毒_出招.tmpl
	{
		["ModifyECM"] =	{ {start_time = 0, newecm = "zd_必杀1_五毒", seektime = 0, transtime = 200, anispeed = 100,	}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[5309] =	--五毒必杀	SkillBaseData\技能过程\2\zd_必杀1_少林_出招\zd_必杀1_少林_出招.tmpl
	{
		["ModifyECM"] =	{ {start_time = 0, newecm = "zd_必杀1_少林", seektime = 0, transtime = 200, anispeed = 100,	}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	------------------------------------------------
	--hint	测试用过程（暂未使用）
	------------------------------------------------
	[297] =		--SkillBaseData\技能过程\1\通用轻功用过程\通用轻功用过程.tmpl
	{
		["ModifyECM"] = { {start_time = 0, newecm = "zs_翻桥_通用", seektime = 0, transtime = 150, anispeed = 60},	},
		["HMove"] = { {start_time = 0, end_time = 650, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = 650, vg = -59.6, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[1275] =	--SkillBaseData\技能过程\1\轻功方案2测试1\轻功方案2测试1.tmpl
	{
		["ModifyECM"] = { {start_time = 0, newecm = "zs_翻桥_通用", seektime = 0, transtime = 150, anispeed = 60},	},
		["HMove"] = { {start_time = 0, end_time = 1200, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = 1200, vg = -39.6, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[1276] =	--SkillBaseData\技能过程\1\轻功方案2测试2\轻功方案2测试2.tmpl
	{
		["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 60},	},
		["HMove"] = { {start_time = 0, end_time = 600, hacc = 0, init_speed = 1},
					  {start_time = 600, end_time = -1, hacc = -3, init_speed = 20},
					},
		["VMove"] = { {start_time = 0, end_time = 600, vg = -9.8, init_speed = 6},
					  {start_time = 600, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,},
		 			},
	},
	[1277] =	--SkillBaseData\技能过程\1\轻功方案2测试3\轻功方案2测试3.tmpl
	{
		["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 90},	},
		["HMove"] = { {start_time = 0, end_time = 1200, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = 1200, vg = -39.6, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[1278] =	--SkillBaseData\技能过程\1\轻功方案2测试4\轻功方案2测试4.tmpl
	{
		["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 60},	},
		["HMove"] = { {start_time = 0, end_time = 2200, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = 2200, vg = -30.6, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[1279] =	--SkillBaseData\技能过程\1\轻功方案2测试5\轻功方案2测试5.tmpl
	{
		["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 75}, },
		["HMove"] = { {start_time = 0, end_time = 2200, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = 2200, vg = -30.6, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[1582] =	--SkillBaseData\技能过程\1\人物通用普攻吟唱\人物通用普攻吟唱.tmpl
	{
		["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100, pre = {"pt"}, mid = "攻击1",},	},
		--["HMove"] = { {start_time = 0, end_time = 1000, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[5031] =	--SkillBaseData\技能过程\1\01V1通用挑衅技能_过程1\01V1通用挑衅技能_过程1.tmpl
	{
		["ModifyECM"] =	{ {start_time = 0, newecm = "bq_手指前方_通用", seektime = 0, transtime = 150, anispeed = 100},	},
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[163] = --转身下劈
	{
		["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 150, anispeed = 100}, },
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -100, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[171] = --正方向冲锋位移
	{
		--["ModifyECM"] =	{ {start_time = 0, newecm = "", seektime = 100, transtime = 100, anispeed = 100, mid = "转身下劈", pre = {"zd", "zd1", "zd2", "zd3"}},	},
		["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[172] = --目的点冲锋位移
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 100, anispeed = 100, mid = "转身下劈", pre = {"zd", "zd1", "zd2", "zd3"}},	},
		["VMove"] = { {start_time = 0, end_time = -1, vg = -10, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	},
	[173] = --正方向跳跃位移
	{
		["ModifyECM"] =	{ {start_time = 0, newecm = "zd_转身下劈_少林", seektime = 0, transtime = 100, anispeed = 100},	},
		["HMove"] = { {start_time = 0, end_time = 720, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = 720, vg = -10, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[174] = --目的点跳跃位移
	{
		["ModifyECM"] = { {start_time = 0, newecm = "zd_转身下劈_少林", seektime = 100,transtime = 100,  anispeed = 100},	},
		["HMove"] = { {start_time = 0, end_time = 720, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = 720, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[7826] =  	--SkillBaseData\技能过程\29\测试对定位器位移过程2\测试对定位器位移过程2.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 400, transtime = 100, anispeed = 100},	},
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = -60, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[7827] =  	--SkillBaseData\技能过程\29\测试对定位器位移过程3\测试对定位器位移过程3.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 400, transtime = 100, anispeed = 100},	},
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = -1, vg = 100, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[10742] =  	--SkillBaseData\技能过程\26\捕快_徘徊动作段数1\捕快_徘徊动作段数1.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 400, transtime = 100, anispeed = 100},	},
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
	},
	[10743] =  	--SkillBaseData\技能过程\26\捕快_徘徊动作段数2\捕快_徘徊动作段数2.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 400, transtime = 100, anispeed = 100},	},
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
	},
	[10744] =  	--SkillBaseData\技能过程\26\捕快_徘徊动作段数3\捕快_徘徊动作段数3.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 400, transtime = 100, anispeed = 100},	},
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
	},
	[10745] =  	--SkillBaseData\技能过程\26\捕快_徘徊动作段数4\捕快_徘徊动作段数4.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 400, transtime = 100, anispeed = 100},	},
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
	},
    [10729] =  	--SkillBaseData\技能过程\26\捕快_NPC移动技能段数1\捕快_NPC移动技能段数1.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 400, transtime = 100, anispeed = 100},	},
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
	},
    [10731] =  	--SkillBaseData\技能过程\26\捕快_NPC移动技能2段数1\捕快_NPC移动技能2段数1.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 400, transtime = 100, anispeed = 100},	},
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
	},
	------------------------------------------------
	--hint	有问题(模板名和动作对不上、不知用在什么地方了)
	------------------------------------------------
	--[1366] =	--逍遥合扇攻击4	SkillBaseData\技能过程\9\zd_合扇攻击4_逍遥_收招1\zd_合扇攻击4_逍遥_收招1.tmpl
	--{
		----["ModifyECM"] =	{ {start_time = 0, newecm = "zd_大斜上挑_华山", seektime = 150, transtime = 150, anispeed = 100},	},
		--["HMove"] = { {start_time = 0, end_time = 200, hacc = 50}, },
		----["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	--},
	--[5735] =  	--SkillBaseData\技能过程\7\zd_锁链冲撞_日月_收招1\zd_锁链冲撞_日月_收招1.tmpl
	--{
		--["ModifyECM"] = {
		--{start_time = 0, newecm = "zd_幻影消失_衡山", seektime = 400, transtime = 100, anispeed = 100},
		--},
		--["HMove"] = { {start_time = 50, end_time = 150, hacc = 50}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = -9.8, init_speed = 0, speed_flag = SPEEDFLAG_FORCE_BELOW,}, },
	--},
	[6034] =  	--SkillBaseData\技能过程\29\恶头陀_浮屠刀法·二式_出招\恶头陀_浮屠刀法·二式_出招.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 3000, transtime = 100, anispeed = 100},	},
		["HMove"] = { {start_time = 450, end_time = 700, hacc = 0}, },
		--["VMove"] = { {start_time = 0, end_time = -1, vg = 0, init_speed = 0, speed_flag = SPEEDFLAG_FORCEDEFINE,}, },
	},

	[10485] =  	--SkillBaseData\芗艤诮詫\29\英藬讛吱位欠位訂诮詫3\英藬讛吱位欠位訂诮詫3.tmpl
	{
		["ModifyECM"] = { {start_time = 0, newecm = "pt_扔物品_通用", seektime = 850, end_time = 650, transtime = 100, anispeed = 100},	},
	},

	[10498] =  	--SkillBaseData\芗艤诮詫\29\英藬讛吱位欠位訂诮詫3\英藬讛吱位欠位訂诮詫3.tmpl
	{
		["ModifyECM"] = { {start_time = 0, newecm = "pt_扔物品_通用", seektime = 850, end_time = 650, transtime = 100, anispeed = 100},	},
	},

	[10499] =  	--SkillBaseData\芗艤诮詫\29\英藬讛吱位欠位訂诮詫3\英藬讛吱位欠位訂诮詫3.tmpl
	{
		["ModifyECM"] = { {start_time = 0, newecm = "pt_扔物品_通用", seektime = 850, end_time = 650, transtime = 100, anispeed = 100},	},
	},

	[10507] =  	--SkillBaseData\芗艤诮詫\29\英藬讛吱位欠位訂诮詫3\英藬讛吱位欠位訂诮詫3.tmpl
	{
		["ModifyECM"] = { {start_time = 0, newecm = "pt_扔物品_通用", seektime = 850, end_time = 650, transtime = 100, anispeed = 100},	},
	},


	[10508] =  	--SkillBaseData\芗艤诮詫\29\英藬讛吱位欠位訂诮詫3\英藬讛吱位欠位訂诮詫3.tmpl
	{
		["ModifyECM"] = { {start_time = 0, newecm = "pt_扔物品_通用", seektime = 850, end_time = 650, transtime = 100, anispeed = 100},	},
	},
	------------------------------------------------
	--hint	副本乱入田伯光位移技能
	------------------------------------------------
	[16152] =	--田伯光旋转1段
	{
		["HMove"] = { {start_time = 0, end_time = 250, hacc = 0}, },
	},
	[16153] =	--田伯光旋转2段
	{
		["HMove"] = { {start_time = 0, end_time = 250, hacc = 0}, },
	},
	[16154] =	--田伯光旋转3段
	{
		["HMove"] = { {start_time = 0, end_time = 250, hacc = 0}, },
	},
	[16155] =	--田伯光旋转4段
	{
		["HMove"] = { {start_time = 0, end_time = 250, hacc = 0}, },
	},
	[16155] =	--田伯光旋转3段
	{
		["HMove"] = { {start_time = 0, end_time = 250, hacc = 0}, },
	},
	[16156] =	--田伯光旋转4段
	{
		["HMove"] = { {start_time = 0, end_time = 250, hacc = 0}, },
	},
	[16168] =	--田伯光冲击1段
	{
		["HMove"] = { {start_time = 0, end_time = 300, hacc = 0}, },
	},
	[16169] =	--田伯光冲击1段隐身
	{
		["HMove"] = { {start_time = 0, end_time = 550, hacc = 0}, },
	},
	[16170] =	--田伯光冲击2段
	{
		["HMove"] = { {start_time = 0, end_time = 300, hacc = 0}, },
	},
	[16171] =	--田伯光冲击2段隐身
	{
		["HMove"] = { {start_time = 0, end_time = 550, hacc = 0}, },
	},
	[16172] =	--田伯光冲击3段
	{
		["HMove"] = { {start_time = 0, end_time = 300, hacc = 0}, },
	},
	[16691] =	--恶囚劈砍位移
	{
		["HMove"] = { {start_time = 0, end_time = 500, hacc = 0}, },
	},
	[16806] =	--恶囚跳跃入场
	{
		["HMove"] = { {start_time = 0, end_time = 1200, hacc = -100}, },
		["VMove"] = { {start_time = 0, end_time = 1200, vg = -60, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[16715] =	--牢头技能旋转
	{
		["HMove"] = { {start_time = 0, end_time = 360, hacc = 0}, },
	},
	[16810] =	--牢头旋转入场
	{
		["HMove"] = { {start_time = 0, end_time = 1800, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = 1800, vg = -10, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[16814] =	--牢头跳跃入场
	{
		["HMove"] = { {start_time = 0, end_time = 950, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = 950, vg = -15, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[17991] =	--守卫瞬移
	{
		["HMove"] = { {start_time = 0, end_time = 50, hacc = 0}, },
	},
	[16752] =	--刽子手突击三段位移
	{
		["HMove"] = { {start_time = 0, end_time = 950, hacc = 0}, },
	},
	[16749] =	--刽子手突击一段位移
	{
		["HMove"] = { {start_time = 0, end_time = 750, hacc = 0}, },
	},
	[16750] =	--刽子手突击二段位移
	{
		["HMove"] = { {start_time = 0, end_time = 600, hacc = 0}, },
	},
	[16760] =	--刽子手入场跳跃
	{
		["HMove"] = { {start_time = 0, end_time = 950, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = 950, vg = -20, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[16812] =	--刽子手跳跃入场
	{
		["HMove"] = { {start_time = 0, end_time = 950, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = 950, vg = -20, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[16820] =	--刽子手突击跳跃
	{
		["HMove"] = { {start_time = 0, end_time = 950, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = 950, vg = -10, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[17992] =	--陷阱守卫瞬移入场
	{
		["HMove"] = { {start_time = 0, end_time = 50, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = 50, vg = -5, init_speed = 0, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	[18437] =	--汤英鹗晓提舞剑一段
	{
		["HMove"] = { {start_time = 0, end_time = 325, hacc = 0}, },
	},
	[18439] =	--汤英鹗晓提舞剑二段
	{
		["HMove"] = { {start_time = 0, end_time = 200, hacc = 0}, },
	},
	[18442] =	--汤英鹗晓提舞剑三段
	{
		["HMove"] = { {start_time = 0, end_time = 175, hacc = 0}, },
	},
	[18428] =	--汤英鹗吸收能量
	{
		["HMove"] = { {start_time = 0, end_time = 650, hacc = 0}, },
	},
	[18461] =	--汤英鹗吸收能量
	{
		["HMove"] = { {start_time = 0, end_time = 650, hacc = 0}, },
	},
	------------------------------------------------
	--hint	绝情谷技能
	------------------------------------------------
	[18215] =	--SkillBaseData\技能过程\27\绝情谷邪道大护法瞬步1过程段1\绝情谷邪道大护法瞬步1过程段1.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
	},
	[18217] =	--SkillBaseData\技能过程\27\绝情谷邪道大护法瞬步2过程段1\绝情谷邪道大护法瞬步2过程段1.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
	},
	[18225] =	--SkillBaseData\技能过程\27\绝情谷主快剑前突_突刺位移\绝情谷主快剑前突_突刺位移.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
	},
	[18240] =	--SkillBaseData\技能过程\27\绝情谷主寒冰突刺_突刺位移\绝情谷主寒冰突刺_突刺位移.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
	},

	------------------------------------------------
	--hint	嵩山之路
	------------------------------------------------
	[19027] =  	--SkillBaseData\技能过程\29\嵩山之巅_岳不群_腾空\嵩山之巅_岳不群_腾空.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "", seektime = 0, transtime = 100, anispeed = 100},	},
		["HMove"] = { {start_time = 0, end_time = 875, hacc = 0}, },
		["VMove"] = { {start_time = 0, end_time = 875, vg = -10, init_speed = 3, speed_flag = SPEEDFLAG_AUTO,}, },
	},

	-------------------------------------------------
	--hint	帮派年兽活动
	------------------------------------------------
	[19181] =  	--SkillBaseData\技能过程\28\帮派活动年兽_震地_出招\帮派活动年兽_震地_出招.tmpl
	{
		--["ModifyECM"] = { {start_time = 0, newecm = "震地", seektime = 1400, transtime = 100, anispeed = 100},	},
		["HMove"] = { {start_time = 1400, end_time = -1, hacc = 0}, },
		--["VMove"] = { {start_time = 1400, end_time = -1, vg = -10, init_speed = 3, speed_flag = SPEEDFLAG_AUTO,}, },
	},
	------------------------------------------------
	--hint	嵩山之巅
	------------------------------------------------
	[19500] =	--钟镇迷踪1段
	{
		["HMove"] = { {start_time = 0, end_time = 2300, hacc = 0}, },
	},
	-------------------------------------------------
	--hint	大漠三环
	------------------------------------------------
	[19896] =  	--SkillBaseData\技能过程\29\大漠三环刺客_旋转一伤\大漠三环刺客_旋转一伤.tmpl
{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
	},
	[19897] =  	--SkillBaseData\技能过程\29\大漠三环刺客_旋转二伤\大漠三环刺客_旋转二伤.tmpl
{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
	},
    -------------------------------------------------
	--hint	玄境化界
	-------------------------------------------------
	[21564] =  	--SkillBaseData\技能过程\29\玄境化界_帝青BOSS_御扇急袭出招\玄境化界_帝青BOSS_御扇急袭出招.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
	},
	[21565] =  	--SkillBaseData\技能过程\29\玄境化界_帝青BOSS_御扇急袭出招\玄境化界_帝青BOSS_御扇急袭收招.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
	},
	[21566] =  	--SkillBaseData\技能过程\29\玄境化界_帝青BOSS_瞬间移动出招\玄境化界_帝青BOSS_瞬间移动出招.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
	},
	[21613] =  	--SkillBaseData\技能过程\29\玄境化界_帝青BOSS_瞬间移动钻地\玄境化界_帝青BOSS_瞬间移动钻地.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
	},
	[21567] =  	--SkillBaseData\技能过程\29\玄境化界_帝青BOSS_瞬间移动收招\玄境化界_帝青BOSS_瞬间移动收招.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
	},
	[21593] =  	--SkillBaseData\技能过程\29\玄境化界_白虎BOSS_虎扑出招\玄境化界_白虎BOSS_虎扑出招.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
	},
	[21609] =  	--SkillBaseData\技能过程\29\玄境化界_白虎BOSS_虎扑冲锋\玄境化界_白虎BOSS_虎扑冲锋.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
	},
	[21594] =  	--SkillBaseData\技能过程\29\玄境化界_白虎BOSS_虎扑收招\玄境化界_白虎BOSS_虎扑收招.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
	},
	[21595] =  	--SkillBaseData\技能过程\29\玄境化界_白虎BOSS_猛抓出招\玄境化界_白虎BOSS_猛抓出招.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
	},
	[21596] =  	--SkillBaseData\技能过程\29\玄境化界_白虎BOSS_猛抓收招1\玄境化界_白虎BOSS_猛抓收招1.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
	},
	[21597] =  	--SkillBaseData\技能过程\29\玄境化界_白虎BOSS_猛抓收招1\玄境化界_白虎BOSS_猛抓收招1.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
	},
	[21598] =  	--SkillBaseData\技能过程\29\玄境化界_白虎BOSS_猛抓收招1\玄境化界_白虎BOSS_猛抓收招1.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
	},
	[21599] =  	--SkillBaseData\技能过程\29\玄境化界_白虎BOSS_猛抓收招1\玄境化界_白虎BOSS_猛抓收招1.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
	},
	[21600] =  	--SkillBaseData\技能过程\29\玄境化界_白虎BOSS_猛抓收招1\玄境化界_白虎BOSS_猛抓收招1.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
	},
    -------------------------------------------------
	--hint	4V1地阴
	-------------------------------------------------
	[21765] =  	--SkillBaseData\技能过程\29\4V1卡牌_剑圣_冲锋斩出招\4V1卡牌_剑圣_冲锋斩出招.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
	},
	[21766] =  	--SkillBaseData\技能过程\29\4V1卡牌_剑圣_冲锋斩冲锋\4V1卡牌_剑圣_冲锋斩冲锋.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
	},
	[21767] =  	--SkillBaseData\技能过程\29\4V1卡牌_剑圣_冲锋斩收招\4V1卡牌_剑圣_冲锋斩收招.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
	},
	[21795] =  	--SkillBaseData\技能过程\29\4V1地阴_血蝙蝠_冲锋出招\4V1地阴_血蝙蝠_冲锋出招.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
	},
	[21796] =  	--SkillBaseData\技能过程\29\4V1地阴_血蝙蝠_冲锋收招\4V1地阴_血蝙蝠_冲锋收招.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
	},
	[21880] =  	--SkillBaseData\技能过程\29\4V1地阴_血蝙蝠_冲锋结束\4V1地阴_血蝙蝠_冲锋结束.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
	},
    -------------------------------------------------
	--hint	武罗职业技能
	-------------------------------------------------
	[22419] =  	--SkillBaseData\技能过程\13\zd_大宗绝技03_武罗_提锤冲锋_出招\zd_大宗绝技03_武罗_提锤冲锋_出招.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
	},
	[22420] =  	--SkillBaseData\技能过程\13\zd_大宗绝技03_武罗_提锤冲锋_收招\zd_大宗绝技03_武罗_提锤冲锋_收招.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
	},
	[22408] =  	--SkillBaseData\技能过程\13\zd_专精绝技5_武罗_炮锤三连击_移动\zd_专精绝技5_武罗_炮锤三连击_出招.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
	},
	[22409] =  	--SkillBaseData\技能过程\13\zd_专精绝技5_武罗_炮锤三连击_出招\zd_专精绝技5_武罗_炮锤三连击_收招1.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
	},
	[22410] =  	--SkillBaseData\技能过程\13\zd_专精绝技5_武罗_炮锤三连击_收招2\zd_专精绝技5_武罗_炮锤三连击_收招2.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
	},
	[22411] =  	--SkillBaseData\技能过程\13\zd_专精绝技5_武罗_炮锤三连击_收招3\zd_专精绝技5_武罗_炮锤三连击_收招3.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
	},
    [22440] =  	--SkillBaseData\技能过程\13\zd_大宗绝技03_武罗_提锤冲锋_位移段\zd_大宗绝技03_武罗_提锤冲锋_位移段.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
	},
	[22491] =  	--SkillBaseData\技能过程\13\zd_大宗绝技03强化_武罗_提锤冲锋_位移段\zd_大宗绝技03强化_武罗_提锤冲锋_位移段.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
	},
	[22508] =  	--SkillBaseData\技能过程\13\zd_专精绝技5_武罗_炮锤三连击_移动\zd_专精绝技5_武罗_炮锤三连击_出招.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
	},
	[22509] =  	--SkillBaseData\技能过程\13\zd_专精绝技5_武罗_炮锤三连击_出招\zd_专精绝技5_武罗_炮锤三连击_收招1.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
	},
	[22510] =  	--SkillBaseData\技能过程\13\zd_专精绝技5_武罗_炮锤三连击_收招2\zd_专精绝技5_武罗_炮锤三连击_收招2.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
	},
	[22511] =  	--SkillBaseData\技能过程\13\zd_专精绝技5_武罗_炮锤三连击_收招3\zd_专精绝技5_武罗_炮锤三连击_收招3.tmpl
	{
		["HMove"] = { {start_time = 0, end_time = -1, hacc = 0}, },
	},
	-------------------------------------------------
	--hint	Add new codes here↑
}
SkillVisual.PerformParam_Replace = {
	[17481] = 1336,
	--[17476] = 1345,
	[17477] = 1346,
	[16945] = 1387,
	[17207] = 1522,
	[17062] = 1535,
	[17063] = 1536,
	[17109] = 1539,
	[17110] = 1540,
	[17538] = 1766,
	[16900] = 1834,
	[17474] = 2375,
	[17002] = 3783,
	[17003] = 3784,
	[16982] = 3815,
	[16932] = 4437,
	[16935] = 4442,
	[17308] = 4952,
	[17212] = 5148,
	[17221] = 5157,
	[17240] = 5419,
	[17230] = 5164,
	[17263] = 5219,
	[17265] = 5221,
	[17266] = 5222,
	--[17478] = 5389,
	[17064] = 5677,
	[17072] = 5695,
	[17073] = 5705,
	[17582] = 5736,
	[17578] = 5762,
	[17404] = 5787,
	[17405] = 5788,
	[17369] = 5791,
	[17368] = 5794,
	[17406] = 5795,
	[17407] = 5796,
	[17362] = 5809,
	[17363] = 5810,
	[17364] = 5811,
	[17365] = 5812,
	[17366] = 5813,
	[17454] = 6388,
	[17460] = 6389,
	[17461] = 6390,
	[17451] = 6397,
	--[17443] = 6701,
	--[17445] = 6703,
	[17544] = 7466,
	[17547] = 7469,
	[17533] = 7470,
	[17584] = 7473,
	[17587] = 7585,
	[17215] = 7765,
	[17289] = 7995,
	[19040] = 19039,
	[17602] = 8564,
	[16842] = 8588,
	[17616] = 8612,
	[17067] = 8749,
	[17068] = 8750,
	[17069] = 8751,
	[17054] = 8763,
	[17074] = 8796,
	[17075] = 8797,
	[17151] = 8814,
	[17119] = 8817,
	[17126] = 8824,
	[17128] = 8826,
	[17130] = 8828,
	[17162] = 8838,
	[17164] = 8840,
	[17168] = 8844,
	[17172] = 8848,
	[17132] = 8860,
	[17185] = 8866,
	[17189] = 8870,
	[17205] = 8875,
	[17202] = 8881,
	[16897] = 8931,
	[16898] = 8932,
	[16959] = 9102,
	[16980] = 9233,
	[16981] = 9234,
	[16986] = 9241,
	[16987] = 9242,
	[16988] = 9243,
	[17007] = 9255,
	[17009] = 9257,
	[17010] = 9258,
	[17011] = 9259,
	[17012] = 9260,
	[17013] = 9261,
	[17014] = 9262,
	[17032] = 9264,
	[17315] = 9306,
	--[17550] = 9329,
	[17552] = 9330,
	[17553] = 9331,
	[16956] = 9583,
	[16955] = 10218,
	[17034] = 10846,
	[17021] = 10968,
	[17023] = 10970,
	[17025] = 10972,
	[17106] = 11184,
	[16939] = 15837,
	[16951] = 15848,
	[17261] = 15890,
	[17015] = 15913,
	[17016] = 15914,
	[17376] = 15915,
	[17377] = 15916,
	[17378] = 15917,
	[17379] = 15918,
	[17380] = 15919,
	[17381] = 15920,
	[17382] = 15921,
	[17383] = 15922,
	[17384] = 15923,
	[17385] = 15924,
	[17386] = 15925,
	[17351] = 15928,
	[16858] = 15939,
	[16860] = 15940,
	[16861] = 15941,
	[16862] = 15942,
	[17310] = 15950,
	[17101] = 15993,
	[17306] = 15996,
	[17634] = 16231,
	[16859] = 16302,
	[17540] = 16676,
	[18677] = 18674,
        [16910] = 15832,
	[17442] = 8138,
	[15443] = 6701,
	[15445] = 6703,
	[17460] = 6389,
	[17461] = 6390,
	[17463] = 1314,
	[17513] = 1322,
	[17464] = 1349,
	[17538] = 1766,
	[17539] = 5745,
	[20931] = 20644,
	[20645] = 20645,
	[20965] = 20807,
	[20927] = 20633,
	[20942] = 20774,
	[20947] = 20659,
	[20948] = 20772,
	[20935] = 20649,
	

}

SkillVisual.WuluoConfig = 
{
	["modelpath"] = "models\\players\\形象\\武罗\\躯干\\武罗.ecm",
	["headskin"] = "models\\customface\\人类_萝莉变身武罗_头_表情.smd",
	["clothesskin"] = "Models\\Players\\时装\\门派时装\\衣服\\zmp门派昆仑女衣服01.ski",
	["hairskin"] = "models\\players\\时装\\门派时装\\帽子\\zmp门派昆仑女帽子01\\zmp门派昆仑女帽子01.ecm",
	["ToSkillPerform"] = 22353,
	["ToSkillGfx"] = "人物\\技能\\武罗\\身体周围\\萝莉变身成女光.gfx",
	["ToOriginPerform"] = 22352,
	["ToOriginGfx"] = "人物\\技能\\武罗\\身体周围\\萝莉变身成女光.gfx",
	["portraitOffset_x"] = 0.0,
	["portraitOffset_y"] = 0.7,
	["portraitOffset_z"] = 0.0,
	["stance_id"] = 22353,
	["specialSkill"] = 
	{
		8959, 8960
	}
}

SkillVisual.CustomWuluoConfig = 
{
	["clothes"] = 
	{
		"Models\\Players\\时装\\门派时装\\衣服\\zmp门派昆仑女衣服01.ski",
		"Models\\Players\\时装\\门派时装\\衣服\\zmp门派昆仑女衣服02.ski",
		"Models\\Players\\时装\\门派时装\\衣服\\zmp门派昆仑女衣服03.ski",
	},
	
	["hair"] = 
	{
		"models\\players\\时装\\门派时装\\帽子\\zmp门派昆仑女帽子01\\zmp门派昆仑女帽子01.ecm",
		"models\\players\\时装\\门派时装\\帽子\\zmp门派昆仑女帽子02\\zmp门派昆仑女帽子02.ecm",
		"models\\players\\时装\\门派时装\\帽子\\zmp门派昆仑女帽子03\\zmp门派昆仑女帽子03.ecm",
		"models\\players\\时装\\门派时装\\帽子\\zmp门派昆仑女帽子04\\zmp门派昆仑女帽子04.ecm",
	}
}
