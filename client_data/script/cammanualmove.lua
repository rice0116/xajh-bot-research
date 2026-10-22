CamManualMove = {}

CamManualMove[1615] = 
{
	-- 版面id
	[1] = 
	{
		lookatpos = { -68.4263, 94.3938, -215.374 },		-- 相机初始看向的位置
		offsetpos = { -35, 18, -30 },			-- 相机初始离看向位置的偏移量
		lookatregionid = 1073742126, 				-- 相机看向位置的限制区域id
		viewregionid = 1073741910,					-- 实际想要相机看到的区域的id	
	},
	[2] = 
	{
		lookatpos = { 29.5867, 88.3904, -198.905 },		-- 相机初始看向的位置
		offsetpos = { 40, 28, -25 },			-- 相机初始离看向位置的偏移量
		lookatregionid = 1073742129, 				-- 相机看向位置的限制区域id
		viewregionid = 1073741912,					-- 实际想要相机看到的区域的id	
	},
	[3] = --过渡版面复制前一个
	{
		lookatpos = { 29.5867, 88.3904, -198.905 },		-- 相机初始看向的位置
		offsetpos = { 40, 28, -25 },			-- 相机初始离看向位置的偏移量
		lookatregionid = 1073742129, 				-- 相机看向位置的限制区域id
		viewregionid = 1073741912,					-- 实际想要相机看到的区域的id	
	},
	[4] = 
	{
		lookatpos = { 52.0452, 119.007, -104.625 },		-- 相机初始看向的位置
		offsetpos = { 40, 15, -5 },			-- 相机初始离看向位置的偏移量
		lookatregionid = 1073742131, 				-- 相机看向位置的限制区域id
		viewregionid = 1073741916,					-- 实际想要相机看到的区域的id	
	},
	[5] = 
	{
		lookatpos = { -19.0258, 146.088, -135.679 },		-- 相机初始看向的位置
		offsetpos = { -30, 15, 13 },			-- 相机初始离看向位置的偏移量
		lookatregionid = 1073742134, 				-- 相机看向位置的限制区域id
		viewregionid = 1073741924,					-- 实际想要相机看到的区域的id	
	},
	[6] = 
	{
		lookatpos = { -59.4266, 158.439, -59.4266 },		-- 相机初始看向的位置
		offsetpos = { 15, 15, -33 },			-- 相机初始离看向位置的偏移量
		lookatregionid = 1073742137, 				-- 相机看向位置的限制区域id
		viewregionid = 1073741928,					-- 实际想要相机看到的区域的id	
	},
	[7] = 
	{
		lookatpos = { -60.9449, 162.242, -1.24426 },		-- 相机初始看向的位置
		offsetpos = { 5, 20, -30 },			-- 相机初始离看向位置的偏移量
		lookatregionid = 1073742139, 				-- 相机看向位置的限制区域id
		viewregionid = 1073741930,					-- 实际想要相机看到的区域的id	
	},
	[8] = 
	{
		lookatpos = { 51.5576, 198.984, 157.936 },		-- 相机初始看向的位置
		offsetpos = { -12, 40, -32 },			-- 相机初始离看向位置的偏移量
		lookatregionid = 1073742140, 				-- 相机看向位置的限制区域id
		viewregionid = 1073741935,					-- 实际想要相机看到的区域的id	
	},
	[9] = 
	{
		lookatpos = { 93.1415, 186.055, 69.7651 },		-- 相机初始看向的位置
		offsetpos = { 25, 18, 25 },			-- 相机初始离看向位置的偏移量
		lookatregionid = 1073742241, 				-- 相机看向位置的限制区域id
		viewregionid = 1073741937,					-- 实际想要相机看到的区域的id	
	},
	[10] = --9 10 公用一个摄像机曲线
	{
		lookatpos = { 101.661, 198.17, 9.86464 },		-- 相机初始看向的位置
		offsetpos = { 25, 18, 20 },			-- 相机初始离看向位置的偏移量
		lookatregionid = 1073742142, 				-- 相机看向位置的限制区域id
		viewregionid = 1073741941,					-- 实际想要相机看到的区域的id	
	},
}

function CamManualMove:GetCamManualParam( idScene, idBoard )
	-- body
	local tmpCamScene = CamManualMove[idScene]
	if tmpCamScene ~= nil then
		local tmpCamBoard = tmpCamScene[idBoard]
		if tmpCamBoard ~= nil then
			return tmpCamBoard.lookatpos[1], tmpCamBoard.lookatpos[2], tmpCamBoard.lookatpos[3], tmpCamBoard.offsetpos[1], tmpCamBoard.offsetpos[2], tmpCamBoard.offsetpos[3], tmpCamBoard.lookatregionid, tmpCamBoard.viewregionid
		end
	end
end