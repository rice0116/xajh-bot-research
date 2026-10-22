NPCStyle = {}

NPCStyle.TaskState =
{
	INVALID		= -1,	--	无此任务
	NONE		= 0,	--	此任务的完成数为0
	ACCEPT 		= 1,	--	接到
	CANFINISH 	= 2, 	--	完成没交
	FINISHED	= 3,	--	交成功
	FAIL		= 4,	--	失败
};


-- NPC参数随任务变化配置
NPCStyle.Config =
{
	--	不能按任务id存为map，因为任务有先后顺序。   动作名部分只能写3个字段，或6个字段。
	{
		TaskID = 465,
		ScendID =
		{
			[7] = true, --武当山
		},
		NPCParam =
		{
			[26837] =
			{
				{ -- 接到                                            --动作名 --seek时间 --是否无限重播
					[GameApi.HashAString("任务2011武当山黄云轩前")] 	= {"技能攻击1", 0, false},
				},
				{ -- 完成没交
					[GameApi.HashAString("任务2011武当山黄云轩前")] 	= {"被击晕", 0, true},
				},
				{ -- 交成功
					[GameApi.HashAString("任务2011武当山黄云轩前")] 	= {"被击飞", 0, false},
				},
				{ -- 失败
				},
			},

			[26843] =
			{
				{ -- 接到                                            --动作名 	--seek时间 --是否无限重播		                                             --后面接的动作 --seek时间 --是否无限重播
					[GameApi.HashAString("任务2011武当山对打npc1")] 	= {"被击飞", 0, false,									"被击飞", 625, true	},
					[GameApi.HashAString("任务2011武当山对打npc2")] 	= {"被击飞", 0, false,									"被击飞", 625, true	},
					[GameApi.HashAString("任务2011武当山对打npc3")] 	= {"被击飞", 0, false,									"被击飞", 625, true	},
					[GameApi.HashAString("任务2011武当山对打npc4")] 	= {"被击飞", 0, false,									"被击飞", 625, true	},
					[GameApi.HashAString("任务2011武当山对打npc5")] 	= {"被击飞", 0, false,									"被击飞", 625, true	},
				},
				{ -- 完成没交
				},
				{ -- 交成功
				},
				{ -- 失败
				},
			},
		},
        },

        {
		TaskID = 596,
		ScendID =
		{
			[7] = true, --武当山
		},
		NPCParam =
		{
			[26840] =
			{
				{ -- 接到                                            --动作名 --seek时间 --是否无限重播
				},
				{ -- 完成没交
					[GameApi.HashAString("任务2011武当山黄云轩后")] 	= {"受伤2", 0, false},
				},
				{ -- 交成功
					[GameApi.HashAString("任务2011武当山黄云轩后")] 	= {"被击晕", 0, true},
				},
				{ -- 失败
				},
			},
		},
	},

        {
		TaskID = 466,
		ScendID =
		{
			[7] = true, --武当山
		},
		NPCParam =
		{
			[26837] =
			{
				{ -- 接到                                            --动作名 --seek时间 --是否无限重播
				},
				{ -- 完成没交
					[GameApi.HashAString("任务2011武当山黄云轩前")] 	= {"被击晕循环", 0, false},
				},
				{ -- 交成功
				},
				{ -- 失败
				},
			},
		},
	},

        {
		TaskID = 2945,
		ScendID =
		{
			[19] = true, --仙霞岭
		},
		NPCParam =
		{
			[27548] =
			{
				{ -- 接到                                            --动作名 --seek时间 --是否无限重播
				},
				{ -- 完成没交
				},
				{ -- 交成功
					[GameApi.HashAString("主线任务青菱2")] 	= {"交谈", 0, false, "交谈", 500, true},
				},
				{ -- 失败
				},
			},

			[27545] =
			{
				{ -- 接到                                            --动作名 --seek时间 --是否无限重播
					[GameApi.HashAString("主线任务王老虎4")] 	= {"死亡", 0, false, "死亡循环", 0, true},
				},
				{ -- 完成没交
				},
				{ -- 交成功
				},
				{ -- 失败
				},
			},
		},
	},

	{
		TaskID = 2947,
		ScendID =
		{
			[19] = true, --仙霞岭
		},
		NPCParam =
		{
			[27548] =
			{
				{ -- 接到                                            --动作名 --seek时间 --是否无限重播
				},
				{ -- 完成没交
				},
				{ -- 交成功
					[GameApi.HashAString("主线任务青菱2")] 	= {"交谈", 0, false, "站立", 0, false},
				},
				{ -- 失败
				},
			},

			[27545] =
			{
				{ -- 接到                                            --动作名 --seek时间 --是否无限重播
				},
				{ -- 完成没交
				},
				{ -- 交成功
					[GameApi.HashAString("主线任务王老虎4")]  = {"被击飞", 700, true},
				},
				{ -- 失败
				},
			},
		},
	},

        {
		TaskID = 2948,
		ScendID =
		{
			[19] = true, --仙霞岭
		},
		NPCParam =
		{
			[27545] =
			{
				{ -- 接到                                            --动作名 --seek时间 --是否无限重播
				},
				{ -- 完成没交
					[GameApi.HashAString("主线任务王老虎4")] 	= {"休闲动作3", 0, false, "站立", 0, true},
				},
				{ -- 交成功
				},
				{ -- 失败
				},
			},
		},
	},

	{
		TaskID = 2958,
		ScendID =
		{
			[38] = true, --五霸岗
		},
		NPCParam =
		{
			[28030] =
			{
				{ -- 接到                                            --动作名 --seek时间 --是否无限重播
				},
				{ -- 完成没交
					[GameApi.HashAString("五霸岗令狐冲")] 	= {"死亡循环", 0 ,true},
				},
				{ -- 交成功
					[GameApi.HashAString("五霸岗令狐冲")]   = {"死亡循环", 0 ,true},
				},
				{ -- 失败
				},
			},
		},
	},

	{
		TaskID = 3034,
		ScendID =
		{
			[22] = true, --龙泉
		},
		NPCParam =
		{
			[28405] =
			{
				{ -- 接到                                            --动作名 --seek时间 --是否无限重播
				},
				{ -- 完成没交
				},
				{ -- 交成功
					[GameApi.HashAString("主线任务女鬼")]   = {"休闲动作2", 0 ,true},
				},
				{ -- 失败
				},
			},
		},
	},

	{
		TaskID = 3052,
		ScendID =
		{
			[41] = true, --黑木崖
		},
		NPCParam =
		{
			[28811] =
			{
				{ -- 接到                                            --动作名 --seek时间 --是否无限重播
					[GameApi.HashAString("2033杨莲亭2")]   = {"休闲动作2", 0 ,true},
				},
				{ -- 完成没交
				},
				{ -- 交成功
				},
				{ -- 失败
				},
			},
		},
	},

	{
		TaskID = 2578,
		ScendID =
		{
			[61] = true, --惊蛰城
		},
		NPCParam =
		{
			[25137] =
			{
				{ -- 接到                                            --动作名 --seek时间 --是否无限重播
					[GameApi.HashAString("东方剧情06石鼓书院卫兵雪千寻")] 	= {"战斗站立", 0, true},
				},
				{ -- 完成没交
					[GameApi.HashAString("东方剧情06石鼓书院卫兵雪千寻")] 	= {"战斗站立", 0, true},
				},
				{ -- 交成功
					[GameApi.HashAString("东方剧情06石鼓书院卫兵雪千寻")] 	= {"战斗站立", 0, true},
				},
				{ -- 失败
					[GameApi.HashAString("东方剧情06石鼓书院卫兵雪千寻")] 	= {"战斗站立", 0, true},
				},
			},
		},
	},

	{
		TaskID = 2603,
		ScendID =
		{
			[63] = true, --黑木崖
		},
		NPCParam =
		{
			[29301] =
			{
				{ -- 接到                                            --动作名 --seek时间 --是否无限重播
					[GameApi.HashAString("东方剧情99黑木崖大战对打NPC01")] 	= {"技能攻击1", 0, true},
					[GameApi.HashAString("东方剧情99黑木崖大战对打NPC02")] 	= {"技能攻击2", 0, true},
					[GameApi.HashAString("东方剧情99黑木崖大战对打NPC03")] 	= {"技能攻击1", 0, true},
					[GameApi.HashAString("东方剧情99黑木崖大战对打NPC04")] 	= {"技能攻击2", 0, true},
				},
				{ -- 完成没交
					[GameApi.HashAString("东方剧情99黑木崖大战对打NPC01")] 	= {"技能攻击1", 0, true},
					[GameApi.HashAString("东方剧情99黑木崖大战对打NPC02")] 	= {"技能攻击2", 0, true},
					[GameApi.HashAString("东方剧情99黑木崖大战对打NPC03")] 	= {"技能攻击1", 0, true},
					[GameApi.HashAString("东方剧情99黑木崖大战对打NPC04")] 	= {"技能攻击2", 0, true},
				},
				{ -- 交成功
					[GameApi.HashAString("东方剧情99黑木崖大战对打NPC01")] 	= {"技能攻击1", 0, true},
					[GameApi.HashAString("东方剧情99黑木崖大战对打NPC02")] 	= {"技能攻击2", 0, true},
					[GameApi.HashAString("东方剧情99黑木崖大战对打NPC03")] 	= {"技能攻击1", 0, true},
					[GameApi.HashAString("东方剧情99黑木崖大战对打NPC04")] 	= {"技能攻击2", 0, true},
				},
				{ -- 失败
					[GameApi.HashAString("东方剧情99黑木崖大战对打NPC01")] 	= {"技能攻击1", 0, true},
					[GameApi.HashAString("东方剧情99黑木崖大战对打NPC02")] 	= {"技能攻击2", 0, true},
					[GameApi.HashAString("东方剧情99黑木崖大战对打NPC03")] 	= {"技能攻击1", 0, true},
					[GameApi.HashAString("东方剧情99黑木崖大战对打NPC04")] 	= {"技能攻击2", 0, true},
				},
			},
			[25015] =
			{
				{ -- 接到                                            --动作名 --seek时间 --是否无限重播
					[GameApi.HashAString("东方剧情20进攻总坛明教小BOSS")] 	= {"技能攻击1", 0, true},
				},
				{ -- 完成没交
					[GameApi.HashAString("东方剧情20进攻总坛明教小BOSS")] 	= {"技能攻击1", 0, true},
				},
				{ -- 交成功
					[GameApi.HashAString("东方剧情20进攻总坛明教小BOSS")] 	= {"技能攻击1", 0, true},
				},
				{ -- 失败
					[GameApi.HashAString("东方剧情20进攻总坛明教小BOSS")] 	= {"技能攻击1", 0, true},
				},
			},
		},
	},

	{
		TaskID = 2604,
		ScendID =
		{
			[63] = true, --黑木崖
		},
		NPCParam =
		{
			[25521] =
			{
				{ -- 接到                                            --动作名 --seek时间 --是否无限重播
				},
				{ -- 完成没交
				},
				{ -- 交成功
					[GameApi.HashAString("东方剧情22下毒龙套投降教众3")] 		= {"跪地求饶", 0, true},
					[GameApi.HashAString("东方剧情22下毒龙套投降教众19")] 	= {"跪地求饶", 0, true},
					[GameApi.HashAString("东方剧情22下毒龙套投降教众20")] 	= {"跪地求饶", 0, true},
					[GameApi.HashAString("东方剧情22下毒龙套投降教众21")] 	= {"跪地求饶", 0, true},
					[GameApi.HashAString("东方剧情22下毒龙套投降教众18")] 	= {"跪地求饶", 0, true},
					[GameApi.HashAString("东方剧情22下毒龙套投降教众7")] 		= {"跪地求饶", 0, true},
					[GameApi.HashAString("东方剧情22下毒龙套投降教众6")] 		= {"跪地求饶", 0, true},
					[GameApi.HashAString("东方剧情22下毒龙套投降教众22")] 	= {"跪地求饶", 0, true},
				},
				{ -- 失败
				},
			},
			[25515] =
			{
				{ -- 接到                                            --动作名 --seek时间 --是否无限重播
				},
				{ -- 完成没交
				},
				{ -- 交成功
					[GameApi.HashAString("东方剧情22下毒龙套投降教众13")] 	= {"下跪求饶", 0, true},
					[GameApi.HashAString("东方剧情22下毒龙套投降教众10")] 	= {"下跪求饶", 0, true},
					[GameApi.HashAString("东方剧情22下毒龙套投降教众8")] 		= {"下跪求饶", 0, true},
					[GameApi.HashAString("东方剧情22下毒龙套投降教众12")] 	= {"下跪求饶", 0, true},
					[GameApi.HashAString("东方剧情22下毒龙套投降教众11")] 	= {"下跪求饶", 0, true},
					[GameApi.HashAString("东方剧情22下毒龙套投降教众9")] 		= {"下跪求饶", 0, true},
					[GameApi.HashAString("东方剧情22下毒龙套投降教众1")] 		= {"下跪求饶", 0, true},
				},
				{ -- 失败
				},
			},
			[25518] =
			{
				{ -- 接到                                            --动作名 --seek时间 --是否无限重播
				},
				{ -- 完成没交
				},
				{ -- 交成功
					[GameApi.HashAString("东方剧情22下毒龙套投降教众14")] 	= {"投降循环", 0, true},
					[GameApi.HashAString("东方剧情22下毒龙套投降教众5")] 		= {"投降循环", 0, true},
					[GameApi.HashAString("东方剧情22下毒龙套投降教众4")] 		= {"投降循环", 0, true},
					[GameApi.HashAString("东方剧情22下毒龙套投降教众15")] 	= {"投降循环", 0, true},
					[GameApi.HashAString("东方剧情22下毒龙套投降教众16")] 	= {"投降循环", 0, true},
					[GameApi.HashAString("东方剧情22下毒龙套投降教众2")] 		= {"投降循环", 0, true},
					[GameApi.HashAString("东方剧情22下毒龙套投降教众17")] 	= {"投降循环", 0, true},
				},
				{ -- 失败
				},
			},
			[29301] =
			{
				{ -- 接到                                            --动作名 --seek时间 --是否无限重播
					[GameApi.HashAString("东方剧情99黑木崖大战对打NPC01")] 	= {"技能攻击1", 0, true},
					[GameApi.HashAString("东方剧情99黑木崖大战对打NPC02")] 	= {"技能攻击2", 0, true},
					[GameApi.HashAString("东方剧情99黑木崖大战对打NPC03")] 	= {"技能攻击1", 0, true},
					[GameApi.HashAString("东方剧情99黑木崖大战对打NPC04")] 	= {"技能攻击2", 0, true},
				},
				{ -- 完成没交
				},
				{ -- 交成功
				},
				{ -- 失败
				},
			},
			[25015] =
			{
				{ -- 接到                                            --动作名 --seek时间 --是否无限重播
					[GameApi.HashAString("东方剧情20进攻总坛明教小BOSS")] 	= {"技能攻击1", 0, true},
				},
				{ -- 完成没交
				},
				{ -- 交成功
				},
				{ -- 失败
				},
			},
			[29509] =
			{
				{ -- 接到                                            --动作名 --seek时间 --是否无限重播
				},
				{ -- 完成没交
				},
				{ -- 交成功
					[GameApi.HashAString("东方剧情20进攻总坛明教求饶小BOSS")] 	= {"投降循环", 0, true},
				},
				{ -- 失败
				},
			},
		},
	},

	{
		TaskID = 3968,
		ScendID =
		{
			[4] = true, --衡山城郊外
		},
		NPCParam =
		{
			[44151] =
			{
				{ -- 接到                                            --动作名 --seek时间 --是否无限重播
					[GameApi.HashAString("野外关押林平之NPC")] 	= {"战立", 0, true},
				},
				{ -- 完成没交
					[GameApi.HashAString("野外关押林平之NPC")] 	= {"休闲动作", 0, false},
				},
				{ -- 交成功
					[GameApi.HashAString("野外关押林平之NPC")] 	= {"休闲动作", 0, false},
				},
				{ -- 失败
				},
			},
		},
	},

	{
		TaskID = 5581,
		ScendID =
		{
			[4] = true, --衡山城郊外
		},
		NPCParam =
		{
			[35732] =
			{
				{ -- 接到                                            --动作名 --seek时间 --是否无限重播
					[GameApi.HashAString("湖心亭令狐冲")] 	= {"死亡循环", 0, true},
				},
				{ -- 完成没交
					[GameApi.HashAString("湖心亭令狐冲")] 	= {"休闲动作6", 0, true},
				},
				{ -- 交成功
					[GameApi.HashAString("湖心亭令狐冲")] 	= {"休闲动作6", 0, true},
				},
				{ -- 失败
					[GameApi.HashAString("湖心亭令狐冲")] 	= {"死亡循环", 0, true},
				},
			},
		},
	},

	{
		TaskID = 4564,
		ScendID =
		{
			[71] = true, --药王谷
		},
		NPCParam =
		{
			[55932] =
			{
				{ -- 接到                                            --动作名 --seek时间 --是否无限重播
				},
				{ -- 完成没交
				},
				{ -- 交成功
					[GameApi.HashAString("令狐冲皇陵外")] 	= {"被击晕", 0, true},
				},
				{ -- 失败
				},
			},
		},
	},
	{
		TaskID = 4565,
		ScendID =
		{
			[71] = true, --药王谷
		},
		NPCParam =
		{
			[55932] =
			{
				{ -- 接到                                            --动作名 --seek时间 --是否无限重播
					[GameApi.HashAString("令狐冲皇陵外")] 	= {"毒发", 0, false},
				},
				{ -- 完成没交
					[GameApi.HashAString("令狐冲皇陵外")] 	= {"毒发", 0, false},
				},
				{ -- 交成功
					[GameApi.HashAString("令狐冲皇陵外")] 	= {"毒发", 0, false},
				},
				{ -- 失败
					[GameApi.HashAString("令狐冲皇陵外")] 	= {"被击晕", 0, true},
				},
			},
		},
	},
	{
		TaskID = 4567,
		ScendID =
		{
			[71] = true, --药王谷
		},
		NPCParam =
		{
			[55932] =
			{
				{ -- 接到                                            --动作名 --seek时间 --是否无限重播
					[GameApi.HashAString("令狐冲皇陵外")] 	= {"毒发", 0, false},
				},
				{ -- 完成没交
					[GameApi.HashAString("令狐冲皇陵外")] 	= {"解毒", 0, false},
				},
				{ -- 交成功
					[GameApi.HashAString("令狐冲皇陵外")] 	= {"休闲动作3", 0, false},
				},
				{ -- 失败
					[GameApi.HashAString("令狐冲皇陵外")] 	= {"毒发", 0, false},
				},
			},
		},
	},
	{
		TaskID = 4568,
		ScendID =
		{
			[71] = true, --药王谷
		},
		NPCParam =
		{
			[55932] =
			{
				{ -- 接到                                            --动作名 --seek时间 --是否无限重播
					[GameApi.HashAString("令狐冲皇陵外")] 	= {"", 0, false},
				},
				{ -- 完成没交
				},
				{ -- 交成功
				},
				{ -- 失败
				},
			},
		},
	},
	{
		TaskID = 4656,
		ScendID =
		{
			[71] = true, --药王谷
		},
		NPCParam =
		{
			[57362] =
			{
				{ -- 接到                                            --动作名 --seek时间 --是否无限重播
				},
				{ -- 完成没交
				        [GameApi.HashAString("松鼠")] 	= {"死亡循环", 0, true},
				},
				{ -- 交成功
				},
				{ -- 失败

				},
			},
		},
	},
	{
		TaskID = 4505,
		ScendID =
		{
			[77] = true, --少室山
		},
		NPCParam =
		{
			[56242] =
			{
				{ -- 接到                                            --动作名 --seek时间 --是否无限重播
				},
				{ -- 完成没交
				},
				{ -- 交成功
					[GameApi.HashAString("偷懒的嵩山弟子1")] 	= {"死亡", 0, false, "死亡循环", 0, true},
					[GameApi.HashAString("偷懒的嵩山弟子2")] 	= {"死亡", 0, false, "死亡循环", 0, true},
					[GameApi.HashAString("偷懒的嵩山弟子3")] 	= {"死亡", 0, false, "死亡循环", 0, true},
					[GameApi.HashAString("偷懒的嵩山弟子4")] 	= {"死亡", 0, false, "死亡循环", 0, true},
				},
				{ -- 失败
				},
			},
			[56167] =
			{
				{ -- 接到                                            --动作名 --seek时间 --是否无限重播
				},
				{ -- 完成没交
				},
				{ -- 交成功
					[GameApi.HashAString("偷懒的嵩山精英1")] 	= {"死亡", 0, false, "死亡循环", 0, true},
				},
				{ -- 失败
				},
			},
		},
	},
	{
		TaskID = 4801,
		ScendID =
		{
			[75] = true, --洛阳
		},
		NPCParam =
		{
			[58760] =
			{
				{ -- 接到                                            --动作名 --seek时间 --是否无限重播
				},
				{ -- 完成没交
				},
				{ -- 交成功
					[GameApi.HashAString("令狐冲")] 	= {"休闲动作6", 0, true},
				},
				{ -- 失败
				},
			},
		},
	},
	{
		TaskID = 4802,
		ScendID =
		{
			[75] = true, --洛阳
		},
		NPCParam =
		{
			[58760] =
			{
				{ -- 接到                                            --动作名 --seek时间 --是否无限重播
				},
				{ -- 完成没交
					[GameApi.HashAString("令狐冲")] 	= {"行走", 0, true},
				},
				{ -- 交成功
				},
				{ -- 失败
				},
			},
		},
	},
	{
		TaskID = 5218,
		ScendID =
		{
			[72] = true, --福州郊外
		},
		NPCParam =
		{
			[63351] =
			{
				{ -- 接到                                            --动作名 --seek时间 --是否无限重播
				},
				{ -- 完成没交
					[GameApi.HashAString("剑冢神雕")] 	= {"受伤2_通用", 0, true},
				},
				{ -- 交成功
				},
				{ -- 失败
				},
			},
		},
	},
	{
		TaskID = 5219,
		ScendID =
		{
			[72] = true, --福州郊外
		},
		NPCParam =
		{
			[63351] =
			{
				{ -- 接到                                            --动作名 --seek时间 --是否无限重播
				},
				{ -- 完成没交
					[GameApi.HashAString("剑冢神雕")] 	= {"休闲动作1_通用", 0, true},
				},
				{ -- 交成功
					[GameApi.HashAString("剑冢神雕")] 	= {"休闲动作1_通用", 0, true},
				},
				{ -- 失败
				},
			},
		},
	},
	{
		TaskID = 5342,
		ScendID =
		{
			[72] = true, --福州郊外
		},
		NPCParam =
		{
			[63019] =
			{
				{ -- 接到                                            --动作名 --seek时间 --是否无限重播
				},
				{ -- 完成没交
					[GameApi.HashAString("黄彪马")] 	= {"原地跳跃", 0, true},
				},
				{ -- 交成功
					[GameApi.HashAString("黄彪马")] 	= {"原地跳跃", 0, true},
				},
				{ -- 失败
				},
			},
		},
	},
	{
		TaskID = 3835,
		ScendID =
		{
			[73] = true, --夜岚谷
		},
		NPCParam =
		{
			[35410] =
			{
				{ -- 接到                                            --动作名 --seek时间 --是否无限重播
				},
				{ -- 完成没交
				},
				{ -- 交成功
					[GameApi.HashAString("授谱前刘正风")] 	= {"死亡动作2", 0, false,"死亡动作2循环", 0, true},
				},
				{ -- 失败
				},
			},
			[35413] =
			{
				{ -- 接到                                            --动作名 --seek时间 --是否无限重播
				},
				{ -- 完成没交
				},
				{ -- 交成功
					[GameApi.HashAString("授谱前曲洋")] 	= {"死亡动作2", 0, false,"死亡动作2循环", 0, true},
				},
				{ -- 失败
				},
			},
			[35416] =
			{
				{ -- 接到                                            --动作名 --seek时间 --是否无限重播
				},
				{ -- 完成没交
					[GameApi.HashAString("相位后的死曲非烟")] 	= {"死亡循环", 0, true},
				},
				{ -- 交成功
				},
				{ -- 失败
				},
			},
		},
	},
        {
		TaskID = 5447,
		ScendID =
		{
			[86] = true, --神秘凶案
		},
		NPCParam =
		{
			[66276] =
			{
				{ -- 接到                                            --动作名 --seek时间 --是否无限重播
				},
				{ -- 完成没交
					[GameApi.HashAString("受伤弟子01")] 	= {"死亡循环", 0, true},
				        [GameApi.HashAString("受伤弟子02")] 	= {"死亡循环", 0, true},
				        [GameApi.HashAString("受伤弟子03")] 	= {"死亡循环", 0, true},
				        [GameApi.HashAString("受伤弟子04")] 	= {"死亡循环", 0, true},
				        [GameApi.HashAString("受伤弟子05")] 	= {"死亡循环", 0, true},
				},
				{ -- 交成功
				        [GameApi.HashAString("受伤弟子01")] 	= {"死亡循环", 0, true},
				        [GameApi.HashAString("受伤弟子02")] 	= {"死亡循环", 0, true},
				        [GameApi.HashAString("受伤弟子03")] 	= {"死亡循环", 0, true},
				        [GameApi.HashAString("受伤弟子04")] 	= {"死亡循环", 0, true},
				        [GameApi.HashAString("受伤弟子05")] 	= {"死亡循环", 0, true},
				},
				{ -- 失败
				        [GameApi.HashAString("受伤弟子01")] 	= {"站立", 0, true},
				        [GameApi.HashAString("受伤弟子02")] 	= {"站立", 0, true},
				        [GameApi.HashAString("受伤弟子03")] 	= {"站立", 0, true},
				        [GameApi.HashAString("受伤弟子04")] 	= {"站立", 0, true},
				        [GameApi.HashAString("受伤弟子05")] 	= {"站立", 0, true},
				},
			},
		},
        },
        {
		TaskID = 5461,
		ScendID =
		{
			[86] = true, --艾玛屠村
		},
		NPCParam =
		{
			[64824] =
			{
				{ -- 接到                                            --动作名 --seek时间 --是否无限重播
				        [GameApi.HashAString("灵蛇村民2")] 	= {"死亡循环", 0, true},
				        [GameApi.HashAString("灵蛇村民3")] 	= {"死亡循环", 0, true},
				        [GameApi.HashAString("灵蛇村民9")] 	= {"死亡循环", 0, true},
				},
				{ -- 完成没交
				        [GameApi.HashAString("灵蛇村民2")] 	= {"死亡循环", 0, true},
				        [GameApi.HashAString("灵蛇村民3")] 	= {"死亡循环", 0, true},
				        [GameApi.HashAString("灵蛇村民9")] 	= {"死亡循环", 0, true},
				},
				{ -- 交成功
				        [GameApi.HashAString("灵蛇村民2")] 	= {"死亡循环", 0, true},
				        [GameApi.HashAString("灵蛇村民3")] 	= {"死亡循环", 0, true},
				        [GameApi.HashAString("灵蛇村民9")] 	= {"死亡循环", 0, true},
				},
				{ -- 失败
				        [GameApi.HashAString("灵蛇村民2")] 	= {"站立", 0, true},
				        [GameApi.HashAString("灵蛇村民3")] 	= {"站立", 0, true},
				        [GameApi.HashAString("灵蛇村民9")] 	= {"站立", 0, true},
				},
			},
		        [64818] =
			{
				{ -- 接到                                            --动作名 --seek时间 --是否无限重播
				        [GameApi.HashAString("灵蛇村民4")] 	= {"死亡循环", 0, true},
				        [GameApi.HashAString("灵蛇村民7")] 	= {"死亡循环", 0, true},
				        [GameApi.HashAString("灵蛇村民8")] 	= {"死亡循环", 0, true},
				},
				{ -- 完成没交
				        [GameApi.HashAString("灵蛇村民4")] 	= {"死亡循环", 0, true},
				        [GameApi.HashAString("灵蛇村民7")] 	= {"死亡循环", 0, true},
				        [GameApi.HashAString("灵蛇村民8")] 	= {"死亡循环", 0, true},
				},
				{ -- 交成功
				        [GameApi.HashAString("灵蛇村民4")] 	= {"死亡循环", 0, true},
				        [GameApi.HashAString("灵蛇村民7")] 	= {"死亡循环", 0, true},
				        [GameApi.HashAString("灵蛇村民8")] 	= {"死亡循环", 0, true},
				},
				{ -- 失败
				        [GameApi.HashAString("灵蛇村民4")] 	= {"站立", 0, true},
				        [GameApi.HashAString("灵蛇村民7")] 	= {"站立", 0, true},
				        [GameApi.HashAString("灵蛇村民8")] 	= {"站立", 0, true},
				},
			},
		        [64821] =
			{
				{ -- 接到                                            --动作名 --seek时间 --是否无限重播
				        [GameApi.HashAString("灵蛇村民1")] 	= {"死亡循环", 0, true},
				        [GameApi.HashAString("灵蛇村民6")] 	= {"死亡循环", 0, true},
				        [GameApi.HashAString("灵蛇村民10")] 	= {"死亡循环", 0, true},
				},
				{ -- 完成没交
				        [GameApi.HashAString("灵蛇村民1")] 	= {"死亡循环", 0, true},
				        [GameApi.HashAString("灵蛇村民6")] 	= {"死亡循环", 0, true},
				        [GameApi.HashAString("灵蛇村民10")] 	= {"死亡循环", 0, true},
				},
				{ -- 交成功
				        [GameApi.HashAString("灵蛇村民1")] 	= {"死亡循环", 0, true},
				        [GameApi.HashAString("灵蛇村民6")] 	= {"死亡循环", 0, true},
				        [GameApi.HashAString("灵蛇村民10")] 	= {"死亡循环", 0, true},
				},
				{ -- 失败
				        [GameApi.HashAString("灵蛇村民1")] 	= {"站立", 0, true},
				        [GameApi.HashAString("灵蛇村民6")] 	= {"站立", 0, true},
				        [GameApi.HashAString("灵蛇村民10")] 	= {"站立", 0, true},
				},
			},
		},
        },
        {
		TaskID = 5401,
		ScendID =
		{
			[84] = true, --铸剑谷
		},
		NPCParam =
		{
			[64448] =
			{
				{ -- 接到                                            --动作名 --seek时间 --是否无限重播
				},
				{ -- 完成没交
					[GameApi.HashAString("主线-洛星辰1")] 	= {"战斗站立", 0, true},
				},
				{ -- 交成功
					[GameApi.HashAString("主线-洛星辰1")] 	= {"休闲动作2", 0, true},
				},
				{ -- 失败
				},
			},
		},
        },
        {
		TaskID = 4922,
		ScendID =
		{
			[79] = true, --桃实仙诈尸
		},
		NPCParam =
		{
			[59310] =
			{
				{ -- 接到                                            --动作名 --seek时间 --是否无限重播
				        [GameApi.HashAString("00新剧情桃实仙躺")] 	= {"死亡循环", 0, true},
				},
				{ -- 完成没交
					[GameApi.HashAString("00新剧情桃实仙躺")] 	= {"战斗站立", 0, true},
				},
				{ -- 交成功
					[GameApi.HashAString("00新剧情桃实仙躺")] 	= {"站立", 0, true},
				},
				{ -- 失败
				        [GameApi.HashAString("00新剧情桃实仙躺")] 	= {"死亡循环", 0, true},
				},
			},
		},
        },
	{
		TaskID = 4922,
		ScendID =
		{
			[79] = true, --大师兄被抓走啦
		},
		NPCParam =
		{
		        [59322] =
			{
				{ -- 接到                                            --动作名 --seek时间 --是否无限重播
				        [GameApi.HashAString("00新剧情宁中则")] 	= {"战斗站立", 0, true},
				},
				{ -- 完成没交
					[GameApi.HashAString("00新剧情宁中则")] 	= {"战斗站立", 0, true},
				},
				{ -- 交成功
					[GameApi.HashAString("00新剧情宁中则")] 	= {"站立", 0, true},
				},
				{ -- 失败
				        [GameApi.HashAString("00新剧情宁中则")] 	= {"站立", 0, true},
				},
			},
		        [67457] =
			{
				{ -- 接到                                            --动作名 --seek时间 --是否无限重播
				        [GameApi.HashAString("FixedNpc_1076")] 	        = {"战斗站立", 0, true},
				        [GameApi.HashAString("FixedNpc_1077")] 	        = {"战斗站立", 0, true},
				        [GameApi.HashAString("FixedNpc_1078")] 	        = {"战斗站立", 0, true},
				        [GameApi.HashAString("FixedNpc_1079")] 	        = {"战斗站立", 0, true},
				},
				{ -- 完成没交
				        [GameApi.HashAString("FixedNpc_1076")] 	        = {"战斗站立", 0, true},
				        [GameApi.HashAString("FixedNpc_1077")] 	        = {"战斗站立", 0, true},
				        [GameApi.HashAString("FixedNpc_1078")] 	        = {"战斗站立", 0, true},
				        [GameApi.HashAString("FixedNpc_1079")] 	        = {"战斗站立", 0, true},
				},
				{ -- 交成功
					[GameApi.HashAString("FixedNpc_1076")] 	        = {"站立", 0, true},
				        [GameApi.HashAString("FixedNpc_1077")] 	        = {"站立", 0, true},
				        [GameApi.HashAString("FixedNpc_1078")] 	        = {"站立", 0, true},
				        [GameApi.HashAString("FixedNpc_1079")] 	        = {"站立", 0, true},
				},
				{ -- 失败
				        [GameApi.HashAString("FixedNpc_1076")] 	        = {"站立", 0, true},
				        [GameApi.HashAString("FixedNpc_1077")] 	        = {"站立", 0, true},
				        [GameApi.HashAString("FixedNpc_1078")] 	        = {"站立", 0, true},
				        [GameApi.HashAString("FixedNpc_1079")] 	        = {"站立", 0, true},
				},
			},
		},
        },
	{
		TaskID = 4925,
		ScendID =
		{
			[79] = true, --令狐冲放血
		},
		NPCParam =
		{
			[59364] =
			{
				{ -- 接到                                            --动作名 --seek时间 --是否无限重播
				        [GameApi.HashAString("00新剧情令狐冲02")] 	= {"被击晕", 0, true},
				},
				{ -- 完成没交
					[GameApi.HashAString("00新剧情令狐冲02")] 	= {"受伤战斗站立", 0, true},
				},
				{ -- 交成功
					[GameApi.HashAString("00新剧情令狐冲02")] 	= {"毒发", 0, false},
				},
				{ -- 失败
				        [GameApi.HashAString("00新剧情令狐冲02")] 	= {"被击晕", 0, true},
				},
			},
		},
        },
	{
		TaskID = 4926,
		ScendID =
		{
			[79] = true, --殴打老头子
		},
		NPCParam =
		{
			[59355] =
			{
				{ -- 接到                                            --动作名 --seek时间 --是否无限重播
				        [GameApi.HashAString("00新剧情老头子")] 	= {"战斗站立", 0, true},
				},
				{ -- 完成没交
					[GameApi.HashAString("00新剧情老头子")] 	= {"站立", 0, true},
				},
				{ -- 交成功
					[GameApi.HashAString("00新剧情老头子")] 	= {"站立", 0, true},
				},
				{ -- 失败
				        [GameApi.HashAString("00新剧情老头子")] 	= {"战斗站立", 0, true},
				},
			},
		},
        },

	{
		TaskID = 5557,
		ScendID =
		{
			[79] = true, --拯救不死
		},
		NPCParam =
		{
			[59358] =
			{
				{ -- 接到                                            --动作名 --seek时间 --是否无限重播
				        [GameApi.HashAString("NpcGenerator_23")] 	= {"恐惧", 0, true},
				},
				{ -- 完成没交
					[GameApi.HashAString("NpcGenerator_23")] 	= {"休闲动作1", 0, true},
				},
				{ -- 交成功
					[GameApi.HashAString("NpcGenerator_23")] 	= {"休闲动作2", 0, true},
				},
				{ -- 失败
				        [GameApi.HashAString("NpcGenerator_23")] 	= {"休闲动作1", 0, true},
				},
			},
		},
        },

	{
		TaskID = 5833,
		ScendID =
		{
			[81] = true, --五霸岗
		},
		NPCParam =
		{
			[67699] =
			{
				{ -- 接到                                            --动作名 --seek时间 --是否无限重播
					[GameApi.HashAString("草庐令狐冲")] 	= {"死亡循环", 0, true},
				},
				{ -- 完成没交
					[GameApi.HashAString("草庐令狐冲")] 	= {"死亡循环", 0, true},
				},
				{ -- 交成功
					[GameApi.HashAString("草庐令狐冲")] 	= {"死亡循环", 0, true},
				},
				{ -- 失败
					[GameApi.HashAString("草庐令狐冲")] 	= {"站立", 0, true},
				},
			},
		},
	},

	{
		TaskID = 5595,
		ScendID =
		{
			[81] = true, --五霸岗
		},
		NPCParam =
		{
			[67699] =
			{
				{ -- 接到                                            --动作名 --seek时间 --是否无限重播
				},
				{ -- 完成没交
				},
				{ -- 交成功
					[GameApi.HashAString("草庐令狐冲")] 	= {"解毒", 0, false},
				},
				{ -- 失败
					[GameApi.HashAString("草庐令狐冲")] 	= {"死亡循环", 0, true},
				},
			},
		},
	},

	{
		TaskID = 5597,
		ScendID =
		{
			[81] = true, --五霸岗
		},
		NPCParam =
		{
			[67723] =
			{
				{ -- 接到                                            --动作名 --seek时间 --是否无限重播
				},
				{ -- 完成没交
				},
				{ -- 交成功
					[GameApi.HashAString("草庐平一指")] 	= {"咯血", 0, false},
				},
				{ -- 失败
					[GameApi.HashAString("草庐平一指")] 	= {"休闲动作1", 0, true},
				},
			},
		},
	},

	{
		TaskID = 5599,
		ScendID =
		{
			[81] = true, --五霸岗
		},
		NPCParam =
		{
			[67702] =
			{
				{ -- 接到                                            --动作名 --seek时间 --是否无限重播
				},
				{ -- 完成没交
				},
				{ -- 交成功
					[GameApi.HashAString("五霸岗令狐冲")] 	= {"受伤战斗站立", 0, true},
				},
				{ -- 失败
					[GameApi.HashAString("五霸岗令狐冲")] 	= {"休闲动作2", 0, true},
				},
			},
		},
	},

	{
		TaskID = 5612,
		ScendID =
		{
			[81] = true, --五霸岗
		},
		NPCParam =
		{
			[67702] =
			{
				{ -- 接到                                            --动作名 --seek时间 --是否无限重播
					[GameApi.HashAString("五霸岗令狐冲")] 	= {"毒发", 0, false},
				},
				{ -- 完成没交
					[GameApi.HashAString("五霸岗令狐冲")] 	= {"死亡循环", 0, true},
				},
				{ -- 交成功
					[GameApi.HashAString("五霸岗令狐冲")] 	= {"死亡循环", 0, true},
				},
				{ -- 失败
					[GameApi.HashAString("五霸岗令狐冲")] 	= {"受伤战斗站立", 0, true},
				},
			},
		},
	},

	{
		TaskID = 5613,
		ScendID =
		{
			[81] = true, --五霸岗
		},
		NPCParam =
		{
			[67702] =
			{
				{ -- 接到                                            --动作名 --seek时间 --是否无限重播
					[GameApi.HashAString("五霸岗令狐冲")] 	= {"死亡循环", 0, true},
				},
				{ -- 完成没交
					[GameApi.HashAString("五霸岗令狐冲")] 	= {"死亡循环", 0, true},
				},
				{ -- 交成功
					[GameApi.HashAString("五霸岗令狐冲")] 	= {"解毒", 0, false},
				},
				{ -- 失败
					[GameApi.HashAString("五霸岗令狐冲")] 	= {"死亡循环", 0, true},
				},
			},
		},
	},

	{
		TaskID = 5614,
		ScendID =
		{
			[81] = true, --五霸岗
		},
		NPCParam =
		{
			[68686] =
			{
				{ -- 接到                                            --动作名 --seek时间 --是否无限重播
					[GameApi.HashAString("五霸岗下令狐冲")] 	= {"受伤战斗站立", 0, true},
				},
				{ -- 完成没交
					[GameApi.HashAString("五霸岗下令狐冲")] 	= {"受伤战斗站立", 0, true},
				},
				{ -- 交成功
					[GameApi.HashAString("五霸岗下令狐冲")] 	= {"受伤战斗站立", 0, true},
				},
				{ -- 失败
				},
			},
		},
	},

	{
		TaskID = 5840,
		ScendID =
		{
			[81] = true, --五霸岗
		},
		NPCParam =
		{
			[67711] =
			{
				{ -- 接到                                            --动作名 --seek时间 --是否无限重播
					[GameApi.HashAString("涧边令狐冲")] 	= {"休闲动作6", 0, true},
				},
				{ -- 完成没交
					[GameApi.HashAString("涧边令狐冲")] 	= {"休闲动作6", 0, true},
				},
				{ -- 交成功
					[GameApi.HashAString("涧边令狐冲")] 	= {"休闲动作6", 0, true},
				},
				{ -- 失败
				},
			},
		},
	},

	{
		TaskID = 5624,
		ScendID =
		{
			[81] = true, --五霸岗
		},
		NPCParam =
		{
			[67711] =
			{
				{ -- 接到                                            --动作名 --seek时间 --是否无限重播
					[GameApi.HashAString("涧边令狐冲")] 	= {"休闲动作6", 0, true},
				},
				{ -- 完成没交
					[GameApi.HashAString("涧边令狐冲")] 	= {"站立", 0, true},
				},
				{ -- 交成功
					[GameApi.HashAString("涧边令狐冲")] 	= {"站立", 0, true},
				},
				{ -- 失败
				},
			},
		},
	},

	{
		TaskID = 5625,
		ScendID =
		{
			[81] = true, --五霸岗
		},
		NPCParam =
		{
			[67714] =
			{
				{ -- 接到                                            --动作名 --seek时间 --是否无限重播
					[GameApi.HashAString("五霸寺令狐冲")] 	= {"受伤战斗站立", 0, true},
				},
				{ -- 完成没交
					[GameApi.HashAString("五霸寺令狐冲")] 	= {"受伤战斗站立", 0, true},
				},
				{ -- 交成功
					[GameApi.HashAString("五霸寺令狐冲")] 	= {"受伤战斗站立", 0, true},
				},
				{ -- 失败
				},
			},
		},
	},

	{
		TaskID = 5626,
		ScendID =
		{
			[81] = true, --五霸岗
		},
		NPCParam =
		{
			[67945] =
			{
				{ -- 接到                                            --觉月动作名 --seek时间 --是否无限重播
					[GameApi.HashAString("五霸寺觉月")] 	= {"死亡持续", 0, false},
				},
				{ -- 完成没交
					[GameApi.HashAString("五霸寺觉月")] 	= {"死亡持续", 0, false},
				},
				{ -- 交成功
					[GameApi.HashAString("五霸寺觉月")] 	= {"死亡持续", 0, false},
				},
				{ -- 失败
					[GameApi.HashAString("五霸寺觉月")] 	= {"战斗站立", 0, true},
				},
			},
			[67933] =
			{
				{ -- 接到                                            --觉月动作名 --seek时间 --是否无限重播
					[GameApi.HashAString("五霸寺易国梓")] 	= {"死亡循环", 0, false},
				},
				{ -- 完成没交
					[GameApi.HashAString("五霸寺易国梓")] 	= {"死亡循环", 0, false},
				},
				{ -- 交成功
					[GameApi.HashAString("五霸寺易国梓")] 	= {"死亡循环", 0, false},
				},
				{ -- 失败
					[GameApi.HashAString("五霸寺易国梓")] 	= {"战斗站立", 0, true},
				},
			},
			[67927] =
			{
				{ -- 接到                                            --辛国梁动作名 --seek时间 --是否无限重播
					[GameApi.HashAString("五霸寺辛国梁")] 	= {"死亡持续", 0, false},
				},
				{ -- 完成没交
					[GameApi.HashAString("五霸寺辛国梁")] 	= {"死亡持续", 0, false},
				},
				{ -- 交成功
					[GameApi.HashAString("五霸寺辛国梁")] 	= {"死亡持续", 0, false},
				},
				{ -- 失败
					[GameApi.HashAString("五霸寺辛国梁")] 	= {"战斗站立", 0, true},
			        },
			},
		},
	},
	
	{
		TaskID = 5900,
		ScendID =
		{
			[82] = true, --余杭
		},
		NPCParam =
		{
			[71913] =
			{
				{ -- 接到                                            --动作名 --seek时间 --是否无限重播
					[GameApi.HashAString("NpcGenerator_119")] 	= {"休闲动作1", 0, true},
				},
				{ -- 完成没交
					[GameApi.HashAString("NpcGenerator_119")] 	= {"站立", 0, true},
				},
				{ -- 交成功
					[GameApi.HashAString("NpcGenerator_119")] 	= {"站立", 0, true},
				},
				{ -- 失败
			        },
			},
		},
	},
	
	{
		TaskID = 5901,
		ScendID =
		{
			[82] = true, --余杭
		},
		NPCParam =
		{
			[71464] =
			{
				{ -- 接到                                            --动作名 --seek时间 --是否无限重播
					[GameApi.HashAString("NpcGenerator_113")] 	= {"站立", 0, true},
				},
				{ -- 完成没交
					[GameApi.HashAString("NpcGenerator_113")] 	= {"站立", 0, true},
				},
				{ -- 交成功
					[GameApi.HashAString("NpcGenerator_113")] 	= {"交谈", 0, false},
				},
				{ -- 失败
				},
			},
		        [71467] =
			{
				{ -- 接到                                            --动作名 --seek时间 --是否无限重播
					[GameApi.HashAString("NpcGenerator_114")] 	= {"站立", 0, true},
				},
				{ -- 完成没交
					[GameApi.HashAString("NpcGenerator_114")] 	= {"站立", 0, true},
				},
				{ -- 交成功
					[GameApi.HashAString("NpcGenerator_114")] 	= {"被击晕", 0, true},
				},
				{ -- 失败
				},
			},
		},
	},
		
	{
		TaskID = 5281,
		ScendID =
		{
			[80] = true, --仙愁峡
		},
		NPCParam =
		{
			[62070] =
			{
				{ -- 接到                                            --动作名 --seek时间 --是否无限重播
				},
				{ -- 完成没交
				},
				{ -- 交成功
					[GameApi.HashAString("剧情-向问天2")] 	= {"普通攻击2", 0, false},
				},
				{ -- 失败
				},
			},
	                [62082] =
			{
				{ -- 接到                                            --动作名 --seek时间 --是否无限重播
				},
				{ -- 完成没交
				},
				{ -- 交成功
					[GameApi.HashAString("剧情-中毒的路人")] 	= {"被击飞", 0, false, "死亡循环", 0, true},
				},
				{ -- 失败
				},
			},			
		},
	},
        {
		TaskID = 5206,
		ScendID =
		{
			[1051] = true, --红尘客栈
		},
		NPCParam =
		{
			[61707] =
			{
				{ -- 接到                                            --动作名 --seek时间 --是否无限重播
				},
				{ -- 完成没交
					[GameApi.HashAString("201211福州令狐冲笑傲客栈")] 	= {"休闲动作2", 0, false},
				},
				{ -- 交成功
				},
				{ -- 失败
				},
			},
		},
	},
	{
		TaskID = 6140,
		ScendID =
		{
			[85] = true, --情杀
		},
		NPCParam =
		{
			[73750] =
			{
				{ -- 接到                                            --动作名 --seek时间 --是否无限重播
				        [GameApi.HashAString("00新剧情三仙聂牛")] 	= {"站立", 0, false},
				},
				{ -- 完成没交
				        [GameApi.HashAString("00新剧情三仙聂牛")] 	= {"休闲动作1", 0, false},
				},
				{ -- 交成功
					[GameApi.HashAString("00新剧情三仙聂牛")] 	= {"死亡", 0, false},
				},
				{ -- 失败
				        [GameApi.HashAString("00新剧情三仙聂牛")] 	= {"站立", 0, false},
				},
			},			
		},
	},
	{
		TaskID = 5443,
		ScendID =
		{
			[86] = true, --伤患
		},
		NPCParam =
		{
			[66276] =
			{
				{ -- 接到                                            --动作名 --seek时间 --是否无限重播
				        [GameApi.HashAString("00受伤弟子01")] 	= {"被击晕", 0, false},
				        [GameApi.HashAString("00受伤弟子02")] 	= {"被击晕", 0, false},
				        [GameApi.HashAString("00受伤弟子03")] 	= {"被击晕", 0, false},
				        [GameApi.HashAString("00受伤弟子04")] 	= {"被击晕", 0, false},
				        [GameApi.HashAString("00受伤弟子05")] 	= {"被击晕", 0, false},
				},
				{ -- 完成没交
				        [GameApi.HashAString("00受伤弟子01")] 	= {"被击晕", 0, false},
				        [GameApi.HashAString("00受伤弟子02")] 	= {"被击晕", 0, false},
				        [GameApi.HashAString("00受伤弟子03")] 	= {"被击晕", 0, false},
				        [GameApi.HashAString("00受伤弟子04")] 	= {"被击晕", 0, false},
				        [GameApi.HashAString("00受伤弟子05")] 	= {"被击晕", 0, false},
				},
				{ -- 交成功
					[GameApi.HashAString("00受伤弟子01")] 	= {"站立", 0, false},
				        [GameApi.HashAString("00受伤弟子02")] 	= {"站立", 0, false},
				        [GameApi.HashAString("00受伤弟子03")] 	= {"站立", 0, false},
				        [GameApi.HashAString("00受伤弟子04")] 	= {"站立", 0, false},
				        [GameApi.HashAString("00受伤弟子05")] 	= {"站立", 0, false},
				},
				{ -- 失败
				        [GameApi.HashAString("00受伤弟子01")] 	= {"被击晕", 0, false},
				        [GameApi.HashAString("00受伤弟子02")] 	= {"被击晕", 0, false},
				        [GameApi.HashAString("00受伤弟子03")] 	= {"被击晕", 0, false},
				        [GameApi.HashAString("00受伤弟子04")] 	= {"被击晕", 0, false},
				        [GameApi.HashAString("00受伤弟子05")] 	= {"被击晕", 0, false},
				},
			},			
		},
	},
        {
		TaskID = 6636,
		ScendID =
		{
			[90] = true, --遗言
		},
		NPCParam =
		{
			[77115] =
			{
				{ -- 接到                                            --动作名 --seek时间 --是否无限重播
				        [GameApi.HashAString("00新剧情西南支线阿罗")] 	= {"被击晕", 0, false},
				},
				{ -- 完成没交
				        [GameApi.HashAString("00新剧情西南支线阿罗")] 	= {"被击晕", 0, false},
				},
				{ -- 交成功
					[GameApi.HashAString("00新剧情西南支线阿罗")] 	= {"死亡", 0, false},
				},
				{ -- 失败
				        [GameApi.HashAString("00新剧情西南支线阿罗")] 	= {"被击晕", 0, false},
				},
			},			
		},
	},
        {
		TaskID = 6576,
		ScendID =
		{
			[77] = true, --垂死挣扎
		},
		NPCParam =
		{
			[76912] =
			{
				{ -- 接到                                            --动作名 --seek时间 --是否无限重播
				        [GameApi.HashAString("江湖奇遇-司徒闵")] 	= {"死亡", 0, false},
				},
				{ -- 完成没交
				        [GameApi.HashAString("江湖奇遇-司徒闵")] 	= {"死亡循环", 0, true},
				},
				{ -- 交成功
					[GameApi.HashAString("江湖奇遇-司徒闵")] 	= {"死亡循环", 0, true},
				},
				{ -- 失败
				        [GameApi.HashAString("江湖奇遇-司徒闵")] 	= {"被击晕", 0, true},
				},
			},			
		},
	},
	{
		TaskID = 6736,
		ScendID =
		{
			[75] = true, --奇遇不戒和尚2
		},
		NPCParam =
		{
			[77000] =
			{
				{ -- 接到                                            --动作名 --seek时间 --是否无限重播
				        [GameApi.HashAString("奇遇-不戒和尚")] 	= {"死亡循环", 0, true},
				},
				{ -- 完成没交
				        [GameApi.HashAString("奇遇-不戒和尚")] 	= {"跳起", 0, false,"落地", 0, false,"站立", 0, ture},
				},
				{ -- 交成功
					[GameApi.HashAString("奇遇-不戒和尚")] 	= {"站立", 0, true},
				},
				{ -- 失败
				        [GameApi.HashAString("奇遇-不戒和尚")] 	= {"死亡循环", 0, true},
				},
			},			
		},
	},
	{
		TaskID = 7294,
		ScendID =
		{
			[102] = true, --中邪士兵
		},
		NPCParam =
		{
			[78658] =
			{
				{ -- 接到                                            --动作名 --seek时间 --是否无限重播
				        [GameApi.HashAString("主线中邪士兵01")] 	= {"跪拜", 0, true},
				},
				{ -- 完成没交
				        [GameApi.HashAString("主线中邪士兵01")] 	= {"起身", 0, false,"站立", 0, ture},
				},
				{ -- 交成功
					[GameApi.HashAString("主线中邪士兵01")] 	= {"站立", 0, true},
				},
				{ -- 失败
				        [GameApi.HashAString("主线中邪士兵01")] 	= {"跪拜", 0, true},
				},
			},
			[78663] =
			{
				{ -- 接到                                            --动作名 --seek时间 --是否无限重播
				        [GameApi.HashAString("龙套虔诚秦兵03")] 	= {"跪拜", 0, true},
				},
				{ -- 完成没交
				        [GameApi.HashAString("龙套虔诚秦兵03")] 	= {"站立", 0, true},
				},
				{ -- 交成功
					[GameApi.HashAString("龙套虔诚秦兵03")] 	= {"站立", 0, true},
				},
				{ -- 失败
				        [GameApi.HashAString("龙套虔诚秦兵03")] 	= {"跪拜", 0, true},
				},
			},
			[81036] =
			{
				{ -- 接到                                            --动作名 --seek时间 --是否无限重播
				        [GameApi.HashAString("龙套虔诚村民06")] 	= {"跪拜", 0, true},
				},
				{ -- 完成没交
				        [GameApi.HashAString("龙套虔诚村民06")] 	= {"站立", 0, true},
				},
				{ -- 交成功
					[GameApi.HashAString("龙套虔诚村民06")] 	= {"站立", 0, true},
				},
				{ -- 失败
				        [GameApi.HashAString("龙套虔诚村民06")] 	= {"跪拜", 0, true},
				},
			},
		},
	},
	{
		TaskID = 6569,
		ScendID =
		{
			[82] = true, --左右互搏
		},
		NPCParam =
		{
			[77624] =
			{
				{ -- 接到                                            --动作名 --seek时间 --是否无限重播
				},
				{ -- 完成没交
				},
				{ -- 交成功
					[GameApi.HashAString("奇遇咬尸体鳄鱼1")] 	= {"死亡", 0, false},
                	[GameApi.HashAString("FixedNpc_1124")] 	= {"死亡", 0, false},
                	[GameApi.HashAString("FixedNpc_1120")] 	= {"死亡", 0, false},
                	[GameApi.HashAString("FixedNpc_1121")] 	= {"死亡", 0, false},
                	[GameApi.HashAString("FixedNpc_1121")] 	= {"死亡", 0, false},
                	[GameApi.HashAString("FixedNpc_1129")] 	= {"死亡", 0, false},
					[GameApi.HashAString("FixedNpc_1119")] 	= {"死亡", 0, false},
					[GameApi.HashAString("FixedNpc_1122")] 	= {"死亡", 0, false},
					[GameApi.HashAString("FixedNpc_1127")] 	= {"死亡", 0, false},
					[GameApi.HashAString("FixedNpc_1123")] 	= {"死亡", 0, false},
					[GameApi.HashAString("FixedNpc_1128")] 	= {"死亡", 0, false},
					[GameApi.HashAString("FixedNpc_1123")] 	= {"死亡", 0, false},
					[GameApi.HashAString("FixedNpc_1125")] 	= {"死亡", 0, false},
					[GameApi.HashAString("FixedNpc_1126")] 	= {"死亡", 0, false},
				},
				{ -- 失败
				},
			},			
		},
	},	
	
	{
		TaskID = 7250,
		ScendID =
		{
			[102] = true, --西安
		},
		NPCParam =
		{
			[78682] =
			{
				{ -- 接到                                            --动作名 --seek时间 --是否无限重播
				},
				{ -- 完成没交
					[GameApi.HashAString("支线-周氏")] 	= {"站立", 0, false},
				},
				{ -- 交成功
				},
				{ -- 失败
				},
			},		
		},
	},
	
	{
		TaskID = 7238,
		ScendID =
		{
			[102] = true, --西安
		},
		NPCParam =
		{
			[78673] =
			{
				{ -- 接到                                            --动作名 --seek时间 --是否无限重播
				},
				{ -- 完成没交
				},
				{ -- 交成功
					[GameApi.HashAString("支线-秦月")] 	= {"死亡循环", 0, true},				
				},
				{ -- 失败
				},
			},		
		},
	},	
	
        {
		TaskID = 7011,
		ScendID =
		{
			[101] = true, --重伤弟子
		},
		NPCParam =
		{
			[77651] =
			{
				{ -- 接到                                            --动作名 --seek时间 --是否无限重播
				        [GameApi.HashAString("00青城主线重伤弟子")] 	= {"死亡循环", 0, true},
				},
				{ -- 完成没交
				        [GameApi.HashAString("00青城主线重伤弟子")] 	= {"死亡循环", 0, true},
				},
				{ -- 交成功
					[GameApi.HashAString("00青城主线重伤弟子")] 	= {"死亡循环", 0, true},				
				},
				{ -- 失败
				        [GameApi.HashAString("00青城主线重伤弟子")] 	= {"死亡循环", 0, true},
				},
			},		
		},
	},		
        {
		TaskID = 7031,
		ScendID =
		{
			[101] = true, --自宫林平之
		},
		NPCParam =
		{
			[77666] =
			{
				{ -- 接到                                            --动作名 --seek时间 --是否无限重播
				        [GameApi.HashAString("NpcGenerator_21")] 	= {"瘫软", 0, true},
				},
				{ -- 完成没交
				        [GameApi.HashAString("NpcGenerator_21")] 	= {"瘫软", 0, true},
				},
				{ -- 交成功
					[GameApi.HashAString("NpcGenerator_21")] 	= {"瘫软", 0, true},				
				},
				{ -- 失败
				        [GameApi.HashAString("NpcGenerator_21")] 	= {"瘫软", 0, true},
				},
			},		
		},
	},		
        {
		TaskID = 7033,
		ScendID =
		{
			[101] = true, --自宫林平之2
		},
		NPCParam =
		{
			[77669] =
			{
				{ -- 接到                                            --动作名 --seek时间 --是否无限重播
				        [GameApi.HashAString("NpcGenerator_23")] 	= {"瘫软", 0, true},
				},
				{ -- 完成没交
				        [GameApi.HashAString("NpcGenerator_23")] 	= {"瘫软", 0, true},
				},
				{ -- 交成功
					[GameApi.HashAString("NpcGenerator_23")] 	= {"瘫软", 0, true},				
				},
				{ -- 失败
				        [GameApi.HashAString("NpcGenerator_23")] 	= {"瘫软", 0, true},
				},
			},		
		},
	},		
        {
		TaskID = 7037,
		ScendID =
		{
			[101] = true, --自宫林平之3
		},
		NPCParam =
		{
			[77669] =
			{
				{ -- 接到                                            --动作名 --seek时间 --是否无限重播
				        [GameApi.HashAString("NpcGenerator_23")] 	= {"瘫软", 0, true},
				},
				{ -- 完成没交
				        [GameApi.HashAString("NpcGenerator_23")] 	= {"瘫软", 0, true},
				},
				{ -- 交成功
					[GameApi.HashAString("NpcGenerator_23")] 	= {"站立", 0, true},				
				},
				{ -- 失败
				        [GameApi.HashAString("NpcGenerator_23")] 	= {"瘫软", 0, true},
				},
			},		
		},
	},		
        {
		TaskID = 7620,
		ScendID =
		{
			[77] = true, --无双惨死
		},
		NPCParam =
		{
			[80146] =
			{
				{ -- 接到                                            --动作名 --seek时间 --是否无限重播
				},
				{ -- 完成没交
				        [GameApi.HashAString("江湖绝学-天残脚-乞丐")] 	= {"被击晕", 0, false},
				},
				{ -- 交成功
				},
				{ -- 失败
				},
			},		
		        [80148] =
			{
				{ -- 接到                                            --动作名 --seek时间 --是否无限重播
				},
				{ -- 完成没交
				        [GameApi.HashAString("江湖绝学-天残脚-叶无双")] 	= {"死亡循环", 0, true},
				},
				{ -- 交成功
					[GameApi.HashAString("江湖绝学-天残脚-叶无双")] 	= {"死亡循环", 0, true},				
				},
				{ -- 失败
				},
			},	
		        [81026] =
			{
				{ -- 接到                                            --动作名 --seek时间 --是否无限重播
				},
				{ -- 完成没交
				        [GameApi.HashAString("江湖绝学-天残脚-莲丫头01")] 	= {"被击晕", 0, true},
				},
				{ -- 交成功
					[GameApi.HashAString("江湖绝学-天残脚-莲丫头01")] 	= {"被击晕", 0, true},				
				},
				{ -- 失败
				},
			},	
		},
	},		
        {
		TaskID = 7621,
		ScendID =
		{
			[77] = true, --乞丐惨死
		},
		NPCParam =
		{
			[80146] =
			{
				{ -- 接到                                            --动作名 --seek时间 --是否无限重播
				        [GameApi.HashAString("江湖绝学-天残脚-乞丐")] 	= {"死亡循环", 0, true},
				},
				{ -- 完成没交
				        [GameApi.HashAString("江湖绝学-天残脚-乞丐")] 	= {"死亡循环", 0, true},
				},
				{ -- 交成功
				        [GameApi.HashAString("江湖绝学-天残脚-乞丐")] 	= {"死亡循环", 0, true},
				},
				{ -- 失败
				        [GameApi.HashAString("江湖绝学-天残脚-乞丐")] 	= {"死亡循环", 0, true},
				},
			},		
	        },
	},
        {
		TaskID = 8981,
		ScendID =
		{
			[86] = true, --暗夜曲非烟
		},
		NPCParam =
		{
			[87586] =
			{
				{ -- 接到                                            --动作名 --seek时间 --是否无限重播
				        [GameApi.HashAString("暗夜任务001")] 	= {"死亡循环", 0, true},
				},
				{ -- 完成没交
				        [GameApi.HashAString("暗夜任务001")] 	= {"死亡循环", 0, true},
				},
				{ -- 交成功
				        [GameApi.HashAString("暗夜任务001")] 	= {"死亡循环", 0, false},
				},
				{ -- 失败
				        [GameApi.HashAString("暗夜任务001")] 	= {"死亡循环", 0, true},
				},
			},		
	        },
	},
        {
		TaskID = 8982,
		ScendID =
		{
			[86] = true, --暗夜蓝凤凰
		},
		NPCParam =
		{
			[87587] =
			{
				{ -- 接到                                            --动作名 --seek时间 --是否无限重播
				        [GameApi.HashAString("暗夜任务002")] 	= {"死亡循环", 0, true},
				},
				{ -- 完成没交
				        [GameApi.HashAString("暗夜任务002")] 	= {"死亡循环", 0, true},
				},
				{ -- 交成功
				        [GameApi.HashAString("暗夜任务002")] 	= {"死亡循环", 0, false},
				},
				{ -- 失败
				        [GameApi.HashAString("暗夜任务002")] 	= {"死亡循环", 0, true},
				},
			},		
	        },
	},
        {
		TaskID = 8983,
		ScendID =
		{
			[86] = true, --暗夜仪琳
		},
		NPCParam =
		{
			[87588] =
			{
				{ -- 接到                                            --动作名 --seek时间 --是否无限重播
				        [GameApi.HashAString("暗夜任务003")] 	= {"死亡循环", 0, true},
				},
				{ -- 完成没交
				        [GameApi.HashAString("暗夜任务003")] 	= {"死亡循环", 0, true},
				},
				{ -- 交成功
				        [GameApi.HashAString("暗夜任务003")] 	= {"死亡循环", 0, false},
				},
				{ -- 失败
				        [GameApi.HashAString("暗夜任务003")] 	= {"死亡循环", 0, true},
				},
			},		
	        },
	},
};
-- NPC参数初始化配置
NPCStyle.NPC_List =
{
	[26837] =
		{
			{7, }, 	--场景id列表
			{},	--副本id列表
		 	{ 	--默认参数
				[GameApi.HashAString("任务2011武当山黄云轩前")] 	= {"普通攻击3", 0, true},
			},
		 	{},	--任务参数（不用写，程序会根据NPCStyle.Config来填）
		},
	[26843] =
		{
			{7, }, 	--场景id列表
			{},	--副本id列表
		 	{ 	--默认参数
				[GameApi.HashAString("任务2011武当山对打npc1")] 	= {"技能攻击1", 0, true},
				[GameApi.HashAString("任务2011武当山对打npc2")] 	= {"技能攻击1", 0, true},
				[GameApi.HashAString("任务2011武当山对打npc3")] 	= {"技能攻击1", 0, true},
				[GameApi.HashAString("任务2011武当山对打npc4")] 	= {"技能攻击1", 0, true},
				[GameApi.HashAString("任务2011武当山对打npc5")] 	= {"技能攻击1", 0, true},
			},
		 	{},	--任务参数（不用写，程序会根据NPCStyle.Config来填）
		},
	[26840] =
		{
			{7, }, 	--场景id列表
			{},	--副本id列表
		 	{ 	--默认参数
				[GameApi.HashAString("任务2011武当山黄云轩后")] 	= {"休闲2", 0, true},
			},
		 	{},	--任务参数（不用写，程序会根据NPCStyle.Config来填）
		},
	[27548] =
		{
			{19, }, 	--场景id列表
			{},	--副本id列表
		 	{ 	--默认参数
				[GameApi.HashAString("主线任务青菱2")] 	= {"", 0, true},
			},
		 	{},	--任务参数（不用写，程序会根据NPCStyle.Config来填）
		},
	[27545] =
		{
			{19, }, 	--场景id列表
			{},	--副本id列表
		 	{ 	--默认参数
				[GameApi.HashAString("主线任务王老虎4")] 	= {"死亡循环", 0, true},
			},
		 	{},	--任务参数（不用写，程序会根据NPCStyle.Config来填）
		},
	[28030] =
		{
			{38, }, 	--场景id列表
			{},	--副本id列表
		 	{ 	--默认参数
				[GameApi.HashAString("五霸岗令狐冲")] 	= {"", 0, true},
			},
		 	{},	--任务参数（不用写，程序会根据NPCStyle.Config来填）
		},
	[28405] =
		{
			{22, }, 	--场景id列表
			{},	--副本id列表
		 	{ 	--默认参数
				[GameApi.HashAString("主线任务女鬼")] 	= {"休闲动作1", 0, true},
			},
		 	{},	--任务参数（不用写，程序会根据NPCStyle.Config来填）
		},
	[28811] =
		{
			{41, }, 	--场景id列表
			{},	--副本id列表
		 	{ 	--默认参数
				[GameApi.HashAString("2033杨莲亭2")] 	= {"休闲动作1", 0, true},
			},
		 	{},	--任务参数（不用写，程序会根据NPCStyle.Config来填）
		},
	[25521] =
		{
			{63, }, 	--场景id列表
			{},	--副本id列表
		 	{ 	--默认参数
				[GameApi.HashAString("东方剧情22下毒龙套投降教众3")] 		= {"休闲动作1", 0, true},
				[GameApi.HashAString("东方剧情22下毒龙套投降教众19")] 	= {"休闲动作1", 0, true},
				[GameApi.HashAString("东方剧情22下毒龙套投降教众20")] 	= {"休闲动作1", 0, true},
				[GameApi.HashAString("东方剧情22下毒龙套投降教众21")] 	= {"休闲动作1", 0, true},
				[GameApi.HashAString("东方剧情22下毒龙套投降教众18")] 	= {"休闲动作1", 0, true},
				[GameApi.HashAString("东方剧情22下毒龙套投降教众7")] 		= {"休闲动作1", 0, true},
				[GameApi.HashAString("东方剧情22下毒龙套投降教众6")] 		= {"休闲动作1", 0, true},
				[GameApi.HashAString("东方剧情22下毒龙套投降教众22")] 	= {"休闲动作1", 0, true},
			},
		 	{},	--任务参数（不用写，程序会根据NPCStyle.Config来填）
		},
	[25515] =
		{
			{63, }, 	--场景id列表
			{},	--副本id列表
		 	{ 	--默认参数
				[GameApi.HashAString("东方剧情22下毒龙套投降教众13")] 	= {"休闲动作1", 0, true},
				[GameApi.HashAString("东方剧情22下毒龙套投降教众10")] 	= {"休闲动作1", 0, true},
				[GameApi.HashAString("东方剧情22下毒龙套投降教众8")] 		= {"休闲动作1", 0, true},
				[GameApi.HashAString("东方剧情22下毒龙套投降教众12")] 	= {"休闲动作1", 0, true},
				[GameApi.HashAString("东方剧情22下毒龙套投降教众11")] 	= {"休闲动作1", 0, true},
				[GameApi.HashAString("东方剧情22下毒龙套投降教众9")] 		= {"休闲动作1", 0, true},
				[GameApi.HashAString("东方剧情22下毒龙套投降教众1")] 		= {"休闲动作1", 0, true},
			},
		 	{},	--任务参数（不用写，程序会根据NPCStyle.Config来填）
		},

	[25137] =
		{
			{61, }, 	--场景id列表
			{},	--副本id列表
		 	{ 	--默认参数
				[GameApi.HashAString("东方剧情06石鼓书院卫兵雪千寻")] 	= {"战斗站立", 0, true},
			},
		 	{},	--任务参数（不用写，程序会根据NPCStyle.Config来填）
		},

	[25518] =
		{
			{63, }, 	--场景id列表
			{},	--副本id列表
		 	{ 	--默认参数
				[GameApi.HashAString("东方剧情22下毒龙套投降教众14")] 	= {"休闲动作1", 0, true},
				[GameApi.HashAString("东方剧情22下毒龙套投降教众5")] 		= {"休闲动作1", 0, true},
				[GameApi.HashAString("东方剧情22下毒龙套投降教众4")] 		= {"休闲动作1", 0, true},
				[GameApi.HashAString("东方剧情22下毒龙套投降教众15")] 	= {"休闲动作1", 0, true},
				[GameApi.HashAString("东方剧情22下毒龙套投降教众16")] 	= {"休闲动作1", 0, true},
				[GameApi.HashAString("东方剧情22下毒龙套投降教众2")] 		= {"休闲动作1", 0, true},
				[GameApi.HashAString("东方剧情22下毒龙套投降教众17")] 	= {"休闲动作1", 0, true},
			},
		 	{},	--任务参数（不用写，程序会根据NPCStyle.Config来填）
		},
	[29301] =
		{
			{63, }, 	--场景id列表
			{},	--副本id列表
		 	{ 	--默认参数
				[GameApi.HashAString("东方剧情99黑木崖大战对打NPC01")] 	= {"战斗站立", 0, true},
				[GameApi.HashAString("东方剧情99黑木崖大战对打NPC02")] 	= {"战斗站立", 0, true},
				[GameApi.HashAString("东方剧情99黑木崖大战对打NPC03")] 	= {"战斗站立", 0, true},
				[GameApi.HashAString("东方剧情99黑木崖大战对打NPC04")] 	= {"战斗站立", 0, true},
			},
		 	{},	--任务参数（不用写，程序会根据NPCStyle.Config来填）
		},
	[25015] =
		{
			{63, }, 	--场景id列表
			{},	--副本id列表
		 	{ 	--默认参数
				[GameApi.HashAString("东方剧情20进攻总坛明教小BOSS")] 	= {"战斗站立", 0, true},
			},
		 	{},	--任务参数（不用写，程序会根据NPCStyle.Config来填）
		},
	[29509] =
		{
			{63, }, 	--场景id列表
			{},	--副本id列表
		 	{ 	--默认参数
				[GameApi.HashAString("东方剧情20进攻总坛明教求饶小BOSS")] 	= {"战斗站立", 0, true},
			},
		 	{},	--任务参数（不用写，程序会根据NPCStyle.Config来填）
		},
	[44151] =
		{
			{4, }, 	--场景id列表
			{},	--副本id列表
		 	{ 	--默认参数
				[GameApi.HashAString("野外关押林平之NPC")] 	= {"站立", 0, true},
			},
		 	{},	--任务参数（不用写，程序会根据NPCStyle.Config来填）
		},
	[35732] =
		{
			{4, }, 	--场景id列表
			{},	--副本id列表
		 	{ 	--默认参数
				[GameApi.HashAString("湖心亭令狐冲")] 	= {"死亡循环", 0, true},
			},
		 	{},	--任务参数（不用写，程序会根据NPCStyle.Config来填）
		},
	[55932] =
		{
			{71, }, --场景id列表
			{},	--副本id列表
		 	{ 	--默认参数
				[GameApi.HashAString("令狐冲皇陵外")] 	= {"受伤战斗站立", 0, true},
			},
		 	{},	--任务参数（不用写，程序会根据NPCStyle.Config来填）
		},
        [57362] =
		{
			{71, }, --场景id列表
			{},	--副本id列表
		 	{ 	--默认参数
				[GameApi.HashAString("松鼠")] 	= {"站立", 0, true},
			},
		 	{},	--任务参数（不用写，程序会根据NPCStyle.Config来填）
		},
	[56242] =
		{
			{77, }, --场景id列表
			{},	--副本id列表
		 	{ 	--默认参数
				[GameApi.HashAString("偷懒的嵩山弟子1")] 	= {"站立", 0, true},
				[GameApi.HashAString("偷懒的嵩山弟子2")] 	= {"站立", 0, true},
				[GameApi.HashAString("偷懒的嵩山弟子3")] 	= {"站立", 0, true},
				[GameApi.HashAString("偷懒的嵩山弟子4")] 	= {"站立", 0, true},
			},
		 	{},	--任务参数（不用写，程序会根据NPCStyle.Config来填）
		},
	[56167] =
		{
			{77, }, --场景id列表
			{},	--副本id列表
		 	{ 	--默认参数
				[GameApi.HashAString("偷懒的嵩山精英1")] 	= {"站立", 0, true},
			},
		 	{},	--任务参数（不用写，程序会根据NPCStyle.Config来填）
		},
	[58760] =
		{
			{75, }, --场景id列表
			{},	--副本id列表
		 	{ 	--默认参数
				[GameApi.HashAString("令狐冲")] 	= {"死亡循环", 0, true},
			},
		 	{},	--任务参数（不用写，程序会根据NPCStyle.Config来填）
		},
       [66276] =
		{
			{86, }, --场景id列表
			{},	--副本id列表
		 	{ 	--默认参数
				[GameApi.HashAString("受伤弟子01")] 	= {"站立", 0, true},
			        [GameApi.HashAString("受伤弟子02")] 	= {"站立", 0, true},
			        [GameApi.HashAString("受伤弟子03")] 	= {"站立", 0, true},
                                [GameApi.HashAString("受伤弟子04")] 	= {"站立", 0, true},
			        [GameApi.HashAString("受伤弟子05")] 	= {"站立", 0, true},
			},
		 	{},	--任务参数（不用写，程序会根据NPCStyle.Config来填）
		},
        [64824] =
		{
			{86, }, --场景id列表
			{},	--副本id列表
		 	{ 	--默认参数
				[GameApi.HashAString("灵蛇村民2")] 	= {"站立", 0, true},
			        [GameApi.HashAString("灵蛇村民3")] 	= {"站立", 0, true},
			        [GameApi.HashAString("灵蛇村民9")] 	= {"站立", 0, true},
                        },
		 	{},	--任务参数（不用写，程序会根据NPCStyle.Config来填）
		},
        [64821] =
		{
			{86, }, --场景id列表
			{},	--副本id列表
		 	{ 	--默认参数
				[GameApi.HashAString("灵蛇村民1")] 	= {"站立", 0, true},
			        [GameApi.HashAString("灵蛇村民6")] 	= {"站立", 0, true},
			        [GameApi.HashAString("灵蛇村民10")] 	= {"站立", 0, true},
                        },
		 	{},	--任务参数（不用写，程序会根据NPCStyle.Config来填）
		},
        [64818] =
		{
			{86, }, --场景id列表
			{},	--副本id列表
		 	{ 	--默认参数
				[GameApi.HashAString("灵蛇村民4")] 	= {"站立", 0, true},
			        [GameApi.HashAString("灵蛇村民7")] 	= {"站立", 0, true},
			        [GameApi.HashAString("灵蛇村民8")] 	= {"站立", 0, true},
			},
		 	{},	--任务参数（不用写，程序会根据NPCStyle.Config来填）
		},
        [35410] =
		{
			{73, }, --场景id列表
			{},	--副本id列表
		 	{ 	--默认参数
				[GameApi.HashAString("授谱前刘正风")] 	= {"受伤坐地", 0, true},
			},
		 	{},	--任务参数（不用写，程序会根据NPCStyle.Config来填）
		},
        [35413] =
		{
			{73, }, --场景id列表
			{},	--副本id列表
		 	{ 	--默认参数
				[GameApi.HashAString("授谱前曲洋")] 	= {"受伤坐地", 0, true},
			},
		 	{},	--任务参数（不用写，程序会根据NPCStyle.Config来填）
		},
	[64448] =
		{
			{84, }, 	--场景id列表
			{},	--副本id列表
		 	{ 	--默认参数
				[GameApi.HashAString("主线-洛星辰1")] 	= {"", 0, true},
			},
		 	{},	--任务参数（不用写，程序会根据NPCStyle.Config来填）
		},
        [59310] =
		{
			{79, }, 	--场景id列表
			{},	--副本id列表
		 	{ 	--默认参数
				[GameApi.HashAString("00新剧情桃实仙躺")] 	= {"死亡循环", 0, true},
			},
		 	{},	--任务参数（不用写，程序会根据NPCStyle.Config来填）
		},
        [59322] =
		{
			{79, }, 	--场景id列表
			{},	--副本id列表
		 	{ 	--默认参数
				[GameApi.HashAString("00新剧情宁中则")] 	= {"站立", 0, true},
			},
		 	{},	--任务参数（不用写，程序会根据NPCStyle.Config来填）
		},
        [67457] =
		{
			{79, }, 	--场景id列表
			{},	--副本id列表
		 	{ 	--默认参数
				[GameApi.HashAString("FixedNpc_1076")] 	        = {"站立", 0, true},
			        [GameApi.HashAString("FixedNpc_1077")] 	        = {"站立", 0, true},
			        [GameApi.HashAString("FixedNpc_1078")] 	        = {"站立", 0, true},
			        [GameApi.HashAString("FixedNpc_1079")] 	        = {"站立", 0, true},
			},
		 	{},	--任务参数（不用写，程序会根据NPCStyle.Config来填）
		},
        [59364] =
		{
			{79, }, 	--场景id列表
			{},	--副本id列表
		 	{ 	--默认参数
				[GameApi.HashAString("00新剧情令狐冲02")] 	        = {"被击晕", 0, true},
			},
		 	{},	--任务参数（不用写，程序会根据NPCStyle.Config来填）
		},
        [59355] =
		{
			{79, }, 	--场景id列表
			{},	--副本id列表
		 	{ 	--默认参数
				[GameApi.HashAString("00新剧情老头子")] 	        = {"战斗站立", 0, true},
			},
		 	{},	--任务参数（不用写，程序会根据NPCStyle.Config来填）
		},
        [59358] =
		{
			{79, }, 	--场景id列表
			{},	--副本id列表
		 	{ 	--默认参数
				[GameApi.HashAString("NpcGenerator_23")] 	        = {"休闲动作1", 0, true},
			},
		 	{},	--任务参数（不用写，程序会根据NPCStyle.Config来填）
		},
        [67699] =
		{
			{81, }, 	--五霸岗
			{},	--副本id列表
		 	{ 	--默认参数
				[GameApi.HashAString("草庐令狐冲")] 	        = {"受伤战斗站立", 0, true},
			},
		 	{},	--任务参数（不用写，程序会根据NPCStyle.Config来填）
		},
        [67723] =
		{
			{81, }, 	--五霸岗
			{},	--副本id列表
		 	{ 	--默认参数
				[GameApi.HashAString("草庐平一指")] 	        = {"站立", 0, true},
			},
		 	{},	--任务参数（不用写，程序会根据NPCStyle.Config来填）
		},
        [67702] =
		{
			{81, }, 	--五霸岗
			{},	--副本id列表
		 	{ 	--默认参数
				[GameApi.HashAString("五霸岗令狐冲")] 	        = {"受伤战斗站立", 0, true},
			},
		 	{},	--任务参数（不用写，程序会根据NPCStyle.Config来填）
		},
        [68686] =
		{
			{81, }, 	--五霸岗
			{},	--副本id列表
		 	{ 	--默认参数
				[GameApi.HashAString("五霸岗下令狐冲")] 	        = {"受伤战斗站立", 0, true},
			},
		 	{},	--任务参数（不用写，程序会根据NPCStyle.Config来填）
		},
        [67711] =
		{
			{81, }, 	--五霸岗
			{},	--副本id列表
		 	{ 	--默认参数
				[GameApi.HashAString("涧边令狐冲")] 	        = {"受伤战斗站立", 0, true},
			},
		 	{},	--任务参数（不用写，程序会根据NPCStyle.Config来填）
		},
        [67714] =
		{
			{81, }, 	--五霸岗
			{},	--副本id列表
		 	{ 	--默认参数
				[GameApi.HashAString("五霸寺令狐冲")] 	        = {"受伤战斗站立", 0, true},
			},
		 	{},	--任务参数（不用写，程序会根据NPCStyle.Config来填）
		},
        [67945] =
		{
			{81, }, 	--五霸岗
			{},	--副本id列表
		 	{ 	--默认参数
				[GameApi.HashAString("五霸寺觉月")] 	        = {"站立", 0, true},
			},
		 	{},	--任务参数（不用写，程序会根据NPCStyle.Config来填）
		},
        [67933] =
		{
			{81, }, 	--五霸岗
			{},	--副本id列表
		 	{ 	--默认参数
				[GameApi.HashAString("五霸寺易国梓")] 	        = {"站立", 0, true},
			},
		 	{},	--任务参数（不用写，程序会根据NPCStyle.Config来填）
		},
        [67927] =
		{
			{81, }, 	--五霸岗
			{},	--副本id列表
		 	{ 	--默认参数
				[GameApi.HashAString("五霸寺辛国梁")] 	        = {"站立", 0, true},
			},
		 	{},	--任务参数（不用写，程序会根据NPCStyle.Config来填）
		},
        [71464] =
		{
			{82, }, 	--余杭
			{},	--副本id列表
		 	{ 	--默认参数
				[GameApi.HashAString("NpcGenerator_113")] 	        = {"站立", 0, true},
			},
		 	{},	--任务参数（不用写，程序会根据NPCStyle.Config来填）
		},
        [71467] =
		{
			{82, }, 	--余杭
			{},	--副本id列表
		 	{ 	--默认参数
				[GameApi.HashAString("NpcGenerator_114")] 	        = {"站立", 0, true},
			},
		 	{},	--任务参数（不用写，程序会根据NPCStyle.Config来填）
		},
        [71913] =
		{
			{82, }, 	--余杭
			{},	--副本id列表
		 	{ 	--默认参数
				[GameApi.HashAString("NpcGenerator_119")] 	        = {"休闲动作1", 0, true},
			},
		 	{},	--任务参数（不用写，程序会根据NPCStyle.Config来填）
		},
        [62070] =
		{
			{80, }, 	--仙愁峡
			{},	--副本id列表
		 	{ 	--默认参数
				[GameApi.HashAString("剧情-向问天2")] 	        = {"休闲动作2", 0, true},
			},
		 	{},	--任务参数（不用写，程序会根据NPCStyle.Config来填）
		},
        [62082] =
		{
			{80, }, 	--仙愁峡
			{},	--副本id列表
		 	{ 	--默认参数
				[GameApi.HashAString("剧情-中毒的路人")] 	        = {"休闲动作1", 0, true},
			},
		 	{},	--任务参数（不用写，程序会根据NPCStyle.Config来填）
		},
        [73750] =
		{
			{85, }, 	--情杀
			{},	--副本id列表
		 	{ 	--默认参数
				[GameApi.HashAString("00新剧情三仙聂牛")] 	        = {"站立", 0, true},
			},
		 	{},	--任务参数（不用写，程序会根据NPCStyle.Config来填）
		},
        [61707] =
		{
			{1051, }, 	--红尘客栈
			{},	--副本id列表
		 	{ 	--默认参数
				[GameApi.HashAString("201211福州令狐冲笑傲客栈")] 	        = {"站立", 0, true},
			},
		 	{},	--任务参数（不用写，程序会根据NPCStyle.Config来填）
		},
        [77115] =
		{
			{90, }, 	--遗言
			{},	--副本id列表
		 	{ 	--默认参数
				[GameApi.HashAString("00新剧情西南支线阿罗")] 	        = {"被击晕", 0, true},
			},
		 	{},	--任务参数（不用写，程序会根据NPCStyle.Config来填）
		},
        [76912] =
		{
			{77, }, 	--挣扎
			{},	--副本id列表
		 	{ 	--默认参数
				[GameApi.HashAString("江湖奇遇-司徒闵")] 	        = {"被击晕", 0, true},
			},
		 	{},	--任务参数（不用写，程序会根据NPCStyle.Config来填）
		},
        [77000] =
		{
			{75, }, 	--洛阳不戒
			{},	--副本id列表
		 	{ 	--默认参数
				[GameApi.HashAString("奇遇-不戒和尚")] 	        = {"死亡循环", 0, true},
			},
		 	{},	--任务参数（不用写，程序会根据NPCStyle.Config来填）
		},
        [78660] =
		{
			{102, }, 	--临死村民
			{},	--副本id列表
		 	{ 	--默认参数
				[GameApi.HashAString("主线临死村民")] 	        = {"死亡循环", 0, true},
			},
		 	{},	--任务参数（不用写，程序会根据NPCStyle.Config来填）
		},
	[78658] =
		{
			{102, }, 	--中邪士兵
			{},	--副本id列表
		 	{ 	--默认参数
				[GameApi.HashAString("主线中邪士兵01")] 	        = {"跪拜", 0, true},
			},
		 	{},	--任务参数（不用写，程序会根据NPCStyle.Config来填）
		},
        [81036] =
		{
			{102, }, 	--虔诚村民
			{},	--副本id列表
		 	{ 	--默认参数
				[GameApi.HashAString("龙套虔诚村民06")] 	        = {"跪拜", 0, true},
			},
		 	{},	--任务参数（不用写，程序会根据NPCStyle.Config来填）
		},
        [78663] =
		{
			{102, }, 	--虔诚秦兵
			{},	--副本id列表
		 	{ 	--默认参数
				[GameApi.HashAString("龙套虔诚秦兵03")] 	        = {"跪拜", 0, true},
			},
		 	{},	--任务参数（不用写，程序会根据NPCStyle.Config来填）
		},
        [77624] =
		{
			{82, }, 	--左右互搏
			{},	--副本id列表
		 	{ 	--默认参数
					[GameApi.HashAString("奇遇咬尸体鳄鱼1")] 	= {"普通攻击3", 0, true},
                	[GameApi.HashAString("FixedNpc_1124")] 	= {"普通攻击3", 0, true},
                	[GameApi.HashAString("FixedNpc_1120")] 	= {"普通攻击3", 0, true},
                	[GameApi.HashAString("FixedNpc_1121")] 	= {"普通攻击3", 0, true},
                	[GameApi.HashAString("FixedNpc_1121")] 	= {"普通攻击3", 0, true},
                	[GameApi.HashAString("FixedNpc_1129")] 	= {"普通攻击3", 0, true},
					[GameApi.HashAString("FixedNpc_1119")] 	= {"普通攻击3", 0, true},
					[GameApi.HashAString("FixedNpc_1122")] 	= {"普通攻击3", 0, true},
					[GameApi.HashAString("FixedNpc_1127")] 	= {"普通攻击3", 0, true},
					[GameApi.HashAString("FixedNpc_1123")] 	= {"普通攻击3", 0, true},
					[GameApi.HashAString("FixedNpc_1128")] 	= {"普通攻击3", 0, true},
					[GameApi.HashAString("FixedNpc_1123")] 	= {"普通攻击3", 0, true},
					[GameApi.HashAString("FixedNpc_1125")] 	= {"普通攻击3", 0, true},
					[GameApi.HashAString("FixedNpc_1126")] 	= {"普通攻击3", 0, true},
			},
		 	{},	--任务参数（不用写，程序会根据NPCStyle.Config来填）
		},
		[78682] =
		{
			{102, }, 	--场景id列表
			{},	--副本id列表
		 	{ 	--默认参数
				[GameApi.HashAString("支线-周氏")] 	= {"被缚跪倒", 0, true},
			},
		 	{},	--任务参数（不用写，程序会根据NPCStyle.Config来填）
		},
		[78673] =
		{
			{102, }, 	--场景id列表
			{},	--副本id列表
		 	{ 	--默认参数
				[GameApi.HashAString("支线-秦月")] 	= {"站立", 0, true},
			},
		 	{},	--任务参数（不用写，程序会根据NPCStyle.Config来填）
		},		
                [77651] =
		{
			{101, }, 	--场景id列表
			{},	--副本id列表
		 	{ 	--默认参数
				[GameApi.HashAString("00青城主线重伤弟子")] 	= {"死亡循环", 0, true},
			},
		 	{},	--任务参数（不用写，程序会根据NPCStyle.Config来填）
		},				
                [77666] =
		{
			{101, }, 	--场景id列表
			{},	--副本id列表
		 	{ 	--默认参数
				[GameApi.HashAString("NpcGenerator_21")] 	= {"瘫软", 0, true},
			},
		 	{},	--任务参数（不用写，程序会根据NPCStyle.Config来填）
		},
                [77669] =
		{
			{101, }, 	--场景id列表
			{},	--副本id列表
		 	{ 	--默认参数
				[GameApi.HashAString("NpcGenerator_23")] 	= {"瘫软", 0, true},
			},
		 	{},	--任务参数（不用写，程序会根据NPCStyle.Config来填）
		},
                [81026] =
		{
			{77, }, 	--场景id列表
			{},	--副本id列表
		 	{ 	--默认参数
				[GameApi.HashAString("江湖绝学-天残脚-莲丫头01")] 	= {"被击晕", 0, true},
			},
		 	{},	--任务参数（不用写，程序会根据NPCStyle.Config来填）
		},
                [80148] =
		{
			{77, }, 	--场景id列表
			{},	--副本id列表
		 	{ 	--默认参数
				[GameApi.HashAString("江湖绝学-天残脚-叶无双")] 	= {"死亡循环", 0, true},
			},
		 	{},	--任务参数（不用写，程序会根据NPCStyle.Config来填）
		},
                [80146] =
		{
			{77, }, 	--场景id列表
			{},	--副本id列表
		 	{ 	--默认参数
				[GameApi.HashAString("江湖绝学-天残脚-乞丐")] 	= {"被击晕", 0, false},
			},
		 	{},	--任务参数（不用写，程序会根据NPCStyle.Config来填）
		},
                [77672] =
		{
			{101, }, 	--场景id列表
			{},	--副本id列表
		 	{ 	--默认参数
				[GameApi.HashAString("NpcGenerator_29")] 	= {"邪魅一笑", 0, true},
			},
		 	{},	--任务参数（不用写，程序会根据NPCStyle.Config来填）
		},
                [77675] =
		{
			{101, }, 	--场景id列表
			{},	--副本id列表
		 	{ 	--默认参数
				[GameApi.HashAString("NpcGenerator_5")] 	= {"邪魅一笑", 0, true},
			},
		 	{},	--任务参数（不用写，程序会根据NPCStyle.Config来填）
		},
                [77678] =
		{
			{101, }, 	--场景id列表
			{},	--副本id列表
		 	{ 	--默认参数
				[GameApi.HashAString("NpcGenerator_35")] 	= {"邪魅一笑", 0, true},
			},
		 	{},	--任务参数（不用写，程序会根据NPCStyle.Config来填）
		},
                [77681] =
		{
			{101, }, 	--场景id列表
			{},	--副本id列表
		 	{ 	--默认参数
				[GameApi.HashAString("a")] 	= {"邪魅一笑", 0, true},
			},
		 	{},	--任务参数（不用写，程序会根据NPCStyle.Config来填）
		},
		[87586] =
		{
			{86, }, 	--合成剧情01
			{},	--副本id列表
		 	{ 	--默认参数
				[GameApi.HashAString("暗夜任务001")] 	= {"死亡循环", 0, true},
			},
		 	{},	--任务参数（不用写，程序会根据NPCStyle.Config来填）
		},
                [87587] =
		{
			{86, }, 	--合成剧情02
			{},	--副本id列表
		 	{ 	--默认参数
				[GameApi.HashAString("暗夜任务002")] 	= {"死亡循环", 0, true},
			},
		 	{},	--任务参数（不用写，程序会根据NPCStyle.Config来填）
		},
                [87588] =
		{
			{86, }, 	--合成剧情03
			{},	--副本id列表
		 	{ 	--默认参数
				[GameApi.HashAString("暗夜任务003")] 	= {"死亡循环", 0, true},
			},
		 	{},	--任务参数（不用写，程序会根据NPCStyle.Config来填）
		},
}
function NPCStyle:GetParamForAllNPC()
	local npclist = NPCStyle.NPC_List

	for npcid, v in pairs(npclist) do
		for k1, v1 in pairs(NPCStyle.Config) do
			if v1 and v1.TaskID and v1.NPCParam then
				local npcTab = v1.NPCParam[npcid]
				v[4][v1.TaskID] = npcTab
			end
		end
	end

	return npclist
end

--------------------------------------------------------
------------------------ 函数 --------------------------
--------------------------------------------------------

SSEvent =
{
	SSEVENT_INIT_TASK		= 1, --任务数据生成
	SSEVENT_ACCETP_TASK		= 2, --接到任务
	SSEVENT_CANFNSH_TASK		= 3, --任务达成还没交
	SSEVENT_FINISHED_TASK		= 4, --交了任务（成功或失败）
	SSEVENT_GIVEUP_TASK		= 5, --放弃任务
	SSEVENT_TASK_FINISHCOUNT	= 6, --更新任务完成次数
};

NPCStyle.LastStyle = {idTask = 0, taskState = 0}

function NPCStyle:ChangeNPCStyle(idTask, taskState)
	local bCall = true
	if taskState == NPCStyle.TaskState.CANFINISH then
		-- CanFinish会每隔一段时间调用一次，屏蔽一下
		if NPCStyle.LastStyle.idTask == idTask and NPCStyle.LastStyle.taskState == taskState then
			bCall = false
		end
	end

	if bCall == true then
		GameApi.ChangeNPCStyle(idTask, taskState)
		NPCStyle.LastStyle.idTask = idTask
		NPCStyle.LastStyle.taskState  = taskState

		local strDbg = string.format("NPCStyle:ChangeNPCStyle: %d, State: %d\n", idTask, taskState)
		LogPrint(strDbg)
	end
end

function NPCStyle:DealWorldSceneID(v, idWorld, idScene)
	local bDeal = (idWorld == 0 or (v.WorldID == nil or v.WorldID[idWorld] == true))
				and (v.ScendID == nil or v.ScendID[idScene] == true)
	return bDeal
end

NPCStyle.TaskConfigIndex =
{
	--NPCStyle.Config里配置的Task的索引，方便查找。
	--在InitTask时动态生成。
};
