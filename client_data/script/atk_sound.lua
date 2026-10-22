SoundCfg  = {}

AtkStateEnum =
{
	NORMAL		= 0,	--[[ 普通]]--
	MISS		= 1,	--[[ 闪避]]--
	CRIT		= 2,	--[[ 暴击]]--
}

--[[showtype : 	过程的显示索引str3对应的值]]--
--[[ak_type	: 	攻击方的攻击类型]]--
--[[df_type	:	被攻击方的防御类型]]--
--[[atkstate : 	见AtkStateEnum]]--
function SoundCfg:GetAtkSound(id_obj,showtype, ak_type, df_type, atkstate)

	local soundstr = "" 	--[[	声音文件名，格式："Sfx\\..."]]--
	local mindist = 1.0		--[[	该声音开始衰减的距离（大于这个距离开始指数衰减）]]--
	local maxdist = 15.0 	--[[	听到该声音的最远距离 ]]--

	--[[	TODO：根据输入参数，计算出上面三个值作返回]]--
	if atkstate == AtkStateEnum.NORMAL then
		soundstr = "Sfx\\策划联入\\击中\\" .. SoundCfg:GetHitSound(showtype, ak_type, df_type)
	elseif atkstate == AtkStateEnum.MISS then
		--[[无音效]]--
	elseif atkstate == AtkStateEnum.CRIT then
		soundstr = "Sfx\\策划联入\\击中\\" .. SoundCfg:GetCRITHitSound(showtype, ak_type, df_type)
		mindist = 1.0
		maxdist = 15.0
	end

	return soundstr, mindist, maxdist

end

function SoundCfg:GetHitSound(showtype, ak_type, df_type)
	if showtype == 4 then
		return ""
	else
		local isound = 0
		isound = AtkDefRelation[ak_type+1][df_type+1][showtype + 1]
		if AtkSoundType[isound] then
			local itable = #AtkSoundType[isound]
			if itable > 0 then
				soundstr = math.random(itable)
				return AtkSoundType[isound][soundstr]
			else
				return ""
			end
		else
			return ""
		end
	end
end

function SoundCfg:GetCRITHitSound(showtype, ak_type, df_type)
	if showtype == 4 then
		return ""
	else
		local isound = 0
		isound = AtkDefRelation[ak_type+1][df_type+1][showtype + 1]
		if AtkSoundType[isound] then
			local itable = #AtkSoundType[isound]
			if itable > 0 then
				return AtkSoundType[isound][itable]
			else
				return ""
			end
		else
			return ""
		end
	end
end
