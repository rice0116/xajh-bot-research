--[[#encode ansi]]
--[[#tag push auto]]


VoconManager = {}

function VoconManager:OnTraining(idVoice,tagVoice,isSucc)
	local sMsg = string.format(--[[!AUTO_1]][====[VoconTraining: %s(%d)
]====],tagVoice,idVoice)
	LogPrint(sMsg)
end

function VoconManager:OnRecognize(idVoice,tagVoice)
	local sMsg = string.format(--[[!AUTO_2]][====[VoconRecognize: %s(%d)
]====],tagVoice,idVoice)
	LogPrint(sMsg)

	if idVoice == 101 then
		if GameApi.IsDialogVisible(--[[!AUTO_3]][====[Win_Inventory]====]) then
			GameApi.ShowAUIDialog(--[[!AUTO_4]][====[Win_Inventory]====],false)
		else
			GameApi.ShowAUIDialog(--[[!AUTO_5]][====[Win_Inventory]====],true)
		end
	elseif idVoice == 102 then
		GameApi.UseItemByID(3619)
	elseif idVoice == 103 then
		GameApi.UseSkillByID(1031)
	end
end
