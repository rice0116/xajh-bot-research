RandomInstance 	      = {}
RandomInstance.TidTab = {}

--根据副本ID获取随机副本界面ID，若返回0，则表示该副本不是随机副本
function RandomInstance:GetRandomInstanceUiId(idInst)
	for k, v in pairs(RandomInstance.TidTab) do
		for i=1, #v do
			if v[i] == idInst then
				return k
			end
		end
	end

	return 0
end

--界面ID表
RandomInstance.TidTab =
{
	--目标积分和战斗积分界面，ID为1，10281为随机副本ID，一个界面ID对应多个随机副本ID
	[1] = {10281},
}