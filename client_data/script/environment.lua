---------------------------------------------------------------
--  created:   2009.07.22
--  author:    daijunhua
--  说明:      如果有任何参数不明白的,请联系我
--  描述:      自然环境效果控制
---------------------------------------------------------------
--使用到得函数说明:
--GetServerTime 返回当前游戏时间表,使用字符串索引(year,month,day,hour,minute,second)

Environment = {GameTime = 0,SceneID = -1,PrecinctID = -1,EnvID = -1,WeatherID = 0}

EnvFuncList = {}

--雨参数控制
Environment.Rain = 
{
	Valid         = false,
	Tag			  = 1,
	Visible		  = true,
	RainSpeed     = 0.2,
	RainSize      = 0.008,
	RainLife	  = 100,
	RainColor     = 0xFFEBEBEB,
	RainSFX		  = 0
}

--雪参数控制
Environment.Snow = 
{
	Valid         = false,
	Tag			  = 2,
	Visible		  = true,
	SnowSpeed     = 0.5,
	SnowSize      = 0.3,
	SnowLife	  = 100,
	SnowColor     = 0xA0A0A0A0,
	SnowSFX		  = 0
}

--太阳参数控制
Environment.Sun   =
{
	Valid         = false,
	Tag			  = 4,
	Visible		  = true,
	SunPower      = 10,
	SunPower_N	  = 2,
}

--月亮参数控制
Environment.Moon   =
{
	Valid         = false,
	Tag			  = 8,
	Visible		  = true,
}

--云参数控制
Environment.Cloud = 
{
	Valid         = false,
	Tag			  = 16,
	CloudAmb      = 0xFFFFFFFF,
	CloudAmb_N	  = 0xFFFFFFFF,
	CloudDirCol   = 0xFFFFFFFF,
	CloudDirCol_N = 0xFFFFFFFF
}

--天空参数控制
Environment.Sky = 
{
	Valid         = false,
	Tag			  = 32,
	SkySpeedU     = 0.02,
	SkySpeedV	  = 0.02
}

--环境光照参数控制
Environment.Light = 
{
	Valid         = false,
	Tag			  = 64,
	Ambient       = 0xFFFFFFFF,
	DirLtColor	  = 0xFFFFFFFF,
	Ambient_N	  = 0xFFFFFFFF,
	DirLtColor_N  = 0xFFFFFFFF
}


--雾参数控制
Environment.Fog = 
{
--是否应用的标记
	Valid            = false,
	Tag			     = 128,
--白天水上雾属性
	FogStart         = 30,
	FogStart_Far     = -1,
	FogDensity       = 0.5,
	FogColor         = 0xFFFF0000,
	FogHeightScale   = 0.2,
	FogHeightStart   = 0,

--晚上水上雾属性
	FogStart_N       = 30,
	FogStart_N_Far   = -1,
	FogDensity_N     = 0.5,
	FogColor_N       = 0xFFFF0000,
	FogHeightScale_N = 0.2,
	FogHeightStart_N = 0,
}

--闪电参数控制
Environment.Lightning = 
{
	Valid         = false,
	Tag			  = 256,
	Visible		  = true,
	Power		  = 0.28,
	Start		  = 2.0,
	End			  = 0.0,
	Time		  = 200,
	Num			  = 3,
	TimeInterval  = 200,
	BetweenTime   = 5000,
	BetweenRand   = 2000,
	LightningSFX  = 0
}

--单色控制
Environment.MonoCtrl = 
{
	Valid		  = false,
	Tag			  = 512,
	Start         = 0,
	End           = 1.0,
	Time          = 1000,
	Color         = 0xFFFFFFFF
}

--地图控制
Environment.MapCtrl = 
{
	Valid		  = false,
	Tag			  = 1024,
	DirLightColor    = 0,
	DirLightPower    = 0.000000,
	AmbLightColor1   = 0x00000000,
	AmbLightColor2   = 0x00000000,
	AmbLightPower    = 0.000000,
}


--天空贴图控制
Environment.SkyFileCtrl = 
{
	Valid		  = false,
	Tag			  = 2048,
	SkyFile1  = "",
	SkyFile2  = "",
	SkyFile3  = "",
	SkyFile4  = "",
	SkyFile5  = "",
	SkyFile6  = "",
	SkyFile7  = "",
	SkyFile8  = "",
	SkyFile9  = "",
	SkyFile10 = "",
	SkyFile11 = "",
	SkyFile12 = "",
}

Environment.SkyExFileCtrl = 
{
	Valid		  = false,
	Tag			  = 4096,
	
	SkyExFile  = "",
}

--场景控制
Environment.SceneCtrl = 
{
	EnvStyle = "",
	ColorMap = "",
}

Environment.SunMoonFile =
{
	Valid = false,
	szSunFile  = "",
	szSunFlareFile  = "",
	szMoonFile  = "",
	szMoonFlareFile  = "",
	Tag = 8192,
}

MapWeather = 
{
[0]  = {29,101,102,103,104,105,106},
[54]  = {51,5101,5102,5103,5104,5105,5106},
[2]  = {31,101,102,103,104,104,31},
[65]  = {13,101,102,103,32,104,32},
[55]  = {4,101,102,103,104,105,106},
[24]  = {18,101,102,103,18,105,18},
[27]  = {78,101,102,103,57,57,57},
[8]  = {44,101,102,103,44,44,44},
[40]  = {80,101,102,103,104,105,106},
[10]  = {38,101,102,103,38,38,38},
[15]  = {21,101,21,103,21,21,21},
[6]  = {27,27,27,27,27,27,106,27,27,904},
[5]  = {25,25,25,25,25,25,25,25,25,904},
[18]  = {29,29,29,29,29,29,29,29,29,904},
[36]  = {28,28,28,28,28,28,28},
[31]  = {46,46,46,46,46,46,46,46,46,904},
[33]  = {36,36,36,36,36,36,36},
[26]  = {40,40,40,40,40,40,40,902,903,904},
[42]  = {30,30,30,30,30,30,30,30,30,904},
[3]  = {17,101,102,103,17,17,106},
[7]  = {5,50101,50102,50103,50104,50105,50106},
[11]  = {3,3101,3102,3103,3014,3105,3106},
[37]  = {1,101,102,103,1,1,31},
[38]  = {6,101,102,103,104,105,106},
[39]  = {7,101,7,103,7,105,106},
[13]  = {26,26,102,103,26,105,26},
[14]  = {43,101,43,43,43,43,106},
[16]  = {19,101,102,103,104,105,106},
[17]  = {9,9101,9102,9103,9104,9105,9106},
[19]  = {23,101,102,103,104,105,106},
[20]  = {34,34101,34102,34103,34104,34105,34106},
[21]  = {8,101,102,103,104,105,106},
[22]  = {22,101,102,103,104,105,106},
[23]  = {56,56,102,56,56,105,56},
[50]  = {29,101,102,103,104,105,106},
[43]  = {41,41101,41102,41103,41104,41105,41106},
[25]  = {37,101,102,103,104,105,106},
[32]  = {24,24,102,109,24,105,24},
[30]  = {45,45,45,45,45,45,45},
[29]  = {58,101,102,103,104,105,106},
[28]  = {3,101,102,103,104,105,106},
[9]  = {39,101,102,103,104,105,106},
[56]  = {74,101,102,103,104,105,106},
[40002]  = {73,101,102,103,104,105,106},
[35]  = {28,101,102,103,104,105,106},
[41]  = {42,101,102,103,104,105,106},
[45]  = {29,101,102,103,104,105,106},
[46]  = {29,101,102,103,104,105,106},
[34]  = {44,101,44,103,44,44,106},
[44]  = {72,107,102,103,104,105,104},
[49]  = {71,107,102,103,104,11,71},
[48]  = {42,107,102,103,104,47,106},
[53]  = {29,101,102,103,104,105,106},
[47]  = {42,107,42,42,42,42,42},
[1001]  = {2,48,48,48,48,48,48},
[1002]  = {10,10,10,10,10,10,10},
[1003]  = {35,101,35,35,35,35,35},
[1004]  = {35,35,35,35,35,35,35},
[1005]  = {2,101,102,103,104,105,106},
[1006]  = {53,101,102,103,104,105,106},
[1007]  = {49,49,49,49,49,49,49},
[1008]  = {54,104,104,104,104,47,47},
[1009]  = {12,101,102,103,104,105,12},
[1010]  = {55,101,102,103,104,105,106},
[1011]  = {77,101,102,103,104,105,106},
[2003]  = {33,101,101,103,104,105,106},
[2004]  = {29,101,101,103,104,105,106},
[57]  = {4,101,102,103,104,105,106},
[58]  = {4,101,102,103,104,105,106},
[59]  = {48,48,48,48,48,48,48},
[9004]  = {9004,9004,9004,9004,9004,9004,9004,902,903,904},
[64]  = {105,105,105,105,105,105,105},
[63]  = {42,107,107,108,108,108,42},
[62]  = {52,101,102,103,104,105,106},
[4]  = {32,32,32,32,32,32,32,32,32,904},
[1030]  = {59,59,59,59,59,59,59},
[1302]  = {61,61,61,61,61,61,61},
[1301]  = {62,62,62,62,62,62,62},
[1303]  = {63,63,63,63,63,63,63},
[1306]  = {64,64,64,64,64,64,64},
[1308]  = {65,65,65,65,65,65,65},
[1309]  = {66,66,66,66,66,66,66},
[1307]  = {67,67,67,67,67,67,67},
[1304]  = {68,68,68,68,68,68,68},
[1305]  = {69,69,69,69,69,69,69},
[2001]  = {70,70,70,70,70,70,70},
[1036]  = {35,35,35,35,35,35,35},
[9001]  = {110,110,110,110,110,110,110},
[61]  = {32,32,32,32,32,32,32},
[1033]  = {31,31,31,31,31,31,31},
[1015]  = {48,48,48,48,48,48,48},
[66]  = {21,21,21,21,21,21,21,21,21,904},
[67]  = {13,13,13,13,13,13,13,13,13,904},
[1204]  = {48,48,48,48,48,48,48},
[70]  = {48,48,48,48,48,48,48},
[9006]  = {9006,9006,9006,9006,9006,9006,9006},
[1048]  = {1048,1048,1048,1048,1048,1048,1048},
[68]  = {31,31,31,31,31,31,31,31,31,904},
[1500]  = {2201,2201,2201,2201,2201,2201,2201},
[1508]  = {2901,2901,2901,2901,2901,2901,2901},
[71]  = {3,3,3,3,3,3,3,3,3,904},
[69]  = {75,75,75,106,106,106,106,106,106,904},
[1051]  = {248,248,248,248,248,248,248},
[1023]  = {1023,1023,1023,1023,1023,1023,1023},
[77]  = {26,26,26,26,26,26,26,26,26,904},
[76]  = {39,101,102,103,104,105,106,105,106,904},
[79]  = {924,101,102,103,104,105,106,105,106,904},
[78]  = {7,7,7,7,7,105,7,902,903,904},
[1026]  = {1026,1026,1026,1026,1026,1026,1026},
[1028]  = {1028,1028,1028,1028,1028,1028,1028},
[75]  = {4,4,4,4,4,4,4,902,903,904},
[1512]  = {58,101,102,103,104,105,106},
[1514]  = {1514,1514,1514,1514,1514,1514,1514},
[72]  = {7200,7200,7200,7200,7200,7200,7200,7200,7200,904},
[82]  = {7200,101,102,103,104,105,106,105,106,904},
[81]  = {7200,7200,7200,7200,7200,7200,7200,7200,7200,904},
[80]  = {19,19,19,19,19,105,19,19,19,904},
[83]  = {23,23,23,23,23,105,23,902,903,904},
[1017]  = {1017,1017,1017,1017,1017,1017,1017},
[1515]  = {1515,1515,1515,1515,1515,1515,1515},
[1041]  = {1041,1041,1041,1041,1041,1041,1041},
[1516]  = {1516,1516,1516,1516,1516,1516,1516},
[86]  = {37,37,37,37,104,105,37,902,903,904},
[85]  = {22,22,22,22,104,105,106,902,903,904},
[84]  = {8,8,8,8,8,105,8,902,903,904},
[2020]  = {2020,2020,102,103,104,105,2020},
[2021]  = {2020,2020,2021,2021,2021,2021,2020},
[1255]  = {1255,1255,1255,1255,1255,1255,1255,1255,1255,902},
[1254]  = {1254,1254,1254,1254,1254,1254,1254},
[91]  = {45,45,45,45,104,105,45,902,903,904},
[1256]  = {7200,7200,7200,7200,7200,7200,7200},
[1257]  = {7200,7200,7200,7200,7200,7200,7200},
[1258]  = {7200,7200,7200,7200,7200,7200,7200},
[1259]  = {7200,7200,7200,7200,7200,7200,7200},
[1260]  = {7200,7200,7200,7200,7200,7200,7200},
[1518]  = {1518,1518,1518,1518,1518,1518,1518},
[1513]  = {31,31,31,31,31,31,31},
[1274]  = {248,248,248,248,248,248,248},
[2997]  = {248,248,248,248,248,248,248},
[74]  = {38,38,38,38,38,38,38,38,38,904},
[1522]  = {1522,1522,1522,1522,1522,1522,1522},
[7801]  = {7801,7801,7801,7801,7801,7801,7801,7801,7801,904},
[7701]  = {7701,7701,7701,7701,7701,7701,7701},
[2003]  = {2003,2003,2003,2003,2003,2003,2003},
[1275]  = {1275,1275,1275,1275,1275,1275,1275},
[80]  = {44,44,44,103,44,44,44,902,903,904},
[90]  = {44,44,44,103,44,44,44,902,903,904},
[92]  = {48,48,48,48,48,48,48},
[93]  = {44,44,44,103,44,44,44,902,903,904},
[94]  = {44,44,44,103,44,44,44,902,903,904},
[73]  = {44,44,44,103,44,44,44,902,903,904},
[1521]  = {1521,1521,1521,1521,1521,1521,1521},
[2016]  = {2016,2016,2016,2016,2016,2016,2016},
[2017]  = {2016,2016,2016,2016,2016,2016,2016},
[1310]  = {1310,1310,1310,1310,1310,1310,1310},
[1230]  = {1310,1310,1310,1310,1310,1310,1310},
[1239]  = {1310,1310,1310,1310,1310,1310,1310},
[1525]  = {1525,1525,1525,1525,1525,1525,1525},
[1524]  = {1524,1524,1524,1524,1524,1524,1524},
[2018]  = {2018,2018,2018,2018,2018,2018,2018},
[2019]  = {2019,2019,2019,2019,2019,2019,2019},
[1209]  = {48,48,48,48,48,48,48},
[1401]  = {1401,1401,1401,1401,1411,1401,1411},
[1411]  = {1411,1411,1411,1411,1411,1411,1411},
[2022]  = {2022,2022,2022,103,104,2022,2022},
[2023]  = {2023,2023,2023,103,104,2023,2023},
[100]  = {1000,1000,1000,103,1000,1000,1000,902,903,904},
[1410]  = {1410,1410,1410,1410,1410,1410,1410},
[1412]  = {1412,1412,1412,1412,104,105,1412},
[1055]  = {1055,1055,1055,1055,104,105,1055},
[2024]  = {2024,2024,2024,2024,2024,2024,2024},
[2025]  = {2025,2025,2025,2025,2025,2025,2025},
[101]  = {44,44,44,103,44,44,44,902,903,904},
[102]  = {44,44,44,103,44,44,44,902,903,904},
[105]  = {81,81,81,103,81,105,81,902,903,904},
[106]  = {10006,10006,10006,103,104,105,10006},
[2026]  = {10006,10006,10006,103,104,105,10006},
[2027]  = {10006,10006,10006,103,104,105,10006},
[1531]  = {1531,101,1531,103,1531,105,106},
[1529]  = {1529,1529,1529,1529,1529,1529,1529},
[1056]  = {1056,1056,1056,103,104,1056,1056},
[1050]  = {1056,1056,1056,103,104,1056,1056},
[1535]  = {1531,101,1531,103,1531,105,106},
[108]  = {10008,10008,10008,103,104,105,106,902,903,904},
[109]  = {73,73,73,103,104,105,106,902,903,904},
[110]  = {72,72,72,103,104,105,106,902,903,904},
[113]  = {1113,1113,1113,1113,1113,1113,1113,1113,1113,904},
[1540]  = {73,73,73,103,104,105,106},
[1538]  = {72,72,72,103,104,105,106},
[1539]  = {72,72,72,103,104,105,106},
[1530]  = {1530,1530,1530,1530,1530,1530,1530},
[1542]  = {1542,1542,102,103,104,1542,1542},
[114]  = {199,199,199,199,199,199,199},
[115]  = {115,115,115,115,115,115,106},
[1544]  = {1544,1544,1544,1544,1544,1544,1544},
[1546]  = {1546,1546,1546,1546,1546,1546,1546},
[116]  = {116,116,116,116,116,116,116},
[1603]  = {8,8,8,8,104,105,8},
[1612]  = {8,8,8,8,104,105,8},
[1547]  = {8,8,8,8,104,105,8},
[2036]  = {2024,2024,2024,2024,2024,2024,2024},
[2037]  = {2025,2025,2025,2025,2025,2025,2025},
[112]  = {10006,10006,10006,10006,10006,10006,10006},
[120]  = {2024,2024,2024,2024,2024,2024,2024},
[121]  = {2024,2024,2024,2024,2024,2024,2024},
[122]  = {2024,2024,2024,2024,2024,2024,2024},
[1556]  = {1524,1524,1524,1524,1524,1524,1524},
[123]  = {73,73,73,103,104,105,106,902,903,904},
[1564]  = {1564,1564,1564,1564,1564,1564,1564},
[106]  = {10006,10006,10006,10006,10006,10006,10006},
[2026]  = {10006,10006,10006,10006,10006,10006,10006},
[2027]  = {10006,10006,10006,10006,10006,10006,10006},
[124]  = {124,124,124,124,124,124,124},
[1568]  = {1568,1568,1568,1568,1568,1568,1568},
[125]  = {125,125,125,125,125,125,125,902,903,904},
[127]  = {127,127,127,127,127,127,127,902,903,904},
[128]  = {128,128,128,128,128,128,128},
[129]  = {129,129,129,129,129,129,129},
[1589]  = {1589,1589,1589,1589,1589,1589,1589},
[136]  = {136,136,136,136,136,136,136},
[1615]  = {1615,1615,1615,1615,1615,1615,1615},
[1624]  = {1624,1624,1624,1624,1624,1624,1624}, 
[1633]  = {1633,1633,1633,1633,1633,1633,1633}, 
[145]  = {145,145,145,145,145,145,145}, 
[150]  = {150,150,150,150,150,150,150}, 
[146]  = {106,106,106,106,106,106,106}, 


























































}

--设置所有效果无效
function Environment:SetAllInvalid()
	Environment.Rain.RainSFX = 0
	Environment.Snow.SnowSFX = 0
	
	Environment.SceneCtrl.EnvStyle = ""
	Environment.SceneCtrl.ColorMap = ""

	local tag  = 0
	Environment.Rain.Valid		= false
	tag = tag + Environment.Rain.Tag
	Environment.Snow.Valid		= false
	tag = tag + Environment.Snow.Tag
	Environment.Sun.Valid		= false
	tag = tag + Environment.Sun.Tag
	Environment.Moon.Valid		= false
	tag = tag + Environment.Moon.Tag
	Environment.Cloud.Valid		= false
	tag = tag + Environment.Cloud.Tag
	Environment.Sky.Valid		= false
	tag = tag + Environment.Sky.Tag
	Environment.Light.Valid		= false
	tag = tag + Environment.Light.Tag
	Environment.Fog.Valid       = false
	tag = tag + Environment.Fog.Tag
	Environment.Lightning.Valid = false
	tag = tag + Environment.Lightning.Tag
	Environment.MonoCtrl.Valid	= false
	tag = tag + Environment.MonoCtrl.Tag
	Environment.MapCtrl.Valid	= false
	tag = tag + Environment.MapCtrl.Tag
	Environment.SkyFileCtrl.Valid	= false
	tag = tag + Environment.SkyFileCtrl.Tag
	Environment.SkyExFileCtrl.Valid = false
	tag = tag + Environment.SkyExFileCtrl.Tag
	return tag
end

--程序Tick是否允许的标记
function Environment:AdjustVisible(idEnv,tagEnv)
	if Environment.Rain.Valid == false then
		Environment.Rain.Valid        = true
		Environment.Rain.Visible      = false
		tagEnv = tagEnv + Environment.Rain.Tag
	end

	if Environment.Snow.Valid == false then
		Environment.Snow.Valid        = true
		Environment.Snow.Visible      = false
		tagEnv = tagEnv + Environment.Snow.Tag
	end

	if Environment.Lightning.Valid == false then
		Environment.Lightning.Valid        = true
		Environment.Lightning.Visible      = false
		tagEnv = tagEnv + Environment.Lightning.Tag
	end
	
	return tagEnv
end

--应用参数设置
function Environment:Apply(idEnv)        
	if idEnv <= 0 then
		Environment:OnBeginApplyEnv(idEnv)
		local tagEnv = Environment:SetAllInvalid()		
		GameApi.ResetEnvParam(Environment,idEnv,tagEnv)
		Environment:OnEndApplyEnv(idEnv)
		return
	end
	
	if EnvFuncList[idEnv] then
		local ApplyFunc = EnvFuncList[idEnv].ApplyFunc
		if ApplyFunc then
			Environment:OnBeginApplyEnv(idEnv)
			
			local lastEnvStyle = Environment.SceneCtrl.EnvStyle
			local lastColorMap = Environment.SceneCtrl.ColorMap

			Environment:SetAllInvalid()		
			local tagEnv = ApplyFunc()
			tagEnv = Environment:AdjustVisible(idEnv,tagEnv)
			GameApi.ResetEnvParam(Environment,idEnv,tagEnv)

			if lastEnvStyle ~= Environment.SceneCtrl.EnvStyle then
				if string.len(Environment.SceneCtrl.EnvStyle) > 0 then
					GameApi.ChangeSceneStyle("天气",Environment.SceneCtrl.EnvStyle,0,0)
				else
					GameApi.ChangeSceneStyle("天气","晴天",0,0)
				end
			end

			if lastColorMap ~= Environment.SceneCtrl.ColorMap then
				GameApi.ChangeColorMap(Environment.SceneCtrl.ColorMap)
			end

			Environment:OnEndApplyEnv(idEnv)
		end
	end
end

function Environment:ApplyWeather(idWeather)
	Environment.WeatherID = idWeather
    idWeather = idWeather + 1 
	Environment.SceneID    = GameApi.GetSceneID()
	if MapWeather[Environment.SceneID] and MapWeather[Environment.SceneID][idWeather] then
		Environment:Apply(MapWeather[Environment.SceneID][idWeather])
	elseif MapWeather[0] and MapWeather[0][idWeather] then
		Environment:Apply(MapWeather[0][idWeather])
	end
end

--闪雷处理
function Environment:OnLightning(idMap,idEnv)
	if Environment.Lightning.Valid and Environment.Lightning.LightningSFX then
		if Environment.Lightning.LightningSFX > 0 then
			if Sound.Lighting[Environment.Lightning.LightningSFX] and #Sound.Lighting[Environment.Lightning.LightningSFX] then
				local cnt = #Sound.Lighting[Environment.Lightning.LightningSFX]
				local idx = math.random(1,cnt)
				local sfx = Sound.Lighting[Environment.Lightning.LightningSFX][idx]
				GameApi.PlayListSFX(sfx,false,2000)
			end
		end
	end
end


--雷雨音效处理(停止老的)
function Environment:OnBeginApplyEnv(idEnv)		
	Environment.EnvID = GameApi.GetEnvID()
	if Environment.EnvID and Environment.EnvID > 0 then
		if Environment.Rain.Valid and Environment.Rain.RainSFX > 0 then
			GameApi.StopListSFX(Environment.Rain.RainSFX,2000)
		end

		if Environment.Snow.Valid and Environment.Snow.SnowSFX > 0 then
			GameApi.StopListSFX(Environment.Snow.SnowSFX,2000)
		end
	end	
end

--雷雨音效处理(播放新的)
function Environment:OnEndApplyEnv(idEnv)	
	Environment.EnvID = GameApi.GetEnvID()
	if Environment.EnvID and Environment.EnvID > 0 then
		if Environment.Rain.Valid and Environment.Rain.RainSFX > 0 then
			GameApi.PlayListSFX(Environment.Rain.RainSFX,true,2000)
		end

		if Environment.Snow.Valid and Environment.Snow.SnowSFX > 0 then
			GameApi.PlayListSFX(Environment.Snow.SnowSFX,true,2000)
		end
	end
end

--事件触发函数
function Environment:OnEnvEvent(event,val_tbl)
	--这里可以记录上次事件的各种ID参数,以便进行设置效果
	--下面这四项基本不动
	Environment.GameTime   = GameApi.GetGameTime()*24
	Environment.SceneID    = GameApi.GetSceneID()
	Environment.PrecinctID = GameApi.GetPrecinctID()
	Environment.EnvID      = GameApi.GetEnvID()
end
