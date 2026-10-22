--家园脚本

Home = {}

HomeBuilding = {}
HomeBuilding [1] = {}
HomeBuilding [2] = {}
HomeBuilding [3] = {}
HomeBuilding [4] = {}
HomeBuilding [5] = {}
HomeBuilding [6] = {}
HomeBuilding [7] = {}
HomeBuilding [8] = {}
HomeBuilding [9] = {}

--HomeBuilding[建筑类型编号][风格编号]

--主屋
HomeBuilding[1][1] = "默认风格的主屋，虽然简单但是非常实用"
HomeBuilding[1][2] = "客厅风格1描述"

--客厅
HomeBuilding[2][1] = "默认风格的客厅，样式简单而实用。\r 客厅可以定时刷出宠物并且可以存放宠物。 \r客厅需要安排侍应类仆人进行日常打理。"
HomeBuilding[2][2] = "客厅风格1描述"

--标志
HomeBuilding[3][1] = "标志默认风格描述"
HomeBuilding[3][2] = "标志风格1描述"

--书房
HomeBuilding[4][1] = "默认风格的书房，样式简单而实用。\r 书房可以研究各种风格的建筑，研究成功的建筑风格才能在家园里使用。 \r书房需要安排书童类仆人进行日常打理。"
HomeBuilding[4][2] = "书房风格1描述"

--账房
HomeBuilding[5][1] = "默认风格的账房，样式简单而实用。\r 账房可以进行投资理财，并且可以存放物品。 \r账房需要安排先生类仆人进行日常打理。"
HomeBuilding[5][2] = "账房风格1描述"

--菜园
HomeBuilding[6][1] = "菜园默认风格描述"
HomeBuilding[6][2] = "菜园风格1描述"

--牧场
HomeBuilding[7][1] = "牧场默认风格描述"
HomeBuilding[7][2] = "牧场风格1描述"

--栅栏
HomeBuilding[8][1] = "栅栏默认风格描述"
HomeBuilding[8][2] = "栅栏风格1描述"

--交互
HomeBuilding[9][1] = "交互默认风格描述"
HomeBuilding[9][2] = "交互风格1描述"

function Home:GetCommunityInfo(sid,com_id)

	return "00111种植.dds"
end



function Home:GetBuildingDesc(Type,Style)

	if HomeBuilding[Type][Style] then
	return HomeBuilding[Type][Style]
	else
	return "读取建筑信息错误"
	end
end

function Home:GetBuildingStateTips(b_type,b_level,style_id,b_value,state,time_left,workers)
	local tbl = {}

	--描述面板表头
	tbl["title"] = "测试主屋"
	tbl["icon"] = "00752未知物品.dds"
	tbl["info1"] = "风格：欧式建筑\r等级：3级\r建设度：265"

	tbl["limitskill"] = "状态：升级中\r剩余时间：00：59：59\r\r侍应：西施"

	return tbl
end


--tbl["ability_name"]	特长名字
--tbl["total_name"]		套卡名
--tbl["total_max"]		套卡最大数

function Home:GetServantTextInfo(tid)
	local tbl = {}

	tbl["ability_name"] = "音律"
	tbl["total_name"] = "四大美女"
	tbl["total_max"] = 4

	return tbl
end