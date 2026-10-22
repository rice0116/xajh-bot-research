--[[#encode ansi]]
--[[#tag push auto]]
IvtrType =
{
	EQUIPPACK = 0,	--	Equipment
	PACK	  = 1,	--	Normal pack
	TASKITEM  = 2,	--	Task Item pack
	MATERIAL  = 3,	--	Material pack
	TRASHBOX  = 4,	--	Trash box
	PETPACK   = 5,	--	Pet pack
	RECYCLE   = 6,	--	Recycle pack -194,43,-164
}

AutoMoveCB = {}

function AutoMoveCB:Execute(idScript)
	local callback = AutoMoveCB[idScript]
	if callback then
		local exeFunc = callback.Execute
		if exeFunc then
			exeFunc()
		end
	end
end

-- return call back id. load script as function, run it with param
function AutoMoveCB:RegisterScript(script, param)
	if type(script) ~= --[[!AUTO_1]][====[string]====] then
		return
	end

	local CallBackID = #AutoMoveCB + 1
	local CallBack =
	{
		Execute = function ()
			local f, err = loadstring(script)
			if f then
				local bRet, err = pcall(f, param)
				if not bRet then
					printf((--[[!AUTO_2]][====[AutoMoveCB fail to call script: %s]====]):format(script))
				end
			else
				printf((--[[!AUTO_3]][====[AutoMoveCB fail to load script: %s]====]):format(script))
			end

			AutoMoveCB[CallBackID] = nil	--delete the callback after execution
		end
	}

	AutoMoveCB[CallBackID] = CallBack
	return CallBackID
end

-- return call back id
function AutoMoveCB:RegisterPlayPose(poseID)
	local CallBackID = #AutoMoveCB + 1
	local CallBack =
	{
		Execute = function ()
			GameApi.PlayPose(poseID)

			AutoMoveCB[CallBackID] = nil	--delete the callback after execution
		end
	}

	AutoMoveCB[CallBackID] = CallBack
	return CallBackID
end

AutoMoveCB[168] =
{
	Execute = function()
		CGApi.StopCG()
		GameApi.UseSkillItemToPos(IvtrType.PACK,3098,-194,43,-164)
		CGApi.PlayCG(119)
	end,
}

AutoMoveCB[171] =
{
	Execute = function()
		LogPrint(--[[!AUTO_4]][====[Œ“ÚTÒR‹á»Î∏£÷›......
]====])
	end,
}
