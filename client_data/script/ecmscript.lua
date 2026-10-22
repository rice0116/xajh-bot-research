ECMScript = {}

state_gfx			= {}
state_gfx_endPath	= {}
state_gfx_hook		= {}
state_shader		= {}
state_scale			= {}
weapon_gfx			= {}
weapon_gfx_hook		= {}
object_alpha		= {}
object_color		= {}
object_size			= {}

--	64位光效定义
ECMScript.GfxStateEnum =
{
	FROZEN_STUN = 1, -- 冰冻晕
FROZEN_SLOW = 2, -- 冰冻减速
NET_HANG = 3, -- 网缚定身
PHYSICAL_SLOW = 4, -- 物理减速
PHYSICAL_HANG = 5, -- 物理定身
SLEEP_STUN = 6, -- 睡眠晕
CHANRAO_HANG = 7, -- 缠绕定身
FROZEN_HANG = 8, -- 冰冻定身
DMM_XIGUA_JIANSU = 9, -- 躲猫猫西瓜减速
FORBIDDEN_SKILL = 10, -- 禁招
DIANXUE = 11, -- 点穴47
GANGTI_BUFF = 12, -- 刚体
BLIND = 13, -- 目盲
BISHA = 14, -- 必杀
BURN_ELAPSE = 15, -- 燃烧
WOUND_ELAPSE = 16, -- 流血
POISON_ELAPSE = 17, -- 额外耗蓝
CURSE_ELAPSE = 18, -- 用蓝耗血
GANGTI_POWERBUFF = 19, -- 刚体强化技用
DMM_JIANTOU_ZHENCHA = 20, -- 躲猫猫强力侦查
SPEED_UP = 21, -- 加速
RECOVERY_HP = 22, -- 持续回血
RECOVERY_MP = 23, -- 持续回蓝
SHIELD_HP = 24, -- 吸伤盾
POWER_UP = 25, -- 斗气爆发
MIANKONGZHI = 26, -- 免控制
DMM_SHITOU_DINGSHEN = 27, -- 躲猫猫石链缠绕定身
DMM_PAOPAO_SHUFU = 28, -- 躲猫猫泡泡束缚
DMM_HUNSHUI = 29, -- 躲猫猫昏睡
DMM_HUOJIANXIE_JIASU = 30, -- 躲猫猫火箭鞋加速
BINDUN = 31, -- 逍遥冰盾效果
HSCHARGE_NORMAL = 32, -- 衡山标准蓄力
HSCHARGE_RAPID = 33, -- 衡山快速蓄力
XYMOVE_HEAL = 34, -- 逍遥移动治疗
ONEYEAR_BANGBANGTANG = 35, -- 周年庆棒棒糖BUFF
DOUBLE_SCORE = 39, -- 双倍积分(程序控制)
TRIPLE_SCORE = 40, -- 三倍积分(程序控制)
PET_CATCH = 41, -- 宠物捕捉
FAKE_DEATH = 42, -- 装死
SUICIDE = 43, -- 自杀
WHIRL_WIND = 44, -- 绝对防御光效
IMMUNE = 45, -- 无敌
LIGHTNING = 47, -- 外挂雷劈
DMM_stop_death = 48, -- 躲猫猫禁止通行
EARTHQUAKE = 49, -- 连续地震光环
BATTLE_COMMAND = 50, -- 战斗号令光环
TIXI_LOW = 51, -- 七夕洒花红小
TIXI_MID = 52, -- 七夕洒花紫中
TIXI_HIGH = 53, -- 七夕洒花粉大
TIXI_ULTRA = 54, -- 七夕洒花粉巨
WUXIAN_SELF_BUFF = 55, -- 五仙自身蛊毒BUFF(武学1)
CHRISTMAS_CLOUD = 56, -- 圣诞冰雪云团
ENHANCE_BLOCK = 57, --强化格挡光效
PUNISHMENT = 58, --劈工作室外挂
STENGTHEN_0 = 59, -- 无属性稀有怪
STENGTHEN_1 = 60, -- 1属性稀有怪(程序控制)
STENGTHEN_2 = 61, -- 2属性稀有怪(程序控制)
STENGTHEN_3 = 62, -- 3属性稀有怪(程序控制)
STENGTHEN_4 = 63, -- 4属性稀有怪(程序控制)
DMM_WANGBA_BIAOJI = 65, -- 躲猫猫标记
ZOUHUORUMO_BUFF = 66,-- 走火入魔
NEILILIUSHI_BUFF = 67,-- 内力流失
QINGRENJIE_BUFF= 68, --情人节光效
QINGRENJIE_BUFF2= 69, --情人节光效2
BAISEQINGRENJIE_BUFF= 70, --情人节光效2
FBSMGZSHESHOU_BUFF= 71, --副本沙漠古镇射手光效
FBEMEISHANJINGSUGUANGXIAO_BUFF01= 72, --副本峨眉山竞速光效01
FBEMEISHANJINGSUGUANGXIAO_BUFF02= 73, --副本峨眉山竞速光效02
FBEMEISHANJINGSUGUANGXIAO_BUFF03= 74, --副本峨眉山竞速光效03
FBEMEISHANJINGSUGUANGXIAO_BUFF04= 75, --副本峨眉山竞速光效04
NEWPLAYER_BUFF= 76, --新手领取礼包活动光效
NEWPLAYER_BUFF2= 77, --新手领取礼包活动光效2
BATLLESIDERED_BUFF= 78, --峨眉山竞速红方光效
BATLLESIDEBULE_BUFF= 79, --峨眉山竞速兰芳光效
SHENGDAN_TANGGUO_BUFF= 80, --圣诞糖果雨完成任务BUFF
GUILDWAR_TEAMRED= 81, --跨服PK赛红队头顶标识
GUILDWAR_TEAMBLUE= 82, --跨服PK赛蓝队头顶标识
SHENGDAN_TANGGUOYU_BUFF= 83, --圣诞糖果雨光效BUFF
ZHAOCAIJINBAO_BUFF= 84,	--招财进宝BUFF光效
BAINIANHAOHE_BUFF= 85,	--百年好合BUFF光效
YUNYINGTEXIAO1_BUFF= 86, --运营特效1BUFF光效
HANGUANGJIANQI_BUFF= 87, --寒光剑气BUFF光效
ZUANSHIXINGCHEN_BUFF= 88, --钻石星辰BUFF光效
XIANYUEPIAOPIAO_BUFF= 89, --弦乐飘飘BUFF光效
QIXI15_BUFF1= 90, --15七夕9朵玫瑰
QIXI15_BUFF2= 91, --15七夕99朵玫瑰
QIXI15_BUFF3= 92, --15七夕999朵玫瑰
QIXI15_BUFF4= 93, --15七夕9999朵玫瑰
QIXI15_PILIDAN= 94, --15七夕霹雳弹击中
QIXI15_QUSANBUFF= 95, --15七夕玫瑰驱散
newroses15_BUFF2= 96, --15新99朵玫瑰
newroses15_BUFF3= 97, --15新999朵玫瑰
newroses15_BUFF4= 98, --15新9999朵玫瑰
shengdan15_XUEQIUZHADAN= 99, --15圣诞雪球炸弹击中
shengdan15_QUSANBUFF= 100, --15圣诞糖果驱散
qingrenjie16_BUFF2= 101, --16情人节66花
qingrenjie16_BUFF3= 102, --16情人节666花
qingrenjie16_BUFF4= 103, --16情人节6666花
qingrenjie16_BUFF5= 104, --16情人节寻忆彼岸
meigui201605_999= 106, --2016年5月999微雨幽梦
meigui201605_9999= 107, --2016年5月9999映月迷梦
meigui201605_99= 108, --2016年5月99微雨幽梦
newskill_gongfang= 109, --杀戮之心加攻 
newskill_huixue= 110, --杀戮之心回血   
newskill_huiti= 111, --杀戮之心回体
newskill_chixuhuixue= 112, --意志坚定hot回血
newskill_dancihuixue= 113, --意志坚定单次回血
newskill_gongji= 114, --意志坚定伤害提高
lanseyaoji_9999= 115, --2016蓝色妖姬9999
lanseyaoji_999= 116, --2016蓝色妖姬999
lanseyaoji_99= 117, --2016蓝色妖姬99
shengdan_xianhua_99= 118, --2016圣诞鲜花99
shengdan_xianhua_999= 119, --2016圣诞鲜花999
qingrenjie_2017= 120, --2017情人节活动海浪地面开花
RandomInstance_Shader_1 = 121, --2017随机副本毒系shader
RandomInstance_Shader_2 = 122, --2017随机副本火系shader
RandomInstance_Shader_3 = 123, --2017随机副本冰系shader
RandomInstance_Shader_4 = 124, --2017随机副本土系shader
RandomInstance_Terrain_1 = 125, --2017随机副本毒系地形
RandomInstance_Terrain_2 = 126, --2017随机副本火系地形
RandomInstance_Terrain_3 = 127, --2017随机副本冰系地形
RandomInstance_Terrain_4 = 128, --2017随机副本土系地形
Xmas_2017_9999 = 129, --2017圣诞节9999光效
Xmas_2017_999 = 130, --2017圣诞节9999光效
Flower_201801_99 = 131, --2018年1月鲜花榜99丘比特光效
Flower_201801_999 = 132, --2018年1月鲜花榜999丘比特光效
Flower_201801_9999 = 133, --2018年1月鲜花榜9999丘比特光效
jtz_houjiao = 134, --2018军团战技能1吼叫
qixi_2018_999 = 135, --2018七夕999光效
qixi_2018_99 = 136, --2018七夕999光效
skillwarning_round_6m = 137, --圆形6m预警光效改为V字红色预警光效
jianjing_pvedebuff_001 = 138, --剑经任我行冲锋重伤debuff
shengdan_2018_99 = 139, --2018圣诞99光效
pksai_2019 = 140, --2019pk赛冠军光效
pksai_2020 = 141, --2020pk赛冠军光效
xindataoshahujia1=142, --新大逃杀战场1级护甲特效
xindataoshahujia2=143, --新大逃杀战场2级护甲特效
xindataoshahujia3=144, --新大逃杀战场3级护甲特效
jingmaihudun=145,--经脉护盾
jianfeng=146,--剑风强化特效
bangzhanzengshang=147,--帮战增伤buff特效
bangzhanjianshang=148,--帮战减伤buff特效
bangzhanzibao=149,--帮战自爆buff特效
	COUNT = 64,
};


function ECMScript:Init()
	cur_move_sound = ECMScript:GetRandomSound(DefaultFootStepSound)
	sfx_uid = 0

	state_gfx[10] = "策划联入\\状态效果\\负面状态\\冰冻定身.gfx"
	state_gfx[20] = "策划联入\\状态效果\\负面状态\\冰冻减速.gfx"
	state_gfx[30] = "策划联入\\状态效果\\负面状态\\网缚.gfx"
	state_gfx[40] = "策划联入\\状态效果\\负面状态\\土系减速.gfx"
	state_gfx[50] = "策划联入\\状态效果\\负面状态\\土系定身.gfx"
	state_gfx[60] = "策划联入\\状态效果\\负面状态\\昏睡.gfx"
	state_gfx[70] = "策划联入\\状态效果\\负面状态\\缠绕机关击中.gfx"
	state_gfx[80] = "策划联入\\状态效果\\负面状态\\冰冻禁足.gfx"
	state_gfx[90] = "策划联入\\状态效果\\负面状态\\西瓜减速.gfx"
	state_gfx[100] = "策划联入\\状态效果\\负面状态\\禁招.gfx"
	state_gfx[110] = ""
	state_gfx[120] = "程序联入\\模型状态\\普通刚体黄光.gfx"
	state_gfx[130] = "策划联入\\状态效果\\负面状态\\眩晕.gfx"
	state_gfx[140] = "程序联入\\模型状态\\必杀控制.gfx"
	state_gfx[150] = "策划联入\\状态效果\\负面状态\\燃烧流失.gfx"
	state_gfx[160] = "策划联入\\状态效果\\负面状态\\伤口流失.gfx"
	state_gfx[170] = "策划联入\\状态效果\\负面状态\\中毒流失.gfx"
	state_gfx[180] = "策划联入\\状态效果\\负面状态\\诅咒流失.gfx"
	state_gfx[190] = "程序联入\\模型状态\\强化技专用黄光.gfx"
	state_gfx[200] = "策划联入\\状态效果\\负面状态\\箭头标记.gfx"
	state_gfx[210] = "策划联入\\状态效果\\正面状态\\新加速跑.gfx"
	state_gfx[220] = "策划联入\\状态效果\\正面状态\\状态效果_内力.gfx"
	state_gfx[230] = "策划联入\\状态效果\\正面状态\\状态效果_体力.gfx"
	state_gfx[240] = "策划联入\\状态效果\\正面状态\\吸伤盾.gfx"
	state_gfx[250] = "策划联入\\状态效果\\正面状态\\变身加强.gfx"
	state_gfx[260] = "策划联入\\状态效果\\正面状态\\闪烁无敌.gfx"
	state_gfx[270] = "策划联入\\状态效果\\负面状态\\石链缠绕定身.gfx"
	state_gfx[280] = "策划联入\\状态效果\\负面状态\\泡泡束缚.gfx"
	state_gfx[290] = "策划联入\\状态效果\\负面状态\\昏睡.gfx"
	state_gfx[300] = "策划联入\\状态效果\\正面状态\\脚下着火加速效果.gfx"
	state_gfx[310] = "策划联入\\状态效果\\正面状态\\逍遥无相盾.gfx"
	state_gfx[320] = "策划联入\\状态效果\\正面状态\\衡山蓄力3秒2段效果.gfx"
	state_gfx[330] = "策划联入\\状态效果\\正面状态\\衡山蓄力1.5秒2段效果.gfx"
	state_gfx[340] = "策划联入\\状态效果\\技能光环效果\\逍遥群体祝福光效.gfx"
	state_gfx[350] = "策划联入\\状态效果\\负面状态\\棉花头效果.gfx"
	state_gfx[390] = "策划联入\\状态效果\\怪物脚底状态\\战斗分2倍.gfx"
	state_gfx[400] = "策划联入\\状态效果\\怪物脚底状态\\战斗分3倍.gfx"
	state_gfx[410] = "怪物\\宠物\\宠物通用\\爱心.gfx"
	state_gfx[420] = "场景\\点光源\\灯笼光晕_红.gfx"
	state_gfx[430] = "场景\\机关触发效果\\东厂爆炸.gfx"
	state_gfx[440] = ""
	state_gfx[450] = "策划联入\\状态效果\\正面状态\\无敌.gfx"
	state_gfx[470] = "人物\\击中\\通用击中\\劈外挂闪电.gfx"
	state_gfx[480] = "策划联入\\状态效果\\负面状态\\禁止通行.gfx"
	state_gfx[490] = "策划联入\\状态效果\\技能光环效果\\连续地震光环.gfx"
	state_gfx[500] = "策划联入\\状态效果\\技能光环效果\\战斗号令光环.gfx"
	state_gfx[510] = "策划联入\\活动光效\\七夕洒花红小.gfx"
	state_gfx[520] = "策划联入\\活动光效\\七夕洒花紫中.gfx"
	state_gfx[530] = "策划联入\\活动光效\\七夕洒花粉大.gfx"
	state_gfx[540] = "策划联入\\活动光效\\大片玫瑰花.gfx"
	state_gfx[550] = "策划联入\\状态效果\\正面状态\\自身上毒迟缓减速.gfx"
	state_gfx[560] = "人物\\通用\\下雪效果.gfx"
	state_gfx[570] = "策划联入\\状态效果\\正面状态\\强化格挡.gfx"
	state_gfx[580] = "策划联入\\状态效果\\负面状态\\外挂提示效果.gfx"
	state_gfx[590] = "策划联入\\状态效果\\怪物脚底状态\\光环效果0.gfx"
	state_gfx[600] = "策划联入\\状态效果\\怪物脚底状态\\光环效果1.gfx"
	state_gfx[610] = "策划联入\\状态效果\\怪物脚底状态\\光环效果2.gfx"
	state_gfx[620] = "策划联入\\状态效果\\怪物脚底状态\\光环效果3.gfx"
	state_gfx[630] = "策划联入\\状态效果\\怪物脚底状态\\光环效果4.gfx"
	state_gfx[650] = "策划联入\\状态效果\\负面状态\\画王八标记.gfx"
	state_gfx[660] = ""
	state_gfx[670] = ""
	state_gfx[680] = "策划联入\\活动光效\\玫瑰花旋转.gfx"
	state_gfx[690] = "策划联入\\活动光效\\玫瑰花生长地面.gfx"
	state_gfx[700] = "人物\\烟花\\繁星满天.gfx"
	state_gfx[710] = "怪物\\技能\\身体周围烟效果\\锐射手buff杀字.gfx"
	state_gfx[211] = "策划联入\\状态效果\\正面状态\\新加速跑手脚.gfx"
	state_gfx[212] = "策划联入\\状态效果\\正面状态\\新加速跑手脚.gfx"
	state_gfx[213] = "策划联入\\状态效果\\正面状态\\新加速跑手脚.gfx"
	state_gfx[214] = "策划联入\\状态效果\\正面状态\\新加速跑手脚.gfx"
	state_gfx[720] = "策划联入\\状态效果\\正面状态\\猎豹冲刺.gfx"
	state_gfx[730] = "策划联入\\状态效果\\正面状态\\黑熊怒吼.gfx"
	state_gfx[740] = "策划联入\\状态效果\\正面状态\\羊驼咩咩.gfx"
	state_gfx[750] = "策划联入\\状态效果\\正面状态\\企鹅团练.gfx"
	state_gfx[760] = "策划联入\\活动光效\\新手领礼包活动光效.gfx"
	state_gfx[770] = "策划联入\\活动光效\\新手领礼包活动光效比例大.gfx"
	state_gfx[780] = "策划联入\\状态效果\\峨眉山红方标识.gfx"
	state_gfx[790] = "策划联入\\状态效果\\峨眉山蓝方标识.gfx"
	state_gfx[800] = "策划联入\\活动光效\\圣诞糖果雨.gfx"
	state_gfx[810] = "策划联入\\活动光效\\战场红方标记.gfx"
	state_gfx[820] = "策划联入\\活动光效\\战场蓝方标记.gfx"
        state_gfx[830] = "策划联入\\活动光效\\圣诞糖果雨伞.gfx"
	state_gfx[840] = "策划联入\\活动光效\\招财进宝.gfx"
	state_gfx[850] = "策划联入\\活动光效\\百年好合.gfx"
	state_gfx[860] = "策划联入\\活动光效\\运营特效1.gfx"
	state_gfx[870] = "策划联入\\活动光效\\寒光剑气.gfx"
	state_gfx[880] = "策划联入\\活动光效\\钻石星辰.gfx"
	state_gfx[890] = "策划联入\\活动光效\\弦乐飘飘.gfx"
	state_gfx[900] = "策划联入\\活动光效\\七夕9朵玫瑰总.gfx"
	state_gfx[910] = "策划联入\\活动光效\\七夕99朵玫瑰总.gfx"
	state_gfx[920] = "策划联入\\活动光效\\七夕999朵玫瑰地面.gfx"
	state_gfx[930] = "策划联入\\活动光效\\七夕9999朵玫瑰地面.gfx"
	state_gfx[940] = "程序联入\\模型状态\\霹雳弹击中半黑.gfx"
	state_gfx[950] = "策划联入\\活动光效\\七夕玫瑰花花环子效果02.gfx"
	state_gfx[960] = "策划联入\\活动光效\\99圣诞糖果.gfx"
	state_gfx[970] = "策划联入\\活动光效\\999圣诞糖果.gfx"
	state_gfx[980] = "策划联入\\活动光效\\9999圣诞糖果.gfx"
	state_gfx[990] = "程序联入\\模型状态\\雪球击中半白.gfx"
	state_gfx[1000] = "策划联入\\活动光效\\圣诞糖果星光.gfx"
	state_gfx[1010] = "策划联入\\活动光效\\66情人节折光.gfx"
	state_gfx[1020] = "策划联入\\活动光效\\666情人节折光.gfx"
	state_gfx[1030] = "策划联入\\活动光效\\6666情人节爱心箭.gfx"
	state_gfx[1040] = "策划联入\\活动光效\\寻忆彼岸.gfx"
	state_gfx[1060] = "策划联入\\活动光效\\999萌心中级.gfx"
	state_gfx[1070] = "策划联入\\活动光效\\9999萌心高级.gfx"
	state_gfx[1080] = "策划联入\\活动光效\\99萌心初级.gfx"
	state_gfx[1090] = "人物\\击中\\江湖技能\\加攻buff.gfx"
	state_gfx[1100] = "人物\\击中\\江湖技能\\回血buff.gfx"
	state_gfx[1110] = "人物\\击中\\江湖技能\\回体buff.gfx"
	state_gfx[1120] = "人物\\击中\\江湖技能\\单体持续回血buff.gfx"
	state_gfx[1130] = "人物\\击中\\江湖技能\\单体单次回血buff.gfx"
	state_gfx[1140] = "人物\\击中\\江湖技能\\提高伤害buff.gfx"
	state_gfx[1150] = "策划联入\\活动光效\\8888蓝色妖姬组合.gfx"
	state_gfx[1160] = "策划联入\\活动光效\\888蓝色妖姬组合.gfx"
	state_gfx[1170] = "策划联入\\活动光效\\88气流蓝色妖姬气流01.gfx"
	state_gfx[1180] = "策划联入\\活动光效\\3小玫瑰合.gfx"
	state_gfx[1190] = "策划联入\\活动光效\\33冰玫瑰合.gfx"
	state_gfx[1200] = "策划联入\\活动光效\\2017情人节活动海浪地面开花.gfx"
	state_gfx[1210] = "程序联入\\模型状态\\绿毒骨骼粒子.gfx"
	state_gfx[1220] = "程序联入\\模型状态\\火焰骨骼粒子.gfx"
	state_gfx[1230] = "程序联入\\模型状态\\冰霜骨骼粒子.gfx"
	state_gfx[1240] = "程序联入\\模型状态\\泥浆骨骼粒子.gfx"
	state_gfx[1250] = "怪物\\通用\\随机副本毒气地形.gfx"
	state_gfx[1260] = "怪物\\通用\\随机副本火焰地形.gfx"
	state_gfx[1270] = "怪物\\通用\\随机副本冰霜地形.gfx"
	state_gfx[1280] = "怪物\\通用\\随机副本沼泽地形.gfx"
	state_gfx[1290] = "策划联入\\活动光效\\圣诞地面光.gfx"
	state_gfx[1300] = "策划联入\\活动光效\\圣诞烟花树和.gfx"
	state_gfx[1310] = "策划联入\\活动光效\\情人节低级丘比特循环.gfx"
	state_gfx[1320] = "策划联入\\活动光效\\2018情人节小丘比特模型02射箭_1.gfx"
	state_gfx[1330] = "策划联入\\活动光效\\情人节总循环.gfx"
	state_gfx[1340] = "怪物\\技能\\爆炸地震圈.gfx"
	state_gfx[1350] = "策划联入\\活动光效\\2018七夕月亮组合.gfx"
	state_gfx[1360] = "\策划联入\\活动光效\\2018七夕月亮片99组合.gfx"
	state_gfx[1370] = "\程序联入\\v字指向标.gfx"
	state_gfx[1380] = "\策划联入\\状态效果\\负面状态\\地藏井触发.gfx"
	state_gfx[1390] = "\策划联入\\活动光效\\2018圣诞节出现99组合.gfx"
	state_gfx[1400] = "\策划联入\\活动光效\\个人竞技赛buff地面_组合.gfx"
	state_gfx[1410] = "\策划联入\\活动光效\\精英冠军赛蓝色火焰组合.gfx"
	state_gfx[1420] = "\策划联入\\护甲_绿色.gfx"
	state_gfx[1430] = "\策划联入\\护甲_蓝色.gfx"
	state_gfx[1440] = "\策划联入\\护甲_紫色.gfx"
	state_gfx[1450] = "程序联入\\生成护盾.gfx"
	state_gfx[1460] = "人物\\技能\\东华\\身边效果\\东华手上五级buff.gfx"
	state_gfx[1470] = "策划联入\\活动光效\\帮战战场BUF01.gfx"
	state_gfx[1480] = "策划联入\\活动光效\\帮战战场BUF02.gfx"
	state_gfx[1490] = "策划联入\\活动光效\\帮战战场BUF03.gfx"
	
 

	state_gfx_hook[10] = ""
        state_gfx_hook[20] = ""
        state_gfx_hook[30] = ""
        state_gfx_hook[40] = ""
        state_gfx_hook[50] = ""
        state_gfx_hook[60] = "HH_spine"
        state_gfx_hook[70] = "HH_spine"
	state_gfx_hook[80] = ""
	state_gfx_hook[90] = ""
        state_gfx_hook[100] = "name"
        state_gfx_hook[110] = ""
        state_gfx_hook[120] = ""
        state_gfx_hook[130] = "buff"
	state_gfx_hook[140] = ""
        state_gfx_hook[150] = "HH_spine"
        state_gfx_hook[160] = "HH_spine"
        state_gfx_hook[170] = "HH_spine"
        state_gfx_hook[180] = "HH_spine"
	state_gfx_hook[190] = ""
	state_gfx_hook[200] = "name"
        state_gfx_hook[210] = "HH_spine"
        state_gfx_hook[220] = "HH_spine"
        state_gfx_hook[230] = "HH_spine"
        state_gfx_hook[240] = ""
	state_gfx_hook[250] = ""
	state_gfx_hook[260] = "HH_spine"
	state_gfx_hook[270] = ""
	state_gfx_hook[280] = ""
	state_gfx_hook[290] = "name"
	state_gfx_hook[300] = ""
        state_gfx_hook[310] = "HH_righthandweapon01"
        state_gfx_hook[320] = "HH_spine"
        state_gfx_hook[330] = "HH_spine"
	state_gfx_hook[340] = ""
	state_gfx_hook[350] = "HH_Head"
        state_gfx_hook[390] = "name"
        state_gfx_hook[400] = "name"
        state_gfx_hook[410] = "buff"
        state_gfx_hook[420] = "HH_righthand"
        state_gfx_hook[430] = "buff"
        state_gfx_hook[440] = ""	--怪物用特殊光效位，勿动
        state_gfx_hook[450] = "HH_spine"
	state_gfx_hook[470] = "name"
	state_gfx_hook[480] = "name"
	state_gfx_hook[490] = ""
	state_gfx_hook[500] = ""
	state_gfx_hook[510] = "HH_spine"
	state_gfx_hook[520] = "HH_spine"
	state_gfx_hook[530] = "HH_spine"
        state_gfx_hook[540] = ""
        state_gfx_hook[550] = "HH_spine"
	state_gfx_hook[570] = ""
        state_gfx_hook[580] = "name"
        state_gfx_hook[590] = "name"
        state_gfx_hook[600] = "HH_spine"
        state_gfx_hook[610] = "HH_spine"
        state_gfx_hook[620] = "HH_spine"
        state_gfx_hook[630] = "HH_spine"
	state_gfx_hook[650] = "name"
	state_gfx_hook[660] = ""
	state_gfx_hook[670] = ""
	state_gfx_hook[680] = ""
	state_gfx_hook[690] = ""
	state_gfx_hook[700] = ""
	state_gfx_hook[710] = "buff"
	state_gfx_hook[211] = "HH_左小臂"
	state_gfx_hook[212] = "HH_右小臂"
	state_gfx_hook[213] = "HH_左小腿"
	state_gfx_hook[214] = "HH_右小腿"
	state_gfx_hook[720] = ""
	state_gfx_hook[730] = ""
	state_gfx_hook[740] = ""
	state_gfx_hook[750] = ""
	state_gfx_hook[760] = ""
	state_gfx_hook[770] = ""
	state_gfx_hook[780] = ""
	state_gfx_hook[790] = ""
	state_gfx_hook[800] = ""
	state_gfx_hook[810] = "name"
	state_gfx_hook[820] = "name"
	state_gfx_hook[830] = ""
	state_gfx_hook[840] = ""
	state_gfx_hook[850] = ""
	state_gfx_hook[860] = ""
	state_gfx_hook[870] = ""
	state_gfx_hook[880] = ""
	state_gfx_hook[890] = ""
	state_gfx_hook[900] = ""
	state_gfx_hook[910] = ""
	state_gfx_hook[920] = ""
	state_gfx_hook[930] = ""
	state_gfx_hook[940] = ""
	state_gfx_hook[950] = ""
	state_gfx_hook[960] = ""
	state_gfx_hook[970] = ""
	state_gfx_hook[980] = ""
	state_gfx_hook[980] = ""
	state_gfx_hook[1000] = ""
	state_gfx_hook[1010] = ""
	state_gfx_hook[1020] = ""
	state_gfx_hook[1030] = ""
	state_gfx_hook[1040] = "HH_背饰01"
	state_gfx_hook[1060] = ""
	state_gfx_hook[1070] = ""
	state_gfx_hook[1080] = ""
	state_gfx_hook[1090] = ""
	state_gfx_hook[1100] = ""
	state_gfx_hook[1110] = ""
	state_gfx_hook[1120] = "name"
	state_gfx_hook[1130] = ""
	state_gfx_hook[1140] = ""
	state_gfx_hook[1150] = ""
	state_gfx_hook[1160] = ""
	state_gfx_hook[1170] = ""
	state_gfx_hook[1180] = ""
	state_gfx_hook[1190] = ""
	state_gfx_hook[1200] = ""
	state_gfx_hook[1210] = ""
	state_gfx_hook[1220] = ""
	state_gfx_hook[1230] = ""
	state_gfx_hook[1240] = ""
	state_gfx_hook[1250] = ""
	state_gfx_hook[1260] = ""
	state_gfx_hook[1270] = ""
	state_gfx_hook[1280] = ""
	state_gfx_hook[1460] = "HH_righthandweapon01"
	state_gfx_hook[1470] = "HH_置心"
	state_gfx_hook[1480] = "HH_置心"
	state_gfx_hook[1490] = "HH_置心"


	state_shader[530] = "shaders\\蓝毒.psc"

	state_scale[39] = 1
	state_scale[40] = 1

	max_state_scale = 1.6

	weapon_gfx[221] = {}
	weapon_gfx[221][1] = "武器附魔\\力道\\01级\\1.gfx"
	weapon_gfx_hook[221] = "FM_1"
	object_alpha[1] = 0.5
	object_color[1] = { r = 0, g = 0, b = 1.0 }
	object_size[1] = 2.0
	object_alpha[2] = 1.0
	object_color[2] = { r = 1.0, g = 0, b = 0 }
	object_size[2] = 1.0

	state_gfx_endPath[1] = {
								["defult"] = "策划联入\\状态效果\\负面状态\\冰冻定身消散.gfx",
							}
	state_gfx_endPath[24] = {
								["defult"] = "策划联入\\状态效果\\正面状态\\吸伤盾消失.gfx",
							}
	state_gfx_endPath[145] = {
								["defult"] = "程序联入\\护盾破碎.gfx",
							}
end

------------------------------------------------------------------------------------------
--envType:  环境类型(地面,建筑上,水面上,水中......)
--landType: 地面类型(草地,雪地,沙地......)
SFXRGNTYPE_WALK = 3
SPI = {}

StoreMoveSound =
{
	SceneID  = -1,
	EnvType  = -1,
	LandType = -1,
}

CurMoveSound =
{
	SceneID  = -1,
	EnvType  = -1,
	LandType = -1,
	Valid    = false,
}

FixMoveSound =
{
	Type = -1,
	SceneID = -1,
	MaplandForm = "",
	WeatherClass = "",
}

function ECMScript:ChangeMoveSound(envType,landType,on_ornament)
	--非地面环节就没有LandType这一说
	if envType ~= 0 then landType = 0 end

	local scene_id = GameApi.GetSceneID()

	FixMoveSound.Type = 0

	StoreMoveSound.SceneID  = -1
	StoreMoveSound.EnvType  = -1
	StoreMoveSound.LandType = -1

	CurMoveSound.SceneID  = scene_id
	CurMoveSound.EnvType  = envType
	CurMoveSound.LandType = landType
	CurMoveSound.Valid     = false

	if GameApi.IsPlayerInRegion(SFXRGNTYPE_WALK) == false then
		--先设置默认
		if MoveSoundCfg[scene_id] and MoveSoundCfg[scene_id]["Default"] then
			FixMoveSound.Type = 1
			FixMoveSound.SceneID = scene_id
		else
			FixMoveSound.Type = 0
		end

		--取材质音效
		if on_ornament == false and MoveSoundCfg[scene_id] and MoveSoundCfg[scene_id]["Default"] and MoveSoundCfg[scene_id]["Default"][1] then
			--CurMoveSound.EnvType  = "Default"
			CurMoveSound.Valid = true
		end
	else
		local sRegion = GameApi.GetCurrentRegionName(SFXRGNTYPE_WALK)

		--非脚步声区域
		if string.find(sRegion, "step") == nil then
			--先设置默认
			if MoveSoundCfg[scene_id] and MoveSoundCfg[scene_id]["Default"] then
				FixMoveSound.Type = 1
				FixMoveSound.SceneID = scene_id
			else
				FixMoveSound.Type = 0
			end

			--取材质音效
			if MoveSoundCfg[scene_id] and MoveSoundCfg[scene_id][envType] and MoveSoundCfg[scene_id][envType][landType] then
				CurMoveSound.Valid = true
			end
		--在区域内保存数据
		elseif MoveSoundCfg[scene_id] and MoveSoundCfg[scene_id][envType] and MoveSoundCfg[scene_id][envType][landType] then
			StoreMoveSound.SceneID  = scene_id
			StoreMoveSound.EnvType  = envType
			StoreMoveSound.LandType = landType
		end
	end
end

-- 区域脚步声
function ECMScript:ChangeMusicRegion(region)
	local scene_id = GameApi.GetSceneID()

	if string.len(region) <= 0 then
		if scene_id == StoreMoveSound.SceneID then
			ECMScript:ChangeMoveSound(StoreMoveSound.EnvType,StoreMoveSound.LandType)
		else
			ECMScript:ChangeMoveSound(StoreMoveSound.EnvType,StoreMoveSound.LandType, false)
		end
		return
	end

	ECMScript:SetRegionVolume(region)

	if string.find(region, "step") == nil then
		return
	end

	--保存进区域之前的参数
	StoreMoveSound.SceneID  = CurMoveSound.SceneID
	StoreMoveSound.EnvType  = CurMoveSound.EnvType
	StoreMoveSound.LandType = CurMoveSound.LandType
	--重置当前参数
	CurMoveSound.Valid      = false
	FixMoveSound.Type       = 0

	local maplandform = ""
	for k , v in pairs(LandformClass) do
		if string.find(region , v.keyword) ~= nil then
			maplandform = v.landform
			break
		end
	end

	if string.len(maplandform) <= 0 then
		for k,v in pairs(DefaultLandClass) do
	    	if scene_id == v.SID then
	       	 	maplandform=v.class
	    		break
	    	end
		end
	end

	if string.len(maplandform) <= 0 then
		return
	end

	local idEnv = GameApi.GetEnvTag()
	local weatherClass = "普通天气"
	if bit.band(idEnv,1) >0 then
		weatherClass ="下雨天气"
	elseif bit.band(idEnv,2)>0 then
	    weatherClass ="下雪天气"
	end

	if maplandform and FootStepSoundCfg[maplandform] and FootStepSoundCfg[maplandform][weatherClass] and FootStepSoundCfg[maplandform][weatherClass]["无骑宠"]then
		FixMoveSound.Type = 2
		FixMoveSound.MaplandForm  = maplandform
		FixMoveSound.WeatherClass = weatherClass
	else
		FixMoveSound.Type = 0
	end
end

function ECMScript:SetRegionVolume(region)

	local bgmvol = 1.0
	local envvol = 1.0

	for k , v in pairs(RegionBGMVolumeClass) do
		if string.find(region , v.keyword) ~= nil then
		    bgmvol = v.bgmvol
		    break
		end
	end

	for k , v in pairs(RegionENVVolumeClass) do
		if string.find(region , v.keyword) ~= nil then
		    envvol = v.envvol
		    break
		end
	end

	if bgmvol < 0 then bgmvol = 0 end
	if envvol < 0 then envvol = 0 end
	if bgmvol > 1 then bgmvol = 1 end
	if envvol > 1 then envvol = 1 end

	GameApi.SetVolumeRatio(bgmvol,envvol,25)
end

--设置默认的脚步声
function ECMScript:SetDefaultMoveSound()
	local scene_id=GameApi.GetSceneID()

	for k,v in pairs(DefaultLandClass) do
	    if scene_id == v.SID then
	        maplandform = v.class
	    	return
	    end
	end
end

function ECMScript:GetRandomSound(sndTbl,lastSnd)
	local soundNum = #sndTbl
	if soundNum > 0 then
		local soundIdx = math.random(soundNum)
		if lastSnd == sndTbl[soundIdx] then
			soundIdx = soundIdx + 1
			if soundIdx > soundNum then
				soundIdx = 1
			end
		end

		return sndTbl[soundIdx]
	end
	return ""
end

-- 区域脚步声
function ECMScript:PlayMoveSound(id, model, channel)
	local scene_id = GameApi.GetSceneID()
	if id == GameApi.GetSelfID() then
		if CurMoveSound.SceneID == scene_id and CurMoveSound.Valid and MoveSoundCfg[CurMoveSound.SceneID] then
			SPI.SPI_FilePath = ECMScript:GetRandomSound(MoveSoundCfg[CurMoveSound.SceneID][CurMoveSound.EnvType][CurMoveSound.LandType],SPI.SPI_FilePath)
		else
			if FixMoveSound.Type > 0 then
				if FixMoveSound.Type == 1 then
					SPI.SPI_FilePath = ECMScript:GetRandomSound(MoveSoundCfg[FixMoveSound.SceneID]["Default"],SPI.SPI_FilePath)
				elseif FixMoveSound.Type == 2 then
					SPI.SPI_FilePath = ECMScript:GetRandomSound(FootStepSoundCfg[FixMoveSound.MaplandForm][FixMoveSound.WeatherClass]["无骑宠"],SPI.SPI_FilePath)
				end
			elseif MoveSoundCfg[scene_id] and MoveSoundCfg[scene_id]["Default"] then
				SPI.SPI_FilePath = ECMScript:GetRandomSound(MoveSoundCfg[scene_id]["Default"],SPI.SPI_FilePath)
			else
				SPI.SPI_FilePath = ECMScript:GetRandomSound(DefaultFootStepSound,SPI.SPI_FilePath)
			end
		end

		SPI.SPI_IsForce2D = false
		ECMApi.ECM_ActPlaySfx(string.format("%s%d", "movesound", sfx_uid), model, channel, SPI)
		sfx_uid = sfx_uid + 1

	end
end
------------------------------------------------------------------------------------------

-- gfx状态改变
-- 64位状态，在此填写

function ECMScript:GfxStateChanged(roleid, is_player, model, state, flag, scale, playendgfx)

	--local nFlag = 0
	--if flag then nFlag = 1 end
	--local strDbg = string.format("ECMScript:GfxStateChanged: state %d, flag %d", state, nFlag)
	--LogPrint(strDbg)

	for i = 0, 9 do

		local index = state*10+i
		--LogPrint("index: "..index)

		local shader_path = state_shader[index]
		if shader_path ~= nil then
			--LogPrintA("shader path: "..shader_path)
			if flag then
				ECMScriptApi.ECModelSetReplaceSdr(model, shader_path)
			else
				ECMScriptApi.ECModelRemoveReplaceSdr(model)
			end
		end

		local gfx_path = state_gfx[index]
		if gfx_path ~= nil then
			local gfx_hook = state_gfx_hook[index]

			if gfx_hook == nil then
				gfx_hook = ""
			end

			local str;

			if flag then
				local overTime = 0
				if state_scale[state] then
					ECMApi.ECM_PlayGfx(model, gfx_hook, gfx_path, state_scale[state], true, overTime)
				else
					if scale > max_state_scale then
						ECMApi.ECM_PlayGfx(model, gfx_hook, gfx_path, max_state_scale, true, overTime)
					else
						ECMApi.ECM_PlayGfx(model, gfx_hook, gfx_path, scale, true, overTime)
					end
				end
			else
				local endPath = ""
				if state_gfx_endPath[state] and (playendgfx == 1) then
					endPath = state_gfx_endPath[state]["defult"]
					ECMApi.ECM_PlayGfx(model, gfx_hook, endPath, scale, true, 2000)
					DelayCall(3000, function()
						local pModel = GameApi.GetObjectModel(roleid)
						if pModel then
							ECMApi.ECM_RemoveGfx(pModel, gfx_hook, endPath)
						end
					end)
				end
				ECMApi.ECM_RemoveGfx(model, gfx_hook, gfx_path)
			end
		end
	end
end

--寤舵椂鍚庤皟鐢ㄥ嚱鏁帮紝delayTime鍗曚綅涓烘绉?
function DelayCall(delayTime, func)
	local waitedTime = 0
	HelpSystem:RegisterDataEvent(
	function (params)
		waitedTime = waitedTime + params.tick_time
		if waitedTime >= delayTime then
			safeCall(func)
			return "end"
		end
	end, DataEvent.DATA_TIME)
end

function safeCall (func, ...)
	local flag, ret = pcall(func, ...)
	if not flag then
		LogPrint(ret)
	else
		return ret
	end
end

------------------------------------------------
--装备隐藏特定挂点武器
------------------------------------------------
ECMScript.EquipHideModelHHTable =
{
	[75115] = --大漠侠客衫
	{
		true,		--是否显示为时装
		{"HH_后背1", "HH_后背2", "HH_后背3", "HH_后背双剑1", "HH_后背双剑2", "HH_后背大剑" }, -- 需要隐藏武器的挂点列表
	},
	[75116] = --大漠侠客衫女
	{
		true,		--是否显示为时装
		{"HH_后背1", "HH_后背2", "HH_后背3", "HH_后背双剑1", "HH_后背双剑2", "HH_后背大剑" }, -- 需要隐藏武器的挂点列表
	},

}

function ECMScript:GetAllEquipHideHHTable()
	return ECMScript.EquipHideModelHHTable
end

------------------------------------------------
--装备隐藏特定位置skin
------------------------------------------------
--人物Skin枚举
RoleSkinEnum =
{
	SKIN_BODY = 0,			--	上身衣服
	SKIN_LEG = 1,				--	腿甲
	SKIN_FOOT = 2,			--	鞋
	SKIN_WRIST = 3,			--	手腕
	SKIN_FSH_BODY = 4,	--	时装衣服
	SKIN_FSH_HEAD = 5,	--	时装头饰
	SKIN_FSH_FOOT = 6,	--	时装鞋子
	SKIN_HAIR = 7,			--	头发
	SKIN_HELM = 8,			--	头盔
	
	HEADSKIN_WHOLE = 100,		--	头部整体skin
	HEADSKIN_CUSTOM_MUSTACHE = 101, -- 胡子
	HEADSKIN_CUSTOM_FACEMASK = 102,	--	面具
}

ECMScript.EquipHideSkinTable =
{
	[75113] = --寒凛刺客甲男
	{
		true,		--是否显示为时装
		{RoleSkinEnum.HEADSKIN_CUSTOM_MUSTACHE, }, -- 需要隐藏的skin列表
	},
	[75114] = --寒凛刺客甲女
	{
		true,		--是否显示为时装
		{RoleSkinEnum.HEADSKIN_CUSTOM_MUSTACHE, }, -- 需要隐藏的skin列表
	},

}

function ECMScript:GetAllEquipHideSkinTable()
	return ECMScript.EquipHideSkinTable
end
------------------------------------------------


--挂设列表，武本身的挂点必为"CC_weapon"
ECMScript.HookTable =
{
    [1]	=	{name = "Left_Weapon",		hook = "HH_lefthandweapon"},		--左手武器
    [2]	=	{name = "Right_Weapon",		hook = "HH_righthandweapon01"},		--右手武器
    [3]	=	{name = "Extra1_Weapon",	hook = "HH_righthandweapon02"},		--右手武器特殊-三截棍用挂点下
    [4]	=	{name = "Extra2_Weapon",	hook = "HH_righthandweapon03"},		--右手武器特殊-三截棍用挂点上
    [5]	=	{name = "Extra3_Weapon",	hook = "HH_后背大剑"},		--古琴武器
    [6]	=	{name = "Rest_Weapon",		hook = "HH_右腰部"},			--平时均隐藏，休息时才显示}
    [7]	=	{name = "Twin_Weapon",		hook = "HH_righthandweapon01"},		--日月专用组合右手武器
    [8] =	{name = "Shaolin_Weapon",	hook = "HH_后背1"},			--少林拳掌动作
    [9] =	{name = "Bianzi_Weapon",	hook = "HH_bianzi"},			--五仙通用攻击动作
    [10] =	{name = "Shanzhi_Weapon",	hook = "HH_合扇位置"},			--五仙通用攻击动作
    [11] =	{name = "jianqiao_Weapon",	hook = "HH_后背双剑2"},			--华山剑鞘
    [12] =	{name = "HeadEmpty_Weapon",	hook = "HH_头顶自由位置"},		--无名鹰普通移动
    [13] =	{name = "HeadFight_Weapon",	hook = "HH_头顶战斗位置"},		--无名鹰战斗动作
	[14] =	{name = "Chuizi_Weapon",	hook = "HH_后背双剑1"},			--武罗背后
}

--武器列表
ECMScript.WeaponTable =
{
	[1] = 	{
				[STANCE_TYPE.TRANS2]	=	{nil,	3,	2,	4},	--少林-结棍-三截
				[STANCE_TYPE.TRANS1]	=	{8,	nil,	nil,	nil},	--少林-拳掌
				[STANCE_TYPE.NORMAL]	=	{2,	nil,	nil,	nil},	--少林-结棍
				[STANCE_TYPE.BLOCK]	=	{2,	nil,	nil,	nil},	--格挡
				[STANCE_TYPE.JUEXUE]	=	{nil,	nil,	nil,	nil},	--江湖绝学
				Def 			=	{2,	nil,	nil,	nil},	--少林-结棍
			},
	[2] =	{
				[STANCE_TYPE.TRANS1]	=	{nil,	nil,	nil,	nil},	--武当-大剑-自由且隐藏
				[STANCE_TYPE.NORMAL]	=	{nil,	2,	nil,	nil},	--武当-大剑
				[STANCE_TYPE.BLOCK]	=	{nil,	2,	nil,	nil},	--格挡
				[STANCE_TYPE.JUEXUE]	=	{nil,	nil,	nil,	nil},	--江湖绝学
				Def 			=	{nil,	2,	nil,	nil},	--武当-大剑
			},
	[3] = 	{
				[STANCE_TYPE.JUEXUE]	=	{nil,	nil,	nil,	nil},	--江湖绝学
				Def 			=	{nil,	2,	11,	nil},	--华山-单剑
			},
	[4] = 	{
				[STANCE_TYPE.BLOCK]	=	{1,	2,	nil,	nil},	--格挡
				[STANCE_TYPE.JUEXUE]	=	{nil,	nil,	nil,	nil},	--江湖绝学
				Def 			=	{1,	2,	nil,	nil},	--恒山-对剑
			},
	[5] =	{
				[STANCE_TYPE.NORMAL]	=	{1,	2,	5,	nil},
				--[STANCE_TYPE.TRANS1] 	=	{1,	2,	5,	nil},	--衡山-双刀
				[STANCE_TYPE.JUEXUE]	=	{nil,	nil,	nil,	nil},	--江湖绝学
				Def 			=	{1,	2,	5,	nil},	--衡山-双刀
			},
	[6] = 	{
				[STANCE_TYPE.NORMAL]	=	{1,	2,	nil,	nil},	--日月-双刃-组合
				[STANCE_TYPE.BLOCK]	=	{1,	2,	nil,	nil},	--格挡
				[STANCE_TYPE.JUEXUE]	=	{nil,	nil,	nil,	nil},	--江湖绝学
				Def 			=	{1,	2,	nil,	nil},	--日月-双刃
			},
	[7] =	{
				[STANCE_TYPE.JUEXUE]	=	{nil,	nil,	nil,	nil},	--江湖绝学
				Def 			=	{nil,	9,	nil,	10}},	--五毒-鞭子
	[8] = 	{
				[STANCE_TYPE.BLOCK]	=	{10,	nil,	2,	nil},	--逍遥-扇子-合上-盾
				[STANCE_TYPE.NORMAL]	=	{10,	2,	nil,	nil},	--逍遥-扇子
				[STANCE_TYPE.TRANS1]	=	{10,	nil,	nil,	2},	--格挡，逍遥-扇子
				[STANCE_TYPE.JUEXUE]	=	{nil,	nil,	nil,	nil},	--江湖绝学
				Def 		=	{10,	nil,	2,	nil},	--暂未使用
			},
	[9] = 	{
				[STANCE_TYPE.TRANS1]	=	{nil,	nil,	2,	nil},	--唐门-拳刃-火枪
				[STANCE_TYPE.NORMAL]	=	{1,	2,	nil,	nil},	--唐门-拳刃
				[STANCE_TYPE.BLOCK]	=	{1,	2,	nil,	nil},	--格挡
				[STANCE_TYPE.JUEXUE]	=	{nil,	nil,	nil,	nil},	--江湖绝学
				Def 				=	{1,	2,	nil,	nil},	--唐门-拳刃
			},
	[10] =	{
				[STANCE_TYPE.NORMAL]	=	{8,	8,	nil,	nil},   --峨眉九阴白骨爪
				[STANCE_TYPE.BLOCK]	=	{1,	2,	nil,	nil},	--格挡
				[STANCE_TYPE.JUEXUE]	=	{nil,	nil,	nil,	nil},	--江湖绝学
				Def 			=	{nil,	1,	nil,	nil},	--峨嵋-长杖
			},
	[11] = 	{
				[STANCE_TYPE.JUEXUE]	=	{nil,	nil,	nil,	nil},	--江湖绝学
				Def 			=	{10,	2,	12,	13},	--无名-鹰技
			},
	[12] = 	{
				[STANCE_TYPE.JUEXUE]	=	{nil,	nil,	nil,	nil},	--江湖绝学
				Def 			=	{nil,	2,	14,	nil},	--武罗-重锤
			},
	[13] =	{
				[STANCE_TYPE.JUEXUE]	=	{nil,	nil,	nil,	nil},	--江湖绝学
				Def 			=	{1,	2,	10,	6},	--东华-细剑
			},		
	-- 13 新门派预留
	-- 新大逃杀武器
	[15] =	{
				[STANCE_TYPE.NORMAL]	=	{nil,	2,	nil,	nil},
				Def 					=	{nil,	2,	nil,	nil},	--飞轮
			},
	[16] =	{
				[STANCE_TYPE.NORMAL]	=	{1,	nil,	nil,	nil},
				Def 					=	{1,	nil,	nil,	nil},	--手弩
			},
	[17] =	{
				[STANCE_TYPE.NORMAL]	=	{nil,	2,	nil,	nil},
				Def 					=	{nil,	2,	nil,	nil},	--毒烟
			},
	[18] =	{
				[STANCE_TYPE.NORMAL]	=	{1,	2,	nil,	nil},
				Def 					=	{1,	2,	nil,	nil},		--火箭拳(双手)
			},
	[19] =	{
				[STANCE_TYPE.NORMAL]	=	{1,	nil,	nil,	nil},
				Def 					=	{1,	nil,	nil,	nil},	--冰弓
			},
	[20] =	{
				[STANCE_TYPE.NORMAL]	=	{1,	nil,	nil,	nil},
				Def 					=	{1,	nil,	nil,	nil},	--喷火器
			},
	[21] =	{
				[STANCE_TYPE.NORMAL]	=	{nil,	2,	nil,	nil},
				Def 					=	{nil,	2,	nil,	nil},	--冰扇
			},
}

--武器变形
function ECMScript:WeaponChanged(state_info, is_player, player_id, roleid, weaponid, shapeid)

	local weapontype = GameApi.GetAkDfType(weaponid)

	if weapontype == 0 then				--攻防类型为0，如空手等
		ECMScriptApi.PlayerRemoveWeapon(player_id)
	elseif ECMScript.WeaponTable[weapontype] then	--已知攻防类型
		ECMScriptApi.PlayerRemoveWeapon(player_id)
		if shapeid > STANCE_TYPE.BLOCK and ECMScript.WeaponTable[weapontype][shapeid] then
			for k, v in pairs(ECMScript.WeaponTable[weapontype][shapeid]) do
				if v then
					ECMScriptApi.PlayerChangeWeapon(player_id, k-1, ECMScript.HookTable[v].name, ECMScript.HookTable[v].hook, "CC_weapon")
				end
	    		end
		else
			for k, v in pairs(ECMScript.WeaponTable[weapontype].Def) do
				if v then
					ECMScriptApi.PlayerChangeWeapon(player_id, k-1, ECMScript.HookTable[v].name, ECMScript.HookTable[v].hook, "CC_weapon")
				end
			end
		end
	else						--未知攻防类型
		ECMScriptApi.PlayerRemoveWeapon(player_id)
	end

	return true
end

--武器变形：
function ECMScript:ChangeWeaponShape(idPlayer, model, shapeid, weapon_actname)

	--GameApi还有个接口，获取Player当前武器模板tid：GetCurWeaponID(idPlayer)
	local weapontype = GameApi.GetCurWeaponAkType(idPlayer)

	if weapontype == 0 then				--攻防类型为0，如空手等
		ECMScriptApi.RemoveAllModelWeapon(idPlayer, model)
	elseif ECMScript.WeaponTable[weapontype] then	--已知攻防类型
		ECMScriptApi.RemoveAllModelWeapon(idPlayer, model)
		if shapeid < 0 then
			shapeid = GameApi.GetObjStance(idPlayer)
		end
		if shapeid > STANCE_TYPE.BLOCK and ECMScript.WeaponTable[weapontype][shapeid] then
			for k, v in pairs(ECMScript.WeaponTable[weapontype][shapeid]) do
				if v then
					ECMScriptApi.ChangeModelWeaponShape(idPlayer, model, k-1, ECMScript.HookTable[v].name, ECMScript.HookTable[v].hook, "CC_weapon", weapon_actname)
				end
	    	end
		else
			for k, v in pairs(ECMScript.WeaponTable[weapontype].Def) do
				if v then
					ECMScriptApi.ChangeModelWeaponShape(idPlayer, model, k-1, ECMScript.HookTable[v].name, ECMScript.HookTable[v].hook, "CC_weapon", weapon_actname)
				end
			end
		end
	else						--未知攻防类型
		ECMScriptApi.RemoveAllModelWeapon(idPlayer, model)
	end

	return true
end

--武器光效改变
function ECMScript:WeaponGfxChanged(state_info, is_player, player_id, roleid, weaponid, gfx_index)

	ECMScriptApi.PlayerRemoveAllWeaponGfx(player_id)

	local gfx_arr = weapon_gfx[weaponid]

	if gfx_arr == nil then
		return
	end

	local gfx = gfx_arr[gfx_index]
	local hook = weapon_gfx_hook[weaponid]

	if gfx ~= nil and hook ~= nil then
		for i = 0, 3 do
			ECMScriptApi.PlayerChangeWeaponGfx(player_id, i, true, gfx, hook)
		end
	end

end

--高亮状态改变
function ECMScript:ObjectHighLightChanged(state_info, is_player, object_id, id, index)

	if index == 0 then
		ECMScriptApi.ObjectHighLight(object_id, false)
	else
		ECMScriptApi.ObjectHighLight(object_id, true)
	end

end

-- 透明度改变
function ECMScript:ObjectAlphaChanged(state_info, is_player, object_id, id, index)

	if index == 0 then
		ECMScriptApi.ObjectChangeAlpha(object_id, 1.0)
	else
		local a = object_alpha[index]
		if a == nil then
			a = 1.0
		end
		ECMScriptApi.ObjectChangeAlpha(object_id, a)
	end
end

-- 颜色改变
function ECMScript:ObjectColorChanged(state_info, is_player, object_id, id, index)

	if index == 0 then
		ECMScriptApi.ObjectChangeColor(object_id, 1.0, 1.0, 1.0)
	else
		local c = object_color[index]
		if c == nil then
			c = { 1.0, 1.0, 1.0 }
		end
		ECMScriptApi.ObjectChangeColor(object_id, c.r, c.g, c.b)
	end
end

-- 体型改变
function ECMScript:ObjectSizeChanged(state_info, is_player, object_id, id, index)
	LogPrint("ObjectSizeChanged---------------------------------------------------")
	if index == 0 then
		ECMScriptApi.ObjectChangeSize(object_id, 1.0)
	else
		local sz = object_size[index]
		if sz == nil then
			sz = 1.0
		end
		ECMScriptApi.ObjectChangeSize(object_id, sz)
	end
end

--	模型视觉效果配置
local MODELVISUALEFFECTST_INVALID		= -1
local MODELVISUALEFFECTST_POZHAN_WARNING= 0		--	破绽报警
local MODELVISUALEFFECTST_POZHAN_FULL	= 1		--	出破绽
local MODELVISUALEFFECTST_STRENGTHEN1	= 2		--	一档怪物强化
local MODELVISUALEFFECTST_STRENGTHEN2	= 3		--	二档怪物强化
local MODELVISUALEFFECTST_STRENGTHEN3	= 4		--	三档怪物强化
local MODELVISUALEFFECTST_STRENGTHEN4	= 5		--	四档怪物强化

--	模型视觉效果参数
_ModelVisualEffectParam =
{
--	     /\
--	      |
--结束颜色 -|-----:---:--:---------:---:---:---
--	      |     /:  :   \        /        \
--	      |    / :  :    \      /          \
--	      | __/  :  :     \_  _/            \_
--开始颜色 -|__:___:__:_______|_:__:___:______:_____>时间
--	     0 |t1|t2|t3|t3|t2|t1|
--				一个循环

	[MODELVISUALEFFECTST_POZHAN_WARNING] =	--	破绽报警
	{
		0xffffffff,	--	开始颜色
		0xffffffff,	--	结束颜色
		100,		-- 	t1: 开始颜色的持续时间（毫秒）
		100,		--	t2: 从开始颜色过渡到结束颜色的时间（毫秒）
		100,		-- 	t3: 结束颜色的持续时间（毫秒）
		0,			--	循环次数。-1表示无限循环，直到状态结束

		-1.0,		--	模型缩放比例。<=0表示不影响
	},

	[MODELVISUALEFFECTST_POZHAN_FULL] =	--	出破绽
	{
		0xffff0000,	--	开始颜色
		0xffff0000,	--	结束颜色
		-1,			-- 	t1: 开始颜色的持续时间（毫秒）
		-1,			--	t2: 从开始颜色过渡到结束颜色的时间（毫秒）
		-1,			-- 	t3: 结束颜色的持续时间（毫秒）
		-1,			--	循环次数。-1表示无限循环，直到状态结束

		-1.0,		--	模型缩放比例。<=0表示不影响
	},

	[MODELVISUALEFFECTST_STRENGTHEN1] =	--	一档怪物强化
	{
		0xffffeeaa,	--	开始颜色
		0xffbb0000,	--	结束颜色
		200,		-- 	t1: 开始颜色的持续时间（毫秒）
		1200,		--	t2: 从开始颜色过渡到结束颜色的时间（毫秒）
		300,		-- 	t3: 结束颜色的持续时间（毫秒）
		-1,			--	循环次数。-1表示无限循环，直到状态结束

		-1.0,		--	模型缩放比例。<=0表示不影响
	},

	[MODELVISUALEFFECTST_STRENGTHEN2] =	--	二档怪物强化
	{
		0xffffeeee,	--	开始颜色
		0xffff0000,	--	结束颜色
		200,		-- 	t1: 开始颜色的持续时间（毫秒）
		1200,		--	t2: 从开始颜色过渡到结束颜色的时间（毫秒）
		300,		-- 	t3: 结束颜色的持续时间（毫秒）
		-1,			--	循环次数。-1表示无限循环，直到状态结束

		-1.0,		--	模型缩放比例。<=0表示不影响
	},

	[MODELVISUALEFFECTST_STRENGTHEN3] =	--	三档怪物强化
	{
		0xff730000,	--	开始颜色
		0xffff0000,	--	结束颜色
		200,		-- 	t1: 开始颜色的持续时间（毫秒）
		1200,		--	t2: 从开始颜色过渡到结束颜色的时间（毫秒）
		300,		-- 	t3: 结束颜色的持续时间（毫秒）
		-1,			--	循环次数。-1表示无限循环，直到状态结束

		1.15,		--	模型缩放比例。<=0表示不影响
	},

	[MODELVISUALEFFECTST_STRENGTHEN4] =	--	四档怪物强化
	{
		0xff5033d2,	--	开始颜色
		0xff6900d2,	--	结束颜色
		200,		-- 	t1: 开始颜色的持续时间（毫秒）
		1200,		--	t2: 从开始颜色过渡到结束颜色的时间（毫秒）
		300,		-- 	t3: 结束颜色的持续时间（毫秒）
		-1,			--	循环次数。-1表示无限循环，直到状态结束

		1.25,		--	模型缩放比例。<=0表示不影响
	},
}

function ECMScript:GetModelVisualEffectParam(state)
	return _ModelVisualEffectParam[state]
end

----------------------------------------
------	怪物随机属性光效分档
----------------------------------------

ECMScript.GfxStateConfig =
{
	{ -- 光效分档1
		MinNum = 1,		--特性数量下限
		MaxNum = 3,		--特性数量上限
		GfxID = ECMScript.GfxStateEnum.STENGTHEN_2,	--对应的光效
		VisualID = MODELVISUALEFFECTST_STRENGTHEN2,	--对应的模型视觉效果配置
	},

	{ -- 光效分档2
		MinNum = 4,		--特性数量下限
		MaxNum = 5,		--特性数量上限
		GfxID = ECMScript.GfxStateEnum.STENGTHEN_3,	--对应的光效
		VisualID = MODELVISUALEFFECTST_STRENGTHEN3,	--对应的模型视觉效果配置
	},

	{ -- 光效分档3
		MinNum = 6,		--特性数量下限
		MaxNum = 6,		--特性数量上限
		GfxID = ECMScript.GfxStateEnum.STENGTHEN_4,	--对应的光效
		VisualID = MODELVISUALEFFECTST_STRENGTHEN4,	--对应的模型视觉效果配置
	},
};

--	num_StrengthenGfx: 随机属性数量
function ECMScript:GetGfxStateConfig(num_StrengthenGfx)
	local GfxID = 0
	local VisualID = MODELVISUALEFFECTST_INVALID

	for k,v in pairs(ECMScript.GfxStateConfig) do
		if num_StrengthenGfx >= v.MinNum and num_StrengthenGfx <= v.MaxNum then
			GfxID = v.GfxID
			VisualID = v.VisualID
			break
		end
	end

	return GfxID, VisualID
end

--	登录时重置音效
function ECMScript:ResetSoundEnv()

	StoreMoveSound.SceneID  = -1
	StoreMoveSound.EnvType  = -1
	StoreMoveSound.LandType = -1
	StoreMoveSound.OnOrnament = false

	CurMoveSound.SceneID  = -1
	CurMoveSound.EnvType  = -1
	CurMoveSound.LandType = -1
	CurMoveSound.OnOrnament = false
	CurMoveSound.Valid    = false

	FixMoveSound.Type = -1
	FixMoveSound.SceneID = -1
	FixMoveSound.MaplandForm = ""
	FixMoveSound.WeatherClass = ""

end

-- 某模型路径ID的替换模型模型路径ID （例：战斗鹰休闲鹰）
ECMScript.replaceModelPathID = {}
ECMScript.replaceModelPathID[24179] = 24538 --01鹰
ECMScript.replaceModelPathID[24484] = 24539 --03鹰
ECMScript.replaceModelPathID[24540] = 24541 --02鹰

function ECMScript:GetRelpaceModelPathID(id)
	if ECMScript.replaceModelPathID[id] then
		return ECMScript.replaceModelPathID[id]
	else
		return id
	end
end
 

