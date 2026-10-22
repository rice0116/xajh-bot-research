EscapeKillProperty = {}

EscapeKillProperty.Base = {
	defense = 100,		--破绽值
	defense_gen = -10,		--破绽值恢复（负数）
	strength = 150,		--体力值
	strength_gen = 10,		--体力值恢复
	crit_damage = 1.5,		--会心伤害
	normal_attack_sight = 60,		--正常攻击视距
	valid_attack_sight = 60,		--合理攻击视距
	heal_factor = 0,		--治疗效果加成
	armour_icon_id = 26682,		--防具图标ID
}

EscapeKillProperty[1] = {           --1：武器tid，对应escape_kill.lua的weapon，同时修改
	{
		appearance = {83797,83815,83785,83773,83779,83791,83809,83821,83803,83767,88560,97919},		--外观id，分别对应少林、武当、华山、恒山、衡山、日月、五仙、逍遥、唐门、峨眉、独孤、武罗
		level = 1,		--等级
		hp = 22400,		--气血
		mp = 3000,		--内力
		phy_attack = 11200,		--外功攻击
		mag_attack = 11200,		--内功攻击
		phy_defense = 1400,		--外攻防御
		mag_defense = 1400,		--内攻防御
		crit = 175,		--会心
		mastery = 350,		--精通
		resist = 175,		--抵御
		hp_scale = 0,		--气血百分比加成
		total_damage = 15,		--总伤害百分比加成
	},
	{
		appearance = {83798,83816,83786,83774,83780,83792,83810,83822,83804,83768,88561,97920},		--外观id，分别对应少林、武当、华山、恒山、衡山、日月、五仙、逍遥、唐门、峨眉、独孤、武罗
		level = 2,		--等级
		hp = 22400,		--气血
		mp = 3000,		--内力
		phy_attack = 11200,		--外功攻击
		mag_attack = 11200,		--内功攻击
		phy_defense = 1400,		--外攻防御
		mag_defense = 1400,		--内攻防御
		crit = 175,		--会心
		mastery = 350,		--精通
		resist = 175,		--抵御
		hp_scale = 0,		--气血百分比加成
		total_damage = 15,		--总伤害百分比加成
	},
	{
		appearance = {83799,83817,83787,83775,83781,83793,83811,83823,83805,83769,88562,97921},		--外观id，分别对应少林、武当、华山、恒山、衡山、日月、五仙、逍遥、唐门、峨眉、独孤、武罗
		level = 3,		--等级
		hp = 27200,		--气血
		mp = 3000,		--内力
		phy_attack = 13600,		--外功攻击
		mag_attack = 13600,		--内功攻击
		phy_defense = 1700,		--外攻防御
		mag_defense = 1700,		--内攻防御
		crit = 213,		--会心
		mastery = 425,		--精通
		resist = 213,		--抵御
		hp_scale = 0,		--气血百分比加成
		total_damage = 15,		--总伤害百分比加成
	},
	{
		appearance = {83800,83818,83788,83776,83782,83794,83812,83824,83806,83770,88563,97922},		--外观id，分别对应少林、武当、华山、恒山、衡山、日月、五仙、逍遥、唐门、峨眉、独孤、武罗
		level = 4,		--等级
		hp = 27200,		--气血
		mp = 3000,		--内力
		phy_attack = 13600,		--外功攻击
		mag_attack = 13600,		--内功攻击
		phy_defense = 1700,		--外攻防御
		mag_defense = 1700,		--内攻防御
		crit = 213,		--会心
		mastery = 425,		--精通
		resist = 213,		--抵御
		hp_scale = 0,		--气血百分比加成
		total_damage = 15,		--总伤害百分比加成
	},
	{
		appearance = {83801,83819,83789,83777,83783,83795,83813,83825,83807,83771,88564,97923},		--外观id，分别对应少林、武当、华山、恒山、衡山、日月、五仙、逍遥、唐门、峨眉、独孤、武罗
		level = 5,		--等级
		hp = 32480,		--气血
		mp = 3000,		--内力
		phy_attack = 16240,		--外功攻击
		mag_attack = 16240,		--内功攻击
		phy_defense = 2030,		--外攻防御
		mag_defense = 2030,		--内攻防御
		crit = 254,		--会心
		mastery = 508,		--精通
		resist = 254,		--抵御
		hp_scale = 0,		--气血百分比加成
		total_damage = 15,		--总伤害百分比加成
	},
	{
		appearance = {83802,83820,83790,83778,83784,83796,83814,83826,83808,83772,88565,97924},		--外观id，分别对应少林、武当、华山、恒山、衡山、日月、五仙、逍遥、唐门、峨眉、独孤、武罗
		level = 6,		--等级
		hp = 32480,		--气血
		mp = 3000,		--内力
		phy_attack = 16240,		--外功攻击
		mag_attack = 16240,		--内功攻击
		phy_defense = 2030,		--外攻防御
		mag_defense = 2030,		--内攻防御
		crit = 254,		--会心
		mastery = 508,		--精通
		resist = 254,		--抵御
		hp_scale = 0,		--气血百分比加成
		total_damage = 15,		--总伤害百分比加成
	},
	{
		appearance = {95351,95354,95349,95347,95348,95350,95353,95355,95352,95346,95367,98572},		--外观id，分别对应少林、武当、华山、恒山、衡山、日月、五仙、逍遥、唐门、峨眉、独孤、武罗
		level = 7,		--等级
		hp = 38270,		--气血
		mp = 3000,		--内力
		phy_attack = 19140,		--外功攻击
		mag_attack = 19140,		--内功攻击
		phy_defense = 2390,		--外攻防御
		mag_defense = 2390,		--内攻防御
		crit = 299,		--会心
		mastery = 598,		--精通
		resist = 299,		--抵御
		hp_scale = 0,		--气血百分比加成
		total_damage = 15,		--总伤害百分比加成
	},
	{
		appearance = {95384,95387,95382,95380,95381,95383,95386,95388,95385,95379,95400,98573},		--外观id，分别对应少林、武当、华山、恒山、衡山、日月、五仙、逍遥、唐门、峨眉、独孤、武罗
		level = 8,		--等级
		hp = 38270,		--气血
		mp = 3000,		--内力
		phy_attack = 19140,		--外功攻击
		mag_attack = 19140,		--内功攻击
		phy_defense = 2390,		--外攻防御
		mag_defense = 2390,		--内攻防御
		crit = 299,		--会心
		mastery = 598,		--精通
		resist = 299,		--抵御
		hp_scale = 0,		--气血百分比加成
		total_damage = 15,		--总伤害百分比加成
	},
	{
		appearance = {95417,95420,95415,95413,95414,95416,95419,95421,95418,95412,95433,98574},		--外观id，分别对应少林、武当、华山、恒山、衡山、日月、五仙、逍遥、唐门、峨眉、独孤、武罗
		level = 9,		--等级
		hp = 44580,		--气血
		mp = 3000,		--内力
		phy_attack = 22290,		--外功攻击
		mag_attack = 22290,		--内功攻击
		phy_defense = 2790,		--外攻防御
		mag_defense = 2790,		--内攻防御
		crit = 348,		--会心
		mastery = 697,		--精通
		resist = 348,		--抵御
		hp_scale = 0,		--气血百分比加成
		total_damage = 15,		--总伤害百分比加成
	},
	{
		appearance = {83737,83755,83725,83713,83719,83731,83749,83761,83743,83707,88554,97925},		--外观id，分别对应少林、武当、华山、恒山、衡山、日月、五仙、逍遥、唐门、峨眉、独孤、武罗
		level = 10,		--等级
		hp = 44580,		--气血
		mp = 3000,		--内力
		phy_attack = 22290,		--外功攻击
		mag_attack = 22290,		--内功攻击
		phy_defense = 2790,		--外攻防御
		mag_defense = 2790,		--内攻防御
		crit = 348,		--会心
		mastery = 697,		--精通
		resist = 348,		--抵御
		hp_scale = 0,		--气血百分比加成
		total_damage = 15,		--总伤害百分比加成
	},
	{
		appearance = {83738,83756,83726,83714,83720,83732,83750,83762,83744,83708,88555,97926},		--外观id，分别对应少林、武当、华山、恒山、衡山、日月、五仙、逍遥、唐门、峨眉、独孤、武罗
		level = 11,		--等级
		hp = 51390,		--气血
		mp = 3000,		--内力
		phy_attack = 25700,		--外功攻击
		mag_attack = 25700,		--内功攻击
		phy_defense = 3210,		--外攻防御
		mag_defense = 3210,		--内攻防御
		crit = 402,		--会心
		mastery = 803,		--精通
		resist = 402,		--抵御
		hp_scale = 0,		--气血百分比加成
		total_damage = 15,		--总伤害百分比加成
	},
	{
		appearance = {83739,83757,83727,83715,83721,83733,83751,83763,83745,83709,88556,97927},		--外观id，分别对应少林、武当、华山、恒山、衡山、日月、五仙、逍遥、唐门、峨眉、独孤、武罗
		level = 12,		--等级
		hp = 51390,		--气血
		mp = 3000,		--内力
		phy_attack = 25700,		--外功攻击
		mag_attack = 25700,		--内功攻击
		phy_defense = 3210,		--外攻防御
		mag_defense = 3210,		--内攻防御
		crit = 402,		--会心
		mastery = 803,		--精通
		resist = 402,		--抵御
		hp_scale = 0,		--气血百分比加成
		total_damage = 15,		--总伤害百分比加成
	},
	{
		appearance = {83740,83758,83728,83716,83722,83734,83752,83764,83746,83710,88557,97928},		--外观id，分别对应少林、武当、华山、恒山、衡山、日月、五仙、逍遥、唐门、峨眉、独孤、武罗
		level = 13,		--等级
		hp = 58720,		--气血
		mp = 3000,		--内力
		phy_attack = 29360,		--外功攻击
		mag_attack = 29360,		--内功攻击
		phy_defense = 3670,		--外攻防御
		mag_defense = 3670,		--内攻防御
		crit = 459,		--会心
		mastery = 918,		--精通
		resist = 459,		--抵御
		hp_scale = 0,		--气血百分比加成
		total_damage = 15,		--总伤害百分比加成
	},
	{
		appearance = {83741,83759,83729,83717,83723,83735,83753,83765,83747,83711,88558,97929},		--外观id，分别对应少林、武当、华山、恒山、衡山、日月、五仙、逍遥、唐门、峨眉、独孤、武罗
		level = 14,		--等级
		hp = 58720,		--气血
		mp = 3000,		--内力
		phy_attack = 29360,		--外功攻击
		mag_attack = 29360,		--内功攻击
		phy_defense = 3670,		--外攻防御
		mag_defense = 3670,		--内攻防御
		crit = 459,		--会心
		mastery = 918,		--精通
		resist = 459,		--抵御
		hp_scale = 0,		--气血百分比加成
		total_damage = 15,		--总伤害百分比加成
	},
	{
		appearance = {83742,83760,83730,83718,83724,83736,83754,83766,83748,83712,88559,97930},		--外观id，分别对应少林、武当、华山、恒山、衡山、日月、五仙、逍遥、唐门、峨眉、独孤、武罗
		level = 15,		--等级
		hp = 66560,		--气血
		mp = 3000,		--内力
		phy_attack = 33280,		--外功攻击
		mag_attack = 33280,		--内功攻击
		phy_defense = 4160,		--外攻防御
		mag_defense = 4160,		--内攻防御
		crit = 520,		--会心
		mastery = 1040,		--精通
		resist = 520,		--抵御
		hp_scale = 0,		--气血百分比加成
		total_damage = 15,		--总伤害百分比加成
	},
	{
		appearance = {95341,95344,95339,95337,95338,95340,95343,95345,95342,95336,95366,98575},		--外观id，分别对应少林、武当、华山、恒山、衡山、日月、五仙、逍遥、唐门、峨眉、独孤、武罗
		level = 16,		--等级
		hp = 66560,		--气血
		mp = 3000,		--内力
		phy_attack = 33280,		--外功攻击
		mag_attack = 33280,		--内功攻击
		phy_defense = 4160,		--外攻防御
		mag_defense = 4160,		--内攻防御
		crit = 520,		--会心
		mastery = 1040,		--精通
		resist = 520,		--抵御
		hp_scale = 0,		--气血百分比加成
		total_damage = 15,		--总伤害百分比加成
	},
	{
		appearance = {95374,95377,95372,95370,95371,95373,95376,95378,95375,95369,95399,98576},		--外观id，分别对应少林、武当、华山、恒山、衡山、日月、五仙、逍遥、唐门、峨眉、独孤、武罗
		level = 17,		--等级
		hp = 74910,		--气血
		mp = 3000,		--内力
		phy_attack = 37460,		--外功攻击
		mag_attack = 37460,		--内功攻击
		phy_defense = 4680,		--外攻防御
		mag_defense = 4680,		--内攻防御
		crit = 585,		--会心
		mastery = 1171,		--精通
		resist = 585,		--抵御
		hp_scale = 0,		--气血百分比加成
		total_damage = 15,		--总伤害百分比加成
	},
	{
		appearance = {95407,95410,95405,95403,95404,95406,95409,95411,95408,95402,95432,98577},		--外观id，分别对应少林、武当、华山、恒山、衡山、日月、五仙、逍遥、唐门、峨眉、独孤、武罗
		level = 18,		--等级
		hp = 74910,		--气血
		mp = 3000,		--内力
		phy_attack = 37460,		--外功攻击
		mag_attack = 37460,		--内功攻击
		phy_defense = 4680,		--外攻防御
		mag_defense = 4680,		--内攻防御
		crit = 585,		--会心
		mastery = 1171,		--精通
		resist = 585,		--抵御
		hp_scale = 0,		--气血百分比加成
		total_damage = 15,		--总伤害百分比加成
	},
	{
		appearance = {88509,88527,88464,88491,88497,88503,88521,88533,88515,88485,88566,97931},		--外观id，分别对应少林、武当、华山、恒山、衡山、日月、五仙、逍遥、唐门、峨眉、独孤、武罗
		level = 19,		--等级
		hp = 83780,		--气血
		mp = 3000,		--内力
		phy_attack = 41890,		--外功攻击
		mag_attack = 41890,		--内功攻击
		phy_defense = 5240,		--外攻防御
		mag_defense = 5240,		--内攻防御
		crit = 655,		--会心
		mastery = 1309,		--精通
		resist = 655,		--抵御
		hp_scale = 0,		--气血百分比加成
		total_damage = 15,		--总伤害百分比加成
	},
	{
		appearance = {88510,88528,88465,88492,88498,88504,88522,88534,88516,88486,88567,97932},		--外观id，分别对应少林、武当、华山、恒山、衡山、日月、五仙、逍遥、唐门、峨眉、独孤、武罗
		level = 20,		--等级
		hp = 83780,		--气血
		mp = 3000,		--内力
		phy_attack = 41890,		--外功攻击
		mag_attack = 41890,		--内功攻击
		phy_defense = 5240,		--外攻防御
		mag_defense = 5240,		--内攻防御
		crit = 655,		--会心
		mastery = 1309,		--精通
		resist = 655,		--抵御
		hp_scale = 0,		--气血百分比加成
		total_damage = 15,		--总伤害百分比加成
	},
	{
		appearance = {88511,88529,88466,88493,88499,88505,88523,88535,88517,88487,88568,97933},		--外观id，分别对应少林、武当、华山、恒山、衡山、日月、五仙、逍遥、唐门、峨眉、独孤、武罗
		level = 21,		--等级
		hp = 93150,		--气血
		mp = 3000,		--内力
		phy_attack = 46580,		--外功攻击
		mag_attack = 46580,		--内功攻击
		phy_defense = 5820,		--外攻防御
		mag_defense = 5820,		--内攻防御
		crit = 728,		--会心
		mastery = 1456,		--精通
		resist = 728,		--抵御
		hp_scale = 0,		--气血百分比加成
		total_damage = 15,		--总伤害百分比加成
	},
	{
		appearance = {88512,88530,88467,88494,88500,88506,88524,88536,88518,88488,88569,97934},		--外观id，分别对应少林、武当、华山、恒山、衡山、日月、五仙、逍遥、唐门、峨眉、独孤、武罗
		level = 22,		--等级
		hp = 93150,		--气血
		mp = 3000,		--内力
		phy_attack = 46580,		--外功攻击
		mag_attack = 46580,		--内功攻击
		phy_defense = 5820,		--外攻防御
		mag_defense = 5820,		--内攻防御
		crit = 728,		--会心
		mastery = 1456,		--精通
		resist = 728,		--抵御
		hp_scale = 0,		--气血百分比加成
		total_damage = 15,		--总伤害百分比加成
	},
	{
		appearance = {88513,88531,88468,88495,88501,88507,88525,88537,88519,88489,88570,97935},		--外观id，分别对应少林、武当、华山、恒山、衡山、日月、五仙、逍遥、唐门、峨眉、独孤、武罗
		level = 23,		--等级
		hp = 103040,		--气血
		mp = 3000,		--内力
		phy_attack = 51520,		--外功攻击
		mag_attack = 51520,		--内功攻击
		phy_defense = 6440,		--外攻防御
		mag_defense = 6440,		--内攻防御
		crit = 805,		--会心
		mastery = 1610,		--精通
		resist = 805,		--抵御
		hp_scale = 0,		--气血百分比加成
		total_damage = 15,		--总伤害百分比加成
	},
	{
		appearance = {88514,88532,88469,88496,88502,88508,88526,88538,88520,88490,88571,97936},		--外观id，分别对应少林、武当、华山、恒山、衡山、日月、五仙、逍遥、唐门、峨眉、独孤、武罗
		level = 24,		--等级
		hp = 103040,		--气血
		mp = 3000,		--内力
		phy_attack = 51520,		--外功攻击
		mag_attack = 51520,		--内功攻击
		phy_defense = 6440,		--外攻防御
		mag_defense = 6440,		--内攻防御
		crit = 805,		--会心
		mastery = 1610,		--精通
		resist = 805,		--抵御
		hp_scale = 0,		--气血百分比加成
		total_damage = 15,		--总伤害百分比加成
	},
	{
		appearance = {95361,95364,95356,95358,95359,95360,95363,95365,95362,95357,95368,98578},		--外观id，分别对应少林、武当、华山、恒山、衡山、日月、五仙、逍遥、唐门、峨眉、独孤、武罗
		level = 25,		--等级
		hp = 113440,		--气血
		mp = 3000,		--内力
		phy_attack = 56720,		--外功攻击
		mag_attack = 56720,		--内功攻击
		phy_defense = 7090,		--外攻防御
		mag_defense = 7090,		--内攻防御
		crit = 886,		--会心
		mastery = 1773,		--精通
		resist = 886,		--抵御
		hp_scale = 0,		--气血百分比加成
		total_damage = 15,		--总伤害百分比加成
	},
	{
		appearance = {95394,95397,95389,95391,95392,95393,95396,95398,95395,95390,95401,98579},		--外观id，分别对应少林、武当、华山、恒山、衡山、日月、五仙、逍遥、唐门、峨眉、独孤、武罗
		level = 26,		--等级
		hp = 113440,		--气血
		mp = 3000,		--内力
		phy_attack = 56720,		--外功攻击
		mag_attack = 56720,		--内功攻击
		phy_defense = 7090,		--外攻防御
		mag_defense = 7090,		--内攻防御
		crit = 886,		--会心
		mastery = 1773,		--精通
		resist = 886,		--抵御
		hp_scale = 0,		--气血百分比加成
		total_damage = 15,		--总伤害百分比加成
	},
	{
		appearance = {95427,95430,95422,95424,95425,95426,95429,95431,95428,95423,95434,98580},		--外观id，分别对应少林、武当、华山、恒山、衡山、日月、五仙、逍遥、唐门、峨眉、独孤、武罗
		level = 27,		--等级
		hp = 124350,		--气血
		mp = 3000,		--内力
		phy_attack = 62180,		--外功攻击
		mag_attack = 62180,		--内功攻击
		phy_defense = 7770,		--外攻防御
		mag_defense = 7770,		--内攻防御
		crit = 972,		--会心
		mastery = 1943,		--精通
		resist = 972,		--抵御
		hp_scale = 0,		--气血百分比加成
		total_damage = 15,		--总伤害百分比加成
	},
}

EscapeKillProperty[2] = {           --2：防具tid，对应escape_kill.lua的weapon，同时修改
	{
		name = {"清虚装备+1"}, 		 --名字
		level = 1,		--等级
		hp = 89600,		--气血
		mp = 7000,		--内力
		phy_attack = 2800,		--外功攻击
		mag_attack = 2800,		--内功攻击
		phy_defense = 5600,		--外攻防御
		mag_defense = 5600,		--内攻防御
		crit = 175,		--会心
		mastery = 350,		--精通
		resist = 175,		--抵御
		hp_scale = 0,		--气血百分比加成
		total_damage = 10,		--总伤害百分比加成
	},
	{
		name = {"清虚装备+2"}, 		 --名字
		level = 2,		--等级
		hp = 89600,		--气血
		mp = 7000,		--内力
		phy_attack = 2800,		--外功攻击
		mag_attack = 2800,		--内功攻击
		phy_defense = 5600,		--外攻防御
		mag_defense = 5600,		--内攻防御
		crit = 175,		--会心
		mastery = 350,		--精通
		resist = 175,		--抵御
		hp_scale = 0,		--气血百分比加成
		total_damage = 10,		--总伤害百分比加成
	},
	{
		name = {"清虚装备+3"}, 		 --名字
		level = 3,		--等级
		hp = 101500,		--气血
		mp = 7000,		--内力
		phy_attack = 3170,		--外功攻击
		mag_attack = 3170,		--内功攻击
		phy_defense = 6340,		--外攻防御
		mag_defense = 6340,		--内攻防御
		crit = 198,		--会心
		mastery = 397,		--精通
		resist = 198,		--抵御
		hp_scale = 0,		--气血百分比加成
		total_damage = 10,		--总伤害百分比加成
	},
	{
		name = {"清虚装备+4"}, 		 --名字
		level = 4,		--等级
		hp = 101500,		--气血
		mp = 7000,		--内力
		phy_attack = 3170,		--外功攻击
		mag_attack = 3170,		--内功攻击
		phy_defense = 6340,		--外攻防御
		mag_defense = 6340,		--内攻防御
		crit = 198,		--会心
		mastery = 397,		--精通
		resist = 198,		--抵御
		hp_scale = 0,		--气血百分比加成
		total_damage = 10,		--总伤害百分比加成
	},
	{
		name = {"清虚装备+5"}, 		 --名字
		level = 5,		--等级
		hp = 114560,		--气血
		mp = 7000,		--内力
		phy_attack = 3580,		--外功攻击
		mag_attack = 3580,		--内功攻击
		phy_defense = 7160,		--外攻防御
		mag_defense = 7160,		--内攻防御
		crit = 224,		--会心
		mastery = 448,		--精通
		resist = 224,		--抵御
		hp_scale = 0,		--气血百分比加成
		total_damage = 10,		--总伤害百分比加成
	},
	{
		name = {"清虚装备+6"}, 		 --名字
		level = 6,		--等级
		hp = 114560,		--气血
		mp = 7000,		--内力
		phy_attack = 3580,		--外功攻击
		mag_attack = 3580,		--内功攻击
		phy_defense = 7160,		--外攻防御
		mag_defense = 7160,		--内攻防御
		crit = 224,		--会心
		mastery = 448,		--精通
		resist = 224,		--抵御
		hp_scale = 0,		--气血百分比加成
		total_damage = 10,		--总伤害百分比加成
	},
	{
		name = {"清虚装备+7"}, 		 --名字
		level = 7,		--等级
		hp = 128900,		--气血
		mp = 7000,		--内力
		phy_attack = 4030,		--外功攻击
		mag_attack = 4030,		--内功攻击
		phy_defense = 8060,		--外攻防御
		mag_defense = 8060,		--内攻防御
		crit = 252,		--会心
		mastery = 504,		--精通
		resist = 252,		--抵御
		hp_scale = 0,		--气血百分比加成
		total_damage = 10,		--总伤害百分比加成
	},
	{
		name = {"清虚装备+8"}, 		 --名字
		level = 8,		--等级
		hp = 128900,		--气血
		mp = 7000,		--内力
		phy_attack = 4030,		--外功攻击
		mag_attack = 4030,		--内功攻击
		phy_defense = 8060,		--外攻防御
		mag_defense = 8060,		--内攻防御
		crit = 252,		--会心
		mastery = 504,		--精通
		resist = 252,		--抵御
		hp_scale = 0,		--气血百分比加成
		total_damage = 10,		--总伤害百分比加成
	},
	{
		name = {"清虚装备+9"}, 		 --名字
		level = 9,		--等级
		hp = 144510,		--气血
		mp = 7000,		--内力
		phy_attack = 4520,		--外功攻击
		mag_attack = 4520,		--内功攻击
		phy_defense = 9030,		--外攻防御
		mag_defense = 9030,		--内攻防御
		crit = 282,		--会心
		mastery = 565,		--精通
		resist = 282,		--抵御
		hp_scale = 0,		--气血百分比加成
		total_damage = 10,		--总伤害百分比加成
	},
	{
		name = {"清虚装备+10"}, 		 --名字
		level = 10,		--等级
		hp = 144510,		--气血
		mp = 7000,		--内力
		phy_attack = 4520,		--外功攻击
		mag_attack = 4520,		--内功攻击
		phy_defense = 9030,		--外攻防御
		mag_defense = 9030,		--内攻防御
		crit = 282,		--会心
		mastery = 565,		--精通
		resist = 282,		--抵御
		hp_scale = 0,		--气血百分比加成
		total_damage = 10,		--总伤害百分比加成
	},
	{
		name = {"清虚装备+11"}, 		 --名字
		level = 11,		--等级
		hp = 161410,		--气血
		mp = 7000,		--内力
		phy_attack = 5040,		--外功攻击
		mag_attack = 5040,		--内功攻击
		phy_defense = 10090,		--外攻防御
		mag_defense = 10090,		--内攻防御
		crit = 315,		--会心
		mastery = 631,		--精通
		resist = 315,		--抵御
		hp_scale = 0,		--气血百分比加成
		total_damage = 10,		--总伤害百分比加成
	},
	{
		name = {"清虚装备+12"}, 		 --名字
		level = 12,		--等级
		hp = 161410,		--气血
		mp = 7000,		--内力
		phy_attack = 5040,		--外功攻击
		mag_attack = 5040,		--内功攻击
		phy_defense = 10090,		--外攻防御
		mag_defense = 10090,		--内攻防御
		crit = 315,		--会心
		mastery = 631,		--精通
		resist = 315,		--抵御
		hp_scale = 0,		--气血百分比加成
		total_damage = 10,		--总伤害百分比加成
	},
	{
		name = {"清虚装备+13"}, 		 --名字
		level = 13,		--等级
		hp = 179580,		--气血
		mp = 7000,		--内力
		phy_attack = 5610,		--外功攻击
		mag_attack = 5610,		--内功攻击
		phy_defense = 11220,		--外攻防御
		mag_defense = 11220,		--内攻防御
		crit = 351,		--会心
		mastery = 702,		--精通
		resist = 351,		--抵御
		hp_scale = 0,		--气血百分比加成
		total_damage = 10,		--总伤害百分比加成
	},
	{
		name = {"清虚装备+14"}, 		 --名字
		level = 14,		--等级
		hp = 179580,		--气血
		mp = 7000,		--内力
		phy_attack = 5610,		--外功攻击
		mag_attack = 5610,		--内功攻击
		phy_defense = 11220,		--外攻防御
		mag_defense = 11220,		--内攻防御
		crit = 351,		--会心
		mastery = 702,		--精通
		resist = 351,		--抵御
		hp_scale = 0,		--气血百分比加成
		total_damage = 10,		--总伤害百分比加成
	},
	{
		name = {"清虚装备+15"}, 		 --名字
		level = 15,		--等级
		hp = 199040,		--气血
		mp = 7000,		--内力
		phy_attack = 6220,		--外功攻击
		mag_attack = 6220,		--内功攻击
		phy_defense = 12440,		--外攻防御
		mag_defense = 12440,		--内攻防御
		crit = 389,		--会心
		mastery = 778,		--精通
		resist = 389,		--抵御
		hp_scale = 0,		--气血百分比加成
		total_damage = 10,		--总伤害百分比加成
	},
	{
		name = {"清虚装备+16"}, 		 --名字
		level = 16,		--等级
		hp = 199040,		--气血
		mp = 7000,		--内力
		phy_attack = 6220,		--外功攻击
		mag_attack = 6220,		--内功攻击
		phy_defense = 12440,		--外攻防御
		mag_defense = 12440,		--内攻防御
		crit = 389,		--会心
		mastery = 778,		--精通
		resist = 389,		--抵御
		hp_scale = 0,		--气血百分比加成
		total_damage = 10,		--总伤害百分比加成
	},
	{
		name = {"清虚装备+17"}, 		 --名字
		level = 17,		--等级
		hp = 219780,		--气血
		mp = 7000,		--内力
		phy_attack = 6870,		--外功攻击
		mag_attack = 6870,		--内功攻击
		phy_defense = 13740,		--外攻防御
		mag_defense = 13740,		--内攻防御
		crit = 429,		--会心
		mastery = 859,		--精通
		resist = 429,		--抵御
		hp_scale = 0,		--气血百分比加成
		total_damage = 10,		--总伤害百分比加成
	},
	{
		name = {"清虚装备+18"}, 		 --名字
		level = 18,		--等级
		hp = 219780,		--气血
		mp = 7000,		--内力
		phy_attack = 6870,		--外功攻击
		mag_attack = 6870,		--内功攻击
		phy_defense = 13740,		--外攻防御
		mag_defense = 13740,		--内攻防御
		crit = 429,		--会心
		mastery = 859,		--精通
		resist = 429,		--抵御
		hp_scale = 0,		--气血百分比加成
		total_damage = 10,		--总伤害百分比加成
	},
	{
		name = {"清虚装备+19"}, 		 --名字
		level = 19,		--等级
		hp = 241790,		--气血
		mp = 7000,		--内力
		phy_attack = 7560,		--外功攻击
		mag_attack = 7560,		--内功攻击
		phy_defense = 15110,		--外攻防御
		mag_defense = 15110,		--内攻防御
		crit = 472,		--会心
		mastery = 945,		--精通
		resist = 472,		--抵御
		hp_scale = 0,		--气血百分比加成
		total_damage = 10,		--总伤害百分比加成
	},
	{
		name = {"清虚装备+20"}, 		 --名字
		level = 20,		--等级
		hp = 241790,		--气血
		mp = 7000,		--内力
		phy_attack = 7560,		--外功攻击
		mag_attack = 7560,		--内功攻击
		phy_defense = 15110,		--外攻防御
		mag_defense = 15110,		--内攻防御
		crit = 472,		--会心
		mastery = 945,		--精通
		resist = 472,		--抵御
		hp_scale = 0,		--气血百分比加成
		total_damage = 10,		--总伤害百分比加成
	},
	{
		name = {"清虚装备+21"}, 		 --名字
		level = 21,		--等级
		hp = 265090,		--气血
		mp = 7000,		--内力
		phy_attack = 8280,		--外功攻击
		mag_attack = 8280,		--内功攻击
		phy_defense = 16570,		--外攻防御
		mag_defense = 16570,		--内攻防御
		crit = 518,		--会心
		mastery = 1036,		--精通
		resist = 518,		--抵御
		hp_scale = 0,		--气血百分比加成
		total_damage = 10,		--总伤害百分比加成
	},
	{
		name = {"清虚装备+22"}, 		 --名字
		level = 22,		--等级
		hp = 265090,		--气血
		mp = 7000,		--内力
		phy_attack = 8280,		--外功攻击
		mag_attack = 8280,		--内功攻击
		phy_defense = 16570,		--外攻防御
		mag_defense = 16570,		--内攻防御
		crit = 518,		--会心
		mastery = 1036,		--精通
		resist = 518,		--抵御
		hp_scale = 0,		--气血百分比加成
		total_damage = 10,		--总伤害百分比加成
	},
	{
		name = {"清虚装备+23"}, 		 --名字
		level = 23,		--等级
		hp = 289660,		--气血
		mp = 7000,		--内力
		phy_attack = 9050,		--外功攻击
		mag_attack = 9050,		--内功攻击
		phy_defense = 18100,		--外攻防御
		mag_defense = 18100,		--内攻防御
		crit = 566,		--会心
		mastery = 1132,		--精通
		resist = 566,		--抵御
		hp_scale = 0,		--气血百分比加成
		total_damage = 10,		--总伤害百分比加成
	},
	{
		name = {"清虚装备+24"}, 		 --名字
		level = 24,		--等级
		hp = 289660,		--气血
		mp = 7000,		--内力
		phy_attack = 9050,		--外功攻击
		mag_attack = 9050,		--内功攻击
		phy_defense = 18100,		--外攻防御
		mag_defense = 18100,		--内攻防御
		crit = 566,		--会心
		mastery = 1132,		--精通
		resist = 566,		--抵御
		hp_scale = 0,		--气血百分比加成
		total_damage = 10,		--总伤害百分比加成
	},
	{
		name = {"清虚装备+25"}, 		 --名字
		level = 25,		--等级
		hp = 315520,		--气血
		mp = 7000,		--内力
		phy_attack = 9860,		--外功攻击
		mag_attack = 9860,		--内功攻击
		phy_defense = 19720,		--外攻防御
		mag_defense = 19720,		--内攻防御
		crit = 616,		--会心
		mastery = 1233,		--精通
		resist = 616,		--抵御
		hp_scale = 0,		--气血百分比加成
		total_damage = 10,		--总伤害百分比加成
	},
	{
		name = {"清虚装备+26"}, 		 --名字
		level = 26,		--等级
		hp = 315520,		--气血
		mp = 7000,		--内力
		phy_attack = 9860,		--外功攻击
		mag_attack = 9860,		--内功攻击
		phy_defense = 19720,		--外攻防御
		mag_defense = 19720,		--内攻防御
		crit = 616,		--会心
		mastery = 1233,		--精通
		resist = 616,		--抵御
		hp_scale = 0,		--气血百分比加成
		total_damage = 10,		--总伤害百分比加成
	},
	{
		name = {"清虚装备+27"}, 		 --名字
		level = 27,		--等级
		hp = 342660,		--气血
		mp = 7000,		--内力
		phy_attack = 10710,		--外功攻击
		mag_attack = 10710,		--内功攻击
		phy_defense = 21420,		--外攻防御
		mag_defense = 21420,		--内攻防御
		crit = 669,		--会心
		mastery = 1339,		--精通
		resist = 669,		--抵御
		hp_scale = 0,		--气血百分比加成
		total_damage = 10,		--总伤害百分比加成
	},
	{
		name = {"清虚装备+28"}, 		 --名字
		level = 28,		--等级
		hp = 342660,		--气血
		mp = 7000,		--内力
		phy_attack = 10710,		--外功攻击
		mag_attack = 10710,		--内功攻击
		phy_defense = 21420,		--外攻防御
		mag_defense = 21420,		--内攻防御
		crit = 669,		--会心
		mastery = 1339,		--精通
		resist = 669,		--抵御
		hp_scale = 0,		--气血百分比加成
		total_damage = 10,		--总伤害百分比加成
	},
	{
		name = {"清虚装备+29"}, 		 --名字
		level = 29,		--等级
		hp = 400770,		--气血
		mp = 7000,		--内力
		phy_attack = 12520,		--外功攻击
		mag_attack = 12520,		--内功攻击
		phy_defense = 25050,		--外攻防御
		mag_defense = 25050,		--内攻防御
		crit = 783,		--会心
		mastery = 1566,		--精通
		resist = 783,		--抵御
		hp_scale = 0,		--气血百分比加成
		total_damage = 10,		--总伤害百分比加成
	},
	{
		name = {"清虚装备+30"}, 		 --名字
		level = 30,		--等级
		hp = 400770,		--气血
		mp = 7000,		--内力
		phy_attack = 12520,		--外功攻击
		mag_attack = 12520,		--内功攻击
		phy_defense = 25050,		--外攻防御
		mag_defense = 25050,		--内攻防御
		crit = 783,		--会心
		mastery = 1566,		--精通
		resist = 783,		--抵御
		hp_scale = 0,		--气血百分比加成
		total_damage = 10,		--总伤害百分比加成
	},
	{
		name = {"清虚装备+31"}, 		 --名字
		level = 31,		--等级
		hp = 431740,		--气血
		mp = 7000,		--内力
		phy_attack = 13490,		--外功攻击
		mag_attack = 13490,		--内功攻击
		phy_defense = 26980,		--外攻防御
		mag_defense = 26980,		--内攻防御
		crit = 843,		--会心
		mastery = 1687,		--精通
		resist = 843,		--抵御
		hp_scale = 0,		--气血百分比加成
		total_damage = 10,		--总伤害百分比加成
	},
	{
		name = {"清虚装备+32"}, 		 --名字
		level = 32,		--等级
		hp = 431740,		--气血
		mp = 7000,		--内力
		phy_attack = 13490,		--外功攻击
		mag_attack = 13490,		--内功攻击
		phy_defense = 26980,		--外攻防御
		mag_defense = 26980,		--内攻防御
		crit = 843,		--会心
		mastery = 1687,		--精通
		resist = 843,		--抵御
		hp_scale = 0,		--气血百分比加成
		total_damage = 10,		--总伤害百分比加成
	},
	{
		name = {"清虚装备+33"}, 		 --名字
		level = 33,		--等级
		hp = 464000,		--气血
		mp = 7000,		--内力
		phy_attack = 14500,		--外功攻击
		mag_attack = 14500,		--内功攻击
		phy_defense = 29000,		--外攻防御
		mag_defense = 29000,		--内攻防御
		crit = 906,		--会心
		mastery = 1813,		--精通
		resist = 906,		--抵御
		hp_scale = 0,		--气血百分比加成
		total_damage = 10,		--总伤害百分比加成
	},
	{
		name = {"清虚装备+34"}, 		 --名字
		level = 34,		--等级
		hp = 464000,		--气血
		mp = 7000,		--内力
		phy_attack = 14500,		--外功攻击
		mag_attack = 14500,		--内功攻击
		phy_defense = 29000,		--外攻防御
		mag_defense = 29000,		--内攻防御
		crit = 906,		--会心
		mastery = 1813,		--精通
		resist = 906,		--抵御
		hp_scale = 0,		--气血百分比加成
		total_damage = 10,		--总伤害百分比加成
	},
	{
		name = {"清虚装备+35"}, 		 --名字
		level = 35,		--等级
		hp = 499200,		--气血
		mp = 7000,		--内力
		phy_attack = 15600,		--外功攻击
		mag_attack = 15600,		--内功攻击
		phy_defense = 31200,		--外攻防御
		mag_defense = 31200,		--内攻防御
		crit = 975,		--会心
		mastery = 1950,		--精通
		resist = 975,		--抵御
		hp_scale = 0,		--气血百分比加成
		total_damage = 10,		--总伤害百分比加成
	},
	{
		name = {"清虚装备+36"}, 		 --名字
		level = 36,		--等级
		hp = 499200,		--气血
		mp = 7000,		--内力
		phy_attack = 15600,		--外功攻击
		mag_attack = 15600,		--内功攻击
		phy_defense = 31200,		--外攻防御
		mag_defense = 31200,		--内攻防御
		crit = 975,		--会心
		mastery = 1950,		--精通
		resist = 975,		--抵御
		hp_scale = 0,		--气血百分比加成
		total_damage = 10,		--总伤害百分比加成
	},
}

function EscapeKillProperty:GetBaseProperty(tid)
	local ret_table = {}
	ret_table[#ret_table + 1] = EscapeKillProperty.Base.defense;
	ret_table[#ret_table + 1] = EscapeKillProperty.Base.defense_gen;
	ret_table[#ret_table + 1] = EscapeKillProperty.Base.strength;
	ret_table[#ret_table + 1] = EscapeKillProperty.Base.strength_gen;
	ret_table[#ret_table + 1] = EscapeKillProperty.Base.crit_damage;
	ret_table[#ret_table + 1] = EscapeKillProperty.Base.normal_attack_sight;
	ret_table[#ret_table + 1] = EscapeKillProperty.Base.valid_attack_sight;
	ret_table[#ret_table + 1] = EscapeKillProperty.Base.heal_factor;
	return unpack(ret_table);
end
function EscapeKillProperty:GetEquipProperty(tid)
	if EscapeKillProperty[tid] == nil then
		return nil
	end

	local ret_table = {}
	ret_table[#ret_table + 1] = #EscapeKillProperty[tid];
	for k, v in pairs (EscapeKillProperty[tid]) do
		ret_table[#ret_table + 1] = v.level
		ret_table[#ret_table + 1] = v.hp
		ret_table[#ret_table + 1] = v.mp
		ret_table[#ret_table + 1] = v.phy_attack
		ret_table[#ret_table + 1] = v.mag_attack
		ret_table[#ret_table + 1] = v.phy_defense
		ret_table[#ret_table + 1] = v.mag_defense
		ret_table[#ret_table + 1] = v.crit
		ret_table[#ret_table + 1] = v.mastery
		ret_table[#ret_table + 1] = v.resist
		ret_table[#ret_table + 1] = v.hp_scale
		ret_table[#ret_table + 1] = v.total_damage
	end
	return unpack(ret_table)
end


-- 客户端接口
function EscapeKillProperty:GetWeaponAppearance(tid)
	if EscapeKillProperty[tid] == nil then
		return nil
	end

	local ret_table = {}
	for k, v in pairs (EscapeKillProperty[tid]) do
		ret_table[#ret_table + 1] = v.appearance[1]
		ret_table[#ret_table + 1] = v.appearance[2]
		ret_table[#ret_table + 1] = v.appearance[3]
		ret_table[#ret_table + 1] = v.appearance[4]
		ret_table[#ret_table + 1] = v.appearance[5]
		ret_table[#ret_table + 1] = v.appearance[6]
		ret_table[#ret_table + 1] = v.appearance[7]
		ret_table[#ret_table + 1] = v.appearance[8]
		ret_table[#ret_table + 1] = v.appearance[9]
		ret_table[#ret_table + 1] = v.appearance[10]
		ret_table[#ret_table + 1] = v.appearance[11]
		ret_table[#ret_table + 1] = v.appearance[12]
	end
	return unpack(ret_table)
end

function EscapeKillProperty:GetArmourName(tid)
	if EscapeKillProperty[tid] == nil then
		return nil
	end

	local ret_table = {}
	for k, v in pairs (EscapeKillProperty[tid]) do
		ret_table[#ret_table + 1] = v.name[1]
	end
	return unpack(ret_table)
end

function EscapeKillProperty:GetArmourIconId()
	local ret_table = {}
	ret_table[#ret_table + 1] = EscapeKillProperty.Base.armour_icon_id;
	return unpack(ret_table);
end