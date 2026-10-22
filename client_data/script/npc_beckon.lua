---------------------------------------------------------------
--  created:   2010.01.08
--  author:    djh
--
--  客户端自行召唤NPC脚本
---------------------------------------------------------------
--[[
GameApi接口说明:
	BeckonNpc(tid)                   tid: NPC模板ID                      返回值: 召唤的NPC nid(>0)

	DispelNpc(nid)                   nid: 召唤NPC的nid                   返回(true/false) 表示是否成功

	SetBeckonNpcPos(nid,pos)         nid: 召唤NPC的nid 
									 pos: 设置的位置    

	SetBeckonNpcDir(nid,dir)         nid: 召唤NPC的nid 
	                                 dir: 设置的方向    

	BeckonNpcPlayAction(nid,action)  nid: 召唤NPC的nid 
	                                 action: 动作ID(int)  或者为播放动作名称 (string)
									 
	BeckonNpcPlayGfx(nid,gfx,hook)   nid: 召唤NPC的nid 
	                                 gfx: gfx文件路径 
									 hook: gfx播放的挂点位置,可以不填,不填写hook表示在Npc原点播放

	BeckonNpcDisWithHost(nid)        nid: 召唤NPC的nid                   返回值: 返回距离Host的水平距离

	BeckonNpcWalkToWithCB(nid,x,y,z,fSpeed,fStopDis,idScript)
	
	BeckonNpcRunToWithCB(nid,x,y,z,fSpeed,fStopDis,idScript)
							         nid: 召唤NPC的nid 
									 x,y,z就是移动的目标点
									 fSpeed移动速度
									 fStopDis寻径到目标点的停止距离
									 idScript 是移动到达之后所执行的脚本ID,此函数在AutoMove_CB.lua中定义

	BeckonNpcRandAroundHost(nid,dis)
									 nid: 召唤NPC的nid 
									 dis: 标示距离玩家多远的圆周

	BeckonNpcStopAutoMove(nid)
									 nid: 召唤NPC的nid 
--]]

NpcBeckon           = {}
NpcBeckon.NPC       = {}
NpcBeckon.ScriptCB  = {}

NpcBeckon.EVENT = 
{
	EVENT_UNKNOWN        = 0,
	EVENT_BEGIN_AUTOMOVE = 1,
	EVENT_STOP_AUTOMOVE  = 2,
}

--*******************************************************************************
--一下接口为脚本可调用接口
--*******************************************************************************
--召唤接口
--idBeckon : NPC 的标示ID
function NpcBeckon:Beckon(idBeckon)
	if idBeckon > 0 and NpcBeckon.NPC[idBeckon] then
		NpcBeckon.NPC[idBeckon].BID = idBeckon
		NpcBeckon.NPC[idBeckon].OnBeckon(NpcBeckon.NPC[idBeckon])
		GameApi.BeckonNpcSetBeckonID(NpcBeckon.NPC[idBeckon].NID,idBeckon)
	end
end

--驱散接口
--idBeckon : NPC 的标示ID
function NpcBeckon:Dispel(idBeckon)
	if idBeckon > 0 and NpcBeckon.NPC[idBeckon] then
		NpcBeckon.NPC[idBeckon].OnDispel(NpcBeckon.NPC[idBeckon])
	end
end

--NPC播放动作
--idBeckon : NPC 的标示ID
--nameAction : 动作名称
--idAction : 动作ID
--nameAction和idAction任意填写一个就行(剩余的可以填nil)
--例如: NpcBeckon:PlayAction(1,"跳舞",0) 或者  NpcBeckon:PlayAction(1,"",1)
function NpcBeckon:PlayAction(idBeckon,nameAction,idAction)
	if idBeckon > 0 and NpcBeckon.NPC[idBeckon] then
		NpcBeckon.NPC[idBeckon].OnPlayAction(nameAction,idAction,NpcBeckon.NPC[idBeckon])
	end
end

--NPC播放GFX
--idBeckon : NPC 的标示ID
--gfxFile: 播放的GFX文件路径
--nameHook: Gfx所挂在Model的挂点上,如果为"" 或者为nil那么Gfx在Model原点播放
function NpcBeckon:PlayGfx(idBeckon,gfxFile,nameHook)
	if idBeckon > 0 and NpcBeckon.NPC[idBeckon] then
		NpcBeckon.NPC[idBeckon].OnPlayGfx(gfxFile,nameHook,NpcBeckon.NPC[idBeckon])
	end
end

--NPC显示名字
--idBeckon : NPC 的标示ID
--sName: 名字
--isShow: 是否显示
function NpcBeckon:ShowName(idBeckon,sName,isShow)
	if idBeckon > 0 and NpcBeckon.NPC[idBeckon] then
		NpcBeckon.NPC[idBeckon].OnShowName(sName,isShow,NpcBeckon.NPC[idBeckon])
	end
end

--NPC显示名字
--idBeckon : NPC 的标示ID
--sName: 名字
--isShow: 是否显示
function NpcBeckon:DoScript(idBeckon,idScript)
	if idBeckon > 0 and NpcBeckon.NPC[idBeckon] then
		NpcBeckon.NPC[idBeckon].OnDoScript(idScript,NpcBeckon.NPC[idBeckon])
	end
end

--NPC走路
--idBeckon : NPC 的标示ID
--pos_tbl: 位置表{x,y,z}
--idScript: 自动寻径后回调脚本ID
function NpcBeckon:WalkWithCB(idBeckon,pos_tbl,idScript)
	if idBeckon > 0 and NpcBeckon.NPC[idBeckon] then
		NpcBeckon.NPC[idBeckon].OnWalkWithCB(pos_tbl,idScript,NpcBeckon.NPC[idBeckon])
	end
end

--NPC跑
--idBeckon : NPC 的标示ID
--pos_tbl: 位置表{x,y,z}
--idScript: 自动寻径后回调脚本ID
function NpcBeckon:RunWithCB(idBeckon,pos_tbl,idScript)
	if idBeckon > 0 and NpcBeckon.NPC[idBeckon] then
		NpcBeckon.NPC[idBeckon].OnRunWithCB(pos_tbl,idScript,NpcBeckon.NPC[idBeckon])
	end
end

--NPC停止自动寻径
--idBeckon : NPC 的标示ID
function NpcBeckon:StopAutoMove(idBeckon)
	if idBeckon > 0 and NpcBeckon.NPC[idBeckon] then
		NpcBeckon.NPC[idBeckon].OnStopAutoMove(NpcBeckon.NPC[idBeckon])
	end
end

--*******************************************************************************

--*******************************************************************************
--客户端执行的接口
--*******************************************************************************
--拷贝表
function NpcBeckon:CopyTable(src_tbl)
	local dst_tbl = {}
	for k, v in pairs(src_tbl) do
		if type(v) == "table" then
			dst_tbl[k] = NpcBeckon:CopyTable(v)
		else
			dst_tbl[k] = v
		end
	end

	local mt = getmetatable(src_tbl)
	setmetatable(dst_tbl, mt)
	return dst_tbl
end

--召唤的NPC更新接口
--idBeckon : NPC 的标示ID
function NpcBeckon:Tick(deltaTime,nid)
	for k,v in pairs(NpcBeckon.NPC) do
		if v.NID == nid then
			v.OnTick(deltaTime,v)
			return
		end
	end
end

--NPC加载完成的通知
function NpcBeckon:NpcLoaded(nid)
	for k,v in pairs(NpcBeckon.NPC) do
		if v.NID == nid then
			v.OnNpcLoaded(v)
			return
		end
	end
end

--释放所有模板
function NpcBeckon:Release()
	for k,v in pairs(NpcBeckon.NPC) do
		v.NID = 0
	end
end

--事件接口
function NpcBeckon:Event(nid,idEvent)
	for k,v in pairs(NpcBeckon.NPC) do
		if v.NID == nid then
			v.OnEvent(idEvent,v)
			break
		end
	end
end

--执行脚本回调
function NpcBeckon:ExecuteCB(idScript)
	if NpcBeckon.ScriptCB[idScript] then
		local exeFunc = NpcBeckon.ScriptCB[idScript].Execute
		if exeFunc then
			exeFunc()
		end
	end
end

--*******************************************************************************
--一默认配置表
--*******************************************************************************
--可召唤NPC配置表
NpcBeckon.NPC[0] = 
{
	TID			    = 0,--模板ID
	NID			    = 0,--NPC的标示ID,召唤后自动生产
	BID				= 0,--召唤ID

	RandAroundHost  = {Yes = false,  Distance = 4},--是否在随机玩家周围参数,Yes标示生效,Dis标示距离玩家多远的圆周
	MaxDisWithHost  = {Dispel = false,Distance = 12},--Dispel标示NPC和玩家的距离相隔Dis远就自动消失
	Pos             = {X = 0,Y = 0,Z = 0},--召唤后初始坐标
	Dir             = {X = 0,Y = 0,Z = 1},--召唤后初始方向
	ShowName        = {Show = false,Name = ""},--显示名字的参数
	AutoMove		= {WalkSpeed = 1.5,RunSpeed = 4.0,StopDistance = 2.0},--自动寻径的参数设定

	ShowGfx		    = "",--召唤时的特效Gfx
	HideGfx		    = "",--驱散是的特效Gfx
	DispelTime      = 1000,--驱散时的淡出时间
	ShowCg		    = 0,--召唤时播放的CG
	HideCg		    = 0,--驱散时播放的CG

	FollowHost		= false,
	FollowDis		= 4,

	--更新
	OnTick   = function(deltaTime,this)
		if this.NID <= 0 then
			LogPrint("(Error)OnTick: NPC Have Not Been Beckon Out, BID: "..this.BID.."\r\n")
			return
		end

		if this.MaxDisWithHost.Dispel then
			local fDis = GameApi.BeckonNpcDisWithHost(this.NID)
			if fDis > this.MaxDisWithHost.Distance then
				this:OnDispel()
			end
		end
	end,

	--召唤
	OnBeckon = function(this)
		if this.NID > 0 then
			LogPrint("(Error)OnBeckon: NPC Have Been Beckon Out, BID: "..this.BID.."\r\n")
			return
		end

		this.NID = GameApi.BeckonNpc(this.TID,this.Pos.X,this.Pos.Y,this.Pos.Z,this.Dir.X,this.Dir.Y,this.Dir.Z)
		if this.NID > 0 then
			if this.RandAroundHost.Yes then
				GameApi.BeckonNpcRandAroundHost(this.NID,this.RandAroundHost.Distance)
			end
			
			if this.ShowName.Show and string.len(this.ShowName.Name) > 0 then
				GameApi.BeckonNpcShowName(this.NID,this.ShowName.Name,this.ShowName.Show)
			else
				GameApi.BeckonNpcShowName(this.NID,"",false)
			end

			if this.FollowHost then
				GameApi.BeckonNpcFollowHost(this.NID,this.AutoMove.RunSpeed,this.FollowDis,this.AutoMove.StopDistance)
			end
		end
	end,

	--加载完成的消息通知
	OnNpcLoaded = function(this)
		if this.NID <= 0 then
			LogPrint("(Error)OnDispel: NPC Have Not Been Beckon Out, BID: "..this.BID.."\r\n")
			return
		end

		if this.ShowGfx and string.len(this.ShowGfx) > 0 then
			GameApi.BeckonNpcPlayGfx(this.NID,this.ShowGfx)
		end

		if this.ShowCg > 0 then
			GameApi.PlayCG(this.ShowCg)
		end
	end,

	--显示名字
	OnShowName = function(sName,isShow,this)
		if this.NID <= 0 then
			LogPrint("(Error)OnDispel: NPC Have Not Been Beckon Out, BID: "..this.BID.."\r\n")
			return
		end

		GameApi.BeckonNpcShowName(this.NID,sName,isShow)
	end,

	--驱散
	OnDispel = function(this)
		if this.NID <= 0 then
			LogPrint("(Error)OnDispel: NPC Have Not Been Beckon Out, BID: "..this.BID.."\r\n")
			return
		end

		if this.HideGfx and string.len(this.HideGfx) > 0 then
			GameApi.BeckonNpcPlayGfx(this.NID,this.HideGfx)
		end

		if this.HideCg > 0 then
			GameApi.PlayCG(this.HideCg)
		end

		local disOK = GameApi.DispelNpc(this.NID,this.DispelTime)
		if disOK then
			this.NID = 0
		end
	end,
	
	--播放动作
	OnPlayAction = function(nameAction,idAction,this)
		if this.NID <= 0 then
			LogPrint("(Error)OnPlayAction: NPC Have Not Been Beckon Out, BID: "..this.BID.."\r\n")
			return
		end

		if nameAction and string.len(nameAction) then
			GameApi.BeckonNpcPlayAction(this.NID,nameAction)
			return
		end

		if idAction and idAction > 0 then
			GameApi.BeckonNpcPlayAction(this.NID,idAction)
			return
		end
	end,

	--播放Gfx
	OnPlayGfx = function(gfxFile,nameHook,this)
		if this.NID <= 0 then
			LogPrint("(Error)OnPlayGfx: NPC Have Not Been Beckon Out, BID: "..this.BID.."\r\n")
			return
		end
		
		local sHook = ""
		if gfxFile and string.len(gfxFile) then
			if nameHook and string.len(nameHook) then
				sHook = nameHook
			end
			GameApi.BeckonNpcPlayGfx(this.NID,gfxFile,sHook)
		end
	end,
	
	--走
	OnWalkWithCB = function(pos_tbl,idScript,this)
		if this.NID <= 0 then
			LogPrint("(Error)OnWalkWithCB: NPC Have Not Been Beckon Out, BID: "..this.BID.."\r\n")
			return
		end
		
		if pos_tbl and pos_tbl.X and pos_tbl.Y and pos_tbl.Z then
			GameApi.BeckonNpcWalkToWithCB(this.NID,pos_tbl.X,pos_tbl.Y,pos_tbl.Z,this.AutoMove.WalkSpeed,this.AutoMove.StopDistance,idScript)
		end
	end,

	--跑
	OnRunWithCB = function(pos_tbl,idScript,this)
		if this.NID <= 0 then
			LogPrint("(Error)OnRunWithCB: NPC Have Not Been Beckon Out, BID: "..this.BID.."\r\n")
			return
		end
		
		if pos_tbl and pos_tbl.X and pos_tbl.Y and pos_tbl.Z then
			GameApi.BeckonNpcRunToWithCB(this.NID,pos_tbl.X,pos_tbl.Y,pos_tbl.Z,this.AutoMove.RunSpeed,this.AutoMove.StopDistance,idScript)
		end
	end,

	--停止寻径
	OnStopAutoMove = function(this)
		if this.NID <= 0 then
			LogPrint("(Error)OnStopAutoMove: NPC Have Not Been Beckon Out, BID: "..this.BID.."\r\n")
			return
		end
		
		GameApi.BeckonNpcStopAutoMove(this.NID)
	end,

	--执行脚本(由idScript表示)
	OnDoScript = function(idScript,this)
		if this.NID <= 0 then
			LogPrint("(Error)OnDoScript: NPC Have Not Been Beckon Out, BID: "..this.BID.."\r\n")
			return
		end
	end,

	--触发事件
	OnEvent = function(idEvent,this)
		if this.NID <= 0 then
			LogPrint("(Error)OnEvent: NPC Have Not Been Beckon Out, BID: "..this.BID.."\r\n")
			return
		end
	end,
}

--*******************************************************************************
--策划回调数据配置区
--*******************************************************************************
NpcBeckon.ScriptCB[1] = 
{
	Execute = function()
		LogPrint("NpcBeckon.ScriptCB[1]......\r\n")
	end,
}

--*******************************************************************************
--策划NPC数据配置区
--*******************************************************************************

--玩家向导(ID:1)
NpcBeckon.NPC[1] = NpcBeckon:CopyTable(NpcBeckon.NPC[0])
NpcBeckon.NPC[1].TID						= 829
NpcBeckon.NPC[1].ShowGfx					= "程序联入\\回城瞬回细光.gfx"
NpcBeckon.NPC[1].HideGfx					= "程序联入\\回城瞬回后光2.gfx"
NpcBeckon.NPC[1].DispelTime					= 1500
NpcBeckon.NPC[1].RandAroundHost.Yes			= true
NpcBeckon.NPC[1].RandAroundHost.Distance	= 2
NpcBeckon.NPC[1].MaxDisWithHost.Dispel		= false
NpcBeckon.NPC[1].MaxDisWithHost.Distance	= 12
NpcBeckon.NPC[1].AutoMove.WalkSpeed         = 1.5
NpcBeckon.NPC[1].AutoMove.RunSpeed          = 4.0
NpcBeckon.NPC[1].AutoMove.StopDistance      = 2.0
NpcBeckon.NPC[1].ShowName.Show				= true
NpcBeckon.NPC[1].ShowName.Name				= "任盈盈"

--玩家向导(ID:2)
NpcBeckon.NPC[2] = NpcBeckon:CopyTable(NpcBeckon.NPC[0])
NpcBeckon.NPC[2].TID						= 10842
NpcBeckon.NPC[2].ShowGfx					= "程序联入\\回城瞬回细光.gfx"
NpcBeckon.NPC[2].HideGfx					= "程序联入\\回城瞬回后光2.gfx"
NpcBeckon.NPC[2].DispelTime					= 1500
NpcBeckon.NPC[2].RandAroundHost.Yes			= true
NpcBeckon.NPC[2].RandAroundHost.Distance	= 2
NpcBeckon.NPC[2].MaxDisWithHost.Dispel		= false
NpcBeckon.NPC[2].MaxDisWithHost.Distance	= 12
NpcBeckon.NPC[2].AutoMove.WalkSpeed         = 1.5
NpcBeckon.NPC[2].AutoMove.RunSpeed          = 4.0
NpcBeckon.NPC[2].AutoMove.StopDistance      = 2.0
NpcBeckon.NPC[2].ShowName.Show				= true
NpcBeckon.NPC[2].ShowName.Name				= "神算子"

--玩家向导(ID:3)
NpcBeckon.NPC[3] = NpcBeckon:CopyTable(NpcBeckon.NPC[0])
NpcBeckon.NPC[3].TID						= 10845
NpcBeckon.NPC[3].ShowGfx					= "程序联入\\回城瞬回细光.gfx"
NpcBeckon.NPC[3].HideGfx					= "程序联入\\回城瞬回后光3.gfx"
NpcBeckon.NPC[3].DispelTime					= 1500
NpcBeckon.NPC[3].RandAroundHost.Yes			= true
NpcBeckon.NPC[3].RandAroundHost.Distance	= 3
NpcBeckon.NPC[3].MaxDisWithHost.Dispel		= false
NpcBeckon.NPC[3].MaxDisWithHost.Distance	= 13
NpcBeckon.NPC[3].AutoMove.WalkSpeed         = 1.5
NpcBeckon.NPC[3].AutoMove.RunSpeed          = 4.0
NpcBeckon.NPC[3].AutoMove.StopDistance      = 3.0
NpcBeckon.NPC[3].ShowName.Show				= true
NpcBeckon.NPC[3].ShowName.Name				= "慕容家侍女"

--玩家向导(ID:4)
NpcBeckon.NPC[4] = NpcBeckon:CopyTable(NpcBeckon.NPC[0])
NpcBeckon.NPC[4].TID						= 10848
NpcBeckon.NPC[4].ShowGfx					= "程序联入\\回城瞬回细光.gfx"
NpcBeckon.NPC[4].HideGfx					= "程序联入\\回城瞬回后光4.gfx"
NpcBeckon.NPC[4].DispelTime					= 1500
NpcBeckon.NPC[4].RandAroundHost.Yes			= true
NpcBeckon.NPC[4].RandAroundHost.Distance	= 4
NpcBeckon.NPC[4].MaxDisWithHost.Dispel		= false
NpcBeckon.NPC[4].MaxDisWithHost.Distance	= 14
NpcBeckon.NPC[4].AutoMove.WalkSpeed         = 1.5
NpcBeckon.NPC[4].AutoMove.RunSpeed          = 4.0
NpcBeckon.NPC[4].AutoMove.StopDistance      = 4.0
NpcBeckon.NPC[4].ShowName.Show				= true
NpcBeckon.NPC[4].ShowName.Name				= "雏菊指明灯"
--玩家向导(ID:5)
NpcBeckon.NPC[5] = NpcBeckon:CopyTable(NpcBeckon.NPC[0])
NpcBeckon.NPC[5].TID						= 10851
NpcBeckon.NPC[5].ShowGfx					= "程序联入\\回城瞬回细光.gfx"
NpcBeckon.NPC[5].HideGfx					= "程序联入\\回城瞬回后光5.gfx"
NpcBeckon.NPC[5].DispelTime					= 1500
NpcBeckon.NPC[5].RandAroundHost.Yes			= true
NpcBeckon.NPC[5].RandAroundHost.Distance	= 5
NpcBeckon.NPC[5].MaxDisWithHost.Dispel		= false
NpcBeckon.NPC[5].MaxDisWithHost.Distance	= 15
NpcBeckon.NPC[5].AutoMove.WalkSpeed         = 1.5
NpcBeckon.NPC[5].AutoMove.RunSpeed          = 5.0
NpcBeckon.NPC[5].AutoMove.StopDistance      = 5.0
NpcBeckon.NPC[5].ShowName.Show				= true
NpcBeckon.NPC[5].ShowName.Name				= "助手"
--玩家向导(ID:6)
NpcBeckon.NPC[6] = NpcBeckon:CopyTable(NpcBeckon.NPC[0])
NpcBeckon.NPC[6].TID						= 10854
NpcBeckon.NPC[6].ShowGfx					= "程序联入\\回城瞬回细光.gfx"
NpcBeckon.NPC[6].HideGfx					= "程序联入\\回城瞬回后光5.gfx"
NpcBeckon.NPC[6].DispelTime					= 1500
NpcBeckon.NPC[6].RandAroundHost.Yes			= true
NpcBeckon.NPC[6].RandAroundHost.Distance	= 5
NpcBeckon.NPC[6].MaxDisWithHost.Dispel		= false
NpcBeckon.NPC[6].MaxDisWithHost.Distance	= 15
NpcBeckon.NPC[6].AutoMove.WalkSpeed         = 1.5
NpcBeckon.NPC[6].AutoMove.RunSpeed          = 5.0
NpcBeckon.NPC[6].AutoMove.StopDistance      = 5.0
NpcBeckon.NPC[6].ShowName.Show				= true
NpcBeckon.NPC[6].ShowName.Name				= "张大力"
--玩家向导(ID:7)
NpcBeckon.NPC[7] = NpcBeckon:CopyTable(NpcBeckon.NPC[0])
NpcBeckon.NPC[7].TID						= 10951
NpcBeckon.NPC[7].ShowGfx					= "程序联入\\放鸽子.gfx"
NpcBeckon.NPC[7].HideGfx					= ""
NpcBeckon.NPC[7].DispelTime					= 1500
NpcBeckon.NPC[7].RandAroundHost.Yes			= true
NpcBeckon.NPC[7].RandAroundHost.Distance	= 1
NpcBeckon.NPC[7].MaxDisWithHost.Dispel		= false
NpcBeckon.NPC[7].MaxDisWithHost.Distance	= 15
NpcBeckon.NPC[7].AutoMove.WalkSpeed         = 1.5
NpcBeckon.NPC[7].AutoMove.RunSpeed          = 5.0
NpcBeckon.NPC[7].AutoMove.StopDistance      = 5.0
NpcBeckon.NPC[7].ShowName.Show				= false
NpcBeckon.NPC[7].ShowName.Name				= ""
NpcBeckon.NPC[7].TotalTime					= 0
NpcBeckon.NPC[7].OnTick	= function(deltaTime,this)
	this.TotalTime = this.TotalTime + deltaTime
	if this.TotalTime >= 5000 then
		NpcBeckon:Dispel(7)
	end
end

--帮助向导(ID:1000)
NpcBeckon.NPC[1000] = NpcBeckon:CopyTable(NpcBeckon.NPC[0])
NpcBeckon.NPC[1000].TID						= 829
NpcBeckon.NPC[1000].ShowGfx					= "程序联入\\回城瞬回细光.gfx"
NpcBeckon.NPC[1000].HideGfx					= "程序联入\\回城瞬回后光2.gfx"
NpcBeckon.NPC[1000].DispelTime				= 1500
NpcBeckon.NPC[1000].RandAroundHost.Yes		= true
NpcBeckon.NPC[1000].RandAroundHost.Distance	= 2
NpcBeckon.NPC[1000].MaxDisWithHost.Dispel	= false
NpcBeckon.NPC[1000].MaxDisWithHost.Distance	= 12
NpcBeckon.NPC[1000].AutoMove.WalkSpeed      = 1.5
NpcBeckon.NPC[1000].AutoMove.RunSpeed       = 4.0
NpcBeckon.NPC[1000].AutoMove.StopDistance   = 2.0
NpcBeckon.NPC[1000].ShowName.Show			= true
NpcBeckon.NPC[1000].ShowName.Name			= "帮助向导任盈盈"
NpcBeckon.NPC[1000].FollowHost				= true
NpcBeckon.NPC[1000].FollowDis				= 4.0
NpcBeckon.NPC[1000].OnTick	= function(deltaTime,this)
end
