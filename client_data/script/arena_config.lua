--[[#tag push auto]]
ArenaCfg = {}

--开场报幕语音（几个里面随机一个播）
ArenaCfg.arena1V1_start_music =
{
	[1] =	--[1]表示第一局
	{
		[1] = --[[!AUTO_1]]"Sfx\voice\1V1语音\1V1_开场报幕1局_E.ogg",
		--[2] = "Sfx\voice\1V1语音\1V1_开场报幕1局_中文.ogg",
	},
	[2] =	--[2]表示第二局
	{
		[1] = --[[!AUTO_2]]"Sfx\voice\1V1语音\1V1_开场报幕2局_E.ogg",
		--[2] = "Sfx\voice\1V1语音\1V1_开场报幕2局_中文.ogg",
	},
	[3] =	--[3]表示第三局
	{
		[1] = --[[!AUTO_3]]"Sfx\voice\1V1语音\1V1_开场报幕3局_E.ogg",
		--[2] = "Sfx\voice\1V1语音\1V1_开场报幕3局_中文.ogg",
	},
	[4] =	--[4]表示第四局
	{
		[1] = --[[!AUTO_4]]"Sfx\voice\1V1语音\1V1_开场报幕4局_E.ogg",
		--[2] = "Sfx\voice\1V1语音\1V1_开场报幕4局_中文.ogg",
	},
	[5] =	--[5]表示第五局
	{
		[1] = --[[!AUTO_5]]"Sfx\voice\1V1语音\1V1_开场报幕5局_E.ogg",
		--[2] = "Sfx\voice\1V1语音\1V1_开场报幕5局_中文.ogg",
	},
}

function ArenaCfg:Getarena1V1StartMusic()
	return ArenaCfg.arena1V1_start_music
end

--结束报幕语音（几个里面随机一个播）
ArenaCfg.arena1V1_KO_music =
{
	[1] = 		--[1]表示胜负点
	{
		[1] = --[[!AUTO_6]]"Sfx\voice\1V1语音\1V1_胜负点_E.ogg",
		--[2] = "Sfx\voice\1V1语音\1V1_胜负点_中文.ogg"
	},
	[2] = 		--[2]表示胜利报幕
	{
		[1] = --[[!AUTO_7]]"Sfx\voice\1V1语音\1V1_胜利报幕_E.ogg"
		--[2] = "Sfx\voice\1V1语音\1V1_胜利报幕_中文.ogg"
	},
}

function ArenaCfg:Getarena1V1KOMusic(type)
	return ArenaCfg.ArenaCfgArena1V1KOMusic[type]
end

--人物开场动作可选列表
--ArenaCfg.arena1V1_start_PlayersACT = 		--ACTname=动作名称，TEXT=选择名字
--{
--	[1] =
--	{
--		ACTname = "PT_抽刀_通用",
--		TEXT	= "抽刀",
--	},
--	[2] =
--	{
--		ACTname = "PT_对拜_通用",
--		TEXT = "对拜",
--	},
--	[3] =
--	{
--		ACTname = "ZS_翻桥_通用",
--		TEXT = "翻桥",
--	},
--	[4] =
--	{
--		ACTname = "bq_抱拳_通用",
--		TEXT = "抱拳",
--	},
--	[5] =
--	{
--		ACTname = "bq_发怒_通用",
--		TEXT = "发怒",
--	},
--	[6] =
--	{
--		ACTname = "bq_挥手_通用",
--		TEXT = "挥手",
--	},
--}
--
--function ArenaCfg:Getarena1V1StartPlayersACT()
--	return ArenaCfg.arena1V1_start_PlayersACT
--end

--人物开场语音可选列表
--ArenaCfg.arena1V1_start_PlayersMUSIC_men = 	--开场声音男
--{
--	[1] =
--	{
--		MUSICname = "Sfx\voice\1V1语音\1V1_开场自白_男1_中文.ogg",
--		TEXT = "男开场1" ,
--	},
--	[2] =
--	{
--		MUSICname = "Sfx\voice\1V1语音\1V1_开场自白_男2_中文.ogg",
--		TEXT = "男开场2" ,
--	},
--}
--
--ArenaCfg.arena1V1_start_PlayersMUSIC_women = 	--开场声音女
--{
--	[1] =
--	{
--		MUSICname = "Sfx\voice\1V1语音\1V1_开场自白_女1_中文.ogg",
--		TEXT = "女开场1" ,
--	},
--	[2] =
--	{
--		MUSICname = "Sfx\voice\1V1语音\1V1_开场自白_女2_中文.ogg",
--		TEXT = "女开场2" ,
--	},
--}
--
--function ArenaCfg:Getarena1V1StartPlayersMUSIC(gender)
--	local	getarena1V1_start_PlayersMUSIC = {}
--	if gender == 1 then
--		getarena1V1_start_PlayersMUSIC = ArenaCfg.arena1V1_start_PlayersMUSIC_men
--	else
--		getarena1V1_start_PlayersMUSIC = ArenaCfg.arena1V1_start_PlayersMUSIC_women
--	end
--	return getarena1V1_start_PlayersMUSIC
--end

--人物胜利动作可选列表
--ArenaCfg.arena1V1_WINER_PlayersACT = 		--ACTname=动作名称，TEXT=选择名字
--{
--	[1] =
--	{
--		ACTname = "bq_挥手_通用",
--		TEXT =	"挥手",
--	},
--	[2] =
--	{
--		ACTname = "bq_欢呼_通用",
--		TEXT =	"欢呼",
--	},
--	[3] =
--	{
--		ACTname = "bq_鼓掌_通用",
--		TEXT =	"鼓掌",
--	},
--	[4] =
--	{
--		ACTname = "bq_害羞_通用",
--		TEXT =	"害羞",
--	},
--}
--
--function ArenaCfg:Getarena1V1WINERPlayersACT()
--	return ArenaCfg.arena1V1_WINER_PlayersACT
--end

--人物胜利语音可选列表
--ArenaCfg.arena1V1_WINER_PlayersMUSIC_men =
--{
--	[1] =
--	{
--		MUSICname = "Sfx\voice\1V1语音\1V1_胜利自白_男1_中文.ogg",
--		TEXT = "男胜利1" ,
--	},
--	[2] =
--	{
--		MUSICname = "Sfx\voice\1V1语音\1V1_胜利自白_男2_中文.ogg",
--		TEXT = "男胜利2" ,
--	},
--}
--ArenaCfg.arena1V1_WINER_PlayersMUSIC_women =
--{
--	[1] =
--	{
--		MUSICname = "Sfx\voice\1V1语音\1V1_胜利自白_女1_中文.ogg",
--		TEXT = "女胜利1" ,
--	},
--	[2] =
--	{
--		MUSICname = "Sfx\voice\1V1语音\1V1_胜利自白_女2_中文.ogg",
--		TEXT = "女胜利2" ,
--	},
--}
--
--function ArenaCfg:GetArena1V1WINERPlayersMUSIC(gender)
--	local	arena1V1_WINER_PlayersMUSIC = {}
--	if gender == 1 then
--		arena1V1_WINER_PlayersMUSIC = ArenaCfg.arena1V1_WINER_PlayersMUSIC_men
--	else
--		arena1V1_WINER_PlayersMUSIC = ArenaCfg.arena1V1_WINER_PlayersMUSIC_women
--	end
--	return arena1V1_WINER_PlayersMUSIC
--end

--战场/子场景/CG对应
ArenaCfg.battle_cgid =
{
	[1898]=			--1v1擂台
	{
		[1900] = 400282,	--英雄台

		[1901] = 400283,	--药王庙

		[1903] = 400501,	--丰沃原
		
		[1917] = 400500,	--大佛

		[1914] = 400033,	--胡杨海

	},
	[3547]=			--1v1擂台镜像1
	{
		[1900] = 400282,	--英雄台

		[1901] = 400283,	--药王庙

		[1903] = 400501,	--丰沃原
		
		[1917] = 400500,	--大佛

		[1914] = 400033,	--胡杨海

	},
	[3548]=			--1v1擂台镜像2
	{
		[1900] = 400282,	--英雄台

		[1901] = 400283,	--药王庙

		[1903] = 400501,	--丰沃原
		
		[1917] = 400500,	--大佛

		[1914] = 400033,	--胡杨海

	},
	[3549]=			--1v1擂台镜像3
	{
		[1900] = 400282,	--英雄台

		[1901] = 400283,	--药王庙

		[1903] = 400501,	--丰沃原
		
		[1917] = 400500,	--大佛

		[1914] = 400033,	--胡杨海

	},
	[3550]=			--1v1擂台镜像4
	{
		[1900] = 400282,	--英雄台

		[1901] = 400283,	--药王庙

		[1903] = 400501,	--丰沃原
		
		[1917] = 400500,	--大佛

		[1914] = 400033,	--胡杨海

	},
	[3551]=			--1v1擂台镜像5
	{
		[1900] = 400282,	--英雄台

		[1901] = 400283,	--药王庙

		[1903] = 400501,	--丰沃原
		
		[1917] = 400500,	--大佛

		[1914] = 400033,	--胡杨海

	},
		--[[
		[1900] = 400030,	--京师擂台	--40100	-189801
		[1901] = 400031,	--五仙青蛇沼	--2601	-189802
		[1903] = 400032,	--日月成德殿前	--4201	-189803
		[1914] = 400033,	--峨眉		--3101	-189804
		[1915] = 400034,	--武当八卦台	--1	-189805
		[1916] = 400035,	--逍遥时钟	--1801	-189806
		[1917] = 400036,	--黑木崖魔象	--4102	-189807
		[1918] = 400037,	--临江镇擂台	--101	-189808
		[1919] = 400038,	--戈壁吊桥	--4901	-189809
		[1920] = 400039,	--朱仙镇街市	--3701	--141601	-189810
		]]--
}

ArenaCfg.Config =
{
	[1900] =
	{
		name = --[[!AUTO_8]]"洛陽－英雄台",
		desc = --[[!AUTO_9]]"洛陽金刀王家舉辦的擂臺，\r重金邀天下豪傑在此切磋武藝。\r\r作戰要領：\r擂臺為寬廣的方形區域，\r各打法都有用武之地，\r但對於有法陣類技能的作戰者，\r活用場景邊角會更為有利。" ,
		video = --[[!AUTO_10]]"music\\video\\battlefieldscene_01.avi",
		Image = --[[!AUTO_11]]"XAJH\\战场相关\\竞技2（普通）.tga",
	},
	[1901] =
	{
		name = --[[!AUTO_12]]"藥王谷－藥王廟",
		desc = --[[!AUTO_13]]"雨夜中廢棄的破廟，\r令狐沖在此地施展獨孤九劍，\r一劍刺瞎十五名高手。\r\r作戰要領：\r擊碎周遭物件，\r可獲回復效果或快速累積怒氣，\r搶先靠近或用調息吸取，\r就可在作戰中佔得先機。" ,
		video = --[[!AUTO_14]]"music\\video\\battlefieldscene_02.avi",
		Image = --[[!AUTO_15]]"XAJH\\战场相关\\竞技11（普通）.tga",
	},
	[1903] =
	{
		name = --[[!AUTO_16]]"餘杭－豐沃原",
		desc = --[[!AUTO_17]]"刺客潛伏的麥地，\r突如其來的襲擊，\r隨時可能取走過路者的性命。\r\r作戰要領：\r在如此廣闊的場景，\r尋找適合自已戰鬥的區域，\r以及遮擋物都很重要。" ,
		video = --[[!AUTO_18]]"music\\video\\battlefieldscene_03.avi",
		Image = --[[!AUTO_19]]"XAJH\\战场相关\\竞技3（普通）.tga",
	},
	[1914] =
	{
		name = --[[!AUTO_20]]"江南－胡楊海",
		desc = --[[!AUTO_21]]"居延海畔的胡楊林，\r相傳秦朝時，\r兩位風華絕代的女劍仙在此鬥劍。\r\r作戰要領：\r充分利用周圍的胡楊樹，\r以及旁邊的淺灘，\r才能更好的與敵人周旋。" ,
		video = --[[!AUTO_22]]"music\\video\\battlefieldscene_04.avi",
		Image = --[[!AUTO_23]]"XAJH\\战场相关\\竞技4（普通）.tga",
	},
	[1916] =
	{
		name = --[[!AUTO_24]]"衡山－迴雁樓",
		desc = --[[!AUTO_25]]"衡山城最繁華地段的酒樓，\r因令狐沖與田伯光兩大高手，\r夕日在此坐鬥而名噪一時。\r\r作戰要領：\r夜晚的街道行人相當多，\r打鬥時不僅要注意敵人，\r也要注意不碰到行人。" ,
		video = --[[!AUTO_26]]"music\\video\\battlefieldscene_05.avi",
		Image = --[[!AUTO_27]]"XAJH\\战场相关\\竞技5（普通）.tga",
	},
	[1916] =
	{
		name = --[[!AUTO_28]]"逍遙派－乾坤晷",
		desc = --[[!AUTO_29]]"乾坤晷是逍遙先人用來預測風水的儀器，雖無動作仍可永動。\r作戰要領：乾坤晷上部分地面會自動移動，戰時可以善加利用。" ,
		video = --[[!AUTO_30]]"music\\video\\battlefieldscene_06.mpg",
		Image = --[[!AUTO_31]]"XAJH\\战场相关\\竞技5（普通）.tga",
	},

	[1917] =
	{
		name = --[[!AUTO_32]]"中南海－大佛",
		desc = --[[!AUTO_33]]"這是一尊大佛。\r作戰要領：心中有佛就能勝利。" ,
		video = --[[!AUTO_34]]"music\\video\\battlefieldscene_07.mpg",
		Image = --[[!AUTO_35]]"XAJH\\战场相关\\竞技7（普通）.tga",
	},
	--[[

	[1918] =
	{
		name = "福州港－临江镇",
		desc = "临江镇位于福州港，既是渔米之乡，也是江湖中人启程之所。\r作战要领：临江镇比武台位于圆形的土楼上方，尽可放心作战。" ,
		video = "music\\video\\battlefieldscene_08.mpg",
		Image = "XAJH\\战场相关\\竞技8（普通）.tga",
	},

	[1919] =
	{
		name = "戈壁滩－荒原桥",
		desc = "荒原桥下方虽有千米峭壁，但却是戈壁南北峡谷的唯一通路。\r作战要领：荒原桥是狭长区域，灵活运用各种轻功才是取胜之道。" ,
		video = "music\\video\\battlefieldscene_09.mpg",
		Image = "XAJH\\战场相关\\竞技9（普通）.tga",
	},

	[1920] =
	{
		name = "朱仙镇－西街市",
		desc = "西街市位于朱仙镇的西大街，行人商贾聚于此地，十分繁华。\r作战要领：在街市这种长形区域作战，需合理利用各种飞行道具。" ,
		video = "music\\video\\battlefieldscene_10.mpg",
		Image = "XAJH\\战场相关\\竞技10（普通）.tga",
	},
	]]--
	[2041] =
	{
		name = --[[!AUTO_36]]"華山論劍",
		desc = --[[!AUTO_37]]"一年一度的華山論劍又將召開，天下豪傑去集於山下捉對廝殺，非為正邪，而是一個“武”字。\r作戰要領：儘快攻佔對方的基地，既靠武力，也需智取。" ,
		video = --[[!AUTO_38]]"music\\video\\battlefieldscene_a1.mpg",
		Image = --[[!AUTO_39]]"XAJH\\战场相关\\竞技a1（普通）.tga",
	},
}

function ArenaCfg:GetArenaSceneConfig(scene_id)
	return ArenaCfg.Config[scene_id]
end

--返回所有战场Cg
function ArenaCfg:GetBattle_Cgid()
	return ArenaCfg.battle_cgid
end

--已废除，不生效！！！！传入：战场ID，场景ID，传出对应的图片ID。说明文本。
--[[
function ArenaCfg:GetArenaExplain(warid,mapid)
	local PICid = 0
	local text = ""
	if warid == 123 and mapid == 234 then
	PICid = 2345
	text = "京城擂台"
	end
	return PICid,text
end
]]--


--[[
竞技擂台场景选择相关
1405 京师擂台
1401 五仙青蛇沼
1403 日月成德殿前
1410 峨眉
1411 武当八卦台
1412 逍遥时钟
1413 黑木崖魔象
1414 临江镇擂台
1415 戈壁吊桥
1416 朱仙镇街市
--]]

ArenaCfg.arena1V1_start_PlayersMUSIC_men = 	--开场声音男
{
	[1] =
	{
		MUSICname = --[[!AUTO_40]]"Sfx\voice\1V1语音\1V1_开场自白_男1_中文.ogg",
		TEXT = --[[!AUTO_41]]"男開場1" ,
	},
	[2] =
	{
		MUSICname = --[[!AUTO_42]]"Sfx\voice\1V1语音\1V1_开场自白_男2_中文.ogg",
		TEXT = --[[!AUTO_43]]"男開場2" ,
	},
}
local ArenaScenes = {1405,1401,1403,1410,1411,1412}

function ArenaCfg:GetArenaScenesID (index)
	return ArenaScenes [index]
end

















