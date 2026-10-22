SceneStyle.TaskState =
{
	INVALID		= -1,	--	无此任务

	NONE		= 0,	--	此任务的完成数为0
	ACCEPT 		= 1,	--	接到
	CANFINISH 	= 2, 	--	完成没交
	FINISHED	= 3,	--	交成功
	FAIL		= 4,	--	失败
};

-- 场景参数随任务变化配置
SceneStyle.Config = 
{
	--	不能按任务id存为map，因为任务有先后顺序
	{
		TaskID = 3794,
		ScendID = 
		{
			[67] = true,
			[68] = true,
		},
		NPCParam = 
		{
			[35949] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
		SceneGfxParam = 
		{
			[123456] = {true, false, false, true},
		},
	},
	{
		TaskID = 3772,
		ScendID = 
		{
			[67] = true,
		},
		NPCParam = 
		{
			[67969] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[67971] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[67970] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[68292] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 3773,
		ScendID = 
		{
			[67] = true,
		},
		NPCParam = 
		{
			[44130] = {
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[35326] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[44133] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[44314] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[44317] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[44320] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[44323] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[44326] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[44329] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[44332] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[66860] = { 
				[-1] = {false, true, true, false, 0, 0, "", -114.536, 81.9712, -24.5525, "", 0, 0, 0, 0},
			},
			[66861] = { 
				[-1] = {false, true, true, false, 0, 0, "", -123.821, 82.4637, -24.3139, "", 0, 0, 0, 0},
			},
			[66862] = { 
				[-1] = {false, true, true, false, 0, 0, "", -129.816, 82.6067, -24.5796, "", 0, 0, 0, 0},
			},
			[66863] = { 
				[-1] = {false, true, true, false, 0, 0, "", -131.621, 82.6036, -17.9418, "", 0, 0, 0, 0},
			},
			[66864] = { 
				[-1] = {false, true, true, false, 0, 0, "", -132.824, 82.6036, -20.6149, "", 0, 0, 0, 0},
			},
			[66865] = { 
				[-1] = {false, true, true, false, 0, 0, "", -127.069, 82.4648, -27.057, "", 0, 0, 0, 0},
			},
			[67972] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
		DecalMapParam = 
		{
			["decal_liuzhengfeng"] = {false, false, true, false},
		},
		SceneGfxParam = 
		{
			[1073744119] = {true, true, true, false},
		},
		SceneModelParam = 
		{
			[1073743983] = {false, true, true, false},
		},
	},
	{
		TaskID = 5568,
		ScendID = 
		{
			[67] = true,
		},
		NPCParam = 
		{
			[35326] = { 
				[-1] = {false, false, false, true, 66876, 0, "0", 0, 0, 0, "0", 0, 0, 0, 0},
			},
			[66876] = { 
				[-1] = {true, false, false, false, 37953, 0, "0", 0, 0, 0, "0", 0, 0, 0, 0},
			},
			[44136] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[44139] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[44142] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[44145] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 4062,
		ScendID = 
		{
			[67] = true,
		},
		NPCParam = 
		{
			[37953] = { 
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[71834] = { 
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 4063,
		ScendID = 
		{
			[67] = true,
		},
		NPCParam = 
		{
			[71834] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 3776,
		ScendID = 
		{
			[67] = true,
		},
		NPCParam = 
		{
			[37529] = {
				[-1] = {true, false, false, true, 0, 0, "", 149.954, 119.845, -32.888, "移动_通用", 147.437, 120.929, -36.2088, 0}
			},
		},
	},
	{
		TaskID = 4062,
		ScendID = 
		{
			[67] = true,
		},
		NPCParam = 
		{
			[37535] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[35329] = {
				[-1] = {false, false, false, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[37544] = {
				[-1] = {true, true, true, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 3856,
		ScendID = 
		{
			[67] = true,
		},
		NPCParam = 
		{
			[35335] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[44145] = { 
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 69.736, 102.868, 100.389, 0},
			},
		},
	},
	{
		TaskID = 5572,
		ScendID = 
		{
			[67] = true,
		},
		NPCParam = 
		{
			[35344] = { 
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 5573,
		ScendID = 
		{
			[67] = true,
		},
		NPCParam = 
		{
			[35344] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 5574,
		ScendID = 
		{
			[67] = true,
		},
		NPCParam = 
		{
			[71837] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 3783,
		ScendID = 
		{
			[67] = true,
		},
		NPCParam = 
		{
			[35353] = { 
				[-1] = {false, true, true, false, 0, 0, "", 7.54094, 116.631, 183.859, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 3784,
		ScendID = 
		{
			[67] = true,
		},
		NPCParam = 
		{
			[35711] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[35353] = {
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[66866] = { 
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[35398] = { 
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[71837] = { 
				[-1] = {false, true, true, false, 0, 0, "", -2, 116, 164, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 5818,
		SceneGfxParam = 
		{
			[1073747161] = {false, true, true, false},
		},
	},
	{
		TaskID = 5819,
		ScendID = 
		{
			[4] = true,
		},
		NPCParam = 
		{
			[68303] = { 
				[-1] = {true, false, false, true, 68302, GameApi.HashAString("石像"), "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[68302] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[68301] = { 
				[-1] = {false, true, true, false, 0, 0, "行走", -44.9383, 39.6417, -65.6658, "", 0, 0, 0, 0},
			},
			[67954] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 5820,
		ScendID = 
		{
			[4] = true,
		},
		NPCParam = 
		{
			[68304] = { 
				[-1] = {true, false, false, true, 68302, GameApi.HashAString("石像"), "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[68302] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[68301] = { 
				[-1] = {false, true, true, false, 0, 0, "行走", -44.9383, 39.6417, -65.6658, "", 0, 0, 0, 0},
			},
			[67954] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 5578,
		ScendID = 
		{
			[4] = true,
		},
		NPCParam = 
		{
			[67955] = { 
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[67961] = { 
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 3806,
		ScendID = 
		{
			[4] = true,
		},
		NPCParam = 
		{
			[35714] = { 
				[-1] = {true, true, true, true, 0, 0, "", 25493, 0, 0, "", 0, 0, 0, 0},
			},
			[66871] = { 
				[-1] = {false, false, false, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[67958] = { 
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[67959] = { 
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[67961] = { 
				[-1] = {false, false, false, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
		SceneGfxParam = 
		{
			[1073747026] = {false, false, true, false},
			[1073747027] = {false, false, true, false},
		},
	},
	{
		TaskID = 5584,
		ScendID = 
		{
			[4] = true,
		},
		NPCParam = 
		{
			[35714] = { 
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 24893, 0, 0, 0},
			},
			[35377] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 3815,
		ScendID = 
		{
			[4] = true,
		},
		NPCParam = 
		{
			[66874] = { 
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 8.12, 30.8955, -16.1629, 0},
			},
			[35377] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "奔跑", 24892, 0, 0, 0},
			},
			[36487] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 3965,
		ScendID = 
		{
			[4] = true,
		},
		NPCParam = 
		{
			[44151] = {
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[35392] = {
				[-1] = {false, false, true, false, 0, 0, "落地", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 5585,
		ScendID = 
		{
			[4] = true,
		},
		NPCParam = 
		{
			[67957] = { 
				[-1] = {true, true, true, false, 0, 0, "", 24894, 0, 0, "", 0, 0, 0, 0},
			},
			[35392] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 24891, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 3969,
		ScendID = 
		{
			[4] = true,
		},
		NPCParam = 
		{
			[67957] = { 
				[-1] = {false, false, false, true, 36484, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[36484] = { 
				[-1] = {true, false, false, false, 36481, GameApi.HashAString("林平之安全"), "0", 0, 0, 0, "0", 0, 0, 0, 0},
			},
			[36481] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[36487] = { 
				[-1] = {false, false, false, true, 36490, 0, "非战斗站立_通用", 0, 0, 0, "0", 0, 0, 0, 0},
			},
			[36490] = { 
				[-1] = {true, false, false, false, 35720, GameApi.HashAString("曲非烟村口"), "0", 0, 0, 0, "0", 0, 0, 0, 0},
			},
			[35720] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 4075,
		ScendID = 
		{
			[4] = true,
		},
		NPCParam = 
		{
			[35720] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[36481] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[37941] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[37956] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[72275] = { 
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 4077,
		ScendID = 
		{
			[4] = true,
		},
		SceneGfxParam = 
		{
			[1073747018] = {false, true, true, false},
			[1073747019] = {false, true, true, false},
			[1073747021] = {false, true, true, false},
			[1073747020] = {false, true, true, false},
		},
	},
	{
		TaskID = 4078,
		ScendID = 
		{
			[4] = true,
		},
		NPCParam = 
		{
			[72275] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[72278] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 3828,
		ScendID = 
		{
			[4] = true,
			[67] = true,
		},
		NPCParam = 
		{
			[37947] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "战斗奔跑", 0, 0, 0, 0}
			},
			[35395] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[37941] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[37956] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[35347] = { 
				[-1] = {true, true, true, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[72278] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 3831,
		ScendID = 
		{
			[67] = true,
		},
		NPCParam = 
		{
			[35347] = { 
				[-1] = {true, true, true, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[10448] = {
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16686] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[16707] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[16692] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[16385] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[66867] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[66869] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[16358] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[36683] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[9479] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[14747] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[12142] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[16701] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[16695] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[16704] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[66870] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[66866] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[16689] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[66868] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[16695] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[16701] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[16698] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[67089] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[67069] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[67072] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[37956] = { 
				[-1] = {false, false, false, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[37941] = { 
				[-1] = {false, false, false, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[67953] = { 
				[-1] = {false, false, false, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[67963] = { 
				[-1] = {false, false, false, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[67964] = { 
				[-1] = {false, false, false, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[67965] = { 
				[-1] = {false, false, false, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[67966] = { 
				[-1] = {false, false, false, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[67967] = { 
				[-1] = {false, false, false, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[67968] = { 
				[-1] = {false, false, false, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
		SceneGfxParam = 
		{
			[1073744018] = {false, true, true, false},
			[1073744019] = {false, true, true, false},
			[1073744020] = {false, true, true, false},
			[1073744021] = {false, true, true, false},
			[1073744022] = {false, true, true, false},
			[1073744023] = {false, true, true, false},
			[1073744024] = {false, true, true, false},
			[1073744025] = {false, true, true, false},
			[1073744026] = {false, true, true, false},
			[1073744027] = {false, true, true, false},
		},
	},
	{
		TaskID = 3835,
		ScendID = 
		{
			[73] = true,
			[67] = true,
			[4] = true,
		},
		NPCParam = 
		{
			[44108] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[44114] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[35410] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[35413] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[35861] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[44111] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[44117] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[35416] = { 
				[-1] = {true, true, true, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[35861] = {
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[36692] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[36695] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[36698] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[35410] = { 
				[-1] = {true, true, true, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[35413] = { 
				[-1] = {true, true, true, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[44108] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[44114] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[70872] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
		SceneGfxParam = 
		{
			[1073742693] = {true, true, true, true},
		},
	},
	{
		TaskID = 3841,
		ScendID = 
		{
			[67] = true,
		},
		NPCParam = 
		{
			[35425] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[36909] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[35419] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[66879] = { 
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[66878] = { 
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[44111] = { 
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "行走", 24, 46, 36, 0},
			},
		},
	},
	{
		TaskID = 3842,
		ScendID = 
		{
			[4] = true,
			[73] = true,
			[67] = true,
		},
		NPCParam = 
		{
			[36842] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "行走", 86.4799, 46.9669, 185.986, 0}
			},
			[44117] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "行走", 23, 46, 36, 0}
			},
			[70872] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[44133] = { 
				[-1] = {false, false, false, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[44317] = { 
				[-1] = {false, false, false, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[44314] = { 
				[-1] = {false, false, false, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[44320] = { 
				[-1] = {false, false, false, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[44323] = { 
				[-1] = {false, false, false, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[44332] = { 
				[-1] = {false, false, false, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[44329] = { 
				[-1] = {false, false, false, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[35416] = { 
				[-1] = {false, false, false, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
		DecalMapParam = 
		{
			["decal_liuzhengfeng"] = {false, false, false, false},
		},
		SceneGfxParam = 
		{
			[1073744119] = {false, false, false, false},
			[1073742693] = {false, false, false, false},
		},
	},
	{
		TaskID = 465,
		ScendID = 
		{
			[7] = true,
		},
		NPCParam = 
		{
			[26843] = {
				[-1] = {true, false, false, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 470,
		ScendID = 
		{
			[7] = true,
		},
		NPCParam = 
		{
			[32918] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[32921] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[32894] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[32897] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[32900] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 521,
		ScendID = 
		{
			[13] = true,
		},
		NPCParam = 
		{
			[27089] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 568,
		ScendID = 
		{
			[17] = true,
		},
		NPCParam = 
		{
			[5423] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[28833] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 588,
		ScendID = 
		{
			[16] = true,
		},
		NPCParam = 
		{
			[5667] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[28038] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 595,
		ScendID = 
		{
			[7] = true,
		},
		NPCParam = 
		{
			[26840] = {
				[-1] = {false, false, false, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 644,
		ScendID = 
		{
			[20] = true,
		},
		NPCParam = 
		{
			[6930] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[28484] = {
				[-1] = {true, false, false, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[28475] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[3903] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[9832] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[9835] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[28487] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 647,
		ScendID = 
		{
			[20] = true,
		},
		NPCParam = 
		{
			[6936] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[28478] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[6933] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[28481] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 661,
		ScendID = 
		{
			[19] = true,
		},
		NPCParam = 
		{
			[6964] = {
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 709,
		ScendID = 
		{
			[22] = true,
		},
		NPCParam = 
		{
			[28405] = {
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 732,
		ScendID = 
		{
			[21] = true,
		},
		NPCParam = 
		{
			[27432] = {
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[27508] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 733,
		ScendID = 
		{
			[21] = true,
		},
		NPCParam = 
		{
			[27435] = {
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[27511] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 734,
		ScendID = 
		{
			[21] = true,
		},
		NPCParam = 
		{
			[27438] = {
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[27514] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 737,
		ScendID = 
		{
			[21] = true,
		},
		NPCParam = 
		{
			[8485] = {
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[8488] = {
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[8491] = {
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[27432] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[27435] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[27438] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 982,
		ScendID = 
		{
			[32] = true,
		},
		NPCParam = 
		{
			[10423] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[10426] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 983,
		ScendID = 
		{
			[32] = true,
		},
		NPCParam = 
		{
			[10420] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[10423] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 988,
		ScendID = 
		{
			[25] = true,
		},
		NPCParam = 
		{
			[28772] = {
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[10746] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 999,
		ScendID = 
		{
			[32] = true,
		},
		NPCParam = 
		{
			[10420] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[10426] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 1449,
		ScendID = 
		{
			[2] = true,
		},
		SceneParam = 
		{
			[SceneStyle.TaskState.NONE] = {Main = "福威镖局", Sub = "", },
			[SceneStyle.TaskState.CANFINISH] = {Main = "福威镖局", Sub = "着火中", },
			[SceneStyle.TaskState.FINISHED] = {Main = "福威镖局", Sub = "着火中", },
			[SceneStyle.TaskState.ACCEPT] = {Main = "福威镖局", Sub = "着火前", },
			[SceneStyle.TaskState.FAIL] = {Main = "福威镖局", Sub = "着火前", },
		},
		DecalMapParam = 
		{
			["decal_blood"] = {false, true, true, false},
		},
	},
	{
		TaskID = 1450,
		ScendID = 
		{
			[2] = true,
		},
		NPCParam = 
		{
			[3262] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16662] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 1451,
		ScendID = 
		{
			[3] = true,
		},
		NPCParam = 
		{
			[14830] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16634] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 1452,
		ScendID = 
		{
			[3] = true,
		},
		NPCParam = 
		{
			[16649] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16637] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[14827] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[14824] = {
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16652] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 1455,
		ScendID = 
		{
			[3] = true,
		},
		NPCParam = 
		{
			[16640] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[14833] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[14827] = {
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16652] = {
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16637] = {
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 1456,
		ScendID = 
		{
			[3] = true,
		},
		NPCParam = 
		{
			[16640] = {
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[14836] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[14833] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16643] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16655] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 1458,
		ScendID = 
		{
			[3] = true,
		},
		SceneParam = 
		{
			[SceneStyle.TaskState.NONE] = {Main = "梅关古道山寨", Sub = "", },
			[SceneStyle.TaskState.CANFINISH] = {Main = "梅关古道山寨", Sub = "损毁中", },
			[SceneStyle.TaskState.FINISHED] = {Main = "梅关古道山寨", Sub = "损毁中", },
			[SceneStyle.TaskState.ACCEPT] = {Main = "梅关古道山寨", Sub = "损毁前", },
			[SceneStyle.TaskState.FAIL] = {Main = "梅关古道山寨", Sub = "损毁前", },
		},
	},
	{
		TaskID = 1460,
		ScendID = 
		{
			[3] = true,
		},
		NPCParam = 
		{
			[16646] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[14839] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[14836] = {
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16643] = {
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16658] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16655] = {
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
		SceneParam = 
		{
			[SceneStyle.TaskState.NONE] = {Main = "梅关古道山寨", Sub = "", },
			[SceneStyle.TaskState.CANFINISH] = {Main = "梅关古道山寨", Sub = "损毁中", },
			[SceneStyle.TaskState.FINISHED] = {Main = "梅关古道山寨", Sub = "损毁后", },
			[SceneStyle.TaskState.ACCEPT] = {Main = "梅关古道山寨", Sub = "损毁中", },
			[SceneStyle.TaskState.FAIL] = {Main = "梅关古道山寨", Sub = "损毁中", },
		},
	},
	{
		TaskID = 1461,
		ScendID = 
		{
			[2] = true,
			[3] = true,
		},
		NPCParam = 
		{
			[16646] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16337] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[14839] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16658] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16343] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[3259] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[3268] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16340] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[3271] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[3277] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[3265] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[3283] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[3280] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
		SceneParam = 
		{
			[SceneStyle.TaskState.NONE] = {Main = "福威镖局", Sub = "", },
			[SceneStyle.TaskState.CANFINISH] = {Main = "福威镖局", Sub = "着火中", },
			[SceneStyle.TaskState.FINISHED] = {Main = "福威镖局", Sub = "着火后", },
			[SceneStyle.TaskState.ACCEPT] = {Main = "福威镖局", Sub = "着火中", },
			[SceneStyle.TaskState.FAIL] = {Main = "福威镖局", Sub = "着火中", },
		},
	},
	{
		TaskID = 1482,
		ScendID = 
		{
			[9005] = true,
		},
		NPCParam = 
		{
			[26953] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16358] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[14675] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16352] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16349] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[26959] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16355] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[4576] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 1484,
		ScendID = 
		{
			[9005] = true,
			[4] = true,
		},
		NPCParam = 
		{
			[26953] = {true, true, false,true },
			[14681] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 1490,
		ScendID = 
		{
			[11] = true,
		},
		NPCParam = 
		{
			[4606] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[4310] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[4609] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[4612] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 1492,
		ScendID = 
		{
			[10] = true,
		},
		NPCParam = 
		{
			[14702] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[14708] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 1494,
		ScendID = 
		{
			[10] = true,
		},
		NPCParam = 
		{
			[16367] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16373] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[14815] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[14696] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[14699] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[14708] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[3777] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16370] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[14812] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[3774] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[14711] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16376] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16361] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 1496,
		ScendID = 
		{
			[10] = true,
		},
		NPCParam = 
		{
			[14714] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[14711] = {
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 1499,
		ScendID = 
		{
			[10] = true,
			[11] = true,
		},
		NPCParam = 
		{
			[14815] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16373] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16409] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16394] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16025] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16382] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16367] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16397] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[14717] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16376] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16361] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16385] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[14812] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16370] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16388] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16379] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16391] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16400] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[14714] = {
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[14699] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 1501,
		ScendID = 
		{
			[11] = true,
			[10] = true,
		},
		NPCParam = 
		{
			[16409] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16394] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16025] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[3774] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16397] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[14717] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16400] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16385] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16403] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16388] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16379] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16406] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16391] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16382] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
		DecalMapParam = 
		{
			["decal_swordtrace4"] = {false, true, true, false},
			["decal_swordtrace2"] = {false, true, true, false},
			["decal_swordtrace"] = {false, true, true, false},
		},
	},
	{
		TaskID = 1501,
		ScendID = 
		{
			[11] = true,
			[10] = true,
		},
		NPCParam = 
		{
			[4606] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16409] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16394] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16025] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[3774] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16397] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[14717] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16400] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16385] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[4612] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[4310] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16403] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16388] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[3777] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[4609] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16379] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16406] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16391] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16382] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
		DecalMapParam = 
		{
			["decal_swordtrace4"] = {false, true, true, false},
			["decal_swordtrace2"] = {false, true, true, false},
			["decal_swordtrace"] = {false, true, true, false},
		},
	},
	{
		TaskID = 1512,
		ScendID = 
		{
			[13] = true,
		},
		NPCParam = 
		{
			[14723] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16457] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16460] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16430] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16493] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16478] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16463] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16448] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16496] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16481] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[14720] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16451] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16499] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16472] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16469] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16454] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16466] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 1513,
		ScendID = 
		{
			[13] = true,
		},
		NPCParam = 
		{
			[16433] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[14723] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[14726] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 1514,
		ScendID = 
		{
			[13] = true,
		},
		NPCParam = 
		{
			[16436] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[14726] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16427] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[14729] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 1515,
		ScendID = 
		{
			[13] = true,
		},
		NPCParam = 
		{
			[16439] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[14732] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[14729] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16442] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16427] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 1516,
		ScendID = 
		{
			[13] = true,
		},
		NPCParam = 
		{
			[16445] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[14732] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[14735] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 1517,
		ScendID = 
		{
			[13] = true,
			[16] = true,
		},
		NPCParam = 
		{
			[16520] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16523] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16526] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16529] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16532] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16535] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16538] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16541] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16544] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16499] = {
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16496] = {
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16547] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16493] = {
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16481] = {
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16550] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[14735] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16478] = {
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16553] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16472] = {
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16469] = {
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16556] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16466] = {
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16463] = {
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16559] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16460] = {
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16457] = {
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16562] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[14741] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16454] = {
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16565] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16451] = {
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16448] = {
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16568] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[14744] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16445] = {
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16508] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16442] = {
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16439] = {
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16511] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16436] = {
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16433] = {
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16514] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16430] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16580] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16517] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16577] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16574] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16571] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 1519,
		ScendID = 
		{
			[16] = true,
		},
		NPCParam = 
		{
			[16532] = {
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16517] = {
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16580] = {
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16565] = {
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16550] = {
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16535] = {
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16520] = {
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16568] = {
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16553] = {
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16538] = {
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16523] = {
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[14741] = {
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16571] = {
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16556] = {
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16541] = {
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16526] = {
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16511] = {
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[14821] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16574] = {
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16559] = {
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16544] = {
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16529] = {
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[14744] = {
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16514] = {
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16577] = {
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16562] = {
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16547] = {
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16508] = {
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
		DecalMapParam = 
		{
			["decal_swordtrace3"] = {false, true, true, false},
			["decal_swordtrace5"] = {false, true, true, false},
		},
	},
	{
		TaskID = 1623,
		ScendID = 
		{
			[55] = true,
		},
		NPCParam = 
		{
			[19331] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[14869] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16418] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[14875] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[14860] = {
				[-1] = {true, true, true, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16415] = {
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[14848] = {
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[14851] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16412] = {
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16421] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[14857] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16424] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[14866] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[14863] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[14845] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 1629,
		ScendID = 
		{
			[55] = true,
		},
		NPCParam = 
		{
			[16418] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16424] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16421] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 1630,
		ScendID = 
		{
			[55] = true,
		},
		NPCParam = 
		{
			[14869] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[14872] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 1632,
		ScendID = 
		{
			[55] = true,
		},
		NPCParam = 
		{
			[14863] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[14860] = {
				[-1] = {true, true, true, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[14857] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[14875] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[19331] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[14872] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[14866] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[14851] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 1644,
		ScendID = 
		{
			[2] = true,
			[3] = true,
		},
		NPCParam = 
		{
			[16662] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16649] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[14830] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[14824] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16634] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 1867,
		ScendID = 
		{
			[2] = true,
			[3] = true,
		},
		NPCParam = 
		{
			[16646] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16337] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[14839] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16658] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16343] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[3259] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[3268] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16340] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[3271] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[3277] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[3265] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[3283] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[3280] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
		SceneParam = 
		{
			[SceneStyle.TaskState.NONE] = {Main = "福威镖局", Sub = "", },
			[SceneStyle.TaskState.CANFINISH] = {Main = "福威镖局", Sub = "着火中", },
			[SceneStyle.TaskState.FINISHED] = {Main = "福威镖局", Sub = "着火后", },
			[SceneStyle.TaskState.ACCEPT] = {Main = "福威镖局", Sub = "着火中", },
			[SceneStyle.TaskState.FAIL] = {Main = "福威镖局", Sub = "着火中", },
		},
	},
	{
		TaskID = 1868,
		ScendID = 
		{
			[2] = true,
			[3] = true,
		},
		NPCParam = 
		{
			[16646] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16337] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[14839] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16658] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16343] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[3259] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[3268] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16340] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[3271] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[3277] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[3265] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[3283] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[3280] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
		SceneParam = 
		{
			[SceneStyle.TaskState.NONE] = {Main = "福威镖局", Sub = "", },
			[SceneStyle.TaskState.CANFINISH] = {Main = "福威镖局", Sub = "着火中", },
			[SceneStyle.TaskState.FINISHED] = {Main = "福威镖局", Sub = "着火后", },
			[SceneStyle.TaskState.ACCEPT] = {Main = "福威镖局", Sub = "着火中", },
			[SceneStyle.TaskState.FAIL] = {Main = "福威镖局", Sub = "着火中", },
		},
	},
	{
		TaskID = 1869,
		ScendID = 
		{
			[2] = true,
			[3] = true,
		},
		NPCParam = 
		{
			[16646] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16337] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[14839] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16658] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16343] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[3259] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[3268] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16340] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[3271] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[3277] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[3265] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[3283] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[3280] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
		SceneParam = 
		{
			[SceneStyle.TaskState.NONE] = {Main = "福威镖局", Sub = "", },
			[SceneStyle.TaskState.CANFINISH] = {Main = "福威镖局", Sub = "着火中", },
			[SceneStyle.TaskState.FINISHED] = {Main = "福威镖局", Sub = "着火后", },
			[SceneStyle.TaskState.ACCEPT] = {Main = "福威镖局", Sub = "着火中", },
			[SceneStyle.TaskState.FAIL] = {Main = "福威镖局", Sub = "着火中", },
		},
	},
	{
		TaskID = 1870,
		ScendID = 
		{
			[2] = true,
			[3] = true,
		},
		NPCParam = 
		{
			[16646] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16337] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[14839] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16658] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16343] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[3259] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[3268] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16340] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[3271] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[3277] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[3265] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[3283] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[3280] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
		SceneParam = 
		{
			[SceneStyle.TaskState.NONE] = {Main = "福威镖局", Sub = "", },
			[SceneStyle.TaskState.CANFINISH] = {Main = "福威镖局", Sub = "着火中", },
			[SceneStyle.TaskState.FINISHED] = {Main = "福威镖局", Sub = "着火后", },
			[SceneStyle.TaskState.ACCEPT] = {Main = "福威镖局", Sub = "着火中", },
			[SceneStyle.TaskState.FAIL] = {Main = "福威镖局", Sub = "着火中", },
		},
	},
	{
		TaskID = 1871,
		ScendID = 
		{
			[2] = true,
			[3] = true,
		},
		NPCParam = 
		{
			[16646] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16337] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[14839] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16658] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16343] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[3259] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[3268] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16340] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[3271] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[3277] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[3265] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[3283] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[3280] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
		SceneParam = 
		{
			[SceneStyle.TaskState.NONE] = {Main = "福威镖局", Sub = "", },
			[SceneStyle.TaskState.CANFINISH] = {Main = "福威镖局", Sub = "着火中", },
			[SceneStyle.TaskState.FINISHED] = {Main = "福威镖局", Sub = "着火后", },
			[SceneStyle.TaskState.ACCEPT] = {Main = "福威镖局", Sub = "着火中", },
			[SceneStyle.TaskState.FAIL] = {Main = "福威镖局", Sub = "着火中", },
		},
	},
	{
		TaskID = 1872,
		ScendID = 
		{
			[2] = true,
			[3] = true,
		},
		NPCParam = 
		{
			[16646] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16337] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[14839] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16658] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16343] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[3259] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[3268] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16340] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[3271] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[3277] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[3265] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[3283] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[3280] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
		SceneParam = 
		{
			[SceneStyle.TaskState.NONE] = {Main = "福威镖局", Sub = "", },
			[SceneStyle.TaskState.CANFINISH] = {Main = "福威镖局", Sub = "着火中", },
			[SceneStyle.TaskState.FINISHED] = {Main = "福威镖局", Sub = "着火后", },
			[SceneStyle.TaskState.ACCEPT] = {Main = "福威镖局", Sub = "着火中", },
			[SceneStyle.TaskState.FAIL] = {Main = "福威镖局", Sub = "着火中", },
		},
	},
	{
		TaskID = 1873,
		ScendID = 
		{
			[2] = true,
			[3] = true,
		},
		NPCParam = 
		{
			[16646] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16337] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[14839] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16658] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16343] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[3259] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[3268] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16340] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[3271] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[3277] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[3265] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[3283] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[3280] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
		SceneParam = 
		{
			[SceneStyle.TaskState.NONE] = {Main = "福威镖局", Sub = "", },
			[SceneStyle.TaskState.CANFINISH] = {Main = "福威镖局", Sub = "着火中", },
			[SceneStyle.TaskState.FINISHED] = {Main = "福威镖局", Sub = "着火后", },
			[SceneStyle.TaskState.ACCEPT] = {Main = "福威镖局", Sub = "着火中", },
			[SceneStyle.TaskState.FAIL] = {Main = "福威镖局", Sub = "着火中", },
		},
	},
	{
		TaskID = 1874,
		ScendID = 
		{
			[2] = true,
			[3] = true,
		},
		NPCParam = 
		{
			[16646] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16337] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[14839] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16658] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16343] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[3259] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[3268] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16340] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[3271] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[3277] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[3265] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[3283] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[3280] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
		SceneParam = 
		{
			[SceneStyle.TaskState.NONE] = {Main = "福威镖局", Sub = "", },
			[SceneStyle.TaskState.CANFINISH] = {Main = "福威镖局", Sub = "着火中", },
			[SceneStyle.TaskState.FINISHED] = {Main = "福威镖局", Sub = "着火后", },
			[SceneStyle.TaskState.ACCEPT] = {Main = "福威镖局", Sub = "着火中", },
			[SceneStyle.TaskState.FAIL] = {Main = "福威镖局", Sub = "着火中", },
		},
	},
	{
		TaskID = 1875,
		ScendID = 
		{
			[2] = true,
			[3] = true,
		},
		NPCParam = 
		{
			[16646] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16337] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[14839] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16658] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16343] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[3259] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[3268] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16340] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[3271] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[3277] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[3265] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[3283] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[3280] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
		SceneParam = 
		{
			[SceneStyle.TaskState.NONE] = {Main = "福威镖局", Sub = "", },
			[SceneStyle.TaskState.CANFINISH] = {Main = "福威镖局", Sub = "着火中", },
			[SceneStyle.TaskState.FINISHED] = {Main = "福威镖局", Sub = "着火后", },
			[SceneStyle.TaskState.ACCEPT] = {Main = "福威镖局", Sub = "着火中", },
			[SceneStyle.TaskState.FAIL] = {Main = "福威镖局", Sub = "着火中", },
		},
	},
	{
		TaskID = 2084,
		ScendID = 
		{
			[29] = true,
		},
		NPCParam = 
		{
			[21895] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[22234] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 2085,
		ScendID = 
		{
			[29] = true,
		},
		NPCParam = 
		{
			[22128] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[22051] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[22130] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[21898] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[22131] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[22054] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[22132] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[22148] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[21916] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[21901] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[22134] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[22057] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[22135] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[22136] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[21904] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[22137] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[22138] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[22201] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[22202] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[22203] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[22200] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[21913] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[22234] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 2089,
		ScendID = 
		{
			[29] = true,
		},
		NPCParam = 
		{
			[22235] = {
				[-1] = {true, true, true, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 2096,
		ScendID = 
		{
			[30] = true,
		},
		NPCParam = 
		{
			[21982] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[21985] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 2098,
		ScendID = 
		{
			[30] = true,
		},
		NPCParam = 
		{
			[21985] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[21988] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 2102,
		ScendID = 
		{
			[30] = true,
		},
		NPCParam = 
		{
			[21991] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 2103,
		ScendID = 
		{
			[30] = true,
		},
		NPCParam = 
		{
			[21991] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[21997] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 2104,
		ScendID = 
		{
			[30] = true,
		},
		NPCParam = 
		{
			[21997] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[22000] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[22003] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 2108,
		ScendID = 
		{
			[30] = true,
		},
		NPCParam = 
		{
			[22024] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[22027] = {
				[-1] = {true, false, false, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[22030] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 2111,
		ScendID = 
		{
			[30] = true,
		},
		NPCParam = 
		{
			[21988] = {
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 2112,
		ScendID = 
		{
			[30] = true,
		},
		NPCParam = 
		{
			[27491] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[22045] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[27494] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[22048] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[22042] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[27485] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[27488] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[27479] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[27482] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[27476] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 2114,
		ScendID = 
		{
			[29] = true,
		},
		NPCParam = 
		{
			[22130] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[23067] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[22138] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[23061] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 2114,
		ScendID = 
		{
			[29] = true,
		},
		NPCParam = 
		{
			[27621] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[27624] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 2116,
		ScendID = 
		{
			[29] = true,
		},
		NPCParam = 
		{
			[27621] = {
				[-1] = {true, false, false, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[27624] = {
				[-1] = {true, false, false, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 2122,
		ScendID = 
		{
			[19] = true,
		},
		NPCParam = 
		{
			[22415] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 2127,
		ScendID = 
		{
			[19] = true,
		},
		NPCParam = 
		{
			[22379] = {
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[22382] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[21952] = {
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[21955] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 2128,
		ScendID = 
		{
			[19] = true,
		},
		NPCParam = 
		{
			[21979] = {
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[21961] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[21943] = {
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[21928] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[21946] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[21925] = {
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[21919] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[23013] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[21937] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[21934] = {
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 2129,
		ScendID = 
		{
			[19] = true,
		},
		NPCParam = 
		{
			[21919] = {
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[21961] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[21928] = {
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[21922] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[21949] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[21940] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[21931] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[23013] = {
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[21937] = {
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[21946] = {
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
		SceneParam = 
		{
			[SceneStyle.TaskState.NONE] = {Main = "新手村", Sub = "", },
			[SceneStyle.TaskState.CANFINISH] = {Main = "新手村", Sub = "着火中", },
			[SceneStyle.TaskState.FINISHED] = {Main = "新手村", Sub = "着火中", },
			[SceneStyle.TaskState.ACCEPT] = {Main = "新手村", Sub = "", },
			[SceneStyle.TaskState.FAIL] = {Main = "新手村", Sub = "", },
		},
	},
	{
		TaskID = 2131,
		ScendID = 
		{
			[19] = true,
		},
		NPCParam = 
		{
			[21976] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[21973] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[21967] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[21970] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 2132,
		ScendID = 
		{
			[19] = true,
		},
		NPCParam = 
		{
			[21973] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[22415] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[21976] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[21970] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[21967] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 2152,
		ScendID = 
		{
			[28] = true,
		},
		NPCParam = 
		{
			[22974] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[23002] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[23016] = {
				[-1] = {true, true, false, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 2155,
		ScendID = 
		{
			[8] = true,
		},
		NPCParam = 
		{
			[22986] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 2156,
		ScendID = 
		{
			[8] = true,
		},
		NPCParam = 
		{
			[22986] = {
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 2156,
		ScendID = 
		{
			[8] = true,
		},
		NPCParam = 
		{
			[22986] = {
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 2392,
		ScendID = 
		{
			[56] = true,
		},
		NPCParam = 
		{
			[23383] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[26031] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 2437,
		ScendID = 
		{
			[9] = true,
			[8] = true,
		},
		NPCParam = 
		{
			[24608] = {
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[24614] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 2439,
		ScendID = 
		{
			[9] = true,
		},
		NPCParam = 
		{
			[24614] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[24620] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 2441,
		ScendID = 
		{
			[9] = true,
		},
		NPCParam = 
		{
			[24626] = {
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[24650] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[24647] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[24629] = {
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 2442,
		ScendID = 
		{
			[9] = true,
		},
		NPCParam = 
		{
			[24632] = {
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[24653] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 2443,
		ScendID = 
		{
			[9] = true,
		},
		NPCParam = 
		{
			[24635] = {
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[24656] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 2444,
		ScendID = 
		{
			[9] = true,
		},
		NPCParam = 
		{
			[24638] = {
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[24659] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[24644] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 2447,
		ScendID = 
		{
			[9] = true,
		},
		NPCParam = 
		{
			[24659] = {
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[24671] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[24668] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[24644] = {
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 2554,
		ScendID = 
		{
			[34] = true,
		},
		NPCParam = 
		{
			[24930] = {
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[24924] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[24918] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[24933] = {
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[24960] = {
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[27652] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 2556,
		ScendID = 
		{
			[34] = true,
		},
		NPCParam = 
		{
			[24924] = {
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[24927] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 2560,
		ScendID = 
		{
			[34] = true,
		},
		NPCParam = 
		{
			[24936] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[24942] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 2570,
		ScendID = 
		{
			[61] = true,
		},
		NPCParam = 
		{
			[25089] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 2573,
		ScendID = 
		{
			[61] = true,
		},
		NPCParam = 
		{
			[25104] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 2574,
		ScendID = 
		{
			[61] = true,
		},
		NPCParam = 
		{
			[25104] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25122] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25119] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 2575,
		ScendID = 
		{
			[61] = true,
		},
		NPCParam = 
		{
			[25125] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25128] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 2578,
		ScendID = 
		{
			[61] = true,
		},
		NPCParam = 
		{
			[25131] = {
				[-1] = {true, false, false, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25125] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25119] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25134] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25128] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25122] = {
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25000] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 2579,
		ScendID = 
		{
			[61] = true,
		},
		NPCParam = 
		{
			[25137] = {
				[-1] = {true, false, false, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[26153] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25000] = {
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25134] = {
				[-1] = {false, false, true, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25149] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25152] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 2580,
		ScendID = 
		{
			[61] = true,
			[62] = true,
		},
		NPCParam = 
		{
			[25152] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25182] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25134] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25149] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25002] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[28920] = {
				[-1] = {true, true, true, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 2581,
		ScendID = 
		{
			[62] = true,
		},
		NPCParam = 
		{
			[25185] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25191] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25188] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 2582,
		ScendID = 
		{
			[62] = true,
		},
		NPCParam = 
		{
			[25200] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25197] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25194] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25182] = {
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25191] = {
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25002] = {
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[26144] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25203] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25188] = {
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25185] = {
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 2583,
		ScendID = 
		{
			[62] = true,
		},
		NPCParam = 
		{
			[25230] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25197] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25248] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25194] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25003] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25245] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25236] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25242] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25239] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25233] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25203] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25200] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 2584,
		ScendID = 
		{
			[62] = true,
		},
		NPCParam = 
		{
			[25004] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 2585,
		ScendID = 
		{
			[62] = true,
		},
		NPCParam = 
		{
			[25004] = {
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25230] = {
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25245] = {
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25233] = {
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25248] = {
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 2586,
		ScendID = 
		{
			[62] = true,
		},
		NPCParam = 
		{
			[25007] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25293] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25299] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 2588,
		ScendID = 
		{
			[62] = true,
		},
		NPCParam = 
		{
			[25299] = {
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[27023] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
		SceneParam = 
		{
			[SceneStyle.TaskState.NONE] = {Main = "出手烧桥", Sub = "", },
			[SceneStyle.TaskState.CANFINISH] = {Main = "出手烧桥", Sub = "着火中", },
			[SceneStyle.TaskState.FINISHED] = {Main = "出手烧桥", Sub = "着火中", },
			[SceneStyle.TaskState.ACCEPT] = {Main = "出手烧桥", Sub = "着火前", },
			[SceneStyle.TaskState.FAIL] = {Main = "出手烧桥", Sub = "着火前", },
		},
	},
	{
		TaskID = 2589,
		ScendID = 
		{
			[62] = true,
		},
		NPCParam = 
		{
			[25308] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25311] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
		SceneParam = 
		{
			[SceneStyle.TaskState.NONE] = {Main = "出手烧桥", Sub = "", },
			[SceneStyle.TaskState.CANFINISH] = {Main = "出手烧桥", Sub = "着火后", },
			[SceneStyle.TaskState.FINISHED] = {Main = "出手烧桥", Sub = "着火后", },
			[SceneStyle.TaskState.ACCEPT] = {Main = "出手烧桥", Sub = "着火中", },
			[SceneStyle.TaskState.FAIL] = {Main = "出手烧桥", Sub = "着火中", },
		},
	},
	{
		TaskID = 2590,
		ScendID = 
		{
			[62] = true,
		},
		NPCParam = 
		{
			[25311] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25320] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 2591,
		ScendID = 
		{
			[62] = true,
		},
		NPCParam = 
		{
			[25308] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25320] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25329] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25009] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25010] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25326] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 2592,
		ScendID = 
		{
			[62] = true,
			[63] = true,
		},
		NPCParam = 
		{
			[25326] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25008] = {
				[-1] = {true, false, false, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25332] = {
				[-1] = {false, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25368] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25365] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25371] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[29292] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 2593,
		ScendID = 
		{
			[62] = true,
		},
		NPCParam = 
		{
			[25368] = {
				[-1] = {true, true, false, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25365] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25332] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25371] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25326] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25009] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25010] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[29292] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 2595,
		ScendID = 
		{
			[63] = true,
		},
		NPCParam = 
		{
			[25365] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25368] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[27014] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[27008] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[27011] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[27017] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 2596,
		ScendID = 
		{
			[63] = true,
		},
		NPCParam = 
		{
			[25365] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25392] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25389] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25371] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25398] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25395] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25368] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25386] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25383] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 2597,
		ScendID = 
		{
			[63] = true,
		},
		NPCParam = 
		{
			[25428] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25431] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25434] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[26147] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25425] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25422] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25419] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[27008] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[27011] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25383] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25386] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 2600,
		ScendID = 
		{
			[63] = true,
		},
		NPCParam = 
		{
			[25455] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25422] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[26150] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25419] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25461] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25425] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25389] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25392] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25395] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25398] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 2601,
		ScendID = 
		{
			[63] = true,
		},
		NPCParam = 
		{
			[25455] = {
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25458] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25428] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25431] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25434] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[26147] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25012] = {
				[-1] = {true, true, true, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25011] = {
				[-1] = {true, true, true, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 2602,
		ScendID = 
		{
			[63] = true,
		},
		NPCParam = 
		{
			[29325] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[29304] = {
				[-1] = {true, false, false, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[26338] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[26335] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[26339] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25458] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 2603,
		ScendID = 
		{
			[63] = true,
		},
		NPCParam = 
		{
			[25479] = {
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25494] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[29301] = {
				[-1] = {true, true, true, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 2604,
		ScendID = 
		{
			[63] = true,
		},
		NPCParam = 
		{
			[25491] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25011] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25461] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25012] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25524] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25014] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25527] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25512] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25482] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25018] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[26150] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25515] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25485] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25518] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25488] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25019] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25017] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25521] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25016] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25530] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[27024] = {
				[-1] = {true, true, true, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[29509] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[29301] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25015] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 2606,
		ScendID = 
		{
			[63] = true,
		},
		NPCParam = 
		{
			[25016] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25530] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25551] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25527] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25548] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25545] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25524] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25018] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25542] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25536] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25539] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25019] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25533] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25494] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25017] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25554] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[27024] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 2607,
		ScendID = 
		{
			[63] = true,
		},
	},
	{
		TaskID = 2608,
		ScendID = 
		{
			[63] = true,
		},
		NPCParam = 
		{
			[25557] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 2609,
		ScendID = 
		{
			[63] = true,
		},
		NPCParam = 
		{
			[25557] = {
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 2611,
		ScendID = 
		{
			[49] = true,
		},
		NPCParam = 
		{
			[25568] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25574] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 2619,
		ScendID = 
		{
			[49] = true,
		},
		NPCParam = 
		{
			[25586] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25592] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 2625,
		ScendID = 
		{
			[49] = true,
		},
		NPCParam = 
		{
			[25610] = {
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25616] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 2668,
		ScendID = 
		{
			[1015] = true,
		},
		NPCParam = 
		{
			[25811] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[14533] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25814] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 2669,
		ScendID = 
		{
			[1015] = true,
		},
		NPCParam = 
		{
			[25826] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25823] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25820] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25844] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25817] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25841] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25838] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25829] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25835] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[14533] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25832] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 2670,
		ScendID = 
		{
			[1015] = true,
		},
		NPCParam = 
		{
			[25859] = {
				[-1] = {true, true, true, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25853] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25847] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25862] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[14533] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25850] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25856] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 2671,
		ScendID = 
		{
			[1015] = true,
		},
		NPCParam = 
		{
			[14533] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25865] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 2672,
		ScendID = 
		{
			[1015] = true,
		},
		NPCParam = 
		{
			[14533] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25868] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 2673,
		ScendID = 
		{
			[1015] = true,
		},
		NPCParam = 
		{
			[14533] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0,0,0, 0}
			},
			[25871] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 2674,
		ScendID = 
		{
			[1015] = true,
		},
		NPCParam = 
		{
			[14533] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25874] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 2675,
		ScendID = 
		{
			[1015] = true,
		},
		NPCParam = 
		{
			[14533] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25877] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 2676,
		ScendID = 
		{
			[1015] = true,
		},
		NPCParam = 
		{
			[14533] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25880] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 2677,
		ScendID = 
		{
			[1015] = true,
		},
		NPCParam = 
		{
			[14533] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25883] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 2678,
		ScendID = 
		{
			[1015] = true,
		},
		NPCParam = 
		{
			[14533] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25886] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 2679,
		ScendID = 
		{
			[1015] = true,
		},
		NPCParam = 
		{
			[14533] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25889] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 2680,
		ScendID = 
		{
			[1015] = true,
		},
		NPCParam = 
		{
			[14533] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25892] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 2681,
		ScendID = 
		{
			[1015] = true,
		},
		NPCParam = 
		{
			[14533] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25895] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 2682,
		ScendID = 
		{
			[1015] = true,
		},
		NPCParam = 
		{
			[25898] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[14533] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25901] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 2683,
		ScendID = 
		{
			[1015] = true,
		},
		NPCParam = 
		{
			[25904] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[14533] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25907] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 2722,
		ScendID = 
		{
			[44] = true,
		},
		NPCParam = 
		{
			[26058] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[27640] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 2728,
		ScendID = 
		{
			[44] = true,
		},
		NPCParam = 
		{
			[26067] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[27649] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 2801,
		ScendID = 
		{
			[7] = true,
		},
		NPCParam = 
		{
			[26837] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[26840] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 2808,
		ScendID = 
		{
			[2003] = true,
		},
		NPCParam = 
		{
			[22794] = {
				[-1] = {false, false, true, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[34333] = {
				[-1] = {true, true, false, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 2831,
		ScendID = 
		{
			[3] = true,
		},
		NPCParam = 
		{
			[32865] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[32868] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[32835] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[32823] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[32826] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[3519] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 2845,
		ScendID = 
		{
			[13] = true,
		},
		NPCParam = 
		{
			[13763] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 2846,
		ScendID = 
		{
			[13] = true,
		},
		NPCParam = 
		{
			[13763] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 2943,
		ScendID = 
		{
			[19] = true,
		},
		NPCParam = 
		{
			[6973] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[6961] = {
				[-1] = {false, false, false, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[27548] = {
				[-1] = {true, true, true, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[27542] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 2945,
		ScendID = 
		{
			[19] = true,
		},
		NPCParam = 
		{
			[27542] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[27545] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 2948,
		ScendID = 
		{
			[19] = true,
		},
		NPCParam = 
		{
			[27548] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[27545] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 2949,
		ScendID = 
		{
			[39] = true,
		},
		NPCParam = 
		{
			[27533] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[27536] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 2950,
		ScendID = 
		{
			[39] = true,
		},
		NPCParam = 
		{
			[27521] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[27524] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 2951,
		ScendID = 
		{
			[39] = true,
		},
		NPCParam = 
		{
			[27527] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[27530] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 2958,
		ScendID = 
		{
			[38] = true,
		},
		NPCParam = 
		{
			[28030] = {
				[-1] = {true, true, true, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 3021,
		ScendID = 
		{
			[38] = true,
		},
		NPCParam = 
		{
			[8500] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[28018] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 3027,
		ScendID = 
		{
			[38] = true,
		},
		NPCParam = 
		{
			[28021] = {
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[28024] = {
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[28041] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[28044] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 3033,
		ScendID = 
		{
			[25] = true,
		},
		NPCParam = 
		{
			[28772] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[10746] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 3034,
		ScendID = 
		{
			[22] = true,
		},
		NPCParam = 
		{
			[28405] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 3035,
		ScendID = 
		{
			[22] = true,
		},
		NPCParam = 
		{
			[8536] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 3038,
		ScendID = 
		{
			[20] = true,
		},
		NPCParam = 
		{
			[28472] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 3040,
		ScendID = 
		{
			[20] = true,
		},
		NPCParam = 
		{
			[28436] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[28439] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[28442] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[28445] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[28448] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[28451] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[28454] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[28457] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[28460] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[28463] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[28466] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[28469] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[28478] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[28487] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[28490] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 3048,
		ScendID = 
		{
			[41] = true,
		},
		NPCParam = 
		{
			[28802] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 3051,
		ScendID = 
		{
			[41] = true,
		},
		NPCParam = 
		{
			[23429] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[28811] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[28802] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 3053,
		ScendID = 
		{
			[41] = true,
		},
		NPCParam = 
		{
			[28814] = {
				[-1] = {true, false, false, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[28817] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[28805] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[28831] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[23429] = {
				[-1] = {false, true, true, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 3054,
		ScendID = 
		{
			[41] = true,
		},
		NPCParam = 
		{
			[28805] = {
				[-1] = {false, false, false, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 3056,
		ScendID = 
		{
			[41] = true,
		},
		NPCParam = 
		{
			[28820] = {
				[-1] = {false, true, false, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 3058,
		ScendID = 
		{
			[25] = true,
		},
		NPCParam = 
		{
			[28928] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[28934] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 3088,
		ScendID = 
		{
			[63] = true,
		},
		NPCParam = 
		{
			[29325] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 3089,
		ScendID = 
		{
			[63] = true,
		},
		NPCParam = 
		{
			[25488] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25014] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25491] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25015] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25485] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25482] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[25479] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[29307] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[29310] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[29313] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[29316] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[29319] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[26335] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[26338] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 3689,
		ScendID = 
		{
			[3] = true,
		},
		NPCParam = 
		{
			[16640] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[32832] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[32829] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16637] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16652] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[14827] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 3691,
		ScendID = 
		{
			[3] = true,
		},
		NPCParam = 
		{
			[32829] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[32826] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[14833] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16643] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 3692,
		ScendID = 
		{
			[3] = true,
		},
		NPCParam = 
		{
			[14833] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16643] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[32838] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 3693,
		ScendID = 
		{
			[3] = true,
		},
		NPCParam = 
		{
			[32838] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[14836] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 3694,
		ScendID = 
		{
			[3] = true,
		},
		NPCParam = 
		{
			[32841] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[14836] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[3561] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 3699,
		ScendID = 
		{
			[3] = true,
		},
		NPCParam = 
		{
			[32853] = {
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[32856] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 3700,
		ScendID = 
		{
			[3] = true,
		},
		NPCParam = 
		{
			[14839] = {
				[-1] = {false, true, false, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[32859] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 3700,
		ScendID = 
		{
			[3] = true,
		},
		NPCParam = 
		{
			[16658] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16646] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[14842] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[32865] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[32868] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[32835] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[32823] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[32826] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[3519] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 3701,
		ScendID = 
		{
			[3] = true,
		},
		NPCParam = 
		{
			[32859] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16640] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 3705,
		ScendID = 
		{
			[3] = true,
		},
		NPCParam = 
		{
			[16658] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[16646] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[14842] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 3713,
		ScendID = 
		{
			[7] = true,
		},
		NPCParam = 
		{
			[32960] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[32891] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[32888] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[32894] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[32897] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[32900] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[32906] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[32957] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[4588] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[4591] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[6210] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[26834] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 3717,
		ScendID = 
		{
			[7] = true,
		},
		NPCParam = 
		{
			[32897] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[32900] = {
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[32909] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 3720,
		ScendID = 
		{
			[7] = true,
		},
		NPCParam = 
		{
			[32909] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[32912] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[32982] = {
				[-1] = {false, true, true, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 3721,
		ScendID = 
		{
			[7] = true,
		},
		NPCParam = 
		{
			[32912] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[32982] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[4603] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 3723,
		ScendID = 
		{
			[7] = true,
		},
		NPCParam = 
		{
			[4603] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[32897] = {
				[-1] = {true, true, true, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 3724,
		ScendID = 
		{
			[7] = true,
		},
		NPCParam = 
		{
			[32900] = {
				[-1] = {false, false, true, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 3725,
		ScendID = 
		{
			[7] = true,
		},
		NPCParam = 
		{
			[32900] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[32894] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[32897] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[32918] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[32915] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[32933] = {
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[32951] = {
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[32942] = {
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 3727,
		ScendID = 
		{
			[7] = true,
		},
		NPCParam = 
		{
			[32918] = {
				[-1] = {false, true, true, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[32915] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[32921] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[32933] = {
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[32951] = {
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[32945] = {
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 3787,
		ScendID = 
		{
			[1006] = true,
			[1981] = true,
		},
		NPCParam = 
		{
			[35097] = {
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[35100] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[35106] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[35103] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 3788,
		ScendID = 
		{
			[1006] = true,
			[1981] = true,
		},
		NPCParam = 
		{
			[35100] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[35106] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[35103] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[35133] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[35139] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[35142] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[35145] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[35148] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[35151] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 3790,
		ScendID = 
		{
			[1006] = true,
			[1981] = true,
		},
		NPCParam = 
		{
			[35109] = {
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[35115] = {
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[35112] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[35118] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[35124] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[35127] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[35130] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 3862,
		ScendID = 
		{
			[69] = true,
		},
		NPCParam = 
		{
			[38111] = {
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
		SceneGfxParam = 
		{
			[1073750895] = {true, false, false, true},
			[1073750896] = {true, false, false, true},
			[1073750897] = {true, false, false, true},
			[1073750898] = {true, false, false, true},
			[1073750899] = {true, false, false, true},
			[1073750900] = {true, false, false, true},
			[1073750901] = {true, false, false, true},
			[1073750902] = {true, false, false, true},
			[1073750903] = {true, false, false, true},
			[1073750904] = {true, false, false, true},
			[1073750905] = {true, false, false, true},
			[1073750906] = {true, false, false, true},
			[1073750907] = {true, false, false, true},
			[1073750908] = {true, false, false, true},
			[1073750909] = {true, false, false, true},
			[1073750910] = {true, false, false, true},
			[1073750911] = {true, false, false, true},
			[1073750912] = {true, false, false, true},
			[1073750913] = {true, false, false, true},
			[1073750914] = {true, false, false, true},
			[1073751243] = {false, true, true, false},
		},
	},
	{
		TaskID = 3867,
		ScendID = 
		{
			[69] = true,
		},
		NPCParam = 
		{
			[37449] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 3875,
		ScendID = 
		{
			[69] = true,
		},
		NPCParam = 
		{
			[36713] = {
				[-1] = {true, true, true, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[36710] = {
				[-1] = {true, true, true, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[36716] = {
				[-1] = {true, true, true, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[36701] = {
				[-1] = {true, true, true, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[37809] = {
				[-1] = {true, true, true, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[36704] = {
				[-1] = {true, true, true, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[36707] = {
				[-1] = {true, true, true, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[37560] = {
				[-1] = {true, true, true, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[35853] = {
				[-1] = {true, true, true, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 3876,
		ScendID = 
		{
			[69] = true,
		},
		NPCParam = 
		{
			[36713] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[36710] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[36716] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[36701] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[37809] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[36704] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[36707] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 3877,
		ScendID = 
		{
			[69] = true,
		},
		NPCParam = 
		{
			[35591] = {
				[-1] = {false, false, false, true, 35594, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[35594] = { 
				[-1] = {true, false, false, true, 35597, GameApi.HashAString("npc-武当-杨涟3"), "0", 0, 0, 0, "0", 0, 0, 0, 0},
			},
			[35597] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 3880,
		ScendID = 
		{
			[69] = true,
		},
		NPCParam = 
		{
			[38111] = {
				[-1] = {true, true, true, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 3886,
		ScendID = 
		{
			[69] = true,
		},
		NPCParam = 
		{
			[35597] = {
				[-1] = {false, false, false, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 3887,
		ScendID = 
		{
			[69] = true,
		},
		NPCParam = 
		{
			[36900] = {
				[-1] = {true, true, true, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[36897] = {
				[-1] = {true, true, true, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[36839] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[57520] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 3889,
		ScendID = 
		{
			[69] = true,
		},
		NPCParam = 
		{
			[35615] = {
				[-1] = {false, false, true, true, 0, 0, "翻跟头跳", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[35612] = {
				[-1] = {false, false, true, true, 0, 0, "翻跟头跳", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[35624] = {
				[-1] = {false, false, true, true, 0, 0, "翻跟头跳", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[35621] = {
				[-1] = {false, false, true, true, 0, 0, "翻跟头跳", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[35618] = {
				[-1] = {false, false, true, true, 0, 0, "翻跟头跳", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[35627] = {
				[-1] = {false, false, true, true, 0, 0, "翻跟头跳", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 3890,
		ScendID = 
		{
			[69] = true,
			[10] = true,
		},
		NPCParam = 
		{
			[36900] = {
				[-1] = {false, false, false, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[36897] = {
				[-1] = {false, false, false, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[44343] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[44346] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[44349] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[44352] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[44355] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[44358] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[35621] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[35627] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[35618] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[35624] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[35612] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[35615] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 3891,
		ScendID = 
		{
			[10] = true,
		},
		NPCParam = 
		{
			[35630] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "战斗奔跑", 99, 58, -54, 0}
			},
			[35633] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 3893,
		ScendID = 
		{
			[10] = true,
		},
		NPCParam = 
		{
			[35645] = {
				[-1] = {true, true, true, false, 0, 0, "行走", -74, 77, 25, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 3894,
		ScendID = 
		{
			[10] = true,
		},
		NPCParam = 
		{
			[35645] = {
				[-1] = {true, true, true, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 3898,
		ScendID = 
		{
			[10] = true,
		},
		NPCParam = 
		{
			[44349] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "战斗奔跑", 103, 51, -78, 0}
			},
			[44346] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "战斗奔跑", 103, 51, -78, 0}
			},
			[44343] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "战斗奔跑", 103, 51, -78, 0}
			},
			[44352] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "战斗奔跑", 103, 51, -78, 0}
			},
			[44355] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "战斗奔跑", 103, 51, -78, 0}
			},
			[44358] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "战斗奔跑", 103, 51, -78, 0}
			},
			[35630] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 3903,
		ScendID = 
		{
			[10] = true,
		},
		NPCParam = 
		{
			[35633] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[35645] = {
				[-1] = {false, false, false, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 3903,
		ScendID = 
		{
			[69] = true,
		},
		NPCParam = 
		{
			[35645] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 3904,
		ScendID = 
		{
			[69] = true,
		},
		NPCParam = 
		{
			[35645] = {
				[-1] = {false, false, false, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 3906,
		ScendID = 
		{
			[69] = true,
		},
		NPCParam = 
		{
			[35651] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 3907,
		ScendID = 
		{
			[69] = true,
		},
		NPCParam = 
		{
			[35600] = {
				[-1] = {true, true, true, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[36897] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[36900] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 3909,
		ScendID = 
		{
			[10] = true,
		},
		NPCParam = 
		{
			[35600] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 3975,
		ScendID = 
		{
			[69] = true,
		},
		NPCParam = 
		{
			[35609] = {
				[-1] = {true, true, true, false, 0, 0, "战斗奔跑", -101, 122, 24, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 4089,
		ScendID = 
		{
			[68] = true,
			[1221] = true,
		},
		NPCParam = 
		{
			[45502] = { 
				[GameApi.HashAString("怪-福州-黑衣恶徒01")] = {true, false, false, true, 36764, GameApi.HashAString("怪-相位-黑衣恶徒03"), "", 0, 0, 0, "", 0, 0, 0, 10000},
				[GameApi.HashAString("00新剧情1级黑衣恶徒2")] = {true, false, false, true, 36764, GameApi.HashAString("怪-相位-黑衣恶徒02"), "", 0, 0, 0, "", 0, 0, 0, 10000},
				[GameApi.HashAString("00新剧情1级黑衣恶徒1")] = {true, false, false, true, 36764, GameApi.HashAString("怪-相位-黑衣恶徒01"), "", 0, 0, 0, "", 0, 0, 0, 10000},
			},
			[36764] = { 
				[GameApi.HashAString("怪-相位-黑衣恶徒03")] = {true, false, false, true, 45502, GameApi.HashAString("怪-福州-黑衣恶徒01"), "", 0, 0, 0, "", 0, 0, 0, 10000},
				[GameApi.HashAString("怪-相位-黑衣恶徒02")] = {true, false, false, true, 45502, GameApi.HashAString("00新剧情1级黑衣恶徒2"), "", 0, 0, 0, "", 0, 0, 0, 10000},
				[GameApi.HashAString("怪-相位-黑衣恶徒01")] = {true, false, false, true, 45502, GameApi.HashAString("00新剧情1级黑衣恶徒1"), "", 0, 0, 0, "", 0, 0, 0, 10000},
			},
			[35922] = { 
				[GameApi.HashAString("00新剧情序章曲非烟")] = {true, true, false, false, 45233, GameApi.HashAString("黑衣恶徒相位曲非烟"), "", 0, 0, 0, "", 17, 55, -71, 10000},
			},
			[45233] = { 
				[GameApi.HashAString("黑衣恶徒相位曲非烟")] = {true, true, false, false, 35922, GameApi.HashAString("00新剧情序章曲非烟"), "", 0, 0, 0, "", 0, 0, 0, 10000},
			},
			[35931] = {
				[-1] = {false, false, true, false, 0, 0, "", 10, 55, -69, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 4090,
		ScendID = 
		{
			[68] = true,
		},
	},
	{
		TaskID = 4091,
		ScendID = 
		{
			[68] = true,
			[1051] = true,
		},
		NPCParam = 
		{
			[35931] = { 
				[-1] = {false, false, false, true, 35925, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[35925] = { 
				[-1] = {true, true, false, false, 35934, GameApi.HashAString("令狐冲1"), "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[35934] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 4092,
		ScendID = 
		{
			[68] = true,
		},
	},
	{
		TaskID = 4093,
		ScendID = 
		{
			[68] = true,
		},
	},
	{
		TaskID = 4094,
		ScendID = 
		{
			[68] = true,
		},
	},
	{
		TaskID = 4095,
		ScendID = 
		{
			[68] = true,
		},
	},
	{
		TaskID = 4096,
		ScendID = 
		{
			[68] = true,
		},
		NPCParam = 
		{
			[45159] = {
				[-1] = {false, false, true, false, 0, 0, "", -47, 66, 5, "", 0, 0, 0, 0}
			},
			[45227] = {
				[-1] = {false, false, true, false, 0, 0, "", -49, 66, 7, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 4097,
		ScendID = 
		{
			[68] = true,
		},
		NPCParam = 
		{
			[45159] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", -18, 66, 7, 0}
			},
			[45227] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", -16, 66, 5, 0}
			},
		},
	},
	{
		TaskID = 4098,
		ScendID = 
		{
			[68] = true,
		},
	},
	{
		TaskID = 4099,
		ScendID = 
		{
			[68] = true,
		},
	},
	{
		TaskID = 4100,
		ScendID = 
		{
			[68] = true,
		},
		NPCParam = 
		{
			[38108] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[35967] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[35955] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 4101,
		ScendID = 
		{
			[68] = true,
		},
	},
	{
		TaskID = 4102,
		ScendID = 
		{
			[68] = true,
		},
	},
	{
		TaskID = 4103,
		ScendID = 
		{
			[68] = true,
		},
	},
	{
		TaskID = 4104,
		ScendID = 
		{
			[68] = true,
		},
		NPCParam = 
		{
			[45173] = {
				[-1] = {true, true, false, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
		SceneGfxParam = 
		{
			[1912] = {true, true, false, false},
			[1913] = {true, true, false, false},
			[1914] = {true, true, false, false},
			[1915] = {true, true, false, false},
			[1916] = {true, true, false, false},
			[1917] = {true, true, false, false},
			[1918] = {true, true, false, false},
			[1919] = {true, true, false, false},
			[1922] = {true, true, false, false},
			[1923] = {true, true, false, false},
			[1924] = {true, true, false, false},
			[1925] = {true, true, false, false},
			[1926] = {true, true, false, false},
			[1927] = {true, true, false, false},
			[1928] = {true, true, false, false},
			[1929] = {true, true, false, false},
			[1930] = {true, true, false, false},
			[1931] = {true, true, false, false},
			[1932] = {true, true, false, false},
			[1933] = {true, true, false, false},
			[1934] = {true, true, false, false},
			[1935] = {true, true, false, false},
			[1936] = {true, true, false, false},
			[1937] = {true, true, false, false},
			[1938] = {true, true, false, false},
			[1939] = {true, true, false, false},
			[1940] = {true, true, false, false},
			[1941] = {true, true, false, false},
			[1942] = {true, true, false, false},
			[1943] = {true, true, false, false},
			[1944] = {true, true, false, false},
		},
	},
	{
		TaskID = 4105,
		ScendID = 
		{
			[68] = true,
		},
	},
	{
		TaskID = 4106,
		ScendID = 
		{
			[68] = true,
		},
	},
	{
		TaskID = 4107,
		ScendID = 
		{
			[68] = true,
		},
		NPCParam = 
		{
			[36767] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[45230] = {
				[-1] = {true, true, false, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
		SceneGfxParam = 
		{
			[1946] = {true, true, false, false},
			[1947] = {true, true, false, false},
			[1948] = {true, true, false, false},
			[1949] = {true, true, false, false},
			[1950] = {true, true, false, false},
			[1951] = {true, true, false, false},
			[1952] = {true, true, false, false},
			[1953] = {true, true, false, false},
			[1954] = {true, true, false, false},
			[1955] = {true, true, false, false},
			[1956] = {true, true, false, false},
			[1957] = {true, true, false, false},
			[1958] = {true, true, false, false},
			[1959] = {true, true, false, false},
			[1960] = {true, true, false, false},
			[1961] = {true, true, false, false},
			[1962] = {true, true, false, false},
			[1963] = {true, true, false, false},
			[1964] = {true, true, false, false},
			[1965] = {true, true, false, false},
			[1966] = {true, true, false, false},
			[1967] = {true, true, false, false},
			[1968] = {true, true, false, false},
			[1969] = {true, true, false, false},
			[1970] = {true, true, false, false},
			[1971] = {true, true, false, false},
		},
	},
	{
		TaskID = 4108,
		ScendID = 
		{
			[68] = true,
		},
	},
	{
		TaskID = 4109,
		ScendID = 
		{
			[68] = true,
		},
		NPCParam = 
		{
			[38108] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[38105] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[35955] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[35967] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[35970] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[35958] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[36782] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[36768] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[35994] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[35985] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[36000] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 4110,
		ScendID = 
		{
			[68] = true,
		},
		NPCParam = 
		{
			[38105] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", -43, 61, -31, 0}
			},
		},
	},
	{
		TaskID = 4111,
		ScendID = 
		{
			[68] = true,
			[1051] = true,
		},
		NPCParam = 
		{
			[35934] = { 
				[-1] = {false, false, false, true, 35937, GameApi.HashAString("令狐冲2"), "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[35937] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 4112,
		ScendID = 
		{
			[68] = true,
			[1051] = true,
		},
		NPCParam = 
		{
			[35937] = { 
				[-1] = {false, false, false, true, 35928, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[35928] = { 
				[-1] = {true, true, false, false, 35940, GameApi.HashAString("00新剧情序章令狐冲4"), "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[35940] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 4113,
		ScendID = 
		{
			[68] = true,
		},
	},
	{
		TaskID = 4114,
		ScendID = 
		{
			[68] = true,
		},
	},
	{
		TaskID = 4115,
		ScendID = 
		{
			[68] = true,
		},
		NPCParam = 
		{
			[35940] = {
				[-1] = {true, true, false, true, 35928, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 4116,
		ScendID = 
		{
			[68] = true,
		},
	},
	{
		TaskID = 4117,
		ScendID = 
		{
			[68] = true,
		},
		NPCParam = 
		{
			[35970] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[35958] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[36767] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[36782] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[36768] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[35994] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[35985] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[36000] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 4118,
		ScendID = 
		{
			[68] = true,
		},
	},
	{
		TaskID = 4119,
		ScendID = 
		{
			[72] = true,
		},
		NPCParam = 
		{
			[35973] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[44418] = { 
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[44421] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[44424] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[44427] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[44430] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[44433] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[44436] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[44439] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 4120,
		ScendID = 
		{
			[72] = true,
		},
		NPCParam = 
		{
			[35946] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[45162] = {
				[-1] = {true, true, false, false, 0, 0, "", -216, 132, 106, "", -201, 131, 101, 0}
			},
		},
	},
	{
		TaskID = 4121,
		ScendID = 
		{
			[72] = true,
		},
		NPCParam = 
		{
			[35973] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[44418] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[44421] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[44424] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[44427] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[44430] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[44433] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[44436] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[44439] = {
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 4122,
		ScendID = 
		{
			[72] = true,
			[68] = true,
		},
		NPCParam = 
		{
			[36006] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[36012] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[36018] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[44725] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[44728] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[44731] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[44734] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[44737] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[44740] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[44743] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[35949] = {
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 4123,
		ScendID = 
		{
			[72] = true,
			[68] = true,
		},
		NPCParam = 
		{
			[36006] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[36009] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[44728] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[44731] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[44725] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 4124,
		ScendID = 
		{
			[72] = true,
		},
		NPCParam = 
		{
			[44758] = {
				[-1] = {false, false, false, true, 36120, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[44761] = {
				[-1] = {false, false, false, true, 36123, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[44755] = {
				[-1] = {false, false, false, true, 36117, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[44731] = {
				[-1] = {false, true, true, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[44725] = {
				[-1] = {false, true, true, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[44728] = {
				[-1] = {false, true, true, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 4125,
		ScendID = 
		{
			[72] = true,
		},
		NPCParam = 
		{
			[44731] = {
				[-1] = {false, false, false, true, 36123, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[44725] = {
				[-1] = {false, false, false, true, 36117, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[44728] = {
				[-1] = {false, false, false, true, 36120, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[36009] = {
				[-1] = {true, true, false, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[36012] = {
				[-1] = {true, true, false, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[36018] = {
				[-1] = {true, true, false, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 4131,
		ScendID = 
		{
			[72] = true,
		},
	},
	{
		TaskID = 4132,
		ScendID = 
		{
			[72] = true,
		},
	},
	{
		TaskID = 4133,
		ScendID = 
		{
			[72] = true,
		},
	},
	{
		TaskID = 4142,
		ScendID = 
		{
			[72] = true,
		},
	},
	{
		TaskID = 4143,
		ScendID = 
		{
			[72] = true,
		},
	},
	{
		TaskID = 4144,
		ScendID = 
		{
			[72] = true,
		},
		NPCParam = 
		{
			[36012] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[36015] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[44740] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[44734] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[44743] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[44737] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 4145,
		ScendID = 
		{
			[72] = true,
		},
		NPCParam = 
		{
			[36018] = {
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[36021] = {
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 4146,
		ScendID = 
		{
			[72] = true,
		},
		NPCParam = 
		{
			[44773] = {
				[-1] = {false, false, false, true, 36135, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[44767] = {
				[-1] = {false, false, false, true, 36129, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[44764] = {
				[-1] = {false, false, false, true, 36126, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[44770] = {
				[-1] = {false, false, false, true, 36132, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[44743] = {
				[-1] = {false, true, true, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[44737] = {
				[-1] = {false, true, true, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[44734] = {
				[-1] = {false, true, true, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[44740] = {
				[-1] = {false, true, true, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[36135] = {
				[-1] = {true, false, false, false, 44743, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 4147,
		ScendID = 
		{
			[72] = true,
		},
		NPCParam = 
		{
			[44782] = {
				[-1] = {false, false, false, true, 36144, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[44779] = {
				[-1] = {false, false, false, true, 36141, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[44776] = {
				[-1] = {false, false, false, true, 36138, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[44749] = {
				[-1] = {false, true, true, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[44752] = {
				[-1] = {false, true, true, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[44746] = {
				[-1] = {false, true, true, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 4148,
		ScendID = 
		{
			[72] = true,
		},
		NPCParam = 
		{
			[44743] = {
				[-1] = {false, false, false, true, 36135, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[44737] = {
				[-1] = {false, false, false, true, 36129, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[44734] = {
				[-1] = {false, false, false, true, 36126, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[44740] = {
				[-1] = {false, false, false, true, 36132, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[36015] = {
				[-1] = {true, true, false, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[36006] = {
				[-1] = {true, true, false, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[36018] = {
				[-1] = {true, true, false, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 4149,
		ScendID = 
		{
			[72] = true,
		},
		NPCParam = 
		{
			[44749] = {
				[-1] = {false, false, false, true, 36141, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[44752] = {
				[-1] = {false, false, false, true, 36144, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[44746] = {
				[-1] = {false, false, false, true, 36138, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[36021] = {
				[-1] = {true, true, false, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[36006] = {
				[-1] = {true, true, false, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
			[36012] = {
				[-1] = {true, true, false, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 4319,
		ScendID = 
		{
			[1051] = true,
		},
		NPCParam = 
		{
			[35925] = {
				[-1] = {true, true, true, false, 35934, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 4320,
		ScendID = 
		{
			[68] = true,
		},
		NPCParam = 
		{
			[35928] = {
				[-1] = {true, true, true, false, 35940, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
	},
	{
		TaskID = 4541,
		ScendID = 
		{
			[71] = true,
		},
		NPCParam = 
		{
			[55824] = { 
				[-1] = {false, false, false, false, 0, 0, "", 0, 0, 0, "行走", 174, 14, 137, 0},
			},
			[55827] = { 
				[-1] = {true, true, true, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[55833] = { 
				[-1] = {false, false, true, false, 0, 0, "行走_通用", 155, 10, 140, "0", 0, 0, 0, 0},
			},
			[55836] = { 
				[-1] = {false, false, true, false, 0, 0, "行走_通用", 155, 10, 140, "0", 0, 0, 0, 0},
			},
			[55839] = { 
				[-1] = {false, false, true, false, 0, 0, "行走_通用", 155, 10, 140, "0", 0, 0, 0, 0},
			},
			[55842] = { 
				[-1] = {false, false, true, false, 0, 0, "行走_通用", 155, 10, 140, "0", 0, 0, 0, 0},
			},
			[55845] = { 
				[-1] = {false, false, true, false, 0, 0, "行走_通用", 155, 10, 140, "0", 0, 0, 0, 0},
			},
			[55848] = { 
				[-1] = {false, false, true, false, 0, 0, "行走_通用", 155, 10, 140, "0", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 4546,
		ScendID = 
		{
			[71] = true,
		},
		NPCParam = 
		{
			[55860] = { 
				[-1] = {false, false, false, true, 55866, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[55866] = { 
				[-1] = {true, false, false, false, 55863, GameApi.HashAString("绿孔雀木屋"), "", 0, 0, 0, "行走_通用", -20.6491, 56.4926, 148.65, 0},
			},
			[55863] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[55833] = { 
				[-1] = {false, false, false, false, 0, 0, "0", 0, 0, 0, "0", 164, 11, 142, 0},
			},
			[55836] = { 
				[-1] = {false, false, false, false, 0, 0, "0", 0, 0, 0, "行走_通用", 164, 11, 142, 0},
			},
			[55839] = { 
				[-1] = {false, false, false, false, 0, 0, "0", 0, 0, 0, "行走_通用", 164, 11, 142, 0},
			},
			[55842] = { 
				[-1] = {false, false, false, false, 0, 0, "0", 0, 0, 0, "行走_通用", 164, 11, 142, 0},
			},
			[55845] = { 
				[-1] = {false, false, false, false, 0, 0, "0", 0, 0, 0, "行走_通用", 164, 11, 142, 0},
			},
			[55848] = { 
				[-1] = {false, false, false, false, 0, 0, "0", 0, 0, 0, "行走_通用", 164, 11, 142, 0},
			},
			[55827] = { 
				[-1] = {false, false, false, false, 0, 0, "0", 0, 0, 0, "行走", 151, 10, 138, 0},
			},
		},
	},
	{
		TaskID = 4549,
		ScendID = 
		{
			[71] = true,
		},
		NPCParam = 
		{
			[55869] = { 
				[-1] = {false, true, true, false, 0, 0, "行走", -132, 49, -27, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 4550,
		ScendID = 
		{
			[71] = true,
		},
		SceneGfxParam = 
		{
			[1073744000] = {false, true, true, false},
			[1073744005] = {false, true, true, false},
			[1073744006] = {false, true, true, false},
			[1073744007] = {false, true, true, false},
			[1073744008] = {false, true, true, false},
		},
	},
	{
		TaskID = 4554,
		ScendID = 
		{
			[71] = true,
		},
		NPCParam = 
		{
			[55869] = { 
				[-1] = {false, false, false, true, 55875, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[55875] = { 
				[-1] = {true, false, false, false, 55872, GameApi.HashAString("神秘老人村外"), "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[55872] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 4555,
		ScendID = 
		{
			[71] = true,
		},
		NPCParam = 
		{
			[55872] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[55878] = { 
				[-1] = {true, true, true, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 4563,
		ScendID = 
		{
			[71] = true,
		},
		NPCParam = 
		{
			[55923] = { 
				[-1] = {true, false, false, true, 55926, GameApi.HashAString("令狐冲解绑"), "", 0, 0, 0, "松绑", 47.8068, 45.6302, -224.544, 0},
			},
			[55926] = { 
				[-1] = {false, true, true, false, 0, 0, "落下", 49.7931, 44.4818, -227.725, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 4564,
		ScendID = 
		{
			[71] = true,
		},
		NPCParam = 
		{
			[55926] = { 
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 72, 44, -224, 0},
			},
			[55932] = { 
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 4569,
		ScendID = 
		{
			[71] = true,
		},
		NPCParam = 
		{
			[55911] = { 
				[-1] = {false, false, false, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[55932] = { 
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 256, 9, -165, 0},
			},
		},
	},
	{
		TaskID = 4570,
		ScendID = 
		{
			[71] = true,
		},
		NPCParam = 
		{
			[55935] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[55914] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
		SceneGfxParam = 
		{
			[1073744005] = {true, true, false, true},
			[1073744006] = {true, true, false, true},
			[1073744007] = {true, true, false, true},
			[1073744008] = {true, true, false, true},
		},
	},
	{
		TaskID = 4571,
		ScendID = 
		{
			[71] = true,
		},
		NPCParam = 
		{
			[55950] = { 
				[-1] = {true, true, true, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[55953] = { 
				[-1] = {true, true, true, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[55956] = { 
				[-1] = {true, true, true, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[55959] = { 
				[-1] = {true, true, true, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[55962] = { 
				[-1] = {true, true, true, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[55965] = { 
				[-1] = {true, true, true, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[55935] = { 
				[-1] = {false, false, false, true, 55938, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[55938] = { 
				[-1] = {true, false, false, true, 55941, GameApi.HashAString("令狐冲庙"), "", 0, 0, 0, "", -49, 35, 76, 0},
			},
			[55920] = { 
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[55914] = { 
				[-1] = {false, false, false, true, 55917, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[55917] = { 
				[-1] = {true, false, false, true, 55920, GameApi.HashAString("岳灵珊庙"), "", 0, 0, 0, "", -44, 35, 62, 0},
			},
			[55920] = { 
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[55941] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", -32, 32, 67, 0},
			},
		},
	},
	{
		TaskID = 4573,
		ScendID = 
		{
			[71] = true,
		},
		NPCParam = 
		{
			[55950] = { 
				[-1] = {false, true, true, true, 0, 0, "", 0, 0, 0, "", -32, 32, 67, 0},
			},
			[55953] = { 
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", -32, 32, 67, 0},
			},
			[55956] = { 
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", -32, 32, 67, 0},
			},
			[55959] = { 
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", -32, 32, 67, 0},
			},
			[55962] = { 
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", -32, 32, 67, 0},
			},
			[55920] = { 
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", -32, 32, 67, 0},
			},
			[55941] = { 
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", -32, 32, 67, 0},
			},
			[55974] = { 
				[-1] = {false, false, false, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[55977] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[55980] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[55983] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[55986] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[55989] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[55992] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[55965] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 4574,
		ScendID = 
		{
			[71] = true,
		},
		NPCParam = 
		{
			[55950] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 27, 64, 0},
			},
			[55977] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 27, 64, 0},
			},
			[55965] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 27, 64, 0},
			},
			[55983] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 27, 64, 0},
			},
			[55986] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 27, 64, 0},
			},
			[55989] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 27, 64, 0},
			},
			[55992] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 27, 64, 0},
			},
			[55980] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 3, 27, 72, 0},
			},
			[55830] = { 
				[-1] = {true, true, true, true, 0, 0, "0", 0, 0, 0, "0", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 4578,
		ScendID = 
		{
			[71] = true,
		},
		NPCParam = 
		{
			[55968] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 4579,
		ScendID = 
		{
			[75] = true,
		},
		NPCParam = 
		{
			[55971] = { 
				[-1] = {true, true, true, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
		SceneGfxParam = 
		{
			[1073744279] = {false, true, true, false},
		},
	},
	{
		TaskID = 4656,
		ScendID = 
		{
			[71] = true,
		},
		NPCParam = 
		{
			[57350] = { 
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 4499,
		ScendID = 
		{
			[77] = true,
		},
		NPCParam = 
		{
			[56122] = { 
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 4502,
		ScendID = 
		{
			[77] = true,
		},
		NPCParam = 
		{
			[56122] = { 
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 23692, 0, 0, 0},
			},
			[56152] = { 
				[-1] = {false, true, true, false, 0, 0, "", 230, 86, -238, "", 0, 0, 0, 0},
			},
			[56245] = { 
				[-1] = {false, true, true, false, 0, 0, "", 211, 86, -226, "", 0, 0, 0, 0},
			},
			[56248] = { 
				[-1] = {false, true, true, false, 0, 0, "", 223, 89, -221, "", 0, 0, 0, 0},
			},
			[56251] = { 
				[-1] = {false, true, true, false, 0, 0, "", 230, 87, -226, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 4503,
		ScendID = 
		{
			[77] = true,
		},
		NPCParam = 
		{
			[56152] = { 
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 231, 86, -237, 0},
			},
			[56155] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 4505,
		ScendID = 
		{
			[77] = true,
		},
		NPCParam = 
		{
			[56155] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[56161] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[56158] = { 
				[-1] = {false, false, true, false, 0, 0, "", 241, 85, -293, "", 0, 0, 0, 0},
			},
			[56164] = { 
				[-1] = {false, false, true, false, 0, 0, "", 238, 85, -295, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 4508,
		ScendID = 
		{
			[77] = true,
		},
		NPCParam = 
		{
			[56125] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 4509,
		ScendID = 
		{
			[77] = true,
		},
		NPCParam = 
		{
			[56125] = { 
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 23691, 0, 0, 0},
			},
			[56128] = { 
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[56143] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[45568] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 4510,
		ScendID = 
		{
			[77] = true,
		},
		NPCParam = 
		{
			[56128] = { 
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 23694, 0, 0, 0},
			},
			[56131] = { 
				[-1] = {false, true, true, false, 0, 0, "", 89, 99, -87, "", 0, 0, 0, 0},
			},
			[45568] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 75, 98, -75, 0},
			},
		},
	},
	{
		TaskID = 4511,
		ScendID = 
		{
			[77] = true,
		},
		NPCParam = 
		{
			[56131] = { 
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[56134] = { 
				[-1] = {true, true, true, false, 0, 0, "", 79, 98, -85, "", 0, 0, 0, 0},
			},
			[56218] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 4513,
		ScendID = 
		{
			[77] = true,
		},
		NPCParam = 
		{
			[56143] = { 
				[-1] = {false, false, false, true, 56236, 0, "", 0, 0, 0, "", 0, 0, 0, 10000},
			},
			[56236] = { 
				[-1] = {true, false, false, false, 56146, GameApi.HashAString("00新剧情主线少室山林平之2-水坝"), "", 0, 0, 0, "", 0, 0, 0, 10000},
			},
			[56146] = { 
				[GameApi.HashAString("00新剧情主线少室山林平之2-水坝")] = {false, true, true, false, 0, 0, "", 130, 98, -67, "", 0, 0, 0, 0},
			},
			[56134] = { 
				[-1] = {false, false, false, true, 56230, 0, "", 0, 0, 0, "", 0, 0, 0, 10000},
			},
			[56230] = { 
				[-1] = {true, false, false, false, 56137, GameApi.HashAString("00新剧情主线少室山岳灵珊6-水坝"), "", 0, 0, 0, "", 0, 0, 0, 10000},
			},
			[56137] = { 
				[GameApi.HashAString("00新剧情主线少室山岳灵珊6-水坝")] = {false, true, true, false, 0, 0, "", 127, 98, -68, "", 0, 0, 0, 0},
			},
			[56218] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 132, 99, -47, 0},
			},
		},
	},
	{
		TaskID = 4514,
		ScendID = 
		{
			[77] = true,
		},
		NPCParam = 
		{
			[56146] = { 
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 23696, 0, 0, 0},
			},
			[56137] = { 
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 23695, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 4517,
		ScendID = 
		{
			[77] = true,
		},
		NPCParam = 
		{
			[56173] = { 
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 4519,
		ScendID = 
		{
			[77] = true,
		},
		NPCParam = 
		{
			[56173] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[56221] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 23698, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 4521,
		ScendID = 
		{
			[77] = true,
		},
		NPCParam = 
		{
			[56215] = { 
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 4522,
		ScendID = 
		{
			[77] = true,
		},
		NPCParam = 
		{
			[56176] = { 
				[-1] = {false, false, true, false, 0, 0, "", 106, 106, 182, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 4523,
		ScendID = 
		{
			[77] = true,
		},
		NPCParam = 
		{
			[56215] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 23699, 0, 0, 0},
			},
			[56239] = { 
				[-1] = {false, false, true, false, 0, 0, "", 116, 106, 188, "", 0, 0, 0, 0},
			},
			[56233] = { 
				[-1] = {false, false, true, false, 0, 0, "", 116, 106, 185, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 4524,
		ScendID = 
		{
			[77] = true,
		},
		NPCParam = 
		{
			[56239] = { 
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 23702, 0, 0, 0},
			},
			[56233] = { 
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 23701, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 4527,
		ScendID = 
		{
			[77] = true,
		},
		NPCParam = 
		{
			[56176] = { 
				[-1] = {false, false, false, true, 56212, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[56212] = { 
				[-1] = {true, true, false, false, 56965, GameApi.HashAString("龙套方生"), "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[56965] = { 
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 4528,
		ScendID = 
		{
			[77] = true,
		},
		NPCParam = 
		{
			[56965] = { 
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 23705, 0, 0, 0},
			},
			[58832] = { 
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 23704, 0, 0, 0},
			},
			[58835] = { 
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 23706, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 4535,
		ScendID = 
		{
			[77] = true,
		},
		NPCParam = 
		{
			[56179] = { 
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[56149] = { 
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[56140] = { 
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 4537,
		ScendID = 
		{
			[77] = true,
		},
		NPCParam = 
		{
			[56149] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 23709, 0, 0, 0},
			},
			[56140] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 23708, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 4583,
		ScendID = 
		{
			[76] = true,
		},
		NPCParam = 
		{
			[55678] = { 
				[GameApi.HashAString("怪-嵩山筹备弟子22")] = {true, false, false, true, 0, 0, "", 0, 0, 0, "战斗奔跑", 376, 67, -62, 0},
				[GameApi.HashAString("怪-嵩山筹备弟子25")] = {true, false, false, true, 0, 0, "", 0, 0, 0, "战斗奔跑", 375, 67, -62, 0},
				[GameApi.HashAString("怪-嵩山筹备弟子64")] = {true, false, false, true, 0, 0, "", 0, 0, 0, "战斗奔跑", 374, 67, -66, 0},
				[GameApi.HashAString("怪-嵩山筹备弟子71")] = {true, false, false, true, 0, 0, "", 0, 0, 0, "战斗奔跑", 373, 67, -74, 0},
				[GameApi.HashAString("怪-嵩山筹备弟子68")] = {true, false, false, true, 0, 0, "", 0, 0, 0, "战斗奔跑", 368, 67, -77, 0},
				[GameApi.HashAString("怪-嵩山筹备弟子80")] = {true, false, false, true, 0, 0, "", 0, 0, 0, "战斗奔跑", 354, 68, -82, 0},
				[GameApi.HashAString("怪-嵩山筹备弟子27")] = {true, false, false, true, 0, 0, "", 0, 0, 0, "战斗奔跑", 347, 67, -80, 0},
				[GameApi.HashAString("怪-嵩山筹备弟子21")] = {true, false, false, true, 0, 0, "", 0, 0, 0, "战斗奔跑", 333, 67, -75, 0},
				[GameApi.HashAString("怪-嵩山筹备弟子24")] = {true, false, false, true, 0, 0, "", 0, 0, 0, "战斗奔跑", 325, 67, -67, 0},
			},
		},
		SceneGfxParam = 
		{
			[1073746584] = {false, true, true, false},
			[1073746585] = {false, true, true, false},
		},
	},
	{
		TaskID = 4584,
		NPCParam = 
		{
			[55636] = { 
				[-1] = {false, true, false, false, 0, 0, "", 314, 64, -86, "", 0, 0, 0, 0},
			},
			[55639] = { 
				[-1] = {false, true, false, false, 0, 0, "", 310, 64, -89, "", 0, 0, 0, 0},
			},
			[55642] = { 
				[-1] = {false, true, false, false, 0, 0, "", 310, 64, -93, "", 0, 0, 0, 0},
			},
			[55645] = { 
				[-1] = {false, true, false, false, 0, 0, "", 312, 61, -98, "", 0, 0, 0, 0},
			},
			[55648] = { 
				[-1] = {false, true, false, false, 0, 0, "", 310, 61, -99, "", 0, 0, 0, 0},
			},
			[55651] = { 
				[-1] = {false, true, false, false, 0, 0, "", 311, 60, -102, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 4585,
		ScendID = 
		{
			[76] = true,
		},
		NPCParam = 
		{
			[55594] = { 
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[55597] = { 
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[4576] = { 
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
		SceneGfxParam = 
		{
			[4468] = {true, true, false, true},
			[4469] = {true, true, false, true},
			[4470] = {true, true, false, true},
			[4471] = {true, true, false, true},
			[4472] = {true, true, false, true},
			[4473] = {true, true, false, true},
			[4474] = {true, true, false, true},
			[4475] = {true, true, false, true},
			[4476] = {true, true, false, true},
			[4477] = {true, true, false, true},
			[4478] = {true, true, false, true},
			[4479] = {true, true, false, true},
			[4480] = {true, true, false, true},
			[4481] = {true, true, false, true},
			[4482] = {true, true, false, true},
			[4483] = {true, true, false, true},
			[4484] = {true, true, false, true},
			[4485] = {true, true, false, true},
			[4465] = {true, true, false, true},
			[4466] = {true, true, false, true},
			[4467] = {true, true, false, true},
		},
	},
	{
		TaskID = 4588,
		ScendID = 
		{
			[76] = true,
		},
		NPCParam = 
		{
			[55606] = { 
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 4592,
		ScendID = 
		{
			[76] = true,
		},
		NPCParam = 
		{
			[4576] = { 
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[55603] = { 
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 4593,
		ScendID = 
		{
			[76] = true,
		},
		NPCParam = 
		{
			[55615] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 4594,
		ScendID = 
		{
			[76] = true,
		},
		NPCParam = 
		{
			[55594] = { 
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[55597] = { 
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 4595,
		ScendID = 
		{
			[76] = true,
		},
		NPCParam = 
		{
			[55603] = { 
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 26106, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 4596,
		ScendID = 
		{
			[76] = true,
		},
		NPCParam = 
		{
			[56327] = { 
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 4597,
		ScendID = 
		{
			[1310] = true,
			[76] = true,
		},
		NPCParam = 
		{
			[55618] = { 
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[55624] = { 
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[55606] = { 
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[55609] = { 
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 4600,
		ScendID = 
		{
			[76] = true,
			[1310] = true,
		},
		NPCParam = 
		{
			[55609] = { 
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 25055, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 4601,
		ScendID = 
		{
			[76] = true,
			[1310] = true,
		},
		NPCParam = 
		{
			[55627] = { 
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[55630] = { 
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[55633] = { 
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[55618] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[55624] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 4602,
		ScendID = 
		{
			[76] = true,
		},
		NPCParam = 
		{
			[55627] = { 
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "战斗奔跑", 23738, 0, 0, 0},
			},
			[55630] = { 
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "战斗奔跑", 23739, 0, 0, 0},
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "战斗奔跑", 23739, 0, 0, 0},
			},
			[56324] = { 
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[56327] = { 
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 4603,
		ScendID = 
		{
			[76] = true,
		},
		NPCParam = 
		{
			[56330] = { 
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[56333] = { 
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 4605,
		ScendID = 
		{
			[76] = true,
		},
		NPCParam = 
		{
			[56330] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[56333] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[55633] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[55654] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[56456] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[56459] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[56462] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[56465] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[56468] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[56471] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 4609,
		ScendID = 
		{
			[76] = true,
		},
		NPCParam = 
		{
			[56456] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "战斗奔跑", 23734, 0, 0, 0},
			},
			[56459] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "战斗奔跑", 23736, 0, 0, 0},
			},
			[56462] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "战斗奔跑", 23737, 0, 0, 0},
			},
			[56465] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "战斗奔跑", 23733, 0, 0, 0},
			},
			[56468] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "战斗奔跑", 23732, 0, 0, 0},
			},
			[56471] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "战斗奔跑", 23735, 0, 0, 0},
			},
			[55612] = { 
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 4613,
		ScendID = 
		{
			[76] = true,
		},
		NPCParam = 
		{
			[55660] = { 
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[55663] = { 
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 4616,
		ScendID = 
		{
			[76] = true,
			[1310] = true,
		},
		NPCParam = 
		{
			[55621] = { 
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[55660] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[55663] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[55654] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 4618,
		ScendID = 
		{
			[76] = true,
			[1310] = true,
		},
		NPCParam = 
		{
			[55621] = { 
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[55612] = { 
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 4631,
		ScendID = 
		{
			[71] = true,
		},
		NPCParam = 
		{
			[57300] = { 
				[-1] = {false, false, false, true, 57526, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[57526] = { 
				[-1] = {true, false, false, true, 57529, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[57529] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 4636,
		ScendID = 
		{
			[77] = true,
		},
		NPCParam = 
		{
			[57514] = { 
				[-1] = {false, false, false, true, 57517, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 4727,
		ScendID = 
		{
			[71] = true,
		},
		NPCParam = 
		{
			[57297] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 4795,
		ScendID = 
		{
			[75] = true,
		},
		NPCParam = 
		{
			[58760] = { 
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 4803,
		ScendID = 
		{
			[75] = true,
		},
		NPCParam = 
		{
			[58745] = { 
				[-1] = {false, true, true, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[58748] = { 
				[-1] = {false, true, true, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[58799] = { 
				[-1] = {true, false, false, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[58802] = { 
				[-1] = {true, false, false, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[58796] = { 
				[-1] = {true, false, false, false, 58739, GameApi.HashAString("任盈盈"), "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[58739] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 4797,
		ScendID = 
		{
			[75] = true,
		},
		NPCParam = 
		{
			[58757] = { 
				[-1] = {false, true, true, true, 55700, 0, "0", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[58754] = { 
				[-1] = {false, true, true, true, 55699, 0, "0", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 4801,
		ScendID = 
		{
			[75] = true,
		},
		NPCParam = 
		{
			[58739] = { 
				[-1] = {false, false, false, true, 0, 0, "0", 0, 0, 0, "行走", -313.42, 26, 161.13, 0},
			},
			[58742] = { 
				[-1] = {true, true, true, false, 0, 0, "0", 0, 0, 0, "0", 0, 0, 0, 0},
			},
			[58745] = { 
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "行走", -305.725, 23.8519, 168.599, 0},
			},
			[58748] = { 
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", -304.948, 23.4013, 166.826, 0},
			},
			[58751] = { 
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "行走", -304.075, 23.2771, 165.186, 0},
			},
			[58754] = { 
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "行走", -303.041, 23.8368, 163.927, 0},
			},
			[58757] = { 
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", -301.772, 24.3252, 163.15, 0},
			},
		},
	},
	{
		TaskID = 4802,
		ScendID = 
		{
			[75] = true,
		},
		NPCParam = 
		{
			[58760] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", -293.535, 25.184, 156.039, 0},
			},
		},
	},
	{
		TaskID = 4722,
		ScendID = 
		{
			[77] = true,
		},
		NPCParam = 
		{
			[58719] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 4725,
		ScendID = 
		{
			[77] = true,
		},
		NPCParam = 
		{
			[58789] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 4726,
		ScendID = 
		{
			[77] = true,
		},
		NPCParam = 
		{
			[58789] = { 
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 4892,
		ScendID = 
		{
			[78] = true,
		},
		NPCParam = 
		{
			[59526] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 4893,
		ScendID = 
		{
			[78] = true,
		},
		NPCParam = 
		{
			[59529] = { 
				[-1] = {false, false, true, false, 0, 0, "", -100, 21, -189, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 4903,
		ScendID = 
		{
			[78] = true,
		},
		NPCParam = 
		{
			[59547] = { 
				[-1] = {false, true, true, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 4906,
		ScendID = 
		{
			[78] = true,
		},
		NPCParam = 
		{
			[59547] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 314, 35, -220, 0},
			},
		},
	},
	{
		TaskID = 4908,
		ScendID = 
		{
			[78] = true,
		},
		NPCParam = 
		{
			[59559] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[60314] = { 
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 4909,
		ScendID = 
		{
			[78] = true,
		},
		NPCParam = 
		{
			[60306] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 4910,
		ScendID = 
		{
			[78] = true,
		},
		NPCParam = 
		{
			[59538] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[59541] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[59562] = { 
				[-1] = {false, true, true, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[60367] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 4911,
		ScendID = 
		{
			[78] = true,
		},
		NPCParam = 
		{
			[59544] = { 
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[60307] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[60308] = { 
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[60309] = { 
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[60310] = { 
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 4914,
		ScendID = 
		{
			[78] = true,
		},
		NPCParam = 
		{
			[59550] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[60313] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[60314] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[60325] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[60326] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[60327] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[60328] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[60329] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[60330] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[60331] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[59544] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[60308] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[60309] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[60310] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 4930,
		ScendID = 
		{
			[79] = true,
		},
		NPCParam = 
		{
			[67344] = { 
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", -255.4, 88.661, -86.457, 0},
			},
		},
	},
	{
		TaskID = 5013,
		ScendID = 
		{
			[78] = true,
		},
		NPCParam = 
		{
			[59925] = { 
				[-1] = {false, true, true, false, 0, 0, "", -283, 40, -347, "", 0, 0, 0, 0},
			},
			[59926] = { 
				[-1] = {false, true, true, false, 0, 0, "", -273, 33, -343, "", 0, 0, 0, 0},
			},
			[59927] = { 
				[-1] = {false, true, true, false, 0, 0, "", -283, 32, -324, "", 0, 0, 0, 0},
			},
			[59928] = { 
				[-1] = {false, true, true, false, 0, 0, "", -272, 33, -333, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 5019,
		ScendID = 
		{
			[78] = true,
		},
		NPCParam = 
		{
			[59883] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[59884] = { 
				[-1] = {false, false, true, false, 0, 0, "", -334, 35, -343, "", 0, 0, 0, 0},
			},
			[59885] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[59886] = { 
				[-1] = {false, false, true, false, 0, 0, "", -327, 34, -342, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 5026,
		ScendID = 
		{
			[78] = true,
		},
		NPCParam = 
		{
			[59913] = { 
				[-1] = {false, false, true, false, 0, 0, "", 235, 30, -411, "", 0, 0, 0, 0},
			},
			[59914] = { 
				[-1] = {false, false, true, false, 0, 0, "", 235, 30, -411, "", 0, 0, 0, 0},
			},
			[59915] = { 
				[-1] = {false, false, true, false, 0, 0, "", 176, 26, -328, "", 0, 0, 0, 0},
			},
			[59916] = { 
				[-1] = {false, false, true, false, 0, 0, "", 235, 30, -411, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 5028,
		ScendID = 
		{
			[78] = true,
		},
		NPCParam = 
		{
			[59913] = { 
				[-1] = {false, false, false, false, 0, 0, "", 0, 0, 0, "", 235, 30, -411, 0},
			},
			[59914] = { 
				[-1] = {false, false, false, false, 0, 0, "", 0, 0, 0, "", 235, 30, -411, 0},
			},
			[59915] = { 
				[-1] = {false, false, false, false, 0, 0, "", 0, 0, 0, "", 235, 30, -411, 0},
			},
			[59916] = { 
				[-1] = {false, false, false, false, 0, 0, "", 0, 0, 0, "", 235, 30, -411, 0},
			},
		},
	},
	{
		TaskID = 4919,
		ScendID = 
		{
			[79] = true,
		},
		NPCParam = 
		{
			[59283] = { 
				[-1] = {false, false, false, true, 59286, 0, "0", 0, 0, 0, "0", 0, 0, 0, 0},
			},
			[59286] = { 
				[-1] = {true, true, false, false, 59289, GameApi.HashAString("00新剧情桃花仙02"), "0", 0, 0, 0, "0", 0, 0, 0, 0},
			},
			[59289] = { 
				[-1] = {false, false, true, false, 0, 0, "0", 0, 0, 0, "0", 0, 0, 0, 0},
			},
			[59292] = { 
				[-1] = {false, false, false, true, 59295, 0, "", 230.135, 71.735, -245.298, "", 0, 0, 0, 0},
			},
			[59295] = { 
				[-1] = {true, true, false, false, 59298, GameApi.HashAString("00新剧情桃干仙02"), "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[59298] = { 
				[-1] = {false, false, true, false, 0, 0, "", 345.507, 76.7057, -172.887, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 4922,
		ScendID = 
		{
			[79] = true,
		},
		NPCParam = 
		{
			[59289] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 351.369, 72.1492, -218.247, 0},
			},
			[59307] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 351.369, 72.1492, -218.247, 0},
			},
			[59298] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 351.369, 72.1492, -218.247, 0},
			},
			[59304] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 351.369, 72.1492, -218.247, 0},
			},
			[59301] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 351.369, 72.1492, -218.247, 0},
			},
			[59310] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 351.369, 72.1492, -218.247, 0},
			},
			[59280] = { 
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[67343] = { 
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[67456] = { 
				[-1] = {false, false, true, false, 0, 0, "0", 223.190, 85.948, -123.676, "0", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 4926,
		NPCParam = 
		{
			[59355] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 4927,
		ScendID = 
		{
			[79] = true,
		},
		NPCParam = 
		{
			[59364] = { 
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[59355] = { 
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 4955,
		ScendID = 
		{
			[79] = true,
		},
		NPCParam = 
		{
			[59334] = { 
				[-1] = {false, true, true, false, 0, 0, "", 262.312, 86.0375, 59.5283, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 4956,
		ScendID = 
		{
			[79] = true,
		},
		NPCParam = 
		{
			[59337] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 262.87, 105.997, 173.483, 0},
			},
		},
	},
	{
		TaskID = 4954,
		ScendID = 
		{
			[79] = true,
		},
		NPCParam = 
		{
			[59337] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 282.996, 103.674, 144.719, 0},
			},
			[59334] = { 
				[-1] = {false, false, false, false, 0, 0, "", 0, 0, 0, "", 262.312, 86.0375, 59.5283, 0},
			},
		},
	},
	{
		TaskID = 4932,
		ScendID = 
		{
			[79] = true,
		},
		NPCParam = 
		{
			[59409] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 4940,
		ScendID = 
		{
			[79] = true,
		},
		NPCParam = 
		{
			[59409] = { 
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[59376] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", -12.5, 126.7, 117, 0},
			},
			[59379] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", -12.5, 126.7, 117, 0},
			},
			[59382] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", -12.5, 126.7, 117, 0},
			},
			[59385] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", -12.5, 126.7, 117, 0},
			},
			[59388] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", -12.5, 126.7, 117, 0},
			},
			[59391] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", -12.5, 126.7, 117, 0},
			},
			[59394] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", -12.5, 126.7, 117, 0},
			},
			[59373] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[67410] = { 
				[-1] = {false, true, true, false, 0, 0, "", 60.83, 107.57, 102.86, "", 0, 0, 0, 0},
			},
			[67411] = { 
				[-1] = {false, true, true, false, 0, 0, "", 60.83, 107.57, 102.86, "", 0, 0, 0, 0},
			},
			[67412] = { 
				[-1] = {false, true, true, false, 0, 0, "", 60.83, 107.57, 102.86, "", 0, 0, 0, 0},
			},
			[67413] = { 
				[-1] = {false, true, true, false, 0, 0, "", 60.83, 107.57, 102.86, "", 0, 0, 0, 0},
			},
			[67414] = { 
				[-1] = {false, true, true, false, 0, 0, "", 60.83, 107.57, 102.86, "", 0, 0, 0, 0},
			},
			[67415] = { 
				[-1] = {false, true, true, false, 0, 0, "", 60.83, 107.57, 102.86, "", 0, 0, 0, 0},
			},
			[59322] = { 
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[67456] = { 
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[59325] = { 
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[67457] = { 
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[76071] = { 
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 1},
			},
			[71560] = { 
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 1},
			},
			[71557] = { 
				[-1] = {false, true, true, false, 0, 0, "", 60.83, 107.57, 102.86, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 4961,
		ScendID = 
		{
			[79] = true,
		},
		NPCParam = 
		{
			[59346] = { 
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", -229.7, 72.5, -122, 0},
			},
			[59349] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 4945,
		ScendID = 
		{
			[81] = true,
		},
		NPCParam = 
		{
			[59451] = { 
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 4948,
		ScendID = 
		{
			[81] = true,
		},
		NPCParam = 
		{
			[59466] = { 
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 4949,
		ScendID = 
		{
			[81] = true,
		},
		NPCParam = 
		{
			[59454] = { 
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 4951,
		ScendID = 
		{
			[81] = true,
		},
		NPCParam = 
		{
			[59469] = { 
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[59472] = { 
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 4952,
		ScendID = 
		{
			[81] = true,
		},
		NPCParam = 
		{
			[59466] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[59454] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[59484] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[59487] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 4942,
		ScendID = 
		{
			[81] = true,
		},
		NPCParam = 
		{
			[59466] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[59454] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[59484] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[59487] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 4977,
		ScendID = 
		{
			[81] = true,
		},
		NPCParam = 
		{
			[59487] = { 
				[-1] = {true, true, false, true, 60202, GameApi.HashAString("-1"), "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[60202] = { 
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 4978,
		ScendID = 
		{
			[81] = true,
		},
		NPCParam = 
		{
			[60202] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[59484] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[59496] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[59499] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 5036,
		ScendID = 
		{
			[81] = true,
		},
		NPCParam = 
		{
			[59490] = { 
				[-1] = {false, false, false, true, 59493, 0, "0", 0, 0, 0, "0", 0, 0, 0, 0},
			},
			[59493] = { 
				[-1] = {true, true, false, false, 0, 0, "0", 0, 0, 0, "0", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 4982,
		ScendID = 
		{
			[81] = true,
		},
		NPCParam = 
		{
			[59496] = { 
				[-1] = {false, false, false, true, 59502, 0, "0", 0, 0, 0, "0", 0, 0, 0, 0},
			},
			[59499] = { 
				[-1] = {false, false, false, true, 59505, 0, "0", 0, 0, 0, "0", 0, 0, 0, 0},
			},
			[59502] = { 
				[-1] = {true, false, false, false, 59508, 0, "0", 0, 0, 0, "0", 0, 0, 0, 0},
			},
			[59505] = { 
				[-1] = {true, false, false, false, 59511, 0, "0", 0, 0, 0, "0", 0, 0, 0, 0},
			},
			[59508] = { 
				[-1] = {false, true, true, false, 0, 0, "0", 0, 0, 0, "0", 0, 0, 0, 0},
			},
			[59511] = { 
				[-1] = {false, true, true, false, 0, 0, "0", 0, 0, 0, "0", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 4983,
		ScendID = 
		{
			[81] = true,
		},
		SceneGfxParam = 
		{
			[218] = {false, true, true, false},
			[219] = {false, true, true, false},
			[220] = {false, true, true, false},
			[221] = {false, true, true, false},
			[222] = {false, true, true, false},
			[223] = {false, true, true, false},
			[224] = {false, true, true, false},
			[225] = {false, true, true, false},
			[226] = {false, true, true, false},
			[227] = {false, true, true, false},
			[228] = {false, true, true, false},
			[229] = {false, true, true, false},
		},
	},
	{
		TaskID = 4984,
		ScendID = 
		{
			[81] = true,
		},
		NPCParam = 
		{
			[59514] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[59508] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "战斗奔跑", -122.378, 75.4932, -35.4081, 0},
			},
			[59511] = { 
				[-1] = {true, true, false, true, 0, 0, "0", 0, 0, 0, "战斗奔跑", -116.113, 75.1344, -37.1776, 0},
			},
		},
	},
	{
		TaskID = 5053,
		ScendID = 
		{
			[1051] = true,
		},
		NPCParam = 
		{
			[35934] = { 
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 5056,
		ScendID = 
		{
			[78] = true,
		},
		SceneGfxParam = 
		{
			[13633] = {false, true, true, false},
			[13634] = {false, true, true, false},
			[13635] = {false, true, true, false},
			[13644] = {false, true, true, false},
			[13645] = {false, true, true, false},
			[13636] = {false, true, true, false},
		},
	},
	{
		TaskID = 5057,
		ScendID = 
		{
			[78] = true,
		},
		SceneGfxParam = 
		{
			[13637] = {false, true, true, false},
			[13638] = {false, true, true, false},
			[13639] = {false, true, true, false},
			[13647] = {false, true, true, false},
			[13640] = {false, true, true, false},
		},
	},
	{
		TaskID = 5058,
		ScendID = 
		{
			[78] = true,
		},
		SceneGfxParam = 
		{
			[13641] = {false, true, true, false},
			[13642] = {false, true, true, false},
			[13643] = {false, true, true, false},
		},
	},
	{
		TaskID = 5121,
		ScendID = 
		{
			[82] = true,
		},
		NPCParam = 
		{
			[71545] = { 
				[-1] = {true, true, true, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
		SceneGfxParam = 
		{
			[6076] = {false, true, true, true},
			[6077] = {false, true, true, true},
			[6078] = {false, true, true, true},
			[6079] = {false, true, true, true},
		},
	},
	{
		TaskID = 5957,
		ScendID = 
		{
			[82] = true,
		},
		NPCParam = 
		{
			[71545] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 5904,
		ScendID = 
		{
			[82] = true,
		},
		SceneGfxParam = 
		{
			[1073748461] = {false, true, true, false},
		},
		SceneModelParam = 
		{
			[1073748459] = {false, true, true, false},
			[1073748460] = {false, true, true, false},
			[1073748456] = {false, true, true, false},
			[1073748458] = {false, true, true, false},
		},
	},
	{
		TaskID = 5127,
		ScendID = 
		{
			[82] = true,
		},
		SceneGfxParam = 
		{
			[1073748531] = {false, true, true, false},
			[1073748532] = {false, true, true, false},
			[1073748533] = {false, true, true, false},
		},
	},
	{
		TaskID = 5128,
		ScendID = 
		{
			[82] = true,
		},
		NPCParam = 
		{
			[61270] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[61567] = { 
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[61267] = { 
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
		SceneGfxParam = 
		{
			[1073748531] = {true, true, false, true},
			[1073748531] = {true, true, false, true},
			[1073748531] = {true, true, false, true},
		},
	},
	{
		TaskID = 5129,
		ScendID = 
		{
			[82] = true,
		},
		NPCParam = 
		{
			[61276] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[61279] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[61273] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 5133,
		ScendID = 
		{
			[82] = true,
		},
		NPCParam = 
		{
			[61282] = { 
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 5138,
		ScendID = 
		{
			[82] = true,
		},
		NPCParam = 
		{
			[61282] = { 
				[-1] = {false, false, false, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[61285] = { 
				[-1] = {true, true, true, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 5139,
		ScendID = 
		{
			[82] = true,
		},
		NPCParam = 
		{
			[61285] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 5144,
		ScendID = 
		{
			[89] = true,
		},
		NPCParam = 
		{
			[61306] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[61309] = { 
				[-1] = {false, true, true, false, 0, 0, "", -69.9522, 38.5443, -69.6927, "", 0, 0, 0, 0},
			},
			[61300] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 5145,
		ScendID = 
		{
			[82] = true,
		},
		NPCParam = 
		{
			[61303] = { 
				[-1] = {true, true, true, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[61318] = { 
				[-1] = {true, true, true, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[61279] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 5342,
		ScendID = 
		{
			[72] = true,
		},
		NPCParam = 
		{
			[63019] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 5224,
		ScendID = 
		{
			[72] = true,
		},
		NPCParam = 
		{
			[61746] = { 
				[-1] = {false, false, false, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 5341,
		ScendID = 
		{
			[72] = true,
		},
		NPCParam = 
		{
			[63014] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", -109, 122, 36, 0},
			},
			[63015] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", -109, 122, 36, 0},
			},
			[63016] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", -109, 122, 36, 0},
			},
			[61710] = { 
				[-1] = {false, true, true, false, 0, 0, "", 23180, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 5225,
		ScendID = 
		{
			[72] = true,
		},
		NPCParam = 
		{
			[61710] = { 
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 23792, 0, 0, 0},
			},
			[63013] = { 
				[-1] = {true, true, true, false, 0, 0, "", 23177, 0, 0, "", 0, 0, 0, 0},
			},
			[61833] = { 
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[61827] = { 
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[61830] = { 
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[61821] = { 
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[61818] = { 
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[61743] = { 
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[61824] = { 
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[61845] = { 
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[61848] = { 
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[61839] = { 
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[61809] = { 
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[61857] = { 
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[61854] = { 
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[61851] = { 
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 5228,
		ScendID = 
		{
			[72] = true,
		},
		NPCParam = 
		{
			[63013] = { 
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 23174, 0, 0, 0},
			},
			[61713] = { 
				[-1] = {true, true, true, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 5478,
		ScendID = 
		{
			[72] = true,
		},
		NPCParam = 
		{
			[61713] = { 
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 23204, 0, 0, 0},
			},
			[61716] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
		SceneGfxParam = 
		{
			[1073743481] = {true, false, false, true},
			[1073743482] = {true, false, false, true},
			[1073743483] = {true, false, false, true},
			[1073743480] = {true, false, false, true},
			[1073743484] = {true, false, false, true},
			[1073743485] = {true, false, false, true},
			[1073743477] = {true, false, false, true},
			[1073743478] = {true, false, false, true},
			[1073743479] = {true, false, false, true},
			[1073743494] = {true, true, true, true},
			[1073743494] = {true, true, true, true},
			[1073743492] = {true, true, true, true},
			[1073743491] = {true, true, true, true},
			[1073743490] = {true, true, true, true},
			[1073743490] = {true, true, true, true},
		},
	},
	{
		TaskID = 5174,
		ScendID = 
		{
			[83] = true,
		},
		NPCParam = 
		{
			[61492] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", -120.622, 273.786, -404.997, 0},
			},
			[61495] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 5175,
		ScendID = 
		{
			[83] = true,
		},
		NPCParam = 
		{
			[61519] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[62300] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[62303] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[62306] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[62309] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[62312] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[61600] = { 
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[61495] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[71605] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[61513] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[71602] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 5178,
		ScendID = 
		{
			[83] = true,
		},
		NPCParam = 
		{
			[61603] = { 
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[61606] = { 
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[61609] = { 
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[61612] = { 
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[61519] = { 
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 5181,
		ScendID = 
		{
			[83] = true,
		},
		NPCParam = 
		{
			[71605] = { 
				[-1] = {true, false, false, true, 61498, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[61498] = { 
				[-1] = {false, true, false, false, 61501, GameApi.HashAString("吴天德4"), "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[61501] = { 
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 5182,
		ScendID = 
		{
			[83] = true,
		},
		NPCParam = 
		{
			[61534] = { 
				[-1] = {true, false, false, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 5185,
		ScendID = 
		{
			[83] = true,
		},
		NPCParam = 
		{
			[61534] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 5191,
		ScendID = 
		{
			[83] = true,
		},
		NPCParam = 
		{
			[61522] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[61573] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
		SceneGfxParam = 
		{
			[775] = {false, true, true, false},
			[776] = {false, true, true, false},
			[777] = {false, true, true, false},
			[778] = {false, true, true, false},
			[779] = {false, true, true, false},
			[780] = {false, true, true, false},
			[781] = {false, true, true, false},
			[782] = {false, true, true, false},
			[783] = {false, true, true, false},
			[784] = {false, true, true, false},
			[785] = {false, true, true, false},
			[786] = {false, true, true, false},
			[787] = {false, true, true, false},
			[788] = {false, true, true, false},
			[789] = {false, true, true, false},
			[790] = {false, true, true, false},
			[791] = {false, true, true, false},
			[792] = {false, true, true, false},
			[793] = {false, true, true, false},
			[794] = {false, true, true, false},
			[795] = {false, true, true, false},
			[796] = {false, true, true, false},
			[797] = {false, true, true, false},
			[798] = {false, true, true, false},
			[799] = {false, true, true, false},
			[800] = {false, true, true, false},
			[801] = {false, true, true, false},
			[802] = {false, true, true, false},
			[803] = {false, true, true, false},
		},
	},
	{
		TaskID = 5194,
		ScendID = 
		{
			[83] = true,
		},
		NPCParam = 
		{
			[61576] = { 
				[-1] = {true, true, true, false, 0, 0, "", -133.173, 231.769, 204.295, "", 0, 0, 0, 0},
			},
			[61579] = { 
				[-1] = {true, true, true, false, 0, 0, "", -140.333, 231.844, 194.921, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 5195,
		ScendID = 
		{
			[83] = true,
		},
		NPCParam = 
		{
			[61552] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[61558] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 5196,
		ScendID = 
		{
			[83] = true,
		},
		NPCParam = 
		{
			[61600] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 5198,
		ScendID = 
		{
			[83] = true,
		},
		NPCParam = 
		{
			[62315] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[62318] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[62321] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[62324] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[61555] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[71602] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 5199,
		ScendID = 
		{
			[83] = true,
		},
		NPCParam = 
		{
			[61552] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 169, 262, 75, 0},
			},
			[62327] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 5200,
		ScendID = 
		{
			[83] = true,
		},
		NPCParam = 
		{
			[62330] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 228.033, 285.97, 228.046, 0},
			},
		},
	},
	{
		TaskID = 5201,
		ScendID = 
		{
			[83] = true,
		},
		NPCParam = 
		{
			[61555] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 309.559, 206.232, -73.8995, 0},
			},
			[62315] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 309.559, 206.232, -73.8995, 0},
			},
			[62318] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 309.559, 206.232, -73.8995, 0},
			},
			[62321] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 309.559, 206.232, -73.8995, 0},
			},
			[62324] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 309.559, 206.232, -73.8995, 0},
			},
			[62327] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 309.559, 206.232, -73.8995, 0},
			},
			[61558] = { 
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[61543] = { 
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[61522] = { 
				[-1] = {true, true, true, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 5908,
		ScendID = 
		{
			[83] = true,
		},
		NPCParam = 
		{
			[71614] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 25062, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 5300,
		ScendID = 
		{
			[85] = true,
		},
	},
	{
		TaskID = 5301,
		ScendID = 
		{
			[85] = true,
		},
		NPCParam = 
		{
			[62189] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[62195] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 5305,
		ScendID = 
		{
			[85] = true,
		},
		NPCParam = 
		{
			[62195] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 5307,
		ScendID = 
		{
			[85] = true,
		},
		NPCParam = 
		{
			[62207] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 5313,
		ScendID = 
		{
			[85] = true,
		},
		NPCParam = 
		{
			[62210] = { 
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 5314,
		ScendID = 
		{
			[85] = true,
		},
	},
	{
		TaskID = 5315,
		ScendID = 
		{
			[85] = true,
		},
		NPCParam = 
		{
			[62210] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[62213] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 5316,
		ScendID = 
		{
			[85] = true,
		},
		NPCParam = 
		{
			[62213] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[62216] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 5317,
		ScendID = 
		{
			[85] = true,
		},
	},
	{
		TaskID = 5318,
		ScendID = 
		{
			[85] = true,
		},
		NPCParam = 
		{
			[62216] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[62282] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[62285] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[62288] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[62198] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 5323,
		ScendID = 
		{
			[85] = true,
		},
		NPCParam = 
		{
			[62240] = { 
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 5326,
		ScendID = 
		{
			[85] = true,
		},
		NPCParam = 
		{
			[62240] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[62243] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 5327,
		ScendID = 
		{
			[85] = true,
		},
		NPCParam = 
		{
			[62198] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[62243] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[62204] = { 
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 5328,
		ScendID = 
		{
			[85] = true,
		},
		NPCParam = 
		{
			[62201] = { 
				[-1] = {true, true, false, false, 62192, GameApi.HashAString("00新剧情主线龙泉-任我行-弃剑冢2改为召唤后"), "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[62192] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[62333] = { 
				[-1] = {true, false, false, false, 62291, GameApi.HashAString("00新剧情主线龙泉-老疯子茶馆重逢后"), "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[62291] = { 
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 5329,
		ScendID = 
		{
			[85] = true,
		},
		NPCParam = 
		{
			[62192] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[62291] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 5270,
		ScendID = 
		{
			[80] = true,
		},
		NPCParam = 
		{
			[62049] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[62052] = { 
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 5274,
		ScendID = 
		{
			[80] = true,
		},
		NPCParam = 
		{
			[62061] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[62064] = { 
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 5279,
		ScendID = 
		{
			[80] = true,
		},
		NPCParam = 
		{
			[62067] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[62070] = { 
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[62076] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[71584] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[71587] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[71756] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[71755] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[71754] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[71753] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[71752] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[71566] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[71575] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[71581] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[71578] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[62920] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[62921] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[62922] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[62923] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[62924] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
		SceneGfxParam = 
		{
			[1073747813] = {true, true, true, true},
			[1073747812] = {true, true, true, true},
			[1073747814] = {true, true, true, true},
			[1073747815] = {true, true, true, true},
			[1073747817] = {true, true, true, true},
			[1073747818] = {true, true, true, true},
			[1073747819] = {true, true, true, true},
			[1073747820] = {true, true, true, true},
			[1073747821] = {true, true, true, true},
			[1073747822] = {true, true, true, true},
			[1073747823] = {true, true, true, true},
			[1073747824] = {true, true, true, true},
			[1073747825] = {true, true, true, true},
			[1073747826] = {true, true, true, true},
			[1073747827] = {true, true, true, true},
			[1073747828] = {true, true, true, true},
			[1073747829] = {true, true, true, true},
			[1073747830] = {true, true, true, true},
			[1073747816] = {true, true, true, true},
		},
	},
	{
		TaskID = 5282,
		ScendID = 
		{
			[80] = true,
		},
		NPCParam = 
		{
			[62070] = { 
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 22.4046, 32.6718, 24.5808, 0},
			},
			[62073] = { 
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 5288,
		ScendID = 
		{
			[80] = true,
		},
		NPCParam = 
		{
			[62085] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 159.96, 38.0601, 73.2297, 0},
			},
		},
	},
	{
		TaskID = 5289,
		ScendID = 
		{
			[80] = true,
		},
		NPCParam = 
		{
			[62073] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 5286,
		ScendID = 
		{
			[80] = true,
		},
		SceneGfxParam = 
		{
			[1073747813] = {true, false, false, true},
			[1073747812] = {true, false, false, true},
			[1073747814] = {true, false, false, true},
		},
	},
	{
		TaskID = 5360,
		ScendID = 
		{
			[80] = true,
		},
		SceneGfxParam = 
		{
			[1073747815] = {true, false, false, true},
			[1073747817] = {true, false, false, true},
			[1073747818] = {true, false, false, true},
			[1073747819] = {true, false, false, true},
			[1073747820] = {true, false, false, true},
			[1073747821] = {true, false, false, true},
			[1073747822] = {true, false, false, true},
			[1073747823] = {true, false, false, true},
			[1073747824] = {true, false, false, true},
			[1073747825] = {true, false, false, true},
			[1073747826] = {true, false, false, true},
			[1073747827] = {true, false, false, true},
			[1073747828] = {true, false, false, true},
			[1073747829] = {true, false, false, true},
			[1073747830] = {true, false, false, true},
			[1073747816] = {true, false, false, true},
		},
	},
	{
		TaskID = 5892,
		ScendID = 
		{
			[80] = true,
		},
		NPCParam = 
		{
			[71984] = { 
				[-1] = {true, false, false, true, 71638, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[71638] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 5893,
		ScendID = 
		{
			[80] = true,
		},
		NPCParam = 
		{
			[71638] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[71665] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 25108, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 5347,
		ScendID = 
		{
			[72] = true,
		},
		NPCParam = 
		{
			[63351] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 5219,
		ScendID = 
		{
			[72] = true,
		},
		NPCParam = 
		{
			[63351] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", -120, 98, -162, 0},
			},
		},
	},
	{
		TaskID = 5207,
		ScendID = 
		{
			[1051] = true,
			[68] = true,
		},
		NPCParam = 
		{
			[61737] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 5211,
		ScendID = 
		{
			[68] = true,
		},
		NPCParam = 
		{
			[61731] = { 
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[61740] = { 
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[61707] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 5215,
		ScendID = 
		{
			[68] = true,
		},
		NPCParam = 
		{
			[63243] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 5299,
		ScendID = 
		{
			[68] = true,
		},
		NPCParam = 
		{
			[61731] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[61740] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[62985] = { 
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 5528,
		ScendID = 
		{
			[68] = true,
		},
		NPCParam = 
		{
			[62509] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[61734] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 5210,
		ScendID = 
		{
			[68] = true,
		},
		NPCParam = 
		{
			[61737] = { 
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 5213,
		ScendID = 
		{
			[68] = true,
			[1259] = true,
		},
		NPCParam = 
		{
			[62509] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[61734] = { 
				[GameApi.HashAString("201211福州左挺镖局")] = {true, false, false, true, 62018, GameApi.HashAString("新手追逐副本入口左挺"), "", 0, 0, 0, "", 0, 0, 0, 10000},
			},
			[62018] = { 
				[GameApi.HashAString("新手追逐副本入口左挺")] = {true, false, false, true, 61734, GameApi.HashAString("201211福州左挺镖局"), "", 0, 0, 0, "", 0, 0, 0, 10000},
			},
			[62509] = { 
				[GameApi.HashAString("令狐冲镖局")] = {true, false, false, true, 68322, GameApi.HashAString("追逐副本令狐冲"), "", 0, 0, 0, "", 0, 0, 0, 10000},
			},
			[68322] = { 
				[GameApi.HashAString("追逐副本令狐冲")] = {true, false, false, true, 62509, GameApi.HashAString("令狐冲镖局"), "", 0, 0, 0, "", 0, 0, 0, 10000},
			},
		},
	},
	{
		TaskID = 5367,
		ScendID = 
		{
			[68] = true,
		},
		NPCParam = 
		{
			[63243] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 5233,
		ScendID = 
		{
			[68] = true,
		},
		NPCParam = 
		{
			[68587] = { 
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 5354,
		ScendID = 
		{
			[68] = true,
		},
		NPCParam = 
		{
			[68587] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 5357,
		ScendID = 
		{
			[68] = true,
		},
		NPCParam = 
		{
			[68587] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 5359,
		ScendID = 
		{
			[68] = true,
		},
		NPCParam = 
		{
			[68587] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 5353,
		ScendID = 
		{
			[68] = true,
		},
		NPCParam = 
		{
			[68587] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 5355,
		ScendID = 
		{
			[68] = true,
		},
		NPCParam = 
		{
			[68587] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 5351,
		ScendID = 
		{
			[68] = true,
		},
		NPCParam = 
		{
			[68587] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 5348,
		ScendID = 
		{
			[68] = true,
		},
		NPCParam = 
		{
			[68587] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 5353,
		ScendID = 
		{
			[68] = true,
		},
		NPCParam = 
		{
			[68587] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 5356,
		ScendID = 
		{
			[68] = true,
		},
		NPCParam = 
		{
			[68587] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 5358,
		ScendID = 
		{
			[68] = true,
		},
		NPCParam = 
		{
			[68587] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 5368,
		ScendID = 
		{
			[68] = true,
		},
		NPCParam = 
		{
			[63243] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 5444,
		ScendID = 
		{
			[86] = true,
		},
		NPCParam = 
		{
			[64746] = { 
				[-1] = {false, false, false, true, 64749, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[64749] = { 
				[-1] = {true, false, false, false, 64752, GameApi.HashAString("无名侠士03"), "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[64752] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 5447,
		ScendID = 
		{
			[86] = true,
		},
		NPCParam = 
		{
			[64731] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[64758] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[64734] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[64755] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[66275] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 5449,
		ScendID = 
		{
			[86] = true,
		},
		NPCParam = 
		{
			[64734] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[66275] = { 
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 5450,
		ScendID = 
		{
			[86] = true,
		},
		NPCParam = 
		{
			[64761] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[64776] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[64785] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[64764] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[64779] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[64788] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[64737] = { 
				[-1] = {false, false, true, false, 0, 0, "", 368.52, 75.28, 67.17, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 5451,
		ScendID = 
		{
			[86] = true,
		},
		NPCParam = 
		{
			[64737] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 377.80, 75.63, 75.63, 0},
			},
			[64740] = { 
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[64794] = { 
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[64800] = { 
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 5452,
		ScendID = 
		{
			[86] = true,
		},
		NPCParam = 
		{
			[64770] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 5453,
		ScendID = 
		{
			[86] = true,
		},
		NPCParam = 
		{
			[64770] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[64773] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 5458,
		ScendID = 
		{
			[86] = true,
		},
		NPCParam = 
		{
			[64740] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 43.34, 35.81, 287.74, 0},
			},
		},
	},
	{
		TaskID = 5459,
		ScendID = 
		{
			[86] = true,
		},
		NPCParam = 
		{
			[64794] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 49.67, 35.21, 296.37, 0},
			},
			[64800] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 49.67, 35.21, 296.37, 0},
			},
		},
	},
	{
		TaskID = 5460,
		ScendID = 
		{
			[86] = true,
		},
		NPCParam = 
		{
			[64773] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[64806] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 5461,
		ScendID = 
		{
			[86] = true,
		},
		NPCParam = 
		{
			[64806] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[64809] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[64812] = { 
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[64815] = { 
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
		SceneGfxParam = 
		{
			[1073744543] = {true, true, true, false},
			[1073744544] = {true, true, true, false},
			[1073744545] = {true, true, true, false},
			[1073744546] = {true, true, true, false},
			[1073744547] = {true, true, true, false},
			[1073744548] = {true, true, true, false},
			[1073744549] = {true, true, true, false},
			[1073744550] = {true, true, true, false},
			[1073744551] = {true, true, true, false},
			[1073744552] = {true, true, true, false},
			[1073744553] = {true, true, true, false},
			[1073744554] = {true, true, true, false},
			[1073744555] = {true, true, true, false},
			[1073744556] = {true, true, true, false},
		},
	},
	{
		TaskID = 5464,
		ScendID = 
		{
			[86] = true,
		},
		NPCParam = 
		{
			[64812] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[64815] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 5421,
		ScendID = 
		{
			[90] = true,
		},
		NPCParam = 
		{
			[65729] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 312.342, 66.5349, -194.613, 0},
			},
			[65732] = { 
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 5423,
		ScendID = 
		{
			[90] = true,
		},
		NPCParam = 
		{
			[65732] = { 
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 272.809, 63.3071, -309.544, 0},
			},
			[65735] = { 
				[-1] = {false, true, true, false, 0, 0, "", 53.7006, 68.1322, -310.374, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 5424,
		ScendID = 
		{
			[90] = true,
		},
		NPCParam = 
		{
			[65735] = { 
				[-1] = {false, false, false, true, 65744, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[65744] = { 
				[-1] = {true, true, false, false, 65753, GameApi.HashAString("00新剧情桂林阿英村子"), "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[65738] = { 
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[65747] = { 
				[-1] = {false, false, false, true, 65750, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[65750] = { 
				[-1] = {true, true, false, false, 65753, GameApi.HashAString("00新剧情桂林阿英村子"), "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[65753] = { 
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 5426,
		ScendID = 
		{
			[90] = true,
		},
		NPCParam = 
		{
			[65753] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 11, 52, -28, 0},
			},
		},
	},
	{
		TaskID = 5428,
		ScendID = 
		{
			[90] = true,
		},
		NPCParam = 
		{
			[65738] = { 
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 11, 52, -28, 0},
			},
			[65741] = { 
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
		SceneGfxParam = 
		{
			[1073747972] = {false, false, true, false},
			[1073747975] = {false, false, true, false},
			[1073747976] = {false, false, true, false},
			[1073747977] = {false, false, true, false},
			[1073747969] = {false, false, true, false},
		},
	},
	{
		TaskID = 5430,
		ScendID = 
		{
			[90] = true,
		},
		NPCParam = 
		{
			[65762] = { 
				[-1] = {true, true, false, true, 65765, GameApi.HashAString("00新剧情桂林阿诗玛蜈蚣"), "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[65765] = { 
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
		SceneGfxParam = 
		{
			[1073747968] = {false, false, true, false},
			[1073747970] = {false, false, true, false},
			[1073747971] = {false, false, true, false},
		},
	},
	{
		TaskID = 5432,
		ScendID = 
		{
			[90] = true,
		},
		NPCParam = 
		{
			[65983] = { 
				[-1] = {true, true, true, false, 0, 0, "", -93, 52, 39, "", 0, 0, 0, 0},
			},
			[65774] = { 
				[-1] = {false, false, true, false, 0, 0, "", -90, 49, 33, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 5436,
		ScendID = 
		{
			[90] = true,
		},
		NPCParam = 
		{
			[65783] = { 
				[-1] = {false, true, true, false, 0, 0, "", -90, 49, 33, "", 0, 0, 0, 0},
			},
			[65789] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 5437,
		ScendID = 
		{
			[90] = true,
		},
		NPCParam = 
		{
			[65777] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 5438,
		ScendID = 
		{
			[90] = true,
		},
		NPCParam = 
		{
			[65783] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 54, 53, 51, 0},
			},
			[65780] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[65789] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 54, 53, 51, 0},
			},
		},
	},
	{
		TaskID = 5440,
		ScendID = 
		{
			[90] = true,
		},
		NPCParam = 
		{
			[65810] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[65813] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[65816] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[65819] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 5441,
		ScendID = 
		{
			[90] = true,
		},
		NPCParam = 
		{
			[65786] = { 
				[-1] = {true, true, true, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 5393,
		ScendID = 
		{
			[84] = true,
		},
		SceneGfxParam = 
		{
			[1073743274] = {false, true, true, false},
			[1073743280] = {false, true, true, false},
			[1073743279] = {false, true, true, false},
		},
	},
	{
		TaskID = 5400,
		ScendID = 
		{
			[84] = true,
		},
		NPCParam = 
		{
			[64385] = { 
				[-1] = {false, true, true, false, 0, 0, "", 75, 166, 281, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 5401,
		ScendID = 
		{
			[84] = true,
		},
		NPCParam = 
		{
			[64370] = { 
				[-1] = {true, false, false, true, 64448, GameApi.HashAString("主线-洛星辰1"), "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[64448] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 5402,
		ScendID = 
		{
			[84] = true,
		},
		NPCParam = 
		{
			[64385] = { 
				[-1] = {false, false, false, true, 64427, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[64427] = { 
				[-1] = {true, true, false, false, 0, 0, "", 0, 0, 0, "", -165, 156, 258, 0},
			},
		},
	},
	{
		TaskID = 5404,
		ScendID = 
		{
			[84] = true,
		},
		SceneGfxParam = 
		{
			[1073743283] = {false, true, true, false},
			[1073743284] = {false, true, true, false},
			[1073743285] = {false, true, true, false},
			[1073743286] = {false, true, true, false},
			[1073743287] = {false, true, true, false},
		},
	},
	{
		TaskID = 5408,
		ScendID = 
		{
			[84] = true,
		},
		NPCParam = 
		{
			[64343] = { 
				[-1] = {false, false, true, false, 0, 0, "", -215, 156, 292, "", 0, 0, 0, 0},
			},
		},
		SceneGfxParam = 
		{
			[1073743281] = {true, false, false, true},
			[1073743282] = {true, false, false, true},
		},
	},
	{
		TaskID = 5410,
		ScendID = 
		{
			[84] = true,
		},
		NPCParam = 
		{
			[64340] = { 
				[-1] = {false, false, false, true, 64433, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[64343] = { 
				[-1] = {false, false, false, true, 64436, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[64433] = { 
				[-1] = {true, true, false, false, 64346, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[64436] = { 
				[-1] = {true, true, false, false, 64349, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[64346] = { 
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[64349] = { 
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 5412,
		ScendID = 
		{
			[84] = true,
		},
		NPCParam = 
		{
			[64346] = { 
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", -143, 135, 91, 0},
			},
			[64349] = { 
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", -141, 135, 89, 0},
			},
			[64352] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[64355] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 5413,
		ScendID = 
		{
			[84] = true,
		},
		NPCParam = 
		{
			[64403] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", -92, 45, -208, 0},
			},
		},
	},
	{
		TaskID = 5501,
		ScendID = 
		{
			[91] = true,
		},
		NPCParam = 
		{
			[66278] = { 
				[-1] = {false, true, true, false, 0, 0, "", -12, 34, 50, "", 0, 0, 0, 0},
			},
			[65654] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", -38, 34, -33, 0},
			},
			[65657] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", -38, 34, -33, 0},
			},
		},
	},
	{
		TaskID = 5503,
		ScendID = 
		{
			[91] = true,
		},
		NPCParam = 
		{
			[65663] = { 
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[76156] = { 
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 5554,
		ScendID = 
		{
			[79] = true,
		},
		NPCParam = 
		{
			[67343] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 5556,
		ScendID = 
		{
			[79] = true,
		},
		NPCParam = 
		{
			[59352] = { 
				[-1] = {false, true, true, false, 0, 0, "", -330.7, 102.46, -104.13, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 5557,
		ScendID = 
		{
			[79] = true,
		},
		NPCParam = 
		{
			[67346] = { 
				[-1] = {false, true, true, false, 0, 0, "", -185.26, 53.53, -355.474, "", 0, 0, 0, 0},
			},
			[67409] = { 
				[-1] = {false, true, true, false, 0, 0, "", -185.26, 53.53, -355.474, "", 0, 0, 0, 0},
			},
			[59361] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[59355] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 5561,
		ScendID = 
		{
			[79] = true,
		},
		NPCParam = 
		{
			[67425] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 5562,
		ScendID = 
		{
			[79] = true,
		},
		NPCParam = 
		{
			[67399] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 378.74, 72.18, -196.33, 0},
			},
		},
	},
	{
		TaskID = 5564,
		ScendID = 
		{
			[79] = true,
		},
		NPCParam = 
		{
			[67401] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[67402] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 5597,
		ScendID = 
		{
			[81] = true,
		},
		NPCParam = 
		{
			[67726] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[68114] = { 
				[-1] = {false, false, true, false, 0, 0, "", 24724, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 5598,
		ScendID = 
		{
			[81] = true,
		},
		NPCParam = 
		{
			[68114] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 227.2, 106, 236, 0},
			},
			[67696] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 227.2, 106, 236, 0},
			},
			[67813] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 227.2, 106, 236, 0},
			},
			[67810] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 227.2, 106, 236, 0},
			},
			[68123] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 227.2, 106, 236, 0},
			},
			[68120] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 227.2, 106, 236, 0},
			},
		},
	},
	{
		TaskID = 5599,
		ScendID = 
		{
			[81] = true,
		},
		NPCParam = 
		{
			[67699] = { 
				[-1] = {false, false, false, true, 67708, 0, "0", 0, 0, 0, "0", 0, 0, 0, 0},
			},
			[67708] = { 
				[-1] = {true, false, false, false, 67702, GameApi.HashAString("五霸岗令狐冲"), "0", 0, 0, 0, "0", -55.022, 152.07, 250.776, 0},
			},
			[67702] = { 
				[-1] = {false, true, true, false, 0, 0, "0", 0, 0, 0, "0", 0, 0, 0, 0},
			},
			[67690] = { 
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[67894] = { 
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[67897] = { 
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[67900] = { 
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[67903] = { 
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[67906] = { 
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[67909] = { 
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[67912] = { 
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 5602,
		ScendID = 
		{
			[81] = true,
		},
		NPCParam = 
		{
			[68126] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 24804, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 5604,
		ScendID = 
		{
			[81] = true,
		},
		NPCParam = 
		{
			[67861] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", -35.46, 148.09, 240.836, 0},
			},
			[67858] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", -35.46, 148.09, 240.836, 0},
			},
			[67864] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", -35.46, 148.09, 240.836, 0},
			},
			[67867] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", -35.46, 148.09, 240.836, 0},
			},
			[67870] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", -35.46, 148.09, 240.836, 0},
			},
		},
	},
	{
		TaskID = 5606,
		ScendID = 
		{
			[81] = true,
		},
		NPCParam = 
		{
			[67738] = { 
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", -39.2, 147.937, 239.3, 0},
			},
		},
	},
	{
		TaskID = 5609,
		ScendID = 
		{
			[81] = true,
		},
		NPCParam = 
		{
			[67744] = { 
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", -34.129, 148.98, 243.94, 0},
			},
		},
	},
	{
		TaskID = 5610,
		ScendID = 
		{
			[81] = true,
		},
		NPCParam = 
		{
			[67690] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", -7.13, 139.8, 210.7, 0},
			},
			[67873] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", -7.13, 139.8, 210.7, 0},
			},
			[67876] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", -7.13, 139.8, 210.7, 0},
			},
			[67879] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", -7.13, 139.8, 210.7, 0},
			},
			[67882] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", -7.13, 139.8, 210.7, 0},
			},
			[67885] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", -7.13, 139.8, 210.7, 0},
			},
			[67888] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", -7.13, 139.8, 210.7, 0},
			},
			[67891] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", -7.13, 139.8, 210.7, 0},
			},
			[60388] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", -7.13, 139.8, 210.7, 0},
			},
		},
	},
	{
		TaskID = 5611,
		ScendID = 
		{
			[81] = true,
		},
		NPCParam = 
		{
			[67732] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", -7.13, 139.8, 210.7, 0},
			},
			[67819] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", -7.13, 139.8, 210.7, 0},
			},
			[67816] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", -7.13, 139.8, 210.7, 0},
			},
			[60390] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", -7.13, 139.8, 210.7, 0},
			},
			[67825] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", -7.13, 139.8, 210.7, 0},
			},
			[67828] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", -7.13, 139.8, 210.7, 0},
			},
			[68137] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", -7.13, 139.8, 210.7, 0},
			},
			[67831] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", -7.13, 139.8, 210.7, 0},
			},
			[67834] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", -7.13, 139.8, 210.7, 0},
			},
			[67822] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", -7.13, 139.8, 210.7, 0},
			},
		},
	},
	{
		TaskID = 5612,
		ScendID = 
		{
			[81] = true,
		},
		NPCParam = 
		{
			[67750] = { 
				[-1] = {true, true, true, false, 0, 0, "", -41.67, 149.67, 243.82, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 5613,
		ScendID = 
		{
			[81] = true,
		},
		NPCParam = 
		{
			[67942] = { 
				[-1] = {false, false, true, false, 0, 0, "", -24.65, 141.45, 226.5, "", 0, 0, 0, 0},
			},
			[67936] = { 
				[-1] = {false, false, true, false, 0, 0, "", -24.65, 141.45, 226.5, "", 0, 0, 0, 0},
			},
			[67924] = { 
				[-1] = {false, false, true, false, 0, 0, "", -24.65, 141.45, 226.5, "", 0, 0, 0, 0},
			},
			[67930] = { 
				[-1] = {false, false, true, false, 0, 0, "", -24.65, 141.45, 226.5, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 5614,
		ScendID = 
		{
			[81] = true,
		},
		NPCParam = 
		{
			[67750] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[68680] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[67702] = { 
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[68686] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 5840,
		ScendID = 
		{
			[81] = true,
		},
		NPCParam = 
		{
			[68680] = { 
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "移动_通用", 24801, 0, 0, 0},
			},
			[68686] = { 
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "战斗奔跑", 24802, 0, 0, 0},
			},
			[67684] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[67711] = { 
				[-1] = {true, true, true, false, 68686, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[67756] = { 
				[-1] = {true, true, true, false, 68680, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 5619,
		ScendID = 
		{
			[81] = true,
		},
		NPCParam = 
		{
			[67756] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[67762] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 5622,
		ScendID = 
		{
			[81] = true,
		},
		NPCParam = 
		{
			[67684] = { 
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", -110.34, 34.254, -196.707, 0},
			},
		},
		SceneGfxParam = 
		{
			[1073743577] = {false, true, true, false},
			[1073743578] = {false, true, true, false},
			[1073743579] = {false, true, true, false},
			[1073743580] = {false, true, true, false},
			[1073743581] = {false, true, true, false},
			[1073743582] = {false, true, true, false},
			[1073743583] = {false, true, true, false},
			[1073743584] = {false, true, true, false},
		},
	},
	{
		TaskID = 5623,
		ScendID = 
		{
			[81] = true,
		},
		NPCParam = 
		{
			[67927] = { 
				[-1] = {false, true, true, false, 0, 0, "", -284.164, 48.707, -251.899, "", 0, 0, 0, 0},
			},
			[67933] = { 
				[-1] = {false, true, true, false, 0, 0, "", -284.164, 48.707, -251.899, "", 0, 0, 0, 0},
			},
			[67945] = { 
				[-1] = {false, true, true, false, 0, 0, "", -284.164, 48.707, -251.899, "", 0, 0, 0, 0},
			},
			[67765] = { 
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
		SceneGfxParam = 
		{
			[1073743585] = {false, true, true, false},
			[1073743586] = {false, true, true, false},
			[1073743587] = {false, true, true, false},
			[1073743588] = {false, true, true, false},
			[1073743589] = {false, true, true, false},
			[1073743590] = {false, true, true, false},
			[1073743591] = {false, true, true, false},
			[1073743592] = {false, true, true, false},
		},
	},
	{
		TaskID = 5625,
		ScendID = 
		{
			[81] = true,
		},
		NPCParam = 
		{
			[67762] = { 
				[-1] = {false, false, false, true, 67753, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[67711] = { 
				[-1] = {false, false, false, true, 67708, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[67714] = { 
				[-1] = {false, true, true, false, 67708, 0, "0", 0, 0, 0, "0", 0, 0, 0, 0},
			},
			[67759] = { 
				[-1] = {false, true, true, false, 67753, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[67753] = { 
				[-1] = {true, false, false, true, 67759, GameApi.HashAString("五霸寺任盈盈"), "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[67708] = { 
				[-1] = {true, false, false, true, 67714, GameApi.HashAString("五霸寺令狐冲"), "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 5767,
		ScendID = 
		{
			[69] = true,
		},
		NPCParam = 
		{
			[70513] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "死亡", 0, 0, 0, 3},
			},
		},
	},
	{
		TaskID = 5896,
		ScendID = 
		{
			[82] = true,
		},
		NPCParam = 
		{
			[71851] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 5899,
		ScendID = 
		{
			[82] = true,
		},
		NPCParam = 
		{
			[71458] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 201.2, 37.3, 236, 0},
			},
		},
	},
	{
		TaskID = 5885,
		ScendID = 
		{
			[80] = true,
		},
		SceneGfxParam = 
		{
			[1073747265] = {false, true, true, false},
			[1073747267] = {false, true, true, false},
			[1073747266] = {false, true, true, false},
			[1073747269] = {false, false, true, false},
		},
	},
	{
		TaskID = 5900,
		ScendID = 
		{
			[82] = true,
		},
		NPCParam = 
		{
			[71913] = { 
				[-1] = {true, false, false, false, 71464, GameApi.HashAString("NpcGenerator_113"), "", 0, 0, 0, "", 25013, 0, 0, 0},
			},
			[71464] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 5914,
		ScendID = 
		{
			[80] = true,
		},
		SceneModelParam = 
		{
			[1073747115] = {false, true, false, false},
			[1073747116] = {false, true, false, false},
			[1073747113] = {false, true, false, false},
			[1073747114] = {false, true, false, false},
			[1073747117] = {false, true, false, false},
			[1073747118] = {false, true, false, false},
			[1073747119] = {false, true, false, false},
			[1073747120] = {false, true, false, false},
			[1073747225] = {false, true, false, false},
			[1073747224] = {false, true, false, false},
			[1073747122] = {false, true, false, false},
			[1073747121] = {false, true, false, false},
			[1073747223] = {false, true, false, false},
			[1073747222] = {false, true, false, false},
			[1073747105] = {false, true, false, false},
			[1073747104] = {false, true, false, false},
			[1073747107] = {false, true, false, false},
			[1073747108] = {false, true, false, false},
			[1073747111] = {false, true, false, false},
			[1073747112] = {false, true, false, false},
		},
	},
	{
		TaskID = 6027,
		ScendID = 
		{
			[82] = true,
		},
		SceneGfxParam = 
		{
			[1073748538] = {false, true, true, false},
			[1073748540] = {false, true, true, false},
		},
	},
	{
		TaskID = 6044,
		ScendID = 
		{
			[82] = true,
		},
		SceneGfxParam = 
		{
			[1073748538] = {true, true, false, true},
			[1073748540] = {true, true, false, true},
		},
	},
	{
		TaskID = 6041,
		ScendID = 
		{
			[71] = true,
		},
		NPCParam = 
		{
			[72689] = { 
				[-1] = {false, false, false, true, 72690, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[72690] = { 
				[-1] = {true, false, false, false, 72691, GameApi.HashAString("阿离村子"), "", 0, 0, 0, "", 77, 44.5, -195, 0},
			},
			[72691] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 6043,
		ScendID = 
		{
			[71] = true,
		},
		NPCParam = 
		{
			[72691] = { 
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "死亡_通用", 0, 0, 0, 3},
			},
			[72693] = { 
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 6215,
		ScendID = 
		{
			[75] = true,
		},
	},
	{
		TaskID = 6218,
		ScendID = 
		{
			[77] = true,
		},
		NPCParam = 
		{
			[74073] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 25693, 0, 0, 0},
			},
			[74076] = { 
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 6223,
		ScendID = 
		{
			[77] = true,
		},
		NPCParam = 
		{
			[74082] = { 
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 93, 88, -232, 0},
			},
			[74085] = { 
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 6199,
		ScendID = 
		{
			[84] = true,
		},
		SceneModelParam = 
		{
			[1073744601] = {false, true, false, false},
		},
	},
	{
		TaskID = 6228,
		ScendID = 
		{
			[69] = true,
		},
		NPCParam = 
		{
			[73932] = { 
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[73935] = { 
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[73929] = { 
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[73911] = { 
				[-1] = {false, false, true, false, 0, 0, "", 25659, 0, 0, "", 0, 0, 0, 0},
			},
			[73914] = { 
				[-1] = {false, false, true, false, 0, 0, "", 25660, 0, 0, "", 0, 0, 0, 0},
			},
			[73917] = { 
				[-1] = {false, false, true, false, 0, 0, "", 25661, 0, 0, "", 0, 0, 0, 0},
			},
			[73920] = { 
				[-1] = {false, false, true, false, 0, 0, "", 25662, 0, 0, "", 0, 0, 0, 0},
			},
			[73923] = { 
				[-1] = {false, false, true, false, 0, 0, "", 25664, 0, 0, "", 0, 0, 0, 0},
			},
			[73926] = { 
				[-1] = {false, false, true, false, 0, 0, "", 25663, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 6258,
		ScendID = 
		{
			[69] = true,
		},
		NPCParam = 
		{
			[73938] = { 
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[73941] = { 
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[73944] = { 
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[73947] = { 
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[73950] = { 
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[73953] = { 
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[73956] = { 
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[74414] = { 
				[-1] = {true, false, false, false, 0, 0, "", 0, 0, 0, "", 25675, 0, 0, 0},
			},
			[73911] = { 
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[73914] = { 
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[73917] = { 
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[73920] = { 
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[73923] = { 
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[73926] = { 
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[73929] = { 
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 3859,
		ScendID = 
		{
			[69] = true,
		},
		NPCParam = 
		{
			[74391] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 25657, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 6259,
		ScendID = 
		{
			[69] = true,
		},
		NPCParam = 
		{
			[73965] = { 
				[-1] = {false, false, false, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[73968] = { 
				[-1] = {false, false, false, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[73971] = { 
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[73974] = { 
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[73977] = { 
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[73980] = { 
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[73983] = { 
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[73986] = { 
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[73989] = { 
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 6231,
		ScendID = 
		{
			[69] = true,
		},
		NPCParam = 
		{
			[73959] = { 
				[-1] = {false, true, true, false, 0, 0, "", 25800, 0, 0, "", 0, 0, 0, 0},
			},
			[73962] = { 
				[-1] = {false, true, true, false, 0, 0, "", 25799, 0, 0, "", 0, 0, 0, 0},
			},
			[73932] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[73935] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[74993] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 6233,
		ScendID = 
		{
			[69] = true,
		},
		NPCParam = 
		{
			[74993] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 6127,
		ScendID = 
		{
			[84] = true,
		},
		SceneGfxParam = 
		{
			[1073744656] = {false, true, true, false},
		},
	},
	{
		TaskID = 6232,
		ScendID = 
		{
			[69] = true,
		},
		NPCParam = 
		{
			[73959] = { 
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 25851, 0, 0, 0},
			},
			[73962] = { 
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 25852, 0, 0, 0},
			},
			[73938] = { 
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[73941] = { 
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[73944] = { 
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[73947] = { 
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[73950] = { 
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[73953] = { 
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[73956] = { 
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[73965] = { 
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[73968] = { 
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[73971] = { 
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[73974] = { 
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[73977] = { 
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[73980] = { 
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[73986] = { 
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[73989] = { 
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[73983] = { 
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 6260,
		ScendID = 
		{
			[72] = true,
			[68] = true,
			[4] = true,
			[69] = true,
			[76] = true,
		},
		NPCParam = 
		{
			[72924] = { 
				[-1] = {true, true, true, true, 0, 0, "", 1, 1, 1, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 6261,
		ScendID = 
		{
			[72] = true,
			[68] = true,
			[4] = true,
			[69] = true,
			[76] = true,
		},
		NPCParam = 
		{
			[72924] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 1, 1, 1, 0},
			},
		},
	},
	{
		TaskID = 6262,
		ScendID = 
		{
			[72] = true,
			[68] = true,
			[4] = true,
			[69] = true,
			[76] = true,
		},
		NPCParam = 
		{
			[72934] = { 
				[-1] = {true, true, true, true, 0, 0, "", 1, 1, 1, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 6263,
		ScendID = 
		{
			[72] = true,
			[68] = true,
			[4] = true,
			[69] = true,
			[76] = true,
		},
		NPCParam = 
		{
			[72934] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 1, 1, 1, 0},
			},
		},
	},
	{
		TaskID = 6264,
		ScendID = 
		{
			[72] = true,
			[68] = true,
			[4] = true,
			[69] = true,
			[76] = true,
		},
		NPCParam = 
		{
			[75199] = { 
				[-1] = {true, true, true, true, 0, 0, "", 1, 1, 1, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 6265,
		ScendID = 
		{
			[72] = true,
			[68] = true,
			[4] = true,
			[69] = true,
			[76] = true,
		},
		NPCParam = 
		{
			[75199] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 1, 1, 1, 0},
			},
		},
	},
	{
		TaskID = 6266,
		ScendID = 
		{
			[72] = true,
			[68] = true,
			[4] = true,
			[69] = true,
			[76] = true,
		},
		NPCParam = 
		{
			[75202] = { 
				[-1] = {true, true, true, true, 0, 0, "", 1, 1, 1, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 6267,
		ScendID = 
		{
			[72] = true,
			[68] = true,
			[4] = true,
			[69] = true,
			[76] = true,
		},
		NPCParam = 
		{
			[75202] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 1, 1, 1, 0},
			},
		},
	},
	{
		TaskID = 6268,
		ScendID = 
		{
			[72] = true,
			[68] = true,
			[4] = true,
			[69] = true,
			[76] = true,
		},
		NPCParam = 
		{
			[75205] = { 
				[-1] = {true, true, true, true, 0, 0, "", 1, 1, 1, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 6269,
		ScendID = 
		{
			[72] = true,
			[68] = true,
			[4] = true,
			[69] = true,
			[76] = true,
		},
		NPCParam = 
		{
			[75205] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 1, 1, 1, 0},
			},
		},
	},
	{
		TaskID = 6497,
		ScendID = 
		{
			[66] = true,
		},
		NPCParam = 
		{
			[75653] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 6501,
		ScendID = 
		{
			[6] = true,
		},
		NPCParam = 
		{
			[75644] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 6505,
		ScendID = 
		{
			[74] = true,
		},
		NPCParam = 
		{
			[75645] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 6509,
		ScendID = 
		{
			[5] = true,
		},
		NPCParam = 
		{
			[75647] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 6513,
		ScendID = 
		{
			[93] = true,
		},
		NPCParam = 
		{
			[75646] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 6517,
		ScendID = 
		{
			[42] = true,
		},
		NPCParam = 
		{
			[75648] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 6521,
		ScendID = 
		{
			[26] = true,
		},
		NPCParam = 
		{
			[75649] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 6525,
		ScendID = 
		{
			[18] = true,
		},
		NPCParam = 
		{
			[75650] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 6529,
		ScendID = 
		{
			[94] = true,
		},
		NPCParam = 
		{
			[75651] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 6533,
		ScendID = 
		{
			[31] = true,
		},
		NPCParam = 
		{
			[75652] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 6612,
		ScendID = 
		{
			[86] = true,
		},
		NPCParam = 
		{
			[76540] = { 
				[GameApi.HashAString("2013江湖榜-桑巴村虫子01")] = {true, false, false, true, 0, 0, "", 0, 0, 0, "战斗奔跑", 26282, 0, 0, 0},
				[GameApi.HashAString("2013江湖榜-桑巴村虫子03")] = {true, false, false, true, 0, 0, "", 0, 0, 0, "战斗奔跑", 26284, 0, 0, 0},
				[GameApi.HashAString("2013江湖榜-桑巴村虫子04")] = {true, false, false, true, 0, 0, "", 0, 0, 0, "战斗奔跑", 26286, 0, 0, 0},
				[GameApi.HashAString("2013江湖榜-桑巴村虫子06")] = {true, false, false, true, 0, 0, "", 0, 0, 0, "战斗奔跑", 26288, 0, 0, 0},
			},
			[76539] = { 
				[GameApi.HashAString("2013江湖榜-桑巴村虫子02")] = {true, false, false, true, 0, 0, "", 0, 0, 0, "战斗奔跑", 26283, 0, 0, 0},
				[GameApi.HashAString("2013江湖榜-桑巴村虫子05")] = {true, false, false, true, 0, 0, "", 0, 0, 0, "战斗奔跑", 26287, 0, 0, 0},
				[GameApi.HashAString("2013江湖榜-桑巴村虫子07")] = {true, false, false, true, 0, 0, "", 0, 0, 0, "战斗奔跑", 26289, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 6633,
		ScendID = 
		{
			[90] = true,
		},
		NPCParam = 
		{
			[77198] = { 
				[-1] = {false, true, false, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 6597,
		ScendID = 
		{
			[68] = true,
		},
		NPCParam = 
		{
			[76921] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 26697, 0, 0, 0},
			},
			[76919] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 26697, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 6598,
		ScendID = 
		{
			[68] = true,
		},
		NPCParam = 
		{
			[45191] = { 
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[76923] = { 
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 6739,
		NPCParam = 
		{
			[77003] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 6740,
		NPCParam = 
		{
			[77000] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[77003] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 6744,
		ScendID = 
		{
			[82] = true,
		},
		NPCParam = 
		{
			[77009] = { 
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 6726,
		ScendID = 
		{
			[79] = true,
		},
		NPCParam = 
		{
			[76782] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[76783] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[76784] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 6727,
		ScendID = 
		{
			[79] = true,
		},
		NPCParam = 
		{
			[76783] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[76784] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 6567,
		ScendID = 
		{
			[82] = true,
		},
		NPCParam = 
		{
			[76157] = { 
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[76158] = { 
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[76160] = { 
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[76161] = { 
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[77624] = { 
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 6568,
		ScendID = 
		{
			[82] = true,
		},
		NPCParam = 
		{
			[76159] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[76160] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 6570,
		ScendID = 
		{
			[82] = true,
		},
		NPCParam = 
		{
			[76159] = { 
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[77624] = { 
				[-1] = {false, false, false, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 6572,
		ScendID = 
		{
			[82] = true,
		},
		NPCParam = 
		{
			[76161] = { 
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[76157] = { 
				[-1] = {false, false, false, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[76158] = { 
				[-1] = {false, false, false, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 6809,
		ScendID = 
		{
			[72] = true,
		},
		NPCParam = 
		{
			[76475] = { 
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 7050,
		ScendID = 
		{
			[72] = true,
		},
		NPCParam = 
		{
			[76475] = { 
				[-1] = {false, true, false, true, 0, 0, "", 0, 0, 0, "", -109, 113, 311, 0},
			},
		},
	},
	{
		TaskID = 7109,
		ScendID = 
		{
			[68] = true,
		},
		NPCParam = 
		{
			[62509 ] = { 
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[61734] = { 
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 7111,
		ScendID = 
		{
			[68] = true,
		},
		NPCParam = 
		{
			[62509 ] = { 
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[61734] = { 
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 7112,
		ScendID = 
		{
			[68] = true,
		},
		NPCParam = 
		{
			[62509 ] = { 
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[61734] = { 
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 7113,
		ScendID = 
		{
			[68] = true,
		},
		NPCParam = 
		{
			[62509 ] = { 
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[61734] = { 
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 7114,
		ScendID = 
		{
			[68] = true,
		},
		NPCParam = 
		{
			[62509 ] = { 
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[61734] = { 
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 7115,
		ScendID = 
		{
			[68] = true,
		},
		NPCParam = 
		{
			[62509 ] = { 
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[61734] = { 
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 7116,
		ScendID = 
		{
			[68] = true,
		},
		NPCParam = 
		{
			[62509 ] = { 
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[61734] = { 
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 7117,
		ScendID = 
		{
			[68] = true,
		},
		NPCParam = 
		{
			[62509 ] = { 
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[61734] = { 
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 7118,
		ScendID = 
		{
			[68] = true,
		},
		NPCParam = 
		{
			[62509 ] = { 
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[61734] = { 
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 7119,
		ScendID = 
		{
			[68] = true,
		},
		NPCParam = 
		{
			[62509 ] = { 
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[61734] = { 
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 6644,
		ScendID = 
		{
			[82] = true,
			[83] = true,
		},
		NPCParam = 
		{
			[76183] = { 
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[76994] = { 
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 6651,
		ScendID = 
		{
			[82] = true,
			[83] = true,
		},
		NPCParam = 
		{
			[76183] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[76994] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 6652,
		ScendID = 
		{
			[66] = true,
			[76] = true,
		},
		NPCParam = 
		{
			[76185] = { 
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[76186] = { 
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[76187] = { 
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[76205] = { 
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 6668,
		ScendID = 
		{
			[66] = true,
		},
		NPCParam = 
		{
			[76186] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 6670,
		ScendID = 
		{
			[66] = true,
			[76] = true,
		},
		NPCParam = 
		{
			[76185] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 26798, 0, 0, 0},
			},
			[76187] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[76205] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 6657,
		ScendID = 
		{
			[66] = true,
		},
		NPCParam = 
		{
			[76188] = { 
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[76189] = { 
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[76190] = { 
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[76191] = { 
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 6665,
		ScendID = 
		{
			[66] = true,
		},
		NPCParam = 
		{
			[76188] = { 
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[76189] = { 
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[76190] = { 
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[76191] = { 
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 6671,
		ScendID = 
		{
			[67] = true,
			[75] = true,
			[82] = true,
		},
		NPCParam = 
		{
			[76207] = { 
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[76208] = { 
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[76209] = { 
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[76210] = { 
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 6683,
		ScendID = 
		{
			[67] = true,
			[75] = true,
			[82] = true,
		},
		NPCParam = 
		{
			[76207] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[76208] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 26799, 0, 0, 0},
			},
			[76209] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[76210] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 6960,
		ScendID = 
		{
			[76] = true,
		},
		NPCParam = 
		{
			[76279] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[76280] = { 
				[-1] = {false, true, true, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[76281] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[76274] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[76275] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[76276] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 6964,
		ScendID = 
		{
			[31] = true,
		},
		NPCParam = 
		{
			[76283] = { 
				[-1] = {true, true, true, false, 0, 0, "", 26800, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 6965,
		ScendID = 
		{
			[100] = true,
		},
		NPCParam = 
		{
			[76284] = { 
				[-1] = {true, true, true, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 6966,
		ScendID = 
		{
			[100] = true,
		},
		NPCParam = 
		{
			[76284] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 6967,
		ScendID = 
		{
			[31] = true,
			[91] = true,
		},
		NPCParam = 
		{
			[76283] = { 
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 26801, 0, 0, 0},
			},
			[76285] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[76286] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 6969,
		ScendID = 
		{
			[91] = true,
			[31] = true,
		},
		NPCParam = 
		{
			[76286] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 26736, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 6973,
		ScendID = 
		{
			[72] = true,
		},
		NPCParam = 
		{
			[76289] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 6974,
		ScendID = 
		{
			[72] = true,
		},
		NPCParam = 
		{
			[76290] = { 
				[-1] = {true, true, true, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
		SceneGfxParam = 
		{
			[1073745211] = {true, false, false, false},
		},
	},
	{
		TaskID = 6976,
		ScendID = 
		{
			[72] = true,
		},
		NPCParam = 
		{
			[76290] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[76293] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 6978,
		ScendID = 
		{
			[72] = true,
		},
		NPCParam = 
		{
			[76294] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[76295] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[76296] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[76297] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[76298] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[76299] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[76300] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[76301] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[76302] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[76303] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[76304] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 6979,
		ScendID = 
		{
			[72] = true,
		},
		NPCParam = 
		{
			[76292] = { 
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 6980,
		ScendID = 
		{
			[68] = true,
		},
		NPCParam = 
		{
			[76305] = { 
				[-1] = {true, true, true, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[76306] = { 
				[-1] = {true, true, true, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[76307] = { 
				[-1] = {true, true, true, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[76308] = { 
				[-1] = {true, true, true, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[76309] = { 
				[-1] = {true, true, true, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[76310] = { 
				[-1] = {true, true, true, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[76328] = { 
				[-1] = {true, true, true, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[76329] = { 
				[-1] = {true, true, true, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[76330] = { 
				[-1] = {true, true, true, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[76331] = { 
				[-1] = {true, true, true, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[76332] = { 
				[-1] = {true, true, true, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[76333] = { 
				[-1] = {true, true, true, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[77166] = { 
				[-1] = {true, true, true, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 6914,
		ScendID = 
		{
			[67] = true,
		},
		NPCParam = 
		{
			[76490] = { 
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 6916,
		ScendID = 
		{
			[91] = true,
		},
		NPCParam = 
		{
			[76487] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 310, 186, 388, 0},
			},
			[78089] = { 
				[-1] = {false, false, true, false, 0, 0, "", 343, 189, 381, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 6917,
		ScendID = 
		{
			[67] = true,
			[91] = true,
		},
		NPCParam = 
		{
			[76490] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[78596] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 7050,
		ScendID = 
		{
			[72] = true,
		},
		NPCParam = 
		{
			[78041] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 7282,
		ScendID = 
		{
			[102] = true,
		},
		NPCParam = 
		{
			[78654] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[78891] = { 
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 7285,
		ScendID = 
		{
			[102] = true,
		},
		NPCParam = 
		{
			[78643] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[78644] = { 
				[-1] = {false, true, true, false, 0, 0, "", 26870, 0, 0, "", 0, 0, 0, 0},
			},
			[78903] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[78904] = { 
				[-1] = {true, true, true, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 7289,
		ScendID = 
		{
			[102] = true,
		},
		NPCParam = 
		{
			[78645] = { 
				[-1] = {false, true, false, false, 0, 0, "", 26868, 0, 0, "", 26869, 0, 0, 0},
			},
			[78646] = { 
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[78644] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 7250,
		ScendID = 
		{
			[102] = true,
		},
		NPCParam = 
		{
			[78682] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "行走", 97, 47, 123, 0},
			},
		},
	},
	{
		TaskID = 7290,
		ScendID = 
		{
			[102] = true,
		},
		NPCParam = 
		{
			[78656] = { 
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[78904] = { 
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 7295,
		ScendID = 
		{
			[102] = true,
		},
		NPCParam = 
		{
			[78646] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[78658] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[78647] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 7297,
		ScendID = 
		{
			[102] = true,
		},
		NPCParam = 
		{
			[78647] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[78648] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[78659] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 7298,
		ScendID = 
		{
			[102] = true,
		},
		NPCParam = 
		{
			[78648] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[78649] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[78659] = { 
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 26896, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 7299,
		ScendID = 
		{
			[102] = true,
		},
		NPCParam = 
		{
			[78649] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[78650] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 7300,
		ScendID = 
		{
			[102] = true,
		},
		NPCParam = 
		{
			[78650] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[78651] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 7302,
		ScendID = 
		{
			[102] = true,
		},
		NPCParam = 
		{
			[78651] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 26897, 0, 0, 0},
			},
			[78652] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[78657] = { 
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 7086,
		ScendID = 
		{
			[105] = true,
		},
		NPCParam = 
		{
			[77936] = { 
				[-1] = {false, false, false, true, 78872, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[78871] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[78872] = { 
				[-1] = {true, false, false, false, 78871, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 7087,
		ScendID = 
		{
			[105] = true,
		},
		SceneGfxParam = 
		{
			[1073744338] = {false, true, true, false},
			[1073744336] = {false, true, true, false},
			[1073744335] = {false, true, true, false},
			[1073744333] = {false, true, true, false},
			[1073744334] = {false, true, true, false},
			[1073744339] = {false, true, true, false},
			[1073744343] = {false, true, true, false},
			[1073744340] = {false, true, true, false},
			[1073744342] = {false, true, true, false},
		},
	},
	{
		TaskID = 7089,
		ScendID = 
		{
			[105] = true,
		},
		SceneGfxParam = 
		{
			[1073744330] = {false, true, true, false},
			[1073744331] = {false, true, true, false},
		},
	},
	{
		TaskID = 7098,
		ScendID = 
		{
			[105] = true,
		},
		SceneGfxParam = 
		{
			[1073744332] = {false, true, true, false},
			[1073744330] = {true, false, false, true},
			[1073744331] = {true, false, false, true},
			[1073744338] = {true, false, false, true},
			[1073744336] = {true, false, false, true},
			[1073744335] = {true, false, false, true},
			[1073744333] = {true, false, false, true},
			[1073744334] = {true, false, false, true},
			[1073744339] = {true, false, false, true},
			[1073744343] = {true, false, false, true},
			[1073744340] = {true, false, false, true},
			[1073744342] = {true, false, false, true},
		},
	},
	{
		TaskID = 7012,
		ScendID = 
		{
			[101] = true,
		},
		NPCParam = 
		{
			[77654] = { 
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 7013,
		ScendID = 
		{
			[101] = true,
		},
		NPCParam = 
		{
			[77654] = { 
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 316, 104, -113, 0},
			},
			[77687] = { 
				[-1] = {true, true, false, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[77657] = { 
				[-1] = {false, false, true, false, 0, 0, "", 304, 100, -120, "", 0, 0, 0, 0},
			},
			[77690] = { 
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 7016,
		ScendID = 
		{
			[101] = true,
		},
		NPCParam = 
		{
			[77657] = { 
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 272, 100, -114, 0},
			},
		},
	},
	{
		TaskID = 7017,
		ScendID = 
		{
			[101] = true,
		},
		NPCParam = 
		{
			[77690] = { 
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 264, 101, -108, 0},
			},
			[77693] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
		SceneGfxParam = 
		{
			[1073747025 ] = {true, true, true, false},
			[1073746957] = {true, true, true, false},
			[1073746975] = {true, true, true, false},
			[1073746976] = {true, true, true, false},
			[1073746978] = {true, true, true, false},
			[1073747024] = {true, true, true, false},
			[1073746979] = {true, true, true, false},
			[1073746980] = {true, true, true, false},
			[1073747023] = {true, true, true, false},
			[1073746965] = {true, true, true, false},
			[1073746986] = {true, true, true, false},
			[1073746981] = {true, true, true, false},
			[1073746982] = {true, true, true, false},
			[1073747022] = {true, true, true, false},
			[1073747020] = {true, true, true, false},
			[1073746983] = {true, true, true, false},
			[1073747019] = {true, true, true, false},
			[1073746977] = {true, true, true, false},
		},
		SceneModelParam = 
		{
			[1073746780] = {true, true, true, false},
			[1073746781] = {true, true, true, false},
			[1073746782] = {true, true, true, false},
			[1073746783] = {true, true, true, false},
			[1073746784] = {true, true, true, false},
			[1073746785] = {true, true, true, false},
			[1073746786] = {true, true, true, false},
			[1073746787] = {true, true, true, false},
		},
	},
	{
		TaskID = 7020,
		ScendID = 
		{
			[101] = true,
		},
		NPCParam = 
		{
			[77693] = { 
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 86, 87, -166, 0},
			},
			[77696] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 7022,
		ScendID = 
		{
			[101] = true,
		},
		NPCParam = 
		{
			[77696] = { 
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", -131, 86, -368, 0},
			},
			[77699] = { 
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[77660] = { 
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
		SceneGfxParam = 
		{
			[1073746996] = {true, true, true, false},
			[1073746993] = {true, true, true, false},
			[1073747043] = {true, true, true, false},
			[1073746994] = {true, true, true, false},
			[1073746989] = {true, true, true, false},
			[1073746995] = {true, true, true, false},
			[1073747039] = {true, true, true, false},
			[1073747038] = {true, true, true, false},
			[1073747041] = {true, true, true, false},
			[1073747042] = {true, true, true, false},
			[1073747050] = {true, true, true, false},
			[1073747044] = {true, true, true, false},
			[1073746997] = {true, true, true, false},
			[1073747045] = {true, true, true, false},
			[1073747046] = {true, true, true, false},
			[1073747047] = {true, true, true, false},
			[1073747018] = {true, true, true, false},
			[1073746998] = {true, true, true, false},
			[1073746991] = {true, true, true, false},
			[1073746992] = {true, true, true, false},
			[1073747048] = {true, true, true, false},
			[1073746990] = {true, true, true, false},
			[1073747000] = {true, true, true, false},
			[1073747016] = {true, true, true, false},
			[1073747049] = {true, true, true, false},
			[1073746999] = {true, true, true, false},
			[1073747017] = {true, true, true, false},
			[1073747040] = {true, true, true, false},
			[1073747049] = {true, true, true, false},
			[1073746999] = {true, true, true, false},
			[1073747017] = {true, true, true, false},
		},
		SceneModelParam = 
		{
			[1073746788] = {true, true, true, false},
			[1073747026] = {true, true, true, false},
			[1073746789] = {true, true, true, false},
			[1073747027] = {true, true, true, false},
			[1073746790] = {true, true, true, false},
			[1073746792] = {true, true, true, false},
			[1073747028] = {true, true, true, false},
			[1073747051] = {true, true, true, false},
			[1073747031] = {true, true, true, false},
			[1073747032] = {true, true, true, false},
			[1073747053] = {true, true, true, false},
			[1073747033] = {true, true, true, false},
			[1073747029] = {true, true, true, false},
			[1073747030] = {true, true, true, false},
			[1073746795] = {true, true, true, false},
			[1073746796] = {true, true, true, false},
			[1073746791] = {true, true, true, false},
			[1073747052] = {true, true, true, false},
			[1073746793] = {true, true, true, false},
			[1073747034] = {true, true, true, false},
		},
	},
	{
		TaskID = 7024,
		ScendID = 
		{
			[101] = true,
		},
		NPCParam = 
		{
			[77699] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", -248, 90, -398, 0},
			},
		},
	},
	{
		TaskID = 7026,
		ScendID = 
		{
			[101] = true,
		},
		NPCParam = 
		{
			[77711] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[77702] = { 
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 7030,
		ScendID = 
		{
			[101] = true,
		},
		NPCParam = 
		{
			[77666] = { 
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 7033,
		ScendID = 
		{
			[101] = true,
		},
		NPCParam = 
		{
			[77666] = { 
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[77702] = { 
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[77705] = { 
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[77669] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 7038,
		ScendID = 
		{
			[101] = true,
		},
		NPCParam = 
		{
			[77669] = { 
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", -215, 78, -25, 0},
			},
		},
	},
	{
		TaskID = 7041,
		ScendID = 
		{
			[101] = true,
		},
		SceneGfxParam = 
		{
			[1073742235] = {false, true, true, false},
		},
		SceneModelParam = 
		{
			[1073742235] = {false, true, true, false},
		},
	},
	{
		TaskID = 7042,
		ScendID = 
		{
			[101] = true,
		},
		NPCParam = 
		{
			[77708] = { 
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[77672] = { 
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 7047,
		ScendID = 
		{
			[101] = true,
		},
		NPCParam = 
		{
			[77672] = { 
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[77675] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
		SceneGfxParam = 
		{
			[1073747001] = {false, true, true, false},
			[1073747002] = {false, true, true, false},
			[1073747003] = {false, true, true, false},
			[1073747004] = {false, true, true, false},
			[1073747005] = {false, true, true, false},
			[1073747006] = {false, true, true, false},
			[1073747007] = {false, true, true, false},
			[1073747008] = {false, true, true, false},
			[1073747009] = {false, true, true, false},
			[1073747010] = {false, true, true, false},
			[1073747011] = {false, true, true, false},
			[1073747012] = {false, true, true, false},
			[1073747013] = {false, true, true, false},
		},
	},
	{
		TaskID = 7048,
		ScendID = 
		{
			[101] = true,
		},
		NPCParam = 
		{
			[77675] = { 
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[77678] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 7049,
		ScendID = 
		{
			[101] = true,
		},
		NPCParam = 
		{
			[77678] = { 
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[77681] = { 
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 7350,
		ScendID = 
		{
			[71] = true,
			[77] = true,
			[79] = true,
			[81] = true,
			[78] = true,
		},
		NPCParam = 
		{
			[79678] = { 
				[-1] = {true, true, true, false, 0, 0, "", 1, 1, 1, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 7351,
		ScendID = 
		{
			[71] = true,
			[77] = true,
			[79] = true,
			[81] = true,
			[78] = true,
		},
		NPCParam = 
		{
			[79678] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 1, 1, 1, 0},
			},
		},
	},
	{
		TaskID = 7223,
		ScendID = 
		{
			[101] = true,
		},
		NPCParam = 
		{
			[78022] = { 
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 7603,
		ScendID = 
		{
			[102] = true,
		},
		SceneGfxParam = 
		{
			[1073744833] = {true, true, true, false},
		},
	},
	{
		TaskID = 7262,
		ScendID = 
		{
			[102] = true,
		},
		NPCParam = 
		{
			[78689] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 6839,
		ScendID = 
		{
			[75] = true,
		},
		NPCParam = 
		{
			[77061] = { 
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 6848,
		ScendID = 
		{
			[75] = true,
		},
		NPCParam = 
		{
			[77061] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 6832,
		ScendID = 
		{
			[82] = true,
		},
		NPCParam = 
		{
			[77058] = { 
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 7656,
		ScendID = 
		{
			[69] = true,
		},
		NPCParam = 
		{
			[80985] = { 
				[-1] = {true, true, true, false, 0, 0, "", 1, 1, 1, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 7617,
		ScendID = 
		{
			[75] = true,
		},
		NPCParam = 
		{
			[80147] = { 
				[-1] = {false, true, true, false, 0, 0, "", 27122, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 7620,
		ScendID = 
		{
			[75] = true,
			[77] = true,
		},
		NPCParam = 
		{
			[80146] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[80148] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[81026] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[80149] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[80145] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[80147] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 7674,
		ScendID = 
		{
			[101] = true,
		},
		NPCParam = 
		{
			[77660] = { 
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", -258, 90, -407, 0},
			},
		},
	},
	{
		TaskID = 7913,
		ScendID = 
		{
			[72] = true,
		},
		SceneGfxParam = 
		{
			[1073744898] = {false, true, false, false},
		},
	},
	{
		TaskID = 8126,
		ScendID = 
		{
			[108] = true,
		},
		NPCParam = 
		{
			[83903] = { 
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[84691] = { 
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 8128,
		ScendID = 
		{
			[108] = true,
		},
		NPCParam = 
		{
			[83903] = { 
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 27633, 0, 0, 0},
			},
			[84691] = { 
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 27633, 0, 0, 0},
			},
			[83904] = { 
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[83910] = { 
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 27634, 0, 0, 0},
			},
			[83911] = { 
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 27634, 0, 0, 0},
			},
			[83912] = { 
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 27634, 0, 0, 0},
			},
			[83914] = { 
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[83913] = { 
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 8137,
		ScendID = 
		{
			[108] = true,
		},
		NPCParam = 
		{
			[83904] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[83905] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[83914] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[83916] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[83915] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[84707] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[83913] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
		SceneGfxParam = 
		{
			[1073743337] = {false, true, true, false},
			[1073743338] = {false, true, true, false},
			[1073743339] = {false, true, true, false},
		},
	},
	{
		TaskID = 8149,
		ScendID = 
		{
			[108] = true,
		},
		NPCParam = 
		{
			[83922] = { 
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[83921] = { 
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[84672] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[84673] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[84775] = { 
				[-1] = {true, false, false, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[84776] = { 
				[-1] = {true, false, false, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 8150,
		ScendID = 
		{
			[108] = true,
		},
		NPCParam = 
		{
			[83905] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[83906] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[84674] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[84675] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[84708] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[84709] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[84672] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[84673] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[84707] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[83915] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[83916] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 8182,
		ScendID = 
		{
			[109] = true,
		},
		NPCParam = 
		{
			[84386] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 8193,
		ScendID = 
		{
			[109] = true,
		},
		NPCParam = 
		{
			[84389] = { 
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 8196,
		ScendID = 
		{
			[109] = true,
		},
		NPCParam = 
		{
			[84401] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 8206,
		ScendID = 
		{
			[109] = true,
		},
		NPCParam = 
		{
			[84410] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[84416] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[84413] = { 
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[84419] = { 
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 8214,
		ScendID = 
		{
			[109] = true,
		},
		NPCParam = 
		{
			[84419] = { 
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[84422] = { 
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 8148,
		ScendID = 
		{
			[108] = true,
		},
		NPCParam = 
		{
			[83920] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 27692, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 8039,
		ScendID = 
		{
			[110] = true,
		},
		NPCParam = 
		{
			[84684] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[84269] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 8042,
		ScendID = 
		{
			[110] = true,
		},
		NPCParam = 
		{
			[84272] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 27733, 0, 0, 0},
			},
			[84275] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 8047,
		ScendID = 
		{
			[110] = true,
		},
		NPCParam = 
		{
			[84281] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 8052,
		ScendID = 
		{
			[110] = true,
		},
		NPCParam = 
		{
			[84281] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[84284] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 8054,
		ScendID = 
		{
			[110] = true,
		},
		NPCParam = 
		{
			[84284] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[84287] = { 
				[-1] = {false, true, true, false, 0, 0, "", 1, 1, 1, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 8057,
		ScendID = 
		{
			[110] = true,
		},
		NPCParam = 
		{
			[84287] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[84687] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[84293] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[84290] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 8059,
		ScendID = 
		{
			[110] = true,
		},
		NPCParam = 
		{
			[84290] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 8060,
		ScendID = 
		{
			[110] = true,
		},
		NPCParam = 
		{
			[84293] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[84296] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[84299] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[84302] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 8064,
		ScendID = 
		{
			[110] = true,
		},
		NPCParam = 
		{
			[84296] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[84302] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[84299] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[84305] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[84311] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 8066,
		ScendID = 
		{
			[110] = true,
		},
		NPCParam = 
		{
			[84305] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[84311] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[84308] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 8067,
		ScendID = 
		{
			[110] = true,
		},
		NPCParam = 
		{
			[84308] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[84314] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[84317] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 8069,
		ScendID = 
		{
			[110] = true,
		},
		NPCParam = 
		{
			[84320] = { 
				[-1] = {false, true, true, false, 0, 0, "", 1, 1, 1, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 8073,
		ScendID = 
		{
			[110] = true,
		},
		NPCParam = 
		{
			[84320] = { 
				[-1] = {false, false, false, false, 0, 0, "", 0, 0, 0, "", 27735, 0, 0, 0},
			},
			[84314] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 27734, 0, 0, 0},
			},
			[84323] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 8075,
		ScendID = 
		{
			[110] = true,
		},
		NPCParam = 
		{
			[84323] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[84317] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[84326] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[84332] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[84329] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 8077,
		ScendID = 
		{
			[110] = true,
		},
		NPCParam = 
		{
			[84329] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[84326] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[84332] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[84335] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[84338] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[84341] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 8082,
		ScendID = 
		{
			[110] = true,
		},
		NPCParam = 
		{
			[84350] = { 
				[-1] = {false, true, true, true, 84353, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[84353] = { 
				[-1] = {true, false, false, true, 84356, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[84356] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 8045,
		ScendID = 
		{
			[110] = true,
		},
		SceneGfxParam = 
		{
			[1073744526] = {false, true, true, false},
		},
	},
	{
		TaskID = 8083,
		ScendID = 
		{
			[110] = true,
		},
		SceneGfxParam = 
		{
			[1073744527] = {false, true, true, false},
		},
	},
	{
		TaskID = 8280,
		ScendID = 
		{
			[71] = true,
			[77] = true,
			[79] = true,
			[81] = true,
			[78] = true,
		},
		NPCParam = 
		{
			[85004] = { 
				[-1] = {true, true, true, true, 0, 0, "", 1, 1, 1, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 8281,
		ScendID = 
		{
			[71] = true,
			[77] = true,
			[79] = true,
			[81] = true,
			[78] = true,
		},
		NPCParam = 
		{
			[85004] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 1, 1, 1, 0},
			},
		},
	},
	{
		TaskID = 8681,
		ScendID = 
		{
			[78] = true,
		},
		NPCParam = 
		{
			[86767] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[86763] = { 
				[-1] = {false, false, false, true, 86825, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[86825] = { 
				[-1] = {true, false, false, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 8898,
		ScendID = 
		{
			[67] = true,
			[75] = true,
		},
		NPCParam = 
		{
			[87541] = { 
				[-1] = {true, true, true, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[87544] = { 
				[-1] = {false, false, false, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 8904,
		ScendID = 
		{
			[67] = true,
			[75] = true,
		},
		NPCParam = 
		{
			[87541] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "0", 28157, 0, 0, 0},
			},
			[87547] = { 
				[-1] = {false, false, true, true, 0, 0, "0", -108.242, 82.726, 14.938, "", 0, 0, 0, 0},
			},
			[87548] = { 
				[-1] = {false, false, false, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 8905,
		ScendID = 
		{
			[67] = true,
			[75] = true,
		},
		NPCParam = 
		{
			[87547] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[87548] = { 
				[-1] = {true, true, true, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 8906,
		ScendID = 
		{
			[75] = true,
		},
		NPCParam = 
		{
			[87544] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 8910,
		ScendID = 
		{
			[84] = true,
		},
		NPCParam = 
		{
			[87549] = { 
				[-1] = {true, true, true, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 8914,
		ScendID = 
		{
			[84] = true,
		},
		NPCParam = 
		{
			[87549] = { 
				[-1] = {false, false, false, true, 87552, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[87552] = { 
				[-1] = {true, true, false, true, 87550, GameApi.HashAString("金月儿01"), "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[87550] = { 
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 8916,
		ScendID = 
		{
			[84] = true,
			[79] = true,
		},
		NPCParam = 
		{
			[87550] = { 
				[-1] = {false, false, false, true, 87552, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[87552] = { 
				[-1] = {true, true, true, false, 87551, GameApi.HashAString("金月儿"), "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[87551] = { 
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 8917,
		ScendID = 
		{
			[79] = true,
		},
		NPCParam = 
		{
			[87551] = { 
				[-1] = {true, true, true, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 8918,
		ScendID = 
		{
			[79] = true,
		},
		NPCParam = 
		{
			[87551] = { 
				[-1] = {true, true, true, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 8919,
		ScendID = 
		{
			[75] = true,
			[79] = true,
		},
		NPCParam = 
		{
			[87553] = { 
				[-1] = {true, true, true, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[87555] = { 
				[-1] = {true, true, true, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[87556] = { 
				[-1] = {true, true, true, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[87557] = { 
				[-1] = {true, true, true, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[87558] = { 
				[-1] = {true, true, true, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[87559] = { 
				[-1] = {true, true, true, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[87560] = { 
				[-1] = {true, true, true, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[87551] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 8920,
		ScendID = 
		{
			[75] = true,
			[79] = true,
		},
		NPCParam = 
		{
			[87553] = { 
				[-1] = {true, true, true, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[87555] = { 
				[-1] = {true, true, true, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[87556] = { 
				[-1] = {true, true, true, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[87557] = { 
				[-1] = {true, true, true, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[87558] = { 
				[-1] = {true, true, true, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[87559] = { 
				[-1] = {true, true, true, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[87560] = { 
				[-1] = {true, true, true, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 8924,
		ScendID = 
		{
			[75] = true,
			[84] = true,
		},
		NPCParam = 
		{
			[87553] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[87555] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[87556] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[87557] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[87558] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[87559] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[87560] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[87764] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "0", 28158, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 8896,
		ScendID = 
		{
			[86] = true,
		},
		NPCParam = 
		{
			[87586] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 8897,
		ScendID = 
		{
			[86] = true,
		},
		NPCParam = 
		{
			[87587] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 8927,
		ScendID = 
		{
			[86] = true,
		},
		NPCParam = 
		{
			[87588] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 8893,
		ScendID = 
		{
			[86] = true,
		},
		NPCParam = 
		{
			[87928] = { 
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 1},
			},
		},
	},
	{
		TaskID = 8894,
		ScendID = 
		{
			[86] = true,
		},
		NPCParam = 
		{
			[87928] = { 
				[-1] = {false, false, false, true, 87854, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[87854] = { 
				[-1] = {true, true, false, true, 87939, GameApi.HashAString("暗夜交付婆婆"), "0", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[87939] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 8895,
		ScendID = 
		{
			[86] = true,
		},
		NPCParam = 
		{
			[87585] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 8928,
		ScendID = 
		{
			[86] = true,
		},
		NPCParam = 
		{
			[87939] = { 
				[-1] = {false, false, false, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[87585] = { 
				[-1] = {false, false, false, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[87587] = { 
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 8991,
		ScendID = 
		{
			[4] = true,
			[86] = true,
		},
		NPCParam = 
		{
			[87938] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[87586] = { 
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[87585] = { 
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[87939] = { 
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 8980,
		ScendID = 
		{
			[67] = true,
		},
		NPCParam = 
		{
			[87938] = { 
				[-1] = {true, true, true, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 9013,
		ScendID = 
		{
			[86] = true,
		},
		NPCParam = 
		{
			[87939] = { 
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[87585] = { 
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[87588] = { 
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 9128,
		ScendID = 
		{
			[68] = true,
		},
		NPCParam = 
		{
			[88573] = { 
				[-1] = {false, false, true, false, 0, 0, "28223", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 9130,
		ScendID = 
		{
			[68] = true,
		},
		NPCParam = 
		{
			[88574] = { 
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[88573] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[62509] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[61734] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 9131,
		ScendID = 
		{
			[68] = true,
			[72] = true,
		},
		NPCParam = 
		{
			[88574] = { 
				[-1] = {false, false, false, true, 89140, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[88575] = { 
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 9139,
		ScendID = 
		{
			[72] = true,
		},
		NPCParam = 
		{
			[88575] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[89230] = { 
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 9140,
		ScendID = 
		{
			[72] = true,
		},
		NPCParam = 
		{
			[89230] = { 
				[-1] = {true, false, false, true, 0, 0, "28268", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[88576] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 9143,
		ScendID = 
		{
			[72] = true,
		},
		NPCParam = 
		{
			[88581] = { 
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 9144,
		ScendID = 
		{
			[72] = true,
		},
		NPCParam = 
		{
			[88581] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[88580] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 9146,
		ScendID = 
		{
			[72] = true,
		},
		NPCParam = 
		{
			[88577] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[88582] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[88576] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 9147,
		ScendID = 
		{
			[72] = true,
		},
		NPCParam = 
		{
			[88582] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 1, 1, 1, 0},
			},
		},
		SceneGfxParam = 
		{
			[1073745005] = {true, true, true, false},
		},
	},
	{
		TaskID = 9149,
		ScendID = 
		{
			[72] = true,
		},
		NPCParam = 
		{
			[88577] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[88578] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
		SceneGfxParam = 
		{
			[1073745005] = {true, false, false, true},
		},
	},
	{
		TaskID = 9152,
		ScendID = 
		{
			[72] = true,
		},
		NPCParam = 
		{
			[88578] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[88579] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 9155,
		ScendID = 
		{
			[72] = true,
		},
		NPCParam = 
		{
			[88579] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 9199,
		ScendID = 
		{
			[93] = true,
		},
		NPCParam = 
		{
			[89415] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 9171,
		ScendID = 
		{
			[93] = true,
		},
		NPCParam = 
		{
			[89262] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 9172,
		ScendID = 
		{
			[93] = true,
		},
		NPCParam = 
		{
			[89262] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[89393] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 9173,
		ScendID = 
		{
			[93] = true,
		},
		NPCParam = 
		{
			[89393] = { 
				[-1] = {true, true, true, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 9174,
		ScendID = 
		{
			[93] = true,
		},
		NPCParam = 
		{
			[89393] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[89394] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[89263] = { 
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 9175,
		ScendID = 
		{
			[93] = true,
		},
		NPCParam = 
		{
			[89263] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[89264] = { 
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 9176,
		ScendID = 
		{
			[93] = true,
		},
		NPCParam = 
		{
			[89264] = { 
				[-1] = {true, true, true, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 9177,
		ScendID = 
		{
			[93] = true,
		},
		NPCParam = 
		{
			[89264] = { 
				[-1] = {true, true, true, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[89265] = { 
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 9178,
		ScendID = 
		{
			[93] = true,
		},
		NPCParam = 
		{
			[89265] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[89264] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[89394] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 9092,
		ScendID = 
		{
			[67] = true,
			[93] = true,
		},
		NPCParam = 
		{
			[89133] = { 
				[-1] = {true, true, true, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[89415] = { 
				[-1] = {false, false, false, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 9094,
		ScendID = 
		{
			[67] = true,
		},
		NPCParam = 
		{
			[89133] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 9181,
		ScendID = 
		{
			[4] = true,
		},
		NPCParam = 
		{
			[89137] = { 
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 9100,
		ScendID = 
		{
			[4] = true,
		},
		NPCParam = 
		{
			[89137] = { 
				[-1] = {false, false, false, true, 89140, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[89140] = { 
				[-1] = {true, false, false, false, 89139, GameApi.HashAString("储萧蒙002"), "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[89139] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[89142] = { 
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 9103,
		ScendID = 
		{
			[4] = true,
		},
		NPCParam = 
		{
			[89149] = { 
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 9104,
		ScendID = 
		{
			[4] = true,
		},
		NPCParam = 
		{
			[89149] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[89150] = { 
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 9110,
		ScendID = 
		{
			[4] = true,
		},
		NPCParam = 
		{
			[89150] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[89151] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 9112,
		ScendID = 
		{
			[4] = true,
		},
		NPCParam = 
		{
			[89151] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[89134] = { 
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 9118,
		ScendID = 
		{
			[4] = true,
		},
		NPCParam = 
		{
			[89134] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[89135] = { 
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 9121,
		ScendID = 
		{
			[4] = true,
		},
		NPCParam = 
		{
			[89144] = { 
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 9200,
		ScendID = 
		{
			[4] = true,
		},
		NPCParam = 
		{
			[89144] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[89148] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 9124,
		ScendID = 
		{
			[4] = true,
		},
		NPCParam = 
		{
			[89148] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[89145] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 9126,
		ScendID = 
		{
			[4] = true,
		},
		NPCParam = 
		{
			[89145] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[89146] = { 
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 9164,
		ScendID = 
		{
			[4] = true,
		},
		NPCParam = 
		{
			[89152] = { 
				[-1] = {true, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 9270,
		ScendID = 
		{
			[123] = true,
		},
		NPCParam = 
		{
			[90067] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[90068] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 9291,
		ScendID = 
		{
			[123] = true,
		},
		NPCParam = 
		{
			[90079] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 9294,
		ScendID = 
		{
			[123] = true,
		},
		NPCParam = 
		{
			[90080] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[90076] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 9381,
		ScendID = 
		{
			[4] = true,
		},
		NPCParam = 
		{
			[90566] = { 
				[-1] = {true, true, true, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 1},
			},
		},
	},
	{
		TaskID = 9387,
		ScendID = 
		{
			[4] = true,
		},
		NPCParam = 
		{
			[90566] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 2},
			},
		},
	},
	{
		TaskID = 10223,
		ScendID = 
		{
			[1589] = true,
		},
		WorldID = 
		{
			[9035] = true,
		},
		NPCParam = 
		{
			[43761] = {
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0}
			},
		},
		SceneParam = 
		{
			[SceneStyle.TaskState.NONE] = {Main = "蓬莱副本", Sub = "破损前", },
			[SceneStyle.TaskState.CANFINISH] = {Main = "蓬莱副本", Sub = "破损后", },
			[SceneStyle.TaskState.FINISHED] = {Main = "蓬莱副本", Sub = "破损后", },
			[SceneStyle.TaskState.ACCEPT] = {Main = "蓬莱副本", Sub = "破损后", },
			[SceneStyle.TaskState.FAIL] = {Main = "蓬莱副本", Sub = "破损前", },
		},
	},
	{
		TaskID = 10264,
		ScendID = 
		{
			[127] = true,
		},
		NPCParam = 
		{
			[94155] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[94156] = { 
				[-1] = {true, true, true, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 10272,
		ScendID = 
		{
			[127] = true,
		},
		NPCParam = 
		{
			[94156] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[94157] = { 
				[-1] = {true, true, true, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 10274,
		ScendID = 
		{
			[127] = true,
		},
		NPCParam = 
		{
			[94163] = { 
				[-1] = {true, true, true, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 10276,
		ScendID = 
		{
			[127] = true,
		},
		NPCParam = 
		{
			[94164] = { 
				[-1] = {true, true, true, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 10277,
		ScendID = 
		{
			[127] = true,
		},
		NPCParam = 
		{
			[94157] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[94158] = { 
				[-1] = {true, true, true, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[94163] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[94164] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 10279,
		ScendID = 
		{
			[127] = true,
		},
		NPCParam = 
		{
			[94167] = { 
				[-1] = {true, true, true, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 10282,
		ScendID = 
		{
			[127] = true,
		},
		NPCParam = 
		{
			[94167] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 10319,
		ScendID = 
		{
			[127] = true,
			[136] = true,
		},
		NPCParam = 
		{
			[94283] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[94289] = { 
				[-1] = {false, true, true, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 10320,
		ScendID = 
		{
			[136] = true,
		},
		NPCParam = 
		{
			[94289] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 10327,
		ScendID = 
		{
			[136] = true,
		},
		NPCParam = 
		{
			[94297] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 10332,
		ScendID = 
		{
			[136] = true,
		},
		NPCParam = 
		{
			[94328] = { 
				[-1] = {true, true, true, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 10334,
		ScendID = 
		{
			[136] = true,
		},
		NPCParam = 
		{
			[94328] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[94329] = { 
				[-1] = {false, true, true, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 10338,
		ScendID = 
		{
			[136] = true,
		},
		NPCParam = 
		{
			[94329] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[94330] = { 
				[-1] = {false, true, true, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 10341,
		ScendID = 
		{
			[136] = true,
		},
		NPCParam = 
		{
			[94330] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[94331] = { 
				[-1] = {false, true, true, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 10342,
		ScendID = 
		{
			[136] = true,
		},
		NPCParam = 
		{
			[94331] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[94332] = { 
				[-1] = {false, true, true, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 10346,
		ScendID = 
		{
			[136] = true,
		},
		NPCParam = 
		{
			[94332] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[94338] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[94333] = { 
				[-1] = {false, true, true, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 10348,
		ScendID = 
		{
			[136] = true,
		},
		NPCParam = 
		{
			[94333] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[94334] = { 
				[-1] = {false, true, true, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 10350,
		ScendID = 
		{
			[136] = true,
		},
		NPCParam = 
		{
			[94334] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[94335] = { 
				[-1] = {false, true, true, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 10351,
		ScendID = 
		{
			[136] = true,
		},
		NPCParam = 
		{
			[94335] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[94336] = { 
				[-1] = {false, true, true, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 10354,
		ScendID = 
		{
			[136] = true,
		},
		NPCParam = 
		{
			[94336] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[94341] = { 
				[-1] = {false, true, true, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 10360,
		ScendID = 
		{
			[136] = true,
		},
		NPCParam = 
		{
			[94341] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 10359,
		ScendID = 
		{
			[136] = true,
			[127] = true,
		},
		NPCParam = 
		{
			[94298] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 10362,
		ScendID = 
		{
			[127] = true,
		},
		NPCParam = 
		{
			[94343] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[94299] = { 
				[-1] = {false, true, true, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[94346] = { 
				[-1] = {false, true, true, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[94586] = { 
				[-1] = {false, true, true, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[94344] = { 
				[-1] = {false, true, true, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 10366,
		ScendID = 
		{
			[127] = true,
		},
		NPCParam = 
		{
			[94344] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 10316,
		ScendID = 
		{
			[127] = true,
		},
		NPCParam = 
		{
			[94282] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[94283] = { 
				[-1] = {true, true, true, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 10367,
		ScendID = 
		{
			[127] = true,
		},
		NPCParam = 
		{
			[94299] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[94346] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[94586] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 10523,
		ScendID = 
		{
			[82] = true,
		},
		NPCParam = 
		{
			[95266] = { 
				[-1] = {true, true, true, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[95280] = { 
				[-1] = {true, true, true, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 10524,
		ScendID = 
		{
			[86] = true,
		},
		NPCParam = 
		{
			[95270] = { 
				[-1] = {true, true, true, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 10525,
		ScendID = 
		{
			[86] = true,
		},
		NPCParam = 
		{
			[95277] = { 
				[-1] = {true, true, true, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 10528,
		ScendID = 
		{
			[82] = true,
		},
		NPCParam = 
		{
			[95284] = { 
				[-1] = {true, true, true, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[95285] = { 
				[-1] = {true, true, true, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 10532,
		ScendID = 
		{
			[82] = true,
		},
		NPCParam = 
		{
			[95284] = { 
				[-1] = {false, false, false, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[95285] = { 
				[-1] = {false, false, false, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 10533,
		ScendID = 
		{
			[91] = true,
		},
		NPCParam = 
		{
			[95286] = { 
				[-1] = {true, true, true, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[95287] = { 
				[-1] = {true, true, true, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[95288] = { 
				[-1] = {true, true, true, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[95267] = { 
				[-1] = {true, true, true, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[95272] = { 
				[-1] = {true, true, true, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[95278] = { 
				[-1] = {true, true, true, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[95281] = { 
				[-1] = {true, true, true, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 10536,
		ScendID = 
		{
			[82] = true,
			[86] = true,
		},
		NPCParam = 
		{
			[95266] = { 
				[-1] = {false, false, false, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[95280] = { 
				[-1] = {false, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[95270] = { 
				[-1] = {false, false, false, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[95277] = { 
				[-1] = {false, false, false, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 10537,
		ScendID = 
		{
			[71] = true,
		},
		NPCParam = 
		{
			[95268] = { 
				[-1] = {true, true, true, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[95273] = { 
				[-1] = {true, true, true, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[95279] = { 
				[-1] = {true, true, true, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[95282] = { 
				[-1] = {true, true, true, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 10538,
		ScendID = 
		{
			[91] = true,
		},
		NPCParam = 
		{
			[95286] = { 
				[-1] = {false, false, false, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[95287] = { 
				[-1] = {false, false, false, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[95288] = { 
				[-1] = {false, false, false, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[95267] = { 
				[-1] = {false, false, false, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[95272] = { 
				[-1] = {false, false, false, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[95278] = { 
				[-1] = {false, false, false, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[95281] = { 
				[-1] = {false, false, false, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 10541,
		ScendID = 
		{
			[71] = true,
			[82] = true,
		},
		NPCParam = 
		{
			[95268] = { 
				[-1] = {false, false, false, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[95273] = { 
				[-1] = {false, false, false, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[95279] = { 
				[-1] = {false, false, false, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[95282] = { 
				[-1] = {false, false, false, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[95269] = { 
				[-1] = {true, true, true, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 10542,
		ScendID = 
		{
			[82] = true,
		},
		NPCParam = 
		{
			[95269] = { 
				[-1] = {true, true, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 10814,
		ScendID = 
		{
			[1625] = true,
		},
		WorldID = 
		{
			[10009] = true,
		},
		NPCParam = 
		{
			[96536] = { 
				[-1] = {false, false, true, false, 0, 0, "", 0, 0, 0, "", 29417, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 11144,
		ScendID = 
		{
			[146] = true,
		},
		NPCParam = 
		{
			[98047] = { 
				[-1] = {false, false, false, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 11145,
		ScendID = 
		{
			[146] = true,
		},
		NPCParam = 
		{
			[98048] = { 
				[-1] = {true, true, true, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 11127,
		ScendID = 
		{
			[146] = true,
		},
		NPCParam = 
		{
			[98149] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[97843] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
	{
		TaskID = 11131,
		ScendID = 
		{
			[146] = true,
		},
		NPCParam = 
		{
			[98150] = { 
				[-1] = {false, true, true, false, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
			[97844] = { 
				[-1] = {true, false, false, true, 0, 0, "", 0, 0, 0, "", 0, 0, 0, 0},
			},
		},
	},
}

-- NPC场景参数初始化配置
SceneStyle.NPC_List =
{
	[16415] = {
			[-1] = {{55},{},true ,0 ,false},
	}, 

	[16439] = {
			[-1] = {{13},{},false ,0 ,false},
	}, 

	[25134] = {
			[-1] = {{61},{},false ,0 ,false},
	}, 

	[16463] = {
			[-1] = {{13},{},false ,0 ,false},
	}, 

	[25158] = {
			[-1] = {{61},{},true ,100 ,true},
	}, 

	[25182] = {
			[-1] = {{62},{},false ,0 ,false},
	}, 

	[16511] = {
			[-1] = {{16},{},false ,0 ,false},
	}, 

	[22148] = {
			[-1] = {{29},{},true ,0 ,false},
	}, 

	[16535] = {
			[-1] = {{16},{},false ,0 ,false},
	}, 

	[25230] = {
			[-1] = {{62},{},false ,0 ,false},
	}, 

	[16559] = {
			[-1] = {{16},{},false ,0 ,false},
	}, 

	[14687] = {
			[-1] = {{4},{},false ,0 ,false},
	}, 

	[25278] = {
			[-1] = {{62},{},true ,100 ,true},
	}, 

	[14711] = {
			[-1] = {{10},{},false ,0 ,false},
	}, 

	[25829] = {
			[-1] = {{1015},{},false ,0 ,false},
	}, 

	[25326] = {
			[-1] = {{62},{},false ,0 ,false},
	}, 

	[25853] = {
			[-1] = {{1015},{},false ,0 ,false},
	}, 

	[14735] = {
			[-1] = {{13},{},false ,0 ,false},
	}, 

	[25877] = {
			[-1] = {{1015},{},false ,0 ,false},
	}, 

	[16695] = {
			[-1] = {{4},{},true ,0 ,false},
	}, 

	[25901] = {
			[-1] = {{1015},{},false ,0 ,false},
	}, 

	[25398] = {
			[-1] = {{63},{},false ,0 ,false},
	}, 

	[25422] = {
			[-1] = {{63},{},false ,0 ,false},
	}, 

	[24927] = {
			[-1] = {{34},{},false ,0 ,false},
	}, 

	[21901] = {
			[-1] = {{29},{},true ,0 ,false},
	}, 

	[25494] = {
			[-1] = {{63},{},false ,0 ,false},
	}, 

	[21925] = {
			[-1] = {{19},{},true ,0 ,false},
	}, 

	[14815] = {
			[-1] = {{10},{},false ,0 ,false},
	}, 

	[25518] = {
			[-1] = {{63},{},false ,0 ,false},
	}, 

	[25015] = {
			[-1] = {{63},{},true ,100 ,true},
	}, 

	[14827] = {
			[-1] = {{3},{},false ,0 ,false},
	}, 

	[25542] = {
			[-1] = {{63},{},false ,0 ,false},
	}, 

	[21973] = {
			[-1] = {{19},{},false ,0 ,false},
	}, 

	[16376] = {
			[-1] = {{10},{},false ,0 ,false},
	}, 

	[16887] = {
			[-1] = {{55},{},true ,0 ,true},
	}, 

	[14851] = {
			[-1] = {{55},{},false ,0 ,false},
	}, 

	[16400] = {
			[-1] = {{11},{},false ,0 ,false},
	}, 

	[14863] = {
			[-1] = {{55},{},false ,0 ,false},
	}, 

	[16424] = {
			[-1] = {{55},{},false ,0 ,false},
	}, 

	[25119] = {
			[-1] = {{61},{},false ,30 ,false},
	}, 

	[16448] = {
			[-1] = {{13},{},false ,0 ,false},
	}, 

	[24632] = {
			[-1] = {{9},{},true ,0 ,false},
	}, 

	[16472] = {
			[-1] = {{13},{},false ,0 ,false},
	}, 

	[24656] = {
			[-1] = {{9},{},false ,0 ,false},
	}, 

	[16496] = {
			[-1] = {{13},{},false ,0 ,false},
	}, 

	[25191] = {
			[-1] = {{62},{},false ,0 ,false},
	}, 

	[22133] = {
			[-1] = {{29},{},false ,0 ,false},
	}, 

	[16520] = {
			[-1] = {{16},{},false ,0 ,false},
	}, 

	[16544] = {
			[-1] = {{16},{},false ,0 ,false},
	}, 

	[25239] = {
			[-1] = {{62},{},false ,0 ,false},
	}, 

	[16568] = {
			[-1] = {{16},{},false ,0 ,false},
	}, 

	[25814] = {
			[-1] = {{1015},{},false ,0 ,false},
	}, 

	[25311] = {
			[-1] = {{62},{},false ,0 ,false},
	}, 

	[25838] = {
			[-1] = {{1015},{},false ,0 ,false},
	}, 

	[25862] = {
			[-1] = {{1015},{},false ,0 ,false},
	}, 

	[25886] = {
			[-1] = {{1015},{},false ,0 ,false},
	}, 

	[25383] = {
			[-1] = {{63},{},false ,0 ,false},
	}, 

	[16704] = {
			[-1] = {{4},{},true ,0 ,false},
	}, 

	[25431] = {
			[-1] = {{63},{},false ,0 ,false},
	}, 

	[24936] = {
			[-1] = {{34},{},false ,0 ,false},
	}, 

	[25455] = {
			[-1] = {{63},{},false ,0 ,false},
	}, 

	[19331] = {
			[-1] = {{55},{},true ,0 ,false},
	}, 

	[24960] = {
			[-1] = {{34},{},true ,0 ,false},
	}, 

	[25479] = {
			[-1] = {{63},{},false ,0 ,false},
	}, 

	[25000] = {
			[-1] = {{61},{},false ,0 ,false},
	}, 

	[25008] = {
			[-1] = {{62},{},false ,0 ,false},
	}, 

	[25527] = {
			[-1] = {{63},{},false ,0 ,false},
	}, 

	[25551] = {
			[-1] = {{63},{},false ,0 ,false},
	}, 

	[16385] = {
			[-1] = {{11},{},false ,0 ,false},
	}, 

	[16409] = {
			[-1] = {{11},{},false ,0 ,false},
	}, 

	[25104] = {
			[-1] = {{61},{},false ,0 ,false},
	}, 

	[16433] = {
			[-1] = {{13},{},false ,0 ,false},
	}, 

	[25128] = {
			[-1] = {{61},{},false ,0 ,false},
	}, 

	[16457] = {
			[-1] = {{13},{},false ,0 ,false},
	}, 

	[25152] = {
			[-1] = {{61},{},false ,0 ,false},
	}, 

	[16481] = {
			[-1] = {{13},{},false ,0 ,false},
	}, 

	[25176] = {
			[-1] = {{62},{},true ,100 ,true},
	}, 

	[25200] = {
			[-1] = {{62},{},false ,0 ,false},
	}, 

	[16529] = {
			[-1] = {{16},{},false ,0 ,false},
	}, 

	[16553] = {
			[-1] = {{16},{},false ,0 ,false},
	}, 

	[25248] = {
			[-1] = {{62},{},false ,0 ,false},
	}, 

	[16577] = {
			[-1] = {{16},{},false ,0 ,false},
	}, 

	[25272] = {
			[-1] = {{62},{},true ,100 ,true},
	}, 

	[25296] = {
			[-1] = {{62},{},true ,100 ,true},
	}, 

	[25823] = {
			[-1] = {{1015},{},false ,0 ,false},
	}, 

	[25320] = {
			[-1] = {{62},{},false ,0 ,false},
	}, 

	[25847] = {
			[-1] = {{1015},{},false ,0 ,false},
	}, 

	[14732] = {
			[-1] = {{13},{},false ,0 ,false},
	}, 

	[4310] = {
			[-1] = {{11},{},true ,0 ,false},
	}, 

	[25871] = {
			[-1] = {{1015},{},false ,0 ,false},
	}, 

	[25368] = {
			[-1] = {{63},{},false ,0 ,false},
	}, 

	[16689] = {
			[-1] = {{4},{},true ,0 ,false},
	}, 

	[25895] = {
			[-1] = {{1015},{},false ,0 ,false},
	}, 

	[25392] = {
			[-1] = {{63},{},false ,0 ,false},
	}, 

	[22382] = {
			[-1] = {{19},{},false ,0 ,false},
	}, 

	[21895] = {
			[-1] = {{29},{},true ,0 ,false},
	}, 

	[25488] = {
			[-1] = {{63},{},false ,0 ,false},
	}, 

	[21919] = {
			[-1] = {{19},{},false ,0 ,false},
	}, 

	[14812] = {
			[-1] = {{10},{},false ,0 ,false},
	}, 

	[25512] = {
			[-1] = {{63},{},false ,0 ,false},
	}, 

	[25009] = {
			[-1] = {{62},{},false ,0 ,false},
	}, 

	[25017] = {
			[-1] = {{63},{},false ,0 ,false},
	}, 

	[25536] = {
			[-1] = {{63},{},false ,0 ,false},
	}, 

	[21967] = {
			[-1] = {{19},{},false ,0 ,false},
	}, 

	[16373] = {
			[-1] = {{10},{},false ,0 ,false},
	}, 

	[23013] = {
			[-1] = {{19},{},false ,0 ,false},
	}, 

	[14848] = {
			[-1] = {{55},{},true ,0 ,false},
	}, 

	[16394] = {
			[-1] = {{11},{},false ,0 ,false},
	}, 

	[25089] = {
			[-1] = {{61},{},true ,0 ,false},
	}, 

	[16418] = {
			[-1] = {{55},{},false ,0 ,false},
	}, 

	[14872] = {
			[-1] = {{55},{},false ,0 ,false},
	}, 

	[16442] = {
			[-1] = {{13},{},false ,0 ,false},
	}, 

	[25137] = {
			[-1] = {{61},{},false ,0 ,false},
	}, 

	[16466] = {
			[-1] = {{13},{},false ,0 ,false},
	}, 

	[25161] = {
			[-1] = {{61},{},true ,100 ,true},
	}, 

	[25185] = {
			[-1] = {{62},{},false ,0 ,false},
	}, 

	[22127] = {
			[-1] = {{29},{},true ,0 ,true},
	}, 

	[16514] = {
			[-1] = {{16},{},false ,0 ,false},
	}, 

	[16538] = {
			[-1] = {{16},{},false ,0 ,false},
	}, 

	[25233] = {
			[-1] = {{62},{},false ,0 ,false},
	}, 

	[16562] = {
			[-1] = {{16},{},false ,0 ,false},
	}, 

	[26335] = {
			[-1] = {{63},{},false ,0 ,false},
	}, 

	[25832] = {
			[-1] = {{1015},{},false ,0 ,false},
	}, 

	[25329] = {
			[-1] = {{62},{},false ,0 ,false},
	}, 

	[25856] = {
			[-1] = {{1015},{},false ,0 ,false},
	}, 

	[25880] = {
			[-1] = {{1015},{},false ,0 ,false},
	}, 

	[16698] = {
			[-1] = {{4},{},true ,0 ,false},
	}, 

	[25904] = {
			[-1] = {{1015},{},false ,0 ,false},
	}, 

	[25425] = {
			[-1] = {{63},{},false ,0 ,false},
	}, 

	[24930] = {
			[-1] = {{34},{},true ,0 ,false},
	}, 

	[14533] = {
			[-1] = {{1015},{},true ,0 ,false},
	}, 

	[3259] = {
			[-1] = {{2},{},true ,0 ,false},
	}, 

	[22415] = {
			[-1] = {{19},{},false ,0 ,false},
	}, 

	[3262] = {
			[-1] = {{2},{},true ,0 ,false},
	}, 

	[3774] = {
			[-1] = {{10},{},true ,0 ,false},
	}, 

	[21928] = {
			[-1] = {{19},{},false ,0 ,false},
	}, 

	[25002] = {
			[-1] = {{62},{},false ,0 ,false},
	}, 

	[25521] = {
			[-1] = {{63},{},false ,0 ,false},
	}, 

	[25018] = {
			[-1] = {{63},{},false ,0 ,false},
	}, 

	[3268] = {
			[-1] = {{2},{},true ,0 ,false},
	}, 

	[25545] = {
			[-1] = {{63},{},false ,0 ,false},
	}, 

	[21976] = {
			[-1] = {{19},{},false ,0 ,false},
	}, 

	[3271] = {
			[-1] = {{2},{},true ,0 ,false},
	}, 

	[16403] = {
			[-1] = {{11},{},false ,0 ,false},
	}, 

	[3277] = {
			[-1] = {{2},{},true ,0 ,false},
	}, 

	[16427] = {
			[-1] = {{13},{},false ,0 ,false},
	}, 

	[25122] = {
			[-1] = {{61},{},false ,0 ,false},
	}, 

	[16451] = {
			[-1] = {{13},{},false ,0 ,false},
	}, 

	[3283] = {
			[-1] = {{2},{},true ,0 ,false},
	}, 

	[24659] = {
			[-1] = {{9},{},false ,0 ,false},
	}, 

	[16499] = {
			[-1] = {{13},{},false ,0 ,false},
	}, 

	[25194] = {
			[-1] = {{62},{},false ,0 ,false},
	}, 

	[22136] = {
			[-1] = {{29},{},true ,0 ,false},
	}, 

	[14665] = {
			[-1] = {{4},{},true ,0 ,false},
	}, 

	[16547] = {
			[-1] = {{16},{},false ,0 ,false},
	}, 

	[25242] = {
			[-1] = {{62},{},false ,0 ,false},
	}, 

	[16571] = {
			[-1] = {{16},{},false ,0 ,false},
	}, 

	[14693] = {
			[-1] = {{4},{},false ,0 ,false},
	}, 

	[14705] = {
			[-1] = {{10},{},true ,0 ,true},
	}, 

	[21949] = {
			[-1] = {{19},{},false ,0 ,false},
	}, 

	[25817] = {
			[-1] = {{1015},{},false ,0 ,false},
	}, 

	[25314] = {
			[-1] = {{62},{},true ,50 ,true},
	}, 

	[22132] = {
			[-1] = {{29},{},false ,0 ,false},
	}, 

	[25841] = {
			[-1] = {{1015},{},false ,0 ,false},
	}, 

	[14729] = {
			[-1] = {{13},{},false ,0 ,false},
	}, 

	[3265] = {
			[-1] = {{2},{},true ,0 ,false},
	}, 

	[25865] = {
			[-1] = {{1015},{},false ,0 ,false},
	}, 

	[14741] = {
			[-1] = {{16},{},false ,0 ,false},
	}, 

	[25616] = {
			[-1] = {{49},{},false ,0 ,false},
	}, 

	[25889] = {
			[-1] = {{1015},{},false ,0 ,false},
	}, 

	[25386] = {
			[-1] = {{63},{},false ,0 ,false},
	}, 

	[16707] = {
			[-1] = {{4},{},true ,0 ,false},
	}, 

	[25610] = {
			[-1] = {{49},{},true ,0 ,false},
	}, 

	[25592] = {
			[-1] = {{49},{},false ,0 ,false},
	}, 

	[25586] = {
			[-1] = {{49},{},true ,0 ,false},
	}, 

	[25574] = {
			[-1] = {{49},{},false ,0 ,false},
	}, 

	[25434] = {
			[-1] = {{63},{},false ,0 ,false},
	}, 

	[25568] = {
			[-1] = {{49},{},true ,0 ,false},
	}, 

	[26031] = {
			[-1] = {{56},{},false ,0 ,false},
	}, 

	[25458] = {
			[-1] = {{63},{},false ,0 ,false},
	}, 

	[21937] = {
			[-1] = {{19},{},false ,0 ,false},
	}, 

	[24608] = {
			[-1] = {{8},{},true ,0 ,false},
	}, 

	[25482] = {
			[-1] = {{63},{},false ,0 ,false},
	}, 

	[21913] = {
			[-1] = {{29},{},true ,0 ,false},
	}, 

	[25019] = {
			[-1] = {{63},{},false ,0 ,false},
	}, 

	[16346] = {
			[-1] = {{4},{},false ,0 ,false},
	}, 

	[25003] = {
			[-1] = {{62},{},false ,0 ,false},
	}, 

	[25011] = {
			[-1] = {{63},{},false ,0 ,false},
	}, 

	[25530] = {
			[-1] = {{63},{},false ,0 ,false},
	}, 

	[21961] = {
			[-1] = {{19},{},false ,0 ,false},
	}, 

	[25554] = {
			[-1] = {{63},{},false ,0 ,false},
	}, 

	[23002] = {
			[-1] = {{28},{},true ,0 ,false},
	}, 

	[14845] = {
			[-1] = {{55},{},true ,0 ,false},
	}, 

	[16382] = {
			[-1] = {{11},{},false ,0 ,false},
	}, 

	[16388] = {
			[-1] = {{11},{},false ,0 ,false},
	}, 

	[14857] = {
			[-1] = {{55},{},false ,0 ,false},
	}, 

	[22051] = {
			[-1] = {{29},{},true ,0 ,false},
	}, 

	[16412] = {
			[-1] = {{55},{},true ,0 ,false},
	}, 

	[14869] = {
			[-1] = {{55},{},false ,0 ,false},
	}, 

	[22974] = {
			[-1] = {{28},{},true ,0 ,false},
	}, 

	[16436] = {
			[-1] = {{13},{},false ,0 ,false},
	}, 

	[25131] = {
			[-1] = {{61},{},true ,100 ,true},
	}, 

	[24671] = {
			[-1] = {{9},{},false ,0 ,false},
	}, 

	[16460] = {
			[-1] = {{13},{},false ,0 ,false},
	}, 

	[25155] = {
			[-1] = {{61},{},true ,100 ,true},
	}, 

	[24668] = {
			[-1] = {{9},{},false ,0 ,false},
	}, 

	[16640] = {
			[-1] = {{3},{},false ,0 ,false},
	}, 

	[25179] = {
			[-1] = {{62},{},true ,100 ,true},
	}, 

	[24650] = {
			[-1] = {{9},{},false ,0 ,false},
	}, 

	[16508] = {
			[-1] = {{16},{},false ,0 ,false},
	}, 

	[25203] = {
			[-1] = {{62},{},false ,0 ,false},
	}, 

	[24647] = {
			[-1] = {{9},{},false ,0 ,false},
	}, 

	[16532] = {
			[-1] = {{16},{},false ,0 ,false},
	}, 

	[24644] = {
			[-1] = {{9},{},false ,0 ,false},
	}, 

	[24638] = {
			[-1] = {{9},{},true ,0 ,false},
	}, 

	[16556] = {
			[-1] = {{16},{},false ,0 ,false},
	}, 

	[24635] = {
			[-1] = {{9},{},true ,0 ,false},
	}, 

	[16649] = {
			[-1] = {{3},{},false ,0 ,false},
	}, 

	[16580] = {
			[-1] = {{16},{},false ,0 ,false},
	}, 

	[25275] = {
			[-1] = {{62},{},true ,100 ,true},
	}, 

	[24626] = {
			[-1] = {{9},{},true ,0 ,false},
	}, 

	[24620] = {
			[-1] = {{9},{},false ,0 ,false},
	}, 

	[25299] = {
			[-1] = {{62},{},false ,50 ,false},
	}, 

	[24614] = {
			[-1] = {{9},{},false ,0 ,false},
	}, 

	[25826] = {
			[-1] = {{1015},{},false ,0 ,false},
	}, 

	[25323] = {
			[-1] = {{62},{},true ,100 ,true},
	}, 

	[16658] = {
			[-1] = {{3},{},false ,0 ,false},
	}, 

	[25850] = {
			[-1] = {{1015},{},false ,0 ,false},
	}, 

	[16358] = {
			[-1] = {{9005},{},false ,0 ,false},
	}, 

	[22201] = {
			[-1] = {{29},{},false ,0 ,false},
	}, 

	[25874] = {
			[-1] = {{1015},{},false ,0 ,false},
	}, 

	[25371] = {
			[-1] = {{63},{},false ,0 ,false},
	}, 

	[16692] = {
			[-1] = {{4},{},true ,0 ,false},
	}, 

	[25898] = {
			[-1] = {{1015},{},false ,0 ,false},
	}, 

	[25395] = {
			[-1] = {{63},{},false ,0 ,false},
	}, 

	[22200] = {
			[-1] = {{29},{},false ,0 ,false},
	}, 

	[22135] = {
			[-1] = {{29},{},true ,0 ,false},
	}, 

	[25419] = {
			[-1] = {{63},{},false ,0 ,false},
	}, 

	[23383] = {
			[-1] = {{56},{},true ,0 ,false},
	}, 

	[24924] = {
			[-1] = {{34},{},false ,0 ,false},
	}, 

	[21904] = {
			[-1] = {{29},{},true ,0 ,false},
	}, 

	[22134] = {
			[-1] = {{29},{},false ,0 ,false},
	}, 

	[22131] = {
			[-1] = {{29},{},false ,0 ,false},
	}, 

	[22137] = {
			[-1] = {{29},{},false ,0 ,false},
	}, 

	[21898] = {
			[-1] = {{29},{},true ,0 ,false},
	}, 

	[22057] = {
			[-1] = {{29},{},true ,0 ,false},
	}, 

	[25491] = {
			[-1] = {{63},{},false ,0 ,false},
	}, 

	[21922] = {
			[-1] = {{19},{},false ,0 ,false},
	}, 

	[22128] = {
			[-1] = {{29},{},false ,0 ,false},
	}, 

	[25515] = {
			[-1] = {{63},{},false ,0 ,false},
	}, 

	[25012] = {
			[-1] = {{63},{},false ,0 ,false},
	}, 

	[22054] = {
			[-1] = {{29},{},true ,0 ,false},
	}, 

	[25539] = {
			[-1] = {{63},{},false ,0 ,false},
	}, 

	[21970] = {
			[-1] = {{19},{},false ,0 ,false},
	}, 

	[23067] = {
			[-1] = {{29},{},false ,0 ,true},
	}, 

	[14675] = {
			[-1] = {{9005},{},false ,0 ,false},
	}, 

	[23016] = {
			[-1] = {{28},{},false ,0 ,false},
	}, 

	[23064] = {
			[-1] = {{29},{},false ,0 ,false},
	}, 

	[23061] = {
			[-1] = {{29},{},false ,0 ,true},
	}, 

	[16397] = {
			[-1] = {{11},{},false ,0 ,false},
	}, 

	[25092] = {
			[-1] = {{61},{},true ,100 ,true},
	}, 

	[16421] = {
			[-1] = {{55},{},false ,0 ,false},
	}, 

	[22138] = {
			[-1] = {{29},{},false ,0 ,false},
	}, 

	[21952] = {
			[-1] = {{19},{},true ,0 ,false},
	}, 

	[16445] = {
			[-1] = {{13},{},false ,0 ,false},
	}, 

	[24629] = {
			[-1] = {{9},{},true ,0 ,false},
	}, 

	[22234] = {
			[-1] = {{29},{},false ,0 ,false},
	}, 

	[16469] = {
			[-1] = {{13},{},false ,0 ,false},
	}, 

	[24653] = {
			[-1] = {{9},{},false ,0 ,false},
	}, 

	[14744] = {
			[-1] = {{16},{},false ,0 ,false},
	}, 

	[16493] = {
			[-1] = {{13},{},false ,0 ,false},
	}, 

	[25188] = {
			[-1] = {{62},{},false ,0 ,false},
	}, 

	[22130] = {
			[-1] = {{29},{},false ,0 ,false},
	}, 

	[16517] = {
			[-1] = {{16},{},false ,0 ,false},
	}, 

	[16523] = {
			[-1] = {{16},{},false ,0 ,false},
	}, 

	[4576] = {
			[-1] = {{4},{},true ,0 ,false},
	}, 

	[16541] = {
			[-1] = {{16},{},false ,0 ,false},
	}, 

	[25236] = {
			[-1] = {{62},{},false ,0 ,false},
	}, 

	[14821] = {
			[-1] = {{16},{},false ,0 ,false},
	}, 

	[16565] = {
			[-1] = {{16},{},false ,0 ,false},
	}, 

	[14690] = {
			[-1] = {{4},{},false ,0 ,false},
	}, 

	[22202] = {
			[-1] = {{29},{},false ,0 ,false},
	}, 

	[16667] = {
			[-1] = {{4},{},false ,0 ,false},
	}, 

	[14702] = {
			[-1] = {{10},{},true ,0 ,false},
	}, 

	[16364] = {
			[-1] = {{10},{},false ,0 ,false},
	}, 

	[25811] = {
			[-1] = {{1015},{},false ,0 ,false},
	}, 

	[25308] = {
			[-1] = {{62},{},false ,0 ,false},
	}, 

	[26338] = {
			[-1] = {{63},{},false ,0 ,false},
	}, 

	[25835] = {
			[-1] = {{1015},{},false ,0 ,false},
	}, 

	[25332] = {
			[-1] = {{62},{},false ,0 ,false},
	}, 

	[14726] = {
			[-1] = {{13},{},false ,0 ,false},
	}, 

	[25859] = {
			[-1] = {{1015},{},false ,0 ,false},
	}, 

	[14738] = {
			[-1] = {{13},{},true ,0 ,true},
	}, 

	[14723] = {
			[-1] = {{13},{},false ,0 ,false},
	}, 

	[25883] = {
			[-1] = {{1015},{},false ,0 ,false},
	}, 

	[14720] = {
			[-1] = {{13},{},true ,0 ,false},
	}, 

	[16701] = {
			[-1] = {{4},{},true ,0 ,false},
	}, 

	[25907] = {
			[-1] = {{1015},{},false ,0 ,false},
	}, 

	[14875] = {
			[-1] = {{55},{},false ,0 ,false},
	}, 

	[16370] = {
			[-1] = {{10},{},false ,0 ,false},
	}, 

	[14860] = {
			[-1] = {{55},{},true ,0 ,false},
	}, 

	[25428] = {
			[-1] = {{63},{},false ,0 ,false},
	}, 

	[24933] = {
			[-1] = {{34},{},true ,0 ,false},
	}, 

	[14696] = {
			[-1] = {{10},{},true ,0 ,false},
	}, 

	[16025] = {
			[-1] = {{11},{},false ,0 ,false},
	}, 

	[14717] = {
			[-1] = {{11},{},false ,0 ,false},
	}, 

	[14699] = {
			[-1] = {{10},{},false ,0 ,false},
	}, 

	[16343] = {
			[-1] = {{2},{},false ,0 ,false},
	}, 

	[21931] = {
			[-1] = {{19},{},false ,0 ,false},
	}, 

	[14818] = {
			[-1] = {{4},{},false ,0 ,false},
	}, 

	[25524] = {
			[-1] = {{63},{},false ,0 ,false},
	}, 

	[21955] = {
			[-1] = {{19},{},false ,0 ,false},
	}, 

	[14830] = {
			[-1] = {{3},{},false ,0 ,false},
	}, 

	[25548] = {
			[-1] = {{63},{},false ,0 ,false},
	}, 

	[21979] = {
			[-1] = {{19},{},true ,0 ,false},
	}, 

	[16379] = {
			[-1] = {{11},{},false ,0 ,false},
	}, 

	[26150] = {
			[-1] = {{63},{},false ,0 ,false},
	}, 

	[14714] = {
			[-1] = {{10},{},false ,0 ,false},
	}, 

	[14708] = {
			[-1] = {{10},{},false ,0 ,false},
	}, 

	[16406] = {
			[-1] = {{11},{},false ,0 ,false},
	}, 

	[14866] = {
			[-1] = {{55},{},false ,0 ,false},
	}, 

	[16367] = {
			[-1] = {{10},{},false ,0 ,false},
	}, 

	[16430] = {
			[-1] = {{13},{},false ,0 ,false},
	}, 

	[25125] = {
			[-1] = {{61},{},false ,0 ,false},
	}, 

	[16361] = {
			[-1] = {{10},{},false ,0 ,false},
	}, 

	[16454] = {
			[-1] = {{13},{},false ,0 ,false},
	}, 

	[25149] = {
			[-1] = {{61},{},false ,0 ,false},
	}, 

	[14678] = {
			[-1] = {{4},{},false ,0 ,false},
	}, 

	[16478] = {
			[-1] = {{13},{},false ,0 ,false},
	}, 

	[25173] = {
			[-1] = {{62},{},true ,100 ,true},
	}, 

	[16355] = {
			[-1] = {{9005},{},false ,0 ,false},
	}, 

	[16352] = {
			[-1] = {{9005},{},false ,0 ,false},
	}, 

	[25197] = {
			[-1] = {{62},{},false ,0 ,false},
	}, 

	[16349] = {
			[-1] = {{9005},{},false ,0 ,false},
	}, 

	[16526] = {
			[-1] = {{16},{},false ,0 ,false},
	}, 

	[14684] = {
			[-1] = {{4},{},true ,0 ,true},
	}, 

	[14681] = {
			[-1] = {{4},{},false ,0 ,false},
	}, 

	[16550] = {
			[-1] = {{16},{},false ,0 ,false},
	}, 

	[25245] = {
			[-1] = {{62},{},false ,0 ,false},
	}, 

	[16637] = {
			[-1] = {{3},{},false ,0 ,false},
	}, 

	[16574] = {
			[-1] = {{16},{},false ,0 ,false},
	}, 

	[22203] = {
			[-1] = {{29},{},false ,0 ,false},
	}, 

	[16652] = {
			[-1] = {{3},{},false ,0 ,false},
	}, 

	[25293] = {
			[-1] = {{62},{},false ,0 ,false},
	}, 

	[22235] = {
			[-1] = {{29},{},false ,0 ,true},
	}, 

	[25820] = {
			[-1] = {{1015},{},false ,0 ,false},
	}, 

	[26339] = {
			[-1] = {{63},{},false ,0 ,false},
	}, 

	[16646] = {
			[-1] = {{3},{},false ,0 ,false},
	}, 

	[25844] = {
			[-1] = {{1015},{},false ,0 ,false},
	}, 

	[16662] = {
			[-1] = {{2},{},false ,0 ,false},
	}, 

	[25868] = {
			[-1] = {{1015},{},false ,0 ,false},
	}, 

	[25365] = {
			[-1] = {{63},{},false ,0 ,false},
	}, 

	[16686] = {
			[-1] = {{4},{},true ,0 ,false},
	}, 

	[25892] = {
			[-1] = {{1015},{},false ,0 ,false},
	}, 

	[25389] = {
			[-1] = {{63},{},false ,0 ,false},
	}, 

	[16634] = {
			[-1] = {{3},{},false ,0 ,false},
	}, 

	[14824] = {
			[-1] = {{3},{},false ,0 ,false},
	}, 

	[16340] = {
			[-1] = {{2},{},false ,0 ,false},
	}, 

	[16337] = {
			[-1] = {{2},{},false ,0 ,false},
	}, 

	[24918] = {
			[-1] = {{34},{},true ,0 ,false},
	}, 

	[3280] = {
			[-1] = {{2},{},true ,0 ,false},
	}, 

	[22379] = {
			[-1] = {{19},{},true ,0 ,false},
	}, 

	[24942] = {
			[-1] = {{34},{},false ,0 ,false},
	}, 

	[25461] = {
			[-1] = {{63},{},false ,0 ,false},
	}, 

	[21946] = {
			[-1] = {{19},{},false ,0 ,false},
	}, 

	[25485] = {
			[-1] = {{63},{},false ,0 ,false},
	}, 

	[21916] = {
			[-1] = {{29},{},true ,0 ,false},
	}, 

	[21943] = {
			[-1] = {{19},{},true ,0 ,false},
	}, 

	[21934] = {
			[-1] = {{19},{},true ,0 ,false},
	}, 

	[21940] = {
			[-1] = {{19},{},false ,0 ,false},
	}, 

	[25014] = {
			[-1] = {{63},{},false ,0 ,false},
	}, 

	[25533] = {
			[-1] = {{63},{},false ,0 ,false},
	}, 

	[22986] = {
			[-1] = {{8},{},false ,0 ,false},
	}, 

	[25016] = {
			[-1] = {{63},{},false ,0 ,false},
	}, 

	[25557] = {
			[-1] = {{63},{},false ,0 ,false},
	}, 

	[25010] = {
			[-1] = {{62},{},false ,0 ,false},
	}, 

	[25007] = {
			[-1] = {{62},{},false ,0 ,false},
	}, 

	[25004] = {
			[-1] = {{62},{},false ,0 ,false},
	}, 

	[16391] = {
			[-1] = {{11},{},false ,0 ,false},
	}, 

	[26147] = {
			[-1] = {{63},{},false ,0 ,false},
	}, 

	[26144] = {
			[-1] = {{62},{},false ,0 ,false},
	}, 

	[26153] = {
			[-1] = {{61},{},false ,0 ,false},
	}, 

	[26953] = {
			[-1] = {{9005},{},false ,0 ,false},
	}, 

	[26959] = {
			[-1] = {{9005},{},false ,0 ,false},
	}, 

	[26950] = {
			[-1] = {{4},{},false ,0 ,false},
	}, 

	[26837] = {
			[-1] = {{7},{},true ,0 ,true},
	}, 

	[26840] = {
			[-1] = {{7},{},false ,0 ,true},
	}, 

	[26843] = {
			[-1] = {{7},{},true ,0 ,true},
	}, 

	[27008] = {
			[-1] = {{63},{},false ,0 ,false},
	}, 

	[27011] = {
			[-1] = {{63},{},false ,0 ,false},
	}, 

	[27014] = {
			[-1] = {{63},{},true ,0 ,false},
	}, 

	[27017] = {
			[-1] = {{63},{},false ,0 ,false},
	}, 

	[25374] = {
			[-1] = {{63},{},true ,0 ,false},
	}, 

	[25377] = {
			[-1] = {{63},{},true ,0 ,false},
	}, 

	[25380] = {
			[-1] = {{63},{},true ,0 ,false},
	}, 

	[27023] = {
			[-1] = {{62},{},false ,0 ,false},
	}, 

	[27024] = {
			[-1] = {{63},{},false ,0 ,false},
	}, 

	[27043] = {
			[-1] = {{4},{},false ,0 ,false},
	}, 

	[27089] = {
			[-1] = {{13},{},true ,0 ,true},
	}, 

	[13763] = {
			[-1] = {{13},{},true ,0 ,true},
	}, 

	[8485] = {
			[-1] = {{21},{},true ,0 ,false},
	}, 

	[8488] = {
			[-1] = {{21},{},true ,0 ,false},
	}, 

	[8491] = {
			[-1] = {{21},{},true ,0 ,false},
	}, 

	[27432] = {
			[-1] = {{21},{},false ,0 ,false},
	}, 

	[27435] = {
			[-1] = {{21},{},false ,0 ,false},
	}, 

	[27438] = {
			[-1] = {{21},{},false ,0 ,false},
	}, 

	[27508] = {
			[-1] = {{21},{},false ,0 ,false},
	}, 

	[27511] = {
			[-1] = {{21},{},false ,0 ,false},
	}, 

	[27514] = {
			[-1] = {{21},{},false ,0 ,false},
	}, 

	[6973] = {
			[-1] = {{19},{},true ,0 ,true},
	}, 

	[6961] = {
			[-1] = {{19},{},true ,0 ,true},
	}, 

	[27548] = {
			[-1] = {{19},{},false ,0 ,true},
	}, 

	[27542] = {
			[-1] = {{19},{},false ,0 ,true},
	}, 

	[27545] = {
			[-1] = {{19},{},false ,0 ,true},
	}, 

	[27533] = {
			[-1] = {{39},{},true ,0 ,false},
	}, 

	[27536] = {
			[-1] = {{39},{},false ,0 ,false},
	}, 

	[27521] = {
			[-1] = {{39},{},true ,0 ,false},
	}, 

	[27524] = {
			[-1] = {{39},{},false ,0 ,false},
	}, 

	[27527] = {
			[-1] = {{39},{},true ,0 ,false},
	}, 

	[27530] = {
			[-1] = {{39},{},false ,0 ,false},
	}, 

	[6964] = {
			[-1] = {{19},{},true ,0 ,true},
	}, 

	[8500] = {
			[-1] = {{38},{},true ,0 ,false},
	}, 

	[28018] = {
			[-1] = {{38},{},false ,0 ,false},
	}, 

	[28021] = {
			[-1] = {{38},{},true ,0 ,false},
	}, 

	[28024] = {
			[-1] = {{38},{},true ,0 ,false},
	}, 

	[28041] = {
			[-1] = {{38},{},false ,0 ,false},
	}, 

	[28044] = {
			[-1] = {{38},{},false ,0 ,false},
	}, 

	[28030] = {
			[-1] = {{38},{},true ,0 ,true},
	}, 

	[8536] = {
			[-1] = {{22},{},false ,0 ,false},
	}, 

	[28405] = {
			[-1] = {{22},{},false ,0 ,false},
	}, 

	[6936] = {
			[-1] = {{20},{},false ,0 ,false},
	}, 

	[28436] = {
			[-1] = {{20},{},true ,0 ,false},
	}, 

	[28439] = {
			[-1] = {{20},{},true ,0 ,false},
	}, 

	[28442] = {
			[-1] = {{20},{},true ,0 ,false},
	}, 

	[28445] = {
			[-1] = {{20},{},true ,0 ,false},
	}, 

	[28448] = {
			[-1] = {{20},{},false ,0 ,false},
	}, 

	[28451] = {
			[-1] = {{20},{},false ,0 ,false},
	}, 

	[28454] = {
			[-1] = {{20},{},false ,0 ,false},
	}, 

	[28457] = {
			[-1] = {{20},{},false ,0 ,false},
	}, 

	[28460] = {
			[-1] = {{20},{},false ,0 ,false},
	}, 

	[28463] = {
			[-1] = {{20},{},false ,0 ,false},
	}, 

	[28466] = {
			[-1] = {{20},{},false ,0 ,false},
	}, 

	[28469] = {
			[-1] = {{20},{},false ,0 ,false},
	}, 

	[28472] = {
			[-1] = {{20},{},false ,0 ,true},
	}, 

	[28475] = {
			[-1] = {{20},{},false ,0 ,false},
	}, 

	[28478] = {
			[-1] = {{20},{},false ,0 ,false},
	}, 

	[28481] = {
			[-1] = {{20},{},false ,0 ,false},
	}, 

	[28484] = {
			[-1] = {{20},{},false ,0 ,false},
	}, 

	[28487] = {
			[-1] = {{20},{},false ,0 ,false},
	}, 

	[28490] = {
			[-1] = {{20},{},false ,0 ,false},
	}, 

	[3903] = {
			[-1] = {{20},{},false ,0 ,false},
	}, 

	[9832] = {
			[-1] = {{20},{},false ,0 ,false},
	}, 

	[9835] = {
			[-1] = {{20},{},false ,0 ,false},
	}, 

	[5667] = {
			[-1] = {{16},{},true ,0 ,false},
	}, 

	[28038] = {
			[-1] = {{16},{},true ,0 ,false},
	}, 

	[22024] = {
			[-1] = {{30},{},true ,0 ,false},
	}, 

	[22030] = {
			[-1] = {{30},{},false ,0 ,false},
	}, 

	[21982] = {
			[-1] = {{30},{},true ,0 ,false},
	}, 

	[21985] = {
			[-1] = {{30},{},false ,0 ,false},
	}, 

	[21988] = {
			[-1] = {{30},{},false ,0 ,false},
	}, 

	[21997] = {
			[-1] = {{30},{},false ,0 ,false},
	}, 

	[21991] = {
			[-1] = {{30},{},false ,0 ,false},
	}, 

	[22000] = {
			[-1] = {{30},{},true ,0 ,false},
	}, 

	[22003] = {
			[-1] = {{30},{},false ,0 ,false},
	}, 

	[27491] = {
			[-1] = {{30},{},true ,0 ,false},
	}, 

	[22045] = {
			[-1] = {{30},{},true ,0 ,false},
	}, 

	[27494] = {
			[-1] = {{30},{},true ,0 ,false},
	}, 

	[22048] = {
			[-1] = {{30},{},true ,0 ,false},
	}, 

	[22042] = {
			[-1] = {{30},{},true ,0 ,false},
	}, 

	[27485] = {
			[-1] = {{30},{},false ,0 ,false},
	}, 

	[27488] = {
			[-1] = {{30},{},false ,0 ,false},
	}, 

	[27479] = {
			[-1] = {{30},{},false ,0 ,false},
	}, 

	[27482] = {
			[-1] = {{30},{},false ,0 ,false},
	}, 

	[27476] = {
			[-1] = {{30},{},false ,0 ,false},
	}, 

	[23429] = {
			[-1] = {{41},{},true ,0 ,true},
	}, 

	[28802] = {
			[-1] = {{41},{},false ,0 ,true},
	}, 

	[28805] = {
			[-1] = {{41},{},false ,0 ,true},
	}, 

	[28814] = {
			[-1] = {{41},{},false ,0 ,true},
	}, 

	[28811] = {
			[-1] = {{41},{},false ,0 ,true},
	}, 

	[28817] = {
			[-1] = {{41},{},true ,0 ,true},
	}, 

	[28820] = {
			[-1] = {{41},{},false ,0 ,true},
	}, 

	[28831] = {
			[-1] = {{41},{},false ,0 ,true},
	}, 

	[5423] = {
			[-1] = {{17},{},true ,0 ,false},
	}, 

	[28833] = {
			[-1] = {{17},{},false ,0 ,false},
	}, 

	[6930] = {
			[-1] = {{20},{},true ,0 ,false},
	}, 

	[10420] = {
			[-1] = {{32},{},true ,0 ,false},
	}, 

	[10423] = {
			[-1] = {{32},{},true ,0 ,false},
	}, 

	[10426] = {
			[-1] = {{32},{},false ,0 ,true},
	}, 

	[26058] = {
			[-1] = {{44},{},true ,0 ,false},
	}, 

	[26067] = {
			[-1] = {{44},{},true ,0 ,false},
	}, 

	[27640] = {
			[-1] = {{44},{},false ,0 ,false},
	}, 

	[27649] = {
			[-1] = {{44},{},false ,0 ,false},
	}, 

	[28920] = {
			[-1] = {{61},{},false ,100 ,true},
	}, 

	[10746] = {
			[-1] = {{25},{},false ,0 ,true},
	}, 

	[28772] = {
			[-1] = {{25},{},true ,0 ,true},
	}, 

	[28934] = {
			[-1] = {{25},{},false ,0 ,true},
	}, 

	[28928] = {
			[-1] = {{25},{},true ,0 ,true},
	}, 

	[27621] = {
			[-1] = {{29},{},false ,0 ,true},
	}, 

	[27624] = {
			[-1] = {{29},{},false ,0 ,true},
	}, 

	[29292] = {
			[-1] = {{62},{},false ,0 ,false},
	}, 

	[29325] = {
			[-1] = {{63},{},false ,0 ,false},
	}, 

	[29304] = {
			[-1] = {{63},{},false ,100 ,true},
	}, 

	[29307] = {
			[-1] = {{63},{},false ,0 ,false},
	}, 

	[29310] = {
			[-1] = {{63},{},false ,0 ,false},
	}, 

	[29313] = {
			[-1] = {{63},{},false ,0 ,false},
	}, 

	[29316] = {
			[-1] = {{63},{},false ,0 ,false},
	}, 

	[29319] = {
			[-1] = {{63},{},false ,0 ,false},
	}, 

	[29301] = {
			[-1] = {{63},{},false ,100 ,true},
	}, 

	[29509] = {
			[-1] = {{63},{},false ,100 ,true},
	}, 

	[25922] = {
			[-1] = {{62},{},true ,100 ,true},
	}, 

	[29819] = {
			[-1] = {{1304},{},false ,100 ,false},
	}, 

	[29820] = {
			[-1] = {{1304},{},false ,100 ,false},
	}, 

	[29840] = {
			[-1] = {{1301},{},false ,100 ,false},
	}, 

	[29841] = {
			[-1] = {{1301},{},false ,100 ,false},
	}, 

	[29842] = {
			[-1] = {{1301},{},false ,100 ,false},
	}, 

	[29843] = {
			[-1] = {{1301},{},false ,100 ,false},
	}, 

	[32960] = {
			[-1] = {{7},{},false ,0 ,true},
	}, 

	[32888] = {
			[-1] = {{7},{},false ,0 ,true},
	}, 

	[32891] = {
			[-1] = {{7},{},false ,0 ,true},
	}, 

	[32894] = {
			[-1] = {{7},{},false ,0 ,true},
	}, 

	[32897] = {
			[-1] = {{7},{},false ,0 ,true},
	}, 

	[32900] = {
			[-1] = {{7},{},false ,0 ,true},
	}, 

	[32906] = {
			[-1] = {{7},{},true ,0 ,true},
	}, 

	[32909] = {
			[-1] = {{7},{},false ,0 ,true},
	}, 

	[32912] = {
			[-1] = {{7},{},false ,0 ,true},
	}, 

	[32915] = {
			[-1] = {{7},{},false ,0 ,true},
	}, 

	[32918] = {
			[-1] = {{7},{},false ,0 ,true},
	}, 

	[32921] = {
			[-1] = {{7},{},false ,0 ,true},
	}, 

	[32982] = {
			[-1] = {{7},{},false ,0 ,true},
	}, 

	[4603] = {
			[-1] = {{7},{},false ,0 ,true},
	}, 

	[32957] = {
			[-1] = {{7},{},false ,0 ,true},
	}, 

	[4588] = {
			[-1] = {{7},{},true ,0 ,false},
	}, 

	[4591] = {
			[-1] = {{7},{},true ,0 ,false},
	}, 

	[6210] = {
			[-1] = {{7},{},true ,0 ,false},
	}, 

	[26834] = {
			[-1] = {{7},{},true ,0 ,false},
	}, 

	[3519] = {
			[-1] = {{3},{},true ,0 ,false},
	}, 

	[32832] = {
			[-1] = {{3},{},true ,0 ,false},
	}, 

	[32823] = {
			[-1] = {{3},{},true ,0 ,false},
	}, 

	[32829] = {
			[-1] = {{3},{},false ,0 ,false},
	}, 

	[32826] = {
			[-1] = {{3},{},false ,0 ,false},
	}, 

	[14833] = {
			[-1] = {{3},{},false ,0 ,false},
	}, 

	[16643] = {
			[-1] = {{3},{},false ,0 ,false},
	}, 

	[32838] = {
			[-1] = {{3},{},false ,0 ,false},
	}, 

	[14836] = {
			[-1] = {{3},{},false ,0 ,false},
	}, 

	[32841] = {
			[-1] = {{3},{},true ,0 ,false},
	}, 

	[3561] = {
			[-1] = {{3},{},false ,0 ,false},
	}, 

	[32853] = {
			[-1] = {{3},{},true ,0 ,false},
	}, 

	[32856] = {
			[-1] = {{3},{},false ,0 ,false},
	}, 

	[16655] = {
			[-1] = {{3},{},false ,0 ,false},
	}, 

	[14839] = {
			[-1] = {{3},{},false ,0 ,false},
	}, 

	[14842] = {
			[-1] = {{3},{},false ,0 ,false},
	}, 

	[32865] = {
			[-1] = {{3},{},false ,0 ,false},
	}, 

	[32868] = {
			[-1] = {{3},{},false ,0 ,false},
	}, 

	[32835] = {
			[-1] = {{3},{},false ,0 ,false},
	}, 

	[32859] = {
			[-1] = {{3},{},false ,0 ,false},
	}, 

	[22794] = {
			[-1] = {{2003},{},true ,0 ,false},
	}, 

	[34333] = {
			[-1] = {{2003},{},false ,0 ,false},
	}, 

	[32933] = {
			[-1] = {{7},{},true ,0 ,true},
	}, 

	[32951] = {
			[-1] = {{7},{},true ,0 ,true},
	}, 

	[32942] = {
			[-1] = {{7},{},true ,0 ,true},
	}, 

	[32945] = {
			[-1] = {{7},{},true ,0 ,true},
	}, 

	[35097] = {
			[-1] = {{1006},{},true ,0 ,false},
	}, 

	[35100] = {
			[-1] = {{1006},{},false ,0 ,false},
	}, 

	[35106] = {
			[-1] = {{1006},{},false ,0 ,false},
	}, 

	[35103] = {
			[-1] = {{1006},{},false ,0 ,false},
	}, 

	[35109] = {
			[-1] = {{1006},{},true ,0 ,false},
	}, 

	[35115] = {
			[-1] = {{1006},{},true ,0 ,false},
	}, 

	[35133] = {
			[-1] = {{1006},{},true ,0 ,false},
	}, 

	[35139] = {
			[-1] = {{1006},{},true ,0 ,false},
	}, 

	[35142] = {
			[-1] = {{1006},{},true ,0 ,false},
	}, 

	[35145] = {
			[-1] = {{1006},{},true ,0 ,false},
	}, 

	[35148] = {
			[-1] = {{1006},{},true ,0 ,false},
	}, 

	[35151] = {
			[-1] = {{1006},{},true ,0 ,false},
	}, 

	[35112] = {
			[-1] = {{1006},{},false ,0 ,false},
	}, 

	[35118] = {
			[-1] = {{1006},{},false ,0 ,false},
	}, 

	[35124] = {
			[-1] = {{1006},{},false ,0 ,false},
	}, 

	[35127] = {
			[-1] = {{1006},{},false ,0 ,false},
	}, 

	[35130] = {
			[-1] = {{1006},{},false ,0 ,false},
	}, 

	[35591] = {
			[-1] = {{69},{},true ,0 ,false},
	}, 

	[35597] = {
			[-1] = {{69},{},false ,0 ,true},
	}, 

	[35600] = {
			[-1] = {{69},{},false ,0 ,false},
	}, 

	[35645] = {
			[-1] = {{10},{},false ,0 ,true},
	}, 

	[35326] = {
			[-1] = {{67},{},false ,0 ,true},
	}, 

	[35344] = {
			[-1] = {{67},{},false ,0 ,true},
	}, 

	[35335] = {
			[-1] = {{67},{},true ,0 ,true},
	}, 

	[35353] = {
			[-1] = {{67},{},false ,0 ,true},
	}, 

	[35711] = {
			[-1] = {{67},{},false ,0 ,true},
	}, 

	[35901] = {
			[-1] = {{4},{},false ,0 ,true},
	}, 

	[35714] = {
			[-1] = {{4},{},false ,0 ,true},
	}, 

	[35717] = {
			[-1] = {{4},{},false ,0 ,true},
	}, 

	[35723] = {
			[-1] = {{4},{},false ,0 ,true},
	}, 

	[36487] = {
			[-1] = {{4},{},false ,0 ,true},
	}, 

	[35392] = {
			[-1] = {{4},{},false ,0 ,true},
	}, 

	[36481] = {
			[-1] = {{4},{},false ,0 ,true},
	}, 

	[35720] = {
			[-1] = {{4},{},false ,0 ,true},
	}, 

	[36912] = {
			[-1] = {{4},{},true ,0 ,true},
	}, 

	[36953] = {
			[-1] = {{4},{},false ,0 ,true},
	}, 

	[35395] = {
			[-1] = {{4},{},false ,0 ,true},
	}, 

	[35398] = {
			[-1] = {{67},{},false ,0 ,true},
	}, 

	[35347] = {
			[-1] = {{67}, {}, true, 0,true},
	}, 

	[36845] = {
			[-1] = {{4},{},false ,0 ,true},
	}, 

	[36842] = {
			[-1] = {{4},{},false ,0 ,true},
	}, 

	[36909] = {
			[-1] = {{67},{},false ,0 ,true},
	}, 

	[35419] = {
			[-1] = {{67},{},false ,0 ,true},
	}, 

	[35726] = {
			[-1] = {{67},{},false ,0 ,true},
	}, 

	[35615] = {
			[-1] = {{69,10},{},false ,0 ,false},
	}, 

	[35612] = {
			[-1] = {{69,10},{},false ,0 ,false},
	}, 

	[35624] = {
			[-1] = {{69,10},{},false ,0 ,false},
	}, 

	[35621] = {
			[-1] = {{69,10},{},false ,0 ,false},
	}, 

	[35618] = {
			[-1] = {{69,10},{},false ,0 ,false},
	}, 

	[35627] = {
			[-1] = {{69,10},{},false ,0 ,false},
	}, 

	[35329] = {
			[-1] = {{67},{},true ,0 ,true},
	}, 

	[37544] = {
			[-1] = {{67},{},false ,0 ,true},
	}, 

	[37529] = {
			[-1] = {{67},{},false ,0 ,true},
	}, 

	[37535] = {
			[-1] = {{67},{},false ,0 ,true},
	}, 

	[37541] = {
			[-1] = {{67},{},false ,0 ,true},
	}, 

	[37547] = {
			[-1] = {{4},{},false ,0 ,true},
	}, 

	[35314] = {
			[-1] = {{67},{},true ,0 ,true},
	}, 

	[37412] = {
			[-1] = {{67},{},false ,0 ,true},
	}, 

	[35699] = {
			[-1] = {{4},{},true ,0 ,true},
	}, 

	[36484] = {
			[-1] = {{4}, {}, true, 0,true},
	}, 

	[36956] = {
			[-1] = {{4},{},false ,0 ,true},
	}, 

	[36490] = {
			[-1] = {{4}, {}, true, 0,true},
	}, 

	[37538] = {
			[-1] = {{67},{},false ,0 ,true},
	}, 

	[37835] = {
			[-1] = {{67},{},false ,0 ,true},
	}, 

	[38111] = {
			[-1] = {{69},{},false ,0 ,true},
	}, 

	[35594] = {
			[-1] = {{69},{},false ,0 ,true},
	}, 

	[37449] = {
			[-1] = {{69},{},false ,0 ,true},
	}, 

	[36900] = {
			[-1] = {{69},{},false ,0 ,true},
	}, 

	[36897] = {
			[-1] = {{69},{},false ,0 ,true},
	}, 

	[35630] = {
			[-1] = {{10},{},true ,0 ,true},
	}, 

	[37941] = {
			[-1] = {{4},{},false ,0 ,true},
	}, 

	[37956] = {
			[-1] = {{4},{},false ,0 ,true},
	}, 

	[37947] = {
			[-1] = {{4},{},false ,0 ,true},
	}, 

	[37959] = {
			[-1] = {{4},{},false ,0 ,true},
	}, 

	[37950] = {
			[-1] = {{4},{},false ,0 ,true},
	}, 

	[37998] = {
			[-1] = {{4},{},false ,0 ,true},
	}, 

	[36713] = {
			[-1] = {{69},{},false ,0 ,true},
	}, 

	[36710] = {
			[-1] = {{69},{},false ,0 ,true},
	}, 

	[36716] = {
			[-1] = {{69},{},false ,0 ,true},
	}, 

	[36701] = {
			[-1] = {{69},{},false ,0 ,true},
	}, 

	[37809] = {
			[-1] = {{69},{},false ,0 ,true},
	}, 

	[36704] = {
			[-1] = {{69},{},false ,0 ,true},
	}, 

	[36707] = {
			[-1] = {{69},{},false ,0 ,true},
	}, 

	[37560] = {
			[-1] = {{69},{},false ,0 ,true},
	}, 

	[35853] = {
			[-1] = {{69},{},false ,0 ,true},
	}, 

	[36692] = {
			[-1] = {{73},{},false ,0 ,true},
	}, 

	[36695] = {
			[-1] = {{73},{},false ,0 ,true},
	}, 

	[36698] = {
			[-1] = {{73},{},false ,0 ,true},
	}, 

	[44108] = {
			[-1] = {{73},{},false ,0 ,true},
	}, 

	[44111] = {
			[-1] = {{73},{},false ,0 ,true},
	}, 

	[44114] = {
			[-1] = {{73},{},false ,0 ,true},
	}, 

	[44117] = {
			[-1] = {{73},{},false ,0 ,true},
	}, 

	[35861] = {
			[-1] = {{73},{},false ,0 ,true},
	}, 

	[35416] = {
			[-1] = {{73},{},false ,0 ,true},
	}, 

	[35410] = {
			[-1] = {{73},{},false ,0 ,true},
	}, 

	[35413] = {
			[-1] = {{73},{},false ,0 ,true},
	}, 

	[35609] = {
			[-1] = {{69},{},false ,0 ,true},
	}, 

	[35633] = {
			[-1] = {{10},{},false ,0 ,true},
	}, 

	[44130] = {
			[-1] = {{67},{},true ,0 ,true},
	}, 

	[44133] = {
			[-1] = {{67},{},false ,0 ,true},
	}, 

	[44154] = {
			[-1] = {{67},{},false ,0 ,true},
	}, 

	[44157] = {
			[-1] = {{67},{},false ,0 ,true},
	}, 

	[44160] = {
			[-1] = {{67},{},false ,0 ,true},
	}, 

	[37953] = {			[-1] = {{67},{},true ,0 ,true},	}, 

	[44145] = {
			[-1] = {{67},{},false ,0 ,true},
	}, 

	[35341] = {
			[-1] = {{67},{},false ,0 ,true},
	}, 

	[35651] = {
			[-1] = {{69},{},true ,0 ,true},
	}, 

	[44314] = {
			[-1] = {{67},{},false ,0 ,true},
	}, 

	[44317] = {
			[-1] = {{67},{},false ,0 ,true},
	}, 

	[44320] = {
			[-1] = {{67},{},false ,0 ,true},
	}, 

	[44323] = {
			[-1] = {{67},{},false ,0 ,true},
	}, 

	[44326] = {
			[-1] = {{67},{},false ,0 ,true},
	}, 

	[44329] = {
			[-1] = {{67},{},false ,0 ,true},
	}, 

	[44332] = {
			[-1] = {{67},{},false ,0 ,true},
	}, 

	[44338] = {
			[-1] = {{67},{},false ,0 ,true},
	}, 

	[35864] = {
			[-1] = {{67},{},false ,0 ,true},
	}, 

	[44274] = {
			[-1] = {{4},{},false ,0 ,true},
	}, 

	[44271] = {
			[-1] = {{4},{},false ,0 ,true},
	}, 

	[44343] = {
			[-1] = {{10},{},false ,0 ,true},
	}, 

	[44346] = {
			[-1] = {{10},{},false ,0 ,true},
	}, 

	[44349] = {
			[-1] = {{10},{},false ,0 ,true},
	}, 

	[44352] = {
			[-1] = {{10},{},false ,0 ,true},
	}, 

	[44355] = {
			[-1] = {{10},{},false ,0 ,true},
	}, 

	[44358] = {
			[-1] = {{10},{},false ,0 ,true},
	}, 

	[44335] = {
			[-1] = {{67},{},false ,0 ,true},
	}, 

	[44151] = {
			[-1] = {{4},{},true ,0 ,true},
	}, 

	[44136] = {
			[-1] = {{67},{},false ,0 ,true},
	}, 

	[44139] = {
			[-1] = {{67},{},false ,0 ,true},
	}, 

	[44142] = {
			[-1] = {{67},{},false ,0 ,true},
	}, 

	[44510] = {
			[-1] = {{67},{},false ,0 ,true},
	}, 

	[45502] = {
			[-1] = {{68},{},true ,0 ,true},
	}, 

	[36764] = {
			[-1] = {{1221}, {}, true, 0,true},
	}, 

	[35922] = {
			[-1] = {{68},{},true ,0 ,true},
	}, 

	[45233] = {
			[-1] = {{1221}, {}, true, 0,true},
	}, 

	[35931] = {
			[-1] = {{68}, {}, false, 0,true},
	}, 

	[35934] = {
			[-1] = {{1051}, {}, false, 0,true},
	}, 

	[35937] = {
			[-1] = {{1051}, {}, false, 0,true},
	}, 

	[35940] = {
			[-1] = {{68},{},false ,0 ,true},
	}, 

	[35943] = {
			[-1] = {{68},{},false ,0 ,true},
	}, 

	[35949] = {
			[-1] = {{68},{},false ,0 ,true},
	}, 

	[38105] = {
			[-1] = {{68},{},false ,0 ,true},
	}, 

	[38108] = {
			[-1] = {{68},{},false ,0 ,true},
	}, 

	[35970] = {
			[-1] = {{68},{},false ,0 ,true},
	}, 

	[35958] = {
			[-1] = {{68},{},false ,0 ,true},
	}, 

	[35967] = {
			[-1] = {{68},{},false ,0 ,true},
	}, 

	[35955] = {
			[-1] = {{68},{},false ,0 ,true},
	}, 

	[36767] = {
			[-1] = {{68},{},false ,0 ,true},
	}, 

	[36782] = {
			[-1] = {{68},{},false ,0 ,true},
	}, 

	[36768] = {
			[-1] = {{68},{},false ,0 ,true},
	}, 

	[35994] = {
			[-1] = {{68},{},false ,0 ,true},
	}, 

	[35985] = {
			[-1] = {{68},{},false ,0 ,true},
	}, 

	[36000] = {
			[-1] = {{68},{},false ,0 ,true},
	}, 

	[35946] = {
			[-1] = {{72},{},false ,0 ,true},
	}, 

	[35973] = {
			[-1] = {{72},{},false ,0 ,true},
	}, 

	[44418] = {
			[-1] = {{72},{},false ,0 ,true},
	}, 

	[44421] = {
			[-1] = {{72},{},false ,0 ,true},
	}, 

	[44424] = {
			[-1] = {{72},{},false ,0 ,true},
	}, 

	[44427] = {
			[-1] = {{72},{},false ,0 ,true},
	}, 

	[44430] = {
			[-1] = {{72},{},false ,0 ,true},
	}, 

	[44433] = {
			[-1] = {{72},{},false ,0 ,true},
	}, 

	[44436] = {
			[-1] = {{72},{},false ,0 ,true},
	}, 

	[44439] = {
			[-1] = {{72},{},false ,0 ,true},
	}, 

	[36006] = {
			[-1] = {{72},{},false ,0 ,true},
	}, 

	[36009] = {
			[-1] = {{72},{},false ,0 ,true},
	}, 

	[36818] = {
			[-1] = {{72},{},false ,0 ,true},
	}, 

	[36012] = {
			[-1] = {{72},{},false ,0 ,true},
	}, 

	[36015] = {
			[-1] = {{72},{},false ,0 ,true},
	}, 

	[36812] = {
			[-1] = {{72},{},false ,0 ,true},
	}, 

	[36018] = {
			[-1] = {{72},{},false ,0 ,true},
	}, 

	[36021] = {
			[-1] = {{72},{},false ,0 ,true},
	}, 

	[36815] = {
			[-1] = {{72},{},false ,0 ,true},
	}, 

	[35979] = {
			[-1] = {{72},{},false ,0 ,true},
	}, 

	[36778] = {
			[-1] = {{72},{},false ,0 ,true},
	}, 

	[36779] = {
			[-1] = {{72},{},false ,0 ,true},
	}, 

	[36147] = {
			[-1] = {{68},{},true ,0 ,true},
	}, 

	[36150] = {
			[-1] = {{68},{},true ,0 ,true},
	}, 

	[36153] = {
			[-1] = {{68},{},true ,0 ,true},
	}, 

	[36156] = {
			[-1] = {{68},{},true ,0 ,true},
	}, 

	[36159] = {
			[-1] = {{68},{},true ,0 ,true},
	}, 

	[36162] = {
			[-1] = {{68},{},true ,0 ,true},
	}, 

	[36165] = {
			[-1] = {{68},{},true ,0 ,true},
	}, 

	[36168] = {
			[-1] = {{68},{},true ,0 ,true},
	}, 

	[36171] = {
			[-1] = {{68},{},true ,0 ,true},
	}, 

	[36174] = {
			[-1] = {{68},{},true ,0 ,true},
	}, 

	[44725] = {
			[-1] = {{72},{},false ,0 ,true},
	}, 

	[44728] = {
			[-1] = {{72},{},false ,0 ,true},
	}, 

	[44731] = {
			[-1] = {{72},{},false ,0 ,true},
	}, 

	[44734] = {
			[-1] = {{72},{},false ,0 ,true},
	}, 

	[44737] = {
			[-1] = {{72},{},false ,0 ,true},
	}, 

	[44740] = {
			[-1] = {{72},{},false ,0 ,true},
	}, 

	[44743] = {
			[-1] = {{72},{},false ,0 ,true},
	}, 

	[44746] = {
			[-1] = {{72},{},false ,0 ,true},
	}, 

	[44749] = {
			[-1] = {{72},{},false ,0 ,true},
	}, 

	[44752] = {
			[-1] = {{72},{},false ,0 ,true},
	}, 

	[44755] = {
			[-1] = {{72},{},false ,0 ,true},
	}, 

	[44758] = {
			[-1] = {{72},{},false ,0 ,true},
	}, 

	[44761] = {
			[-1] = {{72},{},false ,0 ,true},
	}, 

	[44764] = {
			[-1] = {{72},{},false ,0 ,true},
	}, 

	[44767] = {
			[-1] = {{72},{},false ,0 ,true},
	}, 

	[44770] = {
			[-1] = {{72},{},false ,0 ,true},
	}, 

	[44773] = {
			[-1] = {{72},{},false ,0 ,true},
	}, 

	[44776] = {
			[-1] = {{72},{},false ,0 ,true},
	}, 

	[44779] = {
			[-1] = {{72},{},false ,0 ,true},
	}, 

	[44782] = {
			[-1] = {{72},{},false ,0 ,true},
	}, 

	[35925] = {
			[-1] = {{68,1051},{},true ,0 ,true},
	}, 

	[35928] = {
			[-1] = {{68,1051},{},true ,0 ,true},
	}, 

	[36117] = {
			[-1] = {{72},{},true ,0 ,true},
	}, 

	[36120] = {
			[-1] = {{72},{},true ,0 ,true},
	}, 

	[36123] = {
			[-1] = {{72},{},true ,0 ,true},
	}, 

	[36126] = {
			[-1] = {{72},{},true ,0 ,true},
	}, 

	[36129] = {
			[-1] = {{72},{},true ,0 ,true},
	}, 

	[36132] = {
			[-1] = {{72},{},true ,0 ,true},
	}, 

	[36135] = {
			[-1] = {{72},{},true ,0 ,true},
	}, 

	[36138] = {
			[-1] = {{72},{},true ,0 ,true},
	}, 

	[36141] = {
			[-1] = {{72},{},true ,0 ,true},
	}, 

	[36144] = {
			[-1] = {{72},{},true ,0 ,true},
	}, 

	[35425] = {
			[-1] = {{67},{},false ,0 ,true},
	}, 

	[44716] = {
			[-1] = {{4},{},false ,0 ,true},
	}, 

	[45173] = {
			[-1] = {{68},{},false ,0 ,true},
	}, 

	[45159] = {
			[-1] = {{68},{},false ,0 ,true},
	}, 

	[45227] = {
			[-1] = {{68},{},false ,0 ,true},
	}, 

	[45162] = {
			[-1] = {{72},{},false ,0 ,true},
	}, 

	[45230] = {
			[-1] = {{68},{},false ,0 ,true},
	}, 

	[10448] = {
			[-1] = {{67},{},true ,0 ,true},
	}, 

	[55860] = {
			[-1] = {{71}, {}, true, 0,true},
	}, 

	[55863] = {
			[-1] = {{71}, {}, false, 0,true},
	}, 

	[55869] = {
			[-1] = {{71}, {}, true, 0,false},
	}, 

	[55872] = {
			[-1] = {{71}, {}, false, 0,true},
	}, 

	[55866] = {
			[-1] = {{71}, {}, false, 0,true},
	}, 

	[55875] = {
			[-1] = {{71}, {}, false, 0,true},
	}, 

	[55878] = {
			[-1] = {{71}, {}, true, 0,false},
	}, 

	[55824] = {
			[-1] = {{71}, {}, true, 0,true},
	}, 

	[55830] = {
			[-1] = {{71}, {}, false, 0,true},
	}, 

	[55833] = {
			[-1] = {{71}, {}, false, 0,true},
	}, 

	[55836] = {
			[-1] = {{71}, {}, false, 0,true},
	}, 

	[55839] = {
			[-1] = {{71}, {}, false, 0,true},
	}, 

	[55842] = {
			[-1] = {{71}, {}, false, 0,true},
	}, 

	[55845] = {
			[-1] = {{71}, {}, false, 0,true},
	}, 

	[55848] = {
			[-1] = {{71}, {}, false, 0,true},
	}, 

	[55911] = {
			[-1] = {{71}, {}, true, 0,true},
	}, 

	[55914] = {
			[-1] = {{71}, {}, false, 0,true},
	}, 

	[55917] = {
			[-1] = {{71}, {}, false, 0,true},
	}, 

	[55920] = {
			[-1] = {{71}, {}, false, 0,true},
	}, 

	[55923] = {
			[-1] = {{71}, {}, true, 0,true},
	}, 

	[55926] = {
			[-1] = {{71}, {}, false, 0,true},
	}, 

	[55932] = {
			[-1] = {{71}, {}, false, 0,true},
	}, 

	[55935] = {
			[-1] = {{71}, {}, false, 0,true},
	}, 

	[55938] = {
			[-1] = {{71}, {}, false, 0,true},
	}, 

	[55941] = {
			[-1] = {{71}, {}, false, 0,true},
	}, 

	[55950] = {
			[-1] = {{71}, {}, false, 0,true},
	}, 

	[55953] = {
			[-1] = {{71}, {}, false, 0,true},
	}, 

	[55956] = {
			[-1] = {{71}, {}, false, 0,true},
	}, 

	[55959] = {
			[-1] = {{71}, {}, false, 0,true},
	}, 

	[55962] = {
			[-1] = {{71}, {}, false, 0,true},
	}, 

	[55965] = {
			[-1] = {{71}, {}, false, 0,true},
	}, 

	[55968] = {
			[-1] = {{71}, {}, true, 0,true},
	}, 

	[55974] = {
			[-1] = {{71}, {}, false, 0,true},
	}, 

	[55977] = {
			[-1] = {{71}, {}, false, 0,true},
	}, 

	[55980] = {
			[-1] = {{71}, {}, false, 0,true},
	}, 

	[55983] = {
			[-1] = {{71}, {}, false, 0,true},
	}, 

	[55986] = {
			[-1] = {{71}, {}, false, 0,true},
	}, 

	[55989] = {
			[-1] = {{71}, {}, false, 0,true},
	}, 

	[55992] = {
			[-1] = {{71}, {}, false, 0,true},
	}, 

	[57350] = {
			[-1] = {{71}, {}, true, 0,true},
	}, 

	[56122] = {
			[-1] = {{77}, {}, false, 0,false},
	}, 

	[56125] = {
			[-1] = {{77}, {}, false, 0,false},
	}, 

	[56128] = {
			[-1] = {{77}, {}, false, 0,false},
	}, 

	[56131] = {
			[-1] = {{77}, {}, false, 0,false},
	}, 

	[56134] = {
			[-1] = {{77}, {}, false, 0,false},
	}, 

	[56137] = {
			[-1] = {{77}, {}, false, 0,false},
	}, 

	[56140] = {
			[-1] = {{77}, {}, false, 0,false},
	}, 

	[56143] = {
			[-1] = {{77}, {}, false, 0,false},
	}, 

	[56146] = {
			[-1] = {{77}, {}, false, 0,false},
	}, 

	[56149] = {
			[-1] = {{77}, {}, false, 0,false},
	}, 

	[56152] = {
			[-1] = {{77}, {}, false, 0,false},
	}, 

	[56155] = {
			[-1] = {{77}, {}, false, 0,false},
	}, 

	[56158] = {
			[-1] = {{77}, {}, false, 0,false},
	}, 

	[56161] = {
			[-1] = {{77}, {}, true, 0,false},
	}, 

	[56164] = {
			[-1] = {{77}, {}, false, 0,false},
	}, 

	[56173] = {
			[-1] = {{77}, {}, false, 0,false},
	}, 

	[56176] = {
			[-1] = {{77}, {}, false, 0,false},
	}, 

	[56179] = {
			[-1] = {{77}, {}, false, 0,false},
	}, 

	[56212] = {
			[-1] = {{77}, {}, false, 0,true},
	}, 

	[56215] = {
			[-1] = {{77}, {}, false, 0,false},
	}, 

	[56218] = {
			[-1] = {{77}, {}, false, 0,false},
	}, 

	[56221] = {
			[-1] = {{77}, {}, true, 0,false},
	}, 

	[56230] = {
			[-1] = {{77}, {}, false, 0,true},
	}, 

	[56233] = {
			[-1] = {{77}, {}, false, 0,false},
	}, 

	[56236] = {
			[-1] = {{77}, {}, false, 0,true},
	}, 

	[56239] = {
			[-1] = {{77}, {}, false, 0,false},
	}, 

	[56245] = {
			[-1] = {{77}, {}, false, 0,false},
	}, 

	[56248] = {
			[-1] = {{77}, {}, false, 0,false},
	}, 

	[56251] = {
			[-1] = {{77}, {}, false, 0,false},
	}, 

	[56965] = {
			[-1] = {{77}, {}, false, 0,false},
	}, 

	[58832] = {
			[-1] = {{77}, {}, true, 0,false},
	}, 

	[58835] = {
			[-1] = {{77}, {}, true, 0,false},
	}, 

	[55636] = {
			[-1] = {{76}, {}, false, 0,true},
	}, 

	[55639] = {
			[-1] = {{76}, {}, false, 0,true},
	}, 

	[55642] = {
			[-1] = {{76}, {}, false, 0,true},
	}, 

	[55645] = {
			[-1] = {{76}, {}, false, 0,true},
	}, 

	[55648] = {
			[-1] = {{76}, {}, false, 0,true},
	}, 

	[55651] = {
			[-1] = {{76}, {}, false, 0,true},
	}, 

	[55594] = {
			[-1] = {{76}, {}, false, 0,true},
	}, 

	[55597] = {
			[-1] = {{76}, {}, false, 0,true},
	}, 

	[4576] = {
			[-1] = {{76}, {}, false, 0,true},
	}, 

	[55603] = {
			[-1] = {{76}, {}, false, 0,true},
	}, 

	[55606] = {
			[-1] = {{76}, {}, false, 0,true},
	}, 

	[56327] = {
			[-1] = {{76}, {}, false, 0,true},
	}, 

	[55633] = {
			[-1] = {{76}, {}, false, 0,true},
	}, 

	[55627] = {
			[-1] = {{76}, {}, false, 0,true},
	}, 

	[55630] = {
			[-1] = {{76}, {}, false, 0,true},
	}, 

	[56330] = {
			[-1] = {{76}, {}, false, 0,true},
	}, 

	[56333] = {
			[-1] = {{76}, {}, false, 0,true},
	}, 

	[55612] = {
			[-1] = {{76}, {}, false, 0,true},
	}, 

	[55663] = {
			[-1] = {{76}, {}, false, 0,true},
	}, 

	[56471] = {
			[-1] = {{76}, {}, false, 0,true},
	}, 

	[56456] = {
			[-1] = {{76}, {}, false, 0,true},
	}, 

	[56465] = {
			[-1] = {{76}, {}, false, 0,true},
	}, 

	[56462] = {
			[-1] = {{76}, {}, false, 0,true},
	}, 

	[56459] = {
			[-1] = {{76}, {}, false, 0,true},
	}, 

	[56468] = {
			[-1] = {{76}, {}, false, 0,true},
	}, 

	[55660] = {
			[-1] = {{76}, {}, false, 0,true},
	}, 

	[55618] = {
			[-1] = {{1310}, {}, false, 0,true},
	}, 

	[55624] = {
			[-1] = {{1310}, {}, false, 0,true},
	}, 

	[55609] = {
			[-1] = {{1310}, {}, false, 0,true},
	}, 

	[55621] = {
			[-1] = {{1310}, {}, false, 0,true},
	}, 

	[57294] = {
			[-1] = {{71}, {}, true, 0,false},
	}, 

	[57523] = {
			[-1] = {{71}, {}, false, 0,true},
	}, 

	[57300] = {
			[-1] = {{71}, {}, true, 0,false},
	}, 

	[57529] = {
			[-1] = {{71}, {}, false, 0,true},
	}, 

	[57514] = {
			[-1] = {{77}, {}, true, 0,false},
	}, 

	[58739] = {
			[-1] = {{75}, {}, false, 0,true},
	}, 

	[58742] = {
			[-1] = {{75}, {}, false, 0,false},
	}, 

	[58745] = {
			[-1] = {{75}, {}, true, 0,false},
	}, 

	[58748] = {
			[-1] = {{75}, {}, true, 0,false},
	}, 

	[58751] = {
		[-1] = {{75}, {}, true, 0,false},
	}, 

	[58754] = {
			[-1] = {{75}, {}, true, 0,false},
	}, 

	[58757] = {
			[-1] = {{75}, {}, true, 0,false},
	}, 

	[58792] = {
			[-1] = {{75}, {}, true, 0,true},
	}, 

	[58796] = {
			[-1] = {{75}, {}, true, 0,true},
	}, 

	[58799] = {
			[-1] = {{75}, {}, true, 0,true},
	}, 

	[58802] = {
			[-1] = {{75}, {}, true, 0,true},
	}, 

	[55699] = {
			[-1] = {{75}, {}, true, 0,true},
	}, 

	[55700] = {
			[-1] = {{75}, {}, true, 0,true},
	}, 

	[45568] = {
			[-1] = {{77}, {}, false, 0,false},
	}, 

	[55971] = {
			[-1] = {{75}, {}, false, 0,true},
	}, 

	[58760] = {
			[-1] = {{75}, {}, false, 0,true},
	}, 

	[58719] = {
			[-1] = {{77}, {}, true, 0,true},
	}, 

	[58789] = {			
[-1] = {{77}, {}, false, 0,true},
	}, 

	[59913] = {
			[-1] = {{78}, {}, false, 0,true},
	}, 

	[59914] = {
			[-1] = {{78}, {}, false, 0,true},
	}, 

	[59915] = {
			[-1] = {{78}, {}, false, 0,true},
	}, 

	[59916] = {
			[-1] = {{78}, {}, false, 0,true},
	}, 

	[59547] = {
			[-1] = {{78}, {}, false, 0,true},
	}, 

	[59526] = {
			[-1] = {{78}, {}, true, 0,false},
	}, 

	[59538] = {
			[-1] = {{78}, {}, true, 0,false},
	}, 

	[59541] = {
			[-1] = {{78}, {}, true, 0,false},
	}, 

	[59559] = {
			[-1] = {{78}, {}, true, 0,false},
	}, 

	[59883] = {
			[-1] = {{78}, {}, true, 0,false},
	}, 

	[59885] = {
			[-1] = {{78}, {}, true, 0,false},
	}, 

	[60306] = {
			[-1] = {{78}, {}, true, 0,false},
	}, 

	[60307] = {
			[-1] = {{78}, {}, true, 0,false},
	}, 

	[60310] = {
			[-1] = {{78}, {}, false, 0,true},
	}, 

	[60313] = {
			[-1] = {{78}, {}, true, 0,false},
	}, 

	[60325] = {
			[-1] = {{78}, {}, true, 0,false},
	}, 

	[60367] = {
			[-1] = {{78}, {}, true, 0,false},
	}, 

	[59529] = {
			[-1] = {{78}, {}, false, 0,true},
	}, 

	[59544] = {
			[-1] = {{78}, {}, false, 0,true},
	}, 

	[59550] = {
			[-1] = {{78}, {}, false, 0,true},
	}, 

	[59562] = {
			[-1] = {{78}, {}, false, 0,true},
	}, 

	[59884] = {
			[-1] = {{78}, {}, false, 0,true},
	}, 

	[59886] = {
			[-1] = {{78}, {}, false, 0,true},
	}, 

	[59925] = {
			[-1] = {{78}, {}, false, 0,true},
	}, 

	[59926] = {
			[-1] = {{78}, {}, false, 0,true},
	}, 

	[59927] = {
			[-1] = {{78}, {}, false, 0,true},
	}, 

	[59928] = {
			[-1] = {{78}, {}, false, 0,true},
	}, 

	[60308] = {
			[-1] = {{78}, {}, false, 0,true},
	}, 

	[60309] = {
			[-1] = {{78}, {}, false, 0,true},
	}, 

	[60314] = {
			[-1] = {{78}, {}, false, 0,true},
	}, 

	[60326] = {
			[-1] = {{78}, {}, false, 0,true},
	}, 

	[60327] = {
			[-1] = {{78}, {}, false, 0,true},
	}, 

	[60328] = {
			[-1] = {{78}, {}, false, 0,true},
	}, 

	[60329] = {
			[-1] = {{78}, {}, false, 0,true},
	}, 

	[60330] = {
			[-1] = {{78}, {}, false, 0,true},
	}, 

	[60331] = {
			[-1] = {{78}, {}, false, 0,true},
	}, 

	[59283] = {
			[-1] = {{79}, {}, true, 0,true},
	}, 

	[59289] = {
			[-1] = {{79}, {}, false, 0,true},
	}, 

	[59292] = {
			[-1] = {{79}, {}, true, 0,true},
	}, 

	[59298] = {
			[-1] = {{79}, {}, false, 0,true},
	}, 

	[59301] = {
			[-1] = {{79}, {}, true, 0,true},
	}, 

	[59304] = {
			[-1] = {{79}, {}, true, 0,true},
	}, 

	[59307] = {
			[-1] = {{79}, {}, true, 0,true},
	}, 

	[59310] = {
			[-1] = {{79}, {}, true, 0,true},
	}, 

	[59334] = {
			[-1] = {{79}, {}, true, 0,true},
	}, 

	[59337] = {
			[-1] = {{79}, {}, true, 0,true},
	}, 

	[59280] = {
			[-1] = {{79}, {}, true, 0,true},
	}, 

	[59346] = {
			[-1] = {{79}, {}, true, 0,true},
	}, 

	[59349] = {
			[-1] = {{79}, {}, false, 0,true},
	}, 

	[59409] = {
			[-1] = {{79}, {}, false, 0,true},
	}, 

	[59376] = {
			[-1] = {{79}, {}, true, 0,true},
	}, 

	[59379] = {
			[-1] = {{79}, {}, true, 0,true},
	}, 

	[59382] = {
			[-1] = {{79}, {}, true, 0,true},
	}, 

	[59385] = {
			[-1] = {{79}, {}, true, 0,true},
	}, 

	[59388] = {
			[-1] = {{79}, {}, true, 0,true},
	}, 

	[59391] = {
			[-1] = {{79}, {}, true, 0,true},
	}, 

	[59394] = {
			[-1] = {{79}, {}, true, 0,true},
	}, 

	[59484] = {
			[-1] = {{81}, {}, false, 0,true},
	}, 

	[59487] = {
			[-1] = {{81}, {}, false, 0,true},
	}, 

	[59490] = {
			[-1] = {{81}, {}, true, 0,true},
	}, 

	[59493] = {
			[-1] = {{81}, {}, false, 0,true},
	}, 

	[59496] = {
			[-1] = {{81}, {}, false, 0,true},
	}, 

	[59499] = {
			[-1] = {{81}, {}, false, 0,true},
	}, 

	[59502] = {
			[-1] = {{81}, {}, false, 0,true},
	}, 

	[59505] = {
			[-1] = {{81}, {}, false, 0,true},
	}, 

	[59508] = {
			[-1] = {{81}, {}, false, 0,true},
	}, 

	[59511] = {
			[-1] = {{81}, {}, false, 0,true},
	}, 

	[59514] = {
			[-1] = {{81}, {}, false, 0,true},
	}, 

	[59451] = {
			[-1] = {{81}, {}, true, 0,true},
	}, 

	[59454] = {
			[-1] = {{81}, {}, false, 0,true},
	}, 

	[59466] = {
			[-1] = {{81}, {}, false, 0,true},
	}, 

	[59469] = {
			[-1] = {{81}, {}, false, 0,true},
	}, 

	[59472] = {
			[-1] = {{81}, {}, false, 0,true},
	}, 

	[59361] = {
			[-1] = {{79}, {}, false, 0,true},
	}, 

	[60202] = {
			[-1] = {{81}, {}, false, 0,true},
	}, 

	[61567] = {
			[-1] = {{82}, {}, true, 0,true},
	}, 

	[61267] = {
			[-1] = {{82}, {}, true, 0,true},
	}, 

	[61270] = {
			[-1] = {{82}, {}, true, 0,true},
	}, 

	[61273] = {
			[-1] = {{82}, {}, false, 0,true},
	}, 

	[61276] = {
			[-1] = {{82}, {}, true, 0,true},
	}, 

	[61279] = {
			[-1] = {{82}, {}, false, 0,true},
	}, 

	[61282] = {
			[-1] = {{82}, {}, false, 0,true},
	}, 

	[61285] = {
			[-1] = {{82}, {}, false, 0,true},
	}, 

	[61303] = {
			[-1] = {{82}, {}, false, 0,true},
	}, 

	[61309] = {
			[-1] = {{89}, {}, false, 0,true},
	}, 

	[61318] = {
			[-1] = {{82}, {}, false, 0,true},
	}, 

	[61827] = {
			[-1] = {{72}, {}, true, 0,true},
	}, 

	[61830] = {
			[-1] = {{72}, {}, true, 0,true},
	}, 

	[61833] = {
			[-1] = {{72}, {}, true, 0,true},
	}, 

	[61821] = {
			[-1] = {{72}, {}, true, 0,true},
	}, 

	[61818] = {
			[-1] = {{72}, {}, true, 0,true},
	}, 

	[61743] = {
			[-1] = {{72}, {}, true, 0,true},
	}, 

	[61815] = {
			[-1] = {{72}, {}, false, 0,true},
	}, 

	[61824] = {
			[-1] = {{72}, {}, true, 0,true},
	}, 

	[61845] = {
			[-1] = {{72}, {}, true, 0,true},
	}, 

	[61848] = {
			[-1] = {{72}, {}, true, 0,true},
	}, 

	[61839] = {
			[-1] = {{72}, {}, true, 0,true},
	}, 

	[61809] = {
			[-1] = {{72}, {}, true, 0,true},
	}, 

	[61857] = {
			[-1] = {{72}, {}, true, 0,true},
	}, 

	[61854] = {
			[-1] = {{72}, {}, true, 0,true},
	}, 

	[61851] = {
			[-1] = {{72}, {}, true, 0,true},
	}, 

	[61716] = {
			[-1] = {{72}, {}, false, 0,true},
	}, 

	[61710] = {
			[-1] = {{72}, {}, false, 0,true},
	}, 

	[61749] = {
			[-1] = {{72}, {}, false, 0,true},
	}, 

	[61713] = {
			[-1] = {{72}, {}, false, 0,true},
	}, 

	[61492] = {
			[-1] = {{83}, {}, true, 0,true},
	}, 

	[61495] = {
			[-1] = {{83}, {}, false, 0,true},
	}, 

	[61498] = {
			[-1] = {{83}, {}, false, 0,true},
	}, 

	[61501] = {
			[-1] = {{83}, {}, false, 0,true},
	}, 

	[61513] = {
			[-1] = {{83}, {}, true, 0,true},
	}, 

	[61522] = {
			[-1] = {{83}, {}, true, 0,true},
	}, 

	[61543] = {
			[-1] = {{83}, {}, true, 0,true},
	}, 

	[61552] = {
			[-1] = {{83}, {}, false, 0,true},
	}, 

	[61555] = {
			[-1] = {{83}, {}, false, 0,true},
	}, 

	[61558] = {
			[-1] = {{83}, {}, false, 0,true},
	}, 

	[61573] = {
			[-1] = {{83}, {}, false, 0,true},
	}, 

	[61576] = {
			[-1] = {{83}, {}, false, 0,true},
	}, 

	[61579] = {
			[-1] = {{83}, {}, false, 0,true},
	}, 

	[61603] = {
			[-1] = {{83}, {}, false, 0,true},
	}, 

	[61606] = {
			[-1] = {{83}, {}, false, 0,true},
	}, 

	[61609] = {
			[-1] = {{83}, {}, false, 0,true},
	}, 

	[61612] = {
			[-1] = {{83}, {}, false, 0,true},
	}, 

	[62300] = {
			[-1] = {{83}, {}, true, 0,true},
	}, 

	[62303] = {
			[-1] = {{83}, {}, true, 0,true},
	}, 

	[62306] = {
			[-1] = {{83}, {}, true, 0,true},
	}, 

	[62309] = {
			[-1] = {{83}, {}, true, 0,true},
	}, 

	[62312] = {
			[-1] = {{83}, {}, true, 0,true},
	}, 

	[62315] = {
			[-1] = {{83}, {}, false, 0,true},
	}, 

	[62318] = {
			[-1] = {{83}, {}, false, 0,true},
	}, 

	[62321] = {
			[-1] = {{83}, {}, false, 0,true},
	}, 

	[62324] = {
			[-1] = {{83}, {}, false, 0,true},
	}, 

	[62327] = {
			[-1] = {{83}, {}, false, 0,true},
	}, 

	[62330] = {
			[-1] = {{83}, {}, true, 0,true},
	}, 

	[61600] = {
			[-1] = {{83}, {}, false, 0,true},
	}, 

	[62189] = {
			[-1] = {{85}, {}, true, 0,true},
	}, 

	[62207] = {
			[-1] = {{85}, {}, true, 0,true},
	}, 

	[62282] = {
			[-1] = {{85}, {}, true, 0,true},
	}, 

	[62285] = {
			[-1] = {{85}, {}, true, 0,true},
	}, 

	[62288] = {
			[-1] = {{85}, {}, true, 0,true},
	}, 

	[62192] = {
			[-1] = {{85}, {}, false, 0,true},
	}, 

	[62195] = {
			[-1] = {{85}, {}, false, 0,true},
	}, 

	[62198] = {
			[-1] = {{85}, {}, false, 0,true},
	}, 

	[62210] = {
			[-1] = {{85}, {}, false, 0,true},
	}, 

	[62213] = {
			[-1] = {{85}, {}, false, 0,true},
	}, 

	[62216] = {
			[-1] = {{85}, {}, false, 0,true},
	}, 

	[62240] = {
			[-1] = {{85}, {}, false, 0,true},
	}, 

	[62243] = {
			[-1] = {{85}, {}, false, 0,true},
	}, 

	[62291] = {
			[-1] = {{85}, {}, false, 0,true},
	}, 

	[62204] = {
			[-1] = {{85}, {}, false, 0,true},
	}, 

	[62049] = {
			[-1] = {{80}, {}, true, 0,true},
	}, 

	[62052] = {
			[-1] = {{80}, {}, false, 0,true},
	}, 

	[62061] = {
			[-1] = {{80}, {}, true, 0,true},
	}, 

	[62064] = {
			[-1] = {{80}, {}, false, 0,true},
	}, 

	[62067] = {
			[-1] = {{80}, {}, true, 0,true},
	}, 

	[62070] = {
			[-1] = {{80}, {}, false, 0,true},
	}, 

	[62073] = {
			[-1] = {{80}, {}, false, 0,true},
	}, 

	[62085] = {
			[-1] = {{80}, {}, true, 0,true},
	}, 

	[63014] = {
			[-1] = {{72}, {}, true, 0,true},
	}, 

	[63015] = {
			[-1] = {{72}, {}, true, 0,true},
	}, 

	[63016] = {
			[-1] = {{72}, {}, true, 0,true},
	}, 

	[63019] = {
			[-1] = {{72}, {}, true, 0,true},
	}, 

	[63013] = {
			[-1] = {{72}, {}, false, 0,true},
	}, 

	[62201] = {
			[-1] = {{85}, {}, false, 0,true},
	}, 

	[62333] = {
			[-1] = {{85}, {}, false, 0,true},
	}, 

	[62076] = {
			[-1] = {{80}, {}, true, 0,true},
	}, 

	[63351] = {
			[-1] = {{72}, {}, true, 0,true},
	}, 

	[63348] = {
			[-1] = {{72}, {}, false, 0,false},
	}, 

	[61707] = {
			[-1] = {{1051}, {}, true, 0,true},
	}, 

	[62509] = {
			[-1] = {{68}, {}, false, 0,true},
	}, 

	[61731] = {
			[-1] = {{68}, {}, false, 0,true},
	}, 

	[61734] = {
			[-1] = {{68}, {}, false, 0,true},
	}, 

	[61740] = {
			[-1] = {{68}, {}, false, 0,true},
	}, 

	[61737] = {
			[-1] = {{68}, {}, false, 0,true},
	}, 

	[62765] = {
			[-1] = {{72}, {}, true, 0,true},
	}, 

	[62985] = {
			[-1] = {{68}, {}, true, 0,true},
	}, 

	[63243] = {
			[-1] = {{68}, {}, false, 0,true},
	}, 

	[61306] = {
			[-1] = {{89}, {}, true, 0,true},
	}, 

	[64731] = {
			[-1] = {{86}, {}, true, 0,true},
	}, 

	[64734] = {
			[-1] = {{86}, {}, false, 0,true},
	}, 

	[64737] = {
			[-1] = {{86}, {}, false, 0,true},
	}, 

	[64740] = {
			[-1] = {{86}, {}, false, 0,true},
	}, 

	[64746] = {
			[-1] = {{86}, {}, true, 0,true},
	}, 

	[64752] = {
			[-1] = {{86}, {}, false, 0,true},
	}, 

	[64758] = {
			[-1] = {{86}, {}, true, 0,true},
	}, 

	[64761] = {
			[-1] = {{86}, {}, true, 0,true},
	}, 

	[64764] = {
			[-1] = {{86}, {}, false, 0,true},
	}, 

	[64770] = {
			[-1] = {{86}, {}, false, 0,true},
	}, 

	[64773] = {
			[-1] = {{86}, {}, false, 0,true},
	}, 

	[64776] = {
			[-1] = {{86}, {}, true, 0,true},
	}, 

	[64779] = {
			[-1] = {{86}, {}, false, 0,true},
	}, 

	[64785] = {
			[-1] = {{86}, {}, true, 0,true},
	}, 

	[64788] = {
			[-1] = {{86}, {}, false, 0,true},
	}, 

	[64794] = {
			[-1] = {{86}, {}, false, 0,true},
	}, 

	[64800] = {
			[-1] = {{86}, {}, false, 0,true},
	}, 

	[64806] = {
			[-1] = {{86}, {}, false, 0,true},
	}, 

	[64809] = {
			[-1] = {{86}, {}, false, 0,true},
	}, 

	[64812] = {
			[-1] = {{86}, {}, false, 0,true},
	}, 

	[64815] = {
			[-1] = {{86}, {}, false, 0,true},
	}, 

	[65729] = {
			[-1] = {{90}, {}, true, 0,true},
	}, 

	[65732] = {
			[-1] = {{90}, {}, false, 0,true},
	}, 

	[65735] = {
			[-1] = {{90}, {}, false, 0,true},
	}, 

	[65738] = {
			[-1] = {{90}, {}, false, 0,true},
	}, 

	[65741] = {
			[-1] = {{90}, {}, false, 0,true},
	}, 

	[65744] = {
			[-1] = {{90}, {}, true, 0,true},
	}, 

	[65747] = {
			[-1] = {{90}, {}, true, 0,true},
	}, 

	[65750] = {
			[-1] = {{90}, {}, true, 0,true},
	}, 

	[65753] = {
			[-1] = {{90}, {}, false, 0,true},
	}, 

	[65762] = {
			[-1] = {{90}, {}, true, 0,true},
	}, 

	[65765] = {
			[-1] = {{90}, {}, false, 0,true},
	}, 

	[65774] = {
			[-1] = {{90}, {}, false, 0,true},
	}, 

	[65777] = {
			[-1] = {{90}, {}, true, 0,true},
	}, 

	[65780] = {
			[-1] = {{90}, {}, false, 0,true},
	}, 

	[65783] = {
			[-1] = {{90}, {}, false, 0,true},
	}, 

	[65786] = {
			[-1] = {{90}, {}, false, 0,true},
	}, 

	[65789] = {
			[-1] = {{90}, {}, false, 0,true},
	}, 

	[65983] = {
			[-1] = {{90}, {}, false, 0,true},
	}, 

	[66275] = {
			[-1] = {{86}, {}, false, 0,true},
	}, 

	[66276] = {
			[-1] = {{86}, {}, true, 0,true},
	}, 

	[64755] = {
			[-1] = {{86}, {}, true, 0,true},
	}, 

	[64340] = {
			[-1] = {{84}, {}, true, 0,true},
	}, 

	[64343] = {
			[-1] = {{84}, {}, false, 0,true},
	}, 

	[64346] = {
			[-1] = {{84}, {}, false, 0,true},
	}, 

	[64349] = {
			[-1] = {{84}, {}, false, 0,true},
	}, 

	[64352] = {
			[-1] = {{84}, {}, false, 0,true},
	}, 

	[64355] = {
			[-1] = {{84}, {}, false, 0,true},
	}, 

	[64370] = {
			[-1] = {{84}, {}, true, 0,true},
	}, 

	[64385] = {
			[-1] = {{84}, {}, false, 0,true},
	}, 

	[64427] = {
			[-1] = {{84}, {}, true, 0,true},
	}, 

	[64430] = {
			[-1] = {{84}, {}, true, 0,true},
	}, 

	[64436] = {
			[-1] = {{84}, {}, true, 0,true},
	}, 

	[64448] = {
			[-1] = {{84}, {}, false, 0,true},
	}, 

	[66278] = {
			[-1] = {{91}, {}, false, 0,true},
	}, 

	[65654] = {
			[-1] = {{91}, {}, true, 0,true},
	}, 

	[65657] = {
			[-1] = {{91}, {}, true, 0,true},
	}, 

	[65663] = {
			[-1] = {{91}, {}, false, 0,true},
	}, 

	[65810] = {
			[-1] = {{90}, {}, true, 0,true},
	}, 

	[65813] = {
			[-1] = {{90}, {}, true, 0,true},
	}, 

	[65816] = {
			[-1] = {{90}, {}, true, 0,true},
	}, 

	[65819] = {
			[-1] = {{90}, {}, true, 0,true},
	}, 

	[65964] = {
			[-1] = {{1302},{},false ,100 ,false},
	}, 

	[65965] = {
			[-1] = {{1302},{},false ,100 ,false},
	}, 

	[65966] = {
			[-1] = {{1302},{},false ,100 ,false},
	}, 

	[65967] = {
			[-1] = {{1302},{},false ,100 ,false},
	}, 

	[65968] = {
			[-1] = {{1302},{},false ,100 ,false},
	}, 

	[65969] = {
			[-1] = {{1302},{},false ,100 ,false},
	}, 

	[65970] = {
			[-1] = {{1302},{},false ,100 ,false},
	}, 

	[65971] = {
			[-1] = {{1302},{},false ,100 ,false},
	}, 

	[65972] = {
			[-1] = {{1302},{},false ,100 ,false},
	}, 

	[65973] = {
			[-1] = {{1302},{},false ,100 ,false},
	}, 

	[65974] = {
			[-1] = {{1302},{},false ,100 ,false},
	}, 

	[65975] = {
			[-1] = {{1302},{},false ,100 ,false},
	}, 

	[65976] = {
			[-1] = {{1302},{},false ,100 ,false},
	}, 

	[66866] = {
			[-1] = {{67}, {}, false, 0,true},
	}, 

	[66871] = {
			[-1] = {{67}, {}, true, 0,true},
	}, 

	[66872] = {
			[-1] = {{67}, {}, true, 0,true},
	}, 

	[66873] = {
			[-1] = {{67}, {}, true, 0,true},
	}, 

	[66874] = {
			[-1] = {{4}, {}, false, 0,true},
	}, 

	[66877] = {
			[-1] = {{67}, {}, false, 0,true},
	}, 

	[66878] = {
			[-1] = {{67}, {}, false, 0,true},
	}, 

	[66879] = {
			[-1] = {{67}, {}, false, 0,true},
	}, 

	[66860] = {
			[-1] = {{67}, {}, false, 0,true},
	}, 

	[66861] = {
			[-1] = {{67}, {}, false, 0,true},
	}, 

	[66862] = {
			[-1] = {{67}, {}, false, 0,true},
	}, 

	[66863] = {
			[-1] = {{67}, {}, false, 0,true},
	}, 

	[66864] = {
			[-1] = {{67}, {}, false, 0,true},
	}, 

	[66865] = {
			[-1] = {{67}, {}, false, 0,true},
	}, 

	[36839] = {
			[-1] = {{69}, {}, true, 0,true},
	}, 

	[57520] = {
			[-1] = {{69}, {}, false, 0,true},
	}, 

	[16686] = {
			[-1] = {{67}, {}, true, 0,true},
	}, 

	[16707] = {
			[-1] = {{67}, {}, true, 0,true},
	}, 

	[16692] = {
			[-1] = {{67}, {}, true, 0,true},
	}, 

	[16385] = {
			[-1] = {{67}, {}, true, 0,true},
	}, 

	[66867] = {
			[-1] = {{67}, {}, true, 0,true},
	}, 

	[66869] = {
			[-1] = {{67}, {}, true, 0,true},
	}, 

	[16358] = {
			[-1] = {{67}, {}, true, 0,true},
	}, 

	[36683] = {
			[-1] = {{67}, {}, true, 0,true},
	}, 

	[9479] = {
			[-1] = {{67}, {}, true, 0,true},
	}, 

	[7952] = {
			[-1] = {{67}, {}, true, 0,true},
	}, 

	[12142] = {
			[-1] = {{67}, {}, true, 0,true},
	}, 

	[16701] = {
			[-1] = {{67}, {}, true, 0,true},
	}, 

	[16695] = {
			[-1] = {{67}, {}, true, 0,true},
	}, 

	[16704] = {
			[-1] = {{67}, {}, true, 0,true},
	}, 

	[66870] = {
			[-1] = {{67}, {}, true, 0,true},
	}, 

	[16689] = {
			[-1] = {{67}, {}, true, 0,true},
	}, 

	[66868] = {
			[-1] = {{67}, {}, true, 0,true},
	}, 

	[16695] = {
			[-1] = {{67}, {}, true, 0,true},
	}, 

	[16701] = {
			[-1] = {{67}, {}, true, 0,true},
	}, 

	[16698] = {
			[-1] = {{67}, {}, true, 0,true},
	}, 

	[9476] = {
			[-1] = {{67}, {}, false, 0,true},
	}, 

	[36897] = {
			[-1] = {{69}, {}, true, 0,true},
	}, 

	[36900] = {
			[-1] = {{69}, {}, true, 0,true},
	}, 

	[67072] = {
			[-1] = {{67}, {}, true, 0,true},
	}, 

	[67072] = {
			[-1] = {{67}, {}, true, 0,true},
	}, 

	[55678] = {
			[GameApi.HashAString("怪-嵩山筹备弟子22")] = {{76}, {}, true, 0,true},
			[GameApi.HashAString("怪-嵩山筹备弟子25")] = {{76}, {}, true, 0,true},
			[GameApi.HashAString("怪-嵩山筹备弟子64")] = {{76}, {}, true, 0,true},
			[GameApi.HashAString("怪-嵩山筹备弟子71")] = {{76}, {}, true, 0,true},
			[GameApi.HashAString("怪-嵩山筹备弟子68")] = {{76}, {}, true, 0,true},
			[GameApi.HashAString("怪-嵩山筹备弟子27")] = {{76}, {}, true, 0,true},
			[GameApi.HashAString("怪-嵩山筹备弟子80")] = {{76}, {}, true, 0,true},
			[GameApi.HashAString("怪-嵩山筹备弟子24")] = {{76}, {}, true, 0,true},
			[GameApi.HashAString("怪-嵩山筹备弟子21")] = {{76}, {}, true, 0,true},
	}, 

	[67089] = {
			[-1] = {{67}, {}, false, 0,true},
	}, 

	[67088] = {
			[-1] = {{67}, {}, false, 0,true},
	}, 

	[59352] = {
			[-1] = {{79}, {}, false, 0,true},
	}, 

	[59373] = {
			[-1] = {{79}, {}, true, 0,true},
	}, 

	[67425] = {
			[-1] = {{79}, {}, false, 0,true},
	}, 

	[67344] = {
			[-1] = {{79}, {}, true, 0,true},
	}, 

	[67346] = {
			[-1] = {{79}, {}, false, 0,true},
	}, 

	[67409] = {
			[-1] = {{79}, {}, false, 0,true},
	}, 

	[67401] = {
			[-1] = {{79}, {}, true, 0,true},
	}, 

	[67402] = {
			[-1] = {{79}, {}, false, 0,true},
	}, 

	[67399] = {
			[-1] = {{79}, {}, true, 0,true},
	}, 

	[67410] = {
			[-1] = {{79}, {}, false, 0,true},
	}, 

	[67411] = {
			[-1] = {{79}, {}, false, 0,true},
	}, 

	[67412] = {
			[-1] = {{79}, {}, false, 0,true},
	}, 

	[67413] = {
			[-1] = {{79}, {}, false, 0,true},
	}, 

	[67414] = {
			[-1] = {{79}, {}, false, 0,true},
	}, 

	[67415] = {
			[-1] = {{79}, {}, false, 0,true},
	}, 

	[67343] = {
			[-1] = {{79}, {}, false, 0,true},
	}, 

	[67456] = {
			[-1] = {{79}, {}, false, 0,true},
	}, 

	[59325] = {
			[-1] = {{79}, {}, true, 0,true},
	}, 

	[59322] = {
			[-1] = {{79}, {}, true, 0,true},
	}, 

	[67457] = {
			[-1] = {{79}, {}, true, 0,true},
	}, 

	[59364] = {
			[-1] = {{79}, {}, false, 0,true},
	}, 

	[59355] = {
			[-1] = {{79}, {}, false, 0,true},
	}, 

	[68302] = {
			[-1] = {{4}, {}, false, 0,true},
	}, 

	[68303] = {
			[-1] = {{4}, {}, false, 0,true},
	}, 

	[68304] = {
			[-1] = {{4}, {}, false, 0,true},
	}, 

	[67955] = {
			[-1] = {{4}, {}, true, 0,true},
	}, 

	[67961] = {
			[-1] = {{4}, {}, false, 0,true},
	}, 

	[68301] = {
			[-1] = {{4}, {}, false, 0,true},
	}, 

	[67954] = {
			[-1] = {{4}, {}, true, 0,true},
	}, 

	[67958] = {
			[-1] = {{4}, {}, false, 0,true},
	}, 

	[67959] = {
			[-1] = {{4}, {}, false, 0,true},
	}, 

	[67957] = {
			[-1] = {{4}, {}, false, 0,true},
	}, 

	[66876] = {
			[-1] = {{67}, {}, true, 0,true},
	}, 

	[68587] = {
		[-1] = {{68}, {}, false, 0,true},
	}, 

	[67953] = {
			[-1] = {{67}, {}, true, 0,true},
	}, 

	[67963] = {
			[-1] = {{67}, {}, true, 0,true},
	}, 

	[67964] = {
			[-1] = {{67}, {}, true, 0,true},
	}, 

	[67965] = {
			[-1] = {{67}, {}, true, 0,true},
	}, 

	[67966] = {
			[-1] = {{67}, {}, true, 0,true},
	}, 

	[67967] = {
			[-1] = {{67}, {}, true, 0,true},
	}, 

	[67968] = {
			[-1] = {{67, 4}, {}, true, 0,true},
	}, 

	[67727] = {
			[-1] = {{81}, {}, true, 0,true},
	}, 

	[68114] = {
			[-1] = {{81}, {}, false, 0,true},
	}, 

	[67696] = {
			[-1] = {{81}, {}, true, 0,true},
	}, 

	[67813] = {
			[-1] = {{81}, {}, true, 0,true},
	}, 

	[67810] = {
			[-1] = {{81}, {}, true, 0,true},
	}, 

	[68123] = {
			[-1] = {{81}, {}, true, 0,true},
	}, 

	[68120] = {
			[-1] = {{81}, {}, true, 0,true},
	}, 

	[67699] = {
			[-1] = {{81}, {}, true, 0,true},
	}, 

	[67702] = {
			[-1] = {{81}, {}, false, 0,true},
	}, 

	[35377] = {
			[-1] = {{4}, {}, false, 0,true},
	}, 

	[67690] = {
			[-1] = {{81}, {}, false, 0,true},
	}, 

	[67873] = {
			[-1] = {{81}, {}, false, 0,true},
	}, 

	[67876] = {
			[-1] = {{81}, {}, false, 0,true},
	}, 

	[67879] = {
			[-1] = {{81}, {}, false, 0,true},
	}, 

	[67882] = {
			[-1] = {{81}, {}, false, 0,true},
	}, 

	[67885] = {
			[-1] = {{81}, {}, false, 0,true},
	}, 

	[67888] = {
			[-1] = {{81}, {}, false, 0,true},
	}, 

	[67891] = {
			[-1] = {{81}, {}, false, 0,true},
	}, 

	[67768] = {
			[-1] = {{81}, {}, true, 0,true},
	}, 

	[67771] = {
			[-1] = {{81}, {}, true, 0,true},
	}, 

	[67774] = {
			[-1] = {{81}, {}, true, 0,true},
	}, 

	[67777] = {
			[-1] = {{81}, {}, true, 0,true},
	}, 

	[67780] = {
			[-1] = {{81}, {}, true, 0,true},
	}, 

	[67783] = {
			[-1] = {{81}, {}, true, 0,true},
	}, 

	[68126] = {
			[-1] = {{81}, {}, true, 0,true},
	}, 

	[67861] = {
			[-1] = {{81}, {}, true, 0,true},
	}, 

	[67870] = {
			[-1] = {{81}, {}, true, 0,true},
	}, 

	[67858] = {
			[-1] = {{81}, {}, true, 0,true},
	}, 

	[67864] = {
			[-1] = {{81}, {}, true, 0,true},
	}, 

	[67867] = {
			[-1] = {{81}, {}, true, 0,true},
	}, 

	[67738] = {
			[-1] = {{81}, {}, true, 0,true},
	}, 

	[60388] = {
			[-1] = {{81}, {}, true, 0,true},
	}, 

	[67690] = {
			[-1] = {{81}, {}, true, 0,true},
	}, 

	[67732] = {
			[-1] = {{81}, {}, true, 0,true},
	}, 

	[67819] = {
			[-1] = {{81}, {}, true, 0,true},
	}, 

	[67816] = {
			[-1] = {{81}, {}, true, 0,true},
	}, 

	[60390] = {
			[-1] = {{81}, {}, true, 0,true},
	}, 

	[67825] = {
			[-1] = {{81}, {}, true, 0,true},
	}, 

	[67828] = {
			[-1] = {{81}, {}, true, 0,true},
	}, 

	[68137] = {
			[-1] = {{81}, {}, true, 0,true},
	}, 

	[67831] = {
			[-1] = {{81}, {}, true, 0,true},
	}, 

	[67834] = {
			[-1] = {{81}, {}, true, 0,true},
	}, 

	[67750] = {
			[-1] = {{81}, {}, false, 0,true},
	}, 

	[68680] = {
			[-1] = {{81}, {}, false, 0,true},
	}, 

	[68686] = {
			[-1] = {{81}, {}, false, 0,true},
	}, 

	[67684] = {
			[-1] = {{81}, {}, false, 0,true},
	}, 

	[67762] = {
			[-1] = {{81}, {}, false, 0,true},
	}, 

	[67756] = {
			[-1] = {{81}, {}, false, 0,true},
	}, 

	[67714] = {
			[-1] = {{81}, {}, false, 0,true},
	}, 

	[67759] = {
			[-1] = {{81}, {}, false, 0,true},
	}, 

	[67711] = {
			[-1] = {{81}, {}, false, 0,true},
	}, 

	[67753] = {
			[-1] = {{81}, {}, false, 0,true},
	}, 

	[67927] = {
			[-1] = {{81}, {}, false, 0,true},
	}, 

	[67933] = {
			[-1] = {{81}, {}, false, 0,true},
	}, 

	[67945] = {
			[-1] = {{81}, {}, false, 0,true},
	}, 

	[67681] = {
			[-1] = {{81}, {}, true, 0,true},
	}, 

	[67726] = {
			[-1] = {{81}, {}, true, 0,true},
	}, 

	[67942] = {
			[-1] = {{81}, {}, false, 0,true},
	}, 

	[67936] = {
			[-1] = {{81}, {}, false, 0,true},
	}, 

	[67924] = {
			[-1] = {{81}, {}, false, 0,true},
	}, 

	[67930] = {
			[-1] = {{81}, {}, false, 0,true},
	}, 

	[67822] = {
			[-1] = {{81}, {}, true, 0,true},
	}, 

	[67765] = {
			[-1] = {{81}, {}, false, 0,true},
	}, 

	[67744] = {
			[-1] = {{81}, {}, true, 0,true},
	}, 

	[70872] = {
			[-1] = {{73}, {}, false, 0,true},
	}, 

	[67969] = {
			[-1] = {{67}, {}, true, 0,true},
	}, 

	[67970] = {
			[-1] = {{67}, {}, true, 0,true},
	}, 

	[67971] = {
			[-1] = {{67}, {}, true, 0,true},
	}, 

	[68292] = {
			[-1] = {{67}, {}, true, 0,true},
	}, 

	[70513] = {
			[-1] = {{69}, {}, true, 0,true},
	}, 

	[67708] = {
			[-1] = {{81}, {}, true, 0,true},
	}, 

	[71458] = {
			[-1] = {{81}, {}, true, 0,true},
	}, 

	[71852] = {
			[-1] = {{80}, {}, false, 0,true},
	}, 

	[71851] = {
			[-1] = {{82}, {}, true, 0,true},
	}, 

	[71913] = {
			[-1] = {{82}, {}, true, 0,true},
	}, 

	[71464] = {
			[-1] = {{82}, {}, false, 0,true},
	}, 

	[71602] = {
			[-1] = {{83}, {}, false, 0,true},
	}, 

	[71605] = {
			[-1] = {{83}, {}, false, 0,true},
	}, 

	[71614] = {
			[-1] = {{83}, {}, true, 0,true},
	}, 

	[71638] = {
			[-1] = {{80}, {}, false, 0,true},
	}, 

	[71665] = {
			[-1] = {{80}, {}, true, 0,true},
	}, 

	[71984] = {
			[-1] = {{80}, {}, true, 0,true},
	}, 

	[71545] = {
			[-1] = {{82}, {}, false, 0,true},
	}, 

	[71834] = {
			[-1] = {{67}, {}, false, 0,true},
	}, 

	[71837] = {
			[-1] = {{67}, {}, false, 0,true},
	}, 

	[72275] = {
			[-1] = {{4}, {}, false, 0,true},
	}, 

	[72278] = {
			[-1] = {{4}, {}, false, 0,true},
	}, 

	[72272] = {
			[-1] = {{67}, {}, true, 0,true},
	}, 

	[72689] = {
			[-1] = {{71}, {}, true, 0,true},
	}, 

	[72690] = {
			[-1] = {{71}, {}, false, 0,true},
	}, 

	[72691] = {
			[-1] = {{71}, {}, false, 0,true},
	}, 

	[72693] = {
			[-1] = {{71}, {}, false, 0,true},
	}, 

	[71584] = {
			[-1] = {{80}, {}, true, 0,true},
	}, 

	[71587] = {
			[-1] = {{80}, {}, true, 0,true},
	}, 

	[71756] = {
			[-1] = {{80}, {}, true, 0,true},
	}, 

	[71755] = {
			[-1] = {{80}, {}, true, 0,true},
	}, 

	[71754] = {
			[-1] = {{80}, {}, true, 0,true},
	}, 

	[71753] = {
			[-1] = {{80}, {}, true, 0,true},
	}, 

	[71752] = {
			[-1] = {{80}, {}, true, 0,true},
	}, 

	[71566] = {
			[-1] = {{80}, {}, true, 0,true},
	}, 

	[71575] = {
			[-1] = {{80}, {}, true, 0,true},
	}, 

	[71581] = {
			[-1] = {{80}, {}, true, 0,true},
	}, 

	[71578] = {
			[-1] = {{80}, {}, true, 0,true},
	}, 

	[62920] = {
			[-1] = {{80}, {}, true, 0,true},
	}, 

	[62921] = {
			[-1] = {{80}, {}, true, 0,true},
	}, 

	[62922] = {
			[-1] = {{80}, {}, true, 0,true},
	}, 

	[62923] = {
			[-1] = {{80}, {}, true, 0,true},
	}, 

	[62924] = {
			[-1] = {{80}, {}, true, 0,true},
	}, 

	[74134] = {
			[-1] = {{75}, {}, true, 0,true},
	}, 

	[61534] = {
			[-1] = {{83}, {}, false, 0,true},
	}, 

	[74073] = {
			[-1] = {{77}, {}, true, 0,true},
	}, 

	[74076] = {
			[-1] = {{77}, {}, false, 0,true},
	}, 

	[74082] = {
			[-1] = {{77}, {}, true, 0,true},
	}, 

	[74085] = {
			[-1] = {{77}, {}, false, 0,true},
	}, 

	[73932] = {
			[-1] = {{69}, {}, false, 0,true},
	}, 

	[73935] = {
			[-1] = {{69}, {}, false, 0,true},
	}, 

	[73929] = {
			[-1] = {{69}, {}, false, 0,true},
	}, 

	[73911] = {
			[-1] = {{69}, {}, false, 0,true},
	}, 

	[73914] = {
			[-1] = {{69}, {}, false, 0,true},
	}, 

	[73917] = {
			[-1] = {{69}, {}, false, 0,true},
	}, 

	[73920] = {
			[-1] = {{69}, {}, false, 0,true},
	}, 

	[73923] = {
			[-1] = {{69}, {}, false, 0,true},
	}, 

	[73926] = {
			[-1] = {{69}, {}, false, 0,true},
	}, 

	[73938] = {
			[-1] = {{69}, {}, false, 0,true},
	}, 

	[73941] = {
			[-1] = {{69}, {}, false, 0,true},
	}, 

	[73944] = {
			[-1] = {{69}, {}, false, 0,true},
	}, 

	[73947] = {
			[-1] = {{69}, {}, false, 0,true},
	}, 

	[73950] = {
			[-1] = {{69}, {}, false, 0,true},
	}, 

	[73953] = {
			[-1] = {{69}, {}, false, 0,true},
	}, 

	[73956] = {
			[-1] = {{69}, {}, false, 0,true},
	}, 

	[74414] = {
			[-1] = {{69}, {}, false, 0,true},
	}, 

	[37452] = {
			[-1] = {{69}, {}, true, 0,true},
	}, 

	[73959] = {
			[-1] = {{69}, {}, false, 0,true},
	}, 

	[73962] = {
			[-1] = {{69}, {}, false, 0,true},
	}, 

	[73965] = {
			[-1] = {{69}, {}, false, 0,true},
	}, 

	[73968] = {
			[-1] = {{69}, {}, false, 0,true},
	}, 

	[73971] = {
			[-1] = {{69}, {}, false, 0,true},
	}, 

	[73974] = {
			[-1] = {{69}, {}, false, 0,true},
	}, 

	[73977] = {
			[-1] = {{69}, {}, false, 0,true},
	}, 

	[73980] = {
			[-1] = {{69}, {}, false, 0,true},
	}, 

	[73983] = {
			[-1] = {{69}, {}, false, 0,true},
	}, 

	[73986] = {
			[-1] = {{69}, {}, false, 0,true},
	}, 

	[73989] = {
			[-1] = {{69}, {}, false, 0,true},
	}, 

	[74993] = {
			[-1] = {{69}, {}, false, 0,true},
	}, 

	[74391] = {
			[-1] = {{69}, {}, true, 0,true},
	}, 

	[64403] = {
			[-1] = {{84}, {}, true, 0,true},
	}, 

	[72924] = {
			[-1] = {{72, 68, 4, 69, 76}, {}, false, 0,true},
	}, 

	[72934] = {
			[-1] = {{72, 68, 4, 69, 76}, {}, false, 0,true},
	}, 

	[75199] = {
			[-1] = {{72, 68, 4, 69, 76}, {}, false, 0,true},
	}, 

	[75202] = {
			[-1] = {{72, 68, 4, 69, 76}, {}, false, 0,true},
	}, 

	[75205] = {
			[-1] = {{72, 68, 4, 69, 76}, {}, false, 0,true},
	}, 

	[75653] = {
			[-1] = {{66}, {}, true, 0,true},
	}, 

	[75644] = {
			[-1] = {{6}, {}, true, 0,true},
	}, 

	[75645] = {
			[-1] = {{74}, {}, true, 0,true},
	}, 

	[75646] = {
			[-1] = {{93}, {}, true, 0,true},
	}, 

	[75647] = {
			[-1] = {{5}, {}, true, 0,true},
	}, 

	[75648] = {
			[-1] = {{42}, {}, true, 0,true},
	}, 

	[75649] = {
			[-1] = {{26}, {}, true, 0,true},
	}, 

	[75650] = {
			[-1] = {{18}, {}, true, 0,true},
	}, 

	[75651] = {
			[-1] = {{94}, {}, true, 0,true},
	}, 

	[75652] = {
			[-1] = {{31}, {}, true, 0,true},
	}, 

	[76071] = {
			[-1] = {{79}, {}, true, 0,true},
	}, 

	[71560] = {
			[-1] = {{79}, {}, true, 0,true},
	}, 

	[71557] = {
			[-1] = {{79}, {}, false, 0,true},
	}, 

	[76156] = {
			[-1] = {{91}, {}, false, 0,true},
	}, 

	[76539] = {
			[-1] = {{86}, {}, false, 0,true},
	}, 

	[76540] = {
			[-1] = {{86}, {}, false, 0,true},
	}, 

	[77198] = {
			[-1] = {{90}, {}, false, 0,true},
	}, 

	[45191] = {
			[-1] = {{68}, {}, true, 0,true},
	}, 

	[76923] = {
			[-1] = {{68}, {}, false, 0,true},
	}, 

	[76921] = {
			[-1] = {{68}, {}, true, 0,true},
	}, 

	[76919] = {
			[-1] = {{68}, {}, true, 0,true},
	}, 

	[77000] = {
			[-1] = {{75}, {}, true, 0,true},
	}, 

	[77003] = {
			[-1] = {{75}, {}, false, 0,true},
	}, 

	[77009] = {
			[-1] = {{82}, {}, false, 0,true},
	}, 

	[76782] = {
			[-1] = {{79}, {}, true, 0,true},
	}, 

	[76783] = {
			[-1] = {{79}, {}, false, 0,true},
	}, 

	[76784] = {
			[-1] = {{79}, {}, false, 0,true},
	}, 

	[76159] = {
			[-1] = {{82}, {}, false, 0,true},
	}, 

	[76161] = {
			[-1] = {{82}, {}, false, 0,true},
	}, 

	[77624] = {
			[-1] = {{82}, {}, false, 0,true},
	}, 

	[76157] = {
			[-1] = {{82}, {}, false, 0,true},
	}, 

	[76158] = {
			[-1] = {{82}, {}, false, 0,true},
	}, 

	[76160] = {
			[-1] = {{82}, {}, false, 0,true},
	}, 

	[76475] = {
			[-1] = {{72}, {}, false, 0,true},
	}, 

	[76183] = {
			[-1] = {{83}, {}, false, 0,true},
	}, 

	[76994] = {
			[-1] = {{82}, {}, false, 0,true},
	}, 

	[76185] = {
			[-1] = {{66}, {}, false, 0,true},
	}, 

	[76186] = {
			[-1] = {{66}, {}, false, 0,true},
	}, 

	[76187] = {
			[-1] = {{66}, {}, false, 0,true},
	}, 

	[76188] = {
			[-1] = {{66}, {}, false, 0,true},
	}, 

	[76189] = {
			[-1] = {{66}, {}, false, 0,true},
	}, 

	[76190] = {
			[-1] = {{66}, {}, false, 0,true},
	}, 

	[76191] = {
			[-1] = {{66}, {}, false, 0,true},
	}, 

	[76205] = {
			[-1] = {{76}, {}, false, 0,true},
	}, 

	[76207] = {
			[-1] = {{67}, {}, false, 0,true},
	}, 

	[76208] = {
			[-1] = {{67}, {}, false, 0,true},
	}, 

	[76209] = {
			[-1] = {{75}, {}, false, 0,true},
	}, 

	[76210] = {
			[-1] = {{82}, {}, false, 0,true},
	}, 

	[76279] = {
			[-1] = {{76}, {}, false, 0,true},
	}, 

	[76280] = {
			[-1] = {{76}, {}, false, 0,true},
	}, 

	[76281] = {
			[-1] = {{76}, {}, false, 0,true},
	}, 

	[76283] = {
			[-1] = {{31}, {}, false, 0,true},
	}, 

	[76284] = {
			[-1] = {{100}, {}, false, 0,true},
	}, 

	[76285] = {
			[-1] = {{91}, {}, false, 0,true},
	}, 

	[76286] = {
			[-1] = {{91}, {}, false, 0,true},
	}, 

	[76290] = {
			[-1] = {{72}, {}, false, 0,true},
	}, 

	[76294] = {
			[-1] = {{72}, {}, false, 0,true},
	}, 

	[76295] = {
			[-1] = {{72}, {}, false, 0,true},
	}, 

	[76296] = {
			[-1] = {{72}, {}, false, 0,true},
	}, 

	[76297] = {
			[-1] = {{72}, {}, false, 0,true},
	}, 

	[76298] = {
			[-1] = {{72}, {}, false, 0,true},
	}, 

	[76299] = {
			[-1] = {{72}, {}, false, 0,true},
	}, 

	[76300] = {
			[-1] = {{72}, {}, false, 0,true},
	}, 

	[76301] = {
			[-1] = {{72}, {}, false, 0,true},
	}, 

	[76302] = {
			[-1] = {{72}, {}, false, 0,true},
	}, 

	[76303] = {
			[-1] = {{72}, {}, false, 0,true},
	}, 

	[76304] = {
			[-1] = {{72}, {}, false, 0,true},
	}, 

	[76305] = {
			[-1] = {{68}, {}, false, 0,true},
	}, 

	[76306] = {
			[-1] = {{68}, {}, false, 0,true},
	}, 

	[76307] = {
			[-1] = {{68}, {}, false, 0,true},
	}, 

	[76308] = {
			[-1] = {{68}, {}, false, 0,true},
	}, 

	[76309] = {
			[-1] = {{68}, {}, false, 0,true},
	}, 

	[76310] = {
			[-1] = {{68}, {}, false, 0,true},
	}, 

	[76328] = {
			[-1] = {{68}, {}, false, 0,true},
	}, 

	[76329] = {
			[-1] = {{68}, {}, false, 0,true},
	}, 

	[76330] = {
			[-1] = {{68}, {}, false, 0,true},
	}, 

	[76331] = {
			[-1] = {{68}, {}, false, 0,true},
	}, 

	[76332] = {
			[-1] = {{68}, {}, false, 0,true},
	}, 

	[77166] = {
			[-1] = {{68}, {}, false, 0,true},
	}, 

	[76490] = {
			[-1] = {{67}, {}, true, 0,true},
	}, 

	[76487] = {
			[-1] = {{91}, {}, true, 0,true},
	}, 

	[78089] = {
			[-1] = {{91}, {}, false, 0,true},
	}, 

	[78596] = {
			[-1] = {{91}, {}, false, 0,true},
	}, 

	[78041] = {
			[-1] = {{72}, {}, false, 0,true},
	}, 

	[78643] = {
			[-1] = {{102}, {}, true, 0,true},
	}, 

	[78644] = {
			[-1] = {{102}, {}, false, 0,true},
	}, 

	[78645] = {
			[-1] = {{102}, {}, false, 0,true},
	}, 

	[78682] = {
			[-1] = {{102}, {}, true, 0,true},
	}, 

	[78653] = {
			[-1] = {{102}, {}, true, 0,true},
	}, 

	[78655] = {
			[-1] = {{102}, {}, true, 0,true},
	}, 

	[78654] = {
			[-1] = {{102}, {}, true, 0,true},
	}, 

	[78891] = {
			[-1] = {{102}, {}, false, 0,true},
	}, 

	[78892] = {
			[-1] = {{102}, {}, false, 0,true},
	}, 

	[78893] = {
			[-1] = {{102}, {}, false, 0,true},
	}, 

	[78903] = {
			[-1] = {{102}, {}, true, 0,true},
	}, 

	[78904] = {
			[-1] = {{102}, {}, false, 0,true},
	}, 

	[78646] = {
			[-1] = {{102}, {}, false, 0,true},
	}, 

	[78647] = {
			[-1] = {{102}, {}, false, 0,true},
	}, 

	[78648] = {
			[-1] = {{102}, {}, false, 0,true},
	}, 

	[78649] = {
			[-1] = {{102}, {}, false, 0,true},
	}, 

	[78650] = {
			[-1] = {{102}, {}, false, 0,true},
	}, 

	[78651] = {
			[-1] = {{102}, {}, false, 0,true},
	}, 

	[78652] = {
			[-1] = {{102}, {}, false, 0,true},
	}, 

	[78658] = {
			[-1] = {{102}, {}, true, 0,true},
	}, 

	[78659] = {
			[-1] = {{102}, {}, false, 0,true},
	}, 

	[77936] = {
			[-1] = {{105}, {}, true, 0,true},
	}, 

	[78871] = {
			[-1] = {{105}, {}, false, 0,true},
	}, 

	[78872] = {
			[-1] = {{105}, {}, false, 0,true},
	}, 

	[77654] = {
			[-1] = {{101}, {}, false, 0,true},
	}, 

	[77657] = {
			[-1] = {{101}, {}, false, 0,true},
	}, 

	[77690] = {
			[-1] = {{101}, {}, false, 0,true},
	}, 

	[77693] = {
			[-1] = {{101}, {}, false, 0,true},
	}, 

	[77696] = {
			[-1] = {{101}, {}, false, 0,true},
	}, 

	[77660] = {
			[-1] = {{101}, {}, false, 0,true},
	}, 

	[77699] = {
			[-1] = {{101}, {}, false, 0,true},
	}, 

	[76289] = {
			[-1] = {{72}, {}, false, 0,true},
	}, 

	[77666] = {
			[-1] = {{101}, {}, false, 0,true},
	}, 

	[77669] = {
			[-1] = {{101}, {}, false, 0,true},
	}, 

	[77672] = {
			[-1] = {{101}, {}, false, 0,true},
	}, 

	[77675] = {
			[-1] = {{101}, {}, false, 0,true},
	}, 

	[77678] = {
			[-1] = {{101}, {}, false, 0,true},
	}, 

	[77681] = {
			[-1] = {{101}, {}, false, 0,true},
	}, 

	[77684] = {
			[-1] = {{101}, {}, false, 0,true},
	}, 

	[77687] = {
			[-1] = {{101}, {}, false, 0,true},
	}, 

	[77702] = {
			[-1] = {{101}, {}, false, 0,true},
	}, 

	[77705] = {
			[-1] = {{101}, {}, false, 0,true},
	}, 

	[77708] = {
			[-1] = {{101}, {}, false, 0,true},
	}, 

	[77711] = {
			[-1] = {{101}, {}, false, 0,true},
	}, 

	[79678] = {
			[-1] = {{71, 77, 78, 79, 81}, {}, false, 0,true},
	}, 

	[78022] = {
			[-1] = {{101}, {}, true, 0,true},
	}, 

	[78689] = {
			[-1] = {{102}, {}, false, 0,true},
	}, 

	[76293] = {
			[-1] = {{72}, {}, false, 0,true},
	}, 

	[77061] = {
			[-1] = {{75}, {}, false, 0,true},
	}, 

	[77058] = {
			[-1] = {{82}, {}, false, 0,true},
	}, 

	[80985] = {
			[-1] = {{69}, {}, false, 0,true},
	}, 

	[80147] = {
			[-1] = {{75}, {}, false, 0,true},
	}, 

	[80149] = {
			[-1] = {{75}, {}, true, 0,true},
	}, 

	[80146] = {
			[-1] = {{77}, {}, false, 0,true},
	}, 

	[80148] = {
			[-1] = {{77}, {}, false, 0,true},
	}, 

	[81026] = {
			[-1] = {{77}, {}, false, 0,true},
	}, 

	[81154] = {
			[-1] = {{75}, {}, false, 0,true},
	}, 

	[81155] = {
			[-1] = {{75}, {}, false, 0,true},
	}, 

	[81156] = {
			[-1] = {{75}, {}, false, 0,true},
	}, 

	[81157] = {
			[-1] = {{75}, {}, false, 0,true},
	}, 

	[83903] = {
			[-1] = {{108}, {}, false, 0,true},
	}, 

	[83904] = {
			[-1] = {{108}, {}, false, 0,true},
	}, 

	[83905] = {
			[-1] = {{108}, {}, false, 0,true},
	}, 

	[83906] = {
			[-1] = {{108}, {}, false, 0,true},
	}, 

	[83910] = {
			[-1] = {{108}, {}, true, 0,true},
	}, 

	[83911] = {
			[-1] = {{108}, {}, true, 0,true},
	}, 

	[83912] = {
			[-1] = {{108}, {}, true, 0,true},
	}, 

	[83913] = {
			[-1] = {{108}, {}, false, 0,true},
	}, 

	[83914] = {
			[-1] = {{108}, {}, false, 0,true},
	}, 

	[83915] = {
			[-1] = {{108}, {}, false, 0,true},
	}, 

	[83916] = {
			[-1] = {{108}, {}, false, 0,true},
	}, 

	[83920] = {
			[-1] = {{108}, {}, true, 0,true},
	}, 

	[83921] = {
			[-1] = {{108}, {}, true, 0,true},
	}, 

	[83922] = {
			[-1] = {{108}, {}, true, 0,true},
	}, 

	[84672] = {
			[-1] = {{108}, {}, false, 0,true},
	}, 

	[84673] = {
			[-1] = {{108}, {}, false, 0,true},
	}, 

	[84674] = {
			[-1] = {{108}, {}, false, 0,true},
	}, 

	[84675] = {
			[-1] = {{108}, {}, false, 0,true},
	}, 

	[84691] = {
			[-1] = {{108}, {}, false, 0,true},
	}, 

	[84707] = {
			[-1] = {{108}, {}, false, 0,true},
	}, 

	[84708] = {
			[-1] = {{108}, {}, false, 0,true},
	}, 

	[84709] = {
			[-1] = {{108}, {}, false, 0,true},
	}, 

	[84386] = {
			[-1] = {{109}, {}, true, 0,true},
	}, 

	[84389] = {
			[-1] = {{109}, {}, false, 0,true},
	}, 

	[84401] = {
			[-1] = {{109}, {}, false, 0,true},
	}, 

	[84410] = {
			[-1] = {{109}, {}, true, 0,true},
	}, 

	[84413] = {
			[-1] = {{109}, {}, false, 0,true},
	}, 

	[84416] = {
			[-1] = {{109}, {}, true, 0,true},
	}, 

	[84419] = {
			[-1] = {{109}, {}, false, 0,true},
	}, 

	[84422] = {
			[-1] = {{109}, {}, false, 0,true},
	}, 

	[84775] = {
			[-1] = {{108}, {}, false, 0,true},
	}, 

	[84776] = {
			[-1] = {{108}, {}, false, 0,true},
	}, 

	[83920] = {
			[-1] = {{108}, {}, true, 0,true},
	}, 

	[84684] = {
			[-1] = {{110}, {}, true, 0,true},
	}, 

	[84269] = {
			[-1] = {{110}, {}, true, 0,true},
	}, 

	[84272] = {
			[-1] = {{110}, {}, true, 0,true},
	}, 

	[84275] = {
			[-1] = {{110}, {}, false, 0,true},
	}, 

	[84687] = {
			[-1] = {{110}, {}, true, 0,true},
	}, 

	[84281] = {
			[-1] = {{110}, {}, false, 0,true},
	}, 

	[84284] = {
			[-1] = {{110}, {}, false, 0,true},
	}, 

	[84287] = {
			[-1] = {{110}, {}, false, 0,true},
	}, 

	[84290] = {
			[-1] = {{110}, {}, false, 0,true},
	}, 

	[84293] = {
			[-1] = {{110}, {}, false, 0,true},
	}, 

	[84296] = {
			[-1] = {{110}, {}, false, 0,true},
	}, 

	[84299] = {
			[-1] = {{110}, {}, false, 0,true},
	}, 

	[84302] = {
			[-1] = {{110}, {}, false, 0,true},
	}, 

	[84305] = {
			[-1] = {{110}, {}, false, 0,true},
	}, 

	[84308] = {
			[-1] = {{110}, {}, false, 0,true},
	}, 

	[84311] = {
			[-1] = {{110}, {}, false, 0,true},
	}, 

	[84314] = {
			[-1] = {{110}, {}, false, 0,true},
	}, 

	[84317] = {
			[-1] = {{110}, {}, false, 0,true},
	}, 

	[84320] = {
			[-1] = {{110}, {}, false, 0,true},
	}, 

	[84323] = {
			[-1] = {{110}, {}, false, 0,true},
	}, 

	[84326] = {
			[-1] = {{110}, {}, false, 0,true},
	}, 

	[84329] = {
			[-1] = {{110}, {}, false, 0,true},
	}, 

	[84332] = {
			[-1] = {{110}, {}, false, 0,true},
	}, 

	[84335] = {
			[-1] = {{110}, {}, false, 0,true},
	}, 

	[84338] = {
			[-1] = {{110}, {}, false, 0,true},
	}, 

	[84341] = {
			[-1] = {{110}, {}, false, 0,true},
	}, 

	[84350] = {
			[-1] = {{110}, {}, true, 0,true},
	}, 

	[84353] = {
			[-1] = {{110}, {}, false, 0,true},
	}, 

	[84356] = {
			[-1] = {{110}, {}, false, 0,true},
	}, 

	[85004] = {
			[-1] = {{71, 77, 78, 79, 81}, {}, false, 0,true},
	}, 

	[86763] = {
			[-1] = {{78}, {}, true, 0,true},
	}, 

	[86825] = {
			[-1] = {{78}, {}, false, 0,true},
	}, 

	[86767] = {
			[-1] = {{78}, {}, true, 0,true},
	}, 

	[87541] = {
			[-1] = {{67}, {}, false, 0,true},
	}, 

	[87544] = {
			[-1] = {{75}, {}, false, 0,true},
	}, 

	[87547] = {
			[-1] = {{67}, {}, false, 0,true},
	}, 

	[87548] = {
			[-1] = {{75}, {}, false, 0,true},
	}, 

	[87549] = {
			[-1] = {{84}, {}, false, 0,true},
	}, 

	[87550] = {
			[-1] = {{84}, {}, false, 0,true},
	}, 

	[87551] = {
			[-1] = {{79}, {}, false, 0,true},
	}, 

	[87553] = {
			[-1] = {{75}, {}, false, 0,true},
	}, 

	[87555] = {
			[-1] = {{75}, {}, false, 0,true},
	}, 

	[87556] = {
			[-1] = {{75}, {}, false, 0,true},
	}, 

	[87557] = {
			[-1] = {{75}, {}, false, 0,true},
	}, 

	[87558] = {
			[-1] = {{75}, {}, false, 0,true},
	}, 

	[87559] = {
			[-1] = {{75}, {}, false, 0,true},
	}, 

	[87560] = {
			[-1] = {{75}, {}, false, 0,true},
	}, 

	[87764] = {
			[-1] = {{75}, {}, false, 0,true},
	}, 

	[87586] = {
			[-1] = {{86}, {}, false, 0,true},
	}, 

	[87587] = {
			[-1] = {{86}, {}, false, 0,true},
	}, 

	[87588] = {
			[-1] = {{86}, {}, false, 0,true},
	}, 

	[87855] = {
			[-1] = {{86}, {}, false, 0,true},
	}, 

	[87585] = {
			[-1] = {{86}, {}, false, 0,true},
	}, 

	[87939] = {
			[-1] = {{86}, {}, false, 0,true},
	}, 

	[87928] = {
			[-1] = {{86}, {}, false, 0,true},
	}, 

	[89137] = {
			[-1] = {{4}, {}, false, 0,true},
	}, 

	[89139] = {
			[-1] = {{4}, {}, false, 0,true},
	}, 

	[89140] = {
			[-1] = {{4}, {}, false, 0,true},
	}, 

	[88573] = {
			[-1] = {{68}, {}, false, 0,true},
	}, 

	[88574] = {
			[-1] = {{68}, {}, false, 0,true},
	}, 

	[88575] = {
			[-1] = {{72}, {}, false, 0,true},
	}, 

	[88576] = {
			[-1] = {{72}, {}, false, 0,true},
	}, 

	[88577] = {
			[-1] = {{72}, {}, false, 0,true},
	}, 

	[88578] = {
			[-1] = {{72}, {}, false, 0,true},
	}, 

	[88579] = {
			[-1] = {{72}, {}, false, 0,true},
	}, 

	[88580] = {
			[-1] = {{72}, {}, false, 0,true},
	}, 

	[88581] = {
			[-1] = {{72}, {}, false, 0,true},
	}, 

	[88582] = {
			[-1] = {{72}, {}, false, 0,true},
	}, 

	[89230] = {
			[-1] = {{72}, {}, false, 0,true},
	}, 

	[89415] = {
			[-1] = {{93}, {}, false, 0,true},
	}, 

	[89262] = {
			[-1] = {{93}, {}, false, 0,true},
	}, 

	[89393] = {
			[-1] = {{93}, {}, false, 0,true},
	}, 

	[89394] = {
			[-1] = {{93}, {}, false, 0,true},
	}, 

	[89263] = {
			[-1] = {{93}, {}, false, 0,true},
	}, 

	[89264] = {
			[-1] = {{93}, {}, false, 0,true},
	}, 

	[89265] = {
			[-1] = {{93}, {}, false, 0,true},
	}, 

	[89133] = {
			[-1] = {{67}, {}, false, 0,true},
	}, 

	[89137] = {
			[-1] = {{4}, {}, false, 0,true},
	}, 

	[89140] = {
			[-1] = {{4}, {}, false, 0,true},
	}, 

	[89139] = {
			[-1] = {{4}, {}, false, 0,true},
	}, 

	[89142] = {
			[-1] = {{4}, {}, false, 0,true},
	}, 

	[89149] = {
			[-1] = {{4}, {}, false, 0,true},
	}, 

	[89150] = {
			[-1] = {{4}, {}, false, 0,true},
	}, 

	[89151] = {
			[-1] = {{4}, {}, false, 0,true},
	}, 

	[89134] = {
			[-1] = {{4}, {}, false, 0,true},
	}, 

	[89135] = {
			[-1] = {{4}, {}, false, 0,true},
	}, 

	[89144] = {
			[-1] = {{4}, {}, false, 0,true},
	}, 

	[89145] = {
			[-1] = {{4}, {}, false, 0,true},
	}, 

	[89146] = {
			[-1] = {{4}, {}, false, 0,true},
	}, 

	[89152] = {
			[-1] = {{4}, {}, false, 0,true},
	}, 

	[89148] = {
			[-1] = {{4}, {}, false, 0,true},
	}, 

	[61779] = {
			[-1] = {{68}, {}, true, 0,true},
	}, 

	[9683] = {
			[-1] = {{93}, {}, true, 0,true},
	}, 

	[75546] = {
			[-1] = {{93}, {}, true, 0,true},
	}, 

	[75536] = {
			[-1] = {{93}, {}, true, 0,true},
	}, 

	[75646] = {
			[-1] = {{93}, {}, true, 0,true},
	}, 

	[9692] = {
			[-1] = {{93}, {}, true, 0,true},
	}, 

	[9674] = {
			[-1] = {{93}, {}, true, 0,true},
	}, 

	[9680] = {
			[-1] = {{93}, {}, true, 0,true},
	}, 

	[3834] = {
			[-1] = {{93}, {}, true, 0,true},
	}, 

	[3831] = {
			[-1] = {{93}, {}, true, 0,true},
	}, 

	[9695] = {
			[-1] = {{93}, {}, true, 0,true},
	}, 

	[87938] = {
			[-1] = {{67}, {}, false, 0,true},
	}, 

	[90067] = {
			[-1] = {{123}, {}, true, 0,true},
	}, 

	[90068] = {
			[-1] = {{123}, {}, false, 0,true},
	}, 

	[90080] = {
			[-1] = {{123}, {}, true, 0,true},
	}, 

	[90076] = {
			[-1] = {{123}, {}, false, 0,true},
	}, 

	[90079] = {
			[-1] = {{123}, {}, true, 0,true},
	}, 

	[90566] = {
			[-1] = {{4}, {}, false, 0,true},
	}, 

	[43761] = {
			[-1] = {{1589}, {}, true, 0,false},
	}, 

	[94155] = {
			[-1] = {{127}, {}, true, 0,true},
	}, 

	[94156] = {
			[-1] = {{127}, {}, false, 0,true},
	}, 

	[94157] = {
			[-1] = {{127}, {}, false, 0,true},
	}, 

	[94158] = {
			[-1] = {{127}, {}, false, 0,true},
	}, 

	[94163] = {
			[-1] = {{127}, {}, false, 0,true},
	}, 

	[94164] = {
			[-1] = {{127}, {}, false, 0,true},
	}, 

	[94167] = {
			[-1] = {{127}, {}, false, 0,true},
	}, 

	[94283] = {
			[-1] = {{127}, {}, false, 0,true},
	}, 

	[94289] = {
			[-1] = {{136}, {}, false, 0,true},
	}, 

	[94297] = {
			[-1] = {{136}, {}, true, 0,true},
	}, 

	[94328] = {
			[-1] = {{136}, {}, false, 0,true},
	}, 

	[94329] = {
			[-1] = {{136}, {}, false, 0,true},
	}, 

	[94330] = {
			[-1] = {{136}, {}, false, 0,true},
	}, 

	[94331] = {
			[-1] = {{136}, {}, false, 0,true},
	}, 

	[94332] = {
			[-1] = {{136}, {}, false, 0,true},
	}, 

	[94333] = {
			[-1] = {{136}, {}, false, 0,true},
	}, 

	[94334] = {
			[-1] = {{136}, {}, false, 0,true},
	}, 

	[94335] = {
			[-1] = {{136}, {}, false, 0,true},
	}, 

	[94336] = {
			[-1] = {{136}, {}, false, 0,true},
	}, 

	[94341] = {
			[-1] = {{136}, {}, false, 0,true},
	}, 

	[94298] = {
			[-1] = {{136}, {}, true, 0,true},
	}, 

	[94343] = {
			[-1] = {{127}, {}, true, 0,true},
	}, 

	[94344] = {
			[-1] = {{127}, {}, false, 0,true},
	}, 

	[94282] = {
			[-1] = {{127}, {}, true, 0,true},
	}, 

	[94338] = {
			[-1] = {{136}, {}, true, 0,true},
	}, 

	[94299] = {
			[-1] = {{127}, {}, false, 0,true},
	}, 

	[94346] = {
			[-1] = {{127}, {}, false, 0,true},
	}, 

	[94586] = {
			[-1] = {{127}, {}, false, 0,true},
	}, 

	[95266] = {
			[-1] = {{82}, {}, false, 0,true},
	}, 

	[95267] = {
			[-1] = {{91}, {}, false, 0,true},
	}, 

	[95268] = {
			[-1] = {{71}, {}, false, 0,true},
	}, 

	[95269] = {
			[-1] = {{82}, {}, false, 0,true},
	}, 

	[95270] = {
			[-1] = {{86}, {}, false, 0,true},
	}, 

	[95272] = {
			[-1] = {{91}, {}, false, 0,true},
	}, 

	[95273] = {
			[-1] = {{71}, {}, false, 0,true},
	}, 


	[95277] = {
			[-1] = {{86}, {}, false, 0,true},
	}, 

	[95278] = {
			[-1] = {{91}, {}, false, 0,true},
	}, 

	[95279] = {
			[-1] = {{71}, {}, false, 0,true},
	}, 

	[95280] = {
			[-1] = {{82}, {}, false, 0,true},
	}, 

	[95281] = {
			[-1] = {{91}, {}, false, 0,true},
	}, 

	[95282] = {
			[-1] = {{71}, {}, false, 0,true},
	}, 

	[95284] = {
			[-1] = {{82}, {}, false, 0,true},
	}, 

	[95285] = {
			[-1] = {{82}, {}, false, 0,true},
	}, 

	[95286] = {
			[-1] = {{91}, {}, false, 0,true},
	}, 

	[95287] = {
			[-1] = {{91}, {}, false, 0,true},
	}, 

	[95288] = {
			[-1] = {{91}, {}, false, 0,true},
	}, 

	[96536] = {
			[-1] = {{1625}, {10009}, true, 0,false},
	}, 

	[98047] = {
			[-1] = {{146}, {}, true, 0,true},
	}, 

	[98048] = {
			[-1] = {{146}, {}, false, 0,true},
	}, 

	[98149] = {
			[-1] = {{146}, {}, true, 0,true},
	}, 

	[98150] = {
			[-1] = {{146}, {}, true, 0,true},
	}, 

	[97843] = {
			[-1] = {{146}, {}, false, 0,true},
	}, 

	[97844] = {
			[-1] = {{146}, {}, false, 0,true},
	}, 

}

-- 印花的场景参数初始化配置
SceneStyle.DecalMap_List =
{
	["decal_swordtrace3"] = {{1, }, {}, false, false, {}, },
	["decal_swordtrace5"] = {{34, }, {}, false, false, {}, },
	["decal_swordtrace4"] = {{11, }, {}, false, false, {}, },
	["decal_blood"] = {{2, }, {}, false, false, {}, },
	["decal_swordtrace2"] = {{11, }, {}, false, false, {}, },
	["decal_swordtrace"] = {{11, }, {}, false, false, {}, },
	["decal_liuzhengfeng"] = {{67, }, {}, false, false, {}, },
}
SceneStyle.SceneGfx_List =
{
	[231] = {{2,2,},{2,3,},false}, 
	[4465] = {{76,},{},false}, 
	[4466] = {{76,},{},false}, 
	[4467] = {{76,},{},false}, 
	[4468] = {{76,},{},false}, 
	[4469] = {{76,},{},false}, 
	[4470] = {{76,},{},false}, 
	[4471] = {{76,},{},false}, 
	[4472] = {{76,},{},false}, 
	[4473] = {{76,},{},false}, 
	[4474] = {{76,},{},false}, 
	[4475] = {{76,},{},false}, 
	[4476] = {{76,},{},false}, 
	[4477] = {{76,},{},false}, 
	[4478] = {{76,},{},false}, 
	[4479] = {{76,},{},false}, 
	[4480] = {{76,},{},false}, 
	[4481] = {{76,},{},false}, 
	[4482] = {{76,},{},false}, 
	[4483] = {{76,},{},false}, 
	[4484] = {{76,},{},false}, 
	[4485] = {{76,},{},false}, 
	[1912] = {{68,},{},false}, 
	[1913] = {{68,},{},false}, 
	[1914] = {{68,},{},false}, 
	[1915] = {{68,},{},false}, 
	[1916] = {{68,},{},false}, 
	[1917] = {{68,},{},false}, 
	[1918] = {{68,},{},false}, 
	[1919] = {{68,},{},false}, 
	[1922] = {{68,},{},false}, 
	[1923] = {{68,},{},false}, 
	[1924] = {{68,},{},false}, 
	[1925] = {{68,},{},false}, 
	[1926] = {{68,},{},false}, 
	[1927] = {{68,},{},false}, 
	[1928] = {{68,},{},false}, 
	[1929] = {{68,},{},false}, 
	[1930] = {{68,},{},false}, 
	[1931] = {{68,},{},false}, 
	[1932] = {{68,},{},false}, 
	[1933] = {{68,},{},false}, 
	[1934] = {{68,},{},false}, 
	[1935] = {{68,},{},false}, 
	[1936] = {{68,},{},false}, 
	[1937] = {{68,},{},false}, 
	[1938] = {{68,},{},false}, 
	[1939] = {{68,},{},false}, 
	[1940] = {{68,},{},false}, 
	[1941] = {{68,},{},false}, 
	[1942] = {{68,},{},false}, 
	[1943] = {{68,},{},false}, 
	[1944] = {{68,},{},false}, 
	[1945] = {{68,},{},false}, 
	[1946] = {{68,},{},false}, 
	[1947] = {{68,},{},false}, 
	[1948] = {{68,},{},false}, 
	[1949] = {{68,},{},false}, 
	[1950] = {{68,},{},false}, 
	[1951] = {{68,},{},false}, 
	[1952] = {{68,},{},false}, 
	[1953] = {{68,},{},false}, 
	[1954] = {{68,},{},false}, 
	[1955] = {{68,},{},false}, 
	[1956] = {{68,},{},false}, 
	[1957] = {{68,},{},false}, 
	[1958] = {{68,},{},false}, 
	[1959] = {{68,},{},false}, 
	[1960] = {{68,},{},false}, 
	[1961] = {{68,},{},false}, 
	[1962] = {{68,},{},false}, 
	[1963] = {{68,},{},false}, 
	[1964] = {{68,},{},false}, 
	[1965] = {{68,},{},false}, 
	[1966] = {{68,},{},false}, 
	[1967] = {{68,},{},false}, 
	[1968] = {{68,},{},false}, 
	[1969] = {{68,},{},false}, 
	[1970] = {{68,},{},false}, 
	[1971] = {{68,},{},false}, 
	[218] = {{81,},{},false}, 
	[219] = {{81,},{},false}, 
	[220] = {{81,},{},false}, 
	[221] = {{81,},{},false}, 
	[222] = {{81,},{},false}, 
	[223] = {{81,},{},false}, 
	[224] = {{81,},{},false}, 
	[225] = {{81,},{},false}, 
	[226] = {{81,},{},false}, 
	[227] = {{81,},{},false}, 
	[228] = {{81,},{},false}, 
	[229] = {{81,},{},false}, 
	[2139] = {{71,},{},false}, 
	[13633] = {{78,},{},false}, 
	[13634] = {{78,},{},false}, 
	[13635] = {{78,},{},false}, 
	[13644] = {{78,},{},false}, 
	[13645] = {{78,},{},false}, 
	[13636] = {{78,},{},false}, 
	[13637] = {{78,},{},false}, 
	[13638] = {{78,},{},false}, 
	[13639] = {{78,},{},false}, 
	[13640] = {{78,},{},false}, 
	[13647] = {{78,},{},false}, 
	[13641] = {{78,},{},false}, 
	[13642] = {{78,},{},false}, 
	[13643] = {{78,},{},false}, 
	[919] = {{88,},{},false}, 
	[920] = {{88,},{},false}, 
	[921] = {{88,},{},false}, 
	[922] = {{88,},{},false}, 
	[923] = {{88,},{},false}, 
	[924] = {{88,},{},false}, 
	[925] = {{88,},{},false}, 
	[926] = {{88,},{},false}, 
	[927] = {{88,},{},false}, 
	[934] = {{88,},{},false}, 
	[935] = {{88,},{},false}, 
	[940] = {{88,},{},false}, 
	[6076] = {{82,},{},false}, 
	[6078] = {{82,},{},false}, 
	[6079] = {{82,},{},false}, 
	[6080] = {{82,},{},false}, 
	[6081] = {{82,},{},false}, 
	[6082] = {{82,},{},false}, 
	[6083] = {{82,},{},false}, 
	[6084] = {{82,},{},false}, 
	[6085] = {{82,},{},false}, 
	[6086] = {{82,},{},false}, 
	[6077] = {{82,},{},false}, 
	[1073743481] = {{72,88,},{},false}, 
	[1073743482] = {{72,88,},{},false}, 
	[1073743480] = {{72,88,},{},false}, 
	[1073743479] = {{72,88,},{},false}, 
	[1073743478] = {{72,88,},{},false}, 
	[1073743477] = {{72,88,},{},false}, 
	[1073743485] = {{72,88,},{},false}, 
	[1073743484] = {{72,88,},{},false}, 
	[1073743483] = {{72,88,},{},false}, 
	[1073743487] = {{86,},{},false}, 
	[1073743488] = {{86,},{},false}, 
	[1073743565] = {{86,},{},false}, 
	[1073743572] = {{86,},{},false}, 
	[1073743573] = {{86,},{},false}, 
	[1073743563] = {{86,},{},false}, 
	[1073743564] = {{86,},{},false}, 
	[1073743569] = {{86,},{},false}, 
	[1073743571] = {{86,},{},false}, 
	[1073743567] = {{86,},{},false}, 
	[1073743562] = {{86,},{},false}, 
	[1073743274] = {{84,},{},false}, 
	[1073743281] = {{84,},{},true}, 
	[1073743283] = {{84,},{},false}, 
	[1073743282] = {{84,},{},true}, 
	[1073743284] = {{84,},{},false}, 
	[1073743285] = {{84,},{},false}, 
	[1073743286] = {{84,},{},false}, 
	[1073743287] = {{84,},{},false}, 
	[1073743280] = {{84,},{},false}, 
	[1073743279] = {{84,},{},false}, 
	[1073744656] = {{84,},{},false}, 
	[775] = {{83,},{},false}, 
	[776] = {{83,},{},false}, 
	[777] = {{83,},{},false}, 
	[778] = {{83,},{},false}, 
	[779] = {{83,},{},false}, 
	[780] = {{83,},{},false}, 
	[781] = {{83,},{},false}, 
	[782] = {{83,},{},false}, 
	[783] = {{83,},{},false}, 
	[784] = {{83,},{},false}, 
	[785] = {{83,},{},false}, 
	[786] = {{83,},{},false}, 
	[787] = {{83,},{},false}, 
	[788] = {{83,},{},false}, 
	[789] = {{83,},{},false}, 
	[790] = {{83,},{},false}, 
	[791] = {{83,},{},false}, 
	[792] = {{83,},{},false}, 
	[793] = {{83,},{},false}, 
	[794] = {{83,},{},false}, 
	[795] = {{83,},{},false}, 
	[796] = {{83,},{},false}, 
	[797] = {{83,},{},false}, 
	[798] = {{83,},{},false}, 
	[799] = {{83,},{},false}, 
	[800] = {{83,},{},false}, 
	[801] = {{83,},{},false}, 
	[802] = {{83,},{},false}, 
	[803] = {{83,},{},false}, 
	[1073747972] = {{90,},{},false}, 
	[1073747975] = {{90,},{},false}, 
	[1073747976] = {{90,},{},false}, 
	[1073747977] = {{90,},{},false}, 
	[1073747969] = {{90,},{},false}, 
	[1073747968] = {{90,},{},false}, 
	[1073747970] = {{90,},{},false}, 
	[1073747971] = {{90,},{},false}, 
	[1073743494] = {{88,},{},false}, 
	[1073743493] = {{88,},{},false}, 
	[1073743492] = {{88,},{},false}, 
	[1073743491] = {{88,},{},false}, 
	[1073743490] = {{88,},{},false}, 
	[1073743489] = {{88,},{},false}, 
	[1073750895] = {{69,},{},true}, 
	[1073750896] = {{69,},{},true}, 
	[1073750897] = {{69,},{},true}, 
	[1073750898] = {{69,},{},true}, 
	[1073750899] = {{69,},{},true}, 
	[1073750900] = {{69,},{},true}, 
	[1073750901] = {{69,},{},true}, 
	[1073750902] = {{69,},{},true}, 
	[1073750903] = {{69,},{},true}, 
	[1073750904] = {{69,},{},true}, 
	[1073750905] = {{69,},{},true}, 
	[1073750906] = {{69,},{},true}, 
	[1073750907] = {{69,},{},true}, 
	[1073750908] = {{69,},{},true}, 
	[1073750909] = {{69,},{},true}, 
	[1073750910] = {{69,},{},true}, 
	[1073750911] = {{69,},{},true}, 
	[1073750912] = {{69,},{},true}, 
	[1073750913] = {{69,},{},true}, 
	[1073750914] = {{69,},{},true}, 
	[1073747018] = {{4,},{},false}, 
	[1073747019] = {{4,},{},false}, 
	[1073747020] = {{4,},{},false}, 
	[1073747021] = {{4,},{},false}, 
	[1073747027] = {{4,},{},false}, 
	[1073747161] = {{4,},{},false}, 
	[1073744000] = {{71,},{},false}, 
	[1073746584] = {{76,},{},false}, 
	[1073746585] = {{76,},{},false}, 
	[1073744005] = {{71,},{},false}, 
	[1073744006] = {{71,},{},false}, 
	[1073744007] = {{71,},{},false}, 
	[1073744008] = {{71,},{},false}, 
	[1073744017] = {{67,},{},false}, 
	[1073744018] = {{67,},{},false}, 
	[1073744019] = {{67,},{},false}, 
	[1073744020] = {{67,},{},false}, 
	[1073744021] = {{67,},{},false}, 
	[1073744022] = {{67,},{},false}, 
	[1073744023] = {{67,},{},false}, 
	[1073744024] = {{67,},{},false}, 
	[1073744025] = {{67,},{},false}, 
	[1073744026] = {{67,},{},false}, 
	[1073744027] = {{67,},{},false}, 
	[1073743577] = {{81,},{},false}, 
	[1073743578] = {{81,},{},false}, 
	[1073743579] = {{81,},{},false}, 
	[1073743580] = {{81,},{},false}, 
	[1073743581] = {{81,},{},false}, 
	[1073743582] = {{81,},{},false}, 
	[1073743583] = {{81,},{},false}, 
	[1073743584] = {{81,},{},false}, 
	[1073743585] = {{81,},{},false}, 
	[1073743586] = {{81,},{},false}, 
	[1073743587] = {{81,},{},false}, 
	[1073743588] = {{81,},{},false}, 
	[1073743589] = {{81,},{},false}, 
	[1073743590] = {{81,},{},false}, 
	[1073743591] = {{81,},{},false}, 
	[1073743592] = {{81,},{},false}, 
	[1073744119] = {{67,},{},false}, 
	[1073747813] = {{80,},{},false}, 
	[1073747812] = {{80,},{},false}, 
	[1073747814] = {{80,},{},false}, 
	[1073747815] = {{80,},{},false}, 
	[1073747816] = {{80,},{},false}, 
	[1073747817] = {{80,},{},false}, 
	[1073747818] = {{80,},{},false}, 
	[1073747819] = {{80,},{},false}, 
	[1073747820] = {{80,},{},false}, 
	[1073747821] = {{80,},{},false}, 
	[1073747822] = {{80,},{},false}, 
	[1073747823] = {{80,},{},false}, 
	[1073747824] = {{80,},{},false}, 
	[1073747825] = {{80,},{},false}, 
	[1073747826] = {{80,},{},false}, 
	[1073747827] = {{80,},{},false}, 
	[1073747828] = {{80,},{},false}, 
	[1073747829] = {{80,},{},false}, 
	[1073747830] = {{80,},{},false}, 
	[1073748461] = {{82,},{},false}, 
	[1073748531] = {{82,},{},false}, 
	[1073748532] = {{82,},{},false}, 
	[1073748533] = {{82,},{},false}, 
	[1073748538] = {{82,},{},false}, 
	[1073748540] = {{82,},{},false}, 
	[1073742693] = {{73,},{},false}, 
	[1073747265] = {{80,},{},false}, 
	[1073747267] = {{80,},{},false}, 
	[1073747266] = {{80,},{},false}, 
	[1073747269] = {{80,},{},false}, 
	[1073751243] = {{69,},{},false}, 
	[1073744543] = {{86,},{},false}, 
	[1073744544] = {{86,},{},false}, 
	[1073744545] = {{86,},{},false}, 
	[1073744546] = {{86,},{},false}, 
	[1073744547] = {{86,},{},false}, 
	[1073744548] = {{86,},{},false}, 
	[1073744549] = {{86,},{},false}, 
	[1073744550] = {{86,},{},false}, 
	[1073744551] = {{86,},{},false}, 
	[1073744552] = {{86,},{},false}, 
	[1073744553] = {{86,},{},false}, 
	[1073744554] = {{86,},{},false}, 
	[1073744555] = {{86,},{},false}, 
	[1073744556] = {{86,},{},false}, 
	[1073745211] = {{68,},{},false}, 
	[1073747025] = {{101,},{},false}, 
	[1073746957] = {{101,},{},false}, 
	[1073746975] = {{101,},{},false}, 
	[1073746976] = {{101,},{},false}, 
	[1073746978] = {{101,},{},false}, 
	[1073747024] = {{101,},{},false}, 
	[1073746979] = {{101,},{},false}, 
	[1073746980] = {{101,},{},false}, 
	[1073747023] = {{101,},{},false}, 
	[1073746965] = {{101,},{},false}, 
	[1073746986] = {{101,},{},false}, 
	[1073746981] = {{101,},{},false}, 
	[1073746982] = {{101,},{},false}, 
	[1073747022] = {{101,},{},false}, 
	[1073747020] = {{101,},{},false}, 
	[1073746983] = {{101,},{},false}, 
	[1073747019] = {{101,},{},false}, 
	[1073746996] = {{101,},{},false}, 
	[1073746993] = {{101,},{},false}, 
	[1073747043] = {{101,},{},false}, 
	[1073746994] = {{101,},{},false}, 
	[1073746989] = {{101,},{},false}, 
	[1073746995] = {{101,},{},false}, 
	[1073747039] = {{101,},{},false}, 
	[1073747038] = {{101,},{},false}, 
	[1073747041] = {{101,},{},false}, 
	[1073747042] = {{101,},{},false}, 
	[1073747050] = {{101,},{},false}, 
	[1073747044] = {{101,},{},false}, 
	[1073746997] = {{101,},{},false}, 
	[1073747045] = {{101,},{},false}, 
	[1073747046] = {{101,},{},false}, 
	[1073747047] = {{101,},{},false}, 
	[1073747018] = {{101,},{},false}, 
	[1073746998] = {{101,},{},false}, 
	[1073746991] = {{101,},{},false}, 
	[1073746992] = {{101,},{},false}, 
	[1073747048] = {{101,},{},false}, 
	[1073746990] = {{101,},{},false}, 
	[1073747000] = {{101,},{},false}, 
	[1073747016] = {{101,},{},false}, 
	[1073747001] = {{101,},{},false}, 
	[1073747002] = {{101,},{},false}, 
	[1073747003] = {{101,},{},false}, 
	[1073747004] = {{101,},{},false}, 
	[1073747005] = {{101,},{},false}, 
	[1073747006] = {{101,},{},false}, 
	[1073747007] = {{101,},{},false}, 
	[1073747008] = {{101,},{},false}, 
	[1073747009] = {{101,},{},false}, 
	[1073747010] = {{101,},{},false}, 
	[1073747011] = {{101,},{},false}, 
	[1073747012] = {{101,},{},false}, 
	[1073747013] = {{101,},{},false}, 
	[1073746977] = {{101,},{},false}, 
	[1073747040] = {{101,},{},false}, 
	[1073747049] = {{101,},{},false}, 
	[1073746999] = {{101,},{},false}, 
	[1073747017] = {{101,},{},false}, 
	[1073744833] = {{102,},{},false}, 
	[1073744330] = {{105,},{},false}, 
	[1073744331] = {{105,},{},false}, 
	[1073744338] = {{105,},{},false}, 
	[1073744336] = {{105,},{},false}, 
	[1073744335] = {{105,},{},false}, 
	[1073744333] = {{105,},{},false}, 
	[1073744334] = {{105,},{},false}, 
	[1073744339] = {{105,},{},false}, 
	[1073744343] = {{105,},{},false}, 
	[1073744340] = {{105,},{},false}, 
	[1073744342] = {{105,},{},false}, 
	[1073744332] = {{105,},{},false}, 
	[1073744898] = {{72,},{},false}, 
	[1073743337] = {{108,},{},false}, 
	[1073743338] = {{108,},{},false}, 
	[1073743339] = {{108,},{},false}, 
	[1073744527] = {{110,},{},false}, 
	[1073744526] = {{110,},{},false}, 
	[1073745005] = {{72,},{},false}, 

}
SceneStyle.SceneECModel_List =
{
	[231] = {{1,2,3,3,},{},false}, 
	[232] = {{1,2,3,3,},{},false}, 
	[232] = {{1,2,3,3,},{},false}, 
	[1073743983] = {{67,},{},false}, 
	[1073747113] = {{80,},{},false}, 
	[1073747114] = {{80,},{},false}, 
	[1073747115] = {{80,},{},false}, 
	[1073747116] = {{80,},{},false}, 
	[1073747117] = {{80,},{},false}, 
	[1073747118] = {{80,},{},false}, 
	[1073747119] = {{80,},{},false}, 
	[1073747120] = {{80,},{},false}, 
	[1073747121] = {{80,},{},false}, 
	[1073747122] = {{80,},{},false}, 
	[1073747222] = {{80,},{},false}, 
	[1073747223] = {{80,},{},false}, 
	[1073747224] = {{80,},{},false}, 
	[1073747225] = {{80,},{},false}, 
	[1073747105] = {{80,},{},false}, 
	[1073747104] = {{80,},{},false}, 
	[1073747107] = {{80,},{},false}, 
	[1073747108] = {{80,},{},false}, 
	[1073747111] = {{80,},{},false}, 
	[1073747112] = {{80,},{},false}, 
	[1073748459] = {{82,},{},false}, 
	[1073748460] = {{82,},{},false}, 
	[1073748456] = {{82,},{},false}, 
	[1073748458] = {{82,},{},false}, 
	[1073744601] = {{84,},{},false}, 
	[1073746780] = {{101,},{},false}, 
	[1073746781] = {{101,},{},false}, 
	[1073746782] = {{101,},{},false}, 
	[1073746783] = {{101,},{},false}, 
	[1073746784] = {{101,},{},false}, 
	[1073746785] = {{101,},{},false}, 
	[1073746786] = {{101,},{},false}, 
	[1073746787] = {{101,},{},false}, 
	[1073746788] = {{101,},{},false}, 
	[1073747026] = {{101,},{},false}, 
	[1073746789] = {{101,},{},false}, 
	[1073747027] = {{101,},{},false}, 
	[1073746790] = {{101,},{},false}, 
	[1073746792] = {{101,},{},false}, 
	[1073747028] = {{101,},{},false}, 
	[1073747051] = {{101,},{},false}, 
	[1073747031] = {{101,},{},false}, 
	[1073747032] = {{101,},{},false}, 
	[1073747053] = {{101,},{},false}, 
	[1073747033] = {{101,},{},false}, 
	[1073747029] = {{101,},{},false}, 
	[1073747030] = {{101,},{},false}, 
	[1073746795] = {{101,},{},false}, 
	[1073746796] = {{101,},{},false}, 
	[1073746791] = {{101,},{},false}, 
	[1073747052] = {{101,},{},false}, 
	[1073746793] = {{101,},{},false}, 
	[1073747034] = {{101,},{},false}, 
	[1073746794] = {{101,},{},false}, 
	[1073746799] = {{101,},{},false}, 
	[1073742235] = {{101,},{},false}, 

}
