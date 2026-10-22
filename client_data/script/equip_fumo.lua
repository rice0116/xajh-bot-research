----------------------------------------
--	装备附魔配置
----------------------------------------

EquipFumoInfo = {}

--[[开光属性目录，决定光效目录
EquipFumoInfo.KaiGuangVisualCfg =
{
	--开光属性目录ID	--对应的光效目录名称	--对应的UV流动贴图						
	[0] 	= 	{	"武器附魔\\物伤",	"GFX\\Textures\\连续纹理\\绚光.dds",	},
	[13426]	=	{	"武器附魔\\冰伤",	"GFX\\Textures\\连续纹理\\水绚光.dds",	},
	[13425]	=	{	"武器附魔\\火伤",	"GFX\\Textures\\连续纹理\\水绚光黄.dds",	},
	[13427]	=	{	"武器附魔\\毒伤",	"GFX\\Textures\\连续纹理\\水绚光绿.dds",	},
}
]]
--强化等级决定光效等级
EquipFumoInfo.ReinforceVisualCfg =
{
--成长等级下限,成长等级上限,对应的光效等级文件夹,是否UV流动,U的流动速度,V的流动速度,对应的光效目录名称,对应的UV流动贴图，bloom颜色，bloom强度
	{	0,	0,	"",	false,		0.05,		0.125,	 "",	"",},
	{	1,	1,	"01级",	false,		0.05,		0.125,	"武器附魔\\毒伤",	"GFX\\Textures\\连续纹理\\水绚光绿.dds",  },
	{	2,	2,	"02级",	false,		0.05,		0.125,	"武器附魔\\毒伤",	"GFX\\Textures\\连续纹理\\水绚光绿.dds",   },
	{	3,	3,	"03级",	false,		0.05,		0.125,	"武器附魔\\毒伤",	"GFX\\Textures\\连续纹理\\水绚光绿.dds",   },
	{	4,	4,	"01级",	false,		0.05,		0.125,	"武器附魔\\冰伤",	"GFX\\Textures\\连续纹理\\水绚光.dds",     },
	{	5,	5,	"02级",	false,		0.05,		0.125,	"武器附魔\\冰伤",	"GFX\\Textures\\连续纹理\\水绚光.dds",     },
	{	6,	6,	"03级",	true,		0.05,		0.125,	"武器附魔\\冰伤",	"GFX\\Textures\\连续纹理\\水绚光.dds",     },
	{	7,	7,	"01级",	true,		0.05,		0.125,	"武器附魔\\火伤",	"GFX\\Textures\\连续纹理\\水绚光黄.dds",    0xffff1c03, 2.0},
	{	8,	8,	"02级",	true,		0.10,		0.25,	"武器附魔\\火伤",	"GFX\\Textures\\连续纹理\\水绚光黄.dds",    0xffff8433, 3.0},
	{	9,	9,	"03级",	true,		0.15,		0.375,	"武器附魔\\火伤",	"GFX\\Textures\\连续纹理\\水绚光黄.dds",    0xff857e34, 4.0},
	{	10,	10,	"03级",	true,		0.2,		0.5,	"武器附魔\\物伤",	"GFX\\Textures\\连续纹理\\绚光.dds",	0xff003bbb, 5.0   },
	{	11,	11,	"03级",	true,		0.2,		0.5,	"武器附魔\\物伤",	"GFX\\Textures\\连续纹理\\绚光.dds",	0xff003bbb, 5.0   },
	{	12,	20,	"03级",	true,		0.2,		0.5,	"武器附魔\\物伤",	"GFX\\Textures\\连续纹理\\绚光.dds",	0xff003bbb, 5.0   },
}
--[[
function EquipFumoInfo:GetKaiguangVisualCfg()
	return EquipFumoInfo.KaiGuangVisualCfg
end
]]
function EquipFumoInfo:GetReinforceVisualCfg()
	return EquipFumoInfo.ReinforceVisualCfg
end

EquipFumoInfo.SpecialReinforceVisualCfg = {}

EquipFumoInfo.SpecialReinforceVisualCfg[88560] =
{
--成长等级下限,成长等级上限,对应的光效等级文件夹,是否UV流动,U的流动速度,V的流动速度,对应的光效目录名称,对应的UV流动贴图，bloom颜色，bloom强度
	{	0,	0,	"",	false,		0.05,		0.125,	 "",	"",},
	{	1,	1,	"01级",	false,		0.05,		0.125,	"武器附魔\\毒伤",	"GFX\\Textures\\连续纹理\\水绚光绿.dds",  },
	{	2,	2,	"02级",	false,		0.05,		0.125,	"武器附魔\\毒伤",	"GFX\\Textures\\连续纹理\\水绚光绿.dds",   },
	{	3,	3,	"03级",	false,		0.05,		0.125,	"武器附魔\\毒伤",	"GFX\\Textures\\连续纹理\\水绚光绿.dds",   },
	{	4,	4,	"01级",	false,		0.05,		0.125,	"武器附魔\\冰伤",	"GFX\\Textures\\连续纹理\\水绚光.dds",     },
	{	5,	5,	"02级",	false,		0.05,		0.125,	"武器附魔\\冰伤",	"GFX\\Textures\\连续纹理\\水绚光.dds",     },
	{	6,	6,	"03级",	false,		0.05,		0.125,	"武器附魔\\冰伤",	"GFX\\Textures\\连续纹理\\水绚光.dds",     },
	{	7,	7,	"01级",	false,		0.05,		0.125,	"武器附魔\\火伤",	"GFX\\Textures\\连续纹理\\水绚光黄.dds",    },
	{	8,	8,	"02级",	false,		0.10,		0.25,	"武器附魔\\火伤",	"GFX\\Textures\\连续纹理\\水绚光黄.dds",   },
	{	9,	9,	"03级",	false,		0.15,		0.375,	"武器附魔\\火伤",	"GFX\\Textures\\连续纹理\\水绚光黄.dds",   },
	{	10,	10,	"03级",	false,		0.2,		0.5,	"武器附魔\\物伤",	"GFX\\Textures\\连续纹理\\绚光.dds",	   },
	{	11,	11,	"03级",	false,		0.2,		0.5,	"武器附魔\\物伤",	"GFX\\Textures\\连续纹理\\绚光.dds",	  },
	{	12,	20,	"03级",	false,		0.2,		0.5,	"武器附魔\\物伤",	"GFX\\Textures\\连续纹理\\绚光.dds",	  },
}
EquipFumoInfo.SpecialReinforceVisualCfg[88561] = EquipFumoInfo.SpecialReinforceVisualCfg[88560]
EquipFumoInfo.SpecialReinforceVisualCfg[88562] = EquipFumoInfo.SpecialReinforceVisualCfg[88560]
EquipFumoInfo.SpecialReinforceVisualCfg[88563] = EquipFumoInfo.SpecialReinforceVisualCfg[88560]
EquipFumoInfo.SpecialReinforceVisualCfg[88564] = EquipFumoInfo.SpecialReinforceVisualCfg[88560]
EquipFumoInfo.SpecialReinforceVisualCfg[88565] = EquipFumoInfo.SpecialReinforceVisualCfg[88560]
EquipFumoInfo.SpecialReinforceVisualCfg[88554] = EquipFumoInfo.SpecialReinforceVisualCfg[88560]
EquipFumoInfo.SpecialReinforceVisualCfg[88555] = EquipFumoInfo.SpecialReinforceVisualCfg[88560]
EquipFumoInfo.SpecialReinforceVisualCfg[88556] = EquipFumoInfo.SpecialReinforceVisualCfg[88560]
EquipFumoInfo.SpecialReinforceVisualCfg[88557] = EquipFumoInfo.SpecialReinforceVisualCfg[88560]
EquipFumoInfo.SpecialReinforceVisualCfg[88558] = EquipFumoInfo.SpecialReinforceVisualCfg[88560]
EquipFumoInfo.SpecialReinforceVisualCfg[88559] = EquipFumoInfo.SpecialReinforceVisualCfg[88560]

EquipFumoInfo.SpecialReinforceVisualCfg[88485] =
{
--成长等级下限,成长等级上限,对应的光效等级文件夹,是否UV流动,U的流动速度,V的流动速度,对应的光效目录名称,对应的UV流动贴图（作废），bloom颜色（策划自己定），bloom强度（策划自己定）
	{	0,	0,	"",	false,		0.2,		0.5,	"",	"",},
	{	1,	1,	"01",	true,		0.2,		0.5,	"武器附魔\\琉璃武器",	"",	0xff0000ff, 1.0},
	{	2,	2,	"01",	true,		0.2,		0.5,	"武器附魔\\琉璃武器",	"",	0xff0000ff, 2.0},
	{	3,	3,	"01",	true,		0.2,		0.5,	"武器附魔\\琉璃武器",	"",	0xff0000ff, 3.0},
	{	4,	4,	"01",	true,		0.2,		0.5,	"武器附魔\\琉璃武器",	"",	0xff0000ff, 4.0},
	{	5,	5,	"01",	true,		0.2,		0.5,	"武器附魔\\琉璃武器",	"",	0xff0000ff, 5.0},
	{	6,	6,	"02",	true,		0.2,		0.5,	"武器附魔\\琉璃武器",	"",	0xffff0000, 2.0},
	{	7,	7,	"02",	true,		0.05,		0.125,	"武器附魔\\琉璃武器",	"",     0xffff0000, 3.0},
	{	8,	8,	"02",	true,		0.10,		0.25,	"武器附魔\\琉璃武器",	"",     0xffff0000, 4.0},
	{	9,	9,	"03",	true,		0.15,		0.375,	"武器附魔\\琉璃武器",	"",     0xfff8f400, 2.0},
	{	10,	10,	"03",	true,		0.2,		0.5,	"武器附魔\\琉璃武器",	"",	0xfff8f400, 3.0},
	{	11,	11,	"03",	true,		0.2,		0.5,	"武器附魔\\琉璃武器",	"",	0xfff8f400, 4.0},
	{	12,	12,	"04",	true,		0.2,		0.5,	"武器附魔\\琉璃武器",	"",	0xff9f07be, 2.0},
        {	13,	13,	"04",	true,		0.2,		0.5,	"武器附魔\\琉璃武器",	"",	0xff9f07be, 3.0},
        {	14,	14,	"04",	true,		0.2,		0.5,	"武器附魔\\琉璃武器",	"",	0xff9f07be, 4.0},
        {	15,	15,	"04",	true,		0.2,		0.5,	"武器附魔\\琉璃武器",	"",	0xff9f07be, 5.0},
        {	16,	16,	"05",	true,		0.2,		0.5,	"武器附魔\\琉璃武器",	"",	0xffff5b00, 2.0},
        {	17,	17,	"05",	true,		0.2,		0.5,	"武器附魔\\琉璃武器",	"",	0xffff5b00, 3.0},
        {	18,	18,	"05",	true,		0.2,		0.5,	"武器附魔\\琉璃武器",	"",	0xffff5b00, 4.0},
        {	19,	19,	"05",	true,		0.2,		0.5,	"武器附魔\\琉璃武器",	"",	0xffff5b00, 5.0},
        {	20,	20,	"06",	true,		0.2,		0.5,	"武器附魔\\琉璃武器",	"",	0xff132882, 5.0},

}
EquipFumoInfo.SpecialReinforceVisualCfg[88486] = EquipFumoInfo.SpecialReinforceVisualCfg[88485]
EquipFumoInfo.SpecialReinforceVisualCfg[88487] = EquipFumoInfo.SpecialReinforceVisualCfg[88485]
EquipFumoInfo.SpecialReinforceVisualCfg[88488] = EquipFumoInfo.SpecialReinforceVisualCfg[88485]
EquipFumoInfo.SpecialReinforceVisualCfg[88489] = EquipFumoInfo.SpecialReinforceVisualCfg[88485]
EquipFumoInfo.SpecialReinforceVisualCfg[88490] = EquipFumoInfo.SpecialReinforceVisualCfg[88485]
EquipFumoInfo.SpecialReinforceVisualCfg[88491] = EquipFumoInfo.SpecialReinforceVisualCfg[88485]
EquipFumoInfo.SpecialReinforceVisualCfg[88492] = EquipFumoInfo.SpecialReinforceVisualCfg[88485]
EquipFumoInfo.SpecialReinforceVisualCfg[88493] = EquipFumoInfo.SpecialReinforceVisualCfg[88485]
EquipFumoInfo.SpecialReinforceVisualCfg[88494] = EquipFumoInfo.SpecialReinforceVisualCfg[88485]
EquipFumoInfo.SpecialReinforceVisualCfg[88495] = EquipFumoInfo.SpecialReinforceVisualCfg[88485]
EquipFumoInfo.SpecialReinforceVisualCfg[88496] = EquipFumoInfo.SpecialReinforceVisualCfg[88485]
EquipFumoInfo.SpecialReinforceVisualCfg[88497] = EquipFumoInfo.SpecialReinforceVisualCfg[88485]
EquipFumoInfo.SpecialReinforceVisualCfg[88498] = EquipFumoInfo.SpecialReinforceVisualCfg[88485]
EquipFumoInfo.SpecialReinforceVisualCfg[88499] = EquipFumoInfo.SpecialReinforceVisualCfg[88485]
EquipFumoInfo.SpecialReinforceVisualCfg[88500] = EquipFumoInfo.SpecialReinforceVisualCfg[88485]
EquipFumoInfo.SpecialReinforceVisualCfg[88501] = EquipFumoInfo.SpecialReinforceVisualCfg[88485]
EquipFumoInfo.SpecialReinforceVisualCfg[88502] = EquipFumoInfo.SpecialReinforceVisualCfg[88485]
EquipFumoInfo.SpecialReinforceVisualCfg[88503] = EquipFumoInfo.SpecialReinforceVisualCfg[88485]
EquipFumoInfo.SpecialReinforceVisualCfg[88504] = EquipFumoInfo.SpecialReinforceVisualCfg[88485]
EquipFumoInfo.SpecialReinforceVisualCfg[88505] = EquipFumoInfo.SpecialReinforceVisualCfg[88485]
EquipFumoInfo.SpecialReinforceVisualCfg[88506] = EquipFumoInfo.SpecialReinforceVisualCfg[88485]
EquipFumoInfo.SpecialReinforceVisualCfg[88507] = EquipFumoInfo.SpecialReinforceVisualCfg[88485]
EquipFumoInfo.SpecialReinforceVisualCfg[88508] = EquipFumoInfo.SpecialReinforceVisualCfg[88485]
EquipFumoInfo.SpecialReinforceVisualCfg[88509] = EquipFumoInfo.SpecialReinforceVisualCfg[88485]
EquipFumoInfo.SpecialReinforceVisualCfg[88510] = EquipFumoInfo.SpecialReinforceVisualCfg[88485]
EquipFumoInfo.SpecialReinforceVisualCfg[88511] = EquipFumoInfo.SpecialReinforceVisualCfg[88485]
EquipFumoInfo.SpecialReinforceVisualCfg[88512] = EquipFumoInfo.SpecialReinforceVisualCfg[88485]
EquipFumoInfo.SpecialReinforceVisualCfg[88513] = EquipFumoInfo.SpecialReinforceVisualCfg[88485]
EquipFumoInfo.SpecialReinforceVisualCfg[88514] = EquipFumoInfo.SpecialReinforceVisualCfg[88485]
EquipFumoInfo.SpecialReinforceVisualCfg[88515] = EquipFumoInfo.SpecialReinforceVisualCfg[88485]
EquipFumoInfo.SpecialReinforceVisualCfg[88516] = EquipFumoInfo.SpecialReinforceVisualCfg[88485]
EquipFumoInfo.SpecialReinforceVisualCfg[88517] = EquipFumoInfo.SpecialReinforceVisualCfg[88485]
EquipFumoInfo.SpecialReinforceVisualCfg[88518] = EquipFumoInfo.SpecialReinforceVisualCfg[88485]
EquipFumoInfo.SpecialReinforceVisualCfg[88519] = EquipFumoInfo.SpecialReinforceVisualCfg[88485]
EquipFumoInfo.SpecialReinforceVisualCfg[88520] = EquipFumoInfo.SpecialReinforceVisualCfg[88485]
EquipFumoInfo.SpecialReinforceVisualCfg[88521] = EquipFumoInfo.SpecialReinforceVisualCfg[88485]
EquipFumoInfo.SpecialReinforceVisualCfg[88522] = EquipFumoInfo.SpecialReinforceVisualCfg[88485]
EquipFumoInfo.SpecialReinforceVisualCfg[88523] = EquipFumoInfo.SpecialReinforceVisualCfg[88485]
EquipFumoInfo.SpecialReinforceVisualCfg[88524] = EquipFumoInfo.SpecialReinforceVisualCfg[88485]
EquipFumoInfo.SpecialReinforceVisualCfg[88525] = EquipFumoInfo.SpecialReinforceVisualCfg[88485]
EquipFumoInfo.SpecialReinforceVisualCfg[88526] = EquipFumoInfo.SpecialReinforceVisualCfg[88485]
EquipFumoInfo.SpecialReinforceVisualCfg[88527] = EquipFumoInfo.SpecialReinforceVisualCfg[88485]
EquipFumoInfo.SpecialReinforceVisualCfg[88528] = EquipFumoInfo.SpecialReinforceVisualCfg[88485]
EquipFumoInfo.SpecialReinforceVisualCfg[88529] = EquipFumoInfo.SpecialReinforceVisualCfg[88485]
EquipFumoInfo.SpecialReinforceVisualCfg[88530] = EquipFumoInfo.SpecialReinforceVisualCfg[88485]
EquipFumoInfo.SpecialReinforceVisualCfg[88531] = EquipFumoInfo.SpecialReinforceVisualCfg[88485]
EquipFumoInfo.SpecialReinforceVisualCfg[88532] = EquipFumoInfo.SpecialReinforceVisualCfg[88485]
EquipFumoInfo.SpecialReinforceVisualCfg[88533] = EquipFumoInfo.SpecialReinforceVisualCfg[88485]
EquipFumoInfo.SpecialReinforceVisualCfg[88534] = EquipFumoInfo.SpecialReinforceVisualCfg[88485]
EquipFumoInfo.SpecialReinforceVisualCfg[88535] = EquipFumoInfo.SpecialReinforceVisualCfg[88485]
EquipFumoInfo.SpecialReinforceVisualCfg[88536] = EquipFumoInfo.SpecialReinforceVisualCfg[88485]
EquipFumoInfo.SpecialReinforceVisualCfg[88537] = EquipFumoInfo.SpecialReinforceVisualCfg[88485]
EquipFumoInfo.SpecialReinforceVisualCfg[88538] = EquipFumoInfo.SpecialReinforceVisualCfg[88485]
EquipFumoInfo.SpecialReinforceVisualCfg[88464] = EquipFumoInfo.SpecialReinforceVisualCfg[88485]
EquipFumoInfo.SpecialReinforceVisualCfg[88465] = EquipFumoInfo.SpecialReinforceVisualCfg[88485]
EquipFumoInfo.SpecialReinforceVisualCfg[88466] = EquipFumoInfo.SpecialReinforceVisualCfg[88485]
EquipFumoInfo.SpecialReinforceVisualCfg[88467] = EquipFumoInfo.SpecialReinforceVisualCfg[88485]
EquipFumoInfo.SpecialReinforceVisualCfg[88468] = EquipFumoInfo.SpecialReinforceVisualCfg[88485]
EquipFumoInfo.SpecialReinforceVisualCfg[88469] = EquipFumoInfo.SpecialReinforceVisualCfg[88485]
EquipFumoInfo.SpecialReinforceVisualCfg[88566] = EquipFumoInfo.SpecialReinforceVisualCfg[88485]
EquipFumoInfo.SpecialReinforceVisualCfg[88567] = EquipFumoInfo.SpecialReinforceVisualCfg[88485]
EquipFumoInfo.SpecialReinforceVisualCfg[88568] = EquipFumoInfo.SpecialReinforceVisualCfg[88485]
EquipFumoInfo.SpecialReinforceVisualCfg[88569] = EquipFumoInfo.SpecialReinforceVisualCfg[88485]
EquipFumoInfo.SpecialReinforceVisualCfg[88570] = EquipFumoInfo.SpecialReinforceVisualCfg[88485]
EquipFumoInfo.SpecialReinforceVisualCfg[88571] = EquipFumoInfo.SpecialReinforceVisualCfg[88485]
EquipFumoInfo.SpecialReinforceVisualCfg[97931] = EquipFumoInfo.SpecialReinforceVisualCfg[88485]
EquipFumoInfo.SpecialReinforceVisualCfg[97932] = EquipFumoInfo.SpecialReinforceVisualCfg[88485]
EquipFumoInfo.SpecialReinforceVisualCfg[97933] = EquipFumoInfo.SpecialReinforceVisualCfg[88485]
EquipFumoInfo.SpecialReinforceVisualCfg[97934] = EquipFumoInfo.SpecialReinforceVisualCfg[88485]
EquipFumoInfo.SpecialReinforceVisualCfg[97935] = EquipFumoInfo.SpecialReinforceVisualCfg[88485]
EquipFumoInfo.SpecialReinforceVisualCfg[97936] = EquipFumoInfo.SpecialReinforceVisualCfg[88485]
EquipFumoInfo.SpecialReinforceVisualCfg[105931] = EquipFumoInfo.SpecialReinforceVisualCfg[88485]
EquipFumoInfo.SpecialReinforceVisualCfg[105932] = EquipFumoInfo.SpecialReinforceVisualCfg[88485]
EquipFumoInfo.SpecialReinforceVisualCfg[105933] = EquipFumoInfo.SpecialReinforceVisualCfg[88485]
EquipFumoInfo.SpecialReinforceVisualCfg[105934] = EquipFumoInfo.SpecialReinforceVisualCfg[88485]
EquipFumoInfo.SpecialReinforceVisualCfg[105935] = EquipFumoInfo.SpecialReinforceVisualCfg[88485]
EquipFumoInfo.SpecialReinforceVisualCfg[105936] = EquipFumoInfo.SpecialReinforceVisualCfg[88485]
----7阶琉璃
EquipFumoInfo.SpecialReinforceVisualCfg[95357] =
{
--成长等级下限,成长等级上限,对应的光效等级文件夹,是否UV流动,U的流动速度,V的流动速度,对应的光效目录名称,对应的UV流动贴图（作废），bloom颜色（策划自己定），bloom强度（策划自己定）
        {	0,	20,	"07",	true,		0.2,		0.5,	"武器附魔\\琉璃武器",	"",	0xff132882, 5.0},

}
EquipFumoInfo.SpecialReinforceVisualCfg[95356] = EquipFumoInfo.SpecialReinforceVisualCfg[95357]
EquipFumoInfo.SpecialReinforceVisualCfg[95358] = EquipFumoInfo.SpecialReinforceVisualCfg[95357]
EquipFumoInfo.SpecialReinforceVisualCfg[95359] = EquipFumoInfo.SpecialReinforceVisualCfg[95357]
EquipFumoInfo.SpecialReinforceVisualCfg[95360] = EquipFumoInfo.SpecialReinforceVisualCfg[95357]
EquipFumoInfo.SpecialReinforceVisualCfg[95361] = EquipFumoInfo.SpecialReinforceVisualCfg[95357]
EquipFumoInfo.SpecialReinforceVisualCfg[95362] = EquipFumoInfo.SpecialReinforceVisualCfg[95357]
EquipFumoInfo.SpecialReinforceVisualCfg[95363] = EquipFumoInfo.SpecialReinforceVisualCfg[95357]
EquipFumoInfo.SpecialReinforceVisualCfg[95364] = EquipFumoInfo.SpecialReinforceVisualCfg[95357]
EquipFumoInfo.SpecialReinforceVisualCfg[95365] = EquipFumoInfo.SpecialReinforceVisualCfg[95357]
EquipFumoInfo.SpecialReinforceVisualCfg[95368] = EquipFumoInfo.SpecialReinforceVisualCfg[95357]
EquipFumoInfo.SpecialReinforceVisualCfg[98578] = EquipFumoInfo.SpecialReinforceVisualCfg[95357]
EquipFumoInfo.SpecialReinforceVisualCfg[105943] = EquipFumoInfo.SpecialReinforceVisualCfg[95357]
----7阶白银
EquipFumoInfo.SpecialReinforceVisualCfg[95346] =
{
--成长等级下限,成长等级上限,对应的光效等级文件夹,是否UV流动,U的流动速度,V的流动速度,对应的光效目录名称,对应的UV流动贴图（作废），bloom颜色（策划自己定），bloom强度（策划自己定）
        {	0,	20,	"01",	true,		0.2,		0.5,	"武器附魔\\白银",	"",	0xff132882, 5.0},

}
EquipFumoInfo.SpecialReinforceVisualCfg[95347] = EquipFumoInfo.SpecialReinforceVisualCfg[95346]
EquipFumoInfo.SpecialReinforceVisualCfg[95348] = EquipFumoInfo.SpecialReinforceVisualCfg[95346]
EquipFumoInfo.SpecialReinforceVisualCfg[95349] = EquipFumoInfo.SpecialReinforceVisualCfg[95346]
EquipFumoInfo.SpecialReinforceVisualCfg[95350] = EquipFumoInfo.SpecialReinforceVisualCfg[95346]
EquipFumoInfo.SpecialReinforceVisualCfg[95351] = EquipFumoInfo.SpecialReinforceVisualCfg[95346]
EquipFumoInfo.SpecialReinforceVisualCfg[95352] = EquipFumoInfo.SpecialReinforceVisualCfg[95346]
EquipFumoInfo.SpecialReinforceVisualCfg[95353] = EquipFumoInfo.SpecialReinforceVisualCfg[95346]
EquipFumoInfo.SpecialReinforceVisualCfg[95354] = EquipFumoInfo.SpecialReinforceVisualCfg[95346]
EquipFumoInfo.SpecialReinforceVisualCfg[95355] = EquipFumoInfo.SpecialReinforceVisualCfg[95346]
EquipFumoInfo.SpecialReinforceVisualCfg[95367] = EquipFumoInfo.SpecialReinforceVisualCfg[95346]
EquipFumoInfo.SpecialReinforceVisualCfg[98572] = EquipFumoInfo.SpecialReinforceVisualCfg[95346]
EquipFumoInfo.SpecialReinforceVisualCfg[105937] = EquipFumoInfo.SpecialReinforceVisualCfg[95346]
----7阶黄金
EquipFumoInfo.SpecialReinforceVisualCfg[95336] =
{
--成长等级下限,成长等级上限,对应的光效等级文件夹,是否UV流动,U的流动速度,V的流动速度,对应的光效目录名称,对应的UV流动贴图（作废），bloom颜色（策划自己定），bloom强度（策划自己定）
        {	0,	20,	"01",	true,		0.2,		0.5,	"武器附魔\\黄金",	"",	0xff132882, 5.0},

}
EquipFumoInfo.SpecialReinforceVisualCfg[95337] = EquipFumoInfo.SpecialReinforceVisualCfg[95336]
EquipFumoInfo.SpecialReinforceVisualCfg[95338] = EquipFumoInfo.SpecialReinforceVisualCfg[95336]
EquipFumoInfo.SpecialReinforceVisualCfg[95339] = EquipFumoInfo.SpecialReinforceVisualCfg[95336]
EquipFumoInfo.SpecialReinforceVisualCfg[95340] = EquipFumoInfo.SpecialReinforceVisualCfg[95336]
EquipFumoInfo.SpecialReinforceVisualCfg[95341] = EquipFumoInfo.SpecialReinforceVisualCfg[95336]
EquipFumoInfo.SpecialReinforceVisualCfg[95342] = EquipFumoInfo.SpecialReinforceVisualCfg[95336]
EquipFumoInfo.SpecialReinforceVisualCfg[95343] = EquipFumoInfo.SpecialReinforceVisualCfg[95336]
EquipFumoInfo.SpecialReinforceVisualCfg[95344] = EquipFumoInfo.SpecialReinforceVisualCfg[95336]
EquipFumoInfo.SpecialReinforceVisualCfg[95345] = EquipFumoInfo.SpecialReinforceVisualCfg[95336]
EquipFumoInfo.SpecialReinforceVisualCfg[95366] = EquipFumoInfo.SpecialReinforceVisualCfg[95336]
EquipFumoInfo.SpecialReinforceVisualCfg[98575] = EquipFumoInfo.SpecialReinforceVisualCfg[95336]
EquipFumoInfo.SpecialReinforceVisualCfg[105940] = EquipFumoInfo.SpecialReinforceVisualCfg[95336]

----8阶琉璃
EquipFumoInfo.SpecialReinforceVisualCfg[95390] =
{
--成长等级下限,成长等级上限,对应的光效等级文件夹,是否UV流动,U的流动速度,V的流动速度,对应的光效目录名称,对应的UV流动贴图（作废），bloom颜色（策划自己定），bloom强度（策划自己定）
        {	0,	20,	"08",	true,		0.2,		0.5,	"武器附魔\\琉璃武器",	"",	0xff132882, 5.0},
}
EquipFumoInfo.SpecialReinforceVisualCfg[95389] = EquipFumoInfo.SpecialReinforceVisualCfg[95390]
EquipFumoInfo.SpecialReinforceVisualCfg[95391] = EquipFumoInfo.SpecialReinforceVisualCfg[95390]
EquipFumoInfo.SpecialReinforceVisualCfg[95392] = EquipFumoInfo.SpecialReinforceVisualCfg[95390]
EquipFumoInfo.SpecialReinforceVisualCfg[95393] = EquipFumoInfo.SpecialReinforceVisualCfg[95390]
EquipFumoInfo.SpecialReinforceVisualCfg[95394] = EquipFumoInfo.SpecialReinforceVisualCfg[95390]
EquipFumoInfo.SpecialReinforceVisualCfg[95395] = EquipFumoInfo.SpecialReinforceVisualCfg[95390]
EquipFumoInfo.SpecialReinforceVisualCfg[95396] = EquipFumoInfo.SpecialReinforceVisualCfg[95390]
EquipFumoInfo.SpecialReinforceVisualCfg[95397] = EquipFumoInfo.SpecialReinforceVisualCfg[95390]
EquipFumoInfo.SpecialReinforceVisualCfg[95398] = EquipFumoInfo.SpecialReinforceVisualCfg[95390]
EquipFumoInfo.SpecialReinforceVisualCfg[95401] = EquipFumoInfo.SpecialReinforceVisualCfg[95390]
EquipFumoInfo.SpecialReinforceVisualCfg[98579] = EquipFumoInfo.SpecialReinforceVisualCfg[95390]
EquipFumoInfo.SpecialReinforceVisualCfg[105944] = EquipFumoInfo.SpecialReinforceVisualCfg[95390]
----8阶白银
EquipFumoInfo.SpecialReinforceVisualCfg[95379] =
{
--成长等级下限,成长等级上限,对应的光效等级文件夹,是否UV流动,U的流动速度,V的流动速度,对应的光效目录名称,对应的UV流动贴图（作废），bloom颜色（策划自己定），bloom强度（策划自己定）
        {	0,	20,	"02",	true,		0.2,		0.5,	"武器附魔\\白银",	"",	0xff132882, 5.0},

}
EquipFumoInfo.SpecialReinforceVisualCfg[95380] = EquipFumoInfo.SpecialReinforceVisualCfg[95379]
EquipFumoInfo.SpecialReinforceVisualCfg[95381] = EquipFumoInfo.SpecialReinforceVisualCfg[95379]
EquipFumoInfo.SpecialReinforceVisualCfg[95382] = EquipFumoInfo.SpecialReinforceVisualCfg[95379]
EquipFumoInfo.SpecialReinforceVisualCfg[95383] = EquipFumoInfo.SpecialReinforceVisualCfg[95379]
EquipFumoInfo.SpecialReinforceVisualCfg[95384] = EquipFumoInfo.SpecialReinforceVisualCfg[95379]
EquipFumoInfo.SpecialReinforceVisualCfg[95385] = EquipFumoInfo.SpecialReinforceVisualCfg[95379]
EquipFumoInfo.SpecialReinforceVisualCfg[95386] = EquipFumoInfo.SpecialReinforceVisualCfg[95379]
EquipFumoInfo.SpecialReinforceVisualCfg[95387] = EquipFumoInfo.SpecialReinforceVisualCfg[95379]
EquipFumoInfo.SpecialReinforceVisualCfg[95388] = EquipFumoInfo.SpecialReinforceVisualCfg[95379]
EquipFumoInfo.SpecialReinforceVisualCfg[95400] = EquipFumoInfo.SpecialReinforceVisualCfg[95379]
EquipFumoInfo.SpecialReinforceVisualCfg[98573] = EquipFumoInfo.SpecialReinforceVisualCfg[95379]
EquipFumoInfo.SpecialReinforceVisualCfg[905938] = EquipFumoInfo.SpecialReinforceVisualCfg[95379]
----8阶黄金
EquipFumoInfo.SpecialReinforceVisualCfg[95369] =
{
--成长等级下限,成长等级上限,对应的光效等级文件夹,是否UV流动,U的流动速度,V的流动速度,对应的光效目录名称,对应的UV流动贴图（作废），bloom颜色（策划自己定），bloom强度（策划自己定）
        {	0,	20,	"02",	true,		0.2,		0.5,	"武器附魔\\黄金",	"",	0xff132882, 5.0},

}
EquipFumoInfo.SpecialReinforceVisualCfg[95370] = EquipFumoInfo.SpecialReinforceVisualCfg[95369]
EquipFumoInfo.SpecialReinforceVisualCfg[95371] = EquipFumoInfo.SpecialReinforceVisualCfg[95369]
EquipFumoInfo.SpecialReinforceVisualCfg[95372] = EquipFumoInfo.SpecialReinforceVisualCfg[95369]
EquipFumoInfo.SpecialReinforceVisualCfg[95373] = EquipFumoInfo.SpecialReinforceVisualCfg[95369]
EquipFumoInfo.SpecialReinforceVisualCfg[95374] = EquipFumoInfo.SpecialReinforceVisualCfg[95369]
EquipFumoInfo.SpecialReinforceVisualCfg[95375] = EquipFumoInfo.SpecialReinforceVisualCfg[95369]
EquipFumoInfo.SpecialReinforceVisualCfg[95376] = EquipFumoInfo.SpecialReinforceVisualCfg[95369]
EquipFumoInfo.SpecialReinforceVisualCfg[95377] = EquipFumoInfo.SpecialReinforceVisualCfg[95369]
EquipFumoInfo.SpecialReinforceVisualCfg[95378] = EquipFumoInfo.SpecialReinforceVisualCfg[95369]
EquipFumoInfo.SpecialReinforceVisualCfg[95399] = EquipFumoInfo.SpecialReinforceVisualCfg[95369]
EquipFumoInfo.SpecialReinforceVisualCfg[98576] = EquipFumoInfo.SpecialReinforceVisualCfg[95369]
EquipFumoInfo.SpecialReinforceVisualCfg[105941] = EquipFumoInfo.SpecialReinforceVisualCfg[95369]

----9阶琉璃
EquipFumoInfo.SpecialReinforceVisualCfg[95423] =
{
--成长等级下限,成长等级上限,对应的光效等级文件夹,是否UV流动,U的流动速度,V的流动速度,对应的光效目录名称,对应的UV流动贴图（作废），bloom颜色（策划自己定），bloom强度（策划自己定）
        {	0,	20,	"09",	true,		0.2,		0.5,	"武器附魔\\琉璃武器",	"",	0xff132882, 5.0},
}
EquipFumoInfo.SpecialReinforceVisualCfg[95422] = EquipFumoInfo.SpecialReinforceVisualCfg[95423]
EquipFumoInfo.SpecialReinforceVisualCfg[95424] = EquipFumoInfo.SpecialReinforceVisualCfg[95423]
EquipFumoInfo.SpecialReinforceVisualCfg[95425] = EquipFumoInfo.SpecialReinforceVisualCfg[95423]
EquipFumoInfo.SpecialReinforceVisualCfg[95426] = EquipFumoInfo.SpecialReinforceVisualCfg[95423]
EquipFumoInfo.SpecialReinforceVisualCfg[95427] = EquipFumoInfo.SpecialReinforceVisualCfg[95423]
EquipFumoInfo.SpecialReinforceVisualCfg[95428] = EquipFumoInfo.SpecialReinforceVisualCfg[95423]
EquipFumoInfo.SpecialReinforceVisualCfg[95429] = EquipFumoInfo.SpecialReinforceVisualCfg[95423]
EquipFumoInfo.SpecialReinforceVisualCfg[95430] = EquipFumoInfo.SpecialReinforceVisualCfg[95423]
EquipFumoInfo.SpecialReinforceVisualCfg[95431] = EquipFumoInfo.SpecialReinforceVisualCfg[95423]
EquipFumoInfo.SpecialReinforceVisualCfg[95434] = EquipFumoInfo.SpecialReinforceVisualCfg[95423]
EquipFumoInfo.SpecialReinforceVisualCfg[98580] = EquipFumoInfo.SpecialReinforceVisualCfg[95423]
EquipFumoInfo.SpecialReinforceVisualCfg[105945] = EquipFumoInfo.SpecialReinforceVisualCfg[95423]
----9阶白银
EquipFumoInfo.SpecialReinforceVisualCfg[95412] =
{
--成长等级下限,成长等级上限,对应的光效等级文件夹,是否UV流动,U的流动速度,V的流动速度,对应的光效目录名称,对应的UV流动贴图（作废），bloom颜色（策划自己定），bloom强度（策划自己定）
        {	0,	20,	"03",	true,		0.2,		0.5,	"武器附魔\\白银",	"",	0xff132882, 5.0},

}
EquipFumoInfo.SpecialReinforceVisualCfg[95413] = EquipFumoInfo.SpecialReinforceVisualCfg[95412]
EquipFumoInfo.SpecialReinforceVisualCfg[95414] = EquipFumoInfo.SpecialReinforceVisualCfg[95412]
EquipFumoInfo.SpecialReinforceVisualCfg[95415] = EquipFumoInfo.SpecialReinforceVisualCfg[95412]
EquipFumoInfo.SpecialReinforceVisualCfg[95416] = EquipFumoInfo.SpecialReinforceVisualCfg[95412]
EquipFumoInfo.SpecialReinforceVisualCfg[95417] = EquipFumoInfo.SpecialReinforceVisualCfg[95412]
EquipFumoInfo.SpecialReinforceVisualCfg[95418] = EquipFumoInfo.SpecialReinforceVisualCfg[95412]
EquipFumoInfo.SpecialReinforceVisualCfg[95419] = EquipFumoInfo.SpecialReinforceVisualCfg[95412]
EquipFumoInfo.SpecialReinforceVisualCfg[95420] = EquipFumoInfo.SpecialReinforceVisualCfg[95412]
EquipFumoInfo.SpecialReinforceVisualCfg[95421] = EquipFumoInfo.SpecialReinforceVisualCfg[95412]
EquipFumoInfo.SpecialReinforceVisualCfg[95433] = EquipFumoInfo.SpecialReinforceVisualCfg[95412]
EquipFumoInfo.SpecialReinforceVisualCfg[98574] = EquipFumoInfo.SpecialReinforceVisualCfg[95412]
EquipFumoInfo.SpecialReinforceVisualCfg[105939] = EquipFumoInfo.SpecialReinforceVisualCfg[95412]
----9阶黄金
EquipFumoInfo.SpecialReinforceVisualCfg[95402] =
{
--成长等级下限,成长等级上限,对应的光效等级文件夹,是否UV流动,U的流动速度,V的流动速度,对应的光效目录名称,对应的UV流动贴图（作废），bloom颜色（策划自己定），bloom强度（策划自己定）
        {	0,	20,	"03",	true,		0.2,		0.5,	"武器附魔\\黄金",	"",	0xff132882, 5.0},

}
EquipFumoInfo.SpecialReinforceVisualCfg[95403] = EquipFumoInfo.SpecialReinforceVisualCfg[95402]
EquipFumoInfo.SpecialReinforceVisualCfg[95404] = EquipFumoInfo.SpecialReinforceVisualCfg[95402]
EquipFumoInfo.SpecialReinforceVisualCfg[95405] = EquipFumoInfo.SpecialReinforceVisualCfg[95402]
EquipFumoInfo.SpecialReinforceVisualCfg[95406] = EquipFumoInfo.SpecialReinforceVisualCfg[95402]
EquipFumoInfo.SpecialReinforceVisualCfg[95407] = EquipFumoInfo.SpecialReinforceVisualCfg[95402]
EquipFumoInfo.SpecialReinforceVisualCfg[95408] = EquipFumoInfo.SpecialReinforceVisualCfg[95402]
EquipFumoInfo.SpecialReinforceVisualCfg[95409] = EquipFumoInfo.SpecialReinforceVisualCfg[95402]
EquipFumoInfo.SpecialReinforceVisualCfg[95410] = EquipFumoInfo.SpecialReinforceVisualCfg[95402]
EquipFumoInfo.SpecialReinforceVisualCfg[95411] = EquipFumoInfo.SpecialReinforceVisualCfg[95402]
EquipFumoInfo.SpecialReinforceVisualCfg[95432] = EquipFumoInfo.SpecialReinforceVisualCfg[95402]
EquipFumoInfo.SpecialReinforceVisualCfg[98577] = EquipFumoInfo.SpecialReinforceVisualCfg[95402]
EquipFumoInfo.SpecialReinforceVisualCfg[105942] = EquipFumoInfo.SpecialReinforceVisualCfg[95402]

function EquipFumoInfo:GetSpecialReinforceVisualCfg()
	return EquipFumoInfo.SpecialReinforceVisualCfg
end

--各种攻击类型的附魔挂点配置
--攻击类型ATTACK_TYPE定义见visual.lua
--["挂点", "gfx文件名",位移X,位移Y,位移Z,角度水平,俯仰,倾斜,缩放比例,透明度},
--["cc_weapon", "2.gfx",0.25,0,0.015,0,1,90,1.3,1},
EquipFumoInfo.HookCfg =
{
	[ATTACK_TYPE.SHAOLIN] = 
	{
		["default"] =
		{
			{"FM_1","1.gfx",0,0,0,0,0,0,1,1},
			{"FM_2","2.gfx",0,0,0,0,0,0,1,1},
			{"FM_3","3.gfx",0,0,0,0,0,0,1,1},
			{"FM_6","6.gfx",0,0,0,0,0,0,1,1},
			{"FM_11","1.gfx",0,0,0,0,0,0,1,1},
		},
	        [24383] =
		{
			{"FM_1","1.gfx",0,0,0,0,0,0,1,1},
			{"FM_6","6.gfx",0,0,0,0,0,0,1,1},
			{"FM_11","1.gfx",0,0,0,0,0,0,1,1},
		},
		[24384] =
		{
			{"FM_1","1.gfx",0,0,0,0,0,0,1,1},
			{"FM_3","6.gfx",0,0,0,0,0,0,1,1},
		},		
	        [24385] =
		{
		        {"FM_1","1.gfx",0,0,0,0,0,0,1,1},
			{"FM_3","6.gfx",0,0,0,0,0,0,1,1},
		},
		[24386] =
		{
			{"FM_3","6.gfx",0,0,0,0,0,0,1,1},
		},
		[30669] =
		{
			{"FM_1","1.gfx",0,0,0,0,0,0,1,1},
			{"FM_6","6.gfx",0,0,0,0,0,0,1,1},
			{"FM_11","1.gfx",0,0,0,0,0,0,1,1},
		},
		[30670] =
		{
			{"FM_1","1.gfx",0,0,0,0,0,0,1,1},
			{"FM_3","6.gfx",0,0,0,0,0,0,1,1},
		},		
	        [30672] =
		{
		        {"FM_1","1.gfx",0,0,0,0,0,0,1,1},
			{"FM_3","6.gfx",0,0,0,0,0,0,1,1},
		},
		[30671] =
		{
			{"FM_3","6.gfx",0,0,0,0,0,0,1,1},
		},
		[21477] =
		{
			{"FM_01","1.gfx",0,0,0,0,0,0,1,1},
			{"FM_06","6.gfx",0,0,0,0,0,0,1,1},
			{"FM_11","1.gfx",0,0,0,0,0,0,1,1},
		},
		[21478] =
		{
			{"FM_01","1.gfx",0,0,0,0,0,0,1,1},
			{"FM_02","2.gfx",0,0,0,0,0,0,1,1},
			{"FM_03","3.gfx",0,0,0,0,0,0,1,1},
		},
		[21479] =
		{
			{"FM_01","1.gfx",0,0,0,0,0,0,1,1},
			{"FM_02","2.gfx",0,0,0,0,0,0,1,1},
			{"FM_03","3.gfx",0,0,0,0,0,0,1,1},
		},
		[21480] =
		{
			{"FM_02","2.gfx",0,0,0,0,0,0,1,1},
			{"FM_03","3.gfx",0,0,0,0,0,0,1,1},
		},
		[20831] =
		{
			{"FM_01","1.gfx",0,0,0,0,0,0,1,1},
			{"FM_06","6.gfx",0,0,0,0,0,0,1,1},
			{"FM_11","1.gfx",0,0,0,0,0,0,1,1},
		},
		[20832] =
		{
			{"FM_01","1.gfx",0,0,0,0,0,0,1,1},
			{"FM_02","2.gfx",0,0,0,0,0,0,1,1},
			{"FM_03","3.gfx",0,0,0,0,0,0,1,1},
		},
		[20833] =
		{
			{"FM_01","1.gfx",0,0,0,0,0,0,1,1},
			{"FM_02","2.gfx",0,0,0,0,0,0,1,1},
			{"FM_03","3.gfx",0,0,0,0,0,0,1,1},
		},
		[20834] =
		{
			{"FM_02","2.gfx",0,0,0,0,0,0,1,1},
			{"FM_03","3.gfx",0,0,0,0,0,0,1,1},
		},
		[21477] ={{"FM_1","1.gfx",0,0,0,0,0,0,1,1},{"FM_6","6.gfx",0,0,0,0,0,0,1,1},{"FM_11","1.gfx",0,0,0,0,0,0,1,1},},
[21478] ={{"FM_1","1.gfx",0,0,0,0,0,0,1,1},{"FM_2","2.gfx",0,0,0,0,0,0,1,1},{"FM_3","3.gfx",0,0,0,0,0,0,1,1},},
[21479] ={{"FM_1","1.gfx",0,0,0,0,0,0,1,1},{"FM_2","2.gfx",0,0,0,0,0,0,1,1},{"FM_3","3.gfx",0,0,0,0,0,0,1,1},},
[21480] ={{"FM_2","2.gfx",0,0,0,0,0,0,1,1},{"FM_3","3.gfx",0,0,0,0,0,0,1,1},},
[20831] ={{"FM_1","1.gfx",0,0,0,0,0,0,1,1},{"FM_6","6.gfx",0,0,0,0,0,0,1,1},{"FM_11","1.gfx",0,0,0,0,0,0,1,1},},
[20832] ={{"FM_1","1.gfx",0,0,0,0,0,0,1,1},{"FM_2","2.gfx",0,0,0,0,0,0,1,1},{"FM_3","3.gfx",0,0,0,0,0,0,1,1},},
[20833] ={{"FM_1","1.gfx",0,0,0,0,0,0,1,1},{"FM_2","2.gfx",0,0,0,0,0,0,1,1},{"FM_3","3.gfx",0,0,0,0,0,0,1,1},},
[20834] ={{"FM_2","2.gfx",0,0,0,0,0,0,1,1},{"FM_3","3.gfx",0,0,0,0,0,0,1,1},},
[27088] ={{"FM_1","1.gfx",0,0,0,0,0,0,1,1},{"FM_6","6.gfx",0,0,0,0,0,0,1,1},{"FM_11","1.gfx",0,0,0,0,0,0,1,1},},
[27089] ={{"FM_1","1.gfx",0,0,0,0,0,0,1,1},{"FM_2","2.gfx",0,0,0,0,0,0,1,1},{"FM_3","3.gfx",0,0,0,0,0,0,1,1},},
[27090] ={{"FM_1","1.gfx",0,0,0,0,0,0,1,1},{"FM_2","2.gfx",0,0,0,0,0,0,1,1},{"FM_3","3.gfx",0,0,0,0,0,0,1,1},},
[27091] ={{"FM_2","2.gfx",0,0,0,0,0,0,1,1},{"FM_3","3.gfx",0,0,0,0,0,0,1,1},},
[27092] ={{"FM_1","1.gfx",0,0,0,0,0,0,1,1},{"FM_6","6.gfx",0,0,0,0,0,0,1,1},{"FM_11","1.gfx",0,0,0,0,0,0,1,1},},
[27093] ={{"FM_1","1.gfx",0,0,0,0,0,0,1,1},{"FM_2","2.gfx",0,0,0,0,0,0,1,1},{"FM_3","3.gfx",0,0,0,0,0,0,1,1},},
[27094] ={{"FM_1","1.gfx",0,0,0,0,0,0,1,1},{"FM_2","2.gfx",0,0,0,0,0,0,1,1},{"FM_3","3.gfx",0,0,0,0,0,0,1,1},},
[27095] ={{"FM_2","2.gfx",0,0,0,0,0,0,1,1},{"FM_3","3.gfx",0,0,0,0,0,0,1,1},},
[27030] ={{"FM_1","1.gfx",0,0,0,0,0,0,1,1},{"FM_6","6.gfx",0,0,0,0,0,0,1,1},{"FM_11","1.gfx",0,0,0,0,0,0,1,1},},
[27031] ={{"FM_1","1.gfx",0,0,0,0,0,0,1,1},{"FM_3","6.gfx",0,0,0,0,0,0,1,1},},
[27032] ={{"FM_1","1.gfx",0,0,0,0,0,0,1,1},{"FM_3","6.gfx",0,0,0,0,0,0,1,1},},
[27033] ={{"FM_3","6.gfx",0,0,0,0,0,0,1,1},},

		
	},
	[ATTACK_TYPE.WUDANG] = 
	{
		["default"] = 
		{
			{"cc_weapon","1.gfx",0.2,0,-0.008,0,0,0,1.3,1},
			{"cc_weapon","2.gfx",0.25,0,0.07,0,1,90,1.3,1},
			{"cc_weapon","10.gfx",0.46,0.0015,-0.01,0,0.6,90,1.3,1},
		},
		[257] = 
		{
			{"cc_weapon","1.gfx",0.25,0,0,0,0,0,1.5,1},
			{"cc_weapon","2.gfx",0.1,0,0,0,0,90,1.5,1},
			{"cc_weapon","3.gfx",0.57,0,0,0,0.9,90,1.5,1},
		},
		[258] = 
		{
			{"cc_weapon","1.gfx",0.2,0,0,0,0,0,1.5,1},
			{"cc_weapon","2.gfx",0.1,0,0,0,0,90,1.5,1},
			{"cc_weapon","3.gfx",0.57,0,0,0,0.9,90,1.6,1},
		},
		[259] = 
		{
			{"cc_weapon","1.gfx",0.4,0,0,0,0,0,1.5,1},
			{"cc_weapon","2.gfx",0.1,0,0,0,0,90,1.5,1},
			{"cc_weapon","3.gfx",0.57,0,0,0,0.9,90,1.3,1},
		},
		[260] = 
		{
			{"cc_weapon","1.gfx",0.4,0,0,0,0,0,2,1},
			{"cc_weapon","2.gfx",0.1,0,0,0,0,90,1.5,1},
			{"cc_weapon","3.gfx",0.57,0,0,0,0.9,90,1.6,1},
		},
		[261] = 
		{
			{"cc_weapon","1.gfx",0.4,0,0,0,0,0,2,1},
			{"cc_weapon","2.gfx",0.1,0,0,0,0,90,1.5,1},
			{"cc_weapon","3.gfx",0.57,0,0,0,0.9,90,1.5,1},
		},
		[262] = 
		{
			{"cc_weapon","1.gfx",0.4,0,0,0,0,0,2,1},
			{"cc_weapon","2.gfx",0.1,0,0,0,0,90,1.5,1},
			{"cc_weapon","3.gfx",0.57,0,0,0,0.9,90,1.6,1},
		},
		[263] =
		{
			{"cc_weapon","1.gfx",0.38,0,0,0,0,0,1.5,1},
			{"cc_weapon","2.gfx",0.22,0,0,0,0,90,1.4,1},
			{"cc_weapon","3.gfx",0.58,0,0,0,0.9,90,1.5,1},
		},
		[24387] =
		{
			{"cc_weapon","1.gfx",0.30,0,0,0,0,0,1,1},
			{"cc_weapon","13.gfx",0.36,-0.1,0,0,0,90,2,1},
			{"cc_weapon","3.gfx",0.36,0,0,0,0,90,2,1,1},
		},
		[21481] ={{"FM_1","1.gfx",0,0,0,0,0,0,1,1},{"FM_2","2.gfx",0,0,0,0,0,0,1,1},{"FM_0","3.gfx",0,0,0,0,0,0,1,1},},
[20835] ={{"FM_1","1.gfx",0,0,0,0,0,0,1,1},{"FM_2","2.gfx",0,0,0,0,0,0,1,1},{"FM_0","3.gfx",0,0,0,0,0,0,1,1},},
[27096] ={{"FM_1","1.gfx",0,0,0,0,0,0,1,1},{"FM_2","2.gfx",0,0,0,0,0,0,1,1},{"FM_0","3.gfx",0,0,0,0,0,0,1,1},},
[27097] ={{"FM_1","1.gfx",0,0,0,0,0,0,1,1},{"FM_2","2.gfx",0,0,0,0,0,0,1,1},{"FM_0","3.gfx",0,0,0,0,0,0,1,1},},
[27034] ={{"FM_1","1.gfx",0,0,0,0,0,0,1,1},{"FM_2","13.gfx",0,0,0,0,0,0,1,1},{"FM_0","3.gfx",0,0,0,0,0,0,1,1,1},},

	},
	[ATTACK_TYPE.HUASHAN] = 
	{
		["default"] = 
		{
			{"FM_1", "1.gfx",0,0,0,0,0,0,1,1},
			{"FM_2", "2.gfx",0,0,0,0,0,0,1,1},
			{"FM_3", "3.gfx",0,0,0,0,0,0,1,1},
		},
	        [24363] =
		{
			{"FM_1","1.gfx",0,0,0,0,0,0,1,1},
			{"FM_2","2.gfx",0,0,0,0,0,0,1,1},
			{"FM_3","13.gfx",0,0,0,0,0,0,1,1},
		},
	        [24364] =
		{
			{"FM_1","15.gfx",0,0,0,0,0,0,1,1},
			{"FM_2","1.gfx",0,0,0,0,0,0,1,1},
		},
		[21460] ={{"FM_1","1.gfx",0,0,0,0,0,0,1,1},{"FM_2","2.gfx",0,0,0,0,0,0,1,1},{"FM_3","3.gfx",0,0,0,0,0,0,1,1},},
[20801] ={{"FM_1","1.gfx",0,0,0,0,0,0,1,1},{"FM_2","2.gfx",0,0,0,0,0,0,1,1},{"FM_3","3.gfx",0,0,0,0,0,0,1,1},},
[27046] ={{"FM_1","1.gfx",0,0,0,0,0,0,1,1},{"FM_2","2.gfx",0,0,0,0,0,0,1,1},{"FM_3","3.gfx",0,0,0,0,0,0,1,1},},
[27048] ={{"FM_1","1.gfx",0,0,0,0,0,0,1,1},{"FM_2","2.gfx",0,0,0,0,0,0,1,1},{"FM_3","3.gfx",0,0,0,0,0,0,1,1},},
[27009] ={{"FM_1","1.gfx",0,0,0,0,0,0,1,1},{"FM_2","2.gfx",0,0,0,0,0,0,1,1},{"FM_3","13.gfx",0,0,0,0,0,0,1,1},},

	},
	[ATTACK_TYPE.NORTH_HENGSHAN] = 
	{
		["default"] = 
		{
			{"FM_1", "1.gfx",0,0,0,0,0,0,1,1},
			{"FM_11", "1.gfx",0,0,0,0,0,0,1,1},
			{"FM_2", "2.gfx",0,0,0,0,0,0,1,1},
			{"FM_3", "3.gfx",0,0,0,0,0,0,1,1},
		},
	        [24366] =
		{
			{"FM_1","1.gfx",0,0,0,0,0,0,1,1},
			{"FM_2","8.gfx",0,0,0,0,0,0,1,1},
			{"FM_3","13.gfx",0,0,0,0,0,0,1,1},
		},
		[24367] =
		{
			{"FM_1","1.gfx",0,0,0,0,0,0,1,1},
			{"FM_2","8.gfx",0,0,0,0,0,0,1,1},
			{"FM_3","13.gfx",0,0,0,0,0,0,1,1},
		},
		[24368] =
		{
			{"FM_1","1.gfx",0,0,0,0,0,0,1,1},
			{"FM_2","8.gfx",0,0,0,0,0,0,1,1},
			{"FM_3","13.gfx",0,0,0,0,0,0,1,1},
		},
		[24369] =
		{
			{"FM_1","1.gfx",0,0,0,0,0,0,1,1},
			{"FM_2","8.gfx",0,0,0,0,0,0,1,1},
			{"FM_3","13.gfx",0,0,0,0,0,0,1,1},
		},
		[21462] ={{"FM_1","1.gfx",0,0,0,0,0,0,1,1},{"FM_2","3.gfx",0,0,0,0,0,0,1,1},{"FM_3","2.gfx",0,0,0,0,0,0,1,1},},
[21463] ={{"FM_1","1.gfx",0,0,0,0,0,0,1,1},{"FM_2","2.gfx",0,0,0,0,0,0,1,1},{"FM_3","3.gfx",0,0,0,0,0,0,1,1},},
[23212] ={{"FM_1","1.gfx",0,0,0,0,0,0,1,1},{"FM_2","3.gfx",0,0,0,0,0,0,1,1},{"FM_3","2.gfx",0,0,0,0,0,0,1,1},},
[23213] ={{"FM_1","1.gfx",0,0,0,0,0,0,1,1},{"FM_2","2.gfx",0,0,0,0,0,0,1,1},{"FM_3","3.gfx",0,0,0,0,0,0,1,1},},
[20804] ={{"FM_1","1.gfx",0,0,0,0,0,0,1,1},{"FM_2","3.gfx",0,0,0,0,0,0,1,1},{"FM_3","2.gfx",0,0,0,0,0,0,1,1},},
[20805] ={{"FM_1","1.gfx",0,0,0,0,0,0,1,1},{"FM_2","2.gfx",0,0,0,0,0,0,1,1},{"FM_3","3.gfx",0,0,0,0,0,0,1,1},},
[23210] ={{"FM_1","1.gfx",0,0,0,0,0,0,1,1},{"FM_2","3.gfx",0,0,0,0,0,0,1,1},{"FM_3","2.gfx",0,0,0,0,0,0,1,1},},
[23211] ={{"FM_1","1.gfx",0,0,0,0,0,0,1,1},{"FM_2","2.gfx",0,0,0,0,0,0,1,1},{"FM_3","3.gfx",0,0,0,0,0,0,1,1},},
[27052] ={{"FM_1","1.gfx",0,0,0,0,0,0,1,1},{"FM_2","3.gfx",0,0,0,0,0,0,1,1},{"FM_3","13.gfx",0,0,0,0,0,0,1,1},},
[27053] ={{"FM_1","1.gfx",0,0,0,0,0,0,1,1},{"FM_2","3.gfx",0,0,0,0,0,0,1,1},{"FM_3","13.gfx",0,0,0,0,0,0,1,1},},
[27054] ={{"FM_1","1.gfx",0,0,0,0,0,0,1,1},{"FM_2","3.gfx",0,0,0,0,0,0,1,1},{"FM_3","13.gfx",0,0,0,0,0,0,1,1},},
[27055] ={{"FM_1","1.gfx",0,0,0,0,0,0,1,1},{"FM_2","3.gfx",0,0,0,0,0,0,1,1},{"FM_3","13.gfx",0,0,0,0,0,0,1,1},},
[27056] ={{"FM_1","1.gfx",0,0,0,0,0,0,1,1},{"FM_2","3.gfx",0,0,0,0,0,0,1,1},{"FM_3","13.gfx",0,0,0,0,0,0,1,1},},
[27057] ={{"FM_1","1.gfx",0,0,0,0,0,0,1,1},{"FM_2","3.gfx",0,0,0,0,0,0,1,1},{"FM_3","13.gfx",0,0,0,0,0,0,1,1},},
[27058] ={{"FM_1","1.gfx",0,0,0,0,0,0,1,1},{"FM_2","3.gfx",0,0,0,0,0,0,1,1},{"FM_3","13.gfx",0,0,0,0,0,0,1,1},},
[27059] ={{"FM_1","1.gfx",0,0,0,0,0,0,1,1},{"FM_2","3.gfx",0,0,0,0,0,0,1,1},{"FM_3","13.gfx",0,0,0,0,0,0,1,1},},
[27012] ={{"FM_1","1.gfx",0,0,0,0,0,0,1,1},{"FM_2","8.gfx",0,0,0,0,0,0,1,1},{"FM_3","13.gfx",0,0,0,0,0,0,1,1},},
[27013] ={{"FM_1","1.gfx",0,0,0,0,0,0,1,1},{"FM_2","8.gfx",0,0,0,0,0,0,1,1},{"FM_3","13.gfx",0,0,0,0,0,0,1,1},},
[27014] ={{"FM_1","1.gfx",0,0,0,0,0,0,1,1},{"FM_2","8.gfx",0,0,0,0,0,0,1,1},{"FM_3","13.gfx",0,0,0,0,0,0,1,1},},
[27015] ={{"FM_1","1.gfx",0,0,0,0,0,0,1,1},{"FM_2","8.gfx",0,0,0,0,0,0,1,1},{"FM_3","13.gfx",0,0,0,0,0,0,1,1},},

	},
	[ATTACK_TYPE.SOUTH_HENGSHAN] =
	{ 
		["default"] = 
		{
			{"FM_1", "1.gfx",0,0,0,0,0,0,1,1},
			{"FM_2", "3.gfx",0,0,0,0,0,0,1,1},
			{"FM_3", "2.gfx",0,0,0,0,0,0,1,1},
		},
		[24380] =
		{
			{"FM_1","1.gfx",0,0,0,0,0,0,1,1},
			{"FM_2","9.gfx",0,0,0,0,0,0,1,1},
		},
		[24381] =
		{
			{"FM_1","1.gfx",0,0,0,0,0,0,1,1},
			{"FM_2","9.gfx",0,0,0,0,0,0,1,1},
			{"FM_3","13.gfx",0,0,0,0,0,0,1,1},
		},
		[24382] =
		{
			{"FM_1","1.gfx",0,0,0,0,0,0,1,1},
			{"FM_3","9.gfx",0,0,0,0,0,0,1,1},
		},
		[21474] ={{"FM_1","1.gfx",0,0,0,0,0,0,1,1},{"FM_2","2.gfx",0,0,0,0,0,0,1,1},},
[21475] ={{"FM_1","1.gfx",0,0,0,0,0,0,1,1},{"FM_2","2.gfx",0,0,0,0,0,0,1,1},{"FM_3","3.gfx",0,0,0,0,0,0,1,1},},
[21476] ={{"FM_1","1.gfx",0,0,0,0,0,0,1,1},{"FM_2","2.gfx",0,0,0,0,0,0,1,1},{"FM_3","3.gfx",0,0,0,0,0,0,1,1},},
[20828] ={{"FM_1","1.gfx",0,0,0,0,0,0,1,1},{"FM_2","2.gfx",0,0,0,0,0,0,1,1},},
[20829] ={{"FM_1","1.gfx",0,0,0,0,0,0,1,1},{"FM_2","2.gfx",0,0,0,0,0,0,1,1},{"FM_3","3.gfx",0,0,0,0,0,0,1,1},},
[20830] ={{"FM_1","1.gfx",0,0,0,0,0,0,1,1},{"FM_2","2.gfx",0,0,0,0,0,0,1,1},{"FM_3","3.gfx",0,0,0,0,0,0,1,1},},
[27082] ={{"FM_1","1.gfx",0,0,0,0,0,0,1,1},{"FM_2","13.gfx",0,0,0,0,0,0,1,1},},
[27083] ={{"FM_1","1.gfx",0,0,0,0,0,0,1,1},{"FM_2","9.gfx",0,0,0,0,0,0,1,1},{"FM_3","13.gfx",0,0,0,0,0,0,1,1},},
[27084] ={{"FM_1","1.gfx",0,0,0,0,0,0,1,1},{"FM_3","9.gfx",0,0,0,0,0,0,1,1},},
[27085] ={{"FM_1","1.gfx",0,0,0,0,0,0,1,1},{"FM_2","13.gfx",0,0,0,0,0,0,1,1},},
[27086] ={{"FM_1","1.gfx",0,0,0,0,0,0,1,1},{"FM_2","9.gfx",0,0,0,0,0,0,1,1},{"FM_3","13.gfx",0,0,0,0,0,0,1,1},},
[27087] ={{"FM_1","1.gfx",0,0,0,0,0,0,1,1},{"FM_3","9.gfx",0,0,0,0,0,0,1,1},},
[27027] ={{"FM_1","1.gfx",0,0,0,0,0,0,1,1},{"FM_2","9.gfx",0,0,0,0,0,0,1,1},},
[27028] ={{"FM_1","1.gfx",0,0,0,0,0,0,1,1},{"FM_2","9.gfx",0,0,0,0,0,0,1,1},{"FM_3","13.gfx",0,0,0,0,0,0,1,1},},
[27029] ={{"FM_1","1.gfx",0,0,0,0,0,0,1,1},{"FM_2","9.gfx",0,0,0,0,0,0,1,1},{"FM_3","13.gfx",0,0,0,0,0,0,1,1},},

	},
	[ATTACK_TYPE.RIYUE] = 
	{
		["default"] = 
		{
			{"HH_fx01", "11.gfx",0,0,0,0,0,0,1,1},
			{"HH_fx01", "1.gfx",0,0,0,0,0,0,1,1},
			{"FM_1", "1.gfx",0,0,0,0,0,0,1,1},
			{"FM_11", "11.gfx",0,0,0,0,0,0,1,1},
			{"FM_12", "11.gfx",0,0,0,0,0,0,1,1},
		},
		[305] = 
		{
			{"HH_FX01", "1.gfx",0.17,0,0,0,0,0,1,1},
			{"HH_FX01", "11.gfx",0.23,-0.05,0,0,-180,90,0.6,1},
		},
		[871] = 
		{
			{"HH_FX01", "1.gfx",0.15,0.02,0,0,0,0,1,1},
			{"HH_FX12", "11.gfx",-0.56,0.1,0,0,0,-90,0.6,1},
		},
        [306] = 
		{
			{"HH_FX01", "1.gfx",0.19,0,0,0,0,0,1,1},
			{"HH_FX01", "11.gfx",0.3,-0.1,0,0,-180,98,0.6,1},
		},
        [872] = 
		{
			{"HH_FX01", "1.gfx",.19,0.05,0,0,0,0,1,1},
			{"HH_FX01", "11.gfx",0.24,0.14,0,0,0,-98,0.7,1},
		},
        [307] = 
		{
			{"HH_FX01", "1.gfx",0.6,0.03,0,0,0,0,1,1},
			{"HH_FX01", "11.gfx",0.37,-0.12,0,0,-180,90,0.6,1},
		},
        [873] = 
		{
			{"HH_FX01", "1.gfx",0.66,0.01,0,0,0,0,1,1},
			{"HH_FX01", "11.gfx",0.42,0.14,0,0,0,-90,0.6,1},
		},
        [308] = 
		{
			{"HH_FX01", "1.gfx",0.26,-0.02,0,0,0,0,1,1},
			{"HH_FX01", "11.gfx",0.32,-0.06,0,0,-180,90,0.6,1},
		},
        [874] = 
		{
			{"HH_FX01", "1.gfx",0.22,0.04,0,0,0,0,1,1},
			{"HH_FX01", "11.gfx",0.26,0.09,0,0,0,-90,0.6,1},
		},
        [309] = 
		{
			{"HH_FX01", "1.gfx",0.44,0.01,0,0,0,0,1,1},
			{"HH_FX01", "11.gfx",0.20,-0.12,0,0,-180,90,0.7,1},
		},
        [875] = 
		{
			{"HH_FX01", "1.gfx",0.4,0.02,0,0,0,0,1,1},
			{"HH_FX01", "11.gfx",0.17,0.15,0,0,0,-90,0.7,1},
		},
        [310] = 
		{
			{"HH_FX01", "1.gfx",0.22,0.07,0,0,0,0,1,1},
			{"HH_FX01", "11.gfx",0.26,-0.07,0,0,-180,98,0.7,1},
		},
        [876] = 
		{
			{"HH_FX01", "1.gfx",0.24,-0.05,0,0,0,0,1,1},
			{"HH_FX01", "11.gfx",0.26,0.05,0,0,0,-90,0.7,1},
		},
        [311] = 
		{
			{"HH_FX01", "1.gfx",0.22,0.07,0,0,0,0,1,1},
			{"HH_FX01", "11.gfx",0.36,0,0,0,-180,98,0.7,1},
		},
        [877] = 
		{
			{"HH_FX01", "1.gfx",0.24,-0.05,0,0,0,0,1,1},
			{"HH_FX01", "11.gfx",0.3,0,0,0,0,-90,0.7,1},
		},
        [312] = 
		{
			{"HH_FX01", "1.gfx",0.6,0.04,0,0,0,0,1,1},
			{"HH_FX01", "11.gfx",0.35,-0.08,0,0,-180,98,0.7,1},
		},
        [878] = 
		{
			{"HH_FX01", "1.gfx",0.39,0.08,0,0,0,0,1,1},
			{"HH_FX01", "11.gfx",0.38,0,0,0,-180,98,0.7,1},
		},
        [20381] = 
		{
			{"HH_FX01", "1.gfx",0.6,0.04,0,0,0,0,1,1},
			{"HH_FX01", "11.gfx",0.35,-0.08,0,0,-180,98,0.7,1},
		},
        [20382] = 
		{
			{"HH_FX01", "1.gfx",0.39,0.08,0,0,0,0,1,1},
			{"HH_FX01", "11.gfx",0.38,0,0,0,-180,98,0.7,1},
		},
        [20471] = 
		{
			{"HH_FX01", "1.gfx",0.6,0.04,0,0,0,0,1,1},
			{"HH_FX01", "11.gfx",0.35,-0.08,0,0,-180,98,0.7,1},
		},
        [20472] = 
		{
			{"HH_FX01", "1.gfx",0.39,0.08,0,0,0,0,1,1},
			{"HH_FX01", "11.gfx",0.38,0,0,0,-180,98,0.7,1},
		},
	[24365] = 
		{
			{"HH_FX01","1.gfx",0.22,0,0,0,0,0,1,1},
			{"HH_FX01","7.gfx",0,0,0,0,0,90,1,1},
			{"FM_1","7.gfx",0,0,0,0,0,0,1,1},
			{"FM_2","7.gfx",0,0,0,0,0,0,1,1},
		},
	[24392] = 
		{
			{"HH_FX01","1.gfx",0.22,0,0,0,0,0,1,1},
			{"HH_FX01","7.gfx",0,0,0,0,0,90,1,1},
			{"FM_1","7.gfx",0,0,0,0,0,0,1,1},
			{"FM_2","7.gfx",0,0,0,0,0,0,1,1},
		},
	[24393] = 
		{
                        {"HH_FX01","1.gfx",0.22,0,0,0,0,0,1,1},
			{"HH_FX01","7.gfx",0,0,0,0,0,90,1,1},
			{"FM_1","7.gfx",0,0,0,0,0,0,1,1},
			{"FM_2","7.gfx",0,0,0,0,0,0,1,1},
		},
		[21485] ={{"FM_1","2.gfx",0,0,0,0,0,0,1,1},{"FM_2","2.gfx",0,0,0,0,0,0,1,1},},
[20803] ={{"FM_1","2.gfx",0,0,0,0,0,0,1,1},{"FM_2","2.gfx",0,0,0,0,0,0,1,1},},
[27050] ={{"FM_1","2.gfx",0,0,0,0,0,0,1,1},{"FM_2","2.gfx",0,0,0,0,0,0,1,1},},
[27051] ={{"FM_1","2.gfx",0,0,0,0,0,0,1,1},{"FM_2","2.gfx",0,0,0,0,0,0,1,1},},
--["挂点", "gfx文件名",位移X,位移Y,位移Z,角度水平,俯仰,倾斜,缩放比例,透明度},
[27011] ={{"FM_1","7.gfx",0,0,0,0,0,0,1,1},{"FM_2","7.gfx",0,0,0,0,0,0,1,1},},
[27043] ={{"HH_FX01","7.gfx",0.38,-0.01,-0.01,-7.9,1.21,88.4,1,1},
{"HH_FX01","1.gfx",0.31,0.03,0,0,0,0,1,1},},
[27044] ={{"HH_FX01","7.gfx",0.37,-0.02,0,0,0,-93.6,1,1},
{"HH_FX01","1.gfx",0.33,0,0,0,0,0,0.7,1},},
[27114] ={{"HH_FX01","2.gfx",0,0,0,0,0,90,1,1},},
[27115] ={{"HH_FX01","2.gfx",0.58,0,0,-75,0,-90,1,1},},
[21483] ={{"HH_FX01","2.gfx",0,0,0,0,0,90,1,1},},
[21484] ={{"HH_FX01","2.gfx",0.58,0,0,-75,0,-90,1,1},},
[27116] ={{"HH_FX01","2.gfx",0.13,-0.01,0,0,0,85,1,1},},
[27117] ={{"HH_FX01","2.gfx",0.1,0.02,0,0,0,100,1,1},},
[20840] ={{"HH_FX01","2.gfx",0.13,-0.01,0,0,0,85,1,1},},
[20841] ={{"HH_FX01","2.gfx",0.1,0.02,0,0,0,100,1,1},},
	},
	

	[ATTACK_TYPE.WUXIAN] = 
	{
		["default"] = 
		{
			{"CC_weapon", "1.gfx",0,0,0,0,0,0,1.5,1},
			{"HH_fx01", "10.gfx",0,0,0,0,90,0,1,1},
			{"FM_06", "1.gfx",0,0,0,0,0,0,1,1},
			{"FM_07", "11.gfx",0,0,0,0,0,0,1,1},
		},
		[24391] = 
		{
			{"FM_06","1.gfx",0,0,0,0,0,0,1,1},
			{"FM_07","12.gfx",0,0,0,0,0,0,1,1},
		},
		[24389] = 
		{
			{"FM_06","1.gfx",0,0,0,0,0,0,1,1},
			{"FM_07","12.gfx",0,0,0,0,0,0,1,1},
		},
		[21486] ={{"FM_0","2.gfx",0,0,0,0,0,0,1,1},},
[23243] ={{"FM_0","2.gfx",0,0,0,0,0,0,1,1},},
[20839] ={{"FM_0","2.gfx",0,0,0,0,0,0,1,1},},
[23241] ={{"FM_0","2.gfx",0,0,0,0,0,0,1,1},},
[27099] ={{"FM_0","2.gfx",0,0,0,0,0,0,1,1},},
[27100] ={{"FM_0","2.gfx",0,0,0,0,0,0,1,1},},
[27103] ={{"FM_0","2.gfx",0,0,0,0,0,0,1,1},},
[27105] ={{"FM_0","2.gfx",0,0,0,0,0,0,1,1},},
[27036] ={{"FM_06","1.gfx",0,0,0,0,0,0,1,1},{"FM_07","12.gfx",0,0,0,0,0,0,1,1},},
[27038] ={{"FM_06","1.gfx",0,0,0,0,0,0,1,1},{"FM_07","12.gfx",0,0,0,0,0,0,1,1},},

	},
	[ATTACK_TYPE.XiAOYAO] = 
	{
		["default"] = 
		{
			{"FM_1", "1.gfx",0,0,0,0,0,0,1,1},
			{"FM_4", "4.gfx",0,0,0,0,0,0,0.8,1},
			{"FM_7", "7.gfx",0,0,0,0,0,0,0.8,1},
			{"FM_71", "7.gfx",0,0,0,0,0,0,0.8,1},
		}, 
		[24370] = 
		{
			{"FM_1","1.gfx",0,0,0,0,0,0,1,1},
			{"FM_10","4.gfx",0,0,0,0,0,0,1,1},
		},
		[24371] = 
		{
			{"FM_1","1.gfx",0,0,0,0,0,0,1,1},
			{"FM_4","4.gfx",0,0,0,0,0,0,1,1},
		},
		[24372] = 
		{
			{"FM_4","4.gfx",0,0,0,0,0,0,1,1},
			{"FM_7","14.gfx",0,0,0,0,0,0,1,1},
			{"FM_71","14.gfx",0,0,0,0,0,0,1,1},
		},
		[21464] ={{"FM_1","1.gfx",0,0,0,0,0,0,1,1},{"FM_10","4.gfx",0,0,0,0,0,0,1,1},},
[21465] ={{"FM_4","4.gfx",0,0,0,0,0,0,1,1},{"FM_7","7.gfx",0,0,0,0,0,0,1,1},{"FM_71","7.gfx",0,0,0,0,0,0,1,1},},
[21466] ={{"FM_1","1.gfx",0,0,0,0,0,0,1,1},{"FM_4","4.gfx",0,0,0,0,0,0,1,1},},
[20809] ={{"FM_1","1.gfx",0,0,0,0,0,0,1,1},{"FM_10","4.gfx",0,0,0,0,0,0,1,1},},
[20810] ={{"FM_4","4.gfx",0,0,0,0,0,0,1,1},{"FM_7","7.gfx",0,0,0,0,0,0,1,1},{"FM_71","7.gfx",0,0,0,0,0,0,1,1},},
[20811] ={{"FM_1","1.gfx",0,0,0,0,0,0,1,1},{"FM_4","4.gfx",0,0,0,0,0,0,1,1},},
[27060] ={{"FM_1","1.gfx",0,0,0,0,0,0,1,1},{"FM_10","10.gfx",0,0,0,0,0,0,1,1},},
[27061] ={{"FM_4","4.gfx",0,0,0,0,0,0,1,1},{"FM_7","7.gfx",0,0,0,0,0,0,1,1},{"FM_71","7.gfx",0,0,0,0,0,0,1,1},},
[27062] ={{"FM_1","1.gfx",0,0,0,0,0,0,1,1},{"FM_4","4.gfx",0,0,0,0,0,0,1,1},},
[27063] ={{"FM_1","1.gfx",0,0,0,0,0,0,1,1},{"FM_10","10.gfx",0,0,0,0,0,0,1,1},},
[27064] ={{"FM_4","4.gfx",0,0,0,0,0,0,1,1},{"FM_7","7.gfx",0,0,0,0,0,0,1,1},{"FM_71","7.gfx",0,0,0,0,0,0,1,1},},
[27065] ={{"FM_1","1.gfx",0,0,0,0,0,0,1,1},{"FM_4","4.gfx",0,0,0,0,0,0,1,1},},
[27016] ={{"FM_1","1.gfx",0,0,0,0,0,0,1,1},{"FM_10","4.gfx",0,0,0,0,0,0,1,1},},
[27017] ={{"FM_1","1.gfx",0,0,0,0,0,0,1,1},{"FM_10","4.gfx",0,0,0,0,0,0,1,1},},
[27018] ={{"FM_1","1.gfx",0,0,0,0,0,0,1,1},{"FM_4","4.gfx",0,0,0,0,0,0,1,1},},

	},
	[ATTACK_TYPE.TANGMEN] = 
	{
		["default"] = 
		{
			{"FM_1", "1.gfx",0,0,0,0,0,0,1,1},
			{"FM_5", "5.gfx",0,0,0,0,0,0,1,1},
		},
		[24373] = 
		{
			{"FM_1","1.gfx",0,0,0,0,0,0,1,1},
			{"FM_5","5.gfx",0,0,0,0,0,0,1,1},
		},
		[24374] = 
		{
			{"FM_1","1.gfx",0,0,0,0,0,0,1,1},
			{"FM_5","5.gfx",0,0,0,0,0,0,1,1},
		},
		[24375] = 
		{
			{"FM_1","1.gfx",0,0,0,0,0,0,1,1},
			{"FM_5","5.gfx",0,0,0,0,0,0,1,1},
		},
		[24376] = 
		{
			{"FM_1","1.gfx",0,0,0,0,0,0,1,1},
			{"FM_5","5.gfx",0,0,0,0,0,0,1,1},
		},
		[24377] = 
		{
			{"FM_1","1.gfx",0,0,0,0,0,0,1,1},
			{"FM_5","5.gfx",0,0,0,0,0,0,1,1},
		},
		[24378] = 
		{
			{"FM_1","1.gfx",0,0,0,0,0,0,1,1},
			{"FM_5","5.gfx",0,0,0,0,0,0,1,1},
		},
		[21467] ={{"FM_1","1.gfx",0,0,0,0,0,0,1,1},{"FM_5","5.gfx",0,0,0,0,0,0,1,1},},
[21468] ={{"FM_1","1.gfx",0,0,0,0,0,0,1,1},{"FM_5","5.gfx",0,0,0,0,0,0,1,1},},
[21469] ={{"FM_1","1.gfx",0,0,0,0,0,0,1,1},{"FM_5","5.gfx",0,0,0,0,0,0,1,1},},
[21470] ={{"FM_1","1.gfx",0,0,0,0,0,0,1,1},{"FM_5","5.gfx",0,0,0,0,0,0,1,1},},
[21471] ={{"FM_1","1.gfx",0,0,0,0,0,0,1,1},{"FM_5","5.gfx",0,0,0,0,0,0,1,1},},
[21472] ={{"FM_1","1.gfx",0,0,0,0,0,0,1,1},{"FM_5","5.gfx",0,0,0,0,0,0,1,1},},
[20819] ={{"FM_1","1.gfx",0,0,0,0,0,0,1,1},{"FM_5","5.gfx",0,0,0,0,0,0,1,1},},
[20820] ={{"FM_1","1.gfx",0,0,0,0,0,0,1,1},{"FM_5","5.gfx",0,0,0,0,0,0,1,1},},
[20821] ={{"FM_1","1.gfx",0,0,0,0,0,0,1,1},{"FM_5","5.gfx",0,0,0,0,0,0,1,1},},
[20822] ={{"FM_1","1.gfx",0,0,0,0,0,0,1,1},{"FM_5","5.gfx",0,0,0,0,0,0,1,1},},
[20823] ={{"FM_1","1.gfx",0,0,0,0,0,0,1,1},{"FM_5","5.gfx",0,0,0,0,0,0,1,1},},
[27067] ={{"FM_1","1.gfx",0,0,0,0,0,0,1,1},{"FM_5","5.gfx",0,0,0,0,0,0,1,1},},
[27068] ={{"FM_1","1.gfx",0,0,0,0,0,0,1,1},{"FM_5","5.gfx",0,0,0,0,0,0,1,1},},
[27069] ={{"FM_1","1.gfx",0,0,0,0,0,0,1,1},{"FM_5","5.gfx",0,0,0,0,0,0,1,1},},
[27070] ={{"FM_1","1.gfx",0,0,0,0,0,0,1,1},{"FM_5","5.gfx",0,0,0,0,0,0,1,1},},
[27071] ={{"FM_1","1.gfx",0,0,0,0,0,0,1,1},{"FM_5","5.gfx",0,0,0,0,0,0,1,1},},
[27074] ={{"FM_1","1.gfx",0,0,0,0,0,0,1,1},{"FM_5","5.gfx",0,0,0,0,0,0,1,1},},
[27075] ={{"FM_1","1.gfx",0,0,0,0,0,0,1,1},{"FM_5","5.gfx",0,0,0,0,0,0,1,1},},
[27076] ={{"FM_1","1.gfx",0,0,0,0,0,0,1,1},{"FM_5","5.gfx",0,0,0,0,0,0,1,1},},
[27072] ={{"FM_1","1.gfx",0,0,0,0,0,0,1,1},{"FM_5","5.gfx",0,0,0,0,0,0,1,1},},
[27077] ={{"FM_1","1.gfx",0,0,0,0,0,0,1,1},{"FM_5","5.gfx",0,0,0,0,0,0,1,1},},
[27020] ={{"FM_1","1.gfx",0,0,0,0,0,0,1,1},{"FM_5","5.gfx",0,0,0,0,0,0,1,1},},
[27021] ={{"FM_1","1.gfx",0,0,0,0,0,0,1,1},{"FM_5","5.gfx",0,0,0,0,0,0,1,1},},
[27022] ={{"FM_1","1.gfx",0,0,0,0,0,0,1,1},{"FM_5","5.gfx",0,0,0,0,0,0,1,1},},
[27023] ={{"FM_1","1.gfx",0,0,0,0,0,0,1,1},{"FM_5","5.gfx",0,0,0,0,0,0,1,1},},
[27024] ={{"FM_1","1.gfx",0,0,0,0,0,0,1,1},{"FM_5","5.gfx",0,0,0,0,0,0,1,1},},

	},
	[ATTACK_TYPE.EMEI] = 
	{
		["default"] = 
		{
			{"FM_1", "1.gfx",0,0,0,0,0,0,1,1},
			{"FM_10", "10.gfx",0,0,0,0,0,0,1,1},
			{"FM_11", "11.gfx",0,0,0,0,0,0,1,1},
		},
		[24379] = 
		{
			{"FM_1","1.gfx",0,0,0,0,0,0,1,1},
			{"FM_11","11.gfx",0,0,0,0,0,0,1,1},
		},
		[24467] = 
		{
			{"FM_1","1.gfx",0,0,0,0,0,0,1,1},
			{"FM_11","11.gfx",0,0,0,0,0,0,1,1},
		},
		[21473] ={{"FM_1","1.gfx",0,0,0,0,0,0,1,1},{"FM_11","11.gfx",0,0,0,0,0,0,1,1},},
[23225] ={{"FM_1","1.gfx",0,0,0,0,0,0,1,1},{"FM_11","11.gfx",0,0,0,0,0,0,1,1},},
[20824] ={{"FM_1","1.gfx",0,0,0,0,0,0,1,1},{"FM_11","11.gfx",0,0,0,0,0,0,1,1},},
[23224] ={{"FM_1","1.gfx",0,0,0,0,0,0,1,1},{"FM_11","11.gfx",0,0,0,0,0,0,1,1},},
[27078] ={{"FM_1","1.gfx",0,0,0,0,0,0,1,1},{"FM_11","11.gfx",0,0,0,0,0,0,1,1},},
[27079] ={{"FM_1","1.gfx",0,0,0,0,0,0,1,1},{"FM_11","11.gfx",0,0,0,0,0,0,1,1},},
[27080] ={{"FM_1","1.gfx",0,0,0,0,0,0,1,1},{"FM_11","11.gfx",0,0,0,0,0,0,1,1},},
[27081] ={{"FM_1","1.gfx",0,0,0,0,0,0,1,1},{"FM_11","11.gfx",0,0,0,0,0,0,1,1},},
[27025] ={{"FM_1","1.gfx",0,0,0,0,0,0,1,1},{"FM_11","11.gfx",0,0,0,0,0,0,1,1},},
[27026] ={{"FM_1","1.gfx",0,0,0,0,0,0,1,1},{"FM_11","11.gfx",0,0,0,0,0,0,1,1},},
		
	},
	
	[ATTACK_TYPE.METAL_SHARP] = 
	{
		["default"] = 
		{
			{"FM_1","1.gfx",0,0,0,0,0,0,1,1},
			{"FM_2","20.gfx",0,0,0,0,0,0,1,1},
		},
		[28109] = 
		{
			{"FM_1","1.gfx",0,0,0,0,0,0,1,1},
			{"FM_2","20.gfx",0,0,0,0,0,0,1,1},
		},
		[28110] = 
		{
			{"cc_weapon","1.gfx",0.96,0.09,0.27,0,0,0,1,1},
			{"cc_weapon","20.gfx",0,0,0,0,0,90,1,1},
		},
		[28123] = 
		{
			{"FM_1","1.gfx",0,0,0,0,0,0,1,1},
			{"FM_2","20.gfx",0,0,0,0,0,0,1,1},
		},
		[28149] = 
		{
			{"FM_1","1.gfx",0,0,0,0,0,0,1,1},
			{"FM_2","20.gfx",0,0,0,0,0,0,1,1},
		},
		[28101] = 
		{
			{"FM_1","1.gfx",0,0,0,0,0,0,1,1},
			{"FM_2","11.gfx",0,0,0,0,0,0,1,1},
		},
		[28103] = 
		{
			{"FM_1","1.gfx",0,0,0,0,0,0,1,1},
			{"FM_2","11.gfx",0,0,0,0,0,0,1,1},
		},
		[28097] = 
		{
			{"FM_1","1.gfx",0,0,0,0,0,0,1,1},
			{"FM_2","11.gfx",0,0,0,0,0,0,1,1},
		},
		[28105] = 
		{
			{"FM_1","1.gfx",0,0,0,0,0,0,1,1},
			{"FM_2","11.gfx",0,0,0,0,0,0,1,1},
		},
		[28107] = 
		{
			{"FM_1","1.gfx",0,0,0,0,0,0,1,1},
			{"FM_2","11.gfx",0,0,0,0,0,0,1,1},
		},
		[28145] = 
		{
			{"FM_1","1.gfx",0,0,0,0,0,0,1,1},
			{"FM_2","11.gfx",0,0,0,0,0,0,1,1},
		},
		[28146] = 
		{
			{"FM_1","1.gfx",0,0,0,0,0,0,1,1},
			{"FM_2","11.gfx",0,0,0,0,0,0,1,1},
		},
		[28100] = 
		{
			{"FM_1","1.gfx",0,0,0,0,0,0,1,1},
			{"FM_2","11.gfx",0,0,0,0,0,0,1,1},
		},
		[28147] = 
		{
			{"FM_1","1.gfx",0,0,0,0,0,0,1,1},
			{"FM_2","11.gfx",0,0,0,0,0,0,1,1},
		},
		[28148] = 
		{
			{"FM_1","1.gfx",0,0,0,0,0,0,1,1},
			{"FM_2","11.gfx",0,0,0,0,0,0,1,1},
		},
		[28102] = 
		{
			{"cc_weapon","1.gfx",0.96,0.09,0.27,0,0,0,1,1},
			{"cc_weapon","11.gfx",0,0,0,0,0,90,1,1},
		},
		[28119] = 
		{
			{"FM_1","1.gfx",0,0,0,0,0,0,1,1},
			{"FM_2","11.gfx",0,0,0,0,0,0,1,1},
		},
		[28104] = 
		{
			{"FM_1","1.gfx",0,0,0,0,0,0,1,1},
			{"FM_2","11.gfx",0,0,0,0,0,0,1,1},
		},
		[28120] = 
		{
			{"FM_1","1.gfx",0,0,0,0,0,0,1,1},
			{"FM_2","11.gfx",0,0,0,0,0,0,1,1},
		},
		[28098] = 
		{
			{"FM_1","1.gfx",0,0,0,0,0,0,1,1},
			{"FM_2","11.gfx",0,0,0,0,0,0,1,1},
		},
		[28099] = 
		{
			{"FM_1","1.gfx",0,0,0,0,0,0,1,1},
			{"FM_2","11.gfx",0,0,0,0,0,0,1,1},
		},
		[28106] = 
		{
			{"FM_1","1.gfx",0,0,0,0,0,0,1,1},
			{"FM_2","11.gfx",0,0,0,0,0,0,1,1},
		},
		[28121] = 
		{
			{"FM_1","1.gfx",0,0,0,0,0,0,1,1},
			{"FM_2","11.gfx",0,0,0,0,0,0,1,1},
		},
		[28108] = 
		{
			{"FM_1","1.gfx",0,0,0,0,0,0,1,1},
			{"FM_2","11.gfx",0,0,0,0,0,0,1,1},
		},
		[28122] = 
		{
			{"FM_1","1.gfx",0,0,0,0,0,0,1,1},
			{"FM_2","11.gfx",0,0,0,0,0,0,1,1},
		},
		[28125] = 
		{
			{"FM_1","1.gfx",0,0,0,0,0,0,1,1},
			{"FM_2","20.gfx",0,0,0,0,0,0,1,1},
		},
		[28151] = 
		{
			{"FM_1","1.gfx",0,0,0,0,0,0,1,1},
			{"FM_2","20.gfx",0,0,0,0,0,0,1,1},
		},
		[28111] = 
		{
			{"cc_weapon","1.gfx",0.61,0.41,-0.1,0,0,0,1,1},
			{"cc_weapon","11.gfx",-0.5,0,0,0,0,90,1,1},
		},
		[28150] = 
		{
			{"FM_1","1.gfx",0,0,0,0,0,0,1,1},
			{"FM_2","11.gfx",0,0,0,0,0,0,1,1},
		},
		[28112] = 
		{
			{"cc_weapon","1.gfx",0.96,0.09,0.27,0,0,0,1,1},
			{"cc_weapon","11.gfx",0,0,0,0,0,90,1,1},
		},
		[28124] = 
		{
			{"FM_1","1.gfx",0,0,0,0,0,0,1,1},
			{"FM_2","11.gfx",0,0,0,0,0,0,1,1},
		},
		[28113] = 
		{
			{"cc_weapon","1.gfx",0.61,0.41,-0.1,0,0,0,1,1},
			{"cc_weapon","11.gfx",-0.5,0,0,0,0,90,1,1},
		},
		[28152] = 
		{
			{"FM_1","1.gfx",0,0,0,0,0,0,1,1},
			{"FM_2","11.gfx",0,0,0,0,0,0,1,1},
		},
		[28114] = 
		{
			{"cc_weapon","1.gfx",0.96,0.09,0.27,0,0,0,1,1},
			{"cc_weapon","11.gfx",0,0,0,0,0,90,1,1},
		},
		[28126] = 
		{
			{"FM_1","1.gfx",0,0,0,0,0,0,1,1},
			{"FM_2","11.gfx",0,0,0,0,0,0,1,1},
		},
		[30803] = 
		{
			{"FM_1","1.gfx",0,0,0,0,0,0,1,1},
			{"FM_2","11.gfx",0,0,0,0,0,0,1,1},
		},
		[30804] = 
		{
			{"FM_1","1.gfx",0,0,0,0,0,0,1,1},
			{"FM_2","11.gfx",0,0,0,0,0,0,1,1},
		},
		[30805] = 
		{
			{"FM_1","1.gfx",0,0,0,0,0,0,1,1},
			{"FM_2","11.gfx",0,0,0,0,0,0,1,1},
		},
		[30806] = 
		{
			{"FM_1","1.gfx",0,0,0,0,0,0,1,1},
			{"FM_2","11.gfx",0,0,0,0,0,0,1,1},
		},
		[30801] = 
		{
			{"FM_1","1.gfx",0,0,0,0,0,0,1,1},
			{"FM_2","11.gfx",0,0,0,0,0,0,1,1},
		},
		[30802] = 
		{
			{"FM_1","1.gfx",0,0,0,0,0,0,1,1},
			{"FM_2","11.gfx",0,0,0,0,0,0,1,1},
		},
		[30807] = 
		{
			{"FM_1","1.gfx",0,0,0,0,0,0,1,1},
			{"FM_2","11.gfx",0,0,0,0,0,0,1,1},
		},
		[30808] = 
		{
			{"FM_1","1.gfx",0,0,0,0,0,0,1,1},
			{"FM_2","11.gfx",0,0,0,0,0,0,1,1},
		},

	},
	[11] = 
	{
		["default"] = 
		{
			{"HH_fx01","1.gfx",-0.19,-0.02,0,0,0,0,1,1},
			{"HH_fx01","13.gfx",-0.25,-0.01,0.01,0,0,90,1,1},
			{"FM_2","14.gfx",-0.25,-0.01,0.01,0,0,90,1,1},
		},
		[24595] = 
		{
			{"CC_weapon","1.gfx",0,0,0,0,0,0,1,1},
			{"CC_weapon","16.gfx",0,0,0,0,0,90,1,1},
		},
		[24596] = 
		{
			{"FM_1","1.gfx",0,0,0,0,0,0,1,1},
			{"FM_2","17.gfx",0,0,0,0,0,0,1,1},
		},
		[24902] = 
		{
			{"CC_weapon","1.gfx",-0.19,-0.03,0,0,0,1,1,1},
			{"CC_weapon","16.gfx",-0.24,-0.02,0,0,0,95,1,1},
		},
		[24903] = 
		{
			{"FM_1","1.gfx",0.15,0.02,0.06,0,0,1,1,1},
			{"FM_2","17.gfx",0,0,0,0,0,1,1,1},
		},
		[24705] = 
		{
			{"HH_fx01","1.gfx",0.14,0.11,0.05,0,0,0,1,1},
			{"HH_fx04","1.gfx",0.13,-0.14,0.06,0,0,0,1,1},
			{"HH_fx05","18.gfx",-0.16,0.01,0,0,0,90,1,1},
			{"HH_fx02","18.gfx",0,0,0,0,0,90,1,1},
		},
		[24706] = 
		{
			{"HH_fx01","1.gfx",0.14,0.11,0.05,0,0,0,1,1},
			{"HH_fx04","1.gfx",0.13,-0.14,0.06,0,0,0,1,1},
			{"HH_fx05","18.gfx",-0.16,0.01,0,0,0,90,1,1},
			{"HH_fx02","18.gfx",0,0,0,0,0,90,1,1},
		},
		[24707] = 
		{
			{"HH_fx01","",0,0,0,0,0,0,0,0},
		},
		[24709] = 
		{
			{"HH_fx01","",0,0,0,0,0,0,0,0},
		},
		[24597] ={{"FM_1","1.gfx",0,0,0,0,0,0,1,1},{"FM_2","13.gfx",0,0,0,0,0,0,1,1},},
[24904] ={{"FM_1","1.gfx",0,0,0,0,0,0,1,1},{"FM_2","13.gfx",0,0,0,0,0,0,1,1},},
[24599] ={{"FM_1","1.gfx",0,0,0,0,0,0,1,1},{"FM_2","13.gfx",0,0,0,0,0,0,1,1},},
[24906] ={{"FM_1","1.gfx",0,0,0,0,0,0,1,1},{"FM_2","13.gfx",0,0,0,0,0,0,1,1},},
[27106] ={{"FM_1","1.gfx",0,0,0,0,0,0,1,1},{"FM_2","13.gfx",0,0,0,0,0,0,1,1},},
[27108] ={{"FM_1","1.gfx",0,0,0,0,0,0,1,1},{"FM_2","13.gfx",0,0,0,0,0,0,1,1},},
[27110] ={{"FM_1","1.gfx",0,0,0,0,0,0,1,1},{"FM_2","13.gfx",0,0,0,0,0,0,1,1},},
[27112] ={{"FM_1","1.gfx",0,0,0,0,0,0,1,1},{"FM_2","13.gfx",0,0,0,0,0,0,1,1},},
[27039] ={{"FM_1","1.gfx",0,0,0,0,0,0,1,1},{"FM_2","16.gfx",0,0,0,0,0,0,1,1},},
[27041] ={{"FM_1","1.gfx",0,0,0,0,0,0,1,1},{"FM_2","16.gfx",0,0,0,0,0,0,1,1},},

	},
	
	[ATTACK_TYPE.DONGHUA] =   
	{
		["default"] = 
		{
			{"FM_1", "1.gfx",0,0,0,0,0,0,1,1},
			{"FM_2", "2.gfx",0,0,0,0,0,0,1,1},
			{"FM_3", "3.gfx",0,0,0,0,0,0,1,1},
		},
		--琉璃1
		[31500] = 
		{
			{"FM_1", "1.gfx",0,0,0,0,0,0,1,1},
			{"FM_2", "21.gfx",0,0,0,0,0,0,1,1},
			{"FM_3", "13.gfx",0,0,0,0,0,0,1,1},
		},
		[31503] = 
		{
			{"FM_2", "21.gfx",0,0,0,0,0,0,1,1},
		},
		[31504] = 
		{
			{"FM_2", "21.gfx",0,0,0,0,0,0,1,1},
		},
		[31511] = 
		{
			{"FM_2", "21.gfx",0,0,0,0,0,0,1,1},
		},
		
		[31512] = 
		{
			{"FM_1", "1.gfx",0,0,0,0,0,0,1,1},
			{"FM_2", "21.gfx",0,0,0,0,0,0,1,1},
			{"FM_3", "13.gfx",0,0,0,0,0,0,1,1},
		},
		[31501] = 
		{
			{"FM_2", "21.gfx",0,0,0,0,0,0,1,1},
		},
		[31505] = 
		{
			{"FM_2", "21.gfx",0,0,0,0,0,0,1,1},
		},
		[31508] = 
		{
			{"FM_2", "21.gfx",0,0,0,0,0,0,1,1},
		},
		
		[31506] = 
		{
			{"FM_1", "1.gfx",0,0,0,0,0,0,1,1},
			{"FM_2", "21.gfx",0,0,0,0,0,0,1,1},
			{"FM_3", "13.gfx",0,0,0,0,0,0,1,1},
		},
		[31510] = 
		{
			{"FM_2", "21.gfx",0,0,0,0,0,0,1,1},
		},
		[31513] = 
		{
			{"FM_2", "21.gfx",0,0,0,0,0,0,1,1},
		},
		[31514] = 
		{
			{"FM_2", "21.gfx",0,0,0,0,0,0,1,1},
		},
		--琉璃2
		[31541] = 
		{
			{"FM_1", "1.gfx",0,0,0,0,0,0,1,1},
			{"FM_2", "21.gfx",0,0,0,0,0,0,1,1},
			{"FM_3", "13.gfx",0,0,0,0,0,0,1,1},
		},
		[31544] = 
		{
			{"FM_2", "21.gfx",0,0,0,0,0,0,1,1},
		},
		[31545] = 
		{
			{"FM_2", "21.gfx",0,0,0,0,0,0,1,1},
		},
		[31552] = 
		{
			{"FM_2", "21.gfx",0,0,0,0,0,0,1,1},
		},
		
		[31543] = 
		{
			{"FM_1", "1.gfx",0,0,0,0,0,0,1,1},
			{"FM_2", "21.gfx",0,0,0,0,0,0,1,1},
			{"FM_3", "13.gfx",0,0,0,0,0,0,1,1},
		},
		[31546] = 
		{
			{"FM_2", "21.gfx",0,0,0,0,0,0,1,1},
		},
		[31553] = 
		{
			{"FM_2", "21.gfx",0,0,0,0,0,0,1,1},
		},
		[31549] = 
		{
			{"FM_2", "21.gfx",0,0,0,0,0,0,1,1},
		},
		
		[31550] = 
		{
			{"FM_1", "1.gfx",0,0,0,0,0,0,1,1},
			{"FM_2", "21.gfx",0,0,0,0,0,0,1,1},
			{"FM_3", "13.gfx",0,0,0,0,0,0,1,1},
		},
		[31548] = 
		{
			{"FM_2", "21.gfx",0,0,0,0,0,0,1,1},
		},
		[31554] = 
		{
			{"FM_2", "21.gfx",0,0,0,0,0,0,1,1},
		},
		[31556] = 
		{
			{"FM_2", "21.gfx",0,0,0,0,0,0,1,1},
		},
		--白银2
		[31551] = 
		{
			{"FM_1", "1.gfx",0,0,0,0,0,0,1,1},
			{"FM_2", "2.gfx",0,0,0,0,0,0,1,1},
			{"FM_3", "3.gfx",0,0,0,0,0,0,1,1},
		},
		[31558] = 
		{
			{"FM_2", "2.gfx",0,0,0,0,0,0,1,1},
		},
		[31559] = 
		{
			{"FM_2", "2.gfx",0,0,0,0,0,0,1,1},
		},
		[31561] = 
		{
			{"FM_2", "2.gfx",0,0,0,0,0,0,1,1},
		},
		
		[31564] = 
		{
			{"FM_1", "1.gfx",0,0,0,0,0,0,1,1},
			{"FM_2", "2.gfx",0,0,0,0,0,0,1,1},
			{"FM_3", "3.gfx",0,0,0,0,0,0,1,1},
		},
		[31542] = 
		{
			{"FM_2", "2.gfx",0,0,0,0,0,0,1,1},
		},
		[31547] = 
		{
			{"FM_2", "2.gfx",0,0,0,0,0,0,1,1},
		},
		[31555] = 
		{
			{"FM_2", "2.gfx",0,0,0,0,0,0,1,1},
		},
		
		[31560] = 
		{
			{"FM_1", "1.gfx",0,0,0,0,0,0,1,1},
			{"FM_2", "2.gfx",0,0,0,0,0,0,1,1},
			{"FM_3", "3.gfx",0,0,0,0,0,0,1,1},
		},
		[31568] = 
		{
			{"FM_2", "2.gfx",0,0,0,0,0,0,1,1},
		},
		[31557] = 
		{
			{"FM_2", "2.gfx",0,0,0,0,0,0,1,1},
		},
		[31572] = 
		{
			{"FM_2", "2.gfx",0,0,0,0,0,0,1,1},
		},
		--黄金2
		[31566] = 
		{
			{"FM_1", "1.gfx",0,0,0,0,0,0,1,1},
			{"FM_2", "2.gfx",0,0,0,0,0,0,1,1},
			{"FM_3", "3.gfx",0,0,0,0,0,0,1,1},
		},
		[31573] = 
		{
			{"FM_2", "2.gfx",0,0,0,0,0,0,1,1},
		},
		[31575] = 
		{
			{"FM_2", "2.gfx",0,0,0,0,0,0,1,1},
		},
		[31576] = 
		{
			{"FM_2", "2.gfx",0,0,0,0,0,0,1,1},
		},
		
		[31567] = 
		{
			{"FM_1", "1.gfx",0,0,0,0,0,0,1,1},
			{"FM_2", "2.gfx",0,0,0,0,0,0,1,1},
			{"FM_3", "3.gfx",0,0,0,0,0,0,1,1},
		},
		[31563] = 
		{
			{"FM_2", "2.gfx",0,0,0,0,0,0,1,1},
		},
		[31570] = 
		{
			{"FM_2", "2.gfx",0,0,0,0,0,0,1,1},
		},
		[31574] = 
		{
			{"FM_2", "2.gfx",0,0,0,0,0,0,1,1},
		},
		
		[31562] = 
		{
			{"FM_1", "1.gfx",0,0,0,0,0,0,1,1},
			{"FM_2", "2.gfx",0,0,0,0,0,0,1,1},
			{"FM_3", "3.gfx",0,0,0,0,0,0,1,1},
		},
		[31565] = 
		{
			{"FM_2", "2.gfx",0,0,0,0,0,0,1,1},
		},
		[31569] = 
		{
			{"FM_2", "2.gfx",0,0,0,0,0,0,1,1},
		},
		[31571] = 
		{
			{"FM_2", "2.gfx",0,0,0,0,0,0,1,1},
		},
	},
	
}

--nWeaponAtkType: 武器的攻击类型
function EquipFumoInfo:GetHookCfg(nWeaponAtkType)

	local tabRet = EquipFumoInfo.HookCfg[nWeaponAtkType]
	return tabRet

end

EquipDecalInfo = {}
EquipDecalInfo[80044] = 
{ 
	big_w = 512, 
	big_h = 1024, 
	small_w = 200, 
	small_h = 200, 
	small_x = 160, 
	small_y = 400 ,
}

EquipDecalInfo[81081] = 
{ 
	big_w = 512, 
	big_h = 1024, 
	small_w = 200, 
	small_h = 200, 
	small_x = 160, 
	small_y = 400 ,
}

EquipDecalInfo[81340] = 
{ 
	big_w = 512, 
	big_h = 1024, 
	small_w = 200, 
	small_h = 200, 
	small_x = 130, 
	small_y = 300 ,
}

EquipDecalInfo[81341] = 
{ 
	big_w = 512, 
	big_h = 1024, 
	small_w = 200, 
	small_h = 200, 
	small_x = 130, 
	small_y = 300 ,
}

function EquipDecalInfo:getInfoById( equip_id )
	local tbl = EquipDecalInfo[equip_id]
	if tbl ~= nil then
		return tbl.big_w,tbl.big_h,tbl.small_w,tbl.small_h,tbl.small_x, tbl.small_y
	else
		return 0
	end
end