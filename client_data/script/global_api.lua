--[[#tag push auto]]

--100
lua_glb = {}
math.randomseed(os.time())

function lua_glb:check_md5(mapid)
	local maps = {}
	local files = {}

	--files["Maps\\a11\\a11.ecbsd"] = "A3FF3653054C78B2B79DC18A5B0216D4";
	--files["Maps\\a11\\region.clt"] = "8D4D81F5BF646AA9F52EA682A143DF8C";
	--maps["a11"] = files;

	--files = {}
	--files["Maps\\a16\\a16.ecbsd"] = "47F081DF188456A6CACCBC0A9A904016";
	--files["Maps\\a16\\region.clt"] = "A543B0ACEC5F680B583989001F05420C";
	--maps["a16"] = files;

	--files = {}
	--files["Maps\\a17\\a17.ecbsd"] = "40DD578070D367BD784288E4271DEA8B";
	--files["Maps\\a17\\region.clt"] = "D74636CE3D424F0DAC5665E3CA831B03";
	--maps["a17"] = files;

	--files = {}
	--files["Maps\\a23\\region.clt"] = "B5778FE257DA9BD478202F033BBEF979";
	--maps["a23"] = files;

	--files = {}
	--files["Maps\\a24\\a24.ecbsd"] = "5C404E17276916B06F6B7C0C8892A556";
	--files["Maps\\a24\\region.clt"] = "C89AA26F6AC012482627FFBC013A9A8B";
	--maps["a24"] = files;

	local files_to_check = maps[string.lower(mapid)]
	if files_to_check == nil then
		return true
	end

	local f, m
	for f,m in pairs(files_to_check) do
		md5 = GlobalApi.lua_glb_CalcFileMd5(f)
		if string.lower(m) ~= string.lower(md5) then
			return false
		end
	end

 	return true
end

-------------------------------------随机函数----------------------------------------------

function GlobalRandom(range, count)
local result = {}
math.random()
	for i = 1, count do
		local val = math.random(range)
		table.insert(result, #(result), val)
	end
	return result
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

	local curTime = GlobalApi.GetMSTime()

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

	GlobalApi = {}
	local curTime = 0
	function GlobalApi.GetMSTime()
		return curTime
	end

	assert(RandomSelectNew({}, {}, 200) == nil)

	local items = {--[[!AUTO_1]]"a", --[[!AUTO_2]]"b", --[[!AUTO_3]]"c"}
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
	assert(false, --[[!AUTO_4]]"test succeed!")
end
--test end
--
