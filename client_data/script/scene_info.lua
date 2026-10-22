--[[#tag push auto]]

SceneInfo = {}

SceneInfo.Cfg =
{
	[1025] =
	{
		IsShow = function()
			return true
		end,

		GetDesc = function()
			return string.format(--[[!AUTO_1]]"街市金錢：%d　個人好評：%d", GameApi.GetReputation(93), GameApi.GetReputation(94))
		end,

		GetInfo = function()
			--子界面的类型：1、接任务板；2、战场专用装备板
			return {}
		end,
	},
	[1017] =
	{
		IsShow = function()
			return true
		end,
		GetDesc = function()
			return string.format(--[[!AUTO_2]]"金錢：%d　經驗：%d", GameApi.GetReputation(106), GameApi.GetReputation(105))
		end,

		GetInfo = function()
			--子界面的类型：1、接任务板（参数1－任务组类型）；2、战场专用装备板
			return {{1,1,0}, {2,0,0}}
		end,
	},
	[2027] =
	{
		IsShow = function()
			return true
		end,
		GetDesc = function()
			return string.format(--[[!AUTO_1]]"可使用道具列表")
		end,

		GetInfo = function()
			--子界面的类型：1、接任务板（参数1－任务组类型）；2、战场专用装备板
			return {{2,0,0}}
		end,
	},
}

SceneInfo.Task =
{
	[1] = {{3567,3051},{3568,3176},{3570,2468},{3571,2584},{3572,2681},{3573,2712},{3574,6400},{3575,6932},{3576,9567},{3579,9571},{3578,9575},{3580,9594},{3581,9600},{3583,1422},{3582,9803},{3584,9604},{3585,2101},{3586,10322},{3587,9805},{3588,8502},{3589,2099},{3590,8503},{3591,7096},{3592,7107},{3593,7111},{3594,6502},{3595,6797},{3596,6901},{3597,9230}},	--组队战战场任务测试板
}

SceneInfo.TaskHint = {}
SceneInfo.TaskHint[1] = {}

SceneInfo.TaskHint[1][3567] = 30887
SceneInfo.TaskHint[1][3568] = 30888
SceneInfo.TaskHint[1][3570] = 30889
SceneInfo.TaskHint[1][3571] = 30893
SceneInfo.TaskHint[1][3572] = 30893




	--{{3567,30887},{3568,30888},{3570,30889},{3571,30893},{3572,2681},{3573,2712},{3574,6400},{3575,6932},{3576,9567},{3579,9571},{3578,9575},{3580,9594},{3581,9600},{3583,1422},{3582,9803},{3584,9604},{3585,2101},{3586,10322},{3587,9805},{3588,8502},{3589,2099},{3590,8503},{3591,7096},{3592,7107},{3593,7111},{3594,6502},{3595,6797},{3596,6901},{3597,9230}},




function SceneInfo:GetSceneInfo(idScene)
	if SceneInfo.Cfg[idScene] then
		return SceneInfo.Cfg[idScene].IsShow(),SceneInfo.Cfg[idScene].GetDesc(),SceneInfo.Cfg[idScene].GetInfo()
	end

	return false,--[[!AUTO_3]]"",{}
end

function SceneInfo:GetTaskInfo(idx)
	if SceneInfo.Task[idx] then
		return SceneInfo.Task[idx]
	end
	return {}
end


function SceneInfo:GetTaskHint(idTask,Type)
	local tid = 0
	if SceneInfo.TaskHint[1][idTask] then
		tid = SceneInfo.TaskHint[1][idTask]
	end

	return DescTool:GetSceneOnlyDesc(tid,ClassType.ICID_SCENEONLY,0,0,{})
end

