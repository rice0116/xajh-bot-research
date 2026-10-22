--  所有物品属性描述的生成函数

-- require "desc_text"
-- require "desc_utility"

-- 将模块赋予一个本地别名



















local M = mod_utility

-- 获取某类物品描述文本
lua_item_desc = {}

---------------------------------获取材料类物品描述文本，其函数输入参数为如下结构的table
--[[ 
tab = 
{
	context,			-- number		
	name,				-- string
	name_color,			-- string
	count,				-- number
	bound,				-- number
	limited,			-- boolean
	expire_time,		-- number
	unit_price,			-- number
	total_price,		-- number
	exploit_price,		-- number
	req_item,		-- string
	req_item_cnt	-- number	
}
--]]
function lua_item_desc:GetMaterialDesc (tab)
    
	strTab = MATERIAL_DESC
	str_desc = ""
	
	-- 名字和数量


















	str_desc = str_desc .. M.GetNameCountText(tab)
	
	-- 绑定状态


















	str_desc = str_desc .. M.GetBoundStateText(tab)
	
	-- 剩余时间
	str_desc = str_desc .. M.GetExpireTimeText(tab)
	
	-- 价格描述
	str_desc = str_desc .. M.GetContextPriceText(tab)

	return M.TrimLastReturn(str_desc)
end

---------------------------------获取配方卷轴类物品描述文本，其函数输入参数为如下结构的table
--[[ 
tab = 
{
	context,			-- number
	name,				-- string
	name_color,			-- string
	count,				-- number
	bound,				-- number
	limited,			-- boolean
	expire_time,		-- number
	unit_price,			-- number
	total_price,		-- number
	exploit_price,		-- number
	req_item,			-- string
	req_item_cnt,		-- number
	have_learned,			-- boolean
	req_prod_skill,			-- string
	req_prod_skill_color,	-- number	???能否改boolean，意义


















	req_prod_point,			-- number
	req_prod_point_color,	-- number	???能否改boolean，意义


















	product_name,			-- string
	product_desc			-- string
}
--]]
function lua_item_desc:GetRecipeRollDesc (tab)
    
	strTab = RECIPEROLL_DESC
	str_desc = ""
	
	-- 名字和数量


















	str_desc = str_desc .. M.GetNameCountText(tab)
	
	-- 绑定状态


















	str_desc = str_desc .. M.GetBoundStateText(tab)
	
	-- 学习状态


















	str_desc = str_desc .. M.GetRecipeLearnedText(tab)
	
	-- 生产技能名
	str_desc = str_desc .. M.GetProduceSkillNameText(tab)
	
	-- 生产熟练度


















	str_desc = str_desc .. M.GetProduceSkillMasteryText(tab)
	
	-- 生产成品名


















	str_desc = str_desc .. M.GetProductNameText(tab)
	
	-- 成品属性


















	str_desc = str_desc .. M.GetProductDescText(tab)
	
	-- 剩余时间
	str_desc = str_desc .. M.GetExpireTimeText(tab)
	
	-- 价格描述
	str_desc = str_desc .. M.GetContextPriceText(tab)

	return M.TrimLastReturn(str_desc)
end

-- for test
--[[
tab1= {
	context = 2,				
	name = "完美宝钻",
	name_color = 6,
	count = 15,
	bound = 2,
	limited = true,
	expire_time = 12786,
	unit_price = 35,
	total_price =1234335,
	exploit_price = 3,
	require_item = "配方2",
	require_item_cnt = 1
}
tab2= {
	context = 1 ,
	name = "配方·好东西",
	name_color = 3,
	count = 1,
	bound = 0,
	limited = false,
	expire_time = 0,
	unit_price = 35,
	total_price = 35,
	exploit_price = 10,
	require_item = "配方2",
	require_item_cnt = 1,
	have_learned = 1,
	req_prod_skill = 巧匠,
	req_prod_skill_color = 1,
	req_prod_point = 60,
	req_prod_point_color = 0,
	product_name = "好东西",
	product_desc = "好东西\\r真的好东西"
}
--io.write(lua_item_desc:GetMaterialDesc(tab1))

--strdescription = lua_item_desc:GetMaterialDesc(tab)
--StdPrint(strdescription)
--]]
