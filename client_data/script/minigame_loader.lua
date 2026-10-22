--[[#tag push auto]]

-- 文件说明：小游戏配置脚本

local PLUN = function (v) return v or true end
--~ local PLUN = loadfile "test/plun.lua" "script/minigame_loader.lua"

local MiniGameLoader =
{
}

-- 游戏种类列表
local MiniGameList =
{
	LLK = 1,	-- 连连看

	BSZ = 2,	-- 宝石阵		LLK_S2 = 3,	-- 连连看(第2套资源)

	BSZ_S2 = 4,		-- 宝石阵(第2套资源)
}

-- 游戏参数
local MiniGameData =
{
	-- 参考 Win_TGllkGame:GetDefaultParam ()
	[MiniGameList.LLK] =
	{
		[1] =
		{
			timeLimit = 40000,		-- 时间限制(亳秒)
			title = --[[!AUTO_1]]"井井有條",		-- 标题
			mapSize = {width = 6, height = 4}, -- 矩阵大小(不含边缘空白)
			cardType = 1,			-- 哪一套图案
			--cardCount = 24,			-- 图案种类数，暂时无效，实际种类数为 width*height/4

			hintCount = 4,			-- 提示数量
			washCount = 2,			-- 洗牌数量

			rewardTime = 2000,		-- 消除一次增加的时间
			punishCount = 3,		-- 引起时间惩罚的连续错误次数

			punishTime = 5000,		-- 时间惩罚量(亳秒)
			realignType = 1,		-- 消除后剩余方块的移动方式
				-- 1 保持原地, 2 向下边界落去, 3 向左边界落去, 4 向上下两边从中间分开, 5 向左右两边分开
				-- 6 向中间行收缩, 7 列向中间聚拢, 8 一半一半，行向左右两边移动, 9 一半一半，列向上下两边移动
				-- 10 向外扩散，左右优先, 11 向内聚拢，左右优先

		};
                [2] =
		{
			timeLimit = 40000,		-- 时间限制(亳秒)
			title = --[[!AUTO_2]]"藥材大作戰",		-- 标题
			mapSize = {width = 6, height = 4}, -- 矩阵大小(不含边缘空白)
			cardType = 1,			-- 哪一套图案
			--cardCount = 24,			-- 图案种类数，暂时无效，实际种类数为 width*height/4

			hintCount = 1,			-- 提示数量
			washCount = 2,			-- 洗牌数量

			rewardTime = 1000,		-- 消除一次增加的时间
			punishCount = 3,		-- 引起时间惩罚的连续错误次数

			punishTime = 5000,		-- 时间惩罚量(亳秒)
			realignType = 1,		-- 消除后剩余方块的移动方式
				-- 1 保持原地, 2 向下边界落去, 3 向左边界落去, 4 向上下两边从中间分开, 5 向左右两边分开
				-- 6 向中间行收缩, 7 列向中间聚拢, 8 一半一半，行向左右两边移动, 9 一半一半，列向上下两边移动
				-- 10 向外扩散，左右优先, 11 向内聚拢，左右优先

		};
		[3] =
		{
			timeLimit = 30000,		-- 时间限制(亳秒)
			title = --[[!AUTO_3]]"藥材大作戰之找你妹",		-- 标题
			mapSize = {width = 8, height = 6}, -- 矩阵大小(不含边缘空白)
			cardType = 1,			-- 哪一套图案
			--cardCount = 24,			-- 图案种类数，暂时无效，实际种类数为 width*height/4

			hintCount = 1,			-- 提示数量
			washCount = 1,			-- 洗牌数量

			rewardTime = 1000,		-- 消除一次增加的时间
			punishCount = 3,		-- 引起时间惩罚的连续错误次数

			punishTime = 5000,		-- 时间惩罚量(亳秒)
			realignType = 1,		-- 消除后剩余方块的移动方式
				-- 1 保持原地, 2 向下边界落去, 3 向左边界落去, 4 向上下两边从中间分开, 5 向左右两边分开
				-- 6 向中间行收缩, 7 列向中间聚拢, 8 一半一半，行向左右两边移动, 9 一半一半，列向上下两边移动
				-- 10 向外扩散，左右优先, 11 向内聚拢，左右优先

		};
		[4] =
		{
			timeLimit = 40000,		-- 时间限制(亳秒)
			title = --[[!AUTO_1]]"分門別類",		-- 标题
			mapSize = {width = 8, height = 6}, -- 矩阵大小(不含边缘空白)
			cardType = 1,			-- 哪一套图案
			--cardCount = 24,			-- 图案种类数，暂时无效，实际种类数为 width*height/4

			hintCount = 1,			-- 提示数量
			washCount = 1,			-- 洗牌数量

			rewardTime = 1000,		-- 消除一次增加的时间
			punishCount = 3,		-- 引起时间惩罚的连续错误次数


			punishTime = 5000,		-- 时间惩罚量(亳秒)
			realignType = 10,		-- 消除后剩余方块的移动方式
				-- 1 保持原地, 2 向下边界落去, 3 向左边界落去, 4 向上下两边从中间分开, 5 向左右两边分开
				-- 6 向中间行收缩, 7 列向中间聚拢, 8 一半一半，行向左右两边移动, 9 一半一半，列向上下两边移动
				-- 10 向外扩散，左右优先, 11 向内聚拢，左右优先


		};
	};

	-- 参考 Win_MiniGameBSZ:GetDefaultParam ()
	[MiniGameList.BSZ] =
	{
		[1] =
		{
			title = --[[!AUTO_4]]"玉石俱焚", 		-- 窗口标题
			timeLimit = 40000,			-- 初始时间
			cardType = 1,			-- 哪一套图案
			itemRates = {1, 1, 1, 1, 0, 0, 0},		-- 每一种方块的出现概率，风林火山阴雷元
			targetScore = 3000,		-- 过关所需分数
			scoreRewards = {0, 0, 300, 500, 800, 1300, 2100, 3400, 5500, 8900},		-- 消除N个得到的总分
			timeRewards = {0, 0, 1000, 2000, 4000},	-- 消除N个增加的时间
			hintCount = 4,			-- 提示数量
			washCount = 2,			-- 重排数量
		};
                [2] =
		{
			title = --[[!AUTO_5]]"初級寶石迷陣", 		-- 窗口标题
			timeLimit = 40000,			-- 初始时间
			cardType = 1,			-- 哪一套图案
			itemRates = {1, 1, 1, 1, 0, 0, 0},		-- 每一种方块的出现概率，风林火山阴雷元
			targetScore = 5000,		-- 过关所需分数
			scoreRewards = {0, 0, 300, 500, 800, 1300, 2100, 3400, 5500, 8900},		-- 消除N个得到的总分
			timeRewards = {0, 0, 1000, 2000, 4000},	-- 消除N个增加的时间
			hintCount = 4,			-- 提示数量
			washCount = 2,			-- 重排数量
		};
                [3] =
		{
			title = --[[!AUTO_6]]"中級寶石迷陣", 		-- 窗口标题
			timeLimit = 80000,			-- 初始时间
			cardType = 1,			-- 哪一套图案
			itemRates = {1, 1, 1, 1, 1, 0, 0},		-- 每一种方块的出现概率，风林火山阴雷元
			targetScore = 8000,		-- 过关所需分数
			scoreRewards = {0, 0, 300, 500, 800, 1300, 2100, 3400, 5500, 8900},		-- 消除N个得到的总分
			timeRewards = {0, 0, 1000, 2000, 4000},	-- 消除N个增加的时间
			hintCount = 4,			-- 提示数量
			washCount = 2,			-- 重排数量
		};
		[4] =
		{
			title = --[[!AUTO_7]]"中級寶石迷陣", 		-- 窗口标题
			timeLimit = 80000,			-- 初始时间
			cardType = 1,			-- 哪一套图案
			itemRates = {1, 1, 1, 1, 1, 1, 0},		-- 每一种方块的出现概率，风林火山阴雷元
			targetScore = 8000,		-- 过关所需分数
			scoreRewards = {0, 0, 300, 500, 800, 1300, 2100, 3400, 5500, 8900},		-- 消除N个得到的总分
			timeRewards = {0, 0, 1000, 2000, 4000},	-- 消除N个增加的时间
			hintCount = 4,			-- 提示数量
			washCount = 2,			-- 重排数量
		};
		[5] =
		{
			title = --[[!AUTO_8]]"高級寶石迷陣", 		-- 窗口标题
			timeLimit = 80000,			-- 初始时间
			cardType = 1,			-- 哪一套图案
			itemRates = {1, 1, 1, 1, 1, 1, 0},		-- 每一种方块的出现概率，风林火山阴雷元
			targetScore = 10000,		-- 过关所需分数
			scoreRewards = {0, 0, 300, 500, 800, 1300, 2100, 3400, 5500, 8900},		-- 消除N个得到的总分
			timeRewards = {0, 0, 1000, 2000, 4000},	-- 消除N个增加的时间
			hintCount = 4,			-- 提示数量
			washCount = 2,			-- 重排数量
		};
		[6] =
		{
			title = --[[!AUTO_9]]"終極寶石迷陣", 		-- 窗口标题
			timeLimit = 100000,			-- 初始时间
			cardType = 1,			-- 哪一套图案
			itemRates = {1, 1, 1, 1, 1, 1, 1},		-- 每一种方块的出现概率，风林火山阴雷元
			targetScore = 10000,		-- 过关所需分数
			scoreRewards = {0, 0, 300, 500, 800, 1300, 2100, 3400, 5500, 8900},		-- 消除N个得到的总分
			timeRewards = {0, 0, 1000, 2000, 4000},	-- 消除N个增加的时间
			hintCount = 4,			-- 提示数量
			washCount = 2,			-- 重排数量
		};
	};
	
	-- 参考 Win_TGllkGame:GetDefaultParam ()
	[MiniGameList.LLK_S2] =
	{
		[5] =
		{
			timeLimit = 40000,		-- 时间限制(亳秒)
			title = "普通關",		-- 标题
			mapSize = {width = 7, height = 6}, -- 矩阵大小(不含边缘空白)
			cardType = 2,			-- 哪一套图案
			--cardCount = 24,			-- 图案种类数，暂时无效，实际种类数为 width*height/4

			hintCount = 1,			-- 提示数量
			washCount = 1,			-- 洗牌数量

			rewardTime = 1000,		-- 消除一次增加的时间
			punishCount = 3,		-- 引起时间惩罚的连续错误次数

			punishTime = 5000,		-- 时间惩罚量(亳秒)
			realignType = 1,		-- 消除后剩余方块的移动方式
				-- 1 保持原地, 2 向下边界落去, 3 向左边界落去, 4 向上下两边从中间分开, 5 向左右两边分开
				-- 6 向中间行收缩, 7 列向中间聚拢, 8 一半一半，行向左右两边移动, 9 一半一半，列向上下两边移动
				-- 10 向外扩散，左右优先, 11 向内聚拢，左右优先

		};
		[6] =
		{
			timeLimit = 50000,		-- 时间限制(亳秒)
			title = "高手關",		-- 标题
			mapSize = {width = 8, height = 6}, -- 矩阵大小(不含边缘空白)
			cardType = 2,			-- 哪一套图案
			--cardCount = 24,			-- 图案种类数，暂时无效，实际种类数为 width*height/4

			hintCount = 3,			-- 提示数量
			washCount = 1,			-- 洗牌数量

			rewardTime = 900,		-- 消除一次增加的时间
			punishCount = 3,		-- 引起时间惩罚的连续错误次数


			punishTime = 5000,		-- 时间惩罚量(亳秒)
			realignType = 6,		-- 消除后剩余方块的移动方式
				-- 1 保持原地, 2 向下边界落去, 3 向左边界落去, 4 向上下两边从中间分开, 5 向左右两边分开
				-- 6 向中间行收缩, 7 列向中间聚拢, 8 一半一半，行向左右两边移动, 9 一半一半，列向上下两边移动
				-- 10 向外扩散，左右优先, 11 向内聚拢，左右优先


		};
                [7] =
		{
			timeLimit = 80000,		-- 时间限制(亳秒)
			title = "大神關",		-- 标题
			mapSize = {width =8, height = 8}, -- 矩阵大小(不含边缘空白)
			cardType = 2,			-- 哪一套图案
			--cardCount = 2,			-- 图案种类数，暂时无效，实际种类数为 width*height/4

			hintCount = 1,			-- 提示数量
			washCount = 1,			-- 洗牌数量

			rewardTime = 1000,		-- 消除一次增加的时间
			punishCount = 3,		-- 引起时间惩罚的连续错误次数


			punishTime = 5000,		-- 时间惩罚量(亳秒)
			realignType = 11,		-- 消除后剩余方块的移动方式
				-- 1 保持原地, 2 向下边界落去, 3 向左边界落去, 4 向上下两边从中间分开, 5 向左右两边分开
				-- 6 向中间行收缩, 7 列向中间聚拢, 8 一半一半，行向左右两边移动, 9 一半一半，列向上下两边移动
				-- 10 向外扩散，左右优先, 11 向内聚拢，左右优先


		};
	};
	
		-- 参考 Win_MiniGameBSZ:GetDefaultParam ()
	[MiniGameList.BSZ_S2] =
	{
		[7] =
		{
			title = "萌寵消消樂", 		-- 窗口标题
			timeLimit = 90000,			-- 初始时间
			cardType = 2,			-- 哪一套图案
			itemRates = {1, 1, 1, 1, 1, 1, 0.5},		-- 每一种方块的出现概率，风林火山阴雷元
			targetScore = 10000,		-- 过关所需分数
			scoreRewards = {0, 0, 300, 500, 800, 1300, 2100, 3400, 5500, 8900},		-- 消除N个得到的总分
			timeRewards = {0, 0, 1000, 2000, 4000},	-- 消除N个增加的时间
			hintCount = 4,			-- 提示数量
			washCount = 2,			-- 重排数量
		};
	}
}

function MiniGameLoader:StartMiniGame (gameId, paramId, resultCallBack)
	local miniGame = MiniGameData[gameId]
	if miniGame == nil then
		return	-- 无效的游戏ID
	end

	local param = miniGame[paramId]
	if param == nil then
		return	-- 无效的配置ID
	end

	if gameId == MiniGameList.LLK then
		DlgApi.ShowDialog(--[[!AUTO_10]]"Win_TGllkGame", true)
		Win_TGllkGame:StartGame(param, resultCallBack)
	elseif gameId == MiniGameList.LLK_S2 then
		DlgApi.ShowDialog("Win_TGllkGame2014", true)
		Win_TGllkGame2014:StartGame(param, resultCallBack)
	elseif gameId == MiniGameList.BSZ then
		DlgApi.ShowDialog(--[[!AUTO_11]]"Win_MiniGameBSZ", true)
		Win_MiniGameBSZ:StartGame(param, resultCallBack)
	elseif gameId == MiniGameList.BSZ_S2 then
		DlgApi.ShowDialog(--[[!AUTO_11]]"Win_minigamebsmc", true)
		Win_minigamebsmc:StartGame(param, resultCallBack)
	else
		-- 无效的游戏ID
	end
end

function MiniGameLoader:StartTaskMiniGame (idTask, idGame, idParam)
	local function MiniGameCallBack (result)
		GameApi.NotifyTinyGameFinish(idTask,idGame,idParam, result==--[[!AUTO_12]]"success")
	end

	self:StartMiniGame(idGame, idParam, MiniGameCallBack)
end

_G.MiniGameLoader = PLUN(MiniGameLoader, --[[!AUTO_13]]"MiniGameLoader")
