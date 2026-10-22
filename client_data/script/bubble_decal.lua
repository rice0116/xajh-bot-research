--[[#encode ansi]]
--[[#tag push auto]]

---------------------------------------------------------------
-- 冒泡（受伤，miss，免疫，等等）文字配置
--	Creator: Guo Jie, 2010.12.3
---------------------------------------------------------------

BubbleDecalConfig = {}

BubbleTypeID =
{
	Damage				= 0,	-- 普通伤害
	SkillDamage			= 1,	-- 技能受伤
	CritDamage			= 2,	-- 暴击受伤
	RetortDamage			= 3,	-- 反震受伤
	GradualHurt			= 4,	-- 持续受伤(dot)

	Exp				= 5,	-- 加经验
	SP				= 6,	-- 加sp
	Reputaion			= 7,	-- 加威望
	RegionRepu			= 8,	-- 加区域声望
	Money				= 9,	-- 加金钱
	LevelUp				= 10,	-- 升级

	HitMissed			= 11,	-- miss
	InvalidHit			= 12,	-- 非法击中
	Immune				= 13,	-- 免疫
	HPWarn				= 14,	-- HP报警
	MPWarn				= 15,	-- MP报警

	Heal				= 16,	-- 治疗
	Resist				= 17,	-- 抵抗
	Absorb				= 18,	-- 吸收
	SkillEffect			= 19,	-- 大招效果

	SkillName			= 20,	-- 技能名称(程序处理)
	Force				= 21,	-- 功力
	HitMiss_Upper			= 22,	-- 上闪避(攻击上面时不能命中)
	HitMiss_Lower			= 23,	-- 下闪避
	HitMiss_Straight		= 24,	-- 纵(刺)闪避

	HitMiss_Horizontal		= 25,	-- 横(扫)闪避
	Inhibited			= 26,	-- 被克制
	Breaked				= 27,	-- 被打断
	HitSuspend			= 28,	-- 击飞
	HitCollapse			= 29,	-- 击溃
	HitTumble			= 30,	-- 击倒
	Inhibit				= 31,	-- 克制
	Break				= 32,	-- 打断
	HealMP				= 33,	-- 回蓝
	COMPENSATE_EXP			= 34,	-- 消耗经验

	HUIXIN				= 35,	-- 会心
	DIYU				= 36,	-- 抵御

	BubbleTypeNum			= 3,
}

BubbleImageID =
{
	IMG_INVALID			= -1,

	IMG_POPUPNUM			= 0,	--InGame\\头顶数字.tga
	IMG_HITMISSED			= 1,	--InGame\\未命中.tga
	IMG_LEVELUP			= 3,	--InGame\\升级了.tga
	IMG_GOTEXP			= 4,	--InGame\\经验.tga

	IMG_GOTMONEY			= 5,	--InGame\\金钱.tga
	IMG_DEADLYSTRIKE		= 6,	--InGame\\爆击.tga
	IMG_GOTSP			= 7,	--InGame\\元神.tga
	IMG_GOTREPUTATION		= 8,	--InGame\\威望.tga
	IMG_GOTREGIONREPU		= 9,	--InGame\\友好度.tga

	IMG_INVALIDHIT			= 10,	--InGame\\无效.tga
	IMG_HPWARN			= 13,	--InGame\\hp_warn.tga
	IMG_MPWARN			= 14,	--InGame\\mp_warn.tga

	IMG_RETORT			= 15,	--InGame\\反震.tga
	IMG_IMMUNE			= 16,	--InGame\\免疫.tga

	IMG_RESIST			= 23,	--InGame\\抵抗.tga
	IMG_ABSORB			= 24,	--InGame\\吸收.tga

	IMG_POPUPNUM_RED		= 128+16,	--InGame\\头顶数字红.tga
	IMG_POPUPNUM_YELLOW		= 129+16,	--InGame\\头顶数字黄.tga
	IMG_POPUPNUM_WHITE		= 130+16,	--InGame\\头顶数字白.tga

	IMG_GOTFORCE			= 131+16,	--InGame\\功力.tga

	IMG_HITMISS_UPPER		= 132+16,	--InGame\\上闪.tga
	IMG_HITMISS_LOWER		= 133+16,	--InGame\\下闪.tga
	IMG_HITMISS_STRAIGHT		= 134+16,	--InGame\\横闪.tga
	IMG_HITMISS_HORIZONTAL		= 135+16,	--InGame\\纵闪.tga
	IMG_INHIBITED			= 136+16,	--InGame\\被克制.tga
	IMG_BREAKED			= 137+16,	--InGame\\被打断.tga
	IMG_HITSUSPEND			= 138+16,	--InGame\\击飞.tga
	IMG_HITCOLLAPSE			= 139+16,	--InGame\\击溃.tga
	IMG_HITTUMBLE			= 140+16,	--InGame\\击倒.tga
	IMG_INHIBIT			= 136+16,	--InGame\\被克制.tga
	IMG_BREAK			= 137+16,	--InGame\\被打断.tga
}

BubbleObjType =
{
	Self 			= 0, 	-- 自己
	SelfPet 		= 1, 	-- 自己的宠物
	ElsePlayer		= 2, 	-- 别的玩家
	ElsePet			= 3,	-- 别人的宠物
	NPC			= 4,	-- 其他NPC
}

BubbleStartPosType =
{
	Head			= 0,	--从头顶冒出
	HitPoint		= 1,	--从打击点冒出
}

BubbleImageColor =
{
	--	0
	[BubbleTypeID.Damage]		=
	{
		BubbleImageID.IMG_INVALID,		-- 文字哪个图片(文字显示在数字前面). IMG_INVALID表示没有
		BubbleImageID.IMG_POPUPNUM_WHITE,	-- 数字哪个图片

		0,				-- 开始时保持不飘的时间
		BubbleStartPosType.Head,	-- 冒字起始点
		5,				-- 3D模式飘的水平初速度（米/秒）
		0,				-- 3D模式飘的水平加速度（米/秒^2）
		-45, 45,			-- 3D模式飘的水平偏弦角度范围（度）
		1,				-- 3D模式飘的竖直初速度（米/秒）
		-13,				-- 3D模式飘的竖直加速度（米/秒^2）

		0,			-- 跳出时在图片上叠加的颜色（全0表示不生效）

	 	{	 --是否显示	-- 颜色  --缩放	--是否跳出  --是否排版  --排版时强制上飘 -- 延迟显示的时间 --飘动持续时间  --2D模式上飘速度  --是否显示在最前
	 		{	true,			0xf16a4a,		0.6,	true		,	true	,				false	  						,0					,350							,-60				 			,true				        },	-- 自己
	 		{	true,			0xf16a4a,		0.4,	true		,	true	,				false	  						,0					,350							,-30				 			,true				        },	-- 自己的宠物
	 		{	true,			0xffffff,		0.4,	true		,	true	,				false	  						,0					,350							,-10				 			,true				        },	-- 别的玩家
	 		{	true,			0xffffff,		0.25,	true		,	true	,				false	  						,0					,350							,-10				 			,true				        },	-- 别人的宠物
	 		{	true,			0xffffff,		0.6,	true		,	true	,				false	  						,0					,350							,-10				 			,true				        },	-- 其他NPC
	 	},
	},
	[BubbleTypeID.SkillDamage]	=
	{
		BubbleImageID.IMG_INVALID,			-- 文字哪个图片(文字显示在数字前面). IMG_INVALID表示没有--0xf16a4a（原红色）
		BubbleImageID.IMG_POPUPNUM_WHITE,		-- 数字哪个图片

		0,				-- 开始时保持不飘的时间
		BubbleStartPosType.Head,	-- 冒字起始点
		3,				-- 3D模式飘的水平初速度（米/秒）
		0,				-- 3D模式飘的水平加速度（米/秒^2）
		-45, 45,			-- 3D模式飘的水平偏弦角度范围（度）
		5,				-- 3D模式飘的竖直初速度（米/秒）
		-15,				-- 3D模式飘的竖直加速度（米/秒^2）

		0,			-- 跳出时在图片上叠加的颜色（全0表示不生效）

	 	{	 --是否显示	-- 颜色  --缩放	--是否跳出  --是否排版  --排版时强制上飘 -- 延迟显示的时间 --飘动持续时间  --2D模式上飘速度  --是否显示在最前
	 		{	true,			0xf16a4a,		0.6,	true		,	true	,				false	  						,0					,1000							,-60				 			,true				        },	-- 自己
	 		{	true,			0xf16a4a,		0.4,	true		,	true	,				false	  						,0					,1000							,-30				 			,true				        },	-- 自己的宠物
	 		{	true,			0xffffff,		0.45,	true		,	true	,				false	  						,0					,1000							,-10				 			,true				        },	-- 别的玩家
	 		{	true,			0xffffff,		0.3,	true		,	true	,				false	  						,0					,1000							,-10				 			,true				        },	-- 别人的宠物
	 		{	true,			0xffffff,		0.6,	true		,	true	,				false	  						,0					,1000							,-10				 			,true				        },	-- 其他NPC
	 	},
	},
	[BubbleTypeID.CritDamage]	=
	{
		BubbleImageID.IMG_INVALID,		-- 文字哪个图片(文字显示在数字前面). IMG_INVALID表示没有
		BubbleImageID.IMG_POPUPNUM_WHITE,	-- 数字哪个图片

		0,				-- 开始时保持不飘的时间
		BubbleStartPosType.Head,	-- 冒字起始点
		5,				-- 3D模式飘的水平初速度（米/秒）
		0,				-- 3D模式飘的水平加速度（米/秒^2）
		-45, 45,			-- 3D模式飘的水平偏弦角度范围（度）
		1,				-- 3D模式飘的竖直初速度（米/秒）
		-13,				-- 3D模式飘的竖直加速度（米/秒^2）

		0,			-- 跳出时在图片上叠加的颜色（全0表示不生效）

	 	{	 --是否显示	-- 颜色    --缩放	--是否跳出  --是否排版  --排版时强制上飘   -- 延迟显示的时间 --飘动持续时间 --2D模式上飘速度 --是否显示在最前
	 		{	true,	0xf16a4a,	1.2,	true		,	false	,	false	  		,0				,200			,-60			 	,true				 },	    -- 自己
	 		{	true,	0xf16a4a,	1.2,	true		,	false	,	false	  		,0				,200			,-30			 	,true				 },	    -- 自己的宠物
	 		{	true,	0xfc0b0b,	1.2,	true		,	false	,	false	  		,0				,200			,-30			 	,true				 },	    -- 别的玩家
	 		{	true,	0xfc0b0b,	1.2,	true		,	false	,	false	  		,0				,200			,-30			 	,true				 },	    -- 别人的宠物
	 		{	true,	0xfc0b0b,	1.2,	true		,	false	,	false	  		,0				,230			,-30			 	,true				 },	    -- 其他NPC
	 	},
	},
	[BubbleTypeID.RetortDamage]	=
	{
		BubbleImageID.IMG_RETORT,		-- 文字哪个图片(文字显示在数字前面). IMG_INVALID表示没有
		BubbleImageID.IMG_POPUPNUM_RED,		-- 数字哪个图片

		0,				-- 开始时保持不飘的时间
		BubbleStartPosType.Head,	-- 冒字起始点
		5,				-- 3D模式飘的水平初速度（米/秒）
		0,				-- 3D模式飘的水平加速度（米/秒^2）
		-45, 45,			-- 3D模式飘的水平偏弦角度范围（度）
		1,				-- 3D模式飘的竖直初速度（米/秒）
		-13,				-- 3D模式飘的竖直加速度（米/秒^2）

		0,			-- 跳出时在图片上叠加的颜色（全0表示不生效）

	 	{	 --是否显示	-- 颜色    --缩放	--是否跳出  --是否排版  --排版时强制上飘   -- 延迟显示的时间  --飘动持续时间  --2D模式上飘速度 --是否显示在最前
	 		{	true,		0xff0000,				0.5,	true		,	false	,			false	  		,0					,200			,-60				,true				},		-- 自己
	 		{	true,		0xff3300,				0.5,	false		,	true	,			false	  		,0					,200			,-30				,true				},		-- 自己的宠物
	 		{	true,		0xffffff,				0.5,	false		,	true	,			false	  		,0					,200			,-30				,true				},		-- 别的玩家
	 		{	true,		0xffaaaa,				0.5,	false		,	true	,			false	  		,0					,200			,-30				,true				},		-- 别人的宠物
	 		{	true,		0xffcd4b,				0.5,	false		,	true	,			false	  		,0					,200			,-30				,true				},		-- 其他NPC
	 	},
	},
	[BubbleTypeID.GradualHurt]	=
	{
		BubbleImageID.IMG_INVALID,		-- 文字哪个图片(文字显示在数字前面). IMG_INVALID表示没有
		BubbleImageID.IMG_POPUPNUM_YELLOW,	-- 数字哪个图片

		0,				-- 开始时保持不飘的时间
		BubbleStartPosType.Head,	-- 冒字起始点
		5,				-- 3D模式飘的水平初速度（米/秒）
		0,				-- 3D模式飘的水平加速度（米/秒^2）
		-45, 45,			-- 3D模式飘的水平偏弦角度范围（度）
		1,				-- 3D模式飘的竖直初速度（米/秒）
		-13,				-- 3D模式飘的竖直加速度（米/秒^2）

		0,			-- 跳出时在图片上叠加的颜色（全0表示不生效）

	 	{	 --是否显示	-- 颜色     --缩放	--是否跳出  --是否排版  --排版时强制上飘   -- 延迟显示的时间  --飘动持续时间    --2D模式上飘速度  --是否显示在最前
	 		{	true,	0xff0000,	0.5,	true		,	true	,	false	  		,0					,350			,-60			  	,true				 },	-- 自己
	 		{	true,	0xff3300,	0.6,	true		,	true	,	false	  		,0					,350			,-30			  	,true				 },	-- 自己的宠物
	 		{	true,	0xffffff,	0.5,	true		,	true	,	false	  		,0					,350			,-10			  	,true				 },	-- 别的玩家
	 		{	true,	0xffaaaa,	0.6,	true		,	true	,	false	  		,0					,350			,-10			  	,true				 },	-- 别人的宠物
	 		{	true,	0xffffff,	0.5,	true		,	true	,	false	  		,0					,350			,-10			  	,true				 },	-- 其他NPC
	 	},
	},
	[BubbleTypeID.Exp]			=
	{
		BubbleImageID.IMG_GOTEXP,	-- 文字哪个图片(文字显示在数字前面). IMG_INVALID表示没有
		BubbleImageID.IMG_POPUPNUM,	-- 数字哪个图片

		0,				-- 开始时保持不飘的时间
		BubbleStartPosType.Head,	-- 冒字起始点
		5,				-- 3D模式飘的水平初速度（米/秒）
		0,				-- 3D模式飘的水平加速度（米/秒^2）
		-45, 45,			-- 3D模式飘的水平偏弦角度范围（度）
		1,				-- 3D模式飘的竖直初速度（米/秒）
		-13,				-- 3D模式飘的竖直加速度（米/秒^2）

		0,			-- 跳出时在图片上叠加的颜色（全0表示不生效）

	 	{	 --是否显示	-- 颜色     --缩放	--是否跳出  --是否排版  --排版时强制上飘   -- 延迟显示的时间   --飘动持续时间   --2D模式上飘速度 --是否显示在最前
	 		{	true,	0xffffff,	0.62,	false		,	false	,	true	  		,0					,200			,-60			 	,false				 },		-- 自己
	 		{	true,	0xffd83a,	0.62,	false		,	false	,	true	  		,0					,200			,-30			 	,false				 },		-- 自己的宠物
	 		{	true,	0xffd83a,	0.62,	false		,	false	,	true	  		,0					,200			,-30			 	,false				 },		-- 别的玩家
	 		{	true,	0xffd83a,	0.62,	false		,	false	,	true	  		,0					,200			,-30			 	,false				 },		-- 别人的宠物
	 		{	true,	0xffd83a,	0.62,	false		,	false	,	true	  		,0					,200			,-30			 	,false				 },		-- 其他NPC
	 	},
	},

	--	5
	[BubbleTypeID.SP]			=
	{
		BubbleImageID.IMG_GOTSP,	-- 文字哪个图片(文字显示在数字前面). IMG_INVALID表示没有
		BubbleImageID.IMG_POPUPNUM,	-- 数字哪个图片

		0,				-- 开始时保持不飘的时间
		BubbleStartPosType.Head,	-- 冒字起始点
		5,				-- 3D模式飘的水平初速度（米/秒）
		0,				-- 3D模式飘的水平加速度（米/秒^2）
		-45, 45,			-- 3D模式飘的水平偏弦角度范围（度）
		1,				-- 3D模式飘的竖直初速度（米/秒）
		-13,				-- 3D模式飘的竖直加速度（米/秒^2）

		0,			-- 跳出时在图片上叠加的颜色（全0表示不生效）

	 	{	 --是否显示	-- 颜色     --缩放	--是否跳出  --是否排版  --排版时强制上飘   -- 延迟显示的时间  --飘动持续时间  --2D模式上飘速度  --是否显示在最前
	 		{	true,	0xffffff,	1.0,	false		,	false	,	true	  		,0					,300			,-60				,false				    },		-- 自己
	 		{	true,	0xffffff,	1.0,	false		,	false	,	true	  		,0					,300			,-30				,false				    },		-- 自己的宠物
	 		{	true,	0xffffff,	1.0,	false		,	false	,	true	  		,0					,300			,-30				,false				    },		-- 别的玩家
	 		{	true,	0xffffff,	1.0,	false		,	false	,	true	  		,0					,300			,-30				,false				    },		-- 别人的宠物
	 		{	true,	0xffffff,	1.0,	false		,	false	,	true	  		,0					,300			,-30				,false				    },		-- 其他NPC
	 	},
	},
	[BubbleTypeID.Reputaion]	=
	{
		BubbleImageID.IMG_GOTREPUTATION,	-- 文字哪个图片(文字显示在数字前面). IMG_INVALID表示没有
		BubbleImageID.IMG_POPUPNUM,		-- 数字哪个图片

		0,				-- 开始时保持不飘的时间
		BubbleStartPosType.Head,	-- 冒字起始点
		5,				-- 3D模式飘的水平初速度（米/秒）
		0,				-- 3D模式飘的水平加速度（米/秒^2）
		-45, 45,			-- 3D模式飘的水平偏弦角度范围（度）
		1,				-- 3D模式飘的竖直初速度（米/秒）
		-13,				-- 3D模式飘的竖直加速度（米/秒^2）

		0,			-- 跳出时在图片上叠加的颜色（全0表示不生效）

	 	{	 --是否显示	-- 颜色    --缩放	--是否跳出  --是否排版  --排版时强制上飘   -- 延迟显示的时间   --飘动持续时间   --2D模式上飘速度 --是否显示在最前
	 		{	true,	0xff00ff,	1.0,	false		,	false	,	true	  		,0					,400			,-60			 	,false				 },	    	   -- 自己
	 		{	true,	0xff00ff,	1.0,	false		,	false	,	true	  		,0					,400			,-30			 	,false				 },	    	   -- 自己的宠物
	 		{	true,	0xff00ff,	1.0,	false		,	false	,	true	  		,0					,400			,-30			 	,false				 },	    	   -- 别的玩家
	 		{	true,	0xff00ff,	1.0,	false		,	false	,	true	  		,0					,400			,-30			 	,false				 },	    	   -- 别人的宠物
	 		{	true,	0xff00ff,	1.0,	false		,	false	,	true	  		,0					,400			,-30			 	,false				 },	    	   -- 其他NPC
	 	},
	},
	[BubbleTypeID.RegionRepu]	=
	{
		BubbleImageID.IMG_GOTREGIONREPU,	-- 文字哪个图片(文字显示在数字前面). IMG_INVALID表示没有
		BubbleImageID.IMG_POPUPNUM,		-- 数字哪个图片

		0,				-- 开始时保持不飘的时间
		BubbleStartPosType.Head,	-- 冒字起始点
		5,				-- 3D模式飘的水平初速度（米/秒）
		0,				-- 3D模式飘的水平加速度（米/秒^2）
		-45, 45,			-- 3D模式飘的水平偏弦角度范围（度）
		1,				-- 3D模式飘的竖直初速度（米/秒）
		-13,				-- 3D模式飘的竖直加速度（米/秒^2）

		0,			-- 跳出时在图片上叠加的颜色（全0表示不生效）

	 	{	 --是否显示	-- 颜色     --缩放	--是否跳出  --是否排版  --排版时强制上飘   -- 延迟显示的时间  --飘动持续时间  --2D模式上飘速度   --是否显示在最前
	 		{	true,	0xff00ff,	1.0,	true		,	false	,	true	  		,0					,400			,-60			 	,false				    },		-- 自己
	 		{	true,	0xff00ff,	1.0,	true		,	false	,	true	  		,0					,400			,-30			 	,false				    },		-- 自己的宠物
	 		{	true,	0xff00ff,	1.0,	true		,	false	,	true	  		,0					,400			,-30			 	,false				    },		-- 别的玩家
	 		{	true,	0xff00ff,	1.0,	true		,	false	,	true	  		,0					,400			,-30			 	,false				    },		-- 别人的宠物
	 		{	true,	0xff00ff,	1.0,	true		,	false	,	true	  		,0					,400			,-30			 	,false				    },		-- 其他NPC
	 	},
	},
	[BubbleTypeID.Money]		=
	{
		BubbleImageID.IMG_GOTMONEY,	-- 文字哪个图片(文字显示在数字前面). IMG_INVALID表示没有
		BubbleImageID.IMG_POPUPNUM,	-- 数字哪个图片

		0,				-- 开始时保持不飘的时间
		BubbleStartPosType.Head,	-- 冒字起始点
		5,				-- 3D模式飘的水平初速度（米/秒）
		0,				-- 3D模式飘的水平加速度（米/秒^2）
		-45, 45,			-- 3D模式飘的水平偏弦角度范围（度）
		1,				-- 3D模式飘的竖直初速度（米/秒）
		-13,				-- 3D模式飘的竖直加速度（米/秒^2）

		0,			-- 跳出时在图片上叠加的颜色（全0表示不生效）

	 	{	 --是否显示	-- 颜色     --缩放	--是否跳出  --是否排版  --排版时强制上飘  -- 延迟显示的时间   --飘动持续时间   --2D模式上飘速度  --是否显示在最前
	 		{	true,	0xffffff,	1.0,	true		,	false	,	true	  		,0					,400			,-60			 	,false				    },		-- 自己
	 		{	true,	0xffffff,	1.0,	true		,	false	,	true	  		,0					,400			,-30			 	,false				    },		-- 自己的宠物
	 		{	true,	0xffffff,	1.0,	true		,	false	,	true	  		,0					,400			,-30			 	,false				    },		-- 别的玩家
	 		{	true,	0xffffff,	1.0,	true		,	false	,	true	  		,0					,400			,-30			 	,false				    },		-- 别人的宠物
	 		{	true,	0xffffff,	1.0,	true		,	false	,	true	  		,0					,400			,-30			 	,false				    },		-- 其他NPC
	 	},
	},
	[BubbleTypeID.LevelUp]		=
	{
		BubbleImageID.IMG_INVALID,	-- 文字哪个图片(文字显示在数字前面). IMG_INVALID表示没有
		BubbleImageID.IMG_LEVELUP,	-- 数字哪个图片

		0,				-- 开始时保持不飘的时间
		BubbleStartPosType.Head,	-- 冒字起始点
		5,				-- 3D模式飘的水平初速度（米/秒）
		5,				-- 3D模式飘的水平加速度（米/秒^2）
		-45, 45,			-- 3D模式飘的水平偏弦角度范围（度）
		1,				-- 3D模式飘的竖直初速度（米/秒）
		-13,				-- 3D模式飘的竖直加速度（米/秒^2）

		0,			-- 跳出时在图片上叠加的颜色（全0表示不生效）

	 	{	 --是否显示	-- 颜色     --缩放	--是否跳出  --是否排版  --排版时强制上飘   -- 延迟显示的时间   --飘动持续时间   --2D模式上飘速度 --是否显示在最前
	 		{	true,	0xffffff,	1.0,	false		,	false	,	true	  		,0					,2000			,-20			 	,true				 },		-- 自己
	 		{	true,	0xffff00,	0.8,	false		,	false	,	true	  		,0					,2000			,-30			 	,false				 },		-- 自己的宠物
	 		{	true,	0xffff00,	0.6,	false		,	false	,	true	  		,0					,2000			,-30			 	,false				 },		-- 别的玩家
	 		{	true,	0xffff00,	0.6,	false		,	false	,	true	  		,0					,2000			,-30			 	,false				 },		-- 别人的宠物
	 		{	true,	0xffff00,	1.0,	false		,	false	,	true	  		,0					,2000			,-30			 	,false				 },		-- 其他NPC
	 	},
	},

	[BubbleTypeID.HitMissed]	=
	{
		BubbleImageID.IMG_INVALID,	-- 文字哪个图片(文字显示在数字前面). IMG_INVALID表示没有
		BubbleImageID.IMG_HITMISSED,	-- 数字哪个图片

		0,				-- 开始时保持不飘的时间
		BubbleStartPosType.Head,	-- 冒字起始点
		5,				-- 3D模式飘的水平初速度（米/秒）
		0,				-- 3D模式飘的水平加速度（米/秒^2）
		-45, 45,			-- 3D模式飘的水平偏弦角度范围（度）
		1,				-- 3D模式飘的竖直初速度（米/秒）
		-13,				-- 3D模式飘的竖直加速度（米/秒^2）

		0,			-- 跳出时在图片上叠加的颜色（全0表示不生效）

	 	{	 --是否显示	-- 颜色     --缩放	--是否跳出  --是否排版  --排版时强制上飘   -- 延迟显示的时间    --飘动持续时间  --2D模式上飘速度 --是否显示在最前
	 		{	true,	0xffffff,	1.0,	false		,	false		,	false	  ,0					,200			,-60				,true				 },		-- 自己
	 		{	true,	0xffffff,	1.0,	false		,	true		,	false	  ,0					,200			,-30				,true				 },		-- 自己的宠物
	 		{	true,	0xffffff,	1.0,	false		,	true		,	false	  ,0					,200			,-30				,true				 },		-- 别的玩家
	 		{	true,	0xffffff,	0.9,	false		,	true		,	false	  ,0					,200			,-30				,true				 },		-- 别人的宠物
	 		{	true,	0xffffff,	1.0,	false		,	true		,	false	  ,0					,200			,-30				,true				 },		-- 其他NPC
	 	},
	},
	[BubbleTypeID.InvalidHit]	=
	{
		BubbleImageID.IMG_DEADLYSTRIKE,		-- 文字哪个图片(文字显示在数字前面). IMG_INVALID表示没有
		BubbleImageID.IMG_INVALIDHIT,		-- 数字哪个图片

		0,				-- 开始时保持不飘的时间
		BubbleStartPosType.Head,	-- 冒字起始点
		5,				-- 3D模式飘的水平初速度（米/秒）
		0,				-- 3D模式飘的水平加速度（米/秒^2）
		-45, 45,			-- 3D模式飘的水平偏弦角度范围（度）
		1,				-- 3D模式飘的竖直初速度（米/秒）
		-13,				-- 3D模式飘的竖直加速度（米/秒^2）

		0,			-- 跳出时在图片上叠加的颜色（全0表示不生效）

	 	{	 --是否显示	-- 颜色    --缩放	--是否跳出  --是否排版  --排版时强制上飘   -- 延迟显示的时间   --飘动持续时间 --2D模式上飘速度  --是否显示在最前
	 		{	true,	0xffffff,	1.2,	false		,	false		,	false	  ,0					,200			,-60				,true				    },	  	-- 自己
	 		{	true,	0xffffff,	1.1,	false		,	true		,	false	  ,0					,200			,-30				,true				    },	  	-- 自己的宠物
	 		{	true,	0xed3800,	1.0,	false		,	true		,	false	  ,0					,200			,-30				,true				    },	  	-- 别的玩家
	 		{	true,	0xed3800,	0.9,	false		,	true		,	false	  ,0					,200			,-30				,true				    },	  	-- 别人的宠物
	 		{	true,	0xed3800,	1.0,	false		,	true		,	false	  ,0					,200			,-30				,true				    },	  	-- 其他NPC
	 	},
	},
	[BubbleTypeID.Immune]		=
	{
		BubbleImageID.IMG_INVALID,	-- 文字哪个图片(文字显示在数字前面). IMG_INVALID表示没有
		BubbleImageID.IMG_IMMUNE,	-- 数字哪个图片

		0,				-- 开始时保持不飘的时间
		BubbleStartPosType.Head,	-- 冒字起始点
		5,				-- 3D模式飘的水平初速度（米/秒）
		0,				-- 3D模式飘的水平加速度（米/秒^2）
		-45, 45,			-- 3D模式飘的水平偏弦角度范围（度）
		1,				-- 3D模式飘的竖直初速度（米/秒）
		-13,				-- 3D模式飘的竖直加速度（米/秒^2）

		0,			-- 跳出时在图片上叠加的颜色（全0表示不生效）

	 	{	 --是否显示	-- 颜色    --缩放	--是否跳出  --是否排版  --排版时强制上飘    -- 延迟显示的时间   --飘动持续时间  --2D模式上飘速度 --是否显示在最前
	 		{	true,	0xffffff,	1.2,	false		,	false		,	false	  	,0					,200			,-60			 	,true				 },	  -- 自己
	 		{	true,	0xffffff,	1.1,	false		,	true		,	false	  	,0					,200			,-30			 	,true				 },	  -- 自己的宠物
	 		{	true,	0xed3800,	1.0,	false		,	true		,	false	  	,0					,200			,-30			 	,true				 },	  -- 别的玩家
	 		{	true,	0xed3800,	0.9,	false		,	true		,	false	  	,0					,200			,-30			 	,true				 },	  -- 别人的宠物
	 		{	true,	0xed3800,	1.0,	false		,	true		,	false	  	,0					,200			,-30			 	,true				 },	  -- 其他NPC
	 	},
	},
	[BubbleTypeID.HPWarn]		=
	{
		BubbleImageID.IMG_INVALID,	-- 文字哪个图片(文字显示在数字前面). IMG_INVALID表示没有
		BubbleImageID.IMG_HPWARN,	-- 数字哪个图片

		0,				-- 开始时保持不飘的时间
		BubbleStartPosType.Head,	-- 冒字起始点
		5,				-- 3D模式飘的水平初速度（米/秒）
		0,				-- 3D模式飘的水平加速度（米/秒^2）
		-45, 45,			-- 3D模式飘的水平偏弦角度范围（度）
		1,				-- 3D模式飘的竖直初速度（米/秒）
		-13,				-- 3D模式飘的竖直加速度（米/秒^2）

		0,			-- 跳出时在图片上叠加的颜色（全0表示不生效）

	 	{	 --是否显示	-- 颜色    --缩放	--是否跳出  --是否排版  --排版时强制上飘   -- 延迟显示的时间   --飘动持续时间  --2D模式上飘速度  --是否显示在最前
	 		{	true,	0xffffff,	0.8,	false		,	false	,	true	  		,0					,200			,-60			 	,false				    },		-- 自己
	 		{	true,	0xffffff,	0.8,	false		,	false	,	true	  		,0					,200			,-30			 	,false				    },		-- 自己的宠物
	 		{	true,	0xffffff,	0.7,	false		,	false	,	true	  		,0					,200			,-30			 	,false				    },		-- 别的玩家
	 		{	true,	0xffffff,	0.7,	false		,	false	,	true	  		,0					,200			,-30			 	,false				    },		-- 别人的宠物
	 		{	true,	0xffffff,	1.0,	false		,	false	,	true	  		,0					,200			,-30			 	,false				    },		-- 其他NPC
	 	},
	},
	[BubbleTypeID.MPWarn]		=
	{
		BubbleImageID.IMG_INVALID,	-- 文字哪个图片(文字显示在数字前面). IMG_INVALID表示没有
		BubbleImageID.IMG_MPWARN,	-- 数字哪个图片

		0,				-- 开始时保持不飘的时间
		BubbleStartPosType.Head,	-- 冒字起始点
		5,				-- 3D模式飘的水平初速度（米/秒）
		0,				-- 3D模式飘的水平加速度（米/秒^2）
		-45, 45,			-- 3D模式飘的水平偏弦角度范围（度）
		1,				-- 3D模式飘的竖直初速度（米/秒）
		-13,				-- 3D模式飘的竖直加速度（米/秒^2）

		0,			-- 跳出时在图片上叠加的颜色（全0表示不生效）

	 	{	 --是否显示	-- 颜色     --缩放	--是否跳出  --是否排版  --排版时强制上飘   -- 延迟显示的时间   --飘动持续时间  --2D模式上飘速度  --是否显示在最前
	 		{	true,	0xffffff,	1.0,	false		,	false	,	true	  		,0					,200			,-60			 	,false				    },	-- 自己
	 		{	true,	0xffffff,	0.8,	false		,	false	,	true	  		,0					,200			,-30			 	,false				    },	-- 自己的宠物
	 		{	true,	0xffffff,	0.7,	false		,	false	,	true	  		,0					,200			,-30			 	,false				    },	-- 别的玩家
	 		{	true,	0xffffff,	0.7,	false		,	false	,	true	  		,0					,200			,-30			 	,false				    },	-- 别人的宠物
	 		{	true,	0xffffff,	1.0,	false		,	false	,	true	  		,0					,200			,-30			 	,false				    },	-- 其他NPC
	 	},
	},

	--	15
	[BubbleTypeID.Heal]			=
	{
		BubbleImageID.IMG_INVALID,	-- 文字哪个图片(文字显示在数字前面). IMG_INVALID表示没有
		BubbleImageID.IMG_POPUPNUM,	-- 数字哪个图片

		0,				-- 开始时保持不飘的时间
		BubbleStartPosType.Head,	-- 冒字起始点
		5,				-- 3D模式飘的水平初速度（米/秒）
		0,				-- 3D模式飘的水平加速度（米/秒^2）
		-45, 45,			-- 3D模式飘的水平偏弦角度范围（度）
		1,				-- 3D模式飘的竖直初速度（米/秒）
		-13,				-- 3D模式飘的竖直加速度（米/秒^2）

		0,			-- 跳出时在图片上叠加的颜色（全0表示不生效）

	 	{	 --是否显示	-- 颜色     --缩放	--是否跳出  --是否排版  --排版时强制上飘   -- 延迟显示的时间   --飘动持续时间  --2D模式上飘速度   --是否显示在最前
	 		{	true,	0x7cd64b,	0.8,	false		,	false	,	true	  		,0					,200			,-60			  	,true				    },		-- 自己
	 		{	true,	0x7cd64b,	0.6,	false		,	false	,	true	  		,0					,200			,-30			  	,true				    },		-- 自己的宠物
	 		{	true,	0x7cd64b,	0.8,	false		,	false	,	true	  		,0					,200			,-30			  	,true				    },		-- 别的玩家
	 		{	true,	0x7cd64b,	0.6,	false		,	false	,	true	  		,0					,200			,-30			  	,true				    },		-- 别人的宠物
	 		{	true,	0x7cd64b,	0.8,	false		,	false	,	true	  		,0					,200			,-30			  	,true				    },		-- 其他NPC
	 	},
	},
	[BubbleTypeID.Resist]		=
	{
		BubbleImageID.IMG_INVALID,	-- 文字哪个图片(文字显示在数字前面). IMG_INVALID表示没有
		BubbleImageID.IMG_RESIST,	-- 数字哪个图片

		0,				-- 开始时保持不飘的时间
		BubbleStartPosType.Head,	-- 冒字起始点
		5,				-- 3D模式飘的水平初速度（米/秒）
		0,				-- 3D模式飘的水平加速度（米/秒^2）
		-45, 45,			-- 3D模式飘的水平偏弦角度范围（度）
		1,				-- 3D模式飘的竖直初速度（米/秒）
		-13,				-- 3D模式飘的竖直加速度（米/秒^2）

		0,			-- 跳出时在图片上叠加的颜色（全0表示不生效）

	 	{	 --是否显示	-- 颜色     --缩放	--是否跳出  --是否排版  --排版时强制上飘   -- 延迟显示的时间   --飘动持续时间   --2D模式上飘速度  --是否显示在最前
	 		{	true,	0xffffff,	1.2,	false		,	false	,	true	  		,0					,200			,-60			  	,true				},		-- 自己
	 		{	true,	0xffffff,	1.1,	false		,	false	,	true	  		,0					,200			,-30			  	,true				},		-- 自己的宠物
	 		{	true,	0xed3800,	1.0,	false		,	false	,	true	  		,0					,200			,-30			  	,true				},		-- 别的玩家
	 		{	true,	0xed3800,	0.9,	false		,	false	,	true	  		,0					,200			,-30			  	,true				},		-- 别人的宠物
	 		{	true,	0xed3800,	1.0,	false		,	false	,	true	  		,0					,200			,-30			  	,true				},		-- 其他NPC
	 	},
	},
	[BubbleTypeID.Absorb]		=
	{
		BubbleImageID.IMG_INVALID,	-- 文字哪个图片(文字显示在数字前面). IMG_INVALID表示没有
		BubbleImageID.IMG_ABSORB,	-- 数字哪个图片

		0,				-- 开始时保持不飘的时间
		BubbleStartPosType.Head,	-- 冒字起始点
		5,				-- 3D模式飘的水平初速度（米/秒）
		0,				-- 3D模式飘的水平加速度（米/秒^2）
		-45, 45,			-- 3D模式飘的水平偏弦角度范围（度）
		1,				-- 3D模式飘的竖直初速度（米/秒）
		-13,				-- 3D模式飘的竖直加速度（米/秒^2）

		0,			-- 跳出时在图片上叠加的颜色（全0表示不生效）

	 	{	 --是否显示	-- 颜色     --缩放	--是否跳出  --是否排版  --排版时强制上飘   -- 延迟显示的时间   --飘动持续时间   --2D模式上飘速度 --是否显示在最前
	 		{	true,	0xffffff,	1.2,	false		,	false	,	true	  		,0					,200			,-60			 	,true				 },		-- 自己
	 		{	true,	0xffffff,	1.1,	false		,	false	,	true	  		,0					,200			,-30			 	,true				 },		-- 自己的宠物
	 		{	true,	0xed3800,	1.0,	false		,	false	,	true	  		,0					,200			,-30			 	,true				 },		-- 别的玩家
	 		{	true,	0xed3800,	0.9,	false		,	false	,	true	  		,0					,200			,-30			 	,true				 },		-- 别人的宠物
	 		{	true,	0xed3800,	1.0,	false		,	false	,	true	  		,0					,200			,-30			 	,true				 },		-- 其他NPC
	 	},
	},
	[BubbleTypeID.SkillEffect]	=
	{
		BubbleImageID.IMG_INVALID,	-- 文字哪个图片（这个比较特殊，程序会根据职业计算）
		BubbleImageID.IMG_INVALID,	-- 数字哪个图片

		0,				-- 开始时保持不飘的时间
		BubbleStartPosType.Head,	-- 冒字起始点
		5,				-- 3D模式飘的水平初速度（米/秒）
		0,				-- 3D模式飘的水平加速度（米/秒^2）
		-45, 45,			-- 3D模式飘的水平偏弦角度范围（度）
		1,				-- 3D模式飘的竖直初速度（米/秒）
		-13,				-- 3D模式飘的竖直加速度（米/秒^2）

		0,			-- 跳出时在图片上叠加的颜色（全0表示不生效）

	 	{	 --是否显示	-- 颜色     --缩放	--是否跳出  --是否排版  --排版时强制上飘   -- 延迟显示的时间   --飘动持续时间  --2D模式上飘速度  --是否显示在最前
	 		{	true,	0xff0000,	1.2,	true		,	false	,	true	  		,0					,200			,-60			 	,true				    },		-- 自己
	 		{	true,	0xff3300,	1.1,	true		,	false	,	true	  		,0					,200			,-30			 	,true				    },		-- 自己的宠物
	 		{	true,	0xffffff,	1.0,	true		,	false	,	true	  		,0					,200			,-30			 	,true				    },		-- 别的玩家
	 		{	true,	0xffaaaa,	0.9,	true		,	false	,	true	  		,0					,200			,-30			 	,true				    },		-- 别人的宠物
	 		{	true,	0xffffff,	1.0,	true		,	false	,	true	  		,0					,200			,-30			 	,true				    },		-- 其他NPC
	 	},
	},
	[BubbleTypeID.Force] =
	{
		BubbleImageID.IMG_GOTFORCE,	-- 文字哪个图片(文字显示在数字前面). IMG_INVALID表示没有
		BubbleImageID.IMG_POPUPNUM,	-- 数字哪个图片

		0,				-- 开始时保持不飘的时间
		BubbleStartPosType.Head,	-- 冒字起始点
		5,				-- 3D模式飘的水平初速度（米/秒）
		0,				-- 3D模式飘的水平加速度（米/秒^2）
		-45, 45,			-- 3D模式飘的水平偏弦角度范围（度）
		1,				-- 3D模式飘的竖直初速度（米/秒）
		-13,				-- 3D模式飘的竖直加速度（米/秒^2）

		0,			-- 跳出时在图片上叠加的颜色（全0表示不生效）

	 	{	 --是否显示	-- 颜色     --缩放	--是否跳出  --是否排版  --排版时强制上飘   -- 延迟显示的时间  --飘动持续时间  --2D模式上飘速度   --是否显示在最前
	 		{	true,	0xffffff,	0.8,	false		,	false	,	true	  		,0					,200			,-60			 	,false				   },		-- 自己
	 		{	true,	0xffd83a,	0.8,	false		,	false	,	true	  		,0					,200			,-30			 	,false				   },		-- 自己的宠物
	 		{	true,	0xffd83a,	0.8,	false		,	false	,	true	  		,0					,200			,-30			 	,false				   },		-- 别的玩家
	 		{	true,	0xffd83a,	0.8,	false		,	false	,	true	  		,0					,200			,-30			 	,false				   },		-- 别人的宠物
	 		{	true,	0xffd83a,	0.8,	false		,	false	,	true	  		,0					,200			,-30			 	,false				   },		-- 其他NPC
	 	},
	},
	[BubbleTypeID.HitMiss_Upper] =
	{
		BubbleImageID.IMG_HITMISS_UPPER,	-- 文字哪个图片(文字显示在数字前面). IMG_INVALID表示没有
		BubbleImageID.IMG_INVALID,		-- 数字哪个图片

		0,				-- 开始时保持不飘的时间
		BubbleStartPosType.Head,	-- 冒字起始点
		5,				-- 3D模式飘的水平初速度（米/秒）
		0,				-- 3D模式飘的水平加速度（米/秒^2）
		-45, 45,			-- 3D模式飘的水平偏弦角度范围（度）
		1,				-- 3D模式飘的竖直初速度（米/秒）
		-13,				-- 3D模式飘的竖直加速度（米/秒^2）

		0,			-- 跳出时在图片上叠加的颜色（全0表示不生效）

	 	{	 --是否显示	-- 颜色     --缩放	--是否跳出  --是否排版  --排版时强制上飘   -- 延迟显示的时间  --飘动持续时间 --2D模式上飘速度  --是否显示在最前
	 		{	true,	0xffffff,	1.0,	false		,	true	,	false	  		,100				,200			,-60				,true				   },		-- 自己
	 		{	true,	0xffffff,	1.0,	false		,	true	,	false	  		,100				,200			,-30				,true				   },		-- 自己的宠物
	 		{	true,	0xffffff,	1.0,	false		,	true	,	false	  		,100				,200			,-30				,true				   },		-- 别的玩家
	 		{	true,	0xffffff,	1.0,	false		,	true	,	false	  		,100				,200			,-30				,true				   },		-- 别人的宠物
	 		{	true,	0xffffff,	1.0,	false		,	true	,	false	  		,100				,200			,-30				,true				   },		-- 其他NPC
	 	},
	},
	[BubbleTypeID.HitMiss_Lower] =
	{
		BubbleImageID.IMG_HITMISS_LOWER,	-- 文字哪个图片(文字显示在数字前面). IMG_INVALID表示没有
		BubbleImageID.IMG_INVALID,		-- 数字哪个图片

		0,				-- 开始时保持不飘的时间
		BubbleStartPosType.Head,	-- 冒字起始点
		5,				-- 3D模式飘的水平初速度（米/秒）
		0,				-- 3D模式飘的水平加速度（米/秒^2）
		-45, 45,			-- 3D模式飘的水平偏弦角度范围（度）
		1,				-- 3D模式飘的竖直初速度（米/秒）
		-13,				-- 3D模式飘的竖直加速度（米/秒^2）

		0,			-- 跳出时在图片上叠加的颜色（全0表示不生效）

	 	{	 --是否显示	-- 颜色     --缩放	--是否跳出  --是否排版  --排版时强制上飘   -- 延迟显示的时间  --飘动持续时间 --2D模式上飘速度  --是否显示在最前
	 		{	true,	0xffffff,	1.0,	false		,	true	,	false	  		,100			  ,200			 ,-60			   	,true				},		-- 自己
	 		{	true,	0xffffff,	1.0,	false		,	true	,	false	  		,100			  ,200			 ,-30			   	,true				},		-- 自己的宠物
	 		{	true,	0xffffff,	1.0,	false		,	true	,	false	  		,100			  ,200			 ,-30			   	,true				},		-- 别的玩家
	 		{	true,	0xffffff,	1.0,	false		,	true	,	false	  		,100			  ,200			 ,-30			   	,true				},		-- 别人的宠物
	 		{	true,	0xffffff,	1.0,	false		,	true	,	false	  		,100			  ,200			 ,-30			   	,true				},		-- 其他NPC
	 	},
	},
	[BubbleTypeID.HitMiss_Straight] =
	{
		BubbleImageID.IMG_HITMISS_STRAIGHT,	-- 文字哪个图片(文字显示在数字前面). IMG_INVALID表示没有
		BubbleImageID.IMG_INVALID,		-- 数字哪个图片

		0,				-- 开始时保持不飘的时间
		BubbleStartPosType.Head,	-- 冒字起始点
		5,				-- 3D模式飘的水平初速度（米/秒）
		0,				-- 3D模式飘的水平加速度（米/秒^2）
		-45, 45,			-- 3D模式飘的水平偏弦角度范围（度）
		1,				-- 3D模式飘的竖直初速度（米/秒）
		-13,				-- 3D模式飘的竖直加速度（米/秒^2）

		0,			-- 跳出时在图片上叠加的颜色（全0表示不生效）

	 	{	 --是否显示	-- 颜色     --缩放	--是否跳出  --是否排版  --排版时强制上飘   -- 延迟显示的时间   --飘动持续时间 --2D模式上飘速度  --是否显示在最前
	 		{	true,	0xffffff,	1.0,	false		,	true	,	false	  		,100			   ,200			  ,-60			    	,true				},		-- 自己
	 		{	true,	0xffffff,	1.0,	false		,	true	,	false	  		,100			   ,200			  ,-30			    	,true				},		-- 自己的宠物
	 		{	true,	0xffffff,	1.0,	false		,	true	,	false	  		,100			   ,200			  ,-30			    	,true				},		-- 别的玩家
	 		{	true,	0xffffff,	1.0,	false		,	true	,	false	  		,100			   ,200			  ,-30			    	,true				},		-- 别人的宠物
	 		{	true,	0xffffff,	1.0,	false		,	true	,	false	  		,100			   ,200			  ,-30			    	,true				},		-- 其他NPC
	 	},
	},
	[BubbleTypeID.HitMiss_Horizontal] =
	{
		BubbleImageID.IMG_HITMISS_HORIZONTAL,	-- 文字哪个图片(文字显示在数字前面). IMG_INVALID表示没有
		BubbleImageID.IMG_INVALID,		-- 数字哪个图片

		0,				-- 开始时保持不飘的时间
		BubbleStartPosType.Head,	-- 冒字起始点
		5,				-- 3D模式飘的水平初速度（米/秒）
		0,				-- 3D模式飘的水平加速度（米/秒^2）
		-45, 45,			-- 3D模式飘的水平偏弦角度范围（度）
		1,				-- 3D模式飘的竖直初速度（米/秒）
		-13,				-- 3D模式飘的竖直加速度（米/秒^2）

		0,			-- 跳出时在图片上叠加的颜色（全0表示不生效）

	 	{	 --是否显示	-- 颜色     --缩放	--是否跳出  --是否排版  --排版时强制上飘  -- 延迟显示的时间  --飘动持续时间 --2D模式上飘速度 --是否显示在最前
	 		{	true,	0xffffff,	1.0,	false		,	true	,	false	  		,100			 ,200			,-60			 	,true				 },		-- 自己
	 		{	true,	0xffffff,	1.0,	false		,	true	,	false	  		,100			 ,200			,-30			 	,true				 },		-- 自己的宠物
	 		{	true,	0xffffff,	1.0,	false		,	true	,	false	  		,100			 ,200			,-30			 	,true				 },		-- 别的玩家
	 		{	true,	0xffffff,	1.0,	false		,	true	,	false	  		,100			 ,200			,-30			 	,true				 },		-- 别人的宠物
	 		{	true,	0xffffff,	1.0,	false		,	true	,	false	  		,100			 ,200			,-30			 	,true				 },		-- 其他NPC
	 	},
	},
	[BubbleTypeID.Inhibited] =
	{
		BubbleImageID.IMG_INHIBITED,	-- 文字哪个图片(文字显示在数字前面). IMG_INVALID表示没有
		BubbleImageID.IMG_INVALID,	-- 数字哪个图片

		0,				-- 开始时保持不飘的时间
		BubbleStartPosType.Head,	-- 冒字起始点
		5,				-- 3D模式飘的水平初速度（米/秒）
		0,				-- 3D模式飘的水平加速度（米/秒^2）
		-45, 45,			-- 3D模式飘的水平偏弦角度范围（度）
		1,				-- 3D模式飘的竖直初速度（米/秒）
		-13,				-- 3D模式飘的竖直加速度（米/秒^2）

		0,			-- 跳出时在图片上叠加的颜色（全0表示不生效）

	 	{	 --是否显示	-- 颜色     --缩放	--是否跳出  --是否排版  --排版时强制上飘  -- 延迟显示的时间 --飘动持续时间 --2D模式上飘速度  --是否显示在最前
	 		{	true,	0xffffff,	1.1,	true		,	false	,	true	  		,0				,0			   ,0			     	,true				},		-- 自己
	 		{	true,	0xffffff,	1.1,	true		,	false	,	true	  		,0				,0			   ,0			     	,true				},		-- 自己的宠物
	 		{	true,	0xffffff,	1.1,	true		,	false	,	true	  		,0				,0			   ,0			     	,true				},		-- 别的玩家
	 		{	true,	0xffffff,	1.1,	true		,	false	,	true	  		,0				,0			   ,0			     	,true				},		-- 别人的宠物
	 		{	true,	0xffffff,	1.1,	true		,	false	,	true	  		,0				,0			   ,0			     	,true				},		-- 其他NPC
	 	},
	},
	[BubbleTypeID.Breaked] =
	{
		BubbleImageID.IMG_BREAKED,	-- 文字哪个图片(文字显示在数字前面). IMG_INVALID表示没有
		BubbleImageID.IMG_INVALID,	-- 数字哪个图片

		0,				-- 开始时保持不飘的时间
		BubbleStartPosType.Head,	-- 冒字起始点
		5,				-- 3D模式飘的水平初速度（米/秒）
		0,				-- 3D模式飘的水平加速度（米/秒^2）
		-45, 45,			-- 3D模式飘的水平偏弦角度范围（度）
		1,				-- 3D模式飘的竖直初速度（米/秒）
		-13,				-- 3D模式飘的竖直加速度（米/秒^2）

		0,			-- 跳出时在图片上叠加的颜色（全0表示不生效）

	 	{	 --是否显示	-- 颜色     --缩放	--是否跳出  --是否排版  --排版时强制上飘  -- 延迟显示的时间 --飘动持续时间 --2D模式上飘速度 --是否显示在最前
	 		{	true,	0xffffff,	1.1,	true		,	false	,	true	  		,0				,0			   ,0			    	,true				},		-- 自己
	 		{	true,	0xffffff,	1.1,	true		,	false	,	true	  		,0				,0			   ,0			    	,true				},		-- 自己的宠物
	 		{	true,	0xffffff,	1.1,	true		,	false	,	true	  		,0				,0			   ,0			    	,true				},		-- 别的玩家
	 		{	true,	0xffffff,	1.1,	true		,	false	,	true	  		,0				,0			   ,0			    	,true				},		-- 别人的宠物
	 		{	true,	0xffffff,	1.1,	true		,	false	,	true	  		,0				,0			   ,0			    	,true				},		-- 其他NPC
	 	},
	},
	[BubbleTypeID.HitSuspend] =
	{
		BubbleImageID.IMG_HITSUSPEND,	-- 文字哪个图片(文字显示在数字前面). IMG_INVALID表示没有
		BubbleImageID.IMG_INVALID,	-- 数字哪个图片

		0,				-- 开始时保持不飘的时间
		BubbleStartPosType.Head,	-- 冒字起始点
		5,				-- 3D模式飘的水平初速度（米/秒）
		0,				-- 3D模式飘的水平加速度（米/秒^2）
		-45, 45,			-- 3D模式飘的水平偏弦角度范围（度）
		1,				-- 3D模式飘的竖直初速度（米/秒）
		-13,				-- 3D模式飘的竖直加速度（米/秒^2）

		0,			-- 跳出时在图片上叠加的颜色（全0表示不生效）

	 	{	 --是否显示	-- 颜色     --缩放	--是否跳出  --是否排版  --排版时强制上飘  -- 延迟显示的时间 --飘动持续时间--2D模式上飘速度  --是否显示在最前
	 		{	true,	0xffffff,	1.1,	true		,	false	,	false	  		,0				,0			  ,0			    	,true				},		-- 自己
	 		{	false,	0xffffff,	1.1,	true		,	false	,	true	  		,0				,0			  ,0			    	,true				},		-- 自己的宠物
	 		{	false,	0xffffff,	1.1,	true		,	false	,	true	  		,0				,0			  ,0			    	,true				},		-- 别的玩家
	 		{	false,	0xffffff,	1.1,	true		,	false	,	true	  		,0				,0			  ,0			    	,true				},		-- 别人的宠物
	 		{	false,	0xffffff,	1.1,	true		,	false	,	true	  		,0				,0			  ,0			    	,true				},		-- 其他NPC
	 	},
	},
	[BubbleTypeID.HitCollapse] =
	{
		BubbleImageID.IMG_HITCOLLAPSE,		-- 文字哪个图片(文字显示在数字前面). IMG_INVALID表示没有
		BubbleImageID.IMG_INVALID,		-- 数字哪个图片

		0,				-- 开始时保持不飘的时间
		BubbleStartPosType.Head,	-- 冒字起始点
		5,				-- 3D模式飘的水平初速度（米/秒）
		0,				-- 3D模式飘的水平加速度（米/秒^2）
		-45, 45,			-- 3D模式飘的水平偏弦角度范围（度）
		1,				-- 3D模式飘的竖直初速度（米/秒）
		-13,				-- 3D模式飘的竖直加速度（米/秒^2）

		0,			-- 跳出时在图片上叠加的颜色（全0表示不生效）

	 	{	 --是否显示	-- 颜色     --缩放	--是否跳出  --是否排版  --排版时强制上飘  -- 延迟显示的时间 --飘动持续时间 --2D模式上飘速度  --是否显示在最前
	 		{	true,	0xffffff,	1.1,	false		,	false	,	false	  		,0				,0			   ,0			     	,true				},		-- 自己
	 		{	false,	0xffffff,	1.1,	true		,	false	,	true	  		,0				,0			   ,0			     	,true				},		-- 自己的宠物
	 		{	false,	0xffffff,	1.1,	true		,	false	,	true	  		,0				,0			   ,0			     	,true				},		-- 别的玩家
	 		{	false,	0xffffff,	1.1,	true		,	false	,	true	  		,0				,0			   ,0			     	,true				},		-- 别人的宠物
	 		{	false,	0xffffff,	1.1,	true		,	false	,	true	  		,0				,0			   ,0			     	,true				},		-- 其他NPC
	 	},
	},
	[BubbleTypeID.HitTumble] =
	{
		BubbleImageID.IMG_HITTUMBLE,	-- 文字哪个图片(文字显示在数字前面). IMG_INVALID表示没有
		BubbleImageID.IMG_INVALID,	-- 数字哪个图片

		0,				-- 开始时保持不飘的时间
		BubbleStartPosType.Head,	-- 冒字起始点
		5,				-- 3D模式飘的水平初速度（米/秒）
		0,				-- 3D模式飘的水平加速度（米/秒^2）
		-45, 45,			-- 3D模式飘的水平偏弦角度范围（度）
		1,				-- 3D模式飘的竖直初速度（米/秒）
		-13,				-- 3D模式飘的竖直加速度（米/秒^2）

		0,			-- 跳出时在图片上叠加的颜色（全0表示不生效）

	 	{	 --是否显示	-- 颜色     --缩放	--是否跳出  --是否排版  --排版时强制上飘  -- 延迟显示的时间 --飘动持续时间 --2D模式上飘速度 --是否显示在最前
	 		{	true,	0xffffff,	1.1,	false		,	false	,	false	  		,0				,0			   ,0			    	,true				 },		-- 自己
	 		{	false,	0xffffff,	1.1,	true		,	false	,	true	  		,0				,0			   ,0			    	,true				 },		-- 自己的宠物
	 		{	false,	0xffffff,	1.1,	true		,	false	,	true	  		,0				,0			   ,0			    	,true				 },		-- 别的玩家
	 		{	false,	0xffffff,	1.1,	true		,	false	,	true	  		,0				,0			   ,0			    	,true				 },		-- 别人的宠物
	 		{	false,	0xffffff,	1.1,	true		,	false	,	true	  		,0				,0			   ,0			    	,true				 },		-- 其他NPC
	 	},
	},
	[BubbleTypeID.Inhibit] =
	{
		BubbleImageID.IMG_INHIBITED,	-- 文字哪个图片(文字显示在数字前面). IMG_INVALID表示没有
		BubbleImageID.IMG_INVALID,	-- 数字哪个图片

		0,				-- 开始时保持不飘的时间
		BubbleStartPosType.Head,	-- 冒字起始点
		5,				-- 3D模式飘的水平初速度（米/秒）
		0,				-- 3D模式飘的水平加速度（米/秒^2）
		-45, 45,			-- 3D模式飘的水平偏弦角度范围（度）
		1,				-- 3D模式飘的竖直初速度（米/秒）
		-13,				-- 3D模式飘的竖直加速度（米/秒^2）

		0,			-- 跳出时在图片上叠加的颜色（全0表示不生效）

	 	{	 --是否显示	-- 颜色     --缩放	--是否跳出  --是否排版  --排版时强制上飘  -- 延迟显示的时间 --飘动持续时间 --2D模式上飘速度 --是否显示在最前
	 		{	true,	0xffffff,	1.1,	false		,	false	,	false	  		,0				,0			   ,0			    	,true				 },		-- 自己
	 		{	false,	0xffffff,	1.1,	true		,	false	,	true	  		,0				,0			   ,0			    	,true				 },		-- 自己的宠物
	 		{	false,	0xffffff,	1.1,	true		,	false	,	true	  		,0				,0			   ,0			    	,true				 },		-- 别的玩家
	 		{	false,	0xffffff,	1.1,	true		,	false	,	true	  		,0				,0			   ,0			    	,true				 },		-- 别人的宠物
	 		{	false,	0xffffff,	1.1,	true		,	false	,	true	  		,0				,0			   ,0			    	,true				 },		-- 其他NPC
	 	},
	},
	[BubbleTypeID.Break] =
	{
		BubbleImageID.IMG_BREAK,	-- 文字哪个图片(文字显示在数字前面). IMG_INVALID表示没有
		BubbleImageID.IMG_INVALID,	-- 数字哪个图片

		0,				-- 开始时保持不飘的时间
		BubbleStartPosType.Head,	-- 冒字起始点
		5,				-- 3D模式飘的水平初速度（米/秒）
		0,				-- 3D模式飘的水平加速度（米/秒^2）
		-45, 45,			-- 3D模式飘的水平偏弦角度范围（度）
		1,				-- 3D模式飘的竖直初速度（米/秒）
		-13,				-- 3D模式飘的竖直加速度（米/秒^2）

		0,			-- 跳出时在图片上叠加的颜色（全0表示不生效）

	 	{	 --是否显示	-- 颜色     --缩放	--是否跳出  --是否排版  --排版时强制上飘  -- 延迟显示的时间 --飘动持续时间 --2D模式上飘速度 --是否显示在最前
	 		{	true,	0xffffff,	1.1,	false		,	false	,	false	  		,0				,0			   ,0			    	,true				 },		-- 自己
	 		{	false,	0xffffff,	1.1,	true		,	false	,	true	  		,0				,0			   ,0			    	,true				 },		-- 自己的宠物
	 		{	false,	0xffffff,	1.1,	true		,	false	,	true	  		,0				,0			   ,0			    	,true				 },		-- 别的玩家
	 		{	false,	0xffffff,	1.1,	true		,	false	,	true	  		,0				,0			   ,0			    	,true				 },		-- 别人的宠物
	 		{	false,	0xffffff,	1.1,	true		,	false	,	true	  		,0				,0			   ,0			    	,true				 },		-- 其他NPC
	 	},
	},
	[BubbleTypeID.HealMP] =
	{
		BubbleImageID.IMG_INVALID,	-- 文字哪个图片(文字显示在数字前面). IMG_INVALID表示没有
		BubbleImageID.IMG_POPUPNUM,	-- 数字哪个图片

		0,				-- 开始时保持不飘的时间
		BubbleStartPosType.Head,	-- 冒字起始点
		5,				-- 3D模式飘的水平初速度（米/秒）
		0,				-- 3D模式飘的水平加速度（米/秒^2）
		-45, 45,			-- 3D模式飘的水平偏弦角度范围（度）
		1,				-- 3D模式飘的竖直初速度（米/秒）
		-13,				-- 3D模式飘的竖直加速度（米/秒^2）

		0,			-- 跳出时在图片上叠加的颜色（全0表示不生效）

	 	{	 --是否显示	-- 颜色     --缩放	--是否跳出  --是否排版  --排版时强制上飘   -- 延迟显示的时间   --飘动持续时间  --2D模式上飘速度   --是否显示在最前
	 		{	true,	0x16abf9,	0.8,	false		,	false	,	true	  		,0					,200			,-60			  	,true				    },		-- 自己
	 		{	false,	0x16abf9,	0.6,	false		,	false	,	true	  		,0					,200			,-30			  	,true				    },		-- 自己的宠物
	 		{	false,	0x16abf9,	0.8,	false		,	false	,	true	  		,0					,200			,-30			  	,true				    },		-- 别的玩家
	 		{	false,	0x16abf9,	0.6,	false		,	false	,	true	  		,0					,200			,-30			  	,true				    },		-- 别人的宠物
	 		{	false,	0x16abf9,	0.8,	false		,	false	,	true	  		,0					,200			,-30			  	,true				    },		-- 其他NPC
	 	},
	},
	[BubbleTypeID.COMPENSATE_EXP] =
	{
		BubbleImageID.IMG_GOTEXP,	-- 文字哪个图片(文字显示在数字前面). IMG_INVALID表示没有
		BubbleImageID.IMG_POPUPNUM,	-- 数字哪个图片

		0,				-- 开始时保持不飘的时间
		BubbleStartPosType.Head,	-- 冒字起始点
		5,				-- 3D模式飘的水平初速度（米/秒）
		0,				-- 3D模式飘的水平加速度（米/秒^2）
		-45, 45,			-- 3D模式飘的水平偏弦角度范围（度）
		1,				-- 3D模式飘的竖直初速度（米/秒）
		-13,				-- 3D模式飘的竖直加速度（米/秒^2）

		0,			-- 跳出时在图片上叠加的颜色（全0表示不生效）

	 	{	 --是否显示	-- 颜色     --缩放	--是否跳出  --是否排版  --排版时强制上飘   -- 延迟显示的时间   --飘动持续时间  --2D模式上飘速度   --是否显示在最前
	 		{	true,		0xffd83a,	0.62,	false		,	false	,	true	  		,0					,200			,-60			  	,true				    },		-- 自己
	 		{	false,	0xffd83a,	0.62,	false		,	false	,	true	  		,0					,200			,-30			  	,true				    },		-- 自己的宠物
	 		{	false,	0xffd83a,	0.62,	false		,	false	,	true	  		,0					,200			,-30			  	,true				    },		-- 别的玩家
	 		{	false,	0xffd83a,	0.62,	false		,	false	,	true	  		,0					,200			,-30			  	,true				    },		-- 别人的宠物
	 		{	false,	0xffd83a,	0.62,	false		,	false	,	true	  		,0					,200			,-30			  	,true				    },		-- 其他NPC
	 	},
	},
	[BubbleTypeID.HUIXIN]	=
	{
		BubbleImageID.IMG_INVALID,		-- 文字哪个图片(文字显示在数字前面). IMG_INVALID表示没有
		BubbleImageID.IMG_POPUPNUM_WHITE,	-- 数字哪个图片

		0,				-- 开始时保持不飘的时间
		BubbleStartPosType.HitPoint,	-- 冒字起始点
		5,				-- 3D模式飘的水平初速度（米/秒）
		0,				-- 3D模式飘的水平加速度（米/秒^2）
		-45, 45,			-- 3D模式飘的水平偏弦角度范围（度）
		10,				-- 3D模式飘的竖直初速度（米/秒）
		-24,				-- 3D模式飘的竖直加速度（米/秒^2）

		0,			-- 跳出时在图片上叠加的颜色（全0表示不生效）

	 	{	 --是否显示	-- 颜色  --缩放	--是否跳出  --是否排版  --排版时强制上飘 -- 延迟显示的时间 --飘动持续时间  --2D模式上飘速度  --是否显示在最前
	 		{	true,			0xf16a4a,		0.75,	true		,	true	,				false	  						,0					,1250							,-60				 			,true				        },	-- 自己
	 		{	true,			0xf16a4a,		0.5,	true		,	true	,				false	  						,0					,1250							,-30				 			,true				        },	-- 自己的宠物
	 		{	true,			0xfeb73c,		0.6,	true		,	true	,				false	  						,0					,1250							,-10				 			,true				        },	-- 别的玩家
	 		{	true,			0xfeb73c,		0.4,	true		,	true	,				false	  						,0					,1250							,-10				 			,true				        },	-- 别人的宠物
	 		{	true,			0xfeb73c,		0.75,	true		,	true	,				false	  						,0					,1250							,-10				 			,true				        },	-- 其他NPC
	 	},
	},
	[BubbleTypeID.DIYU]	=
	{
		BubbleImageID.IMG_INVALID,		-- 文字哪个图片(文字显示在数字前面). IMG_INVALID表示没有
		BubbleImageID.IMG_POPUPNUM_WHITE,	-- 数字哪个图片

		0,				-- 开始时保持不飘的时间
		BubbleStartPosType.Head,	-- 冒字起始点
		2.5,				-- 3D模式飘的水平初速度（米/秒）
		0,				-- 3D模式飘的水平加速度（米/秒^2）
		-45, 45,			-- 3D模式飘的水平偏弦角度范围（度）
		4,				-- 3D模式飘的竖直初速度（米/秒）
		-12,				-- 3D模式飘的竖直加速度（米/秒^2）

		0,			-- 跳出时在图片上叠加的颜色（全0表示不生效）

	 	{	 --是否显示	-- 颜色  --缩放	--是否跳出  --是否排版  --排版时强制上飘 -- 延迟显示的时间 --飘动持续时间  --2D模式上飘速度  --是否显示在最前
	 		{	true,			0xf16a4a,		0.5,	false		,	true	,				false	  						,0					,1000							,-60				 			,true				        },	-- 自己
	 		{	true,			0xf16a4a,		0.35,	true		,	true	,				false	  						,0					,1000							,-30				 			,true				        },	-- 自己的宠物
	 		{	true,			0xaaaaaa,		0.4,	true		,	true	,				false	  						,0					,1000							,-10				 			,true				        },	-- 别的玩家
	 		{	true,			0xaaaaaa,		0.24,	true		,	true	,				false	  						,0					,1000							,-10				 			,true				        },	-- 别人的宠物
	 		{	true,			0xaaaaaa,		0.5,	true		,	true	,				false	  						,0					,1000							,-10				 			,true				        },	-- 其他NPC
	 	},
	},
}

BubbleDecalParam =
{
	[BubbleObjType.Self] =
	{
		-----------------------------------------
		--	根据不同BubbleType计算的项目
		true,				-- 是否显示这一类。

		0,				-- 这一类的文字图片类型
		0,				-- 这一类的数字图片类型

		0,				-- 开始时保持不飘的时间
		BubbleStartPosType.Head,	-- 冒字起始点
		5,				-- 3D模式飘的水平初速度（米/秒）
		0,				-- 3D模式飘的水平加速度（米/秒^2）
		-45, 45,			-- 3D模式飘的水平偏弦角度范围（度）
		1,				-- 3D模式飘的竖直初速度（米/秒）
		-13,				-- 3D模式飘的竖直加速度（米/秒^2）

		0xffffff,			-- 跳出时在图片上叠加的颜色（全0表示不生效）

		1.3,				-- 这一类的默认缩放比例

		0,				-- 这一类在图片上默认叠加的颜色（不包括alpha）

		false,				-- 是否跳出

		false,				-- 是否归为伤害排版
		false,				-- 归为伤害排版时，是否强制往上飘

		0,				-- 延迟显示的时间

		0,				-- 飘动持续时间（毫秒）
		-60,				-- 2D模式飘的速度，向上为负，向下为正（像素/秒）

		true,				-- 是否显示在最前（不被遮挡）

		-----------------------------------------
		--	这一类所有BubbleType共用的项目
		1200,				-- 这一类的生存时间（毫秒）

		1.0,				-- 这一类的默认透明度
		200, 				-- 开始时保持不透明的时间（这之后从默认透明度过渡到0）

		1.5,				-- 跳出（暴击等）时的放大比例（在默认比例上再乘的比例）
		50,				-- 进入跳出放大的时间
		100,				-- 保持跳出放大的时间
		80,				-- 结束跳出放大的时间

	},

	[BubbleObjType.SelfPet] =
	{
		-----------------------------------------
		--	根据不同BubbleType计算的项目
		true,				-- 是否显示这一类。

		0,				-- 这一类的文字图片类型
		0,				-- 这一类的数字图片类型

		0,				-- 开始时保持不飘的时间
		BubbleStartPosType.Head,	-- 冒字起始点
		5,				-- 3D模式飘的水平初速度（米/秒）
		0,				-- 3D模式飘的水平加速度（米/秒^2）
		-45, 45,			-- 3D模式飘的水平偏弦角度范围（度）
		1,				-- 3D模式飘的竖直初速度（米/秒）
		-13,				-- 3D模式飘的竖直加速度（米/秒^2）

		0xffffff,			-- 跳出时在图片上叠加的颜色（全0表示不生效）

		1.3,				-- 这一类的默认缩放比例

		0,				-- 这一类在图片上默认叠加的颜色（不包括alpha）

		false,				-- 是否跳出

		false,				-- 是否归为伤害排版

		false,				-- 归为伤害排版时，是否强制往上飘

		0,				-- 延迟显示的时间

		0,				-- 飘动持续时间（毫秒）
		-30,				-- 2D模式飘的速度，向上为负，向下为正（像素/秒）

		false,				-- 是否显示在最前（不被遮挡）

		-----------------------------------------
		--	这一类所有BubbleType共用的项目
		1200,				-- 这一类的生存时间（毫秒）

		1.0,				-- 这一类的默认透明度
		200, 				-- 开始时保持不透明的时间（这之后从默认透明度过渡到0）

		1.5,				-- 跳出（暴击等）时的放大比例（在默认比例上再乘的比例）
		50,				-- 进入跳出放大的时间
		100,				-- 保持跳出放大的时间
		80,				-- 结束跳出放大的时间
	},

	[BubbleObjType.ElsePlayer] =
	{
		-----------------------------------------
		--	根据不同BubbleType计算的项目
		true,				-- 是否显示这一类。

		0,				-- 这一类的文字图片类型
		0,				-- 这一类的数字图片类型

		0,				-- 开始时保持不飘的时间
		BubbleStartPosType.Head,	-- 冒字起始点
		5,				-- 3D模式飘的水平初速度（米/秒）
		0,				-- 3D模式飘的水平加速度（米/秒^2）
		-45, 45,			-- 3D模式飘的水平偏弦角度范围（度）
		1,				-- 3D模式飘的竖直初速度（米/秒）
		-13,				-- 3D模式飘的竖直加速度（米/秒^2）

		0xffffff,			-- 跳出时在图片上叠加的颜色（全0表示不生效）

		1.3,				-- 这一类的默认缩放比例

		0,				-- 这一类在图片上默认叠加的颜色（不包括alpha）

		false,				-- 是否跳出

		false,				-- 是否归为伤害排版
		false,				-- 归为伤害排版时，是否强制往上飘

		0,				-- 延迟显示的时间

		0,				-- 飘动持续时间（毫秒）
		-30,				-- 2D模式飘的速度，向上为负，向下为正（像素/秒）

		false,				-- 是否显示在最前（不被遮挡）

		-----------------------------------------
		--	这一类所有BubbleType共用的项目
		1200,				-- 这一类的生存时间（毫秒）

		1.0,				-- 这一类的默认透明度
		200, 				-- 开始时保持不透明的时间（这之后从默认透明度过渡到0）

		1.5,				-- 跳出（暴击等）时的放大比例（在默认比例上再乘的比例）
		50,				-- 进入跳出放大的时间
		100,				-- 保持跳出放大的时间
		80,				-- 结束跳出放大的时间
	},

	[BubbleObjType.ElsePet] =
	{
		-----------------------------------------
		--	根据不同BubbleType计算的项目
		true,				-- 是否显示这一类。

		0,				-- 这一类的文字图片类型
		0,				-- 这一类的数字图片类型

		0,				-- 开始时保持不飘的时间
		BubbleStartPosType.Head,	-- 冒字起始点
		5,				-- 3D模式飘的水平初速度（米/秒）
		0,				-- 3D模式飘的水平加速度（米/秒^2）
		-45, 45,			-- 3D模式飘的水平偏弦角度范围（度）
		1,				-- 3D模式飘的竖直初速度（米/秒）
		-13,				-- 3D模式飘的竖直加速度（米/秒^2）

		0xffffff,			-- 跳出时在图片上叠加的颜色（全0表示不生效）

		1.3,				-- 这一类的默认缩放比例

		0,				-- 这一类在图片上默认叠加的颜色（不包括alpha）

		false,				-- 是否跳出

		false,				-- 是否归为伤害排版
		false,				-- 归为伤害排版时，是否强制往上飘

		0,				-- 延迟显示的时间

		0,				-- 飘动持续时间（毫秒）
		-30,				-- 2D模式飘的速度，向上为负，向下为正（像素/秒）

		false,				-- 是否显示在最前（不被遮挡）

		-----------------------------------------
		--	这一类所有BubbleType共用的项目
		1200,				-- 这一类的生存时间（毫秒）

		1.0,				-- 这一类的默认透明度
		200, 				-- 开始时保持不透明的时间（这之后从默认透明度过渡到0）

		1.5,				-- 跳出（暴击等）时的放大比例（在默认比例上再乘的比例）
		50,				-- 进入跳出放大的时间
		100,				-- 保持跳出放大的时间
		80,				-- 结束跳出放大的时间
	},

	[BubbleObjType.NPC] =
	{
		-----------------------------------------
		--	根据不同BubbleType计算的项目
		true,				-- 是否显示这一类。

		0,				-- 这一类的文字图片类型
		0,				-- 这一类的数字图片类型

		0,				-- 开始时保持不飘的时间
		BubbleStartPosType.Head,	-- 冒字起始点
		5,				-- 3D模式飘的水平初速度（米/秒）
		0,				-- 3D模式飘的水平加速度（米/秒^2）
		-45, 45,			-- 3D模式飘的水平偏弦角度范围（度）
		1,				-- 3D模式飘的竖直初速度（米/秒）
		-13,				-- 3D模式飘的竖直加速度（米/秒^2）

		0xffffff,			-- 跳出时在图片上叠加的颜色（全0表示不生效）

		1.3,				-- 这一类的默认缩放比例

		0,				-- 这一类在图片上默认叠加的颜色（不包括alpha）

		false,				-- 是否跳出

		false,				-- 是否归为伤害排版
		false,				-- 归为伤害排版时，是否强制往上飘

		0,				-- 延迟显示的时间

		0,				-- 飘动持续时间（毫秒）
		-30,				-- 2D模式飘的速度，向上为负，向下为正（像素/秒）

		false,				-- 是否显示在最前（不被遮挡）

		-----------------------------------------
		--	这一类所有BubbleType共用的项目
		1000,				-- 这一类的生存时间（毫秒）

		1.0,				-- 这一类的默认透明度
		1000, 				-- 开始时保持不透明的时间（这之后从默认透明度过渡到0）

		1.5,				-- 跳出（暴击等）时的放大比例（在默认比例上再乘的比例）
		50,				-- 进入跳出放大的时间
		100,				-- 保持跳出放大的时间
		80,				-- 结束跳出放大的时间
	},
}

function BubbleDecalConfig:GetBubbleDecalParam(objType, bubbleType)
	--LogPrint("objType = " .. objType .. ",bubbleType = " .. bubbleType)
	local objTab = BubbleDecalParam[objType]

	if objTab ~= nil then
		--local str = string.format("DecalParam: ObjType: %d, bubbleType: %d\n", objType, bubbleType)
		--LogPrint(str)

		local imgTab = BubbleImageColor[bubbleType]

		if imgTab ~= nil then

			local nIndex = 2
			local nImgTabIdx = 1

			-- 文字图片类型
			objTab[nIndex] 	= imgTab[nImgTabIdx]
			nIndex = nIndex + 1
			nImgTabIdx = nImgTabIdx + 1

			-- 数字图片类型
			objTab[nIndex] 	= imgTab[nImgTabIdx]
			nIndex = nIndex + 1
			nImgTabIdx = nImgTabIdx + 1

			-- 开始时保持不飘的时间
			objTab[nIndex] 	= imgTab[nImgTabIdx]
			nIndex = nIndex + 1
			nImgTabIdx = nImgTabIdx + 1

			-- 冒字起始点
			objTab[nIndex] 	= imgTab[nImgTabIdx]
			nIndex = nIndex + 1
			nImgTabIdx = nImgTabIdx + 1

			-- 3D模式飘的初速度（米/秒）
			objTab[nIndex] 	= imgTab[nImgTabIdx]
			nIndex = nIndex + 1
			nImgTabIdx = nImgTabIdx + 1

			-- 3D模式飘的加速度（米/秒^2）
			objTab[nIndex] 	= imgTab[nImgTabIdx]
			nIndex = nIndex + 1
			nImgTabIdx = nImgTabIdx + 1

			-- 3D模式飘的水平偏向角度范围（度）
			objTab[nIndex] 	= imgTab[nImgTabIdx] -- 下限
			nIndex = nIndex + 1
			nImgTabIdx = nImgTabIdx + 1

			objTab[nIndex] 	= imgTab[nImgTabIdx] -- 上限
			nIndex = nIndex + 1
			nImgTabIdx = nImgTabIdx + 1

			-- 3D模式飘的竖直初速度（米/秒）
			objTab[nIndex] 	= imgTab[nImgTabIdx]
			nIndex = nIndex + 1
			nImgTabIdx = nImgTabIdx + 1

			-- 3D模式飘的竖直加速度（米/秒^2）
			objTab[nIndex] 	= imgTab[nImgTabIdx]
			nIndex = nIndex + 1
			nImgTabIdx = nImgTabIdx + 1

			-- 跳出时在图片上叠加的颜色（全0表示不生效）
			objTab[nIndex] 	= imgTab[nImgTabIdx]
			nIndex = nIndex + 1
			nImgTabIdx = nImgTabIdx + 1

			local imgObjTab = imgTab[nImgTabIdx][objType + 1]

			if imgObjTab ~= nil then

				-- 是否显示
				objTab[1] 	= imgObjTab[1]

				-- 默认缩放比例
				objTab[nIndex] 	= imgObjTab[3]
				nIndex = nIndex + 1

				-- 图片上默认叠加的颜色
				objTab[nIndex] 	= imgObjTab[2]
				nIndex = nIndex + 1

				-- 是否跳出
				objTab[nIndex] 	= imgObjTab[4]
				nIndex = nIndex + 1

				-- 是否归为伤害排版
				objTab[nIndex] 	= imgObjTab[5]
				nIndex = nIndex + 1

				-- 归为伤害排版时，是否强制往上飘
				objTab[nIndex] 	= imgObjTab[6]
				nIndex = nIndex + 1

				-- 延迟显示的时间
				objTab[nIndex] 	= imgObjTab[7]
				nIndex = nIndex + 1

				-- 飘动持续时间（毫秒）
				objTab[nIndex] 	= imgObjTab[8]
				nIndex = nIndex + 1

				-- 2D模式飘的速度
				objTab[nIndex] 	= imgObjTab[9]
				nIndex = nIndex + 1

				-- 是否显示在最前（不被遮挡）
				objTab[nIndex] 	= imgObjTab[10]
				nIndex = nIndex + 1
			end

			return objTab
		end
	end

end
