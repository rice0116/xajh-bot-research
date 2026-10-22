--[[#tag push auto]]

--	生产相关配置脚本
--  created:   2011.3.23

Production = {}

-- 生产技能种类定义 (需与客户端定义一致)
PRODUCE_SKILL_TYPE =
{
	MEDICINE = 0,		--	制药	 6993
	COOK = 1,			--	烹饪	 6994
	SEWING = 2,			--	布帛	 6991
	IRONSMITH = 3,		--	金石	 6990
	ARTIFICER = 4,		--	木革  6992
	ANQI = 5,			--	暗器	85337
	COLLECT = 6,		--	种植  6987
	PASTURE = 7,		--	养殖	 6989
	FISHIING = 8,		--  钓鱼	 14323
	CARPENTER = 9,		--	木匠	 6995
	MINE = 10,			--	采矿	 6988
};

--每类技能id，与 PRODUCE_SKILL_TYPE 一一对应
local skills = {6993, 6994, 6991, 6990, 6992, 85337,--[[测试一下]] 6987, 6989, 14323, 6995, 6988,}

function Production:GetSkillIdByType (iType)
	return skills[iType+1]
end

-- 客户端显示出的生产技能种类。数量必须与界面一致
local shown_skills=
{
	PRODUCE_SKILL_TYPE.IRONSMITH,
	PRODUCE_SKILL_TYPE.SEWING,
	PRODUCE_SKILL_TYPE.ARTIFICER,
	PRODUCE_SKILL_TYPE.MEDICINE,
	PRODUCE_SKILL_TYPE.COOK,
	PRODUCE_SKILL_TYPE.ANQI,
}

function Production:GetShownSkills()
	return shown_skills
end

local npc_info = {}
npc_info[1] = {prodskill = 6987, npc = 13060, typeid = 0, button_text = --[[!AUTO_1]]"種植", tool = 0, toolname = --[[!AUTO_2]]""}	--种植
npc_info[2] = {prodskill = 6989, npc = 14629, typeid = 0, button_text = --[[!AUTO_3]]"飼養", tool = 0, toolname = --[[!AUTO_4]]""}	--养殖
npc_info[3] = {prodskill = 6988, npc = 13070, typeid = 0, button_text = --[[!AUTO_5]]"", tool = 0, toolname = --[[!AUTO_6]]""}	--采矿
npc_info[4] = {prodskill = 6995, npc = 14623, typeid = 0, button_text = --[[!AUTO_7]]"", tool = 0, toolname = --[[!AUTO_8]]""}	--伐木
npc_info[5] = {prodskill = 14323, npc = 14626, typeid = 0, button_text = --[[!AUTO_9]]"", tool = 0, toolname = --[[!AUTO_10]]""}	--钓鱼
npc_info[6] = {prodskill = 6990, npc = 60292, typeid = 1, button_text = --[[!AUTO_11]]"製造", tool = 60292, toolname = --[[!AUTO_12]]"鐵砧"}	--金石
npc_info[7] = {prodskill = 6992, npc = 60294, typeid = 1, button_text = --[[!AUTO_13]]"製造", tool = 60294, toolname = --[[!AUTO_14]]"工作臺"}	--木革
npc_info[8] = {prodskill = 6991, npc = 60293, typeid = 1, button_text = --[[!AUTO_15]]"製造", tool = 60293, toolname = --[[!AUTO_16]]"織布機"}	--布帛
npc_info[9] = {prodskill = 6993, npc = 60295, typeid = 1, button_text = --[[!AUTO_17]]"製造", tool = 60295, toolname = --[[!AUTO_18]]"藥鼎"}	--制药
npc_info[10] = {prodskill = 6994, npc = 60348, typeid = 1, button_text = --[[!AUTO_19]]"製造", tool = 60348, toolname = --[[!AUTO_20]]"灶台"}	--烹饪


local GatherMap =
{

--钓鱼分布地图

	{Mine = 14195, Map = --[[!AUTO_21]]"仙愁峽、少室山\r洛陽城"},
	{Mine = 14196, Map = --[[!AUTO_22]]"杭州城、仙霞嶺\r廿八鋪、餘杭"},
	{Mine = 14197, Map = --[[!AUTO_23]]"龍泉、福州城\r朱仙鎮、五霸崗\r鑄劍穀"},
	{Mine = 14198, Map = --[[!AUTO_24]]"桂林、南疆\r大理、泰山"},
	{Mine = 14199, Map = --[[!AUTO_25]]"青城山、樂山\r蜀南竹海"},
	{Mine = 14200, Map = --[[!AUTO_26]]"青城山"},
	{Mine = 14201, Map = --[[!AUTO_27]]"青城山"},
	{Mine = 14202, Map = --[[!AUTO_28]]"青城山"},
	{Mine = 14203, Map = --[[!AUTO_29]]"青城山"},
	{Mine = 14204, Map = --[[!AUTO_30]]"青城山"},
	{Mine = 14205, Map = --[[!AUTO_31]]"青城山"},
	{Mine = 14206, Map = --[[!AUTO_32]]"青城山"},
	{Mine = 14207, Map = --[[!AUTO_33]]"青城山"},
	{Mine = 14208, Map = --[[!AUTO_34]]"青城山"},
	{Mine = 14209, Map = --[[!AUTO_35]]"青城山"},
	{Mine = 14210, Map = --[[!AUTO_36]]"青城山"},
	{Mine = 14211, Map = --[[!AUTO_37]]"青城山"},
	{Mine = 14212, Map = --[[!AUTO_38]]"青城山"},
	{Mine = 14213, Map = --[[!AUTO_39]]"青城山"},
	{Mine = 14214, Map = --[[!AUTO_40]]"青城山"},

--采矿分布地图

	{Mine = 14235, Map = --[[!AUTO_41]]"仙愁峽、少室山\r洛陽城"},
	{Mine = 14236, Map = --[[!AUTO_42]]"杭州城、仙霞嶺\r廿八鋪、餘杭"},
	{Mine = 14237, Map = --[[!AUTO_43]]"龍泉、福州城\r朱仙鎮、五霸崗\r鑄劍穀"},
	{Mine = 14238, Map = --[[!AUTO_44]]"桂林、南疆\r大理、泰山"},
	{Mine = 14239, Map = --[[!AUTO_45]]"青城山、樂山\r蜀南竹海"},
	{Mine = 14240, Map = --[[!AUTO_46]]"仙愁峽"},
	{Mine = 14241, Map = --[[!AUTO_47]]"仙愁峽"},
	{Mine = 14242, Map = --[[!AUTO_48]]"仙愁峽"},
	{Mine = 14243, Map = --[[!AUTO_49]]"仙愁峽"},
	{Mine = 14244, Map = --[[!AUTO_50]]"仙愁峽"},
	{Mine = 14245, Map = --[[!AUTO_51]]"仙愁峽"},
	{Mine = 14246, Map = --[[!AUTO_52]]"仙愁峽"},
	{Mine = 14247, Map = --[[!AUTO_53]]"仙愁峽"},
	{Mine = 14248, Map = --[[!AUTO_54]]"仙愁峽"},
	{Mine = 14249, Map = --[[!AUTO_55]]"仙愁峽"},
	{Mine = 14250, Map = --[[!AUTO_56]]"仙愁峽"},
	{Mine = 14251, Map = --[[!AUTO_57]]"仙愁峽"},
	{Mine = 14252, Map = --[[!AUTO_58]]"仙愁峽"},
	{Mine = 14253, Map = --[[!AUTO_59]]"仙愁峽"},
	{Mine = 14254, Map = --[[!AUTO_60]]"仙愁峽"},



--伐木分布地图

	{Mine = 14215, Map = --[[!AUTO_61]]"仙愁峽、少室山\r洛陽城"},
	{Mine = 14216, Map = --[[!AUTO_62]]"杭州城、仙霞嶺\r廿八鋪、餘杭"},
	{Mine = 14217, Map = --[[!AUTO_63]]"桂林、南疆\r大理、泰山"},
	{Mine = 14218, Map = --[[!AUTO_64]]"青城山、樂山\r蜀南竹海"},
	{Mine = 14219, Map = --[[!AUTO_65]]"龍泉"},
	{Mine = 14220, Map = --[[!AUTO_66]]"龍泉"},
	{Mine = 14221, Map = --[[!AUTO_67]]"龍泉"},
	{Mine = 14222, Map = --[[!AUTO_68]]"龍泉"},
	{Mine = 14223, Map = --[[!AUTO_69]]"龍泉"},
	{Mine = 14224, Map = --[[!AUTO_70]]"龍泉"},
	{Mine = 14225, Map = --[[!AUTO_71]]"龍泉"},
	{Mine = 14226, Map = --[[!AUTO_72]]"龍泉"},
	{Mine = 14227, Map = --[[!AUTO_73]]"龍泉"},
	{Mine = 14228, Map = --[[!AUTO_74]]"龍泉"},
	{Mine = 14229, Map = --[[!AUTO_75]]"龍泉"},
	{Mine = 14230, Map = --[[!AUTO_76]]"龍泉"},
	{Mine = 14231, Map = --[[!AUTO_77]]"龍泉"},
	{Mine = 14232, Map = --[[!AUTO_78]]"龍泉"},
	{Mine = 14233, Map = --[[!AUTO_79]]"龍泉"},
	{Mine = 14234, Map = --[[!AUTO_80]]"龍泉"},

}


function Production:GetProductionGatherMap(MineID)
	for k,v in pairs(GatherMap) do
		if  v.Mine ~= 0 and v.Mine == MineID then
			 return v.Map
		end
	end
end



function Production:GetProductionNPCInfo()
	return npc_info
end

--[[
26267 织布机	布帛
26265 铁毡		金石
26266 木工桌	木革
26263 灶台		烹饪
26264 药鼎		制药
--]]

--返回生产工具链接
function Production:GetToolsLink(id,color)
	for k,v in pairs(npc_info) do
		if v.tool ~= 0 and v.tool == id then
			if ObjInfo[v.npc] then
				local x = ObjInfo[v.npc].x
				local y = ObjInfo[v.npc].y
				local z = ObjInfo[v.npc].z
				local mapid = ObjInfo[v.npc].SID
				return TaskHelp:BuildPathLink(x,y,z,mapid,color,TaskHelp.TARGET_POS,0,0,v.toolname)
			end
		end
	end

	return --[[!AUTO_81]]"error"
end

--返回绑定面板文字
function Production:GetBindDesc(ToolID)

	for k,v in pairs(npc_info) do
		if  v.tool ~= 0 and v.tool == ToolID then
			 return string.format(--[[!AUTO_82]]"使用%s", v.toolname)
		end
	end

end

-----------------生产指数与运势--------------------
-- 用于 interfaces\producefortune.lua

local TimeDescriptionData =
{ --[[!AUTO_83]]"子時", --[[!AUTO_84]]"醜時", --[[!AUTO_85]]"寅時", --[[!AUTO_86]]"卯時", --[[!AUTO_87]]"辰時", --[[!AUTO_88]]"巳時", --[[!AUTO_89]]"午時", --[[!AUTO_90]]"未時", --[[!AUTO_91]]"申時", --[[!AUTO_92]]"酉時", --[[!AUTO_93]]"戌時", --[[!AUTO_94]]"亥時" }

local ProductivityRankData =
{
	-- {ratio={时辰1比例, 时辰2比例, ...}, level=星级, name=名称, description=描述}
	{ratio={1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12}, level=1, name=--[[!AUTO_95]]"大凶", description=--[[!AUTO_96]]"求魚須當向水中，樹上求之不順情。受盡爬揭難遂意，勞而無功事不成。"},
	{ratio={1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12}, level=1, name=--[[!AUTO_97]]"凶", description=--[[!AUTO_98]]"大雨傾地雪滿天，路上行人苦又難。拖泥帶水費盡力，事不遂心且耐煩。"},
	{ratio={1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12}, level=1, name=--[[!AUTO_99]]"凶", description=--[[!AUTO_100]]"販賣豬羊運不遂，卦占行人永不回。勞動出門無好處，交易求財且莫為。"},
	{ratio={1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12}, level=2, name=--[[!AUTO_101]]"小凶", description=--[[!AUTO_102]]"雨雪載途甚泥濘，交易不定難出行。疾病拖拉經營慢，謀望求財事不成。"},
	{ratio={1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12}, level=2, name=--[[!AUTO_103]]"小凶", description=--[[!AUTO_104]]"時運不至費心多，比做推車受折磨。山路崎嶇掉下耳，左插右按按不著。"},
	{ratio={1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12}, level=2, name=--[[!AUTO_105]]"小凶", description=--[[!AUTO_106]]"飛鳥失機落籠中，縱然奮飛不能騰。目下只宜求平靜，要想扒高萬不能。"},
	{ratio={1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12}, level=3, name=--[[!AUTO_107]]"平平", description=--[[!AUTO_108]]"求魚順當向水中，樹上求之不順情。受盡爬竭難遂意，勞而無功運平平。"},
	{ratio={1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12}, level=3, name=--[[!AUTO_109]]"平平", description=--[[!AUTO_110]]"二人爭路未肯祥，占者逢之費主張。交易出門有阻礙，生意合夥也平常。"},
	{ratio={1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12}, level=3, name=--[[!AUTO_111]]"平平", description=--[[!AUTO_112]]"苗逢旱天盡焦稍，誰想雲濃雨不澆。農人仰面長籲氣，是從疑來莫心高。"},
	{ratio={1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12}, level=4, name=--[[!AUTO_113]]"小吉", description=--[[!AUTO_114]]"魚翁得利喜自然，定是求財兩周全。採礦伐木也得利，卦若逢之喜氣添。"},
	{ratio={1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12}, level=4, name=--[[!AUTO_115]]"小吉", description=--[[!AUTO_116]]"這個卦象真有趣，生產做事不費力。休要錯過這機會，事事就覺遂心意。"},
	{ratio={1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12}, level=4, name=--[[!AUTO_117]]"小吉", description=--[[!AUTO_118]]"示人來占必得名，生意買賣也興隆。匠藝逢之交易好，農間莊稼也收成。"},
	{ratio={1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12}, level=5, name=--[[!AUTO_119]]"吉", description=--[[!AUTO_120]]"工師得木喜重重，買賣求財大亨通。採集製造皆如意，一切謀望俱有功。"},
	{ratio={1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12}, level=5, name=--[[!AUTO_121]]"吉", description=--[[!AUTO_122]]"游魚戲水被網驚，跳過龍門身化龍。三尺楊柳垂金線，萬朵桃化顯你能。"},
	{ratio={1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12}, level=5, name=--[[!AUTO_123]]"大吉", description=--[[!AUTO_124]]"天賜窮人一錠金，不爭不竟二人分。彼此分得金到手，一切謀望皆遂心。"},
}

local LuckRankData =
{
	-- {ratio={时辰1比例, 时辰2比例, ...}, level=星级, name=名称, description=描述}
	{ratio={1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12}, level=1, name=--[[!AUTO_125]]"大凶", description=--[[!AUTO_126]]"時乖運拙走不著，急忙過河拆了橋。恩人無義反為怨，凡事無功枉受勞。"},
	{ratio={1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12}, level=1, name=--[[!AUTO_127]]"凶", description=--[[!AUTO_128]]"路上行人色匆匆，過河無橋遇薄冰。小心謹慎過得去，一步錯了落水中。"},
	{ratio={1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12}, level=1, name=--[[!AUTO_129]]"凶", description=--[[!AUTO_130]]"飛鳥樹上築高巢，小人使計用火燒。如占此卦大不利，一切謀望枉徒勞。"},
	{ratio={1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12}, level=2, name=--[[!AUTO_131]]"小凶", description=--[[!AUTO_132]]"時運不來好傷懷，撮上杆去把梯抬。一個蟲翼來到手，轉了上去下不來。"},
	{ratio={1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12}, level=2, name=--[[!AUTO_133]]"小凶", description=--[[!AUTO_134]]"行人路過獨木橋，心內惶恐眼裡跳。爽利保保過得去，慢行一步不安牢。"},
	{ratio={1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12}, level=2, name=--[[!AUTO_135]]"小凶", description=--[[!AUTO_136]]"風刮亂絲不見頭，顛三倒四犯憂愁。慢從款來左順逐，急快反惹不自由。"},
	{ratio={1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12}, level=3, name=--[[!AUTO_137]]"平平", description=--[[!AUTO_138]]"鋤地鋤去苗裡草，誰想財帛將人找。謀望求財皆如意，這個運氣也算好。"},
	{ratio={1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12}, level=3, name=--[[!AUTO_139]]"平平", description=--[[!AUTO_140]]"憂愁常鎖兩眉間，千頭萬緒掛心間。從今以後打開陣，任意而行不相干。"},
	{ratio={1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12}, level=3, name=--[[!AUTO_141]]"平平", description=--[[!AUTO_142]]"鷹遇天晚宿林中，不知林內先有鷹。雖然同處心生惡，卦若逢之是非輕。"},
	{ratio={1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12}, level=4, name=--[[!AUTO_143]]"小吉", description=--[[!AUTO_144]]"魚來撞網樂自然，卦占行人不久還。交易婚姻兩成就，謀望求財不費難。"},
	{ratio={1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12}, level=4, name=--[[!AUTO_145]]"小吉", description=--[[!AUTO_146]]"卦占工師得大木，眼前該著走上路。時來運轉多順當，有事自管放心做。"},
	{ratio={1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12}, level=4, name=--[[!AUTO_147]]"小吉", description=--[[!AUTO_148]]"腳踏棒槌轉悠悠，時運不來莫強求。幸喜今日時運轉，自有好事在後頭。"},
	{ratio={1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12}, level=5, name=--[[!AUTO_149]]"吉", description=--[[!AUTO_150]]"鯉魚化龍喜氣來，口舌疾病永無災。愁疑從此都消散，禍門閉來福門開。"},
	{ratio={1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12}, level=5, name=--[[!AUTO_151]]"吉", description=--[[!AUTO_152]]"順風行船撒起棚，上天又助一篷風。不用費力逍遙去，任意而行大亨通。"},
	{ratio={1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12}, level=5, name=--[[!AUTO_153]]"大吉", description=--[[!AUTO_154]]"困龍得水好運交，不由喜氣上眉梢。一切謀望皆如意，向後時運漸漸高。"},
}

-- timeData: 有数值 year, month, day, hour
local function CalcRandomRank (type, playerIdStr, timeData, rankTable)
	local iTime = math.floor((timeData.hour+1)%24/2) + 1
	local baseStr = (--[[!AUTO_155]]"%s:%s:%d-%d-%d:%d"):format(type, playerIdStr, timeData.year,
										timeData.month, timeData.day, iTime)
	local hashValue = GameApi.HashAString(baseStr)
	local r = hashValue%100000 / 100000	-- 0~1
	local sumRatio = 0
	for i=1, #rankTable do
		sumRatio = sumRatio + rankTable[i].ratio[iTime]
	end

	local iRank = 1
	local curRatio = 0		-- 概率值

	while iRank <= #rankTable do
		curRatio = curRatio + rankTable[iRank].ratio[iTime]
		if curRatio/sumRatio > r then
			break
		end
		iRank = iRank + 1
	end
	return iRank <= #rankTable and iRank or #rankTable
end

function Production:GetTimeDescription ()
	local timeData = GameApi.GetServerTime()
	return TimeDescriptionData[math.floor((timeData.hour+1)%24/2) + 1]
end

function Production:CalcRandomLuck ()
	local playerIdStr = GameApi.RuidToString(GameApi.GetSelfID())
	local timeData = GameApi.GetServerTime()
	local iRank = CalcRandomRank(--[[!AUTO_156]]"luck", playerIdStr, timeData, LuckRankData)
	local data = LuckRankData[iRank]
	return data
end

function Production:CalcRandomProductivity ()
	local playerIdStr = GameApi.RuidToString(GameApi.GetSelfID())
	local timeData = GameApi.GetServerTime()
	local iRank = CalcRandomRank(--[[!AUTO_157]]"productivity", playerIdStr, timeData, ProductivityRankData)
	local data = ProductivityRankData[iRank]
	return data
end
