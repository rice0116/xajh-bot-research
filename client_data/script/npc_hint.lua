--[[
	定制NPC特殊悬浮提示
	默认为NPC名字
	
	NPCHint.HintTable 格式：
	{
		[npcTid] = "Hint 文字",		--方式1，填写文本，优点：简便
		[npcTid] = function return ... end,		--方式2，填写函数，优点：可随条件变化
		...
	}
	
	当Hint为nil时，将显示默认Hint；当Hint为空字符串时(即"")，不会显示Hint
]]
local type = type

NPCHint = {}

-- 生成一个函数，当 函数fCond 结果为真时返回 resultTrue, 否则返回 resultFalse
local function ConditionFunc (fCond, resultTrue, resultFalse)
	return function ()
		if fCond() then
			return resultTrue
		else
			return resultFalse
		end
	end
end

--[[
	有任务taskId时，显示 hintWithTask，否则显示 hintWithNoTask. 提示：hint 可设为nil以显示默认Hint
	例：
	[3245] = IfHasTask(4397, "测试NPCHint 3245", nil),
]]
local function IfHasTask (taskId, hintWithTask, hintWithNoTask)
	return ConditionFunc(function () return GameApi.HasTask(taskId) end, hintWithTask, hintWithNoTask)
end

NPCHint.HintTable =
{
	--测试条件Hint
	[3245] = IfHasTask(3766, "NPCHint 测试 3245", nil),
	--测试无Hint
	[3248] = "",
}

function NPCHint:HasSpecialHint (npcTid)
	return self.HintTable[npcTid] ~= nil
end

-- 若使用默认Hint，应不返回任何值(或返回nil)
function NPCHint:GetHint(npcTid)
	local hintContent = self.HintTable[npcTid]
	
	if hintContent == nil then						--默认hint
		return
	elseif type(hintContent) == "string" then		--固定hint
		return hintContent
	elseif type(hintContent) == "function" then		--可变hint
		return hintContent()
	else		--未知
		return
	end
end
