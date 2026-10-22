--[[#tag push auto]]
--[[
	此文件从 clue_collection 中的线索获取规则，生成出 TalkTemplate 所需的对话对象
]]

if _DEBUG then	--测试模式
	GameApi = GameApi or {}
	function GameApi.NPCSev_GatherInformation(ID, index)
		print(--[[!AUTO_1]]"GameApi.NPCSev_GatherInformation", ID, index)
	end
end

-- ClueColloectionTalk 类. 可读取 ClueCollectionData 数据，生成符合 TalkTemplate 要求的对话对象
local ClueColloectionTalk = {}
do
	local Class = ClueColloectionTalk
	Class.__index = Class

	function Class.new (...)
		local obj = setmetatable({}, Class)
		obj:init(...)
		return obj
	end

	function Class:init (serviceID, collectionData)
		self.m_serviceID = serviceID
		self.m_data = collectionData
		self.m_step = --[[!AUTO_2]]"begin"
		self.m_seenOptions = {}
		self.m_collectDisableReason = {}
	end

	--
	-- 提供 ClueCollectionData 选项效果
	--

	function Class:toStep (stepID)
		if stepID then
			self.m_stepID = stepID
			return true
		end
	end

	function Class:collect (collectIndex)
		GameApi.NPCSev_GatherInformation(self.m_serviceID, collectIndex)
	end

	--
	--	实现 TalkTemplate 所需的对话对象接口
	--
	function Class:getOptionCount ()
		local step = self.m_data[self.m_step]
		if step and step.options then
			return #step.options
		else
			return 0
		end
	end

	function Class:getOptionText (optionIndex)
		local step = self.m_data[self.m_step]
		if step and step.options then
			local option = step.options[optionIndex]
			if option then
				return option.text
			end
		end
	end

	local l_state = {}
	--若有此选项，则返回 {seen=, enabled=}
	function Class:getOptionState (optionIndex)
		local step = self.m_data[self.m_step]
		if step and step.options then
			local option = step.options[optionIndex]
			if option then
				l_state.seen = not not self.m_seenOptions[option]
				l_state.enabled = true
				l_state.collect = option.collect
				return l_state
			end
		end
	end

	function Class:getText ()
		local step = self.m_data[self.m_step]
		if step then
			return step.text
		end
	end

	function Class:hasNext ()
		local step = self.m_data[self.m_step]
		if step then
			return not not step.next
		end
	end

	function Class:toNext ()
		local step = self.m_data[self.m_step]
		if step and step.next then
			self.m_step = step.next
			return true
		end
	end

	function Class:onOption (optionIndex)
		local step = self.m_data[self.m_step]
		if step and step.options then
			local option = step.options[optionIndex]
			if option then
				self.m_seenOptions[option] = true

				local ret = false
				if option.collect then
					local disableReason = self.m_collectDisableReason[option.collect]
					if disableReason then		--收集被禁用时，显示原因文字，下一步回为起始
						self.m_data.collectDisabled =
						{
							text = disableReason,
							next = --[[!AUTO_3]]"begin"
						}
						self.m_step = --[[!AUTO_4]]"collectDisabled"
						return true
					else
						GameApi.NPCSev_GatherInformation( self.m_serviceID, option.collect)
					end
				end

				if option.next then
					self.m_step = option.next
					ret = true
				end

				return ret
			end
		end
	end

	function Class:onEvent (eventType, ...)
		if eventType == --[[!AUTO_5]]"setCollectDisableReason" then
			return self:setCollectDisableReason(...)
		end
	end

	function Class:hasMore ()
		return self.m_step ~= --[[!AUTO_6]]"end"
	end

	-- 处理事件
	-- 设置某个收集序号为不可用 (reason 为假时为可用)
	function Class:setCollectDisableReason (collectIndex, reason)
		self.m_collectDisableReason[collectIndex] = reason
	end
end


ClueCollectionInterface = {}

-- 生成一个线索收集对话. serviceID: 收集信息服务模板ID
--[[
	填写格式：
		ClueCollectionData[收集信息服务模板ID] = {步骤ID1 = 步骤内容1, 步骤ID2 = 步骤内容2, ...}
	步骤ID一般为字符串。特别地：begin 表示初始步骤, end 表示结束步骤
	步骤内容有
		text: 文字
		next: 下一步骤，对应“下一步”按钮
		options: 选项
		某一选项的内容有
			text: 文字
			collect: 使用收集信息服务，值为服务序号
			next: 点击选项后进入的下一步骤

	数据例

	ClueCollectionData[-1001] =
	{
		begin =	--初始步骤，四个选项
		{
			--text = nil	--无文字
			--next = nil	--不需指定下一步骤
			options =
			{
				{text="仔细检查", next = "A", },	--点击选项后进入步骤A
				{text="检查锁眼", next = "B", },	--点击选项后进入步骤B
				{text="砸开", next = "C", },		--点击选项后进入步骤C
				{text="放弃", next = "end", },		--点击选项后结束对话
			},
		},

		A = 	-- 一段文字
		{
			text = "一个古旧的箱子",
			next = "begin",		--点"下一步"后重新开始
		},

		B =		-- 一段文字
		{
			text = "箱子没有锁上",		--显示一段文字，点"下一步"进入步骤B1
			next = "B1",
		},

		B1 = 	-- 一个选项
		{
			options=
			{
				{text="打开", collect = 1, next = "end", },		--点击选项后使用收集信息服务，然后结束对话
			},
		},

		C = 	-- 一段文字
		{
			text = "箱子成了碎木片",
			next = "end",		--点"下一步"后结束对话
		},
	}
]]
function ClueCollectionInterface:generateTalk (serviceID)
	local simpleData = ClueCollectionData[serviceID]
	if simpleData == nil then
		return
	end

	local collectionData = self:convertTalk(simpleData)
	if collectionData then
		local talk = ClueColloectionTalk.new(serviceID, collectionData)
		return TalkTemplate:registerTalk(talk)
	end
end

-- 生成一个简单线索收集对话.
--[[
	此文件配置线索收集对话
	填写格式：
		ClueCollectionData[收集信息服务模板ID] =
		{
			{ 选项1 },
			{ 选项2 },
			...
			{ 选项N },		--最多8个选项
		}

	选项内容有
		选项文字1, 服务序号1, 提示文字1, 选项文字2, 服务序号2, 提示文字2,
		无对应文字时，文字填空字符串。无服务序号时，服务序号填0

	数据例
	ClueCollectionData[-1001] =		--点NPC，显示3个选项
	{
		--选项1。点“仔细检查”按钮后，显示文字“一个古旧的箱子”，点下一步，回到选项选择
		{ "仔细检查", 0, "一个古旧的箱子",  "", 0, "", },

		--选项2。点“检查锁眼”按钮后，显示文字“箱子已锁上”，点下一步，出现按钮“使用钥匙”，点击后使用1号收集信息服务，
		--  并显示文字“箱子打开了”，点下一步，回到选项选择
		{ "检查锁眼", 0, "箱子已锁上",  "使用钥匙", 1, "箱子打开了", },

		--选项3。点“砸开”按钮后，显示文字“一个古旧的箱子”，点下一步，回到选项选择
		{ "砸开", 2, "箱子成了碎木片",  "", 0, "", },
	}
]]
function ClueCollectionInterface:convertTalk (simpleData)
	-- return new option table
	local function add_branch (data, branch)
		-- return true if add one
		local function add_text_step (steps, text)
			if text and #text > 0 then
				steps[#steps+1] = {text=text}
				return true
			end
		end

		-- return true if add one
		local function add_one_option_step (steps, text, collect)
			if text and #text > 0 then
				steps[#steps+1] = { options = {{text=text, collect = collect}} }
				return true
			end
		end

		local function set_next (step, next)
			if step.options then
				step.options[1].next = next
			else
				step.next = next
			end
		end

		local steps = {}
		if not add_one_option_step(steps, branch[1], branch[2]) then	--必须有第一个选项
			return
		end
		add_text_step(steps, branch[3])
		add_one_option_step(steps, branch[4], branch[5])
		add_text_step(steps, branch[6])

		-- 设置 next, 从后向前
		local prevID
		for i=#steps, 1, -1 do
			local step = steps[i]
			if i == #steps then
				set_next(step, --[[!AUTO_7]]"begin")
			else
				set_next(step, prevID)
			end

			prevID = #data + 1
			if i == 1 then
				return step.options[1]
			else
				data[prevID] = step
			end
		end
	end

	local collectionData = {}
	do
		local options = {}
		for iBranch=1, #simpleData do
			local branch = simpleData[iBranch]
			local option = add_branch(collectionData, branch)
			if option then
				options[#options+1] = option
			end
		end

		collectionData.begin = {options = options}
	end
	return collectionData
end
