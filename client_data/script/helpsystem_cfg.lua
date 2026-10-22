--[[#tag push auto]]

local _DEBUG = false

local PLUN = function (v) return v or true end
--~ if _DEBUG then
--~ 	PLUN = loadfile "test/plun.lua" "script/HelpSystem_cfg.lua"		-- 仅用于调试，调试完毕注释此行
--~ end

local Dlp = DlgTemplate
local DlgApi  = DlgApi
local GameApi = GameApi
local pcall = pcall

if HelpSystem == nil then	-- 调试用

	dofile(--[[!AUTO_1]]"helpsystem.lua")
end

local HelpSystem = HelpSystem
------------------------------
------------------------------
-- 帮助数据模板
------------------------------
local HelpConfig = {}
do
	function HelpConfig:new (helpId)
		local obj = {id = helpId, enabled=true}
		return setmetatable(obj, self)
	end

	-- 帮助完成信息初始化时，此函数被调用。限未完成的帮助
	function HelpConfig:OnInit ()
		if _DEBUG then
			print((--[[!AUTO_2]]"Help %d Init"):format(self.id))
		end
		self:Enable(true)
	end

	-- 注册激活事件，方便不同的帮助相互激活

	function HelpConfig:Register ()
	end

	-- 激活事件的附加控制开关

	function HelpConfig:Enable (flag)
		self.enabled = not not flag
	end

	function HelpConfig:CanActivate ()
		return self.enabled and not HelpSystem:IsHelpFinished(self.id)
	end

	function HelpConfig:Activate (IsShowGfx)
		if _DEBUG then
			print((--[[!AUTO_3]]"Help %d Activate, showGfx: %s"):format(self.id, IsShowGfx and --[[!AUTO_4]]"true" or --[[!AUTO_5]]"false"))
		end
		if self:CanActivate() then
			HelpSystem:ActivateHelp(self.id)
			if IsShowGfx then
				HelpSystemApi.DetachUIGfx(--[[!AUTO_6]]"界面\\教学特效\\指引完成.gfx",--[[!AUTO_7]]"Win_SelfHead",--[[!AUTO_8]]"Img_Head")
			end
			return --[[!AUTO_9]]"end"
		end		-- 未成功激活则不清除

	end

	function HelpConfig:IsActive ()
		return HelpSystem:GetCurrentHelp() == self.id
	end

	function HelpConfig:Finish (IsShowGfx)
		if _DEBUG then
			print((--[[!AUTO_10]]"Help %d Finish, showGfx: %s"):format(self.id, IsShowGfx and --[[!AUTO_11]]"true" or --[[!AUTO_12]]"false"))
		end
		if self:IsFinished() then return end

		HelpSystem:FinishHelp(self.id)
		if IsShowGfx then
			local scale = DlgApi.GetDialogScale(--[[!AUTO_13]]"Win_SelfHead")
			HelpSystemApi.AttachUIGfx(--[[!AUTO_14]]"界面\\教学特效\\指引完成.gfx",--[[!AUTO_15]]"Win_SelfHead",--[[!AUTO_16]]"Img_Head", -1, -550)
		end
	end

	function HelpConfig:IsFinished ()
		return HelpSystem:IsHelpFinished(self.id)
	end

	-- 安全调用函数，防止出错时不能清除注册的事件处理函数

	local function safeCall (func, ...)
		local flag, ret = pcall(func, ...)
		if not flag then
			LogPrint(ret)
		else
			return ret
		end
	end

	--延时后调用函数，delayTime单位为毫秒
	function HelpConfig:DelayCall (delayTime, func)
		local waitedTime = 0
		HelpSystem:RegisterDataEvent(
			function (params)
				if self:IsFinished() then return --[[!AUTO_17]]"end" end
				waitedTime = waitedTime + params.tick_time
				if waitedTime >= delayTime then
					safeCall(func)
					return --[[!AUTO_18]]"end"
				end
			end, DataEvent.DATA_TIME)
	end

	function HelpConfig:TickTimeCall (delayTime, func)
		local waitedTime = 0
		HelpSystem:RegisterDataEvent(
			function (params)
				if self:IsFinished() then return --[[!AUTO_19]]"end" end
				waitedTime = waitedTime + params.tick_time
				if waitedTime >= delayTime then
					waitedTime = 0
					if safeCall(func) == --[[!AUTO_20]]"end" then
						return --[[!AUTO_21]]"end"
					end
				end
			end, DataEvent.DATA_TIME)
	end


	-- 对话框显示时调用函数
	-- bUseRet: 使用传入函数的返回值

	--	bUseRet 为 true 时，只有当 func 返回 true 时才会清除注册的事件处理函数
	function HelpConfig:OnShowDialogCall (dialogName, func, bUseRet)
		HelpSystem:RegisterUIEvent(
			function ()
				if self:IsFinished() then return --[[!AUTO_22]]"end" end
				local ret = safeCall(func)
				if bUseRet then
					return ret
				else
					return --[[!AUTO_23]]"end"
				end
			end, UIEvent.UI_SHOW, dialogName)
	end

	-- 当界面关闭

	function HelpConfig:OnHideDialogCall (dialogName, func, bUseRet)
		HelpSystem:RegisterUIEvent(
			function ()
				if self:IsFinished() then return --[[!AUTO_24]]"end" end
				local ret = safeCall(func)
				if bUseRet then
					return ret
				else
					return --[[!AUTO_25]]"end"
				end
			end, UIEvent.UI_HIDE, dialogName)
	end

	-- 点击某控件时调用函数
	function HelpConfig:OnClickItemCall (dialogName, itemName, func, bUseRet)
		HelpSystem:RegisterUIEvent(
			function (dialog, item)
				if self:IsFinished() then return --[[!AUTO_26]]"end" end
				if itemName == --[[!AUTO_27]]"" then
					safeCall(func)
					if bUseRet then
						return ret
					else
						return --[[!AUTO_28]]"end"
					end
				end
				if item == itemName then
					safeCall(func)
					if bUseRet then
						return ret
					else
						return --[[!AUTO_29]]"end"
					end
				end
			end, UIEvent.UI_LBTNDOWN, dialogName)
	end

	-- 发生某事件时调用函数(仅用主值作为判断条件)
	function HelpConfig:OnEventCall (event, mainParam, func, bUseRet)
		HelpSystem:RegisterDataEvent(
			function (params)
				if self:IsFinished() then return --[[!AUTO_30]]"end" end
				safeCall(func, params)
				if bUseRet then
					return ret
				else
					return --[[!AUTO_31]]"end"
				end
			end, event, mainParam)
	end

	-- 下略
	function HelpConfig:OnGainTaskCall (taskId, func, bUseRet)
		return self:OnEventCall(DataEvent.DATA_GAIN_TASK, taskId, func, bUseRet)
	end
	function HelpConfig:OnCompleteTaskCall (taskId, func, bUseRet)
		return self:OnEventCall(DataEvent.DATA_CANFNSH_TASK, taskId, func, bUseRet)
	end
	function HelpConfig:OnFinishTaskCall (taskId, func, bUseRet)
		return self:OnEventCall(DataEvent.DATA_FNSH_TASK, taskId, func, bUseRet)
	end
	function HelpConfig:OnNpcEnterCall (npcId, func, bUseRet)
		return self:OnEventCall(DataEvent.DATA_NPC_ENTER, npcId, func, bUseRet)
	end
	function HelpConfig:OnNpcLeaveCall (npcId, func, bUseRet)
		return self:OnEventCall(DataEvent.DATA_NPC_LEAVE, npcId, func, bUseRet)
	end
	function HelpConfig:OnMatterEnterCall (MatterId, func, bUseRet)
		return self:OnEventCall(DataEvent.DATA_MATTER_ENTER, MatterId, func, bUseRet)
	end
	function HelpConfig:OnUseQuestItem(Tid, func, bUseRet)
		return self:OnEventCall(DataEvent.DATA_USE_ITEM, Tid, func, bUseRet)
	end
	function HelpConfig:OnObtainItemCall (ItemID, func, bUseRet)
		return self:OnEventCall(DataEvent.DATA_GAIN_ITEM, ItemID, func, bUseRet)
	end
	function HelpConfig:OnInventoryFullCall (PackID, func, bUseRet)
		return self:OnEventCall(DataEvent.DATA_INVENTORY_FULL, PackID, func, bUseRet)
	end
	function HelpConfig:OnChangeMapCall (MapID, func, bUseRet)
		return self:OnEventCall(DataEvent.DATA_LEAVE_SCENE, MapID, func, bUseRet)
	end
	function HelpConfig:OnUseSkillCall (SkillID, func, bUseRet)
		return self:OnEventCall(DataEvent.DATA_USE_SKILL, SkillID, func, bUseRet)
	end
	function HelpConfig:OnPlayerLevelUpCall (Level, func, bUseRet)
		return self:OnEventCall(DataEvent.DATA_LEVEL_CHANGE, Level, func, bUseRet)
	end
	function HelpConfig:OnPetFightCall (PetIndex, func, bUseRet)
		return self:OnEventCall(DataEvent.DATA_PET_SUMMONED, PetIndex, func, bUseRet)
	end
	function HelpConfig:OnLearnSkillCall (SkillID, func, bUseRet)
		return self:OnEventCall(DataEvent.DATA_LEARN_SKILL, SkillID, func, bUseRet)
	end
	function HelpConfig:OnQuestTrackCall (TaskId, func, bUseRet)
		return self:OnEventCall(DataEvent.DATA_QUEST_TRACK_AUTOMOVE, TaskId, func, bUseRet)
	end
	function HelpConfig:OnInventoryFullCall (PackID, func, bUseRet)
		return self:OnEventCall(DataEvent.DATA_INVENTORY_FULL, PackID, func, bUseRet)
	end
	function HelpConfig:OnUseItemCall (ItemID, func, bUseRet)
		return self:OnEventCall(DataEvent.DATA_USE_ITEM, ItemID, func, bUseRet)
	end
	function HelpConfig:OnEnterScene (SceneID, func, bUseRet)
		return self:OnEventCall(DataEvent.DATA_ENTER_SCENE, SceneID, func, bUseRet)
	end
	function HelpConfig:OnPetLevelUp (NewLevel, func, bUseRet)
		return self:OnEventCall(DataEvent.DATA_PET_LEVEL_UP, NewLevel, func, bUseRet)
	end
	function HelpConfig:OnPetHP (cur_hp, func, bUseRet)
		return self:OnEventCall(DataEvent.DATA_PET_HP, cur_hp, func, bUseRet)
	end
	function HelpConfig:OnPlayAction (ActionID, func, bUseRet)
		return self:OnEventCall(DataEvent.DATA_PLAY_ACTION, ActionID, func, bUseRet)
	end
	function HelpConfig:OnBoardChange (repetitionId, newBoardId, func, bUseRet)
		return self:OnEventCall(DataEvent.DATA_BORAD_CHANGE, (--[[!AUTO_32]]"%d_%d"):format(repetitionId, newBoardId), func, bUseRet)
	end
	function HelpConfig:OnAnyBoardChange (func, bUseRet)
		return self:OnEventCall(DataEvent.DATA_BORAD_CHANGE, nil, func, bUseRet)
	end
	function HelpConfig:OnBoardClose (repetitionId, boardId, func, bUseRet)
		return self:OnEventCall(DataEvent.DATA_BOARD_CLOSE, (--[[!AUTO_33]]"%d_%d"):format(repetitionId, boardId), func, bUseRet)
	end
	function HelpConfig:DataEnterPrecinct (secneID, precinctID, func, bUseRet)
		return self:OnEventCall(DataEvent.DATA_ENTER_PRECINCT, (--[[!AUTO_34]]"%d_%d"):format(secneID, precinctID), func, bUseRet)
	end
	function HelpConfig:OnBoardFinish (repetitionId, boardId, func, bUseRet)
		return self:OnEventCall(DataEvent.DATA_BOARD_FINISH, (--[[!AUTO_35]]"%d_%d"):format(repetitionId, boardId), func, bUseRet)
	end
	function HelpConfig:OnAccRun (func, bUseRet)
		return self:OnEventCall(DataEvent.DATA_ACC_RUN, nil, func, bUseRet)
	end
	function HelpConfig:OnEscrotStart (func, bUseRet)
		return self:OnEventCall(DataEvent.DATA_ESCORT_START, nil, func, bUseRet)
	end
	function HelpConfig:OnEscrotRobStart (func, bUseRet)
		return self:OnEventCall(DataEvent.DATA_ESCORT_ROB_START, nil, func, bUseRet)
	end
	function HelpConfig:OnEscrotTrap (func, bUseRet)
		return self:OnEventCall(DataEvent.DATA_ESCORT_TRAP, nil, func, bUseRet)
	end
	function HelpConfig:OnEscrotEscapeTrap (func, bUseRet)
		return self:OnEventCall(DataEvent.DATA_ESCORT_ESCAPE_TRAP, nil, func, bUseRet)
	end
	function HelpConfig:OnEscrotPoison (func, bUseRet)
		return self:OnEventCall(DataEvent.DATA_ESCORT_POISON, nil, func, bUseRet)
	end
	function HelpConfig:OnEscrotAdventure (func, bUseRet)
		return self:OnEventCall(DataEvent.DATA_ESCORT_ADVENTURE, nil, func, bUseRet)
	end
	function HelpConfig:OnEscrotFinish (func, bUseRet)
		return self:OnEventCall(DataEvent.DATA_ESCORT_FINISH, nil, func, bUseRet)
	end
	function HelpConfig:OnEscrotTooFar (func, bUseRet)
		return self:OnEventCall(DataEvent.DATA_ESCORT_TOO_FAR, nil, func, bUseRet)
	end
	function HelpConfig:OnGainAchievement (AchID, func, bUseRet)
		return self:OnEventCall(DataEvent.DATA_ACHIEVEMENT_COMPLETE, AchID, func, bUseRet)
	end
	function HelpConfig:DATAACTIVITYOPEN(EventID, func, bUseRet)
		return self:OnEventCall(DataEvent.DATA_ACTIVITY_OPEN, EventID, func, bUseRet)
	end
	function HelpConfig:OnReputation(RepuId, func, bUseRet)
		return self:OnEventCall(DataEvent.DATA_REPUTATION, RepuId, func, bUseRet)
	end
	function HelpConfig:OnEnterFaction(func, bUseRet)
		return self:OnEventCall(DataEvent.DATA_FACTION_ENTER_FACTION, nil, func, bUseRet)
	end
	function HelpConfig:OnJiaChiChanged(func, bUseRet)
		return self:OnEventCall(DataEvent.DATA_FACTION_JIACHI_CHANGED, nil, func, bUseRet)
	end
	function HelpConfig:OnFactionSelectedAshead(func, bUseRet)
		return self:OnEventCall(DataEvent.DATA_FACTION_SELECTEDASHEAD, nil, func, bUseRet)
	end
	function HelpConfig:OnCreateFaction(func, bUseRet)
		return self:OnEventCall(DataEvent.DATA_FACTION_CREATEFACTION, nil, func, bUseRet)
	end
	function HelpConfig:OnLineNumChanged(func, bUseRet)
		return self:OnEventCall(DataEvent.DATA_SYSTEM_LINENUM_CHANGED, nil, func, bUseRet)
	end
	function HelpConfig:OnSkillLevelUp(func, bUseRet)
		return self:OnEventCall(DataEvent.DATA_SYSTEM_CAN_SKILL_LEVELUP, nil, func, bUseRet)
	end
end
HelpConfig.__index = PLUN(HelpConfig, --[[!AUTO_36]]"HelpConfig")

------------------------------
-- 界面显示相关函数
------------------------------

-- 显示提示界面，再显示Tip子界面 (界面开启前应将已存在的Tip子界面关掉)
local function ShowUITip(HelpId, TargetUI,ItemName, index)

	if Help_Tips == nil then
		HelpSystem:ShowHelpUI(--[[!AUTO_37]]"Help_Tips", -6000, -6000)
	end
	if DlgApi.IsDialogShow(TargetUI) then
		Help_Tips:ShowTip(HelpId, TargetUI, ItemName, index)
	else
		HelpConfig:OnShowDialogCall(TargetUI,
			function()
				Help_Tips:ShowTip(HelpId, TargetUI, ItemName, index)
				return --[[!AUTO_38]]"end"
			end, false)
	end
end

--显示指引界面
function HelpConfig:showHelpInterface(index)
	HelpSystemApi.ShowHelpUI(--[[!AUTO_39]]"Help_Title", -100, -1)
	Help_Title:setHelpContent(index)
end

-- 关闭Tip子界面

local function HideTip(UIName)
	Help_Tips:HideTip(UIName)
end

-- 在任务追踪面板上显示提示界面，由于接、完成任务到追踪面板更新有一定延时，所以多次尝试直到显示成功

local function ShowQuestTip(HelpId)
	if Help_Tips == nil then
		HelpSystem:ShowHelpUI(--[[!AUTO_40]]"Help_Tips", -1, -1)
	end
	HelpSystem:RegisterDataEvent(
		function ()
			if HelpSystem:IsHelpFinished(HelpId) then
				return --[[!AUTO_41]]"end"
			end
				local flag = Help_Tips:ShowTip(HelpId, --[[!AUTO_42]]"Win_TrackFrame")
				if flag then
					return --[[!AUTO_43]]"end"
				end
		end, DataEvent.DATA_TIME)
end

local function ShowInstanceTip(HelpId)
	if Help_Tips == nil then
		HelpSystem:ShowHelpUI(--[[!AUTO_44]]"Help_Tips", -4000, -4000)
	end
	HelpSystem:RegisterDataEvent(
		function ()
			if HelpSystem:IsHelpFinished(HelpId) then
				return --[[!AUTO_45]]"end"
			end
				local flag =  Help_Tips:ShowTip(HelpId, --[[!AUTO_46]]"Win_InstanceConfig")
				if flag then
					Help_Tips:ShowTip(HelpId, --[[!AUTO_47]]"Win_InstanceConfig")
					return --[[!AUTO_48]]"end"
				end
		end, DataEvent.DATA_TIME)
end


-- 关闭任务追踪面板上的Tip子界面

local function HideQuestTip()
	Help_Tips:HideTip(--[[!AUTO_49]]"Win_QuestMinionContent")
end

local function HideInstanceTip()
	Help_Tips:HideTip(--[[!AUTO_50]]"Win_InstCfgTemplate")
end

-- 显示帮助内容UI
local function ShowHelpPetUI (x, y, content, headImage, name)
	if Help_Pet == nil then
		HelpSystem:ShowHelpUI(--[[!AUTO_51]]"Help_Pet", -1, -1)
	end
	HelpSystem:ShowHelpUI(--[[!AUTO_52]]"Help_Pet", x, y)
	Help_Pet:SetContent(--[[!AUTO_53]]"", content, headImage, name)
end

-- 关闭帮助内容UI
local function HideHelpPetUI ()
	HelpSystem:HideHelpUI(--[[!AUTO_54]]"Help_Pet")
end

-- 提示使用物品set
local function SetInventoryItem(tid)
	GameApi.SetInventoryObjectTargetTid(tid)
end

-- 提示使用物品Get 返回包裹中对应位置的控件名

local function GetInventoryItem(dialogName, id, dwPeriod)
	if DlgApi.IsDialogShow(dialogName) then
		for i = 1, dwPeriod do
		HelpSystem:RegisterDataEvent(
			function ()
				if i == dwPeriod then
					local ItemName = GameApi.GetInventoryObjectByTid()
					if ItemName then
						ShowUITip(id, dialogName, ItemName)
					end
				end
				return --[[!AUTO_55]]"end"
			end,
		DataEvent.DATA_TIME)
		end
	end
end

--摄像机转动角度

local function CameraIsOver(InitYaw, SetYaw)
local Yaw, _,_ = HelpSystemApi.GetCameraInfo()
	if Yaw then
		if Yaw >=  InitYaw + SetYaw or Yaw <= InitYaw - SetYaw then
			return true
		end
	end
	return false
end

--指定控件内是否存在物品图标

local function GetHoverImage(DialogName, ItemName)
	if HelpSystemApi.IsImageHasCover(DialogName, ItemName) then
		return true
	end
	return false
end

--判断是否进入战斗状态

local function GetIsFighting()
	if GameApi.IsFighting() then
		return true
	end
	return false
end

--指定控件显示图片
local function SetItemImage(DialogName, ItemName, ImagePath, dwPeriod)
	if DlgApi.IsDialogShow(DialogName) then
		for i = 1, dwPeriod do
		HelpSystem:RegisterDataEvent(
			function ()
				if i == dwPeriod then
					DlgApi.SetImageFile(DialogName, ItemName, ImagePath, 1)
				end
				return --[[!AUTO_56]]"end"
			end,
			DataEvent.DATA_TIME)
		end
	end
end

--指定控件显示文字
local function SetItemText(DialogName, ItemName, TextStr, dwPeriod)
	if DlgApi.IsDialogShow(DialogName) then
		for i = 1, dwPeriod do
		HelpSystem:RegisterDataEvent(
			function ()
				if i == dwPeriod then
					DlgApi.SetItemText(DialogName, ItemName, TextStr)
				end
				return --[[!AUTO_57]]"end"
			end,
			DataEvent.DATA_TIME)
		end
	end
end

------------------------------
-- 帮助数据
------------------------------
--[[
do  -- 初始指引，指引移动

	local helpId = 1
	local config = HelpConfig:new(helpId)

	function config:OnInit ()
		HelpConfig.OnInit(self)
		self:Register()	-- 默认开启，注册激活条件
		local i = 0
		HelpSystem:RegisterDataEvent(
		function ()
			if DlgApi.IsDialogShow("Win_QuickBar") then
				i = i + 1
				if i == 5 then
					HelpSystemApi.ShowHelpUI("Help_EventList", -1, -100)
					return "end"
				end
			end
		end, DataEvent.DATA_TIME)
		if #(Debug_ScriptList) > 0 then
			HelpSystemApi.ShowHelpUI("ExInEdMode_UI", 50, -300)
		end
	end

	function config:Register ()
		self:Activate(false)
	end

	function config:OnActivate ()
		print("")
		self:showHelpInterface(1)
		local yaw, pitch, _ = HelpSystemApi.GetCameraInfo()

		HelpSystemApi.AttachUIGfx("界面\\教学特效\\镜头操作.gfx","Help_Title","Img_Gfx", -1, -1)

		--鼠标向右移动
		self:TickTimeCall(60,
			function()
				if GameApi.IsRotatingCamera() then
					Help_Title:HelpComplete(1, 1)
					HelpSystemApi.DetachUIGfx("界面\\教学特效\\镜头操作.gfx","Help_Title","Img_Gfx")
					HelpSystemApi.AttachUIGfx("界面\\教学特效\\镜头操作_镜头右转.gfx","Help_Title","Img_Gfx", -1, -1)
					return "end"
				end
			end)

		self:TickTimeCall(60,
			function()
				local y, p, _ = HelpSystemApi.GetCameraInfo()
				if y - yaw > 60 then
					Help_Title:HelpComplete(1, 2)
					HelpSystemApi.DetachUIGfx("界面\\教学特效\\镜头操作_镜头右转.gfx","Help_Title","Img_Gfx")
					self:Finish(false)
					return "end"
				end
			end)

		self:OnClickItemCall("Help_Title", "Btn_ok", function () return self:Finish() end)
		self:OnChangeMapCall(GameApi.GetSceneID(), function () return self:Finish() end)
	end

	function config:OnFinish ()
		HelpSystemApi.DetachUIGfx("界面\\教学特效\\镜头操作.gfx","Help_Title","Img_Gfx")
		HelpSystemApi.DetachUIGfx("界面\\教学特效\\镜头操作_镜头右转.gfx","Help_Title","Img_Gfx")
		HelpSystemApi.HideHelpUI("Help_Title")
		HelpSystem:ActivateHelp(2)
	end
	HelpSystem:SetHelpConfig(helpId, PLUN(config, "config[1]"))
end
--]]


do	--Config[2] 键盘移动操作

	local helpId = 2
	local config = HelpConfig:new(helpId)

	function config:OnInit ()
		HelpConfig.OnInit(self)
		self:Register()
	end

	function config:Register ()
		self:OnNpcEnterCall(61653, function () return self:Activate(false) end, false)
	end

	function config:OnActivate ()
		self:showHelpInterface(2)
		HelpSystemApi.AttachUIGfx(--[[!AUTO_58]]"界面\\教学特效\\方向键操作.gfx",--[[!AUTO_59]]"Help_Title",--[[!AUTO_60]]"Img_Gfx", -1, -1)
		HelpSystem:RegisterDataEvent(
		function ()
			Help_Title:HelpComplete(2, 1)
			HelpSystemApi.DetachUIGfx(--[[!AUTO_61]]"界面\\教学特效\\方向键操作.gfx",--[[!AUTO_62]]"Help_Title",--[[!AUTO_63]]"Img_Gfx")
			self:DelayCall(200,
			function()
				HelpSystemApi.AttachUIGfx(--[[!AUTO_64]]"界面\\教学特效\\鼠标移动操作.gfx",--[[!AUTO_65]]"Help_Title",--[[!AUTO_66]]"Img_Gfx", -1, -1)

				HelpSystem:RegisterDataEvent(
				function ()
					Help_Title:HelpComplete(2, 2)
					HelpSystemApi.DetachUIGfx(--[[!AUTO_67]]"界面\\教学特效\\鼠标移动操作.gfx",--[[!AUTO_68]]"Help_Title",--[[!AUTO_69]]"Img_Gfx")
					self:Finish()
					return --[[!AUTO_70]]"end"
				end, DataEvent.DATA_PLAY_ACTION, 22)

				return --[[!AUTO_71]]"end"
			end)
			return --[[!AUTO_72]]"end"
		end, DataEvent.DATA_PLAY_ACTION, 22)

		self:OnClickItemCall(--[[!AUTO_73]]"Help_Title", --[[!AUTO_74]]"Btn_ok",
		function ()
			self:Finish()
			return --[[!AUTO_75]]"end"
		end)

		self:OnChangeMapCall(GameApi.GetSceneID(), function () return self:Finish() end)
	end

	function config:OnFinish ()
			HelpSystemApi.DetachUIGfx(--[[!AUTO_76]]"界面\\教学特效\\方向键操作.gfx",--[[!AUTO_77]]"Help_Title",--[[!AUTO_78]]"Img_Gfx")
			HelpSystemApi.DetachUIGfx(--[[!AUTO_79]]"界面\\教学特效\\鼠标移动操作.gfx",--[[!AUTO_80]]"Help_Title",--[[!AUTO_81]]"Img_Gfx")
			HelpSystemApi.HideHelpUI(--[[!AUTO_82]]"Help_Title")
			HelpSystem:ActivateHelp(3)
	end

	HelpSystem:SetHelpConfig(helpId, PLUN(config, --[[!AUTO_83]]"config[2]"))
end

do	--Config[3] 与NPC进行对话

	local helpId = 3
	local config = HelpConfig:new(helpId)

	function config:OnInit ()
		HelpConfig.OnInit(self)
		self:Register()
	end

	function config:Register ()
		self:OnNpcEnterCall(0,
		function ()
			if ret.Level == 1 then
				return self:Activate(false)
			end
		end, false)
	end

	function config:OnActivate ()
		self:showHelpInterface(3)
		HelpSystemApi.AttachUIGfx(--[[!AUTO_84]]"界面\\教学特效\\对话NPC.gfx",--[[!AUTO_85]]"Help_Title",--[[!AUTO_86]]"Img_Gfx", -1, -1)
		self:OnShowDialogCall(--[[!AUTO_87]]"Win_NpcTaskTalk",
		function ()
			Help_Title:HelpComplete(2, 1)
			HelpSystemApi.DetachUIGfx(--[[!AUTO_88]]"界面\\教学特效\\对话NPC.gfx",--[[!AUTO_89]]"Help_Title",--[[!AUTO_90]]"Img_Gfx")
			self:Finish(true)
			return --[[!AUTO_91]]"end"
		end, false)

		self:OnClickItemCall(--[[!AUTO_92]]"Help_Title", --[[!AUTO_93]]"Btn_ok",
		function ()
			self:Finish()
			return --[[!AUTO_94]]"end"
		end)

		self:DelayCall(10000, function() self:Finish() end)
		self:OnChangeMapCall(GameApi.GetSceneID(), function () return self:Finish() end)
	end

	function config:OnFinish ()
		HelpSystemApi.DetachUIGfx(--[[!AUTO_95]]"界面\\教学特效\\对话NPC.gfx",--[[!AUTO_96]]"Help_Title",--[[!AUTO_97]]"Img_Gfx")
		HelpSystemApi.HideHelpUI(--[[!AUTO_98]]"Help_Title")
	end

	HelpSystem:SetHelpConfig(helpId, PLUN(config, --[[!AUTO_99]]"config[3]"))
end

do	--Config[4] 任务追踪的使用

	local helpId = 4
	local config = HelpConfig:new(helpId)

	function config:OnInit ()
		HelpConfig.OnInit(self)
		self:Register()
	end

	function config:Register ()
		self:OnBoardChange(2823, 4, function () return self:Activate(true) end, false)
	end

	function config:OnActivate ()
		ShowInstanceTip(self.id)
		self:OnQuestTrackCall (nil,
		function (params)
			if params.task_id == 0 then
				self:Finish(true)
			end
		end)

		self:DelayCall(30000, function() self:Finish() end)
		self:OnChangeMapCall(GameApi.GetSceneID(), function () return self:Finish() end)
	end

	function config:OnFinish ()
		HideInstanceTip()
	end

	HelpSystem:SetHelpConfig(helpId, PLUN(config, --[[!AUTO_100]]"config[4]"))
end

do	--Config[5] 打怪指引
	local helpId = 5
	local config = HelpConfig:new(helpId)

	function config:OnInit ()
		HelpConfig.OnInit(self)
		self:Register()
	end

	function config:Register ()
		self:OnNpcEnterCall(62464, function () return self:Activate(false) end, false)
	end

	function config:OnActivate ()
		self:showHelpInterface(4)
		HelpSystemApi.AttachUIGfx(--[[!AUTO_101]]"界面\\教学特效\\选中攻击目标.gfx",--[[!AUTO_102]]"Help_Title",--[[!AUTO_103]]"Img_Gfx", -1, -1)
		HelpSystem:RegisterDataEvent(
		function()
			if GameApi.CanAttack() then
				HelpSystemApi.DetachUIGfx(--[[!AUTO_104]]"界面\\教学特效\\选中攻击目标.gfx",--[[!AUTO_105]]"Help_Title",--[[!AUTO_106]]"Img_Gfx")
				HelpSystemApi.AttachUIGfx(--[[!AUTO_107]]"界面\\教学特效\\攻击选中目标.gfx",--[[!AUTO_108]]"Help_Title",--[[!AUTO_109]]"Img_Gfx", -1, -1)
				Help_Title:HelpComplete(4, 1)
				HelpSystem:RegisterDataEvent(
					function ()
						if GetIsFighting() then
							Help_Title:HelpComplete(4, 2)
							HelpSystemApi.DetachUIGfx(--[[!AUTO_110]]"界面\\教学特效\\攻击选中目标.gfx",--[[!AUTO_111]]"Help_Title",--[[!AUTO_112]]"Img_Gfx")
							self:Finish(true)
							return --[[!AUTO_113]]"end"
						end
					end, DataEvent.DATA_TIME)
				return --[[!AUTO_114]]"end"
			end
		end, DataEvent.DATA_TIME)

		self:OnClickItemCall(--[[!AUTO_115]]"Help_Title", --[[!AUTO_116]]"Btn_ok", function () return self:Finish() end)
		self:DelayCall(10000, function() self:Finish() end)
		self:OnChangeMapCall(GameApi.GetSceneID(), function () return self:Finish() end)
	end

	function config:OnFinish ()
		HelpSystemApi.DetachUIGfx(--[[!AUTO_117]]"界面\\教学特效\\选中攻击目标.gfx",--[[!AUTO_118]]"Help_Title",--[[!AUTO_119]]"Img_Gfx")
		HelpSystemApi.DetachUIGfx(--[[!AUTO_120]]"界面\\教学特效\\攻击选中目标.gfx",--[[!AUTO_121]]"Help_Title",--[[!AUTO_122]]"Img_Gfx")
		HelpSystemApi.HideHelpUI(--[[!AUTO_123]]"Help_Title")
	end

	HelpSystem:SetHelpConfig(helpId, PLUN(config, --[[!AUTO_124]]"config[5]"))
end

--[[
do	--Config[6] 载具使用指引
	local helpId = 6
	local config = HelpConfig:new(helpId)

	function config:OnInit ()
		HelpConfig.OnInit(self)
		self:Register()
	end

	function config:Register ()
		self:OnBoardFinish(2823, 6, function () self:Activate(false) end)
	end

	function config:OnActivate ()
		self:showHelpInterface(5)
		HelpSystemApi.AttachUIGfx("界面\\教学特效\\载具使用.gfx","Help_Title","Img_Gfx", -1, -1)
		HelpSystem:RegisterDataEvent(
		function (params)
			if params.action == 90 then
				HelpSystemApi.DetachUIGfx("界面\\教学特效\\载具使用.gfx","Help_Title","Img_Gfx")
				self:Finish(true)
				return "end"
			end
		end, DataEvent.DATA_PLAY_ACTION, nil)

		self:OnClickItemCall("Help_Title", "Btn_ok", function () return self:Finish() end)
		self:DelayCall(10000, function() self:Finish() end)
		self:OnChangeMapCall(GameApi.GetSceneID(), function () return self:Finish() end)
	end

	function config:OnFinish ()
		HelpSystemApi.DetachUIGfx("界面\\教学特效\\载具使用.gfx","Help_Title","Img_Gfx")
		HelpSystemApi.HideHelpUI("Help_Title")
	end

	HelpSystem:SetHelpConfig(helpId, PLUN(config, "config[6]"))
end
--]]

do	--Config[7] 交接任务指引
	local helpId = 7
	local config = HelpConfig:new(helpId)

	function config:OnInit ()
		HelpConfig.OnInit(self)
		self:Register()
	end

	function config:Register ()
		self:OnNpcEnterCall(61707, function () return self:Activate(false) end, false)
	end

	function config:OnActivate ()
		ShowUITip(self.id, --[[!AUTO_125]]"Win_EasyBox", --[[!AUTO_126]]"Btn_Box01")
		self:OnShowDialogCall(--[[!AUTO_127]]"Win_NPCTask",
		function ()
			HideTip(--[[!AUTO_128]]"Win_EasyBox")
			ShowUITip(self.id, --[[!AUTO_129]]"Win_NPCTask", --[[!AUTO_130]]"Btn_Accept", 1)
			self:OnClickItemCall(--[[!AUTO_131]]"Win_NPCTask", --[[!AUTO_132]]"Btn_Accept",
			function ()
				self:showHelpInterface(6)
				HelpSystemApi.AttachUIGfx(--[[!AUTO_133]]"界面\\教学特效\\调息使用.gfx",--[[!AUTO_134]]"Help_Title",--[[!AUTO_135]]"Img_Gfx", -1, -1)
				HelpSystem:RegisterDataEvent(
				function (params)
					if params.action == 60 then
						ShowUITip(self.id, --[[!AUTO_136]]"Win_MagicProgress5", --[[!AUTO_137]]"Edt_PerfectTime")
						return --[[!AUTO_138]]"end"
					end
				end, DataEvent.DATA_PLAY_ACTION, nil)
				HideTip(--[[!AUTO_139]]"Win_NPCTask")
				return --[[!AUTO_140]]"end"
			end)
			return --[[!AUTO_141]]"end"
		end, false)
		self:OnHideDialogCall(--[[!AUTO_142]]"Win_MagicProgress5", function () return self:Finish(true) end)
		self:OnClickItemCall(--[[!AUTO_143]]"Help_Title", --[[!AUTO_144]]"Btn_ok", function () return self:Finish() end)
		self:DelayCall(120000, function() self:Finish() end)
		self:OnChangeMapCall(GameApi.GetSceneID(), function () return self:Finish() end)
	end

	function config:OnFinish ()
		HideTip(--[[!AUTO_145]]"Win_EasyBox")
		HideTip(--[[!AUTO_146]]"Win_NPCTask")
		HelpSystemApi.DetachUIGfx(--[[!AUTO_147]]"界面\\教学特效\\调息使用.gfx",--[[!AUTO_148]]"Help_Title",--[[!AUTO_149]]"Img_Gfx")
		HelpSystemApi.HideHelpUI(--[[!AUTO_150]]"Help_Title")
		HideTip(--[[!AUTO_151]]"Win_MagicProgress5")
	end

	HelpSystem:SetHelpConfig(helpId, PLUN(config, --[[!AUTO_152]]"config[7]"))
end

--[[
do	--Config[8] 调息指引
	local helpId = 8
	local config = HelpConfig:new(helpId)

	function config:OnInit ()
		HelpConfig.OnInit(self)
		self:Register()
	end

	function config:Register ()
		HelpConfig:OnGainTaskCall (5334, function () return self:Activate(false) end, false)
	end

	function config:OnActivate ()
		self:showHelpInterface(6)
		self:DelayCall(20000, function() self:Finish() end)
		self:OnChangeMapCall(GameApi.GetSceneID(), function () return self:Finish() end)
	end

	function config:OnFinish ()
	end

	HelpSystem:SetHelpConfig(helpId, PLUN(config, "config[8]"))
end
--]]

do	--Config[9] 采矿
	local helpId = 9
	local config = HelpConfig:new(helpId)

	function config:OnInit ()
		HelpConfig.OnInit(self)
		self:Register()
	end

	function config:Register ()
		self:OnFinishTaskCall(5204, function () return self:Activate(false) end, false)
	end

	function config:OnActivate ()
		ShowUITip(self.id, --[[!AUTO_153]]"Win_EasyBox", --[[!AUTO_154]]"Btn_Box01")
		HelpSystemApi.ShowHelpUI(--[[!AUTO_155]]"Help_Mine", -1, -1)
		self:OnClickItemCall(--[[!AUTO_156]]"Win_EasyBox", --[[!AUTO_157]]"Btn_Box01", function () return self:Finish() end)
		self:OnCompleteTaskCall (5205, function () return self:Finish(true) end)
		self:DelayCall(10000, function() self:Finish() end)
		self:OnChangeMapCall(GameApi.GetSceneID(), function () return self:Finish() end)
	end

	function config:OnFinish ()
		HideTip(--[[!AUTO_158]]"Win_EasyBox")
	end

	HelpSystem:SetHelpConfig(helpId, PLUN(config, --[[!AUTO_159]]"config[9]"))
end

do	--Config[10] 执行动作
	local helpId = 10
	local config = HelpConfig:new(helpId)

	function config:OnInit ()
		HelpConfig.OnInit(self)
		self:Register()
	end

	function config:Register ()
		self:OnGainTaskCall(5206, function () return self:Activate(false) end, false)
	end

	function config:OnActivate ()
		ShowUITip(self.id, --[[!AUTO_160]]"Win_EasyBox", --[[!AUTO_161]]"Btn_Box01")
		self:OnClickItemCall(--[[!AUTO_162]]"Win_EasyBox", --[[!AUTO_163]]"Btn_Box01", function() HideTip(--[[!AUTO_164]]"Win_EasyBox") return --[[!AUTO_165]]"end" end)
		self:OnCompleteTaskCall (5206, function () HideTip(--[[!AUTO_166]]"Win_EasyBox") return self:Finish(true) end)
		self:OnChangeMapCall(GameApi.GetSceneID(), function () return self:Finish() end)
		self:DelayCall(10000, function() self:Finish() end)
	end

	function config:OnFinish ()
		HideTip(--[[!AUTO_167]]"Win_TaskAction")
		HideTip(--[[!AUTO_168]]"Win_EasyBox")
	end

	HelpSystem:SetHelpConfig(helpId, PLUN(config, --[[!AUTO_169]]"config[10]"))
end

do	--Config[11]装备上衣

	local helpId = 11
	local config = HelpConfig:new(helpId)

	function config:OnInit ()
		HelpConfig.OnInit(self)
		self:Register()
	end

	function config:Register ()
		local Itemid = {}
		Itemid[0] 	= 38808	--男
		Itemid[1] 	= 38808 --女

		self:OnObtainItemCall(nil,
		function (params)
			local ret = GameApi.GetPlayerFullProp(0)
			if Itemid[ret.gender] then
				if Itemid[ret.gender] == params.item_id then
					return self:Activate()
				end
			end
		end, true)
	end

	function config:OnActivate ()
		local ret = GameApi.GetPlayerFullProp(0)
		local Itemid = {}
		Itemid[0] 	= 38808	--男
		Itemid[1] 	= 38808 --女

		SetInventoryItem(Itemid[ret.gender])
		ShowUITip(self.id, --[[!AUTO_170]]"Win_Main", --[[!AUTO_171]]"Btn_Inventory")
		self:OnShowDialogCall(--[[!AUTO_172]]"Win_Inventory", function () HideTip(--[[!AUTO_173]]"Win_Main") GetInventoryItem(--[[!AUTO_174]]"Win_Inventory", self.id, 30) end)
		self:OnUseQuestItem(Itemid[ret.gender],
						function ()
							self:Finish(true)
							HideTip(--[[!AUTO_175]]"Win_Inventory")
							return --[[!AUTO_176]]"end"
						end)

		self:OnHideDialogCall(--[[!AUTO_177]]"Win_Inventory", function () return self:Finish() end)
		self:DelayCall(10000, function() self:Finish() end)
		self:OnChangeMapCall(GameApi.GetSceneID(), function () return self:Finish() end)
	end

	function config:OnFinish ()
		HideHelpPetUI()
		HelpSystemApi.HideHelpUI(--[[!AUTO_178]]"Win_Inventory")
		HideTip(--[[!AUTO_179]]"Win_Inventory")
		HideTip(--[[!AUTO_180]]"Win_Main")
	end

	HelpSystem:SetHelpConfig(helpId, PLUN(config, --[[!AUTO_181]]"config[11]"))
end

do	--Config[12]装备裤子

	local helpId = 12
	local config = HelpConfig:new(helpId)

	function config:OnInit ()
		HelpConfig.OnInit(self)
		self:Register()
	end

	function config:Register ()
		local Itemid = {}
		Itemid[0] 	= 38810	--男
		Itemid[1] 	= 38810 --女

		self:OnObtainItemCall(nil,
		function (params)
			local ret = GameApi.GetPlayerFullProp(0)
			if Itemid[ret.gender] then
				if Itemid[ret.gender] == params.item_id then
					return self:Activate()
				end
			end
		end, true)
	end

	function config:OnActivate ()
		local ret = GameApi.GetPlayerFullProp(0)
		local Itemid = {}
		Itemid[0] 	= 38810	--男
		Itemid[1] 	= 38810 --女

		SetInventoryItem(Itemid[ret.gender])
		ShowUITip(self.id, --[[!AUTO_182]]"Win_Main", --[[!AUTO_183]]"Btn_Inventory")
		self:OnShowDialogCall(--[[!AUTO_184]]"Win_Inventory", function () HideTip(--[[!AUTO_185]]"Win_Main") GetInventoryItem(--[[!AUTO_186]]"Win_Inventory", self.id, 30) end)
		self:OnUseQuestItem(Itemid[ret.gender],
						function ()
							self:Finish(true)
							HideTip(--[[!AUTO_187]]"Win_Inventory")
							return --[[!AUTO_188]]"end"
						end)

		self:OnHideDialogCall(--[[!AUTO_189]]"Win_Inventory", function () return self:Finish() end)
		self:DelayCall(10000, function() self:Finish() end)
		self:OnChangeMapCall(GameApi.GetSceneID(), function () return self:Finish() end)
	end

	function config:OnFinish ()
		HideHelpPetUI()
		HelpSystemApi.HideHelpUI(--[[!AUTO_190]]"Win_Inventory")
		HideTip(--[[!AUTO_191]]"Win_Inventory")
		HideTip(--[[!AUTO_192]]"Win_Main")
	end

	HelpSystem:SetHelpConfig(helpId, PLUN(config, --[[!AUTO_193]]"config[12]"))
end

do	--Config[13]装备鞋子

	local helpId = 13
	local config = HelpConfig:new(helpId)

	function config:OnInit ()
		HelpConfig.OnInit(self)
		self:Register()
	end

	function config:Register ()
		local Itemid = {}
		Itemid[0] 	= 38811	--男
		Itemid[1] 	= 38811 --女

		self:OnObtainItemCall(nil,
		function (params)
			local ret = GameApi.GetPlayerFullProp(0)
			if Itemid[ret.gender] then
				if Itemid[ret.gender] == params.item_id then
					return self:Activate()
				end
			end
		end, true)
	end

	function config:OnActivate ()
		local ret = GameApi.GetPlayerFullProp(0)
		local Itemid = {}
		Itemid[0] 	= 38811	--男
		Itemid[1] 	= 38811 --女

		SetInventoryItem(Itemid[ret.gender])
		self:OnShowDialogCall(--[[!AUTO_194]]"Win_Inventory", function () HideTip(--[[!AUTO_195]]"Win_Main") GetInventoryItem(--[[!AUTO_196]]"Win_Inventory", self.id, 30) end)
		self:OnUseQuestItem(Itemid[ret.gender],
						function ()
							self:Finish(true)
							HideTip(--[[!AUTO_197]]"Win_Inventory")
							return --[[!AUTO_198]]"end"
						end)
		self:OnHideDialogCall(--[[!AUTO_199]]"Win_Inventory", function () return self:Finish() end)
		self:DelayCall(10000, function() self:Finish() end)
		self:OnChangeMapCall(GameApi.GetSceneID(), function () return self:Finish() end)
	end

	function config:OnFinish ()
		HideHelpPetUI()
		HelpSystemApi.HideHelpUI(--[[!AUTO_200]]"Win_Inventory")
		HideTip(--[[!AUTO_201]]"Win_Inventory")
		HideTip(--[[!AUTO_202]]"Win_Main")
	end

	HelpSystem:SetHelpConfig(helpId, PLUN(config, --[[!AUTO_203]]"config[13]"))
end

do	--Config[14]装备护腕

	local helpId = 14
	local config = HelpConfig:new(helpId)

	function config:OnInit ()
		HelpConfig.OnInit(self)
		self:Register()
	end

	function config:Register ()
		local Itemid = {}
		Itemid[0] 	= 38809	--男
		Itemid[1] 	= 38809 --女

		self:OnObtainItemCall(nil,
		function (params)
			local ret = GameApi.GetPlayerFullProp(0)
			if Itemid[ret.gender] then
				if Itemid[ret.gender] == params.item_id then
					return self:Activate()
				end
			end
		end, true)
	end

	function config:OnActivate ()
		local ret = GameApi.GetPlayerFullProp(0)
		local Itemid = {}
		Itemid[0] 	= 38809	--男
		Itemid[1] 	= 38809 --女

		SetInventoryItem(Itemid[ret.gender])
		ShowUITip(self.id, --[[!AUTO_204]]"Win_Main", --[[!AUTO_205]]"Btn_Inventory")
		self:OnShowDialogCall(--[[!AUTO_206]]"Win_Inventory", function () HideTip(--[[!AUTO_207]]"Win_Main") GetInventoryItem(--[[!AUTO_208]]"Win_Inventory", self.id, 30) end)
		self:OnUseQuestItem(Itemid[ret.gender],
						function ()
							self:Finish(true)
							HideTip(--[[!AUTO_209]]"Win_Inventory")
							return --[[!AUTO_210]]"end"
						end)

		self:OnHideDialogCall(--[[!AUTO_211]]"Win_Inventory", function () return self:Finish() end)
		self:DelayCall(10000, function() self:Finish() end)
		self:OnChangeMapCall(GameApi.GetSceneID(), function () return self:Finish() end)
	end

	function config:OnFinish ()
		HideHelpPetUI()
		HelpSystemApi.HideHelpUI(--[[!AUTO_212]]"Win_Inventory")
		HideTip(--[[!AUTO_213]]"Win_Inventory")
		HideTip(--[[!AUTO_214]]"Win_Main")
	end

	HelpSystem:SetHelpConfig(helpId, PLUN(config, --[[!AUTO_215]]"config[14]"))
end

do	--Config[15]装备帽子

	local helpId = 15
	local config = HelpConfig:new(helpId)

	function config:OnInit ()
		HelpConfig.OnInit(self)
		self:Register()
	end

	function config:Register ()
		local Itemid = {}
		Itemid[0] 	= 38807	--男
		Itemid[1] 	= 38807 --女

		self:OnObtainItemCall(nil,
		function (params)
			local ret = GameApi.GetPlayerFullProp(0)
			if Itemid[ret.gender] then
				if Itemid[ret.gender] == params.item_id then
					return self:Activate()
				end
			end
		end, true)
	end

	function config:OnActivate ()
		local ret = GameApi.GetPlayerFullProp(0)
		local Itemid = {}
		Itemid[0] 	= 38807	--男
		Itemid[1] 	= 38807 --女

		SetInventoryItem(Itemid[ret.gender])
		ShowUITip(self.id, --[[!AUTO_216]]"Win_Main", --[[!AUTO_217]]"Btn_Inventory")
		self:OnShowDialogCall(--[[!AUTO_218]]"Win_Inventory", function () HideTip(--[[!AUTO_219]]"Win_Main") GetInventoryItem(--[[!AUTO_220]]"Win_Inventory", self.id, 30) end)
		self:OnUseQuestItem(Itemid[ret.gender],
						function ()
							self:Finish(true)
							HideTip(--[[!AUTO_221]]"Win_Inventory")
							return --[[!AUTO_222]]"end"
						end)

		self:OnHideDialogCall(--[[!AUTO_223]]"Win_Inventory", function () return self:Finish() end)
		self:DelayCall(10000, function() self:Finish() end)
		self:OnChangeMapCall(GameApi.GetSceneID(), function () return self:Finish() end)
	end

	function config:OnFinish ()
		HideHelpPetUI()
		HelpSystemApi.HideHelpUI(--[[!AUTO_224]]"Win_Inventory")
		HideTip(--[[!AUTO_225]]"Win_Inventory")
		HideTip(--[[!AUTO_226]]"Win_Main")
		HelpSystemApi.DetachUIGfx(--[[!AUTO_227]]"界面\\物品方框.gfx",--[[!AUTO_228]]"Win_Equipment",--[[!AUTO_229]]"Img_Pic1")
	end

	HelpSystem:SetHelpConfig(helpId, PLUN(config, --[[!AUTO_230]]"config[15]"))
end

do	--Config[16] 药品使用
	local helpId = 16
	local config = HelpConfig:new(helpId)

	function config:OnInit ()
		HelpConfig.OnInit(self)
		self:Register()
	end

	function config:Register ()
		self:OnFinishTaskCall(5210, function () return self:Activate(false) end, false)
	end

	function config:OnActivate ()
		SetInventoryItem(38506)
		ShowUITip(self.id, --[[!AUTO_231]]"Win_Main", --[[!AUTO_232]]"Btn_Inventory")
		self:OnShowDialogCall(--[[!AUTO_233]]"Win_Inventory", function () HideTip(--[[!AUTO_234]]"Win_Main") GetInventoryItem(--[[!AUTO_235]]"Win_Inventory", self.id, 30) end)
		self:OnUseQuestItem(38506,function () return self:Finish(true) end)
		self:OnHideDialogCall(--[[!AUTO_236]]"Win_Inventory", function () return self:Finish() end)
		self:DelayCall(10000, function() self:Finish() end)
	end

	function config:OnFinish ()
		HideTip(--[[!AUTO_237]]"Win_Inventory")
		HideTip(--[[!AUTO_238]]"Win_Main")
	end

	HelpSystem:SetHelpConfig(helpId, PLUN(config, --[[!AUTO_239]]"config[16]"))
end

do	--Config[17] 装备武器
	local helpId = 17
	local config = HelpConfig:new(helpId)

	function config:OnInit ()
		HelpConfig.OnInit(self)
		self:Register()
	end

	function config:Register ()
		local Skillid = {}
		Skillid[1] 	= 3698 	--少林
		Skillid[2] 	= 3699 	--武当
		Skillid[3] 	= 3700 	--华山
		Skillid[4] 	= 3701 	--恒山
		Skillid[5] 	= 3702 	--衡山
		Skillid[6] 	= 3703 	--日月
		Skillid[7] 	= 3704 	--五仙
		Skillid[8] 	= 3705  --逍遥
		Skillid[9] 	= 3706 	--唐门
		Skillid[10] = 3707	--峨眉
		self:OnObtainItemCall(nil,
		function (params)
			local ret = GameApi.GetPlayerFullProp(0)
			if Skillid[ret.prof] then
				if Skillid[ret.prof] == params.item_id then
					return self:Activate(false)
				end
			end
		end, true)
	end

	function config:OnActivate ()
		local ret = GameApi.GetPlayerFullProp(0)
		local Skillid = {}
		Skillid[1] 	= 3698 	--少林
		Skillid[2] 	= 3699 	--武当
		Skillid[3] 	= 3700 	--华山
		Skillid[4] 	= 3701 	--恒山
		Skillid[5] 	= 3702 	--衡山
		Skillid[6] 	= 3703 	--日月
		Skillid[7] 	= 3704 	--五仙
		Skillid[8] 	= 3705  --逍遥
		Skillid[9] 	= 3706 	--唐门
		Skillid[10] = 3707	--峨眉
		SetInventoryItem(Skillid[ret.prof])
		ShowUITip(self.id, --[[!AUTO_240]]"Win_Main", --[[!AUTO_241]]"Btn_Inventory")
		self:OnShowDialogCall(--[[!AUTO_242]]"Win_Inventory", function () HideTip(--[[!AUTO_243]]"Win_Main") GetInventoryItem(--[[!AUTO_244]]"Win_Inventory", self.id, 30) end)
		self:OnUseQuestItem(Skillid[ret.prof],
						function ()
							self:Finish(true)
							HideTip(--[[!AUTO_245]]"Win_Inventory")
							return --[[!AUTO_246]]"end"
						end)
		self:OnHideDialogCall(--[[!AUTO_247]]"Win_CharacterFrame",
		function ()

			return self:Finish()
		end)

		self:OnHideDialogCall(--[[!AUTO_248]]"Win_Inventory", function () return self:Finish() end)
		self:DelayCall(10000, function() self:Finish() end)
		self:OnChangeMapCall(GameApi.GetSceneID(), function () return self:Finish() end)
	end

	function config:OnFinish ()
		HideHelpPetUI()
		HideTip(--[[!AUTO_249]]"Win_Inventory")
		HideTip(--[[!AUTO_250]]"Win_Main")
		HideTip(--[[!AUTO_251]]"Win_FunctionBar")
	end

	HelpSystem:SetHelpConfig(helpId, PLUN(config, --[[!AUTO_252]]"config[17]"))
end

do	--Config[18] 门派展示选择指引
	local helpId = 18
	local config = HelpConfig:new(helpId)

	function config:OnInit ()
		HelpConfig.OnInit(self)
		self:Register()
	end

	function config:Register ()
		HelpConfig:OnFinishTaskCall(5363,
		function ()
			if HelpSystem.CurrentId then --如果当前有其他帮助则直接完成该帮助
				HelpSystem:ClearCurrentHelp()
			end
			return self:Activate(false)
		end, false)
	end

	function config:OnActivate ()
		HelpSystemApi.ShowHelpUI(--[[!AUTO_253]]"Help_EventList", -1, -120)
		HelpSystemApi.ShowHelpUI(--[[!AUTO_254]]"Help_ChooseMenPai", -30, -1)
		self:OnClickItemCall(--[[!AUTO_255]]"Help_ChooseMenPai", --[[!AUTO_256]]"Btn_Ok", function () self:Finish(true) end)
		self:OnHideDialogCall(--[[!AUTO_257]]"Help_ChooseMenPai", function () return self:Finish() end)
		self:OnChangeMapCall(GameApi.GetSceneID(), function () return self:Finish() end)
	end

	function config:OnFinish ()
	end

	HelpSystem:SetHelpConfig(helpId, PLUN(config, --[[!AUTO_258]]"config[18]"))
end

do	--Config[19]马具指引
	local helpId = 19
	local config = HelpConfig:new(helpId)
	local ObtainItem = 0

	function config:OnInit ()
		HelpConfig.OnInit(self)
		self:Register()
	end

	function config:Register ()
		self:OnObtainItemCall(nil,
			function (params)
				if params.item_id == 21865 or params.item_id == 73159 or params.item_id == 73160 or params.item_id == 73161 then
					ObtainItem = params.item_id
					return self:Activate()
				end
			end, false)
		if GameApi.HaveItem(21865) or GameApi.HaveItem(73159) or GameApi.HaveItem(73160) or GameApi.HaveItem(73161) then self:Activate() end
	end

	function config:OnActivate ()
		SetInventoryItem(ObtainItem)
		ShowUITip(self.id, --[[!AUTO_259]]"Win_Main", --[[!AUTO_260]]"Btn_Inventory")
		self:OnShowDialogCall(--[[!AUTO_261]]"Win_Inventory", function () HideTip(--[[!AUTO_262]]"Win_Main") GetInventoryItem(--[[!AUTO_263]]"Win_Inventory", self.id, 30) return --[[!AUTO_264]]"end" end)
		self:OnUseQuestItem(ObtainItem,
						function ()
							self:Finish(true)
							return --[[!AUTO_265]]"end"
						end)

		self:OnShowDialogCall(--[[!AUTO_266]]"Win_BindStatus", function () return self:Finish() end)
		self:OnHideDialogCall(--[[!AUTO_267]]"Win_Inventory", function () return self:Finish() end)
		self:DelayCall(30000, function() self:Finish() end)
		self:OnChangeMapCall(GameApi.GetSceneID(), function () return self:Finish() end)
	end

	function config:OnFinish ()
		HideTip(--[[!AUTO_268]]"Win_Main")
		HideTip(--[[!AUTO_269]]"Win_Inventory")
	end

	HelpSystem:SetHelpConfig(helpId, PLUN(config, --[[!AUTO_270]]"config[19]"))
end


do	--Config[20] 吸魂
	local helpId = 20
	local config = HelpConfig:new(helpId)

	function config:OnInit ()
		HelpConfig.OnInit(self)
		self:Register()
	end

	function config:Register ()
		self:OnMatterEnterCall(34597, function () self:Activate(false) end)
		self:OnMatterEnterCall(34815, function () self:Activate(false) end)
	end

	function config:OnActivate ()
		self:showHelpInterface(7)
		HelpSystemApi.AttachUIGfx(--[[!AUTO_271]]"界面\\教学特效\\调息使用.gfx",--[[!AUTO_272]]"Help_Title",--[[!AUTO_273]]"Img_Gfx", -1, -1)
		HelpSystem:RegisterDataEvent(
		function (params)
			if params.action == 60 then
				HelpSystemApi.DetachUIGfx(--[[!AUTO_274]]"界面\\教学特效\\调息使用.gfx",--[[!AUTO_275]]"Help_Title",--[[!AUTO_276]]"Img_Gfx")
				self:Finish(true)
				return --[[!AUTO_277]]"end"
			end
		end, DataEvent.DATA_PLAY_ACTION, nil)

		self:OnClickItemCall(--[[!AUTO_278]]"Help_Title", --[[!AUTO_279]]"Btn_ok", function () return self:Finish() end)
		self:DelayCall(10000, function() self:Finish() end)
		self:OnChangeMapCall(GameApi.GetSceneID(), function () return self:Finish() end)
	end

	function config:OnFinish ()
		HelpSystemApi.DetachUIGfx(--[[!AUTO_280]]"界面\\教学特效\\调息使用.gfx",--[[!AUTO_281]]"Help_Title",--[[!AUTO_282]]"Img_Gfx")
		HelpSystemApi.HideHelpUI(--[[!AUTO_283]]"Help_Title")
	end

	HelpSystem:SetHelpConfig(helpId, PLUN(config, --[[!AUTO_284]]"config[20]"))
end

do	--Config[21] 安全锁
	local helpId = 21
	local config = HelpConfig:new(helpId)

	function config:OnInit ()
		HelpConfig.OnInit(self)
		self:Register()
	end

	function config:Register ()
		HelpConfig:OnPlayerLevelUpCall (31, function () return self:Activate(false) end, false)
	end

	function config:OnActivate ()
		ShowUITip(self.id, --[[!AUTO_285]]"Win_MainInfoLeft", --[[!AUTO_286]]"Img_PKSetting")
		self:OnShowDialogCall(--[[!AUTO_287]]"Win_PKSetting",
		function ()
			self:Finish(true)
			return --[[!AUTO_288]]"end"
		end)

		self:DelayCall(5000, function() self:Finish(true) return --[[!AUTO_289]]"end" end)
		self:OnChangeMapCall(GameApi.GetSceneID(), function () return self:Finish() end)
	end

	function config:OnFinish ()
		HideTip(--[[!AUTO_290]]"Win_MainInfoLeft")
	end

	HelpSystem:SetHelpConfig(helpId, PLUN(config, --[[!AUTO_291]]"config[21]"))
end

do	--Config[22] 强化指引
	local helpId = 22
	local config = HelpConfig:new(helpId)

	function config:OnInit ()
		HelpConfig.OnInit(self)
		self:Register()
	end

	function config:Register ()
		if GameApi.GetPlayerFullProp(0).level >= 10 then
			self:OnObtainItemCall(63791, function () return self:Activate() end, false)
		end
	end

	function config:OnActivate ()
		ShowUITip(self.id, --[[!AUTO_292]]"Win_Main", --[[!AUTO_293]]"Btn_Inventory")

		self:OnShowDialogCall(--[[!AUTO_294]]"Win_Inventory",
		function ()
			HideTip(--[[!AUTO_295]]"Win_Main")
			ShowUITip(self.id, --[[!AUTO_296]]"Win_Inventory", --[[!AUTO_297]]"Btn_EquipCompose")
		end)

		self:OnShowDialogCall(--[[!AUTO_298]]"Win_EquipServ_Main",
		function ()
			HideTip(--[[!AUTO_299]]"Win_Inventory")
			ShowUITip(self.id, --[[!AUTO_300]]"Win_EquipServ_Main", --[[!AUTO_301]]"Chk_Sort1", 1)
		end)

		self:OnClickItemCall(--[[!AUTO_302]]"Win_EquipServ_Main", --[[!AUTO_303]]"Chk_Sort1",
		function ()
			HideTip(--[[!AUTO_304]]"Win_EquipServ_Main")
			ShowUITip(self.id, --[[!AUTO_305]]"Win_EquipServ_Main", --[[!AUTO_306]]"Rdo_SubSort1", 2)
		end)

		self:OnShowDialogCall(--[[!AUTO_307]]"Win_EquipServ_Compose",
		function ()
			HideTip(--[[!AUTO_308]]"Win_EquipServ_Main")
			ShowUITip(self.id, --[[!AUTO_309]]"Win_EquipServ_Main", --[[!AUTO_310]]"Rdo_SubSort1", 3)
			HelpSystem:RegisterDataEvent(
			function ()
				if GetHoverImage(--[[!AUTO_311]]"Win_EquipServ_Compose", --[[!AUTO_312]]"Img_Final") then
					HideTip(--[[!AUTO_313]]"Win_EquipServ_Main")
					ShowUITip(self.id, --[[!AUTO_314]]"Win_EquipServ_Compose", --[[!AUTO_315]]"Img_Equip3", 1)
					HelpSystem:RegisterDataEvent(
					function ()
						for i = 1, 5 do
							if GetHoverImage(--[[!AUTO_316]]"Win_EquipServ_Compose", --[[!AUTO_317]]"Img_Equip" .. i) then
								HideTip(--[[!AUTO_318]]"Win_EquipServ_Compose")
								ShowUITip(self.id, --[[!AUTO_319]]"Win_EquipServ_Compose", --[[!AUTO_320]]"Chk_UseUnbind", 3)
								self:OnClickItemCall(--[[!AUTO_321]]"Win_EquipServ_Compose", --[[!AUTO_322]]"Chk_UseUnbind",
								function ()
									HideTip(--[[!AUTO_323]]"Win_EquipServ_Compose")
									ShowUITip(self.id, --[[!AUTO_324]]"Win_EquipServ_Compose", --[[!AUTO_325]]"Btn_Ok", 2)
									self:OnClickItemCall(--[[!AUTO_326]]"Win_EquipServ_Compose", --[[!AUTO_327]]"Btn_Ok", function () return self:Finish(true) end)
									return --[[!AUTO_328]]"end"
								end)

								return --[[!AUTO_329]]"end"
							end
						end
					end, DataEvent.DATA_TIME)
					return --[[!AUTO_330]]"end"
				end
			end, DataEvent.DATA_TIME)

			self:OnHideDialogCall(--[[!AUTO_331]]"Win_EquipServ_Main", function () return self:Finish() end)
			self:DelayCall(30000, function() self:Finish() end)
			self:OnHideDialogCall(--[[!AUTO_332]]"Win_EquipServ_Compose", function () return self:Finish() end)
		end)
	end

	function config:OnFinish ()
		HideTip(--[[!AUTO_333]]"Win_EquipServ_Compose")
		HideTip(--[[!AUTO_334]]"Win_EquipServ_Main")
		HideTip(--[[!AUTO_335]]"Win_Main")
		HideTip(--[[!AUTO_336]]"Win_Inventory")
	end

	HelpSystem:SetHelpConfig(helpId, PLUN(config, --[[!AUTO_337]]"config[22]"))
end

--[[
do	--Config[23] 宝石指引
	local helpId = 23
	local config = HelpConfig:new(helpId)

	function config:OnInit ()
		HelpConfig.OnInit(self)
		self:Register()
	end

	function config:Register ()
		HelpConfig:OnFinishTaskCall(4554, function () return self:Activate(false) end, false)
	end

	function config:OnActivate ()
		ShowUITip(self.id, "Win_Main", "")
		self:OnShowDialogCall("Win_Inventory",
		function ()
			HideTip("Win_Main")
			ShowUITip(self.id, "Win_Inventory", "Btn_EquipCompose")
		end)

		self:OnShowDialogCall("Win_EquipServ_Main",
		function ()
			HideTip("Win_Inventory")
			ShowUITip(self.id, "Win_EquipServ_Main", "Chk_Sort2", 1)
		end)

		self:OnClickItemCall("Win_EquipServ_Main", "Chk_Sort2",
		function ()
			HideTip("Win_EquipServ_Main")
			ShowUITip(self.id, "Win_EquipServ_Main", "Rdo_SubSort5", 2)
		end)

		self:OnClickItemCall("Win_EquipServ_Main", "Rdo_SubSort5",
		function ()
			HideTip("Win_EquipServ_Main")
			ShowUITip(self.id, "Win_EquipServ_Main", "", 3)
			HelpSystem:RegisterDataEvent(
			function ()
				if GetHoverImage("Win_EquipServ_StoneCompose", "Img_Final") then
					HideTip("Win_EquipServ_Main")
					ShowUITip(self.id, "Win_EquipServ_StoneCompose", "", 1)
					HelpSystem:RegisterDataEvent(
					function ()
						for i = 1, 5 do
							if GetHoverImage("Win_EquipServ_StoneCompose", "Img_Equip" .. i) then
								HideTip("Win_EquipServ_StoneCompose")
								ShowUITip(self.id, "Win_EquipServ_StoneCompose", "", 2)
								self:OnClickItemCall("Win_EquipServ_StoneCompose", "Btn_Ok", function () return self:Finish(true) end)
								return "end"
							end
						end
					end, DataEvent.DATA_TIME)
					return "end"
				end
			end, DataEvent.DATA_TIME)

			self:OnHideDialogCall("Win_EquipServ_Main", function () return self:Finish() end)
			self:DelayCall(10000, function() self:Finish() end)
			self:OnHideDialogCall("Win_EquipServ_StoneCompose", function () return self:Finish() end)
		end)
	end

	function config:OnFinish ()
		HideTip("Win_EquipServ_Main")
		HideTip("Win_EquipServ_StoneCompose")
		HideTip("Win_Main")
		HideTip("Win_Inventory")
	end

	HelpSystem:SetHelpConfig(helpId, PLUN(config, "config[23]"))
end

do	--Config[24] 镶嵌指引
	local helpId = 24
	local config = HelpConfig:new(helpId)

	function config:OnInit ()
		HelpConfig.OnInit(self)
		self:Register()
	end

	function config:Register ()
		HelpConfig:OnFinishTaskCall(4611, function () return self:Activate(false) end, false)
	end

	function config:OnActivate ()
		ShowUITip(self.id, "Win_Main", "")
		self:OnShowDialogCall("Win_Inventory",
		function ()
			HideTip("Win_Main")
			ShowUITip(self.id, "Win_Inventory", "Btn_EquipCompose")
		end)

		self:OnShowDialogCall("Win_EquipServ_Main",
		function ()
			HideTip("Win_Inventory")
			ShowUITip(self.id, "Win_EquipServ_Main", "Chk_Sort2", 1)
		end)

		self:OnClickItemCall("Win_EquipServ_Main", "Chk_Sort2",
		function ()
			HideTip("Win_EquipServ_Main")
			ShowUITip(self.id, "Win_EquipServ_Main", "Rdo_SubSort3", 2)
		end)

		self:OnClickItemCall("Win_EquipServ_Main", "Rdo_SubSort3",
		function ()
			HideTip("Win_EquipServ_Main")
			ShowUITip(self.id, "Win_EquipServ_Main", "", 3)
			HelpSystem:RegisterDataEvent(
			function ()
				if GetHoverImage("Win_EquipServ_StoneAdd", "Img_Equip") then
					HideTip("Win_EquipServ_Main")
					ShowUITip(self.id, "Win_EquipServ_StoneAdd", "", 1)
					HelpSystem:RegisterDataEvent(
					function ()
						if GetHoverImage("Win_EquipServ_StoneAdd", "Img_Item") then
							HideTip("Win_EquipServ_StoneAdd")
							ShowUITip(self.id, "Win_EquipServ_StoneAdd", "", 2)
							self:OnClickItemCall("Win_EquipServ_StoneAdd", "Btn_Confirm", function () return self:Finish(true) end)
							return "end"
						end
					end, DataEvent.DATA_TIME)
					return "end"
				end
			end, DataEvent.DATA_TIME)
		end)

		self:DelayCall(10000, function() self:Finish() end)
	end

	function config:OnFinish ()
		HideTip("Win_EquipServ_StoneAdd")
		HideTip("Win_EquipServ_Main")
		HideTip("Win_Main")
		HideTip("Win_Inventory")
	end

	HelpSystem:SetHelpConfig(helpId, PLUN(config, "config[24]"))
end
--]]
do	--Config[25] hint 帮派物品使用
	local helpId = 25
	local config = HelpConfig:new(helpId)
	function config:OnInit ()
		HelpConfig.OnInit(self)
		self:Register()
		self.bArenaEnd = false
	end

	function config:Register ()
		self:OnObtainItemCall(55583, function () return self:Activate() end, true)
	end

	function config:OnActivate ()
		local ret = GameApi.GetPlayerFullProp(0)
		SetInventoryItem(55583)
		ShowUITip(self.id, --[[!AUTO_338]]"Win_Main", --[[!AUTO_339]]"Btn_Inventory")
		self:OnShowDialogCall(--[[!AUTO_340]]"Win_Inventory", function () HideTip(--[[!AUTO_341]]"Win_Main") GetInventoryItem(--[[!AUTO_342]]"Win_Inventory", self.id, 30) end)
		self:OnUseQuestItem(55583,function () self:Finish(true) end)
		self:OnHideDialogCall(--[[!AUTO_343]]"Win_Inventory", function () return self:Finish() end)
		self:OnChangeMapCall(GameApi.GetSceneID(), function () return self:Finish() end)
		self:DelayCall(10000, function() self:Finish() end)
	end

	function config:OnFinish ()
		HideHelpPetUI()
		HideTip(--[[!AUTO_344]]"Win_Main")
		HideTip(--[[!AUTO_345]]"Win_Inventory")
	end

	HelpSystem:SetHelpConfig(helpId, PLUN(config, --[[!AUTO_346]]"config[25]"))
end

do	--Config[26] hint 帮派物品使用
	local helpId = 26
	local config = HelpConfig:new(helpId)
	function config:OnInit ()
		HelpConfig.OnInit(self)
		self:Register()
		self.bArenaEnd = false
	end

	function config:Register ()
		self:OnNpcEnterCall(30066, function () return self:Activate(true) end, false)
	end

	function config:OnActivate ()
		local ret = GameApi.GetPlayerFullProp(0)
		SetInventoryItem(57335)
		ShowUITip(self.id, --[[!AUTO_347]]"Win_Main", --[[!AUTO_348]]"Btn_Inventory")
		self:OnShowDialogCall(--[[!AUTO_349]]"Win_Inventory", function () HideTip(--[[!AUTO_350]]"Win_Main") GetInventoryItem(--[[!AUTO_351]]"Win_Inventory", self.id, 30) end)
		self:OnUseQuestItem(57335,function () self:Finish(true) end)
		self:OnHideDialogCall(--[[!AUTO_352]]"Win_Inventory", function () return self:Finish() end)
		self:OnChangeMapCall(GameApi.GetSceneID(), function () return self:Finish() end)
		self:DelayCall(10000, function() self:Finish() end)
	end

	function config:OnFinish ()
		HideHelpPetUI()
		HideTip(--[[!AUTO_353]]"Win_Main")
		HideTip(--[[!AUTO_354]]"Win_Inventory")
	end

	HelpSystem:SetHelpConfig(helpId, PLUN(config, --[[!AUTO_355]]"config[26]"))
end

do	--Config[27] 帮派开启运镖指引
	local helpId = 27
	local config = HelpConfig:new(helpId)

	function config:OnInit ()
		HelpConfig.OnInit(self)
		self:Register()
	end

	function config:Register ()
		self:OnClickItemCall(--[[!AUTO_356]]"Win_FactionFrontPage", --[[!AUTO_357]]"Img_TaskIcon1",
		function ()
			if GameApi.GetHostFactionType() == 0 then
				return self:Activate(true)
			end
		end, false)
	end

	function config:OnActivate ()
		ShowUITip(self.id, --[[!AUTO_358]]"Win_FactionTaskGuideSub", --[[!AUTO_359]]"Txt_Location")
		self:OnChangeMapCall(GameApi.GetSceneID(), function () return self:Finish() end)
		self:OnHideDialogCall(--[[!AUTO_360]]"Win_FactionFrontPage", function () return self:Finish(true) end)
		HelpSystem:RegisterDataEvent(function () self:Finish() return --[[!AUTO_361]]"end" end,
		DataEvent.DATA_PLAY_ACTION, 22)
		self:DelayCall(10000, function() self:Finish() end)
	end

	function config:OnFinish ()
		HideTip(--[[!AUTO_362]]"Win_FactionTaskGuideSub")
	end

	HelpSystem:SetHelpConfig(helpId, PLUN(config, --[[!AUTO_363]]"config[27]"))
end

do	--Config[28] 帮派开启运镖指引
	local helpId = 28
	local config = HelpConfig:new(helpId)

	function config:OnInit ()
		HelpConfig.OnInit(self)
		self:Register()
	end

	function config:Register ()
		self:OnShowDialogCall(--[[!AUTO_364]]"Win_NPC",
		function ()
				if GameApi.GetHostFactionType() == 0 then
					if DlgApi.GetItemText (--[[!AUTO_365]]"Win_NPC", --[[!AUTO_366]]"Txt_npc") == --[[!AUTO_367]]"鏢行老闆" then
						HelpSystemApi.ShowHelpUI(--[[!AUTO_368]]"Help_kaiqiyunbiao", -1, -1)
						return self:Activate(true)
					end
				end
		end, false)
	end

	function config:OnActivate ()
		self:OnShowDialogCall(--[[!AUTO_369]]"Win_FactionSecurityChooseDest", function() HelpSystemApi.HideHelpUI(--[[!AUTO_370]]"Help_kaiqiyunbiao") HelpSystemApi.ShowHelpUI(--[[!AUTO_371]]"Help_yunbiaoluxian", -1, -1) end)
		self:OnShowDialogCall(--[[!AUTO_372]]"Win_FactionSecurityConfirm", function() HelpSystemApi.HideHelpUI(--[[!AUTO_373]]"Help_yunbiaoluxian") HelpSystemApi.ShowHelpUI(--[[!AUTO_374]]"Help_yunbiaoling", -1, -1) return self:Finish(true) end)
		self:OnHideDialogCall(--[[!AUTO_375]]"Win_FactionSecurityChooseDest", function () return self:Finish() end)
		self:OnChangeMapCall(GameApi.GetSceneID(), function () return self:Finish() end)
		self:DelayCall(10000, function() self:Finish() end)
	end

	function config:OnFinish ()
	end

	HelpSystem:SetHelpConfig(helpId, PLUN(config, --[[!AUTO_376]]"config[28]"))
end

do	--Config[29] 帮派开启运镖指引
	local helpId = 29
	local config = HelpConfig:new(helpId)

	function config:OnInit ()
		HelpConfig.OnInit(self)
		self:Register()
	end

	function config:Register ()
		self:OnEscrotStart(function(params)
				if params.type == 0 then
					return self:Activate(true)
				end
			end, false)
	end

	function config:OnActivate ()
		ShowUITip(self.id, --[[!AUTO_377]]"Win_FactionSecurityTrack", --[[!AUTO_378]]"Chk_HideOther")
		self:OnClickItemCall(--[[!AUTO_379]]"Win_FactionSecurityTrack", --[[!AUTO_380]]"Btn_Map",
		function()
			HideTip(--[[!AUTO_381]]"Win_FactionSecurityTrack")
			ShowUITip(self.id, --[[!AUTO_382]]"Win_MiniMap", --[[!AUTO_383]]"Btn_BigMap")
			self:OnShowDialogCall(--[[!AUTO_384]]"Win_WorldMapFrame", function() HideTip(--[[!AUTO_385]]"Win_MiniMap") return self:Finish(true) end)
		end)
		self:OnChangeMapCall(GameApi.GetSceneID(), function () return self:Finish() end)
		self:DelayCall(10000, function() self:Finish() end)
	end

	function config:OnFinish ()
		HelpSystemApi.ShowHelpUI(--[[!AUTO_386]]"Help_biaocheluxian", -1, -1)
	end

	HelpSystem:SetHelpConfig(helpId, PLUN(config, --[[!AUTO_387]]"config[29]"))
end

do	--Config[30] 脱离险境
	local helpId = 30
	local config = HelpConfig:new(helpId)

	function config:OnInit ()
		HelpConfig.OnInit(self)
		self:Register()
	end

	function config:Register ()
		self:OnEscrotTrap(function () return self:Activate(true) end, false)
	end

	function config:OnActivate ()
		HelpSystemApi.ShowHelpUI(--[[!AUTO_388]]"Help_tuolixianjing", -1, -1)
		self:OnHideDialogCall(--[[!AUTO_389]]"Help_tuolixianjing", function () return self:Finish(true) end)
		self:OnChangeMapCall(GameApi.GetSceneID(), function () return self:Finish() end)
		self:DelayCall(10000, function() self:Finish() end)
	end

	function config:OnFinish ()
	end

	HelpSystem:SetHelpConfig(helpId, PLUN(config, --[[!AUTO_390]]"config[30]"))
end

do	--Config[31] 进入陷阱
	local helpId = 31
	local config = HelpConfig:new(helpId)

	function config:OnInit ()
		HelpConfig.OnInit(self)
		self:Register()
	end

	function config:Register ()
		self:OnEscrotEscapeTrap(function () return self:Activate(true) end, false)
	end

	function config:OnActivate ()
		HelpSystemApi.ShowHelpUI(--[[!AUTO_391]]"Help_jinruxianjing", -1, -1)
		self:OnHideDialogCall(--[[!AUTO_392]]"Help_jinruxianjing", function () return self:Finish(true) end)
		self:OnChangeMapCall(GameApi.GetSceneID(), function () return self:Finish() end)
		self:DelayCall(10000, function() self:Finish() end)
	end

	function config:OnFinish ()
	end

	HelpSystem:SetHelpConfig(helpId, PLUN(config, --[[!AUTO_393]]"config[31]"))
end

do	--Config[32] 关于毒药
	local helpId = 32
	local config = HelpConfig:new(helpId)

	function config:OnInit ()
		HelpConfig.OnInit(self)
		self:Register()
	end

	function config:Register ()
		self:OnEscrotPoison(function () return self:Activate(true) end, false)
	end

	function config:OnActivate ()
		HelpSystemApi.ShowHelpUI(--[[!AUTO_394]]"Help_biaochezhongdu", -1, -1)
		self:OnHideDialogCall(--[[!AUTO_395]]"Help_biaochezhongdu", function () return self:Finish(true) end)
		self:OnChangeMapCall(GameApi.GetSceneID(), function () return self:Finish() end)
		self:DelayCall(10000, function() self:Finish() end)
	end

	function config:OnFinish ()
	end

	HelpSystem:SetHelpConfig(helpId, PLUN(config, --[[!AUTO_396]]"config[32]"))
end

do	--Config[33] 关于奇遇
	local helpId = 33
	local config = HelpConfig:new(helpId)

	function config:OnInit ()
		HelpConfig.OnInit(self)
		self:Register()
	end

	function config:Register ()
		self:OnEscrotAdventure(function () return self:Activate(true) end, false)
	end

	function config:OnActivate ()
		HelpSystemApi.ShowHelpUI(--[[!AUTO_397]]"Help_biaocheqiyu", -1, -1)
		self:OnHideDialogCall(--[[!AUTO_398]]"Help_biaocheqiyu", function () return self:Finish(true) end)
		self:OnChangeMapCall(GameApi.GetSceneID(), function () return self:Finish() end)
		self:DelayCall(10000, function() self:Finish() end)
	end

	function config:OnFinish ()
	end

	HelpSystem:SetHelpConfig(helpId, PLUN(config, --[[!AUTO_399]]"config[33]"))
end

do	--Config[34] 护送范围提醒
	local helpId = 34
	local config = HelpConfig:new(helpId)

	function config:OnInit ()
		HelpConfig.OnInit(self)
		self:Register()
	end

	function config:Register ()
		self:OnEscrotTooFar(function () return self:Activate(true) end, false)
	end

	function config:OnActivate ()
		Speak:OnClientSpeak(17099, 0, Speak.Cfg[17099].Content[1], 0, 0, 0)
		HelpSystem:RegisterDataEvent(function () self:Finish() return --[[!AUTO_400]]"end" end,
		DataEvent.DATA_PLAY_ACTION, 22)
		self:OnChangeMapCall(GameApi.GetSceneID(), function () return self:Finish() end)
		self:DelayCall(10000, function() self:Finish() end)
	end

	function config:OnFinish ()
	end

	HelpSystem:SetHelpConfig(helpId, PLUN(config, --[[!AUTO_401]]"config[34]"))
end


do	--Config[35] 到达目的地
	local helpId = 35
	local config = HelpConfig:new(helpId)

	function config:OnInit ()
		HelpConfig.OnInit(self)
		self:Register()
	end

	function config:Register ()
		self:OnEscrotFinish(function () return self:Activate(true) end, false)
	end

	function config:OnActivate ()
		HelpSystemApi.ShowHelpUI(--[[!AUTO_402]]"Help_yunbiaojiangli", -1, -1)
		self:OnHideDialogCall(--[[!AUTO_403]]"Help_yunbiaojiangli", function () return self:Finish(true) end)
		self:OnChangeMapCall(GameApi.GetSceneID(), function () return self:Finish() end)
		self:DelayCall(10000, function() self:Finish() end)
	end

	function config:OnFinish ()
	end

	HelpSystem:SetHelpConfig(helpId, PLUN(config, --[[!AUTO_404]]"config[35]"))
end

do	--Config[36] 帮派开启劫镖指引
	local helpId = 36
	local config = HelpConfig:new(helpId)

	function config:OnInit ()
		HelpConfig.OnInit(self)
		self:Register()
	end

	function config:Register ()
		self:OnClickItemCall(--[[!AUTO_405]]"Win_FactionFrontPage", --[[!AUTO_406]]"Img_TaskIcon1",
		function ()
			if GameApi.GetHostFactionType() == 2 then
				return self:Activate(true)
			end
		end, false)
	end

	function config:OnActivate ()
		ShowUITip(self.id, --[[!AUTO_407]]"Win_FactionTaskGuideSub", --[[!AUTO_408]]"Txt_Location")
		self:OnChangeMapCall(GameApi.GetSceneID(), function () return self:Finish() end)
		self:OnHideDialogCall(--[[!AUTO_409]]"Win_FactionFrontPage", function () return self:Finish(true) end)
		HelpSystem:RegisterDataEvent(function () self:Finish() return --[[!AUTO_410]]"end" end,
		DataEvent.DATA_PLAY_ACTION, 22)
		self:DelayCall(10000, function() self:Finish() end)
	end

	function config:OnFinish ()
		HideTip(--[[!AUTO_411]]"Win_FactionTaskGuideSub")
	end

	HelpSystem:SetHelpConfig(helpId, PLUN(config, --[[!AUTO_412]]"config[36]"))
end

do	--Config[37] 进入审讯室
	local helpId = 37
	local config = HelpConfig:new(helpId)

	function config:OnInit ()
		HelpConfig.OnInit(self)
		self:Register()
	end

	function config:Register ()
	--	self:DataEnterPrecinct(1028, 1028202, function () return self:Activate(true) end, false)
	end

	function config:OnActivate ()
		HelpSystemApi.ShowHelpUI(--[[!AUTO_413]]"Help_kaiqijiebiao", -1, -1)
		self:OnHideDialogCall(--[[!AUTO_414]]"Help_kaiqijiebiao", function () return self:Finish(true) end)
		self:OnChangeMapCall(GameApi.GetSceneID(), function () return self:Finish() end)
		self:DelayCall(10000, function() self:Finish() end)
	end

	function config:OnFinish ()
	end

	HelpSystem:SetHelpConfig(helpId, PLUN(config, --[[!AUTO_415]]"config[37]"))
end

do	--Config[38] 查看劫镖路线
	local helpId = 38
	local config = HelpConfig:new(helpId)

	function config:OnInit ()
		HelpConfig.OnInit(self)
		self:Register()
	end

	function config:Register ()
		self:OnEscrotRobStart(function(params)
			if params.type == 0 then
				return self:Activate(true)
			end
		end, false)
	end

	function config:OnActivate ()
		ShowUITip(self.id, --[[!AUTO_416]]"Win_TrackFrame", --[[!AUTO_417]]"Rdo_3")
		self:OnClickItemCall(--[[!AUTO_418]]"Win_FactionSecurityTrack", --[[!AUTO_419]]"Btn_Map",
		function()
			HideTip(--[[!AUTO_420]]"Win_FactionSecurityTrack")
			ShowUITip(self.id, --[[!AUTO_421]]"Win_MiniMap", --[[!AUTO_422]]"Btn_BigMap")
			self:OnShowDialogCall(--[[!AUTO_423]]"Win_WorldMapFrame", function() HideTip(--[[!AUTO_424]]"Win_MiniMap") return self:Finish(true) end)
		end)
		self:OnChangeMapCall(GameApi.GetSceneID(), function () return self:Finish() end)
		self:DelayCall(10000, function() self:Finish() end)
	end

	function config:OnFinish ()
		HelpSystemApi.ShowHelpUI(--[[!AUTO_425]]"Help_biaocheluxian", -1, -1)
	end

	HelpSystem:SetHelpConfig(helpId, PLUN(config, --[[!AUTO_426]]"config[38]"))
end

do	--Config[39] 接交任务标识指引
	local helpId = 39
	local config = HelpConfig:new(helpId)

	function config:OnInit ()
		HelpConfig.OnInit(self)
		self:Register()
	end

	function config:Register ()
		self:OnNpcEnterCall(nil,
		function (params)
			if GameApi.CanRobDartCarNPC(params.npc_id) then
				return self:Activate(true)
			end
		end, true)
	end

	function config:OnActivate ()
		HelpSystemApi.ShowHelpUI(--[[!AUTO_427]]"Help_jiebiaofangfa", -1, -1)
		self:OnHideDialogCall(--[[!AUTO_428]]"Help_jiebiaofangfa", function () return self:Finish(true) end)
		self:OnChangeMapCall(GameApi.GetSceneID(), function () return self:Finish() end)
		self:DelayCall(10000, function() self:Finish() end)
	end

	function config:OnFinish ()
	end

	HelpSystem:SetHelpConfig(helpId, PLUN(config, --[[!AUTO_429]]"config[39]"))
end

do	--Config[40]获得陷阱

	local helpId = 40
	local config = HelpConfig:new(helpId)

	function config:OnInit ()
		HelpConfig.OnInit(self)
		self:Register()
	end

	function config:Register ()
		local Itemid = {}
		Itemid[56286] 	= 0
		Itemid[56287] 	= 0
		Itemid[56288] 	= 0

		self:OnObtainItemCall(nil,
		function (params)
			if Itemid[params.item_id] then
				return self:Activate()
			end
		end, true)
	end

	function config:OnActivate ()
		HelpSystemApi.ShowHelpUI(--[[!AUTO_430]]"Help_guanyuxianjing", -1, -1)
		self:OnHideDialogCall(--[[!AUTO_431]]"Help_guanyuxianjing", function () return self:Finish(true) end)
		self:OnChangeMapCall(GameApi.GetSceneID(), function () return self:Finish() end)
		self:DelayCall(10000, function() self:Finish() end)
	end

	function config:OnFinish ()
	end

	HelpSystem:SetHelpConfig(helpId, PLUN(config, --[[!AUTO_432]]"config[40]"))
end

do	--Config[41]获得毒药

	local helpId = 41
	local config = HelpConfig:new(helpId)

	function config:OnInit ()
		HelpConfig.OnInit(self)
		self:Register()
	end

	function config:Register ()
		local Itemid = {}
		Itemid[56277] 	= 0
		Itemid[56278] 	= 0
		Itemid[56279] 	= 0
		Itemid[56280] 	= 0
		Itemid[56281] 	= 0
		Itemid[56282] 	= 0

		self:OnObtainItemCall(nil,
		function (params)
			if Itemid[params.item_id] then
				return self:Activate()
			end
		end, true)
	end

	function config:OnActivate ()
		HelpSystemApi.ShowHelpUI(--[[!AUTO_433]]"Help_guanyuduyao", -1, -1)
		self:OnHideDialogCall(--[[!AUTO_434]]"Help_guanyuduyao", function () return self:Finish(true) end)
		self:OnChangeMapCall(GameApi.GetSceneID(), function () return self:Finish() end)
		self:DelayCall(10000, function() self:Finish() end)
	end

	function config:OnFinish ()
	end

	HelpSystem:SetHelpConfig(helpId, PLUN(config, --[[!AUTO_435]]"config[41]"))
end

do	--Config[42]获得易容道具
	local helpId = 42
	local config = HelpConfig:new(helpId)

	function config:OnInit ()
		HelpConfig.OnInit(self)
		self:Register()
	end

	function config:Register ()
		local Itemid = {}
		Itemid[58690] 	= 0
		Itemid[58691] 	= 0
		Itemid[58692] 	= 0
		Itemid[58693] 	= 0
		Itemid[58694] 	= 0
		Itemid[58695] 	= 0
		Itemid[58696] 	= 0
		Itemid[58697] 	= 0
		Itemid[58698] 	= 0
		Itemid[58699] 	= 0

		self:OnObtainItemCall(nil,
		function (params)
			if Itemid[params.item_id] then
				return self:Activate()
			end
		end, true)
	end

	function config:OnActivate ()
		HelpSystemApi.ShowHelpUI(--[[!AUTO_436]]"Help_guanyuyirong", -1, -1)
		self:OnHideDialogCall(--[[!AUTO_437]]"Help_guanyuyirong", function () return self:Finish(true) end)
		self:OnChangeMapCall(GameApi.GetSceneID(), function () return self:Finish() end)
		self:DelayCall(10000, function() self:Finish() end)
	end

	function config:OnFinish ()
	end

	HelpSystem:SetHelpConfig(helpId, PLUN(config, --[[!AUTO_438]]"config[42]"))
end

do	--Config[43]获得镖货
	local helpId = 43
	local config = HelpConfig:new(helpId)

	function config:OnInit ()
		HelpConfig.OnInit(self)
		self:Register()
	end

	function config:Register ()
		local Itemid = {}
		Itemid[55778] 	= 0
		Itemid[55779] 	= 0
		Itemid[55780] 	= 0
		Itemid[55781] 	= 0
		Itemid[55782] 	= 0
		Itemid[55783] 	= 0
		Itemid[55784] 	= 0
		Itemid[55785] 	= 0
		Itemid[55786] 	= 0
		Itemid[55787] 	= 0

		self:OnObtainItemCall(nil,
		function (params)
			if Itemid[params.item_id] then
				return self:Activate()
			end
		end, true)
	end

	function config:OnActivate ()
		HelpSystemApi.ShowHelpUI(--[[!AUTO_439]]"Help_jiebiaojiangli", -1, -1)
		self:OnHideDialogCall(--[[!AUTO_440]]"Help_jiebiaojiangli", function () return self:Finish(true) end)
		self:OnChangeMapCall(GameApi.GetSceneID(), function () return self:Finish() end)
		self:DelayCall(10000, function() self:Finish() end)
	end

	function config:OnFinish ()
	end

	HelpSystem:SetHelpConfig(helpId, PLUN(config, --[[!AUTO_441]]"config[43]"))
end

do	--Config[44]易容美色

	local helpId = 44
	local config = HelpConfig:new(helpId)

	function config:OnInit ()
		HelpConfig.OnInit(self)
		self:Register()
	end

	function config:Register ()
		self:OnObtainItemCall(58690, function() return self:Activate() end, true)
	end

	function config:OnActivate ()
		HelpSystemApi.ShowHelpUI(--[[!AUTO_442]]"Help_meise", -1, -1)
		self:OnHideDialogCall(--[[!AUTO_443]]"Help_meise", function () return self:Finish(true) end)
		self:OnChangeMapCall(GameApi.GetSceneID(), function () return self:Finish() end)
		self:DelayCall(10000, function() self:Finish() end)
	end

	function config:OnFinish ()
	end

	HelpSystem:SetHelpConfig(helpId, PLUN(config, --[[!AUTO_444]]"config[44]"))
end

do	--Config[45]易容赌局

	local helpId = 45
	local config = HelpConfig:new(helpId)

	function config:OnInit ()
		HelpConfig.OnInit(self)
		self:Register()
	end

	function config:Register ()
		self:OnObtainItemCall(58691, function() return self:Activate() end, true)
	end

	function config:OnActivate ()
		HelpSystemApi.ShowHelpUI(--[[!AUTO_445]]"Help_duju", -1, -1)
		self:OnHideDialogCall(--[[!AUTO_446]]"Help_duju", function () return self:Finish(true) end)
		self:OnChangeMapCall(GameApi.GetSceneID(), function () return self:Finish() end)
		self:DelayCall(10000, function() self:Finish() end)
	end

	function config:OnFinish ()
	end

	HelpSystem:SetHelpConfig(helpId, PLUN(config, --[[!AUTO_447]]"config[45]"))
end

do	--Config[46]易容接头人

	local helpId = 46
	local config = HelpConfig:new(helpId)

	function config:OnInit ()
		HelpConfig.OnInit(self)
		self:Register()
	end

	function config:Register ()
		self:OnObtainItemCall(58692, function() return self:Activate() end, true)
	end

	function config:OnActivate ()
		HelpSystemApi.ShowHelpUI(--[[!AUTO_448]]"Help_jietouren", -1, -1)
		self:OnHideDialogCall(--[[!AUTO_449]]"Help_jietouren", function () return self:Finish(true) end)
		self:OnChangeMapCall(GameApi.GetSceneID(), function () return self:Finish() end)
		self:DelayCall(10000, function() self:Finish() end)
	end

	function config:OnFinish ()
	end

	HelpSystem:SetHelpConfig(helpId, PLUN(config, --[[!AUTO_450]]"config[46]"))
end

do	--Config[47]易容接头人

	local helpId =47
	local config = HelpConfig:new(helpId)

	function config:OnInit ()
		HelpConfig.OnInit(self)
		self:Register()
	end

	function config:Register ()
		self:OnObtainItemCall(58693, function() return self:Activate() end, true)
	end

	function config:OnActivate ()
		HelpSystemApi.ShowHelpUI(--[[!AUTO_451]]"Help_nanse", -1, -1)
		self:OnHideDialogCall(--[[!AUTO_452]]"Help_nanse", function () return self:Finish(true) end)
		self:OnChangeMapCall(GameApi.GetSceneID(), function () return self:Finish() end)
		self:DelayCall(10000, function() self:Finish() end)
	end

	function config:OnFinish ()
	end

	HelpSystem:SetHelpConfig(helpId, PLUN(config, --[[!AUTO_453]]"config[47]"))
end

do	--Config[48]易容接头人

	local helpId = 48
	local config = HelpConfig:new(helpId)

	function config:OnInit ()
		HelpConfig.OnInit(self)
		self:Register()
	end

	function config:Register ()
		self:OnObtainItemCall(58695, function() return self:Activate() end, true)
	end

	function config:OnActivate ()
		HelpSystemApi.ShowHelpUI(--[[!AUTO_454]]"Help_yiren", -1, -1)
		self:OnHideDialogCall(--[[!AUTO_455]]"Help_yiren", function () return self:Finish(true) end)
		self:OnChangeMapCall(GameApi.GetSceneID(), function () return self:Finish() end)
		self:DelayCall(10000, function() self:Finish() end)
	end

	function config:OnFinish ()
	end

	HelpSystem:SetHelpConfig(helpId, PLUN(config, --[[!AUTO_456]]"config[48]"))
end

do	--Config[49]易容赌徒

	local helpId = 49
	local config = HelpConfig:new(helpId)

	function config:OnInit ()
		HelpConfig.OnInit(self)
		self:Register()
	end

	function config:Register ()
		self:OnObtainItemCall(58696, function() return self:Activate() end, true)
	end

	function config:OnActivate ()
		HelpSystemApi.ShowHelpUI(--[[!AUTO_457]]"Help_dutu", -1, -1)
		self:OnHideDialogCall(--[[!AUTO_458]]"Help_dutu", function () return self:Finish(true) end)
		self:OnChangeMapCall(GameApi.GetSceneID(), function () return self:Finish() end)
		self:DelayCall(10000, function() self:Finish() end)
	end

	function config:OnFinish ()
	end

	HelpSystem:SetHelpConfig(helpId, PLUN(config, --[[!AUTO_459]]"config[49]"))
end

do	--Config[50]易容赌徒

	local helpId = 50
	local config = HelpConfig:new(helpId)

	function config:OnInit ()
		HelpConfig.OnInit(self)
		self:Register()
	end

	function config:Register ()
		self:OnObtainItemCall(58697, function() return self:Activate() end, true)
	end

	function config:OnActivate ()
		HelpSystemApi.ShowHelpUI(--[[!AUTO_460]]"Help_langzhong", -1, -1)
		self:OnHideDialogCall(--[[!AUTO_461]]"Help_langzhong", function () return self:Finish(true) end)
		self:OnChangeMapCall(GameApi.GetSceneID(), function () return self:Finish() end)
		self:DelayCall(10000, function() self:Finish() end)
	end

	function config:OnFinish ()
	end

	HelpSystem:SetHelpConfig(helpId, PLUN(config, --[[!AUTO_462]]"config[50]"))
end

do	--Config[51] 帮派开启运镖指引
	local helpId = 51
	local config = HelpConfig:new(helpId)

	function config:OnInit ()
		HelpConfig.OnInit(self)
		self:Register()
	end

	function config:Register ()
		self:OnEscrotStart(function(params)
			if params.type == 1 then
				return self:Activate(true)
			end
			end, false)
	end

	function config:OnActivate ()
		ShowUITip(self.id, --[[!AUTO_463]]"Win_FactionSecurityTrack", --[[!AUTO_464]]"Chk_HideOther")
		self:OnClickItemCall(--[[!AUTO_465]]"Win_FactionSecurityTrack", --[[!AUTO_466]]"Btn_Map",
		function()
			HideTip(--[[!AUTO_467]]"Win_FactionSecurityTrack")
			ShowUITip(self.id, --[[!AUTO_468]]"Win_MiniMap", --[[!AUTO_469]]"Btn_BigMap")
			self:OnShowDialogCall(--[[!AUTO_470]]"Win_WorldMapFrame", function() HideTip(--[[!AUTO_471]]"Win_MiniMap") return self:Finish(true) end)
		end)
		self:OnChangeMapCall(GameApi.GetSceneID(), function () return self:Finish() end)
		self:DelayCall(10000, function() self:Finish() end)
	end

	function config:OnFinish ()
		HelpSystemApi.ShowHelpUI(--[[!AUTO_472]]"Help_biaocheluxian", -1, -1)
	end

	HelpSystem:SetHelpConfig(helpId, PLUN(config, --[[!AUTO_473]]"config[51]"))
end

do	--Config[52] 查看劫镖打工路线
	local helpId = 52
	local config = HelpConfig:new(helpId)

	function config:OnInit ()
		HelpConfig.OnInit(self)
		self:Register()
	end

	function config:Register ()
		self:OnEscrotRobStart(function(params)
			if params.type == 1 then
				return self:Activate(true)
			end
		end, false)
	end

	function config:OnActivate ()
		ShowUITip(self.id, --[[!AUTO_474]]"Win_TrackFrame", --[[!AUTO_475]]"Rdo_3")
		self:OnClickItemCall(--[[!AUTO_476]]"Win_FactionSecurityTrack", --[[!AUTO_477]]"Btn_Map",
		function()
			HideTip(--[[!AUTO_478]]"Win_FactionSecurityTrack")
			ShowUITip(self.id, --[[!AUTO_479]]"Win_MiniMap", --[[!AUTO_480]]"Btn_BigMap")
			self:OnShowDialogCall(--[[!AUTO_481]]"Win_WorldMapFrame", function() HideTip(--[[!AUTO_482]]"Win_MiniMap") return self:Finish(true) end)
		end)
		self:OnChangeMapCall(GameApi.GetSceneID(), function () return self:Finish() end)
		self:DelayCall(10000, function() self:Finish() end)
	end

	function config:OnFinish ()
		HelpSystemApi.ShowHelpUI(--[[!AUTO_483]]"Help_biaocheluxian", -1, -1)
	end

	HelpSystem:SetHelpConfig(helpId, PLUN(config, --[[!AUTO_484]]"config[52]"))
end

-- 右上角副本(37)、活动(38)、竞技场(39)应用开启帮助 by xiangnan

do	--Config[53] hint 副本开启
	local helpId = 53
	local config = HelpConfig:new(helpId)

	function config:OnInit ()
		HelpConfig.OnInit(self)
		self:Register()
	end

	function config:Register ()
		self:OnGainAchievement (354, function () return self:Activate(false) end, false)
	end

	function config:OnActivate ()
		ShowUITip(self.id, --[[!AUTO_485]]"Win_BattleFieldEnter", --[[!AUTO_486]]"Btn_Instance")
		self:OnShowDialogCall (--[[!AUTO_487]]"Win_InstanceList", function ()
			ShowUITip(self.id, --[[!AUTO_488]]"Win_InstanceListSub1", --[[!AUTO_489]]"Btn_Instance1")
		end)
		self:OnShowDialogCall (--[[!AUTO_490]]"Win_InstanceDesc", function ()
			ShowUITip(self.id, --[[!AUTO_491]]"Win_InstanceList", --[[!AUTO_492]]"Btn_Close")
		end)
		self:OnHideDialogCall (--[[!AUTO_493]]"Win_InstanceList", function () return self:Finish(false) end)
		self:OnClickItemCall (--[[!AUTO_494]]"Win_InstanceDesc", --[[!AUTO_495]]"Btn_CreateTeam", function () return self:Finish(false) end)
		self:OnClickItemCall (--[[!AUTO_496]]"Win_InstanceDesc", --[[!AUTO_497]]"Btn_Join", function () return self:Finish(false) end)
		self:OnClickItemCall (--[[!AUTO_498]]"Win_InstanceDesc", --[[!AUTO_499]]"Btn_Enter", function () return self:Finish(false) end)
		self:OnEnterScene (nil, function () return self:Finish(false) end)
		self:DelayCall(10000, function() self:Finish() end)
	end

	function config:OnFinish ()
		HideTip(--[[!AUTO_500]]"Win_BattleFieldEnter")
		HideTip(--[[!AUTO_501]]"Win_InstanceListSub1")
		HideTip(--[[!AUTO_502]]"Win_InstanceList")
	end

	HelpSystem:SetHelpConfig(helpId, PLUN(config, --[[!AUTO_503]]"config_"..helpId))
end

do	--Config[54] 跨服活动指引
	local helpId = 54
	local config = HelpConfig:new(helpId)
	function config:OnInit ()
		HelpConfig.OnInit(self)
		self:Register()
		self.bArenaEnd = false
	end

	function config:Register ()
		if not GameApi.HasEverFinishedActivity(1) then
			if GameApi.GetPlayerFullProp(0).level >= 35 then
				return self:Activate()
			end
		end
		self:DATAACTIVITYOPEN(3541,
		function ()
			local ret = GameApi.GetPlayerFullProp(0)
			if ret.level >= 35 then
				return self:Activate()
			end
		end, true)
	end

	function config:OnActivate ()
		ShowUITip(self.id, --[[!AUTO_504]]"Win_BattleFieldEnter", --[[!AUTO_505]]"Btn_Activity")
		self:OnShowDialogCall(--[[!AUTO_506]]"Win_DailyActivity", function () return self:Finish(true) end)
		self:OnChangeMapCall(GameApi.GetSceneID(), function () return self:Finish() end)
		self:DelayCall(30000, function() self:Finish() end)
	end

	function config:OnFinish ()
		HideTip(--[[!AUTO_507]]"Win_BattleFieldEnter")
	end

	HelpSystem:SetHelpConfig(helpId, PLUN(config, --[[!AUTO_508]]"config[54]"))
end

do	--Config[55] 张濡心临时指引
	local helpId = 55
	local config = HelpConfig:new(helpId)

	function config:OnInit ()
		HelpConfig.OnInit(self)
		self:Register()
	end

	function config:Register ()
		self:OnObtainItemCall(36730, function() return self:Activate() end, true)
	end

	function config:OnActivate ()
		SetInventoryItem(36730)
		ShowUITip(self.id, --[[!AUTO_509]]"Win_Main", --[[!AUTO_510]]"Btn_Inventory")
		self:OnShowDialogCall(--[[!AUTO_511]]"Win_Inventory", function () HideTip(--[[!AUTO_512]]"Win_Main") GetInventoryItem(--[[!AUTO_513]]"Win_Inventory", self.id, 30) end)
		self:OnUseQuestItem(36730, function () return self:Finish(true) end)
		self:OnHideDialogCall(--[[!AUTO_514]]"Win_Inventory", function () return self:Finish() end)
		self:DelayCall(20000, function() self:Finish() end)
	end

	function config:OnFinish ()
		HelpSystemApi.HideHelpUI(--[[!AUTO_515]]"Win_Inventory")
		HideTip(--[[!AUTO_516]]"Win_Inventory")
		HideTip(--[[!AUTO_517]]"Win_Main")
	end

	HelpSystem:SetHelpConfig(helpId, PLUN(config, --[[!AUTO_518]]"config[55]"))
end

do	--Config[56] 张濡心临时指引
	local helpId = 56
	local config = HelpConfig:new(helpId)

	function config:OnInit ()
		HelpConfig.OnInit(self)
		self:Register()
	end

	function config:Register ()
		self:OnObtainItemCall(57562, function() return self:Activate() end, true)
	end

	function config:OnActivate ()
		SetInventoryItem(57562)
		ShowUITip(self.id, --[[!AUTO_519]]"Win_Main", --[[!AUTO_520]]"Btn_Inventory")
		self:OnShowDialogCall(--[[!AUTO_521]]"Win_Inventory", function () HideTip(--[[!AUTO_522]]"Win_Main") GetInventoryItem(--[[!AUTO_523]]"Win_Inventory", self.id, 30) end)
		self:OnUseQuestItem(57562,function () return self:Finish(true) end)
		self:OnHideDialogCall(--[[!AUTO_524]]"Win_Inventory", function () return self:Finish() end)
		self:DelayCall(20000, function() self:Finish() end)
	end

	function config:OnFinish ()
		HelpSystemApi.HideHelpUI(--[[!AUTO_525]]"Win_Inventory")
		HideTip(--[[!AUTO_526]]"Win_Inventory")
		HideTip(--[[!AUTO_527]]"Win_Main")
	end

	HelpSystem:SetHelpConfig(helpId, PLUN(config, --[[!AUTO_528]]"config[56]"))
end

do	--Config[57] 双倍经验指引
	local helpId = 57
	local config = HelpConfig:new(helpId)

	function config:OnInit ()
		HelpConfig.OnInit(self)
		self:Register()
	end

	function config:Register ()
		HelpConfig:OnPlayerLevelUpCall (21, function () return self:Activate(false) end, false)
	end

	function config:OnActivate ()
		ShowUITip(self.id, --[[!AUTO_529]]"Win_MainInfoMiddle", --[[!AUTO_530]]"Img_ExpIcon")
		self:OnClickItemCall (--[[!AUTO_531]]"Win_MainInfoMiddle", --[[!AUTO_532]]"Img_ExpIcon", function () return self:Finish(true) end)
		self:OnChangeMapCall(GameApi.GetSceneID(), function () return self:Finish() end)
		self:DelayCall(30000, function() self:Finish() end)
	end

	function config:OnFinish ()
		HideTip(--[[!AUTO_533]]"Win_MainInfoMiddle")
	end

	HelpSystem:SetHelpConfig(helpId, PLUN(config, --[[!AUTO_534]]"config[57]"))
end
-- 临时, 华山10级教学 32 ～ 34 by xugang

--Help_TextTip, 小界面
local function ShowTextTip (helpId, index, prof)
	HelpSystem:ShowHelpUI(--[[!AUTO_535]]"Help_TextTip", -1, 30)
	Help_TextTip:SetContent(helpId, index, prof)
end

local function HideTextTip (helpId, index, prof)
	if Help_TextTip and Help_TextTip:MatchContent(helpId, index, prof) then
		HelpSystem:HideHelpUI(--[[!AUTO_536]]"Help_TextTip")
	end
end

local function HideAnyTextTip ()
	HelpSystem:HideHelpUI(--[[!AUTO_537]]"Help_TextTip")
end

--Help_TextInfo, 大界面
local function ShowTextInfo (helpId, index, prof)
	HelpSystem:ShowHelpUI(--[[!AUTO_538]]"Help_TextInfo", -1, -1)
	Help_TextInfo:SetContent(helpId, index, prof)
end

local function HideTextInfo (helpId, index, prof)
	if Help_TextInfo and Help_TextInfo:MatchContent(helpId, index, prof) then
		HelpSystem:HideHelpUI(--[[!AUTO_539]]"Help_TextInfo")
	end
end

local function HideAnyTextInfo ()
	HelpSystem:HideHelpUI(--[[!AUTO_540]]"Help_TextInfo")
end

do	--Config[70] 专精教学Lv10_加速跑
	local helpId = 70
	local config = HelpConfig:new(helpId)

	local repetitionId = {
							[1] = {3001, {3, 4}},		--专精教学少林10级
							[2] = {3003, {3, 4}},		--专精教学武当10级
							[3] = {2484, {1, 5}},		--专精教学华山10级
							[4] = {2651, {3, 4}},		--专精教学恒山10级
							[5] = {3303, {3, 4}},		--专精教学衡山10级
							[6] = {2571, {12, 4}},		--专精教学日月10级
							[7] = {3305, {3, 4}},		--专精教学五仙10级
							[8] = {3005, {3, 4}},		--专精教学逍遥10级
							[9] = {2649, {3, 4}},		--专精教学唐门10级
							[10] = {3307, {3, 4}},		--专精教学峨眉10级
						}

	function config:OnInit ()
		HelpConfig.OnInit(self)
		self:Register()
	end

	function config:Register ()
		local ret = GameApi.GetPlayerFullProp(0)
		for prof=1, #repetitionId do
			self:OnBoardFinish(repetitionId[prof][1], repetitionId[prof][2][1], function ()
				if prof == GameApi.GetPlayerFullProp(0).prof then
					self:Activate()
				end
			end)

		end
	end

	function config:OnActivate ()
		local ret = GameApi.GetPlayerFullProp(0)
		HelpSystem:ShowHelpUI(--[[!AUTO_541]]"Help_Dash", -1, -1)
		self:OnAccRun(function () self:Finish(true) end)				--加速跑，成功
		self:OnBoardFinish(repetitionId[ret.prof][1], repetitionId[ret.prof][2][2], function () self:Finish(false) end)	--强制结束
	end
	function config:OnFinish ()
		HelpSystem:HideHelpUI(--[[!AUTO_542]]"Help_Dash")
	end

	HelpSystem:SetHelpConfig(helpId, PLUN(config, --[[!AUTO_543]]"config_"..helpId))
end

do	--Config[71] 专精教学Lv10_闪避
	local helpId = 71
	local config = HelpConfig:new(helpId)
	local repetitionId = {


							[1] = {3001, {5, 6}},		--专精教学少林10级
							[2] = {3003, {5, 6}},		--专精教学武当10级
							[3] = {2484, {6, 7}},		--专精教学华山10级
							[4] = {2651, {5, 6}},		--专精教学恒山10级
							[5] = {3303, {14, 6}},		--专精教学衡山10级
							[6] = {2571, {5, 6}},		--专精教学日月10级
							[7] = {3305, {5, 6}},		--专精教学五仙10级
							[8] = {3005, {5, 6}},		--专精教学逍遥10级
							[9] = {2649, {5, 6}},		--专精教学唐门10级
							[10] = {3307, {5, 6}},		--专精教学峨眉10级
						 }

	function config:OnInit ()
		HelpConfig.OnInit(self)
		self:Register()
	end

	function config:Register ()
		local ret = GameApi.GetPlayerFullProp(0)
		for prof=1, #repetitionId do
			self:OnBoardFinish(repetitionId[prof][1], repetitionId[prof][2][1], function ()
				if prof == GameApi.GetPlayerFullProp(0).prof then
					self:Activate()
				end
			end)

		end
	end

	function config:OnActivate ()
		local ret = GameApi.GetPlayerFullProp(0)
		HelpSystem:ShowHelpUI(--[[!AUTO_544]]"Help_Dodge", -1, -1)
		self:OnUseSkillCall(23, function () self:Finish(true) end)				--成功
		self:OnUseSkillCall(24, function () self:Finish(true) end)				--成功
		self:OnUseSkillCall(25, function () self:Finish(true) end)				--成功
		self:OnUseSkillCall(26, function () self:Finish(true) end)				--成功
		self:OnBoardFinish(repetitionId[ret.prof][1], repetitionId[ret.prof][2][2], function () self:Finish(false) end)	--强制结束
	end
	function config:OnFinish ()
		HelpSystem:HideHelpUI(--[[!AUTO_545]]"Help_Dodge")
	end

	HelpSystem:SetHelpConfig(helpId, PLUN(config, --[[!AUTO_546]]"config_"..helpId))
end

do	--Config[72] 专精教学Lv10_试用技能
	local helpId = 72
	local config = HelpConfig:new(helpId)


	local repetitionId = {
							[1] = {3001, {7, 8, 8, 9, 11}},		--专精教学少林10级
							[2] = {3003, {7, 8, 8, 9, 10}},		--专精教学武当10级
							[3] = {2484, {8, 4, 4, 9, 3}},		--专精教学华山10级
							[4] = {2651, {7, 8, 8, 9, 10}},		--专精教学恒山10级
							[5] = {3303, {7, 8, 10, 11, 12}},		--专精教学衡山10级
							[6] = {2571, {7, 8, 8, 9, 10}},		--专精教学日月10级
							[7] = {3305, {7, 8, 8, 9, 10}},		--专精教学五仙10级
							[8] = {3005, {7, 8, 8, 9, 10}},		--专精教学逍遥10级
							[9] = {2649, {7, 8, 8, 9, 10}},		--专精教学唐门10级
							[10] = {3307, {7, 8, 8, 9, 10}},		--专精教学峨眉10级
		                 }


	function config:OnInit ()
		HelpConfig.OnInit(self)
		self:Register()
	end

	function config:Register ()
		local ret = GameApi.GetPlayerFullProp(0)
		for prof=1, #repetitionId do
			self:OnBoardFinish(repetitionId[prof][1], repetitionId[prof][2][1], function ()
				if prof == GameApi.GetPlayerFullProp(0).prof then
					self:Activate()
				end
			end)

		end
	end

	function config:CloseAllUI ()
		HelpSystem:HideHelpUI(--[[!AUTO_547]]"Help_Huashan10_Intro")
		HideAnyTextTip()
		HideAnyTextInfo()
	end

	function config:OnActivate ()
		HelpSystem:ShowHelpUI(--[[!AUTO_548]]"Help_Huashan10_Intro", -1, -1)	--介绍
		local ret = GameApi.GetPlayerFullProp(0)
--~ 		if repetitionId[ret.prof] then
--~ 			self:OnBoardChange(repetitionId[ret.prof][1], repetitionId[ret.prof][2][2], function ()		--第一套
--~ 				self:CloseAllUI()
--~ 				ShowTextTip(self.id, "set1", ret.prof)

--~ 				self:DelayCall(0, function()		--临时0秒关闭
--~ 					HideTextTip(self.id, "set1", ret.prof)
--~ 				end)
--~ 			end)
--~ 		end
--~ 		if repetitionId[ret.prof] then
--~ 			self:OnBoardFinish(repetitionId[ret.prof][1], repetitionId[ret.prof][2][3], function ()		--第二套
--~ 				self:CloseAllUI()
--~ 				ShowTextTip(self.id, "set2", ret.prof)

--~ 				self:DelayCall(0, function()		--临时0秒关闭
--~ 					HideTextTip(self.id, "set2", ret.prof)
--~ 				end)
--~ 			end)
--~ 		end
--~ 		if repetitionId[ret.prof] then
--~ 			self:OnBoardFinish(repetitionId[ret.prof][1], repetitionId[ret.prof][2][4], function ()		--第三套
--~ 				self:CloseAllUI()
--~ 				ShowTextTip(self.id, "set3", ret.prof)

--~ 				self:DelayCall(0, function()		--临时0秒关闭
--~ 					HideTextTip(self.id, "set3", ret.prof)
--~ 				end)
--~ 			end)
--~ 		end
		if repetitionId[ret.prof] then
			self:OnBoardFinish(repetitionId[ret.prof][1], repetitionId[ret.prof][2][5], function ()		--完成
				self:CloseAllUI()
				ShowTextInfo(self.id, --[[!AUTO_549]]"finish", ret.prof)

				self:DelayCall(20000, function()		--20秒后自动关闭
					self:Finish(false)
				end)
			end)
		end
		self:OnHideDialogCall(--[[!AUTO_550]]"Help_TextInfo", function ()
			local ret = GameApi.GetPlayerFullProp(0)
			if Help_TextInfo:MatchContent(self.id, --[[!AUTO_551]]"finish", ret.prof) then
				self:Finish(true)
				return --[[!AUTO_552]]"end"
			end
		end, true)
	end

	function config:OnFinish ()
		self:CloseAllUI()
	end

	HelpSystem:SetHelpConfig(helpId, PLUN(config, --[[!AUTO_553]]"config_"..helpId))
end

-- 临时, 华山20级教学 35 ～ 36 by xugang

do	--Config[73] 专精教学Lv20_格挡
	local helpId = 73
	local config = HelpConfig:new(helpId)

	local repetitionId = {
							[1] = {3002, {5, 6}},	--专精教学少林20级
							[2] = {3004, {3, 4}},	--专精教学武当20级
							[3] = {2535, {1, 3}},	--专精教学华山20级
							[4] = {2652, {3, 4}},	--专精教学恒山20级
							[5] = {3304, {3, 4}},	--专精教学衡山20级
							[6] = {2572, {9, 4}},	--专精教学日月20级
							[7] = {3306, {4, 5}},	--专精教学五仙20级
							[8] = {3005, {3, 4}},	--专精教学逍遥20级
							[9] = {2650, {3, 4}},	--专精教学唐门20级
							[10] = {3308, {3, 4}},	--专精教学峨眉20级
						 }

	function config:OnInit ()
		HelpConfig.OnInit(self)
		self:Register()
	end

	function config:Register ()
		local ret = GameApi.GetPlayerFullProp(0)
		for prof=1, #repetitionId do
			self:OnBoardFinish(repetitionId[prof][1], repetitionId[prof][2][1], function ()
				if prof == GameApi.GetPlayerFullProp(0).prof then
					self:Activate()
				end
			end)

		end
	end

	function config:OnActivate ()
		HelpSystem:ShowHelpUI(--[[!AUTO_554]]"Help_Block", -1, -1)
		local ret = GameApi.GetPlayerFullProp(0)
		self:OnUseSkillCall(3591, function () self:Finish(true) end)			--使用格挡, 成功
		self:OnBoardFinish(repetitionId[ret.prof][1], repetitionId[ret.prof][2][2],
			function () self:Finish(false)	--强制结束
			HelpSystem:ActivateHelp(36)		--与下一帮助的开启条件相同，保证时序
		end)
	end

	function config:OnFinish ()
		HelpSystem:HideHelpUI(--[[!AUTO_555]]"Help_Block")
	end

	HelpSystem:SetHelpConfig(helpId, PLUN(config, --[[!AUTO_556]]"config_"..helpId))
end

do	--Config[74] 专精教学Lv20_试用技能
	local helpId = 74
	local config = HelpConfig:new(helpId)

	local repetitionId = {
							[1] = {3002, {8, 9, 10, 13, 12}},		--专精教学少林20级
							[2] = {3004, {5, 6, 6, 7, 8}},		--专精教学武当20级
							[3] = {2535, {3, 4, 5, 6, 6}},		--专精教学华山20级
							[4] = {2652, {5, 6, 7, 8, 8}},		--专精教学恒山20级
							[5] = {3304, {5, 6, 7, 8, 9}},		--专精教学衡山20级
							[6] = {2572, {5, 6, 7, 8, 8}},		--专精教学日月20级
							[7] = {3306, {6, 7, 9, 10, 11}},		--专精教学五仙20级
							[8] = {3005, {5, 6, 6, 7, 8}},		--专精教学逍遥20级
							[9] = {2650, {5, 6, 6, 7, 8}},		--专精教学唐门20级
							[10] = {3308, {5, 6, 7, 8, 8}},		--专精教学峨眉20级
						}

	function config:OnInit ()
		HelpConfig.OnInit(self)
		self:Register()
	end

	function config:Register ()
		local ret = GameApi.GetPlayerFullProp(0)
		for prof=1, #repetitionId do
			self:OnBoardFinish(repetitionId[prof][1], repetitionId[prof][2][1], function ()
				if prof == GameApi.GetPlayerFullProp(0).prof then
					self:Activate()
				end
			end)

		end
	end

	function config:CloseAllUI ()
		HelpSystem:HideHelpUI(--[[!AUTO_557]]"Help_Huashan20_Intro")
	end

	function config:OnActivate ()
		HelpSystem:ShowHelpUI(--[[!AUTO_558]]"Help_Huashan20_Intro", -1, -1)	--介绍
		local ret = GameApi.GetPlayerFullProp(0)
--~ 		if repetitionId[ret.prof] then
--~ 			self:OnBoardChange(repetitionId[ret.prof][1], repetitionId[ret.prof][2][2], function ()		--第一套
--~ 				self:CloseAllUI()
--~ 				ShowTextTip(self.id, "set1", ret.prof)

--~ 				self:DelayCall(0, function()		--临时0秒关闭
--~ 					HideTextTip(self.id, "set1", ret.prof)
--~ 				end)
--~ 			end)
--~ 		end
--~ 		if repetitionId[ret.prof] then
--~ 			self:OnBoardChange(repetitionId[ret.prof][1], repetitionId[ret.prof][2][3], function ()		--第二套
--~ 				self:CloseAllUI()
--~ 				ShowTextTip(self.id, "set2", ret.prof)

--~ 				self:DelayCall(0, function()		--临时0秒关闭
--~ 					HideTextTip(self.id, "set2", ret.prof)
--~ 				end)
--~ 			end)
--~ 		end
--~ 		if repetitionId[ret.prof] then
--~ 			self:OnBoardChange(repetitionId[ret.prof][1], repetitionId[ret.prof][2][4], function ()		--第三套
--~ 				self:CloseAllUI()
--~ 				ShowTextTip(self.id, "set3", ret.prof)

--~ 				self:DelayCall(0, function()		--临时0秒关闭
--~ 					HideTextTip(self.id, "set3", ret.prof)
--~ 				end)
--~ 			end)
--~ 		end
		if repetitionId[ret.prof] then
			self:OnBoardFinish(repetitionId[ret.prof][1], repetitionId[ret.prof][2][5], function ()		--完成
				self:CloseAllUI()
				ShowTextInfo(self.id, --[[!AUTO_559]]"finish", ret.prof)

				self:DelayCall(20000, function()		--20秒后自动关闭
					self:Finish(false)
				end)
			end)
		end
		self:OnHideDialogCall(--[[!AUTO_560]]"Help_TextInfo", function ()
			local ret = GameApi.GetPlayerFullProp(0)
			if Help_TextInfo:MatchContent(self.id, --[[!AUTO_561]]"finish", ret.prof) then
				self:Finish(true)
				return --[[!AUTO_562]]"end"
			end
		end, true)

		self:OnHideDialogCall(--[[!AUTO_563]]"Help_TrySkill_Finish", function () self:Finish(true) end)
	end

	function config:OnFinish ()
		self:CloseAllUI()
	end

	HelpSystem:SetHelpConfig(helpId, PLUN(config, --[[!AUTO_564]]"config_"..helpId))
end

do	--Config[75] 帮派加持指引
	local helpId = 75
	local config = HelpConfig:new(helpId)

	function config:OnInit ()
		HelpConfig.OnInit(self)
		self:Register()
	end

	function config:Register ()
		HelpConfig:OnReputation(23,
		function (params)
			if params.new_value >= 23 then
				return self:Activate(false)
			end
		end,
		false)
	end

	function config:OnActivate ()
		ShowUITip(self.id, --[[!AUTO_565]]"Win_Main", --[[!AUTO_566]]"Btn_Social")
		self:OnShowDialogCall(--[[!AUTO_567]]"Win_FactionMain", function () ShowUITip(self.id, --[[!AUTO_568]]"Win_FactionMain", --[[!AUTO_569]]"Btn_FactionJiaChi") end)
		self:OnClickItemCall (--[[!AUTO_570]]"Win_FactionMain", --[[!AUTO_571]]"Btn_FactionJiaChi", function () return self:Finish(true) end)
		self:DelayCall(60000, function() self:Finish() end)
	end

	function config:OnFinish ()
		HideTip(--[[!AUTO_572]]"Win_FactionMain")
		HideTip(--[[!AUTO_573]]"Win_Main")
	end

	HelpSystem:SetHelpConfig(helpId, PLUN(config, --[[!AUTO_574]]"config[75]"))
end

do	--Config[76] 加入帮派
	local helpId = 76
	local config = HelpConfig:new(helpId)

	function config:OnInit ()
		HelpConfig.OnInit(self)
		self:Register()
	end

	function config:Register ()
		HelpConfig:OnPlayerLevelUpCall (20, function () return self:Activate(false) end, false)
	end

	function config:OnActivate ()
		DlgApi.ShowDialog(--[[!AUTO_575]]"Win_HelpList", true)
		Win_HelpList:ShowSelectHelpMsg(1, 0, 1)
		self:Finish(true)
	end

	function config:OnFinish ()
	end

	HelpSystem:SetHelpConfig(helpId, PLUN(config, --[[!AUTO_576]]"config[76]"))
end

do	--Config[77] 申请入帮
	local helpId = 77
	local config = HelpConfig:new(helpId)

	function config:OnInit ()
		HelpConfig.OnInit(self)
		self:Register()
	end

	function config:Register ()
		self:OnShowDialogCall(--[[!AUTO_577]]"Win_FactionMain",
		function ()
			if GameApi.GetHostFactionType() == -1 then
				return self:Activate(false)
			end
		end, false)
	end

	function config:OnActivate ()
		ShowUITip(self.id, --[[!AUTO_578]]"Win_FactionMain", --[[!AUTO_579]]"Btn_Factionlist")
		self:OnClickItemCall(--[[!AUTO_580]]"Win_FactionMain", --[[!AUTO_581]]"Btn_Factionlist",
		function ()
			HideTip(--[[!AUTO_582]]"Win_FactionMain")
			ShowUITip(self.id, --[[!AUTO_583]]"Win_FactionList", --[[!AUTO_584]]"Btn_Join")
			self:OnHideDialogCall(--[[!AUTO_585]]"Win_FactionList", function () self:Finish(false) end)
		end)
		self:OnClickItemCall(--[[!AUTO_586]]"Win_FactionList", --[[!AUTO_587]]"Btn_Join", function () return self:Finish(true) end)
		self:OnHideDialogCall(--[[!AUTO_588]]"Win_FactionMain", function () self:Finish(false) end)
	end

	function config:OnFinish ()
		HideTip(--[[!AUTO_589]]"Win_FactionMain")
		HideTip(--[[!AUTO_590]]"Win_FactionList")
	end

	HelpSystem:SetHelpConfig(helpId, PLUN(config, --[[!AUTO_591]]"config[77]"))
end

do	--Config[78] 进入属地
	local helpId = 78
	local config = HelpConfig:new(helpId)

	function config:OnInit ()
		HelpConfig.OnInit(self)
		self:Register()
	end

	function config:Register ()
		self:OnShowDialogCall(--[[!AUTO_592]]"Win_FactionList",
		function ()
			if GameApi.GetHostFactionType() ~= -1 then
				return self:Activate(false)
			end
		end, false)
	end

	function config:OnActivate ()
		ShowUITip(self.id, --[[!AUTO_593]]"Win_FactionList", --[[!AUTO_594]]"Btn_EnterField")
		self:OnClickItemCall(--[[!AUTO_595]]"Win_FactionList", --[[!AUTO_596]]"Btn_EnterField",
		function ()
			HideTip(--[[!AUTO_597]]"Win_FactionList")
			return self:Finish(true)
		end)
		self:OnHideDialogCall(--[[!AUTO_598]]"Win_FactionList", function () self:Finish(false) end)
	end

	function config:OnFinish ()
		HideTip(--[[!AUTO_599]]"Win_FactionList")
	end

	HelpSystem:SetHelpConfig(helpId, PLUN(config, --[[!AUTO_600]]"config[78]"))
end

do	--Config[79] 申请入帮
	local helpId = 79
	local config = HelpConfig:new(helpId)

	function config:OnInit ()
		HelpConfig.OnInit(self)
		self:Register()
	end

	function config:Register ()
		self:OnEnterFaction(function() return self:Activate(false) end, false)
	end

	function config:OnActivate ()
		ShowUITip(self.id, --[[!AUTO_601]]"Win_Main", --[[!AUTO_602]]"Btn_Social")
		self:OnShowDialogCall(--[[!AUTO_603]]"Win_FactionFrontPage",
		function()
			HideTip(--[[!AUTO_604]]"Win_Main")
			ShowUITip(self.id, --[[!AUTO_605]]"Win_FactionFrontPage", --[[!AUTO_606]]"Img_TaskIcon2")
			self:OnClickItemCall(--[[!AUTO_607]]"Win_FactionFrontPage", --[[!AUTO_608]]"Img_TaskIcon2",
			function ()
				HideTip(--[[!AUTO_609]]"Win_FactionFrontPage")
				ShowUITip(self.id, --[[!AUTO_610]]"Win_FactionTaskGuideSub", --[[!AUTO_611]]"Txt_Location")
				return --[[!AUTO_612]]"end"
			end)
			return --[[!AUTO_613]]"end"
		end)

		self:OnHideDialogCall(--[[!AUTO_614]]"Win_FactionMain", function () self:Finish(true) end)
	end

	function config:OnFinish ()
		HideTip(--[[!AUTO_615]]"Win_Main")
		HideTip(--[[!AUTO_616]]"Win_FactionFrontPage")
		HideTip(--[[!AUTO_617]]"Win_FactionTaskGuideSub")
	end

	HelpSystem:SetHelpConfig(helpId, PLUN(config, --[[!AUTO_618]]"config[79]"))
end

do	--Config[80] 申请入帮
	local helpId = 80
	local config = HelpConfig:new(helpId)

	function config:OnInit ()
		HelpConfig.OnInit(self)
		self:Register()
	end

	function config:Register ()
		self:OnJiaChiChanged(
			function(params)
				if params.new_value >= 6 then
					return self:Activate(false)
				end
			end, false)
	end

	function config:OnActivate ()
		ShowUITip(self.id, --[[!AUTO_619]]"Win_Main", --[[!AUTO_620]]"Btn_Social")
		self:OnShowDialogCall(--[[!AUTO_621]]"Win_FactionMain",
		function()
			HideTip(--[[!AUTO_622]]"Win_Main")
			ShowUITip(self.id, --[[!AUTO_623]]"Win_FactionMain", --[[!AUTO_624]]"Btn_FactionJiaChi")
			self:OnShowDialogCall(--[[!AUTO_625]]"Win_FactionJiaChi",
			function ()
				HideTip(--[[!AUTO_626]]"Win_FactionMain")
				ShowUITip(self.id, --[[!AUTO_627]]"Win_FactionJiaChi", --[[!AUTO_628]]"Btn_Delivery")
				self:OnClickItemCall(--[[!AUTO_629]]"Win_FactionJiaChi", --[[!AUTO_630]]"Btn_Delivery",
				function ()
					HideTip(--[[!AUTO_631]]"Win_FactionMain")
					return self:Finish(true)
				end)
				return --[[!AUTO_632]]"end"
			end)
			return --[[!AUTO_633]]"end"
		end)

		self:OnHideDialogCall(--[[!AUTO_634]]"Win_FactionJiaChi", function () self:Finish() end)
		self:OnHideDialogCall(--[[!AUTO_635]]"Win_FactionMain", function () self:Finish() end)
	end

	function config:OnFinish ()
		HideTip(--[[!AUTO_636]]"Win_Main")
		HideTip(--[[!AUTO_637]]"Win_FactionJiaChi")
		HideTip(--[[!AUTO_638]]"Win_FactionMain")
	end

	HelpSystem:SetHelpConfig(helpId, PLUN(config, --[[!AUTO_639]]"config[80]"))
end

do	--Config[81] 帮派红利
	local helpId = 81
	local config = HelpConfig:new(helpId)

	function config:OnInit ()
		HelpConfig.OnInit(self)
		self:Register()
	end

	function config:Register ()
		self:OnShowDialogCall(--[[!AUTO_640]]"Win_FactionMoneyTaskList",
		function ()
			return self:Activate(false)
		end, false)
	end

	function config:OnActivate ()
		DlgApi.ShowDialog(--[[!AUTO_641]]"Win_HelpList", true)
		Win_HelpList:ShowSelectHelpMsg(5, 2, 1)
		self:Finish(true)
	end

	function config:OnFinish ()
	end

	HelpSystem:SetHelpConfig(helpId, PLUN(config, --[[!AUTO_642]]"config[81]"))
end

do	--Config[82] 完成红利任务
	local helpId = 82
	local config = HelpConfig:new(helpId)

	function config:OnInit ()
		HelpConfig.OnInit(self)
		self:Register()
	end

	function config:Register ()
		list = {}
		list[5824] = true
		list[5825] = true
		list[5826] = true
		list[5827] = true
		self:OnFinishTaskCall(nil,
		function (params)
			if list[params.task_id] then
				return self:Activate(false)
			end
		end, false)
	end

	function config:OnActivate ()
		DlgApi.ShowDialog(--[[!AUTO_643]]"Win_HelpList", true)
		Win_HelpList:ShowSelectHelpMsg(5, 2, 1)
		self:Finish(true)
	end

	function config:OnFinish ()
	end

	HelpSystem:SetHelpConfig(helpId, PLUN(config, --[[!AUTO_644]]"config[82]"))
end


do	--Config[83] 指引增加分舵数
	local helpId = 83
	local config = HelpConfig:new(helpId)

	function config:OnInit ()
		HelpConfig.OnInit(self)
		self:Register()
	end

	function config:Register ()
		self:OnShowDialogCall(--[[!AUTO_645]]"Win_FactionTerritorySubMap",
		function ()
			local nowCount, maxCount = HelpSystemApi.GetFactionOwnCityNumAndMax()
			if nowCount < maxCount then
				return self:Activate(false)
			end
		end, false)
	end

	function config:OnActivate ()
		DlgApi.ShowDialog(--[[!AUTO_646]]"Win_HelpList", true)
		Win_HelpList:ShowSelectHelpMsg(5, 1, 4)
		self:Finish(true)
	end

	function config:OnFinish ()
	end

	HelpSystem:SetHelpConfig(helpId, PLUN(config, --[[!AUTO_647]]"config[83]"))
end

do	--Config[84] 帮派格局界面指引
	local helpId = 84
	local config = HelpConfig:new(helpId)

	function config:OnInit ()
		HelpConfig.OnInit(self)
		self:Register()
	end

	function config:Register ()
		self:OnShowDialogCall(--[[!AUTO_648]]"Win_FactionTerritorySubMap",
		function ()
			local nowCount, maxCount = HelpSystemApi.GetFactionOwnCityNumAndMax()
			if nowCount == maxCount then
				return self:Activate(false)
			end
		end, false)
	end

	function config:OnActivate ()
		DlgApi.ShowDialog(--[[!AUTO_649]]"Win_HelpList", true)
		Win_HelpList:ShowSelectHelpMsg(5, 1, 4)
		self:Finish(true)
	end

	function config:OnFinish ()
	end

	HelpSystem:SetHelpConfig(helpId, PLUN(config, --[[!AUTO_650]]"config[84]"))
end


do	--Config[85] 指引增加分舵数
	local helpId = 85
	local config = HelpConfig:new(helpId)

	function config:OnInit ()
		HelpConfig.OnInit(self)
		self:Register()
	end

	function config:Register ()
		self:OnFactionSelectedAshead(
		function()
			local position = HelpSystemApi.GetPositionInFaction()
			if position >= 1 and position <= 5 then
				return self:Activate(false)
			end
		end, false)
	end

	function config:OnActivate ()
		ShowUITip(self.id, --[[!AUTO_651]]"Win_Main", --[[!AUTO_652]]"Btn_Social")
		self:OnShowDialogCall(--[[!AUTO_653]]"Win_FactionMain",
		function()
			HideTip(--[[!AUTO_654]]"Win_Main")
			ShowUITip(self.id, --[[!AUTO_655]]"Win_FactionMain", --[[!AUTO_656]]"Rdo_Territory")
			self:OnShowDialogCall(--[[!AUTO_657]]"Win_FactionTerritory",
			function ()
				HideTip(--[[!AUTO_658]]"Win_FactionMain")
				ShowUITip(self.id, --[[!AUTO_659]]"Win_FactionTerritory", --[[!AUTO_660]]"Btn_BossBtn")
				self:OnClickItemCall(--[[!AUTO_661]]"Win_FactionTerritory", --[[!AUTO_662]]"Btn_BossBtn",
				function ()
					HideTip(--[[!AUTO_663]]"Win_FactionMain")
					return self:Finish(true)
				end)
				return --[[!AUTO_664]]"end"
			end)
			return --[[!AUTO_665]]"end"
		end)

		self:OnHideDialogCall(--[[!AUTO_666]]"Win_FactionTerritory", function () self:Finish() end)
		self:OnHideDialogCall(--[[!AUTO_667]]"Win_FactionMain", function () self:Finish() end)
	end

	function config:OnFinish ()
		HideTip(--[[!AUTO_668]]"Win_Main")
		HideTip(--[[!AUTO_669]]"Win_FactionMain")
		HideTip(--[[!AUTO_670]]"Win_FactionTerritory")
	end

	HelpSystem:SetHelpConfig(helpId, PLUN(config, --[[!AUTO_671]]"config[85]"))
end

do	--Config[86] 第一次开启势力格局界面
	local helpId = 86
	local config = HelpConfig:new(helpId)

	function config:OnInit ()
		HelpConfig.OnInit(self)
		self:Register()
	end

	function config:Register ()
		self:OnShowDialogCall(--[[!AUTO_672]]"Win_FactionTerritorySubMap",
		function ()
			return self:Activate(false)
		end, false)
	end

	function config:OnActivate ()
		DlgApi.ShowDialog(--[[!AUTO_673]]"Win_HelpList", true)
		Win_HelpList:ShowSelectHelpMsg(5, 1, 4)
		self:Finish(true)
	end

	function config:OnFinish ()
	end

	HelpSystem:SetHelpConfig(helpId, PLUN(config, --[[!AUTO_674]]"config[86]"))
end

do	--Config[87] 获得宝物
	local helpId = 87
	local config = HelpConfig:new(helpId)

	function config:OnInit ()
		HelpConfig.OnInit(self)
		self:Register()
	end

	function config:Register ()
		local Itemid = {}
		Itemid[44190] = true
		Itemid[44191] = true
		Itemid[44192] = true
		Itemid[44193] = true
		Itemid[44194] = true
		Itemid[44195] = true
		Itemid[44196] = true
		Itemid[44197] = true
		Itemid[44198] = true
		Itemid[44199] = true
		Itemid[44200] = true
		Itemid[44201] = true
		Itemid[44202] = true
		Itemid[44203] = true
		Itemid[44204] = true
		Itemid[44205] = true
		Itemid[44206] = true
		Itemid[44207] = true
		Itemid[44208] = true
		Itemid[44209] = true
		Itemid[44210] = true
		Itemid[44211] = true
		Itemid[44212] = true
		Itemid[44213] = true
		Itemid[44214] = true
		Itemid[44215] = true
		Itemid[44216] = true
		Itemid[44217] = true
		Itemid[44218] = true
		Itemid[44219] = true
		Itemid[44220] = true
		Itemid[44221] = true
		Itemid[44222] = true
		Itemid[44223] = true
		Itemid[44224] = true
		Itemid[44225] = true
		Itemid[44226] = true
		Itemid[44227] = true
		Itemid[44228] = true
		Itemid[44229] = true
		Itemid[44230] = true
		Itemid[44231] = true
		Itemid[44232] = true
		Itemid[44233] = true
		Itemid[44234] = true


		self:OnObtainItemCall(nil,
		function (params)
			if Itemid[params.item_id] then
				return self:Activate()
			end
		end, true)
	end

	function config:OnActivate ()
		DlgApi.ShowDialog(--[[!AUTO_675]]"Win_HelpList", true)
		Win_HelpList:ShowSelectHelpMsg(5, 2, 2)
		self:Finish(true)
	end

	function config:OnFinish ()
	end

	HelpSystem:SetHelpConfig(helpId, PLUN(config, --[[!AUTO_676]]"config[87]"))
end

do	--Config[88] 获得宝物
	local helpId = 88
	local config = HelpConfig:new(helpId)

	function config:OnInit ()
		HelpConfig.OnInit(self)
		self:Register()
	end

	function config:Register ()
		local sceneList = {}
		sceneList[1026] = true
		sceneList[1028] = true

		local BuffList = {}
		BuffList[804] = true
		BuffList[805] = true
		BuffList[806] = true
		BuffList[807] = true
		BuffList[808] = true
		BuffList[809] = true
		BuffList[810] = true
		BuffList[811] = true
		BuffList[812] = true

		local hasBuff = false
		self:OnEnterScene(nil,
		function (params)
			if sceneList[params.scene_now] then
				for k, v in pairs(BuffList) do
					hasBuff = HelpSystemApi.HasBuff(k)
				end
				if not hasBuff then
					return self:Activate()
				end
			end
		end, true)
	end

	function config:OnActivate ()
		DlgApi.ShowDialog(--[[!AUTO_677]]"Win_HelpList", true)
		Win_HelpList:ShowSelectHelpMsg(5, 2, 2)
		self:Finish(true)
	end

	function config:OnFinish ()
	end

	HelpSystem:SetHelpConfig(helpId, PLUN(config, --[[!AUTO_678]]"config[88]"))
end

do	--Config[89] 获得使用黑面罩
	local helpId = 89
	local config = HelpConfig:new(helpId)

	function config:OnInit ()
		HelpConfig.OnInit(self)
		self:Register()
	end

	function config:Register ()
		self:OnObtainItemCall(55508, function () return self:Activate() end, true)
	end

	function config:OnActivate ()
		SetInventoryItem(55508)
		ShowUITip(self.id, --[[!AUTO_679]]"Win_Main", --[[!AUTO_680]]"Btn_Inventory")
		self:OnShowDialogCall(--[[!AUTO_681]]"Win_Inventory", function () HideTip(--[[!AUTO_682]]"Win_Main") GetInventoryItem(--[[!AUTO_683]]"Win_Inventory", self.id, 30) end)
		self:OnHideDialogCall(--[[!AUTO_684]]"Win_Inventory",
		function ()
			DlgApi.ShowDialog(--[[!AUTO_685]]"Win_HelpList", true)
			Win_HelpList:ShowSelectHelpMsg(5, 2, 3)
			HideTip(--[[!AUTO_686]]"Win_Inventory")
			self:Finish(true)
		end, false)
		self:OnHideDialogCall(--[[!AUTO_687]]"Win_Inventory", function () return self:Finish() end)
		self:DelayCall(10000, function() self:Finish() end)
		self:OnChangeMapCall(GameApi.GetSceneID(), function () return self:Finish() end)
	end

	function config:OnFinish ()
		HideTip(--[[!AUTO_688]]"Win_Main")
		HideTip(--[[!AUTO_689]]"Win_Inventory")
	end

	HelpSystem:SetHelpConfig(helpId, PLUN(config, --[[!AUTO_690]]"config[89]"))
end

do	--Config[90] 盗宝盗洞玩法
	local helpId = 90
	local config = HelpConfig:new(helpId)

	function config:OnInit ()
		HelpConfig.OnInit(self)
		self:Register()
	end

	function config:Register ()
		self:OnShowDialogCall(--[[!AUTO_691]]"Win_TreasureSteal",
		function ()
			return self:Activate(false)
		end, false)
	end

	function config:OnActivate ()
		DlgApi.ShowDialog(--[[!AUTO_692]]"Win_HelpList", true)
		Win_HelpList:ShowSelectHelpMsg(5, 2, 3)
		self:Finish(true)
	end

	function config:OnFinish ()
	end

	HelpSystem:SetHelpConfig(helpId, PLUN(config, --[[!AUTO_693]]"config[90]"))
end

do	--Config[91] 获得建设材料
	local helpId = 91
	local config = HelpConfig:new(helpId)

	function config:OnInit ()
		HelpConfig.OnInit(self)
		self:Register()
	end

	function config:Register ()
		local Itemid = {}
		Itemid[70794] = true
		Itemid[60626] = true
		Itemid[70790] = true

		self:OnObtainItemCall(nil,
		function (params)
			if Itemid[params.item_id] then
				return self:Activate()
			end
		end, true)
	end

	function config:OnActivate ()
		DlgApi.ShowDialog(--[[!AUTO_694]]"Win_HelpList", true)
		Win_HelpList:ShowSelectHelpMsg(5, 2, 4)
		self:Finish(true)
	end

	function config:OnFinish ()
	end

	HelpSystem:SetHelpConfig(helpId, PLUN(config, --[[!AUTO_695]]"config[91]"))
end

do	--Config[92] 使用踢馆-势力通过
	local helpId = 92
	local config = HelpConfig:new(helpId)

	function config:OnInit ()
		HelpConfig.OnInit(self)
		self:Register()
	end

	function config:Register ()
		self:OnShowDialogCall(--[[!AUTO_696]]"Win_FactionTiguan",
		function ()
			local nowCount, maxCount = HelpSystemApi.GetFactionOwnCityNumAndMax()
			if nowCount < maxCount then
				return self:Activate(false)
			end
		end, false)
	end

	function config:OnActivate ()
		ShowUITip(self.id, --[[!AUTO_697]]"Win_FactionTiguan", --[[!AUTO_698]]"Rdo_Purpose2")
		self:OnClickItemCall(--[[!AUTO_699]]"Win_FactionTiguan", --[[!AUTO_700]]"Rdo_Purpose2",
		function ()
			HideTip(--[[!AUTO_701]]"Win_FactionTiguan")
			return self:Finish(true)
		end)
		return --[[!AUTO_702]]"end"
	end

	function config:OnFinish ()
		HideTip(--[[!AUTO_703]]"Win_FactionTiguan")
	end

	HelpSystem:SetHelpConfig(helpId, PLUN(config, --[[!AUTO_704]]"config[92]"))
end

do	--Config[93] 开启帮派活动界面
	local helpId = 93
	local config = HelpConfig:new(helpId)

	function config:OnInit ()
		HelpConfig.OnInit(self)
		self:Register()
	end

	function config:Register ()
		self:OnShowDialogCall(--[[!AUTO_705]]"Win_NPC",
		function ()
			if DlgApi.GetItemText(--[[!AUTO_706]]"Win_NPC", --[[!AUTO_707]]"Txt_npc") == --[[!AUTO_708]]"活動使" then
				local position = HelpSystemApi.GetPositionInFaction()
				if position >= 1 and position <= 4 then
					return self:Activate(false)
				end
			end
		end, false)
	end

	function config:OnActivate ()
		DlgApi.ShowDialog(--[[!AUTO_709]]"Win_HelpList", true)
		Win_HelpList:ShowSelectHelpMsg(5, 1, 2)
		self:Finish(true)
	end

	function config:OnFinish ()
	end

	HelpSystem:SetHelpConfig(helpId, PLUN(config, --[[!AUTO_710]]"config[93]"))
end


do	--Config[94] 开启江湖事件界面
	local helpId = 94
	local config = HelpConfig:new(helpId)

	function config:OnInit ()
		HelpConfig.OnInit(self)
		self:Register()
	end

	function config:Register ()
		self:OnShowDialogCall(--[[!AUTO_711]]"Win_FactionInterrogation",
		function ()
			local position = HelpSystemApi.GetPositionInFaction()
			if position >= 1 and position <= 4 then
				return self:Activate(false)
			end
		end, false)
	end

	function config:OnActivate ()
		DlgApi.ShowDialog(--[[!AUTO_712]]"Win_HelpList", true)
		Win_HelpList:ShowSelectHelpMsg(5, 1, 3)
		self:Finish(true)
	end

	function config:OnFinish ()
	end

	HelpSystem:SetHelpConfig(helpId, PLUN(config, --[[!AUTO_713]]"config[94]"))
end

do	--Config[95] 获得江湖消息
	local helpId = 95
	local config = HelpConfig:new(helpId)

	function config:OnInit ()
		HelpConfig.OnInit(self)
		self:Register()
	end

	function config:Register ()
		local ItemList = {}
		ItemList[37571] = true
		ItemList[37572] = true
		ItemList[37573] = true
		ItemList[37574] = true
		ItemList[37575] = true
		ItemList[37576] = true
		ItemList[37577] = true
		ItemList[37578] = true
		ItemList[37579] = true
		ItemList[37580] = true
		ItemList[37581] = true
		ItemList[37582] = true
		ItemList[37583] = true
		ItemList[37584] = true
		ItemList[37585] = true
		ItemList[37586] = true
		ItemList[37587] = true
		ItemList[37588] = true
		ItemList[37589] = true
		ItemList[37590] = true
		ItemList[37591] = true
		ItemList[37592] = true
		ItemList[37593] = true
		ItemList[37594] = true
		ItemList[37595] = true
		ItemList[37596] = true
		ItemList[37597] = true
		ItemList[37598] = true
		ItemList[37599] = true
		ItemList[37600] = true
		ItemList[37601] = true
		ItemList[37602] = true
		ItemList[37603] = true
		ItemList[37604] = true
		ItemList[37605] = true
		ItemList[37606] = true
		ItemList[37607] = true
		ItemList[37608] = true
		ItemList[37609] = true
		ItemList[37610] = true
		ItemList[37611] = true
		ItemList[37612] = true
		ItemList[37613] = true
		ItemList[37614] = true
		ItemList[37615] = true
		ItemList[37616] = true
		ItemList[37617] = true
		ItemList[37618] = true
		ItemList[37619] = true
		ItemList[37620] = true
		ItemList[37621] = true
		ItemList[37622] = true
		ItemList[37623] = true
		ItemList[37624] = true
		ItemList[37625] = true
		ItemList[37626] = true
		ItemList[37627] = true
		ItemList[37628] = true
		ItemList[37629] = true
		ItemList[37630] = true
		ItemList[37631] = true
		ItemList[37632] = true
		ItemList[37633] = true
		ItemList[37634] = true
		ItemList[37635] = true
		ItemList[37636] = true
		ItemList[37637] = true
		ItemList[37638] = true
		ItemList[37639] = true
		ItemList[37640] = true
		ItemList[37641] = true
		ItemList[37642] = true
		ItemList[37643] = true
		ItemList[37644] = true
		ItemList[37645] = true
		ItemList[37646] = true
		ItemList[37647] = true
		ItemList[37648] = true
		ItemList[37649] = true
		ItemList[37650] = true
		ItemList[37651] = true
		ItemList[37652] = true
		ItemList[37653] = true
		ItemList[37654] = true
		ItemList[37655] = true
		ItemList[37656] = true
		ItemList[37657] = true
		ItemList[37658] = true
		ItemList[37659] = true
		ItemList[37660] = true
		ItemList[37661] = true
		ItemList[37662] = true
		ItemList[37663] = true
		ItemList[37664] = true
		ItemList[37665] = true
		ItemList[37666] = true
		ItemList[37667] = true
		ItemList[37668] = true
		ItemList[37669] = true
		ItemList[37670] = true
		ItemList[37671] = true
		ItemList[37672] = true
		ItemList[37673] = true
		ItemList[37674] = true
		ItemList[37675] = true
		ItemList[37676] = true
		ItemList[37677] = true
		ItemList[37678] = true
		ItemList[37679] = true
		ItemList[37680] = true
		ItemList[44911] = true
		ItemList[44912] = true
		ItemList[44913] = true
		ItemList[44914] = true
		ItemList[44915] = true
		ItemList[44916] = true
		ItemList[44917] = true
		ItemList[44918] = true
		ItemList[44919] = true
		ItemList[44920] = true
		ItemList[44921] = true
		ItemList[44922] = true
		ItemList[44923] = true
		ItemList[44924] = true
		ItemList[44925] = true
		ItemList[44926] = true
		ItemList[44927] = true
		ItemList[44928] = true
		ItemList[44929] = true
		ItemList[44930] = true
		ItemList[44931] = true
		ItemList[44932] = true
		ItemList[44933] = true
		ItemList[44934] = true
		ItemList[44935] = true
		ItemList[44936] = true
		ItemList[44937] = true
		ItemList[44938] = true
		ItemList[44939] = true
		ItemList[44940] = true
		ItemList[44941] = true
		ItemList[44942] = true
		ItemList[44943] = true
		ItemList[44944] = true
		ItemList[44945] = true
		ItemList[44946] = true
		ItemList[44947] = true
		ItemList[44948] = true
		ItemList[44949] = true
		ItemList[44950] = true
		ItemList[44951] = true
		ItemList[44952] = true
		ItemList[44953] = true
		ItemList[44954] = true
		ItemList[44955] = true
		ItemList[44956] = true
		ItemList[44957] = true
		ItemList[44958] = true
		ItemList[44959] = true
		ItemList[44960] = true
		ItemList[44961] = true
		ItemList[44962] = true
		ItemList[44963] = true
		ItemList[44964] = true
		ItemList[44965] = true
		ItemList[44966] = true
		ItemList[44967] = true
		ItemList[44968] = true
		ItemList[44969] = true
		ItemList[44970] = true
		ItemList[44971] = true
		ItemList[44972] = true
		ItemList[44973] = true
		ItemList[44974] = true
		ItemList[44975] = true
		ItemList[44976] = true
		ItemList[44977] = true
		ItemList[44978] = true
		ItemList[44979] = true
		ItemList[44980] = true
		ItemList[44981] = true
		ItemList[44982] = true
		ItemList[44983] = true
		ItemList[44984] = true
		ItemList[44985] = true
		ItemList[44986] = true
		ItemList[44987] = true
		ItemList[44988] = true
		ItemList[44989] = true
		ItemList[44990] = true
		ItemList[44991] = true
		ItemList[44992] = true
		ItemList[44993] = true
		ItemList[44994] = true
		ItemList[44995] = true
		ItemList[44996] = true
		ItemList[44997] = true
		ItemList[44998] = true
		ItemList[44999] = true
		ItemList[45000] = true
		ItemList[45001] = true
		ItemList[45002] = true
		ItemList[45003] = true
		ItemList[45004] = true
		ItemList[45005] = true
		ItemList[45006] = true
		ItemList[45007] = true
		ItemList[45008] = true
		ItemList[45009] = true
		ItemList[45010] = true
		ItemList[45011] = true
		ItemList[45012] = true
		ItemList[45013] = true
		ItemList[45014] = true
		ItemList[45015] = true
		ItemList[45016] = true
		ItemList[45017] = true
		ItemList[45018] = true
		ItemList[45019] = true
		ItemList[45020] = true
		ItemList[45021] = true
		ItemList[45022] = true
		ItemList[45023] = true
		ItemList[45024] = true
		ItemList[45025] = true
		ItemList[45026] = true
		ItemList[45027] = true
		ItemList[45028] = true
		ItemList[45029] = true
		ItemList[45030] = true
		ItemList[45031] = true
		ItemList[45032] = true
		ItemList[45033] = true
		ItemList[45034] = true
		ItemList[45035] = true
		ItemList[45036] = true
		ItemList[45037] = true
		ItemList[45038] = true
		ItemList[45039] = true
		ItemList[45040] = true
		ItemList[45041] = true
		ItemList[45042] = true
		ItemList[45043] = true
		ItemList[45044] = true
		ItemList[45045] = true
		ItemList[45046] = true
		ItemList[45047] = true
		ItemList[45048] = true
		ItemList[45049] = true
		ItemList[45050] = true
		ItemList[45051] = true
		ItemList[45052] = true
		ItemList[45053] = true
		ItemList[45054] = true
		ItemList[45055] = true
		ItemList[45056] = true
		ItemList[45057] = true
		ItemList[45058] = true
		ItemList[45059] = true
		ItemList[45060] = true
		ItemList[45061] = true
		ItemList[45062] = true
		ItemList[45063] = true
		ItemList[45064] = true
		ItemList[45065] = true
		ItemList[45066] = true
		ItemList[45067] = true
		ItemList[45068] = true
		ItemList[45069] = true
		ItemList[45070] = true
		ItemList[45071] = true
		ItemList[45072] = true
		ItemList[45073] = true
		ItemList[45074] = true
		ItemList[45075] = true

		self:OnObtainItemCall(nil,
		function (params)
			if ItemList[params.item_id] then
				return self:Activate()
			end
		end, true)
	end

	function config:OnActivate ()
		DlgApi.ShowDialog(--[[!AUTO_714]]"Win_HelpList", true)
		Win_HelpList:ShowSelectHelpMsg(5, 1, 3)
		self:Finish(true)
	end

	function config:OnFinish ()
	end

	HelpSystem:SetHelpConfig(helpId, PLUN(config, --[[!AUTO_715]]"config[95]"))
end

do	--Config[96] 创建帮派
	local helpId = 96
	local config = HelpConfig:new(helpId)

	function config:OnInit ()
		HelpConfig.OnInit(self)
		self:Register()
	end

	function config:Register ()
		self:OnCreateFaction(function () return self:Activate(false) end, false)
	end

	function config:OnActivate ()
		ShowUITip(self.id, --[[!AUTO_716]]"Win_Main", --[[!AUTO_717]]"Btn_Friend")
		self:OnShowDialogCall(--[[!AUTO_718]]"Win_FriendFrame",
		function()
			HideTip(--[[!AUTO_719]]"Win_Main")
			ShowUITip(self.id, --[[!AUTO_720]]"Win_FriendFrame", --[[!AUTO_721]]"Rdo_Group")
			self:OnClickItemCall(--[[!AUTO_722]]"Win_FriendFrame", --[[!AUTO_723]]"Rdo_Group",
			function ()
				HideTip(--[[!AUTO_724]]"Win_FriendFrame")
				return self:Finish(true)
			end)
			return --[[!AUTO_725]]"end"
		end)

		self:DelayCall(10000, function() self:Finish() end)
		self:OnChangeMapCall(GameApi.GetSceneID(), function () return self:Finish() end)
		self:OnHideDialogCall(--[[!AUTO_726]]"Win_FriendFrame", function () self:Finish() end)
	end

	function config:OnFinish ()
		HideTip(--[[!AUTO_727]]"Win_FriendFrame")
		HideTip(--[[!AUTO_728]]"Win_Main")
	end

	HelpSystem:SetHelpConfig(helpId, PLUN(config, --[[!AUTO_729]]"config[96]"))
end

do	--Config[97] 传回本帮
	local helpId = 97
	local config = HelpConfig:new(helpId)

	function config:OnInit ()
		HelpConfig.OnInit(self)
		self:Register()
	end

	function config:Register ()
		local Taskid = {}
		Taskid[6543] = true
		Taskid[6557] = true

		self:OnGainTaskCall(nil,
		function (params)
			if Taskid[params.task_id] then
				return self:Activate(false)
			end
		end, false)
	end

	function config:OnActivate ()
		DlgApi.ShowDialog(--[[!AUTO_730]]"Win_HelpList", true)
		Win_HelpList:ShowSelectHelpMsg(5, 0, 4)
		self:Finish(true)
	end

	function config:OnFinish ()
	end

	HelpSystem:SetHelpConfig(helpId, PLUN(config, --[[!AUTO_731]]"config[97]"))
end

do	--Config[98] 帮派权限
	local helpId = 98
	local config = HelpConfig:new(helpId)

	function config:OnInit ()
		HelpConfig.OnInit(self)
		self:Register()
	end

	function config:Register ()
		local Taskid = {}
		Taskid[6549] = true
		Taskid[6560] = true

		self:OnGainTaskCall(nil,
		function (params)
			if Taskid[params.task_id] then
				return self:Activate(false)
			end
		end, false)
	end

	function config:OnActivate ()
		DlgApi.ShowDialog(--[[!AUTO_732]]"Win_HelpList", true)
		Win_HelpList:ShowSelectHelpMsg(5, 1, 1)
		self:Finish(true)
	end

	function config:OnFinish ()
	end

	HelpSystem:SetHelpConfig(helpId, PLUN(config, --[[!AUTO_733]]"config[98]"))
end

do	--Config[99] 护卫视野
	local helpId = 99
	local config = HelpConfig:new(helpId)

	function config:OnInit ()
		HelpConfig.OnInit(self)
		self:Register()
	end

	function config:Register ()
		local Taskid = {}
		Taskid[2996] = true
		Taskid[2997] = true
		Taskid[2998] = true

		self:OnGainTaskCall(nil,
		function (params)
			if Taskid[params.task_id] then
				return self:Activate(false)
			end
		end, false)
	end

	function config:OnActivate ()
		DlgApi.ShowDialog(--[[!AUTO_734]]"Win_HelpList", true)
		Win_HelpList:ShowSelectHelpMsg(5, 2, 6)
		self:Finish(true)
	end

	function config:OnFinish ()
	end

	HelpSystem:SetHelpConfig(helpId, PLUN(config, --[[!AUTO_735]]"config[99]"))
end

do	--Config[100] 劫持任务
	local helpId = 100
	local config = HelpConfig:new(helpId)

	function config:OnInit ()
		HelpConfig.OnInit(self)
		self:Register()
	end

	function config:Register ()
		local Taskid = {}
		Taskid[4736] = true
		Taskid[4743] = true
		Taskid[4752] = true
		Taskid[4767] = true
		Taskid[4456] = true
		Taskid[4473] = true

		self:OnGainTaskCall(nil,
		function (params)
			if Taskid[params.task_id] then
				return self:Activate(false)
			end
		end, false)
	end

	function config:OnActivate ()
		DlgApi.ShowDialog(--[[!AUTO_736]]"Win_HelpList", true)
		Win_HelpList:ShowSelectHelpMsg(5, 2, 6)
		self:Finish(true)
	end

	function config:OnFinish ()
	end

	HelpSystem:SetHelpConfig(helpId, PLUN(config, --[[!AUTO_737]]"config[100]"))
end

do	--Config[101] 获得江湖消息
	local helpId = 101
	local config = HelpConfig:new(helpId)

	function config:OnInit ()
		HelpConfig.OnInit(self)
		self:Register()
	end

	function config:Register ()
		self:OnShowDialogCall(--[[!AUTO_738]]"Win_FactionInvestNew",
		function ()
				return self:Activate(false)
		end, false)
	end

	function config:OnActivate ()
		ShowQuestTip(self.id)
		self:OnShowDialogCall(--[[!AUTO_739]]"Win_FactionInvestigateList",
		function()
			HideQuestTip()
			DlgApi.ShowDialog(--[[!AUTO_740]]"Win_HelpList", true)
			Win_HelpList:ShowSelectHelpMsg(5, 2, 5)
			return 	self:Finish(true)
		end)
	end

	function config:OnFinish ()
		HideQuestTip()
	end

	HelpSystem:SetHelpConfig(helpId, PLUN(config, --[[!AUTO_741]]"config[101]"))
end

do	--Config[102] 技能升级
	local helpId = 102
	local config = HelpConfig:new(helpId)

	function config:OnInit ()
		HelpConfig.OnInit(self)
		self:Register()
	end

	function config:Register ()
		self:OnSkillLevelUp(function () return self:Activate(false) end, false)
	end

	function config:OnActivate ()
		ShowUITip(self.id, --[[!AUTO_742]]"Win_Main", --[[!AUTO_743]]"Btn_Skill")
		self:OnShowDialogCall(--[[!AUTO_744]]"Win_SkillSystemMain",
		function()
			HideTip(--[[!AUTO_745]]"Win_Main")
			ShowUITip(self.id, --[[!AUTO_746]]"Win_SkillSeqFrame", --[[!AUTO_747]]"Rdo_Sort1")
			self:OnClickItemCall(--[[!AUTO_748]]"Win_SkillSeqFrame", --[[!AUTO_749]]"Rdo_Sort1",
			function ()
				HideTip(--[[!AUTO_750]]"Win_SkillSeqFrame")
				ShowUITip(self.id, --[[!AUTO_751]]"Win_SkillSystemElite", --[[!AUTO_752]]"Btn_EliteLvUp1")
				self:OnClickItemCall(--[[!AUTO_753]]"Win_SkillSystemElite", --[[!AUTO_754]]"Btn_EliteLvUp1",
				function ()
					return self:Finish(true)
				end)
			end)
			return --[[!AUTO_755]]"end"
		end, false)
		self:OnHideDialogCall(--[[!AUTO_756]]"Win_SkillSystemMain", function () return self:Finish() end)
		self:DelayCall(30000, function() self:Finish() end)
		self:OnChangeMapCall(GameApi.GetSceneID(), function () return self:Finish() end)
	end

	function config:OnFinish ()
		HideTip(--[[!AUTO_757]]"Win_Main")
		HideTip(--[[!AUTO_758]]"Win_SkillSystemElite")
	end

	HelpSystem:SetHelpConfig(helpId, PLUN(config, --[[!AUTO_759]]"config[102]"))
end


do	--Config[151] 内挂机指引
	local helpId = 151
	local config = HelpConfig:new(helpId)

	function config:OnInit ()
		HelpConfig.OnInit(self)
		self:Register()
	end

	function config:Register ()
		self:OnShowDialogCall(--[[!AUTO_760]]"Win_AutoPlayTip",
		function ()
			return self:Activate(false)
		end, false)
	end

	function config:OnActivate ()
		ShowUITip(self.id, --[[!AUTO_761]]"Win_AutoPlayTip", --[[!AUTO_762]]"Img_AutoPlay")
		self:OnShowDialogCall(--[[!AUTO_763]]"Win_AutoPlayFrame",
		function ()
				self:DelayCall(10000, function() return self:Finish() end)
				HideTip(--[[!AUTO_764]]"Win_AutoPlayTip")
				ShowUITip(self.id, --[[!AUTO_765]]"Win_AutoPlayFrame", --[[!AUTO_766]]"Btn_Save")
				self:OnClickItemCall(--[[!AUTO_767]]"Win_AutoPlayFrame", --[[!AUTO_768]]"Btn_Save",
				function ()
					HideTip(--[[!AUTO_769]]"Win_AutoPlayFrame")
					return self:Finish(true)
				end)
				return --[[!AUTO_770]]"end"
		end, false)
		self:OnChangeMapCall(GameApi.GetSceneID(), function () return self:Finish() end)
		self:OnHideDialogCall(--[[!AUTO_771]]"Win_AutoPlayFrame", function () return self:Finish() end)
	end

	function config:OnFinish ()
		HideTip(--[[!AUTO_772]]"Win_AutoPlayTip")
		HideTip(--[[!AUTO_773]]"Win_AutoPlayFrame")
	end

	HelpSystem:SetHelpConfig(helpId, PLUN(config, --[[!AUTO_774]]"config[151]"))
end


do	--Config[152] 换线指引
	local helpId = 152
	local config = HelpConfig:new(helpId)

	function config:OnInit ()
		HelpConfig.OnInit(self)
		self:Register()
	end

	function config:Register ()
		self:OnLineNumChanged(function () return self:Activate(false) end, false)
	end

	function config:OnActivate ()
		ShowUITip(self.id, --[[!AUTO_775]]"Win_MainInfoLeft", --[[!AUTO_776]]"Img_LineSt")
		self:DelayCall(5000, function() return self:Finish(true) end)
	end

	function config:OnFinish ()
		HideTip(--[[!AUTO_777]]"Win_MainInfoLeft")
	end

	HelpSystem:SetHelpConfig(helpId, PLUN(config, --[[!AUTO_778]]"config[152]"))
end

do	--Config[154] 暗器升级道具使用
	local helpId = 154
	local config = HelpConfig:new(helpId)

	function config:OnInit ()
		HelpConfig.OnInit(self)
		self:Register()
	end

	function config:Register ()
		self:OnFinishTaskCall(7672, function () return self:Activate(false) end, false)
	end

	function config:OnActivate ()
		DlgApi.ShowDialog(--[[!AUTO_787]]"Win_HelpList", true)
		Win_HelpList:ShowSelectHelpMsg(4, 0, 4)
		ShowUITip(self.id, "Win_Main", "Btn_AnQi")
		self:OnShowDialogCall("Win_AnQiXia",
		function ()
				HideTip("Win_Main")
				ShowUITip(self.id, "Win_AnQiXia", "Btn_LevelUp")
				self:OnHideDialogCall("Win_AnQiXia", function () return self:Finish() end)
				self:OnClickItemCall("Win_AnQiXia", "Btn_LevelUp",
				function ()
					HideTip("Win_AnQiXia")
					return self:Finish(true)
				end)
				return "end"
		end, false)
	end

	function config:OnFinish ()
		HideTip("Win_AnQiXia")
	end

	HelpSystem:SetHelpConfig(helpId, PLUN(config, --[[!AUTO_788]]"config[154]"))
end

do	--Config[155] 暗器使用
	local helpId = 155
	local config = HelpConfig:new(helpId)

	function config:OnInit ()
		HelpConfig.OnInit(self)
		self:Register()
	end

	function config:Register ()
		self:OnGainTaskCall(7672, function () return self:Activate(false) end, false)
	end

	function config:OnActivate ()
		DlgApi.ShowDialog(--[[!AUTO_789]]"Win_HelpList", true)
		Win_HelpList:ShowSelectHelpMsg(4, 0, 3)
		return self:Finish(true)
	end

	function config:OnFinish ()
	end

	HelpSystem:SetHelpConfig(helpId, PLUN(config, --[[!AUTO_790]]"config[155]"))
end

do	--Config[156] 退关功能界面
	local helpId = 156
	local config = HelpConfig:new(helpId)

	function config:OnInit ()
		HelpConfig.OnInit(self)
		self:Register()
	end

	function config:Register ()
		self:OnShowDialogCall("Win_Main3", function () return self:Activate(false) end, false)
	end

	function config:OnActivate ()
		ShowUITip(self.id, "Win_Main3", "Btn_Popularize")
		self:OnClickItemCall("Win_Main3", "Btn_Popularize",
		function ()
			HideTip("Win_Main3")
			return self:Finish(true)
		end)
		self:OnHideDialogCall("Win_Main3", function () self:Finish(false) end)
	end

	function config:OnFinish ()
		HideTip("Win_Main3")
	end

	HelpSystem:SetHelpConfig(helpId, PLUN(config, "config[156]"))
end

do	--Config[157] 执行动作
	local helpId = 157
	local config = HelpConfig:new(helpId)

	function config:OnInit ()
		HelpConfig.OnInit(self)
		self:Register()
	end

	function config:Register ()
		self:OnShowDialogCall("Win_HideGameTrack", function () return self:Activate(false) end, false)
	end

	function config:OnActivate ()
		ShowUITip(self.id, "Win_HideGameTrack", "XAJHHelpDialogButton")
		self:OnClickItemCall("Win_HideGameTrack", "XAJHHelpDialogButton", function () return self:Finish(true) end)
		self:DelayCall(10000, function() self:Finish() end)
	end

	function config:OnFinish ()
		HideTip("Win_HideGameTrack")
	end

	HelpSystem:SetHelpConfig(helpId, PLUN(config, --[[!AUTO_169]]"config[157]"))
end


do  -- 上线提示

	local helpId = 500
	local config = HelpConfig:new(helpId)

	function config:OnInit ()
		HelpConfig.OnInit(self)
		self:Register()
	end

	function config:Register ()
		HelpSystem:RegisterDataEvent(
		function ()
			if GameApi.GetPlayerFullProp(0).level <= 50 then
				HelpSystemApi.ShowHelpUI(--[[!AUTO_779]]"Help_EventList", -1, -120)
				Help_EventList:insertCurrentTabel(1)
			end
		end, DataEvent.DATA_LEVEL_CHANGE, nil)
		HelpSystem:RegisterDataEvent(
		function ()
			HelpSystemApi.ShowHelpUI(--[[!AUTO_780]]"Help_EventList", -1, -120)
			Help_EventList:insertCurrentTabel(2)
		end, DataEvent.DATA_SYSTEM_CAN_SUTRA_LEVELUP, nil)
	end

	function config:OnActivate ()

	end

	function config:OnFinish ()

	end

	HelpSystem:SetHelpConfig(helpId, PLUN(config, --[[!AUTO_781]]"config[500]"))
end
--~ do	--Config[test] 测试
--~ 	local helpId = test
--~ 	local config = HelpConfig:new(helpId)
--~
--~ 	function config:OnInit ()
--~ 		print("help test init")
--~ 		print(self)
--~ 		HelpConfig.OnInit(self)
--~ 		self:Register()
--~ 	end

--~ 	function config:Register ()
--~ 		print("help test register")		--D
--~
--~ 		self:DelayCall(2000, function () print("call now") end)
--~ 	end
--~
--~ 	function config:OnActivate ()
--~ 		print("help test activate")	--D
--~ 	end
--~
--~ 	function config:OnFinish ()
--~ 		print("help test finished")	--D
--~ 	end

--~ 	HelpSystem:SetHelpConfig(helpId, PLUN(config, "config[test]"))
--~ end

