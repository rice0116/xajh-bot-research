-------------------------------------------------------------------------------
-----	CG摄像机 脚本
-----	Creator: Guo Jie, 2009.7.29
-------------------------------------------------------------------------------

CameraBezier = {}
CameraTarget = {}

-------------------------------------------------------------------------------
function CopyTable(src)
    	if type(src) ~= "table" then return src end
    	local inst = {}
    	for i,v in pairs(src) do
        		if i ~= "__index" then       --关键
            			inst[i] = CopyTable(v)
		        end
	    end
    	setmetatable(inst,src)
    	src.__index = src
    	return inst
end
-------------------------------------------------------------------------------

local index_2_name_Bezier =
{
    "id",				--CG Camera ID (CameraBezier或CameraTarget的标志，统一编号，不能相同)
    	"bezier_id",
    "onlyShowOnce",
    "indexOnlyShowOnce",
    "showOnceInCurWorld",
    "canEscClose",
    "disableOtherKey",
    "disableMouse",
    "cancelAutoPath",
    "showUI",
    "showPlayers",
    "showServNPC",
    "showMonster",
    "showPlayerName",
    "showServNPCName",
    "showMonsterName",
	    "resetCameras",
    "resetAllCamera",
	    "repeatTimes",
}

local DP_SHOW_ALL  = 0
local DP_SHOW_SELF = 1
local DP_HIDE_ALL  = 2

-------***************************************************************-------
-------***************************************************************------- 
-------------------- 路径摄像机（沿Bezier曲线运动） -------------------------
-------***************************************************************-------
-------***************************************************************-------

function CameraBezier:GetBezierCamData(id)
	    if type(id)=="number" and id>0 then
        		if nil == CameraBezier[id] then
			            return
		        end
		
        local params = {}
        local num = #index_2_name_Bezier
        for i=1,num do
            local key = index_2_name_Bezier[i]  
            params[key] = CameraBezier[id][key] or CameraBezier.default[key]
            if nil==params[key] then
                if key=="id" then
                    params[key] = id
                else 
            	        	return
                end
            end
        end
        return params
	    end
end 

--------默认设置，下面的基类中与默认相同的设置不用单独写----------
CameraBezier["default"] =
{
	    bezier_id         = -1,			--该相机第一条曲线id
    onlyShowOnce      = false, 		--是否只显示一次，只显示一次:true  , 显示无限多次:false
    	indexOnlyShowOnce = -1,    		--若仅显示一次，在服务器记录的摄像机编号 [0,127]
    showOnceInCurWorld= false, 		--在当前世界中是否仅仅播放一次。true:当前世界中仅播放一次，false:没有该限制。
    canEscClose       = false, 		--是否允许按ESC退出，允许ESC退出:true  , 不允许ESC退出:false
    disableOtherKey   = false, 		--是否允许按其他按键，不允许按其他按键:true  , 允许按其他按键:false
    disableMouse      = false, 		--是否屏蔽鼠标消息，屏蔽:true，不屏蔽:false
    showUI            = false, 		--是否显示界面，显示界面:true  , 不显示界面:false
    cancelAutoPath    = false, 		--是否中断自动寻径，中断自动寻径:true, 不中断自动寻径:false
    showPlayers       = DP_SHOW_ALL,--是否显示玩家与宠，三选一：显示所有玩家及宠:DP_SHOW_ALL, 只显示自己与自己的宠:DP_SHOW_SELF，不显示所有玩家及其宠:DP_HIDE_ALL
    showServNPC       = true, 		--是否显示服务类NPC，显示:true, 不显示:false
    showMonster       = true, 		--是否显示怪物，显示怪物:true, 不显示怪物:false
    showPlayerName    = DP_HIDE_ALL,--是否显示玩家与宠的名称，三选一
    showServNPCName   = false, 		--是否显示服务类NPC名称，显示:true, 不显示:false
    showMonsterName   = false, 		--是否显示怪物名称，显示怪物:true, 不显示怪物:false
    resetCameras      = "-1",		--此摄像机播放后，重置为未播放的摄像机在服务器记录的index列表([0,127]): 如："0, 2, 5"
    resetAllCamera    = false, 		--此摄像机播放后，是否将所有摄像机都设置为未播放过:true, 不使用这个功能:false。
     repeatTimes       = 0,
}

----------------基类----------------------------------------------------------
--城市观光类
CameraBezier["OverlookCity"] =
{
    canEscClose       = true, 	--是否允许按ESC退出，允许ESC退出:true  , 不允许ESC退出:false
    cancelAutoPath    = true, 	--是否中断自动寻径，中断自动寻径:true, 不中断自动寻径:false
}

--战场观光类
CameraBezier["OverlookBattlefield"] =
{
    showOnceInCurWorld= true,	--在当前世界中是否仅仅播放一次。true:当前世界中仅播放一次，false:没有该限制。
    canEscClose       = true, 	--是否允许按ESC退出，允许ESC退出:true  , 不允许ESC退出:false
    disableOtherKey   = true,	--是否允许按其他按键，不允许按其他按键:true  , 允许按其他按键:false
    disableMouse      = true,	--是否屏蔽鼠标消息，屏蔽:true，不屏蔽:false
    cancelAutoPath    = true,	--是否中断自动寻径，中断自动寻径:true, 不中断自动寻径:false
}

--小游戏
CameraBezier["OverlookLittleGame"] =
{
    showUI            = true, 			--是否显示界面，显示界面:true  , 不显示界面:false
}

-------***************************************************************-------
-------***************************************************************------- 
----------------- 目标摄像机（在几个摄像机之间插值运动） --------------------
-------***************************************************************-------
-------***************************************************************-------

local TARGETCAM_WALK_BEZIER = 0 --目标摄像机的运动方式：按照拟合的bezier曲线
local TARGETCAM_WALK_LINEAR = 1 --目标摄像机的运动方式：直接线性插值

local index_2_name_Target =
{
    "id",				--CG Camera ID (CameraBezier或CameraTarget的标志，统一编号，不能相同)
    	"walk_type",		--目标摄像机的运动方式
    "targetCamera_ids", --目标摄像机的id列表
    "duration",  		--目标摄像机之间的时长列表
    "cuttings", 		--直接切换(不平滑过渡)的镜头序号列表，如"0, 1"
    "angle_accs",  		--平滑过渡时，角度的加速度列表(不写默认1.0)，如"1.0, 1.5, 1.0"
    "linear_accs", 		--平滑过渡时，距离的加速度列表(不写默认1.0)，如"1.5, 1.0, 2.0" 
    "onlyShowOnce",
    "indexOnlyShowOnce",
    "showOnceInCurWorld",
    "canEscClose",
    "disableOtherKey",
    "disableMouse",
    "cancelAutoPath",
    "showUI",
    "showPlayers",
    "showServNPC",
    "showMonster",
    "showPlayerName",
    "showServNPCName",
    "showMonsterName",
	    "resetCameras",
    "resetAllCamera",
	    "repeatTimes",
}

function CameraTarget:GetTargetCamData(id)
	    if type(id)=="number" and id>0 then
        		if nil == CameraTarget[id] then
			            return
        		end

        local params = {}
        local num = #index_2_name_Target
        for i=1,num do
            local key = index_2_name_Target[i]  
            params[key] = CameraTarget[id][key] or CameraTarget.default[key]
            if nil==params[key] then
                if key=="id" then
                    params[key] = id
                else 
            	        	return
                end
            end
        end
        return params
	    end
end 

--------默认设置，下面的基类中与默认相同的设置不用单独写----------

CameraTarget["default"] =
{
    	walk_type         = TARGETCAM_WALK_BEZIER,	--运动方式
	    targetCamera_ids  = "",			--这个路径上播放的所有目标摄像机id列表: 如："240, 241, 242"
    	duration          = "",			--每段播放的时间（秒），如："10.0, 2.55"
    cuttings          = "",			--直接切换(不平滑过渡)的镜头序号列表，如"0, 1"
    angle_accs        = "",  		--平滑过渡时，角度的加速度列表(不写默认0)，如"1.0, 1.5, 1.0"
    linear_accs       = "", 		--平滑过渡时，位移的加速度列表(不写默认0)，如"1.5, 1.0, 2.0" 
    onlyShowOnce      = false, 		--是否只显示一次，只显示一次:true  , 显示无限多次:false
	    indexOnlyShowOnce = -1,    		--若仅显示一次，在服务器记录的摄像机编号 [0,127]（不能与CameraBezier的编号雷同）
    showOnceInCurWorld= false, 		--在当前世界中是否仅仅播放一次。true:当前世界中仅播放一次，false:没有该限制。
    canEscClose       = false, 		--是否允许按ESC退出，允许ESC退出:true  , 不允许ESC退出:false
    disableOtherKey   = false, 		--是否允许按其他按键，不允许按其他按键:true  , 允许按其他按键:false
    disableMouse      = false, 		--是否屏蔽鼠标消息，屏蔽:true，不屏蔽:false
    showUI            = false, 		--是否显示界面，显示界面:true  , 不显示界面:false
    cancelAutoPath    = false, 		--是否中断自动寻径，中断自动寻径:true, 不中断自动寻径:false
    showPlayers       = DP_SHOW_ALL,--是否显示玩家与宠，三选一：显示所有玩家及宠:DP_SHOW_ALL, 只显示自己与自己的宠:DP_SHOW_SELF，不显示所有玩家及其宠:DP_HIDE_ALL
    showServNPC       = true, 		--是否显示服务类NPC，显示:true, 不显示:false
    showMonster       = true, 		--是否显示怪物，显示怪物:true, 不显示怪物:false
    showPlayerName    = DP_HIDE_ALL,--是否显示玩家与宠的名称，三选一
    showServNPCName   = false, 		--是否显示服务类NPC名称，显示:true, 不显示:false
    showMonsterName   = false, 		--是否显示怪物名称，显示怪物:true, 不显示怪物:false
    resetCameras      = "-1",		--此摄像机播放后，重置为未播放的摄像机在服务器记录的index列表([0,127]): 如："0, 2, 5"
    resetAllCamera    = false, 		--此摄像机播放后，是否将所有摄像机都设置为未播放过:true, 不使用这个功能:false。
	    repeatTimes       = 0,
}

----------------基类----------------------------------------------------------
--城市观光类
CameraTarget["OverlookCity"] =
{
    canEscClose       = true, 	--是否允许按ESC退出，允许ESC退出:true  , 不允许ESC退出:false
    cancelAutoPath    = true, 	--是否中断自动寻径，中断自动寻径:true, 不中断自动寻径:false
}

--战场观光类

CameraTarget["OverlookBattlefield"] =
{
    showOnceInCurWorld= true,	--在当前世界中是否仅仅播放一次。true:当前世界中仅播放一次，false:没有该限制。
    canEscClose       = true, 	--是否允许按ESC退出，允许ESC退出:true  , 不允许ESC退出:false
    disableOtherKey   = true,	--是否允许按其他按键，不允许按其他按键:true  , 允许按其他按键:false
    disableMouse      = true,	--是否屏蔽鼠标消息，屏蔽:true，不屏蔽:false
    cancelAutoPath    = true,	--是否中断自动寻径，中断自动寻径:true, 不中断自动寻径:false
}

--小游戏
CameraTarget["OverlookLittleGame"] =
{
    showUI            = true, 			--是否显示界面，显示界面:true  , 不显示界面:false
}

--任务事件类
CameraTarget["TaskEventCamera"] =
{
    canEscClose       = false, 		--是否允许按ESC退出，允许ESC退出:true  , 不允许ESC退出:false
    disableOtherKey   = true,  		--是否允许按其他按键，不允许按其他按键:true  , 允许按其他按键:false
    disableMouse      = true, 		--是否屏蔽鼠标消息，屏蔽:true，不屏蔽:false
    showUI            = false, 		--是否显示界面，显示界面:true  , 不显示界面:false
    cancelAutoPath    = false, 		--是否中断自动寻径，中断自动寻径:true, 不中断自动寻径:false
}



















































































----新手村，建立新角色出生
CameraTarget[1000] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[1000].targetCamera_ids = "240, 241, 251"
CameraTarget[1000].duration = "10, 5.3"
CameraTarget[1000].indexOnlyShowOnce = 64


----测试洛阳路径1
CameraTarget[2001] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2001].targetCamera_ids = "449, 450, 451"
CameraTarget[2001].duration = "3, 4"
CameraTarget[2001].indexOnlyShowOnce = -1
CameraTarget[2001].showOnceInCurWorld = false


----测试洛阳路径2
CameraTarget[2002] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2002].targetCamera_ids = "452, 453, 455"
CameraTarget[2002].duration = "5, 3"
CameraTarget[2002].indexOnlyShowOnce = -1
CameraTarget[2002].showOnceInCurWorld = false


----测试洛阳路径3
CameraTarget[2003] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2003].targetCamera_ids = "297, 298, 300"
CameraTarget[2003].duration = "6, 3"
CameraTarget[2003].indexOnlyShowOnce = -1
CameraTarget[2003].showOnceInCurWorld = false


----药王庙探索01
CameraTarget[2004] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2004].targetCamera_ids = "1930, 1931"
CameraTarget[2004].duration = "4"
CameraTarget[2004].indexOnlyShowOnce = -1
CameraTarget[2004].showOnceInCurWorld = false


----药王庙探索02
CameraTarget[2005] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2005].targetCamera_ids = "1928, 1929"
CameraTarget[2005].duration = "4"
CameraTarget[2005].indexOnlyShowOnce = -1
CameraTarget[2005].showOnceInCurWorld = false


----药王庙探索03
CameraTarget[2006] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2006].targetCamera_ids = "4790, 4791"
CameraTarget[2006].duration = "4"
CameraTarget[2006].indexOnlyShowOnce = -1
CameraTarget[2006].showOnceInCurWorld = false


----药王庙探索04
CameraTarget[2007] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2007].targetCamera_ids = "4792, 4793"
CameraTarget[2007].duration = "5"
CameraTarget[2007].indexOnlyShowOnce = -1
CameraTarget[2007].showOnceInCurWorld = false


----登陆镜组01
CameraTarget[2008] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2008].targetCamera_ids = "463, 414, 430, 431, 438, 439, 440, 441"
CameraTarget[2008].duration = "3.5, 2, 1.8, 1.3, 1, 1, 1"
CameraTarget[2008].indexOnlyShowOnce = -1
CameraTarget[2008].showOnceInCurWorld = false


----登陆镜组02
CameraTarget[2009] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2009].targetCamera_ids = "430, 431, 438, 439, 440, 441"
CameraTarget[2009].duration = "1, 1, 0.8, 0.8, 0.7"
CameraTarget[2009].indexOnlyShowOnce = -1
CameraTarget[2009].showOnceInCurWorld = false


----登陆镜组03
CameraTarget[2010] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2010].targetCamera_ids = "442, 444"
CameraTarget[2010].duration = "3"
CameraTarget[2010].indexOnlyShowOnce = -1
CameraTarget[2010].showOnceInCurWorld = false


----兰封镇镜组01
CameraTarget[2011] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2011].targetCamera_ids = "459, 461, 647, 648, 652, 651"
CameraTarget[2011].duration = "3, 2, 1, 3, 4"
CameraTarget[2011].indexOnlyShowOnce = -1
CameraTarget[2011].showOnceInCurWorld = false


----兰封镇镜组02
CameraTarget[2012] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2012].targetCamera_ids = "457, 473"
CameraTarget[2012].duration = "7"
CameraTarget[2012].indexOnlyShowOnce = -1
CameraTarget[2012].showOnceInCurWorld = false


----洛阳西门01
CameraTarget[2013] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2013].targetCamera_ids = "494, 495"
CameraTarget[2013].duration = "3"
CameraTarget[2013].indexOnlyShowOnce = -1
CameraTarget[2013].showOnceInCurWorld = false


----洛阳西门02
CameraTarget[2014] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2014].targetCamera_ids = "496, 501"
CameraTarget[2014].duration = "1"
CameraTarget[2014].indexOnlyShowOnce = -1
CameraTarget[2014].showOnceInCurWorld = false


----洛阳西门03
CameraTarget[2015] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2015].targetCamera_ids = "502, 503"
CameraTarget[2015].duration = "2"
CameraTarget[2015].indexOnlyShowOnce = -1
CameraTarget[2015].showOnceInCurWorld = false


----洛阳西门04
CameraTarget[2016] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2016].targetCamera_ids = "497, 498"
CameraTarget[2016].duration = "3"
CameraTarget[2016].indexOnlyShowOnce = -1
CameraTarget[2016].showOnceInCurWorld = false


----新手村镜组01
CameraTarget[2017] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2017].targetCamera_ids = "505, 507, 508, 509"
CameraTarget[2017].duration = "2, 3, 2"
CameraTarget[2017].indexOnlyShowOnce = -1
CameraTarget[2017].showOnceInCurWorld = false


----新手村镜组02
CameraTarget[2018] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2018].targetCamera_ids = "510, 512, 513"
CameraTarget[2018].duration = "2, 4"
CameraTarget[2018].indexOnlyShowOnce = -1
CameraTarget[2018].showOnceInCurWorld = false


----新手村镜组03
CameraTarget[2019] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2019].targetCamera_ids = "514, 531, 517"
CameraTarget[2019].duration = "1, 3.5"
CameraTarget[2019].indexOnlyShowOnce = -1
CameraTarget[2019].showOnceInCurWorld = false


----新手村镜组04
CameraTarget[2020] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2020].targetCamera_ids = "522, 526, 529, 530"
CameraTarget[2020].duration = "3, 5, 1.5"
CameraTarget[2020].indexOnlyShowOnce = -1
CameraTarget[2020].showOnceInCurWorld = false


----新手村出生镜头
CameraTarget[2021] = CopyTable(CameraTarget["TaskEventCamera"])
CameraTarget[2021].targetCamera_ids = "507, 508, 505"
CameraTarget[2021].duration = "9, 7"
CameraTarget[2021].indexOnlyShowOnce = -1
CameraTarget[2021].showOnceInCurWorld = false


----石碑任务镜头01
CameraTarget[2022] = CopyTable(CameraTarget["TaskEventCamera"])
CameraTarget[2022].targetCamera_ids = "510, 585"
CameraTarget[2022].duration = "5"
CameraTarget[2022].indexOnlyShowOnce = -1
CameraTarget[2022].showOnceInCurWorld = false


----石碑任务镜头02
CameraTarget[2023] = CopyTable(CameraTarget["TaskEventCamera"])
CameraTarget[2023].targetCamera_ids = "509, 586"
CameraTarget[2023].duration = "4.2"
CameraTarget[2023].indexOnlyShowOnce = -1
CameraTarget[2023].showOnceInCurWorld = false


----断桥镜头01
CameraTarget[2024] = CopyTable(CameraTarget["TaskEventCamera"])
CameraTarget[2024].targetCamera_ids = "517, 589, 590"
CameraTarget[2024].duration = "3, 4"
CameraTarget[2024].indexOnlyShowOnce = -1
CameraTarget[2024].showOnceInCurWorld = false


----断桥镜头02
CameraTarget[2025] = CopyTable(CameraTarget["TaskEventCamera"])
CameraTarget[2025].targetCamera_ids = "607, 608"
CameraTarget[2025].duration = "5"
CameraTarget[2025].indexOnlyShowOnce = -1
CameraTarget[2025].showOnceInCurWorld = false


----曲阳弹琴01
CameraTarget[2026] = CopyTable(CameraTarget["TaskEventCamera"])
CameraTarget[2026].targetCamera_ids = "592, 817, 818"
CameraTarget[2026].duration = "3, 4"
CameraTarget[2026].indexOnlyShowOnce = -1
CameraTarget[2026].showOnceInCurWorld = false


----曲阳弹琴02
CameraTarget[2027] = CopyTable(CameraTarget["TaskEventCamera"])
CameraTarget[2027].targetCamera_ids = "591, 642"
CameraTarget[2027].duration = "7"
CameraTarget[2027].indexOnlyShowOnce = -1
CameraTarget[2027].showOnceInCurWorld = false


----曲阳弹琴03
CameraTarget[2028] = CopyTable(CameraTarget["TaskEventCamera"])
CameraTarget[2028].targetCamera_ids = "645, 646"
CameraTarget[2028].duration = "7"
CameraTarget[2028].indexOnlyShowOnce = -1
CameraTarget[2028].showOnceInCurWorld = false


----170战斗事件01
CameraTarget[2029] = CopyTable(CameraTarget["TaskEventCamera"])
CameraTarget[2029].targetCamera_ids = "819, 820"
CameraTarget[2029].duration = "6.5"
CameraTarget[2029].indexOnlyShowOnce = -1
CameraTarget[2029].showOnceInCurWorld = false


----170战斗事件02
CameraTarget[2030] = CopyTable(CameraTarget["TaskEventCamera"])
CameraTarget[2030].targetCamera_ids = "861, 862"
CameraTarget[2030].duration = "1.5"
CameraTarget[2030].indexOnlyShowOnce = -1
CameraTarget[2030].showOnceInCurWorld = false


----170战斗事件03
CameraTarget[2031] = CopyTable(CameraTarget["TaskEventCamera"])
CameraTarget[2031].targetCamera_ids = "863, 864"
CameraTarget[2031].duration = "3.5"
CameraTarget[2031].indexOnlyShowOnce = -1
CameraTarget[2031].showOnceInCurWorld = false


----170战斗事件04
CameraTarget[2032] = CopyTable(CameraTarget["TaskEventCamera"])
CameraTarget[2032].targetCamera_ids = "825, 826"
CameraTarget[2032].duration = "1.5"
CameraTarget[2032].indexOnlyShowOnce = -1
CameraTarget[2032].showOnceInCurWorld = false


----170战斗事件05
CameraTarget[2033] = CopyTable(CameraTarget["TaskEventCamera"])
CameraTarget[2033].targetCamera_ids = "827, 829"
CameraTarget[2033].duration = "2"
CameraTarget[2033].indexOnlyShowOnce = -1
CameraTarget[2033].showOnceInCurWorld = false


----170战斗事件06
CameraTarget[2034] = CopyTable(CameraTarget["TaskEventCamera"])
CameraTarget[2034].targetCamera_ids = "859, 860"
CameraTarget[2034].duration = "1.5"
CameraTarget[2034].indexOnlyShowOnce = -1
CameraTarget[2034].showOnceInCurWorld = false


----171史镖头出现找玩家01
CameraTarget[2035] = CopyTable(CameraTarget["TaskEventCamera"])
CameraTarget[2035].targetCamera_ids = "839, 840"
CameraTarget[2035].duration = "5"
CameraTarget[2035].indexOnlyShowOnce = -1
CameraTarget[2035].showOnceInCurWorld = false


----171史镖头出现找玩家02
CameraTarget[2036] = CopyTable(CameraTarget["TaskEventCamera"])
CameraTarget[2036].targetCamera_ids = "841, 844, 845"
CameraTarget[2036].duration = "5, 3"
CameraTarget[2036].indexOnlyShowOnce = -1
CameraTarget[2036].showOnceInCurWorld = false


----171任务完成后01
CameraTarget[2037] = CopyTable(CameraTarget["TaskEventCamera"])
CameraTarget[2037].targetCamera_ids = "846, 850"
CameraTarget[2037].duration = "3"
CameraTarget[2037].indexOnlyShowOnce = -1
CameraTarget[2037].showOnceInCurWorld = false


----171任务完成后02
CameraTarget[2038] = CopyTable(CameraTarget["TaskEventCamera"])
CameraTarget[2038].targetCamera_ids = "853, 856"
CameraTarget[2038].duration = "5"
CameraTarget[2038].indexOnlyShowOnce = -1
CameraTarget[2038].showOnceInCurWorld = false


----171任务完成后03
CameraTarget[2039] = CopyTable(CameraTarget["TaskEventCamera"])
CameraTarget[2039].targetCamera_ids = "857, 858"
CameraTarget[2039].duration = "5"
CameraTarget[2039].indexOnlyShowOnce = -1
CameraTarget[2039].showOnceInCurWorld = false


----断桥轻功CG
CameraTarget[2040] = CopyTable(CameraTarget["TaskEventCamera"])
CameraTarget[2040].targetCamera_ids = "894, 895"
CameraTarget[2040].duration = "2"
CameraTarget[2040].indexOnlyShowOnce = -1
CameraTarget[2040].showOnceInCurWorld = false


----探索药王洞
CameraTarget[2041] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2041].targetCamera_ids = "923, 924, 925, 926, 936"
CameraTarget[2041].duration = "5, 7, 6, 4"
CameraTarget[2041].indexOnlyShowOnce = -1
CameraTarget[2041].showOnceInCurWorld = false


----沿着光明01
CameraTarget[2042] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2042].targetCamera_ids = "929, 930"
CameraTarget[2042].duration = "5"
CameraTarget[2042].indexOnlyShowOnce = -1
CameraTarget[2042].showOnceInCurWorld = false


----沿着光明02
CameraTarget[2043] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2043].targetCamera_ids = "937, 938"
CameraTarget[2043].duration = "6"
CameraTarget[2043].indexOnlyShowOnce = -1
CameraTarget[2043].showOnceInCurWorld = false


----沿着光明03
CameraTarget[2044] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2044].targetCamera_ids = "931, 932, 941"
CameraTarget[2044].duration = "2, 2"
CameraTarget[2044].indexOnlyShowOnce = -1
CameraTarget[2044].showOnceInCurWorld = false


----勇斗百药门01
CameraTarget[2045] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2045].targetCamera_ids = "941, 939, 942"
CameraTarget[2045].duration = "2, 3"
CameraTarget[2045].indexOnlyShowOnce = -1
CameraTarget[2045].showOnceInCurWorld = false


----梅关探索镜头01
CameraTarget[2046] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2046].targetCamera_ids = "6279, 6282, 6280"
CameraTarget[2046].duration = "3, 3"
CameraTarget[2046].indexOnlyShowOnce = -1
CameraTarget[2046].showOnceInCurWorld = false


----武当山脚下01
CameraTarget[2047] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2047].targetCamera_ids = "1724, 1725, 1726"
CameraTarget[2047].duration = "4, 6"
CameraTarget[2047].indexOnlyShowOnce = -1
CameraTarget[2047].showOnceInCurWorld = false


----武当山脚下02
CameraTarget[2048] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2048].targetCamera_ids = "1744, 1745"
CameraTarget[2048].duration = "4"
CameraTarget[2048].indexOnlyShowOnce = -1
CameraTarget[2048].showOnceInCurWorld = false


----武当山脚下03
CameraTarget[2049] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2049].targetCamera_ids = "1748, 1749"
CameraTarget[2049].duration = "6"
CameraTarget[2049].indexOnlyShowOnce = -1
CameraTarget[2049].showOnceInCurWorld = false


----余杭01
CameraTarget[2050] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2050].targetCamera_ids = "1802, 1803, 1804, 1805"
CameraTarget[2050].duration = "3, 2, 3"
CameraTarget[2050].indexOnlyShowOnce = -1
CameraTarget[2050].showOnceInCurWorld = false


----余杭02
CameraTarget[2051] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2051].targetCamera_ids = "1828, 1829, 1830, 1831"
CameraTarget[2051].duration = "5, 3, 2"
CameraTarget[2051].indexOnlyShowOnce = -1
CameraTarget[2051].showOnceInCurWorld = false


----仙霞岭01
CameraTarget[2052] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2052].targetCamera_ids = "1807, 1822, 1808"
CameraTarget[2052].duration = "3, 3"
CameraTarget[2052].indexOnlyShowOnce = -1
CameraTarget[2052].showOnceInCurWorld = false


----仙霞岭02
CameraTarget[2053] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2053].targetCamera_ids = "1809, 1816, 1810, 1821"
CameraTarget[2053].duration = "3, 2, 2"
CameraTarget[2053].indexOnlyShowOnce = -1
CameraTarget[2053].showOnceInCurWorld = false


----仙霞岭03
CameraTarget[2054] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2054].targetCamera_ids = "1832, 1811, 1833, 1812, 1813, 1815"
CameraTarget[2054].duration = "2, 3, 2, 2, 2"
CameraTarget[2054].indexOnlyShowOnce = -1
CameraTarget[2054].showOnceInCurWorld = false


----仙愁峡01
CameraTarget[2055] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2055].targetCamera_ids = "1785, 1834, 1789, 1793, 1797, 1836, 1837"
CameraTarget[2055].duration = "2, 4, 5, 4, 2, 3"
CameraTarget[2055].indexOnlyShowOnce = -1
CameraTarget[2055].showOnceInCurWorld = false


----少林寺01
CameraTarget[2059] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2059].targetCamera_ids = "4818, 4819"
CameraTarget[2059].duration = "4"
CameraTarget[2059].indexOnlyShowOnce = -1
CameraTarget[2059].showOnceInCurWorld = false


----少林寺02
CameraTarget[2060] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2060].targetCamera_ids = "1850, 4814"
CameraTarget[2060].duration = "5"
CameraTarget[2060].indexOnlyShowOnce = -1
CameraTarget[2060].showOnceInCurWorld = false


----少林寺03
CameraTarget[2061] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2061].targetCamera_ids = "4817, 4816"
CameraTarget[2061].duration = "4"
CameraTarget[2061].indexOnlyShowOnce = -1
CameraTarget[2061].showOnceInCurWorld = false


----少林寺04
CameraTarget[2062] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2062].targetCamera_ids = "4820, 4821"
CameraTarget[2062].duration = "4"
CameraTarget[2062].indexOnlyShowOnce = -1
CameraTarget[2062].showOnceInCurWorld = false


----衡山01
CameraTarget[2063] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2063].targetCamera_ids = "1917, 1918"
CameraTarget[2063].duration = "3"
CameraTarget[2063].indexOnlyShowOnce = -1
CameraTarget[2063].showOnceInCurWorld = false


----衡山02
CameraTarget[2064] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2064].targetCamera_ids = "1909, 1911, 1910, 1912"
CameraTarget[2064].duration = "4, 3, 4"
CameraTarget[2064].indexOnlyShowOnce = -1
CameraTarget[2064].showOnceInCurWorld = false


----衡山03
CameraTarget[2065] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2065].targetCamera_ids = "1913, 1914"
CameraTarget[2065].duration = "4"
CameraTarget[2065].indexOnlyShowOnce = -1
CameraTarget[2065].showOnceInCurWorld = false


----衡山04
CameraTarget[2066] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2066].targetCamera_ids = "1915, 1916"
CameraTarget[2066].duration = "3"
CameraTarget[2066].indexOnlyShowOnce = -1
CameraTarget[2066].showOnceInCurWorld = false


----衡山城01
CameraTarget[2067] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2067].targetCamera_ids = "1932, 1933, 1934, 1935"
CameraTarget[2067].duration = "4, 3, 4"
CameraTarget[2067].indexOnlyShowOnce = -1
CameraTarget[2067].showOnceInCurWorld = false


----衡山城02
CameraTarget[2068] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2068].targetCamera_ids = "1936, 1937, 1938"
CameraTarget[2068].duration = "6, 5"
CameraTarget[2068].indexOnlyShowOnce = -1
CameraTarget[2068].showOnceInCurWorld = false


----逍遥01
CameraTarget[2069] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2069].targetCamera_ids = "1941, 1939, 1940"
CameraTarget[2069].duration = "4, 5"
CameraTarget[2069].indexOnlyShowOnce = -1
CameraTarget[2069].showOnceInCurWorld = false


----逍遥02
CameraTarget[2070] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2070].targetCamera_ids = "1942, 1943"
CameraTarget[2070].duration = "4"
CameraTarget[2070].indexOnlyShowOnce = -1
CameraTarget[2070].showOnceInCurWorld = false


----逍遥03
CameraTarget[2071] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2071].targetCamera_ids = "4838, 4839"
CameraTarget[2071].duration = "5"
CameraTarget[2071].indexOnlyShowOnce = -1
CameraTarget[2071].showOnceInCurWorld = false


----杭州01
CameraTarget[2072] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2072].targetCamera_ids = "1949, 1950, 1953, 1954, 1955, 1957"
CameraTarget[2072].duration = "4, 2, 2, 2, 2"
CameraTarget[2072].indexOnlyShowOnce = -1
CameraTarget[2072].showOnceInCurWorld = false


----杭州02
CameraTarget[2073] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2073].targetCamera_ids = "1960, 1958, 1959"
CameraTarget[2073].duration = "3, 4"
CameraTarget[2073].indexOnlyShowOnce = -1
CameraTarget[2073].showOnceInCurWorld = false


----杭州03
CameraTarget[2074] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2074].targetCamera_ids = "1961, 1962"
CameraTarget[2074].duration = "4"
CameraTarget[2074].indexOnlyShowOnce = -1
CameraTarget[2074].showOnceInCurWorld = false


----绿竹巷入口
CameraTarget[2075] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2075].targetCamera_ids = "1970, 1969, 1982"
CameraTarget[2075].duration = "5, 2"
CameraTarget[2075].indexOnlyShowOnce = -1
CameraTarget[2075].showOnceInCurWorld = false


----绿竹巷1号版面boss
CameraTarget[2076] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2076].targetCamera_ids = "1983, 1986, 1984"
CameraTarget[2076].duration = "5, 4"
CameraTarget[2076].indexOnlyShowOnce = -1
CameraTarget[2076].showOnceInCurWorld = false


----绿竹巷2号版面平台
CameraTarget[2077] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2077].targetCamera_ids = "1987, 2053, 2054, 2056, 2055"
CameraTarget[2077].duration = "5, 2, 3, 3"
CameraTarget[2077].indexOnlyShowOnce = -1
CameraTarget[2077].showOnceInCurWorld = false


----福州城01
CameraTarget[2078] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2078].targetCamera_ids = "1897, 5136"
CameraTarget[2078].duration = "6"
CameraTarget[2078].indexOnlyShowOnce = -1
CameraTarget[2078].showOnceInCurWorld = false


----福州城02
CameraTarget[2079] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2079].targetCamera_ids = "5137, 5138, 5139, 5145"
CameraTarget[2079].duration = "5, 4, 3"
CameraTarget[2079].indexOnlyShowOnce = -1
CameraTarget[2079].showOnceInCurWorld = false


----福州城03
CameraTarget[2080] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2080].targetCamera_ids = "5140, 5141, 5142, 5144"
CameraTarget[2080].duration = "3, 2, 4"
CameraTarget[2080].indexOnlyShowOnce = -1
CameraTarget[2080].showOnceInCurWorld = false


----绿竹巷3号版面竹筏01
CameraTarget[2081] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2081].targetCamera_ids = "2057, 2058"
CameraTarget[2081].duration = "3"
CameraTarget[2081].indexOnlyShowOnce = -1
CameraTarget[2081].showOnceInCurWorld = false


----绿竹巷3号版面竹筏02
CameraTarget[2082] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2082].targetCamera_ids = "2059, 2060"
CameraTarget[2082].duration = "4"
CameraTarget[2082].indexOnlyShowOnce = -1
CameraTarget[2082].showOnceInCurWorld = false


----绿竹巷4号版面任盈盈对话01
CameraTarget[2083] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2083].targetCamera_ids = "2066, 2070"
CameraTarget[2083].duration = "4"
CameraTarget[2083].indexOnlyShowOnce = -1
CameraTarget[2083].showOnceInCurWorld = false


----绿竹巷4号版面任盈盈对话02
CameraTarget[2084] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2084].targetCamera_ids = "2068, 2069"
CameraTarget[2084].duration = "6"
CameraTarget[2084].indexOnlyShowOnce = -1
CameraTarget[2084].showOnceInCurWorld = false


----绿竹巷最终boss
CameraTarget[2085] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2085].targetCamera_ids = "2072, 2071, 2082"
CameraTarget[2085].duration = "6, 3"
CameraTarget[2085].indexOnlyShowOnce = -1
CameraTarget[2085].showOnceInCurWorld = false


----绿竹巷小boss喊话01
CameraTarget[2086] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2086].targetCamera_ids = "2073, 2074"
CameraTarget[2086].duration = "2"
CameraTarget[2086].indexOnlyShowOnce = -1
CameraTarget[2086].showOnceInCurWorld = false


----绿竹巷小boss喊话02
CameraTarget[2087] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2087].targetCamera_ids = "2075, 2076"
CameraTarget[2087].duration = "2"
CameraTarget[2087].indexOnlyShowOnce = -1
CameraTarget[2087].showOnceInCurWorld = false


----福州城塔探索
CameraTarget[20101] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[20101].targetCamera_ids = "3902, 3903, 3904"
CameraTarget[20101].duration = "6, 6"
CameraTarget[20101].indexOnlyShowOnce = -1
CameraTarget[20101].showOnceInCurWorld = false


----嵩山探索
CameraTarget[2089] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2089].targetCamera_ids = "2571, 2573, 2575, 2576"
CameraTarget[2089].duration = "4, 3, 6"
CameraTarget[2089].indexOnlyShowOnce = -1
CameraTarget[2089].showOnceInCurWorld = false


----西安城探索01
CameraTarget[2090] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2090].targetCamera_ids = "3916, 3918"
CameraTarget[2090].duration = "4"
CameraTarget[2090].indexOnlyShowOnce = -1
CameraTarget[2090].showOnceInCurWorld = false


----西安城探索02
CameraTarget[2091] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2091].targetCamera_ids = "3922, 3923"
CameraTarget[2091].duration = "5"
CameraTarget[2091].indexOnlyShowOnce = -1
CameraTarget[2091].showOnceInCurWorld = false


----西安城探索03
CameraTarget[2092] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2092].targetCamera_ids = "3920, 3919, 3921"
CameraTarget[2092].duration = "4, 6"
CameraTarget[2092].indexOnlyShowOnce = -1
CameraTarget[2092].showOnceInCurWorld = false


----华山脚下探索01
CameraTarget[2093] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2093].targetCamera_ids = "3935, 3934, 3931"
CameraTarget[2093].duration = "4, 5"
CameraTarget[2093].indexOnlyShowOnce = -1
CameraTarget[2093].showOnceInCurWorld = false


----华山脚下探索02
CameraTarget[2094] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2094].targetCamera_ids = "3932, 3933"
CameraTarget[2094].duration = "4"
CameraTarget[2094].indexOnlyShowOnce = -1
CameraTarget[2094].showOnceInCurWorld = false


----华山派探索01
CameraTarget[2095] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2095].targetCamera_ids = "3944, 3945, 5458"
CameraTarget[2095].duration = "5, 3"
CameraTarget[2095].indexOnlyShowOnce = -1
CameraTarget[2095].showOnceInCurWorld = false


----华山派探索02
CameraTarget[2096] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2096].targetCamera_ids = "3946, 3947"
CameraTarget[2096].duration = "6"
CameraTarget[2096].indexOnlyShowOnce = -1
CameraTarget[2096].showOnceInCurWorld = false


----铸剑谷探索01
CameraTarget[2097] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2097].targetCamera_ids = "4029, 4031"
CameraTarget[2097].duration = "4"
CameraTarget[2097].indexOnlyShowOnce = -1
CameraTarget[2097].showOnceInCurWorld = false


----铸剑谷探索02
CameraTarget[2098] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2098].targetCamera_ids = "4032, 4033"
CameraTarget[2098].duration = "5"
CameraTarget[2098].indexOnlyShowOnce = -1
CameraTarget[2098].showOnceInCurWorld = false


----铸剑谷探索03
CameraTarget[2099] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2099].targetCamera_ids = "4034, 4036, 4035"
CameraTarget[2099].duration = "5, 7"
CameraTarget[2099].indexOnlyShowOnce = -1
CameraTarget[2099].showOnceInCurWorld = false


----龙泉探索01
CameraTarget[2100] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2100].targetCamera_ids = "4037, 4038"
CameraTarget[2100].duration = "8"
CameraTarget[2100].indexOnlyShowOnce = -1
CameraTarget[2100].showOnceInCurWorld = false


----龙泉探索02
CameraTarget[2101] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2101].targetCamera_ids = "4039, 4040"
CameraTarget[2101].duration = "7"
CameraTarget[2101].indexOnlyShowOnce = -1
CameraTarget[2101].showOnceInCurWorld = false


----龙泉黑木门探索01
CameraTarget[2102] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2102].targetCamera_ids = "4041, 4043"
CameraTarget[2102].duration = "4"
CameraTarget[2102].indexOnlyShowOnce = -1
CameraTarget[2102].showOnceInCurWorld = false


----龙泉黑木门探索02
CameraTarget[2103] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2103].targetCamera_ids = "4044, 4045, 4046"
CameraTarget[2103].duration = "5, 3"
CameraTarget[2103].indexOnlyShowOnce = -1
CameraTarget[2103].showOnceInCurWorld = false


----桂林探索01
CameraTarget[2104] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2104].targetCamera_ids = "4050, 4052"
CameraTarget[2104].duration = "6"
CameraTarget[2104].indexOnlyShowOnce = -1
CameraTarget[2104].showOnceInCurWorld = false


----桂林探索02
CameraTarget[2105] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2105].targetCamera_ids = "4053, 4055, 4060, 4056"
CameraTarget[2105].duration = "5, 4, 4"
CameraTarget[2105].indexOnlyShowOnce = -1
CameraTarget[2105].showOnceInCurWorld = false


----南疆探索01
CameraTarget[2106] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2106].targetCamera_ids = "4066, 4067"
CameraTarget[2106].duration = "4"
CameraTarget[2106].indexOnlyShowOnce = -1
CameraTarget[2106].showOnceInCurWorld = false


----南疆探索02
CameraTarget[2107] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2107].targetCamera_ids = "4068, 4069"
CameraTarget[2107].duration = "5"
CameraTarget[2107].indexOnlyShowOnce = -1
CameraTarget[2107].showOnceInCurWorld = false


----五仙教探索
CameraTarget[2108] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2108].targetCamera_ids = "4070, 4071, 4072, 4073"
CameraTarget[2108].duration = "4, 3, 6"
CameraTarget[2108].indexOnlyShowOnce = -1
CameraTarget[2108].showOnceInCurWorld = false


----太室山探索01
CameraTarget[2109] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2109].targetCamera_ids = "4077, 4078, 4079, 4083"
CameraTarget[2109].duration = "4, 5, 4"
CameraTarget[2109].indexOnlyShowOnce = -1
CameraTarget[2109].showOnceInCurWorld = false


----洛阳探索01
CameraTarget[2110] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2110].targetCamera_ids = "4084, 4085, 4086, 4915"
CameraTarget[2110].duration = "4, 3, 3"
CameraTarget[2110].indexOnlyShowOnce = -1
CameraTarget[2110].showOnceInCurWorld = false


----洛阳探索02
CameraTarget[2111] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2111].targetCamera_ids = "4087, 4088"
CameraTarget[2111].duration = "6"
CameraTarget[2111].indexOnlyShowOnce = -1
CameraTarget[2111].showOnceInCurWorld = false


----洛阳探索03
CameraTarget[2112] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2112].targetCamera_ids = "4089, 4090"
CameraTarget[2112].duration = "6"
CameraTarget[2112].indexOnlyShowOnce = -1
CameraTarget[2112].showOnceInCurWorld = false


----乐山探索01
CameraTarget[2113] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2113].targetCamera_ids = "4092, 4091, 4095"
CameraTarget[2113].duration = "5, 6"
CameraTarget[2113].indexOnlyShowOnce = -1
CameraTarget[2113].showOnceInCurWorld = false


----乐山探索02
CameraTarget[2114] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2114].targetCamera_ids = "4094, 4093"
CameraTarget[2114].duration = "5"
CameraTarget[2114].indexOnlyShowOnce = -1
CameraTarget[2114].showOnceInCurWorld = false


----乐山探索03
CameraTarget[2115] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2115].targetCamera_ids = "4096, 4097"
CameraTarget[2115].duration = "6"
CameraTarget[2115].indexOnlyShowOnce = -1
CameraTarget[2115].showOnceInCurWorld = false


----乐山索道探索01
CameraTarget[2116] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2116].targetCamera_ids = "4098, 4099, 4100, 4101"
CameraTarget[2116].duration = "5, 3, 4"
CameraTarget[2116].indexOnlyShowOnce = -1
CameraTarget[2116].showOnceInCurWorld = false


----乐山索道探索02
CameraTarget[2117] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2117].targetCamera_ids = "4102, 4103, 4104, 4105"
CameraTarget[2117].duration = "5, 3, 4"
CameraTarget[2117].indexOnlyShowOnce = -1
CameraTarget[2117].showOnceInCurWorld = false


----蜀南竹海探索01
CameraTarget[2118] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2118].targetCamera_ids = "4106, 4107"
CameraTarget[2118].duration = "4"
CameraTarget[2118].indexOnlyShowOnce = -1
CameraTarget[2118].showOnceInCurWorld = false


----蜀南竹海探索02
CameraTarget[2119] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2119].targetCamera_ids = "4111, 4112"
CameraTarget[2119].duration = "4"
CameraTarget[2119].indexOnlyShowOnce = -1
CameraTarget[2119].showOnceInCurWorld = false


----蜀南竹海探索03
CameraTarget[2120] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2120].targetCamera_ids = "4108, 4109"
CameraTarget[2120].duration = "7"
CameraTarget[2120].indexOnlyShowOnce = -1
CameraTarget[2120].showOnceInCurWorld = false


----朱仙镇探索01
CameraTarget[2121] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2121].targetCamera_ids = "4124, 4125"
CameraTarget[2121].duration = "4"
CameraTarget[2121].indexOnlyShowOnce = -1
CameraTarget[2121].showOnceInCurWorld = false


----朱仙镇探索02
CameraTarget[2122] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2122].targetCamera_ids = "4126, 4128"
CameraTarget[2122].duration = "4"
CameraTarget[2122].indexOnlyShowOnce = -1
CameraTarget[2122].showOnceInCurWorld = false


----朱仙镇探索03
CameraTarget[2123] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2123].targetCamera_ids = "4127, 4129"
CameraTarget[2123].duration = "3"
CameraTarget[2123].indexOnlyShowOnce = -1
CameraTarget[2123].showOnceInCurWorld = false


----朱仙镇探索04
CameraTarget[2124] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2124].targetCamera_ids = "4130, 4131"
CameraTarget[2124].duration = "6"
CameraTarget[2124].indexOnlyShowOnce = -1
CameraTarget[2124].showOnceInCurWorld = false


----五霸岗探索01
CameraTarget[2125] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2125].targetCamera_ids = "4132, 4133, 4134"
CameraTarget[2125].duration = "3, 5"
CameraTarget[2125].indexOnlyShowOnce = -1
CameraTarget[2125].showOnceInCurWorld = false


----五霸岗探索02
CameraTarget[2126] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2126].targetCamera_ids = "4135, 4136"
CameraTarget[2126].duration = "4"
CameraTarget[2126].indexOnlyShowOnce = -1
CameraTarget[2126].showOnceInCurWorld = false


----唐门探索01
CameraTarget[2127] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2127].targetCamera_ids = "4137, 4138, 4139"
CameraTarget[2127].duration = "3, 5"
CameraTarget[2127].indexOnlyShowOnce = -1
CameraTarget[2127].showOnceInCurWorld = false


----唐门探索02
CameraTarget[2128] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2128].targetCamera_ids = "4140, 4141"
CameraTarget[2128].duration = "4"
CameraTarget[2128].indexOnlyShowOnce = -1
CameraTarget[2128].showOnceInCurWorld = false


----唐门探索03
CameraTarget[2129] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2129].targetCamera_ids = "4144, 4142"
CameraTarget[2129].duration = "3"
CameraTarget[2129].indexOnlyShowOnce = -1
CameraTarget[2129].showOnceInCurWorld = false


----唐门探索04
CameraTarget[2130] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2130].targetCamera_ids = "4145, 4150"
CameraTarget[2130].duration = "6"
CameraTarget[2130].indexOnlyShowOnce = -1
CameraTarget[2130].showOnceInCurWorld = false


----唐门书房探索01
CameraTarget[2131] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2131].targetCamera_ids = "4147, 4148, 4149"
CameraTarget[2131].duration = "3, 4"
CameraTarget[2131].indexOnlyShowOnce = -1
CameraTarget[2131].showOnceInCurWorld = false


----峨嵋门派探索01
CameraTarget[2132] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2132].targetCamera_ids = "4151, 4152"
CameraTarget[2132].duration = "6"
CameraTarget[2132].indexOnlyShowOnce = -1
CameraTarget[2132].showOnceInCurWorld = false


----峨嵋门派探索02
CameraTarget[2133] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2133].targetCamera_ids = "4155, 4156"
CameraTarget[2133].duration = "5"
CameraTarget[2133].indexOnlyShowOnce = -1
CameraTarget[2133].showOnceInCurWorld = false


----峨嵋门派探索03
CameraTarget[2134] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2134].targetCamera_ids = "4158, 4157"
CameraTarget[2134].duration = "5"
CameraTarget[2134].indexOnlyShowOnce = -1
CameraTarget[2134].showOnceInCurWorld = false


----峨嵋门派探索04
CameraTarget[2135] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2135].targetCamera_ids = "4159, 4160, 4161"
CameraTarget[2135].duration = "5, 6"
CameraTarget[2135].indexOnlyShowOnce = -1
CameraTarget[2135].showOnceInCurWorld = false


----恒山派探索01
CameraTarget[2136] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2136].targetCamera_ids = "4163, 4162"
CameraTarget[2136].duration = "3"
CameraTarget[2136].indexOnlyShowOnce = -1
CameraTarget[2136].showOnceInCurWorld = false


----恒山派探索02
CameraTarget[2137] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2137].targetCamera_ids = "4165, 4164"
CameraTarget[2137].duration = "2"
CameraTarget[2137].indexOnlyShowOnce = -1
CameraTarget[2137].showOnceInCurWorld = false


----恒山派探索03
CameraTarget[2138] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2138].targetCamera_ids = "4168, 4169, 4170"
CameraTarget[2138].duration = "4, 3"
CameraTarget[2138].indexOnlyShowOnce = -1
CameraTarget[2138].showOnceInCurWorld = false


----恒山派悬崖探索
CameraTarget[2139] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2139].targetCamera_ids = "4171, 4172, 4173, 4174"
CameraTarget[2139].duration = "4, 2, 3"
CameraTarget[2139].indexOnlyShowOnce = -1
CameraTarget[2139].showOnceInCurWorld = false


----恒山派门派探索
CameraTarget[2140] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2140].targetCamera_ids = "4176, 4177, 4178, 4179"
CameraTarget[2140].duration = "3, 2, 4"
CameraTarget[2140].indexOnlyShowOnce = -1
CameraTarget[2140].showOnceInCurWorld = false


----廿八铺探索
CameraTarget[2141] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2141].targetCamera_ids = "4190, 4191, 4192, 4193, 4194"
CameraTarget[2141].duration = "4, 3, 2, 4"
CameraTarget[2141].indexOnlyShowOnce = -1
CameraTarget[2141].showOnceInCurWorld = false


----泰山派探索01
CameraTarget[2142] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2142].targetCamera_ids = "4328, 4329"
CameraTarget[2142].duration = "4"
CameraTarget[2142].indexOnlyShowOnce = -1
CameraTarget[2142].showOnceInCurWorld = false


----泰山派探索02
CameraTarget[2143] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2143].targetCamera_ids = "4330, 4331"
CameraTarget[2143].duration = "5"
CameraTarget[2143].indexOnlyShowOnce = -1
CameraTarget[2143].showOnceInCurWorld = false


----泰山派探索03
CameraTarget[2144] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2144].targetCamera_ids = "4332, 4333"
CameraTarget[2144].duration = "5"
CameraTarget[2144].indexOnlyShowOnce = -1
CameraTarget[2144].showOnceInCurWorld = false


----大理城探索01
CameraTarget[2145] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2145].targetCamera_ids = "4336, 4337, 4338, 4339"
CameraTarget[2145].duration = "4, 3, 3"
CameraTarget[2145].indexOnlyShowOnce = -1
CameraTarget[2145].showOnceInCurWorld = false


----大理城探索02
CameraTarget[2146] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2146].targetCamera_ids = "4341, 4342"
CameraTarget[2146].duration = "5"
CameraTarget[2146].indexOnlyShowOnce = -1
CameraTarget[2146].showOnceInCurWorld = false


----大理城探索03
CameraTarget[2147] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2147].targetCamera_ids = "4345, 4343"
CameraTarget[2147].duration = "3"
CameraTarget[2147].indexOnlyShowOnce = -1
CameraTarget[2147].showOnceInCurWorld = false


----大理城探索04
CameraTarget[2148] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2148].targetCamera_ids = "4348, 4347"
CameraTarget[2148].duration = "4"
CameraTarget[2148].indexOnlyShowOnce = -1
CameraTarget[2148].showOnceInCurWorld = false


----灭门镜头01
CameraTarget[2149] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2149].targetCamera_ids = "4707, 4709"
CameraTarget[2149].duration = "4"
CameraTarget[2149].indexOnlyShowOnce = -1
CameraTarget[2149].showOnceInCurWorld = false


----灭门镜头02
CameraTarget[2150] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2150].targetCamera_ids = "4712, 4711"
CameraTarget[2150].duration = "3"
CameraTarget[2150].indexOnlyShowOnce = -1
CameraTarget[2150].showOnceInCurWorld = false


----灭门镜头03
CameraTarget[2151] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2151].targetCamera_ids = "4713, 4714"
CameraTarget[2151].duration = "3"
CameraTarget[2151].indexOnlyShowOnce = -1
CameraTarget[2151].showOnceInCurWorld = false


----灭门镜头04
CameraTarget[2152] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2152].targetCamera_ids = "4715, 4716"
CameraTarget[2152].duration = "6"
CameraTarget[2152].indexOnlyShowOnce = -1
CameraTarget[2152].showOnceInCurWorld = false


----灭门镜头05
CameraTarget[2153] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2153].targetCamera_ids = "4717, 4718"
CameraTarget[2153].duration = "5"
CameraTarget[2153].indexOnlyShowOnce = -1
CameraTarget[2153].showOnceInCurWorld = false


----灭门镜头06
CameraTarget[2154] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2154].targetCamera_ids = "4722, 4721"
CameraTarget[2154].duration = "5"
CameraTarget[2154].indexOnlyShowOnce = -1
CameraTarget[2154].showOnceInCurWorld = false


----授谱镜头01
CameraTarget[2155] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2155].targetCamera_ids = "4745, 4747"
CameraTarget[2155].duration = "4"
CameraTarget[2155].indexOnlyShowOnce = -1
CameraTarget[2155].showOnceInCurWorld = false


----授谱镜头02
CameraTarget[2156] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2156].targetCamera_ids = "4748, 4749"
CameraTarget[2156].duration = "5"
CameraTarget[2156].indexOnlyShowOnce = -1
CameraTarget[2156].showOnceInCurWorld = false


----授谱镜头03
CameraTarget[2157] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2157].targetCamera_ids = "4753, 4754"
CameraTarget[2157].duration = "5"
CameraTarget[2157].indexOnlyShowOnce = -1
CameraTarget[2157].showOnceInCurWorld = false


----雨夜镜头01
CameraTarget[2158] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2158].targetCamera_ids = "4762, 4763"
CameraTarget[2158].duration = "4"
CameraTarget[2158].indexOnlyShowOnce = -1
CameraTarget[2158].showOnceInCurWorld = false


----雨夜镜头02
CameraTarget[2159] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2159].targetCamera_ids = "4760, 4764"
CameraTarget[2159].duration = "5"
CameraTarget[2159].indexOnlyShowOnce = -1
CameraTarget[2159].showOnceInCurWorld = false


----雨夜镜头03
CameraTarget[2160] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2160].targetCamera_ids = "4779, 4777"
CameraTarget[2160].duration = "4"
CameraTarget[2160].indexOnlyShowOnce = -1
CameraTarget[2160].showOnceInCurWorld = false


----换血镜头01
CameraTarget[2161] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2161].targetCamera_ids = "4780, 4781"
CameraTarget[2161].duration = "6"
CameraTarget[2161].indexOnlyShowOnce = -1
CameraTarget[2161].showOnceInCurWorld = false


----换血镜头02
CameraTarget[2162] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2162].targetCamera_ids = "4784, 4785"
CameraTarget[2162].duration = "4"
CameraTarget[2162].indexOnlyShowOnce = -1
CameraTarget[2162].showOnceInCurWorld = false


----换血镜头03
CameraTarget[2163] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2163].targetCamera_ids = "4786, 4787"
CameraTarget[2163].duration = "5"
CameraTarget[2163].indexOnlyShowOnce = -1
CameraTarget[2163].showOnceInCurWorld = false


----嵩山探索瀑布01
CameraTarget[2164] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2164].targetCamera_ids = "4794, 4795"
CameraTarget[2164].duration = "5"
CameraTarget[2164].indexOnlyShowOnce = -1
CameraTarget[2164].showOnceInCurWorld = false


----嵩山探索瀑布02
CameraTarget[2165] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2165].targetCamera_ids = "4796, 4797"
CameraTarget[2165].duration = "6"
CameraTarget[2165].indexOnlyShowOnce = -1
CameraTarget[2165].showOnceInCurWorld = false


----余杭新探索镜头01
CameraTarget[2166] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2166].targetCamera_ids = "4800, 4801"
CameraTarget[2166].duration = "5"
CameraTarget[2166].indexOnlyShowOnce = -1
CameraTarget[2166].showOnceInCurWorld = false


----余杭新探索镜头02
CameraTarget[2167] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2167].targetCamera_ids = "4798, 4799"
CameraTarget[2167].duration = "4"
CameraTarget[2167].indexOnlyShowOnce = -1
CameraTarget[2167].showOnceInCurWorld = false


----余杭新探索镜头03
CameraTarget[2168] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2168].targetCamera_ids = "4802, 4803"
CameraTarget[2168].duration = "5"
CameraTarget[2168].indexOnlyShowOnce = -1
CameraTarget[2168].showOnceInCurWorld = false


----廿八铺探索镜头02
CameraTarget[2169] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2169].targetCamera_ids = "4806, 4807"
CameraTarget[2169].duration = "4"
CameraTarget[2169].indexOnlyShowOnce = -1
CameraTarget[2169].showOnceInCurWorld = false


----廿八铺探索镜头03
CameraTarget[2170] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2170].targetCamera_ids = "4808, 4809"
CameraTarget[2170].duration = "4"
CameraTarget[2170].indexOnlyShowOnce = -1
CameraTarget[2170].showOnceInCurWorld = false


----武当派探索镜头01
CameraTarget[2171] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2171].targetCamera_ids = "4823, 4824"
CameraTarget[2171].duration = "5"
CameraTarget[2171].indexOnlyShowOnce = -1
CameraTarget[2171].showOnceInCurWorld = false


----武当派探索镜头02
CameraTarget[2172] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2172].targetCamera_ids = "4830, 4829"
CameraTarget[2172].duration = "4"
CameraTarget[2172].indexOnlyShowOnce = -1
CameraTarget[2172].showOnceInCurWorld = false


----武当派探索镜头03
CameraTarget[2173] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2173].targetCamera_ids = "4833, 4834"
CameraTarget[2173].duration = "4"
CameraTarget[2173].indexOnlyShowOnce = -1
CameraTarget[2173].showOnceInCurWorld = false


----武当山探索镜头04
CameraTarget[2174] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2174].targetCamera_ids = "4827, 4826, 4825"
CameraTarget[2174].duration = "4, 5"
CameraTarget[2174].indexOnlyShowOnce = -1
CameraTarget[2174].showOnceInCurWorld = false


----新手村探索镜头01
CameraTarget[2175] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2175].targetCamera_ids = "4888, 4889"
CameraTarget[2175].duration = "6"
CameraTarget[2175].indexOnlyShowOnce = -1
CameraTarget[2175].showOnceInCurWorld = false


----新手村探索镜头02
CameraTarget[2176] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2176].targetCamera_ids = "4890, 4891, 4896"
CameraTarget[2176].duration = "4, 3"
CameraTarget[2176].indexOnlyShowOnce = -1
CameraTarget[2176].showOnceInCurWorld = false


----新手村探索镜头03
CameraTarget[2178] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2178].targetCamera_ids = "4892, 4893"
CameraTarget[2178].duration = "6"
CameraTarget[2178].indexOnlyShowOnce = -1
CameraTarget[2178].showOnceInCurWorld = false


----新手村探索镜头04
CameraTarget[2179] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2179].targetCamera_ids = "4894, 4895"
CameraTarget[2179].duration = "5"
CameraTarget[2179].indexOnlyShowOnce = -1
CameraTarget[2179].showOnceInCurWorld = false


----梅庄地牢01
CameraTarget[2180] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2180].targetCamera_ids = "5007, 5008, 5009"
CameraTarget[2180].duration = "3, 3"
CameraTarget[2180].indexOnlyShowOnce = -1
CameraTarget[2180].showOnceInCurWorld = false


----梅庄酒桥预览
CameraTarget[2181] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2181].targetCamera_ids = "4991, 4987, 4988, 4989"
CameraTarget[2181].duration = "1, 4, 2"
CameraTarget[2181].indexOnlyShowOnce = -1
CameraTarget[2181].showOnceInCurWorld = false


----酒窖预览镜头
CameraTarget[2182] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2182].targetCamera_ids = "4998, 4999, 5000, 5001"
CameraTarget[2182].duration = "4, 2, 3"
CameraTarget[2182].indexOnlyShowOnce = -1
CameraTarget[2182].showOnceInCurWorld = false


----书桥预览镜头01
CameraTarget[2183] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2183].targetCamera_ids = "4992, 4993"
CameraTarget[2183].duration = "5"
CameraTarget[2183].indexOnlyShowOnce = -1
CameraTarget[2183].showOnceInCurWorld = false


----书桥预览镜头02
CameraTarget[2184] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2184].targetCamera_ids = "4994, 4997, 4996"
CameraTarget[2184].duration = "2, 2"
CameraTarget[2184].indexOnlyShowOnce = -1
CameraTarget[2184].showOnceInCurWorld = false


----围棋大厅01
CameraTarget[2185] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2185].targetCamera_ids = "5004, 5005"
CameraTarget[2185].duration = "3"
CameraTarget[2185].indexOnlyShowOnce = -1
CameraTarget[2185].showOnceInCurWorld = false


----围棋大厅02
CameraTarget[2186] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2186].targetCamera_ids = "5002, 5003"
CameraTarget[2186].duration = "3"
CameraTarget[2186].indexOnlyShowOnce = -1
CameraTarget[2186].showOnceInCurWorld = false


----恒山派探索镜头01
CameraTarget[2187] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2187].targetCamera_ids = "5393, 5396, 5397, 5403"
CameraTarget[2187].duration = "3, 2, 2"
CameraTarget[2187].indexOnlyShowOnce = -1
CameraTarget[2187].showOnceInCurWorld = false


----恒山派探索镜头02
CameraTarget[2188] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2188].targetCamera_ids = "5408, 5399, 5400, 5409"
CameraTarget[2188].duration = "3, 2, 3"
CameraTarget[2188].indexOnlyShowOnce = -1
CameraTarget[2188].showOnceInCurWorld = false


----恒山派探索镜头03
CameraTarget[2189] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2189].targetCamera_ids = "4176, 5413, 4178, 4179, 5414"
CameraTarget[2189].duration = "2, 3, 2, 3"
CameraTarget[2189].indexOnlyShowOnce = -1
CameraTarget[2189].showOnceInCurWorld = false


----黑木崖探索镜头01
CameraTarget[2190] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2190].targetCamera_ids = "5219, 5220"
CameraTarget[2190].duration = "3"
CameraTarget[2190].indexOnlyShowOnce = -1
CameraTarget[2190].showOnceInCurWorld = false


----黑木崖探索镜头02
CameraTarget[2191] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2191].targetCamera_ids = "5245, 5247, 5248, 5240, 5252"
CameraTarget[2191].duration = "3, 2, 2, 3"
CameraTarget[2191].indexOnlyShowOnce = -1
CameraTarget[2191].showOnceInCurWorld = false


----黑木崖探索镜头03
CameraTarget[2192] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2192].targetCamera_ids = "5223, 5224"
CameraTarget[2192].duration = "3"
CameraTarget[2192].indexOnlyShowOnce = -1
CameraTarget[2192].showOnceInCurWorld = false


----黑木崖探索镜头04
CameraTarget[2193] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2193].targetCamera_ids = "5225, 5226"
CameraTarget[2193].duration = "3"
CameraTarget[2193].indexOnlyShowOnce = -1
CameraTarget[2193].showOnceInCurWorld = false


----黑木崖探索镜头05
CameraTarget[2194] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2194].targetCamera_ids = "5228, 5238, 5227"
CameraTarget[2194].duration = "3, 2"
CameraTarget[2194].indexOnlyShowOnce = -1
CameraTarget[2194].showOnceInCurWorld = false


----黑木崖日月探索
CameraTarget[2195] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2195].targetCamera_ids = "5259, 5260, 5261, 5263, 5264, 5285, 5269, 5270, 5272, 5271, 5286"
CameraTarget[2195].duration = "5, 2, 2, 3, 1, 2, 1, 3, 4, 2"
CameraTarget[2195].indexOnlyShowOnce = -1
CameraTarget[2195].showOnceInCurWorld = false


----新手村任务镜头组01
CameraTarget[2196] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2196].targetCamera_ids = "5391, 5392"
CameraTarget[2196].duration = "4"
CameraTarget[2196].indexOnlyShowOnce = -1
CameraTarget[2196].showOnceInCurWorld = false


----新手村任务镜头组02
CameraTarget[2197] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2197].targetCamera_ids = "5405, 5407"
CameraTarget[2197].duration = "3"
CameraTarget[2197].indexOnlyShowOnce = -1
CameraTarget[2197].showOnceInCurWorld = false


----授谱终结剧情合奏01
CameraTarget[2198] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2198].targetCamera_ids = "5330, 5331"
CameraTarget[2198].duration = "5"
CameraTarget[2198].indexOnlyShowOnce = -1
CameraTarget[2198].showOnceInCurWorld = false


----授谱终结剧情合奏02
CameraTarget[2199] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2199].targetCamera_ids = "5332, 5333"
CameraTarget[2199].duration = "5"
CameraTarget[2199].indexOnlyShowOnce = -1
CameraTarget[2199].showOnceInCurWorld = false


----授谱终结剧情费彬01
CameraTarget[2200] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2200].targetCamera_ids = "5423, 5424"
CameraTarget[2200].duration = "3"
CameraTarget[2200].indexOnlyShowOnce = -1
CameraTarget[2200].showOnceInCurWorld = false


----授谱终结剧情费彬02
CameraTarget[2201] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2201].targetCamera_ids = "5425, 5426"
CameraTarget[2201].duration = "4"
CameraTarget[2201].indexOnlyShowOnce = -1
CameraTarget[2201].showOnceInCurWorld = false


----授谱终结剧情令狐冲01
CameraTarget[2202] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2202].targetCamera_ids = "5427, 5428"
CameraTarget[2202].duration = "3"
CameraTarget[2202].indexOnlyShowOnce = -1
CameraTarget[2202].showOnceInCurWorld = false


----授谱终结剧情令狐冲02
CameraTarget[2203] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2203].targetCamera_ids = "5429, 5430"
CameraTarget[2203].duration = "4"
CameraTarget[2203].indexOnlyShowOnce = -1
CameraTarget[2203].showOnceInCurWorld = false


----授谱终结剧情令狐冲03
CameraTarget[2204] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2204].targetCamera_ids = "5432, 5434"
CameraTarget[2204].duration = "4"
CameraTarget[2204].indexOnlyShowOnce = -1
CameraTarget[2204].showOnceInCurWorld = false


----授谱终结剧情莫大01
CameraTarget[2205] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2205].targetCamera_ids = "5442, 5441"
CameraTarget[2205].duration = "2"
CameraTarget[2205].indexOnlyShowOnce = -1
CameraTarget[2205].showOnceInCurWorld = false


----授谱终结剧情莫大02
CameraTarget[2206] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2206].targetCamera_ids = "5446, 5447"
CameraTarget[2206].duration = "4"
CameraTarget[2206].indexOnlyShowOnce = -1
CameraTarget[2206].showOnceInCurWorld = false


----授谱终结剧情莫大03
CameraTarget[2207] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2207].targetCamera_ids = "5450, 5448"
CameraTarget[2207].duration = "2"
CameraTarget[2207].indexOnlyShowOnce = -1
CameraTarget[2207].showOnceInCurWorld = false


----华山派探索03
CameraTarget[2208] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2208].targetCamera_ids = "5453, 5454, 5455, 5456"
CameraTarget[2208].duration = "5, 3, 4"
CameraTarget[2208].indexOnlyShowOnce = -1
CameraTarget[2208].showOnceInCurWorld = false


----授谱终结剧情费彬03
CameraTarget[2209] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2209].targetCamera_ids = "5435, 5492"
CameraTarget[2209].duration = "5"
CameraTarget[2209].indexOnlyShowOnce = -1
CameraTarget[2209].showOnceInCurWorld = false


----授谱终结剧情费彬04
CameraTarget[2210] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2210].targetCamera_ids = "5506, 5507"
CameraTarget[2210].duration = "7"
CameraTarget[2210].indexOnlyShowOnce = -1
CameraTarget[2210].showOnceInCurWorld = false


----授谱终结剧情曲非烟死亡
CameraTarget[2211] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2211].targetCamera_ids = "5544, 5545, 5546"
CameraTarget[2211].duration = "2, 1"
CameraTarget[2211].indexOnlyShowOnce = -1
CameraTarget[2211].showOnceInCurWorld = false


----莫大出场特写
CameraTarget[2212] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2212].targetCamera_ids = "5573, 5574"
CameraTarget[2212].duration = "4"
CameraTarget[2212].indexOnlyShowOnce = -1
CameraTarget[2212].showOnceInCurWorld = false


----莫大出场移动
CameraTarget[2213] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2213].targetCamera_ids = "5440, 5443, 5444"
CameraTarget[2213].duration = "1, 2"
CameraTarget[2213].indexOnlyShowOnce = -1
CameraTarget[2213].showOnceInCurWorld = false


----莫大新出场镜头
CameraTarget[2214] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2214].targetCamera_ids = "5585, 5586, 5587"
CameraTarget[2214].duration = "3, 1"
CameraTarget[2214].indexOnlyShowOnce = -1
CameraTarget[2214].showOnceInCurWorld = false


----费彬死亡镜头01
CameraTarget[2215] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2215].targetCamera_ids = "5449, 5602"
CameraTarget[2215].duration = "4"
CameraTarget[2215].indexOnlyShowOnce = -1
CameraTarget[2215].showOnceInCurWorld = false


----费彬死亡镜头02
CameraTarget[2216] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2216].targetCamera_ids = "5655, 5657"
CameraTarget[2216].duration = "4"
CameraTarget[2216].indexOnlyShowOnce = -1
CameraTarget[2216].showOnceInCurWorld = false


----费彬死亡特写
CameraTarget[2217] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2217].targetCamera_ids = "5658, 5659"
CameraTarget[2217].duration = "5"
CameraTarget[2217].indexOnlyShowOnce = -1
CameraTarget[2217].showOnceInCurWorld = false


----灭门余沧海出场01
CameraTarget[2218] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2218].targetCamera_ids = "5676, 5677, 5678"
CameraTarget[2218].duration = "2, 4"
CameraTarget[2218].indexOnlyShowOnce = -1
CameraTarget[2218].showOnceInCurWorld = false


----灭门余沧海出场02
CameraTarget[2219] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2219].targetCamera_ids = "5679, 5680"
CameraTarget[2219].duration = "4"
CameraTarget[2219].indexOnlyShowOnce = -1
CameraTarget[2219].showOnceInCurWorld = false


----雨夜黑衣人出场01
CameraTarget[2220] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2220].targetCamera_ids = "5704, 5705, 5706, 5707"
CameraTarget[2220].duration = "3, 4, 1"
CameraTarget[2220].indexOnlyShowOnce = -1
CameraTarget[2220].showOnceInCurWorld = false


----雨夜黑衣人出场02
CameraTarget[2221] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2221].targetCamera_ids = "5708, 5709"
CameraTarget[2221].duration = "3"
CameraTarget[2221].indexOnlyShowOnce = -1
CameraTarget[2221].showOnceInCurWorld = false


----雨夜黑衣人出场03
CameraTarget[2222] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2222].targetCamera_ids = "5710, 5711"
CameraTarget[2222].duration = "6"
CameraTarget[2222].indexOnlyShowOnce = -1
CameraTarget[2222].showOnceInCurWorld = false


----雨夜黑衣人出场04
CameraTarget[2223] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2223].targetCamera_ids = "5714, 5715"
CameraTarget[2223].duration = "2"
CameraTarget[2223].indexOnlyShowOnce = -1
CameraTarget[2223].showOnceInCurWorld = false


----雨夜黑衣人出场05
CameraTarget[2224] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2224].targetCamera_ids = "5716, 5717"
CameraTarget[2224].duration = "5"
CameraTarget[2224].indexOnlyShowOnce = -1
CameraTarget[2224].showOnceInCurWorld = false


----雨夜黑衣人出场06
CameraTarget[2225] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2225].targetCamera_ids = "5718, 5719, 5720"
CameraTarget[2225].duration = "5, 2"
CameraTarget[2225].indexOnlyShowOnce = -1
CameraTarget[2225].showOnceInCurWorld = false


----雨夜黑衣人出场07
CameraTarget[2226] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2226].targetCamera_ids = "5721, 5722"
CameraTarget[2226].duration = "7"
CameraTarget[2226].indexOnlyShowOnce = -1
CameraTarget[2226].showOnceInCurWorld = false


----雨夜黑衣人出场08
CameraTarget[2227] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2227].targetCamera_ids = "5815, 5817"
CameraTarget[2227].duration = "6"
CameraTarget[2227].indexOnlyShowOnce = -1
CameraTarget[2227].showOnceInCurWorld = false


----雨夜黑衣人出场09
CameraTarget[2228] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2228].targetCamera_ids = "5824, 5825"
CameraTarget[2228].duration = "5"
CameraTarget[2228].indexOnlyShowOnce = -1
CameraTarget[2228].showOnceInCurWorld = false


----test01
CameraTarget[2229] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2229].targetCamera_ids = "5826, 5827"
CameraTarget[2229].duration = "5"
CameraTarget[2229].indexOnlyShowOnce = -1
CameraTarget[2229].showOnceInCurWorld = false


----test02
CameraTarget[2230] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2230].targetCamera_ids = "5828, 5829"
CameraTarget[2230].duration = "3"
CameraTarget[2230].indexOnlyShowOnce = -1
CameraTarget[2230].showOnceInCurWorld = false


----梅庄简单刷怪01
CameraTarget[2231] = CopyTable(CameraTarget["OverlookBattlefield"])
CameraTarget[2231].targetCamera_ids = "5876, 5877, 5878"
CameraTarget[2231].duration = "3, 3"
CameraTarget[2231].indexOnlyShowOnce = -1
CameraTarget[2231].showOnceInCurWorld = false


----宠物指引
CameraTarget[2232] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2232].targetCamera_ids = "5838, 5839, 5840, 5841"
CameraTarget[2232].duration = "3, 2, 40"
CameraTarget[2232].indexOnlyShowOnce = -1
CameraTarget[2232].showOnceInCurWorld = false


----梅庄简单刷怪02
CameraTarget[2233] = CopyTable(CameraTarget["OverlookBattlefield"])
CameraTarget[2233].targetCamera_ids = "5842, 5830, 5831, 5842, 5855, 5856, 5857, 5858"
CameraTarget[2233].duration = "2, 2, 1, 2, 2, 2, 2"
CameraTarget[2233].indexOnlyShowOnce = -1
CameraTarget[2233].showOnceInCurWorld = false


----梅庄简单刷怪03
CameraTarget[2234] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2234].targetCamera_ids = "5842, 5830, 5831, 5857, 5858, 5855"
CameraTarget[2234].duration = "2, 2, 1, 2, 2"
CameraTarget[2234].indexOnlyShowOnce = -1
CameraTarget[2234].showOnceInCurWorld = false


----华山技能指引
CameraTarget[2235] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2235].targetCamera_ids = "5893, 5895, 5896, 5897, 5898"
CameraTarget[2235].duration = "10, 2, 10, 60"
CameraTarget[2235].indexOnlyShowOnce = -1
CameraTarget[2235].showOnceInCurWorld = false


----梅庄简单刷怪BOSS1
CameraTarget[2236] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2236].targetCamera_ids = "5914, 5916, 5913"
CameraTarget[2236].duration = "4, 4"
CameraTarget[2236].indexOnlyShowOnce = -1
CameraTarget[2236].showOnceInCurWorld = false


----衡山派新探索CG01
CameraTarget[2237] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2237].targetCamera_ids = "5882, 5887, 5883, 5885, 5886"
CameraTarget[2237].duration = "1.5, 1.5, 2, 3"
CameraTarget[2237].indexOnlyShowOnce = -1
CameraTarget[2237].showOnceInCurWorld = false


----衡山派新探索CG02
CameraTarget[2238] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2238].targetCamera_ids = "5888, 5889, 5891, 5890"
CameraTarget[2238].duration = "2, 2.5, 2.5"
CameraTarget[2238].indexOnlyShowOnce = -1
CameraTarget[2238].showOnceInCurWorld = false


----新手剧情下毒01
CameraTarget[2239] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2239].targetCamera_ids = "5962, 5963"
CameraTarget[2239].duration = "4"
CameraTarget[2239].indexOnlyShowOnce = -1
CameraTarget[2239].showOnceInCurWorld = false


----新手剧情下毒02
CameraTarget[2240] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2240].targetCamera_ids = "5964, 5965"
CameraTarget[2240].duration = "5"
CameraTarget[2240].indexOnlyShowOnce = -1
CameraTarget[2240].showOnceInCurWorld = false


----新手剧情下毒03
CameraTarget[2241] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2241].targetCamera_ids = "5966, 5967"
CameraTarget[2241].duration = "6"
CameraTarget[2241].indexOnlyShowOnce = -1
CameraTarget[2241].showOnceInCurWorld = false


----新手剧情集结01
CameraTarget[2242] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2242].targetCamera_ids = "5975, 5976"
CameraTarget[2242].duration = "5"
CameraTarget[2242].indexOnlyShowOnce = -1
CameraTarget[2242].showOnceInCurWorld = false


----新手剧情集结02
CameraTarget[2243] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2243].targetCamera_ids = "5971, 5972, 5973, 5974"
CameraTarget[2243].duration = "2, 2, 3"
CameraTarget[2243].indexOnlyShowOnce = -1
CameraTarget[2243].showOnceInCurWorld = false


----新手剧情集结03
CameraTarget[2244] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2244].targetCamera_ids = "5981, 5983"
CameraTarget[2244].duration = "5"
CameraTarget[2244].indexOnlyShowOnce = -1
CameraTarget[2244].showOnceInCurWorld = false


----新手剧情集结04
CameraTarget[2245] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2245].targetCamera_ids = "5994, 5995"
CameraTarget[2245].duration = "4"
CameraTarget[2245].indexOnlyShowOnce = -1
CameraTarget[2245].showOnceInCurWorld = false


----新手剧情爆炸01
CameraTarget[2246] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2246].targetCamera_ids = "6027, 6023, 6024, 6031, 6032, 6099"
CameraTarget[2246].duration = "3, 2, 2, 1, 3"
CameraTarget[2246].indexOnlyShowOnce = -1
CameraTarget[2246].showOnceInCurWorld = false


----新手剧情下雨01
CameraTarget[2247] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2247].targetCamera_ids = "6034, 6035"
CameraTarget[2247].duration = "5"
CameraTarget[2247].indexOnlyShowOnce = -1
CameraTarget[2247].showOnceInCurWorld = false


----新手剧情离别
CameraTarget[2248] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2248].targetCamera_ids = "6049, 6060"
CameraTarget[2248].duration = "4"
CameraTarget[2248].indexOnlyShowOnce = -1
CameraTarget[2248].showOnceInCurWorld = false


----新手剧情茶棚01
CameraTarget[2249] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2249].targetCamera_ids = "6071, 6072"
CameraTarget[2249].duration = "5"
CameraTarget[2249].indexOnlyShowOnce = -1
CameraTarget[2249].showOnceInCurWorld = false


----新手剧情茶棚02
CameraTarget[2250] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2250].targetCamera_ids = "6073, 6078"
CameraTarget[2250].duration = "6"
CameraTarget[2250].indexOnlyShowOnce = -1
CameraTarget[2250].showOnceInCurWorld = false


----日月教探索CG01
CameraTarget[2251] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2251].targetCamera_ids = "6105, 6106, 6107"
CameraTarget[2251].duration = "3, 3"
CameraTarget[2251].indexOnlyShowOnce = -1
CameraTarget[2251].showOnceInCurWorld = false


----日月教探索CG02
CameraTarget[2252] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2252].targetCamera_ids = "6108, 6109, 6110, 6111"
CameraTarget[2252].duration = "3, 3, 3"
CameraTarget[2252].indexOnlyShowOnce = -1
CameraTarget[2252].showOnceInCurWorld = false


----日月教探索CG03
CameraTarget[2253] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2253].targetCamera_ids = "6112, 6113, 6114, 6115, 6118"
CameraTarget[2253].duration = "3, 3, 3, 2"
CameraTarget[2253].indexOnlyShowOnce = -1
CameraTarget[2253].showOnceInCurWorld = false


----梅庄简单前走廊
CameraTarget[2254] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2254].targetCamera_ids = "6120, 6121, 6122, 6123, 6124"
CameraTarget[2254].duration = "1, 2, 2, 2"
CameraTarget[2254].indexOnlyShowOnce = -1
CameraTarget[2254].showOnceInCurWorld = false


----梅庄简单前地牢
CameraTarget[2255] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2255].targetCamera_ids = "5999, 6000, 6001, 6002"
CameraTarget[2255].duration = "1, 1, 1"
CameraTarget[2255].indexOnlyShowOnce = -1
CameraTarget[2255].showOnceInCurWorld = false


----梅庄简单后地牢
CameraTarget[2256] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2256].targetCamera_ids = "6074, 6075, 6081, 6082, 6083, 6080, 6083, 6082"
CameraTarget[2256].duration = "1, 1, 1, 1, 1, 1, 1"
CameraTarget[2256].indexOnlyShowOnce = -1
CameraTarget[2256].showOnceInCurWorld = false


----梅庄简单最终走廊
CameraTarget[2257] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2257].targetCamera_ids = "6088, 6089, 6092, 6093, 6133"
CameraTarget[2257].duration = "1, 1, 1, 3"
CameraTarget[2257].indexOnlyShowOnce = -1
CameraTarget[2257].showOnceInCurWorld = false


----新手剧情茶棚03
CameraTarget[2258] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2258].targetCamera_ids = "6138, 6139"
CameraTarget[2258].duration = "5"
CameraTarget[2258].indexOnlyShowOnce = -1
CameraTarget[2258].showOnceInCurWorld = false


----嵩山脚下新探索CG01
CameraTarget[2259] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2259].targetCamera_ids = "6167, 6168, 2575"
CameraTarget[2259].duration = "3, 4"
CameraTarget[2259].indexOnlyShowOnce = -1
CameraTarget[2259].showOnceInCurWorld = false


----嵩山脚下新探索CG02
CameraTarget[2260] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2260].targetCamera_ids = "6177, 6178, 6179, 6180, 6181, 6182"
CameraTarget[2260].duration = "3, 1.5, 1.5, 1.5, 2"
CameraTarget[2260].indexOnlyShowOnce = -1
CameraTarget[2260].showOnceInCurWorld = false


----铸剑谷新CG
CameraTarget[2261] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2261].targetCamera_ids = "6256, 6257, 6258, 6259, 6260, 6261, 6262"
CameraTarget[2261].duration = "3, 4, 2, 1, 3, 4"
CameraTarget[2261].indexOnlyShowOnce = -1
CameraTarget[2261].showOnceInCurWorld = false


----梅关探索镜头02
CameraTarget[2262] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2262].targetCamera_ids = "6283, 6284"
CameraTarget[2262].duration = "6"
CameraTarget[2262].indexOnlyShowOnce = -1
CameraTarget[2262].showOnceInCurWorld = false


----梅关探索镜头03
CameraTarget[2263] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2263].targetCamera_ids = "6290, 6288"
CameraTarget[2263].duration = "4"
CameraTarget[2263].indexOnlyShowOnce = -1
CameraTarget[2263].showOnceInCurWorld = false


----梅关探索镜头04
CameraTarget[2264] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2264].targetCamera_ids = "6286, 6292, 6295, 6297, 6302"
CameraTarget[2264].duration = "2, 2, 2, 2"
CameraTarget[2264].indexOnlyShowOnce = -1
CameraTarget[2264].showOnceInCurWorld = false


----梅关探索镜头05
CameraTarget[2265] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2265].targetCamera_ids = "6299, 6300"
CameraTarget[2265].duration = "5"
CameraTarget[2265].indexOnlyShowOnce = -1
CameraTarget[2265].showOnceInCurWorld = false


----梅关探索镜头06
CameraTarget[2266] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2266].targetCamera_ids = "6303, 6304"
CameraTarget[2266].duration = "4"
CameraTarget[2266].indexOnlyShowOnce = -1
CameraTarget[2266].showOnceInCurWorld = false


----梅关探索镜头07
CameraTarget[2267] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2267].targetCamera_ids = "6305, 6306"
CameraTarget[2267].duration = "4.5"
CameraTarget[2267].indexOnlyShowOnce = -1
CameraTarget[2267].showOnceInCurWorld = false


----门徒捕捉指引
CameraTarget[2268] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2268].targetCamera_ids = "6469, 6470, 6471, 6472, 6504, 6505, 6506"
CameraTarget[2268].duration = "5, 5, 5, 2, 40, 3"
CameraTarget[2268].indexOnlyShowOnce = -1
CameraTarget[2268].showOnceInCurWorld = false


----与红叶禅师同行01
CameraTarget[2269] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2269].targetCamera_ids = "6528, 6531, 6532"
CameraTarget[2269].duration = "3, 6"
CameraTarget[2269].indexOnlyShowOnce = -1
CameraTarget[2269].showOnceInCurWorld = false


----与红叶禅师同行02
CameraTarget[2270] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2270].targetCamera_ids = "6533, 6536, 6534, 6535, 6537"
CameraTarget[2270].duration = "4, 2, 3, 2"
CameraTarget[2270].indexOnlyShowOnce = -1
CameraTarget[2270].showOnceInCurWorld = false


----与红叶禅师同行03
CameraTarget[2271] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2271].targetCamera_ids = "6538, 6539"
CameraTarget[2271].duration = "3"
CameraTarget[2271].indexOnlyShowOnce = -1
CameraTarget[2271].showOnceInCurWorld = false


----与红叶禅师同行04
CameraTarget[2272] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2272].targetCamera_ids = "6540, 6541"
CameraTarget[2272].duration = "3"
CameraTarget[2272].indexOnlyShowOnce = -1
CameraTarget[2272].showOnceInCurWorld = false


----与红叶禅师同行05
CameraTarget[2273] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2273].targetCamera_ids = "6542, 6543, 6544"
CameraTarget[2273].duration = "4, 3"
CameraTarget[2273].indexOnlyShowOnce = -1
CameraTarget[2273].showOnceInCurWorld = false


----与红叶禅师同行06
CameraTarget[2274] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2274].targetCamera_ids = "6545, 6546"
CameraTarget[2274].duration = "5"
CameraTarget[2274].indexOnlyShowOnce = -1
CameraTarget[2274].showOnceInCurWorld = false


----黎明之光01
CameraTarget[2275] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2275].targetCamera_ids = "6561, 6562, 6563, 6564, 6565, 6566, 6572"
CameraTarget[2275].duration = "1, 2, 3, 1, 3, 4"
CameraTarget[2275].indexOnlyShowOnce = -1
CameraTarget[2275].showOnceInCurWorld = false


----杨公子的计谋01
CameraTarget[2276] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2276].targetCamera_ids = "6589, 6590, 6591, 6592, 6593"
CameraTarget[2276].duration = "4, 3, 2, 4"
CameraTarget[2276].indexOnlyShowOnce = -1
CameraTarget[2276].showOnceInCurWorld = false


----杨公子的计谋02
CameraTarget[2277] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2277].targetCamera_ids = "6594, 6595"
CameraTarget[2277].duration = "6"
CameraTarget[2277].indexOnlyShowOnce = -1
CameraTarget[2277].showOnceInCurWorld = false


----杨公子的计谋03
CameraTarget[2278] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2278].targetCamera_ids = "6596, 6597, 6598"
CameraTarget[2278].duration = "3, 6"
CameraTarget[2278].indexOnlyShowOnce = -1
CameraTarget[2278].showOnceInCurWorld = false


----开场大船上
CameraTarget[2279] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2279].targetCamera_ids = "6600, 6601, 7110, 7117"
CameraTarget[2279].duration = "4, 3, 5"
CameraTarget[2279].indexOnlyShowOnce = -1
CameraTarget[2279].showOnceInCurWorld = false


----命运的相会01
CameraTarget[2280] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2280].targetCamera_ids = "6607, 6608"
CameraTarget[2280].duration = "6"
CameraTarget[2280].indexOnlyShowOnce = -1
CameraTarget[2280].showOnceInCurWorld = false


----命运的相会02
CameraTarget[2281] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2281].targetCamera_ids = "6623, 6625, 6610, 6616, 6617, 6619, 6628"
CameraTarget[2281].duration = "3, 3, 1, 3, 3, 5"
CameraTarget[2281].indexOnlyShowOnce = -1
CameraTarget[2281].showOnceInCurWorld = false


----命运的相会03
CameraTarget[2282] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2282].targetCamera_ids = "6647, 6649"
CameraTarget[2282].duration = "3"
CameraTarget[2282].indexOnlyShowOnce = -1
CameraTarget[2282].showOnceInCurWorld = false


----命运的相会04
CameraTarget[2283] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2283].targetCamera_ids = "6651, 6652"
CameraTarget[2283].duration = "5"
CameraTarget[2283].indexOnlyShowOnce = -1
CameraTarget[2283].showOnceInCurWorld = false


----命运的相会05
CameraTarget[2284] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2284].targetCamera_ids = "6653, 6654, 6655"
CameraTarget[2284].duration = "1, 2"
CameraTarget[2284].indexOnlyShowOnce = -1
CameraTarget[2284].showOnceInCurWorld = false


----命运的相会06
CameraTarget[2285] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2285].targetCamera_ids = "6651, 6652"
CameraTarget[2285].duration = "3"
CameraTarget[2285].indexOnlyShowOnce = -1
CameraTarget[2285].showOnceInCurWorld = false


----命运的相会07
CameraTarget[2286] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2286].targetCamera_ids = "6655, 6656"
CameraTarget[2286].duration = "3"
CameraTarget[2286].indexOnlyShowOnce = -1
CameraTarget[2286].showOnceInCurWorld = false


----命运的相会08
CameraTarget[2287] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2287].targetCamera_ids = "6657, 6658"
CameraTarget[2287].duration = "1"
CameraTarget[2287].indexOnlyShowOnce = -1
CameraTarget[2287].showOnceInCurWorld = false


----命运的相会09
CameraTarget[2288] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2288].targetCamera_ids = "6659, 6660"
CameraTarget[2288].duration = "3"
CameraTarget[2288].indexOnlyShowOnce = -1
CameraTarget[2288].showOnceInCurWorld = false


----命运的相会10
CameraTarget[2289] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2289].targetCamera_ids = "7776, 6661"
CameraTarget[2289].duration = "1"
CameraTarget[2289].indexOnlyShowOnce = -1
CameraTarget[2289].showOnceInCurWorld = false


----命运的相会11
CameraTarget[2290] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2290].targetCamera_ids = "6662, 6663, 6664"
CameraTarget[2290].duration = "3, 1"
CameraTarget[2290].indexOnlyShowOnce = -1
CameraTarget[2290].showOnceInCurWorld = false


----命运的相会12
CameraTarget[2291] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2291].targetCamera_ids = "6665, 6666"
CameraTarget[2291].duration = "3"
CameraTarget[2291].indexOnlyShowOnce = -1
CameraTarget[2291].showOnceInCurWorld = false


----命运的相会13
CameraTarget[2292] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2292].targetCamera_ids = "6667, 6668"
CameraTarget[2292].duration = "3"
CameraTarget[2292].indexOnlyShowOnce = -1
CameraTarget[2292].showOnceInCurWorld = false


----命运的相会14
CameraTarget[2293] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2293].targetCamera_ids = "6667, 6669"
CameraTarget[2293].duration = "4"
CameraTarget[2293].indexOnlyShowOnce = -1
CameraTarget[2293].showOnceInCurWorld = false


----命运的相会15
CameraTarget[2294] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2294].targetCamera_ids = "6670, 6671"
CameraTarget[2294].duration = "5"
CameraTarget[2294].indexOnlyShowOnce = -1
CameraTarget[2294].showOnceInCurWorld = false


----命运的相会16
CameraTarget[2295] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2295].targetCamera_ids = "6672, 6673"
CameraTarget[2295].duration = "5"
CameraTarget[2295].indexOnlyShowOnce = -1
CameraTarget[2295].showOnceInCurWorld = false


----重要的包袱01
CameraTarget[2296] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2296].targetCamera_ids = "6674, 6675"
CameraTarget[2296].duration = "4"
CameraTarget[2296].indexOnlyShowOnce = -1
CameraTarget[2296].showOnceInCurWorld = false


----重要的包袱02
CameraTarget[2297] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2297].targetCamera_ids = "6677, 6678"
CameraTarget[2297].duration = "3"
CameraTarget[2297].indexOnlyShowOnce = -1
CameraTarget[2297].showOnceInCurWorld = false


----重要的包袱03
CameraTarget[2298] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2298].targetCamera_ids = "6680, 6681"
CameraTarget[2298].duration = "3"
CameraTarget[2298].indexOnlyShowOnce = -1
CameraTarget[2298].showOnceInCurWorld = false


----重要的包袱04
CameraTarget[2299] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2299].targetCamera_ids = "6682, 6683"
CameraTarget[2299].duration = "3"
CameraTarget[2299].indexOnlyShowOnce = -1
CameraTarget[2299].showOnceInCurWorld = false


----重要的包袱05
CameraTarget[2300] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2300].targetCamera_ids = "6685, 6686"
CameraTarget[2300].duration = "2"
CameraTarget[2300].indexOnlyShowOnce = -1
CameraTarget[2300].showOnceInCurWorld = false


----重要的包袱06
CameraTarget[2301] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2301].targetCamera_ids = "6687, 6688"
CameraTarget[2301].duration = "4"
CameraTarget[2301].indexOnlyShowOnce = -1
CameraTarget[2301].showOnceInCurWorld = false


----重要的包袱07
CameraTarget[2302] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2302].targetCamera_ids = "6689, 6690"
CameraTarget[2302].duration = "3"
CameraTarget[2302].indexOnlyShowOnce = -1
CameraTarget[2302].showOnceInCurWorld = false


----尖峰时刻01
CameraTarget[2303] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2303].targetCamera_ids = "6691, 6692"
CameraTarget[2303].duration = "3"
CameraTarget[2303].indexOnlyShowOnce = -1
CameraTarget[2303].showOnceInCurWorld = false


----尖峰时刻02
CameraTarget[2304] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2304].targetCamera_ids = "6693, 6694"
CameraTarget[2304].duration = "4"
CameraTarget[2304].indexOnlyShowOnce = -1
CameraTarget[2304].showOnceInCurWorld = false


----尖峰时刻03
CameraTarget[2305] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2305].targetCamera_ids = "6695, 6696, 6697"
CameraTarget[2305].duration = "1, 2"
CameraTarget[2305].indexOnlyShowOnce = -1
CameraTarget[2305].showOnceInCurWorld = false


----尖峰时刻04
CameraTarget[2306] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2306].targetCamera_ids = "6698, 6699"
CameraTarget[2306].duration = "4"
CameraTarget[2306].indexOnlyShowOnce = -1
CameraTarget[2306].showOnceInCurWorld = false


----尖峰时刻05
CameraTarget[2307] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2307].targetCamera_ids = "6700, 6701"
CameraTarget[2307].duration = "3"
CameraTarget[2307].indexOnlyShowOnce = -1
CameraTarget[2307].showOnceInCurWorld = false


----尖峰时刻06
CameraTarget[2308] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2308].targetCamera_ids = "6702, 6703"
CameraTarget[2308].duration = "3"
CameraTarget[2308].indexOnlyShowOnce = -1
CameraTarget[2308].showOnceInCurWorld = false


----尖峰时刻07
CameraTarget[2309] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2309].targetCamera_ids = "6704, 6705"
CameraTarget[2309].duration = "5"
CameraTarget[2309].indexOnlyShowOnce = -1
CameraTarget[2309].showOnceInCurWorld = false


----远行雪家堡01
CameraTarget[2310] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2310].targetCamera_ids = "6725, 6726, 6726"
CameraTarget[2310].duration = "3, 4"
CameraTarget[2310].indexOnlyShowOnce = -1
CameraTarget[2310].showOnceInCurWorld = false


----远行雪家堡02
CameraTarget[2311] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2311].targetCamera_ids = "6727, 6728"
CameraTarget[2311].duration = "5"
CameraTarget[2311].indexOnlyShowOnce = -1
CameraTarget[2311].showOnceInCurWorld = false


----黑暗之爪01
CameraTarget[2312] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2312].targetCamera_ids = "6731, 6730, 6732"
CameraTarget[2312].duration = "3, 4"
CameraTarget[2312].indexOnlyShowOnce = -1
CameraTarget[2312].showOnceInCurWorld = false


----黑暗之爪02
CameraTarget[2313] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2313].targetCamera_ids = "6733, 6734"
CameraTarget[2313].duration = "7"
CameraTarget[2313].indexOnlyShowOnce = -1
CameraTarget[2313].showOnceInCurWorld = false


----黑暗之爪03
CameraTarget[2314] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2314].targetCamera_ids = "6735, 6736"
CameraTarget[2314].duration = "2"
CameraTarget[2314].indexOnlyShowOnce = -1
CameraTarget[2314].showOnceInCurWorld = false


----黑暗之爪04
CameraTarget[2315] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2315].targetCamera_ids = "7815, 7816"
CameraTarget[2315].duration = "3"
CameraTarget[2315].indexOnlyShowOnce = -1
CameraTarget[2315].showOnceInCurWorld = false


----黑暗之爪05
CameraTarget[2316] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2316].targetCamera_ids = "6744, 6745"
CameraTarget[2316].duration = "3"
CameraTarget[2316].indexOnlyShowOnce = -1
CameraTarget[2316].showOnceInCurWorld = false


----兵临城下01
CameraTarget[2317] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2317].targetCamera_ids = "6746, 6747, 6748, 6749"
CameraTarget[2317].duration = "1, 2, 4"
CameraTarget[2317].indexOnlyShowOnce = -1
CameraTarget[2317].showOnceInCurWorld = false


----兵临城下02
CameraTarget[2318] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2318].targetCamera_ids = "6750, 6751"
CameraTarget[2318].duration = "6"
CameraTarget[2318].indexOnlyShowOnce = -1
CameraTarget[2318].showOnceInCurWorld = false


----明教军团的围攻01
CameraTarget[2319] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2319].targetCamera_ids = "6752, 6753, 6754"
CameraTarget[2319].duration = "1, 3"
CameraTarget[2319].indexOnlyShowOnce = -1
CameraTarget[2319].showOnceInCurWorld = false


----明教军团的围攻02
CameraTarget[2320] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2320].targetCamera_ids = "6755, 7817"
CameraTarget[2320].duration = "2"
CameraTarget[2320].indexOnlyShowOnce = -1
CameraTarget[2320].showOnceInCurWorld = false


----明教军团的围攻03
CameraTarget[2321] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2321].targetCamera_ids = "6757, 6758, 6759, 6760"
CameraTarget[2321].duration = "1, 3, 2"
CameraTarget[2321].indexOnlyShowOnce = -1
CameraTarget[2321].showOnceInCurWorld = false


----明教军团的围攻04
CameraTarget[2322] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2322].targetCamera_ids = "6761, 6762"
CameraTarget[2322].duration = "2"
CameraTarget[2322].indexOnlyShowOnce = -1
CameraTarget[2322].showOnceInCurWorld = false


----明教军团的围攻05
CameraTarget[2323] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2323].targetCamera_ids = "6763, 6764"
CameraTarget[2323].duration = "2"
CameraTarget[2323].indexOnlyShowOnce = -1
CameraTarget[2323].showOnceInCurWorld = false


----明教军团的围攻06
CameraTarget[2324] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2324].targetCamera_ids = "6765, 6766"
CameraTarget[2324].duration = "3"
CameraTarget[2324].indexOnlyShowOnce = -1
CameraTarget[2324].showOnceInCurWorld = false


----明教军团的围攻07
CameraTarget[2325] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2325].targetCamera_ids = "6767, 6768"
CameraTarget[2325].duration = "5"
CameraTarget[2325].indexOnlyShowOnce = -1
CameraTarget[2325].showOnceInCurWorld = false


----破釜沉舟01
CameraTarget[2326] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2326].targetCamera_ids = "6769, 6770"
CameraTarget[2326].duration = "6"
CameraTarget[2326].indexOnlyShowOnce = -1
CameraTarget[2326].showOnceInCurWorld = false


----破釜沉舟02
CameraTarget[2327] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2327].targetCamera_ids = "6771, 6772"
CameraTarget[2327].duration = "8"
CameraTarget[2327].indexOnlyShowOnce = -1
CameraTarget[2327].showOnceInCurWorld = false


----出手烧桥01
CameraTarget[2328] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2328].targetCamera_ids = "6773, 6774"
CameraTarget[2328].duration = "3"
CameraTarget[2328].indexOnlyShowOnce = -1
CameraTarget[2328].showOnceInCurWorld = false


----出手烧桥02
CameraTarget[2329] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2329].targetCamera_ids = "6775, 6776"
CameraTarget[2329].duration = "2"
CameraTarget[2329].indexOnlyShowOnce = -1
CameraTarget[2329].showOnceInCurWorld = false


----出手烧桥03
CameraTarget[2330] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2330].targetCamera_ids = "6777, 6778"
CameraTarget[2330].duration = "3"
CameraTarget[2330].indexOnlyShowOnce = -1
CameraTarget[2330].showOnceInCurWorld = false


----滴血啬薇01
CameraTarget[2331] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2331].targetCamera_ids = "6779, 6780"
CameraTarget[2331].duration = "3"
CameraTarget[2331].indexOnlyShowOnce = -1
CameraTarget[2331].showOnceInCurWorld = false


----滴血啬薇02
CameraTarget[2332] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2332].targetCamera_ids = "6781, 6782, 6787"
CameraTarget[2332].duration = "2, 3"
CameraTarget[2332].indexOnlyShowOnce = -1
CameraTarget[2332].showOnceInCurWorld = false


----滴血蔷薇03
CameraTarget[2333] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2333].targetCamera_ids = "6783, 6784"
CameraTarget[2333].duration = "5"
CameraTarget[2333].indexOnlyShowOnce = -1
CameraTarget[2333].showOnceInCurWorld = false


----滴血蔷薇04
CameraTarget[2334] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2334].targetCamera_ids = "6785, 6786"
CameraTarget[2334].duration = "4"
CameraTarget[2334].indexOnlyShowOnce = -1
CameraTarget[2334].showOnceInCurWorld = false


----真假敌友01
CameraTarget[2335] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2335].targetCamera_ids = "6788, 6791, 6789, 6790"
CameraTarget[2335].duration = "1, 2, 2"
CameraTarget[2335].indexOnlyShowOnce = -1
CameraTarget[2335].showOnceInCurWorld = false


----真假敌友02
CameraTarget[2336] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2336].targetCamera_ids = "6792, 6793"
CameraTarget[2336].duration = "5"
CameraTarget[2336].indexOnlyShowOnce = -1
CameraTarget[2336].showOnceInCurWorld = false


----真假敌友03
CameraTarget[2337] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2337].targetCamera_ids = "6795, 6796, 6797"
CameraTarget[2337].duration = "3, 5"
CameraTarget[2337].indexOnlyShowOnce = -1
CameraTarget[2337].showOnceInCurWorld = false


----穷途末路01
CameraTarget[2338] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2338].targetCamera_ids = "6798, 6799"
CameraTarget[2338].duration = "3"
CameraTarget[2338].indexOnlyShowOnce = -1
CameraTarget[2338].showOnceInCurWorld = false


----穷途末路02
CameraTarget[2339] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2339].targetCamera_ids = "6800, 6801"
CameraTarget[2339].duration = "9"
CameraTarget[2339].indexOnlyShowOnce = -1
CameraTarget[2339].showOnceInCurWorld = false


----穷途末路03
CameraTarget[2340] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2340].targetCamera_ids = "6802, 6803"
CameraTarget[2340].duration = "2"
CameraTarget[2340].indexOnlyShowOnce = -1
CameraTarget[2340].showOnceInCurWorld = false


----穷途末路04
CameraTarget[2341] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2341].targetCamera_ids = "6804, 6805"
CameraTarget[2341].duration = "2"
CameraTarget[2341].indexOnlyShowOnce = -1
CameraTarget[2341].showOnceInCurWorld = false


----穷途末路05
CameraTarget[2342] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2342].targetCamera_ids = "6806, 6807"
CameraTarget[2342].duration = "3"
CameraTarget[2342].indexOnlyShowOnce = -1
CameraTarget[2342].showOnceInCurWorld = false


----穷途末路06
CameraTarget[2343] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2343].targetCamera_ids = "6808, 6809"
CameraTarget[2343].duration = "4"
CameraTarget[2343].indexOnlyShowOnce = -1
CameraTarget[2343].showOnceInCurWorld = false


----穷途末路07
CameraTarget[2344] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2344].targetCamera_ids = "6816, 6817"
CameraTarget[2344].duration = "3"
CameraTarget[2344].indexOnlyShowOnce = -1
CameraTarget[2344].showOnceInCurWorld = false


----穷途末路08
CameraTarget[2345] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2345].targetCamera_ids = "6812, 6813, 6814, 6815"
CameraTarget[2345].duration = "2, 1, 3"
CameraTarget[2345].indexOnlyShowOnce = -1
CameraTarget[2345].showOnceInCurWorld = false


----蔷薇之殇01
CameraTarget[2346] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2346].targetCamera_ids = "6878, 6879"
CameraTarget[2346].duration = "9"
CameraTarget[2346].indexOnlyShowOnce = -1
CameraTarget[2346].showOnceInCurWorld = false


----蔷薇之殇02
CameraTarget[2347] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2347].targetCamera_ids = "6880, 6881, 6882"
CameraTarget[2347].duration = "5, 8"
CameraTarget[2347].indexOnlyShowOnce = -1
CameraTarget[2347].showOnceInCurWorld = false


----蔷薇之殇03
CameraTarget[2348] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2348].targetCamera_ids = "6883, 6884"
CameraTarget[2348].duration = "5"
CameraTarget[2348].indexOnlyShowOnce = -1
CameraTarget[2348].showOnceInCurWorld = false


----蔷薇之殇04
CameraTarget[2349] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2349].targetCamera_ids = "6885, 6886"
CameraTarget[2349].duration = "6"
CameraTarget[2349].indexOnlyShowOnce = -1
CameraTarget[2349].showOnceInCurWorld = false


----雄霸天下01
CameraTarget[2350] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2350].targetCamera_ids = "6887, 6888, 6889, 6890, 6891"
CameraTarget[2350].duration = "3, 4, 4, 4"
CameraTarget[2350].indexOnlyShowOnce = -1
CameraTarget[2350].showOnceInCurWorld = false


----雄霸天下02
CameraTarget[2351] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2351].targetCamera_ids = "6892, 6893"
CameraTarget[2351].duration = "5"
CameraTarget[2351].indexOnlyShowOnce = -1
CameraTarget[2351].showOnceInCurWorld = false


----炼成神功01
CameraTarget[2352] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2352].targetCamera_ids = "6894, 6895"
CameraTarget[2352].duration = "7"
CameraTarget[2352].indexOnlyShowOnce = -1
CameraTarget[2352].showOnceInCurWorld = false


----决战序曲01
CameraTarget[2353] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2353].targetCamera_ids = "6896, 6897, 6898, 6899"
CameraTarget[2353].duration = "4, 2, 4"
CameraTarget[2353].indexOnlyShowOnce = -1
CameraTarget[2353].showOnceInCurWorld = false


----决战序曲02
CameraTarget[2354] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2354].targetCamera_ids = "6900, 6901"
CameraTarget[2354].duration = "6"
CameraTarget[2354].indexOnlyShowOnce = -1
CameraTarget[2354].showOnceInCurWorld = false


----决战序曲03
CameraTarget[2355] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2355].targetCamera_ids = "6902, 6903, 6904"
CameraTarget[2355].duration = "5, 4"
CameraTarget[2355].indexOnlyShowOnce = -1
CameraTarget[2355].showOnceInCurWorld = false


----决战序曲04
CameraTarget[2356] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2356].targetCamera_ids = "6905, 6906"
CameraTarget[2356].duration = "5"
CameraTarget[2356].indexOnlyShowOnce = -1
CameraTarget[2356].showOnceInCurWorld = false


----决战序曲05
CameraTarget[2357] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2357].targetCamera_ids = "6907, 6908"
CameraTarget[2357].duration = "6"
CameraTarget[2357].indexOnlyShowOnce = -1
CameraTarget[2357].showOnceInCurWorld = false


----决战序曲06
CameraTarget[2358] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2358].targetCamera_ids = "6909, 6910, 6911"
CameraTarget[2358].duration = "5, 4"
CameraTarget[2358].indexOnlyShowOnce = -1
CameraTarget[2358].showOnceInCurWorld = false


----走火入魔01
CameraTarget[2359] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2359].targetCamera_ids = "6962, 6963"
CameraTarget[2359].duration = "4"
CameraTarget[2359].indexOnlyShowOnce = -1
CameraTarget[2359].showOnceInCurWorld = false


----走火入魔02
CameraTarget[2360] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2360].targetCamera_ids = "6964, 6965"
CameraTarget[2360].duration = "5"
CameraTarget[2360].indexOnlyShowOnce = -1
CameraTarget[2360].showOnceInCurWorld = false


----走火入魔03
CameraTarget[2361] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2361].targetCamera_ids = "6966, 6967"
CameraTarget[2361].duration = "4"
CameraTarget[2361].indexOnlyShowOnce = -1
CameraTarget[2361].showOnceInCurWorld = false


----走火入魔04
CameraTarget[2362] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2362].targetCamera_ids = "6968, 6969, 7859"
CameraTarget[2362].duration = "5, 1"
CameraTarget[2362].indexOnlyShowOnce = -1
CameraTarget[2362].showOnceInCurWorld = false


----下毒01
CameraTarget[2363] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2363].targetCamera_ids = "6934, 6935"
CameraTarget[2363].duration = "9"
CameraTarget[2363].indexOnlyShowOnce = -1
CameraTarget[2363].showOnceInCurWorld = false


----夺回凌霄宫01
CameraTarget[2364] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2364].targetCamera_ids = "6936, 6937, 6938"
CameraTarget[2364].duration = "5, 6"
CameraTarget[2364].indexOnlyShowOnce = -1
CameraTarget[2364].showOnceInCurWorld = false


----夺回凌霄宫02
CameraTarget[2365] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2365].targetCamera_ids = "6939, 6940, 6941"
CameraTarget[2365].duration = "4, 5"
CameraTarget[2365].indexOnlyShowOnce = -1
CameraTarget[2365].showOnceInCurWorld = false


----夺回凌霄宫03
CameraTarget[2366] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2366].targetCamera_ids = "6942, 6943"
CameraTarget[2366].duration = "3"
CameraTarget[2366].indexOnlyShowOnce = -1
CameraTarget[2366].showOnceInCurWorld = false


----夺回凌霄宫04
CameraTarget[2367] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2367].targetCamera_ids = "6944, 6945"
CameraTarget[2367].duration = "1"
CameraTarget[2367].indexOnlyShowOnce = -1
CameraTarget[2367].showOnceInCurWorld = false


----夺回凌霄宫05
CameraTarget[2368] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2368].targetCamera_ids = "6946, 6947"
CameraTarget[2368].duration = "2"
CameraTarget[2368].indexOnlyShowOnce = -1
CameraTarget[2368].showOnceInCurWorld = false


----夺回凌霄宫06
CameraTarget[2369] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2369].targetCamera_ids = "6948, 6949"
CameraTarget[2369].duration = "5"
CameraTarget[2369].indexOnlyShowOnce = -1
CameraTarget[2369].showOnceInCurWorld = false


----夺回凌霄宫07
CameraTarget[2370] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2370].targetCamera_ids = "6950, 6951"
CameraTarget[2370].duration = "7"
CameraTarget[2370].indexOnlyShowOnce = -1
CameraTarget[2370].showOnceInCurWorld = false


----夺回凌霄宫08
CameraTarget[2371] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2371].targetCamera_ids = "6952, 6953"
CameraTarget[2371].duration = "12"
CameraTarget[2371].indexOnlyShowOnce = -1
CameraTarget[2371].showOnceInCurWorld = false


----日月为明01
CameraTarget[2372] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2372].targetCamera_ids = "6954, 6955"
CameraTarget[2372].duration = "5"
CameraTarget[2372].indexOnlyShowOnce = -1
CameraTarget[2372].showOnceInCurWorld = false


----日月为明02
CameraTarget[2373] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2373].targetCamera_ids = "6956, 6957"
CameraTarget[2373].duration = "4"
CameraTarget[2373].indexOnlyShowOnce = -1
CameraTarget[2373].showOnceInCurWorld = false


----日月为明03
CameraTarget[2374] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2374].targetCamera_ids = "6958, 6959"
CameraTarget[2374].duration = "6"
CameraTarget[2374].indexOnlyShowOnce = -1
CameraTarget[2374].showOnceInCurWorld = false


----江湖路01
CameraTarget[2375] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2375].targetCamera_ids = "6982, 6983, 6984, 6985, 6986"
CameraTarget[2375].duration = "5, 4, 3, 3"
CameraTarget[2375].indexOnlyShowOnce = -1
CameraTarget[2375].showOnceInCurWorld = false


----黑与白01
CameraTarget[2376] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2376].targetCamera_ids = "6912, 6913, 6914"
CameraTarget[2376].duration = "2, 5"
CameraTarget[2376].indexOnlyShowOnce = -1
CameraTarget[2376].showOnceInCurWorld = false


----黑与白02
CameraTarget[2377] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2377].targetCamera_ids = "6915, 6916"
CameraTarget[2377].duration = "6"
CameraTarget[2377].indexOnlyShowOnce = -1
CameraTarget[2377].showOnceInCurWorld = false


----黑与白03
CameraTarget[2378] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2378].targetCamera_ids = "6917, 6918"
CameraTarget[2378].duration = "2"
CameraTarget[2378].indexOnlyShowOnce = -1
CameraTarget[2378].showOnceInCurWorld = false


----黑与白04
CameraTarget[2379] = CopyTable(CameraTarget["TaskEventCamera"])
CameraTarget[2379].targetCamera_ids = "6919, 6920"
CameraTarget[2379].duration = "3"
CameraTarget[2379].indexOnlyShowOnce = -1
CameraTarget[2379].showOnceInCurWorld = false


----黑与白05
CameraTarget[2380] = CopyTable(CameraTarget["TaskEventCamera"])
CameraTarget[2380].targetCamera_ids = "6921, 6922"
CameraTarget[2380].duration = "4"
CameraTarget[2380].indexOnlyShowOnce = -1
CameraTarget[2380].showOnceInCurWorld = false


----黑与白06
CameraTarget[2381] = CopyTable(CameraTarget["TaskEventCamera"])
CameraTarget[2381].targetCamera_ids = "6923, 6924"
CameraTarget[2381].duration = "2"
CameraTarget[2381].indexOnlyShowOnce = -1
CameraTarget[2381].showOnceInCurWorld = false


----黑与白07
CameraTarget[2382] = CopyTable(CameraTarget["TaskEventCamera"])
CameraTarget[2382].targetCamera_ids = "6925, 6927"
CameraTarget[2382].duration = "3"
CameraTarget[2382].indexOnlyShowOnce = -1
CameraTarget[2382].showOnceInCurWorld = false


----黑与白08
CameraTarget[2383] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2383].targetCamera_ids = "6928, 6929"
CameraTarget[2383].duration = "5"
CameraTarget[2383].indexOnlyShowOnce = -1
CameraTarget[2383].showOnceInCurWorld = false


----黑与白09
CameraTarget[2384] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2384].targetCamera_ids = "6930, 6931"
CameraTarget[2384].duration = "4"
CameraTarget[2384].indexOnlyShowOnce = -1
CameraTarget[2384].showOnceInCurWorld = false


----黑与白10
CameraTarget[2385] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2385].targetCamera_ids = "6932, 6933"
CameraTarget[2385].duration = "9"
CameraTarget[2385].indexOnlyShowOnce = -1
CameraTarget[2385].showOnceInCurWorld = false


----黑与白11
CameraTarget[2386] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2386].targetCamera_ids = "6992, 6993"
CameraTarget[2386].duration = "3"
CameraTarget[2386].indexOnlyShowOnce = -1
CameraTarget[2386].showOnceInCurWorld = false


----黑与白12
CameraTarget[2387] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2387].targetCamera_ids = "6994, 6995"
CameraTarget[2387].duration = "2"
CameraTarget[2387].indexOnlyShowOnce = -1
CameraTarget[2387].showOnceInCurWorld = false


----黑与白13
CameraTarget[2388] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2388].targetCamera_ids = "6996, 6997"
CameraTarget[2388].duration = "9"
CameraTarget[2388].indexOnlyShowOnce = -1
CameraTarget[2388].showOnceInCurWorld = false


----黑与白14
CameraTarget[2389] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2389].targetCamera_ids = "6998, 6999"
CameraTarget[2389].duration = "4"
CameraTarget[2389].indexOnlyShowOnce = -1
CameraTarget[2389].showOnceInCurWorld = false


----黑与白15
CameraTarget[2390] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2390].targetCamera_ids = "7000, 7001"
CameraTarget[2390].duration = "2"
CameraTarget[2390].indexOnlyShowOnce = -1
CameraTarget[2390].showOnceInCurWorld = false


----黑与白16
CameraTarget[2391] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2391].targetCamera_ids = "7002, 7003"
CameraTarget[2391].duration = "4"
CameraTarget[2391].indexOnlyShowOnce = -1
CameraTarget[2391].showOnceInCurWorld = false


----归山01
CameraTarget[2392] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2392].targetCamera_ids = "6871, 6872"
CameraTarget[2392].duration = "6"
CameraTarget[2392].indexOnlyShowOnce = -1
CameraTarget[2392].showOnceInCurWorld = false


----归山02
CameraTarget[2393] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2393].targetCamera_ids = "7031, 7032"
CameraTarget[2393].duration = "4"
CameraTarget[2393].indexOnlyShowOnce = -1
CameraTarget[2393].showOnceInCurWorld = false


----归山03
CameraTarget[2394] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2394].targetCamera_ids = "7033, 7799, 7798, 7797, 7800"
CameraTarget[2394].duration = "1, 1, 2, 3"
CameraTarget[2394].indexOnlyShowOnce = -1
CameraTarget[2394].showOnceInCurWorld = false


----血溅码头开打
CameraTarget[2395] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2395].targetCamera_ids = "7121, 7122"
CameraTarget[2395].duration = "5"
CameraTarget[2395].indexOnlyShowOnce = -1
CameraTarget[2395].showOnceInCurWorld = false


----烧船靠岸01
CameraTarget[2396] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2396].targetCamera_ids = "7123, 7124"
CameraTarget[2396].duration = "6"
CameraTarget[2396].indexOnlyShowOnce = -1
CameraTarget[2396].showOnceInCurWorld = false


----烧船靠岸02
CameraTarget[2397] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2397].targetCamera_ids = "7125, 7126"
CameraTarget[2397].duration = "5"
CameraTarget[2397].indexOnlyShowOnce = -1
CameraTarget[2397].showOnceInCurWorld = false


----烧船靠岸03
CameraTarget[2398] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2398].targetCamera_ids = "7128, 7130"
CameraTarget[2398].duration = "6"
CameraTarget[2398].indexOnlyShowOnce = -1
CameraTarget[2398].showOnceInCurWorld = false


----烧船靠岸04
CameraTarget[2399] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2399].targetCamera_ids = "7131, 7132"
CameraTarget[2399].duration = "3"
CameraTarget[2399].indexOnlyShowOnce = -1
CameraTarget[2399].showOnceInCurWorld = false


----烧船靠岸05
CameraTarget[2400] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2400].targetCamera_ids = "7133, 7134"
CameraTarget[2400].duration = "5"
CameraTarget[2400].indexOnlyShowOnce = -1
CameraTarget[2400].showOnceInCurWorld = false


----烧船靠岸06
CameraTarget[2401] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2401].targetCamera_ids = "7135, 7136, 7137"
CameraTarget[2401].duration = "4, 6"
CameraTarget[2401].indexOnlyShowOnce = -1
CameraTarget[2401].showOnceInCurWorld = false


----血溅码头开打02
CameraTarget[2402] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2402].targetCamera_ids = "7141, 7142"
CameraTarget[2402].duration = "5"
CameraTarget[2402].indexOnlyShowOnce = -1
CameraTarget[2402].showOnceInCurWorld = false


----临江镇江湖路
CameraTarget[2403] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2403].targetCamera_ids = "7186, 7181, 7182, 7184, 7185"
CameraTarget[2403].duration = "15, 10, 10, 15"
CameraTarget[2403].indexOnlyShowOnce = -1
CameraTarget[2403].showOnceInCurWorld = false


----联手副本转场
CameraTarget[2404] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2404].targetCamera_ids = "7285, 7286"
CameraTarget[2404].duration = "5"
CameraTarget[2404].indexOnlyShowOnce = -1
CameraTarget[2404].showOnceInCurWorld = false


----远行雪家堡新镜头
CameraTarget[2405] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2405].targetCamera_ids = "7808, 7809"
CameraTarget[2405].duration = "6"
CameraTarget[2405].indexOnlyShowOnce = -1
CameraTarget[2405].showOnceInCurWorld = false


----黑与白新镜头01
CameraTarget[2406] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2406].targetCamera_ids = "7827, 7828"
CameraTarget[2406].duration = "4"
CameraTarget[2406].indexOnlyShowOnce = -1
CameraTarget[2406].showOnceInCurWorld = false


----黑与白新镜头02
CameraTarget[2407] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2407].targetCamera_ids = "7834, 7835"
CameraTarget[2407].duration = "6"
CameraTarget[2407].indexOnlyShowOnce = -1
CameraTarget[2407].showOnceInCurWorld = false


----黑与白新镜头03
CameraTarget[2408] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2408].targetCamera_ids = "7839, 7841"
CameraTarget[2408].duration = "1"
CameraTarget[2408].indexOnlyShowOnce = -1
CameraTarget[2408].showOnceInCurWorld = false


----黑与白新镜头04
CameraTarget[2409] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2409].targetCamera_ids = "7843, 7844"
CameraTarget[2409].duration = "4"
CameraTarget[2409].indexOnlyShowOnce = -1
CameraTarget[2409].showOnceInCurWorld = false


----黑与白新镜头05
CameraTarget[2410] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2410].targetCamera_ids = "7845, 7846"
CameraTarget[2410].duration = "2"
CameraTarget[2410].indexOnlyShowOnce = -1
CameraTarget[2410].showOnceInCurWorld = false


----杀手比你快01
CameraTarget[2411] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2411].targetCamera_ids = "7849, 7850"
CameraTarget[2411].duration = "6"
CameraTarget[2411].indexOnlyShowOnce = -1
CameraTarget[2411].showOnceInCurWorld = false


----杀手比你快02
CameraTarget[2412] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2412].targetCamera_ids = "7800, 7797"
CameraTarget[2412].duration = "6"
CameraTarget[2412].indexOnlyShowOnce = -1
CameraTarget[2412].showOnceInCurWorld = false


----铸剑谷底厮杀
CameraTarget[2413] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2413].targetCamera_ids = "7873, 7874"
CameraTarget[2413].duration = "5"
CameraTarget[2413].indexOnlyShowOnce = -1
CameraTarget[2413].showOnceInCurWorld = false


----补药王谷剧情01
CameraTarget[2414] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2414].targetCamera_ids = "8319, 8320"
CameraTarget[2414].duration = "5"
CameraTarget[2414].indexOnlyShowOnce = -1
CameraTarget[2414].showOnceInCurWorld = false


----补药王谷剧情02
CameraTarget[2415] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2415].targetCamera_ids = "8321, 8322"
CameraTarget[2415].duration = "5"
CameraTarget[2415].indexOnlyShowOnce = -1
CameraTarget[2415].showOnceInCurWorld = false


----补药物谷剧情03
CameraTarget[2416] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2416].targetCamera_ids = "8323, 8324"
CameraTarget[2416].duration = "6"
CameraTarget[2416].indexOnlyShowOnce = -1
CameraTarget[2416].showOnceInCurWorld = false


----武当山剧情01
CameraTarget[2417] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2417].targetCamera_ids = "8325, 8328, 8329, 8330"
CameraTarget[2417].duration = "3, 2, 2"
CameraTarget[2417].indexOnlyShowOnce = -1
CameraTarget[2417].showOnceInCurWorld = false


----武当山剧情02
CameraTarget[2418] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2418].targetCamera_ids = "8331, 8332, 8333"
CameraTarget[2418].duration = "3, 2"
CameraTarget[2418].indexOnlyShowOnce = -1
CameraTarget[2418].showOnceInCurWorld = false


----武当山剧情03
CameraTarget[2419] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2419].targetCamera_ids = "8334, 8337, 8335"
CameraTarget[2419].duration = "3, 2"
CameraTarget[2419].indexOnlyShowOnce = -1
CameraTarget[2419].showOnceInCurWorld = false


----武当山剧情04
CameraTarget[2420] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2420].targetCamera_ids = "8339, 8343, 8344"
CameraTarget[2420].duration = "2, 3"
CameraTarget[2420].indexOnlyShowOnce = -1
CameraTarget[2420].showOnceInCurWorld = false


----少室山剧情01
CameraTarget[2421] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2421].targetCamera_ids = "8354, 8355"
CameraTarget[2421].duration = "4"
CameraTarget[2421].indexOnlyShowOnce = -1
CameraTarget[2421].showOnceInCurWorld = false


----少室山剧情02
CameraTarget[2422] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2422].targetCamera_ids = "8356, 8357"
CameraTarget[2422].duration = "3"
CameraTarget[2422].indexOnlyShowOnce = -1
CameraTarget[2422].showOnceInCurWorld = false


----少室山剧情03
CameraTarget[2423] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2423].targetCamera_ids = "8358, 8359, 8360"
CameraTarget[2423].duration = "2, 3"
CameraTarget[2423].indexOnlyShowOnce = -1
CameraTarget[2423].showOnceInCurWorld = false


----仙霞岭剧情01
CameraTarget[2424] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2424].targetCamera_ids = "8367, 8368, 8371"
CameraTarget[2424].duration = "3, 4"
CameraTarget[2424].indexOnlyShowOnce = -1
CameraTarget[2424].showOnceInCurWorld = false


----仙霞岭剧情02
CameraTarget[2425] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2425].targetCamera_ids = "8372, 8374"
CameraTarget[2425].duration = "5"
CameraTarget[2425].indexOnlyShowOnce = -1
CameraTarget[2425].showOnceInCurWorld = false


----廿八铺剧情01
CameraTarget[2426] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2426].targetCamera_ids = "8382, 8383, 8384"
CameraTarget[2426].duration = "3, 2"
CameraTarget[2426].indexOnlyShowOnce = -1
CameraTarget[2426].showOnceInCurWorld = false


----廿八铺剧情02
CameraTarget[2427] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2427].targetCamera_ids = "8380, 8381"
CameraTarget[2427].duration = "3"
CameraTarget[2427].indexOnlyShowOnce = -1
CameraTarget[2427].showOnceInCurWorld = false


----廿八铺剧情03
CameraTarget[2428] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2428].targetCamera_ids = "8378, 8379"
CameraTarget[2428].duration = "3"
CameraTarget[2428].indexOnlyShowOnce = -1
CameraTarget[2428].showOnceInCurWorld = false


----廿八铺剧情04
CameraTarget[2429] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2429].targetCamera_ids = "8385, 8386"
CameraTarget[2429].duration = "4"
CameraTarget[2429].indexOnlyShowOnce = -1
CameraTarget[2429].showOnceInCurWorld = false


----廿八铺剧情05
CameraTarget[2430] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2430].targetCamera_ids = "8387, 8388"
CameraTarget[2430].duration = "3"
CameraTarget[2430].indexOnlyShowOnce = -1
CameraTarget[2430].showOnceInCurWorld = false


----廿八铺剧情06
CameraTarget[2431] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2431].targetCamera_ids = "8389, 8390"
CameraTarget[2431].duration = "5"
CameraTarget[2431].indexOnlyShowOnce = -1
CameraTarget[2431].showOnceInCurWorld = false


----乐山剧情01
CameraTarget[2432] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2432].targetCamera_ids = "8393, 8394"
CameraTarget[2432].duration = "8"
CameraTarget[2432].indexOnlyShowOnce = -1
CameraTarget[2432].showOnceInCurWorld = false


----乐山剧情02
CameraTarget[2433] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2433].targetCamera_ids = "8395, 8396"
CameraTarget[2433].duration = "10"
CameraTarget[2433].indexOnlyShowOnce = -1
CameraTarget[2433].showOnceInCurWorld = false


----乐山剧情03
CameraTarget[2434] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2434].targetCamera_ids = "8397, 8398"
CameraTarget[2434].duration = "8"
CameraTarget[2434].indexOnlyShowOnce = -1
CameraTarget[2434].showOnceInCurWorld = false


----乐山剧情04
CameraTarget[2435] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2435].targetCamera_ids = "8399, 8400"
CameraTarget[2435].duration = "5"
CameraTarget[2435].indexOnlyShowOnce = -1
CameraTarget[2435].showOnceInCurWorld = false


----乐山剧情05
CameraTarget[2436] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2436].targetCamera_ids = "8401, 8402"
CameraTarget[2436].duration = "5"
CameraTarget[2436].indexOnlyShowOnce = -1
CameraTarget[2436].showOnceInCurWorld = false


----青城山副本简单01_1
CameraTarget[2437] = CopyTable(CameraTarget["TaskEventCamera"])
CameraTarget[2437].targetCamera_ids = "8609, 8610, 8611, 8612"
CameraTarget[2437].duration = "3, 2, 3"
CameraTarget[2437].indexOnlyShowOnce = -1
CameraTarget[2437].showOnceInCurWorld = false


----青城山副本困难02_1
CameraTarget[2438] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2438].targetCamera_ids = "8620, 8621, 8622, 8623"
CameraTarget[2438].duration = "3, 0.5, 1.5"
CameraTarget[2438].indexOnlyShowOnce = -1
CameraTarget[2438].showOnceInCurWorld = false


----青城山副本困难02_2
CameraTarget[2439] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2439].targetCamera_ids = "8624, 8629, 8662"
CameraTarget[2439].duration = "5, 4"
CameraTarget[2439].indexOnlyShowOnce = -1
CameraTarget[2439].showOnceInCurWorld = false


----青城山副本简单01_2_2
CameraTarget[2440] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2440].targetCamera_ids = "8749, 8855, 8853"
CameraTarget[2440].duration = "3, 2"
CameraTarget[2440].indexOnlyShowOnce = -1
CameraTarget[2440].showOnceInCurWorld = false


----青城山副本简单01_2_1
CameraTarget[2441] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2441].targetCamera_ids = "8742, 8743, 8744, 8745"
CameraTarget[2441].duration = "1.5, 2, 1.5"
CameraTarget[2441].indexOnlyShowOnce = -1
CameraTarget[2441].showOnceInCurWorld = false


----联手产品演示_入场_1
CameraTarget[2442] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2442].targetCamera_ids = "8753, 8754, 8794, 8795"
CameraTarget[2442].duration = "4, 3, 4"
CameraTarget[2442].indexOnlyShowOnce = -1
CameraTarget[2442].showOnceInCurWorld = false


----联手产品演示_入场_2
CameraTarget[2443] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2443].targetCamera_ids = "8755, 8756"
CameraTarget[2443].duration = "4"
CameraTarget[2443].indexOnlyShowOnce = -1
CameraTarget[2443].showOnceInCurWorld = false


----联手产品演示_入场_3
CameraTarget[2444] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2444].targetCamera_ids = "8757, 8758"
CameraTarget[2444].duration = "5"
CameraTarget[2444].indexOnlyShowOnce = -1
CameraTarget[2444].showOnceInCurWorld = false


----围攻01
CameraTarget[2445] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2445].targetCamera_ids = "8761, 8762"
CameraTarget[2445].duration = "5"
CameraTarget[2445].indexOnlyShowOnce = -1
CameraTarget[2445].showOnceInCurWorld = false


----围攻02
CameraTarget[2446] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2446].targetCamera_ids = "8759, 8760"
CameraTarget[2446].duration = "6"
CameraTarget[2446].indexOnlyShowOnce = -1
CameraTarget[2446].showOnceInCurWorld = false


----围攻03
CameraTarget[2447] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2447].targetCamera_ids = "8763, 8764"
CameraTarget[2447].duration = "5"
CameraTarget[2447].indexOnlyShowOnce = -1
CameraTarget[2447].showOnceInCurWorld = false


----选路01
CameraTarget[2448] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2448].targetCamera_ids = "8765, 8766"
CameraTarget[2448].duration = "5"
CameraTarget[2448].indexOnlyShowOnce = -1
CameraTarget[2448].showOnceInCurWorld = false


----选路02
CameraTarget[2449] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2449].targetCamera_ids = "8767, 8768"
CameraTarget[2449].duration = "5"
CameraTarget[2449].indexOnlyShowOnce = -1
CameraTarget[2449].showOnceInCurWorld = false


----Boss出场01
CameraTarget[2450] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2450].targetCamera_ids = "8771, 8772"
CameraTarget[2450].duration = "4"
CameraTarget[2450].indexOnlyShowOnce = -1
CameraTarget[2450].showOnceInCurWorld = false


----Boss出场02
CameraTarget[2451] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2451].targetCamera_ids = "8769, 8770, 8773, 8774, 8775"
CameraTarget[2451].duration = "2, 0.5, 0.5, 4"
CameraTarget[2451].indexOnlyShowOnce = -1
CameraTarget[2451].showOnceInCurWorld = false


----跳崖前
CameraTarget[2452] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2452].targetCamera_ids = "8776, 8777, 8779, 8780"
CameraTarget[2452].duration = "7, 2, 3"
CameraTarget[2452].indexOnlyShowOnce = -1
CameraTarget[2452].showOnceInCurWorld = false


----跳崖后01
CameraTarget[2453] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2453].targetCamera_ids = "8781, 8782"
CameraTarget[2453].duration = "3"
CameraTarget[2453].indexOnlyShowOnce = -1
CameraTarget[2453].showOnceInCurWorld = false


----跳崖后02
CameraTarget[2454] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2454].targetCamera_ids = "8783, 8784"
CameraTarget[2454].duration = "1"
CameraTarget[2454].indexOnlyShowOnce = -1
CameraTarget[2454].showOnceInCurWorld = false


----跳崖后03
CameraTarget[2455] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2455].targetCamera_ids = "8785, 8786"
CameraTarget[2455].duration = "6"
CameraTarget[2455].indexOnlyShowOnce = -1
CameraTarget[2455].showOnceInCurWorld = false


----补围攻镜头01
CameraTarget[2456] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2456].targetCamera_ids = "8787, 8788"
CameraTarget[2456].duration = "5"
CameraTarget[2456].indexOnlyShowOnce = -1
CameraTarget[2456].showOnceInCurWorld = false


----补围攻镜头02
CameraTarget[2457] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2457].targetCamera_ids = "8789, 8790, 8791"
CameraTarget[2457].duration = "5, 1"
CameraTarget[2457].indexOnlyShowOnce = -1
CameraTarget[2457].showOnceInCurWorld = false


----补围攻镜头03
CameraTarget[2458] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2458].targetCamera_ids = "8792, 8793"
CameraTarget[2458].duration = "5"
CameraTarget[2458].indexOnlyShowOnce = -1
CameraTarget[2458].showOnceInCurWorld = false


----联手小怪登场
CameraTarget[2459] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2459].targetCamera_ids = "8809, 8810, 8811"
CameraTarget[2459].duration = "1, 1"
CameraTarget[2459].indexOnlyShowOnce = -1
CameraTarget[2459].showOnceInCurWorld = false


----联手吊桥落下
CameraTarget[2460] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2460].targetCamera_ids = "8812, 8813, 8814"
CameraTarget[2460].duration = "1, 4"
CameraTarget[2460].indexOnlyShowOnce = -1
CameraTarget[2460].showOnceInCurWorld = false


----青城山副本简单01_2_3
CameraTarget[2461] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2461].targetCamera_ids = "8854, 8751, 8752"
CameraTarget[2461].duration = "2, 3"
CameraTarget[2461].indexOnlyShowOnce = -1
CameraTarget[2461].showOnceInCurWorld = false


----青城山副本简单01_2_4
CameraTarget[2462] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2462].targetCamera_ids = "8856, 8857"
CameraTarget[2462].duration = "3"
CameraTarget[2462].indexOnlyShowOnce = -1
CameraTarget[2462].showOnceInCurWorld = false


----青城山副本简单01_2_5
CameraTarget[2463] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2463].targetCamera_ids = "8858, 8859, 8860, 8861, 8863"
CameraTarget[2463].duration = "2, 2, 2, 4"
CameraTarget[2463].indexOnlyShowOnce = -1
CameraTarget[2463].showOnceInCurWorld = false


----青城山副本BOSS亮相1罗人杰
CameraTarget[2464] = CopyTable(CameraTarget["TaskEventCamera"])
CameraTarget[2464].targetCamera_ids = "8905, 8924, 8890"
CameraTarget[2464].duration = "1, 1"
CameraTarget[2464].indexOnlyShowOnce = -1
CameraTarget[2464].showOnceInCurWorld = false


----青城山副本BOSS亮相2于人豪
CameraTarget[2465] = CopyTable(CameraTarget["TaskEventCamera"])
CameraTarget[2465].targetCamera_ids = "8906, 8925, 8891"
CameraTarget[2465].duration = "1, 1"
CameraTarget[2465].indexOnlyShowOnce = -1
CameraTarget[2465].showOnceInCurWorld = false


----青城山副本BOSS亮相3洪人雄
CameraTarget[2466] = CopyTable(CameraTarget["TaskEventCamera"])
CameraTarget[2466].targetCamera_ids = "8907, 8926, 8892"
CameraTarget[2466].duration = "1, 1"
CameraTarget[2466].indexOnlyShowOnce = -1
CameraTarget[2466].showOnceInCurWorld = false


----青城山副本BOSS亮相4侯人英
CameraTarget[2467] = CopyTable(CameraTarget["TaskEventCamera"])
CameraTarget[2467].targetCamera_ids = "8908, 8927, 8893"
CameraTarget[2467].duration = "1, 1"
CameraTarget[2467].indexOnlyShowOnce = -1
CameraTarget[2467].showOnceInCurWorld = false


----青城山入场CG
CameraTarget[2468] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2468].targetCamera_ids = "8903, 8902, 8894"
CameraTarget[2468].duration = "1, 2"
CameraTarget[2468].indexOnlyShowOnce = -1
CameraTarget[2468].showOnceInCurWorld = false


----联手小怪登场前
CameraTarget[2469] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2469].targetCamera_ids = "8929, 8930"
CameraTarget[2469].duration = "3"
CameraTarget[2469].indexOnlyShowOnce = -1
CameraTarget[2469].showOnceInCurWorld = false


----联手小怪2登场
CameraTarget[2470] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2470].targetCamera_ids = "8933, 8934, 8935"
CameraTarget[2470].duration = "1, 1"
CameraTarget[2470].indexOnlyShowOnce = -1
CameraTarget[2470].showOnceInCurWorld = false


----联手小怪2登场前
CameraTarget[2471] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2471].targetCamera_ids = "8931, 8932"
CameraTarget[2471].duration = "3"
CameraTarget[2471].indexOnlyShowOnce = -1
CameraTarget[2471].showOnceInCurWorld = false


----联手小怪3登场
CameraTarget[2472] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2472].targetCamera_ids = "8945, 8946, 8947"
CameraTarget[2472].duration = "1, 1"
CameraTarget[2472].indexOnlyShowOnce = -1
CameraTarget[2472].showOnceInCurWorld = false


----联手小怪3登场前
CameraTarget[2473] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2473].targetCamera_ids = "8943, 8944"
CameraTarget[2473].duration = "3"
CameraTarget[2473].indexOnlyShowOnce = -1
CameraTarget[2473].showOnceInCurWorld = false


----联手小怪4登场前
CameraTarget[2474] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2474].targetCamera_ids = "8936, 8937"
CameraTarget[2474].duration = "3"
CameraTarget[2474].indexOnlyShowOnce = -1
CameraTarget[2474].showOnceInCurWorld = false


----联手小怪5登场
CameraTarget[2475] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2475].targetCamera_ids = "8955, 8956, 8957"
CameraTarget[2475].duration = "1, 1"
CameraTarget[2475].indexOnlyShowOnce = -1
CameraTarget[2475].showOnceInCurWorld = false


----联手小怪5登场前
CameraTarget[2476] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2476].targetCamera_ids = "8953, 8954"
CameraTarget[2476].duration = "3"
CameraTarget[2476].indexOnlyShowOnce = -1
CameraTarget[2476].showOnceInCurWorld = false


----联手小怪6登场
CameraTarget[2477] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2477].targetCamera_ids = "8950, 8952, 8951"
CameraTarget[2477].duration = "1, 0.6"
CameraTarget[2477].indexOnlyShowOnce = -1
CameraTarget[2477].showOnceInCurWorld = false


----联手小怪6登场前
CameraTarget[2478] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2478].targetCamera_ids = "8948, 8949"
CameraTarget[2478].duration = "2.4"
CameraTarget[2478].indexOnlyShowOnce = -1
CameraTarget[2478].showOnceInCurWorld = false


----联手小怪7登场
CameraTarget[2479] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2479].targetCamera_ids = "8961, 8962"
CameraTarget[2479].duration = "1.5"
CameraTarget[2479].indexOnlyShowOnce = -1
CameraTarget[2479].showOnceInCurWorld = false


----联手小怪7登场前
CameraTarget[2480] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2480].targetCamera_ids = "8959, 8960"
CameraTarget[2480].duration = "2.5"
CameraTarget[2480].indexOnlyShowOnce = -1
CameraTarget[2480].showOnceInCurWorld = false


----联手小怪8登场
CameraTarget[2481] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2481].targetCamera_ids = "8967, 8969"
CameraTarget[2481].duration = "1.5"
CameraTarget[2481].indexOnlyShowOnce = -1
CameraTarget[2481].showOnceInCurWorld = false


----联手小怪8登场前1
CameraTarget[2482] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2482].targetCamera_ids = "8963, 8964"
CameraTarget[2482].duration = "1.5"
CameraTarget[2482].indexOnlyShowOnce = -1
CameraTarget[2482].showOnceInCurWorld = false


----联手小怪8登场前2
CameraTarget[2483] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2483].targetCamera_ids = "8965, 8966, 8968"
CameraTarget[2483].duration = "1, 0.5"
CameraTarget[2483].indexOnlyShowOnce = -1
CameraTarget[2483].showOnceInCurWorld = false


----联手小怪9登场
CameraTarget[2484] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2484].targetCamera_ids = "8976, 8977, 8978, 8979, 8980"
CameraTarget[2484].duration = "1.5, 1.5, 1.5, 1.5"
CameraTarget[2484].indexOnlyShowOnce = -1
CameraTarget[2484].showOnceInCurWorld = false


----联手小怪9登场前
CameraTarget[2485] = CopyTable(CameraTarget["OverlookCity"])
CameraTarget[2485].targetCamera_ids = "8970, 8971, 8972, 8973, 8974, 8975"
CameraTarget[2485].duration = "5, 1, 0.5, 1, 0.5"
CameraTarget[2485].indexOnlyShowOnce = -1
CameraTarget[2485].showOnceInCurWorld = false
