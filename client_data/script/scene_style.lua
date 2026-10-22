--[[#encode ansi]]
--[[#tag push auto]]


--------------------------------------------------------
-- NPC/场景/印花/场景Gfx/场景ECModel显隐.
-- 这个脚本里是函数定义，数据见scene_style_data.lua
-- Created by GuoJie @2012
--------------------------------------------------------

SceneStyle = {}

SceneStyle.TaskState =
{
	INVALID		= -1,	--	无此任务

	NONE		= 0,	--	此任务的完成数为0
	ACCEPT 		= 1,	--	接到
	CANFINISH 	= 2, 	--	完成没交
	FINISHED	= 3,	--	交成功
	FAIL		= 4,	--	失败
};

SceneStyle.SSEvent =
{
	SSEVENT_INIT_TASK		= 1, --任务数据生成
	SSEVENT_ACCETP_TASK		= 2, --接到任务
	SSEVENT_CANFNSH_TASK		= 3, --任务达成还没交
	SSEVENT_FINISHED_TASK		= 4, --交了任务（成功或失败）
	SSEVENT_GIVEUP_TASK		= 5, --放弃任务
	SSEVENT_TASK_FINISHCOUNT	= 6, --更新任务完成次数
};

function SceneStyle:GetSceneParamForAllNPC()
	return SceneStyle.NPC_List
end

function SceneStyle:GetSceneParamForAllGfx()
	return SceneStyle.SceneGfx_List
end

function SceneStyle:GetSceneParamForAllECModel()
	return SceneStyle.SceneECModel_List
end

function SceneStyle:GetSceneParamForAllDecalMap()
	local decallist = SceneStyle.DecalMap_List
--	local strDbg

	for k,v in pairs(decallist) do
		for k1,v1 in pairs(SceneStyle.Config) do
			if v1.DecalMapParam then
				local idTask = v1.TaskID
				local d1 = v1.DecalMapParam[k]
				if d1 then
					v[5][idTask] = d1
--					strDbg = string.format("GetSceneParamForAllDecalMap: Find DecalMap %s for Task %d\n", k, idTask)
--					LogPrint(strDbg)
				end
			end
		end
	end
	return decallist
end

SceneStyle.LastStyle = {Main = --[[!AUTO_1]][====[]====], Sub = --[[!AUTO_2]][====[]====], idTask = 0, taskState = 0}

function SceneStyle:ChangeSceneStyle(sMain, sSub, idTask, taskState, NPCParam)
	local bCall = true
	if taskState == SceneStyle.TaskState.CANFINISH then
		-- CanFinish会每隔一段时间调用一次，屏蔽一下
		if SceneStyle.LastStyle.Main == sMain and SceneStyle.LastStyle.Sub == sSub
			and SceneStyle.LastStyle.idTask == idTask and SceneStyle.LastStyle.taskState == taskState then
			bCall = false
		end
	end

	if bCall == true then
		GameApi.ChangeSceneStyle(sMain, sSub, idTask, taskState, NPCParam)
		SceneStyle.LastStyle.Main = sMain
		SceneStyle.LastStyle.Sub  = sSub
		SceneStyle.LastStyle.idTask = idTask
		SceneStyle.LastStyle.taskState  = taskState

		--local strDbg = string.format("SceneStyle:InnerChangeSceneStyle: %d, State: %d, Main: %s, Sub: %s\n", idTask, taskState, sMain, sSub)
		--LogPrint(strDbg)
	end
end

function SceneStyle:InnerChangeSceneStyle(ParamTab, idTask, taskState)
	local detailScene = nil
	local main = --[[!AUTO_3]][====[]====]
	local sub = --[[!AUTO_4]][====[]====]

	if ParamTab.SceneParam ~= nil then
		detailScene = ParamTab.SceneParam[taskState]
	end

	if detailScene then
		main = detailScene.Main
		sub = detailScene.Sub
	end

	local retTab =
	{
		ParamTab.NPCParam and ParamTab.NPCParam or {},
		ParamTab.SceneGfxParam and ParamTab.SceneGfxParam or {},
		ParamTab.SceneModelParam and ParamTab.SceneModelParam or {},
	}
	SceneStyle:ChangeSceneStyle(main, sub, idTask, taskState, retTab)
end

function SceneStyle:DealWorldSceneID(v, idWorld, idScene)
	local bDeal = (idWorld == 0 or (v.WorldID == nil or v.WorldID[idWorld] == true))
				and (v.ScendID == nil or v.ScendID[idScene] == true)
	return bDeal
end

SceneStyle.g_bTaskCfgIdxGenerated = false
SceneStyle.TaskConfigIndex =
{
	--SceneStyle.Config里配置的Task的索引，方便查找。
	--在InitTask时动态生成。
};

function SceneStyle:CheckGenTaskCfgIdx()
	--生成所有任务在配置中的索引
	if not SceneStyle.g_bTaskCfgIdxGenerated then
		for k,v in pairs(SceneStyle.Config) do
			SceneStyle.TaskConfigIndex[v.TaskID] = k
		end
		--LogPrint("SceneStyle:CheckGenTaskCfgIdx: All index Generated\n")
		SceneStyle.g_bTaskCfgIdxGenerated = true
	end
end

-- CanFinish会每隔一段时间调用一次，用这个表记录以屏蔽
SceneStyle.CanFinishTask_StoreMap = {}

--事件调用接口
--新增任务API:     GameApi.IsActiveTask(110), GameApi.IsFinishedTask(110)
--新增修改场景API: GameApi.ChangeSceneStyle(Main, Sub, idTask, taskState)
--任务类事件Key:  "task_id"
--场景初始化Key:  "scene_id"
--是否成功Key:    "task_succ"
function SceneStyle:OnEvent(idEvent, param_tbl)
	local sceneCfg = SceneStyle.Config
	local npcCfg = NPCStyle.Config
	local idWorld, idScene, idBoard = GameApi.GetSceneInfo()
	local taskState = SceneStyle.TaskState.INVALID

	--local strdbg = string.format("SceneStyle:OnEvent: %d, WorldID %d, SceneID %d\n", idEvent, idWorld, idScene)
	--LogPrint(strdbg)

	--首先检查生成任务id索引
	SceneStyle:CheckGenTaskCfgIdx()

	if idEvent == SceneStyle.SSEvent.SSEVENT_INIT_TASK then

		SceneStyle.CanFinishTask_StoreMap = {}

		-- 人身上所有任务及状态
		for idTask, state in pairs(param_tbl) do

			if state == SceneStyle.TaskState.SSEVENT_CANFNSH_TASK then
				SceneStyle.CanFinishTask_StoreMap[idTask] = state
			end

			-- 任务功能调用
			TaskHelp:OnTaskEvent_DOF(idTask, state)

		end

		-- 所有配置了Style的任务
		SceneStyle.LastStyle = {Main = --[[!AUTO_5]][====[]====], Sub = --[[!AUTO_6]][====[]====], idTask = 0, taskState = 0}
		for k,v in pairs(sceneCfg) do
			if SceneStyle:DealWorldSceneID(v, idWorld, idScene) then
				local idTask = v.TaskID
				taskState = param_tbl[idTask]

				if taskState and taskState ~= SceneStyle.TaskState.INVALID then
				 	SceneStyle:InnerChangeSceneStyle(v, idTask, taskState)
				end
			end
		end

		NPCStyle.LastStyle = {tidNPC = 0, hashAlias = 0, idTask = 0, taskState = 0}
		for k,v in pairs(npcCfg) do
			--生成这个任务在配置中的索引
			NPCStyle.TaskConfigIndex[v.TaskID] = k

			if NPCStyle:DealWorldSceneID(v, idWorld, idScene) then
				local idTask = v.TaskID
				taskState = param_tbl[idTask]

				if taskState and taskState ~= NPCStyle.TaskState.INVALID then
					NPCStyle:ChangeNPCStyle(idTask, taskState)
				end
			end
		end

	elseif idEvent == SceneStyle.SSEvent.SSEVENT_ACCETP_TASK then
		local idTask = param_tbl["task_id"]
		local taskIndex = SceneStyle.TaskConfigIndex[idTask]
		taskState = SceneStyle.TaskState.ACCEPT

		TaskHelp:OnTaskEvent_DOF(idTask, taskState)

		if taskIndex then
			--strdbg = string.format("SceneStyle:Event ACCETP_TASK: %d, idx %d\n", idTask, taskIndex)
			--LogPrint(strdbg)

			local v = sceneCfg[taskIndex]
			if v and SceneStyle:DealWorldSceneID(v, idWorld, idScene) then
				SceneStyle:InnerChangeSceneStyle(v, idTask, taskState)
			end
		end

		taskIndex = NPCStyle.TaskConfigIndex[idTask]
		if taskIndex then
			local v = npcCfg[taskIndex]
			if v and NPCStyle:DealWorldSceneID(v, idWorld, idScene) then
				NPCStyle:ChangeNPCStyle(idTask, taskState)
			end
		end

		RegionCamera:OnTaskState(idWorld, idScene, idTask, taskState)

	elseif idEvent == SceneStyle.SSEvent.SSEVENT_CANFNSH_TASK then
		local idTask = param_tbl["task_id"]
		local taskIndex = SceneStyle.TaskConfigIndex[idTask]
		taskState = SceneStyle.TaskState.CANFINISH

		--strdbg = string.format("SceneStyle:Event SSEVENT_CANFNSH_TASK: %d\n", idTask)
		--LogPrint(strdbg)

		if SceneStyle.CanFinishTask_StoreMap[idTask] == nil then
			SceneStyle.CanFinishTask_StoreMap[idTask] = taskState
			TaskHelp:OnTaskEvent_DOF(idTask, taskState)
			RegionCamera:OnTaskState(idWorld, idScene, idTask, taskState)
		end

		if taskIndex then
			--strdbg = string.format("SceneStyle:Event CANFNSH_TASK: %d, idx %d\n", idTask, taskIndex)
			--LogPrint(strdbg)

			local v = sceneCfg[taskIndex]
			if v and SceneStyle:DealWorldSceneID(v, idWorld, idScene) then
				SceneStyle:InnerChangeSceneStyle(v, idTask, taskState)
			end
		end

		taskIndex = NPCStyle.TaskConfigIndex[idTask]
		if taskIndex then
			local v = npcCfg[taskIndex]
			if v and NPCStyle:DealWorldSceneID(v, idWorld, idScene) then
				NPCStyle:ChangeNPCStyle(idTask, taskState)
			end
		end

	elseif idEvent == SceneStyle.SSEvent.SSEVENT_FINISHED_TASK then
		local idTask = param_tbl["task_id"]
		local taskIndex = SceneStyle.TaskConfigIndex[idTask]
		local bSucc = param_tbl["task_succ"]
		if bSucc == true then
				taskState = SceneStyle.TaskState.FINISHED
		else
				taskState = SceneStyle.TaskState.FAIL
		end

		SceneStyle.CanFinishTask_StoreMap[idTask] = nil
		TaskHelp:OnTaskEvent_DOF(idTask, taskState)

		if taskIndex then
			--strdbg = string.format("SceneStyle:Event FINISHED_TASK: %d, idx %d\n", idTask, taskIndex)
			--LogPrint(strdbg)

			local v = sceneCfg[taskIndex]
			if v and SceneStyle:DealWorldSceneID(v, idWorld, idScene) then
				SceneStyle:InnerChangeSceneStyle(v, idTask, taskState)
			end
		end

		taskIndex = NPCStyle.TaskConfigIndex[idTask]
		if taskIndex then
			local v = npcCfg[taskIndex]
			if v and NPCStyle:DealWorldSceneID(v, idWorld, idScene) then
				NPCStyle:ChangeNPCStyle(idTask, taskState)
			end
		end

		RegionCamera:OnTaskState(idWorld, idScene, idTask, taskState)

	elseif idEvent == SceneStyle.SSEvent.SSEVENT_GIVEUP_TASK then
		local idTask = param_tbl["task_id"]
		local taskIndex = SceneStyle.TaskConfigIndex[idTask]
		taskState = SceneStyle.TaskState.FAIL

		SceneStyle.CanFinishTask_StoreMap[idTask] = nil
		TaskHelp:OnTaskEvent_DOF(idTask, taskState)

		if taskIndex then
			--strdbg = string.format("SceneStyle:Event GIVEUP_TASK: %d, idx %d\n", idTask, taskIndex)
			--LogPrint(strdbg)

			local v = sceneCfg[taskIndex]
			if v and SceneStyle:DealWorldSceneID(v, idWorld, idScene) then
				SceneStyle:InnerChangeSceneStyle(v, idTask, taskState)
			end
		end

		taskIndex = NPCStyle.TaskConfigIndex[idTask]
		if taskIndex then
			local v = npcCfg[taskIndex]
			if v and NPCStyle:DealWorldSceneID(v, idWorld, idScene) then
				NPCStyle:ChangeNPCStyle(idTask, taskState)
			end
		end

		RegionCamera:OnTaskState(idWorld, idScene, idTask, taskState)

	elseif idEvent == SceneStyle.SSEvent.SSEVENT_TASK_FINISHCOUNT then
		local idTask = param_tbl["task_id"]
		local taskIndex = SceneStyle.TaskConfigIndex[idTask]
		local finishcount = param_tbl["finish_count"]
		if finishcount > 0 then
			taskState = SceneStyle.TaskState.FINISHED
		else
			taskState = SceneStyle.TaskState.NONE
		end

		SceneStyle.CanFinishTask_StoreMap[idTask] = nil
		TaskHelp:OnTaskEvent_DOF(idTask, taskState)

		if taskIndex then
			--strdbg = string.format("SceneStyle:Event TASK_FINISHCOUNT: %d, idx %d\n", idTask, taskIndex)
			--LogPrint(strdbg)
			local v = sceneCfg[taskIndex]
			if v and SceneStyle:DealWorldSceneID(v, idWorld, idScene) then
				SceneStyle:InnerChangeSceneStyle(v, idTask, taskState)
			end
		end

		taskIndex = NPCStyle.TaskConfigIndex[idTask]
		if taskIndex then
			local v = npcCfg[taskIndex]
			if v and NPCStyle:DealWorldSceneID(v, idWorld, idScene) then
				NPCStyle:ChangeNPCStyle(idTask, taskState)
			end
		end

		RegionCamera:OnTaskState(idWorld, idScene, idTask, taskState)

	end

end

