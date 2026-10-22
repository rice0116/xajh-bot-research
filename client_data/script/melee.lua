Melee = {}

Melee.revive_skill = 11556				--复活区域buff技能

Melee.own_mine_skill = 11557 			--己方矿物buff技能

Melee.boss_tid = 100101					--boss的tid
Melee.mine_tid = 100449					--矿的tid
Melee.base_mine_a = 289				--A方基地矿序号
Melee.base_mine_b = 290				--B方基地矿序号

Melee.finish_time = 3600			--战场结束时间秒

Melee.all_one_faction_time = 60		--全部矿被一方占领后结束时间秒

Melee.win_award = 11001				--胜利奖励模板

Melee.loss_award = 11002			--失败奖励模板

Melee.serial_mine = 5				--连续占领矿广播，数量

Melee.serial_kill = 5				--连续杀人广播，数量

Melee.mines_broadcast = 5			--占领矿超过多少广播，数量

Melee.fight_value_limit = 240000	--战斗力最大数限制

Melee.buff_region_id_a = 1073748453		--基地a添加buff区域id
Melee.buff_region_id_b = 1073748454		--基地b添加buff区域id

Melee.BornPosA = {					--A方复活点
	
        {-375.76,89.26,-758.12},
	{-375.76,89.26,-608.79},
	{-375.76,89.26,-459.46},
	{-375.76,89.26,-310.13},
	{-375.76,89.26,-160.8},
	{-375.76,89.26,-11.47},
	{-375.76,89.26,137.86},
	{-375.76,89.26,287.19},
	{-375.76,89.26,436.52},
	{-375.76,89.26,585.85},
	{-375.76,89.26,735.18},
	{-375.76,89.26,884.51},
}
Melee.BornPosB = {					--B方复活点
	
        {730.19,89.26,-799.58},
	{730.19,89.26,-641.79},
	{730.19,89.26,-484},
	{730.19,89.26,-326.21},
	{730.19,89.26,-168.42},
	{730.19,89.26,-10.63},
	{730.19,89.26,147.16},
	{730.19,89.26,304.95},
	{730.19,89.26,462.74},
	{730.19,89.26,620.53},
	{730.19,89.26,778.32},
	{730.19,89.26,936.11},
}

Melee.Mine = {
	[1] = {
		{
			number = 1,
			pos = {-200.94,0,-949.01},
			camp = 1,
			link = {13,289,2},
		},
		{
			number = 2,
			pos = {-137.31,0,-932.49},
			camp = 1,
			link = {14,1,3},
		},
		{
			number = 3,
			pos = {-64.41,0,-946.11},
			camp = 1,
			link = {15,2,4},
		},
		{
			number = 4,
			pos = {23.9,0,-936.26},
			camp = 1,
			link = {16,3,5},
		},
		{
			number = 5,
			pos = {113.86,0,-948.93},
			camp = 1,
			link = {17,4,6},
		},
		{
			number = 6,
			pos = {189.36,0,-930.5},
			camp = 1,
			link = {18,5,7},
		},
		{
			number = 7,
			pos = {236.63,0,-938.65},
			camp = 2,
			link = {19,6,8},
		},
		{
			number = 8,
			pos = {320.45,0,-919.28},
			camp = 2,
			link = {20,7,9},
		},
		{
			number = 9,
			pos = {402.35,0,-920.08},
			camp = 2,
			link = {21,8,10},
		},
		{
			number = 10,
			pos = {479.76,0,-924.95},
			camp = 2,
			link = {22,9,11},
		},
		{
			number = 11,
			pos = {541.22,0,-924.8},
			camp = 2,
			link = {23,10,12},
		},
		{
			number = 12,
			pos = {643.31,0,-921.1},
			camp = 2,
			link = {24,11,290},
		},
		{
			number = 13,
			pos = {-210.38,0,-870.2},
			camp = 1,
			link = {25,1,289,14},
		},
		{
			number = 14,
			pos = {-118.77,0,-875.5},
			camp = 1,
			link = {26,2,13,15},
		},
		{
			number = 15,
			pos = {-47.78,0,-863.48},
			camp = 1,
			link = {27,3,14,16},
		},
		{
			number = 16,
			pos = {18.71,0,-857.88},
			camp = 1,
			link = {28,4,15,17},
		},
		{
			number = 17,
			pos = {114.39,0,-872.45},
			camp = 1,
			link = {29,5,16,18},
		},
		{
			number = 18,
			pos = {178.02,0,-865.89},
			camp = 1,
			link = {30,6,17,19},
		},
		{
			number = 19,
			pos = {250.92,0,-842},
			camp = 2,
			link = {31,7,18,20},
		},
		{
			number = 20,
			pos = {339.24,0,-862.03},
			camp = 2,
			link = {32,8,19,21},
		},
		{
			number = 21,
			pos = {401.66,0,-872.36},
			camp = 2,
			link = {33,9,20,22},
		},
		{
			number = 22,
			pos = {477.16,0,-853.94},
			camp = 2,
			link = {34,10,21,23},
		},
		{
			number = 23,
			pos = {561.92,0,-855.69},
			camp = 2,
			link = {35,11,22,24},
		},
		{
			number = 24,
			pos = {614.64,0,-863.85},
			camp = 2,
			link = {36,12,23,290},
		},
		{
			number = 25,
			pos = {-203.45,0,-789.65},
			camp = 1,
			link = {37,13,289,26},
		},
		{
			number = 26,
			pos = {-126.05,0,-769.32},
			camp = 1,
			link = {38,14,25,27},
		},
		{
			number = 27,
			pos = {-66.92,0,-796.71},
			camp = 1,
			link = {39,15,26,28},
		},
		{
			number = 28,
			pos = {8.74,0,-791.9},
			camp = 1,
			link = {40,16,27,29},
		},
		{
			number = 29,
			pos = {92.55,0,-780.83},
			camp = 1,
			link = {41,17,28,30},
		},
		{
			number = 30,
			pos = {181.82,0,-776.18},
			camp = 1,
			link = {42,18,29,31},
		},
		{
			number = 31,
			pos = {252.81,0,-801.66},
			camp = 2,
			link = {43,19,30,32},
		},
		{
			number = 32,
			pos = {319.31,0,-796.05},
			camp = 2,
			link = {44,20,31,33},
		},
		{
			number = 33,
			pos = {414.98,0,-783.08},
			camp = 2,
			link = {45,21,32,34},
		},
		{
			number = 34,
			pos = {478.62,0,-766.56},
			camp = 2,
			link = {46,22,33,35},
		},
		{
			number = 35,
			pos = {563.81,0,-767.89},
			camp = 2,
			link = {47,23,34,36},
		},
		{
			number = 36,
			pos = {614.63,0,-797.87},
			camp = 2,
			link = {48,24,35,290},
		},
		{
			number = 37,
			pos = {-187.79,0,-725.58},
			camp = 1,
			link = {49,25,289,38},
		},
		{
			number = 38,
			pos = {-122.25,0,-707.16},
			camp = 1,
			link = {50,26,37,39},
		},
		{
			number = 39,
			pos = {-65.03,0,-718.87},
			camp = 1,
			link = {51,27,38,40},
		},
		{
			number = 40,
			pos = {25.19,0,-727.03},
			camp = 1,
			link = {52,28,39,41},
		},
		{
			number = 41,
			pos = {97.14,0,-727.83},
			camp = 1,
			link = {53,29,40,42},
		},
		{
			number = 42,
			pos = {174.54,0,-697.54},
			camp = 1,
			link = {54,30,41,43},
		},
		{
			number = 43,
			pos = {243.63,0,-697.39},
			camp = 2,
			link = {55,31,42,44},
		},
		{
			number = 44,
			pos = {308.22,0,-693.69},
			camp = 2,
			link = {56,32,43,45},
		},
		{
			number = 45,
			pos = {392.03,0,-692.58},
			camp = 2,
			link = {57,33,44,46},
		},
		{
			number = 46,
			pos = {471.34,0,-725.43},
			camp = 2,
			link = {58,34,45,47},
		},
		{
			number = 47,
			pos = {542.33,0,-713.41},
			camp = 2,
			link = {59,35,46,48},
		},
		{
			number = 48,
			pos = {618.78,0,-707.8},
			camp = 2,
			link = {60,36,47,290},
		},
		{
			number = 49,
			pos = {-185.54,0,-647.38},
			camp = 1,
			link = {61,37,289,50},
		},
		{
			number = 50,
			pos = {-129.53,0,-638.48},
			camp = 1,
			link = {62,38,49,51},
		},
		{
			number = 51,
			pos = {-46.67,0,-652.1},
			camp = 1,
			link = {63,39,50,52},
		},
		{
			number = 52,
			pos = {41.65,0,-634.62},
			camp = 1,
			link = {64,40,51,53},
		},
		{
			number = 53,
			pos = {101.73,0,-647.29},
			camp = 1,
			link = {65,41,52,54},
		},
		{
			number = 54,
			pos = {167.27,0,-628.87},
			camp = 1,
			link = {66,42,53,55},
		},
		{
			number = 55,
			pos = {261.99,0,-630.62},
			camp = 2,
			link = {67,43,54,56},
		},
		{
			number = 56,
			pos = {314.71,0,-648.74},
			camp = 2,
			link = {68,44,55,57},
		},
		{
			number = 57,
			pos = {386.66,0,-649.54},
			camp = 2,
			link = {69,45,56,58},
		},
		{
			number = 58,
			pos = {464.06,0,-619.25},
			camp = 2,
			link = {70,46,57,59},
		},
		{
			number = 59,
			pos = {533.15,0,-646.64},
			camp = 2,
			link = {71,47,58,60},
		},
		{
			number = 60,
			pos = {625.28,0,-652.9},
			camp = 2,
			link = {72,48,59,290},
		},
		{
			number = 61,
			pos = {-218.45,0,-566.83},
			camp = 1,
			link = {73,49,289,62},
		},
		{
			number = 62,
			pos = {-139.14,0,-572.14},
			camp = 1,
			link = {74,50,61,63},
		},
		{
			number = 63,
			pos = {-68.15,0,-560.12},
			camp = 1,
			link = {75,51,62,64},
		},
		{
			number = 64,
			pos = {8.3,0,-554.51},
			camp = 1,
			link = {76,52,63,65},
		},
		{
			number = 65,
			pos = {103.98,0,-569.09},
			camp = 1,
			link = {77,53,64,66},
		},
		{
			number = 66,
			pos = {157.65,0,-562.53},
			camp = 1,
			link = {78,54,65,67},
		},
		{
			number = 67,
			pos = {240.51,0,-576.14},
			camp = 2,
			link = {79,55,66,68},
		},
		{
			number = 68,
			pos = {318.87,0,-558.67},
			camp = 2,
			link = {80,56,67,69},
		},
		{
			number = 69,
			pos = {388.91,0,-571.34},
			camp = 2,
			link = {81,57,68,70},
		},
		{
			number = 70,
			pos = {491.95,0,-542.95},
			camp = 2,
			link = {82,58,69,71},
		},
		{
			number = 71,
			pos = {549.17,0,-554.67},
			camp = 2,
			link = {83,59,70,72},
		},
		{
			number = 72,
			pos = {639.39,0,-562.83},
			camp = 2,
			link = {84,60,71,290},
		},
		{
			number = 73,
			pos = {-188.66,0,-488.63},
			camp = 1,
			link = {85,61,289,74},
		},
		{
			number = 74,
			pos = {-111.26,0,-495.84},
			camp = 1,
			link = {86,62,73,75},
		},
		{
			number = 75,
			pos = {-52.13,0,-495.69},
			camp = 1,
			link = {87,63,74,76},
		},
		{
			number = 76,
			pos = {12.46,0,-501.95},
			camp = 1,
			link = {88,64,75,77},
		},
		{
			number = 77,
			pos = {96.27,0,-490.88},
			camp = 1,
			link = {89,65,76,78},
		},
		{
			number = 78,
			pos = {185.54,0,-486.23},
			camp = 1,
			link = {90,66,77,79},
		},
		{
			number = 79,
			pos = {256.53,0,-474.21},
			camp = 2,
			link = {91,67,78,80},
		},
		{
			number = 80,
			pos = {332.99,0,-468.6},
			camp = 2,
			link = {92,68,79,81},
		},
		{
			number = 81,
			pos = {391.16,0,-493.13},
			camp = 2,
			link = {93,69,80,82},
		},
		{
			number = 82,
			pos = {482.34,0,-476.61},
			camp = 2,
			link = {94,70,81,83},
		},
		{
			number = 83,
			pos = {565.2,0,-490.23},
			camp = 2,
			link = {95,71,82,84},
		},
		{
			number = 84,
			pos = {643.55,0,-482.72},
			camp = 2,
			link = {96,72,83,290},
		},
		{
			number = 85,
			pos = {-186.41,0,-410.43},
			camp = 1,
			link = {97,73,289,86},
		},
		{
			number = 86,
			pos = {-120.87,0,-392},
			camp = 1,
			link = {98,74,85,87},
		},
		{
			number = 87,
			pos = {-63.64,0,-393.75},
			camp = 1,
			link = {99,75,86,88},
		},
		{
			number = 88,
			pos = {26.58,0,-411.88},
			camp = 1,
			link = {100,76,87,89},
		},
		{
			number = 89,
			pos = {98.52,0,-412.68},
			camp = 1,
			link = {101,77,88,90},
		},
		{
			number = 90,
			pos = {175.93,0,-419.89},
			camp = 1,
			link = {102,78,89,91},
		},
		{
			number = 91,
			pos = {235.06,0,-419.74},
			camp = 2,
			link = {103,79,90,92},
		},
		{
			number = 92,
			pos = {337.14,0,-416.03},
			camp = 2,
			link = {104,80,91,93},
		},
		{
			number = 93,
			pos = {383.45,0,-414.93},
			camp = 2,
			link = {105,81,92,94},
		},
		{
			number = 94,
			pos = {472.72,0,-410.27},
			camp = 2,
			link = {106,82,93,95},
		},
		{
			number = 95,
			pos = {543.72,0,-398.26},
			camp = 2,
			link = {107,83,94,96},
		},
		{
			number = 96,
			pos = {620.17,0,-392.65},
			camp = 2,
			link = {108,84,95,290},
		},
		{
			number = 97,
			pos = {-194.11,0,-332.22},
			camp = 1,
			link = {109,85,289,98},
		},
		{
			number = 98,
			pos = {-130.48,0,-325.66},
			camp = 1,
			link = {110,86,97,99},
		},
		{
			number = 99,
			pos = {-47.62,0,-339.28},
			camp = 1,
			link = {111,87,98,100},
		},
		{
			number = 100,
			pos = {30.73,0,-321.81},
			camp = 1,
			link = {112,88,99,101},
		},
		{
			number = 101,
			pos = {100.78,0,-334.47},
			camp = 1,
			link = {113,89,100,102},
		},
		{
			number = 102,
			pos = {166.31,0,-353.55},
			camp = 1,
			link = {114,90,101,103},
		},
		{
			number = 103,
			pos = {253.42,0,-352.96},
			camp = 2,
			link = {115,91,102,104},
		},
		{
			number = 104,
			pos = {316.1,0,-333.59},
			camp = 2,
			link = {116,92,103,105},
		},
		{
			number = 105,
			pos = {388.04,0,-334.39},
			camp = 2,
			link = {117,93,104,106},
		},
		{
			number = 106,
			pos = {465.45,0,-341.6},
			camp = 2,
			link = {118,94,105,107},
		},
		{
			number = 107,
			pos = {562.08,0,-331.49},
			camp = 2,
			link = {119,95,106,108},
		},
		{
			number = 108,
			pos = {626.66,0,-337.74},
			camp = 2,
			link = {120,96,107,290},
		},
		{
			number = 109,
			pos = {-189.53,0,-251.68},
			camp = 1,
			link = {121,97,289,110},
		},
		{
			number = 110,
			pos = {-137.76,0,-256.98},
			camp = 1,
			link = {122,98,109,111},
		},
		{
			number = 111,
			pos = {-66.76,0,-272.51},
			camp = 1,
			link = {123,99,110,112},
		},
		{
			number = 112,
			pos = {9.69,0,-266.9},
			camp = 1,
			link = {124,100,111,113},
		},
		{
			number = 113,
			pos = {95.4,0,-253.93},
			camp = 1,
			link = {125,101,112,114},
		},
		{
			number = 114,
			pos = {159.04,0,-274.91},
			camp = 1,
			link = {126,102,113,115},
		},
		{
			number = 115,
			pos = {241.9,0,-260.99},
			camp = 2,
			link = {127,103,114,116},
		},
		{
			number = 116,
			pos = {320.25,0,-243.52},
			camp = 2,
			link = {128,104,115,117},
		},
		{
			number = 117,
			pos = {390.29,0,-256.18},
			camp = 2,
			link = {129,105,116,118},
		},
		{
			number = 118,
			pos = {493.33,0,-265.3},
			camp = 2,
			link = {130,106,117,119},
		},
		{
			number = 119,
			pos = {540.6,0,-277.01},
			camp = 2,
			link = {131,107,118,120},
		},
		{
			number = 120,
			pos = {630.82,0,-247.67},
			camp = 2,
			link = {132,108,119,290},
		},
		{
			number = 121,
			pos = {-187.27,0,-173.48},
			camp = 1,
			link = {133,109,289,122},
		},
		{
			number = 122,
			pos = {-109.87,0,-180.69},
			camp = 1,
			link = {134,110,121,123},
		},
		{
			number = 123,
			pos = {-50.74,0,-180.53},
			camp = 1,
			link = {135,111,122,124},
		},
		{
			number = 124,
			pos = {13.84,0,-186.79},
			camp = 1,
			link = {136,112,123,125},
		},
		{
			number = 125,
			pos = {97.66,0,-175.73},
			camp = 1,
			link = {137,113,124,126},
		},
		{
			number = 126,
			pos = {186.92,0,-171.07},
			camp = 1,
			link = {138,114,125,127},
		},
		{
			number = 127,
			pos = {257.92,0,-196.56},
			camp = 2,
			link = {139,115,126,128},
		},
		{
			number = 128,
			pos = {324.41,0,-190.95},
			camp = 2,
			link = {140,116,127,129},
		},
		{
			number = 129,
			pos = {382.59,0,-177.98},
			camp = 2,
			link = {141,117,128,130},
		},
		{
			number = 130,
			pos = {483.72,0,-198.96},
			camp = 2,
			link = {142,118,129,131},
		},
		{
			number = 131,
			pos = {556.62,0,-175.08},
			camp = 2,
			link = {143,119,130,132},
		},
		{
			number = 132,
			pos = {607.44,0,-195.11},
			camp = 2,
			link = {144,120,131,290},
		},
		{
			number = 133,
			pos = {-194.98,0,-95.27},
			camp = 1,
			link = {145,121,289,134},
		},
		{
			number = 134,
			pos = {-119.48,0,-114.35},
			camp = 1,
			link = {146,122,133,135},
		},
		{
			number = 135,
			pos = {-34.72,0,-116.1},
			camp = 1,
			link = {147,123,134,136},
		},
		{
			number = 136,
			pos = {18,0,-96.72},
			camp = 1,
			link = {148,124,135,137},
		},
		{
			number = 137,
			pos = {99.91,0,-97.52},
			camp = 1,
			link = {149,125,136,138},
		},
		{
			number = 138,
			pos = {177.31,0,-104.73},
			camp = 1,
			link = {150,126,137,139},
		},
		{
			number = 139,
			pos = {236.44,0,-104.58},
			camp = 2,
			link = {151,127,138,140},
		},
		{
			number = 140,
			pos = {338.53,0,-100.88},
			camp = 2,
			link = {152,128,139,141},
		},
		{
			number = 141,
			pos = {384.84,0,-127.32},
			camp = 2,
			link = {153,129,140,142},
		},
		{
			number = 142,
			pos = {474.11,0,-95.12},
			camp = 2,
			link = {154,130,141,143},
		},
		{
			number = 143,
			pos = {545.1,0,-120.6},
			camp = 2,
			link = {155,131,142,144},
		},
		{
			number = 144,
			pos = {611.59,0,-115},
			camp = 2,
			link = {156,132,143,290},
		},
		{
			number = 145,
			pos = {-192.73,0,-17.07},
			camp = 1,
			link = {157,133,289,146},
		},
		{
			number = 146,
			pos = {-129.1,0,-48.01},
			camp = 1,
			link = {158,134,145,147},
		},
		{
			number = 147,
			pos = {-56.2,0,-24.13},
			camp = 1,
			link = {159,135,146,148},
		},
		{
			number = 148,
			pos = {32.12,0,-44.15},
			camp = 1,
			link = {160,136,147,149},
		},
		{
			number = 149,
			pos = {92.2,0,-19.32},
			camp = 1,
			link = {161,137,148,150},
		},
		{
			number = 150,
			pos = {167.7,0,-38.39},
			camp = 1,
			link = {162,138,149,151},
		},
	},
	[2] = {
		{
			number = 151,
			pos = {252.46,0,-40.15},
			camp = 2,
			link = {163,139,150,152},
		},
		{
			number = 152,
			pos = {342.68,0,-48.31},
			camp = 2,
			link = {164,140,151,153},
		},
		{
			number = 153,
			pos = {387.09,0,-49.11},
			camp = 2,
			link = {165,141,152,154},
		},
		{
			number = 154,
			pos = {464.49,0,-28.78},
			camp = 2,
			link = {166,142,153,155},
		},
		{
			number = 155,
			pos = {561.12,0,-18.67},
			camp = 2,
			link = {167,143,154,156},
		},
		{
			number = 156,
			pos = {609.35,0,-41.28},
			camp = 2,
			link = {168,144,155,290},
		},
		{
			number = 157,
			pos = {-206.84,0,44.78},
			camp = 1,
			link = {169,145,289,158},
		},
		{
			number = 158,
			pos = {-117.57,0,49.43},
			camp = 1,
			link = {170,146,157,159},
		},
		{
			number = 159,
			pos = {-46.57,0,23.95},
			camp = 1,
			link = {171,147,158,160},
		},
		{
			number = 160,
			pos = {19.92,0,29.56},
			camp = 1,
			link = {172,148,159,161},
		},
		{
			number = 161,
			pos = {115.59,0,42.53},
			camp = 1,
			link = {173,149,160,162},
		},
		{
			number = 162,
			pos = {179.23,0,21.55},
			camp = 1,
			link = {174,150,161,163},
		},
		{
			number = 163,
			pos = {252.13,0,45.43},
			camp = 2,
			link = {175,151,162,164},
		},
		{
			number = 164,
			pos = {340.44,0,52.94},
			camp = 2,
			link = {176,152,163,165},
		},
		{
			number = 165,
			pos = {400.52,0,50.24},
			camp = 2,
			link = {177,153,164,166},
		},
		{
			number = 166,
			pos = {466.06,0,31.16},
			camp = 2,
			link = {178,154,165,167},
		},
		{
			number = 167,
			pos = {560.79,0,56.95},
			camp = 2,
			link = {179,155,166,168},
		},
		{
			number = 168,
			pos = {613.51,0,48.78},
			camp = 2,
			link = {180,156,167,290},
		},
		{
			number = 169,
			pos = {-214.54,0,122.98},
			camp = 1,
			link = {181,157,289,170},
		},
		{
			number = 170,
			pos = {-137.14,0,115.77},
			camp = 1,
			link = {182,158,169,171},
		},
		{
			number = 171,
			pos = {-68.05,0,115.93},
			camp = 1,
			link = {183,159,170,172},
		},
		{
			number = 172,
			pos = {34.03,0,119.63},
			camp = 1,
			link = {184,160,171,173},
		},
		{
			number = 173,
			pos = {117.85,0,120.73},
			camp = 1,
			link = {185,161,172,174},
		},
		{
			number = 174,
			pos = {159.65,0,125.39},
			camp = 1,
			link = {186,162,173,175},
		},
		{
			number = 175,
			pos = {268.15,0,99.9},
			camp = 2,
			link = {187,163,174,176},
		},
		{
			number = 176,
			pos = {307.1,0,105.51},
			camp = 2,
			link = {188,164,175,177},
		},
		{
			number = 177,
			pos = {402.78,0,128.44},
			camp = 2,
			link = {189,165,176,178},
		},
		{
			number = 178,
			pos = {456.45,0,97.5},
			camp = 2,
			link = {190,166,177,179},
		},
		{
			number = 179,
			pos = {539.31,0,121.38},
			camp = 2,
			link = {191,167,178,180},
		},
		{
			number = 180,
			pos = {627.62,0,101.35},
			camp = 2,
			link = {192,168,179,290},
		},
		{
			number = 181,
			pos = {-212.29,0,201.19},
			camp = 1,
			link = {193,169,289,182},
		},
		{
			number = 182,
			pos = {-109.25,0,182.11},
			camp = 1,
			link = {194,170,181,183},
		},
		{
			number = 183,
			pos = {-52.03,0,180.36},
			camp = 1,
			link = {195,171,182,184},
		},
		{
			number = 184,
			pos = {38.19,0,199.74},
			camp = 1,
			link = {196,172,183,185},
		},
		{
			number = 185,
			pos = {110.14,0,198.94},
			camp = 1,
			link = {197,173,184,186},
		},
		{
			number = 186,
			pos = {187.54,0,191.73},
			camp = 1,
			link = {198,174,185,187},
		},
		{
			number = 187,
			pos = {256.63,0,201.84},
			camp = 2,
			link = {199,175,186,188},
		},
		{
			number = 188,
			pos = {311.26,0,195.58},
			camp = 2,
			link = {200,176,187,189},
		},
		{
			number = 189,
			pos = {405.03,0,206.64},
			camp = 2,
			link = {201,177,188,190},
		},
		{
			number = 190,
			pos = {484.34,0,201.34},
			camp = 2,
			link = {202,178,189,191},
		},
		{
			number = 191,
			pos = {555.33,0,175.86},
			camp = 2,
			link = {203,179,190,192},
		},
		{
			number = 192,
			pos = {631.78,0,181.46},
			camp = 2,
			link = {204,180,191,290},
		},
		{
			number = 193,
			pos = {-210.04,0,279.39},
			camp = 1,
			link = {205,181,289,194},
		},
		{
			number = 194,
			pos = {-118.87,0,248.45},
			camp = 1,
			link = {206,182,193,195},
		},
		{
			number = 195,
			pos = {-36.01,0,272.33},
			camp = 1,
			link = {207,183,194,196},
		},
		{
			number = 196,
			pos = {42.35,0,252.31},
			camp = 1,
			link = {208,184,195,197},
		},
		{
			number = 197,
			pos = {112.39,0,277.14},
			camp = 1,
			link = {209,185,196,198},
		},
		{
			number = 198,
			pos = {177.93,0,268.03},
			camp = 1,
			link = {210,186,197,199},
		},
		{
			number = 199,
			pos = {235.15,0,256.31},
			camp = 2,
			link = {211,187,198,200},
		},
		{
			number = 200,
			pos = {325.37,0,248.15},
			camp = 2,
			link = {212,188,199,201},
		},
		{
			number = 201,
			pos = {397.32,0,247.35},
			camp = 2,
			link = {213,189,200,202},
		},
		{
			number = 202,
			pos = {474.72,0,277.64},
			camp = 2,
			link = {214,190,201,203},
		},
		{
			number = 203,
			pos = {533.85,0,277.79},
			camp = 2,
			link = {215,191,202,204},
		},
		{
			number = 204,
			pos = {635.94,0,271.53},
			camp = 2,
			link = {216,192,203,290},
		},
		{
			number = 205,
			pos = {-217.75,0,357.6},
			camp = 1,
			link = {217,193,289,206},
		},
		{
			number = 206,
			pos = {-128.48,0,324.75},
			camp = 1,
			link = {218,194,205,207},
		},
		{
			number = 207,
			pos = {-57.49,0,336.77},
			camp = 1,
			link = {219,195,206,208},
		},
		{
			number = 208,
			pos = {18.96,0,342.38},
			camp = 1,
			link = {220,196,207,209},
		},
		{
			number = 209,
			pos = {114.64,0,355.35},
			camp = 1,
			link = {221,197,208,210},
		},
		{
			number = 210,
			pos = {168.31,0,334.36},
			camp = 1,
			link = {222,198,209,211},
		},
		{
			number = 211,
			pos = {251.17,0,358.25},
			camp = 2,
			link = {223,199,210,212},
		},
		{
			number = 212,
			pos = {329.53,0,328.26},
			camp = 2,
			link = {224,200,211,213},
		},
		{
			number = 213,
			pos = {399.57,0,325.55},
			camp = 2,
			link = {225,201,212,214},
		},
		{
			number = 214,
			pos = {465.11,0,343.98},
			camp = 2,
			link = {226,202,213,215},
		},
		{
			number = 215,
			pos = {559.83,0,342.22},
			camp = 2,
			link = {227,203,214,216},
		},
		{
			number = 216,
			pos = {612.56,0,324.1},
			camp = 2,
			link = {228,204,215,290},
		},
		{
			number = 217,
			pos = {-215.5,0,398.3},
			camp = 1,
			link = {229,205,289,218},
		},
		{
			number = 218,
			pos = {-138.09,0,428.59},
			camp = 1,
			link = {230,206,217,219},
		},
		{
			number = 219,
			pos = {-41.46,0,428.74},
			camp = 1,
			link = {231,207,218,220},
		},
		{
			number = 220,
			pos = {23.12,0,432.44},
			camp = 1,
			link = {232,208,219,221},
		},
		{
			number = 221,
			pos = {106.93,0,433.55},
			camp = 1,
			link = {233,209,220,222},
		},
		{
			number = 222,
			pos = {158.7,0,400.7},
			camp = 1,
			link = {234,210,221,223},
		},
		{
			number = 223,
			pos = {267.2,0,412.72},
			camp = 2,
			link = {235,211,222,224},
		},
		{
			number = 224,
			pos = {343.65,0,418.33},
			camp = 2,
			link = {236,212,223,225},
		},
		{
			number = 225,
			pos = {391.86,0,403.76},
			camp = 2,
			link = {237,213,224,226},
		},
		{
			number = 226,
			pos = {493,0,410.32},
			camp = 2,
			link = {238,214,225,227},
		},
		{
			number = 227,
			pos = {538.36,0,396.7},
			camp = 2,
			link = {239,215,226,228},
		},
		{
			number = 228,
			pos = {616.71,0,414.17},
			camp = 2,
			link = {240,216,227,290},
		},
		{
			number = 229,
			pos = {-213.25,0,476.51},
			camp = 1,
			link = {241,217,289,230},
		},
		{
			number = 230,
			pos = {-110.21,0,494.93},
			camp = 1,
			link = {242,218,229,231},
		},
		{
			number = 231,
			pos = {-62.94,0,493.18},
			camp = 1,
			link = {243,219,230,232},
		},
		{
			number = 232,
			pos = {37.24,0,475.05},
			camp = 1,
			link = {244,220,231,233},
		},
		{
			number = 233,
			pos = {109.19,0,474.25},
			camp = 1,
			link = {245,221,232,234},
		},
		{
			number = 234,
			pos = {186.59,0,504.54},
			camp = 1,
			link = {246,222,233,235},
		},
		{
			number = 235,
			pos = {245.72,0,477.15},
			camp = 2,
			link = {247,223,234,236},
		},
		{
			number = 236,
			pos = {310.3,0,508.4},
			camp = 2,
			link = {248,224,235,237},
		},
		{
			number = 237,
			pos = {394.12,0,481.96},
			camp = 2,
			link = {249,225,236,238},
		},
		{
			number = 238,
			pos = {485.72,0,478.99},
			camp = 2,
			link = {250,226,237,239},
		},
		{
			number = 239,
			pos = {556.72,0,500.97},
			camp = 2,
			link = {251,227,238,240},
		},
		{
			number = 240,
			pos = {633.17,0,506.58},
			camp = 2,
			link = {252,228,239,290},
		},
		{
			number = 241,
			pos = {-218.62,0,557.05},
			camp = 1,
			link = {253,229,289,242},
		},
		{
			number = 242,
			pos = {-117.48,0,573.57},
			camp = 1,
			link = {254,230,241,243},
		},
		{
			number = 243,
			pos = {-34.62,0,549.99},
			camp = 1,
			link = {255,231,242,244},
		},
		{
			number = 244,
			pos = {43.73,0,567.46},
			camp = 1,
			link = {256,232,243,245},
		},
		{
			number = 245,
			pos = {113.77,0,554.8},
			camp = 1,
			link = {257,233,244,246},
		},
		{
			number = 246,
			pos = {179.31,0,583.18},
			camp = 1,
			link = {258,234,245,247},
		},
		{
			number = 247,
			pos = {264.08,0,571.47},
			camp = 2,
			link = {259,235,246,248},
		},
		{
			number = 248,
			pos = {316.8,0,563.3},
			camp = 2,
			link = {260,236,247,249},
		},
		{
			number = 249,
			pos = {398.7,0,562.5},
			camp = 2,
			link = {261,237,248,250},
		},
		{
			number = 250,
			pos = {476.11,0,555.29},
			camp = 2,
			link = {262,238,249,251},
		},
		{
			number = 251,
			pos = {535.24,0,555.44},
			camp = 2,
			link = {263,239,250,252},
		},
		{
			number = 252,
			pos = {637.32,0,549.19},
			camp = 2,
			link = {264,240,251,290},
		},
		{
			number = 253,
			pos = {-216.36,0,635.25},
			camp = 1,
			link = {265,241,289,254},
		},
		{
			number = 254,
			pos = {-127.1,0,639.91},
			camp = 1,
			link = {266,242,253,255},
		},
		{
			number = 255,
			pos = {-56.1,0,651.92},
			camp = 1,
			link = {267,243,254,256},
		},
		{
			number = 256,
			pos = {10.39,0,657.53},
			camp = 1,
			link = {268,244,255,257},
		},
		{
			number = 257,
			pos = {106.07,0,633},
			camp = 1,
			link = {269,245,256,258},
		},
		{
			number = 258,
			pos = {169.7,0,649.52},
			camp = 1,
			link = {270,246,257,259},
		},
		{
			number = 259,
			pos = {242.6,0,635.9},
			camp = 2,
			link = {271,247,258,260},
		},
		{
			number = 260,
			pos = {330.91,0,653.37},
			camp = 2,
			link = {272,248,259,261},
		},
		{
			number = 261,
			pos = {391,0,640.71},
			camp = 2,
			link = {273,249,260,262},
		},
		{
			number = 262,
			pos = {466.49,0,621.63},
			camp = 2,
			link = {274,250,261,263},
		},
		{
			number = 263,
			pos = {551.26,0,657.38},
			camp = 2,
			link = {275,251,262,264},
		},
		{
			number = 264,
			pos = {641.48,0,639.26},
			camp = 2,
			link = {276,252,263,290},
		},
		{
			number = 265,
			pos = {-214.11,0,713.46},
			camp = 1,
			link = {277,253,289,266},
		},
		{
			number = 266,
			pos = {-136.71,0,706.25},
			camp = 1,
			link = {278,254,265,267},
		},
		{
			number = 267,
			pos = {-40.08,0,706.4},
			camp = 1,
			link = {279,255,266,268},
		},
		{
			number = 268,
			pos = {24.51,0,710.1},
			camp = 1,
			link = {280,256,267,269},
		},
		{
			number = 269,
			pos = {108.32,0,721.16},
			camp = 1,
			link = {281,257,268,270},
		},
		{
			number = 270,
			pos = {160.09,0,715.86},
			camp = 1,
			link = {282,258,269,271},
		},
		{
			number = 271,
			pos = {268.58,0,727.88},
			camp = 2,
			link = {283,259,270,272},
		},
		{
			number = 272,
			pos = {335.07,0,733.48},
			camp = 2,
			link = {284,260,271,273},
		},
		{
			number = 273,
			pos = {393.25,0,718.91},
			camp = 2,
			link = {285,261,272,274},
		},
		{
			number = 274,
			pos = {456.88,0,725.47},
			camp = 2,
			link = {286,262,273,275},
		},
		{
			number = 275,
			pos = {567.28,0,711.85},
			camp = 2,
			link = {287,263,274,276},
		},
		{
			number = 276,
			pos = {618.1,0,729.33},
			camp = 2,
			link = {288,264,275,290},
		},
		{
			number = 277,
			pos = {-184.32,0,791.66},
			camp = 1,
			link = {265,289,278},
		},
		{
			number = 278,
			pos = {-108.82,0,772.59},
			camp = 1,
			link = {266,277,279},
		},
		{
			number = 279,
			pos = {-61.56,0,808.33},
			camp = 1,
			link = {267,278,280},
		},
		{
			number = 280,
			pos = {28.66,0,800.17},
			camp = 1,
			link = {268,279,281},
		},
		{
			number = 281,
			pos = {110.57,0,799.37},
			camp = 1,
			link = {269,280,282},
		},
		{
			number = 282,
			pos = {187.97,0,782.2},
			camp = 1,
			link = {270,281,283},
		},
		{
			number = 283,
			pos = {247.1,0,792.31},
			camp = 2,
			link = {271,282,284},
		},
		{
			number = 284,
			pos = {311.69,0,786.05},
			camp = 2,
			link = {272,283,285},
		},
		{
			number = 285,
			pos = {395.5,0,797.12},
			camp = 2,
			link = {273,284,286},
		},
		{
			number = 286,
			pos = {484.77,0,801.77},
			camp = 2,
			link = {274,285,287},
		},
		{
			number = 287,
			pos = {555.76,0,776.29},
			camp = 2,
			link = {275,286,288},
		},
		{
			number = 288,
			pos = {622.25,0,781.9},
			camp = 2,
			link = {276,287,290},
		},
		{
			number = 289,
			pos = {-400,0,0},
			camp = 1,
			link = {277,265,253,241,229,217,205,193,181,169,157,145,133,121,109,97,85,73,61,49,37,25,13,1},
		},
		{
			number = 290,
			pos = {780,0,0},
			camp = 2,
			link = {288,276,264,252,240,228,216,204,192,180,168,156,144,132,120,108,96,84,72,60,48,36,24,12},
		},
	},
}


function Melee:GetMeleeInfo()
	local ret_table = {}
	ret_table[#ret_table + 1] = self.revive_skill
	ret_table[#ret_table + 1] = self.own_mine_skill
	ret_table[#ret_table + 1] = self.boss_tid
	ret_table[#ret_table + 1] = self.mine_tid
	ret_table[#ret_table + 1] = self.base_mine_a
	ret_table[#ret_table + 1] = self.base_mine_b
	ret_table[#ret_table + 1] = self.finish_time
	ret_table[#ret_table + 1] = self.all_one_faction_time
	ret_table[#ret_table + 1] = self.win_award
	ret_table[#ret_table + 1] = self.loss_award
	ret_table[#ret_table + 1] = self.serial_mine
	ret_table[#ret_table + 1] = self.serial_kill
	ret_table[#ret_table + 1] = self.mines_broadcast
	ret_table[#ret_table + 1] = self.fight_value_limit
	ret_table[#ret_table + 1] = self.buff_region_id_a
	ret_table[#ret_table + 1] = self.buff_region_id_b
	return unpack(ret_table)
end

function Melee:GetBornPosA()
	local ret_table = {}
	ret_table[1] = #self.BornPosA
	for k, v in pairs (self.BornPosA) do
		ret_table[#ret_table + 1] = v[1] or 0
		ret_table[#ret_table + 1] = v[2] or 0
		ret_table[#ret_table + 1] = v[3] or 0
	end
	return unpack(ret_table)
end
function Melee:GetBornPosB()
	local ret_table = {}
	ret_table[1] = #self.BornPosB
	for k, v in pairs (self.BornPosB) do
		ret_table[#ret_table + 1] = v[1] or 0
		ret_table[#ret_table + 1] = v[2] or 0
		ret_table[#ret_table + 1] = v[3] or 0
	end
	return unpack(ret_table)
end
function Melee:GetMineInfo(n)
	local ret_table = {}
	if self.Mine[n] == nil then
		return unpack(ret_table)
	end
	for k, v in pairs (self.Mine[n]) do
		ret_table[#ret_table + 1] = v.number
		if #v.pos ~= 3 then
			return nil
		end
		ret_table[#ret_table + 1] = v.pos[1]
		ret_table[#ret_table + 1] = v.pos[2]
		ret_table[#ret_table + 1] = v.pos[3]

		ret_table[#ret_table + 1] = v.camp
		ret_table[#ret_table + 1] = #(v.link)
		for lk, lv in pairs (v.link) do 
			ret_table[#ret_table + 1] = lv
		end
	end
	return unpack(ret_table)
end

function Melee:GetFightValueLimit()
	return self.fight_value_limit
end

function Melee:GetBaseNum()
	return self.base_mine_a, self.base_mine_b
end
