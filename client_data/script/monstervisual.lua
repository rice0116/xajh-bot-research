--[[#tag push auto]]

-- 怪物显示相关
MonsterVisual = {}
MonsterVisual.VisualName = {}				--
MonsterVisual.GfxName    = {}
MonsterVisual.SpecialAction = {}
MonsterVisual.AttributeName = {}
MonsterVisual.MonsterNotes = {}
MonsterVisual.MonsterAttribute = {}
MonsterVisual.WalkRunBlendParams = {}
----------------------------------------------------------------
MonsterVisual.VisualName[8929] = {--[[!AUTO_1]]"我是測試"}
MonsterVisual.VisualName[9181] = {--[[!AUTO_2]]"視覺敏銳"}
MonsterVisual.VisualName[9182] = {--[[!AUTO_3]]"視覺遲鈍"}
MonsterVisual.VisualName[9183] = {--[[!AUTO_4]]"好戰份子"}
MonsterVisual.VisualName[9184] = {--[[!AUTO_5]]"特別溫順"}
MonsterVisual.VisualName[9185] = {--[[!AUTO_6]]"生命強化"}
MonsterVisual.VisualName[9186] = {--[[!AUTO_7]]"無懈可擊"}
MonsterVisual.VisualName[9187] = {--[[!AUTO_8]]"幸運攻擊"}
MonsterVisual.VisualName[9188] = {--[[!AUTO_9]]"歇斯底里"}
MonsterVisual.VisualName[9189] = {--[[!AUTO_10]]"特別強壯"}
MonsterVisual.VisualName[9190] = {--[[!AUTO_11]]"特別堅韌"}
MonsterVisual.VisualName[9191] = {--[[!AUTO_12]]"致命一擊"}
MonsterVisual.VisualName[9192] = {--[[!AUTO_13]]"幽靈打擊"}
MonsterVisual.VisualName[9193] = {--[[!AUTO_14]]"內息平穩"}
MonsterVisual.VisualName[9194] = {--[[!AUTO_15]]"氣海澎湃"}
MonsterVisual.VisualName[9195] = {--[[!AUTO_16]]"內功深厚"}
MonsterVisual.VisualName[9196] = {--[[!AUTO_17]]"化氣禦勁"}
MonsterVisual.VisualName[9197] = {--[[!AUTO_18]]"致命內功"}
MonsterVisual.VisualName[9198] = {--[[!AUTO_19]]"靈魂打擊"}
MonsterVisual.VisualName[9199] = {--[[!AUTO_20]]"戰鬥回復"}
MonsterVisual.VisualName[9200] = {--[[!AUTO_21]]"遠誅"}
MonsterVisual.VisualName[9201] = {--[[!AUTO_22]]"無力"}
MonsterVisual.VisualName[9202] = {--[[!AUTO_23]]"自我調整"}
MonsterVisual.VisualName[9203] = {--[[!AUTO_24]]"身輕如燕"}
MonsterVisual.VisualName[9204] = {--[[!AUTO_25]]"腳下生風"}
MonsterVisual.VisualName[9205] = {--[[!AUTO_26]]"步伐沉重"}
MonsterVisual.VisualName[9206] = {--[[!AUTO_27]]"特別遲緩"}
MonsterVisual.VisualName[9207] = {--[[!AUTO_28]]"靈動"}
MonsterVisual.VisualName[9208] = {--[[!AUTO_29]]"遲鈍"}
MonsterVisual.VisualName[9209] = {--[[!AUTO_30]]"厄運攻擊"}
MonsterVisual.VisualName[9210] = {--[[!AUTO_31]]"特別虛弱"}
MonsterVisual.VisualName[9211] = {--[[!AUTO_32]]"特別脆弱"}
MonsterVisual.VisualName[9212] = {--[[!AUTO_33]]"強壯體魄"}
MonsterVisual.VisualName[9799] = {--[[!AUTO_34]]""}
MonsterVisual.VisualName[9805] = {--[[!AUTO_35]]"破綻增加"}
MonsterVisual.VisualName[9808] = {--[[!AUTO_36]]"生命增加"}
MonsterVisual.VisualName[9809] = {--[[!AUTO_37]]"攻下限增加"}
MonsterVisual.VisualName[9810] = {--[[!AUTO_38]]"攻上限增加"}
MonsterVisual.VisualName[9811] = {--[[!AUTO_39]]"攻擊增加"}
MonsterVisual.VisualName[9812] = {--[[!AUTO_40]]"防禦增加"}
MonsterVisual.VisualName[9813] = {--[[!AUTO_41]]"爆率增加"}
MonsterVisual.VisualName[9814] = {--[[!AUTO_42]]"爆傷增加"}
MonsterVisual.VisualName[9815] = {--[[!AUTO_43]]"英姿煥發"}
MonsterVisual.VisualName[9816] = {--[[!AUTO_44]]"移動加速"}
MonsterVisual.VisualName[16665] = {--[[!AUTO_45]]""}
MonsterVisual.VisualName[26407] = {--[[!AUTO_46]]"5倍血"}
MonsterVisual.VisualName[26408] = {--[[!AUTO_47]]"50倍血"}
MonsterVisual.VisualName[26409] = {--[[!AUTO_48]]"100倍血"}
MonsterVisual.VisualName[26410] = {--[[!AUTO_49]]"200倍血"}
MonsterVisual.VisualName[26411] = {--[[!AUTO_50]]"5倍血"}
MonsterVisual.VisualName[26412] = {--[[!AUTO_51]]"任務光效"}
MonsterVisual.VisualName[26413] = {--[[!AUTO_52]]"特殊怪光效"}
MonsterVisual.VisualName[26414] = {--[[!AUTO_53]]"隨機怪光效"}
MonsterVisual.VisualName[26415] = {--[[!AUTO_54]]"BOSS怪光效"}
MonsterVisual.VisualName[26416] = {--[[!AUTO_55]]"普通破綻"}
MonsterVisual.VisualName[26417] = {--[[!AUTO_56]]"5倍破綻"}
MonsterVisual.VisualName[26418] = {--[[!AUTO_57]]"2000破綻"}
MonsterVisual.VisualName[26419] = {--[[!AUTO_58]]"1000破綻"}
MonsterVisual.VisualName[26420] = {--[[!AUTO_59]]"普通破綻"}
MonsterVisual.VisualName[26421] = {--[[!AUTO_60]]"等級HP20"}
MonsterVisual.VisualName[26422] = {--[[!AUTO_61]]"等級HP40"}
MonsterVisual.VisualName[26423] = {--[[!AUTO_62]]"等級HP100"}
MonsterVisual.VisualName[26424] = {--[[!AUTO_63]]"等級HP400"}
MonsterVisual.VisualName[26425] = {--[[!AUTO_64]]"等級HP150"}
MonsterVisual.VisualName[26426] = {--[[!AUTO_65]]"等級HP300"}
MonsterVisual.VisualName[26427] = {--[[!AUTO_66]]"等級HP750"}
MonsterVisual.VisualName[26428] = {--[[!AUTO_67]]"等級HP3000"}
MonsterVisual.VisualName[26429] = {--[[!AUTO_68]]"等級HP200"}
MonsterVisual.VisualName[26430] = {--[[!AUTO_69]]"等級HP400"}
MonsterVisual.VisualName[26431] = {--[[!AUTO_70]]"等級HP1000"}
MonsterVisual.VisualName[26432] = {--[[!AUTO_71]]"等級HP4000"}
MonsterVisual.VisualName[26433] = {--[[!AUTO_72]]"破綻加100"}
MonsterVisual.VisualName[26434] = {--[[!AUTO_73]]"破綻加400"}
MonsterVisual.VisualName[26435] = {--[[!AUTO_74]]"破綻加900"}
MonsterVisual.VisualName[26436] = {--[[!AUTO_75]]"破綻加4900"}
MonsterVisual.VisualName[26437] = {--[[!AUTO_76]]"外傷最大化"}
MonsterVisual.VisualName[26438] = {--[[!AUTO_77]]"外傷浮動"}
MonsterVisual.VisualName[26439] = {--[[!AUTO_78]]"2倍外攻"}
MonsterVisual.VisualName[26440] = {--[[!AUTO_79]]"3倍外攻"}
MonsterVisual.VisualName[26441] = {--[[!AUTO_80]]"5倍外攻"}
MonsterVisual.VisualName[26442] = {--[[!AUTO_81]]"10倍外攻"}
MonsterVisual.VisualName[26443] = {--[[!AUTO_82]]"3倍護甲"}
MonsterVisual.VisualName[26444] = {--[[!AUTO_83]]"外一半出爆"}
MonsterVisual.VisualName[26445] = {--[[!AUTO_84]]"外爆傷2倍"}
MonsterVisual.VisualName[26446] = {--[[!AUTO_85]]"內傷最大化"}
MonsterVisual.VisualName[26447] = {--[[!AUTO_86]]"內傷浮動"}
MonsterVisual.VisualName[26448] = {--[[!AUTO_87]]"2倍內攻"}
MonsterVisual.VisualName[26449] = {--[[!AUTO_88]]"3倍內攻"}
MonsterVisual.VisualName[26450] = {--[[!AUTO_89]]"5倍內攻"}
MonsterVisual.VisualName[26451] = {--[[!AUTO_90]]"10倍內攻"}
MonsterVisual.VisualName[26452] = {--[[!AUTO_91]]"3倍內禦"}
MonsterVisual.VisualName[26453] = {--[[!AUTO_92]]"內一半出爆"}
MonsterVisual.VisualName[26454] = {--[[!AUTO_93]]"內爆傷2倍"}
MonsterVisual.VisualName[26455] = {--[[!AUTO_94]]"速度1.5倍"}
MonsterVisual.VisualName[26456] = {--[[!AUTO_95]]"火傷減少0.25"}
MonsterVisual.VisualName[26457] = {--[[!AUTO_96]]"火傷減少0.5"}
MonsterVisual.VisualName[26458] = {--[[!AUTO_97]]"火傷減少0.75"}
MonsterVisual.VisualName[26459] = {--[[!AUTO_98]]"火傷免役"}
MonsterVisual.VisualName[26460] = {--[[!AUTO_99]]"冰傷減少0.25"}
MonsterVisual.VisualName[26461] = {--[[!AUTO_100]]"冰傷減少0.5"}
MonsterVisual.VisualName[26462] = {--[[!AUTO_101]]"冰傷減少0.75"}
MonsterVisual.VisualName[26463] = {--[[!AUTO_102]]"冰傷免役"}
MonsterVisual.VisualName[26464] = {--[[!AUTO_103]]"毒傷減少0.25"}
MonsterVisual.VisualName[26465] = {--[[!AUTO_104]]"毒傷減少0.5"}
MonsterVisual.VisualName[26466] = {--[[!AUTO_105]]"毒傷減少0.75"}
MonsterVisual.VisualName[26467] = {--[[!AUTO_106]]"毒傷免役"}
MonsterVisual.VisualName[26468] = {--[[!AUTO_107]]"BOSS策略1"}
MonsterVisual.VisualName[26469] = {--[[!AUTO_108]]"BOSS策略2"}
MonsterVisual.VisualName[26470] = {--[[!AUTO_109]]"BOSS策略3"}
MonsterVisual.VisualName[26471] = {--[[!AUTO_110]]"BOSS策略4"}
MonsterVisual.VisualName[26472] = {--[[!AUTO_111]]"BOSS策略5"}
MonsterVisual.VisualName[26473] = {--[[!AUTO_112]]"蛇"}
MonsterVisual.VisualName[26474] = {--[[!AUTO_113]]"蜘蛛"}
MonsterVisual.VisualName[26475] = {--[[!AUTO_114]]"蠻牛"}
MonsterVisual.VisualName[26476] = {--[[!AUTO_115]]"老虎"}
MonsterVisual.VisualName[26477] = {--[[!AUTO_116]]"穿山甲"}
MonsterVisual.VisualName[26478] = {--[[!AUTO_117]]"蜜蜂"}
MonsterVisual.VisualName[26479] = {--[[!AUTO_118]]"烏鴉"}
MonsterVisual.VisualName[26480] = {--[[!AUTO_119]]"禿鷲"}
MonsterVisual.VisualName[26481] = {--[[!AUTO_120]]"鼬"}
MonsterVisual.VisualName[26482] = {--[[!AUTO_121]]"貂"}
MonsterVisual.VisualName[26483] = {--[[!AUTO_122]]"狼"}
MonsterVisual.VisualName[26484] = {--[[!AUTO_123]]"豹子"}
MonsterVisual.VisualName[26485] = {--[[!AUTO_124]]"人豪爽"}
MonsterVisual.VisualName[26486] = {--[[!AUTO_125]]"人霸氣"}
MonsterVisual.VisualName[26487] = {--[[!AUTO_126]]"人陰險"}
MonsterVisual.VisualName[26807] = {--[[!AUTO_127]]"探子逃跑"}
MonsterVisual.VisualName[26808] = {--[[!AUTO_128]]"哨兵先呼救"}
MonsterVisual.VisualName[26809] = {--[[!AUTO_129]]"護衛狂暴"}
MonsterVisual.VisualName[26818] = {--[[!AUTO_130]]"野豬"}
MonsterVisual.VisualName[26819] = {--[[!AUTO_131]]"狐狸"}
MonsterVisual.VisualName[26820] = {--[[!AUTO_132]]"蠍子"}
MonsterVisual.VisualName[26821] = {--[[!AUTO_133]]"山雞"}
MonsterVisual.VisualName[26822] = {--[[!AUTO_134]]"竹"}
MonsterVisual.VisualName[26823] = {--[[!AUTO_135]]"花精"}

--------------------------------------------------------------------
--[[暂时不使用
MonsterVisual.GfxName[1] = {"快如闪电的"}
MonsterVisual.GfxName[2] = {"迅捷如风的"}
MonsterVisual.GfxName[3] = {"力大如牛的"}
MonsterVisual.GfxName[4] = {"两眼充血的"}
MonsterVisual.GfxName[5] = {"歇斯底里的"}
MonsterVisual.GfxName[6] = {"疯狂的"}
MonsterVisual.GfxName[7] = {"强大的"}
MonsterVisual.GfxName[8] = {"胆小的"}
MonsterVisual.GfxName[9] = {"强壮的"}
MonsterVisual.GfxName[10] = {"阴险狡诈的"}
MonsterVisual.GfxName[11] = {"心沉手稳的"}
MonsterVisual.GfxName[12] = {"迅捷如风的"}
MonsterVisual.GfxName[13] = {"高傲自大的"}
MonsterVisual.GfxName[14] = {"唧唧歪歪的"}
MonsterVisual.GfxName[15] = {"挥刀自宫的"}
MonsterVisual.GfxName[16] = {"久经沙场的"}
MonsterVisual.GfxName[17] = {"惊天动地的"}
MonsterVisual.GfxName[18] = {"天下无敌的"}
MonsterVisual.GfxName[19] = {"身轻如燕的"}
MonsterVisual.GfxName[20] = {"虎背熊腰的"}
MonsterVisual.GfxName[21] = {"身轻如燕的"}
MonsterVisual.GfxName[22] = {"挥刀自宫的"}
MonsterVisual.GfxName[23] = {"唧唧歪歪的"}
MonsterVisual.GfxName[24] = {"力大无穷的"}
MonsterVisual.GfxName[25] = {"挨打不痛的"}
MonsterVisual.GfxName[26] = {"疯狂的"}
MonsterVisual.GfxName[27] = {"两眼充血的"}
MonsterVisual.GfxName[28] = {"与众不同的"}
MonsterVisual.GfxName[29] = {"迅捷如风的"}
MonsterVisual.GfxName[30] = {"力大如牛的"}
MonsterVisual.GfxName[31] = {"身轻如燕的"}
MonsterVisual.GfxName[32] = {"久经沙场的"}
MonsterVisual.GfxName[33] = {"心沉手稳的"}
MonsterVisual.GfxName[34] = {"阴险狡诈的"}
MonsterVisual.GfxName[35] = {"足下生风的"}
MonsterVisual.GfxName[36] = {"拳上冒火的"}
MonsterVisual.GfxName[37] = {"暴力的"}
MonsterVisual.GfxName[38] = {"温顺的"}
MonsterVisual.GfxName[39] = {"歇斯底里的"}
MonsterVisual.GfxName[40] = {"渴望战斗的"}
MonsterVisual.GfxName[41] = {"带电的"}
MonsterVisual.GfxName[42] = {"燃烧的"}
MonsterVisual.GfxName[43] = {"寒冰的"}
MonsterVisual.GfxName[44] = {"巨毒的"}
MonsterVisual.GfxName[45] = {"歇斯底里的"}
MonsterVisual.GfxName[46] = {"的"}
MonsterVisual.GfxName[47] = {"的"}
MonsterVisual.GfxName[48] = {"的"}
MonsterVisual.GfxName[49] = {"的"}
MonsterVisual.GfxName[50] = {"歇斯底里的"}
MonsterVisual.GfxName[51] = {"的"}
MonsterVisual.GfxName[52] = {"的"}
MonsterVisual.GfxName[53] = {"的"}
MonsterVisual.GfxName[54] = {"的"}
MonsterVisual.GfxName[55] = {"的"}
MonsterVisual.GfxName[56] = {"的"}
MonsterVisual.GfxName[57] = {"的"}
MonsterVisual.GfxName[58] = {"的"}
MonsterVisual.GfxName[59] = {"的"}
暂时不使用]]--
MonsterVisual.GfxName[60] = {--[[!AUTO_136]]""}
MonsterVisual.GfxName[61] = {--[[!AUTO_137]]""}
MonsterVisual.GfxName[62] = {--[[!AUTO_138]]""}
MonsterVisual.GfxName[63] = {--[[!AUTO_139]]""}
--------------------------------------------------------------------
MonsterVisual.SlowBind =
{
--tmplid	--模板名
[142] = true,	--测试交通工具
[13927] = true,	--测试载具操作任务绑定
[16584] = true,	--梅关古道镖车
[16945] = true,	--任务库良马
[18530] = true,	--闽南马
[18613] = true,	--01少林门派坐骑01
[18614] = true,	--02武当门派坐骑01
[18615] = true,	--03华山门派坐骑01
[18616] = true,	--04唐门门派坐骑01
[18617] = true,	--05五仙门派坐骑01
[18618] = true,	--06逍遥门派坐骑01
[18619] = true,	--07峨嵋门派坐骑01
[18620] = true,	--08日月门派坐骑01
[18621] = true,	--09恒山门派坐骑01
[18622] = true,	--10衡山门派坐骑01
[18623] = true,	--01少林门派坐骑02
[18624] = true,	--02武当门派坐骑02
[18625] = true,	--03华山门派坐骑02
[18626] = true,	--04唐门门派坐骑02
[18627] = true,	--05五仙门派坐骑02
[18628] = true,	--06逍遥门派坐骑02
[18629] = true,	--07峨嵋门派坐骑02
[18630] = true,	--08日月门派坐骑02
[18631] = true,	--09恒山门派坐骑02
[18632] = true,	--10衡山门派坐骑02
[21865] = true,	--城市出售黄骠马
[25993] = true,	--东方剧情逃亡马匹
[27499] = true,	--桂林载具羊
[27500] = true,	--桂林载具狼
[27517] = true,	--39泰山马
}
--------------------------------------------------------------------
MonsterVisual.BeAtkConfig =
{
--模板id	canshake是否受伤抖动		是否物理受伤
[34631] = {canshake = false },
[34824] = {canshake = false ,   canPhyDmg = false},	--青城破碎
[34825] = {canshake = false ,   canPhyDmg = false},	--青城破碎
[34830] = {canshake = false },	--青城破碎
[34831] = {canshake = false },	--青城破碎
[34832] = {canshake = false },	--青城破碎
[34833] = {canshake = false },	--青城破碎
[34834] = {canshake = false },	--青城破碎
[34835] = {canshake = false },	--青城破碎
[58652] = {canshake = false },	--青城覆灭乌鸦图腾
[59059] = {canshake = false },	--酒肆破碎
[59060] = {canshake = false },	--酒肆破碎
[59061] = {canshake = false },	--酒肆破碎
[60636] = {canshake = false },	--孤岛破碎
[60637] = {canshake = false },	--孤岛破碎
[62650] = {canshake = false },	--孤岛破碎
[38477] = {canshake = false },	--东厂破碎
[38478] = {canshake = false },	--东厂破碎
[38479] = {canshake = false },	--东厂破碎
[38480] = {canshake = false },	--东厂破碎
[38481] = {canshake = false },	--东厂破碎
[55447] = {canshake = false },	--龙岭破碎
[55448] = {canshake = false },	--龙岭破碎
[55449] = {canshake = false },	--龙岭破碎
[55450] = {canshake = false },	--龙岭破碎
[55451] = {canshake = false },	--龙岭破碎
[55452] = {canshake = false },	--龙岭破碎
[55453] = {canshake = false },	--龙岭破碎
[57336] = {canshake = false },	--蝎王破碎
[57337] = {canshake = false },	--蝎王破碎
[57338] = {canshake = false },	--蝎王破碎
[62169] = {canshake = false },	--青城覆灭竹林
[66386] = {canshake = false },	--梅庄外围破碎
[66387] = {canshake = false },	--梅庄外围破碎
[66388] = {canshake = false },	--梅庄外围破碎
[66389] = {canshake = false },	--梅庄外围破碎
[67377] = {canshake = false },	--连云堡破碎
[67378] = {canshake = false },	--连云堡破碎
[67379] = {canshake = false },	--连云堡破碎
[72984] = {canshake = false },	--连云堡破碎
[72985] = {canshake = false },	--连云堡破碎
[74499] = {canshake = false },	--连云堡破碎
[74500] = {canshake = false },	--连云堡破碎
[67608] = {canshake = false },	--山崖破碎
[67609] = {canshake = false },	--山崖破碎
[67610] = {canshake = false },	--山崖破碎
[67611] = {canshake = false },	--山崖破碎
[77607] = {canshake = false },
[77608] = {canshake = false },
[77609] = {canshake = false },
[77610] = {canshake = false },
[77611] = {canshake = false },
[77612] = {canshake = false },
[77613] = {canshake = false },
[77614] = {canshake = false },
[80596] = {canshake = false },
[75422] = {canshake = false },
[75423] = {canshake = false },
[75424] = {canshake = false },
[75425] = {canshake = false },
[75426] = {canshake = false },
[75427] = {canshake = false },
[75428] = {canshake = false },
[75429] = {canshake = false },
[75430] = {canshake = false },
[75431] = {canshake = false },
[75432] = {canshake = false },
[67073] = {canshake = false },
[67074] = {canshake = false },
[73673] = {canshake = false },
[73674] = {canshake = false },
[73682] = {canshake = false },
[73690] = {canshake = false },
[73694] = {canshake = false },
[73695] = {canshake = false },
[73696] = {canshake = false },
[73697] = {canshake = false },
[73698] = {canshake = false },
[67626] = {canshake = false,   canPhyDmg = false },	--连云堡大门
[44024] = {canshake = false,   canPhyDmg = false },	--金熊像
[44025] = {canshake = false,   canPhyDmg = false },	--石猴像
[33017] = {canshake = true,   canPhyDmg = false },	--评书副本青城山青城派精英弟子A
[33018] = {canshake = true,   canPhyDmg = false },	--评书副本青城山青城派精英弟子B
[34826] = {canshake = true,   canPhyDmg = false },	--评书青城隐藏看守高手A
[34827] = {canshake = true,   canPhyDmg = false },	--评书青城隐藏看守高手B
[34839] = {canshake = true,   canPhyDmg = false },	--评书青城八荒阵竹林伏击高手B
[33019] = {canshake = true,   canPhyDmg = false },	--评书副本青城山小BOSS侯人英
[33020] = {canshake = true,   canPhyDmg = false },	--评书副本青城山小BOSS于人豪
[33021] = {canshake = true,   canPhyDmg = false },	--评书副本青城山小BOSS洪人雄
[33022] = {canshake = true,   canPhyDmg = false },	--评书副本青城山小BOSS罗人杰
[33025] = {canshake = true,   canPhyDmg = false },	--评书副本青城山擂台精英弟子A
[33026] = {canshake = true,   canPhyDmg = false },	--评书副本青城山擂台精英弟子B
[33027] = {canshake = true,   canPhyDmg = false },	--评书副本青城山擂台小BOSS侯人英
[33028] = {canshake = true,   canPhyDmg = false },	--评书副本青城山擂台小BOSS于人豪
[33029] = {canshake = true,   canPhyDmg = false },	--评书副本青城山擂台小BOSS洪人雄
[33030] = {canshake = true,   canPhyDmg = false },	--评书副本青城山擂台小BOSS罗人杰
[33031] = {canshake = true,   canPhyDmg = false },	--评书副本青城山BOSS余沧海
[38075] = {canshake = true,   canPhyDmg = false },	--青城深渊_木高峰一阶
[38078] = {canshake = true,   canPhyDmg = false },	--青城深渊_岳灵珊
[55460] = {canshake = true,   canPhyDmg = false },	--随机事件四秀1侯人英
[55461] = {canshake = true,   canPhyDmg = false },	--随机事件四秀2洪人雄
[55462] = {canshake = true,   canPhyDmg = false },	--随机事件四秀3于人豪
[55463] = {canshake = true,   canPhyDmg = false },	--随机事件四秀4罗人杰
[55466] = {canshake = true,   canPhyDmg = false },	--随机事件青城近战精英
[55467] = {canshake = true,   canPhyDmg = false },	--随机事件青城跳劈精英
[56359] = {canshake = true,   canPhyDmg = false },	--镖局副本蒙面杀手
[59058] = {canshake = true,   canPhyDmg = false },	--酒肆副本伏击高手
[60632] = {canshake = true,   canPhyDmg = false },	--孤岛副本BOSS丁勉
[67428] = {canshake = true,   canPhyDmg = false },	--孤岛副本BOSS东海一枪
[34862] = {canshake = true,   canPhyDmg = false },	--东厂副本机器人1
[34863] = {canshake = true,   canPhyDmg = false },	--东厂副本机器人2
[34867] = {canshake = true,   canPhyDmg = false },	--东厂副本机器人BOSS
}
--------------------------------------------------------------------
--------------------------------------------------------------------
MonsterVisual.SpecialModelSpeed =
{
--pathid	标准走速	标准跑速	是否平稳速度（车辆、无腿）	--模型名备注
[5059] = {ws = 0.5, ms = 2.5, sp = false},	--穿山甲
[6434] = {ws = 1.5, ms = 4.5, sp = true},	--马车
[13944] = {ws = 1.5, ms = 4.5, sp = false},	--西湖黑雨刺客镖局
[13943] = {ws = 1.8, ms = 5.4, sp = false},	--红巾怪客镖局
[13942] = {ws = 3, ms = 9, sp = false},		--嗜血和尚镖局
[14794] = {ws = 3, ms = 9, sp = false},		--Models\NPCs\怪物\BOSS\叛军首领\叛军首领帮派boss.ecm
[14795] = {ws = 3, ms = 9, sp = false},		--Models\NPCs\怪物\BOSS\水贼头领鱼得水\水贼头领鱼得水帮派boss.ecm
[14796] = {ws = 3, ms = 9, sp = false},		--Models\NPCs\怪物\BOSS\鬼丸一斩\鬼丸一斩帮派boss.ecm
[14797] = {ws = 3, ms = 9, sp = false},		--Models\NPCs\怪物\人形\灯奴\灯奴帮派boss.ecm
[14798] = {ws = 3, ms = 9, sp = false},		--Models\NPCs\怪物\人形\黑衣人头目\黑衣人头目帮派boss.ecm
[77604] = {ws = 1.8, ms = 5.4, sp = false},	--绝情谷主公孙灭
}
--------------------------------------------------------------------
MonsterVisual.ForceAction =
{
-- 如果怪物有格挡技能，而且有格挡动作和光效，需要在这里设置canblock = true
-- locktarget为1是有索敌动作时调用，2为没有索敌动作调用行走，3为没有索敌动作调用战斗奔跑
[13049] = {locktarget = 1, canblock = false},		--腐奴
[13052] = {locktarget = 2, canblock = false},		--刑鬼
[13139] = {locktarget = 2, canblock = true},		--死牢冤魂
[33015] = {locktarget = 1, canblock = false},		--评书副本青城山青城派弟子A
[33016] = {locktarget = 1, canblock = false},		--评书副本青城山青城派弟子B
[33017] = {locktarget = 1, canblock = true},		--评书副本青城山青城派精英弟子A
[33018] = {locktarget = 1, canblock = true},		--评书副本青城山青城派精英弟子B
[34826] = {locktarget = 1, canblock = true},		--评书青城隐藏看守高手A
[34827] = {locktarget = 1, canblock = true},		--评书青城隐藏看守高手B
[34838] = {locktarget = 1, canblock = false},		--评书青城八荒阵弟子B
[34839] = {locktarget = 1, canblock = true},		--评书青城八荒阵竹林伏击高手B
[33019] = {locktarget = 1, canblock = true},		--评书副本青城山小BOSS侯人英

[33020] = {locktarget = 1, canblock = true},		--评书副本青城山小BOSS于人豪

[33021] = {locktarget = 1, canblock = true},		--评书副本青城山小BOSS洪人雄

[33022] = {locktarget = 1, canblock = true},		--评书副本青城山小BOSS罗人杰

[33023] = {locktarget = 1, canblock = false},		--评书副本青城山擂台弟子A
[33024] = {locktarget = 1, canblock = false},		--评书副本青城山擂台弟子B
[33025] = {locktarget = 1, canblock = true},		--评书副本青城山擂台精英弟子A
[33026] = {locktarget = 1, canblock = true},		--评书副本青城山擂台精英弟子B
[33027] = {locktarget = 1, canblock = true},		--评书副本青城山擂台小BOSS侯人英

[33028] = {locktarget = 1, canblock = true},		--评书副本青城山擂台小BOSS于人豪

[33029] = {locktarget = 1, canblock = true},		--评书副本青城山擂台小BOSS洪人雄

[33030] = {locktarget = 1, canblock = true},		--评书副本青城山擂台小BOSS罗人杰

[33031] = {locktarget = 1, canblock = true},		--评书副本青城山BOSS余沧海

[33048] = {locktarget = 1, canblock = false},		--联手产品演示_剧情亭中御敌_1侯人雄

[33049] = {locktarget = 3, canblock = false},		--联手产品演示_剧情亭中御敌_1青城弟子
[33050] = {locktarget = 3, canblock = false},		--联手产品演示_剧情亭中御敌_2怀杖黑衣人
[33051] = {locktarget = 3, canblock = false},		--联手产品演示_剧情亭中御敌_2铁牌黑衣人

[33052] = {locktarget = 3, canblock = false},		--联手产品演示_剧情亭中御敌_3铜锤黑衣人

[33053] = {locktarget = 3, canblock = false},		--联手产品演示_剧情亭中御敌_4长枪黑衣人

[33054] = {locktarget = 3, canblock = false},		--联手产品演示_剧情亭中御敌_5双刀女人
[33055] = {locktarget = 3, canblock = false},		--联手产品演示_剧情亭中御敌_5链锤大汉
[33056] = {locktarget = 3, canblock = false},		--联手产品演示_剧情亭中御敌_5软鞭大汉
[33057] = {locktarget = 3, canblock = false},		--联手产品演示_剧情亭中御敌_6天乙道人
[33058] = {locktarget = 3, canblock = false},		--联手产品演示_剧情亭中御敌_7泰山护门
[33059] = {locktarget = 3, canblock = false},		--联手产品演示_剧情亭中御敌_8衡山剑客
[33060] = {locktarget = 3, canblock = false},		--联手产品演示_剧情亭中御敌_8魔教盾使
[33061] = {locktarget = 3, canblock = false},		--联手产品演示_剧情亭中御敌_9持刀黑衣人

[33062] = {locktarget = 3, canblock = false},		--联手产品演示_剧情峡谷突破_a江湖刺客
[33063] = {locktarget = 3, canblock = false},		--联手产品演示_剧情峡谷突破_a江湖狙击手

[33064] = {locktarget = 3, canblock = false},		--联手产品演示_剧情峡谷突破_a江湖爆破手

[33065] = {locktarget = 3, canblock = false},		--联手产品演示_剧情峡谷突破_a江湖黑手
[38066] = {locktarget = 1, canblock = false},		--青城深渊_踉跄的青城弟子

[38073] = {locktarget = 2, canblock = false},		--青城深渊_乌鸦
[38074] = {locktarget = 1, canblock = false},		--青城深渊_尸傀
[38075] = {locktarget = 1, canblock = true},		--青城深渊_木高峰一阶

[38077] = {locktarget = 2, canblock = false},		--青城深渊_BOSS战尸傀
[38078] = {locktarget = 1, canblock = true},		--青城深渊_岳灵珊

[55460] = {locktarget = 1, canblock = true},		--随机事件四秀1侯人英

[55461] = {locktarget = 1, canblock = true},		--随机事件四秀2洪人雄

[55462] = {locktarget = 1, canblock = true},		--随机事件四秀3于人豪

[55463] = {locktarget = 1, canblock = true},		--随机事件四秀4罗人杰

[55464] = {locktarget = 1, canblock = false},		--随机事件手雷兵

[55465] = {locktarget = 1, canblock = false},		--随机事件青城近战兵

[55466] = {locktarget = 1, canblock = true},		--随机事件青城近战精英
[38077] = {locktarget = 1, canblock = false},		--青城深渊_boss尸傀
[60713] = {locktarget = 1, canblock = false},		--青城深渊_无主尸傀
[55467] = {locktarget = 1, canblock = true},		--随机事件青城跳劈精英
[34858] = {locktarget = 1, canblock = true},		--测试怪物行为丰富性

[35047] = {locktarget = 1, canblock = true},		--测试怪物受伤动作
[56358] = {locktarget = 2, canblock = false},		--镖局副本假面刺客
[56359] = {locktarget = 1, canblock = true},		--镖局副本蒙面杀手

[56360] = {locktarget = 2, canblock = false},		--镖局副本铁面暴僧
[59057] = {locktarget = 1, canblock = false},		--酒肆副本伏击弟子
[59058] = {locktarget = 1, canblock = true},		--酒肆副本伏击高手
[60632] = {locktarget = 1, canblock = true},		--孤岛副本BOSS丁勉
[67364] = {locktarget = 1, canblock = false},		--连云堡射手
[67365] = {locktarget = 1, canblock = false},		--连云堡刀客
[67367] = {locktarget = 1, canblock = false},		--连云堡大刀
[67368] = {locktarget = 1, canblock = false},		--连云堡拳师
[67369] = {locktarget = 1, canblock = false},		--连云堡醉刀
[67599] = {locktarget = 3, canblock = false},		--山崖副本女徒
[83863] = {locktarget = 1, canblock = false},		--嵩山之巅单剑
[83864] = {locktarget = 1, canblock = false},		--嵩山之巅重剑
[83865] = {locktarget = 1, canblock = false},		--嵩山之巅转轮
[83866] = {locktarget = 1, canblock = false},		--嵩山之巅全套
[83867] = {locktarget = 1, canblock = false},		--嵩山之巅暗器
[83868] = {locktarget = 1, canblock = false},		--嵩山之巅八公
[83869] = {locktarget = 1, canblock = false},		--嵩山之巅钟镇
[83871] = {locktarget = 1, canblock = false},		--嵩山之巅冷禅
[85096] = {locktarget = 1, canblock = false},		--嵩山之巅冷禅
[83829] = {locktarget = 1, canblock = false},		--嵩山之路单剑
[83830] = {locktarget = 1, canblock = false},		--嵩山之路重剑
[83831] = {locktarget = 1, canblock = false},		--嵩山之路转轮
[83833] = {locktarget = 1, canblock = false},		--嵩山之路叛门武当
[83834] = {locktarget = 1, canblock = false},		--嵩山之路叛门华山
[83835] = {locktarget = 1, canblock = false},		--嵩山之路叛门峨眉
[83836] = {locktarget = 1, canblock = false},		--嵩山之路叛门日月
[83838] = {locktarget = 1, canblock = false},		--嵩山之路卜沉
[83839] = {locktarget = 1, canblock = false},		--嵩山之路沙天江
[83841] = {locktarget = 1, canblock = false},		--嵩山之路乐厚
[83893] = {locktarget = 1, canblock = false},		--嵩山之路转剑
[83894] = {locktarget = 1, canblock = false},		--嵩山之路阵法
[84640] = {locktarget = 1, canblock = false},		--嵩山之路单剑
[84641] = {locktarget = 1, canblock = false},		--嵩山之路重剑
[84642] = {locktarget = 1, canblock = false},		--嵩山之路转轮
[85953] = {locktarget = 1, canblock = false},		--大漠三环陆海
}
--------------------------------------------------------------------
MonsterVisual.AttributeName[26521] = --[[!AUTO_140]]"【頭目】"
MonsterVisual.AttributeName[26522] = --[[!AUTO_141]]"【禍害】"
MonsterVisual.AttributeName[26523] = --[[!AUTO_142]]"【禍害】"
MonsterVisual.AttributeName[26524] = --[[!AUTO_143]]"【禍害】"
MonsterVisual.AttributeName[26525] = --[[!AUTO_144]]"【禍害】"
MonsterVisual.AttributeName[26526] = --[[!AUTO_145]]"【頭目】"
MonsterVisual.AttributeName[26527] = --[[!AUTO_146]]"【頭目】"
MonsterVisual.AttributeName[26528] = --[[!AUTO_147]]"【禍害】"
MonsterVisual.AttributeName[26529] = --[[!AUTO_148]]"【禍害】"
MonsterVisual.AttributeName[26530] = --[[!AUTO_149]]"【禍害】"
MonsterVisual.AttributeName[26531] = --[[!AUTO_150]]"【禍害】"
MonsterVisual.AttributeName[26534] = --[[!AUTO_151]]"【禍害】"
MonsterVisual.AttributeName[26535] = --[[!AUTO_152]]"【禍害】"
MonsterVisual.AttributeName[26536] = --[[!AUTO_153]]"【頭目】"
MonsterVisual.AttributeName[26537] = --[[!AUTO_154]]"【禍害】"
MonsterVisual.AttributeName[26538] = --[[!AUTO_155]]"【禍害】"
MonsterVisual.AttributeName[26539] = --[[!AUTO_156]]"【禍害】"
MonsterVisual.AttributeName[26540] = --[[!AUTO_157]]"【禍害】"
MonsterVisual.AttributeName[26541] = --[[!AUTO_158]]"【禍害】"
MonsterVisual.AttributeName[26542] = --[[!AUTO_159]]"【頭目】"
MonsterVisual.AttributeName[26543] = --[[!AUTO_160]]"【頭目】"
MonsterVisual.AttributeName[26544] = --[[!AUTO_161]]"【禍害】"
MonsterVisual.AttributeName[26545] = --[[!AUTO_162]]"【禍害】"
MonsterVisual.AttributeName[26546] = --[[!AUTO_163]]"【禍害】"
MonsterVisual.AttributeName[26547] = --[[!AUTO_164]]"【頭目】"
MonsterVisual.AttributeName[26548] = --[[!AUTO_165]]"【頭目】"
MonsterVisual.AttributeName[26549] = --[[!AUTO_166]]"【禍害】"
MonsterVisual.AttributeName[26550] = --[[!AUTO_167]]"【禍害】"
MonsterVisual.AttributeName[26551] = --[[!AUTO_168]]"【禍害】"
MonsterVisual.AttributeName[26552] = --[[!AUTO_169]]"【禍害】"
MonsterVisual.AttributeName[26553] = --[[!AUTO_170]]"【頭目】"
MonsterVisual.AttributeName[26554] = --[[!AUTO_171]]"【禍害】"
MonsterVisual.AttributeName[26555] = --[[!AUTO_172]]"【禍害】"
MonsterVisual.AttributeName[26556] = --[[!AUTO_173]]"【禍害】"
MonsterVisual.AttributeName[26557] = --[[!AUTO_174]]"【頭目】"
MonsterVisual.AttributeName[26558] = --[[!AUTO_175]]"【頭目】"
MonsterVisual.AttributeName[26559] = --[[!AUTO_176]]"【禍害】"
MonsterVisual.AttributeName[26560] = --[[!AUTO_177]]"【禍害】"
MonsterVisual.AttributeName[26561] = --[[!AUTO_178]]"【禍害】"
MonsterVisual.AttributeName[26562] = --[[!AUTO_179]]"【禍害】"
MonsterVisual.AttributeName[26563] = --[[!AUTO_180]]"【禍害】"
MonsterVisual.AttributeName[26564] = --[[!AUTO_181]]"【禍害】"
MonsterVisual.AttributeName[26565] = --[[!AUTO_182]]"【禍害】"
MonsterVisual.AttributeName[26566] = --[[!AUTO_183]]"【頭目】"
MonsterVisual.AttributeName[26567] = --[[!AUTO_184]]"【頭目】"
MonsterVisual.AttributeName[26574] = --[[!AUTO_185]]"【頭目】"
MonsterVisual.AttributeName[26571] = --[[!AUTO_186]]"【頭目】"
MonsterVisual.AttributeName[26572] = --[[!AUTO_187]]"【頭目】"
MonsterVisual.AttributeName[26573] = --[[!AUTO_188]]"【頭目】"
MonsterVisual.AttributeName[26720] = --[[!AUTO_189]]"【禍害】"
MonsterVisual.AttributeName[26721] = --[[!AUTO_190]]"【禍害】"
MonsterVisual.AttributeName[26722] = --[[!AUTO_191]]"【禍害】"
MonsterVisual.AttributeName[26723] = --[[!AUTO_192]]"【禍害】"
MonsterVisual.AttributeName[26724] = --[[!AUTO_193]]"【頭目】"
MonsterVisual.AttributeName[26725] = --[[!AUTO_194]]"【禍害】"
MonsterVisual.AttributeName[26575] = --[[!AUTO_195]]"【禍害】"
MonsterVisual.AttributeName[26576] = --[[!AUTO_196]]"【禍害】"
MonsterVisual.AttributeName[26577] = --[[!AUTO_197]]"【頭目】"
MonsterVisual.AttributeName[26578] = --[[!AUTO_198]]"【禍害】"
MonsterVisual.AttributeName[26726] = --[[!AUTO_199]]"【禍害】"
MonsterVisual.AttributeName[26579] = --[[!AUTO_200]]"【禍害】"
MonsterVisual.AttributeName[26727] = --[[!AUTO_201]]"【禍害】"
MonsterVisual.AttributeName[26580] = --[[!AUTO_202]]"【頭目】"
MonsterVisual.AttributeName[26581] = --[[!AUTO_203]]"【禍害】"
MonsterVisual.AttributeName[26582] = --[[!AUTO_204]]"【禍害】"
MonsterVisual.AttributeName[26583] = --[[!AUTO_205]]"【頭目】"
MonsterVisual.AttributeName[26584] = --[[!AUTO_206]]"【禍害】"
MonsterVisual.AttributeName[26585] = --[[!AUTO_207]]"【禍害】"
MonsterVisual.AttributeName[26586] = --[[!AUTO_208]]"【禍害】"
MonsterVisual.AttributeName[26587] = --[[!AUTO_209]]"【禍害】"
MonsterVisual.AttributeName[26588] = --[[!AUTO_210]]"【頭目】"
MonsterVisual.AttributeName[26589] = --[[!AUTO_211]]"【禍害】"
MonsterVisual.AttributeName[26590] = --[[!AUTO_212]]"【禍害】"
MonsterVisual.AttributeName[26591] = --[[!AUTO_213]]"【禍害】"
MonsterVisual.AttributeName[26592] = --[[!AUTO_214]]"【禍害】"
MonsterVisual.AttributeName[26593] = --[[!AUTO_215]]"【頭目】"
MonsterVisual.AttributeName[26594] = --[[!AUTO_216]]"【頭目】"
MonsterVisual.AttributeName[26595] = --[[!AUTO_217]]"【禍害】"
MonsterVisual.AttributeName[26596] = --[[!AUTO_218]]"【禍害】"
MonsterVisual.AttributeName[26597] = --[[!AUTO_219]]"【禍害】"
MonsterVisual.AttributeName[26598] = --[[!AUTO_220]]"【禍害】"
MonsterVisual.AttributeName[26599] = --[[!AUTO_221]]"【頭目】"
MonsterVisual.AttributeName[26601] = --[[!AUTO_222]]"【禍害】"
MonsterVisual.AttributeName[26600] = --[[!AUTO_223]]"【禍害】"
MonsterVisual.AttributeName[26602] = --[[!AUTO_224]]"【禍害】"
MonsterVisual.AttributeName[26603] = --[[!AUTO_225]]"【禍害】"
MonsterVisual.AttributeName[26608] = --[[!AUTO_226]]"【頭目】"
MonsterVisual.AttributeName[26604] = --[[!AUTO_227]]"【頭目】"
MonsterVisual.AttributeName[26605] = --[[!AUTO_228]]"【禍害】"
MonsterVisual.AttributeName[26607] = --[[!AUTO_229]]"【禍害】"
MonsterVisual.AttributeName[26606] = --[[!AUTO_230]]"【禍害】"
MonsterVisual.AttributeName[26656] = --[[!AUTO_231]]"【哨兵】"
MonsterVisual.AttributeName[26657] = --[[!AUTO_232]]"【哨兵】"
MonsterVisual.AttributeName[26658] = --[[!AUTO_233]]"【探子】"
MonsterVisual.AttributeName[26659] = --[[!AUTO_234]]"【探子】"
MonsterVisual.AttributeName[26660] = --[[!AUTO_235]]"【探子】"
MonsterVisual.AttributeName[26661] = --[[!AUTO_236]]"【探子】"
MonsterVisual.AttributeName[26662] = --[[!AUTO_237]]"【哨兵】"
MonsterVisual.AttributeName[26663] = --[[!AUTO_238]]"【探子】"
MonsterVisual.AttributeName[26664] = --[[!AUTO_239]]"【護衛】"
MonsterVisual.AttributeName[26665] = --[[!AUTO_240]]"【哨兵】"
MonsterVisual.AttributeName[26666] = --[[!AUTO_241]]"【探子】"
MonsterVisual.AttributeName[26728] = --[[!AUTO_242]]"【護衛】"
MonsterVisual.AttributeName[26667] = --[[!AUTO_243]]"【哨兵】"
MonsterVisual.AttributeName[26668] = --[[!AUTO_244]]"【護衛】"
MonsterVisual.AttributeName[26669] = --[[!AUTO_245]]"【探子】"
MonsterVisual.AttributeName[26670] = --[[!AUTO_246]]"【哨兵】"
MonsterVisual.AttributeName[26671] = --[[!AUTO_247]]"【探子】"
MonsterVisual.AttributeName[26672] = --[[!AUTO_248]]"【探子】"
MonsterVisual.AttributeName[26673] = --[[!AUTO_249]]"【探子】"
MonsterVisual.AttributeName[26674] = --[[!AUTO_250]]"【哨兵】"
MonsterVisual.AttributeName[26675] = --[[!AUTO_251]]"【探子】"
MonsterVisual.AttributeName[26676] = --[[!AUTO_252]]"【探子】"
MonsterVisual.AttributeName[26677] = --[[!AUTO_253]]"【探子】"
MonsterVisual.AttributeName[26678] = --[[!AUTO_254]]"【探子】"
MonsterVisual.AttributeName[26679] = --[[!AUTO_255]]"【探子】"
MonsterVisual.AttributeName[26680] = --[[!AUTO_256]]"【探子】"
MonsterVisual.AttributeName[26681] = --[[!AUTO_257]]"【哨兵】"
MonsterVisual.AttributeName[26682] = --[[!AUTO_258]]"【探子】"
MonsterVisual.AttributeName[26683] = --[[!AUTO_259]]"【護衛】"
MonsterVisual.AttributeName[26684] = --[[!AUTO_260]]"【哨兵】"
MonsterVisual.AttributeName[26685] = --[[!AUTO_261]]"【探子】"
MonsterVisual.AttributeName[26686] = --[[!AUTO_262]]"【護衛】"
MonsterVisual.AttributeName[26687] = --[[!AUTO_263]]"【探子】"
MonsterVisual.AttributeName[26688] = --[[!AUTO_264]]"【探子】"
MonsterVisual.AttributeName[26689] = --[[!AUTO_265]]"【探子】"
MonsterVisual.AttributeName[26690] = --[[!AUTO_266]]"【哨兵】"
MonsterVisual.AttributeName[26691] = --[[!AUTO_267]]"【探子】"
MonsterVisual.AttributeName[26692] = --[[!AUTO_268]]"【護衛】"
MonsterVisual.AttributeName[26693] = --[[!AUTO_269]]"【哨兵】"
MonsterVisual.AttributeName[26694] = --[[!AUTO_270]]"【護衛】"
MonsterVisual.AttributeName[26695] = --[[!AUTO_271]]"【探子】"
MonsterVisual.AttributeName[26696] = --[[!AUTO_272]]"【探子】"
MonsterVisual.AttributeName[26697] = --[[!AUTO_273]]"【探子】"
MonsterVisual.AttributeName[26698] = --[[!AUTO_274]]"【護衛】"
MonsterVisual.AttributeName[26699] = --[[!AUTO_275]]"【探子】"
MonsterVisual.AttributeName[26700] = --[[!AUTO_276]]"【探子】"
MonsterVisual.AttributeName[26701] = --[[!AUTO_277]]"【哨兵】"
MonsterVisual.AttributeName[26702] = --[[!AUTO_278]]"【探子】"
MonsterVisual.AttributeName[26703] = --[[!AUTO_279]]"【探子】"
MonsterVisual.AttributeName[26704] = --[[!AUTO_280]]"【探子】"
MonsterVisual.AttributeName[26705] = --[[!AUTO_281]]"【探子】"
MonsterVisual.AttributeName[26706] = --[[!AUTO_282]]"【哨兵】"
MonsterVisual.AttributeName[26707] = --[[!AUTO_283]]"【探子】"
MonsterVisual.AttributeName[26708] = --[[!AUTO_284]]"【護衛】"
MonsterVisual.AttributeName[26709] = --[[!AUTO_285]]"【探子】"
MonsterVisual.AttributeName[26710] = --[[!AUTO_286]]"【護衛】"
MonsterVisual.AttributeName[26711] = --[[!AUTO_287]]"【哨兵】"
MonsterVisual.AttributeName[26712] = --[[!AUTO_288]]"【探子】"
MonsterVisual.AttributeName[26713] = --[[!AUTO_289]]"【護衛】"
MonsterVisual.AttributeName[26714] = --[[!AUTO_290]]"【哨兵】"
MonsterVisual.AttributeName[26715] = --[[!AUTO_291]]"【探子】"
MonsterVisual.AttributeName[26716] = --[[!AUTO_292]]"【護衛】"
MonsterVisual.AttributeName[26717] = --[[!AUTO_293]]"【探子】"
MonsterVisual.AttributeName[26718] = --[[!AUTO_294]]"【探子】"
MonsterVisual.AttributeName[26719] = --[[!AUTO_295]]"【探子】"
MonsterVisual.AttributeName[26729] = --[[!AUTO_296]]"【哨兵】"
MonsterVisual.AttributeName[26730] = --[[!AUTO_297]]"【哨兵】"
MonsterVisual.AttributeName[26731] = --[[!AUTO_298]]"【哨兵】"
MonsterVisual.AttributeName[26732] = --[[!AUTO_299]]"【探子】"
MonsterVisual.AttributeName[26733] = --[[!AUTO_300]]"【探子】"
MonsterVisual.AttributeName[26734] = --[[!AUTO_301]]"【探子】"
MonsterVisual.AttributeName[26735] = --[[!AUTO_302]]"【探子】"
MonsterVisual.AttributeName[26736] = --[[!AUTO_303]]"【哨兵】"
MonsterVisual.AttributeName[27165] = --[[!AUTO_304]]"【哨兵】"
MonsterVisual.AttributeName[27166] = --[[!AUTO_305]]"【哨兵】"
MonsterVisual.AttributeName[27167] = --[[!AUTO_306]]"【哨兵】"
MonsterVisual.AttributeName[27168] = --[[!AUTO_307]]"【哨兵】"
MonsterVisual.AttributeName[27169] = --[[!AUTO_308]]"【探子】"
MonsterVisual.AttributeName[27170] = --[[!AUTO_309]]"【探子】"
MonsterVisual.AttributeName[27171] = --[[!AUTO_310]]"【探子】"
MonsterVisual.AttributeName[27172] = --[[!AUTO_311]]"【探子】"
MonsterVisual.AttributeName[27173] = --[[!AUTO_312]]"【護衛】"
MonsterVisual.AttributeName[27174] = --[[!AUTO_313]]"【護衛】"
MonsterVisual.AttributeName[27175] = --[[!AUTO_314]]"【護衛】"
MonsterVisual.AttributeName[27176] = --[[!AUTO_315]]"【護衛】"
MonsterVisual.AttributeName[27177] = --[[!AUTO_316]]"【護衛】"
MonsterVisual.AttributeName[27178] = --[[!AUTO_317]]"【護衛】"
MonsterVisual.AttributeName[27153] = --[[!AUTO_318]]"【除害】"
MonsterVisual.AttributeName[27154] = --[[!AUTO_319]]"【除害】"
MonsterVisual.AttributeName[27155] = --[[!AUTO_320]]"【除害】"
MonsterVisual.AttributeName[27156] = --[[!AUTO_321]]"【除害】"
MonsterVisual.AttributeName[27157] = --[[!AUTO_322]]"【除害】"
MonsterVisual.AttributeName[27158] = --[[!AUTO_323]]"【除害】"
MonsterVisual.AttributeName[27159] = --[[!AUTO_324]]"【除害】"
MonsterVisual.AttributeName[27160] = --[[!AUTO_325]]"【除害】"
MonsterVisual.AttributeName[27161] = --[[!AUTO_326]]"【除害】"
MonsterVisual.AttributeName[27162] = --[[!AUTO_327]]"【除害】"
MonsterVisual.AttributeName[27163] = --[[!AUTO_328]]"【除害】"
MonsterVisual.AttributeName[27164] = --[[!AUTO_329]]"【除害】"
--------------------------------------------------------------------

MonsterVisual.MonsterNotes[3461] = --[[!AUTO_330]]"梅寨嘍囉\r人型普通怪物\r山寨中最不缺少的小嘍囉。會幾招江湖劍法，偶爾會舞兩手。\r攻擊力：★\r防禦力：★\r生命力：★\r戰鬥經驗：☆\r技能：\r裂石斬：2段重攻擊的劍法。\r江湖評價：無名小卒"
MonsterVisual.MonsterNotes[3466] = --[[!AUTO_331]]"巡山小頭目\r人型普通怪物\r梅關寨子中靠混混起來的小頭目。說是頭目，其實和普通怪物沒什麼兩樣。\r攻擊力：★\r防禦力：★\r生命力：★\r戰鬥經驗：☆\r技能：\r掃葉劍：攻擊的時候能下盤閃避的招式。\r江湖評價：無名小卒"
MonsterVisual.MonsterNotes[3467] = --[[!AUTO_332]]"穿山甲\r野獸普通怪物\r散佈在梅關的各處的動物。善打洞。\r攻擊力：★\r防禦力：★☆\r生命力：★\r戰鬥經驗：☆\r特性：\r鱗片：全身覆蓋的鱗片可以減少其受到的外功傷害。\r技能：\r酸液：穿山甲的舌頭上帶有酸液，可以腐蝕目標造成護甲值降低。\r江湖評價：安全野獸"
MonsterVisual.MonsterNotes[3468] = --[[!AUTO_333]]"梅寨哨探\r人型普通怪物\r山寨中最不缺少的小嘍囉。會幾招江湖槍法，性格謹慎，是梅寨的中堅力量。\r攻擊力：★☆\r防禦力：★☆\r生命力：★\r戰鬥經驗：★☆\r技能：\r回馬槍：模仿名槍術回馬槍的招式，象模像樣的，威力還行。\r江湖評價：無名小卒"
MonsterVisual.MonsterNotes[3470] = --[[!AUTO_334]]"彎角野牛\r野獸普通怪物\r彎角野牛分佈於梅關古道中部，散漫，性格溫和，但是一道激怒，會使用雙角給敵人狠狠的攻擊。\r攻擊力：★\r防禦力：★☆\r生命力：★★\r戰鬥經驗：★\r特性：\r力大無窮：幾乎所有的功能都能把破綻狀態下的目標挑飛或者撞倒。\r江湖評價：三級危險動物"
MonsterVisual.MonsterNotes[3472] = --[[!AUTO_335]]"利劍山賊\r人型普通怪物\r山寨中的小嘍囉。劍法比較順，戰鬥力較嘍囉高一點，但是劍術和其他小嘍囉沒什麼不同。\r攻擊力：★\r防禦力：★\r生命力：★\r戰鬥經驗：★\r技能：\r裂石斬：2段重攻擊的劍法。\r江湖評價：無名小卒"
MonsterVisual.MonsterNotes[3473] = --[[!AUTO_336]]"長槍山賊\r人型普通怪物\r山寨中的小嘍囉。槍法比較熟練，戰鬥力較嘍囉高一點，但是槍招和其他小嘍囉沒什麼大的 差別。\r攻擊力：★\r防禦力：★\r生命力：★\r戰鬥經驗：★\r技能：\r回馬槍：模仿名槍術回馬槍的招式，威力很大。\r江湖評價：無名小卒"
MonsterVisual.MonsterNotes[3474] = --[[!AUTO_337]]"鐵勁\r人型頭目\r梅莊強盜大當家，善使一根狼牙棒，一式風捲殘雲用得甚是漂亮。\r攻擊力：★★★\r防禦力：★★★\r生命力：★★★\r戰鬥經驗：★★★\r技能：\r風捲殘雲：對前方扇型範圍做橫掃攻擊，能打飛破綻狀態下的目標。\r混沌開天：使用狼牙棒狠砸前方，造成相當大的傷害。\r江湖評價：二流高手"
MonsterVisual.MonsterNotes[4857] = --[[!AUTO_338]]"梅寨死士\r人型普通怪物\r梅莊中最有戰鬥力的一夥人。屬於隨時都可以賣命的心腹。\r攻擊力：★★\r防禦力：☆\r生命力：★\r戰鬥經驗：★☆\r技能：\r裂石斬：2段重攻擊的劍法。\r江湖評價：四流高手"
MonsterVisual.MonsterNotes[3475] = --[[!AUTO_339]]"飛葉弩手\r人型普通怪物\r梅莊中工夫最爛的一批人，但同時也是戰鬥力最高的一批人。原因無他。工具好用。\r攻擊力：★\r防禦力：☆\r生命力：★\r戰鬥經驗：★☆\r技能：\r連環踢：把近身的目標踢退的防身腿法。\r江湖評價：無名小卒"
MonsterVisual.MonsterNotes[6052] = --[[!AUTO_340]]"修羅劍使\r人型普通怪物\r少見的反手劍，刺和紮用得相當好。不知為何在武當上一帶活動。\r攻擊力：★\r防禦力：★\r生命力：★\r戰鬥經驗：★☆\r特性：\r背刺：用劍擁有天生的5%致命一擊機率。\r江湖評價：三流高手。"

--------------------------------------------------------------------

MonsterVisual.MonsterAttribute[26421] = {11334,--[[!AUTO_341]]"低級生命強化：\r根據怪物等級，增加怪物少許生命上限。"}
MonsterVisual.MonsterAttribute[26422] = {11335,--[[!AUTO_342]]"中級生命強化：\r根據怪物等級，增加怪物一些生命上限。"}
MonsterVisual.MonsterAttribute[26423] = {11336,--[[!AUTO_343]]"高級生命強化：\r根據怪物等級，增加怪物許多生命上限。"}
MonsterVisual.MonsterAttribute[26424] = {11337,--[[!AUTO_344]]"頂級生命強化：\r根據怪物等級，增加怪物大量生命上限。"}
MonsterVisual.MonsterAttribute[26425] = {11334,--[[!AUTO_345]]"低級生命強化：\r根據怪物等級，增加怪物少許生命上限。"}
MonsterVisual.MonsterAttribute[26426] = {11335,--[[!AUTO_346]]"中級生命強化：\r根據怪物等級，增加怪物一些生命上限。"}
MonsterVisual.MonsterAttribute[26427] = {11336,--[[!AUTO_347]]"高級生命強化：\r根據怪物等級，增加怪物許多生命上限。"}
MonsterVisual.MonsterAttribute[26428] = {11337,--[[!AUTO_348]]"頂級生命強化：\r根據怪物等級，增加怪物大量生命上限。"}
MonsterVisual.MonsterAttribute[26429] = {11334,--[[!AUTO_349]]"低級生命強化：\r根據怪物等級，增加怪物少許生命上限。"}
MonsterVisual.MonsterAttribute[26430] = {11335,--[[!AUTO_350]]"中級生命強化：\r根據怪物等級，增加怪物一些生命上限。"}
MonsterVisual.MonsterAttribute[26431] = {11336,--[[!AUTO_351]]"高級生命強化：\r根據怪物等級，增加怪物許多生命上限。"}
MonsterVisual.MonsterAttribute[26432] = {11337,--[[!AUTO_352]]"頂級生命強化：\r根據怪物等級，增加怪物大量生命上限。"}
MonsterVisual.MonsterAttribute[26433] = {11338,--[[!AUTO_353]]"低級破綻增加：\r為怪物增加少許的破綻上限。"}
MonsterVisual.MonsterAttribute[26434] = {11339,--[[!AUTO_354]]"中級破綻增加：\r為怪物增加一些的破綻上限。"}
MonsterVisual.MonsterAttribute[26435] = {11340,--[[!AUTO_355]]"高級破綻增加：\r為怪物增加許多的破綻上限。"}
MonsterVisual.MonsterAttribute[26436] = {11341,--[[!AUTO_356]]"頂級破綻增加：\r為怪物增加大量的破綻上限。"}
MonsterVisual.MonsterAttribute[26437] = {11342,--[[!AUTO_357]]"出手穩健：\r怪物的外功攻擊浮動範圍降低，切更靠近最大傷害。"}
MonsterVisual.MonsterAttribute[26438] = {11343,--[[!AUTO_358]]"刀劍無眼：\r怪物的外功攻擊浮動範圍變得很大，且最大傷害增加。"}
MonsterVisual.MonsterAttribute[26439] = {11344,--[[!AUTO_359]]"低級外攻加強：\r為怪物增加少許的外功攻擊力。"}
MonsterVisual.MonsterAttribute[26440] = {11345,--[[!AUTO_360]]"中級外攻加強：\r為怪物增加一些的外功攻擊力。"}
MonsterVisual.MonsterAttribute[26441] = {11346,--[[!AUTO_361]]"高級外攻加強：\r為怪物增加許多的外功攻擊力。"}
MonsterVisual.MonsterAttribute[26442] = {11347,--[[!AUTO_362]]"頂級外攻加強：\r為怪物增加大量的外功攻擊力。"}
MonsterVisual.MonsterAttribute[26443] = {11348,--[[!AUTO_363]]"護甲增強：\r該怪物的護甲值增加。"}
MonsterVisual.MonsterAttribute[26444] = {11349,--[[!AUTO_364]]"外功致命一擊：\r大幅度增加怪物的外功致命一擊機率。"}
MonsterVisual.MonsterAttribute[26445] = {11350,--[[!AUTO_365]]"外功致命爆擊：\r大幅度增加怪物的外功致命一擊傷害。"}
MonsterVisual.MonsterAttribute[26446] = {11351,--[[!AUTO_366]]"冷靜：\r怪物的內功攻擊浮動範圍降低，切更靠近最大傷害。"}
MonsterVisual.MonsterAttribute[26447] = {11352,--[[!AUTO_367]]"情緒化：\r怪物的內功攻擊浮動範圍變得很大，且最大傷害增加。"}
MonsterVisual.MonsterAttribute[26448] = {11353,--[[!AUTO_368]]"低級內攻加強：\r為怪物增加少許的內功攻擊力。"}
MonsterVisual.MonsterAttribute[26449] = {11354,--[[!AUTO_369]]"中級內攻加強：\r為怪物增加一些的內功攻擊力。"}
MonsterVisual.MonsterAttribute[26450] = {11355,--[[!AUTO_370]]"高級內攻加強：\r為怪物增加許多的內功攻擊力。"}
MonsterVisual.MonsterAttribute[26451] = {11356,--[[!AUTO_371]]"頂級內攻加強：\r為怪物增加大量的內功攻擊力。"}
MonsterVisual.MonsterAttribute[26452] = {11357,--[[!AUTO_372]]"內功抵禦增強：\r該怪物的內功抵禦值增加。"}
MonsterVisual.MonsterAttribute[26453] = {11358,--[[!AUTO_373]]"內功致命一擊：\r大幅度增加怪物的內功致命一擊機率。"}
MonsterVisual.MonsterAttribute[26454] = {11359,--[[!AUTO_374]]"內功致命爆擊：\r大幅度增加怪物的內功致命一擊傷害。"}
MonsterVisual.MonsterAttribute[26455] = {11360,--[[!AUTO_375]]"速度增加：\r大幅度增加怪物的移動速度。"}
MonsterVisual.MonsterAttribute[26456] = {11361,--[[!AUTO_376]]"低級火焰抵抗：\r為怪物增加少許的火焰抵抗。"}
MonsterVisual.MonsterAttribute[26457] = {11362,--[[!AUTO_377]]"中級火焰抵抗：\r為怪物增加一些的火焰抵抗。"}
MonsterVisual.MonsterAttribute[26458] = {11363,--[[!AUTO_378]]"高級火焰抵抗：\r為怪物增加許多的火焰抵抗。"}
MonsterVisual.MonsterAttribute[26459] = {11364,--[[!AUTO_379]]"頂級火焰抵抗：\r為怪物增加大量的火焰抵抗。"}
MonsterVisual.MonsterAttribute[26460] = {11365,--[[!AUTO_380]]"低級寒冰抵抗：\r為怪物增加少許的寒冰抵抗。"}
MonsterVisual.MonsterAttribute[26461] = {11366,--[[!AUTO_381]]"中級寒冰抵抗：\r為怪物增加一些的寒冰抵抗。"}
MonsterVisual.MonsterAttribute[26462] = {11367,--[[!AUTO_382]]"高級寒冰抵抗：\r為怪物增加許多的寒冰抵抗。"}
MonsterVisual.MonsterAttribute[26463] = {11368,--[[!AUTO_383]]"頂級寒冰抵抗：\r為怪物增加大量的寒冰抵抗。"}
MonsterVisual.MonsterAttribute[26464] = {11369,--[[!AUTO_384]]"低級蠱毒抵抗：\r為怪物增加少許的蠱毒抵抗。"}
MonsterVisual.MonsterAttribute[26465] = {11370,--[[!AUTO_385]]"中級蠱毒抵抗：\r為怪物增加一些的蠱毒抵抗。"}
MonsterVisual.MonsterAttribute[26466] = {11371,--[[!AUTO_386]]"高級蠱毒抵抗：\r為怪物增加許多的蠱毒抵抗。"}
MonsterVisual.MonsterAttribute[26467] = {11372,--[[!AUTO_387]]"頂級蠱毒抵抗：\r為怪物增加大量的蠱毒抵抗。"}
MonsterVisual.MonsterAttribute[26473] = {11373,--[[!AUTO_388]]"蛇毒：\r普通攻擊的時候，有機率使目標中毒。"}
MonsterVisual.MonsterAttribute[26474] = {11374,--[[!AUTO_389]]"絲縛：\r普通攻擊時，有機率使目標定身。"}
MonsterVisual.MonsterAttribute[26475] = {11375,--[[!AUTO_390]]"紅眼：\r當怪物進入戰鬥時間超過10秒後，會增加攻擊力。"}
MonsterVisual.MonsterAttribute[26476] = {11376,--[[!AUTO_391]]"虎嘯：\r每一定HP百分比會咆哮，使周圍目標攻擊力顯著下降。"}
MonsterVisual.MonsterAttribute[26477] = {11377,--[[!AUTO_392]]"酸液：\r普通攻擊可以有機率降低目標護甲值。"}
MonsterVisual.MonsterAttribute[26478] = {11378,--[[!AUTO_393]]"犧牲：\r蜜蜂會付出自己的生命，對目標發射毒針。自殺，目標中毒。"}
MonsterVisual.MonsterAttribute[26479] = {11379,--[[!AUTO_394]]"群居：\r烏鴉在進戰鬥時，總會呼叫附近的夥伴一起攻擊。"}
MonsterVisual.MonsterAttribute[26480] = {11380,--[[!AUTO_395]]"遲鈍：\r禿鷲擁有比一般怪物更高的破綻上限。"}
MonsterVisual.MonsterAttribute[26481] = {11381,--[[!AUTO_396]]"貼地：\r一些上段攻擊的技能將無法攻擊到正常狀態下的鼬。"}
MonsterVisual.MonsterAttribute[26482] = {11382,--[[!AUTO_397]]"臭屁:\r貂經常在有危險時。放出毒氣使玩家中毒。"}
MonsterVisual.MonsterAttribute[26483] = {11383,--[[!AUTO_398]]"群居：\r烏鴉在進戰鬥時，總會呼叫附近的夥伴一起攻擊。"}
MonsterVisual.MonsterAttribute[26484] = {11384,--[[!AUTO_399]]"完美生物:\r豹子不可能出現破綻狀態。"}
MonsterVisual.MonsterAttribute[26485] = {11385,--[[!AUTO_400]]"豪氣：\r該怪物熱愛戰鬥，能在戰鬥中調整自己。按時間恢復破綻。"}
MonsterVisual.MonsterAttribute[26486] = {11386,--[[!AUTO_401]]"霸道：\r該怪物普通攻擊能造成額外的破綻值。"}
MonsterVisual.MonsterAttribute[26487] = {11387,--[[!AUTO_402]]"狡詐：\r該怪物普通攻擊能有機會使人流血。"}
MonsterVisual.MonsterAttribute[26807] = {11388,--[[!AUTO_403]]"探察：\r該怪物在戰鬥時，會常常逃跑。"}
MonsterVisual.MonsterAttribute[26808] = {11389,--[[!AUTO_404]]"崗哨：\r該怪物在進戰鬥時，會四處呼救。"}
MonsterVisual.MonsterAttribute[26809] = {11390,--[[!AUTO_405]]"守護：\r該怪物會經常回血。"}
MonsterVisual.MonsterAttribute[26818] = {11391,--[[!AUTO_406]]"皮糙肉厚：\r大幅度降低該怪物受到的傷害。"}
MonsterVisual.MonsterAttribute[26819] = {11392,--[[!AUTO_407]]"靈動：\r該怪物的任何攻擊在目標破綻滿時，都帶控制效果。"}
MonsterVisual.MonsterAttribute[26820] = {11393,--[[!AUTO_408]]"血毒：\r該怪物在掉血一半後。必定使目前目標中毒。"}
MonsterVisual.MonsterAttribute[26821] = {11394,--[[!AUTO_409]]"膽小：\r經常逃跑。"}
MonsterVisual.MonsterAttribute[26822] = {11395,--[[!AUTO_410]]"植物：\r固定不動。"}
MonsterVisual.MonsterAttribute[26823] = {11396,--[[!AUTO_411]]"妖怪：\r妖怪擁有比普通怪物更高的護甲和內功抵禦值。"}

--------------------------------------------------------------------

-- MonsterVisual.WalkRunBlendParams[模型路径ID] = {走的速度, 跑的速度, 走的组合动作名, 跑的组合动作名, 走跑的组合动作名}
MonsterVisual.WalkRunBlendParams[0]		= {1.5, 3.5, --[[!]]"行走", --[[!]]"战斗奔跑", --[[!]]"走跑"}	-- 默认配置
MonsterVisual.WalkRunBlendParams[13942]		= {3, 8, --[[!]]"行走", --[[!]]"战斗奔跑", --[[!]]"走跑"}		-- 嗜血和尚
MonsterVisual.WalkRunBlendParams[15239]		= {1.5, 5, --[[!]]"行走", --[[!]]"奔跑", --[[!]]"走跑"}		-- models\npcs\npcs\战斗npc\新日月教年轻女弟子\新日月教年轻女弟子.ecm
MonsterVisual.WalkRunBlendParams[15464]		= {0.7, 0.7, --[[!]]"行走", --[[!]]"行走", --[[!]]"走跑"}		-- Models\NPCs\NPCs\普通npc\花店小妹\花店小妹.ecm（如果一个普通的NPC，没有奔跑类动作，就把两个动作设一样，走的速度填对，跑和走一样就行）
MonsterVisual.WalkRunBlendParams[15465]		= {0.7, 0.7, --[[!]]"行走", --[[!]]"行走", --[[!]]"走跑"}		-- Models\NPCs\NPCs\普通npc\花店小妹02\花店小妹02.ecm
MonsterVisual.WalkRunBlendParams[7114]		= {0.7, 0.7, --[[!]]"行走", --[[!]]"行走", --[[!]]"走跑"}		-- Models\NPCs\NPCs\普通NPC\江南男童\江南男童.ecm
MonsterVisual.WalkRunBlendParams[16161]		= {20, 40, --[[!]]"行走", --[[!]]"行走", --[[!]]"走跑"}		-- Models\NPCs\怪物\boss\帮派专用boss独角兽\帮派专用boss独角兽.ecm
MonsterVisual.WalkRunBlendParams[16159]		= {3, 5, --[[!]]"行走", --[[!]]"战斗奔跑", --[[!]]"走跑"}		-- Models\NPCs\怪物\boss\帮派专用boss山猴小\帮派专用boss山猴小.ecm
MonsterVisual.WalkRunBlendParams[16157]		= {6, 10, --[[!]]"行走", --[[!]]"战斗奔跑", --[[!]]"走跑"}		-- Models\NPCs\怪物\boss\帮派专用boss山猴中\帮派专用boss山猴中.ecm
MonsterVisual.WalkRunBlendParams[16158]		= {14.4, 24, --[[!]]"行走", --[[!]]"行走", --[[!]]"走跑"}		-- Models\NPCs\怪物\boss\帮派专用boss山猴大\帮派专用boss山猴大.ecm
MonsterVisual.WalkRunBlendParams[16160]		= {12, 24, --[[!]]"行走", --[[!]]"行走", --[[!]]"走跑"}		-- Models\NPCs\怪物\boss\帮派专用boss巨蝎\帮派专用boss巨蝎.ecm
MonsterVisual.WalkRunBlendParams[16162]		= {15, 30, --[[!]]"行走", --[[!]]"行走", --[[!]]"走跑"}		-- Models\NPCs\怪物\boss\帮派专用boss白猿\帮派专用boss白猿.ecm
MonsterVisual.WalkRunBlendParams[16163]		= {7.5, 20, --[[!]]"行走", --[[!]]"行走", --[[!]]"走跑"}		-- Models\NPCs\怪物\boss\帮派专用boss野牛\帮派专用boss野牛.ecm
MonsterVisual.WalkRunBlendParams[20745]		= {1.5, 5, "行走", "戰鬥奔跑", "走跑"} -- Models\NPCs\怪物\鬼怪\刃魔狼白\刃魔狼白.ecm
MonsterVisual.WalkRunBlendParams[20793]		= {5, 12, "行走", "戰鬥奔跑", "走跑"} -- Models\NPCs\怪物\鬼怪\刃魔狼白\刃魔狼白大.ecm
MonsterVisual.WalkRunBlendParams[20774]		= {3.5, 8, "行走", "戰鬥奔跑", "走跑"} -- Models\NPCs\怪物\鬼怪\剑冢鬼怪\剑冢鬼怪土.ecm
MonsterVisual.WalkRunBlendParams[20775]		= {3.5, 8, "行走", "戰鬥奔跑", "走跑"} -- Models\NPCs\怪物\鬼怪\剑冢鬼怪\剑冢鬼怪木.ecm
MonsterVisual.WalkRunBlendParams[20776]		= {3.5, 8, "行走", "戰鬥奔跑", "走跑"} -- Models\NPCs\怪物\鬼怪\剑冢鬼怪\剑冢鬼怪水.ecm
MonsterVisual.WalkRunBlendParams[20777]		= {3.5, 8, "行走", "戰鬥奔跑", "走跑"} -- Models\NPCs\怪物\鬼怪\剑冢鬼怪\剑冢鬼怪火.ecm
MonsterVisual.WalkRunBlendParams[20778]		= {3.5, 8, "行走", "戰鬥奔跑", "走跑"} -- Models\NPCs\怪物\鬼怪\剑冢鬼怪\剑冢鬼怪金.ecm
MonsterVisual.WalkRunBlendParams[20769]		= {3.5, 8, "行走", "戰鬥奔跑", "走跑"} -- Models\NPCs\怪物\鬼怪\刑鬼\刑鬼土.ecm
MonsterVisual.WalkRunBlendParams[20770]		= {3.5, 8, "行走", "戰鬥奔跑", "走跑"} -- Models\NPCs\怪物\鬼怪\刑鬼\刑鬼木.ecm
MonsterVisual.WalkRunBlendParams[20771]		= {3.5, 8, "行走", "戰鬥奔跑", "走跑"} -- Models\NPCs\怪物\鬼怪\刑鬼\刑鬼水.ecm
MonsterVisual.WalkRunBlendParams[20772]		= {3.5, 8, "行走", "戰鬥奔跑", "走跑"} -- Models\NPCs\怪物\鬼怪\刑鬼\刑鬼火.ecm
MonsterVisual.WalkRunBlendParams[20773]		= {3.5, 8, "行走", "戰鬥奔跑", "走跑"} -- Models\NPCs\怪物\鬼怪\刑鬼\刑鬼金.ecm
MonsterVisual.WalkRunBlendParams[20787]		= {2.5, 6, "行走", "戰鬥奔跑", "走跑"} -- Models\NPCs\怪物\鬼怪\红衣女鬼\红衣女鬼土.ecm
MonsterVisual.WalkRunBlendParams[20788]		= {2.5, 6, "行走", "戰鬥奔跑", "走跑"} -- Models\NPCs\怪物\鬼怪\红衣女鬼\红衣女鬼木.ecm
MonsterVisual.WalkRunBlendParams[20789]		= {2.5, 6, "行走", "戰鬥奔跑", "走跑"} -- Models\NPCs\怪物\鬼怪\红衣女鬼\红衣女鬼水.ecm
MonsterVisual.WalkRunBlendParams[20790]		= {2.5, 6, "行走", "戰鬥奔跑", "走跑"} -- Models\NPCs\怪物\鬼怪\红衣女鬼\红衣女鬼火.ecm
MonsterVisual.WalkRunBlendParams[20791]		= {2.5, 6, "行走", "戰鬥奔跑", "走跑"} -- Models\NPCs\怪物\鬼怪\红衣女鬼\红衣女鬼金.ecm
MonsterVisual.WalkRunBlendParams[20779]		= {2.5, 6, "行走", "戰鬥奔跑", "走跑"} -- Models\NPCs\怪物\鬼怪\商旅亡魂\商旅亡魂土.ecm
MonsterVisual.WalkRunBlendParams[20780]		= {2.5, 6, "行走", "戰鬥奔跑", "走跑"} -- Models\NPCs\怪物\鬼怪\商旅亡魂\商旅亡魂木.ecm
MonsterVisual.WalkRunBlendParams[20781]		= {2.5, 6, "行走", "戰鬥奔跑", "走跑"} -- Models\NPCs\怪物\鬼怪\商旅亡魂\商旅亡魂水.ecm
MonsterVisual.WalkRunBlendParams[20782]		= {2.5, 6, "行走", "戰鬥奔跑", "走跑"} -- Models\NPCs\怪物\鬼怪\商旅亡魂\商旅亡魂火.ecm
MonsterVisual.WalkRunBlendParams[20783]		= {2.5, 6, "行走", "戰鬥奔跑", "走跑"} -- Models\NPCs\怪物\鬼怪\商旅亡魂\商旅亡魂金.ecm
MonsterVisual.WalkRunBlendParams[20786]		= {3.5, 7.5, "行走", "戰鬥奔跑", "走跑"} -- Models\NPCs\怪物\鬼怪\死牢怨魂\死牢怨魂金.ecm
MonsterVisual.WalkRunBlendParams[20785]		= {3, 7, "行走", "戰鬥奔跑", "走跑"} -- Models\NPCs\怪物\鬼怪\树甲人\树甲人木.ecm
MonsterVisual.WalkRunBlendParams[20792]		= {2.5, 6, "行走", "戰鬥奔跑", "走跑"} -- Models\NPCs\怪物\鬼怪\剑冢护剑流亡剑客\剑冢护剑流亡剑客水.ecm
MonsterVisual.WalkRunBlendParams[20767]		= {3, 7.5, "行走", "戰鬥奔跑", "走跑"} -- Models\NPCs\怪物\机关\梅庄弩兽\梅庄弩兽火.ecm
MonsterVisual.WalkRunBlendParams[20766]		= {3.2, 7, "行走", "戰鬥奔跑", "走跑"} -- Models\NPCs\怪物\人形\囚奴\囚奴土.ecm
MonsterVisual.WalkRunBlendParams[20784]		= {5, 12, "行走", "戰鬥奔跑", "走跑"} -- Models\NPCs\怪物\鬼怪\恶鬼马车\恶鬼马车水.ecm
MonsterVisual.WalkRunBlendParams[20762]		= {3, 9, "行走", "戰鬥奔跑", "走跑"} -- Models\NPCs\怪物\boss\剑冢邪兽\剑冢邪兽金.ecm
MonsterVisual.WalkRunBlendParams[20765]		= {2, 6, "行走", "戰鬥奔跑", "走跑"} -- Models\NPCs\怪物\boss\玄龟\玄龟木.ecm
MonsterVisual.WalkRunBlendParams[20763]		= {2.8, 6.6, "行走", "戰鬥奔跑", "走跑"} -- Models\NPCs\怪物\boss\帮派专用boss山猴小\帮派专用boss山猴小水.ecm
MonsterVisual.WalkRunBlendParams[20764]		= {3, 7.2, "行走", "戰鬥奔跑", "走跑"} -- Models\NPCs\怪物\boss\狱火麒麟兽\狱火麒麟兽火.ecm
MonsterVisual.WalkRunBlendParams[20768]		= {3, 7.2, "行走", "戰鬥奔跑", "走跑"} -- Models\NPCs\怪物\神兽\陆吾\陆吾土.ecm
MonsterVisual.WalkRunBlendParams[7938]		= {3, 5, "行走", "戰鬥奔跑", "走跑"} -- Models\NPCs\NPCs\战斗NPC\戚继光\戚继光.ecm


MonsterVisual.DisableWRB = {}
--MonsterVisual.WalkRunBlendParams[1561]		= {3.5, 3.5, "行走", "战斗奔跑", "走跑"}		-- 吉人通1
--MonsterVisual.WalkRunBlendParams[15268]		= {3.5, 3.5, "行走", "战斗奔跑", "走跑"}		-- 吉人通2
MonsterVisual.DisableWRB[1561]		= true	-- 吉人通1
MonsterVisual.DisableWRB[15268]		= true	-- 吉人通2
MonsterVisual.DisableWRB[1556]		= true	-- 罗人杰1
MonsterVisual.DisableWRB[15167]		= true	-- 罗人杰2
MonsterVisual.DisableWRB[1024]		= true	-- 东岗掠夺者
MonsterVisual.DisableWRB[983]		= true	-- 泰山豹子
MonsterVisual.DisableWRB[20330]         = true  -- 秦军守卫兵
MonsterVisual.DisableWRB[23173]         = true  -- 少女鸢萝
--------------------------------------------------------------------
function MonsterVisual:GetMonsterActionConfig()
	return MonsterVisual.ForceAction
end
--------------------------------------------------------------------



-- 根据特性ID数组，得到面板的特性显示文字
-- arrProp: 特性ID数组
-- 返回：怪物特性的显示文字
function  MonsterVisual:GetPropName(arrProp)
    local propName = {}
	for k,v in pairs(arrProp) do
	if MonsterVisual.VisualName[v] then
		propName[k] = MonsterVisual.VisualName[v][1]
	end
	end
	return propName
end

-- 根据64位光效、特性组id，得到怪物的显示名字
-- arrGfx: 64位光效数组
-- templName: 模板名
-- idPropGroup: 特性组ID
function MonsterVisual:GetMonsterNameWithProp(arrGfx, templName, idPropGroup)
	--LogPrint("………………………………………………开始………………………………………………")
	if MonsterVisual.AttributeName[idPropGroup] then
		newName =  string.format(--[[!AUTO_412]]"%s%s",templName,MonsterVisual.AttributeName[idPropGroup])
	else
		newName = templName
	end
	return newName
	--local newGfxName = {}
	--for k,v in pairs(arrGfx) do
		--if MonsterVisual.GfxName[v] then
			--newGfxName[k] = MonsterVisual.GfxName[v][1]
		--else
			--newGfxName[k] = ""
		--end
	--end
	--local newName = ""
	--if #newGfxName > 0 then
	--	newName =  string.format("%s%s",newGfxName[math.random(1,#newGfxName)],templName)
	--else
	--	newName = templName
	--end
	--return newName
end


-- 根据模板id、特性组id、特性id数组，得到怪物的悬浮
-- tid: 怪物模板id
-- templName: 模板名
-- idPropGroup: 特性组ID
-- arrProp: 特性ID数组
function MonsterVisual:GetMonsterHint(tid, templName, idPropGroup, arrProp)

	local strHint = --[[!AUTO_413]]""
	if MonsterVisual.MonsterNotes[tid] then
	strHint = MonsterVisual.MonsterNotes[tid]
	else
	-- TODO: ...
	strHint = templName
	end
	return strHint
end

-- 根据特性id，得到特性的图标id、悬浮说明
-- idSpec: 怪物特性id
--需要显示但没图标idIcon = 0，完全不显示idIcon = -1
function MonsterVisual:GetMonsterSpecialtyInfo(idSpec)

	local idIcon = 0
	local strHint = --[[!AUTO_414]]""
	if MonsterVisual.MonsterAttribute[idSpec] then
	idIcon = MonsterVisual.MonsterAttribute[idSpec][1]
	strHint = MonsterVisual.MonsterAttribute[idSpec][2]
	--TODO: ...
	else
	idIcon = -1
	end
	return idIcon, strHint
end

-------------------------------------
--	Loot：4种模型的前缀名
-------------------------------------

LootModelNamePrefix =
{
	["default"] =
	{
		--[[!AUTO_415]]"",			-- 模型1对应的前缀
		--[[!]]"涨鼓鼓的",		-- 模型2对应的前缀
		--[[!]]"闪闪发光的",		-- 模型3对应的前缀
		--[[!]]"巨牛百的",		-- 模型4对应的前缀
	},

	--	各个loot模板tid可单独配置
	--[123] = ...
}

-- tidLoot:	loot的模板id
-- idxModel:	模型索引，0 ~ 3
function MonsterVisual:GetLootModelNamePrefix(tidLoot, idxModel)

	local Prefix = --[[!AUTO_416]]""

	local tabLoot = LootModelNamePrefix[tidLoot]
	if tabLoot == nil then
		tabLoot = LootModelNamePrefix["default"]
	end

	if tabLoot ~= nil then
		Prefix = tabLoot[idxModel + 1]
	end

	return Prefix

end

-- 组合怪物描述函数
function MonsterVisual:GetMonsterDesc(tid)

	tbl = {}

	--描述面板表头
	tbl["title"] = DescUtility:GetMonsterName(tid)

	--描述面板图标
	tbl["icon"] = DescUtility:GetMonsterIcon(tid)

	--描述面板表头
	--1最多3行，2最多1行，3最多2行（用\r分割）
	local _, monster_type = DescUtility:GetItemDBProp(tid, ClassType.ICID_MONSTER, --[[!]]"怪物类型")
	if monster_type == 0 then
		local _, monster_prof = DescUtility:GetItemDBProp(tid, ClassType.ICID_MONSTER, --[[!]]"显示职业")
		if monster_prof > 0 and monster_prof < 12 then
			tbl["info1"] = string.format(MONSTER_TYPE_STYLE, ITEM_LIMIT_FACTION_DESC[monster_type + 1])
		else
			tbl["info1"] = string.format(MONSTER_TYPE_STYLE, MONSTER_TYPE_DESC[monster_type + 1])
		end
	else
		tbl["info1"] = string.format(MONSTER_TYPE_STYLE, MONSTER_TYPE_DESC[monster_type + 1])
	end

	local _, monster_level = DescUtility:GetItemDBProp(tid, ClassType.ICID_MONSTER, --[[!]]"等级")
	tbl["info1"] = string.format(MONSTER_LEVEL_STYLE, tbl["info1"], monster_level)

	local _, monster_rank = DescUtility:GetItemDBProp(tid, ClassType.ICID_MONSTER, --[[!]]"怪物星级")
	--[[
	if monster_type == 0 then
		tbl["info1"] = string.format(MONSTER_TYPE_HUMAN_STYLE, tbl["info1"], MONSTER_TYPE_HUMAN_DESC[monster_rank + 1] or MONSTER_TYPE_HUMAN_DESC_DEFAULT)
	end
	]]

	--描述面板星级
	--s_t，s代表星数，-1不显示。t代表显示方案，0为正常，1为同步闪烁，2为待定
	tbl["star"] = --[[!AUTO_417]]"-1_0"

 	--描述面板描述信息
	--用\r分割
	tbl["limitskill"] = --[[!AUTO_418]]""
	if MONSTER_COMMON_DESC[tid] then
		tbl["limitskill"] = MONSTER_COMMON_DESC[tid]
	end

	--描述面板附加信息
	--用\r分割
	tbl["remark"] = --[[!AUTO_419]]""
	if MONSTER_SKILL_DESC[tid] then
		tbl["remark"] = MONSTER_SKILL_DESC[tid]
	end

	return tbl

end

-- 走跑融合参数
function MonsterVisual:GetWalkRunBlendParams(idModelPath)
	return unpack(MonsterVisual.WalkRunBlendParams[idModelPath] or MonsterVisual.WalkRunBlendParams[0])
end
