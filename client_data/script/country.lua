

--	国家相关配置脚本
--  created:   2014.7.9

Country = {}

--官员ID配置，必须为10个
Country.Officer = 
{
	{ ID = 7386, Title = "武林盟主"},
	{ ID = 7387, Title = "苍穹贤士"},
	{ ID = 7388, Title = "传功长老"},
	{ ID = 7389, Title = "执法长老"},
	{ ID = 7390, Title = "天罡护法"},
	{ ID = 7391, Title = "地煞护法"},
	{ ID = 7392, Title = "冥龙坛主"},
	{ ID = 7393, Title = "赤焰坛主"},
	{ ID = 7394, Title = "青木坛主"},
	{ ID = 7395, Title = "雪祭坛主"},
}

Country.LowOfficer = 
{
	{ ID = 7396, Title = "飞龙军"},
	{ ID = 7510, Title = "龙门镖师"},
}

function Country:GetOfficerList()
	return Country.Officer
end

function Country:GetLowOfficerList()
	return Country.LowOfficer
end

Country.LogEvent = 
{
	"上任",
	"卸任",
	"任命",
	"罢免",
	"宣战",
	"战果",
	"支援",
	"连任",
	"宣战",
	"御敌"
}

function Country:GetLogStr(day,event,pos1,name1,pos2,name2,thiszone,otherzone,result)
	local Time = os.date(--[[!AUTO_124]]"%x",day)
	local contentstr = ""
	pos1 = "^a800ff" .. pos1 .. "^000000"
	pos2 = "^a800ff" .. pos2 .. "^000000"
	name1 = "^ff0000" .. name1 .. "^000000"
	name2 = "^ff0000" .. name2 .. "^000000"
	thiszone = "^09a3e2" .. thiszone .. "^000000"
	otherzone = "^09a3e2" .. otherzone .. "^000000"

	if event == 0 then
		contentstr = string.format("【%s】凭借在【%s】非凡的实力和影响力成功当选本届天下会【%s】！", name1,thiszone,pos1)
	elseif event == 1 then
		contentstr = string.format("经【%s】十大帮会帮主弹劾，【%s】【%s】卸任！", thiszone,pos1,name1)
	elseif event == 2 then
		contentstr = string.format("【%s】被【%s】【%s】任命为本届天下会【%s】", name1,pos2,name2,pos1)
	elseif event == 3 then
		contentstr = string.format("【%s】被【%s】【%s】罢免【%s】一职", name1,pos2,name2,pos1)
	elseif event == 4 then
		contentstr = string.format("本服天下会向【%s】发起【雪镇之争】", otherzone)
	elseif event == 5 then
	    local temp
		if result == 0 then
			temp = "天下会率领各路豪杰大获全胜！"
		else
			temp = "惜败！"
		end
		contentstr = string.format("在与【%s】的【雪镇之争】中，【%s】%s", otherzone,thiszone,temp)
	elseif event == 6 then
		contentstr = string.format("【%s】【%s】为壮大【%s】势力，保四方平安，开启【紧急支援】", pos2,name2,thiszone)
	elseif event == 7 then
		contentstr = string.format("【%s】作为前朝天下会的【%s】，带领众江湖侠士共同为【%s】做出了非凡的贡献，赢得万民敬仰，成功连任本朝天下会【%s】！", name1,pos1,thiszone,pos1)
	elseif event == 8 then
		contentstr = string.format("【%s】天下会向本服发起【雪镇之争】", otherzone)
	elseif event == 9 then
		contentstr = string.format("【%s】【%s】为保护【%s】疆土，抵御外侵，开启【番邦入侵】", pos2,name2,thiszone)
	end
	
	CountryEventLog = string.format("^000000%s，%s",Time,contentstr)
	return CountryEventLog,Country.LogEvent[event+1]
end

--Country.CountryActivity 用于倒计时提示界面
Country.CountryActivity = 
{
	{ ActivityID = 7399 , name = "紧急支援" , OpentimeDesc = "每天12:00-23:59" , LasttimeDesc = "4小时" , ActicityDesc = "盟主或苍穹贤士开启紧急支援活动期间支援边疆活动奖励将更加丰厚" , NPC = 86285},
	{ ActivityID = 7611 , name = "番邦入侵" , OpentimeDesc = "周六12:00-18:00" , LasttimeDesc = "1小时" , ActicityDesc = "到天下会武勋兑换处兑换【御敌战旗】使用并进入活动场景内击杀入侵者，保护镇疆大旗，幸运者将获得稀有绝学" },
	{ ActivityID = 7642 , name = "天下通缉" , OpentimeDesc = "每天12:00-22:00" , LasttimeDesc = "2小时" , ActicityDesc = "盟主或苍穹贤士到天下会军师处开启活动后，玩家需在两小时之内，前往天下会总管处接取当天随机任务，完成任务获取丰厚奖励回报" , NPC = 86723},
	{ ActivityID = 7686 , name = "决战黑木崖" , OpentimeDesc = "周五22:00-22:30" , LasttimeDesc = "0.5小时" , ActicityDesc = "有盟主在位时盟主或苍穹贤士预约成功活动后，持有决杀令的玩家以及天下会所有官员可以参加决战黑木崖活动，击杀规定数量的其他玩家努力攀爬到黑木崖之塔的顶层，获得高额奖励！！请务必保证任务列表未满，否则后果自负！！" , NPC = 86983},
}

--Country.CountryActivityList 和 Country.CountryActivityOpen用于玩家手动活动开启
--
Country.CountryActivityList =
{
	7399,
	7611,
	7642,
	7685,
}
Country.CountryActivityOpen = {}
--[[ 填写说明
Country.CountryActivityOpen[活动ID] =
{
	RelyActivityID = 前提活动ID ,
	name = "活动名" ,
	ActivityDesc = "活动描述文字，用于活动开启界面",
	ActivityOpenAlreadyStr = "活动已开启时给玩家的提示信息",
	RelyActivityCloseStr = "前提活动未开启时给玩家的提示信息",
	AuthorityLimitStr = "没有权限时的提示信息",
	AuthorityMask = 权限掩码值（需要找程序确认）
	ServerOpType = 服务器开启类型（需要找服务器程序确认）
	ServerParam1 = 参数1（一般填0）
	ServerParam2 = 参数2（一般填0）
}
]]--
Country.CountryActivityOpen[7399] =
{
	RelyActivityID = 7397 ,
	name = "紧急支援" ,
	ActivityDesc = "1、每天支援边疆活动开启后，盟主和苍穹贤士可以^FFCB40手动^FFFFFF开启紧急支援\r2、紧急支援开启后将持续^FFCB404小时^FFFFFF，活动期间参加支援边疆获得的奖励将^FFCB40更加丰厚^FFFFFF\r3、每天^FFCB4020:00-23:59^FFFFFF系统会自动开启一次紧急支援，方便错过上次紧急支援的玩家，享受紧急支援期间参加支援边疆活动所带来的惊喜",
	ActivityOpenAlreadyStr = "紧急支援已开启",
	RelyActivityCloseStr = "支援边疆未开启，不能开启紧急支援",
	AuthorityLimitStr = "没有权限开启紧急支援",
	AuthorityMask = 4,
	ServerOpType = 0,
	ServerParam1 = 0,
	ServerParam2 = 0,
}
Country.CountryActivityOpen[7611] =
{
	RelyActivityID = 7610 ,
	name = "番邦入侵" ,
	ActivityDesc = "1、每周六^FFCB4012:00-18:00^FFFFFF期间，盟主或苍穹贤士可以到天下会军师处开启活动，如不开启系统会在18点自动开启\r2、活动开启后，所有玩家使用^FFCB40御敌战旗^FFFFFF进行传送（御敌战旗需要用武勋兑换）",
	ActivityOpenAlreadyStr = "番邦入侵已开启",
	RelyActivityCloseStr = "番邦入侵时间未到，不能开启活动",
	AuthorityLimitStr = "没有权限开启番邦入侵",
	AuthorityMask = 16,
	ServerOpType = 2,
	ServerParam1 = 0,
	ServerParam2 = 0,
}
Country.CountryActivityOpen[7642] =
{
	RelyActivityID = 7641 ,
	name = "天下通缉" ,
	ActivityDesc = "1、每天^FFCB4012:00-22:00^FFFFFF期间，盟主或苍穹贤士可以到天下会军师处开启活动\r2、活动开启后，所有玩家可在天下会总管处接取当天随机任务。\r3、天下通缉开启后持续时间为^FFCB402小时^FFFFFF",
	ActivityOpenAlreadyStr = "天下通缉已开启",
	RelyActivityCloseStr = "天下通缉时间未到，不能开启活动",
	AuthorityLimitStr = "没有权限开启天下通缉",
	AuthorityMask = 16,
	ServerOpType = 3,
	ServerParam1 = 0,
	ServerParam2 = 0,
}
Country.CountryActivityOpen[7685] =
{
	RelyActivityID = 7684 ,
	name = "决战黑木崖" ,
	ActivityDesc = "1、周五^FFCB4021:00-22:00^FFFFFF期间，盟主或苍穹贤士可以到天下会军师处预约活动\r2、活动预约成功后，决战黑木崖将在当天22:00开启。\r3、决战黑木崖开启后持续时间为^FFCB400.5小时^FFFFFF \r4、^FFCB40活动成功开启，开启者将获得一份丰厚大奖^FFFFFF",
	ActivityOpenAlreadyStr = "决战黑木崖活动已预约",
	RelyActivityCloseStr = "决战黑木崖预约时间未到，不能预约",
	AuthorityLimitStr = "没有权限预约决战黑木崖活动",
	AuthorityMask = 16,
	ServerOpType = 4,
	ServerParam1 = 0,
	ServerParam2 = 0,
}

function Country:GetCountryActivityConfig()
	return Country.CountryActivity
end

function Country:GetCountryActivityList()
	return Country.CountryActivityList
end

function Country:GetCountryActivityOpenInfo(i)
	return Country.CountryActivityOpen[i]
end

function Country:GetCountryActivityName(i)
	return Country.CountryActivityOpen[i].name
end
