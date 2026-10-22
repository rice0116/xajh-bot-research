--[[#tag push auto]]

---------------------------------------------------------------
--  created:   2009.09.23
--  author:    daijunhua
--  描述:      和任务相关的脚本
-- 需要 gameevent.lua, text_link.lua

TaskHelp = {}

LAST_SYSTEM_HINT	=	{}
HINT_INIT_STRING	=	{}

LastBindString = --[[!AUTO_1]]""
LastBindTime = 0
LastHintTime = 0

LastWarnTime = 0

CurBindSeat = 0
BindSeatStartTime = 0
BindSeatEndTime = 0

CommonTargetStyle = --[[!AUTO_2]]"<前往>"
CoordTargetStyle = --[[!AUTO_3]]"座標"
ReachTargeStyle = --[[!AUTO_4]]"目的地"
TableString=--[[!AUTO_5]]"      "  --任务追踪前缀格式空格
--"坐标"，则显示数字
--"前往"，则显示汉字
--"目的地"，则显示目的地

TaskHelp.TaskType =
{
	TASK_TYPE_NORMAL  = 0,
	TASK_TYPE_PET	  = 6,
	TASK_TYPE_RING	  = 7,
	TASK_TYPE_SUBRING = 8,
}

--
--任务来源分类(原区域分类)
--
TaskHelp.Zone = {}

--程序返回地图区域列表
function TaskHelp:GetZoneMap()
	return TaskHelp.Zone
end

--程序返回地图区域排序
function TaskHelp:GetZoneOrder(idZone)
	for k,v in pairs(TaskHelp.Zone) do
		if v then
			if TaskHelp:IDInList(idZone,v.IDList) then
				return v.Order
			end
		end
	end
	return 0
end

--工具：检查ID是否在列表中
function TaskHelp:IDInList(id,tbl)
	for k,v in pairs(tbl) do
		if v then
			if v < 0 then
				break
			elseif v == id then
				return true
			end
		end
	end
	return false
end

--按SID返回区域名
function TaskHelp:GetZoneName(idZone)
	for k,v in pairs(TaskHelp.Zone) do
		if v then
			if TaskHelp:IDInList(idZone,v.IDList) then
				return k,v.ZoneName
			end
		end
	end
	return 99999999, TaskHelp.Zone[99999999].ZoneName
end

--任务来源分类，元素顺序决定显示顺序，任务模板记录id
TaskHelp.sourceTypeList = {}

-- 取得所有任务来源分类
function TaskHelp:GetSourceTypeList ()
	return TaskHelp.sourceTypeList
end

--剧情分类列表，元素顺序决定显示顺序，任务模板记录id
TaskHelp.storyTypeList = {}

-- 取得所有剧情分类
function TaskHelp:GetStoryTypeList ()
	return TaskHelp.storyTypeList
end

-- 物品类型列表，元素顺序决定显示顺序，任务模板列表id
TaskHelp.ivtrItemTypeList = {}

-- 取得所有物品分类
function TaskHelp:GetIvtrItemTypeList ()
	return TaskHelp.ivtrItemTypeList
end

--追踪方式列表，元素顺序决定显示顺序，任务模板记录id
TaskHelp.trackTypeList = {}

-- 取得所有追踪方式
function TaskHelp:GetTrackTypeList ()
	return TaskHelp.trackTypeList
end

--获取任务物品显示文字
function TaskHelp:GetTaskItemTip(item_num,is_choose_one,item_tbl)
	local sItemTip     = --[[!AUTO_6]]""
	local sItemTipHead = --[[!AUTO_7]]"任務需要上交下列物品之一：\r"
	for i=1,item_num do
		local idItem   = item_tbl[i]["ItemID"]
		local numItem  = item_tbl[i]["ItemNum"]
		local nameItem = item_tbl[i]["ItemName"]
		if item_num == 1 then
			sItemTipHead = --[[!AUTO_8]]"任務需要上交物品：\r"
			sItemTip     = sItemTip..string.format(--[[!AUTO_9]]"%s %d",nameItem,numItem)
		elseif is_choose_one == true	then
			sItemTipHead = --[[!AUTO_10]]"任務需要上交下列物品之一：\r"
			sItemTip     = sItemTip..string.format(--[[!AUTO_11]]"%s  %d",nameItem,numItem)..--[[!AUTO_12]]"\r"
		elseif is_choose_one == false	then
			sItemTipHead = --[[!AUTO_13]]"任務需要上交下列物品：\r"
			sItemTip = sItemTip..string.format(--[[!AUTO_14]]"%s %d",nameItem,numItem)..--[[!AUTO_15]]"\r"
		end
	end
	sItemTip = sItemTipHead..sItemTip
	return sItemTip
end

--开场白等颜色替换符号, #1 用于颜色代码, #2 用于生成链接颜色
TaskHelp.Color =  {}

--场景名称列表
TaskHelp.Scene = {}

--副本用途列表列表
TaskHelp.Instance = {}

--替换颜色字符，返回替换次数和最终字符串
function TaskHelp:RebuildString(s)
	local count = 0
	for k,v in pairs(TaskHelp.Color) do
		if v then
			local c = 0
			s , c = string.gsub(s,k,v[1]);
			count = count + c
		end
	end
	return count,s
end

--任务追踪相关

-- 取得任务处理标志   added  by yaojian
function TaskHelp:GetTaskFlag (taskid)
	local taskflag = 0

	if   taskid == 6771  or  taskid == 6793 or taskid == 7627 or  taskid == 7593  or taskid == 7594   or taskid == 7601  then
	    taskflag  = 1             -- 收集物品任务特殊处理，这些任务任务达成时不去掉任务目标文字
	else if   taskid == 7623  or  taskid == 7624 or taskid == 7625  or  taskid == 7626 then
	        taskflag  = 2             -- 规则组翟浩然要求，不显示任务追踪文字。
	     else  if taskid  ==  6650 then
	           taskflag  =3      -- 吕远要求
		   else   
	           taskflag  =  0
		   end
	     end
	end

	return  taskflag
end

--完成方式
TaskHelp.Method =
{
	enumTMNone               = 0,	--直接完成
	enumTMKillNumMonster     = 1,	--杀死怪物
	enumTMCollectNumArticle  = 2,	--收集道具
	enumTMTalkToNPC          = 3,	--与NPC对话
	enumTMReachSite          = 4,	--到达特定区域
	enumTMWaitTime           = 5,	--等待一定时间
	enumTMAnswerQuestion     = 6,	--(暂无)回答问题
	enumTMTinyGame           = 7,	--(暂无)小游戏
	enumTMProtectNPC         = 8,	--(暂无)保护NPC
	enumTMNPCReachSite       = 9,	--(暂无)NPC到达特定地点
	enumTMTitle              = 10,	--(暂无)收集称号
	enumTMCollection         = 11,	--(暂无)收集图鉴
	enumTMConvoyNPC          = 12,	--押镖
	enumTMEscortNPC		 	= 13,	--护送
	enumTMEventTrig		 	= 14,	--事件触发
	enumTMCollectEqualItem	= 15,	--收集等价物品
	enumTMDynamicTarget		= 16,	--目标由服务器动态生成
	enumTMHijackNPC			= 17,	--绑架特定怪物时可完成，交任务时解除绑架
	enumTMClientEvent = 18,			--客户端事件触发完成(服务器端无数据记录)
	enumTMKillNumPerson = 21,		--侵入外服杀指定数量的人 
	enumTMRobNumDart = 22,			--侵入外服劫持指定数量的镖车 
	enumTMFashionStyle = 25,		--时装风格搭配
}

local DYNAMIC_TARGET_TYPE = 	-- TaskDynamicTarget::TYPE
{
	INVALID = 0,
	ONEMONSTER = 1,
}

--完成条件
TaskHelp.FinishType =
{
	enumTFTDirect		= 0,	--直接完成
	enumTFTNPC		= 1,	--找NPC对话完成
}

TaskHelp.enumEICoord = 2
TaskHelp.enumEICustomSystem = 7
TaskHelp.EICoordTag  = --[[!AUTO_16]]""

--寻路链接
function TaskHelp:GetCoordTag()
	if #TaskHelp.EICoordTag <= 0 then
		TaskHelp.EICoordTag = GameApi.GetCoordTag()
	end
	return TaskHelp.EICoordTag
end

--[[ typeTarget:
	TARGET_NONE    = 0,  无
	TARGET_NPC     = 1,  NPC
	TARGET_MONSTER = 2,  怪物
	TARGET_MINE    = 3,  矿
	TARGET_ITEM    = 4,  物品
	TARGET_POS     = 5,  特定位置
--]]
TaskHelp.TARGET_NONE    = 0
TaskHelp.TARGET_NPC     = 1
TaskHelp.TARGET_MONSTER = 2
TaskHelp.TARGET_MINE    = 3
TaskHelp.TARGET_ITEM    = 4
TaskHelp.TARGET_POS     = 5
TaskHelp.TARGET_ORIENTPOS     = 8

TaskHelp.KillMonsterById    = 0
TaskHelp.KillMonsterByLevel = 1

TaskHelp.NormalTaskType     = 0
TaskHelp.WeiWuTaskType      = 1

MapOffset = {}

TaskHelp.TaskState =
{
	TASK_STATE_FINISHED		= 0x01,		--是否完成
	TASK_STATE_SUCCESS		= 0x02,		--是否成功
	TASK_STATE_GIVEUP		= 0x04,		--是否放弃
	TASK_STATE_ERR_REPORTED		= 0x08,		--是否已把错误发送到客户端
	TASK_STATE_AWARD_NOTIFY_TEAM	= 0x10,		--是否已把奖励通知队员
	TASK_STATE_AWARD_FAMILY		= 0x20,		--是否已发放家族相关奖励
	TASK_STATE_HIDDEN		= 0x40,		--隐藏任务
	TASK_STATE_ALARM		= 0x80,		--警告状态
}

TaskHelp.AutoSearchRangeTargetType =
{
	Mine = 1,		--TaskHelp.TARGET_MINE, targetId 为矿tid
	ItemFromMine = 2,		--TARGET_ITEM, targetId 为任务ID
}

--任务寻径限定范围, 格式: { [AutoSearchRangeTargetType] = {[targetId] = {radius=范围大小, min_dist=小于此距离则无视限定, {x1, z1}, {x2, z2}, ...} }
TaskHelp.AutoSearchRange =
{
}

function TaskHelp:GetAllAutoSearchRange()
	local hashstr = (--[[!AUTO_17]]"SpecialAutoSearchRange %u"):format(GameApi.GetRoleID())
	local hash = GameApi.HashWString(hashstr)

	local retTable = {}
	for targetType, ranges in pairs(TaskHelp.AutoSearchRange) do
		local oneTypeRange = {}
		retTable[targetType] = oneTypeRange

		for tid, range in pairs(ranges) do
			if tid ~= 0 and #range > 0 then
				local index = (hash + tid % 31) % #range + 1
				print(--[[!AUTO_18]]"index", index)
				local pos = range[index]
				oneTypeRange[tid] =
				{
					radius = range.radius,
					min_dist = range.min_dist,
					x = pos[1], z = pos[2],
				}
			end
		end
	end

	return retTable
end

--任务特殊界面, 格式: { [taskId] = {delv=接任务界面名, complete=完成任务界面名} }. 可以只有delv, complete中一项
TaskHelp.SpeicalInterface =
{
}

function TaskHelp:GetSpecialReceiveInterface(taskId)
	return self.SpeicalInterface[taskId]
end

local SERVICE_TYPE =
{
	NPC_GIVE_TASK = 0x80000006,
	NPC_COMPLETE_TASK = 0x80000007,
}

function TaskHelp:GetSpecialInterface (taskId, serviceType)
	local config = self.SpeicalInterface[taskId]
	if config then
		if serviceType == SERVICE_TYPE.NPC_GIVE_TASK then
			return config.delv
		else
			return config.complete
		end
	end
end

--获取地图偏移量
function TaskHelp:GetMapOffset(idMap)
	if MapOffset[idMap] == nil then
		local x_offset,z_offset = GameApi.GetMapOffset(idMap)
		MapOffset[idMap] = {}
		MapOffset[idMap].x_offset = x_offset
		MapOffset[idMap].z_offset = z_offset
	end
	return MapOffset[idMap].x_offset, MapOffset[idMap].z_offset
end

local l_curTaskInfo = { taskId = 0, }	--当前任务信息(免于调用所有链接生成函数时传任务ID)

--idFrom 表示 idTarget的来源,只用作杀怪或者杀怪收集物品的怪物ID
--strName，临时加上的地图链接显示
function TaskHelp:BuildPathLink(x,y,z,mapid,clr,typeTarget,idTarget,idFrom,strName)
	strName = strName or --[[!AUTO_19]]""
	if mapid > 0 then
		if strName == --[[!AUTO_20]]"座標" then
			local x_offset,z_offset = TaskHelp:GetMapOffset(mapid)
			local info = string.format(--[[!AUTO_21]]"%f %f %f %d %d %d %d",x-x_offset,y,z-z_offset,mapid,typeTarget,idTarget,idFrom)
			local name = string.format(--[[!AUTO_22]]"%d,%d",x-x_offset + 0.5,z-z_offset + 0.5)
			return string.format(--[[!AUTO_23]]"%s<%d><%d><%s><%s>",TaskHelp:GetCoordTag(),TaskHelp.enumEICoord,clr,name,info)
		else
			local x_offset,z_offset = TaskHelp:GetMapOffset(mapid)
			local info = string.format(--[[!AUTO_24]]"%f %f %f %d %d %d %d",x-x_offset,y,z-z_offset,mapid,typeTarget,idTarget,idFrom)
			--[[链接含地名的写法
			local name = string.format("[%s]%s",TaskHelp.Scene[mapid] or "",strName or "")
			]]
			local i,j = string.find(strName, --[[!AUTO_25]]"目的地")
			local name = string.format(--[[!AUTO_26]]"%s",strName or --[[!AUTO_27]]"")
			if i then
				name = string.format(--[[!AUTO_28]]"<%s>",strName or --[[!AUTO_29]]"")
			end
			return string.format(--[[!AUTO_30]]"%s<%d><%d><%s><%s>",TaskHelp:GetCoordTag(),TaskHelp.enumEICoord,clr,name,info)
		end
	else	--无寻径信息
		return strName
	end
end

function TaskHelp:AddSystemHint (str)
	GameApi.AddSystemHint(self:TargetToPlainText(str))
end

--[[host_prop_tbl表字段说明
"name"
"prof"
"prof2"
"proflevel"
"proflevel2"
"gender"
"level"
"hp"
"mp1"
"mp2"
"maxhp"
"maxmp1"
"maxmp2"
"pklevel"
"teamleaderid"
"masterid"
]]

--[[task_info_tbl表字段说明
"Index"              int      任务显示本组的索引,从1开始
"ID"                 int      任务ID
"Name"               string   任务名称
"IsMainStory"		 bool	  是否主线任务
"Have"               bool     是否已接任务
"ZoneType"           int      区域ID
"SuitableLevel"      int      推荐等级
"IsTrack"		bool	  是否为任务追踪面板
"Type"			int      表示任务类型,类型定义参照上面的TaskHelp.TaskType
"SpecialType"		int      表示任务特殊类型(0表示普通,1表示威武令任务)
"RingId"             int      环节任务所属的环id
"RingIndex"          int      环节任务所属的环索引
"FinishRingNum"      int      开环任务的完成环数
"TotalRingNum"       int      开环任务的环数
"CurSubTask"         int      开环任务当前的环节任务id
"NextSubTask"		 int      开环任务下一个环节任务id
"NextDelvNpc"		 int      开环任务下一个环节任务的发放npc
"NextAwardNpc"       int	  开环任务下一个环节任务的完成npc
"Method"             int      完成方式,TaskHelp.Method的一种
"FinishType"         int      完成条件,TaskHelp.FinishType的一种
"CanFinish"          bool     是否可完成
"Tribute"            string   推荐说明
"DelvNpc"            int      任务发放NPC
"DelvNpcName"        string   任务发放NPC
"AwardNpc"           int      任务验证完成NPC
"AwardNpcName"       string   任务验证完成NPC
"TalkNpc"            int      对话Npc
"TalkNpcName"        string   对话Npc
"HaveSceneLimit"     bool     场景限制
"HaveLifeLimit"      bool     生存限制
"HaveTimeLimit"      bool     时间限制
"TimeLimit"          int      限制时间(单位:秒)
"TimePassed"         int      时间限制的已过时间
"WaitTime"           int      等待特定时间(单位:秒)
"FinishLev"          int	   完成所需等级(0:无限制)
"Target"             string   任务目标描述
"NPCToProtect"       int      保护NPC
"ProtectTimeLen"     int      保护NPC的时长
"ReachWorldId"       int      到达的世界ID
"ReachSceneId"       int      到达的场景ID
"ReachSiteMin_X"     float    到达最小点X坐标
"ReachSiteMin_Y"     float    到达最小点Y坐标
"ReachSiteMin_Z"     float    到达最小点Z坐标
"ReachSiteMax_X"     float    到达最大点X坐标
"ReachSiteMax_Y"     float    到达最大点Y坐标
"ReachSiteMax_Z"     float    到达最大点Z坐标
"GoldWantedNum"      int      需要钱数
"TitleWantedNum"     int      收集称谓
"Title_%d"           int      称谓的ID,%d表示索引,从1开始
"CollWantedNum"      int      收集图鉴
"Coll_%d"            int      图鉴的ID,%d表示索引,从1开始
"MonsterWantedNum"   int      杀怪数目
"KillType_%d"		 int      杀怪计数方式(0表示按特定ID杀怪,1表示按等级区间杀怪)
"MonsterID_%d"       int      怪物ID,%d表示索引,从1开始
"MonsterMinLevel_%d" int      等级区间杀怪的最小等级
"MonsterMaxLevel_%d" int      等级区间杀怪的最大等级
"MonsterName_%d"     string   怪物名称,%d表示索引,从1开始
"MonsterKilled_%d"   int      已杀怪物数目
"MonsterToKill_%d"   int      所需杀怪数目
"ItemsWantedNum"     int      收集物品数目
"ItemID_%d"          int      物品ID,%d表示索引,从1开始
"ItemName_%d"        string   物品名称,%d表示索引,从1开始
"ItemMonsterID_%d"   int      物品来源怪物ID(杀怪所得),%d表示索引,从1开始
"ItemMonsterName_%d" string   物品来源怪物名称(杀怪所得),%d表示索引,从1开始
"ItemGain_%d"        int      已获得物品数目
"ItemToGet_%d"       int      所需物品总数,%d表示索引,从1开始
"EventTrigValid_%d"  bool	事件触发是否有效,从1开始(max 4)
"EventTrigType_%d"   int	事件触发类型,从1开始(max 4)
"EventTrigDesc_%d"	string	事件触发描述,从1开始(max 4)
"EventTrig_%d_Param_%d" int	事件触发参数,从1开始(max 4) ,从1开始(max 4)
"EventTrigCount_%d"	int	事件触发计数 ,从1开始(max 4)
"BeckonNPCId_%d"	int	召唤NPCid
"BeckonNPCName_%d"	int	召唤NPC名字
"ConvoyNPC"		int	护送NPCid
"ConvoyNPCName"		string	护送NPC名字
"EscortNPC"		int	押镖NPCid
"EscortNPCName"		string	押镖NPC名字
"EscortTargetSceneID"	int	押镖终点场景ID
"EscortTargetInstanceID"	int	押镖终点副本ID
"EscortTargetMin_X"	float	押镖终点最小X
"EscortTargetMin_Y"	float	押镖终点最小Y
"EscortTargetMin_Z"	float	押镖终点最小Z
"EscortTargetMax_X"	float	押镖终点最大X
"EscortTargetMax_Y"	float	押镖终点最大Y
"EscortTargetMax_Z"	float	押镖终点最大Z
"TaskState"		mask	任务状态，见下
"BindID"		int	绑定ID
"BindName"		string	绑定对象名称
"IsRecFinishCount"	bool	是否记录完成结果
"MaxFinishCount"	bool	最大完成次数
"FinishCount"		bool	已完成次数
"DynamicTargetType"	int		当完成方式为 enumTMDynamicTarget 时，表示动态目标的类型，数据见 DYNAMIC_TARGET_TYPE
"HijackNPC"			int		当完成方式为 enumTMHijackNPC 时，表示当前劫持的NPC tid
"HijackNPCName"		string	劫持的NPC名字
"NeedFashion_%d"	int 	需要的时装风格ID
"GetFashion_%d"     bool 	需要的时装风格是否获取到 
--]]

--[[ TaskState
//各种逻辑宏定义
#define	TASK_STATE_FINISHED		0x01	// 是否完成
#define	TASK_STATE_SUCCESS		0x02	// 是否成功
#define	TASK_STATE_GIVEUP		0x04	// 是否放弃
#define	TASK_STATE_ERR_REPORTED		0x08	// 是否已把错误发送到客户端
#define	TASK_STATE_AWARD_NOTIFY_TEAM	0x10	// 是否已把奖励通知队员
#define	TASK_STATE_AWARD_FAMILY		0x20	// 是否已发放家族相关奖励
#define	TASK_STATE_HIDDEN		0x40	// 隐藏任务
#define TASK_STATE_ALARM		0x80	// 警告状态
	bit.band（stat,0x80） == 0x80
]]

function TaskHelp:TaskTrack(task_tbl,host_prop_tbl)
	l_curTaskInfo.taskId = task_tbl.ID

	task_tbl["TaskOrder"] = 0
	local idCurScene = GameApi.GetSceneID()
	if task_tbl["Type"] == TaskHelp.TaskType.TASK_TYPE_RING then
		local task_name   = --[[!AUTO_31]]""
		local task_info   = --[[!AUTO_32]]""
		local task_target = --[[!AUTO_33]]""
		local task_warn   = --[[!AUTO_34]]""
		if task_tbl["CurSubTask"] == 0 and task_tbl["NextSubTask"] > 0 and task_tbl["NextDelvNpc"] > 0 and task_tbl["FinishRingNum"] < task_tbl["TotalRingNum"] then
			--task_name = string.format("%s(%d/%d)",task_tbl["Name"],task_tbl["FinishRingNum"],task_tbl["TotalRingNum"])
			--task_name	  = task_tbl["Name"];

			local is_track = task_tbl["IsTrack"]
			local color = is_track and --[[!AUTO_35]]"^ffffff" or --[[!AUTO_36]]"^000000"
			local regionColor = is_track and TaskHelp.Color["@区域名@"][1] or --[[!AUTO_37]]"^000000"
			local npcColor = is_track and TaskHelp.Color["@NPC名@"][1] or --[[!AUTO_38]]"^000000"
			local linkColor = is_track and TaskHelp.Color["@寻径@"][1] or TaskHelp.Color["@寻径2@"][1]

			local delvNpc     = task_tbl["NextDelvNpc"]
			local delvNpcName = task_tbl["NextDelvNpcName"]
			local delvNpcZone,delv_x,delv_y,delv_z,delv_mapid,delv_objname = TaskHelp:GetNpcPos(delvNpc)
			local delvNpcLink = TaskHelp:BuildPathLink(delv_x,delv_y,delv_z,delv_mapid,linkColor,TaskHelp.TARGET_NPC,delvNpc,delvNpc,delvNpcName)

			if idCurScene == delv_mapid then
				task_tbl["TaskOrder"] = 1
				task_info = string.format(--[[!AUTO_39]]"%s去找%s%s%s接下一環任務",color,npcColor,delvNpcLink,color)
			else
				task_info = string.format(--[[!AUTO_40]]"%s去%s%s%s找%s%s%s接下一環任務",color,regionColor,delvNpcZone,color,npcColor,delvNpcLink,color)
			end
		end
		return TaskHelp:TaskTrack_Name(task_tbl,host_prop_tbl),task_info,task_target,task_warn
	end
	return TaskHelp:TaskTrack_Name(task_tbl,host_prop_tbl),
		   TaskHelp:TaskTrack_Info(task_tbl,host_prop_tbl),
		   TaskHelp:TaskTrack_Target(task_tbl,host_prop_tbl),
		   TaskHelp:TaskTrack_Warn(task_tbl,host_prop_tbl),
		   task_tbl["TaskOrder"]
end

--返回Npc的区域名称,x,y,z,mapid坐标
function TaskHelp:GetNpcPos(idNpc)
	if idNpc > 0 and ObjInfo[idNpc] then
		return TaskHelp.Scene[ObjInfo[idNpc].SID or 0] or --[[!AUTO_41]]"" ,ObjInfo[idNpc].x ,ObjInfo[idNpc].y ,ObjInfo[idNpc].z ,ObjInfo[idNpc].SID ,ObjInfo[idNpc].name
	end
	return --[[!AUTO_42]]"",0,0,0,0,--[[!AUTO_43]]""
end

--返回场景名称
function TaskHelp:GetReachZoneName(idTask,idScene)
	if TaskHelp.Scene[idScene] then
	    return TaskHelp.Scene[idScene]
	end
	return TaskHelp.Color["@粉红@"][1] .. idScene
	--[[按Scene找场景名、找不到SID的提示
	if SceneNameInfo[idScene] then
	    return SceneNameInfo[idScene].name
	end
	return string.format("%s(SceneNameInfo无此地图名:ID=%s)",TaskHelp.Color["@粉红@"][1],idScene)
	]]
end

--返回任务物品来源类型,来源id,坐标
function TaskHelp:GetItemInfo(idItem)
	if ObjInfo[idItem] then
		return TaskHelp.Scene[ObjInfo[idItem].SID or 0] or --[[!AUTO_44]]"" ,ObjInfo[idItem].x ,ObjInfo[idItem].y ,ObjInfo[idItem].z ,ObjInfo[idItem].SID
	end
	return --[[!AUTO_45]]"",0,0,0,0
end

--返回任务相关NPC位置
function TaskHelp:GetTaskNPCPosition(id_npc)
	if ObjInfo[id_npc] then
		return TaskHelp.Scene[ObjInfo[idNpc].SID or 0] or --[[!AUTO_46]]"",ObjInfo[id_npc].x,ObjInfo[id_npc].y,ObjInfo[id_npc].z,ObjInfo[id_npc].SID
	end
	return --[[!AUTO_47]]"",0,0,0,0
end

--返回任务相关怪物位置
function TaskHelp:GetTaskMonsterPosition(id_monster)
	if ObjInfo[id_monster] then
		return TaskHelp.Scene[ObjInfo[id_monster].SID or 0] or --[[!AUTO_48]]"",ObjInfo[id_monster].x,ObjInfo[id_monster].y,ObjInfo[id_monster].z,ObjInfo[id_monster].SID
	end
	return --[[!AUTO_49]]"",0,0,0,0
end

--返回任务相关矿物位置
function TaskHelp:GetTaskMinePosition(id_mine)
	if ObjInfo[id_mine] then
		return TaskHelp.Scene[ObjInfo[id_mine].SID or 0] or --[[!AUTO_50]]"",ObjInfo[id_mine].x,ObjInfo[id_mine].y,ObjInfo[id_mine].z,ObjInfo[id_mine].SID
	end
	return --[[!AUTO_51]]"",0,0,0,0
end

--返回任务相关物品位置
function TaskHelp:GetTaskItemPosition(id_item)
	if ObjInfo[id_item] then
		return TaskItemList[id_item].sourcetype,TaskItemList[id_item].sourceID,TaskItemList[id_item].scene,TaskItemList[id_item].SID,TaskItemList[id_item].x,TaskItemList[id_item].y,TaskItemList[id_item].z
	end
	return 0,0,--[[!AUTO_52]]"",0,0,0,0
end

--获得任务的怪物信息
function TaskHelp:TaskTrack_MonsterInfo(task_tbl,idx,host_prop_tbl)
	l_curTaskInfo.taskId = task_tbl.ID

	local idCurScene = GameApi.GetSceneID()
	local info = --[[!AUTO_53]]""
	local finishstr = --[[!AUTO_54]]""
	local hintInfo
	local hintStr = --[[!AUTO_55]]""
	local key = string.format(--[[!AUTO_56]]"MonsterID_%d",idx)
	local hintColor = TaskHelp.Color[--[[!]]"@白色@"][1]
	local kill_type_key = string.format(--[[!AUTO_57]]"KillType_%d",idx)
	local KillMonsterOverServer = task_tbl["KillMonsterOverServer"]
	local sFomatKill = ""
	local sFomatPick = ""
	if task_tbl[kill_type_key] then
		--等级区间杀怪
		sFomatKill = (KillMonsterOverServer and "目標：前往敵服擊殺") or "擊殺"
		if task_tbl[kill_type_key] == TaskHelp.KillMonsterByLevel then
			local killed   = task_tbl[string.format(--[[!AUTO_58]]"MonsterKilled_%d",idx)]
			local tokill   = task_tbl[string.format(--[[!AUTO_59]]"MonsterToKill_%d",idx)]
			local minlevel =  task_tbl[string.format(--[[!AUTO_60]]"MonsterMinLevel_%d",idx)]
			local maxlevel =  task_tbl[string.format(--[[!AUTO_61]]"MonsterMaxLevel_%d",idx)]
			if killed ~= nil and tokill ~= nil then
				local color = TaskHelp.Color[--[[!]]"@未完成@"][1]
				if killed == tokill then
					color = TaskHelp.Color[--[[!]]"@已完成@"][1]
				end
				if killed <= tokill then
					if killed == tokill then
						hintColor = TaskHelp.Color[--[[!]]"@任务完成状态@"][1]
						hintStr = --[[!AUTO_62]]"完成："
					end
					if tokill == 1 then
						hintInfo = string.format(--[[!AUTO_63]]"%s%s已擊殺：[%d-%d]級怪物(%d/%d)",hintColor,hintStr,minlevel,maxlevel,killed,tokill)
					else
						hintInfo = string.format(--[[!AUTO_64]]"%s%s已擊殺：%d個[%d-%d]級怪物(%d/%d)",hintColor,hintStr,killed,minlevel,maxlevel,killed,tokill)
					end
					if type(LAST_SYSTEM_HINT[task_tbl["ID"]]) ~= --[[!AUTO_65]]"table" then
						HINT_INIT_STRING[task_tbl["ID"]]={}
						LAST_SYSTEM_HINT[task_tbl["ID"]]={}
					end

					--if HINT_INIT_STRING[task_tbl["ID"]][idx] ~= 1 then
					if killed == 0 then
						HINT_INIT_STRING[task_tbl["ID"]][idx] = 1
						LAST_SYSTEM_HINT[task_tbl["ID"]][idx] = hintInfo
					end
					if hintInfo ~= LAST_SYSTEM_HINT[task_tbl["ID"]][idx] and killed ~= 0 and hintInfo ~= --[[!AUTO_66]]"" and (not task_tbl["Target"])  then
					    TaskHelp:AddSystemHint(hintInfo)
					    LAST_SYSTEM_HINT[task_tbl["ID"]][idx] = hintInfo
					end
				end
				if minlevel == maxlevel then
					return string.format(--[[!AUTO_67]]"%s" .. sFomatKill.."任意%d級怪物(%d/%d)",color, minlevel,killed,tokill)
				else
					return string.format(--[[!AUTO_68]]"%s" .. sFomatKill.."任意%d-%d級怪物(%d/%d)",color, minlevel ,maxlevel,killed,tokill)
				end
			end
		end
	else
		return info
	end

	if task_tbl[key] and task_tbl[key] > 0 then
		local id     = task_tbl[key]
		local name   = task_tbl[string.format(--[[!AUTO_69]]"MonsterName_%d",idx)]
		local killed = task_tbl[string.format(--[[!AUTO_70]]"MonsterKilled_%d",idx)]
		local tokill = task_tbl[string.format(--[[!AUTO_71]]"MonsterToKill_%d",idx)]
		local color = TaskHelp.Color[--[[!]]"@未完成@"][1]
		local zone,x,y,z,mapid,objname = TaskHelp:GetNpcPos(id)
		local link = --[[!AUTO_72]]""
		if task_tbl["IsTrack"] then
			link = TaskHelp:BuildPathLink(x,y,z,mapid,TaskHelp.Color[--[[!]]"@寻径@"][1],TaskHelp.TARGET_MONSTER,id,id,name)
		else
			link = TaskHelp:BuildPathLink(x,y,z,mapid,TaskHelp.Color[--[[!]]"@寻径2@"][1],TaskHelp.TARGET_MONSTER,id,id,name)
		end
		if killed >= tokill then
			color = TaskHelp.Color[--[[!]]"@已完成@"][1]
			link = --[[!AUTO_73]]""
			finishstr = --[[!AUTO_74]]""
			info = --[[!AUTO_75]]""
		else
			if zone == --[[!AUTO_76]]"" then
				info = string.format("%s"..sFomatKill.."%s%s[%s]%s(%d/%d)",color,finishstr,color,link,color,killed,tokill)
			else
				if idCurScene == mapid then
					task_tbl["TaskOrder"] = 1
					--LogPrint(link)
					info = string.format(--[[!AUTO_78]]"%s" .. sFomatKill.."%s%s(%d/%d)",color,link,color,killed,tokill)
				else
					info = string.format(--[[!AUTO_79]]"%s" .. sFomatKill.."%s%s%s%s的%s%s(%d/%d)",color,finishstr,TaskHelp.Color["@区域名@"][1],zone,color,link,color,killed,tokill)
				end
			end
		end

		if killed <= tokill then
			if killed == tokill then
				hintColor = TaskHelp.Color["@任务完成状态@"][1]
				hintStr = --[[!AUTO_80]]"完成："
			end
			if tokill == 1 then
				hintInfo = string.format(--[[!AUTO_81]]"%s%s已擊殺：%s",hintColor,hintStr,name)
			else
				hintInfo = string.format(--[[!AUTO_82]]"%s%s已擊殺：%d個%s(%d/%d)",hintColor,hintStr,killed,name,killed,tokill)
			end
			if type(LAST_SYSTEM_HINT[task_tbl["ID"]]) ~= --[[!AUTO_83]]"table" then
    				HINT_INIT_STRING[task_tbl["ID"]]={}
    				LAST_SYSTEM_HINT[task_tbl["ID"]]={}
    			end

			--if HINT_INIT_STRING[task_tbl["ID"]][idx] ~= 1 then
			if killed == 0 then
				HINT_INIT_STRING[task_tbl["ID"]][idx] = 1
			  	LAST_SYSTEM_HINT[task_tbl["ID"]][idx] = hintInfo
			end

			if hintInfo ~= LAST_SYSTEM_HINT[task_tbl["ID"]][idx] and killed ~= 0 and hintInfo ~= --[[!AUTO_84]]"" and (not task_tbl["Target"])  then
				TaskHelp:AddSystemHint(hintInfo)
				LAST_SYSTEM_HINT[task_tbl["ID"]][idx] = hintInfo
			end
		end
	else
		sFomatPick = (kill_invade and "目標：前往敵服奪取") or "奪取"
		key = string.format(--[[!AUTO_85]]"ItemID_%d",idx)
		if task_tbl[key] and task_tbl[key] > 0 then
			local id     = task_tbl[key]
			local name   = task_tbl[string.format(--[[!AUTO_86]]"ItemName_%d",idx)]
			local gain   = task_tbl[string.format(--[[!AUTO_87]]"ItemGain_%d",idx)]
			local toget  = task_tbl[string.format(--[[!AUTO_88]]"ItemToGet_%d",idx)]
			local mon_id = task_tbl[string.format(--[[!AUTO_89]]"ItemMonsterID_%d",idx)]
			local mon_name = task_tbl[string.format(--[[!AUTO_90]]"ItemMonsterName_%d",idx)]
			local color = TaskHelp.Color[--[[!]]"@未完成@"][1]
			local zone,x,y,z,mapid,objname = TaskHelp:GetNpcPos(mon_id)
			local link = --[[!AUTO_91]]""
			if task_tbl["IsTrack"] then
				link = TaskHelp:BuildPathLink(x,y,z,mapid,TaskHelp.Color[--[[!]]"@寻径@"][1],TaskHelp.TARGET_MONSTER,mon_id,mon_id,mon_name)
			else
				link = TaskHelp:BuildPathLink(x,y,z,mapid,TaskHelp.Color[--[[!]]"@寻径2@"][1],TaskHelp.TARGET_MONSTER,mon_id,mon_id,mon_name)
			end
			--local izone,ix,iy,iz,imapid,iobjname = TaskHelp:GetItemInfo(id)
			local itemlink
			-- = TaskHelp:BuildPathLink(ix,iy,iz,imapid,TaskHelp.Color["@寻径@"][1],TaskHelp.TARGET_ITEM,0,0,name)

			if ObjInfo[id] then
				zone,x,y,z,mapid = TaskHelp:GetItemInfo(id)
				if task_tbl["IsTrack"] then
					itemlink = TaskHelp:BuildPathLink(x,y,z,mapid,TaskHelp.Color[--[[!]]"@寻径@"][1],TaskHelp.TARGET_ITEM,id,mon_id,name)
				else
					itemlink = TaskHelp:BuildPathLink(x,y,z,mapid,TaskHelp.Color[--[[!]]"@寻径2@"][1],TaskHelp.TARGET_ITEM,id,mon_id,name)
				end
			else
				itemlink = TaskHelp.Color[--[[!]]"@粉红@"][1] .. name
				--[[
				itemlink = string.format("%s(ObjInfo无此物品:ID=%s)",TaskHelp.Color["@粉红@"][1],id)
				]]
			end

			if gain >= toget then
				color = TaskHelp.Color[--[[!]]"@已完成@"][1]
				link = --[[!AUTO_92]]""
				finishstr = --[[!AUTO_93]]""
				--itemlink = ""
				info = --[[!AUTO_94]]""
			else
				local taskflag     =  TaskHelp:GetTaskFlag (task_tbl["ID"])
				if idCurScene == mapid then
					task_tbl["TaskOrder"] = 1
					if  taskflag  ==  3  then
						info = string.format(--[[!AUTO_95]]"%s%s" ..sFomatPick.. "%s%s(%d/%d)",color,finishstr,itemlink,color,gain,toget)
					else 
						info = string.format(--[[!AUTO_95]]"%s%s" ..sFomatPick.. "%s的%s%s(%d/%d)",color,finishstr,mon_name,itemlink,color,gain,toget)
					end
				else
					if  taskflag  ==  3  then
						info = string.format(--[[!AUTO_96]]"%s%s" ..sFomatPick.. "%s%s%s%s%s(%d/%d)",color,finishstr,TaskHelp.Color[--[[!]]"@区域名@"][1],zone,color,itemlink,color,gain,toget)
					else
						info = string.format(--[[!AUTO_96]]"%s%s" ..sFomatPick.. "%s%s%s%s的%s%s(%d/%d)",color,finishstr,TaskHelp.Color[--[[!]]"@区域名@"][1],zone,color,mon_name,itemlink,color,gain,toget)
					end 
				end
			end

			if gain <= toget then
    				if gain == toget then
    					hintColor = TaskHelp.Color[--[[!]]"@任务完成状态@"][1]
    					hintStr = --[[!AUTO_97]]"完成："
    				end
    				if toget == 1 then
    		    			hintInfo = string.format(--[[!AUTO_98]]"%s%s已奪取：%s",hintColor,hintStr,name)
				else
		    			hintInfo = string.format(--[[!AUTO_99]]"%s%s已奪取：%d個%s(%d/%d)",hintColor,hintStr,gain,name,gain,toget)
    				end
    				if type(LAST_SYSTEM_HINT[task_tbl["ID"]]) ~= --[[!AUTO_100]]"table" then
    					HINT_INIT_STRING[task_tbl["ID"]]={}
    					LAST_SYSTEM_HINT[task_tbl["ID"]]={}
    				end

    				--if HINT_INIT_STRING[task_tbl["ID"]][idx] ~= 1 then
				if gain == 0 then
					HINT_INIT_STRING[task_tbl["ID"]][idx] = 1
    					LAST_SYSTEM_HINT[task_tbl["ID"]][idx] = hintInfo
    				end

				if hintInfo ~= LAST_SYSTEM_HINT[task_tbl["ID"]][idx] and gain ~= 0 and hintInfo ~= --[[!AUTO_101]]"" and (not task_tbl["Target"]) then
			    		TaskHelp:AddSystemHint(hintInfo)
			    		LAST_SYSTEM_HINT[task_tbl["ID"]][idx] = hintInfo
				end
			end
		end
	end
	return info
end

--是否需要转换为物品链接
function TaskHelp:IsItemLink(ID)
	if ItemInfo[ID] then
		if ItemInfo[ID]["MonsterLoot"]
		or	ItemInfo[ID]["RecipeItem"]
		or	ItemInfo[ID]["NpcSell"]
		or	ItemInfo[ID]["Text"] then
		return true
		end
	end
	return false
end

local TaskHelp_linkType =
{
	[1] = {
			--[[!AUTO_102]]"ItemID_",
			function(ID)
				HelpSystemApi.ShowHelpUI(--[[!AUTO_103]]"Help_ALLWords", 20, -250)
				Help_ALLWords:ShowItem(ID)
			end
		  },
	[2] = {
			--[[!AUTO_104]]"MonsterID_",
			function(ID)
				GameApi.ShowMonsterDesc(tonumber(ID))
			end
		  },
	[3] = {
			--[[!AUTO_105]]"NpcID_",
			function(ID)
				TaskHelp:GetNpcInfo(tonumber(ID))
			end
		  },
	[4] = {
			--[[!AUTO_106]]"SpecialID_",
			function(UIname)
				local list = {}
				list["Help_ChooseWay"] = {x = -1, y = -150}
				list["Help_ChooseMenPai"] = {x = -1, y = -1}
				HelpSystemApi.ShowHelpUI(list[UIname], list[UIname].x, list[UIname].y)
			end
		  },
}
------------------------------------
-- 自动寻径
------------------------------------
function TaskHelp:GetNpcInfo(id)
	local typeTarget = ObjInfo[id].objtype
	local idTarget = id
	local idFrom = ObjInfo[id].souceID
	local x = ObjInfo[id].x
	local y = ObjInfo[id].y
	local z = ObjInfo[id].z
	local mapid = ObjInfo[id].SID
	GameApi.AutoSearchPathWithScriptCB( typeTarget, idTarget, idFrom, x, y, z, mapid );
	return true
end
-----------------------------------------------
--点击链接处理
-----------------------------------------------
function TaskHelp:OnLinkClick(info)
	return TextLink:OnClickCustomLuaLink(info)
end

function TaskHelp:BuildItemLink(ID,IsTrack)
	local ItemName, iQuality = GameApi.GetItemInfo(ID)
	local link = --[[!AUTO_107]]""
	if IsTrack == true then
		link = GameApi.GenerateCustomLuaLink(ItemName, string.format(--[[!AUTO_108]]"%s%d", --[[!AUTO_109]]"ItemID_", ID), 0xffc000)
	else
		link = GameApi.GenerateCustomLuaLink(ItemName, string.format(--[[!AUTO_110]]"%s%d", --[[!AUTO_111]]"ItemID_", ID), 0x0059ab)
	end
	return link
end

function TaskHelp:BuildNpcLink(ID, NpcName, NotTrack)
	local link = --[[!AUTO_112]]""
	link = GameApi.GenerateCustomLuaLink(NpcName, string.format(--[[!AUTO_113]]"%s%d", --[[!AUTO_114]]"NpcID_", ID), NotTrack and 0x0059ab or 0xffc000)
	return link
end

function TaskHelp:BuildSpecialLink(UIname, Link)
	link = GameApi.GenerateCustomLuaLink(Link, string.format(--[[!AUTO_115]]"%s%d", --[[!AUTO_116]]"SpecialID_", UIname), 0xffc000)
	return link
end
--------------------获取LinkL类型---------------
function TaskHelp:GetLinkType(info)
	for k,v in pairs(TaskHelp_linkType) do
		local i, j = string.find(info, v[1])
		if i then
			return k
		end
	end
	return --[[!AUTO_117]]""
end

--获得任务的收集物品信息
function TaskHelp:TaskTrack_ItemInfo(task_tbl,idx,host_prop_tbl)
	l_curTaskInfo.taskId = task_tbl.ID

	local idCurScene = GameApi.GetSceneID()
	local info = --[[!AUTO_118]]""
	local key = string.format(--[[!AUTO_119]]"ItemID_%d",idx)
	local hintInfo
	local hintStr = --[[!AUTO_120]]""
	local hintColor = TaskHelp.Color[--[[!]]"@白色@"][1]
	local finishstr = --[[!AUTO_121]]""

	if task_tbl[key] and task_tbl[key] > 0 then
		local id     = task_tbl[key]
		local name   = task_tbl[string.format(--[[!AUTO_122]]"ItemName_%d",idx)]
		local fromid = task_tbl[string.format(--[[!AUTO_123]]"ItemMonsterID_%d",idx)]
		local fname  = task_tbl[string.format(--[[!AUTO_124]]"ItemMonsterName_%d",idx)]
		local gain   = task_tbl[string.format(--[[!AUTO_125]]"ItemGain_%d",idx)]
		local toget  = task_tbl[string.format(--[[!AUTO_126]]"ItemToGet_%d",idx)]
		local color  = TaskHelp.Color[--[[!]]"@未完成@"][1]
		local zone,x,y,z,mapid = TaskHelp:GetItemInfo(id)
		local link = --[[!AUTO_127]]""
		if task_tbl["IsTrack"] then
			if TaskHelp:IsItemLink(id) then
				link = TaskHelp:BuildItemLink(id,task_tbl["IsTrack"])
			else
				link = TaskHelp:BuildPathLink(x,y,z,mapid,TaskHelp.Color[--[[!]]"@寻径@"][1],TaskHelp.TARGET_ITEM,id,fromid,name)
			end
		else
			if TaskHelp:IsItemLink(id) then
				link = TaskHelp:BuildItemLink(id,task_tbl[--[[!]]"IsTrack"])
			else
				link = TaskHelp:BuildPathLink(x,y,z,mapid,TaskHelp.Color[--[[!]]"@寻径2@"][1],TaskHelp.TARGET_ITEM,id,fromid,name)
			end
		end

		if gain >= toget then
			color = TaskHelp.Color[--[[!]]"@已完成@"][1]
			link = --[[!AUTO_128]]""
			finishstr = --[[!AUTO_129]]""
			info = --[[!AUTO_130]]""
		else
			if TaskHelp:IsItemLink(id) then
				info = string.format(--[[!AUTO_131]]"%s收集：%s%s%s(%d/%d)",color,finishstr,link,color,gain,toget)
			else
				if zone == --[[!AUTO_132]]"" then
					info = string.format(--[[!AUTO_133]]"%s收集：%s%s%s%s(%d/%d)",color,finishstr,color,name,color,gain,toget)
				else
					if idCurScene == mapid then
						task_tbl["TaskOrder"] = 1
						info = string.format(--[[!AUTO_134]]"%s收集：%s%s%s(%d/%d)",color,finishstr,link,color,gain,toget)
					else
						info = string.format(--[[!AUTO_135]]"%s收集：%s%s%s%s的%s%s(%d/%d)",color,finishstr,TaskHelp.Color["@区域名@"][1],zone,color,link,color,gain,toget)
					end
				end
			end
		end

		if gain <= toget then
			if gain == toget then
				hintColor = TaskHelp.Color[--[[!]]"@任务完成状态@"][1]
				hintStr = --[[!AUTO_136]]"完成："
			end
			if toget == 1 then
				hintInfo = string.format(--[[!AUTO_137]]"%s%s已收集：%s",hintColor,hintStr,name)
			else
				hintInfo = string.format(--[[!AUTO_138]]"%s%s已收集：%d個%s(%d/%d)",hintColor,hintStr,gain,name,gain,toget)
			end
			if type(LAST_SYSTEM_HINT[task_tbl["ID"]]) ~= --[[!AUTO_139]]"table" then
				HINT_INIT_STRING[task_tbl["ID"]]={}
				LAST_SYSTEM_HINT[task_tbl["ID"]]={}
			end

			--if HINT_INIT_STRING[task_tbl["ID"]][idx] ~=1 then
			if gain == 0 then
				HINT_INIT_STRING[task_tbl["ID"]][idx] = 1
			  	LAST_SYSTEM_HINT[task_tbl["ID"]][idx] = hintInfo
			end

			if hintInfo ~= LAST_SYSTEM_HINT[task_tbl["ID"]][idx] and gain ~=0  and hintInfo ~= --[[!AUTO_140]]"" and (not task_tbl["Target"]) then
		    		TaskHelp:AddSystemHint(hintInfo)
		    		LAST_SYSTEM_HINT[task_tbl["ID"]][idx] = hintInfo
			end
		end
	end
	return info
end

--生成任务名链接，点击后弹出任务面板
local function BuildTaskNameLink (name, color)
	return string.format(--[[!AUTO_141]]"%s<%d><%d><%s><%s>",TaskHelp:GetCoordTag(),TaskHelp.enumEICustomSystem,  color, name, --[[!AUTO_142]]"TaskName")
end

--任务名称
function TaskHelp:TaskTrack_Name(task_tbl,host_prop_tbl)
	l_curTaskInfo.taskId = task_tbl.ID

	local sName    = --[[!AUTO_143]]""
	local sTribute = --[[!AUTO_144]]""	--???
	local sFinish  = --[[!AUTO_145]]""
	local sTag     = --[[!AUTO_146]]""	--???
	local sInfo    = --[[!AUTO_147]]""
	local bIsRing = (task_tbl["Type"] == TaskHelp.TaskType.TASK_TYPE_RING)

	if task_tbl["Name"] then
		local nameColorStr = task_tbl["IsMainStory"] and TaskHelp.Color[--[[!]]"@主线任务名@"][1] or TaskHelp.Color[--[[!]]"@任务名@"][1]
		local nameColor = task_tbl["IsMainStory"] and TaskHelp.Color[--[[!]]"@主线任务名@"][2] or TaskHelp.Color[--[[!]]"@任务名@"][2]
		local NameLink = BuildTaskNameLink(task_tbl["Name"], nameColor)

		if task_tbl["TaskPackFull"] then
			sName = TaskHelp.Color[--[[!]]"@包裹满@"][1]..string.format(--[[!AUTO_148]]"(滿)%s[%d]",nameColorStr,task_tbl["SuitableLevel"])..NameLink
		else
			sName = TaskHelp.Color[--[[!]]"@任务名@"][1]..string.format(--[[!AUTO_149]]"%s[%d]",nameColorStr,task_tbl["SuitableLevel"])..NameLink
		end
	end

	if task_tbl["Have"] ~= nil and task_tbl["Have"] == false then
		return TaskHelp.Color[--[[!]]"@提示可接任务@"][1]..--[[!AUTO_150]]"(可接)"..sName
	end

	if task_tbl["Tribute"] then
		sTribute = TaskHelp.Color[--[[!]]"@任务名@"][1]..task_tbl["Tribute"]
	end

	if task_tbl["Have"] and task_tbl["FinishType"] == TaskHelp.FinishType.enumTFTNPC and task_tbl["CanFinish"] and task_tbl.IsSuccess and not bIsRing then
		sFinish = TaskHelp.Color[--[[!]]"@任务完成状态@"][1]..--[[!AUTO_151]]"(完成)"
	end

	if #sTag > 0 then
		sInfo = sTag..--[[!AUTO_152]]" "..sName
	else
		sInfo = --[[!AUTO_153]]" "..sName
	end

	if #sFinish > 0 then
		sInfo = sInfo..sFinish
	end

	if #sTribute > 0 and task_tbl["TrackType"] ~= 1001 and task_tbl["TrackType"] ~= 1002 then
		sInfo = sInfo..--[[!AUTO_154]]" "..sTribute
	end

	return sInfo
end

--时装风格搭配信息
function TaskHelp:TaskTrack_FashionInfo(task_tbl,idx,host_prop_tbl)
	local needStyle = task_tbl[string.format("NeedFashion_%d", idx)]
	local sInfo = ""
	local nameTbl = fashion_config.StyleName
	if needStyle then
		local styleName = nameTbl[needStyle]
		if not styleName then
			styleName = "未知"
		end

		local getStyle = task_tbl[string.format("GetFashion_%d", idx)]
		local getFmt = 0
		if getStyle then
			getFmt = 1
		end
		sInfo = string.format("%s:(%d/1)", styleName, getFmt)
	end
	return sInfo
end

--任务完成NPC
function TaskHelp:TaskTrack_Info(task_tbl,host_prop_tbl)
	l_curTaskInfo.taskId = task_tbl.ID

	local idCurScene = GameApi.GetSceneID()

	local delvNpc     = task_tbl["DelvNpc"]
	local delvNpcName = task_tbl["DelvNpcName"] or --[[!AUTO_155]]""
	local delvNpcZone,delv_x,delv_y,delv_z,delv_mapid,delv_objname = TaskHelp:GetNpcPos(delvNpc)
	local delvNpcLink = --[[!AUTO_156]]""
	if task_tbl["IsTrack"] then
		delvNpcLink = TaskHelp:BuildPathLink(delv_x,delv_y,delv_z,delv_mapid,TaskHelp.Color[--[[!]]"@寻径@"][1],TaskHelp.TARGET_NPC,delvNpc,delvNpc,delvNpcName)
	else
		delvNpcLink = TaskHelp:BuildPathLink(delv_x,delv_y,delv_z,delv_mapid,TaskHelp.Color[--[[!]]"@寻径2@"][1],TaskHelp.TARGET_NPC,delvNpc,delvNpc,delvNpcName)
	end

	local awardNpc     = task_tbl["AwardNpc"]
	local awardNpcName = task_tbl["AwardNpcName"] or --[[!AUTO_157]]""
	local awardNpcZone,award_x,award_y,award_z,award_mapid,award_objname = TaskHelp:GetNpcPos(awardNpc)
	local awardNpcLink = --[[!AUTO_158]]""
	if task_tbl["IsTrack"] then
		awardNpcLink = TaskHelp:BuildPathLink(award_x,award_y,award_z,award_mapid,TaskHelp.Color[--[[!]]"@寻径@"][1],TaskHelp.TARGET_NPC,awardNpc,awardNpc,awardNpcName)
	else
		awardNpcLink = TaskHelp:BuildPathLink(award_x,award_y,award_z,award_mapid,TaskHelp.Color[--[[!]]"@寻径2@"][1],TaskHelp.TARGET_NPC,awardNpc,awardNpc,awardNpcName)
	end

	local talkNpc     = task_tbl["TalkNpc"] or 0
	local talkNpcName = task_tbl["TalkNpcName"] or --[[!AUTO_159]]""
	local talkNpcZone,talk_x,talk_y,talk_z,talk_mapid,talk_objname = TaskHelp:GetNpcPos(talkNpc)
	local talkNpcLink = --[[!AUTO_160]]""
	if task_tbl["IsTrack"] then
		talkNpcLink = TaskHelp:BuildPathLink(talk_x,talk_y,talk_z,talk_mapid,TaskHelp.Color[--[[!]]"@寻径@"][1],TaskHelp.TARGET_NPC,talkNpc,talkNpc,talkNpcName)
	else
		talkNpcLink = TaskHelp:BuildPathLink(talk_x,talk_y,talk_z,talk_mapid,TaskHelp.Color[--[[!]]"@寻径2@"][1],TaskHelp.TARGET_NPC,talkNpc,talkNpc,talkNpcName)
	end

	local targetString = task_tbl["Target"]

	local is_track = task_tbl["IsTrack"]
	local color = is_track and --[[!AUTO_161]]"^ffffff" or --[[!AUTO_162]]"^000000"
	local levelOKColor = is_track and TaskHelp.Color[--[[!]]"@人物等级满足@"][1] or --[[!AUTO_163]]"^00ff00"
	local levelTooLowColor = is_track and TaskHelp.Color[--[[!]]"@人物等级@"][1] or --[[!AUTO_164]]"^ff0000"
	local regionColor = is_track and TaskHelp.Color[--[[!]]"@区域名@"][1] or --[[!AUTO_165]]"^000000"
	local npcColor = is_track and TaskHelp.Color[--[[!]]"@NPC名@"][1] or --[[!AUTO_166]]"^000000"

	--生成区域名与NPC名。可应对区域为
	local function MakeRegionAndNpcName (npcZone, npcName)
		if #npcZone > 0 then
			return (--[[!AUTO_167]]"%s%s%s的%s%s"):format(regionColor,npcZone,color,npcColor,npcName)
		else
			return (--[[!AUTO_168]]"%s%s"):format(npcColor,talkNpcLink)
		end
	end


	--
	--特例开始
	if not task_tbl["Have"] then	--可接任务
		if task_tbl["ID"] == 4123 or task_tbl["ID"] == 4144 or task_tbl["ID"] == 4145 then
			local LinkPath = string.format(--[[!AUTO_169]]"請選擇支線\r支線一：%s\r支線二：%s\r支線三：%s", --加入门派特例
			TaskHelp:BuildNpcLink(36006, ObjInfo[36006].name, not is_track),
			TaskHelp:BuildNpcLink(36012, ObjInfo[36012].name, not is_track),
			TaskHelp:BuildNpcLink(36018, ObjInfo[36018].name, not is_track))
			return string.format(--[[!AUTO_170]]"%s%s%s",TableString,color,LinkPath)
		--elseif task_tbl["ID"] == 5363 then
		elseif task_tbl["ID"] == 5262 or task_tbl["ID"] == 5259 or task_tbl["ID"] == 5256 or task_tbl["ID"] == 5250 or task_tbl["ID"] == 5235 or task_tbl["ID"]==5244 or task_tbl["ID"] == 5241 or task_tbl["ID"] == 5238 or task_tbl["ID"] == 5247 or task_tbl["ID"] == 5253
		then
			local LinkPath = string.format(--[[!AUTO_171]]"請選擇門派\r少林(限男性)：%s\r五仙(限女性)：%s\r武當：%s     衡山：%s\r唐門：%s     逍遙：%s\r恆山：%s     華山：%s\r日月：%s     峨眉：%s", --加入门派特例
			TaskHelp:BuildNpcLink(61761, ObjInfo[61761].name, not is_track),--少林
			TaskHelp:BuildNpcLink(61755, ObjInfo[61755].name, not is_track),--五仙
			TaskHelp:BuildNpcLink(61764, ObjInfo[61764].name, not is_track),--武当
			TaskHelp:BuildNpcLink(61776, ObjInfo[61776].name, not is_track),--衡山
			TaskHelp:BuildNpcLink(61758, ObjInfo[61758].name, not is_track),--唐门
			TaskHelp:BuildNpcLink(61770, ObjInfo[61770].name, not is_track),--逍遥
			TaskHelp:BuildNpcLink(61779, ObjInfo[61779].name, not is_track),--恒山
			TaskHelp:BuildNpcLink(61773, ObjInfo[61773].name, not is_track),--华山
			TaskHelp:BuildNpcLink(61752, ObjInfo[61752].name, not is_track),--日月
			TaskHelp:BuildNpcLink(61767, ObjInfo[61767].name, not is_track))--峨眉
			return string.format(--[[!AUTO_172]]"%s%s",color,LinkPath)
		end
		if idCurScene == delv_mapid then
			if task_tbl["ID"] == 4123 or task_tbl["ID"] == 4144 or task_tbl["ID"] == 4145 then
				local LinkPath = string.format(--[[!AUTO_173]]"請選擇支線\r支線一：%s\r支線二：%s\r支線三：%s", --加入门派特例
				TaskHelp:BuildNpcLink(36006, ObjInfo[36006].name, not is_track),
				TaskHelp:BuildNpcLink(36012, ObjInfo[36012].name, not is_track),
				TaskHelp:BuildNpcLink(36018, ObjInfo[36018].name, not is_track))
				return string.format(--[[!AUTO_174]]"%s%s%s",TableString,color,LinkPath)
			--[[
			elseif task_tbl["ID"] == 4396 then
				local LinkPath = string.format("请选择门派\r少林：%s\r武当：%s\r华山：%s\r衡山：%s\r恒山：%s\r日月：%s\r五仙：%s\r逍遥：%s\r唐门：%s\r峨眉：%s", --加入门派特例
				TaskHelp:BuildNpcLink(36156, ObjInfo[36156].name, not is_track),
				TaskHelp:BuildNpcLink(36159, ObjInfo[36159].name, not is_track),
				TaskHelp:BuildNpcLink(36168, ObjInfo[36168].name, not is_track),
				TaskHelp:BuildNpcLink(36171, ObjInfo[36171].name, not is_track),
				TaskHelp:BuildNpcLink(36174, ObjInfo[36174].name, not is_track),
				TaskHelp:BuildNpcLink(36147, ObjInfo[36147].name, not is_track),
				TaskHelp:BuildNpcLink(36150, ObjInfo[36150].name, not is_track),
				TaskHelp:BuildNpcLink(36165, ObjInfo[36165].name, not is_track),
				TaskHelp:BuildNpcLink(36153, ObjInfo[36153].name, not is_track),
				TaskHelp:BuildNpcLink(36162, ObjInfo[36162].name, not is_track))
				return string.format("%s%s",color,LinkPath)
				--]]
			end
		end
	end
	--特例结束
	--

	if not task_tbl["Have"] then	--可接任务
		if not task_tbl["IsTrack"] then		--任务面板有单独的“接收NPC”项，不应必重复显示
			return --[[!AUTO_175]]""
		end

		if delvNpcZone and delvNpcLink then
			if idCurScene == delv_mapid then
				return string.format(--[[!AUTO_176]]"%s%s%s有事找你",TableString,delvNpcLink,color)
			else
				return string.format(--[[!AUTO_177]]"%s%s%s有事找你",TableString,MakeRegionAndNpcName(delvNpcZone,delvNpcLink), color)
			end
		else
			return string.format(--[[!AUTO_178]]"%s%s%s有事找你",TableString,color,delvNpcName)
		end
		return --[[!AUTO_179]]""
	else		--已接任务
		if task_tbl["FinishType"] == TaskHelp.FinishType.enumTFTDirect then
			if task_tbl["FinishLev"] > 0 then
				if host_prop_tbl.level >= task_tbl["FinishLev"] then
			  		return string.format(--[[!AUTO_180]]"%s%s將角色等級提升至%s%d",TableString,color,levelOKColor,task_tbl["FinishLev"])
				else
			  		return string.format(--[[!AUTO_181]]"%s%s將角色等級提升至%s%d",TableString,color,levelTooLowColor,task_tbl["FinishLev"])
				end
			end
		else
			if task_tbl["FinishLev"] > host_prop_tbl.level then		--等级不够时 (注意，此条件肢中等级足够的子分支未去除)
				do
					return string.format(--[[!AUTO_182]]"%s%s要求：將角色等級提升至%s%d%s級",TableString,color, levelTooLowColor, task_tbl["FinishLev"], color)
				end
			else		--等级足够
				if not task_tbl["IsTrack"] and (talkNpc == 0) then		--任务面板有单独的“完成NPC”项，不应必重复显示
					return --[[!AUTO_183]]""
				end

				if talkNpc > 0 and awardNpc >0 then
					if task_tbl["CanFinish"] then
						if idCurScene == award_mapid then
							task_tbl["TaskOrder"] = 1
							--return string.format("%s前去拜会%s%s",color,npcColor,awardNpcLink)
							return string.format(--[[!AUTO_184]]"%s%s目標：%s%s",TableString,color,npcColor,awardNpcLink)
						else
							--return string.format("%s去%s%s%s找%s%s",color,regionColor,awardNpcZone,color,npcColor,awardNpcLink)
							return string.format(--[[!AUTO_185]]"%s%s目標：%s",TableString,color,MakeRegionAndNpcName(awardNpcZone, awardNpcLink))
						end
					else
						return --[[!AUTO_186]]""
					end
				else
					if awardNpc >0 then
						--samestr = string.format("去%s%s%s找%s%s",regionColor,awardNpcZone,TaskHelp.Color["@未完成@"][1],npcColor,awardNpcName)
						local samestr = string.format(--[[!AUTO_187]]"目標：%s%s%s%s%s",regionColor,awardNpcZone,TaskHelp.Color["@未完成@"][1],npcColor,awardNpcName)
						if task_tbl["CanFinish"] and string.find(TaskHelp:TaskTrack_Target(task_tbl,host_prop_tbl),samestr) == nil then
							if awardNpcZone == --[[!AUTO_188]]"" then
								--return string.format("%s%s回报%s%s",color,color,npcColor,awardNpcName)
								return string.format(--[[!AUTO_189]]"%s%s%s目標：%s%s",TableString,color,color,npcColor,awardNpcName)
							else
								if idCurScene == award_mapid then
									task_tbl["TaskOrder"] = 1
									--return string.format("%s前去拜会%s%s",color,npcColor,awardNpcLink)
									return string.format(--[[!AUTO_190]]"%s%s目標：%s%s",TableString,color,npcColor,awardNpcLink)
								else
									--return string.format("%s到%s%s%s向%s%s回报",color,regionColor,awardNpcZone,color,npcColor,awardNpcLink)
									return string.format(--[[!AUTO_191]]"%s%s目標：%s",TableString,color,MakeRegionAndNpcName(awardNpcZone, awardNpcLink))
								end
							end
						else
					    		return --[[!AUTO_192]]""
						end
					else
						return --[[!AUTO_193]]""
					end
				end
			end
		end
	end
	return --[[!AUTO_194]]""
end

--工具：文字拼接
function TaskHelp:ConcatInfo(total,info)
	if string.len(info) ~= 0 then
		if string.len(total) == 0 then
			return info;
		else
			return string.format(--[[!AUTO_195]]"%s\r\n%s%s",total,TableString,info)
		end
	end
	return total
end

--任务目标
function TaskHelp:TaskTrack_Target(task_tbl,host_prop_tbl)
	l_curTaskInfo.taskId = task_tbl.ID

	--可接任务不显示目标
	if not task_tbl["Have"] then
		return --[[!AUTO_196]]""
	end

	local idCurScene = GameApi.GetSceneID()
	local linkColorValue = task_tbl["IsTrack"] and TaskHelp.Color[--[[!]]"@寻径@"][1]+0 or TaskHelp.Color[--[[!]]"@寻径2@"][1]+0		--链接颜色

	if task_tbl["Type"] == TaskHelp.TaskType.TASK_TYPE_RING and task_tbl["Have"] then
		local curSubRing  = task_tbl["CurSubTask"]
		local finishRing  = task_tbl["FinishRingNum"]
		local totalRing   = task_tbl["TotalRingNum"]
		local sTargetInfo = --[[!AUTO_197]]""
		if curSubRing and curSubRing > 0 then
			sTargetInfo = string.format(--[[!AUTO_198]]"任務總環數: %d\r\n已完成環數: %d\r\n",totalRing,finishRing)
		else
			local is_track = task_tbl["IsTrack"]
			local color = is_track and --[[!AUTO_199]]"^ffffff" or --[[!AUTO_200]]"^000000"
			local regionColor = is_track and TaskHelp.Color[--[[!]]"@区域名@"][1] or --[[!AUTO_201]]"^000000"
			local npcColor = is_track and TaskHelp.Color[--[[!]]"@NPC名@"][1] or --[[!AUTO_202]]"^000000"
			local linkColor = is_track and TaskHelp.Color[--[[!]]"@寻径@"][1] or TaskHelp.Color[--[[!]]"@寻径2@"][1]

			local delvNpc     = task_tbl["NextDelvNpc"]
			local delvNpcName = task_tbl["NextDelvNpcName"] or --[[!AUTO_203]]""
			local delvNpcZone,delv_x,delv_y,delv_z,delv_mapid,delv_objname = TaskHelp:GetNpcPos(delvNpc)
			print(--[[!AUTO_204]]"delvNpc", delvNpcZone,delv_x,delv_y,delv_z,delv_mapid,delv_objname)	--D
			local delvNpcLink = TaskHelp:BuildPathLink(delv_x,delv_y,delv_z,delv_mapid,linkColor,TaskHelp.TARGET_NPC,delvNpc,delvNpc,delvNpcName)
			if delv_mapid > 0 and idCurScene ~= delv_mapid then
				sTargetInfo = string.format(--[[!AUTO_205]]"任務總環數: %d\r\n已完成環數: %d\r\n下一環接任務: %s%s%s的%s",totalRing,finishRing,regionColor,delvNpcZone,npcColor,delvNpcLink)
			else
				sTargetInfo = string.format(--[[!AUTO_206]]"任務總環數: %d\r\n已完成環數: %d\r\n下一環接任務: %s%s",totalRing,finishRing,npcColor,delvNpcLink)
			end
		end
		return sTargetInfo
	end

	local delvNpc     = task_tbl["DelvNpc"]
	local delvNpcName = task_tbl["DelvNpcName"] or --[[!AUTO_207]]""
	local delvNpcZone,delv_x,delv_y,delv_z,delv_mapid,delv_objname = TaskHelp:GetNpcPos(delvNpc)
	local delvNpcLink = --[[!AUTO_208]]""
	if task_tbl["IsTrack"] then
		delvNpcLink = TaskHelp:BuildPathLink(delv_x,delv_y,delv_z,delv_mapid,TaskHelp.Color[--[[!]]"@寻径@"][1],TaskHelp.TARGET_NPC,delvNpc,delvNpc,delvNpcName)
	else
		delvNpcLink = TaskHelp:BuildPathLink(delv_x,delv_y,delv_z,delv_mapid,TaskHelp.Color[--[[!]]"@寻径2@"][1],TaskHelp.TARGET_NPC,delvNpc,delvNpc,delvNpcName)
	end

	local awardNpc     = task_tbl["AwardNpc"]
	local awardNpcName = task_tbl["AwardNpcName"] or --[[!AUTO_209]]""
	local awardNpcZone,award_x,award_y,award_z,award_mapid,award_objname = TaskHelp:GetNpcPos(awardNpc)
	local awardNpcLink = --[[!AUTO_210]]""
	if task_tbl["IsTrack"] then
		awardNpcLink = TaskHelp:BuildPathLink(award_x,award_y,award_z,award_mapid,TaskHelp.Color[--[[!]]"@寻径@"][1],TaskHelp.TARGET_NPC,awardNpc,awardNpc,awardNpcName)
	else
		awardNpcLink = TaskHelp:BuildPathLink(award_x,award_y,award_z,award_mapid,TaskHelp.Color[--[[!]]"@寻径2@"][1],TaskHelp.TARGET_NPC,awardNpc,awardNpc,awardNpcName)
	end

	local talkNpc     = task_tbl["TalkNpc"] or 0
	local talkNpcName = task_tbl["TalkNpcName"] or --[[!AUTO_211]]""
	local talkNpcZone,talk_x,talk_y,talk_z,talk_mapid,talk_objname = TaskHelp:GetNpcPos(talkNpc)
	local talkNpcLink = --[[!AUTO_212]]""
	if task_tbl["IsTrack"] then
		talkNpcLink = TaskHelp:BuildPathLink(talk_x,talk_y,talk_z,talk_mapid,TaskHelp.Color[--[[!]]"@寻径@"][1],TaskHelp.TARGET_NPC,talkNpc,talkNpc,talkNpcName)
	else
		talkNpcLink = TaskHelp:BuildPathLink(talk_x,talk_y,talk_z,talk_mapid,TaskHelp.Color[--[[!]]"@寻径2@"][1],TaskHelp.TARGET_NPC,talkNpc,talkNpc,talkNpcName)
	end

	local finishstr = --[[!AUTO_213]]""
	local color    = TaskHelp.Color["@未完成@"][1]
	local hintInfo

	local tempTarget = --[[!AUTO_214]]""
	local manualTarget = nil
	if task_tbl["Target"] then
		if  string.match(task_tbl["Target"],--[[!AUTO_215]]"%[") == nil and string.match(task_tbl["Target"],--[[!AUTO_216]]"%]") == nil then
			manualTarget = string.format(--[[!AUTO_217]]"%s%s%s",color,finishstr,task_tbl["Target"])
		else
			tempTarget = TaskHelp:TargetTransform(task_tbl["Target"],TaskHelp.TARGET_POS,task_tbl["IsTrack"], task_tbl["ID"])
			manualTarget = string.format(--[[!AUTO_218]]"%s%s%s",color,finishstr,tempTarget)
		end
	end

	local sTarget = manualTarget or --[[!AUTO_219]]""		--默认目标为手动输入的字符串

	if task_tbl["CanFinish"] and task_tbl.IsSuccess then
		color = TaskHelp.Color[--[[!]]"@已完成@"][1]
		finishstr = --[[!AUTO_220]]""
		talkNpcLink = --[[!AUTO_221]]""
		awardNpcLink = --[[!AUTO_222]]""
		delvNpcLink = --[[!AUTO_223]]""
	end
	--事件触发计数完成任务
	if task_tbl["Method"] == TaskHelp.Method.enumTMEventTrig then
		for i=1,4 do
			if task_tbl[--[[!AUTO_224]]"EventTrigValid_"..i] and task_tbl[--[[!AUTO_225]]"EventTrigType_"..i] ~= 0 then
				local temptarget = --[[!AUTO_226]]""
				if task_tbl[--[[!AUTO_227]]"EventTrigType_"..i] == 1 then
					if task_tbl[--[[!AUTO_228]]"EventTrig_"..i..--[[!AUTO_229]]"_Param_1"] > 0 then
						if TaskHelp.Instance[task_tbl[--[[!AUTO_230]]"EventTrig_"..i..--[[!AUTO_231]]"_Param_1"]] then
							local scene_id = GameApi.GetSceneID()
							if TaskHelp.Instance[task_tbl[--[[!AUTO_232]]"EventTrig_"..i..--[[!AUTO_233]]"_Param_1"]].scene ~= scene_id then
								local eZone,e_x,e_y,e_z,e_mapid,e_objname = TaskHelp:GetNpcPos(TaskHelp.Instance[task_tbl[--[[!AUTO_234]]"EventTrig_"..i..--[[!AUTO_235]]"_Param_1"]].entrid)
								if e_mapid and e_mapid > 0 then
									if task_tbl["IsTrack"] then
										temptarget = TaskHelp:BuildPathLink(e_x,e_y,e_z,e_mapid,TaskHelp.Color[--[[!]]"@寻径@"][1],TaskHelp.TARGET_NPC,TaskHelp.Instance[task_tbl[--[[!AUTO_236]]"EventTrig_"..i..--[[!AUTO_237]]"_Param_1"]].entrid,0,ReachTargeStyle)
									else
										temptarget = TaskHelp:BuildPathLink(e_x,e_y,e_z,e_mapid,TaskHelp.Color[--[[!]]"@寻径2@"][1],TaskHelp.TARGET_NPC,TaskHelp.Instance[task_tbl[--[[!AUTO_238]]"EventTrig_"..i..--[[!AUTO_239]]"_Param_1"]].entrid,0,ReachTargeStyle)
									end
								end
							end
						end
					end
				elseif task_tbl[--[[!AUTO_240]]"EventTrigType_"..i] == 2 then
					temptarget = --[[!AUTO_241]]""
				elseif task_tbl[--[[!AUTO_242]]"EventTrigType_"..i] == 3 then
					local item_id = task_tbl[--[[!AUTO_243]]"EventTrig_"..i..--[[!AUTO_244]]"_Param_1"]
					local item_name,item_quality,item_cid = GameApi.GetItemInfo(item_id)
					if item_cid and item_cid == ClassType.ICID_TASKITEM_GENERATOR then
						local _, item_select = DescUtility:GetItemDBProp(item_id,item_cid,--[[!]]"要求选中目标类型")
						if item_select == 1 then
							local _, item_selectmonster = DescUtility:GetItemDBProp(item_id,item_cid,--[[!]]"需选中的怪物模板ID")
							--LogPrint(item_selectmonster)
							local zone,x,y,z,mapid,objname = TaskHelp:GetNpcPos(item_selectmonster)
							if mapid > 0 then
								if task_tbl["IsTrack"] then
									temptarget = TaskHelp:BuildPathLink(x,y,z,mapid,TaskHelp.Color[--[[!]]"@寻径@"][1],TaskHelp.TARGET_MONSTER,item_selectmonster,item_selectmonster,objname)
								else
									temptarget = TaskHelp:BuildPathLink(x,y,z,mapid,TaskHelp.Color[--[[!]]"@寻径2@"][1],TaskHelp.TARGET_MONSTER,item_selectmonster,item_selectmonster,objname)
								end
							end
						elseif item_select == 2 then
							local _, item_selectnpc = DescUtility:GetItemDBProp(item_id,item_cid,--[[!]]"需选中的NPC模板ID")
							local zone,x,y,z,mapid,objname = TaskHelp:GetNpcPos(item_selectnpc)
							if mapid > 0 then
								if task_tbl["IsTrack"] then
									temptarget = TaskHelp:BuildPathLink(x,y,z,mapid,TaskHelp.Color[--[[!]]"@寻径@"][1],TaskHelp.TARGET_NPC,item_selectnpc,item_selectnpc,objname)
								else
									temptarget = TaskHelp:BuildPathLink(x,y,z,mapid,TaskHelp.Color[--[[!]]"@寻径2@"][1],TaskHelp.TARGET_NPC,item_selectnpc,item_selectnpc,objname)
								end
							end
						else
							local _, item_scene = DescUtility:GetItemDBProp(item_id,item_cid,--[[!]]"使用限制场景ID")
							if item_scene and item_scene > 0 then
								local _, item_minx = DescUtility:GetItemDBProp(item_id,item_cid,--[[!]]"使用限制场景最小X")
								local _, item_miny = DescUtility:GetItemDBProp(item_id,item_cid,--[[!]]"使用限制场景最小Y")
								local _, item_minz = DescUtility:GetItemDBProp(item_id,item_cid,--[[!]]"使用限制场景最小Z")
								local _, item_maxx = DescUtility:GetItemDBProp(item_id,item_cid,--[[!]]"使用限制场景最大X")
								local _, item_maxy = DescUtility:GetItemDBProp(item_id,item_cid,--[[!]]"使用限制场景最大Y")
								local _, item_maxz = DescUtility:GetItemDBProp(item_id,item_cid,--[[!]]"使用限制场景最大Z")
								if task_tbl["IsTrack"] then
									temptarget = TaskHelp:BuildPathLink(item_minx/2+item_maxx/2, item_miny/2+item_maxy/2,item_minz/2+item_maxz/2,item_scene,TaskHelp.Color["@寻径@"][1],TaskHelp.TARGET_POS,0,0,ReachTargeStyle)
								else
									temptarget = TaskHelp:BuildPathLink(item_minx/2+item_maxx/2, item_miny/2+item_maxy/2,item_minz/2+item_maxz/2,item_scene,TaskHelp.Color["@寻径2@"][1],TaskHelp.TARGET_POS,0,0,ReachTargeStyle)
								end
							end
						end
					end
				elseif task_tbl[--[[!AUTO_245]]"EventTrigType_"..i] == 4 then
					if task_tbl[--[[!AUTO_246]]"EventTrig_"..i..--[[!AUTO_247]]"_Param_2"] > 0 then
						local eZone,e_x,e_y,e_z,e_mapid,e_objname = TaskHelp:GetNpcPos(task_tbl[--[[!AUTO_248]]"EventTrig_"..i..--[[!AUTO_249]]"_Param_2"])
						if e_mapid and e_mapid > 0 then
							if task_tbl["IsTrack"] then
								temptarget = TaskHelp:BuildPathLink(e_x,e_y,e_z,e_mapid,TaskHelp.Color[--[[!]]"@寻径@"][1],TaskHelp.TARGET_NPC,task_tbl[--[[!AUTO_250]]"EventTrig_"..i..--[[!AUTO_251]]"_Param_2"],0,ReachTargeStyle)
							else
								temptarget = TaskHelp:BuildPathLink(e_x,e_y,e_z,e_mapid,TaskHelp.Color[--[[!]]"@寻径2@"][1],TaskHelp.TARGET_NPC,task_tbl[--[[!AUTO_252]]"EventTrig_"..i..--[[!AUTO_253]]"_Param_2"],0,ReachTargeStyle)
							end
						end
					end
				elseif task_tbl[--[[!AUTO_254]]"EventTrigType_"..i] == 5 then
					if task_tbl[--[[!AUTO_255]]"EventTrig_"..i..--[[!AUTO_256]]"_Param_2"] > 0 then
						local eZone,e_x,e_y,e_z,e_mapid,e_objname = TaskHelp:GetNpcPos(task_tbl[--[[!AUTO_257]]"EventTrig_"..i..--[[!AUTO_258]]"_Param_2"])
						if e_mapid and e_mapid > 0 then
							if task_tbl["IsTrack"] then
								temptarget = TaskHelp:BuildPathLink(e_x,e_y,e_z,e_mapid,TaskHelp.Color[--[[!]]"@寻径@"][1],TaskHelp.TARGET_NPC,task_tbl[--[[!AUTO_259]]"EventTrig_"..i..--[[!AUTO_260]]"_Param_2"],0,ReachTargeStyle)
							else
								temptarget = TaskHelp:BuildPathLink(e_x,e_y,e_z,e_mapid,TaskHelp.Color[--[[!]]"@寻径2@"][1],TaskHelp.TARGET_NPC,task_tbl[--[[!AUTO_261]]"EventTrig_"..i..--[[!AUTO_262]]"_Param_2"],0,ReachTargeStyle)
							end
						end
					end
				elseif task_tbl[--[[!AUTO_263]]"EventTrigType_"..i] == 6 then
					if task_tbl[--[[!AUTO_264]]"EventTrig_"..i..--[[!AUTO_265]]"_Param_1"] > 0 then
						if TaskHelp.Instance[task_tbl[--[[!AUTO_266]]"EventTrig_"..i..--[[!AUTO_267]]"_Param_1"]] then
							local scene_id = GameApi.GetSceneID()
							if TaskHelp.Instance[task_tbl[--[[!AUTO_268]]"EventTrig_"..i..--[[!AUTO_269]]"_Param_1"]].scene ~= scene_id then
								local eZone,e_x,e_y,e_z,e_mapid,e_objname = TaskHelp:GetNpcPos(TaskHelp.Instance[task_tbl[--[[!AUTO_270]]"EventTrig_"..i..--[[!AUTO_271]]"_Param_1"]].entrid)
								if e_mapid and e_mapid > 0 then
									if task_tbl["IsTrack"] then
										temptarget = TaskHelp:BuildPathLink(e_x,e_y,e_z,e_mapid,TaskHelp.Color[--[[!]]"@寻径@"][1],TaskHelp.TARGET_NPC,TaskHelp.Instance[task_tbl[--[[!AUTO_272]]"EventTrig_"..i..--[[!AUTO_273]]"_Param_1"]].entrid,0,ReachTargeStyle)
									else
										temptarget = TaskHelp:BuildPathLink(e_x,e_y,e_z,e_mapid,TaskHelp.Color[--[[!]]"@寻径2@"][1],TaskHelp.TARGET_NPC,TaskHelp.Instance[task_tbl[--[[!AUTO_274]]"EventTrig_"..i..--[[!AUTO_275]]"_Param_1"]].entrid,0,ReachTargeStyle)
									end
								end
							end
						end
					end
				elseif task_tbl[--[[!AUTO_276]]"EventTrigType_"..i] == 7 then
					if task_tbl[--[[!AUTO_277]]"EventTrig_"..i..--[[!AUTO_278]]"_Param_1"] > 0 then
						--LogPrint(task_tbl["EventTrig_"..i.."_Param_1"])
						local eZone,e_x,e_y,e_z,e_mapid,e_objname = TaskHelp:GetTaskMinePosition(task_tbl[--[[!AUTO_279]]"EventTrig_"..i..--[[!AUTO_280]]"_Param_1"])
						--LogPrint(e_mapid .. "_" .. e_x .. "_" .. e_y .. "_" .. e_z)
						if e_mapid and e_mapid > 0 then
							if task_tbl["IsTrack"] then
								temptarget = TaskHelp:BuildPathLink(e_x,e_y,e_z,e_mapid,TaskHelp.Color[--[[!]]"@寻径@"][1],TaskHelp.TARGET_MINE,task_tbl[--[[!AUTO_281]]"EventTrig_"..i..--[[!AUTO_282]]"_Param_1"],0,ReachTargeStyle)
							else
								temptarget = TaskHelp:BuildPathLink(e_x,e_y,e_z,e_mapid,TaskHelp.Color[--[[!]]"@寻径2@"][1],TaskHelp.TARGET_MINE,task_tbl[--[[!AUTO_283]]"EventTrig_"..i..--[[!AUTO_284]]"_Param_1"],0,ReachTargeStyle)
							end
						end
					end
				end
				--LogPrint("temptarget = " .. temptarget)
				if task_tbl["CanFinish"]~= true then
					if string.len(sTarget) > 0 then
						if task_tbl[--[[!AUTO_285]]"EventTrigCount_"..i] ~= task_tbl[--[[!AUTO_286]]"EventTrig_"..i..--[[!AUTO_287]]"_Param_8"] then
							if string.match(task_tbl[--[[!AUTO_288]]"EventTrigDesc_"..i],--[[!AUTO_289]]"%[") == nil and string.match(task_tbl[--[[!AUTO_290]]"EventTrigDesc_"..i],--[[!AUTO_291]]"%]") == nil then
								if temptarget == --[[!AUTO_292]]"" then
									sTarget =  string.format(--[[!AUTO_293]]"%s\r\n%s目標：%s(%d/%d)",sTarget,color,task_tbl[--[[!AUTO_294]]"EventTrigDesc_"..i],task_tbl[--[[!AUTO_295]]"EventTrigCount_"..i],task_tbl[--[[!AUTO_296]]"EventTrig_"..i..--[[!AUTO_297]]"_Param_8"])
								else
									if( task_tbl[--[[!AUTO_298]]"EventTrig_"..i..--[[!AUTO_299]]"_Param_8"] == 1 ) then
										sTarget =  string.format(--[[!AUTO_300]]"%s\r\n%s%s目標：%s%s",sTarget,TableString,color,task_tbl[--[[!AUTO_301]]"EventTrigDesc_"..i],temptarget)
									else
										sTarget =  string.format(--[[!AUTO_302]]"%s\r\n%s%s目標：%s(%d/%d)%s",sTarget,TableString,color,task_tbl[--[[!AUTO_303]]"EventTrigDesc_"..i],task_tbl[--[[!AUTO_304]]"EventTrigCount_"..i],task_tbl[--[[!AUTO_305]]"EventTrig_"..i..--[[!AUTO_306]]"_Param_8"],temptarget)
									end
								end
							else
								if( task_tbl[--[[!AUTO_307]]"EventTrig_"..i..--[[!AUTO_308]]"_Param_8"] == 1 ) then
									tempTarget = TaskHelp:TargetTransform(task_tbl[--[[!AUTO_309]]"EventTrigDesc_"..i],TaskHelp.TARGET_POS,task_tbl["IsTrack"], task_tbl["ID"])
									sTarget =  string.format(--[[!AUTO_310]]"%s\r\n%s%s目標：%s",sTarget,color,TableString,tempTarget )
								else
									tempTarget = TaskHelp:TargetTransform(task_tbl[--[[!AUTO_311]]"EventTrigDesc_"..i],TaskHelp.TARGET_POS,task_tbl["IsTrack"], task_tbl["ID"])
									sTarget =  string.format(--[[!AUTO_312]]"%s\r\n%s%s目標：%s(%d/%d)",sTarget,color,TableString,tempTarget,task_tbl[--[[!AUTO_313]]"EventTrigCount_"..i],task_tbl[--[[!AUTO_314]]"EventTrig_"..i..--[[!AUTO_315]]"_Param_8"])

								end
							end
						end
					else
						if task_tbl[--[[!AUTO_316]]"EventTrigCount_"..i] ~= task_tbl[--[[!AUTO_317]]"EventTrig_"..i..--[[!AUTO_318]]"_Param_8"] then
							if string.match(task_tbl[--[[!AUTO_319]]"EventTrigDesc_"..i],--[[!AUTO_320]]"%[") == nil and string.match(task_tbl[--[[!AUTO_321]]"EventTrigDesc_"..i],--[[!AUTO_322]]"%]") == nil then
								if temptarget == --[[!AUTO_323]]"" then
									sTarget =  string.format(--[[!AUTO_324]]"%s目標：%s(%d/%d)",color,task_tbl[--[[!AUTO_325]]"EventTrigDesc_"..i],task_tbl[--[[!AUTO_326]]"EventTrigCount_"..i],task_tbl[--[[!AUTO_327]]"EventTrig_"..i..--[[!AUTO_328]]"_Param_8"])
								else
									if( task_tbl[--[[!AUTO_329]]"EventTrig_"..i..--[[!AUTO_330]]"_Param_8"] == 1 ) then
										sTarget =  string.format(--[[!AUTO_331]]"%s目標：%s%s",color,task_tbl[--[[!AUTO_332]]"EventTrigDesc_"..i],temptarget)

									else
										sTarget =  string.format(--[[!AUTO_333]]"%s目標：%s(%d/%d)%s",color,task_tbl[--[[!AUTO_334]]"EventTrigDesc_"..i],task_tbl[--[[!AUTO_335]]"EventTrigCount_"..i],task_tbl[--[[!AUTO_336]]"EventTrig_"..i..--[[!AUTO_337]]"_Param_8"],temptarget)
									end
								end
							else
								if( task_tbl[--[[!AUTO_338]]"EventTrig_"..i..--[[!AUTO_339]]"_Param_8"] == 1 ) then
									tempTarget = TaskHelp:TargetTransform(task_tbl[--[[!AUTO_340]]"EventTrigDesc_"..i],TaskHelp.TARGET_POS,task_tbl["IsTrack"], task_tbl["ID"])
									sTarget =  string.format(--[[!AUTO_341]]"%s目標：%s",color,tempTarget)
								else
									tempTarget = TaskHelp:TargetTransform(task_tbl[--[[!AUTO_342]]"EventTrigDesc_"..i],TaskHelp.TARGET_POS,task_tbl["IsTrack"], task_tbl["ID"])
									sTarget =  string.format(--[[!AUTO_343]]"%s目標：%s(%d/%d)",color,tempTarget,task_tbl[--[[!AUTO_344]]"EventTrigCount_"..i],task_tbl[--[[!AUTO_345]]"EventTrig_"..i..--[[!AUTO_346]]"_Param_8"])
								end
							end
						else
							sTarget = --[[!AUTO_347]]""
						end
					end
				end
			end
                 end
		--事件提示
		if type(LAST_SYSTEM_HINT[task_tbl["ID"]]) ~= --[[!AUTO_348]]"table" then
			HINT_INIT_STRING[task_tbl["ID"]]={}
			LAST_SYSTEM_HINT[task_tbl["ID"]]={}
		end
		if task_tbl["CanFinish"] == false then
			for i=1,4 do
				if task_tbl[--[[!AUTO_349]]"EventTrigValid_"..i] and task_tbl[--[[!AUTO_350]]"EventTrigType_"..i] ~= 0 then
					local hintInfo
					local hintStr = --[[!AUTO_351]]""
					local hintColor = --[[!AUTO_352]]""
					if task_tbl[--[[!AUTO_353]]"EventTrigCount_"..i] == task_tbl[--[[!AUTO_354]]"EventTrig_"..i..--[[!AUTO_355]]"_Param_8"] then
						hintColor = TaskHelp.Color[--[[!]]"@任务完成状态@"][1]
						hintStr = --[[!AUTO_356]]"完成："
					else
						hintColor = TaskHelp.Color[--[[!]]"@白色@"][1]
						hintStr = --[[!AUTO_357]]"已進行："
					end

					hintInfo = string.format(--[[!AUTO_358]]"%s%s%s(%d/%d)",hintColor,hintStr,task_tbl[--[[!AUTO_359]]"EventTrigDesc_" .. i],task_tbl[--[[!AUTO_360]]"EventTrigCount_"..i],task_tbl[--[[!AUTO_361]]"EventTrig_"..i..--[[!AUTO_362]]"_Param_8"])

					--if HINT_INIT_STRING[task_tbl["ID"[i] ~= 1 then
					if task_tbl[--[[!AUTO_363]]"EventTrigCount_"..i] == 0 then
						HINT_INIT_STRING[task_tbl["ID"]][i] = 1
						LAST_SYSTEM_HINT[task_tbl["ID"]][i] = hintInfo
					end

					if LAST_SYSTEM_HINT[task_tbl["ID"]][i] ~= nil and hintInfo ~= LAST_SYSTEM_HINT[task_tbl["ID"]][i] and task_tbl[--[[!AUTO_364]]"EventTrigCount_"..i] ~= 0 and hintInfo ~= --[[!AUTO_365]]"" and (not task_tbl["Target"]) then
						TaskHelp:AddSystemHint(hintInfo)
						LAST_SYSTEM_HINT[task_tbl["ID"]][i] = hintInfo
					end

					if task_tbl[--[[!AUTO_366]]"EventTrigType_"..i] == 2 and task_tbl[--[[!AUTO_367]]"EventTrigCount_"..i] ~= task_tbl[--[[!AUTO_368]]"EventTrig_"..i..--[[!AUTO_369]]"_Param_8"] then
						local hintBind = --[[!AUTO_370]]""
						if CurBindSeat == task_tbl[--[[!AUTO_371]]"EventTrig_"..i..--[[!AUTO_372]]"_Param_1"] then
							if BindSeatStartTime + task_tbl[--[[!AUTO_373]]"EventTrig_"..i..--[[!AUTO_374]]"_Param_2"] <= os.time() then
								hintBind = string.format(--[[!AUTO_375]]"%s%s%s(%d秒，已達到時間)",TaskHelp.Color[--[[!]]"@白色@"][1],--[[!AUTO_376]]"目標：",task_tbl[--[[!AUTO_377]]"EventTrigDesc_" .. i], os.time()-BindSeatStartTime)
							end
						end
						if hintBind ~= LastBindString and hintBind ~= --[[!AUTO_378]]"" then
							if os.time() - LastHintTime >= 5 then
								TaskHelp:AddSystemHint(hintBind)
								LastHintTime = os.time()
								LastBindString = hintBind
							end
						end
					end
				end
			end
		end
	--客户端事件
	elseif task_tbl["Method"] == TaskHelp.Method.enumTMClientEvent then
		if task_tbl["CanFinish"] then
			sTarget = --[[!AUTO_379]]""

			hintInfo = string.format(--[[!AUTO_380]]"%s完成：%s", TaskHelp.Color[--[[!]]"@任务完成状态@"][1], task_tbl["Name"])
			if HINT_INIT_STRING[task_tbl["ID"]] ~= 1 then
				HINT_INIT_STRING[task_tbl["ID"]] = 1
				TaskHelp:AddSystemHint(hintInfo)
			  	LAST_SYSTEM_HINT[task_tbl["ID"]] = hintInfo
			end
		end
	--到达目标点完成任务
	elseif task_tbl["Method"] == TaskHelp.Method.enumTMReachSite then
		local name = TaskHelp:GetReachZoneName(task_tbl["ID"],task_tbl["ReachSceneId"])
		local x = (task_tbl["ReachSiteMin_X"] + task_tbl["ReachSiteMax_X"]) / 2
		local y = (task_tbl["ReachSiteMin_Y"] + task_tbl["ReachSiteMax_Y"]) / 2
		local z = (task_tbl["ReachSiteMin_Z"] + task_tbl["ReachSiteMax_Z"]) / 2
		local mapid = task_tbl["ReachSceneId"]
		local reachLink = --[[!AUTO_381]]""
		if task_tbl["IsTrack"] then
			reachLink = TaskHelp:BuildPathLink(x,y,z,mapid,TaskHelp.Color[--[[!]]"@寻径@"][1],TaskHelp.TARGET_POS,0,0,ReachTargeStyle)
		else
			reachLink = TaskHelp:BuildPathLink(x,y,z,mapid,TaskHelp.Color[--[[!]]"@寻径2@"][1],TaskHelp.TARGET_POS,0,0,ReachTargeStyle)
		end
		--LogPrint(tostring(reachLink))
		if task_tbl["CanFinish"] then
			if task_tbl["Target"] then
				hintInfo = string.format(--[[!AUTO_382]]"%s完成：%s",TaskHelp.Color[--[[!]]"@任务完成状态@"][1],task_tbl["Target"])
			else
				hintInfo = string.format(--[[!AUTO_383]]"%s完成：前往%s的目的地",TaskHelp.Color[--[[!]]"@任务完成状态@"][1],name)
				--hintInfo = string.format("%s完成：前往%s的[%d,%d]",TaskHelp.Color["@任务完成状态@"][1],name,x,z)
    			end

			if HINT_INIT_STRING[task_tbl["ID"]] ~= 1 then
				HINT_INIT_STRING[task_tbl["ID"]] = 1
			  	LAST_SYSTEM_HINT[task_tbl["ID"]] = hintInfo
			end

    			if LAST_SYSTEM_HINT[task_tbl["ID"]] ~= hintInfo and hintInfo ~= --[[!AUTO_384]]"" then
				TaskHelp:AddSystemHint(hintInfo)
				LAST_SYSTEM_HINT[task_tbl["ID"]] = hintInfo
			end

			reachLink = --[[!AUTO_385]]""
		end

    	if task_tbl["Target"] and string.match(task_tbl["Target"],--[[!AUTO_386]]"%[") == nil and string.match(task_tbl["Target"],--[[!AUTO_387]]"%]") == nil then
			if reachLink == --[[!AUTO_388]]"" then
    				sTarget = string.format(--[[!AUTO_389]]"%s%s%s",color,finishstr,task_tbl["Target"])
			else
    				sTarget = string.format(--[[!AUTO_390]]"%s%s%s%s",color,finishstr,task_tbl["Target"],reachLink)
			end
		elseif task_tbl["Target"] then
			tempTarget = TaskHelp:TargetTransform(task_tbl["Target"],TaskHelp.TARGET_POS,task_tbl["IsTrack"], task_tbl["ID"])
			sTarget = string.format(--[[!AUTO_391]]"%s%s%s",color,finishstr,tempTarget)
    		else
			if task_tbl["CanFinish"] then
				sTarget = TaskHelp.Color[--[[!]]"@区域名@"][1] .. --[[!AUTO_392]]"已經到達目的地"
			else
				if idCurScene == mapid then
    					task_tbl["TaskOrder"] = 1
					sTarget = string.format(--[[!AUTO_393]]"%s%s依計前往%s",color,finishstr,reachLink)
				else
    					sTarget = string.format(--[[!AUTO_394]]"%s%s前往%s%s%s的%s",color,finishstr,TaskHelp.Color[--[[!]]"@区域名@"][1],name,color,reachLink)
				end
			end
		end
	--时装风格搭配
	elseif task_tbl["Method"] == TaskHelp.Method.enumTMFashionStyle then
		if task_tbl["Target"] then
			sTarget = color..task_tbl["Target"]
		else 
			sTarget = color.."搭配以下風格的時裝"
		end
		sTarget = TaskHelp:ConcatInfo(sTarget,TaskHelp:TaskTrack_FashionInfo(task_tbl,1,host_prop_tbl))
		sTarget = TaskHelp:ConcatInfo(sTarget,TaskHelp:TaskTrack_FashionInfo(task_tbl,2,host_prop_tbl))
		sTarget = TaskHelp:ConcatInfo(sTarget,TaskHelp:TaskTrack_FashionInfo(task_tbl,3,host_prop_tbl))
		sTarget = TaskHelp:ConcatInfo(sTarget,TaskHelp:TaskTrack_FashionInfo(task_tbl,4,host_prop_tbl))
		sTarget = TaskHelp:ConcatInfo(sTarget,TaskHelp:TaskTrack_FashionInfo(task_tbl,5,host_prop_tbl))
		sTarget = TaskHelp:ConcatInfo(sTarget,TaskHelp:TaskTrack_FashionInfo(task_tbl,6,host_prop_tbl))
		sTarget = TaskHelp:ConcatInfo(sTarget,TaskHelp:TaskTrack_FashionInfo(task_tbl,7,host_prop_tbl))
		sTarget = TaskHelp:ConcatInfo(sTarget,TaskHelp:TaskTrack_FashionInfo(task_tbl,8,host_prop_tbl))
	--杀怪完成任务
	elseif task_tbl["Method"] == TaskHelp.Method.enumTMKillNumMonster then
		if task_tbl["Target"] then
			local id  = task_tbl["ItemID_1"]
			local fromid = task_tbl["ItemMonsterID_1"]
			local fromname = task_tbl["ItemMonsterName_1"]
			local zone,x,y,z,mapid = TaskHelp:GetItemInfo(id)
			local colLink = --[[!AUTO_395]]""
			if task_tbl["IsTrack"] then
				colLink = TaskHelp:BuildPathLink(x,y,z,mapid,TaskHelp.Color[--[[!]]"@寻径@"][1],TaskHelp.TARGET_MONSTER,id,fromid,fromname)
			else
				colLink = TaskHelp:BuildPathLink(x,y,z,mapid,TaskHelp.Color[--[[!]]"@寻径2@"][1],TaskHelp.TARGET_MONSTER,id,fromid,fromname)
			end
			if task_tbl["CanFinish"] then
				colLink = --[[!AUTO_396]]""
				finishstr = --[[!AUTO_397]]""
			end
			if string.match(task_tbl["Target"],--[[!AUTO_398]]"%[") == nil and string.match(task_tbl["Target"],--[[!AUTO_399]]"%]") == nil then
				sTarget = string.format(--[[!AUTO_400]]"%s%s%s%s",color,finishstr,task_tbl["Target"],colLink)
			else
				tempTarget = TaskHelp:TargetTransform(task_tbl["Target"],TaskHelp.TARGET_MONSTER,task_tbl["IsTrack"], task_tbl["ID"])
				sTarget = string.format(--[[!AUTO_401]]"%s%s%s",color,finishstr,tempTarget)
			end

			sTarget = TaskHelp:ConcatInfo(sTarget,TaskHelp:TaskTrack_MonsterInfo(task_tbl,1,host_prop_tbl))
			sTarget = TaskHelp:ConcatInfo(sTarget,TaskHelp:TaskTrack_MonsterInfo(task_tbl,2,host_prop_tbl))
			sTarget = TaskHelp:ConcatInfo(sTarget,TaskHelp:TaskTrack_MonsterInfo(task_tbl,3,host_prop_tbl))
			sTarget = TaskHelp:ConcatInfo(sTarget,TaskHelp:TaskTrack_MonsterInfo(task_tbl,4,host_prop_tbl))
			sTarget = TaskHelp:ConcatInfo(sTarget,TaskHelp:TaskTrack_MonsterInfo(task_tbl,5,host_prop_tbl))
			sTarget = TaskHelp:ConcatInfo(sTarget,TaskHelp:TaskTrack_MonsterInfo(task_tbl,6,host_prop_tbl))
			sTarget = TaskHelp:ConcatInfo(sTarget,TaskHelp:TaskTrack_MonsterInfo(task_tbl,7,host_prop_tbl))
			sTarget = TaskHelp:ConcatInfo(sTarget,TaskHelp:TaskTrack_MonsterInfo(task_tbl,8,host_prop_tbl))
		else
			sTarget = TaskHelp:ConcatInfo(sTarget,TaskHelp:TaskTrack_MonsterInfo(task_tbl,1,host_prop_tbl))
			sTarget = TaskHelp:ConcatInfo(sTarget,TaskHelp:TaskTrack_MonsterInfo(task_tbl,2,host_prop_tbl))
			sTarget = TaskHelp:ConcatInfo(sTarget,TaskHelp:TaskTrack_MonsterInfo(task_tbl,3,host_prop_tbl))
			sTarget = TaskHelp:ConcatInfo(sTarget,TaskHelp:TaskTrack_MonsterInfo(task_tbl,4,host_prop_tbl))
			sTarget = TaskHelp:ConcatInfo(sTarget,TaskHelp:TaskTrack_MonsterInfo(task_tbl,5,host_prop_tbl))
			sTarget = TaskHelp:ConcatInfo(sTarget,TaskHelp:TaskTrack_MonsterInfo(task_tbl,6,host_prop_tbl))
			sTarget = TaskHelp:ConcatInfo(sTarget,TaskHelp:TaskTrack_MonsterInfo(task_tbl,7,host_prop_tbl))
			sTarget = TaskHelp:ConcatInfo(sTarget,TaskHelp:TaskTrack_MonsterInfo(task_tbl,8,host_prop_tbl))
		end

	--杀人完成任务
	elseif task_tbl["Method"] == TaskHelp.Method.enumTMKillNumPerson then
		local tokill = task_tbl["PersonWanted"]		
		local killedlevel = task_tbl["PersonLevelWanted"]
		local KillPersonOverServer = task_tbl["KillPersonOverServer"]
		local killed = task_tbl["PersonKilled"]
		local hintStr = ""
		local hintColor = TaskHelp.Color[--[[!]]"@白色@"][1]	
		
		if KillPersonOverServer then
			if killedlevel == 0 then										--入侵杀人
				sTarget = string.format("%s目標：前往敵服擊殺玩家(%d/%d)", color, killed, tokill)
			else
				sTarget = string.format("%s目標：前往敵服擊殺%d級以上玩家(%d/%d)", color, killedlevel, killed, tokill)
			end
		else
			if killedlevel == 0 then
				sTarget = string.format("%s目標：擊殺玩家(%d/%d)", color, killed, tokill)	
			else		
				sTarget = string.format("%s目標：擊殺%d級以上玩家(%d/%d)", color, killedlevel, killed, tokill)	
			end
		end
		
		if killed <= tokill then
			if killed == tokill then
				hintColor = TaskHelp.Color["@任务完成状态@"][1]
				hintStr = --[[!AUTO_80]]"完成："
			end
			if tokill == 1 then
				hintInfo = string.format(--[[!AUTO_81]]"%s%s已擊殺：玩家",hintColor,hintStr)
			else
				hintInfo = string.format(--[[!AUTO_82]]"%s%s已擊殺：%d個玩家(%d/%d)",hintColor,hintStr,killed,killed,tokill)
			end
			
			--if HINT_INIT_STRING[task_tbl["ID"]] ~= 1 then：防止接第二次时显示不正确
			if killed == 0 then
				HINT_INIT_STRING[task_tbl["ID"]] = 1
				LAST_SYSTEM_HINT[task_tbl["ID"]] = hintInfo
			end

			if LAST_SYSTEM_HINT[task_tbl["ID"]] ~= hintInfo and hintInfo ~= "" then
				TaskHelp:AddSystemHint(hintInfo)
				LAST_SYSTEM_HINT[task_tbl["ID"]] = hintInfo
			end		
    	end			
		
    	
	--入侵劫镖完成任务
	elseif task_tbl["Method"] == TaskHelp.Method.enumTMRobNumDart then
		local dartWanted = task_tbl["DartWanted"]
		local dartRobbed = task_tbl["DartRobbed"]
		local RobDartOverServer = task_tbl["RobDartOverServer"]
		local hintStr = ""
		local hintColor = TaskHelp.Color[--[[!]]"@白色@"][1]		
		
		if RobDartOverServer then
			sTarget = string.format("%s目標：前往敵服劫持鏢車(%d/%d)", color, dartRobbed, dartWanted)
		else
			sTarget = string.format("%s目標：劫持鏢車(%d/%d)", color, dartRobbed, dartWanted)
		end
		
		if dartRobbed <= dartWanted then
			if dartRobbed == dartWanted then
				hintColor = TaskHelp.Color["@任务完成状态@"][1]
				hintStr = --[[!AUTO_80]]"完成："
			end
			if dartWanted == 1 then
				hintInfo = string.format(--[[!AUTO_81]]"%s%s已在劫持：鏢車", hintColor, hintStr)
			else
				hintInfo = string.format(--[[!AUTO_82]]"%s%s已在劫持：%d個鏢車(%d/%d)", hintColor, hintStr, dartRobbed, dartRobbed, dartWanted)
			end			
			
			--if HINT_INIT_STRING[task_tbl["ID"]] ~= 1 then：防止接第二次时显示不正确
			if dartRobbed == 0 then
				HINT_INIT_STRING[task_tbl["ID"]] = 1
				LAST_SYSTEM_HINT[task_tbl["ID"]] = hintInfo
			end

			if LAST_SYSTEM_HINT[task_tbl["ID"]] ~= hintInfo and hintInfo ~= "" then
				TaskHelp:AddSystemHint(hintInfo)
				LAST_SYSTEM_HINT[task_tbl["ID"]] = hintInfo
			end		
		end	
		
    	
	--收集物品（含挖矿，任务物品产生器）
	elseif task_tbl["Method"] == TaskHelp.Method.enumTMCollectNumArticle then
		if task_tbl["Target"] then
			local id  = task_tbl["ItemID_1"]
			local fromid = task_tbl["ItemMonsterID_1"]
			local fromname = task_tbl["ItemMonsterName_1"]
			local zone,x,y,z,mapid = TaskHelp:GetItemInfo(id)
			local colLink = --[[!AUTO_402]]""
			local taskid  = task_tbl["ID"]
			local taskflag  = TaskHelp:GetTaskFlag (taskid)

			if task_tbl["IsTrack"] then
				colLink = TaskHelp:BuildPathLink(x,y,z,mapid,TaskHelp.Color[--[[!]]"@寻径@"][1],TaskHelp.TARGET_ITEM,id,fromid,CommonTargetStyle)
			else
				colLink = TaskHelp:BuildPathLink(x,y,z,mapid,TaskHelp.Color[--[[!]]"@寻径2@"][1],TaskHelp.TARGET_ITEM,id,fromid,CommonTargetStyle)
			end

			if task_tbl["CanFinish"] then
				colLink = --[[!AUTO_403]]""
				hintInfo = string.format(--[[!AUTO_404]]"%s完成：%s",TaskHelp.Color[--[[!]]"@任务完成状态@"][1],task_tbl["Target"])

				if HINT_INIT_STRING[task_tbl["ID"]] ~= 1 then
					HINT_INIT_STRING[task_tbl["ID"]] = 1
					LAST_SYSTEM_HINT[task_tbl["ID"]] = hintInfo
				end

				if LAST_SYSTEM_HINT[task_tbl["ID"]] ~= hintInfo and hintInfo ~= --[[!AUTO_405]]"" then
					TaskHelp:AddSystemHint(hintInfo)
					LAST_SYSTEM_HINT[task_tbl["ID"]] = hintInfo
				end
			end

			if string.match(task_tbl["Target"],--[[!AUTO_406]]"%[") == nil and string.match(task_tbl["Target"],--[[!AUTO_407]]"%]") == nil then
				if zone == --[[!AUTO_408]]"" then
					sTarget = string.format(--[[!AUTO_409]]"%s目標：%s%s",color,finishstr,task_tbl["Target"])
				else
					if task_tbl["CanFinish"] then
						sTarget = --[[!AUTO_410]]""
						--string.format("%s目标：%s%s",color,finishstr,task_tbl["Target"])
					else
						sTarget = string.format(--[[!AUTO_411]]"%s目標：%s%s%s",color,finishstr,task_tbl["Target"],colLink)
					end
				end
			else
				if task_tbl["CanFinish"] then
					tempTarget = --[[!AUTO_412]]""
				        if  taskflag  == 0 then
					    sTarget = --[[!AUTO_413]]""
					end
				else
					tempTarget = TaskHelp:TargetTransform(task_tbl["Target"],TaskHelp.TARGET_ITEM,task_tbl["IsTrack"], task_tbl["ID"])
					--LogPrint(tostring(tempTarget))
					sTarget = string.format(--[[!AUTO_414]]"%s目標：%s%s",color,finishstr,tempTarget)
				end
			end

			if taskflag  ~= 2 then
				sTarget = TaskHelp:ConcatInfo(sTarget,TaskHelp:TaskTrack_ItemInfo(task_tbl,1,host_prop_tbl))
				sTarget = TaskHelp:ConcatInfo(sTarget,TaskHelp:TaskTrack_ItemInfo(task_tbl,2,host_prop_tbl))
				sTarget = TaskHelp:ConcatInfo(sTarget,TaskHelp:TaskTrack_ItemInfo(task_tbl,3,host_prop_tbl))
				sTarget = TaskHelp:ConcatInfo(sTarget,TaskHelp:TaskTrack_ItemInfo(task_tbl,4,host_prop_tbl))
				sTarget = TaskHelp:ConcatInfo(sTarget,TaskHelp:TaskTrack_ItemInfo(task_tbl,5,host_prop_tbl))
				sTarget = TaskHelp:ConcatInfo(sTarget,TaskHelp:TaskTrack_ItemInfo(task_tbl,6,host_prop_tbl))
				sTarget = TaskHelp:ConcatInfo(sTarget,TaskHelp:TaskTrack_ItemInfo(task_tbl,7,host_prop_tbl))
				sTarget = TaskHelp:ConcatInfo(sTarget,TaskHelp:TaskTrack_ItemInfo(task_tbl,8,host_prop_tbl))
			end
		else
			sTarget = TaskHelp:ConcatInfo(sTarget,TaskHelp:TaskTrack_ItemInfo(task_tbl,1,host_prop_tbl))
			sTarget = TaskHelp:ConcatInfo(sTarget,TaskHelp:TaskTrack_ItemInfo(task_tbl,2,host_prop_tbl))
			sTarget = TaskHelp:ConcatInfo(sTarget,TaskHelp:TaskTrack_ItemInfo(task_tbl,3,host_prop_tbl))
			sTarget = TaskHelp:ConcatInfo(sTarget,TaskHelp:TaskTrack_ItemInfo(task_tbl,4,host_prop_tbl))
			sTarget = TaskHelp:ConcatInfo(sTarget,TaskHelp:TaskTrack_ItemInfo(task_tbl,5,host_prop_tbl))
			sTarget = TaskHelp:ConcatInfo(sTarget,TaskHelp:TaskTrack_ItemInfo(task_tbl,6,host_prop_tbl))
			sTarget = TaskHelp:ConcatInfo(sTarget,TaskHelp:TaskTrack_ItemInfo(task_tbl,7,host_prop_tbl))
			sTarget = TaskHelp:ConcatInfo(sTarget,TaskHelp:TaskTrack_ItemInfo(task_tbl,8,host_prop_tbl))

	 
			 
		end
	--护送NPC
	elseif task_tbl["Method"] == TaskHelp.Method.enumTMConvoyNPC then
		local convoyNPC		= task_tbl["ConvoyNPC"]
		local convoyNPCName	= task_tbl["ConvoyNPCName"]
		local convoyTargetString	= task_tbl["Target"]

		sTarget = string.format(--[[!AUTO_415]]"%s同伴%s：%s", TaskHelp.Color[--[[!]]"@计数@"][1], TaskHelp.Color[--[[!]]"@标准@"][1], convoyNPCName)

		if not task_tbl["CanFinish"] then
			if convoyTargetString then
				if awardNpcZone == --[[!AUTO_416]]"" then
					sTarget = string.format(--[[!AUTO_417]]"%s\r%s", sTarget, convoyTargetString)
				else
					--sTarget = string.format("%s\r%s[%s]", sTarget, convoyTargetString, awardNpcLink)
					sTarget = string.format(--[[!AUTO_418]]"%s\r%s", sTarget, convoyTargetString)
				end
			else
				if awardNpcZone == --[[!AUTO_419]]"" then
					sTarget = string.format(--[[!AUTO_420]]"%s\r護送同伴抵達%s%s處", sTarget, TaskHelp.Color[--[[!]]"@标准@"][1], awardNpcName)
				else
					if idCurScene == award_mapid then
						task_tbl["TaskOrder"] = 1
						sTarget = string.format(--[[!AUTO_421]]"%s\r護送同伴抵達%s處", sTarget, awardNpcName)
					else
						--sTarget = string.format("%s\r护送同伴抵达%s%s%s的[%s]处", sTarget, TaskHelp.Color["@区域名@"][1], awardNpcZone, TaskHelp.Color["@标准@"][1], awardNpcLink)
						sTarget = string.format(--[[!AUTO_422]]"%s\r護送同伴抵達%s%s%s的%s處", sTarget, TaskHelp.Color[--[[!]]"@区域名@"][1], awardNpcZone, TaskHelp.Color[--[[!]]"@标准@"][1], awardNpcName)
					end
				end
			end
		end
	--押镖NPC
	elseif task_tbl["Method"] == TaskHelp.Method.enumTMEscortNPC then
		local escortNPC		= task_tbl["EscortNPC"]
		local escortNPCName	= task_tbl["EscortNPCName"]
		local escortNPCSceneID	= task_tbl["EscortTargetSceneID"]
		local escortNPCZone	= TaskHelp.Scene[escortNPCSceneID] or --[[!AUTO_423]]""
		local escortNPCInstanceID	= task_tbl["EscortTargetInstanceID"]
		local escortNPCMin_X	= task_tbl["EscortTargetMin_X"]
		local escortNPCMin_Y	= task_tbl["EscortTargetMin_Y"]
		local escortNPCMin_Z	= task_tbl["EscortTargetMin_Z"]
		local escortNPCMax_X	= task_tbl["EscortTargetMax_X"]
		local escortNPCMax_Y	= task_tbl["EscortTargetMax_Y"]
		local escortNPCMax_Z	= task_tbl["EscortTargetMax_Z"]
		local escortTargetString
		if task_tbl["Target"] then
			if  string.match(task_tbl["Target"],--[[!AUTO_424]]"%[") == nil and string.match(task_tbl["Target"],--[[!AUTO_425]]"%]") == nil then
				escortTargetString = string.format(--[[!AUTO_426]]"%s%s%s%s",color,finishstr,task_tbl["Target"],talkNpcLink)
			else
				local tempTarget = TaskHelp:TargetTransform(task_tbl["Target"],TaskHelp.TARGET_NPC,task_tbl["IsTrack"], task_tbl["ID"])
				escortTargetString = string.format(--[[!AUTO_427]]"%s%s%s",color,finishstr,tempTarget)
			end
		else
			escortTargetString = --[[!AUTO_428]]""
		end

		local escortTargetLink = --[[!AUTO_429]]""
		if task_tbl["IsTrack"] and escortNPCMin_X and escortNPCMin_Y and escortNPCMin_Z then
			escortTargetLink	= TaskHelp:BuildPathLink((escortNPCMin_X+escortNPCMax_X)/2,(escortNPCMin_Y+escortNPCMax_Y)/2,(escortNPCMin_Z+escortNPCMax_Z)/2,escortNPCSceneID,TaskHelp.Color["@寻径@"][1],TaskHelp.TARGET_POS,0,0,ReachTargeStyle)
		elseif escortNPCMin_X and escortNPCMin_Y and escortNPCMin_Z then
			escortTargetLink	= TaskHelp:BuildPathLink((escortNPCMin_X+escortNPCMax_X)/2,(escortNPCMin_Y+escortNPCMax_Y)/2,(escortNPCMin_Z+escortNPCMax_Z)/2,escortNPCSceneID,TaskHelp.Color["@寻径2@"][1],TaskHelp.TARGET_POS,0,0,ReachTargeStyle)
		end

		sTarget = string.format(--[[!AUTO_430]]"%s同伴%s：%s", TaskHelp.Color[--[[!]]"@计数@"][1], TaskHelp.Color[--[[!]]"@标准@"][1], escortNPCName)

		if not task_tbl["CanFinish"] and scortNPCZone ~= --[[!AUTO_431]]"" then
			if escortTargetString then
				sTarget = string.format(--[[!AUTO_432]]"%s\r%s%s", sTarget, escortTargetString, escortTargetLink)
			else
				if idCurScene == escortNPCSceneID then
					task_tbl["TaskOrder"] = 1
					sTarget = string.format(--[[!AUTO_433]]"%s\r與同伴一同前往%s", sTarget, escortTargetLink)
				else
					sTarget = string.format(--[[!AUTO_434]]"%s\r與同伴一同前往%s%s%s的%s", sTarget, TaskHelp.Color[--[[!]]"@区域名@"][1], escortNPCZone, TaskHelp.Color[--[[!]]"@标准@"][1], escortTargetLink)
				end
			end
		end
	--收集等价物品
	elseif task_tbl["Method"] == TaskHelp.Method.enumTMCollectEqualItem then
		local _, item_name = DescUtility:GetItemDBProp(task_tbl["EqualItemTblId"], ClassType.ICID_EQUALITEM, --[[!AUTO_435]]"t_name")

		if HINT_INIT_STRING[task_tbl["ID"]] ~= 1 then
			HINT_INIT_STRING[task_tbl["ID"]] = 1
			LAST_SYSTEM_HINT[task_tbl["ID"]] = --[[!AUTO_436]]""
		end

		if idCurScene == award_mapid then
			task_tbl["TaskOrder"] = 1
		end

		if task_tbl["Target"] then
			if  string.match(task_tbl["Target"],--[[!AUTO_437]]"%[") == nil and string.match(task_tbl["Target"],--[[!AUTO_438]]"%]") == nil then
				sTarget = string.format(--[[!AUTO_439]]"%s%s%s%s",color,finishstr,task_tbl["Target"],talkNpcLink)
			else
				tempTarget = TaskHelp:TargetTransform(task_tbl["Target"],TaskHelp.TARGET_NPC,task_tbl["IsTrack"], task_tbl["ID"])
				sTarget = string.format(--[[!AUTO_440]]"%s%s%s",color,finishstr,tempTarget)
			end
			hintInfo = string.format(--[[!AUTO_441]]"%s完成：%s",TaskHelp.Color[--[[!]]"@任务完成状态@"][1],task_tbl["Target"])
		else
			if task_tbl["EqualItemGain"] >= 1 then
				hintInfo = string.format(--[[!AUTO_442]]"%s完成：收集%s",TaskHelp.Color[--[[!]]"@任务完成状态@"][1],item_name)
				sTarget = --[[!AUTO_443]]""
			else
				if task_tbl["IsTrack"] then
					sTarget = string.format(--[[!AUTO_444]]"%s收集：%s(%d/1)",color,item_name,task_tbl["EqualItemGain"])
				else
					sTarget = string.format(--[[!AUTO_445]]"%s收集：%s(%d/1)",color,item_name,task_tbl["EqualItemGain"])
				end
			end
		end

		if LAST_SYSTEM_HINT[task_tbl["ID"]] ~= hintInfo and hintInfo ~= --[[!AUTO_446]]"" then
			TaskHelp:AddSystemHint(hintInfo)
			LAST_SYSTEM_HINT[task_tbl["ID"]] = hintInfo
		end
	-- 动态目标
	elseif task_tbl["Method"] == TaskHelp.Method.enumTMDynamicTarget then
		local hintInfo
		local type = task_tbl.DynamicTargetType
		if type == DYNAMIC_TARGET_TYPE.ONEMONSTER then
			local monsterId, monsterName, sceneId, posX, posY, posZ =
				task_tbl.MonsterID, task_tbl.MonsterName, task_tbl.SceneID, task_tbl.PosX, task_tbl.PosY, task_tbl.PosZ
			local sceneName = TaskHelp:GetReachZoneName(task_tbl.ID, sceneId)
			local reachLink = TaskHelp:BuildPathLink(posX,posY,posZ,sceneId,TaskHelp.Color[task_tbl.IsTrack and --[[!]]"@寻径@" or --[[!]]"@寻径2@"][1],TaskHelp.TARGET_POS,0,0,CoordTargetStyle)
			-- color 为未完成之默认颜色
			if not task_tbl.CanFinish then	-- 未完成
				sTarget = (--[[!AUTO_447]]"%s去%s%s%s%s附近擊殺%s%s(%d/1)"):format(color, TaskHelp.Color["@区域名@"][1], sceneName, reachLink, color, monsterName, color, 0)
			else		-- 已完成
				if task_tbl.IsSuccess then
					local hintColor = TaskHelp.Color[--[[!]]"@任务完成状态@"][1]
					local hintStr = --[[!AUTO_448]]"完成："
					hintInfo = string.format(--[[!AUTO_449]]"%s%s已擊殺：%s",hintColor,hintStr,monsterName)
				end
			end
		else
			sTarget = --[[!AUTO_450]]"ERROR: 未知的動態目標"
		end

		if hintInfo and LAST_SYSTEM_HINT[task_tbl["ID"]] ~= hintInfo then
			TaskHelp:AddSystemHint(hintInfo)
			LAST_SYSTEM_HINT[task_tbl["ID"]] = hintInfo
		end
	--绑架NPC
	elseif task_tbl["Method"] == TaskHelp.Method.enumTMHijackNPC then
		local hintInfo
		local hijackNPC = task_tbl.HijackNPC		--需绑架的NPC
		local hijackNPCName = task_tbl.HijackNPCName
		local zone,x,y,z,mapid = TaskHelp:GetItemInfo(hijackNPC)
		local reachLink
		if mapid ~= 0 then		-- found
			reachLink = TaskHelp:BuildPathLink(x,y,z,mapid,TaskHelp.Color[task_tbl.IsTrack and --[[!]]"@寻径@" or --[[!]]"@寻径2@"][1],TaskHelp.TARGET_POS,0,0,hijackNPCName)
		else
			reachLink = hijackNPCName
		end
		if not task_tbl.CanFinish then	-- 未完成
			if task_tbl["Target"] then
				if  string.match(task_tbl["Target"],--[[!AUTO_451]]"%[") == nil and string.match(task_tbl["Target"],--[[!AUTO_452]]"%]") == nil then
					sTarget = string.format(--[[!AUTO_453]]"%s%s%s%s",color,finishstr,task_tbl["Target"],talkNpcLink)
				else
					tempTarget = TaskHelp:TargetTransform(task_tbl["Target"],TaskHelp.TARGET_NPC,task_tbl["IsTrack"], task_tbl["ID"])
					sTarget = string.format(--[[!AUTO_454]]"%s%s%s",color,finishstr,tempTarget)
				end
			else
				sTarget = (--[[!AUTO_455]]"去%s%s綁架%s%s"):format(zone, color, reachLink, color)
			end
		else		-- 已完成
			if task_tbl.IsSuccess then
				local hintColor = TaskHelp.Color[--[[!]]"@任务完成状态@"][1]
				local hintStr = --[[!AUTO_456]]"完成："
				hintInfo = string.format(--[[!AUTO_457]]"%s%s已綁架：%s",hintColor,hintStr,hijackNPCName)
			end
		end

		if hintInfo and LAST_SYSTEM_HINT[task_tbl["ID"]] ~= hintInfo then
			TaskHelp:AddSystemHint(hintInfo)
			LAST_SYSTEM_HINT[task_tbl["ID"]] = hintInfo
		end
	else
		if task_tbl["Target"] and task_tbl["TalkNpc"] then
			if  string.match(task_tbl["Target"],--[[!AUTO_458]]"%[") == nil and string.match(task_tbl["Target"],--[[!AUTO_459]]"%]") == nil then
				sTarget = string.format(--[[!AUTO_460]]"%s%s%s%s",color,finishstr,task_tbl["Target"],talkNpcLink)
			else
				tempTarget = TaskHelp:TargetTransform(task_tbl["Target"],TaskHelp.TARGET_NPC,task_tbl["IsTrack"], task_tbl["ID"])
				sTarget = string.format(--[[!AUTO_461]]"%s%s%s",color,finishstr,tempTarget)
			end
			hintInfo = string.format(--[[!AUTO_462]]"%s完成：%s",TaskHelp.Color[--[[!]]"@任务完成状态@"][1],task_tbl["Target"])
			if HINT_INIT_STRING[task_tbl["ID"]] ~= 1 then
				HINT_INIT_STRING[task_tbl["ID"]] = 1
			  	LAST_SYSTEM_HINT[task_tbl["ID"]] = hintInfo
			end
			if LAST_SYSTEM_HINT[task_tbl["ID"]] ~= hintInfo and hintInfo ~= --[[!AUTO_463]]"" then
				TaskHelp:AddSystemHint(hintInfo)
				LAST_SYSTEM_HINT[task_tbl["ID"]] = hintInfo
			end
		else
			if task_tbl["FinishType"] == TaskHelp.FinishType.enumTFTDirect then
				if task_tbl["FinishLev"] > 0 then
					if host_prop_tbl.level >= task_tbl["FinishLev"] then	--等级够
		  				sTarget = string.format(--[[!AUTO_464]]"%s%s將角色等級提升至%s%d",color,finishstr,TaskHelp.Color[--[[!]]"@人物等级满足@"][1],task_tbl["FinishLev"])
					else
		  				--sTarget = string.format("%s%s将角色等级提升至%s%d",color,finishstr,TaskHelp.Color["@人物等级@"][1],task_tbl["FinishLev"])
						sTarget = --[[!AUTO_465]]""	--在Info中已显示
					end
				end
			else
				if task_tbl["FinishLev"] > host_prop_tbl.level then		--等级不够时 (注意，此条件肢中等级足够的子分支未去除)
					sTarget = --[[!AUTO_466]]""	--在Info中已显示
					--[[
					if host_prop_tbl.level >= task_tbl["FinishLev"] then
						if talkNpc > 0 then
							if idCurScene == talk_mapid then
								task_tbl["TaskOrder"] = 1
								sTarget = string.format("%s%s将角色等级提升至%s%d，\r%s再前去拜访%s%s",color,finishstr,TaskHelp.Color["@人物等级满足@"][1],task_tbl["FinishLev"],color,TaskHelp.Color["@NPC名@"][1],talkNpcLink)
							else
								sTarget = string.format("%s%s将角色等级提升至%s%d，\r%s再去%s%s%s找%s%s",color,finishstr,TaskHelp.Color["@人物等级满足@"][1],task_tbl["FinishLev"],color,TaskHelp.Color["@区域名@"][1],talkNpcZone,color,TaskHelp.Color["@NPC名@"][1],talkNpcLink)
							end
						else
							sTarget = string.format("%s%s将角色等级提升至%s%d",color,finishstr,TaskHelp.Color["@人物等级满足@"][1],task_tbl["FinishLev"])
						end
					else
						if talkNpc > 0 then
							if idCurScene == talk_mapid then
								task_tbl["TaskOrder"] = 1
								sTarget = string.format("%s%s将角色等级提升至%s%d，\r%s再前去拜访%s%s",color,finishstr,TaskHelp.Color["@人物等级@"][1],task_tbl["FinishLev"],color,TaskHelp.Color["@NPC名@"][1],talkNpcLink)
							else
								sTarget = string.format("%s%s将角色等级提升至%s%d，\r%s再去%s%s%s找%s%s",color,finishstr,TaskHelp.Color["@人物等级@"][1],task_tbl["FinishLev"],color,TaskHelp.Color["@区域名@"][1],talkNpcZone,color,TaskHelp.Color["@NPC名@"][1],talkNpcLink)
							end
						else
							sTarget = string.format("%s%s将角色等级提升至%s%d",color,finishstr,TaskHelp.Color["@人物等级@"][1],task_tbl["FinishLev"])
						end
					end
					]]
				else
					if talkNpc > 0 then
						if task_tbl["CanFinish"] then
							sTarget = --[[!AUTO_467]]""
						else
							if idCurScene == talk_mapid then
								task_tbl["TaskOrder"] = 1
								sTarget = string.format(--[[!AUTO_468]]"%s%s找%s%s%s瞭解情況",color,finishstr,TaskHelp.Color[--[[!]]"@NPC名@"][1],talkNpcLink,color)
							else
								if talkNpcZone == --[[!AUTO_469]]"" then
									sTarget = string.format(--[[!AUTO_470]]"%s%s前往%s拜訪%s%s%s",color,finishstr,color,TaskHelp.Color[--[[!]]"@NPC名@"][1],talkNpcLink,color)
								else
									sTarget = string.format(--[[!AUTO_471]]"%s%s前往%s%s%s拜訪%s%s%s",color,finishstr,TaskHelp.Color[--[[!]]"@区域名@"][1],talkNpcZone,color,TaskHelp.Color[--[[!]]"@NPC名@"][1],talkNpcLink,color)
								end
							end
						end
					else
						finishstr = --[[!AUTO_472]]""
						if task_tbl["IsTrack"] then
							awardNpcLink = TaskHelp:BuildPathLink(award_x,award_y,award_z,award_mapid,TaskHelp.Color[--[[!]]"@寻径@"][1],TaskHelp.TARGET_NPC,awardNpc,0,awardNpcName)
						else
							awardNpcLink = TaskHelp:BuildPathLink(award_x,award_y,award_z,award_mapid,TaskHelp.Color[--[[!]]"@寻径2@"][1],TaskHelp.TARGET_NPC,awardNpc,0,awardNpcName)
						end
					--[[	--现在任务面板也会显示 TaskTrack_Info
						if not task_tbl["IsTrack"] then
							finishstr =""
							if idCurScene == award_mapid then
								task_tbl["TaskOrder"] = 1
								if awardNpcZone == "" then
									sTarget = string.format("%s%s回报%s%s",color,finishstr,TaskHelp.Color["@NPC名@"][1],awardNpcName)
								else
									sTarget = string.format("%s%s回报%s%s",color,finishstr,TaskHelp.Color["@NPC名@"][1],awardNpcLink)
								end
							else
								if awardNpcZone == "" then
									sTarget = string.format("%s%s去%s找%s%s",color,finishstr,color,TaskHelp.Color["@NPC名@"][1],awardNpcName)
								else
									sTarget = string.format("%s%s去%s%s%s找%s%s",color,finishstr,TaskHelp.Color["@区域名@"][1],awardNpcZone,color,TaskHelp.Color["@NPC名@"][1],awardNpcLink)
								end
							end
						end
					--]]
					end
				end
			end
		end
	end

	--显示同伴NPC

	for i = 1,4 do
		local beckonNpcID = task_tbl[--[[!AUTO_473]]"BeckonNPCId_" .. i]
		local beckonNpcName = task_tbl[--[[!AUTO_474]]"BeckonNPCName_" .. i]
		if beckonNpcID and beckonNpcID > 0 then
			if sTarget ~= --[[!AUTO_475]]"" then
				sTarget = string.format(--[[!AUTO_476]]"%s同伴%s：%s\r%s%s", TaskHelp.Color[--[[!]]"@计数@"][1], TaskHelp.Color[--[[!]]"@标准@"][1], beckonNpcName,TableString,sTarget)
			else
				sTarget = string.format(--[[!AUTO_477]]"%s同伴%s：%s", TaskHelp.Color[--[[!]]"@计数@"][1], TaskHelp.Color[--[[!]]"@标准@"][1], beckonNpcName)
			end
		end
	end

	--显示交互道具
	local bindID = task_tbl["BindID"]
	local bindName = task_tbl["BindName"]
	if bindID > 0 then
		if sTarget ~= --[[!AUTO_478]]"" then
			sTarget = string.format(--[[!AUTO_479]]"%s互動道具%s：%s\r%s", TaskHelp.Color[--[[!]]"@计数@"][1], TaskHelp.Color[--[[!]]"@标准@"][1], bindName, sTarget)
		else
			sTarget = string.format(--[[!AUTO_480]]"%s互動道具%s：%s", TaskHelp.Color[--[[!]]"@计数@"][1], TaskHelp.Color[--[[!]]"@标准@"][1], bindName)
		end
	end

	--任务状态提示
	if task_tbl["TaskState"] then
		local nowTaskState = --[[!AUTO_481]]""
	--[[
		nowTaskState = task_tbl["Name"] .. "(" .. task_tbl["ID"] .. ")"
		if bit.band(task_tbl["TaskState"], TaskHelp.TaskState.TASK_STATE_FINISHED) > 0 then
			nowTaskState = nowTaskState .. "任务完成"
		end
		if bit.band(task_tbl["TaskState"], TaskHelp.TaskState.TASK_STATE_SUCCESS) > 0 then
			nowTaskState = nowTaskState .. "任务成功"
		end
		if bit.band(task_tbl["TaskState"], TaskHelp.TaskState.TASK_STATE_GIVEUP) > 0 then
			nowTaskState = nowTaskState .. "任务放弃"
		end
		if bit.band(task_tbl["TaskState"], TaskHelp.TaskState.TASK_STATE_ERR_REPORTED) > 0 then
			nowTaskState = nowTaskState .. "任务错误发送到客户端"
		end
		if bit.band(task_tbl["TaskState"], TaskHelp.TaskState.TASK_STATE_AWARD_NOTIFY_TEAM) > 0 then
			nowTaskState = nowTaskState .. "任务奖励通知队员"
		end
		if bit.band(task_tbl["TaskState"], TaskHelp.TaskState.TASK_STATE_AWARD_FAMILY) > 0 then
			nowTaskState = nowTaskState .. "任务发放家族相关奖励"
		end
		if bit.band(task_tbl["TaskState"], TaskHelp.TaskState.TASK_STATE_HIDDEN) > 0 then
			nowTaskState = nowTaskState .. "任务为隐藏"
		end
		]]--
		if bit.band(task_tbl["TaskState"], TaskHelp.TaskState.TASK_STATE_ALARM) > 0 then
			local npcstate = task_tbl["ConvoyNPCState"]
			if npcstate then
				if npcstate == 1 then
					nowTaskState = string.format(--[[!AUTO_482]]"%s距離護送對象過遠(%s)", TaskHelp.Color[--[[!]]"@粉红@"][1], task_tbl["Name"])
				elseif npcstate == 2 then
					nowTaskState = string.format(--[[!AUTO_482]]"%s距離護送對象過近(%s)", TaskHelp.Color[--[[!]]"@粉红@"][1], task_tbl["Name"])
				end
			end
		end
		--LogPrint(nowTaskState)

		if os.time() - LastWarnTime >= 2 and nowTaskState ~= --[[!AUTO_483]]"" then
			TaskHelp:AddSystemHint(nowTaskState)
			LastWarnTime = os.time()
		end
	end

	if not task_tbl["IsTrack"] then
		sTarget = string.gsub(sTarget,--[[!AUTO_484]]"cccccc",TaskHelp.Color[--[[!]]"@黑色@"][1])
		sTarget = string.gsub(sTarget,--[[!AUTO_485]]"ffffff",TaskHelp.Color[--[[!]]"@黑色@"][1])
	end

	if task_tbl["TrackType"] == 1002 then
		local str = TextLink:BuildCodeLink(--[[!AUTO_486]]"線索推導（點擊打開推導介面）", (--[[!AUTO_487]][[GameApi.PopupDetectionDeduceDialog(%d)]]):format(task_tbl["ID"]), linkColorValue)
		sTarget = sTarget .. --[[!AUTO_488]]"\r" .. str
	elseif task_tbl["TrackType"] == 1003 then
		local str = TextLink:BuildCodeLink(--[[!AUTO_489]]"偵破結局（點擊打開結局介面）", (--[[!AUTO_490]][[GameApi.PopupDetectionEndingDialog(%d)]]):format(task_tbl["ID"]), linkColorValue)
		sTarget = sTarget .. --[[!AUTO_491]]"\r" .. str
	end

	if string.len(sTarget)>0 then
		sTarget = TableString..sTarget
	end

	return sTarget
end

--任务警告
function TaskHelp:TaskTrack_Warn(task_tbl,host_prop_tbl)
	l_curTaskInfo.taskId = task_tbl.ID

	--可接任务不显示Warning
	if task_tbl["Have"] ~= nil and task_tbl["Have"] == false then
		return --[[!AUTO_492]]""
	end

	local lifeWarn = --[[!AUTO_493]]""
	local sceneWarn = --[[!AUTO_494]]""
	local timeWarn = --[[!AUTO_495]]""
	if task_tbl["HaveLifeLimit"] then
		--lifeWarn = string.format("%s◎生存限制",TaskHelp.Color["@任务限制@"][1])
	end

	if task_tbl["HaveSceneLimit"] then
		--sceneWarn = string.format("%s◎场景限制",TaskHelp.Color["@任务限制@"][1])
	end

	if task_tbl["HaveTimeLimit"] and task_tbl["TimeLimit"] and task_tbl["TimePassed"] then
		local timeleft = task_tbl["TimeLimit"] - task_tbl["TimePassed"]
		if timeleft < 0 then timeleft = 0 end

		if timeleft <= 60 then
			timeWarn = string.format(--[[!AUTO_496]]"%s◎時間限制[%s%d %s秒]",TaskHelp.Color[--[[!]]"@任务限制@"][1],TaskHelp.Color[--[[!]]"@警告@"][1],timeleft,TaskHelp.Color[--[[!]]"@任务限制@"][1])
		else
			timeWarn = string.format(--[[!AUTO_497]]"%s◎時間限制[%s%d %s分]",TaskHelp.Color[--[[!]]"@任务限制@"][1],TaskHelp.Color[--[[!]]"@警告@"][1],math.ceil(timeleft/60),TaskHelp.Color[--[[!]]"@任务限制@"][1])
		end
	else
		timeWarn = --[[!AUTO_498]]""
	end

	--暂时合成一行

	lifeWarn = timeWarn .. sceneWarn .. lifeWarn
	sceneWarn = --[[!AUTO_499]]""
	timeWarn = --[[!AUTO_500]]""
	if string.len(lifeWarn)>0 then
		lifeWarn = TableString..lifeWarn
	end

	return lifeWarn,sceneWarn,timeWarn
end

--开始座位绑定
function TaskHelp:OnBindSeat(vehicle_tid,pos_in_bind)
	CurBindSeat = vehicle_tid
	BindSeatStartTime = os.time()
end

--离开座位绑定
function TaskHelp:OnUnBindSeat(vehicle_tid,pos_in_bind)
	if vehicle_tid == CurBindSeat then
		CurBindSeat = 0
	end
	BindSeatEndTime = os.time()
end

--Npc描述信息
function TaskHelp:GetTaskNpcLink(idNpc,nameNpc)
    return TaskHelp:GetTaskNpcLinkWithTextColor(idNpc,nameNpc,TaskHelp.Color[--[[!]]"@黑色@"][2])
end

--Npc描述信息
function TaskHelp:GetTaskNpcLinkWithTextColor(idNpc,nameNpc,textColor)
	if ObjInfo[idNpc] then
		local npcZone,npc_x,npc_y,npc_z,npc_mapid,npc_objname = TaskHelp:GetNpcPos(idNpc)
		local npcLink = TaskHelp:BuildPathLink(npc_x,npc_y,npc_z,npc_mapid,TaskHelp.Color[--[[!]]"@寻径2@"][1],TaskHelp.TARGET_NPC,idNpc,idNpc,npc_objname)
		local npcstring = string.format(--[[!AUTO_501]]"%s%s%s的%s" ,textColor ,ObjInfo[idNpc].scene ,textColor ,npcLink)
		--npcstring = string.gsub(npcstring, --[[!AUTO_502]]"ffffff",textColor)
		--npcstring = string.gsub(npcstring, "ffc000",TaskHelp.Color["@寻径2@"][1])
		return npcstring
		--return string.format("%s%s%s的%s%s[%s]" ,TaskHelp.Color["@区域名@"][1] ,ObjInfo[idNpc].scene ,TaskHelp.Color["@黑色@"][2] ,TaskHelp.Color["@NPC名@"][1] ,TaskHelp.Color["@寻径@"][2] ,npcLink)
	else
		return nameNpc
		--return TaskHelp.Color["@粉红@"][1] .. idNpc
		--[[
		return string.format("%s(ObjInfo中无此NPC:ID=%s)",TaskHelp.Color["@粉红@"][1],idNpc)
		]]
	end
end

--Monster描述信息
function TaskHelp:GetTaskMonsterLink(idMonster,nameMonster)
	if ObjInfo[idMonster] then
		local monZone,mon_x,mon_y,mon_z,mon_mapid,mon_objname = TaskHelp:GetNpcPos(idMonster)
		local monLink = TaskHelp:BuildPathLink(mon_x,mon_y,mon_z,mon_mapid,TaskHelp.Color[--[[!]]"@寻径2@"][1],TaskHelp.TARGET_MONSTER,idMonster,idMonster,mon_objname)
		return string.format(--[[!AUTO_503]]"%s的%s" ,ObjInfo[idMonster].scene ,monLink)
	end
	return TaskHelp.Color[--[[!]]"@粉红@"][1] .. idMonster
	--[[
	return  string.format("%s(ObjInfo中无此怪物:ID=%s)",TaskHelp.Color["@粉红@"][1],idMonster)
	]]
end

--Item描述信息
function TaskHelp:GetTaskItemLink(idItem,nameItem)
	return string.format(--[[!AUTO_504]]"%s",nameItem)
end

--[[
任务目标专用描述文字填法：
	@链接文字[链接类型 链接信息]
	目前链接类型支持：
		pos, 对应链接信息: 场景ID, x坐标, z坐标。x坐标, z坐标为浮点数，之间用',' 或 空格 分隔 (可以同时使用多个',' 与 空格)
		例：测试@链接[pos 67  -1.1, 200]文字。此例中“链接”两字可点击

		pos3, 对应链接信息: 场景ID, x坐标, y坐标, z坐标. 其他与 pos 相同
		例：测试@三维[pos3 67  -1.1, 11.9, 200]文字。此例中“链接”两字可点击

		poslist, 对应链接信息: 场景ID, (x坐标1, z坐标1), (x坐标2, z坐标2) ... 各数字之间用',' 或 空格 分隔
			将根据角色ID、任务ID选出一组坐标
		例: 测试@随机链接[poslist 67(-1.1, 200)(10 190), (15 201)]文字。此例中“随机链接”可点击，寻径目标从3组坐标中选出一组

		target, 对应链接信息: 场景ID, x坐标, y坐标, z坐标, 目标类型=目标ID
			目标类型可为 npc(自动对话), monster(自动打怪), item(??), mine(自动采矿), bind(自动绑定动态物品，目标ID为交通工具TID)
		例: 测试@目标[target 67  -1.1, 11.9, 200, npc=9876]文字。此例中“目标”两字可点击，到达地点后自动与npc 9876对话

	注：链接类型对大小写敏感
]]

local linkTargetTypeTable =
{
	npc = 1,
	monster = 2,
	mine = 3,
	item = 4,
	bind = 6,
}

-- 生成一个 TaskHelp:TargetTransform 辅助函数
local function get_onLinkTextReplace (linkColor)
	-- TaskHelp:TargetTransform 辅助函数. name: 链接文字，type: 链接类型, info: 链接信息(格式取决于type)
	return function (name, type, info)
		if type == --[[!AUTO_505]]"pos" then
			-- sceneID, x, z
			local iBeg, iEnd, sceneID, x, z = info:find(--[[!AUTO_506]]"^%s-(%--[%d%.]+)[,%s]+(%--[%d%.]+)[,%s]+(%--[%d%.]+)%s-$")
			if iBeg then
				return TaskHelp:BuildPathLink(x+0,0,z+0,sceneID+0,linkColor,TaskHelp.TARGET_POS,0,0,name)
			end
		elseif type == --[[!AUTO_507]]"pos3" then
			-- sceneID, x, y, z
			local iBeg, iEnd, sceneID, x, y, z = info:find(--[[!AUTO_508]]"^%s-(%--[%d%.]+)[,%s]+(%--[%d%.]+)[,%s]+(%--[%d%.]+)[,%s]+(%--[%d%.]+)%s-$")
			if iBeg then
				return TaskHelp:BuildPathLink(x+0,y+0,z+0,sceneID+0,linkColor,TaskHelp.TARGET_POS,0,0,name)
			end
		elseif type == --[[!AUTO_509]]"target" then
			-- sceneID, x, y, z, type=id
			local iBeg, iEnd, sceneID, x, y, z, targetType, targetID = info:find(--[[!AUTO_510]]"^%s-(%--[%d%.]+)[,%s]+(%--[%d%.]+)[,%s]+(%--[%d%.]+)[,%s]+(%--[%d%.]+)[,%s]+(%w+)%s-%=%s-(%d+)%s-$")
			if iBeg then
				local targetTypeValue = linkTargetTypeTable[targetType]
				if targetTypeValue then
					return TaskHelp:BuildPathLink(x+0,y+0,z+0,sceneID+0,linkColor,targetTypeValue,targetID+0,targetID+0,name)
				end
			end
		elseif type == --[[!AUTO_511]]"poslist" then
			-- sceneID, (x, z), (x, z), ...

			local iBeg, iEnd, sceneID = info:find(--[[!AUTO_512]]"^%s-(%--[%d%.]+)")	--find sceneID...
			if iBeg then
				local poslistStr = info:sub(iEnd + 1)
				local poslistx = {}
				local poslistz = {}
				-- , (x, z)
				for x, z in poslistStr:gmatch(--[[!AUTO_513]]"[,%s]-%(%s-(%--[%d%.]+)[,%s]+(%--[%d%.]+)[,%s]-%)") do
					poslistx[#poslistx+1] = x
					poslistz[#poslistz+1] = z
				end

				--get random one
				local hashstr = (--[[!AUTO_514]]"poslist %u %d"):format(GameApi.GetRoleID(), l_curTaskInfo.taskId)
				local hash = GameApi.HashWString(hashstr)
				local index = hash % #poslistx;
				local x, z = poslistx[index+1], poslistz[index+1]
				return TaskHelp:BuildPathLink(x+0,0,z+0,sceneID+0,linkColor,TaskHelp.TARGET_POS,0,0,name)
			end
		elseif type == "orientPos3" then
					-- sceneID, x, y, z
			local iBeg, iEnd, sceneID, x, y, z = info:find(--[[!AUTO_508]]"^%s-(%--[%d%.]+)[,%s]+(%--[%d%.]+)[,%s]+(%--[%d%.]+)[,%s]+(%--[%d%.]+)%s-$")
			if iBeg then
				return TaskHelp:BuildPathLink(x+0,y+0,z+0,sceneID+0,linkColor,TaskHelp.TARGET_ORIENTPOS,0,0,name)
			end
		end

		return name
	end
end

-- 生成一个 TaskHelp:TargetTransform 辅助函数
local function get_onOldStyleLinkTextReplace (targetType, linkColor)
	-- TaskHelp:TargetTransform 辅助函数
	return function (targetID, sceneID, x, z)
		return TaskHelp:BuildPathLink(x+0,0,z+0,sceneID+0,linkColor,targetType,targetID+0,targetID+0,CommonTargetStyle)	--固定文字
	end
end

-- 生成一个 TaskHelp:TargetTransform 辅助函数
local function get_onOldStylePlusLinkTextReplace (targetType, linkColor)
	-- TaskHelp:TargetTransform 辅助函数
	return function (name, targetID, sceneID, x, z)
		return TaskHelp:BuildPathLink(x+0,0,z+0,sceneID+0,linkColor,targetType,targetID+0,targetID+0,name)	--固定文字
	end
end

-- 将文字中的通配符转换为链接
-- 类似 ectype.lua 中的 Ectype:ParseLinkText。区别：位置信息中增加场景ID，还要处理旧式链接风格
function TaskHelp:TargetTransform(targetStr, oldStyleTargetType,IsTrack, taskID)
	if type(targetStr) ~= --[[!AUTO_515]]"string" then
		return --[[!AUTO_516]]""
	end

	local linkColor
	if IsTrack == true then
		linkColor = TaskHelp.Color[--[[!]]"@寻径@"][1]
	else
		linkColor = TaskHelp.Color[--[[!]]"@寻径2@"][1]
	end

	--先处理新链接格式：@name[type info]
	targetStr = targetStr:gsub(--[[!AUTO_517]]"%@([^%[]*)%[(%w+)%s+([^%]]*)%]", get_onLinkTextReplace(linkColor))

	--先处理旧链接格式增强版：@name[targetID,sceneID,x,z]
	targetStr = targetStr:gsub(--[[!AUTO_518]]"%@([^%[]*)%[([%d-]+),([%d-]+),([%d-]+),([%d-]+)%]", get_onOldStylePlusLinkTextReplace(oldStyleTargetType, linkColor))

	--再处理旧链接格式：[targetID,sceneID,x,z]。其中type由 oldStyleTargetType 指定
	targetStr = targetStr:gsub(--[[!AUTO_519]]"%[([%d-]+),([%d-]+),([%d-]+),([%d-]+)%]", get_onOldStyleLinkTextReplace(oldStyleTargetType, linkColor))

	return targetStr
end

function TaskHelp:TargetToPlainText(targetStr)
	if type(targetStr) ~= --[[!AUTO_520]]"string" then
		return --[[!AUTO_521]]""
	end

	--先处理新链接格式和旧链接格式增强版：@name[something].  @name[type info] or @name[targetID,sceneID,x,z]
	targetStr = targetStr:gsub(--[[!AUTO_522]]"%@([^%[]*)%[[^%]]*%]", function (name) return name end)

	--再处理旧链接格式：[targetID,sceneID,x,z]
	targetStr = targetStr:gsub(--[[!AUTO_523]]"%[([%d-]+),([%d-]+),([%d-]+),([%d-]+)%]", function () return --[[!AUTO_524]]"" end)

	return targetStr
end

--
-- Test Beg
--~ _TEST = true
if _TEST then
	GameApi = GameApi or {}
	function GameApi.GetRoleID() return 0 end
	local l_hashRet = 0
	function GameApi.HashWString () return l_hashRet end

	TaskHelp.Color =
	{
		[--[[!]]"@寻径@"] = {--[[!AUTO_525]]"color1A",--[[!AUTO_526]]"color1B"}, [--[[!]]"@寻径2@"] = {--[[!AUTO_527]]"color2A",--[[!AUTO_528]]"color2A"},
	}

	function TaskHelp:BuildPathLink (x,y,z,sceneID,linkColor,targetTypeValue,targetID,sourceID,name)
		return (--[[!AUTO_529]]"<%s><%s><%s><%s><%s><%s><%s><%s><%s>"):format(x,y,z,sceneID,linkColor,targetTypeValue,targetID,sourceID,name)
	end

	assert(TaskHelp:TargetTransform(--[[!AUTO_530]]"測試@連結 [pos  67,-1.1 ,, 200]文字", 1, false, 0) == --[[!AUTO_531]]"測試<-1.1><0><200><67><color2A><5><0><0><連結 >文字")
	assert(TaskHelp:TargetTransform(--[[!AUTO_532]]"測試@連結 [pos3  67,-1.1 ,11.9, 200]文字", 1, false, 0) == --[[!AUTO_533]]"測試<-1.1><11.9><200><67><color2A><5><0><0><連結 >文字")
	assert(TaskHelp:TargetTransform(--[[!AUTO_534]]"測試@連結 [target  67,-1.1 ,11.9,, 200, npc = 7654 ]文字: %SA[3]") == --[[!AUTO_535]]"測試<-1.1><11.9><200><67><color2A><1><7654><7654><連結 >文字: %SA[3]")
	assert(TaskHelp:TargetTransform(--[[!AUTO_536]]"測試連結 [7654,67,1,200]文字", 1, false, 0) == --[[!AUTO_537]]"測試連結 <1><0><200><67><color2A><1><7654><7654><<前往>>文字")
	assert(TaskHelp:TargetTransform(--[[!AUTO_538]]"測試@連結 [7654,67,1,200]文字", 1, false, 0) == --[[!AUTO_539]]"測試<1><0><200><67><color2A><1><7654><7654><連結 >文字")

	l_hashRet = 0
	assert(TaskHelp:TargetTransform(--[[!AUTO_540]]"測試@連結 [poslist  67,(-1 -2)(1, ,2), (3,4)]文字", 1, false, 0) == --[[!AUTO_541]]"測試<-1><0><-2><67><color2A><5><0><0><連結 >文字")
	l_hashRet = 1
	assert(TaskHelp:TargetTransform(--[[!AUTO_542]]"測試@連結 [poslist  67,(-1 -2)(1, ,2), (3,4)]文字", 1, false, 0) == --[[!AUTO_543]]"測試<1><0><2><67><color2A><5><0><0><連結 >文字")
	l_hashRet = 2
	assert(TaskHelp:TargetTransform(--[[!AUTO_544]]"測試@連結 [poslist  67,(-1 -2)(1, ,2), (3,4)]文字", 1, false, 0) == --[[!AUTO_545]]"測試<3><0><4><67><color2A><5><0><0><連結 >文字")

	assert(TaskHelp:TargetToPlainText(--[[!AUTO_546]]"測試@連結 [pos  67,-1.1 ,, 200]文字", 1, false, 0) == --[[!AUTO_547]]"測試連結 文字")
	assert(TaskHelp:TargetToPlainText(--[[!AUTO_548]]"測試@連結 [target  67,-1.1 ,11.9,, 200, npc = 7654 ]文字: %SA[3]") == --[[!AUTO_549]]"測試連結 文字: %SA[3]")
	assert(TaskHelp:TargetToPlainText(--[[!AUTO_550]]"測試連結 [7654,67,1,200]文字", 1, false, 0) == --[[!AUTO_551]]"測試連結 文字")
	assert(TaskHelp:TargetToPlainText(--[[!AUTO_552]]"測試@連結 [7654,67,1,200]文字", 1, false, 0) == --[[!AUTO_553]]"測試連結 文字")

--~ 	dofile "../test/malut.lua"
--~ 	malut.printTable(TaskHelp:GetAllAutoSearchRange())

	assert(false, --[[!AUTO_554]]"Testing Successed")
end
-- Test End
--

--任务通知
--[[
TASK_SVR_NOTIFY_NEW		1	// 新任务发放

TASK_SVR_NOTIFY_COMPLETE	2	// 任务完毕
TASK_SVR_NOTIFY_GIVE_UP		3	// 任务放弃
TASK_SVR_NOTIFY_MONSTER_KILLED	4	// 杀怪数量

TASK_SVR_NOTIFY_FINISHED	5	// 处于得到奖励状态

TASK_SVR_NOTIFY_ERROR_CODE	6	// 错误码

TASK_SVR_NOTIFY_FORGET_SKILL	7	// 遗忘生活技能

TASK_SVR_NOTIFY_DYN_TIME_MARK	8	// 动态任务时间标记

TASK_SVR_NOTIFY_DYN_DATA	9	// 动态任务数据

TASK_SVR_NOTIFY_SPECIAL_AWARD	10	// 特殊奖励信息
TASK_SVR_NOTIFY_STORAGE		11	// 仓库数据
TASK_SVR_NOTIFY_FINISH_COUNT	12	// 任务完成次数
--]]

TaskNotifyReason =
{
	TASK_SVR_NOTIFY_NEW		= 1,  --新任务发放

	TASK_SVR_NOTIFY_COMPLETE	= 2,  --任务完毕
	TASK_SVR_NOTIFY_GIVE_UP		= 3,  --任务放弃
	TASK_SVR_NOTIFY_MONSTER_KILLED	= 4,  --杀怪数量

	TASK_SVR_NOTIFY_FINISHED	= 5,  --处于得到奖励状态

	TASK_SVR_NOTIFY_ERROR_CODE	= 6,  --错误码

	TASK_SVR_NOTIFY_FORGET_SKILL	= 7,  --遗忘生活技能

	TASK_SVR_NOTIFY_DYN_TIME_MARK	= 8,  --动态任务时间标记

	TASK_SVR_NOTIFY_DYN_DATA	= 9,  --动态任务数据

	TASK_SVR_NOTIFY_SPECIAL_AWARD	= 10, --特殊奖励信息
	TASK_SVR_NOTIFY_STORAGE		= 11, --仓库数据
	TASK_SVR_NOTIFY_FINISH_COUNT	= 12, --任务完成次数
}

function TaskHelp:GetPetTaskMsgTbl(task_tbl,reason,succ_comp)
	if task_tbl["ID"] and  ObjSpeak.PetTaskMsg[task_tbl["ID"]] then
		if reason == TaskNotifyReason.TASK_SVR_NOTIFY_NEW then
			local msg_id = ObjSpeak.PetTaskMsg[task_tbl["ID"]].GetTaskMsgID
			return ObjSpeak.PetMsgList[msg_id]
		elseif reason == TaskNotifyReason.TASK_SVR_NOTIFY_COMPLETE and succ_comp == true then
			local msg_id = ObjSpeak.PetTaskMsg[task_tbl["ID"]].DoneTaskMsgID
			return ObjSpeak.PetMsgList[msg_id]
		end
	else
		return nil
	end
end

function TaskHelp:OnTaskNotify(task_tbl,reason,succ_comp)
	if task_tbl["Type"] == TaskHelp.TaskType.TASK_TYPE_PET then
		local pet_tbl = GameApi.GetSummonedPetInfo()
		if pet_tbl["pet_tid"] > 0 then
			local ret_mode = nil
			local msg_tbl  = TaskHelp:GetPetTaskMsgTbl(task_tbl,reason,succ_comp)
			if msg_tbl and msg_tbl.Word and msg_tbl.Mode then
				local sMsg = GameApi.PetConverSvrMsg(pet_tbl["pet_index"],msg_tbl.Word)
				if sMsg then
					if msg_tbl.Mode then
						local mode = ObjSpeak:CopyTable(ObjSpeak.DisplayMode)
						mode = ObjSpeak:BestrowTable(mode,msg_tbl.Mode)
						ret_mode = ObjSpeak:CopyArray(mode)
					end
					--喊话API
					GameApi.ObjSpeak(ObjSpeak.ObjType.OBJ_PET,pet_tbl["pet_nid"],pet_tbl["pet_tid"],ObjSpeak.ValidTarget.PET_HOST,sMsg,ret_mode)
				end
			end
		end
	end
end

--[[ idEvent:
38: EVENT_ACCEPTING_TASK,	//正要接任务
39: EVENT_TASK_FAIL, 		//任务失败或放弃
21:	EVENT_TASK_GAIN,		//接到任务
22:	EVENT_TASK_FINISH,		//任务目标完成
23:	EVENT_TASK_COMPLETE,    //任务完成
24:	EVENT_DELVTASK_TALK,	//NPC接任务对话
25:	EVENT_NPCTASK_TALK,		//NPC与任务NPC对话
26:	EVENT_AWARDTASK_TALK,	//NPC交任务对话
43: EVENT_TASK_RESET,		//使用任务重置服务
--]]

function TaskHelp:GetCGID(cgID)
	if cgID >= 400000 then --大于400000是新CG
		return cgID
	else
		if CGList[cgID] then
			return cgID
		else
			return 0
		end
	end
end

--召唤NPC任务及事件表
TaskHelp.NpcBeckon = {}

-------------------------------------------------
--任务事件配置表
--表格填写样式
--TaskHelp.TaskConfigs[任务ID]
--{
--	[EventType.EVENT_TASK_GAIN]     = {}   接任务事件
--	[EventType.EVENT_TASK_FINISH]   = {}   达成任务条件事件
--	[EventType.EVENT_TASK_COMPLETE] = {}   完成任务事件
--	[EventType.EVENT_DELVTASK_TALK] = {}   结束与NPC对话事件
--	[EventType.EVENT_NPCTASK_TALK]  = {}   与NPC开始对话事件
--  表内详细参考下面例子
--}
-------------------------------------------------
TaskHelp.TaskConfigs = {}

--[[	例子
TaskHelp.TaskConfigs[3977] =	--例子
{
	[EventType.EVENT_TASK_GAIN] =
	{
		UI = "Win_FontTest",	--打开此界面
		CG = 101,				--播放此CG
		MovePath = 212,			--开始沿此路径移动
		Script=function (id, event) print("EVENT_TASK_GAIN", id, event) end,	--执行此函数
	}
}
--]]

----------------------------------------------------------------
---	TaskHelp:OnTaskEvent
--<Task Music And SFX>--
local TaskGetEventMusic = {} -- 获得
local TaskFinishEventMusic = {} -- 完成未交
local TaskCompleteEventMusic = {} -- 交任务
TaskGetEventMusic[5589] = {--[[!AUTO_555]]"music\\20yuhang.ogg",10000}

TaskFinishEventMusic[5589] = {--[[!AUTO_556]]"music\\20yuhang.ogg",10000}

TaskCompleteEventMusic[5589] = {--[[!AUTO_557]]"music\\20yuhang.ogg",10000}

-- 音效可以配多个，以{"","",""}形式就行
local TaskGetEventSFX =  -- 接任务环境音效
{
	[5591] = {--[[!AUTO_558]]"sfx\\voice\\Chinese\\6_chushi_close.wav"},
}
local TaskFinishEventSFX = -- 完成任务环境音效
{
	[5591] = {--[[!AUTO_559]]"sfx\\voice\\Chinese\\6_chushi_close.wav"},
}
local TaskCompleteEventSFX = -- 交任务环境音效
{
	[5591] = {--[[!AUTO_560]]"sfx\\voice\\Chinese\\6_chushi_close.wav"},
}

function HandleTaskMusicEvent( idTask, idEvent, idTarget )
	if GameApi.PlayTaskSFX ~= nil then -- 判断客户端是否加了这个函数
		local music_item = nil
		local sfx_item = nil
		if idEvent == EventType.EVENT_TASK_GAIN then

			music_item 	= TaskGetEventMusic[idTask]
			sfx_item 	= TaskGetEventSFX[idTask]

		elseif idEvent == EventType.EVENT_TASK_FINISH then

			music_item 	= TaskFinishEventMusic[idTask]
			sfx_item 	= TaskFinishEventSFX[idTask]

		elseif idEvent == EventType.EVENT_TASK_COMPLETE then

			music_item 	= TaskCompleteEventMusic[idTask]
			sfx_item 	= TaskCompleteEventSFX[idTask]

		end

		if music_item ~= nil then
			GameApi.PlayTaskSFX(GameApi.Utf8ToMBCS(music_item[1]),music_item[2])
		end

		if sfx_item ~= nil then
			for i=1,#sfx_item do
				GameApi.PlayListSFX(GameApi.Utf8ToMBCS(sfx_item[i]),false,200)
			end
		end
	else
		LogPrint(--[[!AUTO_561]]"PlayTaskSFX is Nil")
	end
end
--</Task Music And SFX>--
----------------------------------------------------------------
function TaskHelp:OnTaskEvent(idTask,idEvent,idTarget)
	local idScene    = GameApi.GetSceneID()
	local idPrecinct = GameApi.GetPrecinctID()

	if idEvent == EventType.EVENT_TASKDATA_INIT and Sound.SpecialScene[idScene] and Sound.PlaySpecialBGMFlag == false then
		Sound:PlaySpecialBGM(idScene,idPrecinct,0)
		Sound.PlaySpecialBGMFlag = true
	end

	--新手任务背景音乐
	if idEvent == EventType.EVENT_TASK_GAIN then
		if Sound.SpecialScene[idScene] and Sound.SpecialTaskBGM[idTask] then
			Sound:PlaySpecialBGM(idScene,0,idTask)
			Sound.PlayTheme = false
			Sound.PlaySpecialBGMFlag = true
		end
	end

	--任务召本地NPC
	if TaskHelp.NpcBeckon[idTask] then
		if idEvent == TaskHelp.NpcBeckon[idTask].tskevt then
			if TaskHelp.NpcBeckon[idTask].bckontpy == 1 then
				NpcBeckon:Beckon(TaskHelp.NpcBeckon[idTask].bckonnpc)
			elseif TaskHelp.NpcBeckon[idTask].bckontpy == 2 then
				NpcBeckon:Dispel(TaskHelp.NpcBeckon[idTask].bckonnpc)
			end
		end
	end

	--任务特殊文字
	if TASK_EVENT_TEXT[idTask] then
		--LogPrint(string.format("idTask：%d，idEvent：%d", idTask, idEvent))
		if idEvent == EventType.EVENT_TASK_GAIN and TASK_EVENT_TEXT[idTask][1] ~= --[[!AUTO_562]]"" then
			TaskHelp:AddSystemHint(TaskHelp.Color["@I@"][1] .. TASK_EVENT_TEXT[idTask][1])
		end
		if idEvent == EventType.EVENT_TASK_FINISH and TASK_EVENT_TEXT[idTask][2] ~= --[[!AUTO_563]]"" then
			TaskHelp:AddSystemHint(TaskHelp.Color["@I@"][1] .. TASK_EVENT_TEXT[idTask][2])
		end
		if idEvent == EventType.EVENT_TASK_COMPLETE and TASK_EVENT_TEXT[idTask][3] ~= --[[!AUTO_564]]"" then
			TaskHelp:AddSystemHint(TaskHelp.Color["@I@"][1] .. TASK_EVENT_TEXT[idTask][3])
		end
	end
	--任务事件处理
	HandleTaskMusicEvent(idTask,idEvent,idTarget)

	-- 任务触发事件：返回触发的CG ID
	if TaskHelp.TaskConfigs[idTask] then
		TaskHelp:GetTaskEvent_UI(idTask, idEvent)
		TaskHelp:GetTaskEvent_MovePath(idTask, idEvent)
		TaskHelp:GetTaskEvent_Script(idTask, idEvent)
		return TaskHelp:GetTaskEvent_CG(idTask, idEvent)
	end
	return 0
end
------------------------辅助工具函数--------------------------------------------
--触发界面
function TaskHelp:GetTaskEvent_UI(id, event)
	local cfg = TaskHelp.TaskConfigs[id][event]
	if cfg and cfg.UI and cfg.UI ~= --[[!AUTO_565]]"" then
		DlgApi.ShowDialog(cfg.UI, true)
	end
end

function TaskHelp:GetTaskEvent_Script(id, event)
	local config = TaskHelp.TaskConfigs[id][event]
	if config then
		local Script = config.Script
		if type(Script) == --[[!AUTO_566]]"function" then
			local ret, err = pcall(Script, id, event)
			if not ret then
				print((--[[!AUTO_567]]"Fail to call TaskEvent Script, taskId: %d, event: %d\n err: %s"):format(id, event, err))
			end
		end
	end
end

--触发CG
function TaskHelp:GetTaskEvent_CG(id, event)
	local cfg = TaskHelp.TaskConfigs[id][event]
	if cfg and cfg.CG and cfg.CG ~= 0 then
		return TaskHelp:GetCGID(cfg.CG)
	end
	return 0
end

--触发寻径
function TaskHelp:GetTaskEvent_MovePath(id, event)

--传送类movealongpath，自身方向也会改变了
--修改了以下movealongpath相关：
--定义 modeheight：0贴地，1按路径高度

--命令：d_movealongpath pathid modeheight

--脚本接口：GameApi.MoveAlongPath( pathid, idTask, ObjID, modeheight, actType)
--ObjID为物体id（64位），0表示主角
--actType是ObjActFlag

--GameApi.MoveAlongPath( pathid, idTask, [ObjID,] [modeheight,] [actType]
--后三个参数可不写，默认是0，地面，跑路

	if event == EventType.EVENT_TASK_FAIL then		--任务失败或放弃，停止自动移动
		GameApi.MoveAlongPath(0, id)
	else
		local cfg = TaskHelp.TaskConfigs[id][event]
		if cfg and cfg.MovePath and cfg.MovePath~= 0 then
			GameApi.MoveAlongPath(cfg.MovePath, id)
		end
	end
end

----------------------------------------------------------------------------------

--[[程序写死
--玩家死亡时的描述信息
function TaskHelp:GetReviveDesc()
	return "信春哥，原地满血满魔复活，汝信是不信？"
end
]]--

--任务自动寻径结束的事件
TaskHelpTargetType =
{
	TARGET_NONE    = 0, -- 无
	TARGET_NPC     = 1, -- NPC
	TARGET_MONSTER = 2, -- 怪物
	TARGET_MINE    = 3, -- 矿
	TARGET_ITEM    = 4, -- 物品
	TARGET_POS	= 5, -- 特定位置
	TARGET_BIND    = 6, -- 绑定动态物品
}

--只有当typeTarget为TARGET_POS的时候xPos,yPos,zPos有效
function TaskHelp:OnTaskAutoMoveStop(idTask, typeTarget, idTarget, tidTarget, xPos, yPos, zPos)
	if typeTarget == TaskHelpTargetType.TARGET_NPC then
		--自动开启对话
		GameApi.AutoClickNpc(idTarget, tidTarget)
	elseif typeTarget == TaskHelpTargetType.TARGET_MONSTER then
		--自动打怪
		GameApi.AutoClickMonster(idTarget, tidTarget)
	elseif typeTarget == TaskHelpTargetType.TARGET_MINE then
		--自动挖矿
		GameApi.AutoClickMatter(idTarget, tidTarget)
	elseif typeTarget == TaskHelpTargetType.TARGET_BIND then
		--自动绑定动态物品
		GameApi.AutoClickDynMatter(idTarget, tidTarget)
	end
end

--开启小游戏的接口
function TaskHelp:StartTinyGame(idTask,idGame,idParam)
	MiniGameLoader:StartTaskMiniGame(idTask,idGame,idParam)
end

----------------------------------
--景深效果（全屏模糊等）
--SceneStyle.TaskState =
--{
--	INVALID		= -1,	--	无此任务
--
--	NONE		= 0,	--	此任务的完成数为0
--	ACCEPT 		= 1,	--	接到
--	CANFINISH 	= 2, 	--	完成没交
--	FINISHED	= 3,	--	交成功
--	FAIL		= 4,	--	失败
--};
TaskHelp.TaskDOFConfigs = {}

function TaskHelp:OnTaskEvent_DOF(idTask, taskState)

	--local strDbg = string.format("TaskHelp:OnTaskEvent_DOF: %d, State: %d\n", idTask, taskState)
	--LogPrint(strDbg)

	local task = TaskHelp.TaskDOFConfigs[idTask]
	local cfg = task and task[taskState] or nil
	if cfg then
		if cfg.START_DOF then
			GameApi.TaskSetDOF(false, cfg.START_DOF)
		end
		if cfg.STOP_DOF then
			GameApi.TaskSetDOF(true, cfg.STOP_DOF)
		end
	end
end
