-- SoundEffect
SndEffect_Map={}
SndEffect_Map[21]=
{--1
	["铸剑谷x8_fx"]=
	{--2
		[3]={21.520000,1245.577393,1245.577393,21.520000},--echo
		[7]={0.518962,0.000000,-13.891200,2468.400146},--reverb
	},--end of region
}--end of scene
SndEffect_Map[25]=
{--1
	["南疆x33_fx"]=
	{--1
		[7]={0.001000,0.000000,0.000000,0.001000},--reverb
	},--end of region
}--end of scene
SndEffect_Map[1004]=
{--1
	["梅庄地牢x27_fx"]=
	{--1
		[7]={0.999000,0.000000,-4.224000,3000.000000},--reverb
	},--end of region
}--end of scene
SndEffect_Map[42]=
{--1
	["日月神教x42_fx"]=
	{--1
		[7]={0.001000,0.000000,-4.224000,3000.000000},--reverb
	},--end of region
}--end of scene
SndEffect_Map[1015]=
{--1
	["还阳轩d01_fx"]=
	{--1
		[7]={0.001000,0.000000,0.000000,0.001000},--reverb
	},--end of region
}--end of scene
SndEffect_Map[62]=
{--1
	["铸剑谷x8_fx"]=
	{--1
		[3]={21.520000,1245.577393,1245.577393,21.520000},--echo
	},--end of region
}--end of scene
SndEffect_Map[1030]=
{--1
	["荒火圣殿d06_fx"]=
	{--1
		[7]={0.001000,0.000000,-4.224000,1000.000000},--reverb
	},--end of region
}--end of scene
SndEffect_Map[1037]=
{--1
	["联手副本d09_fx"]=
	{--1
		[7]={0.000000,0.000000,-15.000000,3000.000000},--reverb
	},--end of region
}--end of scene
SndEffect_Map[2003]=
{--1
	["万兽谷x200_fx"]=
	{--1
		[7]={0.001000,0.000000,0.000000,0.001000},--reverb
	},--end of region
}--end of scene
SndEffect_Map[9005]=
{--1
	["室内酒店x240_fx"]=
	{--1
		[7]={0.001000,0.000000,-9.657600,474.600861},--reverb
	},--end of region
}--end of scene
SndEffect_Map[9012]=
{--1
	["室内地穴x241_fx"]=
	{--1
		[7]={0.001000,0.000000,-6.224000,3000.000000},--reverb
	},--end of region
}--end of scene


function SndEffect_Map:GetSoundEffectInfo( mapid, zonename )
	local tbl = {}
	if SndEffect_Map[mapid] ~= nil and SndEffect_Map[mapid][zonename] ~= nil then
		tbl = SndEffect_Map[mapid][zonename]
	end
	return tbl
end
