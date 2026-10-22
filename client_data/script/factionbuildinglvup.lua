--[[#tag push auto]]
FactionBuildingLvUp = {}


-- 建筑列表 建筑最大等级为9级

FactionBuildingLvUp.FBuildingList = {}
FactionBuildingLvUp.FBuildingList[1] = {}		-- 镖局下各建筑
FactionBuildingLvUp.FBuildingList[2] = {}		-- 马帮
FactionBuildingLvUp.FBuildingList[3] = {}		-- 山寨
FactionBuildingLvUp.FBuildingList[4] = {}		-- 工坊

-- 镖局各建筑

FactionBuildingLvUp.FBuildingList[1][1] = {}		-- 议事厅

FactionBuildingLvUp.FBuildingList[1][2] = {}		-- 后勤处

FactionBuildingLvUp.FBuildingList[1][3]	= {}		-- 刺虎楼

FactionBuildingLvUp.FBuildingList[1][4] = {}		-- 特殊建筑1
FactionBuildingLvUp.FBuildingList[1][5] = {}		-- 厢房
FactionBuildingLvUp.FBuildingList[1][6] = {}		-- 祭祀
FactionBuildingLvUp.FBuildingList[1][7] = {}		-- 广场
FactionBuildingLvUp.FBuildingList[1][11] = {}		-- 情报屋




-- 马帮各建筑

FactionBuildingLvUp.FBuildingList[2][1] = {}		-- 议事厅

FactionBuildingLvUp.FBuildingList[2][2] = {}		-- 后勤处

FactionBuildingLvUp.FBuildingList[2][3]	= {}		-- 专有建筑1
FactionBuildingLvUp.FBuildingList[2][4] = {}		-- 特殊建筑1
FactionBuildingLvUp.FBuildingList[2][5] = {}		-- 厢房
FactionBuildingLvUp.FBuildingList[2][6] = {}		-- 祭祀
FactionBuildingLvUp.FBuildingList[2][7] = {}		-- 广场
FactionBuildingLvUp.FBuildingList[2][11] = {}		-- 专有建筑2


-- 山寨各建筑

FactionBuildingLvUp.FBuildingList[3][1] = {}		-- 议事厅

FactionBuildingLvUp.FBuildingList[3][2] = {}		-- 后勤处

FactionBuildingLvUp.FBuildingList[3][3]	= {}		-- 黑店
--FactionBuildingLvUp.FBuildingList[3][4] = {}		-- 特殊建筑1
FactionBuildingLvUp.FBuildingList[3][5] = {}		-- 厢房
FactionBuildingLvUp.FBuildingList[3][6] = {}		-- 藏宝阁

FactionBuildingLvUp.FBuildingList[3][7] = {}		-- 广场
FactionBuildingLvUp.FBuildingList[3][11] = {}		-- 刑讯室
FactionBuildingLvUp.FBuildingList[3][12] = {}		-- 占卜台



-- 工坊各建筑

FactionBuildingLvUp.FBuildingList[4][1] = {}		-- 议事厅

FactionBuildingLvUp.FBuildingList[4][2] = {}		-- 后勤处

FactionBuildingLvUp.FBuildingList[4][3]	= {}		-- 奇物居

FactionBuildingLvUp.FBuildingList[4][4] = {}		-- 特殊建筑1
FactionBuildingLvUp.FBuildingList[4][5] = {}		-- 厢房
FactionBuildingLvUp.FBuildingList[4][6] = {}		-- 祭祀
FactionBuildingLvUp.FBuildingList[4][7] = {}		-- 广场
FactionBuildingLvUp.FBuildingList[4][11] = {}		-- 物料司







--[[
-- 建筑列表显示数据
Name = "name",						建筑名称

ImgDir = "",						建筑图标

Lv = "",						建筑等级

--Upgrade = "",						升级条件	"XXX".."\t".."XXX" 格式

Desc = ""						建筑描述

Benefit = ""						升级好处
--]]

-- 建筑列表为2维表，第一个维度ID代表建筑种类，第二个维度ID代表建筑等级。

-- FBuildingList[4][2] 代表2级镖车库
--[[
建筑ID与建筑匹配如下

1 --	议事厅

2 --	后勤处

3 --	账房
4 --	镖车库

5 --	金库
6 --	武器库

7 --	厂房
8 --	厢房
9 --	祭坛
10--	广场
--]]

-- 议事厅表
-- 各类型宗派下，此建筑相同

FactionBuildingLvUp.FBuildingList[1][1][1] =
{
	Name = --[[!AUTO_1]]"議事廳",
	-- ImgDir = "",
	Lv = --[[!AUTO_2]]"1",
	--Upgrade = "       宗派等级到达2级\r       物品：原木 1个（在帮会帐房处交纳）",
	Desc = --[[!AUTO_3]]"       宗派的智囊，平素用於收集分析各類江湖消息，並開啟江湖事件。\r       對應功能NPC：活動使",
	Benefit = --[[!AUTO_4]]"       核心消息容量：11-->12\r       小道消息容量：105-->110\r       江湖事件容量：2-->3",
}

FactionBuildingLvUp.FBuildingList[1][1][2] =
{
	Name = --[[!AUTO_5]]"議事廳",
	-- ImgDir = "",
	Lv = --[[!AUTO_6]]"2",
	--Upgrade = "       宗派等级到达3级\r       物品：原木 1个（在帮会帐房处交纳）",
	Desc = --[[!AUTO_7]]"       宗派的智囊，平素用於收集分析各類江湖消息，並開啟江湖事件。\r       對應功能NPC：活動使",
	Benefit = --[[!AUTO_8]]"       核心消息容量：12-->13\r       小道消息容量：110-->115\r       江湖事件容量：3-->4\r       允許領取紅利任務",
}

FactionBuildingLvUp.FBuildingList[1][1][3] =
{
	Name = --[[!AUTO_9]]"議事廳",
	-- ImgDir = "",
	Lv = --[[!AUTO_10]]"3",
	--Upgrade = "       宗派等级到达4级\r       物品：原木 1个（在帮会帐房处交纳）",
	Desc = --[[!AUTO_11]]"       宗派的智囊，平素用於收集分析各類江湖消息，並開啟江湖事件。\r       對應功能NPC：活動使",
	Benefit = --[[!AUTO_12]]"       核心消息容量：13-->14\r       小道消息容量：115-->120\r       江湖事件容量：4-->5",
}

FactionBuildingLvUp.FBuildingList[1][1][4] =
{
	Name = --[[!AUTO_13]]"議事廳",
	-- ImgDir = "",
	Lv = --[[!AUTO_14]]"4",
	--Upgrade = "       宗派等级到达4级\r       物品：原木 1个（在帮会帐房处交纳）",
	Desc = --[[!AUTO_15]]"       宗派的智囊，平素用於收集分析各類江湖消息，並開啟江湖事件。\r       對應功能NPC：活動使",
	Benefit = --[[!AUTO_16]]"       核心消息容量：14-->15\r       小道消息容量：120-->125\r       江湖事件容量：5-->6",
}

FactionBuildingLvUp.FBuildingList[1][1][5] =
{
	Name = --[[!AUTO_17]]"議事廳",
	-- ImgDir = "",
	Lv = --[[!AUTO_18]]"5",
	--Upgrade = "       宗派等级到达4级\r       物品：原木 1个（在帮会帐房处交纳）",
	Desc = --[[!AUTO_19]]"       宗派的智囊，平素用於收集分析各類江湖消息，並開啟江湖事件。\r       對應功能NPC：活動使",
	Benefit = --[[!AUTO_20]]"       核心消息容量：15-->16\r       小道消息容量：125-->130\r       江湖事件容量：6-->7",
}

FactionBuildingLvUp.FBuildingList[1][1][6] =
{
	Name = --[[!AUTO_21]]"議事廳",
	-- ImgDir = "",
	Lv = --[[!AUTO_22]]"6",
	--Upgrade = "       宗派等级到达7级\r       物品：原木 1个（在帮会帐房处交纳）",
	Desc = --[[!AUTO_23]]"       宗派的智囊，平素用於收集分析各類江湖消息，並開啟江湖事件。\r       對應功能NPC：活動使",
	Benefit = --[[!AUTO_24]]"       核心消息容量：16-->17\r       小道消息容量：130-->135\r       江湖事件容量：7-->8",
}

FactionBuildingLvUp.FBuildingList[1][1][7] =
{
	Name = --[[!AUTO_25]]"議事廳",
	-- ImgDir = "",
	Lv = --[[!AUTO_26]]"7",
	--Upgrade = "       宗派等级到达8级\r       物品：原木 1个（在帮会帐房处交纳）",
	Desc = --[[!AUTO_27]]"       宗派的智囊，平素用於收集分析各類江湖消息，並開啟江湖事件。\r       對應功能NPC：活動使",
	Benefit = --[[!AUTO_28]]"       核心消息容量：17-->18\r       小道消息容量：135-->140\r       江湖事件容量：8-->9",
}

FactionBuildingLvUp.FBuildingList[1][1][8] =
{
	Name = --[[!AUTO_29]]"議事廳",
	-- ImgDir = "",
	Lv = --[[!AUTO_30]]"8",
	--Upgrade = "       宗派等级到达9级\r       物品：原木 1个（在帮会帐房处交纳）",
	Desc = --[[!AUTO_31]]"       宗派的智囊，平素用於收集分析各類江湖消息，並開啟江湖事件。\r       對應功能NPC：活動使",
	Benefit = --[[!AUTO_32]]"       核心消息容量：18-->19\r       小道消息容量：140-->145\r       江湖事件容量：9-->10",
}

FactionBuildingLvUp.FBuildingList[1][1][9] =
{
	Name = --[[!AUTO_33]]"議事廳",
	-- ImgDir = "",
	Lv = --[[!AUTO_34]]"9",
	--Upgrade = "       已达到最高等级。",
	Desc = --[[!AUTO_35]]"       宗派的智囊，平素用於收集分析各類江湖消息，並開啟江湖事件。\r       對應功能NPC：活動使",
	Benefit = --[[!AUTO_36]]"       已達到最高等級。",
}

-- 将此表的内容拷贝到其他宗派中议事厅表内

FactionBuildingLvUp.FBuildingList[4][1] = FactionBuildingLvUp.FBuildingList[1][1]
FactionBuildingLvUp.FBuildingList[3][1] = FactionBuildingLvUp.FBuildingList[1][1]
FactionBuildingLvUp.FBuildingList[2][1] = FactionBuildingLvUp.FBuildingList[1][1]

-- 后勤处表
FactionBuildingLvUp.FBuildingList[1][2][1] =
{
	Name = --[[!AUTO_37]]"後勤處",
	-- ImgDir = "",
	Lv = --[[!AUTO_38]]"1",
	--Upgrade = "       宗派等级到达2级\r       物品：原木 1个（在帮会帐房处交纳）",
	Desc = --[[!AUTO_39]]"       對應功能NPC：後勤使",
	Benefit = --[[!AUTO_40]]"       更高級的生產技能升級。",
}

FactionBuildingLvUp.FBuildingList[1][2][2] =
{
	Name = --[[!AUTO_41]]"後勤處",
	-- ImgDir = "",
	Lv = --[[!AUTO_42]]"2",
	--Upgrade = "       宗派等级到达3级\r       物品：原木 1个（在帮会帐房处交纳）",
	Desc = --[[!AUTO_43]]"              對應功能NPC：後勤使",
	Benefit = --[[!AUTO_44]]"              更高級的生產技能升級。",
}

FactionBuildingLvUp.FBuildingList[1][2][3] =
{
	Name = --[[!AUTO_45]]"後勤處",
	-- ImgDir = "",
	Lv = --[[!AUTO_46]]"3",
	--Upgrade = "       宗派等级到达4级\r       物品：原木 1个（在帮会帐房处交纳）",
	Desc = --[[!AUTO_47]]"              對應功能NPC：後勤使",
	Benefit = --[[!AUTO_48]]"       已經達到該建築最高等級。",
}

FactionBuildingLvUp.FBuildingList[1][2][4] =
{
	Name = --[[!AUTO_49]]"後勤處",
	-- ImgDir = "",
	Lv = --[[!AUTO_50]]"4",
	--Upgrade = "       宗派等级到达5级\r       物品：原木 1个（在帮会帐房处交纳）",
	Desc = --[[!AUTO_51]]"       出售宗派特殊資源的地方。\r       對應功能NPC：後勤使",
	Benefit = --[[!AUTO_52]]"       宗派特殊物資品種增加，\r       八級以下生產技能升級。",
}

FactionBuildingLvUp.FBuildingList[1][2][5] =
{
	Name = --[[!AUTO_53]]"後勤處",
	-- ImgDir = "",
	Lv = --[[!AUTO_54]]"5",
	--Upgrade = "       宗派等级到达6级\r       物品：原木 1个（在帮会帐房处交纳）",
	Desc = --[[!AUTO_55]]"       出售宗派特殊資源的地方。\r       對應功能NPC：後勤使",
	Benefit = --[[!AUTO_56]]"       宗派特殊物資品種增加，\r       八級以下生產技能升級。",
}

FactionBuildingLvUp.FBuildingList[1][2][6] =
{
	Name = --[[!AUTO_57]]"後勤處",
	-- ImgDir = "",
	Lv = --[[!AUTO_58]]"6",
	--Upgrade = "       宗派等级到达7级\r       物品：原木 1个（在帮会帐房处交纳）",
	Desc = --[[!AUTO_59]]"       出售宗派特殊資源的地方。\r       對應功能NPC：後勤使",
	Benefit = --[[!AUTO_60]]"       宗派特殊物資品種增加，\r       九級以下生產技能升級。",
}

FactionBuildingLvUp.FBuildingList[1][2][7] =
{
	Name = --[[!AUTO_61]]"後勤處",
	-- ImgDir = "",
	Lv = --[[!AUTO_62]]"7",
	--Upgrade = "       宗派等级到达8级\r       物品：原木 1个（在帮会帐房处交纳）",
	Desc = --[[!AUTO_63]]"       出售宗派特殊資源的地方。\r       對應功能NPC：後勤使",
	Benefit = --[[!AUTO_64]]"       宗派特殊物資品種增加，\r       九級以下生產技能升級。",
}

FactionBuildingLvUp.FBuildingList[1][2][8] =
{
	Name = --[[!AUTO_65]]"後勤處",
	-- ImgDir = "",
	Lv = --[[!AUTO_66]]"8",
	--Upgrade = "       已达到最高等级。",
	Desc = --[[!AUTO_67]]"       出售宗派特殊資源的地方。\r       對應功能NPC：後勤使",
	Benefit = --[[!AUTO_68]]"       宗派特殊物資品種增加，\r       十級以下生產技能升級。",
}

FactionBuildingLvUp.FBuildingList[1][2][9] =
{
	Name = --[[!AUTO_69]]"後勤處",
	-- ImgDir = "",
	Lv = --[[!AUTO_70]]"9",
	--Upgrade = "已经达到该建筑最高等级。",
	Desc = --[[!AUTO_71]]"       出售宗派特殊資源的地方。\r       對應功能NPC：後勤使",
	Benefit = --[[!AUTO_72]]"       已經達到該建築最高等級。",
}

-- 将此表的内容拷贝到其他宗派中后勤处表内

FactionBuildingLvUp.FBuildingList[4][2] = FactionBuildingLvUp.FBuildingList[1][2]
FactionBuildingLvUp.FBuildingList[3][2] = FactionBuildingLvUp.FBuildingList[1][2]
FactionBuildingLvUp.FBuildingList[2][2] = FactionBuildingLvUp.FBuildingList[1][2]



-- 镖局专有建筑1表

FactionBuildingLvUp.FBuildingList[1][3][1] =
{
	Name = --[[!AUTO_73]]"刺虎樓",
	-- ImgDir = "",
	Lv = --[[!AUTO_74]]"1",
	--Upgrade = "       宗派等级到达2级\r       物品：原木 1个（在帮会帐房处交纳）",
	Desc = --[[!AUTO_75]]"       鏢局用於通緝各類山寨線索之處。\r       對應功能NPC：緝捕使",
	Benefit = --[[!AUTO_76]]"       交納線索獲得的花紅增加。",
}

FactionBuildingLvUp.FBuildingList[1][3][2] =
{
	Name = --[[!AUTO_77]]"刺虎樓",
	-- ImgDir = "",
	Lv = --[[!AUTO_78]]"2",
	--Upgrade = "       宗派等级到达3级\r       物品：原木 1个（在帮会帐房处交纳）",
	Desc = --[[!AUTO_79]]"       鏢局用於通緝各類山寨線索之處。\r       對應功能NPC：緝捕使",
	Benefit = --[[!AUTO_80]]"       交納線索獲得的花紅增加。",
}


FactionBuildingLvUp.FBuildingList[1][3][3] =
{
	Name = --[[!AUTO_81]]"刺虎樓",
	-- ImgDir = "",
	Lv = --[[!AUTO_82]]"3",
	--Upgrade = "       宗派等级到达4级\r       物品：原木 1个（在帮会帐房处交纳）",
	Desc = --[[!AUTO_83]]"       鏢局用於通緝各類山寨線索之處。\r       對應功能NPC：緝捕使",
	Benefit = --[[!AUTO_84]]"       交納線索獲得的花紅增加。",
}

FactionBuildingLvUp.FBuildingList[1][3][4] =
{
	Name = --[[!AUTO_85]]"刺虎樓",
	-- ImgDir = "",
	Lv = --[[!AUTO_86]]"4",
	--Upgrade = "       宗派等级到达5级\r       物品：原木 1个（在帮会帐房处交纳）",
	Desc = --[[!AUTO_87]]"       鏢局用於通緝各類山寨線索之處。\r       對應功能NPC：緝捕使",
	Benefit = --[[!AUTO_88]]"       交納線索獲得的花紅增加。",
}

FactionBuildingLvUp.FBuildingList[1][3][5] =
{
	Name = --[[!AUTO_89]]"刺虎樓",
	-- ImgDir = "",
	Lv = --[[!AUTO_90]]"5",
	--Upgrade = "       宗派等级到达6级\r       物品：原木 1个（在帮会帐房处交纳）",
	Desc = --[[!AUTO_91]]"       鏢局用於通緝各類山寨線索之處。\r       對應功能NPC：緝捕使",
	Benefit = --[[!AUTO_92]]"       交納線索獲得的花紅增加。",
}

FactionBuildingLvUp.FBuildingList[1][3][6] =
{
	Name = --[[!AUTO_93]]"刺虎樓",
	-- ImgDir = "",
	Lv = --[[!AUTO_94]]"6",
	--Upgrade = "       宗派等级到达7级\r       物品：原木 1个（在帮会帐房处交纳）",
	Desc = --[[!AUTO_95]]"       鏢局用於通緝各類山寨線索之處。\r       對應功能NPC：緝捕使",
	Benefit = --[[!AUTO_96]]"       交納線索獲得的花紅增加。",
}

FactionBuildingLvUp.FBuildingList[1][3][7] =
{
	Name = --[[!AUTO_97]]"刺虎樓",
	-- ImgDir = "",
	Lv = --[[!AUTO_98]]"7",
	--Upgrade = "       宗派等级到达8级\r       物品：原木 1个（在帮会帐房处交纳）",
	Desc = --[[!AUTO_99]]"       鏢局用於通緝各類山寨線索之處。\r       對應功能NPC：緝捕使",
	Benefit = --[[!AUTO_100]]"       交納線索獲得的花紅增加。",
}

FactionBuildingLvUp.FBuildingList[1][3][8] =
{
	Name = --[[!AUTO_101]]"刺虎樓",
	-- ImgDir = "",
	Lv = --[[!AUTO_102]]"8",
	--Upgrade = "       宗派等级到达9级\r       物品：原木 1个（在帮会帐房处交纳）",
	Desc = --[[!AUTO_103]]"       鏢局用於通緝各類山寨線索之處。\r       對應功能NPC：緝捕使",
	Benefit = --[[!AUTO_104]]"       交納線索獲得的花紅增加。",
}

FactionBuildingLvUp.FBuildingList[1][3][9] =
{
	Name = --[[!AUTO_105]]"刺虎樓",
	-- ImgDir = "",
	Lv = --[[!AUTO_106]]"9",
	--Upgrade = "已经达到该建筑最高等级。",
	Desc = --[[!AUTO_107]]"       鏢局用於通緝各類山寨線索之處。\r       對應功能NPC：緝捕使",
	Benefit = --[[!AUTO_108]]"       已經達到該建築最高等級。",
}

--马帮专有建筑1表


FactionBuildingLvUp.FBuildingList[2][3][1] =
{
	Name = --[[!AUTO_109]]"待定",
	-- ImgDir = "",
	Lv = --[[!AUTO_110]]"1",
	Upgrade = --[[!AUTO_111]]"升級到2級的條件",
	Desc = --[[!AUTO_112]]"待定",
}

FactionBuildingLvUp.FBuildingList[2][3][2] =
{
	Name = --[[!AUTO_113]]"待定",
	-- ImgDir = "",
	Lv = --[[!AUTO_114]]"2",
	Upgrade = --[[!AUTO_115]]"升級到3級的條件",
	Desc = --[[!AUTO_116]]"待定",
}


FactionBuildingLvUp.FBuildingList[2][3][3] =
{
	Name = --[[!AUTO_117]]"待定",
	-- ImgDir = "",
	Lv = --[[!AUTO_118]]"3",
	Upgrade = --[[!AUTO_119]]"升級到4級的條件",
	Desc = --[[!AUTO_120]]"待定",
}

FactionBuildingLvUp.FBuildingList[2][3][4] =
{
	Name = --[[!AUTO_121]]"待定",
	-- ImgDir = "",
	Lv = --[[!AUTO_122]]"4",
	Upgrade = --[[!AUTO_123]]"升級到5級的條件",
	Desc = --[[!AUTO_124]]"待定",
}

FactionBuildingLvUp.FBuildingList[2][3][5] =
{
	Name = --[[!AUTO_125]]"待定",
	-- ImgDir = "",
	Lv = --[[!AUTO_126]]"5",
	Upgrade = --[[!AUTO_127]]"升級到6級的條件",
	Desc = --[[!AUTO_128]]"待定",
}

FactionBuildingLvUp.FBuildingList[2][3][6] =
{
	Name = --[[!AUTO_129]]"待定",
	-- ImgDir = "",
	Lv = --[[!AUTO_130]]"6",
	Upgrade = --[[!AUTO_131]]"升級到7級的條件",
	Desc = --[[!AUTO_132]]"待定",
}

FactionBuildingLvUp.FBuildingList[2][3][7] =
{
	Name = --[[!AUTO_133]]"待定",
	-- ImgDir = "",
	Lv = --[[!AUTO_134]]"7",
	Upgrade = --[[!AUTO_135]]"升級到8級的條件",
	Desc = --[[!AUTO_136]]"待定",
}

FactionBuildingLvUp.FBuildingList[2][3][8] =
{
	Name = --[[!AUTO_137]]"待定",
	-- ImgDir = "",
	Lv = --[[!AUTO_138]]"8",
	Upgrade = --[[!AUTO_139]]"升級到9級的條件",
	Desc = --[[!AUTO_140]]"待定",
}

FactionBuildingLvUp.FBuildingList[2][3][9] =
{
	Name = --[[!AUTO_141]]"待定",
	-- ImgDir = "",
	Lv = --[[!AUTO_142]]"9",
	Upgrade = --[[!AUTO_143]]"已經達到該建築最高等級。",
	Desc = --[[!AUTO_144]]"待定",
}

--山寨专有建筑1表


FactionBuildingLvUp.FBuildingList[3][3][1] =
{
	Name = --[[!AUTO_145]]"黑店",
	-- ImgDir = "",
	Lv = --[[!AUTO_146]]"1",
	--Upgrade = "       宗派等级到达2级\r       物品：原木 1个（在帮会帐房处交纳）",
	Desc = --[[!AUTO_147]]"       山寨用於回收各類劫持而來的鏢貨。\r       對應功能NPC：黑店老闆",
	Benefit = --[[!AUTO_148]]"       鏢貨能換取的獎勵增加。",
}

FactionBuildingLvUp.FBuildingList[3][3][2] =
{
	Name = --[[!AUTO_149]]"黑店",
	-- ImgDir = "",
	Lv = --[[!AUTO_150]]"2",
	--Upgrade = "       宗派等级到达3级\r       物品：原木 1个（在帮会帐房处交纳）",
	Desc = --[[!AUTO_151]]"       山寨用於回收各類劫持而來的鏢貨。\r       對應功能NPC：黑店老闆",
	Benefit = --[[!AUTO_152]]"       鏢貨能換取的獎勵增加。",
}


FactionBuildingLvUp.FBuildingList[3][3][3] =
{
	Name = --[[!AUTO_153]]"黑店",
	-- ImgDir = "",
	Lv = --[[!AUTO_154]]"3",
	--Upgrade = "       宗派等级到达4级\r       物品：原木 1个（在帮会帐房处交纳）",
	Desc = --[[!AUTO_155]]"       山寨用於回收各類劫持而來的鏢貨。\r       對應功能NPC：黑店老闆",
	Benefit = --[[!AUTO_156]]"       鏢貨能換取的獎勵增加。",
}

FactionBuildingLvUp.FBuildingList[3][3][4] =
{
	Name = --[[!AUTO_157]]"黑店",
	-- ImgDir = "",
	Lv = --[[!AUTO_158]]"4",
	--Upgrade = "       宗派等级到达5级\r       物品：原木 1个（在帮会帐房处交纳）",
	Desc = --[[!AUTO_159]]"       山寨用於回收各類劫持而來的鏢貨。\r       對應功能NPC：黑店老闆",
	Benefit = --[[!AUTO_160]]"       鏢貨能換取的獎勵增加。",
}

FactionBuildingLvUp.FBuildingList[3][3][5] =
{
	Name = --[[!AUTO_161]]"黑店",
	-- ImgDir = "",
	Lv = --[[!AUTO_162]]"5",
	--Upgrade = "       宗派等级到达6级\r       物品：原木 1个（在帮会帐房处交纳）",
	Desc = --[[!AUTO_163]]"       山寨用於回收各類劫持而來的鏢貨。\r       對應功能NPC：黑店老闆",
	Benefit = --[[!AUTO_164]]"       鏢貨能換取的獎勵增加。",
}

FactionBuildingLvUp.FBuildingList[3][3][6] =
{
	Name = --[[!AUTO_165]]"黑店",
	-- ImgDir = "",
	Lv = --[[!AUTO_166]]"6",
	--Upgrade = "       宗派等级到达7级\r       物品：原木 1个（在帮会帐房处交纳）",
	Desc = --[[!AUTO_167]]"       山寨用於回收各類劫持而來的鏢貨。\r       對應功能NPC：黑店老闆",
	Benefit = --[[!AUTO_168]]"       鏢貨能換取的獎勵增加。",
}

FactionBuildingLvUp.FBuildingList[3][3][7] =
{
	Name = --[[!AUTO_169]]"黑店",
	-- ImgDir = "",
	Lv = --[[!AUTO_170]]"7",
	--Upgrade = "       宗派等级到达8级\r       物品：原木 1个（在帮会帐房处交纳）",
	Desc = --[[!AUTO_171]]"       山寨用於回收各類劫持而來的鏢貨。\r       對應功能NPC：黑店老闆",
	Benefit = --[[!AUTO_172]]"       鏢貨能換取的獎勵增加。",
}

FactionBuildingLvUp.FBuildingList[3][3][8] =
{
	Name = --[[!AUTO_173]]"黑店",
	-- ImgDir = "",
	Lv = --[[!AUTO_174]]"8",
	--Upgrade = "       宗派等级到达9级\r       物品：原木 1个（在帮会帐房处交纳）",
	Desc = --[[!AUTO_175]]"       山寨用於回收各類劫持而來的鏢貨。\r       對應功能NPC：黑店老闆",
	Benefit = --[[!AUTO_176]]"       鏢貨能換取的獎勵增加。",
}

FactionBuildingLvUp.FBuildingList[3][3][9] =
{
	Name = --[[!AUTO_177]]"黑店",
	-- ImgDir = "",
	Lv = --[[!AUTO_178]]"9",
	--Upgrade = "已经达到该建筑最高等级。",
	Desc = --[[!AUTO_179]]"       山寨用於回收各類劫持而來的鏢貨。\r       對應功能NPC：黑店老闆",
	Benefit = --[[!AUTO_180]]"       已經達到該建築最高等級。",
}
FactionBuildingLvUp.FBuildingList[3][12][1] =
{
	Name = --[[!AUTO_177]]"占卜台",
	-- ImgDir = "",
	Lv = --[[!AUTO_178]]"1",
	--Upgrade = "已经达到该建筑最高等级。",
	Desc = --[[!AUTO_179]]"       進行每日占卜的地方。\r       對應功能NPC：占卜師",
	Benefit = --[[!AUTO_180]]"       可研發2級占卜。",
}
FactionBuildingLvUp.FBuildingList[3][12][2] =
{
	Name = --[[!AUTO_177]]"占卜台",
	-- ImgDir = "",
	Lv = --[[!AUTO_178]]"1",
	--Upgrade = "已经达到该建筑最高等级。",
	Desc = --[[!AUTO_179]]"       進行每日占卜的地方。\r       對應功能NPC：占卜師",
	Benefit = --[[!AUTO_180]]"       可研發3級占卜。",
}
FactionBuildingLvUp.FBuildingList[3][12][3] =
{
	Name = --[[!AUTO_177]]"占卜台",
	-- ImgDir = "",
	Lv = --[[!AUTO_178]]"1",
	--Upgrade = "已经达到该建筑最高等级。",
	Desc = --[[!AUTO_179]]"       進行每日占卜的地方。\r       對應功能NPC：占卜師",
	Benefit = --[[!AUTO_180]]"       可研發4級占卜。",
}
FactionBuildingLvUp.FBuildingList[3][12][4] =
{
	Name = --[[!AUTO_177]]"占卜台",
	-- ImgDir = "",
	Lv = --[[!AUTO_178]]"1",
	--Upgrade = "已经达到该建筑最高等级。",
	Desc = --[[!AUTO_179]]"       進行每日占卜的地方。\r       對應功能NPC：占卜師",
	Benefit = --[[!AUTO_180]]"       可研發5級占卜。",
}
FactionBuildingLvUp.FBuildingList[3][12][5] =
{
	Name = --[[!AUTO_177]]"占卜台",
	-- ImgDir = "",
	Lv = --[[!AUTO_178]]"1",
	--Upgrade = "已经达到该建筑最高等级。",
	Desc = --[[!AUTO_179]]"       進行每日占卜的地方。\r       對應功能NPC：占卜師",
	Benefit = --[[!AUTO_180]]"       可研發6級占卜。",
}
FactionBuildingLvUp.FBuildingList[3][12][6] =
{
	Name = --[[!AUTO_177]]"占卜台",
	-- ImgDir = "",
	Lv = --[[!AUTO_178]]"1",
	--Upgrade = "已经达到该建筑最高等级。",
	Desc = --[[!AUTO_179]]"       進行每日占卜的地方。\r       對應功能NPC：占卜師",
	Benefit = --[[!AUTO_180]]"       可研發7級占卜。",
}
FactionBuildingLvUp.FBuildingList[3][12][7] =
{
	Name = --[[!AUTO_177]]"占卜台",
	-- ImgDir = "",
	Lv = --[[!AUTO_178]]"1",
	--Upgrade = "已经达到该建筑最高等级。",
	Desc = --[[!AUTO_179]]"       進行每日占卜的地方。\r       對應功能NPC：占卜師",
	Benefit = --[[!AUTO_180]]"       可研發8級占卜。",
}
FactionBuildingLvUp.FBuildingList[3][12][8] =
{
	Name = --[[!AUTO_177]]"占卜台",
	-- ImgDir = "",
	Lv = --[[!AUTO_178]]"1",
	--Upgrade = "已经达到该建筑最高等级。",
	Desc = --[[!AUTO_179]]"       進行每日占卜的地方。\r       對應功能NPC：占卜師",
	Benefit = --[[!AUTO_180]]"       可研發9級占卜。",
}
FactionBuildingLvUp.FBuildingList[3][12][9] =
{
	Name = --[[!AUTO_177]]"占卜台",
	-- ImgDir = "",
	Lv = --[[!AUTO_178]]"1",
	--Upgrade = "已经达到该建筑最高等级。",
	Desc = --[[!AUTO_179]]"       進行每日占卜的地方。\r       對應功能NPC：占卜師",
	Benefit = --[[!AUTO_180]]"       已經達到該建築最高等級。",
}
--工坊专有建筑1表


FactionBuildingLvUp.FBuildingList[4][3][1] =
{
	Name = --[[!AUTO_181]]"奇物居",
	-- ImgDir = "",
	Lv = --[[!AUTO_182]]"1",
	--Upgrade = --[[!AUTO_183]]"升级到2级的条件",
	Desc = --[[!AUTO_184]]"       工坊用來收集各種希奇之物的所在。\r       對應功能NPC：奇物居管事",
	Benefit = "       搜集到奇物後的獎勵增加。",
}

FactionBuildingLvUp.FBuildingList[4][3][2] =
{
	Name = --[[!AUTO_185]]"奇物居",
	-- ImgDir = "",
	Lv = --[[!AUTO_186]]"2",
	--Upgrade = --[[!AUTO_187]]"升级到3级的条件",
	Desc = --[[!AUTO_188]]"       工坊用來收集各種希奇之物的所在。\r       對應功能NPC：奇物居管事",
	Benefit = "       搜集到奇物後的獎勵增加。",
}


FactionBuildingLvUp.FBuildingList[4][3][3] =
{
	Name = --[[!AUTO_189]]"奇物居",
	-- ImgDir = "",
	Lv = --[[!AUTO_190]]"3",
	--Upgrade = --[[!AUTO_191]]"升级到4级的条件",
	Desc = --[[!AUTO_192]]"       工坊用來收集各種希奇之物的所在。\r       對應功能NPC：奇物居管事",
	Benefit = "       搜集到奇物後的獎勵增加。",
}

FactionBuildingLvUp.FBuildingList[4][3][4] =
{
	Name = --[[!AUTO_193]]"奇物居",
	-- ImgDir = "",
	Lv = --[[!AUTO_194]]"4",
	--Upgrade = --[[!AUTO_195]]"升级到5级的条件",
	Desc = --[[!AUTO_196]]"       工坊用來收集各種希奇之物的所在。\r       對應功能NPC：奇物居管事",
	Benefit = "       搜集到奇物後的獎勵增加。",
}

FactionBuildingLvUp.FBuildingList[4][3][5] =
{
	Name = --[[!AUTO_197]]"奇物居",
	-- ImgDir = "",
	Lv = --[[!AUTO_198]]"5",
	--Upgrade = --[[!AUTO_199]]"升级到6级的条件",
	Desc = --[[!AUTO_200]]"       工坊用來收集各種希奇之物的所在。\r       對應功能NPC：奇物居管事",
	Benefit = "       搜集到奇物後的獎勵增加。",
}

FactionBuildingLvUp.FBuildingList[4][3][6] =
{
	Name = --[[!AUTO_201]]"奇物居",
	-- ImgDir = "",
	Lv = --[[!AUTO_202]]"6",
	--Upgrade = --[[!AUTO_203]]"升级到7级的条件",
	Desc = --[[!AUTO_204]]"       工坊用來收集各種希奇之物的所在。\r       對應功能NPC：奇物居管事",
	Benefit = "       搜集到奇物後的獎勵增加。",
}

FactionBuildingLvUp.FBuildingList[4][3][7] =
{
	Name = --[[!AUTO_205]]"奇物居",
	-- ImgDir = "",
	Lv = --[[!AUTO_206]]"7",
	--Upgrade = --[[!AUTO_207]]"升级到8级的条件",
	Desc = --[[!AUTO_208]]"       工坊用來收集各種希奇之物的所在。\r       對應功能NPC：奇物居管事",
	Benefit = "       搜集到奇物後的獎勵增加。",
}

FactionBuildingLvUp.FBuildingList[4][3][8] =
{
	Name = --[[!AUTO_209]]"奇物居",
	-- ImgDir = "",
	Lv = --[[!AUTO_210]]"8",
	--Upgrade = --[[!AUTO_211]]"升级到9级的条件",
	Desc = --[[!AUTO_212]]"       工坊用來收集各種希奇之物的所在。\r       對應功能NPC：奇物居管事",
	Benefit = "       搜集到奇物後的獎勵增加。",
}

FactionBuildingLvUp.FBuildingList[4][3][9] =
{
	Name = --[[!AUTO_213]]"奇物居",
	-- ImgDir = "",
	Lv = --[[!AUTO_214]]"9",
	--Upgrade = --[[!AUTO_215]]"已经达到该建筑最高等级。",
	Desc = --[[!AUTO_216]]"       工坊用來收集各種希奇之物的所在。\r       對應功能NPC：奇物居管事",
	Benefit = "       已經達到該建築最高等級。",
}



-- 厢房表

FactionBuildingLvUp.FBuildingList[1][5][1] =
{
	Name = --[[!AUTO_217]]"廂房",
	-- ImgDir = "",
	Lv = --[[!AUTO_218]]"1",
	--Upgrade = "       宗派等级到达2级\r       物品：原木 1个（在帮会帐房处交纳）",
	Desc = --[[!AUTO_219]]"       宗派成員的棲宿之地，可增加宗派人數上限。",
	Benefit = --[[!AUTO_220]]"       幫派人數上限：+10",
}

FactionBuildingLvUp.FBuildingList[1][5][2] =
{
	Name = --[[!AUTO_221]]"廂房",
	-- ImgDir = "",
	Lv = --[[!AUTO_222]]"2",
	--Upgrade = "       宗派等级到达3级\r       物品：原木 1个（在帮会帐房处交纳）",
	Desc = --[[!AUTO_223]]"       宗派成員的棲宿之地，可增加宗派人數上限。",
	Benefit = --[[!AUTO_224]]"       幫派人數上限：+10",
}

FactionBuildingLvUp.FBuildingList[1][5][3] =
{
	Name = --[[!AUTO_225]]"廂房",
	-- ImgDir = "",
	Lv = --[[!AUTO_226]]"3",
	--Upgrade = "       宗派等级到达4级\r       物品：原木 1个（在帮会帐房处交纳）",
	Desc = --[[!AUTO_227]]"       宗派成員的棲宿之地，可增加宗派人數上限。",
	Benefit = --[[!AUTO_228]]"       幫派人數上限：+15",
}

FactionBuildingLvUp.FBuildingList[1][5][4] =
{
	Name = --[[!AUTO_229]]"廂房",
	-- ImgDir = "",
	Lv = --[[!AUTO_230]]"4",
	--Upgrade = "       宗派等级到达5级\r       物品：原木 1个（在帮会帐房处交纳）",
	Desc = --[[!AUTO_231]]"       宗派成員的棲宿之地，可增加宗派人數上限。",
	Benefit = --[[!AUTO_232]]"       幫派人數上限：+15",
}

FactionBuildingLvUp.FBuildingList[1][5][5] =
{
	Name = --[[!AUTO_233]]"廂房",
	-- ImgDir = "",
	Lv = --[[!AUTO_234]]"5",
	--Upgrade = "       宗派等级到达6级\r       物品：原木 1个（在帮会帐房处交纳）",
	Desc = --[[!AUTO_235]]"       宗派成員的棲宿之地，可增加宗派人數上限。",
	Benefit = --[[!AUTO_236]]"       幫派人數上限：+20",
}

FactionBuildingLvUp.FBuildingList[1][5][6] =
{
	Name = --[[!AUTO_237]]"廂房",
	-- ImgDir = "",
	Lv = --[[!AUTO_238]]"6",
	--Upgrade = "       宗派等级到达7级\r       物品：原木 1个（在帮会帐房处交纳）",
	Desc = --[[!AUTO_239]]"       宗派成員的棲宿之地，可增加宗派人數上限。",
	Benefit = --[[!AUTO_240]]"       幫派人數上限：+10。",
}

FactionBuildingLvUp.FBuildingList[1][5][7] =
{
	Name = --[[!AUTO_241]]"廂房",
	-- ImgDir = "",
	Lv = --[[!AUTO_242]]"7",
	--Upgrade = "       宗派等级到达8级\r       物品：原木 1个（在帮会帐房处交纳）",
	Desc = --[[!AUTO_243]]"       宗派成員的棲宿之地，可增加宗派人數上限。",
	Benefit = --[[!AUTO_244]]"       幫派人數上限：+5。",
}

FactionBuildingLvUp.FBuildingList[1][5][8] =
{
	Name = --[[!AUTO_245]]"廂房",
	-- ImgDir = "",
	Lv = --[[!AUTO_246]]"8",
	--Upgrade = "       宗派等级到达9级\r       物品：原木 1个（在帮会帐房处交纳）",
	Desc = --[[!AUTO_247]]"       宗派成員的棲宿之地，可增加宗派人數上限。",
	Benefit = --[[!AUTO_248]]"       幫派人數上限：+5。",
}

FactionBuildingLvUp.FBuildingList[1][5][9] =
{
	Name = --[[!AUTO_249]]"廂房",
	-- ImgDir = "",
	Lv = --[[!AUTO_250]]"9",
	--Upgrade = "已经达到该建筑最高等级",
	Desc = --[[!AUTO_251]]"       宗派成員的棲宿之地，可增加宗派人數上限。",
	Benefit = --[[!AUTO_252]]"       已經達到該建築最高等級",
}

-- 将此表的内容拷贝到其他宗派中厢房表内
FactionBuildingLvUp.FBuildingList[4][5] = FactionBuildingLvUp.FBuildingList[1][5]
FactionBuildingLvUp.FBuildingList[3][5] = FactionBuildingLvUp.FBuildingList[1][5]
FactionBuildingLvUp.FBuildingList[2][5] = FactionBuildingLvUp.FBuildingList[1][5]



-- 祭坛表

FactionBuildingLvUp.FBuildingList[1][6][1] =
{
	Name = --[[!AUTO_253]]"藏寶閣",
	-- ImgDir = "",
	Lv = --[[!AUTO_254]]"1",
	--Upgrade = "       宗派等级到达2级\r       物品：原木 1个（在帮会帐房处交纳）",
	Desc = --[[!AUTO_255]]"       宗派存儲寶物之地，可給宗派成員帶來寶物福利。\r       對應功能NPC：藏寶閣管事",
	Benefit = --[[!AUTO_256]]"       藏寶閣能存儲的寶物數+1。",
}

FactionBuildingLvUp.FBuildingList[1][6][2] =
{
	Name = --[[!AUTO_257]]"藏寶閣",
	-- ImgDir = "",
	Lv = --[[!AUTO_258]]"2",
	--Upgrade = "       宗派等级到达3级\r       物品：原木 1个（在帮会帐房处交纳）",
	Desc = --[[!AUTO_259]]"       宗派存儲寶物之地，可給宗派成員帶來寶物福利。\r       對應功能NPC：藏寶閣管事",
	Benefit = --[[!AUTO_260]]"       藏寶閣能存儲的寶物數+1。",
}

FactionBuildingLvUp.FBuildingList[1][6][3] =
{
	Name = --[[!AUTO_261]]"藏寶閣",
	-- ImgDir = "",
	Lv = --[[!AUTO_262]]"3",
	--Upgrade = "       宗派等级到达4级\r       物品：原木 1个（在帮会帐房处交纳）",
	Desc = --[[!AUTO_263]]"       宗派存儲寶物之地，可給宗派成員帶來寶物福利。\r       對應功能NPC：藏寶閣管事",
	Benefit = --[[!AUTO_264]]"       藏寶閣能存儲的寶物數+1。",
}

FactionBuildingLvUp.FBuildingList[1][6][4] =
{
	Name = --[[!AUTO_265]]"藏寶閣",
	-- ImgDir = "",
	Lv = --[[!AUTO_266]]"4",
	--Upgrade = "       宗派等级到达5级\r       物品：原木 1个（在帮会帐房处交纳）",
	Desc = --[[!AUTO_267]]"       宗派存儲寶物之地，可給宗派成員帶來寶物福利。\r       對應功能NPC：藏寶閣管事",
	Benefit = --[[!AUTO_268]]"       藏寶閣能存儲的寶物數+1。",
}

FactionBuildingLvUp.FBuildingList[1][6][5] =
{
	Name = --[[!AUTO_269]]"藏寶閣",
	-- ImgDir = "",
	Lv = --[[!AUTO_270]]"5",
	--Upgrade = "       宗派等级到达6级\r       物品：原木 1个（在帮会帐房处交纳）",
	Desc = --[[!AUTO_271]]"       宗派存儲寶物之地，可給宗派成員帶來寶物福利。\r       對應功能NPC：藏寶閣管事",
	Benefit = --[[!AUTO_272]]"       藏寶閣能存儲的寶物數+1。",
}

FactionBuildingLvUp.FBuildingList[1][6][6] =
{
	Name = --[[!AUTO_273]]"藏寶閣",
	-- ImgDir = "",
	Lv = --[[!AUTO_274]]"6",
	--Upgrade = "       宗派等级到达7级\r       物品：原木 1个（在帮会帐房处交纳）",
	Desc = --[[!AUTO_275]]"       宗派存儲寶物之地，可給宗派成員帶來寶物福利。\r       對應功能NPC：藏寶閣管事",
	Benefit = --[[!AUTO_276]]"       藏寶閣能存儲的寶物數+1。",
}

FactionBuildingLvUp.FBuildingList[1][6][7] =
{
	Name = --[[!AUTO_277]]"藏寶閣",
	-- ImgDir = "",
	Lv = --[[!AUTO_278]]"7",
	--Upgrade = "       宗派等级到达8级\r       物品：原木 1个（在帮会帐房处交纳）",
	Desc = --[[!AUTO_279]]"       宗派存儲寶物之地，可給宗派成員帶來寶物福利。\r       對應功能NPC：藏寶閣管事",
	Benefit = --[[!AUTO_280]]"       藏寶閣能存儲的寶物數+1。",
}

FactionBuildingLvUp.FBuildingList[1][6][8] =
{
	Name = --[[!AUTO_281]]"藏寶閣",
	-- ImgDir = "",
	Lv = --[[!AUTO_282]]"8",
	--Upgrade = "       宗派等级到达9级\r       物品：原木 1个（在帮会帐房处交纳）",
	Desc = --[[!AUTO_283]]"       宗派存儲寶物之地，可給宗派成員帶來寶物福利。\r       對應功能NPC：藏寶閣管事",
	Benefit = --[[!AUTO_284]]"       藏寶閣能存儲的寶物數+1。",
}

FactionBuildingLvUp.FBuildingList[1][6][9] =
{
	Name = --[[!AUTO_285]]"藏寶閣",
	-- ImgDir = "",
	Lv = --[[!AUTO_286]]"9",
	--Upgrade = "已经达到该建筑最高等级。",
	Desc = --[[!AUTO_287]]"       宗派存儲寶物之地，可給宗派成員帶來寶物福利。\r       對應功能NPC：藏寶閣管事",
	Benefit = --[[!AUTO_288]]"       已經達到該建築最高等級。",
}

-- 将此表的内容拷贝到其他宗派中厢房表内
FactionBuildingLvUp.FBuildingList[4][6] = FactionBuildingLvUp.FBuildingList[1][6]
FactionBuildingLvUp.FBuildingList[3][6] = FactionBuildingLvUp.FBuildingList[1][6]
FactionBuildingLvUp.FBuildingList[2][6] = FactionBuildingLvUp.FBuildingList[1][6]




-- 广场表

FactionBuildingLvUp.FBuildingList[1][7][1] =
{
	Name = --[[!AUTO_289]]"廣場",
	-- ImgDir = "",
	Lv = --[[!AUTO_290]]"1",
	--Upgrade = "       宗派等级到达2级\r       物品：原木 1个（在帮会帐房处交纳）",
	Desc = --[[!AUTO_291]]"       每週可在活動使處開啟2次百藥門入侵活動。",
	Benefit = --[[!AUTO_292]]"       每週可開啟2次百藥門入侵活動。",
}



FactionBuildingLvUp.FBuildingList[1][7][2] =
{
	Name = --[[!AUTO_293]]"廣場",
	-- ImgDir = "",
	Lv = --[[!AUTO_294]]"2",
	--Upgrade = "       宗派等级到达3级\r       物品：原木 1个（在帮会帐房处交纳）",
	Desc = --[[!AUTO_295]]"       每週可在活動使處開啟2次百藥門入侵活動。",
	Benefit = --[[!AUTO_296]]"       每週可開啟3次百藥門入侵活動。",
}

FactionBuildingLvUp.FBuildingList[1][7][3] =
{
	Name = --[[!AUTO_297]]"廣場",
	-- ImgDir = "",
	Lv = --[[!AUTO_298]]"3",
	--Upgrade = "       宗派等级到达4级\r       物品：原木 1个（在帮会帐房处交纳）",
	Desc = --[[!AUTO_299]]"       每週可在活動使處開啟3次百藥門入侵活動。",
	Benefit = --[[!AUTO_300]]"       每週可開啟3次百藥門入侵活動。",
}

FactionBuildingLvUp.FBuildingList[1][7][4] =
{
	Name = --[[!AUTO_301]]"廣場",
	-- ImgDir = "",
	Lv = --[[!AUTO_302]]"4",
	--Upgrade = "       宗派等级到达5级\r       物品：原木 1个（在帮会帐房处交纳）",
	Desc = --[[!AUTO_303]]"       每週可在活動使處開啟3次百藥門入侵活動。",
	Benefit = --[[!AUTO_304]]"       每週可開啟4次百藥門入侵活動。",
}

FactionBuildingLvUp.FBuildingList[1][7][5] =
{
	Name = --[[!AUTO_305]]"廣場",
	-- ImgDir = "",
	Lv = --[[!AUTO_306]]"5",
	--Upgrade = "       宗派等级到达6级\r       物品：原木 1个（在帮会帐房处交纳）",
	Desc = --[[!AUTO_307]]"       每週可在活動使處開啟4次百藥門入侵活動。",
	Benefit = --[[!AUTO_308]]"       每週可開啟4次百藥門入侵活動。",
}

FactionBuildingLvUp.FBuildingList[1][7][6] =
{
	Name = --[[!AUTO_309]]"廣場",
	-- ImgDir = "",
	Lv = --[[!AUTO_310]]"6",
	--Upgrade = "       宗派等级到达7级\r       物品：原木 1个（在帮会帐房处交纳）",
	Desc = --[[!AUTO_311]]"       每週可在活動使處開啟4次百藥門入侵活動。",
	Benefit = --[[!AUTO_312]]"       每週可開啟5次百藥門入侵活動。",
}

FactionBuildingLvUp.FBuildingList[1][7][7] =
{
	Name = --[[!AUTO_313]]"廣場",
	-- ImgDir = "",
	Lv = --[[!AUTO_314]]"7",
	--Upgrade = "       宗派等级到达8级\r       物品：原木 1个（在帮会帐房处交纳）",
	Desc = --[[!AUTO_315]]"       每週可在活動使處開啟5次百藥門入侵活動。",
	Benefit = --[[!AUTO_316]]"      每週可開啟5次百藥門入侵活動。",
}

FactionBuildingLvUp.FBuildingList[1][7][8] =
{
	Name = --[[!AUTO_317]]"廣場",
	-- ImgDir = "",
	Lv = --[[!AUTO_318]]"8",
	--Upgrade = "       宗派等级到达9级\r       物品：原木 1个（在帮会帐房处交纳）",
	Desc = --[[!AUTO_319]]"       每週可在活動使處開啟5次百藥門入侵活動。",
	Benefit = --[[!AUTO_320]]"       每週可開啟6次百藥門入侵活動。",
}

FactionBuildingLvUp.FBuildingList[1][7][9] =
{
	Name = --[[!AUTO_321]]"廣場",
	-- ImgDir = "",
	Lv = --[[!AUTO_322]]"9",
	--Upgrade = "已经达到该建筑最高等级。",
	Desc = --[[!AUTO_323]]"       每週可在活動使處開啟6次百藥門入侵活動。",
	Benefit = --[[!AUTO_324]]"       已經達到該建築最高等級。",
}

-- 将此表的内容拷贝到其他宗派中广场表内
FactionBuildingLvUp.FBuildingList[4][7] = FactionBuildingLvUp.FBuildingList[1][7]
FactionBuildingLvUp.FBuildingList[3][7] = FactionBuildingLvUp.FBuildingList[1][7]
FactionBuildingLvUp.FBuildingList[2][7] = FactionBuildingLvUp.FBuildingList[1][7]



--镖局专有建筑2表

FactionBuildingLvUp.FBuildingList[1][11][1] =
{
	Name = --[[!AUTO_325]]"情報屋",
	-- ImgDir = "",
	Lv = --[[!AUTO_326]]"1",
	--Upgrade = "       宗派等级到达2级\r       物品：原木 1个（在帮会帐房处交纳）",
	Desc = --[[!AUTO_327]]"       鏢局用來給登記失鏢情況，並追尋失鏢下落的部門。\r       對應功能NPC：聞人司",
	Benefit = --[[!AUTO_328]]"       提供回報更高的調查任務。",
}

FactionBuildingLvUp.FBuildingList[1][11][2] =
{
	Name = --[[!AUTO_329]]"情報屋",
	-- ImgDir = "",
	Lv = --[[!AUTO_330]]"2",
	--Upgrade = "       宗派等级到达3级\r       物品：原木 1个（在帮会帐房处交纳）",
	Desc = --[[!AUTO_331]]"       鏢局用來給登記失鏢情況，並追尋失鏢下落的部門。\r       對應功能NPC：聞人司",
	Benefit = --[[!AUTO_332]]"       提供回報更高的調查任務。",
}

FactionBuildingLvUp.FBuildingList[1][11][3] =
{
	Name = --[[!AUTO_333]]"情報屋",
	-- ImgDir = "",
	Lv = --[[!AUTO_334]]"3",
	--Upgrade = "       宗派等级到达4级\r       物品：原木 1个（在帮会帐房处交纳）",
	Desc = --[[!AUTO_335]]"       鏢局用來給登記失鏢情況，並追尋失鏢下落的部門。\r       對應功能NPC：聞人司",
	Benefit = --[[!AUTO_336]]"       提供回報更高的調查任務。",
}

FactionBuildingLvUp.FBuildingList[1][11][4] =
{
	Name = --[[!AUTO_337]]"情報屋",
	-- ImgDir = "",
	Lv = --[[!AUTO_338]]"4",
	--Upgrade = "       宗派等级到达5级\r       物品：原木 1个（在帮会帐房处交纳）",
	Desc = --[[!AUTO_339]]"       鏢局用來給登記失鏢情況，並追尋失鏢下落的部門。\r       對應功能NPC：聞人司",
	Benefit = --[[!AUTO_340]]"       提供回報更高的調查任務。",
}

FactionBuildingLvUp.FBuildingList[1][11][5] =
{
	Name = --[[!AUTO_341]]"情報屋",
	-- ImgDir = "",
	Lv = --[[!AUTO_342]]"5",
	--Upgrade = "       宗派等级到达6级\r       物品：原木 1个（在帮会帐房处交纳）",
	Desc = --[[!AUTO_343]]"       鏢局用來給登記失鏢情況，並追尋失鏢下落的部門。\r       對應功能NPC：聞人司",
	Benefit = --[[!AUTO_344]]"       提供回報更高的調查任務。",
}

FactionBuildingLvUp.FBuildingList[1][11][6] =
{
	Name = --[[!AUTO_345]]"情報屋",
	-- ImgDir = "",
	Lv = --[[!AUTO_346]]"6",
	--Upgrade = "       宗派等级到达7级\r       物品：原木 1个（在帮会帐房处交纳）",
	Desc = --[[!AUTO_347]]"       鏢局用來給登記失鏢情況，並追尋失鏢下落的部門。\r       對應功能NPC：聞人司",
	Benefit = --[[!AUTO_348]]"       提供回報更高的調查任務。",
}

FactionBuildingLvUp.FBuildingList[1][11][7] =
{
	Name = --[[!AUTO_349]]"情報屋",
	-- ImgDir = "",
	Lv = --[[!AUTO_350]]"7",
	--Upgrade = "       宗派等级到达8级\r       物品：原木 1个（在帮会帐房处交纳）",
	Desc = --[[!AUTO_351]]"       鏢局用來給登記失鏢情況，並追尋失鏢下落的部門。\r       對應功能NPC：聞人司",
	Benefit = --[[!AUTO_352]]"       提供回報更高的調查任務。",
}

FactionBuildingLvUp.FBuildingList[1][11][8] =
{
	Name = --[[!AUTO_353]]"情報屋",
	-- ImgDir = "",
	Lv = --[[!AUTO_354]]"8",
	--Upgrade = "       宗派等级到达9级\r       物品：原木 1个（在帮会帐房处交纳）",
	Desc = --[[!AUTO_355]]"       鏢局用來給登記失鏢情況，並追尋失鏢下落的部門。\r       對應功能NPC：聞人司",
	Benefit = --[[!AUTO_356]]"       提供回報更高的調查任務。",
}

FactionBuildingLvUp.FBuildingList[1][11][9] =
{
	Name = --[[!AUTO_357]]"情報屋",
	-- ImgDir = "",
	Lv = --[[!AUTO_358]]"9",
	--Upgrade = "已经达到该建筑最高等级。",
	Desc = --[[!AUTO_359]]"       鏢局用來給登記失鏢情況，並追尋失鏢下落的部門。\r       對應功能NPC：聞人司",
	Benefit = --[[!AUTO_360]]"       已經達到該建築最高等級。",
}

--马帮专有建筑2表

FactionBuildingLvUp.FBuildingList[2][11][1] =
{
	Name = --[[!AUTO_361]]"待定",
	-- ImgDir = "",
	Lv = --[[!AUTO_362]]"1",
	Upgrade = --[[!AUTO_363]]"升級到2級的條件",
	Desc = --[[!AUTO_364]]"待定",
}

FactionBuildingLvUp.FBuildingList[2][11][2] =
{
	Name = --[[!AUTO_365]]"待定",
	-- ImgDir = "",
	Lv = --[[!AUTO_366]]"2",
	Upgrade = --[[!AUTO_367]]"升級到3級的條件",
	Desc = --[[!AUTO_368]]"待定",
}

FactionBuildingLvUp.FBuildingList[2][11][3] =
{
	Name = --[[!AUTO_369]]"待定",
	-- ImgDir = "",
	Lv = --[[!AUTO_370]]"3",
	Upgrade = --[[!AUTO_371]]"升級到4級的條件",
	Desc = --[[!AUTO_372]]"待定",
}

FactionBuildingLvUp.FBuildingList[2][11][4] =
{
	Name = --[[!AUTO_373]]"待定",
	-- ImgDir = "",
	Lv = --[[!AUTO_374]]"4",
	Upgrade = --[[!AUTO_375]]"升級到5級的條件",
	Desc = --[[!AUTO_376]]"待定",
}

FactionBuildingLvUp.FBuildingList[2][11][5] =
{
	Name = --[[!AUTO_377]]"待定",
	-- ImgDir = "",
	Lv = --[[!AUTO_378]]"5",
	Upgrade = --[[!AUTO_379]]"升級到6級的條件",
	Desc = --[[!AUTO_380]]"待定",
}

FactionBuildingLvUp.FBuildingList[2][11][6] =
{
	Name = --[[!AUTO_381]]"待定",
	-- ImgDir = "",
	Lv = --[[!AUTO_382]]"6",
	Upgrade = --[[!AUTO_383]]"升級到7級的條件",
	Desc = --[[!AUTO_384]]"待定",
}

FactionBuildingLvUp.FBuildingList[2][11][7] =
{
	Name = --[[!AUTO_385]]"待定",
	-- ImgDir = "",
	Lv = --[[!AUTO_386]]"7",
	Upgrade = --[[!AUTO_387]]"升級到8級的條件",
	Desc = --[[!AUTO_388]]"待定",
}

FactionBuildingLvUp.FBuildingList[2][11][8] =
{
	Name = --[[!AUTO_389]]"待定",
	-- ImgDir = "",
	Lv = --[[!AUTO_390]]"8",
	Upgrade = --[[!AUTO_391]]"升級到2級的條件",
	Desc = --[[!AUTO_392]]"待定",
}

FactionBuildingLvUp.FBuildingList[2][11][9] =
{
	Name = --[[!AUTO_393]]"待定",
	-- ImgDir = "",
	Lv = --[[!AUTO_394]]"9",
	Upgrade = --[[!AUTO_395]]"升級到9級的條件",
	Desc = --[[!AUTO_396]]"待定",
}

--山寨专有建筑2表


FactionBuildingLvUp.FBuildingList[3][11][1] =
{
	Name = --[[!AUTO_397]]"刑訊室",
	-- ImgDir = "",
	Lv = --[[!AUTO_398]]"1",
	--Upgrade = "       宗派等级到达2级\r       物品：原木 1个（在帮会帐房处交纳）",
	Desc = --[[!AUTO_399]]"       山寨用來獲取劫鏢資訊的地方。\r       對應功能NPC：掌刑使",
	Benefit = --[[!AUTO_400]]"       可以囚禁更多的人質，拷問肉票能獲得更有用的口供。",
}

FactionBuildingLvUp.FBuildingList[3][11][2] =
{
	Name = --[[!AUTO_401]]"刑訊室",
	-- ImgDir = "",
	Lv = --[[!AUTO_402]]"2",
	--Upgrade = "       宗派等级到达3级\r       物品：原木 1个（在帮会帐房处交纳）",
	Desc = --[[!AUTO_403]]"       山寨用來獲取劫鏢資訊的地方。\r       對應功能NPC：掌刑使\r\r升級好處：\r       可以囚禁更多的人質，拷問肉票能獲得更有用的口供。",
	Benefit = --[[!AUTO_404]]"       可以囚禁更多的人質，拷問肉票能獲得更有用的口供。",
}

FactionBuildingLvUp.FBuildingList[3][11][3] =
{
	Name = --[[!AUTO_405]]"刑訊室",
	-- ImgDir = "",
	Lv = --[[!AUTO_406]]"3",
	--Upgrade = "       宗派等级到达4级\r       物品：原木 1个（在帮会帐房处交纳）",
	Desc = --[[!AUTO_407]]"       山寨用來獲取劫鏢資訊的地方。\r       對應功能NPC：掌刑使\r\r升級好處：\r       可以囚禁更多的人質，拷問肉票能獲得更有用的口供。",
	Benefit = --[[!AUTO_408]]"       可以囚禁更多的人質，拷問肉票能獲得更有用的口供。",
}

FactionBuildingLvUp.FBuildingList[3][11][4] =
{
	Name = --[[!AUTO_409]]"刑訊室",
	-- ImgDir = "",
	Lv = --[[!AUTO_410]]"4",
	--Upgrade = "       宗派等级到达5级\r       物品：原木 1个（在帮会帐房处交纳）",
	Desc = --[[!AUTO_411]]"       山寨用來獲取劫鏢資訊的地方。\r       對應功能NPC：掌刑使",
	Benefit = --[[!AUTO_412]]"       可以囚禁更多的人質，拷問肉票能獲得更有用的口供。",
}

FactionBuildingLvUp.FBuildingList[3][11][5] =
{
	Name = --[[!AUTO_413]]"刑訊室",
	-- ImgDir = "",
	Lv = --[[!AUTO_414]]"5",
	--Upgrade = "       宗派等级到达6级\r       物品：原木 1个（在帮会帐房处交纳）",
	Desc = --[[!AUTO_415]]"       山寨用來獲取劫鏢資訊的地方。\r       對應功能NPC：掌刑使",
	Benefit = --[[!AUTO_416]]"       可以囚禁更多的人質，拷問肉票能獲得更有用的口供。",
}

FactionBuildingLvUp.FBuildingList[3][11][6] =
{
	Name = --[[!AUTO_417]]"刑訊室",
	-- ImgDir = "",
	Lv = --[[!AUTO_418]]"6",
	--Upgrade = "       宗派等级到达7级\r       物品：原木 1个（在帮会帐房处交纳）",
	Desc = --[[!AUTO_419]]"       山寨用來獲取劫鏢資訊的地方。\r       對應功能NPC：掌刑使",
	Benefit = --[[!AUTO_420]]"       可以囚禁更多的人質，拷問肉票能獲得更有用的口供。",
}

FactionBuildingLvUp.FBuildingList[3][11][7] =
{
	Name = --[[!AUTO_421]]"刑訊室",
	-- ImgDir = "",
	Lv = --[[!AUTO_422]]"7",
	--Upgrade = "       宗派等级到达8级\r       物品：原木 1个（在帮会帐房处交纳）",
	Desc = --[[!AUTO_423]]"       山寨用來獲取劫鏢資訊的地方。\r       對應功能NPC：掌刑使",
	Benefit = --[[!AUTO_424]]"       可以囚禁更多的人質，拷問肉票能獲得更有用的口供。",
}

FactionBuildingLvUp.FBuildingList[3][11][8] =
{
	Name = --[[!AUTO_425]]"刑訊室",
	-- ImgDir = "",
	Lv = --[[!AUTO_426]]"8",
	--Upgrade = "       宗派等级到达9级\r       物品：原木 1个（在帮会帐房处交纳）",
	Desc = --[[!AUTO_427]]"       山寨用來獲取劫鏢資訊的地方。\r       對應功能NPC：掌刑使",
	Benefit = --[[!AUTO_428]]"       可以囚禁更多的人質，拷問肉票能獲得更有用的口供。",
}

FactionBuildingLvUp.FBuildingList[3][11][9] =
{
	Name = --[[!AUTO_429]]"刑訊室",
	-- ImgDir = "",
	Lv = --[[!AUTO_430]]"9",
	--Upgrade = "已经达到该建筑最高等级",
	Desc = --[[!AUTO_431]]"       山寨用來獲取劫鏢資訊的地方。\r       對應功能NPC：掌刑使",
	Benefit = --[[!AUTO_432]]"       已經達到該建築最高等級",
}

--工坊专有建筑2表


FactionBuildingLvUp.FBuildingList[4][11][1] =
{
	Name = --[[!AUTO_433]]"物料司",
	-- ImgDir = "",
	Lv = --[[!AUTO_434]]"1",
	--Upgrade = --[[!AUTO_435]]"升级到2级的条件",
	Desc = --[[!AUTO_436]]"       工坊用來獲取調配人力與物資的地方。\r       對應功能NPC：物料使",
	Benefit = "       可以提高接取到中高品質監工任務的概率。",
}

FactionBuildingLvUp.FBuildingList[4][11][2] =
{
	Name = --[[!AUTO_437]]"物料司",
	-- ImgDir = "",
	Lv = --[[!AUTO_438]]"2",
	--Upgrade = --[[!AUTO_439]]"升级到3级的条件",
	Desc = --[[!AUTO_440]]"       工坊用來獲取調配人力與物資的地方。\r       對應功能NPC：物料使",
	Benefit = "       可以提高接取到中高品質監工任務的概率。",
}

FactionBuildingLvUp.FBuildingList[4][11][3] =
{
	Name = --[[!AUTO_441]]"物料司",
	-- ImgDir = "",
	Lv = --[[!AUTO_442]]"3",
	--Upgrade = --[[!AUTO_443]]"升级到4级的条件",
	Desc = --[[!AUTO_444]]"       工坊用來獲取調配人力與物資的地方。\r       對應功能NPC：物料使",
	Benefit = "       可以提高接取到中高品質監工任務的概率。",
}

FactionBuildingLvUp.FBuildingList[4][11][4] =
{
	Name = --[[!AUTO_445]]"物料司",
	-- ImgDir = "",
	Lv = --[[!AUTO_446]]"4",
	--Upgrade = --[[!AUTO_447]]"升级到5级的条件",
	Desc = --[[!AUTO_448]]"       工坊用來獲取調配人力與物資的地方。\r       對應功能NPC：物料使",
	Benefit = "       可以提高接取到中高品質監工任務的概率。",
}

FactionBuildingLvUp.FBuildingList[4][11][5] =
{
	Name = --[[!AUTO_449]]"物料司",
	-- ImgDir = "",
	Lv = --[[!AUTO_450]]"5",
	--Upgrade = --[[!AUTO_451]]"升级到6级的条件",
	Desc = --[[!AUTO_452]]"       工坊用來獲取調配人力與物資的地方。\r       對應功能NPC：物料使",
	Benefit = "       可以提高接取到中高品質監工任務的概率。",
}

FactionBuildingLvUp.FBuildingList[4][11][6] =
{
	Name = --[[!AUTO_453]]"物料司",
	-- ImgDir = "",
	Lv = --[[!AUTO_454]]"6",
	--Upgrade = --[[!AUTO_455]]"升级到7级的条件",
	Desc = --[[!AUTO_456]]"       工坊用來獲取調配人力與物資的地方。\r       對應功能NPC：物料使",
	Benefit = "       可以提高接取到中高品質監工任務的概率。",
}

FactionBuildingLvUp.FBuildingList[4][11][7] =
{
	Name = --[[!AUTO_457]]"物料司",
	-- ImgDir = "",
	Lv = --[[!AUTO_458]]"7",
	--Upgrade = --[[!AUTO_459]]"升级到8级的条件",
	Desc = --[[!AUTO_460]]"       工坊用來獲取調配人力與物資的地方。\r       對應功能NPC：物料使",
	Benefit = "       可以提高接取到中高品質監工任務的概率。",
}

FactionBuildingLvUp.FBuildingList[4][11][8] =
{
	Name = --[[!AUTO_461]]"物料司",
	-- ImgDir = "",
	Lv = --[[!AUTO_462]]"8",
	--Upgrade = --[[!AUTO_463]]"升级到2级的条件",
	Desc = --[[!AUTO_464]]"       工坊用來獲取調配人力與物資的地方。\r       對應功能NPC：物料使",
	Benefit = "       可以提高接取到中高品質監工任務的概率。",
}

FactionBuildingLvUp.FBuildingList[4][11][9] =
{
	Name = --[[!AUTO_465]]"物料司",
	-- ImgDir = "",
	Lv = --[[!AUTO_466]]"9",
	--Upgrade = --[[!AUTO_467]]"升级到9级的条件",
	Desc = --[[!AUTO_468]]"       工坊用來獲取調配人力與物資的地方。\r       對應功能NPC：物料使",
	Benefit = "       已經達到該建築最高等級",
}



function FactionBuildingLvUp:GetMaxLv()				-- 返回最大等级

	num = 9
	return num
end

function FactionBuildingLvUp:GetBuilding(fn,id,lv)			-- 返回指定的建筑信息，[宗派种类ID][建筑ID][建筑等级]
	if FactionBuildingLvUp.FBuildingList[fn][id][lv] then
		return FactionBuildingLvUp.FBuildingList[fn][id][lv]
	end

	return nil
end

