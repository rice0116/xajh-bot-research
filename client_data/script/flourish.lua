Flourish = {}

----------------------------------------------------
--数据配置区
Flourish.Reputation = 46
Flourish.Award = 
{
	{Repu = 10, Award = 13344},
	{Repu = 40, Award = 13345},
	{Repu = 80, Award = 13346},
	{Repu = 100, Award = 13347},
}
----------------------------------------------------


----------------------------------------------------
--客户端用接口
function Flourish:GetRepuId()
	return Flourish.Reputation
end

function Flourish:GetAwardCfg()
	return Flourish.Award
end
----------------------------------------------------


----------------------------------------------------
--服务器用接口
function GetFlourishRepuId()
	return Flourish.Reputation
end

function GetFlourishAward()
	local tbl = {}
	for k,v in pairs(Flourish.Award) do
		tbl[#tbl + 1] = v.Repu
		tbl[#tbl + 1] = v.Award
	end
	tbl[#tbl + 1] =  #tbl
	return unpack(tbl)
end
----------------------------------------------------

