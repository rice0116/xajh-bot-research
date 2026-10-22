--聊天频道定义
CHAT_CHANNEL_LOCAL			= 0		--普通频道
CHAT_CHANNEL_MAP			= 1		--地图频道
CHAT_CHANNEL_WORLD			= 2		--世界频道
CHAT_CHANNEL_TEAM			= 3		--队伍频道
CHAT_CHANNEL_FACTION		= 4		--帮派频道
CHAT_CHANNEL_BROADCAST		= 5		--广播频道
CHAT_CHANNEL_GRADE			= 6		--等级频道
CHAT_CHANNEL_WARNING		= 7		--警告频道
CHAT_CHANNEL_FETION			= 8		--飞信
CHAT_CHANNEL_WHISPER		= 9	--密语信息
CHAT_CHANNEL_SYSTEM			= 10	--系统信息
CHAT_CHANNEL_MISC			= 11	--其它频道
CHAT_CHANNEL_DAMAGE			= 12	--战斗频道
CHAT_CHANNEL_ENVIRONMENT	= 13	--环境频道
CHAT_CHANNEL_CAMP			= 14	--阵营频道
CHAT_CHANNEL_ALLIANCE		= 15	--联盟频道
CHAT_CHANNEL_COUNTRY		= 16	--龙吟频道

--喊话表
Speak = {}

--服务器数据
Speak.SvrQuery = {}
Speak.SvrGroupQuery = {}

--喊话内容配置表
Speak.Cfg = {}
Speak.Group = {}

--通配符配置表
Speak.Wildcard	=
{
	"#player_name#",		--玩家名字
	"#faction_name#",		--玩家帮派名
	"#sworn_name#",			--玩家结义名
	"#master_name#",		--玩家师傅名
	"#spouse_name#",		--玩家配偶名
	"#player_pos#",			--玩家所在位置
	"#monster_enmity#",		--怪物第一仇恨玩家名字
	"#monster_target#",		--怪物当前目标玩家名字
	"#monster_pos#",		--怪物所在位置
	"#ectype_creator#",		--开启副本的玩家名字
	"#ectype_owner#",		--副本的归属玩家名字
	"#ectype_member#",		--活动副本或者常规副本所属的队伍成员
	"#ectype_id#",			--当前副本或者战场的ID
	"#item_loot_owner#",		--掉落物品来源的loot的主体怪物名
	"#item_lottery#",		--掉落物品来源的彩票ID
	"#item_task#",			--掉落物品来源的任务ID
	"#item#",			--掉落物品属性
	"#sworn_nickname#",		--玩家结义称号(***之**)
	"#player_name_2#",		--第二个玩家名字，含义根据使用条件而定，下同
	"#player_name_3#",		--第三个玩家名字
	"#player_name_4#",		--第四个玩家名字
	"#ectype_creatorfaction#",	--开启副本的玩家帮派名字
	"#ectype_ownerfaction#",	--副本归属玩家的帮派名字
	"#scene_id#",			--所在场景id
	"#relation_name_1#",		--社会关系名1
	"#relation_name_2#",		--社会关系名2
	"#relation_name_3#",		--社会关系名3
	"#relation_name_4#",		--社会关系名4
	"#int_1#",			--整数1
	"#int_2#",			--整数2
	"#int_3#",			--整数3
	"#int_4#",			--整数4
	"#server_name#",
	"#wall_id#",
	"#scene_text_1#",
	"#scene_text_2#",
}

Speak.PopFrame =		--与ObjSpeak.PopFrame内容一致
{
	POPFRAME_NONE   = 0, --无边?
	NORMAL_FRAME    = 1, --普?实线. 圆角矩形
	MENTAL_FRAME    = 2, --心理活动:虚线圆角矩形
	OUTBURST_FRAME  = 3, --突发,惊讶,暴?实线,不规则尖?
	ASIDE_FRAME     = 4, --旁白:方块.
	INTERACT_NOTICE = 5, --交互提示
}

Speak.channelColor =
{
	[-1] = "",
	[0]  = "^DADAD9",
	[1]  = "^DADAD9",
	[2]  = "^B7DFE7",
	[3]  = "^9DBE65",
	[4]  = "^2AB693",
	[5]  = "^FC814A",
	[6]  = "^DADAD9",
	[7]  = "^C32A2A",
	[8]  = "^DADAD9",
	[9]  = "^FF5D0D",
	[10]  = "^F08DC3",
	[11]  = "^9DBFDE",
	[12]  = "^DADAD9",
	[13]  = "^EF4545",
	[14]  = "^DADAD9",
	[15]  = "^DADAD9",
	[16]  = "^FC814A",
}

function Speak:GetContentMask(strContent)
	local mask = 0
	for k,v in pairs(Speak.Wildcard) do
		local pos = string.find(strContent,v)
		if pos and pos > 0 then
			mask = mask + math.pow(2,k-1)
		end
	end
	return mask
end

--服务器配置初始化接口
--speak_num, { speak_id, channel, content_num,{content_mask} }
function InitSpeakConfig()
	xdofile("config/script/speak_data.lua")
	local speak_num = 0
	for k,v in pairs(Speak.Cfg) do
		if v.Content and #v.Content then
			Speak.SvrQuery[#Speak.SvrQuery + 1] = k
			speak_num = speak_num + 1
		end
	end
	local group_num = 0
	for k,v in pairs(Speak.Group) do
		Speak.SvrGroupQuery[#Speak.SvrGroupQuery + 1] = k
		group_num = group_num + 1
	end

	return speak_num,group_num
end

function GetSpeakConfig(idx)
	if Speak.SvrQuery[idx] then
		local ret_tbl   = {}
		local speak_id =  Speak.SvrQuery[idx]
		ret_tbl[#ret_tbl + 1] = speak_id
		ret_tbl[#ret_tbl + 1] = Speak.Cfg[speak_id].Channel
		ret_tbl[#ret_tbl + 1] = #Speak.Cfg[speak_id].Content
		for k,v in pairs(Speak.Cfg[speak_id].Content) do
			ret_tbl[#ret_tbl + 1] = Speak:GetContentMask(v)
		end
		return unpack(ret_tbl)
	end
end

--获取喊话组配置
--group_id, speak_num, { id, delay} }
function GetGroupConfig(idx)
	if Speak.SvrGroupQuery[idx] then
		local ret_tbl   = {}
		local group_id =  Speak.SvrGroupQuery[idx]
		ret_tbl[#ret_tbl + 1] = group_id
		ret_tbl[#ret_tbl + 1] = #Speak.Group[group_id]
		for k,v in pairs(Speak.Group[group_id]) do
			ret_tbl[#ret_tbl + 1] = v.ID
			ret_tbl[#ret_tbl + 1] = v.Delay
		end
		return unpack(ret_tbl)
	end
end

--将字符串转中的通配符转换成Link
function Speak:LookUpLink(Content, channel)
	local colorCode = Speak.channelColor[channel]
	return TextLink:ParseText(Content, colorCode)
end

function Speak:LookUpUILink(Content)
	return TextLink:ParseText(Content)
end

--获取要转换的Link类型
function Speak:GetLinkType(Content)
	local i
	for k, v in pairs(Speak.LinkType) do
		if type(v[1]) ~= "table" then
			i = string.find(Content, v[1])
			if i then
				return v[1], v[2], v[3], ""
			end
		else
			for j, l in ipairs(v[1]) do
				i = string.find(Content, l[1])
				if i then
					return l[1], l[2], v[3], l[3]
				end
			end
		end
	end
	return nil
end

function Speak:GetSceneText (sceneTextIndex)
	return SPEAK_SCENE_TEXT[sceneTextIndex]
end

--客户端ID喊话接口
--返回格式: 喊话内容，喊话频道
function Speak:GetSpeakInfo (idSpeak,idxContent)
	if Speak.Cfg[idSpeak] and Speak.Cfg[idSpeak].Content and #Speak.Cfg[idSpeak].Content >= idxContent then
		return self:LookUpLink(Speak.Cfg[idSpeak].Content[idxContent], Speak.Cfg[idSpeak].Channel),
			   Speak.Cfg[idSpeak].Channel,
			   Speak.Cfg[idSpeak].ShowChat,
			   Speak.Cfg[idSpeak].ShowName,
			   Speak.Cfg[idSpeak].ShowImage,
			   Speak.Cfg[idSpeak].Period
	end
end
--客户端ID喊话响应函数，弹出头像窗口
--content: 转换后的文字内容
--idObj: 喊话对象为npc的时候此id有值
--typeObj: obj类型,具体取值参照ObjSpeak.ObjType
--tidObj: 对象模板id
function Speak:OnClientSpeak(idSpeak, idxContent, content,idObj,typeObj,tidObj)
	if Speak.Cfg[idSpeak] and Speak.Cfg[idSpeak].Content and #Speak.Cfg[idSpeak].Content >= idxContent then
		if Speak.Cfg[idSpeak].Period ~= 0  then

			if Speak.Cfg[idSpeak].ShowUIType == 2 then
				DlgApi.ShowDialog("Win_SpeakSingleLine", true, false, false)
				Win_SpeakSingleLine:ShowContent(content, Speak.Cfg[idSpeak].ShowName, Speak.Cfg[idSpeak].ShowImage, Speak.Cfg[idSpeak].Period)
			else
				if Speak.Cfg[idSpeak].ShowImage ~= "" then
					DlgApi.ShowDialog("Win_SpecialSpeak", true, false, false)
					Win_SpecialSpeak:ShowContent(content, Speak.Cfg[idSpeak].ShowName, Speak.Cfg[idSpeak].ShowImage, Speak.Cfg[idSpeak].Period)
				end
			end

		end


		if Speak.Cfg[idSpeak].ShowPop and idObj ~= 0 and (typeObj == ObjSpeak.ObjType.OBJ_NPC or typeObj == ObjSpeak.ObjType.OBJ_MONSTER) then
			local mode = ObjSpeak:CopyTable(ObjSpeak.DisplayMode)
			mode.ShowPop  = true
			mode.FrameType = Speak.Cfg[idSpeak].FrameType
			mode.FontSize = 10
			local ret_mode = ObjSpeak:CopyArray(mode)
			GameApi.ObjSpeak(typeObj,idObj,tidObj,ObjSpeak.ValidTarget.NORMAL_TARGET,content,ret_mode)
		end
	end
end
