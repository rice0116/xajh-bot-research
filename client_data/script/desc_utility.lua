--[[#tag push auto]]
--所有标签的工具函数...
DescUtility = {}

--GetItemDBProp(tid,cid,prop)
	--tid				模板ID
	--cid				类别ID，ClassType的一种

	--prop				字符串,属性名称


--特殊索引说明:
	--t_id				id索引
	--t_name			名称索引
	--t_major_id			第一级模板id
	--t_sub_id			第二级模板id

--[[
GameApi.GetItemDBPath(tid,cid) 这个函数在后面听见了个参数，类型为bool(true | false)

默认不填即为false

为true表示返回值也包含模板名


格式：

local bOK, sMain, sSub, sTemplName = GameApi.GetItemDBPath(tid, cid,true)
]]


-- 获取物品的属性函数

function DescUtility:GetItemDBProp(tid, cid, prop)
	local bOK, val = GameApi.GetItemDBProp(tid, cid, prop)
	if bOK then
		return bOK, val
	else
		--只当出现错误数据时出现，不用注掉
		LogPrint(string.format(--[[!AUTO_1]]"GetItemDBProp(%d,%d,%s) Error.", tid, cid, prop))
		return false, --[[!AUTO_2]]"??????"
	end

end

-- table复制函数
function DescUtility:CopyTable(src)
	local inst={}
	local k, v
	for k, v in pairs(src) do
		if type(v) == --[[!AUTO_3]]"table" then
			inst[k] = self:CopyTable(v)
		else
			inst[k] = v
		end
	end
	local mt = getmetatable(src)
	setmetatable(inst, mt)
	return inst
end

-- 字符串组合函数

function DescUtility:StringCombiner(tbl)
	local rst = --[[!AUTO_4]]""
	for k, v in pairs(tbl) do
		if v ~= --[[!AUTO_5]]"" then
			if rst == --[[!AUTO_6]]"" then
				rst = v
			else
				rst = rst .. --[[!AUTO_7]]"\r" .. v
			end
		end
	end
	return rst
end

-- 计算装备随机属性

function DescUtility:GetEquipRandValue(rand, low, high)
	local addation = 0
	if rand > 100 then
		addation = rand - 100
		rand = 100
		if addation > 500 then
			addation = 500
		end
	end
	local cur = math.floor( (high - low + 0.999999) * rand /100 + low )
	cur = cur * (100.0 + addation ) / 100
	return cur
end

-- 获取物品名称
function DescUtility:GetItemName(tid, cid)
	local sQlt = --[[!AUTO_8]]""
	sQlt = --[[!]]"品质"
	local _, iQuality = DescUtility:GetItemDBProp(tid,cid,sQlt)
	local sColor = ITEM_COLOR_DESC[iQuality+1] or ITEM_COLOR_DESC[1]
	local _, sTitle = DescUtility:GetItemDBProp(tid,cid,--[[!AUTO_9]]"t_name")

	--if cid == ClassType.ICID_EQUIP then
	--
	--end
	if cid == ClassType.ICID_EQUIP then
		local _,holyweapon_config = DescUtility:GetItemDBProp(tid,cid,--[[!]]"神器配置模板")
		if holyweapon_config > 0 then
			local _,holyweapon_type = DescUtility:GetItemDBProp(holyweapon_config,ClassType.ECID_HOLY_EQUIP_CONFIG,--[[!]]"神器类别")
			if holyweapon_type == 0 then
				sColor = ITEM_COLOR_DESC[1001]
			elseif holyweapon_type == 1 then
				sColor = ITEM_COLOR_DESC[1002]
			elseif holyweapon_type == 2 then
				sColor = ITEM_COLOR_DESC[1003]
			end
		end
	end

	if cid == ClassType.ICID_ICID_KUNGFU_SOUL_ITEM then
		sColor = ""
	end

	if TestShowItemId and TestShowItemId == 1 then --调试模式d_script TestShowItemId = 1
		if  iQuality == --[[!AUTO_10]]"" then
			return sTitle .. --[[!AUTO_11]]"(" .. tid .. --[[!AUTO_12]]")"
		else
			return string.format(--[[!AUTO_13]]"%s%s", sColor, sTitle) .. --[[!AUTO_14]]"(" .. tid .. --[[!AUTO_15]]")"
		end
	else
		if  iQuality == --[[!AUTO_16]]"" then
			return sTitle
		else
			return string.format(--[[!AUTO_17]]"%s%s", sColor, sTitle)
		end
	end
end

-- 获取装备名称
function DescUtility:GetEquipName(tid, cid, estype, esid)
	local sQlt = --[[!AUTO_18]]""
	sQlt = --[[!]]"品质"
	local _, iQuality = DescUtility:GetItemDBProp(tid,cid,sQlt)
	local sColor = ITEM_COLOR_DESC[iQuality+1] or ITEM_COLOR_DESC[1]
	local _, sTitle = DescUtility:GetItemDBProp(tid,cid,--[[!AUTO_19]]"t_name")
	local sPrefix, sSuffix
	if estype == 2 then
		_, sPrefix = DescUtility:GetItemDBProp(esid, ClassType.ICID_ADDON_GROUP, --[[!]]"前缀")
		if sPrefix == --[[!AUTO_20]]"" then
			sPrefix = --[[!AUTO_21]]""
		else
			sPrefix = string.format(EQUIP_NAME_PREFIX, sPrefix)
		end
	else
		sPrefix = --[[!AUTO_22]]""
	end
	local sSuffix = --[[!AUTO_23]]""
	if estype == 2 then
		_, sSuffix = DescUtility:GetItemDBProp(esid, ClassType.ICID_ADDON_GROUP, --[[!]]"后缀")
		if sSuffix == --[[!AUTO_24]]"" then
			sSuffix = --[[!AUTO_25]]""
		else
			sSuffix = string.format(EQUIP_NAME_SUFFIX, sSuffix)
		end
	elseif estype == 0 then
		sSuffix = --[[!AUTO_26]]""
	else
		sSuffix = --[[!AUTO_27]]""
	end

	local _,holyweapon_config = DescUtility:GetItemDBProp(tid,cid,--[[!]]"神器配置模板")
	if holyweapon_config > 0 then
		local _,holyweapon_type = DescUtility:GetItemDBProp(holyweapon_config,ClassType.ECID_HOLY_EQUIP_CONFIG,--[[!]]"神器类别")
		if holyweapon_type == 0 then
			sColor = ITEM_COLOR_DESC[1001]
		elseif holyweapon_type == 1 then
			sColor = ITEM_COLOR_DESC[1002]
		elseif holyweapon_type == 2 then
			sColor = ITEM_COLOR_DESC[1003]
		end
	end

	if Produce:IsDiamondHolyEquip(tid) then
		sColor = ITEM_COLOR_DESC[1004]
	end

	if TestShowItemId and TestShowItemId == 1 then --调试模式d_script TestShowItemId = 1
		return string.format(--[[!AUTO_28]]"%s%s%s%s", sColor, sPrefix, sTitle, sSuffix) .. --[[!AUTO_29]]"(" .. tid .. --[[!AUTO_30]]")"
	else
		return string.format(--[[!AUTO_31]]"%s%s%s%s", sColor, sPrefix, sTitle, sSuffix)
	end
end

--获取开启过的彩票名称

function DescUtility:GetLotteryOpenedName(tid, cid)
	local sQlt = --[[!AUTO_32]]""
	sQlt =--[[!]] --[[!AUTO_33]]"品質"
	local sNameOp = --[[!AUTO_34]]""
	sNameOp = --[[!]]"开启过的彩票物品名"
	local _, iQuality = DescUtility:GetItemDBProp(tid,cid,sQlt)
	local sColor = ITEM_COLOR_DESC[iQuality+1] or ITEM_COLOR_DESC[1]
	local _, sTitle = DescUtility:GetItemDBProp(tid,cid,--[[!AUTO_35]]"t_name")
	local bOpened, sOpened = DescUtility:GetItemDBProp(tid,cid,sNameOp)
	return string.format(--[[!AUTO_36]]"%s%s", sColor, bOpened and sOpened or sTitle)
end

-- 获取物品图标
function DescUtility:GetItemIcon(tid, cid)
	local sTempl = --[[!AUTO_37]]""
	if cid == ClassType.ICID_RECIPE then
		sTempl = --[[!]]"图标路径名"
	else
		sTempl = --[[!]]"图标名称"
	end
	local bIcon, sIcon = DescUtility:GetItemDBProp(tid,cid,sTempl)
	return bIcon and sIcon or --[[!AUTO_38]]"00752未知物品.dds"
end

-- 获取开启过的彩票图标

function DescUtility:GetLotteryOpenedIcon(tid, cid)
	local sTempl = --[[!AUTO_39]]""
	local sTemplOp = --[[!AUTO_40]]""
	sTempl = --[[!]]"图标名称"
	sTemplOp = --[[!]]"开启过的彩票图标名称"
	local bIcon, sIcon = DescUtility:GetItemDBProp(tid,cid,sTempl)
	local bOpened, sOpened = DescUtility:GetItemDBProp(tid,cid,sTemplOp)
	return bOpened and sOpened or (bIcon and sIcon or --[[!AUTO_41]]"00752未知物品.dds")
end

-- 获取物品基本类别
function DescUtility:GetItemBaseType(cid)
	return ITEM_CLASS_DESC[cid] or ITEM_CLASS_ERROR
end

-- 获取物品上级（二级）分类名称
function DescUtility:GetItemSubType(tid, cid)
	local bOK, _, sSub = GameApi.GetItemDBPath(tid, cid)
	return bOK and sSub or --[[!AUTO_42]]""
end

-- 获取物品主类（一级）分类名称
function DescUtility:GetItemMajorType(tid, cid)
	local bOK, sMain, _ = GameApi.GetItemDBPath(tid, cid)
	return bOK and sMain or --[[!AUTO_43]]""
end

-- 获取物品绑定属性

function DescUtility:GetItemBindState(tid, cid, bState, bBindOnTrade)
	local bindstring = --[[!AUTO_44]]""
	if bState then
		bindstring = ITEM_COLOR_BIND .. ITEM_BIND_STRING[1]
	else
		sProp = --[[!]]"处理方式"
		local bProp, iProp = DescUtility:GetItemDBProp(tid, cid, sProp)
		if bit.band(iProp, ProcType.PROC_EQUIPBIND) > 0 then
			bindstring = ITEM_COLOR_BIND .. ITEM_BIND_STRING[2]
			if cid == ClassType.ICID_VEHICLE then
				bindstring = bindstring .. --[[!AUTO_45]]"\r" .. HORSE_EQUIPBIND_NOTICE
			end
		elseif bit.band(iProp, ProcType.PROC_PICKBIND) > 0 then
			bindstring = ITEM_COLOR_BIND .. ITEM_BIND_STRING[5]
		end
		if bBindOnTrade then
			if bindstring == "" then
				bindstring = "^ff0000" .. ITEM_BIND_STRING[8]
			else
				bindstring = bindstring .. --[[!]]"\r^ff0000" .. ITEM_BIND_STRING[8]
			end
		end

	end
	return bindstring
end

-- 获取物品帮派绑定属性
function DescUtility:GetItemGuidBindState(tid, cid, bState)
	local guildbindstring = ""
	if bState then
		guildbindstring = ITEM_COLOR_BIND .. ITEM_BIND_STRING[6]
	else
		sProp = --[[!]]"该装备可以设置帮派图案"
		local bProp, iProp = DescUtility:GetItemDBProp(tid, cid, sProp)
		if iProp > 0 then
			guildbindstring = ITEM_COLOR_BIND .. ITEM_BIND_STRING[7]
		end
	end
	return guildbindstring
end

-- 获取物品品质
function DescUtility:GetItemQuality(tid, cid)
	local sQlt = --[[!AUTO_46]]""
	sQlt = --[[!]]"品质"
	local _, iQuality = DescUtility:GetItemDBProp(tid,cid,sQlt)
	local sColor = ITEM_COLOR_DESC[iQuality] or ITEM_COLOR_DESC[1]
	local sQuality = ITEM_QUALITY_DESC[iQuality] or ITEM_QUALITY_DESC[1]
	return string.format(--[[!AUTO_47]]"%s%s", sColor, sQuality)
end

-- 获取装备基本属性

function DescUtility:GetEquipBaseProp(tid,cid,tbl)
	local equip_type
	local outerAtk =--[[!AUTO_48]]""
	local innerAtk = --[[!AUTO_49]]""
	local outDefence = --[[!AUTO_50]]""
	local inDefence = --[[!AUTO_51]]""
	local HP = --[[!AUTO_52]]""
	local MP1 = --[[!AUTO_53]]""
	local CRIT = --[[!AUTO_54]]""
	local EXPERT = --[[!AUTO_55]]""
        local RESIST = --[[!AUTO_56]]""
	local outerAtkMin, outerAtkMax, innerAtkMin, innerAtkMax, outerDef, innerDef, hp_tmp, mp1_tmp, crit_tmp, expert_tmp, resist_tmp
	local outerAtkMin_base,outerAtkMax_base,innerAtkMin_base,innerAtkMax_base,outerDef_base,innerDef_base,HP_base,MP1_base,CRIT_base,EXPERT_base,RESIST_base
	local outerAtkMinAdd,outerAtkMaxAdd, innerAtkMinAdd, innerAtkMaxAdd,outerDefAdd,innerDefAdd,HPAdd,MP1Add,CRITAdd,EXPERTAdd,RESISTAdd
	local EssAddon = tbl["EquipEssAddon"]
	local ReinforceAddon = tbl["EquipReinforceAddon"]
	local KaiguangAddon = tbl["EquipKaiguangAddon"]
	local UpgradeAddon = tbl["EquipUpgradeAddon"]
	local up_addon_type
	local up_addon_rand
	local up_addon_param1
	local up_addon_param2
	local up_addon_param3
	local up_addon_outerMinPoint = 0
	local up_addon_outerMaxPoint = 0
	local up_addon_innerMinPoint = 0
	local up_addon_innerMaxPoint = 0
	local up_addon_outerDefPoint = 0
	local up_addon_innerDefPoint = 0
	local up_addon_hp = 0
	local up_addon_mp1 = 0
	local up_addon_crit = 0
	local up_addon_expert = 0
	local up_addon_resist = 0
	local addon_type
	local addon_rand
	local addon_param1
	local addon_param2
	local addon_param3
	local damage_ed01 = 0
	local damage_ed02 = 0
	local defence_ed01 = 0
	local defence_ed02 = 0
	local hp_ed01 = 0
	local hp_ed02 = 0
	local mp1_ed01 = 0
	local mp1_ed02 = 0
	local crit_ed01 = 0
	local crit_ed02 = 0
	local expert_ed01 = 0
	local expert_ed02 = 0
	local resist_ed01 = 0
	local resist_ed02 = 0
	local outerMinPointAdd = 0
	local outerMaxPointAdd = 0
	local innerMinPointAdd = 0
	local innerMaxPointAdd = 0
	local outerDefPointAdd = 0
	local innerDefPointAdd = 0
        local hpAdd = 0
        local mp1Add = 0
        local critAdd = 0
	local expertAdd = 0
	local resistAdd = 0
	--LogPrint(tid)

	_,equip_type = DescUtility:GetItemDBProp(tid,cid,--[[!]]"装备类别")
	_,outerAtkMin_base = DescUtility:GetItemDBProp(tid,cid,--[[!]]"外功最小攻击力")
	_,outerAtkMax_base = DescUtility:GetItemDBProp(tid,cid,--[[!]]"外功最大攻击力")
	_,innerAtkMin_base = DescUtility:GetItemDBProp(tid,cid,--[[!]]"内功最小攻击力")
	_,innerAtkMax_base = DescUtility:GetItemDBProp(tid,cid,--[[!]]"内功最大攻击力")
	_,outerDef_base = DescUtility:GetItemDBProp(tid,cid,--[[!]]"外功防御力")
	_,innerDef_base = DescUtility:GetItemDBProp(tid,cid,--[[!]]"内功防御力")
	_,HP_base = DescUtility:GetItemDBProp(tid,cid,--[[!]]"本体HP")
	_,MP1_base = DescUtility:GetItemDBProp(tid,cid,--[[!]]"本体MP")
	_,CRIT_base = DescUtility:GetItemDBProp(tid,cid,--[[!]]"本体武学会心")
	_,EXPERT_base = DescUtility:GetItemDBProp(tid,cid,--[[!]]"本体武学精通")
	_,RESIST_base = DescUtility:GetItemDBProp(tid,cid,--[[!]]"本体武学抵御")

	outerAtkMin = outerAtkMin_base
	outerAtkMax = outerAtkMax_base
	innerAtkMin = innerAtkMin_base
	innerAtkMax = innerAtkMax_base
	outerDef = outerDef_base
	innerDef = innerDef_base
	hp_tmp = HP_base
	mp1_tmp = MP1_base
	crit_tmp = CRIT_base
	expert_tmp = EXPERT_base
	resist_tmp = RESIST_base

	--LogPrint("equip_type:" .. equip_type)
	--_,equip_type, outerAtkMin, outerAtkMax, innerAtkMin, innerAtkMax, outerDef, innerDef = GameApi:GetItemDBProp(tid, cid,"装备类别", "外攻最小攻击力","外攻最大攻击力","内功最小攻击力","内功最大攻击力","外攻防御力","内功防御力")

	--升级附加属性

	if UpgradeAddon["ext_prop_count"] and UpgradeAddon["ext_prop_count"] > 0 and UpgradeAddon["ext_group_type"] ==  2 then
		for i = 1, UpgradeAddon["ext_prop_count"] do
			up_addon_type = UpgradeAddon[string.format(--[[!AUTO_57]]"ext_prop_%d_type",i)]
			up_addon_rand = UpgradeAddon[string.format(--[[!AUTO_58]]"ext_prop_%d_rand",i)]
			up_addon_param1 = UpgradeAddon[string.format(--[[!AUTO_59]]"ext_prop_%d_param1",i)]
			up_addon_param2 = UpgradeAddon[string.format(--[[!AUTO_60]]"ext_prop_%d_param2",i)]
			up_addon_value = DescUtility:GetEquipRandValue(up_addon_rand, up_addon_param1, up_addon_param2)
			if up_addon_type == 129 then
				up_addon_outerMinPoint = up_addon_outerMinPoint + DescUtility:GetEquipRandValue(up_addon_rand, up_addon_param1, up_addon_param2)
				up_addon_outerMaxPoint = up_addon_outerMaxPoint + DescUtility:GetEquipRandValue(up_addon_rand, up_addon_param1, up_addon_param2)
			elseif up_addon_type == 130 then
				up_addon_innerMinPoint = up_addon_innerMinPoint + DescUtility:GetEquipRandValue(up_addon_rand, up_addon_param1, up_addon_param2)
				up_addon_innerMaxPoint = up_addon_innerMaxPoint + DescUtility:GetEquipRandValue(up_addon_rand, up_addon_param1, up_addon_param2)
			elseif up_addon_type == 30 then
				up_addon_outerDefPoint = up_addon_outerDefPoint + DescUtility:GetEquipRandValue(up_addon_rand, up_addon_param1, up_addon_param2)
			elseif up_addon_type == 41 then
				up_addon_innerDefPoint = up_addon_innerDefPoint + DescUtility:GetEquipRandValue(up_addon_rand, up_addon_param1, up_addon_param2)
			elseif up_addon_type == 9 then
				up_addon_hp = up_addon_hp + DescUtility:GetEquipRandValue(up_addon_rand, up_addon_param1, up_addon_param2)
			elseif up_addon_type == 10 then
				up_addon_mp1 = up_addon_mp1 + DescUtility:GetEquipRandValue(up_addon_rand, up_addon_param1, up_addon_param2)
			elseif up_addon_type == 144 then
				up_addon_crit = up_addon_crit + DescUtility:GetEquipRandValue(up_addon_rand, up_addon_param1, up_addon_param2)
			elseif up_addon_type == 145 then
				up_addon_expert = up_addon_expert + DescUtility:GetEquipRandValue(up_addon_rand, up_addon_param1, up_addon_param2)
			elseif up_addon_type == 146 then
				up_addon_resist = up_addon_resist + DescUtility:GetEquipRandValue(up_addon_rand, up_addon_param1, up_addon_param2)
			end
		end
	end

        -- 显示外攻
	if outerAtkMin  == 0 and outerAtkMax  == 0 and up_addon_outerMinPoint == 0 and up_addon_outerMaxPoint == 0 then
	    outerAtk = --[[!AUTO_61]]""
	elseif up_addon_outerMinPoint >= 1 or up_addon_outerMaxPoint >= 1 then
		outerAtk = string.format(EQUIP_BASEPROP_OUTERATK_ADD, TAG_COLOR_ESSENCE[12], outerAtkMax+up_addon_outerMaxPoint, TAG_COLOR_CHANNEL[1], outerAtkMax)
	else
	    outerAtk = string.format(EQUIP_BASEPROP_OUTERATK,TAG_COLOR_CHANNEL[1],outerAtkMax)
	end
	--LogPrint("outerAtk:" .. outerAtk)

	-- 显示内攻
        if innerAtkMin  == 0 and innerAtkMax  == 0 and up_addon_innerMinPoint == 0 and up_addon_innerMaxPoint == 0 then
       	    innerAtk = --[[!AUTO_62]]""
	elseif up_addon_innerMinPoint >= 1 or up_addon_innerMaxPoint >= 1 then
		innerAtk = string.format(EQUIP_BASEPROP_INNERATK_ADD, TAG_COLOR_ESSENCE[12], innerAtkMax+up_addon_innerMaxPoint, TAG_COLOR_CHANNEL[1], innerAtkMax)
	else
	    innerAtk = string.format(EQUIP_BASEPROP_INNERATK,TAG_COLOR_CHANNEL[1],innerAtkMax)
	end

        --显示外防
	if outerDef  == 0 and up_addon_outerDefPoint == 0 then
	    outDefence = --[[!AUTO_63]]""
	elseif up_addon_outerDefPoint >= 1 then
		outDefence = string.format(EQUIP_BASEPROP_OUTERDEF_ADD,TAG_COLOR_ESSENCE[12],outerDef+up_addon_outerDefPoint,TAG_COLOR_CHANNEL[1],outerDef)
        else
	    outDefence = string.format(EQUIP_BASEPROP_OUTERDEF,TAG_COLOR_CHANNEL[1],outerDef)
	end

	--显示内防
	if innerDef  == 0 and up_addon_innerDefPoint == 0 then
	    inDefence = --[[!AUTO_64]]""
	elseif up_addon_innerDefPoint >= 1 then
		inDefence = string.format(EQUIP_BASEPROP_INNERDEF_ADD,TAG_COLOR_ESSENCE[12],innerDef+up_addon_innerDefPoint,TAG_COLOR_CHANNEL[1],innerDef)
        else
	    inDefence = string.format(EQUIP_BASEPROP_INNERDEF,TAG_COLOR_CHANNEL[1],innerDef)
	end

	--显示HP
	if  hp_tmp  == 0 and up_addon_hp == 0 then
		HP = --[[!AUTO_65]]""
	elseif up_addon_hp >= 1 then
		HP = string.format(EQUIP_BASEPROP_HP_ADD,TAG_COLOR_ESSENCE[12],hp_tmp+up_addon_hp,TAG_COLOR_CHANNEL[1],hp_tmp)
        else
		HP = string.format(EQUIP_BASEPROP_HP,TAG_COLOR_CHANNEL[1],hp_tmp)
        end

        --显示MP1
	if mp1_tmp == 0 and up_addon_mp1 == 0 then
		MP1 = --[[!AUTO_66]]""
	elseif up_addon_mp1 >= 1 then
		MP1 = string.format(EQUIP_BASEPROP_MP1_ADD,TAG_COLOR_ESSENCE[12],mp1_tmp+up_addon_mp1,TAG_COLOR_CHANNEL[1],mp1_tmp)
	else
		MP1 = string.format(EQUIP_BASEPROP_MP1,TAG_COLOR_CHANNEL[1],mp1_tmp)
	end

	--显示CRIT
	if crit_tmp == 0 and up_addon_crit then
		CRIT = --[[!AUTO_67]]""
	elseif up_addon_crit >= 1 then
		CRIT = string.format(EQUIP_BASEPROP_CRIT_ADD,TAG_COLOR_ESSENCE[12],crit_tmp+up_addon_crit,TAG_COLOR_CHANNEL[1],crit_tmp)
	else
		CRIT = string.format(EQUIP_BASEPROP_CRIT,TAG_COLOR_CHANNEL[1],crit_tmp)
	end

	--显示EXPERT
	if expert_tmp == 0 and up_addon_expert == 0 then
		EXPERT = --[[!AUTO_68]]""
	elseif up_addon_expert >= 1 then
		EXPERT = string.format(EQUIP_BASEPROP_EXPERT_ADD,TAG_COLOR_ESSENCE[12],expert_tmp+up_addon_expert,TAG_COLOR_CHANNEL[1],expert_tmp)
	else
		EXPERT = string.format(EQUIP_BASEPROP_EXPERT,TAG_COLOR_CHANNEL[1],expert_tmp)
	end

	--显示RESIST
	if resist_tmp == 0 and up_addon_resist == 0 then
		RESIST = --[[!AUTO_69]]""
	elseif up_addon_resist >= 1 then
		RESIST = string.format(EQUIP_BASEPROP_RESIST_ADD,TAG_COLOR_ESSENCE[12],resist_tmp+up_addon_resist,TAG_COLOR_CHANNEL[1],resist_tmp)
	else
		RESIST = string.format(EQUIP_BASEPROP_RESIST,TAG_COLOR_CHANNEL[1],resist_tmp)
	end

        --[[
	-- 显示外内攻

	if outerAtkMin  == 0 and outerAtkMax  == 0 then
	    outerAtk = ""
	else
	    outerAtk = string.format(EQUIP_BASEPROP_OUTERATK,TAG_COLOR_CHANNEL[1],outerAtkMax)
	end
        if innerAtkMin  == 0 and innerAtkMax  == 0 then
       	    innerAtk = ""
	else
	    innerAtk = string.format(EQUIP_BASEPROP_INNERATK,TAG_COLOR_CHANNEL[1],innerAtkMax)
	end

        --显示外内防

	if outerDef  == 0 then
	    outDefence = ""
        else
	    outDefence = string.format(EQUIP_BASEPROP_OUTERDEF,TAG_COLOR_CHANNEL[1],outerDef)
	end
	if innerDef  == 0 then
	    inDefence = ""
        else
	    inDefence = string.format(EQUIP_BASEPROP_INNERDEF,TAG_COLOR_CHANNEL[1],innerDef)
	end

	--显示HP


	if  hp_tmp  == 0 then
	    HP = ""
        else
	    HP = string.format(EQUIP_BASEPROP_HP,TAG_COLOR_CHANNEL[1],hp_tmp)
        end

        -- 显示MP1,CRIT,EXPERT,RESIST
	if mp1_tmp == 0 then
		MP1 = ""
	else
		MP1 = string.format(EQUIP_BASEPROP_MP1,TAG_COLOR_CHANNEL[1],mp1_tmp)
	end

	if crit_tmp == 0 then
		CRIT = ""
	else
		CRIT = string.format(EQUIP_BASEPROP_CRIT,TAG_COLOR_CHANNEL[1],crit_tmp)
	end

	if expert_tmp == 0 then
		EXPERT = ""
	else
		EXPERT = string.format(EQUIP_BASEPROP_EXPERT,TAG_COLOR_CHANNEL[1],expert_tmp)
	end

	if resist_tmp == 0 then
		RESIST = ""
	else
		RESIST = string.format(EQUIP_BASEPROP_RESIST,TAG_COLOR_CHANNEL[1],resist_tmp)
	end
	]]

	if equip_type == 5 then
	--包裹不显示
	end
	--LogPrint(outerAtk)
	--LogPrint(innerAtk)
	--LogPrint(outDefence)
	--LogPrint(inDefence)

	return DescUtility:StringCombiner({outerAtk, innerAtk, outDefence, inDefence, HP , MP1, CRIT, EXPERT, RESIST})
end

--取得物品描述
function DescUtility:KaiGuang_GetItemExtDesc(tid, cid, ext_tbl)
	--LogPrint(tid)
	local descstring
	descstring = item_ext_desc[tid] or ITEM_EXT_DESC_NONE
	--LogPrint(descstring)
	return descstring
end

--获取装备开光状态

function DescUtility:GetEquipKaiguangGrade(ext_tbl)
	local State = 0
	State = ext_tbl["KaiguangState"] + 1
	return ITEM_KAIGUANG_TYPE_DESC[State],State
end

--获取装备开光属性描述
function DescUtility:GetEquipKaiguangGrade1(tbl)
	return DescUtility:GetEffectMajorDesc(tbl, 13)
end

function DescUtility:GetKungfuSoulAddonQuality( value )
		if value < 51 then
			return 1
		elseif value <61 then
			return 2
		elseif value < 71 then
			return 3
		elseif value <81 then
			return 4
		else
			return 5
		end
end

function DescUtility:GetKungfuSoulAddonInfos( addons, aptitude  )
	assert( #addons == 5 )
	assert( #aptitude == 5 )

	local addonQuality = {}
	for i = 1, #aptitude do
		addonQuality[i] = DescUtility:GetKungfuSoulAddonQuality( aptitude[i] )
	end
	return DescUtility:GetEffectMajorDesc(addons[1] ,addonQuality[1]+100),
	DescUtility:GetEffectMajorDesc(addons[2], addonQuality[2]+100),
	DescUtility:GetEffectMajorDesc(addons[3], addonQuality[3]+100),
	DescUtility:GetEffectMajorDesc(addons[4], addonQuality[4]+100),
	DescUtility:GetEffectMajorDesc(addons[5], addonQuality[5]+100)
end
--获取装备强化信息
function DescUtility:GetEquipReinforceEssDesc(tid,cid,tbl,ext_tbl)
	if ext_tbl["Grade"] == 0 then
		return --[[!AUTO_70]]""
	else
		return ITEM_COLOR_DESC_ENHANCE..--[[!AUTO_71]]"【強化】\r"
	end
end

--获取强化属性描述

function DescUtility:GetEquipReinforceEssDesc1(tbl)
	return DescUtility:GetEffectMajorDesc(tbl, 12)
end

--获取装备的附加属性

function DescUtility:GetEquipBaseEssDesc(tbl)
	return DescUtility:GetEffectMajorDesc(tbl, 1)
end

function DescUtility:GetEquipInjectEssDesc(addon_tid, addon_rand, addon_expire)
	if addon_tid == nil or addon_tid == 0 then
		return ""
	end

	local addonDesc = ItemTip:GetSingleAddonDesc(addon_tid, addon_rand)
	if addon_expire ~= 0 then
		local expireTimeDesc = DescUtility:GetExpireGMTTimeText(addon_expire, true)
		return ITEM_LIMIT_DESC[41]:format(addonDesc, expireTimeDesc)
	else
		return ITEM_LIMIT_DESC[40]:format(addonDesc)
	end
end

--获取装备上附加的技能属性

function DescUtility:GetEquipSKILLBaseEssDesc(tbl)
	if tbl["ext_skill_count"] then
		if tbl["ext_skill_count"] == 0 then
		return --[[!AUTO_72]]""
		else
			local skill_name1 = --[[!AUTO_73]]""
			local skill_essence = {}
			local skill_name = --[[!AUTO_74]]""
			local skill_profession = --[[!AUTO_75]]""
			local skill_name1 = --[[!AUTO_76]]""
			local skill_class = --[[!AUTO_77]]""
			local skill_level = --[[!AUTO_78]]""
			local skill_level1 = --[[!AUTO_79]]""
			local player_data = GameApi.GetPlayerBasicProp(0)

			EquipBaseEssDesc_skill= {}
			for i = 1 , tbl["ext_skill_count"] do
				skill_name1 = string.format(--[[!AUTO_80]]"%s%d%s",--[[!AUTO_81]]"ext_skill_",i,--[[!AUTO_82]]"_id")
				skill_essence = GameApi.GetSkillEssence(tbl["ext_skill_tbl"][skill_name1],1)
				skill_name = skill_essence["display_name"]
				skill_profession = skill_essence["mask_character"]
				if skill_ADDON_DESC_class[skill_profession] then
					skill_class = skill_ADDON_DESC_class[skill_profession]
				else
					skill_class = skill_ADDON_DESC_class[-1]
				end
				skill_level1 = string.format(--[[!AUTO_83]]"%s%d%s",--[[!AUTO_84]]"ext_skill_",i,--[[!AUTO_85]]"_level")
			--LogPrint (skill_level1)
				skill_level = tbl["ext_skill_tbl"][skill_level1]
			--LogPrint (skill_class)
			--LogPrint (skill_name)
			--LogPrint (skill_level)
				--LogPrint("skill_profession:" .. 2^(player_data.prof))
				--LogPrint("skill_profession:" .. skill_profession)
				if skill_profession == 2^(player_data.prof) then
					EquipBaseEssDesc_skill[i] = TAG_COLOR_ESSENCE[1] .. string.format(skill_ADDON_DESC,skill_class,skill_name,skill_level)
				else
					EquipBaseEssDesc_skill[i] = TAG_COLOR_ESSENCE[6] ..  string.format(skill_ADDON_DESC,skill_class,skill_name,skill_level)
				end
			end
		for i = 1,#EquipBaseEssDesc_skill-1 do
			for j = i+1,#EquipBaseEssDesc_skill do
				if string.len(EquipBaseEssDesc_skill[i]) > string.len(EquipBaseEssDesc_skill[j]) then
					EquipBaseEssDesc_skill[i],EquipBaseEssDesc_skill[j] = EquipBaseEssDesc_skill[j],EquipBaseEssDesc_skill[i]
				end
			end
		end
		return DescUtility:StringCombiner(EquipBaseEssDesc_skill)
		end
	else return --[[!AUTO_86]]""
	end
end

--取得宝石净化属性的过期时间。(小工具将覆盖此函数)
function DescUtility:GetPurifyExpireDesc(GMTTime, bShort)
	local leftTime = GMTTime - GameApi.GetServerGMTTime()

	local descText
	if leftTime > 24*60*60 then
		descText = string.format("%d天",leftTime/(24*60*60))
	else
		if leftTime > 60*60 then
			descText = string.format("%d小時",leftTime/(60*60))
		else
			descText = string.format("<1小時")
		end
	end
	return (bShort and "剩餘" or "淨化等級剩餘時間：") .. descText
end

--获取装备上宝石的附加属性

function DescUtility:GetESTONEDesc(tbl,tid,cid,ext_tbl)
	if #e_Stone[1] == 0 and #e_Stone[2] == 0 and  #e_Stone[3] == 0  then
		return --[[!AUTO_87]]""
	else
		local ITEMTYPE = --[[!AUTO_88]]""
		ITEMTYPE = --[[!]]"装备类别"
		local BITEMESTONETYPE,ITEMESTONETYPE
		if cid == ClassType.ICID_DARTS_BOX then
			ITEMESTONETYPE = 999
		else
			BITEMESTONETYPE,ITEMESTONETYPE = DescUtility:GetItemDBProp(tid,cid,ITEMTYPE)
			ITEMESTONETYPE = ITEMESTONETYPE +1
		end
		local num = --[[!AUTO_89]]""
		if cid == ClassType.ICID_DARTS_BOX then
			num = --[[!]]"打孔总数上限"
		else
			num = --[[!]]"打孔的总数上限"
		end
		local BESTONEnum, ESTONEnum = DescUtility:GetItemDBProp(tid,cid,num)
		local newnum = 0
			if #e_Stone[1]~= nil and #e_Stone[1]~= 0 then
				newnum = newnum + #e_Stone[1]
			end
			if #e_Stone[2]~= nil and #e_Stone[2]~= 0 then
				newnum = newnum + #e_Stone[2]
			end
			if #e_Stone[3]~= nil and #e_Stone[3]~= 0 then
				newnum = newnum + #e_Stone[3]
			end
		local unopennum =  ESTONEnum - newnum
		local iSocket = 0
		local ITEM_ESTONEADDON = {}
		local quality = 1
		for iStoneShape = 1, 3 do
			if #e_Stone[iStoneShape]~= nil then
				for k, v in ipairs(e_Stone[iStoneShape]) do
					iSocket = iSocket + 1
					if v == 0 then
						ITEM_ESTONEADDON[iSocket] = {}
						ITEM_ESTONEADDON[iSocket][1] = 1
						ITEM_ESTONEADDON[iSocket][2] = -1
						ITEM_ESTONEADDON[iSocket][3] = --[[!AUTO_90]]"未鑲嵌\n"
					else
						ITEM_ESTONEADDON[iSocket] = {}
						ITEM_ESTONEADDON[iSocket][1] = 1
						_,ITEM_ESTONEADDON[iSocket][2] = DescUtility:GetItemDBProp(v,ClassType.ICID_ESTONE,--[[!]]"图标名称")
						_, quality = DescUtility:GetItemDBProp(v,ClassType.ICID_ESTONE,--[[!]]"品质")
						ITEM_ESTONEADDON[iSocket][2] = GameApi.GetIDByFileName(ITEM_ESTONEADDON[iSocket][2],-0)
						if ITEM_ESTONEADDON[iSocket][2] == --[[!AUTO_91]]"" then
							ITEM_ESTONEADDON[iSocket][2] = 0
						end
						--加入了宝石净化等级显示 gaoxinyuan 2015/01/21
						local Purify_Level = ext_tbl["Purify_Level_"..iSocket-1] or 0
						local Purify_DTime = ext_tbl["Purify_DTime_"..iSocket-1] or 0
						if Purify_Level == 0 then
							local name,addon = DescUtility:GetESTONESocketedEss_V2(v, ITEMESTONETYPE)
							ITEM_ESTONEADDON[iSocket][3] = string.format(--[[!AUTO_92]]"%s%s",ITEM_COLOR_DESC[quality],name).." 淨化+0\r"..addon.."\n"
						else
							local name,addon = DescUtility:GetESTONESocketedEss_V2(v, ITEMESTONETYPE, Purify_Level)
							ITEM_ESTONEADDON[iSocket][3] = string.format(--[[!AUTO_92]]"%s%s",ITEM_COLOR_DESC[quality],name)..string.format(" 淨化+%d",Purify_Level)..self:GetPurifyExpireDesc(Purify_DTime, true)..string.format("\r%s\n",addon)
						end
					end
				end
			end
		end

		if unopennum > 0 then
			for i = 1 ,unopennum do
			ITEM_ESTONEADDON[newnum+i] = {}
			ITEM_ESTONEADDON[newnum+i][1] = -1
			ITEM_ESTONEADDON[newnum+i][2] = -1
			ITEM_ESTONEADDON[newnum+i][3] = --[[!AUTO_99]]"\n"
			end
		end
		local k = 1
		local NEW_ITEM_ESTONEADDON ={}
		for i = 1,#ITEM_ESTONEADDON do
			for j = 1,#ITEM_ESTONEADDON[i] do
				NEW_ITEM_ESTONEADDON[k] = ITEM_ESTONEADDON[i][j]
				k = k+1
			end
		end
		local str = --[[!AUTO_100]]""
			for i = 1,#NEW_ITEM_ESTONEADDON do
				if i%3 ==1 then
					str = str .. NEW_ITEM_ESTONEADDON[i] .. --[[!AUTO_101]]"_"
				end
				if i%3 ==2 then
					str = str .. NEW_ITEM_ESTONEADDON[i] .. --[[!AUTO_102]]"_"
				end
				if i%3 == 0 then
					str = str .. NEW_ITEM_ESTONEADDON[i] .. --[[!AUTO_103]]"\r"
				end
			end
		--LogPrint("str:" .. str)

		return str
	end
end

--获取宝石镶后的属性（tid模板，sid镶嵌位）
function DescUtility:GetESTONESocketedEss(tid, sid, purity_level)
	local bOK1, EstoneName = DescUtility:GetItemDBProp(tid, ClassType.ICID_ESTONE, --[[!AUTO_104]]"t_name")
	local bOK2, EstoneEss
	for k,v in pairs(ITEM_ESTONE_SOCKET_PLACE) do
		bOK2, EstoneEss = DescUtility:GetItemDBProp(tid, ClassType.ICID_ESTONE, --[[!]]"镶在" .. v .. --[[!]]"上的附加属性组id")
		if EstoneEss>0 then
			break
		end
	end

	if bOK1 and bOK2 and EstoneEss > 0 then
		add_percent = nil
		if purity_level then
			local bOK3, percent = DescUtility:GetItemDBProp(tid, ClassType.ICID_ESTONE, --[[!]]"净化" .. purity_level .. --[[!]]"级增加属性")
			if bOK3 and percent > 0 then
					add_percent = percent * 100
				end
			end
		return string.format(ITEM_ESTONE_SOCKET_ESS_STYLE, TAG_COLOR_ESSENCE[3], EstoneName, DescUtility:GetEffectBaseDesc(EstoneEss, 2, add_percent))
	else
		return --[[!AUTO_105]]""
	end
	--return INITEM_ESTONE_ADDON_DESC[tid][sid]
end

function DescUtility:GetESTONESocketedEss_V2(tid, sid, purity_level)
	local bOK1, EstoneName = DescUtility:GetItemDBProp(tid, ClassType.ICID_ESTONE, --[[!AUTO_104]]"t_name")
	local bOK2, EstoneEss
	for k,v in pairs(ITEM_ESTONE_SOCKET_PLACE) do
		bOK2, EstoneEss = DescUtility:GetItemDBProp(tid, ClassType.ICID_ESTONE, --[[!]]"镶在" .. v .. --[[!]]"上的附加属性组id")
		if EstoneEss>0 then
			break
		end
	end

	if bOK1 and bOK2 and EstoneEss > 0 then
		add_percent = nil
		if purity_level then
			local bOK3, percent = DescUtility:GetItemDBProp(tid, ClassType.ICID_ESTONE, --[[!]]"净化" .. purity_level .. --[[!]]"级增加属性")
			if bOK3 and percent > 0 then
					add_percent = percent * 100
				end
			end
		return string.format(ITEM_ESTONE_SOCKET_ESS_STYLE_V2, TAG_COLOR_ESSENCE[3], EstoneName),string.format(ITEM_ESTONE_SOCKET_ESS_STYLE_V2, TAG_COLOR_ESSENCE[3], DescUtility:GetEffectBaseDesc(EstoneEss, 2, add_percent))
	else
		return --[[!AUTO_105]]"",""
	end
	--return INITEM_ESTONE_ADDON_DESC[tid][sid]
end

--获取宝石的形状

function DescUtility:GetESTONEShape(tid, cid)
	local sTempl = --[[!AUTO_106]]""
	sTempl = --[[!]]"宝石形状"
	local BShape, Shape = DescUtility:GetItemDBProp(tid,cid,sTempl)
	Shape =Shape +1
	return ITEM_ESTONE_SHAPE_DESC[Shape]
end

--获取宝石的类型

function DescUtility:GetESTONEType(tid, cid)
	local sTempl = --[[!AUTO_107]]""
	sTempl = --[[!]]"宝石种类"
	local BType, Type = DescUtility:GetItemDBProp(tid,cid,sTempl)
	Type = Type +1
	return ITEM_ESTONE_TYPE_DESC[Type]
end

--获取宝石的等级

function DescUtility:GetESTONELevel(tid, cid)
	local sTempl = --[[!AUTO_108]]""
	sTempl = --[[!]]"宝石等级"
	local BLevel, Level = DescUtility:GetItemDBProp(tid,cid,sTempl)
	return Level
end

--获取宝石附加属性

function DescUtility:GetAESTONEDesc(tid, cid,purity_level)
	local ESTONEstr = --[[!AUTO_109]]""
	for i = 1, #ITEM_ESTONE_SOCKET_PLACE do
		local bOK, EstoneEss = DescUtility:GetItemDBProp(tid, cid, --[[!]]"镶在" .. ITEM_ESTONE_SOCKET_PLACE[i] .. --[[!]]"上的附加属性组id")
		if bOK and EstoneEss > 0 then
			add_percent = nil
			if purity_level then
				local bOK2, percent = DescUtility:GetItemDBProp(tid, cid, --[[!]]"净化" .. purity_level .. --[[!]]"级增加属性")
				if bOK2 and percent > 0 then
					add_percent = percent * 100
				end
			end
			local EssString = string.format(ITEM_ESTONE_SOCKET_PLACE_STYLE, TAG_COLOR_ESSENCE[3], --[[!AUTO_110]]"鑲嵌", DescUtility:GetEffectBaseDesc(EstoneEss, 2, add_percent))
			if ESTONEstr == --[[!AUTO_111]]"" then
				ESTONEstr = EssString
			--[[else
				ESTONEstr = ESTONEstr .. "\r" .. EssString]]
			end
		end
	end
	return ESTONEstr
	--return ITEM_ESTONE_ADDON_DESC[tid]
end

--获取装备精华附加属性

function DescUtility:GetPSTONEAddonDesc(addon_tid, addon_rand)
	if addon_tid == 0 then
		return ""
	else
		local addonDesc = ItemTip:GetSingleAddonDesc(addon_tid, addon_rand)
		return string.format(ITEM_PSTONE_SOCKET_PLACE_STYLE, TAG_COLOR_ESSENCE[3], "注入", addonDesc)
	end
end


-- 获取交通工具描述
function  DescUtility:GetVehicleLimit(tid, cid)
	local bOK, vhcContain = DescUtility:GetItemDBProp(tid, cid, --[[!]]"绑定中容纳的最大人数")
	local bOK, extraSpeed = DescUtility:GetItemDBProp(tid, cid, --[[!]]"骑乘加速跑额外增加的速度")
	local bOK, inCombat = DescUtility:GetItemDBProp(tid, cid, --[[!]]"能否在战斗中使用")
	return string.format(VEHICLE_MOUNT_LIMIT_TEXT, vhcContain) .. ((extraSpeed > 0) and VEHICLE_MOUNT_FASTRUNSPEED_YES_TEXT or VEHICLE_MOUNT_FASTRUNSPEED_NO_TEXT) .. ((inCombat == 1) and VEHICLE_MOUNT_INCOMBAT_YES_TEXT or VEHICLE_MOUNT_INCOMBAT_NO_TEXT)
end


-- 获取交通工具限制
function DescUtility:GetVehicleProp(tid, cid)

	local bOK, walkSpeed = DescUtility:GetItemDBProp(tid, cid, --[[!]]"行走速度")
	local bOK, runSpeed = DescUtility:GetItemDBProp(tid, cid, --[[!]]"奔跑速度")
	local bOK, extraSpeed = DescUtility:GetItemDBProp(tid, cid, --[[!]]"骑乘加速跑额外增加的速度")

	return VEHICLE_MOUNT_PROP_COLOR .. string.format(VEHICLE_MOUNT_WALKSPEED_TEXT, walkSpeed) .. string.format(VEHICLE_MOUNT_RUNSPEED_TEXT, runSpeed) .. ((extraSpeed > 0) and string.format(VEHICLE_MOUNT_FASTRUNSPEED_TEXT, runSpeed + extraSpeed) or --[[!AUTO_112]]"")
end

-- 获取物品附加描述
function DescUtility:GetItemExtDesc(tid, cid, ext_tbl)
	local descstring = --[[!AUTO_113]]""

	if ext_tbl["SignName"] and ext_tbl["SignName"] ~= --[[!AUTO_114]]"" and ext_tbl["SignName"] ~= 0 then
		descstring = string.format(ITEM_PRODUCER_NAME,TAG_COLOR_CHANNEL[5],ext_tbl["SignName"])
	end

	local bindstring
	bindstring = DescUtility:GetItemBindState(tid, cid, ext_tbl["Bind"], ext_tbl["BindOnTrade"])
	if bindstring ~= --[[!AUTO_115]]"" then
		if descstring == --[[!AUTO_116]]"" then
			descstring = bindstring
		else
			descstring = descstring .. --[[!AUTO_117]]"\r" .. bindstring
		end
	end
	
	---掉落只可寄售
	local auctionstring
	if ext_tbl["Auction"] then
		auctionstring = ITEM_BIND_STRING[9]
	else
		auctionstring = ""
	end
	
	if auctionstring ~= "" then
		if descstring == "" then
			descstring = auctionstring
		else
			descstring = descstring .. --[[!AUTO_117]]"\r" .. auctionstring
		end
	end

	if cid == ClassType.ICID_EQUIP then
		local guildbindstring
		guildbindstring = DescUtility:GetItemGuidBindState(tid, cid, ext_tbl["GuildBind"])
		if guildbindstring ~= "" then
			if descstring == "" then
				descstring = guildbindstring
			else
				descstring = descstring .. "\r" .. guildbindstring
			end
		end
	end

	if item_ext_desc[tid] then
		if descstring == --[[!AUTO_118]]"" then
			descstring = item_ext_desc[tid]
		else
			descstring = descstring .. --[[!AUTO_119]]"\r" .. item_ext_desc[tid]
		end
	end

	local bOK, dealType = DescUtility:GetItemDBProp(tid, cid, --[[!]]"处理方式")
	if bOK then
		if bit.band(dealType, ItemStateFlag.STATE_FDDJ) > 0 then
		local fddjstring = --[[!AUTO_120]]""
			fddjstring = string.format(--[[!AUTO_121]]"剩餘使用次數：%d", ext_tbl["Num"])
			if descstring == --[[!AUTO_122]]"" then
				descstring = fddjstring
			else
				descstring = descstring .. --[[!AUTO_123]]"\r" .. fddjstring
			end
		end
	end

	--LogPrintA(ext_tbl["TimeLimit"])
	--LogPrintA(descstring)
	if ext_tbl["TimeLimit"] and ext_tbl["TimeLimit"] > 0 then
		local timestring = --[[!AUTO_124]]""
		timestring = DescUtility:GetItemExpireGMTTimeText(ext_tbl["TimeLimit"], true)
		--LogPrintA(timestring)
		if descstring == --[[!AUTO_125]]"" then
			descstring = timestring
		elseif timestring ~= --[[!AUTO_126]]"" then
			descstring = descstring .. --[[!AUTO_127]]"\r\r" .. timestring
		end
	end

	if cid == ClassType.ICID_EQUIP then
		local masterstring = --[[!AUTO_128]]""
		if ext_tbl["aptitude_id"] and ext_tbl["aptitude_id"] > 0 then
			masterstring = string.format(--[[!AUTO_129]]"%s\r%s%s", DescUtility:GetAplititudeName(ext_tbl["aptitude_id"]), TAG_COLOR_ESSENCE[10], DescUtility:GetEffectBaseDesc(ext_tbl["aptitude_addongroup"], 0))
			if descstring == --[[!AUTO_130]]"" then
				descstring = masterstring
			else
				descstring = descstring .. --[[!AUTO_131]]"\r\r" .. masterstring
			end
		end
	end

	return descstring
end

-- 获取商城道具额外描述
function DescUtility:GetMallItemExtraText(str, tbl)
--[[
sell_end_time (number) 下架时间(GMT)
time_limit (number) 有效期时长(秒)
gift_id (number) 赠品tid
gift_count (number) 赠品数量
这些信息已显示在购买界面中，但购物车和结算界面中看不到。有空麻烦加一下tip
]]
	local mall_ext_text

	if tbl["sell_end_time"] > 0 or tbl["time_limit"] > 0 or tbl["gift_id"] > 0 then
		mall_ext_text = MALL_SPECIAL_TEXT
	else
		mall_ext_text = --[[!AUTO_132]]""
	end

	if tbl["sell_end_time"] > 0 then
		mall_ext_text = string.format(MALL_SELL_END_TIME_TEXT, mall_ext_text, DescUtility:GetTimeString(tbl["sell_end_time"], 2))
	end
	if tbl["time_limit"] > 0 then
		mall_ext_text = string.format(MALL_TIME_LIMIT_TEXT, mall_ext_text, DescUtility:GetItemExpireTimeText(tbl["time_limit"], false))
	end
	if tbl["gift_id"] > 0 then
		local giftname = DescUtility:GetSubItemName(tbl["gift_id"])
		mall_ext_text = string.format(MALL_GIFT_TEXT, mall_ext_text, giftname, tbl["gift_count"])
	end
	if str ~= --[[!AUTO_133]]"" and mall_ext_text ~= --[[!AUTO_134]]"" then
		mall_ext_text = --[[!AUTO_135]]"\r\r" .. mall_ext_text
	end
	return mall_ext_text
end

-- 获取物品叠加数量
function DescUtility:GetItemOverlap(tid, cid)
	local sTempl = --[[!AUTO_136]]""
	sTempl = --[[!]]"堆叠上限"
	local bIcon, sIcon = DescUtility:GetItemDBProp(tid,cid,sTempl)
	return bIcon and sIcon or 0
end

--划分价格单元
function DescUtility:GetPriceString(price)
	local money1 = --[[!AUTO_137]]""
	local money2 = --[[!AUTO_138]]""
	local money3 = --[[!AUTO_139]]""
	local money4 = --[[!AUTO_140]]""
	local num1, num2, num3, num4
	if price >= 1 then
		num1 = price / ITEM_PRICE_UNIT_HIGH
		num2 = (price / ITEM_PRICE_UNIT_MID)
		num3 = (price / ITEM_PRICE_UNIT_LOW) % (ITEM_PRICE_UNIT_MID / ITEM_PRICE_UNIT_LOW)
		num4 = price % ITEM_PRICE_UNIT_LOW
		if num1 >= 1 then
			money1 = string.format(ITEM_PRICE_UNIT_DESC_HIGH, num1)
			money2 = string.format(ITEM_PRICE_UNIT_DESC_MAX, num2)
			if string.len(money2) < math.log10(ITEM_PRICE_UNIT_HIGH / ITEM_PRICE_UNIT_MID) then
				for i = 1 , math.log10(ITEM_PRICE_UNIT_HIGH / ITEM_PRICE_UNIT_MID) - string.len(money2) do
					money2 = string.format(--[[!AUTO_141]]" "..money2)
				end
			end
			money3 = string.format(ITEM_PRICE_UNIT_DESC_MAX, num3)
			if string.len(money3) < math.log10(ITEM_PRICE_UNIT_MID / ITEM_PRICE_UNIT_LOW) then
				for i = 1 , math.log10(ITEM_PRICE_UNIT_MID / ITEM_PRICE_UNIT_LOW) - string.len(money3) do
					money3 = string.format(--[[!AUTO_142]]" "..money3)
				end
			end
			money4 = string.format(ITEM_PRICE_UNIT_DESC_MAX, num4)
			if string.len(money4) < math.log10(ITEM_PRICE_UNIT_LOW) then
				for i = 1 , math.log10(ITEM_PRICE_UNIT_LOW) - string.len(money4) do
					money4 = string.format(--[[!AUTO_143]]" "..money4)
				end
			end
		else
			money1 = --[[!AUTO_144]]""
			if num2 >= 1 then
				money2 = string.format(ITEM_PRICE_UNIT_DESC_MAX, num2)
				money3 = string.format(ITEM_PRICE_UNIT_DESC_MAX, num3)
				if string.len(money3) < math.log10(ITEM_PRICE_UNIT_MID / ITEM_PRICE_UNIT_LOW) then
					for i = 1 , math.log10(ITEM_PRICE_UNIT_MID / ITEM_PRICE_UNIT_LOW) - string.len(money3) do
						money3 = string.format(--[[!AUTO_145]]" "..money3)
					end
				end
				money4 = string.format(ITEM_PRICE_UNIT_DESC_MAX, num4)
				if string.len(money4) < math.log10(ITEM_PRICE_UNIT_LOW) then
					for i = 1 , math.log10(ITEM_PRICE_UNIT_LOW) - string.len(money4) do
						money4 = string.format(--[[!AUTO_146]]" "..money4)
					end
				end
			else
				money2 = --[[!AUTO_147]]""
				if num3 >= 1 then
					money3 = string.format(ITEM_PRICE_UNIT_DESC_MAX, num3)
					money4 = string.format(ITEM_PRICE_UNIT_DESC_MAX, num4)
					if string.len(money4) < math.log10(ITEM_PRICE_UNIT_LOW) then
						for i = 1 , math.log10(ITEM_PRICE_UNIT_LOW) - string.len(money4) do
							money4 = string.format(--[[!AUTO_148]]" "..money4)
						end
					end
				else
					money3 = --[[!AUTO_149]]""
					money4 = string.format(ITEM_PRICE_UNIT_DESC_MAX, num4)
				end
			end
		end
	else
		money4 = --[[!AUTO_150]]"0"
	end
	--LogPrint("money1:" .. money1)
	--LogPrint("money2:" .. money2)
	--LogPrint("money3:" .. money3)
	--LogPrint("money4:" .. money4)
	return money1, money2, money3, money4
end

--获取宝石的等级限制

function DescUtility:GetESTONELevelLimit(tid, cid)
	local sLv = --[[!AUTO_151]]""
	sLv = --[[!]]"可镶嵌的装备等级下限"
	local mLv = --[[!AUTO_152]]""
	mLv = --[[!]]"可镶嵌的装备等级上限"
	local _, levellimit1 = DescUtility:GetItemDBProp(tid, cid, sLv)
	local _, levellimit2 = DescUtility:GetItemDBProp(tid, cid, mLv)
	return string.format(ITEM_LIMIT_DESC[11],levellimit1,levellimit2)
end

--获取打孔石的等级限制
function DescUtility:GetHOLELevelLimit(tid, cid)
	local sLv = --[[!AUTO_153]]""
	sLv = --[[!]]"适用的装备等级下限"
	local mLv = --[[!AUTO_154]]""
	mLv = --[[!]]"适用的装备等级上限"
	local _, levellimit1 = DescUtility:GetItemDBProp(tid, cid, sLv)
	local _, levellimit2 = DescUtility:GetItemDBProp(tid, cid, mLv)
	return string.format(ITEM_LIMIT_DESC[11],levellimit1*10,levellimit2*10+9)
end

--获取镶嵌符的等级限制
function DescUtility:GetEMBEDLevelLimit(tid, cid)
	local sLv = --[[!AUTO_155]]""
	sLv = --[[!]]"适用的装备等级下限"
	local mLv = --[[!AUTO_156]]""
	mLv = --[[!]]"适用的装备等级上限"
	local _, levellimit1 = DescUtility:GetItemDBProp(tid, cid, sLv)
	local _, levellimit2 = DescUtility:GetItemDBProp(tid, cid, mLv)
	return string.format(ITEM_LIMIT_DESC[11],levellimit1*10,levellimit2*10+9)
end

-- 获取物品人物等级限制
function DescUtility:GetItemLevelLimit(tid, cid)
	local sLv = --[[!AUTO_157]]""
	if cid == ClassType.ICID_EQUIP or cid == ClassType.ICID_LOTTERY or cid == ClassType.ICID_SKILLMATTER or cid == ClassType.ICID_APLITITUDE
	or cid == ClassType.ICID_VEHICLE or cid == ClassType.ICID_FIREWORK or cid == ClassType.ICID_COUPLE_JUMPTO or cid == ClassType.ICID_TRANSMITROLL
	or cid == ClassType.ICID_SKILLTOME or cid == ClassType.ICID_CHANGEFACE or cid == ClassType.ICID_TRANSMITFLAG or cid == ClassType.ICID_DOUBLEEXP then
		sLv = --[[!]]"等级限制"
	elseif cid == ClassType.ICID_PET_BEDGE or cid == ClassType.ICID_ICID_CARD_ITEM then
	    sLv = --[[!]]"需求玩家等级"
	elseif cid == ClassType.ICID_SUMMON_ITEM or cid == ClassType.ICID_BACKPACK then
	    sLv = --[[!]]"等级需求"
	elseif cid == ClassType.ICID_MEDICINE or cid == ClassType.ICID_ACTION_ITEM then
	    sLv = --[[!]]"玩家的级别要求"
	elseif cid == ClassType.ICID_SCENEONLY then
	    sLv = --[[!]]"使用对应的玩家级别要求"
	elseif cid == ClassType.ICID_TREASUREMAPFRAGMENT then
	    sLv = --[[!]]"玩家等级下限"
	elseif cid == ClassType.ICID_PLAYER_CHUANGONG then
	    sLv = --[[!]]"使用等级限制"
	elseif cid == ClassType.ICID_MAGIC_CIRCLE then
		sLv = --[[!]]"最小等级限制"
	elseif cid == ClassType.ICID_MAGIC_STONE then
		sLv = --[[!]]"等级"
	else
		sLv = --[[!AUTO_158]]""
	end

	local sMaxLv = ""
	local maxLv = 0
	if cid == ClassType.ICID_MEDICINE or cid == ClassType.ICID_ACTION_ITEM then
	    sMaxLv = --[[!]]"玩家的级别要求上限"
		_, maxLv = DescUtility:GetItemDBProp(tid, cid, sMaxLv)
	end

	if sLv == --[[!AUTO_159]]"" then
		return --[[!AUTO_160]]""
	else
		local _, levellimit = DescUtility:GetItemDBProp(tid, cid, sLv)
		local player_prop = GameApi.GetPlayerFullProp(0)
		if maxLv > 0 then
			if player_prop["level"] < levellimit or player_prop["level"] > maxLv then
				return string.format(ITEM_LIMIT_DESC[3], TAG_COLOR_ESSENCE[4], string.format("%s-%s",levellimit,maxLv))
			else
				return string.format(ITEM_LIMIT_DESC[3], TAG_COLOR_ESSENCE[5], string.format("%s-%s",levellimit,maxLv))
			end
		else
			if player_prop["level"] < levellimit then
				return string.format(ITEM_LIMIT_DESC[3], TAG_COLOR_ESSENCE[4], levellimit)
			else
				return string.format(ITEM_LIMIT_DESC[3], TAG_COLOR_ESSENCE[5], levellimit)
			end
		end
	end
end

-- 获取物品人物职业限制
function DescUtility:GetItemProfLimit(tid, cid)
	local sProf = --[[!AUTO_161]]""
	if cid == ClassType.ICID_EQUIP or cid == ClassType.ICID_APLITITUDE or cid == ClassType.ICID_SKILLTOME or cid == ClassType.ICID_ICID_CARD_ITEM then
		sProf = --[[!]]"职业限制"
	elseif cid == ClassType.ICID_PET_BEDGE then
		sProf = --[[!]]"需求玩家职业"
	elseif cid == ClassType.ICID_MEDICINE or cid == ClassType.ICID_LOTTERY or cid == ClassType.ICID_TRANSMITROLL then
		sProf =--[[!]]"职业需求"

	else
	    sProf = --[[!AUTO_163]]""
	end
	if sProf == --[[!AUTO_164]]"" then
		return --[[!AUTO_165]]""
	else
		local _, proflimit = DescUtility:GetItemDBProp(tid, cid, sProf)
		local ProfLimitStr = --[[!AUTO_166]]""
		local item_limit_faction = {}
		local count = 1
		local i,j
		local is_first = true

		for i = 1, 12 do
			if bit.band(proflimit,count) > 0 then
				item_limit_faction[i] = 1
			else
				item_limit_faction[i] = 0
			end
			count = count * 2
		end

		if proflimit > 4095 or proflimit <= 0 then
			ProfLimitStr = ITEM_LIMIT_FACTION_UNKNOW
		elseif proflimit == 4095 then
			ProfLimitStr = ITEM_LIMIT_FACTION_ALL
		elseif proflimit == 4094 then
			ProfLimitStr = ITEM_LIMIT_FACTION_CHOSEN
		else
			for i = 1, 12 do
				if item_limit_faction[i] == 1 then
					if is_first == true then
						is_first = false
						ProfLimitStr = ITEM_LIMIT_FACTION_DESC[i]
					else
						ProfLimitStr = string.format(--[[!AUTO_167]]"%s%s%s",ProfLimitStr,--[[!AUTO_168]]"、",ITEM_LIMIT_FACTION_DESC[i])
					end
				end
			end
		end
		local player_prop = GameApi.GetPlayerFullProp(0)
		if cid == ClassType.ICID_EQUIP then
			if bit.band(proflimit,2^player_prop["prof"]) >0 then
				return string.format(ITEM_LIMIT_DESC[29], TAG_COLOR_ESSENCE[5], ProfLimitStr),ProfLimitStr
			else
				return string.format(ITEM_LIMIT_DESC[29], TAG_COLOR_ESSENCE[4], ProfLimitStr),ProfLimitStr
			end
		else
			if bit.band(proflimit,2^player_prop["prof"]) >0 then
				return string.format(ITEM_LIMIT_DESC[4], TAG_COLOR_ESSENCE[5], ProfLimitStr),ProfLimitStr
			else
				return string.format(ITEM_LIMIT_DESC[4], TAG_COLOR_ESSENCE[4], ProfLimitStr),ProfLimitStr
			end
		end
	end
end

--获取物品等级描述
function DescUtility:GetItemLevelDesc(tid, cid)
	local sLv = --[[!AUTO_169]]""
	if cid == ClassType.ICID_SERVANT then
		sLv = --[[!]]"等级"
	else
		sLv = --[[!AUTO_170]]""
	end
	if sLv == --[[!AUTO_171]]"" then
		return --[[!AUTO_172]]""
	else
		local _, level_limit = DescUtility:GetItemDBProp(tid, cid, sLv)
		return string.format(ITEM_LIMIT_DESC[3],--[[!AUTO_173]]"^ffffff",level_limit)
	end
	return --[[!AUTO_174]]""
end


-- 获取物品人物性别限制
function DescUtility:GetItemSexLimit(tid, cid)
	local sSex = --[[!AUTO_175]]""
	if cid == ClassType.ICID_EQUIP then
		sSex = --[[!]]"性别限制"
	elseif cid == ClassType.ICID_VEHICLE then
		sSex = "位置1性別限制"
	else
		sSex = --[[!AUTO_176]]""
	end
	if sSex == --[[!AUTO_177]]"" then
		return --[[!AUTO_178]]""
	else
		local _, sexlimit = DescUtility:GetItemDBProp(tid, cid, sSex)
		local player_prop = GameApi.GetPlayerFullProp(0)
		if sexlimit ~= 2 and player_prop["gender"] ~= sexlimit then
			return string.format(ITEM_LIMIT_DESC[5],TAG_COLOR_ESSENCE[4],ITEM_LIMIT_SEX[sexlimit+1])
		else
			return string.format(ITEM_LIMIT_DESC[5],TAG_COLOR_ESSENCE[5],ITEM_LIMIT_SEX[sexlimit+1])
		end
	end
	return --[[!AUTO_179]]""
end

--获取物品性别描述
function DescUtility:GetItemSexDesc(tid, cid)
	local sSex = --[[!AUTO_180]]""
	if cid == ClassType.ICID_SERVANT then
		sSex = --[[!]]"性别"
	else
		sSex = --[[!AUTO_181]]""
	end
	if sSex == --[[!AUTO_182]]"" then
		return --[[!AUTO_183]]""
	else
		local _, sexlimit = DescUtility:GetItemDBProp(tid, cid, sSex)
		if sexlimit == 0  then
			return string.format(ITEM_LIMIT_DESC[30],ITEM_LIMIT_SEX[4])
		else
			return string.format(ITEM_LIMIT_DESC[30],ITEM_LIMIT_SEX[5])
		end
	end
	return --[[!AUTO_184]]""
end
--[[
-- 获取物品人物性别限制
function DescUtility:GetItemSexLimit(tid, cid)
	local is_valid,is_active,base_level,extra_level = GameApi.GetJobInfo(idJob)
	return ""
end
]]


-- 获取物品耐久限制
function DescUtility:GetItemEndurLimit(tid, cid, ext_tbl)
	if cid == ClassType.ICID_EQUIP then
		local _, equiptedur = DescUtility:GetItemDBProp(tid, cid, --[[!]]"耐久度")
		if equiptedur <= 1 then
			return --[[!AUTO_185]]""
		else
			equipedurnow= math.ceil(ext_tbl["EquipEndurance"]/100)
			if equipedurnow == 0 then
			return string.format(--[[!AUTO_186]]"%s%s%s",--[[!AUTO_187]]"^ff0000",string.format(ITEM_LIMIT_DESC[6], equipedurnow),--[[!AUTO_188]]"^ffffff")
			elseif equipedurnow == equiptedur then
			return string.format(ITEM_LIMIT_DESC[6],100)
			else
			equipedurnow = math.floor(equipedurnow/equiptedur*100)+1
			end
			if equipedurnow < 20 then
			return string.format(--[[!AUTO_189]]"%s%s%s",--[[!AUTO_190]]"^ff9600",string.format(ITEM_LIMIT_DESC[6], equipedurnow),--[[!AUTO_191]]"^ffffff")
			else
			return string.format(ITEM_LIMIT_DESC[6], equipedurnow)
			end
		end
	end
end

--获取货币绑定类型显示
function DescUtility:GetItemBindDisplay(tid, cid,ext_tbl ,context_type)
	local bind_display = --[[!AUTO_192]]"0"
	local _,sell_mode = DescUtility:GetItemDBProp(tid, cid, --[[!]]"卖店模式")

	if context_type == ContextType.CONTEXT_BOOTH_BUY or context_type == ContextType.CONTEXT_BOOTH_SELL then
		bind_display = --[[!AUTO_193]]"0"
	elseif context_type == CONTEXT_NPC_BUY_BIND or sell_mode == 1 then
		bind_display = --[[!AUTO_194]]"1"
	else
		if sell_mode == 0 and ext_tbl["Bind"] then
			bind_display = --[[!AUTO_195]]"1"
		end
	end

	return bind_display
end



-- 获取物品价格
function DescUtility:GetItemPrice(tid, cid, context_type, price_scale, ext_tbl)
	local buy_type = DescUtility:GetItemBindDisplay(tid, cid,ext_tbl ,context_type)

	if context_type == ContextType.CONTEXT_NPC_BUY or context_type == ContextType.CONTEXT_NPC_BUY_BIND then --看店卖价的情况

		local _, buyprice = DescUtility:GetItemDBProp(tid, cid, --[[!]]"店卖价")
		local _, buyfameid = DescUtility:GetItemDBProp(tid, cid, --[[!]]"店卖声望类型")
		local _, buyfameval = DescUtility:GetItemDBProp(tid, cid, --[[!]]"店卖声望值")
		local _, buyitemid = DescUtility:GetItemDBProp(tid, cid, --[[!]]"店卖特殊物品id")
		local _, buyitemnum = DescUtility:GetItemDBProp(tid, cid, --[[!]]"店卖特殊物品数量")
		--ext_tbl["ShopSellMode"]
		--ext_tbl["ShopSellPrice"]
		--ext_tbl["RepuType"]
		--ext_tbl["RepuValue"]
		--ext_tbl["ShopSellItem"]
		--ext_tbl["ShopSellCnt"]
		if ext_tbl["ShopSellPrice"] ~= nil or ext_tbl["RepuType"] ~= nil or ext_tbl["ShopSellItem"] ~= nil then
			if ext_tbl["ShopSellPrice"] > 0 or ext_tbl["RepuValue"] > 0 or ext_tbl["ShopSellCnt"] > 0 then
				buy_type = ext_tbl["ShopSellMode"]
				buyprice = ext_tbl["ShopSellPrice"]
				buyfameid = ext_tbl["RepuType"]
				buyfameval = ext_tbl["RepuValue"]
				buyitemid = ext_tbl["ShopSellItem"]
				buyitemnum = ext_tbl["ShopSellCnt"]
			end
		end
		local pricestr1 = --[[!AUTO_196]]""
		local pricestr2 = --[[!AUTO_197]]""
		local pricestr3 = --[[!AUTO_198]]""
		local moneystr1 = --[[!AUTO_199]]""
		local moneystr2 = --[[!AUTO_200]]""
		local moneystr3 = --[[!AUTO_201]]""
		local moneystr4 = --[[!AUTO_202]]""
		local famestr = --[[!AUTO_203]]""
		local itemicon = --[[!AUTO_204]]""
		local itemstr = --[[!AUTO_205]]""
		--LogPrint(buyprice)

		if buyitemid > 0 and buyitemnum > 0 then
			local itemname = --[[!AUTO_206]]""
			itemname = DescUtility:GetItemName(buyitemid, ClassType.ICID_NORMAL_ITEM)
			itemicon = DescUtility:GetItemIcon(buyitemid, ClassType.ICID_NORMAL_ITEM)
			if itemicon ~= --[[!AUTO_207]]"" then
				pricestr3 = ITEM_PRICE_ITEM_TEXT
				itemstr = string.format(ITEM_PRICE_ITEM_STYLE, buyitemnum, itemname)
			end
		else
			if buyprice > 0 then
				pricestr1 = ITEM_PRICE_MONEY_TEXT
				moneystr4, moneystr3, moneystr2, moneystr1 = DescUtility:GetPriceString(buyprice)
			end
			if buyfameid > 0 and buyfameval > 0 then
				local fameName = FameNotice:GetName(buyfameid)
				if fameName then
					pricestr2 = ITEM_PRICE_FAME_TEXT
					famestr = string.format(ITEM_PRICE_FAME_STYLE, buyfameval, fameName)
				end
			end
		end

		return pricestr1, moneystr1, moneystr2, moneystr3, moneystr4, pricestr2, famestr, pricestr3,itemstr, itemicon, buy_type
	elseif context_type == ContextType.CONTEXT_DEFAULT or context_type == ContextType.CONTEXT_NPC_SELL or context_type == ContextType.CONTEXT_REWARD or context_type == ContextType.CONTEXT_PRODUCE or context_type == ContextType.CONTEXT_RECYCLE or context_type == ContextType.CONTEXT_TRADE or context_type == ContextType.CONTEXT_VENDUE or context_type == ContextType.CONTEXT_RECYCLE then --看卖店价的情况
		local _, dealtype = DescUtility:GetItemDBProp(tid, cid, --[[!]]"处理方式")
		if bit.band(dealtype,4)>0 then
			return  --[[!AUTO_262]]"", --[[!AUTO_263]]"", --[[!AUTO_264]]"", --[[!AUTO_265]]"", --[[!AUTO_266]]"", --[[!AUTO_267]]"", --[[!AUTO_268]]"", --[[!AUTO_269]]"", --[[!AUTO_270]]"", --[[!AUTO_271]]"",buy_type
		end
		local bCanBeSell = true
		if cid == ClassType.ICID_TASKITEM or cid == ClassType.ICID_TASKITEM_GENERATOR then	--临时判断
			bCanBeSell = false
		end
		if bCanBeSell then
			local _, sellitemid = DescUtility:GetItemDBProp(tid, cid, --[[!]]"卖店特殊物品ID")
			local _, sellitemnum = DescUtility:GetItemDBProp(tid, cid, --[[!]]"卖店特殊物品数量")
			if sellitemid > 0 then
				local itemname = DescUtility:GetItemName(sellitemid, ClassType.ICID_NORMAL_ITEM)
				local itemstr = string.format(ITEM_PRICE_ITEM_STYLE, sellitemnum, itemname)
				local itemicon = DescUtility:GetItemIcon(sellitemid, ClassType.ICID_NORMAL_ITEM)
				local pricestr3 = ITEM_PRICE_ITEM_SELL_TEXT
				return --[[!AUTO_208]]"", --[[!AUTO_209]]"", --[[!AUTO_210]]"", --[[!AUTO_211]]"", --[[!AUTO_212]]"", --[[!AUTO_213]]"", --[[!AUTO_214]]"", pricestr3, itemstr, itemicon,buy_type
			else
				local stringsell = --[[!]]"卖店价"
				local _, sellprice = DescUtility:GetItemDBProp(tid, cid, stringsell)
				local pricestr1 = --[[!AUTO_215]]""
				local moneystr1 = --[[!AUTO_216]]""
				local moneystr2 = --[[!AUTO_217]]""
				local moneystr3 = --[[!AUTO_218]]""
				local moneystr4 = --[[!AUTO_219]]""
				--[[if cid == ClassType.ICID_EQUIP then
					local _, equiptedur = DescUtility:GetItemDBProp(tid, cid, "耐久度")
					if equiptedur > 1 then
						sellprice = sellprice * ext_tbl["EquipEndurance"] / equiptedur / 100
					end
				end]]--如果装备卖店价受耐久影响，需要作计算
				pricestr1 = ITEM_PRICE_SELL_TEXT
				moneystr4, moneystr3, moneystr2, moneystr1 = DescUtility:GetPriceString(sellprice)
				return pricestr1, moneystr1, moneystr2, moneystr3, moneystr4, --[[!AUTO_220]]"", --[[!AUTO_221]]"", --[[!AUTO_222]]"", --[[!AUTO_223]]"", --[[!AUTO_224]]"",buy_type
			end
		else
			return ITEM_PRICE_CANT_SELL, --[[!AUTO_225]]"", --[[!AUTO_226]]"", --[[!AUTO_227]]"", --[[!AUTO_228]]"", --[[!AUTO_229]]"", --[[!AUTO_230]]"", --[[!AUTO_231]]"", --[[!AUTO_232]]"", --[[!AUTO_233]]"",buy_type
		end
	elseif context_type == ContextType.CONTEXT_REPAIR then --修理价格的情况

		local pricestr1 = --[[!AUTO_234]]""
		local moneystr1 = --[[!AUTO_235]]""
		local moneystr2 = --[[!AUTO_236]]""
		local moneystr3 = --[[!AUTO_237]]""
		local moneystr4 = --[[!AUTO_238]]""
		if cid == ClassType.ICID_EQUIP then
			local _, equiptedur = DescUtility:GetItemDBProp(tid, cid, --[[!]]"耐久度")
			if equiptedur > 0 then
				if equiptedur == math.ceil(ext_tbl["EquipEndurance"]/100) then
					pricestr1 = ITEM_PRICE_REPAIR_NONEED
				else
					pricestr1 = ITEM_PRICE_REPAIR_NEED
					moneystr4, moneystr3, moneystr2, moneystr1 = DescUtility:GetPriceString(ext_tbl["EquipRepairCost"])
				end
			else
				pricestr1 = ITEM_PRICE_REPAIR_NOEDUR
			end
		else
			pricestr1 = ITEM_PRICE_REPAIR_NOTEQUIP
		end
		return pricestr1, moneystr1, moneystr2, moneystr3, moneystr4, --[[!AUTO_239]]"", --[[!AUTO_240]]"", --[[!AUTO_241]]"", --[[!AUTO_242]]"", --[[!AUTO_243]]"",buy_type
	elseif context_type == ContextType.CONTEXT_BOOTH_BUY then --摆摊购买的单价

		local pricestr1 = ITEM_PRICE_MONEY_TEXT
		local moneystr1 = --[[!AUTO_244]]""
		local moneystr2 = --[[!AUTO_245]]""
		local moneystr3 = --[[!AUTO_246]]""
		local moneystr4 = --[[!AUTO_247]]""
		moneystr4, moneystr3, moneystr2, moneystr1 = DescUtility:GetPriceString(ext_tbl["UnitPrice"])
		return pricestr1, moneystr1, moneystr2, moneystr3, moneystr4, --[[!AUTO_248]]"", --[[!AUTO_249]]"", --[[!AUTO_250]]"", --[[!AUTO_251]]"", --[[!AUTO_252]]"",buy_type
	elseif context_type == ContextType.CONTEXT_BOOTH_SELL then --摆摊收购的单价

		local pricestr1 = ITEM_PRICE_COLLECT
		local moneystr1 = --[[!AUTO_253]]""
		local moneystr2 = --[[!AUTO_254]]""
		local moneystr3 = --[[!AUTO_255]]""
		local moneystr4 = --[[!AUTO_256]]""
		moneystr4, moneystr3, moneystr2, moneystr1 = DescUtility:GetPriceString(ext_tbl["UnitPrice"])
		return pricestr1, moneystr1, moneystr2, moneystr3, moneystr4, --[[!AUTO_257]]"", --[[!AUTO_258]]"", --[[!AUTO_259]]"", --[[!AUTO_260]]"", --[[!AUTO_261]]"",buy_type
	--elseif context_type == ContextType.CONTEXT_DEFAULT then
		--return "", "", "", "", "", "", "", "", "", ""
	else
		return --[[!AUTO_262]]"", --[[!AUTO_263]]"", --[[!AUTO_264]]"", --[[!AUTO_265]]"", --[[!AUTO_266]]"", --[[!AUTO_267]]"", --[[!AUTO_268]]"", --[[!AUTO_269]]"", --[[!AUTO_270]]"", --[[!AUTO_271]]"",buy_type
	end
end

-- 获取技能名称

function DescUtility:GetSkillName(idSkill)
	local t_skill = GameApi.GetSkillEssence(idSkill, 1)
	if t_skill then
		return t_skill["display_name"]
	else
		return --[[!AUTO_272]]""
	end
end

-- 获取礼物属性信息

-- 0.白字：10.02.08
-- 1.白字：2010年2月9日
-- 2.白字：2010年2月9日24时0分
function DescUtility:GetTimeString(iTime, iType)
	local tTime = os.date(--[[!AUTO_273]]"*t", iTime)
	--{year = 1998, month = 9, day = 16, yday = 259, wday = 4, hour = 23, min = 48, sec = 10, isdst = false}
	local sTime = --[[!AUTO_274]]""
	if tTime == 28800 then --未初始化的时间

		return --[[!AUTO_275]]""
	end
	if iType == 1 then
		return string.format(TIME_TEXT_STYLE[1], tTime["year"], tTime["month"], tTime["day"])
	elseif iType == 2 then
		return string.format(TIME_TEXT_STYLE[2], tTime["year"], tTime["month"], tTime["day"], tTime["hour"], tTime["min"])
	else
		return string.format(TIME_TEXT_STYLE_BASE, tTime["year"], tTime["month"], tTime["day"])
	end
end

-- 获取礼物属性信息

function DescUtility:GetGiftPropInfo(ext_tbl)
	local sGiftSender = ext_tbl["GiftFromName"]
	local sGiftReceiver = ext_tbl["GiftToName"]
	local iGiftSendData = ext_tbl["GiftData"]
	local sGiftMessage = ext_tbl["GiftContent"]
	local bGiftState, sGiftSendTime
	if sGiftSender == --[[!AUTO_276]]"" then
		bGiftState = false
		sGiftSendTime = --[[!AUTO_277]]""
	else
		bGiftState = true
		sGiftSendTime = DescUtility:GetTimeString(iGiftSendData, 1)
	end
	return bGiftState, sGiftSendTime, sGiftSender, sGiftReceiver, sGiftMessage
end

-- 获取礼物基本信息
function DescUtility:GetGiftBaseInfo(tid, cid)
	if cid == ClassType.ICID_GIFT then
		local _, giftinfo1 = DescUtility:GetItemDBProp(tid, cid, --[[!]]"赠送增加的好感度")
		local _, giftinfo2 = DescUtility:GetItemDBProp(tid, cid, --[[!]]"赠送增加的魅力值")
		local _, giftinfo3 = DescUtility:GetItemDBProp(tid, cid, --[[!]]"对获赠方使用的技能ID")
		local _, giftinfo4 = DescUtility:GetItemDBProp(tid, cid, --[[!]]"对获赠方使用的技能等级")
		local _, giftinfo5 = DescUtility:GetItemDBProp(tid, cid, --[[!]]"技能使用后物品是否消失")
		return giftinfo1, giftinfo2, giftinfo3, giftinfo4, giftinfo5
	else
		return --[[!AUTO_278]]"", --[[!AUTO_279]]"", --[[!AUTO_280]]"", --[[!AUTO_281]]"", --[[!AUTO_282]]""
	end
end

--获取伙伴技能书信息
function DescUtility:GetPetSkillBookInfo(tid, cid)
   local sID = --[[!AUTO_283]]""
   local sLv = --[[!AUTO_284]]""
   local sType = --[[!AUTO_285]]""
	if cid == ClassType.ICID_PET_SKILL then
		sID = --[[!]]"技能id"
		sLv = --[[!]]"技能等级"
		sType = --[[!]]"技能书类型"
	else
	    sID = --[[!AUTO_286]]""
	    sLv = --[[!AUTO_287]]""
		sType = --[[!AUTO_288]]""
	end
	if sLv == --[[!AUTO_289]]"" or sID == --[[!AUTO_290]]"" or sType == --[[!AUTO_291]]"" then
		return --[[!AUTO_292]]""
	else
		local _, skillid = DescUtility:GetItemDBProp(tid, cid, sID)
		local _, skilllv = DescUtility:GetItemDBProp(tid, cid, sLv)
		local _, booktype = DescUtility:GetItemDBProp(tid, cid, sType)
		return skillid,skilllv,booktype
	end
end

--获得伙伴级别限制
function DescUtility:GetPetLevelLimit(tid, cid)
	local sLv = --[[!AUTO_293]]""
	if cid == ClassType.ICID_PET_SKILL or cid == ClassType.ICID_PET_RESETPROP or cid == ClassType.ICID_PET_ADDPROP then
		sLv = --[[!]]"宠物级别要求"
	elseif cid == ClassType.ICID_PET_NORMALMEDICINE then
		sLv = --[[!]]"宠物的级别要求"
	else
	    sLv = --[[!AUTO_294]]""
	end
	if sLv == --[[!AUTO_295]]"" then
		return --[[!AUTO_296]]""
	else
		local _, levellimit = DescUtility:GetItemDBProp(tid, cid, sLv)
		return string.format(ITEM_LIMIT_DESC[7], levellimit)
	end
end

--获得伙伴性格限制
function DescUtility:GetPetCharLimit(tid, cid)
	local sChar = --[[!AUTO_297]]""
	if cid == ClassType.ICID_PET_SKILL then
		sChar = --[[!]]"适用宠物战斗类型"
	else
		sChar = --[[!AUTO_298]]""
	end
	if sChar == --[[!AUTO_299]]"" then
		return --[[!AUTO_300]]""
	else
		local _, charNum = DescUtility:GetItemDBProp(tid, cid, sChar)
		if charNum == 0 then
		    charLimit = --[[!AUTO_301]]"輔助"
		elseif charNum == 1 then
		    charLimit = --[[!AUTO_302]]"戰鬥"
		elseif charNum == 2 then
		    charLimit = --[[!AUTO_303]]"通用"
		else
		    charLimit = --[[!AUTO_304]]"其他"
		end
		return string.format(ITEM_LIMIT_DESC[8], charLimit)
	end
end

--获得伙伴洗点符模板数据

function DescUtility:GetPetResetPropData(tid, cid)
	local sPropType,iPropType,sPropNum,iPropNum,sProp
	if cid == ClassType.ICID_PET_RESETPROP then
	    sPropType = --[[!]]"宠物属性洗点类型"
		sPropNum = --[[!]]"属性洗点值（0表示全洗。其他写多少洗多少）"
	else
	    sPropType = --[[!AUTO_305]]""
	    sPropNum = --[[!AUTO_306]]""
	end
	if sPropType == --[[!AUTO_307]]"" or sPropNum == --[[!AUTO_308]]"" then
	    return --[[!AUTO_309]]""
	else
	    _, iPropType = DescUtility:GetItemDBProp(tid,cid,sPropType)
		_, iPropNum = DescUtility:GetItemDBProp(tid,cid,sPropNum)
		if iPropType == 0 then
		    sProp = --[[!AUTO_310]]"力道"
		elseif iPropType == 1 then
		    sProp = --[[!AUTO_311]]"體魄"
		elseif iPropType == 2 then
		    sProp = --[[!AUTO_312]]"筋骨"
		elseif iPropType == 3 then
		    sProp = --[[!AUTO_313]]"氣海"
		elseif iPropType == 4 then
			sProp = --[[!AUTO_314]]"內勁"
		else
		    sProp = --[[!AUTO_315]]"其他"
		end
	end
	return	sProp, iPropNum
end

--获得伙伴灵丹模板数据
function DescUtility:GetPetAddPropData(tid, cid)
	local sPropType,iPropType,sPropNum,iPropNum,sProp
	if cid == ClassType.ICID_PET_ADDPROP then
	    sPropType = --[[!]]"宠物属性加点类型"
		sPropNum = --[[!]]"属性加点值（写多少加多少点）"
	else
	    sPropType = --[[!AUTO_316]]""
	    sPropNum = --[[!AUTO_317]]""
	end
	if sPropType == --[[!AUTO_318]]"" or sPropNum == --[[!AUTO_319]]"" then
	    return --[[!AUTO_320]]""
	else
	    _, iPropType = DescUtility:GetItemDBProp(tid,cid,sPropType)
		_, iPropNum = DescUtility:GetItemDBProp(tid,cid,sPropNum)
		if iPropType == 0 then
		    sProp = --[[!AUTO_321]]"力量資質"
		elseif iPropType == 1 then
		    sProp = --[[!AUTO_322]]"體魄資質"
		elseif iPropType == 2 then
		    sProp = --[[!AUTO_323]]"筋骨資質"
		elseif iPropType == 3 then
		    sProp = --[[!AUTO_324]]"內勁資質"
		elseif iPropType == 4 then
			sProp = --[[!AUTO_325]]"氣海資質"
		else
		    sProp = --[[!AUTO_326]]"其他資質"
		end
	end
	return	sProp, iPropNum
end

--获得伙伴通用药品模板数据
function DescUtility:GetPetNormalMedicineData(tid,cid)
	local sPropType,iPropType,sPropNum,iPropNum,sProp
	if cid == ClassType.ICID_PET_NORMALMEDICINE then
	    sPropType = --[[!]]"药物类别"
		sPropNum = --[[!]]"回复值"
	else
	    sPropType = --[[!AUTO_327]]""
	    sPropNum = --[[!AUTO_328]]""
	end
	if sPropType == --[[!AUTO_329]]"" or sPropNum == --[[!AUTO_330]]"" then
	    return --[[!AUTO_331]]""
	else
	    _, iPropType = DescUtility:GetItemDBProp(tid,cid,sPropType)
		_, iPropNum = DescUtility:GetItemDBProp(tid,cid,sPropNum)
	end
	return	iPropType, iPropNum
end

--获得伙伴牌模板数据

function DescUtility:GetPetBedgeData(tid,cid)
	local sReputeType,sRepute,sReputeVal,iReputeType,iReputeVal
	if cid == ClassType.ICID_PET_BEDGE then
	    sReputeType = --[[!]]"需求玩家声望值编号"
	    sReputeVal = --[[!]]"需求玩家声望值"
	else
	    sReputeType = --[[!AUTO_332]]""
	    sReputeVal = --[[!AUTO_333]]""
	end

	if sReputeType == --[[!AUTO_334]]"" or sReputeVal == --[[!AUTO_335]]""then
	    return --[[!AUTO_336]]""
	else
	    _, iReputeType = DescUtility:GetItemDBProp(tid, cid ,sReputeType)
		_, iReputeVal = DescUtility:GetItemDBProp(tid, cid ,sReputeVal)
    	if iReputeType == 0 then
    		sRepute = --[[!AUTO_337]]"無"
    		return string.format(ITEM_LIMIT_DESC[9],--[[!AUTO_338]]"",sRepute,--[[!AUTO_339]]"")
    	else
    	    sRepute = FameNotice:GetName(iReputeType)
    	    return string.format(ITEM_LIMIT_DESC[9],iReputeVal,--[[!AUTO_340]]"點",sRepute)
    	end
	end

end

--获取宠物技能书类型
function DescUtility:GetPetSkillBookTypeDesc(tid,cid)
	local sChar = --[[!]]"技能书类型"
	local _, typedesc = DescUtility:GetItemDBProp(tid, cid ,sChar)

	if typedesc == 0 then
		return PET_SKILL_BOOK_TYPE_DESC[1]
	else
		return PET_SKILL_BOOK_TYPE_DESC[2]
	end
end

--获取动作物品描述文字
function DescUtility:GetActionItemBaseProp( tid, cid, ext_tbl )
	-- body
	local _, mActionType = DescUtility:GetItemDBProp( tid, cid, "物品動作類型" )
	local val1, val2, val3, val4, val5, val6
	if mActionType == 0 or mActionType == 1 then
		_, val1 = DescUtility:GetItemDBProp( tid, cid, "可配參數1" )
		_, val2 = DescUtility:GetItemDBProp( tid, cid, "可配參數2" )
		_, val3 = DescUtility:GetItemDBProp( tid, cid, "可配參數3" )
		_, val4 = DescUtility:GetItemDBProp( tid, cid, "可配參數4" )
		val5 = ext_tbl["ActionItemLeftCount"]
		_, val6 = DescUtility:GetItemDBProp( tid, cid, "可配參數5" )
		if mActionType == 0 then
			if val5 ~= nil then
				return string.format( ITEM_ACTION_TEXT[1], val1, val2, val3, val4, val5, val6 )
			else
				return string.format( ITEM_ACTION_TEXT[3], val1, val2, val3, val4, val6 )
			end
		else
			if val5 ~= nil then
				return string.format( ITEM_ACTION_TEXT[2], val1, val2, val3, val4, val5, val6 )
			else
				return string.format( ITEM_ACTION_TEXT[4], val1, val2, val3, val4, val6 )
			end
		end
	end

	return ""
end

--获取踢出尸体道具描述文字
function DescUtility:GetKickCorpseItemBaseProp(tid, cid, ext_tbl)
	local sChar = --[[!]]"作用半径（单位：米）"
	local _, typedesc = DescUtility:GetItemDBProp(tid, cid ,sChar)

	return string.format(ITEM_KICK_CORPSE_TEXT[1] ,typedesc)
end

--获取药品描述文字
function DescUtility:GetMedicineBaseProp(tid, cid, ext_tbl)
	local mType

	_, mType = DescUtility:GetItemDBProp(tid,cid,--[[!]]"药物类别")
	if mType == 8 then
		local mVal1, mVal2, mVal3, mVal4, mVal5, mVal6

		_, mVal1 = DescUtility:GetItemDBProp(tid,cid,--[[!]]"数值1")
		_, mVal2 = DescUtility:GetItemDBProp(tid,cid,--[[!]]"数值2")
		_, mVal3 = DescUtility:GetItemDBProp(tid,cid,--[[!]]"数值3")
		_, mVal4 = DescUtility:GetItemDBProp(tid,cid,--[[!]]"数值4")
		_, mVal5 = DescUtility:GetItemDBProp(tid,cid,--[[!]]"数值5")
		_, mVal6 = DescUtility:GetItemDBProp(tid,cid,--[[!]]"数值6")

		return string.format(ITEM_MEDICINE_TEXT[mType+1],mVal1,mVal2,mVal3,mVal4,mVal5,mVal6)
	elseif  mType == 18 then
		local mVal1
		_, mVal1 = DescUtility:GetItemDBProp(tid,cid,--[[!]]"数值2")
		local mVal0
		_, mVal0 = DescUtility:GetItemDBProp(tid,cid,--[[!]]"数值1")
		if mVal0 == 174 then
			return string.format(ITEM_MEDICINE_TEXT[mType+1], math.floor(mVal1/60))
		else
			return --[[!AUTO_341]]""
		end
	elseif  mType == 22 or mType == 23 or mType == 24 or  mType == 25 or mType == 28 or mType == 36 then
		return ""
	elseif mType == 32 then
		local mVal1
		_, mVal1 = DescUtility:GetItemDBProp(tid,cid,--[[!]]"数值1")
		return string.format(ITEM_MEDICINE_TEXT[mType+1], mVal1, DescUtility:GetMedicineEffectLevel(tid, ext_tbl["ServerZoneID"]))
	else
		local mVal1
		_, mVal1 = DescUtility:GetItemDBProp(tid,cid,--[[!]]"数值1")
		--LogPrint("mVal1:" .. mVal1)
		return string.format(ITEM_MEDICINE_TEXT[mType+1], mVal1)
	end
end

--获取彩票包裹限制信息
function DescUtility:GetLotteryInventory(tid, cid)
	local sItem, SMats, CARD
	sItem = --[[!]]"物品包裹至少几个空格才能开启"
	SMats = --[[!]]"材料包裹至少几个空格才能开启"
	CARD = "卡牌包裹至少几个空格才能开启"
	local bInventoryItem, iInventoryItem = DescUtility:GetItemDBProp(tid,cid,sItem)
	local bInventoryMats, iInventoryMats = DescUtility:GetItemDBProp(tid,cid,SMats)
	local bInventoryCARD, iInventoryCARD = DescUtility:GetItemDBProp(tid,cid,CARD)
	if iInventoryItem > 0 and iInventoryMats > 0 and iInventoryCARD > 0 then
		return string.format(ITEM_LOTTERY_IVTRLIMIT_ITEM, iInventoryItem) .. "，\r" .. string.format(ITEM_LOTTERY_IVTRLIMIT_MATS, iInventoryMats) .. "，\r" .. string.format(ITEM_LOTTERY_IVTRLIMIT_CARD, iInventoryCARD) .. "。"
	elseif iInventoryItem > 0 and iInventoryMats > 0 then
		return string.format(ITEM_LOTTERY_IVTRLIMIT_ITEM, iInventoryItem) .. "，\r" .. string.format(ITEM_LOTTERY_IVTRLIMIT_MATS, iInventoryMats) .. "。"
	elseif iInventoryMats > 0 and iInventoryCARD > 0 then
		return string.format(ITEM_LOTTERY_IVTRLIMIT_MATS, iInventoryMats) .. "，\r" .. string.format(ITEM_LOTTERY_IVTRLIMIT_CARD, iInventoryCARD) .. "。"
	elseif iInventoryItem > 0 and iInventoryCARD > 0 then
		return string.format(ITEM_LOTTERY_IVTRLIMIT_ITEM, iInventoryItem) .. "，\r" .. string.format(ITEM_LOTTERY_IVTRLIMIT_CARD, iInventoryCARD) .. "。"
	elseif iInventoryMats > 0 then
		return string.format(ITEM_LOTTERY_IVTRLIMIT_MATS, iInventoryMats) .. "。"
	elseif iInventoryItem > 0 then
		return string.format(ITEM_LOTTERY_IVTRLIMIT_ITEM, iInventoryItem) .. "。"
	elseif iInventoryCARD > 0 then
		return string.format(ITEM_LOTTERY_IVTRLIMIT_CARD, iInventoryCARD) .. "。"
	else
		return --[[!AUTO_346]]""
	end
end

--获得成长阶段对应时间
function DescUtility:GetGrowingTime(tid, cid)
	local sChar = --[[!AUTO_347]]""
	if cid == ClassType.ICID_CROPSEED then
		sChar = --[[!]]"成长阶段对应时间（分）"
	else
		sChar = --[[!AUTO_348]]""
	end
	if sChar == --[[!AUTO_349]]"" then
		return --[[!AUTO_350]]""
	else
		local _, charNum = DescUtility:GetItemDBProp(tid, cid, sChar)
		return charNum
	end
end

-- 获取物品剩余时间的描述文本，参数为 GMTTime (即结束时间已确定，为绝对时间)。寻宝网小工具将覆盖此函数
function DescUtility:GetItemExpireGMTTimeText(GMTTime, bFull)
	return self:GetItemExpireTimeText(GMTTime - GameApi.GetServerGMTTime(), bFull)
end

-- 获取物品剩余时间的描述文本

function DescUtility:GetItemExpireTimeText(iTime, bFull)
	local itemDesc = self:GetExpireTimeText(iTime, bFull)
	if itemDesc == "" then
		return itemDesc
	else
		return ITEM_TIME_DESC[1] .. itemDesc
	end
end

-- 获取剩余时间的描述文本，参数为 GMTTime (即结束时间已确定，为绝对时间)。寻宝网小工具将覆盖此函数
function DescUtility:GetExpireGMTTimeText(GMTTime, bFull)
	return self:GetExpireTimeText(GMTTime - GameApi.GetServerGMTTime(), bFull)
end

-- 剩余时间的描述文本
function DescUtility:GetExpireTimeText(iTime, bFull)

	--LogPrint("AAAAAAAAAAAA")

	local strExpireTime
	time = iTime

	if (time <= 0) then
		strExpireTime = --[[!AUTO_351]]"（限制時間已到）"
	else
		day = time / (24*3600)
		hour = (time % (24*3600)) / 3600
		minute = (time % 3600) / 60
		second = time % 60
		strExpireTime = ""
		if hour < 1 then
			strExpireTime = strExpireTime .. --[[!AUTO_352]]"^FF0000"
		end
		if bFull == true then
			if (day >= 1) then
				strExpireTime = strExpireTime .. string.format(ITEM_TIME_DESC[2], day)
				if hour > 0 then
					strExpireTime = strExpireTime .. string.format(ITEM_TIME_DESC[3], hour)
				end
				if minute > 0 then
					strExpireTime = strExpireTime .. string.format(ITEM_TIME_DESC[4], minute)
				end
				if second > 0 then
					strExpireTime = strExpireTime .. string.format(ITEM_TIME_DESC[5], second)
				end
			elseif (hour >= 1) then
				strExpireTime = strExpireTime .. string.format(ITEM_TIME_DESC[3], hour)
				if minute > 0 then
					strExpireTime = strExpireTime .. string.format(ITEM_TIME_DESC[4], minute)
				end
				if second > 0 then
					strExpireTime = strExpireTime .. string.format(ITEM_TIME_DESC[5], second)
				end
			elseif (minute >= 1) then
				strExpireTime = strExpireTime .. string.format(ITEM_TIME_DESC[4], minute)
				if second > 0 then
					strExpireTime = strExpireTime .. string.format(ITEM_TIME_DESC[5], second)
				end
			else
				strExpireTime = strExpireTime .. string.format(ITEM_TIME_DESC[5], second)
			end
		else
			if (day >= 1) then
				strExpireTime = strExpireTime .. string.format(ITEM_TIME_DESC[6], day)
			elseif (hour >= 1) then
				strExpireTime = strExpireTime .. string.format(ITEM_TIME_DESC[7])
			elseif (minute >= 1) then
				strExpireTime = strExpireTime .. string.format(ITEM_TIME_DESC[8], minute)
			else
				strExpireTime = strExpireTime .. string.format(ITEM_TIME_DESC[9])
			end
		end
		if hour < 1 then
			strExpireTime = --[[!AUTO_353]]"^FF0000" .. strExpireTime
		end
	end
	--LogPrint(strExpireTime)
	return strExpireTime

end

-- 获取生产技能类型限制文本

function GetProduceSkillNameText(valTab)
    strPskillname = --[[!AUTO_354]]""
	if valTab.req_prod_skill_color == 1 then
        clrPskillname = 10
    else
        clrPskillname = 6
    end
	strPskillname = strPskillname .. string.format(ITEM_COLOR_DESC[2])
	strPskillname = strPskillname .. string.format(req_prod_skill_color[2] , ITEM_COLOR_DESC[clrPskillname] , valTab.req_prod_skill)
	strPskillname = strPskillname .. string.format(--[[!AUTO_355]]"\\r")
	return strPskillname
end


--获得普通种植成长阶段对应时间

function DescUtility:GetGrowingTime(tid, cid)
	local sChar = --[[!AUTO_356]]""
	if cid == ClassType.ICID_CROPSEED then
		sChar = --[[!]]"成长阶段对应时间（分）"
	else
		sChar = --[[!AUTO_357]]""
	end
	if sChar == --[[!AUTO_358]]"" then
		return --[[!AUTO_359]]""
	else
		local _, charNum = DescUtility:GetItemDBProp(tid, cid, sChar)
		return charNum
	end
end

--获得精耕种植成长阶段对应时间

function DescUtility:GetFineGrowingTime(tid, cid)
	local sChar = --[[!AUTO_360]]""
	if cid == ClassType.ICID_CROPSEED then
		sChar = --[[!]]"精耕成长阶段对应时间（分）"
	else
		sChar = --[[!AUTO_361]]""
	end
	if sChar == --[[!AUTO_362]]"" then
		return --[[!AUTO_363]]""
	else
		local _, charNum = DescUtility:GetItemDBProp(tid, cid, sChar)
		return charNum
	end
end

--获得二级模板ID物品的名称

function DescUtility:GetSubItemName(tid)
	local sName, iQuality,iCid = GameApi.GetItemInfo(tid)
	if sName and iQuality and iCid then
		local sColor = ITEM_COLOR_DESC[iQuality+1] or ITEM_COLOR_DESC[1]
		return string.format(--[[!AUTO_364]]"%s%s", sColor,  sName)
	end
end


--获得种子主要产物
function DescUtility:GetGrowItem(tid, cid)
	local sChar = --[[!AUTO_365]]""
	if cid == ClassType.ICID_CROPSEED then
		sChar = --[[!]]"产物1物品ID"
	else
		sChar = --[[!AUTO_366]]""
	end
	if sChar == --[[!AUTO_367]]"" then
		return --[[!AUTO_368]]""
	else
		local _, GrowItemID = DescUtility:GetItemDBProp(tid, cid, sChar)
		GrowItem = DescUtility:GetSubItemName(GrowItemID)
	end
		return GrowItem

end

--获得种子主要产物种植默认数量
function DescUtility:GetGrowItemNum(tid, cid)
	local sChar = --[[!AUTO_369]]""
	if cid == ClassType.ICID_CROPSEED then
		sChar = --[[!]]"产物1默认数量"
	else
		sChar = --[[!AUTO_370]]""
	end
	if sChar == --[[!AUTO_371]]"" then
		return --[[!AUTO_372]]""
	else
		local _, GrowItemNum = DescUtility:GetItemDBProp(tid, cid, sChar)
		return GrowItemNum
	end

end

--获得种子主要产物精耕默认数量

function DescUtility:GetGrowFineItemNum(tid, cid)
	local sChar = --[[!AUTO_373]]""
	if cid == ClassType.ICID_CROPSEED then
		sChar = --[[!]]"精耕产物1默认数量"
	else
		sChar = --[[!AUTO_374]]""
	end
	if sChar == --[[!AUTO_375]]"" then
		return --[[!AUTO_376]]""
	else
		local _, GrowItemNum = DescUtility:GetItemDBProp(tid, cid, sChar)
		return GrowItemNum
	end

end

--获得生产技能名称

function DescUtility:GetProduceSkillName(tid)
	if tid == 6987 then
		SkillName = --[[!AUTO_377]]"種植"
	elseif tid == 6988 then
		SkillName = --[[!AUTO_378]]"採礦"
	elseif tid == 6989 then
		SkillName = --[[!AUTO_379]]"養殖"
	elseif tid == 6990 then
		SkillName = --[[!AUTO_380]]"鍛造"
	elseif tid == 6991 then
		SkillName = --[[!AUTO_381]]"縫紉"
	elseif tid == 6992 then
		SkillName = --[[!AUTO_382]]"巧匠"
	elseif tid == 6993 then
		SkillName = --[[!AUTO_383]]"製藥"
	elseif tid == 6994 then
		SkillName = --[[!AUTO_384]]"烹飪"
	elseif tid == 6995 then
		SkillName = --[[!AUTO_385]]"伐木"
	elseif tid == 14323 then
		SkillName = --[[!AUTO_386]]"釣魚"
	elseif tid == 85337 then
		SkillName ="暗器"
	else
		SkillName = string.format(--[[!AUTO_387]]"%s",tid)
	end
	return SkillName
end

--获取种子需求技能信息

function DescUtility:GetSeedSkillInfo(tid, cid)
	local sID = --[[!AUTO_388]]""
	local sLv = --[[!AUTO_389]]""

	if cid == ClassType.ICID_CROPSEED then
		sID = --[[!]]"需要生产技能"
		sLv = --[[!]]"需要技能等级"
	end

	if sID ~= --[[!AUTO_390]]"" and sLv ~= --[[!AUTO_391]]"" then
		local _, skillid = DescUtility:GetItemDBProp(tid, cid, sID)
		local _, skilllv = DescUtility:GetItemDBProp(tid, cid, sLv)

		SkillName = DescUtility:GetProduceSkillName(skillid)
		local SelfSkill = GameApi.GetProduceSkillTable ()
		local SelfSkillLv = --[[!AUTO_392]]""
		local Skill

		SelfSkillLv = SelfSkill[skillid]
		if SelfSkillLv == nil or skilllv > SelfSkillLv then
			Skill = string.format(--[[!AUTO_393]]"%s生計：%s%s級", ITEM_COLOR_LIMITED, SkillName, skilllv)
		else
			Skill = string.format(--[[!AUTO_394]]"生計：%s%s級", SkillName, skilllv)
		end
		return Skill
	end

	return
end

--获取配方卷轴对应配方的生产技能

function DescUtility:GetRecipeRollSkill(tid, cid)
	local sChar = --[[!AUTO_395]]""
	if cid == ClassType.ICID_RECIPEROLL then
		sChar = --[[!]]"对应的配方"
	else
		sChar = --[[!AUTO_396]]""
	end
	if sChar == --[[!AUTO_397]]"" then
		return --[[!AUTO_398]]""
	else
		local _, RecipeID = DescUtility:GetItemDBProp(tid, cid, sChar)
		RecipeRollSkill = DescUtility:GetRecipeSkillInfo(RecipeID, ClassType.ICID_RECIPE)
		--return RecipeID
		return RecipeRollSkill,RecipeID
	end

end

--获取配方对应的生产技能

function DescUtility:GetRecipeSkillInfo(tid, cid)
   local sID = --[[!AUTO_399]]""
   local sLv = --[[!AUTO_400]]""
	if cid == ClassType.ICID_RECIPE then
		sID = --[[!]]"配方属于生产技能"
		sLv = --[[!]]"配方的段位值"
	else
	    sID = --[[!AUTO_401]]""
	    sLv = --[[!AUTO_402]]""
	end
	if sLv == --[[!AUTO_403]]"" or sID == --[[!AUTO_404]]"" then
		return --[[!AUTO_405]]""
	else
		local _, skillid = DescUtility:GetItemDBProp(tid, cid, sID)
		local _, skilllv = DescUtility:GetItemDBProp(tid, cid, sLv)
		SkillName = DescUtility:GetProduceSkillName(skillid)
		local SelfSkill = GameApi.GetProduceSkillTable ()
		local SelfSkillLv = --[[!AUTO_406]]""
		local Skill
		SelfSkillLv = SelfSkill[skillid]
		if SelfSkillLv == nil or skilllv > SelfSkillLv then
			Skill = string.format(--[[!AUTO_407]]"%s需要：%s%s級", ITEM_COLOR_LIMITED, SkillName, skilllv)
		else
			Skill = string.format(--[[!AUTO_408]]"需要：%s%s級", SkillName, skilllv)
		end

		return Skill
	end
end

--获取幼崽需求技能信息

function DescUtility:GetBreedSkillInfo(tid, cid)
   local sID ,sLv
	sID = --[[!]]"未定义"
	sLv = -1
	if cid == ClassType.ICID_BREEDCUB then
		sID = --[[!]]"需要生产技能"
		sLv = --[[!]]"需要技能等级"
	else
	    sID = --[[!]]"未定义"
	    sLv = -1
	end
	if sLv == -1 or sID == --[[!AUTO_409]]"未定義" then
		return --[[!AUTO_410]]""
	else
		local _, skillid = DescUtility:GetItemDBProp(tid, cid, sID)
		local _, skilllv = DescUtility:GetItemDBProp(tid, cid, sLv)
		SkillName = DescUtility:GetProduceSkillName(skillid)
		local  SelfSkill = GameApi. GetProduceSkillTable ()
		local	SelfSkillLv = --[[!AUTO_411]]""
		SelfSkillLv = SelfSkill[skillid]
		if SelfSkillLv == nil or skilllv > SelfSkillLv then
			Skill = string.format(--[[!AUTO_412]]"%s生計：%s%s級", ITEM_COLOR_LIMITED, SkillName, skilllv)
		else
			Skill = string.format(--[[!AUTO_413]]"生計：%s%s級", SkillName, skilllv)
		end
		return Skill
	end
end

--获取幼崽出产信息
function DescUtility:GetBreedItem(tid,cid)
	local sChar1,sChar2,sChar3,sChar4,BreedItemName1,BreedItemName2,BreedItemName3,BreedItemName4
	sChar1 = --[[!AUTO_414]]""
	sChar2 = --[[!AUTO_415]]""
	sChar3 = --[[!AUTO_416]]""
	sChar4 = --[[!AUTO_417]]""
	BreedItemName1 = --[[!AUTO_418]]""
	BreedItemName2 = --[[!AUTO_419]]""
	BreedItemName3 = --[[!AUTO_420]]""
	BreedItemName4 = --[[!AUTO_421]]""
	if cid == ClassType.ICID_BREEDCUB then
		sChar1 = --[[!]]"阶段1产物1物品ID"
		sChar2 = --[[!]]"阶段2产物1物品ID"
		sChar3 = --[[!]]"阶段3产物1物品ID"
		sChar4 = --[[!]]"阶段4产物1物品ID"
	else
		sChar1 = --[[!AUTO_422]]""
		sChar2 = --[[!AUTO_423]]""
		sChar3 = --[[!AUTO_424]]""
		sChar4 = --[[!AUTO_425]]""
	end
	if sChar1 == --[[!AUTO_426]]"" then
		return --[[!AUTO_427]]""
	else
		local _, BreedItem1 = DescUtility:GetItemDBProp(tid, cid, sChar1)
        BreedItemName1 = DescUtility:GetSubItemName(BreedItem1)
		local _, BreedItem2 = DescUtility:GetItemDBProp(tid, cid, sChar2)
		if BreedItem2 ~= 0 then
		   BreedItemName2 = --[[!AUTO_428]]"、"..DescUtility:GetItemName(BreedItem2,ClassType.ICID_MATERIAL)
		end
		local _, BreedItem3 = DescUtility:GetItemDBProp(tid, cid, sChar3)
        if BreedItem3 ~= 0 then
		   BreedItemName3 = --[[!AUTO_429]]"、"..DescUtility:GetItemName(BreedItem3,ClassType.ICID_MATERIAL)
		end
		local _, BreedItem4 = DescUtility:GetItemDBProp(tid, cid, sChar4)
		if BreedItem4 ~= 0 then
		   BreedItemName4 = --[[!AUTO_430]]"、"..DescUtility:GetItemName(BreedItem4,ClassType.ICID_MATERIAL)
		end
	end
	return BreedItemName1..BreedItemName2..BreedItemName3..BreedItemName4
end

--获取幼崽养殖时间

function DescUtility:GetBreedTime(tid, cid)
	local sChar1,sChar2,sChar3,sChar4
	sChar1 = --[[!AUTO_431]]""
	sChar2 = --[[!AUTO_432]]""
	sChar3 = --[[!AUTO_433]]""
	sChar4 = --[[!AUTO_434]]""
	if cid == ClassType.ICID_BREEDCUB then
		sChar1 = --[[!]]"阶段1生长值上限"
		sChar2 = --[[!]]"阶段2生长值上限"
		sChar3 = --[[!]]"阶段3生长值上限"
		sChar4 = --[[!]]"阶段4生长值上限"
	else
		sChar1 = --[[!AUTO_435]]""
		sChar2 = --[[!AUTO_436]]""
		sChar3 = --[[!AUTO_437]]""
		sChar4 = --[[!AUTO_438]]""
	end
	if sChar1 == --[[!AUTO_439]]"" then
		return --[[!AUTO_440]]""
	else
		--[[local _, BreedTime4 = DescUtility:GetItemDBProp(tid, cid, sChar4)
		if BreedTime4 ~= 0 then
		   return BreedTime4
		end
		local _, BreedTime3 = DescUtility:GetItemDBProp(tid, cid, sChar3)
		if BreedTime3 ~= 0 then
		   return BerrdTime3
		end
		local _, BreedTime2 = DescUtility:GetItemDBProp(tid, cid, sChar2)
		if BreedTime2 ~= 0 then
           return BreedTime2
		end--]]
		local _, BreedTime1 = DescUtility:GetItemDBProp(tid, cid, sChar1)
		if BreedTime1 ~= --[[!AUTO_441]]"" then
		   return BreedTime1
		end
	end
    return --[[!AUTO_442]]"未知"
end

--获取幼崽饲料信息

function DescUtility:GetBreedWith(tid, cid)
	local sChar = --[[!AUTO_443]]""
	if cid == ClassType.ICID_BREEDCUB then
		sChar = --[[!]]"消耗饲料物品id"
	else
		sChar = --[[!AUTO_444]]""
	end
	if sChar == --[[!AUTO_445]]"" then
		return --[[!AUTO_446]]""
	else
		local _, BreedWithID = DescUtility:GetItemDBProp(tid, cid, sChar)
		if BreedWithID > 0 then
			BreedWith = DescUtility:GetSubItemName(BreedWithID)
		else
			BreedWith = --[[!AUTO_447]]"無"
		end
	end
	return BreedWith
end

--tidMine: 	矿物模板id
--type:		矿物模板的光标类型

--MineName: 矿物模板名称
function DescUtility:GetGatherProgressShowName(tidMine, type, MineName)
	--todo: 根据tidMine配置
	--MINE_PROGRESS_PREFIX[type] = {"调查","调查","采集","割取","砍伐","采集","开启","钓鱼中……","放火中……","种植中……","插旗中……","调查中……","调查中……","阅读中……","书写中……","使用中……"}
	MINE_PROGRESS_PREFIX[1] = --[[!AUTO_448]]"調查"
	MINE_PROGRESS_PREFIX[2] = --[[!AUTO_449]]"調查"
	MINE_PROGRESS_PREFIX[3] = --[[!AUTO_450]]"採集"
	MINE_PROGRESS_PREFIX[4] = --[[!AUTO_451]]"割取"
	MINE_PROGRESS_PREFIX[5] = --[[!AUTO_452]]"砍伐"
	MINE_PROGRESS_PREFIX[6] = --[[!AUTO_453]]"採集"
	MINE_PROGRESS_PREFIX[7] = --[[!AUTO_454]]"開啟"
	MINE_PROGRESS_PREFIX[8] = --[[!AUTO_455]]"釣魚中……"
	MINE_PROGRESS_PREFIX[9] = --[[!AUTO_456]]"放火中……"
	MINE_PROGRESS_PREFIX[10] = --[[!AUTO_457]]"種植中……"
	MINE_PROGRESS_PREFIX[11] = --[[!AUTO_458]]"插旗中……"
	MINE_PROGRESS_PREFIX[12] = --[[!AUTO_459]]"調查中……"
	MINE_PROGRESS_PREFIX[13] = --[[!AUTO_460]]"調查中……"
	MINE_PROGRESS_PREFIX[14] = --[[!AUTO_461]]"閱讀中……"
	MINE_PROGRESS_PREFIX[15] = --[[!AUTO_462]]"書寫中……"
	MINE_PROGRESS_PREFIX[16] = --[[!AUTO_463]]"使用中……"

	local tabType = MINE_PROGRESS_PREFIX[type]

	if MINE_SPECIAL_TEXT[tidMine] then
		return MINE_SPECIAL_TEXT[tidMine]
	end

	if tabType then
		if type >= 1 and type <= 7 then
			return MINE_PROGRESS_PREFIX[type] .. MineName
		else
			return MINE_PROGRESS_PREFIX[type]
		end
	end
end

--返回技能物品类别


function DescUtility:GetSkillItemType(tid, cid)
	local bOK, sMain, sSub = GameApi.GetItemDBPath(tid, cid)

	return sSub
end

--返回烹饪物品恢复效果
function DescUtility:GetFoodDesc(tid,cid)
	local sSkillID = --[[!AUTO_464]]""
	local sSkillLevel = --[[!AUTO_465]]""
	local food_desc = --[[!AUTO_466]]""

	if cid == ClassType.ICID_SKILLMATTER then
		sSkillID = --[[!]]"技能ID"
		sSkillLevel = --[[!]]"技能等级"
	end

	if sSkillID == --[[!AUTO_467]]"" or sSkillLevel == --[[!AUTO_468]]"" then
		return --[[!AUTO_469]]""
	else
		local _, skill_id = DescUtility:GetItemDBProp(tid, cid, sSkillID)
		local _, skill_level = DescUtility:GetItemDBProp(tid, cid, sSkillLevel)
		local skill_essence = GameApi.GetSkillEssence(skill_id,skill_level)

		if skill_essence["process_id"][0] ~= 0 and skill_essence["process_id"][1] ~= 0 then
			local skill_process1 = GameApi.GetSkillProcess(skill_id,0,skill_level)
			local skill_process2 = GameApi.GetSkillProcess(skill_id,1,skill_level)
			local state1_id = skill_process1["states"][5]["state_id"]
			local state2_id = skill_process2["states"][2]["state_id"]

			if state1_id == 266 or state1_id == 268 then
				local state1_var = skill_process1["states"][5]["state_param"][1]
				local state2_var1 = skill_process2["states"][2]["state_param"][1]
				local state2_var2 = skill_process2["states"][2]["state_param"][2]

				if  state1_id == 266 then
					food_desc = string.format(FOOD_RESTORE_DESC[1],state1_var, state2_var1, state2_var2)
				elseif state1_id == 268 then
					food_desc = string.format(FOOD_RESTORE_DESC[2],state1_var, state2_var1, state2_var2)
				end
			elseif state1_id == 270 then
				local state1_var = {}
				local state2_var = {}

				for count = 1 ,2 do
					state1_var[count] = skill_process1["states"][5]["state_param"][count]
				end
				for count = 1, 4 do
					state2_var[count] = skill_process2["states"][2]["state_param"][count]
				end
				food_desc = string.format(FOOD_RESTORE_DESC[3],state1_var[1],state1_var[2],state2_var[1],state2_var[2],state2_var[3],state2_var[4])
			end
		end
		return food_desc
	end
	return --[[!AUTO_470]]""
end

--返回丹丸恢复效果
function DescUtility:GethealerDesc(tid,cid)
	local skill_id = --[[!AUTO_471]]""
	local skill_level = --[[!AUTO_472]]""
	local descstring = --[[!AUTO_473]]""
	_, skill_id = DescUtility:GetItemDBProp(tid, cid, --[[!]]"技能ID")
	_, skill_level = DescUtility:GetItemDBProp(tid, cid, --[[!]]"技能等级")
	if skill_id ~= --[[!AUTO_474]]"" and skill_level ~= --[[!AUTO_475]]"" then
		if HEALER_TEMPLIST_SIMPLE_DESC[skill_id] then
			descstring = HEALER_TEMPLIST_SIMPLE_DESC[skill_id]
		else
			if HEALER_TEMPLIST_DESC[skill_id] and HEALER_TEMPLIST_DESC[skill_id][skill_level] then
				local list = HEALER_TEMPLIST_DESC[skill_id][skill_level]
				descstring = string.format(HEALER_RESTORE_DESC[1], list[1], list[2])
			else
				descstring = ""
			end
		end
	end
	return descstring
end

-- 获取资质名称
function DescUtility:GetAplititudeName(tid)
	local _, sTitle = DescUtility:GetItemDBProp(tid, ClassType.ICID_APLITITUDE, --[[!AUTO_476]]"t_name")
	local _, iQuality = DescUtility:GetItemDBProp(tid, ClassType.ICID_APLITITUDE,--[[!]] --[[!AUTO_477]]"品質")
	local sColor = ITEM_COLOR_DESC[iQuality+1] or ITEM_COLOR_DESC[1]
	if  iQuality == --[[!AUTO_478]]"" then
		return sTitle
	else
		return string.format(--[[!AUTO_479]]"%s%s", sColor, sTitle)
	end
end

-- 获取资质等级
function DescUtility:GetAplititudeLevel(tid, level)
	local _, iType = DescUtility:GetItemDBProp(tid, ClassType.ICID_APLITITUDE, --[[!]]"资质生效类型")
	if iType == 0 then
		if level == 0 then
			return TEXT_APPLITITUE_0
		else
			return string.format(TEXT_APPLITITUE_LEVEL, level)
		end
	elseif iType == 1 then
		if level == 0 then
			return TEXT_APPLITITUE_0
		else
			return TEXT_APPLITITUE_1
		end
	elseif iType == 2 then
		return  string.format(TEXT_APPLITITUE_LEVEL, level)
	else
		return --[[!AUTO_480]]""
	end
end

-- 获取资质图标
function DescUtility:GetAplititudeIcon(tid)
	local bIcon, sIcon = DescUtility:GetItemDBProp(tid, ClassType.ICID_APLITITUDE, --[[!]]"图标路径")
	return bIcon and sIcon or --[[!AUTO_481]]"00752未知物品.dds"
end

-- 获取资质类别
function DescUtility:GetAplititudeType(tid)
	local _, iType = DescUtility:GetItemDBProp(tid, ClassType.ICID_APLITITUDE, --[[!]]"资质生效类型")
	if TEXT_APPLITITUE_TYPE[iType+1] then
		return TEXT_APPLITITUE_TYPE[iType+1]
	else
		return TEXT_APPLITITUE_TYPE_DEFAULT
	end
end

-- 获取资质效果
function DescUtility:GetAplititudeEffect(tid, level)
	local _, iType = DescUtility:GetItemDBProp(tid, ClassType.ICID_APLITITUDE, --[[!]]"资质生效类型")
	if iType == 0 then
		local _, iKey1 = DescUtility:GetItemDBProp(tid, ClassType.ICID_APLITITUDE, --[[!]]"资质前提二级属性A编号")
		local _, iKey2 = DescUtility:GetItemDBProp(tid, ClassType.ICID_APLITITUDE, --[[!]]"资质前提二级属性B编号")
		local _, maxLevel = DescUtility:GetItemDBProp(tid, ClassType.ICID_APLITITUDE, --[[!]]"资质可激活等级上限")
		local effectstring = --[[!AUTO_482]]""
		local activestring = --[[!AUTO_483]]""
		if level >= maxLevel then
			local _, effectid = DescUtility:GetItemDBProp(tid, ClassType.ICID_APLITITUDE, --[[!]]"资质第" .. maxLevel .. --[[!]]"级对应附加属性包")
			effectstring = DescUtility:GetEffectBaseDesc(effectid, 1)
			if level == maxLevel then
				activestring = string.format(TEXT_APPLITITUTE_LEVEL_FULL, TAG_COLOR_ESSENCE[8])
			else
				activestring = string.format(TEXT_APPLITITUTE_LEVEL_BREAKLIMIT, TAG_COLOR_ESSENCE[8])
			end
		else
			local _, iVal1 = DescUtility:GetItemDBProp(tid, ClassType.ICID_APLITITUDE, --[[!]]"资质第" .. level + 1 .. --[[!]]"级对应二级属性A要求")
			local _, iVal2 = DescUtility:GetItemDBProp(tid, ClassType.ICID_APLITITUDE, --[[!]]"资质第" .. level + 1 .. --[[!]]"级对应二级属性A要求")
			if level == 0 then
				local _, effectid = DescUtility:GetItemDBProp(tid, ClassType.ICID_APLITITUDE, --[[!]]"资质第1级对应附加属性包")
				effectstring = DescUtility:GetEffectBaseDesc(effectid, 1)
				if iKey2 == 0 then
					activestring = string.format(TEXT_APPLITITUTE_LEVEL_TOACTIVE, TAG_COLOR_ESSENCE[9], TEXT_APPLITITUTE_ATTRIBUTE[iKey1] or TEXT_APPLITITUTE_ATTRIBUTE_DEFAULT, iVal1)
				else
					activestring = string.format(TEXT_APPLITITUTE_LEVEL_TOACTIVE_DOUBLE, TAG_COLOR_ESSENCE[9], TEXT_APPLITITUTE_ATTRIBUTE[iKey1] or TEXT_APPLITITUTE_ATTRIBUTE_DEFAULT, iVal1, TEXT_APPLITITUTE_ATTRIBUTE[iKey2] or TEXT_APPLITITUTE_ATTRIBUTE_DEFAULT, iVal2)
				end
			else
				local _, effectid = DescUtility:GetItemDBProp(tid, ClassType.ICID_APLITITUDE, --[[!]]"资质第" .. level .. --[[!]]"级对应附加属性包")
				effectstring = DescUtility:GetEffectBaseDesc(effectid, 1)
				if iKey2 == 0 then
					activestring = string.format(TEXT_APPLITITUTE_LEVEL_TOLEVELUP, TAG_COLOR_ESSENCE[9], level+1, TEXT_APPLITITUTE_ATTRIBUTE[iKey1] or TEXT_APPLITITUTE_ATTRIBUTE_DEFAULT, iVal1)
				else
					activestring = string.format(TEXT_APPLITITUTE_LEVEL_TOLEVELUP_DOUBLE, TAG_COLOR_ESSENCE[9], level+1, TEXT_APPLITITUTE_ATTRIBUTE[iKey1] or TEXT_APPLITITUTE_ATTRIBUTE_DEFAULT, iVal1, TEXT_APPLITITUTE_ATTRIBUTE[iKey2] or TEXT_APPLITITUTE_ATTRIBUTE_DEFAULT, iVal2)
				end
			end
		end
		return string.format(TEXT_APPLITITUE_EFFECT[1], TAG_COLOR_ESSENCE[7], effectstring, activestring)
	elseif iType == 1 then
		local _, iKey = DescUtility:GetItemDBProp(tid, ClassType.ICID_APLITITUDE, --[[!]]"资质前提二级属性A编号")
		local _, iVal = DescUtility:GetItemDBProp(tid, ClassType.ICID_APLITITUDE, --[[!]]"资质第1级对应二级属性A要求")
		local activestring = --[[!AUTO_484]]""
		if level == 1 then
			activestring = string.format(TEXT_APPLITITUTE_LEVEL_ACTIVED, TAG_COLOR_ESSENCE[8])
		else
			activestring = string.format(TEXT_APPLITITUTE_LEVEL_TOACTIVE, TAG_COLOR_ESSENCE[9], TEXT_APPLITITUTE_ATTRIBUTE[iKey] or TEXT_APPLITITUTE_ATTRIBUTE_DEFAULT, iVal)
		end
		return string.format(TEXT_APPLITITUE_EFFECT[2], TAG_COLOR_ESSENCE[7], TEXT_APPLITITUTE_MASTERMIZE[tid] or TEXT_APPLITITUTE_MASTERMIZE_DEFAULT, activestring)
	elseif iType == 2 then
		return string.format(TEXT_APPLITITUE_EFFECT[3], TAG_COLOR_ESSENCE[7], --[[!]]"门派特性尚未开放", --[[!AUTO_485]]"[尚未製作]")
	else
		return TEXT_APPLITITUE_EFFECT_DEFAULT
	end
end

-- 获取状态包效果默认描述
-- extraAttributePercentage 额外增加的百分比 (来自传奇套装等)
function DescUtility:GetEffectBaseDesc(tid, mType, extraAttributePercentage)
	local EffectGroupStr = --[[!AUTO_486]]""

	for k, v in pairs(EffectList) do
		local extStr = --[[!AUTO_487]]""
		local bOK1, extid = GameApi.GetItemDBProp(tid, ClassType.ICID_ADDON_GROUP, v)
		if bOK1 and extid > 0 then
			local bOK2, exttype, extparam1, extparam2, extparam3 = GameApi.GetItemDBProp(extid, ClassType.ICID_EQUIPMENT_ADDON, --[[!AUTO_488]]"type", --[[!AUTO_489]]"param1", --[[!AUTO_490]]"param2", --[[!AUTO_491]]"param3")
			if extraAttributePercentage ~= nil then
				extraAttributePercentage = extraAttributePercentage + 0.0001
				extparam1 = math.floor(extparam1 * (100 + extraAttributePercentage) / 100)
			end
			if bOK2 then
				extStr = self:GetExtStr(exttype, extparam1, extparam2, extparam3)
			end
		end
		local extraAttributeStr = ""
		if extraAttributePercentage ~= nil then
			extraAttributeStr = (" (+%d％)"):format(extraAttributePercentage)
		end
		if extStr ~= --[[!AUTO_498]]"" then
			if EffectGroupStr == --[[!AUTO_499]]"" then
				EffectGroupStr = extStr .. extraAttributeStr
			else
				EffectGroupStr = EffectGroupStr .. (TEXT_EFFECTGROUP_MULTILINE_TYPE[mType] or TEXT_EFFECTGROUP_MULTILINE_TYPE_DEFAULT) .. extStr .. extraAttributeStr
			end
		end
	end

	return EffectGroupStr
end

--[[
	取得一条附加属性的描述文字
	exttype: 附加属性模板中的 type
	extvalue: 附加属性的值
		如果得到了随机值 extrand，应使用 DescUtility:GetEquipRandValue(extrand, extparam1, extparam2)
		如果未得到随机值，应使用 extparam1
	extparam2, extparam3: 附加属性模板中的 param2, param3
]]
function DescUtility:GetExtStr(exttype, extvalue, extparam2, extparam3)
	if EQUIP_ESSENCE_TYPE[exttype] ~= nil then
		if EQUIP_ESSENCE_TYPE[exttype].class == 1 then
			return string.format(EQUIP_ESSENCE_TYPE[exttype].style, extvalue)
		elseif EQUIP_ESSENCE_TYPE[exttype].class == 2 then
			local packstring = --[[!AUTO_515]]""
			if EQUIP_PACKAGE_TYPE[extparam3] then
				return string.format(EQUIP_ESSENCE_TYPE[exttype].style, EQUIP_PACKAGE_TYPE[extparam3], extvalue)
			else
				return EQUIP_PACKAGE_TYPE_DEFAULT
			end
		elseif EQUIP_ESSENCE_TYPE[exttype].class == 3 then
			if extparam3 == 2199 then
				return string.format(--[[!AUTO_516]]"打坐中生命回復加速%d％",extvalue*10)
			elseif extparam3 == 2200 then
				return string.format(--[[!AUTO_517]]"打坐中內力回復加速%d％",extvalue*10)
			elseif extparam3 == 8469 then
				return --[[!AUTO_518]]"^FF0000突進的體力消耗降低10%。(本屬性暫未開放)"
			elseif extparam3 == 8470 then
				return --[[!AUTO_519]]"^FF0000突進的移動距離增加20%。(本屬性暫未開放)"
			elseif extparam3 == 8471 then
				return --[[!AUTO_520]]"^FF0000跳躍的體力消耗降低5%。(本屬性暫未開放)"
			elseif extparam3 == 8472 then
				return --[[!AUTO_521]]"^FF0000格擋的體力消耗降低5%。(本屬性暫未開放)"
			elseif extparam3 == 8473 then
				return --[[!AUTO_522]]"^FF0000加速跑的體力消耗降低5%。(本屬性暫未開放)"
			elseif extparam3 == 8474 then
				return --[[!AUTO_523]]"^FF0000倒地受身的體力消耗降低5%。(本屬性暫未開放)"
			elseif extparam3 == 8475 then
				return --[[!AUTO_524]]"^FF0000倒地受身的冷卻時間降低20%。(本屬性暫未開放)"
			elseif extparam3 == 8476 then
				return --[[!AUTO_525]]"^FF0000空中受身的體力消耗降低5%。(本屬性暫未開放)"
			elseif extparam3 == 8477 then
				return --[[!AUTO_526]]"^FF0000空中受身的冷卻時間降低20%。(本屬性暫未開放)"
			elseif extparam3 == 8544 then
				return --[[!AUTO_527]]"^FF0000真護：主動使用後釋放1個真氣罩，為全隊伍增加護盾，抵擋任意傷害3000點，持續8秒或達到吸收上限消失。(本屬性暫未開放)"
			elseif extparam3 == 8545 then
				return --[[!AUTO_528]]"^FF0000聖炎：主動使用後對單體目標釋放1個火球，造成單體火傷害3000點，如果殺死目標，則爆炸追加半徑9的AOE火傷害1500點。(本屬性暫未開放)"
			elseif extparam3 == 8546 then
				return --[[!AUTO_529]]"^FF0000冰柱：主動使用後向某方向釋放1道長15米寬5米高3米的冰柱，1秒後冰封範圍內目標5秒。(本屬性暫未開放)"
			elseif extparam3 == 8547 then
				return --[[!AUTO_530]]"^FF0000毒護：主動使用後對自身釋放後自身被毒霧籠罩8秒，暫時減少自己受到的毒傷害50%，且攻擊自身的目標會中毒降低攻擊力50%，降低攻擊效果持續10秒。"
			elseif extparam3 == 8548 then
				return --[[!AUTO_531]]"^FF0000土盾：主動使用後對自身釋放後自身被土盾覆蓋，減少受到的所有攻擊傷害20%，但也降低自身移動速度2米秒，持續8秒。(本屬性暫未開放)"
			elseif extparam3 == 8549 then
				return --[[!AUTO_532]]"^FF0000回春：主動使用後瞬間增加自身生命值1500。(本屬性暫未開放)"
			elseif extparam3 == 8550 then
				return --[[!AUTO_533]]"^FF0000安神：主動使用後瞬間增加自身 內力值1500。(本屬性暫未開放)"
			elseif extparam3 == 8551 then
				return --[[!AUTO_534]]"^FF0000聖佑：主動使用後瞬間增加自身體力50點。(本屬性暫未開放)"
			elseif extparam3 == 8552 then
				return --[[!AUTO_535]]"^FF0000狂怒：主動使用後瞬間增加自身怒氣100點。(本屬性暫未開放)"
			elseif extparam3 == 8553 then
				return --[[!AUTO_536]]"^FF0000破軍：主動使用後，自身下5秒一定破招。(本屬性暫未開放)"
			elseif extparam3 == 8554 then
				return --[[!AUTO_537]]"^FF0000七殺：主動使用後，自身下3秒一定會心。(本屬性暫未開放)"
			elseif extparam3 == 8555 then
				return --[[!AUTO_538]]"^FF0000破滅：主動使用後，自身下8秒增加外攻擊力888點。(本屬性暫未開放)"
			elseif extparam3 == 8556 then
				return --[[!AUTO_539]]"^FF0000內滿：主動使用後，自身下8秒增加內攻擊力888點。(本屬性暫未開放)"
			elseif extparam3 == 8557 then
				return --[[!AUTO_540]]"^FF0000會心：主動使用後，自身下8秒增加會心傷害4000點。(本屬性暫未開放)"
			elseif extparam3 == 3105 then
				return string.format(--[[!AUTO_541]]"踏風體力消耗減少%d%%,扶搖、穿雲、雁行體力消耗減少%d%%", extparam2*10, extparam2*5)
			elseif extparam3 == 3106 then
				return string.format(--[[!AUTO_542]]"扶搖體力消耗減少%d%%,踏風、穿雲、雁行體力消耗減少%d%%",extparam2*10,extparam2*5)
			elseif extparam3 == 3107 then
				return string.format(--[[!AUTO_543]]"穿雲體力消耗減少%d%%,踏風、扶搖、雁行體力消耗減少%d%%",extparam2*8,extparam2*5)
			elseif extparam3 == 3108 then
				return string.format(--[[!AUTO_544]]"雁行體力消耗減少%d%%,踏風、扶搖、雁行體力消耗減少%d%%",extparam2*8,extparam2*5)
			elseif extparam3 == 23 then
				return string.format(--[[!AUTO_545]]"閃避體力消耗減少%d%%;閃避後增加%d%%移動速度，持續5秒",extparam2*5,extparam2*5)
			elseif extparam3 == 3104 then
				return string.format(--[[!AUTO_546]]"神行體力消耗減少%d%%",extparam2*10)
			elseif extparam3 == 7789 then
				return string.format(--[[!AUTO_547]]"騎乘加速體力消耗減少%d%%",extparam2*10)
			elseif extparam3 == 3114 then
				return string.format(--[[!AUTO_548]]"水上漂加速體力消耗減少%d%%",extparam2*10)
			elseif extparam3 == 2685 then
				return string.format(--[[!AUTO_549]]"調息體力消耗減少%d%%,回復氣血受到%d%%治療效果加成",extparam2*5,extparam2*10)
			elseif extparam3 == 3591 then
				return string.format(--[[!AUTO_550]]"武器格擋體力消耗減少%d%%,格擋期期間破綻積累減少%d%%",extparam2*8,extparam2*8)
			elseif extparam3 == 6114 then
				return string.format(--[[!AUTO_551]]"倒地受身體力消耗減少%d%%,額外增加%d%%位移距離",extparam2*5,extparam2*5)
			elseif extparam3 == 6115 then
				return string.format(--[[!AUTO_552]]"浮空受身體力消耗減少%d%%,額外增加%d%%位移距離",extparam2*5,extparam2*5)
			else
				return string.format(EQUIP_ESSENCE_TYPE[exttype].style,DescUtility:GetSkillName(extparam3),extvalue)
			end
		elseif EQUIP_ESSENCE_TYPE[exttype].class == 4 then
			return string.format(EQUIP_ESSENCE_TYPE[exttype].style, extvalue/100)
		elseif EQUIP_ESSENCE_TYPE[exttype].class == 5 then
			return string.format(EQUIP_ESSENCE_TYPE[exttype].style, extvalue*20)
		elseif EQUIP_ESSENCE_TYPE[exttype].class == 6 then
			return string.format(EQUIP_ESSENCE_TYPE[exttype].style, ERRAND_NAME_LIST[extparam3] or ERRAND_NAME_DEFAULT, extvalue)
		elseif EQUIP_ESSENCE_TYPE[exttype].class == 7 then
			return string.format(EQUIP_ESSENCE_TYPE[exttype].style, SPECIAL_TASK_NAME_LIST[extparam3] or SPECIAL_TASK_NAME_DEFAULT, extvalue)
		elseif EQUIP_ESSENCE_TYPE[exttype].class == 8 then
			if reputation_definition[extparam3] then
				return string.format(EQUIP_ESSENCE_TYPE[exttype].style, reputation_definition[extparam3].name, extvalue)
			else
				return string.format(EQUIP_ESSENCE_TYPE[exttype].style, REPUTATION_NAME_DEFAULT, extvalue)
			end
		elseif EQUIP_ESSENCE_TYPE[exttype].class == 9 then
			return string.format(EQUIP_ESSENCE_TYPE[exttype].style, SPECIAL_TASK_REWARD_LIST[extparam3 + 1] or SPECIAL_TASK_REWARD_DEFAULT, extvalue)
		elseif EQUIP_ESSENCE_TYPE[exttype].class == 10 then
			local bOKProd , strProd = DescUtility:GetItemDBProp(extparam3, ClassType.ICID_PRODUCE_SKILL, --[[!AUTO_553]]"t_name")
			if bOKProd and strProd ~= --[[!AUTO_554]]"" then
				return string.format(EQUIP_ESSENCE_TYPE[exttype].style, strProd, extvalue)
			else
				return string.format(EQUIP_ESSENCE_TYPE[exttype].style, PRODUCE_TYPE_DEFAULT, extvalue)
			end
		elseif EQUIP_ESSENCE_TYPE[exttype].class == 11 then
			return string.format(EQUIP_ESSENCE_TYPE[exttype].style, SIGNATURE_TYPE_STRING[extparam3] or SIGNATURE_TYPE_DEFAULT, extvalue)
		elseif EQUIP_ESSENCE_TYPE[exttype].class == 12 then
			return string.format(EQUIP_ESSENCE_TYPE[exttype].style, extvalue*100)
		elseif EQUIP_ESSENCE_TYPE[exttype].class == 13 then
			return --[[!AUTO_555]]""
			--return string.format(EQUIP_ESSENCE_TYPE[exttype].style, extparam2*100, DISCIPLE_ATTACK_PHASE[extparam1] or DISCIPLE_ATTACK_PHASE_DEFAULT)
		elseif EQUIP_ESSENCE_TYPE[exttype].class == 14 then
			return EQUIP_ESSENCE_TYPE14[extparam1]
		elseif EQUIP_ESSENCE_TYPE[exttype].class == 15 then

			return string.format(EQUIP_ESSENCE_TYPE[exttype].style, extvalue*100)
		elseif EQUIP_ESSENCE_TYPE[exttype].class == 16 then
			if extparam3 == 2199 then
				return string.format(--[[!AUTO_516]]"打坐中生命回復加速%d％",extvalue*10)
			elseif extparam3 == 2200 then
				return string.format(--[[!AUTO_517]]"打坐中內力回復加速%d％",extvalue*10)
			elseif extparam3 == 8469 then
				return --[[!AUTO_518]]"^FF0000突進的體力消耗降低10%。(本屬性暫未開放)"
			elseif extparam3 == 8470 then
				return --[[!AUTO_519]]"^FF0000突進的移動距離增加20%。(本屬性暫未開放)"
			elseif extparam3 == 8471 then
				return --[[!AUTO_520]]"^FF0000跳躍的體力消耗降低5%。(本屬性暫未開放)"
			elseif extparam3 == 8472 then
				return --[[!AUTO_521]]"^FF0000格擋的體力消耗降低5%。(本屬性暫未開放)"
			elseif extparam3 == 8473 then
				return --[[!AUTO_522]]"^FF0000加速跑的體力消耗降低5%。(本屬性暫未開放)"
			elseif extparam3 == 8474 then
				return --[[!AUTO_523]]"^FF0000倒地受身的體力消耗降低5%。(本屬性暫未開放)"
			elseif extparam3 == 8475 then
				return --[[!AUTO_524]]"^FF0000倒地受身的冷卻時間降低20%。(本屬性暫未開放)"
			elseif extparam3 == 8476 then
				return --[[!AUTO_525]]"^FF0000空中受身的體力消耗降低5%。(本屬性暫未開放)"
			elseif extparam3 == 8477 then
				return --[[!AUTO_526]]"^FF0000空中受身的冷卻時間降低20%。(本屬性暫未開放)"
			elseif extparam3 == 8544 then
				return --[[!AUTO_527]]"^FF0000真護：主動使用後釋放1個真氣罩，為全隊伍增加護盾，抵擋任意傷害3000點，持續8秒或達到吸收上限消失。(本屬性暫未開放)"
			elseif extparam3 == 8545 then
				return --[[!AUTO_528]]"^FF0000聖炎：主動使用後對單體目標釋放1個火球，造成單體火傷害3000點，如果殺死目標，則爆炸追加半徑9的AOE火傷害1500點。(本屬性暫未開放)"
			elseif extparam3 == 8546 then
				return --[[!AUTO_529]]"^FF0000冰柱：主動使用後向某方向釋放1道長15米寬5米高3米的冰柱，1秒後冰封範圍內目標5秒。(本屬性暫未開放)"
			elseif extparam3 == 8547 then
				return --[[!AUTO_530]]"^FF0000毒護：主動使用後對自身釋放後自身被毒霧籠罩8秒，暫時減少自己受到的毒傷害50%，且攻擊自身的目標會中毒降低攻擊力50%，降低攻擊效果持續10秒。"
			elseif extparam3 == 8548 then
				return --[[!AUTO_531]]"^FF0000土盾：主動使用後對自身釋放後自身被土盾覆蓋，減少受到的所有攻擊傷害20%，但也降低自身移動速度2米秒，持續8秒。(本屬性暫未開放)"
			elseif extparam3 == 8549 then
				return --[[!AUTO_532]]"^FF0000回春：主動使用後瞬間增加自身生命值1500。(本屬性暫未開放)"
			elseif extparam3 == 8550 then
				return --[[!AUTO_533]]"^FF0000安神：主動使用後瞬間增加自身 內力值1500。(本屬性暫未開放)"
			elseif extparam3 == 8551 then
				return --[[!AUTO_534]]"^FF0000聖佑：主動使用後瞬間增加自身體力50點。(本屬性暫未開放)"
			elseif extparam3 == 8552 then
				return --[[!AUTO_535]]"^FF0000狂怒：主動使用後瞬間增加自身怒氣100點。(本屬性暫未開放)"
			elseif extparam3 == 8553 then
				return --[[!AUTO_536]]"^FF0000破軍：主動使用後，自身下5秒一定破招。(本屬性暫未開放)"
			elseif extparam3 == 8554 then
				return --[[!AUTO_537]]"^FF0000七殺：主動使用後，自身下3秒一定會心。(本屬性暫未開放)"
			elseif extparam3 == 8555 then
				return --[[!AUTO_538]]"^FF0000破滅：主動使用後，自身下8秒增加外攻擊力888點。(本屬性暫未開放)"
			elseif extparam3 == 8556 then
				return --[[!AUTO_539]]"^FF0000內滿：主動使用後，自身下8秒增加內攻擊力888點。(本屬性暫未開放)"
			elseif extparam3 == 8557 then
				return --[[!AUTO_540]]"^FF0000會心：主動使用後，自身下8秒增加會心傷害4000點。(本屬性暫未開放)"
			elseif extparam3 == 3105 then
				return string.format(--[[!AUTO_541]]"踏風體力消耗減少%d%%,扶搖、穿雲、雁行體力消耗減少%d%%", extparam2*10, extparam2*5)
			elseif extparam3 == 3106 then
				return string.format(--[[!AUTO_542]]"扶搖體力消耗減少%d%%,踏風、穿雲、雁行體力消耗減少%d%%",extparam2*10,extparam2*5)
			elseif extparam3 == 3107 then
				return string.format(--[[!AUTO_543]]"穿雲體力消耗減少%d%%,踏風、扶搖、雁行體力消耗減少%d%%",extparam2*8,extparam2*5)
			elseif extparam3 == 3108 then
				return string.format(--[[!AUTO_544]]"雁行體力消耗減少%d%%,踏風、扶搖、雁行體力消耗減少%d%%",extparam2*8,extparam2*5)
			elseif extparam3 == 23 then
				return string.format(--[[!AUTO_545]]"閃避體力消耗減少%d%%;閃避後增加%d%%移動速度，持續5秒",extparam2*5,extparam2*5)
			elseif extparam3 == 3104 then
				return string.format(--[[!AUTO_546]]"神行體力消耗減少%d%%",extparam2*10)
			elseif extparam3 == 7789 then
				return string.format(--[[!AUTO_547]]"騎乘加速體力消耗減少%d%%",extparam2*10)
			elseif extparam3 == 3114 then
				return string.format(--[[!AUTO_548]]"水上漂加速體力消耗減少%d%%",extparam2*10)
			elseif extparam3 == 2685 then
				return string.format(--[[!AUTO_549]]"調息體力消耗減少%d%%,回復氣血受到%d%%治療效果加成",extparam2*5,extparam2*10)
			elseif extparam3 == 3591 then
				return string.format(--[[!AUTO_550]]"武器格擋體力消耗減少%d%%,格擋期期間破綻積累減少%d%%",extparam2*8,extparam2*8)
			elseif extparam3 == 6114 then
				return string.format(--[[!AUTO_551]]"倒地受身體力消耗減少%d%%,額外增加%d%%位移距離",extparam2*5,extparam2*5)
			elseif extparam3 == 6115 then
				return string.format(--[[!AUTO_552]]"浮空受身體力消耗減少%d%%,額外增加%d%%位移距離",extparam2*5,extparam2*5)
			else
				local t_skill = GameApi.GetSkillEssence(extparam3, 1)
				local profession =""
				if t_skill then
					local pro = t_skill["mask_character"]
					if skill_ADDON_DESC_class[pro] then
						profession = skill_ADDON_DESC_class[pro]
					end
				end
				return string.format(EQUIP_ESSENCE_TYPE[exttype].style,profession,DescUtility:GetSkillName(extparam3),extvalue)
			end
		else
			return --[[!AUTO_556]]""
		end
	else
		return --[[!AUTO_557]]""
	end
end


-- 获取附加属性组详细效果描述
function DescUtility:GetEffectMajorDesc(tbl ,iColor)

	--[[
	--临时测试
	if tbl["ext_group_id"] == 72679 then
		tbl["ext_group_generate_type"] = 1
	else
		tbl["ext_group_generate_type"] = 0
	end
	]]

	if tbl["ext_group_generate_type"] == nil then
		tbl["ext_group_generate_type"] = 0
	end

	if tbl["ext_group_type"] == 0 then
		return TAG_COLOR_ESSENCE[iColor] .. EQUIP_ESSPROP_RANDOMIZED

	elseif tbl["ext_group_type"] == 1 then
		return --[[!AUTO_502]]""
	elseif tbl["ext_group_type"] == 2 then
		local stress = {}
		local i
		local extcount, extrand, exttype, extparam1, extparam2, extparam3
		if tbl["ext_prop_count"] == 0 or tbl["ext_prop_count"] == nil then
			return --[[!AUTO_503]]""
		elseif tbl["ext_prop_count"] == 1 and tbl["ext_prop_1_type"] == 0 then
			return --[[!AUTO_504]]""
		else
			local fixedpropcount = 0
			local ctprop = {}
			for i = 1, 8 do
				_, ctprop[i] = DescUtility:GetItemDBProp(tbl["ext_group_id"],ClassType.ICID_ADDON_GROUP,--[[!]]"基础附加属性" .. i)
				if ctprop[i] > 0 then
					fixedpropcount = fixedpropcount + 1
				end
			end

			for i = 1 , tbl["ext_prop_count"] do
				extrand = tbl[--[[!AUTO_505]]"ext_prop_" .. i .. --[[!AUTO_506]]"_rand"]
				exttype = tbl[--[[!AUTO_507]]"ext_prop_" .. i .. --[[!AUTO_508]]"_type"]
				extparam1 = tbl[--[[!AUTO_509]]"ext_prop_" .. i .. --[[!AUTO_510]]"_param1"]
				extparam2 = tbl[--[[!AUTO_511]]"ext_prop_" .. i .. --[[!AUTO_512]]"_param2"]
				extparam3 = tbl[--[[!AUTO_513]]"ext_prop_" .. i .. --[[!AUTO_514]]"_param3"]
				local extvalue = DescUtility:GetEquipRandValue(extrand, extparam1, extparam2)
				stress[i] = self:GetExtStr(exttype, extvalue, extparam2, extparam3)
			end

			local randomstring = --[[!AUTO_558]]""
			if tbl["ext_group_generate_type"] == 1 then
				local rdprop = {}
				local rdcountlow = 0
				local rdcounthigh = 0
				for j = 0, 8 do
					_, rdprop[j] = DescUtility:GetItemDBProp(tbl["ext_group_id"],ClassType.ICID_ADDON_GROUP,--[[!]]"出现" .. j .. --[[!]]"个随机属性的概率")
					--LogPrint(rdprop[j])
					if rdcountlow == 0 then
						if rdprop[j] > 0 then
							rdcountlow = j
						end
					else
						if rdprop[j] > 0 then
							rdcounthigh = j
						end
					end
					if rdcountlow > 0 then
						if rdcounthigh > 0 then
							randomstring = string.format(EQUIP_ESSPROP_RANDOMADD_LOWHIGH, rdcountlow, rdcounthigh)
						else
							randomstring = string.format(EQUIP_ESSPROP_RANDOMADD_SELECT, rdcountlow)
						end
					end
				end
			end
			--LogPrint("固定属性数目: " .. fixedpropcount)
			--LogPrint("固定属性设定: " .. randomstring)
			if fixedpropcount == 0 then
				for i = 1,#stress-1 do
					for j = i+1,#stress do
						if string.len(stress[i]) > string.len(stress[j]) then
							stress[i],stress[j] = stress[j],stress[i]
						end
					end
				end
				return TAG_COLOR_ESSENCE[iColor] .. DescUtility:StringCombiner(stress)
			else
				local fixedstress = {}
				local fixedstress2 = {}
				local fixedstress_rand = {}
				for m = 1, fixedpropcount do
					fixedstress[m] = stress[m]
				end

				--for i = 1,#fixedstress-1 do
				--	for j = i+1,#fixedstress do
				--		if string.len(fixedstress[i]) > string.len(fixedstress[j]) then
				--			fixedstress[i],fixedstress[j] = fixedstress[j],fixedstress[i]
				--		end
				--	end
				--end

				if #fixedstress > 2 then
					for i = 3,#fixedstress do
						fixedstress2[i-2] = fixedstress[i]
						fixedstress[i] = nil
					end
				end



				if #stress > fixedpropcount then
					for m = fixedpropcount+1,#stress do
						fixedstress_rand[m-fixedpropcount] = stress[m]
					end
				end
				if #stress > fixedpropcount+1 then
					for i = 1,#fixedstress_rand-1 do
						for j = i+1,#fixedstress_rand do
							if string.len(fixedstress_rand[i]) > string.len(fixedstress_rand[j]) then
								fixedstress_rand[i],fixedstress_rand[j] = fixedstress_rand[j],fixedstress_rand[i]
							end
						end
					end
				end

				local final_text

				if #fixedstress_rand > 0 and tbl["ext_group_generate_type"] ~= 1 then
					if #fixedstress2 > 0 then
						final_text= TAG_COLOR_ESSENCE[14] .. DescUtility:StringCombiner(fixedstress) .. --[[!AUTO_559]]"\r" .. TAG_COLOR_ESSENCE[iColor] .. DescUtility:StringCombiner(fixedstress_rand) .. --[[!AUTO_560]]"\r" .. TAG_COLOR_CHANNEL[5] .. DescUtility:StringCombiner(fixedstress2)
					else
						final_text= TAG_COLOR_ESSENCE[14] .. DescUtility:StringCombiner(fixedstress) .. --[[!AUTO_561]]"\r" .. TAG_COLOR_ESSENCE[iColor] .. DescUtility:StringCombiner(fixedstress_rand)
					end
				else
					final_text = TAG_COLOR_ESSENCE[14] .. DescUtility:StringCombiner(fixedstress)
				end

				if randomstring ~= --[[!AUTO_562]]"" then
					if #fixedstress2 > 0 then
						final_text = final_text .. --[[!AUTO_563]]"\r" .. TAG_COLOR_ESSENCE[iColor] .. randomstring .. "\r" .. TAG_COLOR_CHANNEL[5] .. DescUtility:StringCombiner(fixedstress2)
					else
						final_text = final_text .. --[[!AUTO_563]]"\r" .. TAG_COLOR_ESSENCE[iColor] .. randomstring
					end
				end

				return final_text
			end
		end
	elseif tbl["ext_group_type"] == 3 then
		return TAG_COLOR_ESSENCE[iColor] .. EQUIP_ESSPROP_RANDOMIZED
	else
		return --[[!AUTO_564]]""
	end
end

-- 获取开光状态

function DescUtility:GetKaiguangDamageType(tid, cid, ext_tbl)
	local subtbl
	local damage_str
	local damage_type = 0

	subtbl = ext_tbl["EquipKaiguangAddon"]
	if ext_tbl["KaiguangState"] == 0 then
		damage_type = 0
	elseif ext_tbl["KaiguangState"] == 1 or ext_tbl["KaiguangState"] == 2 then
		damage_type = 1
	elseif ext_tbl["KaiguangState"] == 3 then
		damage_str = DescUtility:GetItemSubType(subtbl["ext_group_id"],ClassType.ICID_ADDON_GROUP)
		if damage_str == --[[!]]"开光武器冰伤害附加" then
			damage_type = 2
		elseif damage_str == --[[!]]"开光武器火伤害附加" then
			damage_type = 3
		elseif damage_str == --[[!]]"开光武器毒伤害附加" then
			damage_type = 4
		elseif damage_str == --[[!]]"开光防具力道增加" then
			damage_type = 5
		elseif damage_str == --[[!]]"开光防具体魄增加" then
			damage_type = 6
		elseif damage_str == --[[!]]"开光防具筋骨增加" then
			damage_type = 7
		elseif damage_str == --[[!]]"开光防具内劲增加" then
			damage_type = 8
		elseif damage_str == --[[!]]"开光防具气海增加" then
			damage_type = 9
		end
	end
	return damage_type
end

--取物品堆叠上限

function DescUtility:GetItemMaxQuantity(tid, cid)
	local max_quantity = 0
	_, max_quantity = DescUtility:GetItemDBProp(tid, cid, --[[!]]"堆叠上限")

	return max_quantity
end

--限制场景ID及坐标

function DescUtility:GetLimitSceneInfo(tid, cid)
	local str1 = --[[!AUTO_565]]""
	local str2 = --[[!AUTO_566]]""
	local str3 = --[[!AUTO_567]]""
	local str4 = --[[!AUTO_568]]""
	local str5 = --[[!AUTO_569]]""

	if cid == ClassType.ICID_MONSTERCTRL or cid == ClassType.ICID_TRANSMITROLL then
		str1 = --[[!]]"使用限制场景ID"
		str2 = --[[!]]"使用限制场景最小X"
		str3 = --[[!]]"使用限制场景最小Z"
		str4 = --[[!]]"使用限制场景最大X"
		str5 = --[[!]]"使用限制场景最大Z"
	elseif cid == ClassType.ICID_FIREWORK then
		str1 = --[[!]]"场景ID限制"
		str2 = --[[!]]"坐标X最小"
		str3 = --[[!]]"坐标Z最小"
		str4 = --[[!]]"坐标X最大"
		str5 = --[[!]]"坐标Z最大"
	end

	local _, scene_id = DescUtility:GetItemDBProp(tid, cid, str1)
	local _, min_x = DescUtility:GetItemDBProp(tid, cid, str2)
	local _, min_z = DescUtility:GetItemDBProp(tid, cid, str3)
	local _, max_x = DescUtility:GetItemDBProp(tid, cid, str4)
	local _, max_z = DescUtility:GetItemDBProp(tid, cid, str5)

	return scene_id, math.floor((max_x+min_x)/2), math.floor((max_z+min_z)/2),math.floor(max_x-min_x),math.floor(max_z-min_z)
end

--获取普通物品类别

function DescUtility:GetNormalItemType(tid, cid)
	local main_type = DescUtility:GetItemMajorType(tid, cid)
	local sub_type = DescUtility:GetItemSubType(tid, cid)
	local type_id = 0

	if main_type == --[[!]]"NPC出售普通物品" then
		type_id = 1
	elseif main_type == --[[!]]"按谱系掉落的普通物品" then
		type_id = 2
	elseif main_type == --[[!]]"宠物掉落的普通物品" then
		if sub_type == --[[!]]"宠物捕捉技能升级所需道具" then
			type_id = 3
		elseif sub_type == --[[!]]"宠物捕捉消耗物品" then
			type_id = 4
		elseif sub_type == --[[!]]"宠物掉落的普通物品" then
			type_id = 5
		elseif sub_type == --[[!]]"宠物服务涉及的物品" then
			type_id = 6
		end
	elseif main_type == --[[!]]"地宫物品" then
		type_id = 7
	elseif main_type == --[[!]]"交际特殊物品" then
		if sub_type == --[[!]]"帮派相关" then
			type_id = 8
		elseif sub_type == --[[!]]"结拜相关" then
			type_id = 9
		elseif sub_type == --[[!]]"结婚相关" then
			type_id = 10
		end
	elseif main_type == --[[!]]"门派物品" then
		type_id = 11
	elseif main_type == --[[!]]"生产工具" then
		type_id = 12
	elseif main_type == --[[!]]"装备打孔取宝石物品" then
		if sub_type == --[[!]]"装备打孔物品" then
			type_id = 13
		elseif sub_type == --[[!]]"装备取宝石物品" then
			type_id = 14
		end
	elseif main_type == --[[!]]"装备解除封印物品" then
		if sub_type == --[[!]]"解封符" then
			type_id = 15
		elseif sub_type == --[[!]]"解封石合成材料" then
			type_id = 16
		end
	elseif main_type == --[[!]]"装备开光物品" then
		type_id = 17
	elseif main_type == --[[!]]"装备强化物品" then
		type_id = 18
	elseif main_type == --[[!]]"帮派相关物品" then
		if sub_type == --[[!]]"帮派功能道具" then
			type_id = 19
		elseif sub_type == --[[!]]"运镖怪物掉落物品" then
			type_id = 20
		end
	elseif main_type == --[[!]]"每只怪对应的奇物" then
		type_id = 21
	elseif main_type == --[[!]]"新版幸运剂" then
		type_id = 22
	elseif main_type == --[[!]]"装备分解类物品" then
		type_id = 23
	elseif main_type == --[[!]]"装备注入类物品" then
		type_id = 24
	end
	return type_id
end

--获取冷却时间
function DescUtility:GetCoolDownDesc(tid, cid)
	local str = --[[!AUTO_570]]""
	if cid == ClassType.ICID_COUPLE_JUMPTO then
		str = --[[!]]"冷却时间"
	elseif cid == ClassType.ICID_DOUBLEEXP then
		str = --[[!]]"双倍经验时间(秒)"
	elseif cid == ClassType.ICID_PET_NORMALMEDICINE then
		str = --[[!]]"冷却时间（秒）"
	elseif cid == ClassType.ICID_SCENEONLY then
		str = --[[!]]"使用对应的冷却时间"
	end

	local _, cool_down = DescUtility:GetItemDBProp(tid, cid, str)
	if cool_down >= 60 and cool_down < 3600 then
		return string.format(--[[!AUTO_571]]"%s分鐘", math.floor(cool_down/60))
	elseif cool_down >= 3600 then
		return string.format(--[[!AUTO_572]]"%s小時", math.floor(cool_down/3600))
	else
		return string.format(--[[!AUTO_573]]"%s秒", cool_down)
	end
end

--获取经验倍率
function DescUtility:GetExpScaleFactorDesc(tid, cid)
	if cid ~= ClassType.ICID_DOUBLEEXP then
		return ""
	end
	local _, exp_scale = DescUtility:GetItemDBProp(tid, cid, --[[!]]"经验倍率")
	if exp_scale == 2 then
		return "雙倍"
	else
		if exp_scale%1 == 0 then
			return string.format("%.0f倍", exp_scale)
		else
			return string.format("%.1f倍", exp_scale)
		end
	end
end

--获取传送场景及坐标
function DescUtility:GetTransSceneInfo(tid, cid)
	local str1 = --[[!AUTO_574]]""
	local str2 = --[[!AUTO_575]]""
	local str3 = --[[!AUTO_576]]""

	if cid == ClassType.ICID_TRANSMITROLL then
		str1 = --[[!]]"目标场景id"
		str2 = --[[!]]"目标X坐标"
		str3 = --[[!]]"目标Z坐标"
	end

	local _, scene_id = DescUtility:GetItemDBProp(tid, cid, str1)
	local _, x = DescUtility:GetItemDBProp(tid, cid, str2)
	local _, z = DescUtility:GetItemDBProp(tid, cid, str3)

	return scene_id,x,z
end


--物品拿起放下音效
function DescUtility:ItemTypeToSound(tid,cid)
	local major_type
	local sub_type
	local templ_name
	local display_name
	local sound_path
	local pos = 0

	_, major_type,sub_type = GameApi.GetItemDBPath(tid, cid)
	_, display_name = DescUtility:GetItemDBProp(tid,cid,--[[!AUTO_577]]"t_name")
	if cid == ClassType.ICID_EQUIP then
		if major_type == --[[!]]"武器" then
			pos=1
			if sub_type == --[[!]]"新手武器" then
				sound_path = ICON_SOUND_PATH[1]
			elseif sub_type == --[[!]]"少林结棍" then
				sound_path = ICON_SOUND_PATH[2]
			elseif sub_type == --[[!]]"武当长剑" then
				sound_path = ICON_SOUND_PATH[3]
			elseif sub_type == --[[!]]"华山单剑" then
				sound_path = ICON_SOUND_PATH[4]
			elseif sub_type == --[[!]]"恒山双剑" then
				sound_path = ICON_SOUND_PATH[5]
			elseif sub_type == --[[!]]"衡山琴剑" then
				sound_path = ICON_SOUND_PATH[6]
			elseif sub_type == --[[!]]"日月双刃" then
				sound_path = ICON_SOUND_PATH[7]
			elseif sub_type == --[[!]]"五仙鞭子" then
				sound_path = ICON_SOUND_PATH[8]
			elseif sub_type == --[[!]]"逍遥扇子" then
				sound_path = ICON_SOUND_PATH[9]
			elseif sub_type == --[[!]]"唐门拳刃" then
				sound_path = ICON_SOUND_PATH[10]
			elseif sub_type == --[[!]]"峨眉法杖" then
				sound_path = ICON_SOUND_PATH[11]
			else
				sound_path = ICON_SOUND_PATH[1]
			end
		elseif major_type == --[[!]]"防具" then
			pos=2
			if string.find(sub_type,--[[!]]"布衣") ~= nil then
				sound_path = ICON_SOUND_PATH[12]
			elseif string.find(sub_type,--[[!]]"棉甲") ~= nil then
				sound_path = ICON_SOUND_PATH[13]
			elseif string.find(sub_type,--[[!]]"皮甲") ~= nil then
				sound_path = ICON_SOUND_PATH[14]
			else
				sound_path = ICON_SOUND_PATH[12]
			end
		elseif major_type == --[[!]]"饰品" then
			pos=3
			if string.find(sub_type,--[[!]]"戒指") ~= nil then
				sound_path = ICON_SOUND_PATH[15]
			elseif string.find(sub_type,--[[!]]"项链") ~= nil then
				sound_path = ICON_SOUND_PATH[16]
			else
				sound_path = ICON_SOUND_PATH[17]
			end
		elseif major_type == --[[!]]"功能装备" then
			pos=4
			sound_path = ICON_SOUND_PATH[20]
		elseif major_type == --[[!]]"时装" then
			pos=5
			sound_path = ICON_SOUND_PATH[18]
		end
	elseif cid == ClassType.ICID_MATERIAL then
		pos=6
		if sub_type == --[[!]]"布帛" then
		pos=7
			if string.find(display_name,--[[!]]"布") ~= nil then
				sound_path = ICON_SOUND_PATH[12]
			elseif string.find(display_name,--[[!]]"棉") ~= nil then
				sound_path = ICON_SOUND_PATH[13]
			end
		elseif sub_type == --[[!]]"金石" then
		pos=8
			if string.find(display_name,--[[!]]"石") ~= nil then
				sound_path = ICON_SOUND_PATH[23]
			elseif string.find(display_name,--[[!]]"金") ~= nil or string.find(display_name,--[[!]]"银") or string.find(display_name,--[[!]]"铜")
			or string.find(display_name,--[[!]]"铁") or string.find(display_name,--[[!]]"钢")  then
				sound_path = ICON_SOUND_PATH[25]
			elseif string.find(display_name,--[[!AUTO_578]]"土") ~= nil then
				sound_path = ICON_SOUND_PATH[24]
			end
		elseif sub_type == --[[!]]"木革" then
			pos=9
			if string.find(display_name,--[[!]]"木") ~= nil then
				sound_path = ICON_SOUND_PATH[20]
			elseif string.find(display_name,--[[!]]"皮") ~= nil then
				sound_path = ICON_SOUND_PATH[22]
			end
		elseif sub_type == --[[!]]"木革与布帛" then
			sound_path = ICON_SOUND_PATH[19]
		elseif sub_type == --[[!]]"烹饪用" then
			if string.find(display_name,--[[!]]"肉") ~= nil or string.find(display_name,--[[!]]"鸡") ~= nil or string.find(display_name,--[[!]]"鸭") ~= nil
			or string.find(display_name,--[[!]]"牛") ~= nil or string.find(display_name,--[[!]]"羊") ~= nil or string.find(display_name,--[[!]]"鱼") ~= nil then
				sound_path = ICON_SOUND_PATH[21]
			end
		elseif sub_type == --[[!]]"制药用" then
			sound_path = ICON_SOUND_PATH[19]
		end
	elseif cid == ClassType.ICID_MEDICINE then
		if string.find(display_name,--[[!]]"露") ~= nil then
			sound_path = ICON_SOUND_PATH[26]
		else
			sound_path = ICON_SOUND_PATH[27]
		end
	elseif cid == ClassType.ICID_REVSCROLL or cid == ClassType.ICID_SKILLTOME or cid == ClassType.ICID_TOWNSCROLL
		or cid == ClassType.ICID_RECIPEROLL or cid == ClassType.ICID_TRANSMITROLL then
		sound_path = ICON_SOUND_PATH[30]
	elseif cid == ClassType.ICID_ESTONE or cid == ClassType.ICID_PSTONE or cid == ClassType.ICID_SSTONE then
		sound_path = ICON_SOUND_PATH[31]
	elseif cid == ClassType.ICID_SKILLMATTER then
		if major_type == --[[!]]"丹丸药" then
			sound_path = ICON_SOUND_PATH[27]
		elseif major_type == --[[!]]"烹饪" then
			sound_path = ICON_SOUND_PATH[28]
		end
	elseif cid == ClassType.ICID_PET_SKILL then
		sound_path = ICON_SOUND_PATH[29]
	elseif cid == ClassType.ICID_PET_MEDICINE or cid == ClassType.ICID_PET_ADDPROP or cid == ClassType.ICID_PET_NORMALMEDICINE then
		sound_path = ICON_SOUND_PATH[27]
	elseif cid == ClassType.ICID_PET_RESETPROP then
		sound_path = ICON_SOUND_PATH[31]
	elseif cid == ClassType.ICID_CROPSEED then
		sound_path = ICON_SOUND_PATH[19]
	elseif cid == ClassType.ICID_NORMAL_ITEM then
		if major_type == --[[!]]"装备打孔取宝石物品" or major_type == --[[!]]"装备解除封印物品" or major_type == --[[!]]"装备开光物品" or major_type == --[[!]]"装备强化物品" then
			sound_path = ICON_SOUND_PATH[31]
		end
	end

	if sound_path == nil then
		sound_path = ICON_SOUND_PATH[32]
	end
	return sound_path
end

-- 获取怪物名称
function DescUtility:GetMonsterName(tid)
	local _, iQuality = DescUtility:GetItemDBProp(tid, ClassType.ICID_MONSTER, --[[!]]"显示等级")
	local sColor = MONSTER_COLOR_DESC[iQuality+1] or MONSTER_COLOR_DESC_DEFAULT
	local _, sTitle = DescUtility:GetItemDBProp(tid, ClassType.ICID_MONSTER, --[[!AUTO_579]]"t_name")
	if TestShowItemId and TestShowItemId == 1 then --调试模式d_script TestShowItemId = 1
		if  iQuality == --[[!AUTO_580]]"" then
			return sTitle .. --[[!AUTO_581]]"(" .. tid .. --[[!AUTO_582]]")"
		else
			return string.format(--[[!AUTO_583]]"%s%s", sColor, sTitle) .. --[[!AUTO_584]]"(" .. tid .. --[[!AUTO_585]]")"
		end
	else
		if  iQuality == --[[!AUTO_586]]"" then
			return sTitle
		else
			return string.format(--[[!AUTO_587]]"%s%s", sColor, sTitle)
		end
	end
end

-- 获取怪物纯名称、颜色

function DescUtility:GetMonsterNameColor(tid)
	local _, iQuality = DescUtility:GetItemDBProp(tid, ClassType.ICID_MONSTER, --[[!]]"显示等级")
	local sColor = MONSTER_COLOR_DESC[iQuality+1] or MONSTER_COLOR_DESC_DEFAULT
	local _, sTitle = DescUtility:GetItemDBProp(tid, ClassType.ICID_MONSTER, --[[!AUTO_588]]"t_name")
	local intColor = tonumber(--[[!AUTO_589]]"0x"..sColor:sub(2,7)) or 0xffffff
	return sTitle, intColor
end

-- 获取怪物图标
function DescUtility:GetMonsterIcon(tid)
	local sTempl = --[[!]]"图标名称"
	local bIcon, sIcon = DescUtility:GetItemDBProp(tid, ClassType.ICID_MONSTER, sTempl)
	if monster_boss_tip[tid] ~= nil then
		return monster_boss_tip[tid]
	else
		return bIcon and sIcon or --[[!AUTO_590]]"00752未知物品.dds"
	end
end


-- 获取状态包带图标描述

function DescUtility:GetEffectIconDesc(tid)
	local EffectGroupIconText = {}
	local effectCount = 0
	for k, v in pairs(EffectList) do
		local bOK1, extid = GameApi.GetItemDBProp(tid, ClassType.ICID_ADDON_GROUP, v)
		if bOK1 and extid > 0 then
			local bOK2, exttype, extparam1, extparam2, extparam3 = GameApi.GetItemDBProp(extid, ClassType.ICID_EQUIPMENT_ADDON, --[[!AUTO_591]]"type", --[[!AUTO_592]]"param1", --[[!AUTO_593]]"param2", --[[!AUTO_594]]"param3")
			if bOK2 then
				local extStr = self:GetExtStr(exttype, extparam1, extparam2, extparam3)
				local extIcon = --[[!AUTO_596]]""
				local extName = {}

				extIcon = EQUIP_ESSENCE_TYPE[exttype].icon
				extName = JobEffectName[tid][k]
				effectCount = effectCount + 1
				EffectGroupIconText[effectCount] = {extStr, extIcon,extName}
			end
		end
	end

	return EffectGroupIconText
end

-- 获取装备附加属性组对应附加属性

function DescUtility:GetAddonFromGroup(tid)
	local _,base_addon_id1 = DescUtility:GetItemDBProp(tid, ClassType.ICID_ADDON_GROUP, --[[!]]"基础附加属性1")
	local _,base_addon_id2 = DescUtility:GetItemDBProp(tid, ClassType.ICID_ADDON_GROUP, --[[!]]"基础附加属性2")
	local _,base_addon_id3 = DescUtility:GetItemDBProp(tid, ClassType.ICID_ADDON_GROUP, --[[!]]"基础附加属性3")
	local _,base_addon_id4 = DescUtility:GetItemDBProp(tid, ClassType.ICID_ADDON_GROUP, --[[!]]"基础附加属性4")

	local base_addon_desc = --[[!AUTO_603]]""
	if base_addon_id1 and base_addon_id1 > 0 then
		local _,addon_type,param1,param2,param3 = GameApi.GetItemDBProp(base_addon_id1, ClassType.ICID_EQUIPMENT_ADDON, --[[!AUTO_604]]"type", --[[!AUTO_605]]"param1", --[[!AUTO_606]]"param2", --[[!AUTO_607]]"param3")
		if EQUIP_ESSENCE_TYPE[addon_type] then
			base_addon_desc = string.format(EQUIP_ESSENCE_TYPE[addon_type].style,param1)
		end
	end
	if base_addon_id2 and base_addon_id2 > 0 then
		local _,addon_type,param1,param2,param3 = GameApi.GetItemDBProp(base_addon_id2, ClassType.ICID_EQUIPMENT_ADDON, --[[!AUTO_608]]"type", --[[!AUTO_609]]"param1", --[[!AUTO_610]]"param2", --[[!AUTO_611]]"param3")
		if EQUIP_ESSENCE_TYPE[addon_type] then
			base_addon_desc = base_addon_desc .. --[[!AUTO_612]]"\r" .. string.format(EQUIP_ESSENCE_TYPE[addon_type].style,param1)
		end
	end
	if base_addon_id3 and base_addon_id3 > 0 then
		local _,addon_type,param1,param2,param3 = GameApi.GetItemDBProp(base_addon_id3, ClassType.ICID_EQUIPMENT_ADDON, --[[!AUTO_613]]"type", --[[!AUTO_614]]"param1", --[[!AUTO_615]]"param2", --[[!AUTO_616]]"param3")
		if EQUIP_ESSENCE_TYPE[addon_type] then
			base_addon_desc = base_addon_desc .. --[[!AUTO_617]]"\r" .. string.format(EQUIP_ESSENCE_TYPE[addon_type].style,param1)
		end
	end
	if base_addon_id4 and base_addon_id4 > 0 then
		local _,addon_type,param1,param2,param3 = GameApi.GetItemDBProp(base_addon_id4, ClassType.ICID_EQUIPMENT_ADDON, --[[!AUTO_618]]"type", --[[!AUTO_619]]"param1", --[[!AUTO_620]]"param2", --[[!AUTO_621]]"param3")
		if EQUIP_ESSENCE_TYPE[addon_type] then
			base_addon_desc = base_addon_desc .. --[[!AUTO_622]]"\r" .. string.format(EQUIP_ESSENCE_TYPE[addon_type].style,param1)
		end
	end

	return base_addon_desc
end


--阵营改变提示信息
function DescUtility:camp_tip(oldcamp,newcamp)
	if camp_tip_old[oldcamp] and camp_tip_new[newcamp] then
	tip = string.format(--[[!AUTO_623]]"%s\r%s",camp_tip_old[oldcamp],camp_tip_new[newcamp])
	else
	tip = string.format(--[[!AUTO_624]]"%s\r%s",camp_tip_old["default"],camp_tip_new["default"])
	end
	GameApi.AddChatMessage(1,tip)
end

--获取宠物资质星级
function DescUtility:GetPetPointLevel(pet_point_sum,pet_point)
	local num = pet_point_sum*pet_point
	if num < 1000 then
		return 1
	elseif num >= 1000 and num < 1500 then
		return 2
	elseif num >= 1500 and num < 2000 then
		return 3
	elseif num >= 2000 and num < 2500 then
		return 4
	elseif num >= 2500 then
		return 5
	else
		return 1
	end
end

--获取表情包持续时间
function DescUtility:GetEmotionItemTime(tid, cid)
	local sTime = --[[!AUTO_625]]""
	sTime = --[[!]]"时限(小时)"
	local bTime, iTime = DescUtility:GetItemDBProp(tid,cid,sTime)
	return string.format(EMOTION_ITEM_TIME_TEXT,DescUtility:GetItemExpireTimeText(iTime*3600,true))
end

--获取宝石包描述
function DescUtility:GetStoneGenerateBagContent(tid, cid)
	local sStone = --[[!AUTO_627]]""
	local sStoneCount = --[[!AUTO_628]]""
	local sBuff = --[[!AUTO_629]]""
	sStone = --[[!]]"使用后生成物品ID"
	sNeedNum = "生成需要的數量"
	sStoneCount = --[[!]]"生成物品数量"
	sBuff = --[[!]]"成功时获得的buff技能ID"
	local bTime, iStone = DescUtility:GetItemDBProp(tid, cid, sStone)
	local bCount, iStoneCount = DescUtility:GetItemDBProp(tid, cid, sStoneCount)
	local bBuff, iBuff = DescUtility:GetItemDBProp(tid, cid, sBuff)
	local bNeedNum, iNeedNum = DescUtility:GetItemDBProp(tid, cid, sNeedNum)
	--LogPrint(iStone)
	if DescUtility:GetSubItemName(iStone) then
		if DescUtility:GetItemMajorType(tid, cid) == "寶物合成道具" then
			return string.format(BAOWUSUIPIAN_TIME_TEXT, iNeedNum,DescUtility:GetSubItemName(iStone), iStoneCount)
		elseif DescUtility:GetItemMajorType(tid, cid) == "碎片合成道具" then
			return string.format(XUEFUSUIPIAN_ITEM_TEXT, iNeedNum, DescUtility:GetSubItemName(iStone), iStoneCount)
		else
			return string.format(STONE_GENERATE_TIME_TEXT, DescUtility:GetSubItemName(iStone), iStoneCount, STONE_GENERATE_BUFF_TEXT[iBuff] or STONE_GENERATE_BUFF_TEXT_DEFAULT)
		end
	else
		return --[[!AUTO_630]]""
	end
end


--获取宝石包宝石属性
function DescUtility:GetStoneGenerateBagStoneDesc(tid, cid)
	local sStone = --[[!AUTO_631]]""
	sStone = --[[!]]"使用后生成物品ID"
	local bTime, iStone = DescUtility:GetItemDBProp(tid, cid, sStone)
	if DescUtility:GetSubItemName(iStone) then
		return string.format(STONE_GENERATE_STONE_DESC_STYLE, DescUtility:GetSubItemName(iStone), DescUtility:GetAESTONEDesc(iStone, ClassType.ICID_ESTONE))
	else
		return --[[!AUTO_632]]""
	end
end
--拼接颜色
function DescUtility:GenerateColorString(preColor, iColor)
	local a,b,c,strClr
	a = iColor + 2^32
	b = math.floor(a/(2^24))
	c = a - b * 2^24
	strClr = string.format(--[[!AUTO_633]]"%x",c)--string.sub(string.format("%x",iColor),3,8)
	strClr = string.rep(--[[!AUTO_634]]"0", 6-string.len(strClr)) .. strClr
	if DYE_COLOR_LIST[c + 2^24*255] then
		return preColor .. string.format(DYE_COLOR_STYLE_ONLIST, --[[!AUTO_635]]"^" .. strClr , DYE_COLOR_LIST[c + 2^24*255].name)
	else
		return preColor .. string.format(DYE_COLOR_STYLE_NOTONLIST, --[[!AUTO_636]]"^" .. strClr)
	end
end

--获取阵石阵法能量
function DescUtility:GetMagicStoneEnergyDesc(tid, cid)
	local sStone = ""
	sStone = --[[!]]"阵法能量"
	local str_energy = ""
	for i=1,4 do
		local index = string.format("%d",i)
		local bOK, strProp = DescUtility:GetItemDBProp(tid, cid, sStone..index)
    	str_energy = str_energy..string.format("%d\r",strProp)
    end
    return str_energy
end

--获取阵石附加属性
function DescUtility:GetMagicStoneEssDesc(tid, cid)
	local EssString = ""
	local strEss = "附加屬性組"
	local bOK, stoneEss = DescUtility:GetItemDBProp(tid, cid, strEss)
	if bOK and stoneEss > 0 then
		EssString = DescUtility:GetEffectBaseDesc(stoneEss, 1)
	end
	return EssString
end

--获取染色剂颜色
function DescUtility:GetFashionEquipPainterColor(tid, cid)
	local sColor = --[[!AUTO_637]]""
	sColor = --[[!]]"固定染色剂颜色"
	local bColor, iColor = DescUtility:GetItemDBProp(tid, cid, sColor)
	return DescUtility:GenerateColorString(DYE_TEXT, iColor + 2^32)
end

--获取时装发色映射值
function DescUtility:GetFashionHairColorValue(iColor)
	local a,b,c
	a = iColor + 2^32
	b = math.floor(a/(2^24))
	c = a - b * 2^24
	local color_config = DYE_COLOR_LIST[c + 2^24*255]
	if color_config then
		return color_config.fashion_hair_color
	else
		return 4281538072   --默认发色
	end
end


--时装专用描述获取
function DescUtility:DyeColorArranger(color)
	local a,b,c
	if color >= 0 then
		a = color
	else
		a = color + 2^32
	end
	--LogPrint(a/(2^24))
	b = math.floor(a/(2^24))
	--LogPrint(b)
	c = a - b * 2^24
	--LogPrint(color .. " -> " .. c)
	return c
end

--时装风格获取
function DescUtility:GetFashionStyle(tid)
	if not (fashion_config and fashion_config.FashionStyleIndex and fashion_config.StyleName) then 
		return {}
	end
	local styles = fashion_config.FashionStyleIndex[tid] or {}
	local nameTbl = fashion_config.StyleName
	local styleName = {} 
	for i = 1, #styles do
		table.insert(styleName, nameTbl[styles[i]])
	end
	return styleName
end

--时装专用描述获取
function DescUtility:GetFashionEquipProp(tid, cid, ext_tbl)

--                                  / ---["idx"]
--ext_tbl["Dyeing"][1到4，可能比4小]
--                                  \ ---["color"]
--[[
	ext_tbl["Dyeing"] =
	{
		[1] = {["idx"] = 1, ["color"] = -17776,},
		[2] = {["idx"] = 2, ["color"] = 4278234495,},
	}

	ext_tbl["DiyTex"] =
	{
		[1] = {["idx"] = 1, ["tex_id"] = 3, ["tex_color"] = 4278234495, },
		[2] = {["idx"] = 3, ["tex_id"] = 5, ["tex_color"] = 4278234495, },
	}
]]
	local DyeingString = --[[!AUTO_638]]""

	local sCanDyeing1 = --[[!]]"该装备可否固定染色"
	local sCanDyeing2 = --[[!]]"该装备可否随机染色"
	local sCanCustomizeImg = --[[!]]"该装备可否印染标志"
	local sCanDiyTexFix = --[[!]]"该装备可否刺绣纹理"
	local sCanDiyTexRandom = --[[!]]"该装备可否随机刺绣纹理"
	local bCanDyeing1, iCanDyeing1 = DescUtility:GetItemDBProp(tid, cid, sCanDyeing1)
	local bCanDyeing2, iCanDyeing2 = DescUtility:GetItemDBProp(tid, cid, sCanDyeing2)
	local bCanCustomizeImg, iCanCustomizeImg = DescUtility:GetItemDBProp(tid, cid, sCanCustomizeImg)
	local bCanDiyTexFix, iCanDiyTexFix = DescUtility:GetItemDBProp(tid, cid, sCanDiyTexFix)
	local bCanDiyTexRandom, iCanDiyTexRandom = DescUtility:GetItemDBProp(tid, cid, sCanDiyTexRandom)

	--local strDbg = string.format("tid %d: CanClrFix %d, CanClrRnd %d, CanPrintIcon %d, CanTexFix %d, CanTexRnd %d",
	--		tid, iCanDyeing1, iCanDyeing2, iCanCustomizeImg, iCanDiyTexFix, iCanDiyTexRandom)
	--LogPrint(strDbg)

	if iCanDyeing1 == 0 and iCanDyeing2 == 0 and iCanCustomizeImg == 0 and iCanDiyTexFix == 0 and iCanDiyTexRandom == 0 then
		DyeingString = FASHIONEQUIP_CANT_DYEING_TEXT
	else
		DyeingString = FASHIONEQUIP_CAN_DYEING_TEXT
		--LogPrint(DyeingString)
		if iCanCustomizeImg == 1 then
			DyeingString = DyeingString .. FASHIONEQUIP_CAN_CUSTOMIZEIMG_TEXT
		end
		if iCanDiyTexFix == 1 or iCanDiyTexRandom == 1 then
			DyeingString = DyeingString .. FASHIONEQUIP_CAN_DIYTEX_TEXT
		end

		--	普通染色
		if iCanDyeing1 == 1 or iCanDyeing2 == 1 then
			DyeingString = DyeingString  .. "\r" .. FASHIONEQUIP_COLOR_TEXT_TOTAL

			local bCanColorPartCount, iCanColorPartCount = DescUtility:GetItemDBProp(tid, cid, --[[!]]"该装备可以染色的部位数量")

			if ext_tbl["Dyeing"] == nil then
				local sRandomColor = --[[!]]"该装备初始颜色是否随机"
				local bRandomColor, iRandomColor = DescUtility:GetItemDBProp(tid, cid, sRandomColor)
				if iRandomColor == 1 then
					for i = 1, iCanColorPartCount do
						local sPartNameTmpl = --[[!]]"该装备染色部位" .. i .. --[[!]]"名称"
						local bPartName, sPartName = DescUtility:GetItemDBProp(tid, cid, sPartNameTmpl)
						DyeingString = DyeingString .. --[[!AUTO_640]]"\r" .. string.format(FASHIONEQUIP_COLOR_TEXT_RANDOM, sPartName)
					end
				else
					for j = 1, iCanColorPartCount do
						local sPartNameTmpl = --[[!]]"该装备染色部位" .. j .. --[[!]]"名称"
						local bPartName, sPartName = DescUtility:GetItemDBProp(tid, cid, sPartNameTmpl)

						local sPartColorTmpl = --[[!]]"该装备染色部位" .. j .. --[[!]]"初始的颜色"
						local bPartColorTmpl, iPartColorTmpl = DescUtility:GetItemDBProp(tid, cid, sPartColorTmpl)
						DyeingString = DyeingString .. --[[!AUTO_643]]"\r" .. DescUtility:GenerateColorString(string.format(FASHIONEQUIP_COLOR_TEXT_ORIGIN, sPartName), iPartColorTmpl + 2^32)
					end
				end
				DyeingString = DyeingString .. --[[!AUTO_644]]""

			else
				local partcount = 0
				for k, v in pairs(ext_tbl["Dyeing"]) do
					partcount = partcount + 1
					local sPartNameTmpl = --[[!]]"该装备染色部位" .. v["idx"] .. --[[!]]"名称"
					local bPartName, sPartName = DescUtility:GetItemDBProp(tid, cid, sPartNameTmpl)
					DyeingString = DyeingString .. --[[!AUTO_645]]"\r" .. DescUtility:GenerateColorString(string.format(FASHIONEQUIP_COLOR_TEXT, sPartName), v["color"])
					--LogPrint(DescUtility:GenerateColorString(string.format(FASHIONEQUIP_COLOR_TEXT, sPartName), v["color"]))
					--DyeingString = DyeingString .. "\r" .. DescUtility:GenerateColorString(string.format(FASHIONEQUIP_COLOR_TEXT, partcount, sPartName), v["color"] + 2^32)
				end

			end
		end

		--	标志印染
		if iCanCustomizeImg == 1 then
			DyeingString = DyeingString  ..  "\r" .. FASHIONEQUIP_CUSTOMIZEIMG_TEXT_TOTAL
			local printicon_idx = ext_tbl["PrintIcon"];
			if printicon_idx  == nil then
				local sDefaultImg = --[[!]]"该装备印染标志默认图案"
				local bDefaultImg, iDefaultImg = DescUtility:GetItemDBProp(tid, cid, sDefaultImg)
				DyeingString = DyeingString .. string.format(FASHIONEQUIP_CUSTOMIZEIMG_TEXT_2 , FASHIONEQUIP_CUSTOMIZEIMG_TEXT[iDefaultImg + 1] or FASHIONEQUIP_CUSTOMIZEIMG_TEXT_DEFAULT)
			else
				DyeingString = DyeingString .. string.format(FASHIONEQUIP_CUSTOMIZEIMG_TEXT_2 , FASHIONEQUIP_CUSTOMIZEIMG_TEXT[printicon_idx + 1] or FASHIONEQUIP_CUSTOMIZEIMG_TEXT_DEFAULT)
			end
		end

		--	刺绣
		if iCanDiyTexFix == 1 or iCanDiyTexRandom == 1 then
			DyeingString = DyeingString  .. "\r" .. FASHIONEQUIP_DIYTEX_TEXT_TOTAL

			local bCanTexPartCount, iCanTexPartCount = DescUtility:GetItemDBProp(tid, cid, --[[!]]"该装备刺绣纹理的部位数量")

			local tab_diytex = ext_tbl["DiyTex"]
			if tab_diytex == nil then
				local bRandomColor, iRandomColor = DescUtility:GetItemDBProp(tid, cid, --[[!]]"该装备初始纹理的颜色是否随机")

				for i = 1, iCanTexPartCount do
					local idxRealPartName = --[[!]]"刺绣" .. i .. --[[!]]"对应的部位"
					local bidxRealPart, idxRealPart = DescUtility:GetItemDBProp(tid, cid, idxRealPartName)

					if bidxRealPart and idxRealPart > 0 then

						local idInitTexName = --[[!]]"该装备部位" .. idxRealPart .. --[[!]]"的初始纹理"
						local bInitTex, idInitTex = DescUtility:GetItemDBProp(tid, cid, idInitTexName)
						local sInitTexName = FASHIONEQUIP_DIYTEX_INITTEX_NONE
						if idInitTex ~= 0 then
						 	sInitTexName = FASHIONEQUIP_DIYTEX_ICON_TEXT[idInitTex]
						end

						local sPartNameTmpl = --[[!]]"该装备染色部位" .. idxRealPart .. --[[!]]"名称"
						local bPartName, sPartName = DescUtility:GetItemDBProp(tid, cid, sPartNameTmpl)

						if iRandomColor == 1 then -- 初始随机颜色
							DyeingString = DyeingString .. "\r" .. string.format(FASHIONEQUIP_DIYTEX_TEXT_ORIGIN, sPartName, sInitTexName)
									.. "\r" .. FASHIONEQUIP_DIYTEX_COLOR_PREFIX .. FASHIONEQUIP_RANDOM_STRING

						else -- 初始固定颜色
							local sPartColorTmpl = --[[!]]"该装备部位" .. idxRealPart .. --[[!]]"纹理的初始颜色"
							local bPartColorTmpl, iPartColorTmpl = DescUtility:GetItemDBProp(tid, cid, sPartColorTmpl)

							DyeingString = DyeingString .. "\r" .. string.format(FASHIONEQUIP_DIYTEX_TEXT_ORIGIN, sPartName, sInitTexName)
									.. "\r" .. DescUtility:GenerateColorString(FASHIONEQUIP_DIYTEX_COLOR_PREFIX, iPartColorTmpl + 2^32)
						end

					end
				end

			else
				for i = 1, iCanTexPartCount do
					local flag = false
					local cixiu_arr
					for k, v in pairs(tab_diytex) do
						if i == v["idx"] then
							cixiu_arr = v
							flag = true
							break
						end
					end
					if flag == true then
						local idx = i
						local idxRealPartName = --[[!]]"刺绣" .. idx .. --[[!]]"对应的部位"
						local bidxRealPart, idxRealPart = DescUtility:GetItemDBProp(tid, cid, idxRealPartName)

						if bidxRealPart and idxRealPart > 0 then
							local sPartNameTmpl = --[[!]]"该装备染色部位" .. idxRealPart .. --[[!]]"名称"
							local bPartName, sPartName = DescUtility:GetItemDBProp(tid, cid, sPartNameTmpl)
							local idTex = cixiu_arr["tex_id"]
							local sTexName = FASHIONEQUIP_DIYTEX_ICON_TEXT[idTex]
							if sTexName == nil then
								sTexName = "(nil)"
							end

							--strDbg = string.format("Tex[%d]: id %d, Name %s", idx, idTex, sTexName )
							--LogPrint(strDbg)

							local texColor = cixiu_arr["tex_color"]

							DyeingString = DyeingString .. "\r" .. string.format(FASHIONEQUIP_DIYTEX_TEXT, sPartName, sTexName,cixiu_arr["tex_scale"]-cixiu_arr["tex_scale"]%0.001)
									.. "\r" .. DescUtility:GenerateColorString(FASHIONEQUIP_DIYTEX_COLOR_PREFIX, texColor)
						end
					else
						local idxRealPartName = --[[!]]"刺绣" .. i .. --[[!]]"对应的部位"
						local bidxRealPart, idxRealPart = DescUtility:GetItemDBProp(tid, cid, idxRealPartName)

						if bidxRealPart and idxRealPart > 0 then

							local idInitTexName = --[[!]]"该装备部位" .. idxRealPart .. --[[!]]"的初始纹理"
							local bInitTex, idInitTex = DescUtility:GetItemDBProp(tid, cid, idInitTexName)
							local sInitTexName = FASHIONEQUIP_DIYTEX_INITTEX_NONE
							if idInitTex ~= 0 then
								sInitTexName = FASHIONEQUIP_DIYTEX_ICON_TEXT[idInitTex]
							end

							local sPartNameTmpl = --[[!]]"该装备染色部位" .. idxRealPart .. --[[!]]"名称"
							local bPartName, sPartName = DescUtility:GetItemDBProp(tid, cid, sPartNameTmpl)

							--if iRandomColor == 1 then -- 初始随机颜色
							DyeingString = DyeingString .. "\r" .. string.format(FASHIONEQUIP_DIYTEX_TEXT_ORIGIN, sPartName, sInitTexName)
										.. "\r" .. FASHIONEQUIP_DIYTEX_COLOR_PREFIX .. FASHIONEQUIP_RANDOM_STRING

							--else -- 初始固定颜色
							--	local sPartColorTmpl = --[[!]]"该装备部位" .. idxRealPart .. --[[!]]"纹理的初始颜色"
							--	local bPartColorTmpl, iPartColorTmpl = DescUtility:GetItemDBProp(tid, cid, sPartColorTmpl)

							--	DyeingString = DyeingString .. "\r" .. string.format(FASHIONEQUIP_DIYTEX_TEXT_ORIGIN, sPartName, sInitTexName)
							--			.. "\r" .. DescUtility:GenerateColorString(FASHIONEQUIP_DIYTEX_COLOR_PREFIX, iPartColorTmpl + 2^32)
							--end
						end
					end
				end
			end
		end

	end
	
	--风格
	local styleNameTbl = DescUtility:GetFashionStyle(tid)
	if styleNameTbl and #styleNameTbl > 0 then
		DyeingString = DyeingString.."\r時裝風格:\r"
		for i = 1, #styleNameTbl do
			DyeingString = DyeingString..string.format("『%s』", styleNameTbl[i])
			if i ~= #styleNameTbl then
				DyeingString = DyeingString.."、"
			end
		end
	end

	return DyeingString
end

--暗器分类
function DescUtility:GetAnQiEquipType(tid, cid)
	local sAnqiType = --[[!]]"暗器器具类型"
	local bAnqiType, iAnqiType = DescUtility:GetItemDBProp(tid, cid, sAnqiType)
	return ANQI_TYPE[iAnqiType + 1] or ANQI_TYPE_DEFAULT
end

--印染图案名字表
function DescUtility:GetFixEquipIconNames()
	return	FASHIONEQUIP_CUSTOMIZEIMG_TEXT
end

--刺绣图案名字表
function DescUtility:GetEquipDiyTexIconNames()
	return FASHIONEQUIP_DIYTEX_ICON_TEXT
end

--刺绣图案分类名称表
function DescUtility:GetEquipDiyTexClassNames()
	return FASHIONEQUIP_DIYTEX_CLASS_TEXT
end


-- 获取卡牌名称
function DescUtility:GetItemCardName(tid, cid)

	local sColor = DescUtility:GetCardQualityColor(tid, cid)  --ITEM_COLOR_DESC[iQuality+1] or ITEM_COLOR_DESC[1]
	local _, sTitle = DescUtility:GetItemDBProp(tid,cid,--[[!AUTO_9]]"t_name")

	if TestShowItemId and TestShowItemId == 1 then --调试模式d_script TestShowItemId = 1
		return string.format(--[[!AUTO_13]]"%s%s", sColor, sTitle) .. --[[!AUTO_14]]"(" .. tid .. --[[!AUTO_15]]")"
	else
			return string.format(--[[!AUTO_17]]"%s%s", sColor, sTitle)
	end

end

-- 获取卡牌品质颜色
function DescUtility:GetCardQualityColor(tid, cid)
	local sQlt = --[[!AUTO_8]]""
	sQlt = --[[!]]"品质"
	local _, iQuality = DescUtility:GetItemDBProp(tid,cid,sQlt)


	local sColor = ITEM_COLOR_DESC[iQuality+1] or ITEM_COLOR_DESC[1]

	return string.format(--[[!AUTO_17]]"%s", sColor)

end


-- 获取装备最终属性（基值 + 步长*强化等级 + 步长*注灵等级）
function DescUtility:GetEquipFinalValue(extrand1, extrand2, extparam1, extparam2, extparam3, type)

	local value = 0
	if type == 1 then
		value = extparam1 + extrand1 * extparam2 + extrand2 * extparam3
	else
		value = DescUtility:GetEquipRandValue(extrand1, extparam1, extparam2)
	end

	return value

end

-- 获取装备注灵等级
function DescUtility:GetEquipmentAnimaLevel(tid, cid, ext_tbl)

	return string.format(ITEM_LIMIT_DESC[45], ext_tbl["EquipAnimaLevel"])

end

-- 获取装备注灵上限
function DescUtility:GetEquipmentAnimaMax(tid, cid, ext_tbl)

	return string.format(ITEM_LIMIT_DESC[46], ext_tbl["EquipAnimaMax"])

end

-- 获取装备基础属性描述
function DescUtility:GetAnimaEquipBaseProp(tid, cid, ext_tbl)

	if ext_tbl["EquipHasBaseAddonGroup"] == 0 then
		return ""
	end

	--最终显示字符串
	local outerAtk = ""
	local innerAtk = ""
	local outDefence = ""
	local inDefence = ""
	local HP = ""
	local MP = ""
	local CRIT = ""
	local EXPERT = ""
    local RESIST = ""

    --基础属性
    local outerAtkValue = 0
	local innerAtkValue = 0
	local outDefenceValue = 0
	local inDefenceValue = 0
	local HPValue = 0
	local MPValue = 0
	local CRITValue = 0
	local EXPERTValue = 0
    local RESISTValue = 0

    --强化增加的属性
    local outerAtkValueAddon = 0
	local innerAtkValueAddon = 0
	local outDefenceValueAddon = 0
	local inDefenceValueAddon = 0
	local HPValueAddon = 0
	local MPValueAddon = 0
	local CRITValueAddon = 0
	local EXPERTValueAddon = 0
    local RESISTValueAddon = 0

	local t_equipbase = DescUtility:CopyTable(ext_tbl["EquipBaseProp"])

	for i = 1 , t_equipbase["ext_prop_count"] do
		local extrand1 = t_equipbase[--[[!AUTO_505]]"ext_prop_" .. i .. --[[!AUTO_506]]"_rand1"]
		local extrand2 = t_equipbase[--[[!AUTO_505]]"ext_prop_" .. i .. --[[!AUTO_506]]"_rand2"]
		local exttype = t_equipbase[--[[!AUTO_507]]"ext_prop_" .. i .. --[[!AUTO_508]]"_type"]
		local extcalctype = t_equipbase[--[[!AUTO_507]]"ext_prop_" .. i .. --[[!AUTO_508]]"_calctype"]
		local extparam1 = t_equipbase[--[[!AUTO_509]]"ext_prop_" .. i .. --[[!AUTO_510]]"_param1"]
		local extparam2 = t_equipbase[--[[!AUTO_511]]"ext_prop_" .. i .. --[[!AUTO_512]]"_param2"]
		local extparam3 = t_equipbase[--[[!AUTO_513]]"ext_prop_" .. i .. --[[!AUTO_514]]"_param3"]
		local extvalue = DescUtility:GetEquipFinalValue(extrand1, extrand2, extparam1, extparam2, extparam3, extcalctype)
		if exttype == 129 then
			outerAtkValue = extparam1
			outerAtkValueAddon = extvalue - extparam1
		elseif exttype == 130 then
			innerAtkValue = extparam1
			innerAtkValueAddon = extvalue - extparam1
		elseif exttype == 30 then
			outDefenceValue = extparam1
			outDefenceValueAddon = extvalue - extparam1
		elseif exttype == 41 then
			inDefenceValue = extparam1
			inDefenceValueAddon = extvalue - extparam1
		elseif exttype == 9 then
			HPValue = extparam1
			HPValueAddon = extvalue - extparam1
		elseif exttype == 10 then
			MPValue = extparam1
			MPValueAddon = extvalue - extparam1
		elseif exttype == 144 then
			CRITValue = extparam1
			CRITValueAddon = extvalue - extparam1
		elseif exttype == 145 then
			EXPERTValue = extparam1
			EXPERTValueAddon = extvalue - extparam1
		elseif exttype == 146 then
			RESISTValue = extparam1
			RESISTValueAddon = extvalue - extparam1
		end
	end

	-- 显示外攻
	if outerAtkValue == 0 then
		outerAtk = ""
	elseif ext_tbl["EquipPropLevel"] > 0 then
		outerAtk = string.format(EQUIP_BASEPROP_OUTERATK_ADD, TAG_COLOR_ESSENCE[12], outerAtkValue+outerAtkValueAddon, TAG_COLOR_CHANNEL[1], outerAtkValue)
	else
	    outerAtk = string.format(EQUIP_BASEPROP_OUTERATK,TAG_COLOR_CHANNEL[1],outerAtkValue)
	end


	-- 显示内攻
	if innerAtkValue == 0 then
		innerAtk = ""
	elseif ext_tbl["EquipPropLevel"] > 0 then
		innerAtk = string.format(EQUIP_BASEPROP_OUTERATK_ADD, TAG_COLOR_ESSENCE[12], innerAtkValue+innerAtkValueAddon, TAG_COLOR_CHANNEL[1], innerAtkValue)
	else
	    innerAtk = string.format(EQUIP_BASEPROP_OUTERATK,TAG_COLOR_CHANNEL[1],innerAtkValue)
	end

    --显示外防
	if outDefenceValue == 0 then
	    outDefence = ""
	elseif ext_tbl["EquipPropLevel"] > 0 then
		outDefence = string.format(EQUIP_BASEPROP_OUTERDEF_ADD,TAG_COLOR_ESSENCE[12],outDefenceValue+outDefenceValueAddon,TAG_COLOR_CHANNEL[1],outDefenceValue)
    else
	    outDefence = string.format(EQUIP_BASEPROP_OUTERDEF,TAG_COLOR_CHANNEL[1],outDefenceValue)
	end

	--显示内防
	if inDefenceValue  == 0 then
	    inDefence = ""
	elseif ext_tbl["EquipPropLevel"] > 0 then
		inDefence = string.format(EQUIP_BASEPROP_INNERDEF_ADD,TAG_COLOR_ESSENCE[12],inDefenceValue+inDefenceValueAddon,TAG_COLOR_CHANNEL[1],inDefenceValue)
    else
	    inDefence = string.format(EQUIP_BASEPROP_INNERDEF,TAG_COLOR_CHANNEL[1],inDefenceValue)
	end

	--显示HP
	if  HPValue  == 0 then
		HP = ""
	elseif ext_tbl["EquipPropLevel"] > 0 then
		HP = string.format(EQUIP_BASEPROP_HP_ADD,TAG_COLOR_ESSENCE[12],HPValue+HPValueAddon,TAG_COLOR_CHANNEL[1],HPValue)
    else
		HP = string.format(EQUIP_BASEPROP_HP,TAG_COLOR_CHANNEL[1],HPValue)
    end

     --显示MP1
	if MPValue == 0 then
		MP1 = ""
	elseif ext_tbl["EquipPropLevel"] > 0 then
		MP1 = string.format(EQUIP_BASEPROP_MP1_ADD,TAG_COLOR_ESSENCE[12],MPValue+MPValueAddon,TAG_COLOR_CHANNEL[1],MPValue)
	else
		MP1 = string.format(EQUIP_BASEPROP_MP1,TAG_COLOR_CHANNEL[1],MPValue)
	end

	--显示CRIT
	if CRITValue == 0 then
		CRIT = ""
	elseif ext_tbl["EquipPropLevel"] > 0 then
		CRIT = string.format(EQUIP_BASEPROP_CRIT_ADD,TAG_COLOR_ESSENCE[12],CRITValue+CRITValueAddon,TAG_COLOR_CHANNEL[1],CRITValue)
	else
		CRIT = string.format(EQUIP_BASEPROP_CRIT,TAG_COLOR_CHANNEL[1],CRITValue)
	end

	--显示EXPERT
	if EXPERTValue == 0 then
		EXPERT = ""
	elseif ext_tbl["EquipPropLevel"] > 0 then
		EXPERT = string.format(EQUIP_BASEPROP_EXPERT_ADD,TAG_COLOR_ESSENCE[12],EXPERTValue+EXPERTValueAddon,TAG_COLOR_CHANNEL[1],EXPERTValue)
	else
		EXPERT = string.format(EQUIP_BASEPROP_EXPERT,TAG_COLOR_CHANNEL[1],EXPERTValue)
	end

	--显示RESIST
	if RESISTValue == 0 then
		RESIST = ""
	elseif ext_tbl["EquipPropLevel"] > 0 then
		RESIST = string.format(EQUIP_BASEPROP_RESIST_ADD,TAG_COLOR_ESSENCE[12],RESISTValue+RESISTValueAddon,TAG_COLOR_CHANNEL[1],RESISTValue)
	else
		RESIST = string.format(EQUIP_BASEPROP_RESIST,TAG_COLOR_CHANNEL[1],RESISTValue)
	end

	local finaltext = DescUtility:StringCombiner({outerAtk, innerAtk, outDefence, inDefence, HP , MP1, CRIT, EXPERT, RESIST})
	return finaltext

end

-- 获取装备附加随即属性描述
function DescUtility:GetAnimaEquipAddonPropDesc(tid, cid, ext_tbl)

	if ext_tbl["EquipHasBaseAddonGroup"] == 0 then
		return ""
	end

	local t_equipaddon = DescUtility:CopyTable(ext_tbl["EquipEssAddon"])

	local fixedpropcount = 0
	local ctprop = {}
	for i = 1, 8 do
		_, ctprop[i] = DescUtility:GetItemDBProp(t_equipaddon["ext_group_id"],ClassType.ICID_ADDON_GROUP,--[[!]]"基础附加属性" .. i)
		if ctprop[i] > 0 then
			fixedpropcount = fixedpropcount + 1
		end
	end

	local proplevel = {}
	local proptable = {}
	for i = 1 , t_equipaddon["ext_prop_count"] do
		local extrand1 = t_equipaddon[--[[!AUTO_505]]"ext_prop_" .. i .. --[[!AUTO_506]]"_rand1"]
		local extrand2 = t_equipaddon[--[[!AUTO_505]]"ext_prop_" .. i .. --[[!AUTO_506]]"_rand2"]
		local exttype = t_equipaddon[--[[!AUTO_507]]"ext_prop_" .. i .. --[[!AUTO_508]]"_type"]
		local extcalctype = t_equipaddon[--[[!AUTO_507]]"ext_prop_" .. i .. --[[!AUTO_508]]"_calctype"]
		local extparam1 = t_equipaddon[--[[!AUTO_509]]"ext_prop_" .. i .. --[[!AUTO_510]]"_param1"]
		local extparam2 = t_equipaddon[--[[!AUTO_511]]"ext_prop_" .. i .. --[[!AUTO_512]]"_param2"]
		local extparam3 = t_equipaddon[--[[!AUTO_513]]"ext_prop_" .. i .. --[[!AUTO_514]]"_param3"]
		local extvalue = DescUtility:GetEquipFinalValue(extrand1, extrand2, extparam1, extparam2, extparam3, extcalctype)
		proplevel[i] = string.format(ANIMA_EQUIP_DES[1], extrand2)
		proptable[i] = self:GetExtStr(exttype, extvalue, extparam2, extparam3)
	end

	--客户端本地生产
	local randomstring = ""
	if ext_tbl["EquipPropUnknow"] == 1 then

		local _, gentype = DescUtility:GetItemDBProp(t_equipaddon["ext_group_id"],ClassType.ICID_ADDON_GROUP, "附加屬性生成類型")
		if gentype == 0 then
			local rdcountlow = 1
			local rdcounthigh = 0
			local propid = 0
			local propprob = 0
			for i = 1, 32 do
				_, propid = DescUtility:GetItemDBProp(t_equipaddon["ext_group_id"],ClassType.ICID_ADDON_GROUP,"附加屬性" .. i)
				_, propprob = DescUtility:GetItemDBProp(t_equipaddon["ext_group_id"],ClassType.ICID_ADDON_GROUP,"附加屬性" .. i .. "的出現幾率")
				if propid > 0 and propprob > 0.0000001 then
					rdcounthigh = rdcounthigh + 1
				end
			end
			if rdcounthigh > 1 then
				randomstring = string.format(EQUIP_ESSPROP_RANDOMADD_LOWHIGH, rdcountlow, rdcounthigh)
			else
				randomstring = string.format(EQUIP_ESSPROP_RANDOMADD_SELECT, rdcountlow)
			end
		elseif gentype == 1 then
			randomstring = string.format(EQUIP_ESSPROP_RANDOMADD_SELECT, 1)
		elseif gentype == 2 then
			local rdprop = {}
			local rdcountlow = 0
			local rdcounthigh = 0
			for j = 0, 8 do
				_, rdprop[j] = DescUtility:GetItemDBProp(t_equipaddon["ext_group_id"],ClassType.ICID_ADDON_GROUP,--[[!]]"出现" .. j .. --[[!]]"个随机属性的概率")
				if rdcountlow == 0 then
					if rdprop[j] > 0 then
						rdcountlow = j
					end
				else
					if rdprop[j] > 0 then
						rdcounthigh = j
					end
				end
				if rdcountlow > 0 then
					if rdcounthigh > 0 then
						randomstring = string.format(EQUIP_ESSPROP_RANDOMADD_LOWHIGH, rdcountlow, rdcounthigh)
					else
						randomstring = string.format(EQUIP_ESSPROP_RANDOMADD_SELECT, rdcountlow)
					end
				end
			end
		end

	end

	--附加属性
	local fixedstress = {}
	local fixedstress_rand = {}
	for m = 1, fixedpropcount do
		fixedstress[m] = proptable[m]
	end
	if #proptable > fixedpropcount then
		for m = fixedpropcount+1,#proptable do
			fixedstress_rand[m-fixedpropcount] = proptable[m]
		end
	end

	--注灵等级
	local fixedlevel = {}
	local randlevel = {}
	for m = 1, fixedpropcount do
		fixedlevel[m] = proplevel[m]
	end
	if #proplevel > fixedpropcount then
		for m = fixedpropcount+1,#proplevel do
			randlevel[m-fixedpropcount] = proplevel[m]
		end
	end

	--排序
	if #proptable > fixedpropcount+1 then
		for i = 1,#fixedstress_rand-1 do
			for j = i+1,#fixedstress_rand do
				if string.len(fixedstress_rand[i]) > string.len(fixedstress_rand[j]) then
					fixedstress_rand[i],fixedstress_rand[j] = fixedstress_rand[j],fixedstress_rand[i]
					randlevel[i],randlevel[j] = randlevel[j],randlevel[i]
				end
			end
		end
	end

	local finaltextprop = TAG_COLOR_ESSENCE[14] .. DescUtility:StringCombiner(fixedstress) .. --[[!AUTO_559]]"\r" .. TAG_COLOR_ESSENCE[1] .. DescUtility:StringCombiner(fixedstress_rand)
	local finaltextlevel = TAG_COLOR_ESSENCE[14] .. DescUtility:StringCombiner(fixedlevel) .. --[[!AUTO_559]]"\r" .. TAG_COLOR_ESSENCE[1] .. DescUtility:StringCombiner(randlevel)

	if randomstring ~= "" then
		finaltextprop = finaltextprop .. randomstring
	end

	return finaltextprop, finaltextlevel

end

-- 获取装备强化激活属性描述
function DescUtility:GetAnimaEquipReinforcePropDesc(tid, cid, ext_tbl)

	local everyreinforceaddontextcount = {}
	local reinforceaddontext = {}
	local condition = {}

	local textcount = 0
	for i = 1, ext_tbl["EquipMaxReinforceAddonPropertyCount"] do
		local t_reinforceaddon = DescUtility:CopyTable(ext_tbl["EquipReinforceAddonProp" .. i])

		local proptable = {}
		for j = 1 , t_reinforceaddon["ext_prop_count"] do
			local extrand1 = t_reinforceaddon[--[[!AUTO_505]]"ext_prop_" .. j .. --[[!AUTO_506]]"_rand1"]
			local extrand2 = t_reinforceaddon[--[[!AUTO_505]]"ext_prop_" .. j .. --[[!AUTO_506]]"_rand2"]
			local exttype = t_reinforceaddon[--[[!AUTO_507]]"ext_prop_" .. j .. --[[!AUTO_508]]"_type"]
			local extcalctype = t_reinforceaddon[--[[!AUTO_507]]"ext_prop_" .. i .. --[[!AUTO_508]]"_calctype"]
			local extparam1 = t_reinforceaddon[--[[!AUTO_509]]"ext_prop_" .. j .. --[[!AUTO_510]]"_param1"]
			local extparam2 = t_reinforceaddon[--[[!AUTO_511]]"ext_prop_" .. j .. --[[!AUTO_512]]"_param2"]
			local extparam3 = t_reinforceaddon[--[[!AUTO_513]]"ext_prop_" .. j .. --[[!AUTO_514]]"_param3"]
			local extvalue = DescUtility:GetEquipFinalValue(extrand1, extrand2, extparam1, extparam2, extparam3, extcalctype)
			proptable[j] = self:GetExtStr(exttype, extvalue, extparam2, extparam3)

			textcount = textcount + 1
			reinforceaddontext[textcount] = proptable[j]--DescUtility:StringCombiner(proptable[j])
			condition[textcount] = string.format(ANIMA_EQUIP_DES[2], i*6)
		end

		--condition[i] = string.format(ANIMA_EQUIP_DES[2], i*6)
		--reinforceaddontext[i] = DescUtility:StringCombiner(proptable)
		everyreinforceaddontextcount[i] = t_reinforceaddon["ext_prop_count"]
	end

	local activeprop = {}
	local inactiveprop = {}
	local addonpropcount = ext_tbl["EquipCurReinforceAddonPropertyCount"]
	local activepropindex = 0
	for m = 1, addonpropcount do
		for i=1, everyreinforceaddontextcount[m] do
			activepropindex = activepropindex + 1
			activeprop[activepropindex] = TAG_COLOR_ESSENCE[1] .. reinforceaddontext[activepropindex] .. "\t" .. TAG_COLOR_ESSENCE[1] .. condition[activepropindex]
		end
	end

	if #reinforceaddontext > activepropindex then
		local inactivepropindex = activepropindex
		for m = addonpropcount+1,ext_tbl["EquipMaxReinforceAddonPropertyCount"] do
			for i=1, everyreinforceaddontextcount[m]do
				inactivepropindex = inactivepropindex + 1
				inactiveprop[inactivepropindex-activepropindex] = TAG_COLOR_ESSENCE[6] .. reinforceaddontext[inactivepropindex] .. "\t" .. TAG_COLOR_ESSENCE[6] .. condition[inactivepropindex]
			end
		end
	end

	local finaltext
	if #activeprop == #reinforceaddontext then
		finaltext = TAG_COLOR_ESSENCE[1] .. DescUtility:StringCombiner(activeprop)
	elseif #activeprop > 0 and #activeprop < #reinforceaddontext then
		finaltext = TAG_COLOR_ESSENCE[1] .. DescUtility:StringCombiner(activeprop) .. "\r" .. TAG_COLOR_ESSENCE[6] .. DescUtility:StringCombiner(inactiveprop)
	else
		finaltext = TAG_COLOR_ESSENCE[6] .. DescUtility:StringCombiner(inactiveprop)
	end

	return finaltext

end

-- 获取装备固定属性描述
function DescUtility:GetAnimaEquipFixPropDesc(tid, cid, ext_tbl)

	local t_equipfix = DescUtility:CopyTable(ext_tbl["EquipFixProp"])

	local proptable = {}
	for i = 1 , t_equipfix["ext_prop_count"] do
		local extrand1 = t_equipfix[--[[!AUTO_505]]"ext_prop_" .. i .. --[[!AUTO_506]]"_rand1"]
		local extrand2 = t_equipfix[--[[!AUTO_505]]"ext_prop_" .. i .. --[[!AUTO_506]]"_rand2"]
		local exttype = t_equipfix[--[[!AUTO_507]]"ext_prop_" .. i .. --[[!AUTO_508]]"_type"]
		local extcalctype = t_equipfix[--[[!AUTO_507]]"ext_prop_" .. i .. --[[!AUTO_508]]"_calctype"]
		local extparam1 = t_equipfix[--[[!AUTO_509]]"ext_prop_" .. i .. --[[!AUTO_510]]"_param1"]
		local extparam2 = t_equipfix[--[[!AUTO_511]]"ext_prop_" .. i .. --[[!AUTO_512]]"_param2"]
		local extparam3 = t_equipfix[--[[!AUTO_513]]"ext_prop_" .. i .. --[[!AUTO_514]]"_param3"]
		local extvalue = DescUtility:GetEquipFinalValue(extrand1, extrand2, extparam1, extparam2, extparam3, extcalctype)
		proptable[i] = self:GetExtStr(exttype, extvalue, extparam2, extparam3)
	end

	local finaltext = TAG_COLOR_ESSENCE[14] .. DescUtility:StringCombiner(proptable) .. " (不可強化，不可注靈)"
	return finaltext

end

-- 获取装备附魔属性描述
function DescUtility:GetAnimaEquipFomoPropDesc(tid, cid, ext_tbl)

	local addonDesc = ""
	local finaltext = ""

	if ext_tbl["EquipEnchanting"] ~= 0 then
		addonDesc = DescUtility:GetExtStr(77, ext_tbl["Enchant_SkillLevel"], 0, ext_tbl["Enchant_SkillTid"])
	elseif ext_tbl["EquipEnchantingAllSkills"] ~= 0 then
		addonDesc = ItemTip:GetSingleAddonDesc(ext_tbl["Enchant_AddonTid"], 0)
	else
		return ""
	end

	if ext_tbl["Enchant_AddonForever"] == 0 then
		local expireTimeDesc = DescUtility:GetExpireGMTTimeText(ext_tbl["Enchant_AddonExpire"], true)
		finaltext = ITEM_LIMIT_DESC[47]:format(addonDesc, expireTimeDesc)
	else
		finaltext = ITEM_LIMIT_DESC[48]:format(addonDesc)
	end

	return finaltext

end

-- 获取技能符文描述
function DescUtility:GetAnimaRuneDesc(tid, cid, ext_tbl)

	--技能描述
	local finaladdontext = ""
	local addonDesc = ""
	local _,level = DescUtility:GetItemDBProp(tid, cid, "技能等級")
	if ext_tbl["Rune_SkillID"] ~= 0 then
		addonDesc = DescUtility:GetExtStr(77, level, 0, ext_tbl["Rune_SkillID"])
	else
		addonDesc = "全武學技能 + 1"
	end
	finaladdontext = string.format("%s%s-%s",TAG_COLOR_ESSENCE[16], "附魔", addonDesc)

	--附魔位置描述
	local locatypetext = "可附魔位置："
	local finallocatypetext = ""
	local _,equiploca = DescUtility:GetItemDBProp(tid,cid,--[[!]]"可使用的装备部位")
	if bit.band(equiploca,4) > 0 then
		locatypetext = locatypetext .. "上裝."
	end
	if bit.band(equiploca,8) > 0 then
		locatypetext = locatypetext .. "下裝."
	end
	if bit.band(equiploca,2) > 0 then
		locatypetext = locatypetext .. "頭部."
	end
	if bit.band(equiploca,32) > 0 then
		locatypetext = locatypetext .. "護腕."
	end
	if bit.band(equiploca,16) > 0 then
		locatypetext = locatypetext .. "鞋."
	end
	if bit.band(equiploca,64) > 0 then
		locatypetext = locatypetext .. "項鍊."
	end
	if bit.band(equiploca,4096) > 0 then
		locatypetext = locatypetext .. "腰飾."
	end
	finallocatypetext = string.format("%s%s",TAG_COLOR_ESSENCE[104], locatypetext)

	finaltext = finaladdontext .. "\r\r" .. finallocatypetext

	return finaltext

end

-- 获取技能符文档次
function DescUtility:GetAnimaRuneLevel(tid, cid)

	local finaltext = ""
	local _,level = DescUtility:GetItemDBProp(tid, cid, "符文檔次")

	if level == 0 then
		finaltext = "生疏"
	elseif level == 1 then
		finaltext = "流暢"
	elseif level == 2 then
		finaltext = "熟練"
	elseif level == 3 then
		finaltext = "精通"
	else
		finaltext = "未知"
	end


	return finaltext

end

-- 获取AddonGroup描述
function DescUtility:GetAddonGroupFixedDesc( tbProp )
	-- body
	local rst = {}
	local tbAllProp = DescUtility:CopyTable( tbProp )
	local count = tbAllProp["addon_count"]
	for i=1,count do
		local addon_type = tbAllProp["addon_type".. i]
		local addon_value = tbAllProp["addon_value" .. i]
		if EQUIP_ESSENCE_TYPE[addon_type] ~= nil then
			if EQUIP_ESSENCE_TYPE[addon_type].class == 4 then
				addon_value = addon_value / 100
			end
			local strTemp = string.format(EQUIP_ESSENCE_TYPE[addon_type].style, addon_value)			
			rst[i] = strTemp
		end
	end

	return rst
end

function DescUtility:GetMedicineEffectLevel(tid, zoneid)

	local EXP_ITEM_LIST = {}
	EXP_ITEM_LIST[94820] =
	{
		{2308, 105},
	        {2366, 105},
	        {2310, 105},
	        {2304, 105},
	        {2305, 105},
	        {20484, 100},
	        {20611, 100},
	        {20486, 100},
	        {20489, 100},
	        {20494, 100},
	        {20495, 101},
	        {20498, 100},
	        {20562, 100},
	        {20582, 100},
	        {20586, 97},
	        {20600, 100},
	        {20615, 92},
	        {20618, 96},
	        {20626, 95},
	        {20627, 87},
	        {20629, 90},
	        {20631, 82},
	        {20632, 82},
	        {20634, 86},
	        {20636, 84},
	        {20637, 82},
	        {20638, 82},
	        {20639, 77},
	}
	EXP_ITEM_LIST[95009] =
	{
		{2308, 110},
	        {2366, 110},
	        {2310, 110},
	        {2304, 110},
	        {2305, 110},
	        {20484, 105},
	        {20611, 105},
	        {20486, 102},
	        {20489, 102},
	        {20494, 102},
	        {20495, 103},
	        {20498, 102},
	        {20562, 102},
	        {20582, 102},
	        {20586, 101},
	        {20600, 102},
	        {20615, 100},
	        {20618, 100},
	        {20626, 100},
	        {20627, 96},
	        {20629, 97},
	        {20631, 91},
	        {20632, 92},
	        {20634, 92},
	        {20636, 90},
	        {20637, 88},
	        {20638, 85},
	        {20639, 81},
	}
	EXP_ITEM_LIST[95261] =
	{
		{2308, 100},
		{2366, 100},
		{2310, 100},
		{2304, 100},
		{2305, 100},
		{20484, 100},
		{20611, 100},
		{20486, 100},
	        {20489, 100},
	        {20494, 100},
	        {20495, 100},
	        {20498, 100},
	        {20562, 100},
	        {20582, 100},
	        {20586, 100},
	        {20600, 100},
	        {20615, 100},
	        {20618, 100},
	        {20626, 100},
	        {20627, 96},
	        {20629, 96},
		{20631, 90},
	        {20632, 93},
	        {20634, 90},
	        {20636, 86},
	}
	EXP_ITEM_LIST[98544] = 
	{
                {2308, 112},
	        {2366, 112},
	        {2310, 112},
	        {2304, 115},
	        {2305, 115},
	        {20486, 112},
	        {20489, 112},
	        {20494, 112},
	        {20495, 112},
	        {20498, 112},
	        {20562, 112},
	        {20582, 112},
	        {20586, 112},
	        {20615, 112},
	        {20629, 115},
	        {20636, 111},
	        {20638, 111},
	        {20645, 101},
	        {20646, 115},
	        {20647, 115},
	        {20649, 89},
	        {20650, 83},
	        {20652, 76},
}
EXP_ITEM_LIST[99106] = 
{
	        {2304, 60},
	        {2305, 60},
	        {20653, 60},
	        {20654, 60},
	        {20655, 60},
}
EXP_ITEM_LIST[99215] = 
{
	        {2304, 100},
	        {2305, 100},
	        {20649, 100},
}
EXP_ITEM_LIST[99216] = 
{
	        {2304, 105},
	        {2305, 105},
	        {20649, 105},
}
EXP_ITEM_LIST[99217] = 
{
	        {2304, 110},
	        {2305, 110},
	        {20649, 110},
}
EXP_ITEM_LIST[99218] = 
{
	        {2304, 115},
	        {2305, 115},
	        {20486, 115},
}
EXP_ITEM_LIST[99653] = {
	        {2304, 119},
	        {2305, 119},
	        {20494, 119},
	        {20649, 107},
	        {20655, 83},
	        {20562, 118},
	        {20654, 86},
	        {20653, 89},
	        {20652, 94},
	        {20629, 117},
	        {20638, 115},
	        {20636, 117},
	        {20586, 117},
	        {20498, 118},
	        {20489, 117},
	        {20495, 117},
	        {20486, 118},
	        {20582, 116},
	        {20615, 117},
	        {20650, 96},
}
EXP_ITEM_LIST[100545] = {
	        {2304, 120},
	        {2305, 120},
	        {20486, 120},
	        {20489, 120},
	        {20494, 120},
	        {20582, 120},
	        {20629, 120},
	        {20638, 120},
	        {20650, 109},
	        {20653, 106},
	        {20657, 98},
	        {20658, 94},
	        {20660, 92},
	        {20662, 90},
	        {20664, 86},
	        {20665, 80},
}

	if EXP_ITEM_LIST[tid] ~= nil then
		for k,v in pairs(EXP_ITEM_LIST[tid]) do
			if v[1] == zoneid then
				return v[2]
			end
		end
	end

	return 0

end