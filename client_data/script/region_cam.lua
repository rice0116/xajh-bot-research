--[[#tag push auto]]


RegionCamera = {}
RegionCamera.RegionCfg = {}
RegionCamera.TaskCfg = {}
RegionCamera.BoardCfg = {}

--处理场景和副本id
function RegionCamera:DealWorldSceneID(v, idScene, idWorld)
	local bDeal = false
	if idWorld ~= 0  and v.WorldID[idWorld] then
		if v.WorldID[idWorld] == true then
			bDeal = true
		end
	end
	if idScene ~= 0 and v.SceneID[idScene] then
		if v.SceneID[idScene] == true then
			bDeal = true
		end
	end
	return bDeal
end

--进入相机锁定区域
function RegionCamera:OnEnterCamRegion(idScene, idWorld, idBoard, nameRegion)

	local camSpecType = CAM_SPECOP_NONE
	if BoardRegionSpecOpCfg[idWorld] ~= nil then
		local brdOpCfg = BoardRegionSpecOpCfg[idWorld][idBoard]
		if brdOpCfg ~= nil then
			if brdOpCfg[nameRegion] ~= nil then
				camSpecType = brdOpCfg[nameRegion]
			elseif brdOpCfg["default"] ~= nil then
				camSpecType = brdOpCfg["default"]
			end
		end
	end

	local camInfo = RegionCamera.RegionCfg[nameRegion]
	if camInfo then
	 	if RegionCamera:DealWorldSceneID(camInfo, idScene, idWorld) then
			--local strDbg = string.format("OnEnterCamRegion: %s, OpType: %d\n", nameRegion, camSpecType)
			--LogPrint(strDbg)
			GameApi.LockRegionCamera(nameRegion, camSpecType, camInfo)
		end
	else
		--local strDbg = string.format("OnEnterCamRegion: %s, OpType: %d\n", nameRegion, camSpecType)
		--LogPrint(strDbg)
		GameApi.LockRegionCamera(nameRegion, camSpecType)
	end

end

--离开相机锁定区域
function RegionCamera:OnLeaveCamRegion(idScene, idWorld, nameRegion)
	local camInfo = RegionCamera.RegionCfg[nameRegion]
	if camInfo and RegionCamera:DealWorldSceneID(camInfo, idScene, idWorld) then
		--local strDbg = string.format("OnLeaveCamRegion: %s\n", nameRegion)
		--LogPrint(strDbg)
		GameApi.UnlockRegionCamera()
	end
end

--任务状态
function RegionCamera:OnTaskState(idWorld, idScene, idTask, eState)
	local camInfo = RegionCamera.TaskCfg[idTask] and RegionCamera.TaskCfg[idTask][eState] or nil
	if camInfo and RegionCamera:DealWorldSceneID(camInfo, idScene, idWorld) then
		local strDbg = string.format(--[[!AUTO_1]]"RegionCamera:OnTaskState: %d, State %d\n", idTask, eState)
		LogPrint(strDbg)
		GameApi.CameraLookAtPosVisual(camInfo)
	end
end

--副本版面状态
function RegionCamera:OnBoardState(idWorld, idScene, idBoard, eState)
	local sceneInfo = RegionCamera.BoardCfg[idWorld] and RegionCamera.BoardCfg[idWorld][idScene] or nil
	local boardInfo = sceneInfo and sceneInfo[idBoard] or nil
	local camInfo = boardInfo and boardInfo[eState] or nil
	if camInfo then
		local strDbg = string.format(--[[!AUTO_2]]"RegionCamera:OnBoardState: world %d, scene %d, board %d, state %d\n", idWorld, idScene, idBoard, eState)
		LogPrint(strDbg)
		GameApi.CameraLookAtPosVisual(camInfo)
	end
end

-------------------------副本版面（区域）特殊操作配置数据-------------------
BoardRegionSpecOpCfg =
{
	[1751] = --副本id: 联手副本
	{
		[35] = --版面id
		--[22] = --版面id
		{
	 		--["LSJT_26"] = CAM_SPECOP_LOCKFACE_RUN,  --区域名称匹配
	 		["default"] = CAM_SPECOP_LOCKFACE_RUN, 	--default表示不用匹配名称（版面内所有位置）
	 	},
	},
}


------------------------------------相机Mode--------------------------------------
FCM_NONE		= 0
FCM_FIX_PITCHYAW	= 1	--锁定yaw和pitch方位角		（全锁定，倩女）
FCM_FIX_PITCH		= 2	--只锁定pitch方位角		（系统摄像机1，天龙1）
FCM_FREE		= 3	--自由视角			（全自由，魔兽）
FCM_FREE_LIMITPITCH	= 4	--自由视角，但pitch范围有限制	（系统摄像机2，天龙2）
FCM_FIX_CAMPOS		= 5	--固定相机位置，只改变观察点	（固定机位，单机）
----------------------------------------------------------------------------------
----------------------------------相机过渡方式------------------------------------
CAMTRANSTYPE_DEFAULT 	= -1	--游戏默认参数			（不需参数）
CAMTRANSTYPE_NONE	= 0	--无过渡，直接切		（不需参数）
CAMTRANSTYPE_CONSTSPEED = 1	--匀速过渡			（需指定速度）
CAMTRANSTYPE_EXP	= 2	--指数过渡			（需指定指数）
CAMTRANSTYPE_SQUARE_ACC = 3	--匀加速过渡			（需指定时间，初速度）
----------------------------------------------------------------------------------


-----------------------------Region镜头配置数据------------------------------------
--范例
--[[RegionCamera.RegionCfg["LSJT_BASE"] =
{
		Mode	= FCM_FREE,	--镜头类型
		CamID	= 0,	--镜头ID，不输即无效
		CamTransMode = CAMTRANSTYPE_CONSTSPEED, --相机过渡方式
		CamTransTime = 1000,	--相机过渡时间(毫秒)，仅在匀速、匀加速方式时有意义；对于不是匀加速的方式：用这个时间来计算Speed，Cam
		CamTransSpeed = 0,	--相机运动指数，程序默认是5.0，匀加速和指数时有意义；匀加速方式表示初速度，指数方式表示指数
		LookOff = 3.0, 		--观察点竖直偏移，向上为正
		LookOff_DirH = -2.0, --观察点在相机水平朝向的偏移，向前为正
		FixedLookHei = 45.5, --观察点固定高度
		DisableUICamCtrl = true, --禁止界面设置相机
		IgnoreMaxDistRatio = false, --忽略游戏里的相机距离设置
		UseDotaCamera = true, --是否使用Dota相机模式（相机不随人动，鼠标移到屏幕边缘时移动相机焦点）
		SceneID	= --场景id
		{
		},
		WorldID	= --副本id
		{
			[1751] = true,
		},
}
]]





--联手产品演示版面镜头（副本ID：1751）（除了下落功能限制，其它所有镜头因不够完美全注掉）

----RegionCamera.RegionCfg["LSJT_01"] =	--暂不要的原因是来回进出不方便控制
----{
----		Mode	= FCM_FREE,
----		CamID	= 0,--8498,
----		SceneID	=
----		{
----		},
----		WorldID =
----		{
----			[1751] = true,
----		},
----}
--RegionCamera.RegionCfg["LSJT_02"] =
--{
--		Mode	= FCM_FREE,
--		CamID	= 8499,
--		CamTransMode = CAMTRANSTYPE_NONE,
--		SceneID	=
--		{
--			[1] = true,
--		},
--		WorldID =
--		{
--			[1751] = true,
--		},
--}
--RegionCamera.RegionCfg["LSJT_03"] =
--{
--		Mode	= FCM_FIX_CAMPOS,
--		CamID	= 8500,
--		DisableUICamCtrl = true,
--		CamTransMode = CAMTRANSTYPE_CONSTSPEED,
--		CamTransTime = 1000,
--		LookOff = 1,
--		SceneID	=
--		{
--			[1] = true,
--		},
--		WorldID =
--		{
--			[1751] = true,
--		},
--}
--RegionCamera.RegionCfg["LSJT_04"] =
--{
--		Mode	= FCM_FREE,
--		CamID	= 8501,
--		CamTransMode = CAMTRANSTYPE_NONE,
--		LookOff = 0.5,
--		SceneID	=
--		{
--			[1] = true,
--		},
--		WorldID =
--		{
--			[1751] = true,
--		},
--}
--RegionCamera.RegionCfg["LSJT_05"] =
--{
--		Mode	= FCM_FREE,
--		CamID	= 8502,
--		CamTransMode = CAMTRANSTYPE_NONE,
--		LookOff = 0.5,
--		SceneID	=
--		{
--			[1] = true,
--		},
--		WorldID =
--		{
--			[1751] = true,
--		},
--}
--RegionCamera.RegionCfg["LSJT_06"] =
--{
--		Mode	= FCM_FIX_PITCHYAW,
--		CamID	= 8503,	--8503是纵向，8868是横向
--		DisableUICamCtrl = true,
--		CamTransMode = CAMTRANSTYPE_CONSTSPEED,
--		CamTransTime = 1000,
--		SceneID	=
--		{
--			[1] = true,
--		},
--		WorldID =
--		{
--			[1751] = true,
--		},
--}
--RegionCamera.RegionCfg["LSJT_07"] =
--{
--		Mode	= FCM_FREE,
--		CamID	= 8504,
--		CamTransMode = CAMTRANSTYPE_EXP,
--		CamTransSpeed = 2.7,
--		LookOff = 0.5,
--		SceneID	=
--		{
--			[1] = true,
--		},
--		WorldID	=
--		{
--			[1751] = true,
--		},
--}
--RegionCamera.RegionCfg["LSJT_08"] =
--{
--		Mode	= FCM_FREE,
--		CamID	= 8507,
--		CamTransMode = CAMTRANSTYPE_CONSTSPEED,
--		CamTransTime = 620,
--		LookOff = 0.5,
--		SceneID	=
--		{
--			[1] = true,
--		},
--		WorldID	=
--		{
--			[1751] = true,
--		},
--}
--RegionCamera.RegionCfg["LSJT_09"] =
--{
--		Mode	= FCM_FIX_CAMPOS,
--		CamID	= 8509,
--		DisableUICamCtrl = true,
--		CamTransMode = CAMTRANSTYPE_CONSTSPEED,
--		CamTransTime = 1000,
--		LookOff = 0.5,
--		SceneID	=
--		{
--			[1] = true,
--		},
--		WorldID	=
--		{
--			[1751] = true,
--		},
--}
--RegionCamera.RegionCfg["LSJT_10"] =
--{
--		Mode	= FCM_FIX_PITCHYAW,
--		CamID	= 8511,
--		DisableUICamCtrl = true,
--		CamTransMode = CAMTRANSTYPE_NONE,
--		LookOff = 0.5,
--		SceneID	=
--		{
--			[1] = true,
--		},
--		WorldID	=
--		{
--			[1751] = true,
--		},
--}
--RegionCamera.RegionCfg["LSJT_11"] =
--{
--		Mode	= FCM_FREE,
--		CamID	= 8511,
--		CamTransMode = CAMTRANSTYPE_CONSTSPEED,
--		CamTransTime = 620,
--		LookOff = 0.5,
--		SceneID	=
--		{
--			[1] = true,
--		},
--		WorldID	=
--		{
--			[1751] = true,
--		},
--}
--RegionCamera.RegionCfg["LSJT_12"] =
--{
--		Mode	= FCM_FIX_PITCHYAW,
--
--		CamID	= 8513,
--		DisableUICamCtrl = true,
--		CamTransMode = CAMTRANSTYPE_EXP,
--		CamTransSpeed = 8,
--		SceneID	=
--		{
--			[1] = true,
--		},
--		WorldID	=
--		{
--			[1751] = true,
--		},
--}
--RegionCamera.RegionCfg["LSJT_13"] =
--{
--		Mode	= FCM_FREE,
--		CamID	= 8514,
--		DisableUICamCtrl = true,
--		CamTransMode = CAMTRANSTYPE_EXP,
--		CamTransSpeed = 2.7,
--		LookOff = 0.5,
--		SceneID	=
--		{
--			[1] = true,
--		},
--		WorldID	=
--		{
--			[1751] = true,
--		},
--}
----RegionCamera.RegionCfg["LSJT_14"] =	--不用的原因是改成了分区域镜头
----{
----		Mode	= FCM_FIX_CAMPOS,
----		CamID	= 8526,
----		DisableUICamCtrl = true,
----		CamTransMode = CAMTRANSTYPE_NONE,
----		SceneID	=
----		{
----			[1] = true,
----		},
----		WorldID	=
----		{
----			[1751] = true,
----		},
----}
--RegionCamera.RegionCfg["LSJT_14_1"] =
--{
--		Mode	= FCM_FIX_PITCHYAW,
--		CamID	= 8580,
--		DisableUICamCtrl = true,
--		CamTransMode = CAMTRANSTYPE_CONSTSPEED,
--		CamTransTime = 620,
--		LookOff = 0.5,
--		SceneID	=
--		{
--			[1] = true,
--		},
--		WorldID	=
--		{
--			[1751] = true,
--		},
--}
--RegionCamera.RegionCfg["LSJT_14_2"] =
--{
--		Mode	= FCM_FIX_CAMPOS,
--		CamID	= 8581,
--		DisableUICamCtrl = true,
--		CamTransMode = CAMTRANSTYPE_CONSTSPEED,
--		CamTransTime = 620,
--		LookOff = 0.5,
--		SceneID	=
--		{
--			[1] = true,
--		},
--		WorldID	=
--		{
--			[1751] = true,
--		},
--}
--RegionCamera.RegionCfg["LSJT_14_3"] =
--{
--		Mode	= FCM_FIX_CAMPOS,
--		CamID	= 8582,
--		DisableUICamCtrl = true,
--		CamTransMode = CAMTRANSTYPE_CONSTSPEED,
--		CamTransTime = 620,
--		LookOff = 0.5,
--		SceneID	=
--		{
--			[1] = true,
--		},
--		WorldID	=
--		{
--			[1751] = true,
--		},
--}
--RegionCamera.RegionCfg["LSJT_14_4"] =
--{
--		Mode	= FCM_FIX_CAMPOS,
--		CamID	= 8583,
--		DisableUICamCtrl = true,
--		CamTransMode = CAMTRANSTYPE_CONSTSPEED,
--		CamTransTime = 620,
--		LookOff = 0.5,
--		SceneID	=
--		{
--			[1] = true,
--		},
--		WorldID	=
--		{
--			[1751] = true,
--		},
--}
--RegionCamera.RegionCfg["LSJT_14_5"] =
--{
--		Mode	= FCM_FIX_PITCHYAW,
--		CamID	= 8584,
--		DisableUICamCtrl = true,
--		CamTransMode = CAMTRANSTYPE_CONSTSPEED,
--		CamTransTime = 620,
--		SceneID	=
--		{
--			[1] = true,
--		},
--		WorldID	=
--		{
--			[1751] = true,
--		},
--}
--RegionCamera.RegionCfg["LSJT_15"] =
--{
--		Mode	= FCM_FIX_CAMPOS,
--		CamID	= 8515,
--		DisableUICamCtrl = true,
--		CamTransMode = CAMTRANSTYPE_NONE,
--		LookOff = -0.5,
--		SceneID	=
--		{
--			[1] = true,
--		},
--		WorldID	=
--		{
--			[1751] = true,
--		},
--}
--RegionCamera.RegionCfg["LSJT_16"] =
--{
--		Mode	= FCM_FREE,
--		CamID	= 8516,
--		CamTransMode = CAMTRANSTYPE_CONSTSPEED,
--		CamTransTime = 620,
--		LookOff = -0.5,
--		SceneID	=
--		{
--			[1] = true,
--		},
--		WorldID	=
--		{
--			[1751] = true,
--		},
--}
----RegionCamera.RegionCfg["LSJT_17"] =	--不用的原因是改成了分区域镜头
----{
----		Mode	= FCM_FIX_PITCHYAW,
----		CamID	= 8517,
----		DisableUICamCtrl = true,
----		CamTransMode = CAMTRANSTYPE_NONE,
----		SceneID	=
----		{
----			[1] = true,
----		},
----		WorldID	=
----		{
----			[1751] = true,
----		},
----}
--RegionCamera.RegionCfg["LSJT_17_1"] =
--{
--		Mode	= FCM_FREE,
--		CamID	= 8593,
--		--CamTransMode = CAMTRANSTYPE_NONE,
--		CamTransMode = CAMTRANSTYPE_EXP,
--		CamTransSpeed = 8,
--		LookOff = 0.5,
--		SceneID	=
--		{
--			[1] = true,
--		},
--		WorldID	=
--		{
--			[1751] = true,
--		},
--}
--RegionCamera.RegionCfg["LSJT_17_2"] =
--{
--		Mode	= FCM_FREE,
--		CamID	= 8594,
--		--CamTransMode = CAMTRANSTYPE_NONE,
--		CamTransMode = CAMTRANSTYPE_EXP,
--		CamTransSpeed = 8,
--		LookOff = 0.5,
--		SceneID	=
--		{
--			[1] = true,
--		},
--		WorldID	=
--		{
--			[1751] = true,
--		},
--}
--RegionCamera.RegionCfg["LSJT_17_3"] =
--{
--		Mode	= FCM_FREE,
--		CamID	= 8595,
--		--CamTransMode = CAMTRANSTYPE_NONE,
--		CamTransMode = CAMTRANSTYPE_EXP,
--		CamTransSpeed = 8,
--		LookOff = 1,
--		SceneID	=
--		{
--			[1] = true,
--		},
--		WorldID	=
--		{
--			[1751] = true,
--		},
--}
--RegionCamera.RegionCfg["LSJT_17_4"] =
--{
--		Mode	= FCM_FREE,
--		CamID	= 8596,
--		--CamTransMode = CAMTRANSTYPE_NONE,
--		CamTransMode = CAMTRANSTYPE_EXP,
--		CamTransSpeed = 8,
--		LookOff = 0.5,
--		SceneID	=
--		{
--			[1] = true,
--		},
--		WorldID	=
--		{
--			[1751] = true,
--		},
--}
--RegionCamera.RegionCfg["LSJT_17_5"] =
--{
--		Mode	= FCM_FIX_CAMPOS,
--		CamID	= 8597,
--		--CamTransMode = CAMTRANSTYPE_NONE,
--		CamTransMode = CAMTRANSTYPE_EXP,
--		CamTransSpeed = 8,
--		DisableUICamCtrl = true,
--		LookOff = -0.5,
--		SceneID	=
--		{
--			[1] = true,
--		},
--		WorldID	=
--		{
--			[1751] = true,
--		},
--}
--RegionCamera.RegionCfg["LSJT_18"] =
--{
--		Mode	= FCM_FREE,
--		CamID	= 8518,
--		CamTransMode = CAMTRANSTYPE_CONSTSPEED,
--		CamTransTime = 620,
--		LookOff = -0.5,
--		SceneID	=
--		{
--			[1] = true,
--		},
--		WorldID	=
--		{
--			[1751] = true,
--		},
--}
--RegionCamera.RegionCfg["LSJT_19"] =
--{
--		Mode	= FCM_FREE,
--		CamID	= 8519,
--		CamTransMode = CAMTRANSTYPE_CONSTSPEED,
--		CamTransTime = 620,
--		LookOff = -0.5,
--		SceneID	=
--		{
--			[1] = true,
--		},
--		WorldID	=
--		{
--			[1751] = true,
--		},
--}
--RegionCamera.RegionCfg["LSJT_20"] =
--{
--		Mode	= FCM_FREE,
--		CamID	= 8585,
--		CamTransMode = CAMTRANSTYPE_CONSTSPEED,
--		CamTransTime = 1000,
--		LookOff = 0.5,
--		SceneID	=
--		{
--			[1] = true,
--		},
--		WorldID	=
--		{
--			[1751] = true,
--		},
--}
--RegionCamera.RegionCfg["LSJT_20_1"] =
--{
--		Mode	= FCM_FREE,
--		CamID	= 8876,
--		CamTransMode = CAMTRANSTYPE_NONE,
--		SceneID	=
--		{
--			[1] = true,
--		},
--		WorldID	=
--		{
--			[1751] = true,
--		},
--}
--RegionCamera.RegionCfg["LSJT_20_2"] =
--{
--		Mode	= FCM_FREE,
--		CamID	= 8875,
--		CamTransMode = CAMTRANSTYPE_NONE,
--		SceneID	=
--		{
--			[1] = true,
--		},
--		WorldID	=
--		{
--			[1751] = true,
--		},
--}
--RegionCamera.RegionCfg["LSJT_21"] =
--{
--		Mode	= FCM_FREE,
--		CamID	= 8520,
--		CamTransMode = CAMTRANSTYPE_CONSTSPEED,
--		CamTransTime = 1000,
--		LookOff = -0.5,
--		SceneID	=
--		{
--			[1] = true,
--		},
--		WorldID	=
--		{
--			[1751] = true,
--		},
--}
--RegionCamera.RegionCfg["LSJT_22"] =
--{
--		Mode	= FCM_FREE,
--		CamID	= 8521,
--		CamTransMode = CAMTRANSTYPE_CONSTSPEED,
--		CamTransTime = 1000,
--		LookOff = -1,
--		SceneID	=
--		{
--			[1] = true,
--		},
--		WorldID	=
--		{
--			[1751] = true,
--		},
--}
--
--RegionCamera.RegionCfg["LSJT_23"] =
--{
--		Mode	= FCM_FREE,
--		CamID	= 8522,
--		CamTransMode = CAMTRANSTYPE_CONSTSPEED,
--		CamTransTime = 1000,
--		LookOff = -1,
--		SceneID	=
--		{
--			[1] = true,
--		},
--		WorldID	=
--		{
--			[1751] = true,
--		},
--}
--RegionCamera.RegionCfg["LSJT_24"] =
--{
--		Mode	= FCM_FIX_CAMPOS,
--		CamID	= 8523,
--		DisableUICamCtrl = true,
--		CamTransMode = CAMTRANSTYPE_NONE,
--		LookOff = -1,
--		SceneID	=
--		{
--			[1] = true,
--		},
--		WorldID	=
--		{
--			[1751] = true,
--		},
--}
--RegionCamera.RegionCfg["LSJT_25"] =
--{
--		Mode	= FCM_FIX_CAMPOS,
--		CamID	= 8524,
--		DisableUICamCtrl = true,
--		CamTransMode = CAMTRANSTYPE_EXP,
--		CamTransSpeed = 2.7,
--		LookOff = -1,
--		SceneID	=
--		{
--			[1] = true,
--		},
--		WorldID	=
--		{
--			[1751] = true,
--		},
--}
RegionCamera.RegionCfg["LSJT_26"] =
{
		Mode	= FCM_FIX_PITCHYAW,
		CamID	= 8525,
		DisableUICamCtrl = true,
		CamTransMode = CAMTRANSTYPE_NONE,
		SceneID	=
		{
			[1] = true,
		},
		WorldID	=
		{
			[1751] = true,
		},
}-------
--RegionCamera.RegionCfg["LSJT_27"] =
--{
--		Mode	= FCM_FIX_CAMPOS,
--		CamID	= 8527,
--		DisableUICamCtrl = true,
--		CamTransMode = CAMTRANSTYPE_NONE,
--		LookOff = 0.5,
--		SceneID	=
--		{
--			[1] = true,
--		},
--		WorldID	=
--		{
--			[1751] = true,
--		},
--}
RegionCamera.RegionCfg["DZJT_01"] =
{
		Mode	= FCM_FIX_PITCHYAW,
		CamID	= 20395,
		LookOff_DirH = -1.3,
		FixedLookHei = 44.12, --观察点固定高度
		IgnoreMaxDistRatio = true,
		UseDotaCamera  = true,
		SceneID	=
		{
			[1017] = true,
		},
		WorldID	=
		{
		},
}
--门徒传说专用镜头
RegionCamera.RegionCfg["MTJT_01"] =
{
		Mode	= FCM_FIX_PITCHYAW,
		CamID	= 27388,
		DisableUICamCtrl = true,
		CamTransMode = CAMTRANSTYPE_NONE,
		FixedLookAt = { Pos = {172.6, 102, -155.0}, Dist = -1, }, -- Pos:固定观察点；Dist: 相机和观察点的距离，<0表示不改变

		PlayCG = -- 播CG配置
		{
			id = 400397,	-- CG id
			bLoop = true,	-- CG是否循环
			bSplitRender = true, -- CG和人/npc等分别渲染
		},

		SceneID	=
		{
			[1] = true,
		},
		WorldID	=
		{
			[6797] = true,
		},
}

-----------------------------------------------------------------------------------
-----------------------------Task镜头配置数据------------------------------------
-----------------------------------------------------------------------------------
local CAMVIS_DIR_NOTCHANGE = 10000.0 --朝向不变（默认）
local CAMVIS_DIR_TO_ORIGIN = 20000.0 --回到初始朝向（仅在保持段、结束段生效）

--范例
--[[RegionCamera.TaskCfg[idTask] = --任务id
{
	[SceneStyle.TaskState.ACCEPT(/CANFINISH/FINISHED/FAIL)] = --任务状态
	{
		SceneID	=
		{
			[72] = true, --福州郊外
		},
		WorldID	=
		{
		},

		LookAtPos = {50.0, 20.0, -35.0 }, --观察点（全0表示不变）
		LookDist = 10.0, 	--相机距观察点的距离（<=0表示不变）
		LookDir = {0, 30.0, CAMVIS_DIR_NOTCHANGE }, --yaw水平角度，pitch俯仰角度，roll翻转角度，CAMVIS_DIR_NOTCHANGE表示不变

		StartTrans = --开始平滑参数
		{
			CAMTRANSTYPE_CONSTSPEED, --相机过渡方式
			1000,			--相机过渡时间(毫秒)，仅在匀速、匀加速方式时有意义；对于不是匀加速的方式：用这个时间来计算Speed，Cam
			0,				--相机运动指数，程序默认是5.0，匀加速和指数时有意义；匀加速方式表示初速度，指数方式表示指数
			{60, 56.5, CAMVIS_DIR_NOTCHANGE }, --yaw水平角度，pitch俯仰角度，roll翻转角度，CAMVIS_DIR_NOTCHANGE表示不变
		},

		Hold = --保持时的平滑参数
		{
			CAMTRANSTYPE_CONSTSPEED, --相机平滑方式
			7000,			--相机保持时间(毫秒)，仅在匀速、匀加速方式时有意义；对于不是匀加速的方式：用这个时间来计算Speed，Cam
			0,				--相机运动指数，程序默认是5.0，匀加速和指数时有意义；匀加速方式表示初速度，指数方式表示指数
			{90.6, 20.6, CAMVIS_DIR_NOTCHANGE }, --yaw水平角度，pitch俯仰角度，roll翻转角度，CAMVIS_DIR_NOTCHANGE表示不变
		},

		EndTrans = --结束平滑参数
		{
			CAMTRANSTYPE_NONE, --相机过渡方式
			1000,			--相机过渡时间(毫秒)，仅在匀速、匀加速方式时有意义；对于不是匀加速的方式：用这个时间来计算Speed，Cam
			0,				--相机运动指数，程序默认是5.0，匀加速和指数时有意义；匀加速方式表示初速度，指数方式表示指数
		},
	},

	--... --任务状态
}
]]
--[[
RegionCamera.TaskCfg[5228] = --任务id：回到孤剑村
{
	[SceneStyle.TaskState.ACCEPT] = --任务状态
	{
		SceneID	=
		{
			[72] = true, --福州郊外
		},
		WorldID	=
		{
		},

		LookAtPos = {77.8, 74.9, -31.1 }, --观察点（全0表示不变）
		LookDist = 15.5, 	--相机距观察点的距离（<=0表示不变）

		StartTrans = --开始平滑参数
		{
			CAMTRANSTYPE_CONSTSPEED, --相机过渡方式
			4000,			--相机过渡时间(毫秒)，仅在匀速、匀加速方式时有意义；对于不是匀加速的方式：用这个时间来计算Speed，Cam
			0,				--相机运动指数，程序默认是5.0，匀加速和指数时有意义；匀加速方式表示初速度，指数方式表示指数
			{60, 36.5, 20 }, --yaw水平角度，pitch俯仰角度，roll翻转角度，CAMVIS_DIR_NOTCHANGE表示不变
		},

		Hold = --保持时的平滑参数
		{
			CAMTRANSTYPE_CONSTSPEED, --相机平滑方式
			4000,			--相机保持时间(毫秒)，仅在匀速、匀加速方式时有意义；对于不是匀加速的方式：用这个时间来计算Speed，Cam
			0,				--相机运动指数，程序默认是5.0，匀加速和指数时有意义；匀加速方式表示初速度，指数方式表示指数
			{60, 16.5, CAMVIS_DIR_NOTCHANGE }, --yaw水平角度，pitch俯仰角度，roll翻转角度，CAMVIS_DIR_NOTCHANGE表示不变
		},

		EndTrans = --结束平滑参数
		{
			CAMTRANSTYPE_CONSTSPEED, --相机过渡方式
			3000,			--相机过渡时间(毫秒)，仅在匀速、匀加速方式时有意义；对于不是匀加速的方式：用这个时间来计算Speed，Cam
			2.0,				--相机运动指数，程序默认是5.0，匀加速和指数时有意义；匀加速方式表示初速度，指数方式表示指数
		},
	} ,
}
--]]
RegionCamera.TaskCfg[4589] = --任务id：华山东方初现
{
	[SceneStyle.TaskState.ACCEPT] = --任务状态
	{
		SceneID	=
		{
			[76] = true, --新华山
		},
		WorldID	=
		{
		},

		LookAtPos = {42.6, 87.3, -222.5 }, --观察点（全0表示不变）
		LookDist = 15.5, 	--相机距观察点的距离（<=0表示不变）

		StartTrans = --开始平滑参数
		{
			CAMTRANSTYPE_CONSTSPEED, --相机过渡方式
			4000,			--相机过渡时间(毫秒)，仅在匀速、匀加速方式时有意义；对于不是匀加速的方式：用这个时间来计算Speed，Cam
			0,				--相机运动指数，程序默认是5.0，匀加速和指数时有意义；匀加速方式表示初速度，指数方式表示指数
			{-52.8, 31.1, CAMVIS_DIR_NOTCHANGE }, --yaw水平角度，pitch俯仰角度，roll翻转角度，CAMVIS_DIR_NOTCHANGE表示不变
		},

		Hold = --保持时的平滑参数
		{
			CAMTRANSTYPE_CONSTSPEED, --相机平滑方式
			4000,			--相机保持时间(毫秒)，仅在匀速、匀加速方式时有意义；对于不是匀加速的方式：用这个时间来计算Speed，Cam
			0,				--相机运动指数，程序默认是5.0，匀加速和指数时有意义；匀加速方式表示初速度，指数方式表示指数
			{-52.8, 31.1, CAMVIS_DIR_NOTCHANGE }, --yaw水平角度，pitch俯仰角度，roll翻转角度，CAMVIS_DIR_NOTCHANGE表示不变
		},

		EndTrans = --结束平滑参数
		{
			CAMTRANSTYPE_CONSTSPEED, --相机过渡方式
			3000,			--相机过渡时间(毫秒)，仅在匀速、匀加速方式时有意义；对于不是匀加速的方式：用这个时间来计算Speed，Cam
			2.0,				--相机运动指数，程序默认是5.0，匀加速和指数时有意义；匀加速方式表示初速度，指数方式表示指数
		},
	} ,
}

RegionCamera.TaskCfg[5341] = --人为财死，鸟为食亡
{
	[SceneStyle.TaskState.ACCEPT] = --任务状态
	{
		SceneID	=
		{
			[72] = true, --福州郊外
		},
		WorldID	=
		{
		},

		LookAtPos = {-104.400, 126.108 , 47.372}, --观察点（全0表示不变）
		LookDist = 0, 	--相机距观察点的距离（<=0表示不变）

		StartTrans = --开始平滑参数
		{
			CAMTRANSTYPE_CONSTSPEED, --相机过渡方式
			2000,			--相机过渡时间(毫秒)，仅在匀速、匀加速方式时有意义；对于不是匀加速的方式：用这个时间来计算Speed，Cam
			0,				--相机运动指数，程序默认是5.0，匀加速和指数时有意义；匀加速方式表示初速度，指数方式表示指数
			{-155.7, 9.1, CAMVIS_DIR_NOTCHANGE }, --yaw水平角度，pitch俯仰角度，roll翻转角度，CAMVIS_DIR_NOTCHANGE表示不变
		},

		Hold = --保持时的平滑参数
		{
			CAMTRANSTYPE_CONSTSPEED, --相机平滑方式
			10000,			--相机保持时间(毫秒)，仅在匀速、匀加速方式时有意义；对于不是匀加速的方式：用这个时间来计算Speed，Cam
			0,				--相机运动指数，程序默认是5.0，匀加速和指数时有意义；匀加速方式表示初速度，指数方式表示指数
			{-155.7, 23.8, CAMVIS_DIR_NOTCHANGE }, --yaw水平角度，pitch俯仰角度，roll翻转角度，CAMVIS_DIR_NOTCHANGE表示不变
		},

		EndTrans = --结束平滑参数
		{
			CAMTRANSTYPE_CONSTSPEED, --相机过渡方式
			2000,			--相机过渡时间(毫秒)，仅在匀速、匀加速方式时有意义；对于不是匀加速的方式：用这个时间来计算Speed，Cam
			5.0,				--相机运动指数，程序默认是5.0，匀加速和指数时有意义；匀加速方式表示初速度，指数方式表示指数
		},
	} ,
}

RegionCamera.TaskCfg[3815] = --刘荫被俘
{
	[SceneStyle.TaskState. FINISHED] = --任务状态
	{
		SceneID	=
		{
			[4] = true, --衡山郊外
		},
		WorldID	=
		{
		},

		LookAtPos = {-3.1, 33.8 , 160.2}, --观察点（全0表示不变）
		LookDist = 5.1, 	--相机距观察点的距离（<=0表示不变）

		StartTrans = --开始平滑参数
		{
			CAMTRANSTYPE_CONSTSPEED, --相机过渡方式
			2000,			--相机过渡时间(毫秒)，仅在匀速、匀加速方式时有意义；对于不是匀加速的方式：用这个时间来计算Speed，Cam
			0,				--相机运动指数，程序默认是5.0，匀加速和指数时有意义；匀加速方式表示初速度，指数方式表示指数
			{133.5, -12, CAMVIS_DIR_NOTCHANGE }, --yaw水平角度，pitch俯仰角度，roll翻转角度，CAMVIS_DIR_NOTCHANGE表示不变
		},

		Hold = --保持时的平滑参数
		{
			CAMTRANSTYPE_CONSTSPEED, --相机平滑方式
			3000,			--相机保持时间(毫秒)，仅在匀速、匀加速方式时有意义；对于不是匀加速的方式：用这个时间来计算Speed，Cam
			0,				--相机运动指数，程序默认是5.0，匀加速和指数时有意义；匀加速方式表示初速度，指数方式表示指数
			{140, -8.5, CAMVIS_DIR_NOTCHANGE }, --yaw水平角度，pitch俯仰角度，roll翻转角度，CAMVIS_DIR_NOTCHANGE表示不变
		},

		EndTrans = --结束平滑参数
		{
			CAMTRANSTYPE_CONSTSPEED, --相机过渡方式
			1000,			--相机过渡时间(毫秒)，仅在匀速、匀加速方式时有意义；对于不是匀加速的方式：用这个时间来计算Speed，Cam
			5.0,				--相机运动指数，程序默认是5.0，匀加速和指数时有意义；匀加速方式表示初速度，指数方式表示指数
		},
	} ,
}

RegionCamera.TaskCfg[5843] = --小师妹遇害
{
	[SceneStyle.TaskState. CANFINISH] = --任务状态
	{
		SceneID	=
		{
			[67] = true, --衡山城
		},
		WorldID	=
		{
		},

		LookAtPos = {-1.2, 84.6 , -14.8}, --观察点（全0表示不变）
		LookDist = 9.9, 	--相机距观察点的距离（<=0表示不变）

		StartTrans = --开始平滑参数
		{
			CAMTRANSTYPE_CONSTSPEED, --相机过渡方式
			2000,			--相机过渡时间(毫秒)，仅在匀速、匀加速方式时有意义；对于不是匀加速的方式：用这个时间来计算Speed，Cam
			0,				--相机运动指数，程序默认是5.0，匀加速和指数时有意义；匀加速方式表示初速度，指数方式表示指数
			{40.3, 13.2, CAMVIS_DIR_NOTCHANGE }, --yaw水平角度，pitch俯仰角度，roll翻转角度，CAMVIS_DIR_NOTCHANGE表示不变
		},

		Hold = --保持时的平滑参数
		{
			CAMTRANSTYPE_CONSTSPEED, --相机平滑方式
			5000,			--相机保持时间(毫秒)，仅在匀速、匀加速方式时有意义；对于不是匀加速的方式：用这个时间来计算Speed，Cam
			0,				--相机运动指数，程序默认是5.0，匀加速和指数时有意义；匀加速方式表示初速度，指数方式表示指数
			{29.2, 22.6, CAMVIS_DIR_NOTCHANGE }, --yaw水平角度，pitch俯仰角度，roll翻转角度，CAMVIS_DIR_NOTCHANGE表示不变
		},

		EndTrans = --结束平滑参数
		{
			CAMTRANSTYPE_CONSTSPEED, --相机过渡方式
			2000,			--相机过渡时间(毫秒)，仅在匀速、匀加速方式时有意义；对于不是匀加速的方式：用这个时间来计算Speed，Cam
			5.0,				--相机运动指数，程序默认是5.0，匀加速和指数时有意义；匀加速方式表示初速度，指数方式表示指数
		},
	} ,
}

RegionCamera.TaskCfg[5214] = --人挡杀人
{
	[SceneStyle.TaskState.ACCEPT] = --任务状态
	{
		SceneID	=
		{
			[68] = true, --福州城
		},
		WorldID	=
		{
		},

		LookAtPos = {0, 0 , 0}, --观察点（全0表示不变）
		LookDist = 0, 	--相机距观察点的距离（<=0表示不变）

		StartTrans = --开始平滑参数
		{
			CAMTRANSTYPE_CONSTSPEED, --相机过渡方式
			1000,			--相机过渡时间(毫秒)，仅在匀速、匀加速方式时有意义；对于不是匀加速的方式：用这个时间来计算Speed，Cam
			0,				--相机运动指数，程序默认是5.0，匀加速和指数时有意义；匀加速方式表示初速度，指数方式表示指数
			{69.6, -6.1, CAMVIS_DIR_NOTCHANGE }, --yaw水平角度，pitch俯仰角度，roll翻转角度，CAMVIS_DIR_NOTCHANGE表示不变
		},

		Hold = --保持时的平滑参数
		{
			CAMTRANSTYPE_CONSTSPEED, --相机平滑方式
			1000,			--相机保持时间(毫秒)，仅在匀速、匀加速方式时有意义；对于不是匀加速的方式：用这个时间来计算Speed，Cam
			0,				--相机运动指数，程序默认是5.0，匀加速和指数时有意义；匀加速方式表示初速度，指数方式表示指数
			{69.6, -6.1, CAMVIS_DIR_NOTCHANGE }, --yaw水平角度，pitch俯仰角度，roll翻转角度，CAMVIS_DIR_NOTCHANGE表示不变
		},

		EndTrans = --结束平滑参数
		{
			CAMTRANSTYPE_CONSTSPEED, --相机过渡方式
			1000,			--相机过渡时间(毫秒)，仅在匀速、匀加速方式时有意义；对于不是匀加速的方式：用这个时间来计算Speed，Cam
			5.0,				--相机运动指数，程序默认是5.0，匀加速和指数时有意义；匀加速方式表示初速度，指数方式表示指数
		},
	} ,
}

RegionCamera.TaskCfg[5211] = --任务id：走为上计
{
	[SceneStyle.TaskState.ACCEPT] = --任务状态
	{
		SceneID	=
		{
			[68] = true, --福州郊外
		},
		WorldID	=
		{
		},

		LookAtPos = {-62.6, 62.6, -32.9 }, --观察点（全0表示不变）
		LookDist = 5.5, 	--相机距观察点的距离（<=0表示不变）

		StartTrans = --开始平滑参数
		{
			CAMTRANSTYPE_CONSTSPEED, --相机过渡方式
			1000,			--相机过渡时间(毫秒)，仅在匀速、匀加速方式时有意义；对于不是匀加速的方式：用这个时间来计算Speed，Cam
			0,				--相机运动指数，程序默认是5.0，匀加速和指数时有意义；匀加速方式表示初速度，指数方式表示指数
			{-74.7, 11.1, CAMVIS_DIR_NOTCHANGE }, --yaw水平角度，pitch俯仰角度，roll翻转角度，CAMVIS_DIR_NOTCHANGE表示不变
		},

		Hold = --保持时的平滑参数
		{
			CAMTRANSTYPE_CONSTSPEED, --相机平滑方式
			2000,			--相机保持时间(毫秒)，仅在匀速、匀加速方式时有意义；对于不是匀加速的方式：用这个时间来计算Speed，Cam
			0,				--相机运动指数，程序默认是5.0，匀加速和指数时有意义；匀加速方式表示初速度，指数方式表示指数
			{-74.7, 11.1, CAMVIS_DIR_NOTCHANGE }, --yaw水平角度，pitch俯仰角度，roll翻转角度，CAMVIS_DIR_NOTCHANGE表示不变
		},

		EndTrans = --结束平滑参数
		{
			CAMTRANSTYPE_CONSTSPEED, --相机过渡方式
			1000,			--相机过渡时间(毫秒)，仅在匀速、匀加速方式时有意义；对于不是匀加速的方式：用这个时间来计算Speed，Cam
			1.0,				--相机运动指数，程序默认是5.0，匀加速和指数时有意义；匀加速方式表示初速度，指数方式表示指数
		},
	} ,
}


RegionCamera.TaskCfg[5340] = --任务id：众说纷纭
{
	[SceneStyle.TaskState.ACCEPT] = --任务状态
	{
		SceneID	=
		{
			[72] = true, --福州郊外
		},
		WorldID	=
		{
		},

		LookAtPos = {-206.6, 100.3, -117.9 }, --观察点（全0表示不变）
		LookDist = 33, 	--相机距观察点的距离（<=0表示不变）

		StartTrans = --开始平滑参数
		{
			CAMTRANSTYPE_CONSTSPEED, --相机过渡方式
			2000,			--相机过渡时间(毫秒)，仅在匀速、匀加速方式时有意义；对于不是匀加速的方式：用这个时间来计算Speed，Cam
			0,				--相机运动指数，程序默认是5.0，匀加速和指数时有意义；匀加速方式表示初速度，指数方式表示指数
			{86.5, 24.6, CAMVIS_DIR_NOTCHANGE }, --yaw水平角度，pitch俯仰角度，roll翻转角度，CAMVIS_DIR_NOTCHANGE表示不变
		},

		Hold = --保持时的平滑参数
		{
			CAMTRANSTYPE_CONSTSPEED, --相机平滑方式
			3000,			--相机保持时间(毫秒)，仅在匀速、匀加速方式时有意义；对于不是匀加速的方式：用这个时间来计算Speed，Cam
			0,				--相机运动指数，程序默认是5.0，匀加速和指数时有意义；匀加速方式表示初速度，指数方式表示指数
			{88.2, 24.2, CAMVIS_DIR_NOTCHANGE }, --yaw水平角度，pitch俯仰角度，roll翻转角度，CAMVIS_DIR_NOTCHANGE表示不变
		},

		EndTrans = --结束平滑参数
		{
			CAMTRANSTYPE_CONSTSPEED, --相机过渡方式
			2000,			--相机过渡时间(毫秒)，仅在匀速、匀加速方式时有意义；对于不是匀加速的方式：用这个时间来计算Speed，Cam
			1.0,				--相机运动指数，程序默认是5.0，匀加速和指数时有意义；匀加速方式表示初速度，指数方式表示指数
		},
	} ,
}

RegionCamera.TaskCfg[5572] = --任务id：立约
{
	[SceneStyle.TaskState. CANFINISH] = --任务状态
	{
		SceneID	=
		{
			[67] = true, --衡山城
		},
		WorldID	=
		{
		},

		LookAtPos = {71.4, 109.6, 123.5 }, --观察点（全0表示不变）
		LookDist = 0, 	--相机距观察点的距离（<=0表示不变）

		StartTrans = --开始平滑参数
		{
			CAMTRANSTYPE_CONSTSPEED, --相机过渡方式
			2000,			--相机过渡时间(毫秒)，仅在匀速、匀加速方式时有意义；对于不是匀加速的方式：用这个时间来计算Speed，Cam
			0,				--相机运动指数，程序默认是5.0，匀加速和指数时有意义；匀加速方式表示初速度，指数方式表示指数
			{-119.2, 1.3, CAMVIS_DIR_NOTCHANGE }, --yaw水平角度，pitch俯仰角度，roll翻转角度，CAMVIS_DIR_NOTCHANGE表示不变
		},

		Hold = --保持时的平滑参数
		{
			CAMTRANSTYPE_CONSTSPEED, --相机平滑方式
			5000,			--相机保持时间(毫秒)，仅在匀速、匀加速方式时有意义；对于不是匀加速的方式：用这个时间来计算Speed，Cam
			0,				--相机运动指数，程序默认是5.0，匀加速和指数时有意义；匀加速方式表示初速度，指数方式表示指数
			{-119.2, 1.3, CAMVIS_DIR_NOTCHANGE }, --yaw水平角度，pitch俯仰角度，roll翻转角度，CAMVIS_DIR_NOTCHANGE表示不变
		},

		EndTrans = --结束平滑参数
		{
			CAMTRANSTYPE_CONSTSPEED, --相机过渡方式
			2000,			--相机过渡时间(毫秒)，仅在匀速、匀加速方式时有意义；对于不是匀加速的方式：用这个时间来计算Speed，Cam
			5.0,				--相机运动指数，程序默认是5.0，匀加速和指数时有意义；匀加速方式表示初速度，指数方式表示指数
		},
	} ,
}
RegionCamera.TaskCfg[9198] = --任务id：深层领悟
{
	[SceneStyle.TaskState.ACCEPT] = --任务状态
	{
		SceneID	=
		{
			[68] = true, --福州城
		},
		WorldID	=
		{
		},

		LookAtPos = {23.7, 56.9, -71.1 }, --观察点（全0表示不变）
		LookDist = 0, 	--相机距观察点的距离（<=0表示不变）

		StartTrans = --开始平滑参数
		{
			CAMTRANSTYPE_CONSTSPEED, --相机过渡方式
			2000,			--相机过渡时间(毫秒)，仅在匀速、匀加速方式时有意义；对于不是匀加速的方式：用这个时间来计算Speed，Cam
			0,				--相机运动指数，程序默认是5.0，匀加速和指数时有意义；匀加速方式表示初速度，指数方式表示指数
			{-130.4, 23.4, CAMVIS_DIR_NOTCHANGE }, --yaw水平角度，pitch俯仰角度，roll翻转角度，CAMVIS_DIR_NOTCHANGE表示不变
		},

		Hold = --保持时的平滑参数
		{
			CAMTRANSTYPE_CONSTSPEED, --相机平滑方式
			5000,			--相机保持时间(毫秒)，仅在匀速、匀加速方式时有意义；对于不是匀加速的方式：用这个时间来计算Speed，Cam
			0,				--相机运动指数，程序默认是5.0，匀加速和指数时有意义；匀加速方式表示初速度，指数方式表示指数
			{-119.2, 1.3, CAMVIS_DIR_NOTCHANGE }, --yaw水平角度，pitch俯仰角度，roll翻转角度，CAMVIS_DIR_NOTCHANGE表示不变
		},

		EndTrans = --结束平滑参数
		{
			CAMTRANSTYPE_CONSTSPEED, --相机过渡方式
			2000,			--相机过渡时间(毫秒)，仅在匀速、匀加速方式时有意义；对于不是匀加速的方式：用这个时间来计算Speed，Cam
			5.0,				--相机运动指数，程序默认是5.0，匀加速和指数时有意义；匀加速方式表示初速度，指数方式表示指数
		},
	} ,
}
-----------------------------------------------------------------------------------
-----------------------------Board镜头配置数据------------------------------------
-----------------------------------------------------------------------------------
--范例
--[[RegionCamera.BoardCfg[idWorld] = --副本id
{
	[1017] = --场景id
	{
		[11] = --版面id
		{
			[BOARDSTATE_PREPARE/BOARDSTATE_START/BOARDSTATE_CLOSE] = --版面状态
			{
				LookAtPos = {50.0, 20.0, -35.0 }, --观察点（全0表示不变）
				LookDist = 10.0, 	--相机距观察点的距离（<=0表示不变）
				LookDir = {0, 30.0, CAMVIS_DIR_NOTCHANGE }, --yaw水平角度，pitch俯仰角度，roll翻转角度，CAMVIS_DIR_NOTCHANGE表示不变

				StartTrans = --开始平滑参数
				{
					CAMTRANSTYPE_CONSTSPEED, --相机过渡方式
					1000,			--相机过渡时间(毫秒)，仅在匀速、匀加速方式时有意义；对于不是匀加速的方式：用这个时间来计算Speed，Cam
					0,				--相机运动指数，程序默认是5.0，匀加速和指数时有意义；匀加速方式表示初速度，指数方式表示指数
					{60, 56.5, CAMVIS_DIR_NOTCHANGE }, --yaw水平角度，pitch俯仰角度，roll翻转角度，CAMVIS_DIR_NOTCHANGE表示不变
				},

				Hold = --保持时的平滑参数
				{
					CAMTRANSTYPE_CONSTSPEED, --相机平滑方式
					5000,			--相机保持时间(毫秒)，仅在匀速、匀加速方式时有意义；对于不是匀加速的方式：用这个时间来计算Speed，Cam
					0,				--相机运动指数，程序默认是5.0，匀加速和指数时有意义；匀加速方式表示初速度，指数方式表示指数
					{60, 6.5, CAMVIS_DIR_NOTCHANGE }, --yaw水平角度，pitch俯仰角度，roll翻转角度，CAMVIS_DIR_NOTCHANGE表示不变
				},

				EndTrans = --结束平滑参数
				{
					CAMTRANSTYPE_EXP, --相机过渡方式
					1000,			--相机过渡时间(毫秒)，仅在匀速、匀加速方式时有意义；对于不是匀加速的方式：用这个时间来计算Speed，Cam
					5.0,				--相机运动指数，程序默认是5.0，匀加速和指数时有意义；匀加速方式表示初速度，指数方式表示指数
				},
			},

			--... --版面状态
		},

		--... --版面id
	},
}
]]

RegionCamera.BoardCfg[10000] = --副本id
{
	[1017] = --场景id
	{
		[11] = --版面id
		{
			[BOARDSTATE_START] = --版面状态
			{
				LookAtPos = {50.0, 20.0, -35.0 }, --观察点（全0表示不变）
				LookDist = 10.0, 	--相机距观察点的距离（<=0表示不变）
				LookDir = {0, 30.0, CAMVIS_DIR_NOTCHANGE }, --yaw水平角度，pitch俯仰角度，roll翻转角度，CAMVIS_DIR_NOTCHANGE表示不变

				StartTrans = --开始平滑参数
				{
					CAMTRANSTYPE_CONSTSPEED, --相机过渡方式
					1000,			--相机过渡时间(毫秒)，仅在匀速、匀加速方式时有意义；对于不是匀加速的方式：用这个时间来计算Speed，Cam
					0,				--相机运动指数，程序默认是5.0，匀加速和指数时有意义；匀加速方式表示初速度，指数方式表示指数
					{60, 56.5, CAMVIS_DIR_NOTCHANGE }, --yaw水平角度，pitch俯仰角度，roll翻转角度，CAMVIS_DIR_NOTCHANGE表示不变
				},

				Hold = --保持时的平滑参数
				{
					CAMTRANSTYPE_CONSTSPEED, --相机平滑方式
					5000,			--相机保持时间(毫秒)，仅在匀速、匀加速方式时有意义；对于不是匀加速的方式：用这个时间来计算Speed，Cam
					0,				--相机运动指数，程序默认是5.0，匀加速和指数时有意义；匀加速方式表示初速度，指数方式表示指数
					{60, 6.5, CAMVIS_DIR_NOTCHANGE }, --yaw水平角度，pitch俯仰角度，roll翻转角度，CAMVIS_DIR_NOTCHANGE表示不变
				},

				EndTrans = --结束平滑参数
				{
					CAMTRANSTYPE_CONSTSPEED, --相机过渡方式
					1000,			--相机过渡时间(毫秒)，仅在匀速、匀加速方式时有意义；对于不是匀加速的方式：用这个时间来计算Speed，Cam
					0,				--相机运动指数，程序默认是5.0，匀加速和指数时有意义；匀加速方式表示初速度，指数方式：表示指数
				},
			},

			--... --版面状态
		},

		--... --版面id
	},
}


RegionCamera.BoardCfg[2823] = --副本id
{
	[1256] = --场景id
	{
		[7] = --版面id
		{
			[BOARDSTATE_PREPARE] = --版面状态
			{
				LookAtPos = {85.3, 81.2, 13}, --观察点（全0表示不变）
				LookDist = 0, 	--相机距观察点的距离（<=0表示不变）
				LookDir = {34.4, 30.0, CAMVIS_DIR_NOTCHANGE }, --yaw水平角度，pitch俯仰角度，roll翻转角度，CAMVIS_DIR_NOTCHANGE表示不变

				StartTrans = --开始平滑参数
				{
					CAMTRANSTYPE_CONSTSPEED, --相机过渡方式
					1000,			--相机过渡时间(毫秒)，仅在匀速、匀加速方式时有意义；对于不是匀加速的方式：用这个时间来计算Speed，Cam
					0,				--相机运动指数，程序默认是5.0，匀加速和指数时有意义；匀加速方式表示初速度，指数方式表示指数
					{34.4, 30.0, CAMVIS_DIR_NOTCHANGE }, --yaw水平角度，pitch俯仰角度，roll翻转角度，CAMVIS_DIR_NOTCHANGE表示不变
				},

				Hold = --保持时的平滑参数
				{
					CAMTRANSTYPE_CONSTSPEED, --相机平滑方式
					10000,			--相机保持时间(毫秒)，仅在匀速、匀加速方式时有意义；对于不是匀加速的方式：用这个时间来计算Speed，Cam
					0,				--相机运动指数，程序默认是5.0，匀加速和指数时有意义；匀加速方式表示初速度，指数方式表示指数
					{34.4, 30.0, CAMVIS_DIR_NOTCHANGE }, --yaw水平角度，pitch俯仰角度，roll翻转角度，CAMVIS_DIR_NOTCHANGE表示不变
				},

				EndTrans = --结束平滑参数
				{
					CAMTRANSTYPE_CONSTSPEED, --相机过渡方式
					1000,			--相机过渡时间(毫秒)，仅在匀速、匀加速方式时有意义；对于不是匀加速的方式：用这个时间来计算Speed，Cam
					0,				--相机运动指数，程序默认是5.0，匀加速和指数时有意义；匀加速方式表示初速度，指数方式：表示指数
				},
			},

			--... --版面状态
		},
		[7] = --版面id
		{
			[BOARDSTATE_PREPARE] = --版面状态
			{
				LookAtPos = {86.8, 80.7, 11.5}, --观察点（全0表示不变）
				LookDist = 0, 	--相机距观察点的距离（<=0表示不变）
				LookDir = {-122, 17.6, CAMVIS_DIR_NOTCHANGE }, --yaw水平角度，pitch俯仰角度，roll翻转角度，CAMVIS_DIR_NOTCHANGE表示不变

				StartTrans = --开始平滑参数
				{
					CAMTRANSTYPE_CONSTSPEED, --相机过渡方式
					1,			--相机过渡时间(毫秒)，仅在匀速、匀加速方式时有意义；对于不是匀加速的方式：用这个时间来计算Speed，Cam
					0,				--相机运动指数，程序默认是5.0，匀加速和指数时有意义；匀加速方式表示初速度，指数方式表示指数
					{-122, 17.6, CAMVIS_DIR_NOTCHANGE }, --yaw水平角度，pitch俯仰角度，roll翻转角度，CAMVIS_DIR_NOTCHANGE表示不变
				},

				Hold = --保持时的平滑参数
				{
					CAMTRANSTYPE_CONSTSPEED, --相机平滑方式
					1,			--相机保持时间(毫秒)，仅在匀速、匀加速方式时有意义；对于不是匀加速的方式：用这个时间来计算Speed，Cam
					0,				--相机运动指数，程序默认是5.0，匀加速和指数时有意义；匀加速方式表示初速度，指数方式表示指数
					{-122, 17.6,CAMVIS_DIR_NOTCHANGE }, --yaw水平角度，pitch俯仰角度，roll翻转角度，CAMVIS_DIR_NOTCHANGE表示不变
				},

				EndTrans = --结束平滑参数
				{
					CAMTRANSTYPE_CONSTSPEED, --相机过渡方式
					1,			--相机过渡时间(毫秒)，仅在匀速、匀加速方式时有意义；对于不是匀加速的方式：用这个时间来计算Speed，Cam
					0,				--相机运动指数，程序默认是5.0，匀加速和指数时有意义；匀加速方式表示初速度，指数方式：表示指数
				},
			},

			--... --版面状态
		},

		--... --版面id
	},
}


RegionCamera.BoardCfg[2599] = --副本id
{
	[1245] = --场景id
	{
		[1] = --版面id
		{
			[BOARDSTATE_START] = --版面状态
			{
				LookAtPos = {-0.675, 233.814,19.981}, --观察点（全0表示不变）
				LookDist = 0, 	--相机距观察点的距离（<=0表示不变）
				LookDir = {81.1, 14.3, CAMVIS_DIR_NOTCHANGE }, --yaw水平角度，pitch俯仰角度，roll翻转角度，CAMVIS_DIR_NOTCHANGE表示不变

				StartTrans = --开始平滑参数
				{
					CAMTRANSTYPE_CONSTSPEED, --相机过渡方式
					1000,			--相机过渡时间(毫秒)，仅在匀速、匀加速方式时有意义；对于不是匀加速的方式：用这个时间来计算Speed，Cam
					0,				--相机运动指数，程序默认是5.0，匀加速和指数时有意义；匀加速方式表示初速度，指数方式表示指数
					{81.1, 14.3, CAMVIS_DIR_NOTCHANGE }, --yaw水平角度，pitch俯仰角度，roll翻转角度，CAMVIS_DIR_NOTCHANGE表示不变
				},

				Hold = --保持时的平滑参数
				{
					CAMTRANSTYPE_CONSTSPEED, --相机平滑方式
					10000,			--相机保持时间(毫秒)，仅在匀速、匀加速方式时有意义；对于不是匀加速的方式：用这个时间来计算Speed，Cam
					0,				--相机运动指数，程序默认是5.0，匀加速和指数时有意义；匀加速方式表示初速度，指数方式表示指数
					{81.1, 14.3, CAMVIS_DIR_NOTCHANGE }, --yaw水平角度，pitch俯仰角度，roll翻转角度，CAMVIS_DIR_NOTCHANGE表示不变
				},

				EndTrans = --结束平滑参数
				{
					CAMTRANSTYPE_CONSTSPEED, --相机过渡方式
					1000,			--相机过渡时间(毫秒)，仅在匀速、匀加速方式时有意义；对于不是匀加速的方式：用这个时间来计算Speed，Cam
					0,				--相机运动指数，程序默认是5.0，匀加速和指数时有意义；匀加速方式表示初速度，指数方式：表示指数
				},
			},

			--... --版面状态
		},
		--... --版面id
	},
}

RegionCamera.BoardCfg[2908] = --副本id
{
	[1270] = --场景id
	{
		[16] = --版面id
		{
			[BOARDSTATE_START] = --版面状态
			{
				LookAtPos = {1.818, 35.325,-86.514}, --观察点（全0表示不变）
				LookDist = 0, 	--相机距观察点的距离（<=0表示不变）
				LookDir = {8, 17.7, CAMVIS_DIR_NOTCHANGE }, --yaw水平角度，pitch俯仰角度，roll翻转角度，CAMVIS_DIR_NOTCHANGE表示不变

				StartTrans = --开始平滑参数
				{
					CAMTRANSTYPE_CONSTSPEED, --相机过渡方式
					2000,			--相机过渡时间(毫秒)，仅在匀速、匀加速方式时有意义；对于不是匀加速的方式：用这个时间来计算Speed，Cam
					0,				--相机运动指数，程序默认是5.0，匀加速和指数时有意义；匀加速方式表示初速度，指数方式表示指数
					{8, 17.7,CAMVIS_DIR_NOTCHANGE }, --yaw水平角度，pitch俯仰角度，roll翻转角度，CAMVIS_DIR_NOTCHANGE表示不变
				},

				Hold = --保持时的平滑参数
				{
					CAMTRANSTYPE_CONSTSPEED, --相机平滑方式
					7000,			--相机保持时间(毫秒)，仅在匀速、匀加速方式时有意义；对于不是匀加速的方式：用这个时间来计算Speed，Cam
					0,				--相机运动指数，程序默认是5.0，匀加速和指数时有意义；匀加速方式表示初速度，指数方式表示指数
					{8, 17.7, CAMVIS_DIR_NOTCHANGE }, --yaw水平角度，pitch俯仰角度，roll翻转角度，CAMVIS_DIR_NOTCHANGE表示不变
				},

				EndTrans = --结束平滑参数
				{
					CAMTRANSTYPE_CONSTSPEED, --相机过渡方式
					1000,			--相机过渡时间(毫秒)，仅在匀速、匀加速方式时有意义；对于不是匀加速的方式：用这个时间来计算Speed，Cam
					0,				--相机运动指数，程序默认是5.0，匀加速和指数时有意义；匀加速方式表示初速度，指数方式：表示指数
				},
			},

			--... --版面状态
		},
		[6] = --版面id
		{
			[BOARDSTATE_START] = --版面状态
			{
				LookAtPos = {1.818, 35.325,-86.514}, --观察点（全0表示不变）
				LookDist = 0, 	--相机距观察点的距离（<=0表示不变）
				LookDir = {-1.7, -1.2, CAMVIS_DIR_NOTCHANGE }, --yaw水平角度，pitch俯仰角度，roll翻转角度，CAMVIS_DIR_NOTCHANGE表示不变

				StartTrans = --开始平滑参数
				{
					CAMTRANSTYPE_CONSTSPEED, --相机过渡方式
					2000,			--相机过渡时间(毫秒)，仅在匀速、匀加速方式时有意义；对于不是匀加速的方式：用这个时间来计算Speed，Cam
					0,				--相机运动指数，程序默认是5.0，匀加速和指数时有意义；匀加速方式表示初速度，指数方式表示指数
					{-1.7, -1.2, CAMVIS_DIR_NOTCHANGE }, --yaw水平角度，pitch俯仰角度，roll翻转角度，CAMVIS_DIR_NOTCHANGE表示不变
				},

				Hold = --保持时的平滑参数
				{
					CAMTRANSTYPE_CONSTSPEED, --相机平滑方式
					3000,			--相机保持时间(毫秒)，仅在匀速、匀加速方式时有意义；对于不是匀加速的方式：用这个时间来计算Speed，Cam
					0,				--相机运动指数，程序默认是5.0，匀加速和指数时有意义；匀加速方式表示初速度，指数方式表示指数
					{-1.7, -1.2, CAMVIS_DIR_NOTCHANGE }, --yaw水平角度，pitch俯仰角度，roll翻转角度，CAMVIS_DIR_NOTCHANGE表示不变
				},

				EndTrans = --结束平滑参数
				{
					CAMTRANSTYPE_CONSTSPEED, --相机过渡方式
					1000,			--相机过渡时间(毫秒)，仅在匀速、匀加速方式时有意义；对于不是匀加速的方式：用这个时间来计算Speed，Cam
					0,				--相机运动指数，程序默认是5.0，匀加速和指数时有意义；匀加速方式表示初速度，指数方式：表示指数
				},
			},

			--... --版面状态
		},
		--... --版面id

	},
}
