--[[#tag push auto]]


--[[
	定义通用过话过程接口
	一个对话过程分为多个步骤，每个步骤可以有一段对话和多个选项，用户可(使用默认选项)进入下一步骤，或选择选项进入下一步骤
	对话过程接口负责对话状态的存储和释放

	对话过程接口将函数调用消息转发给对话过程对象，若对话过程对象无相应的处理函数，则接口返回nil
]]

local TalkTemplate = {}
_G.TalkTemplate = TalkTemplate

TalkTemplate.m_talks = {}

-- 分配一个全局唯一的对话ID, ID为正整数
function TalkTemplate:registerTalk (talk)
	local id = #self.m_talks + 1
	self.m_talks[id] = talk
	return id
end

--释放对话 (若分配对话ID而未释放，将造成内存泄漏)
function TalkTemplate:releaseTalk (talkId)
	self.m_talks[talkId] = nil
end

function TalkTemplate:getTalk (talkId)
	return self.m_talks[talkId]
end

function TalkTemplate:isValidTalkId (talkId)
	return not not self.m_talks[talkId]
end

--取得对话当前选项数量
function TalkTemplate:getOptionCount (talkId)
	local talk = self.m_talks[talkId]
	if talk and talk.getOptionCount then
		return talk:getOptionCount()
	end
end

--取得对话当前某一选项文本
function TalkTemplate:getOptionText (talkId, optionIndex)
	local talk = self.m_talks[talkId]
	if talk and talk.getOptionText then
		return talk:getOptionText(optionIndex)
	end
end

--取得对话当前某一选项状态
function TalkTemplate:getOptionState (talkId, optionIndex)
	local talk = self.m_talks[talkId]
	if talk and talk.getOptionState then
		return talk:getOptionState(optionIndex)
	end
end

--取得对话当前文本
function TalkTemplate:getText (talkId)
	local talk = self.m_talks[talkId]
	if talk and talk.getText then
		return talk:getText()
	end
end

--有下一步骤
function TalkTemplate:hasNext (talkId)
	local talk = self.m_talks[talkId]
	if talk and talk.hasNext then
		return talk:hasNext()
	end
end

--对话进入下一步骤，若对话状态改变则返回 true
function TalkTemplate:toNext (talkId)
	local talk = self.m_talks[talkId]
	if talk and talk.toNext then
		return talk:toNext()
	end
end

--使用选项(对话将进入下一步骤)，若对话状态改变则返回 true
function TalkTemplate:onOption (talkId, optionIndex)
	local talk = self.m_talks[talkId]
	if talk and talk.onOption then
		return talk:onOption(optionIndex)
	end
end

--处理外部消息，若对话状态改变则返回 true
function TalkTemplate:onEvent (talkId, ...)
	local talk = self.m_talks[talkId]
	if talk and talk.onEvent then
		return talk:onEvent(...)
	end
end

--若对话已结束，则应返回 false; 否则应返回 true
function TalkTemplate:hasMore (talkId)
	local talk = self.m_talks[talkId]
	if talk and talk.hasMore then
		return talk:hasMore()
	end
end
