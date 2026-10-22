-- NOTE This is a GBK file
-- 注意：此文件为编辑器(ModEditorEx)与客户端共用脚本，不应依赖于编辑器未模拟的客户端脚本
-- 配合 modeditorex.lua，附注：禁用PLUN

local assert = assert
local mathrandom = math.random
local type = type
local debuggetinfo = debug.getinfo
local tostring = tostring

local ECMVoice = ECMVoice or {}
local ECMApi = ECMApi
local LogPrintA = LogPrintA
local GameApi = GameApi

local GameApiEditor do		-- 模拟Api
	GameApiEditor = {}

	local l_playerBasicProp =
	{
		name = "player name",
		prof = 0,
		prof2 = 0,
		proflevel = 0,
		proflevel2 = 0,
		gender = 0,				-- 使用 l_playerCharacteristic.gender 更好
		level = 1,
		hp = 1,
		mp1 = 1,
		mp2 = 1,
		maxhp = 100,
		maxmp1 = 100,
		maxmp2 = 100,
		pklevel = 0,
		teamleaderrid = 0,
		masterid = 0,
	}

	-- 提示：数值可修改以用于调试
	function GameApiEditor.GetPlayerBasicProp ()
		return l_playerBasicProp
	end

	local l_playerCharacteristic =		-- 参考 EC_PLAYER_DIYPARAM
	{
		gender = 0,		-- 0男, 1女, 2扶他(?)
		physique = 0,	-- 0普通, 1精瘦, 强壮
		style = 0,
		face = 0,
	}

	function GameApiEditor.GetPlayerCharacteristic ()
		return l_playerCharacteristic
	end

	local l_comboPhase = 4

	function GameApiEditor.GetCurComboPhase ()
		return l_comboPhase
	end

	-- 调试用
	function GameApiEditor.SetCurComboPhase (value)
		l_comboPhase = value
	end

	local l_soundFlag =
	{}

	function GameApiEditor.GetPrintSoundFlag (iFlag)
		return l_soundFlag[iFlag]
	end

	-- 调试用
	function GameApiEditor.SetPrintSoundFlag (iFlag, value)
		l_soundFlag[iFlag] = value
	end

	local l_systemVoiceVolume = 0.8
	function GameApiEditor.GetSystemVoiceVolume ()
		return l_systemVoiceVolume
	end

	-- 调试用
	function GameApiEditor.SetSystemVoiceVolume (value)
		l_systemVoiceVolume = value
	end
end

function ECMVoice.SetApiMode (mode)
	if mode == "game" then
		GameApi = _G.GameApi
	elseif mode == "editor" then
		GameApi = GameApiEditor
		_G.GameApiECMVoice = GameApiEditor
	end
end

function ECMVoice.IsHpLow (playerId)
	local prop = GameApi.GetPlayerBasicProp(playerId)
	return prop.hp < prop.maxhp * 0.35
end

-- return 0~100
local function GetSystemVolume ()
	local volume = GameApi.GetSystemVoiceVolume() * 100
	if volume < 0 then volume = 0 end
	if volume > 100 then volume = 100 end
	return volume
end

function ECMVoice.PlaySound (model, actChannel, file)
	local params = {SPI_FilePath=file, SPI_MinDist=1, SPI_MaxDist=2, SPI_FixSpeed=true, SPI_Volume=GetSystemVolume(), SPI_IsAbsoluteVolume=true}
	local name = tostring(params)	-- 每次不同
	ECMApi.ECM_ActPlaySfx(name, model, actChannel, params)
end

-- 为生成每个脚本事件生成一个Key。现在的实现使用了debug库，且依赖于底层实现，不是好的方法
local function GenerateUniqueKey (levelplus)
	return assert(debuggetinfo(3 + (levelplus or 0), "f").func, "do not use a tail call")		-- key 为填写脚本生成的函数
end

ECMVoice.randomRecord = {}
setmetatable(ECMVoice.randomRecord, {__mode="k"})

-- 在多个文件中随机选择并播放, files = {file1, file2, ...} 可选
-- 例1 Path (0x1234, "laugh\\01.wav")
-- 例2 Path(0x1234, "laugh", {"01.wav", "02.wav", "03.wav"})
function ECMVoice.PlayVoice (playerId, model, actChannel, subPath, files, extraParams, uniqueKey)
	local characteristic = assert(GameApi.GetPlayerCharacteristic(playerId))
	local gender = characteristic.gender
	local physique = characteristic.physique
	local style = characteristic.style	--0 普通，1 Loli/Shota

	local voiceDir
	if gender == 0 then
		voiceDir = physique == 0 and "男主角\\热血" or physique == 1 and "男主角\\正太" or "男主角\\冷酷"
	else
		if style == 0 then
			voiceDir = physique == 0 and "女主角\\清纯" or physique == 1 and "女主角\\萝莉" or "女主角\\春哥"
		elseif style == 1 then
			voiceDir = "萝莉"
		else
			assert(false)
		end
	end

	local sfxFile
	local sel
	if type(files)=="table" then
		if files ~= nil then
			uniqueKey = uniqueKey or GenerateUniqueKey()
		end
		local lastSel = ECMVoice.randomRecord[uniqueKey]
		sel = mathrandom(#files)
		for i=1, 4 do
			if sel == lastSel then		-- 重复了就再选一次，最多再选4次
				sel = mathrandom(#files)
			else
				break
			end
		end
		ECMVoice.randomRecord[uniqueKey] = sel
		local file = files[sel]
		sfxFile = ("voice\\%s\\%s\\%s"):format(voiceDir, subPath, file)
	else
		sfxFile = ("voice\\%s\\%s"):format(voiceDir, subPath)
	end

	local minDist = 1
	local maxDist = 15
	if extraParams then
		minDist = extraParams.minDist or minDist
		maxDist = extraParams.maxDist or maxDist
	end
	local params = {SPI_FilePath=sfxFile, SPI_MinDist=minDist, SPI_MaxDist=maxDist,
					SPI_FixSpeed=true, SPI_Volume=GetSystemVolume(), SPI_IsAbsoluteVolume=true}
	local name = tostring(params)	-- 每次不同
	ECMApi.ECM_ActPlaySfx(name, model, actChannel, params)

	-- 输出Log
	if GameApi.GetPrintSoundFlag(6) then
		if sel then
			LogPrintA( ("播放配音: %s. 随机选择: %d"):format(sfxFile, sel) )
		else
			LogPrintA( ("播放配音: %s"):format(sfxFile) )
		end
	end
end

-- 按给定几率返回 true
function ECMVoice.Probably (prob)
	return mathrandom() <= prob
end

-- 按给定几率播放
function ECMVoice.ProbablyPlayVoice (playerId, model, actChannel, prob, subPath, files, extraParams, uniqueKey)
	if ECMVoice.Probably(prob) then
		if files ~= nil then
			uniqueKey = uniqueKey or GenerateUniqueKey()
		end
		return ECMVoice.PlayVoice(playerId, model, actChannel, subPath, files, extraParams, uniqueKey)
	end
end

function ECMVoice.IsFinishMove ()
	return GameApi.GetCurComboPhase() == 4
end

-- phy = "normal", "thin" or "robust"
function ECMVoice.IsPhysique (phy)
	local characteristic = GameApi.GetPlayerCharacteristic(playerId)
	local physique = characteristic and characteristic.physique or ""

	if physique == 0 then
		if phy == "normal" or phy == "标准" then
			return true
		end
	elseif physique == 1 then
		if phy == "thin" or phy == "精瘦" then
			return true
		end
	elseif physique == 2 then
		if phy == "robust" or phy == "强壮" then
			return true
		end
	end
	return false
end

_G.ECMVoice = ECMVoice
