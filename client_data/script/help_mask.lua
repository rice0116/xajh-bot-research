--HelpMask在GameApi中提供的函数为 GameApi.HasHelpMask(idBit)
HelpMask = {}

--最大合成页
HelpMask.MaxBitNum  = 256
HelpMask.ComPageNum = 32

HelpMask.Config = 
{
	[1] = "装备随机合成",
	[2] = "装备固定合成",
}

function HelpMask:GetConfig()
	return HelpMask.Config
end

