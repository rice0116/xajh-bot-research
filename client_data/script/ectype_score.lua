--[[#tag push auto]]
EctypeScore     = {}
EctypeScore.Cfg = {}

---场景参数8副本玩家死亡次数
---场景参数9战斗积分
---场景参数11副本进行时间（秒）


EctypeScore.TeamExpNormal = {0, 0.08, 0.12, 0.15, 0.17, 0.18}
EctypeScore.GradeExpNormal = {0, 0.1, 0.2, 0.3}
local SpecialUnit=
{
	TIME = 1,				--显示%d分%d秒单位

}

---------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------
--------------------------------请参考范例拷贝---------------------------------
---------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------


--[[
EctypeScore.Cfg[1777] =			--填写副本ID
{
	[1] = 				--模式1的评价

	{
		ScoreCond =
		{
			{
				Desc = "战斗分数",	--评价条件名

				Unit = "分",		--评价条件的单位，如果为时间之类特殊单位，填写SpecialUnit列表中的某项如TIME

				Arg  = 9,		--战斗分数为9号参数

				Baddish =		--从上到下分别为B\A\S\SS，range为参数数值区间，desc为界面悬浮文字（新版界面无效？），icon为图标（新版界面无效？），weight为对应数值区间的权重
				{
					{ Range = {0, 23999},  Desc = "酱油", Icon = 11239, Weight = 0},
					{ Range = {24000, 29999},  Desc = "高手", Icon = 11240, Weight = 15 },
					{ Range = {30000, 39999},  Desc = "奇才", Icon = 11241, Weight = 25 },
					{ Range = {40000, 999999},  Desc = "武神", Icon = 11242, Weight = 40 },
				}
			},

			{
				Desc = "过关时间",
				Unit = SpecialUnit.TIME,	--时间使用特殊的单位显示方式，即小时分秒

				Arg  = 11, 		--副本过关时间为11号参数

				Baddish =
				{
					{ Range = {1800,9999}, Desc = "慢速", Icon = 11231, Weight = 0 },
					{ Range = {1200,1799}, Desc = "平速", Icon = 11232, Weight = 10 },
					{ Range = {900,1199},  Desc = "飞速", Icon = 11233, Weight = 20 },
					{ Range = {0, 899},  Desc = "神速", Icon = 11234, Weight = 30},
				}
			},

			{
				Desc = "重伤次数",
				Unit = "次",
				Arg  = 8, 		--副本内玩家死亡次数为8号参数

				Baddish =
				{
					{ Range = {10, 99999},  Desc = "惨败", Icon = 11239, Weight = 0 },
					{ Range = {4, 9},  Desc = "重伤", Icon = 11240, Weight = 10 },
					{ Range = {1, 3},  Desc = "轻伤", Icon = 11241, Weight = 20 },
					{ Range = {0, 0},  Desc = "无损", Icon = 11242, Weight = 30},
				}
			},
		},

		AddDrawMoney = 2000,				--2次抽奖消耗金钱，优先绑定币，不足则交易币补齐

		AddDrawLottery = 30352,				--2次抽奖的彩票ID

                TeamExp = EctypeScore.TeamExpNormal,		--组队经验加成，经验基数为副本内玩家杀怪获得的总经验，分别是组队人数1-6人对应的加成比例

                Award = 						--评价得分的奖励，从上到下分别为B\A\S\SS，range为以上所有评价条件的总权重之和所处的数值区间。lottery为获得的彩票ID，exp为评价经验加成，基数为副本内玩家杀怪获得的总经验

                {
                        { Range = {0,  34}, Lottery = 30352, Exp = EctypeScore.GradeExpNormal[1] },
                        { Range = {35, 64}, Lottery = 30353, Exp = EctypeScore.GradeExpNormal[2] },
                        { Range = {65, 84}, Lottery = 30354, Exp = EctypeScore.GradeExpNormal[3] },
                        { Range = {85, 100}, Lottery = 30355, Exp = EctypeScore.GradeExpNormal[4] },
                },
	},
}
]]
---------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------
------------------------------------活动副本-------------------------------------------
---------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------

----绿竹幻想乡

EctypeScore.Cfg[169] =
{
	[1] =
	{
		ScoreCond =
		{
			{
				Desc = --[[!AUTO_1]]"戰鬥分數",	--评价条件名

				Unit = --[[!AUTO_2]]"分",		--评价条件的单位

				Arg  = 9,		--战斗分数为9号参数

				Baddish =		--从上到下分别为B\A\S\SS，range为参数数值区间，desc为界面悬浮文字（新版界面无效？），icon为图标（新版界面无效？），weight为对应数值区间的权重
				{
					{ Range = {0, 29999},  Desc = --[[!AUTO_3]]"醬油", Icon = 11239, Weight = 0},
					{ Range = {30000, 35999},  Desc = --[[!AUTO_4]]"高手", Icon = 11240, Weight = 20 },
					{ Range = {36000, 39999},  Desc = --[[!AUTO_5]]"奇才", Icon = 11241, Weight = 35 },
					{ Range = {40000, 999999},  Desc = --[[!AUTO_6]]"武神", Icon = 11242, Weight = 50 },
				}
			},

			{
				Desc = --[[!AUTO_7]]"重傷次數",
				Unit = --[[!AUTO_8]]"次",
				Arg  = 8,
				Baddish =
				{
					{ Range = {10, 99999},  Desc = --[[!AUTO_9]]"慘敗", Icon = 11239, Weight = 0 },
					{ Range = {5, 9},  Desc = --[[!AUTO_10]]"重傷", Icon = 11240, Weight = 20 },
					{ Range = {1, 4},  Desc = --[[!AUTO_11]]"輕傷", Icon = 11241, Weight = 35 },
					{ Range = {0, 0},  Desc = --[[!AUTO_12]]"無損", Icon = 11242, Weight = 50},
				}
			},
		},

                TeamExp = EctypeScore.TeamExpNormal,
                Award =
                {
                        { Range = {0,  39}, Lottery = 58447, Exp = EctypeScore.GradeExpNormal[1] },
                        { Range = {40, 69}, Lottery = 58446, Exp = EctypeScore.GradeExpNormal[2] },
                        { Range = {70, 99}, Lottery = 58445, Exp = EctypeScore.GradeExpNormal[3] },
                        { Range = {100, 999}, Lottery = 58444, Exp = EctypeScore.GradeExpNormal[4] },
                },
	},
}

----鱼池

EctypeScore.Cfg[3309] =
{
	[1] =
	{
		ScoreCond =
		{
			{
				Desc = --[[!AUTO_13]]"戰鬥分數",	--评价条件名
				Unit = --[[!AUTO_14]]"分",		--评价条件的单位
				Arg  = 9,		--战斗分数为9号参数
				Baddish =		--从上到下分别为B\A\S\SS，range为参数数值区间，desc为界面悬浮文字（新版界面无效？），icon为图标（新版界面无效？），weight为对应数值区间的权重
				{
					{ Range = {0, 300},  Desc = --[[!AUTO_15]]"醬油", Icon = 11239, Weight = 20},
					{ Range = {301, 600},  Desc = --[[!AUTO_16]]"高手", Icon = 11240, Weight = 40 },
					{ Range = {601, 998},  Desc = --[[!AUTO_17]]"奇才", Icon = 11241, Weight = 80 },
					{ Range = {999, 1000},  Desc = --[[!AUTO_18]]"武神", Icon = 11242, Weight = 100 },
				}
			},
		},
                TeamExp = {0, 0, 0, 0, 0, 0},
                Award =
                {
                        { Range = {0, 20}, Lottery = 70883, Exp = 0 },
                        { Range = {21, 40}, Lottery = 70884, Exp = 0 },
                        { Range = {41, 80}, Lottery = 70885, Exp = 0 },
                        { Range = {81, 100}, Lottery = 70886, Exp = 0 },
                },
	},
}

----桃谷迷阵

EctypeScore.Cfg[7630] =
{
	[1] =
	{
		ScoreCond =
		{
			{
				Desc = --[[!AUTO_19]]"闖關輪數",
				Unit = --[[!AUTO_20]]"輪",
				Arg  = 521,
				Baddish =
				{
					{ Range = {0,1},  Desc = --[[!AUTO_21]]"悲劇", Icon = 11940, Weight = 0},
					{ Range = {2,2},  Desc = --[[!AUTO_22]]"合格", Icon = 11941, Weight = 1 },
					{ Range = {3,4}, Desc = --[[!AUTO_23]]"優異", Icon = 11942, Weight = 5 },
					{ Range = {5,5}, Desc = --[[!AUTO_24]]"完美", Icon = 11943, Weight = 50 },
				}
			},

			{
				Desc = --[[!AUTO_19]]"第五輪擊殺個數",
				Unit = --[[!AUTO_20]]"個",
				Arg  = 215,
				Baddish =
				{
					{ Range = {0,59},  Desc = --[[!AUTO_21]]"醬油", Icon = 11940, Weight = 0},
					{ Range = {60,99},  Desc = --[[!AUTO_22]]"高手", Icon = 11941, Weight = 5 },
					{ Range = {100,129}, Desc = --[[!AUTO_23]]"奇才", Icon = 11942, Weight = 10 },
					{ Range = {130,300}, Desc = --[[!AUTO_24]]"武神", Icon = 11943, Weight = 20 },
				}
			},

			{
				Desc = --[[!AUTO_25]]"死亡次數",
				Unit = --[[!AUTO_26]]"次",
				Arg  = 8,
				Baddish =
				{
					{ Range = {11, 999},  Desc = --[[!AUTO_27]]"慘烈", Icon = 11944, Weight = 0},
					{ Range = {6, 10},  Desc = --[[!AUTO_28]]"重傷", Icon = 11945, Weight = 5 },
					{ Range = {1, 5},  Desc = --[[!AUTO_29]]"輕傷", Icon = 11946, Weight = 10 },
					{ Range = {0, 0},  Desc = --[[!AUTO_30]]"無損", Icon = 11947, Weight = 15 },
				}
			},
			{
				Desc = --[[!AUTO_43]]"通關時間",
				Unit = SpecialUnit.TIME,
				Arg  = 11, 		--副本过关时间为11号参数
				Baddish =
				{
					{ Range = {1800,3600}, Desc = --[[!AUTO_44]]"龜速", Icon = 11231, Weight = 0 },
					{ Range = {1200,1799}, Desc = --[[!AUTO_45]]"平速", Icon = 11232, Weight = 5 },
					{ Range = {600,1199},  Desc = --[[!AUTO_46]]"飛速", Icon = 11233, Weight = 10 },
					{ Range = {0, 599},  Desc = --[[!AUTO_47]]"神速", Icon = 11234, Weight = 15},
				}
			},
		},

                TeamExp = EctypeScore.TeamExpNormal,
                Award =
                {
                        { Range = {0,  49}, Lottery = 88050, Exp = EctypeScore.GradeExpNormal[1] },
                        { Range = {50, 75}, Lottery = 88049, Exp = EctypeScore.GradeExpNormal[2] },
                        { Range = {76, 85}, Lottery = 88048, Exp = EctypeScore.GradeExpNormal[3] },
                        { Range = {86, 100}, Lottery = 88047, Exp = EctypeScore.GradeExpNormal[4] },
                },
	},
}

----千秋美酒

EctypeScore.Cfg[626] =
{
	[1] =
	{
		ScoreCond =
		{
			{
				Desc = --[[!AUTO_19]]"美酒得分",
				Unit = --[[!AUTO_20]]"分",
				Arg  = 200,
				Baddish =
				{
					{ Range = {0,4999},  Desc = --[[!AUTO_21]]"失格", Icon = 11940, Weight = 0},
					{ Range = {5000,5799},  Desc = --[[!AUTO_22]]"差強", Icon = 11941, Weight = 15 },
					{ Range = {5800,5999}, Desc = --[[!AUTO_23]]"絕好", Icon = 11942, Weight = 25 },
					{ Range = {6000,99999}, Desc = --[[!AUTO_24]]"神品", Icon = 11943, Weight = 35 },
				}
			},

			{
				Desc = --[[!AUTO_25]]"護送得分",
				Unit = --[[!AUTO_26]]"分",
				Arg  = 201,
				Baddish =
				{
					{ Range = {0, 4999},  Desc = --[[!AUTO_27]]"悲劇", Icon = 11944, Weight = 0},
					{ Range = {5000, 5799},  Desc = --[[!AUTO_28]]"失職", Icon = 11945, Weight = 15 },
					{ Range = {5800, 5999},  Desc = --[[!AUTO_29]]"合格", Icon = 11946, Weight = 25 },
					{ Range = {6000, 99999},  Desc = --[[!AUTO_30]]"完美", Icon = 11947, Weight = 35 },
				}
			},
			{
				Desc = --[[!AUTO_43]]"過關時間",
				Unit = SpecialUnit.TIME,
				Arg  = 11, 		--副本过关时间为11号参数
				Baddish =
				{
					{ Range = {1200,9999}, Desc = --[[!AUTO_44]]"慢速", Icon = 11231, Weight = 0 },
					{ Range = {1021,1200}, Desc = --[[!AUTO_45]]"平速", Icon = 11232, Weight = 10 },
					{ Range = {901,1020},  Desc = --[[!AUTO_46]]"飛速", Icon = 11233, Weight = 20 },
					{ Range = {0, 900},  Desc = --[[!AUTO_47]]"神速", Icon = 11234, Weight = 30},
				}
			},
		},

                TeamExp = EctypeScore.TeamExpNormal,
                Award =
                {
                        { Range = {0,  29}, Lottery = 87845, Exp = EctypeScore.GradeExpNormal[1] },
                        { Range = {30, 59}, Lottery = 87844, Exp = EctypeScore.GradeExpNormal[2] },
                        { Range = {60, 89}, Lottery = 87843, Exp = EctypeScore.GradeExpNormal[3] },
                        { Range = {90, 100}, Lottery = 87842, Exp = EctypeScore.GradeExpNormal[4] },
                },
	},
}




--纵横街市
EctypeScore.Cfg[882] =
{
	[1] =
	{
		ScoreCond =
		{
			{
				Desc = --[[!AUTO_31]]"顧客好評",
				Unit = --[[!AUTO_32]]"分",
				Arg  = 910,
				Baddish =
				{
					{ Range = {-99999,99},  Desc = --[[!AUTO_33]]"一般", Icon = 12045, Weight = 1},
					{ Range = {100,199},  Desc = --[[!AUTO_34]]"還行", Icon = 12046, Weight = 2 },
					{ Range = {200,349}, Desc = --[[!AUTO_35]]"貼心", Icon = 12047, Weight = 3 },
					{ Range = {350,99999}, Desc = --[[!AUTO_36]]"極佳", Icon = 12048, Weight = 4 },
				}
			},
		},

                TeamExp = EctypeScore.TeamExpNormal,
                Award =
                {
                        { Range = {-99999,  1}, Lottery = 29227, Exp = EctypeScore.GradeExpNormal[1] },
                        { Range = {2, 2}, Lottery = 29228, Exp = EctypeScore.GradeExpNormal[2] },
                        { Range = {3, 3}, Lottery = 29229, Exp = EctypeScore.GradeExpNormal[3] },
                        { Range = {4, 99999}, Lottery = 29230, Exp = EctypeScore.GradeExpNormal[4] },
                },
	},
}
--门派试炼

EctypeScore.Cfg[9001] =
{
	[1] =
	{
		ScoreCond =
		{
			{
				Desc = --[[!AUTO_13]]"戰鬥分數",	--评价条件名
				Unit = --[[!AUTO_14]]"分",		--评价条件的单位
				Arg  = 9,		--战斗分数为9号参数
				Baddish =		--从上到下分别为B\A\S\SS，range为参数数值区间，desc为界面悬浮文字（新版界面无效？），icon为图标（新版界面无效？），weight为对应数值区间的权重
				{
					{ Range = {0, 300},  Desc = --[[!AUTO_15]]"醬油", Icon = 11239, Weight = 20},
					{ Range = {301, 600},  Desc = --[[!AUTO_16]]"高手", Icon = 11240, Weight = 40 },
					{ Range = {601, 998},  Desc = --[[!AUTO_17]]"奇才", Icon = 11241, Weight = 80 },
					{ Range = {999, 1000},  Desc = --[[!AUTO_18]]"武神", Icon = 11242, Weight = 100 },
				}
			},
		},
                TeamExp = {0, 0, 0, 0, 0, 0},
                Award =
                {
                        { Range = {0, 20}, Lottery = 0, Exp = 0 },
                        { Range = {21, 40}, Lottery = 0, Exp = 0 },
                        { Range = {41, 80}, Lottery = 0, Exp = 0 },
                        { Range = {81, 100}, Lottery = 0, Exp = 0 },
                },
	},
}




---------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------
------------------------------------英雄之路-------------------------------------------
---------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------


----郊外酒肆

EctypeScore.Cfg[2576] =			--填写副本ID
{
	[1] = 				--模式1的评价
	{
		ScoreCond =
		{
			{
				Desc = --[[!AUTO_37]]"戰鬥分數",	--评价条件名
				Unit = --[[!AUTO_38]]"分",		--评价条件的单位
				Arg  = 9,		--战斗分数为9号参数
				Baddish =		--从上到下分别为B\A\S\SS,range为参数数值区间，desc为界面悬浮文字（新版界面无效？），icon为图标（新版界面无效？），weight为对应数值区间的权重
				{
					{ Range = {0, 24999},  Desc = --[[!AUTO_39]]"醬油", Icon = 11239, Weight = 0},
					{ Range = {25000, 29999},  Desc = --[[!AUTO_40]]"高手", Icon = 11240, Weight = 15 },
					{ Range = {30000, 39999},  Desc = --[[!AUTO_41]]"奇才", Icon = 11241, Weight = 25 },
					{ Range = {40000, 999999},  Desc = --[[!AUTO_42]]"武神", Icon = 11242, Weight = 40 },
				}
			},

			{
				Desc = --[[!AUTO_43]]"過關時間",
				Unit = SpecialUnit.TIME,
				Arg  = 11, 		--副本过关时间为11号参数
				Baddish =
				{
					{ Range = {900,9999}, Desc = --[[!AUTO_44]]"慢速", Icon = 11231, Weight = 0 },
					{ Range = {600,899}, Desc = --[[!AUTO_45]]"平速", Icon = 11232, Weight = 10 },
					{ Range = {360,599},  Desc = --[[!AUTO_46]]"飛速", Icon = 11233, Weight = 20 },
					{ Range = {0, 359},  Desc = --[[!AUTO_47]]"神速", Icon = 11234, Weight = 30},
				}
			},

			{
				Desc = --[[!AUTO_48]]"重傷次數",
				Unit = --[[!AUTO_49]]"次",
				Arg  = 8, 		--副本内玩家死亡次数为8号参数
				Baddish =
				{
					{ Range = {5, 99999},  Desc = --[[!AUTO_50]]"慘敗", Icon = 11239, Weight = 0 },
					{ Range = {3, 4},  Desc = --[[!AUTO_51]]"重傷", Icon = 11240, Weight = 10 },
					{ Range = {1, 2},  Desc = --[[!AUTO_52]]"輕傷", Icon = 11241, Weight = 20 },
					{ Range = {0, 0},  Desc = --[[!AUTO_53]]"無損", Icon = 11242, Weight = 30},
				}
			},

		},

		AddDrawMoney = 1200,				--2次抽奖消耗金钱，优先绑定币，不足则交易币补齐

		AddDrawLottery = 72419,				--2次抽奖的彩票ID72419

                TeamExp = EctypeScore.TeamExpNormal,		--组队经验加成，经验基数为副本内玩家杀怪获得的总经验，分别是组队人数1-6人对应的加成比例
                Award = 						--评价得分的奖励，range为以上所有评价条件的总权重之和所处的数值区间。lottery为获得的彩票ID，exp为评价经验加成，基数为副本内玩家杀怪获得的总经验
                {
                        { Range = {0,  29}, Lottery = 59190, Exp = EctypeScore.GradeExpNormal[1] },
                        { Range = {30, 59}, Lottery = 59190, Exp = EctypeScore.GradeExpNormal[2] },
                        { Range = {60, 79}, Lottery = 59190, Exp = EctypeScore.GradeExpNormal[3] },
                        { Range = {80, 100}, Lottery = 59190, Exp = EctypeScore.GradeExpNormal[4] },
                },
	},

}

----镖局夜战

EctypeScore.Cfg[2465] =			--填写副本ID
{
	[1] = 				--模式1的评价
	{
		ScoreCond =
		{
			{
				Desc = --[[!AUTO_54]]"戰鬥分數",	--评价条件名
				Unit = --[[!AUTO_55]]"分",		--评价条件的单位
				Arg  = 9,		--战斗分数为9号参数
				Baddish =		--从上到下分别为B\A\S\SS,range为参数数值区间，desc为界面悬浮文字（新版界面无效？），icon为图标（新版界面无效？），weight为对应数值区间的权重
				{
					{ Range = {0, 24999},  Desc = --[[!AUTO_56]]"醬油", Icon = 11239, Weight = 0},
					{ Range = {25000, 29999},  Desc = --[[!AUTO_57]]"高手", Icon = 11240, Weight = 10 },
					{ Range = {30000, 39999},  Desc = --[[!AUTO_58]]"奇才", Icon = 11241, Weight = 20 },
					{ Range = {40000, 999999},  Desc = --[[!AUTO_59]]"武神", Icon = 11242, Weight = 30 },
				}
			},

			{
				Desc = --[[!AUTO_60]]"過關時間",
				Unit = SpecialUnit.TIME,
				Arg  = 11, 		--副本过关时间为11号参数
				Baddish =
				{
					{ Range = {1200,9999}, Desc = --[[!AUTO_61]]"慢速", Icon = 11231, Weight = 0 },
					{ Range = {900,1199}, Desc = --[[!AUTO_62]]"平速", Icon = 11232, Weight = 10 },
					{ Range = {600,899},  Desc = --[[!AUTO_63]]"飛速", Icon = 11233, Weight = 15 },
					{ Range = {0, 599},  Desc = --[[!AUTO_64]]"神速", Icon = 11234, Weight = 20},
				}
			},

			{
				Desc = --[[!AUTO_65]]"重傷次數",
				Unit = --[[!AUTO_66]]"次",
				Arg  = 8, 		--副本内玩家死亡次数为8号参数
				Baddish =
				{
					{ Range = {5, 99999},  Desc = --[[!AUTO_67]]"慘敗", Icon = 11239, Weight = 0 },
					{ Range = {3, 4},  Desc = --[[!AUTO_68]]"重傷", Icon = 11240, Weight = 10 },
					{ Range = {1, 2},  Desc = --[[!AUTO_69]]"輕傷", Icon = 11241, Weight = 20 },
					{ Range = {0, 0},  Desc = --[[!AUTO_70]]"無損", Icon = 11242, Weight = 30},
				}
			},
			{
				Desc = --[[!AUTO_71]]"存活鏢師",
				Unit = --[[!AUTO_72]]"人",
				Arg  = 902, 		--副本内玩家死亡次数为8号参数
				Baddish =
				{
					{ Range = {0, 2},  Desc = --[[!AUTO_73]]"慘敗", Icon = 11239, Weight = 0 },
					{ Range = {3, 6},  Desc = --[[!AUTO_74]]"重傷", Icon = 11240, Weight = 10 },
					{ Range = {7, 9},  Desc = --[[!AUTO_75]]"輕傷", Icon = 11241, Weight = 15 },
					{ Range = {10, 99},  Desc = --[[!AUTO_76]]"無損", Icon = 11242, Weight = 20},
				}
			},

		},

		AddDrawMoney = 2112,				--2次抽奖消耗金钱，优先绑定币，不足则交易币补齐

		AddDrawLottery = 72422,				--2次抽奖的彩票ID72422

                TeamExp = EctypeScore.TeamExpNormal,		--组队经验加成，经验基数为副本内玩家杀怪获得的总经验，分别是组队人数1-6人对应的加成比例
                Award = 						--评价得分的奖励，range为以上所有评价条件的总权重之和所处的数值区间。lottery为获得的彩票ID，exp为评价经验加成，基数为副本内玩家杀怪获得的总经验
                {
                        { Range = {0,  29}, Lottery = 58453, Exp = EctypeScore.GradeExpNormal[1] },
                        { Range = {30, 59}, Lottery = 58453, Exp = EctypeScore.GradeExpNormal[2] },
                        { Range = {60, 79}, Lottery = 58453, Exp = EctypeScore.GradeExpNormal[3] },
                        { Range = {80, 100}, Lottery = 58453, Exp = EctypeScore.GradeExpNormal[4] },
                },
	},

	[2] = 				--模式2的评价
	{
		ScoreCond =
		{
			{
				Desc = --[[!AUTO_77]]"戰鬥分數",	--评价条件名
				Unit = --[[!AUTO_78]]"分",		--评价条件的单位
				Arg  = 9,		--战斗分数为9号参数
				Baddish =		--从上到下分别为B\A\S\SS,range为参数数值区间，desc为界面悬浮文字（新版界面无效？），icon为图标（新版界面无效？），weight为对应数值区间的权重
				{
					{ Range = {0, 24999},  Desc = --[[!AUTO_79]]"醬油", Icon = 11239, Weight = 0},
					{ Range = {25000, 29999},  Desc = --[[!AUTO_80]]"高手", Icon = 11240, Weight = 15 },
					{ Range = {30000, 39999},  Desc = --[[!AUTO_81]]"奇才", Icon = 11241, Weight = 25 },
					{ Range = {40000, 999999},  Desc = --[[!AUTO_82]]"武神", Icon = 11242, Weight = 40 },
				}
			},

			{
				Desc = --[[!AUTO_83]]"過關時間",
				Unit = SpecialUnit.TIME,
				Arg  = 11, 		--副本过关时间为11号参数
				Baddish =
				{
					{ Range = {1200,9999}, Desc = --[[!AUTO_84]]"慢速", Icon = 11231, Weight = 0 },
					{ Range = {900,1199}, Desc = --[[!AUTO_85]]"平速", Icon = 11232, Weight = 10 },
					{ Range = {600,899},  Desc = --[[!AUTO_86]]"飛速", Icon = 11233, Weight = 20 },
					{ Range = {0, 599},  Desc = --[[!AUTO_87]]"神速", Icon = 11234, Weight = 30},
				}
			},

			{
				Desc = --[[!AUTO_88]]"重傷次數",
				Unit = --[[!AUTO_89]]"次",
				Arg  = 8, 		--副本内玩家死亡次数为8号参数
				Baddish =
				{
					{ Range = {5, 99999},  Desc = --[[!AUTO_90]]"慘敗", Icon = 11239, Weight = 0 },
					{ Range = {3, 4},  Desc = --[[!AUTO_91]]"重傷", Icon = 11240, Weight = 10 },
					{ Range = {1, 2},  Desc = --[[!AUTO_92]]"輕傷", Icon = 11241, Weight = 20 },
					{ Range = {0, 0},  Desc = --[[!AUTO_93]]"無損", Icon = 11242, Weight = 30},
				}
			},

		},

		AddDrawMoney = 2534,				--2次抽奖消耗金钱，优先绑定币，不足则交易币补齐

		AddDrawLottery = 72423,				--2次抽奖的彩票ID72423

                TeamExp = EctypeScore.TeamExpNormal,		--组队经验加成，经验基数为副本内玩家杀怪获得的总经验，分别是组队人数1-6人对应的加成比例
                Award = 						--评价得分的奖励，range为以上所有评价条件的总权重之和所处的数值区间。lottery为获得的彩票ID，exp为评价经验加成，基数为副本内玩家杀怪获得的总经验
                {
                        { Range = {0,  29}, Lottery = 58457, Exp = EctypeScore.GradeExpNormal[1] },
                        { Range = {30, 59}, Lottery = 58457, Exp = EctypeScore.GradeExpNormal[2] },
                        { Range = {60, 79}, Lottery = 58457, Exp = EctypeScore.GradeExpNormal[3] },
                        { Range = {80, 100}, Lottery = 58457, Exp = EctypeScore.GradeExpNormal[4] },
                },
	},

}


----青城突破

EctypeScore.Cfg[1777] =			--填写副本ID
{
	[1] = 				--模式1的评价
	{
		ScoreCond =
		{
			{
				Desc = --[[!AUTO_94]]"戰鬥分數",	--评价条件名
				Unit = --[[!AUTO_95]]"分",		--评价条件的单位
				Arg  = 9,		--战斗分数为9号参数
				Baddish =		--从上到下分别为B\A\S\SS,range为参数数值区间，desc为界面悬浮文字（新版界面无效？），icon为图标（新版界面无效？），weight为对应数值区间的权重
				{
					{ Range = {0, 24999},  Desc = --[[!AUTO_96]]"醬油", Icon = 11239, Weight = 0},
					{ Range = {25000, 29999},  Desc = --[[!AUTO_97]]"高手", Icon = 11240, Weight = 15 },
					{ Range = {30000, 39999},  Desc = --[[!AUTO_98]]"奇才", Icon = 11241, Weight = 25 },
					{ Range = {40000, 999999},  Desc = --[[!AUTO_99]]"武神", Icon = 11242, Weight = 40 },
				}
			},

			{
				Desc = --[[!AUTO_100]]"過關時間",
				Unit = SpecialUnit.TIME,
				Arg  = 11, 		--副本过关时间为11号参数
				Baddish =
				{
					{ Range = {2400,9999}, Desc = --[[!AUTO_101]]"慢速", Icon = 11231, Weight = 0 },
					{ Range = {2100,2399}, Desc = --[[!AUTO_102]]"平速", Icon = 11232, Weight = 10 },
					{ Range = {1800,2099},  Desc = --[[!AUTO_103]]"飛速", Icon = 11233, Weight = 20 },
					{ Range = {0, 1799},  Desc = --[[!AUTO_104]]"神速", Icon = 11234, Weight = 30},
				}
			},

			{
				Desc = --[[!AUTO_105]]"重傷次數",
				Unit = --[[!AUTO_106]]"次",
				Arg  = 8, 		--副本内玩家死亡次数为8号参数
				Baddish =
				{
					{ Range = {5, 99999},  Desc = --[[!AUTO_107]]"慘敗", Icon = 11239, Weight = 0 },
					{ Range = {3, 4},  Desc = --[[!AUTO_108]]"重傷", Icon = 11240, Weight = 10 },
					{ Range = {1, 2},  Desc = --[[!AUTO_109]]"輕傷", Icon = 11241, Weight = 20 },
					{ Range = {0, 0},  Desc = --[[!AUTO_110]]"無損", Icon = 11242, Weight = 30},
				}
			},

		},


		AddDrawMoney = 4592,				--2次抽奖消耗金钱，优先绑定币，不足则交易币补齐

		AddDrawLottery = 72425,				--2次抽奖的彩票ID72425


                TeamExp = EctypeScore.TeamExpNormal,		--组队经验加成，经验基数为副本内玩家杀怪获得的总经验，分别是组队人数1-6人对应的加成比例
                Award = 						--评价得分的奖励，range为以上所有评价条件的总权重之和所处的数值区间。lottery为获得的彩票ID，exp为评价经验加成，基数为副本内玩家杀怪获得的总经验
		{
                        { Range = {0,  29}, Lottery = 36747, Exp = EctypeScore.GradeExpNormal[1] },
                        { Range = {30, 59}, Lottery = 36747, Exp = EctypeScore.GradeExpNormal[2] },
                        { Range = {60, 79}, Lottery = 36747, Exp = EctypeScore.GradeExpNormal[3] },
                        { Range = {80, 100}, Lottery = 36747, Exp = EctypeScore.GradeExpNormal[4] },
                },
	},

	[2] =  				--模式2的评价
	{
		ScoreCond =
		{
			{
				Desc = --[[!AUTO_111]]"戰鬥分數",	--评价条件名
				Unit = --[[!AUTO_112]]"分",		--评价条件的单位
				Arg  = 9,		--战斗分数为9号参数
				Baddish =		--从上到下分别为B\A\S\SS,range为参数数值区间，desc为界面悬浮文字（新版界面无效？），icon为图标（新版界面无效？），weight为对应数值区间的权重
				{
					{ Range = {0, 24999},  Desc = --[[!AUTO_113]]"醬油", Icon = 11239, Weight = 0},
					{ Range = {25000, 29999},  Desc = --[[!AUTO_114]]"高手", Icon = 11240, Weight = 15 },
					{ Range = {30000, 39999},  Desc = --[[!AUTO_115]]"奇才", Icon = 11241, Weight = 25 },
					{ Range = {40000, 999999},  Desc = --[[!AUTO_116]]"武神", Icon = 11242, Weight = 40 },
				}
			},

			{
				Desc = --[[!AUTO_117]]"過關時間",
				Unit = SpecialUnit.TIME,
				Arg  = 11, 		--副本过关时间为11号参数
				Baddish =
				{
					{ Range = {2400,9999}, Desc = --[[!AUTO_118]]"慢速", Icon = 11231, Weight = 0 },
					{ Range = {2100,2399}, Desc = --[[!AUTO_119]]"平速", Icon = 11232, Weight = 10 },
					{ Range = {1800,2099},  Desc = --[[!AUTO_120]]"飛速", Icon = 11233, Weight = 20 },
					{ Range = {0, 1799},  Desc = --[[!AUTO_121]]"神速", Icon = 11234, Weight = 30},
				}
			},

			{
				Desc = --[[!AUTO_122]]"重傷次數",
				Unit = --[[!AUTO_123]]"次",
				Arg  = 8, 		--副本内玩家死亡次数为8号参数
				Baddish =
				{
					{ Range = {5, 99999},  Desc = --[[!AUTO_124]]"慘敗", Icon = 11239, Weight = 0 },
					{ Range = {3, 4},  Desc = --[[!AUTO_125]]"重傷", Icon = 11240, Weight = 10 },
					{ Range = {1, 2},  Desc = --[[!AUTO_126]]"輕傷", Icon = 11241, Weight = 20 },
					{ Range = {0, 0},  Desc = --[[!AUTO_127]]"無損", Icon = 11242, Weight = 30},
				}
			},

		},

		AddDrawMoney = 5510,				--2次抽奖消耗金钱，优先绑定币，不足则交易币补齐

		AddDrawLottery = 72426,				--2次抽奖的彩票ID72426

                TeamExp = EctypeScore.TeamExpNormal,		--组队经验加成，经验基数为副本内玩家杀怪获得的总经验，分别是组队人数1-6人对应的加成比例
                Award = 						--评价得分的奖励，range为以上所有评价条件的总权重之和所处的数值区间。lottery为获得的彩票ID，exp为评价经验加成，基数为副本内玩家杀怪获得的总经验
		{
                        { Range = {0,  29}, Lottery = 36751, Exp = EctypeScore.GradeExpNormal[1] },
                        { Range = {30, 59}, Lottery = 36751, Exp = EctypeScore.GradeExpNormal[2] },
                        { Range = {60, 79}, Lottery = 36751, Exp = EctypeScore.GradeExpNormal[3] },
                        { Range = {80, 100}, Lottery = 36751, Exp = EctypeScore.GradeExpNormal[4] },
                },
	},

	[3] = 				--模式3的评价
	{
		ScoreCond =
		{
			{
				Desc = --[[!AUTO_128]]"戰鬥分數",	--评价条件名
				Unit = --[[!AUTO_129]]"分",		--评价条件的单位
				Arg  = 9,		--战斗分数为9号参数
				Baddish =		--从上到下分别为B\A\S\SS,range为参数数值区间，desc为界面悬浮文字（新版界面无效？），icon为图标（新版界面无效？），weight为对应数值区间的权重
				{
					{ Range = {0, 24999},  Desc = --[[!AUTO_130]]"醬油", Icon = 11239, Weight = 0},
					{ Range = {25000, 29999},  Desc = --[[!AUTO_131]]"高手", Icon = 11240, Weight = 15 },
					{ Range = {30000, 39999},  Desc = --[[!AUTO_132]]"奇才", Icon = 11241, Weight = 25 },
					{ Range = {40000, 999999},  Desc = --[[!AUTO_133]]"武神", Icon = 11242, Weight = 40 },
				}
			},

			{
				Desc = --[[!AUTO_134]]"過關時間",
				Unit = SpecialUnit.TIME,
				Arg  = 11, 		--副本过关时间为11号参数
				Baddish =
				{
					{ Range = {2400,9999}, Desc = --[[!AUTO_135]]"慢速", Icon = 11231, Weight = 0 },
					{ Range = {2100,2399}, Desc = --[[!AUTO_136]]"平速", Icon = 11232, Weight = 10 },
					{ Range = {1800,2099},  Desc = --[[!AUTO_137]]"飛速", Icon = 11233, Weight = 20 },
					{ Range = {0, 1799},  Desc = --[[!AUTO_138]]"神速", Icon = 11234, Weight = 30},
				}
			},

			{
				Desc = --[[!AUTO_139]]"重傷次數",
				Unit = --[[!AUTO_140]]"次",
				Arg  = 8, 		--副本内玩家死亡次数为8号参数
				Baddish =
				{
					{ Range = {5, 99999},  Desc = --[[!AUTO_141]]"慘敗", Icon = 11239, Weight = 0 },
					{ Range = {3, 4},  Desc = --[[!AUTO_142]]"重傷", Icon = 11240, Weight = 10 },
					{ Range = {1, 2},  Desc = --[[!AUTO_143]]"輕傷", Icon = 11241, Weight = 20 },
					{ Range = {0, 0},  Desc = --[[!AUTO_144]]"無損", Icon = 11242, Weight = 30},
				}
			},

		},

		AddDrawMoney = 6429,				--2次抽奖消耗金钱，优先绑定币，不足则交易币补齐

		AddDrawLottery = 72427,				--2次抽奖的彩票ID72427

                TeamExp = EctypeScore.TeamExpNormal,		--组队经验加成，经验基数为副本内玩家杀怪获得的总经验，分别是组队人数1-6人对应的加成比例
                Award = 						--评价得分的奖励，range为以上所有评价条件的总权重之和所处的数值区间。lottery为获得的彩票ID，exp为评价经验加成，基数为副本内玩家杀怪获得的总经验
		{
                        { Range = {0,  29}, Lottery = 36755, Exp = EctypeScore.GradeExpNormal[1] },
                        { Range = {30, 59}, Lottery = 36755, Exp = EctypeScore.GradeExpNormal[2] },
                        { Range = {60, 79}, Lottery = 36755, Exp = EctypeScore.GradeExpNormal[3] },
                        { Range = {80, 100}, Lottery = 36755, Exp = EctypeScore.GradeExpNormal[4] },
                },
	},

}

----海中孤岛

EctypeScore.Cfg[2626] =			--填写副本ID
{
	[1] = 				--模式1的评价
	{
		ScoreCond =
		{
			{
				Desc = --[[!AUTO_145]]"戰鬥分數",	--评价条件名
				Unit = --[[!AUTO_146]]"分",		--评价条件的单位
				Arg  = 9,		--战斗分数为9号参数
				Baddish =		--从上到下分别为B\A\S\SS,range为参数数值区间，desc为界面悬浮文字（新版界面无效？），icon为图标（新版界面无效？），weight为对应数值区间的权重
				{
					{ Range = {0, 24999},  Desc = --[[!AUTO_147]]"醬油", Icon = 11239, Weight = 0},
					{ Range = {25000, 29999},  Desc = --[[!AUTO_148]]"高手", Icon = 11240, Weight = 15 },
					{ Range = {30000, 39999},  Desc = --[[!AUTO_149]]"奇才", Icon = 11241, Weight = 25 },
					{ Range = {40000, 999999},  Desc = --[[!AUTO_150]]"武神", Icon = 11242, Weight = 40 },
				}
			},

			{
				Desc = --[[!AUTO_151]]"過關時間",
				Unit = SpecialUnit.TIME,
				Arg  = 11, 		--副本过关时间为11号参数
				Baddish =
				{
					{ Range = {1500,9999}, Desc = --[[!AUTO_152]]"慢速", Icon = 11231, Weight = 0 },
					{ Range = {1200,1499}, Desc = --[[!AUTO_153]]"平速", Icon = 11232, Weight = 10 },
					{ Range = {900,1199},  Desc = --[[!AUTO_154]]"飛速", Icon = 11233, Weight = 20 },
					{ Range = {0, 899},  Desc = --[[!AUTO_155]]"神速", Icon = 11234, Weight = 30},
				}
			},

			{
				Desc = --[[!AUTO_156]]"重傷次數",
				Unit = --[[!AUTO_157]]"次",
				Arg  = 8, 		--副本内玩家死亡次数为8号参数
				Baddish =
				{
					{ Range = {5, 99999},  Desc = --[[!AUTO_158]]"慘敗", Icon = 11239, Weight = 0 },
					{ Range = {3, 4},  Desc = --[[!AUTO_159]]"重傷", Icon = 11240, Weight = 10 },
					{ Range = {1, 2},  Desc = --[[!AUTO_160]]"輕傷", Icon = 11241, Weight = 20 },
					{ Range = {0, 0},  Desc = --[[!AUTO_161]]"無損", Icon = 11242, Weight = 30},
				}
			},

		},

		AddDrawMoney = 3760,				--2次抽奖消耗金钱，优先绑定币，不足则交易币补齐

		AddDrawLottery = 72428,				--2次抽奖的彩票ID72428

                TeamExp = EctypeScore.TeamExpNormal,		--组队经验加成，经验基数为副本内玩家杀怪获得的总经验，分别是组队人数1-6人对应的加成比例
                Award = 						--评价得分的奖励，range为以上所有评价条件的总权重之和所处的数值区间。lottery为获得的彩票ID，exp为评价经验加成，基数为副本内玩家杀怪获得的总经验
                {
                        { Range = {0,  29}, Lottery = 62679, Exp = EctypeScore.GradeExpNormal[1] },
                        { Range = {30, 59}, Lottery = 62679, Exp = EctypeScore.GradeExpNormal[2] },
                        { Range = {60, 79}, Lottery = 62679, Exp = EctypeScore.GradeExpNormal[3] },
                        { Range = {80, 100}, Lottery = 62679, Exp = EctypeScore.GradeExpNormal[4] },
                },
	},

	[2] =  				--模式2的评价
	{
		ScoreCond =
		{
			{
				Desc = --[[!AUTO_162]]"戰鬥分數",	--评价条件名
				Unit = --[[!AUTO_163]]"分",		--评价条件的单位
				Arg  = 9,		--战斗分数为9号参数
				Baddish =		--从上到下分别为B\A\S\SS,range为参数数值区间，desc为界面悬浮文字（新版界面无效？），icon为图标（新版界面无效？），weight为对应数值区间的权重
				{
					{ Range = {0, 24999},  Desc = --[[!AUTO_164]]"醬油", Icon = 11239, Weight = 0},
					{ Range = {25000, 29999},  Desc = --[[!AUTO_165]]"高手", Icon = 11240, Weight = 15 },
					{ Range = {30000, 39999},  Desc = --[[!AUTO_166]]"奇才", Icon = 11241, Weight = 25 },
					{ Range = {40000, 999999},  Desc = --[[!AUTO_167]]"武神", Icon = 11242, Weight = 40 },
				}
			},

			{
				Desc = --[[!AUTO_168]]"過關時間",
				Unit = SpecialUnit.TIME,
				Arg  = 11, 		--副本过关时间为11号参数
				Baddish =
				{
					{ Range = {1500,9999}, Desc = --[[!AUTO_169]]"慢速", Icon = 11231, Weight = 0 },
					{ Range = {1200,1499}, Desc = --[[!AUTO_170]]"平速", Icon = 11232, Weight = 10 },
					{ Range = {900,1199},  Desc = --[[!AUTO_171]]"飛速", Icon = 11233, Weight = 20 },
					{ Range = {0, 899},  Desc = --[[!AUTO_172]]"神速", Icon = 11234, Weight = 30},
				}
			},

			{
				Desc = --[[!AUTO_173]]"重傷次數",
				Unit = --[[!AUTO_174]]"次",
				Arg  = 8, 		--副本内玩家死亡次数为8号参数
				Baddish =
				{
					{ Range = {5, 99999},  Desc = --[[!AUTO_175]]"慘敗", Icon = 11239, Weight = 0 },
					{ Range = {3, 4},  Desc = --[[!AUTO_176]]"重傷", Icon = 11240, Weight = 10 },
					{ Range = {1, 2},  Desc = --[[!AUTO_177]]"輕傷", Icon = 11241, Weight = 20 },
					{ Range = {0, 0},  Desc = --[[!AUTO_178]]"無損", Icon = 11242, Weight = 30},
				}
			},

		},

		AddDrawMoney = 4512,				--2次抽奖消耗金钱，优先绑定币，不足则交易币补齐

		AddDrawLottery = 72429,				--2次抽奖的彩票ID72429

                TeamExp = EctypeScore.TeamExpNormal,		--组队经验加成，经验基数为副本内玩家杀怪获得的总经验，分别是组队人数1-6人对应的加成比例
                Award = 						--评价得分的奖励，range为以上所有评价条件的总权重之和所处的数值区间。lottery为获得的彩票ID，exp为评价经验加成，基数为副本内玩家杀怪获得的总经验
                {
                        { Range = {0,  29}, Lottery = 62683, Exp = EctypeScore.GradeExpNormal[1] },
                        { Range = {30, 59}, Lottery = 62683, Exp = EctypeScore.GradeExpNormal[2] },
                        { Range = {60, 79}, Lottery = 62683, Exp = EctypeScore.GradeExpNormal[3] },
                        { Range = {80, 100}, Lottery = 62683, Exp = EctypeScore.GradeExpNormal[4] },
                },
	},

	[3] = 				--模式3的评价
	{
		ScoreCond =
		{
			{
				Desc = --[[!AUTO_179]]"戰鬥分數",	--评价条件名
				Unit = --[[!AUTO_180]]"分",		--评价条件的单位
				Arg  = 9,		--战斗分数为9号参数
				Baddish =		--从上到下分别为B\A\S\SS,range为参数数值区间，desc为界面悬浮文字（新版界面无效？），icon为图标（新版界面无效？），weight为对应数值区间的权重
				{
					{ Range = {0, 24999},  Desc = --[[!AUTO_181]]"醬油", Icon = 11239, Weight = 0},
					{ Range = {25000, 29999},  Desc = --[[!AUTO_182]]"高手", Icon = 11240, Weight = 15 },
					{ Range = {30000, 39999},  Desc = --[[!AUTO_183]]"奇才", Icon = 11241, Weight = 25 },
					{ Range = {40000, 999999},  Desc = --[[!AUTO_184]]"武神", Icon = 11242, Weight = 40 },
				}
			},

			{
				Desc = --[[!AUTO_185]]"過關時間",
				Unit = SpecialUnit.TIME,
				Arg  = 11, 		--副本过关时间为11号参数
				Baddish =
				{
					{ Range = {1500,9999}, Desc = --[[!AUTO_186]]"慢速", Icon = 11231, Weight = 0 },
					{ Range = {1200,1499}, Desc = --[[!AUTO_187]]"平速", Icon = 11232, Weight = 10 },
					{ Range = {900,1199},  Desc = --[[!AUTO_188]]"飛速", Icon = 11233, Weight = 20 },
					{ Range = {0, 899},  Desc = --[[!AUTO_189]]"神速", Icon = 11234, Weight = 30},
				}
			},

			{
				Desc = --[[!AUTO_190]]"重傷次數",
				Unit = --[[!AUTO_191]]"次",
				Arg  = 8, 		--副本内玩家死亡次数为8号参数
				Baddish =
				{
					{ Range = {5, 99999},  Desc = --[[!AUTO_192]]"慘敗", Icon = 11239, Weight = 0 },
					{ Range = {3, 4},  Desc = --[[!AUTO_193]]"重傷", Icon = 11240, Weight = 10 },
					{ Range = {1, 2},  Desc = --[[!AUTO_194]]"輕傷", Icon = 11241, Weight = 20 },
					{ Range = {0, 0},  Desc = --[[!AUTO_195]]"無損", Icon = 11242, Weight = 30},
				}
			},

		},

		AddDrawMoney = 5264,				--2次抽奖消耗金钱，优先绑定币，不足则交易币补齐

		AddDrawLottery = 72430,				--2次抽奖的彩票ID72430

                TeamExp = EctypeScore.TeamExpNormal,		--组队经验加成，经验基数为副本内玩家杀怪获得的总经验，分别是组队人数1-6人对应的加成比例
                Award = 						--评价得分的奖励，range为以上所有评价条件的总权重之和所处的数值区间。lottery为获得的彩票ID，exp为评价经验加成，基数为副本内玩家杀怪获得的总经验
                {
                        { Range = {0,  29}, Lottery = 62687, Exp = EctypeScore.GradeExpNormal[1] },
                        { Range = {30, 59}, Lottery = 62687, Exp = EctypeScore.GradeExpNormal[2] },
                        { Range = {60, 79}, Lottery = 62687, Exp = EctypeScore.GradeExpNormal[3] },
                        { Range = {80, 100}, Lottery = 62687, Exp = EctypeScore.GradeExpNormal[4] },
                },
	},


}


----云上山崖

EctypeScore.Cfg[3048] =			--填写副本ID
{
	[1] = 				--模式1的评价
	{
		ScoreCond =
		{
			{
				Desc = --[[!AUTO_196]]"戰鬥分數",	--评价条件名
				Unit = --[[!AUTO_197]]"分",		--评价条件的单位
				Arg  = 9,		--战斗分数为9号参数
				Baddish =		--从上到下分别为B\A\S\SS,range为参数数值区间，desc为界面悬浮文字（新版界面无效？），icon为图标（新版界面无效？），weight为对应数值区间的权重
				{
					{ Range = {0, 24999},  Desc = --[[!AUTO_198]]"醬油", Icon = 11239, Weight = 0},
					{ Range = {25000, 29999},  Desc = --[[!AUTO_199]]"高手", Icon = 11240, Weight = 15 },
					{ Range = {30000, 39999},  Desc = --[[!AUTO_200]]"奇才", Icon = 11241, Weight = 25 },
					{ Range = {40000, 999999},  Desc = --[[!AUTO_201]]"武神", Icon = 11242, Weight = 40 },
				}
			},

			{
				Desc = --[[!AUTO_202]]"過關時間",
				Unit = SpecialUnit.TIME,
				Arg  = 11, 		--副本过关时间为11号参数
				Baddish =
				{
					{ Range = {1800,9999}, Desc = --[[!AUTO_203]]"慢速", Icon = 11231, Weight = 0 },
					{ Range = {1500,1799}, Desc = --[[!AUTO_204]]"平速", Icon = 11232, Weight = 10 },
					{ Range = {1200,1499},  Desc = --[[!AUTO_205]]"飛速", Icon = 11233, Weight = 20 },
					{ Range = {0, 1199},  Desc = --[[!AUTO_206]]"神速", Icon = 11234, Weight = 30},
				}
			},

			{
				Desc = --[[!AUTO_207]]"重傷次數",
				Unit = --[[!AUTO_208]]"次",
				Arg  = 8, 		--副本内玩家死亡次数为8号参数
				Baddish =
				{
					{ Range = {5, 99999},  Desc = --[[!AUTO_209]]"慘敗", Icon = 11239, Weight = 0 },
					{ Range = {3, 4},  Desc = --[[!AUTO_210]]"重傷", Icon = 11240, Weight = 10 },
					{ Range = {1, 2},  Desc = --[[!AUTO_211]]"輕傷", Icon = 11241, Weight = 20 },
					{ Range = {0, 0},  Desc = --[[!AUTO_212]]"無損", Icon = 11242, Weight = 30},
				}
			},

		},

		AddDrawMoney = 4992,				--2次抽奖消耗金钱，优先绑定币，不足则交易币补齐

		AddDrawLottery = 72431,				--2次抽奖的彩票ID72431

                TeamExp = EctypeScore.TeamExpNormal,		--组队经验加成，经验基数为副本内玩家杀怪获得的总经验，分别是组队人数1-6人对应的加成比例
                Award = 						--评价得分的奖励，range为以上所有评价条件的总权重之和所处的数值区间。lottery为获得的彩票ID，exp为评价经验加成，基数为副本内玩家杀怪获得的总经验
                {
                        { Range = {0,  29}, Lottery = 68438, Exp = EctypeScore.GradeExpNormal[1] },
                        { Range = {30, 59}, Lottery = 68438, Exp = EctypeScore.GradeExpNormal[2] },
                        { Range = {60, 79}, Lottery = 68438, Exp = EctypeScore.GradeExpNormal[3] },
                        { Range = {80, 100}, Lottery = 68438, Exp = EctypeScore.GradeExpNormal[4] },
                },
	},

	[2] =  				--模式2的评价
	{
		ScoreCond =
		{
			{
				Desc = --[[!AUTO_213]]"戰鬥分數",	--评价条件名
				Unit = --[[!AUTO_214]]"分",		--评价条件的单位
				Arg  = 9,		--战斗分数为9号参数
				Baddish =		--从上到下分别为B\A\S\SS,range为参数数值区间，desc为界面悬浮文字（新版界面无效？），icon为图标（新版界面无效？），weight为对应数值区间的权重
				{
					{ Range = {0, 24999},  Desc = --[[!AUTO_215]]"醬油", Icon = 11239, Weight = 0},
					{ Range = {25000, 29999},  Desc = --[[!AUTO_216]]"高手", Icon = 11240, Weight = 15 },
					{ Range = {30000, 39999},  Desc = --[[!AUTO_217]]"奇才", Icon = 11241, Weight = 25 },
					{ Range = {40000, 999999},  Desc = --[[!AUTO_218]]"武神", Icon = 11242, Weight = 40 },
				}
			},

			{
				Desc = --[[!AUTO_219]]"過關時間",
				Unit = SpecialUnit.TIME,
				Arg  = 11, 		--副本过关时间为11号参数
				Baddish =
				{
					{ Range = {1800,9999}, Desc = --[[!AUTO_220]]"慢速", Icon = 11231, Weight = 0 },
					{ Range = {1500,1799}, Desc = --[[!AUTO_221]]"平速", Icon = 11232, Weight = 10 },
					{ Range = {1200,1499},  Desc = --[[!AUTO_222]]"飛速", Icon = 11233, Weight = 20 },
					{ Range = {0, 1199},  Desc = --[[!AUTO_223]]"神速", Icon = 11234, Weight = 30},
				}
			},

			{
				Desc = --[[!AUTO_224]]"重傷次數",
				Unit = --[[!AUTO_225]]"次",
				Arg  = 8, 		--副本内玩家死亡次数为8号参数
				Baddish =
				{
					{ Range = {5, 99999},  Desc = --[[!AUTO_226]]"慘敗", Icon = 11239, Weight = 0 },
					{ Range = {3, 4},  Desc = --[[!AUTO_227]]"重傷", Icon = 11240, Weight = 10 },
					{ Range = {1, 2},  Desc = --[[!AUTO_228]]"輕傷", Icon = 11241, Weight = 20 },
					{ Range = {0, 0},  Desc = --[[!AUTO_229]]"無損", Icon = 11242, Weight = 30},
				}
			},

		},

		AddDrawMoney = 5990,				--2次抽奖消耗金钱，优先绑定币，不足则交易币补齐

		AddDrawLottery = 72432,				--2次抽奖的彩票ID72432

                TeamExp = EctypeScore.TeamExpNormal,		--组队经验加成，经验基数为副本内玩家杀怪获得的总经验，分别是组队人数1-6人对应的加成比例
                Award = 						--评价得分的奖励，range为以上所有评价条件的总权重之和所处的数值区间。lottery为获得的彩票ID，exp为评价经验加成，基数为副本内玩家杀怪获得的总经验
                {
                        { Range = {0,  29}, Lottery = 68442, Exp = EctypeScore.GradeExpNormal[1] },
                        { Range = {30, 59}, Lottery = 68442, Exp = EctypeScore.GradeExpNormal[2] },
                        { Range = {60, 79}, Lottery = 68442, Exp = EctypeScore.GradeExpNormal[3] },
                        { Range = {80, 100}, Lottery = 68442, Exp = EctypeScore.GradeExpNormal[4] },
                },
	},

	[3] = 				--模式3的评价
	{
		ScoreCond =
		{
			{
				Desc = --[[!AUTO_230]]"戰鬥分數",	--评价条件名
				Unit = --[[!AUTO_231]]"分",		--评价条件的单位
				Arg  = 9,		--战斗分数为9号参数
				Baddish =		--从上到下分别为B\A\S\SS,range为参数数值区间，desc为界面悬浮文字（新版界面无效？），icon为图标（新版界面无效？），weight为对应数值区间的权重
				{
					{ Range = {0, 24999},  Desc = --[[!AUTO_232]]"醬油", Icon = 11239, Weight = 0},
					{ Range = {25000, 29999},  Desc = --[[!AUTO_233]]"高手", Icon = 11240, Weight = 15 },
					{ Range = {30000, 39999},  Desc = --[[!AUTO_234]]"奇才", Icon = 11241, Weight = 25 },
					{ Range = {40000, 999999},  Desc = --[[!AUTO_235]]"武神", Icon = 11242, Weight = 40 },
				}
			},

			{
				Desc = --[[!AUTO_236]]"過關時間",
				Unit = SpecialUnit.TIME,
				Arg  = 11, 		--副本过关时间为11号参数
				Baddish =
				{
					{ Range = {1800,9999}, Desc = --[[!AUTO_237]]"慢速", Icon = 11231, Weight = 0 },
					{ Range = {1500,1799}, Desc = --[[!AUTO_238]]"平速", Icon = 11232, Weight = 10 },
					{ Range = {1200,1499},  Desc = --[[!AUTO_239]]"飛速", Icon = 11233, Weight = 20 },
					{ Range = {0, 1199},  Desc = --[[!AUTO_240]]"神速", Icon = 11234, Weight = 30},
				}
			},

			{
				Desc = --[[!AUTO_241]]"重傷次數",
				Unit = --[[!AUTO_242]]"次",
				Arg  = 8, 		--副本内玩家死亡次数为8号参数
				Baddish =
				{
					{ Range = {5, 99999},  Desc = --[[!AUTO_243]]"慘敗", Icon = 11239, Weight = 0 },
					{ Range = {3, 4},  Desc = --[[!AUTO_244]]"重傷", Icon = 11240, Weight = 10 },
					{ Range = {1, 2},  Desc = --[[!AUTO_245]]"輕傷", Icon = 11241, Weight = 20 },
					{ Range = {0, 0},  Desc = --[[!AUTO_246]]"無損", Icon = 11242, Weight = 30},
				}
			},

		},

		AddDrawMoney = 6989,				--2次抽奖消耗金钱，优先绑定币，不足则交易币补齐

		AddDrawLottery = 72433,				--2次抽奖的彩票ID72433

                TeamExp = EctypeScore.TeamExpNormal,		--组队经验加成，经验基数为副本内玩家杀怪获得的总经验，分别是组队人数1-6人对应的加成比例
                Award = 						--评价得分的奖励，range为以上所有评价条件的总权重之和所处的数值区间。lottery为获得的彩票ID，exp为评价经验加成，基数为副本内玩家杀怪获得的总经验
                {
                        { Range = {0,  29}, Lottery = 68446, Exp = EctypeScore.GradeExpNormal[1] },
                        { Range = {30, 59}, Lottery = 68446, Exp = EctypeScore.GradeExpNormal[2] },
                        { Range = {60, 79}, Lottery = 68446, Exp = EctypeScore.GradeExpNormal[3] },
                        { Range = {80, 100}, Lottery = 68446, Exp = EctypeScore.GradeExpNormal[4] },
                },
	},


}




----蝎王魔窟

EctypeScore.Cfg[1928] =			--填写副本ID
{
	[1] = 				--模式1的评价
	{
		ScoreCond =
		{
			{
				Desc = --[[!AUTO_247]]"戰鬥分數",	--评价条件名
				Unit = --[[!AUTO_248]]"分",		--评价条件的单位
				Arg  = 9,		--战斗分数为9号参数
				Baddish =		--从上到下分别为B\A\S\SS,range为参数数值区间，desc为界面悬浮文字（新版界面无效？），icon为图标（新版界面无效？），weight为对应数值区间的权重
				{
					{ Range = {0, 24999},  Desc = --[[!AUTO_249]]"醬油", Icon = 11239, Weight = 0},
					{ Range = {25000, 29999},  Desc = --[[!AUTO_250]]"高手", Icon = 11240, Weight = 15 },
					{ Range = {30000, 39999},  Desc = --[[!AUTO_251]]"奇才", Icon = 11241, Weight = 25 },
					{ Range = {40000, 999999},  Desc = --[[!AUTO_252]]"武神", Icon = 11242, Weight = 40 },
				}
			},

			{
				Desc = --[[!AUTO_253]]"過關時間",
				Unit = SpecialUnit.TIME,
				Arg  = 11, 		--副本过关时间为11号参数
				Baddish =
				{
					{ Range = {1800,9999}, Desc = --[[!AUTO_254]]"慢速", Icon = 11231, Weight = 0 },
					{ Range = {1500,1799}, Desc = --[[!AUTO_255]]"平速", Icon = 11232, Weight = 10 },
					{ Range = {1200,1499},  Desc = --[[!AUTO_256]]"飛速", Icon = 11233, Weight = 20 },
					{ Range = {0, 1199},  Desc = --[[!AUTO_257]]"神速", Icon = 11234, Weight = 30},
				}
			},

			{
				Desc = --[[!AUTO_258]]"重傷次數",
				Unit = --[[!AUTO_259]]"次",
				Arg  = 8, 		--副本内玩家死亡次数为8号参数
				Baddish =
				{
					{ Range = {5, 99999},  Desc = --[[!AUTO_260]]"慘敗", Icon = 11239, Weight = 0 },
					{ Range = {3, 4},  Desc = --[[!AUTO_261]]"重傷", Icon = 11240, Weight = 10 },
					{ Range = {1, 2},  Desc = --[[!AUTO_262]]"輕傷", Icon = 11241, Weight = 20 },
					{ Range = {0, 0},  Desc = --[[!AUTO_263]]"無損", Icon = 11242, Weight = 30},
				}
			},

		},

		AddDrawMoney = 5472,				--2次抽奖消耗金钱，优先绑定币，不足则交易币补齐

		AddDrawLottery = 72434,				--2次抽奖的彩票ID72434

                TeamExp = EctypeScore.TeamExpNormal,		--组队经验加成，经验基数为副本内玩家杀怪获得的总经验，分别是组队人数1-6人对应的加成比例
                Award = 						--评价得分的奖励，range为以上所有评价条件的总权重之和所处的数值区间。lottery为获得的彩票ID，exp为评价经验加成，基数为副本内玩家杀怪获得的总经验
                {
                        { Range = {0,  29}, Lottery = 58871, Exp = EctypeScore.GradeExpNormal[1] },
                        { Range = {30, 59}, Lottery = 58871, Exp = EctypeScore.GradeExpNormal[2] },
                        { Range = {60, 79}, Lottery = 58871, Exp = EctypeScore.GradeExpNormal[3] },
                        { Range = {80, 100}, Lottery = 58871, Exp = EctypeScore.GradeExpNormal[4] },
                },
	},

	[2] =  				--模式2的评价
	{
		ScoreCond =
		{
			{
				Desc = --[[!AUTO_264]]"戰鬥分數",	--评价条件名
				Unit = --[[!AUTO_265]]"分",		--评价条件的单位
				Arg  = 9,		--战斗分数为9号参数
				Baddish =		--从上到下分别为B\A\S\SS,range为参数数值区间，desc为界面悬浮文字（新版界面无效？），icon为图标（新版界面无效？），weight为对应数值区间的权重
				{
					{ Range = {0, 24999},  Desc = --[[!AUTO_266]]"醬油", Icon = 11239, Weight = 0},
					{ Range = {25000, 29999},  Desc = --[[!AUTO_267]]"高手", Icon = 11240, Weight = 15 },
					{ Range = {30000, 39999},  Desc = --[[!AUTO_268]]"奇才", Icon = 11241, Weight = 25 },
					{ Range = {40000, 999999},  Desc = --[[!AUTO_269]]"武神", Icon = 11242, Weight = 40 },
				}
			},

			{
				Desc = --[[!AUTO_270]]"過關時間",
				Unit = SpecialUnit.TIME,
				Arg  = 11, 		--副本过关时间为11号参数
				Baddish =
				{
					{ Range = {1800,9999}, Desc = --[[!AUTO_271]]"慢速", Icon = 11231, Weight = 0 },
					{ Range = {1500,1799}, Desc = --[[!AUTO_272]]"平速", Icon = 11232, Weight = 10 },
					{ Range = {1200,1499},  Desc = --[[!AUTO_273]]"飛速", Icon = 11233, Weight = 20 },
					{ Range = {0, 1199},  Desc = --[[!AUTO_274]]"神速", Icon = 11234, Weight = 30},
				}
			},

			{
				Desc = --[[!AUTO_275]]"重傷次數",
				Unit = --[[!AUTO_276]]"次",
				Arg  = 8, 		--副本内玩家死亡次数为8号参数
				Baddish =
				{
					{ Range = {5, 99999},  Desc = --[[!AUTO_277]]"慘敗", Icon = 11239, Weight = 0 },
					{ Range = {3, 4},  Desc = --[[!AUTO_278]]"重傷", Icon = 11240, Weight = 10 },
					{ Range = {1, 2},  Desc = --[[!AUTO_279]]"輕傷", Icon = 11241, Weight = 20 },
					{ Range = {0, 0},  Desc = --[[!AUTO_280]]"無損", Icon = 11242, Weight = 30},
				}
			},

		},

		AddDrawMoney = 6566,				--2次抽奖消耗金钱，优先绑定币，不足则交易币补齐

		AddDrawLottery = 72435,				--2次抽奖的彩票ID72435

                TeamExp = EctypeScore.TeamExpNormal,		--组队经验加成，经验基数为副本内玩家杀怪获得的总经验，分别是组队人数1-6人对应的加成比例
                Award = 						--评价得分的奖励，range为以上所有评价条件的总权重之和所处的数值区间。lottery为获得的彩票ID，exp为评价经验加成，基数为副本内玩家杀怪获得的总经验
                {
                        { Range = {0,  29}, Lottery = 58875, Exp = EctypeScore.GradeExpNormal[1] },
                        { Range = {30, 59}, Lottery = 58875, Exp = EctypeScore.GradeExpNormal[2] },
                        { Range = {60, 79}, Lottery = 58875, Exp = EctypeScore.GradeExpNormal[3] },
                        { Range = {80, 100}, Lottery = 58875, Exp = EctypeScore.GradeExpNormal[4] },
                },
	},

	[3] = 				--模式3的评价
	{
		ScoreCond =
		{
			{
				Desc = --[[!AUTO_281]]"戰鬥分數",	--评价条件名
				Unit = --[[!AUTO_282]]"分",		--评价条件的单位
				Arg  = 9,		--战斗分数为9号参数
				Baddish =		--从上到下分别为B\A\S\SS,range为参数数值区间，desc为界面悬浮文字（新版界面无效？），icon为图标（新版界面无效？），weight为对应数值区间的权重
				{
					{ Range = {0, 24999},  Desc = --[[!AUTO_283]]"醬油", Icon = 11239, Weight = 0},
					{ Range = {25000, 29999},  Desc = --[[!AUTO_284]]"高手", Icon = 11240, Weight = 15 },
					{ Range = {30000, 39999},  Desc = --[[!AUTO_285]]"奇才", Icon = 11241, Weight = 25 },
					{ Range = {40000, 999999},  Desc = --[[!AUTO_286]]"武神", Icon = 11242, Weight = 40 },
				}
			},

			{
				Desc = --[[!AUTO_287]]"過關時間",
				Unit = SpecialUnit.TIME,
				Arg  = 11, 		--副本过关时间为11号参数
				Baddish =
				{
					{ Range = {1800,9999}, Desc = --[[!AUTO_288]]"慢速", Icon = 11231, Weight = 0 },
					{ Range = {1500,1799}, Desc = --[[!AUTO_289]]"平速", Icon = 11232, Weight = 10 },
					{ Range = {1200,1499},  Desc = --[[!AUTO_290]]"飛速", Icon = 11233, Weight = 20 },
					{ Range = {0, 1199},  Desc = --[[!AUTO_291]]"神速", Icon = 11234, Weight = 30},
				}
			},

			{
				Desc = --[[!AUTO_292]]"重傷次數",
				Unit = --[[!AUTO_293]]"次",
				Arg  = 8, 		--副本内玩家死亡次数为8号参数
				Baddish =
				{
					{ Range = {5, 99999},  Desc = --[[!AUTO_294]]"慘敗", Icon = 11239, Weight = 0 },
					{ Range = {3, 4},  Desc = --[[!AUTO_295]]"重傷", Icon = 11240, Weight = 10 },
					{ Range = {1, 2},  Desc = --[[!AUTO_296]]"輕傷", Icon = 11241, Weight = 20 },
					{ Range = {0, 0},  Desc = --[[!AUTO_297]]"無損", Icon = 11242, Weight = 30},
				}
			},

		},

		AddDrawMoney = 7661,				--2次抽奖消耗金钱，优先绑定币，不足则交易币补齐

		AddDrawLottery = 72436,				--2次抽奖的彩票ID72436

                TeamExp = EctypeScore.TeamExpNormal,		--组队经验加成，经验基数为副本内玩家杀怪获得的总经验，分别是组队人数1-6人对应的加成比例
                Award = 						--评价得分的奖励，range为以上所有评价条件的总权重之和所处的数值区间。lottery为获得的彩票ID，exp为评价经验加成，基数为副本内玩家杀怪获得的总经验
                {
                        { Range = {0,  29}, Lottery = 58879, Exp = EctypeScore.GradeExpNormal[1] },
                        { Range = {30, 59}, Lottery = 58879, Exp = EctypeScore.GradeExpNormal[2] },
                        { Range = {60, 79}, Lottery = 58879, Exp = EctypeScore.GradeExpNormal[3] },
                        { Range = {80, 100}, Lottery = 58879, Exp = EctypeScore.GradeExpNormal[4] },
                },
	},

	[4] = 				--模式4的评价
	{
		ScoreCond =
		{
			{
				Desc = "戰鬥分數",	--评价条件名
				Unit = "分",		--评价条件的单位
				Arg  = 9,		--战斗分数为9号参数
				Baddish =		--从上到下分别为B\A\S\SS,range为参数数值区间，desc为界面悬浮文字（新版界面无效？），icon为图标（新版界面无效？），weight为对应数值区间的权重
				{
					{ Range = {0, 24999},  Desc = "醬油", Icon = 11239, Weight = 0},
					{ Range = {25000, 29999},  Desc = "高手", Icon = 11240, Weight = 15 },
					{ Range = {30000, 39999},  Desc = "奇才", Icon = 11241, Weight = 25 },
					{ Range = {40000, 999999},  Desc = "武神", Icon = 11242, Weight = 40 },
				}
			},

			{
				Desc = "過關時間",
				Unit = SpecialUnit.TIME,
				Arg  = 11, 		--副本过关时间为11号参数
				Baddish =
				{
					{ Range = {1800,9999}, Desc = "慢速", Icon = 11231, Weight = 0 },
					{ Range = {1500,1799}, Desc = "平速", Icon = 11232, Weight = 10 },
					{ Range = {1200,1499},  Desc = "飛速", Icon = 11233, Weight = 20 },
					{ Range = {0, 1199},  Desc = "神速", Icon = 11234, Weight = 30},
				}
			},

			{
				Desc = "重傷次數",
				Unit = "次",
				Arg  = 8, 		--副本内玩家死亡次数为8号参数
				Baddish =
				{
					{ Range = {5, 99999},  Desc = "慘敗", Icon = 11239, Weight = 0 },
					{ Range = {3, 4},  Desc = "重傷", Icon = 11240, Weight = 10 },
					{ Range = {1, 2},  Desc = "輕傷", Icon = 11241, Weight = 20 },
					{ Range = {0, 0},  Desc = "無損", Icon = 11242, Weight = 30},
				}
			},

		},

		AddDrawMoney = 10944,				--2次抽奖消耗金钱，优先绑定币，不足则交易币补齐

		AddDrawLottery = 82447,				--2次抽奖的彩票ID

                TeamExp = EctypeScore.TeamExpNormal,		--组队经验加成，经验基数为副本内玩家杀怪获得的总经验，分别是组队人数1-6人对应的加成比例
                Award = 						--评价得分的奖励，range为以上所有评价条件的总权重之和所处的数值区间。lottery为获得的彩票ID，exp为评价经验加成，基数为副本内玩家杀怪获得的总经验
                {
                        { Range = {0,  29}, Lottery = 82446, Exp = EctypeScore.GradeExpNormal[1] },
                        { Range = {30, 59}, Lottery = 82446, Exp = EctypeScore.GradeExpNormal[2] },
                        { Range = {60, 79}, Lottery = 82446, Exp = EctypeScore.GradeExpNormal[3] },
                        { Range = {80, 100}, Lottery = 82446, Exp = EctypeScore.GradeExpNormal[4] },
                },
	},


}

----沙漠古镇

EctypeScore.Cfg[6230] =			--填写副本ID
{
	[1] = 				--模式1的评价
	{
		ScoreCond =
		{
			{
				Desc = --[[!AUTO_247]]"戰鬥分數",	--评价条件名
				Unit = --[[!AUTO_248]]"分",		--评价条件的单位
				Arg  = 9,		--战斗分数为9号参数
				Baddish =		--从上到下分别为B\A\S\SS,range为参数数值区间，desc为界面悬浮文字（新版界面无效？），icon为图标（新版界面无效？），weight为对应数值区间的权重
				{
					{ Range = {0, 24999},  Desc = --[[!AUTO_249]]"醬油", Icon = 11239, Weight = 0},
					{ Range = {25000, 29999},  Desc = "高手", Icon = 11240, Weight = 15 },
					{ Range = {30000, 39999},  Desc = "奇才", Icon = 11241, Weight = 25 },
					{ Range = {40000, 999999},  Desc = "武神", Icon = 11242, Weight = 40 },
				}
			},

			{
				Desc = --[[!AUTO_253]]"過關時間",
				Unit = SpecialUnit.TIME,
				Arg  = 11, 		--副本过关时间为11号参数
				Baddish =
				{
					{ Range = {1800,9999}, Desc = --[[!AUTO_254]]"慢速", Icon = 11231, Weight = 0 },
					{ Range = {1500,1799}, Desc = --[[!AUTO_255]]"平速", Icon = 11232, Weight = 10 },
					{ Range = {1200,1499},  Desc = --[[!AUTO_256]]"飛速", Icon = 11233, Weight = 20 },
					{ Range = {0, 1199},  Desc = --[[!AUTO_257]]"神速", Icon = 11234, Weight = 30},
				}
			},

			{
				Desc = --[[!AUTO_258]]"重傷次數",
				Unit = --[[!AUTO_259]]"次",
				Arg  = 8, 		--副本内玩家死亡次数为8号参数
				Baddish =
				{
					{ Range = {5, 99999},  Desc = --[[!AUTO_260]]"慘敗", Icon = 11239, Weight = 0 },
					{ Range = {3, 4},  Desc = --[[!AUTO_261]]"重傷", Icon = 11240, Weight = 10 },
					{ Range = {1, 2},  Desc = --[[!AUTO_262]]"輕傷", Icon = 11241, Weight = 20 },
					{ Range = {0, 0},  Desc = --[[!AUTO_263]]"無損", Icon = 11242, Weight = 30},
				}
			},

		},

		AddDrawMoney = 5472,				--2次抽奖消耗金钱，优先绑定币，不足则交易币补齐

		AddDrawLottery = 80306,				--2次抽奖的彩票ID72434

                TeamExp = EctypeScore.TeamExpNormal,		--组队经验加成，经验基数为副本内玩家杀怪获得的总经验，分别是组队人数1-6人对应的加成比例
                Award = 						--评价得分的奖励，range为以上所有评价条件的总权重之和所处的数值区间。lottery为获得的彩票ID，exp为评价经验加成，基数为副本内玩家杀怪获得的总经验
                {
                        { Range = {0,  29}, Lottery = 80303, Exp = EctypeScore.GradeExpNormal[1] },
                        { Range = {30, 59}, Lottery = 80303, Exp = EctypeScore.GradeExpNormal[2] },
                        { Range = {60, 79}, Lottery = 80303, Exp = EctypeScore.GradeExpNormal[3] },
                        { Range = {80, 100}, Lottery = 80303, Exp = EctypeScore.GradeExpNormal[4] },
                },
	},

	[2] =  				--模式2的评价
	{
		ScoreCond =
		{
			{
				Desc = --[[!AUTO_264]]"戰鬥分數",	--评价条件名
				Unit = --[[!AUTO_265]]"分",		--评价条件的单位
				Arg  = 9,		--战斗分数为9号参数
				Baddish =		--从上到下分别为B\A\S\SS,range为参数数值区间，desc为界面悬浮文字（新版界面无效？），icon为图标（新版界面无效？），weight为对应数值区间的权重
				{
					{ Range = {0, 24999},  Desc = --[[!AUTO_249]]"醬油", Icon = 11239, Weight = 0},
					{ Range = {25000, 29999},  Desc = "高手", Icon = 11240, Weight = 15 },
					{ Range = {30000, 39999},  Desc = "奇才", Icon = 11241, Weight = 25 },
					{ Range = {40000, 999999},  Desc = "武神", Icon = 11242, Weight = 40 },
				}
			},

			{
				Desc = --[[!AUTO_270]]"過關時間",
				Unit = SpecialUnit.TIME,
				Arg  = 11, 		--副本过关时间为11号参数
				Baddish =
				{
					{ Range = {1800,9999}, Desc = --[[!AUTO_271]]"慢速", Icon = 11231, Weight = 0 },
					{ Range = {1500,1799}, Desc = --[[!AUTO_272]]"平速", Icon = 11232, Weight = 10 },
					{ Range = {1200,1499},  Desc = --[[!AUTO_273]]"飛速", Icon = 11233, Weight = 20 },
					{ Range = {0, 1199},  Desc = --[[!AUTO_274]]"神速", Icon = 11234, Weight = 30},
				}
			},

			{
				Desc = --[[!AUTO_275]]"重傷次數",
				Unit = --[[!AUTO_276]]"次",
				Arg  = 8, 		--副本内玩家死亡次数为8号参数
				Baddish =
				{
					{ Range = {5, 99999},  Desc = --[[!AUTO_277]]"慘敗", Icon = 11239, Weight = 0 },
					{ Range = {3, 4},  Desc = --[[!AUTO_278]]"重傷", Icon = 11240, Weight = 10 },
					{ Range = {1, 2},  Desc = --[[!AUTO_279]]"輕傷", Icon = 11241, Weight = 20 },
					{ Range = {0, 0},  Desc = --[[!AUTO_280]]"無損", Icon = 11242, Weight = 30},
				}
			},

		},

		AddDrawMoney = 6566,				--2次抽奖消耗金钱，优先绑定币，不足则交易币补齐

		AddDrawLottery = 80307,				--2次抽奖的彩票ID72435

                TeamExp = EctypeScore.TeamExpNormal,		--组队经验加成，经验基数为副本内玩家杀怪获得的总经验，分别是组队人数1-6人对应的加成比例
                Award = 						--评价得分的奖励，range为以上所有评价条件的总权重之和所处的数值区间。lottery为获得的彩票ID，exp为评价经验加成，基数为副本内玩家杀怪获得的总经验
                {
                        { Range = {0,  29}, Lottery = 80304, Exp = EctypeScore.GradeExpNormal[1] },
                        { Range = {30, 59}, Lottery = 80304, Exp = EctypeScore.GradeExpNormal[2] },
                        { Range = {60, 79}, Lottery = 80304, Exp = EctypeScore.GradeExpNormal[3] },
                        { Range = {80, 100}, Lottery = 80304, Exp = EctypeScore.GradeExpNormal[4] },
                },
	},

	[3] = 				--模式3的评价
	{
		ScoreCond =
		{
			{
				Desc = --[[!AUTO_281]]"戰鬥分數",	--评价条件名
				Unit = --[[!AUTO_282]]"分",		--评价条件的单位
				Arg  = 9,		--战斗分数为9号参数
				Baddish =		--从上到下分别为B\A\S\SS,range为参数数值区间，desc为界面悬浮文字（新版界面无效？），icon为图标（新版界面无效？），weight为对应数值区间的权重
				{
					{ Range = {0, 24999},  Desc = --[[!AUTO_249]]"醬油", Icon = 11239, Weight = 0},
					{ Range = {25000, 29999},  Desc = "高手", Icon = 11240, Weight = 15 },
					{ Range = {30000, 39999},  Desc = "奇才", Icon = 11241, Weight = 25 },
					{ Range = {40000, 999999},  Desc = "武神", Icon = 11242, Weight = 40 },
				}
			},

			{
				Desc = --[[!AUTO_287]]"過關時間",
				Unit = SpecialUnit.TIME,
				Arg  = 11, 		--副本过关时间为11号参数
				Baddish =
				{
					{ Range = {1800,9999}, Desc = --[[!AUTO_288]]"慢速", Icon = 11231, Weight = 0 },
					{ Range = {1500,1799}, Desc = --[[!AUTO_289]]"平速", Icon = 11232, Weight = 10 },
					{ Range = {1200,1499},  Desc = --[[!AUTO_290]]"飛速", Icon = 11233, Weight = 20 },
					{ Range = {0, 1199},  Desc = --[[!AUTO_291]]"神速", Icon = 11234, Weight = 30},
				}
			},

			{
				Desc = --[[!AUTO_292]]"重傷次數",
				Unit = --[[!AUTO_293]]"次",
				Arg  = 8, 		--副本内玩家死亡次数为8号参数
				Baddish =
				{
					{ Range = {5, 99999},  Desc = --[[!AUTO_294]]"慘敗", Icon = 11239, Weight = 0 },
					{ Range = {3, 4},  Desc = --[[!AUTO_295]]"重傷", Icon = 11240, Weight = 10 },
					{ Range = {1, 2},  Desc = --[[!AUTO_296]]"輕傷", Icon = 11241, Weight = 20 },
					{ Range = {0, 0},  Desc = --[[!AUTO_297]]"無損", Icon = 11242, Weight = 30},
				}
			},

		},

		AddDrawMoney = 7661,				--2次抽奖消耗金钱，优先绑定币，不足则交易币补齐

		AddDrawLottery = 85193,				--2次抽奖的彩票ID72436

                TeamExp = EctypeScore.TeamExpNormal,		--组队经验加成，经验基数为副本内玩家杀怪获得的总经验，分别是组队人数1-6人对应的加成比例
                Award = 						--评价得分的奖励，range为以上所有评价条件的总权重之和所处的数值区间。lottery为获得的彩票ID，exp为评价经验加成，基数为副本内玩家杀怪获得的总经验
                {
                        { Range = {0,  29}, Lottery = 80305, Exp = EctypeScore.GradeExpNormal[1] },
                        { Range = {30, 59}, Lottery = 80305, Exp = EctypeScore.GradeExpNormal[2] },
                        { Range = {60, 79}, Lottery = 80305, Exp = EctypeScore.GradeExpNormal[3] },
                        { Range = {80, 100}, Lottery = 80305, Exp = EctypeScore.GradeExpNormal[4] },
                },
	},

	[4] = 				--模式4的评价
	{
		ScoreCond =
		{
			{
				Desc = "戰鬥分數",	--评价条件名
				Unit = "分",		--评价条件的单位
				Arg  = 9,		--战斗分数为9号参数
				Baddish =		--从上到下分别为B\A\S\SS,range为参数数值区间，desc为界面悬浮文字（新版界面无效？），icon为图标（新版界面无效？），weight为对应数值区间的权重
				{
					{ Range = {0, 24999},  Desc = --[[!AUTO_249]]"醬油", Icon = 11239, Weight = 0},
					{ Range = {25000, 29999},  Desc = "高手", Icon = 11240, Weight = 15 },
					{ Range = {30000, 39999},  Desc = "奇才", Icon = 11241, Weight = 25 },
					{ Range = {40000, 999999},  Desc = "武神", Icon = 11242, Weight = 40 },
				}
			},

			{
				Desc = "過關時間",
				Unit = SpecialUnit.TIME,
				Arg  = 11, 		--副本过关时间为11号参数
				Baddish =
				{
					{ Range = {1800,9999}, Desc = "慢速", Icon = 11231, Weight = 0 },
					{ Range = {1500,1799}, Desc = "平速", Icon = 11232, Weight = 10 },
					{ Range = {1200,1499},  Desc = "飛速", Icon = 11233, Weight = 20 },
					{ Range = {0, 1199},  Desc = "神速", Icon = 11234, Weight = 30},
				}
			},

			{
				Desc = "重傷次數",
				Unit = "次",
				Arg  = 8, 		--副本内玩家死亡次数为8号参数
				Baddish =
				{
					{ Range = {5, 99999},  Desc = "慘敗", Icon = 11239, Weight = 0 },
					{ Range = {3, 4},  Desc = "重傷", Icon = 11240, Weight = 10 },
					{ Range = {1, 2},  Desc = "輕傷", Icon = 11241, Weight = 20 },
					{ Range = {0, 0},  Desc = "無損", Icon = 11242, Weight = 30},
				}
			},

		},

		AddDrawMoney = 10944,				--2次抽奖消耗金钱，优先绑定币，不足则交易币补齐

		AddDrawLottery = 85197,				--2次抽奖的彩票ID

                TeamExp = EctypeScore.TeamExpNormal,		--组队经验加成，经验基数为副本内玩家杀怪获得的总经验，分别是组队人数1-6人对应的加成比例
                Award = 						--评价得分的奖励，range为以上所有评价条件的总权重之和所处的数值区间。lottery为获得的彩票ID，exp为评价经验加成，基数为副本内玩家杀怪获得的总经验
                {
                        { Range = {0,  29}, Lottery = 82462, Exp = EctypeScore.GradeExpNormal[1] },
                        { Range = {30, 59}, Lottery = 82462, Exp = EctypeScore.GradeExpNormal[2] },
                        { Range = {60, 79}, Lottery = 82462, Exp = EctypeScore.GradeExpNormal[3] },
                        { Range = {80, 100}, Lottery = 82462, Exp = EctypeScore.GradeExpNormal[4] },
                },
	},


}

----东厂盗宝

EctypeScore.Cfg[1923] =			--填写副本ID
{
	[1] = 				--模式1的评价
	{
		ScoreCond =
		{
			{
				Desc = --[[!AUTO_298]]"戰鬥分數",	--评价条件名
				Unit = --[[!AUTO_299]]"分",		--评价条件的单位
				Arg  = 9,		--战斗分数为9号参数
				Baddish =		--从上到下分别为B\A\S\SS,range为参数数值区间，desc为界面悬浮文字（新版界面无效？），icon为图标（新版界面无效？），weight为对应数值区间的权重
				{
					{ Range = {0, 24999},  Desc = --[[!AUTO_300]]"醬油", Icon = 11239, Weight = 0},
					{ Range = {25000, 29999},  Desc = --[[!AUTO_301]]"高手", Icon = 11240, Weight = 15 },
					{ Range = {30000, 39999},  Desc = --[[!AUTO_302]]"奇才", Icon = 11241, Weight = 25 },
					{ Range = {40000, 999999},  Desc = --[[!AUTO_303]]"武神", Icon = 11242, Weight = 40 },
				}
			},

			{
				Desc = --[[!AUTO_304]]"過關時間",
				Unit = SpecialUnit.TIME,
				Arg  = 11, 		--副本过关时间为11号参数
				Baddish =
				{
					{ Range = {2700,9999}, Desc = --[[!AUTO_458]]"慢速", Icon = 11231, Weight = 0 },
					{ Range = {2400,2699}, Desc = --[[!AUTO_459]]"平速", Icon = 11232, Weight = 10 },
					{ Range = {2100,2399},  Desc = --[[!AUTO_460]]"飛速", Icon = 11233, Weight = 20 },
					{ Range = {0, 2099},  Desc = --[[!AUTO_461]]"神速", Icon = 11234, Weight = 30},
				}
			},

			{
				Desc = --[[!AUTO_309]]"重傷次數",
				Unit = --[[!AUTO_310]]"次",
				Arg  = 8, 		--副本内玩家死亡次数为8号参数
				Baddish =
				{
					{ Range = {5, 99999},  Desc = --[[!AUTO_311]]"慘敗", Icon = 11239, Weight = 0 },
					{ Range = {3, 4},  Desc = --[[!AUTO_312]]"重傷", Icon = 11240, Weight = 10 },
					{ Range = {1, 2},  Desc = --[[!AUTO_313]]"輕傷", Icon = 11241, Weight = 20 },
					{ Range = {0, 0},  Desc = --[[!AUTO_314]]"無損", Icon = 11242, Weight = 30},
				}
			},

		},

		AddDrawMoney = 6448,				--2次抽奖消耗金钱，优先绑定币，不足则交易币补齐

		AddDrawLottery = 72437,				--2次抽奖的彩票ID72437

                TeamExp = EctypeScore.TeamExpNormal,		--组队经验加成，经验基数为副本内玩家杀怪获得的总经验，分别是组队人数1-6人对应的加成比例
                Award = 						--评价得分的奖励，range为以上所有评价条件的总权重之和所处的数值区间。lottery为获得的彩票ID，exp为评价经验加成，基数为副本内玩家杀怪获得的总经验
                {
                        { Range = {0,  29}, Lottery = 58639, Exp = EctypeScore.GradeExpNormal[1] },
                        { Range = {30, 59}, Lottery = 58639, Exp = EctypeScore.GradeExpNormal[2] },
                        { Range = {60, 79}, Lottery = 58639, Exp = EctypeScore.GradeExpNormal[3] },
                        { Range = {80, 100}, Lottery = 58639, Exp = EctypeScore.GradeExpNormal[4] },
                },
	},

	[2] =  				--模式2的评价
	{
		ScoreCond =
		{
			{
				Desc = --[[!AUTO_315]]"戰鬥分數",	--评价条件名
				Unit = --[[!AUTO_316]]"分",		--评价条件的单位
				Arg  = 9,		--战斗分数为9号参数
				Baddish =		--从上到下分别为B\A\S\SS,range为参数数值区间，desc为界面悬浮文字（新版界面无效？），icon为图标（新版界面无效？），weight为对应数值区间的权重
				{
					{ Range = {0, 24999},  Desc = --[[!AUTO_317]]"醬油", Icon = 11239, Weight = 0},
					{ Range = {25000, 29999},  Desc = --[[!AUTO_318]]"高手", Icon = 11240, Weight = 15 },
					{ Range = {30000, 39999},  Desc = --[[!AUTO_319]]"奇才", Icon = 11241, Weight = 25 },
					{ Range = {40000, 999999},  Desc = --[[!AUTO_320]]"武神", Icon = 11242, Weight = 40 },
				}
			},

			{
				Desc = --[[!AUTO_321]]"過關時間",
				Unit = SpecialUnit.TIME,
				Arg  = 11, 		--副本过关时间为11号参数
				Baddish =
				{
					{ Range = {2700,9999}, Desc = --[[!AUTO_458]]"慢速", Icon = 11231, Weight = 0 },
					{ Range = {2400,2699}, Desc = --[[!AUTO_459]]"平速", Icon = 11232, Weight = 10 },
					{ Range = {2100,2399},  Desc = --[[!AUTO_460]]"飛速", Icon = 11233, Weight = 20 },
					{ Range = {0, 2099},  Desc = --[[!AUTO_461]]"神速", Icon = 11234, Weight = 30},
				}
			},

			{
				Desc = --[[!AUTO_326]]"重傷次數",
				Unit = --[[!AUTO_327]]"次",
				Arg  = 8, 		--副本内玩家死亡次数为8号参数
				Baddish =
				{
					{ Range = {5, 99999},  Desc = --[[!AUTO_328]]"慘敗", Icon = 11239, Weight = 0 },
					{ Range = {3, 4},  Desc = --[[!AUTO_329]]"重傷", Icon = 11240, Weight = 10 },
					{ Range = {1, 2},  Desc = --[[!AUTO_330]]"輕傷", Icon = 11241, Weight = 20 },
					{ Range = {0, 0},  Desc = --[[!AUTO_331]]"無損", Icon = 11242, Weight = 30},
				}
			},

		},

		AddDrawMoney = 7738,				--2次抽奖消耗金钱，优先绑定币，不足则交易币补齐

		AddDrawLottery = 72438,				--2次抽奖的彩票ID72438

                TeamExp = EctypeScore.TeamExpNormal,		--组队经验加成，经验基数为副本内玩家杀怪获得的总经验，分别是组队人数1-6人对应的加成比例
                Award = 						--评价得分的奖励，range为以上所有评价条件的总权重之和所处的数值区间。lottery为获得的彩票ID，exp为评价经验加成，基数为副本内玩家杀怪获得的总经验
                {
                        { Range = {0,  29}, Lottery = 58643, Exp = EctypeScore.GradeExpNormal[1] },
                        { Range = {30, 59}, Lottery = 58643, Exp = EctypeScore.GradeExpNormal[2] },
                        { Range = {60, 79}, Lottery = 58643, Exp = EctypeScore.GradeExpNormal[3] },
                        { Range = {80, 100}, Lottery = 58643, Exp = EctypeScore.GradeExpNormal[4] },
                },
	},

	[3] = 				--模式3的评价
	{
		ScoreCond =
		{
			{
				Desc = --[[!AUTO_332]]"戰鬥分數",	--评价条件名
				Unit = --[[!AUTO_333]]"分",		--评价条件的单位
				Arg  = 9,		--战斗分数为9号参数
				Baddish =		--从上到下分别为B\A\S\SS,range为参数数值区间，desc为界面悬浮文字（新版界面无效？），icon为图标（新版界面无效？），weight为对应数值区间的权重
				{
					{ Range = {0, 24999},  Desc = --[[!AUTO_334]]"醬油", Icon = 11239, Weight = 0},
					{ Range = {25000, 29999},  Desc = --[[!AUTO_335]]"高手", Icon = 11240, Weight = 15 },
					{ Range = {30000, 39999},  Desc = --[[!AUTO_336]]"奇才", Icon = 11241, Weight = 25 },
					{ Range = {40000, 999999},  Desc = --[[!AUTO_337]]"武神", Icon = 11242, Weight = 40 },
				}
			},

			{
				Desc = --[[!AUTO_338]]"過關時間",
				Unit = SpecialUnit.TIME,
				Arg  = 11, 		--副本过关时间为11号参数
				Baddish =
				{
					{ Range = {2700,9999}, Desc = --[[!AUTO_458]]"慢速", Icon = 11231, Weight = 0 },
					{ Range = {2400,2699}, Desc = --[[!AUTO_459]]"平速", Icon = 11232, Weight = 10 },
					{ Range = {2100,2399},  Desc = --[[!AUTO_460]]"飛速", Icon = 11233, Weight = 20 },
					{ Range = {0, 2099},  Desc = --[[!AUTO_461]]"神速", Icon = 11234, Weight = 30},
				}
			},

			{
				Desc = --[[!AUTO_343]]"重傷次數",
				Unit = --[[!AUTO_344]]"次",
				Arg  = 8, 		--副本内玩家死亡次数为8号参数
				Baddish =
				{
					{ Range = {5, 99999},  Desc = --[[!AUTO_345]]"慘敗", Icon = 11239, Weight = 0 },
					{ Range = {3, 4},  Desc = --[[!AUTO_346]]"重傷", Icon = 11240, Weight = 10 },
					{ Range = {1, 2},  Desc = --[[!AUTO_347]]"輕傷", Icon = 11241, Weight = 20 },
					{ Range = {0, 0},  Desc = --[[!AUTO_348]]"無損", Icon = 11242, Weight = 30},
				}
			},

		},

		AddDrawMoney = 9027,				--2次抽奖消耗金钱，优先绑定币，不足则交易币补齐

		AddDrawLottery = 72439,				--2次抽奖的彩票ID72439

                TeamExp = EctypeScore.TeamExpNormal,		--组队经验加成，经验基数为副本内玩家杀怪获得的总经验，分别是组队人数1-6人对应的加成比例
                Award = 						--评价得分的奖励，range为以上所有评价条件的总权重之和所处的数值区间。lottery为获得的彩票ID，exp为评价经验加成，基数为副本内玩家杀怪获得的总经验
                {
                        { Range = {0,  29}, Lottery = 58647, Exp = EctypeScore.GradeExpNormal[1] },
                        { Range = {30, 59}, Lottery = 58647, Exp = EctypeScore.GradeExpNormal[2] },
                        { Range = {60, 79}, Lottery = 58647, Exp = EctypeScore.GradeExpNormal[3] },
                        { Range = {80, 100}, Lottery = 58647, Exp = EctypeScore.GradeExpNormal[4] },
                },
	},

	[4] = 				--模式4的评价
	{
		ScoreCond =
		{
			{
				Desc = "戰鬥分數",	--评价条件名
				Unit = "分",		--评价条件的单位
				Arg  = 9,		--战斗分数为9号参数
				Baddish =		--从上到下分别为B\A\S\SS,range为参数数值区间，desc为界面悬浮文字（新版界面无效？），icon为图标（新版界面无效？），weight为对应数值区间的权重
				{
					{ Range = {0, 24999},  Desc = "醬油", Icon = 11239, Weight = 0},
					{ Range = {25000, 29999},  Desc = "高手", Icon = 11240, Weight = 15 },
					{ Range = {30000, 39999},  Desc = "奇才", Icon = 11241, Weight = 25 },
					{ Range = {40000, 999999},  Desc = "武神", Icon = 11242, Weight = 40 },
				}
			},

			{
				Desc = "過關時間",
				Unit = SpecialUnit.TIME,
				Arg  = 11, 		--副本过关时间为11号参数
				Baddish =
				{
					{ Range = {2700,9999}, Desc = --[[!AUTO_458]]"慢速", Icon = 11231, Weight = 0 },
					{ Range = {2400,2699}, Desc = --[[!AUTO_459]]"平速", Icon = 11232, Weight = 10 },
					{ Range = {2100,2399},  Desc = --[[!AUTO_460]]"飛速", Icon = 11233, Weight = 20 },
					{ Range = {0, 2099},  Desc = --[[!AUTO_461]]"神速", Icon = 11234, Weight = 30},
				}
			},

			{
				Desc = "重傷次數",
				Unit = "次",
				Arg  = 8, 		--副本内玩家死亡次数为8号参数
				Baddish =
				{
					{ Range = {5, 99999},  Desc = "慘敗", Icon = 11239, Weight = 0 },
					{ Range = {3, 4},  Desc = "重傷", Icon = 11240, Weight = 10 },
					{ Range = {1, 2},  Desc = "輕傷", Icon = 11241, Weight = 20 },
					{ Range = {0, 0},  Desc = "無損", Icon = 11242, Weight = 30},
				}
			},

		},

		AddDrawMoney = 12896,				--2次抽奖消耗金钱，优先绑定币，不足则交易币补齐

		AddDrawLottery = 82449,				--2次抽奖的彩票ID

                TeamExp = EctypeScore.TeamExpNormal,		--组队经验加成，经验基数为副本内玩家杀怪获得的总经验，分别是组队人数1-6人对应的加成比例
                Award = 						--评价得分的奖励，range为以上所有评价条件的总权重之和所处的数值区间。lottery为获得的彩票ID，exp为评价经验加成，基数为副本内玩家杀怪获得的总经验
                {
                        { Range = {0,  29}, Lottery = 82448, Exp = EctypeScore.GradeExpNormal[1] },
                        { Range = {30, 59}, Lottery = 82448, Exp = EctypeScore.GradeExpNormal[2] },
                        { Range = {60, 79}, Lottery = 82448, Exp = EctypeScore.GradeExpNormal[3] },
                        { Range = {80, 100}, Lottery = 82448, Exp = EctypeScore.GradeExpNormal[4] },
                },
	},

}



----连云孤堡

EctypeScore.Cfg[3289] =			--填写副本ID
{
	[1] = 				--模式1的评价
	{
		ScoreCond =
		{
			{
				Desc = --[[!AUTO_349]]"戰鬥分數",	--评价条件名
				Unit = --[[!AUTO_350]]"分",		--评价条件的单位
				Arg  = 9,		--战斗分数为9号参数
				Baddish =		--从上到下分别为B\A\S\SS,range为参数数值区间，desc为界面悬浮文字（新版界面无效？），icon为图标（新版界面无效？），weight为对应数值区间的权重
				{
					{ Range = {0, 24999},  Desc = --[[!AUTO_351]]"醬油", Icon = 11239, Weight = 0},
					{ Range = {25000, 29999},  Desc = --[[!AUTO_352]]"高手", Icon = 11240, Weight = 15 },
					{ Range = {30000, 39999},  Desc = --[[!AUTO_353]]"奇才", Icon = 11241, Weight = 25 },
					{ Range = {40000, 999999},  Desc = --[[!AUTO_354]]"武神", Icon = 11242, Weight = 40 },
				}
			},

			{
				Desc = --[[!AUTO_355]]"過關時間",
				Unit = SpecialUnit.TIME,
				Arg  = 11, 		--副本过关时间为11号参数
				Baddish =
				{
					{ Range = {1800,9999}, Desc = --[[!AUTO_356]]"慢速", Icon = 11231, Weight = 0 },
					{ Range = {1500,1799}, Desc = --[[!AUTO_357]]"平速", Icon = 11232, Weight = 10 },
					{ Range = {1200,1499},  Desc = --[[!AUTO_358]]"飛速", Icon = 11233, Weight = 20 },
					{ Range = {0, 1199},  Desc = --[[!AUTO_359]]"神速", Icon = 11234, Weight = 30},
				}
			},

			{
				Desc = --[[!AUTO_360]]"重傷次數",
				Unit = --[[!AUTO_361]]"次",
				Arg  = 8, 		--副本内玩家死亡次数为8号参数
				Baddish =
				{
					{ Range = {5, 99999},  Desc = --[[!AUTO_362]]"慘敗", Icon = 11239, Weight = 0 },
					{ Range = {3, 4},  Desc = --[[!AUTO_363]]"重傷", Icon = 11240, Weight = 10 },
					{ Range = {1, 2},  Desc = --[[!AUTO_364]]"輕傷", Icon = 11241, Weight = 20 },
					{ Range = {0, 0},  Desc = --[[!AUTO_365]]"無損", Icon = 11242, Weight = 30},
				}
			},

		},


		AddDrawMoney = 6336,				--2次抽奖消耗金钱，优先绑定币，不足则交易币补齐

		AddDrawLottery = 72440,				--2次抽奖的彩票ID72440


                TeamExp = EctypeScore.TeamExpNormal,		--组队经验加成，经验基数为副本内玩家杀怪获得的总经验，分别是组队人数1-6人对应的加成比例
                Award = 						--评价得分的奖励，range为以上所有评价条件的总权重之和所处的数值区间。lottery为获得的彩票ID，exp为评价经验加成，基数为副本内玩家杀怪获得的总经验
		{
                        { Range = {0,  29}, Lottery = 73050, Exp = EctypeScore.GradeExpNormal[1] },
                        { Range = {30, 59}, Lottery = 73050, Exp = EctypeScore.GradeExpNormal[2] },
                        { Range = {60, 79}, Lottery = 73050, Exp = EctypeScore.GradeExpNormal[3] },
                        { Range = {80, 100}, Lottery = 73050, Exp = EctypeScore.GradeExpNormal[4] },
                },
	},

	[2] =  				--模式2的评价
	{
		ScoreCond =
		{
			{
				Desc = --[[!AUTO_366]]"戰鬥分數",	--评价条件名
				Unit = --[[!AUTO_367]]"分",		--评价条件的单位
				Arg  = 9,		--战斗分数为9号参数
				Baddish =		--从上到下分别为B\A\S\SS,range为参数数值区间，desc为界面悬浮文字（新版界面无效？），icon为图标（新版界面无效？），weight为对应数值区间的权重
				{
					{ Range = {0, 24999},  Desc = --[[!AUTO_368]]"醬油", Icon = 11239, Weight = 0},
					{ Range = {25000, 29999},  Desc = --[[!AUTO_369]]"高手", Icon = 11240, Weight = 15 },
					{ Range = {30000, 39999},  Desc = --[[!AUTO_370]]"奇才", Icon = 11241, Weight = 25 },
					{ Range = {40000, 999999},  Desc = --[[!AUTO_371]]"武神", Icon = 11242, Weight = 40 },
				}
			},

			{
				Desc = --[[!AUTO_372]]"過關時間",
				Unit = SpecialUnit.TIME,
				Arg  = 11, 		--副本过关时间为11号参数
				Baddish =
				{
					{ Range = {1800,9999}, Desc = --[[!AUTO_373]]"慢速", Icon = 11231, Weight = 0 },
					{ Range = {1500,1799}, Desc = --[[!AUTO_374]]"平速", Icon = 11232, Weight = 10 },
					{ Range = {1200,1499},  Desc = --[[!AUTO_375]]"飛速", Icon = 11233, Weight = 20 },
					{ Range = {0, 1199},  Desc = --[[!AUTO_376]]"神速", Icon = 11234, Weight = 30},
				}
			},

			{
				Desc = --[[!AUTO_377]]"重傷次數",
				Unit = --[[!AUTO_378]]"次",
				Arg  = 8, 		--副本内玩家死亡次数为8号参数
				Baddish =
				{
					{ Range = {5, 99999},  Desc = --[[!AUTO_379]]"慘敗", Icon = 11239, Weight = 0 },
					{ Range = {3, 4},  Desc = --[[!AUTO_380]]"重傷", Icon = 11240, Weight = 10 },
					{ Range = {1, 2},  Desc = --[[!AUTO_381]]"輕傷", Icon = 11241, Weight = 20 },
					{ Range = {0, 0},  Desc = --[[!AUTO_382]]"無損", Icon = 11242, Weight = 30},
				}
			},

		},

		AddDrawMoney = 7603,				--2次抽奖消耗金钱，优先绑定币，不足则交易币补齐

		AddDrawLottery = 72441,				--2次抽奖的彩票ID72441

                TeamExp = EctypeScore.TeamExpNormal,		--组队经验加成，经验基数为副本内玩家杀怪获得的总经验，分别是组队人数1-6人对应的加成比例
                Award = 						--评价得分的奖励，range为以上所有评价条件的总权重之和所处的数值区间。lottery为获得的彩票ID，exp为评价经验加成，基数为副本内玩家杀怪获得的总经验
		{
                        { Range = {0,  29}, Lottery = 73051, Exp = EctypeScore.GradeExpNormal[1] },
                        { Range = {30, 59}, Lottery = 73051, Exp = EctypeScore.GradeExpNormal[2] },
                        { Range = {60, 79}, Lottery = 73051, Exp = EctypeScore.GradeExpNormal[3] },
                        { Range = {80, 100}, Lottery = 73051, Exp = EctypeScore.GradeExpNormal[4] },
                },
	},

	[3] = 				--模式3的评价
	{
		ScoreCond =
		{
			{
				Desc = --[[!AUTO_383]]"戰鬥分數",	--评价条件名
				Unit = --[[!AUTO_384]]"分",		--评价条件的单位
				Arg  = 9,		--战斗分数为9号参数
				Baddish =		--从上到下分别为B\A\S\SS,range为参数数值区间，desc为界面悬浮文字（新版界面无效？），icon为图标（新版界面无效？），weight为对应数值区间的权重
				{
					{ Range = {0, 24999},  Desc = --[[!AUTO_385]]"醬油", Icon = 11239, Weight = 0},
					{ Range = {25000, 29999},  Desc = --[[!AUTO_386]]"高手", Icon = 11240, Weight = 15 },
					{ Range = {30000, 39999},  Desc = --[[!AUTO_387]]"奇才", Icon = 11241, Weight = 25 },
					{ Range = {40000, 999999},  Desc = --[[!AUTO_388]]"武神", Icon = 11242, Weight = 40 },
				}
			},

			{
				Desc = --[[!AUTO_389]]"過關時間",
				Unit = SpecialUnit.TIME,
				Arg  = 11, 		--副本过关时间为11号参数
				Baddish =
				{
					{ Range = {1800,9999}, Desc = --[[!AUTO_390]]"慢速", Icon = 11231, Weight = 0 },
					{ Range = {1500,1799}, Desc = --[[!AUTO_391]]"平速", Icon = 11232, Weight = 10 },
					{ Range = {1200,1499},  Desc = --[[!AUTO_392]]"飛速", Icon = 11233, Weight = 20 },
					{ Range = {0, 1199},  Desc = --[[!AUTO_393]]"神速", Icon = 11234, Weight = 30},
				}
			},

			{
				Desc = --[[!AUTO_394]]"重傷次數",
				Unit = --[[!AUTO_395]]"次",
				Arg  = 8, 		--副本内玩家死亡次数为8号参数
				Baddish =
				{
					{ Range = {5, 99999},  Desc = --[[!AUTO_396]]"慘敗", Icon = 11239, Weight = 0 },
					{ Range = {3, 4},  Desc = --[[!AUTO_397]]"重傷", Icon = 11240, Weight = 10 },
					{ Range = {1, 2},  Desc = --[[!AUTO_398]]"輕傷", Icon = 11241, Weight = 20 },
					{ Range = {0, 0},  Desc = --[[!AUTO_399]]"無損", Icon = 11242, Weight = 30},
				}
			},

		},

		AddDrawMoney = 8870,				--2次抽奖消耗金钱，优先绑定币，不足则交易币补齐

		AddDrawLottery = 72442,				--2次抽奖的彩票ID724442

                TeamExp = EctypeScore.TeamExpNormal,		--组队经验加成，经验基数为副本内玩家杀怪获得的总经验，分别是组队人数1-6人对应的加成比例
                Award = 						--评价得分的奖励，range为以上所有评价条件的总权重之和所处的数值区间。lottery为获得的彩票ID，exp为评价经验加成，基数为副本内玩家杀怪获得的总经验
		{
                        { Range = {0,  29}, Lottery = 73052, Exp = EctypeScore.GradeExpNormal[1] },
                        { Range = {30, 59}, Lottery = 73052, Exp = EctypeScore.GradeExpNormal[2] },
                        { Range = {60, 79}, Lottery = 73052, Exp = EctypeScore.GradeExpNormal[3] },
                        { Range = {80, 100}, Lottery = 73052, Exp = EctypeScore.GradeExpNormal[4] },
                },
	},

	[4] = 				--模式4的评价
	{
		ScoreCond =
		{
			{
				Desc = "戰鬥分數",	--评价条件名
				Unit = "分",		--评价条件的单位
				Arg  = 9,		--战斗分数为9号参数
				Baddish =		--从上到下分别为B\A\S\SS,range为参数数值区间，desc为界面悬浮文字（新版界面无效？），icon为图标（新版界面无效？），weight为对应数值区间的权重
				{
					{ Range = {0, 24999},  Desc = "醬油", Icon = 11239, Weight = 0},
					{ Range = {25000, 29999},  Desc = "高手", Icon = 11240, Weight = 15 },
					{ Range = {30000, 39999},  Desc = "奇才", Icon = 11241, Weight = 25 },
					{ Range = {40000, 999999},  Desc = "武神", Icon = 11242, Weight = 40 },
				}
			},

			{
				Desc = "過關時間",
				Unit = SpecialUnit.TIME,
				Arg  = 11, 		--副本过关时间为11号参数
				Baddish =
				{
					{ Range = {1800,9999}, Desc = "慢速", Icon = 11231, Weight = 0 },
					{ Range = {1500,1799}, Desc = "平速", Icon = 11232, Weight = 10 },
					{ Range = {1200,1499},  Desc = "飛速", Icon = 11233, Weight = 20 },
					{ Range = {0, 1199},  Desc = "神速", Icon = 11234, Weight = 30},
				}
			},

			{
				Desc = "重傷次數",
				Unit = "次",
				Arg  = 8, 		--副本内玩家死亡次数为8号参数
				Baddish =
				{
					{ Range = {5, 99999},  Desc = "慘敗", Icon = 11239, Weight = 0 },
					{ Range = {3, 4},  Desc = "重傷", Icon = 11240, Weight = 10 },
					{ Range = {1, 2},  Desc = "輕傷", Icon = 11241, Weight = 20 },
					{ Range = {0, 0},  Desc = "無損", Icon = 11242, Weight = 30},
				}
			},

		},

		AddDrawMoney = 12672,				--2次抽奖消耗金钱，优先绑定币，不足则交易币补齐

		AddDrawLottery = 82451,				--2次抽奖的彩票ID724442

                TeamExp = EctypeScore.TeamExpNormal,		--组队经验加成，经验基数为副本内玩家杀怪获得的总经验，分别是组队人数1-6人对应的加成比例
                Award = 						--评价得分的奖励，range为以上所有评价条件的总权重之和所处的数值区间。lottery为获得的彩票ID，exp为评价经验加成，基数为副本内玩家杀怪获得的总经验
		{
                        { Range = {0,  29}, Lottery = 82450, Exp = EctypeScore.GradeExpNormal[1] },
                        { Range = {30, 59}, Lottery = 82450, Exp = EctypeScore.GradeExpNormal[2] },
                        { Range = {60, 79}, Lottery = 82450, Exp = EctypeScore.GradeExpNormal[3] },
                        { Range = {80, 100}, Lottery = 82450, Exp = EctypeScore.GradeExpNormal[4] },
                },
	},
}


----叛军前哨

EctypeScore.Cfg[3049] =			--填写副本ID
{
	[1] = 				--模式1的评价
	{
		ScoreCond =
		{
			{
				Desc = --[[!AUTO_400]]"戰鬥分數",	--评价条件名
				Unit = --[[!AUTO_401]]"分",		--评价条件的单位
				Arg  = 9,		--战斗分数为9号参数
				Baddish =		--从上到下分别为B\A\S\SS,range为参数数值区间，desc为界面悬浮文字（新版界面无效？），icon为图标（新版界面无效？），weight为对应数值区间的权重
				{
					{ Range = {0, 24999},  Desc = --[[!AUTO_402]]"醬油", Icon = 11239, Weight = 0},
					{ Range = {25000, 29999},  Desc = --[[!AUTO_403]]"高手", Icon = 11240, Weight = 15 },
					{ Range = {30000, 39999},  Desc = --[[!AUTO_404]]"奇才", Icon = 11241, Weight = 25 },
					{ Range = {40000, 999999},  Desc = --[[!AUTO_405]]"武神", Icon = 11242, Weight = 40 },
				}
			},

			{
				Desc = --[[!AUTO_406]]"過關時間",
				Unit = SpecialUnit.TIME,
				Arg  = 11, 		--副本过关时间为11号参数
				Baddish =
				{
					{ Range = {1620,9999}, Desc = --[[!AUTO_407]]"慢速", Icon = 11231, Weight = 0 },
					{ Range = {1320,1619}, Desc = --[[!AUTO_408]]"平速", Icon = 11232, Weight = 10 },
					{ Range = {1080,1319},  Desc = --[[!AUTO_409]]"飛速", Icon = 11233, Weight = 20 },
					{ Range = {0, 1079},  Desc = --[[!AUTO_410]]"神速", Icon = 11234, Weight = 30},
				}
			},

			{
				Desc = --[[!AUTO_411]]"重傷次數",
				Unit = --[[!AUTO_412]]"次",
				Arg  = 8, 		--副本内玩家死亡次数为8号参数
				Baddish =
				{
					{ Range = {5, 99999},  Desc = --[[!AUTO_413]]"慘敗", Icon = 11239, Weight = 0 },
					{ Range = {3, 4},  Desc = --[[!AUTO_414]]"重傷", Icon = 11240, Weight = 10 },
					{ Range = {1, 2},  Desc = --[[!AUTO_415]]"輕傷", Icon = 11241, Weight = 20 },
					{ Range = {0, 0},  Desc = --[[!AUTO_416]]"無損", Icon = 11242, Weight = 30},
				}
			},

		},


		AddDrawMoney = 6720,				--2次抽奖消耗金钱，优先绑定币，不足则交易币补齐

		AddDrawLottery = 72443,				--2次抽奖的彩票ID72443


                TeamExp = EctypeScore.TeamExpNormal,		--组队经验加成，经验基数为副本内玩家杀怪获得的总经验，分别是组队人数1-6人对应的加成比例
                Award = 						--评价得分的奖励，range为以上所有评价条件的总权重之和所处的数值区间。lottery为获得的彩票ID，exp为评价经验加成，基数为副本内玩家杀怪获得的总经验
		{
                        { Range = {0,  29}, Lottery = 73677, Exp = EctypeScore.GradeExpNormal[1] },
                        { Range = {30, 59}, Lottery = 73677, Exp = EctypeScore.GradeExpNormal[2] },
                        { Range = {60, 79}, Lottery = 73677, Exp = EctypeScore.GradeExpNormal[3] },
                        { Range = {80, 100}, Lottery = 73677, Exp = EctypeScore.GradeExpNormal[4] },
                },
	},

	[2] =  				--模式2的评价
	{
		ScoreCond =
		{
			{
				Desc = --[[!AUTO_417]]"戰鬥分數",	--评价条件名
				Unit = --[[!AUTO_418]]"分",		--评价条件的单位
				Arg  = 9,		--战斗分数为9号参数
				Baddish =		--从上到下分别为B\A\S\SS,range为参数数值区间，desc为界面悬浮文字（新版界面无效？），icon为图标（新版界面无效？），weight为对应数值区间的权重
				{
					{ Range = {0, 24999},  Desc = --[[!AUTO_419]]"醬油", Icon = 11239, Weight = 0},
					{ Range = {25000, 29999},  Desc = --[[!AUTO_420]]"高手", Icon = 11240, Weight = 15 },
					{ Range = {30000, 39999},  Desc = --[[!AUTO_421]]"奇才", Icon = 11241, Weight = 25 },
					{ Range = {40000, 999999},  Desc = --[[!AUTO_422]]"武神", Icon = 11242, Weight = 40 },
				}
			},

			{
				Desc = --[[!AUTO_423]]"過關時間",
				Unit = SpecialUnit.TIME,
				Arg  = 11, 		--副本过关时间为11号参数
				Baddish =
				{
					{ Range = {1620,9999}, Desc = --[[!AUTO_424]]"慢速", Icon = 11231, Weight = 0 },
					{ Range = {1320,1619}, Desc = --[[!AUTO_425]]"平速", Icon = 11232, Weight = 10 },
					{ Range = {1080,1319},  Desc = --[[!AUTO_426]]"飛速", Icon = 11233, Weight = 20 },
					{ Range = {0, 1079},  Desc = --[[!AUTO_427]]"神速", Icon = 11234, Weight = 30},
				}
			},

			{
				Desc = --[[!AUTO_428]]"重傷次數",
				Unit = --[[!AUTO_429]]"次",
				Arg  = 8, 		--副本内玩家死亡次数为8号参数
				Baddish =
				{
					{ Range = {5, 99999},  Desc = --[[!AUTO_430]]"慘敗", Icon = 11239, Weight = 0 },
					{ Range = {3, 4},  Desc = --[[!AUTO_431]]"重傷", Icon = 11240, Weight = 10 },
					{ Range = {1, 2},  Desc = --[[!AUTO_432]]"輕傷", Icon = 11241, Weight = 20 },
					{ Range = {0, 0},  Desc = --[[!AUTO_433]]"無損", Icon = 11242, Weight = 30},
				}
			},

		},

		AddDrawMoney = 8064,				--2次抽奖消耗金钱，优先绑定币，不足则交易币补齐

		AddDrawLottery = 72444,				--2次抽奖的彩票ID72444

                TeamExp = EctypeScore.TeamExpNormal,		--组队经验加成，经验基数为副本内玩家杀怪获得的总经验，分别是组队人数1-6人对应的加成比例
                Award = 						--评价得分的奖励，range为以上所有评价条件的总权重之和所处的数值区间。lottery为获得的彩票ID，exp为评价经验加成，基数为副本内玩家杀怪获得的总经验
		{
                        { Range = {0,  29}, Lottery = 73678, Exp = EctypeScore.GradeExpNormal[1] },
                        { Range = {30, 59}, Lottery = 73678, Exp = EctypeScore.GradeExpNormal[2] },
                        { Range = {60, 79}, Lottery = 73678, Exp = EctypeScore.GradeExpNormal[3] },
                        { Range = {80, 100}, Lottery = 73678, Exp = EctypeScore.GradeExpNormal[4] },
                },
	},

	[3] = 				--模式3的评价
	{
		ScoreCond =
		{
			{
				Desc = --[[!AUTO_434]]"戰鬥分數",	--评价条件名
				Unit = --[[!AUTO_435]]"分",		--评价条件的单位
				Arg  = 9,		--战斗分数为9号参数
				Baddish =		--从上到下分别为B\A\S\SS,range为参数数值区间，desc为界面悬浮文字（新版界面无效？），icon为图标（新版界面无效？），weight为对应数值区间的权重
				{
					{ Range = {0, 24999},  Desc = --[[!AUTO_436]]"醬油", Icon = 11239, Weight = 0},
					{ Range = {25000, 29999},  Desc = --[[!AUTO_437]]"高手", Icon = 11240, Weight = 15 },
					{ Range = {30000, 39999},  Desc = --[[!AUTO_438]]"奇才", Icon = 11241, Weight = 25 },
					{ Range = {40000, 999999},  Desc = --[[!AUTO_439]]"武神", Icon = 11242, Weight = 40 },
				}
			},

			{
				Desc = --[[!AUTO_440]]"過關時間",
				Unit = SpecialUnit.TIME,
				Arg  = 11, 		--副本过关时间为11号参数
				Baddish =
				{
					{ Range = {1620,9999}, Desc = --[[!AUTO_441]]"慢速", Icon = 11231, Weight = 0 },
					{ Range = {1320,1619}, Desc = --[[!AUTO_442]]"平速", Icon = 11232, Weight = 10 },
					{ Range = {1080,1319},  Desc = --[[!AUTO_443]]"飛速", Icon = 11233, Weight = 20 },
					{ Range = {0, 1079},  Desc = --[[!AUTO_444]]"神速", Icon = 11234, Weight = 30},
				}
			},

			{
				Desc = --[[!AUTO_445]]"重傷次數",
				Unit = --[[!AUTO_446]]"次",
				Arg  = 8, 		--副本内玩家死亡次数为8号参数
				Baddish =
				{
					{ Range = {5, 99999},  Desc = --[[!AUTO_447]]"慘敗", Icon = 11239, Weight = 0 },
					{ Range = {3, 4},  Desc = --[[!AUTO_448]]"重傷", Icon = 11240, Weight = 10 },
					{ Range = {1, 2},  Desc = --[[!AUTO_449]]"輕傷", Icon = 11241, Weight = 20 },
					{ Range = {0, 0},  Desc = --[[!AUTO_450]]"無損", Icon = 11242, Weight = 30},
				}
			},

		},

		AddDrawMoney = 9408,				--2次抽奖消耗金钱，优先绑定币，不足则交易币补齐

		AddDrawLottery = 72445,				--2次抽奖的彩票ID72445

                TeamExp = EctypeScore.TeamExpNormal,		--组队经验加成，经验基数为副本内玩家杀怪获得的总经验，分别是组队人数1-6人对应的加成比例
                Award = 						--评价得分的奖励，range为以上所有评价条件的总权重之和所处的数值区间。lottery为获得的彩票ID，exp为评价经验加成，基数为副本内玩家杀怪获得的总经验
		{
                        { Range = {0,  29}, Lottery = 73679, Exp = EctypeScore.GradeExpNormal[1] },
                        { Range = {30, 59}, Lottery = 73679, Exp = EctypeScore.GradeExpNormal[2] },
                        { Range = {60, 79}, Lottery = 73679, Exp = EctypeScore.GradeExpNormal[3] },
                        { Range = {80, 100}, Lottery = 73679, Exp = EctypeScore.GradeExpNormal[4] },
                },
	},


	[4] = 				--模式4的评价
	{
		ScoreCond =
		{
			{
				Desc = "戰鬥分數",	--评价条件名
				Unit = "分",		--评价条件的单位
				Arg  = 9,		--战斗分数为9号参数
				Baddish =		--从上到下分别为B\A\S\SS,range为参数数值区间，desc为界面悬浮文字（新版界面无效？），icon为图标（新版界面无效？），weight为对应数值区间的权重
				{
					{ Range = {0, 24999},  Desc = "醬油", Icon = 11239, Weight = 0},
					{ Range = {25000, 29999},  Desc = "高手", Icon = 11240, Weight = 15 },
					{ Range = {30000, 39999},  Desc ="奇才", Icon = 11241, Weight = 25 },
					{ Range = {40000, 999999},  Desc = "武神", Icon = 11242, Weight = 40 },
				}
			},

			{
				Desc = "過關時間",
				Unit = SpecialUnit.TIME,
				Arg  = 11, 		--副本过关时间为11号参数
				Baddish =
				{
					{ Range = {1620,9999}, Desc = "慢速", Icon = 11231, Weight = 0 },
					{ Range = {1320,1619}, Desc = "平速", Icon = 11232, Weight = 10 },
					{ Range = {1080,1319},  Desc = "飛速", Icon = 11233, Weight = 20 },
					{ Range = {0, 1079},  Desc = "神速", Icon = 11234, Weight = 30},
				}
			},

			{
				Desc = "重傷次數",
				Unit = "次",
				Arg  = 8, 		--副本内玩家死亡次数为8号参数
				Baddish =
				{
					{ Range = {5, 99999},  Desc = "慘敗", Icon = 11239, Weight = 0 },
					{ Range = {3, 4},  Desc = "重傷", Icon = 11240, Weight = 10 },
					{ Range = {1, 2},  Desc = "輕傷", Icon = 11241, Weight = 20 },
					{ Range = {0, 0},  Desc = "無損", Icon = 11242, Weight = 30},
				}
			},

		},

		AddDrawMoney = 12320,				--2次抽奖消耗金钱，优先绑定币，不足则交易币补齐

		AddDrawLottery = 82453,				--2次抽奖的彩票ID

                TeamExp = EctypeScore.TeamExpNormal,		--组队经验加成，经验基数为副本内玩家杀怪获得的总经验，分别是组队人数1-6人对应的加成比例
                Award = 						--评价得分的奖励，range为以上所有评价条件的总权重之和所处的数值区间。lottery为获得的彩票ID，exp为评价经验加成，基数为副本内玩家杀怪获得的总经验
		{
                        { Range = {0,  29}, Lottery = 82452, Exp = EctypeScore.GradeExpNormal[1] },
                        { Range = {30, 59}, Lottery = 82452, Exp = EctypeScore.GradeExpNormal[2] },
                        { Range = {60, 79}, Lottery = 82452, Exp = EctypeScore.GradeExpNormal[3] },
                        { Range = {80, 100}, Lottery = 82452, Exp = EctypeScore.GradeExpNormal[4] },
                },
	},

}



----叛军本营

EctypeScore.Cfg[3050] =			--填写副本ID
{
	[1] = 				--模式1的评价
	{
		ScoreCond =
		{
			{
				Desc = --[[!AUTO_451]]"戰鬥分數",	--评价条件名
				Unit = --[[!AUTO_452]]"分",		--评价条件的单位
				Arg  = 9,		--战斗分数为9号参数
				Baddish =		--从上到下分别为B\A\S\SS,range为参数数值区间，desc为界面悬浮文字（新版界面无效？），icon为图标（新版界面无效？），weight为对应数值区间的权重
				{
					{ Range = {0, 24999},  Desc = --[[!AUTO_453]]"醬油", Icon = 11239, Weight = 0},
					{ Range = {25000, 29999},  Desc = --[[!AUTO_454]]"高手", Icon = 11240, Weight = 15 },
					{ Range = {30000, 39999},  Desc = --[[!AUTO_455]]"奇才", Icon = 11241, Weight = 25 },
					{ Range = {40000, 999999},  Desc = --[[!AUTO_456]]"武神", Icon = 11242, Weight = 40 },
				}
			},

			{
				Desc = --[[!AUTO_457]]"過關時間",
				Unit = SpecialUnit.TIME,
				Arg  = 11, 		--副本过关时间为11号参数
				Baddish =
				{
					{ Range = {2700,9999}, Desc = --[[!AUTO_458]]"慢速", Icon = 11231, Weight = 0 },
					{ Range = {2400,2699}, Desc = --[[!AUTO_459]]"平速", Icon = 11232, Weight = 10 },
					{ Range = {2100,2399},  Desc = --[[!AUTO_460]]"飛速", Icon = 11233, Weight = 20 },
					{ Range = {0, 2099},  Desc = --[[!AUTO_461]]"神速", Icon = 11234, Weight = 30},
				}
			},

			{
				Desc = --[[!AUTO_462]]"重傷次數",
				Unit = --[[!AUTO_463]]"次",
				Arg  = 8, 		--副本内玩家死亡次数为8号参数
				Baddish =
				{
					{ Range = {5, 99999},  Desc = --[[!AUTO_464]]"慘敗", Icon = 11239, Weight = 0 },
					{ Range = {3, 4},  Desc = --[[!AUTO_465]]"重傷", Icon = 11240, Weight = 10 },
					{ Range = {1, 2},  Desc = --[[!AUTO_466]]"輕傷", Icon = 11241, Weight = 20 },
					{ Range = {0, 0},  Desc = --[[!AUTO_467]]"無損", Icon = 11242, Weight = 30},
				}
			},

		},


		AddDrawMoney = 8176,				--2次抽奖消耗金钱，优先绑定币，不足则交易币补齐

		AddDrawLottery = 72446,				--2次抽奖的彩票ID72446


                TeamExp = EctypeScore.TeamExpNormal,		--组队经验加成，经验基数为副本内玩家杀怪获得的总经验，分别是组队人数1-6人对应的加成比例
                Award = 						--评价得分的奖励，range为以上所有评价条件的总权重之和所处的数值区间。lottery为获得的彩票ID，exp为评价经验加成，基数为副本内玩家杀怪获得的总经验
		{
                        { Range = {0,  29}, Lottery = 73882, Exp = EctypeScore.GradeExpNormal[1] },
                        { Range = {30, 59}, Lottery = 73882, Exp = EctypeScore.GradeExpNormal[2] },
                        { Range = {60, 79}, Lottery = 73882, Exp = EctypeScore.GradeExpNormal[3] },
                        { Range = {80, 100}, Lottery = 73882, Exp = EctypeScore.GradeExpNormal[4] },
                },
	},

	[2] =  				--模式2的评价
	{
		ScoreCond =
		{
			{
				Desc = --[[!AUTO_468]]"戰鬥分數",	--评价条件名
				Unit = --[[!AUTO_469]]"分",		--评价条件的单位
				Arg  = 9,		--战斗分数为9号参数
				Baddish =		--从上到下分别为B\A\S\SS,range为参数数值区间，desc为界面悬浮文字（新版界面无效？），icon为图标（新版界面无效？），weight为对应数值区间的权重
				{
					{ Range = {0, 24999},  Desc = --[[!AUTO_470]]"醬油", Icon = 11239, Weight = 0},
					{ Range = {25000, 29999},  Desc = --[[!AUTO_471]]"高手", Icon = 11240, Weight = 15 },
					{ Range = {30000, 39999},  Desc = --[[!AUTO_472]]"奇才", Icon = 11241, Weight = 25 },
					{ Range = {40000, 999999},  Desc = --[[!AUTO_473]]"武神", Icon = 11242, Weight = 40 },
				}
			},

			{
				Desc = --[[!AUTO_474]]"過關時間",
				Unit = SpecialUnit.TIME,
				Arg  = 11, 		--副本过关时间为11号参数
				Baddish =
				{
					{ Range = {2700,9999}, Desc = --[[!AUTO_475]]"慢速", Icon = 11231, Weight = 0 },
					{ Range = {2400,2699}, Desc = --[[!AUTO_476]]"平速", Icon = 11232, Weight = 10 },
					{ Range = {2100,2399},  Desc = --[[!AUTO_477]]"飛速", Icon = 11233, Weight = 20 },
					{ Range = {0, 2099},  Desc = --[[!AUTO_478]]"神速", Icon = 11234, Weight = 30},
				}
			},

			{
				Desc = --[[!AUTO_479]]"重傷次數",
				Unit = --[[!AUTO_480]]"次",
				Arg  = 8, 		--副本内玩家死亡次数为8号参数
				Baddish =
				{
					{ Range = {5, 99999},  Desc = --[[!AUTO_481]]"慘敗", Icon = 11239, Weight = 0 },
					{ Range = {3, 4},  Desc = --[[!AUTO_482]]"重傷", Icon = 11240, Weight = 10 },
					{ Range = {1, 2},  Desc = --[[!AUTO_483]]"輕傷", Icon = 11241, Weight = 20 },
					{ Range = {0, 0},  Desc = --[[!AUTO_484]]"無損", Icon = 11242, Weight = 30},
				}
			},

		},

		AddDrawMoney = 9811,				--2次抽奖消耗金钱，优先绑定币，不足则交易币补齐

		AddDrawLottery = 72447,				--2次抽奖的彩票ID72447

                TeamExp = EctypeScore.TeamExpNormal,		--组队经验加成，经验基数为副本内玩家杀怪获得的总经验，分别是组队人数1-6人对应的加成比例
                Award = 						--评价得分的奖励，range为以上所有评价条件的总权重之和所处的数值区间。lottery为获得的彩票ID，exp为评价经验加成，基数为副本内玩家杀怪获得的总经验
		{
                        { Range = {0,  29}, Lottery = 73883, Exp = EctypeScore.GradeExpNormal[1] },
                        { Range = {30, 59}, Lottery = 73883, Exp = EctypeScore.GradeExpNormal[2] },
                        { Range = {60, 79}, Lottery = 73883, Exp = EctypeScore.GradeExpNormal[3] },
                        { Range = {80, 100}, Lottery = 73883, Exp = EctypeScore.GradeExpNormal[4] },
                },
	},

	[3] = 				--模式3的评价
	{
		ScoreCond =
		{
			{
				Desc = --[[!AUTO_485]]"戰鬥分數",	--评价条件名
				Unit = --[[!AUTO_486]]"分",		--评价条件的单位
				Arg  = 9,		--战斗分数为9号参数
				Baddish =		--从上到下分别为B\A\S\SS,range为参数数值区间，desc为界面悬浮文字（新版界面无效？），icon为图标（新版界面无效？），weight为对应数值区间的权重
				{
					{ Range = {0, 24999},  Desc = --[[!AUTO_487]]"醬油", Icon = 11239, Weight = 0},
					{ Range = {25000, 29999},  Desc = --[[!AUTO_488]]"高手", Icon = 11240, Weight = 15 },
					{ Range = {30000, 39999},  Desc = --[[!AUTO_489]]"奇才", Icon = 11241, Weight = 25 },
					{ Range = {40000, 999999},  Desc = --[[!AUTO_490]]"武神", Icon = 11242, Weight = 40 },
				}
			},

			{
				Desc = --[[!AUTO_491]]"過關時間",
				Unit = SpecialUnit.TIME,
				Arg  = 11, 		--副本过关时间为11号参数
				Baddish =
				{
					{ Range = {2700,9999}, Desc = --[[!AUTO_492]]"慢速", Icon = 11231, Weight = 0 },
					{ Range = {2400,2699}, Desc = --[[!AUTO_493]]"平速", Icon = 11232, Weight = 10 },
					{ Range = {2100,2399},  Desc = --[[!AUTO_494]]"飛速", Icon = 11233, Weight = 20 },
					{ Range = {0, 2099},  Desc = --[[!AUTO_495]]"神速", Icon = 11234, Weight = 30},
				}
			},

			{
				Desc = --[[!AUTO_496]]"重傷次數",
				Unit = --[[!AUTO_497]]"次",
				Arg  = 8, 		--副本内玩家死亡次数为8号参数
				Baddish =
				{
					{ Range = {5, 99999},  Desc = --[[!AUTO_498]]"慘敗", Icon = 11239, Weight = 0 },
					{ Range = {3, 4},  Desc = --[[!AUTO_499]]"重傷", Icon = 11240, Weight = 10 },
					{ Range = {1, 2},  Desc = --[[!AUTO_500]]"輕傷", Icon = 11241, Weight = 20 },
					{ Range = {0, 0},  Desc = --[[!AUTO_501]]"無損", Icon = 11242, Weight = 30},
				}
			},

		},

		AddDrawMoney = 11446,				--2次抽奖消耗金钱，优先绑定币，不足则交易币补齐

		AddDrawLottery = 72448,				--2次抽奖的彩票ID72448

                TeamExp = EctypeScore.TeamExpNormal,		--组队经验加成，经验基数为副本内玩家杀怪获得的总经验，分别是组队人数1-6人对应的加成比例
                Award = 						--评价得分的奖励，range为以上所有评价条件的总权重之和所处的数值区间。lottery为获得的彩票ID，exp为评价经验加成，基数为副本内玩家杀怪获得的总经验
		{
                        { Range = {0,  29}, Lottery = 73884, Exp = EctypeScore.GradeExpNormal[1] },
                        { Range = {30, 59}, Lottery = 73884, Exp = EctypeScore.GradeExpNormal[2] },
                        { Range = {60, 79}, Lottery = 73884, Exp = EctypeScore.GradeExpNormal[3] },
                        { Range = {80, 100}, Lottery = 73884, Exp = EctypeScore.GradeExpNormal[4] },
                },
	},

	[4] = 				--模式4的评价
	{
		ScoreCond =
		{
			{
				Desc = "戰鬥分數",	--评价条件名
				Unit = "分",		--评价条件的单位
				Arg  = 9,		--战斗分数为9号参数
				Baddish =		--从上到下分别为B\A\S\SS,range为参数数值区间，desc为界面悬浮文字（新版界面无效？），icon为图标（新版界面无效？），weight为对应数值区间的权重
				{
					{ Range = {0, 24999},  Desc = "醬油", Icon = 11239, Weight = 0},
					{ Range = {25000, 29999},  Desc = "高手", Icon = 11240, Weight = 15 },
					{ Range = {30000, 39999},  Desc = "奇才", Icon = 11241, Weight = 25 },
					{ Range = {40000, 999999},  Desc = "武神", Icon = 11242, Weight = 40 },
				}
			},

			{
				Desc = "過關時間",
				Unit = SpecialUnit.TIME,
				Arg  = 11, 		--副本过关时间为11号参数
				Baddish =
				{
					{ Range = {2700,9999}, Desc = "慢速", Icon = 11231, Weight = 0 },
					{ Range = {2400,2699}, Desc = "平速", Icon = 11232, Weight = 10 },
					{ Range = {2100,2399},  Desc = "飛速", Icon = 11233, Weight = 20 },
					{ Range = {0, 2099},  Desc = "神速", Icon = 11234, Weight = 30},
				}
			},

			{
				Desc = "重傷次數",
				Unit = "次",
				Arg  = 8, 		--副本内玩家死亡次数为8号参数
				Baddish =
				{
					{ Range = {5, 99999},  Desc = "慘敗", Icon = 11239, Weight = 0 },
					{ Range = {3, 4},  Desc = "重傷", Icon = 11240, Weight = 10 },
					{ Range = {1, 2},  Desc = "輕傷", Icon = 11241, Weight = 20 },
					{ Range = {0, 0},  Desc = "無損", Icon = 11242, Weight = 30},
				}
			},

		},

		AddDrawMoney = 17520,				--2次抽奖消耗金钱，优先绑定币，不足则交易币补齐

		AddDrawLottery = 82455,				--2次抽奖的彩票ID

                TeamExp = EctypeScore.TeamExpNormal,		--组队经验加成，经验基数为副本内玩家杀怪获得的总经验，分别是组队人数1-6人对应的加成比例
                Award = 						--评价得分的奖励，range为以上所有评价条件的总权重之和所处的数值区间。lottery为获得的彩票ID，exp为评价经验加成，基数为副本内玩家杀怪获得的总经验
		{
                        { Range = {0,  29}, Lottery = 82454, Exp = EctypeScore.GradeExpNormal[1] },
                        { Range = {30, 59}, Lottery = 82454, Exp = EctypeScore.GradeExpNormal[2] },
                        { Range = {60, 79}, Lottery = 82454, Exp = EctypeScore.GradeExpNormal[3] },
                        { Range = {80, 100}, Lottery = 82454, Exp = EctypeScore.GradeExpNormal[4] },
                },
	},

}

----青城覆灭

EctypeScore.Cfg[2083] =			--填写副本ID
{
	[1] = 				--模式1的评价
	{
		ScoreCond =
		{
			{
				Desc = --[[!AUTO_502]]"戰鬥分數",	--评价条件名
				Unit = --[[!AUTO_503]]"分",		--评价条件的单位
				Arg  = 9,		--战斗分数为9号参数
				Baddish =		--从上到下分别为B\A\S\SS,range为参数数值区间，desc为界面悬浮文字（新版界面无效？），icon为图标（新版界面无效？），weight为对应数值区间的权重
				{
					{ Range = {0, 24999},  Desc = --[[!AUTO_504]]"醬油", Icon = 11239, Weight = 0},
					{ Range = {25000, 29999},  Desc = --[[!AUTO_505]]"高手", Icon = 11240, Weight = 15 },
					{ Range = {30000, 39999},  Desc = --[[!AUTO_506]]"奇才", Icon = 11241, Weight = 25 },
					{ Range = {40000, 999999},  Desc = --[[!AUTO_507]]"武神", Icon = 11242, Weight = 40 },
				}
			},

			{
				Desc = --[[!AUTO_508]]"過關時間",
				Unit = SpecialUnit.TIME,
				Arg  = 11, 		--副本过关时间为11号参数
				Baddish =
				{
					{ Range = {3000,9999}, Desc = --[[!AUTO_509]]"慢速", Icon = 11231, Weight = 0 },
					{ Range = {2400,2999}, Desc = --[[!AUTO_510]]"平速", Icon = 11232, Weight = 10 },
					{ Range = {2100,2399},  Desc = --[[!AUTO_511]]"飛速", Icon = 11233, Weight = 20 },
					{ Range = {0, 2099},  Desc = --[[!AUTO_512]]"神速", Icon = 11234, Weight = 30},
				}
			},

			{
				Desc = --[[!AUTO_513]]"重傷次數",
				Unit = --[[!AUTO_514]]"次",
				Arg  = 8, 		--副本内玩家死亡次数为8号参数
				Baddish =
				{
					{ Range = {5, 99999},  Desc = --[[!AUTO_515]]"慘敗", Icon = 11239, Weight = 0 },
					{ Range = {3, 4},  Desc = --[[!AUTO_516]]"重傷", Icon = 11240, Weight = 10 },
					{ Range = {1, 2},  Desc = --[[!AUTO_517]]"輕傷", Icon = 11241, Weight = 20 },
					{ Range = {0, 0},  Desc = --[[!AUTO_518]]"無損", Icon = 11242, Weight = 30},
				}
			},

		},

		AddDrawMoney = 9856,				--2次抽奖消耗金钱，优先绑定币，不足则交易币补齐

		AddDrawLottery = 72449,				--2次抽奖的彩票ID72449


		TeamExp = EctypeScore.TeamExpNormal,		--组队经验加成，经验基数为副本内玩家杀怪获得的总经验，分别是组队人数1-6人对应的加成比例
                Award = 						--评价得分的奖励，range为以上所有评价条件的总权重之和所处的数值区间。lottery为获得的彩票ID，exp为评价经验加成，基数为副本内玩家杀怪获得的总经验
		{
                        { Range = {0,  29}, Lottery = 63023, Exp = EctypeScore.GradeExpNormal[1] },
                        { Range = {30, 59}, Lottery = 63023, Exp = EctypeScore.GradeExpNormal[2] },
                        { Range = {60, 79}, Lottery = 63023, Exp = EctypeScore.GradeExpNormal[3] },
                        { Range = {80, 100}, Lottery = 63023, Exp = EctypeScore.GradeExpNormal[4] },
                },
	},

	[2] =  				--模式2的评价
	{
		ScoreCond =
		{
			{
				Desc = --[[!AUTO_519]]"戰鬥分數",	--评价条件名
				Unit = --[[!AUTO_520]]"分",		--评价条件的单位
				Arg  = 9,		--战斗分数为9号参数
				Baddish =		--从上到下分别为B\A\S\SS,range为参数数值区间，desc为界面悬浮文字（新版界面无效？），icon为图标（新版界面无效？），weight为对应数值区间的权重
				{
					{ Range = {0, 24999},  Desc = --[[!AUTO_521]]"醬油", Icon = 11239, Weight = 0},
					{ Range = {25000, 29999},  Desc = --[[!AUTO_522]]"高手", Icon = 11240, Weight = 15 },
					{ Range = {30000, 39999},  Desc = --[[!AUTO_523]]"奇才", Icon = 11241, Weight = 25 },
					{ Range = {40000, 999999},  Desc = --[[!AUTO_524]]"武神", Icon = 11242, Weight = 40 },
				}
			},

			{
				Desc = --[[!AUTO_525]]"過關時間",
				Unit = SpecialUnit.TIME,
				Arg  = 11, 		--副本过关时间为11号参数
				Baddish =
				{
					{ Range = {3000,9999}, Desc = --[[!AUTO_526]]"慢速", Icon = 11231, Weight = 0 },
					{ Range = {2400,2999}, Desc = --[[!AUTO_527]]"平速", Icon = 11232, Weight = 10 },
					{ Range = {2100,2399},  Desc = --[[!AUTO_528]]"飛速", Icon = 11233, Weight = 20 },
					{ Range = {0, 2099},  Desc = --[[!AUTO_529]]"神速", Icon = 11234, Weight = 30},
				}
			},

			{
				Desc = --[[!AUTO_530]]"重傷次數",
				Unit = --[[!AUTO_531]]"次",
				Arg  = 8, 		--副本内玩家死亡次数为8号参数
				Baddish =
				{
					{ Range = {5, 99999},  Desc = --[[!AUTO_532]]"慘敗", Icon = 11239, Weight = 0 },
					{ Range = {3, 4},  Desc = --[[!AUTO_533]]"重傷", Icon = 11240, Weight = 10 },
					{ Range = {1, 2},  Desc = --[[!AUTO_534]]"輕傷", Icon = 11241, Weight = 20 },
					{ Range = {0, 0},  Desc = --[[!AUTO_535]]"無損", Icon = 11242, Weight = 30},
				}
			},

		},


		AddDrawMoney = 11827,				--2次抽奖消耗金钱，优先绑定币，不足则交易币补齐

		AddDrawLottery = 72450,				--2次抽奖的彩票ID72450

                TeamExp = EctypeScore.TeamExpNormal,		--组队经验加成，经验基数为副本内玩家杀怪获得的总经验，分别是组队人数1-6人对应的加成比例
                Award = 						--评价得分的奖励，range为以上所有评价条件的总权重之和所处的数值区间。lottery为获得的彩票ID，exp为评价经验加成，基数为副本内玩家杀怪获得的总经验
		{
                        { Range = {0,  29}, Lottery = 63027, Exp = EctypeScore.GradeExpNormal[1] },
                        { Range = {30, 59}, Lottery = 63027, Exp = EctypeScore.GradeExpNormal[2] },
                        { Range = {60, 79}, Lottery = 63027, Exp = EctypeScore.GradeExpNormal[3] },
                        { Range = {80, 100}, Lottery = 63027, Exp = EctypeScore.GradeExpNormal[4] },
                },
	},

	[3] = 				--模式3的评价
	{
		ScoreCond =
		{
			{
				Desc = --[[!AUTO_536]]"戰鬥分數",	--评价条件名
				Unit = --[[!AUTO_537]]"分",		--评价条件的单位
				Arg  = 9,		--战斗分数为9号参数
				Baddish =		--从上到下分别为B\A\S\SS,range为参数数值区间，desc为界面悬浮文字（新版界面无效？），icon为图标（新版界面无效？），weight为对应数值区间的权重
				{
					{ Range = {0, 24999},  Desc = --[[!AUTO_538]]"醬油", Icon = 11239, Weight = 0},
					{ Range = {25000, 29999},  Desc = --[[!AUTO_539]]"高手", Icon = 11240, Weight = 15 },
					{ Range = {30000, 39999},  Desc = --[[!AUTO_540]]"奇才", Icon = 11241, Weight = 25 },
					{ Range = {40000, 999999},  Desc = --[[!AUTO_541]]"武神", Icon = 11242, Weight = 40 },
				}
			},

			{
				Desc = --[[!AUTO_542]]"過關時間",
				Unit = SpecialUnit.TIME,
				Arg  = 11, 		--副本过关时间为11号参数
				Baddish =
				{
					{ Range = {3000,9999}, Desc = --[[!AUTO_543]]"慢速", Icon = 11231, Weight = 0 },
					{ Range = {2400,2999}, Desc = --[[!AUTO_544]]"平速", Icon = 11232, Weight = 10 },
					{ Range = {2100,2399},  Desc = --[[!AUTO_545]]"飛速", Icon = 11233, Weight = 20 },
					{ Range = {0, 2099},  Desc = --[[!AUTO_546]]"神速", Icon = 11234, Weight = 30},
				}
			},

			{
				Desc = --[[!AUTO_547]]"重傷次數",
				Unit = --[[!AUTO_548]]"次",
				Arg  = 8, 		--副本内玩家死亡次数为8号参数
				Baddish =
				{
					{ Range = {5, 99999},  Desc = --[[!AUTO_549]]"慘敗", Icon = 11239, Weight = 0 },
					{ Range = {3, 4},  Desc = --[[!AUTO_550]]"重傷", Icon = 11240, Weight = 10 },
					{ Range = {1, 2},  Desc = --[[!AUTO_551]]"輕傷", Icon = 11241, Weight = 20 },
					{ Range = {0, 0},  Desc = --[[!AUTO_552]]"無損", Icon = 11242, Weight = 30},
				}
			},

		},

		AddDrawMoney = 13798,				--2次抽奖消耗金钱，优先绑定币，不足则交易币补齐

		AddDrawLottery = 72451,				--2次抽奖的彩票ID72451

                TeamExp = EctypeScore.TeamExpNormal,		--组队经验加成，经验基数为副本内玩家杀怪获得的总经验，分别是组队人数1-6人对应的加成比例
                Award = 						--评价得分的奖励，range为以上所有评价条件的总权重之和所处的数值区间。lottery为获得的彩票ID，exp为评价经验加成，基数为副本内玩家杀怪获得的总经验
		{
                        { Range = {0,  29}, Lottery = 63031, Exp = EctypeScore.GradeExpNormal[1] },
                        { Range = {30, 59}, Lottery = 63031, Exp = EctypeScore.GradeExpNormal[2] },
                        { Range = {60, 79}, Lottery = 63031, Exp = EctypeScore.GradeExpNormal[3] },
                        { Range = {80, 100}, Lottery = 63031, Exp = EctypeScore.GradeExpNormal[4] },
                },
	},

	[4] = 				--模式4的评价
	{
		ScoreCond =
		{
			{
				Desc = "戰鬥分數",	--评价条件名
				Unit = "分",		--评价条件的单位
				Arg  = 9,		--战斗分数为9号参数
				Baddish =		--从上到下分别为B\A\S\SS,range为参数数值区间，desc为界面悬浮文字（新版界面无效？），icon为图标（新版界面无效？），weight为对应数值区间的权重
				{
					{ Range = {0, 24999},  Desc = "醬油", Icon = 11239, Weight = 0},
					{ Range = {25000, 29999},  Desc = "高手", Icon = 11240, Weight = 15 },
					{ Range = {30000, 39999},  Desc = "奇才", Icon = 11241, Weight = 25 },
					{ Range = {40000, 999999},  Desc = "武神", Icon = 11242, Weight = 40 },
				}
			},

			{
				Desc = "過關時間",
				Unit = SpecialUnit.TIME,
				Arg  = 11, 		--副本过关时间为11号参数
				Baddish =
				{
					{ Range = {3000,9999}, Desc = "慢速", Icon = 11231, Weight = 0 },
					{ Range = {2400,2999}, Desc = "平速", Icon = 11232, Weight = 10 },
					{ Range = {2100,2399},  Desc = "飛速", Icon = 11233, Weight = 20 },
					{ Range = {0, 2099},  Desc = "神速", Icon = 11234, Weight = 30},
				}
			},

			{
				Desc = "重傷次數",
				Unit = "次",
				Arg  = 8, 		--副本内玩家死亡次数为8号参数
				Baddish =
				{
					{ Range = {5, 99999},  Desc = "慘敗", Icon = 11239, Weight = 0 },
					{ Range = {3, 4},  Desc = "重傷", Icon = 11240, Weight = 10 },
					{ Range = {1, 2},  Desc = "輕傷", Icon = 11241, Weight = 20 },
					{ Range = {0, 0},  Desc = "無損", Icon = 11242, Weight = 30},
				}
			},

		},

		AddDrawMoney = 19712,				--2次抽奖消耗金钱，优先绑定币，不足则交易币补齐

		AddDrawLottery = 82457,				--2次抽奖的彩票ID

                TeamExp = EctypeScore.TeamExpNormal,		--组队经验加成，经验基数为副本内玩家杀怪获得的总经验，分别是组队人数1-6人对应的加成比例
                Award = 						--评价得分的奖励，range为以上所有评价条件的总权重之和所处的数值区间。lottery为获得的彩票ID，exp为评价经验加成，基数为副本内玩家杀怪获得的总经验
		{
                        { Range = {0,  29}, Lottery = 82456, Exp = EctypeScore.GradeExpNormal[1] },
                        { Range = {30, 59}, Lottery = 82456, Exp = EctypeScore.GradeExpNormal[2] },
                        { Range = {60, 79}, Lottery = 82456, Exp = EctypeScore.GradeExpNormal[3] },
                        { Range = {80, 100}, Lottery = 82456, Exp = EctypeScore.GradeExpNormal[4] },
                },
	},

}


----梅庄外围

EctypeScore.Cfg[2638] =			--填写副本ID
{
	[1] = 				--模式1的评价
	{
		ScoreCond =
		{
			{
				Desc = --[[!AUTO_553]]"戰鬥分數",	--评价条件名
				Unit = --[[!AUTO_554]]"分",		--评价条件的单位
				Arg  = 9,		--战斗分数为9号参数
				Baddish =		--从上到下分别为B\A\S\SS,range为参数数值区间，desc为界面悬浮文字（新版界面无效？），icon为图标（新版界面无效？），weight为对应数值区间的权重
				{
					{ Range = {0, 24999},  Desc = --[[!AUTO_555]]"醬油", Icon = 11239, Weight = 0},
					{ Range = {25000, 29999},  Desc = --[[!AUTO_556]]"高手", Icon = 11240, Weight = 15 },
					{ Range = {30000, 39999},  Desc = --[[!AUTO_557]]"奇才", Icon = 11241, Weight = 25 },
					{ Range = {40000, 999999},  Desc = --[[!AUTO_558]]"武神", Icon = 11242, Weight = 40 },
				}
			},

			{
				Desc = --[[!AUTO_559]]"過關時間",
				Unit = SpecialUnit.TIME,
				Arg  = 11, 		--副本过关时间为11号参数
				Baddish =
				{
					{ Range = {1800,9999}, Desc = --[[!AUTO_560]]"慢速", Icon = 11231, Weight = 0 },
					{ Range = {1500,1799}, Desc = --[[!AUTO_561]]"平速", Icon = 11232, Weight = 10 },
					{ Range = {1200,1499},  Desc = --[[!AUTO_562]]"飛速", Icon = 11233, Weight = 20 },
					{ Range = {0, 1199},  Desc = --[[!AUTO_563]]"神速", Icon = 11234, Weight = 30},
				}
			},

			{
				Desc = --[[!AUTO_564]]"重傷次數",
				Unit = --[[!AUTO_565]]"次",
				Arg  = 8, 		--副本内玩家死亡次数为8号参数
				Baddish =
				{
					{ Range = {5, 99999},  Desc = --[[!AUTO_566]]"慘敗", Icon = 11239, Weight = 0 },
					{ Range = {3, 4},  Desc = --[[!AUTO_567]]"重傷", Icon = 11240, Weight = 10 },
					{ Range = {1, 2},  Desc = --[[!AUTO_568]]"輕傷", Icon = 11241, Weight = 20 },
					{ Range = {0, 0},  Desc = --[[!AUTO_569]]"無損", Icon = 11242, Weight = 30},
				}
			},

		},


		AddDrawMoney = 7680,				--2次抽奖消耗金钱，优先绑定币，不足则交易币补齐

		AddDrawLottery = 72452,				--2次抽奖的彩票ID72452

                TeamExp = EctypeScore.TeamExpNormal,		--组队经验加成，经验基数为副本内玩家杀怪获得的总经验，分别是组队人数1-6人对应的加成比例
                Award = 						--评价得分的奖励，range为以上所有评价条件的总权重之和所处的数值区间。lottery为获得的彩票ID，exp为评价经验加成，基数为副本内玩家杀怪获得的总经验
                {
                        { Range = {0,  29}, Lottery = 63770, Exp = EctypeScore.GradeExpNormal[1] },
                        { Range = {30, 59}, Lottery = 63770, Exp = EctypeScore.GradeExpNormal[2] },
                        { Range = {60, 79}, Lottery = 63770, Exp = EctypeScore.GradeExpNormal[3] },
                        { Range = {80, 100}, Lottery = 63770, Exp = EctypeScore.GradeExpNormal[4] },
                },
	},

	[2] =  				--模式2的评价
	{
		ScoreCond =
		{
			{
				Desc = --[[!AUTO_570]]"戰鬥分數",	--评价条件名
				Unit = --[[!AUTO_571]]"分",		--评价条件的单位
				Arg  = 9,		--战斗分数为9号参数
				Baddish =		--从上到下分别为B\A\S\SS,range为参数数值区间，desc为界面悬浮文字（新版界面无效？），icon为图标（新版界面无效？），weight为对应数值区间的权重
				{
					{ Range = {0, 24999},  Desc = --[[!AUTO_572]]"醬油", Icon = 11239, Weight = 0},
					{ Range = {25000, 29999},  Desc = --[[!AUTO_573]]"高手", Icon = 11240, Weight = 15 },
					{ Range = {30000, 39999},  Desc = --[[!AUTO_574]]"奇才", Icon = 11241, Weight = 25 },
					{ Range = {40000, 999999},  Desc = --[[!AUTO_575]]"武神", Icon = 11242, Weight = 40 },
				}
			},

			{
				Desc = --[[!AUTO_576]]"過關時間",
				Unit = SpecialUnit.TIME,
				Arg  = 11, 		--副本过关时间为11号参数
				Baddish =
				{
					{ Range = {1800,9999}, Desc = --[[!AUTO_577]]"慢速", Icon = 11231, Weight = 0 },
					{ Range = {1500,1799}, Desc = --[[!AUTO_578]]"平速", Icon = 11232, Weight = 10 },
					{ Range = {1200,1499},  Desc = --[[!AUTO_579]]"飛速", Icon = 11233, Weight = 20 },
					{ Range = {0, 1199},  Desc = --[[!AUTO_580]]"神速", Icon = 11234, Weight = 30},
				}
			},

			{
				Desc = --[[!AUTO_581]]"重傷次數",
				Unit = --[[!AUTO_582]]"次",
				Arg  = 8, 		--副本内玩家死亡次数为8号参数
				Baddish =
				{
					{ Range = {5, 99999},  Desc = --[[!AUTO_583]]"慘敗", Icon = 11239, Weight = 0 },
					{ Range = {3, 4},  Desc = --[[!AUTO_584]]"重傷", Icon = 11240, Weight = 10 },
					{ Range = {1, 2},  Desc = --[[!AUTO_585]]"輕傷", Icon = 11241, Weight = 20 },
					{ Range = {0, 0},  Desc = --[[!AUTO_586]]"無損", Icon = 11242, Weight = 30},
				}
			},

		},
		AddDrawMoney = 9216,				--2次抽奖消耗金钱，优先绑定币，不足则交易币补齐

		AddDrawLottery = 72453,				--2次抽奖的彩票ID72453

		TeamExp = EctypeScore.TeamExpNormal,		--组队经验加成，经验基数为副本内玩家杀怪获得的总经验，分别是组队人数1-6人对应的加成比例
                Award = 						--评价得分的奖励，range为以上所有评价条件的总权重之和所处的数值区间。lottery为获得的彩票ID，exp为评价经验加成，基数为副本内玩家杀怪获得的总经验
                {
                        { Range = {0,  29}, Lottery = 63774, Exp = EctypeScore.GradeExpNormal[1] },
                        { Range = {30, 59}, Lottery = 63774, Exp = EctypeScore.GradeExpNormal[2] },
                        { Range = {60, 79}, Lottery = 63774, Exp = EctypeScore.GradeExpNormal[3] },
                        { Range = {80, 100}, Lottery = 63774, Exp = EctypeScore.GradeExpNormal[4] },
                },
	},

	[3] = 				--模式3的评价
	{
		ScoreCond =
		{
			{
				Desc = --[[!AUTO_587]]"戰鬥分數",	--评价条件名
				Unit = --[[!AUTO_588]]"分",		--评价条件的单位
				Arg  = 9,		--战斗分数为9号参数
				Baddish =		--从上到下分别为B\A\S\SS,range为参数数值区间，desc为界面悬浮文字（新版界面无效？），icon为图标（新版界面无效？），weight为对应数值区间的权重
				{
					{ Range = {0, 24999},  Desc = --[[!AUTO_589]]"醬油", Icon = 11239, Weight = 0},
					{ Range = {25000, 29999},  Desc = --[[!AUTO_590]]"高手", Icon = 11240, Weight = 15 },
					{ Range = {30000, 39999},  Desc = --[[!AUTO_591]]"奇才", Icon = 11241, Weight = 25 },
					{ Range = {40000, 999999},  Desc = --[[!AUTO_592]]"武神", Icon = 11242, Weight = 40 },
				}
			},

			{
				Desc = --[[!AUTO_593]]"過關時間",
				Unit = SpecialUnit.TIME,
				Arg  = 11, 		--副本过关时间为11号参数
				Baddish =
				{
					{ Range = {1800,9999}, Desc = --[[!AUTO_594]]"慢速", Icon = 11231, Weight = 0 },
					{ Range = {1500,1799}, Desc = --[[!AUTO_595]]"平速", Icon = 11232, Weight = 10 },
					{ Range = {1200,1499},  Desc = --[[!AUTO_596]]"飛速", Icon = 11233, Weight = 20 },
					{ Range = {0, 1199},  Desc = --[[!AUTO_597]]"神速", Icon = 11234, Weight = 30},
				}
			},

			{
				Desc = --[[!AUTO_598]]"重傷次數",
				Unit = --[[!AUTO_599]]"次",
				Arg  = 8, 		--副本内玩家死亡次数为8号参数
				Baddish =
				{
					{ Range = {5, 99999},  Desc = --[[!AUTO_600]]"慘敗", Icon = 11239, Weight = 0 },
					{ Range = {3, 4},  Desc = --[[!AUTO_601]]"重傷", Icon = 11240, Weight = 10 },
					{ Range = {1, 2},  Desc = --[[!AUTO_602]]"輕傷", Icon = 11241, Weight = 20 },
					{ Range = {0, 0},  Desc = --[[!AUTO_603]]"無損", Icon = 11242, Weight = 30},
				}
			},

		},

		AddDrawMoney = 10752,				--2次抽奖消耗金钱，优先绑定币，不足则交易币补齐

		AddDrawLottery = 72454,				--2次抽奖的彩票ID72454

                TeamExp = EctypeScore.TeamExpNormal,		--组队经验加成，经验基数为副本内玩家杀怪获得的总经验，分别是组队人数1-6人对应的加成比例
                Award = 						--评价得分的奖励，range为以上所有评价条件的总权重之和所处的数值区间。lottery为获得的彩票ID，exp为评价经验加成，基数为副本内玩家杀怪获得的总经验
                {
                        { Range = {0,  29}, Lottery = 63779, Exp = EctypeScore.GradeExpNormal[1] },
                        { Range = {30, 59}, Lottery = 63779, Exp = EctypeScore.GradeExpNormal[2] },
                        { Range = {60, 79}, Lottery = 63779, Exp = EctypeScore.GradeExpNormal[3] },
                        { Range = {80, 100}, Lottery = 63779, Exp = EctypeScore.GradeExpNormal[4] },
                },
	},

	[4] = 				--模式4的评价
	{
		ScoreCond =
		{
			{
				Desc = "戰鬥分數",	--评价条件名
				Unit = "分",		--评价条件的单位
				Arg  = 9,		--战斗分数为9号参数
				Baddish =		--从上到下分别为B\A\S\SS,range为参数数值区间，desc为界面悬浮文字（新版界面无效？），icon为图标（新版界面无效？），weight为对应数值区间的权重
				{
					{ Range = {0, 24999},  Desc = "醬油", Icon = 11239, Weight = 0},
					{ Range = {25000, 29999},  Desc = "高手", Icon = 11240, Weight = 15 },
					{ Range = {30000, 39999},  Desc = "奇才", Icon = 11241, Weight = 25 },
					{ Range = {40000, 999999},  Desc = "武神", Icon = 11242, Weight = 40 },
				}
			},

			{
				Desc = "過關時間",
				Unit = SpecialUnit.TIME,
				Arg  = 11, 		--副本过关时间为11号参数
				Baddish =
				{
					{ Range = {1800,9999}, Desc = "慢速", Icon = 11231, Weight = 0 },
					{ Range = {1500,1799}, Desc = "平速", Icon = 11232, Weight = 10 },
					{ Range = {1200,1499},  Desc = "飛速", Icon = 11233, Weight = 20 },
					{ Range = {0, 1199},  Desc = "神速", Icon = 11234, Weight = 30},
				}
			},

			{
				Desc = "重傷次數",
				Unit = "次",
				Arg  = 8, 		--副本内玩家死亡次数为8号参数
				Baddish =
				{
					{ Range = {5, 99999},  Desc = "慘敗", Icon = 11239, Weight = 0 },
					{ Range = {3, 4},  Desc = "重傷", Icon = 11240, Weight = 10 },
					{ Range = {1, 2},  Desc = "輕傷", Icon = 11241, Weight = 20 },
					{ Range = {0, 0},  Desc = "無損", Icon = 11242, Weight = 30},
				}
			},

		},

		AddDrawMoney = 15360,				--2次抽奖消耗金钱，优先绑定币，不足则交易币补齐

		AddDrawLottery = 82459,				--2次抽奖的彩票ID

                TeamExp = EctypeScore.TeamExpNormal,		--组队经验加成，经验基数为副本内玩家杀怪获得的总经验，分别是组队人数1-6人对应的加成比例
                Award = 						--评价得分的奖励，range为以上所有评价条件的总权重之和所处的数值区间。lottery为获得的彩票ID，exp为评价经验加成，基数为副本内玩家杀怪获得的总经验
                {
                        { Range = {0,  29}, Lottery = 82458, Exp = EctypeScore.GradeExpNormal[1] },
                        { Range = {30, 59}, Lottery = 82458, Exp = EctypeScore.GradeExpNormal[2] },
                        { Range = {60, 79}, Lottery = 82458, Exp = EctypeScore.GradeExpNormal[3] },
                        { Range = {80, 100}, Lottery = 82458, Exp = EctypeScore.GradeExpNormal[4] },
                },
	},

}





----梅庄地牢

EctypeScore.Cfg[3046] =			--填写副本ID
{
	[1] = 				--模式1的评价
	{
		ScoreCond =
		{
			{
				Desc = --[[!AUTO_604]]"戰鬥分數",	--评价条件名
				Unit = --[[!AUTO_605]]"分",		--评价条件的单位
				Arg  = 9,		--战斗分数为9号参数
				Baddish =		--从上到下分别为B\A\S\SS,range为参数数值区间，desc为界面悬浮文字（新版界面无效？），icon为图标（新版界面无效？），weight为对应数值区间的权重
				{
					{ Range = {0, 24999},  Desc = --[[!AUTO_606]]"醬油", Icon = 11239, Weight = 0},
					{ Range = {25000, 29999},  Desc = --[[!AUTO_607]]"高手", Icon = 11240, Weight = 15 },
					{ Range = {30000, 39999},  Desc = --[[!AUTO_608]]"奇才", Icon = 11241, Weight = 25 },
					{ Range = {40000, 999999},  Desc = --[[!AUTO_609]]"武神", Icon = 11242, Weight = 40 },
				}
			},

			{
				Desc = --[[!AUTO_610]]"過關時間",
				Unit = SpecialUnit.TIME,
				Arg  = 11, 		--副本过关时间为11号参数
				Baddish =
				{
					{ Range = {3000,9999}, Desc = --[[!AUTO_611]]"慢速", Icon = 11231, Weight = 0 },
					{ Range = {2400,2999}, Desc = --[[!AUTO_612]]"平速", Icon = 11232, Weight = 10 },
					{ Range = {2100,2399},  Desc = --[[!AUTO_613]]"飛速", Icon = 11233, Weight = 20 },
					{ Range = {0, 2099},  Desc = --[[!AUTO_614]]"神速", Icon = 11234, Weight = 30},
				}
			},

			{
				Desc = --[[!AUTO_615]]"重傷次數",
				Unit = --[[!AUTO_616]]"次",
				Arg  = 8, 		--副本内玩家死亡次数为8号参数
				Baddish =
				{
					{ Range = {5, 99999},  Desc = --[[!AUTO_617]]"慘敗", Icon = 11239, Weight = 0 },
					{ Range = {3, 4},  Desc = --[[!AUTO_618]]"重傷", Icon = 11240, Weight = 10 },
					{ Range = {1, 2},  Desc = --[[!AUTO_619]]"輕傷", Icon = 11241, Weight = 20 },
					{ Range = {0, 0},  Desc = --[[!AUTO_620]]"無損", Icon = 11242, Weight = 30},
				}
			},

		},

		AddDrawMoney = 10624,				--2次抽奖消耗金钱，优先绑定币，不足则交易币补齐

		AddDrawLottery = 72458,				--2次抽奖的彩票ID72441

		TeamExp = EctypeScore.TeamExpNormal,		--组队经验加成，经验基数为副本内玩家杀怪获得的总经验，分别是组队人数1-6人对应的加成比例
                Award = 						--评价得分的奖励，range为以上所有评价条件的总权重之和所处的数值区间。lottery为获得的彩票ID，exp为评价经验加成，基数为副本内玩家杀怪获得的总经验
                {
                        { Range = {0,  29}, Lottery = 79005, Exp = EctypeScore.GradeExpNormal[1] },
                        { Range = {30, 59}, Lottery = 79005, Exp = EctypeScore.GradeExpNormal[2] },
                        { Range = {60, 79}, Lottery = 79005, Exp = EctypeScore.GradeExpNormal[3] },
                        { Range = {80, 100}, Lottery = 79005, Exp = EctypeScore.GradeExpNormal[4] },
                },
	},

	[2] = 				--模式2的评价
	{
		ScoreCond =
		{
			{
				Desc = --[[!AUTO_621]]"戰鬥分數",	--评价条件名
				Unit = --[[!AUTO_622]]"分",		--评价条件的单位
				Arg  = 9,		--战斗分数为9号参数
				Baddish =		--从上到下分别为B\A\S\SS,range为参数数值区间，desc为界面悬浮文字（新版界面无效？），icon为图标（新版界面无效？），weight为对应数值区间的权重
				{
					{ Range = {0, 24999},  Desc = --[[!AUTO_623]]"醬油", Icon = 11239, Weight = 0},
					{ Range = {25000, 29999},  Desc = --[[!AUTO_624]]"高手", Icon = 11240, Weight = 15 },
					{ Range = {30000, 39999},  Desc = --[[!AUTO_625]]"奇才", Icon = 11241, Weight = 25 },
					{ Range = {40000, 999999},  Desc = --[[!AUTO_626]]"武神", Icon = 11242, Weight = 40 },
				}
			},

			{
				Desc = --[[!AUTO_627]]"過關時間",
				Unit = SpecialUnit.TIME,
				Arg  = 11, 		--副本过关时间为11号参数
				Baddish =
				{
					{ Range = {3000,9999}, Desc = --[[!AUTO_628]]"慢速", Icon = 11231, Weight = 0 },
					{ Range = {2400,2999}, Desc = --[[!AUTO_629]]"平速", Icon = 11232, Weight = 10 },
					{ Range = {2100,2399},  Desc = --[[!AUTO_630]]"飛速", Icon = 11233, Weight = 20 },
					{ Range = {0, 2099},  Desc = --[[!AUTO_631]]"神速", Icon = 11234, Weight = 30},
				}
			},

			{
				Desc = --[[!AUTO_632]]"重傷次數",
				Unit = --[[!AUTO_633]]"次",
				Arg  = 8, 		--副本内玩家死亡次数为8号参数
				Baddish =
				{
					{ Range = {5, 99999},  Desc = --[[!AUTO_634]]"慘敗", Icon = 11239, Weight = 0 },
					{ Range = {3, 4},  Desc = --[[!AUTO_635]]"重傷", Icon = 11240, Weight = 10 },
					{ Range = {1, 2},  Desc = --[[!AUTO_636]]"輕傷", Icon = 11241, Weight = 20 },
					{ Range = {0, 0},  Desc = --[[!AUTO_637]]"無損", Icon = 11242, Weight = 30},
				}
			},

		},

		AddDrawMoney = 12749,				--2次抽奖消耗金钱，优先绑定币，不足则交易币补齐

		AddDrawLottery = 72459,				--2次抽奖的彩票ID72441

                TeamExp = EctypeScore.TeamExpNormal,		--组队经验加成，经验基数为副本内玩家杀怪获得的总经验，分别是组队人数1-6人对应的加成比例
                Award = 						--评价得分的奖励，range为以上所有评价条件的总权重之和所处的数值区间。lottery为获得的彩票ID，exp为评价经验加成，基数为副本内玩家杀怪获得的总经验
                {
                        { Range = {0,  29}, Lottery = 79006, Exp = EctypeScore.GradeExpNormal[1] },
                        { Range = {30, 59}, Lottery = 79006, Exp = EctypeScore.GradeExpNormal[2] },
                        { Range = {60, 79}, Lottery = 79006, Exp = EctypeScore.GradeExpNormal[3] },
                        { Range = {80, 100}, Lottery = 79006, Exp = EctypeScore.GradeExpNormal[4] },
                },
	},

	[3] = 				--模式3的评价
	{
		ScoreCond =
		{
			{
				Desc = --[[!AUTO_638]]"戰鬥分數",	--评价条件名
				Unit = --[[!AUTO_639]]"分",		--评价条件的单位
				Arg  = 9,		--战斗分数为9号参数
				Baddish =		--从上到下分别为B\A\S\SS,range为参数数值区间，desc为界面悬浮文字（新版界面无效？），icon为图标（新版界面无效？），weight为对应数值区间的权重
				{
					{ Range = {0, 24999},  Desc = --[[!AUTO_640]]"醬油", Icon = 11239, Weight = 0},
					{ Range = {25000, 29999},  Desc = --[[!AUTO_641]]"高手", Icon = 11240, Weight = 15 },
					{ Range = {30000, 39999},  Desc = --[[!AUTO_642]]"奇才", Icon = 11241, Weight = 25 },
					{ Range = {40000, 999999},  Desc = --[[!AUTO_643]]"武神", Icon = 11242, Weight = 40 },
				}
			},

			{
				Desc = --[[!AUTO_644]]"過關時間",
				Unit = SpecialUnit.TIME,
				Arg  = 11, 		--副本过关时间为11号参数
				Baddish =
				{
					{ Range = {3000,9999}, Desc = --[[!AUTO_645]]"慢速", Icon = 11231, Weight = 0 },
					{ Range = {2400,2999}, Desc = --[[!AUTO_646]]"平速", Icon = 11232, Weight = 10 },
					{ Range = {2100,2399},  Desc = --[[!AUTO_647]]"飛速", Icon = 11233, Weight = 20 },
					{ Range = {0, 2099},  Desc = --[[!AUTO_648]]"神速", Icon = 11234, Weight = 30},
				}
			},

			{
				Desc = --[[!AUTO_649]]"重傷次數",
				Unit = --[[!AUTO_650]]"次",
				Arg  = 8, 		--副本内玩家死亡次数为8号参数
				Baddish =
				{
					{ Range = {5, 99999},  Desc = --[[!AUTO_651]]"慘敗", Icon = 11239, Weight = 0 },
					{ Range = {3, 4},  Desc = --[[!AUTO_652]]"重傷", Icon = 11240, Weight = 10 },
					{ Range = {1, 2},  Desc = --[[!AUTO_653]]"輕傷", Icon = 11241, Weight = 20 },
					{ Range = {0, 0},  Desc = --[[!AUTO_654]]"無損", Icon = 11242, Weight = 30},
				}
			},

		},

		AddDrawMoney = 14874,				--2次抽奖消耗金钱，优先绑定币，不足则交易币补齐

		AddDrawLottery = 72460,				--2次抽奖的彩票ID72441

                TeamExp = EctypeScore.TeamExpNormal,		--组队经验加成，经验基数为副本内玩家杀怪获得的总经验，分别是组队人数1-6人对应的加成比例
                Award = 						--评价得分的奖励，range为以上所有评价条件的总权重之和所处的数值区间。lottery为获得的彩票ID，exp为评价经验加成，基数为副本内玩家杀怪获得的总经验
                {
                        { Range = {0,  29}, Lottery = 79007, Exp = EctypeScore.GradeExpNormal[1] },
                        { Range = {30, 59}, Lottery = 79007, Exp = EctypeScore.GradeExpNormal[2] },
                        { Range = {60, 79}, Lottery = 79007, Exp = EctypeScore.GradeExpNormal[3] },
                        { Range = {80, 100}, Lottery = 79007, Exp = EctypeScore.GradeExpNormal[4] },
                },
	},

	[4] = 				--模式4的评价
	{
		ScoreCond =
		{
			{
				Desc = "戰鬥分數",	--评价条件名
				Unit = "分",		--评价条件的单位
				Arg  = 9,		--战斗分数为9号参数
				Baddish =		--从上到下分别为B\A\S\SS,range为参数数值区间，desc为界面悬浮文字（新版界面无效？），icon为图标（新版界面无效？），weight为对应数值区间的权重
				{
					{ Range = {0, 24999},  Desc = "醬油", Icon = 11239, Weight = 0},
					{ Range = {25000, 29999},  Desc = "高手", Icon = 11240, Weight = 15 },
					{ Range = {30000, 39999},  Desc = "奇才", Icon = 11241, Weight = 25 },
					{ Range = {40000, 999999},  Desc = "武神", Icon = 11242, Weight = 40 },
				}
			},

			{
				Desc = "過關時間",
				Unit = SpecialUnit.TIME,
				Arg  = 11, 		--副本过关时间为11号参数
				Baddish =
				{
					{ Range = {3000,9999}, Desc = "慢速", Icon = 11231, Weight = 0 },
					{ Range = {2400,2999}, Desc = "平速", Icon = 11232, Weight = 10 },
					{ Range = {2100,2399},  Desc = "飛速", Icon = 11233, Weight = 20 },
					{ Range = {0, 2099},  Desc = "神速", Icon = 11234, Weight = 30},
				}
			},

			{
				Desc = "重傷次數",
				Unit = "次",
				Arg  = 8, 		--副本内玩家死亡次数为8号参数
				Baddish =
				{
					{ Range = {5, 99999},  Desc = "慘敗", Icon = 11239, Weight = 0 },
					{ Range = {3, 4},  Desc = "重傷", Icon = 11240, Weight = 10 },
					{ Range = {1, 2},  Desc = "輕傷", Icon = 11241, Weight = 20 },
					{ Range = {0, 0},  Desc = "無損", Icon = 11242, Weight = 30},
				}
			},

		},

		AddDrawMoney = 21248,				--2次抽奖消耗金钱，优先绑定币，不足则交易币补齐

		AddDrawLottery = 82461,				--2次抽奖的彩票ID

                TeamExp = EctypeScore.TeamExpNormal,		--组队经验加成，经验基数为副本内玩家杀怪获得的总经验，分别是组队人数1-6人对应的加成比例
                Award = 						--评价得分的奖励，range为以上所有评价条件的总权重之和所处的数值区间。lottery为获得的彩票ID，exp为评价经验加成，基数为副本内玩家杀怪获得的总经验
                {
                        { Range = {0,  29}, Lottery = 82460, Exp = EctypeScore.GradeExpNormal[1] },
                        { Range = {30, 59}, Lottery = 82460, Exp = EctypeScore.GradeExpNormal[2] },
                        { Range = {60, 79}, Lottery = 82460, Exp = EctypeScore.GradeExpNormal[3] },
                        { Range = {80, 100}, Lottery = 82460, Exp = EctypeScore.GradeExpNormal[4] },
                },
	},

}

----镇嵩宝塔

EctypeScore.Cfg[3635] =			--填写副本ID
{
	[1] = 				--模式1的评价
	{
		ScoreCond =
		{
			{
				Desc = --[[!AUTO_696]]"戰鬥分數",	--评价条件名
				Unit = --[[!AUTO_697]]"分",		--评价条件的单位
				Arg  = 9,		--战斗分数为9号参数
				Baddish =		--从上到下分别为B\A\S\SS,range为参数数值区间，desc为界面悬浮文字（新版界面无效？），icon为图标（新版界面无效？），weight为对应数值区间的权重
				{
					{ Range = {0, 24999},  Desc = --[[!AUTO_698]]"醬油", Icon = 11239, Weight = 0},
					{ Range = {25000, 29999},  Desc = --[[!AUTO_699]]"高手", Icon = 11240, Weight = 15 },
					{ Range = {30000, 39999},  Desc = --[[!AUTO_700]]"奇才", Icon = 11241, Weight = 25 },
					{ Range = {40000, 999999},  Desc = --[[!AUTO_701]]"武神", Icon = 11242, Weight = 40 },
				}
			},

			{
				Desc = --[[!AUTO_702]]"過關時間",
				Unit = SpecialUnit.TIME,
				Arg  = 11, 		--副本过关时间为11号参数
				Baddish =
				{
					{ Range = {2400,9999}, Desc = --[[!AUTO_703]]"慢速", Icon = 11231, Weight = 0 },
					{ Range = {2100,2399}, Desc = --[[!AUTO_704]]"平速", Icon = 11232, Weight = 10 },
					{ Range = {1800,2099},  Desc = --[[!AUTO_705]]"飛速", Icon = 11233, Weight = 20 },
					{ Range = {0, 1799},  Desc = --[[!AUTO_706]]"神速", Icon = 11234, Weight = 30},
				}
			},

			{
				Desc = --[[!AUTO_707]]"重傷次數",
				Unit = --[[!AUTO_708]]"次",
				Arg  = 8, 		--副本内玩家死亡次数为8号参数
				Baddish =
				{
					{ Range = {5, 99999},  Desc = --[[!AUTO_709]]"慘敗", Icon = 11239, Weight = 0 },
					{ Range = {3, 4},  Desc = --[[!AUTO_710]]"重傷", Icon = 11240, Weight = 10 },
					{ Range = {1, 2},  Desc = --[[!AUTO_711]]"輕傷", Icon = 11241, Weight = 20 },
					{ Range = {0, 0},  Desc = --[[!AUTO_712]]"無損", Icon = 11242, Weight = 30},
				}
			},

		},

		AddDrawMoney = 9632,				--2次抽奖消耗金钱，优先绑定币，不足则交易币补齐

		AddDrawLottery = 80306,				--2次抽奖的彩票ID72441

		TeamExp = EctypeScore.TeamExpNormal,		--组队经验加成，经验基数为副本内玩家杀怪获得的总经验，分别是组队人数1-6人对应的加成比例
                Award = 						--评价得分的奖励，range为以上所有评价条件的总权重之和所处的数值区间。lottery为获得的彩票ID，exp为评价经验加成，基数为副本内玩家杀怪获得的总经验
                {
                        { Range = {0,  29}, Lottery = 80303, Exp = EctypeScore.GradeExpNormal[1] },
                        { Range = {30, 59}, Lottery = 80303, Exp = EctypeScore.GradeExpNormal[2] },
                        { Range = {60, 79}, Lottery = 80303, Exp = EctypeScore.GradeExpNormal[3] },
                        { Range = {80, 100}, Lottery = 80303, Exp = EctypeScore.GradeExpNormal[4] },
                },
	},

	[2] = 				--模式2的评价
	{
		ScoreCond =
		{
			{
				Desc = --[[!AUTO_713]]"戰鬥分數",	--评价条件名
				Unit = --[[!AUTO_714]]"分",		--评价条件的单位
				Arg  = 9,		--战斗分数为9号参数
				Baddish =		--从上到下分别为B\A\S\SS,range为参数数值区间，desc为界面悬浮文字（新版界面无效？），icon为图标（新版界面无效？），weight为对应数值区间的权重
				{
					{ Range = {0, 24999},  Desc = --[[!AUTO_715]]"醬油", Icon = 11239, Weight = 0},
					{ Range = {25000, 29999},  Desc = --[[!AUTO_716]]"高手", Icon = 11240, Weight = 15 },
					{ Range = {30000, 39999},  Desc = --[[!AUTO_717]]"奇才", Icon = 11241, Weight = 25 },
					{ Range = {40000, 999999},  Desc = --[[!AUTO_718]]"武神", Icon = 11242, Weight = 40 },
				}
			},

			{
				Desc = --[[!AUTO_719]]"過關時間",
				Unit = SpecialUnit.TIME,
				Arg  = 11, 		--副本过关时间为11号参数
				Baddish =
				{
					{ Range = {2400,9999}, Desc = --[[!AUTO_720]]"慢速", Icon = 11231, Weight = 0 },
					{ Range = {2100,2399}, Desc = --[[!AUTO_721]]"平速", Icon = 11232, Weight = 10 },
					{ Range = {1800,2099},  Desc = --[[!AUTO_722]]"飛速", Icon = 11233, Weight = 20 },
					{ Range = {0, 1799},  Desc = --[[!AUTO_723]]"神速", Icon = 11234, Weight = 30},
				}
			},

			{
				Desc = --[[!AUTO_724]]"重傷次數",
				Unit = --[[!AUTO_725]]"次",
				Arg  = 8, 		--副本内玩家死亡次数为8号参数
				Baddish =
				{
					{ Range = {5, 99999},  Desc = --[[!AUTO_726]]"慘敗", Icon = 11239, Weight = 0 },
					{ Range = {3, 4},  Desc = --[[!AUTO_727]]"重傷", Icon = 11240, Weight = 10 },
					{ Range = {1, 2},  Desc = --[[!AUTO_728]]"輕傷", Icon = 11241, Weight = 20 },
					{ Range = {0, 0},  Desc = --[[!AUTO_729]]"無損", Icon = 11242, Weight = 30},
				}
			},

		},

		AddDrawMoney = 11558,				--2次抽奖消耗金钱，优先绑定币，不足则交易币补齐

		AddDrawLottery = 80307,				--2次抽奖的彩票ID72441

                TeamExp = EctypeScore.TeamExpNormal,		--组队经验加成，经验基数为副本内玩家杀怪获得的总经验，分别是组队人数1-6人对应的加成比例
                Award = 						--评价得分的奖励，range为以上所有评价条件的总权重之和所处的数值区间。lottery为获得的彩票ID，exp为评价经验加成，基数为副本内玩家杀怪获得的总经验
                {
                        { Range = {0,  29}, Lottery = 80304, Exp = EctypeScore.GradeExpNormal[1] },
                        { Range = {30, 59}, Lottery = 80304, Exp = EctypeScore.GradeExpNormal[2] },
                        { Range = {60, 79}, Lottery = 80304, Exp = EctypeScore.GradeExpNormal[3] },
                        { Range = {80, 100}, Lottery = 80304, Exp = EctypeScore.GradeExpNormal[4] },
                },
	},

	[3] = 				--模式3的评价
	{
		ScoreCond =
		{
			{
				Desc = --[[!AUTO_730]]"戰鬥分數",	--评价条件名
				Unit = --[[!AUTO_731]]"分",		--评价条件的单位
				Arg  = 9,		--战斗分数为9号参数
				Baddish =		--从上到下分别为B\A\S\SS,range为参数数值区间，desc为界面悬浮文字（新版界面无效？），icon为图标（新版界面无效？），weight为对应数值区间的权重
				{
					{ Range = {0, 24999},  Desc = --[[!AUTO_732]]"醬油", Icon = 11239, Weight = 0},
					{ Range = {25000, 29999},  Desc = --[[!AUTO_733]]"高手", Icon = 11240, Weight = 15 },
					{ Range = {30000, 39999},  Desc = --[[!AUTO_734]]"奇才", Icon = 11241, Weight = 25 },
					{ Range = {40000, 999999},  Desc = --[[!AUTO_735]]"武神", Icon = 11242, Weight = 40 },
				}
			},

			{
				Desc = --[[!AUTO_736]]"過關時間",
				Unit = SpecialUnit.TIME,
				Arg  = 11, 		--副本过关时间为11号参数
				Baddish =
				{
					{ Range = {2400,9999}, Desc = --[[!AUTO_737]]"慢速", Icon = 11231, Weight = 0 },
					{ Range = {2100,2399}, Desc = --[[!AUTO_738]]"平速", Icon = 11232, Weight = 10 },
					{ Range = {1800,2099},  Desc = --[[!AUTO_739]]"飛速", Icon = 11233, Weight = 20 },
					{ Range = {0, 1799},  Desc = --[[!AUTO_740]]"神速", Icon = 11234, Weight = 30},
				}
			},

			{
				Desc = --[[!AUTO_741]]"重傷次數",
				Unit = --[[!AUTO_742]]"次",
				Arg  = 8, 		--副本内玩家死亡次数为8号参数
				Baddish =
				{
					{ Range = {5, 99999},  Desc = --[[!AUTO_743]]"慘敗", Icon = 11239, Weight = 0 },
					{ Range = {3, 4},  Desc = --[[!AUTO_744]]"重傷", Icon = 11240, Weight = 10 },
					{ Range = {1, 2},  Desc = --[[!AUTO_745]]"輕傷", Icon = 11241, Weight = 20 },
					{ Range = {0, 0},  Desc = --[[!AUTO_746]]"無損", Icon = 11242, Weight = 30},
				}
			},

		},

		AddDrawMoney = 13485,				--2次抽奖消耗金钱，优先绑定币，不足则交易币补齐

		AddDrawLottery = 80308,				--2次抽奖的彩票ID72441

                TeamExp = EctypeScore.TeamExpNormal,		--组队经验加成，经验基数为副本内玩家杀怪获得的总经验，分别是组队人数1-6人对应的加成比例
                Award = 						--评价得分的奖励，range为以上所有评价条件的总权重之和所处的数值区间。lottery为获得的彩票ID，exp为评价经验加成，基数为副本内玩家杀怪获得的总经验
                {
                        { Range = {0,  29}, Lottery = 80305, Exp = EctypeScore.GradeExpNormal[1] },
                        { Range = {30, 59}, Lottery = 80305, Exp = EctypeScore.GradeExpNormal[2] },
                        { Range = {60, 79}, Lottery = 80305, Exp = EctypeScore.GradeExpNormal[3] },
                        { Range = {80, 100}, Lottery = 80305, Exp = EctypeScore.GradeExpNormal[4] },
                },
	},

	[4] = 				--模式4的评价
	{
		ScoreCond =
		{
			{
				Desc = "戰鬥分數",	--评价条件名
				Unit = "分",		--评价条件的单位
				Arg  = 9,		--战斗分数为9号参数
				Baddish =		--从上到下分别为B\A\S\SS,range为参数数值区间，desc为界面悬浮文字（新版界面无效？），icon为图标（新版界面无效？），weight为对应数值区间的权重
				{
					{ Range = {0, 24999},  Desc = "醬油", Icon = 11239, Weight = 0},
					{ Range = {25000, 29999},  Desc = "高手", Icon = 11240, Weight = 15 },
					{ Range = {30000, 39999},  Desc = "奇才", Icon = 11241, Weight = 25 },
					{ Range = {40000, 999999},  Desc = "武神", Icon = 11242, Weight = 40 },
				}
			},

			{
				Desc = "過關時間",
				Unit = SpecialUnit.TIME,
				Arg  = 11, 		--副本过关时间为11号参数
				Baddish =
				{
					{ Range = {2400,9999}, Desc = "慢速", Icon = 11231, Weight = 0 },
					{ Range = {2100,2399}, Desc = "平速", Icon = 11232, Weight = 10 },
					{ Range = {1800,2099},  Desc = "飛速", Icon = 11233, Weight = 20 },
					{ Range = {0, 1799},  Desc = "神速", Icon = 11234, Weight = 30},
				}
			},

			{
				Desc = "重傷次數",
				Unit = "次",
				Arg  = 8, 		--副本内玩家死亡次数为8号参数
				Baddish =
				{
					{ Range = {5, 99999},  Desc = "慘敗", Icon = 11239, Weight = 0 },
					{ Range = {3, 4},  Desc = "重傷", Icon = 11240, Weight = 10 },
					{ Range = {1, 2},  Desc = "輕傷", Icon = 11241, Weight = 20 },
					{ Range = {0, 0},  Desc = "無損", Icon = 11242, Weight = 30},
				}
			},

		},

		AddDrawMoney = 19264,				--2次抽奖消耗金钱，优先绑定币，不足则交易币补齐

		AddDrawLottery = 82463,				--2次抽奖的彩票ID72441

                TeamExp = EctypeScore.TeamExpNormal,		--组队经验加成，经验基数为副本内玩家杀怪获得的总经验，分别是组队人数1-6人对应的加成比例
                Award = 						--评价得分的奖励，range为以上所有评价条件的总权重之和所处的数值区间。lottery为获得的彩票ID，exp为评价经验加成，基数为副本内玩家杀怪获得的总经验
                {
                        { Range = {0,  29}, Lottery = 82462, Exp = EctypeScore.GradeExpNormal[1] },
                        { Range = {30, 59}, Lottery = 82462, Exp = EctypeScore.GradeExpNormal[2] },
                        { Range = {60, 79}, Lottery = 82462, Exp = EctypeScore.GradeExpNormal[3] },
                        { Range = {80, 100}, Lottery = 82462, Exp = EctypeScore.GradeExpNormal[4] },
                },
	},

}

----嵩山之巅

EctypeScore.Cfg[6981] =			--填写副本ID
{
	[1] = 				--模式1的评价
	{
		ScoreCond =
		{
			{
				Desc = --[[!AUTO_696]]"戰鬥分數",	--评价条件名
				Unit = --[[!AUTO_697]]"分",		--评价条件的单位
				Arg  = 9,		--战斗分数为9号参数
				Baddish =		--从上到下分别为B\A\S\SS,range为参数数值区间，desc为界面悬浮文字（新版界面无效？），icon为图标（新版界面无效？），weight为对应数值区间的权重
				{
					{ Range = {0, 24999},  Desc = --[[!AUTO_698]]"醬油", Icon = 11239, Weight = 0},
					{ Range = {25000, 29999},  Desc = --[[!AUTO_699]]"高手", Icon = 11240, Weight = 15 },
					{ Range = {30000, 39999},  Desc = --[[!AUTO_700]]"奇才", Icon = 11241, Weight = 25 },
					{ Range = {40000, 999999},  Desc = --[[!AUTO_701]]"武神", Icon = 11242, Weight = 40 },
				}
			},

			{
				Desc = --[[!AUTO_702]]"過關時間",
				Unit = SpecialUnit.TIME,
				Arg  = 11, 		--副本过关时间为11号参数
				Baddish =
				{
					{ Range = {2400,9999}, Desc = --[[!AUTO_703]]"慢速", Icon = 11231, Weight = 0 },
					{ Range = {2100,2399}, Desc = --[[!AUTO_704]]"平速", Icon = 11232, Weight = 10 },
					{ Range = {1800,2099},  Desc = --[[!AUTO_705]]"飛速", Icon = 11233, Weight = 20 },
					{ Range = {0, 1799},  Desc = --[[!AUTO_706]]"神速", Icon = 11234, Weight = 30},
				}
			},

			{
				Desc = --[[!AUTO_707]]"重傷次數",
				Unit = --[[!AUTO_708]]"次",
				Arg  = 8, 		--副本内玩家死亡次数为8号参数
				Baddish =
				{
					{ Range = {5, 99999},  Desc = --[[!AUTO_709]]"慘敗", Icon = 11239, Weight = 0 },
					{ Range = {3, 4},  Desc = --[[!AUTO_710]]"重傷", Icon = 11240, Weight = 10 },
					{ Range = {1, 2},  Desc = --[[!AUTO_711]]"輕傷", Icon = 11241, Weight = 20 },
					{ Range = {0, 0},  Desc = --[[!AUTO_712]]"無損", Icon = 11242, Weight = 30},
				}
			},

		},

		AddDrawMoney = 9632,				--2次抽奖消耗金钱，优先绑定币，不足则交易币补齐

		AddDrawLottery = 80306,				--2次抽奖的彩票ID72441

		TeamExp = EctypeScore.TeamExpNormal,		--组队经验加成，经验基数为副本内玩家杀怪获得的总经验，分别是组队人数1-6人对应的加成比例
                Award = 						--评价得分的奖励，range为以上所有评价条件的总权重之和所处的数值区间。lottery为获得的彩票ID，exp为评价经验加成，基数为副本内玩家杀怪获得的总经验
                {
                        { Range = {0,  29}, Lottery = 80303, Exp = EctypeScore.GradeExpNormal[1] },
                        { Range = {30, 59}, Lottery = 80303, Exp = EctypeScore.GradeExpNormal[2] },
                        { Range = {60, 79}, Lottery = 80303, Exp = EctypeScore.GradeExpNormal[3] },
                        { Range = {80, 100}, Lottery = 80303, Exp = EctypeScore.GradeExpNormal[4] },
                },
	},

	[2] = 				--模式2的评价
	{
		ScoreCond =
		{
			{
				Desc = --[[!AUTO_713]]"戰鬥分數",	--评价条件名
				Unit = --[[!AUTO_714]]"分",		--评价条件的单位
				Arg  = 9,		--战斗分数为9号参数
				Baddish =		--从上到下分别为B\A\S\SS,range为参数数值区间，desc为界面悬浮文字（新版界面无效？），icon为图标（新版界面无效？），weight为对应数值区间的权重
				{
					{ Range = {0, 24999},  Desc = --[[!AUTO_715]]"醬油", Icon = 11239, Weight = 0},
					{ Range = {25000, 29999},  Desc = --[[!AUTO_716]]"高手", Icon = 11240, Weight = 15 },
					{ Range = {30000, 39999},  Desc = --[[!AUTO_717]]"奇才", Icon = 11241, Weight = 25 },
					{ Range = {40000, 999999},  Desc = --[[!AUTO_718]]"武神", Icon = 11242, Weight = 40 },
				}
			},

			{
				Desc = --[[!AUTO_719]]"過關時間",
				Unit = SpecialUnit.TIME,
				Arg  = 11, 		--副本过关时间为11号参数
				Baddish =
				{
					{ Range = {2400,9999}, Desc = --[[!AUTO_720]]"慢速", Icon = 11231, Weight = 0 },
					{ Range = {2100,2399}, Desc = --[[!AUTO_721]]"平速", Icon = 11232, Weight = 10 },
					{ Range = {1800,2099},  Desc = --[[!AUTO_722]]"飛速", Icon = 11233, Weight = 20 },
					{ Range = {0, 1799},  Desc = --[[!AUTO_723]]"神速", Icon = 11234, Weight = 30},
				}
			},

			{
				Desc = --[[!AUTO_724]]"重傷次數",
				Unit = --[[!AUTO_725]]"次",
				Arg  = 8, 		--副本内玩家死亡次数为8号参数
				Baddish =
				{
					{ Range = {5, 99999},  Desc = --[[!AUTO_726]]"慘敗", Icon = 11239, Weight = 0 },
					{ Range = {3, 4},  Desc = --[[!AUTO_727]]"重傷", Icon = 11240, Weight = 10 },
					{ Range = {1, 2},  Desc = --[[!AUTO_728]]"輕傷", Icon = 11241, Weight = 20 },
					{ Range = {0, 0},  Desc = --[[!AUTO_729]]"無損", Icon = 11242, Weight = 30},
				}
			},

		},

		AddDrawMoney = 11558,				--2次抽奖消耗金钱，优先绑定币，不足则交易币补齐

		AddDrawLottery = 80307,				--2次抽奖的彩票ID72441

                TeamExp = EctypeScore.TeamExpNormal,		--组队经验加成，经验基数为副本内玩家杀怪获得的总经验，分别是组队人数1-6人对应的加成比例
                Award = 						--评价得分的奖励，range为以上所有评价条件的总权重之和所处的数值区间。lottery为获得的彩票ID，exp为评价经验加成，基数为副本内玩家杀怪获得的总经验
                {
                        { Range = {0,  29}, Lottery = 80304, Exp = EctypeScore.GradeExpNormal[1] },
                        { Range = {30, 59}, Lottery = 80304, Exp = EctypeScore.GradeExpNormal[2] },
                        { Range = {60, 79}, Lottery = 80304, Exp = EctypeScore.GradeExpNormal[3] },
                        { Range = {80, 100}, Lottery = 80304, Exp = EctypeScore.GradeExpNormal[4] },
                },
	},

	[3] = 				--模式3的评价
	{
		ScoreCond =
		{
			{
				Desc = --[[!AUTO_730]]"戰鬥分數",	--评价条件名
				Unit = --[[!AUTO_731]]"分",		--评价条件的单位
				Arg  = 9,		--战斗分数为9号参数
				Baddish =		--从上到下分别为B\A\S\SS,range为参数数值区间，desc为界面悬浮文字（新版界面无效？），icon为图标（新版界面无效？），weight为对应数值区间的权重
				{
					{ Range = {0, 24999},  Desc = --[[!AUTO_732]]"醬油", Icon = 11239, Weight = 0},
					{ Range = {25000, 29999},  Desc = --[[!AUTO_733]]"高手", Icon = 11240, Weight = 15 },
					{ Range = {30000, 39999},  Desc = --[[!AUTO_734]]"奇才", Icon = 11241, Weight = 25 },
					{ Range = {40000, 999999},  Desc = --[[!AUTO_735]]"武神", Icon = 11242, Weight = 40 },
				}
			},

			{
				Desc = --[[!AUTO_736]]"過關時間",
				Unit = SpecialUnit.TIME,
				Arg  = 11, 		--副本过关时间为11号参数
				Baddish =
				{
					{ Range = {2400,9999}, Desc = --[[!AUTO_737]]"慢速", Icon = 11231, Weight = 0 },
					{ Range = {2100,2399}, Desc = --[[!AUTO_738]]"平速", Icon = 11232, Weight = 10 },
					{ Range = {1800,2099},  Desc = --[[!AUTO_739]]"飛速", Icon = 11233, Weight = 20 },
					{ Range = {0, 1799},  Desc = --[[!AUTO_740]]"神速", Icon = 11234, Weight = 30},
				}
			},

			{
				Desc = --[[!AUTO_741]]"重傷次數",
				Unit = --[[!AUTO_742]]"次",
				Arg  = 8, 		--副本内玩家死亡次数为8号参数
				Baddish =
				{
					{ Range = {5, 99999},  Desc = --[[!AUTO_743]]"慘敗", Icon = 11239, Weight = 0 },
					{ Range = {3, 4},  Desc = --[[!AUTO_744]]"重傷", Icon = 11240, Weight = 10 },
					{ Range = {1, 2},  Desc = --[[!AUTO_745]]"輕傷", Icon = 11241, Weight = 20 },
					{ Range = {0, 0},  Desc = --[[!AUTO_746]]"無損", Icon = 11242, Weight = 30},
				}
			},

		},

		AddDrawMoney = 13485,				--2次抽奖消耗金钱，优先绑定币，不足则交易币补齐

		AddDrawLottery = 80308,				--2次抽奖的彩票ID72441

                TeamExp = EctypeScore.TeamExpNormal,		--组队经验加成，经验基数为副本内玩家杀怪获得的总经验，分别是组队人数1-6人对应的加成比例
                Award = 						--评价得分的奖励，range为以上所有评价条件的总权重之和所处的数值区间。lottery为获得的彩票ID，exp为评价经验加成，基数为副本内玩家杀怪获得的总经验
                {
                        { Range = {0,  29}, Lottery = 80305, Exp = EctypeScore.GradeExpNormal[1] },
                        { Range = {30, 59}, Lottery = 80305, Exp = EctypeScore.GradeExpNormal[2] },
                        { Range = {60, 79}, Lottery = 80305, Exp = EctypeScore.GradeExpNormal[3] },
                        { Range = {80, 100}, Lottery = 80305, Exp = EctypeScore.GradeExpNormal[4] },
                },
	},

	[4] = 				--模式4的评价
	{
		ScoreCond =
		{
			{
				Desc = "戰鬥分數",	--评价条件名
				Unit = "分",		--评价条件的单位
				Arg  = 9,		--战斗分数为9号参数
				Baddish =		--从上到下分别为B\A\S\SS,range为参数数值区间，desc为界面悬浮文字（新版界面无效？），icon为图标（新版界面无效？），weight为对应数值区间的权重
				{
					{ Range = {0, 24999},  Desc = "醬油", Icon = 11239, Weight = 0},
					{ Range = {25000, 29999},  Desc = "高手", Icon = 11240, Weight = 15 },
					{ Range = {30000, 39999},  Desc = "奇才", Icon = 11241, Weight = 25 },
					{ Range = {40000, 999999},  Desc = "武神", Icon = 11242, Weight = 40 },
				}
			},

			{
				Desc = "過關時間",
				Unit = SpecialUnit.TIME,
				Arg  = 11, 		--副本过关时间为11号参数
				Baddish =
				{
					{ Range = {2400,9999}, Desc = "慢速", Icon = 11231, Weight = 0 },
					{ Range = {2100,2399}, Desc = "平速", Icon = 11232, Weight = 10 },
					{ Range = {1800,2099},  Desc = "飛速", Icon = 11233, Weight = 20 },
					{ Range = {0, 1799},  Desc = "神速", Icon = 11234, Weight = 30},
				}
			},

			{
				Desc = "重傷次數",
				Unit = "次",
				Arg  = 8, 		--副本内玩家死亡次数为8号参数
				Baddish =
				{
					{ Range = {5, 99999},  Desc = "慘敗", Icon = 11239, Weight = 0 },
					{ Range = {3, 4},  Desc = "重傷", Icon = 11240, Weight = 10 },
					{ Range = {1, 2},  Desc = "輕傷", Icon = 11241, Weight = 20 },
					{ Range = {0, 0},  Desc = "無損", Icon = 11242, Weight = 30},
				}
			},

		},

		AddDrawMoney = 19264,				--2次抽奖消耗金钱，优先绑定币，不足则交易币补齐

		AddDrawLottery = 82463,				--2次抽奖的彩票ID72441

                TeamExp = EctypeScore.TeamExpNormal,		--组队经验加成，经验基数为副本内玩家杀怪获得的总经验，分别是组队人数1-6人对应的加成比例
                Award = 						--评价得分的奖励，range为以上所有评价条件的总权重之和所处的数值区间。lottery为获得的彩票ID，exp为评价经验加成，基数为副本内玩家杀怪获得的总经验
                {
                        { Range = {0,  29}, Lottery = 82462, Exp = EctypeScore.GradeExpNormal[1] },
                        { Range = {30, 59}, Lottery = 82462, Exp = EctypeScore.GradeExpNormal[2] },
                        { Range = {60, 79}, Lottery = 82462, Exp = EctypeScore.GradeExpNormal[3] },
                        { Range = {80, 100}, Lottery = 82462, Exp = EctypeScore.GradeExpNormal[4] },
                },
	},

}

----嵩山之路

EctypeScore.Cfg[6283] =			--填写副本ID
{
	[1] = 				--模式1的评价
	{
		ScoreCond =
		{
			{
				Desc = --[[!AUTO_696]]"戰鬥分數",	--评价条件名
				Unit = --[[!AUTO_697]]"分",		--评价条件的单位
				Arg  = 9,		--战斗分数为9号参数
				Baddish =		--从上到下分别为B\A\S\SS,range为参数数值区间，desc为界面悬浮文字（新版界面无效？），icon为图标（新版界面无效？），weight为对应数值区间的权重
				{
					{ Range = {0, 24999},  Desc = --[[!AUTO_698]]"醬油", Icon = 11239, Weight = 0},
					{ Range = {25000, 29999},  Desc = --[[!AUTO_699]]"高手", Icon = 11240, Weight = 15 },
					{ Range = {30000, 39999},  Desc = --[[!AUTO_700]]"奇才", Icon = 11241, Weight = 25 },
					{ Range = {40000, 999999},  Desc = --[[!AUTO_701]]"武神", Icon = 11242, Weight = 40 },
				}
			},

			{
				Desc = --[[!AUTO_702]]"過關時間",
				Unit = SpecialUnit.TIME,
				Arg  = 11, 		--副本过关时间为11号参数
				Baddish =
				{
					{ Range = {2400,9999}, Desc = --[[!AUTO_703]]"慢速", Icon = 11231, Weight = 0 },
					{ Range = {2100,2399}, Desc = --[[!AUTO_704]]"平速", Icon = 11232, Weight = 10 },
					{ Range = {1800,2099},  Desc = --[[!AUTO_705]]"飛速", Icon = 11233, Weight = 20 },
					{ Range = {0, 1799},  Desc = --[[!AUTO_706]]"神速", Icon = 11234, Weight = 30},
				}
			},

			{
				Desc = --[[!AUTO_707]]"重傷次數",
				Unit = --[[!AUTO_708]]"次",
				Arg  = 8, 		--副本内玩家死亡次数为8号参数
				Baddish =
				{
					{ Range = {5, 99999},  Desc = --[[!AUTO_709]]"慘敗", Icon = 11239, Weight = 0 },
					{ Range = {3, 4},  Desc = --[[!AUTO_710]]"重傷", Icon = 11240, Weight = 10 },
					{ Range = {1, 2},  Desc = --[[!AUTO_711]]"輕傷", Icon = 11241, Weight = 20 },
					{ Range = {0, 0},  Desc = --[[!AUTO_712]]"無損", Icon = 11242, Weight = 30},
				}
			},

		},

		AddDrawMoney = 9632,				--2次抽奖消耗金钱，优先绑定币，不足则交易币补齐

		AddDrawLottery = 80306,				--2次抽奖的彩票ID72441

		TeamExp = EctypeScore.TeamExpNormal,		--组队经验加成，经验基数为副本内玩家杀怪获得的总经验，分别是组队人数1-6人对应的加成比例
                Award = 						--评价得分的奖励，range为以上所有评价条件的总权重之和所处的数值区间。lottery为获得的彩票ID，exp为评价经验加成，基数为副本内玩家杀怪获得的总经验
                {
                        { Range = {0,  29}, Lottery = 80303, Exp = EctypeScore.GradeExpNormal[1] },
                        { Range = {30, 59}, Lottery = 80303, Exp = EctypeScore.GradeExpNormal[2] },
                        { Range = {60, 79}, Lottery = 80303, Exp = EctypeScore.GradeExpNormal[3] },
                        { Range = {80, 100}, Lottery = 80303, Exp = EctypeScore.GradeExpNormal[4] },
                },
	},

	[2] = 				--模式2的评价
	{
		ScoreCond =
		{
			{
				Desc = --[[!AUTO_713]]"戰鬥分數",	--评价条件名
				Unit = --[[!AUTO_714]]"分",		--评价条件的单位
				Arg  = 9,		--战斗分数为9号参数
				Baddish =		--从上到下分别为B\A\S\SS,range为参数数值区间，desc为界面悬浮文字（新版界面无效？），icon为图标（新版界面无效？），weight为对应数值区间的权重
				{
					{ Range = {0, 24999},  Desc = --[[!AUTO_715]]"醬油", Icon = 11239, Weight = 0},
					{ Range = {25000, 29999},  Desc = --[[!AUTO_716]]"高手", Icon = 11240, Weight = 15 },
					{ Range = {30000, 39999},  Desc = --[[!AUTO_717]]"奇才", Icon = 11241, Weight = 25 },
					{ Range = {40000, 999999},  Desc = --[[!AUTO_718]]"武神", Icon = 11242, Weight = 40 },
				}
			},

			{
				Desc = --[[!AUTO_719]]"過關時間",
				Unit = SpecialUnit.TIME,
				Arg  = 11, 		--副本过关时间为11号参数
				Baddish =
				{
					{ Range = {2400,9999}, Desc = --[[!AUTO_720]]"慢速", Icon = 11231, Weight = 0 },
					{ Range = {2100,2399}, Desc = --[[!AUTO_721]]"平速", Icon = 11232, Weight = 10 },
					{ Range = {1800,2099},  Desc = --[[!AUTO_722]]"飛速", Icon = 11233, Weight = 20 },
					{ Range = {0, 1799},  Desc = --[[!AUTO_723]]"神速", Icon = 11234, Weight = 30},
				}
			},

			{
				Desc = --[[!AUTO_724]]"重傷次數",
				Unit = --[[!AUTO_725]]"次",
				Arg  = 8, 		--副本内玩家死亡次数为8号参数
				Baddish =
				{
					{ Range = {5, 99999},  Desc = --[[!AUTO_726]]"慘敗", Icon = 11239, Weight = 0 },
					{ Range = {3, 4},  Desc = --[[!AUTO_727]]"重傷", Icon = 11240, Weight = 10 },
					{ Range = {1, 2},  Desc = --[[!AUTO_728]]"輕傷", Icon = 11241, Weight = 20 },
					{ Range = {0, 0},  Desc = --[[!AUTO_729]]"無損", Icon = 11242, Weight = 30},
				}
			},

		},

		AddDrawMoney = 11558,				--2次抽奖消耗金钱，优先绑定币，不足则交易币补齐

		AddDrawLottery = 80307,				--2次抽奖的彩票ID72441

                TeamExp = EctypeScore.TeamExpNormal,		--组队经验加成，经验基数为副本内玩家杀怪获得的总经验，分别是组队人数1-6人对应的加成比例
                Award = 						--评价得分的奖励，range为以上所有评价条件的总权重之和所处的数值区间。lottery为获得的彩票ID，exp为评价经验加成，基数为副本内玩家杀怪获得的总经验
                {
                        { Range = {0,  29}, Lottery = 80304, Exp = EctypeScore.GradeExpNormal[1] },
                        { Range = {30, 59}, Lottery = 80304, Exp = EctypeScore.GradeExpNormal[2] },
                        { Range = {60, 79}, Lottery = 80304, Exp = EctypeScore.GradeExpNormal[3] },
                        { Range = {80, 100}, Lottery = 80304, Exp = EctypeScore.GradeExpNormal[4] },
                },
	},

	[3] = 				--模式3的评价
	{
		ScoreCond =
		{
			{
				Desc = --[[!AUTO_730]]"戰鬥分數",	--评价条件名
				Unit = --[[!AUTO_731]]"分",		--评价条件的单位
				Arg  = 9,		--战斗分数为9号参数
				Baddish =		--从上到下分别为B\A\S\SS,range为参数数值区间，desc为界面悬浮文字（新版界面无效？），icon为图标（新版界面无效？），weight为对应数值区间的权重
				{
					{ Range = {0, 24999},  Desc = --[[!AUTO_732]]"醬油", Icon = 11239, Weight = 0},
					{ Range = {25000, 29999},  Desc = --[[!AUTO_733]]"高手", Icon = 11240, Weight = 15 },
					{ Range = {30000, 39999},  Desc = --[[!AUTO_734]]"奇才", Icon = 11241, Weight = 25 },
					{ Range = {40000, 999999},  Desc = --[[!AUTO_735]]"武神", Icon = 11242, Weight = 40 },
				}
			},

			{
				Desc = --[[!AUTO_736]]"過關時間",
				Unit = SpecialUnit.TIME,
				Arg  = 11, 		--副本过关时间为11号参数
				Baddish =
				{
					{ Range = {2400,9999}, Desc = --[[!AUTO_737]]"慢速", Icon = 11231, Weight = 0 },
					{ Range = {2100,2399}, Desc = --[[!AUTO_738]]"平速", Icon = 11232, Weight = 10 },
					{ Range = {1800,2099},  Desc = --[[!AUTO_739]]"飛速", Icon = 11233, Weight = 20 },
					{ Range = {0, 1799},  Desc = --[[!AUTO_740]]"神速", Icon = 11234, Weight = 30},
				}
			},

			{
				Desc = --[[!AUTO_741]]"重傷次數",
				Unit = --[[!AUTO_742]]"次",
				Arg  = 8, 		--副本内玩家死亡次数为8号参数
				Baddish =
				{
					{ Range = {5, 99999},  Desc = --[[!AUTO_743]]"慘敗", Icon = 11239, Weight = 0 },
					{ Range = {3, 4},  Desc = --[[!AUTO_744]]"重傷", Icon = 11240, Weight = 10 },
					{ Range = {1, 2},  Desc = --[[!AUTO_745]]"輕傷", Icon = 11241, Weight = 20 },
					{ Range = {0, 0},  Desc = --[[!AUTO_746]]"無損", Icon = 11242, Weight = 30},
				}
			},

		},

		AddDrawMoney = 13485,				--2次抽奖消耗金钱，优先绑定币，不足则交易币补齐

		AddDrawLottery = 80308,				--2次抽奖的彩票ID72441

                TeamExp = EctypeScore.TeamExpNormal,		--组队经验加成，经验基数为副本内玩家杀怪获得的总经验，分别是组队人数1-6人对应的加成比例
                Award = 						--评价得分的奖励，range为以上所有评价条件的总权重之和所处的数值区间。lottery为获得的彩票ID，exp为评价经验加成，基数为副本内玩家杀怪获得的总经验
                {
                        { Range = {0,  29}, Lottery = 80305, Exp = EctypeScore.GradeExpNormal[1] },
                        { Range = {30, 59}, Lottery = 80305, Exp = EctypeScore.GradeExpNormal[2] },
                        { Range = {60, 79}, Lottery = 80305, Exp = EctypeScore.GradeExpNormal[3] },
                        { Range = {80, 100}, Lottery = 80305, Exp = EctypeScore.GradeExpNormal[4] },
                },
	},

	[4] = 				--模式4的评价
	{
		ScoreCond =
		{
			{
				Desc = "戰鬥分數",	--评价条件名
				Unit = "分",		--评价条件的单位
				Arg  = 9,		--战斗分数为9号参数
				Baddish =		--从上到下分别为B\A\S\SS,range为参数数值区间，desc为界面悬浮文字（新版界面无效？），icon为图标（新版界面无效？），weight为对应数值区间的权重
				{
					{ Range = {0, 24999},  Desc = "醬油", Icon = 11239, Weight = 0},
					{ Range = {25000, 29999},  Desc = "高手", Icon = 11240, Weight = 15 },
					{ Range = {30000, 39999},  Desc = "奇才", Icon = 11241, Weight = 25 },
					{ Range = {40000, 999999},  Desc = "武神", Icon = 11242, Weight = 40 },
				}
			},

			{
				Desc = "過關時間",
				Unit = SpecialUnit.TIME,
				Arg  = 11, 		--副本过关时间为11号参数
				Baddish =
				{
					{ Range = {2400,9999}, Desc = "慢速", Icon = 11231, Weight = 0 },
					{ Range = {2100,2399}, Desc = "平速", Icon = 11232, Weight = 10 },
					{ Range = {1800,2099},  Desc = "飛速", Icon = 11233, Weight = 20 },
					{ Range = {0, 1799},  Desc = "神速", Icon = 11234, Weight = 30},
				}
			},

			{
				Desc = "重傷次數",
				Unit = "次",
				Arg  = 8, 		--副本内玩家死亡次数为8号参数
				Baddish =
				{
					{ Range = {5, 99999},  Desc = "慘敗", Icon = 11239, Weight = 0 },
					{ Range = {3, 4},  Desc = "重傷", Icon = 11240, Weight = 10 },
					{ Range = {1, 2},  Desc = "輕傷", Icon = 11241, Weight = 20 },
					{ Range = {0, 0},  Desc = "無損", Icon = 11242, Weight = 30},
				}
			},

		},

		AddDrawMoney = 19264,				--2次抽奖消耗金钱，优先绑定币，不足则交易币补齐

		AddDrawLottery = 82463,				--2次抽奖的彩票ID72441

                TeamExp = EctypeScore.TeamExpNormal,		--组队经验加成，经验基数为副本内玩家杀怪获得的总经验，分别是组队人数1-6人对应的加成比例
                Award = 						--评价得分的奖励，range为以上所有评价条件的总权重之和所处的数值区间。lottery为获得的彩票ID，exp为评价经验加成，基数为副本内玩家杀怪获得的总经验
                {
                        { Range = {0,  29}, Lottery = 82462, Exp = EctypeScore.GradeExpNormal[1] },
                        { Range = {30, 59}, Lottery = 82462, Exp = EctypeScore.GradeExpNormal[2] },
                        { Range = {60, 79}, Lottery = 82462, Exp = EctypeScore.GradeExpNormal[3] },
                        { Range = {80, 100}, Lottery = 82462, Exp = EctypeScore.GradeExpNormal[4] },
                },
	},

}
----新青城突破

EctypeScore.Cfg[9751] =			--填写副本ID
{
	[4] = 				--模式4的评价
	{
		ScoreCond =
		{
			{
				Desc = --[[!AUTO_128]]"戰鬥分數",	--评价条件名
				Unit = --[[!AUTO_129]]"分",		--评价条件的单位
				Arg  = 9,		--战斗分数为9号参数
				Baddish =		--从上到下分别为B\A\S\SS,range为参数数值区间，desc为界面悬浮文字（新版界面无效？），icon为图标（新版界面无效？），weight为对应数值区间的权重
				{
					{ Range = {0, 24999},  Desc = --[[!AUTO_130]]"醬油", Icon = 11239, Weight = 0},
					{ Range = {25000, 29999},  Desc = --[[!AUTO_131]]"高手", Icon = 11240, Weight = 15 },
					{ Range = {30000, 39999},  Desc = --[[!AUTO_132]]"奇才", Icon = 11241, Weight = 25 },
					{ Range = {40000, 999999},  Desc = --[[!AUTO_133]]"武神", Icon = 11242, Weight = 40 },
				}
			},

			{
				Desc = --[[!AUTO_134]]"過關時間",
				Unit = SpecialUnit.TIME,
				Arg  = 11, 		--副本过关时间为11号参数
				Baddish =
				{
					{ Range = {2400,9999}, Desc = --[[!AUTO_135]]"慢速", Icon = 11231, Weight = 0 },
					{ Range = {2100,2399}, Desc = --[[!AUTO_136]]"平速", Icon = 11232, Weight = 10 },
					{ Range = {1800,2099},  Desc = --[[!AUTO_137]]"飛速", Icon = 11233, Weight = 20 },
					{ Range = {0, 1799},  Desc = --[[!AUTO_138]]"神速", Icon = 11234, Weight = 30},
				}
			},

			{
				Desc = --[[!AUTO_139]]"重傷次數",
				Unit = --[[!AUTO_140]]"次",
				Arg  = 8, 		--副本内玩家死亡次数为8号参数
				Baddish =
				{
					{ Range = {5, 99999},  Desc = --[[!AUTO_141]]"慘敗", Icon = 11239, Weight = 0 },
					{ Range = {3, 4},  Desc = --[[!AUTO_142]]"重傷", Icon = 11240, Weight = 10 },
					{ Range = {1, 2},  Desc = --[[!AUTO_143]]"輕傷", Icon = 11241, Weight = 20 },
					{ Range = {0, 0},  Desc = --[[!AUTO_144]]"無損", Icon = 11242, Weight = 30},
				}
			},

		},

		AddDrawMoney = 6429,				--2次抽奖消耗金钱，优先绑定币，不足则交易币补齐

		AddDrawLottery = 85197,				--2次抽奖的彩票ID85197

                TeamExp = EctypeScore.TeamExpNormal,		--组队经验加成，经验基数为副本内玩家杀怪获得的总经验，分别是组队人数1-6人对应的加成比例
                Award = 						--评价得分的奖励，range为以上所有评价条件的总权重之和所处的数值区间。lottery为获得的彩票ID，exp为评价经验加成，基数为副本内玩家杀怪获得的总经验
		{
                        { Range = {0,  29}, Lottery = 85197, Exp = EctypeScore.GradeExpNormal[1] },
                        { Range = {30, 59}, Lottery = 85197, Exp = EctypeScore.GradeExpNormal[2] },
                        { Range = {60, 79}, Lottery = 85197, Exp = EctypeScore.GradeExpNormal[3] },
                        { Range = {80, 100}, Lottery = 85197, Exp = EctypeScore.GradeExpNormal[4] },
                },
	},

}
----新海中孤岛

EctypeScore.Cfg[9760] =			--填写副本ID
{
	
	[4] = 				--模式4的评价
	{
		ScoreCond =
		{
			{
				Desc = --[[!AUTO_179]]"戰鬥分數",	--评价条件名
				Unit = --[[!AUTO_180]]"分",		--评价条件的单位
				Arg  = 9,		--战斗分数为9号参数
				Baddish =		--从上到下分别为B\A\S\SS,range为参数数值区间，desc为界面悬浮文字（新版界面无效？），icon为图标（新版界面无效？），weight为对应数值区间的权重
				{
					{ Range = {0, 24999},  Desc = --[[!AUTO_181]]"醬油", Icon = 11239, Weight = 0},
					{ Range = {25000, 29999},  Desc = --[[!AUTO_182]]"高手", Icon = 11240, Weight = 15 },
					{ Range = {30000, 39999},  Desc = --[[!AUTO_183]]"奇才", Icon = 11241, Weight = 25 },
					{ Range = {40000, 999999},  Desc = --[[!AUTO_184]]"武神", Icon = 11242, Weight = 40 },
				}
			},

			{
				Desc = --[[!AUTO_185]]"過關時間",
				Unit = SpecialUnit.TIME,
				Arg  = 11, 		--副本过关时间为11号参数
				Baddish =
				{
					{ Range = {1500,9999}, Desc = --[[!AUTO_186]]"慢速", Icon = 11231, Weight = 0 },
					{ Range = {1200,1499}, Desc = --[[!AUTO_187]]"平速", Icon = 11232, Weight = 10 },
					{ Range = {900,1199},  Desc = --[[!AUTO_188]]"飛速", Icon = 11233, Weight = 20 },
					{ Range = {0, 899},  Desc = --[[!AUTO_189]]"神速", Icon = 11234, Weight = 30},
				}
			},

			{
				Desc = --[[!AUTO_190]]"重傷次數",
				Unit = --[[!AUTO_191]]"次",
				Arg  = 8, 		--副本内玩家死亡次数为8号参数
				Baddish =
				{
					{ Range = {5, 99999},  Desc = --[[!AUTO_192]]"慘敗", Icon = 11239, Weight = 0 },
					{ Range = {3, 4},  Desc = --[[!AUTO_193]]"重傷", Icon = 11240, Weight = 10 },
					{ Range = {1, 2},  Desc = --[[!AUTO_194]]"輕傷", Icon = 11241, Weight = 20 },
					{ Range = {0, 0},  Desc = --[[!AUTO_195]]"無損", Icon = 11242, Weight = 30},
				}
			},

		},

		AddDrawMoney = 5264,				--2次抽奖消耗金钱，优先绑定币，不足则交易币补齐

		AddDrawLottery = 85197,				--2次抽奖的彩票ID85197

                TeamExp = EctypeScore.TeamExpNormal,		--组队经验加成，经验基数为副本内玩家杀怪获得的总经验，分别是组队人数1-6人对应的加成比例
                Award = 						--评价得分的奖励，range为以上所有评价条件的总权重之和所处的数值区间。lottery为获得的彩票ID，exp为评价经验加成，基数为副本内玩家杀怪获得的总经验
                {
                        { Range = {0,  29}, Lottery = 85197, Exp = EctypeScore.GradeExpNormal[1] },
                        { Range = {30, 59}, Lottery = 85197, Exp = EctypeScore.GradeExpNormal[2] },
                        { Range = {60, 79}, Lottery = 85197, Exp = EctypeScore.GradeExpNormal[3] },
                        { Range = {80, 100}, Lottery = 85197, Exp = EctypeScore.GradeExpNormal[4] },
                },
	},


}
----新云上山崖

EctypeScore.Cfg[9761] =			--填写副本ID
{
	
	[4] = 				--模式4的评价
	{
		ScoreCond =
		{
			{
				Desc = --[[!AUTO_230]]"戰鬥分數",	--评价条件名
				Unit = --[[!AUTO_231]]"分",		--评价条件的单位
				Arg  = 9,		--战斗分数为9号参数
				Baddish =		--从上到下分别为B\A\S\SS,range为参数数值区间，desc为界面悬浮文字（新版界面无效？），icon为图标（新版界面无效？），weight为对应数值区间的权重
				{
					{ Range = {0, 24999},  Desc = --[[!AUTO_232]]"醬油", Icon = 11239, Weight = 0},
					{ Range = {25000, 29999},  Desc = --[[!AUTO_233]]"高手", Icon = 11240, Weight = 15 },
					{ Range = {30000, 39999},  Desc = --[[!AUTO_234]]"奇才", Icon = 11241, Weight = 25 },
					{ Range = {40000, 999999},  Desc = --[[!AUTO_235]]"武神", Icon = 11242, Weight = 40 },
				}
			},

			{
				Desc = --[[!AUTO_236]]"過關時間",
				Unit = SpecialUnit.TIME,
				Arg  = 11, 		--副本过关时间为11号参数
				Baddish =
				{
					{ Range = {1800,9999}, Desc = --[[!AUTO_237]]"慢速", Icon = 11231, Weight = 0 },
					{ Range = {1500,1799}, Desc = --[[!AUTO_238]]"平速", Icon = 11232, Weight = 10 },
					{ Range = {1200,1499},  Desc = --[[!AUTO_239]]"飛速", Icon = 11233, Weight = 20 },
					{ Range = {0, 1199},  Desc = --[[!AUTO_240]]"神速", Icon = 11234, Weight = 30},
				}
			},

			{
				Desc = --[[!AUTO_241]]"重傷次數",
				Unit = --[[!AUTO_242]]"次",
				Arg  = 8, 		--副本内玩家死亡次数为8号参数
				Baddish =
				{
					{ Range = {5, 99999},  Desc = --[[!AUTO_243]]"慘敗", Icon = 11239, Weight = 0 },
					{ Range = {3, 4},  Desc = --[[!AUTO_244]]"重傷", Icon = 11240, Weight = 10 },
					{ Range = {1, 2},  Desc = --[[!AUTO_245]]"輕傷", Icon = 11241, Weight = 20 },
					{ Range = {0, 0},  Desc = --[[!AUTO_246]]"無損", Icon = 11242, Weight = 30},
				}
			},

		},

		AddDrawMoney = 6989,				--2次抽奖消耗金钱，优先绑定币，不足则交易币补齐

		AddDrawLottery = 85197,				--2次抽奖的彩票ID785197

                TeamExp = EctypeScore.TeamExpNormal,		--组队经验加成，经验基数为副本内玩家杀怪获得的总经验，分别是组队人数1-6人对应的加成比例
                Award = 						--评价得分的奖励，range为以上所有评价条件的总权重之和所处的数值区间。lottery为获得的彩票ID，exp为评价经验加成，基数为副本内玩家杀怪获得的总经验
                {
                        { Range = {0,  29}, Lottery = 85197, Exp = EctypeScore.GradeExpNormal[1] },
                        { Range = {30, 59}, Lottery = 85197, Exp = EctypeScore.GradeExpNormal[2] },
                        { Range = {60, 79}, Lottery = 85197, Exp = EctypeScore.GradeExpNormal[3] },
                        { Range = {80, 100}, Lottery = 85197, Exp = EctypeScore.GradeExpNormal[4] },
                },
	},


}

---------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------
------------------------------------帮派副本-------------------------------------------
---------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------



----守卫宝库
EctypeScore.Cfg[2284] =
{
	[1] =
	{
		ScoreCond =
		{
			{
				Desc = --[[!AUTO_672]]"金塊數量",
				Unit = --[[!AUTO_673]]"塊",
				Arg  = 201,
				Baddish =
				{
					{ Range = {-99999,39},  Desc = --[[!AUTO_674]]"慘敗", Icon = 11940, Weight = 0},
					{ Range = {40,54},  Desc = --[[!AUTO_675]]"較好", Icon = 11941, Weight = 15 },
					{ Range = {55,64}, Desc = --[[!AUTO_676]]"極好", Icon = 11942, Weight = 30 },
					{ Range = {65,999}, Desc = --[[!AUTO_677]]"完美", Icon = 11943, Weight = 50 },
				}
			},

			{
				Desc = --[[!AUTO_678]]"逃跑盜賊",
				Unit = --[[!AUTO_679]]"個",
				Arg  = 205,
				Baddish =
				{
					{ Range = {7, 999},  Desc = --[[!AUTO_680]]"慘敗", Icon = 11944, Weight = 0},
					{ Range = {4, 6},  Desc = --[[!AUTO_681]]"較好", Icon = 11945, Weight = 15 },
					{ Range = {2, 3},  Desc = --[[!AUTO_682]]"極好", Icon = 11946, Weight = 30 },
					{ Range = {0, 1},  Desc = --[[!AUTO_683]]"完美", Icon = 11947, Weight = 50 },
				}
			},
		},

                TeamExp = EctypeScore.TeamExpNormal,
                Award =
                {
                        { Range = {0,  29}, Lottery = 66836, Exp = EctypeScore.GradeExpNormal[1] },
                        { Range = {30, 59}, Lottery = 66837, Exp = EctypeScore.GradeExpNormal[2] },
                        { Range = {60, 79}, Lottery = 66838, Exp = EctypeScore.GradeExpNormal[3] },
                        { Range = {80, 100}, Lottery = 66839, Exp = EctypeScore.GradeExpNormal[4] },
                },
	},
}



----追击钦犯
EctypeScore.Cfg[3066] =
{
	[1] =
	{
		ScoreCond =
		{
			{
				Desc = --[[!AUTO_684]]"完成時間",
				Unit = --[[!AUTO_685]]"秒",
				Arg  = 11,
				Baddish =
				{
					{ Range = {451,9999},  Desc = --[[!AUTO_686]]"慘敗", Icon = 11940, Weight = 0},
					{ Range = {401,450},  Desc = --[[!AUTO_687]]"較好", Icon = 11941, Weight = 15 },
					{ Range = {351,400}, Desc = --[[!AUTO_688]]"極好", Icon = 11942, Weight = 30 },
					{ Range = {0,350}, Desc = --[[!AUTO_689]]"完美", Icon = 11943, Weight = 50 },
				}
			},

			{
				Desc = --[[!AUTO_690]]"被擊次數",
				Unit = --[[!AUTO_691]]"次",
				Arg  = 203,
				Baddish =
				{
					{ Range = {21, 999},  Desc = --[[!AUTO_692]]"慘敗", Icon = 11944, Weight = 0},
					{ Range = {11, 20},  Desc = --[[!AUTO_693]]"較好", Icon = 11945, Weight = 15 },
					{ Range = {6, 10},  Desc = --[[!AUTO_694]]"極好", Icon = 11946, Weight = 30 },
					{ Range = {0, 5},  Desc = --[[!AUTO_695]]"完美", Icon = 11947, Weight = 50 },
				}
			},
		},

                TeamExp = EctypeScore.TeamExpNormal,
                Award =
                {
                        { Range = {0,  29}, Lottery = 66840, Exp = EctypeScore.GradeExpNormal[1] },
                        { Range = {30, 59}, Lottery = 66841, Exp = EctypeScore.GradeExpNormal[2] },
                        { Range = {60, 79}, Lottery = 66842, Exp = EctypeScore.GradeExpNormal[3] },
                        { Range = {80, 100}, Lottery = 66843, Exp = EctypeScore.GradeExpNormal[4] },
                },
	},
}




function EctypeScore:GetCfg(idEctype,mode)
	if EctypeScore.Cfg[idEctype] and EctypeScore.Cfg[idEctype][mode] then
		return EctypeScore.Cfg[idEctype][mode]
	end
end

function EctypeScore:HaveNPCScore(idEctype,mode)
	local cfg = EctypeScore.Cfg[idEctype]
	if cfg and cfg[mode] and cfg[mode].ScoreCond then
		for _,v in pairs(cfg[mode].ScoreCond) do
			if v.Arg == 9 then
				return true
			end
		end
	end
	return false
end

