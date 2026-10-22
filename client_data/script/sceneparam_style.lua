SceneParamStyle = {}

-- 场景参数随活动变化配置
SceneParamStyle.Config = 
{
	[1211] = --场景id：剧情副本-武当-摆阵
	{
		[103] = --场景参数id
		{
			[2013] = --副本id，0表示大世界
			{
				[3] = --场景参数取值
				{
					--Main = "五洞天", Sub = "烧毁前", --场景显隐配置，没有就不配
					
				 	PlayCG = 400054,	--播放CG的ID

					--SceneModelParam =
					--{
					--	[123456] = true,
					--},

					--SceneGfxParam = 
					--{
					--	[654321] = false,
					--},
					
					NPCParam = --NPC显隐配置：
					{
						--模板id = { [别名hash] = 是否显示. 无别名则填 [0] = ...,  }
						[36704] =
						{
							[GameApi.HashAString("npc-武当-摆阵-陈茂宏2")] = false,
							[GameApi.HashAString("npc-武当-摆阵-陈茂宏测")] = true,
						},
						[36710] =
						{
							[GameApi.HashAString("npc-武当-摆阵-卢绍岐2")] = false,
							[GameApi.HashAString("npc-武当-摆阵-卢绍岐测")] = true,
						},
						[36713] =
						{
							[GameApi.HashAString("npc-武当-摆阵-宋凌如2")] = false,
							[GameApi.HashAString("npc-武当-摆阵-宋凌如测")] = true,
						},
						[37809] =
						{
							[GameApi.HashAString("npc-武当-摆阵-孙承岱2")] = false,
							[GameApi.HashAString("npc-武当-摆阵-孙承岱测")] = true,
						},
						[36701] =
						{
							[GameApi.HashAString("npc-武当-摆阵-吴昆山2")] = false,
							[GameApi.HashAString("npc-武当-摆阵-吴昆山测")] = true,
						},
						[36716] =
						{
							[GameApi.HashAString("npc-武当-摆阵-徐岱岳2")] = false,
							[GameApi.HashAString("npc-武当-摆阵-徐岱岳测")] = true,
						},
						[36707] =
						{
							[GameApi.HashAString("npc-武当-摆阵-姚石门2")] = false,
							[GameApi.HashAString("npc-武当-摆阵-姚石门测")] = true,
						},
						[37560] =
						{
							[GameApi.HashAString("npc-武当-摆阵-怪-许显纯初始")] = false,
							[GameApi.HashAString("npc-武当-摆阵-怪-许显纯")] = true,
						},
					},
				},
			},
		},
	},

	[1203] =	--场景id：青城
	{
		[211] = --场景参数id
		{
			[1777] = --副本id，0表示大世界
			{
				[1] = --场景参数取值
				{
					Main = "五洞天", Sub = "烧毁前",
					
					--DecalMapParam = --印花显隐配置：
					--{
					--	"decal_blood"] = false,
					--},
				},
				[2] = --场景参数取值
				{
					Main = "五洞天", Sub = "烧毁后",
				},
			},
		},
	},

	[1500] =	--场景id：东厂盗宝
	{
		[300] = --场景参数id
		{
			[1923] = --副本id，0表示大世界
			{
				[1] = --场景参数取值
				{
					Main = "东厂", Sub = "失火中",
				},
			},
		},
	},

	[1041] =	--场景id：百毒禁地
	{
		[801] = --场景参数id
		{
			[1927] = --副本id，0表示大世界
			{
				[0] = --场景参数取值
				{
					Main = "百毒禁地", Sub = "倒下不显示", IsShow = 0, --IsShow: 0:隐藏该Sub，1:显示该Sub，-1:显示该Sub且隐藏该Main的其他Sub
				},
			},
			[3044] = --副本id，0表示大世界
			{
				[0] = --场景参数取值
				{
					Main = "百毒禁地", Sub = "倒下不显示", IsShow = 0, --IsShow: 0:隐藏该Sub，1:显示该Sub，-1:显示该Sub且隐藏该Main的其他Sub
				},
			},
		},
		[802] = --场景参数id
		{
			[1927] = --副本id，0表示大世界
			{
				[1] = --场景参数取值
				{
					Main = "百毒禁地", Sub = "倒下柱子", IsShow = 1, --IsShow: 0:隐藏该Sub，1:显示该Sub，-1:显示该Sub且隐藏该Main的其他Sub
				},
			},
			[3044] = --副本id，0表示大世界
			{
				[1] = --场景参数取值
				{
					Main = "百毒禁地", Sub = "倒下柱子", IsShow = 1, --IsShow: 0:隐藏该Sub，1:显示该Sub，-1:显示该Sub且隐藏该Main的其他Sub
				},
			},
		},
		[803] = --场景参数id
		{
			[1927] = --副本id，0表示大世界
			{
				[1] = --场景参数取值
				{
					Main = "百毒禁地悬梯1", Sub = "显示楼梯1", IsShow = 1, --IsShow: 0:隐藏该Sub，1:显示该Sub，-1:显示该Sub且隐藏该Main的其他Sub
				},
			},
			[3044] = --副本id，0表示大世界
			{
				[1] = --场景参数取值
				{
					Main = "百毒禁地悬梯1", Sub = "显示楼梯1", IsShow = 1, --IsShow: 0:隐藏该Sub，1:显示该Sub，-1:显示该Sub且隐藏该Main的其他Sub
				},
			},
		},
		[804] = --场景参数id
		{
			[1927] = --副本id，0表示大世界
			{
				[1] = --场景参数取值
				{
					Main = "百毒禁地悬梯2", Sub = "显示楼梯2", IsShow = 1, --IsShow: 0:隐藏该Sub，1:显示该Sub，-1:显示该Sub且隐藏该Main的其他Sub
				},
			},
			[3044] = --副本id，0表示大世界
			{
				[1] = --场景参数取值
				{
					Main = "百毒禁地悬梯2", Sub = "显示楼梯2", IsShow = 1, --IsShow: 0:隐藏该Sub，1:显示该Sub，-1:显示该Sub且隐藏该Main的其他Sub
				},
			},
		},
		[805] = --场景参数id
		{
			[1927] = --副本id，0表示大世界
			{
				[1] = --场景参数取值
				{
					Main = "百毒禁地悬梯3", Sub = "显示楼梯3", IsShow = 1, --IsShow: 0:隐藏该Sub，1:显示该Sub，-1:显示该Sub且隐藏该Main的其他Sub
				},
			},
			[3044] = --副本id，0表示大世界
			{
				[1] = --场景参数取值
				{
					Main = "百毒禁地悬梯3", Sub = "显示楼梯3", IsShow = 1, --IsShow: 0:隐藏该Sub，1:显示该Sub，-1:显示该Sub且隐藏该Main的其他Sub
				},
			},
		},
		[806] = --场景参数id
		{
			[1927] = --副本id，0表示大世界
			{
				[0] = --场景参数取值
				{
					Main = "百毒禁地石桥", Sub = "显示蜈蚣通道", IsShow = 0, --IsShow: 0:隐藏该Sub，1:显示该Sub，-1:显示该Sub且隐藏该Main的其他Sub
				},
			},
			[3044] = --副本id，0表示大世界
			{
				[0] = --场景参数取值
				{
					Main = "百毒禁地石桥", Sub = "显示蜈蚣通道", IsShow = 0, --IsShow: 0:隐藏该Sub，1:显示该Sub，-1:显示该Sub且隐藏该Main的其他Sub
				},
			},
		},
	},

	[1273] = --场景id：剧情副本-福州回忆
	{
		[101] = --场景参数id
		{
			[2965] = --副本id，0表示大世界
			{
				[4] = --场景参数取值
				{
					SceneGfxParam = 
					{
						[1073743870] = true,
						[1073743869] = true,
						[1073743871] = true,
					},
				},

				[12] = --场景参数取值
				{
					SceneGfxParam = 
					{
						[1073743870] = false,
						[1073743869] = false,
						[1073743871] = false,
					},
					
					SceneModelParam =
					{
						[1073743864] = false,
						[1073743863] = false,
						[1073743867] = false,
						[1073743866] = false,
						[1073743849] = false,
						[1073743848] = false,
						[1073743853] = false,
						[1073743852] = false,
						[1073743855] = false,
						[1073743854] = false,
						[1073743856] = false,
						[1073743857] = false,
						[1073743858] = false,
						[1073743859] = false,
						[1073743860] = false,
						[1073743861] = false,
					},
				},
			},
		},
		[103] = --场景参数id
		{
			[2965] = --副本id，0表示大世界
			{

				[1] = --场景参数取值
				{
					Main = "孤剑村", Sub = "烧毁前", --场景显隐配置
				},
			},
		},
	},

	[1239] = --场景id：剧情副本-华山赌斗
	{
		[301] = --场景参数id
		{
			[2477] = --副本id，0表示大世界
			{
				[1] = --场景参数取值
				{
					SceneGfxParam = 
					{
						[1073741860] = true,
						[1073741857] = true,
						[1073741856] = true,
						[1073741858] = true,
						[1073741859] = true,
					},
				},

				[2] = --场景参数取值
				{
					SceneGfxParam = 
					{
						[1073741860] = false,
						[1073741857] = false,
						[1073741856] = false,
						[1073741858] = false,
					},
				},
			},
		},
		[201] = --场景参数id
		{
			[2477] = --副本id，0表示大世界
			{
				[4] = --场景参数取值
				{
					SceneGfxParam = 
					{
						[1073741859] = false,
					},
				},
			},
		},
		[302] = --场景参数id
		{
			[2477] = --副本id，0表示大世界
			{
				[2] = --场景参数取值
				{
					SceneGfxParam = 
					{
						[1073741860] = true,
						[1073741857] = true,
						[1073741856] = true,
						[1073741858] = true,
					},
				},

				[3] = --场景参数取值
				{
					SceneGfxParam = 
					{
						[1073741860] = false,
						[1073741857] = false,
						[1073741856] = false,
						[1073741858] = false,
					},
				},
			},
		},
		[402] = --场景参数id
		{
			[2477] = --副本id，0表示大世界
			{
				[2] = --场景参数取值
				{

					SceneGfxParam = 
					{
						[1073741860] = true,
						[1073741857] = true,
						[1073741856] = true,
						[1073741858] = true,
					},
				},

				[3] = --场景参数取值
				{
					SceneGfxParam = 
					{
						[1073741860] = false,
						[1073741857] = false,
						[1073741856] = false,
						[1073741858] = false,
					},
				},
			},
		},
	},
	

	[1256] = --场景id：剧情副本-屠村副本
	{
		[102] = --场景参数id
		{
			[2823] = --副本id，0表示大世界
			{
				[13] = --场景参数取值
				{
					SceneModelParam =
					{
						[1073744431] = true,
						[1073744432] = true,
						[1073744435] = true,
						[1073744433] = true,
						[1073744436] = true,
						[1073744434] = true,
					},
				},
			},
		},
	},


	[1268] = --场景id：剧情副本-余杭棋局
	{
		[101] = --场景参数id
		{
			[2903] = --副本id，0表示大世界
			{

				[6] = --场景参数取值
				{
					Main = "棋盘", Sub = "开启", --场景显隐配置
				},
			},
		},
	},

	[1270] = --场景id：剧情副本-新手剑魔洞副本
	{
		[104] = --场景参数id
		{
			[2908] = --副本id，0表示大世界
			{

				[16] = --场景参数取值
				{
					SceneGfxParam = 
					{
						[1073743473] = true,
					},
				},

				[6] = --场景参数取值
				{
					SceneGfxParam = 
					{
						[1073743473] = false,
					},
				},
			},
		},
	},


	[1054] =	--场景id：梅庄地牢
	{
		[801] = --场景参数id
		{
			[3046] = --副本id，0表示大世界
			{
				[0] = --场景参数取值
				{
					Main = "梅庄地牢", Sub = "密道入口", IsShow = 0, --IsShow: 0:隐藏该Sub，1:显示该Sub，-1:显示该Sub且隐藏该Main的其他Sub
				},
			},
			[3068] = --副本id，0表示大世界
			{
				[0] = --场景参数取值
				{
					Main = "梅庄地牢", Sub = "密道入口", IsShow = 0, --IsShow: 0:隐藏该Sub，1:显示该Sub，-1:显示该Sub且隐藏该Main的其他Sub
				},
			},
		},
		[802] = --场景参数id
		{
			[3046] = --副本id，0表示大世界
			{
				[0] = --场景参数取值
				{
					Main = "梅庄地牢", Sub = "正常房间", IsShow = 0, --IsShow: 0:隐藏该Sub，1:显示该Sub，-1:显示该Sub且隐藏该Main的其他Sub
				},
				[1] = --场景参数取值
				{
					Main = "梅庄地牢", Sub = "正常房间", IsShow = 1, --IsShow: 0:隐藏该Sub，1:显示该Sub，-1:显示该Sub且隐藏该Main的其他Sub
				},
			},
			[3068] = --副本id，0表示大世界
			{
				[0] = --场景参数取值
				{
					Main = "梅庄地牢", Sub = "正常房间", IsShow = 0, --IsShow: 0:隐藏该Sub，1:显示该Sub，-1:显示该Sub且隐藏该Main的其他Sub
				},
			},
		},
		[803] = --场景参数id
		{
			[3046] = --副本id，0表示大世界
			{
				[0] = --场景参数取值
				{
					Main = "梅庄地牢", Sub = "混沌区域", IsShow = 0, --IsShow: 0:隐藏该Sub，1:显示该Sub，-1:显示该Sub且隐藏该Main的其他Sub
				},
				[1] = --场景参数取值
				{
					Main = "梅庄地牢", Sub = "混沌区域", IsShow = 1, --IsShow: 0:隐藏该Sub，1:显示该Sub，-1:显示该Sub且隐藏该Main的其他Sub
				},
			},
			[3068] = --副本id，0表示大世界
			{
				[1] = --场景参数取值
				{
					Main = "梅庄地牢", Sub = "混沌区域", IsShow = 1, --IsShow: 0:隐藏该Sub，1:显示该Sub，-1:显示该Sub且隐藏该Main的其他Sub
				},
			},
		},
		[804] = --场景参数id
		{
			[3046] = --副本id，0表示大世界
			{
				[0] = --场景参数取值
				{
					Main = "梅庄地牢", Sub = "白", IsShow = 0, --IsShow: 0:隐藏该Sub，1:显示该Sub，-1:显示该Sub且隐藏该Main的其他Sub
				},
			},
			[3068] = --副本id，0表示大世界
			{
				[0] = --场景参数取值
				{
					Main = "梅庄地牢", Sub = "白", IsShow = 0, --IsShow: 0:隐藏该Sub，1:显示该Sub，-1:显示该Sub且隐藏该Main的其他Sub
				},
			},
		},
		[805] = --场景参数id
		{
			[3046] = --副本id，0表示大世界
			{
				[1] = --场景参数取值
				{
					Main = "梅庄地牢", Sub = "黑", IsShow = 1, --IsShow: 0:隐藏该Sub，1:显示该Sub，-1:显示该Sub且隐藏该Main的其他Sub
				},
			},
			[3068] = --副本id，0表示大世界
			{
				[1] = --场景参数取值
				{
					Main = "梅庄地牢", Sub = "黑", IsShow = 1, --IsShow: 0:隐藏该Sub，1:显示该Sub，-1:显示该Sub且隐藏该Main的其他Sub
				},
			},
		},
	},
	[1519] =	--场景id：叛军前哨
	{
		[301] = --场景参数id
		{
			[3049] = --副本id，0表示大世界
			{
				[1] = --场景参数取值
				{
					Main = "叛军城墙", Sub = "未破损",
				},
			},
		},
	},
	[1520] =	--场景id：叛军本营
	{
		[301] = --场景参数id
		{
			[3050] = --副本id，0表示大世界
			{
				[1] = --场景参数取值
				{
					Main = "叛军城墙", Sub = "未破损",
				},
				[2] = --场景参数取值
				{
					Main = "叛军城墙", Sub = "已破损",
				},
			},
		},
	},
	[1609] =	--场景id：叛军本营
	{
		[101] = --场景参数id
		{
			[5900] = --副本id，0表示大世界
			{
				[1] = --场景参数取值
				{
				    SceneGfxParam = 
					{
						[1073745611] = true,--情劫李特效
					},
				},
				[2] = --场景参数取值
				{
				    SceneGfxParam = 
					{
						[1073745616] = true,--情劫苏特效
					},
				},
				[3] = --场景参数取值
				{
				    SceneGfxParam = 
					{
						[1073745617] = true,--情劫余特效
					},
				},
			},
		},
	},
	[1299] =	--场景id：华山 点火退敌相位
	{
		[201] = --场景参数id
		{
			[3533] = --副本id，0表示大世界
			{
				[2] = --场景参数取值
				{
				    SceneGfxParam = 
					{
						[1073746611] = true,
						[1073746615] = true,
					},
				},
			},
		},
		[202] = --场景参数id
		{
			[3533] = --副本id，0表示大世界
			{
				[2] = --场景参数取值
				{
				    SceneGfxParam = 
					{
						[1073746616] = true,
						[1073746617] = true,
					},
				},
			},
		},
		[203] = --场景参数id
		{
			[3533] = --副本id，0表示大世界
			{
				[2] = --场景参数取值
				{
				    SceneGfxParam = 
					{
						[1073746618] = true,
						[1073746619] = true,
					},
				},
			},
		},
		[204] = --场景参数id
		{
			[3533] = --副本id，0表示大世界
			{
				[2] = --场景参数取值
				{
				    SceneGfxParam = 
					{
						[1073746668] = true,
						[1073746670] = true,
					},
				},
			},
		},

	},
	[1535] =	--场景id：嵩山之巅
	{
		[501] = --场景参数id
		{
			[6981] = --副本id，0表示大世界
			{
				[0] = --场景参数取值
				{
					Main = "最终战斗", Sub = "开启前",
				},
				[1] = --场景参数取值
				{
					Main = "最终战斗", Sub = "开启后",
				},
			},
		},
	},
	[1537] =	--场景id：洛阳狮会
	{
		[501] = --场景参数id
		{
			[6993] = --副本id，0表示大世界
			{
				[0] = --场景参数取值
				{
					Main = "活动", Sub = "开启前",
				},
				[1] = --场景参数取值
				{
					Main = "活动", Sub = "开启后",
				},
			},
		},
	},
}
-- NPC场景参数初始化配置
SceneParamStyle.NPC_List =
{
	--初始是否显示
	[36704] =
	{
		[GameApi.HashAString("npc-武当-摆阵-陈茂宏2")] = {{1211}, {2013}, true,},
		[GameApi.HashAString("npc-武当-摆阵-陈茂宏测")] = {{1211}, {2013}, false,},
	},
	[36710] =
	{
		[GameApi.HashAString("npc-武当-摆阵-卢绍岐2")] = {{1211}, {2013}, true,},
		[GameApi.HashAString("npc-武当-摆阵-卢绍岐测")] = {{1211}, {2013}, false,},
	},
	[36713] =
	{
		[GameApi.HashAString("npc-武当-摆阵-宋凌如2")] = {{1211}, {2013}, true,},
		[GameApi.HashAString("npc-武当-摆阵-宋凌如测")] = {{1211}, {2013}, false,},
	},
	[37809] =
	{
		[GameApi.HashAString("npc-武当-摆阵-孙承岱2")] = {{1211}, {2013}, true,},
		[GameApi.HashAString("npc-武当-摆阵-孙承岱测")] = {{1211}, {2013}, false,},
	},
	[36701] =
	{
		[GameApi.HashAString("npc-武当-摆阵-吴昆山2")] = {{1211}, {2013}, true,},
		[GameApi.HashAString("npc-武当-摆阵-吴昆山测")] = {{1211}, {2013}, false,},
	},
	[36716] =
	{
		[GameApi.HashAString("npc-武当-摆阵-徐岱岳2")] = {{1211}, {2013}, true,},
		[GameApi.HashAString("npc-武当-摆阵-徐岱岳测")] = {{1211}, {2013}, false,},
	},
	[36707] =
	{
		[GameApi.HashAString("npc-武当-摆阵-姚石门2")] = {{1211}, {2013}, true,},
		[GameApi.HashAString("npc-武当-摆阵-姚石门测")] = {{1211}, {2013}, false,},
	},	
	[37560] =
	{
		[GameApi.HashAString("npc-武当-摆阵-怪-许显纯初始")] = {{1211}, {2013}, true,},
		[GameApi.HashAString("npc-武当-摆阵-怪-许显纯")] = {{1211}, {2013}, false,},
	},
}

-- 印花的场景参数初始化配置
SceneParamStyle.DecalMap_List =
{
	["decal_blood"] = { false,  }	--初始是否显示
}

SceneParamStyle.SceneGfx_List =
{
	--[654321] = { {1211,}, {}, false },
	[1073743870] = { {1273,}, {}, false },
	[1073743869] = { {1273,}, {}, false },
	[1073743871] = { {1273,}, {}, false },
	[1073741860] = { {1239,}, {}, false },
	[1073741857] = { {1239,}, {}, false },
	[1073741856] = { {1239,}, {}, false },
	[1073741858] = { {1239,}, {}, false },
	[1073746611] = { {1299,}, {}, false },
	[1073746615] = { {1299,}, {}, false },
	[1073746616] = { {1299,}, {}, false },
	[1073746619] = { {1299,}, {}, false },
	[1073746617] = { {1299,}, {}, false },
	[1073746618] = { {1299,}, {}, false },	
	[1073746670] = { {1299,}, {}, false },
	[1073746668] = { {1299,}, {}, false },			
	[1073743473] = { {1270,}, {}, false },	
	[1073745611] = { {1609,}, {}, false },			
	[1073745616] = { {1609,}, {}, false },	
	[1073745617] = { {1609,}, {}, false },
}

SceneParamStyle.SceneECModel_List =
{
	--[123456] = { {1211,}, {}, false },
	[1073744431] = { {1256,}, {}, false },
	[1073744432] = { {1256,}, {}, false },
	[1073744435] = { {1256,}, {}, false },
	[1073744433] = { {1256,}, {}, false },
	[1073744436] = { {1256,}, {}, false },
	[1073744434] = { {1256,}, {}, false },
}

--------------------------------------------------------
------------------------ 函数 --------------------------
--------------------------------------------------------

function SceneParamStyle:GetDefaultParamForAllNPC()
	return SceneParamStyle.NPC_List
end

function SceneParamStyle:GetDefaultParamForAllDecalMap()
	return SceneParamStyle.DecalMap_List
end

function SceneParamStyle:GetSceneParamForAllGfx()
	return SceneParamStyle.SceneGfx_List
end

function SceneParamStyle:GetSceneParamForAllECModel()
	return SceneParamStyle.SceneECModel_List
end

--------------------------------------------------------
--SceneParamStyle.LastStyle = {Main = "", Sub = "", idSceneParam = 0}

function SceneParamStyle:ChangeSceneParamStyle(sMain, sSub, idSceneParam, valSceneParam, tabNPCShown, IsShow)
	GameApi.ChangeSceneParamStyle(sMain, sSub, idSceneParam, valSceneParam, tabNPCShown, IsShow)		
--	SceneParamStyle.LastStyle.Main = sMain
--	SceneParamStyle.LastStyle.Sub  = sSub
--	SceneParamStyle.LastStyle.idSceneParam = idSceneParam
end

function SceneParamStyle:InnerChangeSceneParamStyle(SceneParam, idSceneParam, valSceneParam, bPlayCG)
	local str = string.format("InnerChangeSceneParamStyle: SceneParam %d %d", idSceneParam, valSceneParam)
	LogPrint(str)

	local main = SceneParam.Main
	if main == nil then
		main = ""
	end
	
	local sub = SceneParam.Sub
	if sub == nil then
		sub = ""
	end

 	--IsShow: 0:隐藏该Sub，1:显示该Sub，-1:显示该Sub且隐藏该Main的其他Sub。不配默认-1
 	local IsShow = -1
	if SceneParam.IsShow ~= nil then
		IsShow = SceneParam.IsShow
	end

	local retTab =
	{
		SceneParam.NPCParam and SceneParam.NPCParam or {},
		SceneParam.SceneGfxParam and SceneParam.SceneGfxParam or {},
		SceneParam.SceneModelParam and SceneParam.SceneModelParam or {},
	}

	SceneParamStyle:ChangeSceneParamStyle(main, sub, IsShow, idSceneParam, valSceneParam, retTab)

	if bPlayCG then
		local idCG = SceneParam.PlayCG
		if idCG and idCG ~= 0 then
			CGApi.PlayCG(idCG)
		end
	end
	
end

SceneParamStyle.Event = 
{
	INIT_ALL_PARAM	= 1, 	--初始化所有场景参数
	PARAM_CHANGE	= 2, 		--场景参数改变
};


--事件调用接口
function SceneParamStyle:OnEvent(idEvent, param_tbl)
	local sceneparamCfg = SceneParamStyle.Config
	local idWorld, idScene, idBoard = GameApi.GetSceneInfo()
	--local strDbg = string.format("SceneParamStyle:OnEvent: World %d, Scene %d, Board %d\n", idWorld, idScene, idBoard)
	--LogPrint(strDbg)

	if idEvent == SceneParamStyle.Event.INIT_ALL_PARAM then

		for idSceneParam, valSceneParam in pairs(param_tbl) do
			--strDbg = string.format("Init: SceneParam %d %d\n", idSceneParam, valSceneParam)
			--LogPrint(strDbg)

			local paramTab = sceneparamCfg[idScene] and sceneparamCfg[idScene][idSceneParam] or nil
			if paramTab and paramTab[idWorld] and paramTab[idWorld][valSceneParam] then
				SceneParamStyle:InnerChangeSceneParamStyle(paramTab[idWorld][valSceneParam], idSceneParam, valSceneParam, false)
			end
			
			-- 特殊逻辑， 场景参数20来控制FFT水面高度。
			if idSceneParam == 20 then
				local real_height = valSceneParam * 0.1
				GameApi.ChangeFFTWaterHeight(real_height,1000)
			end
		end

	elseif idEvent == SceneParamStyle.Event.PARAM_CHANGE then

		local idSceneParam = param_tbl["sceneparam_id"]
		local valSceneParam = param_tbl["sceneparam_value"]

		if idSceneParam ~= nil and valSceneParam ~= nil then
			--strDbg = string.format("Change: SceneParam %d %d\n", idSceneParam, valSceneParam)
			--LogPrint(strDbg)

			local paramTab = sceneparamCfg[idScene] and sceneparamCfg[idScene][idSceneParam] or nil			
			if paramTab and paramTab[idWorld] and paramTab[idWorld][valSceneParam] then
				SceneParamStyle:InnerChangeSceneParamStyle(paramTab[idWorld][valSceneParam], idSceneParam, valSceneParam, true)
			end
		end
		
		-- 特殊逻辑， 场景参数20来控制FFT水面高度。
		if idSceneParam == 20 then
			local real_height = valSceneParam * 0.1
			GameApi.ChangeFFTWaterHeight(real_height,1000)
		end
	end
end
