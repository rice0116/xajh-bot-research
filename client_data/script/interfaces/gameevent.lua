---------------------------------------------------------------
--  created:   2009.06.24
--  author:    djh
--
--  游戏事件处理脚本
---------------------------------------------------------------
GameEvent = {}

EventType =
{
	EVENT_UNKNOWN       = 0,

	--游戏外事件
	EVENT_GAMELOADING   = 1,--游戏加载
	EVENT_INPUTACCOUNT  = 2,--输入账号
	EVENT_CREATEROLE	= 3,--创建角色
	EVENT_SELECTROLE	= 4,--选择角色

	--游戏内事件
	EVENT_THEMECHANGE	= 5,--主题改变
	EVENT_CHANGEPRECINCT= 6,--区域改变
	EVENT_CGBEGIN		= 7,--摄像机动画开始
	EVENT_CGEND			= 8,--摄像机动画结束
	EVENT_ROLEDIE		= 9,--角色死亡
	EVENT_ROLERELIVE	= 10,--角色复活
	EVENT_UIOPEN		= 11,--打开界面
	EVENT_UICLOSE		= 12,--关闭界面
	EVENT_TINYGAMEBEGIN	= 13,--小游戏开始
	EVENT_TINYGAMEEND	= 14,--小游戏结束
	EVENT_STARTCMDPOSE	= 15,--主角玩家摆Pose
	EVENT_PLAYACTION	= 16,--玩家播放动作
	EVENT_HOSTCHAT		= 17,--玩家发送聊天
	EVENT_HOSTHPSTATE	= 18,--主角玩家状态改变
	EVENT_ENVIRONMENT	= 19,--天气改变事件

	EVENT_GAMELOADED	= 20,--游戏世界加载完成

	EVENT_TASK_GAIN		= 21,--接到任务
	EVENT_TASK_FINISH	= 22,--任务目标完成
	EVENT_TASK_COMPLETE = 23,--任务完成
	EVENT_DELVTASK_TALK	= 24,--NPC接任务对话
	EVENT_NPCTASK_TALK	= 25,--NPC与任务NPC对话
	EVENT_AWARDTASK_TALK= 26,--NPC交任务对话

	EVENT_NPC_STARTSERVICE = 27, --NPC开始服务事件
	EVENT_NPC_ENDSERVICE   = 28, --NPC结束服务事件

	EVENT_OBTAIN_ITEM	   = 29, --获得物品事件
	EVENT_BOARD_START	   = 30, --副本版面开始
	EVENT_UI			   = 31, --需要UI响应的事件
	EVENT_DRAG_ITEM	   = 32, --拿起物品	参数key：tid,cid
	EVENT_DROP_ITEM     = 33, --放下物品 参数key：tid,cid
	EVENT_GAIN_MONEY		   = 34, --金钱进包	参数key：money
	EVENT_TASKDATA_INIT	 = 35,	--任务数据加载完成
	EVENT_BOARD_COMPLETED = 36, --杈炬垚鐗堥潰鏉′欢
	EVENT_BOARD_FINISHED  = 37, --杩囩増
}

HAVE_SELECTROLE = 0
WEATHER_CLASS_LIST = {1,2,128,256}
NOW_WEATHER_AMB = {}
GameEvent.TickTable = {}
--鐢ㄤ簬鐗堥潰鐩稿叧浜嬩欢
GameEvent_BoardEvent =
{
	Current_BoardID = 0,
	Currtnt_world = 0,
	Currtnt_scene = 0,
	Currtnt_board = 0,
}

ExploitCG =
{
--	[0] = {SceneID = 0, ExploitID = 0, CgID = 0},
--	[1] = {SceneID = 54, ExploitID = 1, CgID = 40129},	--新手村的探索改为写死逻辑
	[2] = {SceneID = 2, ExploitID = 2, CgID = 201},
	[3] = {SceneID = 3, ExploitID = 3, CgID = 301},
	[4] = {SceneID = 4, ExploitID = 4, CgID = 401},
	[5] = {SceneID = 5, ExploitID = 5, CgID = 501},
	[6] = {SceneID = 6, ExploitID = 6, CgID = 1},
	[7] = {SceneID = 7, ExploitID = 7, CgID = 701},
	[8] = {SceneID = 8, ExploitID = 8, CgID = 801},
	[9] = {SceneID = 9, ExploitID = 9, CgID = 901},
	[10] = {SceneID = 10, ExploitID = 10, CgID = 1001},
	[11] = {SceneID = 11, ExploitID = 11, CgID = 1101},
--	[12] = {SceneID = 12, ExploitID = 12, CgID = 1201},
	[13] = {SceneID = 13, ExploitID = 13, CgID = 1301},
	[14] = {SceneID = 14, ExploitID = 14, CgID = 1401},
	[15] = {SceneID = 15, ExploitID = 15, CgID = 1501},
	[16] = {SceneID = 16, ExploitID = 16, CgID = 1601},
	[17] = {SceneID = 17, ExploitID = 17, CgID = 1701},
	[18] = {SceneID = 18, ExploitID = 18, CgID = 1801},
	[19] = {SceneID = 19, ExploitID = 19, CgID = 1901},
	[20] = {SceneID = 20, ExploitID = 20, CgID = 2001},
	[21] = {SceneID = 21, ExploitID = 21, CgID = 2101},
	[22] = {SceneID = 22, ExploitID = 22, CgID = 2201},
--	[23] = {SceneID = 23, ExploitID = 23, CgID = 2301},
	[24] = {SceneID = 24, ExploitID = 24, CgID = 2401},
	[25] = {SceneID = 25, ExploitID = 25, CgID = 2501},
	[26] = {SceneID = 26, ExploitID = 26, CgID = 2601},
--	[27] = {SceneID = 27, ExploitID = 27, CgID = 2701},
--	[28] = {SceneID = 28, ExploitID = 28, CgID = 2801},
--	[29] = {SceneID = 29, ExploitID = 29, CgID = 2901},
	[30] = {SceneID = 30, ExploitID = 30, CgID = 3001},
	[31] = {SceneID = 31, ExploitID = 31, CgID = 3101},
	[32] = {SceneID = 32, ExploitID = 32, CgID = 3201},
	[33] = {SceneID = 33, ExploitID = 33, CgID = 3301},
--	[34] = {SceneID = 34, ExploitID = 34, CgID = 3401},
--	[35] = {SceneID = 35, ExploitID = 35, CgID = 3501},
	[36] = {SceneID = 36, ExploitID = 36, CgID = 36012},
	[37] = {SceneID = 37, ExploitID = 37, CgID = 3701},
	[38] = {SceneID = 38, ExploitID = 38, CgID = 3801},
	[39] = {SceneID = 39, ExploitID = 39, CgID = 3901},
--	[40] = {SceneID = 40, ExploitID = 40, CgID = 4001},
--	[41] = {SceneID = 41, ExploitID = 41, CgID = 4101},
	[42] = {SceneID = 42, ExploitID = 42, CgID = 4201},
	[43] = {SceneID = 43, ExploitID = 43, CgID = 4301},
--	[44] = {SceneID = 44, ExploitID = 44, CgID = 4401},
--	[45] = {SceneID = 45, ExploitID = 45, CgID = 4501},
--	[46] = {SceneID = 46, ExploitID = 46, CgID = 4601},
--	[47] = {SceneID = 47, ExploitID = 47, CgID = 4701},
--	[48] = {SceneID = 48, ExploitID = 48, CgID = 4801},
--	[49] = {SceneID = 49, ExploitID = 49, CgID = 4901},
--	[50] = {SceneID = 50, ExploitID = 50, CgID = 5001},
	[55] = {SceneID = 55, ExploitID = 55, CgID = 1201},
	[64] = {SceneID = 64, ExploitID = 64, CgID = 40101}
}

ViewPointCG = {}
ViewPointCG[12403] = {CgID = 1}
ViewPointCG[12406] = {CgID = 201}
ViewPointCG[12409] = {CgID = 301}
ViewPointCG[12412] = {CgID = 401}
ViewPointCG[12415] = {CgID = 501}
ViewPointCG[12418] = {CgID = 701}
ViewPointCG[12421] = {CgID = 801}
ViewPointCG[12424] = {CgID = 901}
ViewPointCG[12427] = {CgID = 1001}
ViewPointCG[12430] = {CgID = 1101}
ViewPointCG[12433] = {CgID = 1201}
ViewPointCG[12436] = {CgID = 1301}
ViewPointCG[12439] = {CgID = 1401}
ViewPointCG[12442] = {CgID = 1501}
ViewPointCG[12445] = {CgID = 1601}
ViewPointCG[12448] = {CgID = 1701}
ViewPointCG[12451] = {CgID = 1801}
ViewPointCG[12454] = {CgID = 1901}
ViewPointCG[12457] = {CgID = 2001}
ViewPointCG[12460] = {CgID = 2101}
ViewPointCG[12463] = {CgID = 21011}
ViewPointCG[12466] = {CgID = 2201}
ViewPointCG[12469] = {CgID = 22011}
ViewPointCG[12472] = {CgID = 2401}
ViewPointCG[12475] = {CgID = 2501}
ViewPointCG[12478] = {CgID = 2601}
ViewPointCG[12481] = {CgID = 3001}
ViewPointCG[12484] = {CgID = 30012}
ViewPointCG[12487] = {CgID = 30011}
ViewPointCG[12490] = {CgID = 3101}
ViewPointCG[12493] = {CgID = 3201}
ViewPointCG[12496] = {CgID = 3301}
ViewPointCG[12499] = {CgID = 3601}
ViewPointCG[12502] = {CgID = 36011}
ViewPointCG[12505] = {CgID = 36012}
ViewPointCG[12508] = {CgID = 3701}
ViewPointCG[12511] = {CgID = 3801}
ViewPointCG[14178] = {CgID = 3901}
ViewPointCG[14181] = {CgID = 4201}
ViewPointCG[12514] = {CgID = 4301}

local Npc_Voice_Buffer = ""
local Npc_Voice_LastCD = 0
local Npc_Voice_CurCD = 0
local Player_Weak_Flag = true

Board_Config = {}
Board_Config[1037] =
{
	Poninter =
	{
		[24] =
		{
			TitleText   = LIANSHOU_TEXT_TITLE,
			LeftText	= LIANSHOU_TEXT_LEFT,
			RightText	= LIANSHOU_TEXT_RIGHT,
			LeftPos 	= {board_id = 1037, x = -8.7, y = 272, z = -3.9},
			RightPos 	= {board_id = 1037, x = -11.5, y = 272, z = 5.3},
		}
	},

	Gfx =
    {
	}
}

Board_Config[1203] =
{
	Poninter =
	{
	},

	Gfx =
	{
		[2] =
		{
			[EventType.EVENT_BOARD_START]=
			{
				GfxPath = "绋嬪簭鑱斿叆\\鍦板浘瀛梊\鐏棬鍓ф湰瀛?gfx",
				x = 175,
				y = -450,
			},
			[EventType.EVENT_BOARD_COMPLETED]=
			{
				GfxPath = "界面\\关卡提示\\第一门.gfx",
				x = 175,
				y = -450,
			},
		}
	}
}

function GameEvent:OnGameEvent(event,ext_tbl)
	local scene_id    = GameApi.GetSceneID()
	local precinct_id = GameApi.GetPrecinctID()
	local player_prop = GameApi.GetPlayerBasicProp(0)
	GameEvent_BoardEvent.Currtnt_world, GameEvent_BoardEvent.Currtnt_scene, GameEvent_BoardEvent.Currtnt_board = GameApi.GetSceneInfo()

	--选中角色标记
	if event == EventType.EVENT_SELECTROLE then
		HAVE_SELECTROLE = 1
	end
	--开始NPC服务
	if event == EventType.EVENT_NPC_STARTSERVICE then
		local npcID = ext_tbl["npc_tid"]
		local npcWID = ext_tbl["npc_wid"]
		if npcID and npcID > 0 and CamVisObjTalk[npcID] then
			GameApi.SetCamVisualMode(CAMVIS_TYPE_OBJTALK,npcID)
		end
		if npcID and npcID > 0 and ViewPointCG[npcID] then
			CGApi.PlayCG(ViewPointCG[npcID].CgID)
		end

		if ObjInfo[npcID] and ObjInfo[npcID].npc_voice >0 then
			local voice_id = ObjInfo[npcID].npc_voice
			if NPC_VOICE_PATH[voice_id].mode == 1 then
				if NPC_VOICE_PATH[voice_id].open_voice ~= Npc_Voice_Buffer then
					Npc_Voice_CurCD = os.clock()
					if Npc_Voice_CurCD - Npc_Voice_LastCD >= 1 then
						GameApi.Play3DSound(NPC_VOICE_PATH[voice_id].open_voice,npcWID)
						Npc_Voice_LastCD = Npc_Voice_CurCD
					end
					Npc_Voice_Buffer = NPC_VOICE_PATH[voice_id].open_voice
				end
			else
				if NPC_VOICE_PATH[voice_id].open_voice ~= Npc_Voice_Buffer then
					Npc_Voice_CurCD = os.clock()
					if Npc_Voice_CurCD - Npc_Voice_LastCD >= 1 then
						GameApi.Play3DSound(NPC_VOICE_PATH[voice_id].open_voice,npcWID)
						Npc_Voice_LastCD = Npc_Voice_CurCD
					end
					Npc_Voice_Buffer = NPC_VOICE_PATH[voice_id].open_voice
				end
			end
		end
	end

	--结束NPC服务
	if event == EventType.EVENT_NPC_ENDSERVICE then
		local npcID = ext_tbl["npc_tid"]
		local npcWID = ext_tbl["npc_wid"]
		if npcID and npcID > 0 then
			--NPC服务
			if CamVisObjTalk[npcID] then
				GameApi.StopCamVisualMode(CAMVIS_TYPE_OBJTALK)
			end
			--NPC任务对话
			if CamVisTaskTalk[npcID] then
				GameApi.StopCamVisualMode(CAMVIS_TYPE_TASKTALK)
			end
		end

		if ObjInfo[npcID] and ObjInfo[npcID].npc_voice >0 then
			local voice_id = ObjInfo[npcID].npc_voice
			if NPC_VOICE_PATH[voice_id].mode == 1 then
				if NPC_VOICE_PATH[voice_id].close_voice ~= Npc_Voice_Buffer then
					Npc_Voice_CurCD = os.clock()
					if Npc_Voice_CurCD - Npc_Voice_LastCD >= 1 then
						GameApi.Play3DSound(NPC_VOICE_PATH[voice_id].close_voice,npcWID)
						Npc_Voice_LastCD = Npc_Voice_CurCD
					end
					Npc_Voice_Buffer = NPC_VOICE_PATH[voice_id].close_voice
				end
			else
				if NPC_VOICE_PATH[voice_id].close_voice ~= Npc_Voice_Buffer then
					Npc_Voice_CurCD = os.clock()
					if Npc_Voice_CurCD - Npc_Voice_LastCD >= 1 then
						GameApi.Play3DSound(NPC_VOICE_PATH[voice_id].close_voice,npcWID)
						Npc_Voice_LastCD = Npc_Voice_CurCD
					end
					Npc_Voice_Buffer = NPC_VOICE_PATH[voice_id].close_voice
				end
			end
		end
	end


    --游戏加载探地图(探索地图用CG)
	if event == EventType.EVENT_GAMELOADED then
		GameEvent.TickTable[EventType.EVENT_GAMELOADED] = {}
		GameEvent.TickTable[EventType.EVENT_GAMELOADED].TickFunc = function()
			if GameApi.HasInitExploitMap() then
				if scene_id == 54 and GameApi.HasExploitMap(54) == false then--写死新手村CG
					local tstate, ttimes = GameApi.GetTaskCompInfo(2568)--东方新手第一步
					if tstate == 2 then
						ret = GameApi.GetPlayerFullProp(0)
						if ret.level >= 10 then
							CGApi.PlayCG(40129)
						end
					else
						CGApi.PlayCG(101)
					end
				end
				if scene_id == 62 then--写入进云中谷CG
					local tstate, ttimes = GameApi.GetTaskCompInfo(2581)--东方新手任务14
					if tstate ~= 2 then
						CGApi.PlayCG(40110)
					end
				end
				for k,v in pairs(ExploitCG) do
					--if scene_id == v.SceneID and GameApi.HasExploitMap(v.ExploitID) == false then
					--	CGApi.PlayCG(v.CgID)
					--	break
					--end
					local player_prop = GameApi.GetPlayerFullProp(0)
					if scene_id == v.SceneID and GameApi.HasExploitMap(v.ExploitID) == false and player_prop["prof"] > 0 then
						CGApi.PlayCG(v.CgID)
						break
					end
				end
				GameEvent.TickTable[EventType.EVENT_GAMELOADED] = nil
			end
		end
		GameEvent.TickTable[EventType.EVENT_GAMELOADED].TickFunc()
	end

	--副本版面开启
	if event == EventType.EVENT_BOARD_START then
		if GameEvent_BoardEvent.Currtnt_world > 0 then
			local start_board_id = GameEvent_BoardEvent.Currtnt_board
			if GameEvent_BoardEvent.Currtnt_scene == 1008 then
				if GameEvent_BoardEvent.Currtnt_board == 2 then
					Environment:Apply(1)
				elseif GameEvent_BoardEvent.Currtnt_board == 3 then
					Environment:Apply(2)
				end
			elseif GameEvent_BoardEvent.Currtnt_scene == 1009 then
				if GameEvent_BoardEvent.Currtnt_board == 4 then
					Environment:Apply(16)
				end
			end
		end
	end

	if event == EventType.EVENT_SELECTROLE then
		Player_Weak_Flag = true
		GameApi.StopListSFX(9,2000)
	end

	--角色血少于25%时虚弱音效
	if event == EventType.EVENT_GAMELOADED and player_prop and player_prop["hp"]/player_prop["maxhp"] < 0.25 and Player_Weak_Flag == true then
		GameApi.PlayListSFX(9,true,0)
		Player_Weak_Flag = false
	elseif Player_Weak_Flag == false and player_prop and player_prop["hp"]/player_prop["maxhp"] > 0.25 then
		GameApi.StopListSFX(9,2000)
		Player_Weak_Flag = true
	end

	self:ShowInstanceRoute(event,ext_tbl)
	self:ShowBoardGfx(event, ext_tbl)
end
--鍓湰鐗堥潰璺嚎閫夋嫨
function GameEvent:ShowInstanceRoute(event, ext_tbl)
	if event == EventType.EVENT_BOARD_START then
		if Board_Config[GameEvent_BoardEvent.Currtnt_scene] then
			if Board_Config[GameEvent_BoardEvent.Currtnt_scene].Poninter[GameEvent_BoardEvent.Currtnt_board] then
			GameEvent_BoardEvent.Current_BoardID = GameEvent_BoardEvent.Currtnt_board
			HelpSystemApi.ShowHelpUI("InstanceRoute", -1, -150)
			InstanceRoute:Result()
			InstanceRoute:SetInstanceRoute(GameEvent_BoardEvent.Current_BoardID)
			end
		end
		if GameEvent_BoardEvent.Current_BoardID ~= 0 then
			if GameEvent_BoardEvent.Current_BoardID ~= GameEvent_BoardEvent.Currtnt_board then
				HelpSystemApi.HideHelpUI("InstanceRoute")
			end
		end
	end
end


--版面播放光效
function GameEvent:ShowBoardGfx(event, ext_tbl)
	if Board_Config[GameEvent_BoardEvent.Currtnt_scene] then
		if Board_Config[GameEvent_BoardEvent.Currtnt_scene].Gfx[GameEvent_BoardEvent.Currtnt_board] then
			local config = Board_Config[GameEvent_BoardEvent.Currtnt_scene].Gfx[GameEvent_BoardEvent.Currtnt_board]
			if config[event] then
				if GameEvent_BoardEvent.Current_BoardGFX ~= "" then
					HelpSystemApi.DetachUIGfx(GameEvent_BoardEvent.Current_BoardGFX,"Win_FunctionBar","Img_Quick2")
					GameEvent_BoardEvent.Current_BoardGFX = ""
				end
			end
			HelpSystemApi.AttachUIGfx(config[event].GfxPath,"Win_FunctionBar","Img_Quick2", config.x, config.y)
			GameEvent_BoardEvent.Current_BoardGFX = cconfig[event].GfxPath
		end
	end
end

--Tick函数
function GameEvent:OnEventTick(delta)
	for k,v in pairs(GameEvent.TickTable) do
		if v and v.TickFunc then
			v.TickFunc()
		end
	end
end

