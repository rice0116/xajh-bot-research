--[[#tag push auto]]

ObjSpeak = {}

--喊话对象类别
ObjSpeak.ObjType   = {OBJ_NPC = 0,OBJ_MONSTER = 1,OBJ_PET = 2,OBJ_PLAYER = 3}

--复制
function  ObjSpeak:CopyTable(src)
	if type(src) ~= --[[!AUTO_1]]"table" then
		return src
	end

	local inst={}
	local k, v
	for k, v in pairs(src) do
		if type(v) == --[[!AUTO_2]]"table" then
			inst[k] = ObjSpeak:CopyTable(v)
		else
			inst[k] = v
		end
	end
	local mt = getmetatable(src)
	setmetatable(inst, mt)

    return inst
end

--覆盖表相同项(把dst和src有相同key的值用src中的值覆?
function ObjSpeak:BestrowTable(dst,src)
	if dst and src then
		for k,v in pairs(src) do
			if k ~= --[[!AUTO_3]]"__index" and dst[k] ~= nil then
				dst[k] = v
			end
		end
	end
	return dst
end

--把表转换为array
function ObjSpeak:CopyArray(src)
	local ret_tbl = nil
	local idx = 1
	if src and type(src) == --[[!AUTO_4]]"table" then
		ret_tbl = {}

		ret_tbl[idx] = src.ShowChat
		idx = idx + 1
		ret_tbl[idx] = src.ChatChannel
		idx = idx + 1
		ret_tbl[idx] = src.ShowSendName
		idx = idx + 1
		ret_tbl[idx] = src.ShowPop
		idx = idx + 1
		ret_tbl[idx] = src.PopMinTime
		idx = idx + 1
		ret_tbl[idx] = src.PopMaxTime
		idx = idx + 1
		ret_tbl[idx] = src.FrameType
		idx = idx + 1
		ret_tbl[idx] = src.FontName
		idx = idx + 1
		ret_tbl[idx] = src.FontSize
		idx = idx + 1
		ret_tbl[idx] = src.FontColor
		idx = idx + 1
		ret_tbl[idx] = src.FadePlay
		idx = idx + 1
		ret_tbl[idx] = src.ScalePlay
		idx = idx + 1
		ret_tbl[idx] = src.ShowHead
		idx = idx + 1
		ret_tbl[idx] = src.FramePri
		idx = idx + 1
		ret_tbl[idx] = src.FollowHost
		idx = idx + 1
		ret_tbl[idx] = src.ShowMiddle
		idx = idx + 1
	end
	return ret_tbl
end

--满足概率
function ObjSpeak:Probability(pro_val)
	if pro_val then
		if pro_val >= 1.0 then
			return true
		end

		local val = math.random()
		if val <= pro_val then
			return true
		end
	end
	return false
end

--随机索引
function ObjSpeak:RandIndex(maxIdx)
	if type(maxIdx) == --[[!AUTO_5]]"number" and maxIdx >= 1 then
		return math.random(1,maxIdx)
	end

	return 0
end

--数值在表中
function ObjSpeak:ValueInTable(val,tbl)
	if val and tbl and type(tbl) == --[[!AUTO_6]]"table" then
		for k,v in pairs(tbl) do
			if v == val then
				return true
			end
		end
	end

	return false
end

--战斗状态改变原?
ObjSpeak.FightReason =
{
	FIGHTSTREASON_EXIT_NORMAL			= 0,	--0普通退出战?
	FIGHTSTREASON_EXIT_DEAD				= 1,	--1因为死亡退出战?

	FIGHTSTREASON_ENTER_NORMAL			= 128,	--128受到攻击进入战斗
	FIGHTSTREASON_ENTER_HELP			= 129,	--129同阵营呼救进入战?
}

--战斗策略改变原因
ObjSpeak.FightPolicy =
{
	FIGHTPOLICY_NONE		= 0,	--0-没有
	FIGHTPOLICY_CALLHELP	= 1,	--1-呼救
	FIGHTPOLICY_FLEE		= 2,	--2-逃跑
}

--血量变化原?
ObjSpeak.HpChangeReason =
{
	OBJHPCHANGE_INC_NORMAL		= 0,	--其他原因加血
	OBJHPCHANGE_INC_BEHEALED	= 1,	--被治疗加血

	OBJHPCHANGE_DROP_NORMAL		= 10,	--其他原因掉血
	OBJHPCHANGE_DROP_BEATTACKED = 11,	--被攻击掉血
	OBJHPCHANGE_DROP_BEHURT		= 12,	--?持续)伤害掉血
}

--引起喊话事件
ObjSpeak.EventType =
{
	--主类事件(最多三位数)

	--NPC与怪物（主要是NPC）非战斗情况下的喊话
	SPECIAL_ACTION		= 1,   --执行特定动作		(action_id)
	DISTANCE_RANGE		= 2,   --进入距离范围		(old_dis,now_dis)
	SERVER_TIME			= 3,   --服务器时间		(server_time,year,month,day,hour,minute,second,weekday)
	LOCAL_TIME			= 4,   --本地时间			(local_time,year,month,day,hour,minute,second,weekday)

	--NPC与怪物（主要是怪物）战斗情况下的喊话

	FIGHTSTATE_CHANGE   = 100, --战斗状态改?	(state:  0(退?/1(进入) reason: ObjSpeak.FightReason)
	POLICY_CHANGE       = 101, --策略改变			(policy :ObjSpeak.FightPolicy)
	BATTLE_ESCAPE		= 102, --战斗间隙逃跑
	HP_CHANGE			= 103, --HP值变?		(last_percent, cur_percent, hp_delta,reason :ObjSpeak.HpChangeReason)
	USE_SKILL			= 104, --使用特殊技?	(skill_id)
	BE_ATTACK			= 105, --被击?
	GFXSTATE_CHANGE     = 106, --64为光效状态改?   (gfx_idx,is_gain)
	TARGET_CHANGE       = 107, --攻击目标改变
	OBJ_CREATE          = 108, --NPC创建
	--自身的伙伴（宠物、护送NPC）的特殊行为
	PROP_CHANGE			= 200, --宠物的自身属性变?
	HOSTPROP_CHANGE		= 201, --宠物主人属性变?
	NORMAL_ORDER		= 202, --宠物执行非战斗命?
	BATTLE_ORDER		= 203, --宠物执行战斗命令
	LOCAL_ACTION		= 204, --宠物执行本地动作	(action_id)
	PET_SERVER_MSG		= 205, --服务器消息喊话

	PET_SAY_HELLO		= 206,

	--其他
	REGION_CHANGE       = 300, --区域切换			(old_area,new_area)
	BOARD_CHANGE		= 301, --版面切换			(old_board,new_board)
	ENV_CHANGE			= 302, --环境切换			(old_env,new_env)


	--脚本事件

	--子类事件(最小六位数,高三位表示主类事?
	HP_CHANGE_DOT			= 103001, --被持续伤害掉血
	HP_CHANGE_MIN			= 103002, --HP少于百分?
	FIGHTSTATE_CHANGE_EXIT		= 100001, --脱离战斗
	FIGHTSTATE_CHANGE_BEATTACK      = 100002, --受攻击进入战?
	FIGHTSTATE_CHANGE_HELP		= 100003, --受呼救进入战?
	FIGHTSTATE_CHANGE_DEAD		= 100004,--死亡
	POLICY_CHANGE_HELP		= 101001, --策略呼救
	POLICY_CHANGE_BACK		= 101002, --策略逃跑
	LOCAL_TIME_JIANGE				= 4001,--客户间隔时间
	LOCAL_TIME_WEISHU00				= 4002,--客户端间隔时间60尾数00
	LOCAL_TIME_WEISHU02				= 4003,--客户端间隔时间60尾数02
	LOCAL_TIME_WEISHU04				= 4004,--客户端间隔时间60尾数04
	LOCAL_TIME_WEISHU06				= 4005,--客户端间隔时间60尾数06
	LOCAL_TIME_WEISHU08				= 4006,--客户端间隔时间60尾数08
	LOCAL_TIME_WEISHU10				= 4007,--客户端间隔时间60尾数10
	LOCAL_TIME_WEISHU12				= 4008,--客户端间隔时间60尾数12
	LOCAL_TIME_WEISHU14				= 4009,--客户端间隔时间60尾数14
	LOCAL_TIME_WEISHU16				= 4010,--客户端间隔时间60尾数16
	LOCAL_TIME_WEISHU18				= 4011,--客户端间隔时间60尾数18
	LOCAL_TIME_WEISHU20				= 4012,--客户端间隔时间60尾数20
	LOCAL_TIME_WEISHU22				= 4013,--客户端间隔时间60尾数22
	LOCAL_TIME_WEISHU24				= 4014,--客户端间隔时间60尾数24
	LOCAL_TIME_WEISHU26				= 4015,--客户端间隔时间60尾数26
	LOCAL_TIME_WEISHU28				= 4016,--客户端间隔时间60尾数28
	LOCAL_TIME_WEISHU30				= 4017,--客户端间隔时间60尾数30
	LOCAL_TIME_WEISHU32				= 4018,--客户端间隔时间60尾数32
	LOCAL_TIME_WEISHU34				= 4019,--客户端间隔时间60尾数34
	LOCAL_TIME_WEISHU36				= 4020,--客户端间隔时间60尾数36
	LOCAL_TIME_WEISHU38				= 4021,--客户端间隔时间60尾数38
	LOCAL_TIME_WEISHU40				= 4022,--客户端间隔时间60尾数40
	LOCAL_TIME_WEISHU42				= 4023,--客户端间隔时间60尾数42
	LOCAL_TIME_WEISHU44				= 4024,--客户端间隔时间60尾数44
	LOCAL_TIME_WEISHU46				= 4025,--客户端间隔时间60尾数46
	LOCAL_TIME_WEISHU48				= 4026,--客户端间隔时间60尾数48
	LOCAL_TIME_WEISHU50				= 4027,--客户端间隔时间60尾数50
	LOCAL_TIME_WEISHU52				= 4028,--客户端间隔时间60尾数52
	LOCAL_TIME_WEISHU54				= 4029,--客户端间隔时间60尾数54
	LOCAL_TIME_WEISHU56				= 4030,--客户端间隔时间60尾数56
	LOCAL_TIME_WEISHU58				= 4031,--客户端间隔时间60尾数58
	LOCAL_TIME_15WEISHU01				= 4032,--客户端间隔时间15尾数1
	LOCAL_TIME_30WEISHU01				= 4033,--客户端间隔时间30尾数1
	LOCAL_TIME_15WEISHU05				= 4034,--客户端间隔时间15尾数5
	USE_SKILL01					= 104001,--释放特殊技能1
	USE_SKILL02					= 104002,--释放特殊技能1
	USE_SKILL03					= 104003,--释放特殊技能1
	USE_SKILL04					= 104004,--释放特殊技能1
	USE_SKILL05					= 104005,--释放特殊技能1
}

--分离主子事件
function ObjSpeak:SpliteEvent(idEvent)
	if idEvent < 1000 then
		return idEvent,0
	end
	return math.floor(idEvent / 1000),math.floor(idEvent % 1000)
end

--组合主子事件
function ObjSpeak:CombEvent(idMain,idSub)
	if idSub > 0 then
		return idMain*1000 + idSub
	end

	return idMain
end

--喊话有效对象
ObjSpeak.ValidTarget =
{
	NORMAL_TARGET		= 0,
	DISTANCE_RANGE		= 0x0001,	--处于玩家周围的限定范围

	ENMITY_LIST		= 0x0002,	--仇恨列表中有玩家或玩家的队友
	AWARD_TARGET		= 0x0004,	--玩家家拥有对怪物的奖励获取权
	PET_HOST		= 0x0008,	--宠物主人
	ESCORT_HOST		= 0x0010,	--护送主人

	ALL_WORLD		= 0x0020,	--世界范围所有人
	CUR_WORLD		= 0x0040,	--当前世界所有人
	ONLY_CUR_INSTANCE	= 0x0080,	--副本全局喊话（仅对当前副本）
}

--内容显示边框形式
ObjSpeak.PopFrame =
{
	POPFRAME_NONE   = 0, --无边?
	NORMAL_FRAME    = 1, --普?实线. 圆角矩形
	MENTAL_FRAME    = 2, --心理活动:虚线圆角矩形
	OUTBURST_FRAME  = 3, --突发,惊讶,暴?实线,不规则尖?
	ASIDE_FRAME     = 4, --旁白:方块.
	INTERACT_NOTICE = 5, --交互提示
}

POPSTETCH_WHOLE	= 0 --泡泡图整体拉伸

POPSTETCH_3X3	= 1 --泡泡图按九宫格方式拉?四个边角不动、中间拉伸


ObjSpeak.PopFrameCfg =
{
	[ObjSpeak.PopFrame.POPFRAME_NONE] =
	{
		--[[!AUTO_7]]"",					--frame边框路径
		POPSTETCH_WHOLE,	--frame边框的拉伸方式

		0, 0,				--边框上下，左右的留白
		--[[!AUTO_8]]"",					--frame尾巴路径
		0,					--尾巴和框的重叠高度

	},
	[ObjSpeak.PopFrame.NORMAL_FRAME] =
	{
		--[[!AUTO_9]]"pop\\普通框.tga",	--frame边框路径
		POPSTETCH_3X3,		--frame边框的拉伸方式

		0, 0,				--边框上下，左右的留白。对于3X3拉伸模式，程序会自动计算
		--[[!AUTO_10]]"pop\\普通角.tga",	--frame尾巴路径
		0,					--尾巴和框的重叠高度

	},
	[ObjSpeak.PopFrame.MENTAL_FRAME] =
	{
		--[[!AUTO_11]]"pop\\心理框.tga",	--frame边框路径
		POPSTETCH_WHOLE,	--frame边框的拉伸方式

		5, 3,				--边框上下，左右的留白
		--[[!AUTO_12]]"pop\\心理角.tga",	--frame尾巴路径
		2,					--尾巴和框的重叠高度

	},
	[ObjSpeak.PopFrame.OUTBURST_FRAME] =
	{
		--[[!AUTO_13]]"pop\\惊讶框.tga",	--frame边框路径
		POPSTETCH_WHOLE,	--frame边框的拉伸方式

		10, 10,				--边框上下，左右的留白
		--[[!AUTO_14]]"pop\\惊讶角.tga",	--frame尾巴路径
		16,					--尾巴和框的重叠高度

	},
	[ObjSpeak.PopFrame.ASIDE_FRAME] =
	{
		--[[!AUTO_15]]"pop\\旁白框.tga",	--frame边框路径
		POPSTETCH_3X3,		--frame边框的拉伸方式

		0, 0,				--边框上下，左右的留白。对于3X3拉伸模式，程序会自动计算
		--[[!AUTO_16]]"pop\\旁白角.tga",	--frame尾巴路径
		0,					--尾巴和框的重叠高度

	},
	[ObjSpeak.PopFrame.INTERACT_NOTICE] =
	{
		--[[!AUTO_17]]"pop\\交互提示.tga",	--frame边框路径
		POPSTETCH_3X3,		--frame边框的拉伸方式

		0, 0,				--边框上下，左右的留白。对于3X3拉伸模式，程序会自动计算
		--[[!AUTO_18]]"",					--frame尾巴路径
		0,					--尾巴和框的重叠高度

	},
}

function ObjSpeak:GetPopFrameCfg(idType)
	return ObjSpeak.PopFrameCfg[idType]
end

--内容显示方式
ObjSpeak.DisplayMode =
{
	ShowChat		= false,   --是否显示在聊天栏
	ChatChannel		= 0,	   --聊天频道
	ShowSendName    = false,   --是否喊话对象名称
	ShowPop			= false,   --是否显示泡泡
	PopMinTime      = 2000,    --泡泡显示最短时?ms)
	PopMaxTime      = 5000,    --泡泡显示最长时?ms)
	FrameType		= 1,	   --泡泡显示边框
	FontName        = 1,	   --字体名称索引: 0.方正隶二简?1.方正细黑一简?2.方正隶变简?
	FontSize        = 0,	   --字体大小
	FontColor       = 0xFFFFFF,--字体颜色
	FadePlay		= true,	   --淡入淡出
	ScalePlay		= true,    --缩放进出
	ShowHead		= false,   --边框显示头像
	FramePri		= 0,	   --边框优先?
	FollowHost      = true,    --跟随主人
	ShowMiddle		= false,   --屏幕中央打字显示
}

--对象被创建

function ObjSpeak:OnObjCreate(objType,objWid,objTid, objHashid)
	local ret_tbl = {}
	local val_idx = 1
	local id = 0
	if ObjSpeak.ObjCfg[objHashid] then
		id = objHashid
	else
		id = objTid
	end

	if ObjSpeak.ObjCfg[id] then
		for k1,v1 in pairs(ObjSpeak.ObjCfg[id]) do
			local idMain,idSub = ObjSpeak:SpliteEvent(k1)
			ret_tbl[val_idx] = {}
			ret_tbl[val_idx]["main_event"] = idMain
			ret_tbl[val_idx]["sub_event"] = idSub
			val_idx = val_idx + 1
		end
	else
		for k2,v2 in pairs(ObjSpeak.NormalObj) do
			if ObjSpeak:ValueInTable(id,v2.IDList) and v2.Prob then
				for k3,v3 in pairs(v2.Prob) do
					local idMain,idSub = ObjSpeak:SpliteEvent(k3)
					ret_tbl[val_idx] = {}
					ret_tbl[val_idx]["main_event"] = idMain
					ret_tbl[val_idx]["sub_event"] = idSub
					val_idx = val_idx + 1
				end
				break --?固定id只处于一个集合中
			end
		end
	end

	--特殊的服务器通知宠物消息事件
	if objType == ObjSpeak.ObjType.OBJ_PET then
		ret_tbl[val_idx] = {}
		ret_tbl[val_idx]["main_event"] = ObjSpeak.EventType.PET_SERVER_MSG
		ret_tbl[val_idx]["sub_event"]  = 0
		val_idx = val_idx + 1

		ret_tbl[val_idx] = {}
		ret_tbl[val_idx]["main_event"] = ObjSpeak.EventType.PET_SAY_HELLO
		ret_tbl[val_idx]["sub_event"]  = 0
		val_idx = val_idx + 1
	end

	return ret_tbl
end

--事件触发
function ObjSpeak:OnObjTriggerEvent(eventType,subEventTbl,argsTbl,objType,objWid,objTid, objHashid)
	local id = objTid
	if subEventTbl ~= nil and type(subEventTbl) == --[[!AUTO_19]]"table" and #subEventTbl > 0 then
		for i=1,#subEventTbl do
			local event = ObjSpeak:CombEvent(eventType,subEventTbl[i])
			if ObjSpeak.SpecialObj[objHashid] and ObjSpeak.SpecialObj[objHashid][event] then
				id = objHashid
			end
			if ObjSpeak:OnObjEvent(event,argsTbl,objType,objWid,id) == true then
				return true
			end
		end
	else
		if ObjSpeak.SpecialObj[objHashid] and ObjSpeak.SpecialObj[objHashid][event] then
			id = objHashid
		end
		return ObjSpeak:OnObjEvent(eventType,argsTbl,objType,objWid,id)
	end
end

function ObjSpeak:OnPetBedgeSvrMsg(argsTbl)
	word_idx = argsTbl["msg_id"]
	if word_idx and ObjSpeak.PetMsgList and ObjSpeak.PetMsgList[word_idx] then
		local sMsg = GameApi.PetConverSvrMsg(argsTbl["pet_index"],ObjSpeak.PetMsgList[word_idx].Word)
		if sMsg then
			if ObjSpeak.PetMsgList[word_idx].Mode then
				if ObjSpeak.PetMsgList[word_idx].Mode.ShowChat then
					--喊话API
					GameApi.AddChatMessage(ObjSpeak.PetMsgList[word_idx].Mode.ChatChannel,sMsg)
				end
			end
		end
	end
end

function ObjSpeak:OnPetSvrMsgOrSayHello(eventType,argsTbl,objType,objWid,objTid)
	local ret_mode = nil
	if eventType == ObjSpeak.EventType.PET_SERVER_MSG then
		word_idx = argsTbl["msg_id"]
		if word_idx and ObjSpeak.PetMsgList and ObjSpeak.PetMsgList[word_idx] then
			local sMsg = GameApi.PetConverSvrMsg(argsTbl["pet_index"],ObjSpeak.PetMsgList[word_idx].Word)
			if sMsg then
				if ObjSpeak.PetMsgList[word_idx].Mode then
					local mode = ObjSpeak:CopyTable(ObjSpeak.DisplayMode)
					mode = ObjSpeak:BestrowTable(mode,ObjSpeak.PetMsgList[word_idx].Mode)
					ret_mode = ObjSpeak:CopyArray(mode)
				end
				--喊话API
				GameApi.ObjSpeak(objType,objWid,objTid,ObjSpeak.ValidTarget.PET_HOST,sMsg,ret_mode)
			end
		end
		return true
	end

	--宠物打招呼

	if eventType == ObjSpeak.EventType.PET_SAY_HELLO then
		word_idx = argsTbl["msg_id"];
		if word_idx and ObjSpeak.PetMsgList and ObjSpeak.PetMsgList[word_idx] then
			local sMsg = GameApi.PetConverSayHelloMsg(ObjSpeak.PetMsgList[word_idx].Word,argsTbl["master_name"],argsTbl["target_name"],argsTbl["pet_name"],argsTbl["target_id"])
			if sMsg then
				if ObjSpeak.PetMsgList[word_idx].Mode then
					local mode = ObjSpeak:CopyTable(ObjSpeak.DisplayMode)
					mode = ObjSpeak:BestrowTable(mode,ObjSpeak.PetMsgList[word_idx].Mode)
					ret_mode = ObjSpeak:CopyArray(mode)
				end

				if ret_mode and ret_mode.ShowChat and ret_mode.ChatChannel == CHAT_CHANNEL_WHISPER and GameApi.IsSelfID(argsTbl["target_id"]) == false then
					return false
				end

				--喊话API
				GameApi.ObjSpeak(objType,objWid,objTid,ObjSpeak.ValidTarget.NORMAL_TARGET,sMsg,ret_mode)
			end
		end
		return true
	end
	return false
end

--喊话对象触发条件事件
function ObjSpeak:OnObjEvent(eventType,argsTbl,objType,objWid,objTid)
	local target_type = 0
	local ret_string  = nil
	local ret_mode    = nil
	local word_idx    = 0
	local cond_ok     = false

	--宠物特殊消息
	if ObjSpeak:OnPetSvrMsgOrSayHello(eventType,argsTbl,objType,objWid,objTid) then
		return
	end

	--特殊Obj列表查找
	if ObjSpeak.SpecialObj[objTid] and ObjSpeak.SpecialObj[objTid][eventType] then
		cond_ok = false

		--查找条件列表
		if ObjSpeak.ObjCfg[objTid] and ObjSpeak.ObjCfg[objTid][eventType] then
			local cond_func = ObjSpeak.ObjCfg[objTid][eventType].CondFunc
			if cond_func ~= nil and cond_func(argsTbl) == true then
				cond_ok = true
			end
		end

		--计算概率是否满足
		if cond_ok == true and ObjSpeak:Probability(ObjSpeak.SpecialObj[objTid][eventType].Prop) and #ObjSpeak.SpecialObj[objTid][eventType].WordList > 0 then
			--计算随机索引
			local rand_idx = ObjSpeak:RandIndex(#ObjSpeak.SpecialObj[objTid][eventType].WordList)
			--计算文本索引
			word_idx = ObjSpeak.SpecialObj[objTid][eventType].WordList[rand_idx]

			--喊话对象
			if ObjSpeak.SpecialObj[objTid][eventType].Target then
				target_type = ObjSpeak.SpecialObj[objTid][eventType].Target
			end
		end
	else
	--普通Obj列表查找
		----概率判断
		local prob_sat = false
		for k1,v1 in pairs(ObjSpeak.NormalObj) do
			if ObjSpeak:ValueInTable(objTid,v1.IDList) and v1.Prob[eventType] and ObjSpeak:Probability(v1.Prob[eventType]) then
				cond_ok = false
				--查找条件列表

				if ObjSpeak.ObjCfg[k1] and ObjSpeak.ObjCfg[k1][eventType] then
					local cond_func = ObjSpeak.ObjCfg[k1][eventType].CondFunc
					if cond_func ~= nil and cond_func(argsTbl) == true then
						cond_ok = true

					end
				end
				prob_sat = true
				break
			end
		end

		--概率和条件都满足的情况下查找对于喊话集合
		if prob_sat and cond_ok then
			for k2,v2 in pairs(ObjSpeak.NormalSpeak) do
				if ObjSpeak:ValueInTable(objTid,v2.IDList) and v2.WordList[eventType] then
					--计算随机索引
					local rand_idx = ObjSpeak:RandIndex(#v2.WordList[eventType])
					--计算文本索引
					word_idx = v2.WordList[eventType][rand_idx]
					--喊话对象
					if v2.Target then
						target_type = v2.Target
					end
				end
			end
		end
	end

	--计算喊话文本和显示模式

	local word_list = nil
	if word_idx > 0 then
		if objType == ObjSpeak.ObjType.OBJ_PET then
			ret_string = ObjSpeak.PetMsgList[word_idx].Word
			--特殊显示模式控制
			if ObjSpeak.PetMsgList[word_idx].Mode then
				local mode = ObjSpeak:CopyTable(ObjSpeak.DisplayMode)
				mode = ObjSpeak:BestrowTable(mode,ObjSpeak.PetMsgList[word_idx].Mode)
				ret_mode = ObjSpeak:CopyArray(mode)
			end
			--喊话API
			GameApi.ObjSpeak(objType,objWid,objTid,target_type,ret_string,ret_mode)

		else
			ret_string = ObjSpeak.WordList[word_idx].Word
			--特殊显示模式控制
			if ObjSpeak.WordList[word_idx].Mode then
				local mode = ObjSpeak:CopyTable(ObjSpeak.DisplayMode)
				mode = ObjSpeak:BestrowTable(mode,ObjSpeak.WordList[word_idx].Mode)
				ret_mode = ObjSpeak:CopyArray(mode)
			end
			--喊话API
			GameApi.ObjSpeak(objType,objWid,objTid,target_type,ret_string,ret_mode)
		end
	end

	return false
end

--通配符替换

function ObjSpeak:Filter(val_string)
	return val_string
end

-----------------------------------------------------------------------------------------------------------
