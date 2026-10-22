EnvFuncList[1] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 20.000000
			Environment.Fog.FogEnd		= 232.000000
			Environment.Fog.FogDensity1	= 1.100000
			Environment.Fog.FogDensity2	= 3.360000
			Environment.Fog.ColorDensity1	= 1.000000
			Environment.Fog.ColorDensity2	= 1.000000
			Environment.Fog.HorzDensity	= 2.690000
			Environment.Fog.HorzPower		= 2.380000
			Environment.Fog.HeightStart	= 0.000000
			Environment.Fog.HeightEnd		= 0.000000
			Environment.Fog.HeightDensity	= 0.000000
			Environment.Fog.FogColor1		= 0xFF4774C7
			Environment.Fog.FogColor2		= 0xFF7986DF
			Environment.Fog.FogColor3		= 0xFF2F63B0
			Environment.Fog.FogColor4		= 0xFF374A8E

			tag = tag + Environment.Fog.Tag
		end

		if Environment.Rain.Valid == false then
			Environment.Rain.Valid        = true
			Environment.Rain.Visible      = true
			Environment.Rain.RainSpeed    = 0.000000
			Environment.Rain.RainSize     = 0.000000
			Environment.Rain.RainLife     = 0
			Environment.Rain.RainColor    = 0xFF000000
			Environment.Rain.RainGFX      = "程序联入\\雨丝地面效果.gfx"
			Environment.Rain.RainSFX      = 1

			tag = tag + Environment.Rain.Tag
		end

		if Environment.Lightning.Valid == false then
			Environment.Lightning.Valid          = true
			Environment.Lightning.Visible        = true
			Environment.Lightning.Power          = 0.010000
			Environment.Lightning.Start          = 250.000000
			Environment.Lightning.End            = 60.000000
			Environment.Lightning.Time           = 130
			Environment.Lightning.Num            = 2
			Environment.Lightning.TimeInterval   = 120
			Environment.Lightning.BetweenTime    = 50000
			Environment.Lightning.BetweenRand    = 3000
			Environment.Lightning.LightningSFX      = 3

			tag = tag + Environment.Lightning.Tag
		end

		Environment.SceneCtrl.EnvStyle = ""
		Environment.SceneCtrl.ColorMap = "Maps\\Rain_Colormapping.dds"

		return tag
	end
}

EnvFuncList[2] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 67.000000
			Environment.Fog.FogEnd		= 385.000000
			Environment.Fog.FogDensity1	= 0.500000
			Environment.Fog.FogDensity2	= 1.280000
			Environment.Fog.ColorDensity1	= 0.670000
			Environment.Fog.ColorDensity2	= 1.530000
			Environment.Fog.HorzDensity	= 2.020000
			Environment.Fog.HorzPower		= 0.730000
			Environment.Fog.HeightStart	= 6.000000
			Environment.Fog.HeightEnd		= 31.000000
			Environment.Fog.HeightDensity	= 1.160000
			Environment.Fog.FogColor1		= 0xFF69C5BB
			Environment.Fog.FogColor2		= 0xFF427EB5
			Environment.Fog.FogColor3		= 0xFF888B54
			Environment.Fog.FogColor4		= 0xFF7F7F7F

			tag = tag + Environment.Fog.Tag
		end

		return tag
	end
}

EnvFuncList[3] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 73.000000
			Environment.Fog.FogEnd		= 256.000000
			Environment.Fog.FogDensity1	= 0.000000
			Environment.Fog.FogDensity2	= 0.670000
			Environment.Fog.ColorDensity1	= 0.790000
			Environment.Fog.ColorDensity2	= 1.160000
			Environment.Fog.HorzDensity	= 0.610000
			Environment.Fog.HorzPower		= 0.790000
			Environment.Fog.HeightStart	= 35.000000
			Environment.Fog.HeightEnd		= 15.000000
			Environment.Fog.HeightDensity	= 0.180000
			Environment.Fog.FogColor1		= 0xFFC9DCEB
			Environment.Fog.FogColor2		= 0xFFC0B8E9
			Environment.Fog.FogColor3		= 0xFF6B8BC7
			Environment.Fog.FogColor4		= 0xFF6152A7

			tag = tag + Environment.Fog.Tag
		end

		return tag
	end
}

EnvFuncList[4] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 67.000000
			Environment.Fog.FogEnd		= 397.000000
			Environment.Fog.FogDensity1	= 0.610000
			Environment.Fog.FogDensity2	= 2.930000
			Environment.Fog.ColorDensity1	= 0.430000
			Environment.Fog.ColorDensity2	= 0.850000
			Environment.Fog.HorzDensity	= 1.830000
			Environment.Fog.HorzPower		= 1.340000
			Environment.Fog.HeightStart	= 0.000000
			Environment.Fog.HeightEnd		= 0.000000
			Environment.Fog.HeightDensity	= 0.000000
			Environment.Fog.FogColor1		= 0xFF2877E1
			Environment.Fog.FogColor2		= 0xFF5168C4
			Environment.Fog.FogColor3		= 0xFF1174BD
			Environment.Fog.FogColor4		= 0xFF30438D

			tag = tag + Environment.Fog.Tag
		end

		return tag
	end
}

EnvFuncList[5] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 31.000000
			Environment.Fog.FogEnd		= 220.000000
			Environment.Fog.FogDensity1	= 1.400000
			Environment.Fog.FogDensity2	= 0.490000
			Environment.Fog.ColorDensity1	= 1.100000
			Environment.Fog.ColorDensity2	= 1.470000
			Environment.Fog.HorzDensity	= 0.310000
			Environment.Fog.HorzPower		= 2.440000
			Environment.Fog.HeightStart	= 11.000000
			Environment.Fog.HeightEnd		= 32.500000
			Environment.Fog.HeightDensity	= 3.000000
			Environment.Fog.FogColor1		= 0xFF95BFD9
			Environment.Fog.FogColor2		= 0xFFA2EAEC
			Environment.Fog.FogColor3		= 0xFF888B54
			Environment.Fog.FogColor4		= 0xFF7F7F7F

			tag = tag + Environment.Fog.Tag
		end

		return tag
	end
}

EnvFuncList[6] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 20.000000
			Environment.Fog.FogEnd		= 134.000000
			Environment.Fog.FogDensity1	= 3.300000
			Environment.Fog.FogDensity2	= 0.670000
			Environment.Fog.ColorDensity1	= 1.000000
			Environment.Fog.ColorDensity2	= 1.000000
			Environment.Fog.HorzDensity	= 0.920000
			Environment.Fog.HorzPower		= 1.340000
			Environment.Fog.HeightStart	= 0.000000
			Environment.Fog.HeightEnd		= 0.000000
			Environment.Fog.HeightDensity	= 0.000000
			Environment.Fog.FogColor1		= 0xFF60D656
			Environment.Fog.FogColor2		= 0xFF478ED6
			Environment.Fog.FogColor3		= 0xFF888B54
			Environment.Fog.FogColor4		= 0xFF7F7F7F

			tag = tag + Environment.Fog.Tag
		end

		return tag
	end
}

EnvFuncList[7] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 24.000000
			Environment.Fog.FogEnd		= 568.000000
			Environment.Fog.FogDensity1	= 1.000000
			Environment.Fog.FogDensity2	= 0.600000
			Environment.Fog.ColorDensity1	= 0.610000
			Environment.Fog.ColorDensity2	= 2.380000
			Environment.Fog.HorzDensity	= 3.850000
			Environment.Fog.HorzPower		= 2.380000
			Environment.Fog.HeightStart	= 0.000000
			Environment.Fog.HeightEnd		= 0.000000
			Environment.Fog.HeightDensity	= 3.000000
			Environment.Fog.FogColor1		= 0xFF48819B
			Environment.Fog.FogColor2		= 0xFF5A589A
			Environment.Fog.FogColor3		= 0xFF2B5E8C
			Environment.Fog.FogColor4		= 0xFF294163

			tag = tag + Environment.Fog.Tag
		end

		if Environment.Sun.Valid == false then
			Environment.Sun.Valid        = true
			Environment.Sun.Visible      = false
			Environment.Sun.SunPower     = 0.000000
			Environment.Sun.SunPower_N   = 0.000000

			tag = tag + Environment.Sun.Tag
		end

		return tag
	end
}

EnvFuncList[8] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 30.000000
			Environment.Fog.FogEnd		= 611.000000
			Environment.Fog.FogDensity1	= 0.310000
			Environment.Fog.FogDensity2	= 4.520000
			Environment.Fog.ColorDensity1	= 1.000000
			Environment.Fog.ColorDensity2	= 1.000000
			Environment.Fog.HorzDensity	= 0.430000
			Environment.Fog.HorzPower		= 1.650000
			Environment.Fog.HeightStart	= 0.000000
			Environment.Fog.HeightEnd		= 43.000000
			Environment.Fog.HeightDensity	= 2.690000
			Environment.Fog.FogColor1		= 0xFF2771BA
			Environment.Fog.FogColor2		= 0xFFECF2F9
			Environment.Fog.FogColor3		= 0xFF447CBB
			Environment.Fog.FogColor4		= 0xFF344081

			tag = tag + Environment.Fog.Tag
		end

		return tag
	end
}

EnvFuncList[9] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 31.000000
			Environment.Fog.FogEnd		= 110.000000
			Environment.Fog.FogDensity1	= 0.240000
			Environment.Fog.FogDensity2	= 2.380000
			Environment.Fog.ColorDensity1	= 0.790000
			Environment.Fog.ColorDensity2	= 1.100000
			Environment.Fog.HorzDensity	= 0.370000
			Environment.Fog.HorzPower		= 0.850000
			Environment.Fog.HeightStart	= 15.000000
			Environment.Fog.HeightEnd		= 35.000000
			Environment.Fog.HeightDensity	= 3.540000
			Environment.Fog.FogColor1		= 0xFFA6CEE6
			Environment.Fog.FogColor2		= 0xFF62D0BA
			Environment.Fog.FogColor3		= 0xFF888B54
			Environment.Fog.FogColor4		= 0xFF7F7F7F

			tag = tag + Environment.Fog.Tag
		end

		return tag
	end
}

EnvFuncList[10] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 18.000000
			Environment.Fog.FogEnd		= 0.000000
			Environment.Fog.FogDensity1	= 0.000000
			Environment.Fog.FogDensity2	= 0.000000
			Environment.Fog.ColorDensity1	= 0.000000
			Environment.Fog.ColorDensity2	= 0.000000
			Environment.Fog.HorzDensity	= 0.000000
			Environment.Fog.HorzPower		= 0.000000
			Environment.Fog.HeightStart	= 0.000000
			Environment.Fog.HeightEnd		= 0.000000
			Environment.Fog.HeightDensity	= 0.000000
			Environment.Fog.FogColor1		= 0xFF000000
			Environment.Fog.FogColor2		= 0xFF000000
			Environment.Fog.FogColor3		= 0xFF888B54
			Environment.Fog.FogColor4		= 0xFF7F7F7F

			tag = tag + Environment.Fog.Tag
		end

		return tag
	end
}

EnvFuncList[12] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 24.000000
			Environment.Fog.FogEnd		= 153.000000
			Environment.Fog.FogDensity1	= 1.000000
			Environment.Fog.FogDensity2	= 1.000000
			Environment.Fog.ColorDensity1	= 1.000000
			Environment.Fog.ColorDensity2	= 1.000000
			Environment.Fog.HorzDensity	= 5.740000
			Environment.Fog.HorzPower		= 1.000000
			Environment.Fog.HeightStart	= 0.000000
			Environment.Fog.HeightEnd		= 0.000000
			Environment.Fog.HeightDensity	= 0.000000
			Environment.Fog.FogColor1		= 0xFF707BCD
			Environment.Fog.FogColor2		= 0xFF3E65C1
			Environment.Fog.FogColor3		= 0xFF888B54
			Environment.Fog.FogColor4		= 0xFF7F7F7F

			tag = tag + Environment.Fog.Tag
		end

		return tag
	end
}

EnvFuncList[13] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 31.000000
			Environment.Fog.FogEnd		= 256.000000
			Environment.Fog.FogDensity1	= 0.240000
			Environment.Fog.FogDensity2	= 1.530000
			Environment.Fog.ColorDensity1	= 0.180000
			Environment.Fog.ColorDensity2	= 1.400000
			Environment.Fog.HorzDensity	= 2.080000
			Environment.Fog.HorzPower		= 1.160000
			Environment.Fog.HeightStart	= 61.000000
			Environment.Fog.HeightEnd		= 73.000000
			Environment.Fog.HeightDensity	= 0.610000
			Environment.Fog.FogColor1		= 0xFFF9938A
			Environment.Fog.FogColor2		= 0xFF626FC4
			Environment.Fog.FogColor3		= 0xFF3781D2
			Environment.Fog.FogColor4		= 0xFF3442A5

			tag = tag + Environment.Fog.Tag
		end

		return tag
	end
}

EnvFuncList[17] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 20.000000
			Environment.Fog.FogEnd		= 128.000000
			Environment.Fog.FogDensity1	= 1.650000
			Environment.Fog.FogDensity2	= 2.560000
			Environment.Fog.ColorDensity1	= 1.000000
			Environment.Fog.ColorDensity2	= 1.000000
			Environment.Fog.HorzDensity	= 2.260000
			Environment.Fog.HorzPower		= 2.810000
			Environment.Fog.HeightStart	= 15.000000
			Environment.Fog.HeightEnd		= 43.000000
			Environment.Fog.HeightDensity	= 1.890000
			Environment.Fog.FogColor1		= 0xFF5981DB
			Environment.Fog.FogColor2		= 0xFF7B41AF
			Environment.Fog.FogColor3		= 0xFF888B54
			Environment.Fog.FogColor4		= 0xFF7F7F7F

			tag = tag + Environment.Fog.Tag
		end

		if Environment.Snow.Valid == false then
			Environment.Snow.Valid        = true
			Environment.Snow.Visible      = false
			Environment.Snow.SnowSpeed    = 0.000000
			Environment.Snow.SnowSize     = 0.000000
			Environment.Snow.SnowLife     = 0
			Environment.Snow.SnowColor    = 0xFF000000
			Environment.Snow.SnowGFX      = ""
			Environment.Rain.SnowSFX      = 4

			tag = tag + Environment.Snow.Tag
		end

		return tag
	end
}

EnvFuncList[18] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 24.000000
			Environment.Fog.FogEnd		= 183.000000
			Environment.Fog.FogDensity1	= 0.980000
			Environment.Fog.FogDensity2	= 0.790000
			Environment.Fog.ColorDensity1	= 1.000000
			Environment.Fog.ColorDensity2	= 1.000000
			Environment.Fog.HorzDensity	= 4.400000
			Environment.Fog.HorzPower		= 2.200000
			Environment.Fog.HeightStart	= 0.000000
			Environment.Fog.HeightEnd		= 0.000000
			Environment.Fog.HeightDensity	= 0.000000
			Environment.Fog.FogColor1		= 0xFF243066
			Environment.Fog.FogColor2		= 0xFF6729B1
			Environment.Fog.FogColor3		= 0xFF888B54
			Environment.Fog.FogColor4		= 0xFF7F7F7F

			tag = tag + Environment.Fog.Tag
		end

		return tag
	end
}

EnvFuncList[19] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 61.000000
			Environment.Fog.FogEnd		= 293.000000
			Environment.Fog.FogDensity1	= 0.430000
			Environment.Fog.FogDensity2	= 1.040000
			Environment.Fog.ColorDensity1	= 1.470000
			Environment.Fog.ColorDensity2	= 0.730000
			Environment.Fog.HorzDensity	= 2.870000
			Environment.Fog.HorzPower		= 1.000000
			Environment.Fog.HeightStart	= 0.000000
			Environment.Fog.HeightEnd		= 85.000000
			Environment.Fog.HeightDensity	= 0.370000
			Environment.Fog.FogColor1		= 0xFF47A5C9
			Environment.Fog.FogColor2		= 0xFF2D4875
			Environment.Fog.FogColor3		= 0xFF2C5376
			Environment.Fog.FogColor4		= 0xFF2E4B74

			tag = tag + Environment.Fog.Tag
		end

		return tag
	end
}

EnvFuncList[21] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 55.000000
			Environment.Fog.FogEnd		= 250.000000
			Environment.Fog.FogDensity1	= 0.180000
			Environment.Fog.FogDensity2	= 2.500000
			Environment.Fog.ColorDensity1	= 0.610000
			Environment.Fog.ColorDensity2	= 1.280000
			Environment.Fog.HorzDensity	= 1.280000
			Environment.Fog.HorzPower		= 1.100000
			Environment.Fog.HeightStart	= 24.000000
			Environment.Fog.HeightEnd		= 104.000000
			Environment.Fog.HeightDensity	= 4.530000
			Environment.Fog.FogColor1		= 0xFFFDA977
			Environment.Fog.FogColor2		= 0xFF7579C6
			Environment.Fog.FogColor3		= 0xFF396CA6
			Environment.Fog.FogColor4		= 0xFF2F53A6

			tag = tag + Environment.Fog.Tag
		end

		return tag
	end
}

EnvFuncList[22] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 60.000000
			Environment.Fog.FogEnd		= 751.000000
			Environment.Fog.FogDensity1	= 0.020000
			Environment.Fog.FogDensity2	= 3.790000
			Environment.Fog.ColorDensity1	= 0.920000
			Environment.Fog.ColorDensity2	= 4.690000
			Environment.Fog.HorzDensity	= 1.100000
			Environment.Fog.HorzPower		= 2.140000
			Environment.Fog.HeightStart	= 24.000000
			Environment.Fog.HeightEnd		= 122.000000
			Environment.Fog.HeightDensity	= 3.660000
			Environment.Fog.FogColor1		= 0xFF4D63A4
			Environment.Fog.FogColor2		= 0xFF97D3EE
			Environment.Fog.FogColor3		= 0xFF375E97
			Environment.Fog.FogColor4		= 0xFF215054

			tag = tag + Environment.Fog.Tag
		end

		return tag
	end
}

EnvFuncList[23] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 40.000000
			Environment.Fog.FogEnd		= 385.000000
			Environment.Fog.FogDensity1	= 0.670000
			Environment.Fog.FogDensity2	= 4.570000
			Environment.Fog.ColorDensity1	= 0.610000
			Environment.Fog.ColorDensity2	= 2.000000
			Environment.Fog.HorzDensity	= 2.850000
			Environment.Fog.HorzPower		= 4.340000
			Environment.Fog.HeightStart	= 12.000000
			Environment.Fog.HeightEnd		= 159.000000
			Environment.Fog.HeightDensity	= 0.790000
			Environment.Fog.FogColor1		= 0xFF4E6F9A
			Environment.Fog.FogColor2		= 0xFF282D53
			Environment.Fog.FogColor3		= 0xFF4E6F9A
			Environment.Fog.FogColor4		= 0xFF282D53

			tag = tag + Environment.Fog.Tag
		end

		if Environment.Sun.Valid == false then
			Environment.Sun.Valid        = true
			Environment.Sun.Visible      = false
			Environment.Sun.SunPower     = 0.000000
			Environment.Sun.SunPower_N   = 0.000000

			tag = tag + Environment.Sun.Tag
		end

		return tag
	end
}

EnvFuncList[24] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 15.000000
			Environment.Fog.FogEnd		= 177.000000
			Environment.Fog.FogDensity1	= 0.670000
			Environment.Fog.FogDensity2	= 1.280000
			Environment.Fog.ColorDensity1	= 1.000000
			Environment.Fog.ColorDensity2	= 1.000000
			Environment.Fog.HorzDensity	= 2.500000
			Environment.Fog.HorzPower		= 0.730000
			Environment.Fog.HeightStart	= 0.000000
			Environment.Fog.HeightEnd		= 0.000000
			Environment.Fog.HeightDensity	= 0.000000
			Environment.Fog.FogColor1		= 0xFF88CEDF
			Environment.Fog.FogColor2		= 0xFF4A73B5
			Environment.Fog.FogColor3		= 0xFF888B54
			Environment.Fog.FogColor4		= 0xFF7F7F7F

			tag = tag + Environment.Fog.Tag
		end

		return tag
	end
}

EnvFuncList[25] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 24.000000
			Environment.Fog.FogEnd		= 305.000000
			Environment.Fog.FogDensity1	= 4.400000
			Environment.Fog.FogDensity2	= 4.090000
			Environment.Fog.ColorDensity1	= 0.610000
			Environment.Fog.ColorDensity2	= 1.280000
			Environment.Fog.HorzDensity	= 1.470000
			Environment.Fog.HorzPower		= 2.080000
			Environment.Fog.HeightStart	= 6.000000
			Environment.Fog.HeightEnd		= 31.000000
			Environment.Fog.HeightDensity	= 2.380000
			Environment.Fog.FogColor1		= 0xFF3E56AC
			Environment.Fog.FogColor2		= 0xFFE0EBF5
			Environment.Fog.FogColor3		= 0xFF3E56AC
			Environment.Fog.FogColor4		= 0xFFE0EBF5

			tag = tag + Environment.Fog.Tag
		end

		return tag
	end
}

EnvFuncList[26] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 31.000000
			Environment.Fog.FogEnd		= 324.000000
			Environment.Fog.FogDensity1	= 0.490000
			Environment.Fog.FogDensity2	= 1.650000
			Environment.Fog.ColorDensity1	= 0.180000
			Environment.Fog.ColorDensity2	= 1.470000
			Environment.Fog.HorzDensity	= 2.990000
			Environment.Fog.HorzPower		= 1.470000
			Environment.Fog.HeightStart	= 11.000000
			Environment.Fog.HeightEnd		= 61.000000
			Environment.Fog.HeightDensity	= 2.690000
			Environment.Fog.FogColor1		= 0xFFF38E72
			Environment.Fog.FogColor2		= 0xFF4F489F
			Environment.Fog.FogColor3		= 0xFF5467B6
			Environment.Fog.FogColor4		= 0xFF262D57

			tag = tag + Environment.Fog.Tag
		end

		return tag
	end
}

EnvFuncList[27] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 43.000000
			Environment.Fog.FogEnd		= 147.000000
			Environment.Fog.FogDensity1	= 0.310000
			Environment.Fog.FogDensity2	= 1.530000
			Environment.Fog.ColorDensity1	= 0.920000
			Environment.Fog.ColorDensity2	= 2.080000
			Environment.Fog.HorzDensity	= 1.040000
			Environment.Fog.HorzPower		= 2.260000
			Environment.Fog.HeightStart	= 18.000000
			Environment.Fog.HeightEnd		= 49.000000
			Environment.Fog.HeightDensity	= 2.990000
			Environment.Fog.FogColor1		= 0xFFACBDF7
			Environment.Fog.FogColor2		= 0xFF7575C6
			Environment.Fog.FogColor3		= 0xFF345EAB
			Environment.Fog.FogColor4		= 0xFFC4C9E6

			tag = tag + Environment.Fog.Tag
		end

		if Environment.Snow.Valid == false then
			Environment.Snow.Valid        = true
			Environment.Snow.Visible      = false
			Environment.Snow.SnowSpeed    = 0.300000
			Environment.Snow.SnowSize     = 0.100000
			Environment.Snow.SnowLife     = 100
			Environment.Snow.SnowColor    = 0xFFD1FAFE
			Environment.Snow.SnowGFX      = "程序联入\\暴雪地面效果.gfx"
			Environment.Rain.SnowSFX      = 4

			tag = tag + Environment.Snow.Tag
		end

		return tag
	end
}

EnvFuncList[28] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 31.000000
			Environment.Fog.FogEnd		= 1410.000000
			Environment.Fog.FogDensity1	= 0.920000
			Environment.Fog.FogDensity2	= 1.470000
			Environment.Fog.ColorDensity1	= 0.310000
			Environment.Fog.ColorDensity2	= 1.650000
			Environment.Fog.HorzDensity	= 2.690000
			Environment.Fog.HorzPower		= 1.220000
			Environment.Fog.HeightStart	= 24.000000
			Environment.Fog.HeightEnd		= 54.000000
			Environment.Fog.HeightDensity	= 2.200000
			Environment.Fog.FogColor1		= 0xFFA9F8E4
			Environment.Fog.FogColor2		= 0xFF3AA5B8
			Environment.Fog.FogColor3		= 0xFF888B54
			Environment.Fog.FogColor4		= 0xFF7F7F7F

			tag = tag + Environment.Fog.Tag
		end

		return tag
	end
}

EnvFuncList[29] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 50.000000
			Environment.Fog.FogEnd		= 324.000000
			Environment.Fog.FogDensity1	= 0.370000
			Environment.Fog.FogDensity2	= 1.530000
			Environment.Fog.ColorDensity1	= 0.490000
			Environment.Fog.ColorDensity2	= 1.710000
			Environment.Fog.HorzDensity	= 4.690000
			Environment.Fog.HorzPower		= 1.470000
			Environment.Fog.HeightStart	= 0.000000
			Environment.Fog.HeightEnd		= 0.000000
			Environment.Fog.HeightDensity	= 0.000000
			Environment.Fog.FogColor1		= 0xFF66BBDF
			Environment.Fog.FogColor2		= 0xFF26428A
			Environment.Fog.FogColor3		= 0xFF607ABF
			Environment.Fog.FogColor4		= 0xFF4254BD

			tag = tag + Environment.Fog.Tag
		end

		return tag
	end
}

EnvFuncList[30] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 37.000000
			Environment.Fog.FogEnd		= 200.000000
			Environment.Fog.FogDensity1	= 1.000000
			Environment.Fog.FogDensity2	= 2.260000
			Environment.Fog.ColorDensity1	= 0.920000
			Environment.Fog.ColorDensity2	= 1.000000
			Environment.Fog.HorzDensity	= 1.830000
			Environment.Fog.HorzPower		= 1.950000
			Environment.Fog.HeightStart	= 18.000000
			Environment.Fog.HeightEnd		= 43.000000
			Environment.Fog.HeightDensity	= 3.360000
			Environment.Fog.FogColor1		= 0xFFF8702E
			Environment.Fog.FogColor2		= 0xFF525CA5
			Environment.Fog.FogColor3		= 0xFFF8702E
			Environment.Fog.FogColor4		= 0xFF525CA5

			tag = tag + Environment.Fog.Tag
		end

		return tag
	end
}

EnvFuncList[31] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 122.000000
			Environment.Fog.FogEnd		= 550.000000
			Environment.Fog.FogDensity1	= 0.310000
			Environment.Fog.FogDensity2	= 2.810000
			Environment.Fog.ColorDensity1	= 0.370000
			Environment.Fog.ColorDensity2	= 1.710000
			Environment.Fog.HorzDensity	= 4.270000
			Environment.Fog.HorzPower		= 1.950000
			Environment.Fog.HeightStart	= 28.000000
			Environment.Fog.HeightEnd		= 43.000000
			Environment.Fog.HeightDensity	= 0.790000
			Environment.Fog.FogColor1		= 0xFF3674D1
			Environment.Fog.FogColor2		= 0xFF365B94
			Environment.Fog.FogColor3		= 0xFF3E5CB9
			Environment.Fog.FogColor4		= 0xFF365B94

			tag = tag + Environment.Fog.Tag
		end

		return tag
	end
}

EnvFuncList[32] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 73.000000
			Environment.Fog.FogEnd		= 495.000000
			Environment.Fog.FogDensity1	= 1.160000
			Environment.Fog.FogDensity2	= 0.720000
			Environment.Fog.ColorDensity1	= 1.100000
			Environment.Fog.ColorDensity2	= 0.240000
			Environment.Fog.HorzDensity	= 1.530000
			Environment.Fog.HorzPower		= 1.890000
			Environment.Fog.HeightStart	= 0.000000
			Environment.Fog.HeightEnd		= 0.000000
			Environment.Fog.HeightDensity	= 0.000000
			Environment.Fog.FogColor1		= 0xFF87D6E7
			Environment.Fog.FogColor2		= 0xFF4172CD
			Environment.Fog.FogColor3		= 0xFF546FAB
			Environment.Fog.FogColor4		= 0xFF101F3D

			tag = tag + Environment.Fog.Tag
		end

		return tag
	end
}

EnvFuncList[33] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 12.000000
			Environment.Fog.FogEnd		= 200.000000
			Environment.Fog.FogDensity1	= 0.370000
			Environment.Fog.FogDensity2	= 3.660000
			Environment.Fog.ColorDensity1	= 1.000000
			Environment.Fog.ColorDensity2	= 1.000000
			Environment.Fog.HorzDensity	= 2.930000
			Environment.Fog.HorzPower		= 1.000000
			Environment.Fog.HeightStart	= 0.000000
			Environment.Fog.HeightEnd		= 0.000000
			Environment.Fog.HeightDensity	= 0.000000
			Environment.Fog.FogColor1		= 0xFF59BCD9
			Environment.Fog.FogColor2		= 0xFF2B5677
			Environment.Fog.FogColor3		= 0xFF888B54
			Environment.Fog.FogColor4		= 0xFF7F7F7F

			tag = tag + Environment.Fog.Tag
		end

		return tag
	end
}

EnvFuncList[34] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 17.000000
			Environment.Fog.FogEnd		= 299.000000
			Environment.Fog.FogDensity1	= 1.000000
			Environment.Fog.FogDensity2	= 0.920000
			Environment.Fog.ColorDensity1	= 1.160000
			Environment.Fog.ColorDensity2	= 0.310000
			Environment.Fog.HorzDensity	= 2.990000
			Environment.Fog.HorzPower		= 2.200000
			Environment.Fog.HeightStart	= 55.000000
			Environment.Fog.HeightEnd		= 92.000000
			Environment.Fog.HeightDensity	= 3.240000
			Environment.Fog.FogColor1		= 0xFF23C1E2
			Environment.Fog.FogColor2		= 0xFFCB5754
			Environment.Fog.FogColor3		= 0xFF888B54
			Environment.Fog.FogColor4		= 0xFF7F7F7F

			tag = tag + Environment.Fog.Tag
		end

		return tag
	end
}

EnvFuncList[35] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 65.000000
			Environment.Fog.FogEnd		= 500.000000
			Environment.Fog.FogDensity1	= 0.550000
			Environment.Fog.FogDensity2	= 1.000000
			Environment.Fog.ColorDensity1	= 1.000000
			Environment.Fog.ColorDensity2	= 1.000000
			Environment.Fog.HorzDensity	= 2.000000
			Environment.Fog.HorzPower		= 1.000000
			Environment.Fog.HeightStart	= 0.000000
			Environment.Fog.HeightEnd		= 0.000000
			Environment.Fog.HeightDensity	= 0.000000
			Environment.Fog.FogColor1		= 0xFF3153A2
			Environment.Fog.FogColor2		= 0xFF181294
			Environment.Fog.FogColor3		= 0xFF3153A2
			Environment.Fog.FogColor4		= 0xFF181294

			tag = tag + Environment.Fog.Tag
		end

		return tag
	end
}

EnvFuncList[36] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 31.000000
			Environment.Fog.FogEnd		= 452.000000
			Environment.Fog.FogDensity1	= 0.610000
			Environment.Fog.FogDensity2	= 3.360000
			Environment.Fog.ColorDensity1	= 0.550000
			Environment.Fog.ColorDensity2	= 1.160000
			Environment.Fog.HorzDensity	= 3.240000
			Environment.Fog.HorzPower		= 1.470000
			Environment.Fog.HeightStart	= 24.000000
			Environment.Fog.HeightEnd		= 46.000000
			Environment.Fog.HeightDensity	= 1.830000
			Environment.Fog.FogColor1		= 0xFF4E678D
			Environment.Fog.FogColor2		= 0xFF92BDC0
			Environment.Fog.FogColor3		= 0xFF153A59
			Environment.Fog.FogColor4		= 0xFF84A2C1

			tag = tag + Environment.Fog.Tag
		end

		return tag
	end
}

EnvFuncList[37] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 73.000000
			Environment.Fog.FogEnd		= 495.000000
			Environment.Fog.FogDensity1	= 0.000000
			Environment.Fog.FogDensity2	= 2.140000
			Environment.Fog.ColorDensity1	= 0.920000
			Environment.Fog.ColorDensity2	= 2.630000
			Environment.Fog.HorzDensity	= 0.060000
			Environment.Fog.HorzPower		= 1.950000
			Environment.Fog.HeightStart	= 0.000000
			Environment.Fog.HeightEnd		= 67.000000
			Environment.Fog.HeightDensity	= 0.060000
			Environment.Fog.FogColor1		= 0xFF4BB47D
			Environment.Fog.FogColor2		= 0xFF50AF74
			Environment.Fog.FogColor3		= 0xFF466FB0
			Environment.Fog.FogColor4		= 0xFF37519D

			tag = tag + Environment.Fog.Tag
		end

		return tag
	end
}

EnvFuncList[38] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 55.000000
			Environment.Fog.FogEnd		= 489.000000
			Environment.Fog.FogDensity1	= 0.670000
			Environment.Fog.FogDensity2	= 2.140000
			Environment.Fog.ColorDensity1	= 0.240000
			Environment.Fog.ColorDensity2	= 1.000000
			Environment.Fog.HorzDensity	= 1.530000
			Environment.Fog.HorzPower		= 0.730000
			Environment.Fog.HeightStart	= 73.000000
			Environment.Fog.HeightEnd		= 110.000000
			Environment.Fog.HeightDensity	= 3.730000
			Environment.Fog.FogColor1		= 0xFF7A80ED
			Environment.Fog.FogColor2		= 0xFF7095DA
			Environment.Fog.FogColor3		= 0xFF888B54
			Environment.Fog.FogColor4		= 0xFF7F7F7F

			tag = tag + Environment.Fog.Tag
		end

		return tag
	end
}

EnvFuncList[39] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 43.000000
			Environment.Fog.FogEnd		= 450.000000
			Environment.Fog.FogDensity1	= 0.180000
			Environment.Fog.FogDensity2	= 1.650000
			Environment.Fog.ColorDensity1	= 1.000000
			Environment.Fog.ColorDensity2	= 1.340000
			Environment.Fog.HorzDensity	= 0.610000
			Environment.Fog.HorzPower		= 1.000000
			Environment.Fog.HeightStart	= 0.000000
			Environment.Fog.HeightEnd		= 67.000000
			Environment.Fog.HeightDensity	= 2.690000
			Environment.Fog.FogColor1		= 0xFF969EE7
			Environment.Fog.FogColor2		= 0xFF44429F
			Environment.Fog.FogColor3		= 0xFF386FB8
			Environment.Fog.FogColor4		= 0xFF2F3477

			tag = tag + Environment.Fog.Tag
		end

		return tag
	end
}

EnvFuncList[40] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 43.000000
			Environment.Fog.FogEnd		= 177.000000
			Environment.Fog.FogDensity1	= 0.180000
			Environment.Fog.FogDensity2	= 2.320000
			Environment.Fog.ColorDensity1	= 0.240000
			Environment.Fog.ColorDensity2	= 0.980000
			Environment.Fog.HorzDensity	= 0.180000
			Environment.Fog.HorzPower		= 0.430000
			Environment.Fog.HeightStart	= 24.000000
			Environment.Fog.HeightEnd		= 43.000000
			Environment.Fog.HeightDensity	= 3.730000
			Environment.Fog.FogColor1		= 0xFF5E9583
			Environment.Fog.FogColor2		= 0xFF375459
			Environment.Fog.FogColor3		= 0xFF888B54
			Environment.Fog.FogColor4		= 0xFF7F7F7F

			tag = tag + Environment.Fog.Tag
		end

		return tag
	end
}

EnvFuncList[41] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 43.000000
			Environment.Fog.FogEnd		= 470.000000
			Environment.Fog.FogDensity1	= 0.310000
			Environment.Fog.FogDensity2	= 3.580000
			Environment.Fog.ColorDensity1	= 0.920000
			Environment.Fog.ColorDensity2	= 2.300000
			Environment.Fog.HorzDensity	= 0.370000
			Environment.Fog.HorzPower		= 1.630000
			Environment.Fog.HeightStart	= 0.000000
			Environment.Fog.HeightEnd		= 0.000000
			Environment.Fog.HeightDensity	= 0.000000
			Environment.Fog.FogColor1		= 0xFF5982A6
			Environment.Fog.FogColor2		= 0xFF273D5A
			Environment.Fog.FogColor3		= 0xFF1D2D56
			Environment.Fog.FogColor4		= 0xFF4B9EB4

			tag = tag + Environment.Fog.Tag
		end

		return tag
	end
}

EnvFuncList[42] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 24.000000
			Environment.Fog.FogEnd		= 263.000000
			Environment.Fog.FogDensity1	= 0.670000
			Environment.Fog.FogDensity2	= 0.920000
			Environment.Fog.ColorDensity1	= 1.000000
			Environment.Fog.ColorDensity2	= 1.000000
			Environment.Fog.HorzDensity	= 4.150000
			Environment.Fog.HorzPower		= 0.920000
			Environment.Fog.HeightStart	= 0.000000
			Environment.Fog.HeightEnd		= 0.000000
			Environment.Fog.HeightDensity	= 0.000000
			Environment.Fog.FogColor1		= 0xFFB2450B
			Environment.Fog.FogColor2		= 0xFFDA863A
			Environment.Fog.FogColor3		= 0xFF888B54
			Environment.Fog.FogColor4		= 0xFF7F7F7F

			tag = tag + Environment.Fog.Tag
		end

		return tag
	end
}

EnvFuncList[43] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 30.000000
			Environment.Fog.FogEnd		= 134.000000
			Environment.Fog.FogDensity1	= 0.920000
			Environment.Fog.FogDensity2	= 2.440000
			Environment.Fog.ColorDensity1	= 1.280000
			Environment.Fog.ColorDensity2	= 0.610000
			Environment.Fog.HorzDensity	= 0.430000
			Environment.Fog.HorzPower		= 1.160000
			Environment.Fog.HeightStart	= 0.000000
			Environment.Fog.HeightEnd		= 70.000000
			Environment.Fog.HeightDensity	= 3.910000
			Environment.Fog.FogColor1		= 0xFF8FD7F5
			Environment.Fog.FogColor2		= 0xFFCFE0F1
			Environment.Fog.FogColor3		= 0xFF888B54
			Environment.Fog.FogColor4		= 0xFF7F7F7F

			tag = tag + Environment.Fog.Tag
		end

		Environment.SceneCtrl.EnvStyle = "太室山通用色调"
		Environment.SceneCtrl.ColorMap = "Maps\\x36\\ColorMapping.dds"

		return tag
	end
}

EnvFuncList[44] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 24.000000
			Environment.Fog.FogEnd		= 800.000000
			Environment.Fog.FogDensity1	= 0.720000
			Environment.Fog.FogDensity2	= 2.500000
			Environment.Fog.ColorDensity1	= 0.550000
			Environment.Fog.ColorDensity2	= 6.470000
			Environment.Fog.HorzDensity	= 1.830000
			Environment.Fog.HorzPower		= 4.640000
			Environment.Fog.HeightStart	= 0.000000
			Environment.Fog.HeightEnd		= 0.000000
			Environment.Fog.HeightDensity	= 0.000000
			Environment.Fog.FogColor1		= 0xFF73AABF
			Environment.Fog.FogColor2		= 0xFF5184AE
			Environment.Fog.FogColor3		= 0xFF29445F
			Environment.Fog.FogColor4		= 0xFF233856

			tag = tag + Environment.Fog.Tag
		end

		return tag
	end
}

EnvFuncList[45] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 70.000000
			Environment.Fog.FogEnd		= 800.000000
			Environment.Fog.FogDensity1	= 0.120000
			Environment.Fog.FogDensity2	= 0.660000
			Environment.Fog.ColorDensity1	= 1.000000
			Environment.Fog.ColorDensity2	= 1.000000
			Environment.Fog.HorzDensity	= 2.080000
			Environment.Fog.HorzPower		= 1.770000
			Environment.Fog.HeightStart	= 0.000000
			Environment.Fog.HeightEnd		= 0.000000
			Environment.Fog.HeightDensity	= 0.000000
			Environment.Fog.FogColor1		= 0xFF5399D9
			Environment.Fog.FogColor2		= 0xFF4048B3
			Environment.Fog.FogColor3		= 0xFF1F55A7
			Environment.Fog.FogColor4		= 0xFF212E76

			tag = tag + Environment.Fog.Tag
		end

		return tag
	end
}

EnvFuncList[46] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 18.000000
			Environment.Fog.FogEnd		= 452.000000
			Environment.Fog.FogDensity1	= 0.850000
			Environment.Fog.FogDensity2	= 3.910000
			Environment.Fog.ColorDensity1	= 0.720000
			Environment.Fog.ColorDensity2	= 2.690000
			Environment.Fog.HorzDensity	= 2.260000
			Environment.Fog.HorzPower		= 2.910000
			Environment.Fog.HeightStart	= 55.000000
			Environment.Fog.HeightEnd		= 102.000000
			Environment.Fog.HeightDensity	= 2.870000
			Environment.Fog.FogColor1		= 0xFF9755AC
			Environment.Fog.FogColor2		= 0xFFCCDAE6
			Environment.Fog.FogColor3		= 0xFF4A5E97
			Environment.Fog.FogColor4		= 0xFF9B4DB3

			tag = tag + Environment.Fog.Tag
		end

		return tag
	end
}

EnvFuncList[48] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 61.000000
			Environment.Fog.FogEnd		= 226.000000
			Environment.Fog.FogDensity1	= 1.000000
			Environment.Fog.FogDensity2	= 1.000000
			Environment.Fog.ColorDensity1	= 1.000000
			Environment.Fog.ColorDensity2	= 1.000000
			Environment.Fog.HorzDensity	= 2.200000
			Environment.Fog.HorzPower		= 1.000000
			Environment.Fog.HeightStart	= 0.000000
			Environment.Fog.HeightEnd		= 0.000000
			Environment.Fog.HeightDensity	= 0.000000
			Environment.Fog.FogColor1		= 0xFF916CE6
			Environment.Fog.FogColor2		= 0xFF6187EB
			Environment.Fog.FogColor3		= 0xFF916CE6
			Environment.Fog.FogColor4		= 0xFF6187EB

			tag = tag + Environment.Fog.Tag
		end

		return tag
	end
}

EnvFuncList[49] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 12.000000
			Environment.Fog.FogEnd		= 226.000000
			Environment.Fog.FogDensity1	= 0.430000
			Environment.Fog.FogDensity2	= 3.420000
			Environment.Fog.ColorDensity1	= 0.430000
			Environment.Fog.ColorDensity2	= 1.000000
			Environment.Fog.HorzDensity	= 4.030000
			Environment.Fog.HorzPower		= 2.800000
			Environment.Fog.HeightStart	= 15.000000
			Environment.Fog.HeightEnd		= 37.000000
			Environment.Fog.HeightDensity	= 3.050000
			Environment.Fog.FogColor1		= 0xFF243960
			Environment.Fog.FogColor2		= 0xFF893EC1
			Environment.Fog.FogColor3		= 0xFF243960
			Environment.Fog.FogColor4		= 0xFF893EC1

			tag = tag + Environment.Fog.Tag
		end

		return tag
	end
}

EnvFuncList[50] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 12.000000
			Environment.Fog.FogEnd		= 226.000000
			Environment.Fog.FogDensity1	= 1.000000
			Environment.Fog.FogDensity2	= 3.110000
			Environment.Fog.ColorDensity1	= 1.000000
			Environment.Fog.ColorDensity2	= 1.000000
			Environment.Fog.HorzDensity	= 1.000000
			Environment.Fog.HorzPower		= 0.920000
			Environment.Fog.HeightStart	= 0.000000
			Environment.Fog.HeightEnd		= 0.000000
			Environment.Fog.HeightDensity	= 0.000000
			Environment.Fog.FogColor1		= 0xFFD64A32
			Environment.Fog.FogColor2		= 0xFF3567BB
			Environment.Fog.FogColor3		= 0xFF888B54
			Environment.Fog.FogColor4		= 0xFF7F7F7F

			tag = tag + Environment.Fog.Tag
		end

		return tag
	end
}

EnvFuncList[51] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 18.000000
			Environment.Fog.FogEnd		= 140.000000
			Environment.Fog.FogDensity1	= 0.790000
			Environment.Fog.FogDensity2	= 1.400000
			Environment.Fog.ColorDensity1	= 0.730000
			Environment.Fog.ColorDensity2	= 1.040000
			Environment.Fog.HorzDensity	= 1.890000
			Environment.Fog.HorzPower		= 0.920000
			Environment.Fog.HeightStart	= 17.000000
			Environment.Fog.HeightEnd		= 28.500000
			Environment.Fog.HeightDensity	= 4.520000
			Environment.Fog.FogColor1		= 0xFF6BEFCB
			Environment.Fog.FogColor2		= 0xFF4D88CA
			Environment.Fog.FogColor3		= 0xFF888B54
			Environment.Fog.FogColor4		= 0xFF7F7F7F

			tag = tag + Environment.Fog.Tag
		end

		return tag
	end
}

EnvFuncList[52] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 25.000000
			Environment.Fog.FogEnd		= 0.000000
			Environment.Fog.FogDensity1	= 0.000000
			Environment.Fog.FogDensity2	= 0.000000
			Environment.Fog.ColorDensity1	= 0.000000
			Environment.Fog.ColorDensity2	= 0.000000
			Environment.Fog.HorzDensity	= 0.000000
			Environment.Fog.HorzPower		= 0.000000
			Environment.Fog.HeightStart	= 0.000000
			Environment.Fog.HeightEnd		= 0.000000
			Environment.Fog.HeightDensity	= 0.000000
			Environment.Fog.FogColor1		= 0xFF000000
			Environment.Fog.FogColor2		= 0xFF000000
			Environment.Fog.FogColor3		= 0xFF888B54
			Environment.Fog.FogColor4		= 0xFF7F7F7F

			tag = tag + Environment.Fog.Tag
		end

		return tag
	end
}

EnvFuncList[54] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 18.000000
			Environment.Fog.FogEnd		= 134.000000
			Environment.Fog.FogDensity1	= 1.530000
			Environment.Fog.FogDensity2	= 1.160000
			Environment.Fog.ColorDensity1	= 1.000000
			Environment.Fog.ColorDensity2	= 1.000000
			Environment.Fog.HorzDensity	= 4.090000
			Environment.Fog.HorzPower		= 0.730000
			Environment.Fog.HeightStart	= 0.000000
			Environment.Fog.HeightEnd		= 0.000000
			Environment.Fog.HeightDensity	= 0.000000
			Environment.Fog.FogColor1		= 0xFF000000
			Environment.Fog.FogColor2		= 0xFF000000
			Environment.Fog.FogColor3		= 0xFF888B54
			Environment.Fog.FogColor4		= 0xFF7F7F7F

			tag = tag + Environment.Fog.Tag
		end

		return tag
	end
}

EnvFuncList[55] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 18.000000
			Environment.Fog.FogEnd		= 104.000000
			Environment.Fog.FogDensity1	= 1.000000
			Environment.Fog.FogDensity2	= 1.000000
			Environment.Fog.ColorDensity1	= 1.000000
			Environment.Fog.ColorDensity2	= 1.000000
			Environment.Fog.HorzDensity	= 1.890000
			Environment.Fog.HorzPower		= 1.710000
			Environment.Fog.HeightStart	= 0.000000
			Environment.Fog.HeightEnd		= 85.000000
			Environment.Fog.HeightDensity	= 5.860000
			Environment.Fog.FogColor1		= 0xFF61B3DA
			Environment.Fog.FogColor2		= 0xFF5736C9
			Environment.Fog.FogColor3		= 0xFF888B54
			Environment.Fog.FogColor4		= 0xFF7F7F7F

			tag = tag + Environment.Fog.Tag
		end

		return tag
	end
}

EnvFuncList[56] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 8.000000
			Environment.Fog.FogEnd		= 0.000000
			Environment.Fog.FogDensity1	= 0.000000
			Environment.Fog.FogDensity2	= 0.000000
			Environment.Fog.ColorDensity1	= 0.000000
			Environment.Fog.ColorDensity2	= 0.000000
			Environment.Fog.HorzDensity	= 0.000000
			Environment.Fog.HorzPower		= 0.000000
			Environment.Fog.HeightStart	= 0.000000
			Environment.Fog.HeightEnd		= 0.000000
			Environment.Fog.HeightDensity	= 0.000000
			Environment.Fog.FogColor1		= 0xFF000000
			Environment.Fog.FogColor2		= 0xFF000000
			Environment.Fog.FogColor3		= 0xFF888B54
			Environment.Fog.FogColor4		= 0xFF7F7F7F

			tag = tag + Environment.Fog.Tag
		end

		if Environment.Rain.Valid == false then
			Environment.Rain.Valid        = true
			Environment.Rain.Visible      = true
			Environment.Rain.RainSpeed    = 0.300000
			Environment.Rain.RainSize     = 0.000000
			Environment.Rain.RainLife     = 100
			Environment.Rain.RainColor    = 0xFFCFD9E2
			Environment.Rain.RainGFX      = "程序联入\\雨丝地面效果.gfx"
			Environment.Rain.RainSFX      = 0

			tag = tag + Environment.Rain.Tag
		end

		return tag
	end
}

EnvFuncList[57] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 10.000000
			Environment.Fog.FogEnd		= 200.000000
			Environment.Fog.FogDensity1	= 0.920000
			Environment.Fog.FogDensity2	= 3.180000
			Environment.Fog.ColorDensity1	= 1.000000
			Environment.Fog.ColorDensity2	= 1.000000
			Environment.Fog.HorzDensity	= 1.710000
			Environment.Fog.HorzPower		= 0.920000
			Environment.Fog.HeightStart	= 0.000000
			Environment.Fog.HeightEnd		= 0.000000
			Environment.Fog.HeightDensity	= 0.000000
			Environment.Fog.FogColor1		= 0xFF4DB387
			Environment.Fog.FogColor2		= 0xFF3D69BC
			Environment.Fog.FogColor3		= 0xFF888B54
			Environment.Fog.FogColor4		= 0xFF7F7F7F

			tag = tag + Environment.Fog.Tag
		end

		return tag
	end
}

EnvFuncList[58] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 49.000000
			Environment.Fog.FogEnd		= 653.000000
			Environment.Fog.FogDensity1	= 0.310000
			Environment.Fog.FogDensity2	= 2.120000
			Environment.Fog.ColorDensity1	= 0.480000
			Environment.Fog.ColorDensity2	= 1.650000
			Environment.Fog.HorzDensity	= 1.400000
			Environment.Fog.HorzPower		= 1.220000
			Environment.Fog.HeightStart	= 0.000000
			Environment.Fog.HeightEnd		= 0.000000
			Environment.Fog.HeightDensity	= 0.000000
			Environment.Fog.FogColor1		= 0xFF98BCC7
			Environment.Fog.FogColor2		= 0xFF5E7599
			Environment.Fog.FogColor3		= 0xFF417685
			Environment.Fog.FogColor4		= 0xFF25395F

			tag = tag + Environment.Fog.Tag
		end

		return tag
	end
}

EnvFuncList[59] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 15.000000
			Environment.Fog.FogEnd		= 200.000000
			Environment.Fog.FogDensity1	= 0.240000
			Environment.Fog.FogDensity2	= 0.610000
			Environment.Fog.ColorDensity1	= 1.000000
			Environment.Fog.ColorDensity2	= 1.530000
			Environment.Fog.HorzDensity	= 2.020000
			Environment.Fog.HorzPower		= 2.260000
			Environment.Fog.HeightStart	= 10.000000
			Environment.Fog.HeightEnd		= 52.000000
			Environment.Fog.HeightDensity	= 2.810000
			Environment.Fog.FogColor1		= 0xFFA02910
			Environment.Fog.FogColor2		= 0xFFD15F2E
			Environment.Fog.FogColor3		= 0xFF888B54
			Environment.Fog.FogColor4		= 0xFF7F7F7F

			tag = tag + Environment.Fog.Tag
		end

		return tag
	end
}

EnvFuncList[60] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 10.000000
			Environment.Fog.FogEnd		= 200.000000
			Environment.Fog.FogDensity1	= 1.000000
			Environment.Fog.FogDensity2	= 1.000000
			Environment.Fog.ColorDensity1	= 1.000000
			Environment.Fog.ColorDensity2	= 1.000000
			Environment.Fog.HorzDensity	= 2.000000
			Environment.Fog.HorzPower		= 0.370000
			Environment.Fog.HeightStart	= 0.000000
			Environment.Fog.HeightEnd		= 0.000000
			Environment.Fog.HeightDensity	= 0.000000
			Environment.Fog.FogColor1		= 0xFFFF8080
			Environment.Fog.FogColor2		= 0xFF0D206C
			Environment.Fog.FogColor3		= 0xFF888B54
			Environment.Fog.FogColor4		= 0xFF7F7F7F

			tag = tag + Environment.Fog.Tag
		end

		return tag
	end
}

EnvFuncList[61] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 55.000000
			Environment.Fog.FogEnd		= 200.000000
			Environment.Fog.FogDensity1	= 0.370000
			Environment.Fog.FogDensity2	= 1.650000
			Environment.Fog.ColorDensity1	= 0.240000
			Environment.Fog.ColorDensity2	= 1.000000
			Environment.Fog.HorzDensity	= 3.420000
			Environment.Fog.HorzPower		= 1.000000
			Environment.Fog.HeightStart	= 12.000000
			Environment.Fog.HeightEnd		= 55.000000
			Environment.Fog.HeightDensity	= 2.380000
			Environment.Fog.FogColor1		= 0xFFD2A0E2
			Environment.Fog.FogColor2		= 0xFF3252C0
			Environment.Fog.FogColor3		= 0xFF465CB5
			Environment.Fog.FogColor4		= 0xFF4A50B5

			tag = tag + Environment.Fog.Tag
		end

		return tag
	end
}

EnvFuncList[62] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 25.000000
			Environment.Fog.FogEnd		= 256.000000
			Environment.Fog.FogDensity1	= 0.240000
			Environment.Fog.FogDensity2	= 4.500000
			Environment.Fog.ColorDensity1	= 0.550000
			Environment.Fog.ColorDensity2	= 1.220000
			Environment.Fog.HorzDensity	= 5.800000
			Environment.Fog.HorzPower		= 3.970000
			Environment.Fog.HeightStart	= 0.000000
			Environment.Fog.HeightEnd		= 40.000000
			Environment.Fog.HeightDensity	= 4.000000
			Environment.Fog.FogColor1		= 0xFF6C59BB
			Environment.Fog.FogColor2		= 0xFF3A588F
			Environment.Fog.FogColor3		= 0xFF4E67A9
			Environment.Fog.FogColor4		= 0xFF36336F

			tag = tag + Environment.Fog.Tag
		end

		return tag
	end
}

EnvFuncList[63] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 37.000000
			Environment.Fog.FogEnd		= 208.000000
			Environment.Fog.FogDensity1	= 0.120000
			Environment.Fog.FogDensity2	= 1.000000
			Environment.Fog.ColorDensity1	= 1.000000
			Environment.Fog.ColorDensity2	= 1.000000
			Environment.Fog.HorzDensity	= 2.870000
			Environment.Fog.HorzPower		= 1.590000
			Environment.Fog.HeightStart	= 0.000000
			Environment.Fog.HeightEnd		= 43.000000
			Environment.Fog.HeightDensity	= 2.320000
			Environment.Fog.FogColor1		= 0xFF55EEF7
			Environment.Fog.FogColor2		= 0xFF1F7EE9
			Environment.Fog.FogColor3		= 0xFF888B54
			Environment.Fog.FogColor4		= 0xFF7F7F7F

			tag = tag + Environment.Fog.Tag
		end

		return tag
	end
}

EnvFuncList[64] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 31.000000
			Environment.Fog.FogEnd		= 200.000000
			Environment.Fog.FogDensity1	= 1.000000
			Environment.Fog.FogDensity2	= 1.000000
			Environment.Fog.ColorDensity1	= 1.000000
			Environment.Fog.ColorDensity2	= 1.000000
			Environment.Fog.HorzDensity	= 2.000000
			Environment.Fog.HorzPower		= 1.710000
			Environment.Fog.HeightStart	= 6.000000
			Environment.Fog.HeightEnd		= 49.000000
			Environment.Fog.HeightDensity	= 6.000000
			Environment.Fog.FogColor1		= 0xFF25DAC8
			Environment.Fog.FogColor2		= 0xFF4AA69A
			Environment.Fog.FogColor3		= 0xFF888B54
			Environment.Fog.FogColor4		= 0xFF7F7F7F

			tag = tag + Environment.Fog.Tag
		end

		return tag
	end
}

EnvFuncList[65] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 18.000000
			Environment.Fog.FogEnd		= 200.000000
			Environment.Fog.FogDensity1	= 0.430000
			Environment.Fog.FogDensity2	= 1.000000
			Environment.Fog.ColorDensity1	= 1.000000
			Environment.Fog.ColorDensity2	= 1.000000
			Environment.Fog.HorzDensity	= 2.000000
			Environment.Fog.HorzPower		= 1.000000
			Environment.Fog.HeightStart	= 6.000000
			Environment.Fog.HeightEnd		= 43.000000
			Environment.Fog.HeightDensity	= 3.660000
			Environment.Fog.FogColor1		= 0xFFFE873F
			Environment.Fog.FogColor2		= 0xFFD15547
			Environment.Fog.FogColor3		= 0xFFFE873F
			Environment.Fog.FogColor4		= 0xFFD15547

			tag = tag + Environment.Fog.Tag
		end

		return tag
	end
}

EnvFuncList[66] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 43.000000
			Environment.Fog.FogEnd		= 256.000000
			Environment.Fog.FogDensity1	= 0.920000
			Environment.Fog.FogDensity2	= 1.160000
			Environment.Fog.ColorDensity1	= 0.430000
			Environment.Fog.ColorDensity2	= 1.530000
			Environment.Fog.HorzDensity	= 1.890000
			Environment.Fog.HorzPower		= 1.770000
			Environment.Fog.HeightStart	= 6.000000
			Environment.Fog.HeightEnd		= 55.000000
			Environment.Fog.HeightDensity	= 5.370000
			Environment.Fog.FogColor1		= 0xFF6C81D0
			Environment.Fog.FogColor2		= 0xFF4355BC
			Environment.Fog.FogColor3		= 0xFF4652B9
			Environment.Fog.FogColor4		= 0xFF584671

			tag = tag + Environment.Fog.Tag
		end

		return tag
	end
}

EnvFuncList[67] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 43.000000
			Environment.Fog.FogEnd		= 324.000000
			Environment.Fog.FogDensity1	= 0.370000
			Environment.Fog.FogDensity2	= 2.810000
			Environment.Fog.ColorDensity1	= 0.370000
			Environment.Fog.ColorDensity2	= 4.270000
			Environment.Fog.HorzDensity	= 2.380000
			Environment.Fog.HorzPower		= 1.590000
			Environment.Fog.HeightStart	= 12.000000
			Environment.Fog.HeightEnd		= 61.000000
			Environment.Fog.HeightDensity	= 4.460000
			Environment.Fog.FogColor1		= 0xFFFF4009
			Environment.Fog.FogColor2		= 0xFF4657B9
			Environment.Fog.FogColor3		= 0xFFFF4009
			Environment.Fog.FogColor4		= 0xFF4657B9

			tag = tag + Environment.Fog.Tag
		end

		return tag
	end
}

EnvFuncList[68] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 24.000000
			Environment.Fog.FogEnd		= 202.000000
			Environment.Fog.FogDensity1	= 1.000000
			Environment.Fog.FogDensity2	= 2.560000
			Environment.Fog.ColorDensity1	= 0.240000
			Environment.Fog.ColorDensity2	= 1.530000
			Environment.Fog.HorzDensity	= 2.000000
			Environment.Fog.HorzPower		= 1.650000
			Environment.Fog.HeightStart	= 12.000000
			Environment.Fog.HeightEnd		= 61.000000
			Environment.Fog.HeightDensity	= 1.710000
			Environment.Fog.FogColor1		= 0xFF8686F2
			Environment.Fog.FogColor2		= 0xFF4777B8
			Environment.Fog.FogColor3		= 0xFF888B54
			Environment.Fog.FogColor4		= 0xFF7F7F7F

			tag = tag + Environment.Fog.Tag
		end

		return tag
	end
}

EnvFuncList[69] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 18.000000
			Environment.Fog.FogEnd		= 171.000000
			Environment.Fog.FogDensity1	= 0.490000
			Environment.Fog.FogDensity2	= 0.790000
			Environment.Fog.ColorDensity1	= 0.610000
			Environment.Fog.ColorDensity2	= 1.000000
			Environment.Fog.HorzDensity	= 1.530000
			Environment.Fog.HorzPower		= 2.140000
			Environment.Fog.HeightStart	= 12.000000
			Environment.Fog.HeightEnd		= 53.000000
			Environment.Fog.HeightDensity	= 2.020000
			Environment.Fog.FogColor1		= 0xFF9982F7
			Environment.Fog.FogColor2		= 0xFF6772CD
			Environment.Fog.FogColor3		= 0xFF7150F3
			Environment.Fog.FogColor4		= 0xFF3844AB

			tag = tag + Environment.Fog.Tag
		end

		return tag
	end
}

EnvFuncList[70] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 31.000000
			Environment.Fog.FogEnd		= 104.000000
			Environment.Fog.FogDensity1	= 2.500000
			Environment.Fog.FogDensity2	= 0.240000
			Environment.Fog.ColorDensity1	= 0.980000
			Environment.Fog.ColorDensity2	= 0.730000
			Environment.Fog.HorzDensity	= 1.890000
			Environment.Fog.HorzPower		= 2.560000
			Environment.Fog.HeightStart	= 12.000000
			Environment.Fog.HeightEnd		= 37.000000
			Environment.Fog.HeightDensity	= 1.590000
			Environment.Fog.FogColor1		= 0xFF4183BE
			Environment.Fog.FogColor2		= 0xFF5065AF
			Environment.Fog.FogColor3		= 0xFF888B54
			Environment.Fog.FogColor4		= 0xFF7F7F7F

			tag = tag + Environment.Fog.Tag
		end

		return tag
	end
}

EnvFuncList[71] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 0.000000
			Environment.Fog.FogEnd		= 256.000000
			Environment.Fog.FogDensity1	= 1.530000
			Environment.Fog.FogDensity2	= 1.160000
			Environment.Fog.ColorDensity1	= 1.000000
			Environment.Fog.ColorDensity2	= 1.000000
			Environment.Fog.HorzDensity	= 2.000000
			Environment.Fog.HorzPower		= 1.000000
			Environment.Fog.HeightStart	= 6.000000
			Environment.Fog.HeightEnd		= 49.000000
			Environment.Fog.HeightDensity	= 0.730000
			Environment.Fog.FogColor1		= 0xFFE97558
			Environment.Fog.FogColor2		= 0xFF4962B6
			Environment.Fog.FogColor3		= 0xFF888B54
			Environment.Fog.FogColor4		= 0xFF7F7F7F

			tag = tag + Environment.Fog.Tag
		end

		return tag
	end
}

EnvFuncList[72] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 43.000000
			Environment.Fog.FogEnd		= 800.000000
			Environment.Fog.FogDensity1	= 1.890000
			Environment.Fog.FogDensity2	= 2.910000
			Environment.Fog.ColorDensity1	= 0.480000
			Environment.Fog.ColorDensity2	= 2.630000
			Environment.Fog.HorzDensity	= 1.700000
			Environment.Fog.HorzPower		= 8.000000
			Environment.Fog.HeightStart	= 0.000000
			Environment.Fog.HeightEnd		= 19.000000
			Environment.Fog.HeightDensity	= 2.690000
			Environment.Fog.FogColor1		= 0xFFC99936
			Environment.Fog.FogColor2		= 0xFF815427
			Environment.Fog.FogColor3		= 0xFF587A65
			Environment.Fog.FogColor4		= 0xFF556AAA

			tag = tag + Environment.Fog.Tag
		end

		return tag
	end
}

EnvFuncList[73] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 282.000000
			Environment.Fog.FogEnd		= 715.000000
			Environment.Fog.FogDensity1	= 0.060000
			Environment.Fog.FogDensity2	= 1.220000
			Environment.Fog.ColorDensity1	= 0.180000
			Environment.Fog.ColorDensity2	= 1.890000
			Environment.Fog.HorzDensity	= 2.260000
			Environment.Fog.HorzPower		= 1.100000
			Environment.Fog.HeightStart	= 0.000000
			Environment.Fog.HeightEnd		= 0.000000
			Environment.Fog.HeightDensity	= 0.000000
			Environment.Fog.FogColor1		= 0xFF2C59D3
			Environment.Fog.FogColor2		= 0xFFABC1E7
			Environment.Fog.FogColor3		= 0xFF4380BC
			Environment.Fog.FogColor4		= 0xFF273952

			tag = tag + Environment.Fog.Tag
		end

		return tag
	end
}

EnvFuncList[74] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 49.000000
			Environment.Fog.FogEnd		= 200.000000
			Environment.Fog.FogDensity1	= 1.000000
			Environment.Fog.FogDensity2	= 1.000000
			Environment.Fog.ColorDensity1	= 1.000000
			Environment.Fog.ColorDensity2	= 1.000000
			Environment.Fog.HorzDensity	= 2.000000
			Environment.Fog.HorzPower		= 1.000000
			Environment.Fog.HeightStart	= 0.000000
			Environment.Fog.HeightEnd		= 0.000000
			Environment.Fog.HeightDensity	= 0.000000
			Environment.Fog.FogColor1		= 0xFF8B9AEB
			Environment.Fog.FogColor2		= 0xFF5FA088
			Environment.Fog.FogColor3		= 0xFF888B54
			Environment.Fog.FogColor4		= 0xFF7F7F7F

			tag = tag + Environment.Fog.Tag
		end

		return tag
	end
}

EnvFuncList[75] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 49.000000
			Environment.Fog.FogEnd		= 354.000000
			Environment.Fog.FogDensity1	= 0.180000
			Environment.Fog.FogDensity2	= 2.440000
			Environment.Fog.ColorDensity1	= 0.180000
			Environment.Fog.ColorDensity2	= 2.990000
			Environment.Fog.HorzDensity	= 0.730000
			Environment.Fog.HorzPower		= 1.280000
			Environment.Fog.HeightStart	= 0.000000
			Environment.Fog.HeightEnd		= 0.000000
			Environment.Fog.HeightDensity	= 0.000000
			Environment.Fog.FogColor1		= 0xFF669CB9
			Environment.Fog.FogColor2		= 0xFF416D9A
			Environment.Fog.FogColor3		= 0xFF253A5C
			Environment.Fog.FogColor4		= 0xFF59678A

			tag = tag + Environment.Fog.Tag
		end

		return tag
	end
}

EnvFuncList[77] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 15.000000
			Environment.Fog.FogEnd		= 200.000000
			Environment.Fog.FogDensity1	= 1.000000
			Environment.Fog.FogDensity2	= 2.320000
			Environment.Fog.ColorDensity1	= 0.920000
			Environment.Fog.ColorDensity2	= 1.710000
			Environment.Fog.HorzDensity	= 3.360000
			Environment.Fog.HorzPower		= 1.890000
			Environment.Fog.HeightStart	= 0.000000
			Environment.Fog.HeightEnd		= 0.000000
			Environment.Fog.HeightDensity	= 0.000000
			Environment.Fog.FogColor1		= 0xFF5697C7
			Environment.Fog.FogColor2		= 0xFF3473D1
			Environment.Fog.FogColor3		= 0xFF888B54
			Environment.Fog.FogColor4		= 0xFF7F7F7F

			tag = tag + Environment.Fog.Tag
		end

		return tag
	end
}

EnvFuncList[78] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 20.000000
			Environment.Fog.FogEnd		= 104.000000
			Environment.Fog.FogDensity1	= 0.430000
			Environment.Fog.FogDensity2	= 2.690000
			Environment.Fog.ColorDensity1	= 1.000000
			Environment.Fog.ColorDensity2	= 1.000000
			Environment.Fog.HorzDensity	= 0.370000
			Environment.Fog.HorzPower		= 0.850000
			Environment.Fog.HeightStart	= 0.000000
			Environment.Fog.HeightEnd		= 0.000000
			Environment.Fog.HeightDensity	= 0.000000
			Environment.Fog.FogColor1		= 0xFF5CCDE9
			Environment.Fog.FogColor2		= 0xFF63299C
			Environment.Fog.FogColor3		= 0xFF888B54
			Environment.Fog.FogColor4		= 0xFF7F7F7F

			tag = tag + Environment.Fog.Tag
		end

		return tag
	end
}

EnvFuncList[80] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 25.000000
			Environment.Fog.FogEnd		= 195.000000
			Environment.Fog.FogDensity1	= 1.000000
			Environment.Fog.FogDensity2	= 1.000000
			Environment.Fog.ColorDensity1	= 1.000000
			Environment.Fog.ColorDensity2	= 1.000000
			Environment.Fog.HorzDensity	= 2.380000
			Environment.Fog.HorzPower		= 2.200000
			Environment.Fog.HeightStart	= 0.000000
			Environment.Fog.HeightEnd		= 0.000000
			Environment.Fog.HeightDensity	= 0.000000
			Environment.Fog.FogColor1		= 0xFF388BE7
			Environment.Fog.FogColor2		= 0xFFD54A71
			Environment.Fog.FogColor3		= 0xFF888B54
			Environment.Fog.FogColor4		= 0xFF7F7F7F

			tag = tag + Environment.Fog.Tag
		end

		return tag
	end
}

EnvFuncList[81] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 79.000000
			Environment.Fog.FogEnd		= 550.000000
			Environment.Fog.FogDensity1	= 0.420000
			Environment.Fog.FogDensity2	= 3.480000
			Environment.Fog.ColorDensity1	= 0.240000
			Environment.Fog.ColorDensity2	= 1.100000
			Environment.Fog.HorzDensity	= 2.870000
			Environment.Fog.HorzPower		= 0.970000
			Environment.Fog.HeightStart	= 55.000000
			Environment.Fog.HeightEnd		= 90.000000
			Environment.Fog.HeightDensity	= 2.320000
			Environment.Fog.FogColor1		= 0xFFBACBDA
			Environment.Fog.FogColor2		= 0xFF7997A4
			Environment.Fog.FogColor3		= 0xFF315175
			Environment.Fog.FogColor4		= 0xFF223453

			tag = tag + Environment.Fog.Tag
		end

		return tag
	end
}

EnvFuncList[100] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 85.000000
			Environment.Fog.FogEnd		= 776.000000
			Environment.Fog.FogDensity1	= 0.240000
			Environment.Fog.FogDensity2	= 2.080000
			Environment.Fog.ColorDensity1	= 1.280000
			Environment.Fog.ColorDensity2	= 4.810000
			Environment.Fog.HorzDensity	= 0.670000
			Environment.Fog.HorzPower		= 1.650000
			Environment.Fog.HeightStart	= 0.000000
			Environment.Fog.HeightEnd		= 0.000000
			Environment.Fog.HeightDensity	= 0.000000
			Environment.Fog.FogColor1		= 0xFF4A6B97
			Environment.Fog.FogColor2		= 0xFFA57D43
			Environment.Fog.FogColor3		= 0xFF36465C
			Environment.Fog.FogColor4		= 0xFF384467

			tag = tag + Environment.Fog.Tag
		end

		return tag
	end
}

EnvFuncList[101] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 150.000000
			Environment.Fog.FogEnd		= 400.000000
			Environment.Fog.FogDensity1	= 0.800000
			Environment.Fog.FogDensity2	= 3.480000
			Environment.Fog.ColorDensity1	= 0.420000
			Environment.Fog.ColorDensity2	= 0.670000
			Environment.Fog.HorzDensity	= 4.090000
			Environment.Fog.HorzPower		= 1.000000
			Environment.Fog.HeightStart	= 0.000000
			Environment.Fog.HeightEnd		= 0.000000
			Environment.Fog.HeightDensity	= 0.000000
			Environment.Fog.FogColor1		= 0xFF9DB3D0
			Environment.Fog.FogColor2		= 0xFF889DC4
			Environment.Fog.FogColor3		= 0xFFA5AFDA
			Environment.Fog.FogColor4		= 0xFF4066BF

			tag = tag + Environment.Fog.Tag
		end

		if Environment.Sun.Valid == false then
			Environment.Sun.Valid        = true
			Environment.Sun.Visible      = false
			Environment.Sun.SunPower     = 0.000000
			Environment.Sun.SunPower_N   = 0.000000

			tag = tag + Environment.Sun.Tag
		end

		return tag
	end
}

EnvFuncList[102] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 120.000000
			Environment.Fog.FogEnd		= 460.000000
			Environment.Fog.FogDensity1	= 0.700000
			Environment.Fog.FogDensity2	= 3.480000
			Environment.Fog.ColorDensity1	= 0.600000
			Environment.Fog.ColorDensity2	= 0.670000
			Environment.Fog.HorzDensity	= 4.090000
			Environment.Fog.HorzPower		= 1.000000
			Environment.Fog.HeightStart	= 0.000000
			Environment.Fog.HeightEnd		= 0.000000
			Environment.Fog.HeightDensity	= 0.000000
			Environment.Fog.FogColor1		= 0xFF96C0DA
			Environment.Fog.FogColor2		= 0xFF8199D8
			Environment.Fog.FogColor3		= 0xFF4D7DD9
			Environment.Fog.FogColor4		= 0xFF5870C0

			tag = tag + Environment.Fog.Tag
		end

		if Environment.Sun.Valid == false then
			Environment.Sun.Valid        = true
			Environment.Sun.Visible      = false
			Environment.Sun.SunPower     = 0.000000
			Environment.Sun.SunPower_N   = 0.000000

			tag = tag + Environment.Sun.Tag
		end

		if Environment.Lightning.Valid == false then
			Environment.Lightning.Valid          = true
			Environment.Lightning.Visible        = true
			Environment.Lightning.Power          = 0.020000
			Environment.Lightning.Start          = 150.000000
			Environment.Lightning.End            = 60.000000
			Environment.Lightning.Time           = 150
			Environment.Lightning.Num            = 2
			Environment.Lightning.TimeInterval   = 140
			Environment.Lightning.BetweenTime    = 90000
			Environment.Lightning.BetweenRand    = 7000
			Environment.Lightning.LightningSFX      = 3

			tag = tag + Environment.Lightning.Tag
		end

		return tag
	end
}

EnvFuncList[103] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 90.000000
			Environment.Fog.FogEnd		= 380.000000
			Environment.Fog.FogDensity1	= 0.800000
			Environment.Fog.FogDensity2	= 3.480000
			Environment.Fog.ColorDensity1	= 0.720000
			Environment.Fog.ColorDensity2	= 0.670000
			Environment.Fog.HorzDensity	= 4.090000
			Environment.Fog.HorzPower		= 1.000000
			Environment.Fog.HeightStart	= 0.000000
			Environment.Fog.HeightEnd		= 0.000000
			Environment.Fog.HeightDensity	= 0.000000
			Environment.Fog.FogColor1		= 0xFF9EB6C7
			Environment.Fog.FogColor2		= 0xFF7C99DC
			Environment.Fog.FogColor3		= 0xFF5672D1
			Environment.Fog.FogColor4		= 0xFF4D78B3

			tag = tag + Environment.Fog.Tag
		end

		if Environment.Sun.Valid == false then
			Environment.Sun.Valid        = true
			Environment.Sun.Visible      = false
			Environment.Sun.SunPower     = 0.000000
			Environment.Sun.SunPower_N   = 0.000000

			tag = tag + Environment.Sun.Tag
		end

		if Environment.Rain.Valid == false then
			Environment.Rain.Valid        = true
			Environment.Rain.Visible      = true
			Environment.Rain.RainSpeed    = 0.200000
			Environment.Rain.RainSize     = 0.000000
			Environment.Rain.RainLife     = 40
			Environment.Rain.RainColor    = 0xFFDEF2F8
			Environment.Rain.RainGFX      = "程序联入\\小雨地面效果.gfx"
			Environment.Rain.RainSFX      = 2

			tag = tag + Environment.Rain.Tag
		end

		return tag
	end
}

EnvFuncList[104] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 95.000000
			Environment.Fog.FogEnd		= 380.000000
			Environment.Fog.FogDensity1	= 0.500000
			Environment.Fog.FogDensity2	= 3.480000
			Environment.Fog.ColorDensity1	= 0.500000
			Environment.Fog.ColorDensity2	= 0.670000
			Environment.Fog.HorzDensity	= 4.090000
			Environment.Fog.HorzPower		= 1.000000
			Environment.Fog.HeightStart	= 0.000000
			Environment.Fog.HeightEnd		= 0.000000
			Environment.Fog.HeightDensity	= 0.000000
			Environment.Fog.FogColor1		= 0xFF7592C8
			Environment.Fog.FogColor2		= 0xFF749CC9
			Environment.Fog.FogColor3		= 0xFF5283C5
			Environment.Fog.FogColor4		= 0xFF546AAB

			tag = tag + Environment.Fog.Tag
		end

		if Environment.Sun.Valid == false then
			Environment.Sun.Valid        = true
			Environment.Sun.Visible      = false
			Environment.Sun.SunPower     = 0.000000
			Environment.Sun.SunPower_N   = 0.000000

			tag = tag + Environment.Sun.Tag
		end

		if Environment.Rain.Valid == false then
			Environment.Rain.Valid        = true
			Environment.Rain.Visible      = true
			Environment.Rain.RainSpeed    = 0.300000
			Environment.Rain.RainSize     = 0.000000
			Environment.Rain.RainLife     = 100
			Environment.Rain.RainColor    = 0xFFCBE3F8
			Environment.Rain.RainGFX      = "程序联入\\大雨地面效果.gfx"
			Environment.Rain.RainSFX      = 1

			tag = tag + Environment.Rain.Tag
		end

		Environment.SceneCtrl.EnvStyle = ""
		Environment.SceneCtrl.ColorMap = "Maps\\Rain_Colormapping.dds"

		return tag
	end
}

EnvFuncList[105] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 85.000000
			Environment.Fog.FogEnd		= 380.000000
			Environment.Fog.FogDensity1	= 0.700000
			Environment.Fog.FogDensity2	= 3.480000
			Environment.Fog.ColorDensity1	= 0.620000
			Environment.Fog.ColorDensity2	= 0.670000
			Environment.Fog.HorzDensity	= 4.090000
			Environment.Fog.HorzPower		= 1.000000
			Environment.Fog.HeightStart	= 0.000000
			Environment.Fog.HeightEnd		= 0.000000
			Environment.Fog.HeightDensity	= 0.000000
			Environment.Fog.FogColor1		= 0xFF7EA5B6
			Environment.Fog.FogColor2		= 0xFF5981A2
			Environment.Fog.FogColor3		= 0xFF43749C
			Environment.Fog.FogColor4		= 0xFF536BAC

			tag = tag + Environment.Fog.Tag
		end

		if Environment.Sun.Valid == false then
			Environment.Sun.Valid        = true
			Environment.Sun.Visible      = false
			Environment.Sun.SunPower     = 0.000000
			Environment.Sun.SunPower_N   = 0.000000

			tag = tag + Environment.Sun.Tag
		end

		if Environment.Rain.Valid == false then
			Environment.Rain.Valid        = true
			Environment.Rain.Visible      = true
			Environment.Rain.RainSpeed    = 0.500000
			Environment.Rain.RainSize     = 0.000000
			Environment.Rain.RainLife     = 100
			Environment.Rain.RainColor    = 0xFFD6E9F1
			Environment.Rain.RainGFX      = "程序联入\\暴雨地面效果.gfx"
			Environment.Rain.RainSFX      = 1

			tag = tag + Environment.Rain.Tag
		end

		if Environment.Lightning.Valid == false then
			Environment.Lightning.Valid          = true
			Environment.Lightning.Visible        = true
			Environment.Lightning.Power          = 0.010000
			Environment.Lightning.Start          = 220.000000
			Environment.Lightning.End            = 60.000000
			Environment.Lightning.Time           = 120
			Environment.Lightning.Num            = 3
			Environment.Lightning.TimeInterval   = 150
			Environment.Lightning.BetweenTime    = 10000
			Environment.Lightning.BetweenRand    = 7000
			Environment.Lightning.LightningSFX      = 3

			tag = tag + Environment.Lightning.Tag
		end

		Environment.SceneCtrl.EnvStyle = ""
		Environment.SceneCtrl.ColorMap = "Maps\\Rain_Colormapping.dds"

		return tag
	end
}

EnvFuncList[106] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 85.000000
			Environment.Fog.FogEnd		= 380.000000
			Environment.Fog.FogDensity1	= 1.000000
			Environment.Fog.FogDensity2	= 3.480000
			Environment.Fog.ColorDensity1	= 0.600000
			Environment.Fog.ColorDensity2	= 0.670000
			Environment.Fog.HorzDensity	= 4.090000
			Environment.Fog.HorzPower		= 1.000000
			Environment.Fog.HeightStart	= 0.000000
			Environment.Fog.HeightEnd		= 0.000000
			Environment.Fog.HeightDensity	= 0.000000
			Environment.Fog.FogColor1		= 0xFF9EBBE7
			Environment.Fog.FogColor2		= 0xFF70ACE2
			Environment.Fog.FogColor3		= 0xFF888B54
			Environment.Fog.FogColor4		= 0xFF7F7F7F

			tag = tag + Environment.Fog.Tag
		end

		if Environment.Sun.Valid == false then
			Environment.Sun.Valid        = true
			Environment.Sun.Visible      = false
			Environment.Sun.SunPower     = 0.000000
			Environment.Sun.SunPower_N   = 0.000000

			tag = tag + Environment.Sun.Tag
		end

		if Environment.Snow.Valid == false then
			Environment.Snow.Valid        = true
			Environment.Snow.Visible      = true
			Environment.Snow.SnowSpeed    = 0.300000
			Environment.Snow.SnowSize     = 0.100000
			Environment.Snow.SnowLife     = 90
			Environment.Snow.SnowColor    = 0xFFAEE1F4
			Environment.Snow.SnowGFX      = "程序联入\\暴雪地面效果.gfx"
			Environment.Rain.SnowSFX      = 4

			tag = tag + Environment.Snow.Tag
		end

		Environment.SceneCtrl.EnvStyle = ""
		Environment.SceneCtrl.ColorMap = "Maps\\Rain_Colormapping.dds"

		return tag
	end
}

EnvFuncList[107] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 24.000000
			Environment.Fog.FogEnd		= 380.000000
			Environment.Fog.FogDensity1	= 1.710000
			Environment.Fog.FogDensity2	= 3.480000
			Environment.Fog.ColorDensity1	= 0.920000
			Environment.Fog.ColorDensity2	= 0.670000
			Environment.Fog.HorzDensity	= 4.090000
			Environment.Fog.HorzPower		= 1.000000
			Environment.Fog.HeightStart	= 0.000000
			Environment.Fog.HeightEnd		= 0.000000
			Environment.Fog.HeightDensity	= 0.000000
			Environment.Fog.FogColor1		= 0xFFD3A38B
			Environment.Fog.FogColor2		= 0xFF8F9EC9
			Environment.Fog.FogColor3		= 0xFF888B54
			Environment.Fog.FogColor4		= 0xFF7F7F7F

			tag = tag + Environment.Fog.Tag
		end

		if Environment.Sun.Valid == false then
			Environment.Sun.Valid        = true
			Environment.Sun.Visible      = false
			Environment.Sun.SunPower     = 0.000000
			Environment.Sun.SunPower_N   = 0.000000

			tag = tag + Environment.Sun.Tag
		end

		return tag
	end
}

EnvFuncList[108] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 24.000000
			Environment.Fog.FogEnd		= 380.000000
			Environment.Fog.FogDensity1	= 1.710000
			Environment.Fog.FogDensity2	= 3.480000
			Environment.Fog.ColorDensity1	= 0.920000
			Environment.Fog.ColorDensity2	= 0.670000
			Environment.Fog.HorzDensity	= 4.090000
			Environment.Fog.HorzPower		= 1.000000
			Environment.Fog.HeightStart	= 0.000000
			Environment.Fog.HeightEnd		= 0.000000
			Environment.Fog.HeightDensity	= 0.000000
			Environment.Fog.FogColor1		= 0xFFD3A38B
			Environment.Fog.FogColor2		= 0xFF8F9EC9
			Environment.Fog.FogColor3		= 0xFF888B54
			Environment.Fog.FogColor4		= 0xFF7F7F7F

			tag = tag + Environment.Fog.Tag
		end

		if Environment.Sun.Valid == false then
			Environment.Sun.Valid        = true
			Environment.Sun.Visible      = false
			Environment.Sun.SunPower     = 0.000000
			Environment.Sun.SunPower_N   = 0.000000

			tag = tag + Environment.Sun.Tag
		end

		if Environment.Rain.Valid == false then
			Environment.Rain.Valid        = true
			Environment.Rain.Visible      = true
			Environment.Rain.RainSpeed    = 0.500000
			Environment.Rain.RainSize     = 0.000000
			Environment.Rain.RainLife     = 100
			Environment.Rain.RainColor    = 0xFFEAF0FD
			Environment.Rain.RainGFX      = "程序联入\\大风雨地面效果.gfx"
			Environment.Rain.RainSFX      = 1

			tag = tag + Environment.Rain.Tag
		end

		Environment.SceneCtrl.EnvStyle = ""
		Environment.SceneCtrl.ColorMap = "Maps\\Rain_Colormapping.dds"

		return tag
	end
}

EnvFuncList[109] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 44.000000
			Environment.Fog.FogEnd		= 380.000000
			Environment.Fog.FogDensity1	= 1.710000
			Environment.Fog.FogDensity2	= 3.480000
			Environment.Fog.ColorDensity1	= 0.920000
			Environment.Fog.ColorDensity2	= 0.670000
			Environment.Fog.HorzDensity	= 4.090000
			Environment.Fog.HorzPower		= 1.000000
			Environment.Fog.HeightStart	= 0.000000
			Environment.Fog.HeightEnd		= 0.000000
			Environment.Fog.HeightDensity	= 0.000000
			Environment.Fog.FogColor1		= 0xFFA0C9E7
			Environment.Fog.FogColor2		= 0xFF7095CD
			Environment.Fog.FogColor3		= 0xFF888B54
			Environment.Fog.FogColor4		= 0xFF7F7F7F

			tag = tag + Environment.Fog.Tag
		end

		if Environment.Sun.Valid == false then
			Environment.Sun.Valid        = true
			Environment.Sun.Visible      = false
			Environment.Sun.SunPower     = 0.000000
			Environment.Sun.SunPower_N   = 0.000000

			tag = tag + Environment.Sun.Tag
		end

		if Environment.Rain.Valid == false then
			Environment.Rain.Valid        = true
			Environment.Rain.Visible      = true
			Environment.Rain.RainSpeed    = 0.400000
			Environment.Rain.RainSize     = 0.010000
			Environment.Rain.RainLife     = 90
			Environment.Rain.RainColor    = 0xFFE0FEF7
			Environment.Rain.RainGFX      = "程序联入\\雨丝地面效果.gfx"
			Environment.Rain.RainSFX      = 2

			tag = tag + Environment.Rain.Tag
		end

		return tag
	end
}

EnvFuncList[110] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 700.000000
			Environment.Fog.FogEnd		= 1200.000000
			Environment.Fog.FogDensity1	= 0.000000
			Environment.Fog.FogDensity2	= 0.000000
			Environment.Fog.ColorDensity1	= 0.000000
			Environment.Fog.ColorDensity2	= 0.000000
			Environment.Fog.HorzDensity	= 0.000000
			Environment.Fog.HorzPower		= 0.000000
			Environment.Fog.HeightStart	= 0.000000
			Environment.Fog.HeightEnd		= 0.000000
			Environment.Fog.HeightDensity	= 0.000000
			Environment.Fog.FogColor1		= 0xFF6187EB
			Environment.Fog.FogColor2		= 0xFF6187EB
			Environment.Fog.FogColor3		= 0xFF888B54
			Environment.Fog.FogColor4		= 0xFF7F7F7F

			tag = tag + Environment.Fog.Tag
		end

		if Environment.Sun.Valid == false then
			Environment.Sun.Valid        = true
			Environment.Sun.Visible      = false
			Environment.Sun.SunPower     = 0.000000
			Environment.Sun.SunPower_N   = 0.000000

			tag = tag + Environment.Sun.Tag
		end

		return tag
	end
}

EnvFuncList[111] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 25.000000
			Environment.Fog.FogEnd		= 0.000000
			Environment.Fog.FogDensity1	= 0.000000
			Environment.Fog.FogDensity2	= 0.000000
			Environment.Fog.ColorDensity1	= 0.000000
			Environment.Fog.ColorDensity2	= 0.000000
			Environment.Fog.HorzDensity	= 0.000000
			Environment.Fog.HorzPower		= 0.000000
			Environment.Fog.HeightStart	= 0.000000
			Environment.Fog.HeightEnd		= 0.000000
			Environment.Fog.HeightDensity	= 0.000000
			Environment.Fog.FogColor1		= 0xFF000000
			Environment.Fog.FogColor2		= 0xFF000000
			Environment.Fog.FogColor3		= 0xFF888B54
			Environment.Fog.FogColor4		= 0xFF7F7F7F

			tag = tag + Environment.Fog.Tag
		end

		if Environment.Sun.Valid == false then
			Environment.Sun.Valid        = true
			Environment.Sun.Visible      = false
			Environment.Sun.SunPower     = 0.000000
			Environment.Sun.SunPower_N   = 0.000000

			tag = tag + Environment.Sun.Tag
		end

		return tag
	end
}

EnvFuncList[112] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 0.000000
			Environment.Fog.FogEnd		= 0.000000
			Environment.Fog.FogDensity1	= 0.000000
			Environment.Fog.FogDensity2	= 0.000000
			Environment.Fog.ColorDensity1	= 0.000000
			Environment.Fog.ColorDensity2	= 0.000000
			Environment.Fog.HorzDensity	= 0.000000
			Environment.Fog.HorzPower		= 0.000000
			Environment.Fog.HeightStart	= 0.000000
			Environment.Fog.HeightEnd		= 0.000000
			Environment.Fog.HeightDensity	= 0.000000
			Environment.Fog.FogColor1		= 0xFF000000
			Environment.Fog.FogColor2		= 0xFF000000
			Environment.Fog.FogColor3		= 0xFF888B54
			Environment.Fog.FogColor4		= 0xFF7F7F7F

			tag = tag + Environment.Fog.Tag
		end

		if Environment.Sun.Valid == false then
			Environment.Sun.Valid        = true
			Environment.Sun.Visible      = false
			Environment.Sun.SunPower     = 0.000000
			Environment.Sun.SunPower_N   = 0.000000

			tag = tag + Environment.Sun.Tag
		end

		if Environment.Lightning.Valid == false then
			Environment.Lightning.Valid          = true
			Environment.Lightning.Visible        = true
			Environment.Lightning.Power          = 0.010000
			Environment.Lightning.Start          = 220.000000
			Environment.Lightning.End            = 20.000000
			Environment.Lightning.Time           = 110
			Environment.Lightning.Num            = 3
			Environment.Lightning.TimeInterval   = 130
			Environment.Lightning.BetweenTime    = 40000
			Environment.Lightning.BetweenRand    = 5000
			Environment.Lightning.LightningSFX      = 3

			tag = tag + Environment.Lightning.Tag
		end

		return tag
	end
}

EnvFuncList[113] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 32.000000
			Environment.Fog.FogEnd		= 500.000000
			Environment.Fog.FogDensity1	= 1.710000
			Environment.Fog.FogDensity2	= 3.480000
			Environment.Fog.ColorDensity1	= 0.920000
			Environment.Fog.ColorDensity2	= 0.670000
			Environment.Fog.HorzDensity	= 4.090000
			Environment.Fog.HorzPower		= 1.000000
			Environment.Fog.HeightStart	= 0.000000
			Environment.Fog.HeightEnd		= 0.000000
			Environment.Fog.HeightDensity	= 0.000000
			Environment.Fog.FogColor1		= 0xFFD3A38B
			Environment.Fog.FogColor2		= 0xFF87A9D8
			Environment.Fog.FogColor3		= 0xFF888B54
			Environment.Fog.FogColor4		= 0xFF7F7F7F

			tag = tag + Environment.Fog.Tag
		end

		if Environment.Sun.Valid == false then
			Environment.Sun.Valid        = true
			Environment.Sun.Visible      = false
			Environment.Sun.SunPower     = 0.000000
			Environment.Sun.SunPower_N   = 0.000000

			tag = tag + Environment.Sun.Tag
		end

		if Environment.Rain.Valid == false then
			Environment.Rain.Valid        = true
			Environment.Rain.Visible      = true
			Environment.Rain.RainSpeed    = 0.500000
			Environment.Rain.RainSize     = 0.000000
			Environment.Rain.RainLife     = 100
			Environment.Rain.RainColor    = 0xFF000000
			Environment.Rain.RainGFX      = "程序联入\\暴雨地面效果.gfx"
			Environment.Rain.RainSFX      = 1

			tag = tag + Environment.Rain.Tag
		end

		Environment.SceneCtrl.EnvStyle = ""
		Environment.SceneCtrl.ColorMap = "Maps\\Rain_Colormapping.dds"

		return tag
	end
}

EnvFuncList[114] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 25.000000
			Environment.Fog.FogEnd		= 0.000000
			Environment.Fog.FogDensity1	= 0.000000
			Environment.Fog.FogDensity2	= 0.000000
			Environment.Fog.ColorDensity1	= 0.000000
			Environment.Fog.ColorDensity2	= 0.000000
			Environment.Fog.HorzDensity	= 0.000000
			Environment.Fog.HorzPower		= 0.000000
			Environment.Fog.HeightStart	= 0.000000
			Environment.Fog.HeightEnd		= 0.000000
			Environment.Fog.HeightDensity	= 0.000000
			Environment.Fog.FogColor1		= 0xFF000000
			Environment.Fog.FogColor2		= 0xFF000000
			Environment.Fog.FogColor3		= 0xFF888B54
			Environment.Fog.FogColor4		= 0xFF7F7F7F

			tag = tag + Environment.Fog.Tag
		end

		Environment.SceneCtrl.EnvStyle = ""
		Environment.SceneCtrl.ColorMap = "Maps\\Night_Colormapping.dds"

		return tag
	end
}

EnvFuncList[115] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 73.000000
			Environment.Fog.FogEnd		= 391.000000
			Environment.Fog.FogDensity1	= 0.310000
			Environment.Fog.FogDensity2	= 1.100000
			Environment.Fog.ColorDensity1	= 0.120000
			Environment.Fog.ColorDensity2	= 1.530000
			Environment.Fog.HorzDensity	= 1.100000
			Environment.Fog.HorzPower		= 1.100000
			Environment.Fog.HeightStart	= 0.000000
			Environment.Fog.HeightEnd		= 0.000000
			Environment.Fog.HeightDensity	= 0.000000
			Environment.Fog.FogColor1		= 0xFF5F7A98
			Environment.Fog.FogColor2		= 0xFF252D41
			Environment.Fog.FogColor3		= 0xFF5F7A98
			Environment.Fog.FogColor4		= 0xFF252D41

			tag = tag + Environment.Fog.Tag
		end

		if Environment.Snow.Valid == false then
			Environment.Snow.Valid        = true
			Environment.Snow.Visible      = true
			Environment.Snow.SnowSpeed    = 0.200000
			Environment.Snow.SnowSize     = 0.050000
			Environment.Snow.SnowLife     = 50
			Environment.Snow.SnowColor    = 0xFFF3F4F8
			Environment.Snow.SnowGFX      = "程序联入\\小雪地面效果.gfx"
			Environment.Rain.SnowSFX      = 4

			tag = tag + Environment.Snow.Tag
		end

		return tag
	end
}

EnvFuncList[116] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 0.000000
			Environment.Fog.FogEnd		= 403.000000
			Environment.Fog.FogDensity1	= 0.240000
			Environment.Fog.FogDensity2	= 0.180000
			Environment.Fog.ColorDensity1	= 0.480000
			Environment.Fog.ColorDensity2	= 0.610000
			Environment.Fog.HorzDensity	= 2.000000
			Environment.Fog.HorzPower		= 1.000000
			Environment.Fog.HeightStart	= 0.000000
			Environment.Fog.HeightEnd		= 0.000000
			Environment.Fog.HeightDensity	= 0.000000
			Environment.Fog.FogColor1		= 0xFFF0C88C
			Environment.Fog.FogColor2		= 0xFF404886
			Environment.Fog.FogColor3		= 0xFFF0C88C
			Environment.Fog.FogColor4		= 0xFF404886

			tag = tag + Environment.Fog.Tag
		end

		return tag
	end
}

EnvFuncList[120] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 98.000000
			Environment.Fog.FogEnd		= 727.000000
			Environment.Fog.FogDensity1	= 0.370000
			Environment.Fog.FogDensity2	= 3.480000
			Environment.Fog.ColorDensity1	= 0.490000
			Environment.Fog.ColorDensity2	= 1.220000
			Environment.Fog.HorzDensity	= 0.980000
			Environment.Fog.HorzPower		= 1.340000
			Environment.Fog.HeightStart	= 28.000000
			Environment.Fog.HeightEnd		= 43.000000
			Environment.Fog.HeightDensity	= 0.790000
			Environment.Fog.FogColor1		= 0xFFCF9E5C
			Environment.Fog.FogColor2		= 0xFFE6CB99
			Environment.Fog.FogColor3		= 0xFFCF9E5C
			Environment.Fog.FogColor4		= 0xFFE6CB99

			tag = tag + Environment.Fog.Tag
		end

		return tag
	end
}

EnvFuncList[121] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 98.000000
			Environment.Fog.FogEnd		= 727.000000
			Environment.Fog.FogDensity1	= 0.370000
			Environment.Fog.FogDensity2	= 3.480000
			Environment.Fog.ColorDensity1	= 0.490000
			Environment.Fog.ColorDensity2	= 1.220000
			Environment.Fog.HorzDensity	= 0.980000
			Environment.Fog.HorzPower		= 1.340000
			Environment.Fog.HeightStart	= 28.000000
			Environment.Fog.HeightEnd		= 43.000000
			Environment.Fog.HeightDensity	= 0.790000
			Environment.Fog.FogColor1		= 0xFFCF9E5C
			Environment.Fog.FogColor2		= 0xFFE6CB99
			Environment.Fog.FogColor3		= 0xFFCF9E5C
			Environment.Fog.FogColor4		= 0xFFE6CB99

			tag = tag + Environment.Fog.Tag
		end

		return tag
	end
}

EnvFuncList[122] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 98.000000
			Environment.Fog.FogEnd		= 727.000000
			Environment.Fog.FogDensity1	= 0.370000
			Environment.Fog.FogDensity2	= 3.480000
			Environment.Fog.ColorDensity1	= 0.490000
			Environment.Fog.ColorDensity2	= 1.220000
			Environment.Fog.HorzDensity	= 0.980000
			Environment.Fog.HorzPower		= 1.340000
			Environment.Fog.HeightStart	= 28.000000
			Environment.Fog.HeightEnd		= 43.000000
			Environment.Fog.HeightDensity	= 0.790000
			Environment.Fog.FogColor1		= 0xFFCF9E5C
			Environment.Fog.FogColor2		= 0xFFE6CB99
			Environment.Fog.FogColor3		= 0xFFCF9E5C
			Environment.Fog.FogColor4		= 0xFFE6CB99

			tag = tag + Environment.Fog.Tag
		end

		return tag
	end
}

EnvFuncList[123] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 282.000000
			Environment.Fog.FogEnd		= 715.000000
			Environment.Fog.FogDensity1	= 0.120000
			Environment.Fog.FogDensity2	= 1.200000
			Environment.Fog.ColorDensity1	= 0.200000
			Environment.Fog.ColorDensity2	= 1.890000
			Environment.Fog.HorzDensity	= 2.260000
			Environment.Fog.HorzPower		= 1.100000
			Environment.Fog.HeightStart	= 0.000000
			Environment.Fog.HeightEnd		= 0.000000
			Environment.Fog.HeightDensity	= 0.000000
			Environment.Fog.FogColor1		= 0xFFC0D0F1
			Environment.Fog.FogColor2		= 0xFF2E435A
			Environment.Fog.FogColor3		= 0xFF2C3A65
			Environment.Fog.FogColor4		= 0xFF283951

			tag = tag + Environment.Fog.Tag
		end

		return tag
	end
}

EnvFuncList[124] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 49.000000
			Environment.Fog.FogEnd		= 733.000000
			Environment.Fog.FogDensity1	= 0.240000
			Environment.Fog.FogDensity2	= 1.580000
			Environment.Fog.ColorDensity1	= 0.610000
			Environment.Fog.ColorDensity2	= 2.120000
			Environment.Fog.HorzDensity	= 2.440000
			Environment.Fog.HorzPower		= 1.280000
			Environment.Fog.HeightStart	= 0.000000
			Environment.Fog.HeightEnd		= 0.000000
			Environment.Fog.HeightDensity	= 0.000000
			Environment.Fog.FogColor1		= 0xFF2E4150
			Environment.Fog.FogColor2		= 0xFF424062
			Environment.Fog.FogColor3		= 0xFF424062
			Environment.Fog.FogColor4		= 0xFF7F7F7F

			tag = tag + Environment.Fog.Tag
		end

		return tag
	end
}

EnvFuncList[125] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 24.000000
			Environment.Fog.FogEnd		= 244.000000
			Environment.Fog.FogDensity1	= 0.310000
			Environment.Fog.FogDensity2	= 5.000000
			Environment.Fog.ColorDensity1	= 0.180000
			Environment.Fog.ColorDensity2	= 1.700000
			Environment.Fog.HorzDensity	= 1.100000
			Environment.Fog.HorzPower		= 2.260000
			Environment.Fog.HeightStart	= 0.000000
			Environment.Fog.HeightEnd		= 37.000000
			Environment.Fog.HeightDensity	= 1.580000
			Environment.Fog.FogColor1		= 0xFFB7D3DB
			Environment.Fog.FogColor2		= 0xFF617C98
			Environment.Fog.FogColor3		= 0xFFB7D3DB
			Environment.Fog.FogColor4		= 0xFF617C98

			tag = tag + Environment.Fog.Tag
		end

		return tag
	end
}

EnvFuncList[127] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 92.000000
			Environment.Fog.FogEnd		= 776.000000
			Environment.Fog.FogDensity1	= 0.370000
			Environment.Fog.FogDensity2	= 0.790000
			Environment.Fog.ColorDensity1	= 1.830000
			Environment.Fog.ColorDensity2	= 1.680000
			Environment.Fog.HorzDensity	= 1.580000
			Environment.Fog.HorzPower		= 1.000000
			Environment.Fog.HeightStart	= 0.000000
			Environment.Fog.HeightEnd		= 0.000000
			Environment.Fog.HeightDensity	= 0.000000
			Environment.Fog.FogColor1		= 0xFFAAC4DB
			Environment.Fog.FogColor2		= 0xFF326685
			Environment.Fog.FogColor3		= 0xFF3E4E6A
			Environment.Fog.FogColor4		= 0xFF212040

			tag = tag + Environment.Fog.Tag
		end

		return tag
	end
}

EnvFuncList[128] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 24.000000
			Environment.Fog.FogEnd		= 165.000000
			Environment.Fog.FogDensity1	= 0.240000
			Environment.Fog.FogDensity2	= 1.330000
			Environment.Fog.ColorDensity1	= 0.720000
			Environment.Fog.ColorDensity2	= 0.370000
			Environment.Fog.HorzDensity	= 1.280000
			Environment.Fog.HorzPower		= 1.220000
			Environment.Fog.HeightStart	= 0.000000
			Environment.Fog.HeightEnd		= 0.000000
			Environment.Fog.HeightDensity	= 0.000000
			Environment.Fog.FogColor1		= 0xFFD9E8EE
			Environment.Fog.FogColor2		= 0xFFD9E8EE
			Environment.Fog.FogColor3		= 0xFFD9E8EE
			Environment.Fog.FogColor4		= 0xFFD9E8EE

			tag = tag + Environment.Fog.Tag
		end

		return tag
	end
}

EnvFuncList[129] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 30.000000
			Environment.Fog.FogEnd		= 586.000000
			Environment.Fog.FogDensity1	= 0.500000
			Environment.Fog.FogDensity2	= 0.600000
			Environment.Fog.ColorDensity1	= 0.500000
			Environment.Fog.ColorDensity2	= 2.280000
			Environment.Fog.HorzDensity	= 3.500000
			Environment.Fog.HorzPower		= 2.380000
			Environment.Fog.HeightStart	= 0.000000
			Environment.Fog.HeightEnd		= 0.000000
			Environment.Fog.HeightDensity	= 0.000000
			Environment.Fog.FogColor1		= 0xFF4F649D
			Environment.Fog.FogColor2		= 0xFF5A589A
			Environment.Fog.FogColor3		= 0xFF4F649D
			Environment.Fog.FogColor4		= 0xFF5A589A

			tag = tag + Environment.Fog.Tag
		end

		return tag
	end
}

EnvFuncList[136] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 92.000000
			Environment.Fog.FogEnd		= 776.000000
			Environment.Fog.FogDensity1	= 0.370000
			Environment.Fog.FogDensity2	= 0.790000
			Environment.Fog.ColorDensity1	= 1.830000
			Environment.Fog.ColorDensity2	= 1.680000
			Environment.Fog.HorzDensity	= 1.580000
			Environment.Fog.HorzPower		= 1.000000
			Environment.Fog.HeightStart	= 0.000000
			Environment.Fog.HeightEnd		= 0.000000
			Environment.Fog.HeightDensity	= 0.000000
			Environment.Fog.FogColor1		= 0xFFAAC4DB
			Environment.Fog.FogColor2		= 0xFF326685
			Environment.Fog.FogColor3		= 0xFF3E4E6A
			Environment.Fog.FogColor4		= 0xFF212040

			tag = tag + Environment.Fog.Tag
		end

		return tag
	end
}

EnvFuncList[145] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 116.000000
			Environment.Fog.FogEnd		= 537.000000
			Environment.Fog.FogDensity1	= 0.550000
			Environment.Fog.FogDensity2	= 0.970000
			Environment.Fog.ColorDensity1	= 0.550000
			Environment.Fog.ColorDensity2	= 2.500000
			Environment.Fog.HorzDensity	= 2.500000
			Environment.Fog.HorzPower		= 0.370000
			Environment.Fog.HeightStart	= 0.000000
			Environment.Fog.HeightEnd		= 0.000000
			Environment.Fog.HeightDensity	= 0.000000
			Environment.Fog.FogColor1		= 0xFF2E3E64
			Environment.Fog.FogColor2		= 0xFF232941
			Environment.Fog.FogColor3		= 0xFF2E3E64
			Environment.Fog.FogColor4		= 0xFF232941

			tag = tag + Environment.Fog.Tag
		end

		return tag
	end
}

EnvFuncList[146] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 43.000000
			Environment.Fog.FogEnd		= 403.000000
			Environment.Fog.FogDensity1	= 0.850000
			Environment.Fog.FogDensity2	= 2.500000
			Environment.Fog.ColorDensity1	= 0.420000
			Environment.Fog.ColorDensity2	= 1.160000
			Environment.Fog.HorzDensity	= 0.240000
			Environment.Fog.HorzPower		= 0.970000
			Environment.Fog.HeightStart	= 0.000000
			Environment.Fog.HeightEnd		= 0.000000
			Environment.Fog.HeightDensity	= 0.000000
			Environment.Fog.FogColor1		= 0xFFA5CAE0
			Environment.Fog.FogColor2		= 0xFF88A9D7
			Environment.Fog.FogColor3		= 0xFFA2B6D5
			Environment.Fog.FogColor4		= 0xFF739CC1

			tag = tag + Environment.Fog.Tag
		end

		if Environment.Snow.Valid == false then
			Environment.Snow.Valid        = true
			Environment.Snow.Visible      = true
			Environment.Snow.SnowSpeed    = 0.150000
			Environment.Snow.SnowSize     = 0.030000
			Environment.Snow.SnowLife     = 90
			Environment.Snow.SnowColor    = 0xFFAEE1F4
			Environment.Snow.SnowGFX      = ""
			Environment.Rain.SnowSFX      = 4

			tag = tag + Environment.Snow.Tag
		end

		return tag
	end
}

EnvFuncList[150] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 80.000000
			Environment.Fog.FogEnd		= 537.000000
			Environment.Fog.FogDensity1	= 0.850000
			Environment.Fog.FogDensity2	= 1.330000
			Environment.Fog.ColorDensity1	= 1.000000
			Environment.Fog.ColorDensity2	= 0.000000
			Environment.Fog.HorzDensity	= 1.220000
			Environment.Fog.HorzPower		= 1.040000
			Environment.Fog.HeightStart	= 49.000000
			Environment.Fog.HeightEnd		= 305.000000
			Environment.Fog.HeightDensity	= 0.000000
			Environment.Fog.FogColor1		= 0xFFA5A4D5
			Environment.Fog.FogColor2		= 0xFF4F4D7D
			Environment.Fog.FogColor3		= 0xFFA5A4D5
			Environment.Fog.FogColor4		= 0xFF4F4D7D

			tag = tag + Environment.Fog.Tag
		end

		return tag
	end
}

EnvFuncList[155] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 5.000000
			Environment.Fog.FogEnd		= 116.000000
			Environment.Fog.FogDensity1	= 0.000000
			Environment.Fog.FogDensity2	= 1.770000
			Environment.Fog.ColorDensity1	= 0.000000
			Environment.Fog.ColorDensity2	= 1.580000
			Environment.Fog.HorzDensity	= 0.850000
			Environment.Fog.HorzPower		= 0.660000
			Environment.Fog.HeightStart	= 12.000000
			Environment.Fog.HeightEnd		= 37.000000
			Environment.Fog.HeightDensity	= 0.720000
			Environment.Fog.FogColor1		= 0xFFCA6F37
			Environment.Fog.FogColor2		= 0xFF4F261C
			Environment.Fog.FogColor3		= 0xFFCA6F37
			Environment.Fog.FogColor4		= 0xFF4F261C

			tag = tag + Environment.Fog.Tag
		end

		if Environment.Rain.Valid == false then
			Environment.Rain.Valid        = true
			Environment.Rain.Visible      = true
			Environment.Rain.RainSpeed    = 0.200000
			Environment.Rain.RainSize     = 0.000000
			Environment.Rain.RainLife     = 40
			Environment.Rain.RainColor    = 0xFF808080
			Environment.Rain.RainGFX      = "程序联入\\战场灰尘地面效果.gfx"
			Environment.Rain.RainSFX      = 0

			tag = tag + Environment.Rain.Tag
		end

		return tag
	end
}

EnvFuncList[199] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 0.000000
			Environment.Fog.FogEnd		= 200.000000
			Environment.Fog.FogDensity1	= 0.550000
			Environment.Fog.FogDensity2	= 0.000000
			Environment.Fog.ColorDensity1	= 0.420000
			Environment.Fog.ColorDensity2	= 0.970000
			Environment.Fog.HorzDensity	= 2.000000
			Environment.Fog.HorzPower		= 1.000000
			Environment.Fog.HeightStart	= 0.000000
			Environment.Fog.HeightEnd		= 0.000000
			Environment.Fog.HeightDensity	= 0.000000
			Environment.Fog.FogColor1		= 0xFF56658D
			Environment.Fog.FogColor2		= 0xFF674E34
			Environment.Fog.FogColor3		= 0xFF56658D
			Environment.Fog.FogColor4		= 0xFF674E34

			tag = tag + Environment.Fog.Tag
		end

		return tag
	end
}

EnvFuncList[248] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 3.000000
			Environment.Fog.FogEnd		= 247.000000
			Environment.Fog.FogDensity1	= 0.240000
			Environment.Fog.FogDensity2	= 2.870000
			Environment.Fog.ColorDensity1	= 0.980000
			Environment.Fog.ColorDensity2	= 1.000000
			Environment.Fog.HorzDensity	= 1.530000
			Environment.Fog.HorzPower		= 1.890000
			Environment.Fog.HeightStart	= 0.000000
			Environment.Fog.HeightEnd		= 0.000000
			Environment.Fog.HeightDensity	= 0.000000
			Environment.Fog.FogColor1		= 0xFFA29FE6
			Environment.Fog.FogColor2		= 0xFF4172CD
			Environment.Fog.FogColor3		= 0xFF888B54
			Environment.Fog.FogColor4		= 0xFF7F7F7F

			tag = tag + Environment.Fog.Tag
		end

		return tag
	end
}

EnvFuncList[901] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 24.000000
			Environment.Fog.FogEnd		= 183.000000
			Environment.Fog.FogDensity1	= 0.980000
			Environment.Fog.FogDensity2	= 0.790000
			Environment.Fog.ColorDensity1	= 1.000000
			Environment.Fog.ColorDensity2	= 1.000000
			Environment.Fog.HorzDensity	= 4.400000
			Environment.Fog.HorzPower		= 2.200000
			Environment.Fog.HeightStart	= 0.000000
			Environment.Fog.HeightEnd		= 0.000000
			Environment.Fog.HeightDensity	= 0.000000
			Environment.Fog.FogColor1		= 0xFF243066
			Environment.Fog.FogColor2		= 0xFF6729B1
			Environment.Fog.FogColor3		= 0xFF888B54
			Environment.Fog.FogColor4		= 0xFF7F7F7F

			tag = tag + Environment.Fog.Tag
		end

		Environment.SceneCtrl.EnvStyle = ""
		Environment.SceneCtrl.ColorMap = "Maps\\x10\\ghost_Colormapping.dds"

		return tag
	end
}

EnvFuncList[902] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 100.000000
			Environment.Fog.FogEnd		= 450.000000
			Environment.Fog.FogDensity1	= 0.200000
			Environment.Fog.FogDensity2	= 2.930000
			Environment.Fog.ColorDensity1	= 0.200000
			Environment.Fog.ColorDensity2	= 0.850000
			Environment.Fog.HorzDensity	= 1.830000
			Environment.Fog.HorzPower		= 1.340000
			Environment.Fog.HeightStart	= 0.000000
			Environment.Fog.HeightEnd		= 0.000000
			Environment.Fog.HeightDensity	= 0.000000
			Environment.Fog.FogColor1		= 0xFF2877E1
			Environment.Fog.FogColor2		= 0xFF3950A8
			Environment.Fog.FogColor3		= 0xFF0B4A79
			Environment.Fog.FogColor4		= 0xFF1C264F

			tag = tag + Environment.Fog.Tag
		end

		if Environment.Rain.Valid == false then
			Environment.Rain.Valid        = true
			Environment.Rain.Visible      = true
			Environment.Rain.RainSpeed    = 0.500000
			Environment.Rain.RainSize     = 0.000000
			Environment.Rain.RainLife     = 100
			Environment.Rain.RainColor    = 0xFFFFFFFF
			Environment.Rain.RainGFX      = "程序联入\\流星雨天空星星子效果02.gfx"
			Environment.Rain.RainSFX      = 0

			tag = tag + Environment.Rain.Tag
		end

		return tag
	end
}

EnvFuncList[903] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 100.000000
			Environment.Fog.FogEnd		= 450.000000
			Environment.Fog.FogDensity1	= 0.200000
			Environment.Fog.FogDensity2	= 2.930000
			Environment.Fog.ColorDensity1	= 0.200000
			Environment.Fog.ColorDensity2	= 0.850000
			Environment.Fog.HorzDensity	= 1.830000
			Environment.Fog.HorzPower		= 1.340000
			Environment.Fog.HeightStart	= 0.000000
			Environment.Fog.HeightEnd		= 0.000000
			Environment.Fog.HeightDensity	= 0.000000
			Environment.Fog.FogColor1		= 0xFF2877E1
			Environment.Fog.FogColor2		= 0xFF3950A8
			Environment.Fog.FogColor3		= 0xFF0B4A79
			Environment.Fog.FogColor4		= 0xFF1C264F

			tag = tag + Environment.Fog.Tag
		end

		if Environment.Snow.Valid == false then
			Environment.Snow.Valid        = true
			Environment.Snow.Visible      = true
			Environment.Snow.SnowSpeed    = 0.000000
			Environment.Snow.SnowSize     = 0.000000
			Environment.Snow.SnowLife     = 0
			Environment.Snow.SnowColor    = 0xFF000000
			Environment.Snow.SnowGFX      = "程序联入\\圣诞节下雪花.gfx"
			Environment.Rain.SnowSFX      = 0

			tag = tag + Environment.Snow.Tag
		end

		Environment.SceneCtrl.EnvStyle = ""
		Environment.SceneCtrl.ColorMap = "Maps\\Christmas_Colormapping.dds"

		return tag
	end
}

EnvFuncList[904] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 100.000000
			Environment.Fog.FogEnd		= 450.000000
			Environment.Fog.FogDensity1	= 0.200000
			Environment.Fog.FogDensity2	= 2.930000
			Environment.Fog.ColorDensity1	= 0.200000
			Environment.Fog.ColorDensity2	= 0.850000
			Environment.Fog.HorzDensity	= 1.830000
			Environment.Fog.HorzPower		= 1.340000
			Environment.Fog.HeightStart	= 0.000000
			Environment.Fog.HeightEnd		= 0.000000
			Environment.Fog.HeightDensity	= 0.000000
			Environment.Fog.FogColor1		= 0xFF2877E1
			Environment.Fog.FogColor2		= 0xFF3950A8
			Environment.Fog.FogColor3		= 0xFF0B4A79
			Environment.Fog.FogColor4		= 0xFF1C264F

			tag = tag + Environment.Fog.Tag
		end

		if Environment.Snow.Valid == false then
			Environment.Snow.Valid        = true
			Environment.Snow.Visible      = true
			Environment.Snow.SnowSpeed    = 0.000000
			Environment.Snow.SnowSize     = 0.000000
			Environment.Snow.SnowLife     = 0
			Environment.Snow.SnowColor    = 0xFF000000
			Environment.Snow.SnowGFX      = "程序联入\\爱心雨子效果003.gfx"
			Environment.Rain.SnowSFX      = 0

			tag = tag + Environment.Snow.Tag
		end

		return tag
	end
}

EnvFuncList[924] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 85.000000
			Environment.Fog.FogEnd		= 287.000000
			Environment.Fog.FogDensity1	= 0.370000
			Environment.Fog.FogDensity2	= 0.730000
			Environment.Fog.ColorDensity1	= 0.490000
			Environment.Fog.ColorDensity2	= 1.470000
			Environment.Fog.HorzDensity	= 3.300000
			Environment.Fog.HorzPower		= 2.690000
			Environment.Fog.HeightStart	= 18.000000
			Environment.Fog.HeightEnd		= 43.000000
			Environment.Fog.HeightDensity	= 0.490000
			Environment.Fog.FogColor1		= 0xFF44E3E8
			Environment.Fog.FogColor2		= 0xFF20A2C8
			Environment.Fog.FogColor3		= 0xFF4474BB
			Environment.Fog.FogColor4		= 0xFF504EB1

			tag = tag + Environment.Fog.Tag
		end

		return tag
	end
}

EnvFuncList[1000] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 65.000000
			Environment.Fog.FogEnd		= 776.000000
			Environment.Fog.FogDensity1	= 0.240000
			Environment.Fog.FogDensity2	= 2.080000
			Environment.Fog.ColorDensity1	= 1.280000
			Environment.Fog.ColorDensity2	= 4.810000
			Environment.Fog.HorzDensity	= 0.670000
			Environment.Fog.HorzPower		= 1.650000
			Environment.Fog.HeightStart	= 0.000000
			Environment.Fog.HeightEnd		= 0.000000
			Environment.Fog.HeightDensity	= 0.000000
			Environment.Fog.FogColor1		= 0xFF3F77A0
			Environment.Fog.FogColor2		= 0xFFBA8B45
			Environment.Fog.FogColor3		= 0xFF2D4764
			Environment.Fog.FogColor4		= 0xFF2E4569

			tag = tag + Environment.Fog.Tag
		end

		return tag
	end
}

EnvFuncList[1017] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 40.000000
			Environment.Fog.FogEnd		= 153.000000
			Environment.Fog.FogDensity1	= 1.000000
			Environment.Fog.FogDensity2	= 1.000000
			Environment.Fog.ColorDensity1	= 1.000000
			Environment.Fog.ColorDensity2	= 1.000000
			Environment.Fog.HorzDensity	= 3.540000
			Environment.Fog.HorzPower		= 1.000000
			Environment.Fog.HeightStart	= 0.000000
			Environment.Fog.HeightEnd		= 0.000000
			Environment.Fog.HeightDensity	= 0.000000
			Environment.Fog.FogColor1		= 0xFF8452A9
			Environment.Fog.FogColor2		= 0xFF5854AB
			Environment.Fog.FogColor3		= 0xFF8452A9
			Environment.Fog.FogColor4		= 0xFF5854AB

			tag = tag + Environment.Fog.Tag
		end

		return tag
	end
}

EnvFuncList[1023] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 20.000000
			Environment.Fog.FogEnd		= 400.000000
			Environment.Fog.FogDensity1	= 0.920000
			Environment.Fog.FogDensity2	= 3.900000
			Environment.Fog.ColorDensity1	= 0.310000
			Environment.Fog.ColorDensity2	= 3.770000
			Environment.Fog.HorzDensity	= 2.440000
			Environment.Fog.HorzPower		= 1.000000
			Environment.Fog.HeightStart	= 12.000000
			Environment.Fog.HeightEnd		= 37.000000
			Environment.Fog.HeightDensity	= 1.710000
			Environment.Fog.FogColor1		= 0xFF455FA3
			Environment.Fog.FogColor2		= 0xFF273672
			Environment.Fog.FogColor3		= 0xFF455FA3
			Environment.Fog.FogColor4		= 0xFF273672

			tag = tag + Environment.Fog.Tag
		end

		return tag
	end
}

EnvFuncList[1026] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 55.000000
			Environment.Fog.FogEnd		= 403.000000
			Environment.Fog.FogDensity1	= 0.310000
			Environment.Fog.FogDensity2	= 1.650000
			Environment.Fog.ColorDensity1	= 0.790000
			Environment.Fog.ColorDensity2	= 1.280000
			Environment.Fog.HorzDensity	= 2.000000
			Environment.Fog.HorzPower		= 1.000000
			Environment.Fog.HeightStart	= 0.000000
			Environment.Fog.HeightEnd		= 0.000000
			Environment.Fog.HeightDensity	= 0.000000
			Environment.Fog.FogColor1		= 0xFFA4D6F0
			Environment.Fog.FogColor2		= 0xFF153C5E
			Environment.Fog.FogColor3		= 0xFFA4D6F0
			Environment.Fog.FogColor4		= 0xFF153C5E

			tag = tag + Environment.Fog.Tag
		end

		return tag
	end
}

EnvFuncList[1028] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 24.000000
			Environment.Fog.FogEnd		= 427.000000
			Environment.Fog.FogDensity1	= 0.310000
			Environment.Fog.FogDensity2	= 1.280000
			Environment.Fog.ColorDensity1	= 1.220000
			Environment.Fog.ColorDensity2	= 1.400000
			Environment.Fog.HorzDensity	= 2.990000
			Environment.Fog.HorzPower		= 1.400000
			Environment.Fog.HeightStart	= 0.000000
			Environment.Fog.HeightEnd		= 0.000000
			Environment.Fog.HeightDensity	= 0.000000
			Environment.Fog.FogColor1		= 0xFFA9BEF1
			Environment.Fog.FogColor2		= 0xFF4F81B3
			Environment.Fog.FogColor3		= 0xFF698EE7
			Environment.Fog.FogColor4		= 0xFF375B80

			tag = tag + Environment.Fog.Tag
		end

		return tag
	end
}

EnvFuncList[1041] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 37.000000
			Environment.Fog.FogEnd		= 440.000000
			Environment.Fog.FogDensity1	= 0.980000
			Environment.Fog.FogDensity2	= 2.440000
			Environment.Fog.ColorDensity1	= 1.000000
			Environment.Fog.ColorDensity2	= 1.000000
			Environment.Fog.HorzDensity	= 1.770000
			Environment.Fog.HorzPower		= 1.830000
			Environment.Fog.HeightStart	= 43.000000
			Environment.Fog.HeightEnd		= 73.000000
			Environment.Fog.HeightDensity	= 2.750000
			Environment.Fog.FogColor1		= 0xFF5F7CD6
			Environment.Fog.FogColor2		= 0xFF1E5E51
			Environment.Fog.FogColor3		= 0xFF5F7CD6
			Environment.Fog.FogColor4		= 0xFF1E5E51

			tag = tag + Environment.Fog.Tag
		end

		return tag
	end
}

EnvFuncList[1048] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 12.000000
			Environment.Fog.FogEnd		= 110.000000
			Environment.Fog.FogDensity1	= 0.120000
			Environment.Fog.FogDensity2	= 2.200000
			Environment.Fog.ColorDensity1	= 0.920000
			Environment.Fog.ColorDensity2	= 0.980000
			Environment.Fog.HorzDensity	= 4.000000
			Environment.Fog.HorzPower		= 2.200000
			Environment.Fog.HeightStart	= 0.000000
			Environment.Fog.HeightEnd		= 37.000000
			Environment.Fog.HeightDensity	= 1.530000
			Environment.Fog.FogColor1		= 0xFF49B0B6
			Environment.Fog.FogColor2		= 0xFF548EAB
			Environment.Fog.FogColor3		= 0xFF49B0B6
			Environment.Fog.FogColor4		= 0xFF548EAB

			tag = tag + Environment.Fog.Tag
		end

		return tag
	end
}

EnvFuncList[1055] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 85.000000
			Environment.Fog.FogEnd		= 574.000000
			Environment.Fog.FogDensity1	= 0.240000
			Environment.Fog.FogDensity2	= 2.630000
			Environment.Fog.ColorDensity1	= 0.480000
			Environment.Fog.ColorDensity2	= 1.650000
			Environment.Fog.HorzDensity	= 0.720000
			Environment.Fog.HorzPower		= 1.400000
			Environment.Fog.HeightStart	= 0.000000
			Environment.Fog.HeightEnd		= 0.000000
			Environment.Fog.HeightDensity	= 0.000000
			Environment.Fog.FogColor1		= 0xFF3C5B6F
			Environment.Fog.FogColor2		= 0xFF808AC6
			Environment.Fog.FogColor3		= 0xFF3C5B6F
			Environment.Fog.FogColor4		= 0xFF808AC6

			tag = tag + Environment.Fog.Tag
		end

		return tag
	end
}

EnvFuncList[1056] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 43.000000
			Environment.Fog.FogEnd		= 200.000000
			Environment.Fog.FogDensity1	= 0.120000
			Environment.Fog.FogDensity2	= 2.140000
			Environment.Fog.ColorDensity1	= 0.010000
			Environment.Fog.ColorDensity2	= 1.280000
			Environment.Fog.HorzDensity	= 1.280000
			Environment.Fog.HorzPower		= 0.730000
			Environment.Fog.HeightStart	= 0.000000
			Environment.Fog.HeightEnd		= 0.000000
			Environment.Fog.HeightDensity	= 0.000000
			Environment.Fog.FogColor1		= 0xFF8D99C7
			Environment.Fog.FogColor2		= 0xFF6F93B7
			Environment.Fog.FogColor3		= 0xFF8D99C7
			Environment.Fog.FogColor4		= 0xFF6F93B7

			tag = tag + Environment.Fog.Tag
		end

		return tag
	end
}

EnvFuncList[1113] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 122.000000
			Environment.Fog.FogEnd		= 470.000000
			Environment.Fog.FogDensity1	= 1.000000
			Environment.Fog.FogDensity2	= 2.000000
			Environment.Fog.ColorDensity1	= 0.310000
			Environment.Fog.ColorDensity2	= 1.450000
			Environment.Fog.HorzDensity	= 0.480000
			Environment.Fog.HorzPower		= 2.020000
			Environment.Fog.HeightStart	= 165.000000
			Environment.Fog.HeightEnd		= 220.000000
			Environment.Fog.HeightDensity	= 4.460000
			Environment.Fog.FogColor1		= 0xFFA3D3E0
			Environment.Fog.FogColor2		= 0xFF2C399A
			Environment.Fog.FogColor3		= 0xFF4E6792
			Environment.Fog.FogColor4		= 0xFF263864

			tag = tag + Environment.Fog.Tag
		end

		return tag
	end
}

EnvFuncList[1254] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 61.000000
			Environment.Fog.FogEnd		= 513.000000
			Environment.Fog.FogDensity1	= 0.980000
			Environment.Fog.FogDensity2	= 4.690000
			Environment.Fog.ColorDensity1	= 0.230000
			Environment.Fog.ColorDensity2	= 1.710000
			Environment.Fog.HorzDensity	= 4.090000
			Environment.Fog.HorzPower		= 1.340000
			Environment.Fog.HeightStart	= 0.000000
			Environment.Fog.HeightEnd		= 0.000000
			Environment.Fog.HeightDensity	= 0.000000
			Environment.Fog.FogColor1		= 0xFF1F5FBE
			Environment.Fog.FogColor2		= 0xFF103250
			Environment.Fog.FogColor3		= 0xFF1F5FBE
			Environment.Fog.FogColor4		= 0xFF103250

			tag = tag + Environment.Fog.Tag
		end

		return tag
	end
}

EnvFuncList[1255] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 43.000000
			Environment.Fog.FogEnd		= 635.000000
			Environment.Fog.FogDensity1	= 1.750000
			Environment.Fog.FogDensity2	= 3.280000
			Environment.Fog.ColorDensity1	= 0.230000
			Environment.Fog.ColorDensity2	= 1.710000
			Environment.Fog.HorzDensity	= 4.700000
			Environment.Fog.HorzPower		= 1.380000
			Environment.Fog.HeightStart	= 0.000000
			Environment.Fog.HeightEnd		= 0.000000
			Environment.Fog.HeightDensity	= 0.000000
			Environment.Fog.FogColor1		= 0xFF6DA2D6
			Environment.Fog.FogColor2		= 0xFF21639E
			Environment.Fog.FogColor3		= 0xFF514BB4
			Environment.Fog.FogColor4		= 0xFF337BCC

			tag = tag + Environment.Fog.Tag
		end

		return tag
	end
}

EnvFuncList[1275] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 24.000000
			Environment.Fog.FogEnd		= 153.000000
			Environment.Fog.FogDensity1	= 1.000000
			Environment.Fog.FogDensity2	= 1.000000
			Environment.Fog.ColorDensity1	= 1.000000
			Environment.Fog.ColorDensity2	= 1.000000
			Environment.Fog.HorzDensity	= 5.740000
			Environment.Fog.HorzPower		= 1.000000
			Environment.Fog.HeightStart	= 0.000000
			Environment.Fog.HeightEnd		= 0.000000
			Environment.Fog.HeightDensity	= 0.000000
			Environment.Fog.FogColor1		= 0xFF707BCD
			Environment.Fog.FogColor2		= 0xFF3E65C1
			Environment.Fog.FogColor3		= 0xFF707BCD
			Environment.Fog.FogColor4		= 0xFF3E65C1

			tag = tag + Environment.Fog.Tag
		end

		return tag
	end
}

EnvFuncList[1310] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 20.000000
			Environment.Fog.FogEnd		= 421.000000
			Environment.Fog.FogDensity1	= 0.120000
			Environment.Fog.FogDensity2	= 2.140000
			Environment.Fog.ColorDensity1	= 0.550000
			Environment.Fog.ColorDensity2	= 2.140000
			Environment.Fog.HorzDensity	= 1.870000
			Environment.Fog.HorzPower		= 1.020000
			Environment.Fog.HeightStart	= 0.000000
			Environment.Fog.HeightEnd		= 0.000000
			Environment.Fog.HeightDensity	= 0.000000
			Environment.Fog.FogColor1		= 0xFF223657
			Environment.Fog.FogColor2		= 0xFF62699D
			Environment.Fog.FogColor3		= 0xFF223657
			Environment.Fog.FogColor4		= 0xFF62699D

			tag = tag + Environment.Fog.Tag
		end

		return tag
	end
}

EnvFuncList[1401] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 6.000000
			Environment.Fog.FogEnd		= 208.000000
			Environment.Fog.FogDensity1	= 0.120000
			Environment.Fog.FogDensity2	= 1.700000
			Environment.Fog.ColorDensity1	= 0.610000
			Environment.Fog.ColorDensity2	= 1.650000
			Environment.Fog.HorzDensity	= 0.550000
			Environment.Fog.HorzPower		= 1.000000
			Environment.Fog.HeightStart	= 0.000000
			Environment.Fog.HeightEnd		= 0.000000
			Environment.Fog.HeightDensity	= 0.000000
			Environment.Fog.FogColor1		= 0xFF87A3C9
			Environment.Fog.FogColor2		= 0xFF3D598D
			Environment.Fog.FogColor3		= 0xFF87A3C9
			Environment.Fog.FogColor4		= 0xFF3D598D

			tag = tag + Environment.Fog.Tag
		end

		if Environment.Sun.Valid == false then
			Environment.Sun.Valid        = true
			Environment.Sun.Visible      = false
			Environment.Sun.SunPower     = 0.000000
			Environment.Sun.SunPower_N   = 0.000000

			tag = tag + Environment.Sun.Tag
		end

		if Environment.Rain.Valid == false then
			Environment.Rain.Valid        = true
			Environment.Rain.Visible      = true
			Environment.Rain.RainSpeed    = 0.300000
			Environment.Rain.RainSize     = 0.000000
			Environment.Rain.RainLife     = 100
			Environment.Rain.RainColor    = 0xFFD6E9F1
			Environment.Rain.RainGFX      = "程序联入\\大雨地面效果.gfx"
			Environment.Rain.RainSFX      = 1

			tag = tag + Environment.Rain.Tag
		end

		if Environment.Lightning.Valid == false then
			Environment.Lightning.Valid          = true
			Environment.Lightning.Visible        = true
			Environment.Lightning.Power          = 0.010000
			Environment.Lightning.Start          = 220.000000
			Environment.Lightning.End            = 60.000000
			Environment.Lightning.Time           = 120
			Environment.Lightning.Num            = 3
			Environment.Lightning.TimeInterval   = 150
			Environment.Lightning.BetweenTime    = 10000
			Environment.Lightning.BetweenRand    = 7000
			Environment.Lightning.LightningSFX      = 3

			tag = tag + Environment.Lightning.Tag
		end

		return tag
	end
}

EnvFuncList[1410] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 92.000000
			Environment.Fog.FogEnd		= 501.000000
			Environment.Fog.FogDensity1	= 0.310000
			Environment.Fog.FogDensity2	= 1.580000
			Environment.Fog.ColorDensity1	= 0.910000
			Environment.Fog.ColorDensity2	= 1.330000
			Environment.Fog.HorzDensity	= 1.330000
			Environment.Fog.HorzPower		= 2.200000
			Environment.Fog.HeightStart	= 0.000000
			Environment.Fog.HeightEnd		= 0.000000
			Environment.Fog.HeightDensity	= 0.000000
			Environment.Fog.FogColor1		= 0xFFF2E19B
			Environment.Fog.FogColor2		= 0xFFAA8DCD
			Environment.Fog.FogColor3		= 0xFFF2E19B
			Environment.Fog.FogColor4		= 0xFFAA8DCD

			tag = tag + Environment.Fog.Tag
		end

		return tag
	end
}

EnvFuncList[1411] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 24.000000
			Environment.Fog.FogEnd		= 446.000000
			Environment.Fog.FogDensity1	= 0.850000
			Environment.Fog.FogDensity2	= 2.260000
			Environment.Fog.ColorDensity1	= 1.220000
			Environment.Fog.ColorDensity2	= 1.400000
			Environment.Fog.HorzDensity	= 2.440000
			Environment.Fog.HorzPower		= 1.890000
			Environment.Fog.HeightStart	= 0.000000
			Environment.Fog.HeightEnd		= 0.000000
			Environment.Fog.HeightDensity	= 0.000000
			Environment.Fog.FogColor1		= 0xFF0F1D2B
			Environment.Fog.FogColor2		= 0xFF294058
			Environment.Fog.FogColor3		= 0xFF0F1D2B
			Environment.Fog.FogColor4		= 0xFF294058

			tag = tag + Environment.Fog.Tag
		end

		if Environment.Sun.Valid == false then
			Environment.Sun.Valid        = true
			Environment.Sun.Visible      = false
			Environment.Sun.SunPower     = 0.000000
			Environment.Sun.SunPower_N   = 0.000000

			tag = tag + Environment.Sun.Tag
		end

		if Environment.Rain.Valid == false then
			Environment.Rain.Valid        = true
			Environment.Rain.Visible      = true
			Environment.Rain.RainSpeed    = 0.200000
			Environment.Rain.RainSize     = 0.000000
			Environment.Rain.RainLife     = 40
			Environment.Rain.RainColor    = 0xFFD6E9F1
			Environment.Rain.RainGFX      = "程序联入\\小雨地面效果.gfx"
			Environment.Rain.RainSFX      = 1

			tag = tag + Environment.Rain.Tag
		end

		if Environment.Lightning.Valid == false then
			Environment.Lightning.Valid          = true
			Environment.Lightning.Visible        = true
			Environment.Lightning.Power          = 0.010000
			Environment.Lightning.Start          = 220.000000
			Environment.Lightning.End            = 60.000000
			Environment.Lightning.Time           = 120
			Environment.Lightning.Num            = 1
			Environment.Lightning.TimeInterval   = 150
			Environment.Lightning.BetweenTime    = 90000
			Environment.Lightning.BetweenRand    = 7000
			Environment.Lightning.LightningSFX      = 3

			tag = tag + Environment.Lightning.Tag
		end

		return tag
	end
}

EnvFuncList[1412] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 150.000000
			Environment.Fog.FogEnd		= 720.000000
			Environment.Fog.FogDensity1	= 1.100000
			Environment.Fog.FogDensity2	= 0.310000
			Environment.Fog.ColorDensity1	= 1.040000
			Environment.Fog.ColorDensity2	= 0.790000
			Environment.Fog.HorzDensity	= 1.650000
			Environment.Fog.HorzPower		= 1.280000
			Environment.Fog.HeightStart	= 61.000000
			Environment.Fog.HeightEnd		= 85.000000
			Environment.Fog.HeightDensity	= 3.130000
			Environment.Fog.FogColor1		= 0xFF2B668A
			Environment.Fog.FogColor2		= 0xFF32468B
			Environment.Fog.FogColor3		= 0xFF2B668A
			Environment.Fog.FogColor4		= 0xFF384F9C

			tag = tag + Environment.Fog.Tag
		end

		return tag
	end
}

EnvFuncList[1514] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 18.000000
			Environment.Fog.FogEnd		= 513.000000
			Environment.Fog.FogDensity1	= 0.980000
			Environment.Fog.FogDensity2	= 4.690000
			Environment.Fog.ColorDensity1	= 0.230000
			Environment.Fog.ColorDensity2	= 1.710000
			Environment.Fog.HorzDensity	= 5.610000
			Environment.Fog.HorzPower		= 1.340000
			Environment.Fog.HeightStart	= 0.000000
			Environment.Fog.HeightEnd		= 0.000000
			Environment.Fog.HeightDensity	= 0.000000
			Environment.Fog.FogColor1		= 0xFF5474A3
			Environment.Fog.FogColor2		= 0xFF1D588D
			Environment.Fog.FogColor3		= 0xFF5474A3
			Environment.Fog.FogColor4		= 0xFF1D588D

			tag = tag + Environment.Fog.Tag
		end

		return tag
	end
}

EnvFuncList[1515] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 150.000000
			Environment.Fog.FogEnd		= 324.000000
			Environment.Fog.FogDensity1	= 3.090000
			Environment.Fog.FogDensity2	= 1.220000
			Environment.Fog.ColorDensity1	= 1.100000
			Environment.Fog.ColorDensity2	= 0.180000
			Environment.Fog.HorzDensity	= 0.610000
			Environment.Fog.HorzPower		= 1.000000
			Environment.Fog.HeightStart	= 0.000000
			Environment.Fog.HeightEnd		= 0.000000
			Environment.Fog.HeightDensity	= 0.000000
			Environment.Fog.FogColor1		= 0xFF4B96BE
			Environment.Fog.FogColor2		= 0xFFA5EAF5
			Environment.Fog.FogColor3		= 0xFF4B96BE
			Environment.Fog.FogColor4		= 0xFFA5EAF5

			tag = tag + Environment.Fog.Tag
		end

		return tag
	end
}

EnvFuncList[1516] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 92.000000
			Environment.Fog.FogEnd		= 183.000000
			Environment.Fog.FogDensity1	= 0.550000
			Environment.Fog.FogDensity2	= 1.140000
			Environment.Fog.ColorDensity1	= 1.000000
			Environment.Fog.ColorDensity2	= 1.470000
			Environment.Fog.HorzDensity	= 2.200000
			Environment.Fog.HorzPower		= 1.000000
			Environment.Fog.HeightStart	= 73.000000
			Environment.Fog.HeightEnd		= 183.000000
			Environment.Fog.HeightDensity	= 0.000000
			Environment.Fog.FogColor1		= 0xFF59A2C4
			Environment.Fog.FogColor2		= 0xFF2486CE
			Environment.Fog.FogColor3		= 0xFF397E9F
			Environment.Fog.FogColor4		= 0xFF175684

			tag = tag + Environment.Fog.Tag
		end

		return tag
	end
}

EnvFuncList[1518] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 61.000000
			Environment.Fog.FogEnd		= 482.000000
			Environment.Fog.FogDensity1	= 0.000000
			Environment.Fog.FogDensity2	= 5.670000
			Environment.Fog.ColorDensity1	= 1.000000
			Environment.Fog.ColorDensity2	= 1.000000
			Environment.Fog.HorzDensity	= 3.970000
			Environment.Fog.HorzPower		= 1.000000
			Environment.Fog.HeightStart	= 0.000000
			Environment.Fog.HeightEnd		= 37.000000
			Environment.Fog.HeightDensity	= 2.380000
			Environment.Fog.FogColor1		= 0xFF8EB6EA
			Environment.Fog.FogColor2		= 0xFFA6CAD9
			Environment.Fog.FogColor3		= 0xFF2464BB
			Environment.Fog.FogColor4		= 0xFF224099

			tag = tag + Environment.Fog.Tag
		end

		return tag
	end
}

EnvFuncList[1519] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 24.000000
			Environment.Fog.FogEnd		= 446.000000
			Environment.Fog.FogDensity1	= 0.850000
			Environment.Fog.FogDensity2	= 1.770000
			Environment.Fog.ColorDensity1	= 0.370000
			Environment.Fog.ColorDensity2	= 1.770000
			Environment.Fog.HorzDensity	= 3.240000
			Environment.Fog.HorzPower		= 2.080000
			Environment.Fog.HeightStart	= 0.000000
			Environment.Fog.HeightEnd		= 0.000000
			Environment.Fog.HeightDensity	= 0.000000
			Environment.Fog.FogColor1		= 0xFF1C253C
			Environment.Fog.FogColor2		= 0xFF5F6FA7
			Environment.Fog.FogColor3		= 0xFF1C253C
			Environment.Fog.FogColor4		= 0xFF5F6FA7

			tag = tag + Environment.Fog.Tag
		end

		if Environment.Snow.Valid == false then
			Environment.Snow.Valid        = true
			Environment.Snow.Visible      = true
			Environment.Snow.SnowSpeed    = 0.300000
			Environment.Snow.SnowSize     = 0.100000
			Environment.Snow.SnowLife     = 90
			Environment.Snow.SnowColor    = 0xFFF3F4F8
			Environment.Snow.SnowGFX      = "程序联入\\暴雪地面效果.gfx"
			Environment.Rain.SnowSFX      = 4

			tag = tag + Environment.Snow.Tag
		end

		return tag
	end
}

EnvFuncList[1520] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 24.000000
			Environment.Fog.FogEnd		= 446.000000
			Environment.Fog.FogDensity1	= 0.850000
			Environment.Fog.FogDensity2	= 1.770000
			Environment.Fog.ColorDensity1	= 0.370000
			Environment.Fog.ColorDensity2	= 1.770000
			Environment.Fog.HorzDensity	= 3.240000
			Environment.Fog.HorzPower		= 2.080000
			Environment.Fog.HeightStart	= 0.000000
			Environment.Fog.HeightEnd		= 0.000000
			Environment.Fog.HeightDensity	= 0.000000
			Environment.Fog.FogColor1		= 0xFF1C253C
			Environment.Fog.FogColor2		= 0xFF5F6FA7
			Environment.Fog.FogColor3		= 0xFF1C253C
			Environment.Fog.FogColor4		= 0xFF5F6FA7

			tag = tag + Environment.Fog.Tag
		end

		if Environment.Snow.Valid == false then
			Environment.Snow.Valid        = true
			Environment.Snow.Visible      = true
			Environment.Snow.SnowSpeed    = 0.300000
			Environment.Snow.SnowSize     = 0.100000
			Environment.Snow.SnowLife     = 90
			Environment.Snow.SnowColor    = 0xFFF3F4F8
			Environment.Snow.SnowGFX      = "程序联入\\暴雪地面效果.gfx"
			Environment.Rain.SnowSFX      = 4

			tag = tag + Environment.Snow.Tag
		end

		return tag
	end
}

EnvFuncList[1521] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 85.000000
			Environment.Fog.FogEnd		= 776.000000
			Environment.Fog.FogDensity1	= 0.850000
			Environment.Fog.FogDensity2	= 4.340000
			Environment.Fog.ColorDensity1	= 1.830000
			Environment.Fog.ColorDensity2	= 4.200000
			Environment.Fog.HorzDensity	= 0.550000
			Environment.Fog.HorzPower		= 1.340000
			Environment.Fog.HeightStart	= 0.000000
			Environment.Fog.HeightEnd		= 0.000000
			Environment.Fog.HeightDensity	= 0.000000
			Environment.Fog.FogColor1		= 0xFF428ABF
			Environment.Fog.FogColor2		= 0xFF9DCADF
			Environment.Fog.FogColor3		= 0xFF1F2F4E
			Environment.Fog.FogColor4		= 0xFF263D5B

			tag = tag + Environment.Fog.Tag
		end

		return tag
	end
}

EnvFuncList[1522] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 67.000000
			Environment.Fog.FogEnd		= 147.000000
			Environment.Fog.FogDensity1	= 0.180000
			Environment.Fog.FogDensity2	= 1.220000
			Environment.Fog.ColorDensity1	= 0.610000
			Environment.Fog.ColorDensity2	= 1.380000
			Environment.Fog.HorzDensity	= 1.710000
			Environment.Fog.HorzPower		= 0.980000
			Environment.Fog.HeightStart	= 61.000000
			Environment.Fog.HeightEnd		= 159.000000
			Environment.Fog.HeightDensity	= 0.000000
			Environment.Fog.FogColor1		= 0xFF6BA6D6
			Environment.Fog.FogColor2		= 0xFF4585C5
			Environment.Fog.FogColor3		= 0xFF6BA6D6
			Environment.Fog.FogColor4		= 0xFF4585C5

			tag = tag + Environment.Fog.Tag
		end

		return tag
	end
}

EnvFuncList[1524] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 55.000000
			Environment.Fog.FogEnd		= 134.000000
			Environment.Fog.FogDensity1	= 0.240000
			Environment.Fog.FogDensity2	= 1.330000
			Environment.Fog.ColorDensity1	= 0.420000
			Environment.Fog.ColorDensity2	= 1.280000
			Environment.Fog.HorzDensity	= 3.300000
			Environment.Fog.HorzPower		= 3.300000
			Environment.Fog.HeightStart	= 0.000000
			Environment.Fog.HeightEnd		= 49.000000
			Environment.Fog.HeightDensity	= 0.610000
			Environment.Fog.FogColor1		= 0xFFC99936
			Environment.Fog.FogColor2		= 0xFF815427
			Environment.Fog.FogColor3		= 0xFF538269
			Environment.Fog.FogColor4		= 0xFF41627C

			tag = tag + Environment.Fog.Tag
		end

		return tag
	end
}

EnvFuncList[1525] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 18.000000
			Environment.Fog.FogEnd		= 263.000000
			Environment.Fog.FogDensity1	= 1.470000
			Environment.Fog.FogDensity2	= 0.730000
			Environment.Fog.ColorDensity1	= 0.920000
			Environment.Fog.ColorDensity2	= 0.980000
			Environment.Fog.HorzDensity	= 2.990000
			Environment.Fog.HorzPower		= 1.000000
			Environment.Fog.HeightStart	= 0.000000
			Environment.Fog.HeightEnd		= 18.000000
			Environment.Fog.HeightDensity	= 2.380000
			Environment.Fog.FogColor1		= 0xFF46756A
			Environment.Fog.FogColor2		= 0xFF37446A
			Environment.Fog.FogColor3		= 0xFF4A739F
			Environment.Fog.FogColor4		= 0xFF404E86

			tag = tag + Environment.Fog.Tag
		end

		return tag
	end
}

EnvFuncList[1526] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 18.000000
			Environment.Fog.FogEnd		= 623.000000
			Environment.Fog.FogDensity1	= 1.000000
			Environment.Fog.FogDensity2	= 1.000000
			Environment.Fog.ColorDensity1	= 1.000000
			Environment.Fog.ColorDensity2	= 1.000000
			Environment.Fog.HorzDensity	= 5.680000
			Environment.Fog.HorzPower		= 1.000000
			Environment.Fog.HeightStart	= 0.000000
			Environment.Fog.HeightEnd		= 0.000000
			Environment.Fog.HeightDensity	= 0.000000
			Environment.Fog.FogColor1		= 0xFF575391
			Environment.Fog.FogColor2		= 0xFF539F9F
			Environment.Fog.FogColor3		= 0xFF45497A
			Environment.Fog.FogColor4		= 0xFF35608A

			tag = tag + Environment.Fog.Tag
		end

		return tag
	end
}

EnvFuncList[1529] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 43.000000
			Environment.Fog.FogEnd		= 275.000000
			Environment.Fog.FogDensity1	= 0.370000
			Environment.Fog.FogDensity2	= 1.770000
			Environment.Fog.ColorDensity1	= 0.490000
			Environment.Fog.ColorDensity2	= 1.530000
			Environment.Fog.HorzDensity	= 2.750000
			Environment.Fog.HorzPower		= 1.340000
			Environment.Fog.HeightStart	= 0.000000
			Environment.Fog.HeightEnd		= 0.000000
			Environment.Fog.HeightDensity	= 0.000000
			Environment.Fog.FogColor1		= 0xFF4A85B5
			Environment.Fog.FogColor2		= 0xFF33457B
			Environment.Fog.FogColor3		= 0xFF4A85B5
			Environment.Fog.FogColor4		= 0xFF33457B

			tag = tag + Environment.Fog.Tag
		end

		return tag
	end
}

EnvFuncList[1530] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 49.000000
			Environment.Fog.FogEnd		= 733.000000
			Environment.Fog.FogDensity1	= 0.240000
			Environment.Fog.FogDensity2	= 1.530000
			Environment.Fog.ColorDensity1	= 0.720000
			Environment.Fog.ColorDensity2	= 2.080000
			Environment.Fog.HorzDensity	= 2.320000
			Environment.Fog.HorzPower		= 1.280000
			Environment.Fog.HeightStart	= 0.000000
			Environment.Fog.HeightEnd		= 0.000000
			Environment.Fog.HeightDensity	= 0.000000
			Environment.Fog.FogColor1		= 0xFF293336
			Environment.Fog.FogColor2		= 0xFF363952
			Environment.Fog.FogColor3		= 0xFF293336
			Environment.Fog.FogColor4		= 0xFF363952

			tag = tag + Environment.Fog.Tag
		end

		return tag
	end
}

EnvFuncList[1531] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 79.000000
			Environment.Fog.FogEnd		= 459.000000
			Environment.Fog.FogDensity1	= 0.310000
			Environment.Fog.FogDensity2	= 2.200000
			Environment.Fog.ColorDensity1	= 0.420000
			Environment.Fog.ColorDensity2	= 2.630000
			Environment.Fog.HorzDensity	= 2.750000
			Environment.Fog.HorzPower		= 2.020000
			Environment.Fog.HeightStart	= 165.000000
			Environment.Fog.HeightEnd		= 220.000000
			Environment.Fog.HeightDensity	= 4.500000
			Environment.Fog.FogColor1		= 0xFF203655
			Environment.Fog.FogColor2		= 0xFF5A7065
			Environment.Fog.FogColor3		= 0xFF536788
			Environment.Fog.FogColor4		= 0xFF2D3E79

			tag = tag + Environment.Fog.Tag
		end

		return tag
	end
}

EnvFuncList[1542] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 116.000000
			Environment.Fog.FogEnd		= 147.000000
			Environment.Fog.FogDensity1	= 0.000000
			Environment.Fog.FogDensity2	= 0.720000
			Environment.Fog.ColorDensity1	= 1.000000
			Environment.Fog.ColorDensity2	= 1.000000
			Environment.Fog.HorzDensity	= 2.000000
			Environment.Fog.HorzPower		= 1.000000
			Environment.Fog.HeightStart	= 0.000000
			Environment.Fog.HeightEnd		= 0.000000
			Environment.Fog.HeightDensity	= 0.000000
			Environment.Fog.FogColor1		= 0xFFAAB5F2
			Environment.Fog.FogColor2		= 0xFF365C87
			Environment.Fog.FogColor3		= 0xFFAAB5F2
			Environment.Fog.FogColor4		= 0xFF365C87

			tag = tag + Environment.Fog.Tag
		end

		return tag
	end
}

EnvFuncList[1544] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 0.000000
			Environment.Fog.FogEnd		= 354.000000
			Environment.Fog.FogDensity1	= 0.240000
			Environment.Fog.FogDensity2	= 0.180000
			Environment.Fog.ColorDensity1	= 0.480000
			Environment.Fog.ColorDensity2	= 0.610000
			Environment.Fog.HorzDensity	= 2.000000
			Environment.Fog.HorzPower		= 1.000000
			Environment.Fog.HeightStart	= 0.000000
			Environment.Fog.HeightEnd		= 0.000000
			Environment.Fog.HeightDensity	= 0.000000
			Environment.Fog.FogColor1		= 0xFFE6A454
			Environment.Fog.FogColor2		= 0xFF404886
			Environment.Fog.FogColor3		= 0xFFE6A454
			Environment.Fog.FogColor4		= 0xFF404886

			tag = tag + Environment.Fog.Tag
		end

		return tag
	end
}

EnvFuncList[1546] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 6.000000
			Environment.Fog.FogEnd		= 336.000000
			Environment.Fog.FogDensity1	= 0.850000
			Environment.Fog.FogDensity2	= 0.910000
			Environment.Fog.ColorDensity1	= 1.100000
			Environment.Fog.ColorDensity2	= 1.100000
			Environment.Fog.HorzDensity	= 1.650000
			Environment.Fog.HorzPower		= 0.370000
			Environment.Fog.HeightStart	= 0.000000
			Environment.Fog.HeightEnd		= 0.000000
			Environment.Fog.HeightDensity	= 0.000000
			Environment.Fog.FogColor1		= 0xFFFF6F6F
			Environment.Fog.FogColor2		= 0xFF0D206C
			Environment.Fog.FogColor3		= 0xFFFF6F6F
			Environment.Fog.FogColor4		= 0xFF0D206C

			tag = tag + Environment.Fog.Tag
		end

		return tag
	end
}

EnvFuncList[1564] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 80.000000
			Environment.Fog.FogEnd		= 537.000000
			Environment.Fog.FogDensity1	= 0.850000
			Environment.Fog.FogDensity2	= 1.330000
			Environment.Fog.ColorDensity1	= 1.000000
			Environment.Fog.ColorDensity2	= 0.000000
			Environment.Fog.HorzDensity	= 1.220000
			Environment.Fog.HorzPower		= 1.040000
			Environment.Fog.HeightStart	= 49.000000
			Environment.Fog.HeightEnd		= 305.000000
			Environment.Fog.HeightDensity	= 0.000000
			Environment.Fog.FogColor1		= 0xFFA5A4D5
			Environment.Fog.FogColor2		= 0xFF4F4D7D
			Environment.Fog.FogColor3		= 0xFFA5A4D5
			Environment.Fog.FogColor4		= 0xFF4F4D7D

			tag = tag + Environment.Fog.Tag
		end

		return tag
	end
}

EnvFuncList[1568] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 79.000000
			Environment.Fog.FogEnd		= 800.000000
			Environment.Fog.FogDensity1	= 1.100000
			Environment.Fog.FogDensity2	= 2.200000
			Environment.Fog.ColorDensity1	= 0.310000
			Environment.Fog.ColorDensity2	= 1.710000
			Environment.Fog.HorzDensity	= 2.000000
			Environment.Fog.HorzPower		= 1.000000
			Environment.Fog.HeightStart	= 0.000000
			Environment.Fog.HeightEnd		= 0.000000
			Environment.Fog.HeightDensity	= 0.000000
			Environment.Fog.FogColor1		= 0xFF256083
			Environment.Fog.FogColor2		= 0xFF0D2339
			Environment.Fog.FogColor3		= 0xFF256083
			Environment.Fog.FogColor4		= 0xFF0D2339

			tag = tag + Environment.Fog.Tag
		end

		return tag
	end
}

EnvFuncList[1589] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 128.000000
			Environment.Fog.FogEnd		= 531.000000
			Environment.Fog.FogDensity1	= 0.180000
			Environment.Fog.FogDensity2	= 3.300000
			Environment.Fog.ColorDensity1	= 0.720000
			Environment.Fog.ColorDensity2	= 2.440000
			Environment.Fog.HorzDensity	= 2.080000
			Environment.Fog.HorzPower		= 2.260000
			Environment.Fog.HeightStart	= 12.000000
			Environment.Fog.HeightEnd		= 116.000000
			Environment.Fog.HeightDensity	= 1.770000
			Environment.Fog.FogColor1		= 0xFFCCE7E8
			Environment.Fog.FogColor2		= 0xFFA4B0C4
			Environment.Fog.FogColor3		= 0xFFCCE7E8
			Environment.Fog.FogColor4		= 0xFFA4B0C4

			tag = tag + Environment.Fog.Tag
		end

		return tag
	end
}

EnvFuncList[1615] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 50.000000
			Environment.Fog.FogEnd		= 269.000000
			Environment.Fog.FogDensity1	= 0.420000
			Environment.Fog.FogDensity2	= 2.750000
			Environment.Fog.ColorDensity1	= 0.060000
			Environment.Fog.ColorDensity2	= 1.890000
			Environment.Fog.HorzDensity	= 1.220000
			Environment.Fog.HorzPower		= 1.450000
			Environment.Fog.HeightStart	= 6.000000
			Environment.Fog.HeightEnd		= 85.000000
			Environment.Fog.HeightDensity	= 5.980000
			Environment.Fog.FogColor1		= 0xFFA6BCCE
			Environment.Fog.FogColor2		= 0xFF283146
			Environment.Fog.FogColor3		= 0xFFA6BCCE
			Environment.Fog.FogColor4		= 0xFF283146

			tag = tag + Environment.Fog.Tag
		end

		return tag
	end
}

EnvFuncList[1624] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 79.000000
			Environment.Fog.FogEnd		= 391.000000
			Environment.Fog.FogDensity1	= 0.420000
			Environment.Fog.FogDensity2	= 3.410000
			Environment.Fog.ColorDensity1	= 0.120000
			Environment.Fog.ColorDensity2	= 1.580000
			Environment.Fog.HorzDensity	= 1.100000
			Environment.Fog.HorzPower		= 1.700000
			Environment.Fog.HeightStart	= 0.000000
			Environment.Fog.HeightEnd		= 0.000000
			Environment.Fog.HeightDensity	= 0.000000
			Environment.Fog.FogColor1		= 0xFFBCCBD8
			Environment.Fog.FogColor2		= 0xFF4E5884
			Environment.Fog.FogColor3		= 0xFFBCCBD8
			Environment.Fog.FogColor4		= 0xFF4E5884

			tag = tag + Environment.Fog.Tag
		end

		return tag
	end
}

EnvFuncList[1633] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 43.000000
			Environment.Fog.FogEnd		= 256.000000
			Environment.Fog.FogDensity1	= 0.970000
			Environment.Fog.FogDensity2	= 0.550000
			Environment.Fog.ColorDensity1	= 0.970000
			Environment.Fog.ColorDensity2	= 2.080000
			Environment.Fog.HorzDensity	= 3.600000
			Environment.Fog.HorzPower		= 1.330000
			Environment.Fog.HeightStart	= 0.000000
			Environment.Fog.HeightEnd		= 0.000000
			Environment.Fog.HeightDensity	= 0.000000
			Environment.Fog.FogColor1		= 0xFF28AEB9
			Environment.Fog.FogColor2		= 0xFF16424D
			Environment.Fog.FogColor3		= 0xFF28AEB9
			Environment.Fog.FogColor4		= 0xFF16424D

			tag = tag + Environment.Fog.Tag
		end

		return tag
	end
}

EnvFuncList[1666] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 85.000000
			Environment.Fog.FogEnd		= 287.000000
			Environment.Fog.FogDensity1	= 0.370000
			Environment.Fog.FogDensity2	= 0.730000
			Environment.Fog.ColorDensity1	= 0.490000
			Environment.Fog.ColorDensity2	= 1.470000
			Environment.Fog.HorzDensity	= 3.300000
			Environment.Fog.HorzPower		= 2.690000
			Environment.Fog.HeightStart	= 18.000000
			Environment.Fog.HeightEnd		= 43.000000
			Environment.Fog.HeightDensity	= 0.490000
			Environment.Fog.FogColor1		= 0xFF44E3E8
			Environment.Fog.FogColor2		= 0xFF20A2C8
			Environment.Fog.FogColor3		= 0xFF4474BB
			Environment.Fog.FogColor4		= 0xFF504EB1

			tag = tag + Environment.Fog.Tag
		end

		return tag
	end
}

EnvFuncList[1670] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 85.000000
			Environment.Fog.FogEnd		= 287.000000
			Environment.Fog.FogDensity1	= 0.370000
			Environment.Fog.FogDensity2	= 0.730000
			Environment.Fog.ColorDensity1	= 0.490000
			Environment.Fog.ColorDensity2	= 1.470000
			Environment.Fog.HorzDensity	= 3.300000
			Environment.Fog.HorzPower		= 2.690000
			Environment.Fog.HeightStart	= 18.000000
			Environment.Fog.HeightEnd		= 43.000000
			Environment.Fog.HeightDensity	= 0.490000
			Environment.Fog.FogColor1		= 0xFF44E3E8
			Environment.Fog.FogColor2		= 0xFF20A2C8
			Environment.Fog.FogColor3		= 0xFF4474BB
			Environment.Fog.FogColor4		= 0xFF504EB1

			tag = tag + Environment.Fog.Tag
		end

		return tag
	end
}

EnvFuncList[2003] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 37.000000
			Environment.Fog.FogEnd		= 171.000000
			Environment.Fog.FogDensity1	= 3.300000
			Environment.Fog.FogDensity2	= 3.900000
			Environment.Fog.ColorDensity1	= 0.720000
			Environment.Fog.ColorDensity2	= 0.970000
			Environment.Fog.HorzDensity	= 0.610000
			Environment.Fog.HorzPower		= 1.000000
			Environment.Fog.HeightStart	= 0.000000
			Environment.Fog.HeightEnd		= 0.000000
			Environment.Fog.HeightDensity	= 0.000000
			Environment.Fog.FogColor1		= 0xFF2B465E
			Environment.Fog.FogColor2		= 0xFF3A658B
			Environment.Fog.FogColor3		= 0xFF2B465E
			Environment.Fog.FogColor4		= 0xFF3A658B

			tag = tag + Environment.Fog.Tag
		end

		return tag
	end
}

EnvFuncList[2016] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 31.000000
			Environment.Fog.FogEnd		= 269.000000
			Environment.Fog.FogDensity1	= 1.260000
			Environment.Fog.FogDensity2	= 1.510000
			Environment.Fog.ColorDensity1	= 1.510000
			Environment.Fog.ColorDensity2	= 0.370000
			Environment.Fog.HorzDensity	= 0.850000
			Environment.Fog.HorzPower		= 1.380000
			Environment.Fog.HeightStart	= 0.000000
			Environment.Fog.HeightEnd		= 55.000000
			Environment.Fog.HeightDensity	= 0.850000
			Environment.Fog.FogColor1		= 0xFF153239
			Environment.Fog.FogColor2		= 0xFF142929
			Environment.Fog.FogColor3		= 0xFF153239
			Environment.Fog.FogColor4		= 0xFF142929

			tag = tag + Environment.Fog.Tag
		end

		return tag
	end
}

EnvFuncList[2018] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 55.000000
			Environment.Fog.FogEnd		= 214.000000
			Environment.Fog.FogDensity1	= 0.240000
			Environment.Fog.FogDensity2	= 1.580000
			Environment.Fog.ColorDensity1	= 1.590000
			Environment.Fog.ColorDensity2	= 2.540000
			Environment.Fog.HorzDensity	= 0.480000
			Environment.Fog.HorzPower		= 2.300000
			Environment.Fog.HeightStart	= 0.000000
			Environment.Fog.HeightEnd		= 0.000000
			Environment.Fog.HeightDensity	= 0.000000
			Environment.Fog.FogColor1		= 0xFF77ADCE
			Environment.Fog.FogColor2		= 0xFF15546C
			Environment.Fog.FogColor3		= 0xFF77ADCE
			Environment.Fog.FogColor4		= 0xFF15546C

			tag = tag + Environment.Fog.Tag
		end

		return tag
	end
}

EnvFuncList[2019] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 85.000000
			Environment.Fog.FogEnd		= 318.000000
			Environment.Fog.FogDensity1	= 0.180000
			Environment.Fog.FogDensity2	= 1.580000
			Environment.Fog.ColorDensity1	= 1.330000
			Environment.Fog.ColorDensity2	= 1.650000
			Environment.Fog.HorzDensity	= 1.400000
			Environment.Fog.HorzPower		= 2.200000
			Environment.Fog.HeightStart	= 0.000000
			Environment.Fog.HeightEnd		= 0.000000
			Environment.Fog.HeightDensity	= 0.000000
			Environment.Fog.FogColor1		= 0xFF459892
			Environment.Fog.FogColor2		= 0xFF5568AA
			Environment.Fog.FogColor3		= 0xFF71ACD0
			Environment.Fog.FogColor4		= 0xFF4585AB

			tag = tag + Environment.Fog.Tag
		end

		return tag
	end
}

EnvFuncList[2020] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 40.000000
			Environment.Fog.FogEnd		= 238.000000
			Environment.Fog.FogDensity1	= 0.610000
			Environment.Fog.FogDensity2	= 0.610000
			Environment.Fog.ColorDensity1	= 0.430000
			Environment.Fog.ColorDensity2	= 1.340000
			Environment.Fog.HorzDensity	= 2.000000
			Environment.Fog.HorzPower		= 1.000000
			Environment.Fog.HeightStart	= 0.000000
			Environment.Fog.HeightEnd		= 0.000000
			Environment.Fog.HeightDensity	= 0.000000
			Environment.Fog.FogColor1		= 0xFF5745AB
			Environment.Fog.FogColor2		= 0xFF7154AB
			Environment.Fog.FogColor3		= 0xFF4857A8
			Environment.Fog.FogColor4		= 0xFF3F4A8B

			tag = tag + Environment.Fog.Tag
		end

		return tag
	end
}

EnvFuncList[2021] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 95.000000
			Environment.Fog.FogEnd		= 380.000000
			Environment.Fog.FogDensity1	= 0.500000
			Environment.Fog.FogDensity2	= 3.480000
			Environment.Fog.ColorDensity1	= 0.500000
			Environment.Fog.ColorDensity2	= 0.670000
			Environment.Fog.HorzDensity	= 4.090000
			Environment.Fog.HorzPower		= 1.000000
			Environment.Fog.HeightStart	= 0.000000
			Environment.Fog.HeightEnd		= 0.000000
			Environment.Fog.HeightDensity	= 0.000000
			Environment.Fog.FogColor1		= 0xFF7592C8
			Environment.Fog.FogColor2		= 0xFF749CC9
			Environment.Fog.FogColor3		= 0xFF5283C5
			Environment.Fog.FogColor4		= 0xFF546AAB

			tag = tag + Environment.Fog.Tag
		end

		if Environment.Sun.Valid == false then
			Environment.Sun.Valid        = true
			Environment.Sun.Visible      = false
			Environment.Sun.SunPower     = 0.000000
			Environment.Sun.SunPower_N   = 0.000000

			tag = tag + Environment.Sun.Tag
		end

		if Environment.Rain.Valid == false then
			Environment.Rain.Valid        = true
			Environment.Rain.Visible      = true
			Environment.Rain.RainSpeed    = 0.300000
			Environment.Rain.RainSize     = 0.000000
			Environment.Rain.RainLife     = 100
			Environment.Rain.RainColor    = 0xFFCBE3F8
			Environment.Rain.RainGFX      = "程序联入\\雨丝地面效果.gfx"
			Environment.Rain.RainSFX      = 1

			tag = tag + Environment.Rain.Tag
		end

		Environment.SceneCtrl.EnvStyle = ""
		Environment.SceneCtrl.ColorMap = "Maps\\Rain_Colormapping.dds"

		return tag
	end
}

EnvFuncList[2022] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 80.000000
			Environment.Fog.FogEnd		= 318.000000
			Environment.Fog.FogDensity1	= 0.850000
			Environment.Fog.FogDensity2	= 1.000000
			Environment.Fog.ColorDensity1	= 1.160000
			Environment.Fog.ColorDensity2	= 1.040000
			Environment.Fog.HorzDensity	= 1.950000
			Environment.Fog.HorzPower		= 1.100000
			Environment.Fog.HeightStart	= 0.000000
			Environment.Fog.HeightEnd		= 0.000000
			Environment.Fog.HeightDensity	= 0.000000
			Environment.Fog.FogColor1		= 0xFF4B81B6
			Environment.Fog.FogColor2		= 0xFF3D8DA5
			Environment.Fog.FogColor3		= 0xFF4B81B6
			Environment.Fog.FogColor4		= 0xFF3D8DA5

			tag = tag + Environment.Fog.Tag
		end

		return tag
	end
}

EnvFuncList[2023] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 75.000000
			Environment.Fog.FogEnd		= 318.000000
			Environment.Fog.FogDensity1	= 0.850000
			Environment.Fog.FogDensity2	= 1.000000
			Environment.Fog.ColorDensity1	= 1.160000
			Environment.Fog.ColorDensity2	= 1.040000
			Environment.Fog.HorzDensity	= 1.950000
			Environment.Fog.HorzPower		= 1.100000
			Environment.Fog.HeightStart	= 0.000000
			Environment.Fog.HeightEnd		= 0.000000
			Environment.Fog.HeightDensity	= 0.000000
			Environment.Fog.FogColor1		= 0xFF568FBE
			Environment.Fog.FogColor2		= 0xFF659EAF
			Environment.Fog.FogColor3		= 0xFF568FBE
			Environment.Fog.FogColor4		= 0xFF659EAF

			tag = tag + Environment.Fog.Tag
		end

		return tag
	end
}

EnvFuncList[2024] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 98.000000
			Environment.Fog.FogEnd		= 727.000000
			Environment.Fog.FogDensity1	= 0.370000
			Environment.Fog.FogDensity2	= 3.480000
			Environment.Fog.ColorDensity1	= 0.490000
			Environment.Fog.ColorDensity2	= 1.220000
			Environment.Fog.HorzDensity	= 0.980000
			Environment.Fog.HorzPower		= 1.340000
			Environment.Fog.HeightStart	= 28.000000
			Environment.Fog.HeightEnd		= 43.000000
			Environment.Fog.HeightDensity	= 0.790000
			Environment.Fog.FogColor1		= 0xFFCF9E5C
			Environment.Fog.FogColor2		= 0xFFE6CB99
			Environment.Fog.FogColor3		= 0xFFCF9E5C
			Environment.Fog.FogColor4		= 0xFFE6CB99

			tag = tag + Environment.Fog.Tag
		end

		return tag
	end
}

EnvFuncList[2025] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 120.000000
			Environment.Fog.FogEnd		= 598.000000
			Environment.Fog.FogDensity1	= 0.180000
			Environment.Fog.FogDensity2	= 0.850000
			Environment.Fog.ColorDensity1	= 0.050000
			Environment.Fog.ColorDensity2	= 4.420000
			Environment.Fog.HorzDensity	= 0.980000
			Environment.Fog.HorzPower		= 1.340000
			Environment.Fog.HeightStart	= 0.000000
			Environment.Fog.HeightEnd		= 98.000000
			Environment.Fog.HeightDensity	= 0.790000
			Environment.Fog.FogColor1		= 0xFF364954
			Environment.Fog.FogColor2		= 0xFF314066
			Environment.Fog.FogColor3		= 0xFF364954
			Environment.Fog.FogColor4		= 0xFF314066

			tag = tag + Environment.Fog.Tag
		end

		return tag
	end
}

EnvFuncList[2201] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 31.000000
			Environment.Fog.FogEnd		= 226.000000
			Environment.Fog.FogDensity1	= 0.140000
			Environment.Fog.FogDensity2	= 0.920000
			Environment.Fog.ColorDensity1	= 1.590000
			Environment.Fog.ColorDensity2	= 2.560000
			Environment.Fog.HorzDensity	= 1.850000
			Environment.Fog.HorzPower		= 2.200000
			Environment.Fog.HeightStart	= 24.000000
			Environment.Fog.HeightEnd		= 98.000000
			Environment.Fog.HeightDensity	= 2.260000
			Environment.Fog.FogColor1		= 0xFF53729F
			Environment.Fog.FogColor2		= 0xFF485475
			Environment.Fog.FogColor3		= 0xFF4D688C
			Environment.Fog.FogColor4		= 0xFF2C3C61

			tag = tag + Environment.Fog.Tag
		end

		return tag
	end
}

EnvFuncList[2901] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 31.000000
			Environment.Fog.FogEnd		= 385.000000
			Environment.Fog.FogDensity1	= 0.430000
			Environment.Fog.FogDensity2	= 2.990000
			Environment.Fog.ColorDensity1	= 1.160000
			Environment.Fog.ColorDensity2	= 1.950000
			Environment.Fog.HorzDensity	= 2.020000
			Environment.Fog.HorzPower		= 1.040000
			Environment.Fog.HeightStart	= 43.000000
			Environment.Fog.HeightEnd		= 61.000000
			Environment.Fog.HeightDensity	= 2.260000
			Environment.Fog.FogColor1		= 0xFF6BE08E
			Environment.Fog.FogColor2		= 0xFF3963B0
			Environment.Fog.FogColor3		= 0xFF888B54
			Environment.Fog.FogColor4		= 0xFF7F7F7F

			tag = tag + Environment.Fog.Tag
		end

		return tag
	end
}

EnvFuncList[3101] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 12.000000
			Environment.Fog.FogEnd		= 104.000000
			Environment.Fog.FogDensity1	= 1.830000
			Environment.Fog.FogDensity2	= 2.140000
			Environment.Fog.ColorDensity1	= 0.790000
			Environment.Fog.ColorDensity2	= 0.980000
			Environment.Fog.HorzDensity	= 1.220000
			Environment.Fog.HorzPower		= 2.690000
			Environment.Fog.HeightStart	= 0.000000
			Environment.Fog.HeightEnd		= 0.000000
			Environment.Fog.HeightDensity	= 0.000000
			Environment.Fog.FogColor1		= 0xFF829793
			Environment.Fog.FogColor2		= 0xFFD1C447
			Environment.Fog.FogColor3		= 0xFF888B54
			Environment.Fog.FogColor4		= 0xFF7F7F7F

			tag = tag + Environment.Fog.Tag
		end

		if Environment.MapCtrl.Valid == false then
			Environment.MapCtrl.Valid     = true
			Environment.MapCtrl.DirLightColor  = 0x00000000
			Environment.MapCtrl.DirLightPower    = 0.000000
			Environment.MapCtrl.AmbLightColor1   = 0x00000000
			Environment.MapCtrl.AmbLightColor2   = 0x00000000
			Environment.MapCtrl.AmbLightPower    = 0.000000

			tag = tag + Environment.MapCtrl.Tag
		end

		return tag
	end
}

EnvFuncList[3102] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 12.000000
			Environment.Fog.FogEnd		= 104.000000
			Environment.Fog.FogDensity1	= 1.830000
			Environment.Fog.FogDensity2	= 2.140000
			Environment.Fog.ColorDensity1	= 0.790000
			Environment.Fog.ColorDensity2	= 0.980000
			Environment.Fog.HorzDensity	= 1.220000
			Environment.Fog.HorzPower		= 2.690000
			Environment.Fog.HeightStart	= 0.000000
			Environment.Fog.HeightEnd		= 0.000000
			Environment.Fog.HeightDensity	= 0.000000
			Environment.Fog.FogColor1		= 0xFF829793
			Environment.Fog.FogColor2		= 0xFFD1C447
			Environment.Fog.FogColor3		= 0xFF888B54
			Environment.Fog.FogColor4		= 0xFF7F7F7F

			tag = tag + Environment.Fog.Tag
		end

		if Environment.Lightning.Valid == false then
			Environment.Lightning.Valid          = true
			Environment.Lightning.Visible        = true
			Environment.Lightning.Power          = 0.050000
			Environment.Lightning.Start          = 150.000000
			Environment.Lightning.End            = 60.000000
			Environment.Lightning.Time           = 120
			Environment.Lightning.Num            = 2
			Environment.Lightning.TimeInterval   = 120
			Environment.Lightning.BetweenTime    = 80000
			Environment.Lightning.BetweenRand    = 9000
			Environment.Lightning.LightningSFX      = 3

			tag = tag + Environment.Lightning.Tag
		end

		return tag
	end
}

EnvFuncList[3103] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 12.000000
			Environment.Fog.FogEnd		= 104.000000
			Environment.Fog.FogDensity1	= 1.830000
			Environment.Fog.FogDensity2	= 2.140000
			Environment.Fog.ColorDensity1	= 0.790000
			Environment.Fog.ColorDensity2	= 0.980000
			Environment.Fog.HorzDensity	= 1.220000
			Environment.Fog.HorzPower		= 2.690000
			Environment.Fog.HeightStart	= 0.000000
			Environment.Fog.HeightEnd		= 0.000000
			Environment.Fog.HeightDensity	= 0.000000
			Environment.Fog.FogColor1		= 0xFF8592AF
			Environment.Fog.FogColor2		= 0xFFD1C447
			Environment.Fog.FogColor3		= 0xFF888B54
			Environment.Fog.FogColor4		= 0xFF7F7F7F

			tag = tag + Environment.Fog.Tag
		end

		if Environment.Rain.Valid == false then
			Environment.Rain.Valid        = true
			Environment.Rain.Visible      = true
			Environment.Rain.RainSpeed    = 0.200000
			Environment.Rain.RainSize     = 0.000000
			Environment.Rain.RainLife     = 40
			Environment.Rain.RainColor    = 0xFFDEF2F8
			Environment.Rain.RainGFX      = "程序联入\\小雨地面效果.gfx"
			Environment.Rain.RainSFX      = 2

			tag = tag + Environment.Rain.Tag
		end

		Environment.SceneCtrl.EnvStyle = ""
		Environment.SceneCtrl.ColorMap = "Maps\\Cloudy_Colormapping.dds"

		return tag
	end
}

EnvFuncList[3104] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 12.000000
			Environment.Fog.FogEnd		= 104.000000
			Environment.Fog.FogDensity1	= 1.830000
			Environment.Fog.FogDensity2	= 2.140000
			Environment.Fog.ColorDensity1	= 0.790000
			Environment.Fog.ColorDensity2	= 0.980000
			Environment.Fog.HorzDensity	= 1.220000
			Environment.Fog.HorzPower		= 2.690000
			Environment.Fog.HeightStart	= 0.000000
			Environment.Fog.HeightEnd		= 0.000000
			Environment.Fog.HeightDensity	= 0.000000
			Environment.Fog.FogColor1		= 0xFF8592AF
			Environment.Fog.FogColor2		= 0xFFD1C447
			Environment.Fog.FogColor3		= 0xFF888B54
			Environment.Fog.FogColor4		= 0xFF7F7F7F

			tag = tag + Environment.Fog.Tag
		end

		if Environment.Rain.Valid == false then
			Environment.Rain.Valid        = true
			Environment.Rain.Visible      = true
			Environment.Rain.RainSpeed    = 0.500000
			Environment.Rain.RainSize     = 0.000000
			Environment.Rain.RainLife     = 100
			Environment.Rain.RainColor    = 0xFFCBE3F8
			Environment.Rain.RainGFX      = "程序联入\\雨丝地面效果.gfx"
			Environment.Rain.RainSFX      = 1

			tag = tag + Environment.Rain.Tag
		end

		Environment.SceneCtrl.EnvStyle = ""
		Environment.SceneCtrl.ColorMap = "Maps\\Rain_Colormapping.dds"

		return tag
	end
}

EnvFuncList[3105] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 12.000000
			Environment.Fog.FogEnd		= 104.000000
			Environment.Fog.FogDensity1	= 1.830000
			Environment.Fog.FogDensity2	= 2.140000
			Environment.Fog.ColorDensity1	= 0.790000
			Environment.Fog.ColorDensity2	= 0.980000
			Environment.Fog.HorzDensity	= 1.220000
			Environment.Fog.HorzPower		= 2.690000
			Environment.Fog.HeightStart	= 0.000000
			Environment.Fog.HeightEnd		= 0.000000
			Environment.Fog.HeightDensity	= 0.000000
			Environment.Fog.FogColor1		= 0xFF8592AF
			Environment.Fog.FogColor2		= 0xFFD1C447
			Environment.Fog.FogColor3		= 0xFF888B54
			Environment.Fog.FogColor4		= 0xFF7F7F7F

			tag = tag + Environment.Fog.Tag
		end

		if Environment.Rain.Valid == false then
			Environment.Rain.Valid        = true
			Environment.Rain.Visible      = true
			Environment.Rain.RainSpeed    = 0.500000
			Environment.Rain.RainSize     = 0.000000
			Environment.Rain.RainLife     = 100
			Environment.Rain.RainColor    = 0xFF000000
			Environment.Rain.RainGFX      = "程序联入\\暴雨地面效果.gfx"
			Environment.Rain.RainSFX      = 1

			tag = tag + Environment.Rain.Tag
		end

		if Environment.Lightning.Valid == false then
			Environment.Lightning.Valid          = true
			Environment.Lightning.Visible        = true
			Environment.Lightning.Power          = 0.030000
			Environment.Lightning.Start          = 120.000000
			Environment.Lightning.End            = 60.000000
			Environment.Lightning.Time           = 120
			Environment.Lightning.Num            = 3
			Environment.Lightning.TimeInterval   = 150
			Environment.Lightning.BetweenTime    = 40000
			Environment.Lightning.BetweenRand    = 5000
			Environment.Lightning.LightningSFX      = 3

			tag = tag + Environment.Lightning.Tag
		end

		Environment.SceneCtrl.EnvStyle = ""
		Environment.SceneCtrl.ColorMap = "Maps\\Rain_Colormapping.dds"

		return tag
	end
}

EnvFuncList[3106] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 12.000000
			Environment.Fog.FogEnd		= 104.000000
			Environment.Fog.FogDensity1	= 1.830000
			Environment.Fog.FogDensity2	= 1.000000
			Environment.Fog.ColorDensity1	= 0.790000
			Environment.Fog.ColorDensity2	= 0.980000
			Environment.Fog.HorzDensity	= 1.220000
			Environment.Fog.HorzPower		= 2.690000
			Environment.Fog.HeightStart	= 0.000000
			Environment.Fog.HeightEnd		= 0.000000
			Environment.Fog.HeightDensity	= 0.000000
			Environment.Fog.FogColor1		= 0xFF6D9BB6
			Environment.Fog.FogColor2		= 0xFF7F7F7F
			Environment.Fog.FogColor3		= 0xFF888B54
			Environment.Fog.FogColor4		= 0xFF7F7F7F

			tag = tag + Environment.Fog.Tag
		end

		if Environment.Snow.Valid == false then
			Environment.Snow.Valid        = true
			Environment.Snow.Visible      = true
			Environment.Snow.SnowSpeed    = 0.300000
			Environment.Snow.SnowSize     = 0.100000
			Environment.Snow.SnowLife     = 90
			Environment.Snow.SnowColor    = 0xFFAEE1F4
			Environment.Snow.SnowGFX      = "程序联入\\暴雪地面效果.gfx"
			Environment.Rain.SnowSFX      = 4

			tag = tag + Environment.Snow.Tag
		end

		Environment.SceneCtrl.EnvStyle = ""
		Environment.SceneCtrl.ColorMap = "Maps\\Rain_Colormapping.dds"

		return tag
	end
}

EnvFuncList[5101] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 18.000000
			Environment.Fog.FogEnd		= 140.000000
			Environment.Fog.FogDensity1	= 0.790000
			Environment.Fog.FogDensity2	= 1.400000
			Environment.Fog.ColorDensity1	= 0.730000
			Environment.Fog.ColorDensity2	= 1.040000
			Environment.Fog.HorzDensity	= 1.890000
			Environment.Fog.HorzPower		= 0.920000
			Environment.Fog.HeightStart	= 17.000000
			Environment.Fog.HeightEnd		= 28.500000
			Environment.Fog.HeightDensity	= 4.520000
			Environment.Fog.FogColor1		= 0xFF6BEFCB
			Environment.Fog.FogColor2		= 0xFF4D88CA
			Environment.Fog.FogColor3		= 0xFF888B54
			Environment.Fog.FogColor4		= 0xFF7F7F7F

			tag = tag + Environment.Fog.Tag
		end

		return tag
	end
}

EnvFuncList[5102] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 18.000000
			Environment.Fog.FogEnd		= 140.000000
			Environment.Fog.FogDensity1	= 0.790000
			Environment.Fog.FogDensity2	= 1.400000
			Environment.Fog.ColorDensity1	= 0.730000
			Environment.Fog.ColorDensity2	= 1.040000
			Environment.Fog.HorzDensity	= 1.890000
			Environment.Fog.HorzPower		= 0.920000
			Environment.Fog.HeightStart	= 17.000000
			Environment.Fog.HeightEnd		= 28.500000
			Environment.Fog.HeightDensity	= 4.520000
			Environment.Fog.FogColor1		= 0xFF6BEFCB
			Environment.Fog.FogColor2		= 0xFF4D88CA
			Environment.Fog.FogColor3		= 0xFF888B54
			Environment.Fog.FogColor4		= 0xFF7F7F7F

			tag = tag + Environment.Fog.Tag
		end

		if Environment.Lightning.Valid == false then
			Environment.Lightning.Valid          = true
			Environment.Lightning.Visible        = true
			Environment.Lightning.Power          = 0.030000
			Environment.Lightning.Start          = 150.000000
			Environment.Lightning.End            = 60.000000
			Environment.Lightning.Time           = 150
			Environment.Lightning.Num            = 2
			Environment.Lightning.TimeInterval   = 140
			Environment.Lightning.BetweenTime    = 90000
			Environment.Lightning.BetweenRand    = 7000
			Environment.Lightning.LightningSFX      = 3

			tag = tag + Environment.Lightning.Tag
		end

		Environment.SceneCtrl.EnvStyle = ""
		Environment.SceneCtrl.ColorMap = "Maps\\Cloudy_Colormapping.dds"

		return tag
	end
}

EnvFuncList[5103] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 18.000000
			Environment.Fog.FogEnd		= 140.000000
			Environment.Fog.FogDensity1	= 0.790000
			Environment.Fog.FogDensity2	= 1.400000
			Environment.Fog.ColorDensity1	= 0.730000
			Environment.Fog.ColorDensity2	= 1.040000
			Environment.Fog.HorzDensity	= 1.890000
			Environment.Fog.HorzPower		= 0.920000
			Environment.Fog.HeightStart	= 17.000000
			Environment.Fog.HeightEnd		= 28.500000
			Environment.Fog.HeightDensity	= 4.520000
			Environment.Fog.FogColor1		= 0xFF6BEFCB
			Environment.Fog.FogColor2		= 0xFF4D88CA
			Environment.Fog.FogColor3		= 0xFF888B54
			Environment.Fog.FogColor4		= 0xFF7F7F7F

			tag = tag + Environment.Fog.Tag
		end

		if Environment.Rain.Valid == false then
			Environment.Rain.Valid        = true
			Environment.Rain.Visible      = true
			Environment.Rain.RainSpeed    = 0.200000
			Environment.Rain.RainSize     = 0.000000
			Environment.Rain.RainLife     = 40
			Environment.Rain.RainColor    = 0xFFDEF2F8
			Environment.Rain.RainGFX      = "程序联入\\小雨地面效果.gfx"
			Environment.Rain.RainSFX      = 2

			tag = tag + Environment.Rain.Tag
		end

		Environment.SceneCtrl.EnvStyle = ""
		Environment.SceneCtrl.ColorMap = "Maps\\Cloudy_Colormapping.dds"

		return tag
	end
}

EnvFuncList[5104] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 18.000000
			Environment.Fog.FogEnd		= 140.000000
			Environment.Fog.FogDensity1	= 0.790000
			Environment.Fog.FogDensity2	= 1.400000
			Environment.Fog.ColorDensity1	= 0.730000
			Environment.Fog.ColorDensity2	= 1.040000
			Environment.Fog.HorzDensity	= 1.890000
			Environment.Fog.HorzPower		= 0.920000
			Environment.Fog.HeightStart	= 17.000000
			Environment.Fog.HeightEnd		= 28.500000
			Environment.Fog.HeightDensity	= 4.520000
			Environment.Fog.FogColor1		= 0xFF76E1E4
			Environment.Fog.FogColor2		= 0xFF4D88CA
			Environment.Fog.FogColor3		= 0xFF888B54
			Environment.Fog.FogColor4		= 0xFF7F7F7F

			tag = tag + Environment.Fog.Tag
		end

		if Environment.Rain.Valid == false then
			Environment.Rain.Valid        = true
			Environment.Rain.Visible      = true
			Environment.Rain.RainSpeed    = 0.300000
			Environment.Rain.RainSize     = 0.000000
			Environment.Rain.RainLife     = 100
			Environment.Rain.RainColor    = 0xFFCBE3F8
			Environment.Rain.RainGFX      = "程序联入\\雨丝地面效果.gfx"
			Environment.Rain.RainSFX      = 1

			tag = tag + Environment.Rain.Tag
		end

		Environment.SceneCtrl.EnvStyle = ""
		Environment.SceneCtrl.ColorMap = "Maps\\Rain_Colormapping.dds"

		return tag
	end
}

EnvFuncList[5105] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 18.000000
			Environment.Fog.FogEnd		= 140.000000
			Environment.Fog.FogDensity1	= 0.790000
			Environment.Fog.FogDensity2	= 1.400000
			Environment.Fog.ColorDensity1	= 0.730000
			Environment.Fog.ColorDensity2	= 1.040000
			Environment.Fog.HorzDensity	= 1.890000
			Environment.Fog.HorzPower		= 0.920000
			Environment.Fog.HeightStart	= 17.000000
			Environment.Fog.HeightEnd		= 28.500000
			Environment.Fog.HeightDensity	= 4.520000
			Environment.Fog.FogColor1		= 0xFF76E1E4
			Environment.Fog.FogColor2		= 0xFF4D88CA
			Environment.Fog.FogColor3		= 0xFF888B54
			Environment.Fog.FogColor4		= 0xFF7F7F7F

			tag = tag + Environment.Fog.Tag
		end

		if Environment.Rain.Valid == false then
			Environment.Rain.Valid        = true
			Environment.Rain.Visible      = true
			Environment.Rain.RainSpeed    = 0.500000
			Environment.Rain.RainSize     = 0.000000
			Environment.Rain.RainLife     = 100
			Environment.Rain.RainColor    = 0xFFD6E9F1
			Environment.Rain.RainGFX      = "程序联入\\暴雨地面效果.gfx"
			Environment.Rain.RainSFX      = 1

			tag = tag + Environment.Rain.Tag
		end

		if Environment.Lightning.Valid == false then
			Environment.Lightning.Valid          = true
			Environment.Lightning.Visible        = true
			Environment.Lightning.Power          = 0.030000
			Environment.Lightning.Start          = 120.000000
			Environment.Lightning.End            = 60.000000
			Environment.Lightning.Time           = 120
			Environment.Lightning.Num            = 3
			Environment.Lightning.TimeInterval   = 150
			Environment.Lightning.BetweenTime    = 50000
			Environment.Lightning.BetweenRand    = 7000
			Environment.Lightning.LightningSFX      = 3

			tag = tag + Environment.Lightning.Tag
		end

		Environment.SceneCtrl.EnvStyle = ""
		Environment.SceneCtrl.ColorMap = "Maps\\Rain_Colormapping.dds"

		return tag
	end
}

EnvFuncList[5106] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 18.000000
			Environment.Fog.FogEnd		= 140.000000
			Environment.Fog.FogDensity1	= 0.790000
			Environment.Fog.FogDensity2	= 1.400000
			Environment.Fog.ColorDensity1	= 0.730000
			Environment.Fog.ColorDensity2	= 1.040000
			Environment.Fog.HorzDensity	= 1.890000
			Environment.Fog.HorzPower		= 0.920000
			Environment.Fog.HeightStart	= 17.000000
			Environment.Fog.HeightEnd		= 28.500000
			Environment.Fog.HeightDensity	= 4.520000
			Environment.Fog.FogColor1		= 0xFF6BEFCB
			Environment.Fog.FogColor2		= 0xFF4D88CA
			Environment.Fog.FogColor3		= 0xFF888B54
			Environment.Fog.FogColor4		= 0xFF7F7F7F

			tag = tag + Environment.Fog.Tag
		end

		if Environment.Snow.Valid == false then
			Environment.Snow.Valid        = true
			Environment.Snow.Visible      = true
			Environment.Snow.SnowSpeed    = 0.300000
			Environment.Snow.SnowSize     = 0.100000
			Environment.Snow.SnowLife     = 90
			Environment.Snow.SnowColor    = 0xFFAEE1F4
			Environment.Snow.SnowGFX      = "程序联入\\暴雪地面效果.gfx"
			Environment.Rain.SnowSFX      = 4

			tag = tag + Environment.Snow.Tag
		end

		Environment.SceneCtrl.EnvStyle = ""
		Environment.SceneCtrl.ColorMap = "Maps\\Rain_Colormapping.dds"

		return tag
	end
}

EnvFuncList[7200] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 60.000000
			Environment.Fog.FogEnd		= 635.000000
			Environment.Fog.FogDensity1	= 0.370000
			Environment.Fog.FogDensity2	= 5.070000
			Environment.Fog.ColorDensity1	= 0.370000
			Environment.Fog.ColorDensity2	= 1.260000
			Environment.Fog.HorzDensity	= 2.750000
			Environment.Fog.HorzPower		= 2.000000
			Environment.Fog.HeightStart	= 0.000000
			Environment.Fog.HeightEnd		= 0.000000
			Environment.Fog.HeightDensity	= 2.140000
			Environment.Fog.FogColor1		= 0xFF84ACC1
			Environment.Fog.FogColor2		= 0xFF0582E7
			Environment.Fog.FogColor3		= 0xFF6560C8
			Environment.Fog.FogColor4		= 0xFF213E72

			tag = tag + Environment.Fog.Tag
		end

		return tag
	end
}

EnvFuncList[7701] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 43.000000
			Environment.Fog.FogEnd		= 128.000000
			Environment.Fog.FogDensity1	= 0.180000
			Environment.Fog.FogDensity2	= 3.240000
			Environment.Fog.ColorDensity1	= 0.670000
			Environment.Fog.ColorDensity2	= 1.770000
			Environment.Fog.HorzDensity	= 2.140000
			Environment.Fog.HorzPower		= 2.380000
			Environment.Fog.HeightStart	= 20.000000
			Environment.Fog.HeightEnd		= 49.000000
			Environment.Fog.HeightDensity	= 2.140000
			Environment.Fog.FogColor1		= 0xFF919ECE
			Environment.Fog.FogColor2		= 0xFF365A96
			Environment.Fog.FogColor3		= 0xFF888B54
			Environment.Fog.FogColor4		= 0xFF7F7F7F

			tag = tag + Environment.Fog.Tag
		end

		return tag
	end
}

EnvFuncList[9004] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 18.000000
			Environment.Fog.FogEnd		= 67.000000
			Environment.Fog.FogDensity1	= 0.060000
			Environment.Fog.FogDensity2	= 3.360000
			Environment.Fog.ColorDensity1	= 0.000000
			Environment.Fog.ColorDensity2	= 2.870000
			Environment.Fog.HorzDensity	= 1.280000
			Environment.Fog.HorzPower		= 1.710000
			Environment.Fog.HeightStart	= 0.000000
			Environment.Fog.HeightEnd		= 0.000000
			Environment.Fog.HeightDensity	= 9.000000
			Environment.Fog.FogColor1		= 0xFF91A7F2
			Environment.Fog.FogColor2		= 0xFF9978EF
			Environment.Fog.FogColor3		= 0xFF888B54
			Environment.Fog.FogColor4		= 0xFF7F7F7F

			tag = tag + Environment.Fog.Tag
		end

		return tag
	end
}

EnvFuncList[9006] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 6.000000
			Environment.Fog.FogEnd		= 200.000000
			Environment.Fog.FogDensity1	= 1.000000
			Environment.Fog.FogDensity2	= 1.530000
			Environment.Fog.ColorDensity1	= 0.850000
			Environment.Fog.ColorDensity2	= 1.040000
			Environment.Fog.HorzDensity	= 1.710000
			Environment.Fog.HorzPower		= 1.000000
			Environment.Fog.HeightStart	= 92.000000
			Environment.Fog.HeightEnd		= 165.000000
			Environment.Fog.HeightDensity	= 1.890000
			Environment.Fog.FogColor1		= 0xFF67C5B9
			Environment.Fog.FogColor2		= 0xFF5757CE
			Environment.Fog.FogColor3		= 0xFF8080FF
			Environment.Fog.FogColor4		= 0xFF272778

			tag = tag + Environment.Fog.Tag
		end

		return tag
	end
}

EnvFuncList[9101] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 31.000000
			Environment.Fog.FogEnd		= 110.000000
			Environment.Fog.FogDensity1	= 0.240000
			Environment.Fog.FogDensity2	= 2.380000
			Environment.Fog.ColorDensity1	= 0.790000
			Environment.Fog.ColorDensity2	= 1.100000
			Environment.Fog.HorzDensity	= 0.370000
			Environment.Fog.HorzPower		= 0.850000
			Environment.Fog.HeightStart	= 15.000000
			Environment.Fog.HeightEnd		= 35.000000
			Environment.Fog.HeightDensity	= 3.540000
			Environment.Fog.FogColor1		= 0xFFA6CEE6
			Environment.Fog.FogColor2		= 0xFF62D0BA
			Environment.Fog.FogColor3		= 0xFF888B54
			Environment.Fog.FogColor4		= 0xFF7F7F7F

			tag = tag + Environment.Fog.Tag
		end

		return tag
	end
}

EnvFuncList[9102] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 31.000000
			Environment.Fog.FogEnd		= 110.000000
			Environment.Fog.FogDensity1	= 0.240000
			Environment.Fog.FogDensity2	= 2.380000
			Environment.Fog.ColorDensity1	= 0.790000
			Environment.Fog.ColorDensity2	= 1.100000
			Environment.Fog.HorzDensity	= 0.370000
			Environment.Fog.HorzPower		= 0.850000
			Environment.Fog.HeightStart	= 15.000000
			Environment.Fog.HeightEnd		= 35.000000
			Environment.Fog.HeightDensity	= 3.540000
			Environment.Fog.FogColor1		= 0xFFA6CEE6
			Environment.Fog.FogColor2		= 0xFF62D0BA
			Environment.Fog.FogColor3		= 0xFF888B54
			Environment.Fog.FogColor4		= 0xFF7F7F7F

			tag = tag + Environment.Fog.Tag
		end

		if Environment.Lightning.Valid == false then
			Environment.Lightning.Valid          = true
			Environment.Lightning.Visible        = true
			Environment.Lightning.Power          = 0.040000
			Environment.Lightning.Start          = 140.000000
			Environment.Lightning.End            = 60.000000
			Environment.Lightning.Time           = 120
			Environment.Lightning.Num            = 3
			Environment.Lightning.TimeInterval   = 140
			Environment.Lightning.BetweenTime    = 90000
			Environment.Lightning.BetweenRand    = 6000
			Environment.Lightning.LightningSFX      = 3

			tag = tag + Environment.Lightning.Tag
		end

		return tag
	end
}

EnvFuncList[9103] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 31.000000
			Environment.Fog.FogEnd		= 110.000000
			Environment.Fog.FogDensity1	= 0.240000
			Environment.Fog.FogDensity2	= 2.380000
			Environment.Fog.ColorDensity1	= 0.790000
			Environment.Fog.ColorDensity2	= 1.100000
			Environment.Fog.HorzDensity	= 0.370000
			Environment.Fog.HorzPower		= 0.850000
			Environment.Fog.HeightStart	= 15.000000
			Environment.Fog.HeightEnd		= 35.000000
			Environment.Fog.HeightDensity	= 3.540000
			Environment.Fog.FogColor1		= 0xFFA6CEE6
			Environment.Fog.FogColor2		= 0xFF62D0BA
			Environment.Fog.FogColor3		= 0xFF888B54
			Environment.Fog.FogColor4		= 0xFF7F7F7F

			tag = tag + Environment.Fog.Tag
		end

		if Environment.Rain.Valid == false then
			Environment.Rain.Valid        = true
			Environment.Rain.Visible      = true
			Environment.Rain.RainSpeed    = 0.000000
			Environment.Rain.RainSize     = 0.000000
			Environment.Rain.RainLife     = 0
			Environment.Rain.RainColor    = 0xFF000000
			Environment.Rain.RainGFX      = "程序联入\\小雨地面效果.gfx"
			Environment.Rain.RainSFX      = 2

			tag = tag + Environment.Rain.Tag
		end

		Environment.SceneCtrl.EnvStyle = ""
		Environment.SceneCtrl.ColorMap = "Maps\\Cloudy_Colormapping.dds"

		return tag
	end
}

EnvFuncList[9104] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 31.000000
			Environment.Fog.FogEnd		= 110.000000
			Environment.Fog.FogDensity1	= 0.240000
			Environment.Fog.FogDensity2	= 2.380000
			Environment.Fog.ColorDensity1	= 0.790000
			Environment.Fog.ColorDensity2	= 1.100000
			Environment.Fog.HorzDensity	= 0.370000
			Environment.Fog.HorzPower		= 0.850000
			Environment.Fog.HeightStart	= 15.000000
			Environment.Fog.HeightEnd		= 35.000000
			Environment.Fog.HeightDensity	= 3.540000
			Environment.Fog.FogColor1		= 0xFFA6CEE6
			Environment.Fog.FogColor2		= 0xFF62D0BA
			Environment.Fog.FogColor3		= 0xFF888B54
			Environment.Fog.FogColor4		= 0xFF7F7F7F

			tag = tag + Environment.Fog.Tag
		end

		if Environment.Rain.Valid == false then
			Environment.Rain.Valid        = true
			Environment.Rain.Visible      = true
			Environment.Rain.RainSpeed    = 0.000000
			Environment.Rain.RainSize     = 0.000000
			Environment.Rain.RainLife     = 0
			Environment.Rain.RainColor    = 0xFF000000
			Environment.Rain.RainGFX      = "程序联入\\雨丝地面效果.gfx"
			Environment.Rain.RainSFX      = 1

			tag = tag + Environment.Rain.Tag
		end

		Environment.SceneCtrl.EnvStyle = ""
		Environment.SceneCtrl.ColorMap = "Maps\\Rain_Colormapping.dds"

		return tag
	end
}

EnvFuncList[9105] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 31.000000
			Environment.Fog.FogEnd		= 110.000000
			Environment.Fog.FogDensity1	= 0.240000
			Environment.Fog.FogDensity2	= 2.380000
			Environment.Fog.ColorDensity1	= 0.790000
			Environment.Fog.ColorDensity2	= 1.100000
			Environment.Fog.HorzDensity	= 0.370000
			Environment.Fog.HorzPower		= 0.850000
			Environment.Fog.HeightStart	= 15.000000
			Environment.Fog.HeightEnd		= 35.000000
			Environment.Fog.HeightDensity	= 3.540000
			Environment.Fog.FogColor1		= 0xFFA6CEE6
			Environment.Fog.FogColor2		= 0xFF62D0BA
			Environment.Fog.FogColor3		= 0xFF888B54
			Environment.Fog.FogColor4		= 0xFF7F7F7F

			tag = tag + Environment.Fog.Tag
		end

		if Environment.Rain.Valid == false then
			Environment.Rain.Valid        = true
			Environment.Rain.Visible      = true
			Environment.Rain.RainSpeed    = 0.000000
			Environment.Rain.RainSize     = 0.000000
			Environment.Rain.RainLife     = 0
			Environment.Rain.RainColor    = 0xFF000000
			Environment.Rain.RainGFX      = "程序联入\\暴雨地面效果.gfx"
			Environment.Rain.RainSFX      = 1

			tag = tag + Environment.Rain.Tag
		end

		if Environment.Lightning.Valid == false then
			Environment.Lightning.Valid          = true
			Environment.Lightning.Visible        = true
			Environment.Lightning.Power          = 0.030000
			Environment.Lightning.Start          = 135.000000
			Environment.Lightning.End            = 60.000000
			Environment.Lightning.Time           = 120
			Environment.Lightning.Num            = 3
			Environment.Lightning.TimeInterval   = 150
			Environment.Lightning.BetweenTime    = 65000
			Environment.Lightning.BetweenRand    = 7000
			Environment.Lightning.LightningSFX      = 3

			tag = tag + Environment.Lightning.Tag
		end

		Environment.SceneCtrl.EnvStyle = ""
		Environment.SceneCtrl.ColorMap = "Maps\\Rain_Colormapping.dds"

		return tag
	end
}

EnvFuncList[9106] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 31.000000
			Environment.Fog.FogEnd		= 110.000000
			Environment.Fog.FogDensity1	= 0.240000
			Environment.Fog.FogDensity2	= 2.380000
			Environment.Fog.ColorDensity1	= 0.790000
			Environment.Fog.ColorDensity2	= 1.100000
			Environment.Fog.HorzDensity	= 0.370000
			Environment.Fog.HorzPower		= 0.850000
			Environment.Fog.HeightStart	= 15.000000
			Environment.Fog.HeightEnd		= 35.000000
			Environment.Fog.HeightDensity	= 3.540000
			Environment.Fog.FogColor1		= 0xFFA6CEE6
			Environment.Fog.FogColor2		= 0xFF62D0BA
			Environment.Fog.FogColor3		= 0xFF888B54
			Environment.Fog.FogColor4		= 0xFF7F7F7F

			tag = tag + Environment.Fog.Tag
		end

		if Environment.Snow.Valid == false then
			Environment.Snow.Valid        = true
			Environment.Snow.Visible      = true
			Environment.Snow.SnowSpeed    = 0.300000
			Environment.Snow.SnowSize     = 0.100000
			Environment.Snow.SnowLife     = 90
			Environment.Snow.SnowColor    = 0xFFAEE1F4
			Environment.Snow.SnowGFX      = "程序联入\\暴雪地面效果.gfx"
			Environment.Rain.SnowSFX      = 4

			tag = tag + Environment.Snow.Tag
		end

		Environment.SceneCtrl.EnvStyle = ""
		Environment.SceneCtrl.ColorMap = "Maps\\Rain_Colormapping.dds"

		return tag
	end
}

EnvFuncList[10001] =
{
	ApplyFunc = function ()
		local  tag = 0

		return tag
	end
}

EnvFuncList[10006] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 180.000000
			Environment.Fog.FogEnd		= 800.000000
			Environment.Fog.FogDensity1	= 0.850000
			Environment.Fog.FogDensity2	= 0.850000
			Environment.Fog.ColorDensity1	= 0.720000
			Environment.Fog.ColorDensity2	= 1.280000
			Environment.Fog.HorzDensity	= 0.720000
			Environment.Fog.HorzPower		= 0.720000
			Environment.Fog.HeightStart	= 0.000000
			Environment.Fog.HeightEnd		= 0.000000
			Environment.Fog.HeightDensity	= 0.000000
			Environment.Fog.FogColor1		= 0xFFABDDE2
			Environment.Fog.FogColor2		= 0xFF248DCC
			Environment.Fog.FogColor3		= 0xFF2D6F8E
			Environment.Fog.FogColor4		= 0xFF023A53

			tag = tag + Environment.Fog.Tag
		end

		return tag
	end
}

EnvFuncList[10008] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 180.000000
			Environment.Fog.FogEnd		= 727.000000
			Environment.Fog.FogDensity1	= 0.000000
			Environment.Fog.FogDensity2	= 1.160000
			Environment.Fog.ColorDensity1	= 0.000000
			Environment.Fog.ColorDensity2	= 0.660000
			Environment.Fog.HorzDensity	= 2.750000
			Environment.Fog.HorzPower		= 0.720000
			Environment.Fog.HeightStart	= 0.000000
			Environment.Fog.HeightEnd		= 0.000000
			Environment.Fog.HeightDensity	= 0.000000
			Environment.Fog.FogColor1		= 0xFFA6E1E8
			Environment.Fog.FogColor2		= 0xFF434D5F
			Environment.Fog.FogColor3		= 0xFF6D85A7
			Environment.Fog.FogColor4		= 0xFF241A3C

			tag = tag + Environment.Fog.Tag
		end

		return tag
	end
}

EnvFuncList[11153] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 31.000000
			Environment.Fog.FogEnd		= 666.000000
			Environment.Fog.FogDensity1	= 0.420000
			Environment.Fog.FogDensity2	= 2.630000
			Environment.Fog.ColorDensity1	= 0.420000
			Environment.Fog.ColorDensity2	= 1.530000
			Environment.Fog.HorzDensity	= 1.890000
			Environment.Fog.HorzPower		= 1.330000
			Environment.Fog.HeightStart	= 61.000000
			Environment.Fog.HeightEnd		= 202.000000
			Environment.Fog.HeightDensity	= 4.810000
			Environment.Fog.FogColor1		= 0xFFD9E8EE
			Environment.Fog.FogColor2		= 0xFFA9BFD6
			Environment.Fog.FogColor3		= 0xFFD9E8EE
			Environment.Fog.FogColor4		= 0xFFA9BFD6

			tag = tag + Environment.Fog.Tag
		end

		if Environment.Sun.Valid == false then
			Environment.Sun.Valid        = true
			Environment.Sun.Visible      = false
			Environment.Sun.SunPower     = 0.000000
			Environment.Sun.SunPower_N   = 0.000000

			tag = tag + Environment.Sun.Tag
		end

		if Environment.Snow.Valid == false then
			Environment.Snow.Valid        = true
			Environment.Snow.Visible      = true
			Environment.Snow.SnowSpeed    = 0.300000
			Environment.Snow.SnowSize     = 0.100000
			Environment.Snow.SnowLife     = 90
			Environment.Snow.SnowColor    = 0xFFAEE1F4
			Environment.Snow.SnowGFX      = "程序联入\\暴雪地面效果.gfx"
			Environment.Rain.SnowSFX      = 4

			tag = tag + Environment.Snow.Tag
		end

		return tag
	end
}

EnvFuncList[34101] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 17.000000
			Environment.Fog.FogEnd		= 299.000000
			Environment.Fog.FogDensity1	= 1.000000
			Environment.Fog.FogDensity2	= 0.920000
			Environment.Fog.ColorDensity1	= 1.160000
			Environment.Fog.ColorDensity2	= 0.310000
			Environment.Fog.HorzDensity	= 2.990000
			Environment.Fog.HorzPower		= 2.200000
			Environment.Fog.HeightStart	= 55.000000
			Environment.Fog.HeightEnd		= 92.000000
			Environment.Fog.HeightDensity	= 3.240000
			Environment.Fog.FogColor1		= 0xFF4AC5E3
			Environment.Fog.FogColor2		= 0xFFCB5754
			Environment.Fog.FogColor3		= 0xFF888B54
			Environment.Fog.FogColor4		= 0xFF7F7F7F

			tag = tag + Environment.Fog.Tag
		end

		return tag
	end
}

EnvFuncList[34102] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 17.000000
			Environment.Fog.FogEnd		= 299.000000
			Environment.Fog.FogDensity1	= 1.000000
			Environment.Fog.FogDensity2	= 0.920000
			Environment.Fog.ColorDensity1	= 1.160000
			Environment.Fog.ColorDensity2	= 0.310000
			Environment.Fog.HorzDensity	= 2.990000
			Environment.Fog.HorzPower		= 2.200000
			Environment.Fog.HeightStart	= 55.000000
			Environment.Fog.HeightEnd		= 92.000000
			Environment.Fog.HeightDensity	= 3.240000
			Environment.Fog.FogColor1		= 0xFF4AC5E3
			Environment.Fog.FogColor2		= 0xFFCB5754
			Environment.Fog.FogColor3		= 0xFF888B54
			Environment.Fog.FogColor4		= 0xFF7F7F7F

			tag = tag + Environment.Fog.Tag
		end

		if Environment.Lightning.Valid == false then
			Environment.Lightning.Valid          = true
			Environment.Lightning.Visible        = true
			Environment.Lightning.Power          = 0.030000
			Environment.Lightning.Start          = 120.000000
			Environment.Lightning.End            = 60.000000
			Environment.Lightning.Time           = 140
			Environment.Lightning.Num            = 2
			Environment.Lightning.TimeInterval   = 150
			Environment.Lightning.BetweenTime    = 90000
			Environment.Lightning.BetweenRand    = 7000
			Environment.Lightning.LightningSFX      = 3

			tag = tag + Environment.Lightning.Tag
		end

		return tag
	end
}

EnvFuncList[34103] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 17.000000
			Environment.Fog.FogEnd		= 299.000000
			Environment.Fog.FogDensity1	= 1.000000
			Environment.Fog.FogDensity2	= 0.920000
			Environment.Fog.ColorDensity1	= 1.160000
			Environment.Fog.ColorDensity2	= 0.310000
			Environment.Fog.HorzDensity	= 2.990000
			Environment.Fog.HorzPower		= 2.200000
			Environment.Fog.HeightStart	= 55.000000
			Environment.Fog.HeightEnd		= 92.000000
			Environment.Fog.HeightDensity	= 3.240000
			Environment.Fog.FogColor1		= 0xFF4AC5E3
			Environment.Fog.FogColor2		= 0xFFCB5754
			Environment.Fog.FogColor3		= 0xFF888B54
			Environment.Fog.FogColor4		= 0xFF7F7F7F

			tag = tag + Environment.Fog.Tag
		end

		if Environment.Rain.Valid == false then
			Environment.Rain.Valid        = true
			Environment.Rain.Visible      = true
			Environment.Rain.RainSpeed    = 0.000000
			Environment.Rain.RainSize     = 0.000000
			Environment.Rain.RainLife     = 0
			Environment.Rain.RainColor    = 0xFF000000
			Environment.Rain.RainGFX      = "程序联入\\小雨地面效果.gfx"
			Environment.Rain.RainSFX      = 2

			tag = tag + Environment.Rain.Tag
		end

		Environment.SceneCtrl.EnvStyle = ""
		Environment.SceneCtrl.ColorMap = "Maps\\Cloudy_Colormapping.dds"

		return tag
	end
}

EnvFuncList[34104] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 17.000000
			Environment.Fog.FogEnd		= 299.000000
			Environment.Fog.FogDensity1	= 1.000000
			Environment.Fog.FogDensity2	= 0.920000
			Environment.Fog.ColorDensity1	= 1.160000
			Environment.Fog.ColorDensity2	= 0.310000
			Environment.Fog.HorzDensity	= 2.990000
			Environment.Fog.HorzPower		= 2.200000
			Environment.Fog.HeightStart	= 55.000000
			Environment.Fog.HeightEnd		= 92.000000
			Environment.Fog.HeightDensity	= 3.240000
			Environment.Fog.FogColor1		= 0xFF4AC5E3
			Environment.Fog.FogColor2		= 0xFFCB5754
			Environment.Fog.FogColor3		= 0xFF888B54
			Environment.Fog.FogColor4		= 0xFF7F7F7F

			tag = tag + Environment.Fog.Tag
		end

		if Environment.Rain.Valid == false then
			Environment.Rain.Valid        = true
			Environment.Rain.Visible      = true
			Environment.Rain.RainSpeed    = 0.000000
			Environment.Rain.RainSize     = 0.000000
			Environment.Rain.RainLife     = 0
			Environment.Rain.RainColor    = 0xFF000000
			Environment.Rain.RainGFX      = "程序联入\\雨丝地面效果.gfx"
			Environment.Rain.RainSFX      = 1

			tag = tag + Environment.Rain.Tag
		end

		Environment.SceneCtrl.EnvStyle = ""
		Environment.SceneCtrl.ColorMap = "Maps\\Rain_Colormapping.dds"

		return tag
	end
}

EnvFuncList[34105] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 17.000000
			Environment.Fog.FogEnd		= 299.000000
			Environment.Fog.FogDensity1	= 1.000000
			Environment.Fog.FogDensity2	= 0.920000
			Environment.Fog.ColorDensity1	= 1.160000
			Environment.Fog.ColorDensity2	= 0.310000
			Environment.Fog.HorzDensity	= 2.990000
			Environment.Fog.HorzPower		= 2.200000
			Environment.Fog.HeightStart	= 55.000000
			Environment.Fog.HeightEnd		= 92.000000
			Environment.Fog.HeightDensity	= 3.240000
			Environment.Fog.FogColor1		= 0xFF4AC5E3
			Environment.Fog.FogColor2		= 0xFFCB5754
			Environment.Fog.FogColor3		= 0xFF888B54
			Environment.Fog.FogColor4		= 0xFF7F7F7F

			tag = tag + Environment.Fog.Tag
		end

		if Environment.Rain.Valid == false then
			Environment.Rain.Valid        = true
			Environment.Rain.Visible      = true
			Environment.Rain.RainSpeed    = 0.000000
			Environment.Rain.RainSize     = 0.000000
			Environment.Rain.RainLife     = 0
			Environment.Rain.RainColor    = 0xFF000000
			Environment.Rain.RainGFX      = "程序联入\\暴雨地面效果.gfx"
			Environment.Rain.RainSFX      = 1

			tag = tag + Environment.Rain.Tag
		end

		if Environment.Lightning.Valid == false then
			Environment.Lightning.Valid          = true
			Environment.Lightning.Visible        = true
			Environment.Lightning.Power          = 0.030000
			Environment.Lightning.Start          = 140.000000
			Environment.Lightning.End            = 60.000000
			Environment.Lightning.Time           = 100
			Environment.Lightning.Num            = 2
			Environment.Lightning.TimeInterval   = 150
			Environment.Lightning.BetweenTime    = 40000
			Environment.Lightning.BetweenRand    = 6000
			Environment.Lightning.LightningSFX      = 3

			tag = tag + Environment.Lightning.Tag
		end

		Environment.SceneCtrl.EnvStyle = ""
		Environment.SceneCtrl.ColorMap = "Maps\\Rain_Colormapping.dds"

		return tag
	end
}

EnvFuncList[34106] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 17.000000
			Environment.Fog.FogEnd		= 299.000000
			Environment.Fog.FogDensity1	= 1.000000
			Environment.Fog.FogDensity2	= 0.920000
			Environment.Fog.ColorDensity1	= 1.160000
			Environment.Fog.ColorDensity2	= 0.310000
			Environment.Fog.HorzDensity	= 2.990000
			Environment.Fog.HorzPower		= 2.200000
			Environment.Fog.HeightStart	= 55.000000
			Environment.Fog.HeightEnd		= 92.000000
			Environment.Fog.HeightDensity	= 3.240000
			Environment.Fog.FogColor1		= 0xFF4AC5E3
			Environment.Fog.FogColor2		= 0xFFCB5754
			Environment.Fog.FogColor3		= 0xFF888B54
			Environment.Fog.FogColor4		= 0xFF7F7F7F

			tag = tag + Environment.Fog.Tag
		end

		if Environment.Snow.Valid == false then
			Environment.Snow.Valid        = true
			Environment.Snow.Visible      = true
			Environment.Snow.SnowSpeed    = 0.300000
			Environment.Snow.SnowSize     = 0.100000
			Environment.Snow.SnowLife     = 90
			Environment.Snow.SnowColor    = 0xFFAEE1F4
			Environment.Snow.SnowGFX      = ""
			Environment.Rain.SnowSFX      = 4

			tag = tag + Environment.Snow.Tag
		end

		Environment.SceneCtrl.EnvStyle = ""
		Environment.SceneCtrl.ColorMap = "Maps\\Rain_Colormapping.dds"

		return tag
	end
}

EnvFuncList[41101] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 45.000000
			Environment.Fog.FogEnd		= 105.000000
			Environment.Fog.FogDensity1	= 0.670000
			Environment.Fog.FogDensity2	= 1.000000
			Environment.Fog.ColorDensity1	= 0.730000
			Environment.Fog.ColorDensity2	= 1.100000
			Environment.Fog.HorzDensity	= 2.560000
			Environment.Fog.HorzPower		= 1.220000
			Environment.Fog.HeightStart	= 18.000000
			Environment.Fog.HeightEnd		= 34.000000
			Environment.Fog.HeightDensity	= 0.790000
			Environment.Fog.FogColor1		= 0xFF459BCF
			Environment.Fog.FogColor2		= 0xFFA7E4D6
			Environment.Fog.FogColor3		= 0xFF888B54
			Environment.Fog.FogColor4		= 0xFF7F7F7F

			tag = tag + Environment.Fog.Tag
		end

		return tag
	end
}

EnvFuncList[41102] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 45.000000
			Environment.Fog.FogEnd		= 105.000000
			Environment.Fog.FogDensity1	= 0.670000
			Environment.Fog.FogDensity2	= 1.000000
			Environment.Fog.ColorDensity1	= 0.730000
			Environment.Fog.ColorDensity2	= 1.100000
			Environment.Fog.HorzDensity	= 2.560000
			Environment.Fog.HorzPower		= 1.220000
			Environment.Fog.HeightStart	= 18.000000
			Environment.Fog.HeightEnd		= 34.000000
			Environment.Fog.HeightDensity	= 0.790000
			Environment.Fog.FogColor1		= 0xFF459BCF
			Environment.Fog.FogColor2		= 0xFFA7E4D6
			Environment.Fog.FogColor3		= 0xFF888B54
			Environment.Fog.FogColor4		= 0xFF7F7F7F

			tag = tag + Environment.Fog.Tag
		end

		if Environment.Lightning.Valid == false then
			Environment.Lightning.Valid          = true
			Environment.Lightning.Visible        = true
			Environment.Lightning.Power          = 0.030000
			Environment.Lightning.Start          = 150.000000
			Environment.Lightning.End            = 60.000000
			Environment.Lightning.Time           = 150
			Environment.Lightning.Num            = 2
			Environment.Lightning.TimeInterval   = 130
			Environment.Lightning.BetweenTime    = 80000
			Environment.Lightning.BetweenRand    = 7000
			Environment.Lightning.LightningSFX      = 3

			tag = tag + Environment.Lightning.Tag
		end

		return tag
	end
}

EnvFuncList[41103] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 45.000000
			Environment.Fog.FogEnd		= 105.000000
			Environment.Fog.FogDensity1	= 0.670000
			Environment.Fog.FogDensity2	= 1.000000
			Environment.Fog.ColorDensity1	= 0.730000
			Environment.Fog.ColorDensity2	= 1.100000
			Environment.Fog.HorzDensity	= 2.560000
			Environment.Fog.HorzPower		= 1.220000
			Environment.Fog.HeightStart	= 18.000000
			Environment.Fog.HeightEnd		= 34.000000
			Environment.Fog.HeightDensity	= 0.790000
			Environment.Fog.FogColor1		= 0xFF459BCF
			Environment.Fog.FogColor2		= 0xFFA7E4D6
			Environment.Fog.FogColor3		= 0xFF888B54
			Environment.Fog.FogColor4		= 0xFF7F7F7F

			tag = tag + Environment.Fog.Tag
		end

		if Environment.Rain.Valid == false then
			Environment.Rain.Valid        = true
			Environment.Rain.Visible      = true
			Environment.Rain.RainSpeed    = 0.000000
			Environment.Rain.RainSize     = 0.000000
			Environment.Rain.RainLife     = 0
			Environment.Rain.RainColor    = 0xFF000000
			Environment.Rain.RainGFX      = "程序联入\\小雨地面效果.gfx"
			Environment.Rain.RainSFX      = 2

			tag = tag + Environment.Rain.Tag
		end

		return tag
	end
}

EnvFuncList[41104] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 45.000000
			Environment.Fog.FogEnd		= 105.000000
			Environment.Fog.FogDensity1	= 0.670000
			Environment.Fog.FogDensity2	= 1.000000
			Environment.Fog.ColorDensity1	= 0.730000
			Environment.Fog.ColorDensity2	= 1.100000
			Environment.Fog.HorzDensity	= 2.560000
			Environment.Fog.HorzPower		= 1.220000
			Environment.Fog.HeightStart	= 18.000000
			Environment.Fog.HeightEnd		= 34.000000
			Environment.Fog.HeightDensity	= 0.790000
			Environment.Fog.FogColor1		= 0xFF459BCF
			Environment.Fog.FogColor2		= 0xFFA7E4D6
			Environment.Fog.FogColor3		= 0xFF888B54
			Environment.Fog.FogColor4		= 0xFF7F7F7F

			tag = tag + Environment.Fog.Tag
		end

		if Environment.Rain.Valid == false then
			Environment.Rain.Valid        = true
			Environment.Rain.Visible      = true
			Environment.Rain.RainSpeed    = 0.000000
			Environment.Rain.RainSize     = 0.000000
			Environment.Rain.RainLife     = 0
			Environment.Rain.RainColor    = 0xFF000000
			Environment.Rain.RainGFX      = "程序联入\\雨丝地面效果.gfx"
			Environment.Rain.RainSFX      = 1

			tag = tag + Environment.Rain.Tag
		end

		Environment.SceneCtrl.EnvStyle = ""
		Environment.SceneCtrl.ColorMap = "Maps\\Cloudy_Colormapping.dds"

		return tag
	end
}

EnvFuncList[41105] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 45.000000
			Environment.Fog.FogEnd		= 105.000000
			Environment.Fog.FogDensity1	= 0.670000
			Environment.Fog.FogDensity2	= 1.000000
			Environment.Fog.ColorDensity1	= 0.730000
			Environment.Fog.ColorDensity2	= 1.100000
			Environment.Fog.HorzDensity	= 2.560000
			Environment.Fog.HorzPower		= 1.220000
			Environment.Fog.HeightStart	= 18.000000
			Environment.Fog.HeightEnd		= 34.000000
			Environment.Fog.HeightDensity	= 0.790000
			Environment.Fog.FogColor1		= 0xFF459BCF
			Environment.Fog.FogColor2		= 0xFFA7E4D6
			Environment.Fog.FogColor3		= 0xFF888B54
			Environment.Fog.FogColor4		= 0xFF7F7F7F

			tag = tag + Environment.Fog.Tag
		end

		if Environment.Rain.Valid == false then
			Environment.Rain.Valid        = true
			Environment.Rain.Visible      = true
			Environment.Rain.RainSpeed    = 0.000000
			Environment.Rain.RainSize     = 0.000000
			Environment.Rain.RainLife     = 0
			Environment.Rain.RainColor    = 0xFF000000
			Environment.Rain.RainGFX      = "程序联入\\暴雨地面效果.gfx"
			Environment.Rain.RainSFX      = 1

			tag = tag + Environment.Rain.Tag
		end

		if Environment.Lightning.Valid == false then
			Environment.Lightning.Valid          = true
			Environment.Lightning.Visible        = true
			Environment.Lightning.Power          = 0.030000
			Environment.Lightning.Start          = 150.000000
			Environment.Lightning.End            = 60.000000
			Environment.Lightning.Time           = 150
			Environment.Lightning.Num            = 3
			Environment.Lightning.TimeInterval   = 150
			Environment.Lightning.BetweenTime    = 90000
			Environment.Lightning.BetweenRand    = 7000
			Environment.Lightning.LightningSFX      = 3

			tag = tag + Environment.Lightning.Tag
		end

		Environment.SceneCtrl.EnvStyle = ""
		Environment.SceneCtrl.ColorMap = "Maps\\Rain_Colormapping.dds"

		return tag
	end
}

EnvFuncList[41106] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 45.000000
			Environment.Fog.FogEnd		= 105.000000
			Environment.Fog.FogDensity1	= 0.670000
			Environment.Fog.FogDensity2	= 1.000000
			Environment.Fog.ColorDensity1	= 0.730000
			Environment.Fog.ColorDensity2	= 1.100000
			Environment.Fog.HorzDensity	= 2.560000
			Environment.Fog.HorzPower		= 1.220000
			Environment.Fog.HeightStart	= 18.000000
			Environment.Fog.HeightEnd		= 34.000000
			Environment.Fog.HeightDensity	= 0.790000
			Environment.Fog.FogColor1		= 0xFF459BCF
			Environment.Fog.FogColor2		= 0xFFA7E4D6
			Environment.Fog.FogColor3		= 0xFF888B54
			Environment.Fog.FogColor4		= 0xFF7F7F7F

			tag = tag + Environment.Fog.Tag
		end

		if Environment.Snow.Valid == false then
			Environment.Snow.Valid        = true
			Environment.Snow.Visible      = true
			Environment.Snow.SnowSpeed    = 0.000000
			Environment.Snow.SnowSize     = 0.000000
			Environment.Snow.SnowLife     = 0
			Environment.Snow.SnowColor    = 0xFF000000
			Environment.Snow.SnowGFX      = ""
			Environment.Rain.SnowSFX      = 0

			tag = tag + Environment.Snow.Tag
		end

		Environment.SceneCtrl.EnvStyle = ""
		Environment.SceneCtrl.ColorMap = "Maps\\Rain_Colormapping.dds"

		return tag
	end
}

EnvFuncList[50101] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 31.000000
			Environment.Fog.FogEnd		= 220.000000
			Environment.Fog.FogDensity1	= 1.400000
			Environment.Fog.FogDensity2	= 0.490000
			Environment.Fog.ColorDensity1	= 1.100000
			Environment.Fog.ColorDensity2	= 1.470000
			Environment.Fog.HorzDensity	= 0.310000
			Environment.Fog.HorzPower		= 2.440000
			Environment.Fog.HeightStart	= 11.000000
			Environment.Fog.HeightEnd		= 32.500000
			Environment.Fog.HeightDensity	= 3.000000
			Environment.Fog.FogColor1		= 0xFF95BFD9
			Environment.Fog.FogColor2		= 0xFFA2EAEC
			Environment.Fog.FogColor3		= 0xFF888B54
			Environment.Fog.FogColor4		= 0xFF7F7F7F

			tag = tag + Environment.Fog.Tag
		end

		return tag
	end
}

EnvFuncList[50102] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 31.000000
			Environment.Fog.FogEnd		= 220.000000
			Environment.Fog.FogDensity1	= 1.400000
			Environment.Fog.FogDensity2	= 0.490000
			Environment.Fog.ColorDensity1	= 1.100000
			Environment.Fog.ColorDensity2	= 1.470000
			Environment.Fog.HorzDensity	= 0.310000
			Environment.Fog.HorzPower		= 2.440000
			Environment.Fog.HeightStart	= 11.000000
			Environment.Fog.HeightEnd		= 32.500000
			Environment.Fog.HeightDensity	= 3.000000
			Environment.Fog.FogColor1		= 0xFF95BFD9
			Environment.Fog.FogColor2		= 0xFFA2EAEC
			Environment.Fog.FogColor3		= 0xFF888B54
			Environment.Fog.FogColor4		= 0xFF7F7F7F

			tag = tag + Environment.Fog.Tag
		end

		if Environment.Lightning.Valid == false then
			Environment.Lightning.Valid          = true
			Environment.Lightning.Visible        = true
			Environment.Lightning.Power          = 0.030000
			Environment.Lightning.Start          = 150.000000
			Environment.Lightning.End            = 60.000000
			Environment.Lightning.Time           = 150
			Environment.Lightning.Num            = 2
			Environment.Lightning.TimeInterval   = 140
			Environment.Lightning.BetweenTime    = 90000
			Environment.Lightning.BetweenRand    = 7000
			Environment.Lightning.LightningSFX      = 3

			tag = tag + Environment.Lightning.Tag
		end

		return tag
	end
}

EnvFuncList[50103] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 31.000000
			Environment.Fog.FogEnd		= 220.000000
			Environment.Fog.FogDensity1	= 1.400000
			Environment.Fog.FogDensity2	= 0.490000
			Environment.Fog.ColorDensity1	= 1.100000
			Environment.Fog.ColorDensity2	= 1.470000
			Environment.Fog.HorzDensity	= 0.310000
			Environment.Fog.HorzPower		= 2.440000
			Environment.Fog.HeightStart	= 11.000000
			Environment.Fog.HeightEnd		= 32.500000
			Environment.Fog.HeightDensity	= 3.000000
			Environment.Fog.FogColor1		= 0xFF95BFD9
			Environment.Fog.FogColor2		= 0xFFA2EAEC
			Environment.Fog.FogColor3		= 0xFF888B54
			Environment.Fog.FogColor4		= 0xFF7F7F7F

			tag = tag + Environment.Fog.Tag
		end

		if Environment.Rain.Valid == false then
			Environment.Rain.Valid        = true
			Environment.Rain.Visible      = true
			Environment.Rain.RainSpeed    = 0.000000
			Environment.Rain.RainSize     = 0.000000
			Environment.Rain.RainLife     = 0
			Environment.Rain.RainColor    = 0xFF000000
			Environment.Rain.RainGFX      = "程序联入\\小雨地面效果.gfx"
			Environment.Rain.RainSFX      = 2

			tag = tag + Environment.Rain.Tag
		end

		Environment.SceneCtrl.EnvStyle = ""
		Environment.SceneCtrl.ColorMap = "Maps\\Cloudy_Colormapping.dds"

		return tag
	end
}

EnvFuncList[50104] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 31.000000
			Environment.Fog.FogEnd		= 220.000000
			Environment.Fog.FogDensity1	= 1.400000
			Environment.Fog.FogDensity2	= 0.490000
			Environment.Fog.ColorDensity1	= 1.100000
			Environment.Fog.ColorDensity2	= 1.470000
			Environment.Fog.HorzDensity	= 0.310000
			Environment.Fog.HorzPower		= 2.440000
			Environment.Fog.HeightStart	= 11.000000
			Environment.Fog.HeightEnd		= 32.500000
			Environment.Fog.HeightDensity	= 3.000000
			Environment.Fog.FogColor1		= 0xFF95BFD9
			Environment.Fog.FogColor2		= 0xFFA2EAEC
			Environment.Fog.FogColor3		= 0xFF888B54
			Environment.Fog.FogColor4		= 0xFF7F7F7F

			tag = tag + Environment.Fog.Tag
		end

		if Environment.Rain.Valid == false then
			Environment.Rain.Valid        = true
			Environment.Rain.Visible      = true
			Environment.Rain.RainSpeed    = 0.000000
			Environment.Rain.RainSize     = 0.000000
			Environment.Rain.RainLife     = 0
			Environment.Rain.RainColor    = 0xFF000000
			Environment.Rain.RainGFX      = "程序联入\\雨丝地面效果.gfx"
			Environment.Rain.RainSFX      = 1

			tag = tag + Environment.Rain.Tag
		end

		Environment.SceneCtrl.EnvStyle = ""
		Environment.SceneCtrl.ColorMap = "Maps\\Rain_Colormapping.dds"

		return tag
	end
}

EnvFuncList[50105] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 31.000000
			Environment.Fog.FogEnd		= 220.000000
			Environment.Fog.FogDensity1	= 1.400000
			Environment.Fog.FogDensity2	= 0.490000
			Environment.Fog.ColorDensity1	= 1.100000
			Environment.Fog.ColorDensity2	= 1.470000
			Environment.Fog.HorzDensity	= 0.310000
			Environment.Fog.HorzPower		= 2.440000
			Environment.Fog.HeightStart	= 11.000000
			Environment.Fog.HeightEnd		= 32.500000
			Environment.Fog.HeightDensity	= 3.000000
			Environment.Fog.FogColor1		= 0xFF95BFD9
			Environment.Fog.FogColor2		= 0xFFA2EAEC
			Environment.Fog.FogColor3		= 0xFF888B54
			Environment.Fog.FogColor4		= 0xFF7F7F7F

			tag = tag + Environment.Fog.Tag
		end

		if Environment.Rain.Valid == false then
			Environment.Rain.Valid        = true
			Environment.Rain.Visible      = true
			Environment.Rain.RainSpeed    = 0.000000
			Environment.Rain.RainSize     = 0.000000
			Environment.Rain.RainLife     = 0
			Environment.Rain.RainColor    = 0xFF000000
			Environment.Rain.RainGFX      = "程序联入\\暴雨地面效果.gfx"
			Environment.Rain.RainSFX      = 1

			tag = tag + Environment.Rain.Tag
		end

		if Environment.Lightning.Valid == false then
			Environment.Lightning.Valid          = true
			Environment.Lightning.Visible        = true
			Environment.Lightning.Power          = 0.030000
			Environment.Lightning.Start          = 150.000000
			Environment.Lightning.End            = 60.000000
			Environment.Lightning.Time           = 150
			Environment.Lightning.Num            = 2
			Environment.Lightning.TimeInterval   = 150
			Environment.Lightning.BetweenTime    = 90000
			Environment.Lightning.BetweenRand    = 7000
			Environment.Lightning.LightningSFX      = 3

			tag = tag + Environment.Lightning.Tag
		end

		Environment.SceneCtrl.EnvStyle = ""
		Environment.SceneCtrl.ColorMap = "Maps\\Rain_Colormapping.dds"

		return tag
	end
}

EnvFuncList[50106] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 31.000000
			Environment.Fog.FogEnd		= 220.000000
			Environment.Fog.FogDensity1	= 1.400000
			Environment.Fog.FogDensity2	= 0.490000
			Environment.Fog.ColorDensity1	= 1.100000
			Environment.Fog.ColorDensity2	= 1.470000
			Environment.Fog.HorzDensity	= 0.310000
			Environment.Fog.HorzPower		= 2.440000
			Environment.Fog.HeightStart	= 11.000000
			Environment.Fog.HeightEnd		= 32.500000
			Environment.Fog.HeightDensity	= 3.000000
			Environment.Fog.FogColor1		= 0xFF95BFD9
			Environment.Fog.FogColor2		= 0xFFA2EAEC
			Environment.Fog.FogColor3		= 0xFF888B54
			Environment.Fog.FogColor4		= 0xFF7F7F7F

			tag = tag + Environment.Fog.Tag
		end

		if Environment.Snow.Valid == false then
			Environment.Snow.Valid        = true
			Environment.Snow.Visible      = true
			Environment.Snow.SnowSpeed    = 0.300000
			Environment.Snow.SnowSize     = 0.100000
			Environment.Snow.SnowLife     = 90
			Environment.Snow.SnowColor    = 0xFFAEE1F4
			Environment.Snow.SnowGFX      = "程序联入\\暴雪地面效果.gfx"
			Environment.Rain.SnowSFX      = 4

			tag = tag + Environment.Snow.Tag
		end

		Environment.SceneCtrl.EnvStyle = ""
		Environment.SceneCtrl.ColorMap = "Maps\\Rain_Colormapping.dds"

		return tag
	end
}

EnvFuncList[999999999] =
{
	ApplyFunc = function ()
		local  tag = 0

		if Environment.Fog.Valid == false then
			Environment.Fog.Valid			= true
			Environment.Fog.FogStart		= 15.000000
			Environment.Fog.FogEnd		= 75.000000
			Environment.Fog.FogDensity1	= 1.850000
			Environment.Fog.FogDensity2	= 2.150000
			Environment.Fog.ColorDensity1	= 0.750000
			Environment.Fog.ColorDensity2	= 0.950000
			Environment.Fog.HorzDensity	= 1.250000
			Environment.Fog.HorzPower		= 2.650000
			Environment.Fog.HeightStart	= 15.000000
			Environment.Fog.HeightEnd		= 45.000000
			Environment.Fog.HeightDensity	= 3.750000
			Environment.Fog.FogColor1		= 0xFFC7A36D
			Environment.Fog.FogColor2		= 0xFFC7A36D
			Environment.Fog.FogColor3		= 0xFF888B54
			Environment.Fog.FogColor4		= 0xFF7F7F7F

			tag = tag + Environment.Fog.Tag
		end

		return tag
	end
}

