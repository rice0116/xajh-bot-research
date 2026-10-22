--[[#tag push auto]]
Achievement = {}

ACHIEVEMENT_LOCK   = 0
ACHIEVEMENT_UNLOCK = 1

--[[成就奖杯：ACHIEVEMENT_ESSENCE.prize_type]]
Achievement.Prize =
{
	EXPACHIEVEPRIZE_MEDEL		= 0,	--	奖牌
	EXPACHIEVEPRIZE_COPPER_CUP	= 1,	--	铜杯
	EXPACHIEVEPRIZE_SILVER_CUP	= 2,	--	银杯
	EXPACHIEVEPRIZE_GOLDEN_CUP	= 3,	--	金杯
}

--[[成就分类：ACHIEVEMENT_ESSENCE.achieve_class]]
Achievement.Class =
{
	EXPACHIVECLASS_PULLULATE	= 0,	--	成长（自身成长类）
	EXPACHIVECLASS_EXPERIENCE	= 1,	--	历练（任务相关类）
	EXPACHIVECLASS_COMBAT		= 2,	--	战斗（战斗相关类）
	EXPACHIVECLASS_WUSHU		= 3,	--	武道（门派相关类）
	EXPACHIVECLASS_COMMERCE		= 4,	--	商业（生计经商类）
	EXPACHIVECLASS_JIANGHU		= 5,	--	江湖（社会交互类）
	EXPACHIVECLASS_QITA		= 6,	--	其他（其他综合类）
	EXPACHIVECLASS_EVERYDAY		= 50,	--	每日（每日隐藏成就）
}

--[[成就分区设定Mask：ACHIEVEMENT_ESSENCE.achieve_section]]
Achievement.Section =
{
	EXPACHIVESECT_DEVELOPING	= 0x000000001,	--	开发中成就
	EXPACHIVESECT_EXPERIENCE	= 0x000000002,	--	体验服专有成就
	EXPACHIVESECT_PUBLIC_1		= 0x000000004,	--	公开版本1通用成就
	EXPACHIVESECT_PUBLIC_2		= 0x000000008,	--	公开版本2通用成就
	EXPACHIVESECT_PUBLIC_3		= 0x000000010,	--	公开版本3通用成就
	EXPACHIVESECT_PUBLIC_4		= 0x000000020,	--	公开版本4通用成就
	EXPACHIVESECT_PUBLIC_5		= 0x000000040,	--	公开版本5通用成就
	EXPACHIVESECT_PUBLIC_6		= 0x000000080,	--	公开版本6通用成就
	EXPACHIVESECT_PUBLIC_7		= 0x000000100,	--	公开版本7通用成就
	EXPACHIVESECT_PUBLIC_8		= 0x000000200,	--	公开版本8通用成就
	EXPACHIVESECT_PUBLIC_9		= 0x000000400,	--	公开版本9通用成就
	EXPACHIVESECT_PUBLIC_10		= 0x000000800,	--	公开版本10通用成就
	EXPACHIVESECT_PUBLIC_11		= 0x000001000,	--	公开版本11通用成就
	EXPACHIVESECT_PUBLIC_12		= 0x000002000,	--	公开版本12通用成就
	EXPACHIVESECT_PUBLIC_13		= 0x000004000,	--	公开版本13通用成就
	EXPACHIVESECT_PUBLIC_14		= 0x000008000,	--	公开版本14通用成就
	EXPACHIVESECT_MAINLAND		= 0x000010000,	--	大陆版本专用成就
	EXPACHIVESECT_TAIWAN		= 0x000020000,	--	台湾版本专用成就
}

--[[成就解锁情况：ACHIEVEMENT_ESSENCE.xxx_state_condition]]
Achievement.LockCond =
{
	EXPACHIVESTATECONDMASK_PROF		= 0x00000001,	--	职业满足
	EXPACHIVESTATECONDMASK_LEVEL		= 0x00000002,	--	人物等级达到
	EXPACHIVESTATECONDMASK_MONEY		= 0x00000004,	--	钱数达到
	EXPACHIVESTATECONDMASK_PK_VALUE		= 0x00000008,	--	pk值达到
	EXPACHIVESTATECONDMASK_REPUTATION	= 0x00000010,	--	声望达到
	EXPACHIVESTATECONDMASK_NORMAL_TASK	= 0x00000020,	--	完成普通任务
	EXPACHIVESTATECONDMASK_SCENE_TASK	= 0x00000040,	--	完成场景任务
	EXPACHIVESTATECONDMASK_LIMITNUM_TASK	= 0x00000080,	--	完成限次任务
	EXPACHIVESTATECONDMASK_LEARN_SKILL	= 0x00000100,	--	学习技能
	EXPACHIVESTATECONDMASK_LEARN_PROD_SKILL	= 0x00000200,	--	学会生产技能
	EXPACHIVESTATECONDMASK_LEARN_RECIPE	= 0x00000400,	--	学会配方数目
	EXPACHIVESTATECONDMASK_ACCOMP_ACHIVE	= 0x00f2e5b9,	--	完成成就
	EXPACHIVESTATECONDMASK_FORCE_INT	= 0x7FFFFFFF,
}

--[[成就状态类条件：ACHIEVEMENT_ESSENCE.xxx_state_condition]]
Achievement.StateCond =
{
	EXPACHIVESTATECOND_NONE			= 0,	--	无条件
	EXPACHIVESTATECOND_PROF			= 1,	--	职业满足
	EXPACHIVESTATECOND_LEVEL		= 2,	--	人物等级达到
	EXPACHIVESTATECOND_MONEY		= 3,	--	钱数达到
	EXPACHIVESTATECOND_PK_VALUE		= 4,	--	pk值达到
	EXPACHIVESTATECOND_REPUTATION		= 5,	--	声望达到
	EXPACHIVESTATECOND_NORMAL_TASK		= 6,	--	完成普通任务
	EXPACHIVESTATECOND_SCENE_TASK		= 7,	--	完成场景任务
	EXPACHIVESTATECOND_LIMITNUM_TASK	= 8,	--	完成限次任务
	EXPACHIVESTATECOND_LEARN_SKILL		= 9,	--	学习技能
	EXPACHIVESTATECOND_LEARN_PROD_SKILL	= 10,	--	学会生产技能
	EXPACHIVESTATECOND_LEARN_RECIPE		= 11,	--	学会配方数目
	EXPACHIVESTATECOND_ACCOMP_ACHIVE	= 12,	--	完成成就
	EXPACHIVESTATECONDMASK_ARENA_COUNT	= 13,   --      竞技场总次数
	EXPACHIVESTATECONDMASK_ARENA_GRADE	= 14,   --      竞技段位达到
	EXPACHIVESTATECONDMASK_ARENA_CONTINOUS_WIN = 15,	--	连胜次数达到
}

--[[成就事件类条件：ACHIEVEMENT_ESSENCE.xxx_state_condition]]
Achievement.EventCond =
{
	EXPACHIVEEVENTCOND_NONE			= 0,	--	无条件
	EXPACHIVEEVENTCOND_EQUIP_ITEM		= 1,	--	装备物品
	EXPACHIVEEVENTCOND_GET_ITEM		= 2,	--	获取物品
	EXPACHIVEEVENTCOND_GET_PET		= 3,	--	获取宠物
	EXPACHIVEEVENTCOND_FINISH_TASK		= 4,	--	完成重复任务
	EXPACHIVEEVENTCOND_KILL_MONSTER		= 5,	--	杀怪
	EXPACHIVEEVENTCOND_PRODUCE		= 6,	--	生产
	EXPACHIVEEVENTCOND_FINISH_INSTANCE	= 7,	--	完成副本
	EXPACHIVEEVENTCOND_PK			= 8,	--	进行切磋
	EXPACHIVEEVENTCOND_DEAD			= 9,	--	死亡
	EXPACHIVEEVENTCOND_MONEYGAIN		= 10,	--	获取绑定币
	EXPACHIVEEVENTCONDMASK_COMPLETE_TASK	= 11,   --	完成某类任务
	EXPACHIVEEVENTCONDMASK_ANSWER_QUEST	= 12,   --      答题
	EXPACHIVEEVENTCONDMASK_PLANT		= 13,   --      种植交互
	EXPACHIVEEVENTCONDMASK_ARENA_MODE_COUNT	= 14,           --      竞技模式次数
	EXPACHIVEEVENTCONDMASK_ARENA_PERFECT_COUNT	= 15,	--      竞技完美次数
	EXPACHIVEEVENTCONDMASK_ARENA_MVP_COUNT	= 16,           --      竞技MVP次数
	EXPACHIVEEVENTCONDMASK_FINISH_INST_MODE	= 17,           --      完成副本(限难度评价)

}
--[[所有的成就]]
Achievement.Templ =
{
--[[#tag push from_excel]]
------------------[[所有成就开始]]------------------
{ID = 40, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, Name = "江湖蝦米", Award = ""},
{ID = 41, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, Name = "武林新秀", Award = "^f2e5b9獎勵：^f3c065開啟1個徽章位^f2e5b9徽章獎勵:^f3c065【1級活力徽章】"},
{ID = 42, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, Name = "聲名遠揚", Award = "^f2e5b9徽章獎勵:^f3c065【2級活力徽章】"},
{ID = 43, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, Name = "威風八面", Award = "^f2e5b9徽章獎勵:^f3c065【3級活力徽章】"},
{ID = 44, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, Name = "藝冠群雄", Award = "^f2e5b9徽章獎勵:^f3c065【4級活力徽章】"},
{ID = 45, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, Name = "風塵奇俠", Award = ""},
{ID = 46, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, Name = "絕頂高手", Award = ""},
{ID = 47, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, Name = "一代宗師", Award = ""},
{ID = 48, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, Name = "俠之大者", Award = ""},
{ID = 147, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, Name = "一貧如洗", Award = "^f2e5b9徽章獎勵:^f3c065【1級精通徽章】"},
{ID = 148, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, Name = "獨善其身", Award = "^f2e5b9徽章獎勵:^f3c065【2級精通徽章】"},
{ID = 149, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, Name = "豐衣足食", Award = "^f2e5b9徽章獎勵:^f3c065【3級精通徽章】"},
{ID = 150, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, Name = "家財萬貫", Award = "^f2e5b9徽章獎勵:^f3c065【4級精通徽章】"},
{ID = 151, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, Name = "富可敵國", Award = ""},
{ID = 152, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, Name = "取財有道", Award = "^f2e5b9徽章獎勵:^f3c065【1級會心徽章】"},
{ID = 153, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, Name = "積少成多", Award = "^f2e5b9徽章獎勵:^f3c065【2級會心徽章】"},
{ID = 154, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, Name = "勤勞致富", Award = "^f2e5b9徽章獎勵:^f3c065【3級會心徽章】"},
{ID = 180, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, Name = "天道酬勤", Award = "^f2e5b9徽章獎勵:^f3c065【4級會心徽章】"},
{ID = 165, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, spestr = "加入少林派", Name = "少林正宗", Award = ""},
{ID = 166, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, spestr = "加入武當派", Name = "武當玄門", Award = ""},
{ID = 167, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, spestr = "加入峨嵋派", Name = "峨嵋羽化", Award = ""},
{ID = 168, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, spestr = "加入恒山派", Name = "恒山妙手", Award = ""},
{ID = 169, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, spestr = "加入衡山派", Name = "衡山天音", Award = ""},
{ID = 170, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, spestr = "加入華山派", Name = "華山獨孤", Award = ""},
{ID = 171, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, spestr = "加入五仙教", Name = "五仙絕色", Award = ""},
{ID = 172, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, spestr = "加入日月神教", Name = "日月同輝", Award = ""},
{ID = 173, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, spestr = "加入逍遙派", Name = "逍遙無極", Award = ""},
{ID = 174, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, spestr = "加入唐門", Name = "唐門千機", Award = ""},
{ID = 377, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, spestr = "解鎖『兄弟聯手』應用", Name = "兄弟同心", Award = ""},
{ID = 379, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, spestr = "解鎖『曠世高手』應用", Name = "曠世武癡", Award = ""},
{ID = 118, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, spestr = "死亡一次", Name = "駕鶴西遊", Award = ""},
{ID = 720, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, spestr = "再次死亡10次", Name = "再度西遊", Award = ""},
{ID = 721, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, spestr = "再次死亡100次", Name = "死去活來", Award = ""},
{ID = 722, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, spestr = "再次死亡300次", Name = "超鬼", Award = ""},
{ID = 723, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, spestr = "原地復活1次", Name = "再來", Award = "^f2e5b9徽章獎勵:^f3c065【1級氣海徽章】"},
{ID = 724, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, spestr = "再次原地復活10次", Name = "東山再起", Award = "^f2e5b9徽章獎勵:^f3c065【2級氣海徽章】"},
{ID = 725, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, spestr = "再次原地復活100次", Name = "王者歸來", Award = "^f2e5b9徽章獎勵:^f3c065【3級氣海徽章】"},
{ID = 726, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, spestr = "再次原地復活300次", Name = "小強", Award = "^f2e5b9徽章獎勵:^f3c065【4級氣海徽章】"},
{ID = 780, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, spestr = "合成1顆寶石", Name = "合成寶石", Award = "^f2e5b9徽章獎勵:^f3c065【1級剛強徽章】"},
{ID = 781, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, spestr = "再次合成10顆寶石", Name = "合成寶石(10)", Award = "^f2e5b9徽章獎勵:^f3c065【2級剛強徽章】"},
{ID = 782, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, spestr = "再次合成100顆寶石", Name = "合成寶石(100)", Award = "^f2e5b9徽章獎勵:^f3c065【3級剛強徽章】"},
{ID = 783, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, spestr = "再次合成500顆寶石", Name = "合成寶石(500)", Award = ""},
{ID = 784, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, spestr = "為裝備打孔", Name = "裝備打孔", Award = ""},
{ID = 785, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, spestr = "鑲嵌寶石", Name = "鑲嵌寶石", Award = ""},
{ID = 786, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, spestr = "取出寶石", Name = "取出寶石", Award = ""},
{ID = 787, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, spestr = "強化1件裝備到達強化等級1", Name = "強1", Award = ""},
{ID = 788, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, spestr = "再次強化10件裝備到達強化等級1", Name = "強1(10)", Award = ""},
{ID = 789, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, spestr = "再次強化100件裝備到達強化等級1", Name = "強1(100)", Award = ""},
{ID = 790, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, spestr = "強化1件裝備到達強化等級3", Name = "強3", Award = "^f2e5b9徽章獎勵:^f3c065【1級輕柔徽章】"},
{ID = 791, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, spestr = "再次強化10件裝備到達強化等級3", Name = "強3(10)", Award = "^f2e5b9徽章獎勵:^f3c065【2級輕柔徽章】"},
{ID = 792, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, spestr = "再次強化100件裝備到達強化等級3", Name = "強3(100)", Award = "^f2e5b9徽章獎勵:^f3c065【3級輕柔徽章】"},
{ID = 799, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, spestr = "強化1件裝備到達強化等級4", Name = "強4", Award = ""},
{ID = 800, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, spestr = "再次強化10件裝備到達強化等級4", Name = "強4(10)", Award = "^f2e5b9獎勵:^f3c065開啟1個徽章位"},
{ID = 801, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, spestr = "再次強化100件裝備到達強化等級4", Name = "強4(100)", Award = ""},
{ID = 793, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, spestr = "強化1件裝備到達強化等級5", Name = "強5", Award = ""},
{ID = 794, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, spestr = "再次強化10件裝備到達強化等級5", Name = "強5(10)", Award = ""},
{ID = 795, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, spestr = "再次強化100件裝備到達強化等級5", Name = "強5(100)", Award = ""},
{ID = 796, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, spestr = "強化1件裝備到達強化等級7", Name = "強7", Award = ""},
{ID = 797, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, spestr = "再次強化10件裝備到達強化等級7", Name = "強7(10)", Award = ""},
{ID = 798, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, spestr = "再次強化100件裝備到達強化等級7", Name = "強7(100)", Award = ""},
{ID = 802, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, spestr = "強化1件裝備到達強化等級10", Name = "強10", Award = ""},
{ID = 803, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, spestr = "再次強化10件裝備到達強化等級10", Name = "強10(10)", Award = ""},
{ID = 804, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, spestr = "再次強化100件裝備到達強化等級10", Name = "強10(100)", Award = ""},
{ID = 990, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, spestr = "強化任意暗器匣到強化等級10", Name = "暗器匣（10）", Award = ""},
{ID = 991, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, spestr = "強化任意暗器匣到強化等級20", Name = "暗器匣（20）", Award = ""},
{ID = 992, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, spestr = "強化任意暗器匣到強化等級30", Name = "暗器匣（30）", Award = ""},
{ID = 993, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, spestr = "強化任意暗器匣到強化等級40", Name = "暗器匣（40）", Award = ""},
{ID = 549, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, spestr = "獲得50個一級英雄令", Name = "獲得一級英雄令(50)", Award = ""},
{ID = 550, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, spestr = "再次獲得300個一級英雄令", Name = "獲得一級英雄令(300)", Award = ""},
{ID = 845, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, spestr = "獲得50個二級英雄令", Name = "獲得二級英雄令(50)", Award = ""},
{ID = 846, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, spestr = "再次獲得300個二級英雄令", Name = "獲得二級英雄令(300)", Award = ""},
{ID = 847, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, spestr = "獲得50個三級英雄令", Name = "獲得三級英雄令(50)", Award = ""},
{ID = 848, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, spestr = "再次獲得300個三級英雄令", Name = "獲得三級英雄令(300)", Award = ""},
{ID = 849, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, spestr = "獲得50個四級英雄令", Name = "獲得四級英雄令(50)", Award = ""},
{ID = 850, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, spestr = "再次獲得300個四級英雄令", Name = "獲得四級英雄令(300)", Award = ""},
{ID = 851, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, spestr = "獲得50個五級英雄令", Name = "獲得五級英雄令(50)", Award = ""},
{ID = 852, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, spestr = "再次獲得300個五級英雄令", Name = "獲得五級英雄令(300)", Award = ""},
{ID = 853, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, spestr = "獲得50個六級英雄令", Name = "獲得六級英雄令(50)", Award = ""},
{ID = 854, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, spestr = "再次獲得300個六級英雄令", Name = "獲得六級英雄令(300)", Award = ""},
{ID = 855, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, spestr = "獲得50個七級英雄令", Name = "獲得七級英雄令(50)", Award = ""},
{ID = 856, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, spestr = "再次獲得300個七級英雄令", Name = "獲得七級英雄令(300)", Award = ""},
{ID = 857, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, spestr = "獲得50個八級英雄令", Name = "獲得八級英雄令(50)", Award = ""},
{ID = 858, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, spestr = "再次獲得300個八級英雄令", Name = "獲得八級英雄令(300)", Award = ""},
{ID = 936, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, spestr = "自創一套武學", Name = "自創武學", Award = ""},
{ID = 1006, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, spestr = "獲得大蟒翻身所有秘笈", Name = "大蟒翻身", Award = ""},
{ID = 1007, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, spestr = "獲得佛光普照所有秘笈", Name = "佛光普照", Award = ""},
{ID = 1008, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, spestr = "獲得獅子咆哮所有秘笈", Name = "獅子咆哮", Award = ""},
{ID = 1009, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, spestr = "獲得金鐘護體所有秘笈", Name = "金鐘護體", Award = ""},
{ID = 1010, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, spestr = "獲得秦王鞭石所有秘笈", Name = "秦王鞭石", Award = ""},
{ID = 1011, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, spestr = "獲得車輪劍所有秘笈", Name = "車輪劍", Award = ""},
{ID = 1012, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, spestr = "獲得寒冰劍氣所有秘笈", Name = "寒冰劍氣", Award = ""},
{ID = 1013, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, spestr = "獲得真元護體所有秘笈", Name = "真元護體", Award = ""},
{ID = 1014, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, spestr = "獲得野馬分鬃所有秘笈", Name = "野馬分鬃", Award = ""},
{ID = 1015, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, spestr = "獲得扭轉乾坤所有秘笈", Name = "扭轉乾坤", Award = ""},
{ID = 1016, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, spestr = "獲得連環斬所有秘笈", Name = "連環斬", Award = ""},
{ID = 1017, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, spestr = "獲得決鬥印記所有秘笈", Name = "決鬥印記", Award = ""},
{ID = 1018, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, spestr = "獲得疾風突進所有秘笈", Name = "疾風突進", Award = ""},
{ID = 1019, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, spestr = "獲得狂氣劍決所有秘笈", Name = "狂氣劍決", Award = ""},
{ID = 1020, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, spestr = "獲得八方風雨所有秘笈", Name = "八方風雨", Award = ""},
{ID = 1021, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, spestr = "獲得秋風落葉所有秘笈", Name = "秋風落葉", Award = ""},
{ID = 1022, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, spestr = "獲得焰陽氣決所有秘笈", Name = "焰陽氣決", Award = ""},
{ID = 1023, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, spestr = "獲得慈雲真言所有秘笈", Name = "慈雲真言", Award = ""},
{ID = 1024, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, spestr = "獲得通筋化骨所有秘笈", Name = "通筋化骨", Award = ""},
{ID = 1025, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, spestr = "獲得驚濤駭浪所有秘笈", Name = "驚濤駭浪", Award = ""},
{ID = 1026, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, spestr = "獲得幻影擊所有秘笈", Name = "幻影擊", Award = ""},
{ID = 1027, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, spestr = "獲得玄冥氣決所有秘笈", Name = "玄冥氣決", Award = ""},
{ID = 1028, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, spestr = "獲得飛靈八方所有秘笈", Name = "飛靈八方", Award = ""},
{ID = 1029, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, spestr = "獲得驚鴻絕影所有秘笈", Name = "驚鴻絕影", Award = ""},
{ID = 1030, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, spestr = "獲得風捲殘雲所有秘笈", Name = "風捲殘雲", Award = ""},
{ID = 1031, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, spestr = "獲得開天斬所有秘笈", Name = "開天斬", Award = ""},
{ID = 1032, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, spestr = "獲得索命連環所有秘笈", Name = "索命連環", Award = ""},
{ID = 1033, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, spestr = "獲得血影狂刀所有秘笈", Name = "血影狂刀", Award = ""},
{ID = 1034, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, spestr = "獲得通天集氣所有秘笈", Name = "通天集氣", Award = ""},
{ID = 1035, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, spestr = "獲得不動明王所有秘笈", Name = "不動明王", Award = ""},
{ID = 1036, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, spestr = "獲得裂空鞭所有秘笈", Name = "裂空鞭", Award = ""},
{ID = 1037, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, spestr = "獲得碧鱗毒蠱所有秘笈", Name = "碧鱗毒蠱", Award = ""},
{ID = 1038, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, spestr = "獲得荊棘護甲所有秘笈", Name = "荊棘護甲", Award = ""},
{ID = 1039, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, spestr = "獲得騰蛇起霧所有秘笈", Name = "騰蛇起霧", Award = ""},
{ID = 1040, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, spestr = "獲得百花吐蕊所有秘笈", Name = "百花吐蕊", Award = ""},
{ID = 1041, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, spestr = "獲得融冰擊所有秘笈", Name = "融冰擊", Award = ""},
{ID = 1042, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, spestr = "獲得冰心氣決所有秘笈", Name = "冰心氣決", Award = ""},
{ID = 1043, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, spestr = "獲得步步生蓮所有秘笈", Name = "步步生蓮", Award = ""},
{ID = 1044, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, spestr = "獲得天狼涉水所有秘笈", Name = "天狼涉水", Award = ""},
{ID = 1045, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, spestr = "獲得風凝雪舞所有秘笈", Name = "風凝雪舞", Award = ""},
{ID = 1046, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, spestr = "獲得連珠彈所有秘笈", Name = "連珠彈", Award = ""},
{ID = 1047, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, spestr = "獲得飛蟥毒鏢所有秘笈", Name = "飛蟥毒鏢", Award = ""},
{ID = 1048, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, spestr = "獲得沙塵飛揚所有秘笈", Name = "沙塵飛揚", Award = ""},
{ID = 1049, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, spestr = "獲得捕風捉影所有秘笈", Name = "捕風捉影", Award = ""},
{ID = 1050, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, spestr = "獲得鷹擊長空所有秘笈", Name = "鷹擊長空", Award = ""},
{ID = 1051, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, spestr = "獲得赤砂掌所有秘笈", Name = "赤砂掌", Award = ""},
{ID = 1052, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, spestr = "獲得天罡指穴所有秘笈", Name = "天罡指穴", Award = ""},
{ID = 1053, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, spestr = "獲得凝神歸元所有秘笈", Name = "凝神歸元", Award = ""},
{ID = 1054, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, spestr = "獲得炎獄封穴所有秘笈", Name = "炎獄封穴", Award = ""},
{ID = 1055, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, spestr = "獲得五氣朝元所有秘笈", Name = "五氣朝元", Award = ""},
{ID = 1251, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, spestr = "獲得黃金武器玄星雁翎", Name = "玄星雁翎", Award = ""},
{ID = 1252, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, spestr = "獲得黃金武器槃龍雙鐧", Name = "槃龍雙鐧", Award = ""},
{ID = 1253, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, spestr = "獲得黃金武器怒叱浮屠", Name = "怒叱浮屠", Award = ""},
{ID = 1254, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, spestr = "獲得黃金武器三梵木犀", Name = "三梵木犀", Award = ""},
{ID = 1255, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, spestr = "獲得黃金武器天羅狂斬", Name = "天羅狂斬", Award = ""},
{ID = 1256, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, spestr = "獲得黃金武器諸法無我", Name = "諸法無我", Award = ""},
{ID = 1257, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, spestr = "獲得黃金武器音神訣印", Name = "音神訣印", Award = ""},
{ID = 1258, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, spestr = "獲得黃金武器緋煙念絲", Name = "緋煙念絲", Award = ""},
{ID = 1259, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, spestr = "獲得黃金武器赤魔煉魂", Name = "赤魔煉魂", Award = ""},
{ID = 1260, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, spestr = "獲得黃金武器淩舞夢骸", Name = "淩舞夢骸", Award = ""},
{ID = 1261, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, spestr = "獲得白銀武器妙胤千古", Name = "妙胤千古", Award = ""},
{ID = 1262, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, spestr = "獲得白銀武器霜璿月琉", Name = "霜璿月琉", Award = ""},
{ID = 1263, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, spestr = "獲得白銀武器邪影聖蹤", Name = "邪影聖蹤", Award = ""},
{ID = 1264, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, spestr = "獲得白銀武器露華凝霄", Name = "露華凝霄", Award = ""},
{ID = 1265, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, spestr = "獲得白銀武器魁拔雙闕", Name = "魁拔雙闕", Award = ""},
{ID = 1266, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, spestr = "獲得白銀武器九天彌陀", Name = "九天彌陀", Award = ""},
{ID = 1267, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, spestr = "獲得白銀武器火狐夜麟", Name = "火狐夜麟", Award = ""},
{ID = 1268, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, spestr = "獲得白銀武器冷煌花魂", Name = "冷煌花魂", Award = ""},
{ID = 1269, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, spestr = "獲得白銀武器荒初華年", Name = "荒初華年", Award = ""},
{ID = 1270, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, spestr = "獲得白銀武器忘塵葬雲", Name = "忘塵葬雲", Award = ""},
{ID = 860, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, spestr = "第一次使用西域駱駝", Name = "西域駱駝", Award = ""},
{ID = 861, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, spestr = "第一次使用松風", Name = "松風", Award = ""},
{ID = 862, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, spestr = "第一次使用火龍駒", Name = "火龍駒", Award = ""},
{ID = 946, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, spestr = "獲得稱號“來自星星的你”", Name = "來自星星的你", Award = ""},
{ID = 497, Class = Achievement.Class.EXPACHIVECLASS_EXPERIENCE, spestr = "到達福州郊外", Name = "山雨漸迷", Award = ""},
{ID = 498, Class = Achievement.Class.EXPACHIVECLASS_EXPERIENCE, spestr = "到達衡山郊外", Name = "花落洞庭", Award = ""},
{ID = 499, Class = Achievement.Class.EXPACHIVECLASS_EXPERIENCE, spestr = "到達武當山", Name = "神出太和巔", Award = ""},
{ID = 500, Class = Achievement.Class.EXPACHIVECLASS_EXPERIENCE, spestr = "到達華山", Name = "惟天在上", Award = ""},
{ID = 501, Class = Achievement.Class.EXPACHIVECLASS_EXPERIENCE, spestr = "到達藥王谷", Name = "荒陵流光", Award = ""},
{ID = 502, Class = Achievement.Class.EXPACHIVECLASS_EXPERIENCE, spestr = "到達少室山", Name = "嵩陽殘雨", Award = ""},
{ID = 503, Class = Achievement.Class.EXPACHIVECLASS_EXPERIENCE, spestr = "到達朱仙鎮", Name = "嘯竹風", Award = ""},
{ID = 504, Class = Achievement.Class.EXPACHIVECLASS_EXPERIENCE, spestr = "到達五霸崗", Name = "縱酒論英雄", Award = ""},
{ID = 505, Class = Achievement.Class.EXPACHIVECLASS_EXPERIENCE, spestr = "到達泰山", Name = "岱宗連天", Award = ""},
{ID = 506, Class = Achievement.Class.EXPACHIVECLASS_EXPERIENCE, spestr = "到達仙愁峽", Name = "遊歷仙愁峽", Award = ""},
{ID = 507, Class = Achievement.Class.EXPACHIVECLASS_EXPERIENCE, spestr = "到達仙霞嶺", Name = "遊歷仙霞嶺", Award = ""},
{ID = 508, Class = Achievement.Class.EXPACHIVECLASS_EXPERIENCE, spestr = "到達龍泉", Name = "遊歷龍泉", Award = ""},
{ID = 509, Class = Achievement.Class.EXPACHIVECLASS_EXPERIENCE, spestr = "到達鑄劍谷", Name = "遊歷鑄劍谷", Award = ""},
{ID = 510, Class = Achievement.Class.EXPACHIVECLASS_EXPERIENCE, spestr = "到達桂林", Name = "遊歷桂林", Award = ""},
{ID = 511, Class = Achievement.Class.EXPACHIVECLASS_EXPERIENCE, spestr = "到達南疆", Name = "遊歷南疆", Award = ""},
{ID = 512, Class = Achievement.Class.EXPACHIVECLASS_EXPERIENCE, spestr = "到達嘉州", Name = "遊歷嘉州", Award = ""},
{ID = 513, Class = Achievement.Class.EXPACHIVECLASS_EXPERIENCE, spestr = "到達夜嵐谷", Name = "遊歷夜嵐谷", Award = ""},
{ID = 514, Class = Achievement.Class.EXPACHIVECLASS_EXPERIENCE, spestr = "到達聚賢莊", Name = "遊歷聚賢莊", Award = ""},
{ID = 515, Class = Achievement.Class.EXPACHIVECLASS_EXPERIENCE, spestr = "到達衡山城", Name = "劍膽琴心", Award = ""},
{ID = 516, Class = Achievement.Class.EXPACHIVECLASS_EXPERIENCE, spestr = "到達福州城", Name = "平潮帆影", Award = ""},
{ID = 517, Class = Achievement.Class.EXPACHIVECLASS_EXPERIENCE, spestr = "到達洛陽城", Name = "洛城飛花", Award = ""},
{ID = 518, Class = Achievement.Class.EXPACHIVECLASS_EXPERIENCE, spestr = "到達余杭", Name = "遊歷余杭", Award = ""},
{ID = 519, Class = Achievement.Class.EXPACHIVECLASS_EXPERIENCE, spestr = "到達少林派", Name = "梵塔擎天", Award = ""},
{ID = 520, Class = Achievement.Class.EXPACHIVECLASS_EXPERIENCE, spestr = "到達武當派", Name = "山雪晴明", Award = ""},
{ID = 521, Class = Achievement.Class.EXPACHIVECLASS_EXPERIENCE, spestr = "到達華山派", Name = "劍破蒼穹", Award = ""},
{ID = 522, Class = Achievement.Class.EXPACHIVECLASS_EXPERIENCE, spestr = "到達衡山派", Name = "劍弦急曲", Award = ""},
{ID = 523, Class = Achievement.Class.EXPACHIVECLASS_EXPERIENCE, spestr = "到達恒山派", Name = "飛閣淩雲", Award = ""},
{ID = 524, Class = Achievement.Class.EXPACHIVECLASS_EXPERIENCE, spestr = "到達日月派", Name = "日月光明", Award = ""},
{ID = 525, Class = Achievement.Class.EXPACHIVECLASS_EXPERIENCE, spestr = "到達逍遙派", Name = "秋水難絕", Award = ""},
{ID = 526, Class = Achievement.Class.EXPACHIVECLASS_EXPERIENCE, spestr = "到達五仙派", Name = "紫藤幽谷", Award = ""},
{ID = 527, Class = Achievement.Class.EXPACHIVECLASS_EXPERIENCE, spestr = "到達唐門派", Name = "霧鎖詭堡", Award = ""},
{ID = 528, Class = Achievement.Class.EXPACHIVECLASS_EXPERIENCE, spestr = "到達峨眉派", Name = "佛光籠黛", Award = ""},
{ID = 980, Class = Achievement.Class.EXPACHIVECLASS_EXPERIENCE, spestr = "到達青城山", Name = "遊歷青城山", Award = ""},
{ID = 981, Class = Achievement.Class.EXPACHIVECLASS_EXPERIENCE, spestr = "到達西安", Name = "遊歷西安", Award = ""},
{ID = 982, Class = Achievement.Class.EXPACHIVECLASS_EXPERIENCE, spestr = "到達劍閣", Name = "遊歷劍閣", Award = ""},
{ID = 983, Class = Achievement.Class.EXPACHIVECLASS_EXPERIENCE, spestr = "到達平涼", Name = "遊歷平涼", Award = ""},
{ID = 984, Class = Achievement.Class.EXPACHIVECLASS_EXPERIENCE, spestr = "到達敦煌", Name = "遊歷敦煌", Award = ""},
{ID = 985, Class = Achievement.Class.EXPACHIVECLASS_EXPERIENCE, spestr = "到達陰山草原", Name = "遊歷陰山草原", Award = ""},
{ID = 529, Class = Achievement.Class.EXPACHIVECLASS_EXPERIENCE, spestr = "到達地火劍池上層", Name = "遊歷地火劍池上層", Award = ""},
{ID = 530, Class = Achievement.Class.EXPACHIVECLASS_EXPERIENCE, spestr = "到達地火劍池下層", Name = "遊歷地火劍池下層", Award = ""},
{ID = 531, Class = Achievement.Class.EXPACHIVECLASS_EXPERIENCE, spestr = "到達苦水沼澤上層", Name = "遊歷苦水沼澤上層", Award = ""},
{ID = 532, Class = Achievement.Class.EXPACHIVECLASS_EXPERIENCE, spestr = "到達苦水沼澤下層", Name = "遊歷苦水沼澤下層", Award = ""},
{ID = 535, Class = Achievement.Class.EXPACHIVECLASS_EXPERIENCE, spestr = "到達野人峽谷上層", Name = "遊歷野人峽谷上層", Award = ""},
{ID = 536, Class = Achievement.Class.EXPACHIVECLASS_EXPERIENCE, spestr = "到達野人峽谷下層", Name = "遊歷野人峽谷下層", Award = ""},
{ID = 533, Class = Achievement.Class.EXPACHIVECLASS_EXPERIENCE, spestr = "到達康巴水寨上層", Name = "遊歷康巴水寨上層", Award = ""},
{ID = 534, Class = Achievement.Class.EXPACHIVECLASS_EXPERIENCE, spestr = "到達康巴水寨下層", Name = "遊歷康巴水寨下層", Award = ""},
{ID = 537, Class = Achievement.Class.EXPACHIVECLASS_EXPERIENCE, spestr = "到達俺答汗陵上層", Name = "遊歷俺答汗陵上層", Award = ""},
{ID = 538, Class = Achievement.Class.EXPACHIVECLASS_EXPERIENCE, spestr = "到達俺答汗陵下層", Name = "遊歷俺答汗陵下層", Award = ""},
{ID = 539, Class = Achievement.Class.EXPACHIVECLASS_EXPERIENCE, spestr = "到達西王母宮上層", Name = "遊歷西王母宮上層", Award = ""},
{ID = 540, Class = Achievement.Class.EXPACHIVECLASS_EXPERIENCE, spestr = "到達西王母宮下層", Name = "遊歷西王母宮下層", Award = ""},
{ID = 685, Class = Achievement.Class.EXPACHIVECLASS_EXPERIENCE, spestr = "在地火劍池擊殺獄火麒麟", Name = "通緝:獄火麒麟", Award = "^f2e5b9徽章獎勵:^f3c065【1級突進徽章】"},
{ID = 686, Class = Achievement.Class.EXPACHIVECLASS_EXPERIENCE, spestr = "在苦水沼澤擊殺怒血蛛王", Name = "通緝:怒血蛛王", Award = "^f2e5b9徽章獎勵:^f3c065【2級突進徽章】"},
{ID = 688, Class = Achievement.Class.EXPACHIVECLASS_EXPERIENCE, spestr = "在野人峽谷擊殺萬獸之王", Name = "通緝:萬獸之王", Award = "^f2e5b9徽章獎勵:^f3c065【4級突進徽章】"},
{ID = 687, Class = Achievement.Class.EXPACHIVECLASS_EXPERIENCE, spestr = "在康巴水寨擊殺鬼丸一斬", Name = "通緝:鬼丸一斬", Award = "^f2e5b9徽章獎勵:^f3c065【3級突進徽章】"},
{ID = 689, Class = Achievement.Class.EXPACHIVECLASS_EXPERIENCE, spestr = "在俺答漢陵擊殺紮木雷", Name = "通緝:紮木雷", Award = ""},
{ID = 705, Class = Achievement.Class.EXPACHIVECLASS_EXPERIENCE, spestr = "在珍獸島擊殺北冥玄狼", Name = "通緝：北冥玄狼", Award = ""},
{ID = 706, Class = Achievement.Class.EXPACHIVECLASS_EXPERIENCE, spestr = "在珍獸島擊殺劍塚護靈", Name = "通緝：劍塚護靈", Award = ""},
{ID = 707, Class = Achievement.Class.EXPACHIVECLASS_EXPERIENCE, spestr = "在珍獸島擊殺活死人蠍", Name = "通緝：活死人蠍", Award = ""},
{ID = 708, Class = Achievement.Class.EXPACHIVECLASS_EXPERIENCE, spestr = "在珍獸島擊殺琅寰神獸", Name = "通緝：琅寰神獸", Award = ""},
{ID = 709, Class = Achievement.Class.EXPACHIVECLASS_EXPERIENCE, spestr = "在珍獸島擊殺聖火蠻牛", Name = "通緝：聖火蠻牛", Award = ""},
{ID = 710, Class = Achievement.Class.EXPACHIVECLASS_EXPERIENCE, spestr = "在絕情谷入口擊殺塞北刀王", Name = "通緝：塞北刀王", Award = ""},
{ID = 711, Class = Achievement.Class.EXPACHIVECLASS_EXPERIENCE, spestr = "在絕情谷入口擊殺雙刀白娘子", Name = "通緝：雙刀紅娘子", Award = ""},
{ID = 712, Class = Achievement.Class.EXPACHIVECLASS_EXPERIENCE, spestr = "在絕情谷入口擊殺大刀王慶", Name = "通緝：大刀王慶", Award = ""},
{ID = 713, Class = Achievement.Class.EXPACHIVECLASS_EXPERIENCE, spestr = "在絕情谷入口擊殺惡行者", Name = "通緝：惡行者", Award = ""},
{ID = 714, Class = Achievement.Class.EXPACHIVECLASS_EXPERIENCE, spestr = "在絕情谷深處擊殺青石巨獸", Name = "通緝：青石巨獸", Award = ""},
{ID = 715, Class = Achievement.Class.EXPACHIVECLASS_EXPERIENCE, spestr = "在絕情谷深處擊殺白髮鬼", Name = "通緝：白髮鬼", Award = ""},
{ID = 716, Class = Achievement.Class.EXPACHIVECLASS_EXPERIENCE, spestr = "在絕情谷深處擊殺鬼槍王", Name = "通緝：鬼槍王", Award = ""},
{ID = 717, Class = Achievement.Class.EXPACHIVECLASS_EXPERIENCE, spestr = "在絕情谷深處擊殺邪道大護法", Name = "通緝：邪道大護法", Award = ""},
{ID = 718, Class = Achievement.Class.EXPACHIVECLASS_EXPERIENCE, spestr = "在絕情谷禁地擊殺公孫滅", Name = "通緝：公孫滅", Award = ""},
{ID = 1211, Class = Achievement.Class.EXPACHIVECLASS_EXPERIENCE, spestr = "在妖樓擊殺金刀客", Name = "通緝：金刀客", Award = ""},
{ID = 1212, Class = Achievement.Class.EXPACHIVECLASS_EXPERIENCE, spestr = "在妖樓擊殺樹甲人", Name = "通緝：樹甲人", Award = ""},
{ID = 1213, Class = Achievement.Class.EXPACHIVECLASS_EXPERIENCE, spestr = "在妖樓擊殺巫妖王", Name = "通緝：巫妖王", Award = ""},
{ID = 1214, Class = Achievement.Class.EXPACHIVECLASS_EXPERIENCE, spestr = "在妖樓擊殺機關獸", Name = "通緝：機關獸", Award = ""},
{ID = 1215, Class = Achievement.Class.EXPACHIVECLASS_EXPERIENCE, spestr = "在妖樓擊殺盜墓者", Name = "通緝：盜墓者", Award = ""},
{ID = 1216, Class = Achievement.Class.EXPACHIVECLASS_EXPERIENCE, spestr = "在妖樓擊殺睚眥", Name = "通緝：睚眥", Award = ""},
{ID = 1217, Class = Achievement.Class.EXPACHIVECLASS_EXPERIENCE, spestr = "在妖樓擊殺玄武", Name = "通緝：玄武", Award = ""},
{ID = 1218, Class = Achievement.Class.EXPACHIVECLASS_EXPERIENCE, spestr = "在妖樓擊殺琅寰", Name = "通緝：琅寰", Award = ""},
{ID = 1219, Class = Achievement.Class.EXPACHIVECLASS_EXPERIENCE, spestr = "在妖樓擊殺麒麟", Name = "通緝：麒麟", Award = ""},
{ID = 1220, Class = Achievement.Class.EXPACHIVECLASS_EXPERIENCE, spestr = "在妖樓擊殺陸吾", Name = "通緝：陸吾", Award = ""},
{ID = 1221, Class = Achievement.Class.EXPACHIVECLASS_EXPERIENCE, spestr = "在妖樓擊殺水晶冰川女王", Name = "通緝：水晶冰川女王", Award = ""},
{ID = 691, Class = Achievement.Class.EXPACHIVECLASS_EXPERIENCE, spestr = "在福州郊外擊殺惡徒浪劍馮諒", Name = "通緝:浪劍馮諒", Award = "^f2e5b9徽章獎勵:^f3c065【1級防禦徽章】"},
{ID = 692, Class = Achievement.Class.EXPACHIVECLASS_EXPERIENCE, spestr = "在衡山郊外擊殺惡徒血手周陌", Name = "通緝:血手周陌", Award = "^f2e5b9徽章獎勵:^f3c065【2級防禦徽章】"},
{ID = 693, Class = Achievement.Class.EXPACHIVECLASS_EXPERIENCE, spestr = "在武當山擊殺惡徒石斧魏均", Name = "通緝:石斧魏均", Award = "^f2e5b9徽章獎勵:^f3c065【3級防禦徽章】"},
{ID = 694, Class = Achievement.Class.EXPACHIVECLASS_EXPERIENCE, spestr = "在華山擊殺惡徒狂刀紀凱", Name = "通緝:狂刀紀凱", Award = "^f2e5b9徽章獎勵:^f3c065【4級防禦徽章】"},
{ID = 695, Class = Achievement.Class.EXPACHIVECLASS_EXPERIENCE, spestr = "在藥王谷擊殺惡徒鐵背姚堅", Name = "通緝:鐵背姚堅", Award = "^f2e5b9徽章獎勵:^f3c065【1級筋骨徽章】"},
{ID = 696, Class = Achievement.Class.EXPACHIVECLASS_EXPERIENCE, spestr = "在少室山擊殺惡徒銅爪孫潮", Name = "通緝:銅爪孫潮", Award = "^f2e5b9徽章獎勵:^f3c065【2級筋骨徽章】"},
{ID = 697, Class = Achievement.Class.EXPACHIVECLASS_EXPERIENCE, spestr = "在朱仙鎮擊殺惡徒銀槍郭邯", Name = "通緝:銀槍郭邯", Award = "^f2e5b9徽章獎勵:^f3c065【3級筋骨徽章】"},
{ID = 698, Class = Achievement.Class.EXPACHIVECLASS_EXPERIENCE, spestr = "在五霸岡擊殺惡徒炎錘萬青", Name = "通緝:炎錘萬青", Award = "^f2e5b9徽章獎勵:^f3c065【4級筋骨徽章】"},
{ID = 699, Class = Achievement.Class.EXPACHIVECLASS_EXPERIENCE, spestr = "在泰山擊殺惡徒金鏟呂原", Name = "通緝:金鏟呂原", Award = ""},
{ID = 700, Class = Achievement.Class.EXPACHIVECLASS_EXPERIENCE, spestr = "在綠竹幻想鄉擊殺美猴王", Name = "通緝:美猴王", Award = ""},
{ID = 701, Class = Achievement.Class.EXPACHIVECLASS_EXPERIENCE, spestr = "在綠竹幻想鄉擊殺黑熊王", Name = "通緝:黑熊王", Award = ""},
{ID = 680, Class = Achievement.Class.EXPACHIVECLASS_EXPERIENCE, spestr = "擊殺任意2000只怪", Name = "擊殺2000只怪", Award = ""},
{ID = 681, Class = Achievement.Class.EXPACHIVECLASS_EXPERIENCE, spestr = "再次擊殺任意10000只怪", Name = "擊殺10000只怪", Award = "^f2e5b9獎勵：^f3c065開啟1個徽章位"},
{ID = 682, Class = Achievement.Class.EXPACHIVECLASS_EXPERIENCE, spestr = "再次擊殺任意40000只怪", Name = "擊殺40000只怪", Award = ""},
{ID = 683, Class = Achievement.Class.EXPACHIVECLASS_EXPERIENCE, spestr = "再次擊殺任意200000只怪", Name = "擊殺200000只怪", Award = ""},
{ID = 684, Class = Achievement.Class.EXPACHIVECLASS_EXPERIENCE, spestr = "再次擊殺任意5000000只怪", Name = "擊殺5000000只怪", Award = ""},
{ID = 895, Class = Achievement.Class.EXPACHIVECLASS_EXPERIENCE, spestr = "完成15次江湖榜", Name = "15次江湖榜", Award = ""},
{ID = 896, Class = Achievement.Class.EXPACHIVECLASS_EXPERIENCE, spestr = "再次完成60次江湖榜", Name = "60次江湖榜", Award = "^f2e5b9徽章獎勵:^f3c065【1級體魄徽章】"},
{ID = 897, Class = Achievement.Class.EXPACHIVECLASS_EXPERIENCE, spestr = "再次完成240次江湖榜", Name = "240次江湖榜", Award = "^f2e5b9徽章獎勵:^f3c065【2級體魄徽章】"},
{ID = 898, Class = Achievement.Class.EXPACHIVECLASS_EXPERIENCE, spestr = "再次完成960次江湖榜", Name = "960次江湖榜", Award = "^f2e5b9徽章獎勵:^f3c065【3級體魄徽章】"},
{ID = 899, Class = Achievement.Class.EXPACHIVECLASS_EXPERIENCE, spestr = "再次完成3000次江湖榜", Name = "3000次江湖榜", Award = "^f2e5b9徽章獎勵:^f3c065【4級體魄徽章】"},
{ID = 935, Class = Achievement.Class.EXPACHIVECLASS_EXPERIENCE, spestr = "登上落雁塔頂", Name = "高處不勝寒", Award = ""},
{ID = 137, Class = Achievement.Class.EXPACHIVECLASS_COMBAT, spestr = "進行一次切磋", Name = "第一場比武", Award = ""},
{ID = 138, Class = Achievement.Class.EXPACHIVECLASS_COMBAT, spestr = "獲得1次切磋勝利", Name = "比武獲勝", Award = ""},
{ID = 140, Class = Achievement.Class.EXPACHIVECLASS_COMBAT, spestr = "再次切磋獲得100場勝利", Name = "大獲全勝", Award = ""},
{ID = 141, Class = Achievement.Class.EXPACHIVECLASS_COMBAT, spestr = "再次切磋輸掉100場", Name = "一敗塗地", Award = ""},
{ID = 142, Class = Achievement.Class.EXPACHIVECLASS_COMBAT, spestr = "完成切磋相關成就", Name = "入魔武癡", Award = ""},
{ID = 176, Class = Achievement.Class.EXPACHIVECLASS_COMBAT, spestr = "殺氣值達到50", Name = "冷血殺手", Award = ""},
{ID = 177, Class = Achievement.Class.EXPACHIVECLASS_COMBAT, spestr = "殺氣值達到100", Name = "武林屠夫", Award = ""},
{ID = 178, Class = Achievement.Class.EXPACHIVECLASS_COMBAT, spestr = "殺氣值達到500", Name = "百人斬首", Award = ""},
{ID = 179, Class = Achievement.Class.EXPACHIVECLASS_COMBAT, spestr = "殺氣值達到999", Name = "殺人狂魔", Award = ""},
{ID = 381, Class = Achievement.Class.EXPACHIVECLASS_COMBAT, Name = "酒肆入門", Award = ""},
{ID = 382, Class = Achievement.Class.EXPACHIVECLASS_COMBAT, Name = "酒肆俠客", Award = ""},
{ID = 383, Class = Achievement.Class.EXPACHIVECLASS_COMBAT, Name = "酒肆英雄", Award = ""},
{ID = 344, Class = Achievement.Class.EXPACHIVECLASS_COMBAT, Name = "鏢局入門", Award = ""},
{ID = 345, Class = Achievement.Class.EXPACHIVECLASS_COMBAT, Name = "鏢局俠客", Award = ""},
{ID = 346, Class = Achievement.Class.EXPACHIVECLASS_COMBAT, Name = "鏢局英雄", Award = ""},
{ID = 301, Class = Achievement.Class.EXPACHIVECLASS_COMBAT, Name = "青城入門", Award = ""},
{ID = 302, Class = Achievement.Class.EXPACHIVECLASS_COMBAT, Name = "青城俠客", Award = ""},
{ID = 303, Class = Achievement.Class.EXPACHIVECLASS_COMBAT, Name = "青城英雄", Award = ""},
{ID = 396, Class = Achievement.Class.EXPACHIVECLASS_COMBAT, Name = "孤島入門", Award = ""},
{ID = 397, Class = Achievement.Class.EXPACHIVECLASS_COMBAT, Name = "孤島俠客", Award = ""},
{ID = 398, Class = Achievement.Class.EXPACHIVECLASS_COMBAT, Name = "孤島英雄", Award = "^f2e5b9徽章獎勵:^f3c065【1級全能徽章】"},
{ID = 736, Class = Achievement.Class.EXPACHIVECLASS_COMBAT, Name = "山崖入門", Award = ""},
{ID = 737, Class = Achievement.Class.EXPACHIVECLASS_COMBAT, Name = "山崖俠客", Award = ""},
{ID = 738, Class = Achievement.Class.EXPACHIVECLASS_COMBAT, Name = "山崖英雄", Award = "^f2e5b9徽章獎勵:^f3c065【2級全能徽章】"},
{ID = 349, Class = Achievement.Class.EXPACHIVECLASS_COMBAT, Name = "魔窟入門", Award = ""},
{ID = 350, Class = Achievement.Class.EXPACHIVECLASS_COMBAT, Name = "魔窟俠客", Award = ""},
{ID = 351, Class = Achievement.Class.EXPACHIVECLASS_COMBAT, Name = "魔窟英雄", Award = "^f2e5b9徽章獎勵:^f3c065【3級全能徽章】"},
{ID = 352, Class = Achievement.Class.EXPACHIVECLASS_COMBAT, Name = "魔窟盟主", Award = ""},
{ID = 339, Class = Achievement.Class.EXPACHIVECLASS_COMBAT, Name = "東廠入門", Award = ""},
{ID = 340, Class = Achievement.Class.EXPACHIVECLASS_COMBAT, Name = "東廠俠客", Award = ""},
{ID = 341, Class = Achievement.Class.EXPACHIVECLASS_COMBAT, Name = "東廠英雄", Award = "^f2e5b9徽章獎勵:^f3c065【4級全能徽章】"},
{ID = 342, Class = Achievement.Class.EXPACHIVECLASS_COMBAT, Name = "東廠盟主", Award = ""},
{ID = 740, Class = Achievement.Class.EXPACHIVECLASS_COMBAT, Name = "連雲入門", Award = ""},
{ID = 741, Class = Achievement.Class.EXPACHIVECLASS_COMBAT, Name = "連雲俠客", Award = ""},
{ID = 742, Class = Achievement.Class.EXPACHIVECLASS_COMBAT, Name = "連雲英雄", Award = ""},
{ID = 743, Class = Achievement.Class.EXPACHIVECLASS_COMBAT, Name = "連雲盟主", Award = ""},
{ID = 744, Class = Achievement.Class.EXPACHIVECLASS_COMBAT, Name = "前哨入門", Award = ""},
{ID = 745, Class = Achievement.Class.EXPACHIVECLASS_COMBAT, Name = "前哨俠客", Award = ""},
{ID = 746, Class = Achievement.Class.EXPACHIVECLASS_COMBAT, Name = "前哨英雄", Award = ""},
{ID = 747, Class = Achievement.Class.EXPACHIVECLASS_COMBAT, Name = "前哨盟主", Award = ""},
{ID = 748, Class = Achievement.Class.EXPACHIVECLASS_COMBAT, Name = "本營入門", Award = ""},
{ID = 749, Class = Achievement.Class.EXPACHIVECLASS_COMBAT, Name = "本營俠客", Award = ""},
{ID = 750, Class = Achievement.Class.EXPACHIVECLASS_COMBAT, Name = "本營英雄", Award = ""},
{ID = 751, Class = Achievement.Class.EXPACHIVECLASS_COMBAT, Name = "本營盟主", Award = ""},
{ID = 401, Class = Achievement.Class.EXPACHIVECLASS_COMBAT, Name = "覆滅入門", Award = ""},
{ID = 402, Class = Achievement.Class.EXPACHIVECLASS_COMBAT, Name = "覆滅俠客", Award = ""},
{ID = 403, Class = Achievement.Class.EXPACHIVECLASS_COMBAT, Name = "覆滅英雄", Award = ""},
{ID = 404, Class = Achievement.Class.EXPACHIVECLASS_COMBAT, Name = "覆滅盟主", Award = ""},
{ID = 386, Class = Achievement.Class.EXPACHIVECLASS_COMBAT, Name = "莊外入門", Award = ""},
{ID = 387, Class = Achievement.Class.EXPACHIVECLASS_COMBAT, Name = "莊外俠客", Award = ""},
{ID = 388, Class = Achievement.Class.EXPACHIVECLASS_COMBAT, Name = "莊外英雄", Award = ""},
{ID = 389, Class = Achievement.Class.EXPACHIVECLASS_COMBAT, Name = "莊外盟主", Award = ""},
{ID = 756, Class = Achievement.Class.EXPACHIVECLASS_COMBAT, Name = "地牢入門", Award = ""},
{ID = 757, Class = Achievement.Class.EXPACHIVECLASS_COMBAT, Name = "地牢俠客", Award = ""},
{ID = 758, Class = Achievement.Class.EXPACHIVECLASS_COMBAT, Name = "地牢英雄", Award = ""},
{ID = 759, Class = Achievement.Class.EXPACHIVECLASS_COMBAT, Name = "地牢盟主", Award = ""},
{ID = 976, Class = Achievement.Class.EXPACHIVECLASS_COMBAT, Name = "寶塔入門", Award = ""},
{ID = 977, Class = Achievement.Class.EXPACHIVECLASS_COMBAT, Name = "寶塔俠客", Award = ""},
{ID = 978, Class = Achievement.Class.EXPACHIVECLASS_COMBAT, Name = "寶塔英雄", Award = ""},
{ID = 979, Class = Achievement.Class.EXPACHIVECLASS_COMBAT, Name = "寶塔盟主", Award = ""},
{ID = 1241, Class = Achievement.Class.EXPACHIVECLASS_COMBAT, Name = "山路入門", Award = ""},
{ID = 1242, Class = Achievement.Class.EXPACHIVECLASS_COMBAT, Name = "山路俠客", Award = ""},
{ID = 1243, Class = Achievement.Class.EXPACHIVECLASS_COMBAT, Name = "山路英雄", Award = ""},
{ID = 1244, Class = Achievement.Class.EXPACHIVECLASS_COMBAT, Name = "山路盟主", Award = ""},
{ID = 1245, Class = Achievement.Class.EXPACHIVECLASS_COMBAT, Name = "山巔入門", Award = ""},
{ID = 1246, Class = Achievement.Class.EXPACHIVECLASS_COMBAT, Name = "山巔俠客", Award = ""},
{ID = 1247, Class = Achievement.Class.EXPACHIVECLASS_COMBAT, Name = "山巔英雄", Award = ""},
{ID = 1248, Class = Achievement.Class.EXPACHIVECLASS_COMBAT, Name = "山巔盟主", Award = ""},
{ID = 1237, Class = Achievement.Class.EXPACHIVECLASS_COMBAT, Name = "古鎮入門", Award = ""},
{ID = 1238, Class = Achievement.Class.EXPACHIVECLASS_COMBAT, Name = "古鎮俠客", Award = ""},
{ID = 1239, Class = Achievement.Class.EXPACHIVECLASS_COMBAT, Name = "古鎮英雄", Award = ""},
{ID = 1240, Class = Achievement.Class.EXPACHIVECLASS_COMBAT, Name = "古鎮盟主", Award = ""},
{ID = 760, Class = Achievement.Class.EXPACHIVECLASS_COMBAT, spestr = "完成綠竹幻想鄉活動", Name = "綠竹幻想鄉", Award = "^f2e5b9徽章獎勵:^f3c065【1級力道徽章】"},
{ID = 761, Class = Achievement.Class.EXPACHIVECLASS_COMBAT, spestr = "再次完成10次綠竹幻想鄉活動", Name = "綠竹幻想鄉(10)", Award = "^f2e5b9徽章獎勵:^f3c065【2級力道徽章】"},
{ID = 762, Class = Achievement.Class.EXPACHIVECLASS_COMBAT, spestr = "再次完成50次綠竹幻想鄉活動", Name = "綠竹幻想鄉(50)", Award = "^f2e5b9徽章獎勵:^f3c065【3級力道徽章】"},
{ID = 763, Class = Achievement.Class.EXPACHIVECLASS_COMBAT, spestr = "再次完成100次綠竹幻想鄉活動", Name = "綠竹幻想鄉(100)", Award = "^f2e5b9徽章獎勵:^f3c065【4級力道徽章】"},
{ID = 764, Class = Achievement.Class.EXPACHIVECLASS_COMBAT, spestr = "完成百毒飛蛾洞活動", Name = "百毒飛蛾洞", Award = ""},
{ID = 765, Class = Achievement.Class.EXPACHIVECLASS_COMBAT, spestr = "再次完成10次百毒飛蛾洞活動", Name = "百毒飛蛾洞(10)", Award = ""},
{ID = 766, Class = Achievement.Class.EXPACHIVECLASS_COMBAT, spestr = "再次完成50次百毒飛蛾洞活動", Name = "百毒飛蛾洞(50)", Award = ""},
{ID = 767, Class = Achievement.Class.EXPACHIVECLASS_COMBAT, spestr = "再次完成100次百毒飛蛾洞活動", Name = "百毒飛蛾洞(100)", Award = ""},
{ID = 768, Class = Achievement.Class.EXPACHIVECLASS_COMBAT, spestr = "完成百毒蜘蛛巢活動", Name = "百毒蜘蛛巢", Award = ""},
{ID = 769, Class = Achievement.Class.EXPACHIVECLASS_COMBAT, spestr = "再次完成10次百毒蜘蛛巢活動", Name = "百毒蜘蛛巢(10)", Award = ""},
{ID = 770, Class = Achievement.Class.EXPACHIVECLASS_COMBAT, spestr = "再次完成50次百毒蜘蛛巢活動", Name = "百毒蜘蛛巢(50)", Award = ""},
{ID = 771, Class = Achievement.Class.EXPACHIVECLASS_COMBAT, spestr = "再次完成100次百毒蜘蛛巢活動", Name = "百毒蜘蛛巢(100)", Award = ""},
{ID = 772, Class = Achievement.Class.EXPACHIVECLASS_COMBAT, spestr = "完成百毒蜈蚣穴活動", Name = "百毒蜈蚣穴", Award = ""},
{ID = 773, Class = Achievement.Class.EXPACHIVECLASS_COMBAT, spestr = "再次完成10次百毒蜈蚣穴活動", Name = "百毒蜈蚣穴(10)", Award = ""},
{ID = 774, Class = Achievement.Class.EXPACHIVECLASS_COMBAT, spestr = "再次完成50次百毒蜈蚣穴活動", Name = "百毒蜈蚣穴(50)", Award = ""},
{ID = 775, Class = Achievement.Class.EXPACHIVECLASS_COMBAT, spestr = "再次完成100次百毒蜈蚣穴活動", Name = "百毒蜈蚣穴(100)", Award = ""},
{ID = 776, Class = Achievement.Class.EXPACHIVECLASS_COMBAT, spestr = "完成龍嶺迷窟活動", Name = "龍嶺迷窟", Award = "^f2e5b9徽章獎勵:^f3c065【1級內勁徽章】"},
{ID = 777, Class = Achievement.Class.EXPACHIVECLASS_COMBAT, spestr = "再次完成10次龍嶺迷窟活動", Name = "龍嶺迷窟(10)", Award = "^f2e5b9徽章獎勵:^f3c065【2級內勁徽章】"},
{ID = 778, Class = Achievement.Class.EXPACHIVECLASS_COMBAT, spestr = "再次完成50次龍嶺迷窟活動", Name = "龍嶺迷窟(50)", Award = "^f2e5b9徽章獎勵:^f3c065【3級內勁徽章】"},
{ID = 779, Class = Achievement.Class.EXPACHIVECLASS_COMBAT, spestr = "再次完成100次龍嶺迷窟活動", Name = "龍嶺迷窟(100)", Award = "^f2e5b9徽章獎勵:^f3c065【4級內勁徽章】"},
{ID = 986, Class = Achievement.Class.EXPACHIVECLASS_COMBAT, spestr = "完成絕情谷活動", Name = "絕情谷", Award = ""},
{ID = 987, Class = Achievement.Class.EXPACHIVECLASS_COMBAT, spestr = "再次完成10次絕情谷活動", Name = "絕情谷(10)", Award = ""},
{ID = 988, Class = Achievement.Class.EXPACHIVECLASS_COMBAT, spestr = "再次完成50次絕情谷活動", Name = "絕情谷(50)", Award = ""},
{ID = 989, Class = Achievement.Class.EXPACHIVECLASS_COMBAT, spestr = "再次完成100次絕情谷活動", Name = "絕情谷(100)", Award = ""},
{ID = 1222, Class = Achievement.Class.EXPACHIVECLASS_COMBAT, spestr = "完成妖樓活動", Name = "妖樓", Award = ""},
{ID = 1223, Class = Achievement.Class.EXPACHIVECLASS_COMBAT, spestr = "再次完成10次妖樓活動", Name = "妖樓（10）", Award = ""},
{ID = 1224, Class = Achievement.Class.EXPACHIVECLASS_COMBAT, spestr = "再次完成50次妖樓活動", Name = "妖樓（50）", Award = ""},
{ID = 1225, Class = Achievement.Class.EXPACHIVECLASS_COMBAT, spestr = "再次完成100次妖樓活動", Name = "妖樓（100）", Award = ""},
{ID = 1226, Class = Achievement.Class.EXPACHIVECLASS_COMBAT, spestr = "每天完成一次九層妖樓活動", Name = "九層妖樓", Award = ""},
{ID = 1227, Class = Achievement.Class.EXPACHIVECLASS_COMBAT, spestr = "每天完成兩次九層妖樓活動", Name = "九層妖樓（2）", Award = ""},
{ID = 1228, Class = Achievement.Class.EXPACHIVECLASS_COMBAT, spestr = "每天完成三次九層妖樓活動", Name = "九層妖樓（3）", Award = ""},
{ID = 1229, Class = Achievement.Class.EXPACHIVECLASS_COMBAT, spestr = "每天完成兩次龍嶺迷窟活動", Name = "每日龍嶺迷窟（2）", Award = ""},
{ID = 305, Class = Achievement.Class.EXPACHIVECLASS_WUSHU, spestr = "競技段位達到2級", Name = "競技段位成就1", Award = "^f2e5b9徽章獎勵:^f3c065【1級強攻徽章】"},
{ID = 306, Class = Achievement.Class.EXPACHIVECLASS_WUSHU, spestr = "競技段位達到5級", Name = "競技段位成就2", Award = "^f2e5b9徽章獎勵:^f3c065【2級強攻徽章】"},
{ID = 307, Class = Achievement.Class.EXPACHIVECLASS_WUSHU, spestr = "競技段位達到11級", Name = "競技段位成就3", Award = "^f2e5b9徽章獎勵:^f3c065【3級強攻徽章】"},
{ID = 308, Class = Achievement.Class.EXPACHIVECLASS_WUSHU, spestr = "競技段位達到21級", Name = "競技段位成就4", Award = "^f2e5b9徽章獎勵:^f3c065【4級強攻徽章】"},
{ID = 309, Class = Achievement.Class.EXPACHIVECLASS_WUSHU, Name = "競技擂臺對戰次數1", Award = "^f2e5b9徽章獎勵:^f3c065【1級抵禦徽章】"},
{ID = 310, Class = Achievement.Class.EXPACHIVECLASS_WUSHU, Name = "競技擂臺對戰次數2", Award = "^f2e5b9徽章獎勵:^f3c065【2級抵禦徽章】"},
{ID = 311, Class = Achievement.Class.EXPACHIVECLASS_WUSHU, Name = "競技擂臺對戰次數3", Award = "^f2e5b9徽章獎勵:^f3c065【3級抵禦徽章】"},
{ID = 312, Class = Achievement.Class.EXPACHIVECLASS_WUSHU, Name = "競技擂臺對戰次數4", Award = "^f2e5b9徽章獎勵:^f3c065【4級抵禦徽章】"},
{ID = 313, Class = Achievement.Class.EXPACHIVECLASS_WUSHU, Name = "競技擂臺連勝次數1", Award = ""},
{ID = 314, Class = Achievement.Class.EXPACHIVECLASS_WUSHU, Name = "競技擂臺連勝次數2", Award = ""},
{ID = 315, Class = Achievement.Class.EXPACHIVECLASS_WUSHU, Name = "競技擂臺連勝次數3", Award = ""},
{ID = 316, Class = Achievement.Class.EXPACHIVECLASS_WUSHU, Name = "競技擂臺連勝次數4", Award = ""},
{ID = 427, Class = Achievement.Class.EXPACHIVECLASS_WUSHU, spestr = "擊殺1名玩家", Name = "一血!", Award = ""},
{ID = 428, Class = Achievement.Class.EXPACHIVECLASS_WUSHU, spestr = "再次擊殺100名玩家", Name = "暴走!", Award = ""},
{ID = 429, Class = Achievement.Class.EXPACHIVECLASS_WUSHU, spestr = "再次擊殺1000名玩家", Name = "妖孽!", Award = ""},
{ID = 430, Class = Achievement.Class.EXPACHIVECLASS_WUSHU, spestr = "再次擊殺10000名玩家", Name = "超神!", Award = ""},
{ID = 541, Class = Achievement.Class.EXPACHIVECLASS_WUSHU, spestr = "獲得1張秘笈殘頁", Name = "獲得秘笈殘頁", Award = ""},
{ID = 542, Class = Achievement.Class.EXPACHIVECLASS_WUSHU, spestr = "再次獲得20張秘笈殘頁", Name = "獲得秘笈殘頁", Award = ""},
{ID = 543, Class = Achievement.Class.EXPACHIVECLASS_WUSHU, spestr = "再次獲得100張秘笈殘頁", Name = "獲得秘笈殘頁", Award = ""},
{ID = 544, Class = Achievement.Class.EXPACHIVECLASS_WUSHU, spestr = "再次獲得500張秘笈殘頁", Name = "獲得秘笈殘頁", Award = ""},
{ID = 545, Class = Achievement.Class.EXPACHIVECLASS_WUSHU, spestr = "獲得1張高級秘笈殘頁", Name = "獲得高級秘笈殘頁", Award = ""},
{ID = 546, Class = Achievement.Class.EXPACHIVECLASS_WUSHU, spestr = "再次獲得20張高級秘笈殘頁", Name = "獲得高級秘笈殘頁", Award = ""},
{ID = 547, Class = Achievement.Class.EXPACHIVECLASS_WUSHU, spestr = "再次獲得100張高級秘笈殘頁", Name = "獲得高級秘笈殘頁", Award = ""},
{ID = 548, Class = Achievement.Class.EXPACHIVECLASS_WUSHU, spestr = "再次獲得500張高級秘笈殘頁", Name = "獲得高級秘笈殘頁", Award = ""},
{ID = 551, Class = Achievement.Class.EXPACHIVECLASS_WUSHU, spestr = "心法等級達到1級", Name = "心法等級達到1級", Award = ""},
{ID = 552, Class = Achievement.Class.EXPACHIVECLASS_WUSHU, spestr = "心法等級達到40級", Name = "心法等級達到40級", Award = ""},
{ID = 553, Class = Achievement.Class.EXPACHIVECLASS_WUSHU, spestr = "心法等級達到80級", Name = "心法等級達到80級", Award = "^f2e5b9獎勵：^f3c065開啟1個徽章位"},
{ID = 554, Class = Achievement.Class.EXPACHIVECLASS_WUSHU, spestr = "心法等級達到120級", Name = "心法等級達到120級", Award = ""},
{ID = 555, Class = Achievement.Class.EXPACHIVECLASS_WUSHU, spestr = "心法等級達到160級", Name = "心法等級達到160級", Award = ""},
{ID = 556, Class = Achievement.Class.EXPACHIVECLASS_WUSHU, spestr = "心法等級達到200級", Name = "心法等級達到200級", Award = ""},
{ID = 557, Class = Achievement.Class.EXPACHIVECLASS_WUSHU, spestr = "啟動1個穴位", Name = "啟動1個穴位", Award = ""},
{ID = 561, Class = Achievement.Class.EXPACHIVECLASS_WUSHU, spestr = "重置1次心法", Name = "重置心法", Award = ""},
{ID = 562, Class = Achievement.Class.EXPACHIVECLASS_WUSHU, spestr = "再次重置10次心法", Name = "重置10次心法", Award = ""},
{ID = 563, Class = Achievement.Class.EXPACHIVECLASS_WUSHU, spestr = "再次重置30次心法", Name = "重置30次心法", Award = ""},
{ID = 564, Class = Achievement.Class.EXPACHIVECLASS_WUSHU, spestr = "再次重置50次心法", Name = "重置50次心法", Award = ""},
{ID = 955, Class = Achievement.Class.EXPACHIVECLASS_WUSHU, spestr = "武鬥值達到500點", Name = "武鬥值", Award = ""},
{ID = 956, Class = Achievement.Class.EXPACHIVECLASS_WUSHU, spestr = "武鬥值達到5000點", Name = "武鬥值", Award = ""},
{ID = 957, Class = Achievement.Class.EXPACHIVECLASS_WUSHU, spestr = "武鬥值達到50000點", Name = "武鬥值", Award = ""},
{ID = 958, Class = Achievement.Class.EXPACHIVECLASS_WUSHU, spestr = "武鬥值達到150000點", Name = "武鬥值", Award = ""},
{ID = 916, Class = Achievement.Class.EXPACHIVECLASS_WUSHU, spestr = "學會身法扶搖", Name = "踏霧行雲", Award = ""},
{ID = 917, Class = Achievement.Class.EXPACHIVECLASS_WUSHU, spestr = "學會身法穿雲", Name = "攬星邀月", Award = ""},
{ID = 918, Class = Achievement.Class.EXPACHIVECLASS_WUSHU, spestr = "學會身法雁行", Name = "乘風之翼", Award = ""},
{ID = 919, Class = Achievement.Class.EXPACHIVECLASS_WUSHU, spestr = "學會身法水上漂", Name = "浮光掠影", Award = ""},
{ID = 920, Class = Achievement.Class.EXPACHIVECLASS_WUSHU, spestr = "學會野球拳", Name = "野球拳", Award = ""},
{ID = 921, Class = Achievement.Class.EXPACHIVECLASS_WUSHU, spestr = "學會太祖長拳", Name = "太祖長拳", Award = ""},
{ID = 922, Class = Achievement.Class.EXPACHIVECLASS_WUSHU, spestr = "學會掃葉腿法", Name = "掃葉腿法", Award = ""},
{ID = 923, Class = Achievement.Class.EXPACHIVECLASS_WUSHU, spestr = "學會天殘腳", Name = "天殘腳", Award = ""},
{ID = 924, Class = Achievement.Class.EXPACHIVECLASS_WUSHU, spestr = "學會美女拳法", Name = "美女拳法", Award = ""},
{ID = 925, Class = Achievement.Class.EXPACHIVECLASS_WUSHU, spestr = "學會沾衣十八跌", Name = "沾衣十八跌", Award = ""},
{ID = 926, Class = Achievement.Class.EXPACHIVECLASS_WUSHU, spestr = "學會純陽無極功", Name = "純陽無極功", Award = ""},
{ID = 927, Class = Achievement.Class.EXPACHIVECLASS_WUSHU, spestr = "學會寒冰神掌", Name = "寒冰神掌", Award = ""},
{ID = 928, Class = Achievement.Class.EXPACHIVECLASS_WUSHU, spestr = "學會紫霞神功", Name = "紫霞神功", Award = ""},
{ID = 929, Class = Achievement.Class.EXPACHIVECLASS_WUSHU, spestr = "學會空明拳", Name = "空明拳", Award = ""},
{ID = 930, Class = Achievement.Class.EXPACHIVECLASS_WUSHU, spestr = "學會左右互搏術", Name = "左右互搏術", Award = ""},
{ID = 931, Class = Achievement.Class.EXPACHIVECLASS_WUSHU, spestr = "學會一陽指", Name = "一陽指", Award = ""},
{ID = 932, Class = Achievement.Class.EXPACHIVECLASS_WUSHU, spestr = "學會大海無量", Name = "大海無量", Award = ""},
{ID = 933, Class = Achievement.Class.EXPACHIVECLASS_WUSHU, spestr = "學會生死符", Name = "生死符", Award = ""},
{ID = 934, Class = Achievement.Class.EXPACHIVECLASS_WUSHU, spestr = "學會鬥轉星移", Name = "鬥轉星移", Award = ""},
{ID = 994, Class = Achievement.Class.EXPACHIVECLASS_WUSHU, spestr = "學會清心普善咒", Name = "清心普善咒", Award = ""},
{ID = 995, Class = Achievement.Class.EXPACHIVECLASS_WUSHU, spestr = "學會如來神掌", Name = "如來神掌", Award = ""},
{ID = 996, Class = Achievement.Class.EXPACHIVECLASS_WUSHU, spestr = "學會易筋經", Name = "易筋經", Award = ""},
{ID = 997, Class = Achievement.Class.EXPACHIVECLASS_WUSHU, spestr = "學會化功大法", Name = "化功大法", Award = ""},
{ID = 998, Class = Achievement.Class.EXPACHIVECLASS_WUSHU, spestr = "學會龍象般若功", Name = "龍象般若功", Award = ""},
{ID = 999, Class = Achievement.Class.EXPACHIVECLASS_WUSHU, spestr = "學會聖火令", Name = "聖火令", Award = ""},
{ID = 1000, Class = Achievement.Class.EXPACHIVECLASS_WUSHU, spestr = "學會黯然銷魂掌", Name = "黯然銷魂掌", Award = ""},
{ID = 1001, Class = Achievement.Class.EXPACHIVECLASS_WUSHU, spestr = "學會降龍十八掌", Name = "降龍十八掌", Award = ""},
{ID = 1002, Class = Achievement.Class.EXPACHIVECLASS_WUSHU, spestr = "學會乾坤大挪移", Name = "乾坤大挪移", Award = ""},
{ID = 1003, Class = Achievement.Class.EXPACHIVECLASS_WUSHU, spestr = "學會吸星大法", Name = "吸星大法", Award = ""},
{ID = 1004, Class = Achievement.Class.EXPACHIVECLASS_WUSHU, spestr = "學會葵花寶典", Name = "葵花寶典", Award = ""},
{ID = 1005, Class = Achievement.Class.EXPACHIVECLASS_WUSHU, spestr = "學會淩波微步", Name = "淩波微步", Award = ""},
{ID = 584, Class = Achievement.Class.EXPACHIVECLASS_COMMERCE, spestr = "鍛造技能達到3級", Name = "鍛造3級", Award = ""},
{ID = 585, Class = Achievement.Class.EXPACHIVECLASS_COMMERCE, spestr = "鍛造技能達到6級", Name = "鍛造6級", Award = ""},
{ID = 586, Class = Achievement.Class.EXPACHIVECLASS_COMMERCE, spestr = "鍛造技能達到8級", Name = "鍛造8級", Award = ""},
{ID = 589, Class = Achievement.Class.EXPACHIVECLASS_COMMERCE, spestr = "縫紉技能達到3級", Name = "縫紉3級", Award = ""},
{ID = 590, Class = Achievement.Class.EXPACHIVECLASS_COMMERCE, spestr = "縫紉技能達到6級", Name = "縫紉6級", Award = ""},
{ID = 591, Class = Achievement.Class.EXPACHIVECLASS_COMMERCE, spestr = "縫紉技能達到8級", Name = "縫紉8級", Award = ""},
{ID = 594, Class = Achievement.Class.EXPACHIVECLASS_COMMERCE, spestr = "巧匠技能達到3級", Name = "巧匠3級", Award = ""},
{ID = 595, Class = Achievement.Class.EXPACHIVECLASS_COMMERCE, spestr = "巧匠技能達到6級", Name = "巧匠6級", Award = ""},
{ID = 596, Class = Achievement.Class.EXPACHIVECLASS_COMMERCE, spestr = "巧匠技能達到8級", Name = "巧匠8級", Award = ""},
{ID = 599, Class = Achievement.Class.EXPACHIVECLASS_COMMERCE, spestr = "烹飪技能達到3級", Name = "烹飪3級", Award = ""},
{ID = 600, Class = Achievement.Class.EXPACHIVECLASS_COMMERCE, spestr = "烹飪技能達到6級", Name = "烹飪6級", Award = ""},
{ID = 601, Class = Achievement.Class.EXPACHIVECLASS_COMMERCE, spestr = "烹飪技能達到8級", Name = "烹飪8級", Award = ""},
{ID = 604, Class = Achievement.Class.EXPACHIVECLASS_COMMERCE, spestr = "製藥技能達到3級", Name = "製藥3級", Award = ""},
{ID = 605, Class = Achievement.Class.EXPACHIVECLASS_COMMERCE, spestr = "製藥技能達到6級", Name = "製藥6級", Award = ""},
{ID = 606, Class = Achievement.Class.EXPACHIVECLASS_COMMERCE, spestr = "製藥技能達到8級", Name = "製藥8級", Award = ""},
{ID = 608, Class = Achievement.Class.EXPACHIVECLASS_COMMERCE, spestr = "所有生產技能達到3級", Name = "所有生產技能達到3級", Award = ""},
{ID = 609, Class = Achievement.Class.EXPACHIVECLASS_COMMERCE, spestr = "所有生產技能達到6級", Name = "所有生產技能達到6級", Award = ""},
{ID = 612, Class = Achievement.Class.EXPACHIVECLASS_COMMERCE, spestr = "再次學習任意生產配方總計60個", Name = "學習60個配方", Award = ""},
{ID = 613, Class = Achievement.Class.EXPACHIVECLASS_COMMERCE, spestr = "再次學習任意生產配方總計120個", Name = "學習120個配方", Award = ""},
{ID = 614, Class = Achievement.Class.EXPACHIVECLASS_COMMERCE, spestr = "再次學習任意生產配方總計180個", Name = "學習180個配方", Award = ""},
{ID = 615, Class = Achievement.Class.EXPACHIVECLASS_COMMERCE, spestr = "再次學習任意生產配方總計240個", Name = "學習240個配方", Award = ""},
{ID = 616, Class = Achievement.Class.EXPACHIVECLASS_COMMERCE, spestr = "進行100次生產", Name = "進行100次生產", Award = ""},
{ID = 617, Class = Achievement.Class.EXPACHIVECLASS_COMMERCE, spestr = "再次進行1000次生產", Name = "進行1000次生產", Award = ""},
{ID = 618, Class = Achievement.Class.EXPACHIVECLASS_COMMERCE, spestr = "再次進行5000次生產", Name = "進行5000次生產", Award = ""},
{ID = 619, Class = Achievement.Class.EXPACHIVECLASS_COMMERCE, spestr = "再次進行10000次生產", Name = "進行10000次生產", Award = ""},
{ID = 620, Class = Achievement.Class.EXPACHIVECLASS_COMMERCE, spestr = "生產1件5品裝備", Name = "生產1件5品裝備", Award = ""},
{ID = 621, Class = Achievement.Class.EXPACHIVECLASS_COMMERCE, spestr = "再次生產10件5品裝備", Name = "生產10件5品裝備", Award = ""},
{ID = 622, Class = Achievement.Class.EXPACHIVECLASS_COMMERCE, spestr = "再次生產50件5品裝備", Name = "生產50件5品裝備", Award = ""},
{ID = 623, Class = Achievement.Class.EXPACHIVECLASS_COMMERCE, spestr = "再次生產100件5品裝備", Name = "生產100件5品裝備", Award = ""},
{ID = 624, Class = Achievement.Class.EXPACHIVECLASS_COMMERCE, spestr = "生產1件6品裝備", Name = "生產1件6品裝備", Award = ""},
{ID = 625, Class = Achievement.Class.EXPACHIVECLASS_COMMERCE, spestr = "再次生產10件6品裝備", Name = "生產10件6品裝備", Award = ""},
{ID = 626, Class = Achievement.Class.EXPACHIVECLASS_COMMERCE, spestr = "再次生產50件6品裝備", Name = "生產50件6品裝備", Award = ""},
{ID = 627, Class = Achievement.Class.EXPACHIVECLASS_COMMERCE, spestr = "再次生產100件6品裝備", Name = "生產100件6品裝備", Award = ""},
{ID = 628, Class = Achievement.Class.EXPACHIVECLASS_COMMERCE, spestr = "生產1件7品裝備", Name = "生產1件7品裝備", Award = ""},
{ID = 629, Class = Achievement.Class.EXPACHIVECLASS_COMMERCE, spestr = "再次生產10件7品裝備", Name = "生產10件7品裝備", Award = ""},
{ID = 630, Class = Achievement.Class.EXPACHIVECLASS_COMMERCE, spestr = "再次生產50件7品裝備", Name = "生產50件7品裝備", Award = ""},
{ID = 631, Class = Achievement.Class.EXPACHIVECLASS_COMMERCE, spestr = "再次生產100件7品裝備", Name = "生產100件7品裝備", Award = ""},
{ID = 632, Class = Achievement.Class.EXPACHIVECLASS_COMMERCE, spestr = "生產1件8品裝備", Name = "生產1件8品裝備", Award = ""},
{ID = 633, Class = Achievement.Class.EXPACHIVECLASS_COMMERCE, spestr = "再次生產10件8品裝備", Name = "生產10件8品裝備", Award = ""},
{ID = 634, Class = Achievement.Class.EXPACHIVECLASS_COMMERCE, spestr = "再次生產50件8品裝備", Name = "生產50件8品裝備", Award = ""},
{ID = 635, Class = Achievement.Class.EXPACHIVECLASS_COMMERCE, spestr = "再次生產100件8品裝備", Name = "生產100件8品裝備", Award = ""},
{ID = 638, Class = Achievement.Class.EXPACHIVECLASS_COMMERCE, spestr = "擴充背包至40格", Name = "擴充背包至40格", Award = ""},
{ID = 639, Class = Achievement.Class.EXPACHIVECLASS_COMMERCE, spestr = "擴充背包至80格", Name = "擴充背包至80格", Award = ""},
{ID = 640, Class = Achievement.Class.EXPACHIVECLASS_COMMERCE, spestr = "擴充背包至120格", Name = "擴充背包至120格", Award = ""},
{ID = 641, Class = Achievement.Class.EXPACHIVECLASS_COMMERCE, spestr = "擴充背包至150格", Name = "擴充背包至150格", Award = ""},
{ID = 642, Class = Achievement.Class.EXPACHIVECLASS_COMMERCE, spestr = "擴充背包至175格", Name = "擴充背包至175格", Award = ""},
{ID = 643, Class = Achievement.Class.EXPACHIVECLASS_COMMERCE, spestr = "擴充背包至200格", Name = "擴充背包至200格", Award = ""},
{ID = 644, Class = Achievement.Class.EXPACHIVECLASS_COMMERCE, spestr = "擴充倉庫至40格", Name = "擴充倉庫至40格", Award = ""},
{ID = 645, Class = Achievement.Class.EXPACHIVECLASS_COMMERCE, spestr = "擴充倉庫至80格", Name = "擴充倉庫至80格", Award = ""},
{ID = 646, Class = Achievement.Class.EXPACHIVECLASS_COMMERCE, spestr = "擴充倉庫至120格", Name = "擴充倉庫至120格", Award = ""},
{ID = 647, Class = Achievement.Class.EXPACHIVECLASS_COMMERCE, spestr = "擴充倉庫至150格", Name = "擴充倉庫至150格", Award = ""},
{ID = 648, Class = Achievement.Class.EXPACHIVECLASS_COMMERCE, spestr = "擴充倉庫至175格", Name = "擴充倉庫至175格", Award = ""},
{ID = 649, Class = Achievement.Class.EXPACHIVECLASS_COMMERCE, spestr = "擴充倉庫至200格", Name = "擴充倉庫至200格", Award = ""},
{ID = 1208, Class = Achievement.Class.EXPACHIVECLASS_COMMERCE, spestr = "開啟衣櫥", Name = "開啟衣櫥", Award = ""},
{ID = 1209, Class = Achievement.Class.EXPACHIVECLASS_COMMERCE, spestr = "擴充衣櫥至50格", Name = "擴充衣櫥至50格", Award = ""},
{ID = 1210, Class = Achievement.Class.EXPACHIVECLASS_COMMERCE, spestr = "擴充衣櫥至100格", Name = "擴充衣櫥至100格", Award = ""},
{ID = 969, Class = Achievement.Class.EXPACHIVECLASS_COMMERCE, spestr = "進行一次元寶消費", Name = "購物", Award = ""},
{ID = 431, Class = Achievement.Class.EXPACHIVECLASS_JIANGHU, spestr = "魅力值達到500點", Name = "魅力", Award = ""},
{ID = 432, Class = Achievement.Class.EXPACHIVECLASS_JIANGHU, spestr = "魅力值達到5000點", Name = "魅力", Award = ""},
{ID = 433, Class = Achievement.Class.EXPACHIVECLASS_JIANGHU, spestr = "魅力值達到50000點", Name = "魅力", Award = ""},
{ID = 434, Class = Achievement.Class.EXPACHIVECLASS_JIANGHU, spestr = "魅力值達到150000點", Name = "魅力", Award = ""},
{ID = 435, Class = Achievement.Class.EXPACHIVECLASS_JIANGHU, spestr = "師德值達到500點", Name = "師德", Award = ""},
{ID = 436, Class = Achievement.Class.EXPACHIVECLASS_JIANGHU, spestr = "師德值達到5000點", Name = "師德", Award = ""},
{ID = 437, Class = Achievement.Class.EXPACHIVECLASS_JIANGHU, spestr = "師德值達到50000點", Name = "師德", Award = ""},
{ID = 438, Class = Achievement.Class.EXPACHIVECLASS_JIANGHU, spestr = "師德值達到150000點", Name = "師德", Award = ""},
{ID = 439, Class = Achievement.Class.EXPACHIVECLASS_JIANGHU, spestr = "武林聲望值達到200點", Name = "武林聲望", Award = ""},
{ID = 440, Class = Achievement.Class.EXPACHIVECLASS_JIANGHU, spestr = "武林聲望值達到900點", Name = "武林聲望", Award = ""},
{ID = 441, Class = Achievement.Class.EXPACHIVECLASS_JIANGHU, spestr = "武林聲望值達到1800點", Name = "武林聲望", Award = ""},
{ID = 442, Class = Achievement.Class.EXPACHIVECLASS_JIANGHU, spestr = "武林聲望值達到2800點", Name = "武林聲望", Award = ""},
{ID = 443, Class = Achievement.Class.EXPACHIVECLASS_JIANGHU, spestr = "幫派貢獻值達到100點", Name = "幫派貢獻", Award = ""},
{ID = 444, Class = Achievement.Class.EXPACHIVECLASS_JIANGHU, spestr = "幫派貢獻值達到1000點", Name = "幫派貢獻", Award = ""},
{ID = 445, Class = Achievement.Class.EXPACHIVECLASS_JIANGHU, spestr = "幫派貢獻值達到5000點", Name = "幫派貢獻", Award = ""},
{ID = 446, Class = Achievement.Class.EXPACHIVECLASS_JIANGHU, spestr = "幫派貢獻值達到10000點", Name = "幫派貢獻", Award = ""},
{ID = 447, Class = Achievement.Class.EXPACHIVECLASS_JIANGHU, spestr = "福州城聲望值達到3000點", Name = "福州城聲望", Award = ""},
{ID = 448, Class = Achievement.Class.EXPACHIVECLASS_JIANGHU, spestr = "福州城聲望值達到11000點", Name = "福州城聲望", Award = ""},
{ID = 449, Class = Achievement.Class.EXPACHIVECLASS_JIANGHU, spestr = "福州城聲望值達到23000點", Name = "福州城聲望", Award = ""},
{ID = 450, Class = Achievement.Class.EXPACHIVECLASS_JIANGHU, spestr = "福州城聲望值達到48000點", Name = "福州城聲望", Award = ""},
{ID = 451, Class = Achievement.Class.EXPACHIVECLASS_JIANGHU, spestr = "衡山城聲望值達到3000點", Name = "衡山城聲望", Award = ""},
{ID = 452, Class = Achievement.Class.EXPACHIVECLASS_JIANGHU, spestr = "衡山城聲望值達到11000點", Name = "衡山城聲望", Award = ""},
{ID = 453, Class = Achievement.Class.EXPACHIVECLASS_JIANGHU, spestr = "衡山城聲望值達到23000點", Name = "衡山城聲望", Award = ""},
{ID = 454, Class = Achievement.Class.EXPACHIVECLASS_JIANGHU, spestr = "衡山城聲望值達到48000點", Name = "衡山城聲望", Award = ""},
{ID = 455, Class = Achievement.Class.EXPACHIVECLASS_JIANGHU, spestr = "洛陽城聲望值達到3000點", Name = "洛陽城聲望", Award = ""},
{ID = 456, Class = Achievement.Class.EXPACHIVECLASS_JIANGHU, spestr = "洛陽城聲望值達到11000點", Name = "洛陽城聲望", Award = ""},
{ID = 457, Class = Achievement.Class.EXPACHIVECLASS_JIANGHU, spestr = "洛陽城聲望值達到23000點", Name = "洛陽城聲望", Award = ""},
{ID = 458, Class = Achievement.Class.EXPACHIVECLASS_JIANGHU, spestr = "洛陽城聲望值達到48000點", Name = "洛陽城聲望", Award = ""},
{ID = 459, Class = Achievement.Class.EXPACHIVECLASS_JIANGHU, spestr = "善緣值達到500點", Name = "善緣", Award = ""},
{ID = 460, Class = Achievement.Class.EXPACHIVECLASS_JIANGHU, spestr = "善緣值達到5000點", Name = "善緣", Award = ""},
{ID = 461, Class = Achievement.Class.EXPACHIVECLASS_JIANGHU, spestr = "善緣值達到50000點", Name = "善緣", Award = ""},
{ID = 462, Class = Achievement.Class.EXPACHIVECLASS_JIANGHU, spestr = "善緣值達到150000點", Name = "善緣", Award = ""},
{ID = 463, Class = Achievement.Class.EXPACHIVECLASS_JIANGHU, spestr = "競技幣值達到100點", Name = "競技幣", Award = ""},
{ID = 464, Class = Achievement.Class.EXPACHIVECLASS_JIANGHU, spestr = "競技幣值達到1000點", Name = "競技幣", Award = ""},
{ID = 465, Class = Achievement.Class.EXPACHIVECLASS_JIANGHU, spestr = "競技幣值達到5000點", Name = "競技幣", Award = ""},
{ID = 466, Class = Achievement.Class.EXPACHIVECLASS_JIANGHU, spestr = "競技幣值達到10000點", Name = "競技幣", Award = ""},
{ID = 467, Class = Achievement.Class.EXPACHIVECLASS_JIANGHU, spestr = "貢獻度值達到2000點", Name = "貢獻度", Award = ""},
{ID = 468, Class = Achievement.Class.EXPACHIVECLASS_JIANGHU, spestr = "貢獻度值達到12500點", Name = "貢獻度", Award = ""},
{ID = 469, Class = Achievement.Class.EXPACHIVECLASS_JIANGHU, spestr = "貢獻度值達到21500點", Name = "貢獻度", Award = ""},
{ID = 470, Class = Achievement.Class.EXPACHIVECLASS_JIANGHU, spestr = "貢獻度值達到33500點", Name = "貢獻度", Award = ""},
{ID = 471, Class = Achievement.Class.EXPACHIVECLASS_JIANGHU, spestr = "遊俠戰績值達到2000點", Name = "遊俠戰績", Award = ""},
{ID = 472, Class = Achievement.Class.EXPACHIVECLASS_JIANGHU, spestr = "遊俠戰績值達到12500點", Name = "遊俠戰績", Award = ""},
{ID = 473, Class = Achievement.Class.EXPACHIVECLASS_JIANGHU, spestr = "遊俠戰績值達到21500點", Name = "遊俠戰績", Award = ""},
{ID = 474, Class = Achievement.Class.EXPACHIVECLASS_JIANGHU, spestr = "遊俠戰績值達到33500點", Name = "遊俠戰績", Award = ""},
{ID = 475, Class = Achievement.Class.EXPACHIVECLASS_JIANGHU, spestr = "龍威值達到5000點", Name = "龍威", Award = ""},
{ID = 476, Class = Achievement.Class.EXPACHIVECLASS_JIANGHU, spestr = "龍威值達到10000點", Name = "龍威", Award = ""},
{ID = 477, Class = Achievement.Class.EXPACHIVECLASS_JIANGHU, spestr = "龍威值達到100000點", Name = "龍威", Award = ""},
{ID = 478, Class = Achievement.Class.EXPACHIVECLASS_JIANGHU, spestr = "龍威值達到200000點", Name = "龍威", Award = ""},
{ID = 479, Class = Achievement.Class.EXPACHIVECLASS_JIANGHU, spestr = "余杭城聲望值達到3000點", Name = "余杭城聲望", Award = ""},
{ID = 480, Class = Achievement.Class.EXPACHIVECLASS_JIANGHU, spestr = "余杭城聲望值達到11000點", Name = "余杭城聲望", Award = ""},
{ID = 481, Class = Achievement.Class.EXPACHIVECLASS_JIANGHU, spestr = "余杭城聲望值達到23000點", Name = "余杭城聲望", Award = ""},
{ID = 482, Class = Achievement.Class.EXPACHIVECLASS_JIANGHU, spestr = "余杭城聲望值達到48000點", Name = "余杭城聲望", Award = ""},
{ID = 483, Class = Achievement.Class.EXPACHIVECLASS_JIANGHU, spestr = "南疆城聲望值達到3000點", Name = "南疆城聲望", Award = ""},
{ID = 484, Class = Achievement.Class.EXPACHIVECLASS_JIANGHU, spestr = "南疆城聲望值達到11000點", Name = "南疆城聲望", Award = ""},
{ID = 485, Class = Achievement.Class.EXPACHIVECLASS_JIANGHU, spestr = "南疆城聲望值達到23000點", Name = "南疆城聲望", Award = ""},
{ID = 486, Class = Achievement.Class.EXPACHIVECLASS_JIANGHU, spestr = "南疆城聲望值達到48000點", Name = "南疆城聲望", Award = ""},
{ID = 487, Class = Achievement.Class.EXPACHIVECLASS_JIANGHU, spestr = "在5個城市中聲望達到最高", Name = "城市明星", Award = ""},
{ID = 805, Class = Achievement.Class.EXPACHIVECLASS_JIANGHU, spestr = "結婚", Name = "結婚", Award = ""},
{ID = 810, Class = Achievement.Class.EXPACHIVECLASS_JIANGHU, spestr = "加入幫派", Name = "加入幫派", Award = ""},
{ID = 811, Class = Achievement.Class.EXPACHIVECLASS_JIANGHU, spestr = "進行1次塗鴉", Name = "塗鴉", Award = ""},
{ID = 812, Class = Achievement.Class.EXPACHIVECLASS_JIANGHU, spestr = "再次進行10次塗鴉", Name = "塗鴉(10)", Award = ""},
{ID = 813, Class = Achievement.Class.EXPACHIVECLASS_JIANGHU, spestr = "再次進行100次塗鴉", Name = "塗鴉(100)", Award = ""},
{ID = 814, Class = Achievement.Class.EXPACHIVECLASS_JIANGHU, spestr = "再次進行500次塗鴉", Name = "塗鴉(500)", Award = ""},
{ID = 815, Class = Achievement.Class.EXPACHIVECLASS_JIANGHU, spestr = "擦除1次塗鴉", Name = "擦除塗鴉", Award = ""},
{ID = 816, Class = Achievement.Class.EXPACHIVECLASS_JIANGHU, spestr = "再次擦除10次塗鴉", Name = "擦除塗鴉(10)", Award = ""},
{ID = 817, Class = Achievement.Class.EXPACHIVECLASS_JIANGHU, spestr = "再次擦除100次塗鴉", Name = "擦除塗鴉(100)", Award = ""},
{ID = 818, Class = Achievement.Class.EXPACHIVECLASS_JIANGHU, spestr = "再次擦除500次塗鴉", Name = "擦除塗鴉(500)", Award = ""},
{ID = 819, Class = Achievement.Class.EXPACHIVECLASS_JIANGHU, spestr = "進行1次普通遊街", Name = "普通遊街", Award = ""},
{ID = 820, Class = Achievement.Class.EXPACHIVECLASS_JIANGHU, spestr = "進行1次中級遊街", Name = "中級遊街", Award = ""},
{ID = 821, Class = Achievement.Class.EXPACHIVECLASS_JIANGHU, spestr = "進行1次高級遊街", Name = "高級遊街", Award = ""},
{ID = 822, Class = Achievement.Class.EXPACHIVECLASS_JIANGHU, spestr = "成就評分達到100", Name = "小有成就", Award = ""},
{ID = 823, Class = Achievement.Class.EXPACHIVECLASS_JIANGHU, spestr = "成就評分達到200", Name = "已成大事", Award = ""},
{ID = 824, Class = Achievement.Class.EXPACHIVECLASS_JIANGHU, spestr = "成就評分達到300", Name = "成就達人", Award = ""},
{ID = 825, Class = Achievement.Class.EXPACHIVECLASS_JIANGHU, spestr = "成就評分達到500", Name = "飛黃騰達", Award = ""},
{ID = 826, Class = Achievement.Class.EXPACHIVECLASS_JIANGHU, spestr = "經歷一次美容服務", Name = "改頭換面", Award = ""},


}

------------------[[所有成就结束]]------------------
--[[#tag pop]]
Achievement.Templ_Task =
{
--	{ID = 226, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, Name = "评书授谱每日成就"},
--	{ID = 227, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, Name = "评书雨夜每日成就"},
--	{ID = 228, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, Name = "评书换血每日成就"},
--	{ID = 229, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, Name = "评书联手每日成就"},
--	{ID = 230, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, Name = "抓宠每日成就1"},
--	{ID = 231, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, Name = "抓宠每日成就2"},
--	{ID = 232, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, Name = "名人挑战每日成就1"},
--	{ID = 233, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, Name = "名人挑战每日成就2"},
--	{ID = 234, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, Name = "名人挑战每日成就3"},
--	{ID = 235, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, Name = "每日梅庄副本成就1"},
--	{ID = 236, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, Name = "每日梅庄任务成就2"},
--	{ID = 237, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, Name = "每日师门第一轮成就"},
--	{ID = 238, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, Name = "每日师门全5轮成就"},
--	{ID = 239, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, Name = "每日完成1次答题成就"},
--	{ID = 240, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, Name = "每日偷菜1次成就"},
--	{ID = 241, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, Name = "完成3个异闻录成就"},
--	{ID = 242, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, Name = "完成3个除害成就"},
--	{ID = 243, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, Name = "完成5个威武令成就"},
--	{ID = 244, Class = Achievement.Class.EXPACHIVECLASS_PULLULATE, Name = "完成2次宠物库任务成就"},
}

Achievement.SpecialAchievementType =
{
	{Type = 18},
	{Type = 19},
	{Type = 20},
	{Type = 21},
	{Type = 22},
	{Type = 23},
	{Type = 24},
	{Type = 26},
	{Type = 28},
	{Type = 29},
	{Type = 31},
}

--[[数值在表中]]
function Achievement:ValueInTable(val,tbl)
	if val and tbl and type(tbl) == --[[!AUTO_1]]"table" then
		for k,v in pairs(tbl) do
			if v == val then
				return true
			end
		end
	end
	return false
end

--[[获得当前玩家可用成就列表]]
function Achievement:GetTempl()
	local achi_templ  = {}
	local idx = 1
	for k,v in pairs(Achievement.Templ) do
		if v.ID ~= nil and v.Class ~= nil then
			achi_templ[idx] = {}
			achi_templ[idx].ID = v.ID
			idx = idx+1
		end
	end
	return achi_templ
end

--[[获得任务编辑器中可用成就列表]]
function Achievement:GetTempl_Task()
	local achi_templ  = {}
	local idx = 1
	for k,v in pairs(Achievement.Templ) do
		if v.ID ~= nil and v.Class ~= nil then
			achi_templ[idx] = {}
			achi_templ[idx].ID = v.ID
			achi_templ[idx].Class  = v.Class
			achi_templ[idx].Name = v.Name
			idx = idx+1
		end
	end

	for k,v in pairs(Achievement.Templ_Task) do
		if v.ID ~= nil and v.Class ~= nil then
			achi_templ[idx] = {}
			achi_templ[idx].ID = v.ID
			achi_templ[idx].Class  = v.Class
			achi_templ[idx].Name = v.Name
			idx = idx+1
		end
	end

	return achi_templ
end

--[[字符串组合函数]]
function Achievement:StringCombiner(str_start, str_tbl, str_itv)
	local rst = str_start
	for k, v in pairs(str_tbl) do
		if v~= --[[!AUTO_2]]"" then
			if rst == str_start then
				rst = rst .. v
			else
				rst = rst .. str_itv .. v
			end
		end
	end
	return rst
end

--[[成就的数据]]
Achievement.Data =
{
--[[!AUTO_3]]"解鎖條件（狀態）1",
--[[!AUTO_4]]"解鎖條件（狀態）2",
--[[!AUTO_5]]"解鎖條件（狀態）3",
--[[!AUTO_6]]"解鎖條件（狀態）4",
--[[!AUTO_7]]"完成條件（狀態）1",
--[[!AUTO_8]]"完成條件（狀態）2",
--[[!AUTO_9]]"完成條件（狀態）3",
--[[!AUTO_10]]"完成條件（狀態）4",
--[[!AUTO_11]]"完成條件（狀態）5",
--[[!AUTO_12]]"完成條件（狀態）6",
--[[!AUTO_13]]"完成條件（狀態）7",
--[[!AUTO_14]]"完成條件（狀態）8",
--[[!AUTO_15]]"完成條件（事件）1",
--[[!AUTO_16]]"完成條件（事件）2",
--[[!AUTO_17]]"完成條件（事件）3",
--[[!AUTO_18]]"完成條件（事件）4",
--[[!AUTO_19]]"完成條件（事件）5",
--[[!AUTO_20]]"完成條件（事件）6",
--[[!AUTO_21]]"完成條件（事件）7",
--[[!AUTO_22]]"完成條件（事件）8",
}

--[[获取成就数据]]
function Achievement:GetAchieveContent(idAch)
	local AchContent = {}
	AchContent.Count = 0
	AchContent.Name = --[[!AUTO_23]]""
	_, AchContent.Name = DescUtility:GetItemDBProp(idAch, ClassType.ICID_ACHIEVEMENT, --[[!AUTO_24]]"t_name")
	local numData = #Achievement.Data
	local iData = 0
	local nowData = 0
	local bOk = false
	for iData = 1,numData do
		_, tType = GameApi.GetItemDBProp(idAch, ClassType.ICID_ACHIEVEMENT, Achievement.Data[iData] .. --[[!AUTO_25]]"的類型")
		if tType > 0 then
			nowData = nowData + 1
			AchContent[nowData] = {}
			if iData > 12 then
				AchContent[nowData].condclass = 3
			elseif iData > 4 then
				AchContent[nowData].condclass = 2
			else
				AchContent[nowData].condclass = 1
			end
			AchContent[nowData].condtype = tType
			_, AchContent[nowData].conddata1 = GameApi.GetItemDBProp(idAch, ClassType.ICID_ACHIEVEMENT, Achievement.Data[iData] .. --[[!AUTO_26]]"的參數1")
			_, AchContent[nowData].conddata2 = GameApi.GetItemDBProp(idAch, ClassType.ICID_ACHIEVEMENT, Achievement.Data[iData] .. --[[!AUTO_27]]"的參數2")
			_, AchContent[nowData].conddata3 = GameApi.GetItemDBProp(idAch, ClassType.ICID_ACHIEVEMENT, Achievement.Data[iData] .. --[[!AUTO_28]]"的參數3")
			_, AchContent[nowData].conddata4 = GameApi.GetItemDBProp(idAch, ClassType.ICID_ACHIEVEMENT, Achievement.Data[iData] .. --[[!AUTO_29]]"的參數4")
			AchContent.Count = AchContent.Count + 1
		end
	end
	return AchContent
end

--[[检查成就状态条件]]
function Achievement:CheckStatesCond(condtype, conddata1, conddata2, conddata3, conddata4, player_prop)
	--LogPrint("condtype: " .. condtype)
	if condtype == 1 then --[[职业]]
		if player_prop["prof"] ~= conddata1 then
			return false
		else
			return true
		end
	elseif condtype == 2 then --[[等级]]
		if player_prop["level"] < conddata1 then
			return false
		else
			return true
		end
	elseif condtype == 3 then --[[钱，未实现]]
		return true
	elseif condtype == 4 then --[[PK值]]
		if player_prop["pklevel"] < conddata1 then
			return false
		else
			return true
		end
	elseif condtype == 5 then --[[声望，未实现]]
		return true
	elseif condtype == 6 then --[[单个任务完成情况]]
		local state, times = GameApi.GetTaskCompInfo(conddata1)
		if state < 2 then
			return false
		else
			return true
		end
	elseif condtype == 7 then --[[某类任务完成个数]]
		local num = GameApi.GetFinishedTaskNum(conddata1)
		if num < conddata2 then
			return false
		else
			return true
		end
	elseif condtype == 8 then --[[计次任务完成次数]]
		local state, times = GameApi.GetTaskCompInfo(conddata1)
		if times < conddata2 then
			return false
		else
			return true
		end
	elseif condtype == 9 then --[[单个技能的学习等级，未实现]]
		return true
	elseif condtype == 10 then --[[单个生产技能的等级，未实现]]
		return true
	elseif condtype == 11 then --[[单个生产技能的下属配方，未实现]]
		return true
	elseif condtype == 12 then --[[单个成就的完成情况，未实现]]
		return true
	elseif condtype == 13 then --[[竞技场总次数，需调整]]
		local count = GameApi.GetArenaScore(conddata1)
		local times = 0
		if conddata3 == 0 then
			times = count["battle"]
		elseif condata3 == 1 then
			times = count["win"]
		end
		if times < conddata2 then
			return false
		else
			return true
		end
	elseif condtype == 14 then --[[竞技段位达到，需调整]]
		if player_prop["arenarank"] < conddata1 then
			return false
		else
			return true
		end
	elseif condtype == 15 then --[[连胜次数达到，需调整]]
		local count = GameApi.GetArenaScore(conddata1)
		local times = count["winchain"]
		if times < conddata2 then
			return false
		else
			return true
		end
	else
		return true
	end
end

--[[获取成就状态条件文字]]
function Achievement:GetStatesCondString(condtype, conddata1, conddata2, conddata3, conddata4, player_prop)
	--LogPrint("condtype: " .. condtype)
	if condtype == 1 then --[[职业]]
		if player_prop["prof"] ~= conddata1 then
			return 0, string.format(TAG_ACHIEVEMENT_LOCK_TYPE_TEXT[1], TAG_COLOR_ACHIEVEMENT[3], GAME_PROF_TYPE[conddata1+1] or GAME_PROF_TYPE_NULL)
		else
			return -1, string.format(TAG_ACHIEVEMENT_LOCK_TYPE_TEXT[1], TAG_COLOR_ACHIEVEMENT[4], GAME_PROF_TYPE[conddata1+1] or GAME_PROF_TYPE_NULL)
		end
	elseif condtype == 2 then --[[等级]]
		if player_prop["level"] < conddata1 then
			return 0, string.format(TAG_ACHIEVEMENT_LOCK_TYPE_TEXT[2], TAG_COLOR_ACHIEVEMENT[3], conddata1)
		else
			return -1, string.format(TAG_ACHIEVEMENT_LOCK_TYPE_TEXT[2], TAG_COLOR_ACHIEVEMENT[4], conddata1)
		end
	elseif condtype == 3 then --[[钱，未实现]]
		return 0 , TAG_COLOR_ACHIEVEMENT[5] .. --[[!AUTO_30]]"(無)包裹金錢達到"
	elseif condtype == 4 then --[[PK值]]
		if player_prop["pklevel"] < conddata1 then
			return 0, string.format(TAG_ACHIEVEMENT_LOCK_TYPE_TEXT[4], TAG_COLOR_ACHIEVEMENT[3], conddata1)
		else
			return -1, string.format(TAG_ACHIEVEMENT_LOCK_TYPE_TEXT[4], TAG_COLOR_ACHIEVEMENT[4], conddata1)
		end
	elseif condtype == 5 then --[[声望，未实现]]
		return 0 , TAG_COLOR_ACHIEVEMENT[5] .. --[[!AUTO_31]]"(無)指定聲望達到"
	elseif condtype == 6 then --[[单个任务完成情况]]
		local state, times = GameApi.GetTaskCompInfo(conddata1)
		if state < 2 then
			return 0, string.format(TAG_ACHIEVEMENT_LOCK_TYPE_TEXT[6], TAG_COLOR_ACHIEVEMENT[3], conddata1)
		else
			return -1, string.format(TAG_ACHIEVEMENT_LOCK_TYPE_TEXT[6], TAG_COLOR_ACHIEVEMENT[4], conddata1)
		end
	elseif condtype == 7 then --[[某类任务完成个数]]
		local num = GameApi.GetFinishedTaskNum(conddata1)
		if num < conddata2 then
			return num, string.format(TAG_ACHIEVEMENT_LOCK_TYPE_TEXT[7], TAG_COLOR_ACHIEVEMENT[3], conddata2, TAG_ACHIEVEMENT_MAP_TASK_TEXT[conddata1] or TAG_ACHIEVEMENT_MAP_TASK_TEXT_NULL)
		else
			return -1, string.format(TAG_ACHIEVEMENT_LOCK_TYPE_TEXT[7], TAG_COLOR_ACHIEVEMENT[4], conddata2, TAG_ACHIEVEMENT_MAP_TASK_TEXT[conddata1] or TAG_ACHIEVEMENT_MAP_TASK_TEXT_NULL)
		end
	elseif condtype == 8 then --[[计次任务完成次数]]
		local state, times = GameApi.GetTaskCompInfo(conddata1)
		if times < conddata2 then
			return times, string.format(TAG_ACHIEVEMENT_LOCK_TYPE_TEXT[8], TAG_COLOR_ACHIEVEMENT[3], conddata1, conddata2)
		else
			return -1, string.format(TAG_ACHIEVEMENT_LOCK_TYPE_TEXT[8], TAG_COLOR_ACHIEVEMENT[4], conddata1, conddata2)
		end
	elseif condtype == 9 then --[[单个技能的学习等级]]
		local skilltable = GameApi.GetSkillTable(true)
		if skilltable[conddata1] then
			if skilltable[conddata1] < conddata2 then
				return skilltable[conddata1], string.format(TAG_ACHIEVEMENT_LOCK_TYPE_TEXT[9], TAG_COLOR_ACHIEVEMENT[3], GameApi.GetSkillEssence(conddata1)["display_name"], conddata2)
			else
				return -1, string.format(TAG_ACHIEVEMENT_LOCK_TYPE_TEXT[9], TAG_COLOR_ACHIEVEMENT[4], GameApi.GetSkillEssence(conddata1)["display_name"], conddata2)
			end
		else
			return 0, string.format(TAG_ACHIEVEMENT_LOCK_TYPE_TEXT[9], TAG_COLOR_ACHIEVEMENT[3], GameApi.GetSkillEssence(conddata1)["display_name"], conddata2)
		end
	elseif condtype == 10 then --[[单个生产技能的等级，未实现]]
		return 0 , TAG_COLOR_ACHIEVEMENT[5] .. --[[!AUTO_32]]"(無)生產技能等級達到"
	elseif condtype == 11 then --[[单个生产技能的下属配方，未实现]]
		return 0 , TAG_COLOR_ACHIEVEMENT[5] .. --[[!AUTO_33]]"(無)生產技能配方總數達到"
	elseif condtype == 12 then --[[单个成就的完成情况，未实现]]
		return 0 , TAG_COLOR_ACHIEVEMENT[5] .. --[[!AUTO_34]]"(無)完成指定成就"
	elseif condtype == 13 then --[[竞技场总次数，需调整]]
		local count = GameApi.GetArenaScore(conddata1)
		local times = 0
		if conddata3 == 0 then
			times = count["battle"]
		elseif condata3 == 1 then
			times = count["win"]
		end
		if times < conddata2 then
			return times, string.format(TAG_ACHIEVEMENT_LOCK_TYPE_TEXT[13][conddata3+1], TAG_COLOR_ACHIEVEMENT[3], TAG_ACHIEVEMENT_ARENATYPE[conddata1+1], conddata2)
		else
			return -1, string.format(TAG_ACHIEVEMENT_LOCK_TYPE_TEXT[13][conddata3+1], TAG_COLOR_ACHIEVEMENT[4], TAG_ACHIEVEMENT_ARENATYPE[conddata1+1], conddata2)
		end
	elseif condtype == 14 then --[[竞技段位达到，需调整]]
		if player_prop["arenarank"] < conddata1 then
			return player_prop["arenarank"], string.format(TAG_ACHIEVEMENT_LOCK_TYPE_TEXT[14], TAG_COLOR_ACHIEVEMENT[3], TAG_ACHIEVEMENT_ARENARANK[conddata1+1])
		else
			return -1, string.format(TAG_ACHIEVEMENT_LOCK_TYPE_TEXT[14], TAG_COLOR_ACHIEVEMENT[4], TAG_ACHIEVEMENT_ARENARANK[conddata1+1])
		end
	elseif condtype == 15 then --[[连胜次数达到，需调整]]
		local count = GameApi.GetArenaScore(conddata1)
		local times = count["winchain"]
		if times < conddata2 then
			return times, string.format(TAG_ACHIEVEMENT_LOCK_TYPE_TEXT[15], TAG_COLOR_ACHIEVEMENT[3], TAG_ACHIEVEMENT_ARENATYPE[conddata1+1], conddata2)
		else
			return -1, string.format(TAG_ACHIEVEMENT_LOCK_TYPE_TEXT[15], TAG_COLOR_ACHIEVEMENT[4], TAG_ACHIEVEMENT_ARENATYPE[conddata1+1], conddata2)
		end
	elseif condtype == 26 then --[[技能格数，需调整]]
                local count = GameApi.GetJuejiMaxCount(conddata1)
		return count , --[[!AUTO_117]]""
	else
		return 0, --[[!AUTO_35]]""
	end
end

--[[获取成就事件条件文字]]
function Achievement:GetEventCondString(condtype, conddata1, conddata2, conddata3, conddata4, event_prop, ecount)
	--LogPrint("condtype: " .. condtype)
	if condtype == 1 then --[[装备物品]]
		return event_prop[ecount] or 0 , TAG_COLOR_ACHIEVEMENT[5] .. --[[!AUTO_36]]"(無)裝備物品"
	elseif condtype == 2 then --[[获取物品]]
		return event_prop[ecount] or 0 , TAG_COLOR_ACHIEVEMENT[5] .. --[[!AUTO_37]]"(無)獲取物品"
	elseif condtype == 3 then --[[获取宠物]]
		if conddata1 > 0 and conddata3 == 0 then
			if (event_prop[ecount] or 0) < conddata2 then
				return event_prop[ecount] or 0, string.format(TAG_ACHIEVEMENT_EVENT_TEXT[3][1], TAG_COLOR_ACHIEVEMENT[3], conddata2, DescUtility:GetItemName(conddata1, ClassType.ICID_PET_BEDGE), TAG_COLOR_ACHIEVEMENT[3])
			else
				return -1, string.format(TAG_ACHIEVEMENT_EVENT_TEXT[3][1], TAG_COLOR_ACHIEVEMENT[4], conddata2, DescUtility:GetItemName(conddata1, ClassType.ICID_PET_BEDGE), TAG_COLOR_ACHIEVEMENT[4])
			end
		elseif conddata1 == 0 and conddata3 >= 0 then
			if (event_prop[ecount] or 0) < conddata2 then
				return event_prop[ecount] or 0, string.format(TAG_ACHIEVEMENT_EVENT_TEXT[3][2], TAG_COLOR_ACHIEVEMENT[3], conddata2, TAG_ACHIEVEMENT_PET[conddata3] or --[[!AUTO_38]]"")
			else
				return -1, string.format(TAG_ACHIEVEMENT_EVENT_TEXT[3][2], TAG_COLOR_ACHIEVEMENT[4], conddata2, TAG_ACHIEVEMENT_PET[conddata3] or --[[!AUTO_39]]"")
			end
		else
			return 0 , TAG_COLOR_ACHIEVEMENT[5] .. --[[!AUTO_40]]"未知門徒條件"
		end
	elseif condtype == 4 then --[[完成重复任务]]
		if conddata1 > 0 and conddata3 == 0 then
			if (event_prop[ecount] or 0) < conddata2 then
				return event_prop[ecount] or 0, string.format(TAG_ACHIEVEMENT_EVENT_TEXT[4][1], TAG_COLOR_ACHIEVEMENT[3], conddata2, conddata1)
			else
				return -1, string.format(TAG_ACHIEVEMENT_EVENT_TEXT[4][1], TAG_COLOR_ACHIEVEMENT[4], conddata2, conddata1)
			end
		elseif conddata1 == 0 and conddata3 > 0 then
			if (event_prop[ecount] or 0) < conddata2 then
				return event_prop[ecount] or 0, string.format(TAG_ACHIEVEMENT_EVENT_TEXT[4][2], TAG_COLOR_ACHIEVEMENT[3], conddata2, TAG_ACHIEVEMENT_TASKLIB[conddata3] or --[[!AUTO_41]]"")
			else
				return -1, string.format(TAG_ACHIEVEMENT_EVENT_TEXT[4][2], TAG_COLOR_ACHIEVEMENT[4], conddata2, TAG_ACHIEVEMENT_TASKLIB[conddata3] or --[[!AUTO_42]]"")
			end
		else
			return 0 , TAG_COLOR_ACHIEVEMENT[5] .. --[[!AUTO_43]]"未知任務條件"
		end
	elseif condtype == 5 then --[[杀怪]]
		return event_prop[ecount] or 0 , TAG_COLOR_ACHIEVEMENT[5] .. --[[!AUTO_44]]"(無)殺怪"
	elseif condtype == 6 then --[[生产]]
		return event_prop[ecount] or 0 , TAG_COLOR_ACHIEVEMENT[5] .. --[[!AUTO_45]]"(無)生產"
	elseif condtype == 7 then --[[完成副本]]
		if (event_prop[ecount] or 0) < conddata2 then
			return event_prop[ecount] or 0, string.format(TAG_ACHIEVEMENT_EVENT_TEXT[7], TAG_COLOR_ACHIEVEMENT[3], conddata1, conddata3, conddata2)
		else
			return -1, string.format(TAG_ACHIEVEMENT_EVENT_TEXT[7], TAG_COLOR_ACHIEVEMENT[4], conddata1, conddata3, conddata2)
		end
	elseif condtype == 8 then --[[进行切磋]]
		if conddata3 == 1 then
			if (event_prop[ecount] or 0) > conddata2 then
				return event_prop[ecount] or 0, string.format(TAG_ACHIEVEMENT_EVENT_TEXT[8][conddata1+1], TAG_COLOR_ACHIEVEMENT[3], TAG_ACHIEVEMENT_COMPARE[conddata3+1], conddata2)
			else
				return -1, string.format(TAG_ACHIEVEMENT_EVENT_TEXT[8][conddata1+1], TAG_COLOR_ACHIEVEMENT[4], TAG_ACHIEVEMENT_COMPARE[conddata3+1], conddata2)
			end
		else
			if (event_prop[ecount] or 0) < conddata2 then
				return event_prop[ecount] or 0, string.format(TAG_ACHIEVEMENT_EVENT_TEXT[8][conddata1+1], TAG_COLOR_ACHIEVEMENT[3], TAG_ACHIEVEMENT_COMPARE[conddata3+1], conddata2)
			else
				return -1, string.format(TAG_ACHIEVEMENT_EVENT_TEXT[8][conddata1+1], TAG_COLOR_ACHIEVEMENT[4], TAG_ACHIEVEMENT_COMPARE[conddata3+1], conddata2)
			end
		end
	elseif condtype == 9 then --[[死亡]]
		return event_prop[ecount] or 0 , TAG_COLOR_ACHIEVEMENT[5] .. --[[!AUTO_46]]"(無)死亡"
	elseif condtype == 10 then --[[获取绑定币]]
		if (event_prop[ecount] or 0) < conddata2 then
			return event_prop[ecount] or 0, string.format(TAG_ACHIEVEMENT_EVENT_TEXT[10][conddata1+1], TAG_COLOR_ACHIEVEMENT[3], conddata2)
		else
			return -1, string.format(TAG_ACHIEVEMENT_EVENT_TEXT[10][conddata1+1], TAG_COLOR_ACHIEVEMENT[4], conddata2)
		end
	elseif condtype == 11 then --[[完成某类任务]]
		return event_prop[ecount] or 0 , TAG_COLOR_ACHIEVEMENT[5] .. --[[!AUTO_47]]"(無)完成某類任務"
	elseif condtype == 12 then --[[答题]]
		return event_prop[ecount] or 0 , TAG_COLOR_ACHIEVEMENT[5] .. --[[!AUTO_48]]"(無)答題"
	elseif condtype == 13 then --[[种植交互]]
		return event_prop[ecount] or 0 , TAG_COLOR_ACHIEVEMENT[5] .. --[[!AUTO_49]]"(無)種植交互"
	elseif condtype == 14 then --[[竞技模式次数]]
		if (event_prop[ecount] or 0) < conddata2 then
			return event_prop[ecount] or 0, string.format(TAG_ACHIEVEMENT_EVENT_TEXT[14][conddata3+1], TAG_COLOR_ACHIEVEMENT[3], conddata2, TAG_ACHIEVEMENT_ARENAFIGHTTYPE[conddata1])
		else
			return -1, string.format(TAG_ACHIEVEMENT_EVENT_TEXT[14][conddata3+1], TAG_COLOR_ACHIEVEMENT[4], conddata2, TAG_ACHIEVEMENT_ARENAFIGHTTYPE[conddata1])
		end
	elseif condtype == 15 then --[[竞技完美次数]]
		if (event_prop[ecount] or 0) < conddata2 then
			return event_prop[ecount] or 0, string.format(TAG_ACHIEVEMENT_EVENT_TEXT[15], TAG_COLOR_ACHIEVEMENT[3], conddata2, TAG_ACHIEVEMENT_ARENAFIGHTTYPE[conddata1])
		else
			return -1, string.format(TAG_ACHIEVEMENT_EVENT_TEXT[15], TAG_COLOR_ACHIEVEMENT[4], conddata2, TAG_ACHIEVEMENT_ARENAFIGHTTYPE[conddata1])
		end
	elseif condtype == 16 then --[[竞技MVP次数]]
		if (event_prop[ecount] or 0) < conddata2 then
			LogPrint(string.format(TAG_ACHIEVEMENT_EVENT_TEXT[16], TAG_COLOR_ACHIEVEMENT[3], TAG_ACHIEVEMENT_ARENAMVPTYPE[conddata1+1], conddata2))
			return event_prop[ecount] or 0, string.format(TAG_ACHIEVEMENT_EVENT_TEXT[16], TAG_COLOR_ACHIEVEMENT[3], TAG_ACHIEVEMENT_ARENAMVPTYPE[conddata1+1], conddata2)
		else
			return -1, string.format(TAG_ACHIEVEMENT_EVENT_TEXT[16], TAG_COLOR_ACHIEVEMENT[4], TAG_ACHIEVEMENT_ARENAMVPTYPE[conddata1+1], conddata2)
		end
	elseif condtype == 17 then --[[完成副本（限难度评价）]]
		if (event_prop[ecount] or 0) < conddata2 then
			if conddata2 == 1 then
				return event_prop[ecount] or 0, string.format(TAG_ACHIEVEMENT_EVENT_TEXT[17][1], TAG_COLOR_ACHIEVEMENT[3], TAG_ACHIEVEMENT_INSTANCEEND[conddata4] or TAG_ACHIEVEMENT_INSTANCEEND_DEFAULT, TAG_ACHIEVEMENT_INSTANCENAME[conddata1] or TAG_ACHIEVEMENT_INSTANCENAME_DEFAULT, TAG_ACHIEVEMENT_INSTANCELEVEL[conddata3] or TAG_ACHIEVEMENT_INSTANCENAME_DEFAULT)
			else
				return event_prop[ecount] or 0, string.format(TAG_ACHIEVEMENT_EVENT_TEXT[17][2], TAG_COLOR_ACHIEVEMENT[4], TAG_ACHIEVEMENT_INSTANCEEND[conddata4] or TAG_ACHIEVEMENT_INSTANCEEND_DEFAULT, conddata2, TAG_ACHIEVEMENT_INSTANCENAME[conddata1] or TAG_ACHIEVEMENT_INSTANCENAME_DEFAULT, TAG_ACHIEVEMENT_INSTANCELEVEL[conddata3] or TAG_ACHIEVEMENT_INSTANCENAME_DEFAULT)
			end
		else
			if conddata2 == 1 then
				return -1, string.format(TAG_ACHIEVEMENT_EVENT_TEXT[17][1], TAG_COLOR_ACHIEVEMENT[3], TAG_ACHIEVEMENT_INSTANCEEND[conddata4] or TAG_ACHIEVEMENT_INSTANCEEND_DEFAULT, TAG_ACHIEVEMENT_INSTANCENAME[conddata1] or TAG_ACHIEVEMENT_INSTANCENAME_DEFAULT, TAG_ACHIEVEMENT_INSTANCELEVEL[conddata3] or TAG_ACHIEVEMENT_INSTANCENAME_DEFAULT)
			else
				return -1, string.format(TAG_ACHIEVEMENT_EVENT_TEXT[17][2], TAG_COLOR_ACHIEVEMENT[4], TAG_ACHIEVEMENT_INSTANCEEND[conddata4] or TAG_ACHIEVEMENT_INSTANCEEND_DEFAULT, conddata2, TAG_ACHIEVEMENT_INSTANCENAME[conddata1] or TAG_ACHIEVEMENT_INSTANCENAME_DEFAULT, TAG_ACHIEVEMENT_INSTANCELEVEL[conddata3] or TAG_ACHIEVEMENT_INSTANCENAME_DEFAULT)
			end
		end
	elseif condtype == 20 then
		return event_prop[ecount] or 0, --[[!AUTO_116]]""
	elseif condtype == 24 then
		return event_prop[ecount] or 0, --[[!AUTO_50]]""
	else
		return 0, --[[!AUTO_51]]""
	end
end

--[[成就描述： 状态，进度，描述文字（finishTime大于0表示已完成）]]
function Achievement:GetDesc(idAch, finishTime)
	--LogPrint(idAch)
	--LogPrint(finishTime)
	local lock_state = ACHIEVEMENT_LOCK
	local achi_title = --[[!AUTO_52]]""
	local cur_process = 0
	local total_process = 0
	local achi_desc = --[[!AUTO_53]]""
	local achi_tip = --[[!AUTO_54]]""
	local datatable = Achievement:GetAchieveContent(idAch)
	local player_prop = GameApi.GetPlayerFullProp(0)
	local event_prop = GameApi.GetAchiEventParam(idAch)
	local bUnlock = true
	local achi_award = --[[!AUTO_55]]""
	local flag = 0
	for icount = 1, datatable.Count do
		if datatable[icount].condclass == 1 then
			if Achievement:CheckStatesCond(datatable[icount].condtype, datatable[icount].conddata1, datatable[icount].conddata2, datatable[icount].conddata3, datatable[icount].conddata4, player_prop) == false then
				bUnlock = false
				break
			end
		end
	end
	if bUnlock then
		lock_state = ACHIEVEMENT_UNLOCK
		local unlockstring = {}
		local ilock = 0
		local ifin = 0
		local fstslot = 0
		local condcount = {}
		local unlockcount = 0
		for icount = 1, datatable.Count do
			if datatable[icount].condclass == 1 then
				unlockcount = unlockcount + 1
			end
		end
		for icount = 1, datatable.Count do
			if datatable[icount].condclass == 2 then
				ilock = ilock + 1
				condcount[ilock], unlockstring[ilock] = Achievement:GetStatesCondString(datatable[icount].condtype, datatable[icount].conddata1, datatable[icount].conddata2, datatable[icount].conddata3, datatable[icount].conddata4, player_prop)
				if condcount[ilock] == -1 then
					ifin = ifin + 1
				end
				if fstslot == 0 then
					fstslot = ilock
				end
			end
		end
		local ecount = 0
		for icount = 1, datatable.Count do
			if datatable[icount].condclass == 3 then
				ecount = ecount + 1
				ilock = ilock + 1
				condcount[ilock], unlockstring[ilock] = Achievement:GetEventCondString(datatable[icount].condtype, datatable[icount].conddata1, datatable[icount].conddata2, datatable[icount].conddata3, datatable[icount].conddata4, event_prop, ecount)
				if condcount[ilock] == -1 then
					ifin = ifin + 1
				end
				if fstslot == 0 then
					fstslot = ilock
				end
			end
		end
		if ilock == 1 then
			achi_desc = TAG_COLOR_ACHIEVEMENT[2] .. TAG_ACHIEVEMENT_UNLOCK_TEXT .. unlockstring[1]
			for k,v in pairs(Achievement.SpecialAchievementType) do
				if datatable[fstslot+unlockcount].condtype == v.Type then
					flag = 1
					break;
				end
			end
			if flag == 1 then
				if datatable[fstslot+unlockcount].conddata1 > 0 then
					total_process = datatable[fstslot + unlockcount].conddata1
					if condcount[fstslot] == -1 then
						cur_process = total_process
					else
						cur_process = condcount[fstslot]
					end
				else
					cur_process = 0
					total_process = 0
				end
			else
				if datatable[fstslot+unlockcount].conddata2 > 0 and datatable[fstslot+unlockcount].condtype ~= 9 and datatable[fstslot+unlockcount].condtype ~= 10 then
					total_process = datatable[fstslot + unlockcount].conddata2
					if condcount[fstslot] == -1 then
						cur_process = total_process
					else
						cur_process = condcount[fstslot]
					end
				else
					cur_process = 0
					total_process = 0
				end
			end
			achi_tip = achi_desc
		else
			achi_desc = TAG_COLOR_ACHIEVEMENT[2] .. string.format(TAG_ACHIEVEMENT_UNLOCK_MULTICONDS_TEXT, ilock)
			cur_process = ifin
			total_process = ilock
			achi_tip = Achievement:StringCombiner(TAG_COLOR_ACHIEVEMENT[2] .. TAG_ACHIEVEMENT_UNLOCK_TEXT .. --[[!AUTO_56]]"\r\r", unlockstring, TAG_COLOR_ACHIEVEMENT[1] .. --[[!AUTO_57]]"\r")
		end
		for k, v in pairs(Achievement.Templ) do
			if v.ID == idAch then
				if v.spestr then
					if finishTime > 0 then
						achi_desc = TAG_COLOR_ACHIEVEMENT[2] .. TAG_ACHIEVEMENT_UNLOCK_TEXT .. TAG_COLOR_ACHIEVEMENT[4] .. Achievement.Templ[k].spestr
					else
						achi_desc = TAG_COLOR_ACHIEVEMENT[2] .. TAG_ACHIEVEMENT_UNLOCK_TEXT .. TAG_COLOR_ACHIEVEMENT[3] .. Achievement.Templ[k].spestr
					end
				end
				if v.Award then
					achi_award = Achievement.Templ[k].Award
				end
				break
			end
		end
		if finishTime > 0 then
			achi_title = TAG_COLOR_ACHIEVEMENT[2] .. datatable.Name
		else
			achi_title = TAG_COLOR_ACHIEVEMENT[1] .. datatable.Name
		end
	else
		lock_state = ACHIEVEMENT_LOCK
		local lockstring = {}
		local ilock = 0
		for icount = 1, datatable.Count do
			if datatable[icount].condclass == 1 then
				ilock = ilock + 1
				_, lockstring[ilock] = Achievement:GetStatesCondString(datatable[icount].condtype, datatable[icount].conddata1, datatable[icount].conddata2, datatable[icount].conddata3, datatable[icount].conddata4, player_prop)
			end
		end
		achi_desc = Achievement:StringCombiner(TAG_COLOR_ACHIEVEMENT[2] .. TAG_ACHIEVEMENT_LOCK_TEXT, lockstring, TAG_COLOR_ACHIEVEMENT[1] .. --[[!AUTO_58]]"，")
		cur_process = 0
		total_process = 0
		achi_tip = --[[!AUTO_59]]""
		achi_title = TAG_COLOR_ACHIEVEMENT[3] .. TAG_ACHIEVEMENT_LOCK_TITLE
	end
	--[[
	if idAch == 41 then
		LogPrint("Begin")
		LogPrint(lock_state)
		LogPrint(achi_title)
		LogPrint(total_process)
		LogPrint(cur_process)
		LogPrint(achi_desc)
		LogPrint(achi_tip)
		LogPrint("End")
	end
	]]--
	if finishTime > 0 then
		if total_process > 0 then
			return lock_state, achi_title, total_process, total_process, string.gsub(achi_desc or --[[!AUTO_60]]"", TAG_COLOR_ACHIEVEMENT[8], TAG_COLOR_ACHIEVEMENT[9]), string.gsub(achi_tip or --[[!AUTO_61]]"", TAG_COLOR_ACHIEVEMENT[8], TAG_COLOR_ACHIEVEMENT[9]) or --[[!AUTO_62]]"", achi_award
		else
			return lock_state, achi_title, cur_process, total_process, achi_desc, achi_tip, achi_award
		end
	else
		return lock_state, achi_title, cur_process, total_process, achi_desc, achi_tip, achi_award
	end
end


--[[测试成就模板取数功能]]
function Achievement:TestAch(idAch)
	LogPrint(--[[!AUTO_63]]"---------------------------------------------------")
	local datatable = Achievement:GetAchieveContent(idAch)
	local icount
	LogPrint(string.format(--[[!AUTO_64]]"Achievement ID: %d", idAch))
	LogPrint(string.format(--[[!AUTO_65]]"Condition Cnts: %d", datatable.Count))
	LogPrint(--[[!AUTO_66]]"Data:\tclass\ttype\tdata1\tdata2\tdata3")
	for icount = 1, datatable.Count do
		LogPrint(string.format(--[[!AUTO_67]]"[%d] \t%d\t%d\t%d\t%d\t%d", icount, datatable[icount].condclass, datatable[icount].condtype, datatable[icount].conddata1, datatable[icount].conddata2, datatable[icount].conddata3, player_prop))
	end
	LogPrint(--[[!AUTO_68]]"---------------------------------------------------")
end

--[[测试角色数据获取]]
function Achievement:TestData(idAch, idType, idTask)
	LogPrint(--[[!AUTO_69]]"---------------------------------------------------")
	local player_prop = GameApi.GetPlayerFullProp(0)
	LogPrint(string.format(--[[!AUTO_70]]"%s : %s", --[[!AUTO_71]]"角色名稱", player_prop["name"]))
	local string_gender = {--[[!AUTO_72]]"0（男）", --[[!AUTO_73]]"1（女）"}
	LogPrint(string.format(--[[!AUTO_74]]"%s : %s", --[[!AUTO_75]]"角色性別", string_gender[player_prop["gender"]+1]))
	local string_prof = {--[[!AUTO_76]]"0（新手）", --[[!AUTO_77]]"1（少林）", --[[!AUTO_78]]"2（武當）", --[[!AUTO_79]]"3（華山）", --[[!AUTO_80]]"4（恒山）", --[[!AUTO_81]]"5（衡山）", --[[!AUTO_82]]"6（日月）", --[[!AUTO_83]]"7（五仙）", --[[!AUTO_84]]"8（逍遙）", --[[!AUTO_85]]"9（唐門）", --[[!AUTO_86]]"10（恒山）"}
	LogPrint(string.format(--[[!AUTO_87]]"%s : %s", --[[!AUTO_88]]"角色職業", string_prof[player_prop["prof"]+1]))
	--LogPrint(string.format("%s : %s", "角色职业等级", player_prop["proflevel"]))
	--LogPrint(string.format("%s : %s", "角色副职业", player_prop["prof2"]))
	--LogPrint(string.format("%s : %s", "角色副职业等级", player_prop["proflevel2"]))
	LogPrint(string.format(--[[!AUTO_89]]"%s : %s", --[[!AUTO_90]]"角色等級", player_prop["level"]))
	LogPrint(string.format(--[[!AUTO_91]]"%s : %s", --[[!AUTO_92]]"當前經驗", player_prop["exp"]))
	--LogPrint(string.format("%s : %s", "气血值", player_prop["hp"]))
	LogPrint(string.format(--[[!AUTO_93]]"%s : %s", --[[!AUTO_94]]"氣血上限", player_prop["maxhp"]))
	--LogPrint(string.format("%s : %s", "内力值", player_prop["mp1"]))
	LogPrint(string.format(--[[!AUTO_95]]"%s : %s", --[[!AUTO_96]]"內力上限", player_prop["maxmp1"]))
	--LogPrint(string.format("%s : %s", "破绽值", player_prop["mp2"]))
	LogPrint(string.format(--[[!AUTO_97]]"%s : %s", --[[!AUTO_98]]"破綻上限", player_prop["maxmp2"]))
	LogPrint(string.format(--[[!AUTO_99]]"%s : %s", --[[!AUTO_100]]"行走速度", player_prop["walk_speed"]))
	LogPrint(string.format(--[[!AUTO_101]]"%s : %s", --[[!AUTO_102]]"奔跑速度", player_prop["run_speed"]))
	LogPrint(string.format(--[[!AUTO_103]]"%s : %s", --[[!AUTO_104]]"最快速度", player_prop["max_speed"]))
	LogPrint(string.format(--[[!AUTO_105]]"%s : %s", --[[!AUTO_106]]"玩家技能點", player_prop["skill_point"]))
	--LogPrint(string.format("%s : %s", "普通视距", player_prop["normal_attack_sight"]))
	--LogPrint(string.format("%s : %s", "合法视距", player_prop["valid_attack_sight"]))
	--LogPrint(string.format("%s : %s", "玩家帮派", player_prop["faction"]))
	--LogPrint(string.format("%s : %s", "帮派贡献", player_prop["fation_contrbution"]))
	--LogPrint(string.format("%s : %s", "玩家家族", player_prop["family"]))
	--LogPrint(string.format("%s : %s", "家族贡献", player_prop["family_contributon"]))
	--LogPrint(string.format("%s : %s", "玩家配偶", player_prop["spouse"]))
	--LogPrint(string.format("%s : %s", "玩家PK值", player_prop["pklevel"]))
	if idAch > 0 then
		local event_prop = GameApi.GetAchiEventParam(idAch)
		if event_prop then
			LogPrint(string.format(--[[!AUTO_107]]"事件參數：%d/t%d/t%d/t%d/t%d/t%d/t%d/t%d", event_prop[1], event_prop[2], event_prop[3], event_prop[4], event_prop[5], event_prop[6], event_prop[7], event_prop[8]))
		else
			LogPrint(--[[!AUTO_108]]"事件參數：空")
		end
	end
	if idType > 0 then
		local num = GameApi.GetFinishedTaskNum(idType)
		LogPrint(string.format(--[[!AUTO_109]]"類型為%d的一次性任務完成總數為：%d", idType, num))
	end
	if idTask > 0 then
		local state,times = GameApi.GetTaskCompInfo(idTask)
		local string_state = {--[[!AUTO_110]]"0（未接）", --[[!AUTO_111]]"1（已接）", --[[!AUTO_112]]"2（已完成）"}
		LogPrint(string.format(--[[!AUTO_113]]"ID為%d的任務當前狀態為：%s", idTask, string_state[state + 1]))
		LogPrint(string.format(--[[!AUTO_114]]"ID為%d的任務完成次數為：%d", idTask, times))
	end
	LogPrint(--[[!AUTO_115]]"---------------------------------------------------")
end
