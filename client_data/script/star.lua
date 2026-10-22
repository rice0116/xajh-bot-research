 --[[#tag push auto]]


--	明星相关配置脚本
--  created:   2012.9.14
math.randomseed(os.time())
math.random()
Star = {}
-- 明星id配置，表中数字个数必须为5，否则无效
Star.StarID = {2354,3531,2808,3376,2353}
Star.DateInfo = {}
StarTaskInfo = {}


StarTaskInfo[4883] = {TitleID = --[[!AUTO_1]]"^a800ff【任盈盈的唯一】^4a0c08",CauseDesc = --[[!AUTO_2]]"^c65b1a知己难求^4a0c08任务中", NpcName = --[[!AUTO_3]]"任盈盈"}
StarTaskInfo[6113] = {TitleID = --[[!AUTO_4]]"^a800ff【岳灵珊的唯一】^4a0c08",CauseDesc = --[[!AUTO_5]]"^c65b1a知己难求^4a0c08任务中", NpcName = --[[!AUTO_6]]"岳灵珊"}
StarTaskInfo[6114] = {TitleID = --[[!AUTO_7]]"^a800ff【林平之的唯一】^4a0c08",CauseDesc = --[[!AUTO_8]]"^c65b1a知己难求^4a0c08任务中", NpcName = --[[!AUTO_9]]"林平之"}
StarTaskInfo[6115] = {TitleID = --[[!AUTO_10]]"^a800ff【仪琳的唯一】^4a0c08",CauseDesc = --[[!AUTO_11]]"^c65b1a知己难求^4a0c08任务中", NpcName = --[[!AUTO_12]]"仪琳"}
StarTaskInfo[6116] = {TitleID = --[[!AUTO_13]]"^a800ff【蓝凤凰的唯一】^4a0c08",CauseDesc = --[[!AUTO_14]]"^c65b1a知己难求^4a0c08任务中", NpcName = --[[!AUTO_15]]"蓝凤凰"}
StarTaskInfo[6117] = {TitleID = --[[!AUTO_16]]"^a800ff【田伯光的唯一】^4a0c08",CauseDesc = --[[!AUTO_17]]"^c65b1a知己难求^4a0c08任务中", NpcName = --[[!AUTO_18]]"田伯光"}
StarTaskInfo[7731] = {TitleID = --[[!AUTO_19]]"^ff0000【独孤求败】^4a0c08",CauseDesc = --[[!AUTO_20]]"^c65b1a天下第一武道会^4a0c08中", NpcName = --[[!AUTO_21]]"各路英雄豪杰"}
StarTaskInfo[30700] = {TitleID = --[[!AUTO_19]]"^ff0000【圖標測試】^4a0c08",CauseDesc = --[[!AUTO_20]]"^c65b1a天下第一武道会^4a0c08中", NpcName = --[[!AUTO_21]]"各路英雄豪杰"}
 ---帮派特殊处理明星，因为无对应的任务ID，所以采用较大的数进行特殊处理StarTaskInfo[2908] = {TitleID = "求爱1",CauseDesc = "求爱任务"}


StarTitle = {}
StarTitle[2353] = --[[!AUTO_19]]"亲王1"
StarTitle[2354] = --[[!AUTO_20]]"亲王2"
StarTitle[2355] = --[[!AUTO_21]]"公爵1"
StarTitle[2356] = --[[!AUTO_22]]"公爵2"
StarTitle[2357] = --[[!AUTO_23]]"公爵3"
StarTitle[2370] = --[[!AUTO_24]]"求爱1"
StarTitle[2808] = --[[!AUTO_25]]"帮主10"
StarTitle[2809] = --[[!AUTO_26]]"帮主20"
StarTitle[3376] = --[[!AUTO_27]]"竞技1"
StarTitle[3377] = --[[!AUTO_28]]"竞技2"
StarTitle[3382] = --[[!AUTO_29]]"竞技3"
StarTitle[3378] = --[[!AUTO_30]]"师德1"
StarTitle[3379] = --[[!AUTO_31]]"师德2"
StarTitle[3383] = --[[!AUTO_32]]"师德3"
StarTitle[3531] = --[[!AUTO_33]]"游侠1"
StarTitle[3532] = --[[!AUTO_34]]"游侠2"
StarTitle[3591] = --[[!AUTO_35]]"游侠3"
StarTitle[3592] = --[[!AUTO_36]]"游侠4"
StarTitle[3593] = --[[!AUTO_37]]"游侠5"
StarTitle[4655] = --[[!AUTO_38]]"竞战1"
StarTitle[4656] = --[[!AUTO_39]]"竞战2"
StarTitle[4657] = --[[!AUTO_40]]"竞战3"
StarTitle[4658] = --[[!AUTO_41]]"竞战4"
StarTitle[4659] = --[[!AUTO_42]]"竞战5"
StarTitle[4632] = --[[!AUTO_43]]"血战1"
StarTitle[4651] = --[[!AUTO_44]]"血战2"
StarTitle[4652] = --[[!AUTO_45]]"血战3"
StarTitle[4653] = --[[!AUTO_46]]"血战4"
StarTitle[4654] = --[[!AUTO_47]]"血战5"
StarTitle[4683] = --[[!AUTO_48]]"等级1"
StarTitle[4684] = --[[!AUTO_49]]"财富1"
StarTitle[4685] = --[[!AUTO_50]]"成就1"
StarTitle[6233] = --[[!AUTO_50]]"武道1"
StarTitle[7992] = --[[!AUTO_50]]"烟花1"
StarTitle[8472] = "鲜花1"
StarTitle[8473] = "鲜花2"
StarTitle[9024] = "少林首席弟子"
StarTitle[9025] = "武当首席弟子"
StarTitle[9026] = "华山首席弟子"
StarTitle[9027] = "恒山首席弟子"
StarTitle[9028] = "衡山首席弟子"
StarTitle[9029] = "日月首席弟子"
StarTitle[9030] = "五仙首席弟子"
StarTitle[9031] = "逍遥首席弟子"
StarTitle[9032] = "唐门首席弟子"
StarTitle[9033] = "峨嵋首席弟子"
StarTitle[9034] = "独孤首席弟子"

RankName = {}

RankName[1] = --[[!AUTO_51]]"等级榜"
RankName[2] = --[[!AUTO_52]]"等级榜"
RankName[3] = --[[!AUTO_53]]"财富榜"
RankName[4] = --[[!AUTO_54]]"财富榜"
RankName[5] = --[[!AUTO_55]]"气血榜"
RankName[6] = --[[!AUTO_56]]"内力榜"
RankName[7] = --[[!AUTO_57]]"外功攻击榜"
RankName[8] = --[[!AUTO_58]]"内功攻击榜"
RankName[9] = --[[!AUTO_59]]"成就榜"
RankName[10] = --[[!AUTO_60]]"种植榜"
RankName[11] = --[[!AUTO_61]]"养殖榜"
RankName[12] = --[[!AUTO_62]]"采矿榜"
RankName[13] = --[[!AUTO_63]]"伐木榜"
RankName[14] = --[[!AUTO_64]]"金石榜"
RankName[15] = --[[!AUTO_65]]"木革榜"
RankName[16] = --[[!AUTO_66]]"布帛榜"
RankName[17] = --[[!AUTO_67]]"制药榜"
RankName[18] = --[[!AUTO_68]]"烹饪榜"
RankName[19] = --[[!AUTO_69]]"钓鱼榜"
RankName[20] = --[[!AUTO_70]]"门徒榜"
RankName[21] = --[[!AUTO_71]]"魅力榜"
RankName[22] = --[[!AUTO_72]]"人缘榜"
RankName[23] = --[[!AUTO_73]]"师德榜"
RankName[24] = --[[!AUTO_74]]"生活名望榜"
RankName[25] = --[[!AUTO_75]]"福州声望榜"
RankName[26] = --[[!AUTO_76]]"衡山声望榜"
RankName[27] = --[[!AUTO_77]]"洛阳声望榜"
RankName[28] = --[[!AUTO_78]]"气血榜"
RankName[29] = --[[!AUTO_79]]"内力榜"
RankName[30] = --[[!AUTO_80]]"外功攻击榜"
RankName[31] = --[[!AUTO_81]]"内功攻击榜"
RankName[32] = --[[!AUTO_82]]"成就榜"
RankName[33] = --[[!AUTO_83]]"种植榜"
RankName[34] = --[[!AUTO_84]]"养殖榜"
RankName[35] = --[[!AUTO_85]]"采矿榜"
RankName[36] = --[[!AUTO_86]]"伐木榜"
RankName[37] = --[[!AUTO_87]]"金石榜"
RankName[38] = --[[!AUTO_88]]"木革榜"
RankName[39] = --[[!AUTO_89]]"布帛榜"
RankName[40] = --[[!AUTO_90]]"制药榜"
RankName[41] = --[[!AUTO_91]]"烹饪榜"
RankName[42] = --[[!AUTO_92]]"钓鱼榜"
RankName[43] = --[[!AUTO_93]]"门徒榜"
RankName[44] = --[[!AUTO_94]]"魅力榜"
RankName[45] = --[[!AUTO_95]]"人缘榜"
RankName[46] = --[[!AUTO_96]]"师德榜"
RankName[47] = --[[!AUTO_97]]"生活名望榜"
RankName[48] = --[[!AUTO_98]]"福州声望榜"
RankName[49] = --[[!AUTO_99]]"衡山声望榜"
RankName[50] = --[[!AUTO_100]]"洛阳声望榜"
RankName[51] = --[[!AUTO_101]]"贡献度榜"
RankName[52] = --[[!AUTO_102]]"贡献度榜"
RankName[57] = --[[!AUTO_103]]"武林声望"
RankName[58] = --[[!AUTO_104]]"武林声望"
RankName[61] = --[[!AUTO_105]]"游侠战绩"
RankName[62] = --[[!AUTO_106]]"游侠战绩"
RankName[75] = --[[!AUTO_107]]"竞技排行"
RankName[76] = --[[!AUTO_108]]"竞技排行"
RankName[77] = --[[!AUTO_109]]"血战排行"
RankName[78] = --[[!AUTO_110]]"血战排行"
RankName[131] = "烟花排行"
RankName[132] = "烟花排行"
RankName[119] = "花魁排行"
RankName[120] = "花魁排行"
RankName[121] = "情圣排行"
RankName[122] = "情圣排行"
RankName[163] = "少林门派"
RankName[164] = "少林门派"
RankName[165] = "武当门派"
RankName[166] = "武当门派"
RankName[167] = "华山门派"
RankName[168] = "华山门派"
RankName[169] = "恒山门派"
RankName[170] = "恒山门派"
RankName[171] = "衡山门派"
RankName[172] = "衡山门派"
RankName[173] = "日月门派"
RankName[174] = "日月门派"
RankName[175] = "五仙门派"
RankName[176] = "五仙门派"
RankName[177] = "逍遥门派"
RankName[178] = "逍遥门派"
RankName[179] = "唐门门派"
RankName[180] = "唐门门派"
RankName[181] = "峨嵋门派"
RankName[182] = "峨嵋门派"
RankName[183] = "独孤门派"
RankName[184] = "独孤门派"

RankName[300] = --[[!AUTO_111]]"帮派实力榜"
RankName[301] = --[[!AUTO_112]]"镖局实力榜"
RankName[302] = --[[!AUTO_113]]"山寨实力榜"
RankName[303] = --[[!AUTO_114]]"帮派等级榜"
RankName[304] = --[[!AUTO_115]]"特色进度榜"
RankName[305] = --[[!AUTO_116]]"寻宝进度榜"
RankName[306] = --[[!AUTO_117]]"灭门进度榜"
RankName[307] = --[[!AUTO_118]]"帮派势力榜"
RankName[308] = --[[!AUTO_119]]"帮派势力榜"


function Star:GetStarIDList()
	return Star.StarID
end

--name：角色名，day：日期，event：0无效，1获得明星身份，id：TaskID 发称号任务的id，明星身份模板id，volume：上中下卷

function Star:GetStarTaskEventDesc(name, day, TaskID, StarID)
	local Time = os.date(--[[!AUTO_120]]"%x",day)


	local TitleID = StarTaskInfo[TaskID].TitleID
	local Cause = StarTaskInfo[TaskID].CauseDesc
	local TitleName = --[[!AUTO_121]]""
	StarEventDesc = --[[!AUTO_122]]""

	if title_info:GetTitleInfo()[TitleID] then

		TitleName = title_info:GetTitleInfo()[TitleID].note
	else
		TitleName = TitleID
	end



	--if event == 1 then
	if StarTaskInfo[TaskID].NpcName then
		StarEventDesc = string.format(--[[!AUTO_123]]"凭借自身的本领，终于在%s的%s征服了%s，%s当之无愧！", Time,StarTaskInfo[TaskID].CauseDesc,StarTaskInfo[TaskID].NpcName,TitleName)
	end
	--end
	return StarEventDesc
end

-- tptype: 0 玩家数据排行榜 1 帮派数据排行榜
-- tpid: 排行榜id
-- value: 排行榜数值
-- rank:排行榜名次

function Star:GetStarToplistEventDesc(name, day, star_id, tptype, tpid, rank,value, faction_name)
	local Time = os.date(--[[!AUTO_124]]"%x",day)
	local RankListName = --[[!AUTO_125]]""
	local RankDesc = --[[!AUTO_126]]""
	local TitleName = --[[!AUTO_127]]"称号名"
	local TitleID = StarTitle[star_id]
	local Desc1,Desc2 = --[[!AUTO_128]]""

	LogPrint(string.format(--[[!AUTO_129]]"tptype%i,tpid%i,value%s,rank%i名", tptype,tpid,value,rank))


	if	star_id == 2809 then
		TitleName = --[[!AUTO_130]]"^ff7d2f【天下第二帮主】"
	elseif title_info:GetTitleInfo()[TitleID] then
		TitleName = title_info:GetTitleInfo()[TitleID].note
	else
		TitleName = TitleID
	end



	if tpid and rank ~= 0 then
		RankListName = RankName[tpid]
	else
		RankListName = --[[!AUTO_131]]"未知排行榜"
	end

	if rank == 1 then
		RankDesc = --[[!AUTO_132]]"拔得头筹"
		Desc1 = --[[!AUTO_133]]"一身盖世神功"
		Desc2 = --[[!AUTO_134]]"当之无愧舍我其谁！"

	elseif rank == 2 then
		RankDesc = --[[!AUTO_135]]"名列二甲"
		Desc1 = --[[!AUTO_136]]"以出神入化的武功"
		Desc2 = --[[!AUTO_137]]"真是实至名归！"
	elseif rank == 3 then
		RankDesc = --[[!AUTO_138]]"跻身前三"
		Desc1 = --[[!AUTO_139]]"自成一派的武学见解，"
		Desc2 = --[[!AUTO_140]]"非其莫属，果然是不鸣则已一鸣惊人！"
	else
		RankDesc = --[[!AUTO_141]]"略有所成"
		Desc1 = --[[!AUTO_142]]"以智勇双全之能，"
		Desc2 = --[[!AUTO_143]]"非其莫属，不愧是青出于蓝胜于蓝！"
	end

	StarEventDesc = string.format(--[[!AUTO_144]]"^4a0c08%s终于在 %s的^c65b1a%s^4a0c08中以^c65b1a%s^4a0c08的成绩%s，%s^4a0c08称号%s", Desc1,Time,RankListName,value,RankDesc,TitleName,Desc2)

	--LogPrint(string.format("时间%s,排行榜名%s,名次,称号%s", Time,RankListName,TitleName))

	--end
	return StarEventDesc
end

Star.DateInfo = {
	[2013] = --[[!AUTO_145]]"二零一三年",
	[2014] = --[[!AUTO_145]]"二零一四年",
	[2015] = --[[!AUTO_145]]"二零一五年",
	[2016] = --[[!AUTO_145]]"二零一六年",
	[2017] = --[[!AUTO_145]]"二零一七年",
	[2018] = --[[!AUTO_145]]"二零一八年",
	[2019] = --[[!AUTO_145]]"二零一九年",
	[2020] = --[[!AUTO_145]]"二零二零年",
	[2021] = --[[!AUTO_145]]"二零二一年",
	[2022] = --[[!AUTO_145]]"二零二二年",
	[2023] = --[[!AUTO_145]]"二零二三年",	
}

function Star:GetStarDateTable()
	return Star.DateInfo
end