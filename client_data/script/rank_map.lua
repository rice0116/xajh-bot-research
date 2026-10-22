--[[#tag push auto]]


---门派贡献排行榜映射ID

--[[
NEED MAP INDEX
{
	RANK_MAP_PROFCONTRIBUTION = 159,
	RANK_MAP_PROFCONTRIBUTION_OLDDAY = 160,
}

MAP TABLE ID
{
	---今天
	PROFTYPE_SHAOLIN_MAP = 137;
	PROFTYPE_WUDANG_MAP = 139;
	PROFTYPE_HUASHAN_MAP = 141;
	PROFTYPE_NORTH_HENGSHAN_MAP = 143;
	PROFTYPE_SOUTH_HENGSHAN_MAP = 145;
	PROFTYPE_RIYUE_MAP = 147;
	PROFTYPE_WUXIAN_MAP = 149;
	PROFTYPE_XIAOYAO_MAP = 151;
	PROFTYPE_TANGMEN_MAP = 153;
	PROFTYPE_EMEI_MAP = 155;
	PROFTYPE_DUGU_MAP = 157;

	---昨天
	PROFTYPE_SHAOLIN_MAP_OLDDAY = 138;
	PROFTYPE_WUDANG_MAP_OLDDAY = 140;
	PROFTYPE_HUASHAN_MAP_OLDDAY = 142;
	PROFTYPE_NORTH_HENGSHAN_MAP_OLDDAY = 144;
	PROFTYPE_SOUTH_HENGSHAN_MAP_OLDDAY = 146;
	PROFTYPE_RIYUE_MAP_OLDDAY = 148;
	PROFTYPE_WUXIAN_MAP_OLDDAY = 150;
	PROFTYPE_XIAOYAO_MAP_OLDDAY = 152;
	PROFTYPE_TANGMEN_MAP_OLDDAY = 154;
	PROFTYPE_EMEI_MAP_OLDDAY = 156;
	PROFTYPE_DUGU_MAP_OLDDAY = 158;
    
};
]]--

rank_map = {};

rank_map.profcontributionmapindex = {}
rank_map.profcontributionmapindex = {-1, -2}

rank_map.profscoremapindex = {}
rank_map.profscoremapindex = {-3, -4}

rank_map.mapindex = {}
rank_map.mapindex[rank_map.profcontributionmapindex[1]] = 
{
	[0] = --[[!菜鸟]]rank_map.profcontributionmapindex[1],
	[1] = --[[!少林]]137,
	[2] = --[[!武当]]139,
	[3] = --[[!华山]]141,
	[4] = --[[!恒山]]143,
	[5] = --[[!衡山]]145,
	[6] = --[[!日月]]147,
	[7] = --[[!五仙]]149,
	[8] = --[[!逍遥]]151,
	[9] = --[[!唐门]]153,
	[10] = --[[!峨眉]]155,
	[11] = --[[!独孤]]157,
}
rank_map.mapindex[rank_map.profcontributionmapindex[2]] = 
{
	[0] = --[[!菜鸟]]rank_map.profcontributionmapindex[2],
	[1] = --[[!少林]]138,
	[2] = --[[!武当]]140,
	[3] = --[[!华山]]142,
	[4] = --[[!恒山]]144,
	[5] = --[[!衡山]]146,
	[6] = --[[!日月]]148,
	[7] = --[[!五仙]]150,
	[8] = --[[!逍遥]]152,
	[9] = --[[!唐门]]154,
	[10] = --[[!峨眉]]156,
	[11] = --[[!独孤]]158,
}
rank_map.mapindex[rank_map.profscoremapindex[1]] = 
{
	[0] = --[[!菜鸟]]rank_map.profscoremapindex[1],
	[1] = --[[!少林]]163,
	[2] = --[[!武当]]165,
	[3] = --[[!华山]]167,
	[4] = --[[!恒山]]169,
	[5] = --[[!衡山]]171,
	[6] = --[[!日月]]173,
	[7] = --[[!五仙]]175,
	[8] = --[[!逍遥]]177,
	[9] = --[[!唐门]]179,
	[10] = --[[!峨眉]]181,
	[11] = --[[!独孤]]183,
}
rank_map.mapindex[rank_map.profscoremapindex[2]] = 
{
	[0] = --[[!菜鸟]]rank_map.profscoremapindex[2],
	[1] = --[[!少林]]164,
	[2] = --[[!武当]]166,
	[3] = --[[!华山]]168,
	[4] = --[[!恒山]]170,
	[5] = --[[!衡山]]172,
	[6] = --[[!日月]]174,
	[7] = --[[!五仙]]176,
	[8] = --[[!逍遥]]178,
	[9] = --[[!唐门]]180,
	[10] = --[[!峨眉]]182,
	[11] = --[[!独孤]]184,
}

rank_map.remapindex = {}
rank_map.remapindex = 
{
	[137] = --[[!少林]]rank_map.profcontributionmapindex[1],
	[139] = --[[!武当]]rank_map.profcontributionmapindex[1],
	[141] = --[[!华山]]rank_map.profcontributionmapindex[1],
	[143] = --[[!恒山]]rank_map.profcontributionmapindex[1],
	[145] = --[[!衡山]]rank_map.profcontributionmapindex[1],
	[147] = --[[!日月]]rank_map.profcontributionmapindex[1],
	[149] = --[[!五仙]]rank_map.profcontributionmapindex[1],
	[151] = --[[!逍遥]]rank_map.profcontributionmapindex[1],
	[153] = --[[!唐门]]rank_map.profcontributionmapindex[1],
	[155] = --[[!峨眉]]rank_map.profcontributionmapindex[1],
	[157] = --[[!独孤]]rank_map.profcontributionmapindex[1],

	[138] = --[[!少林]]rank_map.profcontributionmapindex[2],
	[140] = --[[!武当]]rank_map.profcontributionmapindex[2],
	[142] = --[[!华山]]rank_map.profcontributionmapindex[2],
	[144] = --[[!恒山]]rank_map.profcontributionmapindex[2],
	[146] = --[[!衡山]]rank_map.profcontributionmapindex[2],
	[148] = --[[!日月]]rank_map.profcontributionmapindex[2],
	[150] = --[[!五仙]]rank_map.profcontributionmapindex[2],
	[152] = --[[!逍遥]]rank_map.profcontributionmapindex[2],
	[154] = --[[!唐门]]rank_map.profcontributionmapindex[2],
	[156] = --[[!峨眉]]rank_map.profcontributionmapindex[2],
	[158] = --[[!独孤]]rank_map.profcontributionmapindex[2],

	[163] = --[[!少林]]rank_map.profscoremapindex[1],
	[165] = --[[!武当]]rank_map.profscoremapindex[1],
	[167] = --[[!华山]]rank_map.profscoremapindex[1],
	[169] = --[[!恒山]]rank_map.profscoremapindex[1],
	[171] = --[[!衡山]]rank_map.profscoremapindex[1],
	[173] = --[[!日月]]rank_map.profscoremapindex[1],
	[175] = --[[!五仙]]rank_map.profscoremapindex[1],
	[177] = --[[!逍遥]]rank_map.profscoremapindex[1],
	[179] = --[[!唐门]]rank_map.profscoremapindex[1],
	[181] = --[[!峨眉]]rank_map.profscoremapindex[1],
	[183] = --[[!独孤]]rank_map.profscoremapindex[1],

	[164] = --[[!少林]]rank_map.profscoremapindex[2],
	[166] = --[[!武当]]rank_map.profscoremapindex[2],
	[168] = --[[!华山]]rank_map.profscoremapindex[2],
	[170] = --[[!恒山]]rank_map.profscoremapindex[2],
	[172] = --[[!衡山]]rank_map.profscoremapindex[2],
	[174] = --[[!日月]]rank_map.profscoremapindex[2],
	[176] = --[[!五仙]]rank_map.profscoremapindex[2],
	[178] = --[[!逍遥]]rank_map.profscoremapindex[2],
	[180] = --[[!唐门]]rank_map.profscoremapindex[2],
	[182] = --[[!峨眉]]rank_map.profscoremapindex[2],
	[184] = --[[!独孤]]rank_map.profscoremapindex[2],
}


function rank_map:ConvertToServerTableIDByProfession( tableindex, profession )
	-- body
	local result
	if rank_map.mapindex[tableindex] == nil then
		result = tableindex 
	else
		result = rank_map.mapindex[tableindex][profession]
	end

	return result
end

function rank_map:ConvertToClientTableID( tableindex )
	-- body
	local result
	if rank_map.remapindex[tableindex] == nil then
		result = tableindex 
	else
		result = rank_map.remapindex[tableindex]
	end

	return result
end

function rank_map:CheckHaveThisRank( tableindex, profession )
	-- body
	if profession == 0 and (tableindex == rank_map.profcontributionmapindex[1] or tableindex == rank_map.profcontributionmapindex[2]) then
		return false
	else
		return true
	end
end