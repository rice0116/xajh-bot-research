---------------------------------------------------------------
--  created:   2009.09.16
--  author:    djh
--
--  场景CG控制
---------------------------------------------------------------
--CG播放需要的接口定义说明
--[[
--]]

--数值表定义
SceneCG	  = {CGID = 0,BeginTime = 0,ElapseTime = 0,BeckonNpc = {}}
CGNpcApi  = {}

--获得字幕参数
function SceneCG:GetCGTitle(idTitle)	
    return CGTitle[idTitle]
end

--更新CG(根据时间轴进行操作)
--返回true或者false表示是否播放完成(false为播放完成)
function SceneCG:TickCG(deltaTime)
	if SceneCG.CGID >0 and CGList[SceneCG.CGID] then
		SceneCG.ElapseTime = SceneCG.ElapseTime + deltaTime
		if #CGList[SceneCG.CGID].TimeSegment > 0 then
			for k,v in pairs(CGList[SceneCG.CGID].TimeSegment) do
				if v and v.Apply and v.HaveRun == false then
					v.Apply(SceneCG.ElapseTime,v)
				end
			end

			if SceneCG.ElapseTime > CGList[SceneCG.CGID].CGTime then
				return false
			end
			return true
		end
	end
	return false
end

--播放CG定义(填充时间轴和参数值)
function SceneCG:PlayCG(cgID)
	if CGList[cgID] then
		local idScene = GameApi.GetSceneID()
		if idScene <= 0 or CGList[cgID].SceneID <= 0 or idScene == CGList[cgID].SceneID then
			for k,v in pairs(CGList[cgID].TimeSegment) do
				if v then
					v.HaveRun = false
				end
			end
			SceneCG.CGID        = cgID
			SceneCG.BeginTime   = 0
			SceneCG.ElapseTime  = 0
			SceneCG.BeckonNpc	= {}

			return true
		end
	end
	return false
end

--强制运行时间点函数
function SceneCG:ApplyTimePoint(cgID,iTime)
	if CGList[cgID] then
		local idScene = GameApi.GetSceneID()
		if idScene <= 0 or CGList[cgID].SceneID <= 0 or idScene == CGList[cgID].SceneID then
			for k,v in pairs(CGList[cgID].TimeSegment) do
				if v and v.TimePoint and v.Apply and v.HaveRun == false and v.TimePoint == iTime then
					v.Apply(v.TimePoint,v)
					return true
				end
			end
		end
	end
	return false
end

--玩家按下Esc
function SceneCG:OnEsc()
	if SceneCG.CGID >0 and CGList[SceneCG.CGID] then
		return CGList[SceneCG.CGID].CanEscClose
	end
	return true
end

--玩家按下Esc
function SceneCG:CanChangeScene()
	if SceneCG.CGID >0 and CGList[SceneCG.CGID] then
		return CGList[SceneCG.CGID].CanChangeScene
	end
	return true
end

--停止播放
function SceneCG:StopCG()
	if SceneCG.CGID > 0 and CGList[SceneCG.CGID] then
		for k,v in pairs(CGList[SceneCG.CGID].TimeSegment) do
			if v then
				v.HaveRun = false
			end
		end
		SceneCG.BeginTime   = 0
		SceneCG.ElapseTime  = 0
		SceneCG.CGID = 0

		CGNpcApi:HideAllCgNpc(0)
	end
end

--CG中NPC操作接口
function CGNpcApi:Show(beckon_id,npc_tid,show_name,pos_x,pos_z,dir_x,dir_z,show_gfx)
	NpcBeckon.NPC[beckon_id] = NpcBeckon:CopyTable(NpcBeckon.NPC[0])
	NpcBeckon.NPC[beckon_id].TID						= npc_tid
	NpcBeckon.NPC[beckon_id].ShowGfx					= show_gfx
	NpcBeckon.NPC[beckon_id].ShowName.Show				= false
	NpcBeckon.NPC[beckon_id].ShowName.Name				= show_name
	NpcBeckon.NPC[beckon_id].Pos.X						= pos_x
	NpcBeckon.NPC[beckon_id].Pos.Z						= pos_z
	NpcBeckon.NPC[beckon_id].Dir.X						= dir_x
	NpcBeckon.NPC[beckon_id].Dir.Z						= dir_z	

	NpcBeckon:Beckon(beckon_id)
	
	LogPrint(string.format("CGNpcApi Beckon  BID: %d, TID: %d\r\n",beckon_id,npc_tid))

	GameApi.BeckonNpcEnableFsmAction(NpcBeckon.NPC[beckon_id].NID,false)
	GameApi.BeckonNpcPlayAction(NpcBeckon.NPC[beckon_id].NID,"站立")

	if SceneCG.CGID > 0 then
		SceneCG.BeckonNpc[#SceneCG.BeckonNpc + 1] =  beckon_id
	end
end

function CGNpcApi:Hide(beckon_id,fade_time,hide_gfx)
	if NpcBeckon.NPC[beckon_id] then
		NpcBeckon.NPC[beckon_id].HideGfx	= hide_gfx
		NpcBeckon.NPC[beckon_id].DispelTime	= fade_time
		
		NpcBeckon:Dispel(beckon_id)
	end
end

function CGNpcApi:ShowName(beckon_id,is_show,name)
	if NpcBeckon.NPC[beckon_id] then
		NpcBeckon:ShowName(beckon_id,name,is_show)
	end
end

function CGNpcApi:HideAllCgNpc(fadeout_time)
	for k,v in pairs(SceneCG.BeckonNpc) do
		local beckon_id = v
		if NpcBeckon.NPC[beckon_id] then
			NpcBeckon.NPC[beckon_id].DispelTime	= fadeout_time
			NpcBeckon:Dispel(beckon_id)
		end
	end

	SceneCG.BeckonNpc = {}
end

function CGNpcApi:SetFixIdleAction(beckon_id,action)
	if NpcBeckon.NPC[beckon_id] then
		GameApi.BeckonNpcFixIdleAction(NpcBeckon.NPC[beckon_id].NID,action)
	end
end

function CGNpcApi:SetStopMoveAction(beckon_id,action)
	if NpcBeckon.NPC[beckon_id] then
		GameApi.BeckonNpcSetStopMoveAction(NpcBeckon.NPC[beckon_id].NID,action)
	end
end

function CGNpcApi:WalkTo(beckon_id,speed_walk,pos_x,pos_z,stop_dis)
	if NpcBeckon.NPC[beckon_id] then
		NpcBeckon.NPC[beckon_id].AutoMove.WalkSpeed         = speed_walk
		NpcBeckon.NPC[beckon_id].AutoMove.StopDistance      = stop_dis

		local pos_tbl = {X = pos_x, Y = 0, Z = pos_z}
		NpcBeckon:WalkWithCB(beckon_id,pos_tbl,0)
	end
end

function CGNpcApi:RunTo(beckon_id,speed_run,pos_x,pos_z,stop_dis)
	if NpcBeckon.NPC[beckon_id] then
		NpcBeckon.NPC[beckon_id].AutoMove.RunSpeed          = speed_run
		NpcBeckon.NPC[beckon_id].AutoMove.StopDistance      = stop_dis

		local pos_tbl = {X = pos_x, Y = 0, Z = pos_z}
		NpcBeckon:RunWithCB(beckon_id,pos_tbl,0)
	end
end

function CGNpcApi:BeginSkillMove(beckon_id,move_act,stop_act,pos_x,pos_z,move_speed,stop_dis)
	if NpcBeckon.NPC[beckon_id] then
		GameApi.BeckonNpcBeginSkillMove(NpcBeckon.NPC[beckon_id].NID,move_act,stop_act,pos_x,pos_z,move_speed,stop_dis)
	end
end

function CGNpcApi:EndSkillMove(beckon_id)
	if NpcBeckon.NPC[beckon_id] then
		GameApi.BeckonNpcEndSkillMove(NpcBeckon.NPC[beckon_id].NID)
	end
end

function CGNpcApi:SetWalkAction(beckon_id,action)
	if NpcBeckon.NPC[beckon_id] then
		GameApi.BeckonNpcSetWalkAction(NpcBeckon.NPC[beckon_id].NID,action)
	end
end

function CGNpcApi:SetRunAction(beckon_id,action)
	if NpcBeckon.NPC[beckon_id] then
		GameApi.BeckonNpcSetRunAction(NpcBeckon.NPC[beckon_id].NID,action)
	end
end

function CGNpcApi:SetEnableFsmAction(beckon_id,is_enable)
	if NpcBeckon.NPC[beckon_id] then
		GameApi.BeckonNpcEnableFsmAction(NpcBeckon.NPC[beckon_id].NID,is_enable)
	end
end

function CGNpcApi:SetDir(beckon_id,dir_x,dir_y,dir_z)
	if NpcBeckon.NPC[beckon_id] then
		GameApi.SetBeckonNpcDir(NpcBeckon.NPC[beckon_id].NID,dir_x,dir_y,dir_z)
	end
end

function CGNpcApi:SetPos(beckon_id,pos_x,pos_y,pos_z)
	if NpcBeckon.NPC[beckon_id] then
		GameApi.SetBeckonNpcPos(NpcBeckon.NPC[beckon_id].NID,pos_x,pos_y,pos_z)
	end
end

function CGNpcApi:WalkAlongPath(beckon_id,speed_walk,path_id)
	if NpcBeckon.NPC[beckon_id] then
		NpcBeckon.NPC[beckon_id].AutoMove.WalkSpeed = speed_walk
		GameApi.BeckonNpcWalkAlongPath(NpcBeckon.NPC[beckon_id].NID,path_id,speed_walk)
	end
end

function CGNpcApi:RunAlongPath(beckon_id,speed_run,path_id)
	if NpcBeckon.NPC[beckon_id] then
		NpcBeckon.NPC[beckon_id].AutoMove.RunSpeed          = speed_run
		GameApi.BeckonNpcRunAlongPath(NpcBeckon.NPC[beckon_id].NID,path_id,speed_run)
	end
end

function CGNpcApi:StopAutoMove(beckon_id)
	if NpcBeckon.NPC[beckon_id] then
		GameApi.BeckonNpcStopAutoMove(NpcBeckon.NPC[beckon_id].NID)
	end
end

function CGNpcApi:PlayAction(beckon_id,action_name)
	if NpcBeckon.NPC[beckon_id] then
		NpcBeckon:PlayAction(beckon_id,action_name,0)
	end
end

function CGNpcApi:SetDead(beckon_id)
	if NpcBeckon.NPC[beckon_id] then
		GameApi.BeckonNpcSetDead(NpcBeckon.NPC[beckon_id].NID)
	end
end

function CGNpcApi:EnableAction(beckon_id,is_enable)
	if NpcBeckon.NPC[beckon_id] then
		GameApi.BeckonNpcEnableAction(NpcBeckon.NPC[beckon_id].NID,is_enable)
	end
end

function CGNpcApi:SetActionNum(beckon_id,num)
	if NpcBeckon.NPC[beckon_id] then
		GameApi.BeckonNpcSetActionNum(NpcBeckon.NPC[beckon_id].NID,num)
	end
end

function CGNpcApi:StartModelMotionBlur(beckon_id,total_time,frame_interval)
	if NpcBeckon.NPC[beckon_id] then
		CGApi.StartModelMotionBlur(false,NpcBeckon.NPC[beckon_id].NID,total_time,frame_interval)
	end
end

function CGNpcApi:StopModelMotionBlur(beckon_id)
	if NpcBeckon.NPC[beckon_id] then
		CGApi.StopModelMotionBlur(false,NpcBeckon.NPC[beckon_id].NID)
	end
end

function CGNpcApi:SpeakWords(beckon_id,words,last_time)
	local speakMode = 
	{
		ShowChat		= false,		--是否显示在聊天栏
		ChatChannel		= 0,			--聊天频道
		ShowSendName    = false,		--是否喊话对象名称
		ShowPop			= true,			--是否显示泡泡
		PopMinTime      = last_time,    --泡泡显示最短时?ms)
		PopMaxTime      = last_time,    --泡泡显示最长时?ms)
		FrameType		= 1,			--泡泡显示边框
		FontName        = 1,			--字体名称索引: 0.方正隶二简?1.方正细黑一简?2.方正隶变简?
		FontSize        = 10,			--字体大小
		FontColor       = 0xFFFFFF,		--字体颜色
		FadePlay		= true,			--淡入淡出
		ScalePlay		= false,		--缩放进出
		ShowHead		= false,		--边框显示头像
		FramePri		= 2,  			--边框优先?
		FollowHost      = true,			--跟随主人
		ShowMiddle		= false,		--屏幕中央打字显示
	}
	if NpcBeckon.NPC[beckon_id] then
		GameApi.ObjSpeak(NpcBeckon.NPC[beckon_id].NID,words,ObjSpeak:CopyArray(speakMode))
	end
end

