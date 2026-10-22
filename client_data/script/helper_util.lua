---------------------------------------------------------------------------------
--¼ÆÊ±Æ÷
ECTimer = 
{
	m_Period = 0, 
	m_Time   = 0,
}

function ECTimer:New(obj)
	obj = obj or {}
	setmetatable(obj, self)
	self.__index = self
	obj.m_Period = 0
	obj.m_Time   = 0
	return obj
end

function ECTimer:IsValid()
	if self.m_Time and self.m_Period and self.m_Period > 0 then
		return true
	end
	return false
end

function ECTimer:SetPeriod(period)
	self.m_Period = period
end

function ECTimer:GetPeriod()
	return self.m_Period
end

function ECTimer:SetTime(tm)
	self.m_Time = tm
end

function ECTimer:GetTime()
	return self.m_Time
end

function ECTimer:Reset()
	self.m_Time   = 0
	self.m_Period = 0
end

function ECTimer:IncTime(step)
	if self:IsValid() then
		if self.m_Time < self.m_Period then 
			self.m_Time = self.m_Time + step 
		end
		return self:IsEnd()
	end
	return false
end

function ECTimer:IsEnd()
	if self:IsValid() then
		if self.m_Time >= self.m_Period then
			return true
		end
	end
	return false
end

function ECTimer:Finish()
	if self:IsValid() then
		self.m_Time = self.m_Period
	end
end

---------------------------------------------------------------------------------
