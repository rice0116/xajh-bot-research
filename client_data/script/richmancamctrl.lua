RichManCamCtrl = {}

RichManCamCtrl.IntanceIDTable = {}

RichManCamCtrl.IntanceIDTable = { -- 副本ID
	1234,
	68,
	1111,
	10137,
}

RichManCamCtrl[1234] = -- 副本ID
{
	bFixYaw		= 1,	--yaw旋转是否固定
	bFixPitch	= 1,	--pitch旋转是否固定
	bFixDist	= 1,	--摄像机距离是否固定
	yaw			= 100,	--如果yaw固定，此值为yaw角度，否则忽略（配0）
	pitch		= 30,	--如果pitch固定，此值为pitch角度，否则忽略（配0）
	dist		= 25,	--如果dist固定，此值为dist，否则忽略（配0）
}
RichManCamCtrl[10137] = -- 游乐场_炸弹人
{
	bFixYaw		= 1,	--yaw旋转是否固定
	bFixPitch	= 1,	--pitch旋转是否固定
	bFixDist	= 1,	--摄像机距离是否固定
	yaw			= 90,	--如果yaw固定，此值为yaw角度，否则忽略（配0）
	pitch		= 50,	--如果pitch固定，此值为pitch角度，否则忽略（配0）
	dist		= 16,	--如果dist固定，此值为dist，否则忽略（配0）
}
RichManCamCtrl[68] = 
{
	bFixYaw		= 1,	
	bFixPitch	= 1,	
	bFixDist	= 1,	
	yaw			= 100,	
	pitch		= 30,	
	dist		= 25,	
}
RichManCamCtrl[1111] = 
{
	bFixYaw		= 1,	
	bFixPitch	= 1,	
	bFixDist	= 1,	
	yaw			= 100,	
	pitch		= 30,	
	dist		= 25,	
}

function RichManCamCtrl:GetCamParam( idInstance )
	-- body
	local tmpCamParam = RichManCamCtrl[idInstance]
	if tmpCamParam ~= nil then
		return tmpCamParam.bFixYaw, tmpCamParam.bFixPitch, tmpCamParam.bFixDist, tmpCamParam.yaw, tmpCamParam.pitch, tmpCamParam.dist
	end
end

function RichManCamCtrl:IsNeedSetRichManInstanceParam( idInstance )
	-- body
	local k, v
	for k, v in pairs (RichManCamCtrl.IntanceIDTable) do
		if v == idInstance then
			return true
		end
	end

	return false
end