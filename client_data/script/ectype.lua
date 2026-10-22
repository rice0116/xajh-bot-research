--[[#tag push auto]]
--[[
	1、副本追踪链接写法：
		@链接文字[链接类型 链接信息]
		目前链接类型支持：
			pos, 对应链接信息: x坐标, z坐标。x坐标, z坐标为浮点数，之间用',' 或 空格 分隔 (可以同时使用多个',' 与 空格)
			例：测试@链接[pos -1.1, 200]文字。此例中“链接”两字可点击

			pos3, 对应链接信息: x坐标, y坐标, z坐标. 其他与 pos 相同
			例：测试@三维[pos3 -1.1, 11.9, 200]文字。此例中“链接”两字可点击

			target, 对应链接信息: x坐标, y坐标, z坐标, 目标类型=目标ID
				目标类型可为 npc(自动对话), monster(自动打怪), mine(自动采矿), bind(自动绑定动态物品，ID为交通工具TID)
			例: 测试@目标[target -1.1, 11.9, 200, npc=9876]文字。此例中“目标”两字可点击，到达地点后自动与npc 9876对话

		注：链接类型对大小写敏感

	2、副本追踪脚本增加显示条件判断，具体格式如下：
	{ID = 201,Imageid = 10319,Desc = "游荡匪徒: %d/10",BoardCond = {1,2}, ArgsCond = {201,"<",5}},
	ArgsCond里的第一个参数为场景参数id，第二个为判断条件，第三个为目标值
	暂时支持 <,>,=,!=四种
	3、副本追踪脚本增加场景参数的显示方法
		3.1 显示一个场景参数值
			%SA[场景参数ID]
			例：Desc = "游荡匪徒: %SA[201]/10，嵩山门徒: %SA[202]/10"
		3.2 计算一个lua表达式的值
			%CALC[表达式]
			例: Desc = "游荡匪徒或嵩山门徒: %CALC[arg(201)+arg(202)]/10"
			注意：表达式中可使用函数在 calc_global 表中, 需使用某全局函数或表时, 需将其加入 calc_global 表中
]]

Ectype = {}

--特殊提示界面配置
EctypeUI_Type = 0

function Ectype:ValueInTable(val,tbl)
	if val and tbl and type(tbl) == --[[!AUTO_1]]"table" then
		for k,v in pairs(tbl) do
			if v == val then
				return true
			end
		end
	end
	return false
end

function  Ectype:CopyTable(src)
	if type(src) ~= --[[!AUTO_2]]"table" then
		return src
	end

	local inst={}
	local k, v
	for k, v in pairs(src) do
		if type(v) == --[[!AUTO_3]]"table" then
			inst[k] = Ectype:CopyTable(v)
		else
			inst[k] = v
		end
	end
	local mt = getmetatable(src)
	setmetatable(inst, mt)

    return inst
end

Ectype.EctypeArgs = {}
Ectype.EctypeArgs[100] =
{
	Name = --[[!AUTO_4]]"副本追蹤",
	Desc = --[[!AUTO_5]]"目標：拯救鏢師",
	Args =
	{
		{ID = 210,Imageid = 1786,Desc = --[[!AUTO_6]]"拯救鏢師: %d/15"},
	}
}
Ectype.EctypeArgs[101] =
{
	Name = --[[!AUTO_7]]"副本追蹤",
	Desc = --[[!AUTO_8]]"目標：前往尋找劉正風一行",
	Args =
	{
		{ID = 211,Imageid = 1364,Desc = --[[!AUTO_9]]"嵩山門徒: %d/10",BoardCond = {5,6,7}},
	}
}
Ectype.EctypeArgs[103] =
{
	Name = --[[!AUTO_10]]"副本追蹤",
	Desc = --[[!AUTO_11]]"目標：保護令狐沖到換血完成",
	Args =
	{
		{ID = 250,Imageid = 1857,Desc = --[[!AUTO_12]]"令狐沖血量: %d/ 10",BoardCond =
		{1,2,3,4,5,6}},
		{ID = 252,Imageid = 6687,Desc = --[[!AUTO_13]]"目前波數: %d/ 10",BoardCond = {2,4,5,6}},
		{ID = 251,Imageid = 963,Desc = --[[!AUTO_14]]"支援點數: %d",BoardCond = {2,3,4,5,6}},
		{ID = 253,Imageid = 2258,Desc = --[[!AUTO_15]]"目前援兵: %d/ 6",BoardCond = {2,4,5,6}},
	}
}
Ectype.EctypeArgs[105] =
{
	Name = --[[!AUTO_16]]"副本追蹤",
	Desc = --[[!AUTO_17]]"目標：拯救定閑師太",
	Args =
	{
		{ID = 501,Imageid = 10339,Desc = --[[!AUTO_18]]"殺死圍攻門徒: %d / 30",BoardCond =
		{1,2,3,4}},
		{ID = 503,Imageid = 1864,Desc = --[[!AUTO_19]]"定閑血量: %d / 10",BoardCond = {1,2,3,4}},
		{ID = 502,Imageid = 1862,Desc = --[[!AUTO_20]]"定逸血量: %d / 10",BoardCond = {1,2,3,4}},
	}
}
Ectype.EctypeArgs[102] =
{
	Name = --[[!AUTO_21]]"副本追蹤",
	Desc = --[[!AUTO_22]]"目標：協助華山派眾人擊敗來襲的蒙面客",
	Args =
	{
		{ID = 1000,Imageid = 1353,Desc = --[[!AUTO_23]]"擊潰蒙面客: %d / 4",BoardCond = {1}},
		{ID = 1001,Imageid = 10161,Desc = --[[!AUTO_24]]"挑戰封不平: %d / 1",BoardCond = {2}},
		{ID = 1002,Imageid = 1353,Desc = --[[!AUTO_25]]"追殺盲眼人: %d / 11",BoardCond = {3}},
	}
}

Ectype.EctypeArgs[169] =
{
	Name = --[[!AUTO_26]]"活動追蹤",
	Desc = --[[!AUTO_27]]"目標：趕走破壞綠竹林的動物",
	Args =
	{
		{ID = 311,Imageid = 11898,Desc = --[[!AUTO_28]]"黑熊小兵: %d / 199",BoardCond = {3}},
		{ID = 312,Imageid = 11900,Desc = --[[!AUTO_29]]"黑熊王:   %d / 1",BoardCond = {3}},
		{ID = 313,Imageid = 10254,Desc = --[[!AUTO_30]]"牛魔小兵: %d / 199",BoardCond = {4}},
		{ID = 314,Imageid = 11901,Desc = --[[!AUTO_31]]"牛魔王:   %d / 1",BoardCond = {4}},
		{ID = 315,Imageid = 10977,Desc = --[[!AUTO_32]]"猴子小兵: %d / 199",BoardCond = {5}},
		{ID = 316,Imageid = 10979,Desc = --[[!AUTO_33]]"美猴王  : %d / 1",BoardCond = {5}},
	}
}

Ectype.EctypeArgs[366] =
{
	Name = --[[!AUTO_34]]"副本追蹤",
	Desc = --[[!AUTO_35]]"目標：擊敗嵩山派眾多高手",
	Args =
	{
		{ID = 201,Imageid = 10319,Desc = --[[!AUTO_36]]"遊蕩匪徒: %d / 10",BoardCond = {1,2}},
		{ID = 202,Imageid = 1364,Desc = --[[!AUTO_37]]"嵩山門徒: %d / 10",BoardCond = {5,8}},
		{ID = 207,Imageid = 10224,Desc = --[[!AUTO_38]]"嵩山殺手: %d / 4",BoardCond = {6}},
		{ID = 203,Imageid = 11003,Desc = --[[!AUTO_39]]"費彬:     %d / 1",BoardCond = {3,4}},
		{ID = 204,Imageid = 1914,Desc = --[[!AUTO_40]]"陸柏:     %d / 1",BoardCond = {6}},
		{ID = 205,Imageid = 1913,Desc = --[[!AUTO_41]]"丁勉:     %d / 1",BoardCond = {6}},
		{ID = 206,Imageid = 1912,Desc = --[[!AUTO_42]]"左冷禪:   %d / 1",BoardCond = {9}},
	}
}

Ectype.EctypeArgs[603] =
{
	Name = --[[!AUTO_43]]"副本追蹤",
	Desc = --[[!AUTO_44]]"目標：消滅雨夜藥王廟中的魑魅魍魎",
	Args =
	{
		{ID = 201,Imageid = 1367,Desc = --[[!AUTO_45]]"瘋道士: %d / 20",BoardCond = {2}},
		{ID = 203,Imageid = 1450,Desc = --[[!AUTO_46]]"冤魂腐屍: %d / 20",BoardCond = {3}},
		{ID = 202,Imageid = 1362,Desc = --[[!AUTO_47]]"靈火火道長: %d / 1",BoardCond = {4}},
		{ID = 205,Imageid = 1449,Desc = --[[!AUTO_48]]"銅皮僵屍: %d / 20",BoardCond = {5}},
		{ID = 204,Imageid = 10337,Desc = --[[!AUTO_49]]"焦雨道長: %d / 1",BoardCond = {6,8}},
                {ID = 206,Imageid = 1922,Desc = --[[!AUTO_50]]"余人彥: %d / 1",BoardCond = {9}},
                {ID = 207,Imageid = 10355,Desc = --[[!AUTO_51]]"屍魁焦斬: %d / 1",BoardCond = {9}},
		{ID = 208,Imageid = 1464,Desc = --[[!AUTO_52]]"護陵石獸: %d / 1",BoardCond = {6}},
                {ID = 208,Imageid = 1464,Desc = --[[!AUTO_53]]"護陵石獸: %d / 2",BoardCond = {8}},
	}
}

Ectype.EctypeArgs[626] =
{
	Name = --[[!AUTO_54]]"副本追蹤",
	Desc = --[[!AUTO_55]]"目標：收集材料釀造3種美酒，護送商人離開小鎮。",
	Args =
	{
		{ID = 0,Imageid = 964,Desc = "收集水果：%SA[124]/%SA[120]\r收集糧食：%SA[125]/%SA[121]\r收集毒蟲：%SA[126]/%SA[122]\r收集泉水：%SA[127]/%SA[123]",BoardCond = {1}},
		{ID = 0,Imageid = 1959,Desc = "護送酒商!",ArgsCond = {146,"=",1}},
		{ID = 0,Imageid = 2103,Desc = "最後30秒!",ArgsCond = {147,"=",1}},
	}
}

Ectype.EctypeArgs[915] =      --横屿滩活动副本

{
	Name = --[[!AUTO_63]]"副本追蹤",
	Desc = --[[!AUTO_64]]"目標：阻止海盜入侵",
	Args =
	{
        	{ID = 201,Imageid = 1392,Desc = --[[!AUTO_65]]"海盜雜兵: %d / 38",BoardCond = {1}},--id=自定义代码,Imageid=怪物头像,BoardCond=在哪个版面显示

		{ID = 202,Imageid = 1391,Desc = --[[!AUTO_66]]"海盜舵手: %d / 5",BoardCond = {1}},
		{ID = 201,Imageid = 1392,Desc = --[[!AUTO_67]]"海盜雜兵: %d / 67",BoardCond = {2}},
		{ID = 202,Imageid = 1391,Desc = --[[!AUTO_68]]"海盜舵手: %d / 8",BoardCond = {2}},
		{ID = 203,Imageid = 10336,Desc = --[[!AUTO_69]]"海盜船長: %d / 1",BoardCond = {2}},
	}
}

--门派秘境追踪开始

Ectype.EctypeArgs[587] =--少林
{
	Name = --[[!AUTO_70]]"任務進程",
	Desc = --[[!AUTO_71]]"目標：擊殺指定怪物",
	Args =
	{
		{ID = 201,Imageid = 10339,Desc = --[[!AUTO_72]]"門派宵小: %d / 10",BoardCond = {2}},--id=自定义代码,Imageid=怪物头像,BoardCond=在哪个版面显示

		{ID = 202,Imageid = 10339,Desc = --[[!AUTO_73]]"試煉弟子: %d / 12",BoardCond = {3}},
		{ID = 203,Imageid = 10339,Desc = --[[!AUTO_74]]"鐵頭陀: %d / 1",BoardCond = {4}},
		{ID = 204,Imageid = 10339,Desc = --[[!AUTO_75]]"叛逃者: %d / 4",BoardCond = {5}},
		{ID = 205,Imageid = 10339,Desc = --[[!AUTO_76]]"秘境入侵者: %d / 4",BoardCond = {6}},
	}

}
Ectype.EctypeArgs[590] =    --武当
{
	Name = --[[!AUTO_77]]"任務進程",
	Desc = --[[!AUTO_78]]"目標：擊殺指定怪物",
	Args =
	{
		{ID = 201,Imageid = 10339,Desc = --[[!AUTO_79]]"門派宵小: %d / 10",BoardCond = {2}},
		{ID = 202,Imageid = 10339,Desc = --[[!AUTO_80]]"試煉弟子: %d / 12",BoardCond = {3}},
		{ID = 203,Imageid = 10339,Desc = --[[!AUTO_81]]"八卦魔: %d / 1",BoardCond = {4}},
		{ID = 204,Imageid = 10339,Desc = --[[!AUTO_82]]"叛逃者: %d / 4",BoardCond = {5}},
		{ID = 205,Imageid = 10339,Desc = --[[!AUTO_83]]"秘境入侵者: %d / 4",BoardCond = {6}},
	}
}
Ectype.EctypeArgs[588] =    --华山
{
	Name = --[[!AUTO_84]]"任務進程",
	Desc = --[[!AUTO_85]]"目標：擊殺指定怪物",
	Args =
	{
		{ID = 201,Imageid = 10339,Desc = --[[!AUTO_86]]"門派宵小: %d / 10",BoardCond = {2}},
		{ID = 202,Imageid = 10339,Desc = --[[!AUTO_87]]"試煉弟子: %d / 12",BoardCond = {3}},
		{ID = 203,Imageid = 10339,Desc = --[[!AUTO_88]]"黑腹白猿: %d / 1",BoardCond = {4}},
		{ID = 204,Imageid = 10339,Desc = --[[!AUTO_89]]"叛逃者: %d / 4",BoardCond = {5}},
		{ID = 205,Imageid = 10339,Desc = --[[!AUTO_90]]"秘境入侵者: %d / 4",BoardCond = {6}},
	}
}
Ectype.EctypeArgs[591] =    --唐门
{
	Name = --[[!AUTO_91]]"任務進程",
	Desc = --[[!AUTO_92]]"目標：擊殺指定怪物",
	Args =
	{
		{ID = 201,Imageid = 10339,Desc = --[[!AUTO_93]]"門派宵小: %d / 10",BoardCond = {3}},
		{ID = 202,Imageid = 10339,Desc = --[[!AUTO_94]]"試煉弟子: %d / 12",BoardCond = {4}},
		{ID = 203,Imageid = 10339,Desc = --[[!AUTO_95]]"千手鬼: %d / 1",BoardCond = {5}},
		{ID = 204,Imageid = 10339,Desc = --[[!AUTO_96]]"叛逃者: %d / 4",BoardCond = {6}},
		{ID = 205,Imageid = 10339,Desc = --[[!AUTO_97]]"秘境入侵者: %d / 4",BoardCond = {7}},
	}
}
Ectype.EctypeArgs[593] =    --五仙
{
	Name = --[[!AUTO_98]]"任務進程",
	Desc = --[[!AUTO_99]]"目標：擊殺指定怪物",
	Args =
	{
		{ID = 201,Imageid = 10339,Desc = --[[!AUTO_100]]"門派宵小: %d / 10",BoardCond = {2}},
		{ID = 202,Imageid = 10339,Desc = --[[!AUTO_101]]"試煉弟子: %d / 12",BoardCond = {3}},
		{ID = 203,Imageid = 10339,Desc = --[[!AUTO_102]]"蠱人: %d / 1",BoardCond = {4}},
		{ID = 204,Imageid = 10339,Desc = --[[!AUTO_103]]"叛逃者: %d / 4",BoardCond = {5}},
		{ID = 205,Imageid = 10339,Desc = --[[!AUTO_104]]"秘境入侵者: %d / 4",BoardCond = {6}},
	}
}
Ectype.EctypeArgs[592] =    --逍遥
{
	Name = --[[!AUTO_105]]"任務進程",
	Desc = --[[!AUTO_106]]"目標：擊殺指定怪物",
	Args =
	{
		{ID = 201,Imageid = 10339,Desc = --[[!AUTO_107]]"門派宵小: %d / 10",BoardCond = {3}},
		{ID = 202,Imageid = 10339,Desc = --[[!AUTO_108]]"試煉弟子: %d / 12",BoardCond = {4}},
		{ID = 203,Imageid = 10339,Desc = --[[!AUTO_109]]"金翅大鵬: %d / 1",BoardCond = {5}},
		{ID = 204,Imageid = 10339,Desc = --[[!AUTO_110]]"叛逃者: %d / 4",BoardCond = {6}},
		{ID = 205,Imageid = 10339,Desc = --[[!AUTO_111]]"秘境入侵者: %d / 4",BoardCond = {7}},
	}
}
Ectype.EctypeArgs[594] =    --峨嵋
{
	Name = --[[!AUTO_112]]"任務進程",
	Desc = --[[!AUTO_113]]"目標：擊殺指定怪物",
	Args =
	{
		{ID = 201,Imageid = 10339,Desc = --[[!AUTO_114]]"門派宵小: %d / 10",BoardCond = {2}},
		{ID = 202,Imageid = 10339,Desc = --[[!AUTO_115]]"試煉弟子: %d / 12",BoardCond = {3}},
		{ID = 203,Imageid = 10339,Desc = --[[!AUTO_116]]"金羅漢: %d / 1",BoardCond = {4}},
		{ID = 204,Imageid = 10339,Desc = --[[!AUTO_117]]"叛逃者: %d / 4",BoardCond = {5}},
		{ID = 205,Imageid = 10339,Desc = --[[!AUTO_118]]"秘境入侵者: %d / 4",BoardCond = {6}},
	}
}
Ectype.EctypeArgs[595] =    --日月
{
	Name = --[[!AUTO_119]]"任務進程",
	Desc = --[[!AUTO_120]]"目標：擊殺指定怪物",
	Args =
	{
		{ID = 201,Imageid = 10339,Desc = --[[!AUTO_121]]"門派宵小: %d / 10",BoardCond = {2}},
		{ID = 202,Imageid = 10339,Desc = --[[!AUTO_122]]"試煉弟子: %d / 12",BoardCond = {3}},
		{ID = 203,Imageid = 10339,Desc = --[[!AUTO_123]]"火烈奴: %d / 1",BoardCond = {4}},
		{ID = 204,Imageid = 10339,Desc = --[[!AUTO_124]]"叛逃者: %d / 4",BoardCond = {5}},
		{ID = 205,Imageid = 10339,Desc = --[[!AUTO_125]]"秘境入侵者: %d / 4",BoardCond = {6}},
	}
}
Ectype.EctypeArgs[596] =    --恒山
{
	Name = --[[!AUTO_126]]"任務進程",
	Desc = --[[!AUTO_127]]"目標：擊殺指定怪物",
	Args =
	{
		{ID = 201,Imageid = 10339,Desc = --[[!AUTO_128]]"門派宵小: %d / 10",BoardCond = {2}},
		{ID = 202,Imageid = 10339,Desc = --[[!AUTO_129]]"試煉弟子: %d / 12",BoardCond = {3}},
		{ID = 203,Imageid = 10339,Desc = --[[!AUTO_130]]"雲中仙: %d / 1",BoardCond = {4}},
		{ID = 204,Imageid = 10339,Desc = --[[!AUTO_131]]"叛逃者: %d / 4",BoardCond = {5}},
		{ID = 205,Imageid = 10339,Desc = --[[!AUTO_132]]"秘境入侵者: %d / 4",BoardCond = {6}},
	}
}
Ectype.EctypeArgs[597] =    --衡山
{
	Name = --[[!AUTO_133]]"任務進程",
	Desc = --[[!AUTO_134]]"目標：擊殺指定怪物",
	Args =
	{
		{ID = 201,Imageid = 10339,Desc = --[[!AUTO_135]]"門派宵小: %d / 10",BoardCond = {2}},
		{ID = 202,Imageid = 10339,Desc = --[[!AUTO_136]]"試煉弟子: %d / 12",BoardCond = {3}},
		{ID = 203,Imageid = 10339,Desc = --[[!AUTO_137]]"琴魔: %d / 1",BoardCond = {4}},
		{ID = 204,Imageid = 10339,Desc = --[[!AUTO_138]]"叛逃者: %d / 4",BoardCond = {5}},
		{ID = 205,Imageid = 10339,Desc = --[[!AUTO_139]]"秘境入侵者: %d / 4",BoardCond = {6}},
	}
}

Ectype.EctypeArgs[620] =    --聚贤楼

{
	Name = --[[!AUTO_140]]"任務進程",
	Desc = --[[!AUTO_141]]"目標：擊敗聚賢樓中的所有敵人",
	Args =
	{
		{ID = 201,Imageid = 10339,Desc = --[[!AUTO_142]]"目前：第%d層",BoardCond = {4,12,28,36,44,20}},
		{ID = 301,Imageid = 10339,Desc = --[[!AUTO_143]]"擊敗敵人：%d/12",BoardCond = {20}},
		{ID = 302,Imageid = 10339,Desc = --[[!AUTO_144]]"擊敗敵人：%d/10",BoardCond = {4}},
		{ID = 312,Imageid = 10339,Desc = --[[!AUTO_145]]"擊敗鸞配：%d/1",BoardCond = {4}},
		{ID = 322,Imageid = 10339,Desc = --[[!AUTO_146]]"擊敗鸞瑛：%d/1",BoardCond = {4}},
		{ID = 303,Imageid = 10339,Desc = --[[!AUTO_147]]"擊敗敵人：%d/10",BoardCond = {12}},
		{ID = 304,Imageid = 10339,Desc = --[[!AUTO_148]]"擊敗敵人：%d/10",BoardCond = {28}},
		{ID = 314,Imageid = 10339,Desc = --[[!AUTO_149]]"擊敗雷步京：%d/1",BoardCond = {28}},
		{ID = 305,Imageid = 10339,Desc = --[[!AUTO_150]]"擊敗敵人：%d/10",BoardCond = {36}},
		{ID = 315,Imageid = 10339,Desc = --[[!AUTO_151]]"擊敗陳霸天：%d/1",BoardCond = {36}},
		{ID = 325,Imageid = 10339,Desc = --[[!AUTO_152]]"擊敗陳霸虎：%d/1",BoardCond = {36}},
		{ID = 306,Imageid = 10339,Desc = --[[!AUTO_153]]"擊敗敵人：%d/10",BoardCond = {44}},
	}
}

Ectype.EctypeArgs[858] =    --随机副本
{
	Name = --[[!AUTO_154]]"副本目標",
	Desc = --[[!AUTO_155]]"目標：探索龍嶺迷窟盡頭",
	Args =
	{
		{ID = 201,Imageid = 2178,Desc = --[[!AUTO_156]]"木箱：%d/8",ArgsCond = {101,--[[!AUTO_157]]"=",1}},
		{ID = 208,Imageid = 10308,Desc = --[[!AUTO_158]]"迷窟機關人：%d/12",ArgsCond = {101,--[[!AUTO_159]]"=",2}},
		{ID = 208,Imageid = 10308,Desc = --[[!AUTO_160]]"迷窟機關人：%d/8",ArgsCond = {102,--[[!AUTO_161]]"=",1}},
		{ID = 209,Imageid = 1368,Desc = --[[!AUTO_162]]"東廠番役：%d/8",ArgsCond = {102,--[[!AUTO_163]]"=",2}},
		{ID = 202,Imageid = 6399,Desc = --[[!AUTO_164]]"酒桶：%d/8",ArgsCond = {103,--[[!AUTO_165]]"=",1}},
		{ID = 210,Imageid = 10308,Desc = --[[!AUTO_166]]"機關人之王：%d/1",ArgsCond = {103,--[[!AUTO_167]]"=",2}},
		{ID = 211,Imageid = 10310,Desc = --[[!AUTO_168]]"巨大腐奴：%d/10",ArgsCond = {104,--[[!AUTO_169]]"=",1}},
		{ID = 229,Imageid = 1853,Desc = --[[!AUTO_170]]"東廠盜寶監督：%d/1",ArgsCond = {104,--[[!AUTO_171]]"=",2}},
		{ID = 0,Imageid = 11057,Desc = --[[!AUTO_172]]"泉水處可恢復補給",ArgsCond = {105,--[[!AUTO_173]]"=",1}},
		{ID = 212,Imageid = 1425,Desc = --[[!AUTO_174]]"迷窟毒花：%d/16",ArgsCond = {105,--[[!AUTO_175]]"=",2}},
		{ID = 213,Imageid = 1400,Desc = --[[!AUTO_176]]"盜寶火槍手：%d/16",ArgsCond = {106,--[[!AUTO_177]]"=",1}},
		{ID = 220,Imageid = 1931,Desc = --[[!AUTO_178]]"青城盜寶高手：%d/2",ArgsCond = {106,--[[!AUTO_179]]"=",2}},
		{ID = 219,Imageid = 1930,Desc = --[[!AUTO_180]]"青城盜寶小兵：%d/6",ArgsCond = {106,--[[!AUTO_181]]"=",2}},
		{ID = 214,Imageid = 1923,Desc = --[[!AUTO_182]]"侯人英：%d/1",ArgsCond = {107,--[[!AUTO_183]]"=",1}},
		{ID = 218,Imageid = 1932,Desc = --[[!AUTO_184]]"青城盜寶小兵：%d/8",ArgsCond = {107,--[[!AUTO_185]]"=",2}},
		{ID = 203,Imageid = 3061,Desc = --[[!AUTO_186]]"盆景：%d/8",ArgsCond = {108,--[[!AUTO_187]]"=",1}},
		{ID = 215,Imageid = 1924,Desc = --[[!AUTO_188]]"洪人雄：%d/1",ArgsCond = {108,--[[!AUTO_189]]"=",2}},
		{ID = 216,Imageid = 1925,Desc = --[[!AUTO_190]]"于人豪：%d/1",ArgsCond = {109,--[[!AUTO_191]]"=",1}},
		{ID = 0,Imageid = 11057,Desc = --[[!AUTO_192]]"泉水處可恢復補給",ArgsCond = {109,--[[!AUTO_193]]"=",2}},
		{ID = 217,Imageid = 1926,Desc = --[[!AUTO_194]]"羅人傑：%d/1",ArgsCond = {110,--[[!AUTO_195]]"=",1}},
		{ID = 204,Imageid = 4844,Desc = --[[!AUTO_196]]"火炬：%d/8",ArgsCond = {110,--[[!AUTO_197]]"=",2}},
		{ID = 221,Imageid = 1928,Desc = --[[!AUTO_198]]"青城盜寶高手：%d/10",ArgsCond = {111,--[[!AUTO_199]]"=",1}},
		{ID = 222,Imageid = 10370,Desc = --[[!AUTO_200]]"古代斗笠武士：%d/1",ArgsCond = {111,--[[!AUTO_201]]"=",2}},
		{ID = 205,Imageid = 2300,Desc = --[[!AUTO_202]]"石燈：%d/8",ArgsCond = {112,--[[!AUTO_203]]"=",1}},
		{ID = 209,Imageid = 1368,Desc = --[[!AUTO_204]]"東廠番役：%d/16",ArgsCond = {112,--[[!AUTO_205]]"=",2}},
		{ID = 228,Imageid = 10254,Desc = --[[!AUTO_206]]"迷窟野牛：%d/12",ArgsCond = {113,--[[!AUTO_207]]"=",1}},
		{ID = 223,Imageid = 10310,Desc = --[[!AUTO_208]]"成精的巨大腐奴：%d/1",ArgsCond = {113,--[[!AUTO_209]]"=",2}},
		{ID = 224,Imageid = 10194,Desc = --[[!AUTO_210]]"盜寶吹箭兵：%d/16",ArgsCond = {114,--[[!AUTO_211]]"=",1}},
		{ID = 226,Imageid = 10186,Desc = --[[!AUTO_212]]"盜寶蠻兵：%d/16",ArgsCond = {114,--[[!AUTO_213]]"=",2}},
		{ID = 225,Imageid = 1379,Desc = --[[!AUTO_214]]"大內火術師：%d/8",ArgsCond = {115,--[[!AUTO_215]]"=",1}},
		{ID = 227,Imageid = 1381,Desc = --[[!AUTO_216]]"古代盲眼劍客：%d/1",ArgsCond = {115,--[[!AUTO_217]]"=",2}},
		{ID = 225,Imageid = 1379,Desc = --[[!AUTO_218]]"大內火術師：%d/6",ArgsCond = {116,--[[!AUTO_219]]"=",1}},
		{ID = 227,Imageid = 1381,Desc = --[[!AUTO_220]]"古代盲眼劍客：%d/1",ArgsCond = {116,--[[!AUTO_221]]"=",2}},
		{ID = 222,Imageid = 10370,Desc = --[[!AUTO_222]]"古代斗笠武士：%d/1",ArgsCond = {116,--[[!AUTO_223]]"=",3}},
	}
}


Ectype.EctypeArgs[882] =    --街市
{
	Name = --[[!AUTO_224]]"街市經營狀況",
	Desc = --[[!AUTO_225]]"目標：滿足街市中路人的需求",
	Args =
	{
--入口1，准备12、4、6、8、10，波数3、5、7、9、11，领奖13、2
--909 当前波数
--910 全局好评度
--911 各波完成的小兵数
--916 个人领奖总次数
		{ID = 9001,Imageid = 2116,Desc = --[[!AUTO_226]]"街市活動即將開始",BoardCond = {1}},
		{ID = 9002,Imageid = 2118,Desc = --[[!AUTO_227]]"開市準備，30位客人，需準備低階商品",BoardCond = {12}},
		{ID = 9003,Imageid = 2117,Desc = --[[!AUTO_228]]"第1市，共30位客人",BoardCond = {3}},
		{ID = 9004,Imageid = 2118,Desc = --[[!AUTO_229]]"休市整理，60位客人，需準備低階商品",BoardCond = {4}},
		{ID = 9005,Imageid = 2117,Desc = --[[!AUTO_230]]"第2波，共60位客人",BoardCond = {5}},
		{ID = 9006,Imageid = 2118,Desc = --[[!AUTO_231]]"休市整理，30位客人，需準備中階商品",BoardCond = {6}},
		{ID = 9007,Imageid = 2117,Desc = --[[!AUTO_232]]"第3波，共30位客人",BoardCond = {7}},
		{ID = 9008,Imageid = 2118,Desc = --[[!AUTO_233]]"休市整理，60位客人，需同時齊備低中階商品",BoardCond = {8}},
		{ID = 9009,Imageid = 2117,Desc = --[[!AUTO_234]]"第4波，共60位客人",BoardCond = {9}},
		{ID = 9010,Imageid = 2118,Desc = --[[!AUTO_235]]"休市整理，60位客人，需準備大量低中階商品",BoardCond = {10}},
		{ID = 9011,Imageid = 2117,Desc = --[[!AUTO_236]]"最後一市，共60位客人",BoardCond = {11}},
		{ID = 9012,Imageid = 914,Desc = --[[!AUTO_237]]"到街市司吏處論功行賞",BoardCond = {13}},
		{ID = 9013,Imageid = 914,Desc = --[[!AUTO_238]]"街市活動即將結束",BoardCond = {2}},
		--{ID = 909,Imageid = 10339,Desc = "当前客户：第%d波",BoardCond = {3,5,7,9,11}},
		{ID = 911,Imageid = 2115,Desc = --[[!AUTO_239]]"已離開客人數量：%d",BoardCond = {3,5,7,9,11}},
		{ID = 910,Imageid = 6603,Desc = --[[!AUTO_240]]"今日營業好評度：%d",BoardCond = {3,4,5,6,7,8,9,10,11,12,13}},
		{ID = 916,Imageid = 932,Desc = --[[!AUTO_241]]"論功行賞完成人數：%d",BoardCond = {13,1,12,3,4,5}},
	}
}

Ectype.EctypeArgs[913] =    --荒火圣殿
{
	Name = --[[!AUTO_242]]"任務進程",
	Desc = --[[!AUTO_243]]"目標：擊殺獄火麒麟",
	Args =
	{
		{ID = 201,Imageid = 12462,Desc = --[[!AUTO_244]]"獄火麒麟: %d / 1",BoardCond = {3}},
	}
}

Ectype.EctypeArgs[1253] =    --建帮副本衡山
{
	Name = --[[!AUTO_245]]"任務進程",
	Desc = --[[!AUTO_246]]"目標：通曉音律",
	Args =
	{
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_247]]"盡力接住各處飛來的音符",BoardCond = {3}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_248]]"小心躲避各處飛來的音符",BoardCond = {5}},
		{ID = 201,Imageid = 10998,Desc = --[[!AUTO_249]]"計時：%d秒",BoardCond = {3}},
		{ID = 203,Imageid = 10998,Desc = --[[!AUTO_250]]"計時：%d秒",BoardCond = {5}},
		{ID = 202,Imageid = 10998,Desc = --[[!AUTO_251]]"接住音符：%d次",BoardCond = {3}},
		{ID = 204,Imageid = 10998,Desc = --[[!AUTO_252]]"被音符擊中：%d次",BoardCond = {5}},
		{ID = 207,Imageid = 10998,Desc = --[[!AUTO_253]]"得分：%d分",BoardCond = {3,5}},
		{ID = 207,Imageid = 10998,Desc = --[[!AUTO_254]]"最終得分：%d分",BoardCond = {2}},
	}
}

Ectype.EctypeArgs[1260] =    --建帮副本峨眉
{
	Name = --[[!AUTO_255]]"任務進程",
	Desc = --[[!AUTO_256]]"目標：擊敗峨眉第一護衛",
	Args =
	{
		{ID = 201,Imageid = 10998,Desc = --[[!AUTO_257]]"擊敗第一階段的護衛",BoardCond = {2}, ArgsCond = {201,--[[!AUTO_258]]"=",0}},
		{ID = 201,Imageid = 10998,Desc = --[[!AUTO_259]]"擊敗第二階段的護衛",BoardCond = {2}, ArgsCond = {201,--[[!AUTO_260]]"=",1}},
		{ID = 201,Imageid = 10998,Desc = --[[!AUTO_261]]"擊敗第三階段的護衛",BoardCond = {2}, ArgsCond = {201,--[[!AUTO_262]]"=",2}},
		{ID = 201,Imageid = 10998,Desc = --[[!AUTO_263]]"完成挑戰",BoardCond = {2}, ArgsCond = {201,--[[!AUTO_264]]"=",3}},
	}
}

Ectype.EctypeArgs[1254] =    --建帮副本恒山
{
	Name = --[[!AUTO_265]]"任務進程",
	Desc = --[[!AUTO_266]]"目標：通關恆山七絕陣",
	Args =
	{
		{ID = 201,Imageid = 10998,Desc = --[[!AUTO_267]]"擊敗恆山派小弟子：0/3",BoardCond = {2}, ArgsCond = {201,--[[!AUTO_268]]"=",0}},
		{ID = 201,Imageid = 10998,Desc = --[[!AUTO_269]]"擊敗恆山派小弟子：1/3",BoardCond = {2}, ArgsCond = {201,--[[!AUTO_270]]"=",1}},
		{ID = 201,Imageid = 10998,Desc = --[[!AUTO_271]]"擊敗恆山派小弟子：2/3",BoardCond = {2}, ArgsCond = {201,--[[!AUTO_272]]"=",2}},
		{ID = 201,Imageid = 10998,Desc = --[[!AUTO_273]]"擊敗恆山派大弟子：0/2",BoardCond = {2}, ArgsCond = {201,--[[!AUTO_274]]"=",3}},
		{ID = 201,Imageid = 10998,Desc = --[[!AUTO_275]]"擊敗恆山派大弟子：1/2",BoardCond = {2}, ArgsCond = {201,--[[!AUTO_276]]"=",4}},
		{ID = 201,Imageid = 10998,Desc = --[[!AUTO_277]]"擊敗恆山派首席大弟子：0/1",BoardCond = {2}, ArgsCond = {201,--[[!AUTO_278]]"=",5}},
		{ID = 201,Imageid = 10998,Desc = --[[!AUTO_279]]"擊敗定閑師太：0/1",BoardCond = {2}, ArgsCond = {201,--[[!AUTO_280]]"=",6}},
		{ID = 201,Imageid = 10998,Desc = --[[!AUTO_281]]"完成挑戰",BoardCond = {2}, ArgsCond = {201,--[[!AUTO_282]]"=",7}},
	}
}

Ectype.EctypeArgs[1259] =    --建帮副本华山
{
	Name = --[[!AUTO_283]]"任務進程",
	Desc = --[[!AUTO_284]]"目標：挑戰華山門人",
	Args =
	{
		{ID = 201,Imageid = 10998,Desc = --[[!AUTO_285]]"擊敗岳靈珊：0/1",BoardCond = {2}, ArgsCond = {201,--[[!AUTO_286]]"=",0}},
		{ID = 201,Imageid = 10998,Desc = --[[!AUTO_287]]"擊敗勞德諾：0/1",BoardCond = {2}, ArgsCond = {201,--[[!AUTO_288]]"=",1}},
		{ID = 201,Imageid = 10998,Desc = --[[!AUTO_289]]"擊敗令狐沖：0/1",BoardCond = {2}, ArgsCond = {201,--[[!AUTO_290]]"=",2}},
		{ID = 201,Imageid = 10998,Desc = --[[!AUTO_291]]"完成挑戰",BoardCond = {2}, ArgsCond = {201,--[[!AUTO_292]]"=",3}},
	}
}

Ectype.EctypeArgs[1257] =    --建帮副本日月
{
	Name = --[[!AUTO_293]]"任務進程",
	Desc = --[[!AUTO_294]]"目標：挑戰日月高手",
	Args =
	{
		{ID = 201,Imageid = 10998,Desc = --[[!AUTO_295]]"擊敗任盈盈：0/1",BoardCond = {2}, ArgsCond = {201,--[[!AUTO_296]]"=",0}},
		{ID = 201,Imageid = 10998,Desc = --[[!AUTO_297]]"擊敗向問天：0/1",BoardCond = {2}, ArgsCond = {201,--[[!AUTO_298]]"=",1}},
		{ID = 201,Imageid = 10998,Desc = --[[!AUTO_299]]"完成挑戰",BoardCond = {2}, ArgsCond = {201,--[[!AUTO_300]]"=",2}},
	}
}

Ectype.EctypeArgs[1251] =    --建帮副本少林
{
	Name = --[[!AUTO_301]]"任務進程",
	Desc = --[[!AUTO_302]]"目標：通關十八銅人陣",
	Args =
	{
		{ID = 101,Imageid = 10998,Desc = --[[!AUTO_303]]"提示：同一組銅人需在3秒內同時擊敗", BoardCond = {2}},
		{ID = 101,Imageid = 10998,Desc = --[[!AUTO_304]]"擊敗第1組銅人", ArgsCond = {101,--[[!AUTO_305]]"=",2}},
		{ID = 101,Imageid = 10998,Desc = --[[!AUTO_306]]"擊敗第1組銅人", ArgsCond = {101,--[[!AUTO_307]]"=",3}},
		{ID = 101,Imageid = 10998,Desc = --[[!AUTO_308]]"擊敗第2組銅人", ArgsCond = {101,--[[!AUTO_309]]"=",4}},
		{ID = 101,Imageid = 10998,Desc = --[[!AUTO_310]]"擊敗第2組銅人", ArgsCond = {101,--[[!AUTO_311]]"=",5}},
		{ID = 101,Imageid = 10998,Desc = --[[!AUTO_312]]"擊敗第3組銅人", ArgsCond = {101,--[[!AUTO_313]]"=",6}},
		{ID = 101,Imageid = 10998,Desc = --[[!AUTO_314]]"擊敗第3組銅人", ArgsCond = {101,--[[!AUTO_315]]"=",7}},
		{ID = 101,Imageid = 10998,Desc = --[[!AUTO_316]]"擊敗第4組銅人", ArgsCond = {101,--[[!AUTO_317]]"=",8}},
		{ID = 101,Imageid = 10998,Desc = --[[!AUTO_318]]"擊敗第4組銅人", ArgsCond = {101,--[[!AUTO_319]]"=",9}},
		{ID = 101,Imageid = 10998,Desc = --[[!AUTO_320]]"擊敗第5組銅人", ArgsCond = {101,--[[!AUTO_321]]"=",10}},
		{ID = 101,Imageid = 10998,Desc = --[[!AUTO_322]]"擊敗第5組銅人", ArgsCond = {101,--[[!AUTO_323]]"=",11}},
		{ID = 101,Imageid = 10998,Desc = --[[!AUTO_324]]"擊敗第6組銅人", ArgsCond = {101,--[[!AUTO_325]]"=",12}},
		{ID = 101,Imageid = 10998,Desc = --[[!AUTO_326]]"擊敗第6組銅人", ArgsCond = {101,--[[!AUTO_327]]"=",13}},
		{ID = 101,Imageid = 10998,Desc = --[[!AUTO_328]]"擊敗第7組銅人", ArgsCond = {101,--[[!AUTO_329]]"=",14}},
		{ID = 101,Imageid = 10998,Desc = --[[!AUTO_330]]"擊敗第7組銅人", ArgsCond = {101,--[[!AUTO_331]]"=",15}},
		{ID = 101,Imageid = 10998,Desc = --[[!AUTO_332]]"擊敗第8組銅人", ArgsCond = {101,--[[!AUTO_333]]"=",16}},
		{ID = 101,Imageid = 10998,Desc = --[[!AUTO_334]]"擊敗第8組銅人", ArgsCond = {101,--[[!AUTO_335]]"=",17}},
		{ID = 101,Imageid = 10998,Desc = --[[!AUTO_336]]"擊敗第9組銅人", ArgsCond = {101,--[[!AUTO_337]]"=",18}},
		{ID = 101,Imageid = 10998,Desc = --[[!AUTO_338]]"擊敗第9組銅人", ArgsCond = {101,--[[!AUTO_339]]"=",19}},
		{ID = 101,Imageid = 10998,Desc = --[[!AUTO_340]]"完成挑戰", ArgsCond = {101,--[[!AUTO_341]]"=",20}},
	}
}

Ectype.EctypeArgs[1256] =    --建帮副本唐门
{
	Name = --[[!AUTO_342]]"任務進程",
	Desc = --[[!AUTO_343]]"目標：通關唐門玄機閣",
	Args =
	{
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_344]]"開啟第一間密室的機關",BoardCond = {7,3}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_345]]"開啟第二間密室的機關",BoardCond = {4}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_346]]"開啟第三間密室的機關",BoardCond = {5}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_347]]"擊敗唐門門人",BoardCond = {6,2}, ArgsCond = {201,--[[!AUTO_348]]"=",0}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_349]]"完成挑戰",BoardCond = {2}, ArgsCond = {201,--[[!AUTO_350]]"=",1}},
		{ID = 904,Imageid = 10998,Desc = --[[!AUTO_351]]"被暗器擊中：%d次",BoardCond = {2,3,4,5,6,7}},

	}
}

Ectype.EctypeArgs[1255] =    --建帮副本五仙
{
	Name = --[[!AUTO_352]]"任務進程",
	Desc = --[[!AUTO_353]]"目標：挑戰五仙掌門",
	Args =
	{
		{ID = 201,Imageid = 10998,Desc = --[[!AUTO_354]]"擊敗藍鳳凰",BoardCond = {2}, ArgsCond = {201,--[[!AUTO_355]]"=",0}},
		{ID = 201,Imageid = 10998,Desc = --[[!AUTO_356]]"完成挑戰",BoardCond = {2}, ArgsCond = {201,--[[!AUTO_357]]"=",1}},
	}
}

Ectype.EctypeArgs[1252] =    --建帮副本武当
{
	Name = --[[!AUTO_358]]"任務進程",
	Desc = --[[!AUTO_359]]"目標：通關真武七截陣",
	Args =
	{
		{ID = 101,Imageid = 10998,Desc = --[[!AUTO_360]]"擊敗守陣弟子：%d/6",BoardCond = {2}, ArgsCond = {101,--[[!AUTO_361]]"<",6}},
		{ID = 101,Imageid = 10998,Desc = --[[!AUTO_362]]"擊敗沖虛",BoardCond = {2}, ArgsCond = {101,--[[!AUTO_363]]"=",6}},
		{ID = 101,Imageid = 10998,Desc = --[[!AUTO_364]]"完成挑戰",BoardCond = {2}, ArgsCond = {101,--[[!AUTO_365]]">",6}},
	}
}

Ectype.EctypeArgs[1258] =    --建帮副本逍遥
{
	Name = --[[!AUTO_366]]"任務進程",
	Desc = --[[!AUTO_367]]"目標：通關逍遙玉仙洞",
	Args =
	{
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_368]]"找到寫有“甲”的石板",BoardCond = {3}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_369]]"找到寫有“乙”的石板",BoardCond = {4}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_370]]"找到寫有“丙”的石板",BoardCond = {5}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_371]]"找到寫有“丁”的石板",BoardCond = {6}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_372]]"找到寫有“戊”的石板",BoardCond = {7}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_373]]"找到寫有“己”的石板",BoardCond = {8}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_374]]"找到寫有“庚”的石板",BoardCond = {9}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_375]]"找到寫有“辛”的石板",BoardCond = {10}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_376]]"找到寫有“壬”的石板",BoardCond = {11}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_377]]"找到寫有“癸”的石板",BoardCond = {12}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_378]]"找到寫有“子”的石板",BoardCond = {13}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_379]]"找到寫有“醜”的石板",BoardCond = {14}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_380]]"找到寫有“寅”的石板",BoardCond = {15}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_381]]"找到寫有“卯”的石板",BoardCond = {16}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_382]]"找到寫有“辰”的石板",BoardCond = {17}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_383]]"找到寫有“巳”的石板",BoardCond = {18}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_384]]"找到寫有“午”的石板",BoardCond = {19}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_385]]"找到寫有“未”的石板",BoardCond = {20}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_386]]"找到寫有“申”的石板",BoardCond = {21}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_387]]"找到寫有“酉”的石板",BoardCond = {22}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_388]]"找到寫有“戌”的石板",BoardCond = {23}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_389]]"找到寫有“亥”的石板",BoardCond = {24}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_390]]"完成挑戰",BoardCond = {2}},
	}
}

Ectype.EctypeArgs[1271] =    --城郊农场
{
	Name = --[[!AUTO_391]]"任務進程",
	Desc = --[[!AUTO_392]]"目標：擊殺指定怪物",
	Args =
	{
		{ID = 201,Imageid = 1311,Desc = --[[!AUTO_393]]"野豬: %d / 40",BoardCond = {3}},
		{ID = 202,Imageid = 1311,Desc = --[[!AUTO_394]]"野豬王: %d / 1",BoardCond = {4}},
	}
}

Ectype.EctypeArgs[1693] =    --鬼府灵台
{
	Name = --[[!AUTO_395]]"任務進程",
	Desc = --[[!AUTO_396]]"目標：破壞八盞鬼燈",
	Args =
	{
		{ID = 201,Imageid = 12142,Desc = --[[!AUTO_397]]"八盞鬼燈: %d / 8",BoardCond = {3}},
	}
}

Ectype.EctypeArgs[1751] =    --联手产品演示
{
	Name = --[[!AUTO_398]]"副本追蹤",
	Desc = --[[!AUTO_399]]"目標：同向問天聯手逃離仙愁峽",
	Args =
	{
--102 连战波数
		{ID = 0,Imageid = 1963,Desc = --[[!AUTO_400]]"前往被圍困的神秘老者",BoardCond = {1}},
		{ID = 102,Imageid = 2255,Desc = --[[!AUTO_401]]"抵擋各路高手圍攻(%d/9)",BoardCond = {36,3,4,5,6,7,8,9,10}},
		{ID = 0,Imageid = 1924,Desc = --[[!AUTO_402]]"擊敗侯人雄眾人",BoardCond = {36}},
		{ID = 0,Imageid = 1939,Desc = --[[!AUTO_403]]"擊敗黑衣方士和術士",BoardCond = {3}},
		{ID = 0,Imageid = 1382,Desc = --[[!AUTO_404]]"擊敗黑衣力士兄弟",BoardCond = {4}},
		{ID = 0,Imageid = 10344,Desc = --[[!AUTO_405]]"擊敗八位黑衣槍客",BoardCond = {5}},
		{ID = 0,Imageid = 1418,Desc = --[[!AUTO_406]]"擊敗黑衣娘子一行",BoardCond = {6}},
		{ID = 0,Imageid = 1935,Desc = --[[!AUTO_407]]"擊退天乙道人",BoardCond = {7}},
		{ID = 0,Imageid = 10226,Desc = --[[!AUTO_408]]"擊敗天乙道人五名弟子",BoardCond = {8}},
		{ID = 0,Imageid = 10221,Desc = --[[!AUTO_409]]"擊敗正派和邪派高手",BoardCond = {9}},
		{ID = 0,Imageid = 1354,Desc = --[[!AUTO_410]]"擊敗八大黑衣殺手",BoardCond = {10}},
		{ID = 0,Imageid = 1963,Desc = --[[!AUTO_411]]"前往山腰與向問天會合",BoardCond = {11,12,13,14,15,16,17,18,19,20,21,22,23}},
		{ID = 0,Imageid = 1963,Desc = --[[!AUTO_412]]"按向問天所說，選擇一條前進的道路。",BoardCond = {24}},
		{ID = 0,Imageid = 2260,Desc = --[[!AUTO_413]]"延西側峽谷，從敵後方偷襲，前往山頂。",BoardCond = {25,26,27}},
		{ID = 0,Imageid = 2282,Desc = --[[!AUTO_414]]"延東側山路，突破敵人封鎖，前往山頂",BoardCond = {28,29,30,31,32}},
		{ID = 0,Imageid = 10335,Desc = --[[!AUTO_415]]"擊敗敵方頭目：黑手",BoardCond = {33}},
		{ID = 0,Imageid = 1963,Desc = --[[!AUTO_416]]"去山頂與向問天會合",BoardCond = {34,37}},
		{ID = 0,Imageid = 2288,Desc = --[[!AUTO_417]]"從仙愁峽頂一躍而下，躲過亂石雜木，逃出生天！",BoardCond = {35}},
		--{ID = 0,Imageid = 1963,Desc = "副本结束",BoardCond = {2}},
	}
}

Ectype.EctypeArgs[1752] =    --梅关聚义厅

{
	Name = --[[!AUTO_418]]"任務進程",
	Desc = --[[!AUTO_419]]"目標：擊殺指定怪物",
	Args =
	{
		{ID = 101,Imageid = 9942,Desc = --[[!AUTO_420]]"醉嘍囉: %d / 5",BoardCond = {2}},
		{ID = 102,Imageid = 1192,Desc = --[[!AUTO_421]]"醉金剛: %d / 5",BoardCond = {2}},
		{ID = 103,Imageid = 1383,Desc = --[[!AUTO_422]]"二當家: %d / 1",BoardCond = {2}},
	}
}

Ectype.EctypeArgs[1777] =
{
	Name = --[[!AUTO_423]]"副本追蹤",
	Desc = --[[!AUTO_424]]"目標：攻破青城派松風觀",
	Args =
	{
		{ID = 0,Imageid = 2103,Desc = --[[!AUTO_425]]"前往吊橋",BoardCond = {1,18}},
		{ID = 0,Imageid = 1932,Desc = --[[!AUTO_426]]"全滅敵人後，突破松風觀第一門",BoardCond = {2,32}},
		{ID = 0,Imageid = 1932,Desc = --[[!AUTO_427]]"全滅敵人後，突破松風觀第二門",BoardCond = {3,33}},
		{ID = 0,Imageid = 1932,Desc = --[[!AUTO_428]]"全滅敵人後前進",BoardCond = {4,5,26,27,28,7}},
		{ID = 0,Imageid = 1926,Desc = --[[!AUTO_429]]"擊退羅人傑後，突破松風觀第三門",BoardCond = {22,34}},
		{ID = 0,Imageid = 1925,Desc = --[[!AUTO_430]]"擊退于人豪後，突破松風觀第四門",BoardCond = {23,35}},
                {ID = 0,Imageid = 1924,Desc = --[[!AUTO_431]]"擊退洪人雄後，突破松風觀第五門",BoardCond = {24,36}},
                {ID = 0,Imageid = 1923,Desc = --[[!AUTO_432]]"擊退侯人英後，突破松風觀最終門",BoardCond = {25,31}},
                {ID = 0,Imageid = 1927,Desc = --[[!AUTO_433]]"消滅青城四秀和眾多弟子，擊敗余滄海",BoardCond = {21,8}},
		--{ID = 201,Imageid = 6852,Desc = "完美度: %d"},
	}
}

Ectype.EctypeArgs[1923] =	--东厂盗宝副本
{
	Name = --[[!AUTO_434]]"副本追蹤",
	Desc = --[[!AUTO_435]]"目標：潛入東廠盜取《嘔血譜》，並成功脫身",
	Args =
	{
		{ID = 0,Imageid = 2103,Desc = --[[!AUTO_436]]"從週邊潛入東廠內部",BoardCond = {1,2}},
		{ID = 0,Imageid = 1368,Desc = --[[!AUTO_437]]"全滅敵人",BoardCond = {16,3,18,15,14,9}},
		{ID = 0,Imageid = 2103,Desc = --[[!AUTO_438]]"繼續深入東廠內部",BoardCond = {17}},
		{ID = 0,Imageid = 2103,Desc = --[[!AUTO_439]]"從書架後暗門進入盜取《嘔血譜》",BoardCond = {8}},
		{ID = 0,Imageid = 10370,Desc = --[[!AUTO_440]]"擊敗東廠百戶",BoardCond = {4}},
		{ID = 0,Imageid = 2103,Desc = --[[!AUTO_441]]"攜《嘔血譜》與向問天在東廠外匯合",BoardCond = {5,19}},
		{ID = 0,Imageid = 2103,Desc = --[[!AUTO_442]]"繼續前往匯合點",BoardCond = {6,20,10}},
		{ID = 0,Imageid = 10308,Desc = --[[!AUTO_443]]"擊敗羅睺星君",BoardCond = {7}},
		{ID = 0,Imageid = 1371,Desc = --[[!AUTO_444]]"擊敗東廠太監賈詢",BoardCond = {11}},
	}
}

Ectype.EctypeArgs[1926] =
{
	Name = --[[!AUTO_445]]"副本追蹤",
	Desc = --[[!AUTO_446]]"目標：剿滅日月分舵",
	Args =
	{
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_447]]"跟隨莫大，殺入日月分舵大門",BoardCond = {1}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_448]]"摧毀廣場中心建築並全滅出來的敵人",BoardCond = {2}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_449]]"前往西邊的日壇開啟機關",BoardCond = {3,4}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_450]]"前往東邊的月壇開啟機關",BoardCond = {5}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_451]]"殺死日月分舵舵主",BoardCond = {6}},

	}
}

Ectype.EctypeArgs[1927] =
{
	Name = --[[!AUTO_452]]"蟲洞取譜",
	Desc = --[[!AUTO_453]]"目標：勇闖百毒禁地",
	Args =
	{
		{ID = 0,Imageid = 910,Desc = --[[!AUTO_454]]"跳下平臺，踏入百毒禁地的大門",BoardCond = {1}},
		{ID = 0,Imageid = 1338,Desc = --[[!AUTO_455]]"挑戰百蟲陣並進入大廳",BoardCond = {10}},
		{ID = 102,Imageid = 1338,Desc = --[[!AUTO_456]]"進度 %d / 100",BoardCond = {10}},
		{ID = 0,Imageid = 920,Desc = --[[!AUTO_457]]"摧毀大廳四周的蛾卵",BoardCond = {11}},
		{ID = 103,Imageid = 920,Desc = --[[!AUTO_458]]"進度 %d / 15",BoardCond = {11}},
		{ID = 0,Imageid = 1338,Desc = --[[!AUTO_459]]"擊敗百年蛾獸，並打開大廳的門",BoardCond = {3}},
		{ID = 0,Imageid = 10261,Desc = --[[!AUTO_460]]"補給恢復後，打開第一扇蜘蛛門，進入蜘蛛區",BoardCond = {4}},
		{ID = 0,Imageid = 10261,Desc = --[[!AUTO_461]]"擊退所有攔路的蜘蛛，並且前往第二扇蜘蛛門",BoardCond = {12}},
		{ID = 0,Imageid = 10261,Desc = --[[!AUTO_462]]"沿蛛絲前往巨大蛛網",BoardCond = {13}},
		{ID = 0,Imageid = 1322,Desc = --[[!AUTO_463]]"擊敗千年狼蛛",BoardCond = {6}},
		{ID = 0,Imageid = 9118,Desc = --[[!AUTO_464]]"擊退神秘的巨型蜈蚣",BoardCond = {9}},
		{ID = 0,Imageid = 9118,Desc = --[[!AUTO_465]]"清除沿途的阻礙，向禁地深處進發",BoardCond = {8}},
		{ID = 0,Imageid = 9118,Desc = --[[!AUTO_466]]"清除沿途更多的阻礙，前往禁地最深處",BoardCond = {14}},
		{ID = 0,Imageid = 9118,Desc = --[[!AUTO_467]]"補給恢復後，前往百毒柱所在的平臺",BoardCond = {15}},
                {ID = 0,Imageid = 6540,Desc = --[[!AUTO_468]]"擊敗萬年蜈蚣",BoardCond = {7}},
                {ID = 0,Imageid = 6540,Desc = --[[!AUTO_469]]"擊敗狂暴化的萬年蜈蚣真身",BoardCond = {16}},
                {ID = 105,Imageid = 6540,Desc = --[[!AUTO_470]]"生存倒計時：%d",BoardCond = {16},ArgsCond = {105,--[[!AUTO_471]]">",-1}},
                {ID = 0,Imageid = 910,Desc = --[[!AUTO_472]]"論功行賞",BoardCond = {17}},
		--{ID = 9,Imageid = 6826,Desc = "战斗分数: %d"},
		--{ID = 201,Imageid = 6852,Desc = "完美度: %d"},
	}
}

Ectype.EctypeArgs[1928] =
{
	Name = --[[!AUTO_473]]"副本追蹤",
	Desc = --[[!AUTO_474]]"目標：勇闖魔窟，掩護向問天盜取秘寶",
	Args =
	{
		{ID = 0,Imageid = 2103,Desc = --[[!AUTO_475]]"前進，擊潰所有阻礙",BoardCond = {1,3}},
		{ID = 0,Imageid = 1345,Desc = --[[!AUTO_476]]"消滅魔教腐奴",BoardCond = {4}},
		{ID = 0,Imageid = 10358,Desc = --[[!AUTO_477]]"擊潰所有敵人,片甲不留",BoardCond = {5,7}},
		{ID = 0,Imageid = 1381,Desc = --[[!AUTO_478]]"擊殺魔教壇主",BoardCond = {6}},
		{ID = 0,Imageid = 10371,Desc = --[[!AUTO_479]]"優先擊殺魔教護法",BoardCond = {8}},
		{ID = 0,Imageid = 10267,Desc = --[[!AUTO_480]]"擊殺黑血毒蠍",BoardCond = {11}},
		{ID = 0,Imageid = 1425,Desc = --[[!AUTO_481]]"擊殺毒花，注意躲避它噴出的毒",BoardCond = {9}},
		--{ID = 9,Imageid = 6826,Desc = "战斗分数: %d"},
		--{ID = 201,Imageid = 6852,Desc = "完美度: %d"},
	}
}

Ectype.EctypeArgs[7368] =
{
	Name = --[[!AUTO_473]]"副本追蹤",
	Desc = --[[!AUTO_474]]"目標：擊敗所有敵人，成為當世武尊",
	Args =
	{
		{ID = 235,Imageid = 2103,Desc = --[[!AUTO_475]]"前進，擊敗所有BOSS(%d/18)",BoardCond = {1,3}},
		{ID = 0,Imageid = 2103,Desc = --[[!AUTO_475]]"副本完成",BoardCond = {2}},
		--{ID = 9,Imageid = 6826,Desc = "战斗分数: %d"},
		--{ID = 201,Imageid = 6852,Desc = "完美度: %d"},
	}
}

Ectype.EctypeArgs[7381] =
{
	Name = --[[!AUTO_473]]"副本追蹤",
	Desc = --[[!AUTO_474]]"目標：前往金頂",
	Args =
	{
		{ID = 0,Imageid = 2103,Desc = --[[!AUTO_475]]"利用變身來加快行進速度，小心沿途的陷阱",BoardCond = {1,3}},
		{ID = 0,Imageid = 2103,Desc = --[[!AUTO_475]]"副本完成",BoardCond = {2}},
		--{ID = 9,Imageid = 6826,Desc = "战斗分数: %d"},
		--{ID = 201,Imageid = 6852,Desc = "完美度: %d"},
	}
}

Ectype.EctypeArgs[6230] =
{
	Name = --[[!AUTO_473]]"副本追蹤",
	Desc = --[[!AUTO_474]]"目標：擊敗盤踞在鎮子中的外漠盜匪",
	Args =
	{
		{ID = 0,Imageid = 2103,Desc = --[[!AUTO_475]]"前進，擊潰所有阻礙",BoardCond = {1,2,10,11,13,15,17,18,19,21,22,23,25}},
		{ID = 210,Imageid = 1360,Desc = --[[!AUTO_481]]"擊殺擋路的彎刀駝(%d/5)",BoardCond = {3}},
		{ID = 211,Imageid = 1345,Desc = --[[!AUTO_476]]"消滅三個大漠射手(%d/3)",BoardCond = {12}},
		{ID = 0,Imageid = 10358,Desc = --[[!AUTO_477]]"小心炸彈！！",BoardCond = {14}},
		{ID = 212,Imageid = 22382,Desc = --[[!AUTO_478]]"擊殺西域大盜(%d/1)",BoardCond = {16}},
		{ID = 0,Imageid = 22384,Desc = --[[!AUTO_479]]"猜猜哪個是真的！",BoardCond = {20}},
		{ID = 213,Imageid = 22384,Desc = --[[!AUTO_480]]"擊殺東林咒師(%d/1)",BoardCond = {27}},
		{ID = 214,Imageid = 7240,Desc = --[[!AUTO_481]]"擊殺擋路的食腐犬(%d/3)",BoardCond = {24}},
		{ID = 215,Imageid = 1360,Desc = --[[!AUTO_481]]"擊殺擋路的彎刀駝(%d/30)",BoardCond = {9,24}},
		{ID = 216,Imageid = 22383,Desc = --[[!AUTO_480]]"擊殺北疆瘋丐(%d/1)",BoardCond = {26}},
		--{ID = 9,Imageid = 6826,Desc = "战斗分数: %d"},
		--{ID = 201,Imageid = 6852,Desc = "完美度: %d"},
	}
}

Ectype.EctypeArgs[2638] =
{
	Name = --[[!AUTO_482]]"副本追蹤",
	Desc = --[[!AUTO_483]]"目標：突破梅莊週邊，擊殺黑白子",
	Args =
	{
		{ID = 0,Imageid = 2103,Desc = --[[!AUTO_484]]"前往湖邊小築",BoardCond = {1}},
		{ID = 212,Imageid = 1375,Desc = --[[!AUTO_485]]"消滅梅莊入門弟子(%d/16)",BoardCond = {2}},
		{ID = 213,Imageid = 1419,Desc = --[[!AUTO_486]]"消滅梅莊力士(%d/2)",BoardCond = {2}},
		{ID = 0,Imageid = 2103,Desc = --[[!AUTO_487]]"繼續前進",BoardCond = {3,5,7,9,12,14}},
		{ID = 214,Imageid = 1375,Desc = --[[!AUTO_488]]"消滅梅莊入門弟子(%d/20)",BoardCond = {4}},
		{ID = 226,Imageid = 1419,Desc = --[[!AUTO_489]]"消滅梅莊力士(%d/2)",BoardCond = {4}},
		{ID = 231,Imageid = 15753,Desc = --[[!AUTO_490]]"消滅施令威(%d/1)",BoardCond = {4}},
		{ID = 230,Imageid = 1376,Desc = --[[!AUTO_491]]"消滅丁堅(%d/1)",BoardCond = {6}},
                {ID = 214,Imageid = 1375,Desc = --[[!AUTO_492]]"消滅梅莊入門弟子(%d/45)",BoardCond = {8}},
                {ID = 228,Imageid = 1419,Desc = --[[!AUTO_493]]"消滅梅莊力士(%d/4)",BoardCond = {10}},
		{ID = 229,Imageid = 14510,Desc = --[[!AUTO_494]]"消滅黑白子(%d/1)",BoardCond = {13}},
		--{ID = 9,Imageid = 6826,Desc = "战斗分数: %d"},
		--{ID = 201,Imageid = 6852,Desc = "完美度: %d"},
	}
}


Ectype.EctypeArgs[3309] =
{
	Name = --[[!AUTO_495]]"副本追蹤",
	Desc = --[[!AUTO_496]]"目標：採集竹筏上的魚網，用魚網抓獲儘量多的魚，累計越多的捕魚積分便能獲得越多的獎勵哦！",
	Args =
	{
		{ID = 301,Imageid = 2103,Desc = --[[!AUTO_497]]"捕魚積分(%d/1000)",BoardCond = {1}},
		--{ID = 9,Imageid = 6826,Desc = "战斗分数: %d"},
		--{ID = 201,Imageid = 6852,Desc = "完美度: %d"},
	}
}

Ectype.EctypeArgs[2011] =
{
	Name = --[[!AUTO_498]]"副本追蹤",
	Desc = --[[!AUTO_499]]"目標：找到曲劉兩位前輩，阻止費彬的暴行",  --@打探[pos3 16,40.40,0.5]
	Args =
	{
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_500]]"夜靜如水,嵐風瑟瑟，谷中似有絲竹之聲。不妨走到前方@火炬處[pos3 -28.5,32.68,-33.9]，打探下情況。",BoardCond = {11}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_501]]"盟主令出，莫敢不從！好大個口氣！且聽他們還有什麼鬼話！",BoardCond = {12}},
		{ID = 15,Imageid = 10998,Desc = --[[!AUTO_502]]"天下人的路，天下人走得！擊殺所有攔路的@嵩山殺手[target -28.5,32.68,-33.9,monster=71886](%d/6)。",BoardCond = {13}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_503]]"提示：擊碎前方火炬後，會有火焰冒出，火焰會傷及自身和敵人。",BoardCond = {13}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_504]]"夜梟啼鳴，又有惡人出現，不如守在@一旁[pos3 -16.23,40.98,-22.07],靜待其變。",BoardCond = {14}},
		{ID = 15,Imageid = 10998,Desc = --[[!AUTO_505]]"為虎作倀者當誅，擊殺所有的@嵩山精英[target 11,42,-13,monster=71885](%d/6)",BoardCond = {15}},
		{ID = 16,Imageid = 10998,Desc = --[[!AUTO_506]]"擊殺@嵩山伏擊手[target 11,42,-13,monster=71874](%d/4)。",BoardCond = {15}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_507]]"攔擊者已被擊退，上前一步，繼續@找尋[pos3 23.29,46.98,10.85]曲劉兩位前輩。",BoardCond = {16}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_508]]"費彬殘殺婦孺，人人得而誅之",BoardCond = {3}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_509]]"打敗@費彬[target 23.88,47.1194,25.86,monster=35838]",BoardCond = {1}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_510]]"青山處處埋忠骨，再上前探望下曲劉兩位前輩！",BoardCond = {2}},
	}
}

Ectype.EctypeArgs[2017] =
{
	Name = --[[!AUTO_511]]"副本追蹤",
	Desc = --[[!AUTO_512]]"目標：協助令狐沖和儀琳",
	Args =
	{
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_513]]"查看迴雁樓內的情勢",BoardCond = {1}},
		{ID = 15,Imageid = 10998,Desc = --[[!AUTO_514]]"擊敗圍攻令狐沖的@青城三代弟子[target -6.54,35.1949,-14.87,npc=44908](%d/6)",BoardCond = {3}},
		{ID = 15,Imageid = 10998,Desc = --[[!AUTO_515]]"擊敗@黎人洪[target -0.89,35.1949,-17.1,monster=35815](%d/1)",BoardCond = {4}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_516]]"令狐沖與羅人傑對決，兩敗俱傷",BoardCond = {8}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_517]]"令狐沖重傷，儀琳傷心欲絕",BoardCond = {5}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_518]]"跟隨@儀琳[pos -8,-24]和@令狐沖[pos -8,-24]離開",BoardCond = {6,7,2}},
	}
}

Ectype.EctypeArgs[2018] =
{
	Name = --[[!AUTO_519]]"副本追蹤",
	Desc = --[[!AUTO_520]]"目標：阻止嵩山派的暴行",
	Args =
	{
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_521]]"進入@洗手大會[pos 143,132]現場",BoardCond = {1}},
		{ID = 15,Imageid = 10998,Desc = --[[!AUTO_522]]"擊敗挾持劉正風家人的@嵩山門徒[target 153.09,117.851,132.06,monster=11178](%d/6)",BoardCond = {3}},
		{ID = 15,Imageid = 10998,Desc = --[[!AUTO_523]]"擊敗與曲洋部下混戰的@嵩山狂劍[target 176.42,121.288,131.98,monster=35842](%d/6)",BoardCond = {4}},
		{ID = 15,Imageid = 10998,Desc = --[[!AUTO_524]]"擊敗@嵩山殺手[target 176.4,121.288,132,monster=35836](%d/8)",BoardCond = {5}},
		{ID = 16,Imageid = 10998,Desc = --[[!AUTO_525]]"擊敗@嵩山戾劍[target 176.4,121.288,132,monster=35843](%d/4)",BoardCond = {5}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_526]]"費彬無意戀戰，帶領手下前往夜嵐谷",BoardCond = {6}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_527]]"找到重傷的@劉芹[pos 152,132]",BoardCond = {2}},
	}
}

Ectype.EctypeArgs[2012] =
{
	Name = --[[!AUTO_528]]"副本追蹤",
	Desc = --[[!AUTO_529]]"目標：三十年前，風清揚向華山弟子辭行",
	Args =
	{
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_530]]"化解劍氣二宗弟子爭論",BoardCond = {1}},
		{ID = 15,Imageid = 10998,Desc = --[[!AUTO_531]]"擊打@木人樁[pos -241,59](%d/4)，演示華山劍法",BoardCond = {7}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_532]]"指點岳不群",BoardCond = {2}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_533]]"痛飲@餞行酒[pos -216,59]",BoardCond = {6}},
	}
}

Ectype.EctypeArgs[2015] =
{
	Name = --[[!AUTO_534]]"副本追蹤",
	Desc = --[[!AUTO_535]]"目標：相識相愛，風清揚與梅雪大婚",
	Args =
	{
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_536]]"迎接喜宴賓客",BoardCond = {1}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_537]]"向賓客@敬酒[pos 3,-20]",BoardCond = {2}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_538]]"進入@婚禮現場[pos 3,25]",BoardCond = {3}},
		{ID = 15,Imageid = 10998,Desc = --[[!AUTO_539]]"擊敗@葉府護衛[pos 2,6](%d/6)，保護封不平",BoardCond = {4}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_540]]"質問梅雪",BoardCond = {5}},
	}
}

Ectype.EctypeArgs[2016] =
{
	Name = --[[!AUTO_541]]"副本追蹤",
	Desc = --[[!AUTO_542]]"目標：挽救華山劍宗",
	Args =
	{
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_543]]"趕回華山派",BoardCond = {1}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_544]]"擊敗氣宗弟子",BoardCond = {2}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_545]]"擊敗氣宗長老",BoardCond = {3}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_546]]"擊敗岳不群",BoardCond = {5}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_547]]"傾聽風清揚的抉擇",BoardCond = {4}},
	}
}

Ectype.EctypeArgs[2013] =
{
	Name = --[[!AUTO_548]]"副本追蹤",
	Desc = --[[!AUTO_549]]"目標：完成兩儀八卦陣",
	Args =
	{
		{ID = 15,Imageid = 10998,Desc = --[[!AUTO_550]]"擊殺攔在路上的12個@錦衣小卒[target -116.452,116.872,23.2399,monster=35853](%d/12)",BoardCond = {1}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_551]]"走近@武當山門[pos -155,45]查看情況",BoardCond = {5}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_552]]"圍觀武當七俠擺出殘陣",BoardCond = {4}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_553]]"走入@乾位陣眼[pos3 -159.837,105.039,37.3382]，完成兩儀八卦陣圍困許顯純",BoardCond = {2}},
		{ID = 15,Imageid = 10998,Desc = --[[!AUTO_554]]"擊退受到兩儀八卦陣震懾而虛弱的@許顯純[target -159.644,104.27,47.4747,monster=37560](%d/1)",BoardCond = {6,3}}
	}
}

Ectype.EctypeArgs[2022] =
{
	Name = --[[!AUTO_555]]"副本追蹤",
	Desc = --[[!AUTO_556]]"目標：擊退前來華山鬧事的嵩山派和劍宗門人",
	Args =
	{
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_557]]"進@華山[pos -17,-146]派查看情況",BoardCond = {1}},
		{ID = 15,Imageid = 10998,Desc = --[[!AUTO_558]]"擊敗迎面而來的@嵩山殺手[pos -17,-133](%d/4)",BoardCond = {2}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_559]]"前往@前方廣場[pos -17,-96]",BoardCond = {7}},
		{ID = 15,Imageid = 10998,Desc = --[[!AUTO_560]]"幫助華山弟子抵抗圍殺過來的@嵩山殺手[pos -17,-96](%d/12)",BoardCond = {3}},
		{ID = 15,Imageid = 10998,Desc = --[[!AUTO_561]]"同華山弟子一起前往@正氣堂[pos -17,8]",BoardCond = {10}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_562]]"擊敗@魯連榮[pos -16,12]",BoardCond = {5}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_563]]"擊敗@成不憂[pos -16,11]",BoardCond = {6}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_564]]"@跟上[pos -16,-40]抬走令狐沖的桃谷六仙",BoardCond = {8}}
	}
}

Ectype.EctypeArgs[2023] =
{
	Name = --[[!AUTO_565]]"副本追蹤",
	Desc = --[[!AUTO_566]]"目標：去思過崖幫東方不敗尋找一件袈裟",
	Args =
	{
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_567]]"去拜見早先見過的@風清揚[pos 11,-38]前輩",BoardCond = {7}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_568]]"跟隨@風清揚[target 3,48,-37,npc=37285]尋找洞口",BoardCond = {9}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_569]]"前往堵住洞口的@石堆[pos3 -0.013,47.520,-23.449]按R鍵鑿開它",BoardCond = {8}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_570]]"聽@風清揚[target 17,49,18,npc=37285]講述洞中石刻的由來",BoardCond = {5}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_571]]"撿取洞裡屍骸身上的@殘破袈裟[target 27.73,48.26,112.58,mine=38167]",BoardCond = {10}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_572]]"跟隨@風清揚[target 15,34,59,npc=37285]跳入洞穴深處，查看洞穴內的異動",BoardCond = {11}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_573]]"擊退幻影中出現的@嵩山前輩[target 15,34,59,monster=35867](%SA[108]/1)，@衡山前輩[target 15,34,59,monster=35859](%SA[106]/1)，@恆山前輩[target 15,34,59,monster=35858](%SA[105]/1)，@泰山前輩[target 15,34,59,monster=35868](%SA[109]/1)，@華山前輩[target 15,34,59,monster=35860](%SA[107]/1)",BoardCond = {2}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_574]]"擊退幻影中出現的日月神教長老@張乘風[target 15,34,59,monster=57831](%SA[105]/1)，@張乘雲[target 15,34,59,monster=35869](%SA[106]/1)",BoardCond = {3}},
	}
}

Ectype.EctypeArgs[2084] =
{
	Name = --[[!AUTO_575]]"副本追蹤",
	Desc = --[[!AUTO_576]]"直面青城派，查尋劉芹去向。",
	Args =
	{
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_577]]"打敗攔路的青城巡查",BoardCond = {1}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_578]]"打敗攔路的@青城巡查[target -120.283, 32.598, 28.402, monster = 75003](%SA[102]/3)",BoardCond = {3}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_579]]"沿箭頭跳上屋頂",BoardCond = {4}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_580]]"恐嚇賈人達，使其吐露劉芹去向\r^FFFF00（恐嚇快速鍵：2）\r^FFFFFF賈人達崩潰度：%SA[103]/3",BoardCond = {5}, ArgsCond = {104,--[[!AUTO_581]]"=",1}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_582]]"毆打賈人達，使其吐露劉芹去向\r^FFFF00（毆打快速鍵：1）\r^FFFFFF賈人達崩潰度：%SA[103]/3",BoardCond = {5}, ArgsCond = {104,--[[!AUTO_583]]"=",2}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_584]]"離開屋頂，找@曲洋[pos3 -140.188, 32.864, 21.513]商量下一步行動",BoardCond = {6}}
	}
}

Ectype.EctypeArgs[2029] =
{
	Name = --[[!AUTO_585]]"副本追蹤",
	Desc = --[[!AUTO_586]]"目標：墜落懸崖，發現一個詭秘山洞",
	Args =
	{
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_587]]"查看洞口@石碑[pos 2,-86]上的刻字",BoardCond = {1}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_588]]"斬除從陰暗中遊移而來的雞冠蛇與黑蝙蝠",BoardCond = {2}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_589]]"從@石門[pos 2,-38]進入洞內",BoardCond = {9}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_590]]"查看石洞內豎立的四根巨劍:@青魔 破[pos -15,-20]，@紫盞 縈[pos -15,0]，@玄礐 輦[pos 19,0]，@化風 歸[pos 19,-21]",BoardCond = {3}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_591]]"去石洞的西側看看隱藏在水幕後的@石壁[pos -53,-1]上寫些什麼",BoardCond = {4}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_592]]"石壁說這洞中藏有@稀世兵器[pos 41,-8]，隱約在洞內另一端，去找找",BoardCond = {8}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_593]]"斬殺盤踞在劍塚旁邊的菩斯曲巨蛇",BoardCond = {5}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_594]]"此處石函森然，不知藏有什麼，打開它一探究竟",BoardCond = {6}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_595]]"入口的另一端隱約散入天光，似乎是@出口[pos 2,28]",BoardCond = {10}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_596]]"順著凌空的石樑@離開[pos 2,125]這裡",BoardCond = {7}}
	}
}


--专家测试副本，手动填入失败条件，程序传入副本层数
Ectype.EctypeArgs[2038] =
{
	Name = --[[!AUTO_597]]"副本追蹤",
	Desc = --[[!AUTO_598]]"失敗條件：死亡1次。\r目前：副本第%d層。",
	Args =
	{

	}
}

Ectype.EctypeArgs[2206] =
{
	Name = --[[!AUTO_599]]"副本追蹤",
	Desc = --[[!AUTO_600]]"目標：路見不平拔刀相助，驅逐散播謠言的茶客",
	Args =
	{
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_601]]"這批茶客來路不明，小心戒備",BoardCond = {1}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_602]]"這批茶客來路不明，小心戒備",BoardCond = {3}},
		{ID = 101,Imageid = 10998,Desc = --[[!AUTO_603]]"擊退@鬧事的茶客[target 37.6184,81.3096,-37.3158,monster=68054](%d/3)",BoardCond = {4}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_604]]"窮寇莫追，由他們去",BoardCond = {5}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_605]]"離開副本",BoardCond = {2}},
	}
}


Ectype.EctypeArgs[2207] =
{
	Name = --[[!AUTO_606]]"副本追蹤",
	Desc = --[[!AUTO_607]]"目標：殺人兇手埋伏在路口，快快將他們制服",
	Args =
	{
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_608]]"殺人兇手隱藏在暗處，小心戒備",BoardCond = {1}},
		{ID = 15,Imageid = 10998,Desc = --[[!AUTO_609]]"擊敗@蒙面弓手[target 72.6357,102.868,98.2529,monster=68058](%d/2)",BoardCond = {3}},
		{ID = 16,Imageid = 10998,Desc = --[[!AUTO_610]]"擊敗@神秘刀手[target 71.8241,103.04,93.9529,monster=68057](%d/3)",BoardCond = {3}},
		{ID = 15,Imageid = 10998,Desc = --[[!AUTO_611]]"擊敗@伏擊頭目[target 71.8241,103.04,93.9529,monster=72974](%d/1)",BoardCond = {4}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_612]]"離開副本",BoardCond = {2}},
	}
}


Ectype.EctypeArgs[2208] =
{
	Name = --[[!AUTO_613]]"副本追蹤",
	Desc = --[[!AUTO_614]]"目標：利用遮擋物（十字光圈處）回避敵人視線，潛入賊寨殺死大寨主",
	Args =
	{
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_615]]"聽從曲非煙的安排，準備潛入",BoardCond = {1}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_616]]"躲在@草叢中[pos3 -31.017, 30.763, 165.801]^FFFF00（在此處草叢中不會被敵人看見）",BoardCond = {3}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_617]]"在@草叢中[pos3 -31.017, 30.763, 165.801]，觀摩曲非煙演示如何隱秘地殺死敵人。",BoardCond = {4}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_618]]"躲在@酒桶後[pos3 -50.578, 31.33, 175.984]^FFFF00（在酒桶背後不會被敵人看見）",BoardCond = {5}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_619]]"隱秘地殺死@護巢悍匪[target -67.226, 30.954, 174.161, monster=71855](%SA[201]/1)",BoardCond = {6}, ArgsCond = {104,--[[!AUTO_620]]"=",0}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_621]]"驚動了敵人，只好殺死所有被驚動的護巢悍匪(%CALC[arg(201)+arg(202)]/4)",BoardCond = {6}, ArgsCond = {104,--[[!AUTO_622]]"=",1}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_623]]"躲在@樓梯下[pos3 -73.281, 31.463, 196.981]^FFFF00（在樓梯下不會被敵人看見，但別跳太高）",BoardCond = {7}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_624]]"隱秘地殺死@護巢悍匪[target -66.536, 34.48, 203.798, monster=71855](%SA[201]/1)",BoardCond = {8}, ArgsCond = {104,--[[!AUTO_625]]"=",0}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_626]]"驚動了敵人，只好殺死所有被驚動的護巢悍匪(%SA[202]/4)）",BoardCond = {8}, ArgsCond = {104,--[[!AUTO_627]]"=",1}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_628]]"前往大寨主@藏身之處[pos3 -49.539, 35.412, 209.893]",BoardCond = {9}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_629]]"擊敗@大寨主[target -49.24,35.405,219.88, monster=71856](%SA[202]/1)",BoardCond = {10}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_630]]"取得大寨主存在箱中的@鑰匙[target -48.839, 35.165, 220.772, mine=72057]",BoardCond = {11}}
	}
}


Ectype.EctypeArgs[2209] =
{
	Name = --[[!AUTO_631]]"副本追蹤",
	Desc = --[[!AUTO_632]]"目標：黎人洪的陰謀敗露，是時候行俠仗義除掉此獠了",
	Args =
	{
		{ID = 15,Imageid = 10998,Desc = --[[!AUTO_633]]"擊敗@青城派精英[target -179.97,31.8,-29.32,npc=44897](%d/6)^FFFF00將敵人引到@曲非煙[pos3 -174.351, 31.924, -34.354]處，她會幫助克敵。",BoardCond = {1}},
		{ID = 15,Imageid = 10998,Desc = --[[!AUTO_634]]"除掉@黎人洪[target -189.25,32.1567,-29.48,monster=35833](%d/1)",BoardCond = {3}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_635]]"離開副本",BoardCond = {2}}
	}
}


Ectype.EctypeArgs[2249] =
{
	Name = --[[!AUTO_636]]"副本追蹤",
	Desc = --[[!AUTO_637]]"目標：嵩山伏擊十大門派，阻止此事發生",
	Args =
	{
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_638]]"與@十大門派高手[pos 161,-164]匯合",BoardCond = {1}},
		{ID = 15,Imageid = 10998,Desc = --[[!AUTO_639]]"與各門派高手協力殺退@嵩山死士[pos 161,-164](%d/10)",BoardCond = {2,5}},
		{ID = 16,Imageid = 10998,Desc = --[[!AUTO_640]]"擊敗@陸柏[pos 160,-161](%d/1)",BoardCond = {2,5}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_641]]"離開副本",BoardCond = {4}}
	}
}


Ectype.EctypeArgs[2274] =
{
	Name = --[[!AUTO_642]]"副本追蹤",
	Desc = --[[!AUTO_643]]"目標：黑衣惡徒圍攻妙齡少女，速速阻止他們",
	Args =
	{
		{ID = 15,Imageid = 10998,Desc = --[[!AUTO_644]]"除掉@黑衣惡徒[pos 28,-77](%d/3)",BoardCond = {1}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_645]]"離開副本",BoardCond = {2}}
	}
}


Ectype.EctypeArgs[2275] =
{
	Name = --[[!AUTO_646]]"副本追蹤",
	Desc = --[[!AUTO_647]]"目標：密林中竄出大批劫匪，一定來者不善",
	Args =
	{
		{ID = 15,Imageid = 10998,Desc = --[[!AUTO_648]]"除掉%d名密林劫匪",BoardCond = {1}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_649]]"離開副本",BoardCond = {2}}
	}
}


Ectype.EctypeArgs[2276] =
{
	Name = --[[!AUTO_650]]"副本追蹤",
	Desc = --[[!AUTO_651]]"目標：狂傲劍客在此埋伏，看來要對劉三爺圖謀不軌",
	Args =
	{
		{ID = 15,Imageid = 10998,Desc = --[[!AUTO_652]]"除掉@狂傲劍客[pos -47,170](%d/5)",BoardCond = {1}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_653]]"離開副本",BoardCond = {2}}
	}
}


Ectype.EctypeArgs[2277] =
{
	Name = --[[!AUTO_654]]"副本追蹤",
	Desc = --[[!AUTO_655]]"目標：擒賊擒王，欲制服長鯨幫，必先解決掉聞滄瀾",
	Args =
	{
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_656]]"擊敗@聞滄瀾[pos 128,151]",BoardCond = {1}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_657]]"離開副本",BoardCond = {2}}
	}
}


Ectype.EctypeArgs[2278] =
{
	Name = --[[!AUTO_658]]"副本追蹤",
	Desc = --[[!AUTO_659]]"目標：瘋魔刀手長刀虎虎生風，必先擊敗他們方可前行",
	Args =
	{
		{ID = 15,Imageid = 10998,Desc = --[[!AUTO_660]]"擊敗@瘋魔刀手[pos -30,156](%d/7)",BoardCond = {1}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_661]]"離開副本",BoardCond = {2}}
	}
}


Ectype.EctypeArgs[2279] =
{
	Name = --[[!AUTO_662]]"副本追蹤",
	Desc = --[[!AUTO_663]]"目標：左挺在幕後籌謀陷害武林人士，豈可留他性命",
	Args =
	{
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_664]]"擊殺嵩山派@左挺[pos 67,-44]",BoardCond = {1}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_665]]"離開副本",BoardCond = {2}}
	}
}


Ectype.EctypeArgs[2280] =
{
	Name = --[[!AUTO_666]]"副本追蹤",
	Desc = --[[!AUTO_667]]"目標：嵩山派劉甯假扮刺客，此惡賊不可不除",
	Args =
	{
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_668]]"擊殺嵩山派@劉寧[pos 28,-140]",BoardCond = {1}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_669]]"離開副本",BoardCond = {2}}
	}
}


Ectype.EctypeArgs[2281] =
{
	Name = --[[!AUTO_670]]"副本追蹤",
	Desc = --[[!AUTO_671]]"目標：奸邪之徒鄧飛，今日理應惡貫滿盈",
	Args =
	{
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_672]]"擊殺惡徒@鄧飛[pos 95,53]",BoardCond = {1}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_673]]"離開副本",BoardCond = {2}}
	}
}


Ectype.EctypeArgs[1962] =
{
	Name = --[[!AUTO_674]]"副本追蹤",
	Desc = --[[!AUTO_675]]"目標：探索寶庫",
	Args =
	{
		{ID = 900,Imageid = 10998,Desc = --[[!AUTO_676]]"探索古墓小廳",BoardCond = {1}, ArgsCond = {900,--[[!AUTO_677]]"=",0}},
		{ID = 503,Imageid = 10319,Desc = --[[!AUTO_678]]"百年喪屍: %d/30",BoardCond = {1}, ArgsCond = {900,--[[!AUTO_679]]"=",1}},
		{ID = 517,Imageid = 10998,Desc = --[[!AUTO_680]]"薛道長: %d/1",BoardCond = {1}, ArgsCond = {900,--[[!AUTO_681]]"=",2}},
		{ID = 900,Imageid = 10998,Desc = --[[!AUTO_682]]"探索寶庫大廳",BoardCond = {1}, ArgsCond = {900,--[[!AUTO_683]]"=",13}},
                {ID = 508,Imageid = 10998,Desc = --[[!AUTO_684]]"護寶劍聖: %d/50",BoardCond = {1}, ArgsCond = {900,--[[!AUTO_685]]"=",11}},
                {ID = 521,Imageid = 10998,Desc = --[[!AUTO_686]]"三生三戒: %d/1",BoardCond = {1}, ArgsCond = {900,--[[!AUTO_687]]"=",12}},
                {ID = 900,Imageid = 10998,Desc = --[[!AUTO_688]]"推動石龜，探索其他小廳",BoardCond = {1}, ArgsCond = {900,--[[!AUTO_689]]"=",14}},
                {ID = 504,Imageid = 10998,Desc = --[[!AUTO_690]]"陪葬冤魂: %d/30",BoardCond = {1}, ArgsCond = {900,--[[!AUTO_691]]"=",3}},
                {ID = 523,Imageid = 10998,Desc = --[[!AUTO_692]]"裘藝: %d/1",BoardCond = {1}, ArgsCond = {900,--[[!AUTO_693]]"=",4}},
                {ID = 505,Imageid = 10998,Desc = --[[!AUTO_694]]"邪劍靈: %d/30",BoardCond = {1}, ArgsCond = {900,--[[!AUTO_695]]"=",5}},
                {ID = 518,Imageid = 10998,Desc = --[[!AUTO_696]]"呂人: %d/1",BoardCond = {1}, ArgsCond = {900,--[[!AUTO_697]]"=",6}},
                {ID = 506,Imageid = 10998,Desc = --[[!AUTO_698]]"護寶劍靈: %d/30",BoardCond = {1}, ArgsCond = {900,--[[!AUTO_699]]"=",7}},
                {ID = 519,Imageid = 10998,Desc = --[[!AUTO_700]]"張狂: %d/1",BoardCond = {1}, ArgsCond = {900,--[[!AUTO_701]]"=",8}},
                {ID = 507,Imageid = 10998,Desc = --[[!AUTO_702]]"長明燈魄: %d/30",BoardCond = {1}, ArgsCond = {900,--[[!AUTO_703]]"=",9}},
                {ID = 520,Imageid = 10998,Desc = --[[!AUTO_704]]"司馬白玉: %d/1",BoardCond = {1}, ArgsCond = {900,--[[!AUTO_705]]"=",10}},
		{ID = 900,Imageid = 10998,Desc = --[[!AUTO_706]]"30秒內尋找並開啟古墓機關",BoardCond = {1}, ArgsCond = {900,--[[!AUTO_707]]"=",15}},
                {ID = 502,Imageid = 10998,Desc = --[[!AUTO_708]]"古墓機關: %d/5",BoardCond = {1}, ArgsCond = {900,--[[!AUTO_709]]"=",15}},
		{ID = 900,Imageid = 10998,Desc = --[[!AUTO_710]]"尋找並開啟泉水靈石",BoardCond = {1}, ArgsCond = {900,--[[!AUTO_711]]"=",16}},
		{ID = 509,Imageid = 10998,Desc = --[[!AUTO_712]]"泉水靈石: %d/5",BoardCond = {1}, ArgsCond = {900,--[[!AUTO_713]]"=",16}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_714]]"在寶庫大廳推動石龜，探索古墓小廳",BoardCond = {1}, ArgsCond = {900,--[[!AUTO_715]]"=",17}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_716]]"在寶庫大廳推動石龜，探索泉水小廳",BoardCond = {1}, ArgsCond = {900,--[[!AUTO_717]]"=",18}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_718]]"在寶庫大廳推動石龜，探索劍塚小廳",BoardCond = {1}, ArgsCond = {900,--[[!AUTO_719]]"=",19}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_720]]"在寶庫大廳推動石龜，探索荒山小廳",BoardCond = {1}, ArgsCond = {900,--[[!AUTO_721]]"=",20}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_722]]"在寶庫大廳推動石龜，探索熔岩小廳",BoardCond = {1}, ArgsCond = {900,--[[!AUTO_723]]"=",21}},
                {ID = 0,Imageid = 10998,Desc = --[[!AUTO_724]]"寶庫探索完畢",BoardCond = {1}, ArgsCond = {900,--[[!AUTO_725]]"=",22}}
	}
}

Ectype.EctypeArgs[1963] =
{
	Name = --[[!AUTO_726]]"副本追蹤",
	Desc = --[[!AUTO_727]]"目標：探索寶庫",
	Args =
	{
		{ID = 900,Imageid = 10998,Desc = --[[!AUTO_728]]"探索泉水小廳",BoardCond = {1}, ArgsCond = {900,--[[!AUTO_729]]"=",0}},
		{ID = 504,Imageid = 10319,Desc = --[[!AUTO_730]]"陪葬冤魂: %d/30",BoardCond = {1}, ArgsCond = {900,--[[!AUTO_731]]"=",3}},
		{ID = 523,Imageid = 10998,Desc = --[[!AUTO_732]]"裘藝: %d/1",BoardCond = {1}, ArgsCond = {900,--[[!AUTO_733]]"=",4}},
		{ID = 900,Imageid = 10998,Desc = --[[!AUTO_734]]"探索寶庫大廳",BoardCond = {1}, ArgsCond = {900,--[[!AUTO_735]]"=",13}},
                {ID = 508,Imageid = 10998,Desc = --[[!AUTO_736]]"護寶劍聖: %d/50",BoardCond = {1}, ArgsCond = {900,--[[!AUTO_737]]"=",11}},
                {ID = 521,Imageid = 10998,Desc = --[[!AUTO_738]]"三生三戒: %d/1",BoardCond = {1}, ArgsCond = {900,--[[!AUTO_739]]"=",12}},
                {ID = 900,Imageid = 10998,Desc = --[[!AUTO_740]]"推動石龜，探索其他小廳",BoardCond = {1}, ArgsCond = {900,--[[!AUTO_741]]"=",14}},
                {ID = 503,Imageid = 10998,Desc = --[[!AUTO_742]]"百年喪屍: %d/30",BoardCond = {1}, ArgsCond = {900,--[[!AUTO_743]]"=",1}},
                {ID = 517,Imageid = 10998,Desc = --[[!AUTO_744]]"薛道長: %d/1",BoardCond = {1}, ArgsCond = {900,--[[!AUTO_745]]"=",2}},
                {ID = 505,Imageid = 10998,Desc = --[[!AUTO_746]]"邪劍靈: %d/30",BoardCond = {1}, ArgsCond = {900,--[[!AUTO_747]]"=",5}},
                {ID = 518,Imageid = 10998,Desc = --[[!AUTO_748]]"呂人: %d/1",BoardCond = {1}, ArgsCond = {900,--[[!AUTO_749]]"=",6}},
                {ID = 506,Imageid = 10998,Desc = --[[!AUTO_750]]"護寶劍靈: %d/30",BoardCond = {1}, ArgsCond = {900,--[[!AUTO_751]]"=",7}},
                {ID = 519,Imageid = 10998,Desc = --[[!AUTO_752]]"張狂: %d/1",BoardCond = {1}, ArgsCond = {900,--[[!AUTO_753]]"=",8}},
                {ID = 507,Imageid = 10998,Desc = --[[!AUTO_754]]"長明燈魄: %d/30",BoardCond = {1}, ArgsCond = {900,--[[!AUTO_755]]"=",9}},
                {ID = 520,Imageid = 10998,Desc = --[[!AUTO_756]]"司馬白玉: %d/1",BoardCond = {1}, ArgsCond = {900,--[[!AUTO_757]]"=",10}},
		{ID = 900,Imageid = 10998,Desc = --[[!AUTO_758]]"30秒內尋找並開啟古墓機關",BoardCond = {1}, ArgsCond = {900,--[[!AUTO_759]]"=",15}},
                {ID = 502,Imageid = 10998,Desc = --[[!AUTO_760]]"古墓機關: %d/5",BoardCond = {1}, ArgsCond = {900,--[[!AUTO_761]]"=",15}},
		{ID = 900,Imageid = 10998,Desc = --[[!AUTO_762]]"尋找並開啟泉水靈石",BoardCond = {1}, ArgsCond = {900,--[[!AUTO_763]]"=",16}},
		{ID = 509,Imageid = 10998,Desc = --[[!AUTO_764]]"泉水靈石: %d/5",BoardCond = {1}, ArgsCond = {900,--[[!AUTO_765]]"=",16}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_766]]"在寶庫大廳推動石龜，探索古墓小廳",BoardCond = {1}, ArgsCond = {900,--[[!AUTO_767]]"=",17}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_768]]"在寶庫大廳推動石龜，探索泉水小廳",BoardCond = {1}, ArgsCond = {900,--[[!AUTO_769]]"=",18}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_770]]"在寶庫大廳推動石龜，探索劍塚小廳",BoardCond = {1}, ArgsCond = {900,--[[!AUTO_771]]"=",19}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_772]]"在寶庫大廳推動石龜，探索荒山小廳",BoardCond = {1}, ArgsCond = {900,--[[!AUTO_773]]"=",20}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_774]]"在寶庫大廳推動石龜，探索熔岩小廳",BoardCond = {1}, ArgsCond = {900,--[[!AUTO_775]]"=",21}},
                {ID = 0,Imageid = 10998,Desc = --[[!AUTO_776]]"寶庫探索完畢",BoardCond = {1}, ArgsCond = {900,--[[!AUTO_777]]"=",22}}
	}
}

Ectype.EctypeArgs[1964] =
{
	Name = --[[!AUTO_778]]"副本追蹤",
	Desc = --[[!AUTO_779]]"目標：探索寶庫",
	Args =
	{
		{ID = 900,Imageid = 10998,Desc = --[[!AUTO_780]]"探索劍塚小廳",BoardCond = {1}, ArgsCond = {900,--[[!AUTO_781]]"=",0}},
		{ID = 505,Imageid = 10319,Desc = --[[!AUTO_782]]"邪劍靈: %d/30",BoardCond = {1}, ArgsCond = {900,--[[!AUTO_783]]"=",5}},
		{ID = 518,Imageid = 10998,Desc = --[[!AUTO_784]]"呂人: %d/1",BoardCond = {1}, ArgsCond = {900,--[[!AUTO_785]]"=",6}},
		{ID = 900,Imageid = 10998,Desc = --[[!AUTO_786]]"探索寶庫大廳",BoardCond = {1}, ArgsCond = {900,--[[!AUTO_787]]"=",13}},
                {ID = 508,Imageid = 10998,Desc = --[[!AUTO_788]]"護寶劍聖: %d/50",BoardCond = {1}, ArgsCond = {900,--[[!AUTO_789]]"=",11}},
                {ID = 521,Imageid = 10998,Desc = --[[!AUTO_790]]"三生三戒: %d/1",BoardCond = {1}, ArgsCond = {900,--[[!AUTO_791]]"=",12}},
                {ID = 900,Imageid = 10998,Desc = --[[!AUTO_792]]"推動石龜，探索其他小廳",BoardCond = {1}, ArgsCond = {900,--[[!AUTO_793]]"=",14}},
                {ID = 503,Imageid = 10998,Desc = --[[!AUTO_794]]"百年喪屍: %d/30",BoardCond = {1}, ArgsCond = {900,--[[!AUTO_795]]"=",1}},
                {ID = 517,Imageid = 10998,Desc = --[[!AUTO_796]]"薛道長: %d/1",BoardCond = {1}, ArgsCond = {900,--[[!AUTO_797]]"=",2}},
                {ID = 504,Imageid = 10998,Desc = --[[!AUTO_798]]"陪葬冤魂: %d/30",BoardCond = {1}, ArgsCond = {900,--[[!AUTO_799]]"=",3}},
                {ID = 523,Imageid = 10998,Desc = --[[!AUTO_800]]"裘藝: %d/1",BoardCond = {1}, ArgsCond = {900,--[[!AUTO_801]]"=",4}},
                {ID = 506,Imageid = 10998,Desc = --[[!AUTO_802]]"護寶劍靈: %d/30",BoardCond = {1}, ArgsCond = {900,--[[!AUTO_803]]"=",7}},
                {ID = 519,Imageid = 10998,Desc = --[[!AUTO_804]]"張狂: %d/1",BoardCond = {1}, ArgsCond = {900,--[[!AUTO_805]]"=",8}},
                {ID = 507,Imageid = 10998,Desc = --[[!AUTO_806]]"長明燈魄: %d/30",BoardCond = {1}, ArgsCond = {900,--[[!AUTO_807]]"=",9}},
                {ID = 520,Imageid = 10998,Desc = --[[!AUTO_808]]"司馬白玉: %d/1",BoardCond = {1}, ArgsCond = {900,--[[!AUTO_809]]"=",10}},
		{ID = 900,Imageid = 10998,Desc = --[[!AUTO_810]]"30秒內尋找並開啟古墓機關",BoardCond = {1}, ArgsCond = {900,--[[!AUTO_811]]"=",15}},
                {ID = 502,Imageid = 10998,Desc = --[[!AUTO_812]]"古墓機關: %d/5",BoardCond = {1}, ArgsCond = {900,--[[!AUTO_813]]"=",15}},
		{ID = 900,Imageid = 10998,Desc = --[[!AUTO_814]]"尋找並開啟泉水靈石",BoardCond = {1}, ArgsCond = {900,--[[!AUTO_815]]"=",16}},
		{ID = 509,Imageid = 10998,Desc = --[[!AUTO_816]]"泉水靈石: %d/5",BoardCond = {1}, ArgsCond = {900,--[[!AUTO_817]]"=",16}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_818]]"在寶庫大廳推動石龜，探索古墓小廳",BoardCond = {1}, ArgsCond = {900,--[[!AUTO_819]]"=",17}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_820]]"在寶庫大廳推動石龜，探索泉水小廳",BoardCond = {1}, ArgsCond = {900,--[[!AUTO_821]]"=",18}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_822]]"在寶庫大廳推動石龜，探索劍塚小廳",BoardCond = {1}, ArgsCond = {900,--[[!AUTO_823]]"=",19}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_824]]"在寶庫大廳推動石龜，探索荒山小廳",BoardCond = {1}, ArgsCond = {900,--[[!AUTO_825]]"=",20}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_826]]"在寶庫大廳推動石龜，探索熔岩小廳",BoardCond = {1}, ArgsCond = {900,--[[!AUTO_827]]"=",21}},
                {ID = 0,Imageid = 10998,Desc = --[[!AUTO_828]]"寶庫探索完畢",BoardCond = {1}, ArgsCond = {900,--[[!AUTO_829]]"=",22}}
	}
}

Ectype.EctypeArgs[1965] =
{
	Name = --[[!AUTO_830]]"副本追蹤",
	Desc = --[[!AUTO_831]]"目標：探索寶庫",
	Args =
	{
		{ID = 900,Imageid = 10998,Desc = --[[!AUTO_832]]"探索荒山小廳",BoardCond = {1}, ArgsCond = {900,--[[!AUTO_833]]"=",0}},
		{ID = 506,Imageid = 10319,Desc = --[[!AUTO_834]]"護寶劍靈: %d/30",BoardCond = {1}, ArgsCond = {900,--[[!AUTO_835]]"=",7}},
		{ID = 519,Imageid = 10998,Desc = --[[!AUTO_836]]"張狂: %d/1",BoardCond = {1}, ArgsCond = {900,--[[!AUTO_837]]"=",8}},
		{ID = 900,Imageid = 10998,Desc = --[[!AUTO_838]]"探索寶庫大廳",BoardCond = {1}, ArgsCond = {900,--[[!AUTO_839]]"=",13}},
                {ID = 508,Imageid = 10998,Desc = --[[!AUTO_840]]"護寶劍聖: %d/50",BoardCond = {1}, ArgsCond = {900,--[[!AUTO_841]]"=",11}},
                {ID = 521,Imageid = 10998,Desc = --[[!AUTO_842]]"三生三戒: %d/1",BoardCond = {1}, ArgsCond = {900,--[[!AUTO_843]]"=",12}},
                {ID = 900,Imageid = 10998,Desc = --[[!AUTO_844]]"推動石龜，探索其他小廳",BoardCond = {1}, ArgsCond = {900,--[[!AUTO_845]]"=",14}},
                {ID = 503,Imageid = 10998,Desc = --[[!AUTO_846]]"百年喪屍: %d/30",BoardCond = {1}, ArgsCond = {900,--[[!AUTO_847]]"=",1}},
                {ID = 517,Imageid = 10998,Desc = --[[!AUTO_848]]"薛道長: %d/1",BoardCond = {1}, ArgsCond = {900,--[[!AUTO_849]]"=",2}},
                {ID = 504,Imageid = 10998,Desc = --[[!AUTO_850]]"陪葬冤魂: %d/30",BoardCond = {1}, ArgsCond = {900,--[[!AUTO_851]]"=",3}},
                {ID = 523,Imageid = 10998,Desc = --[[!AUTO_852]]"裘藝: %d/1",BoardCond = {1}, ArgsCond = {900,--[[!AUTO_853]]"=",4}},
                {ID = 506,Imageid = 10998,Desc = --[[!AUTO_854]]"邪劍靈: %d/30",BoardCond = {1}, ArgsCond = {900,--[[!AUTO_855]]"=",5}},
                {ID = 518,Imageid = 10998,Desc = --[[!AUTO_856]]"呂人: %d/1",BoardCond = {1}, ArgsCond = {900,--[[!AUTO_857]]"=",6}},
                {ID = 507,Imageid = 10998,Desc = --[[!AUTO_858]]"長明燈魄: %d/30",BoardCond = {1}, ArgsCond = {900,--[[!AUTO_859]]"=",7}},
                {ID = 520,Imageid = 10998,Desc = --[[!AUTO_860]]"司馬白玉: %d/1",BoardCond = {1}, ArgsCond = {900,--[[!AUTO_861]]"=",8}},
		{ID = 900,Imageid = 10998,Desc = --[[!AUTO_862]]"30秒內尋找並開啟古墓機關",BoardCond = {1}, ArgsCond = {900,--[[!AUTO_863]]"=",15}},
                {ID = 502,Imageid = 10998,Desc = --[[!AUTO_864]]"古墓機關: %d/5",BoardCond = {1}, ArgsCond = {900,--[[!AUTO_865]]"=",15}},
		{ID = 900,Imageid = 10998,Desc = --[[!AUTO_866]]"尋找並開啟泉水靈石",BoardCond = {1}, ArgsCond = {900,--[[!AUTO_867]]"=",16}},
		{ID = 509,Imageid = 10998,Desc = --[[!AUTO_868]]"泉水靈石: %d/5",BoardCond = {1}, ArgsCond = {900,--[[!AUTO_869]]"=",16}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_870]]"在寶庫大廳推動石龜，探索古墓小廳",BoardCond = {1}, ArgsCond = {900,--[[!AUTO_871]]"=",17}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_872]]"在寶庫大廳推動石龜，探索泉水小廳",BoardCond = {1}, ArgsCond = {900,--[[!AUTO_873]]"=",18}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_874]]"在寶庫大廳推動石龜，探索劍塚小廳",BoardCond = {1}, ArgsCond = {900,--[[!AUTO_875]]"=",19}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_876]]"在寶庫大廳推動石龜，探索荒山小廳",BoardCond = {1}, ArgsCond = {900,--[[!AUTO_877]]"=",20}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_878]]"在寶庫大廳推動石龜，探索熔岩小廳",BoardCond = {1}, ArgsCond = {900,--[[!AUTO_879]]"=",21}},
                {ID = 0,Imageid = 10998,Desc = --[[!AUTO_880]]"寶庫探索完畢",BoardCond = {1}, ArgsCond = {900,--[[!AUTO_881]]"=",22}}

	}
}

Ectype.EctypeArgs[1966] =
{
	Name = --[[!AUTO_882]]"副本追蹤",
	Desc = --[[!AUTO_883]]"目標：探索寶庫",
	Args =
	{
		{ID = 900,Imageid = 10998,Desc = --[[!AUTO_884]]"探索熔岩小廳",BoardCond = {1}, ArgsCond = {900,--[[!AUTO_885]]"=",0}},
		{ID = 507,Imageid = 10319,Desc = --[[!AUTO_886]]"長明燈魄: %d/30",BoardCond = {1}, ArgsCond = {900,--[[!AUTO_887]]"=",9}},
		{ID = 520,Imageid = 10998,Desc = --[[!AUTO_888]]"司馬白玉: %d/1",BoardCond = {1}, ArgsCond = {900,--[[!AUTO_889]]"=",10}},
		{ID = 900,Imageid = 10998,Desc = --[[!AUTO_890]]"探索寶庫大廳",BoardCond = {1}, ArgsCond = {900,--[[!AUTO_891]]"=",13}},
                {ID = 508,Imageid = 10998,Desc = --[[!AUTO_892]]"護寶劍聖: %d/50",BoardCond = {1}, ArgsCond = {900,--[[!AUTO_893]]"=",11}},
                {ID = 521,Imageid = 10998,Desc = --[[!AUTO_894]]"三生三戒: %d/1",BoardCond = {1}, ArgsCond = {900,--[[!AUTO_895]]"=",12}},
                {ID = 900,Imageid = 10998,Desc = --[[!AUTO_896]]"推動石龜，探索其他小廳",BoardCond = {1}, ArgsCond = {900,--[[!AUTO_897]]"=",14}},
                {ID = 503,Imageid = 10998,Desc = --[[!AUTO_898]]"百年喪屍: %d/30",BoardCond = {1}, ArgsCond = {900,--[[!AUTO_899]]"=",1}},
                {ID = 517,Imageid = 10998,Desc = --[[!AUTO_900]]"薛道長: %d/1",BoardCond = {1}, ArgsCond = {900,--[[!AUTO_901]]"=",2}},
                {ID = 504,Imageid = 10998,Desc = --[[!AUTO_902]]"陪葬冤魂: %d/30",BoardCond = {1}, ArgsCond = {900,--[[!AUTO_903]]"=",3}},
                {ID = 523,Imageid = 10998,Desc = --[[!AUTO_904]]"裘藝: %d/1",BoardCond = {1}, ArgsCond = {900,--[[!AUTO_905]]"=",4}},
                {ID = 505,Imageid = 10998,Desc = --[[!AUTO_906]]"邪劍靈: %d/30",BoardCond = {1}, ArgsCond = {900,--[[!AUTO_907]]"=",5}},
                {ID = 518,Imageid = 10998,Desc = --[[!AUTO_908]]"呂人: %d/1",BoardCond = {1}, ArgsCond = {900,--[[!AUTO_909]]"=",6}},
                {ID = 506,Imageid = 10998,Desc = --[[!AUTO_910]]"護寶劍靈: %d/30",BoardCond = {1}, ArgsCond = {900,--[[!AUTO_911]]"=",7}},
                {ID = 519,Imageid = 10998,Desc = --[[!AUTO_912]]"張狂: %d/1",BoardCond = {1}, ArgsCond = {900,--[[!AUTO_913]]"=",8}},
		{ID = 900,Imageid = 10998,Desc = --[[!AUTO_914]]"30秒內尋找並開啟古墓機關",BoardCond = {1}, ArgsCond = {900,--[[!AUTO_915]]"=",15}},
                {ID = 502,Imageid = 10998,Desc = --[[!AUTO_916]]"古墓機關: %d/5",BoardCond = {1}, ArgsCond = {900,--[[!AUTO_917]]"=",15}},
		{ID = 900,Imageid = 10998,Desc = --[[!AUTO_918]]"尋找並開啟泉水靈石",BoardCond = {1}, ArgsCond = {900,--[[!AUTO_919]]"=",16}},
		{ID = 509,Imageid = 10998,Desc = --[[!AUTO_920]]"泉水靈石: %d/5",BoardCond = {1}, ArgsCond = {900,--[[!AUTO_921]]"=",16}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_922]]"在寶庫大廳推動石龜，探索古墓小廳",BoardCond = {1}, ArgsCond = {900,--[[!AUTO_923]]"=",17}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_924]]"在寶庫大廳推動石龜，探索泉水小廳",BoardCond = {1}, ArgsCond = {900,--[[!AUTO_925]]"=",18}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_926]]"在寶庫大廳推動石龜，探索劍塚小廳",BoardCond = {1}, ArgsCond = {900,--[[!AUTO_927]]"=",19}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_928]]"在寶庫大廳推動石龜，探索荒山小廳",BoardCond = {1}, ArgsCond = {900,--[[!AUTO_929]]"=",20}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_930]]"在寶庫大廳推動石龜，探索熔岩小廳",BoardCond = {1}, ArgsCond = {900,--[[!AUTO_931]]"=",21}},
                {ID = 0,Imageid = 10998,Desc = --[[!AUTO_932]]"寶庫探索完畢",BoardCond = {1}, ArgsCond = {900,--[[!AUTO_933]]"=",22}}
	}
}

Ectype.EctypeArgs[1247] =
{
	Name = --[[!AUTO_934]]"活動追蹤",
	Desc = --[[!AUTO_935]]"目標：防守鏢局",
	Args =
	{
		{ID = 910,Imageid = 10998,Desc = --[[!AUTO_936]]"敵人進攻鏢局廣場，準備迎敵",BoardCond = {1}, ArgsCond = {910,--[[!AUTO_937]]"=",1}},
		{ID = 910,Imageid = 10319,Desc = --[[!AUTO_938]]"第一波敵兵開始攻擊",BoardCond = {1}, ArgsCond = {910,--[[!AUTO_939]]"=",2}},
		{ID = 910,Imageid = 10998,Desc = --[[!AUTO_940]]"第二波敵兵開始攻擊",BoardCond = {1}, ArgsCond = {910,--[[!AUTO_941]]"=",3}},
		{ID = 910,Imageid = 10998,Desc = --[[!AUTO_942]]"第三波敵兵開始攻擊",BoardCond = {1}, ArgsCond = {910,--[[!AUTO_943]]"=",4}},
        {ID = 910,Imageid = 10998,Desc = --[[!AUTO_944]]"第四波敵兵開始攻擊",BoardCond = {1}, ArgsCond = {910,--[[!AUTO_945]]"=",5}},
        {ID = 910,Imageid = 10998,Desc = --[[!AUTO_946]]"第五波敵兵開始攻擊",BoardCond = {1}, ArgsCond = {910,--[[!AUTO_947]]"=",6}},
        {ID = 910,Imageid = 10998,Desc = --[[!AUTO_948]]"第六波敵兵開始攻擊",BoardCond = {1}, ArgsCond = {910,--[[!AUTO_949]]"=",7}},
        {ID = 910,Imageid = 10998,Desc = --[[!AUTO_950]]"敵人頭目開始攻擊，廣場附近有暗器堆",BoardCond = {1}, ArgsCond = {910,--[[!AUTO_951]]"=",8}},
        {ID = 910,Imageid = 10998,Desc = --[[!AUTO_952]]"防守鏢局結束",BoardCond = {1}, ArgsCond = {910,--[[!AUTO_953]]"=",9}},
        {ID = 501,Imageid = 10998,Desc = --[[!AUTO_954]]"基地防禦度: %d/100",BoardCond = {1}, ArgsCond = {911,--[[!AUTO_955]]"=",1}}
	}
}

Ectype.EctypeArgs[1248] =
{
	Name = --[[!AUTO_956]]"活動追蹤",
	Desc = --[[!AUTO_957]]"目標：防守山寨",
	Args =
	{
		{ID = 910,Imageid = 10998,Desc = --[[!AUTO_958]]"敵人進攻山寨廣場，準備迎敵",BoardCond = {1}, ArgsCond = {910,--[[!AUTO_959]]"=",1}},
		{ID = 910,Imageid = 10319,Desc = --[[!AUTO_960]]"第一波敵兵開始攻擊",BoardCond = {1}, ArgsCond = {910,--[[!AUTO_961]]"=",2}},
		{ID = 910,Imageid = 10998,Desc = --[[!AUTO_962]]"第二波敵兵開始攻擊",BoardCond = {1}, ArgsCond = {910,--[[!AUTO_963]]"=",3}},
		{ID = 910,Imageid = 10998,Desc = --[[!AUTO_964]]"第三波敵兵開始攻擊",BoardCond = {1}, ArgsCond = {910,--[[!AUTO_965]]"=",4}},
        {ID = 910,Imageid = 10998,Desc = --[[!AUTO_966]]"第四波敵兵開始攻擊",BoardCond = {1}, ArgsCond = {910,--[[!AUTO_967]]"=",5}},
        {ID = 910,Imageid = 10998,Desc = --[[!AUTO_968]]"第五波敵兵開始攻擊",BoardCond = {1}, ArgsCond = {910,--[[!AUTO_969]]"=",6}},
        {ID = 910,Imageid = 10998,Desc = --[[!AUTO_970]]"第六波敵兵開始攻擊",BoardCond = {1}, ArgsCond = {910,--[[!AUTO_971]]"=",7}},
        {ID = 910,Imageid = 10998,Desc = --[[!AUTO_972]]"敵人頭目開始攻擊，廣場附近有暗器堆",BoardCond = {1}, ArgsCond = {910,--[[!AUTO_973]]"=",8}},
        {ID = 910,Imageid = 10998,Desc = --[[!AUTO_974]]"防守鏢局結束",BoardCond = {1}, ArgsCond = {910,--[[!AUTO_975]]"=",9}},
        {ID = 501,Imageid = 10998,Desc = --[[!AUTO_976]]"基地防禦度: %d/100",BoardCond = {1}, ArgsCond = {911,--[[!AUTO_977]]"=",1}}
	}
}

Ectype.EctypeArgs[1250] =
{
	Name = "活動追蹤",
	Desc = "目標：防守工坊",
	Args =
	{
		{ID = 910,Imageid = 10998,Desc = "敵人進攻工坊廣場，準備迎敵",BoardCond = {1}, ArgsCond = {910,"=",1}},
		{ID = 910,Imageid = 10319,Desc = "第一波敵兵開始攻擊",BoardCond = {1}, ArgsCond = {910,"=",2}},
		{ID = 910,Imageid = 10998,Desc = "第二波敵兵開始攻擊",BoardCond = {1}, ArgsCond = {910,"=",3}},
		{ID = 910,Imageid = 10998,Desc = "第三波敵兵開始攻擊",BoardCond = {1}, ArgsCond = {910,"=",4}},
        {ID = 910,Imageid = 10998,Desc = "第四波敵兵開始攻擊",BoardCond = {1}, ArgsCond = {910,"=",5}},
        {ID = 910,Imageid = 10998,Desc = "第五波敵兵開始攻擊",BoardCond = {1}, ArgsCond = {910,"=",6}},
        {ID = 910,Imageid = 10998,Desc = "第六波敵兵開始攻擊",BoardCond = {1}, ArgsCond = {910,"=",7}},
        {ID = 910,Imageid = 10998,Desc = "敵人頭目開始攻擊，廣場附近有暗器堆",BoardCond = {1}, ArgsCond = {910,"=",8}},
        {ID = 910,Imageid = 10998,Desc = "防守工坊結束",BoardCond = {1}, ArgsCond = {910,"=",9}},
        {ID = 501,Imageid = 10998,Desc = "基地防禦度: %d/100",BoardCond = {1}, ArgsCond = {911,"=",1}}
	}
}

Ectype.EctypeArgs[2014] =
{
	Name = --[[!AUTO_978]]"副本追蹤",
	Desc = --[[!AUTO_979]]"目標：美酒醉人，夢回三十年前衡山城",
	Args =
	{
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_980]]"在三十年前的衡山街巷中找到@風清揚[pos -19,-21]",BoardCond = {9}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_981]]"偶遇佳麗",BoardCond = {8}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_982]]"雨中撐傘共行",BoardCond = {3}},
		{ID = 15,Imageid = 10998,Desc = --[[!AUTO_983]]"擊敗@登徒浪子[pos 23,-48](%d/6)",BoardCond = {5}},
		{ID = 16,Imageid = 10998,Desc = --[[!AUTO_984]]"擊敗@孫公子[pos 19,-47](%d/1)",BoardCond = {5}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_985]]"與世叔相認",BoardCond = {7}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_986]]"離開副本",BoardCond = {2}}
	}
}


Ectype.EctypeArgs[2465] =    --镖局血案
{
	Name = --[[!AUTO_987]]"副本追蹤",
	Desc = --[[!AUTO_988]]"目標：保護福威鏢局中的友方",
	Args =
	{
		{ID = 0,Imageid = 1793,Desc = --[[!AUTO_989]]"打聽鏢師的談話",BoardCond = {1}},
		{ID = 0,Imageid = 1945,Desc = --[[!AUTO_990]]"進入鏢局查看情況",BoardCond = {3}},
		{ID = 0,Imageid = 1380,Desc = --[[!AUTO_991]]"擊敗鏢局內的刺客",BoardCond = {4}},
		{ID = 0,Imageid = 1945,Desc = --[[!AUTO_992]]"向鏢局正堂集合",BoardCond = {5}},
		{ID = 0,Imageid = 10270,Desc = --[[!AUTO_993]]"擊敗鏢局剩下的殺手",BoardCond = {6}},
		{ID = 0,Imageid = 1783,Desc = --[[!AUTO_994]]"論功行賞",BoardCond = {2}},
		{ID = 902,Imageid = 1794,Desc = --[[!AUTO_995]]"存活的鏢師(%d/10)",BoardCond = {3,4,5,6,2}}
	}
}


Ectype.EctypeArgs[2467] =
{
	Name = --[[!AUTO_996]]"副本追蹤",
	Desc = --[[!AUTO_997]]"目標：擊敗暗算傷人的湯英鶚",
	Args =
	{
		{ID = 15,Imageid = 10998,Desc = --[[!AUTO_998]]"擊敗@湯英鶚[target 103.187,105.976,172.069,monster=55734](%d/1)",BoardCond = {1}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_999]]"離開副本",BoardCond = {2}}
	}
}


Ectype.EctypeArgs[2466] =
{
	Name = --[[!AUTO_1000]]"副本追蹤",
	Desc = --[[!AUTO_1001]]"目標：丁勉狗賊攜眾來襲，擊敗此賊",
	Args =
	{
		{ID = 15,Imageid = 10998,Desc = --[[!AUTO_1002]]"在連天峰大佛前擊敗@湯英鶚[target -265.159,187.413,158.234,monster=55742](%d/1)",BoardCond = {1}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1003]]"離開副本",BoardCond = {2}}
	}
}


Ectype.EctypeArgs[2481] =
{
	Name = --[[!AUTO_1004]]"副本追蹤",
	Desc = --[[!AUTO_1005]]"與華山派聯手抗敵",
	Args =
	{
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1007]]"擊敗@蒙面人[target -20.013,30.565,69.667,monster=55708](%SA[201]/7)",BoardCond = {3}},
	}
}


Ectype.EctypeArgs[2482] =
{
	Name = --[[!AUTO_1016]]"副本追蹤",
	Desc = --[[!AUTO_1017]]"目標：殺死瘋狂的林當歸，終結僵屍的噩夢",
	Args =
	{
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1018]]"擊敗@林當歸[pos 159,-37]",BoardCond = {1}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1019]]"離開副本",BoardCond = {2}}
	}
}

Ectype.EctypeArgs[2479] =
{
	Name = --[[!AUTO_1020]]"副本追蹤",
	Desc = --[[!AUTO_1021]]"目標：打敗妖女林忍冬",
	Args =
	{
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1022]]"打敗妖女@林忍冬[target 207.207, 25.112, -207.831, monster=57326]",BoardCond = {1}},
	}
}

Ectype.EctypeArgs[2480] =
{
	Name = --[[!AUTO_1023]]"副本追蹤",
	Desc = --[[!AUTO_1024]]"目標：繪聲繪色的講述你學成菊花寶典神功、打敗東方五人眾的故事",
	Args =
	{
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1025]]"打敗@東方必敗[target  130.41,9.97,150.932,monster=55702],@東方可能敗[target 128.09,9.89,146.739,monster=55703],@東方不可能敗[target 139.02,10,154.556,monster=55705],@東方可能不敗[target 140.92,10.01,159.716,monster=55704],@東方不敗[target 131.27,12.42,160.932,monster=55701]",BoardCond = {3}},
		--{ID = 0,Imageid = 10998,Desc = "提示：击碎四周的^FFFF00蘑菇^FFFFFF可获得气血补充！",BoardCond = {3}} ,
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1026]]"離開副本",BoardCond = {2}}
	}
}


Ectype.EctypeArgs[2484] =
{
	Name = --[[!AUTO_1027]]"副本追蹤",
	Desc = --[[!AUTO_1028]]"目標：按照師兄陸大有的指導，完成華山派門派訓練",
	Args =
	{
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1029]]"聽@陸大有[pos3 -4.684, 55.605, 21.171]介紹“神行”",BoardCond = {1}, ArgsCond = {105,--[[!AUTO_1030]]"<",3}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1031]]"做好準備，然後@上前[pos3 2.384, 55.547, 17.495]與猴子二毛練習加速跑",BoardCond = {1}, ArgsCond = {105,--[[!AUTO_1032]]"=",3}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1033]]"移動時按V鍵啟動神行，追上猴子二毛到達@終點[pos3 1.239, 56.687, -26.725]",BoardCond = {5}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1034]]"聽@陸大有[pos3 1.239, 56.687, -26.725]介紹“閃避”",BoardCond = {6}, ArgsCond = {107,--[[!AUTO_1035]]"=",0}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1036]]"找@猴子大毛[pos3 4.864, 56.261, -25.996]練習“閃避”。",BoardCond = {6}, ArgsCond = {107, --[[!AUTO_1037]]"=",1}},
 		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1038]]"按兩下WASD鍵練習@閃避[pos3 4.864, 56.261, -25.996]，躲開大毛扔出的爛桃子",BoardCond = {7}, ArgsCond = {107,--[[!AUTO_1039]]"=",1}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1040]]"聽@陸大有[pos3 1.239, 56.687, -26.725]介紹後續訓練。",BoardCond = {7}, ArgsCond = {107,--[[!AUTO_1041]]"=",2}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1042]]"聽@陸大有[pos3 1.239, 56.687, -26.725]介紹後續訓練。",BoardCond = {8}},
		{ID = 106,Imageid = 10998,Desc = --[[!AUTO_1043]]"@戰勝群猴[target 5,55,-24,monster=57367](%d/9)。^FFFF00按~鍵^FFFFFF近身攻擊多個敵人，^FFFF00按4鍵^FFFFFF摔投單個敵人。",BoardCond = {4}},
		{ID = 106,Imageid = 10998,Desc = --[[!AUTO_1044]]"@戰勝群猴[target 5,55,-24,monster=66922](%d/9)。^FFFF00按Q鍵或2鍵^FFFFFF攻擊出破綻(閃紅色)的敵人可將其擊倒。2鍵技能可跳空釋放。",BoardCond = {9}},
		{ID = 106,Imageid = 10998,Desc = --[[!AUTO_1045]]"@戰勝群猴[target 5,55,-24,monster=57367](%d/9)。^FFFF00連打3鍵並移動^FFFFFF可移動攻擊多人；^FFFF00連打1鍵^FFFFFF近身攻擊多個敵人。",BoardCond = {3}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1046]]"@離開[pos3 0.885732, 57.0207, -50.3188]訓練場地",BoardCond = {10}}
	}
}


Ectype.EctypeArgs[2477] =
{
	Name = --[[!AUTO_1047]]"副本追蹤",
	Desc = --[[!AUTO_1048]]"目標：接受東方姑娘指點，與獨孤九劍傳人切磋過招",
	Args =
	{
		{ID = 15,Imageid = 10998,Desc = --[[!AUTO_1049]]"與@令狐沖[target -14.5853,47.489,-56.9277,monster=58665]過招",BoardCond = {1,2}},
		{ID = 15,Imageid = 10998,Desc = --[[!AUTO_1050]]"將自己戰績的消息，報告給@東方姑娘[pos3 5.00179, 47.489, -59.5387]",BoardCond = {5}},
		{ID = 15,Imageid = 10998,Desc = --[[!AUTO_1051]]"在東方姑娘協助下，再次與@令狐沖[target -14.5853,47.489,-56.9277,monster=58851]過招",BoardCond = {3}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1052]]"離開副本",BoardCond = {4}}
	}
}

Ectype.EctypeArgs[2535] =
{
	Name = --[[!AUTO_1053]]"副本追蹤",
	Desc = --[[!AUTO_1054]]"目標：按照師兄陸大有的指導，完成華山派門派訓練",
	Args =
	{
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1055]]"聽陸大有介紹格擋。",BoardCond = {1}, ArgsCond = {105,--[[!AUTO_1056]]"=",0}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1057]]"準備一下，@上前[pos3 5.468, 55.867, -20.188]與兩隻暴躁猴子練習格擋。",BoardCond = {1}, ArgsCond = {105,--[[!AUTO_1058]]"=",1}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1059]]"^FFFF00按住X鍵不放^FFFFFF格擋猴子們的攻擊。",BoardCond = {3}, ArgsCond = {105,--[[!AUTO_1060]]"=",1}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1061]]"找到@陸大有[pos3 24.522, 55.544, -14.514]進行後續訓練。",BoardCond = {3}, ArgsCond = {105,--[[!AUTO_1062]]"=",2}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1063]]"聽陸大有介紹氣宗劍法的應用。",BoardCond = {7}, ArgsCond = {105,--[[!AUTO_1064]]"=",2}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1065]]"@站在[pos3 23.563, 55.619, -8.38]最佳出招位置，準備實踐陸大有的建議。",BoardCond = {7}, ArgsCond = {105,--[[!AUTO_1066]]"=",3}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1067]]"依照指點打敗三隻@猴子[target 23.563, 55.619, -8.38, monster=58850](%SA[102]/3)。可查看聊天欄回顧師兄的指點。",BoardCond = {4}, ArgsCond = {105,--[[!AUTO_1068]]"=",3}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1069]]"前往@吊橋盡頭[pos3 23.911, 55.404, 5.942]，看看猴子們在玩什麼把戲。",BoardCond = {4}, ArgsCond = {105,--[[!AUTO_1070]]"=",4}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1071]]"聽陸大有介紹新技能戰法，準備練習。",BoardCond = {8}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1072]]"依照指點操練技能，打敗攔路的@猴子[target 23.911, 55.404, 5.942, monster=58850](%SA[103]/4)。可查看聊天欄回顧師兄的指點。",BoardCond = {5}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1073]]"聽陸大有介紹新技能戰法。",BoardCond = {9}, ArgsCond = {105,--[[!AUTO_1074]]"=",4}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1075]]"@站在[pos3 13.217, 55.446, 16.02]最佳出招位置，準備戰鬥。",BoardCond = {9}, ArgsCond = {105,--[[!AUTO_1076]]"=",5}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1077]]"依照指點操練技能，打敗@大皮猴[target 13.217, 55.446, 16.02, monster=66951](%SA[104]/4)。可查看聊天欄回顧師兄的指點。",BoardCond = {6}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1078]]"訓練完成了。可以@離開[pos3 -8.045, 55.729, 17.292]訓練場地了。",BoardCond = {10}},
	}
}

Ectype.EctypeArgs[2576] =     -----郊外酒肆
{
	Name = --[[!AUTO_1079]]"副本追蹤",
	Desc = --[[!AUTO_1080]]"目標：前往郊外酒肆",
	Args =
	{
		{ID = 0,Imageid = 2103,Desc = --[[!AUTO_1081]]"繼續前進",BoardCond = {1,3,5}},
		{ID = 0,Imageid = 1932,Desc = --[[!AUTO_1082]]"消滅伏擊的敵人",BoardCond = {2}},
		{ID = 0,Imageid = 1932,Desc = --[[!AUTO_1083]]"消滅伏擊的敵人",BoardCond = {4}},
		{ID = 0,Imageid = 1922,Desc = --[[!AUTO_1084]]"擊殺余人彥",BoardCond = {6}},
 		{ID = 0,Imageid = 2103,Desc = --[[!AUTO_1085]]"副本過關！",BoardCond = {7}}
	}
}

Ectype.EctypeArgs[2571] =
{
	Name = --[[!AUTO_1086]]"副本追蹤",
	Desc = --[[!AUTO_1087]]"目標：按照長老童百熊的指點，完成日月神教門派訓練",
	Args =
	{
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1088]]"跟上@長老童百熊[target -0.321, 58.937, -43.796, npc=59046]，參加對嵩山奸細的審判。",BoardCond = {1}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1089]]"跟隨@童長老[target 7.125, 59.091, -17.678, npc=59046]入場",BoardCond = {3}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1090]]"跟隨@童長老[target 7.125, 59.091, -17.678, npc=59046]入場",BoardCond = {12}, ArgsCond = {500,--[[!AUTO_1091]]"=",0}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1092]]"按童長老安排，@上前[pos3 0.207, 60.899, 4.665]捉拿逃犯。",BoardCond = {12}, ArgsCond = {500,--[[!AUTO_1093]]"=",1}},
 		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1094]]"使用神行追趕逃跑的@嵩山派戴蹤[pos3 -11.406, 69.597, 49.258]",BoardCond = {4}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1095]]"聽童長老介紹閃避的操作",BoardCond = {5}, ArgsCond = {500,--[[!AUTO_1096]]"=",1}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1097]]"上前用逃犯戴蹤@練習閃避[pos3 0.284, 69.598, 50.051]",BoardCond = {5}, ArgsCond = {500,--[[!AUTO_1098]]"=",2}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1099]]"按兩下WASD鍵躲避戴蹤的攻擊",BoardCond = {6}, ArgsCond = {500,--[[!AUTO_1100]]"=",2}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1101]]"殺死@戴蹤[target -0.67, 69.598, 46.98, monster=59037]將其斷罪。",BoardCond = {6}, ArgsCond = {500,--[[!AUTO_1102]]"=",3}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1103]]"跟隨@童長老[target 16.957, 69.598, 47.369,npc=59046]，準備應對奸細作亂。",BoardCond = {7}, ArgsCond = {500,--[[!AUTO_1104]]"=",3}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1105]]"@下樓[pos3 11.496, 60.57, 16.126]處決嵩山派的奸細。",BoardCond = {7}, ArgsCond = {500,--[[!AUTO_1106]]"=",4}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1107]]"處決暴動的@嵩山派俘虜[target 12.027,60.242,17.314,monster=59035](%SA[401]/4)。",BoardCond = {8}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1108]]"處決暴動的@嵩山派俘虜[target 7.320,60.567,11.814,monster=59036](%SA[401]/4)。",BoardCond = {9}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1109]]"處決暴動的@嵩山派俘虜[target -3.617, 60.946, 1.184, monster=59035](%CALC[arg(401)+arg(402)]/7)。",BoardCond = {10}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1110]]"訓練完成。@離開[pos3 -1.033, 59.22, -23.069]審判現場。",BoardCond = {11}}
	}
}


Ectype.EctypeArgs[2572] =
{
	Name = --[[!AUTO_1111]]"副本追蹤",
	Desc = --[[!AUTO_1112]]"目標：按照長老童百熊的指點，完成日月神教門派訓練",
	Args =
	{
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1113]]"跟上@長老童百熊[target -0.321, 58.937, -43.796, npc=59821]，參加對你的審判。",BoardCond = {1}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1114]]"跟隨@童長老[target 7.125, 59.091, -17.678, npc=59821]入場",BoardCond = {9}, ArgsCond = {500,--[[!AUTO_1115]]"=",0}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1116]]"上前@接受審判[pos3 0.207, 60.899, 4.665]",BoardCond = {9}, ArgsCond = {500,--[[!AUTO_1117]]"=",1}},
 		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1118]]"按住x鍵格擋試煉弟子的攻擊。",BoardCond = {4}, ArgsCond = {500,--[[!AUTO_1119]]"=",1}},
 		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1120]]"情況有變，聽取@童長老[pos3 4.663, 60.656, -2.792]的指點。",BoardCond = {4}, ArgsCond = {500,--[[!AUTO_1121]]"=",2}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1122]]"聆聽童長老的安排。",BoardCond = {5}, ArgsCond = {500,--[[!AUTO_1123]]"=",2}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1124]]"上前@接受審判[pos3 0.207, 60.899, 4.665]。",BoardCond = {5}, ArgsCond = {500,--[[!AUTO_1125]]"=",3}},
		{ID = 102,Imageid = 10998,Desc = --[[!AUTO_1126]]"打敗@試煉弟子[target 0,61,6,monster=59825](%d/15)，贏得審判。",BoardCond = {6}},
		{ID = 102,Imageid = 10998,Desc = --[[!AUTO_1127]]"打敗@試煉弟子[target 0,61,6,monster=59826]](%d/15)，贏得審判。",BoardCond = {7}},
		{ID = 102,Imageid = 10998,Desc = --[[!AUTO_1128]]"打敗@試煉弟子[target 0,61,6,monster=59828]](%d/15)，贏得審判。",BoardCond = {8}, ArgsCond={102,--[[!AUTO_1129]]"<",15}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1130]]"@離開[pos3 1.601, 59.091, -19.837]審判現場，完成訓練。",BoardCond = {8}, ArgsCond={102,--[[!AUTO_1131]]"=",15}}
	}
}


Ectype.EctypeArgs[2599] =
{
	Name = --[[!AUTO_1132]]"副本追蹤",
	Desc = --[[!AUTO_1133]]"目標：船上五仙教眾人已然擒住令狐沖，設法救出令狐沖",
	Args =
	{
		{ID = 15,Imageid = 10998,Desc = --[[!AUTO_1134]]"按藍鳳凰所言，令狐沖身體虛弱，需要收集五寶釀製花蜜酒，擊碎所有白瓷瓶，找尋五寶",BoardCond = {7}},
		{ID = 15,Imageid = 10998,Desc = --[[!AUTO_1135]]"擊碎所有瓦罐，繼續找尋五寶",BoardCond = {8}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1136]]"美酒怎麼不敢喝？拿取@五寶花蜜酒[target 25.380,239.181,15.214,mine=59924]盡情喝個夠",BoardCond = {5}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1137]]"離開副本",BoardCond = {2}}
	}
}


Ectype.EctypeArgs[2598] =
{
	Name = --[[!AUTO_1138]]"副本追蹤",
	Desc = --[[!AUTO_1139]]"目標：進入玉皇觀，化解泰山派內亂",
	Args =
	{
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1140]]"跟隨天松，沖入玉皇觀",BoardCond = {1}},
		{ID = 15,Imageid = 10998,Desc = --[[!AUTO_1141]]"擊退阻攔的@叛亂內堂弟子[pos 69,408](%d/10)",BoardCond = {2}},
		{ID = 15,Imageid = 10998,Desc = --[[!AUTO_1142]]"擊退圍攻過來的大隊@叛亂內堂弟子[pos 69,408](%d/10)",BoardCond = {7}},
		{ID = 15,Imageid = 10998,Desc = --[[!AUTO_1143]]"協助天松擊敗@玉磬子[pos 69,411](%d/1)",BoardCond = {4}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1144]]"天門及時趕回，泰山派內亂即將平息",BoardCond = {5}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1145]]"離開副本",BoardCond = {6}}
	}
}


Ectype.EctypeArgs[2600] =
{
	Name = --[[!AUTO_1146]]"副本追蹤",
	Desc = --[[!AUTO_1147]]"目標：揭開美味包子背後的秘密",
	Args =
	{
		{ID = 15,Imageid = 10998,Desc = --[[!AUTO_1148]]"擊敗殺人不眨眼的@八萬[pos 246,-306]",BoardCond = {1}},
		{ID = 16,Imageid = 10998,Desc = --[[!AUTO_1149]]"擊敗殺人不眨眼的@惡廚[pos 246,-306]",BoardCond = {1}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1150]]"離開副本",BoardCond = {6}}
	}
}

Ectype.EctypeArgs[2601] =
{
	Name = --[[!AUTO_1151]]"副本追蹤",
	Desc = --[[!AUTO_1152]]"目標：幫令狐沖擒回黑猩猩滿天",
	Args =
	{
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1153]]"制服桀驁不馴的@滿天[pos 18,-91]",BoardCond = {1}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1154]]"離開副本",BoardCond = {6}}
	}
}


Ectype.EctypeArgs[2610] =
{
	Name = --[[!AUTO_1155]]"副本追蹤",
	Desc = --[[!AUTO_1156]]"目標：路見不平，拔刀相助，擊退神秘劫匪",
	Args =
	{
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1157]]"劫匪偷襲客船，前往@甲板[pos 36,14]查看情況",BoardCond = {1}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1158]]"劫匪數量眾多，靜待時機",BoardCond = {2}},
		{ID = 15,Imageid = 10998,Desc = --[[!AUTO_1159]]"擊殺船頭的@襲擊者頭目[pos 47,21](%d/1)",BoardCond = {3}},
		{ID = 15,Imageid = 10998,Desc = --[[!AUTO_1160]]"擊殺船中的@襲擊者頭目[pos 66,9](%d/1)",BoardCond = {6}},
		{ID = 15,Imageid = 10998,Desc = --[[!AUTO_1161]]"打敗@左挺[pos 99,14]",BoardCond = {4}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1162]]"離開副本",BoardCond = {5}}
	}
}

Ectype.EctypeArgs[2649] =
{
	Name = --[[!AUTO_1163]]"副本追蹤",
	Desc = --[[!AUTO_1164]]"目標：聽從唐墩指示完成訓練",
	Args =
	{
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1165]]"跟著唐墩，準備試用訓練機關",BoardCond = {1}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1166]]"跟隨@唐墩[pos3 23.375, 41.408, -12.047]",BoardCond = {11}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1167]]"與唐墩@會合[pos3 19.215, 41.408, -4.565]，準備用神行快速逃離險境。",BoardCond = {3}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1168]]"用神行到達@安全地點[pos3 -24.282, 47.973, -0.701]",BoardCond = {4}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1169]]"瞭解閃避的操作。",BoardCond = {5}, ArgsCond = {500,--[[!AUTO_1170]]"=",0}},	--计量
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1171]]"@上前[pos3 -28.163, 47.973, -0.813]吸引哨衛炮的火力。",BoardCond = {5}, ArgsCond = {500,--[[!AUTO_1172]]"=",1}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1173]]"按兩下WASD鍵躲避炮火",BoardCond = {6}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1174]]"瞭解唐墩的後續應對措施",BoardCond = {7}, ArgsCond = {500,--[[!AUTO_1175]]"=",1}},	--计量
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1176]]"@上前[pos3 -3.802, 41.348, -0.327]破壞失控的訓練機，為唐墩爭取時間。",BoardCond = {7}, ArgsCond = {500,--[[!AUTO_1177]]"=",2}},	--计量
		{ID = 102,Imageid = 10998,Desc = --[[!AUTO_1178]]"活用新技能破壞@訓練機[pos3 -3.802, 41.348, -0.327](%d/14)",BoardCond = {8}},	--直接过
		{ID = 103,Imageid = 10998,Desc = --[[!AUTO_1179]]"活用新技能破壞@訓練機[pos3 2.726, 41.348, -0.396](%d/10)",BoardCond = {9}, ArgsCond = {500,--[[!AUTO_1180]]"=",2}},	--count
		{ID = 103,Imageid = 10998,Desc = --[[!AUTO_1181]]"@探查[pos3 16.94, 41.348, -0.267]前方情況。",BoardCond = {9}, ArgsCond = {500,--[[!AUTO_1182]]"=",3}},	--count
		{ID = 106,Imageid = 10998,Desc = --[[!AUTO_1183]]"活用新技能破壞@原型機[target 2,0,monster=60858](%d/1)",BoardCond = {10}, ArgsCond = {500,--[[!AUTO_1184]]"=",3}},	--count
		{ID = 106,Imageid = 10998,Desc = --[[!AUTO_1185]]"回@高處[pos3 -21.122, 47.973, -0.429]避開爆炸",BoardCond = {10}, ArgsCond = {500,--[[!AUTO_1186]]"=",4}},	--count
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1187]]"離開副本",BoardCond = {2}}
		}
}

Ectype.EctypeArgs[2823] =
{
	Name = --[[!AUTO_1188]]"副本追蹤",
	CanExit = false,
	Desc = --[[!AUTO_1189]]"目標：江湖中，一場風波悄然醞釀，而寧靜的孤劍村，正遭受一場滅頂之災",
	Args =
	{
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1190]]"聽@玲瓏[target 219.520,33.164,-129.283, monster=61653]講述孤劍村發生了什麼事",BoardCond = {13}},
		{ID = 15,Imageid = 10998,Desc = --[[!AUTO_1191]]"擊殺@神秘襲擊者[target 147.069,69.6207,-56.8017, monster=62464](%d/5)，化解孤劍村危機，",BoardCond = {4}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1192]]"去見@村長[target 93.233,79.058,23.908, monster=61656]，詢問事情的原委",BoardCond = {10}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1193]]"聆聽@村長[target 93.233,79.058,23.908, monster=61656]的囑託",BoardCond = {5}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1194]]"藏在@屋子後[pos 86.8834,10.9105]，避開突然出現的強敵",BoardCond = {6}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1195]]"來到@藏身之處[target 86.9822, 79.0603, 11.3343, bind=63722]後，按R鍵，開始進入躲藏狀態",BoardCond = {12}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1196]]"在@屋子後[pos 86.8834,10.9105]靜觀其變，等待時機",BoardCond = {7}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1197]]"形藏被發現，為保存孤劍村的秘密，速速@逃離[pos 44.8873,-10.6821]",BoardCond = {8}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1198]]"衝破防線，逃往@福州城[pos -4,-18]",BoardCond = {9}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1199]]"萬分危急，繼續往@福州城[pos -54,-24]方向逃跑",BoardCond = {11}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1200]]"逃往福州城",BoardCond = {2}}
	}
}

Ectype.EctypeArgs[2650] =
{
	Name = --[[!AUTO_1201]]"副本追蹤",
	Desc = --[[!AUTO_1202]]"目標：聽從唐墩指示完成訓練",
	Args =
	{
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1203]]"聽唐墩講解訓練",BoardCond = {1}},	--计量
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1204]]"聽唐墩講解訓練",BoardCond = {3}, ArgsCond = {500,--[[!AUTO_1205]]"=",1}},	--计量
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1206]]"踩上@感測器[pos3 -15.92, 47.744, -0.507]啟動訓練",BoardCond = {3}, ArgsCond = {500,--[[!AUTO_1207]]"=",2}},	--计量
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1208]]"按住X鍵，格擋訓練機的炮火",BoardCond = {4}, ArgsCond = {500,--[[!AUTO_1209]]"=",2}},	--计量
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1210]]"踩上@感測器[pos3 -20.015, 47.973, -0.621]，啟動新的拳刃技能",BoardCond = {4}, ArgsCond = {500,--[[!AUTO_1211]]"=",3}},	--计量
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1212]]"聽唐墩講解訓練",BoardCond = {5}, ArgsCond = {500,--[[!AUTO_1213]]"=",3}},	--计量
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1214]]"朝啟動的自保能力訓練機@開火[target -20.979, 47.973, 0.844, monster=60958]，進行訓練。",BoardCond = {5}, ArgsCond = {500,--[[!AUTO_1215]]"=",4}},	--计量
		{ID = 102,Imageid = 10998,Desc = --[[!AUTO_1216]]"完成所有的@射擊訓練[target -20.979, 47.973, 0.844, monster=60958](%d/4)。",BoardCond = {6}, ArgsCond = {500,--[[!AUTO_1217]]"=",4}},	--计量
		{ID = 102,Imageid = 10998,Desc = --[[!AUTO_1218]]"進入@隔離區[pos3 0.334, 41.348, -0.609]，進行後續訓練。",BoardCond = {6}, ArgsCond = {500,--[[!AUTO_1219]]"=",5}},	--计量
		{ID = 104,Imageid = 10998,Desc = --[[!AUTO_1220]]"破壞@爆炸訓練機[target 5,43,-1,monster=60959](%d/4)",BoardCond = {7}, ArgsCond = {500,--[[!AUTO_1221]]"=",5}},	--计量
		{ID = 104,Imageid = 10998,Desc = --[[!AUTO_1222]]"破壞@焚燒訓練機[target 10,41,-1,monster=60960](%SA[105]/8)",BoardCond = {7}, ArgsCond = {500,--[[!AUTO_1223]]"=",6}},	--计量
		{ID = 104,Imageid = 10998,Desc = --[[!AUTO_1224]]"拉動@把手[target 18.471, 41.348, -3.544, mine=60964]，啟動下一步訓練。",BoardCond = {7}, ArgsCond = {500,--[[!AUTO_1225]]"=",7}},	--计量
		{ID = 104,Imageid = 10998,Desc = --[[!AUTO_1226]]"按唐墩指引行事，然後迅速站在@射擊位置[pos3 17.334, 41.348, 3.015]",BoardCond = {7}, ArgsCond = {500,--[[!AUTO_1227]]"=",8}},	--计量
		{ID = 106,Imageid = 10998,Desc = --[[!AUTO_1228]]"破壞@速射訓練機[target 23.0517,41.3742,-6.76533,monster=60962](%d/1)",BoardCond = {8}, ArgsCond = {500,--[[!AUTO_1229]]"=",8}},	--计量
		{ID = 106,Imageid = 10998,Desc = --[[!AUTO_1230]]"破壞@速射訓練機[target 23.0517,41.3742,-6.76533,monster=60962](%CALC[arg(106)-1]/1)",BoardCond = {8}, ArgsCond = {500,--[[!AUTO_1231]]"=",9}},	--计量
		{ID = 106,Imageid = 10998,Desc = --[[!AUTO_1232]]"訓練完成。@離開[pos3 0.334, 41.348, -0.609]訓練場地",BoardCond = {8}, ArgsCond = {500,--[[!AUTO_1233]]"=",10}},	--计量
	}
}

Ectype.EctypeArgs[2824] =
{
	Name = --[[!AUTO_1234]]"副本追蹤",
	Desc = --[[!AUTO_1235]]"目標：為解開孤劍村屠殺疑雲，趕往福州城外與左挺約鬥",
	Args =
	{
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1236]]"跟緊@左挺[pos -69,-88]",BoardCond = {1}},
		{ID = 15,Imageid = 10998,Desc = --[[!AUTO_1237]]"擊敗攔截的@嵩山弟子甲[target -64.2064,60.6316,-74.966, monster=62013](%d/2)",BoardCond = {3}},
		{ID = 15,Imageid = 10998,Desc = --[[!AUTO_1238]]"再發神威，擊敗攔截的@嵩山弟子乙[target -64.2064,60.6316,-74.966, monster=62014](%d/4)",BoardCond = {4}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1239]]"橫穿@鬧市區[pos -16,-38]，與左挺比拼腳力",BoardCond = {7,5}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1240]]"來到@跳躍指示[target -14.9744, 60.6355, -39.6675, bind=70551]處，按R鍵，施展輕功躍上房頂",BoardCond = {6}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1241]]"福州外，白塔下，孤劍村的秘密最終破解！",BoardCond = {2}}
		}
}

Ectype.EctypeArgs[2626] =
{
	Name = --[[!AUTO_1242]]"副本追蹤",
	Desc = --[[!AUTO_1243]]"目標：從丁勉處奪得五嶽令旗",
	Args =
	{
		{ID = 0,Imageid = 2103,Desc = --[[!AUTO_1244]]"前往沙灘",BoardCond = {1}},
		{ID = 0,Imageid = 2239,Desc = --[[!AUTO_1245]]"從竹子處借力跳上懸崖",BoardCond = {3,5,7,9}},
		{ID = 0,Imageid = 1353,Desc = --[[!AUTO_1246]]"全滅敵人",BoardCond = {2,4,6}},
		{ID = 0,Imageid = 16855,Desc = --[[!AUTO_1247]]"破壞八槍陣後擊敗東海一槍",BoardCond = {8}},
		{ID = 0,Imageid = 1913,Desc = --[[!AUTO_1248]]"全滅敵人後擊敗丁勉",BoardCond = {10}},
		{ID = 0,Imageid = 2103,Desc = --[[!AUTO_1249]]"通關",BoardCond = {11}}
	}
}



Ectype.EctypeArgs[2083] =
{
	Name = --[[!AUTO_1250]]"副本追蹤",
	Desc = --[[!AUTO_1251]]"目標：擊敗瘋狂的林平之",
	Args =
	{
		{ID = 0,Imageid = 2103,Desc = --[[!AUTO_1252]]"前往吊橋",BoardCond = {1}},
		{ID = 301,Imageid = 2103,Desc = --[[!AUTO_1253]]"擊毀木板: %d/3",BoardCond = {17,18,19}},
		{ID = 302,Imageid = 1932,Desc = --[[!AUTO_1254]]"擊殺青城弟子: %d/4",BoardCond = {4}},
		{ID = 303,Imageid = 2103,Desc = --[[!AUTO_1255]]"擊毀烏鴉圖騰: %d/2",BoardCond = {5}},
		{ID = 304,Imageid = 1326,Desc = --[[!AUTO_1256]]"擊殺塞北巨鴉: %d/1",BoardCond = {6}},
		{ID = 305,Imageid = 1326,Desc = --[[!AUTO_1257]]"擊殺塞北毒鴉: %d/10",BoardCond = {6}},
		{ID = 306,Imageid = 1464,Desc = --[[!AUTO_1258]]"擊殺青城石獸: %d/1",BoardCond = {8}},
		{ID = 307,Imageid = 1448,Desc = --[[!AUTO_1259]]"擊殺屍傀: %d/30",BoardCond = {8}},
		{ID = 308,Imageid = 12061,Desc = --[[!AUTO_1260]]"擊敗木高峰: %d/1",BoardCond = {10}},
		{ID = 309,Imageid = 12061,Desc = --[[!AUTO_1261]]"擊敗變身的木高峰: %d/1",BoardCond = {11}},
		{ID = 310,Imageid = 1932,Desc = --[[!AUTO_1262]]"擊殺青城弟子: %d/11",BoardCond = {16}},
		{ID = 311,Imageid = 1448,Desc = --[[!AUTO_1263]]"擊殺屍傀: %d/11",BoardCond = {16}},
		{ID = 312,Imageid = 1858,Desc = --[[!AUTO_1264]]"擊敗岳靈珊: %d/1",BoardCond = {12}},
		{ID = 313,Imageid = 1945,Desc = --[[!AUTO_1265]]"擊敗林平之: %d/1",BoardCond = {14}},
		{ID = 314,Imageid = 1945,Desc = --[[!AUTO_1266]]"擊敗瘋狂的林平之: %d/1",BoardCond = {15}},
		{ID = 0,Imageid = 10359,Desc = --[[!AUTO_1267]]"繼續前進，保持警覺",BoardCond = {7}},
		{ID = 0,Imageid = 2103,Desc = --[[!AUTO_1268]]"追趕木高峰",BoardCond = {9}},
		{ID = 0,Imageid = 2179,Desc = --[[!AUTO_1269]]"追趕岳靈珊",BoardCond = {13}},
	}
}

Ectype.EctypeArgs[2853] =
{
	Name = --[[!AUTO_1270]]"副本追蹤",
	Desc = --[[!AUTO_1271]]"目標：協助恆山派調查廿八鋪",
	Args =
	{
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1272]]"前往廿八鋪",BoardCond = {1}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1273]]"匪徒來襲，廿八鋪大亂",BoardCond = {3}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1274]]"等待恆山弟子帶回消息",BoardCond = {4}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1275]]"尋找@恆山眾尼[pos -18,-122]",BoardCond = {5}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1276]]"尋找@恆山眾尼[pos 5,-129]",BoardCond = {6}},
		{ID = 15,Imageid = 10998,Desc = --[[!AUTO_1277]]"擊殺@神秘弓手[pos 6,-135](%d/4)",BoardCond = {7}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1278]]"尋找@恆山眾尼[pos 29,-77]",BoardCond = {8}},
		{ID = 15,Imageid = 10998,Desc = --[[!AUTO_1279]]"擊殺@神秘刀手[pos 26,-83](%d/5)",BoardCond = {9}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1280]]"與@定靜會和[pos -20,-111]",BoardCond = {10}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1281]]"離開副本",BoardCond = {2}}
	}
}

Ectype.EctypeArgs[2854] =
{
	Name = --[[!AUTO_1282]]"副本追蹤",
	Desc = --[[!AUTO_1283]]"目標：審問章大年",
	Args =
	{
		{ID = 15,Imageid = 10998,Desc = --[[!AUTO_1284]]"擊殺@金吾奸細[pos -433,-21](%d/1)",BoardCond = {1}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1285]]"離開副本",BoardCond = {2}}
	}
}

Ectype.EctypeArgs[2904] =
{
	Name = --[[!AUTO_1286]]"副本追蹤",
	Desc = --[[!AUTO_1287]]"目標：幫助向問天擊退圍攻的江湖人士",
	Args =
	{
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1288]]"防備圍攻者偷襲",BoardCond = {6}},
		{ID = 102,Imageid = 10998,Desc = --[[!AUTO_1289]]"擊退正派弟子(%d/4)",BoardCond = {1}},
		{ID = 103,Imageid = 10998,Desc = --[[!AUTO_1290]]"擊退日月神教澤地堂五虎(%d/5)",BoardCond = {2}},
		{ID = 15,Imageid = 10998,Desc = --[[!AUTO_1291]]"擊退日月神教澤火堂弟子(%d/6)",BoardCond = {3}},
		{ID = 15,Imageid = 10998,Desc = --[[!AUTO_1292]]"擊退澤火堂堂主薛人貴(%d/1)",BoardCond = {4}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1293]]"與向問天一同離開",BoardCond = {5}}
	}
}

Ectype.EctypeArgs[2903] =
{
	Name = --[[!AUTO_1294]]"副本追蹤",
	Desc = --[[!AUTO_1295]]"目標：破解天羅棋局",
	Args =
	{
		{ID = 15,Imageid = 10998,Desc = --[[!AUTO_1296]]"擊退守護棋局的@天羅幻象[target -244.174, 26.8129, -261.387,monster=61456](%d/10)",BoardCond = {1}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1297]]"跟隨@白弦音[pos -219,-228]進入內院",BoardCond = {2}},
		{ID = 15,Imageid = 10998,Desc = --[[!AUTO_1298]]"黑子氣已盡，擊殺@白子[target -211.675, 27.541, -219.972,monster=61454]破解天羅棋局(%d/4)",BoardCond = {3}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1299]]"黑白二子廝殺不止，靜觀棋局演化",BoardCond = {5}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1300]]"離開副本",BoardCond = {4}}
	}
}

Ectype.EctypeArgs[2905] =
{
	Name = --[[!AUTO_1301]]"副本追蹤",
	Desc = --[[!AUTO_1302]]"目標：白弦音已經走火入魔，幫她恢復清醒",
	Args =
	{
		{ID = 15,Imageid = 10998,Desc = --[[!AUTO_1303]]"擊退心魔幻化成的殺氣@琴音嫋嫋[target -138.112, 26.6774, 71.414,monster=61453](%d/10)",BoardCond = {1}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1304]]"離開副本",BoardCond = {2}}
	}
}

Ectype.EctypeArgs[2906] =
{
	Name = --[[!AUTO_1305]]"副本追蹤",
	Desc = --[[!AUTO_1306]]"目標：白鷺洲",
	Args =
	{
		{ID = 15,Imageid = 10998,Desc = --[[!AUTO_1307]]"楊蓮亭企圖黑吃黑奪走寶物，擊退@楊蓮亭[pos 106,-173](%d/1)",BoardCond = {1}},
		{ID = 15,Imageid = 10998,Desc = --[[!AUTO_1308]]"乘勝追擊，殺死楊蓮亭召喚而來的@日月弟子[pos 105,-185](%d/1)",BoardCond = {2}}
	}
}

Ectype.EctypeArgs[2908] =
{
	Name = --[[!AUTO_1309]]"副本追蹤",
	Desc = --[[!AUTO_1310]]"目標：探索劍魔塚",
	Args =
	{
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1311]]"黑暗中醒來，發覺有鳥獸嘶鳴之聲，速速前往@光亮處[pos 23,-104]探查。",BoardCond = {1}},
		{ID = 15,Imageid = 10998,Desc = --[[!AUTO_1312]]"眼見四條蝮蛇圍攻一隻雄壯的大鵰，上前協助大鵰擊退@蝮蛇[target 17,33,-99,monster=62692](%d/4)。",BoardCond = {3}},
		{ID = 15,Imageid = 10998,Desc = --[[!AUTO_1313]]"大鵰盤旋於石燈左右，頗為怪異！擊碎@兩座石燈[target -7.55,35.07,-89,monster=70914](%d/2)。並按^FFFF00Z^FFFFFF鍵調息，恢復體力後繼續探索！",BoardCond = {15}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1314]]"大鵰盤旋飛翔，似在引路，前往大鵰盤旋的@劍塚機關[pos3 1.843,35.341,-86.403]處。",BoardCond = {4}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1315]]"將村長交予的玄鐵鐵劍放在@劍塚機關[target 1.78,37.38,-84.81,mine=62700]之上，試著打開機關。",BoardCond = {5}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1316]]"觀機關轉動之象，乃是'歸妹趨無妄，無妄趨同人，同人趨大有。甲轉丙，丙轉庚，庚轉癸'之意,難道這是某部武功秘笈的開篇口訣不成！",BoardCond = {16}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1317]]"大鵰歡欣鳴叫，繼續在前方帶路，看看大鵰要將你帶到什麼@地方[pos3 -30.157,44.714,-2.814]。",BoardCond = {6}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1318]]"一具遺骨在地，或許是大鵰主人，不如上前@拜祭[target -50.192,39.580,-7,npc=62703]。【點擊螢幕右下方的快捷圖示】",BoardCond = {7}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1319]]"鵰兄再度嘶鳴，好像發現了什麼，速速上前@打探[pos3 16,40.40,0.5]",BoardCond = {9}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1320]]"上前參悟@獨孤心法總綱[target 19.75,43.25,2.06,mine=62701]。",BoardCond = {10}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1321]]"出口處傳來陣陣怪聲，應是方才觀摩獨孤心法時驚擾了什麼，前去@調查[pos3 0.75,44.18,35.89]一下。",BoardCond = {14}},
		{ID = 15,Imageid = 10998,Desc = --[[!AUTO_1322]]"一群宵小怪物怎敢螳臂擋車？擊殺@毒蜘蛛[target -0.956,48.302,64.422, monster=62021] (%d/16)。",BoardCond = {13}},
		--{ID = 0,Imageid = 10998,Desc = "小怪众多，可击破一旁的@石灯[target -7.832, 44.698, 38.626,monster=66321]，然后按^FFFF00Z^FFFFFF键拾起补给，进行恢复！！！",BoardCond = {13}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1323]]"前方又傳來異動，@上前[pos 0,60]看看",BoardCond = {11}},
		{ID = 15,Imageid = 10998,Desc = --[[!AUTO_1324]]"蛛王攔路，只有殺退@蛛王[target 0,50.172,71,monster=62693]，方可離開劍魔塚！(%d/1)",BoardCond = {12}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1325]]"蛛王強大，可擊破一旁的@石燈[target -4.971, 50.172, 71.268,monster=66321]，然後按^FFFF00Z^FFFFFF鍵拾起補給，進行恢復！！！",BoardCond = {12}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1326]]"強敵已退，速速離開@劍魔塚[Pos 3,104]。",BoardCond = {2}}
	}
}

Ectype.EctypeArgs[2962] =
{
	Name = --[[!AUTO_1327]]"副本追蹤",
	Desc = --[[!AUTO_1328]]"目標：救出被囚的女童",
	Args =
	{
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1329]]"馮寶抓捕童女，血祭至陰寶劍",BoardCond = {1}},
		{ID = 15,Imageid = 10998,Desc = --[[!AUTO_1330]]"擊殺馮寶爪牙@黑煞[pos 235,-5](%d/1)",BoardCond = {3}},
		{ID = 16,Imageid = 10998,Desc = --[[!AUTO_1331]]"擊殺馮寶爪牙@白煞[pos 235,-5](%d/1)",BoardCond = {3}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1332]]"離開副本",BoardCond = {2}}
	}
}

Ectype.EctypeArgs[2963] =
{
	Name = --[[!AUTO_1333]]"副本追蹤",
	Desc = --[[!AUTO_1334]]"目標：回憶藏劍山莊往事",
	Args =
	{
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1335]]"偶遇少年東方不敗",BoardCond = {1}},
		{ID = 15,Imageid = 10998,Desc = --[[!AUTO_1336]]"擊殺追捕東方嵐的@山莊護院[pos -325,355](%d/4)",BoardCond = {3}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1337]]"跟隨@任知行和東方嵐[pos -341,311]",BoardCond = {4}},
		{ID = 15,Imageid = 10998,Desc = --[[!AUTO_1338]]"擊殺看守童男童女的@山莊劍手[pos -343,307](%d/6)",BoardCond = {5}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1339]]"揭開藏劍山莊血祭真相",BoardCond = {6}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1340]]"離開副本",BoardCond = {2}}
	}
}

Ectype.EctypeArgs[2651] =
{
	Name = --[[!AUTO_1341]]"副本追蹤",
	Desc = --[[!AUTO_1342]]"目標：完成恆山派“棉針劍法”系列訓練",
	Args =
	{
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1343]]"聽師姐講解訓練內容",BoardCond = {1}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1344]]"聽師姐講解訓練內容",BoardCond = {3}, ArgsCond = {500,--[[!AUTO_1345]]"=",0}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1346]]"@上前一步[pos3 39.345, 60.31, -30.139]，準備用神行沖過鐵索橋。",BoardCond = {3}, ArgsCond = {500,--[[!AUTO_1347]]"=",1}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1348]]"移動中按V鍵啟動神行沖過鐵索橋，到達@平臺中央[pos3 13.594, 50.231, -2.47]",BoardCond = {4}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1349]]"聽師姐介紹後續訓練",BoardCond = {5}, ArgsCond = {500,--[[!AUTO_1350]]"=",1}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1351]]"撫摸@領頭信梟[target 17.904, 50.231, 8.54, mine = 62515]",BoardCond = {5}, ArgsCond = {500,--[[!AUTO_1352]]"=",2}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1353]]"回@場中[pos3 12.678, 50.231, -0.322]，準備開始閃避訓練",BoardCond = {5}, ArgsCond = {500,--[[!AUTO_1354]]"=",3}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1355]]"按兩下WASD鍵閃避信梟的衝撞",BoardCond = {6}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1356]]"聽鄭萼師姐講解恆山武學的心境",BoardCond = {7}, ArgsCond = {500,--[[!AUTO_1357]]"=",3}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1358]]"@上前[pos3 9.239, 50.231, 3.362]準備進行後續訓練",BoardCond = {7}, ArgsCond = {500,--[[!AUTO_1359]]"=",4}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1360]]"用~鍵和Q鍵技能擊碎擋路的@木柴堆[target 6.008,50.219,-2.09262520,monster=62520](%SA[103]/3)",BoardCond = {8}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1361]]"巧用2鍵3鍵技能擊破@木桶[target -1.74, 50.231, -21.363,monster=62521](%SA[104]/4)",BoardCond={9}, ArgsCond = {500,--[[!AUTO_1362]]"=",4}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1363]]"巧用2鍵3鍵技能打敗@信梟[target -17.654, 50.231, -19.282,monster=62487](%SA[105]/3)，體會當身技的特點。",BoardCond={9}, ArgsCond = {500,--[[!AUTO_1364]]"=",5}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1365]]"擊破剩餘的@信梟[target -9.774, 50.231, -13.42,monster=62487](%SA[106]/6)",BoardCond = {10}, ArgsCond = {106,--[[!AUTO_1366]]"<",6}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1367]]"現在可以@離開[pos3 16.793, 50.23, -0.457]訓練場地了。",BoardCond = {10}, ArgsCond = {106,--[[!AUTO_1368]]">",5}}
	}
}


Ectype.EctypeArgs[2652] =
{
	Name = --[[!AUTO_1369]]"副本追蹤",
	Desc = --[[!AUTO_1370]]"目標：在實戰中完成恆山派“萬花劍法”系列訓練",
	Args =
	{
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1371]]"前往@衝突地點[pos3 32.669, 50.231, 0.735]，加入定逸師太一行",BoardCond = {1}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1372]]"@上前[pos3 26.696, 20.231, -0.121]準備使用格擋，誘使嵩山弟子動手",BoardCond = {3}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1373]]"按住X鍵，格擋@嵩山弟子[pos3 26.696, 20.231, -0.121]的攻擊",BoardCond = {4}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1374]]"聆聽定逸師太的指點，之後@上前[pos3 24.428, 50.231, 0.895]練習萬花劍法",BoardCond = {5}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1375]]"按定逸指點，用~鍵和1鍵技能擊敗@嵩山弟子[target 24.428, 50.231, 0.895,monster=63043](%SA[102]/4)",BoardCond = {6}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1376]]"按定逸指點，用2鍵和4鍵技能擊敗嵩山旁門人士@卜沉[target 23.2512, 50.231, 5.59743,monster=63044](%SA[103]/1)",BoardCond = {7}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1377]]"按指點瞄準使用Q鍵和3鍵技能，擊破@嵩山小戰陣[target 21.873, 50.231, -0.212,monster=63248](%SA[104]/6)和@其餘人員[target 2.448, 50.226, -4.207](%SA[106]/5)",BoardCond = {8}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1378]]"與定逸師太一行@會合[pos3 31.467, 50.230, -0.233]，離開山頂",BoardCond = {9}}
	}
}

Ectype.EctypeArgs[2965] =
{
	Name = --[[!AUTO_1379]]"副本追蹤",
	Desc = --[[!AUTO_1380]]"目標：回憶孤劍村中的經歷，尋找黑衣人的線索。",
	Args =
	{
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1381]]"進入回憶中的孤劍村",BoardCond = {1}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1382]]"想起十天前的遭遇",BoardCond = {15}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1383]]"找到@唐石匠[target 103.35,75.0025,-5.10991,npc=61662]，看他有什麼發現",BoardCond = {3}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1384]]"找到@唐石匠[target 103.35,75.0025,-5.10991,npc=61662]，看他有什麼發現",BoardCond = {4}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1385]]"商人寄放在村中的木箱散發出刺鼻的氣味，@王半仙[target 116.617,79.1063,11.6928,npc=66750]似乎有所發現",BoardCond = {17}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1386]]"商人寄放在村中的木箱散發出刺鼻的氣味，@王半仙[target 116.617,79.1063,11.6928,npc=66750]似乎有所發現",BoardCond = {18}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1387]]"王半仙算出木箱會帶來災難，從神秘人帶來的@馬匹[pos3 132.294, 76.3791, 29.4708]入手，才能破災",BoardCond = {19}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1388]]"點燃@草料[target 132.294, 76.3791, 29.4708, mine=66749]，引開看守木箱的神秘人",BoardCond = {20}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1389]]"等待神秘人離開木箱",BoardCond = {21}},
		{ID = 15,Imageid = 10998,Desc = --[[!AUTO_1390]]"打碎@木箱[target 117.35, 81.274, 60.9196, monster=65984]，看看裡面藏著什麼(%d/6)",BoardCond = {10}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1391]]"想起一天前的遭遇",BoardCond = {16}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1392]]"醫師@黃靖[target 148.529,72.2863,-16.6315,npc=65985]似乎也有所發現",BoardCond = {5}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1393]]"醫師@黃靖[target 148.529,72.2863,-16.6315,npc=65985]似乎也有所發現",BoardCond = {6}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1394]]"黃靖在商人身上嗅出了毒粉味，準備動用@藥圃[pos3 174.61, 72.9417, -30.4152]中的草藥",BoardCond = {11}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1395]]"查看煉製化毒散的@草藥[target 174.61, 72.9417, -30.4152, mine=65986]是否成熟",BoardCond = {12}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1396]]"將草藥的長勢回報@黃靖[target 148.529,72.2863,-16.6315,npc=65985]，聽聽他的打算",BoardCond = {13}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1397]]"將草藥的長勢回報@黃靖[target 148.529,72.2863,-16.6315,npc=65985]，聽聽他的打算",BoardCond = {14}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1398]]"狂風怒號，風雨欲來",BoardCond = {22}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1399]]"即是回憶，總有終了，帶著當日所見@回歸現實[pos3 131.311, 71.0494, -17.9025]",BoardCond = {9,2}}
	}
}

Ectype.EctypeArgs[2880] =
{
	Name = --[[!AUTO_1400]]"副本追蹤",
	Desc = --[[!AUTO_1401]]"目標：在約鬥中戰勝左挺",
	Args =
	{
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1402]]"戰勝@左挺[target -112.182, 104.665, 116.193,monster=62023]",BoardCond = {1,3}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1403]]"離開副本",BoardCond = {2}}
	}
}

Ectype.EctypeArgs[2881] =
{
	Name = --[[!AUTO_1404]]"副本追蹤",
	Desc = --[[!AUTO_1405]]"目標：圍捕越獄歹徒",
	Args =
	{
		{ID = 0,Imageid = 1413,Desc = --[[!AUTO_1406]]"注意！只有捕快和被點名玩家連成的鐵鍊穿過歹徒時，才能對歹徒造成實質傷害。",BoardCond = {1}, ArgsCond = {801,--[[!AUTO_1407]]"=",0}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1408]]"離開副本",BoardCond = {1}, ArgsCond = {801,--[[!AUTO_1409]]"=",1}}
	}
}


Ectype.EctypeArgs[2852] =
{
	Name = --[[!AUTO_1410]]"副本追蹤",
	Desc = --[[!AUTO_1411]]"目標：擊殺海沙派幫主萬海行",
	Args =
	{
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1412]]"擊殺@萬海行[target 38.0145, 85.9817, -24.1931,monster=62033]",BoardCond = {1}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1413]]"離開副本",BoardCond = {2}}
	}
}

Ectype.EctypeArgs[2996] =
{
	Name = --[[!AUTO_1414]]"副本追蹤",
	Desc = --[[!AUTO_1415]]"目標：劫持人質",
	Args =
	{
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1416]]"去前方偷聽護衛說話，獲取目標所在位置。殺死這裡的苦力可以獲得易容道具。",BoardCond = {5}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1417]]"恭喜！任務完成了！",BoardCond = {2}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1418]]"找個安全的地方探聽^ecbf5d侍衛首領^ffffff的牢騷，以獲取目標位置。殺死他可以直接獲得目標位置。小心正在巡邏的護衛！",BoardCond = {6}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1419]]"去^ecbf5d貴賓樓^ffffff綁架^ecbf5d冷酷公子^ffffff。路上的^ecbf5d罎子^ffffff可以吸引附近的守衛前來察看，易容成^ecbf5d苦力^ffffff可以輕易躲過守衛。",BoardCond = {3}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1420]]"去^ecbf5d貴賓樓^ffffff綁架^ecbf5d冰霜美人^ffffff。路上的^ecbf5d罎子^ffffff可以吸引附近的守衛前來察看，易容成^ecbf5d苦力^ffffff可以輕易躲過守衛。",BoardCond = {4}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1421]]"^ecbf5d此地易容無效^ffffff，小心別被守衛發現。綁架^ecbf5d冷酷公子^ffffff。綁架之後找^ecbf5d望風老弟^ffffff交接任務，離開副本。",BoardCond = {7}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1422]]"^ecbf5d此地易容無效^ffffff，小心別被守衛發現。綁架^ecbf5d冰霜美人^ffffff。綁架之後找^ecbf5d望風老弟^ffffff交接任務，離開副本。",BoardCond = {9}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1423]]"^ecbf5d此地易容無效^ffffff，小心別被守衛發現。綁架^ecbf5d冷酷公子^ffffff。綁架之後找^ecbf5d望風老弟^ffffff交接任務，離開副本。",BoardCond = {8}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1424]]"^ecbf5d此地易容無效^ffffff，小心別被守衛發現。綁架^ecbf5d冰霜美人^ffffff。綁架之後找^ecbf5d望風老弟^ffffff交接任務，離開副本。",BoardCond = {10}}

	}
}

Ectype.EctypeArgs[2997] =
{
	Name = --[[!AUTO_1425]]"副本追蹤",
	Desc = --[[!AUTO_1426]]"目標：劫持人質",
	Args =
	{
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1427]]"去前方偷聽^ecbf5d護衛首領^ffffff說話，獲取目標所在位置。殺死這裡的大廚可以獲得易容道具。",BoardCond = {1}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1428]]"恭喜！任務完成了！",BoardCond = {2}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1429]]"找個安全的地方探聽^ecbf5d護衛首領^ffffff的牢騷，以獲取目標位置。殺死他可以直接獲得目標位置。",BoardCond = {3}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1430]]"去^ecbf5d二樓^ffffff綁架^ecbf5d督師^ffffff。路上的^ecbf5d罎子^ffffff可以吸引附近的守衛前來察看，易容成^ecbf5d大廚^ffffff可以輕易躲過守衛。",BoardCond = {5}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1431]]"去^ecbf5d一樓對面廂房^ffffff綁架^ecbf5d清高衙內^ffffff。路上的^ecbf5d罎子^ffffff可以吸引附近的守衛前來察看，易容成^ecbf5d大廚^ffffff可以輕易躲過守衛。",BoardCond = {8}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1432]]"^ecbf5d此地易容無效^ffffff，小心別被守衛發現。綁架^ecbf5d督師^ffffff。綁架之後找^ecbf5d望風老弟^ffffff交接任務，離開副本。",BoardCond = {6}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1433]]"^ecbf5d此地易容無效^ffffff，小心別被守衛發現。綁架^ecbf5d清高衙內^ffffff。綁架之後找^ecbf5d望風老弟^ffffff交接任務，離開副本。",BoardCond = {9}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1434]]"^ecbf5d此地易容無效^ffffff，小心別被守衛發現。綁架^ecbf5d督師^ffffff。綁架之後找^ecbf5d望風老弟^ffffff交接任務，離開副本。",BoardCond = {7}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1435]]"^ecbf5d此地易容無效^ffffff，小心別被守衛發現。綁架^ecbf5d清高衙內^ffffff。綁架之後找^ecbf5d望風老弟^ffffff交接任務，離開副本。",BoardCond = {10}}

	}
}

Ectype.EctypeArgs[2998] =
{
	Name = --[[!AUTO_1436]]"副本追蹤",
	Desc = --[[!AUTO_1437]]"目標：劫持人質",
	Args =
	{
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1438]]"去前方偷聽^ecbf5d護衛頭目^ffffff說話，獲取目標所在位置。殺死這裡的苦力可以獲得易容道具。",BoardCond = {1}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1439]]"恭喜！任務完成了！",BoardCond = {2}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1440]]"找個安全的地方探聽^ecbf5d護衛頭目^ffffff的牢騷，以獲取目標位置。殺死他可以直接獲得目標位置。",BoardCond = {3}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1441]]"去^ecbf5d佛堂^ffffff綁架^ecbf5d運鏢旗使^ffffff。路上的^ecbf5d罎子^ffffff可以吸引附近的守衛前來察看，易容成^ecbf5d苦力^ffffff可以輕易躲過守衛。",BoardCond = {4}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1442]]"去^ecbf5d秘徑深處^ffffff綁架^ecbf5d威嚴鏢師^ffffff。路上的^ecbf5d罎子^ffffff可以吸引附近的守衛前來察看，易容成^ecbf5d苦力^ffffff可以輕易躲過守衛。",BoardCond = {7}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1443]]"^ecbf5d此地易容無效^ffffff，小心別被守衛發現。綁架^ecbf5d運鏢旗使^ffffff。綁架之後找^ecbf5d望風老弟^ffffff交接任務，離開副本。",BoardCond = {5}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1444]]"^ecbf5d此地易容無效^ffffff，小心別被守衛發現。綁架^ecbf5d威嚴鏢師^ffffff。綁架之後找^ecbf5d望風老弟^ffffff交接任務，離開副本。",BoardCond = {8}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1445]]"^ecbf5d此地易容無效^ffffff，小心別被守衛發現。綁架^ecbf5d運鏢旗使^ffffff。綁架之後找^ecbf5d望風老弟^ffffff交接任務，離開副本。",BoardCond = {6}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1446]]"^ecbf5d此地易容無效^ffffff，小心別被守衛發現。綁架^ecbf5d威嚴鏢師^ffffff。綁架之後找^ecbf5d望風老弟^ffffff交接任務，離開副本。",BoardCond = {9}}

	}
}

Ectype.EctypeArgs[3003] =
{
	Name = --[[!AUTO_1447]]"副本追蹤",
	Desc = --[[!AUTO_1448]]"目標：在實戰中完成武當派“真武劍法”系列訓練",
	Args =
	{
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1449]]"聽清虛道長講解，並進入@起跑區[pos 36,3]",BoardCond = {1,3}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1450]]"移動中按V鍵追趕清虛，從@石橋光圈[pos 9.88 47.85,2.45]跳上去，並抵達@平臺光圈[pos3 8.12,49.25,4.55]",BoardCond = {4}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1451]]"前往@古洞深處[pos -6,-9]",BoardCond = {5}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1452]]"按兩下WASD鍵，閃避武當道童的劍氣",BoardCond = {6}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1453]]"孫芝蘭前輩似乎有難，快去@看看[pos -6,-9]",BoardCond = {7}},
		{ID = 15,Imageid = 10998,Desc = --[[!AUTO_1454]]"孫前輩的劍氣失控，速速用~鍵或Q鍵招數壓制@陰蛇劍氣[target -7.19152,49.5919,-9.11909,monster=64309](%d/6)",BoardCond = {8}},
		{ID = 15,Imageid = 10998,Desc = --[[!AUTO_1455]]"清虛道長劍氣滿溢，站在@光圈處[pos -6,-8]使用1鍵或2鍵招數消滅@陽龜劍氣[target -4.05165,49.6626,-7.35819,monster=64310](%d/6)",BoardCond = {9}},
		{ID = 15,Imageid = 10998,Desc = --[[!AUTO_1456]]"使用3鍵或4鍵技能，擊敗@陰蛇劍氣[target -7.19152,49.5919,-9.11909,monster=64312](%d/3)",BoardCond = {10}},
		{ID = 16,Imageid = 10998,Desc = --[[!AUTO_1457]]"和@陽龜劍氣[target -4.05165,49.6626,-7.35819,monster=64313](%d/3)",BoardCond = {10}},
		{ID = 17,Imageid = 10998,Desc = --[[!AUTO_1458]]"以及@武當道童[target -9.45977,49.6668,-3.19392,monster=64309](%d/3)",BoardCond = {10}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1459]]"聽兩位前輩對你的評價",BoardCond = {11}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1460]]"離開副本",BoardCond = {2}}
	}
}

Ectype.EctypeArgs[3004] =
{
	Name = --[[!AUTO_1461]]"副本追蹤",
	Desc = --[[!AUTO_1462]]"目標：在實戰中完成武當派“太極劍法”系列訓練",
	Args =
	{
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1463]]"大敵來犯，趕到@七星陣前[pos -15,-9]",BoardCond = {1}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1464]]"上前長按X鍵接下@鄭諭[target -8.247, 49.696, -7.436, monster=64645]的攻擊",BoardCond = {3}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1465]]"上前長按X鍵接下@鄭諭[target -8.247, 49.696, -7.436, monster=64645]的攻擊",BoardCond = {4}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1466]]"@上前[pos3 -10.0427,49.4105,8.39373]迎戰新的敵人",BoardCond = {5}},
		{ID = 15,Imageid = 10998,Desc = --[[!AUTO_1467]]"用~或Q鍵擊退@東廠役長[target -10.199,49.4105,8.51352,monster=64648](%SA[15]/3)\r和@東廠番役[target -10.199,49.4105,8.51352,monster=64649](%SA[16]/3)，然後繼續@備戰[pos3 -7.14918,49.5935,-9.28548]",BoardCond = {6}},
		{ID = 15,Imageid = 10998,Desc = --[[!AUTO_1468]]"用1或2鍵擊退@錦衣千戶[target -6.64444,49.59,-9.37029,monster=64650](%SA[15]/3)\r和@錦衣百戶[target -6.64444,49.59,-9.37029,monster=64651](%SA[16]/3)，然後繼續@備戰[pos3 4.43426,49.2505,7.00901]",BoardCond = {7}},
		{ID = 15,Imageid = 10998,Desc = --[[!AUTO_1469]]"嵩山高手來襲，快消滅@嵩山笠劍[target 4.78247,49.2502,6.96285,monster=64646](%SA[15]/3)\r和@嵩山蓑劍[target 4.78247,49.2502,6.96285,monster=64647](%SA[16]/3)",BoardCond = {8}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1470]]"靜觀嵩山和廠衛的人鎩羽而去",BoardCond = {9}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1471]]"離開副本",BoardCond = {2}}
	}
}

Ectype.EctypeArgs[3042] =
{
	Name = --[[!AUTO_1472]]"飛蛾洞",
	Desc = --[[!AUTO_1473]]"目標：突破百毒禁地飛蛾洞",
	Args =
	{
		{ID = 0,Imageid = 910,Desc = --[[!AUTO_1474]]"跳下平臺，踏入飛蛾洞",BoardCond = {1}},
		{ID = 0,Imageid = 1338,Desc = --[[!AUTO_1475]]"挑戰百蟲陣並進入大廳",BoardCond = {10}},
		{ID = 102,Imageid = 1338,Desc = --[[!AUTO_1476]]"進度 %d / 100",BoardCond = {10}},
		{ID = 0,Imageid = 920,Desc = --[[!AUTO_1477]]"摧毀大廳四周的蛾卵",BoardCond = {11}},
		{ID = 103,Imageid = 920,Desc = --[[!AUTO_1478]]"進度 %d / 15",BoardCond = {11}},
		{ID = 0,Imageid = 1338,Desc = --[[!AUTO_1479]]"擊敗百年蛾獸",BoardCond = {3}},
	}
}

Ectype.EctypeArgs[3043] =
{
	Name = --[[!AUTO_1480]]"蜘蛛巢",
	Desc = --[[!AUTO_1481]]"目標：突破百毒禁地蜘蛛巢",
	Args =
	{
		{ID = 0,Imageid = 910,Desc = --[[!AUTO_1482]]"沿著階梯前進，踏入蜘蛛巢",BoardCond = {1}},
		{ID = 0,Imageid = 10261,Desc = --[[!AUTO_1483]]"打破第一扇蜘蛛門",BoardCond = {4}},
		{ID = 0,Imageid = 10261,Desc = --[[!AUTO_1484]]"擊退所有攔路的蜘蛛，並且前往第二扇蜘蛛門",BoardCond = {12}},
		{ID = 0,Imageid = 10261,Desc = --[[!AUTO_1485]]"乘坐飛蛾坐騎前往巨大蛛網",BoardCond = {13}},
		{ID = 0,Imageid = 1322,Desc = --[[!AUTO_1486]]"擊敗千年狼蛛",BoardCond = {6}},
	}
}

Ectype.EctypeArgs[3044] =
{
	Name = --[[!AUTO_1487]]"蜈蚣穴",
	Desc = --[[!AUTO_1488]]"目標：突破百毒禁地蜈蚣穴",
	Args =
	{
		{ID = 0,Imageid = 910,Desc = --[[!AUTO_1489]]"沿著階梯前進，踏入蜈蚣穴",BoardCond = {1}},
		{ID = 0,Imageid = 9118,Desc = --[[!AUTO_1490]]"清除沿途的阻礙，向禁地深處進發",BoardCond = {8}},
		{ID = 0,Imageid = 9118,Desc = --[[!AUTO_1491]]"清除沿途更多的阻礙，前往禁地最深處",BoardCond = {14}},
		{ID = 0,Imageid = 9118,Desc = --[[!AUTO_1492]]"補給恢復後，前往百毒柱所在的平臺",BoardCond = {15}},
                {ID = 0,Imageid = 6540,Desc = --[[!AUTO_1493]]"擊敗萬年蜈蚣",BoardCond = {7}},
	}
}


Ectype.EctypeArgs[3048] =
{
	Name = --[[!AUTO_1494]]"副本追蹤",
	Desc = --[[!AUTO_1495]]"目標：擊敗飛狐三兄弟，奪取溪山行旅圖",
	Args =
	{
		{ID = 0,Imageid = 2103,Desc = --[[!AUTO_1496]]"前往山頂",BoardCond = {1,3,5,7}},
		{ID = 0,Imageid = 10223,Desc = --[[!AUTO_1497]]"全滅嵩山哨兵後前進",BoardCond = {2}},
		{ID = 0,Imageid = 16416,Desc = --[[!AUTO_1498]]"消滅飛狐女徒後前進",BoardCond = {4,10}},
		{ID = 0,Imageid = 16417,Desc = --[[!AUTO_1499]]"全滅梭鏢手後前進",BoardCond = {6,9,13}},
                {ID = 0,Imageid = 16856,Desc = --[[!AUTO_1500]]"擊殺白髮鬼",BoardCond = {8}},
		{ID = 0,Imageid = 16417,Desc = --[[!AUTO_1501]]"跳過山崖消滅梭鏢手",BoardCond = {11}},
		{ID = 0,Imageid = 10335,Desc = --[[!AUTO_1502]]"擊殺惡頭陀",BoardCond = {12}},
		{ID = 205,Imageid = 16416,Desc = --[[!AUTO_1503]]"飛狐女徒: %d/12",BoardCond = {14}},
		{ID = 0,Imageid = 16418,Desc = --[[!AUTO_1504]]"擊殺玉面飛狐",BoardCond = {15}},
                {ID = 0,Imageid = 2103,Desc = --[[!AUTO_1505]]"通關！",BoardCond = {16}},
	}
}

Ectype.EctypeArgs[3049] =
{
	Name = --[[!AUTO_1506]]"副本追蹤",
	Desc = --[[!AUTO_1507]]"目標：刺殺軍師鐵扇子賈儒",
	Args =
	{
		{ID = 0,Imageid = 1857,Desc = --[[!AUTO_1508]]"沿令狐沖所布鐵索爬上城頭",BoardCond = {1}},
		{ID = 0,Imageid = 10217,Desc = --[[!AUTO_1509]]"全滅城頭哨兵",BoardCond = {2}},
		{ID = 0,Imageid = 2103,Desc = --[[!AUTO_1510]]"下城牆繼續潛入",BoardCond = {3}},
		{ID = 0,Imageid = 1356,Desc = --[[!AUTO_1511]]"全滅校場叛兵",BoardCond = {4}},
                {ID = 0,Imageid = 16421,Desc = --[[!AUTO_1512]]"擊敗大刀王喜",BoardCond = {5}},
		{ID = 0,Imageid = 1377,Desc = --[[!AUTO_1513]]"全滅叛軍弩兵和步兵",BoardCond = {6}},
		{ID = 0,Imageid = 1377,Desc = --[[!AUTO_1514]]"全滅叛軍弩兵",BoardCond = {7}},
		{ID = 0,Imageid = 2103,Desc = --[[!AUTO_1515]]"前往觀星台",BoardCond = {8}},
		{ID = 0,Imageid = 16420,Desc = --[[!AUTO_1516]]"擊敗鐵扇子賈儒",BoardCond = {9}},
                {ID = 0,Imageid = 2103,Desc = --[[!AUTO_1517]]"通關！",BoardCond = {10}},
	}
}

Ectype.EctypeArgs[3050] =
{
	Name = --[[!AUTO_1518]]"副本追蹤",
	Desc = --[[!AUTO_1519]]"目標：刺殺總兵李安世和瓦剌萬戶",
	Args =
	{
		{ID = 0,Imageid = 10217,Desc = --[[!AUTO_1520]]"消滅前方敵兵前進",BoardCond = {1}},
		{ID = 0,Imageid = 2103,Desc = --[[!AUTO_1521]]"跳下城牆前進",BoardCond = {2}},
		{ID = 0,Imageid = 16857,Desc = --[[!AUTO_1522]]"消滅佈雷兵",BoardCond = {3}},
		{ID = 0,Imageid = 2103,Desc = --[[!AUTO_1523]]"沿城牆階梯前進",BoardCond = {4}},
                {ID = 0,Imageid = 16854,Desc = --[[!AUTO_1524]]"擊敗騎兵雁行陣",BoardCond = {5}},
		{ID = 0,Imageid = 2103,Desc = --[[!AUTO_1525]]"沿城牆階梯前進",BoardCond = {6}},
		{ID = 0,Imageid = 16854,Desc = --[[!AUTO_1526]]"擊敗騎兵鋒矢陣與步弓隊",BoardCond = {7}},
		{ID = 0,Imageid = 2103,Desc = --[[!AUTO_1527]]"沿城牆階梯前進",BoardCond = {8}},
		{ID = 0,Imageid = 16421,Desc = --[[!AUTO_1528]]"擊敗大刀兄弟",BoardCond = {9}},
                {ID = 0,Imageid = 1857,Desc = --[[!AUTO_1529]]"和令狐沖一同前進",BoardCond = {10}},
                {ID = 0,Imageid = 1857,Desc = --[[!AUTO_1530]]"和令狐沖一同前進",BoardCond = {11}},
                {ID = 0,Imageid = 1857,Desc = --[[!AUTO_1531]]"跳入被令狐沖劍氣炸開門的主殿",BoardCond = {17}},
                {ID = 0,Imageid = 10336,Desc = --[[!AUTO_1532]]"總兵李安世",BoardCond = {12}},
                {ID = 0,Imageid = 2103,Desc = --[[!AUTO_1533]]"從前方離開",BoardCond = {13}},
                {ID = 0,Imageid = 1396,Desc = --[[!AUTO_1534]]"擊敗瓦剌萬戶",BoardCond = {14}},
                {ID = 0,Imageid = 1396,Desc = --[[!AUTO_1535]]"擊敗瓦剌萬戶",BoardCond = {15}},
                {ID = 0,Imageid = 2103,Desc = --[[!AUTO_1536]]"通關！",BoardCond = {16}},
	}
}


Ectype.EctypeArgs[3001] =
{
	Name = --[[!AUTO_1537]]"副本追蹤",
	Desc = --[[!AUTO_1538]]"目標：完成普渡杖法系列訓練",
	Args =
	{
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1539]]"瞭解神行的操作",BoardCond = {3}, ArgsCond = {500,--[[!AUTO_1540]]"=",0}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1541]]"打碎@木柵門[target 22.691, 32.795, 51.398, monster = 63935]，準備練習神行",BoardCond = {3}, ArgsCond = {500,--[[!AUTO_1542]]"=",1}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1543]]"移動中按V鍵啟動神行，前往@木樁陣[pos3 36.964, 32.151, 7.339]",BoardCond = {4}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1544]]"聆聽方生介紹閃避操作",BoardCond = {5}, ArgsCond = {500,--[[!AUTO_1545]]"=",1}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1546]]"拉動@拉杆[target 33.776, 31.834, 9.553, mine = 63937]開始練習",BoardCond = {5}, ArgsCond = {500,--[[!AUTO_1547]]"=",2}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1548]]"按兩下WASD鍵閃避木樁的衝擊。",BoardCond = {6}, ArgsCond = {500,--[[!AUTO_1549]]"=",2}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1550]]"打碎@木柵門[target 29.005, 32.344, 8.33, monster = 63935]進行後續練習",BoardCond = {6}, ArgsCond = {500,--[[!AUTO_1551]]"=",3}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1552]]"聆聽方生講解後續訓練",BoardCond = {7}, ArgsCond = {500,--[[!AUTO_1553]]"=",3}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1554]]"攻擊任一@四劫樁[pos3 7.637, 31.486, -1.813]開始練習",BoardCond = {7}, ArgsCond = {500,--[[!AUTO_1555]]"=",4}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1556]]"連續攻擊，擊破@成住壞空四樁[pos3 7.472, 31.547, -6.090](%SA[103]/4)",BoardCond = {8}, ArgsCond = {500,--[[!AUTO_1557]]"=",4}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1558]]"擊破@劫字樁[pos3 7.445, 31.561, -7.076](%SA[104]/1)",BoardCond = {8}, ArgsCond = {500,--[[!AUTO_1559]]"=",5}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1560]]"巧用Q鍵2鍵技能擊破奔跑的@機關人[pos3 16.968, 32.001, -9.383](%SA[105]/1)",BoardCond = {9}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1561]]"巧用新技能擊破全部@“真”字機關人[pos3 6.853, 31.486, -2.505]和@“幻”字機關人[pos3 -6.443, 32.001, -24.223](%SA[106]/10)",BoardCond = {10}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1562]]"找到@方生[pos3 -10.590, 32.001, -23.918]，離開木人巷",BoardCond = {11}}
	}
}



Ectype.EctypeArgs[3002] =
{
	Name = --[[!AUTO_1563]]"副本追蹤",
	Desc = --[[!AUTO_1564]]"目標：完成羅漢拳法系列訓練",
	Args =
	{
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1565]]"聽方生介紹格擋訓練",BoardCond = {5}, ArgsCond = {500,--[[!AUTO_1566]]"=",0}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1567]]"拉動@機關[target -30.371, 32.301, -23.287, mine=63937]，啟動訓練",BoardCond = {5}, ArgsCond = {500,--[[!AUTO_1568]]"=",1}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1569]]"到@守門機關人[pos3 -30.795, 32.301, -28.5]面前接受考驗。",BoardCond = {5}, ArgsCond = {500,--[[!AUTO_1570]]"=",2}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1571]]"按住^ff7d2fX鍵^ffffff進行格擋，接住機關人的攻擊",BoardCond = {6}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1572]]"繼續@前進[pos3 6.039, 32.001, -21.82]，準備練習少林掌法。",BoardCond = {7}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1573]]"進入@場地中央[pos3 6.096, 31.564, -9.187]，準備開始訓練。",BoardCond = {8}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1574]]"用~鍵4鍵技能擊敗@降龍機關羅漢[target 6.891, 31.486, -2.851, monster=64542](%SA[102]/2)",BoardCond = {9}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1575]]"用Q鍵1鍵技能攻擊靠前的@伏虎機關羅漢[target -1.084, 31.907, -8.531, monster=64541]",BoardCond = {10}, ArgsCond = {500,--[[!AUTO_1576]]"=",2}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1577]]"擊敗所有@伏虎機關羅漢[target -1.084, 31.907, -8.531, monster=64541](%SA[103]/4)",BoardCond = {10}, ArgsCond = {500,--[[!AUTO_1578]]"=",3}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1579]]"瞄準木柵門，用2鍵技能將其擊破並順勢進入門內",BoardCond = {13}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1580]]"用3鍵技能攻擊聚集的敵人，擊破所有@機關羅漢[target 19.238, 32.218, -25.406, monster=64541](%SA[104]/6)",BoardCond = {11}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1581]]"找到@方生[pos3 -9.708, 32.001, -24.1325]，離開木人巷",BoardCond = {12}}
	}
}

Ectype.EctypeArgs[2284] =
{
	Name = --[[!AUTO_1582]]"副本追蹤",
	Desc = --[[!AUTO_1583]]"目標：探尋財寶",
	Args =
	{
		{ID = 201,Imageid = 12201,Desc = --[[!AUTO_1584]]"獲得金子：%d塊",BoardCond = {1,6}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1585]]"提示：在刷出的寶箱中，尋找並打碎與眾不同的寶箱，這樣就會獲得金子。如果出現盜寶賊人要迅速將他用麻袋捕捉，不然會損失金子。",BoardCond = {1,6}},
	}
}

Ectype.EctypeArgs[3063] =
{
	Name = --[[!AUTO_1586]]"副本追蹤",
	Desc = --[[!AUTO_1587]]"目標：前往映山渡，救出雲歌公主",
	Args =
	{
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1588]]"前往映山渡",BoardCond = {1}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1589]]"在一旁潛伏，等待時機",BoardCond = {2}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1590]]"與侍衛一起保護@雲歌公主[pos 65,32]",BoardCond = {3}},
		{ID = 15,Imageid = 10998,Desc = --[[!AUTO_1591]]"打敗@百帝丹朱[pos 66,35](%d/1)",BoardCond = {4}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1592]]"離開副本",BoardCond = {5}}
	}
}

Ectype.EctypeArgs[3064] =
{
	Name = --[[!AUTO_1593]]"副本追蹤",
	Desc = --[[!AUTO_1594]]"目標：找出左英",
	Args =
	{
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1595]]"前往雲水間",BoardCond = {1}},
		{ID = 112,Imageid = 10998,Desc = --[[!AUTO_1596]]"擊殺@左英侍妾[pos 308,71](%d/4)",BoardCond = {3}},
		{ID = 15,Imageid = 10998,Desc = --[[!AUTO_1597]]"擊殺@左英[pos 308,69](%d/1)",BoardCond = {4}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1598]]"離開副本",BoardCond = {2}}
	}
}

Ectype.EctypeArgs[3058] =
{
	Name = --[[!AUTO_1599]]"副本追蹤",
	Desc = --[[!AUTO_1600]]"目標：登上海船，追擊嵩山丁勉。",
	Args =
	{
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1601]]"使用@輕功[target 113.911, 31.396, -186.146, mine=72921]，衝上船頭",BoardCond = {18}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1602]]"前往@船頭[pos 241.017,-295.505]，不殺丁勉誓不甘休！",BoardCond = {5}},
		{ID = 15,Imageid = 10998,Desc = --[[!AUTO_1603]]"打敗左挺派出的\r@嵩山護衛[target 257.087, 43.027, -287.502,monster=66399](%SA[405]/2)和@嵩山劍衛[target 257.087, 43.027, -287.502,monster=65944](%SA[401]/6)",BoardCond = {6}},
		{ID = 15,Imageid = 10998,Desc = --[[!AUTO_1604]]"打敗左挺派出的\r@嵩山護衛[target 257.087, 43.027, -287.502,monster=66399](%SA[405]/2)和@嵩山劍衛[target 257.087, 43.027, -287.502,monster=65944](%SA[401]/6)",BoardCond = {13}},
		{ID = 15,Imageid = 10998,Desc = --[[!AUTO_1605]]"打敗左挺派出的\r@嵩山護衛[target 257.087, 43.027, -287.502,monster=66399](%SA[405]/2)和@嵩山劍衛[target 257.087, 43.027, -287.502,monster=65944](%SA[401]/6)",BoardCond = {14}, ArgsCond = {407,--[[!AUTO_1606]]"=",0}},
		{ID = 15,Imageid = 10998,Desc = --[[!AUTO_1607]]"擊敗@左挺[target 257.265, 43.0007, -287.601,monster=65946](%SA[402]/1)",BoardCond = {14}, ArgsCond = {407,--[[!AUTO_1608]]"=",1}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1609]]"前往@船頭[pos 276.011,-279.065]，直面丁勉。",BoardCond = {7}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1610]]"盡展生平所學，同嵩山@丁勉[target 280.203, 46.0977, -276.959,monster=65945]決戰！！",BoardCond = {8}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1611]]"再度@上前[pos3 276.16 46.0977 -279.26]，擊敗丁勉！",BoardCond = {12}},
		{ID = 15,Imageid = 10998,Desc = --[[!AUTO_1612]]"眾志成城，集天下英雄之力，誓殺@丁勉[target 280.203, 46.0977, -276.959,monster=65945]，為鄉親父老報仇！",BoardCond = {9}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1613]]"船頭之處，似乎有可以滑翔的@機關鳥[pos3 307.601, 50.909, -260.583]。",BoardCond = {10}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1614]]"乘此@機關鳥[target 307.601, 50.909, -260.583, mine=66322]，天際翱翔，返回福州！。",BoardCond = {11}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1615]]"離開副本",BoardCond = {2}}
	}
}

Ectype.EctypeArgs[3005] =
{
	Name = --[[!AUTO_1616]]"副本追蹤",
	Desc = --[[!AUTO_1617]]"目標：完成逍遙小無相功系列訓練",
	Args =
	{
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1618]]"聽師姐簫丹諾介紹神行的操作",BoardCond = {1}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1619]]"聽師姐簫丹諾介紹神行的操作",BoardCond = {3}, ArgsCond = {500,--[[!AUTO_1620]]"=",0}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1621]]"@上前[pos3 0.507, 45.218, -35.501]練習神行",BoardCond = {3}, ArgsCond = {500,--[[!AUTO_1622]]"=",1}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1623]]"移動中按V鍵啟動神行，追上@簫丹諾[pos3 2.178, 45.773, 18.741]",BoardCond = {4}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1624]]"聽師姐介紹閃避的操作",BoardCond = {5}, ArgsCond = {500,--[[!AUTO_1625]]"=",1}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1626]]"@上前[pos3 0.892, 45.839, 5.080]吸引敵人的攻擊，為師姐爭取時間",BoardCond = {5}, ArgsCond = {500,--[[!AUTO_1627]]"=",2}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1628]]"按兩下WASD鍵閃避飛鏢，等待師姐捉住偷襲的人。",BoardCond = {6}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1629]]"瞭解攻擊的策略",BoardCond = {7}, ArgsCond = {500,--[[!AUTO_1630]]"=",2}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1631]]"按師姐指引攻擊@沙天江[target 1.380, 45.878, -4.803, monster=65689]",BoardCond = {7}, ArgsCond = {500,--[[!AUTO_1632]]"=",3}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1633]]"用~鍵Q鍵技能擊敗@沙天江[target 1.380, 45.878, -4.803, monster=65689](%SA[103]/1)。^FFFF00可利用技能的冰寒效果且退且打。",BoardCond = {8}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1634]]"用1鍵3鍵技能擊敗@沙天江[target 1.380, 45.878, -4.803, monster=65689](%SA[103]/1)。^FFFF00按兩下技能鍵可快速頂起無相盾。",BoardCond = {9}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1635]]"用2鍵4鍵技能擊敗沙天江帶來的@嵩山派弟子[target 1.103, 45.867, -1.71, monster=65690](%SA[105]/8)",BoardCond = {10}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1636]]"離開@玉仙洞[pos3 1.903, 45.758, 22.75]",BoardCond = {11}}
	}
}

Ectype.EctypeArgs[3006] =
{
	Name = --[[!AUTO_1637]]"副本追蹤",
	Desc = --[[!AUTO_1638]]"目標：完成逍遙天山六陽掌系列訓練",
	Args =
	{
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1639]]"聽從師姐簫丹諾的安排",BoardCond = {1,3}, ArgsCond = {500,--[[!AUTO_1640]]"=",0}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1641]]"與眾徒@行禮[target 0.689, 46.048, -1.613, mine=66675]，準備切磋。",BoardCond = {3}, ArgsCond = {500,--[[!AUTO_1642]]"=",1}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1643]]"@上前[pos3 0.232, 45.837, 6.463]格擋眾徒的攻擊",BoardCond = {3}, ArgsCond = {500,--[[!AUTO_1644]]"=",2}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1645]]"按住X鍵格擋眾徒的攻擊",BoardCond = {4}, ArgsCond = {500,--[[!AUTO_1646]]"=",2}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1647]]"找到@簫丹諾[pos3 10.537, 45.798, 0.765]，聽她安排",BoardCond = {4,5}, ArgsCond = {500,--[[!AUTO_1648]]"=",3}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1649]]"@上前[pos3 0.232, 45.837, 6.463]與眾徒切磋武藝。",BoardCond = {5}, ArgsCond = {500,--[[!AUTO_1650]]"=",4}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1651]]"練習使用~鍵Q鍵技能，擊敗@逍遙弟子[target 0.232, 45.837, 6.463, monster=66381](%SA[103]/6)",BoardCond = {6}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1652]]"巧用3鍵4鍵技能擊敗首徒@習狄[target 0.232, 45.837, 6.463, monster=66382](%SA[104]/1)",BoardCond = {7}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1653]]"巧用1鍵2鍵技能和其他技能，擊敗全部@逍遙弟子[target 0.232, 45.837, 6.463, monster=66381](%SA[105]/10)",BoardCond = {8}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1654]]"@離開[pos3 1.457, 45.888, -10.827]玉仙洞",BoardCond = {9}}
	}
}

Ectype.EctypeArgs[3305] =
{
	Name = --[[!AUTO_1655]]"副本追蹤",
	Desc = --[[!AUTO_1656]]"目標：按師姐刀蕊指點，完成五仙教試煉",
	Args =
	{
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1657]]"擊碎堵路的@路障[target 45.715, 34.309, -2.161, monster=62520](%SA[201]/1)",BoardCond = {1}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1658]]"瞭解神行操作",BoardCond = {3}, ArgsCond = {500,--[[!AUTO_1659]]"=",0}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1660]]"@上前[pos3 38.219, 35.405, -1.98]準備用神行沖過佈滿蜘蛛的走道",BoardCond = {3}, ArgsCond = {500,--[[!AUTO_1661]]"=",1}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1662]]"移動中按V鍵啟動神行，@穿過走道[pos3 25.248, 40.302, 28.828]。",BoardCond = {4}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1663]]"瞭解閃避操作",BoardCond = {5}, ArgsCond = {500,--[[!AUTO_1664]]"=",1}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1665]]"@上前[pos3 26.616, 40.319, 39.263]閃避敵人攻擊牽制他們的注意力",BoardCond = {5}, ArgsCond = {500,--[[!AUTO_1666]]"=",2}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1667]]"按兩下WASD鍵閃避攻擊",BoardCond = {6}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1668]]"瞭解戰鬥策略",BoardCond = {7}, ArgsCond = {500,--[[!AUTO_1669]]"=",2}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1670]]"@上前[pos3 18.553, 40.301, 28.296]與敵人作戰",BoardCond = {7}, ArgsCond = {500,--[[!AUTO_1671]]"=",3}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1672]]"按提示擊敗@百藥門毒師[target 19.726, 40.629, 28.38, monster=68203](%SA[201]/2)",BoardCond = {8}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1673]]"按提示擊敗@百藥門毒師[target 7.414, 36.451, 18.321, monster=68203](%SA[201]/2)和@百藥門技工[target 7.414, 36.451, 18.321, monster=68204](%SA[202]/4)",BoardCond = {9}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1674]]"按提示擊敗百藥門操蟲師@姬無味[target -16.632, 38.001, 15.998, monster=68202](%SA[201]/1)",BoardCond = {10}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1675]]"試煉完成，@離開[pos3 -3.333, 38.307, 11.807]金蠶谷",BoardCond = {11}}
	}
}

Ectype.EctypeArgs[3306] =
{
	Name = --[[!AUTO_1676]]"副本追蹤",
	Desc = --[[!AUTO_1677]]"目標：按師姐刀蕊指點，完成五仙教試煉",
	Args =
	{
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1678]]"先行@前進[pos3 43.512, 34.363, -1.835]，尋找金蠶谷異變之因",BoardCond = {1}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1679]]"走左側@小路[pos3 32.894, 35.411, -5.885]，避開蔓延的劣等蠱蟲",BoardCond = {3}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1680]]"瞭解格擋操作",BoardCond = {4}, ArgsCond = {500,--[[!AUTO_1681]]"=",0}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1682]]"@上前[pos3 26.545, 34.812, -12.207]牽制敵人",BoardCond = {4}, ArgsCond = {500,--[[!AUTO_1683]]"=",1}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1684]]"按住X鍵格擋劣等蠱蟲的攻擊",BoardCond = {5}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1685]]"做好準備，@上前[pos3 21.113, 34.308, -15.597]攻擊毒母蠱蛛",BoardCond = {6}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1686]]"按提示攻擊@毒母蠱蛛[target 21.113, 34.308, -15.597, monster=68576]使其逃跑(%SA[201]/1)",BoardCond = {7}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1687]]"繼續前進，@跟上[pos3 12.59, 33.542, -26.167]逃跑的毒母蠱蛛",BoardCond = {8}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1688]]"按提示殺死被毒母喚出的@劣蠍蠱[target 12.59, 33.542, -26.167, monster=68573]和@劣蟾蠱[target 12.59, 33.542, -26.167, monster=68574]\r已殺死(%SA[203]/3)批",BoardCond = {9}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1689]]"繼續前進，@跟上[pos3 4.287, 33.801, -35.015]逃跑的毒母蠱蛛",BoardCond = {10}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1690]]"按提示殺死百藥門操控的@毒母蠱蛛[target 5.769, 34.022, -52.136, monster=68576](%SA[201]/1)和@受控的毒蛛[target 5.769, 34.022, -52.136, monster=70575](%SA[202]/4)",BoardCond = {11}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1691]]"待刀蕊處決百藥門人後，離開@金蠶谷[pos3 4.445, 33.801, -36.039]",BoardCond = {12}}
	}
}

Ectype.EctypeArgs[3303] =
{
	Name = --[[!AUTO_1692]]"副本追蹤",
	Desc = --[[!AUTO_1693]]"目標：在煙雨七君子的樂聲中，體會學習迴風落雁劍",
	Args =
	{
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1694]]"等待小師妹帶你進入現場",BoardCond = {1}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1695]]"準備使用神行，先@跟上[pos3 20.691, 65.237, -8.720]小師妹。",BoardCond = {3}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1696]]"使用神行，到達@觀眾位置[pos3 -6.585, 74.158, 37.735]",BoardCond = {4}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1697]]"靜候煙雨七君子到來",BoardCond = {5}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1698]]"到@七君子面前[pos3 -5.653, 73.369, -2.19]，參與開場並與他們過招",BoardCond = {14}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1699]]"按兩下WASD鍵閃避七君子發射的劍氣",BoardCond = {6}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1700]]"上前與七君子@過招[pos3 -6.315, 73.371, -13.37]，領會迴風落雁劍。",BoardCond = {7}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1701]]"用迴風落雁劍的招式擊退@七君子成員[target -6.315, 73.371, -13.37, monster=70739](%SA[201]/2)",BoardCond = {8}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1702]]"用迴風落雁劍的招式擊退@七君子成員[target -6.315, 73.371, -13.37, monster=70739](%SA[201]/1)",BoardCond = {9}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1703]]"用迴風落雁劍的招式擊退@七君子成員[target -6.315, 73.371, -13.37, monster=70739](%SA[201]/1)",BoardCond = {10}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1704]]"用迴風落雁劍的招式擊退@七君子成員[target -6.315, 73.371, -13.37, monster=70739](%SA[201]/1)",BoardCond = {11}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1705]]"用迴風落雁劍的招式擊退@七君子成員[target -6.315, 73.371, -13.37, monster=70739](%SA[201]/2)",BoardCond = {12}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1706]]"@離開[pos3 16.258, 68.814, -1.981]天淵峽",BoardCond = {13}},

	}
}

Ectype.EctypeArgs[3304] =
{
	Name = --[[!AUTO_1707]]"副本追蹤",
	Desc = --[[!AUTO_1708]]"目標：向煙雨七君子百變幻霧劍法",
	Args =
	{
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1709]]"等待七君子做出安排",BoardCond = {1}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1710]]"走上石階，進行@格擋訓練[pos3 20.516, 67.279, -3.344]",BoardCond = {3}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1711]]"按住X鍵格擋七君子的攻擊",BoardCond = {4}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1712]]"走上@石階[pos3 -3.344, 73.304, -1.396]與七君子作戰",BoardCond = {6}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1713]]"與@七君子[target -8.195, 73.348, 2.921, monster= 70744](%SA[201]/3)過招，領會百變幻霧劍法",BoardCond = {7}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1714]]"與@七君子[target -3.217, 73.301, 8.489, monster= 70744](%SA[202]/2)過招，領會百變幻霧劍法",BoardCond = {8}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1715]]"與@七君子[target -3.831, 73.322, 20.13, monster= 70744](%SA[202]/2)過招，領會百變幻霧劍法",BoardCond = {9}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1716]]"@離開[pos3 5.901, 73.383, -1.293]天淵峽",BoardCond = {10}},

	}
}

Ectype.EctypeArgs[3307] =
{
	Name = --[[!AUTO_1717]]"副本追蹤",
	Desc = --[[!AUTO_1718]]"目標：聽異人指點峨嵋派“滅絕摧心手”系列訓練",
	Args =
	{
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1719]]"耐心聽聽楊先生要說什麼",BoardCond = {1}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1720]]"進入@起跑位[pos3 31.24,56.28,-19.16]",BoardCond = {3}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1721]]"移動時按V鍵追趕楊先生，到達@寒潭深處[pos3 -6.90,59.09,1.89]",BoardCond = {4}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1722]]"仔細聽楊先生口述",BoardCond = {5}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1723]]"按兩下WASD鍵，閃避蘇滄沫的白骨爪，持續30秒",BoardCond = {6}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1724]]"聆聽蘇滄沫盜經的緣由",BoardCond = {7}},
		{ID = 15,Imageid = 10998,Desc = --[[!AUTO_1725]]"按照楊先生所述，速速用~鍵或Q鍵招數對付@青城弟子[target -6.37902,59.2672,-3.76677,monster=70541](%d/3)",BoardCond = {8}},
		{ID = 15,Imageid = 10998,Desc = --[[!AUTO_1726]]"繼續用1鍵或2鍵招數對付@青城狂劍[target -6.22239,59.2672,-5.34546,monster=70542](%d/3)",BoardCond = {9}},
		{ID = 15,Imageid = 10998,Desc = --[[!AUTO_1727]]"使用3鍵或4鍵技能，徹底制服@蘇滄沫[target -5.97061,59.2712,-9.0766,monster=70543](%d/3)",BoardCond = {10}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1728]]"聽兩位前輩，看他們如何安排",BoardCond = {11}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1729]]"離開副本",BoardCond = {2}}
	}
}

Ectype.EctypeArgs[3308] =
{
	Name = --[[!AUTO_1730]]"副本追蹤",
	Desc = --[[!AUTO_1731]]"目標：掌門了塵師太學習“金頂炎陽掌”修煉法門",
	Args =
	{
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1732]]"嵩山副掌門帶人來襲，與了塵師太等人匯合",BoardCond = {1,3}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1733]]"上前長按X鍵接下@湯英鶚[target -18.0513,59.2912,-2.35468,monster=70652]的攻擊，持續30秒",BoardCond = {4}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1734]]"且看湯英鶚還有什麼詭計",BoardCond = {5}},
		{ID = 15,Imageid = 10998,Desc = --[[!AUTO_1735]]"用~或Q鍵擊退@嵩山飛星劍[target -12.5702,59.2712,-2.0002,monster=70650](%d/6)",BoardCond = {6}},
		{ID = 15,Imageid = 10998,Desc = --[[!AUTO_1736]]"用1或2鍵擊退@嵩山逐月劍[target 0.152223,59.2712,-2.56893,monster=70651](%d/6)",BoardCond = {7}},
		{ID = 15,Imageid = 10998,Desc = --[[!AUTO_1737]]"湯英鶚氣急敗壞親自殺來，擊敗@這廝[target -18.0513,59.2912,-2.35468,monster=70652](%d/1)",BoardCond = {8}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1738]]"聽聽了塵師太的評價",BoardCond = {9}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1739]]"離開副本",BoardCond = {2}}
	}
}


Ectype.EctypeArgs[3054] =
{
	Name = --[[!AUTO_1740]]"副本追蹤",
	Desc = --[[!AUTO_1741]]"目標：阻止五仙和唐門兩敗俱傷！",
	Args =
	{
		{ID = 15,Imageid = 10998,Desc = --[[!AUTO_1742]]"擊退唐門弟子召出的@霹靂機甲人[pos 36,284](%d/1)，阻止兩派相爭",BoardCond = {1}},
		{ID = 15,Imageid = 10998,Desc = --[[!AUTO_1743]]"擊退藍鳳凰召出的@蠱王[pos 44,278](%d/1)，阻止兩派相爭",BoardCond = {3}}
	}
}

Ectype.EctypeArgs[3055] =
{
	Name = --[[!AUTO_1744]]"副本追蹤",
	Desc = --[[!AUTO_1745]]"目標：救出艾瑪！",
	Args =
	{
		{ID = 15,Imageid = 10998,Desc = --[[!AUTO_1746]]"殺死@高克新[pos -358,268](%d/1)，救出艾瑪",BoardCond = {1}}
	}
}

Ectype.EctypeArgs[3066] =
{
	Name = --[[!AUTO_1747]]"副本追蹤",
	Desc = --[[!AUTO_1748]]"目標：收集彈藥",
	Args =
	{
		{ID = 201,Imageid = 14125,Desc = --[[!AUTO_1749]]"已收集彈藥：%d/20",BoardCond = {1,2}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1750]]"提示：每一輪轟炸過後，會出現一些啞火彈藥，請速速收集，不然它們很快就會被賊人收回的。",BoardCond = {1,2}},
	}
}

Ectype.EctypeArgs[1980] =
{
	Name = --[[!AUTO_1751]]"副本追蹤",
	Desc = --[[!AUTO_1752]]"目標：劫法場救人",
	Args =
	{
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1753]]"等待山寨人員到齊",BoardCond = {1}, ArgsCond = {520,--[[!AUTO_1754]]"=",0}},
		{ID = 509,Imageid = 10319,Desc = --[[!AUTO_1755]]"明軍步兵: %d/160",BoardCond = {1}, ArgsCond = {520,--[[!AUTO_1756]]"=",1}},
		{ID = 503,Imageid = 10319,Desc = --[[!AUTO_1757]]"劊子手: %d/4",BoardCond = {1}, ArgsCond = {520,--[[!AUTO_1758]]"=",4}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1759]]"解救囚籠中的兄弟",BoardCond = {1}, ArgsCond = {520,--[[!AUTO_1760]]"=",2}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1761]]"提示：囚籠內有可能是偽裝的東廠公公，有可能是被陷害的忠良 \r成功解救囚籠：%SA[523]/4",BoardCond = {1}, ArgsCond = {520,--[[!AUTO_1762]]"=",3}},
	}
}

Ectype.EctypeArgs[3046] =
{
	Name = --[[!AUTO_1763]]"梅莊地牢",
	Desc = --[[!AUTO_1764]]"目標：在地牢深處營救任我行",
	Args =
	{
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1765]]"與向問天交談",BoardCond = {1}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1766]]"前往地下畫房",BoardCond = {2}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1767]]"通過地下畫房的考驗",BoardCond = {3}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1768]]"前往地下書房",BoardCond = {4}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1769]]"通過地下書房的考驗",BoardCond = {5}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1770]]"前往地下棋房",BoardCond = {6}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1771]]"通過地下棋房的考驗",BoardCond = {7}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1772]]"前往地下琴房",BoardCond = {8}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1773]]"挑戰黃忠公",BoardCond = {9}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1774]]"沿秘道前往地牢深處",BoardCond = {10}},
		{ID = 201,Imageid = 18110,Desc = --[[!AUTO_1775]]"擊敗伏兵:%d/18",BoardCond = {11}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1776]]"在水淹沒地牢前向高處逃脫",BoardCond = {12}},
		{ID = 0,Imageid = 18111,Desc = --[[!AUTO_1777]]"擊毀欄在前方的機關門",BoardCond = {13}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1778]]"在水淹沒地牢前向高處逃脫",BoardCond = {14}},
		{ID = 0,Imageid = 18111,Desc = --[[!AUTO_1779]]"擊毀欄在前方的機關門",BoardCond = {15}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1780]]"在水淹沒地牢前向高處逃脫",BoardCond = {16}},
		{ID = 0,Imageid = 18111,Desc = --[[!AUTO_1781]]"擊毀欄在前方的機關門",BoardCond = {17}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1782]]"在水淹沒地牢前向高處逃脫",BoardCond = {18}},
		{ID = 0,Imageid = 18111,Desc = --[[!AUTO_1783]]"擊毀欄在前方的機關門",BoardCond = {19}},
		{ID = 202,Imageid = 18110,Desc = --[[!AUTO_1784]]"擊敗大廳中的信徒：%d/60",BoardCond = {20}},
		{ID = 203,Imageid = 20110,Desc = --[[!AUTO_1784]]"擊敗大廳中的力士：%d/6",BoardCond = {20}},
		{ID = 204,Imageid = 18108,Desc = --[[!AUTO_1785]]"戰勝黑白傀儡：%d/2",BoardCond = {21}},
		{ID = 205,Imageid = 10998,Desc = --[[!AUTO_1786]]"只有巨劍可以摧毀任我行的心魔，擊毀束縛巨劍的鎖鏈：%d/3",BoardCond = {22}},
		{ID = 0,Imageid = 1941,Desc = --[[!AUTO_1787]]"論功行賞",BoardCond = {23}},
	}
}

Ectype.EctypeArgs[3068] =
{
	Name = --[[!AUTO_1788]]"梅莊地牢",
	Desc = --[[!AUTO_1789]]"目標：前往梅莊水下尋找地牢",
	Args =
	{
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1790]]"與向問天交談",BoardCond = {1}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1791]]"前往地下畫房",BoardCond = {2}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1792]]"通過地下畫房的考驗",BoardCond = {3}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1793]]"前往地下書房",BoardCond = {4}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1794]]"通過地下書房的考驗",BoardCond = {5}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1795]]"前往地下棋房",BoardCond = {6}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1796]]"通過地下棋房的考驗",BoardCond = {7}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1797]]"前往地下琴房",BoardCond = {8}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1798]]"挑戰黃忠公",BoardCond = {9}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1799]]"沿秘道前往地牢深處",BoardCond = {10}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1800]]"擊敗伏兵",BoardCond = {11}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1801]]"在水淹沒地牢前向高處逃脫",BoardCond = {12}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1802]]"擊毀欄在前方的機關",BoardCond = {13}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1803]]"在水淹沒地牢前向高處逃脫",BoardCond = {14}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1804]]"擊毀欄在前方的機關",BoardCond = {15}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1805]]"在水淹沒地牢前向高處逃脫",BoardCond = {16}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1806]]"擊毀欄在前方的機關",BoardCond = {17}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1807]]"在水淹沒地牢前向高處逃脫",BoardCond = {18}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1808]]"擊毀欄在前方的機關",BoardCond = {19}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1809]]"擊敗大廳中的信徒",BoardCond = {20}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1810]]"戰勝雙子護衛",BoardCond = {21}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1811]]"讓任我行的靈魂歸元",BoardCond = {22}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1812]]"論功行賞",BoardCond = {23}},
	}
}

Ectype.EctypeArgs[3380] =
{
	Name = --[[!AUTO_1813]]"副本追蹤",
	Desc = --[[!AUTO_1814]]"目標：代替令狐沖鑒定群雄送來的寶物",
	Args =
	{
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1815]]"跟隨@司馬大[pos3 -9.9,139.8,215]，聽聽他要說些什麼！",BoardCond = {1}},
		{ID = 15,Imageid = 10998,Desc = --[[!AUTO_1816]]"打碎一旁魯東名醫的@寶盒[target -9.9,139.8,215,monster=70488](%d/6)，看看裡面有什麼！",BoardCond = {3}},
		{ID = 15,Imageid = 10998,Desc = --[[!AUTO_1817]]"鸚鵡偷吃了神果，收服@它[target -9.9,139.8,215,monster=70750](%d/1)。",BoardCond = {4}},
		{ID = 15,Imageid = 10998,Desc = --[[!AUTO_1818]]"跟隨@司馬大[pos3 -31.5,146,236]，打碎群雄送來的@寶盒[target -31.5,146,236,monster=70489](%d/2)，看看裡面有什麼！",BoardCond = {5}},
		{ID = 16,Imageid = 10998,Desc = --[[!AUTO_1819]]"打碎蒲三石和段二爺等人送來的@寶盒[target -31.5,146,236,monster=70488](%d/4)，，看看裡面有什麼！",BoardCond = {5}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1820]]"寶盒中的兩樣寶物，一樣是@靈芝仙草[target -31.5,146,236,mine=70577]，一樣是@雪鐮螳螂[target -31.5,146,236,mine=70582]，慎重考慮，採集之。不過，無論怎麼選擇都會得罪另一撥人。",BoardCond = {105}},
		{ID = 16,Imageid = 10998,Desc = --[[!AUTO_1821]]"如若選擇的是靈芝仙草，則需擊敗@段二爺[target -31.5,146,236,monster=68079](%d/1)",BoardCond = {15}},
		{ID = 15,Imageid = 10998,Desc = --[[!AUTO_1822]]"如若選擇的是雪鐮螳螂，則需擊敗其@同伴[target -31.5,146,236,monster=68080](%d/3)",BoardCond = {15}},
		{ID = 15,Imageid = 10998,Desc = --[[!AUTO_1823]]"跟隨@司馬大[pos3 -41.8,139,210]，打碎群雄送來的@寶盒[target -41.8,139,210,monster=70489](%d/2)，看看裡面有什麼！",BoardCond = {6}},
		{ID = 16,Imageid = 10998,Desc = --[[!AUTO_1824]]"打碎桐揚帆和東洋刀客等人送來的@寶盒[target -41.8,139,210,monster=70488](%d/4)，看看裡面有什麼！",BoardCond = {6}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1825]]"從@續命蟲卵[target -41.8,139,210,mine=70590]和@救命石[target -41.8,139,210,mine=70589]中選擇寶物，可選擇一樣，也可都要，不過……",BoardCond = {106}},
		{ID = 15,Imageid = 10998,Desc = --[[!AUTO_1826]]"如若選擇的是續命蟲卵，則需擊敗@蛾皇[target -41.8,139,210,monster=68082]",BoardCond = {16}},
		{ID = 16,Imageid = 10998,Desc = --[[!AUTO_1827]]"如若選擇的是救命石，則需擊敗@東洋刀客[target -41.8,139,210,monster=68078]",BoardCond = {16}},
		{ID = 17,Imageid = 10998,Desc = --[[!AUTO_1828]]"如若選擇的是救命石，則需擊敗東洋刀客的同夥@卞崖棄[target -41.8,139,210,monster=68081]",BoardCond = {16}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1829]]"閣下震懾群雄，五霸崗好事者都服你了",BoardCond = {2}},

	}
}


Ectype.EctypeArgs[3381] =
{
	Name = --[[!AUTO_1830]]"副本追蹤",
	Desc = --[[!AUTO_1831]]"目標：擊敗眼前所謂的正派人士，掩護令狐沖和“聖姑”離開。",
	Args =
	{
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1832]]"協助令狐沖，掩護“聖姑”離開！",BoardCond = {1}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1833]]"隨同令狐沖、聖姑，走下@五霸崗[pos 7.37,193.04]！",BoardCond = {13}},
		{ID = 15,Imageid = 10998,Desc = --[[!AUTO_1834]]"易國梓前來挑釁，他要戰，那便戰！擊敗@易國梓[target 13.54,140,198.517,monster=68074](%d/1)。",BoardCond = {3}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1835]]"繼續@向前[pos 52.10,173.80]",BoardCond = {14}},
		{ID = 15,Imageid = 10998,Desc = --[[!AUTO_1836]]"公道？正義？多少罪惡假汝之名？擊退@覺月[target 61,135,171,monster=68075]",BoardCond = {4}},
		{ID = 16,Imageid = 10998,Desc = --[[!AUTO_1837]]"擊退@辛國梁[target 61,135,171,monster=68073]。",BoardCond = {4}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1838]]"護送兩人，繼續@前進[pos 96.02,121]",BoardCond = {15}},
		{ID = 15,Imageid = 10998,Desc = --[[!AUTO_1839]]"@譚迪人[target 96.02,124,121,monster=68072](%d/1)想趁你連番惡戰之際，擊敗你揚名立萬！此等宵小，自當擊殺之。",BoardCond = {5}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1840]]"強敵已退，到崗下和令狐沖等人會合",BoardCond = {2}}
	}
}

Ectype.EctypeArgs[3483] =
{
	Name = --[[!AUTO_1841]]"副本追蹤",
	Desc = --[[!AUTO_1842]]"目標：護衛令狐沖、任盈盈！",
	Args =
	{
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1843]]"在五霸寺中歇息，不想遇到少林門人，且聽他們要說些什麼。",BoardCond = {1}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1844]]"在五霸寺中歇息，不想遇到少林門人，且聽他們要說些什麼。",BoardCond = {3}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1845]]"在五霸寺中歇息，不想遇到少林門人，且聽他們要說些什麼。",BoardCond = {4}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1846]]"少林門人欺人太甚，伸手點指辛國梁，說出實情！^ff7d2f點中辛國梁，使用表情動作手指前方。^ffffff",BoardCond = {5}},
		{ID = 15,Imageid = 10998,Desc = --[[!AUTO_1847]]"擊敗少林門人@辛國梁[target -298.015, 48.6682, -264.877,monster=67927](%d/1)",BoardCond = {6}},
		{ID = 16,Imageid = 10998,Desc = --[[!AUTO_1848]]"擊敗少林門人@易國梓[target -301.31, 48.6604, -262.589,monster=67933](%d/1)",BoardCond = {6}},
		{ID = 17,Imageid = 10998,Desc = --[[!AUTO_1849]]"擊敗少林門人@覺月[target -305.42, 48.6624, -263.042,monster=67945](%d/1)",BoardCond = {6}},
		{ID = 15,Imageid = 10998,Desc = --[[!AUTO_1850]]"擊退@方生大師[target -308.562, 48.6586, -268.801,monster=67765]",BoardCond = {7}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1851]]"拱手施禮，請求方生見諒！請他帶令狐沖上少林療傷！^ff7d2f點中方生大師，使用表情動作抱拳。^ffffff",BoardCond = {8}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1852]]"離開副本",BoardCond = {2}}
	}
}

Ectype.EctypeArgs[3479] =
{
	Name = --[[!AUTO_1853]]"副本追蹤",
	Desc = --[[!AUTO_1854]]"目標：小猴子轉眼間變成齊天大聖，怪哉!",
	Args =
	{
		{ID = 15,Imageid = 10998,Desc = --[[!AUTO_1855]]"擊敗@齊天大聖[target -49.5637,40.3126,-85.7956,monster=68205](%d/1)",BoardCond = {1}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1856]]"離開副本",BoardCond = {2}},
	}
}

Ectype.EctypeArgs[3533] =
{
	Name = --[[!AUTO_1857]]"副本追蹤",
	Desc = --[[!AUTO_1858]]"目標：點燃火藥桶，炸飛嵩山派籌備弟子，擊殺鄧八公，摧毀嵩山派的陰謀！",
	Args =
	{
		{ID = 15,Imageid = 10998,Desc = --[[!AUTO_1859]]"點燃@火藥桶[target 357.55,66.7417,-91.4785, mine=72254]，除掉嵩山籌備弟子(%d/40)。",BoardCond = {1}},
		{ID = 16,Imageid = 10998,Desc = --[[!AUTO_1860]]"擊殺@鄧八公[target 406.611, 67.594, -51.1573, monster=55679](%d/1)",BoardCond = {3}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1861]]"離開副本",BoardCond = {2}}
	}
}

Ectype.EctypeArgs[3536] =
{
	Name = --[[!AUTO_1862]]"副本追蹤",
	Desc = --[[!AUTO_1863]]"目標：拖住梅莊四友，為向問天營救任我行爭取時間",
	Args =
	{
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1864]]"四友齊聚，靜觀其變",BoardCond = {1}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1865]]"四友齊聚，靜觀其變",BoardCond = {3}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1866]]"按照順序，敲擊五音銅鐘，順序錯誤將引出魔音幻象，目前敲擊中央土聲",BoardCond = {4}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1867]]"按照順序，敲擊五音銅鐘，順序錯誤將引出魔音幻象，目前敲擊西方金聲",BoardCond = {5}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1868]]"按照順序，敲擊五音銅鐘，順序錯誤將引出魔音幻象，目前敲擊東方木聲",BoardCond = {6}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1869]]"按照順序，敲擊五音銅鐘，順序錯誤將引出魔音幻象，目前敲擊南方火聲",BoardCond = {7}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1870]]"按照順序，敲擊五音銅鐘，順序錯誤將引出魔音幻象，目前敲擊北方水聲",BoardCond = {8}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1871]]"楊蓮亭現身，看他意欲何為",BoardCond = {9}},
		{ID = 15,Imageid = 10998,Desc = --[[!AUTO_1872]]"擊殺@楊蓮亭[target 78.0574,50.8614,75.368,monster=61465](%d/1)",BoardCond = {10}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1873]]"離開副本",BoardCond = {2}},
	}
}

Ectype.EctypeArgs[3289] =
{
	Name = --[[!AUTO_1874]]"副本追蹤",
	Desc = --[[!AUTO_1875]]"目標：挑戰楚流雲，破其招數",
	Args =
	{
		{ID = 305,Imageid = 17223,Desc = --[[!AUTO_1876]]"打開第一道大門（直接攻破或扳動機關）：%d/1",BoardCond = {1}},
		{ID = 301,Imageid = 17223,Desc = --[[!AUTO_1877]]"擊敗連雲堡射手：%d/6",BoardCond = {3}},
		{ID = 302,Imageid = 17224,Desc = --[[!AUTO_1878]]"擊敗連雲堡刀客：%d/12",BoardCond = {3}},
		{ID = 306,Imageid = 17223,Desc = --[[!AUTO_1879]]"打開第二道大門（直接攻破或扳動機關）：%d/1",BoardCond = {4}},
		{ID = 0,Imageid = 2103,Desc = --[[!AUTO_1880]]"墜落懸崖後可使用鐵鍊爬上石柱。第二、三條鐵鍊僅在擊碎對應的石燈後才可使用。",BoardCond = {4}},
		{ID = 116,Imageid = 17225,Desc = --[[!AUTO_1881]]"擊敗孟大：%d/1",BoardCond = {5}},
		{ID = 307,Imageid = 17223,Desc = --[[!AUTO_1882]]"打開第三道大門（直接攻破或扳動機關）：%d/1",BoardCond = {6}},
		{ID = 303,Imageid = 17226,Desc = --[[!AUTO_1883]]"擊敗邢無跡：%d/1",BoardCond = {7}},
		{ID = 304,Imageid = 17222,Desc = --[[!AUTO_1884]]"擊敗連雲堡拳師：%d/32",BoardCond = {7}},
		{ID = 0,Imageid = 17227,Desc = --[[!AUTO_1885]]"前往楚流雲的書房",BoardCond = {8}},
		{ID = 107,Imageid = 17227,Desc = --[[!AUTO_1886]]"破招（擊毀巨筆）：%d/1",BoardCond = {9}},
		{ID = 0,Imageid = 1887,Desc = --[[!AUTO_1887]]"前往岔路口與向問天會合",BoardCond = {10}},
		{ID = 0,Imageid = 1887,Desc = --[[!AUTO_1888]]"前往岔路口與向問天會合",BoardCond = {11}},
	}
}

Ectype.EctypeArgs[3314] =
{
	Name = --[[!AUTO_1889]]"副本追蹤",
	Desc = --[[!AUTO_1890]]"目標：老頭子不願放過令狐沖，狠狠教訓他",
	Args =
	{
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1891]]"打敗老頭子",BoardCond = {1}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1892]]"離開副本",BoardCond = {2}},
	}
}

Ectype.EctypeArgs[3582] =
{
	Name = --[[!AUTO_1893]]"副本追蹤",
	Desc = --[[!AUTO_1894]]"目標：打敗許顯純",
	Args =
	{
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1895]]"打敗@許顯純[target -153.31, 127.862, -197.459, monster=35874](%SA[15]/1)",BoardCond = {1}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1896]]"離開副本",BoardCond = {2}},
	}
}

Ectype.EctypeArgs[3892] =
{
	Name = --[[!AUTO_1897]]"副本追蹤",
	Desc = --[[!AUTO_1898]]"目標：協助不戒和尚，用機關擊倒桃谷六仙",
	Args =
	{
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1899]]"等待桃谷六仙和不戒和尚進入起跑位",BoardCond = {1}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1900]]"站在@發令位置[pos3 192.218, 85.022, 108.55]，^FFFF00按1鍵^FFFFFF為六仙和不戒和尚發令。",BoardCond = {3}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1901]]"等待不戒和尚的通知，準備啟動機關。",BoardCond = {4}, ArgsCond = {901,--[[!AUTO_1902]]"=",0}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1903]]"@釋放落石[target 181.947, 86.003, 105.376, mine=75174]、@啟動木樁[target 181.064, 85.067, 85.095, mine=75173]、或@打碎油桶[target 155.508, 86.813, 47.6,monster=74112]，消減桃谷六仙的耐力。\r桃根仙:^FFFF00%SA[301]/100^FFFFFF     桃幹仙:^FFFF00%SA[302]/100^FFFFFF\r桃枝仙:^FFFF00%SA[303]/100^FFFFFF     桃葉仙:^FFFF00%SA[304]/100^FFFFFF\r桃花仙:^FFFF00%SA[305]/100^FFFFFF     桃實仙:^FFFF00%SA[306]/100^FFFFFF\r不戒和尚:^FFFF00%SA[307]/100",BoardCond = {4}, ArgsCond = {901,--[[!AUTO_1904]]"=",1}},
	}
}

Ectype.EctypeArgs[3895] =
{
	Name = --[[!AUTO_1905]]"副本追蹤",
	Desc = --[[!AUTO_1906]]"目標：擊殺嶽雲鴻！",
	Args =
	{
		{ID = 15,Imageid = 10998,Desc = --[[!AUTO_1907]]"擊殺@嶽雲鴻[target -88.56, 121.76, 44.93, monster=35852](%d/1)",BoardCond = {1}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1908]]"離開副本",BoardCond = {2}}
	}
}

Ectype.EctypeArgs[4028] =
{
	Name = --[[!AUTO_1909]]"副本追蹤",
	Desc = --[[!AUTO_1910]]"目標：破壞迷蹤陣眼",
	Args =
	{
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1911]]"進入副本",BoardCond = {1}},
		{ID = 15,Imageid = 10998,Desc = --[[!AUTO_1912]]"擊殺@青石獸[target -212.464, 171.48, 326.96, monster=64638]，破壞陣眼(%d/1)",BoardCond = {3}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1913]]"離開副本",BoardCond = {2}}
	}
}

Ectype.EctypeArgs[3635] =
{
	Name = --[[!AUTO_1914]]"副本追蹤",
	Desc = --[[!AUTO_1915]]"目標：跟隨不戒和尚進入嵩山寶塔，打敗湯英鶚",
	Args =
	{
		{ID = 0,Imageid = 2103,Desc = --[[!AUTO_1916]]"穿過谷底，與不戒和尚會合",BoardCond = {1}},
		{ID = 0,Imageid = 2103,Desc = --[[!AUTO_1917]]"谷底戒備森嚴，看來敵人早有準備",BoardCond = {2}},
		{ID = 301,Imageid = 20039,Desc = --[[!AUTO_1918]]"擊敗塔底惡囚：%d/6",BoardCond = {2}},
		{ID = 0,Imageid = 2103,Desc = --[[!AUTO_1919]]"小心埋伏，迅速解決戰鬥",BoardCond = {3}},
		{ID = 301,Imageid = 20039,Desc = --[[!AUTO_1920]]"擊敗塔底惡囚：%d/5",BoardCond = {3}},
		{ID = 302,Imageid = 10275,Desc = --[[!AUTO_1921]]"擊敗嗜血蝙蝠：%d/3",BoardCond = {3}},
		{ID = 0,Imageid = 2103,Desc = --[[!AUTO_1922]]"跳過山石向上，進入寶塔",BoardCond = {4}},
		{ID = 308,Imageid = 6021,Desc = --[[!AUTO_1923]]"清除路障：%d/1",BoardCond = {4}},
		{ID = 0,Imageid = 2103,Desc = --[[!AUTO_1924]]"探索第一層",BoardCond = {5}},
		{ID = 0,Imageid = 2103,Desc = --[[!AUTO_1925]]"四周的牆壁血跡斑斑，甚至還未乾涸",BoardCond = {6}},
		{ID = 303,Imageid = 20037,Desc = --[[!AUTO_1926]]"擊敗塔底牢頭：%d/1",BoardCond = {6}},
		{ID = 301,Imageid = 20039,Desc = --[[!AUTO_1927]]"擊敗塔底惡囚：%d/5",BoardCond = {6}},
		{ID = 0,Imageid = 2103,Desc = --[[!AUTO_1928]]"敵人發現了你的行蹤，凝神戒備",BoardCond = {7}},
		{ID = 303,Imageid = 20037,Desc = --[[!AUTO_1929]]"擊敗塔底牢頭：%d/2",BoardCond = {7}},
		{ID = 301,Imageid = 20039,Desc = --[[!AUTO_1930]]"擊敗塔底惡囚：%d/5",BoardCond = {7}},
		{ID = 0,Imageid = 2103,Desc = --[[!AUTO_1931]]"前往第二層",BoardCond = {8}},
		{ID = 0,Imageid = 2103,Desc = --[[!AUTO_1932]]"探索第二層",BoardCond = {9}},
		{ID = 0,Imageid = 2103,Desc = --[[!AUTO_1933]]"這傢伙滿臉橫肉，手上的屠刀被鮮血染紅",BoardCond = {10}},
		{ID = 305,Imageid = 20034,Desc = --[[!AUTO_1934]]"擊敗劊子手：%d/1",BoardCond = {10}},
		{ID = 0,Imageid = 2103,Desc = --[[!AUTO_1935]]"前往第三層",BoardCond = {11}},
		{ID = 0,Imageid = 2103,Desc = --[[!AUTO_1936]]"探索第三層",BoardCond = {12}},
		{ID = 0,Imageid = 2103,Desc = --[[!AUTO_1937]]"四周佈滿了陷阱，不經意間會觸動開關",BoardCond = {13}},
		{ID = 304,Imageid = 20038,Desc = --[[!AUTO_1938]]"擊敗陷阱守衛：%d/2",BoardCond = {13}},
		{ID = 301,Imageid = 20039,Desc = --[[!AUTO_1939]]"擊敗塔底惡囚：%d/4",BoardCond = {13}},
		{ID = 0,Imageid = 2103,Desc = --[[!AUTO_1940]]"四周有人看守，只能突圍向上",BoardCond = {14}},
		{ID = 304,Imageid = 20038,Desc = --[[!AUTO_1941]]"擊敗陷阱守衛：%d/3",BoardCond = {14}},
		{ID = 303,Imageid = 20037,Desc = --[[!AUTO_1942]]"擊敗塔底牢頭：%d/4",BoardCond = {14}},
		{ID = 0,Imageid = 2103,Desc = --[[!AUTO_1943]]"前往第四層",BoardCond = {15}},
		{ID = 0,Imageid = 2103,Desc = --[[!AUTO_1944]]"探索第四層",BoardCond = {16}},
		{ID = 0,Imageid = 2103,Desc = --[[!AUTO_1945]]"各種機關暗器防不勝防，打敗它們的操縱者",BoardCond = {17}},
		{ID = 306,Imageid = 20035,Desc = --[[!AUTO_1946]]"擊敗陳百臂：%d/1",BoardCond = {17}},
		{ID = 0,Imageid = 2103,Desc = --[[!AUTO_1947]]"前往第五層",BoardCond = {18}},
		{ID = 0,Imageid = 2103,Desc = --[[!AUTO_1948]]"探索第五層",BoardCond = {19}},
		{ID = 0,Imageid = 2103,Desc = --[[!AUTO_1949]]"嵩山派的先人曾在此研習武學",BoardCond = {20}},
		{ID = 309,Imageid = 20040,Desc = --[[!AUTO_1927]]"擊敗嵩山派心魔：%d/4",BoardCond = {20}},
		{ID = 0,Imageid = 2103,Desc = --[[!AUTO_1952]]"前往第六層",BoardCond = {21}},
		{ID = 0,Imageid = 2103,Desc = --[[!AUTO_1953]]"探索第六層",BoardCond = {22}},
		{ID = 0,Imageid = 2103,Desc = --[[!AUTO_1954]]"嵩山派副掌門湯英鶚，圖謀剿滅五嶽劍派，貽害武林",BoardCond = {23}},
		{ID = 307,Imageid = 20036,Desc = --[[!AUTO_1955]]"擊敗湯英鶚：%d/1",BoardCond = {23}},
		{ID = 0,Imageid = 2103,Desc = --[[!AUTO_1956]]"退出副本",BoardCond = {24}},
	}
}

Ectype.EctypeArgs[3630] =
{
	Name = --[[!AUTO_1914]]"副本追蹤",
	Desc = --[[!AUTO_1915]]"目標：獲得墓中寶藏",
	Args =
	{
		{ID = 302,Imageid = 2103,Desc = --[[!AUTO_1753]]"皇陵迷宮內藏了大量珍寶，但也有大量機關和陷阱，查看每個房間的刻碑銘文可避免陷入困境。%d/3",BoardCond = {1}, ArgsCond = {300,--[[!AUTO_1754]]"=",0}},
		{ID = 0,Imageid = 2103,Desc = --[[!AUTO_1753]]"打碎萬魔殿的靈氣封印，釋放其中的靈氣來修復鎮水蛤蟆",BoardCond = {1}, ArgsCond = {300,--[[!AUTO_1754]]"=",10}},
		{ID = 302,Imageid = 2103,Desc = --[[!AUTO_1753]]"皇陵迷宮內藏了大量珍寶，但也有大量機關和陷阱，查看每個房間內的刻碑銘文可避免陷入困境。%d/3",BoardCond = {1}, ArgsCond = {300,--[[!AUTO_1754]]"=",10}},
		{ID = 0,Imageid = 2103,Desc = --[[!AUTO_1753]]"堅持住，等石像的靈氣耗盡，便可一擊破之",BoardCond = {1}, ArgsCond = {300,--[[!AUTO_1754]]"=",100}},
		{ID = 302,Imageid = 2103,Desc = --[[!AUTO_1753]]"皇陵迷宮內藏了大量珍寶，但也有大量機關和陷阱，查看每個房間內的刻碑銘文可避免陷入困境。%d/3",BoardCond = {1}, ArgsCond = {300,--[[!AUTO_1754]]"=",100}},
		{ID = 302,Imageid = 2103,Desc = --[[!AUTO_1753]]"皇陵迷宮內藏了大量珍寶，但也有大量機關和陷阱，查看每個房間內的刻碑銘文可避免陷入困境。%d/3",BoardCond = {1}, ArgsCond = {300,--[[!AUTO_1754]]"=",110}},
		{ID = 0,Imageid = 2103,Desc = --[[!AUTO_1753]]"打碎萬魔殿的靈氣封印，釋放其中的靈氣來修復鎮水蛤蟆",BoardCond = {1}, ArgsCond = {300,--[[!AUTO_1754]]"=",110}},
		{ID = 0,Imageid = 2103,Desc = --[[!AUTO_1753]]"堅持住，等石像的靈氣耗盡，便可一擊破之",BoardCond = {1}, ArgsCond = {300,--[[!AUTO_1754]]"=",110}},
	}
}

Ectype.EctypeArgs[4030] =
{
	Name = --[[!AUTO_1957]]"副本追蹤",
	Desc = --[[!AUTO_1958]]"目標：探查龍脈地宮",
	Args =
	{
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1959]]"竟然掉入一個地洞！",BoardCond = {1}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1960]]"前方有悉悉索索的聲響，去@看看[pos3 -21.45,32.4,-37.63]",BoardCond = {2}},
		{ID = 15,Imageid = 10998,Desc = --[[!AUTO_1961]]"擊殺@觀燈嘍囉[target -21.45,32.4,-37.63, monster=74494](%d/3)",BoardCond = {3}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1962]]"@追上[pos3 -13.71,32.4,-45.92]逃走的傢伙",BoardCond = {4}},
		{ID = 15,Imageid = 10998,Desc = --[[!AUTO_1963]]"擊殺@觀燈嘍囉[target -13.71,32.4,-45.92, monster=74494](%d/6)",BoardCond = {5}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1964]]"繼續向@深處[pos3 -10.38,32,-36.54]走",BoardCond = {6}},
		{ID = 15,Imageid = 10998,Desc = --[[!AUTO_1965]]"貼著洞壁走，擊殺藏在洞內的@挖寶嘍囉[target -10.38,32,-36.54, monster=74495](%d/8)",BoardCond = {7}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1966]]"前往洞穴中心@看看[pos3 -0.5,32,-44.81]",BoardCond = {8}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1967]]"按兵不動，靜觀其變",BoardCond = {9}},
		{ID = 15,Imageid = 10998,Desc = --[[!AUTO_1968]]"擊殺@掌燈衛[target -2.71,32,-44.86, monster=74496](%d/4)",BoardCond = {10}},
		{ID = 15,Imageid = 10998,Desc = --[[!AUTO_1969]]"擊殺@搬山傀[target -0.47,32,-46.45, monster=74497](%d/1)",BoardCond = {11}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1970]]"尋找地宮@出口[pos3 -1.02,31.59,-57.48]",BoardCond = {12}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1971]]"離開副本",BoardCond = {13}},
	}
}

Ectype.EctypeArgs[6912] =
{
	Name = --[[!AUTO_1957]]"副本追蹤",
	Desc = --[[!AUTO_1958]]"目標：做出一盤香噴噴的餃子",
	Args =
	{
		{ID = 102,Imageid = 10998,Desc = --[[!AUTO_1968]]"擊殺偷菜賊獲得菜(%SA[102]/5)",BoardCond = {1}},
                {ID = 103,Imageid = 10998,Desc = --[[!AUTO_1968]]"擊殺偷面賊獲得面(%SA[103]/5)",BoardCond = {1}},
		{ID = 104,Imageid = 10998,Desc = --[[!AUTO_1968]]"擊殺偷肉賊獲得肉(%SA[104]/5)",BoardCond = {1}},
		{ID = 105,Imageid = 10998,Desc = --[[!AUTO_1968]]"擊殺偷鹽賊獲得鹽(%SA[105]/5)",BoardCond = {1}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1960]]"去大廚旁邊的@灶台[target 0.99, 35.19, 6.29, mine=83153]煮一鍋餃子吧",BoardCond = {3}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1971]]"離開副本",BoardCond = {2}},
	}
}

Ectype.EctypeArgs[4047] =
{
	Name = --[[!AUTO_1972]]"副本追蹤",
	Desc = --[[!AUTO_1973]]"目標：擊敗前來挑釁的江湖宵小",
	Args =
	{
		{ID = 15,Imageid = 10998,Desc = --[[!AUTO_1974]]"武館乃習武之地，豈容@尋釁者[target -224.534,44.450,-106.508, monster=75399](%d/6)胡鬧？",BoardCond = {1}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1975]]"離開副本",BoardCond = {2}},
	}
}
Ectype.EctypeArgs[4633] =
{
	Name = --[[!AUTO_1976]]"副本追蹤",
	Desc = --[[!AUTO_1977]]"目標：擊殺雌雄大盜！",
	Args =
	{
		{ID = 15,Imageid = 10998,Desc = --[[!AUTO_1978]]"擊殺@柳三媚[target -219.856, 100.126, -28.1613, monster=76931](%d/1)",BoardCond = {1}},
		{ID = 16,Imageid = 10998,Desc = --[[!AUTO_1979]]"擊殺@林七俊[target -219.895, 99.8616, -31.9766, monster=76932](%d/1)",BoardCond = {1}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1980]]"離開副本",BoardCond = {2}},
	}
}
Ectype.EctypeArgs[4719] =
{
	Name = --[[!AUTO_1981]]"副本追蹤",
	Desc = --[[!AUTO_1982]]"目標：打敗田伯光！",
	Args =
	{
		{ID = 15,Imageid = 10998,Desc = --[[!AUTO_1983]]"打敗@田伯光[target -33.48, 41.9544, 249.599, monster=77626](%d/1)",BoardCond = {1}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1984]]"離開副本",BoardCond = {2}},
	}
}

Ectype.EctypeArgs[4689] =		--绝情谷入口
{
	Name = --[[!AUTO_2011]]"副本追蹤",
	Desc = --[[!AUTO_2012]]"目標：消滅谷口的追兵",
	Args =
	{
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_2015]]"離開副本",BoardCond = {4}},
		{ID = 301,Imageid = 17222,Desc = --[[!AUTO_2025]]"烈風拳師：%d/40",ArgsCond = {101,--[[!AUTO_2026]]"=",1}},
		{ID = 302,Imageid = 1419,Desc = --[[!AUTO_2027]]"烈風力士：%d/20",ArgsCond = {101,--[[!AUTO_2028]]"=",1}},
		{ID = 303,Imageid = 17223,Desc = --[[!AUTO_2029]]"暗襲弓手：%d/40",ArgsCond = {101,--[[!AUTO_2030]]"=",2}},
		{ID = 304,Imageid = 10349,Desc = --[[!AUTO_2031]]"暗襲高手：%d/20",ArgsCond = {101,--[[!AUTO_2032]]"=",2}},
		{ID = 305,Imageid = 905,Desc = --[[!AUTO_2033]]"滾石：%d/1",BoardCond = {2}},
		{ID = 311,Imageid = 17225,Desc = --[[!AUTO_2034]]"塞北刀王：%d/1",ArgsCond = {102,--[[!AUTO_2035]]"=",1}},
		{ID = 312,Imageid = 10366,Desc = --[[!AUTO_2036]]"雙刀紅娘子：%d/1",ArgsCond = {102,--[[!AUTO_2037]]"=",2}},
		{ID = 313,Imageid = 16421,Desc = --[[!AUTO_2038]]"大刀王慶：%d/1",ArgsCond = {102,--[[!AUTO_2039]]"=",3}},
		{ID = 314,Imageid = 10335,Desc = --[[!AUTO_2040]]"惡行者：%d/1",ArgsCond = {102,--[[!AUTO_2041]]"=",4}},
	}
}

Ectype.EctypeArgs[4690] =
{
	Name = --[[!AUTO_2016]]"副本追蹤",
	Desc = --[[!AUTO_2017]]"目標：消滅谷中埋伏的怪物",
	Args =
	{
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_2020]]"離開副本",BoardCond = {4}},
		{ID = 401,Imageid = 10363,Desc = --[[!AUTO_2042]]"深谷僵屍：%d/40",ArgsCond = {111,--[[!AUTO_2043]]"=",1}},
		{ID = 402,Imageid = 1326,Desc = --[[!AUTO_2044]]"深谷巨鴉：%d/20",ArgsCond = {111,--[[!AUTO_2045]]"=",1}},
		{ID = 403,Imageid = 16416,Desc = --[[!AUTO_2046]]"邪道女弟子：%d/40",ArgsCond = {111,--[[!AUTO_2047]]"=",2}},
		{ID = 404,Imageid = 16417,Desc = --[[!AUTO_2048]]"邪道投槍手：%d/20",ArgsCond = {111,--[[!AUTO_2049]]"=",2}},
		{ID = 405,Imageid = 1390,Desc = --[[!AUTO_2050]]"蟲妖：%d/4",BoardCond = {2}},
		{ID = 411,Imageid = 1464,Desc = --[[!AUTO_2051]]"青石獸：%d/1",ArgsCond = {112,--[[!AUTO_2052]]"=",1}},
		{ID = 412,Imageid = 16856,Desc = --[[!AUTO_2053]]"白髮鬼：%d/1",ArgsCond = {112,--[[!AUTO_2054]]"=",2}},
		{ID = 413,Imageid = 16855,Desc = --[[!AUTO_2055]]"鬼槍王：%d/1",ArgsCond = {112,--[[!AUTO_2056]]"=",3}},
		{ID = 414,Imageid = 10371,Desc = --[[!AUTO_2057]]"大護法：%d/1",ArgsCond = {112,--[[!AUTO_2058]]"=",4}},
	}
}

Ectype.EctypeArgs[4691] =
{
	Name = --[[!AUTO_2021]]"副本追蹤",
	Desc = --[[!AUTO_2022]]"目標：擊敗絕情谷主",
	Args =
	{
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_2023]]"擊敗絕情谷主公孫滅",BoardCond = {1,2}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_2024]]"離開副本",BoardCond = {3}},
	}
}

Ectype.EctypeArgs[5922] =
{
	Name =  --[[!AUTO_2059]]"副本追蹤",
	Desc =  --[[!AUTO_2060]]"目標：擊敗木高峰！",
	Args =
	{
		{ID = 15,Imageid = 10998,Desc =  --[[!AUTO_2061]]"擊敗@木高峰[target -275, 90,-409, monster=77745](%d/1)",BoardCond = {1}},
		{ID = 0,Imageid = 10998,Desc =  --[[!AUTO_2062]]"離開副本",BoardCond = {2}},
	}
}

Ectype.EctypeArgs[5897] =
{
	Name = --[[!AUTO_2063]]"副本追蹤",
	Desc = --[[!AUTO_2064]]"目標：擊敗余滄海",
	Args =
	{
		{ID = 15,Imageid = 10998,Desc = --[[!AUTO_2065]]"擊敗@余滄海[target -159.532, 154.57, 443.341, monster=77756](%d/1)",BoardCond = {1}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_2066]]"離開副本",BoardCond = {2}},
	}
}

Ectype.EctypeArgs[5923] =
{
	Name =  --[[!AUTO_2067]]"副本追蹤",
	Desc =  --[[!AUTO_2068]]"目標：擊敗神鵰後代！",
	Args =
	{
		{ID = 15,Imageid = 10998,Desc =  --[[!AUTO_2069]]"擊敗@神鵰後代[target -121,113,292, monster=78041](%d/3)",BoardCond = {1}},
		{ID = 0,Imageid = 10998,Desc =  --[[!AUTO_2070]]"離開副本",BoardCond = {2}},
	}
}

Ectype.EctypeArgs[5974] =
{
	Name = --[[!AUTO_1981]]"副本追蹤",
	Desc = --[[!AUTO_1982]]"目標：抓捕100隻貪吃的月兔！",
	Args =
	{
		{ID = 15,Imageid = 10998,Desc = --[[!AUTO_1983]]"抓捕100隻貪吃的月兔：%d/100",BoardCond = {1}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_1984]]"離開副本",BoardCond = {2}},
	}
}

Ectype.EctypeArgs[5980] =
{
	Name = --[[!AUTO_2071]]"副本追蹤",
	Desc = --[[!AUTO_2072]]"目標：保護賈滄瀾！",
	Args =
	{
		{ID = 15,Imageid = 10998,Desc = --[[!AUTO_2073]]"擊殺@神秘刀客[target 292.859, 87.23, -148.88, monster=80122](%SA[15]/4)",BoardCond = {1}},
		{ID = 16,Imageid = 10998,Desc = --[[!AUTO_2074]]"擊殺@神秘刀客[target 287.996, 86.784, -129.71, monster=80122]（%SA[16]/4）及@神秘刀客頭目[target 308.465, 86.847, -109.593, monster=81001](%SA[15]/1)",BoardCond = {1}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_2075]]"離開副本",BoardCond = {2}},
	}
}

Ectype.EctypeArgs[5900] =
{
	Name = --[[!AUTO_2076]]"副本追蹤",
	Desc = --[[!AUTO_2077]]"目標：助寂明師太解開心結",
	Args =
	{
		{ID = 15,Imageid = 10998,Desc = --[[!AUTO_2078]]"擊殺@蘇滄沫幻象[target -143.184, 49.860, 31.962, monster=77176](%d/1)",BoardCond = {1}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_2079]]"離開副本",BoardCond = {2}},
	}
}

Ectype.EctypeArgs[6161] =    --九层妖楼
{
	Name = "探險目標",
	Desc = "目標：尋找九層妖樓的盡頭",
	Args =
	{
		{ID = 101,	Imageid = 14208,	Desc = "當前層數：%d",	BoardCond = {1,2,3,4,5,6,7}},
		{ID = 0,	Imageid = 11974,	Desc = "通過金系考驗前往下層",	BoardCond = {1}},
		{ID = 0,	Imageid = 11979,	Desc = "通過木系樓層前往下層",	BoardCond = {2}},
		{ID = 0,	Imageid = 11977,	Desc = "通過水系樓層前往下層",	BoardCond = {3}},
		{ID = 0,	Imageid = 11975,	Desc = "通過火系樓層前往下層",	BoardCond = {4}},
		{ID = 0,	Imageid = 11978,	Desc = "通過土系樓層前往下層",	BoardCond = {5}},
		{ID = 0,	Imageid = 11976,	Desc = "通過妖樓入口前往下層",	BoardCond = {6}},
		{ID = 0,	Imageid = 11980,	Desc = "探尋妖樓最深處的秘密",	BoardCond = {7}},
		--[=[
		{ID = 208,Imageid = 10308,Desc = --[[!AUTO_158]]"迷窟机关人：%d/12",ArgsCond = {101,--[[!AUTO_159]]"=",2}},
		{ID = 208,Imageid = 10308,Desc = --[[!AUTO_160]]"迷窟机关人：%d/8",ArgsCond = {102,--[[!AUTO_161]]"=",1}},
		{ID = 209,Imageid = 1368,Desc = --[[!AUTO_162]]"东厂番役：%d/8",ArgsCond = {102,--[[!AUTO_163]]"=",2}},
		{ID = 202,Imageid = 6399,Desc = --[[!AUTO_164]]"酒桶：%d/8",ArgsCond = {103,--[[!AUTO_165]]"=",1}},
		{ID = 210,Imageid = 10308,Desc = --[[!AUTO_166]]"机关人之王：%d/1",ArgsCond = {103,--[[!AUTO_167]]"=",2}},
		{ID = 211,Imageid = 10310,Desc = --[[!AUTO_168]]"巨大腐奴：%d/10",ArgsCond = {104,--[[!AUTO_169]]"=",1}},
		{ID = 229,Imageid = 1853,Desc = --[[!AUTO_170]]"东厂盗宝监督：%d/1",ArgsCond = {104,--[[!AUTO_171]]"=",2}},
		{ID = 0,Imageid = 11057,Desc = --[[!AUTO_172]]"泉水处可恢复补给",ArgsCond = {105,--[[!AUTO_173]]"=",1}},
		{ID = 212,Imageid = 1425,Desc = --[[!AUTO_174]]"迷窟毒花：%d/16",ArgsCond = {105,--[[!AUTO_175]]"=",2}},
		{ID = 213,Imageid = 1400,Desc = --[[!AUTO_176]]"盗宝火枪手：%d/16",ArgsCond = {106,--[[!AUTO_177]]"=",1}},
		{ID = 220,Imageid = 1931,Desc = --[[!AUTO_178]]"青城盗宝高手：%d/2",ArgsCond = {106,--[[!AUTO_179]]"=",2}},
		{ID = 219,Imageid = 1930,Desc = --[[!AUTO_180]]"青城盗宝小兵：%d/6",ArgsCond = {106,--[[!AUTO_181]]"=",2}},
		{ID = 214,Imageid = 1923,Desc = --[[!AUTO_182]]"侯人英：%d/1",ArgsCond = {107,--[[!AUTO_183]]"=",1}},
		{ID = 218,Imageid = 1932,Desc = --[[!AUTO_184]]"青城盗宝小兵：%d/8",ArgsCond = {107,--[[!AUTO_185]]"=",2}},
		{ID = 203,Imageid = 3061,Desc = --[[!AUTO_186]]"盆景：%d/8",ArgsCond = {108,--[[!AUTO_187]]"=",1}},
		{ID = 215,Imageid = 1924,Desc = --[[!AUTO_188]]"洪人雄：%d/1",ArgsCond = {108,--[[!AUTO_189]]"=",2}},
		{ID = 216,Imageid = 1925,Desc = --[[!AUTO_190]]"于人豪：%d/1",ArgsCond = {109,--[[!AUTO_191]]"=",1}},
		{ID = 0,Imageid = 11057,Desc = --[[!AUTO_192]]"泉水处可恢复补给",ArgsCond = {109,--[[!AUTO_193]]"=",2}},
		{ID = 217,Imageid = 1926,Desc = --[[!AUTO_194]]"罗人杰：%d/1",ArgsCond = {110,--[[!AUTO_195]]"=",1}},
		{ID = 204,Imageid = 4844,Desc = --[[!AUTO_196]]"火炬：%d/8",ArgsCond = {110,--[[!AUTO_197]]"=",2}},
		{ID = 221,Imageid = 1928,Desc = --[[!AUTO_198]]"青城盗宝高手：%d/10",ArgsCond = {111,--[[!AUTO_199]]"=",1}},
		{ID = 222,Imageid = 10370,Desc = --[[!AUTO_200]]"古代斗笠武士：%d/1",ArgsCond = {111,--[[!AUTO_201]]"=",2}},
		{ID = 205,Imageid = 2300,Desc = --[[!AUTO_202]]"石灯：%d/8",ArgsCond = {112,--[[!AUTO_203]]"=",1}},
		{ID = 209,Imageid = 1368,Desc = --[[!AUTO_204]]"东厂番役：%d/16",ArgsCond = {112,--[[!AUTO_205]]"=",2}},
		{ID = 228,Imageid = 10254,Desc = --[[!AUTO_206]]"迷窟野牛：%d/12",ArgsCond = {113,--[[!AUTO_207]]"=",1}},
		{ID = 223,Imageid = 10310,Desc = --[[!AUTO_208]]"成精的巨大腐奴：%d/1",ArgsCond = {113,--[[!AUTO_209]]"=",2}},
		{ID = 224,Imageid = 10194,Desc = --[[!AUTO_210]]"盗宝吹箭兵：%d/16",ArgsCond = {114,--[[!AUTO_211]]"=",1}},
		{ID = 226,Imageid = 10186,Desc = --[[!AUTO_212]]"盗宝蛮兵：%d/16",ArgsCond = {114,--[[!AUTO_213]]"=",2}},
		{ID = 225,Imageid = 1379,Desc = --[[!AUTO_214]]"大内火术师：%d/8",ArgsCond = {115,--[[!AUTO_215]]"=",1}},
		{ID = 227,Imageid = 1381,Desc = --[[!AUTO_216]]"古代盲眼剑客：%d/1",ArgsCond = {115,--[[!AUTO_217]]"=",2}},
		{ID = 225,Imageid = 1379,Desc = --[[!AUTO_218]]"大内火术师：%d/6",ArgsCond = {116,--[[!AUTO_219]]"=",1}},
		{ID = 227,Imageid = 1381,Desc = --[[!AUTO_220]]"古代盲眼剑客：%d/1",ArgsCond = {116,--[[!AUTO_221]]"=",2}},
		{ID = 222,Imageid = 10370,Desc = --[[!AUTO_222]]"古代斗笠武士：%d/1",ArgsCond = {116,--[[!AUTO_223]]"=",3}},
		--]=]
	}
}

Ectype.EctypeArgs[6812] =
{
	Name = "副本追蹤",
	Desc = "目標：讓百姓過個太平年",
	Args =
	{
		{ID = 120,Imageid = 10998,Desc = "消滅年獸分身：%d/200",ArgsCond = {121,"=",1}},
		{ID = 116,Imageid = 10998,Desc = "點燃足夠多的煙花引年獸入城：%d/10",ArgsCond = {121,"=",2}},
		{ID = 114,Imageid = 10998,Desc = "鎮壓年獸：%d/1",ArgsCond = {121,"=",3}},
		{ID = 0,Imageid = 10998,Desc = "清除守衛路障的妖魔",ArgsCond = {121,"=",4}},
		{ID = 117,Imageid = 10998,Desc = "消滅年獸爪牙：%d/3",ArgsCond = {121,"=",4}},
		{ID = 0,Imageid = 10998,Desc = "解救百姓",ArgsCond = {121,"=",4}},
		{ID = 0,Imageid = 10998,Desc = "離開副本",ArgsCond = {121,"=",5}},
	}
}

Ectype.EctypeArgs[6981] =
{
	Name = --[[!AUTO_1874]]"副本追蹤",
	Desc = --[[!AUTO_1875]]"目標：擊敗左冷禪",
	Args =
	{
		{ID = 0,Imageid = 22363,Desc = --[[!AUTO_1876]]"向大殿進發",BoardCond = {1}},
		{ID = 401,Imageid = 22371,Desc = --[[!AUTO_1877]]"擊敗單劍弟子：%d/12",BoardCond = {3}},
		{ID = 0,Imageid = 22363,Desc = --[[!AUTO_1878]]"向大殿進發",BoardCond = {4}},
		{ID = 402,Imageid = 22370,Desc = --[[!AUTO_1879]]"擊敗重劍弟子：%d/4",BoardCond = {5}},
		{ID = 403,Imageid = 22374,Desc = --[[!AUTO_1879]]"擊敗暗器弟子：%d/5",BoardCond = {5}},
		{ID = 0,Imageid = 22363,Desc = --[[!AUTO_1878]]"登上大殿臺階",BoardCond = {6}},
		{ID = 413,Imageid = 22366,Desc = --[[!AUTO_1880]]"擊敗鄧八公：%d/1",BoardCond = {7}},
		{ID = 0,Imageid = 22363,Desc = --[[!AUTO_1878]]"上樓",BoardCond = {8}},
		{ID = 404,Imageid = 22371,Desc = --[[!AUTO_1881]]"擊敗單劍弟子：%d/4",BoardCond = {9}},
		{ID = 405,Imageid = 22372,Desc = --[[!AUTO_1882]]"擊敗轉輪弟子：%d/3",BoardCond = {9}},
		{ID = 0,Imageid = 22363,Desc = --[[!AUTO_1878]]"前往露臺",BoardCond = {10}},
		{ID = 406,Imageid = 22370,Desc = --[[!AUTO_1879]]"擊敗重劍弟子：%d/4",BoardCond = {11}},
		{ID = 407,Imageid = 22374,Desc = --[[!AUTO_1879]]"擊敗暗器弟子：%d/5",BoardCond = {11}},
		{ID = 0,Imageid = 22363,Desc = --[[!AUTO_1878]]"前往東側副塔",BoardCond = {12}},
		{ID = 414,Imageid = 22365,Desc = --[[!AUTO_1884]]"擊敗鐘鎮：%d/1",BoardCond = {13}},
		{ID = 0,Imageid = 22363,Desc = --[[!AUTO_1878]]"前往西側副塔",BoardCond = {14}},
		{ID = 408,Imageid = 22371,Desc = --[[!AUTO_1881]]"擊敗攔路弟子：%d/30",BoardCond = {15}},
		{ID = 0,Imageid = 22363,Desc = --[[!AUTO_1878]]"進入西側副塔",BoardCond = {16}},
		{ID = 415,Imageid = 22364,Desc = --[[!AUTO_1884]]"擊敗湯英鶚：%d/1",BoardCond = {17}},
		{ID = 0,Imageid = 22363,Desc = --[[!AUTO_1878]]"前往中央主塔",BoardCond = {18}},
		{ID = 0,Imageid = 22363,Desc = --[[!AUTO_1878]]"擊敗左冷禪：0/1",BoardCond = {19}},
		{ID = 417,Imageid = 22363,Desc = --[[!AUTO_1878]]"擊敗左冷禪：%d/1",BoardCond = {20}},
	}
}

Ectype.EctypeArgs[6283] =
{
	Name = --[[!AUTO_1874]]"副本追蹤",
	Desc = --[[!AUTO_1875]]"目標：擊敗樂厚",
	Args =
	{
		{ID = 0,Imageid = 22367,Desc = --[[!AUTO_1876]]"進入嵩山後山",BoardCond = {1}},
		{ID = 123,Imageid = 22371,Desc = --[[!AUTO_1877]]"擊敗單劍弟子：%d/8",BoardCond = {3}},
		{ID = 0,Imageid = 22367,Desc = --[[!AUTO_1878]]"進入第二平臺",BoardCond = {4}},
		{ID = 125,Imageid = 22370,Desc = --[[!AUTO_1879]]"擊敗重劍弟子：%d/2",BoardCond = {5}},
		{ID = 126,Imageid = 22372,Desc = --[[!AUTO_1879]]"擊敗轉輪弟子：%d/2",BoardCond = {5}},
		{ID = 124,Imageid = 22371,Desc = --[[!AUTO_1879]]"擊敗單劍弟子：%d/6",BoardCond = {5}},
		{ID = 0,Imageid = 22367,Desc = --[[!AUTO_1878]]"進入第三平臺",BoardCond = {6}},
		{ID = 127,Imageid = 22371,Desc = --[[!AUTO_1880]]"擊敗轉劍弟子：%d/8",BoardCond = {7}},
		{ID = 0,Imageid = 22367,Desc = --[[!AUTO_1878]]"進入最後平臺",BoardCond = {8}},
		{ID = 128,Imageid = 22369,Desc = --[[!AUTO_1881]]"擊敗蔔沉：%d/1",BoardCond = {9}},
		{ID = 0,Imageid = 22367,Desc = --[[!AUTO_1878]]"前往樓臺亭閣",BoardCond = {10}},
		{ID = 130,Imageid = 22370,Desc = --[[!AUTO_1879]]"擊敗重劍弟子：%d/2",BoardCond = {11}},
		{ID = 129,Imageid = 22371,Desc = --[[!AUTO_1879]]"擊敗單劍弟子：%d/4",BoardCond = {11}},
		{ID = 131,Imageid = 22374,Desc = --[[!AUTO_1879]]"擊敗掌氣弟子：%d/1",BoardCond = {11}},
		{ID = 0,Imageid = 22367,Desc = --[[!AUTO_1878]]"前往平臺",BoardCond = {12}},
		{ID = 132,Imageid = 22375,Desc = --[[!AUTO_1884]]"擊敗禿鷹：%d/9",BoardCond = {13}},
		{ID = 0,Imageid = 22367,Desc = --[[!AUTO_1878]]"前往門派右側平臺",BoardCond = {14}},
		{ID = 133,Imageid = 22368,Desc = --[[!AUTO_1881]]"擊敗沙天江：%d/1",BoardCond = {15}},
		{ID = 0,Imageid = 22367,Desc = --[[!AUTO_1878]]"深入平臺",BoardCond = {16}},
		{ID = 134,Imageid = 22371,Desc = --[[!AUTO_1884]]"擊破嵩山十字陣",BoardCond = {17}},
		{ID = 0,Imageid = 22367,Desc = --[[!AUTO_1878]]"前往門派入口",BoardCond = {18}},
		{ID = 135,Imageid = 22371,Desc = --[[!AUTO_1878]]"擊敗單劍弟子：%d/18",BoardCond = {19}},
		{ID = 136,Imageid = 22370,Desc = --[[!AUTO_1878]]"擊敗重劍弟子：%d/6",BoardCond = {19}},
		{ID = 137,Imageid = 22372,Desc = --[[!AUTO_1878]]"擊敗轉輪弟子：%d/9",BoardCond = {19}},
		{ID = 0,Imageid = 22367,Desc = --[[!AUTO_1878]]"前往門派入口平臺",BoardCond = {20}},
		{ID = 138,Imageid = 22370,Desc = --[[!AUTO_1878]]"擊敗重劍弟子：%d/2",BoardCond = {21}},
		{ID = 139,Imageid = 22372,Desc = --[[!AUTO_1878]]"擊敗轉輪弟子：%d/2",BoardCond = {21}},
		{ID = 140,Imageid = 22377,Desc = --[[!AUTO_1878]]"擊敗背叛各個門派的弟子：%d/5",BoardCond = {21}},
		{ID = 0,Imageid = 22367,Desc = --[[!AUTO_1878]]"前往門派",BoardCond = {22}},
		{ID = 145,Imageid = 22365,Desc = --[[!AUTO_1878]]"擊敗樂厚：%d/1",BoardCond = {23}},
	}
}

Ectype.EctypeArgs[7305] =
{
	Name = --[[!AUTO_1874]]"副本追蹤",
	Desc = --[[!AUTO_1875]]"目標：馬匪頭領",
	Args =
	{
		{ID = 0,Imageid = 10160,Desc = --[[!AUTO_1876]]"接取任務",BoardCond = {1}, ArgsCond = {501,"<",1}},
		{ID = 0,Imageid = 10160,Desc = --[[!AUTO_1876]]"保護馬車前進",BoardCond = {1}, ArgsCond = {501,">",0}},
		{ID = 401,Imageid = 22914,Desc = --[[!AUTO_1877]]"擊敗狼匪：%d/4",BoardCond = {3}},
		{ID = 402,Imageid = 22915,Desc = --[[!AUTO_1877]]"擊敗沙狼：%d/8",BoardCond = {3}},
		{ID = 0,Imageid = 10160,Desc = --[[!AUTO_1878]]"穿過峽谷",BoardCond = {4}},
		{ID = 403,Imageid = 1357,Desc = --[[!AUTO_1879]]"擊敗山匪：%d/12",BoardCond = {4}},
		{ID = 404,Imageid = 22917,Desc = --[[!AUTO_1879]]"擊敗馬匪：%d/6",BoardCond = {5}},
		{ID = 0,Imageid = 22916,Desc = --[[!AUTO_1879]]"擊破馬匪衝殺陣",BoardCond = {5}},
		{ID = 0,Imageid = 22918,Desc = --[[!AUTO_1879]]"當馬匪頭領逃跑時，追殺之",BoardCond = {2}, ArgsCond = {502,">",90}},

	}
}

Ectype.EctypeArgs[7306] =
{
	Name = --[[!AUTO_1874]]"副本追蹤",
	Desc = --[[!AUTO_1875]]"目標：蒙古將軍",
	Args =
	{
		{ID = 0,Imageid = 10160,Desc = --[[!AUTO_1876]]"接取任務",BoardCond = {1}, ArgsCond = {501,"<",1}},
		{ID = 0,Imageid = 10160,Desc = --[[!AUTO_1876]]"突擊龍門客棧",BoardCond = {1}, ArgsCond = {501,">",0}},
		{ID = 401,Imageid = 1419,Desc = --[[!AUTO_1877]]"擊敗鐵拳守衛：%d/2",BoardCond = {3}},
		{ID = 402,Imageid = 22919,Desc = --[[!AUTO_1878]]"擊敗蒙古衛兵：%d/8",BoardCond = {4}},
		{ID = 0,Imageid = 10160,Desc = --[[!AUTO_1879]]"深入客棧內部",BoardCond = {5}},
		{ID = 403,Imageid = 22920,Desc = --[[!AUTO_1879]]"擊敗狂沙薩滿：%d/3",BoardCond = {6}},
		{ID = 0,Imageid = 10160,Desc = --[[!AUTO_1879]]"找到信使和將軍",BoardCond = {7}},
		{ID = 405,Imageid = 22922,Desc = --[[!AUTO_1879]]"擊敗蒙古信使：%d/1",BoardCond = {8}},
		{ID = 404,Imageid = 22921,Desc = --[[!AUTO_1879]]"擊敗蒙古將軍：%d/1",BoardCond = {8}},
		{ID = 0,Imageid = 932,Desc = --[[!AUTO_1879]]"尋找龍門客棧內的寶箱",BoardCond = {2}, ArgsCond = {502,">",90}},

	}
}

Ectype.EctypeArgs[7307] =
{
	Name = --[[!AUTO_1874]]"副本追蹤",
	Desc = --[[!AUTO_1875]]"目標：異域刺客",
	Args =
	{
		{ID = 0,Imageid = 10160,Desc = --[[!AUTO_1876]]"接取任務",BoardCond = {1}, ArgsCond = {501,"<",1}},
		{ID = 401,Imageid = 22923,Desc = --[[!AUTO_1879]]"擊敗異域刺客：%d/1",BoardCond = {1}, ArgsCond = {501,">",0}},
		{ID = 0,Imageid = 7851,Desc = --[[!AUTO_1879]]"幫助森林裡的小動物",BoardCond = {2}, ArgsCond = {502,">",90}},

	}
}

Ectype.EctypeArgs[7626] =
{
	Name = "副本追蹤",
	Desc = "目標：剿滅潛伏在倉庫周圍的盜賊",
	Args =
	{
		{ID = 0,Imageid = 10998,Desc = "前往北面的@倉庫平臺[pos3 5.213, 35.295, 75.915]",ArgsCond = {401,"=",1}},
		{ID = 0,Imageid = 10998,Desc = "調查平臺附近的可疑物並清剿盜賊",ArgsCond = {401,"=",1}},
		{ID = 201,Imageid = 20125,Desc = "@甲號箭塔[pos3 8.543, 31.709, 18.411]可運行^FFFF00%d^FFFFFF分鐘",ArgsCond = {401,"=",2}},
		{ID = 202,Imageid = 20125,Desc = "@乙號箭塔[pos3 -23.978, 31.61, -26.491]可運行^FFFF00%d^FFFFFF分鐘",ArgsCond = {401,"=",2}},
		{ID = 203,Imageid = 20125,Desc = "@丙號箭塔[pos3 70.212, 31.618, -27.734]可運行^FFFF00%d^FFFFFF分鐘",ArgsCond = {401,"=",2}},
		{ID = 204,Imageid = 20125,Desc = "@丁號箭塔[pos3 8.133, 31.637, -62.172]可運行^FFFF00%d^FFFFFF分鐘",ArgsCond = {401,"=",2}},
		{ID = 303,Imageid = 10998,Desc = "擊敗@盜賊首領[target 5.213, 35.295, 75.915, monster=87522]：%d/1",ArgsCond = {401,"=",3}},
	}
}

Ectype.EctypeArgs[7630] =
{
	Name = --[[!AUTO_1874]]"副本追蹤",
	Desc = --[[!AUTO_1875]]"目標：破解桃谷迷陣",
	Args =
	{
		{ID = 0,Imageid = 1946,Desc = --[[!AUTO_1876]]"接取任務",ArgsCond = {200,"=",0}},
		{ID = 211,Imageid = 23898,Desc = --[[!AUTO_1879]]"擊敗桃谷僧墨：%d/30",ArgsCond = {400,"=",1}},
		{ID = 212,Imageid = 1947,Desc = --[[!AUTO_1879]]"破解第二陣——桃幹仙",ArgsCond = {400,"=",2}},
		{ID = 213,Imageid = 23899,Desc = --[[!AUTO_1879]]"擊敗桃谷僧白：%d/50",ArgsCond = {400,"=",3}},
		{ID = 403,Imageid = 2103,Desc = --[[!AUTO_470]]"倒計時：%d秒",ArgsCond = {400,"=",3}},
		{ID = 214,Imageid = 1950,Desc = --[[!AUTO_1879]]"破解第四陣——花枝葉三兄弟",ArgsCond = {400,"=",4}},
		{ID = 404,Imageid = 2103,Desc = --[[!AUTO_470]]"倒計時：%d秒",ArgsCond = {400,"=",4}},
		{ID = 215,Imageid = 1946,Desc = --[[!AUTO_1879]]"終陣——5分鐘內擊敗盡可能多的敵人",ArgsCond = {400,"=",5}},
		{ID = 405,Imageid = 2103,Desc = --[[!AUTO_470]]"倒計時：%d秒",ArgsCond = {400,"=",5}},
	}
}

Ectype.AssemblyArg = {}
Ectype.AssemblyArg[2966] =  --比武大会
{
--  图标ID, 旗子数, 杀人数, 队伍颜色匹配
	{16933, 	201, 	401, 	301},	--红队
	{16935, 	202, 	402, 	302},	--蓝队
	{16936, 	203, 	403, 	303},	--黄队
	{16934, 	204, 	404, 	304},	--绿队
	{16932, 	205, 	405, 	305},	--紫队
}

Ectype.AssemblyArg[3059] =  --比武大会
{
--  图标ID, 旗子数, 杀人数, 队伍颜色匹配
	{16933, 	201, 	401, 	301},	--红队
	{16935, 	202, 	402, 	302},	--蓝队
	{16936, 	203, 	403, 	303},	--黄队
	{16934, 	204, 	404, 	304},	--绿队
	{16932, 	205, 	405, 	305},	--紫队
}

Ectype.AssemblyArg[3060] =  --比武大会
{
--  图标ID, 旗子数, 杀人数, 队伍颜色匹配
	{16933, 	201, 	401, 	301},	--红队
	{16935, 	202, 	402, 	302},	--蓝队
	{16936, 	203, 	403, 	303},	--黄队
	{16934, 	204, 	404, 	304},	--绿队
	{16932, 	205, 	405, 	305},	--紫队
}

Ectype.AssemblyArg[3061] =  --比武大会
{
--  图标ID, 旗子数, 杀人数, 队伍颜色匹配
	{16933, 	201, 	401, 	301},	--红队
	{16935, 	202, 	402, 	302},	--蓝队
	{16936, 	203, 	403, 	303},	--黄队
	{16934, 	204, 	404, 	304},	--绿队
	{16932, 	205, 	405, 	305},	--紫队
}

Ectype.AssemblyArg[3062] =  --比武大会
{
--  图标ID, 旗子数, 杀人数, 队伍颜色匹配
	{16933, 	201, 	401, 	301},	--红队
	{16935, 	202, 	402, 	302},	--蓝队
	{16936, 	203, 	403, 	303},	--黄队
	{16934, 	204, 	404, 	304},	--绿队
	{16932, 	205, 	405, 	305},	--紫队
}

Ectype.EctypeArgs[5980] =
{
	Name = --[[!AUTO_2071]]"副本追蹤",
	Desc = --[[!AUTO_2072]]"目標：保護賈滄瀾！",
	Args =
	{
		{ID = 15,Imageid = 10998,Desc = --[[!AUTO_2073]]"擊殺@神秘刀客[target 292.859, 87.23, -148.88, monster=80122](%SA[15]/4)",BoardCond = {1}},
		{ID = 16,Imageid = 10998,Desc = --[[!AUTO_2074]]"擊殺@神秘刀客[target 287.996, 86.784, -129.71, monster=80122]（%SA[16]/4）及@神秘刀客頭目[target 308.465, 86.847, -109.593, monster=81001](%SA[15]/1)",BoardCond = {1}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_2075]]"離開副本",BoardCond = {2}},
	}
}

Ectype.EctypeArgs[7523] =
{
	Name = --[[!AUTO_2076]]"副本追蹤",
	Desc = --[[!AUTO_2077]]"目標：血洗長樂山",
	Args =
	{
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_2078]]"長樂山巔，雷雨傾盆而至",BoardCond = {1}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_2079]]"穿過茫茫雨簾，是最殘忍的背叛與刻骨的怨恨",BoardCond = {3}},
		{ID = 15,Imageid = 10998,Desc = --[[!AUTO_2080]]"擺脫@龍圖心腹[target -18.40, 116.73, -18.75, monster=86759](%d/6)的圍堵",BoardCond = {4}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_2081]]"縱再多傾訴，然今日也將反目",BoardCond = {5}},
		{ID = 15,Imageid = 10998,Desc = --[[!AUTO_2082]]"擊殺@龍圖[target -35.1, 115.12, -1.14, monster=86760](%d/1)",BoardCond = {6}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_2083]]"緣盡於此，聽完鳶蘿的講述，先@下山[pos3 10.5, 117, -43]去",BoardCond = {7}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_2084]]"離開副本",BoardCond = {2}},
	}
}

Ectype.EctypeArgs[7613] =
{
	Name = --[[!AUTO_2076]]"副本追蹤",
	Desc = --[[!AUTO_2077]]"目標：抓住蒙古奸細",
	Args =
	{
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_2078]]"進入@明軍大營[pos3 -308, 90, -318]",BoardCond = {1}},
		{ID = 15,Imageid = 10998,Desc = --[[!AUTO_2080]]"點擊@火炮[target -296.8, 90, -312,npc=87295]抓住混入蒙古大營的奸細(%d/1)",BoardCond = {3}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_2081]]"離開副本",BoardCond = {2}},
	}
}

Ectype.EctypeArgs[7687] =
{
	Name = --[[!AUTO_2076]]"副本追蹤",
	Desc = --[[!AUTO_2077]]"目標：趕羊入圈",
	Args =
	{
		{ID = 0,Imageid = 20097,Desc = "把小綿羊趕入自家羊圈。黑隊每趕一隻黑羊得3分，一隻白羊得1分；白隊每趕一隻白羊得3分，一隻黑羊得1分。得分高的一方獲勝哦！",BoardCond = {1}},
		{ID = 201,Imageid = 2103,Desc = "比賽剩餘時間：小於 %d 分鐘。",BoardCond = {1}},
	}
}

Ectype.EctypeArgs[7709] =
{
	Name = --[[!AUTO_2076]]"副本追蹤",
	Desc = --[[!AUTO_2077]]"目標：夜探福王府",
	Args =
	{
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_2078]]"和@婢女[target -95.149, 15.581, 8.305, NPC=87561]交談",BoardCond = {1}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_2079]]"擊殺@福王[target -62.758, 16.750, 15.1691, monster=87722](%SA[102]/1)",BoardCond = {1}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_2079]]"和@方行之[target -62.820, 16.745, 12.118, NPC=87554]交談",BoardCond = {2}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_2080]]"離開副本",BoardCond = {2}},
	}
}

Ectype.EctypeArgs[7984] =
{
	Name = --[[!AUTO_2081]]"副本追蹤",
	Desc = --[[!AUTO_2082]]"目標：完成一次回憶",
	Args =
	{
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_2083]]"走進@記憶深處[pos3 127.13, 70, -20.94]，你會看到最快樂的時光",BoardCond = {3}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_2084]]"玲瓏聲東擊西地和你玩捉迷藏，快點找到她吧！",BoardCond = {4}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_2085]]"和@玲瓏[target 81.66, 70, 0.59,npc=88349]對話",BoardCond = {7}},
		{ID = 200,Imageid = 10998,Desc = --[[!AUTO_2086]]"殺死前來作亂的@黃鼠狼[target 72.63, 70, 3.59,monster=88377](%d/4)。",BoardCond = {10}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_2087]]"和@花娘[target 80.12, 70, 9.02,npc=88351]對話",BoardCond = {8}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_2088]]"去給@菊花[target 157.57, 70, -38.25,mine=88360]澆澆水吧",BoardCond = {12}},
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_2089]]"畫面定格在最美的一刻。回憶落幕，前方茫茫的路，就是通往現實的@出口[pos3 142.58, 70, -58.88]",BoardCond = {9}},		
		{ID = 0,Imageid = 10998,Desc = --[[!AUTO_2090]]"離開副本",BoardCond = {9}},
	}
}

Ectype.EctypeArgs[8306] =
{
	Name = "副本追蹤",
	Desc = "目標：擊敗江晚愁，拯救村寨",
	Args =
	{
		{ID = 0,Imageid = 2103,Desc = "進入村寨，尋找惡徒",BoardCond = {1}},
		{ID = 0,Imageid = 24712,Desc = "擊殺雷霸天",BoardCond = {2}},
		{ID = 0,Imageid = 2103,Desc = "跳過破橋，深入探索",BoardCond = {3}},
		{ID = 0,Imageid = 2103,Desc = "擊殺攔路的逍遙棄徒",BoardCond = {4}},
		{ID = 0,Imageid = 2103,Desc = "繼續前進，擊潰所有阻礙",BoardCond = {5,7,10}},
		{ID = 0,Imageid = 24714,Desc = "擊殺鬱清流",BoardCond = {6}},
		{ID = 0,Imageid = 2103,Desc = "擊殺攔路的日月棄徒",BoardCond = {8}},
		{ID = 0,Imageid = 24713,Desc = "擊殺梅溪飛",BoardCond = {9}},
		{ID = 0,Imageid = 24711,Desc = "擊殺江晚愁",BoardCond = {11}},
		{ID = 0,Imageid = 2103,Desc = "副本完成",BoardCond = {12}},
		--{ID = 9,Imageid = 6826,Desc = "战斗分数: %d"},
		--{ID = 201,Imageid = 6852,Desc = "完美度: %d"},
	}
}

Ectype.EctypeArgs[8578] =
{
	Name = "副本追蹤",
	Desc = "目標：突破更多層數",
	Args =
	{
		{ID = 0,Desc = "等待隊長選取場景怪物",BoardCond = {1}},
		{ID = 0,Desc = "儘快擊敗所有守關敵人，進入下一層",BoardCond = {2,3,4,5,6,7}},
		{ID = 0,Desc = "副本完成",BoardCond = {8}},
		--{ID = 9,Imageid = 6826,Desc = "战斗分数: %d"},
		--{ID = 201,Imageid = 6852,Desc = "完美度: %d"},
	}
}

--处理面板显示
function Ectype:GetEctypeArg(idEctype,idBoard)
	if Ectype.EctypeArgs[idEctype] then
		local tbl_args = {}
		tbl_args.Name = Ectype.EctypeArgs[idEctype].Name
		tbl_args.Desc = Ectype.EctypeArgs[idEctype].Desc
		tbl_args.CanExit = Ectype.EctypeArgs[idEctype].CanExit
		tbl_args.Args = {}
		local idxArg  = 1
		for i=1,#Ectype.EctypeArgs[idEctype].Args do
			if Ectype.EctypeArgs[idEctype].Args[i].BoardCond == nil or
			Ectype:ValueInTable(idBoard,Ectype.EctypeArgs[idEctype].Args[i].BoardCond) == true then
				tbl_args.Args[idxArg] = {}
				tbl_args.Args[idxArg].ID      =
				Ectype.EctypeArgs[idEctype].Args[i].ID
				tbl_args.Args[idxArg].Imageid =
				Ectype.EctypeArgs[idEctype].Args[i].Imageid
				tbl_args.Args[idxArg].Desc    =
				Ectype.EctypeArgs[idEctype].Args[i].Desc
				tbl_args.Args[idxArg].ArgsCond    =
				Ectype.EctypeArgs[idEctype].Args[i].ArgsCond
				idxArg = idxArg + 1
			end
		end
		return tbl_args
	end
	return nil
end

Ectype.EctypeArgs[8287] =
{
	Name = "副本追蹤",
	Desc = "目標：擊敗定逸師太",
	Args =
	{
		{ID = 0,Imageid = 2103,Desc = "擊敗定逸師太",BoardCond = {1}},
		{ID = 0,Imageid = 2103,Desc = "副本完成",BoardCond = {2}},
	}
}

Ectype.EctypeArgs[8312] =
{
	Name = "副本追蹤",
	Desc = "目標：擊敗面紗女子",
	Args =
	{
		{ID = 0,Imageid = 2103,Desc = "擊敗面紗女子",BoardCond = {1}},
		{ID = 0,Imageid = 2103,Desc = "副本完成",BoardCond = {2}},
	}
}

Ectype.EctypeArgs[8269] =
{
	Name = "副本追蹤",
	Desc = "目標：尋找神器，覆滅恒山",
	Args =
	{
		{ID = 0,Imageid = 2103,Desc = "消滅山門恒山弟子進入懸空寺",BoardCond = {1}},
		{ID = 0,Imageid = 2103,Desc = "消滅懸空寺所有恒山弟子",BoardCond = {2}},
		{ID = 0,Imageid = 2103,Desc = "擊敗兩位恒山師太",BoardCond = {3}},
		{ID = 0,Imageid = 2103,Desc = "與東方姑娘會和",BoardCond = {4}},
		{ID = 0,Imageid = 2103,Desc = "激戰儀琳",BoardCond = {5}},
		{ID = 0,Imageid = 2103,Desc = "副本完成",BoardCond = {6}},
	}
}

Ectype.EctypeArgs[8386] =
{
	Name = "副本追蹤",
	Desc = "目標：大亂鬥！脫穎而出！",
	Args =
	{
		{ID = 0,Imageid = 2103,Desc = "消滅所有蒙古高手",BoardCond = {1}},
		{ID = 0,Imageid = 2103,Desc = "戰勝所有中原江湖散人",BoardCond = {3}},
		{ID = 0,Imageid = 2103,Desc = "擊敗十大門派弟子",BoardCond = {4}},
		{ID = 0,Imageid = 2103,Desc = "副本完成",BoardCond = {2}},
	}
}

Ectype.EctypeArgs[8387] =
{
	Name = "副本追蹤",
	Desc = "目標：戰勝定癡師太",
	Args =
	{
		{ID = 0,Imageid = 2103,Desc = "戰勝定癡師太",BoardCond = {1}},
		{ID = 0,Imageid = 2103,Desc = "副本完成",BoardCond = {2}},
	}
}

Ectype.EctypeArgs[8388] =
{
	Name = "副本追蹤",
	Desc = "目標：戰勝左冷禪",
	Args =
	{
		{ID = 0,Imageid = 2103,Desc = "戰勝左冷禪",BoardCond = {1}},
		{ID = 0,Imageid = 2103,Desc = "副本完成",BoardCond = {2}},
	}
}

Ectype.EctypeArgs[8445] =
{
	Name = "副本追蹤",
	Desc = "目標：戰勝採花大盜孟波波",
	Args =
	{
		{ID = 0,Imageid = 2103,Desc = "戰勝採花大盜孟波波",BoardCond = {1}},
		{ID = 0,Imageid = 2103,Desc = "副本完成",BoardCond = {2}},
	}
}

Ectype.EctypeArgs[8446] =
{
	Name = "副本追蹤",
	Desc = "目標：打敗五波敵人，守護姻緣樹長大",
	Args =
	{
		{ID = 0,Imageid = 10998,Desc = "將姻緣樹種子種到@土堆[target -235.473, 133.092, 57.4915,mine=90508]中！",BoardCond = {1}},
		{ID = 0,Imageid = 10998,Desc = "第一波怪物來襲，擊退它們！",BoardCond = {3}},
		{ID = 0,Imageid = 10998,Desc = "第二波怪物來襲，擊退它們！",BoardCond = {4}},
		{ID = 0,Imageid = 10998,Desc = "第三波怪物來襲，擊退它們！",BoardCond = {5}},
		{ID = 0,Imageid = 10998,Desc = "第四波怪物來襲，擊退它們！",BoardCond = {6}},
		{ID = 0,Imageid = 10998,Desc = "第五波怪物來襲，擊退它們！",BoardCond = {7}},			
		{ID = 0,Imageid = 10998,Desc = "離開副本",BoardCond = {2}},
	}
}

Ectype.EctypeArgs[8459] =
{
	Name = "副本追蹤",
	Desc = "目標：打敗前來抓捕織女的天兵將領,保護牛郎織女",
	Args =
	{
		{ID = 15,Imageid = 22921,Desc = "打敗@天兵將領[target -32.9235, 34.0516, 43.6426,monster=90593](%d/1)",BoardCond = {1}},			
		{ID = 0,Imageid = 22921,Desc = "離開副本",BoardCond = {2}},
	}
}

Ectype.EctypeArgs[8555] =
{
	Name = "副本追蹤",
	Desc = "目標：擊敗月宮所有敵人！",
	Args =
	{
		{ID = 0,Imageid = 10998,Desc = "月宮侍衛人多勢眾，殺掉他們！",BoardCond = {1}},
		{ID = 0,Imageid = 10998,Desc = "擊退月宮侍衛長！",BoardCond = {3}},
		{ID = 0,Imageid = 10998,Desc = "調查線索，引出司空掠影，然後戰勝他！",BoardCond = {4}},
		{ID = 0,Imageid = 10998,Desc = "擊退左右護法！",BoardCond = {5}},
		{ID = 0,Imageid = 10998,Desc = "擊退吳剛！",BoardCond = {2}},
		{ID = 0,Imageid = 10998,Desc = "離開副本",BoardCond = {2}},
	}
}

Ectype.EctypeArgs[8556] =
{
	Name = "副本追蹤",
	Desc = "目標：擊敗藥王廟虎頭幫所有土匪！",
	Args =
	{
		{ID = 0,Imageid = 10998,Desc = "擊退虎頭幫嘍囉！",BoardCond = {1}},
		{ID = 0,Imageid = 10998,Desc = "擊退虎頭幫精英！",BoardCond = {3}},
		{ID = 0,Imageid = 10998,Desc = "擊退虎頭幫長老！",BoardCond = {4}},
		{ID = 0,Imageid = 10998,Desc = "擊退虎頭幫幫主！",BoardCond = {2}},			
		{ID = 0,Imageid = 10998,Desc = "離開副本",BoardCond = {2}},
	}
}

Ectype.EctypeArgs[8691] =
{
	Name = "副本追蹤",
	Desc = "目標：擊敗所有敵人！",
	Args =
	{
		{ID = 0,Imageid = 10998,Desc = "擊退所有金蠍！",BoardCond = {1}},	
		{ID = 0,Imageid = 10998,Desc = "擊退所有青蛇！",BoardCond = {3}},
		{ID = 0,Imageid = 10998,Desc = "擊退所有蜈蚣 ！",BoardCond = {4}},	
		{ID = 0,Imageid = 10998,Desc = "擊退所有玉蟾！",BoardCond = {5}},	
		{ID = 0,Imageid = 10998,Desc = "擊退所有聖蛛！",BoardCond = {6}},	
		{ID = 0,Imageid = 10998,Desc = "離開副本",BoardCond = {2}},
	}
}

Ectype.EctypeArgs[8692] =
{
	Name = "副本追蹤",
	Desc = "目標：完成儀琳的委託！",
	Args =
	{
		{ID = 118692,Imageid = 10998,Desc = "擊殺全部@嵩山惡徒[target 10.2,66.1,97.6,monster=91529](%d/20)",BoardCond = {1}},
		{ID = 0,Imageid = 10998,Desc = "從@包袱[target 10.29,67.42,108.88,mine=4642]找到^24ff00拭布^ffffff，隨後擦拭@恒山香爐[pos3 9.94,66.13,102.126]（在香爐附近使用任務道具^24ff00拭布^ffffff）",BoardCond = {2}},
		{ID = 128692,Imageid = 10998,Desc = "擊殺全部@嵩山刺客[target 10.5,66.1,84.8,monster=91530](%d/20)",BoardCond = {3}},
		{ID = 0,Imageid = 10998,Desc = "萬物制衡，恒久不變，英雄後會有期",BoardCond = {4}},
	}
}

Ectype.EctypeArgs[8695] =
{
	Name = "副本追蹤",
	Desc = "目標：擊敗所有敵人!",
	Args =
	{
		{ID = 118695,Imageid = 10998,Desc = "擊殺@下部銅人[target -69.5,111.8,0.1,monster=91531](%d/6)",BoardCond = {1}},
		{ID = 128695,Imageid = 10998,Desc = "擊殺@中部銅人[target -79.9,111.7,0.3,monster=91531](%d/6)",BoardCond = {3}},
		{ID = 138695,Imageid = 10998,Desc = "擊殺@上部銅人[target -73.4,111.8,-10.7,monster=91531](%d/6)",BoardCond = {4}},
		{ID = 118695,Imageid = 10998,Desc = "擊殺@下部銅人[target -69.5,111.8,0.1,monster=91531](%d/6)",BoardCond = {5}},
		{ID = 128695,Imageid = 10998,Desc = "擊殺@中部銅人[target -79.9,111.7,0.3,monster=91531](%d/6)",BoardCond = {5}},
		{ID = 138695,Imageid = 10998,Desc = "擊殺@上部銅人[target -73.4,111.8,-10.7,monster=91531](%d/6)",BoardCond = {5}},
		{ID = 0,Imageid = 10998,Desc = "離開副本！",BoardCond = {2}},	
	}
}
Ectype.EctypeArgs[8694] =
{
	Name = "副本追蹤",
	Desc = "目標：擊敗所有敵人!",
	Args =
	{
		{ID = 0,Imageid = 10998,Desc = "擊殺東廠侍衛！",BoardCond = {1}},
		{ID = 0,Imageid = 10998,Desc = "擊殺惡犬！",BoardCond = {3}},
		{ID = 0,Imageid = 10998,Desc = "擊殺簡從雲！",BoardCond = {2}},
		{ID = 0,Imageid = 10998,Desc = "等待返回大世界",BoardCond = {4}},
	}
}
Ectype.EctypeArgs[8709] =
{
	Name = "副本追蹤",
	Desc = "目標：擊敗所有敵人!",
	Args =
	{
		{ID = 0,Imageid = 10998,Desc = "發狂的嶽不群!",BoardCond = {1}},	
		{ID = 0,Imageid = 10998,Desc = "岳不群恢復理智",BoardCond = {3}},
	}
}
Ectype.EctypeArgs[8711] =
{
	Name = "副本追蹤",
	Desc = "目標：擊敗所有敵人！",
	Args =
	{
		{ID = 0,Imageid = 10998,Desc = "找出隱匿在眾衡山派習武弟子中的魏無形。",BoardCond = {1}},
		{ID = 0,Imageid = 10998,Desc = "擊敗魏無形！",BoardCond = {3}},
		{ID = 0,Imageid = 10998,Desc = "離開副本",BoardCond = {2}},
	}
}
Ectype.EctypeArgs[8696] =
{
	Name = "副本追蹤",
	Desc = "目標：擊敗所有蟲王，搶奪靈芝！",
	Args =
	{
		{ID = 0,Imageid = 10998,Desc = "殺掉所有蟲王。",BoardCond = {1}},
		{ID = 0,Imageid = 10998,Desc = "採集靈芝！",BoardCond = {2}},
		{ID = 0,Imageid = 10998,Desc = "離開副本",BoardCond = {2}},
	}
}
Ectype.EctypeArgs[8720] =
{
	Name = "副本追蹤",
	Desc = "目標：擊敗機關人，殺死唐五！",
	Args =
	{
		{ID = 0,Imageid = 10998,Desc = "走到地圖中間的圓心中。",BoardCond = {1}},
		{ID = 0,Imageid = 10998,Desc = "擊敗所有機關人！",BoardCond = {4}},
		{ID = 0,Imageid = 10998,Desc = "擊敗三大機關人頭目！",BoardCond = {3}},
		{ID = 0,Imageid = 10998,Desc = "離開副本",BoardCond = {2}},
	}
}
Ectype.EctypeArgs[8714] =
{
	Name = "副本追蹤",
	Desc = "目標：擊敗所有敵人！",
	Args =
	{
		{ID = 0,Imageid = 10998,Desc = "宵小人數眾多，必須一鼓作氣幹掉他們！",BoardCond = {1}},
		{ID = 0,Imageid = 10998,Desc = "宵小頭目武功高強，不可輕敵，殺了他們！",BoardCond = {3}},
		{ID = 0,Imageid = 10998,Desc = "將宵小的屍體扔進聖火之中！",BoardCond = {2}},
		{ID = 0,Imageid = 10998,Desc = "離開副本",BoardCond = {2}},
	}
}
Ectype.EctypeArgs[8712] =
{
	Name = "副本追蹤",
	Desc = "目標：逍遙門人，琴棋書畫兼修",
	Args =
	{
		{ID = 0,Imageid = 10998,Desc = "擊敗琴魔",BoardCond = {1}},
		{ID = 0,Imageid = 10998,Desc = "擊敗棋子",BoardCond = {4}},
		{ID = 0,Imageid = 10998,Desc = "降伏判官筆",BoardCond = {5}},
		{ID = 0,Imageid = 10998,Desc = "擊敗畫癡",BoardCond = {6}},
		{ID = 0,Imageid = 10998,Desc = "離開副本",BoardCond = {2}},
	}
}
Ectype.EctypeArgs[8880] =
{
	Name = "副本追蹤",
	Desc = "目標：在5分鐘內，擊碎盡可能多的箱子獲取珍寶，珍寶越多，獎勵越豐富！",
	Args =
	{
		{ID = 201,Imageid = 10998,Desc = "計時：%d秒",BoardCond = {1}},
		{ID = 0,Imageid = 10998,Desc = "離開副本",BoardCond = {2}},
	}
}
Ectype.EctypeArgs[9001] =
{
	Name = "副本追蹤",
	Desc = "目標：在10分鐘內，擊殺盡可能多的怪物,擊殺怪物越多,積分越高！",
	Args =
	{
		{ID = 0,Imageid = 10998,Desc = "離開副本",BoardCond = {2}},
	}
}
Ectype.EctypeArgs[9008] =
{
	Name = "副本追蹤",
	Desc = "目標：擊敗所有敵人！",
	Args =
	{
		{ID = 0,Imageid = 10998,Desc = "擊敗金刀門的醉金刀——王虎",BoardCond = {1}},
		{ID = 0,Imageid = 10998,Desc = "擊敗五仙棄徒——五毒教主",BoardCond = {3}},
		{ID = 0,Imageid = 10998,Desc = "擊敗嵩山派的萬相——魏無形",BoardCond = {4}},
		{ID = 0,Imageid = 10998,Desc = "擊敗魏無形的本體",BoardCond = {5}},
		{ID = 0,Imageid = 10998,Desc = "擊敗青城派掌門——餘滄海",BoardCond = {2}},
	}
}

Ectype.EctypeArgs[9011] =
{
	Name = "副本追蹤",
	Desc = "目標：獨孤功法，須得時常試煉，方能熟練掌握。",
	Args =
	{
		{ID = 0,Imageid = 10998,Desc = "就拿這些嵩山傀儡人練練手！",BoardCond = {1}},
		{ID = 0,Imageid = 10998,Desc = "離開副本",BoardCond = {2}},
	}
}


Ectype.EctypeArgs[9015] =
{
	Name = "副本追蹤",
	Desc = "目標：教訓地頭蛇，釀成屠蘇酒。",
	Args =
	{
		{ID = 0,Imageid = 10998,Desc = "打敗這些邪惡的地頭蛇！",BoardCond = {1}},
		{ID = 0,Imageid = 10998,Desc = "找到釀酒的工具，釀制屠蘇酒，並且打敗前來復仇的龍傲天！",BoardCond = {2}},
		{ID = 0,Imageid = 10998,Desc = "離開副本",BoardCond = {2}},
	}
}

Ectype.EctypeArgs[8968] =
{
	Name = "副本追蹤",
	Desc = "目標：收集聖誕禮物，擊敗邪惡聖誕老人。",
	Args =
	{
		{ID = 0,Imageid = 10998,Desc = "",BoardCond = {1}},
		{ID = 0,Imageid = 10998,Desc = "迅速趕往@禮物丟失地點[pos3 229.978,42.986,241.117]！(所有隊員抵達目的地時即可達成目標,中途不要離開副本，否則可能導致剩下的玩家無法完成副本)",BoardCond = {3}},
		{ID = 0,Imageid = 10998,Desc = "把所有丟失的聖誕禮物都收集一次，並擊敗邪惡聖誕使徒之後就能傳送到下一個禮物丟失地！",BoardCond = {4}},
		{ID = 0,Imageid = 10998,Desc = "把所有丟失的聖誕禮物都收集一次，並擊敗邪惡聖誕老人，帶著孩子們的禮物離開！\r完成副本前請一定保證包裹欄有2個空位接收獎勵！",BoardCond = {5}},
		{ID = 0,Imageid = 10998,Desc = "離開副本",BoardCond = {2}},
	}
}

Ectype.EctypeArgs[9073] =
{
	Name = "副本追蹤",
	Desc = "目標：識破福王的惡作劇，完成挑戰獲得最終獎勵，享用宴席獲得雙倍經驗BUFF。",
	Args =
	{
		{ID = 0,Imageid = 10998,Desc = "從福王的美人中找到擁有正確通關口令的美人，與之對話完成任務即可。(完成副本前請保證任務列表未滿，否則無法接收獎勵！)",BoardCond = {1}},
		{ID = 0,Imageid = 10998,Desc = "打敗所有的黑衣盜人，保護福王的珠寶箱！(完成副本前請保證任務列表未滿，否則無法接收獎勵！)",BoardCond = {3}},
		{ID = 0,Imageid = 10998,Desc = "與福王管家對話，識破福王的惡作劇！",BoardCond = {4}},
		{ID = 0,Imageid = 10998,Desc = "打敗福王假扮的孟波波！(完成副本前請保證任務列表未滿，否則無法接收獎勵！)",BoardCond = {2}},
		{ID = 0,Imageid = 10998,Desc = "吃宴領取雙倍經驗BUFF，離開副本",BoardCond = {2}},
	}
}
Ectype.EctypeArgs[9222] =
{
	Name = "副本追蹤",
	Desc = "目標：擊敗所有敵人!",
	Args =
	{
		{ID = 0,Imageid = 10998,Desc = "",BoardCond = {1}},	
		{ID = 15,Imageid = 10998,Desc = "擊殺@單身狗[target -359.341,135.001,297.792,monster=93890](%d/70)(切勿離開副本，否則會導致與隊友任務不同步)",BoardCond = {3}},
		{ID = 16,Imageid = 10998,Desc = "擊殺@花犯[target -357.088,136.537,309.277,monster=93891](%d/1)(切勿離開副本，否則會導致與隊友任務不同步)",BoardCond = {4}},
		{ID = 17,Imageid = 10998,Desc = "擊殺@燭飛影[target -356.615,139.347,336.646,monster=93892](%d/1)(切勿離開副本，否則會導致與隊友任務不同步)",BoardCond = {5}},
		{ID = 0,Imageid = 10998,Desc = "離開副本！",BoardCond = {2}},	
	}
}
Ectype.EctypeArgs[9243] =
{
	Name = "副本追蹤",
	Desc = "目標：擊敗所有敵人!",
	Args =
	{
		{ID = 15,Imageid = 10998,Desc = "擊殺@神秘人分身[target -66.8174,78.0368,-103.301,monster=94070](%d/12)",BoardCond = {1}},
		{ID = 0,Imageid = 10998,Desc = "逃離神秘人的追殺！",BoardCond = {3}},	
		{ID = 16,Imageid = 10998,Desc = "擊殺@神秘人[target -63.9374,78.0517,-107.791,monster=94069](%d/1)",BoardCond = {2}},
	}
}
Ectype.EctypeArgs[9280] =
{
	Name = "副本追蹤",
	Desc = "目標：擊敗所有敵人!",
	Args =
	{
		{ID = 0,Imageid = 10998,Desc = "與帝嬋切磋",BoardCond = {1}},
		{ID = 0,Imageid = 10998,Desc = "離開副本",BoardCond = {2}},
	}
}
Ectype.EctypeArgs[9281] =
{
	Name = "副本追蹤",
	Desc = "目標：擊敗所有敵人!",
	Args =
	{
		{ID = 0,Imageid = 10998,Desc = "與帝金過招",BoardCond = {1}},
		{ID = 0,Imageid = 10998,Desc = "離開副本",BoardCond = {2}},
	}
}
Ectype.EctypeArgs[9282] =
{
	Name = "副本追蹤",
	Desc = "目標：擊敗所有敵人!",
	Args =
	{
		{ID = 0,Imageid = 10998,Desc = "擊殺神鼎聖獸",BoardCond = {1}},
		{ID = 0,Imageid = 10998,Desc = "離開副本",BoardCond = {2}},
	}
}
Ectype.EctypeArgs[9580] =
{
	Name = "副本追蹤",
	Desc = "目標：擊敗所有敵人!",
	Args =
	{
		{ID = 0,Imageid = 10998,Desc = "擊敗天璿",BoardCond = {1}},
		{ID = 0,Imageid = 10998,Desc = "離開副本",BoardCond = {2}},
	}
}
Ectype.EctypeArgs[9581] =
{
	Name = "副本追蹤",
	Desc = "目標：擊敗所有敵人!",
	Args =
	{
		{ID = 0,Imageid = 10998,Desc = "擊敗天璣、天權",BoardCond = {1}},
		{ID = 0,Imageid = 10998,Desc = "離開副本",BoardCond = {2}},
	}
}
Ectype.EctypeArgs[9582] =
{
	Name = "副本追蹤",
	Desc = "目標：擊敗所有敵人!",
	Args =
	{
		{ID = 0,Imageid = 10998,Desc = "擊敗玉衡、開陽、搖光",BoardCond = {1}},
		{ID = 0,Imageid = 10998,Desc = "離開副本",BoardCond = {2}},
	}
}
Ectype.EctypeArgs[9583] =
{
	Name = "副本追蹤",
	Desc = "目標：擊敗所有敵人!",
	Args =
	{
		{ID = 0,Imageid = 10998,Desc = "擊敗金烏峰長老",BoardCond = {1}},
		{ID = 0,Imageid = 10998,Desc = "離開副本",BoardCond = {2}},
	}
}
Ectype.EctypeArgs[9584] =
{
	Name = "副本追蹤",
	Desc = "目標：擊敗所有敵人!",
	Args =
	{
		{ID = 0,Imageid = 10998,Desc = "擊敗明珠義父",BoardCond = {1}},
		{ID = 0,Imageid = 10998,Desc = "離開副本",BoardCond = {2}},
	}
}
Ectype.EctypeArgs[9035] =
{
	Name = "副本追蹤",
	Desc = "目標：終止帝青的惡行",
	Args =
	{
		{ID = 0,Imageid = 10998,Desc = "摧毀@五行聖壇-金[target -57.1059,187.212,-446.185,monster=93946](%SA[103]/1)\r摧毀@五行聖壇-水[target -102.594,187.212,-393.095,monster=93948](%SA[105]/1)\r摧毀@五行聖壇-土[target -11.7335,186.802,-392.832,monster=93950](%SA[107]/1)\r摧毀@五行聖壇-火[target -11.7009,187.212,-335.887,monster=93949](%SA[106]/1)\r摧毀@五行聖壇-木[target -102.615,187.212,-335.965,monster=93947](%SA[104]/1)\r摧毀全部聖壇後前往五行石門開啟@機關[pos3 -49.8011, 187.126,-292.129]",BoardCond = {1}},
		{ID = 903501,Imageid = 10998,Desc = "1.當心紅毒蛇死亡的位置\r3.石頭人死後會形成岩石堆，躲在後面可以減免怒吼傷害\r4.注意打斷石頭人的硬化狀態\r擊敗@被控制的玄武[target -56.9756,188.993,-219.145,monster=93919](%d/1)",BoardCond = {2}},
	    {ID = 0,Imageid = 10998,Desc = "幫助朱雀化解危機，前往龍虎台，破除朱雀身上的封印！\r擊敗@帝青的分身[target -57.1059,187.212,-446.185,monster=94325](%SA[703]/4)\r通過@鎖鏈[pos3 -196.808, 72.092, -119.857]向上攀爬",BoardCond = {3,10}},
	    {ID = 903502,Imageid = 10998,Desc = "1.白虎和旋風的攻擊可以吹散青龍的迷霧\r2.注意觀察青龍攻擊前的朝向\r3.青龍落地時，抓住機會攻擊它！\r4.當心海浪！\r摧毀@封印祭壇[target -57.1059,187.212,-446.185,monster=93817](%d/1)",BoardCond = {4}},
	    {ID = 903503,Imageid = 10998,Desc = "1.摧毀符文劍陣，破除封印儀式\r2.自爆變異體的自爆時可摧毀符文劍陣\r3.當心利爪鬼！\r摧毀@符文劍[target 274.405,815.984,-308.061,monster=93817](%SA[301]/4)\r擊敗@帝青[target 274.405,815.984,-308.061,monster=93817](%SA[704]/1)\r摧毀@封印祭壇[target -57.1059,187.212,-446.185,monster=93817](%d/1)",BoardCond = {5}},
	    {ID = 903504,Imageid = 10998,Desc = "1.阻止炸彈符文怪靠近朱雀\r2.炸彈符文怪死後會掉落炸藥桶\r3.拿起炸藥桶，放置在紅圈位置\r@朱雀[pos3 -6.03251, 136.798, 126.715]被攻擊次數：(%SA[610])/8)^FF0000（被攻擊8次戰鬥失敗）^FFFFFF\r放置@炸彈桶[pos3 34.9833, 137.508, 143.416](%SA[607]/6)\r擊敗@帝青與巨像[target 20.999,136.816,97.9405,monster=93817](%d/1)",BoardCond = {6,8}},
	    {ID = 0,Imageid = 10998,Desc = "帝青的陰謀已經破滅！少俠，感謝你！",BoardCond = {7}},
	}
}
Ectype.EctypeArgs[9719] =
{
	Name = "副本追蹤",
	Desc = "目標：擊敗所有敵人!",
	Args =
	{
		{ID = 971901,Imageid = 10998,Desc = "擊退@跟班[target -217.712,27.4072,-217.858,monster=95484](%d/16)",BoardCond = {1}},
		{ID = 971902,Imageid = 10998,Desc = "擊退@馬主人[target -209.049,27.541,-216.818,monster=95483](%d/1)",BoardCond = {3}},
		{ID = 0,Imageid = 10998,Desc = "與@白啟山[target -211.657,27.541,-213.543,monster=95274]對話",BoardCond = {2}},
	}
}
Ectype.EctypeArgs[9720] =
{
	Name = "副本追蹤",
	Desc = "目標：擊敗所有敵人!",
	Args =
	{
		{ID = 972001,Imageid = 10998,Desc = "擊殺@普通弟子[target 156.692,129.068,-142.645,monster=95488](%d/12)",BoardCond = {1}},
		{ID = 972002,Imageid = 10998,Desc = "擊殺@精英弟子[target 168.579,129.068,-136.722,monster=95489](%d/12)",BoardCond = {1}},	
		{ID = 972003,Imageid = 10998,Desc = "擊殺@天拳幫堂主[target 146.27,128.195,-156.039,monster=95485](%d/2)",BoardCond = {3}},
		{ID = 972004,Imageid = 10998,Desc = "擊殺@天拳幫少幫主[target 125.454,129.933,-82.7509,monster=95486](%d/1)",BoardCond = {4}},
		{ID = 972005,Imageid = 10998,Desc = "擊殺@天拳幫幫主[target 104.634,138.616,-126.94,monster=95487](%d/1)",BoardCond = {2}},
	}
}
Ectype.EctypeArgs[9737] =
{
	Name = "副本追蹤",
	Desc = "目標：擊敗所有敵人!",
	Args =
	{
		{ID = 0,Imageid = 10998,Desc = "擊敗鬼火傀儡",BoardCond = {1}},
		{ID = 0,Imageid = 10998,Desc = "擊敗邪教聖女",BoardCond = {2}},
		{ID = 0,Imageid = 10998,Desc = "擊敗紅衣女鬼",BoardCond = {2}},
		{ID = 0,Imageid = 10998,Desc = "離開副本",BoardCond = {2}},
	}
}
Ectype.EctypeArgs[9744] =
{
	Name = "副本追蹤",
	Desc = "目標：擊敗所有敵人!",
	Args =
	{
		{ID = 971901,Imageid = 10998,Desc = "擊退@跟班[target -217.712,27.4072,-217.858,monster=95484](%d/16)",BoardCond = {1}},
		{ID = 971902,Imageid = 10998,Desc = "擊退@馬主人[target -209.049,27.541,-216.818,monster=95483](%d/1)",BoardCond = {3}},
		{ID = 0,Imageid = 10998,Desc = "與@白啟山[target -211.657,27.541,-213.543,monster=95274]對話",BoardCond = {2}},
	}
}
Ectype.EctypeArgs[9745] =
{
	Name = "副本追蹤",
	Desc = "目標：擊敗所有敵人!",
	Args =
	{
		{ID = 972001,Imageid = 10998,Desc = "擊殺@普通弟子[target 156.692,129.068,-142.645,monster=95488](%d/12)",BoardCond = {1}},
		{ID = 972002,Imageid = 10998,Desc = "擊殺@精英弟子[target 168.579,129.068,-136.722,monster=95489](%d/12)",BoardCond = {1}},	
		{ID = 972003,Imageid = 10998,Desc = "擊殺@天拳幫堂主[target 146.27,128.195,-156.039,monster=95485](%d/2)",BoardCond = {3}},
		{ID = 972004,Imageid = 10998,Desc = "擊殺@天拳幫少幫主[target 125.454,129.933,-82.7509,monster=95486](%d/1)",BoardCond = {4}},
		{ID = 972005,Imageid = 10998,Desc = "擊殺@天拳幫幫主[target 104.634,138.616,-126.94,monster=95487](%d/1)",BoardCond = {2}},
	}
}
Ectype.EctypeArgs[9762] =
{
	Name = "副本追蹤",
	Desc = "目標：擊敗所有敵人!",
	Args =
	{
        {ID = 0,Imageid = 10998,Desc = "等待挑戰開始",BoardCond = {1}},		
		{ID = 0,Imageid = 10998,Desc = "過版引導：\r請少俠儘快破壞四個地脈泉湧，並消滅陰河山鬼！\r注意不要惹到兇殘的食人魚！\r破壞@地脈泉湧[target -39.8239,88.5798,-214.377,monster=95238](%SA[101]/4)\r消滅@陰河山鬼[target 85.319,103.625,-199.978,monster=95228](%SA[102]/10)",BoardCond = {2,3}},
		{ID = 9711401,Imageid = 10998,Desc = "過版引導：\r聚陰之地讓屍蹩產生了變異，請少俠儘快擊殺掉他們的首領,小心它的致命屍毒!\r擊殺@變異屍鱉王[target 52.9552,119.001,-104.805,monster=95646](%d/1)",BoardCond = {4}},	
		{ID = 9711501,Imageid = 10998,Desc = "過版引導：\r通過隧道並擊殺所有阻撓的怪物。\r消滅潛藏的@陰河石鬼[target -13.3107,141.622,-138.052,monster=95227](%d/12)",BoardCond = {5}},
		{ID = 9711601,Imageid = 10998,Desc = "過版引導：\r魔化山魈因與變異屍蹩的衝突而狂暴，少俠儘快將其擊敗。\r擊殺@魔化山魈[target -98.418,156.801,-54.5887,monster=95236](%d/1)",BoardCond = {6}},
		{ID = 0,Imageid = 10998,Desc = "過版引導：\r擊殺暗中操縱炎屍的血月祭司。\r消滅@血月祭司[target -43.3124,170.5,17.8958,monster=95657](%SA[601]/1)",BoardCond = {7}},
		{ID = 0,Imageid = 10998,Desc = "過版引導：\r熄滅四個角落的蛇靈石像機關，最後熄滅祭臺上的萬蛇神像來驅散強大的白起之骸。\r先熄滅@蛇靈石像[target -11.1619,184.104,166.962,monster=95236](%SA[701]/4)隨後\r熄滅@萬蛇神像[target 49.5655,200.263,155.511,monster=95236](%SA[702]/1)",BoardCond = {8,9}},
		{ID = 9711001,Imageid = 10998,Desc = "過版引導\r現在白起的魂體受到了聚魂燈的重創,請少俠一舉擊敗他。\r擊殺@白起之骸[target 108.758,198.243,9.75673,monster=95235](%d/1)",BoardCond = {10}},
		{ID = 0,Imageid = 10998,Desc = "過版引導\r可在@青烏子[target 219.149,200.025,-28.5637,monster=96101]處兌換稀有道具\r如需離開副本請點擊右上按鈕離開",BoardCond = {11}},
	}
}
Ectype.EctypeArgs[9751] =
{
	Name = --[[!AUTO_423]]"副本追蹤",
	Desc = --[[!AUTO_424]]"目標：攻破青城派松風觀",
	Args =
	{
		{ID = 0,Imageid = 2103,Desc = --[[!AUTO_425]]"前往吊橋",BoardCond = {1,18}},
		{ID = 0,Imageid = 1932,Desc = --[[!AUTO_426]]"全滅敵人後，突破松風觀第一門",BoardCond = {2,32}},
		{ID = 0,Imageid = 1932,Desc = --[[!AUTO_427]]"全滅敵人後，突破松風觀第二門",BoardCond = {3,33}},
		{ID = 0,Imageid = 1932,Desc = --[[!AUTO_428]]"全滅敵人後前進",BoardCond = {4,5,26,27,28,7}},
		{ID = 0,Imageid = 1926,Desc = --[[!AUTO_429]]"擊退羅人傑後，突破松風觀第三門",BoardCond = {22,34}},
		{ID = 0,Imageid = 1925,Desc = --[[!AUTO_430]]"擊退於人豪後，突破松風觀第四門",BoardCond = {23,35}},
                {ID = 0,Imageid = 1924,Desc = --[[!AUTO_431]]"擊退洪人雄後，突破松風觀第五門",BoardCond = {24,36}},
                {ID = 0,Imageid = 1923,Desc = --[[!AUTO_432]]"擊退侯人英後，突破松風觀最終門",BoardCond = {25,31}},
                {ID = 0,Imageid = 1927,Desc = --[[!AUTO_433]]"消滅青城四秀和眾多弟子，擊敗余滄海",BoardCond = {21,8}},
		--{ID = 201,Imageid = 6852,Desc = "完美度: %d"},
	}
}
Ectype.EctypeArgs[9760] =
{
	Name = --[[!AUTO_1242]]"副本追蹤",
	Desc = --[[!AUTO_1243]]"目標：從丁勉處奪得五嶽令旗",
	Args =
	{
		{ID = 0,Imageid = 2103,Desc = --[[!AUTO_1244]]"前往沙灘",BoardCond = {1}},
		{ID = 0,Imageid = 2239,Desc = --[[!AUTO_1245]]"從竹子處借力跳上懸崖",BoardCond = {3,5,7,9}},
		{ID = 0,Imageid = 1353,Desc = --[[!AUTO_1246]]"全滅敵人",BoardCond = {2,4,6}},
		{ID = 0,Imageid = 16855,Desc = --[[!AUTO_1247]]"破壞八槍陣後擊敗東海一槍",BoardCond = {8}},
		{ID = 0,Imageid = 1913,Desc = --[[!AUTO_1248]]"全滅敵人後擊敗丁勉",BoardCond = {10}},
		{ID = 0,Imageid = 2103,Desc = --[[!AUTO_1249]]"通關",BoardCond = {11}}
	}
}
Ectype.EctypeArgs[9761] =
{
	Name = --[[!AUTO_1494]]"副本追蹤",
	Desc = --[[!AUTO_1495]]"目標：擊敗飛狐三兄弟，奪取溪山行旅圖",
	Args =
	{
		{ID = 0,Imageid = 2103,Desc = --[[!AUTO_1496]]"前往山頂",BoardCond = {1,3,5,7}},
		{ID = 0,Imageid = 10223,Desc = --[[!AUTO_1497]]"全滅嵩山哨兵後前進",BoardCond = {2}},
		{ID = 0,Imageid = 16416,Desc = --[[!AUTO_1498]]"消滅飛狐女徒後前進",BoardCond = {4,10}},
		{ID = 0,Imageid = 16417,Desc = --[[!AUTO_1499]]"全滅梭鏢手後前進",BoardCond = {6,9,13}},
                {ID = 0,Imageid = 16856,Desc = --[[!AUTO_1500]]"擊殺白髮鬼",BoardCond = {8}},
		{ID = 0,Imageid = 16417,Desc = --[[!AUTO_1501]]"跳過山崖消滅梭鏢手",BoardCond = {11}},
		{ID = 0,Imageid = 10335,Desc = --[[!AUTO_1502]]"擊殺惡頭陀",BoardCond = {12}},
		{ID = 205,Imageid = 16416,Desc = --[[!AUTO_1503]]"飛狐女徒: %d/12",BoardCond = {14}},
		{ID = 0,Imageid = 16418,Desc = --[[!AUTO_1504]]"擊殺玉面飛狐",BoardCond = {15}},
                {ID = 0,Imageid = 2103,Desc = --[[!AUTO_1505]]"通關！",BoardCond = {16}},
	}
}

Ectype.EctypeArgs[9950] =
{
	Name = --[[!AUTO_1472]]"飛蛾洞",
	Desc = --[[!AUTO_1473]]"目標：突破百毒禁地飛蛾洞",
	Args =
	{
		{ID = 0,Imageid = 910,Desc = --[[!AUTO_1474]]"跳下平臺，踏入飛蛾洞",BoardCond = {1}},
		{ID = 0,Imageid = 1338,Desc = --[[!AUTO_1475]]"挑戰百蟲陣並進入大廳",BoardCond = {10}},
		{ID = 102,Imageid = 1338,Desc = --[[!AUTO_1476]]"進度 %d / 100",BoardCond = {10}},
		{ID = 0,Imageid = 920,Desc = --[[!AUTO_1477]]"摧毀大廳四周的蛾卵",BoardCond = {11}},
		{ID = 103,Imageid = 920,Desc = --[[!AUTO_1478]]"進度 %d / 15",BoardCond = {11}},
		{ID = 0,Imageid = 1338,Desc = --[[!AUTO_1479]]"擊敗百年蛾獸",BoardCond = {3}},
	}
}

Ectype.EctypeArgs[10009] =
{
	Name = "副本追蹤",
	Desc = "目標：護送財神!",
	Args =
	{
		{ID = 0,Imageid = 10998,Desc = "和財神對話（至少有兩人才能接取任務）",BoardCond = {1}},
		{ID = 0,Imageid = 10998,Desc = "擊敗討錢小鬼",BoardCond = {3}},
		{ID = 0,Imageid = 10998,Desc = "擊敗惡疾邪祟",BoardCond = {4}},
		{ID = 0,Imageid = 10998,Desc = "擊敗深淵惡鬼",BoardCond = {5}},
		{ID = 0,Imageid = 10998,Desc = "放飛祈福燈",BoardCond = {6}},
		{ID = 0,Imageid = 10998,Desc = "擊敗發怒的財神",BoardCond = {2}},
	}
}

Ectype.EctypeArgs[10057] =
{
	Name = "副本追蹤",
	Desc = "目標：幫助小秋!",
	Args =
	{
		{ID = 0,Imageid = 10998,Desc = "與小秋對話",BoardCond = {1}},
		{ID = 0,Imageid = 10998,Desc = "1.阻止騷擾者(%SA[101])\r2.小秋被騷擾次數：(%SA[100])/8)^FF0000（8次失敗）^FFFFFF",BoardCond = {3}},
                {ID = 0,Imageid = 10998,Desc = "1.阻止騷擾者(%SA[101])\r2.小秋被騷擾次數：(%SA[100])/8)^FF0000（8次失敗）^FFFFFF",BoardCond = {4}},
		{ID = 0,Imageid = 10998,Desc = "1.阻止騷擾者(%SA[101])\r2.小秋被騷擾次數：(%SA[100])/8)^FF0000（8次失敗）^FFFFFF",BoardCond = {5}},
                {ID = 0,Imageid = 10998,Desc = "離開副本",BoardCond = {2}},
	}
}

Ectype.EctypeArgs[10072] =
{
	Name = "副本追蹤",
	Desc = "目標：在限定時間內緝拿梅莊逃犯!",
	Args =
	{
		{ID = 1006,Imageid = 10998,Desc = "剩餘時間: %d秒",BoardCond = {1}},
		--[[{ID = 1001,Imageid = 10998,Desc = "缉拿任我犟: %d / 1",BoardCond = {1}},
		{ID = 1002,Imageid = 10998,Desc = "缉拿任我蹦: %d / 1",BoardCond = {1}},
		{ID = 1003,Imageid = 10998,Desc = "缉拿任我横: %d / 1",BoardCond = {1}},
		{ID = 1004,Imageid = 10998,Desc = "缉拿任我踱: %d / 1",BoardCond = {1}},]]--

	}
}

Ectype.EctypeArgs[10052] =
{
	Name = "副本追蹤",
	Desc = "目標：使用場景中不同顏色的神石啟動神秘石台!（每種神石只可以開啟一個與其對應的石台）\r^FF0000石台被啟動時會發出與神石相應的光芒^FFFFFF",
	Args =
	{
	{ID = 1005201,Imageid = 10998,Desc = "啟動神秘石台(%SA[1005201]/4)\r剩餘時間：%SA[999]秒",BoardCond = {1}},
	}
}

Ectype.EctypeArgs[10071] =
{
	Name = "副本追蹤",
	Desc = "煉丹：把溫度維持在紅色範圍（添柴和搬水能改變其溫度），使丹藥完成度達到\r^55FF55100%！^FFFFFF",
	Args =
	{
	}
}
Ectype.EctypeArgs[10138] =
{
	Name = "副本追蹤",
	Desc = "目標：傾聽四位琴女彈奏小曲兒並答對老鴇的難題！",
	Args =
	{
		{ID = 0,Imageid = 10998,Desc = "聽司琴、司箏、司音、司樂彈奏小曲兒，然後前往老鴇處答題",BoardCond = {1}},
		{ID = 0,Imageid = 10998,Desc = "離開副本",BoardCond = {2}},
	}
}
Ectype.EctypeArgs[10091] =
{
	Name = "副本追蹤",
	Desc = "目標：開啟十個武林前輩留下的增益寶箱",
	Args =
	{
		{ID = 0,Imageid = 10998,Desc = "注意安全！死亡意味著終結…",BoardCond = {1}},
		{ID = 0,Imageid = 10998,Desc = "離開副本",BoardCond = {2}},
	}
}
Ectype.EctypeArgs[10040] =
{
	Name = "饑荒",
	Desc = "目標：獲得10點飽食度",
	Args =
	{
		{ID = 0,Imageid = 10998,Desc = "拾取藍色的骨頭會使你狂暴並獲得7點飽餐度，狂暴時間內無法拾取骨頭，只能通過攻擊別的玩家來回復生命值。擊殺別的玩家獲得他的全部飽餐值並獲得5點額外飽餐值獎勵.",BoardCond = {1}},
	}
}
Ectype.EctypeArgs[10077] =
{
	Name = "副本追蹤",
	Desc = "目標：獲得1000積分",
	Args =
	{
		{ID = 0,Imageid = 10998,Desc = "準備捕魚！",BoardCond = {1}},
		{ID = 0,Imageid = 10998,Desc = "子彈數量有限，請合理使用",BoardCond = {2}},
		{ID = 201,Imageid = 10998,Desc = "剩餘時間：%d秒",BoardCond = {2}},
		{ID = 0,Imageid = 10998,Desc = "離開副本",BoardCond = {3}},
	}
}
Ectype.EctypeArgs[10099] =
{
	Name = "副本追蹤",
	Desc = "目標：採集4個寶箱（每成功採集一個寶箱，個人積分加一）",
	Args =
	{
		{ID = 0,Imageid = 10998,Desc = "注意安全！死亡意味著終結…",BoardCond = {1}},
		{ID = 0,Imageid = 10998,Desc = "利用炸彈可以使怪物暈眩，觸發炸彈後迅速撤離不要被炸彈波及！",BoardCond = {2}},
	}
}
Ectype.EctypeArgs[10076] =
{
	Name = "副本追蹤",
	Desc = "目標：累計達到200分！",
	Args =
	{
		{ID = 0,Imageid = 10998,Desc = "請少俠做好準備後，前往主考官處確認開始副本",BoardCond = {1}},
		{ID = 999,Imageid = 10998,Desc = "^FF0000擊敗箭羽小精靈可以獲得分數，越靠近箭靶中心獲得的分數越高喲^FFFFFF\r剩餘時間：%d秒",BoardCond = {3}},
	}
}
Ectype.EctypeArgs[10158] =
{
	Name = "副本追蹤",
	Desc = "目標：在規定時間內找到隱藏在兄弟中的^5555FF土土土土^FFFFFF並擊殺，錯殺則挑戰失敗！",
	Args =
	{
		{ID = 0,Imageid = 10998,Desc = "請做好準備！",BoardCond = {1}},
		{ID = 15,Imageid = 10998,Desc = "擊殺土土土土！(%d/1)",BoardCond = {3}},
		{ID = 15,Imageid = 10998,Desc = "擊殺土土土土！(%d/1)",BoardCond = {4}},
		{ID = 15,Imageid = 10998,Desc = "擊殺土土土土！(%d/1)",BoardCond = {5}},
		{ID = 15,Imageid = 10998,Desc = "擊殺土土土土！(%d/1)",BoardCond = {6}},
		{ID = 15,Imageid = 10998,Desc = "擊殺土土土土！(%d/1)",BoardCond = {7}},
		{ID = 0,Imageid = 10998,Desc = "離開副本！",BoardCond = {2}},
	}
}
Ectype.EctypeArgs[10063] =
{
	Name = "副本追蹤",
	Desc = "目標：獲得150積分",
	Args =
	{
		{ID = 0,Imageid = 10998,Desc = "快快搶金幣吧,注意炸彈",BoardCond = {1}},
		{ID = 0,Imageid = 10998,Desc = "離開副本",BoardCond = {2}},
	}
}

Ectype.EctypeArgs[10104] =
{
	Name = "副本追蹤",
	Desc = "目標：取得25分！",
	Args =
	{
		{ID = 0,Imageid = 10998,Desc = "時間很充裕，不要緊張~（選中怪物後技能將自動向怪物使用，按Esc可取消選中狀態）",BoardCond = {1}},
		{ID = 0,Imageid = 10998,Desc = "時間很充裕，不要緊張~（選中怪物後技能將自動向怪物使用，按Esc可取消選中狀態）",BoardCond = {2}},
	}
}

Ectype.EctypeArgs[10122] =
{
	Name = "副本追蹤",
	Desc = "目標：網住5只雞！",
	Args =
	{
		{ID = 0,Imageid = 10998,Desc = "不要手下留情！（選中怪物後技能將自動向怪物使用，按Esc可取消選中狀態）",BoardCond = {1}},
		{ID = 0,Imageid = 10998,Desc = "不要手下留情！（選中怪物後技能將自動向怪物使用，按Esc可取消選中狀態）",BoardCond = {2}},
	}
}

Ectype.EctypeArgs[10142] =
{
    Name = "副本追蹤",
	Desc = "目標：幫助火麒麟幼崽獵殺野豬",
	Args =
	{
		{ID = 0,Imageid = 10998,Desc = "獲得30分通關！注意保護幼崽,幼崽死亡則任務失敗！\n\r驚慌的野豬：3分\n\r暴躁的野豬：6分\n\r瘋狂的野豬：10分\n\r獲得積分 (%SA[10001]/30)\n\r倒計時:^00FF00%SA[1002]^FFFFFF秒",BoardCond = {1}}, 
        {ID = 0,Imageid = 10998,Desc = "離開副本",BoardCond = {2}},

	}
}

Ectype.EctypeArgs[10194] =
{
    Name = "副本追蹤",
	Desc = "目標：在限定時間內拼出謁語",
	Args =
	{

	{ID = 1003,Imageid = 10998,Desc = "剩餘時間: %d秒",BoardCond = {1}},

	}
}
Ectype.EctypeArgs[10161] =
{
	Name = "副本追蹤",
	Desc = "目標：擊殺不穩定的葫蘆",
	Args =
	{
		{ID = 0,Imageid = 10998,Desc = "想辦法擊殺不穩定的葫蘆,注意奇怪的地方",BoardCond = {1}},
		{ID = 0,Imageid = 10998,Desc = "離開副本",BoardCond = {2}},
	}
}
Ectype.EctypeArgs[10166] =
{
	Name = "副本追蹤",
	Desc = "目標：操作教主喵的身體消除所有的寶箱，破壞迷陣",
	Args =
	{
		{ID = 251,Imageid = 10998,Desc = "剩餘時間: %d秒",BoardCond = {1}},
		{ID = 250,Imageid = 10998,Desc = "消除箱子個數為: %d/16",BoardCond = {1}},
		{ID = 0,Imageid = 10998,Desc = "離開副本",BoardCond = {2}},
	}
}

Ectype.EctypeArgs[10195] =
{
    Name = "副本追蹤",
	Desc = "目標：擊殺足夠多的賊人",
	Args =
	{

	{ID = 1004,Imageid = 10998,Desc = "剩餘時間: %d秒",BoardCond = {1}},
	{ID = 1002,Imageid = 10998,Desc = "擊殺賊人: %d / 75",BoardCond = {1}},

	}
}

Ectype.EctypeArgs[10143] =
{
	Name = "副本追蹤",
	Desc = "幫助藍鳳凰取回寶物：小心發出聲音的蜂巢它們十分危險,不要靠近！空巢不會發出聲音找到它才是破陣的關鍵",
	Args =
	{
	}
}

Ectype.EctypeArgs[10113] =
{
	Name = "副本追蹤",
	Desc = "目標：護送小師妹到終點",
	Args =
	{
		{ID = 0,Imageid = 10998,Desc = "擊敗途中的敵人，成功護送小師妹到終點",BoardCond = {1}},
		{ID = 0,Imageid = 10998,Desc = "擊敗途中的敵人，成功護送小師妹到終點",BoardCond = {3}},
		{ID = 0,Imageid = 10998,Desc = "離開副本",BoardCond = {2}},
	}
}
Ectype.EctypeArgs[10168] =
{
	Name = "副本追蹤",
	Desc = "目標：營救恒山師妹",
	Args =
	{
		{ID = 0,Imageid = 10998,Desc = "躲開邪神教主的攻擊，成功營救所有的恒山師妹！（最多只能死亡3次，否則將挑戰失敗！）",BoardCond = {1}},
		{ID = 0,Imageid = 10998,Desc = "離開副本",BoardCond = {2}},
	}
}
Ectype.EctypeArgs[10281] =
{
	Name = "副本追蹤",
	Desc = "目標：在限時內達成目標積分",
	Args =
	{
	}
}
Ectype.EctypeArgs[10333] =
{
	Name = "副本追蹤",
	Desc = "目標：擊敗玉京幫所有成員",
	Args =
	{
		{ID = 0,Imageid = 10998,Desc = "擊敗玉京幫所有成員！",BoardCond = {1}},
		{ID = 0,Imageid = 10998,Desc = "離開副本",BoardCond = {2}},
	}
}
Ectype.EctypeArgs[10334] =
{
	Name = "副本追蹤",
	Desc = "目標：獻祭豬羊，等待結果",
	Args =
	{
		{ID = 0,Imageid = 10998,Desc = "獻祭豬羊，等待結果！",BoardCond = {1}},
		{ID = 0,Imageid = 10998,Desc = "離開副本",BoardCond = {2}},
	}
}
Ectype.EctypeArgs[10335] =
{
	Name = "副本追蹤",
	Desc = "目標：謹慎前行",
	Args =
	{
		{ID = 0,Imageid = 10998,Desc = "謹慎前行到目的地。",BoardCond = {1}},
		{ID = 0,Imageid = 10998,Desc = "離開副本",BoardCond = {2}},
	}
}
Ectype.EctypeArgs[10329] =
{
	Name = "副本追蹤",
	Desc = "目標：擊敗石蘭阻止她輕生",
	Args =
	{
		{ID = 0,Imageid = 10998,Desc = "擊敗石蘭阻止她輕生！",BoardCond = {1}},
		{ID = 0,Imageid = 10998,Desc = "離開副本",BoardCond = {2}},
	}
}
Ectype.EctypeArgs[10330] =
{
	Name = "副本追蹤",
	Desc = "目標：逃脫蒙古高手的圍捕",
	Args =
	{
		{ID = 0,Imageid = 10998,Desc = "擊敗突然來襲的蒙古高手",BoardCond = {1}},
		{ID = 0,Imageid = 10998,Desc = "向玲瓏派方向逃跑，擊敗追上來的蒙古高手",BoardCond = {4}},
		{ID = 0,Imageid = 10998,Desc = "離開副本",BoardCond = {2}},
	}
}
Ectype.EctypeArgs[10331] =
{
	Name = "副本追蹤",
	Desc = "目標：擊敗雲一長老阻止她懲罰雲月兒",
	Args =
	{
		{ID = 0,Imageid = 10998,Desc = "擊敗雲一長老",BoardCond = {1}},
		{ID = 0,Imageid = 10998,Desc = "離開副本",BoardCond = {2}},
	}
}
Ectype.EctypeArgs[10332] =
{
	Name = "副本追蹤",
	Desc = "目標：應對闖入玲瓏派的各路人馬",
	Args =
	{
		{ID = 0,Imageid = 10998,Desc = "擊敗挑戰的江湖浪子",BoardCond = {3}},
		{ID = 0,Imageid = 10998,Desc = "擊敗挑戰的蒙古高手",BoardCond = {4}},
		{ID = 0,Imageid = 10998,Desc = "拿起並宣讀雲不劫罪證（右鍵使用）",BoardCond = {5}},
		{ID = 0,Imageid = 10998,Desc = "擊敗突襲的錦衣衛",BoardCond = {6}},
		{ID = 0,Imageid = 10998,Desc = "逃往困龍池，擊敗沿途的錦衣衛",BoardCond = {7}},
	}
}
Ectype.EctypeArgs[10348] =
{
	Name = "副本追蹤",
	Desc = "目標：惡龍突襲，與眾人合力抵擋惡龍",
	Args =
	{
		{ID = 0,Imageid = 10998,Desc = "與眾人合力抵擋惡龍！",BoardCond = {1}},
		{ID = 0,Imageid = 10998,Desc = "離開副本",BoardCond = {2}},
	}
}
Ectype.EctypeArgs[10483] =
{
	Name = "副本追蹤",
	Desc = "目標：找到冰荷，並護送她離開將軍府",
	Args =
	{
		{ID = 0,Imageid = 10998,Desc = "挑戰比武者王嘉，贏得比武招親",BoardCond = {1}},
		{ID = 0,Imageid = 10998,Desc = "挑戰比武者李炳，贏得比武招親",BoardCond = {3}},
		{ID = 0,Imageid = 10998,Desc = "找到冰荷",BoardCond = {4}},
		{ID = 0,Imageid = 10998,Desc = "護送冰荷離開將軍府",BoardCond = {5}},
		{ID = 0,Imageid = 10998,Desc = "護送冰荷離開將軍府",BoardCond = {6}},
		{ID = 0,Imageid = 10998,Desc = "擊敗將軍，離開副本",BoardCond = {2}},
	}
}
Ectype.EctypeArgs[10486] =
{
	Name = "副本追蹤",
	Desc = "目標：找到並查看小謝的三份筆記",
	Args =
	{
		{ID = 0,Imageid = 10998,Desc = "找到小謝筆記一",BoardCond = {1}},
		{ID = 0,Imageid = 10998,Desc = "找到小謝筆記二",BoardCond = {3}},
		{ID = 0,Imageid = 10998,Desc = "找到小謝筆記三",BoardCond = {4}},
		{ID = 0,Imageid = 10998,Desc = "擊敗小謝怨魂",BoardCond = {5}},
		{ID = 0,Imageid = 10998,Desc = "離開副本",BoardCond = {2}},
	}
}
Ectype.EctypeArgs[10536] =
{
	Name = "副本追蹤",
	Desc = "目標：砍桂樹！",
	Args =
	{
		{ID = 0,Imageid = 10998,Desc = "砍桂樹，並小心不要被護樹精靈擊殺！",BoardCond = {1}},
	}
}
Ectype.EctypeArgs[10902] =
{
	Name = "副本追踪",
	Desc = "目标：击败陈圣王",
	Args =
	{
		{ID = 0,Imageid = 10998,Desc = "击败陈圣王！",BoardCond = {1}},
	}
}


--副本追踪成绩统计界面
function Ectype:GetAssemblyArg(idEctype)
	if Ectype.AssemblyArg[idEctype] then
		return Ectype.AssemblyArg[idEctype]
	end
	return nil
end

--处理副本喊话
function Ectype:OnSpeak(idEctype,idSpeak)
	if Ectype.EctypeBroadcast[idSpeak] then
		EctypeUI_Type = 0
		if Ectype.EctypeBroadcast[idSpeak].NpcName then --开启特殊喊话界面

			EctypeUI_Type = idSpeak
			DlgApi.ShowDialog(--[[!AUTO_1985]]"Win_SpecialSpeak", true, false, false)
		end
		return GameApi.AddChatMessage(Ectype.EctypeBroadcast[idSpeak].Channel,
		Ectype.EctypeBroadcast[idSpeak].Content)
	end
end

local linkTargetTypeTable =
{
	npc = 1,
	monster = 2,
	mine = 3,
	--item = 4,		--物品需来源id，此处不支持
	bind = 6,
}

-- Ectype:ParseLinkText 辅助函数. name: 链接文字，type: 链接类型, info: 链接信息(格式取决于type)
local function onLinkTextReplace (name, type, info)
	if type == --[[!AUTO_1986]]"pos" then
		-- x, z
		local iBeg, iEnd, x, z = info:find(--[[!AUTO_1987]]"^%s-(%--[%d%.]+)[,%s]+(%--[%d%.]+)%s-$")
		if iBeg then
			return GameApi.GenerateEctypeCoordLink(name, x+0, 0, z+0)
		end
	elseif type == --[[!AUTO_1988]]"pos3" then
		-- x, y, z
		local iBeg, iEnd, x, y, z = info:find(--[[!AUTO_1989]]"^%s-(%--[%d%.]+)[,%s]+(%--[%d%.]+)[,%s]+(%--[%d%.]+)%s-$")
		if iBeg then
			return GameApi.GenerateEctypeCoordLink(name, x+0, y+0, z+0)
		end
	elseif type == --[[!AUTO_1990]]"target" then
		-- x, y, z, type=id
		local iBeg, iEnd, x, y, z, targetType, targetID = info:find(--[[!AUTO_1991]]"^%s-(%--[%d%.]+)[,%s]+(%--[%d%.]+)[,%s]+(%--[%d%.]+)[,%s]+(%w+)%s-%=%s-(%d+)%s-$")
		if iBeg then
			local targetTypeValue = linkTargetTypeTable[targetType]
			if targetTypeValue then
				return GameApi.GenerateEctypeCoordLink(name, x+0, y+0, z+0, targetTypeValue+0, targetID+0, 0--[[sourceID]])
			end
		end
	end

	return name
end

--分析副本追踪链接, 返回 客户端可用的链接文字
function Ectype:ParseLinkText (text)
	-- @name[type info]
	return (text:gsub(--[[!AUTO_1992]]"%@([^%[]*)%[(%w+)%s+([^%]]*)%]", onLinkTextReplace))
end

-- Ectype:ParseSceneArgText 辅助函数. scene_arg_id: 场景参数id
local function onSceneArgTextReplace (scene_arg_id)
	return GameApi.GetSceneArg(scene_arg_id+0) or 0
end

--分析副本追踪文本, 填写场景参数值
function Ectype:ParseSceneArgText (text)
	-- %SA[id]
	return (text:gsub(--[[!AUTO_1993]]"%%SA%[(%d+)%]", onSceneArgTextReplace))
end

--%CALC[expression] 中可使用的函数
local calc_global =
{
	--取得场景参数的值
	arg = function (id) return GameApi.GetSceneArg(id) or 0 end,
	--原先的全局变量表
	_G = _G,
	GameApi = GameApi,
	math = math,
	tostring = tostring,
}

local function onCalcTextReplace (text)
	local expression = --[[!AUTO_1994]]"return "..text
	local f, err = loadstring(expression)
	if f then
		setfenv(f, calc_global)
		return tostring(f())
	else
		assert(false, err)
	end
end

--分析副本追踪文本, 填写表达表
function Ectype:ParseCalcText (text)
	-- %CALC[expression]
	return (text:gsub(--[[!AUTO_1995]]"%%CALC%[([^%]]+)%]", onCalcTextReplace))
end

function Ectype:ParseDescText (text)
	text = self:ParseCalcText(text)
	text = self:ParseSceneArgText(text)
	text = self:ParseLinkText(text)
	return text
end

--
--Test Begin
local _DEBUG = false
if _DEBUG then
	GameApi = GameApi or {}
	function GameApi.GenerateEctypeCoordLink (name, p1, p2, p3, p4, p5)
		if p4 == nil then
			local x, y, z = p1, p2, p3
			return (--[[!AUTO_1996]]"<%s><%g %g %g>"):format(name, x, y, z)
		else
			local x, y, z, type, id = p1, p2, p3, p4, p5
			return (--[[!AUTO_1997]]"<%s><%g %g %g %d %d %d>"):format(name, x, y, z, type, id, 0)
		end
	end

	function GameApi.GetSceneArg (scene_arg_id)
		return scene_arg_id * 10
	end

	assert(Ectype:ParseLinkText(--[[!AUTO_1998]]"測試@連結 [pos  -1.1 ,, 200]文字: %d") == --[[!AUTO_1999]]"測試<連結 ><-1.1 0 200>文字: %d")
	assert(Ectype:ParseLinkText(--[[!AUTO_2000]]"測試@連結 [pos3  -1.1 ,11.9,, 200]文字: %d") == --[[!AUTO_2001]]"測試<連結 ><-1.1 11.9 200>文字: %d")
	assert(Ectype:ParseSceneArgText(--[[!AUTO_2002]]"測試%SA[3]/100") == --[[!AUTO_2003]]"測試30/100")
	assert(Ectype:ParseCalcText(--[[!AUTO_2004]]"測試: %CALC[arg(3)]") == --[[!AUTO_2005]]"測試: 30")
	assert(Ectype:ParseCalcText(--[[!AUTO_2006]]"測試: %CALC[arg(4) - arg(3)]") == --[[!AUTO_2007]]"測試: 10")

	assert(Ectype:ParseDescText(--[[!AUTO_2008]]"測試@連結 [target  -1.1 ,11.9,, 200, npc = 7654 ]文字: %SA[3], %CALC[arg(4)]") == --[[!AUTO_2009]]"測試<連結 ><-1.1 11.9 200 1 7654 0>文字: 30, 40")

	assert(false, --[[!AUTO_2010]]"Testing Successed")
end
--Test End
--
