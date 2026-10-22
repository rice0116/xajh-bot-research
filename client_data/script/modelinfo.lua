--[[#tag push auto]]

---------------------------------------------------------
-- 模型的包围盒设置 Guojie @2012.12.25
---------------------------------------------------------

local ModelBBType_Skeleton = 0	--骨骼包围盒
local ModelBBType_Model = 1			--模型包围盒
local ModelBBType_CH = 2				--凸包包围盒

ModelBoudingBoxConfig = {}

ModelBoudingBoxConfig.List =
{
	--[模型id]= {使用的包围盒类型,      包围盒是否调整方向(适用于长条形模型，且对ModelBBType_Model这种类型无效) }
	[0]       = { ModelBBType_Skeleton,  false,	},	--默认配置

	[12784]   = { ModelBBType_CH,        false, },		--Models\NPCs\关卡\青城五洞天中大门开启\青城五洞天中大门开启.ecm
	[12786]   = { ModelBBType_CH,        false, },		--Models\NPCs\关卡\青城五洞天前大门开启\青城五洞天前大门开启.ecm
	[12788]   = { ModelBBType_CH,        false, },		--Models\NPCs\关卡\青城五洞天后大门开启\青城五洞天后大门开启.ecm
	[12796]   = { ModelBBType_CH,        false, },		--Models\NPCs\关卡\青城大桥前大门开启\青城大桥前大门开启.ecm
	[12798]   = { ModelBBType_CH,        false, },		--Models\NPCs\关卡\青城大桥后大门开启\青城大桥后大门开启.ecm
	[12800]   = { ModelBBType_CH,        false, },		--Path = Models\NPCs\关卡\青城松风观中大门开启\青城松风观中大门开启.ecm
	[12802]   = { ModelBBType_CH,        false, },		--Path = Models\NPCs\关卡\青城松风观前大门开启\青城松风观前大门开启.ecm


	[13501]   = { ModelBBType_CH,        false, },		--Models\NPCs\怪物\野兽\毒虫洞蜈蚣boss下\毒虫洞蜈蚣boss上.ecm
	[13502]   = { ModelBBType_CH,        false, },		--Models\NPCs\怪物\野兽\毒虫洞蜈蚣boss下\毒虫洞蜈蚣boss下.ecm

	[1001]   = { ModelBBType_Skeleton,   true, },		--长蛇

	[13337]	= {ModelBBType_CH,  false, },	--Models\NPCs\关卡\地刺15米\地刺15米.ecm
	[13338]	= {ModelBBType_CH,  false, },	--Models\NPCs\关卡\地刺6米\地刺6米.ecm

	[14575]	= {ModelBBType_CH,  false, },	--Models\NPCs\关卡\海中孤岛副本跳跃竹\海中孤岛副本跳跃竹.ecm

	[16175] = {ModelBBType_Model,false, },	--Models\NPCs\采集\山寨大旗\山寨大旗.ecm
	[16176]	= {ModelBBType_Model,false, },	--Models\NPCs\采集\镖局大旗\镖局大旗.ecm
	[23870] = {ModelBBType_Model,false, },	--Models\NPCs\采集\工坊大旗\工坊大旗.ecm

	[4706]	= {ModelBBType_Model,false, },  --Models\NPCs\采集\野外锅灶\野外锅灶.ecm
	[16174]	= {ModelBBType_Model,false, },  --Models\NPCs\采集\鼠窝\鼠窝.ecm
	[14605]	= {ModelBBType_Model,false, },  --Models\NPCs\采集\药渣\药渣.ecm
	
	[21346]	= {ModelBBType_Model,false, },--Models\NPCs\怪物\boss\华丽的大雪人\华丽的大雪人.ecm
	[21347]	= {ModelBBType_Model,false, },--Models\NPCs\怪物\boss\圣诞树\圣诞树.ecm
	[21348]	= {ModelBBType_Model,false, },--Models\NPCs\怪物\boss\大饺子\大饺子.ecm
	[21349]	= {ModelBBType_Model,false, },--Models\NPCs\怪物\boss\新年礼盒\新年礼盒.ecm
	[4705]	= {ModelBBType_Model,false, },--Models\npcs\采集\雪人雪球
	[20871]	= {ModelBBType_Model,false, },--Models\NPCs\NPCs\捉迷藏npc\太阳伞\太阳伞.ecm

	[15315]	= {ModelBBType_CH,false, },  --Models\NPCs\NPCs\npc道具\御厨道具\御厨道具.ecm

	[16648] = {ModelBBType_Model,false, },	--门
	[18070]   = { ModelBBType_CH,        false, },--Models\Npcs\Npcs\透明盒子\嵩山宝塔隐形怪.ecm
	[18073]   = { ModelBBType_CH,        false, },--Models\Npcs\关卡\嵩山虎头中心旋转\嵩山虎头中心旋转.ecm
	[19621]   = { ModelBBType_CH,        false, },--Models\NPCs\关卡\嵩山宝塔石门\嵩山宝塔陷阱地刺.ecm
	[16230]   = { ModelBBType_CH,        false, },--Models\NPCs\NPCs\战斗npc\任我行心魔版\任我行心魔版.ecm
	[19742]   = { ModelBBType_CH,        false, },--Models\NPCs\关卡\梅庄地牢铁索剑\梅庄地牢铁索剑.ecm
}

-- 取所有包围盒配置
function ModelBoudingBoxConfig:GetAllModelBoudingBoxConfig()
	return ModelBoudingBoxConfig.List
end

---------------------------------------------------------
-- 模型的战斗表现配置
---------------------------------------------------------

ModelFightVisualConfig = {}

ModelFightVisualConfig.List =
{
	--[模型id]= { 受伤时是否闪白, 是否破绽闪红，是否虚弱闪蓝，受伤方式(0不强制, 1强制受伤融合, 2强制受伤独占, 3强制物理受伤, 4无受伤动作)  }
	[16648]   = { false,          false,      false,          0,   },	--门
	[11442]   = { true,           true,       true,           3,   }, --models\npcs\宠物\战斗宠\蝰蛇\蝰蛇.ecm
	[1001] 		= { true,           true,       true,           3,   }, --Models\NPCs\怪物\野兽\青竹蛇\青竹蛇.ecm  怪物ID 748
	[7417] 		= { true,           true,       true,           3,   }, --Models\NPCs\宠物\战斗宠\毒蛇\毒蛇.ecm    怪物ID 9284
	[9654] 		= { true,           true,       true,           3,   }, --Models\NPCs\怪物\野兽\金环蛇\金环蛇.ecm  怪物ID 4773
	[10459] 	= { true,           true,       true,           3,   }, --Models\NPCs\宠物\战斗宠\雷蛇\雷蛇.ecm  怪物ID 30171
	[11442] 	= { true,           true,       true,           3,   }, --Models\NPCs\宠物\战斗宠\蝰蛇\蝰蛇.ecm  怪物ID 62692
	[18141] 	= { false,          false,      false,          0,   }, --Models\NPCs\NPCs\透明盒子\连云堡门透明盒子\连云堡门透明盒子.ecm  怪物ID 67626
	[16161] 	= { false,          false,      false,           0,   }, --Models\NPCs\怪物\boss\帮派专用boss独角兽\帮派专用boss独角兽.ecm
	[16162] 	= { false,          false,      false,           4,   }, --Models\NPCs\怪物\boss\帮派专用boss白猿\帮派专用boss白猿.ecm
	[16160] 	= { false,          false,      false,           4,   }, --Models\NPCs\怪物\boss\帮派专用boss巨蝎\帮派专用boss巨蝎.ecm
	[16158] 	= { false,          false,      false,           4,   }, --Models\NPCs\怪物\boss\帮派专用boss山猴大\帮派专用boss山猴大.ecm
	[16157] 	= { true,          false,      false,           4,   }, --Models\NPCs\怪物\boss\帮派专用boss山猴中\帮派专用boss山猴中.ecm
	[16159] 	= { true,          false,      false,           0,   }, --Models\NPCs\怪物\boss\帮派专用boss山猴小\帮派专用boss山猴小.ecm
	[16163] 	= { false,          false,      false,           4,   }, --Models\NPCs\怪物\boss\帮派专用boss野牛\帮派专用boss野牛.ecm
}

-- 取所有包围盒配置
function ModelFightVisualConfig:GetAllModelFightVisualConfig()
	return ModelFightVisualConfig.List
end

---------------------------------------------------------
-- 骑乘模型配置（4条腿的骨骼名等） Guojie @2013.1.9
---------------------------------------------------------

MountModelConfig = {}
MountModelConfig.List = {}
function MountModelConfig:GetAllMountModelConfig()
	return MountModelConfig.List
end

MountModelConfig.List[0] = --默认配置
{
	--4条腿骨骼名
	FootBones = {
		{--[[!AUTO_1]]"Bip01 L Finger0", --[[!AUTO_2]]"Bip01 L Hand", },  --左前（列表，按此顺序找到第一个有该骨骼的）
		{--[[!AUTO_3]]"Bip01 R Finger0", --[[!AUTO_4]]"Bip01 R Hand", },  --右前
		{--[[!AUTO_5]]"Bip01 L Toe0",   --[[!AUTO_6]]"Bip01 L Foot", },  --左后
		{--[[!AUTO_7]]"Bip01 R Toe0",   --[[!AUTO_8]]"Bip01 R Foot", },  --右后
	},
}
MountModelConfig.List[72] = --Models\NPCs\宠物\骑宠\马\马.ecm
{
	--4条腿骨骼名
	FootBones = {
		{--[[!AUTO_9]]"Bip01 L Finger0", --[[!AUTO_10]]"Bip01 L Hand", },  --左前（列表，按此顺序找到第一个有该骨骼的）
		{--[[!AUTO_11]]"Bip01 R Finger0", --[[!AUTO_12]]"Bip01 R Hand", },  --右前
		{--[[!AUTO_13]]"Bip01 L Toe0",   --[[!AUTO_14]]"Bip01 L Foot", },  --左后
		{--[[!AUTO_15]]"Bip01 R Toe0",   --[[!AUTO_16]]"Bip01 R Foot", },  --右后
	},

	--下身根骨骼名
	--LowerBones = {
	--	"Bip01 L Clavicle",
	--	"Bip01 R Clavicle",
	--	"Bip01 L Thigh",
	--	"Bip01 R Thigh",
	--},
}
MountModelConfig.List[6616] = --Models\NPCs\宠物\骑宠\马车\马车.ecm
{
	--4条腿骨骼名
	FootBones = {
		{--[[!AUTO_17]]"Bip01 L Finger", --[[!AUTO_18]]"Bip01 L Hand", },  --左前（列表，按此顺序找到第一个有该骨骼的）
		{--[[!AUTO_19]]"Bip01 R Finger", --[[!AUTO_20]]"Bip01 R Hand", },  --右前
		{--[[!AUTO_21]]"Bone02", },  --左后
		{--[[!AUTO_22]]"Bone01", },  --右后
	},
}
MountModelConfig.List[10105] = --models\npcs\宠物\骑宠\货物马车\货物马车.ecm
{
	--4条腿骨骼名
	FootBones = {
		{--[[!AUTO_23]]"Bip01 L Finger0", },  --左前（列表，按此顺序找到第一个有该骨骼的）
		{--[[!AUTO_24]]"Bip01 R Finger0", },  --右前
		{--[[!AUTO_25]]"Bone01", },  --左后
		{--[[!AUTO_26]]"Bone01", },  --右后
	},
}
MountModelConfig.List[11436] = --Models\NPCs\宠物\骑宠\官轿\官轿.ecm
{
	--4条腿骨骼名
	FootBones = {
		{--[[!AUTO_27]]"Bip01 Footsteps02", },  --左前（列表，按此顺序找到第一个有该骨骼的）
		{--[[!AUTO_28]]"Bip01 Footsteps", },  --右前
		{--[[!AUTO_29]]"Bip01 Footsteps03", },  --左后
		{--[[!AUTO_30]]"Bip01 Spine02", },  --右后
	},
}
MountModelConfig.List[11441] = --models\npcs\宠物\骑宠\婚车初级\婚车初级.ecm
{
	--4条腿骨骼名
	FootBones = {
		{--[[!AUTO_31]]"Bip01 L Finger0", --[[!AUTO_32]]"Bip01 L Hand", },  --左前（列表，按此顺序找到第一个有该骨骼的）
		{--[[!AUTO_33]]"Bip01 R Finger01", --[[!AUTO_34]]"Bip01 R Hand", },  --右前
		{--[[!AUTO_35]]"Bone61", },  --左后
		{--[[!AUTO_36]]"Bone62", },  --右后
	},
}
MountModelConfig.List[11448] = --Models\NPCs\宠物\骑宠\蝎子\蝎子.ecm
{
	--4条腿骨骼名
	FootBones = {
		{--[[!AUTO_37]]"Bip01 L Finger", --[[!AUTO_38]]"Bip01 L Hand", },  --左前（列表，按此顺序找到第一个有该骨骼的）
		{--[[!AUTO_39]]"Bip01 R Finger", --[[!AUTO_40]]"Bip01 R Hand", },  --右前
		{--[[!AUTO_41]]"Bone15", },  --左后
		{--[[!AUTO_42]]"Bone03", },  --右后
	},
}
MountModelConfig.List[11461] = --models\npcs\宠物\骑宠\婚车中级\婚车中级.ecm
{
	--4条腿骨骼名
	FootBones = {
		{--[[!AUTO_43]]"Bip01 L Finger0", --[[!AUTO_44]]"Bip01 L Hand", },  --左前（列表，按此顺序找到第一个有该骨骼的）
		{--[[!AUTO_45]]"Bip01 R Finger01", --[[!AUTO_46]]"Bip01 R Hand", },  --右前
		{--[[!AUTO_47]]"Bone61", },  --左后
		{--[[!AUTO_48]]"Bone62", },  --右后
	},
}
MountModelConfig.List[11733] = --Models\NPCs\宠物\骑宠\多人马车\多人马车.ecm
{
	--4条腿骨骼名
	FootBones = {
		{--[[!AUTO_49]]"Bip01 L Finger", --[[!AUTO_50]]"Bip01 L Hand", },  --左前（列表，按此顺序找到第一个有该骨骼的）
		{--[[!AUTO_51]]"Bip01 R Finger", --[[!AUTO_52]]"Bip01 R Hand", },  --右前
		{--[[!AUTO_53]]"輪子", },  --左后
		{--[[!AUTO_54]]"輪子", },  --右后
	},
}

MountModelConfig.List[13221] = --Models\NPCs\宠物\骑宠\镖车1\镖车1.ecm
{
	--4条腿骨骼名
	FootBones = {
		{--[[!AUTO_55]]"Bip01 L Finger", --[[!AUTO_56]]"Bip01 L Hand", },  --左前（列表，按此顺序找到第一个有该骨骼的）
		{--[[!AUTO_57]]"Bip01 R Finger", --[[!AUTO_58]]"Bip01 R Hand", },  --右前
		{--[[!AUTO_59]]"Bone01", },  --左后
		{--[[!AUTO_60]]"Bone01", },  --右后
	},
}

MountModelConfig.List[13222] = --Models\NPCs\宠物\骑宠\镖车2\镖车2.ecm
{
	--4条腿骨骼名
	FootBones = {
		{--[[!AUTO_61]]"Bip01 L Finger", --[[!AUTO_62]]"Bip01 L Hand", },  --左前（列表，按此顺序找到第一个有该骨骼的）
		{--[[!AUTO_63]]"Bip01 R Finger", --[[!AUTO_64]]"Bip01 R Hand", },  --右前
		{--[[!AUTO_65]]"Bone01", },  --左后
		{--[[!AUTO_66]]"Bone01", },  --右后
	},
}

MountModelConfig.List[13223] = --Models\NPCs\宠物\骑宠\镖车3\镖车3.ecm
{
	--4条腿骨骼名
	FootBones = {
		{--[[!AUTO_67]]"Bip01 L Finger", --[[!AUTO_68]]"Bip01 L Hand", },  --左前（列表，按此顺序找到第一个有该骨骼的）
		{--[[!AUTO_69]]"Bip01 R Finger", --[[!AUTO_70]]"Bip01 R Hand", },  --右前
		{--[[!AUTO_71]]"Bone01", },  --左后
		{--[[!AUTO_72]]"Bone01", },  --右后
	},
}

MountModelConfig.List[13224] = --Models\NPCs\宠物\骑宠\镖车4\镖车4.ecm
{
	--4条腿骨骼名
	FootBones = {
		{--[[!AUTO_73]]"Bip01 L Finger", --[[!AUTO_74]]"Bip01 L Hand", },  --左前（列表，按此顺序找到第一个有该骨骼的）
		{--[[!AUTO_75]]"Bip01 R Finger", --[[!AUTO_76]]"Bip01 R Hand", },  --右前
		{--[[!AUTO_77]]"Bone10", },  --左后
		{--[[!AUTO_78]]"Bone10", },  --右后
	},
}

MountModelConfig.List[13225] = --Models\NPCs\宠物\骑宠\镖车5\镖车5.ecm
{
	--4条腿骨骼名
	FootBones = {
		{--[[!AUTO_79]]"Bip01 L Finger", --[[!AUTO_80]]"Bip01 L Hand", },  --左前（列表，按此顺序找到第一个有该骨骼的）
		{--[[!AUTO_81]]"Bip01 R Finger", --[[!AUTO_82]]"Bip01 R Hand", },  --右前
		{--[[!AUTO_83]]"Bone10", },  --左后
		{--[[!AUTO_84]]"Bone10", },  --右后
	},
}

MountModelConfig.List[13369] = --Models\NPCs\宠物\骑宠\桃谷六仙载具\桃谷六仙载具.ecm
{
	--4条腿骨骼名
	FootBones = {
		{--[[!AUTO_85]]"0006", },  --左前（列表，按此顺序找到第一个有该骨骼的）
		{--[[!AUTO_86]]"0005", },  --右前
		{--[[!AUTO_87]]"0007", },  --左后
		{--[[!AUTO_88]]"0002", },  --右后
	},
}
MountModelConfig.List[15648] = --Models\NPCs\NPCs\普通npc\普通花车\普通花车.ecm
{
	--4条腿骨骼名
	FootBones = {
		{--[[!AUTO_89]]"Bip01 L Finger", --[[!AUTO_90]]"Bip01 L Hand", },  --左前（列表，按此顺序找到第一个有该骨骼的）
		{--[[!AUTO_91]]"Bip01 R Finger", --[[!AUTO_92]]"Bip01 R Hand", },  --右前
		{--[[!AUTO_93]]"Bone05555", },  --左后
		{--[[!AUTO_94]]"Bone05555", },  --右后
	},
}

---------------------------------------------------------
--	NPC、Matter的镜像设置 By Guojie @2011.2.26
---------------------------------------------------------

ModelMirroInfo  = {}

--	Npc的镜像列表（替换名称、模型）
NPC_MirrorList =
{
	--[[同时替换NPC名称、模型，开始↓
	[13243] = -- 百姓
	{
		true,	--是否更替名称

		true,	--是否更替模型

		{ 	--名称			--模型id
			{"李希", 		1485 	},
			{"尤秋辰",		122	},
			{"孔萱",		7808	},
			{"苏晓",		7823	},
			{"袁羽明",		7820	},
			{"薛语飞",		7949	},
			{"安莹宏",		4612	},
		},
	},
	↑结束--]]
	--[[只替换NPC模型，开始↓
	[16634] = -- 镖师
	{
		false,	--是否更替名称

		true,	--是否更替模型

		{ 	--名称			--模型id
			{"",			18		},
			{"",			22		},
			{"",			29		},
			{"",			30		},
			{"",			32		},
			{"",			80		},
			{"",			92		},
			{"",			22		},
			{"",			34		},
			{"",			35		},
			{"",			41		},
			{"",			42		},
			{"",			43		},
			{"",			37		},
			{"",			38		},
			{"",			39		},
		},
	},
	↑结束--]]
	-- 其它的NPC形像随机，请拷↓↑之间行，粘在下方进行修改
	[22412] = -- 宦官监工
	{
		true,	--是否更替名称
		true,	--是否更替模型

		{ 	--名称			--模型id
			{--[[!AUTO_95]]"宦官監工",		3612		},
			{--[[!AUTO_96]]"宦官巡察",		3610		},
			{--[[!AUTO_97]]"宦官打手",		1032		},
		},
	},
	[29193] = -- 风流公子 折扇
	{
		true,	--是否更替名称
		true,	--是否更替模型
		{ 	--名称			--模型id
			{--[[!AUTO_98]]"風流公子",		7807		},
			{--[[!AUTO_99]]"風流公子",		8556		},
			{--[[!AUTO_100]]"風流公子",		8557		},
			{--[[!AUTO_101]]"風流公子",		8558		},
			{--[[!AUTO_102]]"富家小姐",		7820		},
			{--[[!AUTO_103]]"富家小姐",		8559		},
			{--[[!AUTO_104]]"富家小姐",		8560		},
			{--[[!AUTO_105]]"富家小姐",		8561		},
			{--[[!AUTO_106]]"富家小姐",		8562		},
		},
	},
	[29196] = -- 粗鲁马夫 马鞍
	{
		true,	--是否更替名称
		true,	--是否更替模型
		{ 	--名称			--模型id
			{--[[!AUTO_107]]"鏢局馬夫",		18		},
			{--[[!AUTO_108]]"鏢局馬夫",		22		},
			{--[[!AUTO_109]]"鏢局馬夫",		29		},
			{--[[!AUTO_110]]"鏢局馬夫",		30		},
			{--[[!AUTO_111]]"鏢局馬夫",		32		},
			{--[[!AUTO_112]]"鏢局馬夫",		80		},
			{--[[!AUTO_113]]"鏢局馬夫",		92		},
			{--[[!AUTO_114]]"鏢局馬夫",		22		},
			{--[[!AUTO_115]]"鏢局馬夫",		34		},
			{--[[!AUTO_116]]"鏢局馬夫",		35		},
			{--[[!AUTO_117]]"鏢局馬夫",		41		},
			{--[[!AUTO_118]]"鏢局馬夫",		42		},
			{--[[!AUTO_119]]"鏢局馬夫",		43		},
			{--[[!AUTO_120]]"鏢局馬夫",		37		},
			{--[[!AUTO_121]]"鏢局馬夫",		38		},
			{--[[!AUTO_122]]"鏢局馬夫",		39		},
		},
	},
	[29199] = -- 英姿少年 秘籍
	{
		true,	--是否更替名称
		true,	--是否更替模型
		{ 	--名称			--模型id
			{--[[!AUTO_123]]"江湖俠士",		7954		},
			{--[[!AUTO_124]]"江湖俠士",		10909		},
			{--[[!AUTO_125]]"江湖俠士",		10910		},
			{--[[!AUTO_126]]"江湖俠女",		7955		},
			{--[[!AUTO_127]]"江湖俠女",		8555		},
			{--[[!AUTO_128]]"江湖俠女",		10911		},
		},
	},
	[29202] = -- 半老徐娘 秘药
	{
		true,	--是否更替名称
		true,	--是否更替模型
		{ 	--名称			--模型id
			{--[[!AUTO_129]]"西域青年",		7120		},
			{--[[!AUTO_130]]"西域青年",		8571		},
			{--[[!AUTO_131]]"西域青年",		8572		},
			{--[[!AUTO_132]]"白髮老人",		7934		},
			{--[[!AUTO_133]]"白髮老人",		8548		},
		},
	},
	[29205] = -- 七旬老妪 茶水
	{
		true,	--是否更替名称
		true,	--是否更替模型
		{ 	--名称			--模型id
			{--[[!AUTO_134]]"算命先生",		7939		},
			{--[[!AUTO_135]]"算命先生",		8568		},
			{--[[!AUTO_136]]"算命先生",		8569		},
			{--[[!AUTO_137]]"七旬老者",		7821		},
			{--[[!AUTO_138]]"七旬老者",		8563		},
		},
	},
	[29208] = -- 黄口小儿 糕点
	{
		true,	--是否更替名称
		true,	--是否更替模型
		{ 	--名称			--模型id
			{--[[!AUTO_139]]"中年男子",		7823		},
			{--[[!AUTO_140]]"中年男子",		8573		},
			{--[[!AUTO_141]]"大鬍子壯漢",		7819		},
			{--[[!AUTO_142]]"大鬍子壯漢",		8551		},
		},
	},
	[31576] = -- 活居民
	{
		true,	--是否更替名称
		true,	--是否更替模型
		{ 	--名称			--模型id
			{--[[!AUTO_143]]"居民",		7954		},
			{--[[!AUTO_144]]"居民",		10909		},
			{--[[!AUTO_145]]"居民",		10910		},
			{--[[!AUTO_146]]"居民",		7955		},
			{--[[!AUTO_147]]"居民",		8555		},
			{--[[!AUTO_148]]"居民",		7953		},
			{--[[!AUTO_149]]"居民",		7940	        },
			{--[[!AUTO_150]]"居民",		9365		},
			{--[[!AUTO_151]]"居民",		7957		},
			{--[[!AUTO_152]]"居民",		7806		},
			{--[[!AUTO_153]]"居民",		7118		},
			{--[[!AUTO_154]]"居民",		7807		},
			{--[[!AUTO_155]]"居民",		7820		},
			{--[[!AUTO_156]]"居民",		8665		},
			{--[[!AUTO_157]]"居民",		7114		},
			{--[[!AUTO_158]]"居民",		8675		},
			{--[[!AUTO_159]]"居民",		8666		},
			{--[[!AUTO_160]]"居民",		7810		},
			{--[[!AUTO_161]]"居民",		7829		},
			{--[[!AUTO_162]]"居民",		7949		},
			{--[[!AUTO_163]]"居民",		7119		},
			{--[[!AUTO_164]]"居民",		9623		},
			{--[[!AUTO_165]]"居民",		7833		},
			{--[[!AUTO_166]]"居民",		9650		},
		},
	},
	[31579] = -- 死居民
	{
		true,	--是否更替名称
		true,	--是否更替模型
		{ 	--名称			--模型id
			{--[[!AUTO_167]]"居民",		7954		},
			{--[[!AUTO_168]]"居民",		10909		},
			{--[[!AUTO_169]]"居民",		10910		},
			{--[[!AUTO_170]]"居民",		7955		},
			{--[[!AUTO_171]]"居民",		8555		},
			{--[[!AUTO_172]]"居民",		7953		},
			{--[[!AUTO_173]]"居民",		7940	        },
			{--[[!AUTO_174]]"居民",		9365		},
			{--[[!AUTO_175]]"居民",		7957		},
			{--[[!AUTO_176]]"居民",		7806		},
			{--[[!AUTO_177]]"居民",		7118		},
			{--[[!AUTO_178]]"居民",		7807		},
			{--[[!AUTO_179]]"居民",		7820		},
			{--[[!AUTO_180]]"居民",		8665		},
			{--[[!AUTO_181]]"居民",		7114		},
			{--[[!AUTO_182]]"居民",		8675		},
			{--[[!AUTO_183]]"居民",		8666		},
			{--[[!AUTO_184]]"居民",		7810		},
			{--[[!AUTO_185]]"居民",		7829		},
			{--[[!AUTO_186]]"居民",		7949		},
			{--[[!AUTO_187]]"居民",		7119		},
			{--[[!AUTO_188]]"居民",		9623		},
			{--[[!AUTO_189]]"居民",		7833		},
			{--[[!AUTO_190]]"居民",		9650		},
		},
	},
	[34588] = -- 联手产品演示_剧情亭中御敌_龙套1青城弟子
	{
		false,	--是否更替名称
		true,	--是否更替模型
		{ 	--名称			--模型id
			{--[[!AUTO_191]]"",		1562		},
			{--[[!AUTO_192]]"",		1558		},
			{--[[!AUTO_193]]"",		1559		},
			{--[[!AUTO_194]]"",		1561		},
		},
	},
	[34589] = -- 联手产品演示_剧情亭中御敌_龙套2日月领队
	{
		false,	--是否更替名称
		true,	--是否更替模型
		{ 	--名称			--模型id
			{--[[!AUTO_195]]"",		9369		},
			{--[[!AUTO_196]]"",		8184		},
		},
	},
	[34590] = -- 联手产品演示_剧情亭中御敌_龙套3日月领队护卫
	{
		false,	--是否更替名称
		true,	--是否更替模型
		{ 	--名称			--模型id
			{--[[!AUTO_197]]"",		9633		},
			{--[[!AUTO_198]]"",		9632		},
		},
	},
	[34591] = -- 联手产品演示_剧情亭中御敌_龙套4泰山弟子
	{
		false,	--是否更替名称
		true,	--是否更替模型
		{ 	--名称			--模型id
			{--[[!AUTO_199]]"",		1039		},
			{--[[!AUTO_200]]"",		7941		},
		},
	},
	[34592] = -- 联手产品演示_剧情亭中御敌_龙套5江湖侠士
	{
		false,	--是否更替名称
		true,	--是否更替模型
		{ 	--名称			--模型id
			{--[[!AUTO_201]]"",		7954		},
			{--[[!AUTO_202]]"",		10909		},
			{--[[!AUTO_203]]"",		10910		},
			{--[[!AUTO_204]]"",		7955		},
			{--[[!AUTO_205]]"",		8555		},
			{--[[!AUTO_206]]"",		10911		},
		},
	},
	--[=[
	[77087] = -- 台湾兑换NPC萧龙王
	{
		true,	--是否更替名称
		true,	--是否更替模型
		{ 	--名称			--模型id
			{--[[!AUTO_209]]"萧敬腾",		20587		},
		},
	},
	--]=]
};

--	Matter的镜像列表（替换名称、模型）
Matter_MirrorList =
{
	--[[同时替换矿物模型，开始↓
	[5682] = -- 勿忘我
	{
		false,	--是否更替名称

		true,	--是否更替模型

		{ 	--名称			--模型id
			{"",			3651	},
			{"",			3652	},
			{"",			3655	},
		},
	},
	↑结束--]]

	-- 其它的矿物形像随机，请拷↓↑之间行，粘在下方进行修改


};

function ModelMirroInfo:GetNPCMirrorParam()
	return NPC_MirrorList
end

function ModelMirroInfo:GetMatterMirrorParam()
	return Matter_MirrorList
end


---------------------------------------------------------
-- 指定NPC模型的一些显示效果：
--	模型缩放比例
--  挂光效，以及光效缩放比例
--	是否静止，是否固定动作，以及动作seek时间
---------------------------------------------------------

NPCModelVisual = {}

NPCModelVisual.List =
{
	--[[示例
	[35270] = --tid: NPC的模板id：玩家NPC（华山男）
	{
		[GameApi.HashAString("xxxx")] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 2.0, --模型缩放比例

			GfxFile = "程序联入\\模型状态\\强化技闪黄.gfx",	--挂光效文件名

			ModelVisual =
			{
				[PROF_TYPE.HUASHAN] = --对应的玩家门派。 没有对应玩家用PROF_TYPE.MONSTER_HUMANSHAPE_1
				{
					FrozenActName = "bq_欢呼_华山", --固定动作名（填了动作名，就seek这个动作后停止并不再播任何动作；否则会正常更新）
					FrozenActSeekTime = 1000, --固定动作seek时间，挂的光效也会播这么长时间（毫秒）
				},
			},
		}
	},
	[33022] = --tid: NPC的模板id：罗人杰
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 2.0, --模型缩放比例

			GfxFile = "策划联入\\状态效果\\负面状态\\冰冻定身.gfx",	--挂光效文件名
			GfxHook = "HH_spine",	 --挂光效Hook名
			GfxScale = 1.0, 	--光效缩放比例

			ModelVisual =
			{
				[PROF_TYPE.MONSTER_HUMANSHAPE_1] = --对应的玩家门派。 没有对应玩家用PROF_TYPE.MONSTER_HUMANSHAPE_1
				{
					FrozenActSeekTime = 1000, --固定动作seek时间，挂的光效也会播这么长时间（毫秒）
				},
			},
		}
	},
	示例结束]]

	---------------------------------------------
	[62916] = --tid: NPC的模板id：福王
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 1.3, --模型缩放比例

		}
	},

	[70508] = --tid: NPC的模板id：庆王
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 1.3, --模型缩放比例
		}
	},

	[89843] = --tid: NPC的模板id：擂台总管
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 1.4, --模型缩放比例
		}
	},

	[71445] = --tid: NPC的模板id：带头大哥
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 5.0, --模型缩放比例

			GfxFile = --[[!AUTO_207]]"策划联入\\状态效果\\正面状态\\金身效果.gfx",	--挂光效文件名

			ModelVisual =
			{
				[16] = --对应的玩家门派。 没有对应玩家用PROF_TYPE.MONSTER_HUMANSHAPE_1
				{
					FrozenActName = --[[!]]"格挡", --固定动作名（填了动作名，就seek这个动作后停止并不再播任何动作；否则会正常更新）
					FrozenActSeekTime = 1000, --固定动作seek时间，挂的光效也会播这么长时间（毫秒）
				},

				[PROF_TYPE.NEWBIE] = --对应的玩家门派。 没有对应玩家用PROF_TYPE.MONSTER_HUMANSHAPE_1
				{
					FrozenActName = --[[!]]"pt_站立_通用", --固定动作名（填了动作名，就seek这个动作后停止并不再播任何动作；否则会正常更新）
					FrozenActSeekTime = 100, --固定动作seek时间，挂的光效也会播这么长时间（毫秒）
				},

				[PROF_TYPE.SHAOLIN] = --对应的玩家门派。 没有对应玩家用PROF_TYPE.MONSTER_HUMANSHAPE_1
				{
					FrozenActName = --[[!]]"pt_站立_少林", --固定动作名（填了动作名，就seek这个动作后停止并不再播任何动作；否则会正常更新）
					FrozenActSeekTime = 100, --固定动作seek时间，挂的光效也会播这么长时间（毫秒）
				},

				[PROF_TYPE.WUDANG] = --对应的玩家门派。 没有对应玩家用PROF_TYPE.MONSTER_HUMANSHAPE_1
				{
					FrozenActName = --[[!]]"pt_站立_武当", --固定动作名（填了动作名，就seek这个动作后停止并不再播任何动作；否则会正常更新）
					FrozenActSeekTime = 100, --固定动作seek时间，挂的光效也会播这么长时间（毫秒）
				},

				[PROF_TYPE.HUASHAN] = --对应的玩家门派。 没有对应玩家用PROF_TYPE.MONSTER_HUMANSHAPE_1
				{
					FrozenActName = --[[!]]"pt_站立_华山", --固定动作名（填了动作名，就seek这个动作后停止并不再播任何动作；否则会正常更新）
					FrozenActSeekTime = 100, --固定动作seek时间，挂的光效也会播这么长时间（毫秒）
				},

				[PROF_TYPE.NORTH_HENGSHAN] = --对应的玩家门派。 没有对应玩家用PROF_TYPE.MONSTER_HUMANSHAPE_1
				{
					FrozenActName = --[[!]]"pt_站立_恒山", --固定动作名（填了动作名，就seek这个动作后停止并不再播任何动作；否则会正常更新）
					FrozenActSeekTime = 100, --固定动作seek时间，挂的光效也会播这么长时间（毫秒）
				},

				[PROF_TYPE.SOUTH_HENGSHAN] = --对应的玩家门派。 没有对应玩家用PROF_TYPE.MONSTER_HUMANSHAPE_1
				{
					FrozenActName = --[[!]]"pt_站立_衡山", --固定动作名（填了动作名，就seek这个动作后停止并不再播任何动作；否则会正常更新）
					FrozenActSeekTime = 100, --固定动作seek时间，挂的光效也会播这么长时间（毫秒）
				},

				[PROF_TYPE.RIYUE] = --对应的玩家门派。 没有对应玩家用PROF_TYPE.MONSTER_HUMANSHAPE_1
				{
					FrozenActName = --[[!]]"pt_站立_日月", --固定动作名（填了动作名，就seek这个动作后停止并不再播任何动作；否则会正常更新）
					FrozenActSeekTime = 100, --固定动作seek时间，挂的光效也会播这么长时间（毫秒）
				},

				[PROF_TYPE.WUXIAN] = --对应的玩家门派。 没有对应玩家用PROF_TYPE.MONSTER_HUMANSHAPE_1
				{
					FrozenActName = --[[!]]"pt_站立_五毒", --固定动作名（填了动作名，就seek这个动作后停止并不再播任何动作；否则会正常更新）
					FrozenActSeekTime = 100, --固定动作seek时间，挂的光效也会播这么长时间（毫秒）
				},

				[PROF_TYPE.XIAOYAO] = --对应的玩家门派。 没有对应玩家用PROF_TYPE.MONSTER_HUMANSHAPE_1
				{
					FrozenActName = --[[!]]"pt_站立_逍遥", --固定动作名（填了动作名，就seek这个动作后停止并不再播任何动作；否则会正常更新）
					FrozenActSeekTime = 100, --固定动作seek时间，挂的光效也会播这么长时间（毫秒）
				},

				[PROF_TYPE.TANGMEN] = --对应的玩家门派。 没有对应玩家用PROF_TYPE.MONSTER_HUMANSHAPE_1
				{
					FrozenActName = --[[!]]"pt_站立_唐门", --固定动作名（填了动作名，就seek这个动作后停止并不再播任何动作；否则会正常更新）
					FrozenActSeekTime = 100, --固定动作seek时间，挂的光效也会播这么长时间（毫秒）
				},

				[PROF_TYPE.EMEI] = --对应的玩家门派。 没有对应玩家用PROF_TYPE.MONSTER_HUMANSHAPE_1
				{
					FrozenActName = --[[!]]"pt_站立_峨嵋", --固定动作名（填了动作名，就seek这个动作后停止并不再播任何动作；否则会正常更新）
					FrozenActSeekTime = 100, --固定动作seek时间，挂的光效也会播这么长时间（毫秒）
				},
				
				[11] = --对应的玩家门派。 没有对应玩家用PROF_TYPE.MONSTER_HUMANSHAPE_1
				{
					FrozenActName = --[[!]]"pt_站立_无名", --固定动作名（填了动作名，就seek这个动作后停止并不再播任何动作；否则会正常更新）
					FrozenActSeekTime = 100, --固定动作seek时间，挂的光效也会播这么长时间（毫秒）
				},
				
			},
		}
	},

	[62917] = --tid: NPC的模板id：明星_特换NPC_帮主1
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 7.0, --模型缩放比例

			GfxFile = --[[!AUTO_208]]"策划联入\\状态效果\\正面状态\\金身效果.gfx",	--挂光效文件名

			ModelVisual =
			{
				[16] = --对应的玩家门派。 没有对应玩家用PROF_TYPE.MONSTER_HUMANSHAPE_1
				{
					FrozenActName = --[[!]]"站立", --固定动作名（填了动作名，就seek这个动作后停止并不再播任何动作；否则会正常更新）
					FrozenActSeekTime = 550, --固定动作seek时间，挂的光效也会播这么长时间（毫秒）
				},

				[PROF_TYPE.NEWBIE] = --对应的玩家门派。 没有对应玩家用PROF_TYPE.MONSTER_HUMANSHAPE_1
				{
					FrozenActName = --[[!]]"pt_站立_通用", --固定动作名（填了动作名，就seek这个动作后停止并不再播任何动作；否则会正常更新）
					FrozenActSeekTime = 100, --固定动作seek时间，挂的光效也会播这么长时间（毫秒）
				},

				[PROF_TYPE.SHAOLIN] = --对应的玩家门派。 没有对应玩家用PROF_TYPE.MONSTER_HUMANSHAPE_1
				{
					FrozenActName = --[[!]]"pt_站立_少林", --固定动作名（填了动作名，就seek这个动作后停止并不再播任何动作；否则会正常更新）
					FrozenActSeekTime = 100, --固定动作seek时间，挂的光效也会播这么长时间（毫秒）
				},

				[PROF_TYPE.WUDANG] = --对应的玩家门派。 没有对应玩家用PROF_TYPE.MONSTER_HUMANSHAPE_1
				{
					FrozenActName = --[[!]]"pt_站立_武当", --固定动作名（填了动作名，就seek这个动作后停止并不再播任何动作；否则会正常更新）
					FrozenActSeekTime = 100, --固定动作seek时间，挂的光效也会播这么长时间（毫秒）
				},

				[PROF_TYPE.HUASHAN] = --对应的玩家门派。 没有对应玩家用PROF_TYPE.MONSTER_HUMANSHAPE_1
				{
					FrozenActName = --[[!]]"pt_站立_华山", --固定动作名（填了动作名，就seek这个动作后停止并不再播任何动作；否则会正常更新）
					FrozenActSeekTime = 100, --固定动作seek时间，挂的光效也会播这么长时间（毫秒）
				},

				[PROF_TYPE.NORTH_HENGSHAN] = --对应的玩家门派。 没有对应玩家用PROF_TYPE.MONSTER_HUMANSHAPE_1
				{
					FrozenActName = --[[!]]"pt_站立_恒山", --固定动作名（填了动作名，就seek这个动作后停止并不再播任何动作；否则会正常更新）
					FrozenActSeekTime = 100, --固定动作seek时间，挂的光效也会播这么长时间（毫秒）
				},

				[PROF_TYPE.SOUTH_HENGSHAN] = --对应的玩家门派。 没有对应玩家用PROF_TYPE.MONSTER_HUMANSHAPE_1
				{
					FrozenActName = --[[!]]"pt_站立_衡山", --固定动作名（填了动作名，就seek这个动作后停止并不再播任何动作；否则会正常更新）
					FrozenActSeekTime = 100, --固定动作seek时间，挂的光效也会播这么长时间（毫秒）
				},

				[PROF_TYPE.RIYUE] = --对应的玩家门派。 没有对应玩家用PROF_TYPE.MONSTER_HUMANSHAPE_1
				{
					FrozenActName = --[[!]]"pt_站立_日月", --固定动作名（填了动作名，就seek这个动作后停止并不再播任何动作；否则会正常更新）
					FrozenActSeekTime = 100, --固定动作seek时间，挂的光效也会播这么长时间（毫秒）
				},

				[PROF_TYPE.WUXIAN] = --对应的玩家门派。 没有对应玩家用PROF_TYPE.MONSTER_HUMANSHAPE_1
				{
					FrozenActName = --[[!]]"pt_站立_五毒", --固定动作名（填了动作名，就seek这个动作后停止并不再播任何动作；否则会正常更新）
					FrozenActSeekTime = 100, --固定动作seek时间，挂的光效也会播这么长时间（毫秒）
				},

				[PROF_TYPE.XIAOYAO] = --对应的玩家门派。 没有对应玩家用PROF_TYPE.MONSTER_HUMANSHAPE_1
				{
					FrozenActName = --[[!]]"pt_站立_逍遥", --固定动作名（填了动作名，就seek这个动作后停止并不再播任何动作；否则会正常更新）
					FrozenActSeekTime = 100, --固定动作seek时间，挂的光效也会播这么长时间（毫秒）
				},

				[PROF_TYPE.TANGMEN] = --对应的玩家门派。 没有对应玩家用PROF_TYPE.MONSTER_HUMANSHAPE_1
				{
					FrozenActName = --[[!]]"pt_站立_唐门", --固定动作名（填了动作名，就seek这个动作后停止并不再播任何动作；否则会正常更新）
					FrozenActSeekTime = 100, --固定动作seek时间，挂的光效也会播这么长时间（毫秒）
				},

				[PROF_TYPE.EMEI] = --对应的玩家门派。 没有对应玩家用PROF_TYPE.MONSTER_HUMANSHAPE_1
				{
					FrozenActName = --[[!]]"pt_站立_峨嵋", --固定动作名（填了动作名，就seek这个动作后停止并不再播任何动作；否则会正常更新）
					FrozenActSeekTime = 100, --固定动作seek时间，挂的光效也会播这么长时间（毫秒）
				},
				
				[11] = --对应的玩家门派。 没有对应玩家用PROF_TYPE.MONSTER_HUMANSHAPE_1
				{
					FrozenActName = --[[!]]"pt_站立_无名", --固定动作名（填了动作名，就seek这个动作后停止并不再播任何动作；否则会正常更新）
					FrozenActSeekTime = 100, --固定动作seek时间，挂的光效也会播这么长时间（毫秒）
				},
			},
		}
	},


	[81361] = --tid: NPC的模板id：明星_替换NPC_武道会1
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 4.0, --模型缩放比例

			GfxFile = --[[!AUTO_209]]"策劃聯入\\狀態效果\\正面狀態\\金身效果.gfx",	--挂光效文件名

			ModelVisual =
			{
				[16] = --对应的玩家门派。 没有对应玩家用PROF_TYPE.MONSTER_HUMANSHAPE_1
				{
					FrozenActName = --[[!]]"站立", --固定动作名（填了动作名，就seek这个动作后停止并不再播任何动作；否则会正常更新）
					FrozenActSeekTime = 150, --固定动作seek时间，挂的光效也会播这么长时间（毫秒）
				},

				[PROF_TYPE.NEWBIE] = --对应的玩家门派。 没有对应玩家用PROF_TYPE.MONSTER_HUMANSHAPE_1
				{
					FrozenActName = --[[!]]"pt_站立_通用", --固定动作名（填了动作名，就seek这个动作后停止并不再播任何动作；否则会正常更新）
					FrozenActSeekTime = 100, --固定动作seek时间，挂的光效也会播这么长时间（毫秒）
				},

				[PROF_TYPE.SHAOLIN] = --对应的玩家门派。 没有对应玩家用PROF_TYPE.MONSTER_HUMANSHAPE_1
				{
					FrozenActName = --[[!]]"pt_站立_少林", --固定动作名（填了动作名，就seek这个动作后停止并不再播任何动作；否则会正常更新）
					FrozenActSeekTime = 100, --固定动作seek时间，挂的光效也会播这么长时间（毫秒）
				},

				[PROF_TYPE.WUDANG] = --对应的玩家门派。 没有对应玩家用PROF_TYPE.MONSTER_HUMANSHAPE_1
				{
					FrozenActName = --[[!]]"pt_站立_武当", --固定动作名（填了动作名，就seek这个动作后停止并不再播任何动作；否则会正常更新）
					FrozenActSeekTime = 100, --固定动作seek时间，挂的光效也会播这么长时间（毫秒）
				},

				[PROF_TYPE.HUASHAN] = --对应的玩家门派。 没有对应玩家用PROF_TYPE.MONSTER_HUMANSHAPE_1
				{
					FrozenActName = --[[!]]"pt_站立_华山", --固定动作名（填了动作名，就seek这个动作后停止并不再播任何动作；否则会正常更新）
					FrozenActSeekTime = 100, --固定动作seek时间，挂的光效也会播这么长时间（毫秒）
				},

				[PROF_TYPE.NORTH_HENGSHAN] = --对应的玩家门派。 没有对应玩家用PROF_TYPE.MONSTER_HUMANSHAPE_1
				{
					FrozenActName = --[[!]]"pt_站立_恒山", --固定动作名（填了动作名，就seek这个动作后停止并不再播任何动作；否则会正常更新）
					FrozenActSeekTime = 100, --固定动作seek时间，挂的光效也会播这么长时间（毫秒）
				},

				[PROF_TYPE.SOUTH_HENGSHAN] = --对应的玩家门派。 没有对应玩家用PROF_TYPE.MONSTER_HUMANSHAPE_1
				{
					FrozenActName = --[[!]]"pt_站立_衡山", --固定动作名（填了动作名，就seek这个动作后停止并不再播任何动作；否则会正常更新）
					FrozenActSeekTime = 100, --固定动作seek时间，挂的光效也会播这么长时间（毫秒）
				},

				[PROF_TYPE.RIYUE] = --对应的玩家门派。 没有对应玩家用PROF_TYPE.MONSTER_HUMANSHAPE_1
				{
					FrozenActName = --[[!]]"pt_站立_日月", --固定动作名（填了动作名，就seek这个动作后停止并不再播任何动作；否则会正常更新）
					FrozenActSeekTime = 100, --固定动作seek时间，挂的光效也会播这么长时间（毫秒）
				},

				[PROF_TYPE.WUXIAN] = --对应的玩家门派。 没有对应玩家用PROF_TYPE.MONSTER_HUMANSHAPE_1
				{
					FrozenActName = --[[!]]"pt_站立_五毒", --固定动作名（填了动作名，就seek这个动作后停止并不再播任何动作；否则会正常更新）
					FrozenActSeekTime = 100, --固定动作seek时间，挂的光效也会播这么长时间（毫秒）
				},

				[PROF_TYPE.XIAOYAO] = --对应的玩家门派。 没有对应玩家用PROF_TYPE.MONSTER_HUMANSHAPE_1
				{
					FrozenActName = --[[!]]"pt_站立_逍遥", --固定动作名（填了动作名，就seek这个动作后停止并不再播任何动作；否则会正常更新）
					FrozenActSeekTime = 100, --固定动作seek时间，挂的光效也会播这么长时间（毫秒）
				},

				[PROF_TYPE.TANGMEN] = --对应的玩家门派。 没有对应玩家用PROF_TYPE.MONSTER_HUMANSHAPE_1
				{
					FrozenActName = --[[!]]"pt_站立_唐门", --固定动作名（填了动作名，就seek这个动作后停止并不再播任何动作；否则会正常更新）
					FrozenActSeekTime = 100, --固定动作seek时间，挂的光效也会播这么长时间（毫秒）
				},

				[PROF_TYPE.EMEI] = --对应的玩家门派。 没有对应玩家用PROF_TYPE.MONSTER_HUMANSHAPE_1
				{
					FrozenActName = --[[!]]"pt_站立_峨嵋", --固定动作名（填了动作名，就seek这个动作后停止并不再播任何动作；否则会正常更新）
					FrozenActSeekTime = 100, --固定动作seek时间，挂的光效也会播这么长时间（毫秒）
				},
				
				[11] = --对应的玩家门派。 没有对应玩家用PROF_TYPE.MONSTER_HUMANSHAPE_1
				{
					FrozenActName = --[[!]]"pt_站立_无名", --固定动作名（填了动作名，就seek这个动作后停止并不再播任何动作；否则会正常更新）
					FrozenActSeekTime = 100, --固定动作seek时间，挂的光效也会播这么长时间（毫秒）
				},
			},
		}
	},

	[86368] = --tid: NPC的模板id：武林盟主
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 8.0, --模型缩放比例

			GfxFile = --[[!AUTO_207]]"策划联入\\状态效果\\正面状态\\金身效果.gfx",	--挂光效文件名

			ModelVisual =
			{
				[16] = --对应的玩家门派。 没有对应玩家用PROF_TYPE.MONSTER_HUMANSHAPE_1
				{
					FrozenActName = --[[!]]"格挡", --固定动作名（填了动作名，就seek这个动作后停止并不再播任何动作；否则会正常更新）
					FrozenActSeekTime = 300, --固定动作seek时间，挂的光效也会播这么长时间（毫秒）
				},

				[PROF_TYPE.NEWBIE] = --对应的玩家门派。 没有对应玩家用PROF_TYPE.MONSTER_HUMANSHAPE_1
				{
					FrozenActName = --[[!]]"pt_站立_通用", --固定动作名（填了动作名，就seek这个动作后停止并不再播任何动作；否则会正常更新）
					FrozenActSeekTime = 100, --固定动作seek时间，挂的光效也会播这么长时间（毫秒）
				},

				[PROF_TYPE.SHAOLIN] = --对应的玩家门派。 没有对应玩家用PROF_TYPE.MONSTER_HUMANSHAPE_1
				{
					FrozenActName = --[[!]]"pt_站立_少林", --固定动作名（填了动作名，就seek这个动作后停止并不再播任何动作；否则会正常更新）
					FrozenActSeekTime = 100, --固定动作seek时间，挂的光效也会播这么长时间（毫秒）
				},

				[PROF_TYPE.WUDANG] = --对应的玩家门派。 没有对应玩家用PROF_TYPE.MONSTER_HUMANSHAPE_1
				{
					FrozenActName = --[[!]]"pt_站立_武当", --固定动作名（填了动作名，就seek这个动作后停止并不再播任何动作；否则会正常更新）
					FrozenActSeekTime = 100, --固定动作seek时间，挂的光效也会播这么长时间（毫秒）
				},

				[PROF_TYPE.HUASHAN] = --对应的玩家门派。 没有对应玩家用PROF_TYPE.MONSTER_HUMANSHAPE_1
				{
					FrozenActName = --[[!]]"pt_站立_华山", --固定动作名（填了动作名，就seek这个动作后停止并不再播任何动作；否则会正常更新）
					FrozenActSeekTime = 100, --固定动作seek时间，挂的光效也会播这么长时间（毫秒）
				},

				[PROF_TYPE.NORTH_HENGSHAN] = --对应的玩家门派。 没有对应玩家用PROF_TYPE.MONSTER_HUMANSHAPE_1
				{
					FrozenActName = --[[!]]"pt_站立_恒山", --固定动作名（填了动作名，就seek这个动作后停止并不再播任何动作；否则会正常更新）
					FrozenActSeekTime = 100, --固定动作seek时间，挂的光效也会播这么长时间（毫秒）
				},

				[PROF_TYPE.SOUTH_HENGSHAN] = --对应的玩家门派。 没有对应玩家用PROF_TYPE.MONSTER_HUMANSHAPE_1
				{
					FrozenActName = --[[!]]"pt_站立_衡山", --固定动作名（填了动作名，就seek这个动作后停止并不再播任何动作；否则会正常更新）
					FrozenActSeekTime = 100, --固定动作seek时间，挂的光效也会播这么长时间（毫秒）
				},

				[PROF_TYPE.RIYUE] = --对应的玩家门派。 没有对应玩家用PROF_TYPE.MONSTER_HUMANSHAPE_1
				{
					FrozenActName = --[[!]]"pt_站立_日月", --固定动作名（填了动作名，就seek这个动作后停止并不再播任何动作；否则会正常更新）
					FrozenActSeekTime = 100, --固定动作seek时间，挂的光效也会播这么长时间（毫秒）
				},

				[PROF_TYPE.WUXIAN] = --对应的玩家门派。 没有对应玩家用PROF_TYPE.MONSTER_HUMANSHAPE_1
				{
					FrozenActName = --[[!]]"pt_站立_五毒", --固定动作名（填了动作名，就seek这个动作后停止并不再播任何动作；否则会正常更新）
					FrozenActSeekTime = 100, --固定动作seek时间，挂的光效也会播这么长时间（毫秒）
				},

				[PROF_TYPE.XIAOYAO] = --对应的玩家门派。 没有对应玩家用PROF_TYPE.MONSTER_HUMANSHAPE_1
				{
					FrozenActName = --[[!]]"zs_一段跳_通用", --固定动作名（填了动作名，就seek这个动作后停止并不再播任何动作；否则会正常更新）
					FrozenActSeekTime = 775, --固定动作seek时间，挂的光效也会播这么长时间（毫秒）
				},

				[PROF_TYPE.TANGMEN] = --对应的玩家门派。 没有对应玩家用PROF_TYPE.MONSTER_HUMANSHAPE_1
				{
					FrozenActName = --[[!]]"pt_站立_唐门", --固定动作名（填了动作名，就seek这个动作后停止并不再播任何动作；否则会正常更新）
					FrozenActSeekTime = 100, --固定动作seek时间，挂的光效也会播这么长时间（毫秒）
				},

				[PROF_TYPE.EMEI] = --对应的玩家门派。 没有对应玩家用PROF_TYPE.MONSTER_HUMANSHAPE_1
				{
					FrozenActName = --[[!]]"pt_站立_峨嵋", --固定动作名（填了动作名，就seek这个动作后停止并不再播任何动作；否则会正常更新）
					FrozenActSeekTime = 100, --固定动作seek时间，挂的光效也会播这么长时间（毫秒）
				},
				
				[11] = --对应的玩家门派。 没有对应玩家用PROF_TYPE.MONSTER_HUMANSHAPE_1
				{
					FrozenActName = --[[!]]"pt_站立_无名", --固定动作名（填了动作名，就seek这个动作后停止并不再播任何动作；否则会正常更新）
					FrozenActSeekTime = 100, --固定动作seek时间，挂的光效也会播这么长时间（毫秒）
				},
			},
		}
	},

	[88315] = --tid: NPC的模板id：邪恶的年兽
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 3.0, --模型缩放比例

			GfxFile = --[[!AUTO_207]]"策劃聯入\\狀態效果\\正面狀態\\金身效果.gfx",	--挂光效文件名
		}
	},

	[88316] = --tid: NPC的模板id：邪恶的年兽
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 3.0, --模型缩放比例

			GfxFile = --[[!AUTO_207]]"策劃聯入\\狀態效果\\正面狀態\\金身效果.gfx",	--挂光效文件名
		}
	},

	[91212] = --tid: NPC的模板id：欧炼子
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 2.0, --模型缩放比例

			
		}
	},
	[91418] = --tid: NPC的模板id：猴子
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 0.5, --模型缩放比例			
		}
	},

	[91419] = --tid: NPC的模板id：狐狸
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 0.5, --模型缩放比例			
		}
	},

	[91420] = --tid: NPC的模板id：蝎子
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 0.5, --模型缩放比例			
		}
	},
	[91835] = --tid: NPC的模板id：机关人头目
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 2.0, --模型缩放比例			
		}
	},
	[91832] = --tid: NPC的模板id：变异甲虫
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 2.0, --模型缩放比例			
		}
	},
	[91907] = --tid: NPC的模板id：10层BOSS少林
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 2.0, --模型缩放比例			
		}
	},
	[91908] = --tid: NPC的模板id：10层BOSS武当
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 2.0, --模型缩放比例			
		}
	},
	[91909] = --tid: NPC的模板id：10层BOSS衡山
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 2.0, --模型缩放比例			
		}
	},
	[91910] = --tid: NPC的模板id：10层BOSS日月
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 2.0, --模型缩放比例			
		}
	},
	[91911] = --tid: NPC的模板id：10层BOSS华山
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 2.0, --模型缩放比例			
		}
	},
	[91912] = --tid: NPC的模板id：10层BOSS唐门
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 2.0, --模型缩放比例			
		}
	},
	[91913] = --tid: NPC的模板id：10层BOSS逍遥
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 2.0, --模型缩放比例			
		}
	},
	[91914] = --tid: NPC的模板id：10层BOSS峨眉
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 2.0, --模型缩放比例			
		}
	},
	[91915] = --tid: NPC的模板id：10层BOSS五仙
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 2.0, --模型缩放比例			
		}
	},
	[91916] = --tid: NPC的模板id：10层BOSS恒山
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 2.0, --模型缩放比例			
		}
	},
	[91917] = --tid: NPC的模板id：10层小怪少林
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 1.2, --模型缩放比例			
		}
	},
	[91918] = --tid: NPC的模板id：10层小怪武当
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 1.2, --模型缩放比例			
		}
	},
	[91919] = --tid: NPC的模板id：10层小怪衡山
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 1.2, --模型缩放比例			
		}
	},
	[91920] = --tid: NPC的模板id：10层小怪日月
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 1.2, --模型缩放比例			
		}
	},
	[91921] = --tid: NPC的模板id：10层小怪华山
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 1.2, --模型缩放比例			
		}
	},
	[91922] = --tid: NPC的模板id：10层小怪唐门
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 1.2, --模型缩放比例			
		}
	},
	[91923] = --tid: NPC的模板id：10层小怪逍遥
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 1.2, --模型缩放比例			
		}
	},
	[91924] = --tid: NPC的模板id：10层小怪峨眉
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 1.2, --模型缩放比例			
		}
	},
	[91925] = --tid: NPC的模板id：10层小怪五仙
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 1.2, --模型缩放比例			
		}
	},
	[91926] = --tid: NPC的模板id：10层小怪恒山
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 1.2, --模型缩放比例			
		}
	},
	[91927] = --tid: NPC的模板id：20层BOSS少林
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 2.0, --模型缩放比例			
		}
	},
	[91928] = --tid: NPC的模板id：20层BOSS武当
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 2.0, --模型缩放比例			
		}
	},
	[91929] = --tid: NPC的模板id：20层BOSS衡山
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 2.0, --模型缩放比例			
		}
	},
	[91930] = --tid: NPC的模板id：20层BOSS日月
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 2.0, --模型缩放比例			
		}
	},
	[91931] = --tid: NPC的模板id：20层BOSS华山
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 2.0, --模型缩放比例			
		}
	},
	[91932] = --tid: NPC的模板id：20层BOSS唐门
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 2.0, --模型缩放比例			
		}
	},
	[91933] = --tid: NPC的模板id：20层BOSS逍遥
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 2.0, --模型缩放比例			
		}
	},
	[91934] = --tid: NPC的模板id：20层BOSS峨眉
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 2.0, --模型缩放比例			
		}
	},
	[91935] = --tid: NPC的模板id：20层BOSS五仙
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 2.0, --模型缩放比例			
		}
	},
	[91936] = --tid: NPC的模板id：20层BOSS恒山
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 2.0, --模型缩放比例			
		}
	},
	[91937] = --tid: NPC的模板id：20层小怪少林
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 1.2, --模型缩放比例			
		}
	},
	[91938] = --tid: NPC的模板id：20层小怪武当
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 1.2, --模型缩放比例			
		}
	},
	[91939] = --tid: NPC的模板id：20层小怪衡山
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 1.2, --模型缩放比例			
		}
	},
	[91940] = --tid: NPC的模板id：20层小怪日月
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 1.2, --模型缩放比例			
		}
	},
	[91941] = --tid: NPC的模板id：20层小怪华山
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 1.2, --模型缩放比例			
		}
	},
	[91942] = --tid: NPC的模板id：20层小怪唐门
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 1.2, --模型缩放比例			
		}
	},
	[91943] = --tid: NPC的模板id：20层小怪逍遥
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 1.2, --模型缩放比例			
		}
	},
	[91944] = --tid: NPC的模板id：20层小怪峨眉
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 1.2, --模型缩放比例			
		}
	},
	[91945] = --tid: NPC的模板id：20层小怪五仙
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 1.2, --模型缩放比例			
		}
	},
	[91946] = --tid: NPC的模板id：20层小怪恒山
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 1.2, --模型缩放比例			
		}
	},
	[91947] = --tid: NPC的模板id：30层BOSS少林
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 2.0, --模型缩放比例			
		}
	},
	[91948] = --tid: NPC的模板id：30层BOSS武当
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 2.0, --模型缩放比例			
		}
	},
	[91949] = --tid: NPC的模板id：30层BOSS衡山
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 2.0, --模型缩放比例			
		}
	},
	[91950] = --tid: NPC的模板id：30层BOSS日月
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 2.0, --模型缩放比例			
		}
	},
	[91951] = --tid: NPC的模板id：30层BOSS华山
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 2.0, --模型缩放比例			
		}
	},
	[91952] = --tid: NPC的模板id：30层BOSS唐门
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 2.0, --模型缩放比例			
		}
	},
	[91953] = --tid: NPC的模板id：30层BOSS逍遥
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 2.0, --模型缩放比例			
		}
	},
	[91954] = --tid: NPC的模板id：30层BOSS峨眉
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 2.0, --模型缩放比例			
		}
	},
	[91955] = --tid: NPC的模板id：30层BOSS五仙
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 2.0, --模型缩放比例			
		}
	},
	[91956] = --tid: NPC的模板id：30层BOSS恒山
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 2.0, --模型缩放比例			
		}
	},
	[91957] = --tid: NPC的模板id：30层小怪少林
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 1.2, --模型缩放比例			
		}
	},
	[91958] = --tid: NPC的模板id：30层小怪武当
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 1.2, --模型缩放比例			
		}
	},
	[91959] = --tid: NPC的模板id：30层小怪衡山
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 1.2, --模型缩放比例			
		}
	},
	[91960] = --tid: NPC的模板id：30层小怪日月
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 1.2, --模型缩放比例			
		}
	},
	[91961] = --tid: NPC的模板id：30层小怪华山
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 1.2, --模型缩放比例			
		}
	},
	[91962] = --tid: NPC的模板id：30层小怪唐门
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 1.2, --模型缩放比例			
		}
	},
	[91963] = --tid: NPC的模板id：30层小怪逍遥
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 1.2, --模型缩放比例			
		}
	},
	[91964] = --tid: NPC的模板id：30层小怪峨眉
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 1.2, --模型缩放比例			
		}
	},
	[91965] = --tid: NPC的模板id：30层小怪五仙
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 1.2, --模型缩放比例			
		}
	},
	[91966] = --tid: NPC的模板id：30层小怪恒山
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 1.2, --模型缩放比例			
		}
	},
	[91967] = --tid: NPC的模板id：40层BOSS少林
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 2.0, --模型缩放比例			
		}
	},
	[91968] = --tid: NPC的模板id：40层BOSS武当
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 2.0, --模型缩放比例			
		}
	},
	[91969] = --tid: NPC的模板id：40层BOSS衡山
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 2.0, --模型缩放比例			
		}
	},
	[91970] = --tid: NPC的模板id：40层BOSS日月
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 2.0, --模型缩放比例			
		}
	},
	[91971] = --tid: NPC的模板id：40层BOSS华山
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 2.0, --模型缩放比例			
		}
	},
	[91972] = --tid: NPC的模板id：40层BOSS唐门
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 2.0, --模型缩放比例			
		}
	},
	[91973] = --tid: NPC的模板id：40层BOSS逍遥
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 2.0, --模型缩放比例			
		}
	},
	[91974] = --tid: NPC的模板id：40层BOSS峨眉
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 2.0, --模型缩放比例			
		}
	},
	[91975] = --tid: NPC的模板id：40层BOSS五仙
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 2.0, --模型缩放比例			
		}
	},
	[91976] = --tid: NPC的模板id：40层BOSS恒山
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 2.0, --模型缩放比例			
		}
	},
	[91977] = --tid: NPC的模板id：40层小怪少林
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 1.2, --模型缩放比例			
		}
	},
	[91978] = --tid: NPC的模板id：40层小怪武当
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 1.2, --模型缩放比例			
		}
	},
	[91979] = --tid: NPC的模板id：40层小怪衡山
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 1.2, --模型缩放比例			
		}
	},
	[91980] = --tid: NPC的模板id：40层小怪日月
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 1.2, --模型缩放比例			
		}
	},
	[91981] = --tid: NPC的模板id：40层小怪华山
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 1.2, --模型缩放比例			
		}
	},
	[91982] = --tid: NPC的模板id：40层小怪唐门
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 1.2, --模型缩放比例			
		}
	},
	[91983] = --tid: NPC的模板id：40层小怪逍遥
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 1.2, --模型缩放比例			
		}
	},
	[91984] = --tid: NPC的模板id：40层小怪峨眉
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 1.2, --模型缩放比例			
		}
	},
	[91985] = --tid: NPC的模板id：40层小怪五仙
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 1.2, --模型缩放比例			
		}
	},
	[91986] = --tid: NPC的模板id：40层小怪恒山
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 1.2, --模型缩放比例			
		}
	},
	[91987] = --tid: NPC的模板id：50层BOSS少林
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 2.0, --模型缩放比例			
		}
	},
	[91988] = --tid: NPC的模板id：50层BOSS武当
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 2.0, --模型缩放比例			
		}
	},
	[91989] = --tid: NPC的模板id：50层BOSS衡山
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 2.0, --模型缩放比例			
		}
	},
	[91990] = --tid: NPC的模板id：50层BOSS日月
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 2.0, --模型缩放比例			
		}
	},
	[91991] = --tid: NPC的模板id：50层BOSS华山
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 2.0, --模型缩放比例			
		}
	},
	[91992] = --tid: NPC的模板id：50层BOSS唐门
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 2.0, --模型缩放比例			
		}
	},
	[91993] = --tid: NPC的模板id：50层BOSS逍遥
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 2.0, --模型缩放比例			
		}
	},
	[91994] = --tid: NPC的模板id：50层BOSS峨眉
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 2.0, --模型缩放比例			
		}
	},
	[91995] = --tid: NPC的模板id：50层BOSS五仙
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 2.0, --模型缩放比例			
		}
	},
	[91996] = --tid: NPC的模板id：50层BOSS恒山
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 2.0, --模型缩放比例			
		}
	},
	[91997] = --tid: NPC的模板id：50层小怪少林
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 1.2, --模型缩放比例			
		}
	},
	[91998] = --tid: NPC的模板id：50层小怪武当
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 1.2, --模型缩放比例			
		}
	},
	[91999] = --tid: NPC的模板id：50层小怪衡山
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 1.2, --模型缩放比例			
		}
	},
	[92000] = --tid: NPC的模板id：50层小怪日月
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 1.2, --模型缩放比例			
		}
	},
	[92001] = --tid: NPC的模板id：50层小怪华山
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 1.2, --模型缩放比例			
		}
	},
	[92002] = --tid: NPC的模板id：50层小怪唐门
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 1.2, --模型缩放比例			
		}
	},
	[92003] = --tid: NPC的模板id：50层小怪逍遥
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 1.2, --模型缩放比例			
		}
	},
	[92004] = --tid: NPC的模板id：50层小怪峨眉
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 1.2, --模型缩放比例			
		}
	},
	[92005] = --tid: NPC的模板id：50层小怪五仙
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 1.2, --模型缩放比例			
		}
	},
	[92006] = --tid: NPC的模板id：50层小怪恒山
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 1.2, --模型缩放比例			
		}
	},
	[92007] = --tid: NPC的模板id：60层BOSS少林
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 2.0, --模型缩放比例			
		}
	},
	[92008] = --tid: NPC的模板id：60层BOSS武当
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 2.0, --模型缩放比例			
		}
	},
	[92009] = --tid: NPC的模板id：60层BOSS衡山
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 2.0, --模型缩放比例			
		}
	},
	[92010] = --tid: NPC的模板id：60层BOSS日月
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 2.0, --模型缩放比例			
		}
	},
	[92011] = --tid: NPC的模板id：60层BOSS华山
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 2.0, --模型缩放比例			
		}
	},
	[92012] = --tid: NPC的模板id：60层BOSS唐门
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 2.0, --模型缩放比例			
		}
	},
	[92013] = --tid: NPC的模板id：60层BOSS逍遥
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 2.0, --模型缩放比例			
		}
	},
	[92014] = --tid: NPC的模板id：60层BOSS峨眉
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 2.0, --模型缩放比例			
		}
	},
	[92015] = --tid: NPC的模板id：60层BOSS五仙
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 2.0, --模型缩放比例			
		}
	},
	[92016] = --tid: NPC的模板id：60层BOSS恒山
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 2.0, --模型缩放比例			
		}
	},
	[92017] = --tid: NPC的模板id：60层小怪少林
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 1.2, --模型缩放比例			
		}
	},
	[92018] = --tid: NPC的模板id：60层小怪武当
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 1.2, --模型缩放比例			
		}
	},
	[92019] = --tid: NPC的模板id：60层小怪衡山
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 1.2, --模型缩放比例			
		}
	},
	[92020] = --tid: NPC的模板id：60层小怪日月
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 1.2, --模型缩放比例			
		}
	},
	[92021] = --tid: NPC的模板id：60层小怪华山
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 1.2, --模型缩放比例			
		}
	},
	[92022] = --tid: NPC的模板id：60层小怪唐门
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 1.2, --模型缩放比例			
		}
	},
	[2023] = --tid: NPC的模板id：60层小怪逍遥
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 1.2, --模型缩放比例			
		}
	},
	[91924] = --tid: NPC的模板id：60层小怪峨眉
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 1.2, --模型缩放比例			
		}
	},
	[92025] = --tid: NPC的模板id：60层小怪五仙
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 1.2, --模型缩放比例			
		}
	},
	[92026] = --tid: NPC的模板id：60层小怪恒山
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 1.2, --模型缩放比例			
		}
	},
	[92864] = --tid: NPC的模板id：野外boss华山
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 0.5, --模型缩放比例			
		}
	},
	[92865] = --tid: NPC的模板id：野外boss少室山
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 0.5, --模型缩放比例			
		}
	},
	[92866] = --tid: NPC的模板id：野外boss五霸岗
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 0.5, --模型缩放比例			
		}
	},
	[92667] = --tid: NPC的模板id：2015年礼物保卫战-邪恶圣诞老人
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 1.2, --模型缩放比例			
		}
	},
	[92669] = --tid: NPC的模板id：2015年礼物保卫战-邪恶雪人
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 0.8, --模型缩放比例			
		}
	},
	[92672] = --tid: NPC的模板id：2015年礼物保卫战-迷你邪恶雪人
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 0.5, --模型缩放比例			
		}
	},
        [93651] = --tid: NPC的模板id：2016年少室山野外boss醉猴
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 3, --模型缩放比例			
		}
	},
	[93652] = --tid: NPC的模板id：2016年华山野外boss醉猴
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 3, --模型缩放比例			
		}
	},
	[93653] = --tid: NPC的模板id：2016年五霸岗野外boss醉猴
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 3, --模型缩放比例			
		}
	},
	[94001] = --tid: NPC的模板id：2016端午节boss蝎子
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 5, --模型缩放比例			
		}
	},
	[94002] = --tid: NPC的模板id：2016端午节boss蜈蚣
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 6, --模型缩放比例			
		}
	},
	[94003] = --tid: NPC的模板id：2016端午节boss甲虫
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 6, --模型缩放比例			
		}
	},
	[94004] = --tid: NPC的模板id：2016端午节boss花斑蛛
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 5, --模型缩放比例			
		}
	},
	[94005] = --tid: NPC的模板id：2016端午节boss蟾蜍
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 5, --模型缩放比例			
		}
	},
	[93826] = --tid: NPC的模板id：2016玄境化界符文剑
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 1, --模型缩放比例			
		}
	},
	[93821] = --tid: NPC的模板id：2016玄境化界红毒蛇
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 2, --模型缩放比例			
		}
	},
	[93806] = --tid: NPC的模板id：2016玄境化界利爪鬼
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 1.2, --模型缩放比例			
		}
	},
	[93820] = --tid: NPC的模板id：2016玄境化界青蛇
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 1.3, --模型缩放比例			
		}
	},
	[93828] = --tid: NPC的模板id：2016玄境化界符文炸弹
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 1, --模型缩放比例			
		}
	},
	[93827] = --tid: NPC的模板id：2016玄境化界自爆变异体
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 1, --模型缩放比例			
		}
	},
	[93952] = --tid: NPC的模板id：2016玄境化界木叶旋风
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 3, --模型缩放比例			
		}
	},
	[95032] = --tid: NPC的模板id：2016玄境化界凤凰雷
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 2.5, --模型缩放比例			
		}
	},
	[95037] = --tid: NPC的模板id：2016玄境化界封印凤凰
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 0.5, --模型缩放比例			
		}
	},
	[95043] = --tid: NPC的模板id：2016玄境化界最终凤凰
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 1, --模型缩放比例			
		}
	},
	[95095] = --tid: NPC的模板id：2016玄境化界最终凤凰
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 1.5, --模型缩放比例			
		}
	},
	[96072] = --tid: NPC的模板id：2016阴山天狗
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 3, --模型缩放比例			
		}
	},
	[96075] = --tid: NPC的模板id：2016蓬莱天狗
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 3, --模型缩放比例			
		}
	},
	[96076] = --tid: NPC的模板id：2016夜岚天狗
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 3, --模型缩放比例			
		}
	},
	[96816] = --tid: NPC的模板id：赵伯楠游乐场NPC
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 0.6, --模型缩放比例			
		}
	},
	[96767] = --tid: NPC的模板id：游乐场炼丹_飞蛾2
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 2, --模型缩放比例			
		}
	},
	[96766] = --tid: NPC的模板id：游乐场炼丹_飞蛾
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 0.5, --模型缩放比例			
		}
	},
    [97181] = --tid: NPC的模板id：惊慌的野猪
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 2, --模型缩放比例			
		}
	},
	[97178] = --tid: NPC的模板id：有声蜂巢
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 2, --模型缩放比例			
		}
	},
	[97179] = --tid: NPC的模板id：无声蜂巢
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 2, --模型缩放比例			
		}
	},
	    [97169] = --tid: NPC的模板id：强壮的羽箭精灵
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 2, --模型缩放比例			
		}
	},
		    [97170] = --tid: NPC的模板id：爆炸羽箭精灵
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 1.3, --模型缩放比例			
		}
	},
		    [97173] = --tid: NPC的模板id：友好的羽箭精灵
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 1.5, --模型缩放比例			
		}
	},
		    [97174] = --tid: NPC的模板id：羽箭精灵领袖
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 1.5, --模型缩放比例			
		}
	},
		    [97172] = --tid: NPC的模板id：热情的羽箭精灵
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 1.5, --模型缩放比例			
		}
	},
		    [97171] = --tid: NPC的模板id：寒冰羽箭精灵
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 1.5, --模型缩放比例			
		}
	},
		    [97175] = --tid: NPC的模板id：随机羽箭精灵
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 1.3, --模型缩放比例			
		}
	},
		[97273] = --tid: NPC的模板id：身手矫健副本强怪
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 1.3, --模型缩放比例			
		}
	},
		[97345] = --tid: NPC的模板id：身手矫健副本强怪
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 2, --模型缩放比例			
		}
	},
		[97685] = --tid: NPC的模板id：周年BOSS
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 2, --模型缩放比例			
		}
	},
		[98404] = --tid: NPC的模板id：昆仑BOSS
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 2, --模型缩放比例			
		}
	},
		[99393] = --tid: NPC的模板id：大逃杀指引NPC
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 1.5, --模型缩放比例			
		}
	},
		[93651] = --tid: NPC的模板id：2017双节BOSS1
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 3, --模型缩放比例			
		}
	},
		[93652] = --tid: NPC的模板id：2017双节BOSS2
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 3, --模型缩放比例			
		}
	},
		[93653] = --tid: NPC的模板id：2017双节BOSS3
	{
		[-1] = --NPC的别名hash。[-1]表示对改该tid的所有npc生效
		{
			ModelScale = 3, --模型缩放比例			
		}
	},
		

}


-- 取所有ModelVisual配置
function NPCModelVisual:GetAllNPCModelVisual()
	return NPCModelVisual.List
end

-- 雕像底座模型路径
NPCModelVisual.StatueFoundation =
{
--	示例：
--	[场景id] = -- 场景id：洛阳
--	{
--		[npc模板id] = 14950, --底座模型路径id
--	},

	[68] = -- 场景id：福州
	{
		[71445] = 14950, --底座模型路径id
	},

	[82] = -- 场景id：余杭
	{
		[62917] = 14950, --底座模型路径id
	},
	[67] = -- 场景id：衡山
	{
		[81361] = 20867, --底座模型路径id
	},
	[75] = -- 场景id：洛阳
	{
		[86368] = 14950, --底座模型路径id
	},
}
-- 取所有雕像底座配置
function NPCModelVisual:GetAllStatueFoundation()
	return NPCModelVisual.StatueFoundation
end


--[[#tag push from_excel]]
Monster_sound_property = {}
Monster_sound_property[3625] = {atk = 0, def = 0}
Monster_sound_property[15307] = {atk = 0, def = 0}
Monster_sound_property[15302] = {atk = 0, def = 0}
Monster_sound_property[15303] = {atk = 0, def = 0}
Monster_sound_property[15308] = {atk = 0, def = 0}
Monster_sound_property[15304] = {atk = 0, def = 0}
Monster_sound_property[15306] = {atk = 0, def = 0}
Monster_sound_property[15305] = {atk = 0, def = 0}
Monster_sound_property[15310] = {atk = 0, def = 10}
Monster_sound_property[15312] = {atk = 0, def = 0}
Monster_sound_property[15316] = {atk = 0, def = 0}
Monster_sound_property[15314] = {atk = 0, def = 1}
Monster_sound_property[15313] = {atk = 0, def = 0}
Monster_sound_property[15311] = {atk = 0, def = 10}
Monster_sound_property[17660] = {atk = 0, def = 0}
Monster_sound_property[15315] = {atk = 0, def = 0}
Monster_sound_property[16210] = {atk = 0, def = 0}
Monster_sound_property[16211] = {atk = 0, def = 0}
Monster_sound_property[15329] = {atk = 0, def = 1}
Monster_sound_property[16212] = {atk = 0, def = 0}
Monster_sound_property[15330] = {atk = 0, def = 1}
Monster_sound_property[15309] = {atk = 0, def = 0}
Monster_sound_property[15323] = {atk = 0, def = 0}
Monster_sound_property[15325] = {atk = 0, def = 0}
Monster_sound_property[15331] = {atk = 0, def = 1}
Monster_sound_property[15320] = {atk = 0, def = 0}
Monster_sound_property[17661] = {atk = 21, def = 9}
Monster_sound_property[15324] = {atk = 0, def = 0}
Monster_sound_property[17662] = {atk = 17, def = 10}
Monster_sound_property[15321] = {atk = 0, def = 0}
Monster_sound_property[15322] = {atk = 0, def = 0}
Monster_sound_property[15319] = {atk = 0, def = 0}
Monster_sound_property[17663] = {atk = 0, def = 0}
Monster_sound_property[15317] = {atk = 0, def = 0}
Monster_sound_property[15318] = {atk = 0, def = 0}
Monster_sound_property[15326] = {atk = 0, def = 0}
Monster_sound_property[15327] = {atk = 0, def = 0}
Monster_sound_property[17664] = {atk = 0, def = 0}
Monster_sound_property[15328] = {atk = 0, def = 0}
Monster_sound_property[15284] = {atk = 28, def = 1}
Monster_sound_property[15283] = {atk = 28, def = 1}
Monster_sound_property[15075] = {atk = 13, def = 1}
Monster_sound_property[15122] = {atk = 28, def = 1}
Monster_sound_property[15076] = {atk = 28, def = 1}
Monster_sound_property[15077] = {atk = 28, def = 1}
Monster_sound_property[15286] = {atk = 17, def = 1}
Monster_sound_property[15080] = {atk = 28, def = 1}
Monster_sound_property[15081] = {atk = 28, def = 1}
Monster_sound_property[15082] = {atk = 14, def = 1}
Monster_sound_property[16224] = {atk = 14, def = 1}
Monster_sound_property[15083] = {atk = 14, def = 1}
Monster_sound_property[15085] = {atk = 14, def = 1}
Monster_sound_property[15124] = {atk = 14, def = 1}
Monster_sound_property[15123] = {atk = 14, def = 1}
Monster_sound_property[18057] = {atk = 14, def = 1}
Monster_sound_property[16183] = {atk = 28, def = 1}
Monster_sound_property[20243] = {atk = 14, def = 1}
Monster_sound_property[15086] = {atk = 28, def = 1}
Monster_sound_property[16225] = {atk = 28, def = 1}
Monster_sound_property[16230] = {atk = 28, def = 1}
Monster_sound_property[15099] = {atk = 31, def = 1}
Monster_sound_property[15087] = {atk = 17, def = 1}
Monster_sound_property[15101] = {atk = 14, def = 1}
Monster_sound_property[15102] = {atk = 14, def = 1}
Monster_sound_property[15103] = {atk = 14, def = 1}
Monster_sound_property[15089] = {atk = 14, def = 1}
Monster_sound_property[15090] = {atk = 14, def = 1}
Monster_sound_property[15287] = {atk = 14, def = 1}
Monster_sound_property[15091] = {atk = 17, def = 1}
Monster_sound_property[15092] = {atk = 13, def = 1}
Monster_sound_property[15100] = {atk = 28, def = 1}
Monster_sound_property[15093] = {atk = 14, def = 1}
Monster_sound_property[15094] = {atk = 14, def = 1}
Monster_sound_property[15095] = {atk = 14, def = 1}
Monster_sound_property[15281] = {atk = 14, def = 1}
Monster_sound_property[15272] = {atk = 28, def = 1}
Monster_sound_property[15280] = {atk = 14, def = 1}
Monster_sound_property[15279] = {atk = 12, def = 1}
Monster_sound_property[15273] = {atk = 28, def = 1}
Monster_sound_property[18058] = {atk = 13, def = 2}
Monster_sound_property[18059] = {atk = 13, def = 2}
Monster_sound_property[15268] = {atk = 14, def = 1}
Monster_sound_property[15812] = {atk = 28, def = 1}
Monster_sound_property[15271] = {atk = 14, def = 1}
Monster_sound_property[17198] = {atk = 17, def = 1}
Monster_sound_property[15270] = {atk = 28, def = 1}
Monster_sound_property[15269] = {atk = 14, def = 1}
Monster_sound_property[15285] = {atk = 28, def = 1}
Monster_sound_property[15266] = {atk = 28, def = 1}
Monster_sound_property[15267] = {atk = 28, def = 1}
Monster_sound_property[15265] = {atk = 14, def = 1}
Monster_sound_property[15264] = {atk = 14, def = 1}
Monster_sound_property[15263] = {atk = 14, def = 1}
Monster_sound_property[18060] = {atk = 14, def = 1}
Monster_sound_property[15262] = {atk = 17, def = 1}
Monster_sound_property[17205] = {atk = 28, def = 1}
Monster_sound_property[15261] = {atk = 14, def = 1}
Monster_sound_property[15259] = {atk = 28, def = 1}
Monster_sound_property[15260] = {atk = 14, def = 1}
Monster_sound_property[15253] = {atk = 28, def = 1}
Monster_sound_property[15252] = {atk = 17, def = 1}
Monster_sound_property[15296] = {atk = 31, def = 1}
Monster_sound_property[15256] = {atk = 14, def = 1}
Monster_sound_property[15257] = {atk = 14, def = 1}
Monster_sound_property[15251] = {atk = 14, def = 1}
Monster_sound_property[15255] = {atk = 14, def = 1}
Monster_sound_property[15254] = {atk = 14, def = 1}
Monster_sound_property[15258] = {atk = 14, def = 1}
Monster_sound_property[15247] = {atk = 28, def = 1}
Monster_sound_property[15248] = {atk = 28, def = 1}
Monster_sound_property[20310] = {atk = 14, def = 1}
Monster_sound_property[15241] = {atk = 14, def = 1}
Monster_sound_property[15243] = {atk = 28, def = 1}
Monster_sound_property[15242] = {atk = 28, def = 1}
Monster_sound_property[15250] = {atk = 14, def = 1}
Monster_sound_property[16229] = {atk = 14, def = 1}
Monster_sound_property[15244] = {atk = 14, def = 1}
Monster_sound_property[15249] = {atk = 13, def = 1}
Monster_sound_property[15118] = {atk = 0, def = 1}
Monster_sound_property[15114] = {atk = 14, def = 1}
Monster_sound_property[15240] = {atk = 28, def = 1}
Monster_sound_property[15301] = {atk = 14, def = 1}
Monster_sound_property[15237] = {atk = 28, def = 1}
Monster_sound_property[15239] = {atk = 12, def = 1}
Monster_sound_property[15116] = {atk = 12, def = 1}
Monster_sound_property[15119] = {atk = 14, def = 1}
Monster_sound_property[15282] = {atk = 14, def = 1}
Monster_sound_property[15117] = {atk = 14, def = 1}
Monster_sound_property[15115] = {atk = 12, def = 1}
Monster_sound_property[15238] = {atk = 14, def = 1}
Monster_sound_property[15113] = {atk = 0, def = 1}
Monster_sound_property[15120] = {atk = 28, def = 1}
Monster_sound_property[15227] = {atk = 14, def = 1}
Monster_sound_property[15228] = {atk = 13, def = 1}
Monster_sound_property[15234] = {atk = 13, def = 1}
Monster_sound_property[15232] = {atk = 14, def = 1}
Monster_sound_property[15231] = {atk = 14, def = 1}
Monster_sound_property[15233] = {atk = 14, def = 1}
Monster_sound_property[16208] = {atk = 14, def = 1}
Monster_sound_property[15229] = {atk = 12, def = 2}
Monster_sound_property[18061] = {atk = 14, def = 1}
Monster_sound_property[15230] = {atk = 12, def = 2}
Monster_sound_property[16209] = {atk = 12, def = 1}
Monster_sound_property[15235] = {atk = 14, def = 1}
Monster_sound_property[18062] = {atk = 28, def = 1}
Monster_sound_property[15221] = {atk = 28, def = 1}
Monster_sound_property[15223] = {atk = 28, def = 1}
Monster_sound_property[15222] = {atk = 14, def = 1}
Monster_sound_property[18519] = {atk = 28, def = 1}
Monster_sound_property[15220] = {atk = 12, def = 1}
Monster_sound_property[15300] = {atk = 12, def = 1}
Monster_sound_property[15225] = {atk = 12, def = 1}
Monster_sound_property[15224] = {atk = 12, def = 1}
Monster_sound_property[15216] = {atk = 14, def = 1}
Monster_sound_property[15217] = {atk = 0, def = 1}
Monster_sound_property[15105] = {atk = 14, def = 1}
Monster_sound_property[15104] = {atk = 14, def = 1}
Monster_sound_property[15219] = {atk = 28, def = 1}
Monster_sound_property[15218] = {atk = 28, def = 1}
Monster_sound_property[15211] = {atk = 28, def = 1}
Monster_sound_property[15214] = {atk = 28, def = 1}
Monster_sound_property[15212] = {atk = 28, def = 1}
Monster_sound_property[15213] = {atk = 12, def = 1}
Monster_sound_property[15208] = {atk = 17, def = 1}
Monster_sound_property[15209] = {atk = 17, def = 1}
Monster_sound_property[15210] = {atk = 17, def = 1}
Monster_sound_property[15215] = {atk = 14, def = 1}
Monster_sound_property[15207] = {atk = 28, def = 1}
Monster_sound_property[15201] = {atk = 14, def = 1}
Monster_sound_property[15204] = {atk = 14, def = 1}
Monster_sound_property[15202] = {atk = 14, def = 1}
Monster_sound_property[15205] = {atk = 14, def = 1}
Monster_sound_property[15203] = {atk = 14, def = 1}
Monster_sound_property[15206] = {atk = 14, def = 1}
Monster_sound_property[18063] = {atk = 12, def = 2}
Monster_sound_property[18064] = {atk = 12, def = 2}
Monster_sound_property[15196] = {atk = 28, def = 1}
Monster_sound_property[15197] = {atk = 28, def = 1}
Monster_sound_property[15198] = {atk = 28, def = 1}
Monster_sound_property[15199] = {atk = 28, def = 1}
Monster_sound_property[15200] = {atk = 28, def = 1}
Monster_sound_property[15195] = {atk = 14, def = 1}
Monster_sound_property[15193] = {atk = 14, def = 1}
Monster_sound_property[15194] = {atk = 14, def = 1}
Monster_sound_property[15190] = {atk = 14, def = 1}
Monster_sound_property[15191] = {atk = 14, def = 1}
Monster_sound_property[15192] = {atk = 14, def = 1}
Monster_sound_property[15186] = {atk = 21, def = 1}
Monster_sound_property[15185] = {atk = 17, def = 1}
Monster_sound_property[15187] = {atk = 17, def = 1}
Monster_sound_property[15189] = {atk = 14, def = 1}
Monster_sound_property[16207] = {atk = 14, def = 1}
Monster_sound_property[15183] = {atk = 14, def = 1}
Monster_sound_property[15184] = {atk = 0, def = 0}
Monster_sound_property[15813] = {atk = 14, def = 1}
Monster_sound_property[15188] = {atk = 13, def = 1}
Monster_sound_property[15182] = {atk = 13, def = 1}
Monster_sound_property[15297] = {atk = 14, def = 1}
Monster_sound_property[15106] = {atk = 24, def = 0}
Monster_sound_property[15181] = {atk = 14, def = 1}
Monster_sound_property[15179] = {atk = 14, def = 1}
Monster_sound_property[17480] = {atk = 14, def = 1}
Monster_sound_property[15178] = {atk = 14, def = 1}
Monster_sound_property[15288] = {atk = 28, def = 1}
Monster_sound_property[15176] = {atk = 17, def = 1}
Monster_sound_property[15177] = {atk = 17, def = 1}
Monster_sound_property[15180] = {atk = 28, def = 1}
Monster_sound_property[16184] = {atk = 17, def = 1}
Monster_sound_property[15175] = {atk = 17, def = 1}
Monster_sound_property[16228] = {atk = 17, def = 1}
Monster_sound_property[15174] = {atk = 14, def = 1}
Monster_sound_property[18065] = {atk = 14, def = 1}
Monster_sound_property[15172] = {atk = 17, def = 1}
Monster_sound_property[15173] = {atk = 17, def = 1}
Monster_sound_property[15171] = {atk = 17, def = 1}
Monster_sound_property[15169] = {atk = 13, def = 1}
Monster_sound_property[15170] = {atk = 28, def = 1}
Monster_sound_property[15167] = {atk = 14, def = 1}
Monster_sound_property[15166] = {atk = 28, def = 1}
Monster_sound_property[15168] = {atk = 31, def = 1}
Monster_sound_property[15164] = {atk = 26, def = 1}
Monster_sound_property[15160] = {atk = 28, def = 1}
Monster_sound_property[15299] = {atk = 28, def = 1}
Monster_sound_property[15161] = {atk = 28, def = 1}
Monster_sound_property[15162] = {atk = 17, def = 1}
Monster_sound_property[15291] = {atk = 28, def = 1}
Monster_sound_property[15295] = {atk = 28, def = 1}
Monster_sound_property[15159] = {atk = 13, def = 1}
Monster_sound_property[15158] = {atk = 31, def = 1}
Monster_sound_property[15163] = {atk = 17, def = 1}
Monster_sound_property[15153] = {atk = 28, def = 1}
Monster_sound_property[15156] = {atk = 31, def = 1}
Monster_sound_property[15814] = {atk = 28, def = 1}
Monster_sound_property[15155] = {atk = 14, def = 1}
Monster_sound_property[15154] = {atk = 14, def = 1}
Monster_sound_property[16890] = {atk = 28, def = 1}
Monster_sound_property[17206] = {atk = 0, def = 1}
Monster_sound_property[15298] = {atk = 17, def = 1}
Monster_sound_property[15157] = {atk = 14, def = 1}
Monster_sound_property[15151] = {atk = 14, def = 1}
Monster_sound_property[15152] = {atk = 14, def = 1}
Monster_sound_property[16433] = {atk = 28, def = 1}
Monster_sound_property[15146] = {atk = 14, def = 1}
Monster_sound_property[18066] = {atk = 14, def = 1}
Monster_sound_property[20301] = {atk = 14, def = 1}
Monster_sound_property[15147] = {atk = 14, def = 1}
Monster_sound_property[15150] = {atk = 13, def = 1}
Monster_sound_property[15149] = {atk = 14, def = 1}
Monster_sound_property[15148] = {atk = 13, def = 1}
Monster_sound_property[15143] = {atk = 14, def = 1}
Monster_sound_property[17146] = {atk = 14, def = 1}
Monster_sound_property[15144] = {atk = 12, def = 1}
Monster_sound_property[15145] = {atk = 14, def = 1}
Monster_sound_property[15141] = {atk = 14, def = 1}
Monster_sound_property[15142] = {atk = 14, def = 1}
Monster_sound_property[16653] = {atk = 17, def = 1}
Monster_sound_property[15139] = {atk = 28, def = 1}
Monster_sound_property[15140] = {atk = 14, def = 1}
Monster_sound_property[17197] = {atk = 14, def = 1}
Monster_sound_property[15135] = {atk = 14, def = 1}
Monster_sound_property[18067] = {atk = 14, def = 1}
Monster_sound_property[15138] = {atk = 28, def = 1}
Monster_sound_property[15136] = {atk = 14, def = 1}
Monster_sound_property[15098] = {atk = 12, def = 1}
Monster_sound_property[15097] = {atk = 14, def = 1}
Monster_sound_property[15137] = {atk = 14, def = 1}
Monster_sound_property[15128] = {atk = 14, def = 1}
Monster_sound_property[17147] = {atk = 14, def = 1}
Monster_sound_property[15133] = {atk = 14, def = 1}
Monster_sound_property[15132] = {atk = 28, def = 1}
Monster_sound_property[15292] = {atk = 17, def = 1}
Monster_sound_property[15130] = {atk = 28, def = 1}
Monster_sound_property[18068] = {atk = 28, def = 1}
Monster_sound_property[15289] = {atk = 28, def = 1}
Monster_sound_property[15129] = {atk = 17, def = 1}
Monster_sound_property[16227] = {atk = 17, def = 1}
Monster_sound_property[15127] = {atk = 14, def = 1}
Monster_sound_property[15125] = {atk = 17, def = 1}
Monster_sound_property[15715] = {atk = 17, def = 1}
Monster_sound_property[16226] = {atk = 17, def = 1}
Monster_sound_property[15126] = {atk = 28, def = 1}
Monster_sound_property[15614] = {atk = 28, def = 1}
Monster_sound_property[15598] = {atk = 28, def = 1}
Monster_sound_property[15597] = {atk = 28, def = 1}
Monster_sound_property[15334] = {atk = 0, def = 1}
Monster_sound_property[15333] = {atk = 0, def = 1}
Monster_sound_property[17469] = {atk = 0, def = 0}
Monster_sound_property[15619] = {atk = 28, def = 1}
Monster_sound_property[15640] = {atk = 0, def = 1}
Monster_sound_property[15500] = {atk = 0, def = 0}
Monster_sound_property[15644] = {atk = 0, def = 0}
Monster_sound_property[15645] = {atk = 0, def = 0}
Monster_sound_property[15646] = {atk = 0, def = 0}
Monster_sound_property[15647] = {atk = 0, def = 0}
Monster_sound_property[15613] = {atk = 28, def = 1}
Monster_sound_property[15615] = {atk = 28, def = 1}
Monster_sound_property[15616] = {atk = 28, def = 1}
Monster_sound_property[15603] = {atk = 28, def = 1}
Monster_sound_property[19677] = {atk = 0, def = 0}
Monster_sound_property[20587] = {atk = 0, def = 0}
Monster_sound_property[15336] = {atk = 0, def = 1}
Monster_sound_property[15618] = {atk = 28, def = 1}
Monster_sound_property[15642] = {atk = 0, def = 1}
Monster_sound_property[15601] = {atk = 28, def = 1}
Monster_sound_property[15600] = {atk = 28, def = 1}
Monster_sound_property[15384] = {atk = 0, def = 1}
Monster_sound_property[15617] = {atk = 28, def = 1}
Monster_sound_property[15612] = {atk = 28, def = 1}
Monster_sound_property[15638] = {atk = 0, def = 1}
Monster_sound_property[15599] = {atk = 28, def = 1}
Monster_sound_property[16213] = {atk = 0, def = 0}
Monster_sound_property[15602] = {atk = 28, def = 1}
Monster_sound_property[20311] = {atk = 0, def = 0}
Monster_sound_property[15606] = {atk = 28, def = 1}
Monster_sound_property[15605] = {atk = 28, def = 1}
Monster_sound_property[15607] = {atk = 28, def = 1}
Monster_sound_property[15611] = {atk = 28, def = 1}
Monster_sound_property[15608] = {atk = 28, def = 1}
Monster_sound_property[15609] = {atk = 28, def = 1}
Monster_sound_property[15610] = {atk = 28, def = 1}
Monster_sound_property[15566] = {atk = 28, def = 1}
Monster_sound_property[15567] = {atk = 28, def = 1}
Monster_sound_property[15568] = {atk = 28, def = 1}
Monster_sound_property[15569] = {atk = 28, def = 1}
Monster_sound_property[15579] = {atk = 13, def = 1}
Monster_sound_property[15586] = {atk = 28, def = 1}
Monster_sound_property[15585] = {atk = 28, def = 1}
Monster_sound_property[15587] = {atk = 28, def = 1}
Monster_sound_property[19678] = {atk = 0, def = 0}
Monster_sound_property[19679] = {atk = 0, def = 0}
Monster_sound_property[19680] = {atk = 0, def = 0}
Monster_sound_property[19681] = {atk = 0, def = 0}
Monster_sound_property[19682] = {atk = 0, def = 0}
Monster_sound_property[19683] = {atk = 0, def = 0}
Monster_sound_property[19684] = {atk = 0, def = 0}
Monster_sound_property[19685] = {atk = 24, def = 0}
Monster_sound_property[15584] = {atk = 28, def = 1}
Monster_sound_property[15582] = {atk = 28, def = 1}
Monster_sound_property[19686] = {atk = 0, def = 0}
Monster_sound_property[20312] = {atk = 0, def = 0}
Monster_sound_property[15578] = {atk = 28, def = 1}
Monster_sound_property[15589] = {atk = 28, def = 1}
Monster_sound_property[15354] = {atk = 21, def = 9}
Monster_sound_property[15574] = {atk = 28, def = 1}
Monster_sound_property[15565] = {atk = 28, def = 1}
Monster_sound_property[15564] = {atk = 28, def = 1}
Monster_sound_property[15576] = {atk = 28, def = 1}
Monster_sound_property[15338] = {atk = 0, def = 1}
Monster_sound_property[15573] = {atk = 28, def = 1}
Monster_sound_property[15572] = {atk = 28, def = 1}
Monster_sound_property[15570] = {atk = 28, def = 1}
Monster_sound_property[15571] = {atk = 28, def = 1}
Monster_sound_property[15339] = {atk = 13, def = 7}
Monster_sound_property[15340] = {atk = 13, def = 7}
Monster_sound_property[15341] = {atk = 13, def = 7}
Monster_sound_property[15342] = {atk = 13, def = 7}
Monster_sound_property[15556] = {atk = 28, def = 1}
Monster_sound_property[15345] = {atk = 0, def = 1}
Monster_sound_property[19687] = {atk = 0, def = 0}
Monster_sound_property[19688] = {atk = 0, def = 0}
Monster_sound_property[20313] = {atk = 0, def = 0}
Monster_sound_property[15542] = {atk = 12, def = 7}
Monster_sound_property[15558] = {atk = 28, def = 1}
Monster_sound_property[15559] = {atk = 28, def = 1}
Monster_sound_property[15554] = {atk = 28, def = 1}
Monster_sound_property[15553] = {atk = 28, def = 1}
Monster_sound_property[15551] = {atk = 11, def = 10}
Monster_sound_property[15561] = {atk = 0, def = 1}
Monster_sound_property[15550] = {atk = 28, def = 1}
Monster_sound_property[18520] = {atk = 28, def = 1}
Monster_sound_property[15346] = {atk = 0, def = 1}
Monster_sound_property[15549] = {atk = 28, def = 1}
Monster_sound_property[15560] = {atk = 28, def = 1}
Monster_sound_property[15347] = {atk = 0, def = 1}
Monster_sound_property[15545] = {atk = 28, def = 1}
Monster_sound_property[15547] = {atk = 28, def = 1}
Monster_sound_property[15548] = {atk = 28, def = 1}
Monster_sound_property[15539] = {atk = 28, def = 1}
Monster_sound_property[15521] = {atk = 28, def = 1}
Monster_sound_property[16891] = {atk = 0, def = 1}
Monster_sound_property[15527] = {atk = 28, def = 1}
Monster_sound_property[15538] = {atk = 28, def = 1}
Monster_sound_property[15537] = {atk = 28, def = 1}
Monster_sound_property[15526] = {atk = 28, def = 1}
Monster_sound_property[15536] = {atk = 28, def = 1}
Monster_sound_property[15524] = {atk = 28, def = 1}
Monster_sound_property[15523] = {atk = 28, def = 1}
Monster_sound_property[15522] = {atk = 28, def = 1}
Monster_sound_property[15528] = {atk = 28, def = 1}
Monster_sound_property[15525] = {atk = 28, def = 1}
Monster_sound_property[15348] = {atk = 0, def = 1}
Monster_sound_property[17665] = {atk = 0, def = 0}
Monster_sound_property[15643] = {atk = 0, def = 1}
Monster_sound_property[15397] = {atk = 0, def = 1}
Monster_sound_property[15374] = {atk = 0, def = 1}
Monster_sound_property[15367] = {atk = 0, def = 1}
Monster_sound_property[15390] = {atk = 0, def = 1}
Monster_sound_property[15393] = {atk = 0, def = 1}
Monster_sound_property[15407] = {atk = 0, def = 1}
Monster_sound_property[15401] = {atk = 0, def = 1}
Monster_sound_property[15399] = {atk = 0, def = 1}
Monster_sound_property[15532] = {atk = 0, def = 1}
Monster_sound_property[15531] = {atk = 0, def = 1}
Monster_sound_property[15385] = {atk = 0, def = 1}
Monster_sound_property[15533] = {atk = 28, def = 1}
Monster_sound_property[15396] = {atk = 0, def = 1}
Monster_sound_property[15370] = {atk = 0, def = 1}
Monster_sound_property[15386] = {atk = 0, def = 1}
Monster_sound_property[15624] = {atk = 0, def = 1}
Monster_sound_property[15375] = {atk = 0, def = 1}
Monster_sound_property[15376] = {atk = 0, def = 1}
Monster_sound_property[15378] = {atk = 0, def = 1}
Monster_sound_property[15383] = {atk = 0, def = 1}
Monster_sound_property[15369] = {atk = 0, def = 1}
Monster_sound_property[15406] = {atk = 0, def = 1}
Monster_sound_property[15530] = {atk = 0, def = 1}
Monster_sound_property[15622] = {atk = 0, def = 1}
Monster_sound_property[15623] = {atk = 0, def = 1}
Monster_sound_property[15395] = {atk = 0, def = 1}
Monster_sound_property[15626] = {atk = 0, def = 1}
Monster_sound_property[15373] = {atk = 0, def = 1}
Monster_sound_property[15380] = {atk = 0, def = 1}
Monster_sound_property[15400] = {atk = 0, def = 1}
Monster_sound_property[15398] = {atk = 0, def = 1}
Monster_sound_property[15394] = {atk = 0, def = 1}
Monster_sound_property[15388] = {atk = 0, def = 1}
Monster_sound_property[15368] = {atk = 0, def = 1}
Monster_sound_property[15529] = {atk = 0, def = 1}
Monster_sound_property[15389] = {atk = 0, def = 1}
Monster_sound_property[15379] = {atk = 0, def = 1}
Monster_sound_property[15391] = {atk = 0, def = 1}
Monster_sound_property[15372] = {atk = 0, def = 1}
Monster_sound_property[15382] = {atk = 0, def = 1}
Monster_sound_property[15366] = {atk = 0, def = 1}
Monster_sound_property[15392] = {atk = 0, def = 1}
Monster_sound_property[15535] = {atk = 13, def = 1}
Monster_sound_property[15534] = {atk = 0, def = 1}
Monster_sound_property[15625] = {atk = 0, def = 1}
Monster_sound_property[15621] = {atk = 0, def = 1}
Monster_sound_property[15371] = {atk = 0, def = 1}
Monster_sound_property[15405] = {atk = 0, def = 1}
Monster_sound_property[15402] = {atk = 0, def = 1}
Monster_sound_property[15403] = {atk = 0, def = 1}
Monster_sound_property[15404] = {atk = 0, def = 1}
Monster_sound_property[15365] = {atk = 0, def = 1}
Monster_sound_property[15387] = {atk = 0, def = 1}
Monster_sound_property[15408] = {atk = 0, def = 1}
Monster_sound_property[15517] = {atk = 0, def = 1}
Monster_sound_property[15377] = {atk = 0, def = 1}
Monster_sound_property[15381] = {atk = 0, def = 1}
Monster_sound_property[15629] = {atk = 14, def = 1}
Monster_sound_property[15518] = {atk = 0, def = 1}
Monster_sound_property[15505] = {atk = 28, def = 1}
Monster_sound_property[15641] = {atk = 28, def = 1}
Monster_sound_property[15513] = {atk = 28, def = 1}
Monster_sound_property[15515] = {atk = 28, def = 1}
Monster_sound_property[15520] = {atk = 28, def = 1}
Monster_sound_property[15634] = {atk = 0, def = 1}
Monster_sound_property[15635] = {atk = 0, def = 1}
Monster_sound_property[15631] = {atk = 0, def = 1}
Monster_sound_property[15632] = {atk = 0, def = 1}
Monster_sound_property[15349] = {atk = 0, def = 1}
Monster_sound_property[15648] = {atk = 0, def = 0}
Monster_sound_property[15508] = {atk = 28, def = 1}
Monster_sound_property[15504] = {atk = 28, def = 1}
Monster_sound_property[17148] = {atk = 0, def = 1}
Monster_sound_property[15512] = {atk = 28, def = 1}
Monster_sound_property[15519] = {atk = 28, def = 1}
Monster_sound_property[15364] = {atk = 0, def = 1}
Monster_sound_property[15514] = {atk = 13, def = 0}
Monster_sound_property[15507] = {atk = 28, def = 1}
Monster_sound_property[15516] = {atk = 28, def = 1}
Monster_sound_property[15350] = {atk = 0, def = 1}
Monster_sound_property[15510] = {atk = 28, def = 1}
Monster_sound_property[15636] = {atk = 0, def = 1}
Monster_sound_property[15509] = {atk = 28, def = 1}
Monster_sound_property[15511] = {atk = 28, def = 1}
Monster_sound_property[15491] = {atk = 28, def = 1}
Monster_sound_property[15492] = {atk = 28, def = 1}
Monster_sound_property[15493] = {atk = 28, def = 1}
Monster_sound_property[15495] = {atk = 28, def = 1}
Monster_sound_property[15488] = {atk = 14, def = 1}
Monster_sound_property[15351] = {atk = 0, def = 1}
Monster_sound_property[15499] = {atk = 28, def = 1}
Monster_sound_property[15498] = {atk = 28, def = 1}
Monster_sound_property[15489] = {atk = 28, def = 1}
Monster_sound_property[15497] = {atk = 28, def = 1}
Monster_sound_property[15639] = {atk = 0, def = 1}
Monster_sound_property[15503] = {atk = 28, def = 1}
Monster_sound_property[15490] = {atk = 28, def = 1}
Monster_sound_property[16434] = {atk = 0, def = 0}
Monster_sound_property[15502] = {atk = 28, def = 1}
Monster_sound_property[15352] = {atk = 0, def = 1}
Monster_sound_property[15494] = {atk = 28, def = 1}
Monster_sound_property[15501] = {atk = 28, def = 1}
Monster_sound_property[15353] = {atk = 28, def = 1}
Monster_sound_property[15496] = {atk = 0, def = 1}
Monster_sound_property[15487] = {atk = 28, def = 1}
Monster_sound_property[16884] = {atk = 0, def = 1}
Monster_sound_property[15486] = {atk = 28, def = 1}
Monster_sound_property[15485] = {atk = 28, def = 1}
Monster_sound_property[15459] = {atk = 28, def = 1}
Monster_sound_property[15649] = {atk = 0, def = 0}
Monster_sound_property[15467] = {atk = 28, def = 1}
Monster_sound_property[15470] = {atk = 28, def = 1}
Monster_sound_property[15479] = {atk = 28, def = 1}
Monster_sound_property[15480] = {atk = 28, def = 1}
Monster_sound_property[15477] = {atk = 28, def = 1}
Monster_sound_property[15463] = {atk = 28, def = 1}
Monster_sound_property[15482] = {atk = 28, def = 1}
Monster_sound_property[15469] = {atk = 28, def = 1}
Monster_sound_property[15637] = {atk = 0, def = 1}
Monster_sound_property[15483] = {atk = 28, def = 1}
Monster_sound_property[15462] = {atk = 28, def = 1}
Monster_sound_property[15476] = {atk = 28, def = 1}
Monster_sound_property[15473] = {atk = 28, def = 1}
Monster_sound_property[15468] = {atk = 28, def = 1}
Monster_sound_property[15481] = {atk = 28, def = 1}
Monster_sound_property[15650] = {atk = 0, def = 0}
Monster_sound_property[15461] = {atk = 28, def = 1}
Monster_sound_property[15355] = {atk = 0, def = 1}
Monster_sound_property[15464] = {atk = 28, def = 1}
Monster_sound_property[15465] = {atk = 28, def = 1}
Monster_sound_property[15651] = {atk = 0, def = 0}
Monster_sound_property[15652] = {atk = 0, def = 0}
Monster_sound_property[15466] = {atk = 28, def = 1}
Monster_sound_property[15460] = {atk = 28, def = 1}
Monster_sound_property[15440] = {atk = 28, def = 1}
Monster_sound_property[15442] = {atk = 28, def = 1}
Monster_sound_property[15628] = {atk = 0, def = 1}
Monster_sound_property[15627] = {atk = 0, def = 1}
Monster_sound_property[15452] = {atk = 28, def = 1}
Monster_sound_property[15447] = {atk = 28, def = 1}
Monster_sound_property[15444] = {atk = 28, def = 1}
Monster_sound_property[15449] = {atk = 28, def = 1}
Monster_sound_property[15356] = {atk = 28, def = 1}
Monster_sound_property[15439] = {atk = 28, def = 1}
Monster_sound_property[15438] = {atk = 28, def = 1}
Monster_sound_property[16892] = {atk = 0, def = 1}
Monster_sound_property[16893] = {atk = 0, def = 1}
Monster_sound_property[15450] = {atk = 28, def = 1}
Monster_sound_property[15443] = {atk = 28, def = 1}
Monster_sound_property[16895] = {atk = 0, def = 1}
Monster_sound_property[15455] = {atk = 28, def = 1}
Monster_sound_property[16654] = {atk = 0, def = 1}
Monster_sound_property[15437] = {atk = 28, def = 1}
Monster_sound_property[15357] = {atk = 0, def = 1}
Monster_sound_property[15451] = {atk = 28, def = 1}
Monster_sound_property[15453] = {atk = 28, def = 1}
Monster_sound_property[15454] = {atk = 28, def = 1}
Monster_sound_property[15358] = {atk = 0, def = 1}
Monster_sound_property[15456] = {atk = 28, def = 1}
Monster_sound_property[15630] = {atk = 17, def = 1}
Monster_sound_property[15457] = {atk = 28, def = 1}
Monster_sound_property[15441] = {atk = 28, def = 1}
Monster_sound_property[15445] = {atk = 28, def = 1}
Monster_sound_property[15446] = {atk = 28, def = 1}
Monster_sound_property[15458] = {atk = 28, def = 1}
Monster_sound_property[15362] = {atk = 0, def = 1}
Monster_sound_property[15361] = {atk = 0, def = 1}
Monster_sound_property[15360] = {atk = 0, def = 1}
Monster_sound_property[15363] = {atk = 0, def = 1}
Monster_sound_property[15425] = {atk = 28, def = 1}
Monster_sound_property[15434] = {atk = 28, def = 1}
Monster_sound_property[15433] = {atk = 28, def = 1}
Monster_sound_property[15429] = {atk = 14, def = 1}
Monster_sound_property[15428] = {atk = 14, def = 1}
Monster_sound_property[15431] = {atk = 28, def = 1}
Monster_sound_property[15432] = {atk = 28, def = 1}
Monster_sound_property[15430] = {atk = 28, def = 1}
Monster_sound_property[15620] = {atk = 28, def = 1}
Monster_sound_property[15653] = {atk = 0, def = 0}
Monster_sound_property[15435] = {atk = 28, def = 1}
Monster_sound_property[15410] = {atk = 28, def = 1}
Monster_sound_property[15411] = {atk = 28, def = 1}
Monster_sound_property[15427] = {atk = 28, def = 1}
Monster_sound_property[15426] = {atk = 28, def = 1}
Monster_sound_property[15436] = {atk = 28, def = 1}
Monster_sound_property[15420] = {atk = 28, def = 1}
Monster_sound_property[15414] = {atk = 28, def = 11}
Monster_sound_property[15416] = {atk = 28, def = 11}
Monster_sound_property[15418] = {atk = 28, def = 11}
Monster_sound_property[15412] = {atk = 28, def = 11}
Monster_sound_property[15413] = {atk = 28, def = 11}
Monster_sound_property[15417] = {atk = 28, def = 11}
Monster_sound_property[15415] = {atk = 28, def = 11}
Monster_sound_property[15419] = {atk = 28, def = 11}
Monster_sound_property[15421] = {atk = 28, def = 1}
Monster_sound_property[15423] = {atk = 13, def = 0}
Monster_sound_property[15424] = {atk = 13, def = 0}
Monster_sound_property[15359] = {atk = 17, def = 10}
Monster_sound_property[17666] = {atk = 0, def = 0}
Monster_sound_property[18069] = {atk = 0, def = 0}
Monster_sound_property[18132] = {atk = 0, def = 0}
Monster_sound_property[18521] = {atk = 0, def = 0}
Monster_sound_property[12902] = {atk = 17, def = 10}
Monster_sound_property[12903] = {atk = 17, def = 10}
Monster_sound_property[12904] = {atk = 17, def = 10}
Monster_sound_property[12905] = {atk = 17, def = 10}
Monster_sound_property[12906] = {atk = 17, def = 10}
Monster_sound_property[12907] = {atk = 17, def = 10}
Monster_sound_property[12908] = {atk = 17, def = 10}
Monster_sound_property[12909] = {atk = 21, def = 9}
Monster_sound_property[12910] = {atk = 17, def = 10}
Monster_sound_property[14453] = {atk = 0, def = 1}
Monster_sound_property[12105] = {atk = 0, def = 0}
Monster_sound_property[16206] = {atk = 0, def = 0}
Monster_sound_property[12911] = {atk = 0, def = 0}
Monster_sound_property[14236] = {atk = 27, def = 0}
Monster_sound_property[16806] = {atk = 24, def = 0}
Monster_sound_property[14390] = {atk = 0, def = 1}
Monster_sound_property[15074] = {atk = 0, def = 1}
Monster_sound_property[13447] = {atk = 0, def = 1}
Monster_sound_property[14529] = {atk = 0, def = 1}
Monster_sound_property[14530] = {atk = 0, def = 1}
Monster_sound_property[14229] = {atk = 28, def = 0}
Monster_sound_property[13347] = {atk = 27, def = 0}
Monster_sound_property[13432] = {atk = 0, def = 1}
Monster_sound_property[17232] = {atk = 0, def = 0}
Monster_sound_property[17235] = {atk = 0, def = 0}
Monster_sound_property[4639] = {atk = 0, def = 0}
Monster_sound_property[4640] = {atk = 0, def = 0}
Monster_sound_property[10861] = {atk = 0, def = 0}
Monster_sound_property[11426] = {atk = 0, def = 0}
Monster_sound_property[3658] = {atk = 0, def = 0}
Monster_sound_property[13075] = {atk = 27, def = 0}
Monster_sound_property[14531] = {atk = 0, def = 1}
Monster_sound_property[11190] = {atk = 0, def = 0}
Monster_sound_property[13076] = {atk = 0, def = 1}
Monster_sound_property[3678] = {atk = 0, def = 0}
Monster_sound_property[14532] = {atk = 0, def = 1}
Monster_sound_property[4641] = {atk = 0, def = 0}
Monster_sound_property[4638] = {atk = 0, def = 0}
Monster_sound_property[11730] = {atk = 0, def = 0}
Monster_sound_property[10914] = {atk = 0, def = 0}
Monster_sound_property[10921] = {atk = 0, def = 0}
Monster_sound_property[10915] = {atk = 0, def = 0}
Monster_sound_property[13428] = {atk = 0, def = 1}
Monster_sound_property[11420] = {atk = 0, def = 0}
Monster_sound_property[18070] = {atk = 0, def = 0}
Monster_sound_property[18141] = {atk = 0, def = 0}
Monster_sound_property[18522] = {atk = 0, def = 0}
Monster_sound_property[18523] = {atk = 0, def = 0}
Monster_sound_property[19763] = {atk = 0, def = 0}
Monster_sound_property[19764] = {atk = 0, def = 0}
Monster_sound_property[19880] = {atk = 0, def = 0}
Monster_sound_property[20058] = {atk = 0, def = 0}
Monster_sound_property[20059] = {atk = 0, def = 0}
Monster_sound_property[20060] = {atk = 0, def = 0}
Monster_sound_property[20061] = {atk = 0, def = 0}
Monster_sound_property[20069] = {atk = 0, def = 0}
Monster_sound_property[20868] = {atk = 0, def = 0}
Monster_sound_property[20869] = {atk = 0, def = 0}
Monster_sound_property[20870] = {atk = 0, def = 0}
Monster_sound_property[20871] = {atk = 0, def = 0}
Monster_sound_property[20872] = {atk = 0, def = 0}
Monster_sound_property[20873] = {atk = 0, def = 0}
Monster_sound_property[20874] = {atk = 0, def = 0}
Monster_sound_property[20875] = {atk = 0, def = 0}
Monster_sound_property[20876] = {atk = 0, def = 0}
Monster_sound_property[20877] = {atk = 0, def = 0}
Monster_sound_property[20878] = {atk = 21, def = 9}
Monster_sound_property[20879] = {atk = 0, def = 0}
Monster_sound_property[20880] = {atk = 0, def = 0}
Monster_sound_property[7985] = {atk = 16, def = 10}
Monster_sound_property[7986] = {atk = 16, def = 10}
Monster_sound_property[12654] = {atk = 21, def = 9}
Monster_sound_property[12951] = {atk = 21, def = 9}
Monster_sound_property[12952] = {atk = 17, def = 10}
Monster_sound_property[12953] = {atk = 21, def = 9}
Monster_sound_property[12655] = {atk = 21, def = 9}
Monster_sound_property[12954] = {atk = 17, def = 10}
Monster_sound_property[12656] = {atk = 21, def = 9}
Monster_sound_property[12955] = {atk = 21, def = 9}
Monster_sound_property[14369] = {atk = 0, def = 10}
Monster_sound_property[12956] = {atk = 27, def = 0}
Monster_sound_property[12957] = {atk = 27, def = 0}
Monster_sound_property[14052] = {atk = 0, def = 0}
Monster_sound_property[11902] = {atk = 17, def = 10}
Monster_sound_property[17149] = {atk = 0, def = 9}
Monster_sound_property[12933] = {atk = 13, def = 7}
Monster_sound_property[13337] = {atk = 0, def = 7}
Monster_sound_property[12934] = {atk = 13, def = 7}
Monster_sound_property[12935] = {atk = 13, def = 7}
Monster_sound_property[13338] = {atk = 0, def = 7}
Monster_sound_property[18071] = {atk = 12, def = 7}
Monster_sound_property[13547] = {atk = 0, def = 0}
Monster_sound_property[12657] = {atk = 13, def = 7}
Monster_sound_property[25097] = {atk = 0, def = 0}
Monster_sound_property[14684] = {atk = 0, def = 1}
Monster_sound_property[14706] = {atk = 0, def = 1}
Monster_sound_property[14685] = {atk = 0, def = 1}
Monster_sound_property[8199] = {atk = 17, def = 10}
Monster_sound_property[14707] = {atk = 0, def = 1}
Monster_sound_property[14291] = {atk = 0, def = 0}
Monster_sound_property[13448] = {atk = 0, def = 0}
Monster_sound_property[14370] = {atk = 0, def = 10}
Monster_sound_property[12658] = {atk = 21, def = 9}
Monster_sound_property[12659] = {atk = 21, def = 9}
Monster_sound_property[12780] = {atk = 21, def = 9}
Monster_sound_property[14050] = {atk = 0, def = 7}
Monster_sound_property[7990] = {atk = 17, def = 10}
Monster_sound_property[16435] = {atk = 17, def = 10}
Monster_sound_property[3623] = {atk = 17, def = 10}
Monster_sound_property[12660] = {atk = 17, def = 10}
Monster_sound_property[10119] = {atk = 13, def = 7}
Monster_sound_property[10123] = {atk = 20, def = 9}
Monster_sound_property[16649] = {atk = 0, def = 7}
Monster_sound_property[16650] = {atk = 0, def = 7}
Monster_sound_property[16651] = {atk = 0, def = 7}
Monster_sound_property[16652] = {atk = 0, def = 7}
Monster_sound_property[16647] = {atk = 0, def = 7}
Monster_sound_property[19741] = {atk = 29, def = 9}
Monster_sound_property[10130] = {atk = 21, def = 9}
Monster_sound_property[10129] = {atk = 17, def = 10}
Monster_sound_property[10128] = {atk = 17, def = 10}
Monster_sound_property[10118] = {atk = 13, def = 7}
Monster_sound_property[10124] = {atk = 21, def = 9}
Monster_sound_property[10125] = {atk = 21, def = 9}
Monster_sound_property[10126] = {atk = 21, def = 9}
Monster_sound_property[10127] = {atk = 21, def = 9}
Monster_sound_property[16190] = {atk = 0, def = 7}
Monster_sound_property[16191] = {atk = 0, def = 7}
Monster_sound_property[16189] = {atk = 14, def = 7}
Monster_sound_property[12958] = {atk = 25, def = 0}
Monster_sound_property[10121] = {atk = 0, def = 0}
Monster_sound_property[14575] = {atk = 0, def = 1}
Monster_sound_property[13449] = {atk = 0, def = 0}
Monster_sound_property[17488] = {atk = 0, def = 9}
Monster_sound_property[17487] = {atk = 0, def = 9}
Monster_sound_property[3622] = {atk = 21, def = 9}
Monster_sound_property[13548] = {atk = 0, def = 7}
Monster_sound_property[7994] = {atk = 17, def = 10}
Monster_sound_property[12661] = {atk = 21, def = 9}
Monster_sound_property[12959] = {atk = 21, def = 9}
Monster_sound_property[12960] = {atk = 17, def = 10}
Monster_sound_property[12961] = {atk = 17, def = 10}
Monster_sound_property[12962] = {atk = 17, def = 10}
Monster_sound_property[12963] = {atk = 17, def = 10}
Monster_sound_property[12964] = {atk = 17, def = 10}
Monster_sound_property[12781] = {atk = 17, def = 10}
Monster_sound_property[12782] = {atk = 17, def = 10}
Monster_sound_property[12662] = {atk = 21, def = 9}
Monster_sound_property[7992] = {atk = 21, def = 9}
Monster_sound_property[13549] = {atk = 26, def = 0}
Monster_sound_property[14237] = {atk = 27, def = 0}
Monster_sound_property[16188] = {atk = 0, def = 0}
Monster_sound_property[14485] = {atk = 27, def = 0}
Monster_sound_property[14454] = {atk = 0, def = 9}
Monster_sound_property[14376] = {atk = 0, def = 9}
Monster_sound_property[14455] = {atk = 0, def = 9}
Monster_sound_property[14377] = {atk = 0, def = 9}
Monster_sound_property[14473] = {atk = 0, def = 9}
Monster_sound_property[12965] = {atk = 28, def = 0}
Monster_sound_property[7989] = {atk = 21, def = 9}
Monster_sound_property[11734] = {atk = 21, def = 9}
Monster_sound_property[11735] = {atk = 21, def = 9}
Monster_sound_property[8197] = {atk = 21, def = 9}
Monster_sound_property[16648] = {atk = 0, def = 7}
Monster_sound_property[3669] = {atk = 0, def = 0}
Monster_sound_property[8163] = {atk = 17, def = 10}
Monster_sound_property[8198] = {atk = 17, def = 10}
Monster_sound_property[10117] = {atk = 17, def = 10}
Monster_sound_property[8164] = {atk = 17, def = 10}
Monster_sound_property[13550] = {atk = 0, def = 7}
Monster_sound_property[4875] = {atk = 21, def = 9}
Monster_sound_property[4876] = {atk = 21, def = 9}
Monster_sound_property[4877] = {atk = 21, def = 9}
Monster_sound_property[4878] = {atk = 21, def = 9}
Monster_sound_property[10122] = {atk = 13, def = 7}
Monster_sound_property[3666] = {atk = 17, def = 10}
Monster_sound_property[4874] = {atk = 17, def = 10}
Monster_sound_property[7995] = {atk = 17, def = 10}
Monster_sound_property[7996] = {atk = 17, def = 10}
Monster_sound_property[7997] = {atk = 17, def = 10}
Monster_sound_property[7998] = {atk = 17, def = 10}
Monster_sound_property[12663] = {atk = 13, def = 7}
Monster_sound_property[11736] = {atk = 21, def = 9}
Monster_sound_property[19620] = {atk = 0, def = 9}
Monster_sound_property[19621] = {atk = 12, def = 7}
Monster_sound_property[12783] = {atk = 13, def = 7}
Monster_sound_property[12784] = {atk = 13, def = 7}
Monster_sound_property[12785] = {atk = 13, def = 7}
Monster_sound_property[12786] = {atk = 13, def = 7}
Monster_sound_property[12787] = {atk = 13, def = 7}
Monster_sound_property[12788] = {atk = 13, def = 7}
Monster_sound_property[12789] = {atk = 28, def = 1}
Monster_sound_property[12790] = {atk = 28, def = 1}
Monster_sound_property[12791] = {atk = 28, def = 1}
Monster_sound_property[12792] = {atk = 28, def = 1}
Monster_sound_property[12793] = {atk = 28, def = 1}
Monster_sound_property[12794] = {atk = 28, def = 1}
Monster_sound_property[12795] = {atk = 13, def = 7}
Monster_sound_property[12796] = {atk = 13, def = 7}
Monster_sound_property[12797] = {atk = 13, def = 7}
Monster_sound_property[12798] = {atk = 13, def = 7}
Monster_sound_property[19937] = {atk = 0, def = 0}
Monster_sound_property[12966] = {atk = 17, def = 10}
Monster_sound_property[12799] = {atk = 13, def = 7}
Monster_sound_property[12800] = {atk = 13, def = 7}
Monster_sound_property[12801] = {atk = 13, def = 7}
Monster_sound_property[12802] = {atk = 13, def = 7}
Monster_sound_property[10120] = {atk = 28, def = 1}
Monster_sound_property[14051] = {atk = 0, def = 9}
Monster_sound_property[18072] = {atk = 0, def = 7}
Monster_sound_property[18073] = {atk = 0, def = 7}
Monster_sound_property[20633] = {atk = 0, def = 7}
Monster_sound_property[18074] = {atk = 0, def = 7}
Monster_sound_property[19742] = {atk = 0, def = 7}
Monster_sound_property[19752] = {atk = 29, def = 9}
Monster_sound_property[19775] = {atk = 0, def = 0}
Monster_sound_property[19855] = {atk = 0, def = 0}
Monster_sound_property[19856] = {atk = 0, def = 0}
Monster_sound_property[19857] = {atk = 0, def = 0}
Monster_sound_property[19858] = {atk = 0, def = 0}
Monster_sound_property[19879] = {atk = 0, def = 0}
Monster_sound_property[20634] = {atk = 0, def = 0}
Monster_sound_property[20635] = {atk = 0, def = 0}
Monster_sound_property[20636] = {atk = 0, def = 0}
Monster_sound_property[20637] = {atk = 0, def = 0}
Monster_sound_property[20638] = {atk = 0, def = 0}
Monster_sound_property[20639] = {atk = 0, def = 0}
Monster_sound_property[20640] = {atk = 0, def = 0}
Monster_sound_property[20645] = {atk = 0, def = 0}
Monster_sound_property[20742] = {atk = 0, def = 9}
Monster_sound_property[20743] = {atk = 0, def = 9}
Monster_sound_property[20744] = {atk = 0, def = 9}
Monster_sound_property[20794] = {atk = 0, def = 9}
Monster_sound_property[20795] = {atk = 0, def = 9}
Monster_sound_property[20796] = {atk = 0, def = 9}
Monster_sound_property[20797] = {atk = 0, def = 9}
Monster_sound_property[20798] = {atk = 0, def = 9}
Monster_sound_property[12803] = {atk = 21, def = 9}
Monster_sound_property[12804] = {atk = 21, def = 9}
Monster_sound_property[12805] = {atk = 21, def = 9}
Monster_sound_property[12806] = {atk = 17, def = 10}
Monster_sound_property[12807] = {atk = 21, def = 9}
Monster_sound_property[12808] = {atk = 17, def = 10}
Monster_sound_property[12809] = {atk = 17, def = 10}
Monster_sound_property[12810] = {atk = 17, def = 10}
Monster_sound_property[12811] = {atk = 17, def = 10}
Monster_sound_property[12812] = {atk = 17, def = 10}
Monster_sound_property[12813] = {atk = 17, def = 10}
Monster_sound_property[12814] = {atk = 21, def = 9}
Monster_sound_property[12815] = {atk = 17, def = 10}
Monster_sound_property[12816] = {atk = 21, def = 9}
Monster_sound_property[12817] = {atk = 17, def = 10}
Monster_sound_property[15703] = {atk = 14, def = 2}
Monster_sound_property[15708] = {atk = 14, def = 1}
Monster_sound_property[15707] = {atk = 14, def = 1}
Monster_sound_property[15700] = {atk = 14, def = 1}
Monster_sound_property[15682] = {atk = 14, def = 1}
Monster_sound_property[15684] = {atk = 26, def = 4}
Monster_sound_property[20762] = {atk = 28, def = 1}
Monster_sound_property[15712] = {atk = 13, def = 2}
Monster_sound_property[15711] = {atk = 13, def = 2}
Monster_sound_property[15696] = {atk = 14, def = 1}
Monster_sound_property[16157] = {atk = 28, def = 0}
Monster_sound_property[16158] = {atk = 28, def = 0}
Monster_sound_property[20223] = {atk = 28, def = 1}
Monster_sound_property[16159] = {atk = 28, def = 0}
Monster_sound_property[20763] = {atk = 28, def = 1}
Monster_sound_property[16160] = {atk = 25, def = 0}
Monster_sound_property[20224] = {atk = 28, def = 1}
Monster_sound_property[16161] = {atk = 25, def = 0}
Monster_sound_property[20225] = {atk = 28, def = 1}
Monster_sound_property[16162] = {atk = 13, def = 0}
Monster_sound_property[20226] = {atk = 28, def = 9}
Monster_sound_property[16163] = {atk = 25, def = 0}
Monster_sound_property[20227] = {atk = 28, def = 1}
Monster_sound_property[15698] = {atk = 18, def = 10}
Monster_sound_property[15702] = {atk = 13, def = 1}
Monster_sound_property[15685] = {atk = 13, def = 2}
Monster_sound_property[15694] = {atk = 14, def = 0}
Monster_sound_property[15704] = {atk = 14, def = 1}
Monster_sound_property[15811] = {atk = 12, def = 1}
Monster_sound_property[15714] = {atk = 12, def = 2}
Monster_sound_property[15713] = {atk = 12, def = 2}
Monster_sound_property[15706] = {atk = 14, def = 1}
Monster_sound_property[15705] = {atk = 14, def = 1}
Monster_sound_property[15686] = {atk = 14, def = 1}
Monster_sound_property[15688] = {atk = 25, def = 5}
Monster_sound_property[20764] = {atk = 28, def = 1}
Monster_sound_property[15687] = {atk = 25, def = 5}
Monster_sound_property[20765] = {atk = 28, def = 1}
Monster_sound_property[17467] = {atk = 12, def = 1}
Monster_sound_property[16645] = {atk = 12, def = 1}
Monster_sound_property[15689] = {atk = 14, def = 0}
Monster_sound_property[15695] = {atk = 14, def = 2}
Monster_sound_property[15701] = {atk = 14, def = 1}
Monster_sound_property[15690] = {atk = 26, def = 4}
Monster_sound_property[15691] = {atk = 21, def = 9}
Monster_sound_property[15697] = {atk = 28, def = 0}
Monster_sound_property[15693] = {atk = 14, def = 1}
Monster_sound_property[15692] = {atk = 26, def = 4}
Monster_sound_property[15710] = {atk = 14, def = 7}
Monster_sound_property[15709] = {atk = 14, def = 7}
Monster_sound_property[17468] = {atk = 12, def = 1}
Monster_sound_property[16646] = {atk = 12, def = 1}
Monster_sound_property[20242] = {atk = 28, def = 9}
Monster_sound_property[15681] = {atk = 14, def = 1}
Monster_sound_property[16805] = {atk = 14, def = 1}
Monster_sound_property[15680] = {atk = 31, def = 1}
Monster_sound_property[11669] = {atk = 14, def = 2}
Monster_sound_property[1043] = {atk = 27, def = 1}
Monster_sound_property[1035] = {atk = 14, def = 1}
Monster_sound_property[1032] = {atk = 14, def = 1}
Monster_sound_property[1024] = {atk = 14, def = 1}
Monster_sound_property[14713] = {atk = 28, def = 1}
Monster_sound_property[1066] = {atk = 12, def = 1}
Monster_sound_property[1064] = {atk = 17, def = 2}
Monster_sound_property[1065] = {atk = 14, def = 2}
Monster_sound_property[1063] = {atk = 12, def = 1}
Monster_sound_property[1033] = {atk = 14, def = 1}
Monster_sound_property[1030] = {atk = 14, def = 1}
Monster_sound_property[8674] = {atk = 25, def = 2}
Monster_sound_property[1048] = {atk = 14, def = 1}
Monster_sound_property[11737] = {atk = 28, def = 0}
Monster_sound_property[11893] = {atk = 28, def = 0}
Monster_sound_property[11741] = {atk = 28, def = 0}
Monster_sound_property[11894] = {atk = 28, def = 0}
Monster_sound_property[11738] = {atk = 28, def = 0}
Monster_sound_property[11895] = {atk = 28, def = 0}
Monster_sound_property[11739] = {atk = 28, def = 0}
Monster_sound_property[11896] = {atk = 28, def = 0}
Monster_sound_property[9364] = {atk = 12, def = 0}
Monster_sound_property[11740] = {atk = 25, def = 0}
Monster_sound_property[11897] = {atk = 25, def = 0}
Monster_sound_property[14714] = {atk = 14, def = 1}
Monster_sound_property[7826] = {atk = 14, def = 1}
Monster_sound_property[7827] = {atk = 12, def = 1}
Monster_sound_property[1051] = {atk = 14, def = 1}
Monster_sound_property[1038] = {atk = 14, def = 1}
Monster_sound_property[12106] = {atk = 14, def = 2}
Monster_sound_property[18048] = {atk = 14, def = 1}
Monster_sound_property[9353] = {atk = 21, def = 1}
Monster_sound_property[1054] = {atk = 14, def = 1}
Monster_sound_property[9355] = {atk = 14, def = 0}
Monster_sound_property[1083] = {atk = 25, def = 0}
Monster_sound_property[14984] = {atk = 13, def = 1}
Monster_sound_property[8672] = {atk = 12, def = 1}
Monster_sound_property[13191] = {atk = 14, def = 1}
Monster_sound_property[14516] = {atk = 28, def = 1}
Monster_sound_property[10883] = {atk = 12, def = 1}
Monster_sound_property[10734] = {atk = 14, def = 1}
Monster_sound_property[10834] = {atk = 14, def = 1}
Monster_sound_property[20102] = {atk = 14, def = 1}
Monster_sound_property[11657] = {atk = 28, def = 0}
Monster_sound_property[11668] = {atk = 16, def = 0}
Monster_sound_property[11670] = {atk = 12, def = 0}
Monster_sound_property[1073] = {atk = 14, def = 1}
Monster_sound_property[14715] = {atk = 0, def = 1}
Monster_sound_property[18129] = {atk = 28, def = 1}
Monster_sound_property[10732] = {atk = 14, def = 0}
Monster_sound_property[13942] = {atk = 14, def = 1}
Monster_sound_property[7948] = {atk = 14, def = 2}
Monster_sound_property[1078] = {atk = 21, def = 0}
Monster_sound_property[20766] = {atk = 13, def = 1}
Monster_sound_property[14716] = {atk = 14, def = 1}
Monster_sound_property[14717] = {atk = 17, def = 1}
Monster_sound_property[14718] = {atk = 14, def = 1}
Monster_sound_property[16203] = {atk = 17, def = 1}
Monster_sound_property[3607] = {atk = 17, def = 1}
Monster_sound_property[1061] = {atk = 12, def = 1}
Monster_sound_property[1060] = {atk = 12, def = 1}
Monster_sound_property[1059] = {atk = 14, def = 1}
Monster_sound_property[8546] = {atk = 14, def = 1}
Monster_sound_property[7944] = {atk = 14, def = 1}
Monster_sound_property[17231] = {atk = 14, def = 1}
Monster_sound_property[19863] = {atk = 14, def = 1}
Monster_sound_property[9544] = {atk = 12, def = 1}
Monster_sound_property[14719] = {atk = 14, def = 1}
Monster_sound_property[14720] = {atk = 14, def = 1}
Monster_sound_property[14721] = {atk = 14, def = 1}
Monster_sound_property[14722] = {atk = 17, def = 1}
Monster_sound_property[14723] = {atk = 12, def = 1}
Monster_sound_property[1039] = {atk = 14, def = 1}
Monster_sound_property[16876] = {atk = 14, def = 1}
Monster_sound_property[15679] = {atk = 14, def = 1}
Monster_sound_property[17059] = {atk = 14, def = 1}
Monster_sound_property[14724] = {atk = 12, def = 1}
Monster_sound_property[14725] = {atk = 13, def = 1}
Monster_sound_property[20076] = {atk = 13, def = 1}
Monster_sound_property[1037] = {atk = 14, def = 1}
Monster_sound_property[1028] = {atk = 14, def = 1}
Monster_sound_property[13192] = {atk = 14, def = 1}
Monster_sound_property[10872] = {atk = 17, def = 1}
Monster_sound_property[14726] = {atk = 17, def = 1}
Monster_sound_property[14517] = {atk = 30, def = 1}
Monster_sound_property[17140] = {atk = 30, def = 1}
Monster_sound_property[14518] = {atk = 14, def = 1}
Monster_sound_property[17689] = {atk = 14, def = 1}
Monster_sound_property[18517] = {atk = 30, def = 1}
Monster_sound_property[14519] = {atk = 14, def = 1}
Monster_sound_property[17691] = {atk = 14, def = 1}
Monster_sound_property[14985] = {atk = 14, def = 1}
Monster_sound_property[17692] = {atk = 14, def = 1}
Monster_sound_property[13193] = {atk = 14, def = 1}
Monster_sound_property[16875] = {atk = 14, def = 1}
Monster_sound_property[7947] = {atk = 14, def = 1}
Monster_sound_property[12894] = {atk = 27, def = 4}
Monster_sound_property[1082] = {atk = 14, def = 1}
Monster_sound_property[8545] = {atk = 14, def = 1}
Monster_sound_property[1031] = {atk = 31, def = 1}
Monster_sound_property[7942] = {atk = 20, def = 1}
Monster_sound_property[1076] = {atk = 21, def = 1}
Monster_sound_property[1012] = {atk = 13, def = 1}
Monster_sound_property[7817] = {atk = 14, def = 0}
Monster_sound_property[1075] = {atk = 14, def = 0}
Monster_sound_property[1011] = {atk = 14, def = 1}
Monster_sound_property[14727] = {atk = 14, def = 1}
Monster_sound_property[12356] = {atk = 14, def = 1}
Monster_sound_property[12641] = {atk = 17, def = 1}
Monster_sound_property[12107] = {atk = 17, def = 1}
Monster_sound_property[4858] = {atk = 14, def = 1}
Monster_sound_property[13194] = {atk = 13, def = 1}
Monster_sound_property[13195] = {atk = 12, def = 1}
Monster_sound_property[1015] = {atk = 12, def = 0}
Monster_sound_property[14520] = {atk = 27, def = 1}
Monster_sound_property[18049] = {atk = 28, def = 1}
Monster_sound_property[1047] = {atk = 14, def = 1}
Monster_sound_property[18518] = {atk = 14, def = 1}
Monster_sound_property[5064] = {atk = 14, def = 1}
Monster_sound_property[10730] = {atk = 12, def = 1}
Monster_sound_property[5065] = {atk = 30, def = 0}
Monster_sound_property[5063] = {atk = 12, def = 1}
Monster_sound_property[19940] = {atk = 14, def = 1}
Monster_sound_property[20114] = {atk = 14, def = 1}
Monster_sound_property[20103] = {atk = 14, def = 1}
Monster_sound_property[14728] = {atk = 14, def = 1}
Monster_sound_property[14729] = {atk = 14, def = 1}
Monster_sound_property[7945] = {atk = 14, def = 1}
Monster_sound_property[14730] = {atk = 14, def = 1}
Monster_sound_property[8673] = {atk = 14, def = 0}
Monster_sound_property[9354] = {atk = 12, def = 1}
Monster_sound_property[14731] = {atk = 12, def = 1}
Monster_sound_property[14732] = {atk = 12, def = 1}
Monster_sound_property[12357] = {atk = 14, def = 1}
Monster_sound_property[12642] = {atk = 12, def = 0}
Monster_sound_property[1027] = {atk = 14, def = 1}
Monster_sound_property[13196] = {atk = 14, def = 1}
Monster_sound_property[1019] = {atk = 14, def = 1}
Monster_sound_property[9656] = {atk = 17, def = 0}
Monster_sound_property[16204] = {atk = 12, def = 1}
Monster_sound_property[1020] = {atk = 12, def = 2}
Monster_sound_property[1056] = {atk = 12, def = 1}
Monster_sound_property[7943] = {atk = 13, def = 1}
Monster_sound_property[14733] = {atk = 14, def = 1}
Monster_sound_property[14734] = {atk = 17, def = 1}
Monster_sound_property[8162] = {atk = 17, def = 1}
Monster_sound_property[14735] = {atk = 14, def = 1}
Monster_sound_property[1077] = {atk = 28, def = 0}
Monster_sound_property[14797] = {atk = 28, def = 1}
Monster_sound_property[16205] = {atk = 13, def = 1}
Monster_sound_property[11673] = {atk = 14, def = 7}
Monster_sound_property[9652] = {atk = 17, def = 1}
Monster_sound_property[12108] = {atk = 14, def = 1}
Monster_sound_property[14986] = {atk = 14, def = 1}
Monster_sound_property[17693] = {atk = 14, def = 1}
Monster_sound_property[14987] = {atk = 14, def = 1}
Monster_sound_property[17694] = {atk = 14, def = 1}
Monster_sound_property[7816] = {atk = 14, def = 1}
Monster_sound_property[7825] = {atk = 14, def = 1}
Monster_sound_property[14521] = {atk = 17, def = 1}
Monster_sound_property[14736] = {atk = 12, def = 1}
Monster_sound_property[16430] = {atk = 14, def = 1}
Monster_sound_property[18050] = {atk = 14, def = 1}
Monster_sound_property[1084] = {atk = 14, def = 2}
Monster_sound_property[6628] = {atk = 13, def = 1}
Monster_sound_property[6626] = {atk = 26, def = 1}
Monster_sound_property[7112] = {atk = 14, def = 1}
Monster_sound_property[16432] = {atk = 14, def = 1}
Monster_sound_property[18130] = {atk = 14, def = 1}
Monster_sound_property[14737] = {atk = 14, def = 1}
Monster_sound_property[4589] = {atk = 14, def = 1}
Monster_sound_property[14522] = {atk = 24, def = 1}
Monster_sound_property[14523] = {atk = 12, def = 1}
Monster_sound_property[14524] = {atk = 13, def = 1}
Monster_sound_property[14738] = {atk = 21, def = 1}
Monster_sound_property[14739] = {atk = 14, def = 1}
Monster_sound_property[7815] = {atk = 12, def = 1}
Monster_sound_property[11745] = {atk = 17, def = 10}
Monster_sound_property[14740] = {atk = 12, def = 1}
Monster_sound_property[17690] = {atk = 14, def = 1}
Monster_sound_property[10885] = {atk = 24, def = 0}
Monster_sound_property[7812] = {atk = 12, def = 1}
Monster_sound_property[13943] = {atk = 14, def = 1}
Monster_sound_property[16804] = {atk = 14, def = 1}
Monster_sound_property[9653] = {atk = 14, def = 1}
Monster_sound_property[14741] = {atk = 14, def = 1}
Monster_sound_property[10873] = {atk = 28, def = 0}
Monster_sound_property[10875] = {atk = 16, def = 0}
Monster_sound_property[10876] = {atk = 12, def = 0}
Monster_sound_property[11742] = {atk = 12, def = 7}
Monster_sound_property[10886] = {atk = 28, def = 4}
Monster_sound_property[10887] = {atk = 28, def = 1}
Monster_sound_property[10888] = {atk = 13, def = 2}
Monster_sound_property[11664] = {atk = 13, def = 12}
Monster_sound_property[11743] = {atk = 21, def = 9}
Monster_sound_property[11663] = {atk = 26, def = 1}
Monster_sound_property[14743] = {atk = 13, def = 1}
Monster_sound_property[18051] = {atk = 13, def = 1}
Monster_sound_property[6589] = {atk = 26, def = 0}
Monster_sound_property[13306] = {atk = 24, def = 0}
Monster_sound_property[9658] = {atk = 26, def = 1}
Monster_sound_property[9363] = {atk = 14, def = 0}
Monster_sound_property[12110] = {atk = 30, def = 2}
Monster_sound_property[12360] = {atk = 12, def = 0}
Monster_sound_property[1016] = {atk = 14, def = 1}
Monster_sound_property[1055] = {atk = 12, def = 1}
Monster_sound_property[14744] = {atk = 14, def = 1}
Monster_sound_property[14745] = {atk = 12, def = 1}
Monster_sound_property[9361] = {atk = 14, def = 0}
Monster_sound_property[14746] = {atk = 14, def = 1}
Monster_sound_property[9362] = {atk = 14, def = 0}
Monster_sound_property[7122] = {atk = 14, def = 1}
Monster_sound_property[14747] = {atk = 13, def = 1}
Monster_sound_property[14748] = {atk = 17, def = 1}
Monster_sound_property[14749] = {atk = 13, def = 1}
Monster_sound_property[14750] = {atk = 13, def = 1}
Monster_sound_property[14751] = {atk = 28, def = 1}
Monster_sound_property[13197] = {atk = 14, def = 1}
Monster_sound_property[1057] = {atk = 17, def = 1}
Monster_sound_property[14752] = {atk = 14, def = 1}
Monster_sound_property[14753] = {atk = 12, def = 1}
Monster_sound_property[12644] = {atk = 14, def = 1}
Monster_sound_property[18052] = {atk = 14, def = 1}
Monster_sound_property[17695] = {atk = 14, def = 1}
Monster_sound_property[1025] = {atk = 17, def = 2}
Monster_sound_property[1042] = {atk = 12, def = 1}
Monster_sound_property[1044] = {atk = 14, def = 1}
Monster_sound_property[13944] = {atk = 14, def = 1}
Monster_sound_property[1072] = {atk = 14, def = 2}
Monster_sound_property[1021] = {atk = 14, def = 2}
Monster_sound_property[1014] = {atk = 14, def = 1}
Monster_sound_property[8547] = {atk = 13, def = 0}
Monster_sound_property[14754] = {atk = 14, def = 1}
Monster_sound_property[18053] = {atk = 14, def = 1}
Monster_sound_property[16431] = {atk = 17, def = 1}
Monster_sound_property[14755] = {atk = 14, def = 1}
Monster_sound_property[7959] = {atk = 19, def = 1}
Monster_sound_property[14756] = {atk = 14, def = 1}
Monster_sound_property[18131] = {atk = 14, def = 1}
Monster_sound_property[9352] = {atk = 14, def = 1}
Monster_sound_property[1010] = {atk = 19, def = 1}
Monster_sound_property[3664] = {atk = 12, def = 1}
Monster_sound_property[14757] = {atk = 13, def = 1}
Monster_sound_property[14758] = {atk = 28, def = 1}
Monster_sound_property[1036] = {atk = 14, def = 1}
Monster_sound_property[10884] = {atk = 12, def = 2}
Monster_sound_property[14800] = {atk = 30, def = 1}
Monster_sound_property[4857] = {atk = 14, def = 1}
Monster_sound_property[14760] = {atk = 31, def = 1}
Monster_sound_property[18054] = {atk = 31, def = 1}
Monster_sound_property[14761] = {atk = 12, def = 1}
Monster_sound_property[8671] = {atk = 14, def = 1}
Monster_sound_property[18055] = {atk = 13, def = 1}
Monster_sound_property[1070] = {atk = 30, def = 2}
Monster_sound_property[16877] = {atk = 12, def = 1}
Monster_sound_property[14762] = {atk = 16, def = 1}
Monster_sound_property[7946] = {atk = 28, def = 0}
Monster_sound_property[12111] = {atk = 12, def = 0}
Monster_sound_property[1013] = {atk = 14, def = 1}
Monster_sound_property[10835] = {atk = 14, def = 1}
Monster_sound_property[14798] = {atk = 14, def = 1}
Monster_sound_property[1017] = {atk = 14, def = 1}
Monster_sound_property[11731] = {atk = 16, def = 1}
Monster_sound_property[9540] = {atk = 14, def = 1}
Monster_sound_property[1074] = {atk = 12, def = 1}
Monster_sound_property[1053] = {atk = 12, def = 1}
Monster_sound_property[1050] = {atk = 21, def = 1}
Monster_sound_property[3662] = {atk = 14, def = 1}
Monster_sound_property[14764] = {atk = 18, def = 1}
Monster_sound_property[20104] = {atk = 14, def = 1}
Monster_sound_property[20105] = {atk = 14, def = 1}
Monster_sound_property[20106] = {atk = 14, def = 1}
Monster_sound_property[20107] = {atk = 14, def = 1}
Monster_sound_property[20108] = {atk = 28, def = 1}
Monster_sound_property[20109] = {atk = 14, def = 1}
Monster_sound_property[20315] = {atk = 12, def = 1}
Monster_sound_property[20316] = {atk = 28, def = 1}
Monster_sound_property[20329] = {atk = 14, def = 1}
Monster_sound_property[20330] = {atk = 14, def = 1}
Monster_sound_property[1119] = {atk = 21, def = 9}
Monster_sound_property[16223] = {atk = 21, def = 9}
Monster_sound_property[1120] = {atk = 21, def = 9}
Monster_sound_property[16222] = {atk = 21, def = 9}
Monster_sound_property[11662] = {atk = 30, def = 0}
Monster_sound_property[4605] = {atk = 14, def = 1}
Monster_sound_property[17132] = {atk = 13, def = 7}
Monster_sound_property[17133] = {atk = 13, def = 7}
Monster_sound_property[1126] = {atk = 13, def = 7}
Monster_sound_property[6040] = {atk = 17, def = 10}
Monster_sound_property[6041] = {atk = 17, def = 10}
Monster_sound_property[5067] = {atk = 13, def = 8}
Monster_sound_property[5068] = {atk = 13, def = 8}
Monster_sound_property[5069] = {atk = 13, def = 8}
Monster_sound_property[5070] = {atk = 13, def = 8}
Monster_sound_property[6044] = {atk = 13, def = 8}
Monster_sound_property[6045] = {atk = 13, def = 8}
Monster_sound_property[13372] = {atk = 13, def = 8}
Monster_sound_property[6046] = {atk = 13, def = 8}
Monster_sound_property[6042] = {atk = 13, def = 8}
Monster_sound_property[6043] = {atk = 13, def = 8}
Monster_sound_property[5071] = {atk = 17, def = 10}
Monster_sound_property[5072] = {atk = 17, def = 10}
Monster_sound_property[4812] = {atk = 17, def = 10}
Monster_sound_property[4813] = {atk = 17, def = 10}
Monster_sound_property[7814] = {atk = 17, def = 10}
Monster_sound_property[1129] = {atk = 16, def = 10}
Monster_sound_property[1122] = {atk = 14, def = 10}
Monster_sound_property[1132] = {atk = 13, def = 0}
Monster_sound_property[20767] = {atk = 13, def = 0}
Monster_sound_property[7828] = {atk = 28, def = 0}
Monster_sound_property[3621] = {atk = 18, def = 10}
Monster_sound_property[3620] = {atk = 18, def = 10}
Monster_sound_property[1116] = {atk = 14, def = 10}
Monster_sound_property[6592] = {atk = 21, def = 9}
Monster_sound_property[3619] = {atk = 18, def = 10}
Monster_sound_property[1117] = {atk = 14, def = 10}
Monster_sound_property[1118] = {atk = 13, def = 8}
Monster_sound_property[1128] = {atk = 21, def = 9}
Monster_sound_property[3618] = {atk = 18, def = 10}
Monster_sound_property[19758] = {atk = 0, def = 9}
Monster_sound_property[19759] = {atk = 14, def = 7}
Monster_sound_property[19760] = {atk = 14, def = 7}
Monster_sound_property[19761] = {atk = 28, def = 7}
Monster_sound_property[19762] = {atk = 0, def = 7}
Monster_sound_property[12112] = {atk = 18, def = 11}
Monster_sound_property[1089] = {atk = 18, def = 11}
Monster_sound_property[1087] = {atk = 18, def = 11}
Monster_sound_property[1086] = {atk = 18, def = 10}
Monster_sound_property[16249] = {atk = 24, def = 0}
Monster_sound_property[16250] = {atk = 24, def = 0}
Monster_sound_property[16251] = {atk = 24, def = 0}
Monster_sound_property[16252] = {atk = 24, def = 0}
Monster_sound_property[16429] = {atk = 17, def = 1}
Monster_sound_property[16253] = {atk = 21, def = 9}
Monster_sound_property[16257] = {atk = 24, def = 0}
Monster_sound_property[16258] = {atk = 26, def = 0}
Monster_sound_property[16254] = {atk = 25, def = 0}
Monster_sound_property[16255] = {atk = 14, def = 0}
Monster_sound_property[16256] = {atk = 21, def = 9}
Monster_sound_property[1134] = {atk = 26, def = 4}
Monster_sound_property[20768] = {atk = 26, def = 0}
Monster_sound_property[14765] = {atk = 24, def = 0}
Monster_sound_property[10878] = {atk = 24, def = 0}
Monster_sound_property[13271] = {atk = 25, def = 0}
Monster_sound_property[986] = {atk = 24, def = 0}
Monster_sound_property[985] = {atk = 27, def = 0}
Monster_sound_property[1004] = {atk = 24, def = 0}
Monster_sound_property[14766] = {atk = 25, def = 0}
Monster_sound_property[10840] = {atk = 26, def = 0}
Monster_sound_property[11732] = {atk = 24, def = 0}
Monster_sound_property[11672] = {atk = 24, def = 0}
Monster_sound_property[11667] = {atk = 26, def = 0}
Monster_sound_property[10733] = {atk = 24, def = 0}
Monster_sound_property[114] = {atk = 24, def = 0}
Monster_sound_property[15677] = {atk = 24, def = 0}
Monster_sound_property[113] = {atk = 26, def = 4}
Monster_sound_property[989] = {atk = 28, def = 0}
Monster_sound_property[14283] = {atk = 26, def = 0}
Monster_sound_property[14284] = {atk = 26, def = 0}
Monster_sound_property[990] = {atk = 24, def = 0}
Monster_sound_property[14285] = {atk = 26, def = 0}
Monster_sound_property[976] = {atk = 24, def = 0}
Monster_sound_property[977] = {atk = 24, def = 0}
Monster_sound_property[12895] = {atk = 26, def = 0}
Monster_sound_property[14767] = {atk = 25, def = 0}
Monster_sound_property[14768] = {atk = 24, def = 0}
Monster_sound_property[14769] = {atk = 25, def = 0}
Monster_sound_property[14770] = {atk = 24, def = 0}
Monster_sound_property[14771] = {atk = 24, def = 0}
Monster_sound_property[14772] = {atk = 24, def = 0}
Monster_sound_property[14773] = {atk = 24, def = 0}
Monster_sound_property[14774] = {atk = 24, def = 0}
Monster_sound_property[14775] = {atk = 24, def = 0}
Monster_sound_property[14776] = {atk = 24, def = 0}
Monster_sound_property[14777] = {atk = 24, def = 0}
Monster_sound_property[14778] = {atk = 24, def = 0}
Monster_sound_property[14779] = {atk = 24, def = 0}
Monster_sound_property[14780] = {atk = 24, def = 0}
Monster_sound_property[14781] = {atk = 24, def = 0}
Monster_sound_property[14782] = {atk = 24, def = 0}
Monster_sound_property[981] = {atk = 24, def = 0}
Monster_sound_property[12896] = {atk = 26, def = 0}
Monster_sound_property[993] = {atk = 24, def = 0}
Monster_sound_property[14783] = {atk = 12, def = 0}
Monster_sound_property[13500] = {atk = 24, def = 0}
Monster_sound_property[13501] = {atk = 24, def = 0}
Monster_sound_property[13502] = {atk = 24, def = 0}
Monster_sound_property[13503] = {atk = 24, def = 0}
Monster_sound_property[16152] = {atk = 28, def = 0}
Monster_sound_property[16186] = {atk = 26, def = 0}
Monster_sound_property[13504] = {atk = 24, def = 0}
Monster_sound_property[13505] = {atk = 24, def = 0}
Monster_sound_property[16187] = {atk = 26, def = 0}
Monster_sound_property[15678] = {atk = 24, def = 0}
Monster_sound_property[13507] = {atk = 24, def = 0}
Monster_sound_property[16185] = {atk = 26, def = 0}
Monster_sound_property[1003] = {atk = 24, def = 0}
Monster_sound_property[983] = {atk = 24, def = 0}
Monster_sound_property[982] = {atk = 25, def = 0}
Monster_sound_property[116] = {atk = 25, def = 4}
Monster_sound_property[115] = {atk = 24, def = 6}
Monster_sound_property[3606] = {atk = 24, def = 0}
Monster_sound_property[988] = {atk = 25, def = 0}
Monster_sound_property[987] = {atk = 24, def = 0}
Monster_sound_property[1005] = {atk = 24, def = 0}
Monster_sound_property[14525] = {atk = 24, def = 0}
Monster_sound_property[10837] = {atk = 27, def = 0}
Monster_sound_property[3624] = {atk = 24, def = 0}
Monster_sound_property[10881] = {atk = 24, def = 0}
Monster_sound_property[998] = {atk = 27, def = 0}
Monster_sound_property[984] = {atk = 24, def = 0}
Monster_sound_property[5059] = {atk = 24, def = 0}
Monster_sound_property[10874] = {atk = 24, def = 0}
Monster_sound_property[17136] = {atk = 25, def = 0}
Monster_sound_property[11659] = {atk = 27, def = 0}
Monster_sound_property[978] = {atk = 24, def = 0}
Monster_sound_property[3661] = {atk = 28, def = 0}
Monster_sound_property[14784] = {atk = 24, def = 0}
Monster_sound_property[979] = {atk = 24, def = 0}
Monster_sound_property[980] = {atk = 24, def = 0}
Monster_sound_property[997] = {atk = 27, def = 0}
Monster_sound_property[10833] = {atk = 27, def = 0}
Monster_sound_property[112] = {atk = 28, def = 0}
Monster_sound_property[10877] = {atk = 24, def = 0}
Monster_sound_property[15676] = {atk = 24, def = 0}
Monster_sound_property[14785] = {atk = 24, def = 0}
Monster_sound_property[992] = {atk = 24, def = 0}
Monster_sound_property[991] = {atk = 24, def = 0}
Monster_sound_property[14786] = {atk = 24, def = 0}
Monster_sound_property[16727] = {atk = 24, def = 0}
Monster_sound_property[14787] = {atk = 24, def = 0}
Monster_sound_property[16728] = {atk = 24, def = 0}
Monster_sound_property[14788] = {atk = 24, def = 0}
Monster_sound_property[14789] = {atk = 25, def = 0}
Monster_sound_property[10839] = {atk = 25, def = 0}
Monster_sound_property[9654] = {atk = 24, def = 0}
Monster_sound_property[14526] = {atk = 24, def = 0}
Monster_sound_property[14790] = {atk = 24, def = 0}
Monster_sound_property[1000] = {atk = 12, def = 8}
Monster_sound_property[10871] = {atk = 24, def = 0}
Monster_sound_property[10830] = {atk = 24, def = 0}
Monster_sound_property[9659] = {atk = 24, def = 0}
Monster_sound_property[16729] = {atk = 24, def = 0}
Monster_sound_property[1001] = {atk = 24, def = 0}
Monster_sound_property[14379] = {atk = 24, def = 0}
Monster_sound_property[1002] = {atk = 25, def = 0}
Monster_sound_property[1006] = {atk = 24, def = 0}
Monster_sound_property[17138] = {atk = 25, def = 0}
Monster_sound_property[17688] = {atk = 24, def = 0}
Monster_sound_property[13070] = {atk = 24, def = 0}
Monster_sound_property[17137] = {atk = 24, def = 0}
Monster_sound_property[10838] = {atk = 24, def = 0}
Monster_sound_property[111] = {atk = 24, def = 4}
Monster_sound_property[9660] = {atk = 27, def = 0}
Monster_sound_property[17139] = {atk = 25, def = 0}
Monster_sound_property[5061] = {atk = 24, def = 0}
Monster_sound_property[10882] = {atk = 24, def = 0}
Monster_sound_property[11658] = {atk = 24, def = 0}
Monster_sound_property[10729] = {atk = 27, def = 0}
Monster_sound_property[14792] = {atk = 24, def = 0}
Monster_sound_property[5060] = {atk = 25, def = 0}
Monster_sound_property[996] = {atk = 27, def = 0}
Monster_sound_property[994] = {atk = 24, def = 0}
Monster_sound_property[3601] = {atk = 25, def = 0}
Monster_sound_property[11744] = {atk = 17, def = 10}
Monster_sound_property[1112] = {atk = 28, def = 1}
Monster_sound_property[14286] = {atk = 28, def = 1}
Monster_sound_property[11665] = {atk = 24, def = 0}
Monster_sound_property[11666] = {atk = 24, def = 0}
Monster_sound_property[1114] = {atk = 13, def = 0}
Monster_sound_property[20769] = {atk = 13, def = 1}
Monster_sound_property[20770] = {atk = 13, def = 1}
Monster_sound_property[20771] = {atk = 13, def = 1}
Monster_sound_property[20772] = {atk = 13, def = 1}
Monster_sound_property[20773] = {atk = 13, def = 1}
Monster_sound_property[11661] = {atk = 14, def = 0}
Monster_sound_property[20774] = {atk = 14, def = 1}
Monster_sound_property[20775] = {atk = 14, def = 1}
Monster_sound_property[20776] = {atk = 14, def = 1}
Monster_sound_property[20777] = {atk = 14, def = 1}
Monster_sound_property[20778] = {atk = 14, def = 1}
Monster_sound_property[1106] = {atk = 28, def = 1}
Monster_sound_property[20779] = {atk = 26, def = 1}
Monster_sound_property[20780] = {atk = 26, def = 1}
Monster_sound_property[20781] = {atk = 26, def = 1}
Monster_sound_property[20782] = {atk = 26, def = 1}
Monster_sound_property[20783] = {atk = 26, def = 1}
Monster_sound_property[17687] = {atk = 31, def = 0}
Monster_sound_property[20784] = {atk = 31, def = 0}
Monster_sound_property[1095] = {atk = 16, def = 10}
Monster_sound_property[20785] = {atk = 16, def = 10}
Monster_sound_property[9543] = {atk = 28, def = 1}
Monster_sound_property[9360] = {atk = 16, def = 10}
Monster_sound_property[9358] = {atk = 28, def = 0}
Monster_sound_property[9359] = {atk = 28, def = 0}
Monster_sound_property[1113] = {atk = 14, def = 0}
Monster_sound_property[20786] = {atk = 14, def = 0}
Monster_sound_property[1094] = {atk = 28, def = 1}
Monster_sound_property[20787] = {atk = 26, def = 0}
Monster_sound_property[20788] = {atk = 26, def = 0}
Monster_sound_property[20789] = {atk = 26, def = 0}
Monster_sound_property[20790] = {atk = 26, def = 0}
Monster_sound_property[20791] = {atk = 26, def = 0}
Monster_sound_property[12635] = {atk = 28, def = 1}
Monster_sound_property[1093] = {atk = 28, def = 1}
Monster_sound_property[12636] = {atk = 17, def = 0}
Monster_sound_property[12637] = {atk = 17, def = 0}
Monster_sound_property[12638] = {atk = 17, def = 0}
Monster_sound_property[3602] = {atk = 17, def = 1}
Monster_sound_property[6590] = {atk = 28, def = 0}
Monster_sound_property[6591] = {atk = 28, def = 0}
Monster_sound_property[1104] = {atk = 14, def = 0}
Monster_sound_property[20792] = {atk = 14, def = 0}
Monster_sound_property[20745] = {atk = 26, def = 0}
Monster_sound_property[20793] = {atk = 26, def = 0}
Monster_sound_property[6047] = {atk = 24, def = 0}
Monster_sound_property[7424] = {atk = 17, def = 1}
Monster_sound_property[7425] = {atk = 17, def = 1}
Monster_sound_property[7426] = {atk = 17, def = 1}
Monster_sound_property[6433] = {atk = 24, def = 0}
Monster_sound_property[7439] = {atk = 31, def = 1}
Monster_sound_property[7466] = {atk = 28, def = 1}
Monster_sound_property[7467] = {atk = 28, def = 1}
Monster_sound_property[7468] = {atk = 28, def = 1}
Monster_sound_property[7381] = {atk = 24, def = 0}
Monster_sound_property[7382] = {atk = 24, def = 0}
Monster_sound_property[7383] = {atk = 24, def = 0}
Monster_sound_property[7435] = {atk = 14, def = 1}
Monster_sound_property[7441] = {atk = 12, def = 1}
Monster_sound_property[6440] = {atk = 24, def = 0}
Monster_sound_property[7446] = {atk = 14, def = 1}
Monster_sound_property[7447] = {atk = 14, def = 1}
Monster_sound_property[7448] = {atk = 14, def = 1}
Monster_sound_property[7405] = {atk = 24, def = 0}
Monster_sound_property[7406] = {atk = 24, def = 0}
Monster_sound_property[7407] = {atk = 24, def = 0}
Monster_sound_property[11431] = {atk = 24, def = 0}
Monster_sound_property[7458] = {atk = 19, def = 1}
Monster_sound_property[7459] = {atk = 19, def = 1}
Monster_sound_property[11440] = {atk = 19, def = 1}
Monster_sound_property[7397] = {atk = 28, def = 1}
Monster_sound_property[7398] = {atk = 28, def = 1}
Monster_sound_property[7399] = {atk = 28, def = 1}
Monster_sound_property[7400] = {atk = 13, def = 1}
Monster_sound_property[7401] = {atk = 13, def = 1}
Monster_sound_property[7402] = {atk = 13, def = 1}
Monster_sound_property[7413] = {atk = 28, def = 1}
Monster_sound_property[7414] = {atk = 28, def = 1}
Monster_sound_property[11447] = {atk = 28, def = 1}
Monster_sound_property[7384] = {atk = 24, def = 0}
Monster_sound_property[7385] = {atk = 24, def = 0}
Monster_sound_property[7386] = {atk = 24, def = 0}
Monster_sound_property[7433] = {atk = 17, def = 1}
Monster_sound_property[7442] = {atk = 17, def = 1}
Monster_sound_property[7427] = {atk = 28, def = 1}
Monster_sound_property[7428] = {atk = 28, def = 1}
Monster_sound_property[7429] = {atk = 28, def = 1}
Monster_sound_property[7472] = {atk = 14, def = 1}
Monster_sound_property[7473] = {atk = 14, def = 1}
Monster_sound_property[7474] = {atk = 14, def = 1}
Monster_sound_property[7436] = {atk = 14, def = 1}
Monster_sound_property[7430] = {atk = 17, def = 1}
Monster_sound_property[7431] = {atk = 17, def = 1}
Monster_sound_property[7432] = {atk = 17, def = 1}
Monster_sound_property[7438] = {atk = 14, def = 1}
Monster_sound_property[7387] = {atk = 24, def = 0}
Monster_sound_property[7388] = {atk = 24, def = 0}
Monster_sound_property[7389] = {atk = 24, def = 0}
Monster_sound_property[16885] = {atk = 24, def = 0}
Monster_sound_property[16886] = {atk = 26, def = 0}
Monster_sound_property[7434] = {atk = 14, def = 1}
Monster_sound_property[7417] = {atk = 24, def = 0}
Monster_sound_property[7418] = {atk = 24, def = 0}
Monster_sound_property[11433] = {atk = 24, def = 0}
Monster_sound_property[3640] = {atk = 25, def = 4}
Monster_sound_property[11443] = {atk = 24, def = 0}
Monster_sound_property[7394] = {atk = 28, def = 0}
Monster_sound_property[7395] = {atk = 28, def = 0}
Monster_sound_property[7396] = {atk = 28, def = 0}
Monster_sound_property[7452] = {atk = 13, def = 1}
Monster_sound_property[7453] = {atk = 13, def = 1}
Monster_sound_property[7454] = {atk = 13, def = 1}
Monster_sound_property[7449] = {atk = 28, def = 1}
Monster_sound_property[7450] = {atk = 28, def = 1}
Monster_sound_property[7451] = {atk = 28, def = 1}
Monster_sound_property[7415] = {atk = 28, def = 1}
Monster_sound_property[7416] = {atk = 28, def = 1}
Monster_sound_property[11445] = {atk = 28, def = 1}
Monster_sound_property[7460] = {atk = 24, def = 0}
Monster_sound_property[7461] = {atk = 24, def = 0}
Monster_sound_property[7462] = {atk = 24, def = 0}
Monster_sound_property[7463] = {atk = 28, def = 1}
Monster_sound_property[7464] = {atk = 28, def = 1}
Monster_sound_property[7465] = {atk = 28, def = 1}
Monster_sound_property[7422] = {atk = 19, def = 1}
Monster_sound_property[7423] = {atk = 19, def = 1}
Monster_sound_property[11446] = {atk = 19, def = 1}
Monster_sound_property[7455] = {atk = 24, def = 0}
Monster_sound_property[7456] = {atk = 24, def = 0}
Monster_sound_property[7457] = {atk = 24, def = 0}
Monster_sound_property[8664] = {atk = 28, def = 1}
Monster_sound_property[10798] = {atk = 28, def = 1}
Monster_sound_property[11434] = {atk = 28, def = 1}
Monster_sound_property[7392] = {atk = 28, def = 0}
Monster_sound_property[7393] = {atk = 28, def = 0}
Monster_sound_property[11435] = {atk = 28, def = 0}
Monster_sound_property[17539] = {atk = 24, def = 0}
Monster_sound_property[17540] = {atk = 24, def = 0}
Monster_sound_property[7403] = {atk = 24, def = 0}
Monster_sound_property[7404] = {atk = 24, def = 0}
Monster_sound_property[11451] = {atk = 24, def = 0}
Monster_sound_property[7408] = {atk = 24, def = 0}
Monster_sound_property[7409] = {atk = 24, def = 0}
Monster_sound_property[7410] = {atk = 24, def = 0}
Monster_sound_property[7411] = {atk = 24, def = 0}
Monster_sound_property[7412] = {atk = 24, def = 0}
Monster_sound_property[11430] = {atk = 24, def = 0}
Monster_sound_property[11442] = {atk = 24, def = 0}
Monster_sound_property[7437] = {atk = 14, def = 1}
Monster_sound_property[8662] = {atk = 29, def = 1}
Monster_sound_property[10794] = {atk = 29, def = 1}
Monster_sound_property[10795] = {atk = 29, def = 1}
Monster_sound_property[8663] = {atk = 14, def = 1}
Monster_sound_property[10796] = {atk = 14, def = 1}
Monster_sound_property[10797] = {atk = 14, def = 1}
Monster_sound_property[7440] = {atk = 14, def = 1}
Monster_sound_property[7419] = {atk = 24, def = 0}
Monster_sound_property[7420] = {atk = 24, def = 0}
Monster_sound_property[7421] = {atk = 24, def = 0}
Monster_sound_property[7443] = {atk = 24, def = 0}
Monster_sound_property[7444] = {atk = 24, def = 0}
Monster_sound_property[7445] = {atk = 24, def = 0}
Monster_sound_property[15815] = {atk = 24, def = 0}
Monster_sound_property[7469] = {atk = 24, def = 0}
Monster_sound_property[7470] = {atk = 24, def = 0}
Monster_sound_property[7471] = {atk = 24, def = 0}
Monster_sound_property[7390] = {atk = 24, def = 0}
Monster_sound_property[7391] = {atk = 24, def = 0}
Monster_sound_property[11450] = {atk = 24, def = 0}
Monster_sound_property[11437] = {atk = 24, def = 0}
Monster_sound_property[18391] = {atk = 14, def = 1}
Monster_sound_property[18392] = {atk = 14, def = 1}
Monster_sound_property[18393] = {atk = 28, def = 1}
Monster_sound_property[18394] = {atk = 24, def = 0}
Monster_sound_property[18405] = {atk = 17, def = 1}
Monster_sound_property[18407] = {atk = 12, def = 1}
Monster_sound_property[18408] = {atk = 31, def = 1}
Monster_sound_property[18416] = {atk = 12, def = 1}
Monster_sound_property[18526] = {atk = 24, def = 0}
Monster_sound_property[18568] = {atk = 26, def = 0}
Monster_sound_property[19563] = {atk = 14, def = 1}
Monster_sound_property[19667] = {atk = 26, def = 0}
Monster_sound_property[19668] = {atk = 26, def = 0}
Monster_sound_property[19669] = {atk = 28, def = 1}
Monster_sound_property[19670] = {atk = 28, def = 1}
Monster_sound_property[19671] = {atk = 14, def = 1}
Monster_sound_property[19672] = {atk = 28, def = 1}
Monster_sound_property[19673] = {atk = 26, def = 0}
Monster_sound_property[19674] = {atk = 17, def = 1}
Monster_sound_property[19675] = {atk = 17, def = 1}
Monster_sound_property[19693] = {atk = 14, def = 1}
Monster_sound_property[19694] = {atk = 28, def = 1}
Monster_sound_property[19718] = {atk = 14, def = 1}
Monster_sound_property[20012] = {atk = 26, def = 0}
Monster_sound_property[20406] = {atk = 28, def = 1}
Monster_sound_property[20407] = {atk = 28, def = 1}
Monster_sound_property[20408] = {atk = 12, def = 1}
Monster_sound_property[20409] = {atk = 31, def = 1}
Monster_sound_property[20592] = {atk = 14, def = 1}
Monster_sound_property[20593] = {atk = 29, def = 1}
Monster_sound_property[20727] = {atk = 26, def = 0}
Monster_sound_property[11427] = {atk = 17, def = 10}
Monster_sound_property[11016] = {atk = 17, def = 10}
Monster_sound_property[12651] = {atk = 26, def = 0}
Monster_sound_property[12652] = {atk = 26, def = 0}
Monster_sound_property[6618] = {atk = 17, def = 10}
Monster_sound_property[11733] = {atk = 17, def = 10}
Monster_sound_property[11026] = {atk = 17, def = 10}
Monster_sound_property[11461] = {atk = 17, def = 10}
Monster_sound_property[11441] = {atk = 17, def = 10}
Monster_sound_property[11464] = {atk = 25, def = 0}
Monster_sound_property[11449] = {atk = 25, def = 0}
Monster_sound_property[11436] = {atk = 17, def = 10}
Monster_sound_property[14339] = {atk = 0, def = 10}
Monster_sound_property[14371] = {atk = 0, def = 10}
Monster_sound_property[14340] = {atk = 0, def = 10}
Monster_sound_property[14341] = {atk = 0, def = 10}
Monster_sound_property[14372] = {atk = 0, def = 10}
Monster_sound_property[15816] = {atk = 0, def = 10}
Monster_sound_property[14373] = {atk = 0, def = 10}
Monster_sound_property[15817] = {atk = 0, def = 10}
Monster_sound_property[14374] = {atk = 0, def = 10}
Monster_sound_property[15818] = {atk = 0, def = 10}
Monster_sound_property[14375] = {atk = 0, def = 10}
Monster_sound_property[11018] = {atk = 17, def = 10}
Monster_sound_property[6617] = {atk = 17, def = 10}
Monster_sound_property[13219] = {atk = 0, def = 1}
Monster_sound_property[10863] = {atk = 0, def = 10}
Monster_sound_property[11217] = {atk = 0, def = 10}
Monster_sound_property[11444] = {atk = 0, def = 10}
Monster_sound_property[13369] = {atk = 0, def = 10}
Monster_sound_property[11029] = {atk = 17, def = 10}
Monster_sound_property[11030] = {atk = 0, def = 10}
Monster_sound_property[11025] = {atk = 17, def = 10}
Monster_sound_property[13220] = {atk = 0, def = 1}
Monster_sound_property[11028] = {atk = 17, def = 10}
Monster_sound_property[11714] = {atk = 17, def = 10}
Monster_sound_property[11214] = {atk = 21, def = 9}
Monster_sound_property[12653] = {atk = 25, def = 0}
Monster_sound_property[11458] = {atk = 25, def = 0}
Monster_sound_property[11216] = {atk = 21, def = 9}
Monster_sound_property[11465] = {atk = 25, def = 0}
Monster_sound_property[11428] = {atk = 24, def = 0}
Monster_sound_property[11438] = {atk = 25, def = 0}
Monster_sound_property[11463] = {atk = 25, def = 0}
Monster_sound_property[11462] = {atk = 25, def = 0}
Monster_sound_property[11453] = {atk = 25, def = 0}
Monster_sound_property[11456] = {atk = 0, def = 0}
Monster_sound_property[16888] = {atk = 28, def = 0}
Monster_sound_property[11429] = {atk = 25, def = 0}
Monster_sound_property[11024] = {atk = 21, def = 9}
Monster_sound_property[11215] = {atk = 21, def = 9}
Monster_sound_property[11218] = {atk = 17, def = 10}
Monster_sound_property[11021] = {atk = 17, def = 1}
Monster_sound_property[11020] = {atk = 17, def = 1}
Monster_sound_property[11017] = {atk = 25, def = 0}
Monster_sound_property[11027] = {atk = 25, def = 0}
Monster_sound_property[11022] = {atk = 25, def = 0}
Monster_sound_property[11019] = {atk = 25, def = 0}
Monster_sound_property[11439] = {atk = 17, def = 10}
Monster_sound_property[11713] = {atk = 25, def = 0}
Monster_sound_property[11448] = {atk = 24, def = 0}
Monster_sound_property[11452] = {atk = 25, def = 0}
Monster_sound_property[11455] = {atk = 25, def = 0}
Monster_sound_property[16887] = {atk = 0, def = 9}
Monster_sound_property[11023] = {atk = 25, def = 0}
Monster_sound_property[13221] = {atk = 0, def = 10}
Monster_sound_property[13222] = {atk = 0, def = 10}
Monster_sound_property[13223] = {atk = 0, def = 10}
Monster_sound_property[13224] = {atk = 0, def = 10}
Monster_sound_property[13225] = {atk = 0, def = 10}
Monster_sound_property[18527] = {atk = 0, def = 0}
Monster_sound_property[11459] = {atk = 25, def = 0}
Monster_sound_property[19885] = {atk = 0, def = 0}
Monster_sound_property[11460] = {atk = 25, def = 0}
Monster_sound_property[19938] = {atk = 0, def = 0}
Monster_sound_property[10879] = {atk = 25, def = 0}
Monster_sound_property[20751] = {atk = 0, def = 0}
Monster_sound_property[17640] = {atk = 0, def = 0}
Monster_sound_property[10880] = {atk = 25, def = 0}
Monster_sound_property[72] = {atk = 25, def = 0}
Monster_sound_property[17641] = {atk = 0, def = 0}
Monster_sound_property[17642] = {atk = 0, def = 0}
Monster_sound_property[18417] = {atk = 0, def = 0}
Monster_sound_property[19886] = {atk = 0, def = 0}
Monster_sound_property[6616] = {atk = 28, def = 1}
Monster_sound_property[11454] = {atk = 25, def = 0}
Monster_sound_property[11457] = {atk = 25, def = 0}
Monster_sound_property[18143] = {atk = 0, def = 10}
Monster_sound_property[18144] = {atk = 0, def = 0}
Monster_sound_property[18406] = {atk = 0, def = 10}
Monster_sound_property[18419] = {atk = 0, def = 10}
Monster_sound_property[19676] = {atk = 24, def = 0}
Monster_sound_property[19695] = {atk = 0, def = 0}
Monster_sound_property[19755] = {atk = 24, def = 0}
Monster_sound_property[19756] = {atk = 0, def = 0}
Monster_sound_property[20235] = {atk = 0, def = 0}
Monster_sound_property[20314] = {atk = 0, def = 0}
Monster_sound_property[20482] = {atk = 0, def = 0}
Monster_sound_property[20728] = {atk = 0, def = 0}
Monster_sound_property[20750] = {atk = 0, def = 10}
Monster_sound_property[20236] = {atk = 24, def = 0}
Monster_sound_property[20237] = {atk = 24, def = 0}
Monster_sound_property[20238] = {atk = 0, def = 0}
Monster_sound_property[20239] = {atk = 0, def = 0}
Monster_sound_property[20240] = {atk = 24, def = 0}
Monster_sound_property[20241] = {atk = 24, def = 0}
Monster_sound_property[20566] = {atk = 0, def = 0}
Monster_sound_property[11432] = {atk = 25, def = 0}
Monster_sound_property[7121] = {atk = 24, def = 0}
Monster_sound_property[13212] = {atk = 0, def = 0}
Monster_sound_property[14950] = {atk = 0, def = 0}
Monster_sound_property[14579] = {atk = 0, def = 0}
Monster_sound_property[14580] = {atk = 0, def = 0}
Monster_sound_property[16422] = {atk = 0, def = 0}
Monster_sound_property[13137] = {atk = 0, def = 0}
Monster_sound_property[13138] = {atk = 0, def = 0}
Monster_sound_property[13139] = {atk = 0, def = 0}
Monster_sound_property[13140] = {atk = 0, def = 0}
Monster_sound_property[13141] = {atk = 0, def = 0}
Monster_sound_property[13142] = {atk = 0, def = 0}
Monster_sound_property[13143] = {atk = 0, def = 0}
Monster_sound_property[13144] = {atk = 0, def = 0}
Monster_sound_property[10753] = {atk = 0, def = 0}
Monster_sound_property[14581] = {atk = 0, def = 0}
Monster_sound_property[4642] = {atk = 25, def = 1}
Monster_sound_property[8574] = {atk = 25, def = 1}
Monster_sound_property[8575] = {atk = 25, def = 1}
Monster_sound_property[13937] = {atk = 0, def = 0}
Monster_sound_property[13938] = {atk = 0, def = 0}
Monster_sound_property[13939] = {atk = 0, def = 0}
Monster_sound_property[13940] = {atk = 0, def = 0}
Monster_sound_property[13941] = {atk = 0, def = 0}
Monster_sound_property[16221] = {atk = 0, def = 0}
Monster_sound_property[14951] = {atk = 0, def = 0}
Monster_sound_property[14819] = {atk = 0, def = 0}
Monster_sound_property[4686] = {atk = 13, def = 7}
Monster_sound_property[16166] = {atk = 0, def = 0}
Monster_sound_property[16164] = {atk = 0, def = 0}
Monster_sound_property[4697] = {atk = 21, def = 9}
Monster_sound_property[4698] = {atk = 21, def = 9}
Monster_sound_property[4700] = {atk = 21, def = 9}
Monster_sound_property[4699] = {atk = 21, def = 9}
Monster_sound_property[16813] = {atk = 0, def = 0}
Monster_sound_property[16232] = {atk = 0, def = 0}
Monster_sound_property[4662] = {atk = 21, def = 9}
Monster_sound_property[4663] = {atk = 21, def = 9}
Monster_sound_property[4664] = {atk = 21, def = 9}
Monster_sound_property[4661] = {atk = 25, def = 1}
Monster_sound_property[12461] = {atk = 17, def = 10}
Monster_sound_property[14040] = {atk = 0, def = 0}
Monster_sound_property[10754] = {atk = 13, def = 7}
Monster_sound_property[16167] = {atk = 0, def = 0}
Monster_sound_property[3646] = {atk = 13, def = 7}
Monster_sound_property[3654] = {atk = 13, def = 7}
Monster_sound_property[4704] = {atk = 17, def = 10}
Monster_sound_property[4688] = {atk = 25, def = 0}
Monster_sound_property[4687] = {atk = 25, def = 0}
Monster_sound_property[16175] = {atk = 0, def = 0}
Monster_sound_property[14582] = {atk = 0, def = 0}
Monster_sound_property[14583] = {atk = 0, def = 0}
Monster_sound_property[4658] = {atk = 25, def = 1}
Monster_sound_property[4659] = {atk = 25, def = 1}
Monster_sound_property[14584] = {atk = 0, def = 0}
Monster_sound_property[14585] = {atk = 0, def = 0}
Monster_sound_property[6244] = {atk = 13, def = 7}
Monster_sound_property[16814] = {atk = 0, def = 0}
Monster_sound_property[17528] = {atk = 0, def = 0}
Monster_sound_property[14586] = {atk = 0, def = 0}
Monster_sound_property[11219] = {atk = 25, def = 1}
Monster_sound_property[13145] = {atk = 0, def = 0}
Monster_sound_property[4670] = {atk = 17, def = 10}
Monster_sound_property[16656] = {atk = 0, def = 0}
Monster_sound_property[13074] = {atk = 0, def = 0}
Monster_sound_property[14587] = {atk = 0, def = 0}
Monster_sound_property[14588] = {atk = 0, def = 0}
Monster_sound_property[4683] = {atk = 17, def = 10}
Monster_sound_property[4718] = {atk = 17, def = 10}
Monster_sound_property[4719] = {atk = 17, def = 10}
Monster_sound_property[4720] = {atk = 17, def = 10}
Monster_sound_property[4721] = {atk = 13, def = 7}
Monster_sound_property[11747] = {atk = 18, def = 11}
Monster_sound_property[13340] = {atk = 0, def = 1}
Monster_sound_property[4666] = {atk = 18, def = 11}
Monster_sound_property[4667] = {atk = 18, def = 11}
Monster_sound_property[4671] = {atk = 21, def = 9}
Monster_sound_property[7984] = {atk = 17, def = 10}
Monster_sound_property[14589] = {atk = 0, def = 0}
Monster_sound_property[16811] = {atk = 0, def = 0}
Monster_sound_property[16812] = {atk = 0, def = 0}
Monster_sound_property[16168] = {atk = 0, def = 0}
Monster_sound_property[4725] = {atk = 18, def = 11}
Monster_sound_property[4728] = {atk = 18, def = 11}
Monster_sound_property[4726] = {atk = 18, def = 11}
Monster_sound_property[4723] = {atk = 18, def = 11}
Monster_sound_property[4727] = {atk = 18, def = 11}
Monster_sound_property[4724] = {atk = 18, def = 11}
Monster_sound_property[4722] = {atk = 18, def = 11}
Monster_sound_property[14590] = {atk = 0, def = 0}
Monster_sound_property[16169] = {atk = 0, def = 0}
Monster_sound_property[3647] = {atk = 17, def = 10}
Monster_sound_property[14591] = {atk = 0, def = 0}
Monster_sound_property[4693] = {atk = 21, def = 9}
Monster_sound_property[16423] = {atk = 0, def = 0}
Monster_sound_property[16424] = {atk = 0, def = 0}
Monster_sound_property[16170] = {atk = 0, def = 0}
Monster_sound_property[16815] = {atk = 0, def = 0}
Monster_sound_property[14952] = {atk = 0, def = 0}
Monster_sound_property[14592] = {atk = 0, def = 0}
Monster_sound_property[13073] = {atk = 0, def = 0}
Monster_sound_property[14593] = {atk = 0, def = 0}
Monster_sound_property[16816] = {atk = 0, def = 0}
Monster_sound_property[16817] = {atk = 0, def = 0}
Monster_sound_property[14594] = {atk = 0, def = 0}
Monster_sound_property[12649] = {atk = 25, def = 0}
Monster_sound_property[13146] = {atk = 0, def = 0}
Monster_sound_property[13213] = {atk = 0, def = 0}
Monster_sound_property[14595] = {atk = 0, def = 0}
Monster_sound_property[14596] = {atk = 0, def = 0}
Monster_sound_property[14597] = {atk = 0, def = 0}
Monster_sound_property[4692] = {atk = 21, def = 9}
Monster_sound_property[4689] = {atk = 21, def = 9}
Monster_sound_property[4691] = {atk = 21, def = 9}
Monster_sound_property[4690] = {atk = 21, def = 9}
Monster_sound_property[4680] = {atk = 21, def = 9}
Monster_sound_property[4681] = {atk = 21, def = 9}
Monster_sound_property[4677] = {atk = 21, def = 9}
Monster_sound_property[4679] = {atk = 21, def = 9}
Monster_sound_property[4678] = {atk = 21, def = 9}
Monster_sound_property[4672] = {atk = 21, def = 9}
Monster_sound_property[4676] = {atk = 21, def = 9}
Monster_sound_property[4675] = {atk = 21, def = 9}
Monster_sound_property[4674] = {atk = 21, def = 9}
Monster_sound_property[4673] = {atk = 21, def = 9}
Monster_sound_property[4684] = {atk = 13, def = 7}
Monster_sound_property[4685] = {atk = 13, def = 7}
Monster_sound_property[14598] = {atk = 0, def = 0}
Monster_sound_property[14599] = {atk = 0, def = 0}
Monster_sound_property[14600] = {atk = 0, def = 0}
Monster_sound_property[14601] = {atk = 0, def = 0}
Monster_sound_property[4660] = {atk = 18, def = 11}
Monster_sound_property[3655] = {atk = 18, def = 11}
Monster_sound_property[17489] = {atk = 0, def = 0}
Monster_sound_property[17490] = {atk = 0, def = 0}
Monster_sound_property[17491] = {atk = 0, def = 0}
Monster_sound_property[17492] = {atk = 0, def = 0}
Monster_sound_property[17493] = {atk = 0, def = 0}
Monster_sound_property[17494] = {atk = 0, def = 0}
Monster_sound_property[17495] = {atk = 0, def = 0}
Monster_sound_property[17496] = {atk = 0, def = 0}
Monster_sound_property[17497] = {atk = 0, def = 0}
Monster_sound_property[17498] = {atk = 0, def = 0}
Monster_sound_property[16171] = {atk = 0, def = 0}
Monster_sound_property[4682] = {atk = 17, def = 10}
Monster_sound_property[3653] = {atk = 17, def = 10}
Monster_sound_property[16172] = {atk = 0, def = 0}
Monster_sound_property[16818] = {atk = 0, def = 0}
Monster_sound_property[14602] = {atk = 0, def = 0}
Monster_sound_property[11838] = {atk = 17, def = 10}
Monster_sound_property[11839] = {atk = 17, def = 10}
Monster_sound_property[11840] = {atk = 17, def = 10}
Monster_sound_property[11841] = {atk = 17, def = 10}
Monster_sound_property[11842] = {atk = 17, def = 10}
Monster_sound_property[4717] = {atk = 11, def = 6}
Monster_sound_property[16231] = {atk = 0, def = 0}
Monster_sound_property[12650] = {atk = 21, def = 9}
Monster_sound_property[16173] = {atk = 0, def = 0}
Monster_sound_property[15045] = {atk = 0, def = 0}
Monster_sound_property[15046] = {atk = 0, def = 0}
Monster_sound_property[17253] = {atk = 0, def = 0}
Monster_sound_property[4669] = {atk = 18, def = 11}
Monster_sound_property[4668] = {atk = 18, def = 11}
Monster_sound_property[13147] = {atk = 0, def = 0}
Monster_sound_property[4646] = {atk = 18, def = 11}
Monster_sound_property[4647] = {atk = 18, def = 11}
Monster_sound_property[4645] = {atk = 18, def = 11}
Monster_sound_property[14603] = {atk = 0, def = 0}
Monster_sound_property[4656] = {atk = 18, def = 11}
Monster_sound_property[4657] = {atk = 18, def = 11}
Monster_sound_property[4648] = {atk = 18, def = 11}
Monster_sound_property[4649] = {atk = 18, def = 11}
Monster_sound_property[4652] = {atk = 18, def = 11}
Monster_sound_property[4653] = {atk = 18, def = 11}
Monster_sound_property[4654] = {atk = 18, def = 11}
Monster_sound_property[4655] = {atk = 18, def = 11}
Monster_sound_property[4650] = {atk = 18, def = 11}
Monster_sound_property[4651] = {atk = 18, def = 11}
Monster_sound_property[3651] = {atk = 18, def = 11}
Monster_sound_property[14604] = {atk = 0, def = 0}
Monster_sound_property[14605] = {atk = 0, def = 0}
Monster_sound_property[6587] = {atk = 21, def = 9}
Monster_sound_property[6588] = {atk = 21, def = 9}
Monster_sound_property[13148] = {atk = 0, def = 0}
Monster_sound_property[3652] = {atk = 18, def = 11}
Monster_sound_property[11748] = {atk = 18, def = 11}
Monster_sound_property[11749] = {atk = 18, def = 11}
Monster_sound_property[6246] = {atk = 13, def = 7}
Monster_sound_property[4665] = {atk = 18, def = 11}
Monster_sound_property[6245] = {atk = 13, def = 7}
Monster_sound_property[4696] = {atk = 0, def = 0}
Monster_sound_property[4694] = {atk = 0, def = 0}
Monster_sound_property[4695] = {atk = 0, def = 0}
Monster_sound_property[3649] = {atk = 21, def = 9}
Monster_sound_property[4706] = {atk = 13, def = 7}
Monster_sound_property[14606] = {atk = 0, def = 0}
Monster_sound_property[14607] = {atk = 0, def = 0}
Monster_sound_property[3650] = {atk = 18, def = 11}
Monster_sound_property[16176] = {atk = 0, def = 0}
Monster_sound_property[13149] = {atk = 0, def = 0}
Monster_sound_property[4643] = {atk = 17, def = 10}
Monster_sound_property[4644] = {atk = 17, def = 10}
Monster_sound_property[4705] = {atk = 28, def = 0}
Monster_sound_property[17529] = {atk = 0, def = 0}
Monster_sound_property[14608] = {atk = 0, def = 0}
Monster_sound_property[14609] = {atk = 0, def = 0}
Monster_sound_property[14610] = {atk = 0, def = 0}
Monster_sound_property[4711] = {atk = 25, def = 0}
Monster_sound_property[4707] = {atk = 25, def = 0}
Monster_sound_property[4709] = {atk = 25, def = 0}
Monster_sound_property[4710] = {atk = 25, def = 0}
Monster_sound_property[4708] = {atk = 25, def = 0}
Monster_sound_property[4712] = {atk = 25, def = 0}
Monster_sound_property[4715] = {atk = 25, def = 0}
Monster_sound_property[4714] = {atk = 25, def = 0}
Monster_sound_property[4716] = {atk = 25, def = 0}
Monster_sound_property[4713] = {atk = 25, def = 0}
Monster_sound_property[4703] = {atk = 18, def = 11}
Monster_sound_property[4701] = {atk = 18, def = 11}
Monster_sound_property[4702] = {atk = 18, def = 11}
Monster_sound_property[16165] = {atk = 0, def = 0}
Monster_sound_property[13150] = {atk = 0, def = 0}
Monster_sound_property[3648] = {atk = 28, def = 1}
Monster_sound_property[16174] = {atk = 0, def = 0}
Monster_sound_property[18081] = {atk = 0, def = 0}
Monster_sound_property[18137] = {atk = 0, def = 0}
Monster_sound_property[18138] = {atk = 0, def = 0}
Monster_sound_property[18139] = {atk = 0, def = 0}
Monster_sound_property[18140] = {atk = 0, def = 0}
Monster_sound_property[18145] = {atk = 0, def = 0}
Monster_sound_property[18146] = {atk = 0, def = 0}
Monster_sound_property[17657] = {atk = 0, def = 0}
Monster_sound_property[19849] = {atk = 0, def = 0}
Monster_sound_property[20551] = {atk = 0, def = 0}
Monster_sound_property[19850] = {atk = 0, def = 0}
Monster_sound_property[20062] = {atk = 0, def = 0}
Monster_sound_property[19851] = {atk = 0, def = 0}
Monster_sound_property[20552] = {atk = 0, def = 0}
Monster_sound_property[19852] = {atk = 0, def = 0}
Monster_sound_property[19941] = {atk = 0, def = 0}
Monster_sound_property[19942] = {atk = 0, def = 0}
Monster_sound_property[19943] = {atk = 0, def = 0}
Monster_sound_property[19944] = {atk = 0, def = 0}
Monster_sound_property[19945] = {atk = 0, def = 0}
Monster_sound_property[19946] = {atk = 0, def = 0}
Monster_sound_property[19947] = {atk = 0, def = 0}
Monster_sound_property[19948] = {atk = 0, def = 0}
Monster_sound_property[19949] = {atk = 0, def = 0}
Monster_sound_property[19950] = {atk = 0, def = 0}
Monster_sound_property[19951] = {atk = 0, def = 0}
Monster_sound_property[19952] = {atk = 0, def = 0}
Monster_sound_property[19953] = {atk = 0, def = 0}
Monster_sound_property[19954] = {atk = 0, def = 0}
Monster_sound_property[19955] = {atk = 0, def = 0}
Monster_sound_property[19956] = {atk = 0, def = 0}
Monster_sound_property[19957] = {atk = 0, def = 0}
Monster_sound_property[19958] = {atk = 0, def = 0}
Monster_sound_property[19959] = {atk = 0, def = 0}
Monster_sound_property[20553] = {atk = 0, def = 0}
Monster_sound_property[20554] = {atk = 0, def = 0}
Monster_sound_property[20555] = {atk = 0, def = 0}
Monster_sound_property[20556] = {atk = 0, def = 0}
Monster_sound_property[20557] = {atk = 0, def = 0}
Monster_sound_property[20558] = {atk = 0, def = 0}
Monster_sound_property[20559] = {atk = 0, def = 0}
Monster_sound_property[20560] = {atk = 0, def = 0}
Monster_sound_property[20561] = {atk = 0, def = 0}
Monster_sound_property[20562] = {atk = 0, def = 0}
Monster_sound_property[20563] = {atk = 0, def = 0}
Monster_sound_property[20564] = {atk = 0, def = 0}
Monster_sound_property[20565] = {atk = 0, def = 0}
Monster_sound_property[20867] = {atk = 0, def = 0}
Monster_sound_property[13590] = {atk = 0, def = 7}
Monster_sound_property[13591] = {atk = 0, def = 10}
Monster_sound_property[13592] = {atk = 0, def = 7}
Monster_sound_property[13593] = {atk = 0, def = 10}
Monster_sound_property[3665] = {atk = 0, def = 10}
Monster_sound_property[18454] = {atk = 0, def = 9}
Monster_sound_property[12881] = {atk = 0, def = 9}
Monster_sound_property[17538] = {atk = 0, def = 9}
Monster_sound_property[17530] = {atk = 0, def = 10}
Monster_sound_property[3668] = {atk = 21, def = 9}
Monster_sound_property[17532] = {atk = 0, def = 10}
Monster_sound_property[17534] = {atk = 0, def = 7}
Monster_sound_property[13270] = {atk = 0, def = 10}
Monster_sound_property[16156] = {atk = 0, def = 10}
Monster_sound_property[16180] = {atk = 0, def = 10}
Monster_sound_property[16178] = {atk = 0, def = 10}
Monster_sound_property[16181] = {atk = 0, def = 9}
Monster_sound_property[3671] = {atk = 21, def = 9}
Monster_sound_property[17537] = {atk = 0, def = 10}
Monster_sound_property[16154] = {atk = 0, def = 9}
Monster_sound_property[12664] = {atk = 17, def = 10}
Monster_sound_property[12665] = {atk = 17, def = 10}
Monster_sound_property[12666] = {atk = 17, def = 10}
Monster_sound_property[12667] = {atk = 17, def = 10}
Monster_sound_property[12668] = {atk = 17, def = 10}
Monster_sound_property[12882] = {atk = 17, def = 10}
Monster_sound_property[12669] = {atk = 17, def = 10}
Monster_sound_property[12670] = {atk = 21, def = 9}
Monster_sound_property[12671] = {atk = 17, def = 10}
Monster_sound_property[17535] = {atk = 0, def = 10}
Monster_sound_property[17536] = {atk = 0, def = 10}
Monster_sound_property[3670] = {atk = 21, def = 9}
Monster_sound_property[3667] = {atk = 17, def = 10}
Monster_sound_property[14250] = {atk = 21, def = 9}
Monster_sound_property[17531] = {atk = 21, def = 9}
Monster_sound_property[16182] = {atk = 21, def = 9}
Monster_sound_property[16179] = {atk = 0, def = 10}
Monster_sound_property[17533] = {atk = 0, def = 10}
Monster_sound_property[12883] = {atk = 21, def = 9}
Monster_sound_property[12884] = {atk = 21, def = 9}
Monster_sound_property[12885] = {atk = 21, def = 9}
Monster_sound_property[12886] = {atk = 17, def = 10}
Monster_sound_property[12914] = {atk = 17, def = 10}
Monster_sound_property[12887] = {atk = 21, def = 9}
Monster_sound_property[12888] = {atk = 21, def = 9}
Monster_sound_property[12889] = {atk = 21, def = 9}
Monster_sound_property[14635] = {atk = 0, def = 9}
Monster_sound_property[14636] = {atk = 0, def = 9}
Monster_sound_property[14637] = {atk = 0, def = 9}
Monster_sound_property[13594] = {atk = 0, def = 9}
Monster_sound_property[13595] = {atk = 0, def = 11}
Monster_sound_property[13596] = {atk = 0, def = 11}
Monster_sound_property[13597] = {atk = 0, def = 0}
Monster_sound_property[18455] = {atk = 0, def = 10}
Monster_sound_property[18456] = {atk = 0, def = 10}
Monster_sound_property[18457] = {atk = 0, def = 9}
Monster_sound_property[18458] = {atk = 0, def = 9}
Monster_sound_property[18459] = {atk = 0, def = 9}
Monster_sound_property[18460] = {atk = 0, def = 10}
Monster_sound_property[18461] = {atk = 0, def = 10}
Monster_sound_property[18462] = {atk = 0, def = 10}
Monster_sound_property[18463] = {atk = 0, def = 10}
Monster_sound_property[18464] = {atk = 0, def = 10}
Monster_sound_property[18465] = {atk = 0, def = 10}
Monster_sound_property[18466] = {atk = 0, def = 9}
Monster_sound_property[18467] = {atk = 0, def = 9}
Monster_sound_property[18468] = {atk = 0, def = 9}
Monster_sound_property[18469] = {atk = 0, def = 9}
Monster_sound_property[19719] = {atk = 0, def = 10}
Monster_sound_property[19720] = {atk = 0, def = 9}
Monster_sound_property[19721] = {atk = 0, def = 9}
Monster_sound_property[19722] = {atk = 0, def = 9}
Monster_sound_property[20065] = {atk = 0, def = 9}
Monster_sound_property[20066] = {atk = 0, def = 9}
Monster_sound_property[20067] = {atk = 0, def = 9}
Monster_sound_property[20068] = {atk = 0, def = 9}
Monster_sound_property[19723] = {atk = 28, def = 0}
Monster_sound_property[19724] = {atk = 0, def = 9}
Monster_sound_property[20002] = {atk = 0, def = 9}
Monster_sound_property[20175] = {atk = 0, def = 9}
--[[#tag pop]]

NPCModelSoundCfg = NPCModelSoundCfg or {}

-- 取所有怪物音效配置
function NPCModelSoundCfg:GetAndReleaseAllMonsterSoundProperty()
	local ret = Monster_sound_property
	Monster_sound_property = nil
	return ret
end
