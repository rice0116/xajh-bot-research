ScreenMaskBoard = {}

function ScreenMaskBoard:GetConfig(id)
	return BoardTable[id]
end

-- ID
SCREENBOARD_ID_NORMAL 		= 1		--	普通（近距远距）
SCREENBOARD_ID_LOGINMASK 	= 2		--	登陆界面用
SCREENBOARD_ID_VITALSKILL 	= 3		--	大招蒙版
SCREENBOARD_ID_SANDENV 		= 4		--	黄沙
SCREENBOARD_ID_FOGENV 		= 5		--	大雾
SCREENBOARD_ID_TASKTALK		= 6		--	任务对话

-- 近距/远距定义

BoardTable =
{
	[SCREENBOARD_ID_NORMAL] = 		--	普通（近距远距）
	{
		-- 近距蒙版配置
		{
			"surfaces\\蒙版_半透.dds",		--近距纹理路径
			28,				--纹理Alpha通道：中间透明部分的半径
			0xff19183b,		--左上顶点的颜色
			0xff19183b,		--右上顶点的颜色
			0xff19183b,		--左下顶点的颜色
			0xff19183b,		--右下顶点的颜色
		},
		-- 远距蒙版配置
		{
			"surfaces\\蒙版_全白.dds",		--远距纹理路径
			28,				--纹理Alpha通道：中间透明部分的半径
			0xff030012,		--左上顶点的颜色
			0xff030012,		--右上顶点的颜色
			0xff030012,		--左下顶点的颜色
			0xff030012,		--右下顶点的颜色
		}
	},
	
	[SCREENBOARD_ID_LOGINMASK] = 	--	登陆界面用
	{
		-- 近距蒙版配置
		{
			"surfaces\\xajh\\底板\\透明70.tga",		--近距纹理路径
			0,				--纹理Alpha通道：中间透明部分的半径
			0xb2ffffff,		--左上顶点的颜色
			0xb2ffffff,		--右上顶点的颜色
			0xb2ffffff,		--左下顶点的颜色
			0xb2ffffff,		--右下顶点的颜色
		},
		-- 远距蒙版配置
		{
			"",				--近距纹理路径
			0,				--纹理Alpha通道：中间透明部分的半径
			0xb2ffffff,		--左上顶点的颜色
			0xb2ffffff,		--右上顶点的颜色
			0xb2ffffff,		--左下顶点的颜色
			0xb2ffffff,		--右下顶点的颜色
		}
	},

	[SCREENBOARD_ID_VITALSKILL] = 	--	大招蒙版
	{
		-- 近距蒙版配置
		{
			"surfaces\\蒙版_全白.dds",		--近距纹理路径
			0,				--纹理Alpha通道：中间透明部分的半径
			0xee000000,		--左上顶点的颜色
			0xee000000,		--右上顶点的颜色
			0xdd000000,		--左下顶点的颜色
			0xdd000000,		--右下顶点的颜色
		},
		-- 远距蒙版配置
		{
			"",				--近距纹理路径
			0,				--纹理Alpha通道：中间透明部分的半径
			0xb2ffffff,		--左上顶点的颜色
			0xb2ffffff,		--右上顶点的颜色
			0xb2ffffff,		--左下顶点的颜色
			0xb2ffffff,		--右下顶点的颜色
		}
	},

	[SCREENBOARD_ID_SANDENV] = 		--	黄沙
	{
		-- 近距蒙版配置
		{
			"surfaces\\蒙版_半透.dds",		--近距纹理路径
			28,				--纹理Alpha通道：中间透明部分的半径
			0xffe7d298,		--左上顶点的颜色
			0xffe7d298,		--右上顶点的颜色
			0xffe7d298,		--左下顶点的颜色
			0xffe7d298,		--右下顶点的颜色
		},
		-- 远距蒙版配置
		{
			"surfaces\\蒙版_全白.dds",	--近距纹理路径
			28,				--纹理Alpha通道：中间透明部分的半径
			0xffcdae5b,		--左上顶点的颜色
			0xffcdae5b,		--右上顶点的颜色
			0xffcdae5b,		--左下顶点的颜色
			0xffcdae5b,		--右下顶点的颜色
		}
	},

	[SCREENBOARD_ID_FOGENV] = 		--	大雾
	{
		-- 近距蒙版配置
		{
			"surfaces\\蒙版_半透.dds",		--近距纹理路径
			28,				--纹理Alpha通道：中间透明部分的半径
			0xffbfd4e1,		--左上顶点的颜色
			0xffbfd4e1,		--右上顶点的颜色
			0xffbfd4e1,		--左下顶点的颜色
			0xffbfd4e1,		--右下顶点的颜色
		},
		-- 远距蒙版配置
		{
			"surfaces\\蒙版_全白.dds",	--近距纹理路径
			28,				--纹理Alpha通道：中间透明部分的半径
			0xffd7f0ff,		--左上顶点的颜色
			0xffd7f0ff,		--右上顶点的颜色
			0xffd7f0ff,		--左下顶点的颜色
			0xffd7f0ff,		--右下顶点的颜色
		}
	},	

	[SCREENBOARD_ID_TASKTALK] = 		--	任务对话
	{
		-- 近距蒙版配置
		{
			"surfaces\\蒙版_暗角.dds",		--近距纹理路径
			28,				--纹理Alpha通道：中间透明部分的半径
			0xff000000,		--左上顶点的颜色
			0xff000000,		--右上顶点的颜色
			0xff000000,		--左下顶点的颜色
			0xff000000,		--右下顶点的颜色
		},
		-- 远距蒙版配置
		{
			"",		--远距纹理路径
			28,				--纹理Alpha通道：中间透明部分的半径
			0xff000000,		--左上顶点的颜色
			0xff000000,		--右上顶点的颜色
			0xff000000,		--左下顶点的颜色
			0xff000000,		--右下顶点的颜色
		}
	},
		
}
