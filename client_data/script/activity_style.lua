--[[#encode ansi]]
--[[#tag push auto]]

ActivityStyle = {}

ActivityStyle.ActState =
{
	INVALID		= 0,

	NOT_OPEN	= 1,	--	此活动未开启
	OPENED		= 2,	--	此活动已开启
};

-- 场景参数随活动变化配置
ActivityStyle.Config =
{
	--	不能按活动id存为map，因为活动有先后顺序
	{
		ActivityID = 1618,
		EnvID = 901,
		ScendID =
		{
			[24] = true,
		},
		ActivityParam =
		{
			[ActivityStyle.ActState.NOT_OPEN] = {Main = --[[!AUTO_1]][====[杭州鬼節]====], Sub = --[[!AUTO_2]][====[未開啟]====], },
			[ActivityStyle.ActState.OPENED] = {Main = --[[!AUTO_3]][====[杭州鬼節]====], Sub = --[[!AUTO_4]][====[已開啟]====], },
		},
		DecalMapParam =
		{
--			["decal_blood"] = {false, true},	-- 未开启时是否显示，已开启时是否显示
		},
	},
	{
		ActivityID = 1617,
		ScendID =
		{
			[2] = true,
		},
		ActivityParam =
		{
			[ActivityStyle.ActState.NOT_OPEN] = {Main = --[[!AUTO_5]][====[西瓜節]====], Sub = --[[!AUTO_6]][====[]====], },
			[ActivityStyle.ActState.OPENED] = {Main = --[[!AUTO_7]][====[西瓜節]====], Sub = --[[!AUTO_8]][====[已開啟]====], },
		},
		DecalMapParam =
		{
--			["decal_blood"] = {false, true},	-- 未开启时是否显示，已开启时是否显示
		},
	},
}

-- 印花的场景参数初始化配置
ActivityStyle.DecalMap_List =
{
--	["decal_blood"] = { {1, }, {}, false, {}, }	--场景列表, 副本列表, 初始是否显示，活动状态显示配置
}



--------------------------------------------------------
------------------------ 函数 --------------------------
--------------------------------------------------------

function ActivityStyle:GetActivityParamForAllDecalMap()
	local decallist = ActivityStyle.DecalMap_List
--	local strDbg

	for k,v in pairs(decallist) do
		for k1,v1 in pairs(ActivityStyle.Config) do
			if v1.DecalMapParam then
				local idActivity = v1.ActivityID
				local d1 = v1.DecalMapParam[k]
				if d1 then
					v[4][idActivity] = d1
				end
			end
		end
	end
	return decallist
end

ActivityStyle.ActivityConfigIndex =
{
	--ActivityStyle.Config里配置的Activity的索引，方便查找。
	--在InitActivity时动态生成。
};

ActivityStyle.Event =
{
	INIT_ALL_ACTI	= 1, --初始化活动
	ACTIVITY_OPEN	= 2, --活动开始
	ACTIVITY_CLOSE	= 3, --活动结束
};

ActivityStyle.LastStyle = {Main = --[[!AUTO_9]][====[]====], Sub = --[[!AUTO_10]][====[]====], idActivity = 0, activityState = 0}

function ActivityStyle:ChangeActivityStyle(sMain, sSub, idActivity, activityState)
	GameApi.ChangeActivityStyle(sMain, sSub, idActivity, activityState)
	ActivityStyle.LastStyle.Main = sMain
	ActivityStyle.LastStyle.Sub  = sSub
	ActivityStyle.LastStyle.idActivity = idActivity
	ActivityStyle.LastStyle.activityState  = activityState
end

function ActivityStyle:InnerChangeActivityStyle(ActivityParam, idActivity, activityState)
	local detail = nil
	local main = --[[!AUTO_11]][====[]====]
	local sub = --[[!AUTO_12]][====[]====]

	if ActivityParam ~= nil then
		detail = ActivityParam[activityState]
	end
	if detail then
		main = detail.Main
		sub = detail.Sub
	end
	ActivityStyle:ChangeActivityStyle(main, sub, idActivity, activityState)
end

function ActivityStyle:DealWorldSceneID(v, idWorld, idScene)
	local bDeal = (idWorld == 0 or (v.WorldID == nil or v.WorldID[idWorld] == true))
				and (v.ScendID == nil or v.ScendID[idScene] == true)
	return bDeal
end

ActivityStyle.ActivityConfigIndex =
{
	--ActivityStyle.Config里配置的Activity的索引，方便查找。
	--在InitActivity时动态生成。
};

--事件调用接口
--新增活动API:     GameApi.IsActiveActivity(110), GameApi.IsFinishedActivity(110)
--新增修改场景API: GameApi.ChangeActivityStyle(Main, Sub, idActivity, activityState)
--活动类事件Key:  "activity_id"
function ActivityStyle:OnEvent(idEvent, param_tbl)
	local activityCfg = ActivityStyle.Config
	local idWorld, idScene, idBoard = GameApi.GetSceneInfo()
	local activityState = ActivityStyle.ActState.INVALID

	if idEvent == ActivityStyle.Event.INIT_ALL_ACTI then
		ActivityStyle.LastStyle = {Main = --[[!AUTO_13]][====[]====], Sub = --[[!AUTO_14]][====[]====], idActivity = 0, activityState = 0}

		for k,v in pairs(activityCfg) do
			ActivityStyle.ActivityConfigIndex[v.ActivityID] = k
			local idActivity = v.ActivityID
			if ActivityStyle:DealWorldSceneID(v, idWorld, idScene) then
				local state = GameApi.GetActivityState(idActivity)

				if state == 0 then
					activityState = ActivityStyle.ActState.OPENED
				elseif state == 1 then
					activityState = ActivityStyle.ActState.NOT_OPEN
				else
					activityState = ActivityStyle.ActState.INVALID
				end

				if activityState == ActivityStyle.ActState.OPENED and v.EnvID then
					GameApi.SetActivityEnv(v.EnvID)
				end

				if activityState ~= ActivityStyle.ActState.INVALID then
				 	ActivityStyle:InnerChangeActivityStyle(v.ActivityParam, idActivity, activityState)
				end
			end
		end
	elseif idEvent == ActivityStyle.Event.ACTIVITY_OPEN then
		local idActivity = param_tbl["activity_id"]
		local activityIndex = ActivityStyle.ActivityConfigIndex[idActivity]
		if activityIndex then
			local v = activityCfg[activityIndex]
			if v and ActivityStyle:DealWorldSceneID(v, idWorld, idScene) then
				activityState = ActivityStyle.ActState.OPENED
				ActivityStyle:InnerChangeActivityStyle(v.ActivityParam, idActivity, activityState)
			end
		end
	elseif idEvent == ActivityStyle.Event.ACTIVITY_CLOSE then
		local idActivity = param_tbl["activity_id"]
		local activityIndex = ActivityStyle.ActivityConfigIndex[idActivity]
		GameApi.SetActivityEnv(0)
		if activityIndex then
			local v = activityCfg[activityIndex]
			if v and ActivityStyle:DealWorldSceneID(v, idWorld, idScene) then
				activityState = ActivityStyle.ActState.NOT_OPEN
				ActivityStyle:InnerChangeActivityStyle(v.ActivityParam, idActivity, activityState)
			end
		end
	end
end

