--[[#tag push auto]]

---------------------------------------------------------------
--  created:   2009.08.04
--  author:    djh
--
--  buff描述
---------------------------------------------------------------
--GameApi.GetUserPetEnhance() 返回6个数，含义分别为：

--气血、内力、外攻、内攻、外防、内防


BuffTip = {}

--idBuff：buffid
--vTab[1~5]：buff的5个参数

--str：buff来源玩家名字

local BuffState = 
{
	BUFF_STATE_TRANSFORM = 0,   --普通变身
	BUFF_STATE_DISGUISE = 1,    --易容变身
	BUFF_STATE_ALIAS = 2,       --易容改名
	BUFF_STATE_INVADER = 3,     --偷羊相关
}


function BuffTip:GetBuffTip(idBuff,vTab,str)
	local buffnamefont = --[[!AUTO_1]]""
	local bufftipfont = --[[!AUTO_2]]""
	buffnamefont = --[[!AUTO_3]]"^O002"
	bufftipfont = --[[!AUTO_4]]"^O001"
	--^O001，能改变字体到现在的标准字体(雅黑10号），^O002对应雅黑12号字，^O003对应雅黑14号字
	local buffdetail = --[[!AUTO_5]]""
	local is_showid	= false		--是否显示id

	if BUFF_NAME_TEXT[idBuff] then
		buffdetail = string.format(--[[!AUTO_6]]"%s%s%s%-15s",buffnamefont,buffdetail,COLOUR_NEW_8,BUFF_NAME_TEXT[idBuff])
	else
		buffdetail = string.format(--[[!AUTO_7]]"%s%s%s%-15s",buffnamefont,buffdetail,COLOUR_NEW_8,BUFF_NAME_TEXT[-1])
	end

	if (not BUFF_NAME_TEXT[idBuff]) or (not BUFF_DETAIL_DESC[idBuff]) then is_showid = true end			--状态名缺失或者状态描述缺失时显示buff id
	if TestShowItemId and TestShowItemId == 1 then is_showid = true end									--测试模式下显示buff id
	if is_showid then
		buffdetail = string.format(--[[!AUTO_8]]"%s%s%4s%s%s%s",buffdetail,COLOUR_NEW_11,--[[!AUTO_9]]"",--[[!AUTO_10]]"(",idBuff,--[[!AUTO_11]]")")
	end

	if BUFF_DETAIL_DESC[idBuff] then
		buffdetail = string.format(--[[!AUTO_12]]"%s%s%s%s",buffdetail,--[[!AUTO_13]]"\r^ffffff",bufftipfont,BUFF_DETAIL_DESC[idBuff])
	else
		buffdetail = string.format(--[[!AUTO_14]]"%s%s%s%s",buffdetail,--[[!AUTO_15]]"\r^ffffff",bufftipfont,BUFF_DETAIL_DESC[-1])
	end

	if buffdetail == --[[!AUTO_16]]"" then
		buffdetail = ERROR_BUFF_DATA
	end

	buffdetail = BuffTextTransform(idBuff,buffdetail,vTab)

	----最后一行显示buff剩余时间
	local time_text = --[[!AUTO_17]]""
	local tsec = 0
	if vTab[6] >= 0 then
		tsec = math.floor(vTab[6])
		if tsec >= 86400 then						--显示xx天

			time_text = string.format(--[[!AUTO_18]]"\r\r%s%s%s%s%s",COLOUR_NEW_0,BUFFTIP_TIME_TITLE,COLOUR_NEW_5,string.format(BUFFTIP_TIME_DESC[5],math.floor(tsec/86400)),COLOUR_NEW_0)
		elseif tsec >= 3600 then					--显示xx小时
			time_text = string.format(--[[!AUTO_19]]"\r\r%s%s%s%s%s",COLOUR_NEW_0,BUFFTIP_TIME_TITLE,COLOUR_NEW_5,string.format(BUFFTIP_TIME_DESC[4],math.floor(tsec/3600)),COLOUR_NEW_0)
		elseif tsec >= 60 then						--显示xx分

			if (tsec%60) > 0 then time_text = string.format(--[[!AUTO_20]]"\r\r%s%s%s%s%s",COLOUR_NEW_0,BUFFTIP_TIME_TITLE,COLOUR_NEW_5,string.format(BUFFTIP_TIME_DESC[3],math.floor(tsec/60),(tsec%60)),COLOUR_NEW_0)
			else time_text = string.format(--[[!AUTO_21]]"\r\r%s%s%s%s%s",COLOUR_NEW_0,BUFFTIP_TIME_TITLE,COLOUR_NEW_5,string.format(BUFFTIP_TIME_DESC[2],math.floor(tsec/60)),COLOUR_NEW_0)
			end
		elseif tsec >= 0 then						--显示xx秒

			time_text = string.format(--[[!AUTO_22]]"\r\r%s%s%s%s%s",COLOUR_NEW_0,BUFFTIP_TIME_TITLE,COLOUR_NEW_5,string.format(BUFFTIP_TIME_DESC[1],tsec),COLOUR_NEW_0)
		end
	end
	buffdetail = string.format(--[[!AUTO_23]]"%s%s",buffdetail,time_text)

	return buffdetail
end


------------------------------------------------------------------------------
-----------------------------------通配符-------------------------------------
--#v1#~#v2# 状态包参数1~5
--#pv1#~#pv2# 状态包参数1~5,显示为百分比形式
--#sp1# 内功修为

function BuffTextTransform(buff_id,buff_text,vTab)
	local temp_str
	local i,j

	if buff_id == 249 then
		local v1,v2,v3,v4,v5,v6 = GameApi.GetUserPetEnhance()
		local val_tab = {}

		val_tab[1] = v1
		val_tab[2] = v2
		val_tab[3] = v3
		val_tab[4] = v4
		val_tab[5] = v5
		val_tab[6] = v6

		for i = 1, 6 do
			if val_tab[i] > 0 then
				temp_str = string.format(PET_COMBINE_TEXT[i],val_tab[i])
				buff_text = string.format(--[[!AUTO_24]]"%s\r%s",buff_text,temp_str)
			end
		end
	elseif buff_id == 717 then--变身buff显示
		local trans_id = vTab[1]
		if trans_id > 0 then
			local _,addon_group_tid = GameApi.GetItemDBProp(trans_id,1014, --[[!AUTO_25]]"附加屬性組")
			if addon_group_tid > 0 then
				local _,addon_tid1 = GameApi.GetItemDBProp(addon_group_tid,1001, --[[!AUTO_26]]"基礎附加屬性1")
				local _,addon_tid2 = GameApi.GetItemDBProp(addon_group_tid,1001, --[[!AUTO_27]]"基礎附加屬性2")
				local _,addon_tid3 = GameApi.GetItemDBProp(addon_group_tid,1001, --[[!AUTO_28]]"基礎附加屬性3")
				local _,addon_tid4 = GameApi.GetItemDBProp(addon_group_tid,1001, --[[!AUTO_29]]"基礎附加屬性4")
				if addon_tid1 > 0 then
					local _, type, param1, param2, param3 = GameApi.GetItemDBProp(addon_tid1, 1004, --[[!AUTO_30]]"type", --[[!AUTO_31]]"param1", --[[!AUTO_32]]"param2", --[[!AUTO_33]]"param3")
					buff_text  = buff_text .. --[[!AUTO_34]]"\r" .. string.format(EQUIP_ESSENCE_TYPE[type].style,param1)
				end
				if addon_tid2 > 0 then
					local _, type, param1, param2, param3 = GameApi.GetItemDBProp(addon_tid2, 1004, --[[!AUTO_35]]"type", --[[!AUTO_36]]"param1", --[[!AUTO_37]]"param2", --[[!AUTO_38]]"param3")
					buff_text  = buff_text .. --[[!AUTO_39]]"\r" .. string.format(EQUIP_ESSENCE_TYPE[type].style,param1)
				end
				if addon_tid3 > 0 then
					local _, type, param1, param2, param3 = GameApi.GetItemDBProp(addon_tid3, 1004, --[[!AUTO_40]]"type", --[[!AUTO_41]]"param1", --[[!AUTO_42]]"param2", --[[!AUTO_43]]"param3")
					buff_text  = buff_text .. --[[!AUTO_44]]"\r" .. string.format(EQUIP_ESSENCE_TYPE[type].style,param1)
				end
				if addon_tid4 > 0 then
					local _, type, param1, param2, param3 = GameApi.GetItemDBProp(addon_tid4, 1004, --[[!AUTO_45]]"type", --[[!AUTO_46]]"param1", --[[!AUTO_47]]"param2", --[[!AUTO_48]]"param3")
					buff_text  = buff_text .. --[[!AUTO_49]]"\r" .. string.format(EQUIP_ESSENCE_TYPE[type].style,param1)
				end
			end
		end
	else
		i ,j = string.find(buff_text,--[[!AUTO_50]]"#v1#")
		if i and j then
			buff_text = string.gsub(buff_text,--[[!AUTO_51]]"#v1#",math.floor(vTab[1]))
		end
		i ,j = string.find(buff_text,--[[!AUTO_52]]"#v2#")
		if i and j then
			buff_text = string.gsub(buff_text,--[[!AUTO_53]]"#v2#",math.floor(vTab[2]))
		end
		i ,j = string.find(buff_text,--[[!AUTO_54]]"#v3#")
		if i and j then
			buff_text = string.gsub(buff_text,--[[!AUTO_55]]"#v3#",math.floor(vTab[3]))
		end
		i ,j = string.find(buff_text,--[[!AUTO_56]]"#v4#")
		if i and j then
			buff_text = string.gsub(buff_text,--[[!AUTO_57]]"#v4#",math.floor(vTab[4]))
		end
		i ,j = string.find(buff_text,--[[!AUTO_58]]"#v5#")
		if i and j then
			buff_text = string.gsub(buff_text,--[[!AUTO_59]]"#v5#",math.floor(vTab[5]))
		end

		i ,j = string.find(buff_text,--[[!AUTO_60]]"#pv1#")
		if i and j then
			temp_str = string.format(--[[!AUTO_61]]"%d%s",math.floor(vTab[1]*100),--[[!AUTO_62]]"%%")
			buff_text = string.gsub(buff_text,--[[!AUTO_63]]"#pv1#",temp_str)
		end
		i ,j = string.find(buff_text,--[[!AUTO_64]]"#pv2#")
		if i and j then
			temp_str = string.format(--[[!AUTO_65]]"%d%s",math.floor(vTab[2]*100),--[[!AUTO_66]]"%%")
			buff_text = string.gsub(buff_text,--[[!AUTO_67]]"#pv2#",temp_str)
		end
		i ,j = string.find(buff_text,--[[!AUTO_68]]"#pv3#")
		if i and j then
			temp_str = string.format(--[[!AUTO_69]]"%d%s",math.floor(vTab[3]*100),--[[!AUTO_70]]"%%")
			buff_text = string.gsub(buff_text,--[[!AUTO_71]]"#pv3#",temp_str)
		end
		i ,j = string.find(buff_text,--[[!AUTO_72]]"#pv4#")
		if i and j then
			temp_str = string.format(--[[!AUTO_73]]"%d%s",math.floor(vTab[4]*100),--[[!AUTO_74]]"%%")
			buff_text = string.gsub(buff_text,--[[!AUTO_75]]"#pv4#",temp_str)
		end
		i ,j = string.find(buff_text,--[[!AUTO_76]]"#pv5#")
		if i and j then
			temp_str = string.format(--[[!AUTO_77]]"%d%s",math.floor(vTab[5]*100),--[[!AUTO_78]]"%%")
			buff_text = string.gsub(buff_text,--[[!AUTO_79]]"#pv5#",temp_str)
		end

		i ,j = string.find(buff_text,--[[!AUTO_80]]"#sp1#")
		if i and j then
			buff_text = string.gsub(buff_text,--[[!AUTO_81]]"#sp1#",math.floor(vTab[1]*2000))
		end
	end

	return buff_text
end

function BuffTip:GetBuffName( idBuff )
	if BUFF_NAME_TEXT[idBuff] then
		return BUFF_NAME_TEXT[idBuff]
	else
		return --[[!AUTO_82]]"未知BUFF"
	end
end

function BuffTip:GetBuffDesc( idBuff )
	if BUFF_DETAIL_DESC[idBuff] then
		return BUFF_DETAIL_DESC[idBuff]
	else
		return --[[!AUTO_83]]"無描述資訊"
	end
end

TREASUREBUFF = {}
TREASUREBUFF[774] = {0,{48,54,60,66,72,78,84,90,96}}
TREASUREBUFF[775] = {0,{97,109,121,133,145,157,169,181,193}}
TREASUREBUFF[776] = {0,{194,218,242,266,290,314,338,362,386}}
TREASUREBUFF[777] = {0,{387,423,459,495,531,567,603,639,675}}
TREASUREBUFF[778] = {0,{678,726,774,822,870,918,966,1014,1062}}
TREASUREBUFF[779] = {1,{48,54,60,66,72,78,84,90,96}}
TREASUREBUFF[780] = {1,{96,108,120,132,144,156,168,180,192}}
TREASUREBUFF[781] = {1,{192,216,240,264,288,312,336,360,384}}
TREASUREBUFF[782] = {1,{384,420,456,492,528,564,600,636,672}}
TREASUREBUFF[783] = {1,{672,720,768,816,864,912,960,1008,1056}}
TREASUREBUFF[784] = {2,{32,35,38,41,44,47,50,53,56}}
TREASUREBUFF[785] = {2,{56,63,70,77,84,91,98,105,112}}
TREASUREBUFF[786] = {2,{113,127,141,155,169,183,197,211,225}}
TREASUREBUFF[787] = {2,{226,247,268,289,310,331,352,373,394}}
TREASUREBUFF[788] = {2,{396,424,452,480,508,536,564,592,620}}
TREASUREBUFF[789] = {3,{45,50,55,60,65,70,75,80,85}}
TREASUREBUFF[790] = {3,{90,100,110,120,130,140,150,160,170}}
TREASUREBUFF[791] = {3,{173,194,215,236,257,278,299,320,341}}
TREASUREBUFF[792] = {3,{341,373,405,437,469,501,533,565,597}}
TREASUREBUFF[793] = {3,{603,645,687,729,771,813,855,897,939}}
TREASUREBUFF[794] = {4,{64,72,80,88,96,104,112,120,128}}
TREASUREBUFF[795] = {4,{128,144,160,176,192,208,224,240,256}}
TREASUREBUFF[796] = {4,{256,288,320,352,384,416,448,480,512}}
TREASUREBUFF[797] = {4,{512,560,608,656,704,752,800,848,896}}
TREASUREBUFF[798] = {4,{897,961,1025,1089,1153,1217,1281,1345,1409}}
TREASUREBUFF[799] = {5,{48,54,60,66,72,78,84,90,96}}
TREASUREBUFF[800] = {5,{97,109,121,133,145,157,169,181,193}}
TREASUREBUFF[801] = {5,{194,218,242,266,290,314,338,362,386}}
TREASUREBUFF[802] = {5,{387,423,459,495,531,567,603,639,675}}
TREASUREBUFF[803] = {5,{678,726,774,822,870,918,966,1014,1062}}
TREASUREBUFF[804] = {6,{48,54,60,66,72,78,84,90,96}}
TREASUREBUFF[805] = {6,{96,108,120,132,144,156,168,180,192}}
TREASUREBUFF[806] = {6,{192,216,240,264,288,312,336,360,384}}
TREASUREBUFF[807] = {6,{384,420,456,492,528,564,600,636,672}}
TREASUREBUFF[808] = {6,{672,720,768,816,864,912,960,1008,1056}}
TREASUREBUFF[809] = {7,{115,129,143,157,171,185,199,213,227}}
TREASUREBUFF[810] = {7,{230,258,286,314,342,370,398,426,454}}
TREASUREBUFF[811] = {7,{460,516,572,628,684,740,796,852,908}}
TREASUREBUFF[812] = {7,{909,994,1079,1164,1249,1334,1419,1504,1589}}
TREASUREBUFF[813] = {7,{1594,1707,1820,1933,2046,2159,2272,2385,2498}}
TREASUREBUFF[814] = {8,{238,266,294,322,350,378,406,434,462}}
TREASUREBUFF[815] = {8,{468,525,582,639,696,753,810,867,924}}
TREASUREBUFF[816] = {8,{929,1044,1159,1274,1389,1504,1619,1734,1849}}
TREASUREBUFF[817] = {8,{1851,2024,2197,2370,2543,2716,2889,3062,3235}}
TREASUREBUFF[818] = {8,{3245,3475,3705,3935,4165,4395,4625,4855,5085}}


function BuffTip:GetDefBuff()
	return TREASUREBUFF
end


function BuffTip:CanDispelBuff(buffid)
	local dispel_buff_list = {
		[1361] = "確定要取消變身嗎？",
		[1362] = "確定要取消變身嗎？",
		[1363] = "確定要取消變身嗎？",
		[1371] = "確定要取消變身嗎？",
		[1372] = "確定要取消變身嗎？",
		[1373] = "確定要取消變身嗎？",
		[1374] = "確定要取消變身嗎？",
		[1422] = "確定要取消變身嗎？",
		[1425] = "確定要取消變身嗎？",
		[1473] = "確定要取消變身嗎？",
	}	
	if dispel_buff_list[buffid] then
		return true,BuffState.BUFF_STATE_DISGUISE,dispel_buff_list[buffid]
	else
		return false,BuffState.BUFF_STATE_DISGUISE,""
	end
end