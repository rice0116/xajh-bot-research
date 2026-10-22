--[[#encode ansi]]
--[[#tag push auto]]


---------------------------------------------------------------
--  created:   2009.06.10
--  author:    djh
--
--  声音的脚本配置
---------------------------------------------------------------
--GameApi注册音乐音效函数说明:
--[[
--环境音效控制
GetCurrSFXID() : 获取环境音效的当前ID
---参数: 无
---返回: 1.(int)当前环境音效音乐ID (based:1  0表示没有)

GetSFXState() : 获取环境音效的当前状态
---参数: 无
---返回: 1.(int)当前播放环境音效状态 (0:停止  1:播放  2:暂停)

GameApi.PlayListSFX(id/path,loop,fadein) : 播放环境音效
---参数: 这个接口，三个参数，第一个参数支持id和路径，后来是是否循环和淡入时间
---返回: 无

StopAmbSFX() : 停止播放环境音效
---参数: 1.(bool)FadeOut(是否淡出 true or false)
---返回: 无

--背景音乐控制
GetCurrBGMID() : 获取背景音乐的当前ID
---参数: 无
---返回: 1.(int)当前播放背景音乐ID (based:1  0表示没有)

GetBGMState() : 获取背景音乐的当前状态
---参数: 无
---返回: 1.(int)当前背景音乐状态 (0:停止  1:播放  2:暂停)

PlayBGM() : 播放背景音乐
---参数: 1.(int)bgm_id (这个ID就是背景音乐表中对应的ID,based:1)
---参数: 2.(bool)fadein 是否淡入(true or false，默认true)
---参数: 3.(bool)clearlist(是否清楚原有的播放列表:默认为true)
---参数: 4.(int)fadeintime(在参数2为true时有效,淡入的时间,单位ms，默认为4000ms)
---参数: 5.(int)loop_times 背景音乐循环播放次数(默认0:只播放一次 -1:无限循环 >0:循环n次)
---返回: 无

PlayBGMList()：无缝、错位播放音乐列表
--参数：1.(table)待播放的音乐文件路径名列表
--参数：2.(bool)是否淡入
--参数：3.(bool)是否循环


SetBGMSilenceTime() : 设置背景音乐之间播放的时间间隔
---参数: 1.(int)silencetime(默认1000,单位ms)
---返回: 无

PauseBGM() : 暂停背景音乐
---参数: 1.(bool)pause(是否暂停 true or false)
---返回: 无

StopBGM() : 停止播放背景音乐
---参数: 1.(bool)FadeOut(是否淡出 true or false)
---返回: 无

PlayListSFX()：能播放同时多个环境音效
--参数：1.(int)sfxid 游戏中对应的环境音效
--参数：2.(bool)loop 是否循环播放

StopListSFX()：关闭指定的环境音效
--参数：1.(int)sfxid 游戏中对应的环境音效

--]]

Sound = {}

--切换区域时，用于存储上个区域的scene ID和precinct ID
Sound.LastPrecinct = 0
Sound.LastScene    = 0
Sound.LastAMB      = {}
Sound.LastBGM	   = {}
Sound.PlayTheme	   = false
Sound.PlaySpecialBGMFlag = false
Sound.SpecialScene = {
	[61] = 1,
	[62] = 1,
	[63] = 1,
	[64] = 1,
}

--响应的事件ID表
Sound.EventID =
{
	EventType.EVENT_GAMELOADING,
	EventType.EVENT_THEMECHANGE,
	EventType.EVENT_CHANGEPRECINCT,
	EventType.EVENT_DRAG_ITEM,
	EventType.EVENT_DROP_ITEM,
	EventType.EVENT_GAIN_MONEY,
	EventType.EVENT_TASK_GAIN,
	EventType.EVENT_START_ACC_RUN,
	EventType.EVENT_STOP_ACC_RUN,
}

--系统使用函数
function Sound:GetSelf()
    GameApi.SetBGMSilenceTime(200)
	math.randomseed(os.time())
	math.random()
    return self
end

--播放标题画面音乐
function Sound:PlayThemeMusic()
    local ply_id     = 1
    local ply_chance = 101
    local ran_chance = math.random (100)
    for k , v in pairs(TitleSoundConfig) do
   		if v.chance > ran_chance then
   			if	v.chance < ply_chance then
   				ply_id = v.bgmid
   				ply_chance = v.chance
	   		end
		end
	end

	GameApi.StopListSFX(0,0)
	GameApi.PlayBGM(ply_id,true,false,2000,1000)
end

--播放场景音效
function Sound:PlayPrecinctAMB (mapid, precinctid)
	local tblAmb  = nil
	local nowTime = GameApi.GetGameTime()

	--计算
	if SceneSoundConfig[mapid] and SceneSoundConfig[mapid].zone[precinctid] then
		if nowTime > 6 and nowTime < 22 then
			tblAmb = SceneSoundConfig[mapid].zone[precinctid].dayamb
		else
			tblAmb = SceneSoundConfig[mapid].zone[precinctid].nightamb
		end
	end

	local bResetAmb = true
	if Sound.LastAMB and tblAmb and #Sound.LastAMB == #tblAmb then
		bResetAmb = false
		for i = 1 ,#tblAmb do
			if tblAmb[i] ~= Sound.LastAMB[i] then
				bResetAmb = true
				break
			end
		end
	end

	if bResetAmb then
		--停止
		if Sound.LastAMB and #Sound.LastAMB ~= 0 then
			for i = 1 ,#Sound.LastAMB do
				GameApi.StopListSFX(Sound.AmbienceFile[Sound.LastAMB[i]],4000)
			end
		end
		Sound.LastAMB = nil

		--播放
		if tblAmb then
			for i = 1, #tblAmb do
				GameApi.PlayListSFX(Sound.AmbienceFile[tblAmb[i]],true,2000)
			end
		end
	end

	--保存
	Sound.LastAMB = tblAmb
end


local defultMusicList =
{
	--[[!AUTO_1]][====[music\176zhandouA_01.ogg]====],
	--[[!AUTO_2]][====[music\177zhandouA_02.ogg]====],
	--[[!AUTO_3]][====[music\178zhandouA_03.ogg]====],
}

--播放场景音乐
function Sound:PlayPrecinctBGM (mapid, precinctid)
	local bResetBGM  = true
	local lastPreBGM = {}
	local curPreBGM  = {}

	if SceneSoundConfig[Sound.LastScene] and SceneSoundConfig[Sound.LastScene].zone[Sound.LastPrecinct] then
	    lastPreBGM = SceneSoundConfig[Sound.LastScene].zone[Sound.LastPrecinct].bgm
	else
	    lastPreBGM = {}
	end

	if SceneSoundConfig[mapid] and SceneSoundConfig[mapid].zone[precinctid] then
	    curPreBGM = SceneSoundConfig[mapid].zone[precinctid].bgm
	else
	    curPreBGM = {}
	end

	if #lastPreBGM == #curPreBGM then
		bResetBGM = false
		for i = 1 ,#curPreBGM do
			if curPreBGM[i] ~= lastPreBGM[i] then
				bResetBGM = true
				break
			end
		end
	end

	--[[
	if lastPreBGM  then
		local sID = ""
		for i = 1 ,#lastPreBGM do
			sID = sID..lastPreBGM[i].."."
		end
		LogPrint("**********LastBGM: "..sID)
	end

	if curPreBGM  then
		local sID = ""
		for i = 1 ,#curPreBGM do
			sID = sID..curPreBGM[i].."."
		end
		LogPrint("**********CurBGM: "..sID)
	end
	--]]

	local bgmTab = {}
	if #curPreBGM > 0 then
		if bResetBGM == true then
			for k, v in pairs(curPreBGM) do
				bgmTab[k] = Sound.BGMFile[v]
			end
			local silence = 0
			if SceneSoundConfig[mapid].zone[precinctid].silence then
				silence = SceneSoundConfig[mapid].zone[precinctid].silence
			end
			GameApi.PlayBGMList(bgmTab, SceneSoundConfig[mapid].zone[precinctid].bgm_single,SceneSoundConfig[mapid].zone[precinctid].bgm_rand,silence)
			GameApi.SetVolumeRatio(SceneSoundConfig[mapid].zone[precinctid].bmgVol, SceneSoundConfig[mapid].zone[precinctid].sfxVol)
		end
	else
		if GameApi.GetWorldTag() == 0 then
			GameApi.PlayBGMList(bgmTab, true, 0, 30000)
		else
			local ran_chance = math.random (3)
			local list = {}
			if defultMusicList[ran_chance] then
				list[1] = defultMusicList[ran_chance]
			else
				list[1] = defultMusicList[1]
			end
			GameApi.PlayBGMList(list, true, 0, 30000)
		end
		--LogPrint("**********PlayBGMList")
	end
end

--按任务播放场景音乐
function Sound:PlaySpecialBGM(scene_id, precinct_id, task_id)
	local bgmTab = {}
	local single
	local rand
	local silence

	if task_id > 0 and Sound.SpecialTaskBGM[task_id] then
		for k, v in pairs(Sound.SpecialTaskBGM[task_id].bgm) do
		   	bgmTab[k] = Sound.BGMFile[v]
		end

		if Sound.LastBGM == nil or bgmTab == nil or CompareTab(Sound.LastBGM, bgmTab) == false then
			single = Sound.SpecialTaskBGM[task_id].bgm_single
			rand = Sound.SpecialTaskBGM[task_id].bgm_rand
			silence = Sound.SpecialTaskBGM[task_id].silence
			GameApi.PlayBGMList(bgmTab,single,rand,silence)
			GameApi.SetVolumeRatio(Sound.SpecialTaskBGM[task_id].bmgVol, Sound.SpecialTaskBGM[task_id].sfxVol)
			Sound.LastBGM = bgmTab
		end
	--中途退出游戏再进入游戏时
	elseif task_id == 0 then
		local state,times
		local flag = false
		local id

		for k, v in pairs(Sound.SpecialTaskBGM) do
		   	state, times = GameApi.GetTaskCompInfo(k)
			if state == 1 then
				id = k
				flag = true
				break
			end
		end

		if flag == true and bgmTab ~= nil then
			for k, v in pairs(Sound.SpecialTaskBGM[id].bgm) do
				bgmTab[k] = Sound.BGMFile[v]
			end
			single = Sound.SpecialTaskBGM[id].bgm_single
			rand = Sound.SpecialTaskBGM[id].bgm_rand
			silence = Sound.SpecialTaskBGM[id].silence
			GameApi.PlayBGMList(bgmTab,single,rand,silence)
			GameApi.SetVolumeRatio(Sound.SpecialTaskBGM[id].bmgVol, Sound.SpecialTaskBGM[id].sfxVol)
			Sound.PlaySpecialBGMFlag = true
			Sound.LastBGM = bgmTab
		elseif flag == false then
			Sound:PlayPrecinctBGM(scene_id,precinct_id)
		end
	end
end

--鍖哄煙鍒囨崲鑳屾櫙闊充箰鍒囨崲寤惰繜鏃堕棿
function Sound:GetDelay( InstID, OldPrinctID, NewPricinctID )
	local Delay = 0
	if SceneSoundConfig[InstID] then
		if SceneSoundConfig[InstID].zone[OldPrinctID] then
			if SceneSoundConfig[InstID].zone[OldPrinctID].outDelay > 0 then
				Delay = SceneSoundConfig[InstID].zone[OldPrinctID].outDelay
			end
		end
		if SceneSoundConfig[InstID].zone[NewPricinctID] then
			if SceneSoundConfig[InstID].zone[NewPricinctID].intoDelay > 0 then
				Delay = SceneSoundConfig[InstID].zone[NewPricinctID].intoDelay
			end
		end
	end
	if Delay > 0 then
		Delay = Delay * 1000
	end
	return Delay
end

function Sound:OnSoundEvent(event,val_tbl)

	local idWorld    = GameApi.GetWorldTag()
	local idPrecinct = GameApi.GetPrecinctID()
	local idScene    = GameApi.GetSceneID()

	--进入主题画面
	if event == EventType.EVENT_THEMECHANGE and Sound.PlayTheme == false then
		Sound:PlayThemeMusic()
		Sound.LastScene    = 0
		Sound.LastPrecinct = 0
		Sound.LastAMB      = nil
		Sound.PlayTheme	   = true
		Sound.PlaySpecialBGMFlag = false
	end

	--切换区域
	if ( idWorld == 0 or Sound:IsInstanceNoBoardScene(idWorld) ) and event == EventType.EVENT_CHANGEPRECINCT then
		if not Sound.SpecialScene[idScene] then
			Sound:PlayPrecinctBGM(idScene,idPrecinct)
		end

		if Sound.SpecialScene[idScene] and Sound.PlaySpecialBGMFlag == false then
			Sound:PlaySpecialBGM(idScene,idPrecinct,0)
		end
		Sound:PlayPrecinctAMB(idScene,idPrecinct)
		Sound.LastScene    = idScene
		Sound.LastPrecinct = idPrecinct
		Sound.PlayTheme	   = false
	end

	--游戏加载
	if event == EventType.EVENT_GAMELOADING then
		GameApi.StopListSFX(0,0)
	    GameApi.StopAmbSFX (false)
		--GameApi.StopBGM(false)
		Sound.PlayTheme	 = false
	end
	--[[
	--鍔犻�熻窇鐘舵�佸紑濮嬫挱鏀鹃煶鏁?
	if event == EventType.EVENT_START_ACC_RUN then
		GameApi.Play3DSound(GameApi.MBCSToUtf8(Sound.AmbienceFile[6]),GameApi.GetSelfID())
		GameApi.PlayListSFX(Sound.AmbienceFile[5],true,0)
	end


	--鍔犻�熻窇鐘舵�佺粨鏉?
	if event == EventType.EVENT_STOP_ACC_RUN then
		GameApi.StopListSFX(Sound.AmbienceFile[5],3000)
		GameApi.Play3DSound(GameApi.MBCSToUtf8(Sound.AmbienceFile[7]),GameApi.GetSelfID())
	end
	--]]
	--物品拿起
	if event == EventType.EVENT_DRAG_ITEM then
		local sound_path = DescUtility:ItemTypeToSound(val_tbl["tid"],val_tbl["cid"])
		GameApi.PlayItemSound(sound_path.takeup)
	end

	--物品放下
	if event == EventType.EVENT_DROP_ITEM then
		local sound_path = DescUtility:ItemTypeToSound(val_tbl["tid"],val_tbl["cid"])
		GameApi.PlayItemSound(sound_path.drop)
	end

	--金钱进包
	if event == EventType.EVENT_GAIN_MONEY then
		GameApi.PlayListSFX(ICON_SOUND_PATH[33].takeup,false,0)
	end
end

function Sound:OnBoardStart(scene_id,board_id)
	local idWorld    = GameApi.GetWorldTag()
	if idWorld ~= 0 then
		scene_id = string.format(--[[!AUTO_4]][====[%d_%d]====], scene_id, idWorld)
	end

	Sound:PlayPrecinctAMB(scene_id,board_id)
	Sound:PlayPrecinctBGM(scene_id,board_id)

	Sound.LastScene    = scene_id
	Sound.LastPrecinct = board_id
end

function Sound:OnBoardClose(scene_id,board_id)
	--[[
	local nowTime = GameApi.GetGameTime()

	--停止音乐
	if SceneSoundConfig[scene_id] and SceneSoundConfig[scene_id].zone[board_id] then
		local tblBgm = nil
	    tblBgm = SceneSoundConfig[scene_id].zone[board_id].bgm
		if tblBgm and #tblBgm ~= 0 then
			GameApi.StopBGM(true)
		end
	end

	--停止音效
	if SceneSoundConfig[scene_id] and SceneSoundConfig[scene_id].zone[board_id] then
		local tblAmb = nil
		if nowTime > 6 and nowTime < 22 then
			tblAmb = SceneSoundConfig[scene_id].zone[board_id].dayamb
		else
			tblAmb = SceneSoundConfig[scene_id].zone[board_id].nightamb
		end

		if tblAmb and #tblAmb ~= 0 then
			for i = 1 ,#tblAmb do
				GameApi.StopListSFX(tblAmb[i],3000)
			end
		end
	end
	--]]
end

-------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------竞技场地音乐音效相关---------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------

--进入比赛房间阶段
function Sound:OnBattlePrepare()
	local idScene    = GameApi.GetSceneID()
	local idWorld    = GameApi.GetWorldTag()
	if idWorld ~= 0 then
		scene_id = string.format(--[[!AUTO_5]][====[%d_%d]====], 1405, idWorld)
	end

	Sound:PlayPrecinctAMB(scene_id,3)
	Sound:PlayPrecinctBGM(scene_id,3)

	Sound.LastScene    = scene_id
	Sound.LastPrecinct = 3
end

--比赛开始倒记时阶段
function Sound:OnBattleCountdownStart()
	--显示倒记时光效时播放倒记时音效
	GameApi.PlayListSFX(--[[!AUTO_6]][====[SFX\策划联入\ui\擂台页面_回合倒计时开始.WAV]====], false, 0)
end

--全局比赛开始
function Sound:OnBattleFightStart()
	local idScene    = GameApi.GetSceneID()
	local idWorld    = GameApi.GetWorldTag()
	if idWorld ~= 0 then
		scene_id = string.format(--[[!AUTO_7]][====[%d_%d]====], idScene, idWorld)
	end

	Sound:PlayPrecinctAMB(scene_id,board_id)
	Sound:PlayPrecinctBGM(scene_id,board_id)

	Sound.LastScene    = scene_id
	Sound.LastPrecinct = board_id

end

--单回合比赛结束
function Sound:OnBattleRoundKO()
	--单局比赛结束显示KO光效时显示KO光效果
	GameApi.PlayListSFX(--[[!AUTO_8]][====[SFX\策划联入\ui\擂台KO.wav]====], false,0)
end

function Sound:OnBattleRoundDraw()
	GameApi.PlayListSFX(--[[!AUTO_9]][====[SFX\策划联入\ui\擂台draw.wav]====], false, 0)
end

function CompareTab(tab1,tab2)
	local i
	for i = 1, #tab2 do
		if tab1[i] ~= tab2[i] then
			return false
		end
	end

	return true
end


function Sound:OnWuXueChange()
	local ret = GameApi.GetPlayerFullProp(0)
	local list = {}
	list[1] = --[[!AUTO_10]][====[SFX\策划联入\ui\技能切换_少林.wav]====]
	list[2] = --[[!AUTO_11]][====[SFX\策划联入\ui\技能切换_武当.wav]====]
	list[3] = --[[!AUTO_12]][====[SFX\策划联入\ui\技能切换_华山.wav]====]
	list[4] = --[[!AUTO_13]][====[SFX\策划联入\ui\技能切换_恆山.wav]====]
	list[5] = --[[!AUTO_14]][====[SFX\策划联入\ui\技能切换_衡山.wav]====]
	list[6] = --[[!AUTO_15]][====[SFX\策划联入\ui\技能切换_日月.wav]====]
	list[7] = --[[!AUTO_16]][====[SFX\策划联入\ui\技能切换_五仙.wav]====]
	list[8] = --[[!AUTO_17]][====[SFX\策划联入\ui\技能切换_逍遥.wav]====]
	list[9] = --[[!AUTO_18]][====[SFX\策划联入\ui\技能切换_唐门.wav]====]
	list[10] = --[[!AUTO_19]][====[SFX\策划联入\ui\技能切换_峨嵋.wav]====]

	GameApi.Play2DSound(list[ret.prof])
	--GameApi.PlayListSFX(list[ret.prof], false, 0)
	return true
end


Sound.Sound_Horse =
{
	[72] = --马
	{
		RideOnSfx = [====[SFX\player\系统动作\坐骑马上.wav]====],
		GetOffSfx = [====[SFX\player\系统动作\坐骑马下.wav]====],
	},

	[19755] = --老虎
	{
		RideOnSfx = [====[SFX\player系统动作\坐骑虎上.wav]====],
		GetOffSfx = [====[SFX\player\系统动作\坐骑虎下.wav]====],
	},
	[19756] = --骆驼
	{
		RideOnSfx = [====[SFX\player\系统动作\坐骆驼上.wav]====],
		GetOffSfx = [====[SFX\player\系统动作\坐骆驼下.wav]====],
	},

	[11465] = --青牛
	{
		RideOnSfx = [====[SFX\player\系统动作\坐骑牛上.wav]====],
		GetOffSfx = [====[SFX\player\系统动作\坐骑牛下.wav]====],
	},
	[11460] = --华山高级马
	{
		RideOnSfx = [====[SFX\player\系统动作\坐骑马上.wav]====],
		GetOffSfx = [====[SFX\player\系统动作\坐骑马下.wav]====],
	},

	[17640] = --白马
	{
		RideOnSfx = [====[SFX\player\系统动作\坐骑马上.wav]====],
		GetOffSfx = [====[SFX\player\系统动作\坐骑马下.wav]====],
	},
	[17641] = --黄马
	{
		RideOnSfx = [====[SFX\player\系统动作\坐骑马上.wav]====],
		GetOffSfx = [====[SFX\player\系统动作\坐骑马下.wav]====],
	},

	[17642] = --黑马
	{
		RideOnSfx = [====[SFX\player\系统动作\坐骑马上.wav]====],
		GetOffSfx = [====[SFX\player\系统动作\坐骑马下.wav]====],
	},
	[18417] = --金甲黑马
	{
		RideOnSfx = [====[SFX\player\系统动作\坐骑马上.wav]====],
		GetOffSfx = [====[SFX\player\系统动作\坐骑马下.wav]====],
	},

	[19886] = --红衣马匪马
	{
		RideOnSfx = [====[SFX\player\系统动作\坐骑马上.wav]====],
		GetOffSfx = [====[SFX\player\系统动作\坐骑马下.wav]====],
	},
	[19885] = --蒙古精兵队长马
	{
		RideOnSfx = [====[SFX\player\系统动作\坐骑马上.wav]====],
		GetOffSfx = [====[SFX\player\系统动作\坐骑马下.wav]====],
	},

	[19938] = --火龙驹
	{
		RideOnSfx = [====[SFX\player\系统动作\坐骑马上.wav]====],
		GetOffSfx = [====[SFX\player\系统动作\坐骑马下.wav]====],
	},
	[18527] = --京东马
	{
		RideOnSfx = [====[SFX\player\系统动作\坐骑马上.wav]====],
		GetOffSfx = [====[SFX\player\系统动作\坐骑马下.wav]====],
	},
	[20235] = --蜘蛛坐骑
	{
		RideOnSfx = [====[SFX\player\系统动作\坐骑蜘蛛上.wav]====],
		GetOffSfx = [====[SFX\player\系统动作\坐骑蜘蛛下.wav]====],
	},

	[20482] = --坐骑蝎子王
	{
		RideOnSfx = [====[SFX\player\系统动作\坐骑蝎子上.wav]====],
		GetOffSfx = [====[SFX\player\系统动作\坐骑蝎子下.wav]====],
	},
	[20728] = --坐骑蝎子
	{
		RideOnSfx = [====[SFX\player\系统动作\坐骑蝎子上.wav]====],
		GetOffSfx = [====[SFX\player\系统动作\坐骑蝎子下.wav]====],
	},

	[20751] = --土豪金马
	{
		RideOnSfx = [====[SFX\player\系统动作\坐骑马上.wav]====],
		GetOffSfx = [====[SFX\player\系统动作\坐骑马下.wav]====],
	},
}

function Sound:GetHorseSoundCfg()
	return Sound.Sound_Horse
end

function Sound:IsInstanceNoBoardScene( id )
	for i,v in ipairs(Sound.InstanceNoBoard) do
		if v == id then
			return 1
		end
	end
end