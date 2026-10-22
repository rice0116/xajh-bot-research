--[[#tag push auto]]


---排行榜定义表

--[[
enum TOPLISTNAME
{
		TPN_LEVEL = 1,          //等级榜
		TPN_LEVEL_OLDDAY = 2,   //等级一天前老榜
		TPN_MONEY = 3,          //金钱榜
		TPN_MONEY_OLDDAY = 4,   //金钱一天前老榜
		TPN_HP = 5,             //气血榜
		TPN_MP = 6,             //内力榜
		TPN_ATTACKOUT = 7,      //外功攻击榜
		TPN_ATTACKIN = 8,       //内功攻击榜
		TPN_REPUTATION = 9,     //成就榜
		TPN_PLANT = 10,         //种植榜
		TPN_BREED = 11,         //养殖榜
		TPN_MINE = 12,          //采矿榜
		TPN_CUT = 13,           //伐木榜
		TPN_METAL = 14,         //金石榜
		TPN_WOODLEATHER = 15,   //木革榜
		TPN_CLOTH = 16,         //布帛榜
		TPN_MEDCINE = 17,       //制药榜
		TPN_COOK = 18,          //烹饪榜
		TPN_FISH = 19,          //钓鱼榜
		TPN_PET = 20,           //宠物榜
		TPN_REPCHARM = 21,      //魅力榜
		TPN_REPFAME = 22,       //人缘榜
		TPN_REPSECT = 23,       //师徒榜
		TPN_REPLIFE = 24,       //生活名望榜
		TPN_REPFUZHOU = 25,     //福州城市声望榜
		TPN_REPHENGSHAN = 26,   //衡山城市声望榜
		TPN_REPLUOYANG = 27,    //洛阳城市声望榜

		TPN_FACTION_ALL = 300,       //帮派总实力
		TPN_FACTION_BIAOJU = 301,    //镖局
		TPN_FACTION_MABANG = 302,    //马帮
		TPN_FACTION_SHANZHAI = 303,  //山寨
		TPN_FACTION_GONGFANG = 304,  //工坊
		TPN_FACTION_LEVEL = 305,     //帮派等级
		TPN_MAX_SPEED_INSTANCE = 129 //武尊榜
    TPN_MAX_SPEED_INSTANCE_OLDDAY = 130 //武尊榜排行榜老榜
    
};
]]--

rank_disp = {};


rank_disp.awardRankList =
{
	[1] = --[[!AUTO_55]]"本排行榜每月8號20：00發獎",
	[2] = --[[!AUTO_56]]"本排行榜每月8號20：00發獎",
	[3] = --[[!AUTO_57]]"本排行榜每月18號20：00發獎",
	[4] = --[[!AUTO_58]]"本排行榜每月18號20：00發獎",
	[9] = --[[!AUTO_59]]"本排行榜每月28號20：00發獎",
	[32] = --[[!AUTO_60]]"本排行榜每月28號20：00發獎",
	[23] = --[[!AUTO_61]]"本排行榜每月20號21：10發獎",
	[46] = --[[!AUTO_62]]"本排行榜每月20號21：10發獎",
	[51] = --[[!AUTO_63]]"本排行榜每月25號23：59發獎，結算後請刷新當前排名！",
	[52] = --[[!AUTO_64]]"本排行榜每月25號23：59發獎，結算後請刷新當前排名！",
	[75] = --[[!AUTO_65]]"本排行榜每月15號20：10發獎",
	[76] = --[[!AUTO_66]]"本排行榜每月15號20：10發獎",
	[77] = --[[!AUTO_67]]"本排行榜每月15日20：10發獎",
	[78] = --[[!AUTO_68]]"本排行榜每月15日20：10發獎",
	[124] = "本排行榜每月15號20:10發獎",
	[126] = "本排行榜每月15號20:10發獎",
	[313] = "本排行榜每月15號20:10刷新，21:10發獎",
	[314] = "本排行榜每月15號20:10刷新，21:10發獎",
	[316] = "本排行榜每月15號20:10刷新，21:10發獎",
	[317] = "本排行榜每月15號20:10刷新，21:10發獎",
	[315] = --[[!AUTO_69]]"本排行榜每月1號00：01刷新",
	[318] = "本排行榜每月第一周與第三周週六00:00刷新",
	[129] = "本排行榜每月28號20：20發獎，發獎後2小時排行榜不積分。",
	[130] = "本排行榜每月28號20：20發獎，發獎後2小時排行榜不積分。",
	[131] = "本排行榜每月25號00：10發獎，發獎後2小時內排行不記分。",
	[132] = "本排行榜每月25號00：10發獎，發獎後2小時內排行不記分。",
	[119] = "本排行榜每月25號00：10發獎，月底截止，發獎後2小時內排行不記分。",
	[120] = "本排行榜每月25號00：10發獎，月底截止，發獎後2小時內排行不記分。",
	[121] = "本排行榜每月25號00：10發獎，月底截止，發獎後2小時內排行不記分。",
	[122] = "本排行榜每月25號00：10發獎，月底截止，發獎後2小時內排行不記分。",
	[-3] = "本排行榜週一00:00點截止，00:10分刷新；上周榜首為本門首席弟子。",
	[-4] = "本排行榜週一00:00點截止，00:10分刷新；上周榜首為本門首席弟子。",
	[322] = "本排行榜每周五20:00重置。",

}


---传入参数：排行榜类型，本次排名，升降字符，名字（玩家、家族、帮派），职业 ,level，排名值
---传出参数：5个值用\t分开,名次、升降、姓名、value、等级、门派、称号

function rank_disp:IsDisplayRankByGroup(id)
	local rank_List = {161}

	for k,v in pairs(rank_List) do
		if id == v then
			return true
		end
	end

	return false
end

function rank_disp:GetRankDisplayValue(id, val)
	local value = val

	if id == 161 then
		local floor = math.floor(val / (2 ^ 32))
		local time = val - floor * (2 ^ 32)
		local minute = math.floor(time / 60)
		local second = time % 60
		value = string.format(" %s / %02s:%02s" , floor, minute, second)
	end

	return value
end

function rank_disp:GetDescription(id, rank, trend, name, prof, level, val)
	--门派字符串
	local game_prof_type = {}
	local game_prof_type_null = --[[!AUTO_1]]"未知"

	game_prof_type[1] = --[[!AUTO_2]]"新手"
	game_prof_type[2] = --[[!AUTO_3]]"少林"
	game_prof_type[3] = --[[!AUTO_4]]"武當"
	game_prof_type[4] = --[[!AUTO_5]]"華山"
	game_prof_type[5] = --[[!AUTO_6]]"恆山"
	game_prof_type[6] = --[[!AUTO_7]]"衡山"
	game_prof_type[7] = --[[!AUTO_8]]"日月"
	game_prof_type[8] = --[[!AUTO_9]]"五仙"
	game_prof_type[9] = --[[!AUTO_10]]"逍遙"
	game_prof_type[10] = --[[!AUTO_11]]"唐門"
	game_prof_type[11] = --[[!AUTO_12]]"峨嵋"
	game_prof_type[12] = --[[!AUTO_13]]"獨孤"
	game_prof_type[13] = --[[!AUTO_14]]"玲瓏"

	ItemQui = {}
	ItemQui[1] = --[[!AUTO_13]]"^ffffff普通"
	ItemQui[2] = --[[!AUTO_14]]"^00ff00優良"
	ItemQui[3] = --[[!AUTO_15]]"^3485ff精緻"
	ItemQui[4] = --[[!AUTO_16]]"^ce58ff珍稀"
	ItemQui[5] = --[[!AUTO_17]]"^df8408傳世"

	--排行榜发称号
	local repu_text =
	{
		[1] = {--[[!AUTO_18]]"^a800ff【第一尊者】",},
		[3] = {--[[!AUTO_19]]"^a800ff【第一富豪】",},
		[5] = {--[[!AUTO_20]]"^ff7d2f【第一血牛】",},
		[6] = {--[[!AUTO_21]]"^ff7d2f【第一內力】",},
		[7] = {--[[!AUTO_22]]"^ff7d2f【第一外功】",},
		[8] = {--[[!AUTO_23]]"^ff7d2f【第一內功】",},
		[9] = {--[[!AUTO_24]]"^a800ff【第一成就】",},
		[10] = {--[[!AUTO_25]]"^ff7d2f【種植宗師】",},
		[11] = {--[[!AUTO_26]]"^ff7d2f【養殖宗師】",},
		[12] = {--[[!AUTO_27]]"^ff7d2f【採礦宗師】",},
		[13] = {--[[!AUTO_28]]"^ff7d2f【伐木宗師】",},
		[14] = {--[[!AUTO_29]]"^ff7d2f【金石宗師】",},
		[15] = {--[[!AUTO_30]]"^ff7d2f【木革宗師】",},
		[16] = {--[[!AUTO_31]]"^ff7d2f【布帛宗師】",},
		[17] = {--[[!AUTO_32]]"^ff7d2f【製藥宗師】",},
		[18] = {--[[!AUTO_33]]"^ff7d2f【烹飪宗師】",},
		[19] = {--[[!AUTO_34]]"^ff7d2f【釣魚宗師】",},
		[20] = {--[[!AUTO_35]]"^ff7d2f【名師高徒】",},
		[21] = {--[[!AUTO_36]]"^ff7d2f【德高望重】",},
		[22] = {--[[!AUTO_37]]"^ff7d2f【人氣之星】",},
		[24] = {--[[!AUTO_38]]"^ff7d2f【生活達人】",},
		[25] = {--[[!AUTO_39]]"^ff7d2f【福州名人】",},
		[26] = {--[[!AUTO_40]]"^ff7d2f【衡山名人】",},
		[27] = {--[[!AUTO_41]]"^ff7d2f【洛陽名人】",},
	}
	
	--运镖排行榜奖励
	local excort_text =
	{
		[1] = {"10800錠","6000","708",},
		[2] = {"7560錠","4200","496",},
		[3] = {"7560錠","4200","496",},
		[4] = {"3402錠","1890","223",},
		[5] = {"3402錠","1890","223",},
		[6] = {"3402錠","1890","223",},
		[7] = {"3402錠","1890","223",},
		[8] = {"3402錠","1890","223",},
		[9] = {"3402錠","1890","223",},
		[10] = {"3402錠","1890","223",},
		[11] = {"680錠","378","45",},
		[12] = {"680錠","378","45",},
		[13] = {"680錠","378","45",},
		[14] = {"680錠","378","45",},
		[15] = {"680錠","378","45",},
		[16] = {"680錠","378","45",},
		[17] = {"680錠","378","45",},
		[18] = {"680錠","378","45",},
		[19] = {"680錠","378","45",},
		[20] = {"680錠","378","45",},
		[21] = {"68錠","38","5",},
		[22] = {"68錠","38","5",},
		[23] = {"68錠","38","5",},
		[24] = {"68錠","38","5",},
		[25] = {"68錠","38","5",},
		[26] = {"68錠","38","5",},
		[27] = {"68錠","38","5",},
		[28] = {"68錠","38","5",},
		[29] = {"68錠","38","5",},
		[30] = {"68錠","38","5",},
		[31] = {"68錠","38","5",},
		[32] = {"68錠","38","5",},
		[33] = {"68錠","38","5",},
		[34] = {"68錠","38","5",},
		[35] = {"68錠","38","5",},
		[36] = {"68錠","38","5",},
		[37] = {"68錠","38","5",},
		[38] = {"68錠","38","5",},
		[39] = {"68錠","38","5",},
		[40] = {"68錠","38","5",},
		[41] = {"68錠","38","5",},
		[42] = {"68錠","38","5",},
		[43] = {"68錠","38","5",},
		[44] = {"68錠","38","5",},
		[45] = {"68錠","38","5",},
		[46] = {"68錠","38","5",},
		[47] = {"68錠","38","5",},
		[48] = {"68錠","38","5",},
		[49] = {"68錠","38","5",},
		[50] = {"68錠","38","5",},

	}
	local escort_cash = ""
	local escort_contribution = ""
	local escort_resource = ""
	if excort_text[rank] and excort_text[rank][1] then
		escort_cash = excort_text[rank][1]
	end
	if excort_text[rank] and excort_text[rank][2] then
		escort_contribution = excort_text[rank][2]
	end
	if excort_text[rank] and excort_text[rank][3] then
		escort_resource = excort_text[rank][3]
	end

	local prof_text = --[[!AUTO_42]]""
	local level_text = --[[!AUTO_43]]" "
	local award_title = --[[!AUTO_44]]""

	--获取门派
	if game_prof_type[prof+1] then
		prof_text = game_prof_type[prof+1]
	else
		prof_text = game_prof_type_null
	end

	--获取等级
	if id ~= 1 then
		level_text = string.format(--[[!AUTO_45]]"%s",level)
	end

	--获取称号
	if repu_text[id] and repu_text[id][rank] then
		award_title = repu_text[id][rank]
	end

	local displayVal = rank_disp:GetRankDisplayValue(id, val)

	--id, rank, trend, name, prof, level, displayVal

	if id == 20 then
		local _, pet_tname = GameApi.GetItemDBProp(prof,ClassType.ICID_PET_BEDGE,--[[!AUTO_46]]"t_name")
		ranktext = string.format(--[[!AUTO_47]]"%s\t%s\t%s\t%s\t%s\t%s\t%s" , rank, trend, pet_tname, name, displayVal, level_text, award_title)
	elseif id == 312 then
		local ItemName, _, _ = GameApi.GetItemInfo(prof)
		ranktext = string.format(--[[!AUTO_48]]"%s\t%s\t%s\t%s\t%s\t%s\t%s" , rank, trend, name, ItemName, ItemQui[displayVal], level_text, --[[!AUTO_49]]" ")
	elseif id == 123 or id == 124 or id == 125 or id == 126 then
		ranktext = string.format(--[[!AUTO_53]]"%s\t%s\t%s\t%s\t%s\t%s\t%s" , rank, trend, name, prof_text, displayVal, " ", award_title)
	elseif id == 315 then
		if displayVal == 0 then
			ranktext = string.format(--[[!AUTO_50]]"%s\t%s\t%s\t%s\t%s\t%s\t%s" , rank, trend, name, level_text, "**", " ", " ")
		else
			ranktext = string.format(--[[!AUTO_50]]"%s\t%s\t%s\t%s\t%s\t%s\t%s" , rank, trend, name, level_text, displayVal, " ", " ")
		end
	elseif id == 313 or id == 314 or id == 316 or id == 317 then
		ranktext = string.format(--[[!AUTO_50]]"%s\t%s\t%s\t%s\t%s\t%s\t%s" , rank, trend, name, displayVal, " ", " ", award_title)
	elseif id >= 300 and id <= 311 then--
		ranktext = string.format(--[[!AUTO_50]]"%s\t%s\t%s\t%s\t%s\t%s\t%s" , rank, trend, name, displayVal, --[[!AUTO_51]]" ", --[[!AUTO_52]]" ", award_title)
	elseif id == 318 then
		ranktext = string.format("%s\t%s\t%s\t%s\t%s\t%s\t%s" , rank, trend, name, displayVal, " ", " ", " ")
	elseif id == 319 then
		ranktext = string.format("%s\t%s\t%s\t%s\t%s\t%s\t%s" , rank, trend, name, displayVal, " ", " ", " ")
	elseif id == 320 or id == 321 then
		ranktext = string.format("%s\t%s\t%s\t%s\t%s\t%s\t%s", rank, trend, name, displayVal, " ", " ", " ")
	elseif rank_disp:IsDisplayRankByGroup(id) then
		if rank == 0 then
			ranktext = string.format(--[[!AUTO_53]]"%s\t%s\t%s\t%s\t%s\t%s\t%s" , " ", " ", name, displayVal, level_text, prof_text, award_title)
		else
			ranktext = string.format(--[[!AUTO_53]]"%s\t%s\t%s\t%s\t%s\t%s\t%s" , rank, " ", name, displayVal, level_text, prof_text, award_title)
		end
	elseif id == 322 or id == 323 then
		ranktext = string.format("%s\t%s\t%s\t%s\t%s\t%s\t%s", rank, trend, name, escort_cash, escort_contribution, escort_resource, " ")
	else
		ranktext = string.format(--[[!AUTO_53]]"%s\t%s\t%s\t%s\t%s\t%s\t%s" , rank, trend, name, displayVal, level_text, prof_text, award_title)
	end


	return ranktext
end
--end

function rank_disp:GetRecommendList()
	local RecommendID = 1
	local Reason = --[[!AUTO_54]]"等級一向是江湖中強弱的標準，入選等級榜的人，都成為江湖中人人敬仰的對象。官方也為入選等級榜的玩家準備了豐厚的獎勵，為他們日後行走江湖助一臂之力。"
	return RecommendID,Reason
end



--显示发奖时间文字
function rank_disp:GetAwardText(rank_id)
	if rank_disp.awardRankList[rank_id] then
		return rank_disp.awardRankList[rank_id]
	end
end




function rank_disp:DisplayLastRank(id)
	local rank_list = {51,52,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,313,314,316,317,129,130,131,132,133,134,135,136,-3,-4}

	for k,v in pairs(rank_list) do
		if id == v then
			return true
		end
	end

	return false
end


function rank_disp:DisplayRefreshBtn(id)
	local rank_RefreshList = {51,52,131,132}

	for k,v in pairs(rank_RefreshList) do
		if id == v then
			return true
		end
	end

	return false
end

function rank_disp:IsDisplayMyRank(id)
	local rank_List = {161}

	for k,v in pairs(rank_List) do
		if id == v then
			return false
		end
	end

	return true
end

