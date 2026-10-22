local DlgTemplate = DlgTemplate or {new = function () return {} end}
local DlgApi  = DlgApi
local pairs = pairs
local assert = assert
local type = type

Win_DeclareWar = DlgTemplate:new({this = "Win_DeclareWar"})

do
	local Class = Win_DeclareWar
	local Name = "Win_DeclareWar"
	
	-- Boss 配置
	local config =
	{
	--[[
		{	--例
			task = 8606,
			defeat = nil,	--nil 表示默认值 4
		}
	]]
		{ task = 8606, },
		{ task = 8607, },
		{ task = 8608, },
		{ task = 8609, },
		{ task = 8610, },	--#5
		{ task = 8611, },
		{ task = 8612, },
		{ task = 8613, },
		{ task = 8614, },
		{ task = 8615, },	--#10
		{ task = 8616, },
		{ task = 8617, },
		{ task = 8618, defeat = 5 },
		{ task = 8619, },
		{ task = 8620, },	--#15
		{ task = 8621, },
		{ task = 8622, },
	}
	
	--界面显示的 Boss 数量
	function Class:GetBossCount ()
		return #config
	end
	
	--Boss 对应的场景参数 id. bossIndex: 1 ~ GetBossCount()
	function Class:GetSceneParamId (bossIndex)
		return 201 + bossIndex - 1
	end

	--Boss 对应的任务 id
	function Class:GetTaskId (bossIndex)
		return config[bossIndex].task
	end

	--击败 Boss 后，场景参数的值
	function Class:GetDefeatedSceneParamValue (bossIndex)
		return config[bossIndex].defeat or 4		-- config 表中未配置则为 4
	end
end
