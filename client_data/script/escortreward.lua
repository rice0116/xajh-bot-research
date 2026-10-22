--帮派大镖 排名<--->奖励模板,索引即排名
-- 第一个数值对应的是排名靠后的其他名次统一使用的模板, 其它为名次依次奖励模板
--帮主奖励{从第二个开始按排名排序}
RankFactionEscortRewardMap = {}
RankFactionEscortRewardMap[1] = {10959, 10955, 10956, 10956, 10957, 10957, 10957, 10957, 10957, 10957, 10957, 10958, 10958, 10958, 10958, 10958, 10958, 10958, 10958, 10958, 10958}

--帮众奖励{按排名排序}
RankFactionEscortRewardMap[2] = {10959, 10955, 10956, 10956, 10957, 10957, 10957, 10957, 10957, 10957, 10957, 10958, 10958, 10958, 10958, 10958, 10958, 10958, 10958, 10958, 10958}

--帮会奖励{按排名排序}
RankFactionEscortRewardMap[3] = {10963, 10964, 10960, 10960, 10961, 10961, 10961, 10961, 10961, 10961, 10961, 10962, 10962, 10962, 10962, 10962, 10962, 10962, 10962, 10962, 10962,}


function GetRankFactionEscortRewardInfo()
	local rst = {}
	rst[#rst + 1] = #RankFactionEscortRewardMap
	for rwType, rwVal in pairs(RankFactionEscortRewardMap) do
		local rwCount = #rwVal
		rst[#rst + 1] = rwCount
		for i = 1, rwCount do
			rst[#rst + 1] = rwVal[i]
		end
	end
	return #rst, unpack(rst)
end

--帮派运镖奖励公式
--计算结果1.0 + ratio, ratio 可为正为负
function RankFactionEscortRewardRatio(consumeTime)
	local baseRatio = 1.0
	local timeFactorRatio = 0.1
	
	local rst = baseRatio + timeFactorRatio
	if rst <= 0 then
		rst = 0.1
	end
	return rst
end


