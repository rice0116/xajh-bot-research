--[[#tag push auto]]


---------------------------------------------------------------
--  created:   2009.09.23
--  author:    daijunhua
--  描述:      和任务相关的脚本
-- 需要 gameevent.lua, text_link.lua

--
--任务来源分类(原区域分类)
--
TaskHelp.Zone =
{
[20121221] = {ZoneName = --[[!AUTO_1]]"^07550d隐藏", IDList = {20121221,-1},Order = 20121221,},
[65536] = {ZoneName = --[[!AUTO_2]]"^07550d帮助", IDList = {65536,-1},Order = 65536,},
[9999] = {ZoneName = --[[!AUTO_3]]"^004da4测试", IDList = {0,-1},Order = 9999,},
[1] = {ZoneName = --[[!AUTO_4]]"^be4800剧情", IDList = {1,-1},Order = 1,},
[2] = {ZoneName = --[[!AUTO_5]]"^be4800环任务", IDList = {10,-1},Order = 2,},
[3] = {ZoneName = --[[!AUTO_6]]"^be4800师门", IDList = {1010,-1},Order = 3,},
[4] = {ZoneName = --[[!AUTO_7]]"^be4800异闻录", IDList = {11,-1},Order = 4,},
[5] = {ZoneName = --[[!AUTO_8]]"^be4800军令如山", IDList = {12,-1},Order = 5,},
[6] = {ZoneName = --[[!AUTO_9]]"^be4800战鼓如雷", IDList = {13,-1},Order = 6,},
[7] = {ZoneName = --[[!AUTO_10]]"^be4800成就", IDList = {101,-1},Order = 7,},
[8] = {ZoneName = --[[!AUTO_11]]"^be4800名望", IDList = {102,-1},Order = 8,},
[9] = {ZoneName = --[[!AUTO_12]]"^be4800武林", IDList = {103,-1},Order = 9,},
[10] = {ZoneName = --[[!AUTO_13]]"^be4800江湖", IDList = {104,-1},Order = 10,},
[11] = {ZoneName = --[[!AUTO_14]]"^be4800活动", IDList = {105,-1},Order = 11,},
[12] = {ZoneName = --[[!AUTO_15]]"^be4800探险", IDList = {106,-1},Order = 12,},
[13] = {ZoneName = --[[!AUTO_16]]"^be4800社交", IDList = {107,-1},Order = 13,},
[14] = {ZoneName = --[[!AUTO_17]]"^be4800评书", IDList = {108,-1},Order = 14,},
[15] = {ZoneName = --[[!AUTO_18]]"^be4800答题", IDList = {109,-1},Order = 15,},
[16] = {ZoneName = --[[!AUTO_19]]"^be4800美酒", IDList = {110,-1},Order = 16,},
[17] = {ZoneName = --[[!AUTO_20]]"^be4800绿竹", IDList = {111,-1},Order = 17,},
[18] = {ZoneName = --[[!AUTO_21]]"^be4800捕猎", IDList = {112,-1},Order = 18,},
[19] = {ZoneName = --[[!AUTO_22]]"^be4800活动", IDList = {113,-1},Order = 19,},
[20] = {ZoneName = --[[!AUTO_23]]"^be4800差事", IDList = {114,-1},Order = 20,},
[21] = {ZoneName = --[[!AUTO_24]]"^be4800威武令", IDList = {201,-1},Order = 21,},
[22] = {ZoneName = --[[!AUTO_25]]"^be4800除害", IDList = {202,-1},Order = 22,},
[23] = {ZoneName = --[[!AUTO_26]]"^be4800天师斩妖", IDList = {203,-1},Order = 23,},
[24] = {ZoneName = --[[!AUTO_27]]"^be4800兵器谱", IDList = {204,-1},Order = 24,},
[25] = {ZoneName = --[[!AUTO_28]]"^be4800还阳轩", IDList = {300,-1},Order = 25,},
[26] = {ZoneName = --[[!AUTO_29]]"^be4800探索", IDList = {2000,-1},Order = 26,},
[27] = {ZoneName = --[[!AUTO_30]]"^be4800临江镇", IDList = {2001,-1},Order = 27,},
[28] = {ZoneName = --[[!AUTO_31]]"^be4800福州城", IDList = {2002,-1},Order = 28,},
[29] = {ZoneName = --[[!AUTO_32]]"^be4800梅关古道", IDList = {2003,-1},Order = 29,},
[30] = {ZoneName = --[[!AUTO_33]]"^be4800衡山城", IDList = {2004,-1},Order = 30,},
[31] = {ZoneName = --[[!AUTO_34]]"^be4800药王谷", IDList = {2005,-1},Order = 31,},
[32] = {ZoneName = --[[!AUTO_35]]"^be4800洛阳城", IDList = {2006,-1},Order = 32,},
[33] = {ZoneName = --[[!AUTO_36]]"^be4800西安城", IDList = {2007,-1},Order = 33,},
[34] = {ZoneName = --[[!AUTO_37]]"^be4800桃花岛", IDList = {2008,-1},Order = 34,},
[35] = {ZoneName = --[[!AUTO_38]]"^be4800大理城", IDList = {2009,-1},Order = 35,},
[36] = {ZoneName = --[[!AUTO_39]]"^be4800北京城", IDList = {2010,-1},Order = 36,},
[37] = {ZoneName = --[[!AUTO_40]]"^be4800武当山", IDList = {2011,-1},Order = 37,},
[38] = {ZoneName = --[[!AUTO_41]]"^be4800华山", IDList = {2012,-1},Order = 38,},
[39] = {ZoneName = --[[!AUTO_42]]"^be4800少室山", IDList = {2013,-1},Order = 39,},
[40] = {ZoneName = --[[!AUTO_43]]"^be4800嵩山", IDList = {2014,-1},Order = 40,},
[41] = {ZoneName = --[[!AUTO_44]]"^be4800仙愁峡", IDList = {2015,-1},Order = 41,},
[42] = {ZoneName = --[[!AUTO_45]]"^be4800余杭", IDList = {2016,-1},Order = 42,},
[43] = {ZoneName = --[[!AUTO_46]]"^be4800杭州城", IDList = {2017,-1},Order = 43,},
[44] = {ZoneName = --[[!AUTO_47]]"^be4800仙霞岭", IDList = {2018,-1},Order = 44,},
[45] = {ZoneName = --[[!AUTO_48]]"^be4800廿八铺", IDList = {2019,-1},Order = 45,},
[46] = {ZoneName = --[[!AUTO_49]]"^be4800铸剑谷", IDList = {2020,-1},Order = 46,},
[47] = {ZoneName = --[[!AUTO_50]]"^be4800龙泉", IDList = {2021,-1},Order = 47,},
[48] = {ZoneName = --[[!AUTO_51]]"^be4800横屿滩", IDList = {2022,-1},Order = 48,},
[49] = {ZoneName = --[[!AUTO_52]]"^be4800南疆", IDList = {2023,-1},Order = 49,},
[50] = {ZoneName = --[[!AUTO_53]]"^be4800剑阁", IDList = {2024,-1},Order = 50,},
[51] = {ZoneName = --[[!AUTO_54]]"^be4800青城山", IDList = {2025,-1},Order = 51,},
[52] = {ZoneName = --[[!AUTO_55]]"^be4800乐山", IDList = {2026,-1},Order = 52,},
[53] = {ZoneName = --[[!AUTO_56]]"^be4800蜀南竹海", IDList = {2027,-1},Order = 53,},
[54] = {ZoneName = --[[!AUTO_57]]"^be4800平凉", IDList = {2028,-1},Order = 54,},
[55] = {ZoneName = --[[!AUTO_58]]"^be4800恒山", IDList = {2029,-1},Order = 55,},
[56] = {ZoneName = --[[!AUTO_59]]"^be4800朱仙镇", IDList = {2030,-1},Order = 56,},
[57] = {ZoneName = --[[!AUTO_60]]"^be4800五霸岗", IDList = {2031,-1},Order = 57,},
[58] = {ZoneName = --[[!AUTO_61]]"^be4800泰山", IDList = {2032,-1},Order = 58,},
[59] = {ZoneName = --[[!AUTO_62]]"^be4800黑木崖", IDList = {2033,-1},Order = 59,},
[60] = {ZoneName = --[[!AUTO_63]]"^be4800桂林", IDList = {2034,-1},Order = 60,},
[61] = {ZoneName = --[[!AUTO_64]]"^be4800敦煌", IDList = {2035,-1},Order = 61,},
[62] = {ZoneName = --[[!AUTO_65]]"^be4800山海关", IDList = {2036,-1},Order = 62,},
[63] = {ZoneName = --[[!AUTO_66]]"^be4800长白山", IDList = {2037,-1},Order = 63,},
[64] = {ZoneName = --[[!AUTO_67]]"^be4800琉球", IDList = {2038,-1},Order = 64,},
[65] = {ZoneName = --[[!AUTO_68]]"^be4800楼兰", IDList = {2039,-1},Order = 65,},
[66] = {ZoneName = --[[!AUTO_69]]"^be4800戈壁", IDList = {2040,-1},Order = 66,},
[67] = {ZoneName = --[[!AUTO_70]]"^be4800悦来客栈", IDList = {2041,-1},Order = 67,},
[68] = {ZoneName = --[[!AUTO_71]]"^be4800阴山草原", IDList = {2042,-1},Order = 68,},
[69] = {ZoneName = --[[!AUTO_72]]"^be4800蒙古草原", IDList = {2043,-1},Order = 69,},
[70] = {ZoneName = --[[!AUTO_73]]"^be4800药王秘洞", IDList = {3001,-1},Order = 70,},
[71] = {ZoneName = --[[!AUTO_74]]"^be4800梅庄地牢", IDList = {3002,-1},Order = 71,},
[72] = {ZoneName = --[[!AUTO_75]]"^be4800献王墓", IDList = {3003,-1},Order = 72,},
[73] = {ZoneName = --[[!AUTO_76]]"^be4800木人巷", IDList = {3004,-1},Order = 73,},
[74] = {ZoneName = --[[!AUTO_77]]"^be4800战场", IDList = {4001,-1},Order = 74,},
[75] = {ZoneName = --[[!AUTO_78]]"^be4800少林寺", IDList = {501,-1},Order = 75,},
[76] = {ZoneName = --[[!AUTO_79]]"^be4800武当派", IDList = {502,-1},Order = 76,},
[77] = {ZoneName = --[[!AUTO_80]]"^be4800华山派", IDList = {503,-1},Order = 77,},
[78] = {ZoneName = --[[!AUTO_81]]"^be4800恒山派", IDList = {504,-1},Order = 78,},
[79] = {ZoneName = --[[!AUTO_82]]"^be4800衡山派", IDList = {505,-1},Order = 79,},
[80] = {ZoneName = --[[!AUTO_83]]"^be4800日月神教", IDList = {506,-1},Order = 80,},
[81] = {ZoneName = --[[!AUTO_84]]"^be4800五仙教", IDList = {507,-1},Order = 81,},
[82] = {ZoneName = --[[!AUTO_85]]"^be4800逍遥派", IDList = {508,-1},Order = 82,},
[83] = {ZoneName = --[[!AUTO_86]]"^be4800唐门", IDList = {509,-1},Order = 83,},
[84] = {ZoneName = --[[!AUTO_87]]"^be4800峨嵋派", IDList = {510,-1},Order = 84,},
[85] = {ZoneName = --[[!AUTO_88]]"^be4800采集", IDList = {601,-1},Order = 85,},
[86] = {ZoneName = --[[!AUTO_89]]"^be4800采矿", IDList = {602,-1},Order = 86,},
[87] = {ZoneName = --[[!AUTO_90]]"^be4800加工", IDList = {603,-1},Order = 87,},
[88] = {ZoneName = --[[!AUTO_91]]"^be4800铁匠", IDList = {604,-1},Order = 88,},
[89] = {ZoneName = --[[!AUTO_92]]"^be4800裁缝", IDList = {605,-1},Order = 89,},
[90] = {ZoneName = --[[!AUTO_93]]"^be4800巧匠", IDList = {606,-1},Order = 90,},
[91] = {ZoneName = --[[!AUTO_94]]"^be4800制药", IDList = {607,-1},Order = 91,},
[92] = {ZoneName = --[[!AUTO_95]]"^be4800烹饪", IDList = {608,-1},Order = 92,},
[93] = {ZoneName = --[[!AUTO_96]]"^be4800木匠", IDList = {609,-1},Order = 93,},
[94] = {ZoneName = --[[!AUTO_97]]"^be4800生技", IDList = {611,-1},Order = 94,},
[95] = {ZoneName = --[[!AUTO_98]]"^be4800门派战斗", IDList = {5500,-1},Order = 95,},
[96] = {ZoneName = --[[!AUTO_99]]"^be4800少林战", IDList = {5501,-1},Order = 96,},
[97] = {ZoneName = --[[!AUTO_100]]"^be4800武当战", IDList = {5502,-1},Order = 97,},
[98] = {ZoneName = --[[!AUTO_101]]"^be4800华山战", IDList = {5503,-1},Order = 98,},
[99] = {ZoneName = --[[!AUTO_102]]"^be4800恒山战", IDList = {5504,-1},Order = 99,},
[100] = {ZoneName = --[[!AUTO_103]]"^be4800衡山战", IDList = {5505,-1},Order = 100,},
[101] = {ZoneName = --[[!AUTO_104]]"^be4800日月战", IDList = {5506,-1},Order = 101,},
[102] = {ZoneName = --[[!AUTO_105]]"^be4800五仙战", IDList = {5507,-1},Order = 102,},
[103] = {ZoneName = --[[!AUTO_106]]"^be4800逍遥战", IDList = {5508,-1},Order = 103,},
[104] = {ZoneName = --[[!AUTO_107]]"^be4800唐门战", IDList = {5509,-1},Order = 104,},
[105] = {ZoneName = --[[!AUTO_108]]"^be4800峨嵋战", IDList = {5510,-1},Order = 105,},
[106] = {ZoneName = --[[!AUTO_109]]"^be4800门徒", IDList = {6600,-1},Order = 106,},
[107] = {ZoneName = --[[!AUTO_110]]"^be4800少林门徒", IDList = {6601,-1},Order = 107,},
[108] = {ZoneName = --[[!AUTO_111]]"^be4800武当门徒", IDList = {6602,-1},Order = 108,},
[109] = {ZoneName = --[[!AUTO_112]]"^be4800华山门徒", IDList = {6603,-1},Order = 109,},
[110] = {ZoneName = --[[!AUTO_113]]"^be4800恒山门徒", IDList = {6604,-1},Order = 110,},
[111] = {ZoneName = --[[!AUTO_114]]"^be4800衡山门徒", IDList = {6605,-1},Order = 111,},
[112] = {ZoneName = --[[!AUTO_115]]"^be4800日月门徒", IDList = {6606,-1},Order = 112,},
[113] = {ZoneName = --[[!AUTO_116]]"^be4800五仙门徒", IDList = {6607,-1},Order = 113,},
[114] = {ZoneName = --[[!AUTO_117]]"^be4800逍遥门徒", IDList = {6608,-1},Order = 114,},
[115] = {ZoneName = --[[!AUTO_118]]"^be4800唐门门徒", IDList = {6609,-1},Order = 115,},
[116] = {ZoneName = --[[!AUTO_119]]"^be4800峨嵋门徒", IDList = {6610,-1},Order = 116,},
[117] = {ZoneName = --[[!AUTO_120]]"^be4800镖局", IDList = {701,-1},Order = 117,},
[118] = {ZoneName = --[[!AUTO_121]]"^be4800马帮", IDList = {702,-1},Order = 118,},
[119] = {ZoneName = --[[!AUTO_122]]"^be4800山寨", IDList = {703,-1},Order = 119,},
[120] = {ZoneName = --[[!AUTO_123]]"^be4800工坊", IDList = {704,-1},Order = 120,},

	--"Default"
	[99999999] = {ZoneName = --[[!AUTO_124]]"^ffaaaa分类未定义",IDList = {-1},Order = 0,},
}

--任务来源分类，元素顺序决定显示顺序，任务模板记录id
TaskHelp.sourceTypeList =
{
	{id = -1, name = --[[!AUTO_125]]"分类未定义", color=0xFFAAAA},
	{id = 1, name = --[[!AUTO_126]]"剧情", color=0xBE4800},
	{id = 10, name = --[[!AUTO_127]]"环任务", color=0xBE4800},
	{id = 1010, name = --[[!AUTO_128]]"师门", color=0xBE4800},
	{id = 11, name = --[[!AUTO_129]]"异闻录", color=0xBE4800},
	{id = 12, name = --[[!AUTO_130]]"军令如山", color=0xBE4800},
	{id = 13, name = --[[!AUTO_131]]"战鼓如雷", color=0xBE4800},
	{id = 101, name = --[[!AUTO_132]]"成就", color=0xBE4800},
	{id = 102, name = --[[!AUTO_133]]"名望", color=0xBE4800},
	{id = 103, name = --[[!AUTO_134]]"武林", color=0xBE4800},
	{id = 104, name = --[[!AUTO_135]]"江湖", color=0xBE4800},
	{id = 105, name = --[[!AUTO_136]]"活动", color=0xBE4800},
	{id = 106, name = --[[!AUTO_137]]"探险", color=0xBE4800},
	{id = 107, name = --[[!AUTO_138]]"社交", color=0xBE4800},
	{id = 108, name = --[[!AUTO_139]]"评书", color=0xBE4800},
	{id = 109, name = --[[!AUTO_140]]"答题", color=0xBE4800},
	{id = 110, name = --[[!AUTO_141]]"美酒", color=0xBE4800},
	{id = 111, name = --[[!AUTO_142]]"绿竹", color=0xBE4800},
	{id = 112, name = --[[!AUTO_143]]"捕猎", color=0xBE4800},
	{id = 113, name = --[[!AUTO_144]]"活动", color=0xBE4800},
	{id = 114, name = --[[!AUTO_145]]"差事", color=0xBE4800},
	{id = 201, name = --[[!AUTO_146]]"威武令", color=0xBE4800},
	{id = 202, name = --[[!AUTO_147]]"除害", color=0xBE4800},
	{id = 203, name = --[[!AUTO_148]]"天师斩妖", color=0xBE4800},
	{id = 204, name = --[[!AUTO_149]]"兵器谱", color=0xBE4800},
	{id = 300, name = --[[!AUTO_150]]"还阳轩", color=0xBE4800},
	{id = 2000, name = --[[!AUTO_151]]"探索", color=0xBE4800},
	{id = 2001, name = --[[!AUTO_152]]"临江镇", color=0xBE4800},
	{id = 2002, name = --[[!AUTO_153]]"福州城", color=0xBE4800},
	{id = 2003, name = --[[!AUTO_154]]"梅关古道", color=0xBE4800},
	{id = 2004, name = --[[!AUTO_155]]"衡山城", color=0xBE4800},
	{id = 2005, name = --[[!AUTO_156]]"药王谷", color=0xBE4800},
	{id = 2006, name = --[[!AUTO_157]]"洛阳城", color=0xBE4800},
	{id = 2007, name = --[[!AUTO_158]]"西安城", color=0xBE4800},
	{id = 2008, name = --[[!AUTO_159]]"桃花岛", color=0xBE4800},
	{id = 2009, name = --[[!AUTO_160]]"大理城", color=0xBE4800},
	{id = 2010, name = --[[!AUTO_161]]"北京城", color=0xBE4800},
	{id = 2011, name = --[[!AUTO_162]]"武当山", color=0xBE4800},
	{id = 2012, name = --[[!AUTO_163]]"华山", color=0xBE4800},
	{id = 2013, name = --[[!AUTO_164]]"少室山", color=0xBE4800},
	{id = 2014, name = --[[!AUTO_165]]"嵩山", color=0xBE4800},
	{id = 2015, name = --[[!AUTO_166]]"仙愁峡", color=0xBE4800},
	{id = 2016, name = --[[!AUTO_167]]"余杭", color=0xBE4800},
	{id = 2017, name = --[[!AUTO_168]]"杭州城", color=0xBE4800},
	{id = 2018, name = --[[!AUTO_169]]"仙霞岭", color=0xBE4800},
	{id = 2019, name = --[[!AUTO_170]]"廿八铺", color=0xBE4800},
	{id = 2020, name = --[[!AUTO_171]]"铸剑谷", color=0xBE4800},
	{id = 2021, name = --[[!AUTO_172]]"龙泉", color=0xBE4800},
	{id = 2022, name = --[[!AUTO_173]]"横屿滩", color=0xBE4800},
	{id = 2023, name = --[[!AUTO_174]]"南疆", color=0xBE4800},
	{id = 2024, name = --[[!AUTO_175]]"剑阁", color=0xBE4800},
	{id = 2025, name = --[[!AUTO_176]]"青城山", color=0xBE4800},
	{id = 2026, name = --[[!AUTO_177]]"乐山", color=0xBE4800},
	{id = 2027, name = --[[!AUTO_178]]"蜀南竹海", color=0xBE4800},
	{id = 2028, name = --[[!AUTO_179]]"平凉", color=0xBE4800},
	{id = 2029, name = --[[!AUTO_180]]"恒山", color=0xBE4800},
	{id = 2030, name = --[[!AUTO_181]]"朱仙镇", color=0xBE4800},
	{id = 2031, name = --[[!AUTO_182]]"五霸岗", color=0xBE4800},
	{id = 2032, name = --[[!AUTO_183]]"泰山", color=0xBE4800},
	{id = 2033, name = --[[!AUTO_184]]"黑木崖", color=0xBE4800},
	{id = 2034, name = --[[!AUTO_185]]"桂林", color=0xBE4800},
	{id = 2035, name = --[[!AUTO_186]]"敦煌", color=0xBE4800},
	{id = 2036, name = --[[!AUTO_187]]"山海关", color=0xBE4800},
	{id = 2037, name = --[[!AUTO_188]]"长白山", color=0xBE4800},
	{id = 2038, name = --[[!AUTO_189]]"琉球", color=0xBE4800},
	{id = 2039, name = --[[!AUTO_190]]"楼兰", color=0xBE4800},
	{id = 2040, name = --[[!AUTO_191]]"戈壁", color=0xBE4800},
	{id = 2041, name = --[[!AUTO_192]]"悦来客栈", color=0xBE4800},
	{id = 2042, name = --[[!AUTO_193]]"阴山草原", color=0xBE4800},
	{id = 2043, name = --[[!AUTO_194]]"蒙古草原", color=0xBE4800},
	{id = 3001, name = --[[!AUTO_195]]"药王秘洞", color=0xBE4800},
	{id = 3002, name = --[[!AUTO_196]]"梅庄地牢", color=0xBE4800},
	{id = 3003, name = --[[!AUTO_197]]"献王墓", color=0xBE4800},
	{id = 3004, name = --[[!AUTO_198]]"木人巷", color=0xBE4800},
	{id = 4001, name = --[[!AUTO_199]]"战场", color=0xBE4800},
	{id = 501, name = --[[!AUTO_200]]"少林寺", color=0xBE4800},
	{id = 502, name = --[[!AUTO_201]]"武当派", color=0xBE4800},
	{id = 503, name = --[[!AUTO_202]]"华山派", color=0xBE4800},
	{id = 504, name = --[[!AUTO_203]]"恒山派", color=0xBE4800},
	{id = 505, name = --[[!AUTO_204]]"衡山派", color=0xBE4800},
	{id = 506, name = --[[!AUTO_205]]"日月神教", color=0xBE4800},
	{id = 507, name = --[[!AUTO_206]]"五仙教", color=0xBE4800},
	{id = 508, name = --[[!AUTO_207]]"逍遥派", color=0xBE4800},
	{id = 509, name = --[[!AUTO_208]]"唐门", color=0xBE4800},
	{id = 510, name = --[[!AUTO_209]]"峨嵋派", color=0xBE4800},
	{id = 601, name = --[[!AUTO_210]]"采集", color=0xBE4800},
	{id = 602, name = --[[!AUTO_211]]"采矿", color=0xBE4800},
	{id = 603, name = --[[!AUTO_212]]"加工", color=0xBE4800},
	{id = 604, name = --[[!AUTO_213]]"铁匠", color=0xBE4800},
	{id = 605, name = --[[!AUTO_214]]"裁缝", color=0xBE4800},
	{id = 606, name = --[[!AUTO_215]]"巧匠", color=0xBE4800},
	{id = 607, name = --[[!AUTO_216]]"制药", color=0xBE4800},
	{id = 608, name = --[[!AUTO_217]]"烹饪", color=0xBE4800},
	{id = 609, name = --[[!AUTO_218]]"木匠", color=0xBE4800},
	{id = 611, name = --[[!AUTO_219]]"生技", color=0xBE4800},
	{id = 5500, name = --[[!AUTO_220]]"门派战斗", color=0xBE4800},
	{id = 5501, name = --[[!AUTO_221]]"少林战", color=0xBE4800},
	{id = 5502, name = --[[!AUTO_222]]"武当战", color=0xBE4800},
	{id = 5503, name = --[[!AUTO_223]]"华山战", color=0xBE4800},
	{id = 5504, name = --[[!AUTO_224]]"恒山战", color=0xBE4800},
	{id = 5505, name = --[[!AUTO_225]]"衡山战", color=0xBE4800},
	{id = 5506, name = --[[!AUTO_226]]"日月战", color=0xBE4800},
	{id = 5507, name = --[[!AUTO_227]]"五仙战", color=0xBE4800},
	{id = 5508, name = --[[!AUTO_228]]"逍遥战", color=0xBE4800},
	{id = 5509, name = --[[!AUTO_229]]"唐门战", color=0xBE4800},
	{id = 5510, name = --[[!AUTO_230]]"峨嵋战", color=0xBE4800},
	{id = 6600, name = --[[!AUTO_231]]"门徒", color=0xBE4800},
	{id = 6601, name = --[[!AUTO_232]]"少林门徒", color=0xBE4800},
	{id = 6602, name = --[[!AUTO_233]]"武当门徒", color=0xBE4800},
	{id = 6603, name = --[[!AUTO_234]]"华山门徒", color=0xBE4800},
	{id = 6604, name = --[[!AUTO_235]]"恒山门徒", color=0xBE4800},
	{id = 6605, name = --[[!AUTO_236]]"衡山门徒", color=0xBE4800},
	{id = 6606, name = --[[!AUTO_237]]"日月门徒", color=0xBE4800},
	{id = 6607, name = --[[!AUTO_238]]"五仙门徒", color=0xBE4800},
	{id = 6608, name = --[[!AUTO_239]]"逍遥门徒", color=0xBE4800},
	{id = 6609, name = --[[!AUTO_240]]"唐门门徒", color=0xBE4800},
	{id = 6610, name = --[[!AUTO_241]]"峨嵋门徒", color=0xBE4800},
	{id = 701, name = --[[!AUTO_242]]"镖局", color=0xBE4800},
	{id = 702, name = --[[!AUTO_243]]"马帮", color=0xBE4800},
	{id = 703, name = --[[!AUTO_244]]"山寨", color=0xBE4800},
	{id = 704, name = --[[!AUTO_245]]"工坊", color=0xBE4800},
	{id = 0, name = --[[!AUTO_246]]"测试", color=0x004DA4},
	{id = 65536, name = --[[!AUTO_247]]"帮助", color=0x07550D},
	{id = 20121221, name = --[[!AUTO_248]]"隐藏", color=0x07550D},
}

--剧情分类列表，元素顺序决定显示顺序，任务模板记录id
TaskHelp.storyTypeList =
{
	{id = -1, name = --[[!AUTO_249]]"分类未定义", color=0xBE4800},
	{id=0, name=--[[!AUTO_250]]"<无>", color=0xBE4800},
	{id=1, name=--[[!AUTO_251]]"正传", color=0xBE4800},	-- 主线
	{id=1001, name=--[[!AUTO_252]]"门派", color=0xBE4800},
	{id=2, name=--[[!AUTO_253]]"外传", color=0xBE4800},
	{id=1002, name=--[[!AUTO_254]]"副本", color=0xBE4800},
	{id=1003, name=--[[!AUTO_255]]"奇遇", color=0xBE4800},
	{id=1004, name=--[[!AUTO_256]]"活动", color=0xBE4800},
	{id=1005, name=--[[!AUTO_257]]"生活", color=0xBE4800},
	{id=1006, name=--[[!AUTO_258]]"江湖榜", color=0xBE4800},
	{id=1007, name=--[[!AUTO_259]]"帮派", color=0xBE4800},
	{id=1008, name=--[[!AUTO_260]]"知己", color=0xBE4800},
}

-- 物品类型列表，元素顺序决定显示顺序，任务模板列表id
TaskHelp.ivtrItemTypeList =
{
	{id=0, name=--[[!AUTO_261]]""},		--对应的 ICID_EQUIPBASE 不会被创建
--[[	--考虑到误操作的可能性，暂时屏蔽无需求的物品类型
	{id=1, name="装备"},
	{id=2, name="材料"},
	{id=3, name="药品"},
	{id=4, name="复活卷轴"},
	{id=5, name="技能书"},
	{id=6, name="回城卷轴"},
	{id=7, name="任务物品"},
	{id=8, name="镶嵌石"},
	{id=9, name="属性石"},
	{id=10, name="附魔石"},

	{id=11, name="任务随机发生器"},
	{id=12, name="任务普通物品"},
	{id=13, name="错误物品"},
	--{id=14, name=""},		--ICID_GM_GENERATOR
	{id=15, name="配方"},
	{id=16, name="烟花"},
	{id=17, name="精炼概率调整道具"},
	{id=18, name="配方卷轴"},
	{id=19, name="传送卷轴"},
	{id=20, name="替身娃娃"},

	{id=21, name="双倍经验"},
	{id=22, name="正在销毁中的物品"},
	{id=23, name="技能物品"},
	{id=24, name="交通工具"},
	{id=25, name="夫妻同心结"},
	{id=26, name="彩票"},
	{id=27, name="录像道具"},
	{id=28, name="文字烟花"},
	{id=29, name="法宝相关"},

	{id=30, name="法宝相关1"},
	{id=31, name="法宝相关2"},
	{id=32, name="法宝相关3"},
	{id=33, name="喇叭"},
	{id=34, name="职业升级数据"},
	{id=35, name="传送旗"},
	{id=36, name="怪物控制卷轴"},
	{id=37, name="马具"},
	{id=38, name="宠物牌"},
	{id=39, name="宠物技能书"},

	{id=40, name="宠物技能药品"},
	{id=41, name="宠物洗点符"},
	{id=42, name="宠物加点药"},
	{id=43, name="宠物概率调整道具"},
	{id=44, name="普通物品"},
	{id=45, name="任务物品发生器"},
	{id=46, name="宠物通用药品"},
	{id=47, name="礼物"},
	{id=48, name="鉴定卷轴"},
	{id=49, name="召怪物品"},

	{id=50, name="种子"},
	{id=51, name="幼仔"},
	{id=52, name="请帖"},
	{id=53, name="包裹扩充"},
	{id=54, name="鉴定过的藏宝图"},
	{id=55, name="藏宝图碎片"},
	{id=56, name="场景专用物品"},
	{id=57, name="仆人"},
	{id=58, name="装备打孔道具"},
	{id=59, name="装备镶嵌道具"},

	{id=60, name="口供道具"},
	{id=61, name="劫镖所得货物"},
	{id=62, name="消息推导游戏所用消息"},
	{id=63, name="特殊强化升级道具"},
	{id=64, name="运劫镖道具"},
	{id=65, name="下毒道具"},
	{id=66, name="设置陷阱道具"},
	{id=67, name="藏宝阁道具"},
	{id=68, name="易容"},
	{id=69, name="藏宝阁机关"},

	{id=70, name="藏宝图碎片"},
	{id=71, name="宝石合成符道具"},
	{id=72, name="生产技能升级道具"},
	{id=73, name="宠物召唤道具"},
	{id=74, name="宠物洗髓道具"},
	{id=75, name="徽章道具"},
]]
	{id=76, name=--[[!AUTO_262]]"侦破线索"},
}

--追踪方式列表，元素顺序决定显示顺序，任务模板记录id
TaskHelp.trackTypeList =
{
	{id=0, name=--[[!AUTO_263]]"普通"},
	{id=1, name=--[[!AUTO_264]]"隐藏(未实现)"},
	{id=1001, name=--[[!AUTO_265]]"犯罪现场系列专用"},
	{id=1002, name=--[[!AUTO_266]]"侦破任务"},
	{id=1003, name=--[[!AUTO_267]]"侦破结局任务"},
}

--开场白等颜色替换符号, #1 用于颜色代码, #2 用于生成链接颜色
TaskHelp.Color =
{
	["@A@"] = {--[[!AUTO_268]]"^ffffff"},
	["@B@"] = {--[[!AUTO_269]]"^ffffff"},
	["@C@"] = {--[[!AUTO_270]]"^ffffff"},
	["@D@"] = {--[[!AUTO_271]]"^ffffff"},
	["@E@"] = {--[[!AUTO_272]]"^ffffff"},
	["@F@"] = {--[[!AUTO_273]]"^ffffff"},
	["@G@"] = {--[[!AUTO_274]]"^ffffff"},
	["@H@"] = {--[[!AUTO_275]]"^ffffff"},
	["@I@"] = {--[[!AUTO_276]]"^ffffff"},
	["@J@"] = {--[[!AUTO_277]]"^ffffff"},
	["@K@"] = {--[[!AUTO_278]]"^ffffff"},
	["@L@"] = {--[[!AUTO_279]]"^ffffff"},
	["@M@"] = {--[[!AUTO_280]]"^ffffff"},
	["@N@"] = {--[[!AUTO_281]]"^ffffff"},
	["@O@"] = {--[[!AUTO_282]]"^ffffff"},
	["@P@"] = {--[[!AUTO_283]]"^ffffff"},
	["@Q@"] = {--[[!AUTO_284]]"^ffffff"},
	["@R@"] = {--[[!AUTO_285]]"^ffffff"},
	["@S@"] = {--[[!AUTO_286]]"^ffffff"},
	["@T@"] = {--[[!AUTO_287]]"^ffffff"},
	["@U@"] = {--[[!AUTO_288]]"^ffffff"},
	["@V@"] = {--[[!AUTO_289]]"^ffffff"},
	["@W@"] = {--[[!AUTO_290]]"^ffffff"},
	["@X@"] = {--[[!AUTO_291]]"^ffffff"},
	["@Y@"] = {--[[!AUTO_292]]"^ffffff"},
	["@Z@"] = {--[[!AUTO_293]]"^ffffff"},
	[--[[!]]"@怪物名@"] = {--[[!AUTO_294]]""},
	[--[[!]]"@任务名@"] = {--[[!AUTO_295]]"^ffdc8a", --[[!AUTO_296]]"0xffdc8a"},			--任务推荐等级
--~ 	["@主线任务名@"] = {"^e08038", "0xe08038"},		--TaskColor::MAIN_STORY
	[--[[!]]"@主线任务名@"] = {--[[!AUTO_297]]"^ffdc8a", --[[!AUTO_298]]"0xffdc8a"},		--TaskColor::MAIN_STORY
	[--[[!]]"@包裹满@"] = {--[[!AUTO_299]]"^ff9494"},			--包裹满
	[--[[!]]"@任务完成状态@"] = {--[[!AUTO_300]]"^90ee57"},		--“完成”字样
	[--[[!]]"@提示可接任务@"] = {--[[!AUTO_301]]"^ffdc8a"},		--“可接”字样
	[--[[!]]"@地图名@"] = {--[[!AUTO_302]]"^ffffff"},
	[--[[!]]"@区域名@"] = {--[[!AUTO_303]]"^ffffff"},
	[--[[!]]"@NPC名@"] = {--[[!AUTO_304]]""},
	[--[[!]]"@计数@"] = {--[[!AUTO_305]]"^ffffff"},
	[--[[!]]"@已完成@"] = {--[[!AUTO_306]]"^ffffff"},
	[--[[!]]"@物品名@"] = {--[[!AUTO_307]]""},
	[--[[!]]"@未完成@"] = {--[[!AUTO_308]]"^ffffff"},
	[--[[!]]"@人物等级@"] = {--[[!AUTO_309]]"^ff9494"},			--任务所需人物等级不满足
	[--[[!]]"@人物等级满足@"] = {--[[!AUTO_310]]"^94ff94"},		--任务所需人物等级满足
	[--[[!]]"@任务限制@"] = {--[[!AUTO_311]]"^ffffff"},
	[--[[!]]"@警告@"] = {--[[!AUTO_312]]"^ff0000"},			--任务警告
	[--[[!]]"@寻径@"] = {--[[!AUTO_313]]"0xffc000",--[[!AUTO_314]]"^ffc000"},		--寻径坐标
	[--[[!]]"@寻径2@"] = {--[[!AUTO_315]]"0x0059ab",--[[!AUTO_316]]"^0059ab"},		--寻径坐标2
	[--[[!]]"@粉红@"] = {--[[!AUTO_317]]"^ffffff"},
	[--[[!]]"@白色@"] = {--[[!AUTO_318]]"^ffffff"},
	[--[[!]]"@namelink@"] = {--[[!AUTO_319]]"^2"},			--namelink颜色定义，未知用途
	[--[[!]]"@标准@"] = {--[[!AUTO_320]]"^ffffff"},
	[--[[!]]"@黑色@"] = {--[[!AUTO_321]]"1c130d",--[[!AUTO_322]]"^1c130d"},
	--[[
	["@A@"] = {"^c6c5c5"},
	["@B@"] = {"^c6c5c5"},
	["@C@"] = {"^c6c5c5"},
	["@D@"] = {"^c6c5c5"},
	["@E@"] = {"^e1620d"},				--敌对文本 棕红
	["@F@"] = {"^0080ff"},				--功能文本 深蓝
	["@G@"] = {"^c6c5c5"},
	["@H@"] = {"^c6c5c5"},
	["@I@"] = {"^d8b861"},				--重点文本 浅黄
	["@J@"] = {"^c6c5c5"},
	["@K@"] = {"^c6c5c5"},
	["@L@"] = {"^c6c5c5"},
	["@M@"] = {"^c6c5c5"},
	["@N@"] = {"^c6c5c5"},
	["@O@"] = {"^c6c5c5"},
	["@P@"] = {"^c6c5c5"},
	["@Q@"] = {"^c6c5c5"},
	["@R@"] = {"^c6c5c5"},
	["@S@"] = {"^cccccc"},  			--标准文本 暗白
	["@T@"] = {"^b4d043"},				--地名文本 淡绿
	["@U@"] = {"^c6c5c5"},
	["@V@"] = {"^c6c5c5"},
	["@W@"] = {"^c6c5c5"},
	["@X@"] = {"^c6c5c5"},
	["@Y@"] = {"^c6c5c5"},
	["@Z@"] = {"^c6c5c5"},
	["@怪物名@"] = {""},
	["@任务名@"] = {"^ffe3a1"},			--任务推荐等级
	["@包裹满@"] = {"^ff0000"},			--包裹满
	["@任务完成状态@"] = {"^90ee57"},		--“完成”字样
	["@提示可接任务@"] = {"^90ee57"},		--“可接”字样
	["@地图名@"] = {"^b4d043"},			--（未用）
	["@区域名@"] = {"^b4d043"},			--区域名称 淡绿
	["@NPC名@"] = {""},
	["@计数@"] = {"^ff8080"},			--杀怪收集物品计数
	["@已完成@"] = {"^ffffff"},			--任务完成底色
	["@物品名@"] = {""},
	["@未完成@"] = {"^cccccc"},			--任务未完成底色
	["@人物等级@"] = {"^ff9494"},			--任务所需人物等级
	["@人物等级满足@"] = {"^94ff94"},			--任务所需人物等级
	["@任务限制@"] = {"^ffffff"},			--任务限制条件底色
	["@警告@"] = {"^ff0000"},			--任务条件限制中的重点文本
	["@寻径@"] = {"0x8db8f3","^8db8f3"},		--寻径坐标
	["@粉红@"] = {"^ff7da8"},
	["@白色@"] = {"^ffffff"},
	["@namelink@"] = {"^2"},			--namelink颜色定义
	["@标准@"] = {"^cccccc"},
	["@黑色@"] = {"1c130d","^1c130d"},
	]]
}

--场景名称列表
TaskHelp.Scene =
{
--脚本拷到此后
[1] = "测试新手村",
[2] = "福州城",
[3] = "梅关古道",
[4] = "衡山城郊外",
[5] = "衡山派",
[6] = "武当派",
[7] = "北邙",
[8] = "西安",
[9] = "华山",
[10] = "华山派",
[11] = "药王谷",
[12] = "老洛阳",
[13] = "少室山",
[14] = "嵩山",
[15] = "少林寺",
[16] = "仙愁峡",
[17] = "余杭",
[18] = "逍遥派",
[19] = "仙霞岭",
[20] = "廿八铺",
[21] = "铸剑谷",
[22] = "龙泉",
[23] = "横屿滩",
[24] = "杭州",
[25] = "南疆",
[26] = "五仙教",
[27] = "大理",
[28] = "剑阁",
[29] = "青城山",
[30] = "乐山",
[31] = "峨嵋派",
[32] = "蜀南竹海",
[33] = "老唐门",
[34] = "平凉（旧）",
[35] = "恒山",
[36] = "老恒山派",
[37] = "朱仙镇",
[38] = "五霸岗",
[39] = "泰山",
[40] = "京师",
[41] = "黑木崖",
[42] = "日月神教",
[43] = "桂林",
[44] = "敦煌（旧）",
[45] = "山海关",
[46] = "长白山",
[47] = "火焰山",
[48] = "西域城市",
[49] = "戈壁",
[50] = "桃花岛",
[51] = "少室山脚",
[52] = "逍遥近郊",
[53] = "天山",
[54] = "临江镇",
[55] = "洛阳城",
[56] = "蒙古草原",
[57] = "擂台",
[58] = "市场",
[59] = "客栈",
[60] = "阴山草原（旧）",
[61] = "惊蛰城",
[62] = "云中谷",
[63] = "黑木崖",
[64] = "碧水江",
[65] = "衡山城",
[1001] = "绿竹巷",
[1002] = "蝴蝶洞穴",
[1003] = "少林秘境",
[1004] = "梅庄地牢",
[1005] = "新绿竹巷",
[1006] = "灭门",
[1007] = "授谱",
[1008] = "雨夜",
[1009] = "换血",
[1010] = "联手",
[1011] = "救尼",
[1012] = "梅庄地牢",
[1013] = "梅庄地牢",
[1014] = "梅庄地牢",
[1015] = "还阳轩",
[1016] = "活动用绿竹巷",
[1017] = "战场",
[1018] = "PVP教程模式",
[1019] = "战场",
[1020] = "结婚礼堂",
[1021] = "聚贤楼",
[1022] = "千秋美酒",

[1101] = "[挑战]余人豪",
[1102] = "[挑战]曲非烟",
[1301] = "唐门秘境",
[1302] = "峨眉秘境",
[1303] = "逍遥秘境",
[1304] = "衡山秘境",
[1305] = "恒山秘境",
[1306] = "五仙秘境",
[1307] = "日月秘境",
[1308] = "武当秘境",
[1309] = "华山秘境",
[2001] = "少林后院",
[2003] = "万兽谷",
[2004] = "聚贤庄",
[2005] = "墓穴一层",
[2006] = "墓穴二层",
[2007] = "墓穴三层",
[2011] = "剑冢一层",
[2012] = "剑冢二层",
[2013] = "剑冢三层",
[2014] = "剑冢四层",
[2015] = "剑冢五层",
[3001] = "家园",
[1024] = "聚贤塔",
[1025] = "街市",
[1026] = "帮派（镖局）",
[1027] = "帮派（马帮）",
[1028] = "帮派（山寨)",
[1029] = "帮派（工坊）",
[1030] = "荒火圣殿",
[1031] = "横屿滩副本",
[1032] = "武林盟主战",
[1033] = "城郊农田",
[1034] = "马戏团竞技场",
[1035] = "夜临江",
[1036] = "鬼府灵台",
[1203] = "评书副本 青城",
[66] = "少林寺",
[67] = "衡山城",
[1037] = "联手-产品展示",
[1038] = "梅寨聚义厅",
[1039] = "新梅庄地牢",
[1040] = "大理围攻",
[1041] = "盗墓曲谱",
[68] = "福州城",
[1042] = "副本图_授谱2012",
[69] = "武当山",
[1204] = "关卡入口客栈",
[70] = "衡山城回雁楼室内",
[1205] = "[剧]-衡山支线01",
[1206] = "衡山城·30年前",
[1207] = "[剧]-衡山支线03",
[1208] = "[剧]-衡山支线04",
[1209] = "[剧]-衡山相位-酒楼",
[1210] = "[剧]-衡山相位-洗手",
[1211] = "[剧]-武当-摆阵",
[1212] = "[剧]-武当-剑魔秘洞",
[1213] = "[剧]-武当-成不忧之死",
[1214] = "[剧]-武当-思过崖心魔",
[1043] = "帮派_寻宝副本1",
[1044] = "帮派_寻宝副本2",
[1045] = "帮派_寻宝副本3",
[1046] = "帮派_寻宝副本4",
[1047] = "帮派_寻宝副本5",
[1048] = "独孤求拜副本",
[1049] = "专家副本-无尽逍遥",
[71] = "药王谷",
[1050] = "帮派_劫法场副本",
[1512] = "青城深渊",
[1215] = "[剧]-衡山相位-偷听",
[72] = "福州郊外",
[74] = "华山派",
[1216] = "[剧]-衡山城-茶馆",
[1217] = "[剧]-衡山城-房顶",
[1218] = "[剧]-衡山郊外-莲池",
[1219] = "[剧]-衡山郊外-贼寨",
[73] = "夜岚谷",
[1051] = "笑傲客栈",
[1220] = "[剧]-福州-激战",
[1221] = "[剧]-福州-黑衣恶徒",
[1222] = "[剧]-福州-密林劫匪",
[1223] = "[剧]-福州-狂傲剑客",
[1224] = "[剧]-福州-闻沧澜",
[1225] = "[剧]-福州-疯魔刀手",
[1226] = "[剧]-福州-左挺",
[1227] = "[剧]-福州-刘宁",
[1228] = "[剧]-福州-邓飞",
[75] = "洛阳城",
[76] = "华山",
[77] = "少室山",
[78] = "泰山",
[79] = "朱仙镇",
[1229] = "[剧]-成不忧之死",
[1230] = "[剧]-思过崖心魔",
[1231] = "[剧]少室山嵩阳书院",
[1232] = "[剧]少室山大佛",
[1233] = "[剧]-药王谷-柳诗诗",
[1234] = "[剧]-药王谷-林忍冬",
[1235] = "[剧]-药王谷菊花宝典",
[1236] = "[剧]-药王谷药王庙",
[1237] = "[剧]-药王谷林当归",
[1238] = "[剧]-洛阳绿竹巷",
[1239] = "[剧]-思过崖对抗",
[1240] = "教学副本-华山派-10级",
[1052] = "华山—还阳轩",
[1241] = "教学副本-华山派-20级",
[1310] = "思过崖秘洞",
[1242] = "教学副本-日月教-10级",
[1243] = "教学副本-日月教-20级",
[1514] = "郊外酒肆",
[1244] = "[剧]-泰山叛乱",
[1245] = "[剧]-朱仙镇换血",
[80] = "仙愁峡",
[81] = "五霸岗",
[82] = "余杭",
[83] = "仙霞岭",
[1246] = "新手村海上遇袭副本",
[1247] = "[剧]-五霸岗厨师",
[1248] = "[剧]-五霸岗猩猩",
[1515] = "海中孤岛",
[2016] = "苦水沼泽上层",
[2017] = "苦水沼泽下层",
[1249] = "教学副本-唐门-10级",
[1250] = "教学副本-唐门-20级",
[1251] = "教学副本-恒山-10级",
[1252] = "教学副本-恒山-20级",
[1516] = "湖心棋洲",
[84] = "铸剑谷",
[85] = "龙泉",
[86] = "南疆",
[1253] = "梅庄四友",
[1254] = "[活]资源保卫",
[1255] = "武尊堂",
[2018] = "空山堡垒上层",
[2019] = "空山堡垒下层",
[1256] = "[剧]-福州-屠村",
[1257] = "[剧]-福州-竹林",
[1258] = "[剧]-福州-剑涛",
[1259] = "[剧]-福州-约斗",
[1260] = "[剧]-福州-白塔",
[87] = "城市图_201211福州城",
[88] = "孤剑村",
[89] = "梅庄野外图",
[1517] = "帮派活动捕快",
[1261] = "劫持副本1-福州郊外",
[1262] = "劫持副本2-武当山脚",
[1263] = "劫持副本3-武当山脚",
[1264] = "[剧]-仙霞岭救尼",
[1265] = "[剧]-仙霞岭内奸",
[1053] = "201211笑傲客栈",
[1266] = "[剧]-仙愁峡-草亭",
[1267] = "[剧]-余杭-杀气",
[1268] = "[剧]-余杭-棋局",
[1269] = "[剧]-余杭-白鹭洲",
[1270] = "[剧]-剑魔冢",
[1271] = "[剧]-龙泉双煞",
[1272] = "[剧]-龙泉恩怨",
[1273] = "回忆中的孤剑村",
[1274] = "酒楼",
[1275] = "行船",
[1276] = "秘径",
[1277] = "教学副本-少林-10级",
[1278] = "教学副本-少林-20级",
[1279] = "教学副本-逍遥-10级",
[1280] = "教学副本-逍遥-20级",
[1281] = "教学副本-武当-10级",
[1282] = "教学副本-武当-20级",



[90] = "桂林",
[2020] = "野人峡谷上层",
[91] = "嘉州",
[1283] = "[剧]-新南疆斗法",
[1284] = "[剧]-新南疆高克新",
[1285] = "[剧]-桂林对歌",
[1286] = "[剧]-桂林殉情",
[1287] = "翻云滩决战",
[1054] = "副本新水下梅庄",
[2021] = "野人峡谷下层",
[1521] = "连云孤堡",
[2022] = "俺答汗陵上层",
[2023] = "俺答汗陵下层",
[92] = "2013回雁楼室内",
[1311] = "劫持副本-酒楼",
[1288] = "教学副本-衡山-10级",
[1289] = "教学副本-衡山-20级",
[1290] = "教学副本-五仙-10级",
[1291] = "教学副本-五仙-20级",
[1292] = "教学副本-峨眉-10级",
[1293] = "教学副本-峨眉-20级",
[1522] = "鱼池",
[93] = "恒山派",
[94] = "唐门",
[1294] = "[剧]-殴打老头子",
[1295] = "[剧]-五霸岗斗宝",
[1296] = "[剧]-五霸岗护送",
[1297] = "[剧]-衡山相位-大圣",
[1298] = "五霸寺",
[1299] = "[剧]-华山相位-点火退敌",
[95] = "擂台1",
[96] = "擂台2",
[97] = "擂台3",
[98] = "擂台4",
[99] = "擂台5",
[1600] = "[剧]-武当-杀许显纯",
[1523] = "皇陵迷宫",
[1524] = "沙漠迷城",
[1525] = "镇嵩宝塔",
[1601] = "[剧]-武当-跑圈",
[1602] = "[剧]-武当-阴谋阳谋",
[100] = "边境",
[1603] = "[剧]-铸剑谷-迷踪阵",
[1604] = "藏宝图-龙脉地宫",
[1605] = "[剧]-洛阳踢馆",
[1606] = "[绝]-雌雄大盗",
[101] = "青城山",
[102] = "西安",
[2024] = "苦水沼泽上层",
[2025] = "苦水沼泽上层",
[1526] = "绝情谷入口",
[1527] = "绝情谷深处",
[1528] = "绝情谷禁地",
[1607] = "[活]-福州-七夕田伯光",
[103] = "匹配竞技场",
[104] = "匹配血战场",
[105] = "剑阁",
[1608] = "[剧]-踏破青山",
[1609] = "[剧]-情劫",
[1610] = "[剧]-激战木高峰",
[1611] = "[剧]-群雕之战",
[1612] = "[活]-铸剑谷-中秋贪吃兔",
[1613] = "[绝]-少室山-赴约",
[106] = "心形海岛",
[107] = "天下第一武道会",
[1530] = "港口",
[2026] = "心月岛",
[2027] = "心月岛",
[1531] = "嵩山之路",
[2028] = "苦水沼泽上层(深处)",
[2029] = "苦水沼泽下层(深处)",
[2030] = "野人峡谷上层(深处)",
[2031] = "野人峡谷下层(深处)",
[2032] = "康巴水寨上层(深处)",
[2033] = "康巴水寨下层(深处)",
[2034] = "俺答汗陵上层(深处)",
[2035] = "俺答汗陵下层(深处)",
[2036] = "失落古城上层(深处)",
[2037] = "失落古城下层(深处)",
[1056] = "迎春之城",
[1533] = "飘香水饺",
[1534] = "勇闯少林寺",
[108] = "平凉",
[109] = "阴山草原",

[1536] = "青城战场",
[1537] = "洛阳战场",
[110] = "敦煌",
[111] = "擂台",
[112] = "心月岛",
[1538] = "敦煌",
[1539] = "敦煌",
[1540] = "阴山草原",
[113] = "天下会",
[1541] = "真·武尊堂",
[114] = "番邦入侵",
[1542] = "峨眉山竞速",
[115] = "雪域",
[1543] = "长乐山",
[1544] = "工坊副本",
[1545] = "国庆活动蒙古入侵",
[1546] = "工坊库房",
[116] = "决战黑木崖",
[1548] = "刺杀黑衣人",
[1549] = "刺杀黑衣人",
[1550] = "刺杀黑衣人",
[1551] = "夜探福王府",
[123] = "蒙古草原",
[125] = "独孤",
[127] = "蓬莱仙岛",
[136] = "北斗峰",
[130] = "秦皇陵地宫一层",
[131] = "秦皇陵地宫二层",
[132] = "秦皇陵地宫三层",
[133] = "秦皇陵地宫四层",
[146] = "昆仑山",
[153] = "玲珑",
[156] = "冲盈大婚",
[172] = "东华",


[1055] = "珍兽岛",

--脚本拷到此前
}

--副本用途列表列表
TaskHelp.Instance =
{
--脚本拷到此后
[100] = {scene = 1006, entrtype = 0, entrid = 3259},
[101] = {scene = 1007, entrtype = 0, entrid = 14678},
[102] = {scene = 1008, entrtype = 0, entrid = 16025},
[103] = {scene = 1009, entrtype = 0, entrid = 14875},
[104] = {scene = 1010, entrtype = 0, entrid = 14744},
[587] = {scene = 2001, entrtype = 0, entrid = 3117},  --少林门派秘境配置 :副本id,场景id,传送npc的id
[588] = {scene = 1309, entrtype = 0, entrid = 9503}, --华山
[590] = {scene = 1308, entrtype = 0, entrid = 2725}, --武当
[591] = {scene = 1301, entrtype = 0, entrid = 9563}, --唐门
[592] = {scene = 1303, entrtype = 0, entrid = 3789}, --逍遥
[594] = {scene = 1302, entrtype = 0, entrid = 3816}, --峨嵋
[595] = {scene = 1307, entrtype = 0, entrid = 3807}, --日月
[596] = {scene = 1305, entrtype = 0, entrid = 3834}, --恒山
[597] = {scene = 1304, entrtype = 0, entrid = 3771}, --衡山
[593] = {scene = 1306, entrtype = 0, entrid = 9653}, --五仙

--[[
[9226] = {scene = 1003, entrtype = 0, entrid = 3117},
[17100] = {scene = 1003, entrtype = 0, entrid = 2725},
[17101] = {scene = 1003, entrtype = 0, entrid = 3780},
[17108] = {scene = 1003, entrtype = 0, entrid = 3771},
[17107] = {scene = 1003, entrtype = 0, entrid = 3834},
[17106] = {scene = 1003, entrtype = 0, entrid = 3807},
[17103] = {scene = 1003, entrtype = 0, entrid = 3825},
[17104] = {scene = 1003, entrtype = 0, entrid = 3789},
[17102] = {scene = 1003, entrtype = 0, entrid = 3798},
[17105] = {scene = 1003, entrtype = 0, entrid = 3816},
]]--
--脚本拷到此前
}

--[[ idEvent:
38: EVENT_ACCEPTING_TASK,	//正要接任务
39: EVENT_TASK_FAIL, 		//任务失败或放弃
21:	EVENT_TASK_GAIN,		//接到任务
22:	EVENT_TASK_FINISH,		//任务目标完成
23:	EVENT_TASK_COMPLETE,    //任务完成
24:	EVENT_DELVTASK_TALK,	//NPC接任务对话
25:	EVENT_NPCTASK_TALK,		//NPC与任务NPC对话
26:	EVENT_AWARDTASK_TALK,	//NPC交任务对话
--]]

--召唤NPC任务及事件表
TaskHelp.NpcBeckon =
{
	--tskevt：任务事件
	--	EventType.EVENT_TASK_GAIN，接收
	--	EventType.EVENT_TASK_FINISH，满足条件
	--	EventType.EVENT_TASK_COMPLETE，完成

	--bckontype：召唤类型
	--	1，召出
	--	2，召回

	--bckonnpc：本地NPCID，见npc_beckon.lua
	[162] = {tskevt = EventType.EVENT_TASK_GAIN , bckontpy = 1, bckonnpc = 7},
	[164] = {tskevt = EventType.EVENT_TASK_FINISH , bckontpy = 1, bckonnpc = 7},
	[467] = {tskevt = EventType.EVENT_TASK_FINISH , bckontpy = 1, bckonnpc = 7},
}

-------------------------------------------------
--任务事件配置表
--表格填写样式
--TaskHelp.TaskConfigs[任务ID]
--{
--	[EventType.EVENT_TASK_GAIN]     = {}   接任务事件
--	[EventType.EVENT_TASK_FINISH]   = {}   达成任务条件事件
--	[EventType.EVENT_TASK_COMPLETE] = {}   完成任务事件
--	[EventType.EVENT_DELVTASK_TALK] = {}   结束与NPC对话事件
--	[EventType.EVENT_NPCTASK_TALK]  = {}   与NPC开始对话事件
--  表内详细参考下面例子
--}

TaskHelp.TaskConfigs[163] =   --看石头
{
	[EventType.EVENT_NPCTASK_TALK] = {UI = --[[!AUTO_624]]"", CG = 101, MovePath = 0, },
}
TaskHelp.TaskConfigs[166] =   --曲洋对话
{
	[EventType.EVENT_NPCTASK_TALK] = {UI = --[[!AUTO_625]]"", CG = 108, MovePath = 0, },
}
TaskHelp.TaskConfigs[162] =   --初入江湖
{
	[EventType.EVENT_DELVTASK_TALK] = {UI = --[[!AUTO_626]]"", CG = 102, MovePath = 0, },
}
TaskHelp.TaskConfigs[172] =   --风行草
{
	[EventType.EVENT_DELVTASK_TALK] = {UI = --[[!AUTO_627]]"", CG = 112, MovePath = 0, },
}
TaskHelp.TaskConfigs[168] =   --开启GameAI托管
{
	[EventType.EVENT_TASK_GAIN] = {UI = --[[!AUTO_628]]"", CG = 104, MovePath = 0, },
}
TaskHelp.TaskConfigs[183] =  --探索断桥
{
	[EventType.EVENT_TASK_COMPLETE] = {UI = --[[!AUTO_629]]"", CG = 110, MovePath = 0, },
}
TaskHelp.TaskConfigs[1325] =  --测试乘坐任务，进入绑定状态后自动寻径
{
	[EventType.EVENT_TASK_GAIN] = {UI = --[[!AUTO_630]]"", CG = 0, MovePath = 4679, },
}
TaskHelp.TaskConfigs[1449] =   --灭门剧情地图结尾
{
	[EventType.EVENT_TASK_COMPLETE] = {UI = --[[!AUTO_631]]"", CG = 120003, MovePath = 0, },
}
TaskHelp.TaskConfigs[1450] =  --福州剧情任务，进入绑定状态后自动寻径
{
	[EventType.EVENT_TASK_GAIN] = {UI = --[[!AUTO_632]]"", CG = 0, MovePath = 4913, },
}
TaskHelp.TaskConfigs[1452] =  --梅关剧情任务，进入绑定状态后自动寻径
{
	[EventType.EVENT_TASK_GAIN] = {UI = --[[!AUTO_633]]"", CG = 0, MovePath = 4914, },
}
TaskHelp.TaskConfigs[1621] =  --职业测试面板
{
	[EventType.EVENT_TASK_GAIN] = {UI = --[[!AUTO_634]]"UD_DesignProfGuide", CG = 0, MovePath = 0, },
}
TaskHelp.TaskConfigs[1736] =  --任务库一任务，进入绑定状态后自动寻径
{
	[EventType.EVENT_TASK_GAIN] = {UI = --[[!AUTO_635]]"", CG = 0, MovePath = 5111, },
}
TaskHelp.TaskConfigs[2129] =   --新身世1集结令
{
	[EventType.EVENT_TASK_GAIN] = {UI = --[[!AUTO_636]]"", CG = 19002, MovePath = 0, },
}
TaskHelp.TaskConfigs[2127] =   --新身世1放药
{
	[EventType.EVENT_TASK_FINISH] = {UI = --[[!AUTO_637]]"", CG = 19001, MovePath = 0, },
}
TaskHelp.TaskConfigs[2129] =   --新身世1放火
{
	[EventType.EVENT_TASK_FINISH] = {UI = --[[!AUTO_638]]"", CG = 19003, MovePath = 0, },
}
TaskHelp.TaskConfigs[2131] =   --任务接收CG
{
	[EventType.EVENT_TASK_GAIN] = {UI = --[[!AUTO_639]]"", CG = 19004, MovePath = 0, },
}
TaskHelp.TaskConfigs[2152] =  --任务库一任务，进入绑定状态后自动寻径
{
	[EventType.EVENT_TASK_GAIN] = {UI = --[[!AUTO_640]]"", CG = 0, MovePath = 5948, },
}
TaskHelp.TaskConfigs[2172] =   --华山入门
{
	[EventType.EVENT_TASK_GAIN] = {UI = --[[!AUTO_641]]"", CG = 20110506, MovePath = 0, },
}
TaskHelp.TaskConfigs[2191] =   --少林
{
	[EventType.EVENT_TASK_COMPLETE] = {UI = --[[!AUTO_642]]"", CG = 1501, MovePath = 0, },
}
TaskHelp.TaskConfigs[2225] =   --衡山
{
	[EventType.EVENT_TASK_COMPLETE] = {UI = --[[!AUTO_643]]"", CG = 501, MovePath = 0, },
}
TaskHelp.TaskConfigs[2242] =  --恒山
{
	[EventType.EVENT_TASK_COMPLETE] = {UI = --[[!AUTO_644]]"", CG = 36012, MovePath = 0, },
}
TaskHelp.TaskConfigs[2293] =   --逍遥
{
	[EventType.EVENT_TASK_COMPLETE] = {UI = --[[!AUTO_645]]"", CG = 1801, MovePath = 0, },
}
TaskHelp.TaskConfigs[2259] =   --峨嵋
{
	[EventType.EVENT_TASK_COMPLETE] = {UI = --[[!AUTO_646]]"", CG = 3101, MovePath = 0, },
}
TaskHelp.TaskConfigs[2310] =   --五仙
{
	[EventType.EVENT_TASK_COMPLETE] = {UI = --[[!AUTO_647]]"", CG = 2601, MovePath = 0, },
}
TaskHelp.TaskConfigs[2362] =   --灭门剧情地图1开场说话
{
	[EventType.EVENT_TASK_GAIN] = {UI = --[[!AUTO_648]]"", CG = 120001, MovePath = 0, },
}
TaskHelp.TaskConfigs[2363] =   --灭门剧情地图2血线
{
	[EventType.EVENT_TASK_GAIN] = {UI = --[[!AUTO_649]]"", CG = 120002, MovePath = 0, },
}
TaskHelp.TaskConfigs[3733] =   --东方不败新手剧情任务01选择
{
	[EventType.EVENT_TASK_FINISH] = {UI = --[[!AUTO_650]]"", CG = 40102, MovePath = 0, },
}
TaskHelp.TaskConfigs[2570] =   --东方不败新手剧情任务03
{
	[EventType.EVENT_TASK_FINISH] = {UI = --[[!AUTO_651]]"", CG = 40103, MovePath = 0, },
}
TaskHelp.TaskConfigs[2573] =   --东方不败新手剧情任务06
{
	[EventType.EVENT_TASK_FINISH] = {UI = --[[!AUTO_652]]"", CG = 40104, MovePath = 0, },
}
TaskHelp.TaskConfigs[2574] =   --东方不败新手剧情任务07
{
	[EventType.EVENT_TASK_FINISH] = {UI = --[[!AUTO_653]]"", CG = 40105, MovePath = 0, },
}
TaskHelp.TaskConfigs[2575] =   --东方不败新手剧情任务08
{
	[EventType.EVENT_TASK_FINISH] = {UI = --[[!AUTO_654]]"", CG = 40106, MovePath = 0, },
}
TaskHelp.TaskConfigs[2578] =   --东方不败新手剧情任务11
{
	[EventType.EVENT_TASK_FINISH] = {UI = --[[!AUTO_655]]"", CG = 40107, MovePath = 0, },
}
TaskHelp.TaskConfigs[2579] =   --东方不败新手剧情任务12
{
	[EventType.EVENT_TASK_FINISH] = {UI = --[[!AUTO_656]]"", CG = 40108, MovePath = 0, },
}
TaskHelp.TaskConfigs[2580] =   --东方不败新手剧情任务12
{
	[EventType.EVENT_TASK_FINISH] = {UI = --[[!AUTO_657]]"", CG = 40109, MovePath = 0, },
}
TaskHelp.TaskConfigs[2581] =  --东方不败新手剧情任务14
{
	[EventType.EVENT_TASK_GAIN] = {UI = --[[!AUTO_658]]"", CG = 0, MovePath = 7063, },	--东方剧情多人马车，绑定后寻径
}
TaskHelp.TaskConfigs[2582] =  --东方不败新手剧情任务15
{
	[EventType.EVENT_TASK_FINISH] = {UI = --[[!AUTO_659]]"", CG = 40130, MovePath = 0, },
}
TaskHelp.TaskConfigs[2583] =   --东方不败新手剧情任务16
{
	[EventType.EVENT_TASK_FINISH] = {UI = --[[!AUTO_660]]"", CG = 40111, MovePath = 0, },
}
TaskHelp.TaskConfigs[2584] =   --东方不败新手剧情任务17
{
	[EventType.EVENT_TASK_COMPLETE] = {UI = --[[!AUTO_661]]"", CG = 40112, MovePath = 0, },
}
TaskHelp.TaskConfigs[3087] =   --东方不败新手剧情任务18
{
	[EventType.EVENT_TASK_COMPLETE] = {UI = --[[!AUTO_662]]"", CG = 40113, MovePath = 0, },
}
TaskHelp.TaskConfigs[2586] =   --东方不败新手剧情任务19
{
	[EventType.EVENT_TASK_COMPLETE] = {UI = --[[!AUTO_663]]"", CG = 40114, MovePath = 0, },
}
TaskHelp.TaskConfigs[2588] =   --东方不败新手剧情任务21
{
	[EventType.EVENT_TASK_FINISH] = {UI = --[[!AUTO_664]]"", CG = 40115, MovePath = 0, },
}
TaskHelp.TaskConfigs[2589] =   --东方不败新手剧情任务22
{
	[EventType.EVENT_TASK_FINISH] = {UI = --[[!AUTO_665]]"", CG = 40116, MovePath = 0, },
}
TaskHelp.TaskConfigs[2592] =  --东方不败新手剧情任务25：杀掉杨莲慕
{
	[EventType.EVENT_TASK_FINISH] = {UI = --[[!AUTO_666]]"", CG = 40118, MovePath = 0, },
}
TaskHelp.TaskConfigs[2593] =  --东方不败新手剧情任务26，杀掉追兵3*2
{
	[EventType.EVENT_TASK_FINISH] = {UI = --[[!AUTO_667]]"", CG = 40117, MovePath = 0, },
}
TaskHelp.TaskConfigs[2595] =   --东方不败新手剧情任务28
{
	[EventType.EVENT_TASK_COMPLETE] = {UI = --[[!AUTO_668]]"", CG = 40119, MovePath = 0, },
}
TaskHelp.TaskConfigs[2597] =   --东方不败新手剧情任务30
{
	[EventType.EVENT_TASK_FINISH] = {UI = --[[!AUTO_669]]"", CG = 40120, MovePath = 0, },
}
TaskHelp.TaskConfigs[2599] =   --东方不败新手剧情任务32
{
	[EventType.EVENT_TASK_COMPLETE] = {UI = --[[!AUTO_670]]"", CG = 40121, MovePath = 0, },
}
TaskHelp.TaskConfigs[2600] =   --东方不败新手剧情任务33
{
	[EventType.EVENT_TASK_GAIN] = {UI = --[[!AUTO_671]]"", CG = 40128, MovePath = 0, },
}
TaskHelp.TaskConfigs[2602] =  --东方不败新手剧情任务35
{
	[EventType.EVENT_TASK_FINISH] = {UI = --[[!AUTO_672]]"", CG = 40122, MovePath = 0, },
}
TaskHelp.TaskConfigs[3089] =  --东方不败新手剧情任务35后
{
	[EventType.EVENT_TASK_FINISH] = {UI = --[[!AUTO_673]]"", CG = 40123, MovePath = 0, },
}
TaskHelp.TaskConfigs[2604] =   --东方不败新手剧情任务37
{
	[EventType.EVENT_TASK_FINISH] = {UI = --[[!AUTO_674]]"", CG = 40124, MovePath = 0, },
}
TaskHelp.TaskConfigs[2606] =  --东方不败新手剧情任务39
{
	[EventType.EVENT_TASK_FINISH] = {UI = --[[!AUTO_675]]"", CG = 40125, MovePath = 0, },
}
TaskHelp.TaskConfigs[2607] =   --东方不败新手剧情任务40
{
	[EventType.EVENT_TASK_FINISH] = {UI = --[[!AUTO_676]]"", CG = 40126, MovePath = 0, },
}
TaskHelp.TaskConfigs[2608] =  --宣传CG
{
	[EventType.EVENT_TASK_FINISH] = {UI = --[[!AUTO_677]]"", CG = 41010, MovePath = 0, },
}
TaskHelp.TaskConfigs[2609] =   --宣传CG
{
	[EventType.EVENT_TASK_FINISH] = {UI = --[[!AUTO_678]]"", CG = 40127, MovePath = 0, },
}
--TaskHelp.TaskConfigs[2809] =   --抓宠CG
--{
	--[EventType.EVENT_TASK_GAIN] = {UI = "", CG = 20110617, MovePath = 0, },
--}
TaskHelp.TaskConfigs[746] =   --2032泰山主线任务02，进入绑定状态后自动寻径
{
	[EventType.EVENT_TASK_GAIN] = {UI = --[[!AUTO_679]]"", CG = 0, MovePath = 7530, },
}
TaskHelp.TaskConfigs[972] =   --2043桂林主线2，进入绑定状态后自动寻径
{
	[EventType.EVENT_TASK_GAIN] = {UI = --[[!AUTO_680]]"", CG = 0, MovePath = 7550, },
}
TaskHelp.TaskConfigs[467] =   --2011武当山主线任务03
{
	[EventType.EVENT_TASK_COMPLETE] = {UI = --[[!AUTO_681]]"", CG = 70101, MovePath = 0, },
}
TaskHelp.TaskConfigs[3611] =   --2005药王谷支线任务05
{
	[EventType.EVENT_TASK_COMPLETE] = {UI = --[[!AUTO_682]]"", CG = 110101, MovePath = 0, },
}
TaskHelp.TaskConfigs[2844] =   --2013嵩山新主线1
{
	[EventType.EVENT_TASK_COMPLETE] = {UI = --[[!AUTO_683]]"", CG = 140101, MovePath = 0, },
}
TaskHelp.TaskConfigs[2943] =   --2018仙霞岭支线1
{
	[EventType.EVENT_TASK_COMPLETE] = {UI = --[[!AUTO_684]]"", CG = 190101, MovePath = 0, },
}
TaskHelp.TaskConfigs[2104] =   --乐山主线任务
{
	[EventType.EVENT_TASK_GAIN] = {UI = --[[!AUTO_685]]"", CG = 300101, MovePath = 0, },
}
TaskHelp.TaskConfigs[3693] =   --梅关新娘
{
	[EventType.EVENT_TASK_GAIN] = {UI = --[[!AUTO_686]]"", CG = 0, MovePath = 8466, },
}
TaskHelp.TaskConfigs[1452] =   --梅关镖车
{
	[EventType.EVENT_TASK_GAIN] = {UI = --[[!AUTO_687]]"", CG = 0, MovePath = 8465, },
}
TaskHelp.TaskConfigs[3987] =  --衡山支线任务，进入绑定状态后自动寻径
{
	[EventType.EVENT_TASK_GAIN] = {UI = --[[!AUTO_688]]"", CG = 0, MovePath = 11920, },
}
TaskHelp.TaskConfigs[4089] =   --新剧情新手村令狐冲登场
{
	[EventType.EVENT_TASK_COMPLETE] = {UI = --[[!AUTO_689]]"", CG = 400057, MovePath = 0, },
}
TaskHelp.TaskConfigs[4094] =   --新剧情新手村令狐冲豪饮
{
	[EventType.EVENT_TASK_COMPLETE] = {UI = --[[!AUTO_690]]"", CG = 400059, MovePath = 0, },
}
TaskHelp.TaskConfigs[4317] =   --新剧情新手村镖师遇袭
{
	[EventType.EVENT_ACCEPTING_TASK] = {UI = --[[!AUTO_691]]"", CG = 400060, MovePath = 0, },
}
TaskHelp.TaskConfigs[4407] =   --新剧情新手村曲洋登场
{
	[EventType.EVENT_ACCEPTING_TASK] = {UI = --[[!AUTO_692]]"", CG = 400061, MovePath = 0, },
}
TaskHelp.TaskConfigs[4106] =   --新剧情新手村图解江湖
{
	[EventType.EVENT_TASK_COMPLETE] = {UI = --[[!AUTO_693]]"", CG = 400062, MovePath = 0, },
}
TaskHelp.TaskConfigs[4109] =   --新剧情新手村轻功
{
	[EventType.EVENT_TASK_COMPLETE] = {UI = --[[!AUTO_694]]"", CG = 400063, MovePath = 0, },
}
TaskHelp.TaskConfigs[4117] =   --新剧情新手村援手
{
	[EventType.EVENT_TASK_FINISH] = {UI = --[[!AUTO_695]]"", CG = 400064, MovePath = 0, },
}
TaskHelp.TaskConfigs[4119] =   --新剧情新手村解围
{
	[EventType.EVENT_TASK_COMPLETE] = {UI = --[[!AUTO_696]]"", CG = 400065, MovePath = 0, },
}
TaskHelp.TaskConfigs[3881] =   --00新剧情主线武当025-大乐太和碑
{
	[EventType.EVENT_TASK_COMPLETE] = {UI = --[[!AUTO_697]]"", CG = 400085, MovePath = 0, },
}
TaskHelp.TaskConfigs[3882] =   --00新剧情主线武当026-青光利剑
{
	[EventType.EVENT_TASK_COMPLETE] = {UI = --[[!AUTO_698]]"", CG = 400089, MovePath = 0, },
}
TaskHelp.TaskConfigs[3883] =   --00新剧情主线武当024-紫薇软剑
{
	[EventType.EVENT_TASK_COMPLETE] = {UI = --[[!AUTO_699]]"", CG = 400090, MovePath = 0, },
}
TaskHelp.TaskConfigs[3884] =   --00新剧情主线武当028-玄铁重剑
{
	[EventType.EVENT_TASK_COMPLETE] = {UI = --[[!AUTO_700]]"", CG = 400091, MovePath = 0, },
}
TaskHelp.TaskConfigs[3885] =   --00新剧情主线武当029-孤独死去
{
	[EventType.EVENT_TASK_COMPLETE] = {UI = --[[!AUTO_701]]"", CG = 400092, MovePath = 0, },
}
      TaskHelp.TaskConfigs[3890] =   --00新剧情主线武当034-桃谷六仙载具
{
	[EventType.EVENT_ACCEPTING_TASK] = {UI = --[[!AUTO_702]]"", CG = 400096, MovePath = 0, },
}
TaskHelp.TaskConfigs[4099] =   --00新福州镖师遇袭
{
	[EventType.EVENT_TASK_COMPLETE] = {UI = --[[!AUTO_703]]"", CG = 400060, MovePath = 0, },
}
TaskHelp.TaskConfigs[3783] = --00新剧情主线衡山坐斗接任务播
{
	[EventType.EVENT_ACCEPTING_TASK] = {UI = --[[!AUTO_704]]"", CG = 400070, MovePath = 0, },
}
TaskHelp.TaskConfigs[4370] = --00新剧情华山传授
{
	[EventType.EVENT_TASK_GAIN] = {UI = --[[!AUTO_705]]"", CG = 400102, MovePath = 0, },
}
TaskHelp.TaskConfigs[4358] = --00新剧情武当传授
{
	[EventType.EVENT_TASK_GAIN] = {UI = --[[!AUTO_706]]"", CG = 400101, MovePath = 0, },
}
TaskHelp.TaskConfigs[4341] = --00新剧情日月传授
{
	[EventType.EVENT_TASK_GAIN] = {UI = --[[!AUTO_707]]"", CG = 400099, MovePath = 0, },
}
TaskHelp.TaskConfigs[4350] = --00新剧情唐门传授
{
	[EventType.EVENT_TASK_GAIN] = {UI = --[[!AUTO_708]]"", CG = 400100, MovePath = 0, },
}
TaskHelp.TaskConfigs[4596] = --00新剧情华山CG共飞
{
	[EventType.EVENT_TASK_GAIN] = {UI = --[[!AUTO_709]]"", CG = 400237, MovePath = 0, },
}
TaskHelp.TaskConfigs[5524] = --00新剧情华山桃谷六仙
{
	[EventType.EVENT_TASK_GAIN] = {UI = --[[!AUTO_710]]"", CG = 400137, MovePath = 0, },
}
TaskHelp.TaskConfigs[4977] = --五霸岗猴子抢帽子
{
	[EventType.EVENT_TASK_COMPLETE] = {UI = --[[!AUTO_711]]"", CG = 400148, MovePath = 0, },
}
TaskHelp.TaskConfigs[4999] = --五霸岗晚风亭
{
	[EventType.EVENT_TASK_COMPLETE] = {UI = --[[!AUTO_712]]"", CG = 400149, MovePath = 0, },
}
TaskHelp.TaskConfigs[4952] = --五霸岗丢炸弹红引线
{
	[EventType.EVENT_TASK_COMPLETE] = {UI = --[[!AUTO_713]]"", CG = 400147, MovePath = 0, },
}
TaskHelp.TaskConfigs[4942] = --五霸岗丢炸弹蓝引线
{
	[EventType.EVENT_TASK_COMPLETE] = {UI = --[[!AUTO_714]]"", CG = 400147, MovePath = 0, },
}
TaskHelp.TaskConfigs[5087] = --仗剑副本落水CG男
{
	[EventType.EVENT_TASK_COMPLETE] = {UI = --[[!AUTO_715]]"", CG = 400151, MovePath = 0, },
}
TaskHelp.TaskConfigs[5088] = --仗剑副本落水CG女
{
	[EventType.EVENT_TASK_COMPLETE] = {UI = --[[!AUTO_716]]"", CG = 400152, MovePath = 0, },
}
TaskHelp.TaskConfigs[5141] =  --00新剧情主线余杭22
{
	[EventType.EVENT_TASK_GAIN] = {UI = --[[!AUTO_717]]"", CG = 0, MovePath = 22847, },
}
TaskHelp.TaskConfigs[5299] =  --201211新剧情主线福州009+1以及比武大会令狐冲CG
{
	[EventType.EVENT_TASK_GAIN] = {UI = --[[!AUTO_718]]"", CG = 0, MovePath = 22580, },
        [EventType.EVENT_TASK_COMPLETE] = {UI = --[[!AUTO_719]]"", CG = 400180, MovePath = 0, },
}
TaskHelp.TaskConfigs[5223] =  --201211新剧情主线福州021+藏宝地显现
{
	[EventType.EVENT_TASK_COMPLETE] = {UI = --[[!AUTO_720]]"", CG = 400223, MovePath = 0, },
}
--TaskHelp.TaskConfigs[5228] =  --201211新剧情主线福州026+进入回忆
--{
--	[EventType.EVENT_TASK_FINISH] = {UI = "", CG = 400171, MovePath = 0, },
--}
TaskHelp.TaskConfigs[5449] =  --00新剧情主线南疆雪狼
{
	[EventType.EVENT_TASK_GAIN] = {UI = --[[!AUTO_721]]"", CG = 0, MovePath = 23356, },
}
TaskHelp.TaskConfigs[5441] =   --00新剧情桂林主线24，进入绑定状态后自动寻径
{
	[EventType.EVENT_TASK_GAIN] = {UI = "", CG = 0, MovePath = 23401, },
}
TaskHelp.TaskConfigs[8980] =   --00时装合成剧情暗夜18（曲非烟）
{
	[EventType.EVENT_TASK_FINISH] = {UI = "", CG = 400290, MovePath = 0, },
}
--TaskHelp.TaskConfigs[5246] =   --00新剧情获得大宗武学-少林
--{
--	[EventType.EVENT_TASK_GAIN] = {UI = "", CG = 400192, MovePath = 0 , },
--}
--TaskHelp.TaskConfigs[2197] =   --00新剧情获得专精1武学-少林
--{
--	[EventType.EVENT_TASK_GAIN] = {UI = "", CG = 400193, MovePath = 0 , },
--}
--TaskHelp.TaskConfigs[5071] =   --00新剧情获得专精2武学-少林
--{
--	[EventType.EVENT_TASK_GAIN] = {UI = "", CG = 400194, MovePath = 0 , },
--}
--TaskHelp.TaskConfigs[5249] =   --00新剧情获得大宗武学-武当
--{
--	[EventType.EVENT_TASK_GAIN] = {UI = "", CG = 400195, MovePath = 0 , },
--}
--TaskHelp.TaskConfigs[2214] =   --00新剧情获得专精1武学-武当
--{
--	[EventType.EVENT_TASK_GAIN] = {UI = "", CG = 400196, MovePath = 0 , },
--}
--TaskHelp.TaskConfigs[5072] =   --00新剧情获得专精2武学-武当
--{
--	[EventType.EVENT_TASK_GAIN] = {UI = "", CG = 400197, MovePath = 0 , },
--}
--TaskHelp.TaskConfigs[5252] =   --00新剧情获得大宗武学-华山
--{
--	[EventType.EVENT_TASK_GAIN] = {UI = "", CG = 400198, MovePath = 0 , },
--}
--TaskHelp.TaskConfigs[2172] =   --00新剧情获得专精1武学-华山
--{
--	[EventType.EVENT_TASK_GAIN] = {UI = "", CG = 400199, MovePath = 0 , },
--}
--TaskHelp.TaskConfigs[4806] =   --00新剧情获得专精2武学-华山
--{
--	[EventType.EVENT_TASK_GAIN] = {UI = "", CG = 400200, MovePath = 0 , },
--}
--TaskHelp.TaskConfigs[5261] =   --00新剧情获得大宗武学-恒山
--{
--	[EventType.EVENT_TASK_GAIN] = {UI = "", CG = 400201, MovePath = 0 , },
--}
--TaskHelp.TaskConfigs[2248] =   --00新剧情获得专精1武学-恒山
--{
--	[EventType.EVENT_TASK_GAIN] = {UI = "", CG = 400202, MovePath = 0 , },
--}
--TaskHelp.TaskConfigs[5074] =   --00新剧情获得专精2武学-恒山
--{
--	[EventType.EVENT_TASK_GAIN] = {UI = "", CG = 400203, MovePath = 0 , },
--}
--TaskHelp.TaskConfigs[5258] =   --00新剧情获得大宗武学-衡山
--{
--	[EventType.EVENT_TASK_GAIN] = {UI = "", CG = 400204, MovePath = 0 , },
--}
--TaskHelp.TaskConfigs[2231] =   --00新剧情获得专精1武学-衡山
--{
--	[EventType.EVENT_TASK_GAIN] = {UI = "", CG = 400205, MovePath = 0 , },
--}
--TaskHelp.TaskConfigs[5073] =   --00新剧情获得专精2武学-衡山
--{
--	[EventType.EVENT_TASK_GAIN] = {UI = "", CG = 400206, MovePath = 0 , },
--}
--TaskHelp.TaskConfigs[5237] =   --00新剧情获得大宗武学-日月
--{
--	[EventType.EVENT_TASK_GAIN] = {UI = "", CG = 400207, MovePath = 0 , },
--}
--TaskHelp.TaskConfigs[2333] =   --00新剧情获得专精1武学-日月
--{
--	[EventType.EVENT_TASK_GAIN] = {UI = "", CG = 400208, MovePath = 0 , },
--}
--TaskHelp.TaskConfigs[5054] =   --00新剧情获得专精2武学-日月
--{
--	[EventType.EVENT_TASK_GAIN] = {UI = "", CG = 400209, MovePath = 0 , },
--}
--TaskHelp.TaskConfigs[5240] =   --00新剧情获得大宗武学-五仙
--{
--	[EventType.EVENT_TASK_GAIN] = {UI = "", CG = 400210, MovePath = 0 , },
--}
--TaskHelp.TaskConfigs[2316] =   --00新剧情获得专精1武学-五仙
--{
--	[EventType.EVENT_TASK_GAIN] = {UI = "", CG = 400211, MovePath = 0 , },
--}
--TaskHelp.TaskConfigs[5075] =   --00新剧情获得专精2武学-五仙
--{
--	[EventType.EVENT_TASK_GAIN] = {UI = "", CG = 400212, MovePath = 0 , },
--}
--TaskHelp.TaskConfigs[5255] =   --00新剧情获得大宗武学-逍遥
--{
--	[EventType.EVENT_TASK_GAIN] = {UI = "", CG = 400213, MovePath = 0 , },
--}
--TaskHelp.TaskConfigs[2299] =   --00新剧情获得专精1武学-逍遥
--{
--	[EventType.EVENT_TASK_GAIN] = {UI = "", CG = 400214, MovePath = 0 , },
--}
--TaskHelp.TaskConfigs[5076] =   --00新剧情获得专精2武学-逍遥
--{
--	[EventType.EVENT_TASK_GAIN] = {UI = "", CG = 400215, MovePath = 0 , },
--}
--TaskHelp.TaskConfigs[5243] =   --00新剧情获得大宗武学-唐门
--{
--	[EventType.EVENT_TASK_GAIN] = {UI = "", CG = 400216, MovePath = 0 , },
--}
--TaskHelp.TaskConfigs[2282] =   --00新剧情获得专精1武学-唐门
--{
--	[EventType.EVENT_TASK_GAIN] = {UI = "", CG = 400217, MovePath = 0 , },
--}
--TaskHelp.TaskConfigs[5077] =   --00新剧情获得专精2武学-唐门
--{
--	[EventType.EVENT_TASK_GAIN] = {UI = "", CG = 400218, MovePath = 0 , },
--}
--TaskHelp.TaskConfigs[5264] =   --00新剧情获得大宗武学-峨眉
--{
--	[EventType.EVENT_TASK_GAIN] = {UI = "", CG = 400219, MovePath = 0 , },
--}
--TaskHelp.TaskConfigs[2265] =   --00新剧情获得专精1武学-峨眉
--{
--	[EventType.EVENT_TASK_GAIN] = {UI = "", CG = 400220, MovePath = 0 , },
--}
--TaskHelp.TaskConfigs[5078] =   --00新剧情获得专精2武学-峨眉
--{
--	[EventType.EVENT_TASK_GAIN] = {UI = "", CG = 400221, MovePath = 0 , },
--}
TaskHelp.TaskConfigs[4585] =   --00新剧情华山桃谷六仙载具任务
{
	[EventType.EVENT_TASK_GAIN] = {UI = --[[!AUTO_723]]"", CG = 0, MovePath = 23907 , },
}
TaskHelp.TaskConfigs[5566] =   --00新剧情新手村风筝任务
{
	[EventType.EVENT_TASK_COMPLETE] = {UI = --[[!AUTO_724]]"", CG = 400227, MovePath = 0 , },
}
--TaskHelp.TaskConfigs[5222] =   --孤剑村新手剧情藏宝图任务
--{
--	[EventType.EVENT_TASK_FINISH] = {UI = "Win_TreasureMap2_2", CG = 0, MovePath = 0 , },
--}
TaskHelp.TaskConfigs[5897] =   --00新剧情三仙支线余杭泛舟
{
	[EventType.EVENT_TASK_GAIN] = {UI = --[[!AUTO_725]]"", CG = 0, MovePath = 25163 , },
	[EventType.EVENT_TASK_RESET] = {UI = --[[!AUTO_726]]"", CG = 0, MovePath = 25163 , },
}
TaskHelp.TaskConfigs[6045] =   --00新剧情公交洛阳西北至东北
{
	[EventType.EVENT_TASK_GAIN] = {UI = --[[!AUTO_727]]"", CG = 0, MovePath = 25322 , },
}
TaskHelp.TaskConfigs[6046] =   --00新剧情公交洛阳西北至西南
{
	[EventType.EVENT_TASK_GAIN] = {UI = --[[!AUTO_728]]"", CG = 0, MovePath = 25369 , },
}
TaskHelp.TaskConfigs[6047] =   --00新剧情公交洛阳西北至东南
{
	[EventType.EVENT_TASK_GAIN] = {UI = --[[!AUTO_729]]"", CG = 0, MovePath = 25373 , },
}
TaskHelp.TaskConfigs[6066] =   --00新剧情公交洛阳东北至西北
{
	[EventType.EVENT_TASK_GAIN] = {UI = --[[!AUTO_730]]"", CG = 0, MovePath = 25374 , },
}
TaskHelp.TaskConfigs[6067] =   --00新剧情公交洛阳东北至西南
{
	[EventType.EVENT_TASK_GAIN] = {UI = --[[!AUTO_731]]"", CG = 0, MovePath = 25376 , },
}
TaskHelp.TaskConfigs[6068] =   --00新剧情公交洛阳东北至东南
{
	[EventType.EVENT_TASK_GAIN] = {UI = --[[!AUTO_732]]"", CG = 0, MovePath = 25375 , },
}
TaskHelp.TaskConfigs[6072] =   --00新剧情公交洛阳西南至西北
{
	[EventType.EVENT_TASK_GAIN] = {UI = --[[!AUTO_733]]"", CG = 0, MovePath = 25377 , },
}
TaskHelp.TaskConfigs[6073] =   --00新剧情公交洛阳西南至东北
{
	[EventType.EVENT_TASK_GAIN] = {UI = --[[!AUTO_734]]"", CG = 0, MovePath = 25378 , },
}
TaskHelp.TaskConfigs[6074] =   --00新剧情公交洛阳西南至东南
{
	[EventType.EVENT_TASK_GAIN] = {UI = --[[!AUTO_735]]"", CG = 0, MovePath = 25379 , },
}
TaskHelp.TaskConfigs[6069] =   --00新剧情公交洛阳东南至西北
{
	[EventType.EVENT_TASK_GAIN] = {UI = --[[!AUTO_736]]"", CG = 0, MovePath = 25381 , },
}
TaskHelp.TaskConfigs[6070] =   --00新剧情公交洛阳东南至东北
{
	[EventType.EVENT_TASK_GAIN] = {UI = --[[!AUTO_737]]"", CG = 0, MovePath = 25382 , },
}
TaskHelp.TaskConfigs[6071] =   --00新剧情公交洛阳东南至西南
{
	[EventType.EVENT_TASK_GAIN] = {UI = --[[!AUTO_738]]"", CG = 0, MovePath = 25380 , },
}
TaskHelp.TaskConfigs[6488] =   --授谱副本前放cg
{
	[EventType.EVENT_TASK_GAIN] = {UI = --[[!AUTO_739]]"", CG = 400290, MovePath = 0 , },
}
TaskHelp.TaskConfigs[5957] =   --被东方不败捉弄
{
	[EventType.EVENT_TASK_GAIN] = {UI = --[[!AUTO_740]]"", CG = 400260, MovePath = 0 , },
}
TaskHelp.TaskConfigs[6567] =   --江湖绝学c级左右互搏术001
{
	[EventType.EVENT_TASK_GAIN] = {UI = --[[!AUTO_741]]"", CG = 0, MovePath = 26688 , },
}
TaskHelp.TaskConfigs[6570] =   --江湖绝学c级左右互搏术004
{
	[EventType.EVENT_TASK_GAIN] = {UI = --[[!AUTO_742]]"", CG = 0, MovePath = 26689 , },
}
TaskHelp.TaskConfigs[3909] =   --杀许显纯后
{
	[EventType.EVENT_TASK_GAIN] = {UI = --[[!AUTO_743]]"", CG = 400280, MovePath = 0 , },
}
TaskHelp.TaskConfigs[7969] =    --帮派年兽活动开始
{
	[EventType.EVENT_TASK_COMPLETE] = {UI = "", CG = 400399, MovePath = 0 ,},
}
TaskHelp.TaskConfigs[7970] =    --帮派年兽活动年兽出现
{
	[EventType.EVENT_TASK_COMPLETE] = {UI = "", CG = 400400, MovePath = 0 ,},
}
TaskHelp.TaskConfigs[7971] =    --帮派年兽活动年兽被击杀
{
	[EventType.EVENT_TASK_COMPLETE] = {UI = "", CG = 400401, MovePath = 0 ,},
}
TaskHelp.TaskConfigs[8997] =    --帮派工坊活动开始
{
	[EventType.EVENT_TASK_COMPLETE] = {UI = "", CG = 400517, MovePath = 0 ,},
}
TaskHelp.TaskConfigs[9146] =    --沧溟太昊神器拼图
{
	[EventType.EVENT_TASK_COMPLETE] = {UI = "", CG = 400223, MovePath = 0 ,},
}
TaskHelp.TaskConfigs[9139] =    --沧溟灭门回忆
{
	[EventType.EVENT_TASK_GAIN] = {UI = "", CG = 400532, MovePath = 0 ,},
}
TaskHelp.TaskConfigs[9218] =    --回城商大计
{
	[EventType.EVENT_TASK_GAIN] = {UI = "", CG = 400231, MovePath = 0 ,},
}
TaskHelp.TaskConfigs[9152] =    --上船截人
{
	[EventType.EVENT_TASK_GAIN] = {UI = "", CG = 400575, MovePath = 0 ,},
}
TaskHelp.TaskConfigs[9355] =    --游历蒙古草原
{
	[EventType.EVENT_TASK_GAIN] = {UI = "", CG = 400608, MovePath = 0 ,},
}
TaskHelp.TaskConfigs[9387] =    --2015七夕牛郎织女分手CG
{
	[EventType.EVENT_TASK_COMPLETE] = {UI = "", CG = 400611, MovePath = 0 ,},
}
TaskHelp.TaskConfigs[10431] =    --游历蓬莱仙岛
{
	[EventType.EVENT_TASK_GAIN] = {UI = "", CG = 400664, MovePath = 0 ,},
}
TaskHelp.TaskConfigs[10479] =    --游历北斗峰
{
	[EventType.EVENT_TASK_GAIN] = {UI = "", CG = 400663, MovePath = 0 ,},
}
TaskHelp.TaskConfigs[10506] =    --离开蓬莱岛
{
	[EventType.EVENT_TASK_GAIN] = {UI = "", CG = 400672, MovePath = 0 ,},
}
TaskHelp.TaskConfigs[11131] =   --诛杀云不劫
{
	[EventType.EVENT_TASK_COMPLETE] = {UI = "", CG = 400697, MovePath = 0, },
}
TaskHelp.TaskConfigs[11196] =    --游历昆仑山
{
	[EventType.EVENT_TASK_GAIN] = {UI = "", CG = 400698, MovePath = 0 ,},
}
TaskHelp.TaskConfigs[11103] =    --死亡谷
{
	[EventType.EVENT_TASK_COMPLETE] = {UI = "", CG = 400699, MovePath = 0 ,},
}
TaskHelp.TaskConfigs[11134] =   --杀死黑龙
{
	[EventType.EVENT_TASK_COMPLETE] = {UI = "", CG = 400705, MovePath = 0, },
}
TaskHelp.TaskConfigs[11396] =   --接知音飞行CG任务
{
	[EventType.EVENT_TASK_GAIN] = {UI = "", CG = 400709, MovePath = 0, },
}
TaskHelp.TaskConfigs[11432] =   --接知音飞行CG任务男
{
	[EventType.EVENT_TASK_GAIN] = {UI = "", CG = 400709, MovePath = 0, },
}
TaskHelp.TaskConfigs[11397] =   --接知音起死回生任务
{
	[EventType.EVENT_TASK_GAIN] = {UI = "", CG = 400707, MovePath = 0, },
}
TaskHelp.TaskConfigs[11458] =   --玲珑开图任务1
{
	[EventType.EVENT_TASK_COMPLETE] = {UI = "", CG = 400710, MovePath = 0, },
}
TaskHelp.TaskConfigs[11459] =   --玲珑开图任务2
{
	[EventType.EVENT_TASK_COMPLETE] = {UI = "", CG = 400710, MovePath = 0, },
}
TaskHelp.TaskConfigs[11460] =   --玲珑开图任务3
{
	[EventType.EVENT_TASK_COMPLETE] = {UI = "", CG = 400710, MovePath = 0, },
}
TaskHelp.TaskConfigs[11820] =   --荀英出场
{
	[EventType.EVENT_TASK_COMPLETE] = {UI = "", CG = 400718, MovePath = 0, },
}
TaskHelp.TaskConfigs[11840] =   --古刹三战
{
	[EventType.EVENT_TASK_COMPLETE] = {UI = "", CG = 400787, MovePath = 0, },
}
TaskHelp.TaskConfigs[11995] =   --东方抢亲
{
	[EventType.EVENT_TASK_COMPLETE] = {UI = "", CG = 400766, MovePath = 0, },
}
TaskHelp.TaskConfigs[12013] =  --201211新剧情主线福州009+1经典服以及比武大会令狐冲CG
{
	[EventType.EVENT_TASK_GAIN] = {UI = --[[!AUTO_718]]"", CG = 0, MovePath = 22580, },
        [EventType.EVENT_TASK_COMPLETE] = {UI = --[[!AUTO_719]]"", CG = 400180, MovePath = 0, },
}
TaskHelp.TaskConfigs[12663] =   --东华开图任务1
{
	[EventType.EVENT_TASK_COMPLETE] = {UI = "", CG = 400840, MovePath = 0, },
}
TaskHelp.TaskConfigs[12664] =   --东华开图任务2
{
	[EventType.EVENT_TASK_COMPLETE] = {UI = "", CG = 400840, MovePath = 0, },
}
TaskHelp.TaskConfigs[12665] =   --东华开图任务3
{
	[EventType.EVENT_TASK_COMPLETE] = {UI = "", CG = 400840, MovePath = 0, },
}
TaskHelp.TaskConfigs[12711] =   --东华开图任务
{
	[EventType.EVENT_TASK_COMPLETE] = {UI = "", CG = 400840, MovePath = 0, },
}
TaskHelp.TaskConfigs[12724] =   --名剑大会副本CG
{
	[EventType.EVENT_TASK_COMPLETE] = {UI = "", CG = 400850, MovePath = 0, },
}




----------------------------------
--景深效果（全屏模糊等）
--SceneStyle.TaskState =
--{
--	INVALID		= -1,	--	无此任务
--
--	NONE		= 0,	--	此任务的完成数为0
--	ACCEPT 		= 1,	--	接到
--	CANFINISH 	= 2, 	--	完成没交
--	FINISHED	= 3,	--	交成功
--	FAIL		= 4,	--	失败
--};
TaskHelp.TaskDOFConfigs[5374] = --试验全屏模糊
{
	[SceneStyle.TaskState.ACCEPT] = {  --接到
			START_DOF = { -- 开始模糊
				-1,	0.0,	--模糊近距(-1表示当前) ->..
				-1,	0.0,	--模糊远距(-1表示当前)  -> ..
				-1,	0.0,	--清晰近距(-1表示当前)  -> ..
				-1,	0.0,	--清晰远距(-1表示当前)  -> ..
				-1,	0.55,	--模糊度(-1表示当前)  -> ..
				3000, --淡入时间
			},
	},
	[SceneStyle.TaskState.CANFINISH] = { --完成没交
			START_DOF = { -- 开始模糊
				-1,	0.0,	--模糊近距(-1表示当前) ->..
				-1,	0.0,	--模糊远距(-1表示当前)  -> ..
				-1,	0.0,	--清晰近距(-1表示当前)  -> ..
				-1,	0.0,	--清晰远距(-1表示当前)  -> ..
				-1,	1.0,	--模糊度(-1表示当前)  -> ..
				3000, --淡入时间
			},
	},
	[SceneStyle.TaskState.FINISHED] = { -- 交成功
			STOP_DOF = {  -- 停止模糊
				-1,	0.0,	--模糊近距(-1表示当前) ->..
				-1,	111.0,	--模糊远距(-1表示当前)  -> ..
				-1,	0.0,	--清晰近距(-1表示当前)  -> ..
				-1,	111.0,	--清晰远距(-1表示当前)  -> ..
				-1,	0.1,	--模糊度(-1表示当前)  -> ..
				3000, --淡出时间
			},
	},
	[SceneStyle.TaskState.FAIL] = { -- 失败
			STOP_DOF = {  -- 停止模糊
				-1,	0.0,	--模糊近距(-1表示当前) ->..
				-1,	111.0,	--模糊远距(-1表示当前)  -> ..
				-1,	0.0,	--清晰近距(-1表示当前)  -> ..
				-1,	111.0,	--清晰远距(-1表示当前)  -> ..
				-1,	0.1,	--模糊度(-1表示当前)  -> ..
				3000, --淡出时间
			},
	},
}
TaskHelp.TaskDOFConfigs[5847] = --试验全屏模糊
{
	[SceneStyle.TaskState.ACCEPT] = {  --接到
			START_DOF = { -- 开始模糊
				-1,	0.0,	--模糊近距(-1表示当前) ->..
				-1,	0.0,	--模糊远距(-1表示当前)  -> ..
				-1,	0.0,	--清晰近距(-1表示当前)  -> ..
				-1,	0.0,	--清晰远距(-1表示当前)  -> ..
				-1,	0.55,	--模糊度(-1表示当前)  -> ..
				3000, --淡入时间
			},
	},
	[SceneStyle.TaskState.CANFINISH] = { --完成没交
			START_DOF = { -- 开始模糊
				-1,	0.0,	--模糊近距(-1表示当前) ->..
				-1,	0.0,	--模糊远距(-1表示当前)  -> ..
				-1,	0.0,	--清晰近距(-1表示当前)  -> ..
				-1,	0.0,	--清晰远距(-1表示当前)  -> ..
				-1,	0.55,	--模糊度(-1表示当前)  -> ..
				3000, --淡入时间
			},
	},
	[SceneStyle.TaskState.FINISHED] = { -- 交成功
			STOP_DOF = {  -- 停止模糊
				-1,	0.0,	--模糊近距(-1表示当前) ->..
				-1,	111.0,	--模糊远距(-1表示当前)  -> ..
				-1,	0.0,	--清晰近距(-1表示当前)  -> ..
				-1,	111.0,	--清晰远距(-1表示当前)  -> ..
				-1,	0.1,	--模糊度(-1表示当前)  -> ..
				3000, --淡出时间
			},
	},
	[SceneStyle.TaskState.FAIL] = { -- 失败
			STOP_DOF = {  -- 停止模糊
				-1,	0.0,	--模糊近距(-1表示当前) ->..
				-1,	111.0,	--模糊远距(-1表示当前)  -> ..
				-1,	0.0,	--清晰近距(-1表示当前)  -> ..
				-1,	111.0,	--清晰远距(-1表示当前)  -> ..
				-1,	0.1,	--模糊度(-1表示当前)  -> ..
				3000, --淡出时间
			},
	},
}

--
--任务寻径限定范围, 格式: { [AutoSearchRangeTargetType] = {[targetId] = {radius=范围大小, min_dist=小于此距离则无视限定, {x1, z1}, {x2, z2}, ...} }
--

--纯采矿(对应TARGET_MINE)，targetId 为矿ID
TaskHelp.AutoSearchRange[TaskHelp.AutoSearchRangeTargetType.Mine] =
{
	--例：[35523] = {radius = 10, min_dist = 5, {0, 0}, {0, 10}, {10, 10}, {10, 0}},
	[35523] = {radius = 10, min_dist = 5,
	        {18.40,12.01},
                {16.75, 8.56},
                {6.71, 20.69},
                {5.71, 8.86},
                {-2.93, 10.18},
                {9.66, 10.09},
                {30.22, 4.43},
                {15.00, 16.66},
                {18.16, 17.23},
                {5.88, 12.01},
                {10.65, 18.38},
                {22.93, 10.01},
                {-2.23, 12.52},
                {30.72, 7.13},
                {13.16, 9.39},
                {2.07, 10.32},
                {1.25, 12.68},
                {12.93, 13.50},
                {22.23, 13.16},
                {17.80, -34.19},
                {10.46, -21.60},
                {1.00, -26.21},
                {1.32, -33.07},
                {-2.36, -21.62},
                {11.86, -29.50},
                {14.37, -27.80},
		{40.02, -7.79},
                {35.27, -13.50},
                {28.29, -10.09},
                {39.36, -10.83},
                {27.36, 7.90},
                {35.92, -8.96},
                {35.18, -5.41},
                {28.67, 2.06},
                {22.44, -36.37},
                {24.10, 5.39},
                {30.63, -13.13},
                {16.50, -29.77},
                {5.19, -21.36},
                {4.71, -24.69},
                {28.21, -14.71},
                {25.63, -11.28},
                {28.21, -19.00},
                {22.27, -12.40},
                {13.61, -31.67},
                {23.63, -8.70}
	},
	[72976] = {radius = 10, min_dist = 5,
                {-47.13,17.17},
                {-47.23,10.29},
                {-47.33,4.65},
                {-64.41,-2.06},
                {-11.13,-25.16},
                {-11.23,-19.93},
                {-14.79,-20.03},
                {-14.89,-14.11},
                {-18.94,-14.21},
                {-19.04,-8.53},
                {-19.14,-1.76},
                {-35.18,-1.86},
                {-27.46, -1.96},
                {-43.13, -2.06},
                {-57.75, -2.16},
                {-57.85, 21.64},
                {-49.51, 21.54},
                {-45.59, 28.31},
                {-44.18, 36.58},
                {-26.91, 43.94},
                {-33.57, 43.84},
                {-19.41, 39.27},
                {-12.11, 39.17},
                {-1.37, 39.07},
                {7.79, 38.97},
                {7.69, 45.05},
                {17.55, 44.95},
                {17.45, 39.09},
                {25.96, 38.99},
                {25.86, 32.84},
                {32.25, 32.74},
                {32.15, 25.89},
                {38.94, 25.79},
                {38.84, 19.58},
                {45.80, 17.79},
                {46.59, 11.31},
                {52.82, 11.21},
                {52.72, 5.60},
                {52.62, -1.12},
                {50.05, -8.63},
                {46.17, -12.85},
                {40.75, -10.50},
                {32.61, -10.60},
                {32.51, -14.80},
                {27.87, -14.90},
                {27.77, -18.57},
                {21.23, -18.67},
                {21.13, -30.77},
                {21.03, -35.63},
                {20.93, -42.41},
                {20.83, -48.58},
                {13.10, -44.71},
                {5.50, -45.34},
                {5.40, -40.49},
                {0.26, -40.59},
                {0.16, -35.91},
                {-3.37, -28.37},
                {-4.94,-34.48}
	},

}

--采矿得物品(对应TARGET_ITEM)，targetId 为任务ID
TaskHelp.AutoSearchRange[TaskHelp.AutoSearchRangeTargetType.ItemFromMine] =
{
	--例：[3805] = {radius = 10, min_dist = 5, {1.1, -26.3}, {1.1, -26.3}, {1.1, -26.3}, {1.1, -26.3}},

	[5222] =
	{
	 radius = 8, min_dist = 5,
	 {-238,-86},
	 {-238,-81},
	 {-241,-84},
	 {-244,-87},
	 {-244,-81},

	},

	[5477] =
	{
	 radius = 8, min_dist = 5,
    {144.03, -8.11},
    {145.12, -8.21},
    {145.02, -6.70},
    {148.92, 17.25},
    {148.82, 12.68},
    {147.10, 15.40},
    {149.62, 15.27},
    {150.28, 14.13},
    {150.55, 11.81},
    {147.00, -2.02},
    {149.52, 1.07},
    {150.18, -0.07},
    {148.86, -1.28},
    {143.93, -5.79},
    {145.02, -5.89},
    {144.92, -4.38},
    {148.34, -3.69}
	},

	[3805] =
	{
	 radius = 8, min_dist = 5,
              {18.40, 12.01},
              {16.75, 8.56},
              {6.71, 20.69},
              {5.71, 8.86},
              {-2.93, 10.18},
              {9.66, 10.09},
              {30.22, 4.43},
              {15.00, 16.66},
              {18.16, 17.23},
              {5.88, 12.01},
              {10.65, 18.38},
              {22.93, 10.01},
              {-2.23, 12.52},
              {30.72, 7.13},
              {13.16, 9.39},
              {2.07, 10.32},
              {1.25, 12.68},
              {12.93, 13.50},
              {22.23, 13.16},
              {17.80, -34.19},
              {10.46, -21.60},
              {1.00, -26.21},
              {1.32, -33.07},
              {-2.36, -21.62},
              {11.86, -29.50},
              {14.37, -27.80}
	},

	[4077] =
	{
	 radius = 8, min_dist = 5,
              {-153.94, -25.86},
              {-153.39, -25.94},
              {-154.46, -26.34},
              {-153.31, -20.29},
              {-152.29, -21.03},
              {-151.86, -19.97},
              {-154.16, -24.51},
              {-152.02, -18.99}
	},

	[3860] =
	{
	 radius = 8, min_dist = 5,
               {132.57, -50.24},
               {126.83, -32.90},
               {128.11, -39.81},
               {128.74, -43.57},
               {130.40, -37.19},
               {130.06, -48.36},
               {133.70, -40.70},
               {128.50, -38.32},
               {126.26, -34.59},
               {129.61, -32.03},
               {135.93, -42.72},
               {136.96, -48.47},
               {132.93, -44.84}
	},

	[3868] =
	{
	 radius = 8, min_dist = 5,
                {-70.01, 87.50},
                {-70.08, 86.34},
                {-68.30, 87.57},
                {-68.37, 86.39},
                {-68.31, 88.75},
                {-68.23, 89.92},
                {-70.02, 88.70},
                {-69.95, 89.85},
                {-78.63, 78.30},
                {-78.58, 80.03},
                {-77.36, 79.97},
                {-77.40, 78.26},
                {-80.48, 80.29},
                {-80.49, 78.59},
                {-59.31, 96.06},
                {-59.24, 97.23},
                {-75.39, 99.11},
                {-80.65, 89.56},
                {-80.61, 91.37},
                {-79.30, 91.45},
                {-79.36, 89.65},
                {-61.02, 96.01},
                {-60.95, 97.16},
                {-72.10, 99.46},
                {-73.73, 99.48},
                {-77.12, 99.48}
	},

	[4548] =
	{
	 radius = 8, min_dist = 5,
                {-154.41, 224.48},
                {-156.74, 227.66},
                {-157.70, 225.25},
                {-211.57, 227.18},
                {-210.38, 224.52},
                {-206.25, 233.33},
                {-205.06, 230.67},
                {-219.93, 183.01},
                {-218.74, 180.35},
                {-214.61, 189.15},
                {-213.42, 186.49},
                {-219.78, 195.56},
                {-222.11, 198.74},
                {-223.07, 196.34},
                {-198.72, 223.07},
                {-199.68, 221.95},
                {-175.27, 231.07},
                {-177.60, 234.26},
                {-178.56, 231.85},
                {-86.07, 255.31},
                {-87.03, 254.19},
                {-81.84, 248.33},
                {-82.91, 250.26},
                {-83.87, 249.13},
                {-110.45, 118.49},
                {-110.57, 121.79},
                {-111.68, 120.97},
                {-65.02, 159.66},
                {-66.13, 158.63}
	}
	--[[
	[3805] =
	{
	 radius = 8, min_dist = 5,
	         {18.40,12.01},
                {16.75, 8.56},
                {6.71, 20.69},
                {5.71, 8.86},
                {-2.93, 10.18},
                {9.66, 10.09},
                {30.22, 4.43},
                {15.00, 16.66},
                {18.16, 17.23},
                {5.88, 12.01},
                {10.65, 18.38},
                {22.93, 10.01},
                {-2.23, 12.52},
                {30.72, 7.13},
                {13.16, 9.39},
                {2.07, 10.32},
                {1.25, 12.68},
                {12.93, 13.50},
                {22.23, 13.16},
                {17.80, -34.19},
                {10.46, -21.60},
                {1.00, -26.21},
                {1.32, -33.07},
                {-2.36, -21.62},
                {11.86, -29.50},
                {14.37, -27.80},
		{40.02, -7.79},
                {35.27, -13.50},
                {28.29, -10.09},
                {39.36, -10.83},
                {27.36, 7.90},
                {35.92, -8.96},
                {35.18, -5.41},
                {28.67, 2.06},
                {22.44, -36.37},
                {24.10, 5.39},
                {30.63, -13.13},
                {16.50, -29.77},
                {5.19, -21.36},
                {4.71, -24.69},
                {28.21, -14.71},
                {25.63, -11.28},
                {28.21, -19.00},
                {22.27, -12.40},
                {13.61, -31.67},
                {23.63, -8.70} ,
		 {-47.13,17.17},
                {-47.23,10.29},
                {-47.33,4.65},
                {-64.41,-2.06},
                {-11.13,-25.16},
                {-11.23,-19.93},
                {-14.79,-20.03},
                {-14.89,-14.11},
                {-18.94,-14.21},
                {-19.04,-8.53},
                {-19.14,-1.76},
                {-35.18,-1.86},
                {-27.46, -1.96},
                {-43.13, -2.06},
                {-57.75, -2.16},
                {-57.85, 21.64},
                {-49.51, 21.54},
                {-45.59, 28.31},
                {-44.18, 36.58},
                {-26.91, 43.94},
                {-33.57, 43.84},
                {-19.41, 39.27},
                {-12.11, 39.17},
                {-1.37, 39.07},
                {7.79, 38.97},
                {7.69, 45.05},
                {17.55, 44.95},
                {17.45, 39.09},
                {25.96, 38.99},
                {25.86, 32.84},
                {32.25, 32.74},
                {32.15, 25.89},
                {38.94, 25.79},
                {38.84, 19.58},
                {45.80, 17.79},
                {46.59, 11.31},
                {52.82, 11.21},
                {52.72, 5.60},
                {52.62, -1.12},
                {50.05, -8.63},
                {46.17, -12.85},
                {40.75, -10.50},
                {32.61, -10.60},
                {32.51, -14.80},
                {27.87, -14.90},
                {27.77, -18.57},
                {21.23, -18.67},
                {21.13, -30.77},
                {21.03, -35.63},
                {20.93, -42.41},
                {20.83, -48.58},
                {13.10, -44.71},
                {5.50, -45.34},
                {5.40, -40.49},
                {0.26, -40.59},
                {0.16, -35.91},
                {-3.37, -28.37},
                {-4.94,-34.48}
	},--]]
}

--任务特殊界面, 格式: { [taskId] = {delv=接任务界面名, complete=完成任务界面名} }. 可以只有delv, complete中一项
TaskHelp.SpeicalInterface[5244] = {delv = --[[!AUTO_744]]"Win_NPCSelectProf"}		--入门派
TaskHelp.SpeicalInterface[5247] = {delv = --[[!AUTO_745]]"Win_NPCSelectProf"}		--入门派
TaskHelp.SpeicalInterface[5250] = {delv = --[[!AUTO_746]]"Win_NPCSelectProf"}		--入门派
TaskHelp.SpeicalInterface[5259] = {delv = --[[!AUTO_747]]"Win_NPCSelectProf"}		--入门派
TaskHelp.SpeicalInterface[5256] = {delv = --[[!AUTO_748]]"Win_NPCSelectProf"}		--入门派
TaskHelp.SpeicalInterface[5235] = {delv = --[[!AUTO_749]]"Win_NPCSelectProf"}		--入门派
TaskHelp.SpeicalInterface[5238] = {delv = --[[!AUTO_750]]"Win_NPCSelectProf"}		--入门派
TaskHelp.SpeicalInterface[5253] = {delv = --[[!AUTO_751]]"Win_NPCSelectProf"}		--入门派
TaskHelp.SpeicalInterface[5241] = {delv = --[[!AUTO_752]]"Win_NPCSelectProf"}		--入门派
TaskHelp.SpeicalInterface[5262] = {delv = --[[!AUTO_753]]"Win_NPCSelectProf"}		--入门派

TaskHelp.SpeicalInterface[7609] = {delv = --[[!AUTO_753]]"Win_QuestSignIn"}		--每日签到
TaskHelp.SpeicalInterface[8713] = {delv = --[[!AUTO_753]]"Win_DeclareWar"}		--组队挑战副本宣战
