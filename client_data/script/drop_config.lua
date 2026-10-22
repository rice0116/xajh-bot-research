--[[#tag push auto]]


-------------------------------------------
--	掉落相关配置
-------------------------------------------

DropCfg = {}

-- 获取物品的掉落模型id
-- tid: 物品ID
-- cid: 物品类型，见constant.lua里的item class id
--[[具体说明
ClassType.ICID_EQUIP				= 1	--	装备
ClassType.ICID_MATERIAL				= 2	--	生产原料
ClassType.ICID_MEDICINE				= 3	--	药品
ClassType.ICID_REVSCROLL			= 4	--	复活卷轴
ClassType.ICID_SKILLTOME			= 5	--	技能卷轴

ClassType.ICID_TOWNSCROLL			= 6	--	回城卷轴
ClassType.ICID_TASKITEM				= 7	--	任务物品
ClassType.ICID_ESTONE				= 8	--	镶嵌石

ClassType.ICID_PSTONE				= 9	--	属性石
ClassType.ICID_SSTONE				= 10	--	附魔石

ClassType.ICID_TASKDICE				= 11	--	任务随机发生器

ClassType.ICID_TASKNMMATTER				= 12	--	（无模板）用于任务的普通物品

ClassType.ICID_ERRORITEM				= 13	--	错误物品
ClassType.ICID_GM_GENERATOR				= 14	--	（无模板）GM物品生成器

ClassType.ICID_RECIPE					= 15	--	配方
ClassType.ICID_FIREWORK					= 16	--	烟花
ClassType.ICID_REFINETICKET				= 17	--	精炼概率调整道具
ClassType.ICID_RECIPEROLL				= 18	--	配方卷轴
ClassType.ICID_TRANSMITROLL				= 19	--	传送卷轴

ClassType.ICID_LUCKYROLL				= 20	--	替身娃娃
ClassType.ICID_DOUBLEEXP				= 21	--	双倍经验道具

ClassType.ICID_DESTROYINGESSENCE		= 22	--	正在被销毁的物品
ClassType.ICID_SKILLMATTER				= 23	--	技能物品

ClassType.ICID_VEHICLE					= 24	--	交通工具

ClassType.ICID_COUPLE_JUMPTO			= 25	--	夫妻同心结

ClassType.ICID_LOTTERY					= 26	--	彩票
ClassType.ICID_CAMRECORDER				= 27	--	录像道具
ClassType.ICID_TEXT_FIREWORK			= 28	--	文字烟花
ClassType.ICID_TALISMAN					= 29	--	法宝主件
ClassType.ICID_TALISMAN_EXPFOOD			= 30	--	法宝血炼材料

ClassType.ICID_TALISMAN_MERGEKATALYST	= 31	--	法宝熔炼剂

ClassType.ICID_TALISMAN_ENERGYFOOD		= 32	--	法宝精力增长道具
ClassType.ICID_SPAKER					= 33	--	喇叭
ClassType.ICID_LEVELUP					= 34	--	职业升级道具
ClassType.ICID_TRANSMITFLAG				= 35	--	传送旗
ClassType.ICID_MONSTERCTRL				= 36	--	怪物控制卷轴
ClassType.ICID_HARNESS					= 37	--	马具
ClassType.ICID_PET_BEDGE				= 38	--	宠物牌

ClassType.ICID_PET_SKILL				= 39	--	宠物技能书
ClassType.ICID_PET_MEDICINE				= 40	--	宠物药品
ClassType.ICID_PET_RESETPROP			= 41	--	宠物洗点符

ClassType.ICID_PET_ADDPROP				= 42	--	宠物灵丹
ClassType.ICID_PET_ADJPOWERPROP			= 43    --      宠物修为概率调整道具
ClassType.ICID_NORMAL_ITEM				= 44	--	普通物品

ClassType.ICID_TASKITEM_GENERATOR		= 45	--	任务物品生成器

ClassType.ICID_PET_NORMALMEDICINE		= 46	--	宠物通用药品
ClassType.ICID_GIFT						= 47    --	礼物物品
ClassType.ICID_SUMMON_ITEM				= 49	--	召唤怪物物品
ClassType.ICID_CROPSEED					= 50	--	种子
ClassType.ICID_BREEDCUB					= 51	--	幼崽
ClassType.ICID_INVITATION				= 52	--	请帖
ClassType.ICID_BACKPACK					= 53	--	背包
ClassType.ICID_TREASUREMAP				= 54	--	鉴定过的藏宝图

ClassType.ICID_TREASUREMAPFRAGMENT		= 55	--	藏宝图碎片（未鉴定过的藏宝图）

ClassType.ICID_SCENEONLY				= 56	--场景专用物品
ClassType.ICID_ADDON_GROUP				= 1001	--	附加属性组模板
ClassType.ICID_PRODUCE_SKILL			= 1002	--	生产技能模板

ClassType.ICID_ACHIEVEMENT				= 1003	--	成就模板
ClassType.ICID_EQUIPMENT_ADDON			= 1004	--	装备附加属性

ClassType.ICID_APLITITUDE				= 1005	--	装备精通

ClassType.ICID_PRACTISE					= 1006	--	修练模板
ClassType.ICID_NPC						= 1007	--	NPC
ClassType.ICID_MONSTER					= 1008	--	怪物
ClassType.ICID_MINE						= 1009	--	矿物
ClassType.ICID_XIULIAN					= 1010	--	修炼]]--

-- majorType: 物品所属大目录id
-- subType: 物品所属小目录id


--[[#tag push from_excel]]
-- 在特殊ID定义表里配置金钱的掉落模型
-----------------------------------------Part01_End----------------------------------------
DropCfg_List =
{
	normal =
	{
		["宝石"] = {model_id = 12488, down_sound = "SFX\\策划联入\\物品道具\\物品掉落_其他宝石.wav"}
	},

	tid =
	{
		[10342] = {model_id = 12487, down_sound = "SFX\\策划联入\\物品道具\\物品掉落_令牌.wav"},
		[18672] = {model_id = 12494, down_sound = "SFX\\策划联入\\物品道具\\物品掉落_令牌.wav"},
		[18673] = {model_id = 12501, down_sound = "SFX\\策划联入\\物品道具\\物品掉落_令牌.wav"},
		[18674] = {model_id = 6092, down_sound = "SFX\\策划联入\\物品道具\\物品掉落_令牌.wav"},
		[18675] = {model_id = 6093, down_sound = "SFX\\策划联入\\物品道具\\物品掉落_令牌.wav"},
		[18676] = {model_id = 6094, down_sound = "SFX\\策划联入\\物品道具\\物品掉落_令牌.wav"},
		[18677] = {model_id = 6095, down_sound = "SFX\\策划联入\\物品道具\\物品掉落_令牌.wav"},
		[18678] = {model_id = 6096, down_sound = "SFX\\策划联入\\物品道具\\物品掉落_令牌.wav"},
		[18679] = {model_id = 12488, down_sound = "SFX\\策划联入\\物品道具\\物品掉落_令牌.wav"},
		[18680] = {model_id = 12497, down_sound = "SFX\\策划联入\\物品道具\\物品掉落_令牌.wav"},
		[18681] = {model_id = 12718, down_sound = "SFX\\策划联入\\物品道具\\物品掉落_令牌.wav"},
		[18682] = {model_id = 12498, down_sound = "SFX\\策划联入\\物品道具\\物品掉落_令牌.wav"},
		[18683] = {model_id = 12716, down_sound = "SFX\\策划联入\\物品道具\\物品掉落_令牌.wav"},
		[18684] = {model_id = 12499, down_sound = "SFX\\策划联入\\物品道具\\物品掉落_令牌.wav"},
		[18685] = {model_id = 12715, down_sound = "SFX\\策划联入\\物品道具\\物品掉落_令牌.wav"},
		[11602] = {model_id = 16794, down_sound = "SFX\\策划联入\\物品道具\\物品掉落_令牌.wav"},
		[80068] = {model_id = 20333, down_sound = "SFX\\策划联入\\物品道具\\物品掉落_令牌.wav"},
		[80069] = {model_id = 20331, down_sound = "SFX\\策划联入\\物品道具\\物品掉落_令牌.wav"},
		[80070] = {model_id = 20332, down_sound = "SFX\\策划联入\\物品道具\\物品掉落_令牌.wav"},
		[80071] = {model_id = 20334, down_sound = "SFX\\策划联入\\物品道具\\物品掉落_令牌.wav"},
		[80072] = {model_id = 20335, down_sound = "SFX\\策划联入\\物品道具\\物品掉落_令牌.wav"},
		[79150] = {model_id = 12715, down_sound = "SFX\\策划联入\\物品道具\\物品掉落_令牌.wav"},
	},

	subType =
	{
		[206] = {model_id = 12491, down_sound = "SFX\\策划联入\\物品道具\\物品掉落_护腕.wav"},
		[207] = {model_id = 12491, down_sound = "SFX\\策划联入\\物品道具\\物品掉落_护腕.wav"},
		[208] = {model_id = 12491, down_sound = "SFX\\策划联入\\物品道具\\物品掉落_护腕.wav"},
		[212] = {model_id = 12496, down_sound = "SFX\\策划联入\\物品道具\\物品掉落_裤子.wav"},
		[213] = {model_id = 12496, down_sound = "SFX\\策划联入\\物品道具\\物品掉落_裤子.wav"},
		[214] = {model_id = 12496, down_sound = "SFX\\策划联入\\物品道具\\物品掉落_裤子.wav"},
		[215] = {model_id = 12486, down_sound = "SFX\\策划联入\\物品道具\\物品掉落_上衣.wav"},
		[216] = {model_id = 12486, down_sound = "SFX\\策划联入\\物品道具\\物品掉落_上衣.wav"},
		[217] = {model_id = 12486, down_sound = "SFX\\策划联入\\物品道具\\物品掉落_上衣.wav"},
		[4509] = {model_id = 12486, down_sound = "SFX\\策划联入\\物品道具\\物品掉落_上衣.wav"},
		[218] = {model_id = 12489, down_sound = "SFX\\策划联入\\物品道具\\物品掉落_帽子.wav"},
		[219] = {model_id = 12489, down_sound = "SFX\\策划联入\\物品道具\\物品掉落_帽子.wav"},
		[220] = {model_id = 12489, down_sound = "SFX\\策划联入\\物品道具\\物品掉落_帽子.wav"},
		[4508] = {model_id = 12489, down_sound = "SFX\\策划联入\\物品道具\\物品掉落_帽子.wav"},
		[209] = {model_id = 12500, down_sound = "SFX\\策划联入\\物品道具\\物品掉落_鞋子.wav"},
		[210] = {model_id = 12500, down_sound = "SFX\\策划联入\\物品道具\\物品掉落_鞋子.wav"},
		[211] = {model_id = 12500, down_sound = "SFX\\策划联入\\物品道具\\物品掉落_鞋子.wav"},
		[4496] = {model_id = 12490, down_sound = "SFX\\策划联入\\物品道具\\物品掉落_戒指.wav"},
		[4497] = {model_id = 12490, down_sound = "SFX\\策划联入\\物品道具\\物品掉落_戒指.wav"},
		[4498] = {model_id = 12490, down_sound = "SFX\\策划联入\\物品道具\\物品掉落_戒指.wav"},
		[4499] = {model_id = 12501, down_sound = "SFX\\策划联入\\物品道具\\物品掉落_项链.wav"},
		[4500] = {model_id = 12501, down_sound = "SFX\\策划联入\\物品道具\\物品掉落_项链.wav"},
		[4501] = {model_id = 12501, down_sound = "SFX\\策划联入\\物品道具\\物品掉落_项链.wav"},
		[4510] = {model_id = 12495, down_sound = "SFX\\策划联入\\物品道具\\物品掉落_腰饰.wav"},
		[4511] = {model_id = 12495, down_sound = "SFX\\策划联入\\物品道具\\物品掉落_腰饰.wav"},
		[4512] = {model_id = 12495, down_sound = "SFX\\策划联入\\物品道具\\物品掉落_腰饰.wav"},
		[196] = {model_id = 16777, down_sound = ""},
		[197] = {model_id = 16782, down_sound = ""},
		[198] = {model_id = 16783, down_sound = ""},
		[199] = {model_id = 16792, down_sound = ""},
		[200] = {model_id = 16798, down_sound = ""},
		[201] = {model_id = 16781, down_sound = ""},
		[202] = {model_id = 16785, down_sound = ""},
		[203] = {model_id = 16787, down_sound = ""},
		[204] = {model_id = 16788, down_sound = ""},
		[205] = {model_id = 16784, down_sound = ""},
		[26868] = {model_id = 16786, down_sound = ""},
		[26869] = {model_id = 16794, down_sound = ""},
		[5485] = {model_id = 16791, down_sound = ""},
		[5496] = {model_id = 16797, down_sound = ""},
		[63306] = {model_id = 16790, down_sound = ""},
		[63740] = {model_id = 16793, down_sound = ""},
		[67095] = {model_id = 16793, down_sound = ""},
		[43784] = {model_id = 16786, down_sound = ""},
	},
	cid =
	{
		[4] = {model_id = 16780, down_sound = "SFX\\策划联入\\物品道具\\物品掉落_书.wav"},
		[5] = {model_id = 16778, down_sound = "SFX\\策划联入\\物品道具\\物品掉落_书.wav"},
		[6] = {model_id = 16780, down_sound = "SFX\\策划联入\\物品道具\\物品掉落_书.wav"},
		[15] = {model_id = 16778, down_sound = "SFX\\策划联入\\物品道具\\物品掉落_书.wav"},
		[18] = {model_id = 16778, down_sound = "SFX\\策划联入\\物品道具\\物品掉落_书.wav"},
		[19] = {model_id = 16780, down_sound = "SFX\\策划联入\\物品道具\\物品掉落_书.wav"},
		[36] = {model_id = 16780, down_sound = "SFX\\策划联入\\物品道具\\物品掉落_书.wav"},
		[39] = {model_id = 16778, down_sound = "SFX\\策划联入\\物品道具\\物品掉落_书.wav"},
		[54] = {model_id = 16779, down_sound = "SFX\\策划联入\\物品道具\\物品掉落_书.wav"},
		[55] = {model_id = 16779, down_sound = "SFX\\策划联入\\物品道具\\物品掉落_书.wav"},
		[8] = {model_id = 12493, down_sound = "SFX\\策划联入\\物品道具\\物品掉落_红宝石.wav"},
		[35] = {model_id = 16796, down_sound = ""},
		[38] = {model_id = 16776, down_sound = ""},
		[40] = {model_id = 16793, down_sound = ""},
	},
}

UseItemSound_List =
{
	tid =
	{
	[79150] = {sound = "", msg = "^ff0000你的星盘受到转运珠的影响，福缘值发生了惊人的变化……"}
	},

	subType =
	{
	[79843] = {sound = "SFX\\策划联入\\ui\\暗器匣机括零件1.wav", msg = ""},
	},

	cid =
	{
	},

}
--[[#tag pop]]

-----------------------------------------Part02_End----------------------------------------
--程序调用此接口返回对应的现实模型和音效
function DropCfg:GetItemDropModel(tid, cid, majorType, subType)
	local model_id = 0
	local down_sound = --[[!AUTO_1]]""
	if DropCfg:GetTidItem(tid) then
		model_id,down_sound = DropCfg:GetTidItem(tid)
		return model_id,down_sound
	elseif DropCfg:GetSubTypeItem(subType) then
		model_id,down_sound = DropCfg:GetSubTypeItem(subType)
		return model_id,down_sound
	elseif DropCfg:GetCidItem(cid) then
		model_id,down_sound = DropCfg:GetCidItem(cid)
		return model_id,down_sound
	else DropCfg:GetNormalItem(--[[!AUTO_2]]"宝石")
		model_id,down_sound = DropCfg:GetNormalItem(--[[!AUTO_3]]"宝石")
		return model_id,down_sound
	end
	return model_id,down_sound
end

--在tid配置表中查找匹配
function DropCfg:GetTidItem(tid)
	if UseItemSound_List.tid[tid] then
		return DropCfg_List.tid[tid].model_id, DropCfg_List.tid[tid].down_sound
	end
	return nil
end

--在subType配置表中查找匹配
function DropCfg:GetSubTypeItem(subType)
	if DropCfg_List.subType[subType] then
		return DropCfg_List.subType[subType].model_id, DropCfg_List.subType[subType].down_sound
	end
	return nil
end

--在subType配置表中查找匹配
function DropCfg:GetCidItem(cid)
	if DropCfg_List.cid[cid] then
		return DropCfg_List.cid[cid].model_id, DropCfg_List.cid[cid].down_sound
	end
	return nil
end

--在通用配置表中查找匹配
function DropCfg:GetNormalItem(normalType)
	if DropCfg_List.normal[normalType] then
		return DropCfg_List.normal[normalType].model_id, DropCfg_List.normal[normalType].down_sound
	end
end

function DropCfg:OnUseItemPlaySound(tid, cid, majorType, subType)
	local playsound = --[[!AUTO_4]]""
	local hintMsg = --[[!AUTO_5]]""
	if DropCfg:GetTidUseItemSound(tid) then
		playsound = DropCfg:GetTidUseItemSound(tid).sound
		hintMsg = DropCfg:GetTidUseItemSound(tid).msg
		GameApi.Play2DSound(GameApi.Utf8ToMBCS(playsound))
		GameApi.AddSystemHint(hintMsg)
		return true
	elseif DropCfg:GetUseSubTypeItemSound(subType) then
		playsound = DropCfg:GetUseSubTypeItemSound(subType).sound
		hintMsg = DropCfg:GetUseSubTypeItemSound(subType).msg
		GameApi.Play2DSound(GameApi.Utf8ToMBCS(playsound))
		GameApi.AddSystemHint(hintMsg)
		return true
	elseif DropCfg:GetUseCidItemSound(cid) then
		playsound = DropCfg:GetUseCidItemSound(cid).sound
		hintMsg = DropCfg:GetUseCidItemSound(cid).msg
		GameApi.Play2DSound(GameApi.Utf8ToMBCS(playsound))
		GameApi.AddSystemHint(hintMsg)
		return true
	end
	return false
end

--在tid配置表中查找匹配
function DropCfg:GetTidUseItemSound(tid)
	if UseItemSound_List.tid[tid] then
		return UseItemSound_List.tid[tid]
	end
	return nil
end

--在subType配置表中查找匹配
function DropCfg:GetUseSubTypeItemSound(subType)
	if UseItemSound_List.subType[subType] then
		return 	UseItemSound_List.subType[subType]
	end
	return nil
end

--在subType配置表中查找匹配
function DropCfg:GetUseCidItemSound(cid)
	if UseItemSound_List.cid[cid] then
		return UseItemSound_List.cid[cid]
	end
	return nil
end
-----------------------------------------Part03_End----------------------------------------
