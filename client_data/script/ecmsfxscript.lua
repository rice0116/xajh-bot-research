-- NOTE This is a GBK file
-- 注意：此文件为编辑器(ModEditorEx)与客户端共用脚本，不应依赖于编辑器未模拟的客户端脚本
-- 配合 modeditorex.lua

local assert = assert
local mathrandom = math.random
local type = type
local debuggetinfo = debug.getinfo
local tostring = tostring

local ECMSfx = ECMSfx or {}
local ECMApi = ECMApi
local LogPrintA = LogPrintA
local GameApi = GameApi

local GameApiEditor do		-- 模拟Api
	GameApiEditor = {}
	
	local l_soundFlag =
	{}

	function GameApiEditor.GetPrintSoundFlag (iFlag)
		return l_soundFlag[iFlag]
	end

	-- 调试用
	function GameApiEditor.SetPrintSoundFlag (iFlag, value)
		l_soundFlag[iFlag] = value
	end
end

function ECMSfx.SetApiMode (mode)
	if mode == "game" then
		GameApi = _G.GameApi
	elseif mode == "editor" then
		GameApi = GameApiEditor
		_G.GameApiECMSfx = GameApiEditor
	end
end

function ECMSfx.PlaySound (model, actChannel, file)
	local params = {SPI_FilePath=file}
	local name = tostring(params)	-- 每次不同
	ECMApi.ECM_ActPlaySfx(name, model, actChannel, params)
	
	-- 输出Log
	if GameApi.GetPrintSoundFlag(0) then
		LogPrintA( ("播放音效: %s"):format(file) )
	end
end

-- parentEvent: 编辑器中的 self, silentHeaderLength: 音频文件前的静音长度
function ECMSfx.PlaySoundEx (parentEvent, model, actChannel, file, silentHeaderLength)
	local params = {SPI_FilePath=file, SPI_SilentHeader=silentHeaderLength or 0, SPI_ParentEvent=parentEvent}
	local name = tostring(params)	-- 每次不同
	ECMApi.ECM_ActPlaySfx(name, model, actChannel, params)
	
	-- 输出Log
	if GameApi.GetPrintSoundFlag(0) then
		LogPrintA( ("播放音效: %s"):format(file) )
	end
end

_G.ECMSfx = ECMSfx
