--	将所有工具函数封装到模块mod_utility
module("mod_utility", package.seeall)

-- table复制函数
function CopyTable(t)
    assert(type(t) == "table", "You must specify a table to copy")
    local result = {}
    for k,v in pairs(t) do
        if type(v) == "table" then
            result[k] = copyTable(v)
        else
            result[k] = v
        end
    end
    -- copy the metatable if exists
    setmetatable(result, getmetatable(t))
    return result
end

--	获取名称数目的描述文本
function GetNameCountText(valTab)
    if (string.len(valTab.name) == 0) then
    	return string.format("")
    end
	strNameCnt = string.format(ITEM_NAME_DESC[1], valTab.name)
	if (valTab.count > 1) then
		strNameCnt = strNameCnt .. string.format(ITEM_COUNT_DESC[1], valTab.count)
	end
	if (valTab.name_color ~= -1) then
		strNameCnt = string.format(ITEM_COLOR_DESC[valTab.name_color+1]) .. strNameCnt
		strNameCnt = strNameCnt .. string.format(ITEM_COLOR_DESC[2]) 
	end
	strNameCnt = strNameCnt .. string.format("\\r")
	return strNameCnt	
end

-- 获取绑定状态描述文本
function GetBoundStateText(valTab)
    strBound = ""
	if (valTab.bound >= 1 and valTab.bound <= 4) then
		strBound = strBound .. string.format(ITEM_BOUND_DESC[valTab.bound])
		strBound = strBound .. string.format("\\r") 
	end
	if (valTab.limited == true) then
	    strBound = strBound .. string.format(ITEM_BOUND_DESC[6])
	    strBound = strBound .. string.format("\\r")
	end
	return strBound
end

-- 获取剩余时间的描述文本
function GetExpireTimeText(valTab)
    time = valTab.expire_time
	if (time <= 0) then
	    return string.format("")
	end
	
	day = time / (24*3600)
    hour = (time % (24*3600)) / 3600
	minute = (time % 3600) / 60
	second = time % 60
	color = 2
	
	strExpireTime = string.format(ITEM_TIME_DESC[1])
	if (day >= 1) then
	    strExpireTime = strExpireTime .. string.format(ITEM_TIME_DESC[2], day)
		strExpireTime = strExpireTime .. string.format(ITEM_TIME_DESC[3], hour)
		color = 4
	elseif (hour >= 1) then
	    strExpireTime = strExpireTime .. string.format(ITEM_TIME_DESC[3], hour)
		strExpireTime = strExpireTime .. string.format(ITEM_TIME_DESC[4], minute)
		color = 7
	elseif (minute >= 1) then
   	    strExpireTime = strExpireTime .. string.format(ITEM_TIME_DESC[4], minute)
		strExpireTime = strExpireTime .. string.format(ITEM_TIME_DESC[5], second)
		color = 10
	else
		strExpireTime = strExpireTime .. string.format(ITEM_TIME_DESC[5], second)		    		    
		color = 9
	end
	strExpireTime = string.format(ITEM_COLOR_DESC[color]) .. strExpireTime .. string.format(ITEM_COLOR_DESC[2])
	strExpireTime = strExpireTime .. string.format("\\r")
	return strExpireTime	
end 
	
-- 获带单位的价格描述
function GetPriceText(price)
	if (price <= 0) then
	    return string.format("")
	end
	
	jade = price / 1000000
	gold = (price / 10000) % 100
	silver = (price / 100) % 100
	copper = price % 100
	
	strPrice = ""
	if (jade >= 1) then
		strPrice = strPrice .. string.format(ITEM_PRICE_DESC[7], jade)
		strPrice = strPrice .. string.format(ITEM_PRICE_DESC[8], gold)
		strPrice = strPrice .. string.format(ITEM_PRICE_DESC[9], silver)
		strPrice = strPrice .. string.format(ITEM_PRICE_DESC[10], copper)
	elseif (gold >= 1) then
		strPrice = strPrice .. string.format(ITEM_PRICE_DESC[8], gold)
		strPrice = strPrice .. string.format(ITEM_PRICE_DESC[9], silver)
		strPrice = strPrice .. string.format(ITEM_PRICE_DESC[10], copper)
	elseif (silver >= 1) then
		strPrice = strPrice .. string.format(ITEM_PRICE_DESC[9], silver)
		strPrice = strPrice .. string.format(ITEM_PRICE_DESC[10], copper)
	else
		strPrice = strPrice .. string.format(ITEM_PRICE_DESC[10], copper)
	end
	return strPrice
end

-- 根据上下文获取物品价格描述
function GetContextPriceText(valTab)
    context = valTab.context
	if (context == CONTEXT_DEFAULT or context == CONTEXT_REWARD or context == CONTEXT_PRODUCE) then
		return string.format("")
	end
	strConPrice = ""
	if (context == CONTEXT_NPC_BUY) then
		if (valTab.total_price > 0) then
	        strConPrice = strConPrice .. string.format(ITEM_PRICE_DESC[3], GetPriceText(valTab.total_price))
	        strConPrice = strConPrice .. string.format("\\r")
	    end
	    if (valTab.exploit_price > 0) then
	        strConPrice = strConPrice .. string.format(ITEM_PRICE_DESC[4], tab.exploit_price) 
	        strConPrice = strConPrice .. string.format("\\r")
	    end
	    if (string.len(valTab.req_item) > 0 and valTab.req_item_cnt > 0) then
	    	strConPrice = strConPrice .. string.format(ITEM_PRICE_DESC[6], valTab.req_item, valTab.req_item_cnt) 
	    	strConPrice = strConPrice .. string.format("\\r")
	    end
	elseif (context == CONTEXT_NPC_SELL or context == CONTEXT_TRADE or context == CONTEXT_VENDUE or context == CONTEXT_RECYCLE or context == CONTEXT_BOOTH_BUY or context == CONTEXT_BOOTH_SELL) then
		if (valTab.total_price > 0 and valTab.unit_price > 0) then
		    strConPrice = strConPrice .. string.format(ITEM_PRICE_DESC[2], GetPriceText(valTab.unit_price), GetPriceText(valTab.total_price))
		    strConPrice = strConPrice .. string.format("\\r")
		end
	elseif (context == CONTEXT_REPAIR) then
		if (valTab.unit_price > 0 and valTab.unit_price == valTab.total_price) then
		    strConPrice = strConPrice .. string.format(ITEM_PRICE_DESC[5], GetPriceText(valTab.unit_price))
		    strConPrice = strConPrice .. string.format("\\r")
		end
	else
	    strConPrice = string.format("")
	end		   
	return strConPrice    
end

-- 获取生产配方已学习文本
function GetRecipeLearnedText(valTab)
    strPrecipelearned = ""
	if (valTab.have_learned == true) then
   		strPrecipelearned = strPrecipelearned .. string.format(ITEM_COLOR_DESC[6])
		strPrecipelearned = strPrecipelearned .. string.format(ITEM_PROD_TYPE_DESC[1])
		strPrecipelearned = strPrecipelearned .. string.format("\\r") 
	end
	return strPrecipelearned
end

-- 获取生产技能类型限制文本
function GetProduceSkillNameText(valTab)
    strPskillname = ""
    if valTab.req_prod_skill_color == 1 then
        clrPskillname = 10
    else
        clrPskillname = 6
    end
	strPskillname = strPskillname .. string.format(ITEM_COLOR_DESC[2])
	strPskillname = strPskillname .. string.format(ITEM_PROD_TYPE_DESC[2] , ITEM_COLOR_DESC[clrPskillname] , valTab.req_prod_skill)
	strPskillname = strPskillname .. string.format("\\r")
	return strPskillname
end

-- 获取生产技能熟练度限制文本
function GetProduceSkillMasteryText(valTab)
    strPskillmastery = ""
    if valTab.req_prod_point_color == 1 then
        clrPskillmastery = 10
    else
        clrPskillmastery = 6
    end
   	strPskillmastery = strPskillmastery .. string.format(ITEM_COLOR_DESC[2])
	strPskillmastery = strPskillmastery .. string.format(ITEM_PROD_TYPE_DESC[3] , ITEM_COLOR_DESC[clrPskillmastery] , valTab.req_prod_point)
	strPskillmastery = strPskillmastery .. string.format("\\r")
	return strPskillmastery
end

-- 获取生产成品名称文本
function GetProductNameText(valTab)
	strPname = ""
   	strPname = strPname .. string.format(ITEM_COLOR_DESC[2])	
	strPname = strPname .. string.format(ITEM_PROD_TYPE_DESC[4] , valTab.product_name)
	strPname = strPname .. string.format("\\r")
	return strPname
end

-- 获取生产成品描述文本
function GetProductDescText(valTab)
    strPdesc = ""
   	strPdesc = strPdesc .. string.format(ITEM_COLOR_DESC[2])	
   	strPdesc = strPdesc .. string.format(ITEM_PROD_TYPE_DESC[5] , valTab.product_desc , ITEM_COLOR_DESC[2])
 	strPdesc = strPdesc .. string.format("\\r")
	return strPdesc
end

-- 去掉整体描述的最后一个换行符 
function TrimLastReturn(desc)
    if (string.len(desc) >= 2 and string.sub(desc, -2, -1) == string.format("\\r")) then
        return string.sub(desc, 1, -3)
    else
        return desc
    end
end
-- 需要时可能需要新加函数，包括A.去空行：将两个或以上连续的\\r换成\\r，B.去连续空行：将三个或以上连续的\\r换成\\r\\r。