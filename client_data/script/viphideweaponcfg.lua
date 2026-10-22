VipHideWeaponCfg = {}

VipHideWeaponCfg.HideGfx = 
{
	[0] = "场景\\点光源\\灯蓝.gfx",		-- 新手
	[1] = "界面\\门派图案标示\\少林图案标示旋转.gfx",		-- 少林
	[2] = "界面\\门派图案标示\\武当图案标示旋转.gfx",		-- 武当
	[3] = "界面\\门派图案标示\\华山图案标示旋转.gfx",		-- 华山
	[4] = "界面\\门派图案标示\\恒山图案标示旋转.gfx",		-- 恒山
	[5] = "界面\\门派图案标示\\衡山图案标示旋转.gfx",		-- 衡山
	[6] = "界面\\门派图案标示\\日月图案标示旋转.gfx",		-- 日月
	[7] = "界面\\门派图案标示\\五仙图案标示旋转.gfx",		-- 五仙
	[8] = "界面\\门派图案标示\\逍遥图案标示旋转.gfx",		-- 逍遥
	[9] = "界面\\门派图案标示\\唐门图案标示旋转.gfx",		-- 唐门
	[10] = "界面\\门派图案标示\\峨眉图案标示旋转.gfx",		-- 峨眉
	[11] = "界面\\门派图案标示\\独孤图案标示旋转.gfx",		-- 独孤
	[12] = "界面\\门派图案标示\\武罗图案标示旋转.gfx",		-- 武罗
}

VipHideWeaponCfg.HideHeight = 0.0

-- 返回vip隐藏gfx
function VipHideWeaponCfg:GetVipHideGfx( profession )
	-- body
	return VipHideWeaponCfg.HideGfx[profession]
end

function VipHideWeaponCfg:GetVipHideHeight( ... )
	-- body
	return VipHideWeaponCfg.HideHeight
end