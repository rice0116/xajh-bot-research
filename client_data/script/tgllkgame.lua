--[[#tag push auto]]

--执行界面所需脚本逻辑 (这一份代码要在多个界面中使用)
function InitInterface_TGllkGame (dialogName)

	local PLUN = function (v) return v or true end
	--~ local PLUN = loadfile "test/plun.lua" "script/TGllkGame.lua"		-- 仅用于调试，调试完毕注释此行

	--------- Data   for TGllk game -----------------------

	--连连看方阵的规模，共包含了三个难度，height为高，width为宽。例如：9*14 实际的块排列规模为7*12，其他两行两列为留白用作连接判断，其余类同

	TGllk_MapSize = { width = 12, height = 10, }

	--连连看的每个物块大小，height为高度像素，width为宽度像素

	TGllk_BlockSize = { height=36, width=36 }

	--连连看的三个难度对应的 方阵原点 。 x为原点在游戏界面x轴的位置，y为原点在游戏界面y轴的位置。

	TGllk_MapOrigin = { x=200, y=150 }

	--连连看中可以供选择的背景图的个数（在游戏设置中使用了加黑色过渡边框的原画）
	TGllk_BkNum = 5

	--连连看的难度数总数
	TGllk_DiffStepNum = 3

	--连连看用哪一套图案
	TGllk_CardType = 1

	--连连看中三个难度开局时赋予的提示数目
	TGllk_HintNum = 4
	--连连看中三个难度开局时赋予的洗牌数目
	TGllk_WashNum = 2

	--连连看中三个难度初始化给与的时间
	TGllk_Time = 200000

	--连连看中消除一次所返回的时间

	TGllk_TimeReward = 2000

	--连连看游戏中能容忍的最大的点击连续错误数目
	TGllk_PunishCount = 3

	--连连看中发生连续错误数大于TGllk_ContinueFalse扣除的时间

	TGllk_PunishTime = 5000

	--对应连连看中三个难度，消除连续达到阈值后给与奖励。该阈值为3000，即3秒。


	---1为最小值，当消除时，加上消除的奖励时间，当一个tick过去时，减去一个tick的时间，当该项累计时间到达TGllk_RewardThresholdTime时，则进行奖励随机计算,该数值设置不得小于一次成功消除的奖励时间TGllk_TimeReward
	TGllk_RewardThresholdTime = 4000

	--当累积的奖励时间达到了TGllk_RewardThresholdTime后进行获奖判断，判断后累积的奖励时间减去TGllk_RewardSucTimeReduce的值为剩余的积累时间（三个数据项对应三个难度）
	TGllk_RewardSucTimeReduce = 1500

	--连连看三个难度每次点击消除以后的得分增加
	TGllk_ScoreReward = 10

	--连连看三个难度 过关后每个提示转化的分数
	TGllk_ScoreHint = 100

	--连连看三个难度 过关后每个洗牌转化的分数
	TGllk_ScoreWash = 200

	--连连看三个难度 每个小局结束后，多于的时间转化为分数，每1000毫秒（1秒）转化的分数


	TGllk_ScoreTime = 5	-- 剩余时间每1000毫秒的分数


	--连连看 连接线的图

	TGllk_LinePic = --[[!AUTO_1]]"TinyGame\\TGllk\\LinePixel.tga"

	--连连看  半个物块的像素尺寸

	TGllk_BlockHSize = 18

	--连连看  半个提示和消失块的尺寸

	TGllk_HintSize = 18

	--连连看 物块的图片

	TGllk_Pic = {}
	TGllk_Pic[1] =
	{
		--[[!AUTO_2]]"xajh\\小游戏相关\\连连看\\icon\\1.dds",
		--[[!AUTO_3]]"xajh\\小游戏相关\\连连看\\icon\\2.dds",
		--[[!AUTO_4]]"xajh\\小游戏相关\\连连看\\icon\\3.dds",
		--[[!AUTO_5]]"xajh\\小游戏相关\\连连看\\icon\\4.dds",
		--[[!AUTO_6]]"xajh\\小游戏相关\\连连看\\icon\\5.dds",
		--[[!AUTO_7]]"xajh\\小游戏相关\\连连看\\icon\\6.dds",
		--[[!AUTO_8]]"xajh\\小游戏相关\\连连看\\icon\\7.dds",
		--[[!AUTO_9]]"xajh\\小游戏相关\\连连看\\icon\\8.dds",
		--[[!AUTO_10]]"xajh\\小游戏相关\\连连看\\icon\\9.dds",
		--[[!AUTO_11]]"xajh\\小游戏相关\\连连看\\icon\\10.dds",

		--[[!AUTO_12]]"xajh\\小游戏相关\\连连看\\icon\\11.dds",
		--[[!AUTO_13]]"xajh\\小游戏相关\\连连看\\icon\\12.dds",
		--[[!AUTO_14]]"xajh\\小游戏相关\\连连看\\icon\\13.dds",
		--[[!AUTO_15]]"xajh\\小游戏相关\\连连看\\icon\\14.dds",
		--[[!AUTO_16]]"xajh\\小游戏相关\\连连看\\icon\\15.dds",
		--[[!AUTO_17]]"xajh\\小游戏相关\\连连看\\icon\\16.dds",
		--[[!AUTO_18]]"xajh\\小游戏相关\\连连看\\icon\\17.dds",
		--[[!AUTO_19]]"xajh\\小游戏相关\\连连看\\icon\\18.dds",
		--[[!AUTO_20]]"xajh\\小游戏相关\\连连看\\icon\\19.dds",
		--[[!AUTO_21]]"xajh\\小游戏相关\\连连看\\icon\\20.dds",

		--[[!AUTO_22]]"xajh\\小游戏相关\\连连看\\icon\\21.dds",
		--[[!AUTO_23]]"xajh\\小游戏相关\\连连看\\icon\\22.dds",
		--[[!AUTO_24]]"xajh\\小游戏相关\\连连看\\icon\\23.dds",
		--[[!AUTO_25]]"xajh\\小游戏相关\\连连看\\icon\\24.dds",
		--[[!AUTO_26]]"xajh\\小游戏相关\\连连看\\icon\\25.dds",
		--[[!AUTO_27]]"xajh\\小游戏相关\\连连看\\icon\\26.dds",
		--[[!AUTO_28]]"xajh\\小游戏相关\\连连看\\icon\\27.dds",
		--[[!AUTO_29]]"xajh\\小游戏相关\\连连看\\icon\\28.dds",
		--[[!AUTO_30]]"xajh\\小游戏相关\\连连看\\icon\\29.dds",
		--[[!AUTO_31]]"xajh\\小游戏相关\\连连看\\icon\\30.dds",

		--[[!AUTO_32]]"xajh\\小游戏相关\\连连看\\icon\\31.dds",
		--[[!AUTO_33]]"xajh\\小游戏相关\\连连看\\icon\\32.dds",
		--[[!AUTO_34]]"xajh\\小游戏相关\\连连看\\icon\\33.dds",
		--[[!AUTO_35]]"xajh\\小游戏相关\\连连看\\icon\\34.dds",
		--[[!AUTO_36]]"xajh\\小游戏相关\\连连看\\icon\\35.dds",
		--[[!AUTO_37]]"xajh\\小游戏相关\\连连看\\icon\\36.dds",
	}

	TGllk_Pic[2] =
	{
		--[[!AUTO_2]]"xajh\\小游戏相关\\圣诞连连看\\icon\\1.dds",
		--[[!AUTO_3]]"xajh\\小游戏相关\\圣诞连连看\\icon\\2.dds",
		--[[!AUTO_4]]"xajh\\小游戏相关\\圣诞连连看\\icon\\3.dds",
		--[[!AUTO_5]]"xajh\\小游戏相关\\圣诞连连看\\icon\\4.dds",
		--[[!AUTO_6]]"xajh\\小游戏相关\\圣诞连连看\\icon\\5.dds",
		--[[!AUTO_7]]"xajh\\小游戏相关\\圣诞连连看\\icon\\6.dds",
		--[[!AUTO_8]]"xajh\\小游戏相关\\圣诞连连看\\icon\\7.dds",
		--[[!AUTO_9]]"xajh\\小游戏相关\\圣诞连连看\\icon\\8.dds",
		--[[!AUTO_10]]"xajh\\小游戏相关\\圣诞连连看\\icon\\9.dds",
		--[[!AUTO_11]]"xajh\\小游戏相关\\圣诞连连看\\icon\\10.dds",

		--[[!AUTO_12]]"xajh\\小游戏相关\\圣诞连连看\\icon\\11.dds",
		--[[!AUTO_13]]"xajh\\小游戏相关\\圣诞连连看\\icon\\12.dds",
		--[[!AUTO_14]]"xajh\\小游戏相关\\圣诞连连看\\icon\\13.dds",
		--[[!AUTO_15]]"xajh\\小游戏相关\\圣诞连连看\\icon\\14.dds",
		--[[!AUTO_16]]"xajh\\小游戏相关\\圣诞连连看\\icon\\15.dds",
		--[[!AUTO_17]]"xajh\\小游戏相关\\圣诞连连看\\icon\\16.dds",
		--[[!AUTO_18]]"xajh\\小游戏相关\\圣诞连连看\\icon\\17.dds",
		--[[!AUTO_19]]"xajh\\小游戏相关\\圣诞连连看\\icon\\18.dds",
		--[[!AUTO_20]]"xajh\\小游戏相关\\圣诞连连看\\icon\\19.dds",
		--[[!AUTO_21]]"xajh\\小游戏相关\\圣诞连连看\\icon\\20.dds",

		--[[!AUTO_22]]"xajh\\小游戏相关\\圣诞连连看\\icon\\21.dds",
		--[[!AUTO_23]]"xajh\\小游戏相关\\圣诞连连看\\icon\\22.dds",
		--[[!AUTO_24]]"xajh\\小游戏相关\\圣诞连连看\\icon\\23.dds",
		--[[!AUTO_25]]"xajh\\小游戏相关\\圣诞连连看\\icon\\24.dds",
		--[[!AUTO_26]]"xajh\\小游戏相关\\圣诞连连看\\icon\\25.dds",
		--[[!AUTO_27]]"xajh\\小游戏相关\\圣诞连连看\\icon\\26.dds",
		--[[!AUTO_28]]"xajh\\小游戏相关\\圣诞连连看\\icon\\27.dds",
		--[[!AUTO_29]]"xajh\\小游戏相关\\圣诞连连看\\icon\\28.dds",
		--[[!AUTO_30]]"xajh\\小游戏相关\\圣诞连连看\\icon\\29.dds",
		--[[!AUTO_31]]"xajh\\小游戏相关\\圣诞连连看\\icon\\30.dds",

		--[[!AUTO_32]]"xajh\\小游戏相关\\圣诞连连看\\icon\\31.dds",
		--[[!AUTO_33]]"xajh\\小游戏相关\\圣诞连连看\\icon\\32.dds",
		--[[!AUTO_34]]"xajh\\小游戏相关\\圣诞连连看\\icon\\33.dds",
		--[[!AUTO_35]]"xajh\\小游戏相关\\圣诞连连看\\icon\\34.dds",
		--[[!AUTO_36]]"xajh\\小游戏相关\\圣诞连连看\\icon\\35.dds",
		--[[!AUTO_37]]"xajh\\小游戏相关\\圣诞连连看\\icon\\36.dds",
	}

	--连连看声效文件

	TGllk_Sound =
	{
		ConnectSucc = --[[!AUTO_38]]"SFX\\TinyGame\\TGllk\\成功.wav",
		ConnectFail = --[[!AUTO_39]]"SFX\\TinyGame\\TGllk\\失败.wav",
		SuccReward = --[[!AUTO_40]]"SFX\\TinyGame\\TGllk\\连续成功的奖励.wav",
		MissionSuc = --[[!AUTO_41]]"SFX\\TinyGame\\TGllk\\任务成功.wav",
		MissionFai = --[[!AUTO_42]]"SFX\\TinyGame\\TGllk\\任务失败.wav",
		Wash = --[[!AUTO_43]]"SFX\\TinyGame\\TGllk\\洗牌.wav",
		Hint = --[[!AUTO_44]]"SFX\\TinyGame\\TGllk\\成功.wav"
	}

	--设定present
	--奖励暂定不使用

	--三个等级的奖励，每个等级里面有n种同等级的奖励。{a,b,c,d,e}参数分别为：a-奖励的生命；b-奖励的hint；c-奖励的分数；d-奖励时间；e-奖励的提示


	TGllk_Reward =
	{
		[1] = { {2,0,0,0,--[[!AUTO_45]]"連續消除，獎勵洗牌2次!" },{0,4,0,0,--[[!AUTO_46]]"連續消除，獎勵提示4次!"},{0,0,500,0,--[[!AUTO_47]]"獎勵分數500"},{0,0,0,12000,--[[!AUTO_48]]"連續消除，獎勵時間12秒!"}, },
		[2] = { {1,0,0,0,--[[!AUTO_49]]"連續消除，獎勵洗牌1次!"},{0,3,0,0,--[[!AUTO_50]]"連續消除，獎勵提示3次!"},{0,0,400,0,--[[!AUTO_51]]"獎勵分數400"} ,{0,0,0,10000,--[[!AUTO_52]]"連續消除，獎勵時間10秒!"},},
		[3] = { {0,2,0,0,--[[!AUTO_53]]"連續消除，獎勵提示2次!"},{0,0,300,0,--[[!AUTO_54]]"獎勵分數300"}, {0,0,0,8000,--[[!AUTO_55]]"連續消除，獎勵時間8秒!"},},
		[4] = { {0,0,200,0,--[[!AUTO_56]]"獎勵分數200"}, {0,0,0,6000,--[[!AUTO_57]]"連續消除，獎勵時間6秒!"},},
	}

	--三个难度的奖励的时间范围 	其中每个难度登记包含了若干个可以得奖的时间段（已经花费时间占总时间的比例来计算），其中每个时间段对应的得奖概率不同


	TGllk_RewardArea = { {1,0.95},{0.95,0.90},{0.90,0.75}, }
	--三个难度的对应时间段的获得奖励的几率，与TGllk_RewardArea相对应


	TGllk_RewardTimeRate = { {0.4,0.4,0.4}, }

	--一但确定能获得奖励后，三个时间段对应的三种奖励的分布情况，如：{0.2,0.5,1}，0~0.2为第一等奖励，0.2~0.5为第二等奖励，0.5~1.0为第三等奖励
	TGllk_RewardRate = { {0.1,0.3,0.8,1},{0.1,0.25,0.7,1},{0.1,0.25,0.7,1}, } --三种奖励的分布



	--Text-------------------------------------

	--补充说明：界面按钮上的文字已经在

	TGllk_TextWait = --[[!AUTO_58]]"開始"
	TGllk_TextInGame = --[[!AUTO_59]]"暫停"
	TGllk_TextPause = --[[!AUTO_60]]"繼續"

	TGllk_TextBlock = --[[!AUTO_61]]"連接失敗！"
	TGllk_TextContiFalse = --[[!AUTO_62]]"連續錯誤，扣除時間5秒"  --时间与TGllk_TimeFalse的值相统一

	-----------------------------  Data end -------------------------
	-----------------------------------------------------------------

	local DlgTemplate = DlgTemplate
	local DlgApi  = DlgApi
	local GameApi = GameApi

	local TGllk_MapSize  = TGllk_MapSize
	local TGllk_BlockSize = TGllk_BlockSize
	local TGllk_MapOrigin = TGllk_MapOrigin
	local TGllk_HintNum = TGllk_HintNum
	local TGllk_Pic = TGllk_Pic

	local TGllk_Time = TGllk_Time
	local TGllk_ScoreReward = TGllk_ScoreReward
	local TGllk_ScoreHint = TGllk_ScoreHint
	local TGllk_ScoreWash = TGllk_ScoreWash
	local TGllk_ScoreTime = TGllk_ScoreTime
	local TGllk_RewardThresholdTime = TGllk_RewardThresholdTime
	local TGllk_Reward = TGllk_Reward
	local TGllk_RewardArea = TGllk_RewardArea
	local TGllk_RewardRate = TGllk_RewardRate
	local TGllk_RewardRate = TGllk_RewardRate
	local TGllk_Sound = TGllk_Sound
	local TGllk_resultCallBack

	-- 文字标记，界面文字都用这个函数标记

	local function TEXT(v) return v end

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
				if ret == --[[!AUTO_63]]"end" then
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
	local gameActionManager = ActionManager:new()

	--
	local datamember =
	{
		this = --[[!AUTO_64]]dialogName,
		prepress={},
		realignType=0,
		gamestate=nil,

		map_h=0,
		map_w=0,
		timestore=0,
		blocksum=nil,


		hintnum=nil,
		washnum=nil,

		BlockMatrix = {},
		BlockInMatrix={},
		BlockList={},
		DeleteFlag={},

		mapscale=nil,

		hintstore={},

		textcounter =-1,

		cnroute={},
		btnflag = false,
		soundflag = true,

		linelist = {},

		disapearlist = {},
		disapearnum = 0,
		failtoconnectnum = 0,
		falsenum = 0,
		rewardcounter = -1,
		succnum = 0,

		maxdiff = 1,
		maxscore = 0,

		scorestore = 0,

		levelendflag = false
	}

	local Dlg_MiniGameBSZ = DlgTemplate:new(datamember)

	function Dlg_MiniGameBSZ:GetDefaultParam ()
		return
		{
			timeLimit = 120000,		-- 时间限制(亳秒)
			title = TEXT--[[!AUTO_65]]"井井有條",		-- 标题
			mapSize = {width = 10, height = 8}, -- 矩阵大小(不含边缘空白)
			cardType = 1,			-- 哪一套图案
			cardCount = 24,			-- 图案种类数，暂时无效，实际种类数为 width*height/4

			hintCount = 4,			-- 提示数量
			washCount = 2,		-- 洗牌数量

			rewardTime = 2000,		-- 消除一次增加的时间
			punishCount = 3,		-- 引起时间惩罚的连续错误次数

			punishTime = 5000,		-- 时间惩罚量(亳秒)
			realignType = 1,		-- 消除后剩余方块的移动方式
				-- 1 保持原地, 2 向下边界落去, 3 向左边界落去, 4 向上下两边从中间分开, 5 向左右两边分开
				-- 6 向中间行收缩, 7 列向中间聚拢, 8 一半一半，行向左右两边移动, 9 一半一半，列向上下两边移动
				-- 10 向外扩散，左右优先, 11 向内聚拢，左右优先
		}
	end

	-- resultCallBack (result):
	--  如果成功 result == "success"，如果失败 result == "fail"
	function Dlg_MiniGameBSZ:StartGame (param, resultCallBack)
		self:EndGame()

		param = param or self:GetDefaultParam()
		TGllk_resultCallBack = resultCallBack

		-- 使用参数
		TGllk_Time = param.timeLimit
		DlgApi.SetItemText(self.this, TEXT--[[!AUTO_66]]"Title", param.title)
		TGllk_TimeReward = param.rewardTime
		TGllk_MapSize.width = param.mapSize.width + 2
		TGllk_MapSize.height = param.mapSize.height + 2
		TGllk_CardType = param.cardType
		
		--... param.countOfCard

		TGllk_HintNum = param.hintCount
		TGllk_WashNum = param.washCount
		TGllk_TimeReward = param.rewardTime
		TGllk_PunishCount = param.punishCount
		TGllk_PunishTime = param.punishTime
		datamember.realignType = param.realignType

		-- 计算参数
		do
			local contentRect = DlgApi.GetItemRect(self.this, "content", true)
			local centerX = contentRect.x + contentRect.width/2
			local centerY = contentRect.y + contentRect.height/2
			TGllk_MapOrigin.x = centerX - TGllk_MapSize.width * TGllk_BlockSize.width / 2
			TGllk_MapOrigin.y = centerY - TGllk_MapSize.height * TGllk_BlockSize.height / 2
		end

		-- 准备
		self:ResizeWindows()
		self:DataInit()
		self:ItemInit()
		DlgApi.ShowDialog(self.this,true)
		local props = { canmove = false,canoutofwindow = false }
		DlgApi.SetDialogProp(self.this,props)

		-- 开始

		self:StartGameInternal()
	end

	function Dlg_MiniGameBSZ:Init()
		self:RegisterEvent(--[[!AUTO_67]]"Btn_Wash",self.OnWashArrange)
		self:RegisterEvent(--[[!AUTO_68]]"Btn_Hint",self.OnHint)
		self:RegisterEvent(--[[!AUTO_69]]"Btn_Pause",self.OnPause)
		self:RegisterEvent(--[[!AUTO_70]]"Btn_Continue",self.OnContinue)
		self:RegisterEvent(--[[!AUTO_71]]"Btn_Abandon",self.OnAbandon)
		self:RegisterEvent(--[[!AUTO_72]]"Btn_Confirm", function ()
			DlgApi.ShowDialog(self.this, false)
		end)

		self:RegisterEvent(WM_LBUTTONDOWN,self.OnLButtonDown)
		self:RegisterEvent(WM_RBUTTONDOWN,self.OnRButtonDown)

		--代用资源
		self:RegisterEvent(--[[!AUTO_73]]"sound",self.OnSoundControl)
	end
	-------------------------

	function Dlg_MiniGameBSZ:HideDialog ()
		if self.gamestate == --[[!AUTO_74]]"ingame" then
			self:EndGame(--[[!AUTO_75]]"fail")
		else
			self:EndGame()
		end
	end

	function Dlg_MiniGameBSZ:OnChangeUIMan ()
		self:HideDialog()
	end

	function Dlg_MiniGameBSZ:OnSoundControl()
		if self.soundflag == true then
			self.soundflag = false
			DlgApi.ShowItem(self.this,--[[!AUTO_76]]"Btn_SoundOff",false)
			DlgApi.ShowItem(self.this,--[[!AUTO_77]]"Btn_SoundOn",true)
		else
			self.soundflag = true
			DlgApi.ShowItem(self.this,--[[!AUTO_78]]"Btn_SoundOn",false)
			DlgApi.ShowItem(self.this,--[[!AUTO_79]]"Btn_SoundOff",true)
		end
	end
	------Init-------------------
	function Dlg_MiniGameBSZ:DataInit()
		self.gamestate=--[[!AUTO_80]]"wait"

		self.BlockMatrix={}
		self.BlockInMatrix={}
		self.BlockList={}

		self.DeleteFlag={}

		self.prepress={}
		self.hintnum=0
		self.washnum=0
		self.timestore=0

		self.linelist = {}
		for i = 1,3 do
			self.linelist[i] = {counter = -1,period = 100}
		end
		self.levelendflag = false
		self.maxdiff = 1
		self.maxscore = 0

		self.scorestore = 0
	end

	----------------------------
	function Dlg_MiniGameBSZ:ItemInit()
		DlgApi.ShowItem(self.this,--[[!AUTO_81]]"Rdo_11",true)
		DlgApi.ShowItem(self.this,--[[!AUTO_82]]"Rdo_12",true)
		DlgApi.ShowItem(self.this,--[[!AUTO_83]]"Rdo_13",true)
		DlgApi.EnableItem(self.this,--[[!AUTO_84]]"Rdo_11",true)
		DlgApi.EnableItem(self.this,--[[!AUTO_85]]"Rdo_12",true)
		DlgApi.EnableItem(self.this,--[[!AUTO_86]]"Rdo_13",true)
		DlgApi.CheckRadioButton(self.this,1,1)

		DlgApi.ShowItem(self.this,--[[!AUTO_87]]"Btn_Start",true)
		DlgApi.ShowItem(self.this,--[[!AUTO_88]]"Btn_ToNext",false)

		DlgApi.ShowItem(self.this,--[[!AUTO_89]]"Edit_BackGround",false)--背景方块

		DlgApi.ShowItem(self.this,--[[!AUTO_90]]"Btn_Pause",false)
		DlgApi.ShowItem(self.this,--[[!AUTO_91]]"Btn_Continue",false)
		DlgApi.ShowItem(self.this,--[[!AUTO_92]]"Btn_Wash",false)
		DlgApi.ShowItem(self.this,--[[!AUTO_93]]"Btn_Hint",false)
		DlgApi.ShowItem(self.this,--[[!AUTO_94]]"Btn_Abandon",false)
		DlgApi.ShowItem(self.this,--[[!AUTO_95]]"Edit_HintNum",false)
		DlgApi.ShowItem(self.this,--[[!AUTO_96]]"Edit_WashNum",false)

		DlgApi.ShowItem(self.this,--[[!AUTO_97]]"Pic_Pressed",false)
		DlgApi.ShowItem(self.this,--[[!AUTO_98]]"Pic_Hint1",false)
		DlgApi.ShowItem(self.this,--[[!AUTO_99]]"Pic_Hint2",false)
		DlgApi.ShowItem(self.this,--[[!AUTO_100]]"Pic_MemberPic",false)
		DlgApi.ShowItem(self.this,--[[!AUTO_101]]"Pic_Disapear",false)
		DlgApi.ShowItem(self.this,--[[!AUTO_102]]"Pic_FailToConnect",false)

		DlgApi.ShowItem(self.this,--[[!AUTO_103]]"Prog_Time",false)
		DlgApi.ShowItem(self.this,--[[!AUTO_104]]"Pic_TimeText",false)

		DlgApi.ShowItem(self.this,--[[!AUTO_105]]"Edit_Score",false)
		DlgApi.ShowItem(self.this,--[[!AUTO_106]]"Lab_TextScore",false)
		DlgApi.ShowItem(self.this,--[[!AUTO_107]]"Lab_LevelText",false)
		DlgApi.ShowItem(self.this,--[[!AUTO_108]]"Edit_Level",false)

		DlgApi.ShowItem(self.this,--[[!AUTO_109]]"Btn_SoundOff",false)
		DlgApi.ShowItem(self.this,--[[!AUTO_110]]"Btn_SoundOn",false)

		DlgApi.ShowItem(self.this, --[[!AUTO_111]]"Img_ResultBack", false)
		DlgApi.ShowItem(self.this, --[[!AUTO_112]]"Btn_Confirm", false)
		DlgApi.ShowItem(self.this, --[[!AUTO_113]]"Lab_Result", false)

		DlgApi.CreateControl(self.this,--[[!AUTO_114]]"Pic_Pressed",--[[!AUTO_115]]"Pressed")

		DlgApi.CreateControl(self.this,--[[!AUTO_116]]"Pic_Hint1",--[[!AUTO_117]]"Hint1")
		DlgApi.CreateControl(self.this,--[[!AUTO_118]]"Pic_Hint2",--[[!AUTO_119]]"Hint2")

		DlgApi.ShowItem(self.this,--[[!AUTO_120]]"Pic_Line",false)

		DlgApi.SetItemText(self.this,--[[!AUTO_121]]"Lab_TextOut",--[[!AUTO_122]]" ")
	end

	------------------------
	--
	function Dlg_MiniGameBSZ:StartGameInternal()
		if self.levelendflag == true then
			self.scorestore = self.scorestore + self.timestore*TGllk_ScoreTime/1000
			self.levelendflag = false
		end

		DlgApi.ShowItem(self.this,--[[!AUTO_123]]"Pic_TimeText",false)
		DlgApi.ShowItem(self.this,--[[!AUTO_124]]"Prog_Time",false)
		DlgApi.ShowItem(self.this,--[[!AUTO_125]]"Btn_Next",false)
		DlgApi.EnableItem(self.this,--[[!AUTO_126]]"Btn_Hint",true)
		DlgApi.EnableItem(self.this,--[[!AUTO_127]]"Btn_Wash",true)

		self:StartGameInternalInternal()

		--为了让提示的图片覆盖在连连看图片之上
		DlgApi.DeleteControl(self.this,--[[!AUTO_128]]"Pressed")
		DlgApi.CreateControl(self.this,--[[!AUTO_129]]"Pic_Pressed",--[[!AUTO_130]]"Pressed")
		DlgApi.ShowItem(self.this,--[[!AUTO_131]]"Pressed",false)

		DlgApi.DeleteControl(self.this,--[[!AUTO_132]]"Hint1")
		DlgApi.CreateControl(self.this,--[[!AUTO_133]]"Pic_Hint1",--[[!AUTO_134]]"Hint1")
		DlgApi.ShowItem(self.this,--[[!AUTO_135]]"Hint1",false)

		DlgApi.DeleteControl(self.this,--[[!AUTO_136]]"Hint2")
		DlgApi.CreateControl(self.this,--[[!AUTO_137]]"Pic_Hint2",--[[!AUTO_138]]"Hint2")
		DlgApi.ShowItem(self.this,--[[!AUTO_139]]"Hint2",false)
		-----
		DlgApi.DeleteControl(self.this,--[[!AUTO_140]]"Line1")
		DlgApi.CreateControl(self.this,--[[!AUTO_141]]"Pic_Line",--[[!AUTO_142]]"Line1")
	--~ 	DlgApi.SetImageFile(self.this,"Line1",TGllk_LinePic,1)
		DlgApi.ShowItem(self.this,--[[!AUTO_143]]"Line1",false)

		DlgApi.DeleteControl(self.this,--[[!AUTO_144]]"Line2")
		DlgApi.CreateControl(self.this,--[[!AUTO_145]]"Pic_Line",--[[!AUTO_146]]"Line2")
	--~ 	DlgApi.SetImageFile(self.this,"Line2",TGllk_LinePic,1)
		DlgApi.ShowItem(self.this,--[[!AUTO_147]]"Line2",false)

		DlgApi.DeleteControl(self.this,--[[!AUTO_148]]"Line3")
		DlgApi.CreateControl(self.this,--[[!AUTO_149]]"Pic_Line",--[[!AUTO_150]]"Line3")
	--~ 	DlgApi.SetImageFile(self.this,"Line3",TGllk_LinePic,1)
		DlgApi.ShowItem(self.this,--[[!AUTO_151]]"Line3",false)

		self.gamestate = --[[!AUTO_152]]"ingame"
	end

	----
	function Dlg_MiniGameBSZ:StartGameInternalInternal()

		self.levelendflag = false
		self.btnflag = false
		self.falsenum = 0
		self.rewardcounter = -1
		self.succnum = 0

		--取难度

		self.map_h = TGllk_MapSize.height
		self.map_w = TGllk_MapSize.width
		self.hintnum=TGllk_HintNum
		self.washnum=TGllk_WashNum

		self.timestore = TGllk_Time
		DlgApi.SetProgress(self.this,--[[!AUTO_153]]"Prog_Time",(self.timestore/TGllk_Time))

		DlgApi.SetItemText(self.this,--[[!AUTO_154]]"Edit_HintNum",tostring(self.hintnum))
		DlgApi.SetItemText(self.this,--[[!AUTO_155]]"Edit_WashNum",tostring(self.washnum))

		--生成图标的控件列表

		self.blocksum=(self.map_h-2)*(self.map_w-2)
		self.blockgroup = self.blocksum/4

		for i=1,self.blocksum do
			local num=math.ceil(i/4)
			local bmodel = --[[!AUTO_156]]"Pic_MemberPic"
			local btn = --[[!AUTO_157]]"Block"..i
			DlgApi.CreateControl(self.this,bmodel,btn)
			DlgApi.SetImageFile(self.this,btn,TGllk_Pic[TGllk_CardType][num],1)
			self.DeleteFlag[i]=true
			self.BlockList[i]={}
			self.BlockList[i].btn = btn
			self.BlockList[i].btype = num
		end

		for i=1,self.map_h do
			self.BlockInMatrix[i]={}
			self.BlockMatrix[i]={}
			for j=1,self.map_w do
				self.BlockInMatrix[i][j]=0
				self.BlockMatrix[i][j]=0
			end
		end

		for i=2,self.map_h-1 do
			for j=2,self.map_w-1 do
				self.BlockInMatrix[i][j]=1
			end
		end

		self:GenerateMatrix()

		self:foundhint()

		self.prepress.state=false	--之前按下的键

		if self.washnum>0 then
			DlgApi.ShowItem(self.this,--[[!AUTO_158]]"Btn_Wash",true)
			DlgApi.EnableItem(self.this,--[[!AUTO_159]]"Btn_Wash",true)

		end
		if self.hintnum>0 then
			DlgApi.ShowItem(self.this,--[[!AUTO_160]]"Btn_Hint",true)
			DlgApi.EnableItem(self.this,--[[!AUTO_161]]"Btn_Hint",true)
		end
		DlgApi.ShowItem(self.this,--[[!AUTO_162]]"Btn_Abandon",true)

		DlgApi.ShowItem(self.this,--[[!AUTO_163]]"Btn_Start",false)
		DlgApi.ShowItem(self.this,--[[!AUTO_164]]"Btn_ToNext",false)

		DlgApi.ShowItem(self.this,--[[!AUTO_165]]"Rdo_11",false)
		DlgApi.ShowItem(self.this,--[[!AUTO_166]]"Rdo_12",false)
		DlgApi.ShowItem(self.this,--[[!AUTO_167]]"Rdo_13",false)

		DlgApi.ShowItem(self.this,--[[!AUTO_168]]"Edit_MaxScore",false)
		DlgApi.ShowItem(self.this,--[[!AUTO_169]]"Lab_MaxScoreText",false)

		DlgApi.SetItemText(self.this,--[[!AUTO_170]]"Edit_Level",tostring(self.realignType))

		DlgApi.ShowItem(self.this,--[[!AUTO_171]]"Btn_Pause",true)
		DlgApi.ShowItem(self.this,--[[!AUTO_172]]"Btn_Continue",false)
		DlgApi.ShowItem(self.this,--[[!AUTO_173]]"Edit_HintNum",true)
		DlgApi.ShowItem(self.this,--[[!AUTO_174]]"Edit_WashNum",true)
		DlgApi.ShowItem(self.this,--[[!AUTO_175]]"Edit_BackGround",true)--背景方块
		DlgApi.SetProgress(self.this,--[[!AUTO_176]]"Prog_Time",(self.timestore/TGllk_Time))
		DlgApi.ShowItem(self.this,--[[!AUTO_177]]"Prog_Time",true)
		DlgApi.ShowItem(self.this,--[[!AUTO_178]]"Pic_TimeText",true)

		DlgApi.ShowItem(self.this,--[[!AUTO_179]]"Edit_Score",true)
		DlgApi.SetItemText(self.this,--[[!AUTO_180]]"Edit_Score",tostring(math.floor(self.scorestore)))
		DlgApi.ShowItem(self.this,--[[!AUTO_181]]"Lab_TextScore",true)
		DlgApi.ShowItem(self.this,--[[!AUTO_182]]"Lab_LevelText",true)
		DlgApi.ShowItem(self.this,--[[!AUTO_183]]"Edit_Level",true)

		if self.soundflag == true then
			DlgApi.ShowItem(self.this,--[[!AUTO_184]]"Btn_SoundOff",true)
			DlgApi.ShowItem(self.this,--[[!AUTO_185]]"Btn_SoundOn",false)
		else
			DlgApi.ShowItem(self.this,--[[!AUTO_186]]"Btn_SoundOff",false)
			DlgApi.ShowItem(self.this,--[[!AUTO_187]]"Btn_SoundOn",true)
		end
		self.btnflag = false
	end

	function Dlg_MiniGameBSZ:EndGame (result, textInfo)
		self:Clear()

		if TGllk_resultCallBack then
			if result == --[[!AUTO_188]]"success" then
				TGllk_resultCallBack(--[[!AUTO_189]]"success")
			else
				TGllk_resultCallBack(--[[!AUTO_190]]"fail")
			end

			TGllk_resultCallBack = nil
		end

		if self.gamestate == --[[!AUTO_191]]"ingame" then
			if result == --[[!AUTO_192]]"success" then
				GameApi.Play2DSound(TGllk_Sound.MissionSuc)
				DlgApi.SetItemText(self.this, --[[!AUTO_193]]"Lab_Result", TEXT--[[!AUTO_194]]"挑戰成功")
			elseif result == --[[!AUTO_195]]"fail" then
				GameApi.Play2DSound(TGllk_Sound.MissionFai)
				DlgApi.SetItemText(self.this, --[[!AUTO_196]]"Lab_Result", TEXT--[[!AUTO_197]]"挑戰失敗")
			end
			DlgApi.ShowItem(self.this, --[[!AUTO_198]]"Img_ResultBack", true)
			DlgApi.ShowItem(self.this, --[[!AUTO_199]]"Btn_Confirm", true)
			DlgApi.ShowItem(self.this, --[[!AUTO_200]]"Lab_Result", true)

			if textInfo then
				DlgApi.SetItemText(self.this, --[[!AUTO_201]]"Lab_Result", textInfo)
			end
		end

		self.gamestate = --[[!AUTO_202]]"wait"
	end

	------------------------------------------

	function Dlg_MiniGameBSZ:OnPause()
		if self.gamestate == --[[!AUTO_203]]"ingame" then
			--暂停
			self.gamestate = --[[!AUTO_204]]"pause"
			DlgApi.ShowItem(self.this,--[[!AUTO_205]]"Btn_Pause",false)
			DlgApi.ShowItem(self.this,--[[!AUTO_206]]"Btn_Continue",true)

			--把牌面隐藏



			for bname,b in pairs(self.BlockList) do
				DlgApi.ShowItem(self.this,b.btn,false)
			end
		end

	end
	function Dlg_MiniGameBSZ:OnContinue()
		if self.gamestate == --[[!AUTO_207]]"pause" then
			--继续游戏
			self.gamestate = --[[!AUTO_208]]"ingame"
			DlgApi.ShowItem(self.this,--[[!AUTO_209]]"Btn_Pause",true)
			DlgApi.ShowItem(self.this,--[[!AUTO_210]]"Btn_Continue",false)

			--把牌面显示



			for bname,b in pairs(self.BlockList) do
				DlgApi.ShowItem(self.this,b.btn,true)
			end
		end
	end
	-------------------

	function Dlg_MiniGameBSZ:ResizeWindows()
		self.mapscale=DlgApi.GetWindowScale()
	end
	-------------------=============================---------------
	-------------------=============================-------------------
	--洗牌按钮被按下



	function Dlg_MiniGameBSZ:OnWashArrange()

		if self.gamestate~= --[[!AUTO_211]]"ingame" then
			return true
		end

		DlgApi.ShowItem(self.this,--[[!AUTO_212]]"Hint1",false)
		DlgApi.ShowItem(self.this,--[[!AUTO_213]]"Hint2",false)
		DlgApi.ShowItem(self.this,--[[!AUTO_214]]"Pressed",false)
		self.prepress.state = false

		self:wash()
		self.textcounter = 0	--让“请重排”等文字超时

		self:foundhint()

		return true
	end

	function Dlg_MiniGameBSZ:wash()
		if self.soundflag == true then
			GameApi.Play2DSound(TGllk_Sound.Wash)
		end

		for i=#self.BlockList,1,-1 do
			if self.DeleteFlag[i]==false then
				table.remove(self.BlockList,i)
				table.remove(self.DeleteFlag,i)
			end
		end

		self:GenerateMatrix()

		if self.gamestate == --[[!AUTO_215]]"ingame" then
			self.washnum = self.washnum-1
			DlgApi.SetItemText(self.this,--[[!AUTO_216]]"Edit_WashNum",tostring(self.washnum))
		end

		if self.washnum <=0 then
			DlgApi.EnableItem(self.this,--[[!AUTO_217]]"Btn_Wash",false)
		end

	end
	------------------
	function Dlg_MiniGameBSZ:OnHint()
		if self.gamestate~= --[[!AUTO_218]]"ingame" then
			return true
		end

		if not self:foundhint() then
			return
		end

		self.hintnum = self.hintnum -1
		DlgApi.SetItemText(self.this,--[[!AUTO_219]]"Edit_HintNum",tostring(self.hintnum))
		if self.hintnum <= 0 then
			DlgApi.EnableItem(self.this,--[[!AUTO_220]]"Btn_Hint",false)
		end

		for i=1,2 do
			local posi=self.BlockList[ self.hintstore[i] ].i
			local posj=self.BlockList[ self.hintstore[i] ].j
			local x=(posj-1)*TGllk_BlockSize.width+TGllk_MapOrigin.x-(TGllk_HintSize-TGllk_BlockHSize)
			local y=(posi-1)*TGllk_BlockSize.height+TGllk_MapOrigin.y-(TGllk_HintSize-TGllk_BlockHSize)
			self:SetItemPos(--[[!AUTO_221]]"Hint"..i,x,y)
			DlgApi.ShowItem(self.this,--[[!AUTO_222]]"Hint"..i,true)
		end

		if self.soundflag == true then
			GameApi.Play2DSound(TGllk_Sound.Hint)
		end

		return true
	end

	--------------------
	function Dlg_MiniGameBSZ:OnAbandon()
		--放弃游戏，进行清除

		self:EndGame(--[[!AUTO_223]]"fail")
	end

		-----------------------
	function Dlg_MiniGameBSZ:OnLButtonDown(itemName, wParam, x, y)
		if self.gamestate ~= --[[!AUTO_224]]"ingame" then
			return true
		end


		local posx,posy=GameApi.GetCursorPos()
		local tempdlg = DlgApi.GetDialogProp(self.this)
		local mapx = (posx-tempdlg.x)/self.mapscale - TGllk_MapOrigin.x
		local mapy = (posy-tempdlg.y)/self.mapscale - TGllk_MapOrigin.y

		local mapi = math.ceil(mapy/TGllk_BlockSize.height)
		local mapj = math.ceil(mapx/TGllk_BlockSize.width)

		if mapi<1 or mapi>TGllk_MapSize.height or mapj<1 or mapj>TGllk_MapSize.width or self.BlockInMatrix[mapi][mapj]<0.5 then
			return true
		end

		--游戏中

		if self.prepress.state == false then	--游戏中没有预先存放的键值


			self.prepress.block = self.BlockMatrix[mapi][mapj]

			 DlgApi.ShowItem(self.this,--[[!AUTO_225]]"Hint1",false)
			 DlgApi.ShowItem(self.this,--[[!AUTO_226]]"Hint2",false)

			self.prepress.state=true

			local x=(mapj-1)*TGllk_BlockSize.width+TGllk_MapOrigin.x-(TGllk_HintSize-TGllk_BlockHSize)
			local y=(mapi-1)*TGllk_BlockSize.height+TGllk_MapOrigin.y-(TGllk_HintSize-TGllk_BlockHSize)

			self:SetItemPos(--[[!AUTO_227]]"Pressed",x,y)
			DlgApi.ShowItem(self.this,--[[!AUTO_228]]"Pressed",true)
			--连接路径清空
			self.cnroute = {}

		elseif self.prepress.state == true then	--有预存的键值


			self.prepress.state = false
			DlgApi.ShowItem(self.this,--[[!AUTO_229]]"Hint1",false)
			DlgApi.ShowItem(self.this,--[[!AUTO_230]]"Hint2",false)
			DlgApi.ShowItem(self.this,--[[!AUTO_231]]"Pressed",false)

			--图像的种类直接配对失败

			if self.BlockList[ self.prepress.block ].btype ~= self.BlockList[ self.BlockMatrix[mapi][mapj] ].btype then
				--添加失败的提示

				local block  = self.BlockList[self.prepress.block]
				self:ShowFailToConnect(block.i, block.j)
				self:ShowFailToConnect(mapi, mapj)

				if self.soundflag == true then
					GameApi.Play2DSound(TGllk_Sound.ConnectFail)
				end

				DlgApi.SetItemText(self.this,--[[!AUTO_232]]"Lab_TextOut",TGllk_TextBlock)
				self.falsenum = self.falsenum+1
				if self.falsenum > TGllk_PunishCount then
					DlgApi.SetItemText(self.this,--[[!AUTO_233]]"Lab_TextOut",TGllk_TextContiFalse)
					self.timestore = self.timestore - TGllk_PunishTime
					self.falsenum = 0
					self.rewardcounter = -1
				end
				self.textcounter = 2000

				return true
			end

			--点击到了同一幅图片

			if self.BlockList[ self.prepress.block ].i==mapi and self.BlockList[ self.prepress.block ].j==mapj then
				--添加失败的提示

				if self.soundflag == true then
					GameApi.Play2DSound(TGllk_Sound.ConnectFail)
				end

				DlgApi.SetItemText(self.this,--[[!AUTO_234]]"Lab_TextOut",TGllk_TextBlock)
				self.falsenum = self.falsenum+1
				if self.falsenum > TGllk_PunishCount then
					DlgApi.SetItemText(self.this,--[[!AUTO_235]]"Lab_TextOut",TGllk_TextContiFalse)
					self.timestore = self.timestore - TGllk_PunishTime
					self.falsenum = 0
					self.rewardcounter = -1
				end
				self.textcounter = 2000
				return true
			end

			--相同图像通过位置计算配对
			local bp=self.BlockList[self.prepress.block]
			local bn=self.BlockList[self.BlockMatrix[mapi][mapj]]

			local temp = self:Connect(bp,bn)
			if temp ==true then

				local sucsoundflag = false
				self.falsenum = 0

				self.disapearnum = self.disapearnum+1
				self.disapearlist[--[[!AUTO_236]]"Disapear"..self.disapearnum] = { counter = 0, frame = 0, }
				DlgApi.CreateControl(self.this,--[[!AUTO_237]]"Pic_Disapear",--[[!AUTO_238]]"Disapear"..self.disapearnum)
				local x = (bp.j-1)*TGllk_BlockSize.width+TGllk_MapOrigin.x-(TGllk_HintSize-TGllk_BlockHSize)
				local y = (bp.i-1)*TGllk_BlockSize.height+TGllk_MapOrigin.y-(TGllk_HintSize-TGllk_BlockHSize)
				self:SetItemPos(--[[!AUTO_239]]"Disapear"..self.disapearnum,x,y)
				DlgApi.ShowItem(self.this,--[[!AUTO_240]]"Disapear"..self.disapearnum,true)

				self.disapearnum = self.disapearnum+1
				self.disapearlist[--[[!AUTO_241]]"Disapear"..self.disapearnum] = { counter = 0, frame = 0, }
				DlgApi.CreateControl(self.this,--[[!AUTO_242]]"Pic_Disapear",--[[!AUTO_243]]"Disapear"..self.disapearnum)
				local x = (bn.j-1)*TGllk_BlockSize.width+TGllk_MapOrigin.x-(TGllk_HintSize-TGllk_BlockHSize)
				local y = (bn.i-1)*TGllk_BlockSize.height+TGllk_MapOrigin.y-(TGllk_HintSize-TGllk_BlockHSize)
				self:SetItemPos(--[[!AUTO_244]]"Disapear"..self.disapearnum,x,y)
				DlgApi.ShowItem(self.this,--[[!AUTO_245]]"Disapear"..self.disapearnum,true)

				--消除画面的相连接控件
				DlgApi.DeleteControl(self.this,bp.btn)
				DlgApi.DeleteControl(self.this,bn.btn)
				--找到相关的路径



				--显示出路径


				for i=2,#self.cnroute do
					local num = i-1
					local posx = nil
					local posy = nil

					local px = self.cnroute[i][1]
					local py = self.cnroute[i][2]
					local bx = self.cnroute[i-1][1]
					local by = self.cnroute[i-1][2]

					local dx = bx-px
					local dy = by-py

					if math.abs(dx)<0.5 and math.abs(dy)>0.5 then		--竖向
						DlgApi.SetItemSize(self.this,--[[!AUTO_246]]"Line"..num,3,math.abs(dy)*TGllk_BlockSize.height*self.mapscale)
						if dy > 0.5 then
							self:SetItemPos( --[[!AUTO_247]]"Line"..num,(px-0.5)*TGllk_BlockSize.width+TGllk_MapOrigin.x,(py-0.5)*TGllk_BlockSize.height+TGllk_MapOrigin.y )
						else
							self:SetItemPos( --[[!AUTO_248]]"Line"..num,(bx-0.5)*TGllk_BlockSize.width+TGllk_MapOrigin.x,(by-0.5)*TGllk_BlockSize.height+TGllk_MapOrigin.y )
						end
						DlgApi.ShowItem(self.this,--[[!AUTO_249]]"Line"..num,true)
						self.linelist[num].counter = 1
					elseif math.abs(dx)>0.5 and math.abs(dy)<0.5 then		--横向
						DlgApi.SetItemSize(self.this,--[[!AUTO_250]]"Line"..num,math.abs(dx)*TGllk_BlockSize.width*self.mapscale,3)
						if dx > 0.5 then
							self:SetItemPos( --[[!AUTO_251]]"Line"..num,(px-0.5)*TGllk_BlockSize.width+TGllk_MapOrigin.x,(py-0.5)*TGllk_BlockSize.height+TGllk_MapOrigin.y )
						else
							self:SetItemPos( --[[!AUTO_252]]"Line"..num,(bx-0.5)*TGllk_BlockSize.width+TGllk_MapOrigin.x,(by-0.5)*TGllk_BlockSize.height+TGllk_MapOrigin.y )
						end
						DlgApi.ShowItem(self.this,--[[!AUTO_253]]"Line"..num,true)
						self.linelist[num].counter = 1
					end
				end

				self.timestore=self.timestore+TGllk_TimeReward
				if self.timestore>=TGllk_Time then
					self.timestore = TGllk_Time
					DlgApi.SetProgress(self.this,--[[!AUTO_254]]"Prog_Time",1)
				else
					DlgApi.SetProgress(self.this,--[[!AUTO_255]]"Prog_Time",(self.timestore/TGllk_Time))
				end

				self.scorestore = self.scorestore + TGllk_ScoreReward
				DlgApi.SetItemText(self.this,--[[!AUTO_256]]"Edit_Score",tostring(math.floor(self.scorestore)))

				self.DeleteFlag[self.BlockMatrix[bp.i][bp.j]]=false
				self.DeleteFlag[self.BlockMatrix[bn.i][bn.j]]=false
				self.blocksum = self.blocksum-2

				--奖励机制
				self.rewardcounter = self.rewardcounter + TGllk_TimeReward
				if self.rewardcounter > TGllk_RewardThresholdTime then
					self.rewardcounter = self.rewardcounter - TGllk_RewardSucTimeReduce
					if self.rewardcounter < 0 then
						self.rewardcounter = -1
					end
					sucsoundflag = Dlg_MiniGameBSZ:Reward()
				end
				self.textcounter = 2000

				if sucsoundflag == false and self.soundflag == true then
					GameApi.Play2DSound(TGllk_Sound.ConnectSucc)
				end

				--需要判断是否已经消除干净
				if self.blocksum ==0 then
					--已经消除干净，需要进入下一关

					self:EndLevel()
				else
					--需要根据每关的重排规则进行重新排列
					local nod={}
					nod[1]=bp
					nod[2]=bn
					self:realign(nod)
					--找到下一个hint
					self:foundhint()
				end


			else
				local block  = self.BlockList[self.prepress.block]
				self:ShowFailToConnect(block.i, block.j)
				self:ShowFailToConnect(mapi, mapj)

				if self.soundflag == true then
					GameApi.Play2DSound(TGllk_Sound.ConnectFail)
				end

				DlgApi.SetItemText(self.this,--[[!AUTO_257]]"Lab_TextOut",TGllk_TextBlock)
				self.falsenum = self.falsenum+1
				if self.falsenum > TGllk_PunishCount then
					DlgApi.SetItemText(self.this,--[[!AUTO_258]]"Lab_TextOut",TGllk_TextContiFalse)
					self.timestore = self.timestore - TGllk_PunishTime
					self.falsenum = 0
					self.rewardcounter = -1
				end
			   self.textcounter = 2000
			end
		end

		return true
	end

	function Dlg_MiniGameBSZ:ShowFailToConnect (i, j, time)
		time = time or 2000
		local itemName = --[[!AUTO_259]]"FailToConnect"..self.failtoconnectnum
		self.failtoconnectnum = self.failtoconnectnum + 1

		DlgApi.CreateControl(self.this,--[[!AUTO_260]]"Pic_FailToConnect", itemName)

		local x = (j-1)*TGllk_BlockSize.width+TGllk_MapOrigin.x-(TGllk_HintSize-TGllk_BlockHSize)
		local y = (i-1)*TGllk_BlockSize.height+TGllk_MapOrigin.y-(TGllk_HintSize-TGllk_BlockHSize)

		self:SetItemPos(itemName, x, y)
		DlgApi.ShowItem(self.this, itemName, true)

		local leftTime = time
		local function removePic (dtime)
			leftTime = leftTime - dtime
			if leftTime < 0 then
				DlgApi.DeleteControl(self.this, itemName)
				return --[[!AUTO_261]]"end"
			end
		end

		gameActionManager:addAction(removePic)
	end

	--
	function Dlg_MiniGameBSZ:Reward()
		do	--...
			return true
		end

		local reti = 0
		local rettype = 0
		local rewardrate = TGllk_RewardTimeRate
		local rewardarea = TGllk_RewardArea
		local reward = nil

		local flag = false

		--编写奖励
		local rettime = self.timestore/TGllk_Time

		local ret = math.random()
		for retnum = 1,#rewardarea do
			if rettime>=rewardarea[retnum][2] and rettime<= rewardarea[retnum][1] then
				local i = retnum
				if ret<rewardrate[i][1] then
					reti = retnum
					break
				end
			end
		end

		if reti>0 then
			local ret = math.random()
			for retnum = 1,#TGllk_RewardRate[reti] do
				if ret <= TGllk_RewardRate[reti][retnum] then
					rettype = retnum
					break
				end
			end
		end

		if rettype > 0 then
			local ret = math.random(#TGllk_Reward[rettype])
			reward = TGllk_Reward[rettype][ret]
		end

		if reward ~= nil then
			--播放奖励的声音



			if self.soundflag == true then
				GameApi.Play2DSound(TGllk_Sound.SuccReward)
			end
			flag = true

			self.washnum = self.washnum+reward[1]
			self.hintnum = self.hintnum+reward[2]
			if self.hintnum > 99 then
				self.hintnum = 99
			end
			if self.hintnum > 0 then
			   DlgApi.EnableItem(self.this,--[[!AUTO_262]]"Btn_Hint",true)
			end

			if self.washnum > 99 then
				self.washnum = 99
			end
			if self.washnum > 0 then
				 DlgApi.EnableItem(self.this,--[[!AUTO_263]]"Btn_Wash",true)
			end

			self.scorestore = self.scorestore + reward[3]
			self.timestore = self.timestore + reward[4]
			DlgApi.SetItemText(self.this,--[[!AUTO_264]]"Lab_TextOut",reward[5])
		end

		DlgApi.SetItemText(self.this,--[[!AUTO_265]]"Edit_HintNum",tostring(self.hintnum))
		DlgApi.SetItemText(self.this,--[[!AUTO_266]]"Edit_WashNum",tostring(self.washnum))
		DlgApi.SetItemText(self.this,--[[!AUTO_267]]"Edit_Score",tostring(math.floor(self.scorestore)))

		if self.timestore>TGllk_Time then
			DlgApi.SetProgress(self.this,--[[!AUTO_268]]"Prog_Time",1)
			self.timestore = TGllk_Time
		else
			DlgApi.SetProgress(self.this,--[[!AUTO_269]]"Prog_Time",(self.timestore/TGllk_Time))
		end

		if flag == nil then
			flag = true
		end

		return flag
	end

	-- 过关
	function Dlg_MiniGameBSZ:EndLevel()
		self.levelendflag = true
		self.scorestore = self.scorestore + self.hintnum*TGllk_ScoreHint + self.washnum*TGllk_ScoreWash
		self.hintnum = 0
		self.washnum = 0
		DlgApi.SetItemText(self.this,--[[!AUTO_270]]"Edit_HintNum",tostring(self.hintnum))
		DlgApi.SetItemText(self.this,--[[!AUTO_271]]"Edit_WashNum",tostring(self.washnum))
		self:EndGame(--[[!AUTO_272]]"success")
	end
	--
	function Dlg_MiniGameBSZ:realign(nod)
		if self.realignType ==1 then
			self:levelone(nod)
			return true
		elseif self.realignType ==2 then
			self:leveltwo(nod)
			return true
		elseif self.realignType ==3 then
			self:levelthree(nod)
			return true
		elseif self.realignType ==4 then
			self:levelfour(nod)
			return true
		elseif self.realignType ==5 then
			self:levelfive(nod)
			return true
		elseif self.realignType ==6 then
			self:levelsix(nod)
			return true
		elseif self.realignType ==7 then
			self:levelseven(nod)
			return true
		elseif self.realignType ==8 then
			self:leveleight(nod)
			return true
		elseif self.realignType ==9 then
			self:levelnine(nod)
			return true
		elseif self.realignType ==10 then
			self:levelten(nod)
			return true
		elseif self.realignType ==11 then
			self:leveleleven(nod)
			return true
		end
	end
	--level_1 ---保持原地
	function Dlg_MiniGameBSZ:levelone(nod)
		for id = 1,2 do
			p=nod[id]
			self.BlockInMatrix[p.i][p.j] = 0
		end
	end

	--level_2----向下边界落去
	function Dlg_MiniGameBSZ:leveltwo(nod)
		for id=1,2 do
			local p=nod[id]
			self.BlockInMatrix[p.i][p.j] = 0
			for i = p.i-1,1,-1 do
				if self.BlockInMatrix[i][p.j] >0.5 then

					self.BlockMatrix[i+1][p.j] = self.BlockMatrix[i][p.j]
					self.BlockList[self.BlockMatrix[i][p.j]].i=i+1
					self.BlockList[self.BlockMatrix[i][p.j]].j=p.j
					self.BlockInMatrix[i+1][p.j] = self.BlockList[self.BlockMatrix[i][p.j]].btype

				   local ret=DlgApi.GetItemRect(self.this,self.BlockList[ self.BlockMatrix[i+1][p.j] ].btn)
				   local posx=(p.j-1)*TGllk_BlockSize.width+TGllk_MapOrigin.x
				   local posy=(i+1-1)*TGllk_BlockSize.height+TGllk_MapOrigin.y
				   self:SetItemPos(self.BlockList[ self.BlockMatrix[i+1][p.j] ].btn,posx,posy)
				   DlgApi.ShowItem(self.this,self.BlockList[ self.BlockMatrix[i+1][p.j] ].btn,true)

					self.BlockInMatrix[i][p.j]=0

				elseif self.BlockInMatrix[i][p.j] <0.5 then
					self.BlockInMatrix[i+1][p.j] = 0
					break
				end

			end
		end
	end
	--level_3----向左边界落去
	function Dlg_MiniGameBSZ:levelthree(nod)
		for id=1,2 do
			local p=nod[id]
			self.BlockInMatrix[p.i][p.j] = 0
			for j = p.j+1,self.map_w do
				if self.BlockInMatrix[p.i][j] >0.5 then

					self.BlockMatrix[p.i][j-1] = self.BlockMatrix[p.i][j]
					self.BlockList[self.BlockMatrix[p.i][j]].i=p.i
					self.BlockList[self.BlockMatrix[p.i][j]].j=j-1
					self.BlockInMatrix[p.i][j-1] = self.BlockList[self.BlockMatrix[p.i][j]].btype

				   local ret=DlgApi.GetItemRect(self.this,self.BlockList[ self.BlockMatrix[p.i][j-1] ].btn)
				   local posx=(j-1-1)*TGllk_BlockSize.width+TGllk_MapOrigin.x
				   local posy=(p.i-1)*TGllk_BlockSize.height+TGllk_MapOrigin.y
				   self:SetItemPos(self.BlockList[ self.BlockMatrix[p.i][j-1] ].btn,posx,posy)
				   DlgApi.ShowItem(self.this,self.BlockList[ self.BlockMatrix[p.i][j-1] ].btn,true)

					self.BlockInMatrix[p.i][j]=0

				elseif self.BlockInMatrix[p.i][j] <0.5 then
					self.BlockInMatrix[p.i][j-1] = 0
					break
				end

			end
		end
	end
	--level_4-------向上下两边从中间分开
	function Dlg_MiniGameBSZ:levelfour(nod)
		for id=1,2 do
			local p=nod[id]
			local mi = math.floor(self.map_h/2)
			if p.i<=mi then
				va1 = p.i+1
				va2 = mi
				dva = 1
				self.BlockInMatrix[p.i][p.j] = 0
			else
				va1 = p.i-1
				va2 = self.map_h-math.ceil(self.map_h/2)+1
				dva = -1
				self.BlockInMatrix[p.i][p.j] = 0
			end
			for  i=va1,va2,dva do
				if self.BlockInMatrix[i][p.j] >0.5 then

					self.BlockMatrix[i-dva][p.j] = self.BlockMatrix[i][p.j]
					self.BlockList[self.BlockMatrix[i][p.j]].i=i-dva
					self.BlockList[self.BlockMatrix[i][p.j]].j=p.j
					self.BlockInMatrix[i-dva][p.j] = self.BlockList[self.BlockMatrix[i][p.j]].btype

				   local ret=DlgApi.GetItemRect(self.this,self.BlockList[ self.BlockMatrix[i-dva][p.j] ].btn)
				   local posx=(p.j-1)*TGllk_BlockSize.width+TGllk_MapOrigin.x
				   local posy=(i-dva-1)*TGllk_BlockSize.height+TGllk_MapOrigin.y
				   self:SetItemPos(self.BlockList[ self.BlockMatrix[i-dva][p.j] ].btn,posx,posy)
				   DlgApi.ShowItem(self.this,self.BlockList[ self.BlockMatrix[i-dva][p.j] ].btn,true)

					self.BlockInMatrix[i][p.j]=0

				elseif self.BlockInMatrix[i][p.j] <0.5 then
					self.BlockInMatrix[i-dva][p.j] = 0
					break
				end

			end
		end
	end
	---level_5 ---------向左右两边分开
	function Dlg_MiniGameBSZ:levelfive(nod)
		for id=1,2 do
			local p=nod[id]
			local mj = math.floor(self.map_w/2)
			if p.j<=mj then
				va1 = p.j+1
				va2 = mj
				dva = 1
				self.BlockInMatrix[p.i][p.j] = 0
			else
				va1 = p.j-1
				va2 = self.map_w-math.ceil(self.map_w/2)+1
				dva = -1
				self.BlockInMatrix[p.i][p.j] = 0
			end
			for  j=va1,va2,dva do
				if self.BlockInMatrix[p.i][j] >0.5 then

					self.BlockMatrix[p.i][j-dva] = self.BlockMatrix[p.i][j]
					self.BlockList[self.BlockMatrix[p.i][j]].i=p.i
					self.BlockList[self.BlockMatrix[p.i][j]].j=j-dva
					self.BlockInMatrix[p.i][j-dva] = self.BlockList[self.BlockMatrix[p.i][j]].btype

				   local ret=DlgApi.GetItemRect(self.this,self.BlockList[ self.BlockMatrix[p.i][j-dva] ].btn)
				   local posx=(j-dva-1)*TGllk_BlockSize.width+TGllk_MapOrigin.x
				   local posy=(p.i-1)*TGllk_BlockSize.height+TGllk_MapOrigin.y
				   self:SetItemPos(self.BlockList[ self.BlockMatrix[p.i][j-dva] ].btn,posx,posy)
				   DlgApi.ShowItem(self.this,self.BlockList[ self.BlockMatrix[p.i][j-dva] ].btn,true)

					self.BlockInMatrix[p.i][j]=0

				elseif self.BlockInMatrix[p.i][j] <0.5 then
					self.BlockInMatrix[p.i][j-dva] = 0
					break
				end

			end
		end
	end
	---level6 ---------------向中间行收缩

	function Dlg_MiniGameBSZ:levelsix(nod)
		for id=1,2 do
			local p=nod[id]
			local mi = math.floor(self.map_h/2)
			if p.i<=mi then
				va1 = p.i-1
				va2 = 1
				dva = -1
				self.BlockInMatrix[p.i][p.j] = 0
			else
				va1 = p.i+1
				va2 = self.map_h
				dva = 1
				self.BlockInMatrix[p.i][p.j] = 0
			end
			for  i=va1,va2,dva do
				if self.BlockInMatrix[i][p.j] >0.5 then

					self.BlockMatrix[i-dva][p.j] = self.BlockMatrix[i][p.j]
					self.BlockList[self.BlockMatrix[i][p.j]].i=i-dva
					self.BlockList[self.BlockMatrix[i][p.j]].j=p.j
					self.BlockInMatrix[i-dva][p.j] = self.BlockList[self.BlockMatrix[i][p.j]].btype

				   local ret=DlgApi.GetItemRect(self.this,self.BlockList[ self.BlockMatrix[i-dva][p.j] ].btn)
				   local posx=(p.j-1)*TGllk_BlockSize.width+TGllk_MapOrigin.x
				   local posy=(i-dva-1)*TGllk_BlockSize.height+TGllk_MapOrigin.y
				   self:SetItemPos(self.BlockList[ self.BlockMatrix[i-dva][p.j] ].btn,posx,posy)
				   DlgApi.ShowItem(self.this,self.BlockList[ self.BlockMatrix[i-dva][p.j] ].btn,true)

					self.BlockInMatrix[i][p.j]=0

				elseif self.BlockInMatrix[i][p.j] <0.5 then
					self.BlockInMatrix[i-dva][p.j] = 0
					break
				end

			end
		end
	end

	--level7 ----------------列向中间聚拢
	function Dlg_MiniGameBSZ:levelseven(nod)
		for id=1,2 do
			local p=nod[id]
			local mj = math.floor(self.map_w/2)
			if p.j<=mj then
				va1 = p.j-1
				va2 = 1
				dva = -1
				self.BlockInMatrix[p.i][p.j] = 0
			else
				va1 = p.j+1
				va2 = self.map_w
				dva = 1
				self.BlockInMatrix[p.i][p.j] = 0
			end
			for  j=va1,va2,dva do
				if self.BlockInMatrix[p.i][j] >0.5 then

					self.BlockMatrix[p.i][j-dva] = self.BlockMatrix[p.i][j]
					self.BlockList[self.BlockMatrix[p.i][j]].i=p.i
					self.BlockList[self.BlockMatrix[p.i][j]].j=j-dva
					self.BlockInMatrix[p.i][j-dva] = self.BlockList[self.BlockMatrix[p.i][j]].btype

				   local ret=DlgApi.GetItemRect(self.this,self.BlockList[ self.BlockMatrix[p.i][j-dva] ].btn)
				   local posx=(j-dva-1)*TGllk_BlockSize.width+TGllk_MapOrigin.x
				   local posy=(p.i-1)*TGllk_BlockSize.height+TGllk_MapOrigin.y
				   self:SetItemPos(self.BlockList[ self.BlockMatrix[p.i][j-dva] ].btn,posx,posy)
				   DlgApi.ShowItem(self.this,self.BlockList[ self.BlockMatrix[p.i][j-dva] ].btn,true)

					self.BlockInMatrix[p.i][j]=0

				elseif self.BlockInMatrix[p.i][j] <0.5 then
					self.BlockInMatrix[p.i][j-dva] = 0
					break
				end

			end
		end
	end
	---

	---level8 ---------------一半一半，行向左右两边移动
	function Dlg_MiniGameBSZ:leveleight(nod)
		for id=1,2 do
			local p=nod[id]
			local mi = math.floor(self.map_h/2)
			if p.i<=mi then
				va1 = p.j+1
				va2 = self.map_w
				dva = 1
				self.BlockInMatrix[p.i][p.j] = 0
			else
				va1 = p.j-1
				va2 = 1
				dva = -1
				self.BlockInMatrix[p.i][p.j] = 0
			end
			for  j=va1,va2,dva do
				if self.BlockInMatrix[p.i][j] >0.5 then

					self.BlockMatrix[p.i][j-dva] = self.BlockMatrix[p.i][j]
					self.BlockList[self.BlockMatrix[p.i][j]].i=p.i
					self.BlockList[self.BlockMatrix[p.i][j]].j=j-dva
					self.BlockInMatrix[p.i][j-dva] = self.BlockList[self.BlockMatrix[p.i][j]].btype

				   local ret=DlgApi.GetItemRect(self.this,self.BlockList[ self.BlockMatrix[p.i][j-dva] ].btn)
				   local posx=(j-dva-1)*TGllk_BlockSize.width+TGllk_MapOrigin.x
				   local posy=(p.i-1)*TGllk_BlockSize.height+TGllk_MapOrigin.y
				   self:SetItemPos(self.BlockList[ self.BlockMatrix[p.i][j-dva] ].btn,posx,posy)
				   DlgApi.ShowItem(self.this,self.BlockList[ self.BlockMatrix[p.i][j-dva] ].btn,true)

					self.BlockInMatrix[p.i][j]=0

				elseif self.BlockInMatrix[p.i][j] <0.5 then
					self.BlockInMatrix[p.i][j-dva] = 0
					break
				end

			end
		end
	end
	--level9---------------------一半一半，列向上下两边移动
	function Dlg_MiniGameBSZ:levelnine(nod)
		for id=1,2 do
			local p=nod[id]
			local mj = math.floor(self.map_w/2)
			if p.j<=mj then
				va1 = p.i-1
				va2 = 1
				dva = -1
				self.BlockInMatrix[p.i][p.j] = 0
			else
				va1 = p.i+1
				va2 = self.map_h
				dva = 1
				self.BlockInMatrix[p.i][p.j] = 0
			end
			for  i=va1,va2,dva do
				if self.BlockInMatrix[i][p.j] >0.5 then

					self.BlockMatrix[i-dva][p.j] = self.BlockMatrix[i][p.j]
					self.BlockList[self.BlockMatrix[i][p.j]].i=i-dva
					self.BlockList[self.BlockMatrix[i][p.j]].j=p.j
					self.BlockInMatrix[i-dva][p.j] = self.BlockList[self.BlockMatrix[i][p.j]].btype

				   local ret=DlgApi.GetItemRect(self.this,self.BlockList[ self.BlockMatrix[i-dva][p.j] ].btn)
				   local posx=(p.j-1)*TGllk_BlockSize.width+TGllk_MapOrigin.x
				   local posy=(i-dva-1)*TGllk_BlockSize.height+TGllk_MapOrigin.y
				   self:SetItemPos(self.BlockList[ self.BlockMatrix[i-dva][p.j] ].btn,posx,posy)
				   DlgApi.ShowItem(self.this,self.BlockList[ self.BlockMatrix[i-dva][p.j] ].btn,true)

					self.BlockInMatrix[i][p.j]=0

				elseif self.BlockInMatrix[i][p.j] <0.5 then
					self.BlockInMatrix[i-dva][p.j] = 0
					break
				end
			end
		end
	end
	--realignType 10	--------------向外扩散，左右优先



	function Dlg_MiniGameBSZ:levelten(nod)
		local blank = {}
		for id=1,2 do
			local p=nod[id]
			blank[id]={}
			blank[id].j = p.j
			blank[id].i = p.i
			self.BlockInMatrix[p.i][p.j] = 0

			local mj = math.floor(self.map_w/2)
			if p.j<=mj then
				va1 = p.j+1
				va2 = mj
				dva = 1
			else
				va1 = p.j-1
				va2 = self.map_w-math.ceil(self.map_w/2)+1
				dva = -1

			end

			for  j=va1,va2,dva do
				if self.BlockInMatrix[p.i][j] >0.5 then

					self.BlockMatrix[p.i][j-dva] = self.BlockMatrix[p.i][j]
					self.BlockList[self.BlockMatrix[p.i][j]].i=p.i
					self.BlockList[self.BlockMatrix[p.i][j]].j=j-dva
					self.BlockInMatrix[p.i][j-dva] = self.BlockList[self.BlockMatrix[p.i][j]].btype

				   local ret=DlgApi.GetItemRect(self.this,self.BlockList[ self.BlockMatrix[p.i][j-dva] ].btn)
				   local posx=(j-dva-1)*TGllk_BlockSize.width+TGllk_MapOrigin.x
				   local posy=(p.i-1)*TGllk_BlockSize.height+TGllk_MapOrigin.y
				   self:SetItemPos(self.BlockList[ self.BlockMatrix[p.i][j-dva] ].btn,posx,posy)
				   DlgApi.ShowItem(self.this,self.BlockList[ self.BlockMatrix[p.i][j-dva] ].btn,true)

					self.BlockInMatrix[p.i][j]=0
					blank[id].i = p.i
					blank[id].j = j

				elseif self.BlockInMatrix[p.i][j] <0.5 then
					blank[id].i = p.i
					blank[id].j = j-dva

					self.BlockInMatrix[p.i][j-dva] = 0
					break
				end
			end
		end

		--根据空缺，向上下两边分开
		self:levelfour(blank)
	end

	--realignType 11 ---------------向内聚拢，左右优先



	function Dlg_MiniGameBSZ:leveleleven(nod)
		local blank={}
		for id=1,2 do
			local p=nod[id]
			blank[id]={ i=p.i,j=p.j }
			self.BlockInMatrix[p.i][p.j] = 0
			local mj = math.floor(self.map_w/2)
			if p.j<=mj then
				va1 = p.j-1
				va2 = 1
				dva = -1
			else
				va1 = p.j+1
				va2 = self.map_w
				dva = 1
			end

			for  j=va1,va2,dva do
				if self.BlockInMatrix[p.i][j] >0.5 then

					self.BlockMatrix[p.i][j-dva] = self.BlockMatrix[p.i][j]
					self.BlockList[self.BlockMatrix[p.i][j]].i=p.i
					self.BlockList[self.BlockMatrix[p.i][j]].j=j-dva
					self.BlockInMatrix[p.i][j-dva] = self.BlockList[self.BlockMatrix[p.i][j]].btype

				   local ret=DlgApi.GetItemRect(self.this,self.BlockList[ self.BlockMatrix[p.i][j-dva] ].btn)
				   local posx=(j-dva-1)*TGllk_BlockSize.width+TGllk_MapOrigin.x
				   local posy=(p.i-1)*TGllk_BlockSize.height+TGllk_MapOrigin.y
				   self:SetItemPos(self.BlockList[ self.BlockMatrix[p.i][j-dva] ].btn,posx,posy)
				   DlgApi.ShowItem(self.this,self.BlockList[ self.BlockMatrix[p.i][j-dva] ].btn,true)

					self.BlockInMatrix[p.i][j]=0
					blank[id].i = p.i
					blank[id].j = j

				elseif self.BlockInMatrix[p.i][j] <0.5 then
					blank[id].i = p.i
					blank[id].j = j-dva
					self.BlockInMatrix[p.i][j-dva] = 0
					break
				end

			end
		end

		self:levelsix(blank)
	end

	---------------------------------------

	function Dlg_MiniGameBSZ:PictureMatching (map_h, map_w, BlockInMatrix)
		for i = 1, map_h do
			for j = 1, map_w do
				local btype = BlockInMatrix[i][j]

				local function IsMatch (i1, j1, i2, j2)
					-- 先横后纵
					do
						local j1Beg = j1		-- 空闲段开始

						while j1Beg > 1 and BlockInMatrix[i1][j1Beg-1] < 1 do
							j1Beg = j1Beg - 1
						end

						local j1End = j1		-- 空闲段结束

						while j1End < map_w and BlockInMatrix[i1][j1End+1] < 1 do
							j1End = j1End + 1
						end

						local j2Beg = j2
						while j2Beg > 1 and BlockInMatrix[i2][j2Beg-1] < 1 do
							j2Beg = j2Beg - 1
						end

						local j2End = j2
						while j2End < map_w and BlockInMatrix[i2][j2End+1] < 1 do
							j2End = j2End + 1
						end

						-- 空闲段合并

						local jBeg = j1Beg < j2Beg and j2Beg or j1Beg
						local jEnd = j1End < j2End and j1End or j2End

						-- 检查中间段是否空闲
						local iBeg, iEnd
						if i1 < i2 then
							iBeg, iEnd = i1+1, i2-1
						else
							iBeg, iEnd = i2+1, i1-1
						end
						for j = jBeg, jEnd do
							local bMatch = true
							for i = iBeg, iEnd do
								if BlockInMatrix[i][j] > 0 then
									bMatch = false
									break
								end
							end

							if bMatch then
								return true
							end
						end
					end

					-- 先纵后横
					do
						local i1Beg = i1
						while i1Beg > 1 and BlockInMatrix[i1Beg-1][j1] < 1 do
							i1Beg = i1Beg - 1
						end

						local i1End = i1
						while i1End < map_h and BlockInMatrix[i1End+1][j1] < 1 do
							i1End = i1End + 1
						end

						local i2Beg = i2
						while i2Beg > 1 and BlockInMatrix[i2Beg-1][j2] < 1 do
							i2Beg = i2Beg - 1
						end

						local i2End = i2
						while i2End < map_h and BlockInMatrix[i2End+1][j2] < 1 do
							i2End = i2End + 1
						end

						local iBeg = i1Beg < i2Beg and i2Beg or i1Beg
						local iEnd = i1End < i2End and i1End or i2End

						local jBeg, jEnd
						if j1 < j2 then
							jBeg, jEnd = j1+1, j2-1
						else
							jBeg, jEnd = j2+1, j1-1
						end
						for i = iBeg, iEnd do
							local bMatch = true
							for j = jBeg, jEnd do
								if BlockInMatrix[i][j] > 0 then
									bMatch = false
									break
								end
							end

							if bMatch then
								return true
							end
						end
					end
				end

				if btype > 0 then
					do	iNext = i
						for jNext = j+1, map_w do
							if BlockInMatrix[iNext][jNext] == btype then
								if IsMatch(i, j, iNext, jNext) then
									return i, j, iNext, jNext
								end
							end
						end
					end

					for iNext = i+1, map_h do
						for jNext = 1, map_w do
							if BlockInMatrix[iNext][jNext] == btype then
								if IsMatch(i, j, iNext, jNext) then
									return i, j, iNext, jNext
								end
							end
						end
					end
				end
			end
		end
	end

	function Dlg_MiniGameBSZ:foundhint()
		self.hintstore={}
		local sucflag = {}
		local i1, j1, i2, j2 = self:PictureMatching(self.map_h,self.map_w,self.BlockInMatrix)--self:gethint()

		if i1 == nil then
			if self.gamestate == --[[!AUTO_273]]"ingame" and self.washnum <=0 then
				self:EndGame(--[[!AUTO_274]]"fail", TEXT--[[!AUTO_275]]"無法消除\r挑戰失敗")
				--给出失败界面 GameOver
				if self.soundflag == true then
					GameApi.Play2DSound(TGllk_Sound.MissionFai)
				end
				return false
			else
				--提示无法消除
				if self.soundflag == true then
					GameApi.Play2DSound(TGllk_Sound.ConnectFail)
				end
				DlgApi.SetItemText(self.this,--[[!AUTO_276]]"Lab_TextOut", TEXT"無法消除，請重新排列")
				self.textcounter = 1000000
				return false
			end
		end

		self.hintstore[1]=self.BlockMatrix[i1][j1]
		self.hintstore[2]=self.BlockMatrix[i2][j2]

		return true
	end

	--------------------------------------------------------------------
	function Dlg_MiniGameBSZ:OnRButtonDown()
		if self.gamestate ~= --[[!AUTO_278]]"ingame" then
			return true
		end

		DlgApi.ShowItem(self.this,--[[!AUTO_279]]"Hint1",false)
		DlgApi.ShowItem(self.this,--[[!AUTO_280]]"Hint2",false)
		if self.prepress.state == true then
		   self.prepress.state = false
			--处理被按下去的状态，使恢复



		   DlgApi.ShowItem(self.this,--[[!AUTO_281]]"Pressed",false)
		end
		return true

	end
	------------------------
	function Dlg_MiniGameBSZ:Tick(dwDeltaTime)
		if self.levelendflag == true then
			if self.timestore >0  then
				local timeExchage = 2000
				if self.timestore>timeExchage then
					self.scorestore = self.scorestore + TGllk_ScoreTime * timeExchage/1000
					self.timestore = self.timestore - timeExchage
				else
					self.scorestore = self.scorestore + TGllk_ScoreTime*self.timestore/1000
					self.timestore = self.timestore - self.timestore
				end
				DlgApi.SetItemText(self.this,--[[!AUTO_282]]"Edit_Score",tostring(math.floor(self.scorestore)))
				DlgApi.SetProgress(self.this,--[[!AUTO_283]]"Prog_Time",(self.timestore/TGllk_Time))
			else
				self.levelendflag = false
			end
		end

		if self.textcounter >= 0 then
			self.textcounter = self.textcounter - dwDeltaTime
			if self.textcounter <= 0 then
				self.textcounter = -1
				DlgApi.SetItemText(self.this,--[[!AUTO_284]]"Lab_TextOut",--[[!AUTO_285]]"")
			end
		end

		self:LineAction(dwDeltaTime)

		for name,d in pairs(self.disapearlist) do
		   d.counter = d.counter + dwDeltaTime
		   if d.counter> 30 then
			   d.counter = 0
			   d.frame = d.frame + 1
			   if d.frame < 12 then
				   --
			   else
				   self.disapearlist[name] = nil
				   DlgApi.DeleteControl(self.this,name)
			   end
		   end
		end

		-------------------------------------------------------------
		if self.gamestate ~= --[[!AUTO_286]]"ingame" then
			return true
		end

		if self.rewardcounter<0 then
			self.rewardcounter = -1
		else
			self.rewardcounter = self.rewardcounter - dwDeltaTime
		end

		self.timestore=self.timestore-dwDeltaTime
		if self.timestore<=0 then
			--显示分数,GameOver
			self:EndGame(--[[!AUTO_287]]"fail", TEXT--[[!AUTO_288]]"時間結束\r挑戰失敗")

			if self.soundflag == true then
				GameApi.Play2DSound(TGllk_Sound.MissionFai)
			end
		elseif self.timestore>TGllk_Time then
			DlgApi.SetProgress(self.this,--[[!AUTO_289]]"Prog_Time",1)
		else
			DlgApi.SetProgress(self.this,--[[!AUTO_290]]"Prog_Time",(self.timestore/TGllk_Time))
		end

		gameActionManager:tick(dwDeltaTime)
	end

	function Dlg_MiniGameBSZ:LineAction(dwDeltaTime)
		for i,line in ipairs(self.linelist) do
			if line.counter>line.period then
				line.counter = -1
				DlgApi.ShowItem(self.this,--[[!AUTO_291]]"Line"..i,false)
			end
			if line.counter>0 then
				line.counter = line.counter+dwDeltaTime
			end
		end
	end
		------------------------



	--重排方块
	function Dlg_MiniGameBSZ:GenerateMatrix()
	   local gtnum =self.blocksum
	   local gtarray = {}
	   for i=1,gtnum do
		  gtarray[i]=i
	   end

	   for i=1,self.map_h do
		   for j=1,self.map_w do

			   if self.BlockInMatrix[i][j]>0.5 then
				   local apos=math.random(gtnum)
				   self.BlockMatrix[i][j]=gtarray[apos]

				   self.BlockList[ self.BlockMatrix[i][j] ].i = i
				   self.BlockList[ self.BlockMatrix[i][j] ].j = j
				   self.BlockInMatrix[i][j]=self.BlockList[ self.BlockMatrix[i][j] ].btype

				   local ret=DlgApi.GetItemRect(self.this,self.BlockList[ self.BlockMatrix[i][j] ].btn)
				   local posx=(j-1)*TGllk_BlockSize.width+TGllk_MapOrigin.x
				   local posy=(i-1)*TGllk_BlockSize.height+TGllk_MapOrigin.y
				   self:SetItemPos(self.BlockList[ self.BlockMatrix[i][j] ].btn,posx,posy)
				   DlgApi.ShowItem(self.this,self.BlockList[ self.BlockMatrix[i][j] ].btn,true)

				   table.remove(gtarray,apos)
				   gtnum=gtnum-1
			   end

			end
	   end

	end
	----------------
	function Dlg_MiniGameBSZ:Clear()
		DlgApi.DeleteControl(self.this,--[[!AUTO_292]]"Pressed")
		DlgApi.DeleteControl(self.this,--[[!AUTO_293]]"Hint1")
		DlgApi.DeleteControl(self.this,--[[!AUTO_294]]"Hint2")
		DlgApi.DeleteControl(self.this,--[[!AUTO_295]]"Line1")
		DlgApi.DeleteControl(self.this,--[[!AUTO_296]]"Line2")
		DlgApi.DeleteControl(self.this,--[[!AUTO_297]]"Line3")

		for i=1,self.map_h do

			if self.BlockInMatrix[i]~=nil then
				for j=1,self.map_w do

				   if self.BlockInMatrix[i][j]>0.5 then
						DlgApi.DeleteControl(self.this,self.BlockList[ self.BlockMatrix[i][j] ].btn)
						self.BlockInMatrix[i][j]=0
				   end
				end
			end
		end

		for name,d in pairs(self.disapearlist) do
			self.disapearlist[name] = nil
			DlgApi.DeleteControl(self.this,name)
		end

		DlgApi.ShowItem(self.this,--[[!AUTO_298]]"Btn_Abandon",false)
		DlgApi.ShowItem(self.this,--[[!AUTO_299]]"Btn_Pause",false)
		DlgApi.ShowItem(self.this,--[[!AUTO_300]]"Btn_Continue",false)
		DlgApi.ShowItem(self.this,--[[!AUTO_301]]"Btn_SoundOff",false)
		DlgApi.ShowItem(self.this,--[[!AUTO_302]]"Btn_SoundOn",false)
		DlgApi.EnableItem(self.this,--[[!AUTO_303]]"Btn_Hint",false)
		DlgApi.EnableItem(self.this,--[[!AUTO_304]]"Btn_Wash",false)
		DlgApi.ShowItem(self.this, --[[!AUTO_305]]"Img_ResultBack", false)
		DlgApi.ShowItem(self.this, --[[!AUTO_306]]"Btn_Confirm", false)
		DlgApi.ShowItem(self.this, --[[!AUTO_307]]"Lab_Result", false)

	end


	---------------------------
	function Dlg_MiniGameBSZ:Connect(bp,bn)

		local retvalue = false

		if retvalue == false then

		   self.cnroute = {}
		   retvalue = self:ConnectTwo(bp,bn)
		end

		return retvalue
	end
	--------------------
	function Dlg_MiniGameBSZ:ConnectDire(bpi,bpj,bni,bnj)
		local found = true
		local vstart = 0
		local vend = 0

		if bpi==bni then
			if bpj>bnj then
				table.insert(self.cnroute,{bpi,bnj})
				table.insert(self.cnroute,{bpi,bpj})
				vstart=bnj+1
				vend=bpj-1
			else
				table.insert(self.cnroute,{bpi,bpj})
				table.insert(self.cnroute,{bpi,bnj})
				vstart=bpj+1
				vend=bnj-1
			end
			for j=vstart,vend do
				table.insert(self.cnroute,#self.cnroute,{ bpi,j })

				if self.BlockInMatrix[bpi][j] >0.5 then   --有阻碍



					found=false
					self.cnroute = {}
					return found
				end
			end

		elseif bpj==bnj then
			if bpi>bni then
				table.insert(self.cnroute,{bni,bpj})
				table.insert(self.cnroute,{bpi,bpj})
				vstart=bni+1
				vend=bpi-1
			else
				table.insert(self.cnroute,{bpi,bpj})
				table.insert(self.cnroute,{bni,bpj})
				vstart=bpi+1
				vend=bni-1
			end
			for i=vstart,vend do
			   table.insert(self.cnroute,#self.cnroute,{i,bpj})

			   if self.BlockInMatrix[i][bpj] >0.5 then
				   found=false
				   self.cnroute = {}
				   return found
			   end

			end

		end

		return found
	end

	----
	function Dlg_MiniGameBSZ:ConnectOne(bp,bn)
		local found=false

		local tempi=bp.i
		local tempj=bn.j
		if self.BlockInMatrix[tempi][tempj] <0.5 then
		   found = self:ConnectDire(bp.i,bp.j,tempi,tempj)
		   if found == true then
			   found =self:ConnectDire(bn.i,bn.j,tempi,tempj)
		   end
		   if found == true then
			   return found
		   end
		end

		tempi=bn.i
		tempj=bp.j
		if self.BlockInMatrix[tempi][tempj] <0.5 then
		   found = self:ConnectDire(bp.i,bp.j,tempi,tempj)
		   if found == true then
			   found =self:ConnectDire(bn.i,bn.j,tempi,tempj)
		   end
		   if found == true then
			   return found
		   end
		end

		return found
	end

	function Dlg_MiniGameBSZ:ConnectTwo(bp,bn)

		local dire={ {x=-1,y=0},{x=1,y=0},{x=0,y=-1},{x=0,y=1} }
		local bplist={}
		local bnlist={}
		--统计两块牌的可以延伸的中间点
		self:nodlist(bp,dire,bplist)
		self:nodlist(bn,dire,bnlist)

		local found=false
		for i=1,#bplist do
			for j=1,#bnlist do

				if bplist[i].x==bnlist[j].x or bplist[i].y==bnlist[j].y and (not(bplist[i].x==bnlist[j].x and bplist[i].y==bnlist[j].y))  then

				   found = self:ConnectDire(bplist[i].y,bplist[i].x,bnlist[j].y,bnlist[j].x)
				   if found == true then
						self.cnroute = {{bp.j,bp.i},{bplist[i].x,bplist[i].y},{bnlist[j].x,bnlist[j].y},{bn.j,bn.i},}
					  return found
				   end
				end

			end
		end
		return found
	end

	function Dlg_MiniGameBSZ:nodlist(b,dire,blist)

		table.insert(blist,{x=b.j,y=b.i})
		for dir=1,#dire do
		   local nodi = b.i
		   local nodj = b.j
		   while nodi+dire[dir].y>=1 and nodi+dire[dir].y<=TGllk_MapSize.height and nodj+dire[dir].x>=1 and nodj+dire[dir].x<=TGllk_MapSize.width
				and self.BlockInMatrix[nodi+dire[dir].y][nodj+dire[dir].x]<0.5  do

			   table.insert(blist,{x=nodj+dire[dir].x,y=nodi+dire[dir].y})
			   nodi=nodi+dire[dir].y
			   nodj=nodj+dire[dir].x
		   end
		end
	end

	---------------




	function Dlg_MiniGameBSZ:SetItemPos(Item,posx,posy)
	   DlgApi.SetItemPos(self.this,Item, posx*self.mapscale, posy*self.mapscale)
	end



	---------------------------------------------
	---------------------------------------------

	_G[dialogName] = PLUN(Dlg_MiniGameBSZ, --[[!AUTO_308]]dialogName)
end
