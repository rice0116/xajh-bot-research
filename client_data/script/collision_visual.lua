---------------------------------------------------------------
--  技能碰撞检测表现脚本
---------------------------------------------------------------

SkillCollision = {}

function SkillCollision:GetAllSkillPerformData()
	return SkillCollisionPerformDefine	
end

---------------------------------------------------------------
-- collision 参数
--
--  技能开始（动作开始）         perform时间点
--     |
----   |__________________[___________:_________________]_________
--     0   window_pre_offset(-80) (offset 0)  window_post_offset(100)
--
-- 在window_pre_offset之前来的伤害，会攒到window_pre_offset时刻播放
-- 在 [window_pre_offset, window_post_offset] 之间的伤害，会立刻播放
-- 在window_post_offset之后来的伤害，会立刻播放

-- 骨骼速度计算模式，可用"trackbonevel_mode"定义，不配则默认是TRACKBONEVEL_MODE_AVERAGE
local TRACKBONEVEL_MODE_AVERAGE = 1 --取几百ms内平均值
local TRACKBONEVEL_MODE_MAX     = 2	--取几百ms内最大值
-- 计算骨骼速度窗口时间（ms），可用"trackbonevel_windowtime"定义，不配则默认250ms。最大500ms。

-- 根据骨骼速度方向与Perform参考方向计算打击方向时，可用"referencedir_weight"配置参考方向的权重，默认0.75

-- ragdoll加力绕哪个轴旋转。可用"hitrotate_axis"定义，不配则默认是ROTATEAXIS_Y
local ROTATEAXIS_X = 0
local ROTATEAXIS_Y = 1
local ROTATEAXIS_Z = 2
-- ragdoll旋转的角度：用骨骼速度乘上"hitrotate_anglevel_ratio"定义的系数得出，默认20.0，最大100
-- ragdoll旋转的加力时间：可用"hitrotate_duration"定义，不配则默认200，最大1000

---------------------------------------通用填法------------------------------------------------------
--1，迅速出招技能填-50,50
--2，大部分位移技能和正常出招速度技能填-50,100
--3，较长准备时间的技能填150(较少)

-- 使用以下参数会覆盖SkillViewer中配置的数据：
-- range_type（0 矩形，1 扇形，2 圆形）
-- radius（矩形的宽，或者扇形、圆形的半径）
-- length（矩形的长）
-- angle（扇形的角度）
-- perform_time（perform时长）
-- direction（0 默认，1 从左向右，2 从右向左，3 从后向前，4 从前向后，5 随机）
-- 注意：radius、length、angle必须和range_type配合使用才有效

---填写的ID为技能ID，后面所标准的1、2、3、4为收招段1、2、3、4，没有伤害判定的段不填，特殊的如少林旋风棍应填写的判定段序号为0，即出招段

SkillCollisionPerformDefine = 
{
	------------------------------------------------
	--hint	默认配置
	------------------------------------------------
	[0] = --SkillID: 0为默认的技能配置
	{
		referencedir_weight = 0.75,
		hitrotate_anglevel_ratio = 5.0,
		hitrotate_duration = 200,
		Collision = --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand"	
			 	window_pre_offset = -50, window_post_offset = 50, },
		},
	},
	------------------------------------------------
	--hint	新手技能 
	------------------------------------------------
	[5469] = --SkillID: SkillBaseData\技能\1\01V1通用新手普攻技能拳打a\01V1通用新手普攻技能拳打a.tmpl
	{ 
		Collision =
		{
			[1] = { phys_ref_bone = "Bip01 R Hand", phys_ref_bone_female = "Bip01 L Hand",
			 	window_pre_offset = -50, window_post_offset = 100,
				range_type = 0, radius = 0.5, length = 2, perform_time = 600, direction = 3},
		},
	},
	[5470] = --SkillID: SkillBaseData\技能\1\01V1通用新手普攻技能拳打b\01V1通用新手普攻技能拳打b.tmpl
	{ 
		Collision =
		{
			[1] = { phys_ref_bone = "Bip01 L Hand", phys_ref_bone_female = "Bip01 R Hand",
			 	window_pre_offset = -50, window_post_offset = 100,
				range_type = 0, radius = 0.5, length = 2, perform_time = 550, direction = 3},
		},
	},
	[2711] = --SkillBaseData\技能\1\01V1通用新手普攻技能4\01V1通用新手普攻技能4.tmpl
	{ 
		trackbonevel_mode = TRACKBONEVEL_MODE_MAX,	--骨骼速度计算模式。不填默认是TRACKBONEVEL_MODE_AVERAGE
		Collision =
		{
			[1] = { phys_ref_bone = "Bip01 R Calf",  --挥动的骨头。不配默认是"Bip01 R Hand"	
			 	window_pre_offset = -50, window_post_offset = 50,
				direction = 1},
		},
	},
	------------------------------------------------
	--hint	大宗武学 
	------------------------------------------------
	[4548] = --SkillBaseData\技能\2\DZ_少林门派通用技能1\DZ_少林门派通用技能1.tmpl
	{ 
		Collision =
		{
			[1] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand"	
			 	window_pre_offset = -50, window_post_offset = 50,
				range_type = 1, radius = 3, angle = 60, perform_time = 250, direction = 2},
		},
	},
	[5408] = --SkillBaseData\技能\2\DZ_少林门派通用技能1_2\DZ_少林门派通用技能1_2.tmpl
	{ 
		Collision =
		{
			[1] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand"	
			 	window_pre_offset = -50, window_post_offset = 50,
				range_type = 1, radius = 3, angle = 60, perform_time = 550, direction = 1},
		},
	},
	[4549] = --SkillBaseData\技能\2\DZ_少林门派通用技能2\DZ_少林门派通用技能2.tmpl
	{ 
		Collision =
		{
			[1] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand"	
			 	window_pre_offset = -50, window_post_offset = 100,
				direction = 3},
		},
	},
	[4553] = --SkillBaseData\技能\2\DZ_少林门派通用技能6\DZ_少林门派通用技能6.tmpl
	{ 
		Collision =
		{
			[1] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand"	
			 	window_pre_offset = -50, window_post_offset = 150,
				direction = 1},
		},
	},
	[4554] = --SkillBaseData\技能\3\DZ_武当门派通用技能1\DZ_武当门派通用技能1.tmpl
	{ 
		Collision =
		{
			[1] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand"	
			 	window_pre_offset = -50, window_post_offset = 50,
				range_type = 1, radius = 3, angle = 60, perform_time = 250, direction = 2},
		},
	},
	[5409] = --SkillBaseData\技能\3\DZ_武当门派通用技能1_2\DZ_武当门派通用技能1_2.tmpl
	{ 
		Collision =
		{
			[1] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand"	
			 	window_pre_offset = -50, window_post_offset = 50,
				range_type = 0, radius = 0.5, length = 2, perform_time = 750, direction = 3},
		},
	},
	[4555] = --SkillBaseData\技能\3\DZ_武当门派通用技能2\DZ_武当门派通用技能2.tmpl
	{ 
		Collision =
		{
			[1] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand"	
			 	window_pre_offset = -50, window_post_offset = 150,
				direction = 2},
		},
	},
	[4559] = --SkillBaseData\技能\3\DZ_武当门派通用技能6\DZ_武当门派通用技能6.tmpl
	{ 
		Collision =
		{
			[1] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand"	
			 	window_pre_offset = -50, window_post_offset = 150,
				direction = 3},
		},
	},
	[4542] = --SkillBaseData\技能\4\DZ_华山门派通用技能1\DZ_华山门派通用技能1.tmpl
	{ 
		Collision =
		{
			[1] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand"	
			 	window_pre_offset = -50, window_post_offset = 50,
				range_type = 1, radius = 3, angle = 60, perform_time = 250, direction = 1},
		},
	},
	[5410] = --SkillBaseData\技能\4\DZ_华山门派通用技能1_2\DZ_华山门派通用技能1_2.tmpl
	{ 
		Collision =
		{
			[1] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand"	
			 	window_pre_offset = -50, window_post_offset = 50,
				range_type = 1, radius = 3, angle = 60, perform_time = 700, direction = 2},
		},
	},
	[4543] = --SkillBaseData\技能\4\DZ_华山门派通用技能2\DZ_华山门派通用技能2.tmpl
	{ 
		Collision =
		{
			[1] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand"	
			 	window_pre_offset = -50, window_post_offset = 50,
				direction = 1},
		},
	},
	[4544] = --SkillBaseData\技能\4\DZ_华山门派通用技能3\DZ_华山门派通用技能3.tmpl
	{ 
		Collision =
		{
			[1] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand"	
			 	window_pre_offset = -50, window_post_offset = 50,
				range_type = 1, radius = 3, angle = 60, direction = 1},
		},
	},
	[4545] = --SkillBaseData\技能\4\DZ_华山门派通用技能4\DZ_华山门派通用技能4.tmpl
	{ 
		Collision =
		{
			[1] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand"	
			 	window_pre_offset = -50, window_post_offset = 100,
				range_type = 0, radius = 1, length = 4, direction = 3},
		},
	},
	[4546] = --SkillBaseData\技能\4\DZ_华山门派通用技能5\DZ_华山门派通用技能5.tmpl
	{ 
		Collision =
		{
			[1] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand"	
			 	window_pre_offset = -50, window_post_offset = 100,
				direction = 3},
		},
	},
	[4547] = --SkillBaseData\技能\4\DZ_华山门派通用技能6\DZ_华山门派通用技能6.tmpl
	{ 
		Collision =
		{
			[1] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand"	
			 	window_pre_offset = -50, window_post_offset = 100,
				direction = 1},
		},
	},
	[4561] = --SkillBaseData\技能\5\DZ_恒山门派通用技能2\DZ_恒山门派通用技能2.tmpl
	{ 
		Collision =
		{
			[1] = { phys_ref_bone = "Bip01 L Hand",  --挥动的骨头。不配默认是"Bip01 R Hand"	
			 	window_pre_offset = -50, window_post_offset = 50,
				direction = 1},
		},
	},
	[4564] = --SkillBaseData\技能\5\DZ_恒山门派通用技能5\DZ_恒山门派通用技能5.tmpl
	{ 
		Collision =
		{
			[1] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand"	
			 	window_pre_offset = -50, window_post_offset = 100,
				range_type = 0, radius = 1, length = 4, direction = 3},
		},
	},
	[4565] = --SkillBaseData\技能\5\DZ_恒山门派通用技能6\DZ_恒山门派通用技能6.tmpl
	{ 
		Collision =
		{
			[1] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand"	
			 	window_pre_offset = -50, window_post_offset = 150,
				direction = 3},
		},
	},
	[4566] = --SkillBaseData\技能\6\DZ_衡山门派通用技能1\DZ_衡山门派通用技能1.tmpl
	{ 
		Collision =
		{
			[1] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand"	
			 	window_pre_offset = -50, window_post_offset = 50,
				range_type = 1, radius = 3, angle = 60, perform_time = 150, direction = 1},
		},
	},
	[5412] = --SkillBaseData\技能\6\DZ_衡山门派通用技能1_2\DZ_衡山门派通用技能1_2.tmpl
	{ 
		Collision =
		{
			[1] = { phys_ref_bone = "Bip01 L Hand",  --挥动的骨头。不配默认是"Bip01 R Hand"	
			 	window_pre_offset = -50, window_post_offset = 50,
				range_type = 0, radius = 0.5, length = 2, perform_time = 550, direction = 3},
		},
	},
	[4567] = --SkillBaseData\技能\6\DZ_衡山门派通用技能2\DZ_衡山门派通用技能2.tmpl
	{ 
		Collision =
		{
			[1] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand"	
			 	window_pre_offset = -50, window_post_offset = 50,
				direction = 1},
		},
	},
	[4568] = --SkillBaseData\技能\6\DZ_衡山门派通用技能3\DZ_衡山门派通用技能3.tmpl
	{ 
		Collision =
		{
			[1] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand"	
			 	window_pre_offset = -50, window_post_offset = 100,
				range_type = 0, radius = 1, length = 4, direction = 3},
		},
	},
	[4570] = --SkillBaseData\技能\6\DZ_衡山门派通用技能5\DZ_衡山门派通用技能5.tmpl
	{ 
		Collision =
		{
			[1] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand"	
			 	window_pre_offset = -50, window_post_offset = 50,
				range_type = 0, radius = 1, length = 4, direction = 3},
		},
	},
	[4571] = --SkillBaseData\技能\6\DZ_衡山门派通用技能6\DZ_衡山门派通用技能6.tmpl
	{ 
		Collision =
		{
			[1] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand"	
			 	window_pre_offset = -50, window_post_offset = 50,
				range_type = 2, radius = 0.01,direction = 5},
		},
	},
	[4572] = --SkillBaseData\技能\7\DZ_日月门派通用技能1\DZ_日月门派通用技能1.tmpl
	{ 
		Collision =
		{
			[1] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand"	
			 	window_pre_offset = -50, window_post_offset = 50,
				range_type = 1, radius = 3, angle = 60, perform_time = 250, direction = 2},
		},
	},
	[5413] = --SkillBaseData\技能\7\DZ_日月门派通用技能1_2\DZ_日月门派通用技能1_2.tmpl
	{ 
		Collision =
		{
			[1] = { phys_ref_bone = "Bip01 L Hand",  --挥动的骨头。不配默认是"Bip01 R Hand"	
			 	window_pre_offset = -50, window_post_offset = 50,
				range_type = 1, radius = 3, angle = 60, perform_time = 750, direction = 1},
		},
	},
	[4573] = --SkillBaseData\技能\7\DZ_日月门派通用技能2\DZ_日月门派通用技能2.tmpl
	{ 
		Collision =
		{
			[1] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand"	
			 	window_pre_offset = -50, window_post_offset = 50,
				direction = 2},
		},
	},
	[4575] = --SkillBaseData\技能\7\DZ_日月门派通用技能4\DZ_日月门派通用技能4.tmpl
	{ 
		Collision =
		{
			[1] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand"	
			 	window_pre_offset = -50, window_post_offset = 50,
				direction = 1},
		},
	},
	[4577] = --SkillBaseData\技能\7\DZ_日月门派通用技能6\DZ_日月门派通用技能6.tmpl
	{ 
		Collision =
		{
			[1] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand"	
			 	window_pre_offset = -50, window_post_offset = 100,
				range_type = 0, radius = 2, length = 5, direction = 3},
			[1] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand"	
			 	window_pre_offset = -50, window_post_offset = 50,
				range_type = 1, radius = 5, angle = 60, direction = 1},
			[3] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand"	
			 	window_pre_offset = -50, window_post_offset = 50,
				range_type = 1, radius = 5, angle = 60, direction = 2},
		},
	},
	[4579] = --SkillBaseData\技能\8\DZ_五仙门派通用技能2\DZ_五仙门派通用技能2.tmpl
	{ 
		Collision =
		{
			[1] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand"	
			 	window_pre_offset = -50, window_post_offset = 100,
				range_type = 0, radius = 1, length = 4, direction = 3},
		},
	},
	[4583] = --SkillBaseData\技能\8\DZ_五仙门派通用技能6\DZ_五仙门派通用技能6.tmpl
	{ 
		Collision =
		{
			[1] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand"	
			 	window_pre_offset = -50, window_post_offset = 100,
				range_type = 2, radius = 5, direction = 1},
			[2] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand"	
			 	window_pre_offset = -50, window_post_offset = 50,
				range_type = 2, radius = 5, direction = 1},
			[3] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand"	
			 	window_pre_offset = -50, window_post_offset = 50,
				range_type = 2, radius = 5, direction = 1},
			[4] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand"	
			 	window_pre_offset = -50, window_post_offset = 100,
				range_type = 2, radius = 5, direction = 1},
		},
	},
	[4598] = --SkillBaseData\技能\11\DZ_峨嵋门派通用技能3\DZ_峨嵋门派通用技能3.tmpl
	{ 
		Collision =
		{
			[1] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand"	
			 	window_pre_offset = -50, window_post_offset = 100,
				range_type = 0, radius = 1, length = 4, direction = 3},
		},
	},
	------------------------------------------------
	--hint	少林专精武学
	------------------------------------------------
	[1026] = --SkillID: SkillBaseData\技能\2\V1_zd0_右刺_少林\V1_zd0_右刺_少林.tmpl
	{ 
		Collision = --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 3
				--pause_time = 200, freeze_speed = 0.0 --这两个是编辑器用的，客户端用damage_visual.lua里的静止帧数据
				},
		},
	},
	[988] = --SkillID: SkillBaseData\技能\2\V1_zd_反手直击_少林\V1_zd_反手直击_少林.tmpl
	{ 
		Collision = --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 3},
		},
	},
	[960] = --SkillID: SkillBaseData\技能\2\V1_zd_伸棍长打_少林\V1_zd_伸棍长打_少林.tmpl
	{ 
		Collision = --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 L Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 3},
		},
	},
	[980] = --SkillID: SkillBaseData\技能\2\V1_zd_小右下劈_少林\V1_zd_小右下劈_少林.tmpl
	{ 
		Collision = --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 L Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 100, 
				direction = 1},
		},
	},
	[4823] = --SkillBaseData\技能\2\V5_zd1_三节棍左双抡_少林\V5_zd1_三节棍左双抡_少林.tmpl
	{ 
		Collision = --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 2},
			[2] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 1},
		},
	},
	[4824] = --SkillBaseData\技能\2\V5_zd1_左扫_少林\V5_zd1_左扫_少林.tmpl
	{ 
		Collision = --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 2},
		},
	},
	[4825] = --SkillBaseData\技能\2\V5_zd1_双绕大右扫_少林\V5_zd1_双绕大右扫_少林.tmpl
	{ 
		Collision = --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 100, 
				direction = 1},
			[2] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 1},
		},
	},
	[958] = --SkillBaseData\技能\2\V1_zd_左挑_少林\V1_zd_左挑_少林.tmpl
	{ 
		Collision = --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 2},
		},
	},
	[979] = --SkillBaseData\技能\2\V1_zd_左碓转棍_少林\V1_zd_左碓转棍_少林.tmpl
	{ 
		Collision = --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 L Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 3},
			[3] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 3},
		},
	},
	[4826] = --SkillID: SkillBaseData\技能\2\V5_zd1_前冲棍_少林\V5_zd1_前冲棍_少林.tmpl
	{ 
		Collision = --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand"	
			 	window_pre_offset = -50, window_post_offset = 100,
				range_type = 0, radius = 1, length = 4, direction = 3},
		},
	},
	[4838] = --SkillID: SkillBaseData\技能\2\V5_zd_翻身力劈_少林\V5_zd_翻身力劈_少林.tmpl
	{ 
		Collision = --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 L Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 100, 
				direction = 3},
			[2] = { phys_ref_bone = "Bip01 L Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 3},
		},
	},
	[982] = --SkillID: SkillBaseData\技能\2\V1_zd1_转你脸_少林\V1_zd1_转你脸_少林.tmpl
	{ 
		Collision = --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 3},
			[2] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 3},
			[4] = { phys_ref_bone = "Bip01 L Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 1},
		},
	},
	[989] = --SkillID: SkillBaseData\技能\2\V1_zd1_伸棍长打_少林\V1_zd1_伸棍长打_少林.tmpl
	{ 
		Collision = --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 L Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 3},
		},
	},
	[163] = --SkillID: SkillBaseData\技能\2\少林通用招式1-7\少林通用招式1-7.tmpl(旋风棍)
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[0] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 5},
		},
	},
	[4827] = --SkillID: SkillBaseData\技能\2\V5_zd_三节棍腾空下劈_少林\V5_zd_三节棍腾空下劈_少林.tmpl
	{ 
		Collision = --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 5},
			[3] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 100, 
				direction = 3},
		},
	},
	[4829] = --SkillID: SkillBaseData\技能\2\V5_zd_罗汉拳_少林\V5_zd_罗汉拳_少林.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 L Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 3},
		},
	},
	[4839] = --SkillID: SkillBaseData\技能\2\V5_zd_左右连拳_少林\V5_zd_左右连拳_少林.tmpl
	{ 
		Collision = --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 3},
			[2] = { phys_ref_bone = "Bip01 L Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 3},
		},
	},
	[2033] = --SkillID: SkillBaseData\技能\2\V2_zd_转身挥拳_少林\V2_zd_转身挥拳_少林.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 3},
		},
	},
	[2034] = --SkillID: SkillBaseData\技能\2\V2_zd_罗汉冲拳_少林\V2_zd_罗汉冲拳_少林.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 100, 
				direction = 3},
		},
	},
	[968] = --SkillID: SkillBaseData\技能\2\V1_zd_右重拳_少林\V1_zd_右重拳_少林.tmpl
	{ 
	         Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 2},
		},
	},
	[969] = --SkillID: SkillBaseData\技能\2\V1_zd_左重拳_少林\V1_zd_左重拳_少林.tmpl
	{ 
	         Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 L Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 1},
		},
	},
	[2035] = --SkillID: SkillBaseData\技能\2\V2_zd_跨步冲拳_少林\V2_zd_跨步冲拳_少林.tmpl
	{ 
		Collision = --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 L Hand",  --挥动的骨头。不配默认是"Bip01 R Hand"	
			 	window_pre_offset = -50, window_post_offset = 50,
				range_type = 0, radius = 1, length = 4, direction = 3},
		},
	},
	[975] = --SkillID: SkillBaseData\技能\2\V1_zd_扫堂腿_少林\V1_zd_扫堂腿_少林.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 L Foot",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 2},
		},
	},
	[4830] = --SkillID: SkillBaseData\技能\2\V5_zd_飞天脚_少林\V5_zd_飞天脚_少林.tmpl
	{ 
		Collision = --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 R Foot",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 3},
			[2] = { phys_ref_bone = "Bip01 R Foot",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 3},
		},
	},
	[4831] = --SkillID: SkillBaseData\技能\2\V5_zd_无影手循环_少林\V5_zd_无影手循环_少林.tmpl
	{ 
		Collision = --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 5},
			[2] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 5},
		        [4] = { phys_ref_bone = "Bip01 L Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 100, 
				direction = 3},
		},
	},
	[4832] = --SkillID: SkillBaseData\技能\2\V5_zd_空中连环腿_少林\V5_zd_空中连环腿_少林.tmpl
	{ 
		Collision = --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 R Foot",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 2},
			[2] = { phys_ref_bone = "Bip01 L Foot",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 2},
			[3] = { phys_ref_bone = "Bip01 R Foot",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 2},
			[4] = { phys_ref_bone = "Bip01 L Foot",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 2},
			[5] = { phys_ref_bone = "Bip01 R Foot",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 2},
		},
	},
	[4833] = --SkillID: SkillBaseData\技能\2\V5_zd_前顶_少林\V5_zd_前顶_少林.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 L Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 100, 
				direction = 3},
		},
	},
	------------------------------------------------
	--hint	武当专精武学
	------------------------------------------------
	[2656] = --SkillID: SkillBaseData\技能\3\zd_横甩剑_武当\zd_横甩剑_武当.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 2},
		},
	},
	[2533] = --SkillID: SkillBaseData\技能\3\zd_右劈剑_武当\zd_右劈剑_武当.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 L Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 1},
		},
	},
	[2535] = --SkillID: SkillBaseData\技能\3\zd_正挑剑_武当\zd_正挑剑_武当.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 3},
		},
	},
	[2536] = --SkillID: SkillBaseData\技能\3\zd_左劈剑_武当\zd_左劈剑_武当.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 100, 
				direction = 2},
		},
	},
	[4887] = --SkillID: SkillBaseData\技能\3\V5_zd_横扫四连1_武当\V5_zd_横扫四连1_武当.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 1},
			[3] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 2},
		},
	},
	[4888] = --SkillID: SkillBaseData\技能\3\V5_zd_横扫四连34_武当\V5_zd_横扫四连34_武当.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 1},
			[3] = { phys_ref_bone = "Bip01 L Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 1},
		},
	},
	[2658] = --SkillID: SkillBaseData\技能\3\zd_升龙剑_武当\zd_升龙剑_武当.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 L Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 3},
		},
	},
	[2659] = --SkillID: SkillBaseData\技能\3\zd_升龙剑1_武当\zd_升龙剑1_武当.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 3},
			[2] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 3},
		},
	},
	[4889] = --SkillID: SkillBaseData\技能\3\V5_zd_抡剑力劈_武当\V5_zd_抡剑力劈_武当.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[4] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 100, 
				direction = 3},
		},
	},
	[2543] = --SkillID: SkillBaseData\技能\3\zd_一剑穿心_武当\zd_一剑穿心_武当.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 100, 
				direction = 3},
		},
	},
	[1374] = --SkillID: SkillBaseData\技能\3\zd_跳下钻_武当\zd_跳下钻_武当.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 Head",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 100, 
				direction = 2},
		},
	},
	[4891] = --SkillID: SkillBaseData\技能\3\V5_zd_斗转星移1_武当\V5_zd_斗转星移1_武当.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 4},
			[3] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 5},
			[4] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 5},
		},
	},
	[4892] = --SkillID: SkillBaseData\技能\3\V5_zd_运剑前刺_武当\V5_zd_运剑前刺_武当.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[2] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 2},
		},
	},
	[2660] = --SkillID: SkillBaseData\技能\3\zd_肘撞_武当\zd_肘撞_武当.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 L Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 1},
		},
	},
	[2547] = --SkillID: SkillBaseData\技能\3\zd_双侧合开掌_武当\zd_双侧合开掌_武当.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 L Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 1},
		},
	},
	[2680] = --SkillID: SkillBaseData\技能\3\zd_双侧合开掌1_武当\zd_双侧合开掌1_武当.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 L Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 3},
		},
	},
	[2571] = --SkillID: SkillBaseData\技能\3\V1_zd_双切掌侧甩掌_武当\V1_zd_双切掌侧甩掌_武当.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 L Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 100, 
				direction = 2},
			[2] = { phys_ref_bone = "Bip01 L Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 3},
		},
	},
	[2662] = --SkillID: SkillBaseData\技能\3\zd_听劲化力_武当\zd_听劲化力_武当.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[2] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 100, 
				direction = 3},
		},
	},
	------------------------------------------------
	--hint	华山专精武学
	------------------------------------------------
	[2041] = --SkillID: SkillBaseData\技能\4\V1_zd_刺_华山\V1_zd_刺_华山.tmpl
	{
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { window_pre_offset = -50, window_post_offset = 50, },
		},
	},
	[2042] = --SkillID: SkillBaseData\技能\4\V1_zd_左右侧划_华山\V1_zd_左右侧划_华山.tmpl
	{
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { window_pre_offset = -50, window_post_offset = 30, },
			[2] = { window_pre_offset = -50, window_post_offset = 30, },
		},
	},
	[2043] = --SkillID: SkillBaseData\技能\4\V1_zd_上划竖劈_华山\V1_zd_上划竖劈_华山.tmpl
	{
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { window_pre_offset = -50, window_post_offset = 100, },
		},
	},
	[2044] = --SkillID: SkillBaseData\技能\4\V1_zd_仰身跪刺_华山\V1_zd_仰身跪刺_华山.tmpl
	{
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { window_pre_offset = -50, window_post_offset = 150, },
		},
	},
	[3602] = --SkillID: SkillBaseData\技能\4\zd_剑宗疾风直刺_华山\zd_剑宗疾风直刺_华山.tmpl
	{
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { window_pre_offset = -50, window_post_offset = 100, },
		},
	},
	[834] = --SkillID: SkillBaseData\技能\4\zd_跨步右砍_华山\zd_跨步右砍_华山.tmpl
	{
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { window_pre_offset = -50, window_post_offset = 100, },
		},
	},
	[838] = --SkillID: SkillBaseData\技能\4\zd_右劈_华山\zd_右劈_华山.tmpl
	{
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { window_pre_offset = -50, window_post_offset = 100, },
		},
	},
	[852] = --SkillID: SkillBaseData\技能\4\zd_旋转下劈剑_华山\zd_旋转下劈剑_华山.tmpl
	{
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { window_pre_offset = -50, window_post_offset = 50, },
		},
	},
	[3665] = --SkillID: SkillBaseData\技能\4\zd_刺刺刺_华山\zd_刺刺刺_华山.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 3},
			[2] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 3},
			[4] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 3},
		},
	},
	[1152] = --SkillID: SkillBaseData\技能\4\zd_旋风腿循环_华山\zd_旋风腿循环_华山.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 1},
		},
	},
	[2049] = --SkillID: SkillBaseData\技能\4\zd_升龙3_华山\zd_升龙3_华山.tmpl
	{
		trackbonevel_windowtime = 200,	--计算骨骼速度窗口时间（ms），默认250，最大500
		trackbonevel_mode = TRACKBONEVEL_MODE_MAX,	--骨骼速度计算模式。不配则默认是 TRACKBONEVEL_MODE_AVERAGE
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { window_pre_offset = -50, window_post_offset = 50,
				hitrotate_duration = 800, --ragdoll旋转的加力时间，不配则默认500ms，最大2000ms
				},
		},
	},
	[3648] = --SkillID: SkillBaseData\技能\4\zd_剑宗破防_华山\zd_剑宗破防_华山.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 L Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 3},
		},
	},
	[3601] = --SkillID: 人剑合一
	{
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { window_pre_offset = -50, window_post_offset = 100, },
		},
	},
	[953] = --SkillID: SkillBaseData\技能\4\zd_右斜刺_华山\zd_右斜刺_华山.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 2},
		},
	},
	[3579] = --SkillID: SkillBaseData\技能\4\zd_气宗普攻2_华山\zd_气宗普攻2_华山.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 1},
		},
	},
	[3580] = --SkillID: SkillBaseData\技能\4\zd_气宗普攻3_华山\zd_气宗普攻3_华山.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 2},
		},
	},
	[1027] = --SkillID: SkillBaseData\技能\4\zd_左斜刺_华山\zd_左斜刺_华山.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 3},
		},
	},
	[847] = --SkillID: 华山气宗(武学3)的白燕回绕
	{
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 L Foot",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 2},
		},
	},
	[850] = --SkillID: SkillBaseData\技能\4\zd_转身跳砍_华山\zd_转身跳砍_华山.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 3},
		},
	},
	------------------------------------------------
	--hint	恒山专精武学
	------------------------------------------------
	[2883] = --SkillID: SkillBaseData\技能\5\V2_zd_格挡普攻1_恒山\V2_zd_格挡普攻1_恒山.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 L Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 3},
		},
	},
	[2884] = --SkillID: SkillBaseData\技能\5\V2_zd_格挡普攻2_恒山\V2_zd_格挡普攻2_恒山.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 2},
			[3] = { phys_ref_bone = "Bip01 L Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 3},
		},
	},
	[2885] = --SkillID: SkillBaseData\技能\5\V2_zd_格挡普攻3_恒山\V2_zd_格挡普攻3_恒山.tmpl
	{ 
	        Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 L Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 1},
		},
	},
	[2886] = --SkillID: SkillBaseData\技能\5\V2_zd_格挡普攻4_恒山\V2_zd_格挡普攻4_恒山.tmpl
	{ 
        	Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 100, 
				direction = 3},
		},
	},
	[934] = --SkillID: SkillBaseData\技能\5\zd_垛击_恒山\zd_垛击_恒山.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 1},
		},
	},
	[2933] = --SkillID: SkillBaseData\技能\5\zd_右直刺_恒山\zd_右直刺_恒山.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 3},
		},
	},
	[2934] = --SkillID: SkillBaseData\技能\5\zd_转身反手刺_恒山\zd_转身反手刺_恒山.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 L Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 3},
		},
	},
	[950] = --SkillID: SkillBaseData\技能\5\zd_单脚刺_恒山\zd_单脚刺_恒山.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 L Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 3},
		},
	},
	[4681] = --SkillID: SkillBaseData\技能\5\V5_zd_双剑夹击_恒山\V5_zd_双剑夹击_恒山.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 3},
		},
	},
	[4682] = --SkillID: SkillBaseData\技能\5\V5_zd_双剑开路_恒山\V5_zd_双剑开路_恒山.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 100, 
				direction = 3},
		},
	},
	[4689] = --SkillID: SkillBaseData\技能\5\V5_zd_格挡上_恒山\V5_zd_格挡上_恒山.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[2] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 100, 
				direction = 3},
			[4] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 3},
			[6] = { phys_ref_bone = "Bip01 R Foot",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 2},
		},
	},
	[4683] = --SkillID: SkillBaseData\技能\5\V5_zd_二段剑气_恒山\V5_zd_二段剑气_恒山.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 100, 
				direction = 3},
			[4] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 5},
		},
	},
	[4684] = --SkillID: SkillBaseData\技能\5\V5_zd_舞剑砍_恒山\V5_zd_舞剑砍_恒山.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[2] = { phys_ref_bone = "Bip01 L Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 150, 
				direction = 1},
			[4] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 30, 
				direction = 3},
			[5] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 30, 
				direction = 5},
		},
	},
	[4686] = --SkillID: SkillBaseData\技能\5\V5_zd_舞动双刺_恒山\V5_zd_舞动双刺_恒山.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[2] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 150, 
				direction = 3},
		},
	},
	[4687] = --SkillID: SkillBaseData\技能\5\V5_zd_格挡上反击4_恒山\V5_zd_格挡上反击4_恒山.tmpl
	{
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 1},
			[3] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 1},
		},
	},
	[2920] = --SkillID: SkillBaseData\技能\5\zd_双剑普攻一式_恒山\zd_双剑普攻一式_恒山.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 L Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 2},
			[2] = { phys_ref_bone = "Bip01 L Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 1},
		},
	},
	[2917] = --SkillID: SkillBaseData\技能\5\zd_双剑普攻二式_恒山\zd_双剑普攻二式_恒山.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 2},
			[2] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 3},
		},
	},
	[2918] = --SkillID: SkillBaseData\技能\5\zd_双剑普攻三式_恒山\zd_双剑普攻三式_恒山.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 2},
		},
	},
	[2919] = --SkillID: SkillBaseData\技能\5\zd_双剑普攻四式_恒山\zd_双剑普攻四式_恒山.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 Head",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 3},
			[2] = { phys_ref_bone = "Bip01 Head",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 3},
		},
	},
	[2887] = --SkillID: SkillBaseData\技能\5\V2_zd_双剑普攻1_恒山\V2_zd_双剑普攻1_恒山.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 2},
		},
	},
	[2888] = --SkillID: SkillBaseData\技能\5\V2_zd_双剑普攻2_恒山\V2_zd_双剑普攻2_恒山.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 L Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 1},
			[2] = { phys_ref_bone = "Bip01 L Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 1},
		},
	},
	[2889] = --SkillID: SkillBaseData\技能\5\V2_zd_双剑普攻3_恒山\V2_zd_双剑普攻3_恒山.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 2},
		},
	},
	[2890] = --SkillID: SkillBaseData\技能\5\V2_zd_双剑普攻4_恒山\V2_zd_双剑普攻4_恒山.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 L Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 100, 
				direction = 1},
		},
	},
	[936] = --SkillID: SkillBaseData\技能\5\zd_舞剑旋转砍_恒山\zd_舞剑旋转砍_恒山.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 L Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 100, 
				direction = 3},
			[2] = { phys_ref_bone = "Bip01 L Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 3},
		},
	},
	[939] = --SkillID: SkillBaseData\技能\5\zd_双向舞剑_恒山\zd_双向舞剑_恒山.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 L Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 2},
			[2] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 1},
		},
	},
	[944] = --SkillID: SkillBaseData\技能\5\zd_舞剑转身砍_恒山\zd_舞剑转身砍_恒山.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 L Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 100, 
				direction = 2},
		},
	},
	[2928] = --SkillID: SkillBaseData\技能\5\zd_跳爆头_恒山\zd_跳爆头_恒山.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 100, 
				direction = 2},
		},
	},
	[2921] = --SkillID: SkillBaseData\技能\5\zd_双剑升龙_恒山\zd_双剑升龙_恒山.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 L Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 3},
		},
	},
	[4691] = --SkillID: SkillBaseData\技能\5\V5_zd_七剑_恒山\V5_zd_七剑_恒山.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 3},
			[2] = { phys_ref_bone = "Bip01 L Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 2},
			[3] = { phys_ref_bone = "Bip01 L Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 3},
			[5] = { phys_ref_bone = "Bip01 L Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 1},
			[6] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 2},
			[8] = { phys_ref_bone = "Bip01 L Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 3},
			[9] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 1},
		},
	},
	[2913] = --SkillID: SkillBaseData\技能\5\zd_侧跳前刺转身劈_恒山\zd_侧跳前刺转身劈_恒山.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 L Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 3},
			[2] = { phys_ref_bone = "Bip01 L Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 2},
			[3] = { phys_ref_bone = "Bip01 L Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 5},
			[5] = { phys_ref_bone = "Bip01 L Foot",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 3},
		},
	},
	------------------------------------------------
	--hint	衡山专精武学
	------------------------------------------------
	[2837] = --SkillID: SkillBaseData\技能\6\zd_左手双闪_衡山\zd_左手双闪_衡山.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 3},
			[2] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 4},
		},
	},
	[2838] = --SkillID: SkillBaseData\技能\6\zd_右手单闪_衡山\zd_右手单闪_衡山.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 2},
		},
	},
	[2839] = --SkillID: SkillBaseData\技能\6\zd_左右双闪_衡山\zd_左右双闪_衡山.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 L Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 1},
		},
	},
	[2840] = --SkillID: SkillBaseData\技能\6\zd_左右双开_衡山\zd_左右双开_衡山.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 2},
		},
	},
	[4712] = --SkillID: SkillBaseData\技能\6\V5_zd_冲锋斩1_衡山\V5_zd_冲锋斩1_衡山.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[3] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 2},
			[5] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 2},
			[6] = { phys_ref_bone = "Bip01 L Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 1},
			[7] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 2},
			[8] = { phys_ref_bone = "Bip01 L Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 1},
			[11] = { phys_ref_bone = "Bip01 L Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 2},
			[13] = { phys_ref_bone = "Bip01 L Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 1},
			[15] = { phys_ref_bone = "Bip01 L Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 2},
		},
	},
	[4713] = --SkillID: SkillBaseData\技能\6\V5_zd_小右横劈_衡山\V5_zd_小右横劈_衡山.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[3] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 3},
			[5] = { phys_ref_bone = "Bip01 L Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 3},
			[7] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 3},
			[9] = { phys_ref_bone = "Bip01 L Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 3},
		},
	},
	[4714] = --SkillID: SkillBaseData\技能\6\V5_zd_突进拔双刀_衡山\V5_zd_突进拔双刀_衡山.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[3] = { phys_ref_bone = "Bip01 L Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 2},
			[5] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 3},
			[6] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 5},
			[8] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 5},
			[9] = { phys_ref_bone = "Bip01 R Foot",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 3},
			[10] = { phys_ref_bone = "Bip01 R Foot",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 5},
			[11] = { phys_ref_bone = "Bip01 R Foot",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 5},
			[13] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 3},
		},
	},
	[4715] = --SkillID: SkillBaseData\技能\6\V5_zd_循环拔_衡山\V5_zd_循环拔_衡山.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 L Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 3},
			[2] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 5},
			[4] = { phys_ref_bone = "Bip01 L Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 2},
		},
	},
	[4716] = --SkillID: SkillBaseData\技能\6\V5_zd_转身拔剑_衡山\V5_zd_转身拔剑_衡山.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[2] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 1},
			[4] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 1},
			[5] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 5},
			[6] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 5},
			[7] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 5},
			[8] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 5},
		},
	},
	[2877] = --SkillID: SkillBaseData\技能\6\zd_幻影普攻1_衡山\zd_幻影普攻1_衡山.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 L Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 1},
		},
	},
	[2878] = --SkillID: SkillBaseData\技能\6\zd_幻影普攻2_衡山\zd_幻影普攻2_衡山.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 3},
		},
	},
	[2879] = --SkillID: SkillBaseData\技能\6\zd_幻影普攻3_衡山\zd_幻影普攻3_衡山.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 3},
		},
	},
	[2844] = --SkillID: SkillBaseData\技能\6\zd_左手前刺_衡山\zd_左手前刺_衡山.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 L Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 100, 
				direction = 3},
		},
	},
	[2875] = --SkillID: SkillBaseData\技能\6\zd_左单手斜挑(幻影三连打)_衡山\zd_左单手斜挑(幻影三连打)_衡山.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 L Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 5},
		},
	},
	[4717] = --SkillID: SkillBaseData\技能\6\V5_zd_抬剑插中间_衡山\V5_zd_抬剑插中间_衡山.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[4] = { phys_ref_bone = "Bip01 L Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 5},
			[6] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 3},
		},
	},
	[4718] = --SkillID: SkillBaseData\技能\6\V5_zd_抓剑后劈_衡山\V5_zd_抓剑后劈_衡山.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[4] = { phys_ref_bone = "Bip01 L Foot",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 100, 
				direction = 3},
			[5] = { phys_ref_bone = "Bip01 R Foot",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 3},
		},
	},
	[4719] = --SkillID: SkillBaseData\技能\6\V5_zd_幻影三连击_衡山\V5_zd_幻影三连击_衡山.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[3] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 3},
		},
	},
	[4720] = --SkillID: SkillBaseData\技能\6\V5_zd_无敌风火轮_衡山\V5_zd_无敌风火轮_衡山.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[3] = { phys_ref_bone = "Bip01 Head",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 150, 
				direction = 5},
		},
	},
	------------------------------------------------
	--hint	日月专精武学
	------------------------------------------------
	[1034] = --SkillID: SkillBaseData\技能\7\zd_小右平砍_日月\zd_小右平砍_日月.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 1},
		},
	},
	[3028] = --SkillID: SkillBaseData\技能\7\zd_小左下砍_日月\zd_小左下砍_日月.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 2},
		},
	},
	[4079] = --SkillID: SkillBaseData\技能\7\zd_双刀普攻3_日月\zd_双刀普攻3_日月.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 3},
		},
	},
	[4095] = --SkillID: SkillBaseData\技能\7\zd_普攻合前扎_日月\zd_普攻合前扎_日月.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 100, 
				direction = 3},
			[2] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 4},
		},
	},
	[3029] = --SkillID: SkillBaseData\技能\7\zd_上挑_日月\zd_上挑_日月.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 2},
		},
	},
	[1036] = --SkillID: SkillBaseData\技能\7\zd_反手上挑_日月\zd_反手上挑_日月.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 L Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 1},
		},
	},
	[1043] = --SkillID: SkillBaseData\技能\7\zd_飞刀_日月\zd_飞刀_日月.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 3},
			[2] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 2},
		},
	},
	[4078] = --SkillID: SkillBaseData\技能\7\zd_原地扔飞刀_日月\zd_原地扔飞刀_日月.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 3},
			[2] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 3},
		},
	},
	[4086] = --SkillID: SkillBaseData\技能\7\zd_小右下砍1_日月\zd_小右下砍1_日月.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 100, 
				direction = 2},
		},
	},
	[4085] = --SkillID: SkillBaseData\技能\7\zd_狂风日月刀1_日月\zd_狂风日月刀1_日月.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 100, 
				direction = 5},
			[2] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 5},
			[3] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 3},
		},
	},
	[1056] = --SkillID: SkillBaseData\技能\7\zd_钻地_日月\zd_钻地_日月.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 Head",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 100, 
				direction = 5},
		},
	},
	[1048] = --SkillID: SkillBaseData\技能\7\zd_蓄力旋杀_日月\zd_蓄力旋杀_日月.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[2] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 5},
		        [3] = { phys_ref_bone = "Bip01 L Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 1},
		},
	},
	[4901] = --SkillID: SkillBaseData\技能\7\V5_zd1_锁链连击1_日月\V5_zd1_锁链连击1_日月.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 3},
		        [3] = { phys_ref_bone = "Bip01 L Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 3},
		},
	},
	[4902] = --SkillID: SkillBaseData\技能\7\V5_zd_锁链上挑_日月\V5_zd_锁链上挑_日月.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 3},
		},
	},
	[4903] = --SkillID: SkillBaseData\技能\7\V5_zd1_锁链连击3_日月\V5_zd1_锁链连击3_日月.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 3},
		},
	},
	[4904] = --SkillID: SkillBaseData\技能\7\V5_zd_链刃旋转_日月\V5_zd_链刃旋转_日月.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 100, 
				direction = 3},
		},
	},
	[4905] = --SkillID: SkillBaseData\技能\7\V5_zd_双膝升龙_日月\V5_zd_双膝升龙_日月.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 L Calf",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 3},
			[2] = { phys_ref_bone = "Bip01 R Calf",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 3},
		},
	},
	[2988] = --SkillID: SkillBaseData\技能\7\zd_锁链砸地_日月\zd_锁链砸地_日月.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[2] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 100, 
				direction = 3},
		},
	},
	[4088] = --SkillID: SkillBaseData\技能\7\zd_抹脖子摔投_日月\zd_抹脖子摔投_日月.tmpl(下踹)
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 R Foot",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 100, 
				direction = 3},
			[3] = { phys_ref_bone = "Bip01 R Foot",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 2},
			[4] = { phys_ref_bone = "Bip01 R Foot",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 3},
		},
	},
	[3030] = --SkillID: SkillBaseData\技能\7\zd_狂风转刀_日月\zd_狂风转刀_日月.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 Head",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 100, 
				direction = 3},
		},
	},
	[4906] = --SkillID: SkillBaseData\技能\7\V5_zd1_锁链群攻1_日月\V5_zd1_锁链群攻1_日月.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 100, 
				direction = 1},
			[3] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 100, 
				direction = 1},
			[5] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 100, 
				direction = 1},
		},
	},
	------------------------------------------------
	--hint	五仙专精武学
	------------------------------------------------
	[4749] = --SkillID: SkillBaseData\技能\8\V5_zd_转身下扫鞭_五毒\V5_zd_转身下扫鞭_五毒.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 100, 
				direction = 1},
		},
	},
	[2201] = --SkillID: SkillBaseData\技能\8\zd_左右抽_五毒\zd_左右抽_五毒.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 2},
			[2] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 1},
		},
	},
	[4750] = --SkillID: SkillBaseData\技能\8\V5_zd_向左抽_五毒\V5_zd_向左抽_五毒.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 2},
		},
	},
	[2064] = --SkillID: SkillBaseData\技能\8\zd_向右抽_五毒\zd_向右抽_五毒.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 1},
		},
	},
	[2062] = --SkillID: SkillBaseData\技能\8\zd_跳下鞭_五毒\zd_跳下鞭_五毒.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 100, 
				direction = 3},
		},
	},
	[4752] = --SkillID: SkillBaseData\技能\8\V5_zd_双绕抽_五毒\V5_zd_双绕抽_五毒.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[2] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 100, 
				direction = 3},
			[4] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 3},
		},
	},
	[4753] = --SkillID: SkillBaseData\技能\8\V5_zd_凤舞旋转循环_五毒\V5_zd_凤舞旋转循环_五毒.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[2] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 1},
			[3] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 1},
		},
	},
	[4754] = --SkillID: SkillBaseData\技能\8\V5_zd_摆手上抽_五毒\V5_zd_摆手上抽_五毒.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[2] = { phys_ref_bone = "Bip01 Head",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 100, 
				direction = 5},
		},
	},
	[4755] = --SkillID: SkillBaseData\技能\8\V5_zd1_双边绕循环_五毒\V5_zd1_双边绕循环_五毒.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 3},
			[2] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 3},
			[4] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 3},
			[5] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 3},
		},
	},
	[4762] = --SkillID: SkillBaseData\技能\8\V5_zd1_绕头直抽2_五毒\V5_zd1_绕头直抽2_五毒.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 100, 
				direction = 3},
		},
	},
	[4763] = --SkillID: SkillBaseData\技能\8\V5_zd_正鞭反身鞭1_五毒\V5_zd_正鞭反身鞭1_五毒.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 100, 
				direction = 3},
		},
	},
	[4764] = --SkillID: SkillBaseData\技能\8\V5_zd_正鞭反身鞭2_五毒\V5_zd_正鞭反身鞭2_五毒.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 100, 
				direction = 3},
		},
	},
	[4756] = --SkillID: SkillBaseData\技能\8\V5_zd_转身绕鞭_五毒\V5_zd_转身绕鞭_五毒.tmpl
	{ 
        	Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 150, 
				direction = 3},
			[2] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 3},
		},
	},
	[4759] = --SkillID: SkillBaseData\技能\8\V5_zd_施法攻击8_五毒\V5_zd_施法攻击8_五毒.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 Head",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 5},
		},
	},
	------------------------------------------------
	--hint	逍遥专精武学
	------------------------------------------------
	[2244] = --SkillID: SkillBaseData\技能\9\zd_爆头踢_逍遥\zd_爆头踢_逍遥.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 R Foot",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 1},
		},
	},
	[2248] = --SkillID: SkillBaseData\技能\9\zd_盾冲锋_逍遥\zd_盾冲锋_逍遥.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 100, 
				direction = 3},
		},
	},
	[2239] = --SkillID: SkillBaseData\技能\9\zd_左手单掌_逍遥\zd_左手单掌_逍遥.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 L Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 3},
		},
	},
	[2230] = --SkillID: SkillBaseData\技能\9\zd_上撩扇_逍遥\zd_上撩扇_逍遥.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 3},
			[2] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 1},
		},
	},
	[2232] = --SkillID: SkillBaseData\技能\9\zd_上撩扇花_逍遥\zd_上撩扇花_逍遥.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 3},
		},
	},
	[2233] = --SkillID: SkillBaseData\技能\9\zd_上步劈扇_逍遥\zd_上步劈扇_逍遥.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 100, 
				direction = 2},
		},
	},
	[860] = --SkillID: SkillBaseData\技能\9\zd_合扇攻击4_逍遥\zd_合扇攻击4_逍遥.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 3},
		},
	},
	[878] = --SkillID: SkillBaseData\技能\9\zd_横扫_逍遥\zd_横扫_逍遥.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 1},
		},
	},
	[2241] = --SkillID: SkillBaseData\技能\9\zd_逆向下扫腿_逍遥\zd_逆向下扫腿_逍遥.tmpl
	{
		trackbonevel_windowtime = 300,	--计算骨骼速度窗口时间（ms），默认250，最大500
		trackbonevel_mode = TRACKBONEVEL_MODE_MAX,	--骨骼速度计算模式。不填默认是TRACKBONEVEL_MODE_AVERAGE

		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 R Foot",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 1},
		},
	},
	[2242] = --SkillID: SkillBaseData\技能\9\zd_绕身扇_逍遥\zd_绕身扇_逍遥.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 2},
		},
	},
	[871] = --SkillID: SkillBaseData\技能\9\zd_侧旋踢_逍遥\zd_侧旋踢_逍遥.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 R Foot",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 3},
		},
	},
	[4784] = --SkillID: SkillBaseData\技能\9\V5_zd_空中连踩_逍遥\V5_zd_空中连踩_逍遥.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 R Foot",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				range_type = 2, radius = 2, 
				direction = 1},
			[2] = { phys_ref_bone = "Bip01 R Foot",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				range_type = 2, radius = 2, 
				direction = 1},
			[4] = { phys_ref_bone = "Bip01 L Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				range_type = 0, radius = 1, length = 3,
				direction = 3},
		},
	},
	[875] = --SkillID: SkillBaseData\技能\9\zd_扭身飞扇_逍遥\zd_扭身飞扇_逍遥.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 3},
			[2] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 4},
		},
	},
	------------------------------------------------
	--hint	唐门专精武学
	------------------------------------------------
	[921] = --SkillID: SkillBaseData\技能\10\zd_转枪射击_唐门\zd_转枪射击_唐门.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 3},
		},
	},
	[2620] = --SkillID: SkillBaseData\技能\10\zd_四面射击循环_唐门\zd_四面射击循环_唐门.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 5},
		},
	},
	------------------------------------------------
	--hint	峨嵋专精武学
	------------------------------------------------
	[3033] = --SkillID: SkillBaseData\技能\11\zd_气功普攻1_峨嵋\zd_气功普攻1_峨嵋.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 3},
			[2] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 3},
			[3] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 3},
		},
	},
	[3034] = --SkillID: SkillBaseData\技能\11\zd_气功普攻2_峨嵋\zd_气功普攻2_峨嵋.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 L Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 2},
		},
	},
	[3035] = --SkillID: SkillBaseData\技能\11\zd_气功普攻3_峨嵋\zd_气功普攻3_峨嵋.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 2},
			[3] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 1},
		},
	},
	[3037] = --SkillID: SkillBaseData\技能\11\zd_气功普攻5_峨嵋\zd_气功普攻5_峨嵋.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 100, 
				direction = 3},
		},
	},
	[3039] = --SkillID: SkillBaseData\技能\11\zd_施法三连击_峨嵋\zd_施法三连击_峨嵋.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 3},
		},
	},
	[3045] = --SkillID: SkillBaseData\技能\11\zd_施法三连击2_峨嵋\zd_施法三连击2_峨嵋.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 L Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 2},
		},
	},
	[3046] = --SkillID: SkillBaseData\技能\11\zd_施法三连击3_峨嵋\zd_施法三连击3_峨嵋.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[2] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 100, 
				direction = 3},
		},
	},
	[3040] = --SkillID: SkillBaseData\技能\11\zd_三连抓_峨嵋\zd_三连抓_峨嵋.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 2},
			[2] = { phys_ref_bone = "Bip01 L Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 1},
		},
	},
	[3047] = --SkillID: SkillBaseData\技能\11\zd_三连抓2_峨嵋\zd_三连抓2_峨嵋.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 3},
		},
	},
	[1389] = --SkillID: SkillBaseData\技能\11\zd_三连击_峨嵋\zd_三连击_峨嵋.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 L Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 3},
			[2] = { phys_ref_bone = "Bip01 L Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 3},
			[3] = { phys_ref_bone = "Bip01 L Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 3},
			[5] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 2},
			[6] = { phys_ref_bone = "Bip01 L Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 3},
		},
	},
	[4669] = --SkillID: SkillBaseData\技能\11\V5_zd_跳跃双爪_峨嵋\V5_zd_跳跃双爪_峨嵋.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 2},
			[2] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 2},
		},
	},
	[3052] = --SkillID: SkillBaseData\技能\11\zd_直冲四连击_峨眉\zd_直冲四连击_峨眉.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 3},
			[2] = { phys_ref_bone = "Bip01 L Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 3},
			[3] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 3},
			[4] = { phys_ref_bone = "Bip01 L Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 3},
		},
	},
	[3044] = --SkillID: SkillBaseData\技能\11\zd_施法11_峨嵋\zd_施法11_峨嵋.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 100, 
				direction = 3},
		},
	},
	[3043] = --SkillID: SkillBaseData\技能\11\zd_劈头盖脸_峨嵋\zd_劈头盖脸_峨嵋.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 100, 
				direction = 5},
		},
	},
	[3048] = --SkillID: SkillBaseData\技能\11\zd_普通攻击一式_峨眉\zd_普通攻击一式_峨眉.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 2},
			[2] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 1},
		},
	},
	[3049] = --SkillID: SkillBaseData\技能\11\zd_普通攻击二式_峨眉\zd_普通攻击二式_峨眉.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 3},
			[2] = { phys_ref_bone = "Bip01 L Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 3},
		},
	},
	[3050] = --SkillID: SkillBaseData\技能\11\zd_普通攻击三式_峨眉\zd_普通攻击三式_峨眉.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 L Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 2},
		},
	},
	[3051] = --SkillID: SkillBaseData\技能\11\zd_蓄力挺刺_峨眉\zd_蓄力挺刺_峨眉.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 L Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 100, 
				direction = 3},
		},
	},
	[1398] = --SkillID: SkillBaseData\技能\11\zd_转身横抡_峨嵋\zd_转身横抡_峨嵋.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 L Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 150, 
				direction = 2},
		},
	},
	[3053] = --SkillID: SkillBaseData\技能\11\zd_群爆法_峨嵋\zd_群爆法_峨嵋.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 1},
			[2] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 1},
			[3] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 50, 
				direction = 1},
			[4] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand",
				window_pre_offset = -50, window_post_offset = 100, 
				direction = 2},
		},
	},
	------------------------------------------------
	--hint	全门派摔投
	------------------------------------------------
	--[3604] = --SkillID: SkillBaseData\技能\4\zd_气宗投技_华山\zd_气宗投技_华山.tmpl
	{ 
		trackbonevel_windowtime = 300,	--计算骨骼速度窗口时间（ms），默认250，最大500
		trackbonevel_mode = TRACKBONEVEL_MODE_MAX,	--骨骼速度计算模式。不填默认是TRACKBONEVEL_MODE_AVERAGE

		Collision =
		{
			[1] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand"	
			 	window_pre_offset = -50, window_post_offset = 50,
				range_type = 1, radius = 3, angle = 60, perform_time = 250, direction = 2},
		},
	},

	------------------------------------------------
	--hint	江湖绝学
	------------------------------------------------
	[8944] = --SkillBaseData\技能\1\V7_江湖绝学D1\V7_江湖绝学D1.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand"	
			 	window_pre_offset = -50, window_post_offset = 50,
				direction = 3},
		},
	},
	[8969] = --SkillBaseData\技能\1\V7_江湖绝学D1二式\V7_江湖绝学D1二式.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 L Hand",  --挥动的骨头。不配默认是"Bip01 R Hand"	
			 	window_pre_offset = -50, window_post_offset = 50,
				direction = 3},
		},
	},
	[9109] = --SkillBaseData\技能\1\V7_江湖绝学C0\V7_江湖绝学C0.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 R Foot",  --挥动的骨头。不配默认是"Bip01 R Hand"	
			 	window_pre_offset = -50, window_post_offset = 50,
				direction = 3},
		},
	},
	[8947] = --SkillBaseData\技能\1\V7_江湖绝学C1\V7_江湖绝学C1.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand"	
			 	window_pre_offset = -50, window_post_offset = 50,
				direction = 1},
		},
	},
	[8948] = --SkillBaseData\技能\1\V7_江湖绝学C2\V7_江湖绝学C2.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand"	
			 	window_pre_offset = -50, window_post_offset = 50,
				direction = 4},
			[3] = { phys_ref_bone = "Bip01 L Hand",  --挥动的骨头。不配默认是"Bip01 R Hand"	
			 	window_pre_offset = -50, window_post_offset = 50,
				direction = 3},
		},
	},
	[8949] = --SkillBaseData\技能\1\V7_江湖绝学C3\V7_江湖绝学C3.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 R Calf",  --挥动的骨头。不配默认是"Bip01 R Hand"	
			 	window_pre_offset = -50, window_post_offset = 50,
				direction = 5},
		},
	},
	[8950] = --SkillBaseData\技能\1\V7_江湖绝学C4\V7_江湖绝学C4.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[2] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand"	
			 	window_pre_offset = -50, window_post_offset = 50,
				direction = 5},
			[4] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand"	
			 	window_pre_offset = -50, window_post_offset = 50,
				direction = 5},
			[6] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand"	
			 	window_pre_offset = -50, window_post_offset = 50,
				direction = 5},
			[7] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand"	
			 	window_pre_offset = -50, window_post_offset = 50,
				direction = 5},
			[8] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand"	
			 	window_pre_offset = -50, window_post_offset = 50,
				direction = 5},
		},
	},
	[8952] = --SkillBaseData\技能\1\V7_江湖绝学C6\V7_江湖绝学C6.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 L Hand",  --挥动的骨头。不配默认是"Bip01 R Hand"	
			 	window_pre_offset = -50, window_post_offset = 50,
				direction = 5},
		},
	},
	[8953] = --SkillBaseData\技能\1\V7_江湖绝学C1\V7_江湖绝学C1.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand"	
			 	window_pre_offset = -50, window_post_offset = 50,
				direction = 5},
			[2] = { phys_ref_bone = "Bip01 L Hand",  --挥动的骨头。不配默认是"Bip01 R Hand"	
			 	window_pre_offset = -50, window_post_offset = 50,
				direction = 5},
			[4] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand"	
			 	window_pre_offset = -50, window_post_offset = 50,
				direction = 5},
		},
	},
	[8945] = --SkillBaseData\技能\1\V7_江湖绝学D2\V7_江湖绝学D2.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 L Hand",  --挥动的骨头。不配默认是"Bip01 R Hand"	
			 	window_pre_offset = -50, window_post_offset = 50,
				direction = 3},
		},
	},
	[8972] = --SkillBaseData\技能\1\V7_江湖绝学D2二式\V7_江湖绝学D2二式.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 L Hand",  --挥动的骨头。不配默认是"Bip01 R Hand"	
			 	window_pre_offset = -50, window_post_offset = 50,
				direction = 3},
		},
	},
	[8973] = --SkillBaseData\技能\1\V7_江湖绝学D2三式\V7_江湖绝学D2三式.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 L Hand",  --挥动的骨头。不配默认是"Bip01 R Hand"	
			 	window_pre_offset = -50, window_post_offset = 50,
				direction = 3},
		},
	},
	[8974] = --SkillBaseData\技能\1\V7_江湖绝学D2四式\V7_江湖绝学D2四式.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand"	
			 	window_pre_offset = -50, window_post_offset = 50,
				direction = 3},
		},
	},
	[8954] = --SkillBaseData\技能\1\V7_江湖绝学B1\V7_江湖绝学B1.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand"	
			 	window_pre_offset = -50, window_post_offset = 50,
				direction = 1},
			[3] = { phys_ref_bone = "Bip01 L Hand",  --挥动的骨头。不配默认是"Bip01 R Hand"	
			 	window_pre_offset = -50, window_post_offset = 50,
				direction = 3},
		},
	},
	[8956] = --SkillBaseData\技能\1\V7_江湖绝学B3\V7_江湖绝学B3.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand"	
			 	window_pre_offset = -50, window_post_offset = 50,
				direction = 3},
		},
	},
	[8957] = --SkillBaseData\技能\1\V7_江湖绝学B4\V7_江湖绝学B4.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand"	
			 	window_pre_offset = -50, window_post_offset = 50,
				direction = 3},
		},
	},
	[8961] = --SkillBaseData\技能\1\V7_江湖绝学A2\V7_江湖绝学A2.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand"	
			 	window_pre_offset = -50, window_post_offset = 50,
				direction = 0},
			[1] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand"	
			 	window_pre_offset = -50, window_post_offset = 50,
				direction = 0},
		},
	},
	[8957] = --SkillBaseData\技能\1\V7_江湖绝学B4\V7_江湖绝学B4.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand"	
			 	window_pre_offset = -50, window_post_offset = 50,
				direction = 3},
		},
	},
	[8946] = --SkillBaseData\技能\1\V7_江湖绝学D3\V7_江湖绝学D3.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 R Foot",  --挥动的骨头。不配默认是"Bip01 R Hand"	
			 	window_pre_offset = -50, window_post_offset = 50,
				direction = 1},
		},
	},
	[8975] = --SkillBaseData\技能\1\V7_江湖绝学D3二式\V7_江湖绝学D3二式.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 R Foot",  --挥动的骨头。不配默认是"Bip01 R Hand"	
			 	window_pre_offset = -50, window_post_offset = 50,
				direction = 1},
		},
	},
	[8976] = --SkillBaseData\技能\1\V7_江湖绝学D3三式\V7_江湖绝学D3三式.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 R Foot",  --挥动的骨头。不配默认是"Bip01 R Hand"	
			 	window_pre_offset = -50, window_post_offset = 50,
				direction = 3},
			[2] = { phys_ref_bone = "Bip01 L Foot",  --挥动的骨头。不配默认是"Bip01 R Hand"	
			 	window_pre_offset = -50, window_post_offset = 50,
				direction = 3},
		},
	},
	[8977] = --SkillBaseData\技能\1\V7_江湖绝学D3四式\V7_江湖绝学D3四式.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 R Foot",  --挥动的骨头。不配默认是"Bip01 R Hand"	
			 	window_pre_offset = -50, window_post_offset = 50,
				direction = 3},
		},
	},
	[8962] = --SkillBaseData\技能\1\V7_江湖绝学A3\V7_江湖绝学A3.tmpl
	{ 
		Collision =  --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 R Calf",  --挥动的骨头。不配默认是"Bip01 R Hand"	
			 	window_pre_offset = -50, window_post_offset = 50,
				direction = 5},
		},
	},
	[8963] = --SkillBaseData\技能\1\V7_江湖绝学A3\V7_江湖绝学A3.tmpl
	{ 
		Collision =  --SkillBaseData\技能\1\V7_江湖绝学A4\V7_江湖绝学A4.tmpl
		{
			[1] = { phys_ref_bone = "Bip01 R Calf",  --挥动的骨头。不配默认是"Bip01 R Hand"	
			 	window_pre_offset = -50, window_post_offset = 50,
				direction = 1},
		},
	},
	[8964] = --SkillBaseData\技能\1\V7_江湖绝学A5\V7_江湖绝学A5.tmpl
	{ 
		Collision =  --SkillBaseData\技能\1\V7_江湖绝学A4\V7_江湖绝学A4.tmpl
		{
			[1] = { phys_ref_bone = "Bip01 R Hand",  --挥动的骨头。不配默认是"Bip01 R Hand"	
			 	window_pre_offset = -50, window_post_offset = 50,
				direction = 3},
			[2] = { phys_ref_bone = "Bip01 R Calf",  --挥动的骨头。不配默认是"Bip01 R Hand"	
			 	window_pre_offset = -50, window_post_offset = 50,
				direction = 4},
		},
	},


	------------------------------------------------
	--hint	暂废配置
	------------------------------------------------
--[[旧版普攻，已作废
	[2708] = --SkillID: 新手普攻
	{
		Collision = --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 L Hand", },
			[2] = { phys_ref_bone = "Bip01 R Hand", },
		},
	},
	[2711] = --SkillID: 新手踢脚
	{
		Collision = --[PerformIndex], 0起。无碰撞的不配，有蓄力段的包含上一起计数
		{
			[1] = { phys_ref_bone = "Bip01 R Foot", },
		},
	},
]]
	------------------------------------------------
	--hint	新加配置
	------------------------------------------------
}
