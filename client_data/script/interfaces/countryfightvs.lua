--[[#tag push auto]]


local DlgTemplate = DlgTemplate or {new = function () return {} end}
local DlgApi  = DlgApi
local pairs = pairs
local assert = assert
local type = type


Win_CountryFightVS = DlgTemplate:new({this = --[[!AUTO_13]]"Win_CountryFightVS"})

do
	local Class = Win_CountryFightVS
	local Name = --[[!AUTO_14]]"Win_CountryFightVS"
	
	local config = {}
	
	--intance_tid(副本模板ID，大世界为0)
	--activity(活动ID，用于控制时间显示，副本可保持活动列表为空)
	--side_A_name，side_B_name(界面显示字符)
	--side_A_scene_param，side_B_scene_param(双方积分对应的场景参数ID)
	--self_score_repu(个人积分对应的声望ID,为0时不显示个人积分)
	--special_id(特殊处理ID，1为帮派战)
	config[115] = {instance_tid = 0,activity = {7547} , side_A_name = "攻方" , side_A_scene_param = 7654 , side_B_name = "守方" , side_B_scene_param = 7655 , self_score_repu = 218 , special_id = 0}
	config[117] = {instance_tid = 0,activity = {7704,7711} , side_A_name = "紅方" , side_A_scene_param = 7655 , side_B_name = "藍方" , side_B_scene_param = 7656 , self_score_repu = 0 , special_id = 0}
	config[118] = {instance_tid = 0,activity = {7704,7711} , side_A_name = "紅方" , side_A_scene_param = 7655 , side_B_name = "藍方" , side_B_scene_param = 7656 , self_score_repu = 0 , special_id = 0}
	config[119] = {instance_tid = 0,activity = {7704,7711} , side_A_name = "紅方" , side_A_scene_param = 7655 , side_B_name = "藍方" , side_B_scene_param = 7656 , self_score_repu = 0 , special_id = 0}
	config[1540] = {instance_tid = 7687,activity = {} , side_A_name = "白隊" , side_A_scene_param = 101 , side_B_name = "黑隊" , side_B_scene_param = 102 , self_score_repu = 0 , special_id = 0}
	config[120] = {instance_tid = 0,activity = {} , side_A_name = "紅方" , side_A_scene_param = 7655 , side_B_name = "藍方" , side_B_scene_param = 7656 , self_score_repu = 0 , special_id = 1}
	config[121] = {instance_tid = 0,activity = {} , side_A_name = "紅方" , side_A_scene_param = 7655 , side_B_name = "藍方" , side_B_scene_param = 7656 , self_score_repu = 0 , special_id = 1}
	config[122] = {instance_tid = 0,activity = {} , side_A_name = "紅方" , side_A_scene_param = 7655 , side_B_name = "藍方" , side_B_scene_param = 7656 , self_score_repu = 0 , special_id = 1}

	function Class:GetConfig (which)
		return config[which]
	end
end
