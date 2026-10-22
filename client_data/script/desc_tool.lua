--[[#tag push auto]]
--所有标签的描述文字组合...
DescTool = {}

--关键字列表


--[[
	_AL("title"),		//	HINTAREA_TITLE,（标题）
	_AL("icon"),		//	HINTAREA_ICON,（图标）
	_AL("info1"),		//	HINTAREA_INFO1,（信息1，左）


	_AL("info2"),		//	HINTAREA_INFO2,（信息2，右上）
	_AL("info3"),		//	HINTAREA_INFO3,（信息3，右下）
	_AL("star"),		//	HINTAREA_STAR,（星级，用于强化）


	_AL("limitleft"),	//	HINTAREA_LIMITLEFT,（左侧限制）
	_AL("limitright"),	//	HINTAREA_LIMITRIGHT,（右铡限制）
	_AL("limitskill"),	//	HINTAREA_LIMITSKILL,（限制技能？）


	_AL("strengthen"),	//	HINTAREA_STRENGTHEN,（强化等级）
	_AL("diamonds"),	//	HINTAREA_DIAMONDS,（宝石）
	_AL("desc"),		//	HINTAREA_DESC,（描述）
	_AL("remark"),		//	HINTAREA_REMARK,（附加属性）
	_AL("lab_money"),	//	HINTAREA_LABMONEY,（钱的类型）
	_AL("money1"),		//	HINTAREA_MONEY1,（钱单位1）


	_AL("money2"),		//	HINTAREA_MONEY2,（钱单位2）


	_AL("money3"),		//	HINTAREA_MONEY3,（钱单位3）


	_AL("money4"),		//	HINTAREA_MONEY4,（钱单位4）


	_AL("lab_fame"),	//	HINTAREA_LABFAME,（声望名称）
	_AL("fame"),		//	HINTAREA_FAME,（声望数量）
	_AL("lab_exchange"),	//	HINTAREA_LABEXCHANGE,（道具兑换名称）
	_AL("exchange"),	//	HINTAREA_EXCHANGE,（道具兑换道具名）


	_AL("exchangepic"),	//	HINTAREA_EXCHANGEPIC,（道具兑换道具图标）
	_AL("lab_cash"),	//	HINTAREA_LABCASH,（元宝名称）
	_AL("cash1"),		//	HINTAREA_CASH1,（元宝单位1）


	_AL("cash2"),		//	HINTAREA_CASH2,（元宝单位2）


]]--

function DescTool:GetAnimaEquipDesc(tid,cid,context_type,price_scale,ext_tbl)

	tbl = {}
	t_equip = DescUtility:CopyTable(ext_tbl["EquipEssAddon"])
	e_Stone = DescUtility:CopyTable(ext_tbl["Stone"])

	--描述面板表头
	tbl["title"] = DescUtility:GetEquipName(tid, cid, t_equip["ext_group_type"], t_equip["ext_group_id"])
	if ext_tbl["EquipReinforceLevel"] > 0 then
		tbl["title"] = tbl["title"] .. string.format("+%s",ext_tbl["EquipReinforceLevel"])
	end
	if ext_tbl["EquipPropLevel"] > 0 then
		tbl["title"] = tbl["title"] .. string.format("(%s)",ext_tbl["EquipPropLevel"])
	end
	
	--描述面板图标
	tbl["icon"] = DescUtility:GetItemIcon(tid, cid)

	--装备描述
	tbl["info1"] = string.format(--[[!AUTO_13]]"%s%s%s\r%s",DescUtility:GetItemLevelLimit(tid, cid),DescUtility:GetItemEndurLimit(tid, cid, ext_tbl), DescUtility:GetEquipmentAnimaLevel(tid, cid, ext_tbl), DescUtility:GetEquipmentAnimaMax(tid, cid, ext_tbl))

	--装备星级
	tbl["star"] = string.format(--[[!AUTO_31]]"%s_0_1", ext_tbl["EquipCurReinforceAddonPropertyCount"]+1)

	--装备基础属性
	local base_prop = DescUtility:GetAnimaEquipBaseProp(tid, cid, ext_tbl)
	tbl["limitskill"] = string.format(ITEM_LIMIT_DESC[13],base_prop)

	--装备镶嵌宝石
	tbl["diamonds"] = DescUtility:GetESTONEDesc(tbl,tid,cid,ext_tbl)

	--附加属性和注入属性
	local base_ess, zhulingtext = DescUtility:GetAnimaEquipAddonPropDesc(tid, cid, ext_tbl)
	local inject_ess = DescUtility:GetEquipInjectEssDesc(ext_tbl["Inject_AddonTid"], ext_tbl["Inject_AddonRand"], ext_tbl["Inject_AddonExpire"]) or ""

	if base_ess ~= --[[!AUTO_38]]"" and base_ess ~= nil then
		tbl["strengthen"] = string.format(ITEM_LIMIT_DESC[14],base_ess)
	end

	if inject_ess ~= --[[!AUTO_39]]"" and inject_ess ~= nil then
		tbl["strengthen"] = string.format(--[[!AUTO_40]]"%s\r%s",tbl["strengthen"],inject_ess)
	end
	
	tbl["zhuling"] = zhulingtext

	--装备强化激活属性
	local reinforceProp = DescUtility:GetAnimaEquipReinforcePropDesc(tid, cid, ext_tbl)
	tbl["reinforce"] = reinforceProp

	--装备固定属性
	local fixProp = DescUtility:GetAnimaEquipFixPropDesc(tid, cid, ext_tbl)
	tbl["fixproperty"] = fixProp

	--附魔
	local fomoProp = DescUtility:GetAnimaEquipFomoPropDesc(tid, cid, ext_tbl)
	tbl["fumo"] = fomoProp

	--附加描述
	tbl["remark"] = ""
	if DescUtility:GetItemExtDesc(tid, cid, ext_tbl) ~= --[[!AUTO_61]]"" then
		if tbl["remark"] ~= --[[!AUTO_62]]"" then
			tbl["remark"] =tbl["remark"] .. --[[!AUTO_63]]"\r" .. DescUtility:GetItemExtDesc(tid, cid, ext_tbl)
		else
			tbl["remark"] = DescUtility:GetItemExtDesc(tid, cid, ext_tbl)
		end
	end
		
	if ext_tbl["ExchangeAppearanceID"] ~= nil and ext_tbl["ExchangeAppearanceID"] ~= 0 then
		tbl["remark"] = tbl["remark"] .. "\r" .. EQUIP_CHANGE_APPEARANCE .. "\r" .. string.format(--[[!AUTO_1]]"%s+%s",DescUtility:GetItemName(ext_tbl["ExchangeAppearanceID"], cid),ext_tbl["ExchangeAppearanceUpLv"]).."\r"
	end
	
	tbl["lab_money"], tbl["money1"], tbl["money2"], tbl["money3"], tbl["money4"], tbl["lab_fame"], tbl["fame"], tbl["lab_exchange"], tbl["exchange"], tbl["exchangepic"],tbl["npc_buy_bind"] = DescUtility:GetItemPrice(tid, cid, context_type, price_scale, ext_tbl)

	return tbl
end

-- 组合武器描述函数
function DescTool:GetEquipDesc(tid,cid,context_type,price_scale,ext_tbl)

	tbl = {}
	--预处理 	local t_equip
	t_equip = DescUtility:CopyTable(ext_tbl["EquipEssAddon"])
	q_equip = DescUtility:CopyTable(ext_tbl["EquipReinforceAddon"])
	g_equip = DescUtility:CopyTable(ext_tbl["EquipKaiguangAddon"])
	e_Stone = DescUtility:CopyTable(ext_tbl["Stone"])

	--描述面板表头
	--LogPrint(string.format("附加属性组id：%d", t_equip["ext_group_id"]))
	if ext_tbl["EquipLevel"] and ext_tbl["EquipLevel"] > 0 then
		tbl["title"] = string.format(--[[!AUTO_1]]"%s+%s",DescUtility:GetItemName(tid, cid),ext_tbl["EquipLevel"])
	else
		tbl["title"] = DescUtility:GetEquipName(tid, cid, t_equip["ext_group_type"], t_equip["ext_group_id"])
	end
	--描述面板图标
	tbl["icon"] = DescUtility:GetItemIcon(tid, cid)

	--描述面板表头
	--1最多3行，2最多1行，3最多2行（用\r分割）

	local _,equip_class = DescUtility:GetItemDBProp(tid,cid,--[[!]]"装备类别")
	local equip_type = string.format(ITEM_LIMIT_DESC[12],DescUtility:GetItemMajorType(tid, cid))
	local _,equip_loca = DescUtility:GetItemDBProp(tid,cid,--[[!]]"逻辑上可以装备的部位")
	local _,equip_quality = DescUtility:GetItemDBProp(tid,cid,--[[!]]"品质")
	local sub_type_text = DescUtility:GetItemSubType(tid, cid)

	if equip_class == 0  and EQUIP_WEAPON_CLASS_DESC[sub_type_text] then
		sub_type_text = EQUIP_WEAPON_CLASS_DESC[sub_type_text]
		tbl["info1"] = string.format(--[[!AUTO_2]]"%s%s%s\r%s%s",DescUtility:GetItemProfLimit(tid, cid),sub_type_text,DescUtility:GetItemSexLimit(tid, cid),DescUtility:GetItemLevelLimit(tid, cid),DescUtility:GetItemEndurLimit(tid, cid, ext_tbl))
	elseif equip_class == 1 then
		local loca_type_text = --[[!AUTO_3]]"未知"
		local i,j

		i,j = string.find(sub_type_text,--[[!AUTO_4]]"布衣")
		if i and i > 0 then
			sub_type_text = string.format(ITEM_LIMIT_DESC[12],EQUIP_WEAPON_CLASS_DESC[1])
		end
		i,j = string.find(sub_type_text,--[[!AUTO_5]]"棉甲")
		if i and i > 0 then
			sub_type_text = string.format(ITEM_LIMIT_DESC[12],EQUIP_WEAPON_CLASS_DESC[2])
		end
		i,j = string.find(sub_type_text,--[[!AUTO_6]]"皮甲")
		if i and i > 0 then
			sub_type_text = string.format(ITEM_LIMIT_DESC[12],EQUIP_WEAPON_CLASS_DESC[3])
		end
		i,j = string.find(sub_type_text,--[[!AUTO_7]]"新手")
		if i and i > 0 then
			sub_type_text = string.format(ITEM_LIMIT_DESC[12],EQUIP_WEAPON_CLASS_DESC[4])
		end
		sub_type_text = string.format(ITEM_LIMIT_DESC[12],EQUIP_WEAPON_CLASS_DESC[4])

		if bit.band(equip_loca,4) > 0 then
			loca_type_text = --[[!AUTO_8]]"上裝"
		elseif bit.band(equip_loca,8) > 0 then
			loca_type_text = --[[!AUTO_9]]"下裝"
		elseif bit.band(equip_loca,2) > 0 then
			loca_type_text = --[[!AUTO_10]]"頭部"
		elseif bit.band(equip_loca,32) > 0 then
			loca_type_text = --[[!AUTO_11]]"護腕"
		elseif bit.band(equip_loca,16) > 0 then
			loca_type_text = --[[!AUTO_12]]"鞋"
		end
		
		tbl["info1"] = string.format(--[[!AUTO_13]]"%s\r%s%s%s\r%s%s",DescUtility:GetItemProfLimit(tid, cid),sub_type_text,loca_type_text,DescUtility:GetItemSexLimit(tid, cid),DescUtility:GetItemLevelLimit(tid, cid),DescUtility:GetItemEndurLimit(tid, cid, ext_tbl))
	elseif equip_class == 2  or equip_class == 5 or equip_class == 6 or (equip_class == 4 and tid == 75061) then

		--LogPrint("BBBBBBBBBB")
		local loca_type_text = --[[!AUTO_14]]"未知"
		if bit.band(equip_loca,512) > 0 then
			loca_type_text = --[[!AUTO_15]]"头部"
		elseif bit.band(equip_loca,1024) > 0 then
			loca_type_text = --[[!AUTO_16]]"上衣"
		elseif bit.band(equip_loca,16384) > 0 then
			loca_type_text = --[[!AUTO_17]]"披风"
		elseif bit.band(equip_loca,2048) > 0 then
			loca_type_text = "配饰"
		elseif bit.band(equip_loca,33554432) > 0 then
			loca_type_text =  "发饰"
		end
		tbl["info1"] = string.format(--[[!AUTO_18]]"%s%s%s\r%s%s",--[[!AUTO_19]]"類型：時裝",loca_type_text,DescUtility:GetItemSexLimit(tid, cid),DescUtility:GetItemLevelLimit(tid, cid),DescUtility:GetItemProfLimit(tid, cid))
	elseif equip_class == 4 then --如果裝備類型是:4 (掛件類型)，則進一步探索子項目。
		local loca_type_text = --[[!AUTO_20]]"未知"
		if bit.band(equip_loca,128) > 0 or bit.band(equip_loca,256) > 0 then --如果裝備掩碼是128、256，則進一步判斷是否類型是升級類戒指(EL子分類)。
			if DescUtility:GetItemSubType(tid, cid) == "升级类戒指" then
				loca_type_text = string.format(ITEM_LIMIT_DESC[12],--[[!AUTO_21]]"^FF8000傳奇戒指") --顯示在裝備上的分類。
			else
				loca_type_text = string.format(ITEM_LIMIT_DESC[12],--[[!AUTO_21]]"戒指")
			end
		elseif bit.band(equip_loca,64) > 0 then
			loca_type_text = string.format(ITEM_LIMIT_DESC[12],--[[!AUTO_22]]"項鍊")
		elseif bit.band(equip_loca,4096) > 0 then
			loca_type_text = string.format(ITEM_LIMIT_DESC[12],--[[!AUTO_23]]"腰飾")
		elseif bit.band(equip_loca,8192) > 0 then
			loca_type_text = string.format(ITEM_LIMIT_DESC[12],--[[!AUTO_24]]"寶物")
			
			
	------------------------銘牌描述開頭--------------------------------------------------------------------
	--銘牌配置(若子分類為指定數值，則顯示自訂描述，否則就顯示固定類行為銘牌。
	--掩碼固定為32768，也就是副手類型。
	--使用GetItemSubType函數，來檢查該裝備的子分類是否為"天下令"
	--要注意檢查的字串要跟EL一樣，繁體簡體有差別。
	
		elseif bit.band(equip_loca,32768) > 0 then 
		    if DescUtility:GetItemSubType(tid, cid) == "天下令0" then 			                                          
			loca_type_text = string.format(ITEM_LIMIT_DESC[12],"^FF8000★★★★★")
			else
			loca_type_text = string.format(ITEM_LIMIT_DESC[12],--[[!AUTO_25]]"銘牌")
			end
			
	------------------------銘牌描述結尾--------------------------------------------------------------------	
	
	
		elseif bit.band(equip_loca,2048) > 0 then
			loca_type_text = --[[!AUTO_26]]"類型：時裝配飾"
		end
		tbl["info1"] = string.format(--[[!AUTO_27]]"%s\r%s%s\r%s%s",DescUtility:GetItemProfLimit(tid, cid),loca_type_text,DescUtility:GetItemSexLimit(tid, cid),DescUtility:GetItemLevelLimit(tid, cid),DescUtility:GetItemEndurLimit(tid, cid, ext_tbl))
	elseif equip_class == 7 then
		if DescUtility:GetItemSubType(tid, cid) == "升级类护符" then
			equip_type = string.format(ITEM_LIMIT_DESC[12],"^FF8000傳奇護符")
		else
			equip_type = string.format(ITEM_LIMIT_DESC[12],DescUtility:GetItemSubType(tid, cid))
		end
		tbl["info1"] = string.format(--[[!AUTO_28]]"%s\r%s\r%s%s",DescUtility:GetItemProfLimit(tid, cid),equip_type,DescUtility:GetItemLevelLimit(tid, cid),DescUtility:GetItemEndurLimit(tid, cid, ext_tbl))
	else
		tbl["info1"] = string.format(--[[!AUTO_28]]"%s\r%s\r%s%s",DescUtility:GetItemProfLimit(tid, cid),DescUtility:GetItemSexLimit(tid, cid),DescUtility:GetItemLevelLimit(tid, cid),DescUtility:GetItemEndurLimit(tid, cid, ext_tbl))
	end
	   
	--描述面板星级
	--s_t，s代表星数，-1不显示。t代表显示方案，0为正常，1为同步闪烁，2为待定
    
	if equip_quality and equip_quality > 0 then
		if equip_class == 4 and (bit.band(equip_loca,32768) > 0 or bit.band(equip_loca,8192) > 0) then
			tbl["star"] = --[[!AUTO_29]]"-1_0"
		elseif equip_class == 2 or equip_class == 5 or equip_class == 6 or equip_loca == 2048 or equip_loca == 512 or equip_loca == 1024 then
			tbl["star"] = --[[!AUTO_30]]"-1_0"
		else
			tbl["star"] = string.format(--[[!AUTO_31]]"%s_0",equip_quality)
		end
	else
		tbl["star"] = --[[!AUTO_32]]"_0"
	end

	if Produce:IsSeecondPhaseDiamondHolyEquip(tid) then  
    tbl["star"] = tbl["star"] .. "_7"  -- 新星等為_7-紅鑽
	elseif Produce:IsSecondPhaseDiamondHolyEquip(tid) then
	tbl["star"] = tbl["star"] .. "_6"  -- 新星等為_6-紫鑽
	elseif Produce:IsSe2condPhaseDiamondHolyEquip(tid) then
    tbl["star"] = tbl["star"] .. "_8"  --四聖獸星等
	elseif Produce:IsDiamondHolyEquip(tid) then
    tbl["star"] = tbl["star"] .. "_5"  --星等5-藍鑽
    t_equip["ext_group_generate_type"] = 0
else
		if ext_tbl["EquipType"] == -1 then
			tbl["star"] = tbl["star"] .. "_1"
		elseif ext_tbl["EquipType"] == 0 then
			tbl["star"] = tbl["star"] .. "_3"
		elseif ext_tbl["EquipType"] == 1 then
			tbl["star"] = tbl["star"] .. "_2"
		elseif ext_tbl["EquipType"] == 2 then
			tbl["star"] = tbl["star"] .. "_4"
		end
	end

	local damage_type = DescUtility:GetKaiguangDamageType(tid, cid, ext_tbl)
	tbl["kaiguang"] = ItemTip.Desc[--[[!]]"开光属性"][damage_type].filepath
	--描述面板限制（左）与消耗（右）
	--用\r分割
	--tbl["limitleft"] = string.format(ITEM_LIMIT_DESC[1], DescUtility:GetItemLevelLimit(tid, cid), DescUtility:GetItemProfLimit(tid, cid))
	--tbl["limitright"] = string.format(ITEM_LIMIT_DESC[2], DescUtility:GetItemSexLimit(tid, cid), DescUtility:GetItemEndurLimit(tid, cid, ext_tbl))

 	--描述面板描述信息
	--用\r分割
	local base_prop = DescUtility:GetEquipBaseProp(tid, cid, ext_tbl)
	if FASHIONEQUIP_SUBTYPE[sub_type_text] then
		tbl["limitskill"] = DescUtility:GetFashionEquipProp(tid, cid, ext_tbl)
	else
		if base_prop ~= --[[!AUTO_33]]"" and base_prop ~= nil then
			if (equip_class == 4 and bit.band(equip_loca,8192) > 0) or equip_class == 2 then
				tbl["limitskill"] = --[[!AUTO_34]]""
			else
				tbl["limitskill"] = string.format(ITEM_LIMIT_DESC[13],base_prop)
			end
		else
			tbl["limitskill"] = --[[!AUTO_35]]""
		end
	end
	--"^FFE673内功攻击^FFFFFF：200\r^FFE673外攻攻击^FFFFFF：200"

	--描述开光强化面板信息


	tbl["strengthen1"] = DescUtility:GetEquipReinforceEssDesc(tid,cid,q_equip,ext_tbl)
	tbl["strengthen2"] = DescUtility:GetEquipReinforceEssDesc1(q_equip)
	--tbl["desc"] = tbl["strengthen1"] .. tbl["strengthen2"]
	--if tbl["strengthen3"] ~= "" then
	--	tbl["desc"] = string.format("%s\r\r%s%s",tbl["desc"],tbl["strengthen3"],tbl["strengthen4"])
	--end

	--local remark = DescUtility:GetItemBindState(tid, cid, ext_tbl["Bind"])
	local grade
	tbl["strengthen3"],grade = DescUtility:GetEquipKaiguangGrade(ext_tbl,tbl)
	tbl["strengthen4"] = DescUtility:GetEquipKaiguangGrade1(g_equip)
	--LogPrint(grade)
	--LogPrint(tbl["strengthen3"])
	--LogPrint(remark)
	if tbl["strengthen3"] ~= --[[!AUTO_36]]"" and grade == 4 then
		--tbl["remark"] = string.format("%s%s",tbl["strengthen3"],tbl["strengthen4"])
	--LogPrint(tbl["remark"])
	elseif grade == 2 or grade == 3 then
		tbl["info3"] = string.format(--[[!AUTO_37]]"\r\r%s",tbl["strengthen3"])
	end
	--tbl["desc"] = tbl["strengthen1"] .. tbl["strengthen2"] .. tbl["strengthen3"] .. tbl["strengthen4"]
	--描述宝石镶嵌信息

	--最多5组。有几个孔上限显示几组。每组格式


	--A_B_C
	--A表示该装备该孔的状态。


	--   -1表示能打但没打的孔


	--1，2，3分别表示圆，菱，不规则孔
	--B表示该孔的镶嵌状态。


	--   -1（改成具体字符串了）表示没镶嵌


	--0（改成具体字符串了）表示镶嵌了一个没填图标的宝石
	--其他字符串则为物品图标名
	--C则是宝石的属性要显示的文字

	--string.format("%d_%d_%s\r%d_%d_%s\r%d_%d_%s\r%d_%d_%s\r%d_%d_%s",3,9589,"红珊瑚1级：生命上限+100",2,9577,"绿松石1级：外攻防御+10",1,9571,"蓝珍珠1级：外攻攻击+10",1,-1,"未镶嵌",0,-1,"未知孔，需先打孔")
	tbl["diamonds"] = DescUtility:GetESTONEDesc(tbl,tid,cid,ext_tbl)

	--描述面板属性信息

	--用\r分割
	local base_ess = DescUtility:GetEquipBaseEssDesc(t_equip) or ""
	local skill_ess = DescUtility:GetEquipSKILLBaseEssDesc(t_equip) or ""
	do	-- skill_ess 附加上注入的属性
		local inject_ess = DescUtility:GetEquipInjectEssDesc(ext_tbl["Inject_AddonTid"], ext_tbl["Inject_AddonRand"], ext_tbl["Inject_AddonExpire"]) or ""
		if inject_ess ~= "" then
			skill_ess = ("%s\r%s"):format(skill_ess, inject_ess)
		end
	end
--	LogPrint("——————————————————————————————————")
--	LogPrint(tid)
--	LogPrint(string.gsub(base_ess,"\r",""))
--	LogPrint(string.gsub(skill_ess,"\r"," "))
--	LogPrint("==================================")
	if base_ess ~= --[[!AUTO_38]]"" and base_ess ~= nil then
		if equip_class ~= 5 then
			tbl["strengthen"] = string.format(ITEM_LIMIT_DESC[14],base_ess)
		else
			tbl["strengthen"] = base_ess
		end
		if skill_ess ~= --[[!AUTO_39]]"" and skill_ess ~= nil then
			tbl["strengthen"] = string.format(--[[!AUTO_40]]"%s\r%s",tbl["strengthen"],skill_ess)
		end
	elseif skill_ess ~= --[[!AUTO_41]]"" and skill_ess ~= nil then
		tbl["strengthen"] = skill_ess
	else
		tbl["strengthen"] = --[[!AUTO_42]]""
	end

	if tbl["strengthen3"] ~= --[[!AUTO_43]]"" and tbl["strengthen4"] ~= --[[!AUTO_44]]"" and grade == 4 then
		tbl["strengthen"] = string.format(--[[!AUTO_45]]"%s\r \r%s%s",tbl["strengthen"],tbl["strengthen3"],tbl["strengthen4"])
	end

	if tbl["strengthen1"] ~= --[[!AUTO_46]]"" and tbl["strengthen2"] ~= --[[!AUTO_47]]"" then
		tbl["strengthen"] = string.format(--[[!AUTO_48]]"%s\r \r%s%s",tbl["strengthen"],tbl["strengthen1"],tbl["strengthen2"])
	end

	--符文之语
	local RuneWordAddon = ext_tbl["EquipRuneWordAddon"]
	local rune_id = ext_tbl["RuneWordId"]
	local addon_type
	local addon_rand
	local addon_param1
	local addon_param2
	local addon_value

	if RuneWordAddon["ext_prop_count"] and RuneWordAddon["ext_prop_count"] > 0 and RuneWordAddon["ext_group_type"] ==  2 then--
		local _, rune_name = DescUtility:GetItemDBProp(rune_id,ClassType.ICID_RUNEWORD,--[[!]]"显示名称")
		tbl["strengthen"] = tbl["strengthen"] .. --[[!AUTO_49]]"\r" .. ITEM_ESTONE_RUNEWORD_TEXT .. rune_name
		for i = 1, RuneWordAddon["ext_prop_count"] do
			addon_type = RuneWordAddon[string.format(--[[!AUTO_50]]"ext_prop_%d_type",i)]
			addon_rand = RuneWordAddon[string.format(--[[!AUTO_51]]"ext_prop_%d_rand",i)]
			addon_param1 = RuneWordAddon[string.format(--[[!AUTO_52]]"ext_prop_%d_param1",i)]
			addon_param2 = RuneWordAddon[string.format(--[[!AUTO_53]]"ext_prop_%d_param2",i)]
			addon_value = DescUtility:GetEquipRandValue(addon_rand, addon_param1, addon_param2)
			if EQUIP_ESSENCE_TYPE[addon_type] then
				tbl["strengthen"] = tbl["strengthen"] .. --[[!AUTO_54]]"\r" .. string.format(EQUIP_ESSENCE_TYPE[addon_type].style,addon_value)
			end
		end
	end
	--tbl["desc2"] = DescUtility:GetEquipBaseEssDesc(g_equip)

	--装备升级描述
	local _, equip_up_templ= DescUtility:GetItemDBProp(tid, cid, --[[!]]"装备升级对应模板ID")
	local equip_up_max
	if equip_up_templ > 0 then
		_, equip_up_max = DescUtility:GetItemDBProp(equip_up_templ, ClassType.ICID_EQUIP_LEVELUP, --[[!]]"装备等级上限")
		if ext_tbl["EquipType"] == 0 or ext_tbl["EquipType"] == 1 or ext_tbl["EquipType"] == 2 then
			equip_up_max = equip_up_max - 10
		end
	else
		equip_up_max = 0
	end

	local _,holyweapon_config = DescUtility:GetItemDBProp(tid,cid,--[[!]]"神器配置模板")
	--LogPrint("HolyEnforce" .. ext_tbl["HolyEnforce"])
	local holyweapon_up_max_lv = 0
	if ext_tbl["HolyEnforce"] and  ext_tbl["HolyEnforce"] > 0 then
		if holyweapon_config > 0 then
			LogPrint("holyweapon_config:" .. holyweapon_config)
			for i = 1,ext_tbl["HolyEnforce"] do

				local _,holyweapon_up = DescUtility:GetItemDBProp(holyweapon_config,ClassType.ECID_HOLY_EQUIP_CONFIG,string.format(--[[!]]"炼化%d级提升强化等级上限数",i))
				LogPrint(string.format(--[[!]]"炼化%d级提升强化等级上限数",i))
				LogPrint("holyweapon_up:" .. holyweapon_up)
				equip_up_max = equip_up_max + holyweapon_up
				holyweapon_up_max_lv = holyweapon_up_max_lv + holyweapon_up
			end
		end
	end

	local equip_up_lv = ext_tbl["EquipLevel"]
	local equip_up_exp = ext_tbl["EquipExp"]
	local UpgradeAddon = ext_tbl["EquipUpgradeAddon"]
	local up_addon_type
	local up_addon_rand
	local up_addon_param1
	local up_addon_param2
	local up_addon_param3
	local up_addon_value
	tbl["remark"] = --[[!AUTO_55]]""
	--[[
	if equip_up_lv == 0 and equip_up_exp > 0 then
		tbl["remark"] = EQUIP_UPGRADE_NAME .. "\r等级" .. equip_up_lv .. "级\r" .. EQUIP_UPGRADE_LEVEL_TEXT[1] .. "+0"
	elseif equip_up_lv > 0 and equip_up_lv <= 20 then
		tbl["remark"] = EQUIP_UPGRADE_NAME .. "\r等级" .. equip_up_lv .. "级\r" .. EQUIP_UPGRADE_LEVEL_TEXT[math.floor(equip_up_lv/5)+1] .. "+" .. equip_up_lv%5
	end

	if tbl["remark"] ~= nil and tbl["remark"] ~= "" then
		if equip_up_lv == 20 then
			tbl["remark"] = tbl["remark"] .. "\r^ffffff" .. EQUIP_UPGRADE_LEVEL_MAX
		else
			local total_exp = 0
			local level_exp = 0
			for i = 1 ,equip_up_lv+1 do
				_, level_exp = DescUtility:GetItemDBProp(equip_up_templ, ClassType.ICID_EQUIP_LEVELUP, string.format("装备升到等级%d需要的经验",i))
				total_exp = total_exp + level_exp
			end
			tbl["remark"] = tbl["remark"] .. "\r^ffffff" .. string.format(ITEM_LIMIT_DESC[32],equip_up_exp,total_exp)
		end
	end
	]]

	if equip_up_lv == 0 and equip_up_exp > 0 then
		tbl["remark"] = TAG_COLOR_ESSENCE[12] .. EQUIP_UPGRADE_NAME ..  --[[!AUTO_56]]"+0"
	elseif equip_up_lv > 0 then
		tbl["remark"] = TAG_COLOR_ESSENCE[12] .. EQUIP_UPGRADE_NAME ..  --[[!AUTO_57]]"+" .. equip_up_lv
	end

	local holyweapon_up_max = 0
	if holyweapon_config  and holyweapon_config > 0 then
		_,holyweapon_up_max = DescUtility:GetItemDBProp(holyweapon_config,ClassType.ECID_HOLY_EQUIP_CONFIG,--[[!]]"炼化最大次数")
	end
	
	local holyEnforce_max_exp = 0
	if holyweapon_config > 0 then
		_,holyEnforce_max_exp = DescUtility:GetItemDBProp(holyweapon_config,ClassType.ECID_HOLY_EQUIP_CONFIG,"炼化经验上限")
	end
	if tbl["remark"] ~= nil and tbl["remark"] ~= --[[!AUTO_58]]"" then
		if equip_up_lv >= equip_up_max then
			tbl["remark"] = tbl["remark"] .. --[[!AUTO_59]]" " .. EQUIP_UPGRADE_LEVEL_MAX
		else
			local total_exp = 0
			local level_exp = 0
			for i = 1 ,equip_up_lv+1 do
				_, level_exp = DescUtility:GetItemDBProp(equip_up_templ, ClassType.ICID_EQUIP_LEVELUP, string.format(--[[!]]"装备升到等级%d需要的经验",i))
				total_exp = total_exp + level_exp
			end
			tbl["remark"] = tbl["remark"] .. --[[!AUTO_60]]"\r^ffffff" .. string.format(ITEM_LIMIT_DESC[32],equip_up_exp,total_exp)
		end
		if ext_tbl["HolyEnforce"] and ext_tbl["HolyEnforce"] > 0 then
			tbl["remark"] = tbl["remark"] .. "\r^ff6c0a" .. string.format(EQUIP_LIANHUAGRADE_NAME,ext_tbl["HolyEnforce"])
			if holyweapon_up_max == ext_tbl["HolyEnforce"] and holyweapon_up_max > 0 then
				tbl["remark"] = tbl["remark"] .. EQUIP_UPGRADE_LEVEL_MAX
			end
			tbl["remark"] = tbl["remark"] .. string.format(EQUIP_UPGRADE_LIMIT,equip_up_max)
		end
		if ext_tbl["HolyEnforceExp"] and ext_tbl["HolyEnforceExp"] > 0 and holyEnforce_max_exp > 0 then
			tbl["remark"] = tbl["remark"] .. "\r^ff6c0a" .. string.format(EQUIP_LIANHUA_EXP,ext_tbl["HolyEnforceExp"],holyEnforce_max_exp)
		end
	else
		if ext_tbl["HolyEnforce"] and ext_tbl["HolyEnforce"] > 0 then
			tbl["remark"] = "^ff6c0a" .. string.format(EQUIP_LIANHUAGRADE_NAME,ext_tbl["HolyEnforce"])
			if holyweapon_up_max == ext_tbl["HolyEnforce"] and holyweapon_up_max > 0 then
				tbl["remark"] = tbl["remark"] .. EQUIP_UPGRADE_LEVEL_MAX
			end
			tbl["remark"] = tbl["remark"] .. string.format(EQUIP_UPGRADE_LIMIT,equip_up_max)
		end
		if ext_tbl["HolyEnforceExp"] and ext_tbl["HolyEnforceExp"] > 0 and holyEnforce_max_exp > 0 then
			tbl["remark"] = tbl["remark"] .. "\r^ff6c0a" .. string.format(EQUIP_LIANHUA_EXP,ext_tbl["HolyEnforceExp"],holyEnforce_max_exp)
		end
	end

	--[[
	if equip_up_lv > 0 then
		--升级附加基础属性

		local _, up_addon_group = DescUtility:GetItemDBProp(equip_up_templ, ClassType.ICID_EQUIP_LEVELUP, string.format("装备升到等级%d的附加属性组",equip_up_lv+1))
		local up_base_id = {}
		_,up_base_id[1] = DescUtility:GetItemDBProp(up_addon_group, ClassType.ICID_ADDON_GROUP, "基础附加属性1")
		_,up_base_id[2] = DescUtility:GetItemDBProp(up_addon_group, ClassType.ICID_ADDON_GROUP, "基础附加属性2")
		_,up_base_id[3] = DescUtility:GetItemDBProp(up_addon_group, ClassType.ICID_ADDON_GROUP, "基础附加属性3")
		_,up_base_id[4] = DescUtility:GetItemDBProp(up_addon_group, ClassType.ICID_ADDON_GROUP, "基础附加属性4")

		for i = 1,4 do
			if up_base_id[i] > 0 then
				_,up_addon_type = DescUtility.GetItemDBProp(up_base_id[i], ClassType.ICID_EQUIPMENT_ADDON, "type")
				_,up_addon_param1 = DescUtility.GetItemDBProp(up_base_id[i], ClassType.ICID_EQUIPMENT_ADDON, "param1")
				_,up_addon_param2 = DescUtility.GetItemDBProp(up_base_id[i], ClassType.ICID_EQUIPMENT_ADDON, "param2")
				_,up_addon_param3 = DescUtility.GetItemDBProp(up_base_id[i], ClassType.ICID_EQUIPMENT_ADDON, "param3")
				--LogPrint(up_base_id[i])
				--LogPrint(up_addon_type)
				if EQUIP_ESSENCE_TYPE[up_addon_type] then
					LogPrint("111111111111")
					tbl["remark"] = tbl["remark"] .. "\r" .. string.format(EQUIP_ESSENCE_TYPE[up_addon_type].style,up_addon_param1)
				end
			end
		end

		--升级附加随机属性

		if UpgradeAddon["ext_prop_count"] and UpgradeAddon["ext_prop_count"] > 0 and UpgradeAddon["ext_group_type"] ==  2 then
			for i = 1, UpgradeAddon["ext_prop_count"] do
				up_addon_type = UpgradeAddon[string.format("ext_prop_%d_type",i)]
				up_addon_rand = UpgradeAddon[string.format("ext_prop_%d_rand",i)]
				up_addon_param1 = UpgradeAddon[string.format("ext_prop_%d_param1",i)]
				up_addon_param2 = UpgradeAddon[string.format("ext_prop_%d_param2",i)]
				up_addon_value = DescUtility:GetEquipRandValue(up_addon_rand, up_addon_param1, up_addon_param2)
				if EQUIP_ESSENCE_TYPE[up_addon_type] then
					tbl["remark"] = tbl["remark"] .. "\r" .. string.format(EQUIP_ESSENCE_TYPE[up_addon_type].style,up_addon_value)
				end
			end
			tbl["remark"] = tbl["remark"] .. "\r"
		end
	end
	]]

	--描述面板附加信息
	--用\r分割
	if DescUtility:GetItemExtDesc(tid, cid, ext_tbl) ~= --[[!AUTO_61]]"" then
		if tbl["remark"] ~= --[[!AUTO_62]]"" then
			tbl["remark"] =tbl["remark"] .. --[[!AUTO_63]]"\r" .. DescUtility:GetItemExtDesc(tid, cid, ext_tbl)
		else
			tbl["remark"] = DescUtility:GetItemExtDesc(tid, cid, ext_tbl)
		end
	end
		
	if ext_tbl["ExchangeAppearanceID"] ~= nil and ext_tbl["ExchangeAppearanceID"] ~= 0 then
		tbl["remark"] = tbl["remark"] .. "\r" .. EQUIP_CHANGE_APPEARANCE .. "\r" .. string.format(--[[!AUTO_1]]"%s+%s",DescUtility:GetItemName(ext_tbl["ExchangeAppearanceID"], cid),ext_tbl["ExchangeAppearanceUpLv"]).."\r"
	end
	
	tbl["lab_money"], tbl["money1"], tbl["money2"], tbl["money3"], tbl["money4"], tbl["lab_fame"], tbl["fame"], tbl["lab_exchange"], tbl["exchange"], tbl["exchangepic"],tbl["npc_buy_bind"] = DescUtility:GetItemPrice(tid, cid, context_type, price_scale, ext_tbl)
	--签名项

	--tbl["sign"] = "测试签名"

--ext_tbl["SignName"]			签名字样
--ext_tbl["SignLevel"]			签名等级

--返回数据：17项（09.12.11）

	return tbl

end


--宝石包描述
function DescTool:GetStoneGenerateBagDesc(tid,cid,context_type,price_scale,ext_tbl)
	tbl = {}
	--描述面板表头
	tbl["title"] = DescUtility:GetItemName(tid, cid)
	--描述面板图标
	tbl["icon"] = DescUtility:GetItemIcon(tid, cid)
	--描述面板表头
	--1最多3行，2最多1行，3最多2行（用\r分割）
	local quantity = string.format(ITEM_LIMIT_DESC[16],DescUtility:GetItemMaxQuantity(tid, cid))
	local base_type = --[[!AUTO_364]]""

	if DescUtility:GetItemMajorType(tid, cid) == --[[!AUTO_365]]"彩票袋" then
		base_type = string.format(ITEM_LIMIT_DESC[12], ITEM_CLASS_DESC[26])
	elseif DescUtility:GetItemMajorType(tid, cid) == "寶物合成道具" then
		base_type = string.format(ITEM_LIMIT_DESC[12], ITEM_CLASS_DESC[10001])
	elseif DescUtility:GetItemMajorType(tid, cid) == "碎片合成道具" then
		base_type = string.format(ITEM_LIMIT_DESC[12], ITEM_CLASS_DESC[10002])
	else
		base_type = string.format(ITEM_LIMIT_DESC[12], DescUtility:GetItemBaseType(cid))
	end
	tbl["info1"] = string.format(--[[!AUTO_64]]"%s\r%s", base_type,quantity)

	if tid == 77212 then
		local dye_text = DYE_TYPE_TEXT
		local quantity = string.format(ITEM_LIMIT_DESC[16],DescUtility:GetItemMaxQuantity(tid, cid))
		tbl["info1"] = string.format(--[[!AUTO_65]]"%s\r%s%s", dye_text,DescUtility:GetItemLevelLimit(tid, cid),quantity)
	end

	--描述面板星级
	--s_t，s代表星数，-1不显示。t代表显示方案，0为正常，1为同步闪烁，2为待定
	tbl["star"] = --[[!AUTO_66]]"-1_0"
	--描述面板限制（左）与消耗（右）
	--用\r分割
	--描述面板描述信息
	--用\r分割
	tbl["desc"] = DescUtility:GetStoneGenerateBagContent(tid, cid)
	if tid == 77212 then
		tbl["desc"] = STONE_GENERATE_DYE_TEXT
	end
	--描述面板属性信息
	--用\r分割
	tbl["strengthen"] = DescUtility:GetStoneGenerateBagStoneDesc(tid, cid)
	if tid == 77212 then
		tbl["strengthen"] = STONE_GENERATE_DYE_LIST_TEXT
	else
		tbl["strengthen"] = DescUtility:GetStoneGenerateBagStoneDesc(tid, cid)
	end

	if DescUtility:GetItemMajorType(tid, cid) == "寶物合成道具" or DescUtility:GetItemMajorType(tid, cid) == "碎片合成道具" then
		tbl["strengthen"] = ""
	end
	--描述面板属性信息
	--用\r分割
	tbl["remark"] = DescUtility:GetItemExtDesc(tid, cid, ext_tbl)
	--描述面板价格信息
	--单位依次：文、贯、金、玉
	--描述面板声望消耗信息
	--描述面板物品兑换信息
	tbl["lab_money"], tbl["money1"], tbl["money2"], tbl["money3"], tbl["money4"], tbl["lab_fame"], tbl["fame"], tbl["lab_exchange"], tbl["exchange"], tbl["exchangepic"],tbl["npc_buy_bind"] = DescUtility:GetItemPrice(tid, cid, context_type, price_scale, ext_tbl)
	--描述面板元宝信息
	--单位依次：银元、金元
	return tbl
end

--染色道具描述
function DescTool:GetFashionEquipPainterDesc(tid,cid,context_type,price_scale,ext_tbl)
	tbl = {}
	--描述面板表头
	tbl["title"] = DescUtility:GetItemName(tid, cid)
	--描述面板图标
	tbl["icon"] = DescUtility:GetItemIcon(tid, cid)
	--描述面板表头
	--1最多3行，2最多1行，3最多2行（用\r分割）
	local base_type = string.format(ITEM_LIMIT_DESC[12], DescUtility:GetItemBaseType(cid))
	local quantity = string.format(ITEM_LIMIT_DESC[16],DescUtility:GetItemMaxQuantity(tid, cid))
	tbl["info1"] = string.format(--[[!AUTO_67]]"%s\r%s", base_type,quantity)
	--描述面板星级
	--s_t，s代表星数，-1不显示。t代表显示方案，0为正常，1为同步闪烁，2为待定
	tbl["star"] = --[[!AUTO_68]]"-1_0"
	--描述面板限制（左）与消耗（右）
	--用\r分割
	--描述面板属性信息
	--用\r分割
	tbl["limitskill"] = DescUtility:GetFashionEquipPainterColor(tid, cid)
	--描述面板附加信息
	--用\r分割
	tbl["remark"] = DescUtility:GetItemExtDesc(tid, cid, ext_tbl)
	--描述面板价格信息
	--单位依次：文、贯、金、玉
	--描述面板声望消耗信息
	--描述面板物品兑换信息
	tbl["lab_money"], tbl["money1"], tbl["money2"], tbl["money3"], tbl["money4"], tbl["lab_fame"], tbl["fame"], tbl["lab_exchange"], tbl["exchange"], tbl["exchangepic"],tbl["npc_buy_bind"] = DescUtility:GetItemPrice(tid, cid, context_type, price_scale, ext_tbl)
	--描述面板元宝信息
	--单位依次：银元、金元
	return tbl
end


-- 组合材料描述函数
function DescTool:GetMaterialDesc(tid,cid,context_type,price_scale,ext_tbl)

	tbl = {}

	--描述面板表头
	tbl["title"] = DescUtility:GetItemName(tid, cid)

	--描述面板图标
	tbl["icon"] = DescUtility:GetItemIcon(tid, cid)

	--描述面板表头
	--1最多3行，2最多1行，3最多2行（用\r分割）

	local base_type = string.format(ITEM_LIMIT_DESC[12], DescUtility:GetItemBaseType(cid))
	local sub_type_text = DescUtility:GetItemMajorType(tid, cid)
	local sub_type = --[[!AUTO_69]]""
	--[[if sub_type_text ~= "" and sub_type_text ~= "兑换声望" and sub_type_text ~= "卖钱" and sub_type_text ~= "生产材料"
	and sub_type_text ~= "未使用" and sub_type_text ~= "幸运剂" and sub_type_text ~= "帮派后勤物品" then
		sub_type = string.format(ITEM_LIMIT_DESC[15],ITEM_PROD_DESC_TEXT[sub_type_text].type_text)
	end]]
	local quantity = string.format(ITEM_LIMIT_DESC[16],DescUtility:GetItemMaxQuantity(tid, cid))
	local mafia = --[[!AUTO_70]]"幫派後勤"
	local luck = --[[!AUTO_71]]"生產幸運劑"
	if sub_type_text == --[[!AUTO_72]]"幫派後勤物品" then
	   base_type = string.format(ITEM_LIMIT_DESC[12],mafia)
	elseif sub_type_text == --[[!AUTO_73]]"幸運劑" then
	   base_type = string.format(ITEM_LIMIT_DESC[12],luck)
	end
	if sub_type == --[[!AUTO_74]]"" then
		tbl["info1"] = string.format(--[[!AUTO_75]]"%s\r%s", base_type,quantity)
	else
		tbl["info1"] = string.format(--[[!AUTO_76]]"%s\r%s\r%s", base_type, sub_type,quantity)
	end
	--描述面板星级
	--s_t，s代表星数，-1不显示。t代表显示方案，0为正常，1为同步闪烁，2为待定

	tbl["star"] = --[[!AUTO_77]]"-1_0"

	--[[local sub_type_text = DescUtility:GetItemMajorType(tid, cid)
	if ITEM_PROD_DESC_TEXT[sub_type_text] then
		tbl["strengthen"] = ITEM_PROD_DESC_TEXT[sub_type_text].use_text
	end]]


	--描述面板附加信息
	--用\r分割
	tbl["remark"] = DescUtility:GetItemExtDesc(tid, cid, ext_tbl)
	--tbl["remark"] = DescUtility:GetItemBindState(tid, cid, ext_tbl["Bind"])

	tbl["lab_money"], tbl["money1"], tbl["money2"], tbl["money3"], tbl["money4"], tbl["lab_fame"], tbl["fame"], tbl["lab_exchange"], tbl["exchange"], tbl["exchangepic"],tbl["npc_buy_bind"] = DescUtility:GetItemPrice(tid, cid, context_type, price_scale, ext_tbl)

--返回数据：17项（09.12.11）

	return tbl

end
-- 组合宝石描述函数
function DescTool:GetESTONEDesc(tid,cid,context_type,price_scale,ext_tbl)

	tbl = {}

	--表头，名称等
	tbl["title"] = DescUtility:GetItemName(tid, cid)
	--图标
	tbl["icon"] = DescUtility:GetItemIcon(tid, cid)
	--类型，堆叠，等级
	local base_type = string.format(ITEM_LIMIT_DESC[12], DescUtility:GetESTONEType(tid, cid))
	--local shape_type = string.format(ITEM_LIMIT_DESC[20],DescUtility:GetESTONEShape(tid, cid))
	local quantity = string.format(ITEM_LIMIT_DESC[16],DescUtility:GetItemMaxQuantity(tid, cid))
	local level = string.format(ITEM_LIMIT_DESC[35],DescUtility:GetESTONELevel(tid, cid))
	tbl["info1"] = string.format(--[[!AUTO_78]]"%s\r%s\r%s", base_type,level,quantity)

	--描述面板限制
	tbl["limitskill"] = --[[!AUTO_79]]"用途：裝備鑲嵌"

	--附加属性

	local sTempl = --[[!AUTO_107]]""
	sTempl = --[[!]]"宝石种类"
	local BType, Type = DescUtility:GetItemDBProp(tid,cid,sTempl)
	Type = Type +1
	
	--tbl["desc"] = string.format("%s\r%s",DescUtility:GetESTONELevelLimit(tid, cid), DescUtility:GetAESTONEDesc(tid, cid))
	--加入了宝石净化等级显示 gaoxinyuan 2015/01/21
	if Type == 11 then
		tbl["desc"] = string.format(--[[!AUTO_80]]"%s", DescUtility:GetAESTONEDesc(tid, cid))
	elseif ext_tbl["PurifyLevel"] == 0 then
		tbl["desc"] = string.format(--[[!AUTO_80]]"%s", DescUtility:GetAESTONEDesc(tid, cid))..string.format("\r净化等级：%d",ext_tbl["PurifyLevel"])
	else
		tbl["desc"] = string.format(--[[!AUTO_80]]"%s", DescUtility:GetAESTONEDesc(tid, cid,ext_tbl["PurifyLevel"]))..string.format("\r净化等级：%d\r",ext_tbl["PurifyLevel"])..DescUtility:GetPurifyExpireDesc(ext_tbl["PurifyDTime"], false).."\n"
	end

	--描述面板附加信息
	--用\r分割
	tbl["remark"] = DescUtility:GetItemExtDesc(tid, cid, ext_tbl)

	tbl["lab_money"], tbl["money1"], tbl["money2"], tbl["money3"], tbl["money4"], tbl["lab_fame"], tbl["fame"], tbl["lab_exchange"], tbl["exchange"], tbl["exchangepic"],tbl["npc_buy_bind"] = DescUtility:GetItemPrice(tid, cid, context_type, price_scale, ext_tbl)

	return tbl

end

--装备精华描述函数
function DescTool:GetPSTONEDesc(tid,cid,context_type,price_scale,ext_tbl)

	tbl = {}

	--表头，名称等
	tbl["title"] = DescUtility:GetItemName(tid, cid)
	--图标
	tbl["icon"] = DescUtility:GetItemIcon(tid, cid)
	--类型，堆叠，等级
	local base_type = string.format(ITEM_LIMIT_DESC[12], DescUtility:GetItemBaseType(cid))
	--local shape_type = string.format(ITEM_LIMIT_DESC[20],DescUtility:GetESTONEShape(tid, cid))
	local _,equip_level_min = DescUtility:GetItemDBProp(tid, cid, "最低裝備等級限制" )
	local _,equip_level_max = DescUtility:GetItemDBProp(tid, cid, "最高裝備等級限制" )
	local equip_level_text = string.format(ITEM_LIMIT_DESC[42],equip_level_min,equip_level_max)
	local quantity = string.format(ITEM_LIMIT_DESC[16],DescUtility:GetItemMaxQuantity(tid, cid))
	tbl["info1"] = string.format(--[[!AUTO_362]]"%s\r%s\r%s", base_type,equip_level_text,quantity)

	--描述面板限制
	tbl["limitskill"] = --[[!AUTO_79]]"用途：裝備注入"

	--附加属性

	tbl["desc"] = string.format(--[[!AUTO_80]]"%s", DescUtility:GetPSTONEAddonDesc(ext_tbl["PStone_addon_tid"], ext_tbl["PStone_addon_rand"]))

	--描述面板附加信息
	--用\r分割
	tbl["remark"] = DescUtility:GetItemExtDesc(tid, cid, ext_tbl)

	tbl["lab_money"], tbl["money1"], tbl["money2"], tbl["money3"], tbl["money4"], tbl["lab_fame"], tbl["fame"], tbl["lab_exchange"], tbl["exchange"], tbl["exchangepic"],tbl["npc_buy_bind"] = DescUtility:GetItemPrice(tid, cid, context_type, price_scale, ext_tbl)

	return tbl

end

--技能符文描述
function DescTool:GetAnimaRuneDesc(tid,cid,context_type,price_scale,ext_tbl)

	tbl = {}

	--表头，名称等
	tbl["title"] = DescUtility:GetItemName(tid, cid)
	--图标
	tbl["icon"] = DescUtility:GetItemIcon(tid, cid)
	--类型，档次，堆叠
	local base_type = string.format(ITEM_LIMIT_DESC[12], DescUtility:GetItemBaseType(cid))
	local level = string.format(ITEM_LIMIT_DESC[49], DescUtility:GetAnimaRuneLevel(tid, cid))
	local quantity = string.format(ITEM_LIMIT_DESC[16],DescUtility:GetItemMaxQuantity(tid, cid))
	tbl["info1"] = string.format("%s\r%s\r%s", base_type,level,quantity)

	--描述面板限制
	tbl["limitskill"] = "用途：裝備附魔"

	--附加属性
	tbl["desc"] = DescUtility:GetAnimaRuneDesc(tid, cid, ext_tbl)

	--描述面板附加信息
	--用\r分割
	tbl["remark"] = DescUtility:GetItemExtDesc(tid, cid, ext_tbl)

	tbl["lab_money"], tbl["money1"], tbl["money2"], tbl["money3"], tbl["money4"], tbl["lab_fame"], tbl["fame"], tbl["lab_exchange"], tbl["exchange"], tbl["exchangepic"],tbl["npc_buy_bind"] = DescUtility:GetItemPrice(tid, cid, context_type, price_scale, ext_tbl)

	return tbl

end

-- 组合打孔石描述函数

function DescTool:GetHOLEDesc(tid,cid,context_type,price_scale,ext_tbl)

	tbl = {}

	--表头，名称等
	tbl["title"] = DescUtility:GetItemName(tid, cid)
	--图标
	tbl["icon"] = DescUtility:GetItemIcon(tid, cid)
	--类型，堆叠

	local base_type = string.format(ITEM_LIMIT_DESC[12], DescUtility:GetItemBaseType(cid))
	local quantity = string.format(ITEM_LIMIT_DESC[16],DescUtility:GetItemMaxQuantity(tid, cid))
	tbl["info1"] = string.format(--[[!AUTO_81]]"%s\r%s", base_type,quantity)

	--描述面板限制
	tbl["limitskill"] = --[[!AUTO_82]]"使用：裝備打孔時消耗"

	--附加属性


	tbl["desc"] = string.format(--[[!AUTO_83]]"%s",DescUtility:GetHOLELevelLimit(tid, cid))

	--描述面板附加信息
	--用\r分割
	tbl["remark"] = DescUtility:GetItemExtDesc(tid, cid, ext_tbl)

	tbl["lab_money"], tbl["money1"], tbl["money2"], tbl["money3"], tbl["money4"], tbl["lab_fame"], tbl["fame"], tbl["lab_exchange"], tbl["exchange"], tbl["exchangepic"],tbl["npc_buy_bind"] = DescUtility:GetItemPrice(tid, cid, context_type, price_scale, ext_tbl)

	return tbl

end
-- 组合镶嵌符描述函数

function DescTool:GetEMBEDDesc(tid,cid,context_type,price_scale,ext_tbl)

	tbl = {}

	--表头，名称等
	tbl["title"] = DescUtility:GetItemName(tid, cid)
	--图标
	tbl["icon"] = DescUtility:GetItemIcon(tid, cid)
	--类型，堆叠

	local base_type = string.format(ITEM_LIMIT_DESC[12], DescUtility:GetItemBaseType(cid))
	local quantity = string.format(ITEM_LIMIT_DESC[16],DescUtility:GetItemMaxQuantity(tid, cid))
	tbl["info1"] = string.format(--[[!AUTO_84]]"%s\r%s", base_type,quantity)

	--描述面板限制
	tbl["limitskill"] = --[[!AUTO_85]]"使用：寶石鑲嵌時消耗"

	--附加属性


	tbl["desc"] = string.format(--[[!AUTO_86]]"%s",DescUtility:GetEMBEDLevelLimit(tid, cid))

	--描述面板附加信息
	--用\r分割
	tbl["remark"] = DescUtility:GetItemExtDesc(tid, cid, ext_tbl)

	tbl["lab_money"], tbl["money1"], tbl["money2"], tbl["money3"], tbl["money4"], tbl["lab_fame"], tbl["fame"], tbl["lab_exchange"], tbl["exchange"], tbl["exchangepic"],tbl["npc_buy_bind"] = DescUtility:GetItemPrice(tid, cid, context_type, price_scale, ext_tbl)

	return tbl

end
-- 组合宝石合成符描述函数

function DescTool:GetSTONECOMPOSEDesc(tid,cid,context_type,price_scale,ext_tbl)

	tbl = {}

	--表头，名称等
	tbl["title"] = DescUtility:GetItemName(tid, cid)
	--图标
	tbl["icon"] = DescUtility:GetItemIcon(tid, cid)
	--类型，堆叠，
	local base_type = string.format(ITEM_LIMIT_DESC[12], DescUtility:GetItemBaseType(cid))
	local quantity = string.format(ITEM_LIMIT_DESC[16],DescUtility:GetItemMaxQuantity(tid, cid))
	tbl["info1"] = string.format(--[[!AUTO_87]]"%s\r%s", base_type,quantity)

	--描述面板限制
	tbl["limitskill"] = --[[!AUTO_88]]"使用：寶石合成時消耗"

	--附加属性


	--描述面板附加信息
	--用\r分割
	tbl["remark"] = DescUtility:GetItemExtDesc(tid, cid, ext_tbl)

	tbl["lab_money"], tbl["money1"], tbl["money2"], tbl["money3"], tbl["money4"], tbl["lab_fame"], tbl["fame"], tbl["lab_exchange"], tbl["exchange"], tbl["exchangepic"],tbl["npc_buy_bind"] = DescUtility:GetItemPrice(tid, cid, context_type, price_scale, ext_tbl)

	return tbl

end

function DescTool:GetActionItemDesc( tid, cid, context_type, price_scale, ext_tbl )
	-- body
	tbl = {}
	tbl["title"] = DescUtility:GetItemName( tid, cid )

	tbl["icon"] = DescUtility:GetItemIcon( tid, cid )

	local mType = DescUtility:GetItemBaseType( cid )
	base_type = string.format( ITEM_LIMIT_DESC[12], mType )
	local quantity = string.format(ITEM_LIMIT_DESC[16],DescUtility:GetItemMaxQuantity(tid, cid))
	tbl["info1"] = string.format(--[[!AUTO_113]]"%s\r%s%s", base_type,DescUtility:GetItemLevelLimit(tid, cid),quantity)

	tbl["star"] = --[[!AUTO_90]]"-1_0"

	tbl["limitskill"] = PET_SKILL_BOOK_USE_DESC[2]

	tbl["desc"] = DescUtility:GetActionItemBaseProp(tid, cid, ext_tbl)

	tbl["remark"] = DescUtility:GetItemExtDesc(tid, cid, ext_tbl)

	tbl["lab_money"], tbl["money1"], tbl["money2"], tbl["money3"], tbl["money4"], tbl["lab_fame"], tbl["fame"], tbl["lab_exchange"], tbl["exchange"], tbl["exchangepic"],tbl["npc_buy_bind"] = DescUtility:GetItemPrice(tid, cid, context_type, price_scale, ext_tbl)

	return tbl
end

function DescTool:GetTalentPetItemDesc(tid, cid, context_type, price_scale, ext_tbl)
	tbl = {}

	--描述面板表头
	tbl["title"] = DescUtility:GetItemName(tid, cid)

	--描述面板图标
	tbl["icon"] = DescUtility:GetItemIcon(tid, cid)

	--描述面板表头
	--1最多3行，2最多1行，3最多2行（用\r分割）

	local base_type = string.format(ITEM_LIMIT_DESC[12], DescUtility:GetItemBaseType(cid))
	local level_limit = string.format(ITEM_LIMIT_DESC[35], ext_tbl["TalentPetLevel"])--此处是宠物等级，不是等级限制
	local quantity = string.format(ITEM_LIMIT_DESC[16],DescUtility:GetItemMaxQuantity(tid, cid))
	tbl["info1"] = string.format(--[[!AUTO_230]]"%s\r%s\r%s", base_type,level_limit,quantity)
	
	local quality = ext_tbl["TalentPetQuality"]
	tbl["star"] = string.format(--[[!AUTO_31]]"%s_0",quality)
	tbl["star"] = tbl["star"] .. "_1"
	
	tbl["limitskill"] = --[[!AUTO_232]]"使用：右鍵點擊進入寵物欄"
	
	--天赋附加属性和资质
	local base_ess, zhulingtext = DescUtility:GetAnimaEquipAddonPropDesc(tid, cid, ext_tbl)
	if base_ess ~= --[[!AUTO_38]]"" and base_ess ~= nil then
		tbl["strengthen"] = string.format(ITEM_LIMIT_DESC[14],base_ess)
	end
	local talent = ext_tbl["TalentPetTalentName"].."   "..ext_tbl["TalentPetTalentLevel"]
	local aptitude1 = string.format(ITEM_LIMIT_DESC[50], ext_tbl["TalentPetAptitude1"])
	local aptitude2 = string.format(ITEM_LIMIT_DESC[51], ext_tbl["TalentPetAptitude2"])
	local aptitude3 = string.format(ITEM_LIMIT_DESC[52], ext_tbl["TalentPetAptitude3"])
	local aptitude4 = string.format(ITEM_LIMIT_DESC[53], ext_tbl["TalentPetAptitude4"])
	local aptitude5 = string.format(ITEM_LIMIT_DESC[54], ext_tbl["TalentPetAptitude5"])
	tbl["strengthen"] = string.format(--[[!AUTO_40]]"%s%s\r%s\r%s\r%s\r%s\r%s",talent, tbl["strengthen"], aptitude1, aptitude2, aptitude3, aptitude4, aptitude5)
	
	--差事技能
	local lifeskill = ITEM_LIMIT_DESC[55]
	if ext_tbl["TalentPetLifeSkill1"] == true then
		lifeskill = lifeskill .. " 信箱"
	end
	
	if ext_tbl["TalentPetLifeSkill2"] == true then
		lifeskill = lifeskill .. " 拾取"
	end
	
	if ext_tbl["TalentPetLifeSkill3"] == true then
		lifeskill = lifeskill .. " 倉庫"
	end
	
	if ext_tbl["TalentPetLifeSkill4"] == true then
		lifeskill = lifeskill .. " 修理"
	end
	
	if ext_tbl["TalentPetLifeSkill5"] == true then
		lifeskill = lifeskill .. " 追蹤"
	end
	
	if ext_tbl["TalentPetLifeSkill6"] == true then
		lifeskill = lifeskill .. " 串門"
	end
	
	if ext_tbl["TalentPetLifeSkill7"] == true then
		lifeskill = lifeskill .. " 出售"
	end
	
	--主人
	if ext_tbl["TalentPetMasterName"] ~= nil then
		local master = ITEM_LIMIT_DESC[56] .. ext_tbl["TalentPetMasterName"]
		tbl["remark"] = string.format("%s\r\r%s", lifeskill, master)
	else
		tbl["remark"] = string.format("%s", lifeskill)
	end
	
	tbl["remark"] = tbl["remark"].."\r\r"..DescUtility:GetItemExtDesc(tid, cid, ext_tbl)
	
	return tbl
end

function DescTool:GetTalentPetEquipDesc(tid, cid, context_type, price_scale, ext_tbl)
	tbl = {}

	--描述面板表头
	tbl["title"] = DescUtility:GetItemName(tid, cid)
	
	if ext_tbl["ReinforceLevel"] > 0 then
		tbl["title"] = tbl["title"] .. string.format("+%s",ext_tbl["ReinforceLevel"])
	end

	--描述面板图标
	tbl["icon"] = DescUtility:GetItemIcon(tid, cid)
	
	tbl["star"] = string.format(--[[!AUTO_31]]"%s_0", ext_tbl["ReinforceLevel"] )
	tbl["star"] = tbl["star"] .. "_1"
	
	local base_type = string.format(ITEM_LIMIT_DESC[12], DescUtility:GetItemBaseType(cid))
	local pos = ext_tbl["EquipPos"] 
	local pos_context
	if pos == 0 then
		pos_context = string.format(ITEM_LIMIT_DESC[23], "武器")
	elseif pos == 1 then
		pos_context = string.format(ITEM_LIMIT_DESC[23], "衣服")
	elseif pos == 2 then
		pos_context = string.format(ITEM_LIMIT_DESC[23], "頭飾")
	elseif pos == 3 then
		pos_context = string.format(ITEM_LIMIT_DESC[23], "足飾")
	else
		pos_context = string.format(ITEM_LIMIT_DESC[23], "項圈")
	end
	tbl["info1"] = string.format(--[[!AUTO_230]]"%s\r%s", base_type,pos_context)
	
	local base_ess, zhulingtext = DescUtility:GetAnimaEquipAddonPropDesc(tid, cid, ext_tbl)
	
	if base_ess ~= --[[!AUTO_38]]"" and base_ess ~= nil then
		tbl["strengthen"] = string.format(ITEM_LIMIT_DESC[14],base_ess)
	end
	
	if ext_tbl["show_random_prop"] == 1 then
		_, random_count = DescUtility:GetItemDBProp( tid, cid, "隨機附加屬性個數" )
		if random_count ~= 0 then
			tbl["strengthen"] = tbl["strengthen"].."\r"..string.format(EQUIP_ESSPROP_RANDOMADD_SELECT, random_count)
		end
	end
	
	tbl["remark"] = DescUtility:GetItemExtDesc(tid, cid, ext_tbl)
	tbl["lab_money"], tbl["money1"], tbl["money2"], tbl["money3"], tbl["money4"], tbl["lab_fame"], tbl["fame"], tbl["lab_exchange"], tbl["exchange"], tbl["exchangepic"],tbl["npc_buy_bind"] = DescUtility:GetItemPrice(tid, cid, context_type, price_scale, ext_tbl)
	
	return tbl
end

function DescTool:GetTalentPetAddExpItemDesc(tid, cid, context_type, price_scale, ext_tbl)
	tbl = {}

	--描述面板表头
	tbl["title"] = DescUtility:GetItemName(tid, cid)

	--描述面板图标
	tbl["icon"] = DescUtility:GetItemIcon(tid, cid)

	--描述面板表头
	--1最多3行，2最多1行，3最多2行（用\r分割）

	local base_type = string.format(ITEM_LIMIT_DESC[12], DescUtility:GetItemBaseType(cid))
	local quantity = string.format(ITEM_LIMIT_DESC[16],DescUtility:GetItemMaxQuantity(tid, cid))
	tbl["info1"] = string.format(--[[!AUTO_230]]"%s\r%s", base_type,quantity)
	
	tbl["star"] = --[[!AUTO_90]]"-1_0"
	
	tbl["limitskill"] = --[[!AUTO_232]]"使用：[寵物提升]-[經驗獲取]介面右鍵點擊"
	
	local _, addexp = DescUtility:GetItemDBProp( tid, cid, "增加的寵物經驗" )
	tbl["desc"] = string.format(--[[!AUTO_230]]"使用後給寵物增加%s的經驗", addexp)
	tbl["remark"] = DescUtility:GetItemExtDesc(tid, cid, ext_tbl)
	
	tbl["lab_money"], tbl["money1"], tbl["money2"], tbl["money3"], tbl["money4"], tbl["lab_fame"], tbl["fame"], tbl["lab_exchange"], tbl["exchange"], tbl["exchangepic"],tbl["npc_buy_bind"] = DescUtility:GetItemPrice(tid, cid, context_type, price_scale, ext_tbl)
	
	return tbl
end

function DescTool:GetTalentPetTalentDesc(ext_tbl)
	tbl = {}
	
	--描述面板表头
	tbl["title"] = ext_tbl["TalentName"]
	
	tbl["icon"] = GameApi.GetFileNameByID(ext_tbl["TalentIcon"], 0)
	
	local level_limit = string.format(ITEM_LIMIT_DESC[35], ext_tbl["TalentLv"])--此处是宠物天赋等级，不是等级限制
	local base_type = string.format(ITEM_LIMIT_DESC[12], "種族天賦")
	tbl["info1"] = string.format(--[[!AUTO_230]]"%s\r%s", level_limit,base_type)
	
	local base_ess, zhulingtext = DescUtility:GetAnimaEquipAddonPropDesc(0, 0, ext_tbl)
	if base_ess ~= --[[!AUTO_38]]"" and base_ess ~= nil then
		tbl["strengthen"] = string.format(ITEM_LIMIT_DESC[14],base_ess)
	end

	tbl["remark"] = TALENT_PET_TEXT[ext_tbl["TalentId"]]
	
	return tbl
end

function DescTool:GetKickCorpseItemDesc(tid,cid,context_type,price_scale,ext_tbl)
	tbl = {}
	
	tbl["title"] = DescUtility:GetItemName( tid, cid )

	tbl["icon"] = DescUtility:GetItemIcon( tid, cid )

	local mType = DescUtility:GetItemBaseType( cid )
	base_type = string.format( ITEM_LIMIT_DESC[12], mType )
	local quantity = string.format(ITEM_LIMIT_DESC[16],DescUtility:GetItemMaxQuantity(tid, cid))
	tbl["info1"] = string.format(--[[!AUTO_113]]"%s\r%s%s", base_type,DescUtility:GetItemLevelLimit(tid, cid),quantity)

	tbl["star"] = --[[!AUTO_90]]"-1_0"

	tbl["limitskill"] = PET_SKILL_BOOK_USE_DESC[2]

	tbl["desc"] = DescUtility:GetKickCorpseItemBaseProp(tid, cid, ext_tbl)

	tbl["remark"] = DescUtility:GetItemExtDesc(tid, cid, ext_tbl)

	tbl["lab_money"], tbl["money1"], tbl["money2"], tbl["money3"], tbl["money4"], tbl["lab_fame"], tbl["fame"], tbl["lab_exchange"], tbl["exchange"], tbl["exchangepic"],tbl["npc_buy_bind"] = DescUtility:GetItemPrice(tid, cid, context_type, price_scale, ext_tbl)

	return tbl
end

function DescTool:GetMagicCircleDesc(tid,cid,context_type,price_scale,ext_tbl)
	tbl = {}
	
	tbl["title"] = DescUtility:GetItemName( tid, cid )

	tbl["icon"] = DescUtility:GetItemIcon( tid, cid )

	local mType = DescUtility:GetItemBaseType( cid )
	base_type = string.format( ITEM_LIMIT_DESC[12], mType )
	local quantity = string.format(ITEM_LIMIT_DESC[16],DescUtility:GetItemMaxQuantity(tid, cid))
	tbl["info1"] = string.format(--[[!AUTO_113]]"%s\r%s%s", base_type,DescUtility:GetItemLevelLimit(tid, cid),quantity)

	tbl["star"] = --[[!AUTO_90]]"-1_0"

	tbl["remark"] = DescUtility:GetItemExtDesc(tid, cid, ext_tbl)

	tbl["lab_money"], tbl["money1"], tbl["money2"], tbl["money3"], tbl["money4"], tbl["lab_fame"], tbl["fame"], tbl["lab_exchange"], tbl["exchange"], tbl["exchangepic"],tbl["npc_buy_bind"] = DescUtility:GetItemPrice(tid, cid, context_type, price_scale, ext_tbl)

	return tbl
end

function DescTool:GetMagicStoneDesc(tid,cid,context_type,price_scale,ext_tbl)
	tbl = {}
	
	tbl["title"] = DescUtility:GetItemName( tid, cid )

	tbl["icon"] = DescUtility:GetItemIcon( tid, cid )

	local type_config = {"朱雀石", "白虎石", "玄武石", "青龍石"}
	local stone_type = ext_tbl["Stone_Type"]
	local mType = ""
	if(stone_type ~=nil) then
		mType = type_config[stone_type]
	else
		mType = DescUtility:GetItemBaseType( cid )
	end
	base_type = string.format( ITEM_LIMIT_DESC[12], mType )
	local quantity = string.format(ITEM_LIMIT_DESC[16],DescUtility:GetItemMaxQuantity(tid, cid))
	tbl["info1"] = string.format(--[[!AUTO_113]]"%s\r%s%s", base_type,DescUtility:GetItemLevelLimit(tid, cid),quantity)

	tbl["star"] = --[[!AUTO_90]]"-1_0"

	tbl["strengthen"] = DescUtility:GetMagicStoneEssDesc(tid, cid)

	tbl["magic_energy"] = DescUtility:GetMagicStoneEnergyDesc(tid, cid)

	tbl["remark"] = DescUtility:GetItemExtDesc(tid, cid, ext_tbl)

	tbl["lab_money"], tbl["money1"], tbl["money2"], tbl["money3"], tbl["money4"], tbl["lab_fame"], tbl["fame"], tbl["lab_exchange"], tbl["exchange"], tbl["exchangepic"],tbl["npc_buy_bind"] = DescUtility:GetItemPrice(tid, cid, context_type, price_scale, ext_tbl)

	return tbl
end


-- 组合药品描述函数
function DescTool:GetMedicineDesc(tid,cid,context_type,price_scale,ext_tbl)
	LogPrint("33333333333333333")
	tbl = {}

	--描述面板表头
	tbl["title"] = DescUtility:GetItemName(tid, cid)

	--描述面板图标
	tbl["icon"] = DescUtility:GetItemIcon(tid, cid)

	--描述面板表头
	--1最多3行，2最多1行，3最多2行（用\r分割）

	local _, mType = DescUtility:GetItemDBProp(tid,cid,--[[!]]"药物类别")
	if mType == 6 or mType == 7 then
		base_type = string.format(ITEM_LIMIT_DESC[12], ITEM_GONGLI_MEDICINE_TYPE_TEXT)
	elseif mType == 20 then
		base_type = string.format(ITEM_LIMIT_DESC[12], ITEM_FUYUAN_Random_TYPE_TEXT)
	elseif mType == 21 then
		base_type = string.format(ITEM_LIMIT_DESC[12], ITEM_ANQI_LEVELUP_TYPE_TEXT)
	elseif mType == 24 then
		base_type = string.format(ITEM_LIMIT_DESC[12], ITEM_EQUIP_REP_TYPE_TEXT)
	elseif mType == 26 then
		base_type = string.format(ITEM_LIMIT_DESC[12], ITEM_MAFIA_BUILDING_TYPE_TEXT)
	elseif mType == 27 then
		base_type = string.format(ITEM_LIMIT_DESC[12], ITEM_MAFIA_MONEY_TYPE_TEXT)
	elseif mType == 28 then
		base_type = string.format(ITEM_LIMIT_DESC[12], ITEM_STONE_CRYSTAL_TYPE_TEXT)
	elseif mType == 36 then
		base_type = string.format(ITEM_LIMIT_DESC[12], ITEM_MONTHLY_VIP)
	else
		base_type = string.format(ITEM_LIMIT_DESC[12], DescUtility:GetItemBaseType(cid))
	end

	--local sub_type = string.format(ITEM_LIMIT_DESC[15],DescUtility:GetItemMajorType(tid, cid))
	local quantity = string.format(ITEM_LIMIT_DESC[16],DescUtility:GetItemMaxQuantity(tid, cid))
	tbl["info1"] = string.format(--[[!AUTO_89]]"%s\r%s%s", base_type,DescUtility:GetItemLevelLimit(tid, cid),quantity)


	--描述面板星级
	--s_t，s代表星数，-1不显示。t代表显示方案，0为正常，1为同步闪烁，2为待定

	tbl["star"] = --[[!AUTO_90]]"-1_0"

	--描述面板限制（左）与消耗（右）
	--用\r分割
	--tbl["limitleft"] = string.format(ITEM_LIMIT_DESC[1], DescUtility:GetItemLevelLimit(tid, cid), DescUtility:GetItemProfLimit(tid, cid))

	--描述面板描述信息
	--用\r分割
	--tiplimitskill = DescUtility:GetMedicineBaseProp(tid, cid)
	tbl["limitskill"] = PET_SKILL_BOOK_USE_DESC[2]
	--描述面板属性信息

	--用\r分割
	tbl["desc"] = DescUtility:GetMedicineBaseProp(tid, cid, ext_tbl)

	--描述面板附加信息
	--用\r分割
	tbl["remark"] = DescUtility:GetItemExtDesc(tid, cid, ext_tbl)

	--描述面板价格信息
	--单位依次：文、贯、金、玉

	--描述面板声望消耗信息


	--描述面板物品兑换信息

	tbl["lab_money"], tbl["money1"], tbl["money2"], tbl["money3"], tbl["money4"], tbl["lab_fame"], tbl["fame"], tbl["lab_exchange"], tbl["exchange"], tbl["exchangepic"],tbl["npc_buy_bind"] = DescUtility:GetItemPrice(tid, cid, context_type, price_scale, ext_tbl)

	--描述面板元宝信息
	--单位依次：银元、金元


--返回数据：17项（09.12.11）

	return tbl

end

-- 组合技能书描述函数
function DescTool:GetSkillTomeDesc(tid,cid,context_type,price_scale,ext_tbl)
	local skilltome_type_text = DescUtility:GetItemMajorType(tid, cid)

	local player_skill_data = GameApi.GetSkillTable()

	local idpack
	_,idpack = DescUtility:GetItemDBProp(tid, cid, --[[!]]"使用后学会套路")
	local islearn_pack = false
	if idpack > 0 then
		islearn_pack = true
		local packinfo = GameApi.GetSkillPack(idpack)
		for p_num = 1,table.getn(packinfo["id_skills"]) do
			if not player_skill_data[packinfo["id_skills"][p_num]] then
				islearn_pack = false
				break
			end
		end
	end

	local islearn_skill = false
	local idskill = {}
	for s_num = 1, 4 do
		local now_skill
		_,now_skill = DescUtility:GetItemDBProp(tid, cid, string.format(--[[!]]"使用后学会技能%d",s_num))
		if now_skill then
			idskill[s_num] = now_skill
		else idskill[s_num] = 0
		end
		if idskill[s_num] > 0 then
			if player_skill_data[idskill[s_num]] then islearn_skill = true break end
		end
	end


	tbl = {}

	--描述面板表头
	tbl["title"] = DescUtility:GetItemName(tid, cid)

	--描述面板图标
	tbl["icon"] = DescUtility:GetItemIcon(tid, cid)

	--描述面板表头
	--1最多3行，2最多1行，3最多2行（用\r分割）

	local base_type = string.format(ITEM_LIMIT_DESC[12], ITEM_SKILLTOME_DESC_TEXT[skilltome_type_text].type_text)
	local quantity = string.format(ITEM_LIMIT_DESC[16],DescUtility:GetItemMaxQuantity(tid, cid))
	tbl["info1"] = string.format(--[[!AUTO_91]]"%s\r%s%s%s", base_type,DescUtility:GetItemLevelLimit(tid, cid),DescUtility:GetItemProfLimit(tid, cid),quantity)

	--描述面板星级
	--s_t，s代表星数，-1不显示。t代表显示方案，0为正常，1为同步闪烁，2为待定

	tbl["star"] = --[[!AUTO_92]]"-1_0"

	--描述面板限制（左）与消耗（右）
	--用\r分割
	--tbl["limitleft"] = string.format(ITEM_LIMIT_DESC[1], DescUtility:GetItemLevelLimit(tid, cid), DescUtility:GetItemProfLimit(tid, cid))

	--描述面板描述信息
	--描述面板属性信息

	--用\r分割
	if islearn_pack or islearn_skill then
		tbl["limitskill"] = string.format(--[[!AUTO_93]]"%s%s",TAG_COLOR_ESSENCE[4],ITEM_SKILLTOME_DESC_TEXT[skilltome_type_text].learn_text)
	else
		tbl["limitskill"] = string.format(--[[!AUTO_94]]"%s%s",TAG_COLOR_ESSENCE[5],ITEM_SKILLTOME_DESC_TEXT[skilltome_type_text].use_text)
		local gongli
		_,gongli = DescUtility:GetItemDBProp(tid, cid, --[[!]]"功力消耗")
		--tbl["desc"] = string.format(ITEM_SKILLTOME_USE_GONGLI,gongli)
	end

	local _,skill_id = DescUtility:GetItemDBProp(tid, cid, --[[!]]"使用后学会技能1")
	if skill_id > 0 and SKILL_DETAIL_DESC[skill_id] then
		tbl["desc"] = SKILL_DETAIL_DESC[skill_id]
	end

	--描述面板附加信息
	--用\r分割
	tbl["remark"] = DescUtility:GetItemExtDesc(tid, cid, ext_tbl)

	--描述面板价格信息
	--单位依次：文、贯、金、玉

	--描述面板声望消耗信息


	--描述面板物品兑换信息

	tbl["lab_money"], tbl["money1"], tbl["money2"], tbl["money3"], tbl["money4"], tbl["lab_fame"], tbl["fame"], tbl["lab_exchange"], tbl["exchange"], tbl["exchangepic"],tbl["npc_buy_bind"] = DescUtility:GetItemPrice(tid, cid, context_type, price_scale, ext_tbl)

	--描述面板元宝信息
	--单位依次：银元、金元


--返回数据：17项（09.12.11）

	return tbl
end

-- 组合任务物品描述函数
function DescTool:GetTaskItemDesc(tid,cid,context_type,price_scale,ext_tbl)

	tbl = {}

	--描述面板表头
	tbl["title"] = DescUtility:GetItemName(tid, cid)

	--描述面板图标
	tbl["icon"] = DescUtility:GetItemIcon(tid, cid)

	--描述面板表头
	--1最多3行，2最多1行，3最多2行（用\r分割）

	local base_type
	if tid < 89282 then
		base_type = string.format(ITEM_LIMIT_DESC[12], DescUtility:GetItemBaseType(cid))
	elseif tid > 89293 then
		base_type = string.format(ITEM_LIMIT_DESC[12], DescUtility:GetItemBaseType(cid))
	else
		base_type = string.format(ITEM_LIMIT_DESC[12], "幫派特產")
	end
	tbl["info1"] = string.format(--[[!AUTO_95]]"%s", base_type)

	--描述面板星级
	--s_t，s代表星数，-1不显示。t代表显示方案，0为正常，1为同步闪烁，2为待定

	tbl["star"] = --[[!AUTO_96]]"-1_0"

	--描述面板限制（左）与消耗（右）
	--用\r分割

	--描述面板描述信息
	--用\r分割

	--描述面板属性信息

	--用\r分割

	--描述面板附加信息
	--用\r分割
	tbl["remark"] = DescUtility:GetItemExtDesc(tid, cid, ext_tbl)

	--描述面板价格信息
	--单位依次：文、贯、金、玉

	--描述面板声望消耗信息


	--描述面板物品兑换信息

	tbl["lab_money"], tbl["money1"], tbl["money2"], tbl["money3"], tbl["money4"], tbl["lab_fame"], tbl["fame"], tbl["lab_exchange"], tbl["exchange"], tbl["exchangepic"],tbl["npc_buy_bind"] = DescUtility:GetItemPrice(tid, cid, context_type, price_scale, ext_tbl)

	--描述面板元宝信息
	--单位依次：银元、金元


--返回数据：17项（09.12.11）


	return tbl

end

-- 组合任务随机发生器描述函数




function DescTool:GetTaskDiceDesc(tid,cid,context_type,price_scale,ext_tbl)

	tbl = {}

	--描述面板表头
	tbl["title"] = DescUtility:GetItemName(tid, cid)

	--描述面板图标
	tbl["icon"] = DescUtility:GetItemIcon(tid, cid)

	--描述面板表头
	--1最多3行，2最多1行，3最多2行（用\r分割）

	local base_type = string.format(ITEM_LIMIT_DESC[12], DescUtility:GetItemBaseType(cid))
	tbl["info1"] = string.format(--[[!AUTO_97]]"%s", base_type)

	if tid == 77188 then
		local dye_text = DYE_TYPE_TEXT
		local quantity = string.format(ITEM_LIMIT_DESC[16],DescUtility:GetItemMaxQuantity(tid, cid))
		tbl["info1"] = string.format(--[[!AUTO_98]]"%s\r%s%s", dye_text,DescUtility:GetItemLevelLimit(tid, cid),quantity)
	elseif tid == 83383 or tid == 83384 then
		local victory_point_text = VICTORY_POINT_TYPE_TEXT
		local quantity = string.format(ITEM_LIMIT_DESC[16],DescUtility:GetItemMaxQuantity(tid, cid))
		tbl["info1"] = string.format(--[[!AUTO_98]]"%s\r%s%s", victory_point_text,DescUtility:GetItemLevelLimit(tid, cid),quantity)
	end

	--描述面板星级
	--s_t，s代表星数，-1不显示。t代表显示方案，0为正常，1为同步闪烁，2为待定

	tbl["star"] = --[[!AUTO_99]]"-1_0"

	--描述面板限制（左）与消耗（右）
	--用\r分割

	--描述面板描述信息
	--用\r分割

	--描述面板属性信息


	--用\r分割

	--描述面板附加信息
	--用\r分割
	tbl["remark"] = DescUtility:GetItemExtDesc(tid, cid, ext_tbl)

	--描述面板价格信息
	--单位依次：文、贯、金、玉

	--描述面板声望消耗信息


	--描述面板物品兑换信息

	tbl["lab_money"], tbl["money1"], tbl["money2"], tbl["money3"], tbl["money4"], tbl["lab_fame"], tbl["fame"], tbl["lab_exchange"], tbl["exchange"], tbl["exchangepic"],tbl["npc_buy_bind"] = DescUtility:GetItemPrice(tid, cid, context_type, price_scale, ext_tbl)

	--描述面板元宝信息
	--单位依次：银元、金元



--返回数据：17项（09.12.11）


	return tbl

end

-- 组合技能物品描述函数

function DescTool:GetSkillMatterDesc(tid,cid,context_type,price_scale,ext_tbl)

	tbl = {}

	--描述面板表头
	tbl["title"] = DescUtility:GetItemName(tid, cid)

	--描述面板图标
	tbl["icon"] = DescUtility:GetItemIcon(tid, cid)

	--描述面板表头
	--1最多3行，2最多1行，3最多2行（用\r分割）


	--描述面板星级
	--s_t，s代表星数，-1不显示。t代表显示方案，0为正常，1为同步闪烁，2为待定

	tbl["star"] = --[[!AUTO_100]]"-1_0"

	local base_type
	local quantity = string.format(ITEM_LIMIT_DESC[16],DescUtility:GetItemMaxQuantity(tid, cid))

	if DescUtility:GetItemMajorType(tid, cid) == --[[!AUTO_366]]"烹饪" then
		base_type = string.format(ITEM_LIMIT_DESC[12], DescUtility:GetItemSubType(tid, cid))
		tbl["info1"] = string.format(--[[!AUTO_101]]"%s\r%s%s",base_type,DescUtility:GetItemLevelLimit(tid, cid),quantity)
		tbl["desc"] = DescUtility:GetFoodDesc(tid,cid)
	elseif DescUtility:GetItemMajorType(tid, cid) == --[[!AUTO_367]]"丹丸药" then
		base_type = string.format(ITEM_LIMIT_DESC[12], string.gsub(DescUtility:GetSkillItemType(tid, cid), --[[!AUTO_102]]"藥", --[[!AUTO_103]]"丸"))
		tbl["info1"] = string.format(--[[!AUTO_104]]"%s\r%s%s",base_type,DescUtility:GetItemLevelLimit(tid, cid),quantity)
		tbl["desc"] = DescUtility:GethealerDesc(tid,cid)
	elseif tid == 77543 then
		base_type = string.format(ITEM_LIMIT_DESC[12], --[[!AUTO_105]]"酒")
		tbl["info1"] = string.format(--[[!AUTO_106]]"%s\r%s%s",base_type,DescUtility:GetItemLevelLimit(tid, cid),quantity)
	else
		tbl["info1"] = string.format(ITEM_LIMIT_DESC[12], DescUtility:GetItemBaseType(cid))
	end
	--描述面板限制（左）与消耗（右）
	--用\r分割

	--描述面板描述信息
	--用\r分割
	if DescUtility:GetItemMajorType(tid, cid) == --[[!]]"帮派用技能物品" and DescUtility:GetItemSubType(tid, cid) == --[[!]]"劫持工具" then
		tbl["limitskill"] = --[[!AUTO_107]]"^FFFFFF使用：選中目標後右鍵點擊"
	else
		tbl["limitskill"] = PET_SKILL_BOOK_USE_DESC[2]
	end
	--描述面板属性信息


	--用\r分割

	--描述面板附加信息
	--用\r分割
	tbl["remark"] = DescUtility:GetItemExtDesc(tid, cid, ext_tbl)

	--描述面板价格信息
	--单位依次：文、贯、金、玉

	--描述面板声望消耗信息


	--描述面板物品兑换信息

	tbl["lab_money"], tbl["money1"], tbl["money2"], tbl["money3"], tbl["money4"], tbl["lab_fame"], tbl["fame"], tbl["lab_exchange"], tbl["exchange"], tbl["exchangepic"],tbl["npc_buy_bind"] = DescUtility:GetItemPrice(tid, cid, context_type, price_scale, ext_tbl)

	--描述面板元宝信息
	--单位依次：银元、金元


--返回数据：17项（09.12.11）

	return tbl

end

-- 组合交通工具描述函数

function DescTool:GetVehicleDesc(tid,cid,context_type,price_scale,ext_tbl)

	tbl = {}

	--描述面板表头
	tbl["title"] = DescUtility:GetItemName(tid, cid)

	--描述面板图标
	tbl["icon"] = DescUtility:GetItemIcon(tid, cid)

	--描述面板表头
	--1最多3行，2最多1行，3最多2行（用\r分割）


	local base_type
	if DescUtility:GetItemSubType(tid, cid) == TEMP_FOLDER_NAME[1] then
		base_type = string.format(ITEM_LIMIT_DESC[12], ITEM_SPECIAL_TYPE_NMAE[1])
	else
		base_type = string.format(ITEM_LIMIT_DESC[12], DescUtility:GetItemBaseType(cid))
	end
	if lua_act:IsFlyingVehicle( tid ) == 0 then
		tbl["info1"] = string.format(--[[!AUTO_108]]"%s\r%s", base_type,DescUtility:GetItemLevelLimit(tid, cid))
	else
		tbl["info1"] = string.format(--[[!AUTO_108]]"%s%s\r%s", base_type, DescUtility:GetItemSexLimit(tid, cid), DescUtility:GetItemLevelLimit(tid, cid))
	end

	--描述面板星级
	--s_t，s代表星数，-1不显示。t代表显示方案，0为正常，1为同步闪烁，2为待定

	tbl["star"] = --[[!AUTO_109]]"-1_0"

	--描述面板限制（左）与消耗（右）
	--用\r分割
	tbl["limitskill"] = DescUtility:GetVehicleLimit(tid, cid)

	--描述面板描述信息
	--用\r分割
	tbl["desc"] = DescUtility:GetVehicleProp(tid, cid)

	--描述面板附加信息
	--用\r分割
	tbl["remark"] = DescUtility:GetItemExtDesc(tid, cid, ext_tbl)
	--LogPrint(tbl["remark"])
	--tbl["remark"] = "^FFFFFF已绑定红马：忠心护主，寸步不离，行走江湖的好伙伴。"

	--描述面板价格信息
	--单位依次：文、贯、金、玉

	--描述面板声望消耗信息


	--描述面板物品兑换信息

	tbl["lab_money"], tbl["money1"], tbl["money2"], tbl["money3"], tbl["money4"], tbl["lab_fame"], tbl["fame"], tbl["lab_exchange"], tbl["exchange"], tbl["exchangepic"],tbl["npc_buy_bind"] = DescUtility:GetItemPrice(tid, cid, context_type, price_scale, ext_tbl)

	--描述面板元宝信息
	--单位依次：银元、金元


--返回数据：17项（09.12.11）

	return tbl

end

-- 组合聊天喇叭描述函数
function DescTool:GetSpakerDesc(tid,cid,context_type,price_scale,ext_tbl)

	tbl = {}

	--描述面板表头
	tbl["title"] = DescUtility:GetItemName(tid, cid)

	--描述面板图标
	tbl["icon"] = DescUtility:GetItemIcon(tid, cid)

	--描述面板表头
	--1最多3行，2最多1行，3最多2行（用\r分割）

	local base_type = string.format(ITEM_LIMIT_DESC[12], DescUtility:GetItemBaseType(cid))
	local quantity = string.format(ITEM_LIMIT_DESC[16],DescUtility:GetItemMaxQuantity(tid, cid))
	tbl["info1"] = string.format(--[[!AUTO_110]]"%s\r%s", base_type,quantity)

	--描述面板星级
	--s_t，s代表星数，-1不显示。t代表显示方案，0为正常，1为同步闪烁，2为待定

	tbl["star"] = --[[!AUTO_111]]"-1_0"

	--描述面板限制（左）与消耗（右）
	--用\r分割

	--描述面板描述信息
	--用\r分割
	if (tid == 90600 or tid == 90601 or tid == 90738 or tid == 94046  or tid == 98664  or tid == 104052  or tid == 106531  or tid == 106532  or tid == 106533) then
		tbl["limitskill"] = --[[!AUTO_112]]"使用：用千語頻道喊話時消耗"
	elseif (tid == 93442 or tid == 93625 or tid == 94047 or tid == 98665 or tid == 104053  or tid == 106534  or tid == 106535) then
		tbl["limitskill"] = --[[!AUTO_112]]"使用：用萬言頻道喊話時消耗"
	else
		tbl["limitskill"] = --[[!AUTO_112]]"使用：用獅吼頻道喊話時消耗"
	end
	--描述面板属性信息


	--用\r分割

	--描述面板附加信息
	--用\r分割
	tbl["remark"] = DescUtility:GetItemExtDesc(tid, cid, ext_tbl)

	--描述面板价格信息
	--单位依次：文、贯、金、玉

	--描述面板声望消耗信息


	--描述面板物品兑换信息

	tbl["lab_money"], tbl["money1"], tbl["money2"], tbl["money3"], tbl["money4"], tbl["lab_fame"], tbl["fame"], tbl["lab_exchange"], tbl["exchange"], tbl["exchangepic"],tbl["npc_buy_bind"] = DescUtility:GetItemPrice(tid, cid, context_type, price_scale, ext_tbl)

	--描述面板元宝信息
	--单位依次：银元、金元


--返回数据：17项（09.12.11）

	return tbl

end

-- 组合宠物牌描述函数

function DescTool:GetPetBedgeDesc(tid,cid,context_type,price_scale,ext_tbl)

	tbl = {}

	--描述面板表头
	tbl["title"] = DescUtility:GetItemName(tid, cid)

	--描述面板图标
	tbl["icon"] = DescUtility:GetItemIcon(tid, cid)

	--描述面板表头
	--1最多3行，2最多1行，3最多2行（用\r分割）

	local base_type = string.format(ITEM_LIMIT_DESC[12], DescUtility:GetItemBaseType(cid))
	local sub_type = string.format(ITEM_LIMIT_DESC[15],DescUtility:GetItemMajorType(tid, cid))
	tbl["info1"] = string.format(--[[!AUTO_113]]"%s\r%s%s", base_type,DescUtility:GetItemLevelLimit(tid, cid),DescUtility:GetItemProfLimit(tid, cid))

	--描述面板星级
	--s_t，s代表星数，-1不显示。t代表显示方案，0为正常，1为同步闪烁，2为待定

	tbl["star"] = --[[!AUTO_114]]"-1_0"

	--描述面板限制（左）与消耗（右）
	--用\r分割
	local reputeType,reputeVal = DescUtility:GetPetBedgeData(tid,cid)
	--tbl["limitleft"] = string.format(ITEM_LIMIT_DESC[10], DescUtility:GetItemLevelLimit(tid, cid), DescUtility:GetItemProfLimit(tid, cid), DescUtility:GetPetBedgeData(tid,cid))

	--描述面板描述信息
	--用\r分割

	--描述面板属性信息


	--用\r分割

	--描述面板附加信息
	--用\r分割
	tbl["remark"] = DescUtility:GetItemExtDesc(tid, cid, ext_tbl)

	--描述面板价格信息
	--单位依次：文、贯、金、玉
	tbl["lab_money"], tbl["money1"], tbl["money2"], tbl["money3"], tbl["money4"], tbl["lab_fame"], tbl["fame"], tbl["lab_exchange"], tbl["exchange"], tbl["exchangepic"],tbl["npc_buy_bind"] = DescUtility:GetItemPrice(tid, cid, context_type, price_scale, ext_tbl)

	--描述面板声望消耗信息


	--描述面板物品兑换信息

	--描述面板元宝信息
	--单位依次：银元、金元


--返回数据：17项（09.12.11）

	return tbl

end

-- 组合宠物技能书描述函数
function DescTool:GetPetSkillDesc(tid,cid,context_type,price_scale,ext_tbl)

	tbl = {}

	--描述面板表头
	tbl["title"] = DescUtility:GetItemName(tid, cid)

	--描述面板图标
	tbl["icon"] = DescUtility:GetItemIcon(tid, cid)

	--描述面板表头
	--1最多3行，2最多1行，3最多2行（用\r分割）

	local base_type = string.format(ITEM_LIMIT_DESC[17], DescUtility:GetPetSkillBookTypeDesc(tid,cid))
	tbl["info1"] = string.format(--[[!AUTO_115]]"%s\r%s%s", base_type,DescUtility:GetPetLevelLimit(tid, cid),DescUtility:GetPetCharLimit(tid, cid))

	--描述面板星级
	--s_t，s代表星数，-1不显示。t代表显示方案，0为正常，1为同步闪烁，2为待定

	tbl["star"] = --[[!AUTO_116]]"-1_0"

	--描述面板限制（左）与消耗（右）
	--用\r分割
	--tbl["limitleft"] = string.format(ITEM_LIMIT_DESC[1], DescUtility:GetPetLevelLimit(tid, cid), DescUtility:GetPetCharLimit(tid, cid))


	--描述面板描述信息
	--用\r分割
	local skillid,skilllv,booktype = DescUtility:GetPetSkillBookInfo(tid, cid)
	if PET_SKILL_BOOK_DESC[skillid] then
		if booktype == 1 then
			tbl["desc"] = string.format(--[[!AUTO_117]]"^FFFFFF%s",PET_SKILL_BOOK_DESC[skillid].desc)
		else
			tbl["desc"] = string.format(--[[!AUTO_118]]"^FFFFFF%s\r%s",PET_SKILL_BOOK_DESC[skillid].skilltype,PET_SKILL_BOOK_DESC[skillid].desc)
		end
	end

	tbl["strengthen"] = PET_SKILL_BOOK_USE_DESC[1]

	--描述面板属性信息


	--用\r分割

	--描述面板附加信息
	--用\r分割
	tbl["remark"] = DescUtility:GetItemExtDesc(tid, cid, ext_tbl)

	--描述面板价格信息
	--单位依次：文、贯、金、玉
	tbl["lab_money"], tbl["money1"], tbl["money2"], tbl["money3"], tbl["money4"], tbl["lab_fame"], tbl["fame"], tbl["lab_exchange"], tbl["exchange"], tbl["exchangepic"],tbl["npc_buy_bind"] = DescUtility:GetItemPrice(tid, cid, context_type, price_scale, ext_tbl)

	--描述面板声望消耗信息


	--描述面板物品兑换信息

	--描述面板元宝信息
	--单位依次：银元、金元


--返回数据：17项（09.12.11）


	return tbl

end

-- 组合宠物药品描述函数
function DescTool:GetPetMedicineDesc(tid,cid,context_type,price_scale,ext_tbl)

	tbl = {}

	--描述面板表头
	tbl["title"] = DescUtility:GetItemName(tid, cid)

	--描述面板图标
	tbl["icon"] = DescUtility:GetItemIcon(tid, cid)

	--描述面板表头
	--1最多3行，2最多1行，3最多2行（用\r分割）

	tbl["info2"] = string.format(ITEM_TYPE_DESC[1], DescUtility:GetItemBaseType(cid))

	--描述面板星级
	--s_t，s代表星数，-1不显示。t代表显示方案，0为正常，1为同步闪烁，2为待定

	tbl["star"] = --[[!AUTO_119]]"-1_0"

	--描述面板限制（左）与消耗（右）
	--用\r分割

	--描述面板描述信息
	--用\r分割

	--描述面板属性信息


	--用\r分割

	--描述面板附加信息
	--用\r分割
	tbl["remark"] = DescUtility:GetItemExtDesc(tid, cid, ext_tbl)

	--描述面板价格信息
	--单位依次：文、贯、金、玉

	--描述面板声望消耗信息


	--描述面板物品兑换信息

	tbl["lab_money"], tbl["money1"], tbl["money2"], tbl["money3"], tbl["money4"], tbl["lab_fame"], tbl["fame"], tbl["lab_exchange"], tbl["exchange"], tbl["exchangepic"],tbl["npc_buy_bind"] = DescUtility:GetItemPrice(tid, cid, context_type, price_scale, ext_tbl)

	--描述面板元宝信息
	--单位依次：银元、金元


--返回数据：17项（09.12.11）


	return tbl

end

-- 组合宠物洗点符描述函数




function DescTool:GetPetResetPropDesc(tid,cid,context_type,price_scale,ext_tbl)

	tbl = {}

	--描述面板表头
	tbl["title"] = DescUtility:GetItemName(tid, cid)

	--描述面板图标
	tbl["icon"] = DescUtility:GetItemIcon(tid, cid)

	--描述面板表头
	--1最多3行，2最多1行，3最多2行（用\r分割）

	local base_type = string.format(ITEM_LIMIT_DESC[21], DescUtility:GetItemBaseType(cid))
	local quantity = string.format(ITEM_LIMIT_DESC[22],DescUtility:GetItemMaxQuantity(tid, cid))
	tbl["info1"] = string.format(--[[!AUTO_120]]"%s\r%s%s", base_type,DescUtility:GetPetLevelLimit(tid, cid),quantity)

	--描述面板星级
	--s_t，s代表星数，-1不显示。t代表显示方案，0为正常，1为同步闪烁，2为待定

	tbl["star"] = --[[!AUTO_121]]"-1_0"

	--描述面板限制（左）与消耗（右）
	--用\r分割
	--tbl["limitleft"] = DescUtility:GetPetLevelLimit(tid, cid)

	--描述面板描述信息
	--用\r分割
	local resettype,resetnum = DescUtility:GetPetResetPropData(tid, cid)
	tbl["limitskill"] = PET_SKILL_BOOK_USE_DESC[2]
	--描述面板属性信息


	--用\r分割
	tbl["desc"] = string.format(--[[!AUTO_122]]"^FFFFFF使用後能洗去門徒已分配的%s屬性點，你可以重新分配這些屬性點。",resettype)
	--描述面板附加信息
	--用\r分割
	tbl["remark"] = DescUtility:GetItemExtDesc(tid, cid, ext_tbl)

	--描述面板价格信息
	--单位依次：文、贯、金、玉

	--描述面板声望消耗信息


	--描述面板物品兑换信息

	tbl["lab_money"], tbl["money1"], tbl["money2"], tbl["money3"], tbl["money4"], tbl["lab_fame"], tbl["fame"], tbl["lab_exchange"], tbl["exchange"], tbl["exchangepic"],tbl["npc_buy_bind"] = DescUtility:GetItemPrice(tid, cid, context_type, price_scale, ext_tbl)

	--描述面板元宝信息
	--单位依次：银元、金元


--返回数据：17项（09.12.11）


	return tbl

end

-- 组合宠物灵丹描述函数
function DescTool:GetPetAddPropDesc(tid,cid,context_type,price_scale,ext_tbl)

	tbl = {}

	--描述面板表头
	tbl["title"] = DescUtility:GetItemName(tid, cid)

	--描述面板图标
	tbl["icon"] = DescUtility:GetItemIcon(tid, cid)

	--描述面板表头
	--1最多3行，2最多1行，3最多2行（用\r分割）

	local base_type = string.format(ITEM_LIMIT_DESC[21], DescUtility:GetItemBaseType(cid))
	local quantity = string.format(ITEM_LIMIT_DESC[22],DescUtility:GetItemMaxQuantity(tid, cid))
	tbl["info1"] = string.format(--[[!AUTO_123]]"%s\r%s%s", base_type,DescUtility:GetPetLevelLimit(tid, cid),quantity)

	--描述面板星级
	--s_t，s代表星数，-1不显示。t代表显示方案，0为正常，1为同步闪烁，2为待定

	tbl["star"] = --[[!AUTO_124]]"-1_0"

	--描述面板限制（左）与消耗（右）
	--用\r分割
	tbl["limitskill"] = PET_SKILL_BOOK_USE_DESC[2]

	--描述面板描述信息
	--用\r分割
	local addtype,addnum = DescUtility:GetPetAddPropData(tid, cid)
	--tbl["strengthen"] = string.format("%s%s%s%s","^FFE673增加：^FFFFFF",addnum,"点",addtype)
	--描述面板属性信息


	--用\r分割
	tbl["desc"] = string.format(--[[!AUTO_125]]"^FFFFFF使用後能增加門徒%s點%s，但不會超過資質上限，每個門徒最多只能使用3顆靈丹。",addnum,addtype)
	--描述面板附加信息
	--用\r分割
	tbl["remark"] = DescUtility:GetItemExtDesc(tid, cid, ext_tbl)

	--描述面板价格信息
	--单位依次：文、贯、金、玉

	--描述面板声望消耗信息


	--描述面板物品兑换信息

	tbl["lab_money"], tbl["money1"], tbl["money2"], tbl["money3"], tbl["money4"], tbl["lab_fame"], tbl["fame"], tbl["lab_exchange"], tbl["exchange"], tbl["exchangepic"],tbl["npc_buy_bind"] = DescUtility:GetItemPrice(tid, cid, context_type, price_scale, ext_tbl)

	--描述面板元宝信息
	--单位依次：银元、金元


--返回数据：17项（09.12.11）


	return tbl

end

-- 组合宠物修为概率调整道具描述函数
function DescTool:GetPetAdjPowerPropDesc(tid,cid,context_type,price_scale,ext_tbl)
	tbl = {}
	--描述面板表头
	tbl["title"] = DescUtility:GetItemName(tid, cid)
	--描述面板图标
	tbl["icon"] = DescUtility:GetItemIcon(tid, cid)
	--描述面板表头
	--1最多3行，2最多1行，3最多2行（用\r分割）
	local base_type = string.format(ITEM_LIMIT_DESC[12], DescUtility:GetItemBaseType(cid))
	local quantity = string.format(ITEM_LIMIT_DESC[16],DescUtility:GetItemMaxQuantity(tid, cid))
	tbl["info1"] = string.format(--[[!AUTO_126]]"%s\r%s", base_type,quantity)
	--描述面板星级
	--s_t，s代表星数，-1不显示。t代表显示方案，0为正常，1为同步闪烁，2为待定
	tbl["star"] = --[[!AUTO_127]]"-1_0"
	--描述面板限制（左）与消耗（右）
	--用\r分割
	--描述面板描述信息
	--用\r分割
	--描述面板属性信息
	--用\r分割
	--描述面板附加信息
	--用\r分割
	tbl["remark"] = DescUtility:GetItemExtDesc(tid, cid, ext_tbl)
	--描述面板价格信息
	--单位依次：文、贯、金、玉
	--描述面板声望消耗信息
	--描述面板物品兑换信息
	tbl["lab_money"], tbl["money1"], tbl["money2"], tbl["money3"], tbl["money4"], tbl["lab_fame"], tbl["fame"], tbl["lab_exchange"], tbl["exchange"], tbl["exchangepic"],tbl["npc_buy_bind"] = DescUtility:GetItemPrice(tid, cid, context_type, price_scale, ext_tbl)
	--描述面板元宝信息
	--单位依次：银元、金元
	return tbl
end

-- 组合任务物品生成器描述函数




function DescTool:GetTaskItemGeneratorDesc(tid,cid,context_type,price_scale,ext_tbl)

	tbl = {}

	--描述面板表头
	tbl["title"] = DescUtility:GetItemName(tid, cid)

	--描述面板图标
	tbl["icon"] = DescUtility:GetItemIcon(tid, cid)

	--描述面板表头
	--1最多3行，2最多1行，3最多2行（用\r分割）

	local base_type = string.format(ITEM_LIMIT_DESC[12], DescUtility:GetItemBaseType(cid))
	tbl["info1"] = string.format(--[[!AUTO_128]]"%s", base_type)

	--描述面板星级
	--s_t，s代表星数，-1不显示。t代表显示方案，0为正常，1为同步闪烁，2为待定

	tbl["star"] = --[[!AUTO_129]]"-1_0"

	--描述面板限制（左）与消耗（右）
	--用\r分割

	--描述面板描述信息
	--用\r分割

	--描述面板属性信息


	--用\r分割

	--描述面板附加信息
	--用\r分割
	tbl["remark"] = DescUtility:GetItemExtDesc(tid, cid, ext_tbl)

	--描述面板价格信息
	--单位依次：文、贯、金、玉

	--描述面板声望消耗信息


	--描述面板物品兑换信息

	tbl["lab_money"], tbl["money1"], tbl["money2"], tbl["money3"], tbl["money4"], tbl["lab_fame"], tbl["fame"], tbl["lab_exchange"], tbl["exchange"], tbl["exchangepic"],tbl["npc_buy_bind"] = DescUtility:GetItemPrice(tid, cid, context_type, price_scale, ext_tbl)

	--描述面板元宝信息
	--单位依次：银元、金元


	return tbl

end

-- 组合宠物通用药品描述函数
function DescTool:GetPetNormalMedicineDesc(tid,cid,context_type,price_scale,ext_tbl)

	tbl = {}

	--描述面板表头
	tbl["title"] = DescUtility:GetItemName(tid, cid)

	--描述面板图标
	tbl["icon"] = DescUtility:GetItemIcon(tid, cid)

	--描述面板表头
	--1最多3行，2最多1行，3最多2行（用\r分割）

	local medicinetype, medicineval = DescUtility:GetPetNormalMedicineData(tid, cid)
	local base_type = string.format(ITEM_LIMIT_DESC[21], PET_NORMAL_MEDICINE_TYPE[medicinetype])
	local quantity = string.format(ITEM_LIMIT_DESC[22],DescUtility:GetItemMaxQuantity(tid, cid))
	tbl["info1"] = string.format(--[[!AUTO_130]]"%s\r%s%s", base_type,DescUtility:GetPetLevelLimit(tid, cid),quantity)

	--描述面板星级
	--s_t，s代表星数，-1不显示。t代表显示方案，0为正常，1为同步闪烁，2为待定

	tbl["star"] = --[[!AUTO_131]]"-1_0"

	--描述面板限制（左）与消耗（右）
	--用\r分割
	tbl["limitskill"] = PET_SKILL_BOOK_USE_DESC[2]

	--描述面板描述信息
	--用\r分割
	--描述面板属性信息

	--用\r分割


	if medicinetype == 0 then
	    --tbl["strengthen"] = string.format("%s%s%s","^FFE673回复：^FFFFFF",medicineval,"点生命")
		tbl["desc"] = string.format(--[[!AUTO_132]]"%s%s%s",--[[!AUTO_133]]"^FFFFFF使用後可回復門徒",medicineval,--[[!AUTO_134]]"點氣血值。")
	elseif medicinetype == 1 then
	    --tbl["strengthen"] = string.format("%s%s%s","^FFE673回复：^FFFFFF",medicineval,"点气力")
		tbl["desc"] = string.format(--[[!AUTO_135]]"%s%s%s",--[[!AUTO_136]]"^FFFFFF使用後可回復門徒",medicineval,--[[!AUTO_137]]"點氣力值。")
	elseif medicinetype == 2 then
		tbl["info1"] = string.format(--[[!AUTO_138]]"%s\r%s冷卻時間：%s\r%s", base_type,DescUtility:GetPetLevelLimit(tid, cid),DescUtility:GetCoolDownDesc(tid, cid),quantity)
	    --tbl["strengthen"] = string.format("%s%s%s","^FFE673回复：^FFFFFF",medicineval,"点XP")
		tbl["desc"] = string.format(--[[!AUTO_139]]"%s%s%s",--[[!AUTO_140]]"^FFFFFF使用後可回復門徒",medicineval,--[[!AUTO_141]]"點怒氣。")
	elseif medicinetype == 3 then
	    --tbl["limitskill"] = ""
	    tbl["desc"] = string.format(--[[!AUTO_142]]"%s",--[[!AUTO_143]]"^FFFFFF使用後可以使門徒還童為1級靈機門徒，使用越高級的還童藥品越容易得到高資質的門徒。")
	elseif medicinetype == 4 then
	    --tbl["limitskill"] = ""
	    tbl["desc"] = string.format(--[[!AUTO_144]]"%s",--[[!AUTO_145]]"^FFFFFF使用後可以解除門徒的走火入魔狀態。")
	elseif medicinetype == 5 then
	    --tbl["limitskill"] = string.format("%s%s%s","^FFE673增加：^FFFFFF",medicineval,"点寿命")
	    tbl["desc"] = string.format(--[[!AUTO_146]]"%s%s%s",--[[!AUTO_147]]"^FFFFFF使用後可以增加門徒",medicineval,--[[!AUTO_148]]"點壽命，但不會超過壽命上限。")
	elseif medicinetype == 6 then
	    local expleft = ext_tbl["EnergyLeft"]
	    if expleft < medicineval and expleft > 0 then
	    	--tbl["limitskill"] = string.format("%s%s%s","^FFE673增加：^FFFFFF",expleft,"点门徒经验")
			tbl["desc"] = string.format(--[[!AUTO_149]]"%s%s%s",--[[!AUTO_150]]"^FFFFFF還可增加門徒",expleft,--[[!AUTO_151]]"點歷練。(每次使用最多只能提升門徒等級1級，若歷練值未使用完，仍然可以繼續使用。)")
	    else
	        --tbl["limitskill"] = string.format("%s%s%s","^FFE673增加：^FFFFFF",medicineval,"点门徒经验")
	    	tbl["desc"] = string.format(--[[!AUTO_152]]"%s%s%s",--[[!AUTO_153]]"^FFFFFF使用後可增加門徒",medicineval,--[[!AUTO_154]]"點門徒歷練。(每次使用最多只能提升門徒等級1級，若歷練值未使用完，則可繼續使用。)")
	    end
	    elseif medicinetype == 7 then
	    --tbl["limitskill"] = string.format("%s%s%s","^FFE673增加：^FFFFFF",medicineval,"点忠诚度")
	    tbl["desc"] = string.format(--[[!AUTO_155]]"%s%s%s",--[[!AUTO_156]]"^FFFFFF使用後可以增加門徒",medicineval,--[[!AUTO_157]]"點忠誠度，但不會超過忠誠度上限。")
	--else
	    --tbl["tiplimitskill"] = ""
	    --tbl["tipdesc"] = ""
	end

	--描述面板附加信息
	--用\r分割
	tbl["remark"] = DescUtility:GetItemExtDesc(tid, cid, ext_tbl)

	--描述面板价格信息
	--单位依次：文、贯、金、玉

	--描述面板声望消耗信息


	--描述面板物品兑换信息

	tbl["lab_money"], tbl["money1"], tbl["money2"], tbl["money3"], tbl["money4"], tbl["lab_fame"], tbl["fame"], tbl["lab_exchange"], tbl["exchange"], tbl["exchangepic"],tbl["npc_buy_bind"] = DescUtility:GetItemPrice(tid, cid, context_type, price_scale, ext_tbl)

	--描述面板元宝信息
	--单位依次：银元、金元


	return tbl

end

-- 组合礼物描述函数
function DescTool:GetGiftDesc(tid,cid,context_type,price_scale,ext_tbl)

	tbl = {}

	--描述面板表头
	tbl["title"] = DescUtility:GetItemName(tid, cid)

	--描述面板图标
	tbl["icon"] = DescUtility:GetItemIcon(tid, cid)

	--礼物属性整理

	local giftfavor, giftcharm, giftskillid, giftskilllv, giftuseprop = DescUtility:GetGiftBaseInfo(tid, cid)
	local giftstate, giftsendtime, giftsender, giftreceiver, giftmessage = DescUtility:GetGiftPropInfo(ext_tbl)

	--描述面板表头
	--1最多3行，2最多1行，3最多2行（用\r分割）

	local base_type = string.format(ITEM_LIMIT_DESC[12], DescUtility:GetItemBaseType(cid))
	tbl["info1"] = base_type
	if giftstate == false then
		tbl["info1"] = string.format(--[[!AUTO_158]]"%s\r^72FE00狀態：%s",tbl["info1"], GIFT_TO_BE_SEND_TEXT)
		tbl["limitskill"] = GIFT_USE_TYPE
	else
		tbl["info1"] = string.format(--[[!AUTO_159]]"%s\r狀態：%s",tbl["info1"], GIFT_RECEIVED_TEXT)
		if giftskillid > 0 then
			tbl["limitskill"] = --[[!AUTO_160]]"使用：右鍵點擊"
		end
	end
	local quantity = string.format(ITEM_LIMIT_DESC[16],DescUtility:GetItemMaxQuantity(tid, cid))
	tbl["info1"] = string.format(--[[!AUTO_161]]"%s\r%s", tbl["info1"],quantity)

	--描述面板星级
	--s_t，s代表星数，-1不显示。t代表显示方案，0为正常，1为同步闪烁，2为待定

	tbl["star"] = --[[!AUTO_162]]"-1_0"

	--描述面板限制（左）与消耗（右）
	--用\r分割
	tbl["limitskill"] = GIFT_USE_TYPE
	--描述面板描述信息
	--用\r分割
	if giftcharm <= 0 and giftskillid <= 0 and giftfavor <= 0 then
		tbl["strengthen"] = GIFT_INFO_NONE
	else
		local scharm, sskill, sfavor
		if giftcharm > 0 then
			scharm = string.format(GIFT_INFO1, giftcharm)
		else
			scharm = --[[!AUTO_163]]""
		end
		if giftskillid > 0 then
			sskill = string.format(GIFT_INFO2, giftskilllv, DescUtility:GetSkillName(giftskillid))
		else
			sskill = --[[!AUTO_164]]""
		end
		if giftfavor > 0 then
			if giftstate == false then
				sfavor = string.format(GIFT_INF04, giftfavor)
			else
				sfavor = string.format(GIFT_INFO3, giftsender, giftfavor)
			end
		else
			sfavor = --[[!AUTO_165]]""
		end
		tbl["strengthen"] = string.format(GIFT_INFO_STYLE, scharm, sskill, sfavor)
	end

	--描述面板属性信息


	--用\r分割
	if giftstate == false then
		tbl["desc"] = GIFT_CONTENT_NEEDWRITE
	else
		local ssender, sreceiver, ssendtime,smessage
		if giftmessage == --[[!AUTO_166]]"" then
			smessage  = GIFT_CONTENT_NONE
			ssendtime = string.format(ITEM_TYPE_DESC[4],giftsendtime,smessage)
			sreceiver = string.format(GIFT_CONTENT_RECEIVER, giftreceiver,ssendtime )
			ssender = string.format(GIFT_CONTENT_SENDER, giftsender,sreceiver)
			tbl["desc"] = ssender
		else
			smessage  = string.format(GIFT_CONTENT, giftmessage)
			ssendtime = string.format(ITEM_TYPE_DESC[4],giftsendtime,smessage)
			sreceiver = string.format(GIFT_CONTENT_RECEIVER, giftreceiver,ssendtime )
			ssender = string.format(GIFT_CONTENT_SENDER, giftsender,sreceiver)
			tbl["desc"] = ssender
		end
	end

	--描述面板附加信息
	--用\r分割
	tbl["remark"] = DescUtility:GetItemExtDesc(tid, cid, ext_tbl)

	--描述面板价格信息
	--单位依次：文、贯、金、玉

	--描述面板声望消耗信息


	--描述面板物品兑换信息

	tbl["lab_money"], tbl["money1"], tbl["money2"], tbl["money3"], tbl["money4"], tbl["lab_fame"], tbl["fame"], tbl["lab_exchange"], tbl["exchange"], tbl["exchangepic"],tbl["npc_buy_bind"] = DescUtility:GetItemPrice(tid, cid, context_type, price_scale, ext_tbl)

	--描述面板元宝信息
	--单位依次：银元、金元


	return tbl

end

-- 召怪物品描述函数

function DescTool:GetSummonItemDesc(tid,cid,context_type,price_scale,ext_tbl)

	tbl = {}

	--描述面板表头
	tbl["title"] = DescUtility:GetItemName(tid, cid)

	--描述面板图标
	tbl["icon"] = DescUtility:GetItemIcon(tid, cid)

	--描述面板表头
	--1最多3行，2最多1行，3最多2行（用\r分割）

	tbl["info2"] = string.format(ITEM_TYPE_DESC[1], DescUtility:GetItemBaseType(cid))

	--描述面板星级
	--s_t，s代表星数，-1不显示。t代表显示方案，0为正常，1为同步闪烁，2为待定

	tbl["star"] = --[[!AUTO_167]]"-1_0"

	--描述面板限制（左）与消耗（右）
	--用\r分割
	tbl["limitleft"] = DescUtility:GetItemLevelLimit(tid, cid)

	--描述面板描述信息
	--用\r分割

	--描述面板属性信息


	--用\r分割
	tbl["desc"] = string.format(--[[!AUTO_168]]"%s",--[[!AUTO_169]]"^9BF0FF非常強大的神秘物品，能夠喚出各類靈獸。")

	--描述面板附加信息
	--用\r分割
	tbl["remark"] = DescUtility:GetItemExtDesc(tid, cid, ext_tbl)

	--描述面板价格信息
	--单位依次：文、贯、金、玉

	--描述面板声望消耗信息


	--描述面板物品兑换信息

	tbl["lab_money"], tbl["money1"], tbl["money2"], tbl["money3"], tbl["money4"], tbl["lab_fame"], tbl["fame"], tbl["lab_exchange"], tbl["exchange"], tbl["exchangepic"],tbl["npc_buy_bind"] = DescUtility:GetItemPrice(tid, cid, context_type, price_scale, ext_tbl)

	--描述面板元宝信息
	--单位依次：银元、金元


--返回数据：17项（09.12.11）


	return tbl

end


-- 组合彩票描述函数
function DescTool:GetLotteryDesc(tid,cid,context_type,price_scale,ext_tbl)

	tbl = {}

	local bShowUnopenInfo = ext_tbl["Dice"] == nil or ext_tbl["Dice"][1] == 0	-- 注：在彩票描述中，ext_tbl 为空表
	
	--描述面板表头
	if bShowUnopenInfo then
		tbl["title"] = DescUtility:GetItemName(tid, cid)
	else
		tbl["title"] = DescUtility:GetLotteryOpenedName(tid, cid)
	end

	--描述面板图标
	if bShowUnopenInfo then
		tbl["icon"] = DescUtility:GetItemIcon(tid, cid)
	else
		tbl["icon"] = DescUtility:GetLotteryOpenedIcon(tid, cid)
	end

	--描述面板表头
	--1最多3行，2最多1行，3最多2行（用\r分割）

	local base_type = string.format(ITEM_LIMIT_DESC[12], DescUtility:GetItemBaseType(cid))
	tbl["info1"] = string.format(--[[!AUTO_170]]"%s\r%s%s",base_type,DescUtility:GetItemLevelLimit(tid, cid),DescUtility:GetItemProfLimit(tid, cid))
	if bShowUnopenInfo then
		tbl["info1"] = string.format(--[[!AUTO_171]]"%s%s",tbl["info1"],ITEM_LOTTERY_HINT_UNOPENED)
	else
		tbl["info1"] = string.format(--[[!AUTO_172]]"%s%s",tbl["info1"],ITEM_LOTTERY_HINT_PRESENTS)
	end

	--描述面板星级
	--s_t，s代表星数，-1不显示。t代表显示方案，0为正常，1为同步闪烁，2为待定

	tbl["star"] = --[[!AUTO_173]]"-1_0"

	--描述面板限制（左）与消耗（右）
	--用\r分割
	--tbl["limitleft"] = string.format(ITEM_LIMIT_DESC[1], DescUtility:GetItemLevelLimit(tid, cid), DescUtility:GetItemProfLimit(tid, cid))

	--描述面板描述信息
	--用\r分割
	tbl["limitskill"] = string.format(--[[!AUTO_174]]"使用：右鍵點擊\r%s", DescUtility:GetLotteryInventory(tid, cid))

	--描述面板属性信息

	--用\r分割
	if tid == 81169 then
		base_type = string.format(ITEM_LIMIT_DESC[12], ITEM_CLASS_DESC[44])
		local quantity = string.format(ITEM_LIMIT_DESC[16],DescUtility:GetItemMaxQuantity(tid, cid))
		tbl["info1"] = string.format(--[[!AUTO_362]]"%s\r%s", base_type,quantity)
		tbl["limitskill"] = ""
	end

	--描述面板附加信息
	--用\r分割
	tbl["remark"] = DescUtility:GetItemExtDesc(tid, cid, ext_tbl)

	--描述面板价格信息
	--单位依次：文、贯、金、玉

	--描述面板声望消耗信息


	--描述面板物品兑换信息

	tbl["lab_money"], tbl["money1"], tbl["money2"], tbl["money3"], tbl["money4"], tbl["lab_fame"], tbl["fame"], tbl["lab_exchange"], tbl["exchange"], tbl["exchangepic"],tbl["npc_buy_bind"] = DescUtility:GetItemPrice(tid, cid, context_type, price_scale, ext_tbl)

	--描述面板元宝信息
	--单位依次：银元、金元


--返回数据：17项（09.12.11）

	return tbl

end


-- 组合错误物品描述函数
function DescTool:GetErrorItemDesc(tid,cid,context_type,price_scale,ext_tbl)

	tbl = {}

	--描述面板表头
	tbl["title"] = string.format(--[[!AUTO_175]]"%s%s", ITEM_COLOR_DESC_ERRORITEM, ITEM_TITLE_ERROR)

	--描述面板图标
	tbl["icon"] = --[[!AUTO_176]]"00752未知物品.dds"

	--描述面板表头
	--1最多3行，2最多1行，3最多2行（用\r分割）

	tbl["info1"] = string.format(ITEM_TYPE_DESC[2], ITEM_COLOR_DESC_ERRORITEM, ITEM_TITLE_UNKNOWN)
	tbl["info2"] = string.format(ITEM_TYPE_DESC[1], DescUtility:GetItemBaseType(cid))

	--描述面板星级
	--s_t，s代表星数，-1不显示。t代表显示方案，0为正常，1为同步闪烁，2为待定

	tbl["star"] = --[[!AUTO_177]]"-1_0"

	--描述面板限制（左）与消耗（右）
	--用\r分割

	--描述面板描述信息
	--用\r分割

	--描述面板属性信息


	--用\r分割

	--描述面板附加信息
	--用\r分割
	tbl["remark"] = DescUtility:GetItemExtDesc(tid, cid, ext_tbl)

	--描述面板价格信息
	--单位依次：文、贯、金、玉

	--描述面板声望消耗信息


	--描述面板物品兑换信息

	tbl["lab_money"], tbl["money1"], tbl["money2"], tbl["money3"], tbl["money4"], tbl["lab_fame"], tbl["fame"], tbl["lab_exchange"], tbl["exchange"], tbl["exchangepic"],tbl["npc_buy_bind"] = DescUtility:GetItemPrice(tid, cid, context_type, price_scale, ext_tbl)

	--描述面板元宝信息
	--单位依次：银元、金元


	return tbl

end

-- 组合未知物品描述函数
-- 不可能调到，因为有确认的id一定有确认的类型


-- 组合种子描述函数

function DescTool:GetCROPSEEDDesc(tid,cid,context_type,price_scale,ext_tbl)

	tbl = {}

	--描述面板表头
	tbl["title"] = DescUtility:GetItemName(tid, cid)

	--描述面板图标
	tbl["icon"] = DescUtility:GetItemIcon(tid, cid)

	--描述面板表头
	--1最多3行，2最多1行，3最多2行（用\r分割）

	local base_type = string.format(ITEM_LIMIT_DESC[12], DescUtility:GetItemBaseType(cid))
	local quantity = string.format(ITEM_LIMIT_DESC[16],DescUtility:GetItemMaxQuantity(tid, cid))
	tbl["info1"] = string.format(--[[!AUTO_178]]"%s\r%s\r%s", base_type,DescUtility:GetSeedSkillInfo(tid, cid),quantity)

	--描述面板星级
	--s_t，s代表星数，-1不显示。t代表显示方案，0为正常，1为同步闪烁，2为待定

	tbl["star"] = --[[!AUTO_179]]"-1_0"

	--描述面板限制（左）与消耗（右）
	--用\r分割

	--描述面板描述信息
	--用\r分割
	tbl["limitskill"] = --[[!AUTO_180]]"使用：種植對應作物時自動消耗"

	--描述面板属性信息


	--用\r分割
	tbl["desc"] = --[[!AUTO_181]]"主要產物："..DescUtility:GetGrowItem(tid, cid)..--[[!AUTO_182]]"\r種植時間："..DescUtility:GetGrowingTime(tid, cid)..--[[!AUTO_183]]"分鐘\r種植產量："..DescUtility:GetGrowItemNum(tid, cid)..--[[!AUTO_184]]"\r精耕時間："..DescUtility:GetFineGrowingTime(tid, cid)..--[[!AUTO_185]]"分鐘\r精耕產量："..DescUtility:GetGrowFineItemNum(tid, cid)


	--描述面板附加信息
	--用\r分割
	tbl["remark"] = DescUtility:GetItemExtDesc(tid, cid, ext_tbl)

	--描述面板价格信息
	--单位依次：文、贯、金、玉

	--描述面板声望消耗信息


	--描述面板物品兑换信息

	tbl["lab_money"], tbl["money1"], tbl["money2"], tbl["money3"], tbl["money4"], tbl["lab_fame"], tbl["fame"], tbl["lab_exchange"], tbl["exchange"], tbl["exchangepic"],tbl["npc_buy_bind"] = DescUtility:GetItemPrice(tid, cid, context_type, price_scale, ext_tbl)

	--描述面板元宝信息
	--单位依次：银元、金元


--[[
	--描述面板价格信息
	--单位依次：文、贯、金、玉
	local tiplabmoney = ""
	local tipmoney1 = ""
	local tipmoney2 = ""
	local tipmoney3 = ""
	local tipmoney4 = ""
	tiplabmoney = "单价"
	tipmoney1 = "500"
	tipmoney2 = "2"

	--描述面板声望消耗信息

	local tiplabfame = ""
	local tipfame = ""
	tiplabfame = "接受条件"
	tipfame = "200江湖威望"

	--描述面板物品兑换信息
	local tiplabexchange = ""
	local tipexchange = ""
	local tipexchangepic = ""
	tiplabexchange = "交换条件"
	tipexchange = "1 × " .. DescUtility:GetItemName(tid, cid)
	tipexchangepic = DescUtility:GetItemIcon(tid, cid)

	--描述面板元宝信息
	--单位依次：银元、金元

	local tiplabxcash = ""
	local tipgold1 = ""
	local tipgold2 = ""
	tiplabxcash = "快递价格"
	tipgold1 = "00"
	tipgold2 = "10"
]]--

	return tbl

end


-- 组合普通物品描述函数

function DescTool:GetNormalItemDesc(tid,cid,context_type,price_scale,ext_tbl)

	tbl = {}

	--描述面板表头
	tbl["title"] = DescUtility:GetItemName(tid, cid)

	--描述面板图标
	tbl["icon"] = DescUtility:GetItemIcon(tid, cid)

	--描述面板表头
	--1最多3行，2最多1行，3最多2行（用\r分割）

	local type_id = DescUtility:GetNormalItemType(tid, cid)
	local base_type = string.format(ITEM_LIMIT_DESC[12],NORMAL_ITEM_TYPE_DESC[type_id].type_desc)
	local quantity = string.format(ITEM_LIMIT_DESC[16],DescUtility:GetItemMaxQuantity(tid, cid))
	tbl["info1"] = string.format(--[[!AUTO_186]]"%s\r%s", base_type,quantity)

	--描述面板星级
	--s_t，s代表星数，-1不显示。t代表显示方案，0为正常，1为同步闪烁，2为待定

	tbl["star"] = --[[!AUTO_187]]"-1_0"

	--描述面板限制（左）与消耗（右）
	--用\r分割

	--描述面板描述信息
	--用\r分割
	tbl["limitskill"] = NORMAL_ITEM_TYPE_DESC[type_id].use_desc

	--描述面板属性信息


	--用\r分割

	--描述面板附加信息
	--用\r分割
	tbl["remark"] = DescUtility:GetItemExtDesc(tid, cid, ext_tbl)

	--描述面板价格信息
	--单位依次：文、贯、金、玉

	--描述面板声望消耗信息


	--描述面板物品兑换信息

	tbl["lab_money"], tbl["money1"], tbl["money2"], tbl["money3"], tbl["money4"], tbl["lab_fame"], tbl["fame"], tbl["lab_exchange"], tbl["exchange"], tbl["exchangepic"],tbl["npc_buy_bind"] = DescUtility:GetItemPrice(tid, cid, context_type, price_scale, ext_tbl)

	--描述面板元宝信息
	--单位依次：银元、金元


--[[
	--描述面板价格信息
	--单位依次：文、贯、金、玉
	local tiplabmoney = ""
	local tipmoney1 = ""
	local tipmoney2 = ""
	local tipmoney3 = ""
	local tipmoney4 = ""
	tiplabmoney = "单价"
	tipmoney1 = "500"
	tipmoney2 = "2"

	--描述面板声望消耗信息

	local tiplabfame = ""
	local tipfame = ""
	tiplabfame = "接受条件"
	tipfame = "200江湖威望"

	--描述面板物品兑换信息
	local tiplabexchange = ""
	local tipexchange = ""
	local tipexchangepic = ""
	tiplabexchange = "交换条件"
	tipexchange = "1 × " .. DescUtility:GetItemName(tid, cid)
	tipexchangepic = DescUtility:GetItemIcon(tid, cid)

	--描述面板元宝信息
	--单位依次：银元、金元

	local tiplabxcash = ""
	local tipgold1 = ""
	local tipgold2 = ""
	tiplabxcash = "快递价格"
	tipgold1 = "00"
	tipgold2 = "10"
]]--
	return tbl

end

-- 资质描述函数
function DescTool:GetAplititudeDesc(tid, level)

	--LogPrint(string.format("资质ID：%d，资质等级：%d", tid, level))

	tbl = {}

	--描述面板表头
	tbl["title"] = DescUtility:GetAplititudeName(tid)

	--描述面板图标
	tbl["icon"] = DescUtility:GetAplititudeIcon(tid)

	--描述面板表头
	--1最多3行，2最多1行，3最多2行（用\r分割）

	tbl["info1"] = string.format(ITEM_TYPE_DESC[1], DescUtility:GetAplititudeLevel(tid, level))
	tbl["info2"] = string.format(ITEM_TYPE_DESC[1], --[[!AUTO_188]]"資質")
	tbl["info3"] = string.format(ITEM_TYPE_DESC[1], DescUtility:GetAplititudeType(tid))

	--描述面板星级
	--s_t，s代表星数，-1不显示。t代表显示方案，0为正常，1为同步闪烁，2为待定

	tbl["star"] = --[[!AUTO_189]]"-1_0"

	--描述面板限制（左）与消耗（右）
	--用\r分割
	--tbl["limitleft"] = "限制条件"
	tbl["limitleft"] = string.format(ITEM_LIMIT_DESC[1], DescUtility:GetItemLevelLimit(tid, ClassType.ICID_APLITITUDE), DescUtility:GetItemProfLimit(tid, ClassType.ICID_APLITITUDE))

	--描述面板描述信息
	--用\r分割
	tbl["desc"] = DescUtility:GetAplititudeEffect(tid, level)

	--描述面板属性信息


	--用\r分割

	--描述面板附加信息
	--用\r分割
	--tbl["remark"] = DescUtility:GetItemExtDesc(tid, cid, ext_tbl)

	--描述面板价格信息
	--单位依次：文、贯、金、玉

	--描述面板声望消耗信息


	--描述面板物品兑换信息

	--描述面板元宝信息
	--单位依次：银元、金元


	return tbl

end

-- 修练描述函数
function DescTool:GetPractiseDesc(tid)

	tbl = {}

	--描述面板表头
	tbl["title"] = --[[!AUTO_190]]"修練描述"

	--描述面板图标
	tbl["icon"] = --[[!AUTO_191]]"02251表情行为.dds"

	--描述面板表头
	--1最多3行，2最多1行，3最多2行（用\r分割）

	tbl["info1"] = --[[!AUTO_192]]"門派"
	tbl["info2"] = --[[!AUTO_193]]"修練"
	tbl["info3"] = --[[!AUTO_194]]"類型"

	--描述面板星级
	--s_t，s代表星数，-1不显示。t代表显示方案，0为正常，1为同步闪烁，2为待定

	tbl["star"] = --[[!AUTO_195]]"-1_0"

	--描述面板限制（左）与消耗（右）
	tbl["limitleft"] = --[[!AUTO_196]]"限制條件"
	tbl["limitright"] = --[[!AUTO_197]]"消耗條件"
	--用\r分割

	--描述面板描述信息
	--用\r分割
	tbl["desc"] = --[[!AUTO_198]]"這裡是修練的描述資訊"

	--描述面板属性信息

	--用\r分割

	--描述面板附加信息
	--用\r分割
	--tbl["remark"] = DescUtility:GetItemExtDesc(tid, cid, ext_tbl)

	--描述面板价格信息
	--单位依次：文、贯、金、玉

	--描述面板声望消耗信息


	--描述面板物品兑换信息

	--描述面板元宝信息
	--单位依次：银元、金元


	return tbl

end

--幼崽描述函数
function DescTool:GetBreedcubDesc(tid,cid,context_type,price_scale,ext_tbl)

	tbl = {}

	--描述面板表头
	tbl["title"] = DescUtility:GetItemName(tid, cid)



	--描述面板图标
	tbl["icon"] = DescUtility:GetItemIcon(tid, cid)

	--描述面板表头
	--1最多3行，2最多1行，3最多2行（用\r分割）

	local base_type = string.format(ITEM_LIMIT_DESC[12], DescUtility:GetItemBaseType(cid))
	local quantity = string.format(ITEM_LIMIT_DESC[16],DescUtility:GetItemMaxQuantity(tid, cid))
	tbl["info1"] = string.format(--[[!AUTO_199]]"%s\r%s\r%s", base_type,DescUtility:GetBreedSkillInfo(tid, cid),quantity)

	--描述面板星级
	--s_t，s代表星数，-1不显示。t代表显示方案，0为正常，1为同步闪烁，2为待定

	tbl["star"] = --[[!AUTO_200]]"-1_0"

	--描述面板限制（左）与消耗（右）
	--用\r分割

	--描述面板描述信息
	--用\r分割
	tbl["limitskill"] = --[[!AUTO_201]]"使用：養殖對應動物時自動消耗"

	--描述面板属性信息


	--用\r分割
	tbl["desc"] = --[[!AUTO_202]]"主要產物："..DescUtility:GetBreedItem(tid, cid)..--[[!AUTO_203]]"\r^FFFFFF養殖時間："..DescUtility:GetBreedTime(tid, cid)..--[[!AUTO_204]]"分鐘\r^FFFFFF使用飼料："..DescUtility:GetBreedWith(tid, cid)


	--描述面板附加信息
	--用\r分割
	tbl["remark"] = DescUtility:GetItemExtDesc(tid, cid, ext_tbl)

	--描述面板价格信息
	--单位依次：文、贯、金、玉

	--描述面板声望消耗信息


	--描述面板物品兑换信息

	tbl["lab_money"], tbl["money1"], tbl["money2"], tbl["money3"], tbl["money4"], tbl["lab_fame"], tbl["fame"], tbl["lab_exchange"], tbl["exchange"], tbl["exchangepic"],tbl["npc_buy_bind"] = DescUtility:GetItemPrice(tid, cid, context_type, price_scale, ext_tbl)

	--描述面板元宝信息
	--单位依次：银元、金元


	return tbl

end

--怪物控制卷轴
function DescTool:GetMonsterCtrlDesc(tid,cid,context_type,price_scale,ext_tbl)

	tbl = {}

	--描述面板表头
	tbl["title"] = DescUtility:GetItemName(tid, cid)

	--描述面板图标
	tbl["icon"] = DescUtility:GetItemIcon(tid, cid)

	--描述面板表头
	--1最多3行，2最多1行，3最多2行（用\r分割）

	local base_type = string.format(ITEM_LIMIT_DESC[21], DescUtility:GetItemBaseType(cid))
	local _, use_times = DescUtility:GetItemDBProp(tid, cid, --[[!AUTO_205]]"可使用次數")
	use_times = string.format(ITEM_LIMIT_DESC[19], use_times)
	tbl["info1"] = string.format(--[[!AUTO_206]]"%s\r%s", base_type,use_times)

	--描述面板星级
	--s_t，s代表星数，-1不显示。t代表显示方案，0为正常，1为同步闪烁，2为待定

	tbl["star"] = --[[!AUTO_207]]"-1_0"

	--描述面板限制（左）与消耗（右）
	--用\r分割

	--描述面板描述信息
	--用\r分割

	--描述面板属性信息

	--用\r分割
	tbl["limitskill"] = --[[!AUTO_208]]"使用：在目標地點右鍵點擊"
	local scene_id, x, z, x_range, z_range = DescUtility:GetLimitSceneInfo(tid, cid)
	local x_offset,z_offset = GameApi.GetMapOffset(scene_id)
	if tid == 58981 then
		tbl["desc"] = MONSTER_CTRL_DESC[3]
	elseif x_range < 128 and z_range < 128 then
		tbl["desc"] = string.format(MONSTER_CTRL_DESC[1], TaskHelp.Scene[scene_id], x-x_offset, z-z_offset)
	else
		tbl["desc"] = string.format(MONSTER_CTRL_DESC[2], TaskHelp.Scene[scene_id])
	end
	--描述面板附加信息
	--用\r分割
	tbl["remark"] = DescUtility:GetItemExtDesc(tid, cid, ext_tbl)

	--描述面板价格信息
	--单位依次：文、贯、金、玉

	--描述面板声望消耗信息


	--描述面板物品兑换信息

	tbl["lab_money"], tbl["money1"], tbl["money2"], tbl["money3"], tbl["money4"], tbl["lab_fame"], tbl["fame"], tbl["lab_exchange"], tbl["exchange"], tbl["exchangepic"],tbl["npc_buy_bind"] = DescUtility:GetItemPrice(tid, cid, context_type, price_scale, ext_tbl)

	--描述面板元宝信息
	--单位依次：银元、金元

	return tbl

end

-- 组合配方卷轴描述函数
function DescTool:GetRECIPEROLLDesc(tid,cid,context_type,price_scale,ext_tbl)
	--GmaeApi.GetRecipeTable
	--key为配方id，value为配方等级

	tbl = {}

	--描述面板表头
	tbl["title"] = DescUtility:GetItemName(tid, cid)

	--描述面板图标
	tbl["icon"] = DescUtility:GetItemIcon(tid, cid)

	--描述面板表头
	--1最多3行，2最多1行，3最多2行（用\r分割）

	local base_type = string.format(ITEM_LIMIT_DESC[12], DescUtility:GetItemBaseType(cid))
	local recipe_limit,recipe_id = DescUtility:GetRecipeRollSkill(tid, cid)
	tbl["info1"] = string.format(--[[!AUTO_209]]"%s\r%s", base_type,recipe_limit)

	--描述面板星级
	--s_t，s代表星数，-1不显示。t代表显示方案，0为正常，1为同步闪烁，2为待定

	tbl["star"] = --[[!AUTO_210]]"-1_0"

	--描述面板限制（左）与消耗（右）
	--用\r分割

	--描述面板描述信息
	--用\r分割

	--描述面板属性信息

	--用\r分割
	local have_recipe = GameApi.GetRecipeTable()
	if have_recipe[recipe_id] then
		tbl["desc"] = string.format(--[[!AUTO_211]]"%s%s\r%s",TAG_COLOR_ESSENCE[4],RECIPEROLL_LEARNED_TEXT,RECIPEROLL_USE_TEXT)
	else
		tbl["desc"] = string.format(--[[!AUTO_212]]"%s%s\r%s",TAG_COLOR_ESSENCE[1],RECIPEROLL_UNLEARNED_TEXT,RECIPEROLL_USE_TEXT)
	end

	--描述面板附加信息
	--用\r分割
	tbl["remark"] = DescUtility:GetItemExtDesc(tid, cid, ext_tbl)

	--描述面板价格信息
	--单位依次：文、贯、金、玉

	--描述面板声望消耗信息


	--描述面板物品兑换信息

	tbl["lab_money"], tbl["money1"], tbl["money2"], tbl["money3"], tbl["money4"], tbl["lab_fame"], tbl["fame"], tbl["lab_exchange"], tbl["exchange"], tbl["exchangepic"],tbl["npc_buy_bind"] = DescUtility:GetItemPrice(tid, cid, context_type, price_scale, ext_tbl)

	--描述面板元宝信息
	--单位依次：银元、金元


	return tbl

end

--烟花描述
function DescTool:GetFireWorkDesc(tid,cid,context_type,price_scale,ext_tbl)

	tbl = {}

	--描述面板表头
	tbl["title"] = DescUtility:GetItemName(tid, cid)

	--描述面板图标
	tbl["icon"] = DescUtility:GetItemIcon(tid, cid)

	--描述面板表头
	--1最多3行，2最多1行，3最多2行（用\r分割）

	local base_type = string.format(ITEM_LIMIT_DESC[12], DescUtility:GetItemBaseType(cid))
	local quantity = string.format(ITEM_LIMIT_DESC[16],DescUtility:GetItemMaxQuantity(tid, cid))
	tbl["info1"] = string.format(--[[!AUTO_213]]"%s\r%s%s", base_type,DescUtility:GetItemLevelLimit(tid, cid),quantity)

	--描述面板星级
	--s_t，s代表星数，-1不显示。t代表显示方案，0为正常，1为同步闪烁，2为待定

	tbl["star"] = --[[!AUTO_214]]"-1_0"

	--描述面板限制（左）与消耗（右）
	--用\r分割

	--描述面板描述信息
	--用\r分割
	local _,scene_id_lmt = DescUtility:GetItemDBProp(tid, cid, --[[!]]"场景ID限制")
	if scene_id_lmt > 0 then
		tbl["limitskill"] = --[[!AUTO_215]]"使用：在目標地點右鍵點擊"
	else
		tbl["limitskill"] = --[[!AUTO_215]]"使用：右鍵點擊"
	end
	--描述面板属性信息


	local scene_id, x, z, x_range, z_range = DescUtility:GetLimitSceneInfo(tid, cid)
	local x_offset,z_offset = GameApi.GetMapOffset(scene_id)
	if scene_id > 0 and TaskHelp.Scene[scene_id] then
		if x_range < 128 and z_range < 128 then
			tbl["desc"] = string.format(MOSTER_CTRL_DESC[1], TaskHelp.Scene[scene_id], x-x_offset, z-z_offset)
		else
			tbl["desc"] = string.format(MOSTER_CTRL_DESC[2], TaskHelp.Scene[scene_id])
		end
	end
	--用\r分割

	--描述面板附加信息
	--用\r分割
	tbl["remark"] = DescUtility:GetItemExtDesc(tid, cid, ext_tbl)

	--描述面板价格信息
	--单位依次：文、贯、金、玉

	--描述面板声望消耗信息

	local _,repu_value = DescUtility:GetItemDBProp(tid,cid,--[[!]]"使用后获得烟花声望值")
	if repu_value and repu_value > 0 then
		local repudesc = string.format("使用後增加^e76041%d點^ffffff喜悅度",repu_value)
		if tbl["desc"] then
			tbl["desc"] = tbl["desc"] .. repudesc
		else
			tbl["desc"] = repudesc
		end
	end

	--描述面板物品兑换信息

	tbl["lab_money"], tbl["money1"], tbl["money2"], tbl["money3"], tbl["money4"], tbl["lab_fame"], tbl["fame"], tbl["lab_exchange"], tbl["exchange"], tbl["exchangepic"],tbl["npc_buy_bind"] = DescUtility:GetItemPrice(tid, cid, context_type, price_scale, ext_tbl)

	--描述面板元宝信息
	--单位依次：银元、金元


	return tbl

end

--夫妻同心结

function DescTool:GetCoupleJumptoDesc(tid,cid,context_type,price_scale,ext_tbl)
	tbl = {}

	--描述面板表头
	tbl["title"] = DescUtility:GetItemName(tid, cid)

	--描述面板图标
	tbl["icon"] = DescUtility:GetItemIcon(tid, cid)

	--描述面板表头
	--1最多3行，2最多1行，3最多2行（用\r分割）

	local base_type = string.format(ITEM_LIMIT_DESC[12], DescUtility:GetItemBaseType(cid))
	tbl["info1"] = string.format(--[[!AUTO_216]]"%s\r%s冷卻：%s", base_type,DescUtility:GetItemLevelLimit(tid, cid), DescUtility:GetCoolDownDesc(tid, cid))

	--描述面板星级
	--s_t，s代表星数，-1不显示。t代表显示方案，0为正常，1为同步闪烁，2为待定

	tbl["star"] = --[[!AUTO_217]]"-1_0"

	--描述面板限制（左）与消耗（右）
	--用\r分割
	tbl["limitskill"] = --[[!AUTO_218]]"使用：右鍵點擊\r（結婚後才可使用）"
	--描述面板描述信息
	--用\r分割

	--描述面板属性信息

	tbl["desc"] = --[[!AUTO_219]]"夫妻二人心心相惜，使用後可立即傳送至配偶身邊。"
	--用\r分割

	--描述面板附加信息
	--用\r分割

	tbl["remark"] = DescUtility:GetItemExtDesc(tid, cid, ext_tbl)

	--描述面板价格信息
	--单位依次：文、贯、金、玉

	--描述面板声望消耗信息


	--描述面板物品兑换信息

	tbl["lab_money"], tbl["money1"], tbl["money2"], tbl["money3"], tbl["money4"], tbl["lab_fame"], tbl["fame"], tbl["lab_exchange"], tbl["exchange"], tbl["exchangepic"],tbl["npc_buy_bind"] = DescUtility:GetItemPrice(tid, cid, context_type, price_scale, ext_tbl)

	--描述面板元宝信息
	--单位依次：银元、金元



	return tbl

end

--获取传送卷轴

function DescTool:GetTransmitRollDesc(tid,cid,context_type,price_scale,ext_tbl)
	tbl = {}

	--描述面板表头
	tbl["title"] = DescUtility:GetItemName(tid, cid)

	--描述面板图标
	tbl["icon"] = DescUtility:GetItemIcon(tid, cid)

	--描述面板表头
	--1最多3行，2最多1行，3最多2行（用\r分割）

	local base_type = string.format(ITEM_LIMIT_DESC[12], DescUtility:GetItemBaseType(cid))
	local quantity = string.format(ITEM_LIMIT_DESC[16],DescUtility:GetItemMaxQuantity(tid, cid))
	tbl["info1"] = string.format(--[[!AUTO_220]]"%s\r%s%s%s", base_type,DescUtility:GetItemLevelLimit(tid, cid),DescUtility:GetItemProfLimit(tid, cid),quantity)

	--描述面板星级
	--s_t，s代表星数，-1不显示。t代表显示方案，0为正常，1为同步闪烁，2为待定

	tbl["star"] = --[[!AUTO_221]]"-1_0"

	--描述面板限制（左）与消耗（右）
	--用\r分割

	--描述面板描述信息
	--用\r分割
	tbl["limitskill"] = --[[!AUTO_222]]"使用：右鍵點擊"
	--描述面板属性信息

	local scene_id, x, z = DescUtility:GetTransSceneInfo(tid, cid)
	local x_offset,z_offset = GameApi.GetMapOffset(scene_id)
	if scene_id > 0 and TaskHelp.Scene[scene_id] then
		tbl["desc"] = string.format(--[[!AUTO_223]]"^FFFFFF使用後可傳送至%s的[%s,%s]",TaskHelp.Scene[scene_id],math.floor(x-x_offset),math.floor(z-z_offset))
	end
	--用\r分割

	--描述面板附加信息
	--用\r分割
	tbl["remark"] = DescUtility:GetItemExtDesc(tid, cid, ext_tbl)

	--描述面板价格信息
	--单位依次：文、贯、金、玉

	--描述面板声望消耗信息


	--描述面板物品兑换信息

	tbl["lab_money"], tbl["money1"], tbl["money2"], tbl["money3"], tbl["money4"], tbl["lab_fame"], tbl["fame"], tbl["lab_exchange"], tbl["exchange"], tbl["exchangepic"],tbl["npc_buy_bind"] = DescUtility:GetItemPrice(tid, cid, context_type, price_scale, ext_tbl)

	--描述面板元宝信息
	--单位依次：银元、金元

	return tbl
end

--双倍经验道具

function DescTool:GetDoubleExpDesc(tid,cid,context_type,price_scale,ext_tbl)
	tbl = {}

	--描述面板表头
	tbl["title"] = DescUtility:GetItemName(tid, cid)

	--描述面板图标
	tbl["icon"] = DescUtility:GetItemIcon(tid, cid)

	--描述面板表头
	--1最多3行，2最多1行，3最多2行（用\r分割）

	local base_type = string.format(ITEM_LIMIT_DESC[12], DescUtility:GetItemBaseType(cid))
	local lv_limt = DescUtility:GetItemLevelLimit(tid, cid)
	local quantity = string.format(ITEM_LIMIT_DESC[16],DescUtility:GetItemMaxQuantity(tid, cid))
	local _,lv_invalid = DescUtility:GetItemDBProp(tid, cid, --[[!]]"最高等级限制")
	local player_prop = GameApi.GetPlayerFullProp(0)

	if lv_invalid <= 0 then
		tbl["info1"] = string.format(--[[!AUTO_360]]"%s\r%s", base_type,quantity)
	elseif player_prop["level"] > lv_invalid then
		local lv_invalid_text = string.format(ITEM_LIMIT_DESC[39],TAG_COLOR_ESSENCE[4],lv_invalid)
		tbl["info1"] = string.format(--[[!AUTO_360]]"%s\r%s\r%s", base_type,lv_invalid_text,quantity)
	else
		local lv_invalid_text = string.format(ITEM_LIMIT_DESC[39],TAG_COLOR_ESSENCE[5],lv_invalid)
		tbl["info1"] = string.format(--[[!AUTO_360]]"%s\r%s\r%s", base_type,lv_invalid_text,quantity)
	end


	--描述面板星级
	--s_t，s代表星数，-1不显示。t代表显示方案，0为正常，1为同步闪烁，2为待定

	tbl["star"] = --[[!AUTO_225]]"-1_0"

	--描述面板限制（左）与消耗（右）
	--用\r分割
	tbl["limitskill"] = --[[!AUTO_226]]"使用：右鍵點擊"
	--描述面板描述信息
	--用\r分割
	local expScaleFactorDesc = DescUtility:GetExpScaleFactorDesc(tid, cid)
	tbl["desc"] = string.format(--[[!AUTO_227]]"獲得%s個人%s，同時解凍%s時間",DescUtility:GetCoolDownDesc(tid, cid), expScaleFactorDesc, expScaleFactorDesc)
	--描述面板属性信息


	--用\r分割

	--描述面板附加信息
	--用\r分割
	tbl["remark"] = DescUtility:GetItemExtDesc(tid, cid, ext_tbl)

	--描述面板价格信息
	--单位依次：文、贯、金、玉

	--描述面板声望消耗信息


	--描述面板物品兑换信息

	tbl["lab_money"], tbl["money1"], tbl["money2"], tbl["money3"], tbl["money4"], tbl["lab_fame"], tbl["fame"], tbl["lab_exchange"], tbl["exchange"], tbl["exchangepic"],tbl["npc_buy_bind"] = DescUtility:GetItemPrice(tid, cid, context_type, price_scale, ext_tbl)

	--描述面板元宝信息
	--单位依次：银元、金元


	return tbl
end

--请帖描述
function DescTool:GetInvitationDesc(tid,cid,context_type,price_scale,ext_tbl)
	tbl = {}

	--描述面板表头
	tbl["title"] = DescUtility:GetItemName(tid, cid)

	--描述面板图标
	tbl["icon"] = DescUtility:GetItemIcon(tid, cid)

	--描述面板表头
	--1最多3行，2最多1行，3最多2行（用\r分割）

	local base_type = string.format(ITEM_LIMIT_DESC[12], DescUtility:GetItemBaseType(cid))
	tbl["info1"] = string.format(--[[!AUTO_228]]"%s", base_type)

	--描述面板星级
	--s_t，s代表星数，-1不显示。t代表显示方案，0为正常，1为同步闪烁，2为待定

	tbl["star"] = --[[!AUTO_229]]"-1_0"

	--描述面板限制（左）与消耗（右）
	--用\r分割

	--描述面板描述信息
	--用\r分割

	--描述面板属性信息


	--用\r分割

	--描述面板附加信息
	--用\r分割
	tbl["remark"] = DescUtility:GetItemExtDesc(tid, cid, ext_tbl)

	--描述面板价格信息
	--单位依次：文、贯、金、玉

	--描述面板声望消耗信息


	--描述面板物品兑换信息

	tbl["lab_money"], tbl["money1"], tbl["money2"], tbl["money3"], tbl["money4"], tbl["lab_fame"], tbl["fame"], tbl["lab_exchange"], tbl["exchange"], tbl["exchangepic"],tbl["npc_buy_bind"] = DescUtility:GetItemPrice(tid, cid, context_type, price_scale, ext_tbl)

	--描述面板元宝信息
	--单位依次：银元、金元


	return tbl
end

--传送旗
function DescTool:GetTransmitFlagDesc(tid,cid,context_type,price_scale,ext_tbl)
	tbl = {}

	--描述面板表头
	tbl["title"] = DescUtility:GetItemName(tid, cid)

	--描述面板图标
	tbl["icon"] = DescUtility:GetItemIcon(tid, cid)

	--描述面板表头
	--1最多3行，2最多1行，3最多2行（用\r分割）

	local base_type = string.format(ITEM_LIMIT_DESC[12], DescUtility:GetItemBaseType(cid))
	local level_limit = DescUtility:GetItemLevelLimit(tid, cid)
	local quantity = string.format(ITEM_LIMIT_DESC[16],DescUtility:GetItemMaxQuantity(tid, cid))
	tbl["info1"] = string.format(--[[!AUTO_230]]"%s\r%s%s", base_type,level_limit,quantity)

	--描述面板星级
	--s_t，s代表星数，-1不显示。t代表显示方案，0为正常，1为同步闪烁，2为待定

	tbl["star"] = --[[!AUTO_231]]"-1_0"

	--描述面板限制（左）与消耗（右）
	--用\r分割

	--描述面板描述信息
	--用\r分割
	tbl["limitskill"] = --[[!AUTO_232]]"使用：右鍵點擊"
	--描述面板属性信息


	--用\r分割

	--描述面板附加信息
	--用\r分割
	tbl["remark"] = DescUtility:GetItemExtDesc(tid, cid, ext_tbl)

	--描述面板价格信息
	--单位依次：文、贯、金、玉

	--描述面板声望消耗信息


	--描述面板物品兑换信息

	tbl["lab_money"], tbl["money1"], tbl["money2"], tbl["money3"], tbl["money4"], tbl["lab_fame"], tbl["fame"], tbl["lab_exchange"], tbl["exchange"], tbl["exchangepic"],tbl["npc_buy_bind"] = DescUtility:GetItemPrice(tid, cid, context_type, price_scale, ext_tbl)

	--描述面板元宝信息
	--单位依次：银元、金元


	return tbl
end

--背包描述
function DescTool:GetBackPackDesc(tid,cid,context_type,price_scale,ext_tbl)

	tbl = {}

	--描述面板表头
	tbl["title"] = DescUtility:GetItemName(tid, cid)

	--描述面板图标
	tbl["icon"] = DescUtility:GetItemIcon(tid, cid)

	--描述面板表头
	--1最多3行，2最多1行，3最多2行（用\r分割）

	local base_type = string.format(ITEM_LIMIT_DESC[12], DescUtility:GetItemBaseType(cid))
	local quantity = string.format(ITEM_LIMIT_DESC[16],DescUtility:GetItemMaxQuantity(tid, cid))
	tbl["info1"] = string.format(--[[!AUTO_233]]"%s\r%s", base_type,DescUtility:GetItemLevelLimit(tid, cid))

	--描述面板星级
	--s_t，s代表星数，-1不显示。t代表显示方案，0为正常，1为同步闪烁，2为待定

	tbl["star"] = --[[!AUTO_234]]"-1_0"

	--描述面板限制（左）与消耗（右）
	--用\r分割

	--描述面板描述信息
	--用\r分割
	local _, num = DescUtility:GetItemDBProp(tid, cid, --[[!]]"扩充包裹数量")
	tbl["desc"] = string.format(--[[!AUTO_236]]"裝備：可增加%d格包裹空間",num)
	--描述面板属性信息


	--用\r分割

	--描述面板附加信息
	--用\r分割
	tbl["remark"] = DescUtility:GetItemExtDesc(tid, cid, ext_tbl)

	--描述面板价格信息
	--单位依次：文、贯、金、玉

	--描述面板声望消耗信息


	--描述面板物品兑换信息

	tbl["lab_money"], tbl["money1"], tbl["money2"], tbl["money3"], tbl["money4"], tbl["lab_fame"], tbl["fame"], tbl["lab_exchange"], tbl["exchange"], tbl["exchangepic"],tbl["npc_buy_bind"] = DescUtility:GetItemPrice(tid, cid, context_type, price_scale, ext_tbl)

	--描述面板元宝信息
	--单位依次：银元、金元


	return tbl

end

--藏宝图描述

function DescTool:GetTreasureMapDesc(tid,cid,context_type,price_scale,ext_tbl)

	tbl = {}

	--描述面板表头
	tbl["title"] = DescUtility:GetItemName(tid, cid)

	--描述面板图标
	tbl["icon"] = DescUtility:GetItemIcon(tid, cid)

	--描述面板表头
	--1最多3行，2最多1行，3最多2行（用\r分割）

	local base_type = string.format(ITEM_LIMIT_DESC[12], DescUtility:GetItemBaseType(cid))
	local quantity = string.format(ITEM_LIMIT_DESC[16],DescUtility:GetItemMaxQuantity(tid, cid))
	tbl["info1"] = base_type
	if TREASUREMAP_LEVEL_LIMIT[tid] then
		tbl["info1"] = string.format(--[[!AUTO_237]]"%s\r%s",tbl["info1"],TREASUREMAP_LEVEL_LIMIT[tid])
	end
	if TREASUREMAP_TEAM_LIMIT[tid] then
		tbl["info1"] = string.format(--[[!AUTO_238]]"%s\r%s",tbl["info1"],TREASUREMAP_TEAM_LIMIT[tid])
	end


	--描述面板星级
	--s_t，s代表星数，-1不显示。t代表显示方案，0为正常，1为同步闪烁，2为待定

	tbl["star"] = --[[!AUTO_239]]"-1_0"

	--描述面板限制（左）与消耗（右）
	--用\r分割

	--描述面板描述信息
	--用\r分割
	local _, treasuremap_level = DescUtility:GetItemDBProp(tid,cid,--[[!]]"藏宝图等级")
	local templ_id = ext_tbl["OrgTemplId"]
	local pos_index = ext_tbl["PosIndex"]

	if templ_id and pos_index then
		local _, sid = DescUtility:GetItemDBProp(templ_id, 55, --[[!]]"坐标" .. pos_index+1 .. --[[!]]"场景")
		local _, x = DescUtility:GetItemDBProp(templ_id, 55, --[[!]]"坐标" .. pos_index+1 .. --[[!AUTO_241]]"-X")
		local _, z = DescUtility:GetItemDBProp(templ_id, 55, --[[!]]"坐标" .. pos_index+1 .. --[[!AUTO_242]]"-Z")

		if treasuremap_level <= 0 and TaskHelp.Scene[sid] and x and z then
			local x_offset,z_offset = TaskHelp:GetMapOffset(sid)
			tbl["desc"] = string.format(--[[!AUTO_243]]"地點：%s(%s,%s)",TaskHelp.Scene[sid],math.floor(x-x_offset),math.floor(z-z_offset))
		elseif TaskHelp.Scene[sid] then
			tbl["desc"] = string.format(--[[!AUTO_244]]"地點：%s",TaskHelp.Scene[sid])
		end
	end
	--描述面板属性信息

	--用\r分割

	--描述面板附加信息
	--用\r分割
	tbl["remark"] = DescUtility:GetItemExtDesc(tid, cid, ext_tbl)

	--描述面板价格信息
	--单位依次：文、贯、金、玉

	--描述面板声望消耗信息


	--描述面板物品兑换信息

	tbl["lab_money"], tbl["money1"], tbl["money2"], tbl["money3"], tbl["money4"], tbl["lab_fame"], tbl["fame"], tbl["lab_exchange"], tbl["exchange"], tbl["exchangepic"],tbl["npc_buy_bind"] = DescUtility:GetItemPrice(tid, cid, context_type, price_scale, ext_tbl)

	--描述面板元宝信息
	--单位依次：银元、金元


	return tbl

end

--藏宝图碎片描述

function DescTool:GetTreasureMapFragmentDesc(tid,cid,context_type,price_scale,ext_tbl)

	tbl = {}

	--描述面板表头
	tbl["title"] = DescUtility:GetItemName(tid, cid)

	--描述面板图标
	tbl["icon"] = DescUtility:GetItemIcon(tid, cid)

	--描述面板表头
	--1最多3行，2最多1行，3最多2行（用\r分割）

	local base_type = string.format(ITEM_LIMIT_DESC[12], DescUtility:GetItemBaseType(cid))
	local quantity = string.format(ITEM_LIMIT_DESC[16],DescUtility:GetItemMaxQuantity(tid, cid))
	tbl["info1"] = string.format(--[[!AUTO_245]]"%s\r%s", base_type,DescUtility:GetItemLevelLimit(tid, cid))
	if TREASUREMAP_TEAM_LIMIT[tid] then
		tbl["info1"] = string.format(--[[!AUTO_246]]"%s%s",tbl["info1"],TREASUREMAP_TEAM_LIMIT[tid])
	end

	--描述面板星级
	--s_t，s代表星数，-1不显示。t代表显示方案，0为正常，1为同步闪烁，2为待定

	tbl["star"] = --[[!AUTO_247]]"-1_0"

	--描述面板限制（左）与消耗（右）
	--用\r分割

	--描述面板描述信息
	--用\r分割
	tbl["desc"] = --[[!AUTO_248]]"使用：右鍵點擊還原藏寶圖"

	--描述面板属性信息

	--用\r分割

	--描述面板附加信息
	--用\r分割
	tbl["remark"] = DescUtility:GetItemExtDesc(tid, cid, ext_tbl)

	--描述面板价格信息
	--单位依次：文、贯、金、玉

	--描述面板声望消耗信息


	--描述面板物品兑换信息

	tbl["lab_money"], tbl["money1"], tbl["money2"], tbl["money3"], tbl["money4"], tbl["lab_fame"], tbl["fame"], tbl["lab_exchange"], tbl["exchange"], tbl["exchangepic"],tbl["npc_buy_bind"] = DescUtility:GetItemPrice(tid, cid, context_type, price_scale, ext_tbl)

	--描述面板元宝信息
	--单位依次：银元、金元


	return tbl

end

-- 场景物品
function DescTool:GetSceneOnlyDesc(tid,cid,context_type,price_scale,ext_tbl)
	tbl = {}

	--描述面板表头
	tbl["title"] = DescUtility:GetItemName(tid, cid)

	--描述面板图标
	tbl["icon"] = DescUtility:GetItemIcon(tid, cid)
	tbl["desc"] = --[[!AUTO_249]]""
	tbl["info1"] = --[[!AUTO_250]]""
	--描述面板表头
	--1最多3行，2最多1行，3最多2行（用\r分割）

	local item_mark = DescUtility:GetItemBaseType(cid)
	local _,item_type = DescUtility:GetItemDBProp(tid, cid, --[[!]]"使用效果")
	local level_limit = DescUtility:GetItemLevelLimit(tid, cid)
	local base_type = --[[!AUTO_251]]""
	--local quantity = string.format(ITEM_LIMIT_DESC[16],DescUtility:GetItemMaxQuantity(tid, cid))
	local _,addon_group_id1 = DescUtility:GetItemDBProp(tid, cid, --[[!]]"固定附加属性组1")
	local _,addon_group_id2 = DescUtility:GetItemDBProp(tid, cid, --[[!]]"固定附加属性组2")
	local _,addon_group_id3 = DescUtility:GetItemDBProp(tid, cid, --[[!]]"固定附加属性组3")
	local _,addon_group_id4 = DescUtility:GetItemDBProp(tid, cid, --[[!]]"固定附加属性组4")

	if addon_group_id1 and addon_group_id1 > 0 then
		tbl["desc"] = string.format(ITEM_LIMIT_DESC[13],DescUtility:GetAddonFromGroup(addon_group_id1))
		base_type = string.format(ITEM_LIMIT_DESC[12],--[[!AUTO_252]]"裝備")
	end
	if addon_group_id2 and addon_group_id2 > 0 then
		tbl["desc"] = string.format(--[[!AUTO_253]]"%s\r%s",tbl["desc"],DescUtility:GetAddonFromGroup(addon_group_id2))
	end
	if addon_group_id3 and addon_group_id3 > 0 then
		tbl["desc"] = string.format(--[[!AUTO_254]]"%s\r%s",tbl["desc"],DescUtility:GetAddonFromGroup(addon_group_id3))
	end
	if addon_group_id4 and addon_group_id4 > 0 then
		tbl["desc"] = string.format(--[[!AUTO_255]]"%s\r%s",tbl["desc"],DescUtility:GetAddonFromGroup(addon_group_id4))
	end

	if base_type == --[[!AUTO_256]]"" then
		base_type = string.format(ITEM_LIMIT_DESC[12],--[[!AUTO_257]]"消耗品")
	end
	tbl["info1"] = string.format(--[[!AUTO_258]]"%s\r%s\r",item_mark, base_type)
	local _,cool_down = DescUtility:GetItemDBProp(tid, cid, --[[!]]"使用对应的冷却时间")
	if cool_down  and cool_down > 0 then
		tbl["info1"] =tbl["info1"] .. string.format(ITEM_LIMIT_DESC[27],DescUtility:GetCoolDownDesc(tid, cid))
	end
	--local _,use_count = DescUtility:GetItemDBProp(tid, cid, "可使用最大次数上限")
	if ext_tbl["CanUseCount"]  and ext_tbl["CanUseCount"] > 0 then
		--tbl["info1"] =tbl["info1"] .. string.format(ITEM_LIMIT_DESC[28],TAG_COLOR_ESSENCE[5],ext_tbl["CanUseCount"])
	elseif ext_tbl["CanUseCount"]  and ext_tbl["CanUseCount"] == 0 then
		--tbl["info1"] =tbl["info1"] .. string.format(ITEM_LIMIT_DESC[28],TAG_COLOR_ESSENCE[4],ext_tbl["CanUseCount"])
	end

	if item_type == 1 then
		local _,medicine_type = DescUtility:GetItemDBProp(tid, cid, --[[!]]"使用药物对应的药物类别")
		if medicine_type and medicine_type >= 0 then
			if tbl["desc"] ~= --[[!AUTO_259]]"" and tbl["desc"] ~= nil then
				tbl["desc"] = tbl["desc"] .. --[[!AUTO_260]]"\r"
			end
		end
		if medicine_type and medicine_type >= 0 and medicine_type ~= 8 then
			local _,value1 = DescUtility:GetItemDBProp(tid, cid, --[[!]]"使用药物对应的数值1")
			tbl["desc"] = tbl["desc"] .. ITEM_LIMIT_DESC[26] .. string.format(ITEM_MEDICINE_TEXT[medicine_type+1],value1)
		elseif medicine_type ==  8 then
			local _,value1 = DescUtility:GetItemDBProp(tid, cid, --[[!]]"使用药物对应的数值1")
			local _,value2 = DescUtility:GetItemDBProp(tid, cid, --[[!]]"使用药物对应的数值2")
			local _,value3 = DescUtility:GetItemDBProp(tid, cid, --[[!]]"使用药物对应的数值3")
			local _,value4 = DescUtility:GetItemDBProp(tid, cid, --[[!]]"使用药物对应的数值4")
			local _,value5 = DescUtility:GetItemDBProp(tid, cid, --[[!]]"使用药物对应的数值5")
			local _,value6 = DescUtility:GetItemDBProp(tid, cid, --[[!]]"使用药物对应的数值6")
			tbl["desc"] = tbl["desc"] .. --[[!AUTO_261]]"\r" .. string.format(ITEM_MEDICINE_TEXT[medicine_type+1],value1,value2,value3,value4,value5,value6)
		end
	elseif item_type == 2 then
		if BATTLE_ITEM_DESC[tid] then
			if tbl["desc"] ~= --[[!AUTO_262]]"" and tbl["desc"] ~= nil then
				tbl["desc"] = tbl["desc"] .. --[[!AUTO_263]]"\r\r"
			end
			tbl["desc"] =string.format(ITEM_LIMIT_DESC[25],tbl["desc"],BATTLE_ITEM_DESC[tid])
		end
	end

	--描述面板星级
	--s_t，s代表星数，-1不显示。t代表显示方案，0为正常，1为同步闪烁，2为待定

	tbl["star"] = --[[!AUTO_264]]"-1_0"

	--描述面板限制（左）与消耗（右）
	--用\r分割

	--描述面板描述信息
	--用\r分割

	--描述面板属性信息


	--用\r分割

	--描述面板附加信息
	--用\r分割
	tbl["remark"] = DescUtility:GetItemExtDesc(tid, cid, ext_tbl)

	--描述面板价格信息
	--单位依次：文、贯、金、玉

	--描述面板声望消耗信息


	--描述面板物品兑换信息

	tbl["lab_money"], tbl["money1"], tbl["money2"], tbl["money3"], tbl["money4"], tbl["lab_fame"], tbl["fame"], tbl["lab_exchange"], tbl["exchange"], tbl["exchangepic"],tbl["npc_buy_bind"] = DescUtility:GetItemPrice(tid, cid, context_type, price_scale, ext_tbl)

	--描述面板元宝信息
	--单位依次：银元、金元


	return tbl

end

-- 仆人描述
function DescTool:GetServantDesc(tid,cid,context_type,price_scale,ext_tbl)

	tbl = {}

	--描述面板表头
	tbl["title"] = DescUtility:GetItemName(tid, cid)

	--描述面板图标
	tbl["icon"] = DescUtility:GetItemIcon(tid, cid)

	--描述面板表头
	--1最多3行，2最多1行，3最多2行（用\r分割）

	local _, s_type = DescUtility:GetItemDBProp(tid, cid, --[[!]]"类型")
	local base_type = string.format(ITEM_LIMIT_DESC[12], DescUtility:GetItemBaseType(cid))
	local gender = DescUtility:GetItemSexDesc(tid, cid)
	local s_level = DescUtility:GetItemLevelDesc(tid, cid)
	local labour_desc = --[[!AUTO_265]]""

	if s_type == 0 then
		base_type = string.format(ITEM_LIMIT_DESC[12], --[[!AUTO_266]]"長工")
		labour_desc = --[[!AUTO_267]]"氣力：%s"
	elseif s_type == 1 then
		base_type = string.format(ITEM_LIMIT_DESC[12], --[[!AUTO_268]]"書童")
		labour_desc = --[[!AUTO_269]]"學識：%s"
	elseif s_type == 2 then
		base_type = string.format(ITEM_LIMIT_DESC[12], --[[!AUTO_270]]"侍應")
		labour_desc = --[[!AUTO_271]]"魅力：%s"
	elseif s_type == 3 then
		base_type = string.format(ITEM_LIMIT_DESC[12], --[[!AUTO_272]]"先生")
		labour_desc = --[[!AUTO_273]]"學識：%s"
	end

	local _, labour_val  = DescUtility:GetItemDBProp(tid, cid, --[[!]]"劳动力")
	labour_desc = string.format(labour_desc,labour_val)
	tbl["info1"] = string.format(--[[!AUTO_274]]"%s\r%s\r%s%s", base_type,gender,s_level,labour_desc)

	--描述面板星级
	--s_t，s代表星数，-1不显示。t代表显示方案，0为正常，1为同步闪烁，2为待定

	tbl["star"] = --[[!AUTO_275]]"-1_0"

	--描述面板限制（左）与消耗（右）
	--用\r分割
	local _, ability_val = DescUtility:GetItemDBProp(tid, cid, --[[!]]"特长")
	local ability_desc = string.format(ITEM_LIMIT_DESC[31],SERVANT_ABILITY[ability_val])
	tbl["desc"] = ability_desc
	if ability_val > 0 then
		tbl["desc"] = string.format(--[[!AUTO_276]]"%s\r%s",tbl["desc"],SERVANT_ABILITY_TEXT[ability_val])
	end

	--套卡描述显示
	local _,group_id,group_index,group_num = GameApi.GetItemDBProp(tid, cid, --[[!]]"所属套卡id",--[[!]]"所属套卡序列",--[[!]]"所属套卡最大数量")
	local group_desc = --[[!AUTO_277]]""
	local have_count = 1
	local servant_list = ext_tbl["ServantList"]
	if SERVANT_GROUP_DESC[group_id] then
		for i= 1,#SERVANT_GROUP_DESC[group_id].group do
			local s_group = SERVANT_GROUP_DESC[group_id].group
			local _,s_name = DescUtility:GetItemDBProp(s_group[i], cid, --[[!AUTO_278]]"t_name")
			if i == group_index then
				group_desc = string.format(--[[!AUTO_279]]"%s\r%s　%s",group_desc,--[[!AUTO_280]]"^00ff00",s_name)
			else
				local flag = false
				for j = 1,#servant_list do
					if servant_list[j] == s_group[i] then
						flag = true
						break
					end
				end
				if flag == true then
					group_desc = string.format(--[[!AUTO_281]]"%s\r%s　%s",group_desc,--[[!AUTO_282]]"^00ff00",s_name)
					have_count = have_count + 1
				else
					group_desc = string.format(--[[!AUTO_283]]"%s\r%s　%s",group_desc,--[[!AUTO_284]]"^A8A8A8",s_name)
				end
			end
		end
		group_desc = string.format(--[[!AUTO_285]]"^00ff00%s(%d/%d)",SERVANT_GROUP_DESC[group_id].name,have_count,SERVANT_GROUP_DESC[group_id].groupnum) .. group_desc
		group_desc = group_desc .. --[[!AUTO_286]]"\r\r" .. SERVANT_GROUP_TEXT01
	end
	if group_desc ~= --[[!AUTO_287]]"" then
		tbl["desc"] = tbl["desc"] .. --[[!AUTO_288]]"\r\r" .. group_desc
	end

	--描述面板描述信息
	--用\r分割

	--描述面板属性信息


	--用\r分割

	--描述面板附加信息
	--用\r分割
	tbl["remark"] = DescUtility:GetItemExtDesc(tid, cid, ext_tbl)

	--描述面板价格信息
	--单位依次：文、贯、金、玉

	--描述面板声望消耗信息


	--描述面板物品兑换信息

	tbl["lab_money"], tbl["money1"], tbl["money2"], tbl["money3"], tbl["money4"], tbl["lab_fame"], tbl["fame"], tbl["lab_exchange"], tbl["exchange"], tbl["exchangepic"],tbl["npc_buy_bind"] = DescUtility:GetItemPrice(tid, cid, context_type, price_scale, ext_tbl)

	--描述面板元宝信息
	--单位依次：银元、金元


	return tbl

end


-- 销毁中物品描述函数
--function DescTool:GetMallItemDesc(tid, cid, count, tbl)
function DescTool:GetDestroyingEssenceDesc(tid, cid, context_type, price_scale, ext_tbl)

	local t_ext_temp = {}
	t_ext_temp["Num"] = 1
	t_ext_temp["UnitPrice"] = 0
	t_ext_temp["Bind"] = false
	t_ext_temp["EquipEndurance"] = 0
	t_ext_temp["EquipRepairCost"] = 0
	t_ext_temp["EquipEssAddon"] = 0
	t_ext_temp["ServiceNPC"] = 0
	t_ext_temp["TimeLimit"] = ext_tbl["TimeLimit"]
	--LogPrintA(ext_tbl["TimeLimit"])
	t_ext_temp["GiftFromName"] = 0
	t_ext_temp["GiftToName"] = 0
	t_ext_temp["GiftData"] = 0
	t_ext_temp["GiftContent"] = 0
	t_ext_temp["Grade"] = 0
	t_ext_temp["KaiguangState"] = 0

	t_ext_temp["EquipEssAddon"] = {}
	t_ext_temp["EquipEssAddon"]["ext_group_type"] = 1
	t_ext_temp["EquipEssAddon"]["ext_group_generate_type"] = 1
	t_ext_temp["EquipEssAddon"]["ext_group_id"] = 0
	t_ext_temp["EquipEssAddon"]["ext_prop_count"] = 0
	t_ext_temp["EquipEssAddon"]["ext_has_baseprop"] = false

	t_ext_temp["EquipLevel"] = 0
	t_ext_temp["EquipExp"] = 0

	t_ext_temp["EquipUpgradeAddon"] = {}
	t_ext_temp["EquipUpgradeAddon"]["ext_prop_count"] = 0
	t_ext_temp["EquipUpgradeAddon"]["ext_group_type"] = 1
	t_ext_temp["EquipUpgradeAddon"]["ext_group_1_type"] = 1

	t_ext_temp["EquipKaiguangAddon"] = {}
	t_ext_temp["EquipKaiguangAddon"]["ext_group_type"] = 0
	t_ext_temp["EquipKaiguangAddon"]["ext_group_id"] = 0
	t_ext_temp["EquipKaiguangAddon"]["ext_prop_count"] = 0
	t_ext_temp["EquipKaiguangAddon"]["ext_has_baseprop"] = false

	t_ext_temp["EquipReinforceAddon"] = {}

	t_ext_temp["next_reinforce"] = {}
	t_ext_temp["next_kaiguang"] = {}

	t_ext_temp["Dice"] = {}
	t_ext_temp["Dice"][1] = 0

	t_ext_temp["Stone"] = {}
	t_ext_temp["Stone"][1] = {}
	--t_ext_temp["Stone"][1][1] = 0
	t_ext_temp["Stone"][2] = {}
	--t_ext_temp["Stone"][2][1] = 0
	t_ext_temp["Stone"][3] = {}
	--t_ext_temp["Stone"][3][1] = 0
	t_ext_temp["Stone"][4] = {}
	--t_ext_temp["Stone"][4][1] = 0	
	

	t_ext_temp["SignName"] = 0
	t_ext_temp["SignLevel"] = 0

	t_ext_temp["GiftFromName"] = --[[!AUTO_289]]""
	t_ext_temp["GiftToName"] = --[[!AUTO_290]]""
	t_ext_temp["GiftData"] = --[[!AUTO_291]]""
	t_ext_temp["GiftContent"] = --[[!AUTO_292]]""

	t_ext_temp["EquipRuneWordAddon"] = {}
	t_ext_temp["RuneWordId"] = 0

	t_temp = DescUtility:CopyTable(ItemTip:GetItemDesc(ext_tbl["destroy_id"], ext_tbl["destroy_cid"], context_type, price_scale, ext_tbl))

	if ext_tbl["destroy_flag"] == 1 then
		t_temp["title"] = ITEM_DELAY_DESTORY_NAME .. t_temp["title"]
		--t_temp["icon"] = ITEM_DELAY_DESTORY_ICON
		t_temp["remark"] = string.gsub(t_temp["remark"], "裝備綁定\r\r", "")
		t_temp["remark"] = t_temp["remark"] .. ITEM_DELAY_DESTORY_DESC
	elseif ext_tbl["destroy_flag"] == 2 then
		t_temp["title"] = ITEM_FASHION_DECOMPOSE_NAME .. t_temp["title"]
		--t_temp["icon"] = ITEM_MALL_PROTECT_ICON
		t_temp["remark"] = string.gsub(t_temp["remark"], "裝備綁定\r\r", "")
		t_temp["remark"] = t_temp["remark"] .. ITEM_FASHION_DECOMPOSE_DESC
	else
		t_temp["title"] = ITEM_MALL_PROTECT_NAME .. t_temp["title"]
		--t_temp["icon"] = ITEM_MALL_PROTECT_ICON
		t_temp["remark"] = string.gsub(t_temp["remark"], "裝備綁定\r\r", "")
		t_temp["remark"] = t_temp["remark"] .. ITEM_MALL_PROTECT_DESC
	end
	--t_temp["desc"] = ""
	--t_temp["limitskill"] = ""

	t_temp["lab_money"], t_temp["money1"], t_temp["money2"], t_temp["money3"], t_temp["money4"], t_temp["lab_fame"], tbl["fame"], t_temp["lab_exchange"], t_temp["exchange"], t_temp["exchangepic"],t_temp["npc_buy_bind"] = 0

	--[[
	tbl = {}
	--描述面板表头
	tbl["title"] = DescUtility:GetItemName(tid, cid)

	--描述面板图标
	tbl["icon"] = DescUtility:GetItemIcon(tid, cid)

	--描述面板表头
	--1最多3行，2最多1行，3最多2行（用\r分割）
	local type_id = DescUtility:GetNormalItemType(tid, cid)
	local base_type = string.format(ITEM_LIMIT_DESC[12],NORMAL_ITEM_TYPE_DESC[type_id].type_desc)
	local quantity = string.format(ITEM_LIMIT_DESC[16],DescUtility:GetItemMaxQuantity(tid, cid))
	local ItemCount = string.format(ITEM_LIMIT_DESC[24], count)
	tbl["info1"] = string.format("%s\r%s\r%s", ItemCount, base_type,quantity)

	tbl["remark"] = DescUtility:GetItemExtDesc(tid, cid, t_ext_temp)

	--return tbl
	]]

	return t_temp

end



-- 商城物品描述函数
function DescTool:GetMallItemDesc(tid, cid, count, tbl)


	local t_ext_temp = {}
	t_ext_temp["Num"] = count
	t_ext_temp["UnitPrice"] = 0
	t_ext_temp["Bind"] = false
	t_ext_temp["EquipEndurance"] = 0
	t_ext_temp["EquipRepairCost"] = 0
	t_ext_temp["EquipEssAddon"] = 0
	t_ext_temp["ServiceNPC"] = 0
	t_ext_temp["TimeLimit"] = 0
	t_ext_temp["GiftFromName"] = 0
	t_ext_temp["GiftToName"] = 0
	t_ext_temp["GiftData"] = 0
	t_ext_temp["GiftContent"] = 0
	t_ext_temp["Grade"] = 0
	t_ext_temp["KaiguangState"] = 0

	t_ext_temp["EquipEssAddon"] = {}
	t_ext_temp["EquipEssAddon"]["ext_group_type"] = 1
	t_ext_temp["EquipEssAddon"]["ext_group_generate_type"] = 1
	t_ext_temp["EquipEssAddon"]["ext_group_id"] = 0
	t_ext_temp["EquipEssAddon"]["ext_prop_count"] = 0
	t_ext_temp["EquipEssAddon"]["ext_has_baseprop"] = false

	t_ext_temp["EquipLevel"] = 0
	t_ext_temp["EquipExp"] = 0

	t_ext_temp["EquipUpgradeAddon"] = {}
	t_ext_temp["EquipUpgradeAddon"]["ext_prop_count"] = 0
	t_ext_temp["EquipUpgradeAddon"]["ext_group_type"] = 1
	t_ext_temp["EquipUpgradeAddon"]["ext_group_1_type"] = 1

	t_ext_temp["EquipKaiguangAddon"] = {}
	t_ext_temp["EquipKaiguangAddon"]["ext_group_type"] = 0
	t_ext_temp["EquipKaiguangAddon"]["ext_group_id"] = 0
	t_ext_temp["EquipKaiguangAddon"]["ext_prop_count"] = 0
	t_ext_temp["EquipKaiguangAddon"]["ext_has_baseprop"] = false

	t_ext_temp["EquipReinforceAddon"] = {}

	t_ext_temp["next_reinforce"] = {}
	t_ext_temp["next_kaiguang"] = {}

	t_ext_temp["Dice"] = {}
	t_ext_temp["Dice"][1] = 0

	t_ext_temp["Stone"] = {}
	t_ext_temp["Stone"][1] = {}
	--t_ext_temp["Stone"][1][1] = 0
	t_ext_temp["Stone"][2] = {}
	--t_ext_temp["Stone"][2][1] = 0
	t_ext_temp["Stone"][3] = {}
	--t_ext_temp["Stone"][3][1] = 0
	t_ext_temp["Stone"][4] = {}
	--t_ext_temp["Stone"][4][1] = 0
	
	t_ext_temp["SignName"] = 0
	t_ext_temp["SignLevel"] = 0

	t_ext_temp["GiftFromName"] = --[[!AUTO_289]]""
	t_ext_temp["GiftToName"] = --[[!AUTO_290]]""
	t_ext_temp["GiftData"] = --[[!AUTO_291]]""
	t_ext_temp["GiftContent"] = --[[!AUTO_292]]""

	t_ext_temp["EquipRuneWordAddon"] = {}
	t_ext_temp["RuneWordId"] = 0


	t_temp = DescUtility:CopyTable(ItemTip:GetItemDesc(tid,cid,1,1,t_ext_temp))
	t_temp["remark"] = t_temp["remark"] .. DescUtility:GetMallItemExtraText(t_temp["remark"], tbl)

	t_temp["lab_money"], t_temp["money1"], t_temp["money2"], t_temp["money3"], t_temp["money4"], t_temp["lab_fame"], tbl["fame"], t_temp["lab_exchange"], t_temp["exchange"], t_temp["exchangepic"],t_temp["npc_buy_bind"] = 0

	--[[
	tbl = {}
	--描述面板表头
	tbl["title"] = DescUtility:GetItemName(tid, cid)

	--描述面板图标
	tbl["icon"] = DescUtility:GetItemIcon(tid, cid)

	--描述面板表头
	--1最多3行，2最多1行，3最多2行（用\r分割）
	local type_id = DescUtility:GetNormalItemType(tid, cid)
	local base_type = string.format(ITEM_LIMIT_DESC[12],NORMAL_ITEM_TYPE_DESC[type_id].type_desc)
	local quantity = string.format(ITEM_LIMIT_DESC[16],DescUtility:GetItemMaxQuantity(tid, cid))
	local ItemCount = string.format(ITEM_LIMIT_DESC[24], count)
	tbl["info1"] = string.format("%s\r%s\r%s", ItemCount, base_type,quantity)

	tbl["remark"] = DescUtility:GetItemExtDesc(tid, cid, t_ext_temp)

	--return tbl
	]]

	return t_temp


end


--消息片段描述函数
function DescTool:GetInfoFragmentDesc(tid,cid,context_type,price_scale,ext_tbl)

	tbl = {}

	--描述面板表头
	tbl["title"] = DescUtility:GetItemName(tid, cid)

	--描述面板图标
	tbl["icon"] = DescUtility:GetItemIcon(tid, cid)

	--描述面板表头
	--1最多3行，2最多1行，3最多2行（用\r分割）

	local base_type = string.format(ITEM_LIMIT_DESC[12], DescUtility:GetItemBaseType(cid))
	local quantity = string.format(ITEM_LIMIT_DESC[16],DescUtility:GetItemMaxQuantity(tid, cid))
	tbl["info1"] = string.format(--[[!AUTO_293]]"%s\r%s", base_type,quantity)

	--描述面板星级
	--s_t，s代表星数，-1不显示。t代表显示方案，0为正常，1为同步闪烁，2为待定

	tbl["star"] = --[[!AUTO_294]]"-1_0"

	--描述面板限制（左）与消耗（右）
	--用\r分割

	--描述面板描述信息
	--用\r分割

	--描述面板属性信息


	--用\r分割

	--描述面板附加信息
	--用\r分割

	tbl["limitskill"] = --[[!AUTO_295]]"^FFFFFF使用：提交給幫派活動使"
	if ext_tbl.Content ~= --[[!AUTO_296]]"" then
		tbl["remark"] = --[[!AUTO_297]]"^d7c4a2"..ext_tbl.Content..--[[!AUTO_298]]"\r\r"..DescUtility:GetItemExtDesc(tid, cid, ext_tbl)
	else
		tbl["remark"] = DescUtility:GetItemExtDesc(tid, cid, ext_tbl)
	end

	--描述面板价格信息
	--单位依次：文、贯、金、玉

	--描述面板声望消耗信息


	--描述面板物品兑换信息

	tbl["lab_money"], tbl["money1"], tbl["money2"], tbl["money3"], tbl["money4"], tbl["lab_fame"], tbl["fame"], tbl["lab_exchange"], tbl["exchange"], tbl["exchangepic"],tbl["npc_buy_bind"] = DescUtility:GetItemPrice(tid, cid, context_type, price_scale, ext_tbl)

	--描述面板元宝信息
	--单位依次：银元、金元


	return tbl

end

--藏宝阁宝物描述函数

function DescTool:GetTreasureItemDesc(tid,cid,context_type,price_scale,ext_tbl)

	tbl = {}

	--描述面板表头
	tbl["title"] = DescUtility:GetItemName(tid, cid)

	--描述面板图标
	tbl["icon"] = DescUtility:GetItemIcon(tid, cid)

	--描述面板表头
	--1最多3行，2最多1行，3最多2行（用\r分割）

	local base_type = string.format(ITEM_LIMIT_DESC[12], DescUtility:GetItemBaseType(cid))
	local ext_type = string.format(ITEM_LIMIT_DESC[33], TREASUREITEM_TYPE_DESC[ext_tbl.treasure_type])
	local t_level = string.format(--[[!AUTO_299]]"^FFFFFF檔次：%s", TREASUREITEM_QULITY_DESC[ext_tbl.treasure_grade+1])
	tbl["info1"] = string.format(--[[!AUTO_300]]"%s\r%s\r%s", base_type,ext_type,t_level)
	if ext_tbl["treasure_provider"] then
		tbl["info1"] = string.format(--[[!AUTO_301]]"%s\r提供者：%s",tbl["info1"],ext_tbl["treasure_provider"])
	end

	--描述面板星级
	--s_t，s代表星数，-1不显示。t代表显示方案，0为正常，1为同步闪烁，2为待定

	tbl["star"] = string.format(--[[!AUTO_302]]"%d_0",ext_tbl.treasure_level)

	--描述面板限制（左）与消耗（右）
	--用\r分割

	--描述面板描述信息
	--用\r分割

	--描述面板属性信息

	--用\r分割

	--描述面板附加信息
	--用\r分割

	tbl["desc"] = string.format(--[[!AUTO_303]]"用於幫派建築藏寶閣，可發放寶物福利提高%s%d點",TREASURE_EFFECT_NAME[ext_tbl.treasure_type],TREASURE_EFFECT_DATA[ext_tbl.treasure_type][ext_tbl.treasure_grade+1][ext_tbl.treasure_level])

	tbl["remark"] = DescUtility:GetItemExtDesc(tid, cid, ext_tbl)

	--描述面板价格信息
	--单位依次：文、贯、金、玉

	--描述面板声望消耗信息


	--描述面板物品兑换信息

	tbl["lab_money"], tbl["money1"], tbl["money2"], tbl["money3"], tbl["money4"], tbl["lab_fame"], tbl["fame"], tbl["lab_exchange"], tbl["exchange"], tbl["exchangepic"],tbl["npc_buy_bind"] = DescUtility:GetItemPrice(tid, cid, context_type, price_scale, ext_tbl)

	--描述面板元宝信息
	--单位依次：银元、金元


	return tbl

end

--藏宝阁机关描述函数


function DescTool:GetTreasureIntrigueDesc(tid,cid,context_type,price_scale,ext_tbl)

	tbl = {}

	--描述面板表头
	tbl["title"] = DescUtility:GetItemName(tid, cid)

	--描述面板图标
	tbl["icon"] = DescUtility:GetItemIcon(tid, cid)

	--描述面板表头
	--1最多3行，2最多1行，3最多2行（用\r分割）

	local base_type = string.format(ITEM_LIMIT_DESC[12], DescUtility:GetItemBaseType(cid))
	local quantity = string.format(ITEM_LIMIT_DESC[16],DescUtility:GetItemMaxQuantity(tid, cid))
	tbl["info1"] = string.format(--[[!AUTO_304]]"%s\r%s", base_type,quantity)

	--描述面板星级
	--s_t，s代表星数，-1不显示。t代表显示方案，0为正常，1为同步闪烁，2为待定

	tbl["star"] = --[[!AUTO_305]]"-1_0"

	--描述面板限制（左）与消耗（右）
	--用\r分割

	--描述面板描述信息
	--用\r分割

	--描述面板属性信息


	--用\r分割

	--描述面板附加信息
	--用\r分割

	tbl["desc"] = string.format(--[[!AUTO_306]]"打開藏寶閣機關佈設介面時用右鍵啟動使用，佈設後可以阻止寶物被盜竊。\r%s",TERASURE_TRAP_EFFECT[tid])

	tbl["remark"] = DescUtility:GetItemExtDesc(tid, cid, ext_tbl)

	--描述面板价格信息
	--单位依次：文、贯、金、玉

	--描述面板声望消耗信息


	--描述面板物品兑换信息

	tbl["lab_money"], tbl["money1"], tbl["money2"], tbl["money3"], tbl["money4"], tbl["lab_fame"], tbl["fame"], tbl["lab_exchange"], tbl["exchange"], tbl["exchangepic"],tbl["npc_buy_bind"] = DescUtility:GetItemPrice(tid, cid, context_type, price_scale, ext_tbl)

	--描述面板元宝信息
	--单位依次：银元、金元


	return tbl

end

--藏宝阁地图碎片描述函数

function DescTool:GetTreasureMapPieceDesc(tid,cid,context_type,price_scale,ext_tbl)

	tbl = {}

	--描述面板表头
	tbl["title"] = DescUtility:GetItemName(tid, cid)

	--描述面板图标
	tbl["icon"] = DescUtility:GetItemIcon(tid, cid)

	--描述面板表头
	--1最多3行，2最多1行，3最多2行（用\r分割）

	local base_type = string.format(ITEM_LIMIT_DESC[12], DescUtility:GetItemBaseType(cid))
	local faction_name = string.format(ITEM_LIMIT_DESC[34],ext_tbl.faction_name)
	tbl["info1"] = string.format(--[[!AUTO_307]]"%s\r%s", base_type,faction_name)

	--描述面板星级
	--s_t，s代表星数，-1不显示。t代表显示方案，0为正常，1为同步闪烁，2为待定

	tbl["star"] = --[[!AUTO_308]]"-1_0"

	--描述面板限制（左）与消耗（右）
	--用\r分割

	--描述面板描述信息
	--用\r分割

	--描述面板属性信息


	--用\r分割

	--描述面板附加信息
	--用\r分割
	tbl["remark"] = DescUtility:GetItemExtDesc(tid, cid, ext_tbl)

	--描述面板价格信息
	--单位依次：文、贯、金、玉

	--描述面板声望消耗信息


	--描述面板物品兑换信息

	tbl["lab_money"], tbl["money1"], tbl["money2"], tbl["money3"], tbl["money4"], tbl["lab_fame"], tbl["fame"], tbl["lab_exchange"], tbl["exchange"], tbl["exchangepic"],tbl["npc_buy_bind"] = DescUtility:GetItemPrice(tid, cid, context_type, price_scale, ext_tbl)

	--描述面板元宝信息
	--单位依次：银元、金元


	return tbl

end

-- 易容卡片
function DescTool:GetChangeFaceDesc(tid,cid,context_type,price_scale,ext_tbl)

	tbl = {}

	--描述面板表头
	tbl["title"] = DescUtility:GetItemName(tid, cid)

	--描述面板图标
	tbl["icon"] = DescUtility:GetItemIcon(tid, cid)

	--描述面板表头
	--1最多3行，2最多1行，3最多2行（用\r分割）

	local base_type = string.format(ITEM_LIMIT_DESC[12], DescUtility:GetItemBaseType(cid))
	local quantity = string.format(ITEM_LIMIT_DESC[16],DescUtility:GetItemMaxQuantity(tid, cid))
	local level_limit = DescUtility:GetItemLevelLimit(tid, cid)
	tbl["info1"] = string.format(--[[!AUTO_309]]"%s\r%s%s", base_type,level_limit,quantity)
	tbl["limitskill"] = --[[!AUTO_310]]"^FFFFFF使用：右鍵點擊使用"
	--描述面板星级
	--s_t，s代表星数，-1不显示。t代表显示方案，0为正常，1为同步闪烁，2为待定

	tbl["star"] = --[[!AUTO_311]]"-1_0"

	--描述面板限制（左）与消耗（右）
	--用\r分割

	--描述面板描述信息
	--用\r分割

	--描述面板属性信息


	--用\r分割

	--描述面板附加信息
	--用\r分割

	if CHANGE_FACE_TEXT[tid] then
		tbl["desc"] = CHANGE_FACE_TEXT[tid]
	end
	tbl["remark"] = DescUtility:GetItemExtDesc(tid, cid, ext_tbl)

	--描述面板价格信息
	--单位依次：文、贯、金、玉

	--描述面板声望消耗信息


	--描述面板物品兑换信息

	tbl["lab_money"], tbl["money1"], tbl["money2"], tbl["money3"], tbl["money4"], tbl["lab_fame"], tbl["fame"], tbl["lab_exchange"], tbl["exchange"], tbl["exchangepic"],tbl["npc_buy_bind"] = DescUtility:GetItemPrice(tid, cid, context_type, price_scale, ext_tbl)

	--描述面板元宝信息
	--单位依次：银元、金元


	return tbl

end

-- 口供描述
function DescTool:GetStatmentDesc(tid,cid,context_type,price_scale,ext_tbl)
	tbl = {}
	--描述面板表头
	tbl["title"] = DescUtility:GetItemName(tid, cid)
	--描述面板图标
	tbl["icon"] = DescUtility:GetItemIcon(tid, cid)
	--描述面板表头
	--1最多3行，2最多1行，3最多2行（用\r分割）

	local base_type = string.format(ITEM_LIMIT_DESC[12], DescUtility:GetItemBaseType(cid))
	local quantity = string.format(ITEM_LIMIT_DESC[16],DescUtility:GetItemMaxQuantity(tid, cid))
	tbl["limitskill"] = --[[!AUTO_312]]"^FFFFFF使用：右鍵點擊使用\r限制：同幫派3人以上組隊"

	tbl["info1"] = string.format(--[[!AUTO_313]]"%s\r幫派：山寨\r%s", base_type,quantity)
	--描述面板星级
	--s_t，s代表星数，-1不显示。t代表显示方案，0为正常，1为同步闪烁，2为待定

	tbl["star"] = --[[!AUTO_314]]"-1_0"
	--描述面板限制（左）与消耗（右）
	--用\r分割
	--描述面板描述信息
	--用\r分割
	--描述面板属性信息

	--用\r分割
	--描述面板附加信息
	--用\r分割
	tbl["remark"] = DescUtility:GetItemExtDesc(tid, cid, ext_tbl)
	--描述面板价格信息
	--单位依次：文、贯、金、玉
	--描述面板声望消耗信息

	--描述面板物品兑换信息
	tbl["lab_money"], tbl["money1"], tbl["money2"], tbl["money3"], tbl["money4"], tbl["lab_fame"], tbl["fame"], tbl["lab_exchange"], tbl["exchange"], tbl["exchangepic"],tbl["npc_buy_bind"] = DescUtility:GetItemPrice(tid, cid, context_type, price_scale, ext_tbl)
	--描述面板元宝信息
	--单位依次：银元、金元

	return tbl
end

-- 劫镖货物物品
function DescTool:GetDartDesc(tid,cid,context_type,price_scale,ext_tbl)
	tbl = {}
	--描述面板表头
	tbl["title"] = DescUtility:GetItemName(tid, cid)
	--描述面板图标
	tbl["icon"] = DescUtility:GetItemIcon(tid, cid)
	--描述面板表头
	--1最多3行，2最多1行，3最多2行（用\r分割）

	local base_type = string.format(ITEM_LIMIT_DESC[12], DescUtility:GetItemBaseType(cid))
	local quantity = string.format(ITEM_LIMIT_DESC[16],DescUtility:GetItemMaxQuantity(tid, cid))
	tbl["info1"] = string.format(--[[!AUTO_315]]"%s\r%s", base_type,quantity)
	tbl["limitskill"] = --[[!AUTO_316]]"^FFFFFF用途：可於幫派“黑店老闆”及各\r地鏢行的“山寨探子”處上交兌換\r獎勵"
	--描述面板星级
	--s_t，s代表星数，-1不显示。t代表显示方案，0为正常，1为同步闪烁，2为待定

	tbl["star"] = --[[!AUTO_317]]"-1_0"
	--描述面板限制（左）与消耗（右）
	--用\r分割
	--描述面板描述信息
	--用\r分割
	--描述面板属性信息

	--用\r分割
	--描述面板附加信息
	--用\r分割
	tbl["remark"] = DescUtility:GetItemExtDesc(tid, cid, ext_tbl)
	--描述面板价格信息
	--单位依次：文、贯、金、玉
	--描述面板声望消耗信息

	--描述面板物品兑换信息
	tbl["lab_money"], tbl["money1"], tbl["money2"], tbl["money3"], tbl["money4"], tbl["lab_fame"], tbl["fame"], tbl["lab_exchange"], tbl["exchange"], tbl["exchangepic"],tbl["npc_buy_bind"] = DescUtility:GetItemPrice(tid, cid, context_type, price_scale, ext_tbl)
	--描述面板元宝信息
	--单位依次：银元、金元

	return tbl
end

-- 运劫镖道具

function DescTool:GetDelRobDartDesc(tid,cid,context_type,price_scale,ext_tbl)
	tbl = {}
	--描述面板表头
	tbl["title"] = DescUtility:GetItemName(tid, cid)
	--描述面板图标
	tbl["icon"] = DescUtility:GetItemIcon(tid, cid)
	--描述面板表头
	--1最多3行，2最多1行，3最多2行（用\r分割）

	local _,item_type = GameApi.GetItemDBProp(tid, cid, --[[!]]"道具类型")
	local item_type_desc = {
		[0] = {--[[!AUTO_318]]"解藥",--[[!AUTO_319]]"使用：選擇目標後右鍵點擊使用"},
		[1] = {--[[!AUTO_320]]"探查器",--[[!AUTO_321]]"使用：右鍵點擊使用"},
		[2] = {--[[!AUTO_322]]"解陷阱工具",--[[!AUTO_323]]"用途：解除陷阱時消耗"},
		[3] = {--[[!AUTO_324]]"行鏢令",--[[!AUTO_325]]"用途：在開啟運鏢時選擇使用"},
		[4] = {--[[!AUTO_326]]"行鏢密函",--[[!AUTO_327]]"用途：在開啟運鏢時選擇使用"},
		[5] = {--[[!AUTO_326]]"丹藥",--[[!AUTO_327]]"用途：運送鏢車時使用可以增速"},
		[6] = {--[[!AUTO_326]]"邊疆密令",--[[!AUTO_327]]"用途：可以兌換其他品質的鏢車"},
	}
	local base_type = string.format(ITEM_LIMIT_DESC[12], item_type_desc[item_type][1])
	local quantity = string.format(ITEM_LIMIT_DESC[16],DescUtility:GetItemMaxQuantity(tid, cid))
	tbl["info1"] = string.format(--[[!AUTO_328]]"%s\r%s", base_type,quantity)
	tbl["limitskill"] = item_type_desc[item_type][2]
	--描述面板星级
	--s_t，s代表星数，-1不显示。t代表显示方案，0为正常，1为同步闪烁，2为待定

	tbl["star"] = --[[!AUTO_329]]"-1_0"
	--描述面板限制（左）与消耗（右）
	--用\r分割
	--描述面板描述信息
	--用\r分割
	--描述面板属性信息

	--用\r分割
	--描述面板附加信息
	--用\r分割
	tbl["remark"] = DescUtility:GetItemExtDesc(tid, cid, ext_tbl)
	--描述面板价格信息
	--单位依次：文、贯、金、玉
	--描述面板声望消耗信息

	--描述面板物品兑换信息
	tbl["lab_money"], tbl["money1"], tbl["money2"], tbl["money3"], tbl["money4"], tbl["lab_fame"], tbl["fame"], tbl["lab_exchange"], tbl["exchange"], tbl["exchangepic"],tbl["npc_buy_bind"] = DescUtility:GetItemPrice(tid, cid, context_type, price_scale, ext_tbl)
	--描述面板元宝信息
	--单位依次：银元、金元

	return tbl
end

-- 下药道具
function DescTool:GetPoisonDesc(tid,cid,context_type,price_scale,ext_tbl)
	tbl = {}
	--描述面板表头
	tbl["title"] = DescUtility:GetItemName(tid, cid)
	--描述面板图标
	tbl["icon"] = DescUtility:GetItemIcon(tid, cid)
	--描述面板表头
	--1最多3行，2最多1行，3最多2行（用\r分割）

	local base_type = string.format(ITEM_LIMIT_DESC[12], DescUtility:GetItemBaseType(cid))
	local quantity = string.format(ITEM_LIMIT_DESC[16],DescUtility:GetItemMaxQuantity(tid, cid))
	local _,item_time = GameApi.GetItemDBProp(tid, cid, --[[!]]"持续时间（秒）")
	local _,item_ratio = GameApi.GetItemDBProp(tid, cid, --[[!]]"下药成功几率")
	tbl["info1"] = string.format(--[[!AUTO_330]]"%s\r%s", base_type,quantity)
	tbl["limitskill"] = string.format(--[[!AUTO_331]]"^FFFFFF使用：選擇鏢車右鍵點擊使用\r藥效：使用後有%d%%機率生效，\r持續%d秒。",item_ratio*100,item_time)
	--描述面板星级
	--s_t，s代表星数，-1不显示。t代表显示方案，0为正常，1为同步闪烁，2为待定

	tbl["star"] = --[[!AUTO_332]]"-1_0"
	--描述面板限制（左）与消耗（右）
	--用\r分割
	--描述面板描述信息
	--用\r分割
	--描述面板属性信息

	--用\r分割
	--描述面板附加信息
	--用\r分割
	tbl["remark"] = DescUtility:GetItemExtDesc(tid, cid, ext_tbl)
	--描述面板价格信息
	--单位依次：文、贯、金、玉
	--描述面板声望消耗信息

	--描述面板物品兑换信息
	tbl["lab_money"], tbl["money1"], tbl["money2"], tbl["money3"], tbl["money4"], tbl["lab_fame"], tbl["fame"], tbl["lab_exchange"], tbl["exchange"], tbl["exchangepic"],tbl["npc_buy_bind"] = DescUtility:GetItemPrice(tid, cid, context_type, price_scale, ext_tbl)
	--描述面板元宝信息
	--单位依次：银元、金元

	return tbl
end

-- 陷阱道具
function DescTool:GetSetTrapDesc(tid,cid,context_type,price_scale,ext_tbl)
	tbl = {}
	--描述面板表头
	tbl["title"] = DescUtility:GetItemName(tid, cid)
	--描述面板图标
	tbl["icon"] = DescUtility:GetItemIcon(tid, cid)
	--描述面板表头
	--1最多3行，2最多1行，3最多2行（用\r分割）

	local base_type = string.format(ITEM_LIMIT_DESC[12], DescUtility:GetItemBaseType(cid))
	local quantity = string.format(ITEM_LIMIT_DESC[16],DescUtility:GetItemMaxQuantity(tid, cid))
	local _,trap_range,buff_range,trap_time = GameApi.GetItemDBProp(tid, cid, --[[!]]"触发最大距离（米）",--[[!]]"陷阱buff范围（米）",--[[!]]"作用时间（秒）")

	tbl["info1"] = string.format(--[[!AUTO_333]]"%s\r範圍：%d米\r%s", base_type,trap_range,quantity)
	tbl["limitskill"] =--[[!AUTO_334]]"^FFFFFF使用：右鍵點擊後，移動滑鼠選擇\r要放置的位置，左鍵點擊確定放置"
	tbl["desc"] = string.format(--[[!AUTO_335]]"效果：使鏢車在%d秒內不可移動，並使%d米範圍內運鏢者受到持續傷害",trap_time,buff_range)
	--描述面板星级
	--s_t，s代表星数，-1不显示。t代表显示方案，0为正常，1为同步闪烁，2为待定

	tbl["star"] = --[[!AUTO_336]]"-1_0"
	--描述面板限制（左）与消耗（右）
	--用\r分割
	--描述面板描述信息
	--用\r分割
	--描述面板属性信息

	--用\r分割
	--描述面板附加信息
	--用\r分割
	tbl["remark"] = DescUtility:GetItemExtDesc(tid, cid, ext_tbl)
	--描述面板价格信息
	--单位依次：文、贯、金、玉
	--描述面板声望消耗信息

	--描述面板物品兑换信息
	tbl["lab_money"], tbl["money1"], tbl["money2"], tbl["money3"], tbl["money4"], tbl["lab_fame"], tbl["fame"], tbl["lab_exchange"], tbl["exchange"], tbl["exchangepic"],tbl["npc_buy_bind"] = DescUtility:GetItemPrice(tid, cid, context_type, price_scale, ext_tbl)
	--描述面板元宝信息
	--单位依次：银元、金元

	return tbl
end

-- 开宠物道具
function DescTool:GetPetSummonItemDesc(tid,cid,context_type,price_scale,ext_tbl)
	tbl = {}
	--描述面板表头
	tbl["title"] = DescUtility:GetItemName(tid, cid)
	--描述面板图标
	tbl["icon"] = DescUtility:GetItemIcon(tid, cid)
	--描述面板表头
	--1最多3行，2最多1行，3最多2行（用\r分割）

	local base_type = string.format(ITEM_LIMIT_DESC[12], DescUtility:GetItemBaseType(cid))
	local quantity = string.format(ITEM_LIMIT_DESC[16],DescUtility:GetItemMaxQuantity(tid, cid))
	local _,pet_temp_id = GameApi.GetItemDBProp(tid, cid, --[[!]]"使用后获得宠物ID")
	local _,pet_point_sum,pet_point1,pet_point2,pet_point3,pet_point4,pet_point5,need_player_level = GameApi.GetItemDBProp(pet_temp_id, ClassType.ICID_PET_BEDGE, --[[!]]"宠物天资总数期望系数",--[[!]]"资质1的最小分配比例",--[[!]]"资质2的最小分配比例",--[[!]]"资质3的最小分配比例",--[[!]]"资质4的最小分配比例",--[[!]]"资质5的最小分配比例",--[[!]]"需求玩家等级")
	local player_level_limit = string.format(ITEM_LIMIT_DESC[36], need_player_level)
	tbl["info1"] = string.format(--[[!AUTO_337]]"%s\r%s", base_type,quantity)
	--描述面板星级
	tbl["limitskill"] = --[[!AUTO_338]]"使用說明：右鍵點擊使用\r" .. player_level_limit
	local point_level = {}
	point_level[1] = DescUtility:GetPetPointLevel(pet_point_sum,pet_point1)
	point_level[2] = DescUtility:GetPetPointLevel(pet_point_sum,pet_point5)
	point_level[3] = DescUtility:GetPetPointLevel(pet_point_sum,pet_point2)
	point_level[4] = DescUtility:GetPetPointLevel(pet_point_sum,pet_point3)
	point_level[5] = DescUtility:GetPetPointLevel(pet_point_sum,pet_point4)

	tbl["desc"]= --[[!AUTO_339]]""
	for i = 1,5 do
		tbl["desc"]=tbl["desc"] .. string.format(--[[!AUTO_340]]"%s：%s",TEMP_PET_POINT_TEXT[i].name,TEMP_PET_POINT_TEXT[point_level[i]].level)

		if i ~= 5 then
			tbl["desc"] = tbl["desc"] .. --[[!AUTO_341]]"\r"
		end
	end

	--s_t，s代表星数，-1不显示。t代表显示方案，0为正常，1为同步闪烁，2为待定

	tbl["star"] = --[[!AUTO_342]]"-1_0"
	--描述面板限制（左）与消耗（右）
	--用\r分割
	--描述面板描述信息
	--用\r分割
	--描述面板属性信息

	--用\r分割
	--描述面板附加信息
	--用\r分割
	tbl["remark"] = DescUtility:GetItemExtDesc(tid, cid, ext_tbl)
	--描述面板价格信息
	--单位依次：文、贯、金、玉
	--描述面板声望消耗信息

	--描述面板物品兑换信息
	tbl["lab_money"], tbl["money1"], tbl["money2"], tbl["money3"], tbl["money4"], tbl["lab_fame"], tbl["fame"], tbl["lab_exchange"], tbl["exchange"], tbl["exchangepic"],tbl["npc_buy_bind"] = DescUtility:GetItemPrice(tid, cid, context_type, price_scale, ext_tbl)
	--描述面板元宝信息
	--单位依次：银元、金元

	return tbl
end

-- 错误描述
function DescTool:GetErrorDesc()
	tbl = {}
	--描述面板表头
	tbl["title"] = --[[!AUTO_343]]"錯誤道具"
	--描述面板图标
	tbl["icon"] = --[[!AUTO_344]]"00752未知物品.dds"
	--描述面板表头
	--1最多3行，2最多1行，3最多2行（用\r分割）
	tbl["info1"] = --[[!AUTO_345]]"未知類型"
	--描述面板星级
	--s_t，s代表星数，-1不显示。t代表显示方案，0为正常，1为同步闪烁，2为待定
	tbl["star"] = --[[!AUTO_346]]"-1_0"
	--描述面板限制（左）与消耗（右）
	--用\r分割
	--描述面板描述信息
	--用\r分割
	tbl["desc"] = --[[!AUTO_347]]""
	--描述面板属性信息
	--用\r分割
	--描述面板附加信息
	--用\r分割
	tbl["remark"] = --[[!AUTO_348]]""
	--描述面板价格信息
	--单位依次：文、贯、金、玉
	--描述面板声望消耗信息
	--描述面板物品兑换信息
	--描述面板元宝信息
	--单位依次：银元、金元
	return tbl
end

-- 线索物品
function DescTool:GetClueItemDesc(tid,cid,context_type,price_scale,ext_tbl)
	tbl = {}
	--描述面板表头
	tbl["title"] = DescUtility:GetItemName(tid, cid)
	--描述面板图标
	tbl["icon"] = DescUtility:GetItemIcon(tid, cid)
	--描述面板表头
	--1最多3行，2最多1行，3最多2行（用\r分割）
	local _,clue_type = GameApi.GetItemDBProp(tid, cid, --[[!]]"线索分类")
	local base_type = string.format(ITEM_LIMIT_DESC[12], CLUE_ITEM_TYPE_DESC[clue_type])
	local quantity = string.format(ITEM_LIMIT_DESC[16],DescUtility:GetItemMaxQuantity(tid, cid))
	tbl["info1"] = string.format(--[[!AUTO_349]]"%s\r%s", base_type,quantity)
	--描述面板星级
	--s_t，s代表星数，-1不显示。t代表显示方案，0为正常，1为同步闪烁，2为待定
	tbl["star"] = --[[!AUTO_350]]"-1_0"
	--描述面板限制（左）与消耗（右）
	--用\r分割
	--描述面板描述信息
	--用\r分割
	--描述面板属性信息
	--用\r分割
	--描述面板附加信息
	--用\r分割
	tbl["remark"] = DescUtility:GetItemExtDesc(tid, cid, ext_tbl)
	--描述面板价格信息
	--单位依次：文、贯、金、玉
	--描述面板声望消耗信息
	--描述面板物品兑换信息
	tbl["lab_money"], tbl["money1"], tbl["money2"], tbl["money3"], tbl["money4"], tbl["lab_fame"], tbl["fame"], tbl["lab_exchange"], tbl["exchange"], tbl["exchangepic"],tbl["npc_buy_bind"] = DescUtility:GetItemPrice(tid, cid, context_type, price_scale, ext_tbl)
	--描述面板元宝信息
	--单位依次：银元、金元
	return tbl
end

function DescTool:GetClueItemDescNoColor(tid)
	if item_ext_desc[tid] then
		local str = string.gsub(item_ext_desc[tid],--[[!AUTO_351]]"%^[%dA-Fa-f][%dA-Fa-f][%dA-Fa-f][%dA-Fa-f][%dA-Fa-f][%dA-Fa-f]",--[[!AUTO_352]]"")
		while #str > 0 and str:sub(1,1) == "\r" do
			str = str:sub(2)
		end
		return str
	else
		return --[[!AUTO_353]]""
	end
end

-- 宠物洗髓道具
function DescTool:GetPetXisuiDesc(tid,cid,context_type,price_scale,ext_tbl)
	tbl = {}
	--描述面板表头
	tbl["title"] = DescUtility:GetItemName(tid, cid)
	--描述面板图标
	tbl["icon"] = DescUtility:GetItemIcon(tid, cid)
	--描述面板表头
	--1最多3行，2最多1行，3最多2行（用\r分割）
	local base_type = string.format(ITEM_LIMIT_DESC[12], DescUtility:GetItemBaseType(cid))
	local quantity = string.format(ITEM_LIMIT_DESC[16],DescUtility:GetItemMaxQuantity(tid, cid))
	tbl["info1"] = string.format(--[[!AUTO_355]]"%s\r%s", base_type,quantity)
	--描述面板星级
	--s_t，s代表星数，-1不显示。t代表显示方案，0为正常，1为同步闪烁，2为待定
	tbl["star"] = --[[!AUTO_356]]"-1_0"
	--描述面板限制（左）与消耗（右）
	--用\r分割
	--描述面板描述信息
	--用\r分割
	--描述面板属性信息
	--用\r分割
	--描述面板附加信息
	--用\r分割
	tbl["remark"] = DescUtility:GetItemExtDesc(tid, cid, ext_tbl)
	--描述面板价格信息
	--单位依次：文、贯、金、玉
	--描述面板声望消耗信息
	--描述面板物品兑换信息
	tbl["lab_money"], tbl["money1"], tbl["money2"], tbl["money3"], tbl["money4"], tbl["lab_fame"], tbl["fame"], tbl["lab_exchange"], tbl["exchange"], tbl["exchangepic"],tbl["npc_buy_bind"] = DescUtility:GetItemPrice(tid, cid, context_type, price_scale, ext_tbl)
	--描述面板元宝信息
	--单位依次：银元、金元
	return tbl
end

--表情包描述
function DescTool:GetEmotionItemDesc(tid,cid,context_type,price_scale,ext_tbl)

	tbl = {}

	--描述面板表头
	tbl["title"] = DescUtility:GetItemName(tid, cid)

	--描述面板图标
	tbl["icon"] = DescUtility:GetItemIcon(tid, cid)

	--描述面板表头
	--1最多3行，2最多1行，3最多2行（用\r分割）
	local type_id = DescUtility:GetNormalItemType(tid, cid)
	local base_type = --[[!AUTO_357]]"物品類型：表情包"
	local quantity = string.format(ITEM_LIMIT_DESC[16],DescUtility:GetItemMaxQuantity(tid, cid))
	tbl["info1"] = string.format(--[[!AUTO_358]]"%s\r%s", base_type,quantity)

	--描述面板星级
	--s_t，s代表星数，-1不显示。t代表显示方案，0为正常，1为同步闪烁，2为待定
	tbl["star"] = --[[!AUTO_359]]"-1_0"

	--描述面板限制（左）与消耗（右）
	--用\r分割

	--描述面板描述信息
	--用\r分割
	tbl["limitskill"] = DescUtility:GetEmotionItemTime(tid, cid)
	--tbl["limitskill"] = NORMAL_ITEM_TYPE_DESC[type_id].use_desc

	--描述面板属性信息
	--用\r分割


	--描述面板附加信息
	--用\r分割
	tbl["remark"] = DescUtility:GetItemExtDesc(tid, cid, ext_tbl)

	--描述面板价格信息
	--单位依次：文、贯、金、玉

	--描述面板声望消耗信息

	--描述面板物品兑换信息

	tbl["lab_money"], tbl["money1"], tbl["money2"], tbl["money3"], tbl["money4"], tbl["lab_fame"], tbl["fame"], tbl["lab_exchange"], tbl["exchange"], tbl["exchangepic"],tbl["npc_buy_bind"] = DescUtility:GetItemPrice(tid, cid, context_type, price_scale, ext_tbl)

	--描述面板元宝信息
	--单位依次：银元、金元

--[[
	--描述面板价格信息
	--单位依次：文、贯、金、玉
	local tiplabmoney = ""
	local tipmoney1 = ""
	local tipmoney2 = ""
	local tipmoney3 = ""
	local tipmoney4 = ""
	tiplabmoney = "单价"
	tipmoney1 = "500"
	tipmoney2 = "2"

	--描述面板声望消耗信息
	local tiplabfame = ""
	local tipfame = ""
	tiplabfame = "接受条件"
	tipfame = "200江湖威望"

	--描述面板物品兑换信息
	local tiplabexchange = ""
	local tipexchange = ""
	local tipexchangepic = ""
	tiplabexchange = "交换条件"
	tipexchange = "1 × " .. DescUtility:GetItemName(tid, cid)
	tipexchangepic = DescUtility:GetItemIcon(tid, cid)

	--描述面板元宝信息
	--单位依次：银元、金元
	local tiplabxcash = ""
	local tipgold1 = ""
	local tipgold2 = ""
	tiplabxcash = "快递价格"
	tipgold1 = "00"
	tipgold2 = "10"
]]--
	return tbl

end

--人物传功道具
function DescTool:GetPlayerChuangongDesc(tid,cid,context_type,price_scale,ext_tbl)
	tbl = {}
	--描述面板表头
	tbl["title"] = DescUtility:GetItemName(tid, cid)
	--描述面板图标
	tbl["icon"] = DescUtility:GetItemIcon(tid, cid)
	--描述面板表头
	--1最多3行，2最多1行，3最多2行（用\r分割）
	local base_type = string.format(ITEM_LIMIT_DESC[12], DescUtility:GetItemBaseType(cid))
	local quantity = string.format(ITEM_LIMIT_DESC[16],DescUtility:GetItemMaxQuantity(tid, cid))
	local lv_limt = DescUtility:GetItemLevelLimit(tid, cid)
	tbl["info1"] = string.format(--[[!AUTO_360]]"%s\r%s%s", base_type,lv_limt,quantity)
	--描述面板星级
	--s_t，s代表星数，-1不显示。t代表显示方案，0为正常，1为同步闪烁，2为待定
	tbl["star"] = --[[!AUTO_361]]"-1_0"
	--描述面板限制（左）与消耗（右）
	--用\r分割
	--描述面板描述信息
	--用\r分割
	--描述面板属性信息
	--用\r分割
	--描述面板附加信息
	--用\r分割
	tbl["remark"] = DescUtility:GetItemExtDesc(tid, cid, ext_tbl)
	--描述面板价格信息
	--单位依次：文、贯、金、玉
	--描述面板声望消耗信息
	--描述面板物品兑换信息
	tbl["lab_money"], tbl["money1"], tbl["money2"], tbl["money3"], tbl["money4"], tbl["lab_fame"], tbl["fame"], tbl["lab_exchange"], tbl["exchange"], tbl["exchangepic"],tbl["npc_buy_bind"] = DescUtility:GetItemPrice(tid, cid, context_type, price_scale, ext_tbl)
	--描述面板元宝信息
	--单位依次：银元、金元
	return tbl
end

-- 暗器器具
function DescTool:GetDartsWeaponDesc(tid,cid,context_type,price_scale,ext_tbl)
	tbl = {}
	--描述面板表头
	tbl["title"] = DescUtility:GetItemName(tid, cid)
	--描述面板图标
	tbl["icon"] = DescUtility:GetItemIcon(tid, cid)
	--描述面板表头
	--1最多3行，2最多1行，3最多2行（用\r分割）

	local base_type = string.format(ITEM_LIMIT_DESC[12], DescUtility:GetItemBaseType(cid))
	local anqi_type = string.format(ITEM_LIMIT_DESC[38], DescUtility:GetAnQiEquipType(tid, cid))
	local quantity = string.format(ITEM_LIMIT_DESC[16],DescUtility:GetItemMaxQuantity(tid, cid))
	tbl["info1"] = string.format(--[[!AUTO_368]]"%s\r%s\r%s", base_type, anqi_type, quantity)
	--描述面板星级
	--s_t，s代表星数，-1不显示。t代表显示方案，0为正常，1为同步闪烁，2为待定

	tbl["star"] = --[[!AUTO_363]]"-1_0"
	--描述面板限制（左）与消耗（右）
	--用\r分割
	--描述面板描述信息
	--用\r分割
	--描述面板属性信息
	tbl["limitskill"] = --[[!AUTO_369]]"^FFFFFF使用：右鍵點擊使用"
	local _,skill_id = DescUtility:GetItemDBProp(tid, cid, --[[!]]"暗器使用对应的技能ID")
	tbl["desc"] = SKILL_DETAIL_DESC[skill_id]
	--用\r分割
	--描述面板附加信息
	--用\r分割
	tbl["remark"] = DescUtility:GetItemExtDesc(tid, cid, ext_tbl)
	--描述面板价格信息
	--单位依次：文、贯、金、玉
	--描述面板声望消耗信息

	--描述面板物品兑换信息
	tbl["lab_money"], tbl["money1"], tbl["money2"], tbl["money3"], tbl["money4"], tbl["lab_fame"], tbl["fame"], tbl["lab_exchange"], tbl["exchange"], tbl["exchangepic"],tbl["npc_buy_bind"] = DescUtility:GetItemPrice(tid, cid, context_type, price_scale, ext_tbl)
	--描述面板元宝信息
	--单位依次：银元、金元
	return tbl
end

-- 暗器匣
function DescTool:GetDartsBoxDesc(tid,cid,context_type,price_scale,ext_tbl)
	tbl = {}
	--描述面板表头
	tbl["title"] = DescUtility:GetItemName(tid, cid)
	--描述面板图标
	tbl["icon"] = DescUtility:GetItemIcon(tid, cid)
	--描述面板表头
	--1最多3行，2最多1行，3最多2行（用\r分割）

	local base_type = string.format(ITEM_LIMIT_DESC[12], DescUtility:GetItemBaseType(cid))
	local quantity = string.format(ITEM_LIMIT_DESC[16],DescUtility:GetItemMaxQuantity(tid, cid))
	--支持的暗器类型
	local _, darts_support = DescUtility:GetItemDBProp(tid, ClassType.ICID_DARTS_BOX, --[[!]]"支持的暗器器具类型")
	local _, darts_lv_limit = DescUtility:GetItemDBProp(tid, ClassType.ICID_DARTS_BOX, --[[!]]"暗器匣升级上限")
	local darts_support_desc=--[[!AUTO_370]]""
	if bit.band(darts_support,1) > 0 then
		darts_support_desc = darts_support_desc .. --[[!AUTO_371]]"飛鏢"
	end
	if bit.band(darts_support,2) > 0 then
		darts_support_desc = darts_support_desc .. --[[!AUTO_372]]" 飛石"
	end
	if bit.band(darts_support,4) > 0 then
		darts_support_desc = darts_support_desc .. --[[!AUTO_373]]" 飛刀"
	end
	if bit.band(darts_support,8) > 0 then
		darts_support_desc = darts_support_desc .. --[[!AUTO_374]]" 飛針"
	end
	if bit.band(darts_support,16) > 0 then
		darts_support_desc = darts_support_desc .. --[[!AUTO_375]]" 飛索"
	end
	if bit.band(darts_support,32) > 0 then
		darts_support_desc = darts_support_desc .. --[[!AUTO_376]]" 機關"
	end
	darts_support_desc = string.format(ITEM_LIMIT_DESC[37],darts_support_desc)
	tbl["info1"] = string.format(--[[!AUTO_362]]"%s", base_type)
	tbl["limitskill"] =  darts_support_desc
	--描述面板星级
	--s_t，s代表星数，-1不显示。t代表显示方案，0为正常，1为同步闪烁，2为待定
	local _,equip_quality = DescUtility:GetItemDBProp(tid, ClassType.ICID_DARTS_BOX, --[[!]]"品质")
	if equip_quality >0 then
		tbl["star"] = string.format(--[[!AUTO_31]]"%s_0",equip_quality)
	end

	tbl["star"] = --[[!AUTO_363]]"-1_0"
	--描述面板限制（左）与消耗（右）
	--用\r分割
	--描述面板描述信息
	--用\r分割
	--描述面板属性信息

	--强化信息
	local darts_up_max = 0
	local total_exp = 0
	for i = 2 , 200 do
		local _, darts_up_tmpl = DescUtility:GetItemDBProp(tid, ClassType.ICID_DARTS_BOX, string.format(--[[!]]"暗器匣升到第%d级模板",i))
		if darts_up_tmpl <= 0 then
			break
		end
		darts_up_max = darts_up_max + 1
	end

	local darts_level = ext_tbl["Level"]
	if	darts_level > 0 then
		tbl["title"] = tbl["title"] .. --[[!AUTO_377]]" +" .. darts_level
	end

	if darts_level < darts_lv_limit then
		local _, darts_up_tmpl = DescUtility:GetItemDBProp(tid, ClassType.ICID_DARTS_BOX, string.format(--[[!]]"暗器匣升到第%d级模板",darts_level+1))
		_,total_exp = DescUtility:GetItemDBProp(darts_up_tmpl, ClassType.ECID_DARTS_BOX_LEVELUP, --[[!]]"暗器匣升级需要暗器匣经验")
	end

	--属性点
	local potential= ext_tbl["Potential"]
	local potential_desc = --[[!AUTO_378]]""
	tbl["strengthen"] = --[[!AUTO_379]]""

	potential_desc = string.format(--[[!AUTO_380]]"%s：%s",TEXT_APPLITITUTE_ATTRIBUTE[1],potential[1])
	potential_desc = potential_desc .. --[[!AUTO_381]]"\r" .. string.format(--[[!AUTO_382]]"%s：%s",TEXT_APPLITITUTE_ATTRIBUTE[5],potential[5])
	potential_desc = potential_desc .. --[[!AUTO_383]]"\r" .. string.format(--[[!AUTO_384]]"%s：%s",TEXT_APPLITITUTE_ATTRIBUTE[2],potential[2])
	potential_desc = potential_desc .. --[[!AUTO_385]]"\r" .. string.format(--[[!AUTO_386]]"%s：%s",TEXT_APPLITITUTE_ATTRIBUTE[3],potential[3])
	potential_desc = potential_desc .. --[[!AUTO_387]]"\r" .. string.format(--[[!AUTO_388]]"%s：%s",TEXT_APPLITITUTE_ATTRIBUTE[4],potential[4])
	if not (potential[1] == 0 and potential[2] == 0 and potential[3] == 0 and potential[4] == 0 and potential[5] == 0) then
		tbl["strengthen"] = string.format(--[[!AUTO_389]]"%s\r%s",ANQI_ESS_DESC,potential_desc)
	end

	--本体属性
	local EssAddon = ext_tbl["EssAddon"]
	local ess_Addon__desc = --[[!AUTO_390]]""
	local ess_addon_type
	local ess_addon_rand
	local ess_addon_param1
	local ess_addon_param2
	local ess_addon_value

	if EssAddon["ext_prop_count"] and EssAddon["ext_prop_count"] > 0 then
		for i = 1 ,EssAddon["ext_prop_count"] do
			ess_addon_type = EssAddon[string.format(--[[!AUTO_391]]"ext_prop_%d_type",i)]
			ess_addon_rand = EssAddon[string.format(--[[!AUTO_392]]"ext_prop_%d_rand",i)]
			ess_addon_param1 = EssAddon[string.format(--[[!AUTO_393]]"ext_prop_%d_param1",i)]
			ess_addon_param2 = EssAddon[string.format(--[[!AUTO_394]]"ext_prop_%d_param2",i)]
			ess_addon_value = DescUtility:GetEquipRandValue(ess_addon_rand, ess_addon_param1, ess_addon_param2)
			if ess_addon_type == 58 or ess_addon_type == 59 or ess_addon_type == 60 or ess_addon_type == 61 then
				ess_addon_value = ess_addon_value / 100
			end
			if ess_desc == --[[!AUTO_395]]"" then
				ess_Addon__desc = string.format(EQUIP_ESSENCE_TYPE[ess_addon_type].style,ess_addon_value)
			else
				ess_Addon__desc = ess_Addon__desc .. --[[!AUTO_396]]"\r" .. string.format(EQUIP_ESSENCE_TYPE[ess_addon_type].style,ess_addon_value)
			end
		end
	end

	--节点属性
	local UpgradeAddon = ext_tbl["UpgradeAddon"]
	local up_Addon_desc = --[[!AUTO_397]]""
	local up_addon_type
	local up_addon_rand
	local up_addon_param1
	local up_addon_param2
	local up_addon_value
	if UpgradeAddon["ext_prop_count"] and UpgradeAddon["ext_prop_count"] > 0 then
		for i = 1 ,UpgradeAddon["ext_prop_count"] do
			up_addon_type = UpgradeAddon[string.format(--[[!AUTO_398]]"ext_prop_%d_type",i)]
			up_addon_rand = UpgradeAddon[string.format(--[[!AUTO_399]]"ext_prop_%d_rand",i)]
			up_addon_param1 = UpgradeAddon[string.format(--[[!AUTO_400]]"ext_prop_%d_param1",i)]
			up_addon_param2 = UpgradeAddon[string.format(--[[!AUTO_401]]"ext_prop_%d_param2",i)]
			up_addon_value = DescUtility:GetEquipRandValue(up_addon_rand, up_addon_param1, up_addon_param2)
			if up_addon_type == 58 or up_addon_type == 59 or up_addon_type == 60 or up_addon_type == 61 then
				up_addon_value = up_addon_value / 100
			end
			LogPrint(--[[!AUTO_402]]"up_addon_type:" .. up_addon_type)
			LogPrint(--[[!AUTO_403]]"up_addon_value:" .. up_addon_value)
			if up_Addon_desc == --[[!AUTO_404]]"" then
				up_Addon_desc = string.format(EQUIP_ESSENCE_TYPE[up_addon_type].style,up_addon_value)
			else
				up_Addon_desc = up_Addon_desc .. --[[!AUTO_405]]"\r" .. string.format(EQUIP_ESSENCE_TYPE[up_addon_type].style,up_addon_value)
			end
		end
	end
	if ess_Addon__desc ~= --[[!AUTO_406]]"" or up_Addon_desc ~= --[[!AUTO_407]]"" then
		tbl["strengthen"] =string.format(--[[!AUTO_408]]"%s\r\r%s",tbl["strengthen"],ANQI_ADDON_DESC)
		if ess_Addon__desc ~= --[[!AUTO_409]]"" then
			tbl["strengthen"] =string.format(--[[!AUTO_410]]"%s\r%s",tbl["strengthen"],ess_Addon__desc)
		end
		if up_Addon_desc ~= --[[!AUTO_411]]"" then
			tbl["strengthen"] =string.format(--[[!AUTO_412]]"%s\r%s",tbl["strengthen"],up_Addon_desc)
		end
	end


	--宝石
	e_Stone = DescUtility:CopyTable(ext_tbl["Stone"])
	tbl["diamonds"] = DescUtility:GetESTONEDesc(tbl,tid,cid,ext_tbl)

	--用\r分割
	--描述面板附加信息
	--用\r分割
	tbl["remark"] = DescUtility:GetItemExtDesc(tid, cid, ext_tbl)
	local exp_desc = --[[!AUTO_413]]""
	LogPrint("darts_level:" .. darts_level)
	LogPrint("darts_up_max:" .. darts_up_max)
	if darts_level == darts_up_max then
		exp_desc =string.format(--[[!AUTO_414]]"%s%s^ffffff\r%s",TAG_COLOR_ESSENCE[12],ANQI_UPGRADE_LEVELUP, EQUIP_UPGRADE_LEVEL_MAX)
	else
		local level_exp = ext_tbl["Exp"]
		exp_desc =string.format(--[[!AUTO_415]]"%s%s^ffffff\r%s",TAG_COLOR_ESSENCE[12],ANQI_UPGRADE_LEVELUP, string.format(ITEM_LIMIT_DESC[32],level_exp,total_exp))
	end
	if tbl["remark"] == --[[!AUTO_416]]"" then
		tbl["remark"] = exp_desc
	else
		tbl["remark"] = tbl["remark"] .. --[[!AUTO_417]]"\r" .. exp_desc
	end

	--描述面板价格信息
	--单位依次：文、贯、金、玉
	--描述面板声望消耗信息

	--描述面板物品兑换信息
	tbl["lab_money"], tbl["money1"], tbl["money2"], tbl["money3"], tbl["money4"], tbl["lab_fame"], tbl["fame"], tbl["lab_exchange"], tbl["exchange"], tbl["exchangepic"],tbl["npc_buy_bind"] = DescUtility:GetItemPrice(tid, cid, context_type, price_scale, ext_tbl)
	--描述面板元宝信息
	--单位依次：银元、金元

	return tbl
end

--萌宠
function DescTool:GetCutePetItemDesc(tid,cid,context_type,price_scale,ext_tbl)
	tbl = {}
	--描述面板表头
	if ext_tbl["Level"] and ext_tbl["Level"] > 0 then
		tbl["title"] = string.format(--[[!AUTO_1]]"%s+%s",DescUtility:GetItemName(tid, cid),ext_tbl["Level"])
	else
		tbl["title"] = DescUtility:GetItemName(tid, cid)
	end
	--描述面板图标
	tbl["icon"] = DescUtility:GetItemIcon(tid, cid)
	--描述面板表头
	--1最多3行，2最多1行，3最多2行（用\r分割）

	local base_type = string.format(ITEM_LIMIT_DESC[12], DescUtility:GetItemBaseType(cid))
	local quantity = string.format(ITEM_LIMIT_DESC[16],DescUtility:GetItemMaxQuantity(tid, cid))
	tbl["info1"] = string.format(--[[!AUTO_362]]"%s\r%s", base_type,quantity)
	--描述面板星级
	--s_t，s代表星数，-1不显示。t代表显示方案，0为正常，1为同步闪烁，2为待定

	tbl["star"] = --[[!AUTO_363]]"-1_0"
	--描述面板限制（左）与消耗（右）
	--用\r分割
	--描述面板描述信息
	--用\r分割
	--描述面板属性信息
	tbl["limitskill"] = --[[!AUTO_369]]"^FFFFFF使用：右鍵點擊使用"

	--用\r分割
	--描述面板附加信息
	--用\r分割
	tbl["remark"] = DescUtility:GetItemExtDesc(tid, cid, ext_tbl)
	--描述面板价格信息
	--单位依次：文、贯、金、玉
	--描述面板声望消耗信息

	--描述面板物品兑换信息
	tbl["lab_money"], tbl["money1"], tbl["money2"], tbl["money3"], tbl["money4"], tbl["lab_fame"], tbl["fame"], tbl["lab_exchange"], tbl["exchange"], tbl["exchangepic"],tbl["npc_buy_bind"] = DescUtility:GetItemPrice(tid, cid, context_type, price_scale, ext_tbl)
	--描述面板元宝信息
	--单位依次：银元、金元

	return tbl
end


--属性石
function DescTool:GetPStoneItemDesc(tid,cid,context_type,price_scale,ext_tbl)
	LogPrint("1111111111111111111")
	tbl = {}
	--描述面板表头
	if ext_tbl["Level"] and ext_tbl["Level"] > 0 then
		tbl["title"] = string.format(--[[!AUTO_1]]"%s+%s",DescUtility:GetItemName(tid, cid),ext_tbl["Level"])
	else
		tbl["title"] = DescUtility:GetItemName(tid, cid)
	end
	--描述面板图标
	tbl["icon"] = DescUtility:GetItemIcon(tid, cid)
	--描述面板表头
	--1最多3行，2最多1行，3最多2行（用\r分割）


	local base_type = string.format(ITEM_LIMIT_DESC[12], DescUtility:GetItemBaseType(cid))
	local _,equip_level_min = DescUtility:GetItemDBProp(tid, cid, "最低裝備等級限制" )
	local _,equip_level_max = DescUtility:GetItemDBProp(tid, cid, "最高裝備等級限制" )
	local equip_level_text = string.format(ITEM_LIMIT_DESC[42],equip_level_min,equip_level_max)
	local quantity = string.format(ITEM_LIMIT_DESC[16],DescUtility:GetItemMaxQuantity(tid, cid))
	tbl["info1"] = string.format(--[[!AUTO_362]]"%s\r%s\r%s", base_type,equip_level_text,quantity)
	--描述面板星级
	--s_t，s代表星数，-1不显示。t代表显示方案，0为正常，1为同步闪烁，2为待定

	tbl["star"] = --[[!AUTO_363]]"-1_0"
	--描述面板限制（左）与消耗（右）
	--用\r分割
	--描述面板描述信息
	--用\r分割
	--描述面板属性信息


	--用\r分割
	--描述面板附加信息
	--用\r分割
	tbl["remark"] = DescUtility:GetItemExtDesc(tid, cid, ext_tbl)
	--描述面板价格信息
	--单位依次：文、贯、金、玉
	--描述面板声望消耗信息

	--描述面板物品兑换信息
	tbl["lab_money"], tbl["money1"], tbl["money2"], tbl["money3"], tbl["money4"], tbl["lab_fame"], tbl["fame"], tbl["lab_exchange"], tbl["exchange"], tbl["exchangepic"],tbl["npc_buy_bind"] = DescUtility:GetItemPrice(tid, cid, context_type, price_scale, ext_tbl)
	--描述面板元宝信息
	--单位依次：银元、金元

	return tbl
end


-- 时装图纸描述函数
function DescTool:GetFASHIONRECIPTDesc(tid,cid,context_type,price_scale,ext_tbl)
	--GmaeApi.GetRecipeTable
	--key为配方id，value为配方等级
	tbl = {}
	--描述面板表头
	tbl["title"] = DescUtility:GetItemName(tid, cid)

	--描述面板图标
	tbl["icon"] = DescUtility:GetItemIcon(tid, cid)

	--描述面板表头
	--1最多3行，2最多1行，3最多2行（用\r分割）

	local base_type = string.format(ITEM_LIMIT_DESC[12], DescUtility:GetItemBaseType(cid))
	local recipe_limit,recipe_id = DescUtility:GetRecipeRollSkill(tid, cid)
	tbl["info1"] = string.format(--[[!AUTO_209]]"%s\r%s", base_type,recipe_limit)

	--描述面板星级
	--s_t，s代表星数，-1不显示。t代表显示方案，0为正常，1为同步闪烁，2为待定

	tbl["star"] = --[[!AUTO_210]]"-1_0"

	--描述面板限制（左）与消耗（右）
	--用\r分割

	--描述面板描述信息
	--用\r分割

	--描述面板属性信息
	local _,fashion_id = DescUtility:GetItemDBProp(tid, cid, "時裝" )
	local _,fashion_config_id = DescUtility:GetItemDBProp(fashion_id, ClassType.ICID_EQUIP, "時裝合成分解配置範本ID" )
	
	local fashion_cailiao = {}
	local fashion_cailiao_num = {}
	local fashion_cailiao_name = {}

	for i = 1,4 do
		_,fashion_cailiao[i] = DescUtility:GetItemDBProp(fashion_config_id, ClassType.ECID_FASHION_RECIPT_CONFIG, string.format("合成所需材料ID_%d",i) )
		_,fashion_cailiao_num[i] = DescUtility:GetItemDBProp(fashion_config_id, ClassType.ECID_FASHION_RECIPT_CONFIG, string.format("合成所需材料數量_%d",i) )
	end
	
	local fashion_cailiao_text = ""
	if fashion_cailiao[1] > 0 then
		fashion_cailiao_text =  "^e76041" .. FASHION_CAILIAO_TEXT
	end
	for i =1,4 do
		if fashion_cailiao[i] > 0 then
			if fashion_cailiao[i] == 87370 then
				fashion_cailiao_name[i] = DescUtility:GetItemName(fashion_cailiao[i], ClassType.ICID_NORMAL_ITEM)
			else
				fashion_cailiao_name[i] = DescUtility:GetItemName(fashion_cailiao[i], ClassType.ICID_MATERIAL)
			end
			fashion_cailiao_text =fashion_cailiao_text .. "^FFFFFF\r" .. string.format("^FFFFFF『%s^FFFFFF』 x %d",fashion_cailiao_name[i],fashion_cailiao_num[i])
		end
	end
	
	--用\r分割
	if fashion_cailiao_text == "" then
		tbl["desc"] = string.format(--[[!AUTO_211]]"%s%s",TAG_COLOR_ESSENCE[4],FASHION_RECIPEROLL_USE_TEXT)
	else
		tbl["desc"] = string.format(--[[!AUTO_211]]"%s\r\r%s%s",fashion_cailiao_text,TAG_COLOR_ESSENCE[4],FASHION_RECIPEROLL_USE_TEXT)
	end

	--描述面板附加信息
	--用\r分割
	tbl["remark"] = DescUtility:GetItemExtDesc(tid, cid, ext_tbl)

	--描述面板价格信息
	--单位依次：文、贯、金、玉

	--描述面板声望消耗信息


	--描述面板物品兑换信息

	tbl["lab_money"], tbl["money1"], tbl["money2"], tbl["money3"], tbl["money4"], tbl["lab_fame"], tbl["fame"], tbl["lab_exchange"], tbl["exchange"], tbl["exchangepic"],tbl["npc_buy_bind"] = DescUtility:GetItemPrice(tid, cid, context_type, price_scale, ext_tbl)

	--描述面板元宝信息
	--单位依次：银元、金元
        
        return tbl

end

-- 所有新建类型物品都可以从这里拷
function DescTool:GetUnknownItemDesc(tid,cid,context_type,price_scale,ext_tbl)
	tbl = {}
	--描述面板表头
	if ext_tbl["Level"] and ext_tbl["Level"] > 0 then
		tbl["title"] = string.format(--[[!AUTO_1]]"%s+%s",DescUtility:GetItemName(tid, cid),ext_tbl["Level"])
	else
		tbl["title"] = DescUtility:GetItemName(tid, cid)
	end
	--描述面板图标
	tbl["icon"] = DescUtility:GetItemIcon(tid, cid)
	--描述面板表头
	--1最多3行，2最多1行，3最多2行（用\r分割）


	local base_type = string.format(ITEM_LIMIT_DESC[12], DescUtility:GetItemBaseType(cid))
	local quantity = string.format(ITEM_LIMIT_DESC[16],DescUtility:GetItemMaxQuantity(tid, cid))
	tbl["info1"] = string.format(--[[!AUTO_362]]"%s\r%s", base_type,quantity)
	--描述面板星级
	--s_t，s代表星数，-1不显示。t代表显示方案，0为正常，1为同步闪烁，2为待定

	tbl["star"] = --[[!AUTO_363]]"-1_0"
	--描述面板限制（左）与消耗（右）
	--用\r分割
	--描述面板描述信息
	--用\r分割
	--描述面板属性信息


	--用\r分割
	--描述面板附加信息
	--用\r分割
	tbl["remark"] = DescUtility:GetItemExtDesc(tid, cid, ext_tbl)
	--描述面板价格信息
	--单位依次：文、贯、金、玉
	--描述面板声望消耗信息

	--描述面板物品兑换信息
	tbl["lab_money"], tbl["money1"], tbl["money2"], tbl["money3"], tbl["money4"], tbl["lab_fame"], tbl["fame"], tbl["lab_exchange"], tbl["exchange"], tbl["exchangepic"],tbl["npc_buy_bind"] = DescUtility:GetItemPrice(tid, cid, context_type, price_scale, ext_tbl)
	--描述面板元宝信息
	--单位依次：银元、金元

	return tbl
end




-- 卡牌描述函数
function DescTool:GetCardDesc(tid,cid,context_type,price_scale,ext_tbl)

	tbl = {}
	--预处理 	local t_equip
	--t_equip = DescUtility:CopyTable(ext_tbl["CardEssAddon"])


	--描述面板表头
	if ext_tbl["CardLevel"] and ext_tbl["CardLevel"] > 0 then
		tbl["title"] = string.format(--[[!AUTO_1]]"%s+%s",DescUtility:GetItemCardName(tid, cid),ext_tbl["CardLevel"])
	else
		tbl["title"] = DescUtility:GetItemCardName(tid, cid)
	end
	--描述面板图标
	tbl["icon"] = DescUtility:GetItemIcon(tid, cid)

	--描述面板表头
	--1最多3行，2最多1行，3最多2行（用\r分割）
	
	local _,equip_class = DescUtility:GetItemDBProp(tid,cid,--[[!]]"卡牌类型")
	local _,equip_quality = DescUtility:GetItemDBProp(tid,cid,--[[!]]"品质")
	local _,equip_Lvli = DescUtility:GetItemDBProp(tid,cid,--[[!]]"履历值")

	sub_type_text = string.format(ITEM_LIMIT_DESC[43], EQUIP_WEAPON_CLASS_DESC[3])
	loca_type_text = --[[!AUTO_8]]CARD_CLASS_DESC[equip_class]
	loca_Lvli_text = string.format(ITEM_LIMIT_DESC[44], equip_Lvli)
	
	--LogPrint(string.format("卡牌类型：%d", equip_class ))

	tbl["info1"] = string.format(--[[!AUTO_13]]"%s%s%s\r%s%s",DescUtility:GetItemProfLimit(tid, cid), sub_type_text, loca_type_text, DescUtility:GetItemLevelLimit(tid, cid), loca_Lvli_text)

 	--描述卡牌附加属性信息
	--用\r分割
	--local base_ess = DescUtility:GetEquipBaseEssDesc(t_equip) or ""
	--if base_ess ~= --[[!AUTO_38]]"" and base_ess ~= nil then
	--	tbl["strengthen"] = string.format(ITEM_LIMIT_DESC[13],base_ess)    --strengthen
	--end
	
	local card_base_text = ""
	local card_base_dec = ""
	local Card_base_attr = {}
	
	local CardbaseSize = ext_tbl["CardEssAddonSize"]
	
	--LogPrint(string.format("附加属性组CardCoopSize：%d", CardCoopSize))
	
	if CardbaseSize ~= nil and CardbaseSize > 1 then
	
		card_base_text =  "^FFFFFF" .. CARD_BASEATTR_TEXT
		
		for i = 1,CardbaseSize-1 do
				exttype = ext_tbl["base_ext_prop_" .. i .. "_type"]
				extparam1 = ext_tbl["base_ext_prop_" .. i .. "_param1"]
				extparam2 = ext_tbl["base_ext_prop_" .. i .. "_param2"]
				extparam3 = ext_tbl["base_ext_prop_" .. i .. "_param3"]
				
				attropenlv = ext_tbl["base_ext_prop_" .. i .. "_level"]
				
				Card_base_attr[i] = DescUtility:GetExtStr(exttype, extparam1, extparam2, extparam3)
				
				open_attr_txt = ""
				if attropenlv ~= nil and attropenlv > 0 then
					open_attr_txt = string.format(COOPERATE_OPEN_TEXT, attropenlv)
				end

				if attropenlv ~= nil and attropenlv == 0 then
					card_base_dec = card_base_dec .. "^FFFFFF\r" .. string.format("^1EFF00%s^1EFF00", Card_base_attr[i])
				elseif attropenlv ~= nil and attropenlv > 0 then
				
					attr_obj = CardInfo:GetCardAttrTypeByIdx(exttype)
					if attr_obj ~= nil and attr_obj.style ~= nil then
						card_base_dec = card_base_dec .. "^FFFFFF\r" .. string.format("^BBBBBB%s^BBBBBB  %s", attr_obj.style, open_attr_txt)
					end
				end
		end
		
		card_base_text = card_base_text .. "^e76041" .. card_base_dec
		
	end
	
	--用\r分割
	if card_base_text ~= ""  then
		tbl["strengthen"] = string.format(--[[!AUTO_211]]"%s\r\r%s",card_base_text,TAG_COLOR_ESSENCE[4])
	end
	
	
	--描述卡牌协同属性信息
	--用\r分割
	
	local card_Cooperate_name = ""
	local card_Cooperate_text = ""
	local card_Cooperate_dec = ""
	local CardCoop_attr = {}
	
	local CardCoopSize = ext_tbl["CooperateAddonSize"]
	local myequipval = ext_tbl["cardequipflag"]
	
	--LogPrint(string.format("附加属性组CardCoopSize：%d", CardCoopSize))
	
	if CardCoopSize ~= nil and CardCoopSize > 1 and myequipval ~= nil and myequipval > 0 then
	
		card_Cooperate_text =  "^FFFFFF" .. CARD_COOPERATE_TEXT
		
		for i = 1,CardCoopSize-1 do
				exttype = ext_tbl["Cooperate_ext_prop_" .. i .. "_type"]
				extparam1 = ext_tbl["Cooperate_ext_prop_" .. i .. "_param1"]
				extparam2 = ext_tbl["Cooperate_ext_prop_" .. i .. "_param2"]
				extparam3 = ext_tbl["Cooperate_ext_prop_" .. i .. "_param3"]
				
				coopcardtid = ext_tbl["Cooperate_ext_prop_" .. i .. "_cooptid"]
				coopequipval = ext_tbl["Cooperate_ext_prop_" .. i .. "_coopequipval"]
				attropenlv = ext_tbl["Cooperate_ext_prop_" .. i .. "_attropenlv"]
				
				CardCoop_attr[i] = DescUtility:GetExtStr(exttype, extparam1, extparam2, extparam3)
				
				if coopcardtid ~= nil and coopcardtid > 0 then
					_,card_Cooperate_name = DescUtility:GetItemDBProp(coopcardtid, cid, "t_name" )
				end

				--LogPrint(string.format("协同卡牌名字：%s", card_Cooperate_name ))
				
				open_attr_txt = ""
				if attropenlv ~= nil and attropenlv > 0 then
					open_attr_txt = string.format(COOPERATE_OPEN_TEXT, attropenlv)
					
					--LogPrint(string.format("11111111"))
				end

				if coopequipval ~= nil and attropenlv ~= nil and coopequipval > 0 and attropenlv == 0 then
				
					card_Cooperate_dec = card_Cooperate_dec .. "^FFFFFF\r" .. string.format("^ffd200『%s^ffd200』", CardCoop_attr[i])
					
				elseif coopequipval ~= nil and attropenlv ~= nil and coopequipval > 0 and attropenlv ~= 0 then
				
					card_Cooperate_dec = card_Cooperate_dec .. "^FFFFFF\r" .. string.format("^BBBBBB『%s^BBBBBB』%s", CardCoop_attr[i], open_attr_txt)
					
				elseif coopequipval ~= nil and attropenlv ~= nil and coopequipval == 0 and attropenlv == 0 then
				
					card_Cooperate_dec = card_Cooperate_dec .. "^FFFFFF\r" .. string.format("^BBBBBB『%s^BBBBBB』裝備%s志", CardCoop_attr[i], card_Cooperate_name)
					
				else
				
					card_Cooperate_dec = card_Cooperate_dec .. "^FFFFFF\r" .. string.format("^BBBBBB『%s^BBBBBB』裝備%s志", CardCoop_attr[i], card_Cooperate_name)
		
				end
		end
		
		card_Cooperate_text = card_Cooperate_text .. "^e76041" .. card_Cooperate_dec
		
	end
	
	--用\r分割
	if card_Cooperate_text ~= "" and myequipval ~= nil and myequipval > 0 then
		tbl["desc"] = string.format(--[[!AUTO_211]]"%s\r\r%s",card_Cooperate_text,TAG_COLOR_ESSENCE[4])
	end
	
	
	--描述面板附加信息
	--用\r分割

	tbl["remark"] = DescUtility:GetItemExtDesc(tid, cid, ext_tbl)
	
	tbl["lab_money"], tbl["money1"], tbl["money2"], tbl["money3"], tbl["money4"], tbl["lab_fame"], tbl["fame"], tbl["lab_exchange"], tbl["exchange"], tbl["exchangepic"],tbl["npc_buy_bind"] = DescUtility:GetItemPrice(tid, cid, context_type, price_scale, ext_tbl)
	--描述面板元宝信息
	--单位依次：银元、金元

--ext_tbl["SignName"]			签名字样
--ext_tbl["SignLevel"]			签名等级

--返回数据：17项（09.12.11）

	return tbl

end

function DescTool:GetKungfuSoulAwake( curLevel )
	local FixAwakes = 
	{
		[1] = {level = 5, 	desc = "覺醒5次：武魂屬性增加10%", unactive = "^bbbbbb", active = "^00ff00" },
		[2] = {level = 7,	desc = "覺醒7次：武魂屬性增加10%", unactive = "^bbbbbb", active = "^00ff00" },
		[3] = {level = 9,	desc = "覺醒9次：武魂屬性增加10%", unactive = "^bbbbbb", active = "^00ff00" },
		[4] = {level = 11,	desc = "覺醒11次：武魂屬性增加10%", unactive = "^bbbbbb", active = "^00ff00" },
		[5] = {level = 13, 	desc = "覺醒13次：武魂屬性增加10%", unactive = "^bbbbbb", active = "^00ff00" },
		[6] = {level = 15,	desc = "覺醒15次：武魂屬性增加10%", unactive = "^bbbbbb", active = "^00ff00" },
		[7] = {level = 16,	desc = "覺醒16次：武魂屬性增加20%", unactive = "^bbbbbb", active = "^00ff00" },
		[8] = {level = 17,	desc = "覺醒17次：武魂屬性增加20%", unactive = "^bbbbbb", active = "^00ff00" },
	}
	local awake_info = ""
	local max_fix_num = #FixAwakes
	local idx = 1
	while  idx<= max_fix_num do
		local award_color
		if FixAwakes[idx].level<=curLevel then
			award_color = FixAwakes[idx].active 
		else
			award_color = FixAwakes[idx].unactive 
		end
		if idx > 1 then
			awake_info = awake_info .. "\r"
		end
		awake_info = awake_info .. award_color ..  FixAwakes[idx].desc
		idx = idx + 1
	end
	return awake_info
end

function DescTool:GetKungfuSoulDesc(tid,cid,context_type,price_scale,ext_tbl)
	tbl = {}
	
	local function GetAddonQuality( aptitude )
		return DescUtility:GetKungfuSoulAddonQuality( aptitude )
	end
	local var_addons = DescUtility:CopyTable(ext_tbl["VarsAddons"])
	local var_aptitudes = DescUtility:CopyTable(ext_tbl["VarsAptitudes"])
	local var_skills = DescUtility:CopyTable(ext_tbl["VarsSkills"])
	local var_skills_idx = DescUtility:CopyTable(ext_tbl["VarsSkillsIdx"])
	local fix_skills = DescUtility:CopyTable(ext_tbl["FixedSkills"])
	local fix_skills_idx = DescUtility:CopyTable(ext_tbl["FixedSkillsIdx"])
	
	local aptitudesSum = 0
	for i = 1, #var_aptitudes do
		aptitudesSum = aptitudesSum + var_aptitudes[i]
	end
	
	--(250,300]3星，(300,350]4星，(350,420]5星，(420,460]6星，(460,500]	
	local item_quality = 1;	
	local str_star = "-1_0"
	if aptitudesSum<301 then
		item_quality = 3
		str_star = "3_0"
	elseif aptitudesSum<351 then
		item_quality = 4
		str_star = "4_0"
	elseif aptitudesSum<421 then
		item_quality = 5
		str_star = "5_0"
	elseif aptitudesSum<461 then
		item_quality = 6
		str_star = "6_0"
	else
		item_quality = 7
		str_star = "7_0"
	end
		
	local strengthen_tbl = {}
	local strengthenIdx = 1
	strengthen_tbl[strengthenIdx] = DescUtility:GetEffectMajorDesc( var_addons[1], 100+GetAddonQuality(var_aptitudes[1]) ) or ""
	strengthenIdx = strengthenIdx + 1 
	strengthen_tbl[strengthenIdx] = DescUtility:GetEffectMajorDesc( var_addons[2], 100+GetAddonQuality(var_aptitudes[2]) ) or ""
	strengthenIdx = strengthenIdx + 1 
	strengthen_tbl[strengthenIdx] = DescUtility:GetEffectMajorDesc( var_addons[3], 100+GetAddonQuality(var_aptitudes[3]) ) or ""
	strengthenIdx = strengthenIdx + 1 
	strengthen_tbl[strengthenIdx] = DescUtility:GetEffectMajorDesc( var_addons[4], 100+GetAddonQuality(var_aptitudes[4]) ) or ""
	strengthenIdx = strengthenIdx + 1 
	strengthen_tbl[strengthenIdx] = DescUtility:GetEffectMajorDesc( var_addons[5], 100+GetAddonQuality(var_aptitudes[5]) ) or ""
	assert( #var_skills == #var_skills_idx )
	
	for i = 1 ,#var_skills do
		local skillid = var_skills[i]
		local skillIdx = var_skills_idx[i]
		strengthenIdx = strengthenIdx + 1 		
		strengthen_tbl[strengthenIdx] = SkillTip:GetKungfuSoulActiveSkillDesc( skillid, skillIdx )
	end
	assert( #fix_skills == #fix_skills_idx )
	for i = 1 ,#fix_skills do
		local skillid = fix_skills[i]
		local skillIdx = fix_skills_idx[i]		
		strengthenIdx = strengthenIdx + 1 
		strengthen_tbl[strengthenIdx] = SkillTip:GetKungfuSoulUnactiveSkillDesc( skillid, skillIdx )
	end
	
	local str_strength = ""
	for i = 1, #strengthen_tbl do
		if strengthen_tbl[i] ~= "" and strengthen_tbl[i] ~= nil then
			if  i == 1 then
				str_strength = strengthen_tbl[i]
			else
				str_strength = str_strength .. "\r" ..strengthen_tbl[i]
			end

		end
	end	
	tbl["strengthen"] = str_strength
	
	local str_bone = string.format(ITEM_KUNGFU_SOUL_BONE_NUM, ext_tbl["FixedBone"])
	local str_large_growth = string.format(ITEM_KUNGFU_SOUL_lARGE_GROWTH_NUM, ext_tbl["FixedLargeGrowthNum"])
	local str_exp
	if( ext_tbl["Level"] < 18 ) then
		str_exp = string.format(ITEM_KUNGFU_SOUL_EXP, ext_tbl["FixedCurExpMedicine"], ext_tbl["FixedTotolExpMedicine"] )
	else
		str_exp = ITEM_KUNGFU_SOUL_MAX_EXP
	end

	tbl["desc"] = string.format("%s\r%s\r%s", str_bone, str_large_growth, str_exp )
	assert( #var_addons == #var_aptitudes , "must same size" )
	--描述面板表头
	tbl["title"] = ITEM_COLOR_DESC[1 + item_quality] .. DescUtility:GetItemName(tid, cid)
	
	--描述面板图标
	tbl["icon"] = DescUtility:GetItemIcon(tid, cid)
	--描述面板表头
	--1最多3行，2最多1行，3最多2行（用\r分割）
 

 	local str_level = string.format( ITEM_KUNGFU_SOUL_LEVEL, ext_tbl["Level"] )
	local base_type = string.format(ITEM_LIMIT_DESC[12], DescUtility:GetItemBaseType(cid))
	local quantity = string.format(ITEM_LIMIT_DESC[16],DescUtility:GetItemMaxQuantity(tid, cid))
	tbl["info1"] = string.format(--[[!AUTO_362]]"%s\r%s\r%s", base_type,quantity,str_level)
	--描述面板星级
	--s_t，s代表星数，-1不显示。t代表显示方案，0为正常，1为同步闪烁，2为待定

	tbl["star"] = str_star .. "_1"
	--描述面板限制（左）与消耗（右）
	--用\r分割
	--描述面板描述信息
	--用\r分割
	--描述面板属性信息


	--用\r分割
	--描述面板附加信息
	--用\r分割
	tbl["remark"] = DescUtility:GetItemExtDesc(tid, cid, ext_tbl)
	--描述面板价格信息
	--单位依次：文、贯、金、玉
	--描述面板声望消耗信息

	--描述面板物品兑换信息
	tbl["lab_money"], tbl["money1"], tbl["money2"], tbl["money3"], tbl["money4"], tbl["lab_fame"], tbl["fame"], tbl["lab_exchange"], tbl["exchange"], tbl["exchangepic"],tbl["npc_buy_bind"] = DescUtility:GetItemPrice(tid, cid, context_type, price_scale, ext_tbl)
	--描述面板元宝信息
	--单位依次：银元、金元

	return tbl

end

--文字烟花描述
function DescTool:GetTextFireWorkDesc(tid,cid,context_type,price_scale,ext_tbl)

	tbl = {}

	--描述面板表头
	tbl["title"] = DescUtility:GetItemName(tid, cid)

	--描述面板图标
	tbl["icon"] = DescUtility:GetItemIcon(tid, cid)

	--描述面板表头
	--1最多3行，2最多1行，3最多2行（用\r分割）

	local base_type = string.format(ITEM_LIMIT_DESC[12], DescUtility:GetItemBaseType(cid))
	local quantity = string.format(ITEM_LIMIT_DESC[16],DescUtility:GetItemMaxQuantity(tid, cid))
	tbl["info1"] = string.format(--[[!AUTO_213]]"%s\r%s%s", base_type,DescUtility:GetItemLevelLimit(tid, cid),quantity)

	--描述面板星级
	--s_t，s代表星数，-1不显示。t代表显示方案，0为正常，1为同步闪烁，2为待定

	tbl["star"] = --[[!AUTO_214]]"-1_0"

	--描述面板限制（左）与消耗（右）
	--用\r分割

	--描述面板描述信息
	--用\r分割
	--描述面板属性信息

	--用\r分割

	--描述面板附加信息
	--用\r分割
	tbl["remark"] = DescUtility:GetItemExtDesc(tid, cid, ext_tbl)

	--描述面板价格信息
	--单位依次：文、贯、金、玉

	--描述面板声望消耗信息

	local _,repu_value = DescUtility:GetItemDBProp(tid,cid,--[[!]]"使用后获得烟花声望值")
	if repu_value and repu_value > 0 then
		local repudesc = string.format("使用後增加^e76041%d點^ffffff喜悅度",repu_value)
		if tbl["desc"] then
			tbl["desc"] = tbl["desc"] .. repudesc
		else
			tbl["desc"] = repudesc
		end
	end

	--描述面板物品兑换信息

	tbl["lab_money"], tbl["money1"], tbl["money2"], tbl["money3"], tbl["money4"], tbl["lab_fame"], tbl["fame"], tbl["lab_exchange"], tbl["exchange"], tbl["exchangepic"],tbl["npc_buy_bind"] = DescUtility:GetItemPrice(tid, cid, context_type, price_scale, ext_tbl)

	--描述面板元宝信息
	--单位依次：银元、金元


	return tbl

end






