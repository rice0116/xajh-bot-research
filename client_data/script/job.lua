--[[#tag push auto]]

-----------------------------------------------------------
--差事相关数据接口定义
-----------------------------------------------------------

Job = {}

Job.EventType =
{
	LEARN_NEW_JOB		= 1,	--学习差事
	JOB_EXP			= 2,	--获得差事
	JOB_LEVELUP		= 3,	--差事升级
	JOB_ACTIVE		= 4,	--激差事
}

Job.LearnCfg =
{
	--治疗差事
	[1] =
	{
		--差事等级信息(差事id,学习描述)
		{id = 653, desc = --[[!AUTO_1]]"找#NpcID_29145#學習"},
		{id = 654, desc = --[[!AUTO_2]]"找#NpcID_29145#升級"},
	},
	--社交类型
	[2] =
	{
		--差事等级信息(差事id,学习描述)
		{id = 646, desc = --[[!AUTO_3]]"找#NpcID_29148#學習"},
		{id = 648, desc = --[[!AUTO_4]]"找#NpcID_29148#升級"},
	},
	--手工类型
	[3] =
	{
		--差事等级信息(差事id,学习描述)
		{id = 649, desc = --[[!AUTO_5]]"找#NpcID_29142#學習"},
		{id = 650, desc = --[[!AUTO_6]]"找#NpcID_29148#升級"},
	},
	--门徒类型
	[4] =
	{
		--差事等级信息(差事id,学习描述)
		{id = 643, desc = --[[!AUTO_7]]"找#NpcID_29151#學習"},
		{id = 644, desc = --[[!AUTO_8]]"找#NpcID_29148#升級"},
	},
	--武者类型

	[5] =
	{
		--差事等级信息(差事id,学习描述)
		{id = 887, desc = --[[!AUTO_9]]"即將開放，敬請期待"},
		{id = 887, desc = --[[!AUTO_10]]"即將開放，敬請期待"},
	},
	--家园类型
	[6] =
	{
		--差事等级信息(差事id,学习描述)
		{id = 888, desc = --[[!AUTO_11]]"即將開放，敬請期待"},
		{id = 888, desc = --[[!AUTO_12]]"即將開放，敬請期待"},
	},
}

function Job:GetLearnCfg()
	for k, v in ipairs(Job.LearnCfg) do
		for i,t in pairs(v) do
			t.desc = Speak:LookUpLink(t.desc,0)

		end
	end
	return Job.LearnCfg
end

JobName =
	{

	[643]= --[[!AUTO_13]]"門徒基礎",
	[644]= --[[!AUTO_14]]"門徒培養",
	[645]= --[[!AUTO_15]]"門徒增益",
	[646]= --[[!AUTO_16]]"社交基礎",
	[647]= --[[!AUTO_17]]"社交導師",
	[648]= --[[!AUTO_18]]"社交樂師",
	[649]= --[[!AUTO_19]]"手工基礎",
	[650]= --[[!AUTO_20]]"手工金石",
	[651]= --[[!AUTO_21]]"手工布帛",
	[652]= --[[!AUTO_22]]"手工木革",
	[653]= --[[!AUTO_23]]"治療基礎",
	[654]= --[[!AUTO_24]]"治療養生",
	[655]= --[[!AUTO_25]]"治療藥師",
}

function Job:GetJobName(id_job)
	if JobName[id_job] then
		return JobName[id_job]
	end
	return --[[!AUTO_26]]"未知差事"
end

function Job:OnJobEvent(event,id_job,param)
	local jobstring = --[[!AUTO_27]]""
	local name = Job:GetJobName(id_job)
	if event == Job.EventType.LEARN_NEW_JOB then
		jobstring = string.format(--[[!AUTO_28]]"學會了%s差事！", name)
	elseif event == Job.EventType.JOB_EXP then
		jobstring = string.format(--[[!AUTO_29]]"獲得了%d差事經驗！", param)
	elseif event == Job.EventType.JOB_LEVELUP then
		jobstring = string.format(--[[!AUTO_30]]"差事%s已升至%d級！", name, param)
	elseif event == Job.EventType.JOB_ACTIVE then
		jobstring = string.format(--[[!AUTO_31]]"將%s設定成了目前差事！", name)
	end
	if jobstring ~= --[[!AUTO_32]]"" then
		GameApi.AddChatMessage(CHAT_CHANNEL_SYSTEM, jobstring)
	end
end


function Job:GetJobHint()
	return --[[!AUTO_33]]"提示：你可以學習多種差事，但目前啟動的差事只能有一個。"
end
