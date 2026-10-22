--[[#tag push auto]]

---This script is coded in UTF-8. Be careful saving it!
---Yong Ultraedit ling cun shi yao xuan UTF-8 bianma!!!

----------------笑傲江湖客户端文本配置----------------
----------------XA Client Text Display----------------

---------------------通用色彩配置---------------------
----------------General Color Setting-----------------
--常用色彩 General Color
GAME_UI_ALPAH_FULL = 255
GAME_UI_ALPAH_HALF = 150
GAME_UI_ALPAH_ZERO = 0
GAME_UI_COLOR = {}
	--通用测试用颜色

GAME_UI_COLOR["标白"] = {str = --[[!AUTO_1]]"^ffffff", ired = 255 , igreen = 255 , iblue = 255}
GAME_UI_COLOR["标黑"] = {str = --[[!AUTO_2]]"^000000", ired = 0 , igreen = 0 , iblue = 0}
GAME_UI_COLOR["标灰"] = {str = --[[!AUTO_3]]"^a0a0a0", ired = 160 , igreen = 160 , iblue = 160}
GAME_UI_COLOR["标黄"] = {str = --[[!AUTO_4]]"^ffd200", ired = 255 , igreen = 210 , iblue = 0}
GAME_UI_COLOR["标绿"] = {str = --[[!AUTO_5]]"^33cc33", ired = 51 , igreen = 204 , iblue = 51}
	--战斗描述用文字

GAME_UI_COLOR["战白"] = {str = --[[!AUTO_6]]"^d0d0d0", ired = 176 , igreen = 176 , iblue = 176}
GAME_UI_COLOR["战黄"] = {str = --[[!AUTO_7]]"^c0a020", ired = 221 , igreen = 177 , iblue = 0}
GAME_UI_COLOR["战红"] = {str = --[[!AUTO_8]]"^c06060", ired = 204 , igreen = 51 , iblue = 51}
------------------------------------------------------

---------------------战斗信息配置---------------------
------------------Combat_Msg_Setting------------------
COMBAT_TIP_DAMAGE		= --[[!AUTO_9]]"%s%s%s对%s造成了%d点%s"	--颜色、主动方、技能、被动方、伤害值、伤害说法

COMBAT_TIP_IMMUNE		= --[[!AUTO_10]]"%s%s%s被%s完全免疫了"	--颜色、主动方、技能、被动方
COMBAT_TIP_MISS			= --[[!AUTO_11]]"%s%s%s被%s闪掉了"		--颜色、主动方、技能、被动方
COMBAT_TIP_HEAL			= --[[!AUTO_12]]"%s%s回复了%d点%s"		--颜色、主动方、回复值、回复说法

COMBAT_TIP_STATES		= --[[!AUTO_13]]"%s%s受到了%s的影响"		--颜色、主体、状态名
COMBAT_TIP_SELF			= --[[!AUTO_14]]"你"
COMBAT_TIP_NOTSKILL1		= --[[!AUTO_15]]""
COMBAT_TIP_NOTSKILL2		= --[[!AUTO_16]]"的攻击"
COMBAT_TIP_SKILL		= --[[!AUTO_17]]"的%s"
COMBAT_TIP_DAMAGE_NORMAL	= --[[!AUTO_18]]"伤害"
COMBAT_TIP_DAMAGE_CRITIC	= --[[!AUTO_19]]"致命一击"
COMBAT_TIP_DAMAGE_ABSORB	= --[[!AUTO_20]]"(吸收)"
--COMBAT_TIP_DAMAGE_OUTER		= "外功伤害"
--COMBAT_TIP_DAMAGE_INNER		= "内功伤害"
COMBAT_TIP_HEAL_HP		= --[[!AUTO_21]]"气血"
--COMBAT_TIP_HEAL_MP0		= "内力值"
COMBAT_TIP_DAMAGE_HUIXIN	= --[[!AUTO_22]]"(会心一击)"
COMBAT_TIP_DAMAGE_DIYU		= --[[!AUTO_23]]"(抵御)"
------------------------------------------------------

---------------------职业名称配置---------------------
-------------------Prof_Name_Setting------------------
GAME_PROF_TYPE = {}
GAME_PROF_TYPE[1] = --[[!AUTO_24]]"新手"
GAME_PROF_TYPE[2] = --[[!AUTO_25]]"少林"
GAME_PROF_TYPE[3] = --[[!AUTO_26]]"武当"
GAME_PROF_TYPE[4] = --[[!AUTO_27]]"华山"
GAME_PROF_TYPE[5] = --[[!AUTO_28]]"恒山"
GAME_PROF_TYPE[6] = --[[!AUTO_29]]"衡山"
GAME_PROF_TYPE[7] = --[[!AUTO_30]]"日月"
GAME_PROF_TYPE[8] = --[[!AUTO_31]]"五仙"
GAME_PROF_TYPE[9] = --[[!AUTO_32]]"逍遥"
GAME_PROF_TYPE[10] = --[[!AUTO_33]]"唐门"
GAME_PROF_TYPE[11] = --[[!AUTO_34]]"恒山"
GAME_PROF_TYPE_NULL = --[[!AUTO_35]]"未知"
------------------------------------------------------

---------------------副本自定义文字---------------------
--------------------InstanceCumtomize-------------------
LIANSHOU_TEXT_TITLE = --[[!AUTO_36]]"前进路线选择"
LIANSHOU_TEXT_LEFT = --[[!AUTO_37]]"后方偷袭"
LIANSHOU_TEXT_RIGHT = --[[!AUTO_38]]"迎难而上"
------------------------------------------------------

------------------物品掉落文字配置--------------------
-----------------Item Drop Configs--------------------
ITEM_DROP_MESSAGE_SELF = --[[!AUTO_39]]"你"
ITEM_DROP_MESSAGE_COUNT = --[[!AUTO_40]]"个"
ITEM_DROP_MESSAGE_DEFAULT = --[[!AUTO_41]]"%s获得了%s%s%s"		--通常情况
ITEM_DROP_MESSAGE_BUY = --[[!AUTO_42]]"%s购买了%s%s%s"			--通常情况
ITEM_DROP_MESSAGE_SELL = --[[!AUTO_43]]"%s卖掉了%s%s%s"			--通常情况
ITEM_DROP_MESSAGE_BUYBACK = --[[!AUTO_44]]"%s回购了%s%s%s"		--通常情况
ITEM_DROP_MESSAGE_GETBACK = --[[!AUTO_45]]"%s返还了%s%s%s"		--通常情况
ITEM_DROP_MESSAGE_GEMBIND = --[[!AUTO_45]]"恭喜%s在绑定宝石时鸿运当头，额外获得了%s%s%s"		--通常情况
------------------------------------------------------
ITEM_DROP_MESSAGE_COMMON = {}				--只支持7项，不能添加
ITEM_DROP_MESSAGE_COMMON[1] = --[[!AUTO_46]]"%s采集到了%s%s%s"
ITEM_DROP_MESSAGE_COMMON[2] = --[[!AUTO_47]]"%s探索了%s%s%s"
ITEM_DROP_MESSAGE_COMMON[3] = --[[!AUTO_48]]"%s发现了%s%s%s"
ITEM_DROP_MESSAGE_COMMON[4] = --[[!AUTO_49]]"%s找到了%s%s%s"
ITEM_DROP_MESSAGE_COMMON[5] = --[[!AUTO_50]]"%s做到了%s%s%s"
ITEM_DROP_MESSAGE_COMMON[6] = --[[!AUTO_51]]"%s达成了%s%s%s"
ITEM_DROP_MESSAGE_COMMON[7] = --[[!AUTO_52]]"%s完成了%s%s%s"
ITEM_DROP_MESSAGE_TARGET = --[[!AUTO_53]]"任务目标已达成"			--为8的情况

ITEM_DROP_MESSAGE_HIDDEN = --[[!AUTO_54]]""				--为9的情况

-----------------Item Lose Configs--------------------
ITEM_LOSE_MESSAGE_COUNT = --[[!AUTO_55]]"个"
ITEM_LOSE_MESSAGE_DEFAULT = --[[!AUTO_56]]"使用了%s%s%s"		--通常情况
------------------------------------------------------
ITEM_LOSE_MESSAGE_TEXT = {}
ITEM_LOSE_MESSAGE_TEXT[1] = --[[!AUTO_57]]"交出了%s%s%s"			--任务
ITEM_LOSE_MESSAGE_TEXT[2] = --[[!AUTO_58]]""				--"出售掉了%s%s%s"		--npc出售
ITEM_LOSE_MESSAGE_TEXT[3] = --[[!AUTO_59]]"花费掉了%s%s%s"		--npc购买
ITEM_LOSE_MESSAGE_TEXT[4] = --[[!AUTO_60]]""				--玩家交易
ITEM_LOSE_MESSAGE_TEXT[5] = --[[!AUTO_61]]""				--摆摊
ITEM_LOSE_MESSAGE_TEXT[6] = --[[!AUTO_62]]"由于重伤昏迷，丢失了%s%s%s"	--死亡掉落
ITEM_LOSE_MESSAGE_TEXT[7] = --[[!AUTO_63]]""				--主动使用
ITEM_LOSE_MESSAGE_TEXT[8] = --[[!AUTO_64]]""				--邮件
ITEM_LOSE_MESSAGE_TEXT[9] = --[[!AUTO_65]]""				--生产消耗

ITEM_LOSE_MESSAGE_TEXT[10] = --[[!AUTO_66]]"销毁掉了%s%s%s"		--销毁

ITEM_LOSE_MESSAGE_TEXT[11] = --[[!AUTO_67]]""				--采集消耗

ITEM_LOSE_MESSAGE_TEXT[12] = --[[!AUTO_68]]"%s%s%s已经过期了"		--过期
ITEM_LOSE_MESSAGE_TEXT[13] = --[[!AUTO_69]]"%s%s%s消失了"			--自动删除
ITEM_LOSE_MESSAGE_TEXT[35] = --[[!AUTO_70]]"提交了%s%s%s"			--上交消息
ITEM_LOSE_MESSAGE_TEXT[41] = --[[!AUTO_71]]"交出了%s%s%s"			--任务按类型删除物品
ITEM_LOSE_MESSAGE_TEXT[43] = --[[!AUTO_72]]"%s掉落在了%s"			--离场景自动掉落
ITEM_LOSE_MESSAGE_TEXT[52] = --[[!AUTO_1212]]"延时销毁了%s%s%s^ff6666（为了保证安全道具可以在时限内从包裹中恢复）"	--延时销毁珍异道具
ITEM_LOSE_MESSAGE_HIDDEN = --[[!AUTO_73]]""				--为9的情况

ITEM_LOSE_MESSAGE_PET = --[[!AUTO_74]]"遣散了%s%s%s"	--宠物用


-----------------------任务相关获失信息------------------------
ITEM_DROP_MESSAGE_TASK = {}
ITEM_LOSE_MESSAGE_TASK = {}
---------=--------------1任务物品开始--------------------------
ITEM_DROP_MESSAGE_TASK[2959] = --[[!AUTO_75]]"成功的用绿叶把熏衣草包了起来"
ITEM_DROP_MESSAGE_TASK[2960] = --[[!AUTO_76]]"从陈七处打听到了附近的情况"
ITEM_DROP_MESSAGE_TASK[2961] = --[[!AUTO_77]]"从白二处打听到了镖局的情况"
ITEM_DROP_MESSAGE_TASK[2962] = --[[!AUTO_78]]"从镖手处打听到了镖队的情况"
ITEM_DROP_MESSAGE_TASK[3582] = --[[!AUTO_79]]"捉住了一只穿山甲"
ITEM_DROP_MESSAGE_TASK[3606] = --[[!AUTO_80]]"从岩石下挖出了火药"
ITEM_DROP_MESSAGE_TASK[3668] = --[[!AUTO_81]]"低沉悠扬的钟声响彻山野"
ITEM_DROP_MESSAGE_TASK[4692] = --[[!AUTO_82]]"鸽子带着书信展翅飞走了"
ITEM_DROP_MESSAGE_TASK[4780] = --[[!AUTO_83]]"神秘的草药被投入了水井中"
ITEM_DROP_MESSAGE_TASK[4798] = --[[!AUTO_84]]"挖了一个大坑,将巨蛇的尸首埋了起来"
ITEM_DROP_MESSAGE_TASK[4804] = --[[!AUTO_85]]"点燃的香烛升起了袅袅青烟"
ITEM_DROP_MESSAGE_TASK[4830] = --[[!AUTO_86]]"将鱼儿放入池中，它们自由自在地游去了"
ITEM_DROP_MESSAGE_TASK[5621] = --[[!AUTO_87]]"饮尽了盏中的茶"
ITEM_DROP_MESSAGE_TASK[5685] = --[[!AUTO_88]]"落雪仙看到妻子的遗物，变得癫狂起来了"
ITEM_DROP_MESSAGE_TASK[6063] = --[[!AUTO_89]]"佛珠散落了一地，你捡起其中一颗，乌黑如墨，仿佛无名的无声控诉。"
ITEM_DROP_MESSAGE_TASK[6216] = --[[!AUTO_90]]"点燃了华景的医书"
ITEM_DROP_MESSAGE_TASK[6219] = --[[!AUTO_91]]"舀起了一瓢水"
ITEM_DROP_MESSAGE_TASK[6920] = --[[!AUTO_92]]"发现了眉月记号"
ITEM_DROP_MESSAGE_TASK[6921] = --[[!AUTO_93]]"发现了弦月记号"
ITEM_DROP_MESSAGE_TASK[6922] = --[[!AUTO_94]]"发现了满月记号"
ITEM_DROP_MESSAGE_TASK[6923] = --[[!AUTO_95]]"疗伤成功了"
ITEM_DROP_MESSAGE_TASK[7002] = --[[!AUTO_96]]"对牛肉汤下药"
ITEM_DROP_MESSAGE_TASK[8350] = --[[!AUTO_97]]"还愿成功"
ITEM_DROP_MESSAGE_TASK[8385] = --[[!AUTO_98]]"将一桶水灌入了煮竹子的大缸中"
ITEM_DROP_MESSAGE_TASK[8417] = --[[!AUTO_99]]"火头工将蝉翼纸小心翼翼的展开给你看"
ITEM_DROP_MESSAGE_TASK[8618] = --[[!AUTO_100]]"将静心散给疯狂的铸剑师服用"
ITEM_DROP_MESSAGE_TASK[9002] = --[[!AUTO_101]]"两处云纹相合了"
ITEM_DROP_MESSAGE_TASK[9006] = --[[!AUTO_102]]"为庭前枯木灌溉了清冽井水"
ITEM_DROP_MESSAGE_TASK[9236] = --[[!AUTO_103]]"将药膏给胡通海闻了闻"
ITEM_DROP_MESSAGE_TASK[9241] = --[[!AUTO_104]]"你仔细地阅读起神秘大侠的信"
ITEM_DROP_MESSAGE_TASK[10210] = --[[!AUTO_105]]"你将静心散送入疯魔铸剑师口中服下"
ITEM_DROP_MESSAGE_TASK[10612] = --[[!AUTO_106]]"你缓缓的掀起了新娘的盖头……"
ITEM_DROP_MESSAGE_TASK[10691] = --[[!AUTO_107]]"扑香蝶舞，一路逐暗香而去，直至刺客所在。"
ITEM_DROP_MESSAGE_TASK[10996] = --[[!AUTO_108]]"一头白额虎大吼一声，朝你缓缓走来。"
ITEM_DROP_MESSAGE_TASK[11251] = --[[!AUTO_109]]"挖开地面，发现一个陈旧的锦盒。"
ITEM_DROP_MESSAGE_TASK[11252] = --[[!AUTO_110]]"两片地图完美地拼合在一起。"
ITEM_DROP_MESSAGE_TASK[11672] = --[[!AUTO_111]]"成功地捉住了一只山鸡。"
ITEM_DROP_MESSAGE_TASK[11673] = --[[!AUTO_112]]"用新木头替掉了已经腐朽的木桩子。"
ITEM_DROP_MESSAGE_TASK[11674] = --[[!AUTO_113]]"拿起来仔细查看，书信有些发潮。"
ITEM_DROP_MESSAGE_TASK[22072] = --[[!AUTO_114]]"熊熊大火燃烧起来"
ITEM_DROP_MESSAGE_TASK[26776] = --[[!AUTO_115]]"周大婶把香气扑鼻的烤全鸡包好递给了你"
ITEM_DROP_MESSAGE_TASK[28825] = --[[!AUTO_116]]"散发着淡金光泽的逼真铜雀，一看就知年代久远价值连城。"
ITEM_DROP_MESSAGE_TASK[28826] = --[[!AUTO_117]]"你手法娴熟，眨眼间已将日月古玉偷梁换柱了。"
ITEM_LOSE_MESSAGE_TASK[2965] = --[[!AUTO_118]]"把报告信交给了镖头"
ITEM_LOSE_MESSAGE_TASK[3586] = --[[!AUTO_119]]"用钥匙打开了锁住书生的镣铐"
ITEM_LOSE_MESSAGE_TASK[3588] = --[[!AUTO_120]]"白莲使者看了看你手中损坏的梅寨令牌"
ITEM_LOSE_MESSAGE_TASK[3589] = --[[!AUTO_121]]"宁账房把你带来的梅寨通行令收入怀中"
ITEM_LOSE_MESSAGE_TASK[3590] = --[[!AUTO_122]]"把赵俊彩给的十文钱交给了水果摊老板"
ITEM_LOSE_MESSAGE_TASK[3606] = --[[!AUTO_123]]"将火药完好地交给了青莲使者"
ITEM_LOSE_MESSAGE_TASK[3668] = --[[!AUTO_124]]"钟声久久回荡在山间"
ITEM_LOSE_MESSAGE_TASK[3671] = --[[!AUTO_125]]"小敏接过红叶，定定的看了看"
ITEM_LOSE_MESSAGE_TASK[3682] = --[[!AUTO_126]]"将新鲜的水果递了过去"
ITEM_LOSE_MESSAGE_TASK[3837] = --[[!AUTO_127]]"把习字簿残页让水果摊老板看了看"
ITEM_LOSE_MESSAGE_TASK[4692] = --[[!AUTO_128]]"书信成功地送出了"
ITEM_LOSE_MESSAGE_TASK[4780] = --[[!AUTO_129]]"刘淮南眼中透出疯狂的神色，得意地笑了起来"
ITEM_LOSE_MESSAGE_TASK[4804] = --[[!AUTO_130]]"林夫人盲了的双目留下泪来"
ITEM_LOSE_MESSAGE_TASK[5265] = --[[!AUTO_131]]"陆青儿翻看着湿透的茶经"
ITEM_LOSE_MESSAGE_TASK[5434] = --[[!AUTO_132]]"向苏莉珍出示了黑木令"
ITEM_LOSE_MESSAGE_TASK[5685] = --[[!AUTO_133]]"落雪仙哭着呼喊妻子的名字，声音凄厉"
ITEM_LOSE_MESSAGE_TASK[6216] = --[[!AUTO_134]]"华景怅然地望向了远方"
ITEM_LOSE_MESSAGE_TASK[6219] = --[[!AUTO_135]]"把水倒进了鱼篓里"
ITEM_LOSE_MESSAGE_TASK[8941] = --[[!AUTO_136]]"向刀小梅出示了漆黑的木制令牌"
ITEM_LOSE_MESSAGE_TASK[9002] = --[[!AUTO_137]]"山庄的密道被开启了"
ITEM_LOSE_MESSAGE_TASK[9006] = --[[!AUTO_138]]"水迅速渗进了干涸的泥土里"
ITEM_LOSE_MESSAGE_TASK[9236] = --[[!AUTO_139]]"把剩下的整盒药膏送给了胡通海"
ITEM_LOSE_MESSAGE_TASK[9241] = --[[!AUTO_140]]"信中提到朱仙镇仙人庄崖下，不妨去看看"
ITEM_LOSE_MESSAGE_TASK[10531] = --[[!AUTO_141]]"将闪亮的铁球交给了高首."
ITEM_LOSE_MESSAGE_TASK[10612] = --[[!AUTO_142]]"发现新娘奇丑无比……"
ITEM_LOSE_MESSAGE_TASK[11251] = --[[!AUTO_143]]"熊风云激动地打开盒子，愣了愣，拿出一张精心折叠好的信纸。"
ITEM_LOSE_MESSAGE_TASK[11252] = --[[!AUTO_144]]"熊风云认真地查看了一遍地图。"
ITEM_LOSE_MESSAGE_TASK[12150] = --[[!AUTO_145]]"将红玉镯拿出给老板娘看了看"
ITEM_LOSE_MESSAGE_TASK[12555] = --[[!AUTO_146]]"为天成轩老先生倒上了一碗香茶"
ITEM_LOSE_MESSAGE_TASK[16332] = --[[!AUTO_147]]"服下解药后,流氓的脸色有了一些红润"
ITEM_LOSE_MESSAGE_TASK[22072] = --[[!AUTO_148]]"大家纷纷击掌相庆！"
ITEM_LOSE_MESSAGE_TASK[26775] = --[[!AUTO_149]]"腺体的奇异色彩吸引了风摇筝的目光，但她立刻把眼神移开，摆出了不屑一顾的神态……"
ITEM_LOSE_MESSAGE_TASK[26776] = --[[!AUTO_150]]"拿出烤鸡，道长的鼻翼似乎也抽动了一下 "
ITEM_LOSE_MESSAGE_TASK[28825] = --[[!AUTO_151]]"你悄悄抬眼看杨莲亭，见他目如弯月嘴角上挑，喜爱之情难以抑制。"
ITEM_LOSE_MESSAGE_TASK[28826] = --[[!AUTO_152]]"杨莲亭正满面春风洋洋得意，似乎并未发现古玉已被掉包。"
ITEM_LOSE_MESSAGE_TASK[76178] = --[[!AUTO_153]]"对尸体洒下连环断肠散"

---------=--------------1任务物品结束--------------------------
---------=-----------2任务物品产生器结束-----------------------
ITEM_DROP_MESSAGE_TASK[4436] = --[[!AUTO_154]]"得到了一个水桶"
ITEM_DROP_MESSAGE_TASK[12554] = --[[!AUTO_155]]"从桌案上取走了一只茶壶，快去为天成老先生奉上香茶吧"
ITEM_DROP_MESSAGE_TASK[28824] = --[[!AUTO_156]]"朴拙莹润的华美光泽静静流转在珠玉周身，映衬得包裹其间的日月徽记更加炫彩夺目。"
ITEM_LOSE_MESSAGE_TASK[4436] = --[[!AUTO_157]]"把水桶交给了伙计"
ITEM_LOSE_MESSAGE_TASK[10697] = --[[!AUTO_158]]"胡琴声起，夜雨潇湘，琴声凄凉。雨落竹叶，如泣如诉。瑟瑟断续，如怨如慕。"
ITEM_LOSE_MESSAGE_TASK[10998] = --[[!AUTO_159]]"一声清脆的长鸣划破竹海的宁静，风声大作竹叶飒飒，白额猛虎骤至眼前。"
ITEM_LOSE_MESSAGE_TASK[11951] = --[[!AUTO_160]]"抚琴唱道：\r长空凝翠，水光相亲，临江镇里醉花荫。\r红尘有幸君识我，一曲《笑傲》吟到今。\r"
ITEM_LOSE_MESSAGE_TASK[12111] = --[[!AUTO_161]]"少年游\r谁家子弟慕青山，笑语心自闲。天涯客近，隔花人远，诗酒趁华年。\r等闲平地起波澜，无可奈何天。千古音长，浮生梦短，江湖烟水寒。\r"
ITEM_LOSE_MESSAGE_TASK[12119] = --[[!AUTO_162]]"秦府门庭已被洒扫干净。"
ITEM_LOSE_MESSAGE_TASK[12322] = --[[!AUTO_163]]"不费思量，但见笔走龙蛇，不过一盏茶功夫，便写成数个章回。"
ITEM_LOSE_MESSAGE_TASK[12323] = --[[!AUTO_164]]"一读心下骇然，此卷竟与江湖传言中的《独孤九剑》颇多相似之处。\r读罢只觉神清气明，从来只在笔下的招式，竟可自己挥剑使出。\r"
ITEM_LOSE_MESSAGE_TASK[16335] = --[[!AUTO_165]]"随着药粉的腥臭味在空气中弥漫，毒蝎毒蛇等物，纷纷倒下。"
ITEM_LOSE_MESSAGE_TASK[16716] = --[[!AUTO_166]]"把地面打扫地干干净净！"
ITEM_LOSE_MESSAGE_TASK[16717] = --[[!AUTO_167]]"把地面打扫地干干净净！"
ITEM_LOSE_MESSAGE_TASK[16718] = --[[!AUTO_168]]"把地面打扫地干干净净！"
ITEM_LOSE_MESSAGE_TASK[16719] = --[[!AUTO_169]]"把地面打扫地干干净净！"
ITEM_LOSE_MESSAGE_TASK[16720] = --[[!AUTO_170]]"把地面打扫地干干净净！"
ITEM_LOSE_MESSAGE_TASK[16721] = --[[!AUTO_171]]"把地面打扫地干干净净！"
ITEM_LOSE_MESSAGE_TASK[16722] = --[[!AUTO_172]]"把地面打扫地干干净净！"
ITEM_LOSE_MESSAGE_TASK[16723] = --[[!AUTO_173]]"把地面打扫地干干净净！"
ITEM_LOSE_MESSAGE_TASK[16724] = --[[!AUTO_174]]"把地面打扫地干干净净！"
ITEM_LOSE_MESSAGE_TASK[16725] = --[[!AUTO_175]]"把地面打扫地干干净净！"
ITEM_LOSE_MESSAGE_TASK[16886] = --[[!AUTO_176]]"灌了满满一水桶水！"
ITEM_LOSE_MESSAGE_TASK[16949] = --[[!AUTO_177]]"灌了满满一水桶水！"
ITEM_LOSE_MESSAGE_TASK[16950] = --[[!AUTO_178]]"灌了满满一水桶水！"
ITEM_LOSE_MESSAGE_TASK[16951] = --[[!AUTO_179]]"灌了满满一水桶水！"
ITEM_LOSE_MESSAGE_TASK[16952] = --[[!AUTO_180]]"灌了满满一水桶水！"
ITEM_LOSE_MESSAGE_TASK[16953] = --[[!AUTO_181]]"灌了满满一水桶水！"
ITEM_LOSE_MESSAGE_TASK[16954] = --[[!AUTO_182]]"灌了满满一水桶水！"
ITEM_LOSE_MESSAGE_TASK[16955] = --[[!AUTO_183]]"灌了满满一水桶水！"
ITEM_LOSE_MESSAGE_TASK[16956] = --[[!AUTO_184]]"灌了满满一水桶水！"
ITEM_LOSE_MESSAGE_TASK[16957] = --[[!AUTO_185]]"灌了满满一水桶水！"
ITEM_LOSE_MESSAGE_TASK[17146] = --[[!AUTO_186]]"把地面打扫地干干净净！"
ITEM_LOSE_MESSAGE_TASK[17147] = --[[!AUTO_187]]"把地面打扫地干干净净！"
ITEM_LOSE_MESSAGE_TASK[17148] = --[[!AUTO_188]]"把地面打扫地干干净净！"
ITEM_LOSE_MESSAGE_TASK[17149] = --[[!AUTO_189]]"把地面打扫地干干净净！"
ITEM_LOSE_MESSAGE_TASK[17150] = --[[!AUTO_190]]"把地面打扫地干干净净！"
ITEM_LOSE_MESSAGE_TASK[17151] = --[[!AUTO_191]]"把地面打扫地干干净净！"
ITEM_LOSE_MESSAGE_TASK[17152] = --[[!AUTO_192]]"把地面打扫地干干净净！"
ITEM_LOSE_MESSAGE_TASK[17153] = --[[!AUTO_193]]"把地面打扫地干干净净！"
ITEM_LOSE_MESSAGE_TASK[17154] = --[[!AUTO_194]]"把地面打扫地干干净净！"
ITEM_LOSE_MESSAGE_TASK[17155] = --[[!AUTO_195]]"把地面打扫地干干净净！"
ITEM_LOSE_MESSAGE_TASK[17156] = --[[!AUTO_196]]"灌了满满一水桶水，很重！"
ITEM_LOSE_MESSAGE_TASK[17157] = --[[!AUTO_197]]"灌了满满一水桶水，很重！"
ITEM_LOSE_MESSAGE_TASK[17158] = --[[!AUTO_198]]"灌了满满一水桶水，很重！"
ITEM_LOSE_MESSAGE_TASK[17159] = --[[!AUTO_199]]"灌了满满一水桶水，很重！"
ITEM_LOSE_MESSAGE_TASK[17160] = --[[!AUTO_200]]"灌了满满一水桶水，很重！"
ITEM_LOSE_MESSAGE_TASK[17161] = --[[!AUTO_201]]"灌了满满一水桶水，很重！"
ITEM_LOSE_MESSAGE_TASK[17162] = --[[!AUTO_202]]"灌了满满一水桶水，很重！"
ITEM_LOSE_MESSAGE_TASK[17163] = --[[!AUTO_203]]"灌了满满一水桶水，很重！"
ITEM_LOSE_MESSAGE_TASK[17164] = --[[!AUTO_204]]"灌了满满一水桶水，很重！"
ITEM_LOSE_MESSAGE_TASK[17165] = --[[!AUTO_205]]"灌了满满一水桶水，很重！"
ITEM_LOSE_MESSAGE_TASK[23050] = --[[!AUTO_206]]"千年艳骨，终随风逝。"
ITEM_LOSE_MESSAGE_TASK[23526] = --[[!AUTO_207]]"嘹亮悠远深邃的螺音响起。"
ITEM_LOSE_MESSAGE_TASK[26994] = --[[!AUTO_208]]"服食丹药的时候，黄云轩发间竟掉出一枚古怪暗器。"
ITEM_LOSE_MESSAGE_TASK[27504] = --[[!AUTO_209]]"密道缓缓打开。"
ITEM_LOSE_MESSAGE_TASK[28034] = --[[!AUTO_210]]"绳索把老头子捆绑的甚严。"
ITEM_LOSE_MESSAGE_TASK[28793] = --[[!AUTO_211]]"一行带血的脚印浮现出来，明显指向东方。"
ITEM_LOSE_MESSAGE_TASK[28794] = --[[!AUTO_212]]"敬向大哥一碗酒，我先干为敬！"
ITEM_LOSE_MESSAGE_TASK[37177] = --[[!AUTO_213]]"细看之下，玉箫上竟刻着“风清扬”三个小字，莫非是前辈爱物？那便理当完璧归赵。"
ITEM_LOSE_MESSAGE_TASK[37178] = --[[!AUTO_214]]"一曲“平沙落雁”低回婉转，道不尽岁月静好，直引得鸟雀自来。"
ITEM_LOSE_MESSAGE_TASK[37179] = --[[!AUTO_215]]"饮下酸梅汤，透心凉爽，暑气全消。"
ITEM_DROP_MESSAGE_TASK[79797] = --[[!AUTO_1213]]"张贴寻物启事"
---------=-----------2任务物品产生器结束-----------------------
---------=-----------3任务随机发生器结束-----------------------
ITEM_DROP_MESSAGE_TASK[2817] = --[[!AUTO_216]]"获取了大力金刚经"
ITEM_LOSE_MESSAGE_TASK[2817] = --[[!AUTO_217]]"研读了大力金刚经"
ITEM_LOSE_MESSAGE_TASK[11283] = --[[!AUTO_218]]"果然便是乐山的地形图"
ITEM_LOSE_MESSAGE_TASK[11284] = --[[!AUTO_219]]"果然便是乐山的地形图"
---------=-----------3任务随机发生器结束-----------------------
ITEM_DROP_MESSAGE_TASK_DEFAULT = --[[!AUTO_220]]""
ITEM_LOSE_MESSAGE_TASK_DEFAULT = --[[!AUTO_221]]""
-----------------------导出内容拷贝结束------------------------

---------------------挖矿特殊文字-------------------------
MINE_SPECIAL_TEXT = {}
-------挖矿特殊文字开始

MINE_SPECIAL_TEXT[3667] = --[[!AUTO_222]]"敲响古钟"
MINE_SPECIAL_TEXT[3672] = --[[!AUTO_223]]"拾取红叶"
MINE_SPECIAL_TEXT[3683] = --[[!AUTO_224]]"拿取水果"
MINE_SPECIAL_TEXT[4269] = --[[!AUTO_225]]"拿取武器"
MINE_SPECIAL_TEXT[4270] = --[[!AUTO_226]]"临摹石碑"
MINE_SPECIAL_TEXT[4271] = --[[!AUTO_227]]"打开书箱"
MINE_SPECIAL_TEXT[4272] = --[[!AUTO_228]]"拿取金蚕王"
MINE_SPECIAL_TEXT[4273] = --[[!AUTO_229]]"打开书箱"
MINE_SPECIAL_TEXT[4274] = --[[!AUTO_230]]"打开书箱"
MINE_SPECIAL_TEXT[4275] = --[[!AUTO_231]]"打开书箱"
MINE_SPECIAL_TEXT[4276] = --[[!AUTO_232]]"打开书箱"
MINE_SPECIAL_TEXT[4277] = --[[!AUTO_233]]"寻找鹅卵石"
MINE_SPECIAL_TEXT[4278] = --[[!AUTO_234]]"拿取武器"
MINE_SPECIAL_TEXT[5658] = --[[!AUTO_235]]"寻找溪山行旅图"
MINE_SPECIAL_TEXT[6220] = --[[!AUTO_236]]"舀起一瓢水"
MINE_SPECIAL_TEXT[6924] = --[[!AUTO_237]]"寻找记号"
MINE_SPECIAL_TEXT[6925] = --[[!AUTO_238]]"寻找记号"
MINE_SPECIAL_TEXT[6926] = --[[!AUTO_239]]"寻找记号"
MINE_SPECIAL_TEXT[7112] = --[[!AUTO_240]]"钓鱼"
MINE_SPECIAL_TEXT[7113] = --[[!AUTO_241]]"下药"
MINE_SPECIAL_TEXT[8626] = --[[!AUTO_242]]"打捞水井"
MINE_SPECIAL_TEXT[8627] = --[[!AUTO_243]]"打捞水井"
MINE_SPECIAL_TEXT[8629] = --[[!AUTO_244]]"寻找线索"
MINE_SPECIAL_TEXT[8630] = --[[!AUTO_245]]"搬运彩礼"
MINE_SPECIAL_TEXT[8631] = --[[!AUTO_246]]"探寻宝藏"
MINE_SPECIAL_TEXT[8632] = --[[!AUTO_247]]"探寻宝藏"
MINE_SPECIAL_TEXT[8633] = --[[!AUTO_248]]"揭取告示"
MINE_SPECIAL_TEXT[11810] = --[[!AUTO_249]]"捞取露华蚌"
MINE_SPECIAL_TEXT[11893] = --[[!AUTO_250]]"寻找衣服"
MINE_SPECIAL_TEXT[12102] = --[[!AUTO_251]]"拿去双明珠"
MINE_SPECIAL_TEXT[12152] = --[[!AUTO_252]]"寻找飞刀"
MINE_SPECIAL_TEXT[12264] = --[[!AUTO_253]]"拿取侍女服"
MINE_SPECIAL_TEXT[12318] = --[[!AUTO_254]]"拿取泛黄残本"
MINE_SPECIAL_TEXT[12319] = --[[!AUTO_255]]"解救书生"
MINE_SPECIAL_TEXT[16019] = --[[!AUTO_256]]"拿起酒壶"
MINE_SPECIAL_TEXT[16020] = --[[!AUTO_257]]"从裂缝中摸索出一个乌木匣"
MINE_SPECIAL_TEXT[23002] = --[[!AUTO_258]]"修理马车"
MINE_SPECIAL_TEXT[24688] = --[[!AUTO_259]]"点起狼烟"
MINE_SPECIAL_TEXT[25650] = --[[!AUTO_260]]"轻轻取出藏匿的书卷"
MINE_SPECIAL_TEXT[28962] = --[[!AUTO_261]]"购买折扇"
MINE_SPECIAL_TEXT[29049] = --[[!AUTO_262]]"购买马鞍"
MINE_SPECIAL_TEXT[29050] = --[[!AUTO_263]]"购买百宝箱"
MINE_SPECIAL_TEXT[29051] = --[[!AUTO_264]]"购买秘籍"
MINE_SPECIAL_TEXT[29052] = --[[!AUTO_265]]"购买秘药"
MINE_SPECIAL_TEXT[29053] = --[[!AUTO_266]]"购买豪夺令"
MINE_SPECIAL_TEXT[29054] = --[[!AUTO_267]]"购买茶水"
MINE_SPECIAL_TEXT[29055] = --[[!AUTO_268]]"购买糕点"
MINE_SPECIAL_TEXT[29056] = --[[!AUTO_269]]"购买归去来"
MINE_SPECIAL_TEXT[29367] = --[[!AUTO_270]]"购买折扇"
MINE_SPECIAL_TEXT[29368] = --[[!AUTO_271]]"购买马鞍"
MINE_SPECIAL_TEXT[29369] = --[[!AUTO_272]]"购买秘籍"
MINE_SPECIAL_TEXT[29383] = --[[!AUTO_273]]"购买秘药"
MINE_SPECIAL_TEXT[29384] = --[[!AUTO_274]]"购买茶水"
MINE_SPECIAL_TEXT[29385] = --[[!AUTO_275]]"购买糕点"
MINE_SPECIAL_TEXT[29386] = --[[!AUTO_276]]"购买折扇"
MINE_SPECIAL_TEXT[29387] = --[[!AUTO_277]]"购买马鞍"
MINE_SPECIAL_TEXT[29388] = --[[!AUTO_278]]"购买秘籍"
MINE_SPECIAL_TEXT[29389] = --[[!AUTO_279]]"购买秘药"
MINE_SPECIAL_TEXT[29390] = --[[!AUTO_280]]"购买茶水"
MINE_SPECIAL_TEXT[29391] = --[[!AUTO_281]]"购买糕点"
MINE_SPECIAL_TEXT[29940] = --[[!AUTO_282]]"举起盟主神鼎"
MINE_SPECIAL_TEXT[30819] = --[[!AUTO_283]]"开始烤肉吧！"
MINE_SPECIAL_TEXT[32963] = --[[!AUTO_284]]"打开笼子"
MINE_SPECIAL_TEXT[34952] = --[[!AUTO_285]]"开始垂钓吧"
MINE_SPECIAL_TEXT[35478] = --[[!AUTO_286]]"拍醒他……"
MINE_SPECIAL_TEXT[35479] = --[[!AUTO_287]]"呼唤中"
MINE_SPECIAL_TEXT[35501] = --[[!AUTO_288]]"拾取镖旗"
MINE_SPECIAL_TEXT[35519] = --[[!AUTO_289]]"依次品尝四杯茶中"
MINE_SPECIAL_TEXT[35520] = --[[!AUTO_290]]"依次品尝四杯茶中"
MINE_SPECIAL_TEXT[35521] = --[[!AUTO_291]]"依次品尝四杯茶中"
MINE_SPECIAL_TEXT[35522] = --[[!AUTO_292]]"依次品尝四杯茶中"
MINE_SPECIAL_TEXT[35523] = --[[!AUTO_293]]"你用力扯断莲藕"
MINE_SPECIAL_TEXT[35524] = --[[!AUTO_294]]"鸭子就快做好啦"
MINE_SPECIAL_TEXT[35525] = --[[!AUTO_295]]"搜索中"
MINE_SPECIAL_TEXT[35526] = --[[!AUTO_296]]"取水中"
MINE_SPECIAL_TEXT[35527] = --[[!AUTO_297]]"点燃中"
MINE_SPECIAL_TEXT[35561] = --[[!AUTO_298]]"你捡起地上的家书拍了拍"
MINE_SPECIAL_TEXT[35564] = --[[!AUTO_299]]"小心，不要走火！"
MINE_SPECIAL_TEXT[35565] = --[[!AUTO_300]]"你捡起这块板砖"
MINE_SPECIAL_TEXT[35572] = --[[!AUTO_301]]"凿开崩塌的巨石"
MINE_SPECIAL_TEXT[38167] = --[[!AUTO_302]]"捡起尸骸上的袈裟"
MINE_SPECIAL_TEXT[45078] = --[[!AUTO_303]]"你仔细的看着石碑上的文字"
MINE_SPECIAL_TEXT[56022] = --[[!AUTO_304]]"采集止血草"
MINE_SPECIAL_TEXT[56023] = --[[!AUTO_305]]"点燃篝火堆"
MINE_SPECIAL_TEXT[56028] = --[[!AUTO_306]]"烧毁毒蛊粉包"
MINE_SPECIAL_TEXT[56266] = --[[!AUTO_307]]"拾取遗失的包裹"
MINE_SPECIAL_TEXT[56836] = --[[!AUTO_308]]"拾取血衣和头发"
MINE_SPECIAL_TEXT[57467] = --[[!AUTO_309]]"点燃火药桶"
MINE_SPECIAL_TEXT[57535] = --[[!AUTO_310]]"捉鱼中"
MINE_SPECIAL_TEXT[57536] = --[[!AUTO_311]]"拾取秃鹫蛋"
MINE_SPECIAL_TEXT[57537] = --[[!AUTO_312]]"拾取松树枝"
MINE_SPECIAL_TEXT[58777] = --[[!AUTO_313]]"采集竹笋中"
MINE_SPECIAL_TEXT[59248] = --[[!AUTO_314]]"点燃柴草堆"
MINE_SPECIAL_TEXT[59715] = --[[!AUTO_315]]"你将坛中美酒一干而尽"
MINE_SPECIAL_TEXT[59716] = --[[!AUTO_316]]"你把被掩埋的包裹从土里挖出"
MINE_SPECIAL_TEXT[59832] = --[[!AUTO_317]]"调查死尸"
MINE_SPECIAL_TEXT[59833] = --[[!AUTO_318]]"收集鸡蛋"
MINE_SPECIAL_TEXT[59834] = --[[!AUTO_319]]"收集木柴"
MINE_SPECIAL_TEXT[60043] = --[[!AUTO_320]]"唤醒"
MINE_SPECIAL_TEXT[60385] = --[[!AUTO_321]]"点燃柴草堆"
MINE_SPECIAL_TEXT[60386] = --[[!AUTO_322]]"点燃柴草堆"
MINE_SPECIAL_TEXT[61627] = --[[!AUTO_323]]"释放恒山弟子"
MINE_SPECIAL_TEXT[61628] = --[[!AUTO_324]]"寻找文书"
MINE_SPECIAL_TEXT[61629] = --[[!AUTO_325]]"追忆王朝"
MINE_SPECIAL_TEXT[61630] = --[[!AUTO_326]]"看望王朝的战马"
MINE_SPECIAL_TEXT[61631] = --[[!AUTO_327]]"捕捉毛蟹"
MINE_SPECIAL_TEXT[61632] = --[[!AUTO_328]]"点燃稻草"
MINE_SPECIAL_TEXT[62156] = --[[!AUTO_329]]"点燃干柴，燃起篝火"
MINE_SPECIAL_TEXT[62157] = --[[!AUTO_330]]"砸毁毒香炉"
MINE_SPECIAL_TEXT[62188] = --[[!AUTO_331]]"搬起酒坛"
MINE_SPECIAL_TEXT[62334] = --[[!AUTO_332]]"这具尸体只有额心处有一点血孔"
MINE_SPECIAL_TEXT[62335] = --[[!AUTO_333]]"这只乌鸦的翅膀上缠着红线"
MINE_SPECIAL_TEXT[62336] = --[[!AUTO_334]]"箱子的四壁插着针线"
MINE_SPECIAL_TEXT[62337] = --[[!AUTO_335]]"采集剑兰草"
MINE_SPECIAL_TEXT[62338] = --[[!AUTO_336]]"收集极寒石髓"
MINE_SPECIAL_TEXT[62515] = --[[!AUTO_337]]"抚摸"
MINE_SPECIAL_TEXT[62700] = --[[!AUTO_338]]"插入铁剑，开启大门"
MINE_SPECIAL_TEXT[62701] = --[[!AUTO_339]]"参悟独孤心法总纲"
MINE_SPECIAL_TEXT[62702] = --[[!AUTO_340]]"参阅石壁"
MINE_SPECIAL_TEXT[63728] = --[[!AUTO_341]]"开启侧门"
MINE_SPECIAL_TEXT[63730] = --[[!AUTO_342]]"开启宝箱"
MINE_SPECIAL_TEXT[64499] = --[[!AUTO_343]]"采集含情草"
MINE_SPECIAL_TEXT[64500] = --[[!AUTO_344]]"开采陨石"
MINE_SPECIAL_TEXT[64501] = --[[!AUTO_345]]"开采原石"
MINE_SPECIAL_TEXT[64502] = --[[!AUTO_346]]"清除杂草"
MINE_SPECIAL_TEXT[64503] = --[[!AUTO_347]]"开启宝箱"
MINE_SPECIAL_TEXT[64504] = --[[!AUTO_348]]"触发机关"
MINE_SPECIAL_TEXT[64505] = --[[!AUTO_349]]"触发机关"
MINE_SPECIAL_TEXT[64506] = --[[!AUTO_350]]"触发机关"
MINE_SPECIAL_TEXT[64827] = --[[!AUTO_351]]"采集蒲黄"
MINE_SPECIAL_TEXT[64828] = --[[!AUTO_352]]"采集巴莎木"
MINE_SPECIAL_TEXT[64829] = --[[!AUTO_353]]"采集月见草"
MINE_SPECIAL_TEXT[65889] = --[[!AUTO_354]]"砍伐青竹搜寻解药"
MINE_SPECIAL_TEXT[65912] = --[[!AUTO_355]]"解救囚犯"
MINE_SPECIAL_TEXT[65948] = --[[!AUTO_356]]"嘎吱嘎吱嘎吱"
MINE_SPECIAL_TEXT[65960] = --[[!AUTO_357]]"捡起佛珠"
MINE_SPECIAL_TEXT[65961] = --[[!AUTO_358]]"查看破损情况"
MINE_SPECIAL_TEXT[65962] = --[[!AUTO_359]]"采集靛枝"
MINE_SPECIAL_TEXT[65963] = --[[!AUTO_360]]"查看石幢"
MINE_SPECIAL_TEXT[65986] = --[[!AUTO_361]]"查看草药长势"
MINE_SPECIAL_TEXT[67309] = --[[!AUTO_362]]"你拿起桌上的小盒子仔细查看"
MINE_SPECIAL_TEXT[67381] = --[[!AUTO_363]]"你从泥土里掏出半截被埋起来的钱袋"
MINE_SPECIAL_TEXT[67450] = --[[!AUTO_364]]"编织鱼网 "
MINE_SPECIAL_TEXT[68086] = --[[!AUTO_365]]"拾取包裹"
MINE_SPECIAL_TEXT[68088] = --[[!AUTO_366]]"收集藏茶"
MINE_SPECIAL_TEXT[68089] = --[[!AUTO_367]]"调查地砖"
MINE_SPECIAL_TEXT[68090] = --[[!AUTO_368]]"凿冰取酒"
MINE_SPECIAL_TEXT[68091] = --[[!AUTO_369]]"收取弃剑"
MINE_SPECIAL_TEXT[68092] = --[[!AUTO_370]]"调查港口货物"
MINE_SPECIAL_TEXT[68093] = --[[!AUTO_371]]"调查港口货物"
MINE_SPECIAL_TEXT[68094] = --[[!AUTO_372]]"调查港口货物"
MINE_SPECIAL_TEXT[68099] = --[[!AUTO_373]]"收取造纸秘方"
MINE_SPECIAL_TEXT[68101] = --[[!AUTO_374]]"收取百宝箱"
MINE_SPECIAL_TEXT[68102] = --[[!AUTO_375]]"祈愿焚香"
MINE_SPECIAL_TEXT[68104] = --[[!AUTO_376]]"开启侧门"
MINE_SPECIAL_TEXT[68105] = --[[!AUTO_377]]"开启侧门"
MINE_SPECIAL_TEXT[68106] = --[[!AUTO_378]]"开启侧门"
MINE_SPECIAL_TEXT[68107] = --[[!AUTO_379]]"开启侧门"
MINE_SPECIAL_TEXT[68108] = --[[!AUTO_380]]"开启侧门"
MINE_SPECIAL_TEXT[68109] = --[[!AUTO_381]]"开启侧门"
MINE_SPECIAL_TEXT[68110] = --[[!AUTO_382]]"开启侧门"
MINE_SPECIAL_TEXT[68111] = --[[!AUTO_383]]"开启侧门"
MINE_SPECIAL_TEXT[68112] = --[[!AUTO_384]]"开启侧门"
MINE_SPECIAL_TEXT[68113] = --[[!AUTO_385]]"开启侧门"
MINE_SPECIAL_TEXT[68234] = --[[!AUTO_386]]"收取药瓮"
MINE_SPECIAL_TEXT[68286] = --[[!AUTO_387]]"祈愿焚香"
MINE_SPECIAL_TEXT[68316] = --[[!AUTO_388]]"点亮石灯"
MINE_SPECIAL_TEXT[68467] = --[[!AUTO_389]]"祈愿焚香"
MINE_SPECIAL_TEXT[68580] = --[[!AUTO_390]]"翻开土堆"
MINE_SPECIAL_TEXT[70758] = --[[!AUTO_391]]"施展轻功"
MINE_SPECIAL_TEXT[71941] = --[[!AUTO_392]]"刨开蛛卵取出毒胚虫"
MINE_SPECIAL_TEXT[71942] = --[[!AUTO_393]]"收集飞舞的柳絮"
MINE_SPECIAL_TEXT[71943] = --[[!AUTO_394]]"采集江山绿牡丹"
MINE_SPECIAL_TEXT[71989] = --[[!AUTO_395]]"敲击宫声铜钟"
MINE_SPECIAL_TEXT[71990] = --[[!AUTO_396]]"敲击商声铜钟"
MINE_SPECIAL_TEXT[71991] = --[[!AUTO_397]]"敲击角声铜钟"
MINE_SPECIAL_TEXT[71992] = --[[!AUTO_398]]"敲击徵声铜钟"
MINE_SPECIAL_TEXT[71993] = --[[!AUTO_399]]"敲击羽声铜钟"
MINE_SPECIAL_TEXT[71994] = --[[!AUTO_400]]"敲击宫声铜钟"
MINE_SPECIAL_TEXT[71995] = --[[!AUTO_401]]"敲击商声铜钟"
MINE_SPECIAL_TEXT[71996] = --[[!AUTO_402]]"敲击角声铜钟"
MINE_SPECIAL_TEXT[71997] = --[[!AUTO_403]]"敲击徵声铜钟"
MINE_SPECIAL_TEXT[71998] = --[[!AUTO_404]]"敲击羽声铜钟"
MINE_SPECIAL_TEXT[71999] = --[[!AUTO_405]]"敲击宫声铜钟"
MINE_SPECIAL_TEXT[72000] = --[[!AUTO_406]]"敲击商声铜钟"
MINE_SPECIAL_TEXT[72001] = --[[!AUTO_407]]"敲击角声铜钟"
MINE_SPECIAL_TEXT[72002] = --[[!AUTO_408]]"敲击徵声铜钟"
MINE_SPECIAL_TEXT[72003] = --[[!AUTO_409]]"敲击羽声铜钟"
MINE_SPECIAL_TEXT[72004] = --[[!AUTO_410]]"敲击宫声铜钟"
MINE_SPECIAL_TEXT[72005] = --[[!AUTO_411]]"敲击商声铜钟"
MINE_SPECIAL_TEXT[72006] = --[[!AUTO_412]]"敲击角声铜钟"
MINE_SPECIAL_TEXT[72007] = --[[!AUTO_413]]"敲击徵声铜钟"
MINE_SPECIAL_TEXT[72008] = --[[!AUTO_414]]"敲击羽声铜钟"
MINE_SPECIAL_TEXT[72009] = --[[!AUTO_415]]"敲击宫声铜钟"
MINE_SPECIAL_TEXT[72010] = --[[!AUTO_416]]"敲击商声铜钟"
MINE_SPECIAL_TEXT[72011] = --[[!AUTO_417]]"敲击角声铜钟"
MINE_SPECIAL_TEXT[72012] = --[[!AUTO_418]]"敲击徵声铜钟"
MINE_SPECIAL_TEXT[72013] = --[[!AUTO_419]]"敲击羽声铜钟"
MINE_SPECIAL_TEXT[72142] = --[[!AUTO_420]]"打开宝箱"
MINE_SPECIAL_TEXT[72143] = --[[!AUTO_421]]"打开宝箱"
MINE_SPECIAL_TEXT[72144] = --[[!AUTO_422]]"打开宝箱"
MINE_SPECIAL_TEXT[72146] = --[[!AUTO_423]]"打开宝箱"
MINE_SPECIAL_TEXT[72147] = --[[!AUTO_424]]"打开宝箱"
MINE_SPECIAL_TEXT[72169] = --[[!AUTO_425]]"打开宝箱"
MINE_SPECIAL_TEXT[72170] = --[[!AUTO_426]]"打开宝箱"
MINE_SPECIAL_TEXT[72171] = --[[!AUTO_427]]"打开宝箱"
MINE_SPECIAL_TEXT[72172] = --[[!AUTO_428]]"打开宝箱"
MINE_SPECIAL_TEXT[72173] = --[[!AUTO_429]]"打开宝箱"
MINE_SPECIAL_TEXT[72174] = --[[!AUTO_430]]"打开宝箱"
MINE_SPECIAL_TEXT[72175] = --[[!AUTO_431]]"打开宝箱"
MINE_SPECIAL_TEXT[72176] = --[[!AUTO_432]]"打开宝箱"
MINE_SPECIAL_TEXT[72177] = --[[!AUTO_433]]"打开宝箱"
MINE_SPECIAL_TEXT[72178] = --[[!AUTO_434]]"打开宝箱"
MINE_SPECIAL_TEXT[72254] = --[[!AUTO_435]]"点燃火药桶"
MINE_SPECIAL_TEXT[72255] = --[[!AUTO_436]]"点燃火药桶"
MINE_SPECIAL_TEXT[72580] = --[[!AUTO_437]]"取出即将破卵而出的幼蛛"
MINE_SPECIAL_TEXT[72581] = --[[!AUTO_438]]"捡起笛子"
MINE_SPECIAL_TEXT[72582] = --[[!AUTO_439]]"将骚粉包溶入酒坛"
MINE_SPECIAL_TEXT[72748] = --[[!AUTO_440]]"捡起药人名单"
MINE_SPECIAL_TEXT[72796] = --[[!AUTO_441]]"点燃火药桶"
MINE_SPECIAL_TEXT[72797] = --[[!AUTO_442]]"点燃火药桶"
MINE_SPECIAL_TEXT[72798] = --[[!AUTO_443]]"点燃火药桶"
MINE_SPECIAL_TEXT[73814] = --[[!AUTO_444]]"砍伐竹子"
MINE_SPECIAL_TEXT[73908] = --[[!AUTO_445]]"捡起臭团"
MINE_SPECIAL_TEXT[77096] = --[[!AUTO_446]]"清扫鸟粪"
MINE_SPECIAL_TEXT[77095] = --[[!AUTO_447]]"摘糖葫芦"
MINE_SPECIAL_TEXT[76325] = --[[!AUTO_448]]"寻找驻颜丹"
MINE_SPECIAL_TEXT[76321] = --[[!AUTO_449]]"取出太祖拳谱"
MINE_SPECIAL_TEXT[76323] = --[[!AUTO_450]]"学习太祖长拳"
MINE_SPECIAL_TEXT[76326] = --[[!AUTO_1214]]"寻找圣火令情报"
MINE_SPECIAL_TEXT[76327] = --[[!AUTO_1215]]"偷取圣火"
MINE_SPECIAL_TEXT[80194] = --[[!AUTO_1216]]"参拜神像"
MINE_SPECIAL_TEXT[80195] = --[[!AUTO_1217]]"参拜神像"
MINE_SPECIAL_TEXT[80196] = --[[!AUTO_1218]]"参拜神像"
MINE_SPECIAL_TEXT[77989] = --[[!AUTO_1219]]"采撷红莲"
MINE_SPECIAL_TEXT[77991] = --[[!AUTO_1220]]"埋葬枉死的村民"
MINE_SPECIAL_TEXT[77992] = --[[!AUTO_1221]]"砸毁邪恶的祭坛"
MINE_SPECIAL_TEXT[77994] = --[[!AUTO_1222]]"偷取衣物"
MINE_SPECIAL_TEXT[77995] = --[[!AUTO_1223]]"点燃篝火"
MINE_SPECIAL_TEXT[78973] = --[[!AUTO_1224]]"摘下金莲花"
MINE_SPECIAL_TEXT[78974] = --[[!AUTO_1225]]"拔掉白莲教大旗"
MINE_SPECIAL_TEXT[77987] = --[[!AUTO_1226]]"拾到一块腰牌"

-------挖矿特殊文字结束
----------------------------------------------------------

----------------------任务相关文本------------------------
TASK_EVENT_TEXT = {}
TASK_EVENT_TEXT[1] = {--[[!AUTO_448]]"", --[[!AUTO_449]]"", --[[!AUTO_450]]""}
TASK_EVENT_TEXT[1203] = {--[[!AUTO_451]]"", --[[!AUTO_452]]"一读心下骇然，此卷竟与江湖传言中的《独孤九剑》颇多相似之处。", --[[!AUTO_453]]"读罢只觉神清气明，从来只在笔下的招式，竟可自己挥剑使出。"}
TASK_EVENT_TEXT[1424] = {--[[!AUTO_454]]"这句话说明接到了任务", --[[!AUTO_455]]"这句话说明达到了任务目标", --[[!AUTO_456]]"这句话说明完成了任务"}
TASK_EVENT_TEXT[596] = {--[[!AUTO_457]]"", --[[!AUTO_458]]"服食丹药的时候，黄云轩发间竟掉出一枚古怪暗器。", --[[!AUTO_459]]""}
TASK_EVENT_TEXT[971] = {--[[!AUTO_460]]"", --[[!AUTO_461]]"胡琴声起，夜雨潇湘，琴声凄凉。雨落竹叶，如泣如诉。瑟瑟断续，如怨如慕。", --[[!AUTO_462]]""}
TASK_EVENT_TEXT[3050] = {--[[!AUTO_463]]"", --[[!AUTO_464]]"你悄悄抬眼看杨莲亭，见他目如弯月嘴角上挑，喜爱之情难以抑制。", --[[!AUTO_465]]""}
TASK_EVENT_TEXT[3051] = {--[[!AUTO_466]]"", --[[!AUTO_467]]"杨莲亭正满面春风洋洋得意，似乎并未发现日月古玉已被掉包。", --[[!AUTO_468]]""}
TASK_EVENT_TEXT[2121] = {--[[!AUTO_469]]"", --[[!AUTO_470]]"带血的脚印浮现出来，明显指向东方。", --[[!AUTO_471]]""}
TASK_EVENT_TEXT[700] = {--[[!AUTO_472]]"", --[[!AUTO_473]]"", --[[!AUTO_474]]"两处云纹相合了，山庄的密道迅速开启。等你回过神来，眼前已别有洞天。"}
TASK_EVENT_TEXT[490] = {--[[!AUTO_475]]"", --[[!AUTO_476]]"", --[[!AUTO_477]]"火狸腺体的奇异色彩吸引了神教弟子的目光，但她立刻把眼神移开，摆出了不屑一顾的神态……"}
TASK_EVENT_TEXT[699] = {--[[!AUTO_478]]"有人要突入山庄！必是乘火打劫的不义之徒，正好问问他们雌剑哪去了！", --[[!AUTO_479]]"", --[[!AUTO_480]]""}
TASK_EVENT_TEXT[523] = {--[[!AUTO_481]]"就按陆柏的意思，杀了和尚无名，替嵩山派了事。", --[[!AUTO_482]]"", --[[!AUTO_483]]"佛珠散落一地，你捡起一颗，乌黑如墨，仿佛无声的控诉。嵩山派这回是不是过了？"}
TASK_EVENT_TEXT[2936] = {--[[!AUTO_484]]"都说桂林山水甲天下，正可乘舟览两岸风光。", --[[!AUTO_485]]"", --[[!AUTO_486]]""}
TASK_EVENT_TEXT[498] = {--[[!AUTO_487]]"", --[[!AUTO_488]]"", --[[!AUTO_489]]"香烟袅袅，哀思绵绵不尽，惟愿逝者安息。"}
TASK_EVENT_TEXT[3050] = {--[[!AUTO_490]]"这是#N精心收藏的一件古玩，大总管看看可还和您心意吗？", --[[!AUTO_491]]"", --[[!AUTO_492]]""}
TASK_EVENT_TEXT[3052] = {--[[!AUTO_493]]"这不会就是盈盈提到的任我行之古玉吧？别管三七二十一，调包再说。", --[[!AUTO_494]]"", --[[!AUTO_495]]""}
TASK_EVENT_TEXT[3053] = {--[[!AUTO_496]]"给我抓住那个古董商！你好大胆子，竟敢偷我的东西！", --[[!AUTO_497]]"杨兄所丢何物？可否说出来，令小弟帮忙寻找？", --[[!AUTO_498]]"都住手吧，送客！"}
TASK_EVENT_TEXT[3056] = {--[[!AUTO_499]]"名义上送行，实际要杀人灭口。杨莲亭的手段真毒辣！", --[[!AUTO_500]]"", --[[!AUTO_501]]"莫愁前路无知己，天下谁人不识君！向问天的声音在身后回荡……"}
TASK_EVENT_TEXT[2383] = {--[[!AUTO_502]]"", --[[!AUTO_503]]"敬向大哥一碗，我先干为敬！", --[[!AUTO_504]]"回忆开启……"}
TASK_EVENT_TEXT[999] = {--[[!AUTO_505]]"", --[[!AUTO_506]]"一声清脆的长鸣划破竹海的宁静，风声大作竹叶飒飒，白额猛虎骤至眼前。", --[[!AUTO_507]]""}
TASK_EVENT_TEXT[3983] = {--[[!AUTO_508]]"", --[[!AUTO_509]]"细看之下，玉箫上竟刻着“风清扬”三个小字，莫非是前辈爱物？那便理当完璧归赵。", --[[!AUTO_510]]""}
TASK_EVENT_TEXT[3989] = {--[[!AUTO_511]]"", --[[!AUTO_512]]"", --[[!AUTO_513]]"一曲“平沙落雁”低回婉转，道不尽岁月静好，直引得鸟雀自来。"}
TASK_EVENT_TEXT[3991] = {--[[!AUTO_514]]"", --[[!AUTO_515]]"饮下酸梅汤，透心凉爽，暑气全消。", --[[!AUTO_516]]""}
TASK_EVENT_TEXT[3994] = {--[[!AUTO_517]]"", --[[!AUTO_518]]"", --[[!AUTO_519]]"千山风里箫，卅载忆如涛。把酒情切切，醉里雨潇潇。碧伞共石径，含光剑在腰。酒醒愁肠断，谁伴我寂寥。西风多少恨，吹不散梅箫。"}
----------------------------------------------------------

----------------------成就相关文本------------------------
TAG_COLOR_ACHIEVEMENT = {}
TAG_COLOR_ACHIEVEMENT[1] = --[[!AUTO_520]]"^f2e5b9"	--	通常
TAG_COLOR_ACHIEVEMENT[2] = --[[!AUTO_521]]"^f2e5b9"	--	标题
TAG_COLOR_ACHIEVEMENT[3] = --[[!AUTO_522]]"^f2e5b9"	--	未满足解锁条件

TAG_COLOR_ACHIEVEMENT[4] = --[[!AUTO_523]]"^f2e5b9"	--	已完成条件

TAG_COLOR_ACHIEVEMENT[5] = --[[!AUTO_524]]"^f2e5b9"	--	制作中条件

TAG_COLOR_ACHIEVEMENT[8] = --[[!AUTO_525]]"f2e5b9"	--	未满足解锁条件不带标识符
TAG_COLOR_ACHIEVEMENT[9] = --[[!AUTO_526]]"f2e5b9"	--	已完成条件不带标识符

TAG_ACHIEVEMENT_MAP_TASK_TEXT = {}
TAG_ACHIEVEMENT_MAP_TASK_TEXT[2002] = --[[!AUTO_527]]"福州城"
TAG_ACHIEVEMENT_MAP_TASK_TEXT[2003] = --[[!AUTO_528]]"梅关古道"
TAG_ACHIEVEMENT_MAP_TASK_TEXT[2004] = --[[!AUTO_529]]"衡山城"
TAG_ACHIEVEMENT_MAP_TASK_TEXT[2005] = --[[!AUTO_530]]"药王谷"
TAG_ACHIEVEMENT_MAP_TASK_TEXT[2006] = --[[!AUTO_531]]"洛阳城"
TAG_ACHIEVEMENT_MAP_TASK_TEXT[2007] = --[[!AUTO_532]]"西安城"
TAG_ACHIEVEMENT_MAP_TASK_TEXT[2008] = --[[!AUTO_533]]"桃花岛"
TAG_ACHIEVEMENT_MAP_TASK_TEXT[2009] = --[[!AUTO_534]]"大理城"
TAG_ACHIEVEMENT_MAP_TASK_TEXT[2010] = --[[!AUTO_535]]"北京城"
TAG_ACHIEVEMENT_MAP_TASK_TEXT[2011] = --[[!AUTO_536]]"武当山"
TAG_ACHIEVEMENT_MAP_TASK_TEXT[2012] = --[[!AUTO_537]]"华山"
TAG_ACHIEVEMENT_MAP_TASK_TEXT[2013] = --[[!AUTO_538]]"嵩山"
TAG_ACHIEVEMENT_MAP_TASK_TEXT[2014] = --[[!AUTO_539]]"少室山"
TAG_ACHIEVEMENT_MAP_TASK_TEXT[2015] = --[[!AUTO_540]]"仙愁峡"
TAG_ACHIEVEMENT_MAP_TASK_TEXT[2016] = --[[!AUTO_541]]"余杭"
TAG_ACHIEVEMENT_MAP_TASK_TEXT[2017] = --[[!AUTO_542]]"杭州城"

TAG_ACHIEVEMENT_MAP_TASK_TEXT_NULL = --[[!AUTO_543]]"未知"

TAG_ACHIEVEMENT_LOCK_TITLE = --[[!AUTO_544]]"未解锁成就"

TAG_ACHIEVEMENT_LOCK_TEXT = --[[!AUTO_545]]"解锁资格："

TAG_ACHIEVEMENT_LOCK_TYPE_TEXT ={}
TAG_ACHIEVEMENT_LOCK_TYPE_TEXT[1] = --[[!AUTO_546]]"%s加入%s"
TAG_ACHIEVEMENT_LOCK_TYPE_TEXT[2] = --[[!AUTO_547]]"%s达到%d级"
TAG_ACHIEVEMENT_LOCK_TYPE_TEXT[3] = --[[!AUTO_548]]"%s银子达到%d锭"
TAG_ACHIEVEMENT_LOCK_TYPE_TEXT[4] = --[[!AUTO_549]]"%sPK值达到%d"
TAG_ACHIEVEMENT_LOCK_TYPE_TEXT[5] = --[[!AUTO_550]]"%s%s声望值达到%d"
TAG_ACHIEVEMENT_LOCK_TYPE_TEXT[6] = --[[!AUTO_551]]"%s完成任务『%s』"
TAG_ACHIEVEMENT_LOCK_TYPE_TEXT[7] = --[[!AUTO_552]]"%s完成%d个%s的任务"
TAG_ACHIEVEMENT_LOCK_TYPE_TEXT[8] = --[[!AUTO_553]]"%s完成任务『%s』满%d次"
TAG_ACHIEVEMENT_LOCK_TYPE_TEXT[9] = --[[!AUTO_554]]"%s将招式『%s』提升至%d层"
TAG_ACHIEVEMENT_LOCK_TYPE_TEXT[10] = --[[!AUTO_555]]"%s将生产技能『%s』等级提升至%d"
TAG_ACHIEVEMENT_LOCK_TYPE_TEXT[11] = --[[!AUTO_556]]"%s生产技能『%s』的配方数达到%d"
TAG_ACHIEVEMENT_LOCK_TYPE_TEXT[12] = --[[!AUTO_557]]"%s达成成就『%s』"
TAG_ACHIEVEMENT_LOCK_TYPE_TEXT[13] = {[1] = --[[!AUTO_558]]"%s参与竞技场的%s赛超过%d场", [2] = --[[!AUTO_559]]"%s在竞技场的%s赛中获得%d场优胜"}
TAG_ACHIEVEMENT_LOCK_TYPE_TEXT[14] = --[[!AUTO_560]]"%s竞技段位达到%s"
TAG_ACHIEVEMENT_LOCK_TYPE_TEXT[15] = --[[!AUTO_561]]"%s在%s战中获得%d场连胜"

TAG_ACHIEVEMENT_UNLOCK_TEXT = --[[!AUTO_562]]"达成目标："

TAG_ACHIEVEMENT_EVENT_TEXT = {}
TAG_ACHIEVEMENT_EVENT_TEXT[1] = --[[!AUTO_563]]"%s装备『%s』"
TAG_ACHIEVEMENT_EVENT_TEXT[2] = --[[!AUTO_564]]"%s获取道具『%s』满%d件"
TAG_ACHIEVEMENT_EVENT_TEXT[3] = {[1] = --[[!AUTO_565]]"%s招募%d只『%s%s』门徒", [2] = --[[!AUTO_566]]"%s招募%d次%s门徒", }
TAG_ACHIEVEMENT_EVENT_TEXT[4] = {[1] = --[[!AUTO_567]]"%s完成%d次『%s』任务", [2] = --[[!AUTO_568]]"%s完成%d次%s类任务", }
TAG_ACHIEVEMENT_EVENT_TEXT[5] = --[[!AUTO_569]]"%s击杀怪物『%s』满%d次"
TAG_ACHIEVEMENT_EVENT_TEXT[6] = --[[!AUTO_570]]"%s生产配方『%s』满%d次"
TAG_ACHIEVEMENT_EVENT_TEXT[7] = --[[!AUTO_571]]"%s完成副本『%s』的%d号版面满%d次"
TAG_ACHIEVEMENT_EVENT_TEXT[8] = {[1] = --[[!AUTO_572]]"%s进行%s%d次切磋", [2] = --[[!AUTO_573]]"%s在切磋中获胜%s%d场", [3] = --[[!AUTO_574]]"%s在切磋中落败%s%d场",}
TAG_ACHIEVEMENT_EVENT_TEXT[9] = --[[!AUTO_575]]"%s在战斗中重伤%d次"
TAG_ACHIEVEMENT_EVENT_TEXT[10] = {[1] = --[[!AUTO_576]]"%s获得%s银票", [2] = --[[!AUTO_577]]"%s通过任务获得%s银票", [3] = --[[!AUTO_578]]"%s通过杀怪获得%s银票",}
TAG_ACHIEVEMENT_EVENT_TEXT[11] = --[[!AUTO_579]]"%s完成某类任务" --（未处理）

TAG_ACHIEVEMENT_EVENT_TEXT[12] = --[[!AUTO_580]]"%s答题" --（未处理）

TAG_ACHIEVEMENT_EVENT_TEXT[13] = --[[!AUTO_581]]"%s种植交互" --（未处理）

TAG_ACHIEVEMENT_EVENT_TEXT[14] = {[1] = --[[!AUTO_582]]"%s总共参加了%d场%s", [2] = --[[!AUTO_583]]"%s总共获取了%d场%s的胜利"}
TAG_ACHIEVEMENT_EVENT_TEXT[15] = --[[!AUTO_584]]"%s总共获取过%d次%s战的完胜"
TAG_ACHIEVEMENT_EVENT_TEXT[16] = --[[!AUTO_585]]"%s总共在%s中获得了%d次MVP"
TAG_ACHIEVEMENT_EVENT_TEXT[17] = {--[[!AUTO_586]]"%s%s以上评价通关%s%s", --[[!AUTO_587]]"%s以%s以上评价通关%d次%s的%s以上难度"}

TAG_ACHIEVEMENT_COMPARE = {}
TAG_ACHIEVEMENT_COMPARE[1] = --[[!AUTO_588]]"超过"
TAG_ACHIEVEMENT_COMPARE[2] = --[[!AUTO_589]]"不到"

TAG_ACHIEVEMENT_PET = {}
TAG_ACHIEVEMENT_PET[0] = --[[!AUTO_590]]""
TAG_ACHIEVEMENT_PET[1] = --[[!AUTO_591]]"宝宝"
TAG_ACHIEVEMENT_PET[3] = --[[!AUTO_592]]"变异"

TAG_ACHIEVEMENT_TASKLIB = {}
TAG_ACHIEVEMENT_TASKLIB[1] =--[[!AUTO_593]]"异闻录"
TAG_ACHIEVEMENT_TASKLIB[2] =--[[!AUTO_594]]"名人挑战"

TAG_ACHIEVEMENT_UNLOCK_MULTICONDS_TEXT = --[[!AUTO_595]]"达成以下%d个目标："

TAG_ACHIEVEMENT_ARENATYPE = {}
TAG_ACHIEVEMENT_ARENATYPE[1] = --[[!AUTO_596]]"擂台"
TAG_ACHIEVEMENT_ARENATYPE[2] = --[[!AUTO_597]]"战场"
TAG_ACHIEVEMENT_ARENATYPE[3] = --[[!AUTO_598]]"天梯"

TAG_ACHIEVEMENT_ARENARANK = {}
TAG_ACHIEVEMENT_ARENARANK[1] = --[[!AUTO_599]]"新手"
TAG_ACHIEVEMENT_ARENARANK[2] = --[[!AUTO_600]]"初级"
TAG_ACHIEVEMENT_ARENARANK[3] = --[[!AUTO_601]]"一级"
TAG_ACHIEVEMENT_ARENARANK[4] = --[[!AUTO_602]]"二级"
TAG_ACHIEVEMENT_ARENARANK[5] = --[[!AUTO_603]]"三级"
TAG_ACHIEVEMENT_ARENARANK[6] = --[[!AUTO_604]]"四级"
TAG_ACHIEVEMENT_ARENARANK[7] = --[[!AUTO_605]]"五级"
TAG_ACHIEVEMENT_ARENARANK[8] = --[[!AUTO_606]]"六级"
TAG_ACHIEVEMENT_ARENARANK[9] = --[[!AUTO_607]]"七级"
TAG_ACHIEVEMENT_ARENARANK[10] = --[[!AUTO_608]]"八级"
TAG_ACHIEVEMENT_ARENARANK[11] = --[[!AUTO_609]]"九级"
TAG_ACHIEVEMENT_ARENARANK[12] = --[[!AUTO_610]]"中段"
TAG_ACHIEVEMENT_ARENARANK[13] = --[[!AUTO_611]]"一段"
TAG_ACHIEVEMENT_ARENARANK[14] = --[[!AUTO_612]]"二段"
TAG_ACHIEVEMENT_ARENARANK[15] = --[[!AUTO_613]]"三段"
TAG_ACHIEVEMENT_ARENARANK[16] = --[[!AUTO_614]]"四段"
TAG_ACHIEVEMENT_ARENARANK[17] = --[[!AUTO_615]]"五段"
TAG_ACHIEVEMENT_ARENARANK[18] = --[[!AUTO_616]]"六段"
TAG_ACHIEVEMENT_ARENARANK[19] = --[[!AUTO_617]]"七段"
TAG_ACHIEVEMENT_ARENARANK[20] = --[[!AUTO_618]]"八段"
TAG_ACHIEVEMENT_ARENARANK[21] = --[[!AUTO_619]]"九段"
TAG_ACHIEVEMENT_ARENARANK[22] = --[[!AUTO_620]]"上位"
TAG_ACHIEVEMENT_ARENARANK[23] = --[[!AUTO_621]]"一位"
TAG_ACHIEVEMENT_ARENARANK[24] = --[[!AUTO_622]]"二位"
TAG_ACHIEVEMENT_ARENARANK[25] = --[[!AUTO_623]]"三位"
TAG_ACHIEVEMENT_ARENARANK[26] = --[[!AUTO_624]]"四位"
TAG_ACHIEVEMENT_ARENARANK[27] = --[[!AUTO_625]]"五位"
TAG_ACHIEVEMENT_ARENARANK[28] = --[[!AUTO_626]]"六位"
TAG_ACHIEVEMENT_ARENARANK[29] = --[[!AUTO_627]]"七位"
TAG_ACHIEVEMENT_ARENARANK[30] = --[[!AUTO_628]]"八位"
TAG_ACHIEVEMENT_ARENARANK[31] = --[[!AUTO_629]]"九位"

TAG_ACHIEVEMENT_ARENAFIGHTTYPE = {}
TAG_ACHIEVEMENT_ARENAFIGHTTYPE[0] = --[[!AUTO_630]]"任意竞技赛"
TAG_ACHIEVEMENT_ARENAFIGHTTYPE[1] = --[[!AUTO_631]]"擂台单挑战"
TAG_ACHIEVEMENT_ARENAFIGHTTYPE[2] = --[[!AUTO_632]]"擂台三局战"
TAG_ACHIEVEMENT_ARENAFIGHTTYPE[3] = --[[!AUTO_633]]"擂台五局战"
TAG_ACHIEVEMENT_ARENAFIGHTTYPE[4] = --[[!AUTO_634]]"擂台车轮战"
TAG_ACHIEVEMENT_ARENAFIGHTTYPE[5] = --[[!AUTO_635]]"擂台名人战"

TAG_ACHIEVEMENT_ARENAMVPTYPE = {}
TAG_ACHIEVEMENT_ARENAMVPTYPE[1] = --[[!AUTO_636]]"擂台车轮战"
TAG_ACHIEVEMENT_ARENAMVPTYPE[2] = --[[!AUTO_637]]"战场对攻战"

TAG_ACHIEVEMENT_INSTANCEEND_DEFAULT = --[[!AUTO_638]]"未知评价"
TAG_ACHIEVEMENT_INSTANCEEND = {}
TAG_ACHIEVEMENT_INSTANCEEND[1] = --[[!AUTO_639]]"下级"
TAG_ACHIEVEMENT_INSTANCEEND[2] = --[[!AUTO_640]]"中级"
TAG_ACHIEVEMENT_INSTANCEEND[3] = --[[!AUTO_641]]"上级"
TAG_ACHIEVEMENT_INSTANCEEND[4] = --[[!AUTO_642]]"神级"

TAG_ACHIEVEMENT_INSTANCENAME_DEFAULT = --[[!AUTO_643]]"未知副本"
TAG_ACHIEVEMENT_INSTANCENAME = {}
TAG_ACHIEVEMENT_INSTANCENAME[1751] = --[[!AUTO_644]]"『联手』"
TAG_ACHIEVEMENT_INSTANCENAME[1777] = --[[!AUTO_645]]"『青城』"
TAG_ACHIEVEMENT_INSTANCENAME[1923] = --[[!AUTO_646]]"『东厂』"
TAG_ACHIEVEMENT_INSTANCENAME[1928] = --[[!AUTO_647]]"『魔窟』"
TAG_ACHIEVEMENT_INSTANCENAME[2465] = --[[!AUTO_648]]"『镖局』"
TAG_ACHIEVEMENT_INSTANCENAME[2576] = --[[!AUTO_649]]"『酒肆』"
TAG_ACHIEVEMENT_INSTANCENAME[1927] = --[[!AUTO_650]]"『百毒』"
TAG_ACHIEVEMENT_INSTANCENAME[2626] = --[[!AUTO_651]]"『孤岛』"
TAG_ACHIEVEMENT_INSTANCENAME[2083] = --[[!AUTO_652]]"『覆灭』"
TAG_ACHIEVEMENT_INSTANCENAME[2638] = --[[!AUTO_653]]"『庄外』"
TAG_ACHIEVEMENT_INSTANCENAME[3048] = --[[!AUTO_654]]"『山崖』"
TAG_ACHIEVEMENT_INSTANCENAME[3049] = --[[!AUTO_655]]"『前哨』"
TAG_ACHIEVEMENT_INSTANCENAME[3050] = --[[!AUTO_656]]"『本营』"
TAG_ACHIEVEMENT_INSTANCENAME[3289] = --[[!AUTO_657]]"『连云』"
TAG_ACHIEVEMENT_INSTANCENAME[3046] = --[[!AUTO_658]]"『地牢』"
TAG_ACHIEVEMENT_INSTANCENAME[3635] = --[[!AUTO_1227]]"『宝塔』"
TAG_ACHIEVEMENT_INSTANCENAME[6230] = --[[!AUTO_1227]]"『古镇』"
TAG_ACHIEVEMENT_INSTANCENAME[6283] = --[[!AUTO_1227]]"『山路』"
TAG_ACHIEVEMENT_INSTANCENAME[6981] = --[[!AUTO_1227]]"『山巅』"


TAG_ACHIEVEMENT_INSTANCELEVEL_DEFAULT = --[[!AUTO_660]]"未知难度"
TAG_ACHIEVEMENT_INSTANCELEVEL = {}
TAG_ACHIEVEMENT_INSTANCELEVEL[1] = --[[!AUTO_661]]"普通难度"
TAG_ACHIEVEMENT_INSTANCELEVEL[2] = --[[!AUTO_662]]"侠客难度"
TAG_ACHIEVEMENT_INSTANCELEVEL[3] = --[[!AUTO_663]]"英雄难度"
TAG_ACHIEVEMENT_INSTANCELEVEL[4] = --[[!AUTO_664]]"盟主难度"
------------------------------------------------------

--------------------表情显示距离---------------------
-----------------Expression Configs------------------
EXPRESSION_TEXT_WAVE	= --[[!AUTO_665]]"挥手"
EXPRESSION_TEXT_ASK	= --[[!AUTO_666]]"请求"
EXPRESSION_TEXT_KNEE	= --[[!AUTO_667]]"下跪抱拳"
EXPRESSION_TEXT_DIRECT	= --[[!AUTO_668]]"手指前方"
EXPRESSION_TEXT_SALUTE	= --[[!AUTO_669]]"抱拳"
EXPRESSION_TEXT_SHY	= --[[!AUTO_670]]"害羞"
EXPRESSION_TEXT_ANGRE	= --[[!AUTO_671]]"发怒"
EXPRESSION_TEXT_SAD	= --[[!AUTO_672]]"伤心"
EXPRESSION_TEXT_CLAP	= --[[!AUTO_673]]"鼓掌"
EXPRESSION_TEXT_CHEER	= --[[!AUTO_674]]"欢呼"
EXPRESSION_TEXT_KISS	= --[[!AUTO_675]]"亲吻"
EXPRESSION_TEXT_DRINK	= --[[!AUTO_676]]"喝酒"
EXPRESSION_TEXT_EAT	= --[[!AUTO_677]]"吃肉"
EXPRESSION_TEXT_BEG	= --[[!AUTO_678]]"跪求"
EXPRESSION_TEXT_PUSHUP	= --[[!AUTO_679]]"俯卧撑"
EXPRESSION_TEXT_PASSBY	= --[[!AUTO_680]]"打酱油"
EXPRESSION_TEXT_SLEEP	= --[[!AUTO_681]]"睡觉"
EXPRESSION_TEXT_DRUNK	= --[[!AUTO_682]]"躺下喝酒"
EXPRESSION_TEXT_BOW	= --[[!AUTO_683]]"作揖"
EXPRESSION_TEXT_BORING	= --[[!AUTO_684]]"无聊"
EXPRESSION_TEXT_SCARED	= --[[!AUTO_685]]"害怕"
EXPRESSION_TEXT_GAMBLING_0	= --[[!AUTO_686]]"猜拳石头"
EXPRESSION_TEXT_GAMBLING_1	= --[[!AUTO_687]]"猜拳剪刀"
EXPRESSION_TEXT_GAMBLING_2	= --[[!AUTO_688]]"猜拳布"
EXPRESSION_TEXT_SHAKEHEAD	= --[[!AUTO_689]]"摇头拒绝"
EXPRESSION_TEXT_CUTE	= --[[!AUTO_690]]"装可爱"
EXPRESSION_TEXT_WALK	= --[[!AUTO_691]]"相依相偎走_绑定"
EXPRESSION_TEXT_RUN	= --[[!AUTO_692]]"相依相偎跑_绑定"
EXPRESSION_TEXT_JUMPUP	= --[[!AUTO_693]]"相依相偎跳起_绑定"
EXPRESSION_TEXT_JUMPHALF	= --[[!AUTO_694]]"相依相偎跳空中_绑定"
EXPRESSION_TEXT_JUMPDOWN	= --[[!AUTO_695]]"相依相偎跳落地_绑定"
EXPRESSION_TEXT_STAND	= --[[!AUTO_696]]"相依相偎站立_绑定"
EXPRESSION_TEXT_CLOSE	= --[[!AUTO_697]]"亲亲密密_绑定"
EXPRESSION_TEXT_SITDOWN	= "坐地上"
EXPRESSION_TEXT_HIDE	= "潜伏"
EXPRESSION_TEXT_TIP	= "求打赏"
------------------------------------------------------

--------------------舞蹈动作悬浮---------------------
--泡沫舞蹈
DANCE_8480_ACTION_1_HINT = "沫舞缤纷"
DANCE_8480_ACTION_1_ICON = "泡沫舞蹈.dds"
DANCE_8479_ACTION_1_HINT = "沫舞缤纷"
DANCE_8479_ACTION_1_ICON = "泡沫舞蹈.dds"
DANCE_8481_ACTION_1_HINT = "沫舞缤纷"
DANCE_8481_ACTION_1_ICON = "泡沫舞蹈.dds"

--东方姑娘舞蹈
DANCE_8716_ACTION_1_HINT = "醉舞东方"
DANCE_8716_ACTION_1_ICON = "东方舞蹈.dds"
DANCE_8957_ACTION_1_HINT = "雄霸天下"
DANCE_8957_ACTION_1_ICON = "任我行舞蹈.dds"

--仪琳舞蹈
DANCE_9653_ACTION_1_HINT = "刀影孤鸿"
DANCE_9653_ACTION_1_ICON = "田伯光舞蹈.dds"
DANCE_9654_ACTION_1_HINT = "浮生若梦"
DANCE_9654_ACTION_1_ICON = "仪琳舞蹈.dds"
DANCE_9655_ACTION_1_HINT = "醉舞东方"
DANCE_9655_ACTION_1_ICON = "东方舞蹈.dds"

--飞天舞蹈

DANCE_9742_ACTION_1_HINT = "落羽飞天"
DANCE_9742_ACTION_1_ICON = "落羽飞天.dds"
DANCE_9743_ACTION_1_HINT = "落羽飞天"
DANCE_9743_ACTION_1_ICON = "落羽飞天.dds"

--活动飞天舞蹈

DANCE_9891_ACTION_1_HINT = "落羽飞天"
DANCE_9891_ACTION_1_ICON = "落羽飞天.dds"
DANCE_9892_ACTION_1_HINT = "落羽飞天"
DANCE_9892_ACTION_1_ICON = "落羽飞天.dds"

--玛雅舞蹈

DANCE_9974_ACTION_1_HINT = "幻域迷城"
DANCE_9974_ACTION_1_ICON = "幻域迷城.dds"
DANCE_9975_ACTION_1_HINT = "幻域迷蝶"
DANCE_9975_ACTION_1_ICON = "幻域迷蝶.dds"
DANCE_9976_ACTION_1_HINT = "幻域迷蝶"
DANCE_9976_ACTION_1_ICON = "幻域迷蝶.dds"  

--东方姑娘舞蹈2016比赛
DANCE_10013_ACTION_1_HINT = "雄霸天下"
DANCE_10013_ACTION_1_ICON = "任我行舞蹈.dds"
DANCE_10011_ACTION_1_HINT = "醉舞东方"
DANCE_10011_ACTION_1_ICON = "东方舞蹈.dds"
DANCE_10012_ACTION_1_HINT = "醉舞东方"
DANCE_10012_ACTION_1_ICON = "东方舞蹈.dds"

--平之灵珊舞蹈
DANCE_10352_ACTION_1_HINT = "邪途腥辰"
DANCE_10352_ACTION_1_ICON = "平之舞蹈.dds"
DANCE_10353_ACTION_1_HINT = "碧水流云"
DANCE_10353_ACTION_1_ICON = "灵珊舞蹈.dds"
DANCE_10354_ACTION_1_HINT = "碧水流云"
DANCE_10354_ACTION_1_ICON = "灵珊舞蹈.dds"

--备用1舞蹈
DANCE_10472_ACTION_1_HINT = "璇霄丹阙"
DANCE_10472_ACTION_1_ICON = "14052璇霄丹阙.dds"
DANCE_10473_ACTION_1_HINT = "璇霄丹阙"
DANCE_10473_ACTION_1_ICON = "14052璇霄丹阙.dds"
DANCE_10474_ACTION_1_HINT = "璇霄丹阙"
DANCE_10474_ACTION_1_ICON = "14052璇霄丹阙.dds"

--备用3舞蹈
DANCE_10704_ACTION_1_HINT = "冬日暖阳"
DANCE_10704_ACTION_1_ICON = "14096冬日暖阳.dds"
DANCE_10705_ACTION_1_HINT = "冬日暖阳"
DANCE_10705_ACTION_1_ICON = "14096冬日暖阳.dds"
DANCE_10706_ACTION_1_HINT = "冬日暖阳"
DANCE_10706_ACTION_1_ICON = "14096冬日暖阳.dds"

--拳击舞蹈
DANCE_10996_ACTION_1_HINT = "拳击"
DANCE_10996_ACTION_1_ICON = "14167拳击舞蹈图标.dds"
DANCE_10997_ACTION_1_HINT = "拳击"
DANCE_10997_ACTION_1_ICON = "14167拳击舞蹈图标.dds"
DANCE_10998_ACTION_1_HINT = "拳击"
DANCE_10998_ACTION_1_ICON = "14167拳击舞蹈图标.dds"

--令狐冲任盈盈舞蹈
DANCE_11019_ACTION_1_HINT = "盈竹醉意"
DANCE_11019_ACTION_1_ICON = "14185令狐冲舞蹈图标.dds"
DANCE_11020_ACTION_1_HINT = "竹语琴音"
DANCE_11020_ACTION_1_ICON = "14186任盈盈舞蹈图标.dds"
DANCE_11021_ACTION_1_HINT = "竹语琴音"
DANCE_11021_ACTION_1_ICON = "14186任盈盈舞蹈图标.dds"

--英国足球舞蹈
DANCE_11114_ACTION_1_HINT = "花式足球"
DANCE_11114_ACTION_1_ICON = "14213足球.dds"
DANCE_11115_ACTION_1_HINT = "花式足球"
DANCE_11115_ACTION_1_ICON = "14213足球.dds"
DANCE_11116_ACTION_1_HINT = "花式足球"
DANCE_11116_ACTION_1_ICON = "14213足球.dds"

--德国足球舞蹈
DANCE_11117_ACTION_1_HINT = "花式足球"
DANCE_11117_ACTION_1_ICON = "14213足球.dds"
DANCE_11118_ACTION_1_HINT = "花式足球"
DANCE_11118_ACTION_1_ICON = "14213足球.dds"
DANCE_11119_ACTION_1_HINT = "花式足球"
DANCE_11119_ACTION_1_ICON = "14213足球.dds"

--巴西足球舞蹈
DANCE_11120_ACTION_1_HINT = "花式足球"
DANCE_11120_ACTION_1_ICON = "14213足球.dds"
DANCE_11121_ACTION_1_HINT = "花式足球"
DANCE_11121_ACTION_1_ICON = "14213足球.dds"
DANCE_11122_ACTION_1_HINT = "花式足球"
DANCE_11122_ACTION_1_ICON = "14213足球.dds"

--西班牙足球舞蹈
DANCE_11123_ACTION_1_HINT = "花式足球"
DANCE_11123_ACTION_1_ICON = "14213足球.dds"
DANCE_11124_ACTION_1_HINT = "花式足球"
DANCE_11124_ACTION_1_ICON = "14213足球.dds"
DANCE_11125_ACTION_1_HINT = "花式足球"
DANCE_11125_ACTION_1_ICON = "14213足球.dds"

--阿根廷足球舞蹈
DANCE_11126_ACTION_1_HINT = "花式足球"
DANCE_11126_ACTION_1_ICON = "14213足球.dds"
DANCE_11127_ACTION_1_HINT = "花式足球"
DANCE_11127_ACTION_1_ICON = "14213足球.dds"
DANCE_11128_ACTION_1_HINT = "花式足球"
DANCE_11128_ACTION_1_ICON = "14213足球.dds"

--恋曲舞蹈
DANCE_12039_ACTION_1_HINT = "爱恋如歌"
DANCE_12039_ACTION_1_ICON = "14406芭蕾舞蹈.dds"
DANCE_12040_ACTION_1_HINT = "爱恋如歌"
DANCE_12040_ACTION_1_ICON = "14406芭蕾舞蹈.dds"
DANCE_12041_ACTION_1_HINT = "爱恋如歌"
DANCE_12041_ACTION_1_ICON = "14406芭蕾舞蹈.dds"

--清秋舞蹈
DANCE_11248_ACTION_1_HINT = "西楚霸王"
DANCE_11248_ACTION_1_ICON = "14298霸王别姬舞蹈男图标.dds"
DANCE_11249_ACTION_1_HINT = "虞美人"
DANCE_11249_ACTION_1_ICON = "14299霸王别姬舞蹈女图标.dds"
DANCE_11250_ACTION_1_HINT = "虞美人"
DANCE_11250_ACTION_1_ICON = "14299霸王别姬舞蹈女图标.dds"

--青烟舞蹈
DANCE_12064_ACTION_1_HINT = "情丝缭绕"
DANCE_12064_ACTION_1_ICON = "02634金蛇狂舞.dds"
DANCE_12065_ACTION_1_HINT = "情丝缭绕"
DANCE_12065_ACTION_1_ICON = "02634金蛇狂舞.dds"

--蓝凤舞蹈
DANCE_12238_ACTION_1_HINT = "凤舞九天"
DANCE_12238_ACTION_1_ICON = "13739商城孔雀坐骑初级.dds"
DANCE_12239_ACTION_1_HINT = "凤舞九天"
DANCE_12239_ACTION_1_ICON = "13739商城孔雀坐骑初级.dds"

--平底锅舞蹈
DANCE_12356_ACTION_1_HINT = "魔性抖肩"
DANCE_12356_ACTION_1_ICON = "14695平底锅舞蹈.dds"
DANCE_12357_ACTION_1_HINT = "魔性抖肩"
DANCE_12357_ACTION_1_ICON = "14695平底锅舞蹈.dds"

--哪吒&白龙舞蹈
DANCE_12360_ACTION_1_HINT = "佛沐火莲"
DANCE_12360_ACTION_1_ICON = "14696佛沐火莲舞蹈.dds"
DANCE_12361_ACTION_1_HINT = "佛沐火莲"
DANCE_12361_ACTION_1_ICON = "14696佛沐火莲舞蹈.dds"
DANCE_12362_ACTION_1_HINT = "雪域飞龙"
DANCE_12362_ACTION_1_ICON = "14697雪域火龙舞蹈.dds"
DANCE_12363_ACTION_1_HINT = "雪域飞龙"
DANCE_12363_ACTION_1_ICON = "14697雪域火龙舞蹈.dds"

--风尚舞蹈
DANCE_12400_ACTION_1_HINT = "随心舞悦"
DANCE_12400_ACTION_1_ICON = "14731随心舞悦舞蹈.dds"
DANCE_12401_ACTION_1_HINT = "随心舞悦"
DANCE_12401_ACTION_1_ICON = "14731随心舞悦舞蹈.dds"

--姝颜千翊舞蹈
DANCE_12690_ACTION_1_HINT = "姝颜千诩"
DANCE_12690_ACTION_1_ICON = "14982千诩姝颜舞蹈.dds"
DANCE_12691_ACTION_1_HINT = "姝颜千诩"
DANCE_12691_ACTION_1_ICON = "14982千诩姝颜舞蹈.dds"
DANCE_12692_ACTION_1_HINT = "姝颜千诩"
DANCE_12692_ACTION_1_ICON = "14982千诩姝颜舞蹈.dds"
DANCE_12693_ACTION_1_HINT = "姝颜千诩"
DANCE_12693_ACTION_1_ICON = "14982千诩姝颜舞蹈.dds"
--极乐净土舞蹈
DANCE_12837_ACTION_1_HINT = "魔力圈圈"
DANCE_12837_ACTION_1_ICON = "15118极乐净土舞蹈.dds"
DANCE_12845_ACTION_1_HINT = "魔力圈圈"
DANCE_12845_ACTION_1_ICON = "15118极乐净土舞蹈.dds"
DANCE_12846_ACTION_1_HINT = "魔力圈圈"
DANCE_12846_ACTION_1_ICON = "15118极乐净土舞蹈.dds"
DANCE_12847_ACTION_1_HINT = "魔力圈圈"
DANCE_12847_ACTION_1_ICON = "15118极乐净土舞蹈.dds"
------------------------------------------------------

---------结交界面判断缘分指数用-----------------------
ZODIAC={}
ZODIAC[1]={--[[!AUTO_698]]"白羊座",5,9,7}
ZODIAC[2]={--[[!AUTO_699]]"金牛座",6,10,8}
ZODIAC[3]={--[[!AUTO_700]]"双子座",11,7,9}
ZODIAC[4]={--[[!AUTO_701]]"巨蟹座",12,8,10}
ZODIAC[5]={--[[!AUTO_702]]"狮子座",9,1,11}
ZODIAC[6]={--[[!AUTO_703]]"处女座",10,2,12}
ZODIAC[7]={--[[!AUTO_704]]"天秤座",3,11,1}
ZODIAC[8]={--[[!AUTO_705]]"天蝎座",4,12,2}
ZODIAC[9]={--[[!AUTO_706]]"射手座",1,5,3}
ZODIAC[10]={--[[!AUTO_707]]"摩羯座",6,2,4}
ZODIAC[11]={--[[!AUTO_708]]"水瓶座",7,3,5}
ZODIAC[12]={--[[!AUTO_709]]"双鱼座",8,4,6}

-----------------场景名称信息---------------------------------------
--------------------------------------------------------------------
SceneNameInfo={}
SceneNameInfo[1]=
{
	name = --[[!AUTO_710]]"南北村",
	zone =
	{
		[1201] = {name = --[[!AUTO_711]]"新手村"},
		[1202] = {name = --[[!AUTO_712]]"兰亭"},
		[1203] = {name = --[[!AUTO_713]]"茶棚"},
	}
}
SceneNameInfo[2]=
{
	name = --[[!AUTO_714]]"福州城",
	zone =
	{
		[2201] = {name = --[[!AUTO_715]]"福州城"},
	}
}
SceneNameInfo[3]=
{
	name = --[[!AUTO_716]]"梅关古道",
	zone =
	{
		[2201] = {name = --[[!AUTO_717]]"福州城"},
	}
}
SceneNameInfo[4]=
{
	name = --[[!AUTO_718]]"衡山城",
	zone =
	{
		[4201] = {name = --[[!AUTO_719]]"衡山城"},
	}
}
SceneNameInfo[5]=
{
	name = --[[!AUTO_720]]"衡山派",
	zone =
	{
		[5201] = {name = --[[!AUTO_721]]"衡山派", dayamb = 3, nightamb = 3, bgm = {40}},
		[5101] = {name = --[[!AUTO_722]]"烟霞楼", dayamb = 3, nightamb = 3, bgm = {40}},
		[5102] = {name = --[[!AUTO_723]]"芙蓉坪", dayamb = 3, nightamb = 3, bgm = {40}},
		[5103] = {name = --[[!AUTO_724]]"石禀峰", dayamb = 3, nightamb = 3, bgm = {40}},
		[5104] = {name = --[[!AUTO_725]]"紫盖峰", dayamb = 3, nightamb = 3, bgm = {40}},
		[5105] = {name = --[[!AUTO_726]]"磨镜台", dayamb = 3, nightamb = 3, bgm = {40}},
		[5106] = {name = --[[!AUTO_727]]"祝融堂", dayamb = 3, nightamb = 3, bgm = {40}},
		[5107] = {name = --[[!AUTO_728]]"圣帝殿", dayamb = 3, nightamb = 3, bgm = {40}},
	}
}
SceneNameInfo[6]=
{
	name = --[[!AUTO_729]]"武当派",
	zone =
	{
		[6201] = {name = --[[!AUTO_730]]"武当派"},
		[6101] = {name = --[[!AUTO_731]]"太玄阵"},
		[6102] = {name = --[[!AUTO_732]]"真武台"},
		[6103] = {name = --[[!AUTO_733]]"紫霄殿"},
		[6104] = {name = --[[!AUTO_734]]"解剑池"},
		[6105] = {name = --[[!AUTO_735]]"天柱峰"},
		[6106] = {name = --[[!AUTO_736]]"铸剑房"},
		[6107] = {name = --[[!AUTO_737]]"玉虚宫"},
	}
}
SceneNameInfo[7]=
{
	name = --[[!AUTO_738]]"武当山",
	zone =
	{
		[7201] = {name = --[[!AUTO_739]]"武当山", dayamb = 6, nightamb = 6, bgm = {39}},
		[7101] = {name = --[[!AUTO_740]]"凤鸣丘", dayamb = 6, nightamb = 6, bgm = {39}},
		[7102] = {name = --[[!AUTO_741]]"军店河东岸", dayamb = 6, nightamb = 6, bgm = {39}},
		[7103] = {name = --[[!AUTO_742]]"军店河", dayamb = 6, nightamb = 6, bgm = {39}},
		[7104] = {name = --[[!AUTO_743]]"六里埠", dayamb = 6, nightamb = 6, bgm = {39}},
		[7105] = {name = --[[!AUTO_744]]"凝翠林", dayamb = 6, nightamb = 6, bgm = {39}},
		[7106] = {name = --[[!AUTO_745]]"听风坪", dayamb = 6, nightamb = 6, bgm = {39}},
		[7107] = {name = --[[!AUTO_746]]"武当山道", dayamb = 6, nightamb = 6, bgm = {39}},
		[7108] = {name = --[[!AUTO_747]]"夜阑岗", dayamb = 6, nightamb = 6, bgm = {39}},
	}
}
SceneNameInfo[11]=
{
	name = --[[!AUTO_748]]"药王庙",
	zone =
	{
		[11201] = {name = --[[!AUTO_749]]"药王庙"},
	}
}
SceneNameInfo[12]=
{
	name = --[[!AUTO_750]]"洛阳城",
	zone =
	{
		[12201] = {name = --[[!AUTO_751]]"洛阳城"},
		[12202] = {name = --[[!AUTO_752]]"洛河"},
		[12203] = {name = --[[!AUTO_753]]"洛阳北郊"},
		[12204] = {name = --[[!AUTO_754]]"洛阳西郊"},
		[12205] = {name = --[[!AUTO_755]]"洛阳南郊"},
		[12206] = {name = --[[!AUTO_756]]"洛阳东郊"},
		[12102] = {name = --[[!AUTO_757]]"洛阳府"},
		[12103] = {name = --[[!AUTO_758]]"洛阳东城"},
		[12104] = {name = --[[!AUTO_759]]"洛阳西城"},
		[12105] = {name = --[[!AUTO_760]]"绿竹巷"},
		[12106] = {name = --[[!AUTO_761]]"铜陀街"},
	}
}
SceneNameInfo[13]=
{
	name = --[[!AUTO_762]]"嵩山",
	zone =
	{
		[13201] = {name = --[[!AUTO_763]]"嵩山"},
		[13101] = {name = --[[!AUTO_764]]"卢崖双瀑"},
		[13102] = {name = --[[!AUTO_765]]"玉溪台"},
		[13103] = {name = --[[!AUTO_766]]"嵩阳驿"},
		[13104] = {name = --[[!AUTO_767]]"少林河"},
		[13105] = {name = --[[!AUTO_768]]"胜观峰"},
		[13106] = {name = --[[!AUTO_769]]"夕照湾"},
	}
}
SceneNameInfo[15]=
{
	name = --[[!AUTO_770]]"少林寺",
	zone =
	{
		[15201] = {name = --[[!AUTO_771]]"少林寺", dayamb = 7, nightamb = 7, bgm = {23}},
		[15101] = {name = --[[!AUTO_772]]"藏经阁", dayamb = 7, nightamb = 7, bgm = {23}},
		[15102] = {name = --[[!AUTO_773]]"达摩洞", dayamb = 7, nightamb = 7, bgm = {23}},
		[15103] = {name = --[[!AUTO_774]]"大雄宝殿", dayamb = 7, nightamb = 7, bgm = {23}},
		[15104] = {name = --[[!AUTO_775]]"罗汉堂", dayamb = 7, nightamb = 7, bgm = {23}},
		[15105] = {name = --[[!AUTO_776]]"诵经台", dayamb = 7, nightamb = 7, bgm = {23}},
		[15106] = {name = --[[!AUTO_777]]"香积厨", dayamb = 7, nightamb = 7, bgm = {23}},
		[15107] = {name = --[[!AUTO_778]]"证道院", dayamb = 7, nightamb = 7, bgm = {23}},
	}
}
SceneNameInfo[16]=
{
	name = --[[!AUTO_779]]"仙愁峡",
	zone =
	{
		[16201] = {name = --[[!AUTO_780]]"仙愁峡", dayamb = 2, nightamb = 2, bgm = {19}},
		[16101] = {name = --[[!AUTO_781]]"断肠谷", dayamb = 2, nightamb = 2, bgm = {19}},
		[16102] = {name = --[[!AUTO_782]]"六乔寨", dayamb = 2, nightamb = 2, bgm = {19}},
		[16103] = {name = --[[!AUTO_783]]"落雪庄", dayamb = 2, nightamb = 2, bgm = {19}},
		[16104] = {name = --[[!AUTO_784]]"昙花草庐", dayamb = 2, nightamb = 2, bgm = {19}},
		[16105] = {name = --[[!AUTO_785]]"望谷楼", dayamb = 2, nightamb = 2, bgm = {19}},
		[16106] = {name = --[[!AUTO_786]]"遇龙崖", dayamb = 2, nightamb = 2, bgm = {19}},
	}
}
SceneNameInfo[17]=
{
	name = --[[!AUTO_787]]"余杭",
	zone =
	{
		[17201] = {name = --[[!AUTO_788]]"余杭", dayamb = 1, nightamb = 1, bgm = {20}},
		[17101] = {name = --[[!AUTO_789]]"安乐塔", dayamb = 1, nightamb = 1, bgm = {20}},
		[17102] = {name = --[[!AUTO_790]]"黄土陵", dayamb = 1, nightamb = 1, bgm = {20}},
		[17103] = {name = --[[!AUTO_791]]"清风浦", dayamb = 1, nightamb = 1, bgm = {20}},
		[17104] = {name = --[[!AUTO_792]]"桑园埂", dayamb = 1, nightamb = 1, bgm = {20}},
		[17105] = {name = --[[!AUTO_793]]"舒公塔", dayamb = 1, nightamb = 1, bgm = {20}},
		[17106] = {name = --[[!AUTO_794]]"余杭镇", dayamb = 1, nightamb = 1, bgm = {20}},
	}
}
SceneNameInfo[18]=
{
	name = --[[!AUTO_795]]"逍遥派",
	zone =
	{
		[18201] = {name = --[[!AUTO_796]]"逍遥派", dayamb = 7, nightamb = 7, bgm = {41}},
		[18101] = {name = --[[!AUTO_797]]"藏翠峰", dayamb = 7, nightamb = 7, bgm = {41}},
		[18102] = {name = --[[!AUTO_798]]"观天崖", dayamb = 7, nightamb = 7, bgm = {41}},
		[18103] = {name = --[[!AUTO_799]]"涵虚水阁", dayamb = 7, nightamb = 7, bgm = {41}},
		[18104] = {name = --[[!AUTO_800]]"玲珑小筑", dayamb = 7, nightamb = 7, bgm = {41}},
		[18105] = {name = --[[!AUTO_801]]"沐心坊", dayamb = 7, nightamb = 7, bgm = {41}},
		[18106] = {name = --[[!AUTO_802]]"漱玉涧", dayamb = 7, nightamb = 7, bgm = {41}},
		[18107] = {name = --[[!AUTO_803]]"摘星亭", dayamb = 7, nightamb = 7, bgm = {41}},
	}
}
SceneNameInfo[19]=
{
	name = --[[!AUTO_804]]"仙霞岭",
	zone =
	{
		[19201] = {name = --[[!AUTO_805]]"仙霞岭", dayamb = 1, nightamb = 1, bgm = {30}},
	}
}
SceneNameInfo[21]=
{
	name = --[[!AUTO_806]]"铸剑谷",
	zone =
	{
		[21201] = {name = --[[!AUTO_807]]"铸剑谷", dayamb = 6, nightamb = 6, bgm = {21}},
	}
}
SceneNameInfo[22]=
{
	name = --[[!AUTO_808]]"龙泉",
	zone =
	{
		[22201] = {name = --[[!AUTO_809]]"龙泉", dayamb = 1, nightamb = 1, bgm = {16}},
	}
}
SceneNameInfo[24]=
{
	name = --[[!AUTO_810]]"杭州城",
	zone =
	{
		[24201] = {name = --[[!AUTO_811]]"杭州城", dayamb = 3, nightamb = 3, bgm = {15}},
		[24101] = {name = --[[!AUTO_812]]"风波府", dayamb = 3, nightamb = 3, bgm = {15}},
		[24102] = {name = --[[!AUTO_813]]"河坊街", dayamb = 3, nightamb = 3, bgm = {15}},
		[24103] = {name = --[[!AUTO_814]]"灵隐寺", dayamb = 3, nightamb = 3, bgm = {15}},
		[24104] = {name = --[[!AUTO_815]]"钱塘西苑", dayamb = 3, nightamb = 3, bgm = {15}},
		[24105] = {name = --[[!AUTO_816]]"苏公堤", dayamb = 3, nightamb = 3, bgm = {15}},
		[24106] = {name = --[[!AUTO_817]]"望江门", dayamb = 3, nightamb = 3, bgm = {15}},
	}
}
SceneNameInfo[32]=
{
	name = --[[!AUTO_818]]"蜀南竹海",
	zone =
	{
		[32201] = {name = --[[!AUTO_819]]"蜀南竹海", dayamb = 1, nightamb = 1, bgm = {32}},
	}
}
SceneNameInfo[36]=
{
	name = --[[!AUTO_820]]"恒山派",
	zone =
	{
		[36201] = {name = --[[!AUTO_821]]"恒山派", dayamb = 3, nightamb = 3, bgm = {31}},
		[36101] = {name = --[[!AUTO_822]]"白云庵", dayamb = 3, nightamb = 3, bgm = {31}},
		[36102] = {name = --[[!AUTO_823]]"磁窑口", dayamb = 3, nightamb = 3, bgm = {31}},
		[36103] = {name = --[[!AUTO_824]]"翠屏山", dayamb = 3, nightamb = 3, bgm = {31}},
		[36104] = {name = --[[!AUTO_825]]"见性峰", dayamb = 3, nightamb = 3, bgm = {31}},
		[36105] = {name = --[[!AUTO_826]]"通元谷", dayamb = 3, nightamb = 3, bgm = {31}},
		[36106] = {name = --[[!AUTO_827]]"无色庵", dayamb = 3, nightamb = 3, bgm = {31}},
		[36107] = {name = --[[!AUTO_828]]"悬空寺", dayamb = 3, nightamb = 3, bgm = {31}},
	}
}
SceneNameInfo[37]=
{
	name = --[[!AUTO_829]]"朱仙镇",
	zone =
	{
		[37201] = {name = --[[!AUTO_830]]"朱仙镇"},
		[37202] = {name = --[[!AUTO_831]]"武穆梯田"},
		[37203] = {name = --[[!AUTO_832]]"贾鲁河西岸"},
		[37204] = {name = --[[!AUTO_833]]"贾鲁河东岸"},
		[37205] = {name = --[[!AUTO_834]]"横翠坡"},
		[37206] = {name = --[[!AUTO_835]]"艳阳林"},
		[37207] = {name = --[[!AUTO_836]]"仙踪崖"},
		[37208] = {name = --[[!AUTO_837]]"仙人庄"},
		[37209] = {name = --[[!AUTO_838]]"卧虎坪"},
		[37210] = {name = --[[!AUTO_839]]"岳王庙"},
		[37211] = {name = --[[!AUTO_840]]"藏龙岗"},
		[37212] = {name = --[[!AUTO_841]]"望河坡"},
		[37213] = {name = --[[!AUTO_842]]"平一指"},
	}
}
SceneNameInfo[38]=
{
	name = --[[!AUTO_843]]"五霸岗",
	zone =
	{
		[38201] = {name = --[[!AUTO_844]]"五霸岗"},
	}
}
SceneNameInfo[39]=
{
	name = --[[!AUTO_845]]"泰山",
	zone =
	{
		[39201] = {name = --[[!AUTO_846]]"泰山"},
	}
}
SceneNameInfo[54]=
{
	name = --[[!AUTO_847]]"临江镇",
	zone =
	{
	}
}
SceneNameInfo[1001]=
{
	name = --[[!AUTO_848]]"绿竹林",
	zone =
	{
		[1001201] = {name = --[[!AUTO_849]]"绿竹林"},
		[1001202] = {name = --[[!AUTO_850]]"绿竹林"},
	}
}
SceneNameInfo[1002]=
{
	name = --[[!AUTO_851]]"药王秘洞",
	zone =
	{
		[1002201] = {name = --[[!AUTO_852]]"药王秘洞"},
		[1002202] = {name = --[[!AUTO_853]]"萤石穴"},
		[1002203] = {name = --[[!AUTO_854]]"回天坛"},
		[1002204] = {name = --[[!AUTO_855]]"药王冢"},
		[1002205] = {name = --[[!AUTO_856]]"百草堂"},
	}
}
SceneNameInfo[9001]=
{
	name = --[[!AUTO_857]]"测试场景",
	zone =
	{
		[9001201] = {name = --[[!AUTO_858]]"打木桩"},
		[9001202] = {name = --[[!AUTO_859]]"测模型"},
	}
}
SceneNameInfo[9002]=
{
	name = --[[!AUTO_860]]"角色列表",
	zone =
	{
		[9002201] = {name = --[[!AUTO_861]]"少室山脚"},
		[9002202] = {name = --[[!AUTO_862]]"龙隐原"},
		[9002203] = {name = --[[!AUTO_863]]"悠然桥"},
		[9002204] = {name = --[[!AUTO_864]]"悠然亭"},
		[9002205] = {name = --[[!AUTO_865]]"仙愁峡"},
	}
}
SceneNameInfo[9003]=
{
	name = --[[!AUTO_866]]"兰封镇",
	zone =
	{
		[9003101] = {name = --[[!AUTO_867]]"兰封驿站"},
		[9003201] = {name = --[[!AUTO_868]]"兰封镇"},
		[9003202] = {name = --[[!AUTO_869]]"夜阑岗"},
		[9003203] = {name = --[[!AUTO_870]]"柴槐林"},
		[9003204] = {name = --[[!AUTO_871]]"黛螺小路"},
		[9003205] = {name = --[[!AUTO_872]]"碧影坪"},
		[9003206] = {name = --[[!AUTO_873]]"碧影山涧"},
		[9003207] = {name = --[[!AUTO_874]]"花语坛"},
		[9003208] = {name = --[[!AUTO_875]]"凝翠林"},
		[9003209] = {name = --[[!AUTO_876]]"听风坪"},
		[9003210] = {name = --[[!AUTO_877]]"悠扬阡陌"},
	}
}

--宠物随机帮助提示文本
PET_RANDOM_HELP_TEXT = {}
PET_RANDOM_HELP_TEXT[1] = --[[!AUTO_878]]"门徒加点,全加资质最高的那种点上,应该大概也许不会错吧。"
PET_RANDOM_HELP_TEXT[2] = --[[!AUTO_879]]"点击门徒头像旁边的喂食按钮，门徒就会自己找寻药品服用。"
PET_RANDOM_HELP_TEXT[3] = --[[!AUTO_880]]"续命丸一直只是江湖传说，不过前些天有人从赛孟尝给的彩盒内发现了好几枚。"
PET_RANDOM_HELP_TEXT[4] = --[[!AUTO_881]]"冯梦龙的门徒小李，最近吃了几颗灵丹，资质涨了一大截，连福威镖局的老镖师没打过他。"
PET_RANDOM_HELP_TEXT[5] = --[[!AUTO_882]]"出战的门徒，无论是否面对敌人，怒气都在增加，就像愤怒的小马。"
PET_RANDOM_HELP_TEXT[6] = --[[!AUTO_883]]"评分高的门徒不一定是最好的，但好的门徒评分一定很高。希望你了解我说的意思。"
PET_RANDOM_HELP_TEXT[7] = --[[!AUTO_884]]"如果你害怕你的门徒被人拐骗走，去给门徒申请身份卡吧！那样写寻人启示也能方便些。"
PET_RANDOM_HELP_TEXT[8] = --[[!AUTO_885]]"只有真正优质的门徒，相关部门才允许发放身份卡的！主人有背景的除外。"
PET_RANDOM_HELP_TEXT[9] = --[[!AUTO_886]]"城中富豪赛孟尝正在招募门徒，推荐门徒可换取其家中珍藏之物。"
PET_RANDOM_HELP_TEXT[10] = --[[!AUTO_887]]"携带优质血统且历练超过60的非普通门徒，正是赛孟尝需要的，他愿用珍藏之物交换。"
PET_RANDOM_HELP_TEXT[11] = --[[!AUTO_888]]"孟尝君信赖评分，遇到评分高的门徒，他会显得更真诚一些。"
PET_RANDOM_HELP_TEXT[12] = --[[!AUTO_889]]"历练少的门徒，通常会受到一些轻视，即便他很有潜力。"
PET_RANDOM_HELP_TEXT[13] = --[[!AUTO_890]]"所有的贵族都认同血统，孟尝君也不例外，这是他们天生的优越感。"
PET_RANDOM_HELP_TEXT[14] = --[[!AUTO_891]]"门徒前15级是领悟技能的黄金时期，过了这个阶段要再领悟技能就难了。"
PET_RANDOM_HELP_TEXT[15] = --[[!AUTO_892]]"悟性高的门徒无论学技能还是学心法，成功几率总是高些。"
PET_RANDOM_HELP_TEXT[16] = --[[!AUTO_893]]"门徒把心法传授给他人后，就会心力交瘁，精力不济，阳寿殆尽。"
PET_RANDOM_HELP_TEXT[17] = --[[!AUTO_894]]"技艺传授的时候用上一个清心符，保准事半功倍。"
PET_RANDOM_HELP_TEXT[18] = --[[!AUTO_895]]"丹书习技的时候使用前辈秘诀，对门徒可大有好处。（提示：门徒最多拥有一个群体招式）"
PET_RANDOM_HELP_TEXT[19] = --[[!AUTO_896]]"赛孟尝最近从西域运来一堆醉生梦死酒，据说喝了此酒前尘旧事全忘光光。"
PET_RANDOM_HELP_TEXT[20] = --[[!AUTO_897]]"看清楚你的门徒擅长内功还是外功，不要逼他学习他不擅长的技能。"
PET_RANDOM_HELP_TEXT[21] = --[[!AUTO_898]]"门徒到10级才能看出他的主血统是啥，到20级才能看出他还有些什么其他血统。"
PET_RANDOM_HELP_TEXT[22] = --[[!AUTO_899]]"有血统的门徒资质会按百分比提高！"
PET_RANDOM_HELP_TEXT[23] = --[[!AUTO_900]]"上古神的血统就是牛，还能激发天赋。"
PET_RANDOM_HELP_TEXT[24] = --[[!AUTO_901]]"血统浓度越高，血统越尊贵，对资质的提升效果越明显。"
PET_RANDOM_HELP_TEXT[25] = --[[!AUTO_902]]"门徒一辈子也就4次推宫换血的机会，真得好好珍惜。"
PET_RANDOM_HELP_TEXT[26] = --[[!AUTO_903]]"上古神的血统有吞噬能力，会吞噬掉他不喜欢的其他血统。"
PET_RANDOM_HELP_TEXT[27] = --[[!AUTO_904]]"两种血统之间能否合化是确定的，就跟雌雄才能配对一样确定。"
PET_RANDOM_HELP_TEXT[28] = --[[!AUTO_905]]"一样的血统，一旦遇到就会累加在一起。"
PET_RANDOM_HELP_TEXT[29] = --[[!AUTO_906]]"门徒的气血越低，就越脆弱，这个时候你无论擒获还是威吓还是招揽，都比较容易成功。"
PET_RANDOM_HELP_TEXT[30] = --[[!AUTO_907]]"宝宝比普通厉害，宝宝没有变异厉害。你说普通门徒，宝宝门徒，变异门徒，谁最厉害？"
PET_RANDOM_HELP_TEXT[31] = --[[!AUTO_908]]"没有门徒愿意投靠比自己历练低的人！"
PET_RANDOM_HELP_TEXT[32] = --[[!AUTO_909]]"对付吃软不吃硬的门徒，最好是招揽；吃硬不吃软的就只好威吓啦。"
PET_RANDOM_HELP_TEXT[33] = --[[!AUTO_910]]"身上常备猎狐香，遇到老虎也不怕！"
PET_RANDOM_HELP_TEXT[34] = --[[!AUTO_911]]"赛孟尝对门徒之道颇有研究，家里常备擒获秘籍，威吓秘籍，招揽秘籍，有意者可前往选购。"
PET_RANDOM_HELP_TEXT[35] = --[[!AUTO_912]]"有些门徒喜欢下雪，有些喜欢下雨，你不能改变他们的出行习惯，但可以改变自己的。"
PET_RANDOM_HELP_TEXT[36] = --[[!AUTO_913]]"去万兽谷捕兽，去聚贤庄招人，去少室山礼佛，去华山顶论剑。"
PET_RANDOM_HELP_TEXT[37] = --[[!AUTO_914]]"没空和朋友见面，派门徒去串串门打个招呼什么的，对保持好感很有好处！"
PET_RANDOM_HELP_TEXT[38] = --[[!AUTO_915]]"身为大侠亲自动手翻包裹实在有失身份，还是交给门徒去做吧。"
PET_RANDOM_HELP_TEXT[39] = --[[!AUTO_916]]"我知道有类门徒消息灵通，只要告诉他要找谁，他天涯海角都能追踪到。"
PET_RANDOM_HELP_TEXT[40] = --[[!AUTO_917]]"装备损坏了还回城找铁匠？你真OUT啦，找个会修理的门徒带在身边才是宗师。"
PET_RANDOM_HELP_TEXT[41] = --[[!AUTO_918]]"门徒精力不济的时候，是没法再帮你打点生活事宜的。"
PET_RANDOM_HELP_TEXT[42] = --[[!AUTO_919]]"当门徒历练超过你10级，他会拒绝和你并肩作战！"
PET_RANDOM_HELP_TEXT[43] = --[[!AUTO_920]]"我不知道为什么有人认为一个阳寿已尽的门徒还能出来战斗。"
PET_RANDOM_HELP_TEXT[44] = --[[!AUTO_921]]"门徒受到重创后，休息5分钟，就能再次出战！不过最好让他们多调息一会。"
PET_RANDOM_HELP_TEXT[45] = --[[!AUTO_922]]"安排门徒训练后，就让人家好好训练，忽然打断会让训练毫无成效。"
PET_RANDOM_HELP_TEXT[46] = --[[!AUTO_923]]"人物到45级，气场才能强大到可以将门徒的气息完全遮掩，这时门徒就能在暗中助你杀敌。"
PET_RANDOM_HELP_TEXT[47] = --[[!AUTO_924]]"在门徒界面点选头像设定默认召出门徒后，按“”键就能一键呼出。"


-- 宠物帮助相关
Help_InfoText = {
	PetInfo = {
		[1] = --[[!AUTO_925]]"{一、门徒基础知识}",
		[2] = --[[!AUTO_926]]"{二、从哪里获得门徒？}",
		[3] = --[[!AUTO_927]]"{三、门徒主要作用？}",
		[4] = --[[!AUTO_928]]"{四、影响门徒能力的主要属性？}",
		[5] = --[[!AUTO_929]]"{五、门徒招式介绍}",
                [6] = --[[!AUTO_930]]"{六、设置默认出战门徒以及出战快捷键}",
	},
	EquipServCompose = {
		[1] = --[[!AUTO_931]]"{一、装备淬炼的作用？}",
		[2] = --[[!AUTO_932]]"{二、装备淬炼基础知识}",
		[3] = --[[!AUTO_933]]"{三、装备淬炼功能如何使用？}",
		[4] = --[[!AUTO_934]]"{四、装备淬炼技巧？}",
	},
	EquipServStoneCompose = {
		[1] = --[[!AUTO_935]]"{一、宝石合成的作用？}",
		[2] = --[[!AUTO_936]]"{二、宝石合成基础知识}",
		[3] = --[[!AUTO_937]]"{三、宝石合成功能如何使用？}",
	},
	GuildInfo = {
		[1] = --[[!AUTO_938]]"{一、帮派二三事}",
		[2] = --[[!AUTO_939]]"{二、关于帮派发展的事儿}",
		[3] = --[[!AUTO_940]]"{三、运镖玩法}",
		[4] = --[[!AUTO_941]]"{四、劫镖玩法}",
	},

	friendlyInfo = {
		[1] = --[[!AUTO_942]]"{1. 好友度是什么？}",
		[2] = --[[!AUTO_943]]"{2. 怎么获得好友度？}",
		[3] = --[[!AUTO_944]]"{3. 好友度的用处？}",
	},
	factionCreateItemInfo = {
		[1] = --[[!AUTO_945]]"{什么地方可以获得升龙令？}",

	},
	starSystemUpInfo = {
		[1] = --[[!AUTO_946]]"{一. 《笑傲英雄谱》是什么？}",
		[2] = --[[!AUTO_947]]"{二. 如何成为笑傲英雄？}",
		[3] = --[[!AUTO_948]]"{三. 成为笑傲英雄又如何？}",
	},

	factionLvUpInfo = {
		[1] = --[[!AUTO_949]]"{帮派怎么升级？}",
	},
}

Help_AllText = {}
Help_AllText["Win_PetProperty"] 				= {Help_InfoText.PetInfo}
Help_AllText["Win_EquipServ_Compose"] 			= {Help_InfoText.EquipServCompose}
Help_AllText["Win_EquipServ_StoneCompose"] 		= {Help_InfoText.EquipServStoneCompose}
Help_AllText["Win_FactionMain"] 				= {Help_InfoText.GuildInfo}
Help_AllText["Win_FactionCreateApply"] 			= {Help_InfoText.GuildInfo}
Help_AllText["Win_FacebookOther"] 				= {Help_InfoText.friendlyInfo}
Help_AllText["FactionCreateItem"] 				= {Help_InfoText.factionCreateItemInfo}
Help_AllText["FactionLvUpInfo"] 				= {Help_InfoText.factionLvUpInfo}
Help_AllText["Win_StarFrame"] 					= {Help_InfoText.starSystemUpInfo}
Help_AllText["Win_AutoPlayBase"] 				= {Help_InfoText.PetInfo}


Help_AllConfig = {}
Help_AllConfig["Win_EquipServ_Compose"] = {--[[!AUTO_950]]"Win_PetProperty", --[[!AUTO_951]]"Control_Lab_Name", 444, 2}
Help_AllConfig["Win_PetProperty"] = {--[[!AUTO_952]]"Win_PetProperty", --[[!AUTO_953]]"Control_Lab_Name", 444, 2}
Help_AllConfig["Win_Message4"] = {--[[!AUTO_954]]"Win_Message4", --[[!AUTO_955]]"Btn_Back", 444, 2}
Help_AllConfig["Win_InstanceInfoTips"] = {--[[!AUTO_956]]"Win_InstanceInfoTips", --[[!AUTO_957]]"Txt_MainInfo", 444, 2}

Help_DialogConfig = {}
-- 颜色配置
color = {}
color["紫色"] = 0xff00ff
color["蓝色"] = 0x00ffff
color["橙色"] = 0xff8000
color["红色"] = 0xff0000
color["粉色"] = 0xff95ff
color["白色"] = 0xffffff


-- 笑傲关键词列表
--[[#tag push from_excel]]
Help_KeyWord = {}
Help_KeyWord["{一、门徒基础知识}"] =
{
title = "一、门徒基础知识",
color = color["白色"],
text = "{1.门徒名称}\r{2.门徒类型}\r{3.门徒出战条件}\r{4.门徒战斗倾向}\r{5.门徒忠诚度}",
NPC = 0
}

Help_KeyWord["{1.门徒名称}"] =
{
title = "1.门徒名称",
color = color["白色"],
text = "    您可以为自己的门徒起十分个性的名字，^FFBF4F字数最多为8个。^ffffff",
NPC = 0
}

Help_KeyWord["{2.门徒类型}"] =
{
title = "2.门徒类型",
color = color["白色"],
text = "    门徒类型分为3种：^FFBF4F鸟兽，随从，知己^ffffff\r不同类型的门徒需要使用不同的方式获得：\r1. ^0070c0鸟兽：^ffffff击败某些动物后对出现的可擒获的温驯动物使用^FFBF4F猎狐香。^ffffff\r2. ^0070c0随从：^ffffff击败某些江湖人士后对出现的可招揽的追随者使用^FFBF4F玄火令。^ffffff\r3. ^0070c0知己：^ffffff只能通过一些^D3FF9F特殊条件结识^ffffff，正所谓千金易得，知己难求。",
NPC = 0
}

Help_KeyWord["{3.门徒出战条件}"] =
{
title = "3.门徒出战条件",
color = color["白色"],
text = "^0070c01.出战等级^ffffff\r当玩家达到出战门徒所需等级时，门徒才能进行出战。\r^0070c02.出战门派^ffffff\r当玩家属于出战门徒所需门派时，门徒才能进行出战。",
NPC = 0
}

Help_KeyWord["{4.门徒战斗倾向}"] =
{
title = "4.门徒战斗倾向",
color = color["白色"],
text = "    门徒战斗倾向分为^0070c0外功攻击型、内功攻击型、平衡防御型^ffffff三种。\r^0070c0外功攻击型：^ffffff倾向于外家功夫，精于拳掌腿法，以刚猛制敌。\r^0070c0内功攻击型：^ffffff倾向于内家修行，通晓气功法门，以阴柔取胜。\r^0070c0平衡防御型：^ffffff在攻击和防御方面都有一定造诣，以稳健取胜。",
NPC = 0
}

Help_KeyWord["{5.门徒忠诚度}"] =
{
title = "5.门徒忠诚度",
color = color["白色"],
text = "    使用提高门徒忠诚度的道具就能提升门徒的忠诚度，忠诚度不足50的话，门徒将拒绝为你作战。\r\r^D3FF9F注意：^ffffff忠诚度上限为100点，每次门徒死亡时，会减少10点忠诚度。^ffffff",
NPC = 0
}

Help_KeyWord["{二、从哪里获得门徒？}"] =
{
title = "二、从哪里获得门徒？",
color = color["白色"],
text = "    人物等级达到25级时门派会发来邮件告知可以回到门派，此时可以从师门前辈那里接到任务，完成后可以获得您的第一位门徒，从此开始结伴走江湖的生涯。\r    除此之外，人物等级在35级后在主要城市（^FFBF4F福州城^ffffff、^FFBF4F衡山城^ffffff、^FFBF4F洛阳城^ffffff）的^FFBF4F门徒商人^ffffff处可以购得^0070c0猎狐香^ffffff和^0070c0玄火令^ffffff。并且您可以通过门徒商人传送到^FFBF4F万兽谷^ffffff，在这里您可以找寻适合自己并与您有缘的门徒。",
NPC = 0
}

Help_KeyWord["{三、门徒主要作用？}"] =
{
title = "三、门徒主要作用？",
color = color["白色"],
text = "门徒主要作用：\r^0070c01.跑腿差事：^ffffff在门徒出战的情况下能够使用门徒掌握的差事技能辅助玩家更方便的游历江湖，门徒使用差事技能会消耗{门徒气力值}。\r^0070c01.战斗辅助：^ffffff在门徒出战的情况下能够辅助角色进行战斗，且{门徒基础战斗属性}越高门徒的战斗力就越强。",
NPC = 0
}

Help_KeyWord["{门徒气力值}"] =
{
title = "门徒气力值",
color = color["白色"],
text = "    不同的差事技能消耗气力值的方式和数量不同。\r    门徒的气力值会随时间慢慢恢复。",
NPC = 0
}

Help_KeyWord["{门徒基础战斗属性}"] =
{
title = "门徒基础战斗属性",
color = color["白色"],
text = "门徒基础战斗属性显示了目前门徒的各项基础能力。\r^0070c0外功攻击：^ffffff影响门徒的^FFBF4F攻击^ffffff所能造成的外攻伤害。\r^0070c0内功攻击：^ffffff影响门徒的^FFBF4F攻击^ffffff所能造成的内功伤害。\r^0070c0外功防御：^ffffff门徒对^FFBF4F外攻攻击的防御能力。^ffffff\r^0070c0内功防御：^ffffff门徒对^FFBF4F内攻攻击的防御能力。^ffffff\r^0070c0会心：^ffffff提高门徒^FFBF4F攻击造成暴击的几率。^ffffff\r^0070c0精通：^ffffff提高门徒^FFBF4F减少敌人的攻击造成暴击的几率并降低敌人抵御门徒伤害的几率。^ffffff\r^0070c0抵御：^ffffff提高门徒^FFBF4F抵御伤害的几率。^ffffff",
NPC = 0
}

Help_KeyWord["{四、影响门徒能力的主要属性？}"] =
{
title = "四、影响门徒能力的主要属性？",
color = color["白色"],
text = "{1.门徒气血}\r{2.门徒招式}\r{3.门徒天资属性}",
NPC = 0
}

Help_KeyWord["{1.门徒气血}"] =
{
title = "1.门徒气血",
color = color["白色"],
text = "    门徒被攻击时，会减少气血值，气血为0时，门徒死亡并降低10点忠诚度。\r^D3FF9F门徒气血值不会自动恢复^ffffff，只能使用^FFBF4F门徒气血药品^ffffff进行恢复。\r^D3FF9F小技巧：使用快捷回复按钮可以为门徒快速回复气血。^ffffff",
NPC = 0
}

Help_KeyWord["{2.门徒招式}"] =
{
title = "2.门徒招式",
color = color["白色"],
text = "    招式是门徒最主要的战斗方式，门徒可通过领悟获得，也可在各门徒商人处进行丹书学艺学习或提高招式等级。影响门徒释放招式的频率和倾向的是{门徒的性格}。",
NPC = 0
}

Help_KeyWord["{门徒的性格}"] =
{
title = "门徒的性格",
color = color["白色"],
text = "门徒的性格影响门徒招式的出手几率。\r^0070c0勇敢：^ffffff有此性格的门徒对^FFBF4F外攻型^ffffff招式更加得心应手。\r^0070c0沉稳：^ffffff有此性格的门徒对^FFBF4F内攻型^ffffff招式更加得心应手。\r^0070c0狡黠：^ffffff有此性格的门徒对^FFBF4F限制型^ffffff招式更加得心应手。\r^0070c0敦厚：^ffffff有此性格的门徒对^FFBF4F辅助型^ffffff招式更加得心应手。",
NPC = 0
}

Help_KeyWord["{3.门徒天资属性}"] =
{
title = "3.门徒天资属性",
color = color["白色"],
text = "  ^FFBF4F天资^ffffff是门徒最重要的属性，天资影响并决定门徒的各项基础能力的成长。天资是与生俱来的。\r通过^e46d03传功^ffffff可以增进门徒天资。\r^0070c0体魄天资：^ffffff影响^FFBF4F气血上限成长^ffffff。\r^0070c0力道天资：^ffffff影响^FFBF4F外功攻击、会心成长^ffffff。\r^0070c0筋骨天资：^ffffff影响^FFBF4F外功防御、内功防御成长^ffffff。\r^0070c0内劲天资：^ffffff影响^FFBF4F内功攻击、会心成长^ffffff。\r^0070c0气海天资：^ffffff影响^FFBF4F精通、抵御成长^ffffff。",
NPC = 0
}

Help_KeyWord["{五、门徒招式介绍}"] =
{
title = "五、门徒招式介绍",
color = color["白色"],
text = "    招式是门徒最主要的战斗方式，门徒可通过领悟获得，也可在各门徒商人处进行丹书学艺学习或提高招式等级。",
NPC = 0
}

Help_KeyWord["{六、设置默认出战门徒以及出战快捷键}"] =
{
title = "六、设置默认出战门徒以及出战快捷键",
color = color["白色"],
text = "  在门徒栏为中，^FFBF4F点击默认出战门徒标识^ffffff，即可把此门徒设置为默认出战门徒。使用快捷键^FFBF4F“G”^ffffff，就可方便的召出此默认门徒了。",
NPC = 0
}

Help_KeyWord["{一、装备淬炼的作用？}"] =
{
title = "一、装备淬炼的作用？",
color = color["白色"],
text = "使用符合条件的装备或道具对指定装备进行合成，从而^FFBF4F提升装备淬炼经验值^ffffff进行装备^FFBF4F淬炼等级提升^ffffff，装备淬炼后可^FFBF4F提升装备基础属性^ffffff。",
NPC = 0
}

Help_KeyWord["{二、装备淬炼基础知识}"] =
{
title = "二、装备淬炼基础知识",
color = color["白色"],
text = "{1.装备淬炼条件}\r{2.装备淬炼的消耗}\r{3.装备淬炼经验的显示}\r{4.装备淬炼属性的显示}\r{5.装备淬炼效果}",
NPC = 0
}

Help_KeyWord["{三、装备淬炼功能如何使用？}"] =
{
title = "三、装备淬炼功能如何使用？",
color = color["白色"],
text = "1.首先，打开包裹界面点击^FFBF4F【装备提升】^ffffff按钮，开启^FFBF4F【装备提升界面】^ffffff。\r2.其次，将要淬炼的装备拖入^FFBF4F【主淬炼栏】^ffffff中，再将另5件装备拖入到另外五个空栏中。\r3.最后，点击开始^FFBF4F【开始合成】^ffffff按钮进行合成。（淬炼不会失败）",
NPC = 0
}

Help_KeyWord["{四、装备淬炼技巧？}"] =
{
title = "四、装备淬炼技巧？",
color = color["白色"],
text = "材料装备的^FFBF4F品质^ffffff和^FFBF4F等级^ffffff越高，合成所^FFBF4F获得淬炼经验越多^ffffff。",
NPC = 0
}

Help_KeyWord["{1.装备淬炼条件}"] =
{
title = "1.装备淬炼条件",
color = color["白色"],
text = "^FFBF4F白色品质装备^ffffff无法进行强化，同时也无法做为强化材料",
NPC = 0
}

Help_KeyWord["{2.装备淬炼的消耗}"] =
{
title = "2.装备淬炼的消耗",
color = color["白色"],
text = "装备淬炼主要^FFBF4F消耗装备^ffffff和^FFBF4F特殊材料^e46d0（暂无）^ffffff。",
NPC = 0
}

Help_KeyWord["{3.装备淬炼经验的显示}"] =
{
title = "3.装备淬炼经验的显示",
color = color["白色"],
text = "装备淬炼成功一次后，物品描述的^FFBF4F【淬炼标签】^ffffff下会显示此装备^FFBF4F淬炼等级^ffffff以及当前的^FFBF4F淬炼经验数量^ffffff。",
NPC = 0
}

Help_KeyWord["{4.装备淬炼属性的显示}"] =
{
title = "4.装备淬炼属性的显示",
color = color["白色"],
text = "物品描述中没有直接显示物品淬炼属性，在^FFBF4F【基础属性标签】^ffffff下会显示装备的^FFBF4F总属性^ffffff和^FFBF4F初始属性^ffffff。\r^0070c0公式：^ffffff^FFBF4F总属性^ffffff - ^FFBF4F初始属性^ffffff = ^FFBF4F淬炼属性^ffffff",
NPC = 0
}

Help_KeyWord["{5.装备淬炼效果}"] =
{
title = "5.装备淬炼效果",
color = color["白色"],
text = "装备淬炼只对装备的^FFBF4F基础属性^ffffff进行提升，^FFBF4F淬炼等级越高提升的属性就越多^ffffff。",
NPC = 0
}

Help_KeyWord["{一、宝石合成的作用？}"] =
{
title = "一、宝石合成的作用？",
color = color["白色"],
text = "宝石合成可以将^FFBF4F5个低等级宝石^ffffff和一个^FFBF4F5【合成符】^ffffff一起合成一个^FFBF4F5高等级宝石^ffffff，从而提升宝石所提供的属性。",
NPC = 0
}

Help_KeyWord["{二、宝石合成基础知识}"] =
{
title = "二、宝石合成基础知识",
color = color["白色"],
text = "{1.宝石与合成符的出处}\r{2.宝石合成的消耗}\r{3.宝石的作用？}",
NPC = 0
}

Help_KeyWord["{三、宝石合成功能如何使用？}"] =
{
title = "三、宝石合成功能如何使用？",
color = color["白色"],
text = "1.首先，打开包裹界面点击^FFBF4F【装备提升】^ffffff按钮，开启^FFBF4F【装备提升界面】^ffffff。\r2.其次，将要^FFBF4F【合成符】^ffffff拖入^FFBF4F【合成符栏】^ffffff中，再在其他栏中拖入5个等级相同的宝石。\r3.最后，点击开始^FFBF4F【开始合成】^ffffff按钮进行宝石合成。（宝石合成不会失败）",
NPC = 0
}

Help_KeyWord["{1.宝石与合成符的出处}"] =
{
title = "1.宝石与合成符的出处",
color = color["白色"],
text = "在^FFBF4F副本【龙岭迷窟】^ffffff和^FFBF4F活动【绿竹巷】^ffffff中有一定机会获得^FFBF4F宝石^ffffff以及^FFBF4F合成符^ffffff。",
NPC = 0
}

Help_KeyWord["{2.宝石合成的消耗}"] =
{
title = "2.宝石合成的消耗",
color = color["白色"],
text = "宝石合成需要消耗^FFBF4F5个同等级宝石^ffffff、^FFBF4F合成符^ffffff、以及^FFBF4F银票或银子^ffffff。^e46d0（默认优先消耗银票）^ffffff",
NPC = 0
}

Help_KeyWord["{3.宝石的作用？}"] =
{
title = "3.宝石的作用？",
color = color["白色"],
text = "宝石可以镶嵌在^FFBF4F已打孔的装备^ffffff上，从而增加该装备的^FFBF4F附加属性^ffffff。",
NPC = 0
}

Help_KeyWord["{一、帮派二三事}"] =
{
title = "一、帮派二三事",
color = color["白色"],
text = "{1.建帮到底是为了什么呢？}\r{2.好吧！至少你得达到最基础的要求哦。}\r{3.有些步骤你还得慢慢学啊。}\r{4.如果你嫌上述太麻烦，就直接加入一个现成的帮派好了。}",
NPC = 0
}

Help_KeyWord["{二、关于帮派发展的事儿}"] =
{
title = "二、关于帮派发展的事儿",
color = color["白色"],
text = "{1.大规模的建设总是有些好处的。}\r{2.让我来告诉你如何升级帮派吧。}\r{3.在满足帮派升级条件后，该怎么升级呀？}",
NPC = 0
}

Help_KeyWord["{三、运镖玩法}"] =
{
title = "三、运镖玩法",
color = color["白色"],
text = "{1.在哪开启运镖？}\r{2.如何开启运镖？}\r{3.运镖车路线如何决定？}\r{4.查看镖车路线}\r{5.运镖注意事项}\r{6.关于陷阱}\r{7.其他相关内容}\r{8.关于下药}\r{9.关于奇遇}\r{10.关于奖励}\r{11.关于镖车}",
NPC = 0
}

Help_KeyWord["{四、劫镖玩法}"] =
{
title = "四、劫镖玩法",
color = color["白色"],
text = "{1.如何开启劫镖？}\r{2.如何获得口供？}\r{3.劫镖车路线如何决定？}\r{4.查看劫掠镖车路线}\r{5.如何劫掠货物}\r{6.关于使用陷阱}\r{7.关于毒药}\r{8.关于易容}\r{9.关于奖励}",
NPC = 0
}

Help_KeyWord["{1.在哪开启运镖？}"] =
{
title = "1.在哪开启运镖？",
color = color["白色"],
text = "1.在帮派总舵镖行老板处由队长开启\r2.需本帮派至少3名玩家组队\r3.每日可进行3次运镖",
NPC = 0
}

Help_KeyWord["{2.如何开启运镖？}"] =
{
title = "2.如何开启运镖？",
color = color["白色"],
text = "1.在镖行老板处点击“开启运镖”后，需选择要运达的目的地，运送的路线越长所得奖励也越高。\r2.目的地只能在帮派势力范围内选择。\r3.可额外使用行镖令提升运送镖车的品质，以获得更好的奖励。",
NPC = 0
}

Help_KeyWord["{3.运镖车路线如何决定？}"] =
{
title = "3.运镖车路线如何决定？",
color = color["白色"],
text = "1.镖车经由帮派总舵所在城市的镖行老板处出发，向目的地自动行进，需各位大侠沿途护送。",
NPC = 0
}

Help_KeyWord["{4.查看镖车路线}"] =
{
title = "4.查看镖车路线",
color = color["白色"],
text = "1.按“M”键打开地图时，可看到镖车的白色镖车线路，镖车在地图之间移动时，会沿着该路线行进。",
NPC = 0
}

Help_KeyWord["{5.运镖注意事项}"] =
{
title = "5.运镖注意事项",
color = color["白色"],
text = "1.运镖过程中，需有队员处于镖车15米范围内，否则镖车会停下。\r2.当镖车因此停留时间过长，超过1分钟后，运镖即会失败。",
NPC = 0
}

Help_KeyWord["{6.关于陷阱}"] =
{
title = "6.关于陷阱",
color = color["白色"],
text = "1.运镖中镖车可能会踩到陷阱，遭到山寨的埋伏。\r2.中陷阱后，镖车不能移动，且当有队员在已中陷阱镖车周围时，会因为陷阱的影响而受到伤害。\r3.若包裹中有解除陷阱道具时，可直接点击镖车解除陷阱。",
NPC = 0
}

Help_KeyWord["{7.其他相关内容}"] =
{
title = "7.其他相关内容",
color = color["白色"],
text = "1.可在NPC处购买探查器，沿途勘查，使镖车在一定时间内不会中陷阱。",
NPC = 0
}

Help_KeyWord["{8.关于下药}"] =
{
title = "8.关于下药",
color = color["白色"],
text = "1.镖车在驿站休息时，可能会被下药，遭到山寨的伏击。\r2.被下药后，所有运镖队员都可能会受到毒药效果的影响，功力被大幅削弱。\r3.若有队员携带有对应毒药的解药，可使用为中毒的队友解毒。",
NPC = 0
}

Help_KeyWord["{9.关于奇遇}"] =
{
title = "9.关于奇遇",
color = color["白色"],
text = "1.运镖过程中，还可能发生一些特殊事件，如路遇美人等，各位大侠要小心处理，否则可能镖货不保。",
NPC = 0
}

Help_KeyWord["{10.关于奖励}"] =
{
title = "10.关于奖励",
color = color["白色"],
text = "1.镖车到达目的地后，可在镖行老板处点击“完成运镖”领取奖励。\r2.若有队员距离太远，则不能获得奖励，切记。",
NPC = 0
}

Help_KeyWord["{11.关于镖车}"] =
{
title = "11.关于镖车",
color = color["白色"],
text = "1.镖车在经过驿站时，会进入驿站休息30秒。\r2.当所有队员都进入战斗状态时，镖车会停止移动。",
NPC = 0
}

Help_KeyWord["{1.如何开启劫镖？}"] =
{
title = "1.如何开启劫镖？",
color = color["白色"],
text = "1.需本帮派至少3名玩家组队\r2.由队长使用口供\r3.每日可进行3次劫镖",
NPC = 0
}

Help_KeyWord["{2.如何获得口供？}"] =
{
title = "2.如何获得口供？",
color = color["白色"],
text = "1.在本帮刑讯室处逼供人质，会有机会获得口供\r2.逼供人质时需要消耗对应刑具，在刑讯室外有一些初级刑具可供使用。\r3.使用高级刑具会获得更好的口供。",
NPC = 0
}

Help_KeyWord["{3.劫镖车路线如何决定？}"] =
{
title = "3.劫镖车路线如何决定？",
color = color["白色"],
text = "1.镖车会从势力范围内随机某张地图出现，向本帮派总舵行进。\r2.镖师偶尔也会耍诈，镖车会在中间某张地图开始出现，向本帮总舵行进。",
NPC = 0
}

Help_KeyWord["{4.查看劫掠镖车路线}"] =
{
title = "4.查看劫掠镖车路线",
color = color["白色"],
text = "1.按“M”键打开地图时，可看到镖车的白色镖车线路，镖车在地图之间移动时，会沿着该路线行进。",
NPC = 0
}

Help_KeyWord["{5.如何劫掠货物}"] =
{
title = "5.如何劫掠货物",
color = color["白色"],
text = "1.左键点击镖车即可劫掠货物\r2.劫掠过程中被攻击会打断劫掠\r3.镖师会优先攻击正在劫掠镖车的玩家，需要队员之间默契配合才能成功劫到镖货。",
NPC = 0
}

Help_KeyWord["{6.关于使用陷阱}"] =
{
title = "6.关于使用陷阱",
color = color["白色"],
text = "1.在本帮后勤使处可以购买到陷阱，对劫镖大有裨益\r2.在包裹中右键点击陷阱后，将鼠标移至想要放置的位置，点击左键即放置成功。\r3.放置时的蓝圈表示镖车的作用范围，当镖车走到作用范围内时会触发陷阱，困住镖车，并对周围的镖师造成伤害。",
NPC = 0
}

Help_KeyWord["{7.关于毒药}"] =
{
title = "7.关于毒药",
color = color["白色"],
text = "1.在本帮后勤使处可以购买到毒药，可使劫镖更加容易。\r2.毒药只可对正在镖行中歇息的镖车使用，选中镖车，右键使用毒药即可对所有镖师下药，大幅削弱其功力。\r3.对于已被下药的镖车，不可再进行下药。",
NPC = 0
}

Help_KeyWord["{8.关于易容}"] =
{
title = "8.关于易容",
color = color["白色"],
text = "1.在本帮后勤使处可以购买到易容道具，是一种特殊的劫镖方式。\r2.使用易容道具易容后，会获得一些特殊技能，使劫镖过程更加容易。",
NPC = 0
}

Help_KeyWord["{9.关于奖励}"] =
{
title = "9.关于奖励",
color = color["白色"],
text = "1.劫镖完后，玩家可携带镖货至镖行的山寨探子处，点击上交镖货领取奖励\r2.上交时会交出全部的镖货，并根据货物的数量决定奖励的多少\r3.当包裹中有未上交的镖货时，不能再次参与下次开启劫镖。",
NPC = 0
}

Help_KeyWord["{1.建帮到底是为了什么呢？}"] =
{
title = "1.建帮到底是为了什么呢？",
color = color["白色"],
text = "当老大！踢馆！倒是其次。重要的是一个强大的帮派有助于你在游戏中更好的发展哦。",
NPC = 0
}

Help_KeyWord["{2.好吧！至少你得达到最基础的要求哦。}"] =
{
title = "2.好吧！至少你得达到最基础的要求哦。",
color = color["白色"],
text = "1.你至少需要三个好朋友才可以哦。\r2.和三个好朋友的{好感度}要达到150及以上，要经常组队一起战斗才行呢。\r3.到福州、衡山或洛阳找到帮派管理员大叔，点击创建帮派选项，就可以进入创建帮派步骤了。",
NPC = 0
}

Help_KeyWord["{3.有些步骤你还得慢慢学啊。}"] =
{
title = "3.有些步骤你还得慢慢学啊。",
color = color["白色"],
text = "1.首先要挑战10大门派，不过不用怕，他们很挫的说。\r2.去福州郊外击杀升【龙令窃贼】，可掉落【升龙令】，听说那个怪物是只很丑而且刚失恋的猩猩。",
NPC = 0
}

Help_KeyWord["{4.如果你嫌上述太麻烦，就直接加入一个现成的帮派好了。}"] =
{
title = "4.如果你嫌上述太麻烦，就直接加入一个现成的帮派好了。",
color = color["白色"],
text = "1.直接到福州、衡山或洛阳找到帮派管理员大叔，点击查找帮派选项，然后寻找帮派进行申请，申请后等待帮主批准后才能加入哦。\r2.当你被其他帮派管理者看中，他们会主动邀请你加入帮派的。",
NPC = 0
}

Help_KeyWord["{1.大规模的建设总是有些好处的。}"] =
{
title = "1.大规模的建设总是有些好处的。",
color = color["白色"],
text = "升级帮派可以扩充帮派人员人数，这样就可以召集更多的好朋友在一起玩了。",
NPC = 0
}

Help_KeyWord["{2.让我来告诉你如何升级帮派吧。}"] =
{
title = "2.让我来告诉你如何升级帮派吧。",
color = color["白色"],
text = "1.{帮派建设度}的需求，加油做帮派任务吧亲~\r2.{帮派资金}的需求，存钱对空气NPC来说是件难事啦。",
NPC = 0
}

Help_KeyWord["{3.在满足帮派升级条件后，该怎么升级呀？}"] =
{
title = "3.在满足帮派升级条件后，该怎么升级呀？",
color = color["白色"],
text = "帮派建设度满足条件后，帮主点击帮派升级按钮能提升帮派等级。因为太简单，我觉得自己在这里出场有点多余呢。",
NPC = 0
}

Help_KeyWord["{帮派建设度}"] =
{
title = "帮派建设度",
color = color["白色"],
text = "就是做帮派日常任务，其实空气君也有参与任务的创建啦，会不会有点自恋。",
NPC = 0
}

Help_KeyWord["{帮派资金}"] =
{
title = "帮派资金",
color = color["白色"],
text = "镖局运镖，山寨劫镖可获得帮派资金，为虾米我会露出邪恶的笑容呢，你玩到就知道了哦。",
NPC = 0
}

Help_KeyWord["{好感度}"] =
{
title = "好感度",
color = color["白色"],
text = "一起组队杀怪就可以了，亲们不要太暧昧了哦。",
NPC = 0
}

Help_KeyWord["{什么地方可以获得升龙令？}"] =
{
title = "什么地方可以获得升龙令？",
color = color["白色"],
text = "去福州郊外击杀{#60494#}，可掉落升龙令，升龙令窃贼只在【0线】刷出，且15分钟才刷出1只。\r",
NPC = 0
}

Help_KeyWord["{帮派怎么升级？}"] =
{
title = "帮派怎么升级？",
color = color["白色"],
text = "做帮派任务可提升帮派建设度和帮派资金，当帮派建设度和资金足够时，帮派管理人员点击帮派界面左上角的帮派等级印章，可进行升级。",
NPC = 0
}

Help_KeyWord["{#60494#}"] =
{
title = "#60494#",
color = color["蓝色"],
text = "",
NPC = 0
}

Help_KeyWord["{Win_Message4}"] =
{
title = "Win_Message4",
color = color["蓝色"],
text = "{返回安全处}\r{接受重生}\r{邀请门徒复活}\r{原地复生}",
NPC = 0
}

Help_KeyWord["{返回安全处}"] =
{
title = "返回安全处",
color = color["蓝色"],
text = "你猜。",
NPC = 0
}

Help_KeyWord["{接受重生}"] =
{
title = "接受重生",
color = color["蓝色"],
text = "你猜。",
NPC = 0
}

Help_KeyWord["{邀请门徒复活}"] =
{
title = "邀请门徒复活",
color = color["蓝色"],
text = "你猜。",
NPC = 0
}

Help_KeyWord["{原地复生}"] =
{
title = "原地复生",
color = color["蓝色"],
text = "你猜。",
NPC = 0
}

Help_KeyWord["{1025}"] =
{
title = "1025",
color = color["蓝色"],
text = "{活动说明}\r{店铺}\r{商品}\r{行脚商人}\r{无良富翁}\r{市集盗匪}\r{街市司吏}\r{铜钱}\r{个人评价}\r{营业好评}",
NPC = 0
}

Help_KeyWord["{活动说明}"] =
{
title = "活动说明",
color = color["蓝色"],
text = "数批顾客要来街市购买各种各样的商品，他们会从^cc3300东街^ffffff、^cc3300西街^ffffff、^cc3300南街^ffffff出现，沿着路径向^cc3300北街^ffffff前进。玩家要经营店铺生产商品，将其交易给客人以满足他们的需求。",
NPC = 0
}

Help_KeyWord["{店铺}"] =
{
title = "店铺",
color = color["蓝色"],
text = "杂货铺：经营^cc3300折扇^ffffff、^cc3300马鞍^ffffff、^cc3300百宝箱^ffffff。\r讲武堂：经营^cc3300秘籍^ffffff、^cc3300秘药^ffffff、^cc3300豪夺令^ffffff。\r凉茶摊：经营^cc3300茶水^ffffff、^cc3300糕点^ffffff、^cc3300归去来^ffffff。\r店铺升级：需要花费铜钱。^cc3300地基^ffffff升级成为^cc33001级店铺^ffffff，^cc33001级店铺^ffffff升级成为^cc33002级店铺^ffffff、^cc33002级店铺^ffffff升级成为^cc33003级店铺^ffffff。",
NPC = 0
}

Help_KeyWord["{商品}"] =
{
title = "商品",
color = color["蓝色"],
text = "每位客人们需求^cc33001个低阶商品^ffffff或^cc3300中阶商品^ffffff，而^cc3300高阶商品^ffffff自身各有特殊作用。\r低阶商品：^cc3300折扇^ffffff、^cc3300秘籍^ffffff、^cc3300茶水^ffffff。\r中阶商品：^cc3300马鞍^ffffff、^cc3300秘药^ffffff、^cc3300糕点^ffffff。\r高阶商品：^cc3300百宝箱^ffffff、^cc3300豪夺令^ffffff、^cc3300归去来^ffffff。                         ",
NPC = 0
}

Help_KeyWord["{行脚商人}"] =
{
title = "行脚商人",
color = color["蓝色"],
text = "偶尔会出现在街市，会出售全部9种商品，但价格略微高些。",
NPC = 0
}

Help_KeyWord["{无良富翁}"] =
{
title = "无良富翁",
color = color["蓝色"],
text = "偶尔会出现在街市，将商品出售给他们会得到更多的铜钱，但不会获得好评。",
NPC = 0
}

Help_KeyWord["{市集盗匪}"] =
{
title = "市集盗匪",
color = color["蓝色"],
text = "偶尔会出现在街市，击杀他们可以获得营业好评，如果置之不理会减少营业好评。",
NPC = 0
}

Help_KeyWord["{街市司吏}"] =
{
title = "街市司吏",
color = color["蓝色"],
text = "街市活动后向街市司吏领取个人奖励。",
NPC = 0
}

Help_KeyWord["{铜钱}"] =
{
title = "铜钱",
color = color["蓝色"],
text = "店铺升级、生产商品需要消耗铜钱，出售商品可以获得铜钱。",
NPC = 0
}

Help_KeyWord["{个人评价}"] =
{
title = "个人评价",
color = color["蓝色"],
text = "满足客人的需求可以获得个人评价，用来换取个人奖励。",
NPC = 0
}

Help_KeyWord["{营业好评}"] =
{
title = "营业好评",
color = color["蓝色"],
text = "任意一位队员满足客人的需求，队伍可以获得营业好评。",
NPC = 0
}

Help_KeyWord["{1. 好友度是什么？}"] =
{
title = "1. 好友度是什么？",
color = color["白色"],
text = "好友度是用来形容好友之间的友好关系程度的数值。",
NPC = 0
}

Help_KeyWord["{2. 怎么获得好友度？}"] =
{
title = "2. 怎么获得好友度？",
color = color["白色"],
text = "1) 与好友组队，^FFBF4F每分钟增加1点好友度^ffffff，好友度超过^FFBF4F999^fffffff后，组队不再增加好友度。\r2) 师徒处于组队状态在一定范围内，每杀死一个怪，会互相^FFBF4F增加好友度1点^ffffff。\r3) 同时在同一个在载具^FFBF4F（酒桌）^ffffff，可以增加好友度。",
NPC = 0
}

Help_KeyWord["{3. 好友度的用处？}"] =
{
title = "3. 好友度的用处？",
color = color["白色"],
text = "1) 好友之间想进行结义，相互的^FFBF4F好友度^ffffff必须达到^FFBF4F3000^ffffff.\r2) 成立帮派时，要求队长与队员之间为好友关系，且^FFBF4F好友度^ffffff超过^FFBF4F150^ffffff.",
NPC = 0
}

Help_KeyWord["{一. 《笑傲英雄谱》是什么？}"] =
{
title = "一. 《笑傲英雄谱》是什么？",
color = color["白色"],
text = "1. 你将会被载入《笑傲英雄谱》名流千古。\r2. 为英雄们量身定制的一系列^ff0000“特殊服务”^ffffff，你可以通过^ff0000爵位系统^ffffff成为游戏中的NPC、也可以通过^ff0000帮派系统^ffffff在主城中拥有属于自己的形象雕像受万人参拜，每日特殊礼包并附上英雄专属易容卡包助你升级娱乐两不误，特殊的英雄头像身份名片、英雄标识让你与众不同。\r3. 你可以通过自己的英雄权利，帮助更多崇拜你的粉丝，如：启动全服双倍经验、特殊道具拍卖行、更能帮助其他玩家有情人终成眷属等。\r笑傲英雄谱是认可、也是责任。",
NPC = 0
}

Help_KeyWord["{二. 如何成为笑傲英雄？}"] =
{
title = "二. 如何成为笑傲英雄？",
color = color["白色"],
text = "{1.如何成为“亲王”？}\r{2.如何成为全服“大哥”？}\r{3.如何成为“第一帮主”？}\r{4.如何成为一代宗师“春秋”？}\r{5.如何成为“风云”人物？}",
NPC = 0
}

Help_KeyWord["{三. 成为笑傲英雄又如何？}"] =
{
title = "三. 成为笑傲英雄又如何？",
color = color["白色"],
text = "载入史册：获得英雄身份后将会被载入《笑傲英雄谱》名流千古（不受合服等因素影响）。\r个人雕像：专为“带头大哥”与“天下第一帮主”量铸造的纯金雕像，分别坐落于洛阳的万象塔中和余杭的“天下第一”牌匾下供百姓参拜！\r个人府邸：专为“福王”“庆王”在洛阳宝地所设计的私人别院。\r替换NPC：专为“福王”“庆王”在其府邸所设立的NPC供百姓参拜。\r开启拍卖：只有“福王”“庆王”身份的角色凭其意愿可在每晚的19：30-21：30之间可在各自府邸的“西域商人”或“南洋商人”处为全服开启拍卖行。\r属性徽章：部分英雄在获得身份时可获得不同属性的徽章。\r专属标志、头像、名片：在角色名称前缀英雄标识，在名片及头像将使用金色边框。\r免费婚礼：部分英雄身份可为自己，或帮助其他玩家免费开启结婚的同心锁完成婚礼。\r英雄礼包：拥有英雄身份的玩家每日均可获得礼包一份。",
NPC = 0
}

Help_KeyWord["{1.如何成为“亲王”？}"] =
{
title = "1.如何成为“亲王”？",
color = color["白色"],
text = "爵位贡献度主要通过赏金任务获得。\r发布任务者：\r  1、等级≥50的角色；\r  2、每日10：00-19：00之间可在“赏金榜将军”处发起赏金任务；\r  3、每日19：00-23：59之间可在“赏金榜将军”处结算爵位贡献值。\r领取任务者：\r  1、可从“皇榜”处领取其他玩家发布的任务；\r  2、完成任务后可获得发布者所设置的赏金。\r注：发布任务需要消耗交易币。交易币投入的越多被完成的几率越大，获得的爵位贡献度也就越多！",
NPC = 55440
}

Help_KeyWord["{2.如何成为全服“大哥”？}"] =
{
title = "2.如何成为全服“大哥”？",
color = color["白色"],
text = "通过“猛龙过江”到其他服务器，在跨服的活动玩法中可获得游侠值，得分最高者将获得“带头大哥”的身份奖励",
NPC = 71445
}

Help_KeyWord["{3.如何成为“第一帮主”？}"] =
{
title = "3.如何成为“第一帮主”？",
color = color["白色"],
text = "通过帮派日常任务及帮派占地等多方面帮派相关的综合值排名第一的帮主可获得此身份。",
NPC = 0
}

Help_KeyWord["{4.如何成为一代宗师“春秋”？}"] =
{
title = "4.如何成为一代宗师“春秋”？",
color = color["白色"],
text = "角色等级≥50级可收徒，所获得的师德积分排行取前3名获得英雄身份。其中第一名则获得“春秋”身份。\r",
NPC = 0
}

Help_KeyWord["{5.如何成为“风云”人物？}"] =
{
title = "5.如何成为“风云”人物？",
color = color["白色"],
text = "可在竞技场中同其他玩家进行PK，每完成一局可获得一定的武林声望。每月可诞生3名英雄身份的角色，其中第一名为“风云”。",
NPC = 0
}
--[[#tag pop]]

------------------读取界面元素配置--------------------
--------------------ing Configs--------------------
--文本格式 Text Style
LOADING_TIP_STYLE = --[[!AUTO_958]]"%s%s"
LOADING_IMG_STYLE_COMMON = --[[!AUTO_959]]"%s"
LOADING_IMG_STYLE_SPECIAL = --[[!AUTO_960]]"MapLoading\\%s.dds"
OADING_TIP_DEFAULT_COLOR = GAME_UI_COLOR["标白"].str
--开启客户端提示 Launch Loading Tip
LOADING_LOGIN_TIP = {}
--LOADING_LOGIN_TIP[1] = {color = LOADING_TIP_DEFAULT_COLOR, string = ""}
LOADING_LOGIN_TIP[1] = {color = LOADING_TIP_DEFAULT_COLOR, string = --[[!AUTO_961]]""}
--游戏世界切换提示 Ingame Loading Tip
LOADING_INGAME_TIP =
{
--LOADING_INGAME_TIP[1] = {color = LOADING_TIP_DEFAULT_COLOR, string = ""}
--帮助类
{color = LOADING_TIP_DEFAULT_COLOR, string = --[[!AUTO_962]]"江湖小提示：江湖十一大門派，唯獨少林只收男弟子，五仙不收男弟子。"},
{color = LOADING_TIP_DEFAULT_COLOR, string = --[[!AUTO_963]]"江湖小提示：使用行為鍵（默認為空格）可以執行跳躍、輕功、受身等操作。"},
{color = LOADING_TIP_DEFAULT_COLOR, string = --[[!AUTO_964]]"江湖小提示：使用操作鍵（默認為R）可以執行快速拾取、採集、調查等操作。"},
{color = LOADING_TIP_DEFAULT_COLOR, string = --[[!AUTO_965]]"江湖小提示：掉落在地上的戰利品，可以操作鍵（默認為R）進行拾取。"},
{color = LOADING_TIP_DEFAULT_COLOR, string = --[[!AUTO_966]]"江湖小提示：在武學界面中，可以設置你的快捷欄，並查看身法秘笈等內容。"},
{color = LOADING_TIP_DEFAULT_COLOR, string = --[[!AUTO_967]]"江湖小提示：使用奔跑鍵（默認為V）可以加速跑，這種情況下使用多段跳也會跳得更遠。"},
{color = LOADING_TIP_DEFAULT_COLOR, string = --[[!AUTO_968]]"江湖小提示：在馬匹等坐騎上，也可通用奔跑鍵（默認為V）等方式使用加速跑功能。"},
{color = LOADING_TIP_DEFAULT_COLOR, string = --[[!AUTO_969]]"江湖小提示：關注屏幕正中的QTE提示，適時使用怒氣技、受身等來扭轉戰局。"},
{color = LOADING_TIP_DEFAULT_COLOR, string = --[[!AUTO_970]]"江湖小提示：各門派的大宗武學（第一套技能）可以在武學界面用功力來提升等級。"},
{color = LOADING_TIP_DEFAULT_COLOR, string = --[[!AUTO_971]]"江湖小提示：各門派的專精武學技能只能通過高階裝備來提升，最多修至四十重。"},
{color = LOADING_TIP_DEFAULT_COLOR, string = --[[!AUTO_972]]"江湖小提示：快捷欄的數量會隨著角色能力的增強逐漸開放。"},
{color = LOADING_TIP_DEFAULT_COLOR, string = --[[!AUTO_973]]"江湖小提示：怪物身上顏色代表不同狀態，藍色為弱點，黃色為剛體，紅色為破綻。"},
{color = LOADING_TIP_DEFAULT_COLOR, string = --[[!AUTO_974]]"江湖小提示：巧妙利用完美調息的恢復破綻效果，可以在戰鬥中扭轉劣勢。"},
{color = LOADING_TIP_DEFAULT_COLOR, string = --[[!AUTO_975]]"江湖小提示：使用加速跑、多段跳等身法後體力會短時減緩恢復速度，戰鬥中要格外注意。"},
{color = LOADING_TIP_DEFAULT_COLOR, string = --[[!AUTO_976]]"江湖小提示：大多數技能都可以通過移步換形、跳躍、ALT組合移動鍵來中斷招式，以方便大俠及時規避各種戰鬥中的風險。"},
{color = LOADING_TIP_DEFAULT_COLOR, string = --[[!AUTO_977]]"江湖小提示：擊碎場景道具獲得的元魂，不僅走近可以獲得氣血、內力、怒氣等回覆效果，還可用調息遠距吸收。"},
{color = LOADING_TIP_DEFAULT_COLOR, string = --[[!AUTO_978]]"江湖小提示：當你被卡住、有問題、需要幫助時，嘗試ESC菜單中的江湖指南冊。"},
{color = LOADING_TIP_DEFAULT_COLOR, string = --[[!AUTO_979]]"江湖小提示：當發現周圍玩家過多，嘗試限制玩家顯示數量/隱藏周圍的玩家（默認按F11順次切換）。"},
{color = LOADING_TIP_DEFAULT_COLOR, string = --[[!AUTO_980]]"江湖小提示：通過武學界面，可以為每個武學配置一套連招，進行快速施放（默認為E）。"},
{color = LOADING_TIP_DEFAULT_COLOR, string = --[[!AUTO_981]]"江湖小提示：除了使用大地圖(默認為M)，在雷達上方的發送坐標懸浮提示中，也可以查看自已的詳細坐標。"},
{color = LOADING_TIP_DEFAULT_COLOR, string = --[[!AUTO_982]]"江湖小提示：如果一個單位全身泛藍，則代表其出招有弱點，可以用特定招式將其擊暈、擊倒或擊飛。"},
{color = LOADING_TIP_DEFAULT_COLOR, string = --[[!AUTO_983]]"江湖小提示：如果一個單位全身泛黃，則代表其出招過程全身剛體，免疫除點穴和凍結之外的大多數控制效果。"},
{color = LOADING_TIP_DEFAULT_COLOR, string = --[[!AUTO_984]]"江湖小提示：如果一個單位全身泛紅，則代表其破綻槽全滿長時露出弱點，所有攻擊均可以使其眩暈並形成極限連擊。"},
{color = LOADING_TIP_DEFAULT_COLOR, string = --[[!AUTO_985]]"江湖小提示：當門派某武學下招式較多時，可能無法在快捷欄中容下，這些需要在武學（默認K）面板中進行配置。"},
{color = LOADING_TIP_DEFAULT_COLOR, string = --[[!AUTO_986]]"江湖小提示：人物15級後，可以在主城中的擺攤區域（地圖深藍色的區域）進行擺攤，擺攤會收取稅金，越繁榮的地段稅率越高。"},
{color = LOADING_TIP_DEFAULT_COLOR, string = --[[!AUTO_987]]"江湖小提示：擺攤會根據地段收取不同稅金，主城的街頭巷尾有些稅率極低的擺攤區，未在地圖上標明，耐心尋找，則利益多多。"},
{color = LOADING_TIP_DEFAULT_COLOR, string = --[[!AUTO_988]]"江湖小提示：左上角地圖名後面的“發送坐標”按鈕，不僅能查看自己當前坐標，還可以把坐標發送到聊天欄，方便他人尋路。"},
{color = LOADING_TIP_DEFAULT_COLOR, string = --[[!AUTO_989]]"江湖小提示：在聊天欄每頁的標籤上點右鍵，可以按自己的喜好，設置每頁需要顯示的頻道。"},
{color = LOADING_TIP_DEFAULT_COLOR, string = --[[!AUTO_990]]"江湖小提示：鼠標放在左上角的小地圖上，會發現不少隱藏的秘密：不僅能調整透明度、大小，位置，還能打開地圖尋徑列表。"},
{color = LOADING_TIP_DEFAULT_COLOR, string = --[[!AUTO_991]]"江湖小提示：當主界面的武學按鈕閃爍時，不要忘記去升級自己的技能，提升實力。（可以升級的技能一般在大宗武學頁）"},
{color = LOADING_TIP_DEFAULT_COLOR, string = --[[!AUTO_992]]"江湖小提示：系統每週會贈送一些雙倍經驗時間，點擊主界面上方的“EXP”按鈕，可以查看並領取。（戰鬥中不能打開界面。）"},
{color = LOADING_TIP_DEFAULT_COLOR, string = --[[!AUTO_993]]"江湖小提示：想第一時間參與活動，想準確知道當前的系統時間，可以把鼠標放在左上角的天氣圖標上查看。"},
{color = LOADING_TIP_DEFAULT_COLOR, string = --[[!AUTO_994]]"江湖小提示：在遊戲戲左上角的地圖區域中，可以發布坐標及在不同“線路”之間切換。"},
{color = LOADING_TIP_DEFAULT_COLOR, string = --[[!AUTO_995]]"江湖小提示：雖然在江湖中可以在不同的線路之間穿梭，但並非所有的線路都有活動或BOSS。這種情況下請優先選擇0線。"},
{color = LOADING_TIP_DEFAULT_COLOR, string = --[[!AUTO_996]]"江湖小提示：翻山越嶺、胡蹦亂跳難免馬失前蹄，自從用了江湖指南手冊（ESC菜單中）的自絕經脈，媽媽再也不擔心我們卡住了！。"},
{color = LOADING_TIP_DEFAULT_COLOR, string = --[[!AUTO_997]]"江湖小提示：當你有困難，想找攻略、查資料，請使用江湖指南手冊（鈦合金ESC鍵，你值得擁有）。"},
{color = LOADING_TIP_DEFAULT_COLOR, string = --[[!AUTO_998]]"江湖小提示：攻擊時可以獲得怒氣值，怒氣值可用來放門派大招（按住鼠標左右鍵）或強化絕技（ALT鍵配合技能快捷鍵）。"},
{color = LOADING_TIP_DEFAULT_COLOR, string = --[[!AUTO_999]]"江湖小提示：當一個蓄力技能的進度條開始逆向走條時，意味著已經獲得最大蓄力收益，這時就可以直接鬆手釋放啦。"},
{color = LOADING_TIP_DEFAULT_COLOR, string = --[[!AUTO_1000]]"江湖小提示：當身是一種比格擋更加積極的主動防禦姿態，能夠免疫除凍結和點穴外的絕大多數控制效果。"},
{color = LOADING_TIP_DEFAULT_COLOR, string = --[[!AUTO_1001]]"江湖小提示：當身技通常是蓄力技，若在蓄力過程中被攻擊，則會立刻進行強力反擊，因此使用時要注意不要隨便鬆手釋放。"},
{color = LOADING_TIP_DEFAULT_COLOR, string = --[[!AUTO_1002]]"江湖小提示：通常而言，普通招式的合招、連打招式的最後一擊、空中砸地招式的落地段以及怒氣技全程，都帶有全身剛體效果。"},
{color = LOADING_TIP_DEFAULT_COLOR, string = --[[!AUTO_1003]]"江湖小提示：減速效果分為鈍足和冰寒兩種，鈍足的減速效果較高，而冰寒則能疊加到至多5層。"},
{color = LOADING_TIP_DEFAULT_COLOR, string = --[[!AUTO_1004]]"江湖小提示：有些招式帶有俊足效果，能解除並免疫鈍足、陷足、網縛、吸附、拉回和推開效果，但不能解除冰寒、冰錮效果。"},
{color = LOADING_TIP_DEFAULT_COLOR, string = --[[!AUTO_1005]]"江湖小提示：在陷足和冰錮狀態下，人物不能移動，但陷足狀態下可以使用身法，而冰錮狀態下則不能。"},
{color = LOADING_TIP_DEFAULT_COLOR, string = --[[!AUTO_1006]]"江湖小提示：所有使人物定身的狀態效果：陷足、網縛和冰錮，都能被帶有主動位移的招式解除。"},
{color = LOADING_TIP_DEFAULT_COLOR, string = --[[!AUTO_1007]]"江湖小提示：在鈍足、陷足和纏繞狀態下，人物可以使用移形換位的身法，但體力消耗大幅度增加。"},
{color = LOADING_TIP_DEFAULT_COLOR, string = --[[!AUTO_1008]]"江湖小提示：點穴是一類非常強大的控制效果，被點穴的目標全身泛紫且處於弱點狀態，但一旦被攻擊，就會解穴。"},
{color = LOADING_TIP_DEFAULT_COLOR, string = --[[!AUTO_1009]]"江湖小提示：凍結是一類特殊的控制效果，被凍結的目標全身處於弱點狀態，且會在之後一段時間內免疫凍結。"},
{color = LOADING_TIP_DEFAULT_COLOR, string = --[[!AUTO_1010]]"江湖小提示：在副本中，某些敵人頭頂帶有獸頭標記，打倒這些敵人之後，能在一段時間內獲得額外積分，記得優先攻擊他們！"},
{color = LOADING_TIP_DEFAULT_COLOR, string = --[[!AUTO_1011]]"江湖小提示：在戰鬥狀態下切換武學，會導致該武學的所有招式全部觸發冷卻，這是你為戰鬥中更換武學所付出的必要代價。"},
{color = LOADING_TIP_DEFAULT_COLOR, string = --[[!AUTO_1012]]"江湖小提示：所有的招式都有克制效果，當攻擊處於弱點狀態的敵人時，就會造成額外傷害，有些還能產生克制控制效果。"},
{color = LOADING_TIP_DEFAULT_COLOR, string = --[[!AUTO_1013]]"江湖小提示：當身和剛體只會免疫大部分“控制效果”，即那些使你無法操縱自己人物的效果，而減速和流血等則不在此列。"},
{color = LOADING_TIP_DEFAULT_COLOR, string = --[[!AUTO_1014]]"江湖小提示：江湖傳言－－格擋破點穴，點穴破當身，當身破抓取，抓取破格擋，不知是真是假。"},
{color = LOADING_TIP_DEFAULT_COLOR, string = --[[!AUTO_1015]]"江湖小提示：流血，燃燒和中毒這三種持續傷害效果，流血可疊加出較高的傷害，燃燒掉血頻率最快，中毒會持續最長的時間。"},
{color = LOADING_TIP_DEFAULT_COLOR, string = --[[!AUTO_1016]]"江湖小提示：通常而言，療傷招式的吟唱段、離地招式的空中段都帶有弱點，會被大部分招式打斷。"},
{color = LOADING_TIP_DEFAULT_COLOR, string = --[[!AUTO_1017]]"江湖小提示：天下武功出升龍！升龍、掃堂腿及其他將露出弱點的目標擊飛、擊倒的招式，若克制目標，則會造成巨大的克制傷害。"},
{color = LOADING_TIP_DEFAULT_COLOR, string = --[[!AUTO_1018]]"江湖小提示：所有的氣血回覆類效果，包括吸血，都會受到治療效果影響，而治療效果則受到筋骨屬性影響。"},
{color = LOADING_TIP_DEFAULT_COLOR, string = --[[!AUTO_1019]]"江湖小提示：俠士們闖蕩江湖，常有傷勢沉重之時，此時可在各地區的醫師處進行治療，收費低廉且效果極佳，遠勝藥物。"},
{color = LOADING_TIP_DEFAULT_COLOR, string = --[[!AUTO_1020]]"江湖小提示：人力時有窮盡，即使招式籠罩範圍再大，俠士們也只能將力量集中在數個目標身上，通過修習秘笈可提升目標上限。"},
{color = LOADING_TIP_DEFAULT_COLOR, string = --[[!AUTO_1021]]"江湖小提示：公平公正公開，公平比武場你值得擁有。"},
{color = LOADING_TIP_DEFAULT_COLOR, string = --[[!AUTO_1022]]"江湖小提示：使用包裹界面的“鎖定物品”功能為物品上鎖後,大俠們就不用再擔心誤操作銷毀裝備了！"},
{color = LOADING_TIP_DEFAULT_COLOR, string = --[[!AUTO_1023]]"江湖小提示：脫離戰鬥後，怒氣便會逐漸衰減。但傳說有種神奇的寶具，可以永久維持，甚至增長人的憤怒……"},
{color = LOADING_TIP_DEFAULT_COLOR, string = --[[!AUTO_1024]]"江湖小提示：原地覆活需要消耗元寶或銀兩，且若短時間內連續死亡的話，原地覆活的冷卻時間會不斷增加。"},
{color = LOADING_TIP_DEFAULT_COLOR, string = --[[!AUTO_1025]]"江湖小提示：各門派的元素傾向不同，可在武學描述中查看自已的元素傾向，也可在人物和技能面板中直接查看。"},
{color = LOADING_TIP_DEFAULT_COLOR, string = --[[!AUTO_1026]]"江湖小提示：初次進入比武場比武時，會獲得2000基礎積分。"},
{color = LOADING_TIP_DEFAULT_COLOR, string = --[[!AUTO_1027]]"江湖小提示：與積分相近的其他玩家比武時，獲勝會得到更高的積分獎勵。"},
{color = LOADING_TIP_DEFAULT_COLOR, string = --[[!AUTO_1028]]"江湖小提示：競技積分和血戰積分排行榜會在每月15日獎賞本月積分前三甲的俠士，並重置積分。"},
{color = LOADING_TIP_DEFAULT_COLOR, string = --[[!AUTO_1029]]"江湖小提示：競技積分和血戰積分排行榜會在每月15日獎賞本月達到特定積分的玩家，並重置積分。"},
{color = LOADING_TIP_DEFAULT_COLOR, string = --[[!AUTO_1029]]"江湖小提示：在比武場中比武贏得積分不僅可揚名天下，還能獲得極品大還丹、海量高級精煉石等獎勵。"},
--{color = LOADING_TIP_DEFAULT_COLOR, string = "江湖小提示：當同時的目標攻擊越多，就越難以集中力度，因此每個目標受到的傷害也就越少。"},（尚未實現，暫時注釋掉）
--{color = LOADING_TIP_DEFAULT_COLOR, string = "江湖小提示：在遊戲性設置選項中，可以“設置屏蔽其他玩家戰鬥光效”，勾選後，將只顯示你自己和正在攻擊你的玩家的光效。"},（此功能因有問題暫不開放，因此暫時注釋掉）
--{color = LOADING_TIP_DEFAULT_COLOR, string = "江湖小提示：等閒變卻故人心，卻道故人心易變！當某位名人獲得歸屬後，便會將曾有好感的其他俠士全部遺忘(好感度清零)。"},（目前已經不清好感度，因此暫時注釋掉）
--勵志類
{color = LOADING_TIP_DEFAULT_COLOR, string = --[[!AUTO_1030]]"江湖小經驗：闖蕩江湖的樂趣在於過程，而非結果，升級的過程遠比滿級後快樂。"},
{color = LOADING_TIP_DEFAULT_COLOR, string = --[[!AUTO_1031]]"江湖小經驗：不要抱怨副本難打或競技老輸，真正的難點其實都在人自已。"},
{color = LOADING_TIP_DEFAULT_COLOR, string = --[[!AUTO_1032]]"江湖小經驗：如果有時間，練個小號體驗更多的門派，將感受到另一番樂趣。"},
{color = LOADING_TIP_DEFAULT_COLOR, string = --[[!AUTO_1033]]"江湖小經驗：笑傲江湖中所有內容都可以進行個性設置，除了江湖小提示是在每次載入時必看的。"},
{color = LOADING_TIP_DEFAULT_COLOR, string = --[[!AUTO_1034]]"江湖小經驗：門派強勢的今天就宣告著弱勢的明天，因此武林中一定要低調。"},
--吐槽類
{color = LOADING_TIP_DEFAULT_COLOR, string = --[[!AUTO_1035]]"江湖小名言：有人就有恩怨，有恩怨就有江湖，人心即是江湖，你如何退出？！"},
{color = LOADING_TIP_DEFAULT_COLOR, string = --[[!AUTO_1036]]"江湖小名言：規矩由人所定，也可以由人所廢，它存在的意義就是為了被更替的。"},
{color = LOADING_TIP_DEFAULT_COLOR, string = --[[!AUTO_1037]]"江湖小名言：副本的大小與樂趣成反比，我們深知這一點。因此一旦你因為要做的事太多厭煩，請告訴我們。"},
{color = LOADING_TIP_DEFAULT_COLOR, string = --[[!AUTO_1038]]"江湖小名言：所謂人品，並不是全部人投了99點而你投了100點，而是你投了1點全部人點了放棄。"},
{color = LOADING_TIP_DEFAULT_COLOR, string = --[[!AUTO_1039]]"江湖小名言：不要鑽研為什麼一匹馬和一粒藥都能放到一格包裹，這永遠沒有答案。"},
{color = LOADING_TIP_DEFAULT_COLOR, string = --[[!AUTO_1039]]"俠客小名言：不要嘗試使用輔助或腳本來進行遊戲，若一定得要嘗試不可，請勇敢面對後續的懲罰。"},
{color = LOADING_TIP_DEFAULT_COLOR, string = --[[!AUTO_1039]]"俠客小名言：一山還有一山高，天外還有天外天，切莫仗著自身技術就欺負人，一打多永遠會是輸的那一個。"},
}
------------------------------------------------------


-----------------------------------------------
--	绑定模板在绑定中的显示名称
-----------------------------------------------
VEHICLE_BIND_Cfg  = {}
VEHICLE_BIND_Cfg.SHOWNAME =
{
	[81472] = "打伞中",
	[83392] = "打伞中",
	[83393] = "打伞中",
	[83394] = "打伞中",
	[83395] = "打伞中",
	[85526] = "打伞中",
	[86179] = "打伞中",
	[86180] = "打伞中",
	[86181] = "打伞中",
	[86182] = "打伞中",
	[87072] = "打伞中",
	[87916] = "打伞中",
	[87945] = "打伞中",
	[88255] = "打伞中", 
	[88296] = "打伞中",
	[89165] = "打伞中",
	[89910] = "打伞中",
	[89956] = "打伞中",
	[89997] = "打伞中",
	[90127] = "打伞中",
	[92364] = "打伞中",
	[92677] = "打伞中",
	[92676] = "打伞中",
	[93733] = "打伞中",
	[93732] = "打伞中",
	[94045] = "打伞中",
	[94073] = "打伞中",
	[94794] = "打伞中",
	[95207] = "飞行中",
	[92838] = "飞行中",
	[95750] = "打伞中",
	[96162] = "打伞中",
	[96295] = "打伞中",
	[95593] = "打伞中",
	[96432] = "飞行中",
	[96430] = "飞行中",
	[97893] = "飞行中",
	[96462] = "打伞中",
	[96485] = "打伞中",
	[96541] = "打伞中",
	[96542] = "打伞中",
	[96645] = "打伞中",
	[96791] = "飞行中",
	[96792] = "飞行中",
	[97503] = "飞行中",
	[97504] = "飞行中",
	[97546] = "打伞中",
	[97549] = "打伞中",
	[97547] = "打伞中",
	[98666] = "打伞中",
	[98698] = "飞行中",
	[97548] = "打伞中",
	[98818] = "飞行中",
	[99072] = "飞行中",
	[99224] = "飞行中",
	[99343] = "打伞中",
	[99675] = "打伞中",
	[99794] = "打伞中",
	[100092] = "打伞中",
	[100117] = "飞行中",
	[100118] = "飞行中",
	[100119] = "飞行中",
	[100286] = "打伞中",
	[100370] = "打伞中",
	[101084] = "打伞中",
	[102152] = "打伞中",
	[99754] = "飞行中",
	[102574] = "打伞中",
	[102575] = "提灯中",
	[103015] = "打伞中",
	[103184] = "打伞中",
	[103448] = "打伞中",
	[103979] = "飞行中",
	[104069] = "打伞中",
	[104268] = "打伞中",
	[104219] = "提灯中",
	[104472] = "提灯中",
	[104823] = "打伞中",
	[104926] = "打伞中",
	[93374] = "打伞中",
	[105359] = "提灯中",
	[105517] = "飞行中",
	[105524] = "飞行中",
	[103610] = "飞行中",
	[103611] = "飞行中",
	[103612] = "飞行中",
	[103613] = "飞行中",
	[103614] = "飞行中",
	[105915] = "飞行中",
	[106396] = "飞行中",
	[106537] = "飞行中",
	[106878] = "飞行中",
	[107246] = "提灯中",
	[107247] = "提灯中",
	[107838] = "飞行中",
	[107891] = "飞行中",
	[108171] = "飞行中",
	[108172] = "飞行中",
	[108173] = "飞行中",
	[108001] = "提灯中",
	[108162] = "打伞中",
	[108271] = "飞行中",
	[108283] = "飞行中",
	[109658] = "打伞中",
	[109659] = "打伞中",	
}

function VEHICLE_BIND_Cfg:GetShowName(tidVehicle)
	return VEHICLE_BIND_Cfg.SHOWNAME[tidVehicle]
end
-----------------------------------------------


-----------------------------------------------
-----------------测试聊天窗口接口用------------
TEXT_PRECINCT_WELCOME_INFO =--[[!AUTO_1040]]"欢迎来到"

WORLD_SCENE_NAME =
{
[1] = {Name = --[[!AUTO_1041]]"小村"},
[2] = {Name = --[[!AUTO_1042]]"福州城"},
[3] = {Name = --[[!AUTO_1043]]"梅关古道"},
[4] = {Name = --[[!AUTO_1044]]"衡山城"},
[6] = {Name = --[[!AUTO_1045]]"武当派"},
[11] = {Name = --[[!AUTO_1046]]"药王谷"},
[12] = {Name = --[[!AUTO_1047]]"洛阳"},
[15] = {Name = --[[!AUTO_1048]]"少林寺"},
[16] = {Name = --[[!AUTO_1049]]"仙愁峡"},
[17] = {Name = --[[!AUTO_1050]]"余杭"},
[21] = {Name = --[[!AUTO_1051]]"铸剑谷"},
[22] = {Name = --[[!AUTO_1052]]"龙泉"},
[24] = {Name = --[[!AUTO_1053]]"杭州城"},
[37] = {Name = --[[!AUTO_1054]]"朱仙镇"},
[38] = {Name = --[[!AUTO_1055]]"五霸岗"},
[39] = {Name = --[[!AUTO_1056]]"泰山"},
[1001] = {Name = --[[!AUTO_1057]]"绿竹巷"},
[1002] = {Name = --[[!AUTO_1058]]"药王秘洞"},
[9001] = {Name = --[[!AUTO_1059]]"NPC和怪物布置"},
[9002] = {Name = --[[!AUTO_1060]]"128小地图"},
[9003] = {Name = --[[!AUTO_1061]]"兰封"},
[9004] = {Name = --[[!AUTO_1062]]"选人界面"},
[1003] = {Name = --[[!AUTO_1063]]"木人巷"},
[7] = {Name = --[[!AUTO_1064]]"武当山"},
[19] = {Name = --[[!AUTO_1065]]"仙霞岭"},
[13] = {Name = --[[!AUTO_1066]]"嵩山"},
[5] = {Name = --[[!AUTO_1067]]"衡山派"},
[32] = {Name = --[[!AUTO_1068]]"蜀南竹海"},
[36] = {Name = --[[!AUTO_1069]]"恒山派"},
[18] = {Name = --[[!AUTO_1070]]"逍遥派"},
[1005] = {Name = --[[!AUTO_1071]]"新绿竹巷"},
[2001] = {Name = --[[!AUTO_1072]]"少林后院"},
[2002] = {Name = --[[!AUTO_1073]]"茶棚之战"},
[42] = {Name = --[[!AUTO_1074]]"日月神教"},
[20] = {Name = --[[!AUTO_1075]]"廿八铺"},
[1026] = {Name = --[[!AUTO_1076]]"镖局"},
[1027] = {Name = --[[!AUTO_1077]]"马帮"},
[1028] = {Name = --[[!AUTO_1078]]"山寨"},
[1029] = {Name = --[[!AUTO_1079]]"工坊"},
}
--------------------------------------------------------------------

--组队分配
GNR_LOOTRULE_FREE = --[[!AUTO_1080]]"自由拾取";
GNR_LOOTRULE_TEAM = --[[!AUTO_1081]]"队伍分配";
GNR_ROLLLEVEL_2 = --[[!AUTO_1082]]"^00ff00精良";
GNR_ROLLLEVEL_3 = --[[!AUTO_1083]]"^3485ff优质";
GNR_ROLLLEVEL_4 = --[[!AUTO_1084]]"^ce58ff完美";
GNR_ROLLLEVEL_5 = --[[!AUTO_1085]]"^df8408传说";

-- 邀请规则
GNR_INVITE_ALLOW = --[[!AUTO_1086]]"允许队员邀请";
GNR_INVITE_FORBID = --[[!AUTO_1087]]"不允许队员邀请";

-- 招募规则

GNR_RECRUIT_AUTO = --[[!AUTO_1088]]"自动招人";
GNR_RECRUIT_NOAUTO = --[[!AUTO_1089]]"禁止自动招人";

--组队提示消息
TEXT_TEAM_INVITE = --[[!AUTO_1090]]"%s 邀请您加入队伍，是否同意？";
TEXT_TEAM_INVITE_REJECT = --[[!AUTO_1091]]"%s 拒绝了您的组队邀请。";
TEXT_TEAM_REQUEST = --[[!AUTO_1092]]"%s 请求加入您的队伍，是否同意？";
TEXT_TEAM_REQUEST_REJECT = --[[!AUTO_1093]]"%s 拒绝了您的入队请求。";
TEXT_TEAM_MEMBER_JOIN = --[[!AUTO_1094]]"%s 加入了您所在的队伍。";
TEXT_TEAM_MEMBER_LEAVE = --[[!AUTO_1095]]"%s 离开了队伍。";
TEXT_TEAM_DISCARD = --[[!AUTO_1096]]"%s 解散了队伍。";
TEXT_TEAM_SELF_JOIN = --[[!AUTO_1097]]"你加入了一个队伍。";
TEXT_TEAM_SELF_LEAVE = --[[!AUTO_1098]]"你离开了队伍。";
TEXT_TEAM_CHANGE_LEADER = --[[!AUTO_1099]]"%s 成为了新的队长。";
TEXT_TEAM_MEMBER_LOGIN = --[[!AUTO_1100]]"%s 进入了游戏。";
TEXT_TEAM_MEMBER_LOGOUT = --[[!AUTO_1101]]"%s 离开了游戏。";
TEXT_TEAM_CHANGELOOT_FREE = --[[!AUTO_1102]]"组队分配方式更换成为 %s。";
TEXT_TEAM_CHANGELOOT_TEAM = --[[!AUTO_1103]]"组队分配方式更换成为 %s，最低投票品质为 %s。";
TEXT_TEAM_CHANGEINVITE_TEAM = --[[!AUTO_1104]]"队伍邀请方式更换为 %s。";
TEXT_TEAM_CHANGERECRUIT_TEAM = --[[!AUTO_1105]]"队伍招募方式更换为 %s。";


------------------------------------------------------------
------------------------------------------------------------
------------------NPC语音文件路径---------------------------
--对角色雕像类NPC，如果角色为男性，选择maleFile；如果角色为女性，选择femaleFile. 如果NPC不是角色雕像，返回elseFile. elseFile为可选项
--例：open_voice = SelectByPlayerGender("sfx\\voice\\chinese\\npc\\风云再起\\开场白\\00风云男.ogg", "sfx\\voice\\chinese\\npc\\风云再起\\开场白\\00风云女.ogg")
local function SelectByPlayerGender(maleFile, femaleFile, elseFile--[[可选]])
	elseFile = elseFile or ""
	return function (npcNid)
		local npcProp = GameApi.GetPlayerNPCBasicProp(npcNid)
		if npcProp == nil then	--如果NPC不是角色雕像，返回空串
			return elseFile
		end

		if npcProp.gender == 0 then	--male
			return maleFile
		elseif npcProp.gender == 1 then	--female
			return femaleFile
		else
			return elseFile
		end
	end
end

NPC_VOICE_PATH = {}
--[[NPC_VOICE_PATH[1] = {mode = 0, open_voice = "Sfx\\voice\\chinese\\npc\\功能npc\\1_banghuiguanliyuan_open.wav", close_voice = "Sfx\\voice\\chinese\\npc\\功能npc\\1_banghuiguanliyuan_close.wav"}
NPC_VOICE_PATH[2] = {mode = 0, open_voice = "Sfx\\voice\\chinese\\npc\\功能npc\\2_buaoshang_open.wav", close_voice = "Sfx\\voice\\chinese\\npc\\功能npc\\2_buaoshang_close.wav"}
NPC_VOICE_PATH[3] = {mode = 1, open_voice = "Sfx\\voice\\chinese\\npc\\功能npc\\3_bubodaoshi_open.wav", close_voice = "Sfx\\voice\\chinese\\npc\\功能npc\\3_bubodaoshi_close.wav"}
NPC_VOICE_PATH[4] = {mode = 0, open_voice = "Sfx\\voice\\chinese\\npc\\功能npc\\4_caikuangdaoshi_open.wav", close_voice = "Sfx\\voice\\chinese\\npc\\功能npc\\4_caikuangdaoshi_close.wav"}
NPC_VOICE_PATH[5] = {mode = 0, open_voice = "Sfx\\voice\\chinese\\npc\\功能npc\\5_cangkulaoban_open.wav", close_voice = "Sfx\\voice\\chinese\\npc\\功能npc\\5_cangkulaoban_close.wav"}
NPC_VOICE_PATH[6] = {mode = 0, open_voice = "Sfx\\voice\\chinese\\npc\\功能npc\\6_chushi_open.wav", close_voice = "Sfx\\voice\\chinese\\npc\\功能npc\\6_chushi_close.wav"}
NPC_VOICE_PATH[7] = {mode = 0, open_voice = "", close_voice = ""}
NPC_VOICE_PATH[8] = {mode = 0, open_voice = "Sfx\\voice\\chinese\\npc\\功能npc\\8_diaoyudaoshi_open.wav", close_voice = "Sfx\\voice\\chinese\\npc\\功能npc\\8_diaoyudaoshi_close.wav"}
NPC_VOICE_PATH[9] = {mode = 0, open_voice = "Sfx\\voice\\chinese\\npc\\功能npc\\9_famudaoshi_open.wav", close_voice = "Sfx\\voice\\chinese\\npc\\功能npc\\9_famudaoshi_close.wav"}
NPC_VOICE_PATH[10] = {mode = 1, open_voice = "Sfx\\voice\\chinese\\npc\\功能npc\\10_fushidianlaobanniang_open.wav", close_voice = "Sfx\\voice\\chinese\\npc\\功能npc\\10_fushidianlaobanniang_close.wav"}
NPC_VOICE_PATH[11] = {mode = 1, open_voice = "Sfx\\voice\\chinese\\npc\\功能npc\\11_huolang_open.wav", close_voice = "Sfx\\voice\\chinese\\npc\\功能npc\\11_huolang_close.wav"}
NPC_VOICE_PATH[12] = {mode = 0, open_voice = "Sfx\\voice\\chinese\\npc\\功能npc\\12_jiayuanguanliyuan_open.wav", close_voice = "Sfx\\voice\\chinese\\npc\\功能npc\\12_jiayuanguanliyuan_close.wav"}
NPC_VOICE_PATH[13] = {mode = 1, open_voice = "Sfx\\voice\\chinese\\npc\\功能npc\\13_hongniang_open.wav", close_voice = "Sfx\\voice\\chinese\\npc\\功能npc\\13_hongniang_close.wav"}
NPC_VOICE_PATH[14] = {mode = 0, open_voice = "Sfx\\voice\\chinese\\npc\\功能npc\\14_jieyiguanliyuan_open.wav", close_voice = "Sfx\\voice\\chinese\\npc\\功能npc\\14_jieyiguanliyuan_close.wav"}
NPC_VOICE_PATH[15] = {mode = 1, open_voice = "Sfx\\voice\\chinese\\npc\\功能npc\\15_jinshidaoshi_open.wav", close_voice = "Sfx\\voice\\chinese\\npc\\功能npc\\15_jinshidaoshi_close.wav"}
NPC_VOICE_PATH[16] = {mode = 1, open_voice = "Sfx\\voice\\chinese\\npc\\功能npc\\16_jiudianlaobanniang_open.wav", close_voice = "Sfx\\voice\\chinese\\npc\\功能npc\\16_jiudianlaobanniang_close.wav"}
NPC_VOICE_PATH[17] = {mode = 0, open_voice = "Sfx\\voice\\chinese\\npc\\功能npc\\17_leitaiguanliyuan_open.wav", close_voice = "Sfx\\voice\\chinese\\npc\\功能npc\\17_leitaiguanliyuan_close.wav"}
NPC_VOICE_PATH[18] = {mode = 1, open_voice = "Sfx\\voice\\chinese\\npc\\功能npc\\18_majiulaoban_open.wav", close_voice = "Sfx\\voice\\chinese\\npc\\功能npc\\18_majiulaoban_close.wav"}
NPC_VOICE_PATH[19] = {mode = 1, open_voice = "Sfx\\voice\\chinese\\npc\\功能npc\\19_mentushangren_open.wav", close_voice = "Sfx\\voice\\chinese\\npc\\功能npc\\19_mentushangren_close.wav"}
NPC_VOICE_PATH[20] = {mode = 0, open_voice = "Sfx\\voice\\chinese\\npc\\功能npc\\20_miandianshi_open.wav", close_voice = "Sfx\\voice\\chinese\\npc\\功能npc\\20_miandianshi_close.wav"}
NPC_VOICE_PATH[21] = {mode = 0, open_voice = "Sfx\\voice\\chinese\\npc\\功能npc\\21_yanmoshi_open.wav", close_voice = "Sfx\\voice\\chinese\\npc\\功能npc\\21_yanmoshi_close.wav"}
NPC_VOICE_PATH[22] = {mode = 1, open_voice = "Sfx\\voice\\chinese\\npc\\功能npc\\22_mugedaoshi_open.wav", close_voice = "Sfx\\voice\\chinese\\npc\\功能npc\\22_mugedaoshi_close.wav"}
NPC_VOICE_PATH[23] = {mode = 0, open_voice = "Sfx\\voice\\chinese\\npc\\功能npc\\23_niangjiushi_open.wav", close_voice = "Sfx\\voice\\chinese\\npc\\功能npc\\23_niangjiushi_close.wav"}
NPC_VOICE_PATH[24] = {mode = 1, open_voice = "Sfx\\voice\\chinese\\npc\\功能npc\\24_pengrendaoshi_open.wav", close_voice = "Sfx\\voice\\chinese\\npc\\功能npc\\24_pengrendaoshi_close.wav"}
NPC_VOICE_PATH[25] = {mode = 0, open_voice = "Sfx\\voice\\chinese\\npc\\功能npc\\25_qiaojiang_open.wav", close_voice = "Sfx\\voice\\chinese\\npc\\功能npc\\25_qiaojiang_close.wav"}
NPC_VOICE_PATH[26] = {mode = 0, open_voice = "Sfx\\voice\\chinese\\npc\\功能npc\\26_shituguanliyuan_open.wav", close_voice = "Sfx\\voice\\chinese\\npc\\功能npc\\26_shituguanliyuan_close.wav"}
NPC_VOICE_PATH[27] = {mode = 0, open_voice = "Sfx\\voice\\chinese\\npc\\功能npc\\27_shichangguanliyuan_open.wav", close_voice = "Sfx\\voice\\chinese\\npc\\功能npc\\27_shichangguanliyuan_close.wav"}
NPC_VOICE_PATH[28] = {mode = 1, open_voice = "Sfx\\voice\\chinese\\npc\\功能npc\\28_tiejiangpulaoban_open.wav", close_voice = "Sfx\\voice\\chinese\\npc\\功能npc\\28_tiejiangpulaoban_close.wav"}
NPC_VOICE_PATH[29] = {mode = 0, open_voice = "Sfx\\voice\\chinese\\npc\\功能npc\\29_yangzhidaoshi_open.wav", close_voice = "Sfx\\voice\\chinese\\npc\\功能npc\\29_yangzhidaoshi_close.wav"}
NPC_VOICE_PATH[30] = {mode = 1, open_voice = "Sfx\\voice\\chinese\\npc\\功能npc\\30_yishi_open.wav", close_voice = "Sfx\\voice\\chinese\\npc\\功能npc\\30_yishi_close.wav"}
NPC_VOICE_PATH[31] = {mode = 0, open_voice = "Sfx\\voice\\chinese\\npc\\功能npc\\31_meiguangudaoyouchai_open.wav", close_voice = "Sfx\\voice\\chinese\\npc\\功能npc\\31_meiguangudaoyouchai_close.wav"}
NPC_VOICE_PATH[32] = {mode = 1, open_voice = "Sfx\\voice\\chinese\\npc\\功能npc\\32_zhiyaodaoshi_open.wav", close_voice = "Sfx\\voice\\chinese\\npc\\功能npc\\32_zhiyaodaoshi_close.wav"}
NPC_VOICE_PATH[33] = {mode = 0, open_voice = "Sfx\\voice\\chinese\\npc\\功能npc\\33_zhongzhidaoshi_open.wav", close_voice = "Sfx\\voice\\chinese\\npc\\功能npc\\33_zhongzhidaoshi_close.wav"}
NPC_VOICE_PATH[34] = {mode = 1, open_voice = "Sfx\\voice\\chinese\\npc\\功能npc\\34_zhuuyshang_open.wav", close_voice = "Sfx\\voice\\chinese\\npc\\功能npc\\34_zhuyushang_close.wav"}
NPC_VOICE_PATH[35] = {mode = 0, open_voice = "Sfx\\voice\\chinese\\npc\\功能npc\\35_chongxu_open.wav", close_voice = "Sfx\\voice\\chinese\\npc\\功能npc\\35_chongxu_close.wav"}
NPC_VOICE_PATH[36] = {mode = 0, open_voice = "Sfx\\voice\\chinese\\npc\\功能npc\\36_qingxu_open.wav", close_voice = "Sfx\\voice\\chinese\\npc\\功能npc\\36_qingxu_close.wav"}
NPC_VOICE_PATH[37] = {mode = 0, open_voice = "Sfx\\voice\\chinese\\npc\\功能npc\\37_fangzheng_open.wav", close_voice = "Sfx\\voice\\chinese\\npc\\功能npc\\37_fangzheng_close.wav"}
NPC_VOICE_PATH[38] = {mode = 0, open_voice = "Sfx\\voice\\chinese\\npc\\功能npc\\38_fangsheng_open.wav", close_voice = "Sfx\\voice\\chinese\\npc\\功能npc\\38_fangsheng_close.wav"}
NPC_VOICE_PATH[39] = {mode = 0, open_voice = "Sfx\\voice\\chinese\\npc\\功能npc\\39_liaochenshitai_open.wav", close_voice = "Sfx\\voice\\chinese\\npc\\功能npc\\39_liaochenshitai_close.wav"}
NPC_VOICE_PATH[40] = {mode = 0, open_voice = "Sfx\\voice\\chinese\\npc\\功能npc\\40_jimingshitai_open.wav", close_voice = "Sfx\\voice\\chinese\\npc\\功能npc\\40_jimingshitai_close.wav"}
NPC_VOICE_PATH[41] = {mode = 0, open_voice = "Sfx\\voice\\chinese\\npc\\功能npc\\41_dingxianshitai_open.wav", close_voice = "Sfx\\voice\\chinese\\npc\\功能npc\\41_dingxianshitai_close.wav"}
NPC_VOICE_PATH[42] = {mode = 0, open_voice = "Sfx\\voice\\chinese\\npc\\功能npc\\42_yiling_open.wav", close_voice = "Sfx\\voice\\chinese\\npc\\功能npc\\42_yiling_close.wav"}
NPC_VOICE_PATH[43] = {mode = 0, open_voice = "Sfx\\voice\\chinese\\npc\\功能npc\\43_moda_open.wav", close_voice = "Sfx\\voice\\chinese\\npc\\功能npc\\43_moda_close.wav"}
NPC_VOICE_PATH[44] = {mode = 0, open_voice = "Sfx\\voice\\chinese\\npc\\功能npc\\44_huayufan_open.wav", close_voice = "Sfx\\voice\\chinese\\npc\\功能npc\\44_huayufan_close.wav"}
NPC_VOICE_PATH[45] = {mode = 0, open_voice = "Sfx\\voice\\chinese\\npc\\功能npc\\45_yuebuqun_open.wav", close_voice = "Sfx\\voice\\chinese\\npc\\功能npc\\45_yuebuqun_close.wav"}
NPC_VOICE_PATH[46] = {mode = 0, open_voice = "Sfx\\voice\\chinese\\npc\\功能npc\\46_qiunan_open.wav", close_voice = "Sfx\\voice\\chinese\\npc\\功能npc\\46_qiunan_close.wav"}
NPC_VOICE_PATH[47] = {mode = 0, open_voice = "Sfx\\voice\\chinese\\npc\\功能npc\\47_dongfangbubai_open.wav", close_voice = "Sfx\\voice\\chinese\\npc\\功能npc\\47_dongfangbubai_close.wav"}
NPC_VOICE_PATH[48] = {mode = 0, open_voice = "Sfx\\voice\\chinese\\npc\\功能npc\\48_duanwei_open.wav", close_voice = "Sfx\\voice\\chinese\\npc\\功能npc\\48_duanwei_close.wav"}
NPC_VOICE_PATH[49] = {mode = 0, open_voice = "Sfx\\voice\\chinese\\npc\\功能npc\\49_tangdaniang_open.wav", close_voice = "Sfx\\voice\\chinese\\npc\\功能npc\\49_tangdaniang_close.wav"}
NPC_VOICE_PATH[50] = {mode = 0, open_voice = "Sfx\\voice\\chinese\\npc\\功能npc\\50_tangdun_open.wav", close_voice = "Sfx\\voice\\chinese\\npc\\功能npc\\50_tangdun_close.wav"}
NPC_VOICE_PATH[51] = {mode = 0, open_voice = "Sfx\\voice\\chinese\\npc\\功能npc\\51_lanfenghuang_open.wav", close_voice = "Sfx\\voice\\chinese\\npc\\功能npc\\51_lanfenghuang_close.wav"}
NPC_VOICE_PATH[52] = {mode = 0, open_voice = "Sfx\\voice\\chinese\\npc\\功能npc\\52_gupo_open.wav", close_voice = "Sfx\\voice\\chinese\\npc\\功能npc\\52_gupo_close.wav"}
NPC_VOICE_PATH[53] = {mode = 0, open_voice = "Sfx\\voice\\chinese\\npc\\功能npc\\53_gongzigao_open.wav", close_voice = "Sfx\\voice\\chinese\\npc\\功能npc\\53_gongzigao_close.wav"}
NPC_VOICE_PATH[54] = {mode = 0, open_voice = "Sfx\\voice\\chinese\\npc\\功能npc\\54_haoyeman_open.wav", close_voice = "Sfx\\voice\\chinese\\npc\\功能npc\\54_haoyeman_close.wav"}]]--
NPC_VOICE_PATH[55] = {mode = 0, open_voice = --[[!AUTO_1106]]"sfx\\voice\\chinese\\npc\\客户端喊话及任务对白\\点击界面喊话\\玲珑.ogg", close_voice = --[[!AUTO_1107]]""}
NPC_VOICE_PATH[56] = {mode = 0, open_voice = --[[!AUTO_1108]]"sfx\\voice\\chinese\\npc\\客户端喊话及任务对白\\点击界面喊话\\独孤安\\沧桑.ogg", close_voice = --[[!AUTO_1109]]""}
NPC_VOICE_PATH[57] = {mode = 0, open_voice = --[[!AUTO_1110]]"sfx\\voice\\chinese\\npc\\功能师门\\逍遥子.ogg", close_voice = --[[!AUTO_1111]]""}
NPC_VOICE_PATH[58] = {mode = 0, open_voice = --[[!AUTO_1112]]"sfx\\voice\\chinese\\npc\\功能师门\\岳不群.ogg", close_voice = --[[!AUTO_1113]]""}
NPC_VOICE_PATH[59] = {mode = 0, open_voice = --[[!AUTO_1114]]"sfx\\voice\\chinese\\npc\\功能师门\\冲虚.ogg", close_voice = --[[!AUTO_1115]]""}
NPC_VOICE_PATH[60] = {mode = 0, open_voice = --[[!AUTO_1116]]"sfx\\voice\\chinese\\npc\\功能师门\\定闲师太.ogg", close_voice = --[[!AUTO_1117]]""}
NPC_VOICE_PATH[61] = {mode = 0, open_voice = --[[!AUTO_1118]]"sfx\\voice\\chinese\\npc\\功能师门\\定逸师太.ogg", close_voice = --[[!AUTO_1119]]""}
NPC_VOICE_PATH[62] = {mode = 0, open_voice = --[[!AUTO_1120]]"sfx\\voice\\chinese\\npc\\功能师门\\东方不败.ogg", close_voice = --[[!AUTO_1121]]""}
NPC_VOICE_PATH[63] = {mode = 0, open_voice = --[[!AUTO_1122]]"sfx\\voice\\chinese\\npc\\功能师门\\方生_少林.ogg", close_voice = --[[!AUTO_1123]]""}
NPC_VOICE_PATH[64] = {mode = 0, open_voice = --[[!AUTO_1124]]"sfx\\voice\\chinese\\npc\\功能师门\\方证.ogg", close_voice = --[[!AUTO_1125]]""}
NPC_VOICE_PATH[65] = {mode = 0, open_voice = --[[!AUTO_1126]]"sfx\\voice\\chinese\\npc\\功能师门\\金光上人.ogg", close_voice = --[[!AUTO_1127]]""}
NPC_VOICE_PATH[66] = {mode = 0, open_voice = --[[!AUTO_1128]]"sfx\\voice\\chinese\\npc\\功能师门\\蓝凤凰.ogg", close_voice = --[[!AUTO_1129]]""}
NPC_VOICE_PATH[67] = {mode = 0, open_voice = --[[!AUTO_1130]]"sfx\\voice\\chinese\\npc\\功能师门\\莫大.ogg", close_voice = --[[!AUTO_1131]]""}
NPC_VOICE_PATH[68] = {mode = 0, open_voice = --[[!AUTO_1132]]"sfx\\voice\\chinese\\npc\\功能师门\\宁中则.ogg", close_voice = --[[!AUTO_1133]]""}
NPC_VOICE_PATH[69] = {mode = 0, open_voice = --[[!AUTO_1134]]"sfx\\voice\\chinese\\npc\\功能师门\\唐大娘.ogg", close_voice = --[[!AUTO_1135]]""}
NPC_VOICE_PATH[70] = {mode = 0, open_voice = --[[!AUTO_1136]]"sfx\\voice\\chinese\\npc\\功能师门\\冯绍安\\冯绍安.ogg", close_voice = --[[!AUTO_1137]]""}
NPC_VOICE_PATH[71] = {mode = 0, open_voice = --[[!AUTO_1138]]"sfx\\voice\\chinese\\npc\\功能师门\\卢绍岐\\卢绍岐.ogg", close_voice = --[[!AUTO_1139]]""}
NPC_VOICE_PATH[72] = {mode = 0, open_voice = --[[!AUTO_1140]]"sfx\\voice\\chinese\\npc\\功能师门\\唐修文\\唐修文.ogg", close_voice = --[[!AUTO_1141]]""}
NPC_VOICE_PATH[73] = {mode = 0, open_voice = --[[!AUTO_1142]]"sfx\\voice\\chinese\\npc\\功能师门\\唐可风\\唐可风.ogg", close_voice = --[[!AUTO_1143]]""}
NPC_VOICE_PATH[74] = {mode = 0, open_voice = --[[!AUTO_1144]]"sfx\\voice\\chinese\\npc\\功能师门\\唐敦\\唐敦.ogg", close_voice = --[[!AUTO_1145]]""}
NPC_VOICE_PATH[75] = {mode = 0, open_voice = --[[!AUTO_1146]]"sfx\\voice\\chinese\\npc\\功能师门\\唐锦绣\\唐锦绣.ogg", close_voice = --[[!AUTO_1147]]""}
NPC_VOICE_PATH[76] = {mode = 0, open_voice = --[[!AUTO_1148]]"sfx\\voice\\chinese\\npc\\功能师门\\墨风\\墨风.ogg", close_voice = --[[!AUTO_1149]]""}
NPC_VOICE_PATH[77] = {mode = 0, open_voice = --[[!AUTO_1150]]"sfx\\voice\\chinese\\npc\\功能师门\\孙见革\\孙见革.ogg", close_voice = --[[!AUTO_1151]]""}
NPC_VOICE_PATH[78] = {mode = 0, open_voice = --[[!AUTO_1152]]"sfx\\voice\\chinese\\npc\\功能师门\\宴饮使\\宴饮使.ogg", close_voice = --[[!AUTO_1153]]""}
NPC_VOICE_PATH[79] = {mode = 0, open_voice = --[[!AUTO_1154]]"sfx\\voice\\chinese\\npc\\功能师门\\寂明师太\\寂明师太.ogg", close_voice = --[[!AUTO_1155]]""}
NPC_VOICE_PATH[80] = {mode = 0, open_voice = --[[!AUTO_1156]]"sfx\\voice\\chinese\\npc\\功能师门\\帮会管理员\\帮会管理员.ogg", close_voice = --[[!AUTO_1157]]""}
NPC_VOICE_PATH[81] = {mode = 0, open_voice = --[[!AUTO_1158]]"sfx\\voice\\chinese\\npc\\功能师门\\建设总管\\建设总管.ogg", close_voice = --[[!AUTO_1159]]""}
NPC_VOICE_PATH[82] = {mode = 0, open_voice = --[[!AUTO_1160]]"sfx\\voice\\chinese\\npc\\功能师门\\张孝全\\张孝全.ogg", close_voice = --[[!AUTO_1161]]""}
NPC_VOICE_PATH[83] = {mode = 0, open_voice = --[[!AUTO_1162]]"sfx\\voice\\chinese\\npc\\功能师门\\明英\\明英.ogg", close_voice = --[[!AUTO_1163]]""}
NPC_VOICE_PATH[84] = {mode = 0, open_voice = --[[!AUTO_1164]]"sfx\\voice\\chinese\\npc\\功能师门\\春晓\\春晓.ogg", close_voice = --[[!AUTO_1165]]""}
NPC_VOICE_PATH[85] = {mode = 0, open_voice = --[[!AUTO_1166]]"sfx\\voice\\chinese\\npc\\功能师门\\李慕绸\\李慕绸.ogg", close_voice = --[[!AUTO_1167]]""}
NPC_VOICE_PATH[86] = {mode = 0, open_voice = --[[!AUTO_1168]]"sfx\\voice\\chinese\\npc\\功能师门\\杜逢春\\杜逢春.ogg", close_voice = --[[!AUTO_1169]]""}
NPC_VOICE_PATH[87] = {mode = 0, open_voice = --[[!AUTO_1170]]"sfx\\voice\\chinese\\npc\\功能师门\\步炼诗\\步炼诗.ogg", close_voice = --[[!AUTO_1171]]""}
NPC_VOICE_PATH[88] = {mode = 0, open_voice = --[[!AUTO_1172]]"sfx\\voice\\chinese\\npc\\功能师门\\段得钢\\段得钢.ogg", close_voice = --[[!AUTO_1173]]""}
NPC_VOICE_PATH[89] = {mode = 0, open_voice = --[[!AUTO_1174]]"sfx\\voice\\chinese\\npc\\功能师门\\熊信\\熊信.ogg", close_voice = --[[!AUTO_1175]]""}
NPC_VOICE_PATH[90] = {mode = 0, open_voice = --[[!AUTO_1176]]"sfx\\voice\\chinese\\npc\\功能师门\\白发剑客\\白发剑客.ogg", close_voice = --[[!AUTO_1177]]""}
NPC_VOICE_PATH[91] = {mode = 0, open_voice = --[[!AUTO_1178]]"sfx\\voice\\chinese\\npc\\功能师门\\结义管理员\\结义管理员.ogg", close_voice = --[[!AUTO_1179]]""}
NPC_VOICE_PATH[92] = {mode = 0, open_voice = --[[!AUTO_1180]]"sfx\\voice\\chinese\\npc\\功能师门\\花不醉\\花不醉.ogg", close_voice = --[[!AUTO_1181]]""}
NPC_VOICE_PATH[93] = {mode = 0, open_voice = --[[!AUTO_1182]]"sfx\\voice\\chinese\\npc\\功能师门\\苏皓月\\苏皓月.ogg", close_voice = --[[!AUTO_1183]]""}
NPC_VOICE_PATH[94] = {mode = 0, open_voice = --[[!AUTO_1184]]"sfx\\voice\\chinese\\npc\\功能师门\\英白罗\\英白罗.ogg", close_voice = --[[!AUTO_1185]]""}
NPC_VOICE_PATH[95] = {mode = 0, open_voice = --[[!AUTO_1186]]"sfx\\voice\\chinese\\npc\\功能师门\\藏宝阁管事\\藏宝阁管事.ogg", close_voice = --[[!AUTO_1187]]""}
NPC_VOICE_PATH[96] = {mode = 0, open_voice = --[[!AUTO_1188]]"sfx\\voice\\chinese\\npc\\功能师门\\蛊婆\\蛊婆.ogg", close_voice = --[[!AUTO_1189]]""}
NPC_VOICE_PATH[97] = {mode = 0, open_voice = --[[!AUTO_1190]]"", close_voice = --[[!AUTO_1191]]""}
NPC_VOICE_PATH[98] = {mode = 0, open_voice = --[[!AUTO_1192]]"sfx\\voice\\chinese\\npc\\功能师门\\金不焕\\金不焕.ogg", close_voice = --[[!AUTO_1193]]""}
NPC_VOICE_PATH[99] = {mode = 0, open_voice = --[[!AUTO_1194]]"sfx\\voice\\chinese\\npc\\功能师门\\金锁\\金锁.ogg", close_voice = --[[!AUTO_1195]]""}
NPC_VOICE_PATH[100] = {mode = 0, open_voice = --[[!AUTO_1196]]"sfx\\voice\\chinese\\npc\\功能师门\\阮云霓\\阮云霓.ogg", close_voice = --[[!AUTO_1197]]""}
NPC_VOICE_PATH[101] = {mode = 0, open_voice = --[[!AUTO_1198]]"sfx\\voice\\chinese\\npc\\功能师门\\陆泊\\陆泊.ogg", close_voice = --[[!AUTO_1199]]""}
NPC_VOICE_PATH[102] = {mode = 0, open_voice = --[[!AUTO_1200]]"sfx\\voice\\chinese\\npc\\功能师门\\霍冰白\\霍冰白.ogg", close_voice = --[[!AUTO_1201]]""}
NPC_VOICE_PATH[103] = {mode = 0, open_voice = --[[!AUTO_1202]]"sfx\\voice\\chinese\\npc\\功能师门\\马俊\\马俊.ogg", close_voice = --[[!AUTO_1203]]""}
NPC_VOICE_PATH[104] = {mode = 0, open_voice = --[[!AUTO_1204]]"sfx\\voice\\chinese\\npc\\功能师门\\马可萝波\\马可萝波.ogg", close_voice = --[[!AUTO_1205]]""}
NPC_VOICE_PATH[105] = {mode = 0, open_voice = --[[!AUTO_1206]]"sfx\\voice\\chinese\\npc\\客户端喊话及任务对白\\任务对白\\白弦音\\01.ogg", close_voice = --[[!AUTO_1207]]""}
NPC_VOICE_PATH[106] = {mode = 0, open_voice = --[[!AUTO_1208]]"sfx\\voice\\chinese\\npc\\客户端喊话及任务对白\\任务对白\\东方不败npc普通对白\\47.ogg", close_voice = --[[!AUTO_1209]]""}
NPC_VOICE_PATH[107] = {mode = 0, open_voice = --[[!AUTO_1210]]"sfx\\voice\\chinese\\npc\\客户端喊话及任务对白\\任务对白\\花魁\\花魁1.ogg", close_voice = --[[!AUTO_1211]]""}
NPC_VOICE_PATH[108] = {mode = 0, open_voice = "sfx\\voice\\chinese\\npc\\风云再起\\开场白\\00中邪士兵.ogg", close_voice = ""}
NPC_VOICE_PATH[109] = {mode = 0, open_voice = "sfx\\voice\\chinese\\npc\\风云再起\\开场白\\00临死村民.ogg", close_voice = ""}
NPC_VOICE_PATH[110] = {mode = 0, open_voice = "sfx\\voice\\chinese\\npc\\风云再起\\开场白\\00云歌1.ogg", close_voice = ""}
NPC_VOICE_PATH[111] = {mode = 0, open_voice = "sfx\\voice\\chinese\\npc\\风云再起\\开场白\\00云歌2.ogg", close_voice = ""}
NPC_VOICE_PATH[112] = {mode = 0, open_voice = "sfx\\voice\\chinese\\npc\\风云再起\\开场白\\00云歌3.ogg", close_voice = ""}
NPC_VOICE_PATH[113] = {mode = 0, open_voice = SelectByPlayerGender("sfx\\voice\\chinese\\npc\\风云再起\\开场白\\00亦幻男.ogg", "sfx\\voice\\chinese\\npc\\风云再起\\开场白\\00亦幻女.ogg"), close_voice = ""}
NPC_VOICE_PATH[114] = {mode = 0, open_voice = SelectByPlayerGender("sfx\\voice\\chinese\\npc\\风云再起\\开场白\\00幻灭男.ogg", "sfx\\voice\\chinese\\npc\\风云再起\\开场白\\00幻灭女.ogg"), close_voice = ""}
NPC_VOICE_PATH[115] = {mode = 0, open_voice = "sfx\\voice\\chinese\\npc\\风云再起\\开场白\\00令狐冲.ogg", close_voice = ""}
NPC_VOICE_PATH[116] = {mode = 0, open_voice = "sfx\\voice\\chinese\\npc\\风云再起\\开场白\\00任我行1.ogg", close_voice = ""}
NPC_VOICE_PATH[117] = {mode = 0, open_voice = "sfx\\voice\\chinese\\npc\\风云再起\\开场白\\00任我行2.ogg", close_voice = ""}
NPC_VOICE_PATH[118] = {mode = 0, open_voice = "sfx\\voice\\chinese\\npc\\风云再起\\开场白\\00任我行3.ogg", close_voice = ""}
NPC_VOICE_PATH[119] = {mode = 0, open_voice = "sfx\\voice\\chinese\\npc\\风云再起\\开场白\\00任我行4.ogg", close_voice = ""}
NPC_VOICE_PATH[120] = {mode = 0, open_voice = "sfx\\voice\\chinese\\npc\\风云再起\\开场白\\00任我行5.ogg", close_voice = ""}
NPC_VOICE_PATH[121] = {mode = 0, open_voice = "sfx\\voice\\chinese\\npc\\风云再起\\开场白\\00任我行6.ogg", close_voice = ""}
NPC_VOICE_PATH[122] = {mode = 0, open_voice = "sfx\\voice\\chinese\\npc\\风云再起\\开场白\\00任我行7.ogg", close_voice = ""}
NPC_VOICE_PATH[123] = {mode = 0, open_voice = "sfx\\voice\\chinese\\npc\\风云再起\\开场白\\00任盈盈1.ogg", close_voice = ""}
NPC_VOICE_PATH[124] = {mode = 0, open_voice = "sfx\\voice\\chinese\\npc\\风云再起\\开场白\\00任盈盈2.ogg", close_voice = ""}
NPC_VOICE_PATH[125] = {mode = 0, open_voice = "sfx\\voice\\chinese\\npc\\风云再起\\开场白\\00任盈盈3.ogg", close_voice = ""}
NPC_VOICE_PATH[126] = {mode = 0, open_voice = "sfx\\voice\\chinese\\npc\\风云再起\\开场白\\00何弼恺.ogg", close_voice = ""}
NPC_VOICE_PATH[127] = {mode = 0, open_voice = "sfx\\voice\\chinese\\npc\\风云再起\\开场白\\00佤氏夫人.ogg", close_voice = ""}
NPC_VOICE_PATH[128] = {mode = 0, open_voice = "sfx\\voice\\chinese\\npc\\风云再起\\开场白\\00俞贤.ogg", close_voice = ""}
NPC_VOICE_PATH[129] = {mode = 0, open_voice = "sfx\\voice\\chinese\\npc\\风云再起\\开场白\\00傅冬柳.ogg", close_voice = ""}
NPC_VOICE_PATH[130] = {mode = 0, open_voice = "sfx\\voice\\chinese\\npc\\风云再起\\开场白\\00关三秋.ogg", close_voice = ""}
NPC_VOICE_PATH[131] = {mode = 0, open_voice = "sfx\\voice\\chinese\\npc\\风云再起\\开场白\\00卫士.ogg", close_voice = ""}
NPC_VOICE_PATH[132] = {mode = 0, open_voice = "sfx\\voice\\chinese\\npc\\风云再起\\开场白\\00向问天1.ogg", close_voice = ""}
NPC_VOICE_PATH[133] = {mode = 0, open_voice = "sfx\\voice\\chinese\\npc\\风云再起\\开场白\\00向问天2.ogg", close_voice = ""}
NPC_VOICE_PATH[134] = {mode = 0, open_voice = "sfx\\voice\\chinese\\npc\\风云再起\\开场白\\00向问天3.ogg", close_voice = ""}
NPC_VOICE_PATH[135] = {mode = 0, open_voice = "sfx\\voice\\chinese\\npc\\风云再起\\开场白\\00向问天4.ogg", close_voice = ""}
NPC_VOICE_PATH[136] = {mode = 0, open_voice = "sfx\\voice\\chinese\\npc\\风云再起\\开场白\\00吴老爹.ogg", close_voice = ""}
NPC_VOICE_PATH[137] = {mode = 0, open_voice = "sfx\\voice\\chinese\\npc\\风云再起\\开场白\\00唐石匠.ogg", close_voice = ""}
NPC_VOICE_PATH[138] = {mode = 0, open_voice = "sfx\\voice\\chinese\\npc\\风云再起\\开场白\\00夏风.ogg", close_voice = ""}
NPC_VOICE_PATH[139] = {mode = 0, open_voice = "sfx\\voice\\chinese\\npc\\风云再起\\开场白\\00夭红袖.ogg", close_voice = ""}
NPC_VOICE_PATH[140] = {mode = 0, open_voice = "sfx\\voice\\chinese\\npc\\风云再起\\开场白\\00妞妞.ogg", close_voice = ""}
NPC_VOICE_PATH[141] = {mode = 0, open_voice = "sfx\\voice\\chinese\\npc\\风云再起\\开场白\\00定静1.ogg", close_voice = ""}
NPC_VOICE_PATH[142] = {mode = 0, open_voice = "sfx\\voice\\chinese\\npc\\风云再起\\开场白\\00定静2.ogg", close_voice = ""}
NPC_VOICE_PATH[143] = {mode = 0, open_voice = "sfx\\voice\\chinese\\npc\\风云再起\\开场白\\00寂明师太.ogg", close_voice = ""}
NPC_VOICE_PATH[144] = {mode = 0, open_voice = SelectByPlayerGender("sfx\\voice\\chinese\\npc\\风云再起\\开场白\\00风云男.ogg", "sfx\\voice\\chinese\\npc\\风云再起\\开场白\\00风云女.ogg"), close_voice = ""}
NPC_VOICE_PATH[145] = {mode = 0, open_voice = SelectByPlayerGender("sfx\\voice\\chinese\\npc\\风云再起\\开场白\\00庆王男.ogg", "sfx\\voice\\chinese\\npc\\风云再起\\开场白\\00庆王女.ogg"), close_voice = ""}
NPC_VOICE_PATH[146] = {mode = 0, open_voice = SelectByPlayerGender("sfx\\voice\\chinese\\npc\\风云再起\\开场白\\00福王男.ogg", "sfx\\voice\\chinese\\npc\\风云再起\\开场白\\00福王女.ogg"), close_voice = ""}
NPC_VOICE_PATH[147] = {mode = 0, open_voice = SelectByPlayerGender("sfx\\voice\\chinese\\npc\\风云再起\\开场白\\00春秋男.ogg", "sfx\\voice\\chinese\\npc\\风云再起\\开场白\\00春秋女.ogg"), close_voice = ""}
NPC_VOICE_PATH[148] = {mode = 0, open_voice = "sfx\\voice\\chinese\\npc\\风云再起\\开场白\\00无相师太.ogg", close_voice = ""}
NPC_VOICE_PATH[149] = {mode = 0, open_voice = "sfx\\voice\\chinese\\npc\\风云再起\\开场白\\00春秋女.ogg", close_voice = ""}
NPC_VOICE_PATH[150] = {mode = 0, open_voice = "sfx\\voice\\chinese\\npc\\风云再起\\开场白\\00春秋男.ogg", close_voice = ""}
NPC_VOICE_PATH[151] = {mode = 0, open_voice = "sfx\\voice\\chinese\\npc\\风云再起\\开场白\\00朝云公主.ogg", close_voice = ""}
NPC_VOICE_PATH[152] = {mode = 0, open_voice = "sfx\\voice\\chinese\\npc\\风云再起\\开场白\\00李承欢.ogg", close_voice = ""}
NPC_VOICE_PATH[153] = {mode = 0, open_voice = "sfx\\voice\\chinese\\npc\\风云再起\\开场白\\00李承欢2.ogg", close_voice = ""}
NPC_VOICE_PATH[154] = {mode = 0, open_voice = "sfx\\voice\\chinese\\npc\\风云再起\\开场白\\00杜偃师.ogg", close_voice = ""}
NPC_VOICE_PATH[155] = {mode = 0, open_voice = "sfx\\voice\\chinese\\npc\\风云再起\\开场白\\00杨莲亭1.ogg", close_voice = ""}
NPC_VOICE_PATH[156] = {mode = 0, open_voice = "sfx\\voice\\chinese\\npc\\风云再起\\开场白\\00杨莲亭2.ogg", close_voice = ""}
NPC_VOICE_PATH[157] = {mode = 0, open_voice = "sfx\\voice\\chinese\\npc\\风云再起\\开场白\\00杨莲亭3.ogg", close_voice = ""}
NPC_VOICE_PATH[158] = {mode = 0, open_voice = "sfx\\voice\\chinese\\npc\\风云再起\\开场白\\00杨莲亭4.ogg", close_voice = ""}
NPC_VOICE_PATH[159] = {mode = 0, open_voice = "sfx\\voice\\chinese\\npc\\风云再起\\开场白\\00燕青1.ogg", close_voice = ""}
NPC_VOICE_PATH[160] = {mode = 0, open_voice = "sfx\\voice\\chinese\\npc\\风云再起\\开场白\\00燕青2.ogg", close_voice = ""}
NPC_VOICE_PATH[161] = {mode = 0, open_voice = "sfx\\voice\\chinese\\npc\\风云再起\\开场白\\00玉粟.ogg", close_voice = ""}
NPC_VOICE_PATH[162] = {mode = 0, open_voice = "sfx\\voice\\chinese\\npc\\风云再起\\开场白\\00王修纂.ogg", close_voice = ""}
NPC_VOICE_PATH[163] = {mode = 0, open_voice = "sfx\\voice\\chinese\\npc\\风云再起\\开场白\\00田伯光1.ogg", close_voice = ""}
NPC_VOICE_PATH[164] = {mode = 0, open_voice = "sfx\\voice\\chinese\\npc\\风云再起\\开场白\\00田伯光2.ogg", close_voice = ""}
NPC_VOICE_PATH[165] = {mode = 0, open_voice = "sfx\\voice\\chinese\\npc\\风云再起\\开场白\\00田伯光3.ogg", close_voice = ""}
NPC_VOICE_PATH[166] = {mode = 0, open_voice = "sfx\\voice\\chinese\\npc\\风云再起\\开场白\\00田伯光4.ogg", close_voice = ""}
NPC_VOICE_PATH[167] = {mode = 0, open_voice = "sfx\\voice\\chinese\\npc\\风云再起\\开场白\\00田伯光5.ogg", close_voice = ""}
NPC_VOICE_PATH[168] = {mode = 0, open_voice = "sfx\\voice\\chinese\\npc\\风云再起\\开场白\\00田伯光6.ogg", close_voice = ""}
NPC_VOICE_PATH[169] = {mode = 0, open_voice = "sfx\\voice\\chinese\\npc\\风云再起\\开场白\\00疯癫老妪.ogg", close_voice = ""}
NPC_VOICE_PATH[170] = {mode = 0, open_voice = "sfx\\voice\\chinese\\npc\\风云再起\\开场白\\00碧逍遥.ogg", close_voice = ""}
NPC_VOICE_PATH[171] = {mode = 0, open_voice = "sfx\\voice\\chinese\\npc\\风云再起\\开场白\\00福王女.ogg", close_voice = ""}
NPC_VOICE_PATH[172] = {mode = 0, open_voice = "sfx\\voice\\chinese\\npc\\风云再起\\开场白\\00福王男.ogg", close_voice = ""}
NPC_VOICE_PATH[173] = {mode = 0, open_voice = "sfx\\voice\\chinese\\npc\\风云再起\\开场白\\00秃笔翁.ogg", close_voice = ""}
NPC_VOICE_PATH[174] = {mode = 0, open_voice = "sfx\\voice\\chinese\\npc\\风云再起\\开场白\\00秦靖王1.ogg", close_voice = ""}
NPC_VOICE_PATH[175] = {mode = 0, open_voice = "sfx\\voice\\chinese\\npc\\风云再起\\开场白\\00秦靖王2.ogg", close_voice = ""}
NPC_VOICE_PATH[176] = {mode = 0, open_voice = "sfx\\voice\\chinese\\npc\\风云再起\\开场白\\00童百熊.ogg", close_voice = ""}
NPC_VOICE_PATH[177] = {mode = 0, open_voice = "sfx\\voice\\chinese\\npc\\风云再起\\开场白\\00老疯子1.ogg", close_voice = ""}
NPC_VOICE_PATH[178] = {mode = 0, open_voice = "sfx\\voice\\chinese\\npc\\风云再起\\开场白\\00老疯子2.ogg", close_voice = ""}
NPC_VOICE_PATH[179] = {mode = 0, open_voice = "sfx\\voice\\chinese\\npc\\风云再起\\开场白\\00花晴然.ogg", close_voice = ""}
NPC_VOICE_PATH[180] = {mode = 0, open_voice = "sfx\\voice\\chinese\\npc\\风云再起\\开场白\\00莫风.ogg", close_voice = ""}
NPC_VOICE_PATH[181] = {mode = 0, open_voice = "sfx\\voice\\chinese\\npc\\风云再起\\开场白\\00菊朵朵.ogg", close_voice = ""}
NPC_VOICE_PATH[182] = {mode = 0, open_voice = "sfx\\voice\\chinese\\npc\\风云再起\\开场白\\00葛云.ogg", close_voice = ""}
NPC_VOICE_PATH[183] = {mode = 0, open_voice = "sfx\\voice\\chinese\\npc\\风云再起\\开场白\\00西门追月.ogg", close_voice = ""}
NPC_VOICE_PATH[184] = {mode = 0, open_voice = "sfx\\voice\\chinese\\npc\\风云再起\\开场白\\00赛孔明.ogg", close_voice = ""}
NPC_VOICE_PATH[185] = {mode = 0, open_voice = "sfx\\voice\\chinese\\npc\\风云再起\\开场白\\00赛孔明2.ogg", close_voice = ""}
NPC_VOICE_PATH[186] = {mode = 0, open_voice = "sfx\\voice\\chinese\\npc\\风云再起\\开场白\\00连芷墨.ogg", close_voice = ""}
NPC_VOICE_PATH[187] = {mode = 0, open_voice = "sfx\\voice\\chinese\\npc\\风云再起\\开场白\\00银双儿.ogg", close_voice = ""}
NPC_VOICE_PATH[188] = {mode = 0, open_voice = "sfx\\voice\\chinese\\npc\\风云再起\\开场白\\00阿英.ogg", close_voice = ""}
NPC_VOICE_PATH[189] = {mode = 0, open_voice = "sfx\\voice\\chinese\\npc\\风云再起\\开场白\\00阿英2.ogg", close_voice = ""}
NPC_VOICE_PATH[190] = {mode = 0, open_voice = "sfx\\voice\\chinese\\npc\\风云再起\\开场白\\00阿英3.ogg", close_voice = ""}
NPC_VOICE_PATH[191] = {mode = 0, open_voice = "sfx\\voice\\chinese\\npc\\风云再起\\开场白\\00雪芙蓉.ogg", close_voice = ""}
NPC_VOICE_PATH[192] = {mode = 0, open_voice = "sfx\\voice\\chinese\\npc\\风云再起\\开场白\\00风云女.ogg", close_voice = ""}
NPC_VOICE_PATH[193] = {mode = 0, open_voice = "sfx\\voice\\chinese\\npc\\风云再起\\开场白\\00风云男.ogg", close_voice = ""}
NPC_VOICE_PATH[194] = {mode = 0, open_voice = "sfx\\voice\\chinese\\npc\\风云再起\\开场白\\00黄靖.ogg", close_voice = ""}
NPC_VOICE_PATH[195] = {mode = 0, open_voice = "sfx\\voice\\chinese\\npc\\风云再起\\开场白\\00重欢.ogg", close_voice = ""}
NPC_VOICE_PATH[196] = {mode = 0, open_voice = "sfx\\voice\\chinese\\npc\\风云再起\\开场白\\00阿诗玛1.ogg", close_voice = ""}
NPC_VOICE_PATH[197] = {mode = 0, open_voice = "sfx\\voice\\chinese\\npc\\风云再起\\开场白\\00阿诗玛2.ogg", close_voice = ""}
NPC_VOICE_PATH[198] = {mode = 0, open_voice = "sfx\\voice\\chinese\\npc\\风云再起\\开场白\\00何姑.ogg", close_voice = ""}
NPC_VOICE_PATH[199] = {mode = 0, open_voice = "sfx\\voice\\chinese\\npc\\风云再起\\客户端喊话及任务对白\\0诗蔓.ogg", close_voice = ""}
NPC_VOICE_PATH[200] = {mode = 0, open_voice = "sfx\\voice\\chinese\\npc\\客户端喊话及任务对白\\客户端喊话\\圣诞老人.ogg", close_voice = ""}


-----------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------
SPEAK_SCENE_TEXT = {
	[-1] = "",
	[0] = "",
	[101] = "【第一滴血】",
	[102] = "【枪打出头鸟】",
	[103] = "",
	[104] = "",
	[105] = "",
	[106] = "",
	[107] = "",
	[108] = "",
	[109] = "",
	[110] = "",
	[203] = "大杀特杀",
	[204] = "主宰比赛",
	[205] = "杀人如麻",
	[206] = "无人能档",
	[207] = "杀得变态",
	[208] = "真的跟妖怪一样",
	[209] = "如同神一般",
	[210] = "超越神",
	[303] = "毫无还手之力了",
	[304] = "大死特死了",
	[305] = "像ATM机一样了",
	[306] = "死得不能再死了",
	[307] = "求求谁让他杀一下吧",
	[7386] = "武林盟主",
	[7387] = "苍穹贤士",
	[7388] = "传功长老",
	[7389] = "执法长老",
	[7390] = "天罡护法",
	[7391] = "地煞护法",
	[7392] = "冥龙坛主",
	[7393] = "赤焰坛主",
	[7394] = "青木坛主",
	[7395] = "雪祭坛主",
	[7396] = "飞龙军",
	[7510] = "龙门镖师"
}