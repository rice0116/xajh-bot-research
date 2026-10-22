--[[
提供礼包轮盘参数
]]--
local PLUN = function (v) return v or true end
--~ local PLUN = loadfile "test/plun.lua" "script/interfaces/lottery1.lua"		-- 仅用于调试，调试完毕注释此行

local mathsqrt = math.sqrt

local Win_Lottery1 = DlgTemplate:new{this = "Win_Lottery1"}

-- 初始化时此函数被调用
function Win_Lottery1:OnRouletteReset ()
	self.rouletteData =
	{
		stopAngle = 0,
		
		angle = 0,
		speed = 0,
		leftAngleToStop = 0,
		
		bSlowDown = false,
	}
end

-- 开始转动时此函数被调用, stopAngle: 停止的角度，单位为度
function Win_Lottery1:OnRouletteStart (stopAngle)
	local rouletteData = self.rouletteData
	
	rouletteData.stopAngle = stopAngle
	rouletteData.speed = 0		-- 从零开始加速
end

-- 拉杆回位时此函数被调用
function Win_Lottery1:OnRouletteSlowDown ()
	local rouletteData = self.rouletteData
	rouletteData.bSlowDown = true
end

-- 转动过程中此函数被调用，停止时返回 true
function Win_Lottery1:TickRoulette (dtime)
	-- 旋转速度参数
	local ROULETTE_SPEED_END = 50		-- deg/s
	local ROULETTE_SPEED_MAX = 700
	local ROULETTE_ACCELERATE = 800		-- deg/s^2 (minus)
	local ROULETTE_DECELERATE = 200
	local ROULETTE_DECELERATE_END = 30

	local rouletteData = self.rouletteData
	
	local angle = rouletteData.angle
	local speed = rouletteData.speed
	local leftAngleToStop = rouletteData.leftAngleToStop
	
	local dAngle = speed * dtime / 1000
	local angle = angle + dAngle
	while angle > 360 do
		angle = angle - 360
	end
	
	if not rouletteData.bSlowDown then		-- 还未开始减速
		speed = speed + ROULETTE_ACCELERATE * dtime/1000
		if speed > ROULETTE_SPEED_MAX then
			speed = ROULETTE_SPEED_MAX
		end
		leftAngleToStop = rouletteData.stopAngle - angle + 360 * 4
	else
		local v2 = ROULETTE_SPEED_MAX
		local v1 = ROULETTE_SPEED_END
		local slowDownPart = (v2*v2 - v1*v1)/(2*ROULETTE_DECELERATE)
		local endPart = (v1*v1)/(2*ROULETTE_DECELERATE_END)
		
		if leftAngleToStop > slowDownPart + endPart then
--~ 			print("max")--D
			speed = ROULETTE_SPEED_MAX;
		elseif leftAngleToStop > endPart then
--~ 			print("slow")--D
			speed = mathsqrt((leftAngleToStop - endPart)/slowDownPart * (v2*v2 - v1*v1) + v1*v1)
		else
--~ 			print("stop")--D
			speed = mathsqrt(leftAngleToStop/endPart * (v1*v1))
		end

		leftAngleToStop = leftAngleToStop - dAngle
	end
	
	rouletteData.angle = angle
	rouletteData.speed = speed
	rouletteData.leftAngleToStop = leftAngleToStop
	
	if leftAngleToStop <= 0	then	-- end
		rouletteData.angle = rouletteData.stopAngle
		return true
	end
end

-- 指针角度
function Win_Lottery1:GetRouletteAngle ()
	return self.rouletteData.angle
end

-- 指针指向第1个元素时的偏转角度(deg)
function Win_Lottery1:GetRouletteAngleOffset()
	return -9
end

-- 拉杆在非运行状态时的回位速度，单位 1/1000 每秒
function Win_Lottery1:GetHandleStopSpeed()
	return 2000
end

-- 拉杆在运行状态时的回位速度
function Win_Lottery1:GetHandleRunSpeed()
	return 600
end

_G.Win_Lottery1 = PLUN(Win_Lottery1, "Win_Lottery1")
