--[[#tag push auto]]

----------------------------------------------------------------------
--称号定义和目录结构

--Creator: DJH
--下面函数不需要修改，只需要修改数据配置

----------------------------------------------------------------------
title_info		 = {}
title_definition = {}
title_dir        = {}

function title_info:GetTitleInfo()
	return title_definition
end

function title_info:GetDirInfo()
	return title_dir
end

----------------------------------------------------------------------
--称号颜色定义及排序：
---1 = ff0000 红色
---2 = a800ff 紫色
---3 = ffbc3c 浅黄
---4 = ff7d2f 桔红
---5 = 09a3e2 湖蓝, f06ea9 粉红
---6 = ffffff 白色
---增加新色需找程序,否则显示不出来---[ over ]
----------------------------------------------------------------------
--称号定义: id,note,desc,image必须齐全
--通配符：  $S表示婚姻关系，$F表示结义关系，$T表示师徒关系，$L表示品阶，$G帮派职务
----------------------------------------------------------------------
title_definition["测试称号1"] =
{
	id = 1 ,
	note = --[[!AUTO_1]]"^f06ea9【$S的相公】" ,
	desc = --[[!AUTO_2]]"執子之手，與子偕老。",
	image = --[[!AUTO_3]]"",
}

title_definition["测试称号2"] =
{
	id = 2 ,
	note = --[[!AUTO_4]]"^f06ea9【$S的娘子】" ,
	desc = --[[!AUTO_5]]"盈盈一水間，白首不相離。" ,
	image = --[[!AUTO_6]]"",
}

title_definition["测试称号3"] =
{
	id = 3 ,
	note = --[[!AUTO_7]]"^ffbc3c【$F】" ,
	desc = --[[!AUTO_8]]"有福同享，有難同當" ,
	image = --[[!AUTO_9]]"",
}

title_definition["测试称号4"] =
{
	id = 4 ,
	note = --[[!AUTO_10]]"^ffbc3c【$T的徒弟】" ,
	desc = --[[!AUTO_11]]"一日為師，終生為父" ,
	image = --[[!AUTO_12]]"",
}

title_definition['帮派_荣誉称号'] =
{
	id = 6 ,
	note = --[[!AUTO_13]]"^ffbc3c【$L】" ,
	desc = --[[!AUTO_14]]"" ,
	image = --[[!AUTO_15]]"",
}
title_definition["师徒_绝情师傅"] =
{
	id = 1105 ,
	note = --[[!AUTO_16]]"^ff7d2f絕情師傅" ,
	desc = --[[!AUTO_17]]"碎盡天下美徒心" ,
	image = --[[!AUTO_18]]"" ,
}

title_definition['家园_家园大盗'] =
{
	id = 1106 ,
	note = --[[!AUTO_19]]"^ff7d2f【家園大盜】" ,
	desc = --[[!AUTO_20]]"順菜不算偷，下次我還來" ,
	image = --[[!AUTO_21]]"",
}

title_definition['擂台新手'] =
{
	id = 2001 ,
	note = --[[!AUTO_22]]"^09a3e2【新秀】" ,
	desc = --[[!AUTO_23]]"新秀階段，武林聲望達到1，朝秀。" ,
	image = --[[!AUTO_24]]"",
}

title_definition['新秀一级'] =
{
	id = 2002 ,
	note = --[[!AUTO_25]]"^09a3e2【朝秀】" ,
	desc = --[[!AUTO_26]]"新秀階段，武林聲望達到200，朝秀。" ,
	image = --[[!AUTO_27]]"",
}

title_definition['新秀二级'] =
{
	id = 2003 ,
	note = --[[!AUTO_28]]"^09a3e2【芸秀】" ,
	desc = --[[!AUTO_29]]"新秀階段，武林聲望達到440，芸秀。" ,
	image = --[[!AUTO_30]]"",
}

title_definition['新秀三级'] =
{
	id = 2004 ,
	note = --[[!AUTO_31]]"^09a3e2【晗秀】" ,
	desc = --[[!AUTO_32]]"新秀階段，武林聲望達到720，晗秀。" ,
	image = --[[!AUTO_33]]"",
}

title_definition['新秀四级'] =
{
	id = 2005 ,
	note = --[[!AUTO_34]]"^09a3e2【明秀】" ,
	desc = --[[!AUTO_35]]"新秀階段，武林聲望達到1040，明秀。" ,
	image = --[[!AUTO_36]]"",
}

title_definition['新秀五级'] =
{
	id = 2006 ,
	note = --[[!AUTO_37]]"^09a3e2【瑾秀】" ,
	desc = --[[!AUTO_38]]"新秀階段，武林聲望達到1400，瑾秀。" ,
	image = --[[!AUTO_39]]"",
}

title_definition['新秀六级'] =
{
	id = 2007 ,
	note = --[[!AUTO_40]]"^09a3e2【鋒秀】" ,
	desc = --[[!AUTO_41]]"新秀階段，武林聲望達到1800，鋒秀。" ,
	image = --[[!AUTO_42]]"",
}

title_definition['新秀七级'] =
{
	id = 2008 ,
	note = --[[!AUTO_43]]"^09a3e2【奇秀】" ,
	desc = --[[!AUTO_44]]"新秀階段，武林聲望達到2240，奇秀。" ,
	image = --[[!AUTO_45]]"",
}

title_definition['新秀八级'] =
{
	id = 2009 ,
	note = --[[!AUTO_46]]"^09a3e2【鴻秀】" ,
	desc = --[[!AUTO_47]]"新秀階段，武林聲望達到2720，鴻秀。" ,
	image = --[[!AUTO_48]]"",
}

title_definition['新秀九级'] =
{
	id = 2010 ,
	note = --[[!AUTO_49]]"^09a3e2【茗秀】" ,
	desc = --[[!AUTO_50]]"新秀階段，武林聲望達到3240，茗秀。" ,
	image = --[[!AUTO_51]]"",
}

title_definition['武林名士'] =
{
	id = 2011 ,
	note = --[[!AUTO_52]]"^ff7d2f【昭聖】" ,
	desc = --[[!AUTO_53]]"聖者階段，武林聲望達到4440，昭聖。" ,
	image = --[[!AUTO_54]]"",
}

title_definition['高手一段'] =
{
	id = 2012 ,
	note = --[[!AUTO_55]]"^ff7d2f【曙聖】" ,
	desc = --[[!AUTO_56]]"聖者階段，武林聲望達到6040，曙聖。" ,
	image = --[[!AUTO_57]]"",
}

title_definition['高手二段'] =
{
	id = 2013 ,
	note = --[[!AUTO_58]]"^ff7d2f【道聖】" ,
	desc = --[[!AUTO_59]]"聖者階段，武林聲望達到8040，道聖。" ,
	image = --[[!AUTO_60]]"",
}

title_definition['高手三段'] =
{
	id = 2014 ,
	note = --[[!AUTO_61]]"^ff7d2f【儒聖】" ,
	desc = --[[!AUTO_62]]"聖者階段，武林聲望達到10440，儒聖。" ,
	image = --[[!AUTO_63]]"",
}

title_definition['高手四段'] =
{
	id = 2015 ,
	note = --[[!AUTO_64]]"^ff7d2f【義聖】" ,
	desc = --[[!AUTO_65]]"聖者階段，武林聲望達到13240，義聖。" ,
	image = --[[!AUTO_66]]"",
}

title_definition['高手五段'] =
{
	id = 2016 ,
	note = --[[!AUTO_67]]"^ff7d2f【羿聖】" ,
	desc = --[[!AUTO_68]]"聖者階段，武林聲望達到16440，羿聖。" ,
	image = --[[!AUTO_69]]"",
}

title_definition['高手六段'] =
{
	id = 2017 ,
	note = --[[!AUTO_70]]"^ff7d2f【玄聖】" ,
	desc = --[[!AUTO_71]]"聖者階段，武林聲望達到20040，玄聖。" ,
	image = --[[!AUTO_72]]"",
}

title_definition['高手七段'] =
{
	id = 2018 ,
	note = --[[!AUTO_73]]"^ff7d2f【靖聖】" ,
	desc = --[[!AUTO_74]]"聖者階段，武林聲望達到24040，靖聖。" ,
	image = --[[!AUTO_75]]"",
}

title_definition['高手八段'] =
{
	id = 2019 ,
	note = --[[!AUTO_76]]"^ff7d2f【銘聖】" ,
	desc = --[[!AUTO_77]]"聖者階段，武林聲望達到28440，銘聖。" ,
	image = --[[!AUTO_78]]"",
}

title_definition['高手九段'] =
{
	id = 2020 ,
	note = --[[!AUTO_79]]"^ff7d2f【尊聖】" ,
	desc = --[[!AUTO_80]]"聖者階段，武林聲望達到33240，尊聖。" ,
	image = --[[!AUTO_81]]"",
}

title_definition['武林至尊'] =
{
	id = 2021 ,
	note = --[[!AUTO_82]]"^a800ff【嫋尊】" ,
	desc = --[[!AUTO_83]]"至尊階段，武林聲望達到40440，嫋尊。" ,
	image = --[[!AUTO_84]]"",
}

title_definition['至尊一位'] =
{
	id = 2022 ,
	note = --[[!AUTO_85]]"^a800ff【玹尊】" ,
	desc = --[[!AUTO_86]]"至尊階段，武林聲望達到48840，玹尊。" ,
	image = --[[!AUTO_87]]"",
}

title_definition['至尊二位'] =
{
	id = 2023 ,
	note = --[[!AUTO_88]]"^a800ff【蛟尊】" ,
	desc = --[[!AUTO_89]]"至尊階段，武林聲望達到58440，蛟尊。" ,
	image = --[[!AUTO_90]]"",
}

title_definition['至尊三位'] =
{
	id = 2024 ,
	note = --[[!AUTO_91]]"^a800ff【武尊】" ,
	desc = --[[!AUTO_92]]"至尊階段，武林聲望達到69240，武尊。" ,
	image = --[[!AUTO_93]]"",
}

title_definition['至尊四位'] =
{
	id = 2025 ,
	note = --[[!AUTO_94]]"^a800ff【麒尊】" ,
	desc = --[[!AUTO_95]]"至尊階段，武林聲望達到81240，麒尊。" ,
	image = --[[!AUTO_96]]"",
}

title_definition['至尊五位'] =
{
	id = 2026 ,
	note = --[[!AUTO_97]]"^a800ff【地尊】" ,
	desc = --[[!AUTO_98]]"至尊階段，武林聲望達到94440，地尊。" ,
	image = --[[!AUTO_99]]"",
}

title_definition['至尊六位'] =
{
	id = 2027 ,
	note = --[[!AUTO_100]]"^a800ff【天尊】" ,
	desc = --[[!AUTO_101]]"至尊階段，武林聲望達到108840，天尊。" ,
	image = --[[!AUTO_102]]"",
}

title_definition['至尊七位'] =
{
	id = 2028 ,
	note = --[[!AUTO_103]]"^a800ff【太尊】" ,
	desc = --[[!AUTO_104]]"至尊階段，武林聲望達到124440，太尊。" ,
	image = --[[!AUTO_105]]"",
}

title_definition['至尊八位'] =
{
	id = 2029 ,
	note = --[[!AUTO_106]]"^a800ff【至尊】" ,
	desc = --[[!AUTO_107]]"至尊階段，武林聲望達到141240，至尊。" ,
	image = --[[!AUTO_108]]"",
}

title_definition['至尊九位'] =
{
	id = 2030 ,
	note = --[[!AUTO_109]]"^ff0000【不敗】" ,
	desc = --[[!AUTO_110]]"至尊階段，武林聲望達到159240，不敗。" ,
	image = --[[!AUTO_111]]"",
}

title_definition['武林盟主'] =
{
	id = 255 ,
	note = --[[!AUTO_112]]"^ff0000【武林盟主】" ,
	desc = --[[!AUTO_113]]"在武林盟主戰中力壓群雄，稱霸天下，坐鎮中嶽嵩山。" ,
	image = --[[!AUTO_114]]"",
}

title_definition['嵩山天帝'] =
{
	id = 256 ,
	note = --[[!AUTO_115]]"^ff7d2f【嵩山天帝】" ,
	desc = --[[!AUTO_116]]"在武林盟主戰中宛如天帝主宰，揮手間抹殺千人如同兒戲。" ,
	image = --[[!AUTO_117]]"",
}

title_definition['嵩山死神'] =
{
	id = 257 ,
	note = --[[!AUTO_118]]"^a800ff【嵩山死神】" ,
	desc = --[[!AUTO_119]]"在武林盟主戰中宛如死神降臨，收割五百人性命。" ,
	image = --[[!AUTO_120]]"",
}
----亲王
title_definition['亲王1'] =
{
	id = 1110 ,
	note = --[[!AUTO_121]]"^ff0000【福王】" ,
	desc = --[[!AUTO_122]]"朝廷功勳一等爵，福王。" ,
	image = --[[!AUTO_123]]"",
}

title_definition['亲王2'] =
{
	id = 1111 ,
	note = --[[!AUTO_124]]"^ff0000【慶王】" ,
	desc = --[[!AUTO_125]]"朝廷功勳二等爵，慶王。" ,
	image = --[[!AUTO_126]]"",
}
----公爵
title_definition['公爵1'] =
{
	id = 1112 ,
	note = --[[!AUTO_127]]"^ff7d2f【賢公】" ,
	desc = --[[!AUTO_128]]"朝廷功勳三等爵，賢公。" ,
	image = --[[!AUTO_129]]"",
}

title_definition['公爵2'] =
{
	id = 1113 ,
	note = --[[!AUTO_130]]"^ff7d2f【義公】" ,
	desc = --[[!AUTO_131]]"朝廷功勳四等爵，義公。" ,
	image = --[[!AUTO_132]]"",
}

title_definition['公爵3'] =
{
	id = 1114 ,
	note = --[[!AUTO_133]]"^ff7d2f【衛公】" ,
	desc = --[[!AUTO_134]]"朝廷功勳五等爵，衛公。" ,
	image = --[[!AUTO_135]]"",
}
-----侯爵
title_definition['侯爵1'] =
{
	id = 1115 ,
	note = --[[!AUTO_136]]"^a800ff【靖武侯】" ,
	desc = --[[!AUTO_137]]"朝廷功勳六等爵，靖武侯。" ,
	image = --[[!AUTO_138]]"",
}

title_definition['侯爵2'] =
{
	id = 1116 ,
	note = --[[!AUTO_139]]"^a800ff【英武侯】" ,
	desc = --[[!AUTO_140]]"朝廷功勳七等爵，英武侯。" ,
	image = --[[!AUTO_141]]"",
}

title_definition['侯爵3'] =
{
	id = 1117 ,
	note = --[[!AUTO_142]]"^a800ff【勇武侯】" ,
	desc = --[[!AUTO_143]]"朝廷功勳八等爵，勇武侯。" ,
	image = --[[!AUTO_144]]"",
}

title_definition['侯爵4'] =
{
	id = 1118 ,
	note = --[[!AUTO_145]]"^a800ff【平武侯】" ,
	desc = --[[!AUTO_146]]"朝廷功勳九等爵，平武侯。" ,
	image = --[[!AUTO_147]]"",
}

title_definition["帮主10"] =
{
	id = 1201 ,
	note = --[[!AUTO_148]]"^ff0000【天下第一幫主】" ,
	desc = --[[!AUTO_149]]"《笑傲江湖》第一幫幫主",
	image = --[[!AUTO_150]]"",
}

title_definition["帮主20"] =
{
	id = 1202 ,
	note = --[[!AUTO_151]]"^ff7d2f【天下第二幫主】" ,
	desc = --[[!AUTO_152]]"《笑傲江湖》第二幫幫主",
	image = --[[!AUTO_153]]"",
}

title_definition["竞技1"] =
{
	             id = 1220 ,
	             note = --[[!AUTO_154]]"^ff0000【風雲】" ,
	             desc = --[[!AUTO_155]]"笑傲風雲上，縱橫天地間。",
	             image = --[[!AUTO_156]]"",
}

title_definition["竞技2"] =
{
	             id = 1221 ,
	             note = --[[!AUTO_157]]"^ff7d2f【天涯】" ,
	             desc = --[[!AUTO_158]]"明月天涯路遠，問誰能笑傲，弄影江湖？",
	             image = --[[!AUTO_159]]"",
}

title_definition["竞技3"] =
{
	             id = 1222,
	             note = --[[!AUTO_160]]"^a800ff【流星】" ,
	             desc = --[[!AUTO_161]]"銀鞍照白馬，颯遝如流星",
	             image = --[[!AUTO_162]]"",
}

title_definition["师德1"] =
{
	             id = 1230 ,
	             note = --[[!AUTO_163]]"^ff7d2f【春秋】" ,
	             desc = --[[!AUTO_164]]"春播桃李三千圃，秋來碩果滿神州。",
	             image = --[[!AUTO_165]]"",
}

title_definition["师德2"] =
{
	             id = 1231 ,
	             note = --[[!AUTO_166]]"^a800ff【尊師】" ,
	             desc = --[[!AUTO_167]]"為學莫重於尊師。",
	             image = --[[!AUTO_168]]"",
}

title_definition["师德3"] =
{
	             id = 1232,
	             note = --[[!AUTO_169]]"^a800ff【師者】" ,
	             desc = --[[!AUTO_170]]"師者，所以傳道，授業，解惑也。",
	             image = --[[!AUTO_171]]"",
}

title_definition["游侠1"] =
{
	             id = 1241,
	             note = --[[!AUTO_172]]"^ff0000【帶頭大哥】" ,
	             desc = --[[!AUTO_173]]"遊俠戰盟的帶頭人物。",
	             image = --[[!AUTO_174]]"",
}

title_definition["游侠2"] =
{
	             id = 1242,
	             note = --[[!AUTO_175]]"^ff7d2f【青龍】" ,
	             desc = --[[!AUTO_176]]"遊俠戰盟的二號人物。",
	             image = --[[!AUTO_177]]"",
}

title_definition["游侠3"] =
{
	             id = 1243,
	             note = --[[!AUTO_178]]"^ff7d2f【白虎】" ,
	             desc = --[[!AUTO_179]]"遊俠戰盟的三號人物。",
	             image = --[[!AUTO_180]]"",
}

title_definition["游侠4"] =
{
	             id = 1244,
	             note = --[[!AUTO_181]]"^ff7d2f【朱雀】" ,
	             desc = --[[!AUTO_182]]"遊俠戰盟的四號人物。",
	             image = --[[!AUTO_183]]"",
}

title_definition["游侠5"] =
{
	             id = 1245,
	             note = --[[!AUTO_184]]"^ff7d2f【玄武】" ,
	             desc = --[[!AUTO_185]]"遊俠戰盟的五號人物。",
	             image = --[[!AUTO_186]]"",
}

title_definition["烟花1"] =
{
	             id = 1246,
	             note = --[[!AUTO_184]]"^a800ff【煙景風華】" ,
	             desc = --[[!AUTO_185]]"煙花繞層曲，不知寂寞冷",
	             image = --[[!AUTO_186]]"",
} 

title_definition["鲜花1"] =
{
	             id = 1247,
	             note = "^a800ff【傾世】" ,
	             desc = "一曲凝煙終似夢，不知醉舞動京城",
	             image = "",
} 

title_definition["鲜花2"] =
{
	             id = 1248,
	             note = "^a800ff【驚鴻】" ,
	             desc = "浩浩乎如馮虛禦風，飄飄乎如遺世獨立",
	             image = "",
}

title_definition["任盈盈求爱好感度1"] =
{
	             id = 3001,
	             note = --[[!AUTO_187]]"^a800ff【任盈盈的唯一】" ,
	             desc = --[[!AUTO_188]]"",
	             image = --[[!AUTO_189]]"",
}

title_definition["任盈盈求爱好感度2"] =
{
	             id = 3002,
	             note = --[[!AUTO_190]]"^a800ff【任盈盈的知己】" ,
	             desc = --[[!AUTO_191]]"",
	             image = --[[!AUTO_192]]"",
}

title_definition["任盈盈求爱好感度3"] =
{
	             id = 3003,
	             note = --[[!AUTO_193]]"^a800ff【任盈盈的備胎】" ,
	             desc = --[[!AUTO_194]]"",
	             image = --[[!AUTO_195]]"",
}
title_definition["任盈盈求爱好感度4"] =
{
	             id = 3019,
	             note = --[[!AUTO_196]]"^a800ff【任盈盈的粉絲】" ,
	             desc = --[[!AUTO_197]]"",
	             image = --[[!AUTO_198]]"",
}

title_definition["岳灵珊求爱好感度1"] =
{
	             id = 3004,
	             note = --[[!AUTO_199]]"^a800ff【岳靈珊的唯一】" ,
	             desc = --[[!AUTO_200]]"",
	             image = --[[!AUTO_201]]"",
}

title_definition["岳灵珊求爱好感度2"] =
{
	             id = 3005,
	             note = --[[!AUTO_202]]"^a800ff【岳靈珊的知己】" ,
	             desc = --[[!AUTO_203]]"",
	             image = --[[!AUTO_204]]"",
}

title_definition["岳灵珊求爱好感度3"] =
{
	             id = 3006,
	             note = --[[!AUTO_205]]"^a800ff【岳靈珊的備胎】" ,
	             desc = --[[!AUTO_206]]"",
	             image = --[[!AUTO_207]]"",
}

title_definition["岳灵珊求爱好感度4"] =
{
	             id = 3020,
	             note = --[[!AUTO_208]]"^a800ff【岳靈珊的粉絲】" ,
	             desc = --[[!AUTO_209]]"",
	             image = --[[!AUTO_210]]"",
}

title_definition["林平之求爱好感度1"] =
{
	             id = 3007,
	             note = --[[!AUTO_211]]"^a800ff【林平之的唯一】" ,
	             desc = --[[!AUTO_212]]"",
	             image = --[[!AUTO_213]]"",
}

title_definition["林平之求爱好感度2"] =
{
	             id = 3008,
	             note = --[[!AUTO_214]]"^a800ff【林平之的知己】" ,
	             desc = --[[!AUTO_215]]"",
	             image = --[[!AUTO_216]]"",
}

title_definition["林平之求爱好感度3"] =
{
	             id = 3009,
	             note = --[[!AUTO_217]]"^a800ff【林平之的備胎】" ,
	             desc = --[[!AUTO_218]]"",
	             image = --[[!AUTO_219]]"",
}

title_definition["林平之求爱好感度4"] =
{
	             id = 3021,
	             note = --[[!AUTO_220]]"^a800ff【林平之的粉絲】" ,
	             desc = --[[!AUTO_221]]"",
	             image = --[[!AUTO_222]]"",
}

title_definition["仪琳求爱好感度1"] =
{
	             id = 3010,
	             note = --[[!AUTO_223]]"^a800ff【儀琳的唯一】" ,
	             desc = --[[!AUTO_224]]"",
	             image = --[[!AUTO_225]]"",
}

title_definition["仪琳求爱好感度2"] =
{
	             id = 3011,
	             note = --[[!AUTO_226]]"^a800ff【儀琳的知己】" ,
	             desc = --[[!AUTO_227]]"",
	             image = --[[!AUTO_228]]"",
}

title_definition["仪琳求爱好感度3"] =
{
	             id = 3012,
	             note = --[[!AUTO_229]]"^a800ff【儀琳的備胎】" ,
	             desc = --[[!AUTO_230]]"",
	             image = --[[!AUTO_231]]"",
}

title_definition["仪琳求爱好感度4"] =
{
	             id = 3022,
	             note = --[[!AUTO_232]]"^a800ff【儀琳的粉絲】" ,
	             desc = --[[!AUTO_233]]"",
	             image = --[[!AUTO_234]]"",
}

title_definition["蓝凤凰爱好感度1"] =
{
	             id = 3013,
	             note = --[[!AUTO_235]]"^a800ff【藍鳳凰的唯一】" ,
	             desc = --[[!AUTO_236]]"",
	             image = --[[!AUTO_237]]"",
}

title_definition["蓝凤凰求爱好感度2"] =
{
	             id = 3014,
	             note = --[[!AUTO_238]]"^a800ff【藍鳳凰的知己】" ,
	             desc = --[[!AUTO_239]]"",
	             image = --[[!AUTO_240]]"",
}

title_definition["蓝凤凰求爱好感度3"] =
{
	             id = 3015,
	             note = --[[!AUTO_241]]"^a800ff【藍鳳凰的備胎】" ,
	             desc = --[[!AUTO_242]]"",
	             image = --[[!AUTO_243]]"",
}

title_definition["蓝凤凰求爱好感度4"] =
{
	             id = 3023,
	             note = --[[!AUTO_244]]"^a800ff【藍鳳凰的粉絲】" ,
	             desc = --[[!AUTO_245]]"",
	             image = --[[!AUTO_246]]"",
}

title_definition["田伯光爱好感度1"] =
{
	             id = 3016,
	             note = --[[!AUTO_247]]"^a800ff【田伯光的唯一】" ,
	             desc = --[[!AUTO_248]]"",
	             image = --[[!AUTO_249]]"",
}

title_definition["田伯光求爱好感度2"] =
{
	             id = 3017,
	             note = --[[!AUTO_250]]"^a800ff【田伯光的知己】" ,
	             desc = --[[!AUTO_251]]"",
	             image = --[[!AUTO_252]]"",
}

title_definition["田伯光求爱好感度3"] =
{
	             id = 3018,
	             note = --[[!AUTO_253]]"^a800ff【田伯光的備胎】" ,
	             desc = --[[!AUTO_254]]"",
	             image = --[[!AUTO_255]]"",
}

title_definition["田伯光求爱好感度4"] =
{
	             id = 3024,
	             note = --[[!AUTO_256]]"^a800ff【田伯光的粉絲】" ,
	             desc = --[[!AUTO_257]]"",
	             image = --[[!AUTO_258]]"",
}

title_definition["血战1"] =
{
	             id = 1251,
	             note = --[[!AUTO_259]]"^ff7d2f【幻滅】" ,
	             desc = --[[!AUTO_260]]"[血戰英雄]滄海、紅塵、紫陌、碧落，其實都是幻滅",
	             image = --[[!AUTO_261]]"",
}

title_definition["血战2"] =
{
	             id = 1252,
	             note = --[[!AUTO_262]]"^a800ff【滄海】" ,
	             desc = --[[!AUTO_263]]"[血戰英雄]相濡以沫，不如相忘於江湖",
	             image = --[[!AUTO_264]]"",
}

title_definition["血战3"] =
{
	             id = 1253,
	             note = --[[!AUTO_265]]"^a800ff【紅塵】" ,
	             desc = --[[!AUTO_266]]"[血戰英雄]把酒祝東風，且誰共從容",
	             image = --[[!AUTO_267]]"",
}

title_definition["血战4"] =
{
	             id = 1254,
	             note = --[[!AUTO_268]]"^a800ff【紫陌】" ,
	             desc = --[[!AUTO_269]]"[血戰英雄]人生何處尋知己，應似飛鴻踏雪泥",
	             image = --[[!AUTO_270]]"",
}

title_definition["血战5"] =
{
	             id = 1255,
	             note = --[[!AUTO_271]]"^a800ff【碧落】" ,
	             desc = --[[!AUTO_272]]"[血戰英雄]上窮碧落下黃泉，兩處茫茫皆不見",
	             image = --[[!AUTO_273]]"",
}

title_definition["竞战1"] =
{
	             id = 1261,
	             note = --[[!AUTO_274]]"^ff7d2f【亦幻】" ,
	             desc = --[[!AUTO_275]]"[競戰英雄]風花雪月，不過浮華人間。真亦幻來幻亦真",
	             image = --[[!AUTO_276]]"",
}

title_definition["竞战2"] =
{
	             id = 1262,
	             note = --[[!AUTO_277]]"^a800ff【蒼月】" ,
	             desc = --[[!AUTO_278]]"[競戰英雄]陽極而陰，陰極還陽",
	             image = --[[!AUTO_279]]"",
}

title_definition["竞战3"] =
{
	             id = 1263,
	             note = --[[!AUTO_280]]"^a800ff【紅蓮】" ,
	             desc = --[[!AUTO_281]]"[競戰英雄]火焰化紅蓮，天罪自消衍",
	             image = --[[!AUTO_282]]"",
}

title_definition["竞战4"] =
{
	             id = 1264,
	             note = --[[!AUTO_283]]"^a800ff【冰魄】" ,
	             desc = --[[!AUTO_284]]"[競戰英雄]何時冷月照寒冰，天微乍寒憐秋心",
	             image = --[[!AUTO_285]]"",
}

title_definition["竞战5"] =
{
	             id = 1265,
	             note = --[[!AUTO_286]]"^a800ff【碧血】" ,
	             desc = --[[!AUTO_287]]"[競戰英雄]黃冠日月胡雲斷，碧血山河龍馭遙",
	             image = --[[!AUTO_288]]"",
}

title_definition["攻略达人"] =
{
	id = 10 ,
	note = --[[!AUTO_289]]"^ffbc3c【攻略達人】" ,
	desc = --[[!AUTO_290]]"表彰為論壇做出巨大貢獻的達人。",
	image = --[[!AUTO_291]]"",
}

title_definition["多玩侠客"] =
{
	id = 11 ,
	note = --[[!AUTO_292]]"^ffbc3c【多玩俠客】" ,
	desc = --[[!AUTO_293]]"來自多玩的英雄。",
	image = --[[!AUTO_294]]"",
}
title_definition["17173侠客"] =
{
	id = 12 ,
	note = --[[!AUTO_295]]"^ffbc3c【17173俠客】" ,
	desc = --[[!AUTO_296]]"來自17173的英雄。",
	image = --[[!AUTO_297]]"",
}
title_definition["新浪侠客"] =
{
	id = 13 ,
	note = --[[!AUTO_298]]"^ffbc3c【新浪俠客】" ,
	desc = --[[!AUTO_299]]"來自新浪的英雄。",
	image = --[[!AUTO_300]]"",
}
title_definition["腾讯侠客"] =
{
	id = 14 ,
	note = --[[!AUTO_301]]"^ffbc3c【騰訊俠客】" ,
	desc = --[[!AUTO_302]]"來自騰訊的英雄。",
	image = --[[!AUTO_303]]"",
}
title_definition["360侠客"] =
{
	id = 15 ,
	note = --[[!AUTO_304]]"^ffbc3c【360俠客】" ,
	desc = --[[!AUTO_305]]"來自360的英雄。",
	image = --[[!AUTO_306]]"",
}
title_definition["魔法士侠客"] =
{
	id = 16 ,
	note = --[[!AUTO_307]]"^ffbc3c【魔法士俠客】" ,
	desc = --[[!AUTO_308]]"來自華豐的英雄。",
	image = --[[!AUTO_309]]"",
}
title_definition["QT侠客"] =
{
	id = 17 ,
	note = --[[!AUTO_310]]"^ffbc3c【QT俠客】" ,
	desc = --[[!AUTO_311]]"來自QT的英雄。",
	image = --[[!AUTO_312]]"",
}
title_definition["乔见东方，恩承天下"] =
{
	id = 18 ,
	note = --[[!AUTO_313]]"^ffbc3c【喬見東方，恩承天下】" ,
	desc = --[[!AUTO_314]]"",
	image = --[[!AUTO_315]]"",
}
title_definition["搜狗侠客"] =
{
	id = 19 ,
	note = --[[!AUTO_316]]"^ffbc3c【搜狗俠客】" ,
	desc = --[[!AUTO_317]]"來自搜狗的英雄。",
	image = --[[!AUTO_318]]"",
}
title_definition["官方记者团"] =
{
	id = 20 ,
	note = --[[!AUTO_319]]"^ff7d2f【記者團】" ,
	desc = --[[!AUTO_320]]"",
	image = --[[!AUTO_321]]"",
}
title_definition["葵花侠客"] =
{
	id = 21 ,
	note = --[[!AUTO_322]]"^ffbc3c【葵花俠客】" ,
	desc = --[[!AUTO_323]]"來自太平洋遊戲的英雄。",
	image = --[[!AUTO_324]]"",
}
title_definition["再战江湖"] =
{
	id = 22 ,
	note = --[[!AUTO_325]]"^ffbc3c【再戰江湖】" ,
	desc = --[[!AUTO_326]]"表彰那些與我們一起經歷了測試階段的玩家，你們辛苦了。",
	image = --[[!AUTO_327]]"",
}
title_definition["AMD侠客"] =
{
	id = 23 ,
	note = --[[!AUTO_1033]]"^ffbc3c【AMD俠客】" ,
	desc = --[[!AUTO_1034]]"來自AMD的英雄。",
	image = --[[!AUTO_1035]]"",
}
title_definition["178侠客"] =
{
	id = 24 ,
	note = --[[!AUTO_1036]]"^ffbc3c【178俠客】" ,
	desc = --[[!AUTO_1037]]"來自178的英雄。",
	image = --[[!AUTO_1038]]"",
}
title_definition["巴士风云侠客"] =
{
	id = 25 ,
	note = --[[!AUTO_1039]]"^ffbc3c【巴士風雲俠客】" ,
	desc = --[[!AUTO_1040]]"來自巴士風雲的英雄。",
	image = --[[!AUTO_1041]]"",
}
title_definition["技嘉侠客"] =
{
	id = 26 ,
	note = --[[!AUTO_1042]]"^ffbc3c【技嘉俠客】" ,
	desc = --[[!AUTO_1043]]"來自技嘉的英雄。",
	image = --[[!AUTO_1044]]"",
}
title_definition["网吧侠客"] =
{
	id = 27 ,
	note = --[[!AUTO_1045]]"^ffbc3c【網吧俠客】" ,
	desc = --[[!AUTO_1046]]"來自網吧的英雄。",
	image = --[[!AUTO_1047]]"",
}
title_definition["国美侠客"] =
{
	id = 28 ,
	note = --[[!AUTO_1048]]"^ffbc3c【國美俠客】" ,
	desc = --[[!AUTO_1049]]"來自國美的英雄。",
	image = --[[!AUTO_1050]]"",
}
title_definition["争霸赛冠军"] =
{
	id = 29 ,
	note = --[[!AUTO_1051]]"^ffbc3c【爭霸賽冠軍】" ,
	desc = --[[!AUTO_1052]]"來自PK爭霸賽的冠軍。",
	image = --[[!AUTO_1053]]"",
}
title_definition["争霸赛亚军"] =
{
	id = 30 ,
	note = --[[!AUTO_1054]]"^ffbc3c【爭霸賽亞軍】" ,
	desc = --[[!AUTO_1055]]"來自PK爭霸賽的亞軍。",
	image = --[[!AUTO_1056]]"",
}
title_definition["等级1"] =
{
	             id = 1281,
	             note = --[[!AUTO_328]]"^a800ff【第一尊者】" ,
	             desc = --[[!AUTO_329]]"",
	             image = --[[!AUTO_330]]"",
}

title_definition["财富1"] =
{
	             id = 1282,
	             note = --[[!AUTO_331]]"^a800ff【第一富豪】" ,
	             desc = --[[!AUTO_332]]"",
	             image = --[[!AUTO_333]]"",
}

title_definition["成就1"] =
{
	             id = 1283,
	             note = --[[!AUTO_334]]"^a800ff【第一成就】" ,
	             desc = --[[!AUTO_335]]"",
	             image = --[[!AUTO_336]]"",
}

title_definition["七夕男"] =
{
	             id = 1284,
	             note = --[[!AUTO_337]]"^f06ea9【佳人在側何辭死，願作鴛鴦不羨仙】" ,
	             desc = --[[!AUTO_338]]"",
	             image = --[[!AUTO_339]]"",
}

title_definition["七夕女"] =
{
	             id = 1285,
	             note = --[[!AUTO_340]]"^f06ea9【長袖一舞伴君側，願作鴛鴦不羨仙】" ,
	             desc = --[[!AUTO_341]]"",
	             image = --[[!AUTO_342]]"",
}

title_definition["鬼见愁"] =
{
	             id = 1286,
	             note = --[[!AUTO_1057]]"^a800ff【媽媽再也不用擔心我的輕功】" ,
	             desc = --[[!AUTO_1058]]"",
	             image = --[[!AUTO_1059]]"",
}

title_definition["台大不败"] =
{
	id = 5658,
	note = --[[!AUTO_343]]"^ffbc3c【台大不敗】",
	desc = --[[!AUTO_344]]"來自台大的英雄。",
	image = --[[!AUTO_345]]""
}

title_definition["清大不败"] =
{
	id = 5659,
	note = --[[!AUTO_346]]"^ffbc3c【清大不敗】",
	desc = --[[!AUTO_347]]"來自清大的英雄。",
	image = --[[!AUTO_348]]""
}

title_definition["政大不败"] =
{
	id = 5660,
	note = --[[!AUTO_349]]"^ffbc3c【政大不敗】",
	desc = --[[!AUTO_350]]"來自政大的英雄。",
	image = --[[!AUTO_351]]""
}

title_definition["成大不败"] =
{
	id = 5661,
	note = --[[!AUTO_352]]"^ffbc3c【成大不敗】",
	desc = --[[!AUTO_353]]"來自成大的英雄。",
	image = --[[!AUTO_354]]""
}

title_definition["交大不败"] =
{
	id = 5662,
	note = --[[!AUTO_355]]"^ffbc3c【交大不敗】",
	desc = --[[!AUTO_356]]"來自交大的英雄。",
	image = --[[!AUTO_357]]""
}

title_definition["中兴不败"] =
{
	id = 5663,
	note = --[[!AUTO_358]]"^ffbc3c【中興不敗】",
	desc = --[[!AUTO_359]]"來自中興的英雄。",
	image = --[[!AUTO_360]]""
}

title_definition["中央不败"] =
{
	id = 5664,
	note = --[[!AUTO_361]]"^ffbc3c【中央不敗】",
	desc = --[[!AUTO_362]]"來自中央的英雄。",
	image = --[[!AUTO_363]]""
}

title_definition["中山不败"] =
{
	id = 5665,
	note = --[[!AUTO_364]]"^ffbc3c【中山不敗】",
	desc = --[[!AUTO_365]]"來自中山的英雄。",
	image = --[[!AUTO_366]]""
}

title_definition["海大不败"] =
{
	id = 5666,
	note = --[[!AUTO_367]]"^ffbc3c【海大不敗】",
	desc = --[[!AUTO_368]]"來自海大的英雄。",
	image = --[[!AUTO_369]]""
}

title_definition["中正不败"] =
{
	id = 5667,
	note = --[[!AUTO_370]]"^ffbc3c【中正不敗】",
	desc = --[[!AUTO_371]]"來自中正的英雄。",
	image = --[[!AUTO_372]]""
}

title_definition["阳明不败"] =
{
	id = 5668,
	note = --[[!AUTO_373]]"^ffbc3c【陽明不敗】",
	desc = --[[!AUTO_374]]"來自陽明的英雄。",
	image = --[[!AUTO_375]]""
}

title_definition["东华不败"] =
{
	id = 5669,
	note = --[[!AUTO_376]]"^ffbc3c【東華不敗】",
	desc = --[[!AUTO_377]]"來自東華的英雄。",
	image = --[[!AUTO_378]]""
}

title_definition["暨南不败"] =
{
	id = 5670,
	note = --[[!AUTO_379]]"^ffbc3c【暨南不敗】",
	desc = --[[!AUTO_380]]"來自暨南的英雄。",
	image = --[[!AUTO_381]]""
}

title_definition["嘉大不败"] =
{
	id = 5671,
	note = --[[!AUTO_382]]"^ffbc3c【嘉大不敗】",
	desc = --[[!AUTO_383]]"來自嘉大的英雄。",
	image = --[[!AUTO_384]]""
}

title_definition["北大不败"] =
{
	id = 5672,
	note = --[[!AUTO_385]]"^ffbc3c【北大不敗】",
	desc = --[[!AUTO_386]]"來自北大的英雄。",
	image = --[[!AUTO_387]]""
}

title_definition["高大不败"] =
{
	id = 5673,
	note = --[[!AUTO_388]]"^ffbc3c【高大不敗】",
	desc = --[[!AUTO_389]]"來自高大的英雄。",
	image = --[[!AUTO_390]]""
}

title_definition["宜大不败"] =
{
	id = 5674,
	note = --[[!AUTO_391]]"^ffbc3c【宜大不敗】",
	desc = --[[!AUTO_392]]"來自宜大的英雄。",
	image = --[[!AUTO_393]]""
}

title_definition["东大不败"] =
{
	id = 5675,
	note = --[[!AUTO_394]]"^ffbc3c【東大不敗】",
	desc = --[[!AUTO_395]]"來自東大的英雄。",
	image = --[[!AUTO_396]]""
}

title_definition["联大不败"] =
{
	id = 5676,
	note = --[[!AUTO_397]]"^ffbc3c【聯大不敗】",
	desc = --[[!AUTO_398]]"來自聯大的英雄。",
	image = --[[!AUTO_399]]""
}

title_definition["南大不败"] =
{
	id = 5677,
	note = --[[!AUTO_400]]"^ffbc3c【南大不敗】",
	desc = --[[!AUTO_401]]"來自南大的英雄。",
	image = --[[!AUTO_402]]""
}

title_definition["师大不败"] =
{
	id = 5678,
	note = --[[!AUTO_403]]"^ffbc3c【師大不敗】",
	desc = --[[!AUTO_404]]"來自師大的英雄。",
	image = --[[!AUTO_405]]""
}

title_definition["高师大不败"] =
{
	id = 5679,
	note = --[[!AUTO_406]]"^ffbc3c【高師大不敗】",
	desc = --[[!AUTO_407]]"來自高師大的英雄。",
	image = --[[!AUTO_408]]""
}

title_definition["彰师大不败"] =
{
	id = 5680,
	note = --[[!AUTO_409]]"^ffbc3c【彰師大不敗】",
	desc = --[[!AUTO_410]]"來自彰師大的英雄。",
	image = --[[!AUTO_411]]""
}

title_definition["北市教大不败"] =
{
	id = 5681,
	note = --[[!AUTO_412]]"^ffbc3c【北市教大不敗】",
	desc = --[[!AUTO_413]]"來自北市教大的英雄。",
	image = --[[!AUTO_414]]""
}

title_definition["北教大不败"] =
{
	id = 5682,
	note = --[[!AUTO_415]]"^ffbc3c【北教大不敗】",
	desc = --[[!AUTO_416]]"來自北教大的英雄。",
	image = --[[!AUTO_417]]""
}

title_definition["中教大不败"] =
{
	id = 5683,
	note = --[[!AUTO_418]]"^ffbc3c【中教大不敗】",
	desc = --[[!AUTO_419]]"來自中教大的英雄。",
	image = --[[!AUTO_420]]""
}

title_definition["竹教大不败"] =
{
	id = 5684,
	note = --[[!AUTO_421]]"^ffbc3c【竹教大不敗】",
	desc = --[[!AUTO_422]]"來自竹教大的英雄。",
	image = --[[!AUTO_423]]""
}

title_definition["屏教大不败"] =
{
	id = 5685,
	note = --[[!AUTO_424]]"^ffbc3c【屏教大不敗】",
	desc = --[[!AUTO_425]]"來自屏教大的英雄。",
	image = --[[!AUTO_426]]""
}

title_definition["台艺大不败"] =
{
	id = 5686,
	note = --[[!AUTO_427]]"^ffbc3c【台藝大不敗】",
	desc = --[[!AUTO_428]]"來自台藝大的英雄。",
	image = --[[!AUTO_429]]""
}

title_definition["北艺大不败"] =
{
	id = 5687,
	note = --[[!AUTO_430]]"^ffbc3c【北藝大不敗】",
	desc = --[[!AUTO_431]]"來自北藝大的英雄。",
	image = --[[!AUTO_432]]""
}

title_definition["南艺大不败"] =
{
	id = 5688,
	note = --[[!AUTO_433]]"^ffbc3c【南藝大不敗】",
	desc = --[[!AUTO_434]]"來自南藝大的英雄。",
	image = --[[!AUTO_435]]""
}

title_definition["中国台湾体大不败"] =
{
	id = 5689,
	note = --[[!AUTO_436]]"^ffbc3c【中国台湾体大不败】",
	desc = --[[!AUTO_437]]"来自中国台湾体大的英雄。",
	image = --[[!AUTO_438]]""
}

title_definition["台北体院不败"] =
{
	id = 5690,
	note = --[[!AUTO_439]]"^ffbc3c【臺北體院不敗】",
	desc = --[[!AUTO_440]]"來自臺北體院的英雄。",
	image = --[[!AUTO_441]]""
}

title_definition["国立体大不败"] =
{
	id = 5691,
	note = --[[!AUTO_442]]"^ffbc3c【國立體大不敗】",
	desc = --[[!AUTO_443]]"來自國立體大的英雄。",
	image = --[[!AUTO_444]]""
}

title_definition["东海不败"] =
{
	id = 5692,
	note = --[[!AUTO_445]]"^ffbc3c【東海不敗】",
	desc = --[[!AUTO_446]]"來自東海的英雄。",
	image = --[[!AUTO_447]]""
}

title_definition["辅大不败"] =
{
	id = 5693,
	note = --[[!AUTO_448]]"^ffbc3c【輔大不敗】",
	desc = --[[!AUTO_449]]"來自輔大的英雄。",
	image = --[[!AUTO_450]]""
}

title_definition["东吴不败"] =
{
	id = 5694,
	note = --[[!AUTO_451]]"^ffbc3c【東吳不敗】",
	desc = --[[!AUTO_452]]"來自東吳的英雄。",
	image = --[[!AUTO_453]]""
}

title_definition["淡江不败"] =
{
	id = 5695,
	note = --[[!AUTO_454]]"^ffbc3c【淡江不敗】",
	desc = --[[!AUTO_455]]"來自淡江的英雄。",
	image = --[[!AUTO_456]]""
}

title_definition["中原不败"] =
{
	id = 5696,
	note = --[[!AUTO_457]]"^ffbc3c【中原不敗】",
	desc = --[[!AUTO_458]]"來自中原的英雄。",
	image = --[[!AUTO_459]]""
}

title_definition["逢甲不败"] =
{
	id = 5697,
	note = --[[!AUTO_460]]"^ffbc3c【逢甲不敗】",
	desc = --[[!AUTO_461]]"來自逢甲的英雄。",
	image = --[[!AUTO_462]]""
}

title_definition["文化不败"] =
{
	id = 5698,
	note = --[[!AUTO_463]]"^ffbc3c【文化不敗】",
	desc = --[[!AUTO_464]]"來自文化的英雄。",
	image = --[[!AUTO_465]]""
}

title_definition["静宜不败"] =
{
	id = 5699,
	note = --[[!AUTO_466]]"^ffbc3c【靜宜不敗】",
	desc = --[[!AUTO_467]]"來自靜宜的英雄。",
	image = --[[!AUTO_468]]""
}

title_definition["世新不败"] =
{
	id = 5700,
	note = --[[!AUTO_469]]"^ffbc3c【世新不敗】",
	desc = --[[!AUTO_470]]"來自世新的英雄。",
	image = --[[!AUTO_471]]""
}

title_definition["铭传不败"] =
{
	id = 5701,
	note = --[[!AUTO_472]]"^ffbc3c【銘傳不敗】",
	desc = --[[!AUTO_473]]"來自銘傳的英雄。",
	image = --[[!AUTO_474]]""
}

title_definition["实践不败"] =
{
	id = 5702,
	note = --[[!AUTO_475]]"^ffbc3c【實踐不敗】",
	desc = --[[!AUTO_476]]"來自實踐的英雄。",
	image = --[[!AUTO_477]]""
}

title_definition["义守不败"] =
{
	id = 5703,
	note = --[[!AUTO_478]]"^ffbc3c【義守不敗】",
	desc = --[[!AUTO_479]]"來自義守的英雄。",
	image = --[[!AUTO_480]]""
}

title_definition["长庚不败"] =
{
	id = 5704,
	note = --[[!AUTO_481]]"^ffbc3c【長庚不敗】",
	desc = --[[!AUTO_482]]"來自長庚的英雄。",
	image = --[[!AUTO_483]]""
}

title_definition["元智不败"] =
{
	id = 5705,
	note = --[[!AUTO_484]]"^ffbc3c【元智不敗】",
	desc = --[[!AUTO_485]]"來自元智的英雄。",
	image = --[[!AUTO_486]]""
}

title_definition["中华不败"] =
{
	id = 5706,
	note = --[[!AUTO_487]]"^ffbc3c【中華不敗】",
	desc = --[[!AUTO_488]]"來自中華的英雄。",
	image = --[[!AUTO_489]]""
}

title_definition["大叶不败"] =
{
	id = 5707,
	note = --[[!AUTO_490]]"^ffbc3c【大葉不敗】",
	desc = --[[!AUTO_491]]"來自大葉的英雄。",
	image = --[[!AUTO_492]]""
}

title_definition["华梵不败"] =
{
	id = 5708,
	note = --[[!AUTO_493]]"^ffbc3c【華梵不敗】",
	desc = --[[!AUTO_494]]"來自華梵的英雄。",
	image = --[[!AUTO_495]]""
}

title_definition["真理不败"] =
{
	id = 5709,
	note = --[[!AUTO_496]]"^ffbc3c【真理不敗】",
	desc = --[[!AUTO_497]]"來自真理的英雄。",
	image = --[[!AUTO_498]]""
}

title_definition["大同不败"] =
{
	id = 5710,
	note = --[[!AUTO_499]]"^ffbc3c【大同不敗】",
	desc = --[[!AUTO_500]]"來自大同的英雄。",
	image = --[[!AUTO_501]]""
}

title_definition["南华不败"] =
{
	id = 5711,
	note = --[[!AUTO_502]]"^ffbc3c【南華不敗】",
	desc = --[[!AUTO_503]]"來自南華的英雄。",
	image = --[[!AUTO_504]]""
}

title_definition["慈济不败"] =
{
	id = 5712,
	note = --[[!AUTO_505]]"^ffbc3c【慈濟不敗】",
	desc = --[[!AUTO_506]]"來自慈濟的英雄。",
	image = --[[!AUTO_507]]""
}

title_definition["长荣不败"] =
{
	id = 5713,
	note = --[[!AUTO_508]]"^ffbc3c【長榮不敗】",
	desc = --[[!AUTO_509]]"來自長榮的英雄。",
	image = --[[!AUTO_510]]""
}

title_definition["玄奘不败"] =
{
	id = 5714,
	note = --[[!AUTO_511]]"^ffbc3c【玄奘不敗】",
	desc = --[[!AUTO_512]]"來自玄奘的英雄。",
	image = --[[!AUTO_513]]""
}

title_definition["亚洲不败"] =
{
	id = 5715,
	note = --[[!AUTO_514]]"^ffbc3c【亞洲不敗】",
	desc = --[[!AUTO_515]]"來自亞洲的英雄。",
	image = --[[!AUTO_516]]""
}

title_definition["开南不败"] =
{
	id = 5716,
	note = --[[!AUTO_517]]"^ffbc3c【開南不敗】",
	desc = --[[!AUTO_518]]"來自開南的英雄。",
	image = --[[!AUTO_519]]""
}

title_definition["佛光不败"] =
{
	id = 5717,
	note = --[[!AUTO_520]]"^ffbc3c【佛光不敗】",
	desc = --[[!AUTO_521]]"來自佛光的英雄。",
	image = --[[!AUTO_522]]""
}

title_definition["明道不败"] =
{
	id = 5718,
	note = --[[!AUTO_523]]"^ffbc3c【明道不敗】",
	desc = --[[!AUTO_524]]"來自明道的英雄。",
	image = --[[!AUTO_525]]""
}

title_definition["立德不败"] =
{
	id = 5719,
	note = --[[!AUTO_526]]"^ffbc3c【立德不敗】",
	desc = --[[!AUTO_527]]"來自立德的英雄。",
	image = --[[!AUTO_528]]""
}

title_definition["高医大不败"] =
{
	id = 5720,
	note = --[[!AUTO_529]]"^ffbc3c【高醫大不敗】",
	desc = --[[!AUTO_530]]"來自高醫大的英雄。",
	image = --[[!AUTO_531]]""
}

title_definition["北医大不败"] =
{
	id = 5721,
	note = --[[!AUTO_532]]"^ffbc3c【北醫大不敗】",
	desc = --[[!AUTO_533]]"來自北醫大的英雄。",
	image = --[[!AUTO_534]]""
}

title_definition["中山医不败"] =
{
	id = 5722,
	note = --[[!AUTO_535]]"^ffbc3c【中山醫不敗】",
	desc = --[[!AUTO_536]]"來自中山醫的英雄。",
	image = --[[!AUTO_537]]""
}

title_definition["中国医大不败"] =
{
	id = 5723,
	note = --[[!AUTO_538]]"^ffbc3c【中國醫大不敗】",
	desc = --[[!AUTO_539]]"來自中國醫大的英雄。",
	image = --[[!AUTO_540]]""
}

title_definition["马偕医学院不败"] =
{
	id = 5724,
	note = --[[!AUTO_541]]"^ffbc3c【馬偕醫學院不敗】",
	desc = --[[!AUTO_542]]"來自馬偕醫學院的英雄。",
	image = --[[!AUTO_543]]""
}

title_definition["致远不败"] =
{
	id = 5725,
	note = --[[!AUTO_544]]"^ffbc3c【致遠不敗】",
	desc = --[[!AUTO_545]]"來自致遠的英雄。",
	image = --[[!AUTO_546]]""
}

title_definition["兴国不败"] =
{
	id = 5726,
	note = --[[!AUTO_547]]"^ffbc3c【興國不敗】",
	desc = --[[!AUTO_548]]"來自興國的英雄。",
	image = --[[!AUTO_549]]""
}

title_definition["稻江不败"] =
{
	id = 5727,
	note = --[[!AUTO_550]]"^ffbc3c【稻江不敗】",
	desc = --[[!AUTO_551]]"來自稻江的英雄。",
	image = --[[!AUTO_552]]""
}

title_definition["台科大不败"] =
{
	id = 5728,
	note = --[[!AUTO_553]]"^ffbc3c【台科大不敗】",
	desc = --[[!AUTO_554]]"來自台科大的英雄。",
	image = --[[!AUTO_555]]""
}

title_definition["北科大不败"] =
{
	id = 5729,
	note = --[[!AUTO_556]]"^ffbc3c【北科大不敗】",
	desc = --[[!AUTO_557]]"來自北科大的英雄。",
	image = --[[!AUTO_558]]""
}

title_definition["屏科大不败"] =
{
	id = 5730,
	note = --[[!AUTO_559]]"^ffbc3c【屏科大不敗】",
	desc = --[[!AUTO_560]]"來自屏科大的英雄。",
	image = --[[!AUTO_561]]""
}

title_definition["云科大不败"] =
{
	id = 5731,
	note = --[[!AUTO_562]]"^ffbc3c【雲科大不敗】",
	desc = --[[!AUTO_563]]"來自雲科大的英雄。",
	image = --[[!AUTO_564]]""
}

title_definition["第一科大不败"] =
{
	id = 5732,
	note = --[[!AUTO_565]]"^ffbc3c【第一科大不敗】",
	desc = --[[!AUTO_566]]"來自第一科大的英雄。",
	image = --[[!AUTO_567]]""
}

title_definition["高应大不败"] =
{
	id = 5733,
	note = --[[!AUTO_568]]"^ffbc3c【高應大不敗】",
	desc = --[[!AUTO_569]]"來自高應大的英雄。",
	image = --[[!AUTO_570]]""
}

title_definition["海科大不败"] =
{
	id = 5734,
	note = --[[!AUTO_571]]"^ffbc3c【海科大不敗】",
	desc = --[[!AUTO_572]]"來自海科大的英雄。",
	image = --[[!AUTO_573]]""
}

title_definition["虎尾科大不败"] =
{
	id = 5735,
	note = --[[!AUTO_574]]"^ffbc3c【虎尾科大不敗】",
	desc = --[[!AUTO_575]]"來自虎尾科大的英雄。",
	image = --[[!AUTO_576]]""
}

title_definition["澎湖科大不败"] =
{
	id = 5736,
	note = --[[!AUTO_577]]"^ffbc3c【澎湖科大不敗】",
	desc = --[[!AUTO_578]]"來自澎湖科大的英雄。",
	image = --[[!AUTO_579]]""
}

title_definition["勤益科大不败"] =
{
	id = 5737,
	note = --[[!AUTO_580]]"^ffbc3c【勤益科大不敗】",
	desc = --[[!AUTO_581]]"來自勤益科大的英雄。",
	image = --[[!AUTO_582]]""
}

title_definition["北护大不败"] =
{
	id = 5738,
	note = --[[!AUTO_583]]"^ffbc3c【北護大不敗】",
	desc = --[[!AUTO_584]]"來自北護大的英雄。",
	image = --[[!AUTO_585]]""
}

title_definition["屏商不败"] =
{
	id = 5739,
	note = --[[!AUTO_586]]"^ffbc3c【屏商不敗】",
	desc = --[[!AUTO_587]]"來自屏商的英雄。",
	image = --[[!AUTO_588]]""
}

title_definition["中科大不败"] =
{
	id = 5740,
	note = --[[!AUTO_589]]"^ffbc3c【中科大不敗】",
	desc = --[[!AUTO_590]]"來自中科大的英雄。",
	image = --[[!AUTO_591]]""
}

title_definition["高雄餐旅不败"] =
{
	id = 5741,
	note = --[[!AUTO_592]]"^ffbc3c【高雄餐旅不敗】",
	desc = --[[!AUTO_593]]"來自高雄餐旅的英雄。",
	image = --[[!AUTO_594]]""
}

title_definition["北商不败"] =
{
	id = 5742,
	note = --[[!AUTO_595]]"^ffbc3c【北商不敗】",
	desc = --[[!AUTO_596]]"來自北商的英雄。",
	image = --[[!AUTO_597]]""
}

title_definition["金大不败"] =
{
	id = 5743,
	note = --[[!AUTO_598]]"^ffbc3c【金大不敗】",
	desc = --[[!AUTO_599]]"來自金大的英雄。",
	image = --[[!AUTO_600]]""
}

title_definition["中国台湾戏曲不败"] =
{
	id = 5744,
	note = --[[!AUTO_601]]"^ffbc3c【中国台湾戏曲不败】",
	desc = --[[!AUTO_602]]"来自中国台湾戏曲的英雄。",
	image = --[[!AUTO_603]]""
}

title_definition["台南护理不败"] =
{
	id = 5745,
	note = --[[!AUTO_604]]"^ffbc3c【台南護理不敗】",
	desc = --[[!AUTO_605]]"來自台南護理的英雄。",
	image = --[[!AUTO_606]]""
}

title_definition["台中护专不败"] =
{
	id = 5746,
	note = --[[!AUTO_607]]"^ffbc3c【台中護專不敗】",
	desc = --[[!AUTO_608]]"來自台中護專的英雄。",
	image = --[[!AUTO_609]]""
}

title_definition["台东专校不败"] =
{
	id = 5747,
	note = --[[!AUTO_610]]"^ffbc3c【台東專校不敗】",
	desc = --[[!AUTO_611]]"來自台東專校的英雄。",
	image = --[[!AUTO_612]]""
}

title_definition["朝阳不败"] =
{
	id = 5748,
	note = --[[!AUTO_613]]"^ffbc3c【朝陽不敗】",
	desc = --[[!AUTO_614]]"來自朝陽的英雄。",
	image = --[[!AUTO_615]]""
}

title_definition["南台不败"] =
{
	id = 5749,
	note = --[[!AUTO_616]]"^ffbc3c【南台不敗】",
	desc = --[[!AUTO_617]]"來自南台的英雄。",
	image = --[[!AUTO_618]]""
}

title_definition["昆山不败"] =
{
	id = 5750,
	note = --[[!AUTO_619]]"^ffbc3c【昆山不敗】",
	desc = --[[!AUTO_620]]"來自昆山的英雄。",
	image = --[[!AUTO_621]]""
}

title_definition["嘉药不败"] =
{
	id = 5751,
	note = --[[!AUTO_622]]"^ffbc3c【嘉藥不敗】",
	desc = --[[!AUTO_623]]"來自嘉藥的英雄。",
	image = --[[!AUTO_624]]""
}

title_definition["树德不败"] =
{
	id = 5752,
	note = --[[!AUTO_625]]"^ffbc3c【樹德不敗】",
	desc = --[[!AUTO_626]]"來自樹德的英雄。",
	image = --[[!AUTO_627]]""
}

title_definition["龙华不败"] =
{
	id = 5753,
	note = --[[!AUTO_628]]"^ffbc3c【龍華不敗】",
	desc = --[[!AUTO_629]]"來自龍華的英雄。",
	image = --[[!AUTO_630]]""
}

title_definition["辅英不败"] =
{
	id = 5754,
	note = --[[!AUTO_631]]"^ffbc3c【輔英不敗】",
	desc = --[[!AUTO_632]]"來自輔英的英雄。",
	image = --[[!AUTO_633]]""
}

title_definition["明新不败"] =
{
	id = 5755,
	note = --[[!AUTO_634]]"^ffbc3c【明新不敗】",
	desc = --[[!AUTO_635]]"來自明新的英雄。",
	image = --[[!AUTO_636]]""
}

title_definition["清云不败"] =
{
	id = 5756,
	note = --[[!AUTO_637]]"^ffbc3c【清雲不敗】",
	desc = --[[!AUTO_638]]"來自清雲的英雄。",
	image = --[[!AUTO_639]]""
}

title_definition["正修不败"] =
{
	id = 5757,
	note = --[[!AUTO_640]]"^ffbc3c【正修不敗】",
	desc = --[[!AUTO_641]]"來自正修的英雄。",
	image = --[[!AUTO_642]]""
}

title_definition["弘光不败"] =
{
	id = 5758,
	note = --[[!AUTO_643]]"^ffbc3c【弘光不敗】",
	desc = --[[!AUTO_644]]"來自弘光的英雄。",
	image = --[[!AUTO_645]]""
}

title_definition["明志不败"] =
{
	id = 5759,
	note = --[[!AUTO_646]]"^ffbc3c【明志不敗】",
	desc = --[[!AUTO_647]]"來自明志的英雄。",
	image = --[[!AUTO_648]]""
}

title_definition["建国不败"] =
{
	id = 5760,
	note = --[[!AUTO_649]]"^ffbc3c【建國不敗】",
	desc = --[[!AUTO_650]]"來自建國的英雄。",
	image = --[[!AUTO_651]]""
}

title_definition["万能不败"] =
{
	id = 5761,
	note = --[[!AUTO_652]]"^ffbc3c【萬能不敗】",
	desc = --[[!AUTO_653]]"來自萬能的英雄。",
	image = --[[!AUTO_654]]""
}

title_definition["岭东不败"] =
{
	id = 5762,
	note = --[[!AUTO_655]]"^ffbc3c【嶺東不敗】",
	desc = --[[!AUTO_656]]"來自嶺東的英雄。",
	image = --[[!AUTO_657]]""
}

title_definition["中国科大不败"] =
{
	id = 5763,
	note = --[[!AUTO_658]]"^ffbc3c【中國科大不敗】",
	desc = --[[!AUTO_659]]"來自中國科大的英雄。",
	image = --[[!AUTO_660]]""
}

title_definition["中台科大不败"] =
{
	id = 5764,
	note = --[[!AUTO_661]]"^ffbc3c【中台科大不敗】",
	desc = --[[!AUTO_662]]"來自中台科大的英雄。",
	image = --[[!AUTO_663]]""
}

title_definition["大仁不败"] =
{
	id = 5765,
	note = --[[!AUTO_664]]"^ffbc3c【大仁不敗】",
	desc = --[[!AUTO_665]]"來自大仁的英雄。",
	image = --[[!AUTO_666]]""
}

title_definition["圣约翰不败"] =
{
	id = 5766,
	note = --[[!AUTO_667]]"^ffbc3c【聖約翰不敗】",
	desc = --[[!AUTO_668]]"來自聖約翰的英雄。",
	image = --[[!AUTO_669]]""
}

title_definition["高苑不败"] =
{
	id = 5767,
	note = --[[!AUTO_670]]"^ffbc3c【高苑不敗】",
	desc = --[[!AUTO_671]]"來自高苑的英雄。",
	image = --[[!AUTO_672]]""
}

title_definition["元培不败"] =
{
	id = 5768,
	note = --[[!AUTO_673]]"^ffbc3c【元培不敗】",
	desc = --[[!AUTO_674]]"來自元培的英雄。",
	image = --[[!AUTO_675]]""
}

title_definition["台南科大不败"] =
{
	id = 5769,
	note = --[[!AUTO_676]]"^ffbc3c【台南科大不敗】",
	desc = --[[!AUTO_677]]"來自台南科大的英雄。",
	image = --[[!AUTO_678]]""
}

title_definition["远东不败"] =
{
	id = 5770,
	note = --[[!AUTO_679]]"^ffbc3c【遠東不敗】",
	desc = --[[!AUTO_680]]"來自遠東的英雄。",
	image = --[[!AUTO_681]]""
}

title_definition["德明科大不败"] =
{
	id = 5771,
	note = --[[!AUTO_682]]"^ffbc3c【德明科大不敗】",
	desc = --[[!AUTO_683]]"來自德明科大的英雄。",
	image = --[[!AUTO_684]]""
}

title_definition["华医科大不败"] =
{
	id = 5772,
	note = --[[!AUTO_685]]"^ffbc3c【華醫科大不敗】",
	desc = --[[!AUTO_686]]"來自華醫科大的英雄。",
	image = --[[!AUTO_687]]""
}

title_definition["东南科大不败"] =
{
	id = 5773,
	note = --[[!AUTO_688]]"^ffbc3c【東南科大不敗】",
	desc = --[[!AUTO_689]]"來自東南科大的英雄。",
	image = --[[!AUTO_690]]""
}

title_definition["景文不败"] =
{
	id = 5774,
	note = --[[!AUTO_691]]"^ffbc3c【景文不敗】",
	desc = --[[!AUTO_692]]"來自景文的英雄。",
	image = --[[!AUTO_693]]""
}

title_definition["南开不败"] =
{
	id = 5775,
	note = --[[!AUTO_694]]"^ffbc3c【南開不敗】",
	desc = --[[!AUTO_695]]"來自南開的英雄。",
	image = --[[!AUTO_696]]""
}

title_definition["侨光不败"] =
{
	id = 5776,
	note = --[[!AUTO_697]]"^ffbc3c【僑光不敗】",
	desc = --[[!AUTO_698]]"來自僑光的英雄。",
	image = --[[!AUTO_699]]""
}

title_definition["中华科大不败"] =
{
	id = 5777,
	note = --[[!AUTO_700]]"^ffbc3c【中華科大不敗】",
	desc = --[[!AUTO_701]]"來自中華科大的英雄。",
	image = --[[!AUTO_702]]""
}

title_definition["育达不败"] =
{
	id = 5778,
	note = --[[!AUTO_703]]"^ffbc3c【育達不敗】",
	desc = --[[!AUTO_704]]"來自育達的英雄。",
	image = --[[!AUTO_705]]""
}

title_definition["大华不败"] =
{
	id = 5779,
	note = --[[!AUTO_706]]"^ffbc3c【大華不敗】",
	desc = --[[!AUTO_707]]"來自大華的英雄。",
	image = --[[!AUTO_708]]""
}

title_definition["致理不败"] =
{
	id = 5780,
	note = --[[!AUTO_709]]"^ffbc3c【致理不敗】",
	desc = --[[!AUTO_710]]"來自致理的英雄。",
	image = --[[!AUTO_711]]""
}

title_definition["永达不败"] =
{
	id = 5781,
	note = --[[!AUTO_712]]"^ffbc3c【永達不敗】",
	desc = --[[!AUTO_713]]"來自永達的英雄。",
	image = --[[!AUTO_714]]""
}

title_definition["文藻不败"] =
{
	id = 5782,
	note = --[[!AUTO_715]]"^ffbc3c【文藻不敗】",
	desc = --[[!AUTO_716]]"來自文藻的英雄。",
	image = --[[!AUTO_717]]""
}

title_definition["大汉不败"] =
{
	id = 5783,
	note = --[[!AUTO_718]]"^ffbc3c【大漢不敗】",
	desc = --[[!AUTO_719]]"來自大漢的英雄。",
	image = --[[!AUTO_720]]""
}

title_definition["和春不败"] =
{
	id = 5784,
	note = --[[!AUTO_721]]"^ffbc3c【和春不敗】",
	desc = --[[!AUTO_722]]"來自和春的英雄。",
	image = --[[!AUTO_723]]""
}

title_definition["北台学院不败"] =
{
	id = 5785,
	note = --[[!AUTO_724]]"^ffbc3c【北台學院不敗】",
	desc = --[[!AUTO_725]]"來自北台學院的英雄。",
	image = --[[!AUTO_726]]""
}

title_definition["醒吾不败"] =
{
	id = 5786,
	note = --[[!AUTO_727]]"^ffbc3c【醒吾不敗】",
	desc = --[[!AUTO_728]]"來自醒吾的英雄。",
	image = --[[!AUTO_729]]""
}

title_definition["吴凤不败"] =
{
	id = 5787,
	note = --[[!AUTO_730]]"^ffbc3c【吳鳳不敗】",
	desc = --[[!AUTO_731]]"來自吳鳳的英雄。",
	image = --[[!AUTO_732]]""
}

title_definition["修平不败"] =
{
	id = 5788,
	note = --[[!AUTO_733]]"^ffbc3c【修平不敗】",
	desc = --[[!AUTO_734]]"來自修平的英雄。",
	image = --[[!AUTO_735]]""
}

title_definition["美和不败"] =
{
	id = 5789,
	note = --[[!AUTO_736]]"^ffbc3c【美和不敗】",
	desc = --[[!AUTO_737]]"來自美和的英雄。",
	image = --[[!AUTO_738]]""
}

title_definition["亚东不败"] =
{
	id = 5790,
	note = --[[!AUTO_739]]"^ffbc3c【亞東不敗】",
	desc = --[[!AUTO_740]]"來自亞東的英雄。",
	image = --[[!AUTO_741]]""
}

title_definition["南亚不败"] =
{
	id = 5791,
	note = --[[!AUTO_742]]"^ffbc3c【南亞不敗】",
	desc = --[[!AUTO_743]]"來自南亞的英雄。",
	image = --[[!AUTO_744]]""
}

title_definition["中州不败"] =
{
	id = 5792,
	note = --[[!AUTO_745]]"^ffbc3c【中州不敗】",
	desc = --[[!AUTO_746]]"來自中州的英雄。",
	image = --[[!AUTO_747]]""
}

title_definition["环球不败"] =
{
	id = 5793,
	note = --[[!AUTO_748]]"^ffbc3c【環球不敗】",
	desc = --[[!AUTO_749]]"來自環球的英雄。",
	image = --[[!AUTO_750]]""
}

title_definition["南荣不败"] =
{
	id = 5794,
	note = --[[!AUTO_751]]"^ffbc3c【南榮不敗】",
	desc = --[[!AUTO_752]]"來自南榮的英雄。",
	image = --[[!AUTO_753]]""
}

title_definition["兰阳不败"] =
{
	id = 5795,
	note = --[[!AUTO_754]]"^ffbc3c【蘭陽不敗】",
	desc = --[[!AUTO_755]]"來自蘭陽的英雄。",
	image = --[[!AUTO_756]]""
}

title_definition["德霖不败"] =
{
	id = 5796,
	note = --[[!AUTO_757]]"^ffbc3c【德霖不敗】",
	desc = --[[!AUTO_758]]"來自德霖的英雄。",
	image = --[[!AUTO_759]]""
}

title_definition["东方学院不败"] =
{
	id = 5797,
	note = --[[!AUTO_760]]"^ffbc3c【東方學院不敗】",
	desc = --[[!AUTO_761]]"來自東方學院的英雄。",
	image = --[[!AUTO_762]]""
}

title_definition["经国学院不败"] =
{
	id = 5798,
	note = --[[!AUTO_763]]"^ffbc3c【經國學院不敗】",
	desc = --[[!AUTO_764]]"來自經國學院的英雄。",
	image = --[[!AUTO_765]]""
}

title_definition["黎明不败"] =
{
	id = 5799,
	note = --[[!AUTO_766]]"^ffbc3c【黎明不敗】",
	desc = --[[!AUTO_767]]"來自黎明的英雄。",
	image = --[[!AUTO_768]]""
}

title_definition["崇右不败"] =
{
	id = 5800,
	note = --[[!AUTO_769]]"^ffbc3c【崇右不敗】",
	desc = --[[!AUTO_770]]"來自崇右的英雄。",
	image = --[[!AUTO_771]]""
}

title_definition["华夏不败"] =
{
	id = 5801,
	note = --[[!AUTO_772]]"^ffbc3c【華夏不敗】",
	desc = --[[!AUTO_773]]"來自華夏的英雄。",
	image = --[[!AUTO_774]]""
}

title_definition["亲民不败"] =
{
	id = 5802,
	note = --[[!AUTO_775]]"^ffbc3c【親民不敗】",
	desc = --[[!AUTO_776]]"來自親民的英雄。",
	image = --[[!AUTO_777]]""
}

title_definition["高凤不败"] =
{
	id = 5803,
	note = --[[!AUTO_778]]"^ffbc3c【高鳳不敗】",
	desc = --[[!AUTO_779]]"來自高鳳的英雄。",
	image = --[[!AUTO_780]]""
}

title_definition["台观学院不败"] =
{
	id = 5804,
	note = --[[!AUTO_781]]"^ffbc3c【台觀學院不敗】",
	desc = --[[!AUTO_782]]"來自台觀學院的英雄。",
	image = --[[!AUTO_783]]""
}

title_definition["北海学院不败"] =
{
	id = 5805,
	note = --[[!AUTO_784]]"^ffbc3c【北海學院不敗】",
	desc = --[[!AUTO_785]]"來自北海學院的英雄。",
	image = --[[!AUTO_786]]""
}

title_definition["康宁医管不败"] =
{
	id = 5806,
	note = --[[!AUTO_787]]"^ffbc3c【康寧醫管不敗】",
	desc = --[[!AUTO_788]]"來自康寧醫管的英雄。",
	image = --[[!AUTO_789]]""
}

title_definition["仁德医管不败"] =
{
	id = 5807,
	note = --[[!AUTO_790]]"^ffbc3c【仁德醫管不敗】",
	desc = --[[!AUTO_791]]"來自仁德醫管的英雄。",
	image = --[[!AUTO_792]]""
}

title_definition["马偕医管不败"] =
{
	id = 5808,
	note = --[[!AUTO_793]]"^ffbc3c【馬偕醫管不敗】",
	desc = --[[!AUTO_794]]"來自馬偕醫管的英雄。",
	image = --[[!AUTO_795]]""
}

title_definition["慈惠医管不败"] =
{
	id = 5809,
	note = --[[!AUTO_796]]"^ffbc3c【慈惠醫管不敗】",
	desc = --[[!AUTO_797]]"來自慈惠醫管的英雄。",
	image = --[[!AUTO_798]]""
}

title_definition["树人医管不败"] =
{
	id = 5810,
	note = --[[!AUTO_799]]"^ffbc3c【樹人醫管不敗】",
	desc = --[[!AUTO_800]]"來自樹人醫管的英雄。",
	image = --[[!AUTO_801]]""
}

title_definition["耕莘医管不败"] =
{
	id = 5811,
	note = --[[!AUTO_802]]"^ffbc3c【耕莘醫管不敗】",
	desc = --[[!AUTO_803]]"來自耕莘醫管的英雄。",
	image = --[[!AUTO_804]]""
}

title_definition["育英医管不败"] =
{
	id = 5812,
	note = --[[!AUTO_805]]"^ffbc3c【育英醫管不敗】",
	desc = --[[!AUTO_806]]"來自育英醫管的英雄。",
	image = --[[!AUTO_807]]""
}

title_definition["敏惠医管不败"] =
{
	id = 5813,
	note = --[[!AUTO_808]]"^ffbc3c【敏惠醫管不敗】",
	desc = --[[!AUTO_809]]"來自敏惠醫管的英雄。",
	image = --[[!AUTO_810]]""
}

title_definition["高美医管不败"] =
{
	id = 5814,
	note = --[[!AUTO_811]]"^ffbc3c【高美醫管不敗】",
	desc = --[[!AUTO_812]]"來自高美醫管的英雄。",
	image = --[[!AUTO_813]]""
}

title_definition["新生医管不败"] =
{
	id = 5815,
	note = --[[!AUTO_814]]"^ffbc3c【新生醫管不敗】",
	desc = --[[!AUTO_815]]"來自新生醫管的英雄。",
	image = --[[!AUTO_816]]""
}

title_definition["圣母医管不败"] =
{
	id = 5816,
	note = --[[!AUTO_817]]"^ffbc3c【聖母醫管不敗】",
	desc = --[[!AUTO_818]]"來自聖母醫管的英雄。",
	image = --[[!AUTO_819]]""
}

title_definition["崇仁医管不败"] =
{
	id = 5817,
	note = --[[!AUTO_820]]"^ffbc3c【崇仁醫管不敗】",
	desc = --[[!AUTO_821]]"來自崇仁醫管的英雄。",
	image = --[[!AUTO_822]]""
}

title_definition["国防医不败"] =
{
	id = 5818,
	note = --[[!AUTO_823]]"^ffbc3c【國防醫不敗】",
	desc = --[[!AUTO_824]]"來自國防醫的英雄。",
	image = --[[!AUTO_825]]""
}

title_definition["海军官校不败"] =
{
	id = 5819,
	note = --[[!AUTO_826]]"^ffbc3c【海軍官校不敗】",
	desc = --[[!AUTO_827]]"來自海軍官校的英雄。",
	image = --[[!AUTO_828]]""
}

title_definition["空军官校不败"] =
{
	id = 5820,
	note = --[[!AUTO_829]]"^ffbc3c【空軍官校不敗】",
	desc = --[[!AUTO_830]]"來自空軍官校的英雄。",
	image = --[[!AUTO_831]]""
}

title_definition["陆军官校不败"] =
{
	id = 5821,
	note = --[[!AUTO_832]]"^ffbc3c【陸軍官校不敗】",
	desc = --[[!AUTO_833]]"來自陸軍官校的英雄。",
	image = --[[!AUTO_834]]""
}

title_definition["警专不败"] =
{
	id = 5822,
	note = --[[!AUTO_835]]"^ffbc3c【警專不敗】",
	desc = --[[!AUTO_836]]"來自警專的英雄。",
	image = --[[!AUTO_837]]""
}

title_definition["警大不败"] =
{
	id = 5823,
	note = --[[!AUTO_838]]"^ffbc3c【警大不敗】",
	desc = --[[!AUTO_839]]"來自警大的英雄。",
	image = --[[!AUTO_840]]""
}

title_definition["国防大学不败"] =
{
	id = 5824,
	note = --[[!AUTO_841]]"^ffbc3c【國防大學不敗】",
	desc = --[[!AUTO_842]]"來自國防大學的英雄。",
	image = --[[!AUTO_843]]""
}

title_definition["航院不败"] =
{
	id = 5825,
	note = --[[!AUTO_844]]"^ffbc3c【航院不敗】",
	desc = --[[!AUTO_845]]"來自航院的英雄。",
	image = --[[!AUTO_846]]""
}

title_definition["陆专不败"] =
{
	id = 5826,
	note = --[[!AUTO_847]]"^ffbc3c【陸專不敗】",
	desc = --[[!AUTO_848]]"來自陸專的英雄。",
	image = --[[!AUTO_849]]""
}

title_definition["空大不败"] =
{
	id = 5827,
	note = --[[!AUTO_850]]"^ffbc3c【空大不敗】",
	desc = --[[!AUTO_851]]"來自空大的英雄。",
	image = --[[!AUTO_852]]""
}

title_definition["高雄空大不败"] =
{
	id = 5828,
	note = --[[!AUTO_853]]"^ffbc3c【高雄空大不敗】",
	desc = --[[!AUTO_854]]"來自高雄空大的英雄。",
	image = --[[!AUTO_855]]""
}

title_definition["我从剑侠投奔过来"] =
{
	id = 5829,
	note = --[[!AUTO_856]]"^ffbc3c【我從劍俠投奔過來】",
	desc = --[[!AUTO_857]]"來自劍俠的英雄。",
	image = --[[!AUTO_858]]""
}

title_definition["我从九阴投奔过来"] =
{
	id = 5830,
	note = --[[!AUTO_859]]"^ffbc3c【我從九陰投奔過來】",
	desc = --[[!AUTO_860]]"來自九陰的英雄。",
	image = --[[!AUTO_861]]""
}

title_definition["我从诛仙投奔过来"] =
{
	id = 5831,
	note = --[[!AUTO_862]]"^ffbc3c【我從誅仙投奔過來】",
	desc = --[[!AUTO_863]]"來自誅仙的英雄。",
	image = --[[!AUTO_864]]""
}

title_definition["我从名将投奔过来"] =
{
	id = 5832,
	note = --[[!AUTO_865]]"^ffbc3c【我從名將投奔過來】",
	desc = --[[!AUTO_866]]"來自名將的英雄。",
	image = --[[!AUTO_867]]""
}

title_definition["我从仙侠投奔过来"] =
{
	id = 5833,
	note = --[[!AUTO_868]]"^ffbc3c【我從仙俠投奔過來】",
	desc = --[[!AUTO_869]]"來自仙俠的英雄。",
	image = --[[!AUTO_870]]""
}

title_definition["我从霹雳投奔过来"] =
{
	id = 5834,
	note = --[[!AUTO_871]]"^ffbc3c【我從霹靂投奔過來】",
	desc = --[[!AUTO_872]]"來自霹靂的英雄。",
	image = --[[!AUTO_873]]""
}

title_definition["我从三群投奔过来"] =
{
	id = 5835,
	note = --[[!AUTO_874]]"^ffbc3c【我從三群投奔過來】",
	desc = --[[!AUTO_875]]"來自三群的英雄。",
	image = --[[!AUTO_876]]""
}

title_definition["我从热江投奔过来"] =
{
	id = 5836,
	note = --[[!AUTO_877]]"^ffbc3c【我從熱江投奔過來】",
	desc = --[[!AUTO_878]]"來自熱江的英雄。",
	image = --[[!AUTO_879]]""
}

title_definition["我从天龙投奔过来"] =
{
	id = 5837,
	note = --[[!AUTO_880]]"^ffbc3c【我從天龍投奔過來】",
	desc = --[[!AUTO_881]]"來自天龍的英雄。",
	image = --[[!AUTO_882]]""
}

title_definition["我从绝代投奔过来"] =
{
	id = 5838,
	note = --[[!AUTO_883]]"^ffbc3c【我從絕代投奔過來】",
	desc = --[[!AUTO_884]]"來自絕代的英雄。",
	image = --[[!AUTO_885]]""
}

title_definition["我从吞食投奔过来"] =
{
	id = 5839,
	note = --[[!AUTO_886]]"^ffbc3c【我從吞食投奔過來】",
	desc = --[[!AUTO_887]]"來自吞食的英雄。",
	image = --[[!AUTO_888]]""
}

title_definition["我从金庸群侠投奔过来"] =
{
	id = 5840,
	note = --[[!AUTO_889]]"^ffbc3c【我從金庸群俠投奔過來】",
	desc = --[[!AUTO_890]]"來自金庸群俠的英雄。",
	image = --[[!AUTO_891]]""
}

title_definition["我从武林群侠投奔过来"] =
{
	id = 5841,
	note = --[[!AUTO_892]]"^ffbc3c【我從武林群俠投奔過來】",
	desc = --[[!AUTO_893]]"來自武林群俠的英雄。",
	image = --[[!AUTO_894]]""
}

title_definition["我从侠客行投奔过来"] =
{
	id = 5842,
	note = --[[!AUTO_895]]"^ffbc3c【我從俠客行投奔過來】",
	desc = --[[!AUTO_896]]"來自俠客行的英雄。",
	image = --[[!AUTO_897]]""
}

title_definition["我从龙投奔过来"] =
{
	id = 5843,
	note = --[[!AUTO_898]]"^ffbc3c【我從龍投奔過來】",
	desc = --[[!AUTO_899]]"來自龍的英雄。",
	image = --[[!AUTO_900]]""
}

title_definition["我从功夫投奔过来"] =
{
	id = 5844,
	note = --[[!AUTO_901]]"^ffbc3c【我從功夫投奔過來】",
	desc = --[[!AUTO_902]]"來自功夫的英雄。",
	image = --[[!AUTO_903]]""
}

title_definition["我从剑狐投奔过来"] =
{
	id = 5845,
	note = --[[!AUTO_904]]"^ffbc3c【我從劍狐投奔過來】",
	desc = --[[!AUTO_905]]"來自劍狐的英雄。",
	image = --[[!AUTO_906]]""
}

title_definition["我从天子投奔过来"] =
{
	id = 5846,
	note = --[[!AUTO_907]]"^ffbc3c【我從天子投奔過來】",
	desc = --[[!AUTO_908]]"來自天子的英雄。",
	image = --[[!AUTO_909]]""
}

title_definition["我从中华英雄来的"] =
{
	id = 5847,
	note = --[[!AUTO_910]]"^ffbc3c【我從中華英雄來的】",
	desc = --[[!AUTO_911]]"來自中華英雄來的的英雄。",
	image = --[[!AUTO_912]]""
}

title_definition["我从四大名捕投奔过来"] =
{
	id = 5848,
	note = --[[!AUTO_913]]"^ffbc3c【我從四大名捕投奔過來】",
	desc = --[[!AUTO_914]]"來自四大名捕的英雄。",
	image = --[[!AUTO_915]]""
}

title_definition["我从卧龙投奔过来"] =
{
	id = 5849,
	note = --[[!AUTO_916]]"^ffbc3c【我從臥龍投奔過來】",
	desc = --[[!AUTO_917]]"來自臥龍的英雄。",
	image = --[[!AUTO_918]]""
}

title_definition["我从墨湘投奔过来"] =
{
	id = 5850,
	note = --[[!AUTO_919]]"^ffbc3c【我從墨湘投奔過來】",
	desc = --[[!AUTO_920]]"來自墨湘的英雄。",
	image = --[[!AUTO_921]]""
}

title_definition["我从天上碑投奔过来"] =
{
	id = 5851,
	note = --[[!AUTO_922]]"^ffbc3c【我從天上碑投奔過來】",
	desc = --[[!AUTO_923]]"來自天上碑的英雄。",
	image = --[[!AUTO_924]]""
}

title_definition["我从刀剑投奔过来"] =
{
	id = 5852,
	note = --[[!AUTO_925]]"^ffbc3c【我從刀劍投奔過來】",
	desc = --[[!AUTO_926]]"來自刀劍的英雄。",
	image = --[[!AUTO_927]]""
}

title_definition["我从鹿鼎记投奔过来"] =
{
	id = 5853,
	note = --[[!AUTO_928]]"^ffbc3c【我從鹿鼎記投奔過來】",
	desc = --[[!AUTO_929]]"來自鹿鼎記的英雄。",
	image = --[[!AUTO_930]]""
}

title_definition["我从独孤投奔过来"] =
{
	id = 5854,
	note = --[[!AUTO_931]]"^ffbc3c【我從獨孤投奔過來】",
	desc = --[[!AUTO_932]]"來自獨孤的英雄。",
	image = --[[!AUTO_933]]""
}

title_definition["我从界天投奔过来"] =
{
	id = 5855,
	note = --[[!AUTO_934]]"^ffbc3c【我從界天投奔過來】",
	desc = --[[!AUTO_935]]"來自界天的英雄。",
	image = --[[!AUTO_936]]""
}

title_definition["我从黄易投奔过来"] =
{
	id = 5856,
	note = --[[!AUTO_937]]"^ffbc3c【我從黃易投奔過來】",
	desc = --[[!AUTO_938]]"來自黃易的英雄。",
	image = --[[!AUTO_939]]""
}

title_definition["我从逍遥投奔过来"] =
{
	id = 5857,
	note = --[[!AUTO_940]]"^ffbc3c【我從逍遙投奔過來】",
	desc = --[[!AUTO_941]]"來自逍遙的英雄。",
	image = --[[!AUTO_942]]""
}

title_definition["我从征途投奔过来"] =
{
	id = 5858,
	note = --[[!AUTO_943]]"^ffbc3c【我從征途投奔過來】",
	desc = --[[!AUTO_944]]"來自征途的英雄。",
	image = --[[!AUTO_945]]""
}

title_definition["我从仙剑投奔过来"] =
{
	id = 5859,
	note = --[[!AUTO_946]]"^ffbc3c【我從仙劍投奔過來】",
	desc = --[[!AUTO_947]]"來自仙劍的英雄。",
	image = --[[!AUTO_948]]""
}

title_definition["我从新蜀山投奔过来"] =
{
	id = 5860,
	note = --[[!AUTO_949]]"^ffbc3c【我從新蜀山投奔過來】",
	desc = --[[!AUTO_950]]"來自新蜀山的英雄。",
	image = --[[!AUTO_951]]""
}

title_definition["我从武林投奔过来"] =
{
	id = 5861,
	note = --[[!AUTO_952]]"^ffbc3c【我從武林投奔過來】",
	desc = --[[!AUTO_953]]"來自武林的英雄。",
	image = --[[!AUTO_954]]""
}

title_definition["我从轩辕剑投奔过来"] =
{
	id = 5862,
	note = --[[!AUTO_955]]"^ffbc3c【我從軒轅劍投奔過來】",
	desc = --[[!AUTO_956]]"來自軒轅劍的英雄。",
	image = --[[!AUTO_957]]""
}

title_definition["我从刀剑笑投奔过来"] =
{
	id = 5863,
	note = --[[!AUTO_958]]"^ffbc3c【我從刀劍笑投奔過來】",
	desc = --[[!AUTO_959]]"來自刀劍笑的英雄。",
	image = --[[!AUTO_960]]""
}

title_definition["我从三国之天投奔过来"] =
{
	id = 5864,
	note = --[[!AUTO_961]]"^ffbc3c【我從三國之天投奔過來】",
	desc = --[[!AUTO_962]]"來自三國之天的英雄。",
	image = --[[!AUTO_963]]""
}

title_definition["我从远征投奔过来"] =
{
	id = 5865,
	note = --[[!AUTO_964]]"^ffbc3c【我從遠征投奔過來】",
	desc = --[[!AUTO_965]]"來自遠征的英雄。",
	image = --[[!AUTO_966]]""
}

title_definition["我从玄武豪侠投奔过来"] =
{
	id = 5866,
	note = --[[!AUTO_967]]"^ffbc3c【我從玄武豪俠投奔過來】",
	desc = --[[!AUTO_968]]"來自玄武豪俠的英雄。",
	image = --[[!AUTO_969]]""
}

title_definition["我从梦诛投奔过来"] =
{
	id = 5867,
	note = --[[!AUTO_970]]"^ffbc3c【我從夢誅投奔過來】",
	desc = --[[!AUTO_971]]"來自夢誅的英雄。",
	image = --[[!AUTO_972]]""
}

title_definition["我从古龙投奔过来"] =
{
	id = 5868,
	note = --[[!AUTO_973]]"^ffbc3c【我從古龍投奔過來】",
	desc = --[[!AUTO_974]]"來自古龍的英雄。",
	image = --[[!AUTO_975]]""
}

title_definition["我从九龙投奔过来"] =
{
	id = 5869,
	note = --[[!AUTO_976]]"^ffbc3c【我從九龍投奔過來】",
	desc = --[[!AUTO_977]]"來自九龍的英雄。",
	image = --[[!AUTO_978]]""
}

title_definition["我从苍天投奔过来"] =
{
	id = 5870,
	note = --[[!AUTO_979]]"^ffbc3c【我從蒼天投奔過來】",
	desc = --[[!AUTO_980]]"來自蒼天的英雄。",
	image = --[[!AUTO_981]]""
}

title_definition["我从东邪投奔过来"] =
{
	id = 5871,
	note = --[[!AUTO_982]]"^ffbc3c【我從東邪投奔過來】",
	desc = --[[!AUTO_983]]"來自東邪的英雄。",
	image = --[[!AUTO_984]]""
}

title_definition["我从参天律投奔过来"] =
{
	id = 5872,
	note = --[[!AUTO_985]]"^ffbc3c【我從參天律投奔過來】",
	desc = --[[!AUTO_986]]"來自參天律的英雄。",
	image = --[[!AUTO_987]]""
}

title_definition["我从幻想神域投奔过来"] =
{
	id = 5873,
	note = --[[!AUTO_988]]"^ffbc3c【我從幻想神域投奔過來】",
	desc = --[[!AUTO_989]]"來自幻想神域的英雄。",
	image = --[[!AUTO_990]]""
}

title_definition["我从完美投奔过来"] =
{
	id = 5874,
	note = --[[!AUTO_991]]"^ffbc3c【我從完美投奔過來】",
	desc = --[[!AUTO_992]]"來自完美的英雄。",
	image = --[[!AUTO_993]]""
}

title_definition["我从嘻游投奔过来"] =
{
	id = 5875,
	note = --[[!AUTO_994]]"^ffbc3c【我從嘻遊投奔過來】",
	desc = --[[!AUTO_995]]"來自嘻游的英雄。",
	image = --[[!AUTO_996]]""
}

title_definition["我从赤壁投奔过来"] =
{
	id = 5876,
	note = --[[!AUTO_997]]"^ffbc3c【我從赤壁投奔過來】",
	desc = --[[!AUTO_998]]"來自赤壁的英雄。",
	image = --[[!AUTO_999]]""
}

title_definition["我从魔兽投奔过来"] =
{
	id = 5877,
	note = --[[!AUTO_1000]]"^ffbc3c【我從魔獸投奔過來】",
	desc = --[[!AUTO_1001]]"來自魔獸的英雄。",
	image = --[[!AUTO_1002]]""
}

title_definition["我从枫之谷投奔过来"] =
{
	id = 5878,
	note = --[[!AUTO_1003]]"^ffbc3c【我從楓之谷投奔過來】",
	desc = --[[!AUTO_1004]]"來自楓之谷的英雄。",
	image = --[[!AUTO_1005]]""
}

title_definition["我从黑契投奔过来"] =
{
	id = 5879,
	note = --[[!AUTO_1006]]"^ffbc3c【我從黑契投奔過來】",
	desc = --[[!AUTO_1007]]"來自黑契的英雄。",
	image = --[[!AUTO_1008]]""
}

title_definition["我从暗黑投奔过来"] =
{
	id = 5880,
	note = --[[!AUTO_1009]]"^ffbc3c【我從暗黑投奔過來】",
	desc = --[[!AUTO_1010]]"來自暗黑的英雄。",
	image = --[[!AUTO_1011]]""
}

title_definition["我从黎明投奔过来"] =
{
	id = 5881,
	note = --[[!AUTO_1012]]"^ffbc3c【我從黎明投奔過來】",
	desc = --[[!AUTO_1013]]"來自黎明的英雄。",
	image = --[[!AUTO_1014]]""
}

title_definition["我从TERA投奔过来"] =
{
	id = 5882,
	note = --[[!AUTO_1015]]"^ffbc3c【我從TERA投奔過來】",
	desc = --[[!AUTO_1016]]"來自TERA的英雄。",
	image = --[[!AUTO_1017]]""
}

title_definition["我从圣斗士投奔过来"] =
{
	id = 5883,
	note = --[[!AUTO_1018]]"^ffbc3c【我從聖鬥士投奔過來】",
	desc = --[[!AUTO_1019]]"來自聖鬥士的英雄。",
	image = --[[!AUTO_1020]]""
}

title_definition["我从仙境投奔过来"] =
{
	id = 5884,
	note = --[[!AUTO_1021]]"^ffbc3c【我從仙境投奔過來】",
	desc = --[[!AUTO_1022]]"來自仙境的英雄。",
	image = --[[!AUTO_1023]]""
}

title_definition["我从激战投奔过来"] =
{
	id = 5885,
	note = --[[!AUTO_1024]]"^ffbc3c【我從激戰投奔過來】",
	desc = --[[!AUTO_1025]]"來自激戰的英雄。",
	image = --[[!AUTO_1026]]""
}

title_definition["我从玛奇投奔过来"] =
{
	id = 5886,
	note = --[[!AUTO_1027]]"^ffbc3c【我從瑪奇投奔過來】",
	desc = --[[!AUTO_1028]]"來自瑪奇的英雄。",
	image = --[[!AUTO_1029]]""
}

title_definition["我从Q群仙投奔过来"] =
{
	id = 5887,
	note = --[[!AUTO_1030]]"^ffbc3c【我從Q群仙投奔過來】",
	desc = --[[!AUTO_1031]]"來自Q群仙的英雄。",
	image = --[[!AUTO_1032]]""
}

title_definition["鸿运大侠"] =
{
	id = 6677,
	note = --[[!AUTO_1060]]"^ff0000鴻運大俠",
	desc = --[[!AUTO_1061]]"鴻運大俠",
	image = --[[!AUTO_1062]]""
}

title_definition["一解恩仇论剑大会武林盟主"] =
{
	id = 6678,
	note = --[[!AUTO_1063]]"^ffbc3c一解恩仇論劍大會武林盟主",
	desc = --[[!AUTO_1064]]"一解恩仇論劍大會武林盟主",
	image = --[[!AUTO_1065]]""
}

title_definition["一解恩仇论剑大会亚军"] =
{
	id = 6679,
	note = --[[!AUTO_1066]]"^ffbc3c一解恩仇論劍大會亞軍",
	desc = --[[!AUTO_1067]]"一解恩仇論劍大會亞軍",
	image = --[[!AUTO_1068]]""
}

title_definition["一解恩仇论剑大会季军"] =
{
	id = 6680,
	note = --[[!AUTO_1069]]"^ffbc3c一解恩仇論劍大會季軍",
	desc = --[[!AUTO_1070]]"一解恩仇論劍大會季軍",
	image = --[[!AUTO_1071]]""
}

title_definition["一解恩仇论剑大会八强战神"] =
{
	id = 6681,
	note = --[[!AUTO_1072]]"^ffbc3c一解恩仇論劍大會八強戰神",
	desc = --[[!AUTO_1073]]"一解恩仇論劍大會八強戰神",
	image = --[[!AUTO_1074]]""
}

title_definition["一解恩仇论剑大会32强精英"] =
{
	id = 6682,
	note = --[[!AUTO_1075]]"^ffbc3c一解恩仇論劍大會32強精英",
	desc = --[[!AUTO_1076]]"一解恩仇論劍大會32強精英",
	image = --[[!AUTO_1077]]""
}

title_definition["武道1"] =
{
	id = 1224,
	note = --[[!AUTO_1078]]"^ff0000【獨孤求敗】",
	desc = --[[!AUTO_1079]]"天下第一武道會冠軍",
	image = --[[!AUTO_1080]]""
}

title_definition["学员1"] =
{
	id = 1310,
	note = --[[!AUTO_1081]]"^f06ea9「詠＊綻放」",
	desc = --[[!AUTO_1082]]"我是學員稱號獎勵",
	image = --[[!AUTO_1083]]""
}

title_definition["天下会之武林盟主"] =
{
	id = 7001,
	note = --[[!AUTO_1147]]"^ff0000【武林盟主】",
	desc = --[[!AUTO_1148]]"天下會之武林盟主",
	image = --[[!AUTO_1149]]""
}

title_definition["天下会之星月谋士"] =
{
	id = 7002,
	note = --[[!AUTO_1150]]"^a800ff【蒼穹賢士】",
	desc = --[[!AUTO_1151]]"天下會之蒼穹賢士",
	image = --[[!AUTO_1152]]""
}

title_definition["天下会之传功长老"] =
{
	id = 7003,
	note = --[[!AUTO_1153]]"^ff7d2f【傳功長老】",
	desc = --[[!AUTO_1154]]"天下會之傳功長老",
	image = --[[!AUTO_1155]]""
}

title_definition["天下会之执法长老"] =
{
	id = 7004,
	note = --[[!AUTO_1156]]"^ff7d2f【執法長老】",
	desc = --[[!AUTO_1157]]"天下會之執法長老",
	image = --[[!AUTO_1158]]""
}

title_definition["天下会之天罡护法"] =
{
	id = 7005,
	note = --[[!AUTO_1159]]"^ff7d2f【天罡護法】",
	desc = --[[!AUTO_1160]]"天下會之天罡護法",
	image = --[[!AUTO_1161]]""
}

title_definition["天下会之地煞护法"] =
{
	id = 7006,
	note = --[[!AUTO_1162]]"^ff7d2f【地煞護法】",
	desc = --[[!AUTO_1163]]"天下會之地煞護法",
	image = --[[!AUTO_1164]]""
}

title_definition["天下会之青龙堂主"] =
{
	id = 7007,
	note = --[[!AUTO_1165]]"^ff7d2f【冥龍壇主】",
	desc = --[[!AUTO_1166]]"天下會之冥龍壇主",
	image = --[[!AUTO_1167]]""
}

title_definition["天下会之白虎堂主"] =
{
	id = 7008,
	note = --[[!AUTO_1168]]"^ff7d2f【赤焰壇主】",
	desc = --[[!AUTO_1169]]"天下會之赤焰壇主",
	image = --[[!AUTO_1170]]""
}

title_definition["天下会之朱雀堂主"] =
{
	id = 7009,
	note = --[[!AUTO_1171]]"^ff7d2f【青木壇主】",
	desc = --[[!AUTO_1172]]"天下會之青木壇主",
	image = --[[!AUTO_1173]]""
}

title_definition["天下会之玄武堂主"] =
{
	id = 7010,
	note = --[[!AUTO_1174]]"^ff7d2f【雪祭壇主】",
	desc = --[[!AUTO_1175]]"天下會之雪祭壇主",
	image = --[[!AUTO_1176]]""
}

title_definition["天下会之飞龙军"] =
{
	id = 7011,
	note = --[[!AUTO_1177]]"^ffbc3c【飛龍軍】",
	desc = --[[!AUTO_1178]]"天下會之飛龍軍",
	image = --[[!AUTO_1179]]""
}


title_definition["天下会之龙门镖师"] =
{
	id = 7012,
	note = --[[!AUTO_1180]]"^ffbc3c【龍門鏢師】",
	desc = --[[!AUTO_1181]]"天下會之龍門鏢師",
	image = --[[!AUTO_1182]]""
}

title_definition["9月充值促情侣定制称号男"] =
{
	id = 103 ,
	note = "^ff0000【陪$S看江山如畫】" ,
	desc = "情侶定制稱號" ,
	image = "" ,
}

title_definition["9月充值促情侣定制称号女"] =
{
	id = 104 ,
	note = "^ff0000【陪$S看星空燦爛】" ,
	desc = "情侶定制稱號" ,
	image = "" ,
}
title_definition["9月充值促萌物称号"] =
{
	id = 105 ,
	note = "^ffbc3c【小萌物啊萌萌噠】" ,
	desc = "萌物稱號" ,
	image = "" ,
}
title_definition["9月充值促武侠称号"] =
{
	id = 106 ,
	note = "^ff7d2f【我的拳頭有碗口這麼大】" ,
	desc = "武俠稱號" ,
	image = "" ,
}
title_definition["9月充值促宫廷称号"] =
{
	id = 107 ,
	note = "^a800ff【本王狂霸拽】" ,
	desc = "宮廷稱號" ,
	image = "" ,
}
title_definition["9月充值促宫廷称号女"] =
{
	id = 108 ,
	note = "^a800ff【本宮冷酷炫】" ,
	desc = "宮廷稱號" ,
	image = "" ,
}
title_definition["9月充值促流行称号"] =
{
	id = 109 ,
	note = "^ff7d2f【你是我的小蘋果】" ,
	desc = "流行稱號" ,
	image = "" ,
}
title_definition["9月充值促流行称号女"] =
{
	id = 110 ,
	note = "^ff7d2f【怎麼愛你都不嫌多】" ,
	desc = "流行稱號" ,
	image = "" ,
}
title_definition["9月充值促独孤称号"] =
{
	id = 111 ,
	note = "^09a3e2【在這個肆意揮霍的年代，我不曾孤單】" ,
	desc = "獨孤稱號" ,
	image = "" ,
}
title_definition["光棍节分手快乐称号"] =
{
	id = 112 ,
	note = "^09a3e2【分手快樂】" ,
	desc = "光棍節稱號" ,
	image = "" ,
}
title_definition["全球争霸赛押奖称号"] =
{
	id = 113 ,
	note = "^ff7d2f【神算子】" ,
	desc = "全球爭霸賽押獎稱號" ,
	image = "" ,
}
title_definition["完美十周年称号"] =
{
	id = 114 ,
	note = "^09a3e2【十年蹤跡十年心】" ,
	desc = "完美十周年稱號" ,
	image = "" ,
}
title_definition["全明星冠军称号"] =
{
	id = 115 ,
	note = "^ff0000【唯我獨尊】" ,
	desc = "全明星冠軍稱號" ,
	image = "" ,
}
title_definition["全明星2-10名称号"] =
{
	id = 116 ,
	note = "^a800ff【蓋世英雄】" ,
	desc = "全明星2-10名稱號" ,
	image = "" ,
}
title_definition["全明星11-30名称号"] =
{
	id = 117 ,
	note = "^ff7d2f【叱吒武林】" ,
	desc = "全明星11-30名稱號" ,
	image = "" ,
}
title_definition["元旦活动称号"] =
{
	id = 118 ,
	note = "^ffbc3c【也是醉了】" ,
	desc = "元旦活動稱號" ,
	image = "" ,
}
title_definition["打雪仗10次称号"] =
{
	id = 119 ,
	note = "^ffffff【江山初雪】" ,
	desc = "打雪仗10次稱號" ,
	image = "" ,
}
title_definition["打雪仗30次称号"] =
{
	id = 120 ,
	note = "^ffffff【雪舞乾坤】" ,
	desc = "打雪仗30次稱號" ,
	image = "" ,
}
title_definition["打雪仗80次称号"] =
{
	id = 121 ,
	note = "^ffffff【冰雪之王】" ,
	desc = "打雪仗80次稱號" ,
	image = "" ,
}
title_definition["黑木崖第一称号"] =
{
	id = 122 ,
	note = "^ff0000【黑暗帝王】" ,
	desc = "黑木崖第一稱號" ,
	image = "" ,
}
title_definition["黑木崖第二档称号"] =
{
	id = 123 ,
	note = "^ff0000【誰能擋我】" ,
	desc = "黑木崖第二檔稱號" ,
	image = "" ,
}
title_definition["黑木崖第三档称号"] =
{
	id = 124 ,
	note = "^ff0000【絞肉機】" ,
	desc = "黑木崖第三檔稱號" ,
	image = "" ,
}
title_definition["充值排行第一名称号"] =
{
	id = 125 ,
	note = "^000000^000000【笑傲群雄^ff0000霸天下】" ,
	desc = "充值排行第一名稱號" ,
	image = "" ,
}
title_definition["充值排行第二名称号"] =
{
	id = 126 ,
	note = "^ffbc3c【一擲千金】" ,
	desc = "充值排行第二名稱號" ,
	image = "" ,
}
title_definition["充值排行第三名称号"] =
{
	id = 127 ,
	note = "^ffbc3c【富甲天下】" ,
	desc = "充值排行第三名稱號" ,
	image = "" ,
}
title_definition["2014精英帮派挑战赛第一名称号"] =
{
	id = 128 ,
	note = "^ff0000【2014精英幫派挑戰賽冠軍】" ,
	desc = "2014精英幫派挑戰賽第一名稱號" ,
	image = "" ,
}
title_definition["2014精英帮派挑战赛第二名称号"] =
{
	id = 129 ,
	note = "^ff0000【2014精英幫派挑戰賽亞軍】" ,
	desc = "2014精英幫派挑戰賽第二名稱號" ,
	image = "" ,
}
title_definition["2014精英帮派挑战赛第三名称号"] =
{
	id = 130 ,
	note = "^ff0000【2014精英幫派挑戰賽季軍】" ,
	desc = "2014精英幫派挑戰賽第三名稱號" ,
	image = "" ,
}
title_definition["2014精英帮派挑战赛第四名称号"] =
{
	id = 131 ,
	note = "^ff0000【2014精英幫派挑戰賽殿軍】" ,
	desc = "2014精英幫派挑戰賽第四名稱號" ,
	image = "" ,
}
title_definition["2014精英帮派挑战赛8强称号"] =
{
	id = 132 ,
	note = "^ff0000【2014精英幫派挑戰賽8強】" ,
	desc = "2014精英幫派挑戰賽8強稱號" ,
	image = "" ,
}
title_definition["2014精英帮派挑战赛16强称号"] =
{
	id = 133 ,
	note = "^ff0000【2014精英幫派挑戰賽16強】" ,
	desc = "2014精英幫派挑戰賽16強稱號" ,
	image = "" ,
}
title_definition["2014精英帮派挑战赛32强称号"] =
{
	id = 134 ,
	note = "^ff0000【2014精英幫派挑戰賽32強】" ,
	desc = "2014精英幫派挑戰賽32強稱號" ,
	image = "" ,
}
title_definition["2015情人节花魁榜第一名称号"] =
{
	id = 135 ,
	note = "^f06ea9【一曲霓裳，傾盡天下只為君】" ,
	desc = "2015情人節活動第一名女性稱號" ,
	image = "" ,
}
title_definition["2015情人节情圣榜第一名称号"] =
{
	id = 136 ,
	note = "^f06ea9【半闕廣陵，佳緣若夢有幾人】" ,
	desc = "2015情人節活動第一名男性稱號" ,
	image = "" ,
}
title_definition["2015情人节花魁榜二至五名称号"] =
{
	id = 137 ,
	note = "^f06ea9【為我傾此生解情愁】" ,
	desc = "2015情人節活動第二名女性稱號" ,
	image = "" ,
}
title_definition["2015情人节情圣榜二至五名称号"] =
{
	id = 138 ,
	note = "^f06ea9【為你負江山敵天下】" ,
	desc = "2015情人節活動第二名男性稱號" ,
	image = "" ,
}
title_definition["2015情人节花魁榜六至二十名称号"] =
{
	id = 139 ,
	note = "^f06ea9【三寸季光只悅君】" ,
	desc = "2015情人節活動第三名女性稱號" ,
	image = "" ,
}
title_definition["2015情人节情圣榜榜六至二十名称号"] =
{
	id = 140 ,
	note = "^f06ea9【七色年華不負卿】" ,
	desc = "2015情人節活動第三名男性稱號" ,
	image = "" ,
}
title_definition["2015情人节花魁榜二十至一百名称号"] =
{
	id = 141 ,
	note = "^f06ea9【蒲葦紉如絲】" ,
	desc = "2015情人節活動二十至一百名女性稱號" ,
	image = "" ,
}
title_definition["2015情人节情圣榜二十至一百名称号"] =
{
	id = 142 ,
	note = "^f06ea9【磐石無轉移】" ,
	desc = "2015情人節活動二十至一百名男性稱號" ,
	image = "" ,
}
title_definition["2015情人节花魁榜一百至五百名称号"] =
{
	id = 143 ,
	note = "^09a3e2【伴君三生】" ,
	desc = "2015情人節活動一百至五百名女性稱號" ,
	image = "" ,
}
title_definition["2015情人节情圣榜一百至五百名称号"] =
{
	id = 144 ,
	note = "^09a3e2【眷卿三世】" ,
	desc = "2015情人節活動一百至五百名男性稱號" ,
	image = "" ,
}
title_definition["2015情人节花魁榜参与奖称号"] =
{
	id = 145 ,
	note = "^f06ea9【長相思】" ,
	desc = "2015情人節活動四至十名女性稱號" ,
	image = "" ,
}
title_definition["2015情人节情圣榜参与奖称号"] =
{
	id = 146 ,
	note = "^f06ea9【長相憶】" ,
	desc = "2015情人節活動四至十名男性稱號" ,
	image = "" ,
}
title_definition["相约2016，我在这里等你！"] =
{
	id = 147 ,
	note = "^09a3e2【相約2016，我在這裡等你！】" ,
	desc = "相約2016，我在這裡等你！" ,
	image = "" ,
}
title_definition["烟花榜11-300名称号"] =
{
	id = 148 ,
	note = "^09a3e2【火樹銀花不夜天】" ,
	desc = "一起來放煙花吧！" ,
	image = "" ,
}
title_definition["来自npcgo的英雄"] =
{
	id = 149 ,
	note = "^ffbc3c【npcgo俠客】" ,
	desc = "來自npcgo的英雄" ,
	image = "" ,
}
title_definition["2015四月充值10元称号"] =
{
	id = 150 ,
	note = "^ff0000【武功再高也怕菜刀】" ,
	desc = "武功再高也怕菜刀" ,
	image = "" ,
}
title_definition["2015四月充值100元称号"] =
{
	id = 151 ,
	note = "^ff7d2f【每天都被自己的美貌閃瞎眼】" ,
	desc = "每天都被自己的美貌閃瞎眼" ,
	image = "" ,
}
title_definition["2015四月充值1000元称号"] =
{
	id = 152 ,
	note = "^a800ff【左青龍，右白虎，胸口紋著米老鼠】" ,
	desc = "左青龍，右白虎，胸口紋著米老鼠" ,
	image = "" ,
}
title_definition["2015四月充值3300元称号"] =
{
	id = 153 ,
	note = "^ffbc3c【江湖十大傑出青年之有錢任性】" ,
	desc = "江湖十大傑出青年之有錢任性" ,
	image = "" ,
}
title_definition["2015四月充值情侣称号男"] =
{
	id = 154 ,
	note = "^f06ea9【不求榮華富貴，但求與$S溫馨到老】" ,
	desc = "情侶定制稱號" ,
	image = "" ,
}

title_definition["2015四月充值情侣称号女"] =
{
	id = 155 ,
	note = "^f06ea9【不求轟轟烈烈，但求$S視我如寶】" ,
	desc = "情侶定制稱號" ,
	image = "" ,
}
title_definition["2015四月充值私人定制称号"] =
{
	id = 156 ,
	note = "^09a3e2【人強何必稱號拽】" ,
	desc = "私人定制稱號" ,
	image = "" ,
}
title_definition["来自苏宁易购的英雄"] =
{
	id = 157 ,
	note = "^ffbc3c【蘇甯俠客】" ,
	desc = "來自蘇甯易購的英雄" ,
	image = "" ,
}
title_definition["2015充值8800称号奖励"] =
{
	id = 158 ,
	note = "^ff0000笑^e4007f·^fff100傲^e4007f·^00ffff江^e4007f·^ff0000湖" ,
	desc = "定制稱號" ,
	image = "" ,
}
title_definition["情侣大礼包专属称号男"] =
{
	id = 159 ,
	note = "^ff7d2f【願我們所到之處青山綠水】" ,
	desc = "情侶大禮包專屬男性角色稱號" ,
	image = "" ,
}
title_definition["情侣大礼包专属称号女"] =
{
	id = 160 ,
	note = "^ff7d2f【願我們所過之處春暖花開】" ,
	desc = "情侶大禮包專屬女性角色稱號" ,
	image = "" ,
}
title_definition["2015新服七夕活动称号男"] =
{
	id = 161 ,
	note = "^f06ea9【妹子，帶你去吃麻辣燙】" ,
	desc = "願你擁有美好的愛情" ,
	image = "" ,
}
title_definition["2015新服七夕活动称号女"] =
{
	id = 162 ,
	note = "^f06ea9【不約，叔叔我不約】" ,
	desc = "願你擁有美好的愛情" ,
	image = "" ,
}
----------------------------------------------------------------------
--称号目录定义，限定为2级目录结构

----------------------------------------------------------------------
title_dir["测试"] =
{
	["测试称号"] = {1,2,3,4,1130,1131},
}

title_dir["社交"] =
{
	["师徒"] = {1105,1230,1231,1232},
	["活动"] = {10,11,12,13,14,15,16,17,18,19,20,21,1284,1285},
}

title_dir["家园"] =
{
	["采集"] = {1106},
}

title_dir["帮派"] =
{
	["荣誉称号"] = {6},
}

title_dir["阵营"] =
{
	["魏国"] = {1104},
}

title_dir["武林等级"] =
{
	["段位"] = {2030,2029,2028,2027,2026,2025,2024,2023,2022,2021,2020,2019,2018,2017,2016,2015,2014,2013,2012,2011,2010,2009,2008,2007,2006,2005,2004,2003,2002,2001},
	["声望"] ={1220,1221,1223},
}

title_dir["霸业"] =
{
	["盟主"] = {255},
	["嵩山"] = {257,256},
}

title_dir["爵位"] =
{
	["爵位"] = {1110,1111,1112,1113,1114,1115,1116,1117,1118,1120,1121,1122,1123,1124,1125,1126,1127,1128,1129},
}

title_dir["明星"] =
{
	["帮主"] = {1201,1202},
	["游侠"] = {1241,1242,1243,1244,1245},
	["师德"] = {1230,1231},
	["竞技"] = {1220,1221,1222},
}

title_dir["求爱"] =
{
	["好感度"] = {2001,2002,2003,2004,2005,2006,2007,2008,2009,2010,2011,2012,2013,2014,2015,2016,2017,2018},
}

title_dir["国战"] =
{
	["国战"] = {7001,7002,7003,7004,7005,7006,7007,7008,7009,7010,7011},
}

title_definition["英雄归来"] =
{
	id = 31 ,
	note = --[[!AUTO_1084]]"^ffbc3c【英雄歸來】" ,
	desc = --[[!AUTO_1085]]"英雄霸氣歸來，重溫江湖夢。",
	image = --[[!AUTO_1086]]"",
}
title_definition["喜闻乐见"] =
{
	id = 32 ,
	note = --[[!AUTO_1087]]"^ffbc3c【喜聞樂見】" ,
	desc = --[[!AUTO_1088]]"",
	image = --[[!AUTO_1089]]"",
}
title_definition["天下第一"] =
{
	id = 33 ,
	note = --[[!AUTO_1090]]"^ffbc3c【天下第一】" ,
	desc = --[[!AUTO_1091]]"",
	image = --[[!AUTO_1092]]"",
}
title_definition["天下无双 巴士PK赛冠军"] =
{
	id = 34 ,
	note = --[[!AUTO_1093]]"^a800ff【天下無雙 巴士PK賽冠軍】" ,
	desc = --[[!AUTO_1094]]"",
	image = --[[!AUTO_1095]]"",
}
title_definition["超凡入圣 巴士PK赛亚军"] =
{
	id = 35 ,
	note = --[[!AUTO_1096]]"^a800ff【超凡入聖 巴士PK賽亞軍】" ,
	desc = --[[!AUTO_1097]]"",
	image = --[[!AUTO_1098]]"",
}
title_definition["世外高人 巴士PK赛季军"] =
{
	id = 36 ,
	note = --[[!AUTO_1099]]"^a800ff【世外高人 巴士PK賽季軍】" ,
	desc = --[[!AUTO_1100]]"",
	image = --[[!AUTO_1101]]"",
}
title_definition["财大气粗"] =
{
	id = 37 ,
	note = --[[!AUTO_1102]]"^ffbc3c【我最上道】" ,
	desc = --[[!AUTO_1103]]"",
	image = --[[!AUTO_1104]]"",
}
title_definition["腰缠万贯"] =
{
	id = 38 ,
	note = --[[!AUTO_1105]]"^ffbc3c【金牌主持人】" ,
	desc = --[[!AUTO_1106]]"",
	image = --[[!AUTO_1107]]"",
}
title_definition["富甲一方"] =
{
	id = 39 ,
	note = --[[!AUTO_1108]]"^ffbc3c【金牌賽評】" ,
	desc = --[[!AUTO_1109]]"",
	image = --[[!AUTO_1110]]"",
}
title_definition["玩雪的人"] =
{
	id = 40 ,
	note = --[[!AUTO_1111]]"^ffffff【玩雪的人】" ,
	desc = --[[!AUTO_1112]]"",
	image = --[[!AUTO_1113]]"",
}
title_definition["打雪仗小分队队长"] =
{
	id = 41 ,
	note = --[[!AUTO_1114]]"^ff7d2f【打雪仗小分隊隊長】" ,
	desc = --[[!AUTO_1115]]"",
	image = --[[!AUTO_1116]]"",
}
title_definition["雪霸"] =
{
	id = 42 ,
	note = --[[!AUTO_1117]]"^a800ff【雪霸】" ,
	desc = --[[!AUTO_1118]]"",
	image = --[[!AUTO_1119]]"",
}
title_definition["鸿运当头"] =
{
	id = 43 ,
	note = --[[!AUTO_1120]]"^a800ff【鴻運當頭】" ,
	desc = --[[!AUTO_1121]]"",
	image = --[[!AUTO_1122]]"",
}
title_definition["独斗粘兽的勇者"] =
{
	id = 44 ,
	note = --[[!AUTO_1123]]"^ff7d2f【獨鬥粘獸的勇者】" ,
	desc = --[[!AUTO_1124]]"" ,
	image = --[[!AUTO_1125]]"" ,
}
title_definition["第一花魁"] =
{
	id = 45 ,
	note = --[[!AUTO_1126]]"^f06ea9【第一花魁】" ,
	desc = --[[!AUTO_1127]]"" ,
	image = --[[!AUTO_1128]]"" ,
}
title_definition["全民偶像"] =
{
	id = 46 ,
	note = --[[!AUTO_1129]]"^f06ea9【全民偶像】" ,
	desc = --[[!AUTO_1130]]"" ,
	image = --[[!AUTO_1131]]"" ,
}
title_definition["万人迷"] =
{
	id = 47 ,
	note = --[[!AUTO_1132]]"^f06ea9【萬人迷】" ,
	desc = --[[!AUTO_1133]]"" ,
	image = --[[!AUTO_1134]]"" ,
}
title_definition["情癫大圣"] =
{
	id = 48 ,
	note = --[[!AUTO_1135]]"^ff0000【情癲大聖】" ,
	desc = --[[!AUTO_1136]]"" ,
	image = --[[!AUTO_1137]]"" ,
}
title_definition["爱神"] =
{
	id = 49 ,
	note = --[[!AUTO_1138]]"^ff0000【愛神】" ,
	desc = --[[!AUTO_1139]]"" ,
	image = --[[!AUTO_1140]]"" ,
}
title_definition["为伊消得人憔悴"] =
{
	id = 50 ,
	note = --[[!AUTO_1141]]"^ff0000【為伊消得人憔悴】" ,
	desc = --[[!AUTO_1142]]"" ,
	image = --[[!AUTO_1143]]"" ,
}
title_definition["情种"] =
{
	id = 51 ,
	note = --[[!AUTO_1144]]"^ff0000【情種】" ,
	desc = --[[!AUTO_1145]]"" ,
	image = --[[!AUTO_1146]]"" ,
}
title_definition["来自星星的你"] =
{
	id = 52 ,
	note = "^09a3e2【來自星星的你】" ,
	desc = "" ,
	image = "" ,
}
title_definition["洛阳个人榜称号"] =
{
	id = 53 ,
	note = "^ff0000【金毛獅王】" ,
	desc = "" ,
	image = "" ,
}
title_definition["青城个人榜称号"] =
{
	id = 54 ,
	note = "^ff0000【青城戰神】" ,
	desc = "" ,
	image = "" ,
}
title_definition["洛阳战队榜称号"] =
{
	id = 55 ,
	note = "^ff0000【百戰狂獅】" ,
	desc = "" ,
	image = "" ,
}
title_definition["青城战队榜称号"] =
{
	id = 56 ,
	note = "^ff0000【不敗傳說】" ,
	desc = "" ,
	image = "" ,
}
--title_definition["老带新初级"] =
--{
--	id = 6683 ,
--	note = "^09a3e2【老带新初级】" ,
--	desc = "" ,
--	image = "" ,
--}

--title_definition["老带新高级"] =
--{
--	id = 6684 ,
--	note = "^09a3e2【老带新高级】" ,
--	desc = "" ,
--	image = "" ,
--}

--title_definition["老带新初级新手奖励"] =
--{
--	id = 6685 ,
--	note = "^09a3e2【老带新初级新手奖励】" ,
--	desc = "" ,
--	image = "" ,
--}

--title_definition["老带新中级"] =
--{
--	id = 6686 ,
--	note = "^09a3e2【老带新中级】" ,
--	desc = "" ,
--	image = "" ,
--}

title_definition["康师傅称号"] =
{
	id = 57 ,
	note = "^ffbc3c【康師傅滋潤使者】" ,
	desc = "" ,
	image = "" ,
}
title_definition["易乐游称号"] =
{
	id = 58 ,
	note = "^ffbc3c【易樂游俠客】" ,
	desc = "" ,
	image = "" ,
}
title_definition["顺网称号"] =
{
	id = 59 ,
	note = "^ffbc3c【順網俠客】" ,
	desc = "" ,
	image = "" ,
}
title_definition["网吧PK赛冠军称号"] =
{
	id = 60 ,
	note = "^ff0000【天下無雙】" ,
	desc = "" ,
	image = "" ,
}
title_definition["网吧PK赛亚军称号"] =
{
	id = 61 ,
	note = "^ff0000【超凡入聖】" ,
	desc = "" ,
	image = "" ,
}
title_definition["网吧PK赛季军称号"] =
{
	id = 62 ,
	note = "^ff0000【世外高人】" ,
	desc = "" ,
	image = "" ,
}

title_definition["流浪者 Wanderer"] =
{
	id = 6687 ,
	note = "^09a3e2【流浪者 Wanderer】" ,
	desc = "" ,
	image = "" ,
}

title_definition["Graceful Crane"] =
{
	id = 6688 ,
	note = "^09a3e2【Graceful Crane】" ,
	desc = "" ,
	image = "" ,
}

title_definition["Drunken Master"] =
{
	id = 6689 ,
	note = "^09a3e2【Drunken Master】" ,
	desc = "" ,
	image = "" ,
}

title_definition["Jade Mountain"] =
{
	id = 6690 ,
	note = "^09a3e2【Jade Mountain】" ,
	desc = "" ,
	image = "" ,
}
title_definition["White Lotus"] =
{
	id = 6691 ,
	note = "^09a3e2【White Lotus】" ,
	desc = "" ,
	image = "" ,
}

title_definition["Invincible Sage"] =
{
	id = 6692 ,
	note = "^09a3e2【Invincible Sage】" ,
	desc = "" ,
	image = "" ,
}

title_definition["Iron Monkey"] =
{
	id = 6693 ,
	note = "^09a3e2【Iron Monkey】" ,
	desc = "" ,
	image = "" ,
}

title_definition["Lone Wolf"] =
{
	id = 6694 ,
	note = "^09a3e2【Lone Wolf】" ,
	desc = "" ,
	image = "" ,
}

title_definition["Lightening Fist"] =
{
	id = 6695 ,
	note = "^09a3e2【Lightening Fist】" ,
	desc = "" ,
	image = "" ,
}

title_definition["【论剑大会笑傲团队武林盟主】"] =
{
	id = 6696 ,
	note = "^ff0000【論劍大會笑傲團隊武林盟主】" ,
	desc = "" ,
	image = "" ,
}

title_definition["【论剑大会笑傲团队亚军】"] =
{
	id = 6697 ,
	note = "^ff0000【論劍大會笑傲團隊亞軍】" ,
	desc = "" ,
	image = "" ,
}

title_definition["【论剑大会笑傲团队季军】"] =
{
	id = 6698 ,
	note = "^ff0000【論劍大會笑傲團隊季軍】" ,
	desc = "" ,
	image = "" ,
}

title_definition["【论剑大会女侠组至尊天后】"] =
{
	id = 6699 ,
	note = "^ff0000【論劍大會女俠組至尊天后】" ,
	desc = "" ,
	image = "" ,
}

title_definition["【论剑大会女侠组亚军】"] =
{
	id = 6700 ,
	note = "^ff0000【論劍大會女俠組亞軍】" ,
	desc = "" ,
	image = "" ,
}

title_definition["【论剑大会女侠组季军】"] =
{
	id = 6701 ,
	note = "^ff0000【論劍大會女俠組季軍】" ,
	desc = "" ,
	image = "" ,
}

title_definition["【第二届论剑大会武林盟主】"] =
{
	id = 6702 ,
	note = "^ff0000【第二屆論劍大會武林盟主】" ,
	desc = "" ,
	image = "" ,
}

title_definition["【第二届论剑大会亚军】"] =
{
	id = 6703 ,
	note = "^ff0000【第二屆論劍大會亞軍】" ,
	desc = "" ,
	image = "" ,
}

title_definition["【第二届论剑大会季军】"] =
{
	id = 6704 ,
	note = "^ff0000【第二屆論劍大會季軍】" ,
	desc = "" ,
	image = "" ,
}

title_definition["【第二届论剑大会八强战神】"] =
{
	id = 6705 ,
	note = "^ff0000【第二屆論劍大會八強戰神】" ,
	desc = "" ,
	image = "" ,
}
title_definition["世界杯巴西支持者"] =
{
	id = 63 ,
	note = "^ffbc3c【巴西支持者】" ,
	desc = "" ,
	image = "" ,
}
title_definition["世界杯克罗地亚支持者"] =
{
	id = 64 ,
	note = "^ffbc3c【克羅地亞支持者】" ,
	desc = "" ,
	image = "" ,
}
title_definition["世界杯墨西哥支持者"] =
{
	id = 65 ,
	note = "^ffbc3c【墨西哥支持者】" ,
	desc = "" ,
	image = "" ,
}
title_definition["世界杯喀麦隆支持者"] =
{
	id = 66 ,
	note = "^ffbc3c【喀麥隆支持者】" ,
	desc = "" ,
	image = "" ,
}
title_definition["世界杯西班牙支持者"] =
{
	id = 67 ,
	note = "^ffbc3c【西班牙支持者】" ,
	desc = "" ,
	image = "" ,
}
title_definition["世界杯荷兰支持者"] =
{
	id = 68 ,
	note = "^ffbc3c【荷蘭支持者】" ,
	desc = "" ,
	image = "" ,
}
title_definition["世界杯智利支持者"] =
{
	id = 69 ,
	note = "^ffbc3c【智利支持者】" ,
	desc = "" ,
	image = "" ,
}
title_definition["世界杯澳大利亚支持者"] =
{
	id = 70 ,
	note = "^ffbc3c【澳大利亞支持者】" ,
	desc = "" ,
	image = "" ,
}
title_definition["世界杯哥伦比亚支持者"] =
{
	id = 71 ,
	note = "^ffbc3c【哥倫比亞支持者】" ,
	desc = "" ,
	image = "" ,
}
title_definition["世界杯希腊支持者"] =
{
	id = 72 ,
	note = "^ffbc3c【希臘支持者】" ,
	desc = "" ,
	image = "" ,
}
title_definition["世界杯科特迪瓦支持者"] =
{
	id = 73 ,
	note = "^ffbc3c【象牙海岸支持者】" ,
	desc = "" ,
	image = "" ,
}
title_definition["世界杯日本支持者"] =
{
	id = 74 ,
	note = "^ffbc3c【日本支持者】" ,
	desc = "" ,
	image = "" ,
}
title_definition["世界杯乌拉圭支持者"] =
{
	id = 75 ,
	note = "^ffbc3c【烏拉圭支持者】" ,
	desc = "" ,
	image = "" ,
}
title_definition["世界杯哥斯达黎加支持者"] =
{
	id = 76 ,
	note = "^ffbc3c【哥斯大黎加支持者】" ,
	desc = "" ,
	image = "" ,
}
title_definition["世界杯英格兰支持者"] =
{
	id = 77 ,
	note = "^ffbc3c【英格蘭支持者】" ,
	desc = "" ,
	image = "" ,
}
title_definition["世界杯意大利支持者"] =
{
	id = 78 ,
	note = "^ffbc3c【義大利支持者】" ,
	desc = "" ,
	image = "" ,
}
title_definition["世界杯瑞士支持者"] =
{
	id = 79 ,
	note = "^ffbc3c【瑞士支持者】" ,
	desc = "" ,
	image = "" ,
}
title_definition["世界杯厄瓜多尔支持者"] =
{
	id = 80 ,
	note = "^ffbc3c【厄瓜多爾支持者】" ,
	desc = "" ,
	image = "" ,
}
title_definition["世界杯法国支持者"] =
{
	id = 81 ,
	note = "^ffbc3c【法國支持者】" ,
	desc = "" ,
	image = "" ,
}
title_definition["世界杯洪都拉斯支持者"] =
{
	id = 82 ,
	note = "^ffbc3c【洪都拉斯支持者】" ,
	desc = "" ,
	image = "" ,
}
title_definition["世界杯阿根廷支持者"] =
{
	id = 83 ,
	note = "^ffbc3c【阿根廷支持者】" ,
	desc = "" ,
	image = "" ,
}
title_definition["世界杯波黑支持者"] =
{
	id = 84 ,
	note = "^ffbc3c【波黑支持者】" ,
	desc = "" ,
	image = "" ,
}
title_definition["世界杯伊朗支持者"] =
{
	id = 85 ,
	note = "^ffbc3c【伊朗支持者】" ,
	desc = "" ,
	image = "" ,
}
title_definition["世界杯尼日利亚支持者"] =
{
	id = 86 ,
	note = "^ffbc3c【尼日利亞支持者】" ,
	desc = "" ,
	image = "" ,
}
title_definition["世界杯德国支持者"] =
{
	id = 87 ,
	note = "^ffbc3c【德國支持者】" ,
	desc = "" ,
	image = "" ,
}
title_definition["世界杯葡萄牙支持者"] =
{
	id = 88 ,
	note = "^ffbc3c【葡萄牙支持者】" ,
	desc = "" ,
	image = "" ,
}
title_definition["世界杯加纳支持者"] =
{
	id = 89 ,
	note = "^ffbc3c【加納支持者】" ,
	desc = "" ,
	image = "" ,
}
title_definition["世界杯美国支持者"] =
{
	id = 90 ,
	note = "^ffbc3c【美國支持者】" ,
	desc = "" ,
	image = "" ,
}
title_definition["世界杯比利时支持者"] =
{
	id = 91 ,
	note = "^ffbc3c【比利時支持者】" ,
	desc = "" ,
	image = "" ,
}
title_definition["世界杯阿尔及利亚支持者"] =
{
	id = 92 ,
	note = "^ffbc3c【阿爾及利亞支持者】" ,
	desc = "" ,
	image = "" ,
}
title_definition["世界杯俄罗斯支持者"] =
{
	id = 93 ,
	note = "^ffbc3c【俄羅斯支持者】" ,
	desc = "" ,
	image = "" ,
}
title_definition["世界杯韩国支持者"] =
{
	id = 94 ,
	note = "^ffbc3c【韓國支持者】" ,
	desc = "" ,
	image = "" ,
}
title_definition["世界杯冠军称号"] =
{
	id = 95,
	note = "^ff0000【齊雲】",
	desc = "一腳踢出天邊月，兩肩擎起海中星，何歎國足英雄少，當知高手在園情。",
	image = "",
}
title_definition["周年庆寻宝活动成功"] =
{
	id = 96 ,
	note = "^ff0000【探險家】" ,
	desc = "" ,
	image = "" ,
}
title_definition["周年庆寻宝活动失败"] =
{
	id = 97,
	note = "^ff0000【我是一隻杯具】",
	desc = "",
	image = "",
}
title_definition["周年庆棒棒糖"] =
{
	id = 98,
	note = "^ff0000【風雨同舟一周年】",
	desc = "",
	image = "",
}
title_definition["果维康称号"] =
{
	id = 99 ,
	note = "^ffbc3c【果維康俠客】" ,
	desc = "" ,
	image = "" ,
}
title_definition["网易侠客称号"] =
{
	id = 100 ,
	note = "^ffbc3c【網易俠客】" ,
	desc = "" ,
	image = "" ,
}
title_definition["教主归来称号"] =
{
	id = 101 ,
	note = "^ffbc3c【教主歸來】" ,
	desc = "" ,
	image = "" ,
}
title_definition["京东称号"] =
{
	id = 102 ,
	note = "^ffbc3c【京東俠客】" ,
	desc = "" ,
	image = "" ,
}

title_definition["【第三届武林大会武林盟主】"] =
{
	id = 6706 ,
	note = "^ff0000【第三屆武林大會武林盟主】" ,
	desc = "" ,
	image = "" ,
}

title_definition["【第三届武林大会大侠组亚军】"] =
{
	id = 6707 ,
	note = "^ff0000【第三屆武林大會大俠組亞軍】" ,
	desc = "" ,
	image = "" ,
}

title_definition["【第三届武林大会大侠组季军】"] =
{
	id = 6708 ,
	note = "^ff0000【第三屆武林大會大俠組季軍】" ,
	desc = "" ,
	image = "" ,
}

title_definition["【第三届武林大会八强战神】"] =
{
	id = 6709 ,
	note = "^ff0000【第三屆武林大會八強戰神】" ,
	desc = "" ,
	image = "" ,
}

title_definition["【第三届武林大会至尊天后】"] =
{
	id = 6710 ,
	note = "^ff0000【第三屆武林大會至尊天后】" ,
	desc = "" ,
	image = "" ,
}

title_definition["【第三届武林大会女侠组亚军】"] =
{
	id = 6711 ,
	note = "^ff0000【第三屆武林大會女俠組亞軍】" ,
	desc = "" ,
	image = "" ,
}

title_definition["【第三届武林大会女侠组季军】"] =
{
	id = 6712 ,
	note = "^ff0000【第三屆武林大會女俠組季軍】" ,
	desc = "" ,
	image = "" ,
}

title_definition["【第三届武林大会团体队盟】"] =
{
	id = 6713 ,
	note = "^ff0000【第三屆武林大會團體隊盟】" ,
	desc = "" ,
	image = "" ,
}

title_definition["【第三届武林大会团体组亚军】"] =
{
	id = 6714 ,
	note = "^ff0000【第三屆武林大會團體組亞軍】" ,
	desc = "" ,
	image = "" ,
}

title_definition["【第三届武林大会团体组季军】"] =
{
	id = 6715 ,
	note = "^ff0000【第三屆武林大會團體組季軍】" ,
	desc = "" ,
	image = "" ,
}

title_definition["2014圣诞节下雪任务"] =
{
	id = 2000 ,
	note = "^09a3e2「雪＊織夢」" ,
	desc = "曾經呼風喚雪的證明" ,
	image = "" ,
}

title_definition["2017七夕节流星任务"] =
{
	id = 2096 ,
	note = "^09a3e2「星＊戀歌」" ,
	desc = "曾經感動過上天的人" ,
	image = "" ,
}

title_definition["2016圣诞节环城任务"] =
{
	id = 2097 ,
	note = "^f06ea9「淩＊冰雪」" ,
	desc = "聖誕老人的代言人" ,
	image = "" ,
}

title_definition["2016圣诞节小雪任务"] =
{
	id = 2098 ,
	note = "^f06ea9「淩＊傲雪」" ,
	desc = "曾經灑下過雪花的人" ,
	image = "" ,
}

title_definition["2016七夕节流星任务"] =
{
	id = 2099 ,
	note = "^f06ea9「星＊天魁」" ,
	desc = "曾經感動過上天的人" ,
	image = "" ,
}

title_definition["2015七夕节流星任务"] =
{
	id = 2100 ,
	note = "^f06ea9「星＊天河」" ,
	desc = "曾經感動過上天的人" ,
	image = "" ,
}

title_definition["2015圣诞节小雪任务"] =
{
	id = 2101 ,
	note = "^f06ea9「心＊星願」" ,
	desc = "曾經灑下過流星的人" ,
	image = "" ,
}

title_definition["少林首席弟子"] =
{
	id = 2102 ,
	note = "^a800ff★少林首席弟子" ,
	desc = "少林首席弟子" ,
	image = "" ,
}

title_definition["武当首席弟子"] =
{
	id = 2103 ,
	note = "^a800ff★武當首席弟子" ,
	desc = "武當首席弟子" ,
	image = "" ,
}

title_definition["华山首席弟子"] =
{
	id = 2104 ,
	note = "^a800ff★華山首席弟子" ,
	desc = "華山首席弟子" ,
	image = "" ,
}

title_definition["恒山首席弟子"] =
{
	id = 2105 ,
	note = "^a800ff★恒山首席弟子" ,
	desc = "恒山首席弟子" ,
	image = "" ,
}

title_definition["衡山首席弟子"] =
{
	id = 2106 ,
	note = "^a800ff★衡山首席弟子" ,
	desc = "衡山首席弟子" ,
	image = "" ,
}

title_definition["日月首席弟子"] =
{
	id = 2107 ,
	note = "^a800ff★日月首席弟子" ,
	desc = "日月首席弟子" ,
	image = "" ,
}

title_definition["五仙首席弟子"] =
{
	id = 2108 ,
	note = "^a800ff★五仙首席弟子" ,
	desc = "五仙首席弟子" ,
	image = "" ,
}

title_definition["逍遥首席弟子"] =
{
	id = 2109 ,
	note = "^a800ff★逍遙首席弟子" ,
	desc = "逍遙首席弟子" ,
	image = "" ,
}

title_definition["唐门首席弟子"] =
{
	id = 2110 ,
	note = "^a800ff★唐門首席弟子" ,
	desc = "唐門首席弟子" ,
	image = "" ,
}

title_definition["峨嵋首席弟子"] =
{
	id = 2111 ,
	note = "^a800ff★峨嵋首席弟子" ,
	desc = "峨嵋首席弟子" ,
	image = "" ,
}

title_definition["独孤首席弟子"] =
{
	id = 2112 ,
	note = "^a800ff★獨孤首席弟子" ,
	desc = "獨孤首席弟子" ,
	image = "" ,
}

title_definition["笑傲VIP称号1"] =
{
	id = 2201 ,
	note = "^ff7d2f英·初展鋒芒" ,
	desc = "英武會一階稱號" ,
	image = "" ,
}

title_definition["笑傲VIP称号2"] =
{
	id = 2202 ,
	note = "^ff7d2f英·鋒芒畢露" ,
	desc = "英武會二階稱號" ,
	image = "" ,
}

title_definition["笑傲VIP称号3"] =
{
	id = 2203 ,
	note = "^ff7d2f英·名動一方" ,
	desc = "英武會三階稱號" ,
	image = "" ,
}

title_definition["笑傲VIP称号4"] =
{
	id = 2204 ,
	note = "^a800ff英·武林豪傑" ,
	desc = "英武會四階稱號" ,
	image = "" ,
}

title_definition["笑傲VIP称号5"] =
{
	id = 2205 ,
	note = "^a800ff英·名滿江湖" ,
	desc = "英武會五階稱號" ,
	image = "" ,
}

title_definition["笑傲VIP称号6"] =
{
	id = 2206 ,
	note = "^a800ff英·威震江湖" ,
	desc = "英武會六階稱號" ,
	image = "" ,
}

title_definition["笑傲VIP称号7"] =
{
	id = 2207 ,
	note = "^ff0000英·威震天下" ,
	desc = "英武會七階稱號" ,
	image = "" ,
}

title_definition["笑傲VIP称号8"] =
{
	id = 2208 ,
	note = "^ff0000英·絕世無雙" ,
	desc = "英武會八階稱號" ,
	image = "" ,
}

title_definition["笑傲VIP称号9"] =
{
	id = 2209 ,
	note = "^ff0000英·笑傲乾坤" ,
	desc = "英武會九階稱號" ,
	image = "" ,
}

title_definition["笑傲VIP称号10"] =
{
	id = 2210 ,
	note = "^ff0000真·土豪" ,
	desc = "英武會十階稱號" ,
	image = "" ,
}

title_definition["2015七夕情圣榜第一名"] =
{
	id = 6716 ,
	note = "^f06ea9「江山如畫，抵不過你笑靨如花」" ,
	desc = "2015七夕情聖榜第一名" ,
	image = "" ,
}

title_definition["2015七夕情圣榜第二名"] =
{
	id = 6717 ,
	note = "^f06ea9「曾經滄海難為水，除卻巫山不是雲」" ,
	desc = "2015七夕情聖榜第二名" ,
	image = "" ,
}

title_definition["2015七夕情圣榜第三名"] =
{
	id = 6718 ,
	note = "^f06ea9「花堪折時直須折，莫待無花空折枝」" ,
	desc = "2015七夕情聖榜第三名" ,
	image = "" ,
}

title_definition["2015七夕情圣榜第四名"] =
{
	id = 6719 ,
	note = "^f06ea9「願得一人心，白首不相離」" ,
	desc = "2015七夕情聖榜第四名" ,
	image = "" ,
}

title_definition["2015七夕情圣榜第五名"] =
{
	id = 6720 ,
	note = "^f06ea9「但願人長久，千里共嬋娟」" ,
	desc = "2015七夕情聖榜第五名" ,
	image = "" ,
}

title_definition["2015七夕情圣榜第六至三百名"] =
{
	id = 6721 ,
	note = "^09a3e2「護花使者」" ,
	desc = "2015七夕情聖榜第第六至三百名" ,
	image = "" ,
}

title_definition["2015七夕花魁榜第一名"] =
{
	id = 6722 ,
	note = "^f06ea9「洗淨鉛華，只願與你執手白頭」" ,
	desc = "2015七夕花魁榜第一名" ,
	image = "" ,
}

title_definition["2015七夕花魁榜第二名"] =
{
	id = 6723 ,
	note = "^f06ea9「山有木兮木有枝，心悅君兮君不知」" ,
	desc = "2015七夕花魁榜第二名" ,
	image = "" ,
}

title_definition["2015七夕花魁榜第三名"] =
{
	id = 6724 ,
	note = "^f06ea9「人生若只如初見，何事秋風悲畫扇」" ,
	desc = "2015七夕花魁榜第三名" ,
	image = "" ,
}

title_definition["2015七夕花魁榜第四名"] =
{
	id = 6725 ,
	note = "^f06ea9「只緣感君一回顧，使我思君朝與暮」" ,
	desc = "2015七夕花魁榜第四名" ,
	image = "" ,
}

title_definition["2015七夕花魁榜第五名"] =
{
	id = 6726 ,
	note = "^f06ea9「心似雙絲網，中有千千結」" ,
	desc = "2015七夕花魁榜第五名" ,
	image = "" ,
}

title_definition["2015七夕花魁榜第六至三百名"] =
{
	id = 6727 ,
	note = "^09a3e2「藍色妖姬」" ,
	desc = "2015七夕花魁榜第六至三百名" ,
	image = "" ,
}

title_definition["情圣排行榜第一名"] =
{
	id = 6728 ,
	note = "^ff0000「情聖」" ,
	desc = "情圣排行榜第一名" ,
	image = "" ,
}

title_definition["情圣排行榜第二至十名"] =
{
	id = 6729 ,
	note = "^f06ea9「大眾情人」" ,
	desc = "情圣排行榜第二至十名" ,
	image = "" ,
}

title_definition["花魁排行榜第一名"] =
{
	id = 6730 ,
	note = "^ff0000「花魁」" ,
	desc = "花魁排行榜第一名" ,
	image = "" ,
}

title_definition["花魁排行榜第二至十名"] =
{
	id = 6731 ,
	note = "^f06ea9「玫瑰仙子」" ,
	desc = "花魁排行榜第二至十名" ,
	image = "" ,
}

title_definition["2015年8月回归玩家称号"] =
{
	id = 6732 ,
	note = "^09a3e2「我來，九霄龍吟驚天變」" ,
	desc = "2015年8月回歸玩家稱號" ,
	image = "" ,
}

title_definition["2015年8月活跃玩家称号"] =
{
	id = 6733 ,
	note = "^09a3e2「我在，一遇風雪便化龍」" ,
	desc = "2015年8月活躍玩家稱號" ,
	image = "" ,
}

title_definition["2015年七夕活动招矿50次"] =
{
	id = 6734 ,
	note = "^09a3e2【織心雨音】" ,
	desc = "2015年七夕活動中使用招礦符50次" ,
	image = "" ,
}

title_definition["2015年七夕活动招矿100次"] =
{
	id = 6735 ,
	note = "^f06ea9【織情雲歌】" ,
	desc = "2015年七夕活動中使用招礦符100次" ,
	image = "" ,
}

title_definition["2015年七夕活动招矿200次"] =
{
	id = 6736 ,
	note = "^ff0000【織愛天籟】" ,
	desc = "2015年七夕活動中使用招礦符200次" ,
	image = "" ,
}

title_definition["2015年七夕活动采矿50次"] =
{
	id = 6737 ,
	note = "^09a3e2【拾心雪語】" ,
	desc = "2015年七夕活動中採集映月盈珠碎片50次" ,
	image = "" ,
}

title_definition["2015年七夕活动采矿100"] =
{
	id = 6738 ,
	note = "^f06ea9【拾情雲天】" ,
	desc = "2015年七夕活動中採集映月盈珠碎片100次" ,
	image = "" ,
}

title_definition["2015年七夕活动采矿200"] =
{
	id = 6739 ,
	note = "^ff0000【拾愛天辰】" ,
	desc = "2015年七夕活動中採集映月盈珠碎片200次" ,
	image = "" ,
}

title_definition["2015年七夕新服称号"] =
{
	id = 6740 ,
	note = "^f06ea9「妹子，帶你去吃麻辣燙」" ,
	desc = "2015年七夕新服稱號" ,
	image = "" ,
}

title_definition["2015年七夕新服称号"] =
{
	id = 6741 ,
	note = "^f06ea9「不約，叔叔我不約」" ,
	desc = "2015年七夕新服稱號" ,
	image = "" ,
}

title_definition["2015年消费回馈称号"] =
{
	id = 6742 ,
	note = "^ff0000「手撕鬼子」" ,
	desc = "2015年消費回饋稱號" ,
	image = "" ,
}

title_definition["PGP专属称号"] =
{
	id = 6743 ,
	note = "^ff0000「PGP小英雄」" ,
	desc = "PGP專屬稱號" ,
	image = "" ,
}
title_definition["2015年中秋烟火大会优胜称号"] =
{
	id = 6744 ,
	note = "^f06ea9「煙火大會優勝」" ,
	desc = "2015年中秋煙火大會稱號" ,
	image = "" ,
}

title_definition["2015年中秋烟火大会王者称号"] =
{
	id = 6745 ,
	note = "^ff0000【煙火大會王者】" ,
	desc = "2015年中秋煙火大會稱號" ,
	image = "" ,
}
title_definition["201511月500档"] =
{
	id = 6746 ,
	note = "^09a3e2「別理我，讓我萌一會兒」" ,
	desc = "" ,
	image = "" ,
}
title_definition["201511月1000档"] =
{
	id = 6747 ,
	note = "^09a3e2【不錯，在下葉良辰】" ,
	desc = "" ,
	image = "" ,
}
title_definition["201511月3300档"] =
{
	id = 6748 ,
	note = "^a800ff【然而，我趙日天並不服】" ,
	desc = "" ,
	image = "" ,
}
title_definition["201511月携手江湖男"] =
{
	id = 6749 ,
	note = "^ff0000【$S在我身旁，敵軍千萬又何妨？】" ,
	desc = "情侶定制稱號" ,
	image = "" ,
}
title_definition["201511月携手江湖女"] =
{
	id = 6750 ,
	note = "^ff0000【$S在我身旁，情敵千萬又何妨？】",
	desc = "" ,
	image = "" ,
}
title_definition["2015声望称号1"] =
{
	id = 6751 ,
	note = "^f06ea9【豬是的念來過倒】" ,
	desc = "" ,
	image = "" ,
}
title_definition["2015声望称号2"] =
{
	id = 6752 ,
	note = "^f06ea9【別人家的孩子】" ,
	desc = "" ,
	image = "" ,
}
title_definition["2015声望称号3"] =
{
	id = 6753 ,
	note = "^f06ea9【扶還是不扶？這是一個問題】" ,
	desc = "" ,
	image = "" ,
}
title_definition["2015声望称号4"] =
{
	id = 6754 ,
	note = "^f06ea9【嵩陽書院首席顧問】" ,
	desc = "" ,
	image = "" ,
}
title_definition["2015声望称号5"] =
{
	id = 6755 ,
	note = "^f06ea9【山雨欲來風滿樓】" ,
	desc = "" ,
	image = "" ,
}
title_definition["2015声望称号6"] =
{
	id = 6756 ,
	note = "^f06ea9【沒有魚味的魚香肉絲】" ,
	desc = "" ,
	image = "" ,
}
title_definition["2015声望称号7"] =
{
	id = 6757 ,
	note = "^f06ea9【媽媽說稱號長了可以用來遮雨】" ,
	desc = "" ,
	image = "" ,
}
title_definition["2015声望称号8"] =
{
	id = 6758 ,
	note = "^f06ea9【我是小公舉】" ,
	desc = "" ,
	image = "" ,
}
title_definition["2015声望称号9"] =
{
	id = 6759 ,
	note = "^f06ea9【我良辰必有重謝】" ,
	desc = "" ,
	image = "" ,
}
title_definition["2015声望称号10"] =
{
	id = 6760 ,
	note = "^f06ea9【單身狗也是狗】" ,
	desc = "" ,
	image = "" ,
}
title_definition["2015声望称号11"] =
{
	id = 6761 ,
	note = "^f06ea9【五霸崗第一辯手】" ,
	desc = "" ,
	image = "" ,
}
title_definition["2015声望称号12"] =
{
	id = 6762 ,
	note = "^f06ea9【臣妾做不到啊】" ,
	desc = "" ,
	image = "" ,
}
title_definition["2015声望称号13"] =
{
	id = 6763 ,
	note = "^f06ea9【良辰不介意奉陪到底】" ,
	desc = "" ,
	image = "" ,
}
title_definition["2015声望称号14"] =
{
	id = 6764 ,
	note = "^f06ea9【武當三十八元大蝦】" ,
	desc = "" ,
	image = "" ,
}
title_definition["2015声望称号15"] =
{
	id = 6765 ,
	note = "^f06ea9【江湖好聲音】" ,
	desc = "" ,
	image = "" ,
}
title_definition["2015声望称号16"] =
{
	id = 6766 ,
	note = "^f06ea9【遊山玩水紈絝子弟】" ,
	desc = "" ,
	image = "" ,
}
title_definition["2015声望称号17"] =
{
	id = 6767 ,
	note = "^f06ea9【手動點蠟專家】" ,
	desc = "" ,
	image = "" ,
}
title_definition["2015声望称号18"] =
{
	id = 6768 ,
	note = "^f06ea9【菜鳥鑄劍師】" ,
	desc = "" ,
	image = "" ,
}
title_definition["2015声望称号19"] =
{
	id = 6769 ,
	note = "^f06ea9【六月份的尾巴是處女座】" ,
	desc = "" ,
	image = "" ,
}
title_definition["2015声望称号20"] =
{
	id = 6770 ,
	note = "^f06ea9【聖姑後援會高級會員】" ,
	desc = "" ,
	image = "" ,
}
title_definition["2015声望称号21"] =
{
	id = 6771 ,
	note = "^f06ea9【蒙面山歌之王】" ,
	desc = "" ,
	image = "" ,
}
title_definition["2015声望称号22"] =
{
	id = 6772 ,
	note = "^f06ea9【感動笑傲好大俠】" ,
	desc = "" ,
	image = "" ,
}
title_definition["2015声望称号23"] =
{
	id = 6773 ,
	note = "^f06ea9【白蓮花終結者】" ,
	desc = "" ,
	image = "" ,
}
title_definition["2015声望称号24"] =
{
	id = 6774 ,
	note = "^f06ea9【欲練此功，必先自宮】" ,
	desc = "" ,
	image = "" ,
}
title_definition["2015声望称号25"] =
{
	id = 6775 ,
	note = "^f06ea9【浮生逐夢人】" ,
	desc = "" ,
	image = "" ,
}
title_definition["2015声望称号26"] =
{
	id = 6776 ,
	note = "^f06ea9【天地孤獨客】" ,
	desc = "" ,
	image = "" ,
}
title_definition["2015声望称号27"] =
{
	id = 6777 ,
	note = "^f06ea9【佛心劍意了情絲】" ,
	desc = "" ,
	image = "" ,
}
title_definition["2015声望称号28"] =
{
	id = 6778 ,
	note = "^f06ea9【逍遙偷果子大王】" ,
	desc = "" ,
	image = "" ,
}
title_definition["2015声望称号29"] =
{
	id = 6779 ,
	note = "^f06ea9【五仙養蠱小能手】" ,
	desc = "" ,
	image = "" ,
}
title_definition["2015声望称号30"] =
{
	id = 6780 ,
	note = "^f06ea9【早死早復活】" ,
	desc = "" ,
	image = "" ,
}
title_definition["2015声望称号31"] =
{
	id = 6781 ,
	note = "^f06ea9【看到教主在畫妝我的內心幾乎是崩潰的】" ,
	desc = "" ,
	image = "" ,
}
title_definition["2015声望称号32"] =
{
	id = 6782 ,
	note = "^f06ea9【拿什麼拯救你？我的DPS】" ,
	desc = "" ,
	image = "" ,
}
title_definition["2015声望称号33"] =
{
	id = 6783 ,
	note = "^f06ea9【大家保重我要去裝逼了】" ,
	desc = "" ,
	image = "" ,
}
title_definition["2015声望称号34"] =
{
	id = 6784 ,
	note = "^f06ea9【不要死，也不要孤獨的活】" ,
	desc = "" ,
	image = "" ,
}
title_definition["2015声望称号35"] =
{
	id = 6785 ,
	note = "^f06ea9【100錠都不給我】" ,
	desc = "" ,
	image = "" ,
}
title_definition["2015声望称号36"] =
{
	id = 6786 ,
	note = "^f06ea9【水至清則無魚，人至賤則無敵】" ,
	desc = "" ,
	image = "" ,
}
title_definition["2015声望称号37"] =
{
	id = 6787 ,
	note = "^f06ea9【你長得很美，那就不要想得更美】" ,
	desc = "" ,
	image = "" ,
}
title_definition["2015声望称号38"] =
{
	id = 6788 ,
	note = "^f06ea9【相愛容易，相守難】" ,
	desc = "" ,
	image = "" ,
}
title_definition["2015声望称号39"] =
{
	id = 6789 ,
	note = "^f06ea9【我深深地愛著你，你卻愛著個煞筆】",
	desc = "" ,
	image = "" ,
}
title_definition["2015年恒山归来称号"] =
{
	id = 6790 ,
	note = "^f06ea9【恒山精英】" ,
	desc = "2015年恒山歸來稱號" ,
	image = "" ,
}
title_definition["爬塔副本称号1"] =
{
	id = 6791 ,
	note = "^09a3e2【六道輪回守衛】" ,
	desc = "六道輪回副本專屬稱號" ,
	image = "" ,
}
title_definition["爬塔副本称号2"] =
{
	id = 6792 ,
	note = "^09a3e2【六道輪回審判】" ,
	desc = "六道輪回副本專屬稱號" ,
	image = "" ,
}
title_definition["爬塔副本称号3"] =
{
	id = 6793 ,
	note = "^a800ff【輪回之主】" ,
	desc = "六道輪回副本專屬稱號" ,
	image = "" ,
}
title_definition["独孤活动称号"] =
{
	id = 6798 ,
	note = "^09a3e2【獨孤元老】" ,
	desc = "2015獨孤立派稱號" ,
	image = "" ,
}
title_definition["消消乐称号1"] =
{
	id = 6794 ,
	note = "^09a3e2【火眼金睛】" ,
	desc = "累計完成10次連連看" ,
	image = "" ,
}
title_definition["消消乐称号2"] =
{
	id = 6795 ,
	note = "^09a3e2【鈦合金X眼】" ,
	desc = "累計完成50次連連看" ,
	image = "" ,
}
title_definition["消消乐称号3"] =
{
	id = 6796 ,
	note = "^ff0000【這天，再也遮不住我的眼】" ,
	desc = "累計完成100次連連看" ,
	image = "" ,
}
title_definition["消消乐称号4"] =
{
	id = 6797 ,
	note = "^ff0000【神之眼】" ,
	desc = "累計完成200次連連看" ,
	image = "" ,
}
title_definition["独孤活动称号"] =
{
	id = 6798 ,
	note = "^09a3e2【獨孤元老】" ,
	desc = "2015獨孤立派稱號" ,
	image = "" ,
}
title_definition["2015帮派王者之战亚军"] =
{
	id = 6799 ,
	note = "^ff0000【2015幫派王者之戰亞軍】" ,
	desc = "2015幫派王者之戰亞軍" ,
	image = "" ,
}
title_definition["2015帮派王者之战季军"] =
{
	id = 6800 ,
	note = "^ff0000【2015幫派王者之戰季軍】" ,
	desc = "2015幫派王者之戰季軍" ,
	image = "" ,
}
title_definition["2015帮派王者之战8强"] =
{
	id = 6801 ,
	note = "^ff0000【2015幫派王者之戰8強】" ,
	desc = "2015幫派王者之戰8強" ,
	image = "" ,
}
title_definition["2015帮派王者之战16强"] =
{
	id = 6802 ,
	note = "^ff0000【2015幫派王者之戰16強】" ,
	desc = "2015幫派王者之戰16強" ,
	image = "" ,
}
title_definition["2015帮派王者之战冠军"] =
{
	id = 6803 ,
	note = "^ff0000【2015幫派王者之戰冠軍】" ,
	desc = "2015幫派王者之戰冠軍" ,
	image = "" ,
}
title_definition["笑傲微信关注称号"] =
{
	id = 6804 ,
	note = "^ff7d2f【主要看氣質】" ,
	desc = "笑傲江湖ol微信端活動獎勵" ,
	image = "" ,
}
title_definition["打不过就跑"] =
{
	id = 6805 ,
	note = "^ff0000打不過就跑" ,
	desc = "打不過就跑" ,
	image = "" ,
}
title_definition["吓死宝宝了"] =
{
	id = 6806 ,
	note = "^a800ff嚇死寶寶了" ,
	desc = "嚇死寶寶了" ,
	image = "" ,
}
title_definition["这B装的我给99分，多一分怕骄傲"] =
{
	id = 6807 ,
	note = "^ff0000這B裝的我給99分，多一分怕驕傲" ,
	desc = "這B裝的我給99分，多一分怕驕傲" ,
	image = "" ,
}
title_definition["这B装的我给满分"] =
{
	id = 6808 ,
	note = "^ff0000這B裝的我給滿分" ,
	desc = "這B裝的我給滿分" ,
	image = "" ,
}
title_definition["你是猴子派来的救兵吗？"] =
{
	id = 6809 ,
	note = "^f06ea9你是猴子派來的救兵嗎？" ,
	desc = "你是猴子派來的救兵嗎？" ,
	image = "" ,
}
title_definition["没错，我就是猴子派来的逗比"] =
{
	id = 6810 ,
	note = "^f06ea9沒錯，我就是猴子派來的逗比" ,
	desc = "沒錯，我就是猴子派來的逗比" ,
	image = "" ,
}
title_definition["VIP补偿称号"] =
{
	id = 6811 ,
	note = "^ff0000【壕無人性】" ,
	desc = "VIP補償稱號" ,
	image = "" ,
}
title_definition["十星武器最高竞价者！"] =
{
	id = 6812 ,
	note = "^ff0000【官方認證】" ,
	desc = "十星武器最高競價者！" ,
	image = "" ,
}
title_definition["累计完成10次小游戏"] =
{
	id = 6813 ,
	note = "^09a3e2【我心有猛虎，細嗅薔薇】" ,
	desc = "累計完成10次小遊戲" ,
	image = "" ,
}
title_definition["累计完成50次小游戏"] =
{
	id = 6814 ,
	note = "^09a3e2【從前有個手殘，有一天他閑得蛋疼】" ,
	desc = "累計完成50次小遊戲" ,
	image = "" ,
}
title_definition["累计完成100次小游戏"] =
{
	id = 6815 ,
	note = "^f06ea9【十大傑出青年之眼神好】" ,
	desc = "累計完成100次小遊戲" ,
	image = "" ,
}
title_definition["累计完成300次小游戏"] =
{
	id = 6816 ,
	note = "^f06ea9【寶寶的內心幾乎是崩潰的】" ,
	desc = "累計完成300次小遊戲" ,
	image = "" ,
}
title_definition["累计完成500次小游戏"] =
{
	id = 6817 ,
	note = "^f06ea9【我不會就這樣輕易地狗帶】" ,
	desc = "累計完成500次小遊戲" ,
	image = "" ,
}
title_definition["累计完成666次小游戏"] =
{
	id = 6818 ,
	note = "^f06ea9【麻麻說稱號太長PK時躲在樹後容易被發現】" ,
	desc = "累計完成666次小遊戲" ,
	image = "" ,
}
title_definition["累计完成1000次小游戏"] =
{
	id = 6819 ,
	note = "^ff0000【強迫症】" ,
	desc = "累計完成1000次小遊戲" ,
	image = "" ,
}
title_definition["无敌大纨纨的相公"] =
{
	id = 6820 ,
	note = "^000000【無敵大紈紈的相公】" ,
	desc = "製作的視頻被用於媒體宣傳，特此獎勵" ,
	image = "" ,
}
title_definition["无敌大杀器的娘子"] =
{
	id = 6821 ,
	note = "^000000【無敵大殺器的娘子】" ,
	desc = "製作的視頻被用於媒體宣傳，特此獎勵" ,
	image = "" ,
}
title_definition["帅的有点累了"] =
{
	id = 6822 ,
	note = "^00ff00【帥的有點累了】" ,
	desc = "製作的視頻被用於媒體宣傳，特此獎勵" ,
	image = "" ,
}
title_definition["归来的大侠"] =
{
	id = 6823 ,
	note = "^00ff00【歸來的大俠】" ,
	desc = "2016四月回歸稱號" ,
	image = "" ,
}
title_definition["你咋不上天呢"] =
{
	id = 6824 ,
	note = "^ff0000【你咋不上天呢】" ,
	desc = "充值1000元獎勵稱號" ,
	image = "" ,
}
title_definition["少点套路，多点真诚"] =
{
	id = 6825 ,
	note = "^ff0000【少點套路，多點真誠】" ,
	desc = "充值3300元獎勵稱號" ,
	image = "" ,
}
title_definition["充值6000元奖励称号1"] =
{
	id = 6826 ,
	note = "^f06ea9【$S曾經滄海難為水，除卻巫山不是雲】" ,
	desc = "充值6000元獎勵稱號" ,
	image = "" ,
}
title_definition["充值6000元奖励称号2"] =
{
	id = 6827 ,
	note = "^f06ea9【$S取次花叢懶回顧，半緣修道半緣君】" ,
	desc = "充值6000元獎勵稱號" ,
	image = "" ,
}
title_definition["总有刁民想害朕"] =
{
	id = 6828 ,
	note = "^ff0000【總有刁民想害朕】" ,
	desc = "充值10000元獎勵稱號" ,
	image = "" ,
}
title_definition["天枢宫帮主称号"] =
{
	id = 6829 ,
	note = "^ff0000【天樞宮貪狼星君】" ,
	desc = "天樞宮幫主稱號" ,
	image = "" ,
}
title_definition["天枢宫帮众称号"] =
{
	id = 6830 ,
	note = "^00ffff【天樞宮神將】" ,
	desc = "天樞宮幫眾稱號" ,
	image = "" ,
}
title_definition["天璇宫帮主称号"] =
{
	id = 6831 ,
	note = "^ff0000【天璿宮巨門星君】" ,
	desc = "天璿宮幫主稱號" ,
	image = "" ,
}
title_definition["天璇宫帮众称号"] =
{
	id = 6832 ,
	note = "^00ffff【天璿宮神將】" ,
	desc = "天璿宮幫眾稱號" ,
	image = "" ,
}
title_definition["天玑宫帮主称号"] =
{
	id = 6833 ,
	note = "^ff0000【天璣宮祿存星君】" ,
	desc = "天璣宮幫主稱號" ,
	image = "" ,
}
title_definition["天玑宫帮众称号"] =
{
	id = 6834 ,
	note = "^00ffff【天璣宮神將】" ,
	desc = "天璣宮幫眾稱號" ,
	image = "" ,
}
title_definition["天权宫帮主称号"] =
{
	id = 6835 ,
	note = "^ff0000【天權宮文曲星君】" ,
	desc = "天權宮幫主稱號" ,
	image = "" ,
}
title_definition["天权宫帮众称号"] =
{
	id = 6836 ,
	note = "^00ffff【天權宮神將】" ,
	desc = "天權宮幫眾稱號" ,
	image = "" ,
}
title_definition["玉衡宫帮主称号"] =
{
	id = 6837 ,
	note = "^ff0000【玉衡宮廉貞星君】" ,
	desc = "玉衡宮幫主稱號" ,
	image = "" ,
}
title_definition["玉衡宫帮众称号"] =
{
	id = 6838 ,
	note = "^00ffff【玉衡宮神將】" ,
	desc = "玉衡宮幫眾稱號" ,
	image = "" ,
}
title_definition["开阳宫帮主称号"] =
{
	id = 6839 ,
	note = "^ff0000【開陽宮武曲星君】" ,
	desc = "開陽宮幫主稱號" ,
	image = "" ,
}
title_definition["开阳宫帮众称号"] =
{
	id = 6840 ,
	note = "^00ffff【開陽宮神將】" ,
	desc = "開陽宮幫眾稱號" ,
	image = "" ,
}
title_definition["摇光宫帮主称号"] =
{
	id = 6841 ,
	note = "^ff0000【搖光宮破軍星君】" ,
	desc = "搖光宮幫主稱號" ,
	image = "" ,
}
title_definition["摇光宫帮众称号"] =
{
	id = 6842 ,
	note = "^00ffff【搖光宮神將】" ,
	desc = "搖光宮幫眾稱號" ,
	image = "" ,
}
title_definition["洞明预选帮帮主称号"] =
{
	id = 6843 ,
	note = "^ff0000【洞明宮左輔星君】" ,
	desc = "洞明預選幫幫主稱號" ,
	image = "" ,
}
title_definition["洞明预选帮帮众称号"] =
{
	id = 6844 ,
	note = "^00ffff【洞明宮神將】" ,
	desc = "洞明預選幫幫眾稱號" ,
	image = "" ,
}
title_definition["隐元预选帮帮主称号"] =
{
	id = 6845 ,
	note = "^ff0000【隱元宮右弼星君】" ,
	desc = "隱元預選幫幫主稱號" ,
	image = "" ,
}
title_definition["七星争霸赛帮众称号奖励"] =
{
	id = 6846 ,
	note = "^00ffff【隱元宮神將】" ,
	desc = "七星爭霸賽幫眾稱號獎勵" ,
	image = "" ,
}
title_definition["问卷调查答谢称号"] =
{
	id = 6847 ,
	note = "^00ff00【出謀劃策小能手】" ,
	desc = "問卷調查答謝稱號" ,
	image = "" ,
}
title_definition["群雄逐鹿"] =
{
	id = 9218 ,
	note = "^00ff00【群雄逐鹿】" ,
	desc = "玩家見面會答謝稱號" ,
	image = "" ,
}
title_definition["平台首次登陆奖励称号"] =
{
	id = 6848 ,
	note = "^a800ff【千秋萬載 一統江湖】" ,
	desc = "平臺首次登陸獎勵稱號" ,
	image = "" ,
}
title_definition["520活动奖励称号1"] =
{
	id = 6849 ,
	note = "^ff0000【完美秀恩愛 專情20年】" ,
	desc = "520活動獎勵稱號" ,
	image = "" ,
}
title_definition["520活动奖励称号2"] =
{
	id = 6850 ,
	note = "^ff0000【愛自綿綿長長，情以天地為證】" ,
	desc = "520活動獎勵稱號" ,
	image = "" ,
}
title_definition["百晓阁小伙伴特殊定制称号"] =
{
	id = 6851 ,
	note = "^00ff00【江湖百曉生】" ,
	desc = "百曉閣小夥伴特殊定制稱號" ,
	image = "" ,
}
title_definition["运气最佳宝宝"] =
{
	id = 6852 ,
	note = "^ff0000【運氣最佳寶寶】" ,
	desc = "運氣最佳寶寶" ,
	image = "" ,
}
title_definition["笑傲江湖ol三周年特殊称号"] =
{
	id = 6853 ,
	note = "^a800ff【不悔青春 江湖有你·三】" ,
	desc = "笑傲江湖ol三周年特殊稱號" ,
	image = "" ,
}
title_definition["笑傲江湖ol三周年荣耀归来"] =
{
	id = 6854 ,
	note = "^a800ff【榮耀歸來】" ,
	desc = "笑傲江湖ol三周年榮耀歸來" ,
	image = "" ,
}
title_definition["积分消耗奖励称号女"] =
{
	id = 6855 ,
	note = "^f06ea9【^00ffff$S^f06ea9不見兮，思之如狂】" ,
	desc = "愛要大聲秀出來！" ,
	image = "" ,
}
title_definition["积分消耗奖励称号男"] =
{
	id = 6856 ,
	note = "^f06ea9【$S^00ffff美人兮，見之不忘^f06ea9】" ,
	desc = "愛要大聲秀出來！" ,
	image = "" ,
}
title_definition["袅袅仙音称号"] =
{
	id = 6857 ,
	note = "^ff0000【天下第一歌者】" ,
	desc = "嫋嫋仙音" ,
	image = "" ,
}
title_definition["余音绕梁称号"] =
{
	id = 6858 ,
	note = "^a800ff【萬里長歌】" ,
	desc = "餘音繞梁" ,
	image = "" ,
}
title_definition["金声玉润称号"] =
{
	id = 6859 ,
	note = "^09a3e2【曼語清歌】" ,
	desc = "金聲玉潤" ,
	image = "" ,
}
title_definition["侠骨柔情称号"] =
{
	id = 6860 ,
	note = "^09a3e2【妙音蔓蔓】" ,
	desc = "俠骨柔情" ,
	image = "" ,
}
title_definition["不同凡响称号"] =
{
	id = 6861 ,
	note = "^09a3e2【雛鳳初歌】" ,
	desc = "不同凡響" ,
	image = "" ,
}
title_definition["乐视侠客"] =
{
	id = 6862 ,
	note = --[[!AUTO_295]]"^ffbc3c【樂視俠客】" ,
	desc = --[[!AUTO_296]]"來自樂視的英雄。",
	image = --[[!AUTO_297]]"",
}
title_definition["笑傲江湖ol三周年专属称号"] =
{
	id = 6863 ,
	note = "^ff0000【2016年6月28日，我還在笑傲】" ,
	desc = "笑傲江湖ol三周年專屬稱號",
	image = "",
}
title_definition["一笑倾城新服专属称号"] =
{
	id = 6864 ,
	note = "^f06ea9【微微一笑很傾城】" ,
	desc = "一笑傾城新服專屬稱號",
	image = "",
}
title_definition["2016教师节称号"] =
{
	id = 6865 ,
	note = "^09a3e2【尊師重道】" ,
	desc = "2016教師節稱號" ,
	image = "" ,
}
title_definition["时来运转"] =
{
	id = 6866 ,
	note = "^09a3e2【時來運轉】" ,
	desc = "天下第一武道會PK賽獎勵" ,
	image = "" ,
}
title_definition["全服萌萌哒"] =
{
	id = 6867 ,
	note = "^ff0000【全服萌萌噠】" ,
	desc = "男神女神投票活動第一名獎勵" ,
	image = "" ,
}
title_definition["玩家见面会拍卖称号1"] =
{
	id = 6868 ,
	note = "    ^00ffff天^8600ff高^9aff02任^ff0000火^ffd306飛^ff0000，三^8600ff兒^ffd306永^9aff02相^8600ff伴^ff0000。\r^ff0000you are the reason and i believe。" ,
	desc = "玩家見面會拍賣稱號" ,
	image = "" ,
}
title_definition["玩家见面会拍卖称号2"] =
{
	id = 6869 ,
	note = "    ^00ffff天^8600ff高^9aff02任^ff0000三^ffd306飛^00ffff，^ff0000火^8600ff哥^ffd306永^9aff02相^8600ff隨^00ffff。\r^ff0000you are the reason and i believe。" ,
	desc = "玩家見面會拍賣稱號" ,
	image = "" ,
}
title_definition["玩家见面会拍卖称号3"] =
{
	id = 6870 ,
	note = "^000000【^ffff6f萬物輪回，生生不息！萌鈴愈眾生！^000000】" ,
	desc = "玩家見面會拍賣稱號" ,
	image = "" ,
}
title_definition["玩家见面会拍卖称号4"] =
{
	id = 6871 ,
	note = "^000000【^ffff6f厲鬼勾魂，無常索命！指引黃泉路！^000000】" ,
	desc = "玩家見面會拍賣稱號" ,
	image = "" ,
}
title_definition["玩家见面会拍卖称号5"] =
{
	id = 6872 ,
	note = "^ffe153【年少春衫薄，騎馬倚斜橋，滿樓紅袖招】" ,
	desc = "玩家見面會拍賣稱號" ,
	image = "" ,
}
title_definition["2016天下第一武道会奖励1"] =
{
	id = 6873 ,
	note = "^ff0000【戰歌`^ff80002016幫派精英賽^ff0000冠軍^ff8000幫派^ff0000】" ,
	desc = "2016天下第一武道會獎勵" ,
	image = "" ,
}
title_definition["2016天下第一武道会奖励2"] =
{
	id = 6874 ,
	note = "^6f00d2【天神★之怒^ff80002016幫派精英賽^6f00d2亞軍^ff8000幫派^6f00d2】" ,
	desc = "2016天下第一武道會獎勵" ,
	image = "" ,
}
title_definition["2016天下第一武道会奖励3"] =
{
	id = 6875 ,
	note = "^00e3e3【—☆戦丶榊☆—^ff80002016幫派精英賽^00e3e3季軍^ff8000幫派^00e3e3】" ,
	desc = "2016天下第一武道會獎勵" ,
	image = "" ,
}
title_definition["2016天下第一武道会奖励4"] =
{
	id = 6876 ,
	note = "^ff8000【2016幫派精英賽入圍幫派】" ,
	desc = "2016天下第一武道會獎勵" ,
	image = "" ,
}
title_definition["玩家见面会拍卖称号6"] =
{
	id = 6878 ,
	note = "^ffff37【^00ffff貫^ff8000徹^ff0000愛^9aff02與^8600ff真^ff8000實^ff0000的^9aff02邪^8600ff惡^ffff37】" ,
	desc = "玩家見面會拍賣稱號" ,
	image = "" ,
}
title_definition["玩家见面会拍卖称号7"] =
{
	id = 6879 ,
	note = "^ffff37【^00ffff可^ff8000愛^ff0000又^9aff02迷^8600ff人^ff8000的^ff0000反^9aff02派^8600ff角^9aff02色^ffff37】" ,
	desc = "玩家見面會拍賣稱號" ,
	image = "" ,
}

title_definition["累计完成10次连连看"] =
{
	id = 6880 ,
	note = "^09a3e2【總有刁民想害朕】" ,
	desc = "累計完成10次連連看" ,
	image = "" ,
}
title_definition["累计完成50次连连看"] =
{
	id = 6881 ,
	note = "^09a3e2【來啊，互相傷害啊】" ,
	desc = "累計完成50次連連看" ,
	image = "" ,
}
title_definition["累计完成100次连连看"] =
{
	id = 6882 ,
	note = "^f06ea9【感覺身體被掏空】" ,
	desc = "累計完成100次連連看" ,
	image = "" ,
}
title_definition["累计完成300次连连看"] =
{
	id = 6883 ,
	note = "^f06ea9【汝乃天驕，何不上九霄？】" ,
	desc = "累計完成300次連連看" ,
	image = "" ,
}
title_definition["累计完成500次连连看"] =
{
	id = 6884 ,
	note = "^f06ea9【寶寶心裡苦，但是寶寶不說】" ,
	desc = "累計完成500次連連看" ,
	image = "" ,
}
title_definition["累计完成666次连连看"] =
{
	id = 6885 ,
	note = "^f06ea9【我已經使出了洪荒之力】" ,
	desc = "累計完成666次連連看" ,
	image = "" ,
}
title_definition["累计完成1000次连连看"] =
{
	id = 6886 ,
	note = "^ff0000【容我說一句在場的各位都是垃圾】" ,
	desc = "累計完成1000次連連看" ,
	image = "" ,
}
title_definition["完成戎马丹心任务"] =
{
	id = 6887 ,
	note = "^ff0000【赤子丹心】" ,
	desc = "完成戎馬丹心任務" ,
	image = "" ,
}
title_definition["完成国庆搬运物资任务"] =
{
	id = 6888 ,
	note = "^ff0000【國士無雙】" ,
	desc = "完成國慶搬運物資任務" ,
	image = "" ,
}
title_definition["问卷调研奖励称号"] =
{
	id = 6889 ,
	note = "^e76041【一大波高能問卷魔正在靠近…】" ,
	desc = "問卷調研獎勵稱號" ,
	image = "" ,
}
title_definition["2016年11月新服称号"] =
{
	id = 6890 ,
	note = "^a800ff【單身狗的獨木舟屹立不倒】" ,
	desc = "2016年11月新服稱號" ,
	image = "" ,
}
title_definition["笑傲江湖ol旺旺专属称号"] =
{
	id = 6891 ,
	note = "^f06ea9【再看我就把你喝掉】" ,
	desc = "笑傲江湖ol旺旺專屬稱號" ,
	image = "" ,
}
title_definition["天下武道会称号奖励"] =
{
	id = 6892 ,
	note = "^09a3e2【為16年天下武道會喝彩】" ,
	desc = "天下武道會稱號獎勵" ,
	image = "" ,
}
title_definition["2016年PK赛专属称号"] =
{
	id = 6893 ,
	note = "^ff0000【2016天下第一武道會個人競技賽參賽選手】" ,
	desc = "2016年天下第一武道會個人競技賽專屬稱號" ,
	image = "" ,
}
title_definition["2016年光棍节称号"] =
{
	id = 6894 ,
	note = "^f06ea9【2016年11月11日，本喵終於脫光了>O<喵~】" ,
	desc = "2016年光棍節稱號" ,
	image = "" ,
}
title_definition["见面会称号1"] =
{
	id = 6895 ,
	note = "^ff0000與^8cea00世^ff8000無^ae57a4爭^0080ff的^c4c400我^000000, ^00e3e3陳^ff8000中^ca8ec2無^ff00ff一" ,
	desc = "2016年成都見面會拍賣稱號" ,
	image = "" ,
}
title_definition["见面会称号2"] =
{
	id = 6896 ,
	note = "^ff0000隱^8cea00姓^ff8000埋^ae57a4名^0080ff的^c4c400我^000000, ^00e3e3嫣^ff8000然^ca8ec2巧^ff00ff笑" ,
	desc = "2016年成都見面會拍賣稱號" ,
	image = "" ,
}
title_definition["见面会称号3"] =
{
	id = 6897 ,
	note = "                     ^ae57a4I ^ff0000am ^ff8000your ^0080ffair\r^ae57a4你的^ff00ff溫存^ff0000讓我^ff8000無法^f9f900自拔，^8cea00我願^0080ff陪你^ff8000走過^0080ff千千^ca8ec2世界" ,
	desc = "2016年成都見面會拍賣稱號" ,
	image = "" ,
}
title_definition["见面会称号4"] =
{
	id = 6898 ,
	note = "                     ^ae57a4You ^ff0000are ^ff8000my ^0080ffsunshine\r^ae57a4你的^ff00ff依賴^ff0000讓我^ff8000無法^f9f900離開，^8cea00我願^0080ff陪你^ff8000看過^0080ff百花^ca8ec2盛開" ,
	desc = "2016年成都見面會拍賣稱號" ,
	image = "" ,
}
title_definition["见面会称号5"] =
{
	id = 6899 ,
	note = "^0080ff三^8cea00尺^ff8000青^ae57a4鋒^00e3e3守^c4c400卿^ff0000安" ,
	desc = "2016年成都見面會拍賣稱號" ,
	image = "" ,
}
title_definition["见面会称号6"] =
{
	id = 6900 ,
	note = "^0080ff蠱^8cea00若^ff8000浮^ae57a4生^00e3e3夢^c4c400亦^ff0000然" ,
	desc = "2016年成都見面會拍賣稱號" ,
	image = "" ,
}
title_definition["见面会称号7"] =
{
	id = 6901 ,
	note = "^0080ff別^8cea00為^ff8000無^ae57a4能^00e3e3找^c4c400借^ff0000口" ,
	desc = "2016年成都見面會拍賣稱號" ,
	image = "" ,
}
title_definition["见面会称号8"] =
{
	id = 6902 ,
	note = "  ^ff0000一路^ff8000拉^00e3e3風^8cea00帶^f9f900閃電\r^00e3e3A ^ca8ec2wind ^c4c400with ^0080fflightning" ,
	desc = "2016年成都見面會拍賣稱號" ,
	image = "" ,
}
title_definition["2017年2月新服称号"] =
{
	id = 6903 ,
	note = "^f06ea9【灼灼桃花十裡，取一朵放在心上，足矣】" ,
	desc = "2017年2月新服稱號" ,
	image = "" ,
}
title_definition["全服最丑"] =
{
	id = 6904 ,
	note = "^f06ea9【全服最醜】" ,
	desc = "全服最醜" ,
	image = "" ,
}
title_definition["2017年愚人节称号"] =
{
	id = 6905 ,
	note = "^f06ea9【幸運的笨蛋】" ,
	desc = "2017年愚人節稱號" ,
	image = "" ,
}
title_definition["17年见面会称号1"] =
{
	id = 6906 ,
	note = "^0080ff不^ae57a4離^8cea00不^ae57a4棄^f9f900不^0080ff是^ff0000潼顏^f9f900無^8cea00忌" ,
	desc = "2017年南京玩家見面會稱號" ,
	image = "" ,
}
title_definition["17年见面会称号2"] =
{
	id = 6907 ,
	note = "^ff0000^00ffff流^ff8000雲^ff0000千^32cd32丈^f9f900堪^ae57a4醉^ff8000臥，^00ff00是^ff0000誰^ff8000月^ae57a4下^f9f900獨^32cd32酌" ,
	desc = "2017年南京玩家見面會稱號" ,
	image = "" ,
}
title_definition["17年见面会称号3"] =
{
	id = 6908 ,
	note = "^ff0000^00ffff浮^ff8000生^ff0000誰^32cd32能^f9f900一^ae57a4笑^ff8000過，^00ff00明^ff0000滅^ff8000樓^ae57a4台^f9f900燈^32cd32火" ,
	desc = "2017年南京玩家見面會稱號" ,
	image = "" ,
}
title_definition["17年见面会称号4"] =
{
	id = 6909 ,
	note = "^ff0000I ^ff8000c^f9f900a^8cea00n ^00e3e3o^0080ffn^ae57a4l^ff0000y ^ff8000l^f9f900o^8cea00v^00e3e3e ^0080ffy^ae57a4o^ff0000u\r     ^ff8000只^f9f900許^8cea00我^00e3e3愛^0080ff你" ,
	desc = "2017年南京玩家見面會稱號" ,
	image = "" ,
}
title_definition["17年见面会称号5"] =
{
	id = 6910 ,
	note = "^00ffff^ff0000O^ff8000n^f9f900l^8cea00y ^00e3e3y^0080ffo^ae57a4u ^ff0000a^ff8000c^f9f900c^8cea00o^00e3e3m^0080ffp^ae57a4a^ff0000n^ff8000y ^f9f900m^8cea00e\r         ^00e3e3只^0080ff許^ae57a4你^ff0000陪^ff8000我" ,
	desc = "2017年南京玩家見面會稱號" ,
	image = "" ,
}
title_definition["百晓阁奖励称号1"] =
{
	id = 6911 ,
	note = "^ff0000百曉閣德藝雙馨藝術家" ,
	desc = "百曉閣最牛創作者稱號" ,
	image = "" ,
}
title_definition["百晓阁奖励称号2"] =
{
	id = 6912 ,
	note = "^09a3e2給我一點靈感，我能創作出整個宇宙" ,
	desc = "入駐百曉閣稱號" ,
	image = "" ,
}
title_definition["百晓阁奖励称号3"] =
{
	id = 6913 ,
	note = "^f06ea9百曉閣官方認證創作者" ,
	desc = "百曉閣認證作者稱號" ,
	image = "" ,
}
title_definition["五月调研尊享称号"] =
{
	id = 6914 ,
	note = "^e76041【我提建議我驕傲】" ,
	desc = "五月調研尊享稱號" ,
	image = "" ,
}
title_definition["520称号奖励"] =
{
	id = 6915 ,
	note = "^f06ea9【$S牽手相依若不離，擁抱相守亦不棄】" ,
	desc = "2017年5月20日",
	image = "",
}
title_definition["四周年称号奖励"] =
{
	id = 6916 ,
	note = "^a800ff【攜手四年 江湖有你】" ,
	desc = "笑傲江湖四周年感謝有你",
	image = "",
}
title_definition["2017年PK赛专属称号"] =
{
	id = 6917 ,
	note = "^ff0000【決戰五岳絕世高手】" ,
	desc = "決戰五岳絕世高手",
	image = "",
}
title_definition["2017年PK赛热身赛"] =
{
	id = 6918 ,
	note = "^09a3e2【為你而戰】" ,
	desc = "2017年PK賽熱身賽",
	image = "",
}
title_definition["2017年7月消费奖励称号"] =
{
	id = 6919 ,
	note = "^ff0000【錢多多】" ,
	desc = "2017年7月消費獎勵稱號",
	image = "",
}
title_definition["昆仑主线完成称号"] =
{
	id = 6920 ,
	note = "^f06ea9【玲瓏摯友】" ,
	desc = "玲瓏派掌門贈予，完成玲瓏主線任務“玲瓏出世”即可獲得",
	image = "",
}
title_definition["墨迹降温专属称号"] =
{
	id = 6921 ,
	note = "^f06ea9【天氣那么熱，不如在家玩游戲】" ,
	desc = "墨跡降溫專屬稱號",
	image = "",
}
title_definition["绝世高手观影会参与者"] =
{
	id = 6922 ,
	note = "^ff7d2f【7月8日絕世高手觀影會參與者】" ,
	desc = "絕世高手觀影會參與者",
	image = "",
}
title_definition["“玩转玲珑”称号奖励"] =
{
	id = 6923 ,
	note = "^f06ea9【玲瓏云鬢生花樣，飄搖風袖薔薇香】" ,
	desc = "“玩轉玲瓏”稱號獎勵",
	image = "",
}
title_definition["新服八荒四海专属活动称号"] =
{
	id = 6924 ,
	note = "^f06ea9【你有沒有愛過一個人】" ,
	desc = "“新服八荒四海專屬活動稱號",
	image = "",
}
title_definition["新服八荒四海专属称号"] =
{
	id = 6925 ,
	note = "^f06ea9【你有沒有恨過一個人】" ,
	desc = "“新服八荒四海專屬稱號",
	image = "",
}
title_definition["2017年七夕专属称号"] =
{
	id = 6926 ,
	note = "^f06ea9【春風十里不如你】" ,
	desc = "2017年七夕專屬稱號",
	image = "",
}
title_definition["2017年七夕副本抢亲称号"] =
{
	id = 6927 ,
	note = "^ff0000【直道相思了無益，未妨惆悵是清狂】" ,
	desc = "2017年七夕專屬稱號",
	image = "",
}
title_definition["2017年七夕佳期会称号"] =
{
	id = 6928 ,
	note = "^ff0000【佳期如夢】" ,
	desc = "2017年七夕專屬稱號",
	image = "",
}
title_definition["苹果8豪华礼包专属称号"] =
{
	id = 6929 ,
	note = "^ff0000【美在智慧，贏在實力】" ,
	desc = "蘋果8豪華禮包專屬稱號",
	image = "",
}
title_definition["2017年中秋称号"] =
{
	id = 6930 ,
	note = "^ff0000【蟾宮折桂】" ,
	desc = "2017年中秋專屬稱號",
	image = "",
}
title_definition["大R中秋称号"] =
{
	id = 6931 ,
	note = "^ff0000【中秋月·大神世界你不懂】" ,
	desc = "2017年武林盟為江湖中那些鼎鼎有名的大俠打造的專屬中秋稱號",
	image = "",
}
title_definition["中秋消耗促称号男"] =
{
	id = 6932 ,
	note = "^ffd4ff【中秋月·一見誤終身】" ,
	desc = "2017年中秋節絕版情侶彩色稱號",
	image = "",
}
title_definition["中秋消耗促称号女"] =
{
	id = 6933 ,
	note = "^ffd4ff【中秋月·一顧傾人城】" ,
	desc = "2017年中秋節絕版情侶彩色稱號",
	image = "",
}
title_definition["知音夫妻称号"] =
{
	id = 6934 ,
	note = --[[!AUTO_4]]"^f06ea9【$S的神仙眷侶】" ,
	desc = --[[!AUTO_5]]"知音任務夫妻專屬稱號" ,
	image = --[[!AUTO_6]]"",
}
title_definition["知音普通称号"] =
{
	id = 6935 ,
	note = "^ff0000【笑傲江湖，為你而來】" ,
	desc = "知音任務專屬稱號",
	image = "",
}
title_definition["令狐冲求爱好感度1"] =
{
	id = 6936,
	note = "^a800ff【令狐沖的唯一】" ,
	desc = "",
	image = "",
}
title_definition["2017年10月资料片全民杀鸡称号"] =
{
	id = 6937 ,
	note = "^ff0000【一毛不拔鐵公雞】" ,
	desc = "2017年10月資料片全民殺雞活動專屬稱號",
	image = "",
}
title_definition["2017年PK赛冠军队称号"] =
{
	id = 6938 ,
	note = "^ff0000【決戰五岳戰隊賽冠軍成員】" ,
	desc = "2017年PK賽冠軍隊稱號",
	image = "",
}
title_definition["2017年PK赛亚军队称号"] =
{
	id = 6939 ,
	note = "^ff0000【決戰五岳戰隊賽亞軍成員】" ,
	desc = "2017年PK賽亞軍隊稱號",
	image = "",
}
title_definition["2017年PK赛季军队称号"] =
{
	id = 6940 ,
	note = "^ff0000【決戰五岳戰隊賽季軍成員】" ,
	desc = "2017年PK賽季軍隊稱號",
	image = "",
}
title_definition["2017年PK赛六强队称号"] =
{
	id = 6941 ,
	note = "^a800ff【決戰五岳六強戰隊成員】" ,
	desc = "2017年PK賽六強隊稱號",
	image = "",
}
title_definition["见面会定制称号1"] =
{
	id = 6942 ,
	note = "^000000^74fac7全服最^ffbc01‘俏皮可愛^000000●^6eb3ff美艷動人’^ffff19☆^ff0000小公主^ffff19☆" ,
	desc = "見面會定制稱號",
	image = "",
}
title_definition["见面会定制称号2"] =
{
	id = 6943 ,
	note = "^000000^ff0000一生^ffbc01愛^6eb3ff菲^000000，^ff0000一世^1cc001相^ab77f3伴" ,
	desc = "見面會定制稱號",
	image = "",
}
title_definition["见面会定制称号3"] =
{
	id = 6944 ,
	note = "^000000^ff0000I^ffbc01'^ffff01l^00ff01l ^000000b^6eb3ffe ^ab77f3t^ff0000h^ffbc01e^ffff01r^00ff01e ^000000f^6eb3ffo^ab77f3r ^ff0000y^ffbc01o^ffff01u\r   ^ff0000我^ffbc01會^000000在^00ff01你^6eb3ff身^ab77f3邊" ,
	desc = "見面會定制稱號",
	image = "",
}
title_definition["见面会定制称号4"] =
{
	id = 6945 ,
	note = "^000000^ff0000如^ffbc01若^6eb3ff愛^6d3983我，^ff0000永^1cc001遠^e57c00為^ff8fff期" ,
	desc = "見面會定制稱號",
	image = "",
}
title_definition["见面会定制称号5"] =
{
	id = 6946 ,
	note = "^000000^ff0000如^ffbc01若^6eb3ff有^6d3983你，^ff0000一^1cc001生^e57c00何^ff8fff求" ,
	desc = "見面會定制稱號",
	image = "",
}
title_definition["2017年11月新服专属称号"] =
{
	id = 6947 ,
	note = "^ff0000【日出東方 唯我不敗】" ,
	desc = "2017年日出東方新服專屬稱號",
	image = "",
}
title_definition["放肆爱·男"] =
{
	id = 6948 ,
	note = "^09a3e2【小姐姐，朋友圈互关一个呗】" ,
	desc = "放肆爱·男",
	image = "",
}
title_definition["放肆爱·女"] =
{
	id = 6949 ,
	note = "^f06ea9【小哥哥，朋友圈互关一个呗】" ,
	desc = "放肆爱·女",
	image = "",
}
title_definition["2017圣诞节小雪任务"] =
{
	id = 6950 ,
	note = "^f06ea9「凌＊欺霜」" ,
	desc = "曾经洒下过雪花的人" ,
	image = "" ,
}
title_definition["12月年末调研大礼包"] =
{
	id = 6951 ,
	note = "^ff7d2f【江湖全才】" ,
	desc = "12月年末调研奖励" ,
	image = "" ,
}
title_definition["2018跨年专属1"] =
{
	id = 6952 ,
	note = "^ff0000【2018年的第一秒我们在一起】" ,
	desc = "2017~2018跨年专属",
	image = "",
}
title_definition["2018跨年专属2"] =
{
	id = 6953 ,
	note = "^ff0000【2018年，让我吃次鸡】" ,
	desc = "2017~2018跨年专属",
	image = "",
}
title_definition["2018跨年专属3"] =
{
	id = 6954 ,
	note = "^ff0000【2018年，对我好一点】" ,
	desc = "2017~2018跨年专属",
	image = "",
}
title_definition["2018年PK赛专属称号"] =
{
	id = 6955 ,
	note = "^ff0000【2018年门派PK赛选手】" ,
	desc = "2018年门派PK赛选手" ,
	image = "" ,
}
title_definition["2017江湖年度风云人物"] =
{
	id = 6956 ,
	note = "^ff0000【2017江湖年度风云人物】" ,
	desc = "2017江湖年度风云人物" ,
	image = "" ,
}
title_definition["2018年2月新服专属称号"] =
{
	id = 6957 ,
	note = "^ff0000【披荆斩棘·为你而来】" ,
	desc = "2018年2月新服专属称号" ,
	image = "" ,
}
title_definition["2018年3月新服专属称号"] =
{
	id = 6958 ,
	note = "^ff0000【江湖缘·问鼎江湖】" ,
	desc = "2018年3月新服专属称号" ,
	image = "" ,
}
title_definition["2018年元宵节消费奖励称号（男）"] =
{
	id = 6959 ,
	note = "^f06ea9【元宵月·一花盛开一世界】" ,
	desc = "2018年元宵节消费奖励称号（男）" ,
	image = "" ,
}
title_definition["2018年元宵节消费奖励称号（女）"] =
{
	id = 6960 ,
	note = "^f06ea9【元宵月·一生相思为一人】" ,
	desc = "2018年元宵节消费奖励称号（女）" ,
	image = "" ,
}
title_definition["2018年3月活跃度活动称号"] =
{
	id = 6961 ,
	note = "^f06ea9【就享不一样】" ,
	desc = "2018年3月活跃度活动称号" ,
	image = "" ,
}
title_definition["2018年4月清明节专属称号"] =
{
	id = 6962 ,
	note = "^f06ea9【春城无处不飞花，寒食东风御柳斜】" ,
	desc = "2018年4月清明节专属称号" ,
	image = "" ,
}
title_definition["2018年4月清明节专属称号1"] =
{
	id = 6963 ,
	note = "^f06ea9【春之祭司】" ,
	desc = "2018年4月清明节专属称号" ,
	image = "" ,
}
title_definition["快手侠客"] =
{
	id = 6964 ,
	note = --[[!AUTO_292]]"^ffbc3c【笑傲江湖快手侠客】" ,
	desc = --[[!AUTO_293]]"来自快手的英雄。",
	image = --[[!AUTO_294]]"",
}
title_definition["抖音选手"] =
{
	id = 6965 ,
	note = --[[!AUTO_292]]"^ffbc3c【笑傲江湖抖音选手】" ,
	desc = --[[!AUTO_293]]"来自抖音的英雄。",
	image = --[[!AUTO_294]]"",
}
title_definition["18年4月定制称号1"] =
{
	id = 6966 ,
	note = "^000000^000000                             【^ff0000火^84c1ff若^9999cc御^ffd306风 ^ff0000龍^84c1ff之^9999cc必^ffd306腾^000000】\r^ffc1e0A ^0080ffstrong ^dcb5ffman ^53ff53can ^ffa042save ^ff00ffhimself^aaaaff, ^00ffffa ^dcb5ffgreat ^ff8000man ^53ff53can ^ffaf60save ^0080ffanother" ,
	desc = "见面会定制称号",
	image = "",
}
title_definition["18年4月定制称号2"] =
{
	id = 6967 ,
	note = "^000000^000000                        【^9999cc只^ffcbb3雯^84c1ff其^ffd306花 ^9999cc未^ffcbb3雯^84c1ff其^ffd306名^000000】\r^ffc1e0Life ^dcb5ffmay ^0080ffbe ^ffd306have ^ff8000regret^aaaaff, ^00ffffbut ^7d7dffthe ^acd6fffuture ^ff8000can ^53ff53still ^ca8effbe ^ffaad5better" ,
	desc = "见面会定制称号",
	image = "",
}
title_definition["18年4月定制称号3"] =
{
	id = 6968 ,
	note = "^000000^ff0000确^ffaf60认^ffff37过^00bb00眼^004b97神^00ffff，^6f00d2我^ff0000遇^ffaf60上^ffff37对^00bb00的^004b97人^00ffff。" ,
	desc = "见面会定制称号",
	image = "",
}
title_definition["18年4月定制称号4"] =
{
	id = 6969 ,
	note = "^000000^ff0000太^ffaf60阳^ffff37当^00bb00空^004b97照^00ffff，^6f00d2花^ff0000儿^ffaf60对^ffff37我^00bb00笑^000000。" ,
	desc = "见面会定制称号",
	image = "",
}
title_definition["18年4月定制称号5"] =
{
	id = 6970 ,
	note = "^000000^ff0000再^ffaf60霸^ffff37气^00bb00也^004b97会^00ffff被^6f00d2她^ff0000稚^ffaf60气^ffff37折^00bb00服" ,
	desc = "见面会定制称号",
	image = "",
}
title_definition["18年4月定制称号6"] =
{
	id = 6971 ,
	note = "^000000^ff0000再^ffaf60闹^ffff37腾^00bb00也^004b97会^00ffff被^6f00d2他^ff0000拥^ffaf60抱^ffff37停^00bb00下" ,
	desc = "见面会定制称号",
	image = "",
}
title_definition["18年4月定制称号7"] =
{
	id = 6972 ,
	note = "^000000^ff0000C^ffaf60u^00ec00t^00ffffe ^000000c^004b97h^ff0000a^ffaf60r^00ec00m^000000i^00ffffn^6f00d2g ^ff0000v^ffaf60i^00ec00l^000000l^00ffffa^6f00d2i^ff0000n ^ffaf60r^00ec00o^00ffffl^ff0000e\r  ^00ec00可^ffaf60爱^ff0000又^00ec00迷^000000人^00ffff的^6f00d2反^ff0000派^ffaf60角^00ffff色" ,
	desc = "见面会定制称号",
	image = "",
}
title_definition["18年4月定制称号8"] =
{
	id = 6973 ,
	note = "^000000^ff0000光^ffaf60光^00ec00光^ffff37光^00bb00光^00ffff光^004b97光^6f00d2光^d26900光^000000光^a5a552光^ff0080光^bb5e00光^00e3e3光^ffd1a4光^ffa042光^ae57a4光^408080光^6c3365光^5cadad光" ,
	desc = "见面会定制称号",
	image = "",
}
title_definition["18年4月定制称号9"] =
{
	id = 6974 ,
	note = "^000000^ff0000        你^ffaf60对^ffff37力^00bb00量^004b97一^00ffff无^6f00d2所^ff0000知\r^ff0000You ^ffaf60know ^ffff37nothing ^00bb00about ^00ffffpower" ,
	desc = "见面会定制称号",
	image = "",
}
title_definition["18年4月定制称号10"] =
{
	id = 6975 ,
	note = "^000000^ff0000怪^ffaf60兽^6f00d2别^ffff37跑^ff0000！^00ffffbiu^00bb00biu" ,
	desc = "见面会定制称号",
	image = "",
}
title_definition["18年4月定制称号11"] =
{
	id = 6976 ,
	note = "^000000^6f00d2媳^00ffff妇^ff0000别^00bb00闹^004b97！^ffaf60pia^ff0000pia" ,
	desc = "见面会定制称号",
	image = "",
}
title_definition["18年4月定制称号12"] =
{
	id = 6977 ,
	note = "^000000^ff0000玲^ffaf60珑^ffff37骰^00bb00子^00ffff安^004b97红^6f00d2豆^000000，^ff0000入^ffaf60骨^ffff37相^00bb00思^00ffff知^004b97不^6f00d2知^000000。" ,
	desc = "见面会定制称号",
	image = "",
}
title_definition["葬魂崖战场试玩赛季第一名"] =
{
	id = 6978 ,
	note = "^ffff37【冠军】葬魂崖开拓达人" ,
	desc = "葬魂崖战场试玩赛季第一名",
	image = "",
}
title_definition["葬魂崖战场试玩赛季第二名"] =
{
	id = 6979 ,
	note = "^a800ff【亚军】葬魂崖开拓名仕" ,
	desc = "葬魂崖战场试玩赛季第二名",
	image = "",
}
title_definition["葬魂崖战场试玩赛季第三名"] =
{
	id = 6980 ,
	note = "^004b97【季军】葬魂崖开拓良将" ,
	desc = "葬魂崖战场试玩赛季第三名",
	image = "",
}
title_definition["葬魂崖战场试玩赛季参与称号"] =
{
	id = 6981 ,
	note = "^00ffff葬魂崖开拓先锋" ,
	desc = "葬魂崖战场试玩赛季参与奖",
	image = "",
}
title_definition["葬魂崖战场赛季第一名"] =
{
	id = 6982 ,
	note = "^ffff37【冠军】葬魂崖开拓达人" ,
	desc = "葬魂崖战场赛季第一名",
	image = "",
}
title_definition["葬魂崖战场赛季第二名"] =
{
	id = 6983 ,
	note = "^a800ff【亚军】葬魂崖开拓名仕" ,
	desc = "葬魂崖战场赛季第二名",
	image = "",
}
title_definition["葬魂崖战场赛季第三名"] =
{
	id = 6984 ,
	note = "^004b97【季军】葬魂崖开拓良将" ,
	desc = "葬魂崖战场赛季第三名",
	image = "",
}
title_definition["葬魂崖战场赛季参与称号"] =
{
	id = 6985 ,
	note = "^00ffff葬魂崖开拓先锋" ,
	desc = "葬魂崖战场赛季参与奖",
	image = "",
}
title_definition["2018决战五岳选手称号"] =
{
	id = 6986 ,
	note = "^ff0000【2018决战五岳战队赛选手】" ,
	desc = "2018决战五岳选手称号",
	image = "XAJH\\战场相关\\竞技2（普通）.tga",
}