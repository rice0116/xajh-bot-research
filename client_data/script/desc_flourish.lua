--[[#tag push auto]]

Flourish = {}

----------------------------------------------------
--数据配置区
Flourish.Reputation = 46
Flourish.Version = 1
Flourish.Award =
{
	{Repu = 20, Award = 7251, tips = "^a800ff寶銀^ffffff*2\r^00ff00一定量銀票"},
	{Repu = 35, Award = 7252, tips = "^a800ff寶銀^ffffff*3\r^00ff001級精煉石^ffffff*5"},
	{Repu = 50, Award = 7253, tips = "^a800ff寶銀^ffffff*5\r^a800ff星塵砂^ffffff*3\r^00ff00雙倍經驗藥（小）^ffffff*1\r^00ff00玲瓏丹^ffffff*2"},
	{Repu = 70, Award = 7254, tips = "^a800ff宝银^ffffff*10\r^00ff0070活跃度礼包^ffffff*1"},
}

----------------------------------------------------
Flourish.Task =
{
	{
		TaskID = {8626},
		Desc = "每日第一次上線",
		FlourishNum = 20,
		ActivityCount = 1,
		DetailDesc = "",
		QuikAccomplish = false,
	},
	{
		TaskID = {4777},
		Desc = "完成一次綠竹幻想鄉",
		FlourishNum = 5,
		ActivityCount = 1,
		DetailDesc = "",
		QuikAccomplish = false,
	},
	{
		TaskID = {4778},
		Desc = "完成四次龍嶺迷窟/百毒入侵",
		FlourishNum = 3,
		ActivityCount = 4,
		DetailDesc = "",
		QuikAccomplish = false,
	},
	--[[{
		TaskID = {5512},
		Desc = "完成三次百毒入侵",
		FlourishNum = 2,
		ActivityCount = 3,
		DetailDesc = "",
		QuikAccomplish = false,
	},]]--
	{
		TaskID = {7727},
		Desc = "完成三次九層妖樓",
		FlourishNum = 4,
		ActivityCount = 3,
		DetailDesc = "",
		QuikAccomplish = false,
	},
	{
		TaskID = {8630},
		Desc = "完成一次俠客及以上難度的副本",
		FlourishNum = 5,
		ActivityCount = 1,
		DetailDesc = "",
		QuikAccomplish = false,
	},
	{
		TaskID = {8631},
		Desc = "完成一次盟主難度的副本",
		FlourishNum = 10,
		ActivityCount = 1,
		DetailDesc = "",
		QuikAccomplish = false,
	},
	{
		TaskID = {7349},
		Desc = "完成一次以武會友任務",
		FlourishNum = 3,
		ActivityCount = 1,
		DetailDesc = "",
		QuikAccomplish = false,
	},
	{
		TaskID = {7705},
		Desc = "通關絕情谷禁地",
		FlourishNum = 5,
		ActivityCount = 1,
		DetailDesc = "",
		QuikAccomplish = false,
	},
	{
		TaskID = {8584},
		Desc = "通關截擊刺客",
		FlourishNum = 5,
		ActivityCount = 1,
		DetailDesc = "",
		QuikAccomplish = false,
	},
	{
		TaskID = {9952},
		Desc = "進入六道輪回副本",
		FlourishNum = 5,
		ActivityCount = 1,
		DetailDesc = "",
		QuikAccomplish = false,
	},
	{
		TaskID = {10810},
		Desc = "完成一次青城/洛陽戰場的首勝任務",
		FlourishNum = 5,
		ActivityCount = 1,
		DetailDesc = "",
		QuikAccomplish = false,
	},
	{
		TaskID = {10811},
		Desc = "獲得一次風火連城戰場的獎勵",
		FlourishNum = 5,
		ActivityCount = 1,
		DetailDesc = "",
		QuikAccomplish = false,
	},
	{
		TaskID = {10812},
		Desc = "完成一次秦陵對決副本",
		FlourishNum = 5,
		ActivityCount = 1,
		DetailDesc = "",
		QuikAccomplish = false,
	},
	{
		TaskID = {10978},
		Desc = "成功抵達墟市的終點",
		FlourishNum = 10,
		ActivityCount = 1,
		DetailDesc = "",
		QuikAccomplish = false,
	},
	{
		TaskID = {9953},
		Desc = "天下會運鏢四次",
		FlourishNum = 2,
		ActivityCount = 4,
		DetailDesc = "",
		QuikAccomplish = false,
	},
	{
		TaskID = {8629},
		Desc = "給好友送禮兩次",
		FlourishNum = 2,
		ActivityCount = 2,
		DetailDesc = "",
		QuikAccomplish = false,
	},
	{
		TaskID = {8632},
		Desc = "完成帮派小队运镖一次",
		FlourishNum = 3,
		ActivityCount = 1,
		DetailDesc = "",
		QuikAccomplish = false,
	},
	--[[{
		TaskID = {8633},
		Desc = "任意一件装备强化提升一级",
		FlourishNum = 3,
		ActivityCount = 1,
		DetailDesc = "",
		QuikAccomplish = false,
	},
	{
		TaskID = {8634},
		Desc = "完成一次宝石镶嵌",
		FlourishNum = 3,
		ActivityCount = 1,
		DetailDesc = "",
		QuikAccomplish = false,
	},]]--
	{
		TaskID = {8543},
		Desc = "時裝染色一次",
		FlourishNum = 5,
		ActivityCount = 1,
		DetailDesc = "",
		QuikAccomplish = false,
	},
	{
		TaskID = {9954},
		Desc = "商城消費一次",
		FlourishNum = 6,
		ActivityCount = 1,
		DetailDesc = "",
		QuikAccomplish = false,
	},
	{
		TaskID = {9955},
		Desc = "抽取風物志卡牌一次",
		FlourishNum = 3,
		ActivityCount = 1,
		DetailDesc = "",
		QuikAccomplish = false,
	},
	{
		TaskID = {9956},
		Desc = "使用雙倍經驗藥一次",
		FlourishNum = 3,
		ActivityCount = 1,
		DetailDesc = "",
		QuikAccomplish = false,
	},
}

Flourish.RegulationDesc = "活躍度規則：\r1、每日完成上述條件，可獲得對應的活躍度，到達一定值即可領取對應的獎勵。\r2、每日早上8點清空前一天的活躍度點數。"

----------------------------------------------------


----------------------------------------------------
--客户端用接口
function Flourish:GetRepuId()
	return Flourish.Reputation
end

function Flourish:GetAwardCfg()
	return Flourish.Award
end

function Flourish:GetFlourishTask()
	return Flourish.Task
end

function Flourish:GetFlourishReguDesc()
	return Flourish.RegulationDesc
end


----------------------------------------------------


----------------------------------------------------
--服务器用接口
function GetFlourishRepuId()
	return Flourish.Reputation
end

function GetFlourishVersion()
	return Flourish.Version
end

function GetFlourishAward()
	local tbl = {}
	for k,v in pairs(Flourish.Award) do
		tbl[#tbl + 1] = v.Repu
		tbl[#tbl + 1] = v.Award
	end
	tbl[#tbl + 1] =  #tbl
	return unpack(tbl)
end

