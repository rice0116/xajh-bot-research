--[[#tag push auto]]
---------------------------------------------------------------
--  created:   2009.07.09
--  表情动作播放特效脚本
---------------------------------------------------------------
--函数说明
--PlayEmotePicture  播放表情动作对应的图片
--参数：  playerid(int)玩家id
--        slot         对应图片的索引(based:1)
--        delay        动作开始多久开始播放(单位ms)
--	      last         播放时间(单位ms)

--PlayEmoteGFX  播放GFX特效
--参数：  playerid(int) 玩家id
--        gfxf (string) 对应gfx文件路径

--PlayEmoteChat 播放聊天信息
--参数： msg(string)    对应聊天内容
--       channelid(int) 玩家id

Emote = {}
Emote.EmoteInfo = {}
Emote.EmoteSkillInfo = {}
Emote.ObjList = {}
Emote.ObjList["NPC"] = {}
Emote.SpeakList = {}
Emote.Icon = {}
Emote.SpecialDesc  = {}

--表情文字
Emote.EMOTION_TEXT_1 = --[[!AUTO_1]]"行為"
Emote.EMOTION_TEXT_2 = --[[!AUTO_2]]"操作"
Emote.EMOTION_TEXT_3 = --[[!AUTO_3]]"走跑切換"

Emote.EMOTION_TYPE_1 = --[[!AUTO_4]]"動作"
Emote.EMOTION_TYPE_2 = --[[!AUTO_5]]"功能"
Emote.EMOTION_TYPE_3 = --[[!AUTO_6]]"表情"
Emote.EMOTION_TYPE_4 = --[[!AUTO_7]]"交流"
Emote.EMOTION_TYPE_5 = --[[!AUTO_8]]"心情"
Emote.EMOTION_TYPE_6 = --[[!AUTO_9]]"肢體語言"
Emote.EMOTION_TYPE_7 = --[[!AUTO_10]]"基本操作"
Emote.EMOTION_TYPE_8 = "舞蹈"
Emote.EMOTION_TYPE_9 = "求打賞"

Emote.Picture =
{
	[ 1] = --[[!AUTO_11]]"Emote\\表情动作_1_男.dds",
	[ 2] = --[[!AUTO_12]]"Emote\\表情动作_1_女.dds",
}

Emote.GFX =
{
	[ 1] = --[[!AUTO_13]]"Emote\\长条凳流光.gfx",
	[ 2] = --[[!AUTO_14]]"Emote\\长条凳流光.gfx",
	[ 3] = --[[!AUTO_15]]"Emote\\长条凳流光.gfx",
	[ 4] = --[[!AUTO_16]]"Emote\\长条凳流光.gfx"
}

Emote.ChatTag =
{
  [EXPRESSION_TYPE.WAVE + 1] =  {--[[!AUTO_17]]"@@揮手",--[[!AUTO_18]]"@@打招呼",--[[!AUTO_19]]"@@hello"},
	[EXPRESSION_TYPE.ASK + 1] =  {--[[!AUTO_20]]"@@請求",--[[!AUTO_21]]"@@拜託",--[[!AUTO_22]]"@@ask"},
	[EXPRESSION_TYPE.KNEEL + 1] =  {--[[!AUTO_23]]"@@下跪",--[[!AUTO_24]]"@@下跪抱拳",--[[!AUTO_25]]"@@knee"},
	[EXPRESSION_TYPE.POINT + 1] =  {--[[!AUTO_26]]"@@手指前方",--[[!AUTO_27]]"@@指證",--[[!AUTO_28]]"@@就是你"},
	[EXPRESSION_TYPE.SALUTE + 1] =  {--[[!AUTO_29]]"@@抱拳",--[[!AUTO_30]]"@@幸會",--[[!AUTO_31]]"@@見面"},
	[EXPRESSION_TYPE.SHY + 1] =  {--[[!AUTO_32]]"@@害羞",--[[!AUTO_33]]"@@羞澀",--[[!AUTO_34]]"@@shy"},
	[EXPRESSION_TYPE.ANGRY + 1] =  {--[[!AUTO_35]]"@@生氣",--[[!AUTO_36]]"@@發怒",--[[!AUTO_37]]"@@angry"},
	[EXPRESSION_TYPE.SAD + 1] =  {--[[!AUTO_38]]"@@傷心",--[[!AUTO_39]]"@@難過",--[[!AUTO_40]]"@@sad"},
	[EXPRESSION_TYPE.CLAP + 1] =  {--[[!AUTO_41]]"@@鼓掌",--[[!AUTO_42]]"@@拍手",--[[!AUTO_43]]"@@clap"},
	[EXPRESSION_TYPE.APPLAUSE + 1] =  {--[[!AUTO_44]]"@@歡呼",--[[!AUTO_45]]"@@高興",--[[!AUTO_46]]"@@興奮"},
	[EXPRESSION_TYPE.KISS + 1] =  {--[[!AUTO_47]]"@@飛吻",--[[!AUTO_48]]"@@親吻",--[[!AUTO_49]]"@@kiss"},
	[EXPRESSION_TYPE.DRINK + 1] = {"@@喝酒","@@喝酒","@@drink"}, 
	[EXPRESSION_TYPE.EAT + 1] = {"@@吃肉","@@吃肉","@@eat"}, 
	[EXPRESSION_TYPE.BEG + 1] =  {"@@跪求","@@跪求","@@beg"}, 
	[EXPRESSION_TYPE.PUSHUP + 1] =  {"@@俯臥撐","@@俯臥撐","@@pushup"}, 
	[EXPRESSION_TYPE.SAUCE + 1] =  {"@@打醬油","@@打醬油","@@sauce"}, 
	[EXPRESSION_TYPE.SLEEP + 1] =  {"@@睡覺","@@睡覺","@@sleep"}, 
	[EXPRESSION_TYPE.LIEDOWNDRINK + 1] =  {"@@躺下喝酒","@@躺下喝酒","@@dndrink"}, 
	[EXPRESSION_TYPE.BOW + 1] =  {"@@作揖","@@作揖","@@bow"}, 
	[EXPRESSION_TYPE.BORING + 1] =  {"@@無聊","@@無聊","@@boring"}, 
	[EXPRESSION_TYPE.SCARED + 1] =  {"@@海派","@@海派","@@scared"}, 
	[EXPRESSION_TYPE.GAMBLING_0 + 1] =  {"@@猜拳石頭","@@猜拳石頭","@@gamb1"}, 
	[EXPRESSION_TYPE.GAMBLING_1 + 1] =  {"@@猜拳剪刀","@@猜拳剪刀","@@gamb2"}, 
	[EXPRESSION_TYPE.GAMBLING_2 + 1] =  {"@@猜拳布","@@猜拳布","@@gamb3"}, 
	[EXPRESSION_TYPE.SHAKEHEAD + 1] =  {"@@搖頭","@@搖頭","@@shkhead"}, 
	[EXPRESSION_TYPE.CUTE + 1] =  {"@@裝可愛","@@裝可愛","@@cute"},
	[EXPRESSION_TYPE.SITDOWN + 1] =  {"@@坐下","@@坐下","@@sitdown"}, 
	[EXPRESSION_TYPE.HIDE + 1] =  {"@@潛伏","@@潛伏","@@hide"},
}

function Emote:GetCfg()
	local emote_cfg = {}
	emote_cfg.Picture = Emote.Picture
	emote_cfg.ChatTag = Emote.ChatTag
	return emote_cfg
end

Emote.EmoteGenderNPC 		= 100 	--服务NPC
Emote.EmoteGenderMonster 	= 101 	--怪
Emote.EmoteGenderPet		= 102	--宠

--	程序内调用此函数用来判断目标是否需要回应（包括转向、做动作、泡泡）
--idEmote: 	表情id
--idSkill:	技能id
--nSkillSucc: 技能是否放成功:0-fail, 1-succ
function Emote:CanResponseEmote(idEmote, idSkill, nSkillSucc, genderFrom, genderTo, typeTo, templIDTo, bFromMaster)

	--local strDbg = string.format("CanResponseEmote: Skill %d, %d, Emote: %d, genderTo %d, typeTo %d, templIDTo %d\n",
	--	idSkill, nSkillSucc, idEmote, genderTo, typeTo, templIDTo)
	--LogPrint(strDbg)

	if NPCSpecialAction[templIDTo] and  NPCSpecialAction[templIDTo][ObjectLogicActFlag.STAND] then
		return false
	end

	if typeTo == ObjSpeak.ObjType.OBJ_NPC then
		local actname = Emote:GetEmoteActname(idSkill, nSkillSucc, idEmote, genderFrom, typeTo, templIDTo)
		if actname == 0 then
			return false
		else
			return true
		end
	end
	return true
end


--CallType: 调用类型：0-仅发表情的玩家喊话，1-仅目标喊话，2-全都喊
--idEmote: 	表情id
--idSkill:	技能id
--nSkillSucc: 技能是否放成功:0-fail, 1-succ
--idFrom: 	做表情的玩家id
--nameFrom :  做表情的玩家名字
--genderFrom：做表情的玩家性别
--idTo: 	使用表情的目标（玩家或npc或宠物）id
--nameTo: 	使用表情的目标名字（玩家或npc或宠物）
--genderTo: 目标性别（仅对玩家）
--typeTo: 	目标（玩家或npc或宠物）类型，见 ObjSpeak.ObjType
--templIDTo:目标的模板id（仅对npc，怪，宠）
--idEmote: 	表情id，即visual.lua里的 EXPRESSION_TYPE 定义
--bFromMaster: 是否来自宠物的主人
--chatchannel: 消息频道

EmoteIgnoreList =
{
[64151] = true,
[64152] = true,
[64153] = true,
[64161] = true,
[64162] = true,
[64163] = true,
[64164] = true,
[64165] = true,
[64166] = true,
[64167] = true,
[64168] = true,
[64169] = true,
[64170] = true,
[64171] = true,
[64172] = true,
[64173] = true,
[64174] = true,
[64175] = true,
[64176] = true,
[64177] = true,
[64178] = true,
[64179] = true,
[64180] = true,
[64181] = true,
[64182] = true,
[64183] = true,
[64184] = true,
[64185] = true,
[64186] = true,
[64187] = true,
[64188] = true,
[64189] = true,
[64190] = true,
[64191] = true,
[64192] = true,
[64193] = true,
[64194] = true,
[64195] = true,
[64196] = true,
[64197] = true,
[64237] = true,
[64238] = true,
[64239] = true,
[64240] = true,
[64241] = true,
[64242] = true,
[64243] = true,
[64244] = true,
[64245] = true,
[64246] = true,
[64247] = true,
[64248] = true,
[64249] = true,
[64250] = true,
[64251] = true,
[64252] = true,
[64253] = true,
[64254] = true,
[64255] = true,
[64256] = true,
[64257] = true,
[64258] = true,
[64259] = true,
[64260] = true,
[64261] = true,
[64262] = true,
[64263] = true,
[64264] = true,
[64265] = true,
[64463] = true,
[64601] = true,
[64602] = true,
[64603] = true,
[64604] = true,
[64605] = true,
[64606] = true,
[64607] = true,
[64608] = true,
[64609] = true,
[64610] = true,
[64611] = true,
[64612] = true,
[64613] = true,
[64614] = true,
[64615] = true,
[64616] = true,
[64617] = true,
[64618] = true,
[64619] = true,
[64620] = true,
[66022] = true,
[71814] = true,
[71815] = true,
[71816] = true,
[71817] = true,
[71818] = true,
[71819] = true,
[71820] = true,
[71821] = true,
[71822] = true,
[71823] = true,
[71824] = true,
[71825] = true,
[71826] = true,
[71827] = true,
[71828] = true,
[71829] = true,
[71830] = true,
[71831] = true,
[71832] = true,
[71833] = true,
[71914] = true,
[71915] = true,
[71916] = true,
[71917] = true,
[71918] = true,
[71919] = true,
[71920] = true,
[71921] = true,
[71922] = true,
[71923] = true,
[71924] = true,
[71925] = true,
[71926] = true,
[71927] = true,
[71928] = true,
[71929] = true,
[71930] = true,
[71931] = true,
[71932] = true,
[71933] = true,
[71934] = true,
[71935] = true,
[71936] = true,
[71937] = true,
[71938] = true,
[64524] = true,
[64525] = true,
[64526] = true,
[64527] = true,
[64535] = true,
[64536] = true,
[64537] = true,
[64538] = true,
}

function Emote:OnPlayerDoEmoteToTarget(CallType, idEmote, idSkill, nSkillSucc, idFrom, nameFrom, genderFrom, idTo, nameTo, genderTo, typeTo, templIDTo, bFromMaster, chatchanne, selfPopMsg)

	--local strDbg = string.format("OnPlayerDoEmoteToTarget: CallType: %d, Skill %d, %d, Emote: %d, %s -> %s\n", CallType, idSkill, nSkillSucc, idEmote, nameFrom, nameTo)
	--LogPrint(strDbg)

	if CallType == 0 --仅发表情的玩家喊话
		or CallType == 2 then --全都喊

		--	发表情的玩家：

		local tabEmote = nil
		if idSkill ~= 0 then
			if Emote.EmoteSkillInfo[idSkill] then
				tabEmote = Emote.EmoteSkillInfo[idSkill][nSkillSucc][genderFrom]
			end
		else
			if Emote.EmoteInfo[idEmote] then
				tabEmote = Emote.EmoteInfo[idEmote][genderFrom]
			end
		end

		if EmoteIgnoreList[templIDTo] then
			return
		end

		if tabEmote then
			--print("tabEmote Not Nil\n")

			local msg = nil
			local msgPop = nil
			local hostid = GameApi.GetHostRuid()
			if tabEmote.needTargetName == true and idTo ~= 0 and idTo ~= idFrom then
				--	聊天栏
				msg = tabEmote.chatMsg
				local scene_id	= GameApi.GetSceneID()	--0测试图，1野外图，2城市图，3副本图，4活动图，5门派图
				--LogPrint("1(target): " .. scene_id)
				if InstInfo_Common[scene_id] then
					if InstInfo_Common[scene_id].map_type ~= 3 and #msg > 0 then	--副本图中不显示这样的消息
						local total_msg = string.format(--[[!AUTO_53]]"^B062FF%s ^B062FF%s", nameFrom, string.format(msg, nameTo))
						GameApi.AddChatMessage(CHAT_CHANNEL_ENVIRONMENT, total_msg)
					end
				end
				--	头顶泡泡				
				_, _, msgPop = Emote:GetEmoteActname(idSkill, nSkillSucc, idEmote, genderFrom, typeTo, templIDTo)
				if selfPopMsg then
					msgPop = selfPopMsg
				end				
				if msgPop then
					if selfPopMsg == nil then
						msgPop = string.format(msgPop, nameTo)
					end
			 		local mode = ObjSpeak:CopyTable(ObjSpeak.DisplayMode)
					mode = ObjSpeak:BestrowTable(mode, ObjSpeak.DefaultMode[ObjSpeak.DefaultModeID.NOCHAT_NOHEAD])
					local ret_mode = ObjSpeak:CopyArray(mode)
					GameApi.ObjSpeak(0, idFrom, ObjSpeak.ValidTarget.NORMAL_TARGET, msgPop, ret_mode)
				end
			else
				--	聊天栏
				msg = tabEmote.chatMsgNoTarget
				local scene_id	= GameApi.GetSceneID()	--0测试图，1野外图，2城市图，3副本图，4活动图，5门派图
				--LogPrint("2(no target): " .. scene_id)
				if InstInfo_Common[scene_id] then
					if InstInfo_Common[scene_id].map_type ~= 3 and #msg > 0 then	--副本图中不显s示这样的消息
						local total_msg = string.format(--[[!AUTO_54]]"^B062FF%s ^B062FF%s", nameFrom, msg)
						GameApi.AddChatMessage(CHAT_CHANNEL_ENVIRONMENT, total_msg)
					end
				end
				--	头顶泡泡				
				msgPop = tabEmote.popMsgNoTarget
				if selfPopMsg then
					msgPop = selfPopMsg
				end
				if msgPop then
			 		local mode = ObjSpeak:CopyTable(ObjSpeak.DisplayMode)
					mode = ObjSpeak:BestrowTable(mode, ObjSpeak.DefaultMode[ObjSpeak.DefaultModeID.NOCHAT_NOHEAD])
					local ret_mode = ObjSpeak:CopyArray(mode)
					GameApi.ObjSpeak(0, idFrom, ObjSpeak.ValidTarget.NORMAL_TARGET, msgPop, ret_mode)
				end
			end


			GameApi.PlayEmoteGFX(idFrom, tabEmote.gfx)
		end
	end

	if CallType == 1 --仅目标喊话
		or CallType == 2 then --全都喊
		Emote:DoEmoteResponse(idSkill, nSkillSucc, idEmote, idFrom, nameFrom, genderFrom, idTo, nameTo, genderTo, typeTo, templIDTo, bFromMaster, chatchannel)
	end
end

function Emote:DoEmoteResponse(idSkill, nSkillSucc, idEmote, idFrom, nameFrom, genderFrom, idTo, nameTo, genderTo, typeTo, templIDTo, bFromMaster, chatchannel)

	--	做动作在ecmactname.lua 中处理了，见ObjectLogicActFlag.EMOTE_RESPONSE
	--	目标头顶喊话
	if  typeTo == ObjSpeak.ObjType.OBJ_PLAYER then

		-- 对别人做表情，别人喊话
		local tabEmote = nil
		if idSkill ~= 0 then
			tabEmote = Emote.EmoteSkillInfo[idSkill][nSkillSucc][genderFrom]
		else
			tabEmote = Emote.EmoteInfo[idEmote][genderFrom]
		end

		local msgSpeak = nil
		if tabEmote then
			msgSpeak  = tabEmote.chatMsgResponse
			if msgSpeak then
		 		local mode = ObjSpeak:CopyTable(ObjSpeak.DisplayMode)
				mode = ObjSpeak:BestrowTable(mode, ObjSpeak.DefaultMode[ObjSpeak.DefaultModeID.NOCHAT_NOHEAD])
				ret_mode = ObjSpeak:CopyArray(mode)
				GameApi.ObjSpeak(typeTo, idTo, ObjSpeak.ValidTarget.NORMAL_TARGET, msgSpeak, ret_mode)
			end
		end

	elseif typeTo == ObjSpeak.ObjType.OBJ_NPC
		or typeTo == ObjSpeak.ObjType.OBJ_MONSTER
		then

	 	-- 对NPC做表情，NPC喊话
		local tabEmote = nil
		if idSkill ~= 0 then
			tabEmote = Emote.EmoteSkillInfo[idSkill][nSkillSucc]
		else
			tabEmote = Emote.EmoteInfo[idEmote]
		end

	 	local msgSpeak = nil
	 	local typeNPC = Emote.EmoteGenderNPC
		local tabNPCEmote = nil

	 	if typeTo == ObjSpeak.ObjType.OBJ_MONSTER then
	 		typeNPC = Emote.EmoteGenderMonster
			tabNPCEmote = tabEmote[typeNPC]
			if tabNPCEmote then
	 			msgSpeak = tabNPCEmote.Msg
	 		end
		elseif typeTo == ObjSpeak.ObjType.OBJ_NPC then
			_, msgSpeak, _ = Emote:GetEmoteActname(idSkill, nSkillSucc, idEmote, genderFrom, typeTo, templIDTo)
	 	end

	 	if  msgSpeak then
	 		local mode = ObjSpeak:CopyTable(ObjSpeak.DisplayMode)
			mode = ObjSpeak:BestrowTable(mode, ObjSpeak.DefaultMode[ObjSpeak.DefaultModeID.NOCHAT_NOHEAD])
			ret_mode = ObjSpeak:CopyArray(mode)
			GameApi.ObjSpeak(typeTo, idTo, ObjSpeak.ValidTarget.NORMAL_TARGET, msgSpeak, ret_mode)
		end

	elseif typeTo == ObjSpeak.ObjType.OBJ_PET then

	  -- 对宠做表情，宠喊话
		local tabEmote = nil
		if idSkill ~= 0 then
			tabEmote = Emote.EmoteSkillInfo[idSkill][nSkillSucc]
		else
			tabEmote = Emote.EmoteInfo[idEmote]
		end

	 	local msgSpeak = nil
		local word_idx = 0	-- ObjSpeak.PetMsgList 中的喊话索引，见obj_speak_data.lua
		local tabPetEmote = tabEmote[Emote.EmoteGenderPet].MsgID
		if tabPetEmote then
			if bFromMaster == true then
				word_idx = tabPetEmote[1]
			else
				word_idx = tabPetEmote[2]
			end
		end

		if word_idx and ObjSpeak.PetMsgList and ObjSpeak.PetMsgList[word_idx] then
			local sMsg = GameApi.PetConverSvrMsg(
						nameTo,		--宠物名字
						--[[!AUTO_55]]"", 		--宠物主人名字（此处不用填）

						nameFrom,	--宠喊话对象名字

						ObjSpeak.PetMsgList[word_idx].Word) --喊话内容
			if sMsg then
				local ret_mode  = nil
				if ObjSpeak.PetMsgList[word_idx].Mode then
					local mode = ObjSpeak:CopyTable(ObjSpeak.DisplayMode)
					mode = ObjSpeak:BestrowTable(mode,ObjSpeak.PetMsgList[word_idx].Mode)
					ret_mode = ObjSpeak:CopyArray(mode)
				end
				--喊话API
				if ret_mode then
					GameApi.ObjSpeak(typeTo, idTo, 0, ObjSpeak.ValidTarget.NORMAL_TARGET, sMsg, ret_mode)
				end
			end
		end
	end
end

--判断各种条件之后，返回最终喊话及动作
function Emote:GetEmoteActname(idSkill, nSkillSucc, idEmote, genderFrom, typeTo, templIDTo)

	idEmote = idEmote or 0
--	LogPrint("idEmote: ".. idEmote)
	local mode
	local actname = 0
	local msg = --[[!AUTO_56]]""
	local msg_id = 0
	local pmsg = --[[!AUTO_57]]""
	local pmsg_id = 0
	local obj_info
	local count
	local flag = false

	local tabEmote = nil
	if idSkill ~= 0 then
		if Emote.EmoteSkillInfo[idSkill] then
			tabEmote = Emote.EmoteSkillInfo[idSkill][nSkillSucc]

			--local strDbg = string.format("GetEmoteActname: Skill %d, %d, Emote: %d, genderFrom %d, typeTo %d, templIDTo %d\n",
			--	idSkill, nSkillSucc, idEmote, genderFrom, typeTo, templIDTo)
			--LogPrint(strDbg)
		end
	else
		tabEmote = Emote.EmoteInfo[idEmote]
	end

	--pmsg赋为表情对应的默认喊话

	if tabEmote and tabEmote[genderFrom] then
		pmsg = tabEmote[genderFrom].popMsg
	end

	if Emote.ObjList["NPC"][templIDTo] then
		obj_info = Emote.ObjList["NPC"][templIDTo]
		mode = obj_info.mode
	else
		obj_info = nil
		mode = 1
	end

	--若没有特殊喊话则返回默认的回应动作、玩家及目标喊
	if obj_info == nil or obj_info.reaction == nil or #obj_info.reaction <= 0 then
		if mode == 1 then

			if idSkill ~= 0 and tabEmote == nil then
				-- 没有配置技能的：不做表情
				actname  = 0
			else
				actname = idEmote%2+1
			end

			if tabEmote and tabEmote[Emote.EmoteGenderNPC]then
				msg = tabEmote[Emote.EmoteGenderNPC].Msg
			end

		elseif mode == 2 then
			actname = 0
			msg = --[[!AUTO_58]]""
		end
--		LogPrint("actname: ".. actname)
--		LogPrint("msg: ".. msg)
--		LogPrint("pmsg: ".. pmsg)
		return actname, msg, pmsg
	else
	end

	--若需特殊回复，则根据特殊条件返回回应动作、玩家及目标喊话
	for count = 1, #obj_info.reaction do
		if idEmote == obj_info.reaction[count].EmoteID then
			--是否携带特定ID任务
			if (obj_info.reaction[count].Cond == 1 or obj_info.reaction[count].Cond == 2) and #obj_info.reaction[count].Var > 0 then
				for k,v in pairs(obj_info.reaction[count].Var) do
					local state = GameApi.HasTaskRecently(v, 3000)
					if state == true then
						flag = true
						break
					end
				end
			--是否携带特定ID物品
			elseif obj_info.reaction[count].Cond == 3 and #obj_info.reaction[count].Var > 0 then
				for k,v in pairs(obj_info.reaction[count].Var) do
					if GameApi.HaveItem(v) then
						flag = true
						break
					end
				end
			--是否携带特定IDbuff
			elseif obj_info.reaction[count].Cond == 6 and #obj_info.reaction[count].Var > 0 then

			end

			if obj_info.reaction[count].Cond == 0 or flag == true then
				actname = obj_info.reaction[count].Actname
				msg_id = obj_info.reaction[count].Msgid
				if msg_id ~= 0 then
					msg = Emote.SpeakList["Target"][msg_id].Text
				end

				if obj_info.reaction[count].pFlag == true then
					pmsg_id = obj_info.reaction[count].pMsgid
					if pmsg_id ~= 0 then
						pmsg = Emote.SpeakList["Player"][pmsg_id].Text
					end
				end
--				LogPrint("actname: ".. actname)
--				LogPrint("msg: ".. msg)
--				LogPrint("pmsg: ".. pmsg)
				return actname, msg, pmsg
			end
		end
	end

	--如果不满足所有特殊回复条件，则返回默认回复。

	if mode == 1 then
		actname = idEmote%2+1
		if tabEmote and tabEmote[Emote.EmoteGenderNPC] then
			msg = tabEmote[Emote.EmoteGenderNPC].Msg
		end
	elseif mode == 2 then
		actname = 0
		msg = --[[!AUTO_59]]""
		pmsg = --[[!AUTO_60]]""
	end
--	LogPrint("actname: ".. actname)
--	LogPrint("msg: ".. msg)
--	LogPrint("pmsg: ".. pmsg)

	return actname, msg, pmsg

end

function Emote:GetDanceDesc(danceActionConfigID, actionIndex)
	local result = {}
	
	local action = GetPlayerDanceActionWithConfigID(danceActionConfigID, actionIndex)
	if action ~= nil then
		result["title"] = action.text
		result["icon"] = action.icon
		result["info1"] = string.format(--[[!AUTO_67]]"類型：%s%s\r分類：%s", Emote.EMOTION_TYPE_3, Emote.EMOTION_TYPE_1, Emote.EMOTION_TYPE_8)
		result["limitskill"] = "使用：左鍵點擊"
	end
	
	return result
end

function Emote:GetDesc(idEmote)

	local tbl = {}

	--描述面板表头
	local tiptitle = --[[!AUTO_61]]""
	if idEmote == 1 then
		tiptitle = Emote.EMOTION_TEXT_1
	elseif idEmote == 2 then
		tiptitle = Emote.EMOTION_TEXT_2
	elseif idEmote == 3 then
		tiptitle = Emote.EMOTION_TEXT_3
	elseif idEmote == 4 then
		tiptitle = Emote.EMOTION_TYPE_9
	elseif PlayerExpAction[idEmote - 4] then
		tiptitle = PlayerExpAction[idEmote - 4].text
	end

	tbl["title"] = tiptitle

	--描述面板图标
	local tipicon = --[[!AUTO_62]]""
	tipicon = Emote.Icon[idEmote] or --[[!AUTO_63]]"00752未知物品.dds"

	tbl["icon"] = tipicon

	--描述面板表头
	--1最多3行，2最多1行，3最多2行（用\r分割）
	local tipinf01 = --[[!AUTO_64]]""
	local tipinf02 = --[[!AUTO_65]]""
	local tipinf03 = --[[!AUTO_66]]""

	tipinf01 = Emote.EMOTION_TYPE_1

	if idEmote <= 4 then
		tipinf02 = Emote.EMOTION_TYPE_2
		tipinf03 = Emote.EMOTION_TYPE_7
	else
		tipinf02 = Emote.EMOTION_TYPE_3
		if idEmote <= 9 then
			tipinf03 = Emote.EMOTION_TYPE_4
		elseif idEmote <= 15 then
			tipinf03 = Emote.EMOTION_TYPE_5
		else
			tipinf03 = Emote.EMOTION_TYPE_6
		end
	end

	tbl["info1"] = string.format(--[[!AUTO_67]]"類型：%s%s\r分類：%s",tipinf02,tipinf01,tipinf03)
	--tbl["info2"] = tipinf02
	--tbl["info3"] = tipinf03

	--描述面板星级
	--s_t，s代表星数，-1不显示。t代表显示方案，0为正常，1为同步闪烁，2为待定
	local tipstar = --[[!AUTO_68]]""
	tipstar = --[[!AUTO_69]]"-1_0"

	--描述面板限制（左）与消耗（右）
	--用\r分割
	local tiplimitleft = --[[!AUTO_70]]""
	local tiplimitright = --[[!AUTO_71]]""

	--描述面板描述信息
	--用\r分割
	local tiplimitskill = --[[!AUTO_72]]""
	if Emote.SpecialDesc[idEmote] then
		tiplimitskill = Emote.SpecialDesc[idEmote].info1
	else

	end

	tbl["limitskill"] = --[[!AUTO_73]]"使用：左鍵點擊"

	--描述面板属性信息
	--用\r分割
	local tipdesc = --[[!AUTO_74]]""

	--描述面板附加信息
	--用\r分割
	local tipremark = --[[!AUTO_75]]""
	if Emote.SpecialDesc[idEmote] then
		tipremark = Emote.SpecialDesc[idEmote].info2
	end

	tbl["remark"] = tipremark

	--描述面板价格信息
	--单位依次：文、贯、金、玉
	local tiplabmoney = --[[!AUTO_76]]""
	local tipmoney1 = --[[!AUTO_77]]""
	local tipmoney2 = --[[!AUTO_78]]""
	local tipmoney3 = --[[!AUTO_79]]""
	local tipmoney4 = --[[!AUTO_80]]""

	--描述面板声望消耗信息
	local tiplabfame = --[[!AUTO_81]]""
	local tipfame = --[[!AUTO_82]]""

	--描述面板物品兑换信息
	local tiplabexchange = --[[!AUTO_83]]""
	local tipexchange = --[[!AUTO_84]]""
	local tipexchangepic = --[[!AUTO_85]]""

	--描述面板元宝信息
	--单位依次：银元、金元
	local tiplabxcash = --[[!AUTO_86]]""
	local tipgold1 = --[[!AUTO_87]]""
	local tipgold2 = --[[!AUTO_88]]""

--返回数据：17项（09.12.11）
	return tbl
end


--[[
require "Visual"
require "action"
require "text"
tiptitle,tipicon,tipinf01,tipinf02,tipinf03,tipstar,tiplimitleft,tiplimitright,tiplimitskill,tipdesc,tipremark,tiplabmoney,tipmoney1,tipmoney2,tipmoney3,tipmoney4,tiplabfame,tipfame,tiplabexchange,tipexchange,tipexchangepic,tiplabxcash,tipgold1,tipgold2 = Emote:GetDesc(1)
print(tiptitle)
print(tipicon)
print(tipinf01)
print(tipinf02)
print(tipinf03)
print(tiplimitskill)
print(tipremark)
]]--


