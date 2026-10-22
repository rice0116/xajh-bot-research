--[[#tag push auto]]

  -----------策划新增函数-------------
-- IsHelpTipShow() 根据配置返回TIPS要显示的相对位置界面
-- SaveHelpTip()   判断TIPS界面界面位置是否需要切，以及是否需要再开启
-- SetDialogContents() 设置界面对应显示内容

local PLUN = function (v) return v or true end
--~ local PLUN = loadfile "test/plun.lua" "script/HelpSystem.lua"		-- 仅用于调试，调试完毕注释此行

------------- CONFIG ---------------
local NPC_ENTER_RADIUS = 20
local MATTER_ENTER_RADIUS = 20
------------------------------------

local GameApi = GameApi or {}
local pairs = pairs
local type = type
local next = next

--************************************************************************************************************
local HelpSystem = _G.HelpSystem
if HelpSystem == nil then
	HelpSystem		    = {}
	HelpSystem.CurrentId  = false
	HelpSystem.Enable	= true
	HelpSystem.InitOK   = false
	HelpSystem.Config   = {}
	HelpSystem.FinishedHelpList = {}
	HelpSystem.DynShowedUIs = {}
	HelpSystem.UIEventHandlers = {}		-- 注册的事件处理函数 UIEventHandlers[UIEvent.UI_XXX] = {func1, func2, ...}
	HelpSystem.DataEventHandlers = {}
end

--触发类型
local Trigger =
{
	TRIG_UI		= 1,
	TRIG_DATA	= 2
}
_G.Trigger = Trigger

local EVENT_PARAM_ANY = --[[!AUTO_1]]"all\24\0\0\0"

--UI事件定义(主要参数为对话框名称). 注：有固定参数 dialogName, itemName
local UIEvent =
{
	UI_NONE		= 0,
	UI_SHOW		= 1,	-- 无参数
	UI_HIDE		= 2,	-- 无参数
	UI_LBTNDOWN = 3,	-- 无参数
	UI_LBTNUP	= 4,	-- 无参数
	UI_RBTNDOWN = 5,	-- 无参数
	UI_RBTNUP	= 6,	-- 无参数
	UI_KEYDOWN	= 7,	-- 无参数
	UI_KEYUP	= 8,	-- 无参数
}
_G.UIEvent = UIEvent

HelpSystem.IVTRTYPE_ENUM =
{
	EQUIPPACK	= 0,	--	Equipment
	BACKPACK = 1,			--	特殊包裹栏
	PACK = 2,				--	Normal pack
	PACK1 = 3,				--	Normal pack1
	PACK2 = 4,				--	Normal pack2

	TASKITEM = 5,	--	Task Item pack
	MATERIAL = 6,			--	Material pack
	CARD = 7,				--	Card pack
	GIFT = 8,				--	Gift pack
	PETPACK = 9,			--	Pet pack
	SCENEONLY = 10,			--	场景专用
}

--数据事件定义(注释中第一个参数为主要参数)
local DataEvent =
{
	DATA_NONE			= 0,
	DATA_TIME			= 1,	-- (无主要参数)tick_time, 毫秒

	DATA_ENTER_SCENE	= 2,	-- scene_now(主要参数，下略), scene_old
	DATA_LEAVE_SCENE	= 3,	-- scene_id

	DATA_LEVEL_CHANGE	= 4,	-- level

	DATA_LEARN_SKILL	= 5,	-- skill_id
	DATA_LEARN_SKILLSEQ = 6,	-- skillseq_id

	DATA_USE_SKILL		= 7,	-- skill_id
	DATA_USE_SKILLSEQ	= 8,	-- skillseq_id, 注：仅在首技能使用时触发，首技能随后依然触发 DATA_USE_SKILL

	DATA_GAIN_ITEM		= 9,	-- item_id(tid), count, pack(参考 IVTRTYPE_ENUM)
	DATA_USE_ITEM		= 10,	-- item_id(tid), pack(参考 IVTRTYPE_ENUM)

	DATA_HOST_DEAD		= 11,	-- 无参数
	DATA_HOST_RELIVE	= 12,	-- 无参数

	DATA_NPC_ENTER		= 13,	-- npc_tid, npc_id(唯一标识)
	DATA_NPC_LEAVE		= 14,	-- npc_tid, npc_id(唯一标识)

	DATA_GAIN_TASK		= 15,	-- task_id, award_npc(交任务NPC)
	DATA_FNSH_TASK		= 16,	-- task_id

	DATA_MATTER_ENTER	= 17,	-- matter_tid, matter_id(唯一标识), matter_type("loot", "money", "mine" or "others")
	DATA_MATTER_LEAVE	= 18,	-- matter_tid

	DATA_PLAY_ACTION	= 19,	-- action(参见 OBJECTACT_TYPE)
	DATA_SKILL_LEVELUP	= 20,	-- skill_id, skill_level
	DATA_GAIN_MONEY		= 21,	-- src_type, isbind, money.
									-- src_type: TASK = 1, NPC_TRADE = 2, PLAYER_TRADE = 3, MARKET = 4, PICKUP = 5, LOTTERY = 6, MAIL = 7, INV_EXCHANGE = 9
	DATA_EXPLOIT_MAP	= 22,	-- map_id
	DATA_AUTO_SEARCH	= 23,	-- action(中断时为 "cancel", 其他可能值保留)

	DATA_LOGIC_KEY		= 24,	-- key(见HelpSystem.LOGICKEY_ENUM), bDown(按下为 true)
	DATA_KILL_NPC		= 25,	-- npc_tid, npc_id(唯一标识)

	DATA_PET_LEVEL_UP	= 26,	-- new_level, pet_index
	DATA_PET_XP_MAX		= 27,	-- max_now(满时为true), pet_index. 注：怒气值 不满 -> 满 或 满 -> 不满 都会触发
	DATA_PET_LEARN_SKILL= 28,	-- skill_id, skill_type(见 HelpSystem.SKILL_TYPE), pet_index
	DATA_PET_SERVICE	= 29,	-- service, pet_index(如有两只宠物参与，则为受方)
									-- service 名称："getid","skillteach","recycle","skillbook","skillforget","parentagetrans"
	DATA_PET_IVTR_SIZE	= 30,	-- (无主要参数) new_size, old_size
	DATA_PET_DEAD		= 31,	-- (无主要参数) pet_index
	DATA_PET_LIFE		= 32,	-- (无主要参数) new_life, old_life, pet_index
	DATA_PET_PARENTAGE	= 33,	-- parentage_id, pet_index. 注：宠物获得新血统，仅在升级的同时触发消息
	DATA_PET_IVTR_FULL	= 34,	-- (无主要参数) ivtr_size

	DATA_WEATHER_CHANGE	= 35,	-- weather_new, weather_old (参见 MapWeather @ environment.lua)
	DATA_SELECT_TARGET	= 36,	-- type: "player", "monster", "pet", "npc" or "others". "npc" 指 monster, pet 之外的 NPC
									-- tid: 仅 monster, pet, npc 有此值
									-- id(唯一标识), is_self(仅 player 有此值), can_catch(仅 monster 有此值)
	DATA_PET_USE_SKILL	= 37,	-- 未实现. skill_id, pet_index
	DATA_PET_USE_POINT	= 38,	-- (无主要参数) point_left, pet_index
	DATA_PET_LEARN_LIFE_SKILL = 39,		-- life_skill_id, pet_index
	DATA_PET_SUMMONED	= 40,	-- (无主要参数) pet_index
	DATA_PET_COMBINED	= 41,	-- (无主要参数) pet_index. 宠物合体

	DATA_CHANGE_SCENE	= 42,	-- scene_now, scene_old(现在一定是 -1)

	DATA_PET_HP			= 43,	-- (无主要参数) cur_hp, max_hp, pet_index
	DATA_PET_ENERGY		= 44,	-- (无主要参数) cur_energy, max_energy, pet_index. 宠物精力
	DATA_QUEST_TRACK_AUTOMOVE = 45,	-- task_id
	DATA_INVENTORY_FULL = 46,	-- pack(哪一个包裹，参考 IVTRTYPE_ENUM), size
	--DATA_INVENTORY_ttd = 46,	-- pack(哪一个包裹，参考 IVTRTYPE_ENUM), size
	DATA_CANFNSH_TASK	= 47,	-- task_id, 任务处于可完成状态, 此事件(在可完成状态下)会重复发送
	DATA_HOST_HP		= 48,	-- (无主要参数) new_hp, old_hp, max_hp
	DATA_BORAD_CHANGE	= 49,	-- 主参数: ("%d_%d"):format(副本id, 新版面id). 参数: new_board, old_board
	DATA_BOARD_CLOSE 	= 50,	-- 主参数: ("%d_%d"):format(副本id, 版面id). 参数: board
	DATA_BOARD_FINISH 	= 51,	-- 主参数: ("%d_%d"):format(副本id, 版面id). 参数: board
	DATA_ACC_RUN		= 52,	-- 加速跑状态改变. 主参数 bSet. 参数: bSet, true 表示开始加速跑，false表示结束加速跑
	DATA_ACHIEVEMENT_COMPLETE= 53,	--完成成就. 主参数: achievement_id. 参数: achievement_id
	DATA_ENTER_PRECINCT = 54,		--进入地图区域. 主参数: ("%d_%d"):format(场景id, 区域id). 参数: scene, new_precinct, old_precinct
	--DATA_LEAVE_PRECINCT = 55,		--离开地图区域
	DATA_ACTIVITY_OPEN = 56,		--活动开启. 主参数: id. 参数: id, open_time, close_time
	--DATA_ACTIVITY_CLOSE = 57,		--活动关闭
	DATA_REPUTATION = 58,			--声望变化. 主参数: repu_id, 参数: repu_id, new_value, old_value

	--运镖相关
	DATA_ESCORT_START 		= 101,		--开始运镖. 主参数: type. 参数: type (0: 普通运镖, 1: 打工)
	DATA_ESCORT_TOO_FAR 	= 102,		--镖车太远. 参数: left_time(xx秒后运镖失败) 目前第一次剩余时间为 60 秒，之后每10秒提示一次
	DATA_ESCORT_REST 		= 103,		--在驿站休息
	DATA_ESCORT_TRAP 		= 104,		--中陷阱
	DATA_ESCORT_ESCAPE_TRAP = 105,		--脱离陷阱
	DATA_ESCORT_ADVENTURE 	= 106,		--奇遇
	DATA_ESCORT_POISON 		= 107,		--被下毒
	DATA_ESCORT_FINISH 		= 108,		--到达目的地
	DATA_ESCORT_ROB_START 	= 109,		--开始劫镖. 主参数: type. 参数: type (0: 普通劫镖, 1: 打工)

	--帮派相关
	DATA_FACTION_CREATEFACTION 		= 110,		-- 建帮
	DATA_FACTION_ENTER_FACTION 		= 111,		-- 加入帮派
	DATA_FACTION_JIACHI_CHANGED 	= 112,		-- 加持等级改变 old_value, new_value
	DATA_FACTION_SELECTEDASHEAD 	= 113,		-- 被选为龙头帮
	DATA_FACTION_TIGUAN_STARTFIGHT 	= 114,		-- 踢馆开始

	DATA_SYSTEM_LINENUM_CHANGED = 115,			-- 线路数量变化

	DATA_SYSTEM_CAN_SUTRA_LEVELUP = 116,		-- 心法可升级
	DATA_SYSTEM_CAN_SKILL_LEVELUP = 117,		-- 技能可升级

}
_G.DataEvent = DataEvent

HelpSystem.LOGICKEY_ENUM =
{
	--	Operation keys
	HP_OPERATION			= 31,	--	Operation (mine, loot, etc)
	HP_BEHAVIOR				= 32,	--	Behavior (jump, etc)
	HP_SKILL_DODGE			= 33,	--	Dodge
	HP_SKILL_BLOCK			= 34,	--	Block
	HP_SKILL_CHARGE			= 35,	--	Charge
	DEFAULTPET_SUMMON 		= 36,	--	summon the default pet

	--	UI panel keys
	UI_SHOWDLG_CHARACTER 	= 81,	--	show dialog character
	UI_SHOWDLG_INVENTORY	= 82,	--	show dialog inventory
	UI_SHOWDLG_SKILL		= 83,	--	show dialog skill
	UI_SHOWDLG_TASK			= 84,	--	show dialog task
	UI_SHOWDLG_FRIEND		= 85,	--	show dialog friend
	UI_SHOWDLG_PET			= 86,	--86 show dialog pet
	UI_SHOWDLG_SYSTEM		= 87,	--	show dialog system
	UI_SHOWDLG_PRODUCE		= 88,	--	show dialog produce
	UI_SHOWDLG_TEAM			= 89,	--	show dialog team
	UI_SHOWDLG_RANKLIST		= 90,	--	show dialog rank list
	UI_SHOWDLG_FAMILY		= 91,	--91 show dialog family
	UI_SHOWDLG_FACTION		= 92,	--	show dialog faction
	UI_SHOWDLG_CASHSHOP		= 93,	--	show dialog cash shop
	UI_SHOWDLG_WORLDMAP		= 94,	--	show dialog world map
	UI_SHOWDLG_MIDMAP		= 95,	--	show dialog mid map
	UI_SHOWDLG_HOME			= 96,	--96 show dialog home
	UI_SHOWDLG_MAIL			= 97,	--	show dialog mail
	UI_SHOWDLG_SOCIAL		= 98,	--	show dialog social
	UI_SHOWDLG_HELP			= 99,	--	show dialog action edit
	UI_SHOWDLG_ACTION		= 100,	--	show dialog character
	UI_SHOW_ALLPANELS		= 101,	--101 show all panels

	--	Other keys
	SYS_MAGNIFY_MAP			= 111,	--	Magnify map
	SYS_MINIFY_MAP			= 112,	--	Minify map
	SYS_TURNON_MUSIC		= 113,	--	Turn on/off music
	SYS_TURNON_SOUND		= 114,	--	Turn on/off sound
	SYS_MUSIC_UP			= 115,	--	Music up
	SYS_MUSIC_DOWN			= 116,	--116	Music down
	SYS_PRINT_SCREEN		= 117,	--	Print screen
	SYS_TAKEPICTURE			= 118,	--	Enter / Leave picture taking
	SYS_BOSS				= 119,	--	Boss key
	SYS_DETAILTIP			= 120,	--	Detail Tip
	SYS_HIDEELSEPLAYER		= 121,	--121	Hide else player
	SYS_VIDEOSETTING		= 122,	--	Video Setting
}

HelpSystem.SKILL_TYPE = 		-- GNETSKILL::enum SKILL_TYPE
{
	ATTACK		= 0,		-- 主动攻击
	BLESS		= 1,		-- 主动祝福
	CURSE		= 2,		-- 主动诅咒
	PASSIVE		= 3,		-- 被动技能
	ASSIST		= 4,		-- 辅助技能
}

HelpSystem.IVTRTYPE_ENUM =
{
	IVTRTYPE_INVALID	= -1,

	IVTRTYPE_EQUIPPACK	= 0,	--	Equipment
	IVTRTYPE_BACKPACK = 1,			--	特殊包裹栏
	IVTRTYPE_PACK = 2,				--	Normal pack
	IVTRTYPE_PACK1 = 3,				--	Normal pack1
	IVTRTYPE_PACK2 = 4,				--	Normal pack2
	IVTRTYPE_NORMALPACK_END = 5,	--	普通包裹栏结束

	IVTRTYPE_TASKITEM = 5,	--	Task Item pack
	IVTRTYPE_MATERIAL = 6,			--	Material pack
	IVTRTYPE_CARD = 7,				--	Card pack
	IVTRTYPE_GIFT = 8,				--	Gift pack
	IVTRTYPE_PETPACK = 9,			--	Pet pack
	IVTRTYPE_SCENEONLY = 10,			--	场景专用
	IVTRTYPE_TAKEWITH_END = 11,		--	随身包裹结束

	IVTRTYPE_TRASHBOX = 11,			--	仓库
	IVTRTYPE_PETSTORAGE = 12,		--	宠物仓库
	IVTRTYPE_FACTIONSTORE = 13,		--	帮派包裹
	IVTRTYPE_RECYCLE = 14,			--	Recycle pack

}

local MBCS = GameApi.Utf8ToMBCS or function () end

--[[-------------------------------------------------------------------------------------
客户端调用此函数初始化帮助状态
acceptTable, finishTable: {id1=true, id2=true, ...}
--]]-------------------------------------------------------------------------------------
function HelpSystem:InitState(acceptTable, finishTable)
	if self.InitOK == false then
		self.FinishedHelpList = finishTable
		HelpSystemApi.SetNPCEnterRadius(NPC_ENTER_RADIUS)
		HelpSystemApi.SetMatterEnterRadius(MATTER_ENTER_RADIUS)
		self.InitOK = true

		for helpId, config in pairs(self.Config) do
			if not self:IsHelpFinished(helpId) then
				local OnInit = config.OnInit
				if OnInit then
					OnInit(config)
				end
			end
		end
	end
end

---------------------------------------------------------------------------------------
-- 角色改变时客户端调用此函数
---------------------------------------------------------------------------------------
function HelpSystem:Reset()
	if self.CurrentId then		-- clear current help
		HelpSystemApi.HideHelpUI(self.Config[self.CurrentId].UIName)
	end

	-- detach all UI
	for k, _ in pairs(self.DynShowedUIs) do
		HelpSystemApi.HideHelpUI( k )
	end
	self.DynShowedUIs = {}

	self.CurrentId  = false
	self.InitOK   = false
	self.FinishedHelpList = {}

	self:ClearUIEvent()
	self:ClearDataEvent()
end


---------------------------------------------------------------------------------------
--帮助Tick
---------------------------------------------------------------------------------------
function HelpSystem:Tick(dwPeriod)
	if HelpSystem.InitOK == true then
		HelpSystem:OnDataEvent(DataEvent.DATA_TIME, {tick_time=dwPeriod})
	end
end

---------------------------------------------------------------------------------------
-- 设置帮助数据
---------------------------------------------------------------------------------------
function HelpSystem:SetHelpConfig (idHelp, config)
	if idHelp then
		self.Config[idHelp] = config
	end
end

---------------------------------------------------------------------------------------
-- 查询帮助数据
---------------------------------------------------------------------------------------
function HelpSystem:GetHelpConfig (idHelp)
	if idHelp then
		return self.Config[idHelp]
	end
end

---------------------------------------------------------------------------------------
-- 客户端调用此函数，处理UI事件触发帮助
---------------------------------------------------------------------------------------
function HelpSystem:OnUIEvent(eEvent, sDlgName, sCtrlName, sParamTbl)
	local UIEventHandlers = self.UIEventHandlers

	local handlers = UIEventHandlers[eEvent]
	if handlers ~= nil then
		local mainParam = sDlgName

		local function callHandlers (handlers, sDlgName, sCtrlName, sParamTbl)
			for handler, _ in pairs(handlers) do
				local retFlag = handler(sDlgName, sCtrlName, sParamTbl)
				if retFlag == --[[!AUTO_2]]"end" then
					handlers[handler] = nil
				end
			end
		end

		local paramHandlers = handlers[mainParam]
		if paramHandlers ~= nil then
			callHandlers(paramHandlers, sDlgName, sCtrlName, sParamTbl)
			if next(paramHandlers) == nil then
				handlers[mainParam] = nil
			end
		end

		local anyParamHandlers = handlers[EVENT_PARAM_ANY]
		if anyParamHandlers ~= paramHandlers and anyParamHandlers ~= nil then
			callHandlers(anyParamHandlers, sDlgName, sCtrlName, sParamTbl)
			if next(anyParamHandlers) == nil then
				handlers[EVENT_PARAM_ANY] = nil
			end
		end

		if next(handlers) == nil then
			UIEventHandlers[eEvent] = nil
		end
	end
end

---------------------------------------------------------------------------------------
-- 客户端调用此函数，处理Data事件触发帮助
---------------------------------------------------------------------------------------
function HelpSystem:OnDataEvent(eEvent, sParamTbl)
	local DataEventHandlers = self.DataEventHandlers

	local handlers = DataEventHandlers[eEvent]
	if handlers then
		local mainParam = sParamTbl.main
		if mainParam == nil then
			mainParam = EVENT_PARAM_ANY
		end

		local function callHandlers (handlers, sParamTbl)
			for handler, _ in pairs(handlers) do
				local retFlag = handler(sParamTbl)
				if retFlag == --[[!AUTO_3]]"end" then
					handlers[handler] = nil
				end
			end
		end

		local paramHandlers = handlers[mainParam]
		if paramHandlers ~= nil then
			callHandlers(paramHandlers, sParamTbl)
			if next(paramHandlers) == nil then
				handlers[mainParam] = nil
			end
		end

		local anyParamHandlers = handlers[EVENT_PARAM_ANY]
		if anyParamHandlers ~= paramHandlers and anyParamHandlers ~= nil then
			callHandlers(anyParamHandlers, sParamTbl)
			if next(anyParamHandlers) == nil then
				handlers[EVENT_PARAM_ANY] = nil
			end
		end

		if next(handlers) == nil then
			DataEventHandlers[eEvent] = nil
		end
	end
end

--------------------------------------------------------------------------------------
-- handler: 事件处理函数, eEvent: 事件ID, mainParam: 主要参数
--	仅当 eEvent, mainParam 都匹配时才会调用 handler; mainParam 可设为 nil 以匹配任意参数
--  handler 参数: params
--	handler 返回 "end" 时, 此处理函数被清除
--------------------------------------------------------------------------------------
function HelpSystem:RegisterDataEvent (handler, eEvent, mainParam)
	if type(handler) ~= --[[!AUTO_4]]"function" or type(eEvent) ~= --[[!AUTO_5]]"number" then
		return false
	end
	local DataEventHandlers = self.DataEventHandlers

	local handlers = DataEventHandlers[eEvent]
	if handlers == nil then
		handlers = {}
		DataEventHandlers[eEvent] = handlers
	end

	if mainParam == nil then
		mainParam = EVENT_PARAM_ANY
	end

	local paramHandlers = handlers[mainParam]
	if paramHandlers == nil then
		paramHandlers = {}
		handlers[mainParam] = paramHandlers
	end

	paramHandlers[handler] = true
	return true
end

---------------------------------------------------------------------------------------
-- 注册数据事件
-- 传入 类(objName) 和 函数名(functionName)
---------------------------------------------------------------------------------------
function HelpSystem:RegisterDataEventObj (obj, functionName, eEvent, mainParam)
	local func = obj[functionName]
	return self:RegisterDataEvent(
			function (params) return func(obj, params) end,
			eEvent, mainParam )
end

---------------------------------------------------------------------------------------
-- 清空数据事件
---------------------------------------------------------------------------------------
function HelpSystem:ClearDataEvent ()
	self.DataEventHandlers = {}
end

--------------------------------------------------------------------------------------
-- handler: 事件处理函数, eEvent: 事件ID, mainParam: 主要参数
--	仅当 eEvent, mainParam 都匹配时才会调用 handler; mainParam 可设为 nil 以匹配所有参数
--  handler 参数: dialogName, itemName, params
--	handler 返回 "end" 时, 此处理函数被清除
--------------------------------------------------------------------------------------
function HelpSystem:RegisterUIEvent (handler, eEvent, mainParam)
	if type(handler) ~= --[[!AUTO_6]]"function" or type(eEvent) ~= --[[!AUTO_7]]"number" then
		return false
	end

	local UIEventHandlers = self.UIEventHandlers

	local handlers = UIEventHandlers[eEvent]
	if handlers == nil then
		handlers = {}
		UIEventHandlers[eEvent] = handlers
	end

	if mainParam == nil then
		mainParam = EVENT_PARAM_ANY
	end

	local paramHandlers = handlers[mainParam]
	if paramHandlers == nil then
		paramHandlers = {}
		handlers[mainParam] = paramHandlers
	end

	paramHandlers[handler] = true
	return true
end
--------------------------------------------------------------------------------------
-- 注册界面类事件
-- 传入 类(objName) 和 函数名(functionName)
--------------------------------------------------------------------------------------
function HelpSystem:RegisterUIEventObj (obj, functionName, eEvent, mainParam)
	local func = obj[functionName]
	return self:RegisterUIEvent(
			function (dialogName, itemName, params) return func(obj, dialogName, itemName, params) end,
			eEvent, mainParam )
end

--------------------------------------------------------------------------------------
--清空界面事件
--------------------------------------------------------------------------------------
function HelpSystem:ClearUIEvent ()
	self.UIEventHandlers = {}
end

---------------------------------------------------------------------------------------
--激活帮助
---------------------------------------------------------------------------------------
function HelpSystem:ActivateHelp (idHelp)
	local config = self.Config[idHelp]
	if config and not self.CurrentId then
		self.CurrentId = idHelp
		local OnActivate = config.OnActivate
		if OnActivate then
			OnActivate(config)
		end
		return true
	else
		return false
	end
end

---------------------------------------------------------------------------------------
--清除当前激活帮助
---------------------------------------------------------------------------------------
function HelpSystem:ClearCurrentHelp ()
	self.CurrentId = false
end

---------------------------------------------------------------------------------------
--查询当前激活帮助
---------------------------------------------------------------------------------------
function HelpSystem:GetCurrentHelp ()
	return self.CurrentId
end

---------------------------------------------------------------------------------------
--完成帮助
---------------------------------------------------------------------------------------
function HelpSystem:FinishHelp(idHelp)
	if not self.Enable then return end

	local config = self.Config[idHelp]
	if config then
		HelpSystemApi.AcceptHelp(idHelp)	-- 此标志已无用，直接设置
		HelpSystemApi.FinishHelp(idHelp)
		self.FinishedHelpList[idHelp] = true

		self.CurrentId = false

		if HelpSystem.Config[idHelp].UIName and HelpSystem.Config[idHelp].UIName ~= --[[!AUTO_8]]"" then
			self:HideHelpUI( idHelp )
		end
		HelpSystemApi.DeliverAwardTask(HelpSystem.Config[idHelp].AwardTask)

		local OnFinish = config.OnFinish
		if OnFinish then
			OnFinish(config)
		end
	end
end

function HelpSystem:IsHelpFinished (idHelp)
	return self.FinishedHelpList[idHelp] ~= nil
end

--------------------------------------------------------------------------------------
------------------------------------------工具函数------------------------------------
--------------------------------------------------------------------------------------

--[[ HelpSystemApi 函数说明
DeliverAwardTask(taskId)
DeliverHelp(helpId)
FinishHelp(helpId)
ShowHelpUI(helpUIName, x, y)
HideHelpUI(helpUIName)
AttachUI(helpUIName, dialogName, itemName)
DetachUI(helpUIName)
AttachUIGfx(gfxFile, dialogName, itemName, offsetX, offsetY)
DetachUIGfx(gfxFile, dialogName, itemName)
ClearUIGfx()		//DetachUIGfx for all
SetCursor(cursorId)	//see ECRES_CURSOR_TYPE
SetSubDialog(dialogName, itemName, subDialogName)
RemoveSubDialog(dialogName, itemName)
GetItemAllLink(dialogName, itemName)	// return {left=,top=,right=,bottom=,info=,text=}, ...
SetNPCEnterRadius(radius)
SetMatterEnterRadius(radius)
GetPetCount()
GetPetEnergy(petIndex)	// petIndex: 0, 1, 2, ...
GetPetScore(petIndex)
GetPetSkillCount(petIndex)
]]

HelpSystem.CursorType =
{
	normal = 0,
	hand = 20
}

function HelpSystem:SetCursor (cursor)
	if type(cursor) == --[[!AUTO_9]]"number" then
		HelpSystemApi.SetCursor(cursor)
	else
		HelpSystemApi.SetCursor(HelpSystem.CursorType[cursor])
	end
end


HelpSystem.enumEICoord = 2
HelpSystem.LINK_COLOR  = 0x95c4c0
HelpSystem.TargetType  =
{
	NONE = 0,
	NPC = 1,
	MONSTER = 2,
	MINE = 3,
	ITEM = 4,
	TRANSFER = 5
}
---------------------------------------------------------------------------------------
--工具函数：清除当前帮助
---------------------------------------------------------------------------------------
function HelpSystem:ClearCurrentHelp ()
	local CurrentId = HelpSystem.CurrentId
	local config = HelpSystem.Config[CurrentId]
	if CurrentId then
		self:HideHelpUI(CurrentId)
		HelpSystemApi.ClearUIGfx()
		HelpSystem.CurrentId = false
	end
end

---------------------------------------------------------------------------------------
--工具函数：完成当前帮助，同时开启新帮助
---------------------------------------------------------------------------------------
function HelpSystem:SwitchToHelp(idHelp)
	if self.CurrentId then
		self:FinishHelp (self.CurrentId)
	end

	if self.Config[idHelp] and self.Config[idHelp].Accept == false then
		self:DeliverHelp(idHelp)
	end
end

---------------------------------------------------------------------------------------
--工具函数：帮助界面计时关闭
---------------------------------------------------------------------------------------
function HelpSystem:TimeCloseUI(timer)
	if timer >= 90000 and timer <= 120000 then
		DlgApi.SetItemText(HelpSystem.Config[HelpSystem.CurrentId].UIName, --[[!AUTO_10]]"Lab_Timer", --[[!AUTO_11]]"關閉計時：" .. 120 - math.floor(timer/1000))
	elseif timer >= 90000 then
		DlgApi.SetItemText(HelpSystem.Config[HelpSystem.CurrentId].UIName, --[[!AUTO_12]]"Lab_Timer", --[[!AUTO_13]]"")
		HelpSystem:ClearCurrentHelp ()
	end
end

---------------------------------------------------------------------------------------
--工具函数：显示UI
---------------------------------------------------------------------------------------
function HelpSystem:ShowHelpUI (uiName, x, y)
	HelpSystemApi.ShowHelpUI( uiName, x, y )
	self.DynShowedUIs[uiName] = true
end

---------------------------------------------------------------------------------------
--工具函数：关闭UI
---------------------------------------------------------------------------------------
function HelpSystem:HideHelpUI (uiName)
	HelpSystemApi.HideHelpUI( uiName )
	self.DynShowedUIs[uiName] = nil
end

---------------------------------------------------------------------------------------
--工具函数：在UI上显示GFX
---------------------------------------------------------------------------------------
function HelpSystem:AttachUI (uiName, dlgName, itemName, offsetX, offsetY)
	HelpSystemApi.AttachUI( uiName, dlgName, itemName, offsetX, offsetY )
	self.DynShowedUIs[uiName] = true
end

---------------------------------------------------------------------------------------
--工具函数：关闭UI上显示的GFX
---------------------------------------------------------------------------------------
function HelpSystem:DetachUI (uiName)
	HelpSystemApi.DetachUI( uiName )
	self.DynShowedUIs[uiName] = nil
end

---------------------------------------------------------------------------------------
--工具函数：生成链接
---------------------------------------------------------------------------------------
function  HelpSystem:BuildPathLink( x,y,z,mapid,color,typeTarget,idTarget,idFrom )
	if mapid <=0 then
		return --[[!AUTO_14]]"MAP_ID_ERROR"
	end

	local offsetX, offsetZ = GameApi.GetMapOffset(mapid)
	local name = string.format(--[[!AUTO_15]]"[%d,%d]", x - offsetX, z - offsetZ)
	local info = string.format(--[[!AUTO_16]]"%d %d %d %d %d %d %d", typeTarget, mapid, x, y, z, idTarget, idFrom)

	return string.format( --[[!AUTO_17]]"%s<%d><%d><%s><%s>", GameApi.GetCoordTag(), HelpSystem.enumEICoord,
						  color, name, info )
end

local function getLinkInfo (link)	-- link: %s, %d, %d, %d, %d [, %d, %d]
	local params = {}
	for str in link:gmatch( --[[!AUTO_18]]"[^%,%s]+" ) do
		params[#params+1] = str
	end
	local targetType = tonumber(params[1]) or HelpSystem.TargetType[params[1]]
	local targetId = tonumber(params[2])
	local mapID = tonumber(params[3])
	local x = tonumber(params[4])
	local z = tonumber(params[5])
	local sourceId = params[6] and tonumber(params[6]) or 0
	local color = tonumber(params[7]) or HelpSystem.LINK_COLOR

	return HelpSystem:BuildPathLink( x, 0, z, mapID, color, targetType, targetId, sourceId )
end

---------------------------------------------------------------------------------------
--工具函数：转换Link格式文字
---------------------------------------------------------------------------------------
function HelpSystem:TransformLinkText (str)
	local resBuffer = {}
	local iDeal = 0
	local p = 1
	while true do
		local i, j = str:find( --[[!AUTO_19]]"%[[%a%_%d%s]+,[%d%-%s]+,[%d%-%s]+,[%d%-%s]+,[%d%-%s]+.-%]", p )
		if i == nil then break end

		resBuffer[#resBuffer+1] = str:sub( p, i-1 )
		resBuffer[#resBuffer+1] = getLinkInfo( str:sub(i+1,j-1) )
		p = j+1
	end
	resBuffer[#resBuffer+1] = str:sub( p )

	return table.concat( resBuffer )
end

---------------------------------------------------------------------------------------
--工具函数：点击链接处理
---------------------------------------------------------------------------------------
function HelpSystem:OnLinkClick ( dlgName, itemName, x, y )
	local linkItemInfo = DlgApi.GetItemLink(dlgName, itemName, x, y)

	if linkItemInfo then
		local params = {}		-- typeTarget, mapid, x, y, z, idTarget, idFrom
		for p in linkItemInfo:gmatch( --[[!AUTO_20]]"%S+" ) do
			params[#params+1] = p
		end

		local typeTarget = tonumber(params[1])
		local mapid = tonumber(params[2])
		local x = tonumber(params[3])
		local y = tonumber(params[4])
		local z = tonumber(params[5])
		local idTarget = tonumber(params[6])
		local idFrom = tonumber(params[7])

		GameApi.AutoSearchPathWithScriptCB( typeTarget, idTarget, idFrom, x, y, z, mapid );
		return true
	end

	return false
end

---------------------------------------------------------------------------------------
--工具函数：帮助界面内容显示控制
---------------------------------------------------------------------------------------
function HelpSystem:SetDialogContents(strTable)
	-- 设置控件显示及位置
	if strTable then
		for k, v in ipairs(strTable.Items) do
			DlgApi.ShowItem(strTable.DialogName, v, true) -- 开启控件
		end
		local pathstr = strTable.ContentText
		if string.len(pathstr) < 70 then
			pathstr = --[[!AUTO_21]]"\r" .. strTable.ContentText
		end
		DlgApi.SetItemText(strTable.DialogName, strTable.ContentItemName, --[[!AUTO_22]]"")
		DlgApi.AppendItemText(strTable.DialogName, strTable.ContentItemName, self:BuildPath(pathstr))
	end
	-- 奖励界面是否开启
	if strTable.AwardItem1 then
		DlgApi.ShowItem(strTable.DialogName, strTable.AwardItemName .. 1, true)
		DlgApi.ShowItem(strTable.DialogName, --[[!AUTO_23]]"Img_Back1", true)
		GameApi.SetIcon (strTable.DialogName, strTable.AwardItemName .. 1, ICON_TYPE_NORMALITEM, strTable.AwardItem1[1], strTable.AwardItem1[2])
	else
		DlgApi.ShowItem(strTable.DialogName, strTable.AwardItemName .. 1, false)
		DlgApi.ShowItem(strTable.DialogName, --[[!AUTO_24]]"Img_Back1", false)
	end
	if strTable.AwardItem2 then
		DlgApi.ShowItem(strTable.DialogName, strTable.AwardItemName .. 2, true)
		DlgApi.ShowItem(strTable.DialogName, --[[!AUTO_25]]"Img_Back2", true)
		GameApi.SetIcon (strTable.DialogName, strTable.AwardItemName .. 2, ICON_TYPE_NORMALITEM, strTable.AwardItem2[1], strTable.AwardItem2[2])
	else
		DlgApi.ShowItem(strTable.DialogName, strTable.AwardItemName .. 2, false)
		DlgApi.ShowItem(strTable.DialogName, --[[!AUTO_26]]"Img_Back2", false)
	end
end

---------------------------------------------------------------------------------------
--工具函数：将字符串中的ID转换成链接
---------------------------------------------------------------------------------------
function HelpSystem:BuildPath(str)
	local str1 = str
	if str then
		while true do
			local i, j = string.find(str1, --[[!AUTO_27]]"{%d+}")
			if i == nil then break end
			local tempstr = string.sub(str1, i, j)
			local tempid = tonumber(string.sub(str1, i + 1, j - 1))
			str1 = string.gsub(str1, tempstr, --[[!AUTO_28]]"")
			if tempstr then
				if ObjInfo[tempid] then
					local curx, cury = GameApi.GetMapOffset(ObjInfo[tempid].SID)
					local Title = string.format(--[[!AUTO_29]]"^88b25f%s的%s^bba96c", ObjInfo[tempid].scene, ObjInfo[tempid].name)
					local Link = string.format(--[[!AUTO_30]]"[%d,%d]", ObjInfo[tempid].x - curx, ObjInfo[tempid].z - cury)
					str = string.gsub(str, tempstr, Title .. GameApi.ConvertItemLinkText(Link, tempstr, color["粉色"]))
				else
					str = --[[!AUTO_31]]"您輸入的字串有誤!"
				end
			end
		end
	end
	return str
end

--------------------------------------------------------------------------------------

-----------------------------------------调试类函数-----------------------------------

--------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------
--调试类函数：完成、清除单个帮助状态函数
---------------------------------------------------------------------------------------
function HelpSystem:SetHelpState (helpId, finished)
	if finished then
		HelpSystemApi.AcceptHelp(helpId)
		HelpSystemApi.FinishHelp(helpId)
		HelpSystem.FinishedHelpList[helpId] = true
	else
		HelpSystemApi.ClearHelp()
		HelpSystem.FinishedHelpList[helpId] = nil
	end
end
---------------------------------------------------------------------------------------
--调试类函数：完成、清除全部帮助状态函数
---------------------------------------------------------------------------------------
function HelpSystem:SetAllHelpState (finished)
	for k, v in pairs(HelpSystem.Config) do
		if type(k) == --[[!AUTO_32]]"number" then
			HelpSystem:SetHelp(k, finished)
		end
	end
end

local tostring = tostring
local concat = table.concat
local select = select
local Print = GameApi.Print
local iostdout = io.stdout

---------------------------------------------------------------------------------------
-- 调试类函数：function print
---------------------------------------------------------------------------------------
function HelpSystem.print (...)
	local params = {...}
	local n = select(--[[!AUTO_33]]"#", ... )

	for i=1,n do
		Print( tostring(params[i] ) )
		if i ~= n then
			Print( --[[!AUTO_34]]"\t" )
		end
	end
	Print( --[[!AUTO_35]]"\n" )
end

---------------------------------------------------------------------------------------
--调试类函数：function printTable
---------------------------------------------------------------------------------------
local stringrep = string.rep
local printTable_tablelist = {}
--~ local function stdoutwrite (...)
--~ 	local params = {...}
--~ 	local n = select("#", ... )

--~ 	for i=1,n do
--~ 		Print( tostring(params[i] ) )
--~ 	end
--~ end
local function stdoutwrite (...)
	iostdout:write(...)
end

local function printTable_( t, level, maxLevel, name )
	printTable_tablelist[t] = name

	for k,v in pairs(t) do
		if( type(v)==--[[!AUTO_36]]"table" ) then
			local DT_str = --[[!AUTO_37]]""

			if( printTable_tablelist[v] ) then
				stdoutwrite( stringrep(--[[!AUTO_38]]' ',level*2), tostring(k), --[[!AUTO_39]]" = ", tostring(v), DT_str, --[[!AUTO_40]]" (", printTable_tablelist[v], --[[!AUTO_41]]")" )
				stdoutwrite( --[[!AUTO_42]]"\n" )
			elseif( maxLevel and level+1 >= maxLevel ) then
				stdoutwrite( stringrep(--[[!AUTO_43]]' ',level*2), tostring(k), --[[!AUTO_44]]" = ", tostring(v), DT_str, --[[!AUTO_45]]" (...)" )
				stdoutwrite( --[[!AUTO_46]]"\n" )
			else
				stdoutwrite( stringrep(--[[!AUTO_47]]' ',level*2), tostring(k), --[[!AUTO_48]]" = ", tostring(v), DT_str )
				stdoutwrite( --[[!AUTO_49]]"\n" )
				printTable_( v, level + 1, maxLevel, name..--[[!AUTO_50]]"."..tostring(k) )
			end
		else
			if( type(v)==--[[!AUTO_51]]"string" ) then
				stdoutwrite( stringrep(--[[!AUTO_52]]' ',level*2), tostring(k), --[[!AUTO_53]]" = \"", v, --[[!AUTO_54]]"\"" )
				stdoutwrite( --[[!AUTO_55]]"\n" )
			else
				stdoutwrite( stringrep(--[[!AUTO_56]]' ',level*2), tostring(k), --[[!AUTO_57]]" = ", tostring(v) )
				stdoutwrite( --[[!AUTO_58]]"\n" )
			end
		end
	end
end

local function printTable( t, maxLevel, name )
	if name then
		stdoutwrite( name, --[[!AUTO_59]]" =\n" )
	end
	if type(t) ~= --[[!AUTO_60]]"table" then
		stdoutwrite( tostring(t), --[[!AUTO_61]]"\n" )
	else
		local DT_str = --[[!AUTO_62]]""
		stdoutwrite( --[[!AUTO_63]]"[", tostring(t), DT_str, --[[!AUTO_64]]"]" )
				stdoutwrite( --[[!AUTO_65]]"\n" )
		printTable_( t, 0, maxLevel, type(name)==--[[!AUTO_66]]"string" and name or --[[!AUTO_67]]"t" )
		printTable_tablelist = {}
	end
end
_G.printTable = printTable

---------------------------------------------------------------------------------------
--调试类函数：执行一行脚本，如有错误，输出错误信息
---------------------------------------------------------------------------------------
local loadstring = loadstring
local pcall = pcall
function dostring (str)
	local f = loadstring(str)
	local flag, err = pcall(f)
	if not flag then
		print(--[[!AUTO_68]]"dostring failed: "..err)
	end
end

---------------------------------------------------------------------------------------
--调试类函数：可按ESC跳过游戏中所有CG
---------------------------------------------------------------------------------------
function HelpSystem:EscCanCloseALLCG()
	for k, v in pairs(CGList) do
		v.CanEscClose = true
	end
end
---------------------------------------------------------------------------------------
--调试类函数：检查角色是否掌握指定技能
---------------------------------------------------------------------------------------
function HelpSystem:GetSkillInfo(id)
	local skilllist = GameApi.GetSkillTable()
	for k, v in pairs(skilllist) do
		if k == id then
			return true
		end
	end
	return false
end

---------------------------------------其他---------------------------------------------

function HelpSystem:GetRandomMsg(dlgName)
	local n

	math.randomseed(os.time())
	math.random()
	n = math.random(1,#PET_RANDOM_HELP_TEXT)

	return PET_RANDOM_HELP_TEXT[n]
end

function HelpSystem:OutMsg(chid,chatstrig)
	GameApi.AddChatMessage(chid, chatstrig)
end

----------------------------------日夜交替测试--------------------------------------------
HelpSystem.delayTime = 0
HelpSystem.hour = 0
HelpSystem.min = 0

function HelpSystem:DN_Test(Delay, _hour, _min, step)
	HelpSystem.hour 	= _hour or 0
	HelpSystem.min 		= _min  or 0
	step				= step  or 1
	Delay				= Delay or 1000

	self:RegisterDataEvent(
	function (params)
		HelpSystem.delayTime = HelpSystem.delayTime + params.tick_time
		if HelpSystem.delayTime >= Delay then
			HelpSystem.min = HelpSystem.min + step
			if HelpSystem.min >= 60 then
				HelpSystem.min = 0
				HelpSystem.hour = HelpSystem.hour + 1
				if HelpSystem.hour == 24 then
					return --[[!AUTO_69]]"end"
				end
			end
			GameApi.RunConsoleCmd (string.format(--[[!AUTO_70]]"d_settimeofday %d %d", HelpSystem.hour, HelpSystem.min))
			HelpSystem.delayTime = 0
		end
	end, DataEvent.DATA_TIME)
end
----------------------
_G.HelpSystem = PLUN(HelpSystem, --[[!AUTO_71]]"HelpSystem")


--
-- Test begin
--~ do
--~ 	printTable({12},nil, "myt")
--~ end
-- Test end
--
