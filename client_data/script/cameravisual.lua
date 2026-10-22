--[[#tag push auto]]
-------------------------------------------------------------------------------
-----	特效镜头(CameraVisual)脚本
-----	Creator: Guo Jie, 2009.10.27
-------------------------------------------------------------------------------

-- 镜头类型
CAMVIS_TYPE_NORMAL 	 = 1		--一般特效镜头（比如三国无双摄像机模式右键）
CAMVIS_TYPE_EVENT 	 = 2		--GameEvent.lua里定义的游戏事件（一般不带参数）
CAMVIS_TYPE_SKILL	 = 3		--技能Perform
CAMVIS_TYPE_OBJTALK  = 4		--与物体（NPC，矿，玩家等）对话特效镜头

CAMVIS_TYPE_EMOTE 	 = 5 		--表情
CAMVIS_TYPE_MODEL 	 = 6 		--模型使用
CAMVIS_TYPE_TASKTALK = 7		--任务对话

CamVisual  = {}

CamVisNormal = {}
CamVisEvent = {}
CamVisSkill = {}
CamVisObjTalk = {}
CamVisTaskTalk = {}
CamVisEmote = {}

-------------------------------------------------------------------------------
function CopyTable(src)
	if type(src) ~= --[[!AUTO_1]]"table" then return src end
	local inst = {}
	for i,v in pairs(src) do
		if i ~= --[[!AUTO_2]]"__index" then       --关键
			inst[i] = CopyTable(v)
		end
	end
	setmetatable(inst,src)
	src.__index = src
	return inst
end
-------------------------------------------------------------------------------

local CAMVIS_PLAYERMASK 	= 112200000

local CAMVIS_NOCHANGEDIST	= 1000
local CAMVIS_NOCHANGEYAW	= 1001
local CAMVIS_NOCHANGEPITCH	= 1002

local index_2_name =
{
	---------- 输入的参数 ----------

	--"type",			--镜头类型

	--"id",				--id，根据type对应不同的意义：
							--type为CAMVIS_TYPE_EVENT时表示：event id
							--type为CAMVIS_TYPE_EMOTE时表示：表情id
							--type为CAMVIS_TYPE_OBJTALK时表示：物体的模板ID（NPC，矿等填模板ID，玩家填CAMVIS_PLAYERMASK）
							--type为CAMVIS_TYPE_SKILL时表示：Perform的ID

	---------- 返回的参数 ----------

    --[[!AUTO_3]]"Dist2Host", 		--摄像机与玩家的距离（填CAMVIS_NOCHANGEDIST表示不改变当前距离）
	--[[!AUTO_4]]"DeltaYaw2Host",    --摄像机在玩家的那个方位（即水平角度，在玩家正前方为0，背对玩家为180，逆时针旋转。填CAMVIS_NOCHANGEYAW表示不改变当前Yaw）
	--[[!AUTO_5]]"Pitch",       		--摄像机的俯仰角度（水平为0，向下为90。填CAMVIS_NOCHANGEPITCH表示不改变当前距离）
	--[[!AUTO_6]]"duration",			--镜头持续时间：> 0表示镜头持续这么长时间，-1表示无限(用户自行取消)，-2表示按动作完成，-3表示按程序内填写时间
	--[[!AUTO_7]]"bCuttingStart",	--开始的切换模式。true：从当前镜头直接切换到该镜头; false：从当前镜头平滑过渡过来
	--[[!AUTO_8]]"SmoothSpeedStart"
, --开始时平滑的速度
	--[[!AUTO_9]]"bCuttingEnd",		--结束的切换模式。true：直接切换到普通镜头; false：平滑过渡到普通镜头

	--[[!AUTO_10]]"SmoothSpeedEnd", 	--结束时平滑的速度
}

function CamVisual:GetCamData(cam_type, id)

	local camtable = {}

	if cam_type == CAMVIS_TYPE_NORMAL then
		camtable = CamVisNormal
	elseif cam_type == CAMVIS_TYPE_EVENT then
		camtable = CamVisEvent
	elseif cam_type == CAMVIS_TYPE_SKILL then
		camtable = CamVisSkill
	elseif cam_type == CAMVIS_TYPE_OBJTALK then
		camtable = CamVisObjTalk
	elseif cam_type == CAMVIS_TYPE_TASKTALK then
		camtable = CamVisTaskTalk
	elseif cam_type == CAMVIS_TYPE_EMOTE then
		camtable = CamVisEmote
	else
		return
	end

	LogPrint(string.format(--[[!AUTO_11]]"CamVisual:GetCamData: Type: %d, ID: %d\n", cam_type, id))

	if camtable == nil then
		return
	end

	local params = {}
	local num = #index_2_name
    for i = 1,num do
        local key = index_2_name[i]

		if camtable[id] == nil or camtable[id][key] == nil then
			params[key] = camtable.default[key]
		else
        	params[key] = camtable[id][key]
        end
    end
	return params
end


-------***************************************************************-------
----------------  普通特效镜头（比如三国无双摄像机模式右键） -----------------
-------***************************************************************-------

--------默认设置，以后各定义中与默认相同的设置不用单独写----------
CamVisNormal["default"] =
{
    Dist2Host		= CAMVIS_NOCHANGEDIST,	--摄像机与玩家的距离（填CAMVIS_NOCHANGEDIST表示不改变当前距离）
	DeltaYaw2Host	= 180.0,	--摄像机在玩家的那个方位（即水平角度，在玩家正前方为0，背对玩家为180，逆时针旋转。填CAMVIS_NOCHANGEYAW表示不改变当前Yaw）
	Pitch			= 20.0,		--摄像机的俯仰角度（水平为0，向下为90。填CAMVIS_NOCHANGEPITCH表示不改变当前Pitch）
	duration		= -1,		--镜头持续时间：> 0表示镜头持续这么长时间，-1表示无限(用户自行取消)，-2表示按动作完成，-3表示按程序内填写时间
	bCuttingStart	= false,	--开始的切换模式。true：从当前镜头直接切换到该镜头; false：从当前镜头平滑过渡过来
	SmoothSpeedStart= 6.0, 		--开始时平滑的速度
	bCuttingEnd		= false,	--结束的切换模式。true：直接切换到普通镜头; false：平滑过渡到普通镜头

	SmoothSpeedEnd	= 6.0, 		--结束时平滑的速度
}

-------***************************************************************-------
----------------------------  游戏事件特效镜头 ------------------------------
-------***************************************************************-------

-------- 用于拷贝的默认对话配置 ----------
CamVisEvent["default"] = {}		--没有默认配置。只有定义了才会调用

CamVisEvent["DefaultEvent"] =
{
    Dist2Host		= 8.0, 		--摄像机与玩家的距离（填CAMVIS_NOCHANGEDIST表示不改变当前距离）
	DeltaYaw2Host	= 0.0,		--摄像机在玩家的那个方位（即水平角度，在玩家正前方为0，背对玩家为180，逆时针旋转。填CAMVIS_NOCHANGEYAW表示不改变当前Yaw）
	Pitch			= 25.0,		--摄像机的俯仰角度（水平为0，向下为90。填CAMVIS_NOCHANGEPITCH表示不改变当前Pitch）
	duration		= -2,		--镜头持续时间：> 0表示镜头持续这么长时间，-1表示无限(用户自行取消)，-2表示按动作完成，-3表示按程序内填写时间
	bCuttingStart	= false,	--开始的切换模式。true：从当前镜头直接切换到该镜头; false：从当前镜头平滑过渡过来
	SmoothSpeedStart= 6.0, 		--开始时平滑的速度
	bCuttingEnd		= false,	--结束的切换模式。true：直接切换到普通镜头; false：平滑过渡到普通镜头

	SmoothSpeedEnd	= 6.0, 		--结束时平滑的速度
}

-- 死亡事件
CamVisEvent[EventType.EVENT_ROLEDIE] = CopyTable(CamVisEvent["DefaultEvent"])
CamVisEvent[EventType.EVENT_ROLEDIE].Dist2Host = 3.5

-- 复活事件
CamVisEvent[EventType.EVENT_ROLERELIVE] = CopyTable(CamVisEvent["DefaultEvent"])
CamVisEvent[EventType.EVENT_ROLERELIVE].Dist2Host = 5


-------***************************************************************-------
------------------  与物体（NPC，矿，玩家等）对话特效镜头 -------------------
-------***************************************************************-------

-------- 与玩家对话镜头设置 ----------
CamVisObjTalk[CAMVIS_PLAYERMASK] =
{
    Dist2Host		= 8.0, 		--摄像机与玩家的距离（填CAMVIS_NOCHANGEDIST表示不改变当前距离）
	DeltaYaw2Host	= CAMVIS_NOCHANGEYAW,	--摄像机在玩家的那个方位（即水平角度，在玩家正前方为0，背对玩家为180，逆时针旋转。填CAMVIS_NOCHANGEYAW表示不改变当前Yaw）
	Pitch			= 25.0,		--摄像机的俯仰角度（水平为0，向下为90。填CAMVIS_NOCHANGEPITCH表示不改变当前Pitch）
	duration		= -1,		--镜头持续时间：> 0表示镜头持续这么长时间，-1表示无限(用户自行取消)，-2表示按动作完成，-3表示按程序内填写时间
	SmoothSpeedStart= 6.0, 		--开始时平滑的速度
	bCuttingEnd		= false,	--结束的切换模式。true：直接切换到普通镜头; false：平滑过渡到普通镜头

	SmoothSpeedEnd	= 6.0, 		--结束时平滑的速度
}

--------默认设置，下面的基类中与默认相同的设置不用单独写----------
CamVisObjTalk["default"] =
{
    Dist2Host    	= 8.0, 		--摄像机与玩家的距离（填CAMVIS_NOCHANGEDIST表示不改变当前距离）
	DeltaYaw2Host 	= 160.0,	--摄像机在玩家的那个方位（即水平角度，在玩家正前方为0，背对玩家为180，逆时针旋转。填CAMVIS_NOCHANGEYAW表示不改变当前Yaw）
	Pitch         	= 30.0,		--摄像机的俯仰角度（水平为0，向下为90。填CAMVIS_NOCHANGEPITCH表示不改变当前Pitch）
	duration		= -1,		--镜头持续时间：> 0表示镜头持续这么长时间，-1表示无限(用户自行取消)，-2表示按动作完成，-3表示按程序内填写时间
	bCuttingStart	= false,	--开始的切换模式。true：从当前镜头直接切换到该镜头; false：从当前镜头平滑过渡过来
	SmoothSpeedStart= 6.0, 		--开始时平滑的速度
	bCuttingEnd		= false,	--结束的切换模式。true：直接切换到普通镜头; false：平滑过渡到普通镜头

	SmoothSpeedEnd	= 6.0, 		--结束时平滑的速度
}

-- NPC: "测试陈七"
CamVisObjTalk[622] = CopyTable(CamVisObjTalk["default"])
CamVisObjTalk[622].Dist2Host = 10.0

-- NPC: "唐门传授"
CamVisObjTalk[1512] = CopyTable(CamVisObjTalk["default"])
CamVisObjTalk[1512].Dist2Host = 6.0

-------***************************************************************-------
-------------------------  任务对话特效镜头  -------------------------------
-------***************************************************************-------

--------默认设置，下面的基类中与默认相同的设置不用单独写----------
CamVisTaskTalk["default"] =
{
	Dist2Host    	= 3.5, 	--摄像机与目标的距离（填CAMVIS_NOCHANGEDIST表示不改变当前距离）
	DeltaYaw2Host 	= 180,	--摄像机在主角的哪个方位（即水平角度，在目标正前方为0，背对目标为180，逆时针旋转。填 CAMVIS_NOCHANGEYAW 表示不改变当前Yaw）
	Pitch         	= 10.0,		--摄像机的俯仰角度（水平为0，向下为90。填CAMVIS_NOCHANGEPITCH表示不改变当前Pitch）
	duration		= -1,		--镜头持续时间：> 0表示镜头持续这么长时间，-1表示无限(用户自行取消)，-2表示按动作完成，-3表示按程序内填写时间
	bCuttingStart	= true,	--开始的切换模式。true：从当前镜头直接切换到该镜头; false：从当前镜头平滑过渡过来
	SmoothSpeedStart= 6.0, 		--开始时平滑的速度
	bCuttingEnd		= true,	--结束的切换模式。true：直接切换到普通镜头; false：平滑过渡到普通镜头

	SmoothSpeedEnd	= 35.0, 		--结束时平滑的速度
}

CamVisTaskTalk[14842] = CopyTable(CamVisTaskTalk["default"])
CamVisTaskTalk[14842].DeltaYaw2Host= 220.0

CamVisTaskTalk[25323] = CopyTable(CamVisTaskTalk["default"])
CamVisTaskTalk[25323].DeltaYaw2Host= 220.0

CamVisTaskTalk[11289] = CopyTable(CamVisTaskTalk["default"])
CamVisTaskTalk[11289].DeltaYaw2Host= 220.0

CamVisTaskTalk[57379] = CopyTable(CamVisTaskTalk["default"])
CamVisTaskTalk[57379].DeltaYaw2Host= 180.0

CamVisTaskTalk[57380] = CopyTable(CamVisTaskTalk["default"])
CamVisTaskTalk[57380].DeltaYaw2Host= 180.0

CamVisTaskTalk[57381] = CopyTable(CamVisTaskTalk["default"])
CamVisTaskTalk[57381].DeltaYaw2Host= 180.0

CamVisTaskTalk[57382] = CopyTable(CamVisTaskTalk["default"])
CamVisTaskTalk[57382].DeltaYaw2Host= 180.0

CamVisTaskTalk[57383] = CopyTable(CamVisTaskTalk["default"])
CamVisTaskTalk[57383].DeltaYaw2Host= 180.0

CamVisTaskTalk[57384] = CopyTable(CamVisTaskTalk["default"])
CamVisTaskTalk[57384].DeltaYaw2Host= 180.0

CamVisTaskTalk[57385] = CopyTable(CamVisTaskTalk["default"])
CamVisTaskTalk[57385].DeltaYaw2Host= 180.0

CamVisTaskTalk[57386] = CopyTable(CamVisTaskTalk["default"])
CamVisTaskTalk[57386].DeltaYaw2Host= 180.0

CamVisTaskTalk[57387] = CopyTable(CamVisTaskTalk["default"])
CamVisTaskTalk[57387].DeltaYaw2Host= 180.0

CamVisTaskTalk[57388] = CopyTable(CamVisTaskTalk["default"])
CamVisTaskTalk[57388].DeltaYaw2Host= 180.0

CamVisual.CamVisParam =
{
	TaskTalkDOF =
	{
		0.1,	--近距
		0.1,	--对焦
		10.0,	--远距
		15.0,	--blur系数
		1.0,	--泛光系数
	},
}

function CamVisual:CamVisParam_TaskTalkDOF()
	return CamVisual.CamVisParam.TaskTalkDOF
end

-------***************************************************************-------
-------------------------  Emote表情特效镜头  -------------------------------
-------***************************************************************-------

--------默认设置，下面的基类中与默认相同的设置不用单独写----------
CamVisEmote["default"] =
{
	Dist2Host    	= 5.0, 		--摄像机与玩家的距离（填CAMVIS_NOCHANGEDIST表示不改变当前距离）
	DeltaYaw2Host 	= 0.0,		--摄像机在玩家的那个方位（即水平角度，在玩家正前方为0，背对玩家为180，逆时针旋转。填CAMVIS_NOCHANGEYAW表示不改变当前Yaw）
	Pitch         	= 25.0,		--摄像机的俯仰角度（水平为0，向下为90。填CAMVIS_NOCHANGEPITCH表示不改变当前Pitch）
	duration		= -1,		--镜头持续时间：> 0表示镜头持续这么长时间，-1表示无限(用户自行取消)，-2表示按动作完成，-3表示按程序内填写时间
	bCuttingStart	= false,	--开始的切换模式。true：从当前镜头直接切换到该镜头; false：从当前镜头平滑过渡过来
	SmoothSpeedStart= 6.0, 		--开始时平滑的速度
	bCuttingEnd		= false,	--结束的切换模式。true：直接切换到普通镜头; false：平滑过渡到普通镜头

	SmoothSpeedEnd	= 6.0, 		--结束时平滑的速度
}

----- 与default不同的表情在下面定义 -----

-- 抱拳
CamVisEmote[2] = CopyTable(CamVisEmote["default"])
CamVisEmote[2].Pitch = -5.0
CamVisEmote[2].DeltaYaw2Host = 30.0

-- 作揖
CamVisEmote[4] = CopyTable(CamVisEmote["default"])
CamVisEmote[4].Dist2Host = 6.5
CamVisEmote[4].DeltaYaw2Host = 30.0
CamVisEmote[4].Pitch = 20.0



-------***************************************************************-------
-------------------------  技能Perform特效镜头  -----------------------------
-------***************************************************************-------

CamVisSkill["default"] = {}		--没有默认配置。只有定义了才会调用

-------- 用于拷贝的默认Perform镜头配置 ----------
CamVisSkill["DefaultSkill"] =
{
    Dist2Host   	= 10.0, 	--摄像机与玩家的距离（填CAMVIS_NOCHANGEDIST表示不改变当前距离）
	DeltaYaw2Host	= CAMVIS_NOCHANGEYAW,	--摄像机在玩家的那个方位（即水平角度，在玩家正前方为0，背对玩家为180，逆时针旋转。填CAMVIS_NOCHANGEYAW表示不改变当前Yaw）
	Pitch        	= 30.0,		--摄像机的俯仰角度（水平为0，向下为90。填CAMVIS_NOCHANGEPITCH表示不改变当前Pitch）
	duration		= -3,		--镜头持续时间：> 0表示镜头持续这么长时间，-1表示无限(用户自行取消)，-2表示按动作完成，-3表示按程序内填写时间
	bCuttingStart	= false,	--开始的切换模式。true：从当前镜头直接切换到该镜头; false：从当前镜头平滑过渡过来
	SmoothSpeedStart= 6.0, 		--开始时平滑的速度
	bCuttingEnd		= false,	--结束的切换模式。true：直接切换到普通镜头; false：平滑过渡到普通镜头

	SmoothSpeedEnd	= 6.0, 		--结束时平滑的速度
}

--正方向跳跃位移

CamVisSkill[173] = CopyTable(CamVisSkill["DefaultSkill"])

--目的点跳跃位移

CamVisSkill[172] = CopyTable(CamVisSkill["DefaultSkill"])
CamVisSkill[172].Dist2Host = 6.5


-------------------------------------------------------------------------------
--
--		锁敌相机配置
--
-------------------------------------------------------------------------------

LockTargetCamID =
{
	INVALID		= 0,
	VERT_VIEW		= 1,	--侧面垂直方向
	BACK_VIEW		= 2,	--背后方向
	FRONT_VIEW		= 3,	--正面方向

	-- others here
}

--按照和目标的距离分割为几类

LockTargetDistClass =
{
	VERY_NEAR	= 0,	--	最近

	NEAR		= 1,	--	稍近
	MEDIUM		= 2,	--	中距
	FAR			= 3,	--	远程
	VERY_FAR	= 4,	--	最远

}

LockTargetCameraParam =
{
	[LockTargetCamID.VERT_VIEW] =	--侧面垂直方向
	{
		false,	-- 是否只在战斗状态下生效
		false,	-- 是否只在主动锁敌时生效

		1.0,		-- 不转动相机的距离（与目标距离小于这个值则不转动）

		20.0,	-- 相机与观察点的标准距离


		--按照自身与目标之间的距离分类
		{
			-- 最近
			{
				4.0, 	--自身和目标的距离阈值（小于这个值就进入近距模式）

				0.7,	--相机距离缩放比例

				0.0,	--开始自动调整相机距离的延迟时间（毫秒）
				2.0,	--自动调整相机距离的速度

				0.0,	--开始自动左右调整的延迟时间（毫秒）
				false,	--是否匀速调整角度。true：匀速，false：加速

				5.0,	--自动左右调整的速度。匀速时单位是度/秒，加速时为加速度(一般填1~5)

				90.0,	--相机方向 和 自身->目标连线 的夹角（程序里同时判这个的正值和负值）
				0.5,	--观察点和自身的距离比例（比如0是看自身，1是看目标，0.5是看中间）


				false,	--是否匀速调整观察点（true匀速，false加速）
				2.5,	--自动调整观察点的速度。匀速时单位是米/秒，加速时为加速度(一般填1~5)
			},
			--	稍近
			{
				8.0, 	--自身和目标的距离阈值（小于这个值就进入稍近模式）

				0.8,	--相机距离缩放比例

				0,	--开始自动调整相机距离的延迟时间（毫秒）
				2.0,	--自动调整相机距离的速度

				0,	--开始自动左右调整的延迟时间（毫秒）
				false,	--是否匀速调整角度。true：匀速，false：加速

				5.0,	--自动左右调整的速度。匀速时单位是度/秒，加速时为加速度(一般填1~5)

				90.0,	--相机方向 和 自身->目标连线 的夹角（程序里同时判这个的正值和负值）
				0.5,	--观察点和自身的距离比例（比如0是看自身，1是看目标，0.5是看中间）

				false,	--是否匀速调整观察点（true匀速，false加速）
				5.0,	--自动调整观察点的速度。匀速时单位是米/秒，加速时为加速度(一般填1~5)
			},
			-- 中距
			{
				15.0, 	--自身和目标的距离阈值（小于这个值就进入中距模式）
				0.9,	--相机距离缩放比例

				0,	--开始自动调整相机距离的延迟时间（毫秒）
				2.0,	--自动调整相机距离的速度

				0,		--开始自动左右调整的延迟时间（毫秒）
				false,	--是否匀速调整角度。true：匀速，false：加速

				5.0,	--自动左右调整的速度。匀速时单位是度/秒，加速时为加速度(一般填1~5)

				90.0,	--相机方向 和 自身->目标连线 的夹角（程序里同时判这个的正值和负值）
				0.5,	--观察点和自身的距离比例（比如0是看自身，1是看目标，0.5是看中间）

				false,	--是否匀速调整观察点（true匀速，false加速）
				5.0,	--自动调整观察点的速度。匀速时单位是米/秒，加速时为加速度(一般填1~5)
			},
			-- 远程
			{
				20.0, 	--自身和目标的距离阈值 （小于这个值就进入远距模式）

				1.0,	--相机距离缩放比例

				0,	--开始自动调整相机距离的延迟时间（毫秒）
				5.0,	--自动调整相机距离的速度

				0,		--开始自动左右调整的延迟时间（毫秒）
				false,	--是否匀速调整角度。true：匀速，false：加速

				5.0,	--自动左右调整的速度。匀速时单位是度/秒，加速时为加速度(一般填1~5)

				90.0,	--相机方向 和 自身->目标连线 的夹角（程序里同时判这个的正值和负值）
				0.5,	--观察点和自身的距离比例（比如0是看自身，1是看目标，0.5是看中间）


				false,	--是否匀速调整观察点（true匀速，false加速）
				5.0,	--自动调整观察点的速度。匀速时单位是米/秒，加速时为加速度(一般填1~5)
			},
			-- 最远
			{
				30.0,	--自身和目标的距离阈值 （小于这个值就进入最远模式）
				1.0,	--相机距离缩放比例

				50,		--开始自动调整相机距离的延迟时间（毫秒）
				0.5,	--自动调整相机距离的速度

				0,		--开始自动左右调整的延迟时间（毫秒）
				false,	--是否匀速调整角度。true：匀速，false：加速

				10.0,	--自动左右调整的速度。匀速时单位是度/秒，加速时为加速度(一般填1~5)

				90.0,	--相机方向 和 自身->目标连线 的夹角（程序里同时判这个的正值和负值）
				0.48,	--观察点和自身的距离比例（比如0是看自身，1是看目标，0.5是看中间）


				false,	--是否匀速调整观察点（true匀速，false加速）
				3.0,	--自动调整观察点的速度。匀速时单位是米/秒，加速时为加速度(一般填1~5)
			},
		}
	},

	[LockTargetCamID.BACK_VIEW] =	--背后方向
	{
		false,	-- 是否只在战斗状态下生效
		true,		-- 是否只在主动锁敌时生效


		1.0,		-- 不转动相机的距离（与目标距离小于这个值则不转动）

		16.0,	-- 相机与观察点的标准距离


		--按照自身与目标之间的距离分类
		{
			-- 最近
			{
				4.0, 	--自身和目标的距离阈值（小于这个值就进入近距模式）

				0.6,	--相机距离缩放比例（负数表示不进行缩放）


				0,		--开始自动调整相机距离的延迟时间（毫秒）
				5.0,	--自动调整相机距离的速度

				0,		--开始自动左右调整的延迟时间（毫秒）
				false,	--是否匀速调整角度。true：匀速，false：加速

				35.0,	--自动左右调整的速度。匀速时单位是度/秒，加速时为加速度(一般填1~5)

				0.0,	--相机方向 和 自身->目标连线 的夹角（程序里同时判这个的正值和负值）
				0.0,	--观察点和自身的距离比例（比如0是看自身，1是看目标，0.5是看中间）


				false,	--是否匀速调整观察点（true匀速，false加速）
				5.0,	--自动调整观察点的速度。匀速时单位是米/秒，加速时为加速度(一般填1~5)
			},
			--	稍近
			{
				8.0, 	--自身和目标的距离阈值（小于这个值就进入稍近模式）

				0.75,	--相机距离缩放比例（负数表示不进行缩放）


				0,		--开始自动调整相机距离的延迟时间（毫秒）
				5.0,	--自动调整相机距离的速度

				0,		--开始自动左右调整的延迟时间（毫秒）
				false,	--是否匀速调整角度。true：匀速，false：加速

				35.0,	--自动左右调整的速度。匀速时单位是度/秒，加速时为加速度(一般填1~5)

				0.0,	--相机方向 和 自身->目标连线 的夹角（程序里同时判这个的正值和负值）
				0.0,	--观察点和自身的距离比例（比如0是看自身，1是看目标，0.5是看中间）


				false,	--是否匀速调整观察点（true匀速，false加速）
				5.0,	--自动调整观察点的速度。匀速时单位是米/秒，加速时为加速度(一般填1~5)
			},
			-- 中距
			{
				15.0, 	--自身和目标的距离阈值（小于这个值就进入中距模式）
				0.9,	--相机距离缩放比例（负数表示不进行缩放）


				0,		--开始自动调整相机距离的延迟时间（毫秒）
				5.0,	--自动调整相机距离的速度

				0,		--开始自动左右调整的延迟时间（毫秒）
				false,	--是否匀速调整角度。true：匀速，false：加速

				35.0,	--自动左右调整的速度。匀速时单位是度/秒，加速时为加速度(一般填1~5)

				0.0,	--相机方向 和 自身->目标连线 的夹角（程序里同时判这个的正值和负值）
				0.0,	--观察点和自身的距离比例（比如0是看自身，1是看目标，0.5是看中间）


				false,	--是否匀速调整观察点（true匀速，false加速）
				5.0,	--自动调整观察点的速度。匀速时单位是米/秒，加速时为加速度(一般填1~5)
			},
			-- 远程
			{
				20.0, 	--自身和目标的距离阈值 （小于这个值就进入远距模式）

				1.0,	--相机距离缩放比例（负数表示不进行缩放）


				0,	--开始自动调整相机距离的延迟时间（毫秒）
				5.0,	--自动调整相机距离的速度

				0,		--开始自动左右调整的延迟时间（毫秒）
				false,	--是否匀速调整角度。true：匀速，false：加速

				35.0,	--自动左右调整的速度。匀速时单位是度/秒，加速时为加速度(一般填1~5)

				0.0,	--相机方向 和 自身->目标连线 的夹角（程序里同时判这个的正值和负值）
				0.0,	--观察点和自身的距离比例（比如0是看自身，1是看目标，0.5是看中间）


				false,	--是否匀速调整观察点（true匀速，false加速）
				5.0,	--自动调整观察点的速度。匀速时单位是米/秒，加速时为加速度(一般填1~5)
			},
			-- 最远
			{
				30.0,	--自身和目标的距离阈值 （小于这个值就进入最远模式）
				1.0,	--相机距离缩放比例（负数表示不进行缩放）


				0,		--开始自动调整相机距离的延迟时间（毫秒）
				1.0,	--自动调整相机距离的速度

				0,		--开始自动左右调整的延迟时间（毫秒）
				false,	--是否匀速调整角度。true：匀速，false：加速

				35.0,	--自动左右调整的速度。匀速时单位是度/秒，加速时为加速度(一般填1~5)

				0.0,	--相机方向 和 自身->目标连线 的夹角（程序里同时判这个的正值和负值）
				0.0,	--观察点和自身的距离比例（比如0是看自身，1是看目标，0.5是看中间）


				false,	--是否匀速调整观察点（true匀速，false加速）
				3.0,	--自动调整观察点的速度。匀速时单位是米/秒，加速时为加速度(一般填1~5)
			},
		},
	},

	[LockTargetCamID.FRONT_VIEW] =	--正面方向
	{
		false,	-- 是否只在战斗状态下生效
		true,		-- 是否只在主动锁敌时生效


		1.0,		-- 不转动相机的距离（与目标距离小于这个值则不转动）

		16.0,	-- 相机与观察点的标准距离


		--按照自身与目标之间的距离分类
		{
			-- 最近
			{
				4.0, 	--自身和目标的距离阈值（小于这个值就进入近距模式）

				-1.0,	--相机距离缩放比例（负数表示不进行缩放）


				0,		--开始自动调整相机距离的延迟时间（毫秒）
				5.0,	--自动调整相机距离的速度

				0,		--开始自动左右调整的延迟时间（毫秒）
				false,	--是否匀速调整角度。true：匀速，false：加速

				5.0,	--自动左右调整的速度。匀速时单位是度/秒，加速时为加速度(一般填1~5)

				180.0,	--相机方向 和 自身->目标连线 的夹角（程序里同时判这个的正值和负值）
				0.7,	--观察点和自身的距离比例（比如0是看自身，1是看目标，0.5是看中间）


				false,	--是否匀速调整观察点（true匀速，false加速）
				5.0,	--自动调整观察点的速度。匀速时单位是米/秒，加速时为加速度(一般填1~5)
			},
			--	稍近
			{
				8.0, 	--自身和目标的距离阈值（小于这个值就进入稍近模式）

				-1.0,	--相机距离缩放比例（负数表示不进行缩放）


				0,		--开始自动调整相机距离的延迟时间（毫秒）
				5.0,	--自动调整相机距离的速度

				0,		--开始自动左右调整的延迟时间（毫秒）
				false,	--是否匀速调整角度。true：匀速，false：加速

				5.0,	--自动左右调整的速度。匀速时单位是度/秒，加速时为加速度(一般填1~5)

				180.0,	--相机方向 和 自身->目标连线 的夹角（程序里同时判这个的正值和负值）
				0.7,	--观察点和自身的距离比例（比如0是看自身，1是看目标，0.5是看中间）


				false,	--是否匀速调整观察点（true匀速，false加速）
				5.0,	--自动调整观察点的速度。匀速时单位是米/秒，加速时为加速度(一般填1~5)
			},
			-- 中距
			{
				15.0, 	--自身和目标的距离阈值（小于这个值就进入中距模式）
				-1.0,	--相机距离缩放比例（负数表示不进行缩放）


				0,		--开始自动调整相机距离的延迟时间（毫秒）
				5.0,	--自动调整相机距离的速度

				0,		--开始自动左右调整的延迟时间（毫秒）
				false,	--是否匀速调整角度。true：匀速，false：加速

				5.0,	--自动左右调整的速度。匀速时单位是度/秒，加速时为加速度(一般填1~5)

				180.0,	--相机方向 和 自身->目标连线 的夹角（程序里同时判这个的正值和负值）
				0.7,	--观察点和自身的距离比例（比如0是看自身，1是看目标，0.5是看中间）


				false,	--是否匀速调整观察点（true匀速，false加速）
				5.0,	--自动调整观察点的速度。匀速时单位是米/秒，加速时为加速度(一般填1~5)
			},
			-- 远程
			{
				20.0, 	--自身和目标的距离阈值（小于这个值就进入远距模式）

				-1.0,	--相机距离缩放比例（负数表示不进行缩放）

				0,		--开始自动调整相机距离的延迟时间（毫秒）
				5.0,	--自动调整相机距离的速度

				0,		--开始自动左右调整的延迟时间（毫秒）
				false,	--是否匀速调整角度。true：匀速，false：加速

				5.0,	--自动左右调整的速度。匀速时单位是度/秒，加速时为加速度(一般填1~5)

				180.0,	--相机方向 和 自身->目标连线 的夹角（程序里同时判这个的正值和负值）
				0.7,	--观察点和自身的距离比例（比如0是看自身，1是看目标，0.5是看中间）


				false,	--是否匀速调整观察点（true匀速，false加速）
				5.0,	--自动调整观察点的速度。匀速时单位是米/秒，加速时为加速度(一般填1~5)
			},
			-- 最远
			{
				30.0,	--自身和目标的距离阈值 （小于这个值就进入最远模式）
				-1.0,	--相机距离缩放比例（负数表示不进行缩放）


				0,		--开始自动调整相机距离的延迟时间（毫秒）
				1.0,	--自动调整相机距离的速度

				0,		--开始自动左右调整的延迟时间（毫秒）
				false,	--是否匀速调整角度。true：匀速，false：加速

				10.0,	--自动左右调整的速度。匀速时单位是度/秒，加速时为加速度(一般填1~5)

				0.0,	--相机方向 和 自身->目标连线 的夹角（程序里同时判这个的正值和负值）
				0.0,	--观察点和自身的距离比例（比如0是看自身，1是看目标，0.5是看中间）


				false,	--是否匀速调整观察点（true匀速，false加速）
				5.0,	--自动调整观察点的速度。匀速时单位是米/秒，加速时为加速度(一般填1~5)
			},
		},
	},
	-- others here
}

function CamVisual:GetLockTargetCamParam(idCam)

	return LockTargetCameraParam[idCam]

end
