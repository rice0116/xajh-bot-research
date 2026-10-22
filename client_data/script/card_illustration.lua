
------------------卡牌图鉴相关-------------------

CardInfo = {}

---品质

CardInfo.CARD_QUALITY_TYPE = {}
CardInfo.CARD_QUALITY_TYPE.WUXIA			= 1			--黄（无暇）
CardInfo.CARD_QUALITY_TYPE.CHUCHEN 		= 2			--玄（出尘）
CardInfo.CARD_QUALITY_TYPE.JUEFAN 		= 3			--地（绝凡）
CardInfo.CARD_QUALITY_TYPE.JINGHONG		= 4 		--天（惊鸿）



CardInfo.CARD_ILLUSTRATION_INFO = 
{	
		--天（惊鸿）
	{
  204,	
  12,
  13,
  202,
  25,
  26,
  38,
  39,
  203,
  51,
  52,
  65,
  78,
	},
	--地（绝凡）
	{
8,
9,
10,
11,
23,
24,
22,
36,
37,
49,
50,
61,
62,
63,
64,
74,
75,
76,
77,
48,
35,
166,
21,
34,
47,
101,
126,
139,
140,
154,
155,
167,
168,
169,
170,
171,
172,
176,
177,
178,
179,
180,
185,
198,
	},
	--玄（出尘）
	{
5,
6,
7,
18,
19,
20,
31,
32,
33,
45,
59,
60,
73,
44,
46,
57,
71,
72,
58,
70,
141,
142,
143,
105,
173,
174,
175,
123,
124,
125,
128,
129,
145,
146,
147,
181,
182,
183,
184,
186,
187,
188,
189,
194,
195,
196,
197,
199,
200,
201,
	},
	--黄（无暇）
	{
1,
2,
3,
4,
14,
15,
16,
17,
27,
29,
28,
30,
40,
41,
102,
103,
104,
156,
161,
157,
162,
158,
163,
159,
164,
160,
165,
42,
43,
53,
54,
55,
56,
66,
67,
68,
69,
127,
144,
190,
191,
192,
193,
	},	
	
}


--具体图鉴信息配置
CardInfo.CARD_ILLUSTRATION =
{
	[1] = {type = 0, icon = 23776, name = "杂货摊位", pos = 1},
	[2] = {type = 0, icon = 23750, name = "箫", pos = 1},
	[3] = {type = 0, icon = 23752, name = "信", pos = 1},
	[4] = {type = 0, icon = 23754, name = "玉佩", pos = 1},	
	[14] = {type = 0, icon = 23756, name = "毛笔", pos = 2},
	[15] = {type = 0, icon = 23790, name = "布衣", pos = 2},
	[16] = {type = 0, icon = 23775, name = "袈裟", pos = 2},
	[17] = {type = 0, icon = 23791, name = "酒壶", pos = 2},
	[27] = {type = 0, icon = 23778, name = "百鬼夜行", pos = 3},
	[29] = {type = 0, icon = 23763, name = "皇陵迷宫", pos = 3},
	[28] = {type = 0, icon = 23761, name = "护送飞龙令", pos = 3},
	[30] = {type = 0, icon = 23764, name = "突袭贼首", pos = 3},
	[40] = {type = 0, icon = 23765, name = "绝情谷禁地", pos = 4},
	[41] = {type = 0, icon = 23751, name = "郊外酒肆", pos = 4},
	[102] = {type = 0, icon = 23983, name = "武林-嗜酒魔僧", pos = 1},
	[103] = {type = 0, icon = 23982, name = "武林-玉面飞龙", pos = 2},
	[104] = {type = 0, icon = 23980, name = "武林-黄泉引路", pos = 3},
	[156] = {type = 0, icon = 23780, name = "万花飘零", pos = 1},
	[161] = {type = 0, icon = 23782, name = "爪间地狱", pos = 1},
	[157] = {type = 0, icon = 23785, name = "逍遥御天", pos = 2},
	[162] = {type = 0, icon = 23787, name = "先天八卦", pos = 2},
	[158] = {type = 0, icon = 23788, name = "腐骨穿心", pos = 3},
	[163] = {type = 0, icon = 23784, name = "剑斩谪仙", pos = 3},
	[159] = {type = 0, icon = 23779, name = "飘雪穿云", pos = 4},
	[164] = {type = 0, icon = 23786, name = "摩诃无量", pos = 4},
	[160] = {type = 0, icon = 23783, name = "不动明王", pos = 5},
	[165] = {type = 0, icon = 23781, name = "南岳五神", pos = 5},
	[42] = {type = 0, icon = 23974, name = "五仙鞭索", pos = 4},
	[43] = {type = 0, icon = 23961, name = "唐门拳刃", pos = 4},
	[53] = {type = 0, icon = 23962, name = "逍遥扇子", pos = 5},
	[54] = {type = 0, icon = 23970, name = "恒山双剑", pos = 5},
	[55] = {type = 0, icon = 23965, name = "日月双刃", pos = 5},
	[56] = {type = 0, icon = 23966, name = "峨眉禅杖", pos = 5},
	[66] = {type = 0, icon = 23968, name = "华山单剑", pos = 6},
	[67] = {type = 0, icon = 23969, name = "少林金棍", pos = 6},
	[68] = {type = 0, icon = 23967, name = "衡山琴剑", pos = 6},
	[69] = {type = 0, icon = 23978, name = "武当重剑", pos = 6},
	[127] = {type = 0, icon = 25408, name = "绿竹翁", pos = 4},
	[144] = {type = 0, icon = 25891, name = "游迅", pos = 4},
	[190] = {type = 0, icon = 26407, name = "盗宝火枪手", pos = 1},
	[191] = {type = 0, icon = 26409, name = "迷窟毒花", pos = 2},
	[192] = {type = 0, icon = 26401, name = "吹箭小兵", pos = 3},
	[193] = {type = 0, icon = 26414, name = "腐奴", pos = 4},

	[5] = {type = 1, icon = 23997, name = "峨嵋风采", pos = 1},
	[6] = {type = 1, icon = 23975, name = "恒山风采", pos = 1},
	[7] = {type = 1, icon = 23981, name = "华山风采", pos = 1},
	[18] = {type = 1, icon = 23986, name = "五仙风采", pos = 2},
	[19] = {type = 1, icon = 23977, name = "衡山风采", pos = 2},
	[20] = {type = 1, icon = 23979, name = "唐门风采", pos = 2},
	[31] = {type = 1, icon = 23980, name = "日月风采", pos = 3},
	[32] = {type = 1, icon = 23982, name = "逍遥风采", pos = 3},
	[33] = {type = 1, icon = 23983, name = "少林风采", pos = 3},
	[45] = {type = 1, icon = 23984, name = "武当风采", pos = 4},
	[59] = {type = 1, icon = 23770, name = "镖局夜战", pos = 5},
	[60] = {type = 1, icon = 23771, name = "青城突破", pos = 5},
	[73] = {type = 1, icon = 23757, name = "云上山崖", pos = 6},
	[46] = {type = 1, icon = 23767, name = "蝎王魔窟", pos = 4},
	[44] = {type = 1, icon = 23753, name = "东厂盗宝", pos = 4},
	[57] = {type = 1, icon = 23768, name = "连云孤堡", pos = 5},
	[71] = {type = 1, icon = 23759, name = "叛军本营", pos = 6},
	[72] = {type = 1, icon = 23773, name = "梅庄地牢", pos = 6},
	[58] = {type = 1, icon = 23769, name = "镇嵩宝塔", pos = 5},
	[70] = {type = 1, icon = 23758, name = "截击刺客", pos = 6},
	[141] = {type = 1, icon = 26106, name = "山匪", pos = 1},
	[142] = {type = 1, icon = 26102, name = "狂沙萨满", pos = 2},
	[143] = {type = 1, icon = 25894, name = "异域刺客", pos = 3},
	[105] = {type = 1, icon = 23991, name = "武林-鬼见愁", pos = 4},
	[173] = {type = 1, icon = 25402, name = "白傀儡", pos = 1},
	[174] = {type = 1, icon = 25401, name = "黑傀儡", pos = 2},
	[175] = {type = 1, icon = 25890, name = "心魔-任我行", pos = 3},
	[123] = {type = 1, icon = 26103, name = "邓八公", pos = 1},
	[124] = {type = 1, icon = 25409, name = "钟镇", pos = 2},
	[125] = {type = 1, icon = 26096, name = "汤英鄂", pos = 3},
	[128] = {type = 1, icon = 26101, name = "黑熊王", pos = 5},
	[129] = {type = 1, icon = 25889, name = "美猴王", pos = 6},
	[145] = {type = 1, icon = 26095, name = "塞北刀王", pos = 5},
	[146] = {type = 1, icon = 25872, name = "青石巨兽", pos = 6},
	[147] = {type = 1, icon = 26098, name = "公孙灭", pos = 6},
	[181] = {type = 1, icon = 26099, name = "罗人杰", pos = 1},
	[182] = {type = 1, icon = 25871, name = "于人豪", pos = 2},
	[183] = {type = 1, icon = 25861, name = "洪人雄", pos = 3},
	[184] = {type = 1, icon = 25862, name = "侯人英", pos = 4},
	[186] = {type = 1, icon = 26373, name = "思过崖", pos = 5},
	[187] = {type = 1, icon = 26374, name = "论剑宫", pos = 6},
	[188] = {type = 1, icon = 26372, name = "华阴驿", pos = 1},
	[189] = {type = 1, icon = 26375, name = "长空崖", pos = 2},
	[194] = {type = 1, icon = 26402, name = "大内火术师", pos = 3},
	[195] = {type = 1, icon = 26403, name = "机关人之王", pos = 4},
	[196] = {type = 1, icon = 26400, name = "古代斗笠武士", pos = 5},
	[197] = {type = 1, icon = 26408, name = "古代盲眼剑客", pos = 6},
	[199] = {type = 1, icon = 26405, name = "百年蛾兽", pos = 1},
	[200] = {type = 1, icon = 26398, name = "千年狼蛛", pos = 2},
	[201] = {type = 1, icon = 26396, name = "万年蜈蚣", pos = 3},

	[8] = {type = 4, icon = 23789, name = "辟邪剑谱", pos = 1},
	[9] = {type = 4, icon = 23748, name = "三尸脑神丹", pos = 1},
	[10] = {type = 4, icon = 24004, name = "古都洛阳", pos = 1},
	[11] = {type = 4, icon = 24005, name = "丝路福州", pos = 1},
	[23] = {type = 4, icon = 24006, name = "南岳衡山", pos = 2},
	[24] = {type = 4, icon = 24007, name = "情动朱仙", pos = 2},
        [22] = {type = 4, icon = 23772, name = "夜阑谷", pos = 2},
	[36] = {type = 4, icon = 24008, name = "樱时剑阁", pos = 3},
	[37] = {type = 4, icon = 24012, name = "北斗泰山", pos = 3},
	[49] = {type = 4, icon = 23976, name = "衡山五峰", pos = 4},
	[50] = {type = 4, icon = 23987, name = "峨眉金顶", pos = 4},
	[61] = {type = 4, icon = 23988, name = "恒山普莲", pos = 5},
	[62] = {type = 4, icon = 23989, name = "唐门星火", pos = 5},
	[63] = {type = 4, icon = 23998, name = "日月神坛", pos = 5},
	[64] = {type = 4, icon = 23999, name = "华山之巅", pos = 5},
	[74] = {type = 4, icon = 24000, name = "逍遥遗舟", pos = 6},
	[75] = {type = 4, icon = 24001, name = "少林风云", pos = 6},
	[76] = {type = 4, icon = 24002, name = "武当道光", pos = 6},
	[77] = {type = 4, icon = 24003, name = "五仙苗寨", pos = 6},
	[48] = {type = 4, icon = 23760, name = "嵩山之巅", pos = 4},
	[35] = {type = 4, icon = 23762, name = "沙漠古镇", pos = 3},
	[166] = {type = 4, icon = 23763, name = "九层妖楼", pos = 1},
	[21] = {type = 4, icon = 23766, name = "绿竹幻想乡", pos = 2},
	[34] = {type = 4, icon = 23755, name = "龙岭迷宫", pos = 3},
	[47] = {type = 4, icon = 23749, name = "百毒禁地", pos = 4},
	[101] = {type = 4, icon = 23755, name = "力挽狂沙", pos = 5},
	[126] = {type = 4, icon = 23883, name = "左冷禅", pos = 1},
	[139] = {type = 4, icon = 25400, name = "余沧海", pos = 2},
	[140] = {type = 4, icon = 25404, name = "岳不群", pos = 3},
	[154] = {type = 4, icon = 23991, name = "任我行", pos = 4},
	[155] = {type = 4, icon = 23985, name = "东方不败", pos = 5},
	[167] = {type = 4, icon = 25403, name = "桃根仙", pos = 1},
	[168] = {type = 4, icon = 25406, name = "桃干仙", pos = 2},
	[169] = {type = 4, icon = 25407, name = "桃花仙", pos = 3},
	[170] = {type = 4, icon = 25405, name = "桃实仙", pos = 4},
	[171] = {type = 4, icon = 25892, name = "桃叶仙", pos = 5},
	[172] = {type = 4, icon = 26100, name = "桃枝仙", pos = 6},
	[176] = {type = 4, icon = 26097, name = "北冥玄狼", pos = 1},
	[177] = {type = 4, icon = 26104, name = "剑冢护灵", pos = 2},
	[178] = {type = 4, icon = 25866, name = "琅寰神兽", pos = 3},
	[179] = {type = 4, icon = 25873, name = "圣火蛮牛", pos = 4},
	[180] = {type = 4, icon = 26105, name = "活死人蝎", pos = 5},
	[185] = {type = 4, icon = 26376, name = "集灵华山", pos = 6},
	[198] = {type = 4, icon = 26406, name = "百毒道人", pos = 1},

    [204] = {type = 7, icon = 33098, name = "英-快龍", pos = 1},
	[12] = {type = 7, icon = 23958, name = "英-令狐冲", pos = 1},
	[13] = {type = 7, icon = 24013, name = "英-任盈盈", pos = 1},
	[202] = {type = 7, icon = 24064, name = "英-冲虚道长", pos = 1},
	[25] = {type = 7, icon = 23990, name = "英-林平之", pos = 2},
	[26] = {type = 7, icon = 23971, name = "英-仪琳", pos = 2},	
	[38] = {type = 7, icon = 23959, name = "英-岳灵珊", pos = 3},
	[39] = {type = 7, icon = 23957, name = "英-田伯光", pos = 3},
	[203] = {type = 7, icon = 23884, name = "英-曲洋", pos = 3},
	[51] = {type = 7, icon = 23991, name = "英-任我行", pos = 4},
	[52] = {type = 7, icon = 23956, name = "英-蓝凤凰", pos = 4},		
	[65] = {type = 7, icon = 23985, name = "英-东方不败", pos = 5},	
	[78] = {type = 7, icon = 23964, name = "英-风逝飞花", pos = 6},

}

function CardInfo:GetIllustrationByIdx( i )
	return CardInfo.CARD_ILLUSTRATION[i]
end

function CardInfo:GetAllIllustration()
	return CardInfo.CARD_ILLUSTRATION_INFO
end





CardInfo.CARD_ATTR_TYPE = 
{

	[1] = {class = 1, style = "力道", val = "%d"},
	[2] = {class = 1, style = "体魄", val = "%d"},
	[3] = {class = 1, style = "筋骨", val = "%d"},
	[4] = {class = 1, style = "气海", val = "%d"},
	[5] = {class = 1, style = "内劲", val = "%d"},
	[6] = {class = 1, style = "[附加属性6]", val = "%d"},
	[7] = {class = 1, style = "[附加属性7]", val = "%d"},
	[8] = {class = 1, style = "[附加属性8]", val = "%d"},
	[9] = {class = 1, style = "气血", val = "%d"},
	[10] = {class = 1, style = "内力", val = "%d"},
	[11] = {class = 1, style = "怒气", val = "%d"},
	[12] = {class = 1, style = "破绽上限", val = "%d"},
	[13] = {class = 1, style = "体力上限", val = "%d"},
	[14] = {class = 1, style = "[附加属性12]", val = "%d"},
	[15] = {class = 1, style = "[附加属性13]", val = "%d"},
	[16] = {class = 1, style = "[附加属性14]", val = "%d"},
	[17] = {class = 1, style = "[附加属性15]", val = "%d"},
	[18] = {class = 1, style = "气血上限提升", val = "%d%%"},
	[19] = {class = 1, style = "战斗外气血回复速度", val = "%d"},
	[20] = {class = 1, style = "战斗外内力回复速度", val = "%d"},
	[21] = {class = 1, style = "战斗外怒气回复速度", val = "%d"},
	[22] = {class = 1, style = "战斗外破绽回复速度", val = "%d"},
	[23] = {class = 1, style = "战斗外体力回复速度", val = "%d"},
	[24] = {class = 1, style = "[附加属性22]", val = "%d"},
	[25] = {class = 1, style = "[附加属性23]", val = "%d"},
	[26] = {class = 1, style = "[附加属性24]", val = "%d"},
	[27] = {class = 1, style = "[附加属性25]", val = "%d"},
	[28] = {class = 1, style = "外功攻击下限", val = "%d"},
	[29] = {class = 1, style = "外功攻击上限", val = "%d"},
	[30] = {class = 1, style = "外功防御", val = "%d"},
	[31] = {class = 1, style = "外功伤害加成", val = "%d%%"},
	[32] = {class = 4, style = "外功伤害减免", val = "%d%%"},
	[33] = {class = 4, style = "[附加属性31]", val = "%d%%"},
	[34] = {class = 4, style = "[附加属性32]", val = "%d%%"},
	[35] = {class = 4, style = "外攻暴击率", val = "%d%%"},
	[36] = {class = 4, style = "外攻暴击伤害", val = "%d%%"},
	[37] = {class = 1, style = "外攻暴击伤害", val = "%d"},
	[38] = {class = 4, style = "外功暴击抗性", val = "%d%%"},
	[39] = {class = 1, style = "内功攻击下限", val = "%d"},
	[40] = {class = 1, style = "内功攻击上限", val = "%d"},
	[41] = {class = 1, style = "内功防御", val = "%d"},
	[42] = {class = 1, style = "内功伤害加成", val = "%d%%"},
	[43] = {class = 4, style = "内功伤害减免", val = "%d%%"},
	[44] = {class = 4, style = "[附加属性42]", val = "%d%%"},
	[45] = {class = 4, style = "[附加属性43]", val = "%d%%"},
	[46] = {class = 4, style = "内攻暴击率", val = "%d%%"},
	[47] = {class = 4, style = "内攻暴击伤害", val = "%d%%"},
	[48] = {class = 1, style = "内攻暴击伤害", val = "%d"},
	[49] = {class = 4, style = "内功暴击抗性", val = "%d%%"},
	[50] = {class = 1, style = "冰系伤害", val = "%d"},
	[51] = {class = 1, style = "火系伤害", val = "%d"},
	[52] = {class = 1, style = "毒系伤害", val = "%d"},
	[53] = {class = 1, style = "土系伤害", val = "%d"},
	[54] = {class = 1, style = "[附加属性54]", val = "%d"},
	[55] = {class = 1, style = "[附加属性55]", val = "%d"},
	[56] = {class = 1, style = "[附加属性56]", val = "%d"},
	[57] = {class = 1, style = "[附加属性57]", val = "%d"},
	[58] = {class = 4, style = "冰系抗性", val = "%d%%"},
	[59] = {class = 4, style = "火系抗性", val = "%d%%"},
	[60] = {class = 4, style = "毒系抗性", val = "%d%%"},
	[61] = {class = 4, style = "土系抗性", val = "%d%%"},
	[62] = {class = 1, style = "[附加属性62]", val = "%d%%"},
	[63] = {class = 1, style = "[附加属性63]", val = "%d%%"},
	[64] = {class = 1, style = "[附加属性64]", val = "%d%%"},
	[65] = {class = 1, style = "[附加属性65]", val = "%d%%"},
	[66] = {class = 4, style = "降低被冰冻的几率", val = "%d%%"},
	[67] = {class = 4, style = "减少燃烧持续时间", val = "%d%%"},
	[68] = {class = 4, style = "延缓毒发速度", val = "%d%%"},
	[69] = {class = 1, style = "[附加属性69]", val = "%d"},
	[70] = {class = 1, style = "[附加属性70]", val = "%d"},
	[71] = {class = 1, style = "[附加属性71]", val = "%d"},
	[72] = {class = 1, style = "[附加属性72]", val = "%d"},
	[73] = {class = 1, style = "[附加属性73]", val = "%d"},
	[74] = {class = 4, style = "移动速度 + %d米/秒", val = "%d"},
	[75] = {class = 4, style = "骑乘速度 + %d米/秒", val = "%d"},
	[76] = {class = 1, style = "获得经验增加", val = "%d%%"},
	[77] = {class = 16, style = "[附加属性77]", val = "%d"},
	[78] = {class = 3, style = "[附加属性78]", val = "%d"},
	[79] = {class = 1, style = "[附加属性79]", val = "%d%%"},
	[80] = {class = 1, style = "[附加属性80]", val = "%d%%"},
	[81] = {class = 1, style = "[附加属性81]", val = "%d%%"},
	[82] = {class = 1, style = "[附加属性82]", val = "%d%%"},
	[83] = {class = 1, style = "[附加属性83]", val = "%d"},
	[84] = {class = 1, style = "[附加属性84]", val = "%d"},
	[85] = {class = 1, style = "[附加属性85]", val = "%d"},
	[86] = {class = 1, style = "[附加属性86]", val = "%d"},
	[87] = {class = 1, style = "[附加属性87]", val = "%d"},
	[88] = {class = 1, style = "[附加属性88]", val = "%d"},
	[89] = {class = 1, style = "[附加属性89]", val = "%d"},
	[90] = {class = 1, style = "[附加属性90]", val = "%d"},
	[91] = {class = 1, style = "[附加属性91]", val = "%d"},
	[92] = {class = 1, style = "[附加属性92]", val = "%d"},
	[93] = {class = 1, style = "[附加属性93]", val = "%d"},
	[94] = {class = 1, style = "[附加属性94]", val = "%d"},
	[95] = {class = 1, style = "[附加属性95]", val = "%d"},
	[96] = {class = 1, style = "[附加属性96]", val = "%d"},
	[97] = {class = 1, style = "[附加属性97]", val = "%d"},
	[98] = {class = 1, style = "[附加属性98]", val = "%d"},
	[99] = {class = 1, style = "[附加属性99]", val = "%d"},
	[100] = {class = 1, style = "[附加属性100]", val = "%d"},
	[101] = {class = 1, style = "[附加属性101]", val = "%d"},
	[102] = {class = 1, style = "[附加属性102]", val = "%d"},
	[103] = {class = 1, style = "[附加属性103]", val = "%d"},
	[104] = {class = 1, style = "[附加属性104]", val = "%d"},
	[105] = {class = 1, style = "[附加属性105]", val = "%d"},
	[106] = {class = 1, style = "[附加属性106]", val = "%d"},
	[107] = {class = 1, style = "[附加属性107]", val = "%d"},
	[108] = {class = 1, style = "[附加属性108]", val = "%d"},
	[109] = {class = 1, style = "[附加属性109]", val = "%d"},
	[110] = {class = 1, style = "[附加属性110]", val = "%d"},
	[111] = {class = 1, style = "[附加属性111]", val = "%d"},
	[112] = {class = 1, style = "[附加属性112]", val = "%d"},
	[113] = {class = 1, style = "[附加属性113]", val = "%d"},
	[114] = {class = 1, style = "[附加属性114]", val = "%d"},
	[115] = {class = 1, style = "[附加属性115]", val = "%d"},
	[116] = {class = 1, style = "[附加属性116]", val = "%d"},
	[117] = {class = 1, style = "[附加属性117]", val = "%d"},
	[118] = {class = 1, style = "[附加属性118]", val = "%d"},
	[119] = {class = 6, style = "差事%s提升%d级", val = "%d"},
	[120] = {class = 1, style = "武学技能 + %d级", val = "%d"},
	[121] = {class = 1, style = "职业技能 + %d级", val = "%d"},
	[122] = {class = 1, style = "攻击强化", val = "%d%%"},
	[123] = {class = 1, style = "防御强化", val = "%d%%"},
	[124] = {class = 1, style = "全部资质点", val = "%d"},
	[125] = {class = 1, style = "无视 %d 点外功伤害", val = "%d"},
	[126] = {class = 1, style = "无视 %d 点内功伤害", val = "%d"},
	[127] = {class = 1, style = "无视 %d 点内外功伤害", val = "%d"},
	[128] = {class = 1, style = "真气上限提升", val = "%d%%"},
	[129] = {class = 1, style = "外功攻击", val = "%d"},
	[130] = {class = 1, style = "内功攻击", val = "%d"},
	[131] = {class = 1, style = "社交点上限", val = "%d"},
	[132] = {class = 1, style = "劳作点上限", val = "%d"},
	[133] = {class = 7, style = "%s可完成次数增加%d次", val = "%d"},
	[134] = {class = 1, style = "提高幸运值%d点", val = "%d"},
	[135] = {class = 8, style = "声望%s购买物品可获得%d%%的折扣率", val = "%d%%"},
	[136] = {class = 9, style = "%s类任务可获得%d%%的增益", val = "%d%%"},
	[137] = {class = 10, style = "生产可额外获得造诣", val = "%d"},
	[138] = {class = 11, style = "生产可显示签名", val = "%d"},
	[139] = {class = 1, style = "门徒死亡后重新招出的恢复时间缩短", val = "%d"},
	[140] = {class = 1, style = "门徒可训练次数", val = "%d"},
	[141] = {class = 12, style = "门徒捕获几率", val = "%d%%"},
	[142] = {class = 13, style = "门徒普攻威力", val = "%d%%"},
	[143] = {class = 12, style = "门徒训练效果", val = "%d%%"},
	[144] = {class = 1, style = "会心", val = "%d"},
	[145] = {class = 1, style = "精通", val = "%d"},
	[146] = {class = 1, style = "抵御", val = "%d"},
	[147] = {class = 1, style = "会心伤害", val = "%d%%"},
	[148] = {class = 1, style = "抵御伤害", val = "%d%%"},
	[149] = {class = 4, style = "冰系减抗", val = "%d%%"},
	[150] = {class = 4, style = "火系减抗", val = "%d%%"},
	[151] = {class = 4, style = "毒系减抗", val = "%d%%"},
	[152] = {class = 4, style = "土系减抗", val = "%d%%"},
	[153] = {class = 1, style = "[附加属性153]", val = "%d%%"},
	[154] = {class = 1, style = "[附加属性154]", val = "%d%%"},
	[155] = {class = 1, style = "[附加属性155]", val = "%d%%"},
	[156] = {class = 1, style = "[附加属性156]", val = "%d%%"},
	[157] = {class = 4, style = "冰系穿透", val = "%d%%"},
	[158] = {class = 4, style = "火系穿透", val = "%d%%"},
	[159] = {class = 4, style = "毒系穿透", val = "%d%%"},
	[160] = {class = 4, style = "土系穿透", val = "%d%%"},
	[161] = {class = 1, style = "[附加属性161]", val = "%d%%"},
	[162] = {class = 1, style = "[附加属性162]", val = "%d%%"},
	[163] = {class = 1, style = "[附加属性163]", val = "%d%%"},
	[164] = {class = 1, style = "[附加属性164]", val = "%d%%"},
	[165] = {class = 14, style = "[附加属性165]", val = "%d"},
	[166] = {class = 14, style = "[附加属性166]", val = "%d"},
	[167] = {class = 14, style = "[附加属性167]", val = "%d"},
	[168] = {class = 14, style = "[附加属性168]", val = "%d"},
	[169] = {class = 14, style = "[附加属性169]", val = "%d"},
	[170] = {class = 14, style = "[附加属性170]", val = "%d"},
	[171] = {class = 1, style = "内力上限", val = "%d%%"},
	[172] = {class = 1, style = "怒气上限", val = "%d%%"},
	[173] = {class = 1, style = "破绽上限", val = "%d%%"},
	[174] = {class = 1, style = "体力上限", val = "%d%%"},
	[175] = {class = 1, style = "出破绽时间降低", val = "%d%%"},
	[176] = {class = 1, style = "被击倒的持续时间降低", val = "%d%%"},
	[177] = {class = 1, style = "被击飞的持续时间降低", val = "%d%%"},
	[178] = {class = 1, style = "被点穴的持续时间降低", val = "%d%%"},
	[180] = {class = 1, style = "战斗内气血回复速度", val = "%d"},
	[181] = {class = 1, style = "战斗内内力回复速度", val = "%d"},
	[182] = {class = 1, style = "战斗内怒气回复速度", val = "%d"},
	[183] = {class = 1, style = "战斗内破绽回复速度", val = "%d"},
	[184] = {class = 1, style = "战斗内体力回复速度", val = "%d"},
	[189] = {class = 1, style = "人物硬直度", val = "%d"},
	[190] = {class = 1, style = "人物僵直度", val = "%d"},
	[191] = {class = 1, style = "全武学技能", val = "%d"},
	[192] = {class = 1, style = "额外增加技能栏", val = "%d"},
	[193] = {class = 1, style = "人物硬直率", val = "%d%%"},
	[194] = {class = 1, style = "人物僵直率", val = "%d%%"},

}

function CardInfo:GetCardAttrTypeByIdx( i )
	return CardInfo.CARD_ATTR_TYPE[i]
end

--下面是卡牌套装相关的配置
CardInfo.CARDSUIT_QUALITY_COUNT = 5 

function CardInfo:GetCardSuitQualityCount()
	return CardInfo.CARDSUIT_QUALITY_COUNT
end 

CardInfo.CARDSUIT_QUALITY_INFO =
{
	[1] = {type = 4, qualityname = "凡物"},
	[2] = {type = 3, qualityname = "脱俗"},
	[3] = {type = 2, qualityname = "洞天"},
	[4] = {type = 1, qualityname = "绝代"},
	[5] = {type = 0, qualityname = "天宝"},
}

function CardInfo:GetCardSuitTypeInfoByIdx( i )
	return CardInfo.CARDSUIT_QUALITY_INFO[i]
end

CardInfo.CARDSUIT_PROPERTY = --注意在配置的时候存在\r的后面不要加空格
--      [] =
--	{
--		[1] = {Desc = "\r", Level = 1}, 
--		[2] = {Desc = "\r", Level = 2},
--		[3] = {Desc = "\r", Level = 3},
--	},
{
	[91491] =
	{
		[1] = {Desc = "气血: + 236\r抵御: + 16\r", Level = 1}, 
		[2] = {Desc = "气血: + 1179\r抵御: + 82\r", Level = 2}, 
		[3] = {Desc = "气血: + 2358\r抵御: + 164\r", Level = 3}, 
	},
	[91493] =
	{
		[1] = {Desc = "内功攻击: + 56\r火系抗性: + 2%\r", Level = 1}, 
		[2] = {Desc = "内功攻击: + 279\r火系抗性: + 9%\r", Level = 2}, 
		[3] = {Desc = "内功攻击: + 557\r火系抗性: + 17%\r", Level = 3}, 
	},
	[91495] =
	{
		[1] = {Desc = "外功攻击: + 56\r毒系抗性: + 2%\r", Level = 1}, 
		[2] = {Desc = "外功攻击: + 279\r毒系抗性: + 9%\r", Level = 2}, 
		[3] = {Desc = "外功攻击: + 557\r毒系抗性: + 17%\r", Level = 3}, 
	},
	[92366] =
	{
		[1] = {Desc = "内劲: + 8\r外功防御: + 55\r", Level = 1}, 
		[2] = {Desc = "内劲: + 39\r外功防御: + 277\r", Level = 2}, 
		[3] = {Desc = "内劲: + 78\r外功防御: + 554\r", Level = 3}, 
	},
	 [92367] =
	{
		[1] = {Desc = "力道: + 8\r外功防御: + 55\r", Level = 1}, 
		[2] = {Desc = "力道: + 39\r外功防御: + 277\r", Level = 2}, 
		[3] = {Desc = "力道: + 78\r外功防御: + 554\r", Level = 3}, 
	},
	[91472] =
	{
		[1] = {Desc = "体魄: + 6\r筋骨: + 6\r", Level = 1},
		[2] = {Desc = "体魄: + 29\r筋骨: + 29\r", Level = 2},
		[3] = {Desc = "体魄: + 58\r筋骨: + 58\r", Level = 3},
	},
	[92368] =
	{
		[1] = {Desc = "外功防御: + 41\r内功防御: + 41\r", Level = 1}, 
		[2] = {Desc = "外功防御: + 204\r内功防御: + 204\r", Level = 2}, 
		[3] = {Desc = "外功防御: + 408\r内功防御: + 408\r", Level = 3}, 
	},
	[91511] =
	{
		[1] = {Desc = "内功攻击: + 36\r", Level = 1}, 
		[2] = {Desc = "内功攻击: + 180\r", Level = 2}, 
		[3] = {Desc = "内功攻击: + 361\r", Level = 3}, 
	},
	[91512] =
	{
		[1] = {Desc = "内功攻击: + 36\r", Level = 1}, 
		[2] = {Desc = "内功攻击: + 180\r", Level = 2}, 
		[3] = {Desc = "内功攻击: + 361\r", Level = 3}, 
	},
	[91513] =
	{
		[1] = {Desc = "内功攻击: + 36\r", Level = 1}, 
		[2] = {Desc = "内功攻击: + 180\r", Level = 2}, 
		[3] = {Desc = "内功攻击: + 361\r", Level = 3}, 
	},
	[91514] =
	{
		[1] = {Desc = "内功攻击: + 36\r", Level = 1}, 
		[2] = {Desc = "内功攻击: + 180\r", Level = 2}, 
		[3] = {Desc = "内功攻击: + 361\r", Level = 3}, 
	},
	[91515] =
	{
		[1] = {Desc = "外功攻击: + 36\r", Level = 1}, 
		[2] = {Desc = "外功攻击: + 180\r", Level = 2}, 
		[3] = {Desc = "外功攻击: + 361\r", Level = 3}, 
	},
	[91516] =
	{
		[1] = {Desc = "外功攻击: + 36\r", Level = 1}, 
		[2] = {Desc = "外功攻击: + 180\r", Level = 2}, 
		[3] = {Desc = "外功攻击: + 361\r", Level = 3}, 
	},
	[91517] =
	{
		[1] = {Desc = "内功攻击: + 36\r", Level = 1}, 
		[2] = {Desc = "内功攻击: + 180\r", Level = 2}, 
		[3] = {Desc = "内功攻击: + 361\r", Level = 3}, 
	},
	[91518] =
	{
		[1] = {Desc = "外功攻击: + 36\r", Level = 1}, 
		[2] = {Desc = "外功攻击: + 180\r", Level = 2}, 
		[3] = {Desc = "外功攻击: + 361\r", Level = 3}, 
	},
	[91519] =
	{
		[1] = {Desc = "外功攻击: + 36\r", Level = 1}, 
		[2] = {Desc = "外功攻击: + 180\r", Level = 2}, 
		[3] = {Desc = "外功攻击: + 361\r", Level = 3}, 
	},
	[91520] =
	{
		[1] = {Desc = "外功攻击: + 36\r", Level = 1}, 
		[2] = {Desc = "外功攻击: + 180\r", Level = 2}, 
		[3] = {Desc = "外功攻击: + 361\r", Level = 3}, 
	},
	[91462] =
	{
		[1] = {Desc = "会心: + 7\r", Level = 1}, 
		[2] = {Desc = "会心: + 35\r", Level = 2}, 
		[3] = {Desc = "会心: + 70\r", Level = 3}, 
	},
	[92369] =
	{
		[1] = {Desc = "抵御: + 8\r", Level = 1}, 
		[2] = {Desc = "抵御: + 41\r", Level = 2}, 
		[3] = {Desc = "抵御: + 81\r", Level = 3}, 
	},
	[92370] =
	{
		[1] = {Desc = "精通: + 15\r", Level = 1}, 
		[2] = {Desc = "精通: + 75\r", Level = 2}, 
		[3] = {Desc = "精通: + 151\r", Level = 3}, 
	},
	[92371] =
	{
		[1] = {Desc = "气血: + 72\r", Level = 1}, 
		[2] = {Desc = "气血: + 361\r", Level = 2}, 
		[3] = {Desc = "气血: + 721\r", Level = 3}, 
	},
	[91456] =
	{
		[1] = {Desc = "体魄: + 5\r", Level = 1}, 
		[2] = {Desc = "体魄: + 25\r", Level = 2}, 
		[3] = {Desc = "体魄: + 51\r", Level = 3}, 
	},
	[91490] =
	{
		[1] = {Desc = "气血: + 173\r气海: + 3\r", Level = 1}, 
		[2] = {Desc = "气血: + 867\r气海: + 16\r", Level = 2}, 
		[3] = {Desc = "气血: + 1734\r气海: + 32\r", Level = 3}, 
	},
	[91460] =
	{
		[1] = {Desc = "筋骨: + 6\r抵御: + 12\r", Level = 1}, 
		[2] = {Desc = "筋骨: + 29\r抵御: + 60\r", Level = 2}, 
		[3] = {Desc = "筋骨: + 58\r抵御: + 121\r", Level = 3}, 
	},
	[91471] =
	{
		[1] = {Desc = "筋骨: + 5\r", Level = 1}, 
		[2] = {Desc = "筋骨: + 25\r", Level = 2}, 
		[3] = {Desc = "筋骨: + 51\r", Level = 3}, 
	},
	[91488] =
	{
		[1] = {Desc = "外功防御: + 27\r", Level = 1}, 
		[2] = {Desc = "外功防御: + 137\r", Level = 2}, 
		[3] = {Desc = "外功防御: + 274\r", Level = 3}, 
	},
	[91489] =
	{
		[1] = {Desc = "内功防御: + 27\r", Level = 1}, 
		[2] = {Desc = "内功防御: + 137\r", Level = 2}, 
		[3] = {Desc = "内功防御: + 274\r", Level = 3}, 
	},
	[91443] =
	{
		[1] = {Desc = "体魄: + 5\r", Level = 1}, 
		[2] = {Desc = "体魄: + 25\r", Level = 2}, 
		[3] = {Desc = "体魄: + 51\r", Level = 3}, 
	},
	[91468] =
	{
		[1] = {Desc = "筋骨: + 5\r", Level = 1}, 
		[2] = {Desc = "筋骨: + 25\r", Level = 2}, 
		[3] = {Desc = "筋骨: + 51\r", Level = 3}, 
	},
	[91469] =
	{
		[1] = {Desc = "内功攻击: + 41\r内功防御: + 41\r", Level = 1}, 
		[2] = {Desc = "内功攻击: + 205\r内功防御: + 204\r", Level = 2}, 
		[3] = {Desc = "内功攻击: + 410\r内功防御: + 408\r", Level = 3}, 
	},
	[91475] =
	{
		[1] = {Desc = "外功攻击: + 41\r外功防御: + 41\r", Level = 1}, 
		[2] = {Desc = "外功攻击: + 205\r外功防御: + 204\r", Level = 2}, 
		[3] = {Desc = "外功攻击: + 410\r外功防御: + 408\r", Level = 3}, 
	},
	[91497] =
	{
		[1] = {Desc = "气海: + 3\r", Level = 1}, 
		[2] = {Desc = "气海: + 14\r", Level = 2}, 
		[3] = {Desc = "气海: + 28\r", Level = 3}, 
	},
}

function CardInfo:GetCardSuitPropertyByIdx( i )
	return CardInfo.CARDSUIT_PROPERTY[i]
end

function CardInfo:GetCardSuitDesc(sutitId, suitName, bActive, nType, nLevel)
	local result = {}

	local suitGainStatus
	if bActive == true then
		suitGainStatus = "已激活"
	else
		suitGainStatus = "未激活"
	end
	result["title"] = string.format(--[[!AUTO_67]]"%s(%s)", suitName, suitGainStatus)
	result["icon"] = "06398外功攻击强化.dds"
	for i = 1, CardInfo.CARDSUIT_QUALITY_COUNT do
		if CardInfo.CARDSUIT_QUALITY_INFO[i].type == nType then
			result["info1"] = string.format(--[[!AUTO_67]]"品质：%s\r等级：%d", CardInfo.CARDSUIT_QUALITY_INFO[i].qualityname, nLevel) 
			break
		end
	end

	function CountTB(tbData)
		local count = 0
		if tbData then
			for i, val in pairs(tbData) do
				count = count + 1
			end
		end
		return count
	end

	local desc = ""
	for i = 1, CountTB(CardInfo.CARDSUIT_PROPERTY[sutitId]) do
		desc = desc..string.format("%d级属性：\r",i)
		desc = desc.."^00ee00"
		desc = desc..CardInfo.CARDSUIT_PROPERTY[sutitId][i].Desc
		desc = desc.."^ffffff"
	end
	result["desc"] = desc

	return result
end
