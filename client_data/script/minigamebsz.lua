--[[#tag push auto]]

-- 文件名:	MiniGameBSZ.lua
-- 描述:	小游戏 宝石阵
-- 创建者:	xu gang

--执行界面所需脚本逻辑 (这一份代码要在多个界面中使用)
function InitInterface_MiniGameBsz (dialogName)
	local PLUN = function (v) return v or true end
	--~ local PLUN = loadfile "test/plun.lua" "script/MiniGameBSZ.lua" -- 仅用于调试，调试完毕注释此行
	local unused = --[[!AUTO_1]]"unused\024\0\0\0\0\0"		-- 未使用标记



	local pairs = pairs
	local mathrandom = math.random
	local mathfloor = math.floor
	local mathsin = math.sin
	local mathpi = math.pi
	local assert = assert

	local MiniGameApi = MiniGameApi
	--原先为 local Win_MiniGameBSZ = DlgTemplate and DlgTemplate:new({this = --[[!AUTO_2]]"Win_MiniGameBSZ"}) or {this = --[[!AUTO_3]]"Win_MiniGameBSZ"}
	local Dlg_MiniGameBSZ = DlgTemplate and DlgTemplate:new({this = dialogName}) or {this =dialogName}

	local function TEXT (v) return v end		-- 文本标记，界面文本用这个函数标记
	local function PATH (v) return v end		-- 路径标记，文件文本用这个函数标记

	-- 物块类


	local Item =
	{}
	Item.__index = Item

	function Item.new (Class, kind)
		local obj = setmetatable({}, Class)

		obj.m_kind = kind			-- 1~7
		obj.m_x = 0					-- 左下为 (0, 0), 单位为格
		obj.m_y = 0
		obj.m_state = --[[!AUTO_4]]"normal"		-- 状态有："normal"(可落下), "exchange"(交换中，不可落下), "disappear"(消失中，不可落下)

		obj.m_speedX = 0			-- 未使用


		obj.m_speedY = 0			-- 方向向下

		return obj
	end

	-- 格子类


	local Grid =
	{}
	Grid.__index = Grid

	function Grid.new (Class)
		local obj = setmetatable({}, Class)

		obj.m_state = --[[!AUTO_5]]"free"		-- 状态有："free"(未被占据，不一定全空), "hold"(被占据), "lock"(不可选择)
		obj.m_item = unused

		return obj
	end

	function Grid:reset ()
		self.m_state = --[[!AUTO_6]]"free"
		self.m_item = unused
	end

	function Grid:getHoldItem ()
		if self.m_state == --[[!AUTO_7]]"hold" then
			local item = self.m_item
			if item ~= unused then
				return item
			end
		end
	end

	-- 游戏棋盘类(包含格子)
	local Board_ =
	{}
	Board_.__index = Board_

	function Board_.new (Class, colCount, rowCount)		-- x, y: 左下坐标
		local obj = setmetatable({}, Class)
		obj.m_colCount = colCount
		obj.m_rowCount = rowCount

		for iCol = 1, colCount do		-- 填充 colCount * (rowCount+1) 的矩阵，最上一排不显示
			local col = {}
			obj[iCol] = col

			for iRow = 1, rowCount + 1 do
				col[iRow] = Grid:new()
			end
		end

		return obj
	end

	function Board_:reset ()
		local colCount = self.m_colCount
		local rowCount = self.m_rowCount

		for iCol = 1, colCount do
			for iRow = 1, rowCount + 1 do
				local grid = self[iCol][iRow]
				grid:reset()
			end
		end
	end

	-- 假定在 (iCol, iRow) 设置种类为 kind 的物块


	--	如果 kind 为空，则取此位置的当前物块


	function Board_:canEliminate (iCol, iRow, kind)
		local colCount = self.m_colCount
		local rowCount = self.m_rowCount

		if iCol <= 0 or iCol > colCount or iRow <=0 or iRow > rowCount then
			return false
		end

		if not kind then
			local grid = self[iCol][iRow]
			local item = grid:getHoldItem()
			if item then
				kind = item.m_kind
			end
		end

		if not kind then
			return false
		end

		do	-- 纵向检查


			local fitCount = 1

			-- 向下检查


			for i = iRow - 1, 1, -1 do
				local grid = self[iCol][i]
				local item = grid:getHoldItem()
				if item and item.m_kind == kind then
					fitCount = 1 + fitCount
				else
					break
				end
			end

			-- 向上检查


			for i = iRow + 1, rowCount do
				local grid = self[iCol][i]
				local item = grid:getHoldItem()
				if item and item.m_kind == kind then
					fitCount = 1 + fitCount
				else
					break
				end
			end

			if fitCount >= 3 then
				return true
			end
		end

		do	-- 横向检查


			local fitCount = 1

			-- 向左检查


			for i = iCol - 1, 1, -1 do
				local grid = self[i][iRow]
				local item = grid:getHoldItem()
				if item and item.m_kind == kind then
					fitCount = 1 + fitCount
				else
					break
				end
			end

			-- 向右检查


			for i = iCol + 1, rowCount do
				local grid = self[i][iRow]
				local item = grid:getHoldItem()
				if item and item.m_kind == kind then
					fitCount = 1 + fitCount
				else
					break
				end
			end

			if fitCount >= 3 then
				return true
			end
		end

		return false
	end

	function Board_:checkEliminate(iCol, iRow)
		if not self:canEliminate(iCol, iRow) then
			return nil
		end

		local colCount = self.m_colCount
		local rowCount = self.m_rowCount

		local grid = self[iCol][iRow]
		local item = grid:getHoldItem()
		if item == nil then
			return nil
		end
		local kind = item.m_kind

		local vMatch = {}
		local hMatch = {}

		do	-- 纵向检查


			-- 向下检查


			for i = iRow - 1, 1, -1 do
				local grid = self[iCol][i]
				local item = grid:getHoldItem()
				if item and item.m_kind == kind then
					vMatch[#vMatch+1] = {iCol = iCol, iRow = i}
				else
					break
				end
			end

			-- 向上检查


			for i = iRow + 1, rowCount do
				local grid = self[iCol][i]
				local item = grid:getHoldItem()
				if item and item.m_kind == kind then
					vMatch[#vMatch+1] = {iCol = iCol, iRow = i}
				else
					break
				end
			end
		end

		do	-- 横向检查


			-- 向左检查


			for i = iCol - 1, 1, -1 do
				local grid = self[i][iRow]
				local item = grid:getHoldItem()
				if item and item.m_kind == kind then
					hMatch[#hMatch+1] = {iCol = i, iRow = iRow}
				else
					break
				end
			end

			-- 向右检查


			for i = iCol + 1, rowCount do
				local grid = self[i][iRow]
				local item = grid:getHoldItem()
				if item and item.m_kind == kind then
					hMatch[#hMatch+1] = {iCol = i, iRow = iRow}
				else
					break
				end
			end
		end

		local result = { {iCol = iCol, iRow = iRow}, }
		if #vMatch >= 2 then
			for i = 1, #vMatch do
				result[#result+1] = vMatch[i]
			end
		end
		if #hMatch >= 2 then
			for i = 1, #hMatch do
				result[#result+1] = hMatch[i]
			end
		end
		assert(#result > 0)
		return result
	end

	local function getRandomKind (rates)
		local sum = 0
		for i = 1, #rates do
			sum = sum + rates[i]
		end

		local r = mathrandom()		-- 0~1
		for i = 1, #rates do
			local rate = rates[i]
			if rate > 0 then
				r = r - rate/sum
				if r <= 0 then
					return i
				end
			end
		end

		for i = #rates, 1, -1 do	-- 未找到？返回最后一个非0序号
			if rates[i] > 0 then
				return i
			end
		end

		return #rates
	end

	function Board_:generateRandomBoard (rates)
		local currentRates = {}

		local colCount = self.m_colCount
		local rowCount = self.m_rowCount

		for iCol = 1, colCount do
			for iRow = 1, rowCount do
				local grid = self[iCol][iRow]
				assert(grid)

				-- 检查此格会消除的物块种类，设置生成概率
				for kind = 1, #rates do
					local rate = rates[kind]

					if rate == 0 or self:canEliminate(iCol, iRow, kind) then
						currentRates[kind] = 0
					else
						currentRates[kind] = rates[kind]
					end
				end

				local kind = getRandomKind(currentRates)
				local item = Item:new(kind)
				item.m_x = iCol - 1
				item.m_y = iRow - 1

				grid.m_item = item
				grid.m_state = --[[!AUTO_8]]"hold"
			end
		end
	end

	-- x, y 单位为格
	function Board_:getGridAtPos (x, y)
		local colCount = self.m_colCount
		local rowCount = self.m_rowCount

		local iCol = mathfloor(x+1)
		local iRow = mathfloor(y+1)

		if iCol <= 0 or iCol > colCount or iRow <=0 or iRow > rowCount then
			return nil, nil, nil
		else
			local grid = self[iCol][iRow]
			assert(grid)
			return grid, iCol, iRow
		end
	end

	function Board_:isAllHold ()
		local colCount = self.m_colCount
		local rowCount = self.m_rowCount

		for iCol = 1, colCount do
			local col = self[iCol]
			for iRow = 1, rowCount do
				if col[iRow].m_state ~= --[[!AUTO_9]]"hold" then
					return false
				end
			end
		end
		return true
	end

	function Board_:print ()
		-- row = rowCount + 1
		local colCount = self.m_colCount
		local rowCount = self.m_rowCount

		local strs = {}

		local function addRow (iRow)
			for i = 1, colCount do
				local grid = self[i][iRow]
				local item = grid.m_item
				local kind = item~= unused and item.m_kind or --[[!AUTO_10]]" "
				if grid.m_state == --[[!AUTO_11]]"hold" then
					strs[#strs+1] = --[[!AUTO_12]]'['..kind..--[[!AUTO_13]]']'
				elseif grid.m_state == --[[!AUTO_14]]"free" then
					strs[#strs+1] = --[[!AUTO_15]]' '..kind..--[[!AUTO_16]]' '
				elseif grid.m_state == --[[!AUTO_17]]"lock" then
					strs[#strs+1] = --[[!AUTO_18]]'+'..kind..--[[!AUTO_19]]'+'
				else
					assert(false)
				end
			end
			strs[#strs+1] = --[[!AUTO_20]]'\n'
		end

		addRow(rowCount + 1)
		strs[#strs+1] = (--[[!AUTO_21]]'---'):rep(colCount)
		strs[#strs+1] = --[[!AUTO_22]]'\n'

		for i = rowCount, 1, -1 do
			addRow(i)
		end

		print(table.concat(strs))
	end

	local Board = PLUN(Board_, --[[!AUTO_23]]"Board")

	-- action 管理器


	local ActionManager =
	{}
	ActionManager.__index = ActionManager

	function ActionManager.new (Class)
		local obj = setmetatable({}, Class)
		obj.m_actions = {}
		return obj
	end

	function ActionManager:addAction (action)
		self.m_actions[action] = true
	end

	function ActionManager:isActionExist (action)
		return self.m_actions[action] == true
	end

	function ActionManager:removeAction (action)
		return self.m_actions[action] == nil
	end

	function ActionManager:tick (dtime)
		local actions = self.m_actions

		for action, flag in pairs(actions) do
			if flag then
				local ret = action(dtime)
				if ret == --[[!AUTO_24]]"end" then
					actions[action] = false
				end
			end
		end

		for action, flag in pairs(actions) do
			if not flag then
				actions[action] = nil
			end
		end
	end

	-- 图像缓冲
	local GraphicBuffer =
	{}
	GraphicBuffer.__index = GraphicBuffer

	function GraphicBuffer.new (Class)
		local obj = setmetatable({}, Class)
		obj.m_buffer = {}
		return obj
	end

	function GraphicBuffer:addImage(image, x, y, alpha)
		local buffer = self.m_buffer
		buffer[#buffer+1] = function ()
			MiniGameApi.GraphicsDrawImage(image, x, y, alpha)
		end
	end

	function GraphicBuffer:add (func)
		local buffer = self.m_buffer
		buffer[#buffer+1] = func()
	end

	function GraphicBuffer:render ()
		local buffer = self.m_buffer
		for i = 1, #buffer do
			buffer[i]()
		end
		for i = #buffer, 1, -1 do
			buffer[i] = nil
		end
	end

	--
	-- 游戏参数
	--
	function Dlg_MiniGameBSZ:GetDefaultParam ()
		return
		{
			title = TEXT--[[!AUTO_25]]"小游戏", 		-- 窗口标题
			timeLimit = 40000,			-- 初始时间
			cardType = 1,				-- 哪一种图案
			itemRates = {1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0},		-- 每一种方块的出现概率，风林火山阴雷元
			targetScore = 2000,		-- 过关所需分数
			scoreRewards = {0, 0, 300, 500, 800, 1300, 2100, 3400, 5500, 8900},		-- 消除N个得到的总分
			timeRewards = {0, 0, 1000, 2000, 4000},	-- 消除N个增加的时间
			hintCount = 4,			-- 提示数量
			washCount = 2,			-- 重排数量

			-- 以下暂不应配置


			boardSize = {width = 8, height = 8},
			boardPos = {x = 0, y = 384},
			gridSize = {width = 48, height = 48},
			itemSize = {width = 48, height = 48},

			gravity = 18,		-- 重力加速度，格/秒^2
			maxSpeed = 10,		-- 下落速度上限，格/秒



			eliminateTimeLength = 500,
			exchangeTimeLength = 350,

			hintTimeLength = 2000,
		}
	end

	local gameParam
	local gameResultCallback		-- gameResultCallback(result), result = "success" or "fail"
	local gameState = --[[!AUTO_26]]"stop"		-- game states: "stop", "run", "success", "fail"
	local gameData =
	{
		graphics = 0,
		score = 0,
		leftTime = 0,			-- 毫秒
		board = unused,			-- 游戏棋盘
		select = {iCol=unused, iRow=unused},			-- 选中的格子


		bSoundOn = true,		-- 声音打开

		exchangeGraphicBuffer = unused,	-- 交换图像

		currentHintCount = 0,	-- 剩余提示次数
		currentWashCount = 0,	-- 剩余重排次数
		score = 0,				-- 当前得分
		leftTime = 0,			-- 剩余时间(毫秒)
	}
	local gameActionManager = ActionManager:new()

	local function transPosGameToBoard (gameX, gameY)
		local boardPosX = gameParam.boardPos.x
		local boardPosY = gameParam.boardPos.y

		return gameX - boardPosX, boardPosY - gameY
	end

	local function transPosGameToGrid (gameX, gameY)
		local boardPosX = gameParam.boardPos.x
		local boardPosY = gameParam.boardPos.y
		local gridWidth = gameParam.gridSize.width
		local gridHeight = gameParam.gridSize.height

		return (gameX - boardPosX) / gridWidth, (boardPosY - gameY) / gridHeight
	end

	local function transPosBoardToGame (boardX, boardY)
		local boardPosX = gameParam.boardPos.x
		local boardPosY = gameParam.boardPos.y

		return boardPosX + boardX, boardPosY - boardY
	end

	local function transPosGridToGame (gridX, gridY)
		local boardPosX = gameParam.boardPos.x
		local boardPosY = gameParam.boardPos.y
		local gridWidth = gameParam.gridSize.width
		local gridHeight = gameParam.gridSize.height

		return boardPosX + gridX * gridWidth, boardPosY - gridY * gridHeight
	end

	function Dlg_MiniGameBSZ:StartGame (param, resultCallback)
		gameParam = self:GetDefaultParam()
		if param then
			for name, value in pairs(param) do
				if value then
					gameParam[name] = value
				end
			end
		end

		gameResultCallback = resultCallback

		-- 初始化数据
		gameData.cardType = gameParam.cardType
		self:LoadResource()

		gameData.title = gameParam.title
		gameData.leftTime = gameParam.timeLimit
		gameData.board = Board:new(gameParam.boardSize.width, gameParam.boardSize.height)
		gameData.board:reset()
		gameData.board:generateRandomBoard (gameParam.itemRates)
		gameData.exchangeGraphicBuffer = GraphicBuffer:new()

		gameData.currentHintCount = gameParam.hintCount
		gameData.currentWashCount = gameParam.washCount
		gameData.score = 0
		gameData.leftTime = gameParam.timeLimit

		gameActionManager:tick(0)

		self:SetUIMode(--[[!AUTO_27]]"game")
		gameState = --[[!AUTO_28]]"run"

		if self:CheckHint() then
			self:SetInfoText(--[[!AUTO_29]]"")
		end
		self:UpdateUI()
	end

	function Dlg_MiniGameBSZ:EndGame (result, textInfo)
		self:Select(nil, nil)
		self:UpdateUI()

		if gameResultCallback then
			if result == --[[!AUTO_30]]"success" then
				gameResultCallback(--[[!AUTO_31]]"success")
			else
				gameResultCallback(--[[!AUTO_32]]"fail")
			end
			gameResultCallback = nil
		end

		if result and gameState == --[[!AUTO_33]]"run" then
			if result == --[[!AUTO_34]]"success" then
				gameState = --[[!AUTO_35]]"success"
				DlgApi.SetItemText(self.this, --[[!AUTO_36]]"Txt_Result", TEXT--[[!AUTO_37]]"恭喜你，游戏成功！")
			elseif result == --[[!AUTO_38]]"fail" then
				gameState = --[[!AUTO_39]]"fail"
				DlgApi.SetItemText(self.this, --[[!AUTO_40]]"Txt_Result", TEXT--[[!AUTO_41]]"游戏失败")
			end
		else
			gameState = --[[!AUTO_42]]"stop"
		end

		self:SetUIMode(--[[!AUTO_43]]"result")
		if textInfo then
			DlgApi.SetItemText(self.this, --[[!AUTO_44]]"Txt_Result", textInfo)
		end
	end

	local imageResList = {}
	imageResList[1] =
	{
		item1 = PATH--[[!AUTO_45]]"xajh\\小游戏相关\\宝石迷阵\\icon\\风.tga",
		item2 = PATH--[[!AUTO_46]]"xajh\\小游戏相关\\宝石迷阵\\icon\\林.tga",
		item3 = PATH--[[!AUTO_47]]"xajh\\小游戏相关\\宝石迷阵\\icon\\火.tga",
		item4 = PATH--[[!AUTO_48]]"xajh\\小游戏相关\\宝石迷阵\\icon\\山.tga",
		item5 = PATH--[[!AUTO_49]]"xajh\\小游戏相关\\宝石迷阵\\icon\\阴.tga",
		item6 = PATH--[[!AUTO_50]]"xajh\\小游戏相关\\宝石迷阵\\icon\\闪电.tga",
		item7 = PATH--[[!AUTO_51]]"xajh\\小游戏相关\\宝石迷阵\\icon\\元.tga",
	}
	imageResList[2] =
	{
		item1 = PATH--[[!AUTO_45]]"xajh\\小游戏相关\\宝石消除\\icon\\宝石1.tga",
		item2 = PATH--[[!AUTO_46]]"xajh\\小游戏相关\\宝石消除\\icon\\宝石2.tga",
		item3 = PATH--[[!AUTO_47]]"xajh\\小游戏相关\\宝石消除\\icon\\宝石3.tga",
		item4 = PATH--[[!AUTO_48]]"xajh\\小游戏相关\\宝石消除\\icon\\宝石4.tga",
		item5 = PATH--[[!AUTO_49]]"xajh\\小游戏相关\\宝石消除\\icon\\宝石5.tga",
		item6 = PATH--[[!AUTO_50]]"xajh\\小游戏相关\\宝石消除\\icon\\宝石6.tga",
		item7 = PATH--[[!AUTO_51]]"xajh\\小游戏相关\\宝石消除\\icon\\宝石7.tga",
	}
	local imageRes = {}

	local fontResList =
	{
		simsun_12 = {font = --[[!AUTO_52]]"宋体", size = 12},
		simsun_24 = {font = --[[!AUTO_53]]"宋体", size = 24},
	}
	local fontRes = {}

	local gfxResList =
	{
		select = {file = PATH--[[!AUTO_54]]"界面\\小游戏\\连连看选中.gfx", count = 1},		--D
		disappear = {file = PATH--[[!AUTO_55]]"界面\\小游戏\\连连看成功.gfx", count = 12},
		hint = {file = PATH--[[!AUTO_56]]"界面\\小游戏\\连连看选中.gfx", count = 1},
	}
	local gfxRes = {}

	-- 在多个重复Gfx资源中选择一个


	local function getFreeGfx (gfxName)
		local gfxs = gfxRes[gfxName]
		if gfxs and #gfxs > 0 then
			local nextIndex = gfxs.nextIndex
			-- nextIndex 从1开始


			gfxs.nextIndex = (nextIndex-1+1)%#gfxs + 1
			return gfxs[nextIndex]
		end
	end

	function Dlg_MiniGameBSZ:Init ()
		DlgApi.ShowItem(self.this, --[[!AUTO_57]]"Btn_SoundOn", false)

		self:RegisterEvent(--[[!AUTO_58]]"Btn_Abandon", function ()
			self:EndGame(--[[!AUTO_59]]"fail")
		end)
		self:RegisterEvent(--[[!AUTO_60]]"Btn_SoundOff", function ()
			gameData.bSoundOn = false
			DlgApi.ShowItem(self.this, --[[!AUTO_61]]"Btn_SoundOff", false)
			DlgApi.ShowItem(self.this, --[[!AUTO_62]]"Btn_SoundOn", true)
		end)
		self:RegisterEvent(--[[!AUTO_63]]"Btn_SoundOn", function ()
			gameData.bSoundOn = true
			DlgApi.ShowItem(self.this, --[[!AUTO_64]]"Btn_SoundOn", false)
			DlgApi.ShowItem(self.this, --[[!AUTO_65]]"Btn_SoundOff", true)
		end)
		self:RegisterEvent(--[[!AUTO_66]]"Btn_Ok", function ()
			DlgApi.ShowDialog(self.this, false)
		end)

		self:RegisterEvent(--[[!AUTO_67]]"Btn_Hint",self.OnFindHint)
		self:RegisterEvent(--[[!AUTO_68]]"Btn_Wash",self.OnReArrange)
	end

	-- 窗口显示时，加载各种资源
	function Dlg_MiniGameBSZ:ShowDialog ()
	end

	function Dlg_MiniGameBSZ:LoadResource ()
		gameData.graphics = MiniGameApi.CreateGraphics(self.this, --[[!AUTO_69]]"content")
		MiniGameApi.SetCurrentGraphics(gameData.graphics)

		for name, file in pairs(imageResList[gameData.cardType]) do
			local res = MiniGameApi.GraphicsLoadImage(file)
			imageRes[name] = res
			if res == nil or res == 0 then
				LogPrint(--[[!AUTO_70]]"MiniGame Fail to load image: ", file)
			end
		end

		for name, fontInfo in pairs(fontResList) do
			local res = MiniGameApi.GraphicsLoadFont(fontInfo.font, fontInfo.size)
			fontRes[name] = res
			if res == nil or res == 0 then
				LogPrint(--[[!AUTO_71]]"MiniGame Fail to load font: ", fontInfo.font, fontInfo.size)
			end
		end

		for name, fileInfo in pairs(gfxResList) do
			local file = fileInfo.file
			local count = fileInfo.count

			gfxRes[name] = {nextIndex = 1}
			for i = 1, count do
				local res = MiniGameApi.GraphicsLoadGfx(file)
				gfxRes[name][i]	= res
				if (res == nil or res == 0) and i == 1 then
					LogPrint(--[[!AUTO_72]]"MiniGame Fail to load gfx: ", file)
				end
			end
		end
	end

	local soundList =
	{
		select = --[[!AUTO_73]]"sfx\\select.wav",
		eliminate = --[[!AUTO_74]]"sfx\\eliminate.wav",
		gamesuccess = --[[!AUTO_75]]"sfx\\gamesuccess.wav",
		gamefail = --[[!AUTO_76]]"sfx\\gamesuccess.wav",
		wash = --[[!AUTO_77]]"sfx\\wash.wav",
	}

	function Dlg_MiniGameBSZ:PlaySound (sound)
		if gameData.bSoundOn then
			local soundFile = soundList[sound]
			if soundFile then
				MiniGameApi.PlaySound(soundFile)
			end
		end
	end

	-- 窗口显示时，释放资源
	function Dlg_MiniGameBSZ:HideDialog ()
		MiniGameApi.ReleaseGraphics(gameData.graphics)
		if gameState == --[[!AUTO_78]]"run" then
			self:EndGame(--[[!AUTO_79]]"fail")
		else
			self:EndGame()
		end
	end

	function Dlg_MiniGameBSZ:OnChangeUIMan ()
		self:HideDialog()
	end

	-- 更新时，需要调用 MiniGameApi.GraphicsTickGfx()，否则 GFX 显示不正常


	function Dlg_MiniGameBSZ:Tick (dtime)
		if gameState == --[[!AUTO_80]]"run" or gameState == --[[!AUTO_81]]"success" or gameState == --[[!AUTO_82]]"fail" then
			local board = gameData.board
			local colCount = board.m_colCount
			local rowCount = board.m_rowCount
			for iCol = 1, colCount do
				for iRow = 1, rowCount+1 do
					local grid = board[iCol][iRow]
					local item = grid.m_item

					if item ~= unused and item.m_state == --[[!AUTO_83]]"normal" then
						-- 检查下落


						if grid.m_state == --[[!AUTO_84]]"free" or grid.m_state == --[[!AUTO_85]]"hold" then
							local speed = item.m_speedY + gameParam.gravity * dtime/1000		-- 落下速度
							if speed > gameParam.maxSpeed then
								speed = gameParam.maxSpeed
							end
							item.m_speedY = speed

							local deltaY = speed * dtime/1000		-- 落下距离
							local newY = item.m_y - deltaY
							if newY < iRow - 2 then		-- 当dtime很大时，不应超出下一格范围


								newY = iRow - 2
							end

							if iRow <= 1 then		-- 底边
								if newY < 0 then	-- 撞上底边
									item.m_y = 0
									item.m_speedY = 0
									if grid.m_state ~= --[[!AUTO_86]]"hold" then
										grid.m_state = --[[!AUTO_87]]"hold"
										self:CheckEliminate (iCol, iRow)
										self:CheckHint()
									end
								else
									item.m_y = newY
								end
							else
								local nextGrid = board[iCol][iRow-1]
								assert(nextGrid)
								local nextItem = nextGrid.m_item

								if nextGrid.m_state == --[[!AUTO_88]]"free" then
									grid.m_state = --[[!AUTO_89]]"free"
									if nextItem ~= unused then
										-- 检查碰撞


										if newY < nextItem.m_y + 1 then
											item.m_y = nextItem.m_y + 1
											item.m_speedY = 0
										else
											item.m_y = newY
										end
									else		-- 下一格为空


										item.m_y = newY
										if newY <= iRow - 1 then	-- 落入下一格


											nextGrid.m_item = item
											grid:reset()
										end
									end
								else
									if newY < iRow - 1 then		-- 撞上下一格


										item.m_y = iRow - 1
										item.m_speedY = 0
										if grid.m_state ~= --[[!AUTO_90]]"hold" then
											grid.m_state = --[[!AUTO_91]]"hold"
											self:CheckEliminate (iCol, iRow)
											self:CheckHint()
										end
									else
										item.m_y = newY
									end
								end
							end
						elseif grid.m_state == --[[!AUTO_92]]"lock" then
						end
					end
				end
			end

			-- 在 iRow = rowCount + 1 创建新的物块
			for iCol = 1, colCount do
				local grid = board[iCol][rowCount+1]
				local nextGrid = board[iCol][rowCount]

				if grid.m_state == --[[!AUTO_93]]"free" and grid.m_item == unused
						and (nextGrid.m_state == --[[!AUTO_94]]"hold" or nextGrid.m_item == unused) then
					local kind = getRandomKind(gameParam.itemRates)
					local item = Item:new(kind)
					item.m_x = iCol - 1
					item.m_y = rowCount
					grid.m_item = item
					grid.m_state = --[[!AUTO_95]]"hold"
				end
			end

			if gameState == --[[!AUTO_96]]"run" then
				self:AddTime(-dtime)
			end
			self:UpdateUI()
		end

		gameActionManager:tick(dtime)

		MiniGameApi.SetCurrentGraphics(gameData.graphics)
		MiniGameApi.GraphicsTickGfx(dtime)
	end

	function Dlg_MiniGameBSZ:CheckEliminate (iCol, iRow)
		local board = gameData.board
		local elist = board:checkEliminate(iCol, iRow)
		if elist == nil then
			return false
		end

		-- 取消 hint
		local hintGfx = gfxRes.hint[1]
		MiniGameApi.GraphicsStopGfx(hintGfx)

		-- 如果需要，则取消选择
		local selCol = gameData.select.iCol
		local selRow = gameData.select.iRow
		if selCol ~= unused then
			for i = 1, #elist do
				local e = elist[i]
				if e.iCol == selCol and e.iRow == selRow then
					self:Select(nil, nil)
					break
				end
			end
		end

		for i = 1, #elist do
			local iCol = elist[i].iCol
			local iRow = elist[i].iRow
			local grid = board[iCol][iRow]
			local item = grid.m_item
			assert(item ~= unused)

			grid.m_state = --[[!AUTO_97]]"lock"
			item.m_state = --[[!AUTO_98]]"disappear"

			local timeAll = 0

			-- 消除
			local function eliminate (dtime)
				if timeAll > gameParam.eliminateTimeLength then
					grid:reset()
					return --[[!AUTO_99]]"end"
				end

				timeAll = dtime + timeAll
			end
			gameActionManager:addAction(eliminate)

			-- 显示 gfx
			local gameX, gameY = transPosGridToGame(iCol-1 + 0.5, iRow - 0.5)
			local disappearGfx = getFreeGfx(--[[!AUTO_100]]"disappear")
			MiniGameApi.GraphicsSetGfxParam(disappearGfx, gameX, gameY)
			MiniGameApi.GraphicsStartGfx(disappearGfx)

			-- 增加分数和时间


			if i == 1 then	-- 设置参数为总分
				local nEliminate = #elist

				local scoreRewards = gameParam.scoreRewards
				addedScore = nEliminate <= #scoreRewards and scoreRewards[nEliminate] or scoreRewards[#scoreRewards]
				self:AddScore(addedScore)

				local timeRewards = gameParam.timeRewards
				addedTime = nEliminate <= #timeRewards and timeRewards[nEliminate] or timeRewards[#timeRewards]
				self:AddTime(addedTime)

				self:UpdateUI()
			end
		end
		return true
	end

	function Dlg_MiniGameBSZ:Select (iCol, iRow)
		MiniGameApi.SetCurrentGraphics(gameData.graphics)

		local curSel = gameData.select
		if iCol then
			curSel.iCol = iCol
			curSel.iRow = iRow

			local gameX, gameY = transPosGridToGame(iCol-1 + 0.5, iRow - 0.5)
			MiniGameApi.GraphicsSetGfxParam(gfxRes.select[1], gameX, gameY)
			MiniGameApi.GraphicsStartGfx(gfxRes.select[1])
		else
			curSel.iCol = unused
			curSel.iRow = unused

			MiniGameApi.GraphicsStopGfx(gfxRes.select[1])
		end
	end

	function Dlg_MiniGameBSZ:Exchange (iCol1, iRow1, iCol2, iRow2)
		local board = gameData.board
		local boardPosX = gameParam.boardPos.x
		local boardPosY = gameParam.boardPos.y
		local gridWidth = gameParam.gridSize.width
		local gridHeight = gameParam.gridSize.height
		local itemWidth = gameParam.itemSize.width
		local itemHeight = gameParam.itemSize.height

		local dCol = iCol2 - iCol1
		local dRow = iRow2 - iRow1
		if (dCol == 0 and (dRow==1 or dRow==-1)) or
			   (dRow == 0 and (dCol==1 or dCol==-1)) then
		else
			return
		end

		local grid1 = board[iCol1][iRow1]
		if grid1==nil or grid1.m_state~=--[[!AUTO_101]]"hold" then
			return
		end
		local item1 = grid1.m_item
		assert(item1 ~= unused and item1.m_state == --[[!AUTO_102]]"normal")

		local grid2 = board[iCol2][iRow2]
		if grid2==nil or grid2.m_state~=--[[!AUTO_103]]"hold" then
			return
		end
		local item2 = grid2.m_item
		assert(item2 ~= unused and item2.m_state == --[[!AUTO_104]]"normal")

		grid1.m_state = --[[!AUTO_105]]"lock"
		item1.m_state = --[[!AUTO_106]]"exchange"
		grid2.m_state = --[[!AUTO_107]]"lock"
		item2.m_state = --[[!AUTO_108]]"exchange"

		local itemImages =
		{
			[1] = imageRes.item1, [2] = imageRes.item2, [3] = imageRes.item3, [4] = imageRes.item4,
			[5] = imageRes.item5, [6] = imageRes.item6, [7] = imageRes.item7,
		}

		local phase = --[[!AUTO_109]]"before"		-- "before" -> "after"
		local c = 0		-- 系数 0~1
		local function exchange (dtime)
			local dc = dtime/gameParam.exchangeTimeLength
			if phase == --[[!AUTO_110]]"before" then
				if c + dc >= 1 then		-- 判定
					grid1.m_state = --[[!AUTO_111]]"hold"
					item1.m_state = --[[!AUTO_112]]"normal"
					grid2.m_state = --[[!AUTO_113]]"hold"
					item2.m_state = --[[!AUTO_114]]"normal"

					item1.m_x = iCol2 - 1
					item1.m_y = iRow2 - 1
					item2.m_x = iCol1 - 1
					item2.m_y = iRow1 - 1

					grid1.m_item = item2
					grid2.m_item = item1

					local ret1 = self:CheckEliminate(iCol1, iRow1)
					local ret2 = self:CheckEliminate(iCol2, iRow2)

					if ret1 or ret2 then
						return --[[!AUTO_115]]"end"
					end

					grid1.m_state = --[[!AUTO_116]]"lock"
					item1.m_state = --[[!AUTO_117]]"exchange"
					grid2.m_state = --[[!AUTO_118]]"lock"
					item2.m_state = --[[!AUTO_119]]"exchange"

					item1.m_x = iCol1 - 1
					item1.m_y = iRow1 - 1
					item2.m_x = iCol2 - 1
					item2.m_y = iRow2 - 1

					grid1.m_item = item1
					grid2.m_item = item2

					phase = --[[!AUTO_120]]"after"

					c = 2 - c - dc
					if c < 0 then
						c = 0
					end
				else
					c = dc + c
				end
			elseif phase == --[[!AUTO_121]]"after" then
				c = c - dc

				if c <= 0 then
					grid1.m_state = --[[!AUTO_122]]"hold"
					item1.m_state = --[[!AUTO_123]]"normal"
					grid2.m_state = --[[!AUTO_124]]"hold"
					item2.m_state = --[[!AUTO_125]]"normal"
					return --[[!AUTO_126]]"end"
				end
			end

			-- draw
			local function drawItem (item, dCol, dRow, c)
				local image = itemImages[item.m_kind]
				local gridX = item.m_x + dCol * mathsin(c * mathpi/2)
				local gridY = item.m_y + dRow * mathsin(c * mathpi/2)

				local imageX = (boardPosX + gridX * gridWidth) + (gridWidth - itemWidth)/2
				local imageY = (boardPosY - gridY * gridHeight) - (gridHeight + itemHeight)/2

				return image, imageX, imageY
			end

			if phase == --[[!AUTO_127]]"before" then
				-- 2 -> 1
				gameData.exchangeGraphicBuffer:addImage( drawItem(item2, -dCol, -dRow, c) )
				gameData.exchangeGraphicBuffer:addImage( drawItem(item1, dCol, dRow, c) )
			else
				-- 1 -> 2
				gameData.exchangeGraphicBuffer:addImage( drawItem(item1, dCol, dRow, c) )
				gameData.exchangeGraphicBuffer:addImage( drawItem(item2, -dCol, -dRow, c) )
			end
		end

		gameActionManager:addAction(exchange)
	end

	function Dlg_MiniGameBSZ:OnMiniGame_LButtonDown (x, y)
		if gameState == --[[!AUTO_128]]"run" then
			-- 计算点中的格子


			local gridX, gridY = transPosGameToGrid(x, y)
			local board = gameData.board
			local grid, iCol, iRow = board:getGridAtPos(gridX, gridY)

			local bDoExchange = false
			if grid and grid.m_state == --[[!AUTO_129]]"hold" then
				local curSel = gameData.select
				local selCol = curSel.iCol
				local selRow = curSel.iRow

				if selCol ~= unused then
					self:Select(nil, nil)

					-- 交换
					self:Exchange(selCol, selRow, iCol, iRow)
				else
					-- 选择
					self:Select(iCol, iRow)
				end
			else
				self:Select(nil, nil)
			end
		end
	end

	function Dlg_MiniGameBSZ:OnMiniGame_LButtonUp (x, y)
	end

	function Dlg_MiniGameBSZ:OnMiniGame_RButtonDown (x, y)
		self:Select(nil, nil)
	end

	function Dlg_MiniGameBSZ:OnMiniGame_RButtonUp (x, y)
	end

	function Dlg_MiniGameBSZ:OnMiniGame_MouseMove (x, y)

	end

	-- 绘制时，需要调用 MiniGameApi.GraphicsRenderGfx()，否则 GFX 无法显示
	function Dlg_MiniGameBSZ:RenderContent ()
		MiniGameApi.SetCurrentGraphics(gameData.graphics)

		if gameState == --[[!AUTO_130]]"run" or gameState == --[[!AUTO_131]]"success" or gameState == --[[!AUTO_132]]"fail" then
			-- 绘制物块
			local board = gameData.board
			local colCount = board.m_colCount
			local rowCount = board.m_rowCount

			local itemImages =
			{
				[1] = imageRes.item1, [2] = imageRes.item2, [3] = imageRes.item3, [4] = imageRes.item4,
				[5] = imageRes.item5, [6] = imageRes.item6, [7] = imageRes.item7,
			}

			local boardPosX = gameParam.boardPos.x
			local boardPosY = gameParam.boardPos.y
			local gridWidth = gameParam.gridSize.width
			local gridHeight = gameParam.gridSize.height
			local itemWidth = gameParam.itemSize.width
			local itemHeight = gameParam.itemSize.height

			local boardPxWidth = gameParam.boardSize.width * gridWidth
			local boardPxHeight = gameParam.boardSize.height * gridHeight
			MiniGameApi.GraphicsPushClip(boardPosX, boardPosY - boardPxHeight, boardPxWidth, boardPxHeight)

			for iCol = 1, colCount do
				for iRow = 1, rowCount do
					local grid = board[iCol][iRow]
					local item = grid.m_item
					if item and item ~= unused then
						if item.m_state == --[[!AUTO_133]]"normal" then
							local kind = item.m_kind
							local image = itemImages[kind]

							local x = boardPosX + item.m_x * gridWidth
							local y = boardPosY - item.m_y * gridHeight

							local imageX = x + (gridWidth - itemWidth)/2
							local imageY = y - (gridHeight + itemHeight)/2
							MiniGameApi.GraphicsDrawImage(image, imageX, imageY)
						elseif item.m_state == --[[!AUTO_134]]"exchange" then
						elseif item.m_state == --[[!AUTO_135]]"disappear" then
							local kind = item.m_kind
							local image = itemImages[kind]

							local x = boardPosX + item.m_x * gridWidth
							local y = boardPosY - item.m_y * gridHeight

							local imageX = x + (gridWidth - itemWidth)/2
							local imageY = y - (gridHeight + itemHeight)/2
							MiniGameApi.GraphicsDrawImage(image, imageX, imageY, 0.5)
						end
					end
				end
			end

			gameData.exchangeGraphicBuffer:render()

			MiniGameApi.GraphicsPopClip()
		end

		MiniGameApi.GraphicsRenderGfx()
	end

	function Dlg_MiniGameBSZ:OnFindHint ()
		MiniGameApi.SetCurrentGraphics(gameData.graphics)

		if gameData.currentHintCount > 0 then
			local iCol, iRow = self:FindHint()
			if iCol then
				local gameX, gameY = transPosGridToGame(iCol-1 + 0.5, iRow - 0.5)
				local hintGfx = gfxRes.hint[1]
				MiniGameApi.GraphicsSetGfxParam(hintGfx, gameX, gameY)
				MiniGameApi.GraphicsStartGfx(hintGfx)

				gameData.currentHintCount = gameData.currentHintCount - 1

				local timeAll = 0
				function removeHint (dtime)
					timeAll = dtime + timeAll
					if timeAll > gameParam.hintTimeLength then
						MiniGameApi.GraphicsStopGfx(hintGfx)
						return --[[!AUTO_136]]"end"
					end
				end

				gameActionManager:addAction(removeHint)
			else
				self:SetInfoText(--[[!AUTO_137]]"无法消除")
				self:CheckHint()
			end
		end
	end

	function Dlg_MiniGameBSZ:CheckHint ()
		if gameData.board:isAllHold() then
			local iCol, iRow = self:FindHint()
			if iCol then
				return iCol, iRow
			else
				-- 无法消除
				-- 如果重排次数为0，且所有格为满，则游戏失败
				if gameData.currentWashCount <= 0 then
					self:EndGame(--[[!AUTO_138]]"fail", TEXT--[[!AUTO_139]]"无法消除，游戏失败")
				else
					self:SetInfoText(--[[!AUTO_140]]"无法消除")
				end
				return nil, nil
			end
		end
	end

	function Dlg_MiniGameBSZ:FindHint ()
		local board = gameData.board
		local colCount = board.m_colCount
		local rowCount = board.m_rowCount

		-- exchange with iCol+1, iRow
		for iCol = 1, colCount - 1 do
			for iRow = 1, rowCount do
				local grid1 = board[iCol][iRow]
				local item1 = grid1:getHoldItem()
				local grid2 = board[iCol+1][iRow]
				local item2 = grid2:getHoldItem()
				if item1 and item2 and item1.m_kind ~= item2.m_kind then
					grid2.m_state = --[[!AUTO_141]]"lock"
					if board:canEliminate(iCol, iRow, item2.m_kind) then
						grid2.m_state = --[[!AUTO_142]]"hold"
						return iCol+1, iRow
					end
					grid2.m_state = --[[!AUTO_143]]"hold"

					grid1.m_state = --[[!AUTO_144]]"lock"
					if board:canEliminate(iCol+1, iRow, item1.m_kind) then
						grid1.m_state = --[[!AUTO_145]]"hold"
						return iCol, iRow
					end
					grid1.m_state = --[[!AUTO_146]]"hold"
				end
			end
		end

		-- exchange with iCol, iRow+1
		for iCol = 1, colCount do
			for iRow = 1, rowCount - 1 do
				local grid1 = board[iCol][iRow]
				local item1 = grid1:getHoldItem()
				local grid2 = board[iCol][iRow+1]
				local item2 = grid2:getHoldItem()
				if item1 and item2 and item1.m_kind ~= item2.m_kind then
					grid2.m_state = --[[!AUTO_147]]"lock"
					if board:canEliminate(iCol, iRow, item2.m_kind) then
						grid2.m_state = --[[!AUTO_148]]"hold"
						return iCol, iRow+1
					end
					grid2.m_state = --[[!AUTO_149]]"hold"

					grid1.m_state = --[[!AUTO_150]]"lock"
					if board:canEliminate(iCol, iRow+1, item1.m_kind) then
						grid1.m_state = --[[!AUTO_151]]"hold"
						return iCol, iRow
					end
					grid1.m_state = --[[!AUTO_152]]"hold"
				end
			end
		end

		return nil, nil
	end

	function Dlg_MiniGameBSZ:OnReArrange ()
		MiniGameApi.SetCurrentGraphics(gameData.graphics)

		if gameData.currentWashCount > 0 then
			self:Select(nil, nil)
			gameData.board:reset()
			gameData.board:generateRandomBoard (gameParam.itemRates)

			gameData.currentWashCount = gameData.currentWashCount - 1
			self:CheckHint()
		end
	end

	-- mode: game, result
	function Dlg_MiniGameBSZ:SetUIMode (mode)
		if mode == --[[!AUTO_153]]"game" then
			DlgApi.ShowItem(self.this, --[[!AUTO_154]]"Img_ResultBack", false)
			DlgApi.ShowItem(self.this, --[[!AUTO_155]]"Btn_Ok", false)
			DlgApi.ShowItem(self.this, --[[!AUTO_156]]"Txt_Result", false)
		elseif mode == --[[!AUTO_157]]"result" then
			DlgApi.ShowItem(self.this, --[[!AUTO_158]]"Img_ResultBack", true)
			DlgApi.ShowItem(self.this, --[[!AUTO_159]]"Btn_Ok", true)
			DlgApi.ShowItem(self.this, --[[!AUTO_160]]"Txt_Result", true)
		end
	end

	local lastSetInfoTextAction
	function Dlg_MiniGameBSZ:SetInfoText (text, time)
		if lastSetInfoTextAction then
			gameActionManager:removeAction(lastSetInfoTextAction)
		end

		DlgApi.SetItemText(self.this, --[[!AUTO_161]]"Txt_TextOut", text)

		if time ~= --[[!AUTO_162]]"infinite" then
			time = time or 3000

			local timeAll = 0
			local function setText (dtime)
				timeAll = dtime + timeAll
				if timeAll >= time then
					DlgApi.SetItemText(self.this, --[[!AUTO_163]]"Txt_TextOut", --[[!AUTO_164]]"")
					return --[[!AUTO_165]]"end"
				end
			end

			gameActionManager:addAction(setText)
			lastSetInfoTextAction = setText
		end
	end

	function Dlg_MiniGameBSZ:AddScore (dscore)
		local score = dscore + gameData.score
		gameData.score = score

		if score >= gameParam.targetScore then
			self:EndGame(--[[!AUTO_166]]"success")
		end
	end

	function Dlg_MiniGameBSZ:AddTime (dtime)
		local time = dtime + gameData.leftTime
		if time < 0 then
			time = 0
		end
		gameData.leftTime = time

		if time == 0 then
			self:EndGame(--[[!AUTO_167]]"fail", TEXT--[[!AUTO_168]]"时间结束，游戏失败")
		end
	end

	function Dlg_MiniGameBSZ:UpdateUI ()
		local selfthis = self.this
		DlgApi.SetItemText(selfthis, --[[!AUTO_169]]"Txt_Title", gameData.title)
		DlgApi.SetItemText(selfthis, --[[!AUTO_170]]"Txt_HintNum", --[[!AUTO_171]]""..gameData.currentHintCount)
		DlgApi.SetItemText(selfthis, --[[!AUTO_172]]"Txt_WashNum", --[[!AUTO_173]]""..gameData.currentWashCount)
		DlgApi.SetItemText(selfthis, --[[!AUTO_174]]"Txt_Score", --[[!AUTO_175]]""..gameData.score)

		local scoreProgress = gameData.score/gameParam.targetScore
		DlgApi.SetProgress(selfthis, --[[!AUTO_176]]"Prog_Score", scoreProgress)

		local timeProgress = gameData.leftTime/gameParam.timeLimit
		DlgApi.SetProgress(selfthis, --[[!AUTO_177]]"Pro_Time", timeProgress)

		DlgApi.EnableItem(selfthis, --[[!AUTO_178]]"Btn_Hint", gameState == --[[!AUTO_179]]"run")
		DlgApi.EnableItem(selfthis, --[[!AUTO_180]]"Btn_Wash", gameState == --[[!AUTO_181]]"run")
		DlgApi.EnableItem(selfthis, --[[!AUTO_182]]"Btn_Abandon", gameState == --[[!AUTO_183]]"run")
	end

	_G[dialogName] = PLUN(Dlg_MiniGameBSZ, --[[!AUTO_184]]dialogName)
end

-- Code end
--

--
-- test Begin
--~ math.randomseed(3)
--~ :StartGame()
--~ Dlg_MiniGameBSZ:Render ()
