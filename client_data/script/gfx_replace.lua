GfxReplace		= {}

DefaultGfxCfg = {}

DefaultGfxCfg["冰雪"] = "雪地.gfx"
DefaultGfxCfg["草"] = "绿草地.gfx"
DefaultGfxCfg["沙石"] = "沙滩.gfx"
DefaultGfxCfg["山石"] = "默认.gfx"
DefaultGfxCfg["石地面"] = "默认.gfx"
DefaultGfxCfg["土地"] = "默认.gfx"

DefaultGfxCfg_InWater = "水面.gfx"
DefaultGfxCfg_OnWater = "水面.gfx"

ReplaceGfxCfg	= {}

function GfxReplace:GetReplaceName()
	return "默认.gfx"
end

function GfxReplace:ReplaceGfx(gfx_path, creature_ptr)
	local env,ground_type,is_on_ornament = GameApi.GetMoveEnvInfo(creature_ptr)
	local scene_id = GameApi.GetSceneID()
	local cfg_id   = scene_id
	local gfx_replace = ReplaceGfxCfg[cfg_id] and ReplaceGfxCfg[cfg_id].default or "默认.gfx"
	local gfx_special = GameApi.GetMoveSpecialGFX(creature_ptr)

	if gfx_special ~= nil then
		return gfx_special
	end
	
	if env and ground_type then
		if env == 0 then
			if ReplaceGfxCfg[cfg_id] and ReplaceGfxCfg[cfg_id][env] and ReplaceGfxCfg[cfg_id][env][ground_type] then
				gfx_replace = ReplaceGfxCfg[cfg_id][env][ground_type][1]
			else
				local tex_name = GameApi.GetGroundTexName(ground_type)
				if DefaultGfxCfg[tex_name] then
					gfx_replace = DefaultGfxCfg[tex_name];
				end
			end
		elseif env == 1 then
		  if ReplaceGfxCfg[cfg_id] and ReplaceGfxCfg[cfg_id][env] and ReplaceGfxCfg[cfg_id][env][0] then
				gfx_replace = ReplaceGfxCfg[cfg_id][env][0][1]
			else
				gfx_replace = DefaultGfxCfg_InWater
			end
		elseif env == 2 then
		  if ReplaceGfxCfg[cfg_id] and ReplaceGfxCfg[cfg_id][env] and ReplaceGfxCfg[cfg_id][env][0] then
				gfx_replace = ReplaceGfxCfg[cfg_id][env][0][1]
			else
				gfx_replace = DefaultGfxCfg_OnWater
			end
		end
	end

	return gfx_replace
end

-----------------------------------------------------------------------------------------------------------------
--策划美术配置区
-----------------------------------------------------------------------------------------------------------------
ReplaceGfxCfg[3] =
{
	--地面
	[0] = 
	{
		--LandType
		[0]  = {"默认.gfx",},
		[1]  = {"草地.gfx",},
		[2]  = {"草地.gfx",},
		[3]  = {"土黄草地.gfx",},
		[4]  = {"雪地.gfx",},
		[5]  = {"草地.gfx",},
		[6]  = {"雪地.gfx",},
		[7]  = {"默认.gfx",},
        [8]  = {"草地.gfx",},
        [9]  = {"草地.gfx",},
        [10] = {"草地.gfx",},
	},
	--水中
	[1] = 
	{
		--LandType
		[0] = {"水面.gfx",},
	},
	--水上
	[2] = 
	{
		--LandType
		[0] = {"水面.gfx",},
	},
}
ReplaceGfxCfg[16] =
{
	--地面
	[0] = 
	{
		--LandType
		[0]  = {"绿草地.gfx",},
		[1]  = {"默认.gfx",},
		[2]  = {"默认.gfx",},
		[3]  = {"默认.gfx",},
		[4]  = {"默认.gfx",},
		[5]  = {"默认.gfx",},
		[6]  = {"默认.gfx",},
		[7]  = {"绿草地.gfx",},
	},
	--水中
	[1] = 
	{
		--LandType
		[0] = {"水面.gfx",},
	},
	--水上
	[2] = 
	{
		--LandType
		[0] = {"水面.gfx",},
	},
}
ReplaceGfxCfg[4] =
{
	--地面
	[0] = 
	{
		--LandType
		[0]  = {"绿草地.gfx",},
		[1]  = {"默认.gfx",},
		[2]  = {"绿草地.gfx",},
		[3]  = {"默认.gfx",},
		[4]  = {"默认.gfx",},
	},
	--水中
	[1] = 
	{
		--LandType
		[0] = {"水面.gfx",},
	},
	--水上
	[2] = 
	{
		--LandType
		[0] = {"水面.gfx",},
	},
}
ReplaceGfxCfg[15] =
{
	--地面
	[0] = 
	{
		--LandType
		[0]  = {"绿草地.gfx",},
		[1]  = {"默认.gfx",},
		[2]  = {"土黄草地.gfx",},
		[3]  = {"默认.gfx",},
		[4]  = {"默认.gfx",},
		[5]  = {"默认.gfx",},
	},
	--水中
	[1] = 
	{
		--LandType
		[0] = {"水面.gfx",},
	},
	--水上
	[2] = 
	{
		--LandType
		[0] = {"水面.gfx",},
	},
}
ReplaceGfxCfg[54] =
{
	--地面
	[0] = 
	{
		--LandType
		[0]  = {"绿草地.gfx",},
		[1]  = {"默认.gfx",},
		[2]  = {"默认.gfx",},
		[3]  = {"绿草地.gfx",},
		[4]  = {"绿草地.gfx",},
		[5]  = {"默认.gfx",},
		[6]  = {"默认.gfx",},
		[7]  = {"默认.gfx",},
	},
	--水中
	[1] = 
	{
		--LandType
		[0] = {"水面.gfx",},
	},
	--水上
	[2] = 
	{
		--LandType
		[0] = {"水面.gfx",},
	},
}
ReplaceGfxCfg[2] =
{
	--地面
	[0] = 
	{
		--LandType
		[0]  = {"默认.gfx",},
		[1]  = {"绿草地.gfx",},
		[2]  = {"绿草地.gfx",},
		[3]  = {"默认.gfx",},
		[4]  = {"默认.gfx",},
		[5]  = {"默认.gfx",},
	},
	--水中
	[1] = 
	{
		--LandType
		[0] = {"水面.gfx",},
	},
	--水上
	[2] = 
	{
		--LandType
		[0] = {"水面.gfx",},
	},
}
ReplaceGfxCfg[5] =
{
	--地面
	[0] = 
	{
		--LandType
		[0]  = {"绿草地.gfx",},
		[1]  = {"绿草地.gfx",},
		[2]  = {"默认.gfx",},
	},
	--水中
	[1] = 
	{
		--LandType
		[0] = {"水面.gfx",},
	},
	--水上
	[2] = 
	{
		--LandType
		[0] = {"水面.gfx",},
	},
}
ReplaceGfxCfg[7] =
{
	--地面
	[0] = 
	{
		--LandType
		[0]  = {"绿草地.gfx",},
		[1]  = {"绿草地.gfx",},
		[2]  = {"绿草地.gfx",},
		[3]  = {"默认.gfx",},
		[4]  = {"绿草地.gfx",},
		[5]  = {"默认.gfx",},
	},
	--水中
	[1] = 
	{
		--LandType
		[0] = {"水面.gfx",},
	},
	--水上
	[2] = 
	{
		--LandType
		[0] = {"水面.gfx",},
	},
}
ReplaceGfxCfg[6] =
{
	--地面
	[0] = 
	{
		--LandType
		[0]  = {"默认.gfx",},
		[1]  = {"默认.gfx",},
		[2]  = {"默认.gfx",},
		[3]  = {"默认.gfx",},
		[4]  = {"默认.gfx",},
		[5]  = {"雪地.gfx",},
		[6]  = {"雪地.gfx",},
	},
	--水中
	[1] = 
	{
		--LandType
		[0] = {"水面.gfx",},
	},
	--水上
	[2] = 
	{
		--LandType
		[0] = {"水面.gfx",},
	},
}
ReplaceGfxCfg[8] =
{
	--地面
	[0] = 
	{
		--LandType
		[0]  = {"默认.gfx",},
		[1]  = {"默认.gfx",},
		[2]  = {"土黄草地.gfx",},
	},
	--水中
	[1] = 
	{
		--LandType
		[0] = {"水面.gfx",},
	},
	--水上
	[2] = 
	{
		--LandType
		[0] = {"水面.gfx",},
	},
}
ReplaceGfxCfg[9] =
{
	--地面
	[0] = 
	{
		--LandType
		[0]  = {"土黄草地.gfx",},
		[1]  = {"土黄草地.gfx",},
		[2]  = {"默认.gfx",},
		[3]  = {"默认.gfx",},
		[4]  = {"默认.gfx",},
		[5]  = {"默认.gfx",},
	},
	--水中
	[1] = 
	{
		--LandType
		[0] = {"水面.gfx",},
	},
	--水上
	[2] = 
	{
		--LandType
		[0] = {"水面.gfx",},
	},
}
ReplaceGfxCfg[10] =
{
	--地面
	[0] = 
	{
		--LandType
		[0]  = {"绿草地.gfx",},
		[1]  = {"默认.gfx",},
		[2]  = {"绿草地.gfx",},
		[3]  = {"默认.gfx",},
		[4]  = {"默认.gfx",},
	},
	--水中
	[1] = 
	{
		--LandType
		[0] = {"水面.gfx",},
	},
	--水上
	[2] = 
	{
		--LandType
		[0] = {"水面.gfx",},
	},
}
ReplaceGfxCfg[11] =
{
	--地面
	[0] = 
	{
		--LandType
		[0]  = {"默认.gfx",},
		[1]  = {"土黄草地.gfx",},
		[2]  = {"绿草地.gfx",},
	},
	--水中
	[1] = 
	{
		--LandType
		[0] = {"水面.gfx",},
	},
	--水上
	[2] = 
	{
		--LandType
		[0] = {"水面.gfx",},
	},
}
ReplaceGfxCfg[55] =
{
	--地面
	[0] = 
	{
		--LandType
		[0]  = {"绿草地.gfx",},
		[1]  = {"默认.gfx",},
		[2]  = {"默认.gfx",},
		[3]  = {"默认.gfx",},
		[4]  = {"默认.gfx",},
	},
	--水中
	[1] = 
	{
		--LandType
		[0] = {"水面.gfx",},
	},
	--水上
	[2] = 
	{
		--LandType
		[0] = {"水面.gfx",},
	},
}
ReplaceGfxCfg[13] =
{
	--地面
	[0] = 
	{
		--LandType
		[0]  = {"土黄草地.gfx",},
		[1]  = {"土黄草地.gfx",},
		[2]  = {"默认.gfx",},
		[3]  = {"默认.gfx",},
		[4]  = {"默认.gfx",},
		[5]  = {"默认.gfx",},
		[6]  = {"土黄草地.gfx",},
		[7]  = {"土黄草地.gfx",},
	},
	--水中
	[1] = 
	{
		--LandType
		[0] = {"水面.gfx",},
	},
	--水上
	[2] = 
	{
		--LandType
		[0] = {"水面.gfx",},
	},
}
ReplaceGfxCfg[14] =
{
	--地面
	[0] = 
	{
		--LandType
		[0]  = {"默认.gfx",},
		[1]  = {"红雪地.gfx",},
		[2]  = {"红雪地.gfx",},
		[3]  = {"土黄草地.gfx",},
		[4]  = {"默认.gfx",},
		[5]  = {"土黄草地.gfx",},
		[6]  = {"绿草地.gfx",},
	},
	--水中
	[1] = 
	{
		--LandType
		[0] = {"水面.gfx",},
	},
	--水上
	[2] = 
	{
		--LandType
		[0] = {"水面.gfx",},
	},
}
ReplaceGfxCfg[17] =
{
	--地面
	[0] = 
	{
		--LandType
		[0]  = {"绿草地.gfx",},
		[1]  = {"绿草地.gfx",},
		[2]  = {"默认.gfx",},
		[3]  = {"默认.gfx",},
		[4]  = {"默认.gfx",},
		[5]  = {"绿草地.gfx",},
		[6]  = {"默认.gfx",},
		[7]  = {"土黄草地.gfx",},
	},
	--水中
	[1] = 
	{
		--LandType
		[0] = {"水面.gfx",},
	},
	--水上
	[2] = 
	{
		--LandType
		[0] = {"水面.gfx",},
	},
}
ReplaceGfxCfg[18] =
{
	--地面
	[0] = 
	{
		--LandType
		[0]  = {"绿草地.gfx",},
		[1]  = {"默认.gfx",},
		[2]  = {"默认.gfx",},
		[3]  = {"默认.gfx",},
		[4]  = {"绿草地.gfx",},
		[5]  = {"沙滩.gfx",},
		[6]  = {"默认.gfx",},
		[7]  = {"默认.gfx",},
	},
	--水中
	[1] = 
	{
		--LandType
		[0] = {"水面.gfx",},
	},
	--水上
	[2] = 
	{
		--LandType
		[0] = {"水面.gfx",},
	},
}
ReplaceGfxCfg[19] =
{
	--地面
	[0] = 
	{
		--LandType
		[0]  = {"默认.gfx",},
		[1]  = {"绿草地.gfx",},
		[2]  = {"绿草地.gfx",},
		[3]  = {"绿草地.gfx",},
		[4]  = {"默认.gfx",},
		[5]  = {"默认.gfx",},
		[6]  = {"默认.gfx",},
	},
	--水中
	[1] = 
	{
		--LandType
		[0] = {"水面.gfx",},
	},
	--水上
	[2] = 
	{
		--LandType
		[0] = {"水面.gfx",},
	},
}
ReplaceGfxCfg[20] =
{
	--地面
	[0] = 
	{
		--LandType
		[0]  = {"绿草地.gfx",},
		[1]  = {"默认.gfx",},
		[2]  = {"默认.gfx",},
		[3]  = {"绿草地.gfx",},
		[4]  = {"默认.gfx",},
		[5]  = {"默认.gfx",},
	},
	--水中
	[1] = 
	{
		--LandType
		[0] = {"水面.gfx",},
	},
	--水上
	[2] = 
	{
		--LandType
		[0] = {"水面.gfx",},
	},
}
ReplaceGfxCfg[21] =
{
	--地面
	[0] = 
	{
		--LandType
		[0]  = {"绿草地.gfx",},
		[1]  = {"默认.gfx",},
		[2]  = {"默认.gfx",},
		[3]  = {"绿草地.gfx",},
		[4]  = {"默认.gfx",},
		[5]  = {"默认.gfx",},
	},
	--水中
	[1] = 
	{
		--LandType
		[0] = {"水面.gfx",},
	},
	--水上
	[2] = 
	{
		--LandType
		[0] = {"水面.gfx",},
	},
}
ReplaceGfxCfg[22] =
{
	--地面
	[0] = 
	{
		--LandType
		[0]  = {"土黄草地.gfx",},
		[1]  = {"土黄草地.gfx",},
		[2]  = {"土黄草地.gfx",},
		[3]  = {"土黄草地.gfx",},
		[4]  = {"默认.gfx",},
		[5]  = {"默认.gfx",},
		[6]  = {"绿草地.gfx",},
	},
	--水中
	[1] = 
	{
		--LandType
		[0] = {"水面.gfx",},
	},
	--水上
	[2] = 
	{
		--LandType
		[0] = {"水面.gfx",},
	},
}
ReplaceGfxCfg[24] =
{
	--地面
	[0] = 
	{
		--LandType
		[0]  = {"绿草地.gfx",},
		[1]  = {"默认.gfx",},
		[2]  = {"默认.gfx",},
		[3]  = {"默认.gfx",},
		[4]  = {"默认.gfx",},
		[5]  = {"绿草地.gfx",},
	},
	--水中
	[1] = 
	{
		--LandType
		[0] = {"水面.gfx",},
	},
	--水上
	[2] = 
	{
		--LandType
		[0] = {"水面.gfx",},
	},
}
ReplaceGfxCfg[25] =
{
	--地面
	[0] = 
	{
		--LandType
		[0]  = {"默认.gfx",},
		[1]  = {"默认.gfx",},
		[2]  = {"绿草地.gfx",},
		[3]  = {"绿草地.gfx",},
		[4]  = {"雪地.gfx",},
		[5]  = {"默认.gfx",},
		[6]  = {"默认.gfx",},
		[7]  = {"绿草地.gfx",},
		[8]  = {"绿草地.gfx",},
		[9]  = {"绿草地.gfx",},
	},
	--水中
	[1] = 
	{
		--LandType
		[0] = {"水面.gfx",},
	},
	--水上
	[2] = 
	{
		--LandType
		[0] = {"水面.gfx",},
	},
}
ReplaceGfxCfg[26] =
{
	--地面
	[0] = 
	{
		--LandType
		[0]  = {"默认.gfx",},
		[1]  = {"绿草地.gfx",},
		[2]  = {"默认.gfx",},
	},
	--水中
	[1] = 
	{
		--LandType
		[0] = {"水面.gfx",},
	},
	--水上
	[2] = 
	{
		--LandType
		[0] = {"水面.gfx",},
	},
}
ReplaceGfxCfg[27] =
{
	--地面
	[0] = 
	{
		--LandType
		[0]  = {"绿草地.gfx",},
		[1]  = {"默认.gfx",},
		[2]  = {"默认.gfx",},
		[3]  = {"默认.gfx",},
		[4]  = {"默认.gfx",},
		[5]  = {"默认.gfx",},
		[6]  = {"默认.gfx",},
		[7]  = {"绿草地.gfx",},
	},
	--水中
	[1] = 
	{
		--LandType
		[0] = {"水面.gfx",},
	},
	--水上
	[2] = 
	{
		--LandType
		[0] = {"水面.gfx",},
	},
}
ReplaceGfxCfg[28] =
{
	--地面
	[0] = 
	{
		--LandType
		[0]  = {"默认.gfx",},
		[1]  = {"默认.gfx",},
		[2]  = {"默认.gfx",},
		[3]  = {"默认.gfx",},
		[4]  = {"土黄草地.gfx",},
	},
	--水中
	[1] = 
	{
		--LandType
		[0] = {"水面.gfx",},
	},
	--水上
	[2] = 
	{
		--LandType
		[0] = {"水面.gfx",},
	},
}
ReplaceGfxCfg[29] =
{
	--地面
	[0] = 
	{
		--LandType
		[0]  = {"默认.gfx",},
		[1]  = {"默认.gfx",},
		[2]  = {"默认.gfx",},
		[3]  = {"绿草地.gfx",},
		[4]  = {"默认.gfx",},
	},
	--水中
	[1] = 
	{
		--LandType
		[0] = {"水面.gfx",},
	},
	--水上
	[2] = 
	{
		--LandType
		[0] = {"水面.gfx",},
	},
}
ReplaceGfxCfg[30] =
{
	--地面
	[0] = 
	{
		--LandType
		[0]  = {"绿草地.gfx",},
		[1]  = {"默认.gfx",},
		[2]  = {"绿草地.gfx",},
		[3]  = {"默认.gfx",},
		[4]  = {"绿草地.gfx",},
		[5]  = {"默认.gfx",},
	},
	--水中
	[1] = 
	{
		--LandType
		[0] = {"水面.gfx",},
	},
	--水上
	[2] = 
	{
		--LandType
		[0] = {"水面.gfx",},
	},
}
ReplaceGfxCfg[31] =
{
	--地面
	[0] = 
	{
		--LandType
		[0]  = {"绿草地.gfx",},
		[1]  = {"雪地.gfx",},
		[2]  = {"默认.gfx",},
		[3]  = {"默认.gfx",},
		[4]  = {"绿草地.gfx",},
		[5]  = {"默认.gfx",},
		[6]  = {"默认.gfx",},
	},
	--水中
	[1] = 
	{
		--LandType
		[0] = {"水面.gfx",},
	},
	--水上
	[2] = 
	{
		--LandType
		[0] = {"水面.gfx",},
	},
}
ReplaceGfxCfg[32] =
{
	--地面
	[0] = 
	{
		--LandType
		[0]  = {"绿草地.gfx",},
		[1]  = {"默认.gfx",},
		[2]  = {"绿草地.gfx",},
		[3]  = {"默认.gfx",},
	},
	--水中
	[1] = 
	{
		--LandType
		[0] = {"水面.gfx",},
	},
	--水上
	[2] = 
	{
		--LandType
		[0] = {"水面.gfx",},
	},
}
ReplaceGfxCfg[33] =
{
	--地面
	[0] = 
	{
		--LandType
		[0]  = {"默认.gfx",},
		[1]  = {"绿草地.gfx",},
		[2]  = {"绿草地.gfx",},
	},
	--水中
	[1] = 
	{
		--LandType
		[0] = {"水面.gfx",},
	},
	--水上
	[2] = 
	{
		--LandType
		[0] = {"水面.gfx",},
	},
}
ReplaceGfxCfg[34] =
{
	--地面
	[0] = 
	{
		--LandType
		[0]  = {"默认.gfx",},
		[1]  = {"土黄草地.gfx",},
		[2]  = {"土黄草地.gfx",},
		[3]  = {"默认.gfx",},
		[4]  = {"默认.gfx",},
		[5]  = {"默认.gfx",},
	},
	--水中
	[1] = 
	{
		--LandType
		[0] = {"水面.gfx",},
	},
	--水上
	[2] = 
	{
		--LandType
		[0] = {"水面.gfx",},
	},
}
ReplaceGfxCfg[36] =
{
	--地面
	[0] = 
	{
		--LandType
		[0]  = {"绿草地.gfx",},
		[1]  = {"绿草地.gfx",},
		[2]  = {"默认.gfx",},
		[3]  = {"默认.gfx",},
		[4]  = {"默认.gfx",},
		[5]  = {"默认.gfx",},
		[6]  = {"默认.gfx",},
	},
	--水中
	[1] = 
	{
		--LandType
		[0] = {"水面.gfx",},
	},
	--水上
	[2] = 
	{
		--LandType
		[0] = {"水面.gfx",},
	},
}
ReplaceGfxCfg[37] =
{
	--地面
	[0] = 
	{
		--LandType
		[0]  = {"绿草地.gfx",},
		[1]  = {"默认.gfx",},
		[2]  = {"绿草地.gfx",},
		[3]  = {"默认.gfx",},
		[4]  = {"默认.gfx",},
		[5]  = {"绿草地.gfx",},
		[6]  = {"绿草地.gfx",},
		[7]  = {"默认.gfx",},
	},
	--水中
	[1] = 
	{
		--LandType
		[0] = {"水面.gfx",},
	},
	--水上
	[2] = 
	{
		--LandType
		[0] = {"水面.gfx",},
	},
}
ReplaceGfxCfg[38] =
{
	--地面
	[0] = 
	{
		--LandType
		[0]  = {"默认.gfx",},
		[1]  = {"默认.gfx",},
		[2]  = {"绿草地.gfx",},
		[3]  = {"默认.gfx",},
		[4]  = {"默认.gfx",},
		[5]  = {"默认.gfx",},
		[6]  = {"土黄草地.gfx",},
	},
	--水中
	[1] = 
	{
		--LandType
		[0] = {"水面.gfx",},
	},
	--水上
	[2] = 
	{
		--LandType
		[0] = {"水面.gfx",},
	},
}
ReplaceGfxCfg[39] =
{
	--地面
	[0] = 
	{
		--LandType
		[0]  = {"默认.gfx",},
		[1]  = {"绿草地.gfx",},
		[2]  = {"土黄草地.gfx",},
		[3]  = {"绿草地.gfx",},
		[4]  = {"默认.gfx",},
	},
	--水中
	[1] = 
	{
		--LandType
		[0] = {"水面.gfx",},
	},
	--水上
	[2] = 
	{
		--LandType
		[0] = {"水面.gfx",},
	},
}
ReplaceGfxCfg[40] =
{
	--地面
	[0] = 
	{
		--LandType
		[0]  = {"绿草地.gfx",},
		[1]  = {"默认.gfx",},
		[2]  = {"默认.gfx",},
		[3]  = {"默认.gfx",},
		[4]  = {"默认.gfx",},
	},
	--水中
	[1] = 
	{
		--LandType
		[0] = {"水面.gfx",},
	},
	--水上
	[2] = 
	{
		--LandType
		[0] = {"水面.gfx",},
	},
}
ReplaceGfxCfg[41] =
{
	--地面
	[0] = 
	{
		--LandType
		[0]  = {"默认.gfx",},
		[1]  = {"土黄草地.gfx",},
		[2]  = {"默认.gfx",},
		[3]  = {"默认.gfx",},
		[4]  = {"默认.gfx",},
		[5]  = {"默认.gfx",},
		[6]  = {"默认.gfx",},
		[7]  = {"默认.gfx",},
		[8]  = {"默认.gfx",},
	},
	--水中
	[1] = 
	{
		--LandType
		[0] = {"水面.gfx",},
	},
	--水上
	[2] = 
	{
		--LandType
		[0] = {"水面.gfx",},
	},
}
ReplaceGfxCfg[42] =
{
	--地面
	[0] = 
	{
		--LandType
		[0]  = {"默认.gfx",},
		[1]  = {"默认.gfx",},
	},
	--水中
	[1] = 
	{
		--LandType
		[0] = {"水面.gfx",},
	},
	--水上
	[2] = 
	{
		--LandType
		[0] = {"水面.gfx",},
	},
}
ReplaceGfxCfg[43] =
{
	--地面
	[0] = 
	{
		--LandType
		[0]  = {"默认.gfx",},
		[1]  = {"绿草地.gfx",},
		[2]  = {"绿草地.gfx",},
		[3]  = {"默认.gfx",},
		[4]  = {"默认.gfx",},
		[5]  = {"绿草地.gfx",},
	},
	--水中
	[1] = 
	{
		--LandType
		[0] = {"水面.gfx",},
	},
	--水上
	[2] = 
	{
		--LandType
		[0] = {"水面.gfx",},
	},
}
ReplaceGfxCfg[1006] =
{
	--地面
	[0] = 
	{
		--LandType
		[0]  = {"默认.gfx",},
		[1]  = {"默认.gfx",},
		[2]  = {"默认.gfx",},
	},
	--水中
	[1] = 
	{
		--LandType
		[0] = {"水面.gfx",},
	},
	--水上
	[2] = 
	{
		--LandType
		[0] = {"水面.gfx",},
	},
}
ReplaceGfxCfg[1007] =
{
	--地面
	[0] = 
	{
		--LandType
		[0]  = {"绿草地.gfx",},
		[1]  = {"绿草地.gfx",},
		[2]  = {"默认.gfx",},
	},
	--水中
	[1] = 
	{
		--LandType
		[0] = {"水面.gfx",},
	},
	--水上
	[2] = 
	{
		--LandType
		[0] = {"水面.gfx",},
	},
}
ReplaceGfxCfg[1008] =
{
	--地面
	[0] = 
	{
		--LandType
		[0]  = {"默认.gfx",},
		[1]  = {"默认.gfx",},
		[2]  = {"绿草地.gfx",},
	},
	--水中
	[1] = 
	{
		--LandType
		[0] = {"水面.gfx",},
	},
	--水上
	[2] = 
	{
		--LandType
		[0] = {"水面.gfx",},
	},
}
ReplaceGfxCfg[1009] =
{
	--地面
	[0] = 
	{
		--LandType
		[0]  = {"默认.gfx",},
		[1]  = {"默认.gfx",},
		[2]  = {"土黄草地.gfx",},
	},
	--水中
	[1] = 
	{
		--LandType
		[0] = {"水面.gfx",},
	},
	--水上
	[2] = 
	{
		--LandType
		[0] = {"水面.gfx",},
	},
}
ReplaceGfxCfg[1010] =
{
	--地面
	[0] = 
	{
		--LandType
		[0]  = {"绿草地.gfx",},
		[1]  = {"默认.gfx",},
		[2]  = {"默认.gfx",},
		[3]  = {"土黄草地.gfx",},
		[4]  = {"土黄草地.gfx",},
	},
	--水中
	[1] = 
	{
		--LandType
		[0] = {"水面.gfx",},
	},
	--水上
	[2] = 
	{
		--LandType
		[0] = {"水面.gfx",},
	},
}
ReplaceGfxCfg[1011] =
{
	--地面
	[0] = 
	{
		--LandType
		[0]  = {"绿草地.gfx",},
		[1]  = {"绿草地.gfx",},
		[2]  = {"默认.gfx",},
		[3]  = {"默认.gfx",},
	},
	--水中
	[1] = 
	{
		--LandType
		[0] = {"水面.gfx",},
	},
	--水上
	[2] = 
	{
		--LandType
		[0] = {"水面.gfx",},
	},
}
ReplaceGfxCfg[1016] =
{
	--地面
	[0] = 
	{
		--LandType
		[0]  = {"绿草地.gfx",},
		[1]  = {"默认.gfx",},
		[2]  = {"默认.gfx",},
	},
	--水中
	[1] = 
	{
		--LandType
		[0] = {"水面.gfx",},
	},
	--水上
	[2] = 
	{
		--LandType
		[0] = {"水面.gfx",},
	},
}
ReplaceGfxCfg[56] =
{
	--地面
	[0] = 
	{
		--LandType
		[0]  = {"绿草地.gfx",},
		[1]  = {"土黄草地.gfx",},
		[2]  = {"绿草地.gfx",},
		[3]  = {"土黄草地.gfx",},
		[4]  = {"土黄草地.gfx",},
		[5]  = {"默认.gfx",},
		[6]  = {"默认.gfx",},
	},
	--水中
	[1] = 
	{
		--LandType
		[0] = {"水面.gfx",},
	},
	--水上
	[2] = 
	{
		--LandType
		[0] = {"水面.gfx",},
	},
}
ReplaceGfxCfg[60] =
{
	--地面
	[0] = 
	{
		--LandType
		[0]  = {"绿草地.gfx",},
		[1]  = {"绿草地.gfx",},
		[2]  = {"绿草地.gfx",},
		[3]  = {"土黄草地.gfx",},
		[4]  = {"默认.gfx",},
		[5]  = {"默认.gfx",},
	},
	--水中
	[1] = 
	{
		--LandType
		[0] = {"水面.gfx",},
	},
	--水上
	[2] = 
	{
		--LandType
		[0] = {"水面.gfx",},
	},
}
ReplaceGfxCfg[115] =
{
	--默认
	default = "雪地.gfx",
}

ReplaceGfxCfg[2003] =
{
	--地面
	[0] = 
	{
		--LandType
		[0]  = {"绿草地.gfx",},
		[1]  = {"绿草地.gfx",},
		[2]  = {"默认.gfx",},
	},
	--水中
	[1] = 
	{
		--LandType
		[0] = {"水面.gfx",},
	},
	--水上
	[2] = 
	{
		--LandType
		[0] = {"水面.gfx",},
	},
}
ReplaceGfxCfg[2004] =
{
	--地面
	[0] = 
	{
		--LandType
		[0]  = {"绿草地.gfx",},
		[1]  = {"默认.gfx",},
		[2]  = {"默认.gfx",},
		[3]  = {"绿草地.gfx",},
		[4]  = {"默认.gfx",},
		[5]  = {"默认.gfx",},
	},
	--水中
	[1] = 
	{
		--LandType
		[0] = {"水面.gfx",},
	},
	--水上
	[2] = 
	{
		--LandType
		[0] = {"水面.gfx",},
	},
}
ReplaceGfxCfg[3001] =
{
	--地面
	[0] = 
	{
		--LandType
		[0]  = {"土黄草地.gfx",},
		[1]  = {"默认.gfx",},
	},
	--水中
	[1] = 
	{
		--LandType
		[0] = {"水面.gfx",},
	},
	--水上
	[2] = 
	{
		--LandType
		[0] = {"水面.gfx",},
	},
}
ReplaceGfxCfg[35] =
{
	--地面
	[0] = 
	{
		--LandType
		[0]  = {"绿草地.gfx",},
		[1]  = {"绿草地.gfx",},
		[2]  = {"绿草地.gfx",},
		[3]  = {"绿草地.gfx",},
		[4]  = {"默认.gfx",},
		[5]  = {"绿草地.gfx",},
		[6]  = {"绿草地.gfx",},
		[7]  = {"绿草地.gfx",},
	},
	--水中
	[1] = 
	{
		--LandType
		[0] = {"水面.gfx",},
	},
	--水上
	[2] = 
	{
		--LandType
		[0] = {"水面.gfx",},
	},
}
ReplaceGfxCfg[2005] =
{
	--地面
	[0] = 
	{
		--LandType
		[0]  = {"默认.gfx",},

	},
	--水中
	[1] = 
	{
		--LandType
		[0] = {"水面.gfx",},
	},
	--水上
	[2] = 
	{
		--LandType
		[0] = {"水面.gfx",},
	},
}
ReplaceGfxCfg[2006] =
{
	--地面
	[0] = 
	{
		--LandType
		[0]  = {"默认.gfx",},

	},
	--水中
	[1] = 
	{
		--LandType
		[0] = {"水面.gfx",},
	},
	--水上
	[2] = 
	{
		--LandType
		[0] = {"水面.gfx",},
	},
}
ReplaceGfxCfg[2007] =
{
	--地面
	[0] = 
	{
		--LandType
		[0]  = {"绿草地.gfx",},

	},
	--水中
	[1] = 
	{
		--LandType
		[0] = {"水面.gfx",},
	},
	--水上
	[2] = 
	{
		--LandType
		[0] = {"水面.gfx",},
	},
}
ReplaceGfxCfg[2011] =
{
	--地面
	[0] = 
	{
		--LandType
		[0]  = {"默认.gfx",},

	},
	--水中
	[1] = 
	{
		--LandType
		[0] = {"水面.gfx",},
	},
	--水上
	[2] = 
	{
		--LandType
		[0] = {"水面.gfx",},
	},
}
ReplaceGfxCfg[2012] =
{
	--地面
	[0] = 
	{
		--LandType
		[0]  = {"默认.gfx",},

	},
	--水中
	[1] = 
	{
		--LandType
		[0] = {"水面.gfx",},
	},
	--水上
	[2] = 
	{
		--LandType
		[0] = {"水面.gfx",},
	},
}
ReplaceGfxCfg[2013] =
{
	--地面
	[0] = 
	{
		--LandType
		[0]  = {"默认.gfx",},

	},
	--水中
	[1] = 
	{
		--LandType
		[0] = {"水面.gfx",},
	},
	--水上
	[2] = 
	{
		--LandType
		[0] = {"水面.gfx",},
	},
}
ReplaceGfxCfg[2014] =
{
	--地面
	[0] = 
	{
		--LandType
		[0]  = {"绿草地.gfx",},

	},
	--水中
	[1] = 
	{
		--LandType
		[0] = {"水面.gfx",},
	},
	--水上
	[2] = 
	{
		--LandType
		[0] = {"水面.gfx",},
	},
}
ReplaceGfxCfg[2015] =
{
	--地面
	[0] = 
	{
		--LandType
		[0]  = {"默认.gfx",},

	},
	--水中
	[1] = 
	{
		--LandType
		[0] = {"水面.gfx",},
	},
	--水上
	[2] = 
	{
		--LandType
		[0] = {"水面.gfx",},
	},
}
ReplaceGfxCfg[1020] =
{
	--地面
	[0] = 
	{
		--LandType
		[0]  = {"默认.gfx",},

	},
	--水中
	[1] = 
	{
		--LandType
		[0] = {"水面.gfx",},
	},
	--水上
	[2] = 
	{
		--LandType
		[0] = {"水面.gfx",},
	},
}
ReplaceGfxCfg[1005] =
{
	--地面
	[0] = 
	{
		--LandType
		[0]  = {"绿草地.gfx",},
		[1]  = {"默认.gfx",},
		[2]  = {"默认.gfx",},

	},
	--水中
	[1] = 
	{
		--LandType
		[0] = {"水面.gfx",},
	},
	--水上
	[2] = 
	{
		--LandType
		[0] = {"水面.gfx",},
	},
}
ReplaceGfxCfg[1004] =
{
	--地面
	[0] = 
	{
		--LandType
		[0]  = {"默认.gfx",},

	},
	--水中
	[1] = 
	{
		--LandType
		[0] = {"水面.gfx",},
	},
	--水上
	[2] = 
	{
		--LandType
		[0] = {"水面.gfx",},
	},
}
ReplaceGfxCfg[1017] =
{
	--地面
	[0] = 
	{
		--LandType
		[0]  = {"绿草地.gfx",},
		[1]  = {"绿草地.gfx",},
		[2]  = {"默认.gfx",},
		[3]  = {"绿草地.gfx",},
		[4]  = {"绿草地.gfx",},
		[5]  = {"默认.gfx",},

	},
	--水中
	[1] = 
	{
		--LandType
		[0] = {"水面.gfx",},
	},
	--水上
	[2] = 
	{
		--LandType
		[0] = {"水面.gfx",},
	},
}
ReplaceGfxCfg[1302] =
{
	--地面
	[0] = 
	{
		--LandType
		[0]  = {"绿草地.gfx",},

	},
	--水中
	[1] = 
	{
		--LandType
		[0] = {"水面.gfx",},
	},
	--水上
	[2] = 
	{
		--LandType
		[0] = {"水面.gfx",},
	},
}
ReplaceGfxCfg[1301] =
{
	--地面
	[0] = 
	{
		--LandType
		[0]  = {"绿草地.gfx",},

	},
	--水中
	[1] = 
	{
		--LandType
		[0] = {"水面.gfx",},
	},
	--水上
	[2] = 
	{
		--LandType
		[0] = {"水面.gfx",},
	},
}
ReplaceGfxCfg[1303] =
{
	--地面
	[0] = 
	{
		--LandType
		[0]  = {"绿草地.gfx",},
		[1]  = {"绿草地.gfx",},
		[2]  = {"默认.gfx",},

	},
	--水中
	[1] = 
	{
		--LandType
		[0] = {"水面.gfx",},
	},
	--水上
	[2] = 
	{
		--LandType
		[0] = {"水面.gfx",},
	},
}
ReplaceGfxCfg[1304] =
{
	--地面
	[0] = 
	{
		--LandType
		[0]  = {"绿草地.gfx",},
		[1]  = {"绿草地.gfx",},
		[2]  = {"默认.gfx",},

	},
	--水中
	[1] = 
	{
		--LandType
		[0] = {"水面.gfx",},
	},
	--水上
	[2] = 
	{
		--LandType
		[0] = {"水面.gfx",},
	},
}
ReplaceGfxCfg[1305] =
{
	--地面
	[0] = 
	{
		--LandType
		[0]  = {"默认.gfx",},
		[1]  = {"绿草地.gfx",},
		[2]  = {"默认.gfx",},
		[3]  = {"默认.gfx",},
		[4]  = {"默认.gfx",},
		[5]  = {"默认.gfx",},

	},
	--水中
	[1] = 
	{
		--LandType
		[0] = {"水面.gfx",},
	},
	--水上
	[2] = 
	{
		--LandType
		[0] = {"水面.gfx",},
	},
}
ReplaceGfxCfg[1306] =
{
	--地面
	[0] = 
	{
		--LandType
		[0]  = {"土黄草地.gfx",},
		[1]  = {"默认.gfx",},
		[2]  = {"默认.gfx",},

	},
	--水中
	[1] = 
	{
		--LandType
		[0] = {"水面.gfx",},
	},
	--水上
	[2] = 
	{
		--LandType
		[0] = {"水面.gfx",},
	},
}
ReplaceGfxCfg[1307] =
{
	--地面
	[0] = 
	{
		--LandType
		[0]  = {"默认.gfx",},
		[1]  = {"默认.gfx",},

	},
	--水中
	[1] = 
	{
		--LandType
		[0] = {"水面.gfx",},
	},
	--水上
	[2] = 
	{
		--LandType
		[0] = {"水面.gfx",},
	},
}
ReplaceGfxCfg[1308] =
{
	--地面
	[0] = 
	{
		--LandType
		[0]  = {"默认.gfx",},
		[1]  = {"默认.gfx",},

	},
	--水中
	[1] = 
	{
		--LandType
		[0] = {"水面.gfx",},
	},
	--水上
	[2] = 
	{
		--LandType
		[0] = {"水面.gfx",},
	},
}
ReplaceGfxCfg[1309] =
{
	--地面
	[0] = 
	{
		--LandType
		[0]  = {"绿草地.gfx",},
		[1]  = {"默认.gfx",},
		[2]  = {"绿草地.gfx",},
		[3]  = {"默认.gfx",},
		[4]  = {"默认.gfx",},
		[5]  = {"默认.gfx",},
		[6]  = {"默认.gfx",},

	},
	--水中
	[1] = 
	{
		--LandType
		[0] = {"水面.gfx",},
	},
	--水上
	[2] = 
	{
		--LandType
		[0] = {"水面.gfx",},
	},
}
ReplaceGfxCfg[1015] =
{
	--地面
	[0] = 
	{
		--LandType
		[0]  = {"默认.gfx",},

	},
	--水中
	[1] = 
	{
		--LandType
		[0] = {"水面.gfx",},
	},
	--水上
	[2] = 
	{
		--LandType
		[0] = {"水面.gfx",},
	},
}
ReplaceGfxCfg[65] =
{
	--地面
	[0] = 
	{
		--LandType
		[0]  = {"默认.gfx",},

	},
	--水中
	[1] = 
	{
		--LandType
		[0] = {"水面.gfx",},
	},
	--水上
	[2] = 
	{
		--LandType
		[0] = {"水面.gfx",},
	},
}
