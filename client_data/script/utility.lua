--[[#tag push auto]]

local pairs, setmetatable, type = pairs, setmetatable, type;

local function CopyTable(src)
	local inst={};
	local k, v;
	for k, v in pairs(src) do
		if type(v) == --[[!AUTO_1]]"table" then
			inst[k] = CopyTable(v);
		else
			inst[k] = v;
		end
	end
	local mt = getmetatable(src);
	setmetatable(inst, mt);
	return inst;
end

function CreateObj(template, obj)
	local inst = obj or {};
	local k, v;
	for k, v in pairs(template) do
		if (not inst[k]) and type(v) ~= --[[!AUTO_2]]"function" then
			if type(v)== --[[!AUTO_3]]"table" and v ~= template then
				inst[k] = CopyTable(v);
			end
		end
	end
	setmetatable(inst, template);
	template.__index = template;
	return inst;
end

-------------------------------------随机函数----------------------------------------------

function GlobalRandom(range, count)
local result = {}
math.randomseed(os.time())
math.random()
	for i = 1, count do
		table.insert(result, #(result), math.random(range))
	end
	if #(result) > 0 then
		return result
	else
		return nil
	end
end

--[[
	随机选择，尽量避免重复

	items 选项数组
	groupID 组ID
	duration 时间长度, 单位为ms
	return iSel, item

	随机选择，尽量避免在duration时间内选到 groupID 相同且内容相同的项
]]
local RandomSelectNew_records = {}
local RandomSelectNew_buffer = {}
local function RandomSelectNew (items, groupID, duration)
	if #items == 0 then
		return nil
	end

	--查找历史选择记录
	local record = RandomSelectNew_records[groupID]
	if record == nil then
		record = {}
		RandomSelectNew_records[groupID] = record
	end
	local buffer = RandomSelectNew_buffer

	local curTime = GameApi.GetMSTime()

	--清除超时的记录
	for k, recordTime in pairs(record) do
		if recordTime + duration < curTime then
			record[k] = nil
		end
	end

	--选出未重复的项，并找出上次最早被选出的项
	local iNextNew = 1
	local iFirst = nil
	local firstTime = curTime
	for i = 1, #items do
		local item = items[i]
		local recordTime = record[item]

		if recordTime then	--已重复
			if recordTime < firstTime then
				iFirst = i
				firstTime = recordTime
			end
		else	--未重复
			buffer[iNextNew] = i
			iNextNew = iNextNew + 1
		end
	end


	--随机
	local iSel
	if iNextNew > 1 then
		local i = math.random(iNextNew-1)
		iSel = buffer[i]
	else	--都已重复过
		iSel = iFirst or math.random(#items)
	end

	local item = items[iSel]
	record[item] = curTime

	return iSel, item
end
_G.RandomSelectNew = RandomSelectNew

function RandomNewItem (items, groupID, duration)
	local i, item = RandomSelectNew(items, groupID, duration)
	return item
end

--
--test RandomSelectNew
if false then
	math.randomseed(os.time())
	math.random()

	GameApi = {}
	local curTime = 0
	function GameApi.GetMSTime()
		return curTime
	end

	assert(RandomSelectNew({}, {}, 200) == nil)

	local items = {--[[!AUTO_4]]"a", --[[!AUTO_5]]"b", --[[!AUTO_6]]"c"}
	for groupID = 1, 10 do
		curTime = 0
		local i1 = RandomSelectNew(items, groupID, 200)
		curTime = 50
		local i2 = RandomSelectNew(items, groupID, 200)
		curTime = 100
		local i3 = RandomSelectNew(items, groupID, 200)
		assert(i1 ~= i2)
		assert(i1 ~= i3)
		assert(i2 ~= i3)

		curTime = 201
		assert(i1 == RandomSelectNew(items, groupID, 200))
		assert(i2 == RandomSelectNew(items, groupID, 200))
		assert(i3 == RandomSelectNew(items, groupID, 200))
	end
	assert(false, --[[!AUTO_7]]"test succeed!")
end
--test end
--

-------------------------------------------------
--counter
Counter =
{
	    m_Period = 0;
	    m_Counter = 0;
}


function Counter:new()
	  return CreateObj(self);
end

function Counter:SetPeriod(period)
			self.m_Period = period;
end

function Counter:GetPeriod()
			return self.m_Period;
end

function Counter:Reset()
		  self.m_Counter = 0;
end

function Counter:IncCounter(counter)
		self.m_Counter = self.m_Counter + counter;
		return (self.m_Counter >= self.m_Period);
end

function Counter:IsFull()
		 return (self.m_Counter >= self.m_Period);
end

