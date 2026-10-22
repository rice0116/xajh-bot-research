--[[#tag push auto]]

--[[
	配置NPC声音，包括默认开启/关闭服务，接、交任务等
	格式：
		NPCVoiceConfig[npc模板ID] =
		{
			--非任务事件
			[事件名] = {sfx = 音效文件, text = 对白},

			--任务事件
			[事件名] =
			{
				[任务ID] = {sfx = 音效文件, text = 对白},
			},
		}
	事件名支持：
		begin_talk 开始与NPC对话(服务)
		end_talk 对话(服务)结束
		can_receive_task 任务可接 (可能覆盖begin_talk)
		receive_task 接到任务
		can_finish_task 任务可完成 (可能覆盖end_talk)
		finish_task 任务完成
	音效文件例:
		"sfx\\voice\\chinese\\2_buaoshang_close.wav"
]]
local NPCVoiceConfig =
{
}

NPCVoice = {}
function NPCVoice:GetAndReleaseAllConfig ()
	local ret = NPCVoiceConfig
	NPCVoiceConfig = nil
	return ret
end

--return min, max. min为开始衰减的距离，max为衰减至0的距离
function NPCVoice:GetSoundRange ()
	return 5, 18
end

--用此函数可以短路径生成完整路径，减少文字输入
local function VOICE (shortPath)
	return --[[!AUTO_1]]"sfx\\voice\\chinese\\"..shortPath
end
local function TASK_VOICE (shortPath)
	return --[[!AUTO_2]]"sfx\\voice\\chinese\\npc\\客户端喊话及任务对白\\任务对白\\"..shortPath
end
local function SCH_VOICE (shortPath)
	return --[[!AUTO_3]]"sfx\\voice\\chinese\\npc\\门派指引\\"..shortPath
end
--
-- 数据段开始
--

NPCVoiceConfig[3621] =	--测试例
{
	begin_talk = {sfx = VOICE--[[!AUTO_4]]"1_banghuiguanliyuan_open.wav", text = --[[!AUTO_5]]"對白 begin_talk"},
	end_talk = {sfx = VOICE--[[!AUTO_6]]"1_banghuiguanliyuan_close.wav", text = --[[!AUTO_7]]"對白 end_talk"},
	can_receive_task =
	{
		[3977] = {sfx = VOICE--[[!AUTO_8]]"2_buaoshang_open.wav", text = --[[!AUTO_9]]"3977 can_receive_task"},
		[4084] = {sfx = VOICE--[[!AUTO_10]]"2_buaoshang_close.wav", text = --[[!AUTO_11]]"4084 can_receive_task"},
	},
	receive_task =
	{
		[3977] = {sfx = VOICE--[[!AUTO_12]]"2_buaoshang_close.wav", text = --[[!AUTO_13]]"3977 receive_task"},
		[4084] = {sfx = VOICE--[[!AUTO_14]]"2_buaoshang_open.wav", text = --[[!AUTO_15]]"4084 receive_task"},
	},
	can_finish_task =
	{
		[3977] = {sfx = VOICE--[[!AUTO_16]]"3_bubodaoshi_open.wav", text = --[[!AUTO_17]]"3977 can_finish_task"},
		[4084] = {sfx = VOICE--[[!AUTO_18]]"3_bubodaoshi_close.wav", text = --[[!AUTO_19]]"4084 can_finish_task"},
	},
	finish_task =
	{
		[3977] = {sfx = VOICE--[[!AUTO_20]]"3_bubodaoshi_close.wav", text = --[[!AUTO_21]]"3977 finish_task"},
		[4084] = {sfx = VOICE--[[!AUTO_22]]"3_bubodaoshi_open.wav", text = --[[!AUTO_23]]"4084 finish_task"},
	},
}
----------------------------------------------------任务语音配置-----------------------------------------------------
NPCVoiceConfig[61707] =	--令狐冲
{
	can_receive_task =
	{
		[5334] = {sfx = TASK_VOICE--[[!AUTO_24]]"令狐冲\\02.ogg", text = --[[!AUTO_25]]"在下乃是令狐沖，華山派門下不成器的弟子。"},
	},
	receive_task =
	{
		[5334] = {sfx = TASK_VOICE--[[!AUTO_26]]"令狐冲\\03.ogg", text = --[[!AUTO_27]]"行氣，深則蓄，蓄則伸，伸則下，下則定，定則固，固則萌，萌則長，長則退，退則天。"},
		[5207] = {sfx = TASK_VOICE--[[!AUTO_28]]"令狐冲\\05.ogg", text = --[[!AUTO_29]]"後會有期！"},
	},
	can_finish_task =
	{
		[5334] = {sfx = TASK_VOICE--[[!AUTO_30]]"令狐冲\\01.ogg", text = --[[!AUTO_31]]"哈哈哈，身體可還有所不適？"},
		[5206] = {sfx = TASK_VOICE--[[!AUTO_32]]"令狐冲\\04.ogg", text = --[[!AUTO_33]]"哈哈哈哈，好酒！痛快！"},
	},
}
NPCVoiceConfig[61710] =	--令狐冲
{
	receive_task =
	{
		[5225] = {sfx = TASK_VOICE--[[!AUTO_34]]"令狐冲\\07.ogg", text = --[[!AUTO_35]]"我先行一步，你我在前方會和。"},
	},
	finish_task =
	{
		[5341] = {sfx = TASK_VOICE--[[!AUTO_36]]"令狐冲\\06.ogg", text = --[[!AUTO_37]]"咱們又見面了。"},
	},
}
NPCVoiceConfig[61713] =	--令狐冲
{
	receive_task =
	{
		[5478] = {sfx = TASK_VOICE--[[!AUTO_38]]"令狐冲\\09.ogg", text = --[[!AUTO_39]]"帶上這些化毒散，將前方那些毒霧驅散掉！"},
	},
	finish_task =
	{
		[5228] = {sfx = TASK_VOICE--[[!AUTO_40]]"令狐冲\\08.ogg", text = --[[!AUTO_41]]"逝者已逝，還請少俠節哀。"},
	},
}
NPCVoiceConfig[61716] =	--令狐冲
{
	receive_task =
	{
		[5479] = {sfx = TASK_VOICE--[[!AUTO_42]]"令狐冲\\10.ogg", text = --[[!AUTO_43]]"欲擒賊，先擒王。你先去前方探探虛實！"},
	},
}
NPCVoiceConfig[68587] =	--令狐冲
{
	receive_task =
	{
		[5354] = {sfx = TASK_VOICE--[[!AUTO_44]]"令狐冲\\11.ogg", text = --[[!AUTO_45]]"就此別過，希望下次見面。"},
		[5358] = {sfx = TASK_VOICE--[[!AUTO_46]]"令狐冲\\11.ogg", text = --[[!AUTO_47]]"就此別過，希望下次見面。"},
		[5357] = {sfx = TASK_VOICE--[[!AUTO_48]]"令狐冲\\11.ogg", text = --[[!AUTO_49]]"就此別過，希望下次見面。"},
		[5359] = {sfx = TASK_VOICE--[[!AUTO_50]]"令狐冲\\11.ogg", text = --[[!AUTO_51]]"就此別過，希望下次見面。"},
		[5352] = {sfx = TASK_VOICE--[[!AUTO_52]]"令狐冲\\11.ogg", text = --[[!AUTO_53]]"就此別過，希望下次見面。"},
		[5355] = {sfx = TASK_VOICE--[[!AUTO_54]]"令狐冲\\11.ogg", text = --[[!AUTO_55]]"就此別過，希望下次見面。"},
		[5351] = {sfx = TASK_VOICE--[[!AUTO_56]]"令狐冲\\11.ogg", text = --[[!AUTO_57]]"就此別過，希望下次見面。"},
		[5348] = {sfx = TASK_VOICE--[[!AUTO_58]]"令狐冲\\11.ogg", text = --[[!AUTO_59]]"就此別過，希望下次見面。"},
		[5353] = {sfx = TASK_VOICE--[[!AUTO_60]]"令狐冲\\11.ogg", text = --[[!AUTO_61]]"就此別過，希望下次見面。"},
		[5356] = {sfx = TASK_VOICE--[[!AUTO_62]]"令狐冲\\11.ogg", text = --[[!AUTO_63]]"就此別過，希望下次見面。"},
	},
}
NPCVoiceConfig[61743] =	--方生
{
	receive_task =
	{
		[5342] = {sfx = TASK_VOICE--[[!AUTO_64]]"方生\\关切.ogg", text = --[[!AUTO_65]]"施主請多加小心。"},
	},
	can_finish_task =
	{
		[5220] = {sfx = TASK_VOICE--[[!AUTO_66]]"方生\\苍老沉稳.ogg", text = --[[!AUTO_67]]"阿彌陀佛……"},
		[5223] = {sfx = TASK_VOICE--[[!AUTO_68]]"方生\\欣赏.ogg", text = --[[!AUTO_69]]"阿彌陀佛，有勞施主。"},
		[5342] = {sfx = TASK_VOICE--[[!AUTO_70]]"方生\\关切.ogg", text = --[[!AUTO_71]]"施主請多加小心。"},
	},
}
NPCVoiceConfig[35609] =	--玄高
{
	finish_task =
	{
		[3975] = {sfx = TASK_VOICE--[[!AUTO_72]]"玄高道人.ogg", text = --[[!AUTO_73]]"快！快隨我去解救同門師兄弟們！"},
	},
}
NPCVoiceConfig[55597] =	--不戒
{
	finish_task =
	{
		[4587] = {sfx = TASK_VOICE--[[!AUTO_74]]"不戒.ogg", text = --[[!AUTO_75]]"這傢夥號稱萬裡獨行，想不到這麼不經打！"},
	},
}
NPCVoiceConfig[58745] =	--百合
{
	receive_task =
	{
		[4798] = {sfx = TASK_VOICE--[[!AUTO_76]]"百合\\百合9.ogg", text = --[[!AUTO_77]]"呵呵呵，既然如此，這真言粉就交給你來餵吧！"},
	},
	finish_task =
	{
		[4803] = {sfx = TASK_VOICE--[[!AUTO_78]]"百合\\百合8.ogg", text = --[[!AUTO_79]]"那裡來的毛賊？！"},
	},
}
NPCVoiceConfig[36030] =	--陈心武
{
	receive_task =
	{
		[5210] = {sfx = TASK_VOICE--[[!AUTO_80]]"陈心武\\陈心武.ogg", text = --[[!AUTO_81]]"闖蕩江湖，沒有一件稱心的武器怎麼行？有空就來店裡轉轉，包君滿意。"},
	},
}
NPCVoiceConfig[36839] =	--单思南
{
	finish_task =
	{
		[3877] = {sfx = TASK_VOICE--[[!AUTO_82]]"单思南\\单思南1.ogg", text = --[[!AUTO_83]]"少俠果真年輕有為。"},
	},
}
NPCVoiceConfig[57520] =	--单思南
{
	receive_task =
	{
		[3970] = {sfx = TASK_VOICE--[[!AUTO_84]]"单思南\\单思南2.ogg", text = --[[!AUTO_85]]"楊大人被許顯純那賊人給捉走了！"},
	},
}
NPCVoiceConfig[67953] =	--费彬
{
	receive_task =
	{
		[5572] = {sfx = TASK_VOICE--[[!AUTO_86]]"费彬\\狠毒3.ogg", text = --[[!AUTO_87]]"好！若一個時辰後，你沒有兌現你的承諾，休怪我不留情面！"},
	},
}
NPCVoiceConfig[55618] =	--风清扬
{
	finish_task =
	{
		[4597] = {sfx =--[[!AUTO_88]]"sfx\\voice\\chinese\\npc\\客户端喊话及任务对白\\客户端喊话\\风清扬\\22.ogg", text = --[[!AUTO_89]]"呵，今日還真是來了不少朋友。"},
	},
}
NPCVoiceConfig[35648] =	--封不凡
{
	receive_task =
	{
		[3905] = {sfx = TASK_VOICE--[[!AUTO_90]]"封不凡\\封不凡2.ogg", text = --[[!AUTO_91]]"還望少俠能替天行道，將這惡賊殺之後快！"},
	},
	finish_task =
	{
		[3903] = {sfx = TASK_VOICE--[[!AUTO_92]]"封不凡\\封不凡1.ogg", text = --[[!AUTO_93]]"久仰久仰。"},
	},
}
NPCVoiceConfig[35350] =	--凤七七
{
	finish_task =
	{
		[4063] = {sfx = TASK_VOICE--[[!AUTO_94]]"凤七七\\凤七七.ogg", text = --[[!AUTO_95]]"真是晦氣，又有人在酒樓裡鬧事了，這些江湖人三天兩頭打打殺殺，真是讓人生厭。"},
	},
}
NPCVoiceConfig[35311] =	--何三七
{
	receive_task =
	{
		[3794] = {sfx = TASK_VOICE--[[!AUTO_96]]"何三七\\何三七2.ogg", text = --[[!AUTO_97]]"餛飩，熱乎乎香噴噴的餛飩勒~~~"},
	},
	finish_task =
	{
		[3793] = {sfx = TASK_VOICE--[[!AUTO_98]]"何三七\\何三七1.ogg", text = --[[!AUTO_99]]"這位少俠，要不要來一碗餛飩？皮薄餡多呐！"},
		[3999] = {sfx = TASK_VOICE--[[!AUTO_100]]"何三七\\何三七1.ogg", text = --[[!AUTO_101]]"這位少俠，要不要來一碗餛飩？皮薄餡多呐！"},
		[4000] = {sfx = TASK_VOICE--[[!AUTO_102]]"何三七\\何三七1.ogg", text = --[[!AUTO_103]]"這位少俠，要不要來一碗餛飩？皮薄餡多呐！"},
		[4001] = {sfx = TASK_VOICE--[[!AUTO_104]]"何三七\\何三七1.ogg", text = --[[!AUTO_105]]"這位少俠，要不要來一碗餛飩？皮薄餡多呐！"},
		[4002] = {sfx = TASK_VOICE--[[!AUTO_106]]"何三七\\何三七1.ogg", text = --[[!AUTO_107]]"這位少俠，要不要來一碗餛飩？皮薄餡多呐！"},
		[4003] = {sfx = TASK_VOICE--[[!AUTO_108]]"何三七\\何三七1.ogg", text = --[[!AUTO_109]]"這位少俠，要不要來一碗餛飩？皮薄餡多呐！"},
		[4004] = {sfx = TASK_VOICE--[[!AUTO_110]]"何三七\\何三七1.ogg", text = --[[!AUTO_111]]"這位少俠，要不要來一碗餛飩？皮薄餡多呐！"},
		[4005] = {sfx = TASK_VOICE--[[!AUTO_112]]"何三七\\何三七1.ogg", text = --[[!AUTO_113]]"這位少俠，要不要來一碗餛飩？皮薄餡多呐！"},
		[4006] = {sfx = TASK_VOICE--[[!AUTO_114]]"何三七\\何三七1.ogg", text = --[[!AUTO_115]]"這位少俠，要不要來一碗餛飩？皮薄餡多呐！"},
		[4007] = {sfx = TASK_VOICE--[[!AUTO_116]]"何三七\\何三七1.ogg", text = --[[!AUTO_117]]"這位少俠，要不要來一碗餛飩？皮薄餡多呐！"},
	},
}
NPCVoiceConfig[45179] =	--胆怯的嵩山弟子
{
	finish_task =
	{
		[5214] = {sfx = TASK_VOICE--[[!AUTO_118]]"惊恐的嵩山弟子\\惊恐的嵩山弟子.ogg", text = --[[!AUTO_119]]"別……別殺我！我我我什麼都不知道。"},
	},
}
NPCVoiceConfig[67954] =	--老江湖
{
	receive_task =
	{
		[5577] = {sfx = TASK_VOICE--[[!AUTO_120]]"老江湖\\老江湖1.ogg", text = --[[!AUTO_121]]"呵呵，先問過我肚子裡的酒蟲再說。"},
	},
}
NPCVoiceConfig[68301] =	--老江湖
{
	finish_task =
	{
		[5819] = {sfx = TASK_VOICE--[[!AUTO_122]]"老江湖\\老江湖2.ogg", text = --[[!AUTO_123]]"哈哈哈，你這呆子，還說沒醉，石像和人都分不清，笑死我了！"},
	},
}
NPCVoiceConfig[55624] =	--令狐冲
{
	finish_task =
	{
		[4600] = {sfx = TASK_VOICE--[[!AUTO_124]]"令狐冲\\15.ogg", text = --[[!AUTO_125]]"想不到子衡山一別，如今你已然能獨當一面。"},
	},
}
NPCVoiceConfig[44108] =	--令狐冲
{
	receive_task =
	{
		[3836] = {sfx = TASK_VOICE--[[!AUTO_126]]"令狐冲\\13.ogg", text = --[[!AUTO_127]]"真是豈有此理，好一個五嶽盟主！"},
	},
}
NPCVoiceConfig[44111] =	--令狐冲
{
	receive_task =
	{
		[3841] = {sfx = TASK_VOICE--[[!AUTO_128]]"令狐冲\\14.ogg", text = --[[!AUTO_129]]"非非小小年紀，卻也遭此橫禍……哎，你去同她道別吧。"},
	},
}
NPCVoiceConfig[35347] =	--刘帮
{
	receive_task =
	{
		[3831] = {sfx = TASK_VOICE--[[!AUTO_130]]"刘帮\\刘帮1.ogg", text = --[[!AUTO_131]]"多謝少俠仗義相助！"},
	},
}
NPCVoiceConfig[66879] =	--刘帮
{
	finish_task =
	{
		[3842] = {sfx = TASK_VOICE--[[!AUTO_132]]"刘帮\\刘帮2.ogg", text = --[[!AUTO_133]]"等待我和芹兒的，將會是什麼……"},
	},
}
NPCVoiceConfig[66878] =	--刘芹
{
	finish_task =
	{
		[5586] = {sfx = TASK_VOICE--[[!AUTO_134]]"刘芹\\刘芹3.ogg", text = --[[!AUTO_135]]"嗚嗚嗚……爹爹，非非姐姐……嗚嗚"},
	},
}
NPCVoiceConfig[67069] =	--刘正风
{
	receive_task =
	{
		[5571] = {sfx = TASK_VOICE--[[!AUTO_136]]"刘正风\\悲愤.ogg", text = --[[!AUTO_137]]"咳咳咳……你要殺便殺我風某一人，咳咳……傷人妻兒算什麼英雄好漢！"},
	},
}
NPCVoiceConfig[35410] =	--刘正风
{
	finish_task =
	{
		[3835] = {sfx = TASK_VOICE--[[!AUTO_138]]"刘正风\\遗憾释然.ogg", text = --[[!AUTO_139]]"高山流水，知音難遇。不管結局如何，此生與曲兄相識，風某無怨無悔。"},
	},
}
NPCVoiceConfig[35314] =	--柳敬亭
{
	receive_task =
	{
		[3802] = {sfx = TASK_VOICE--[[!AUTO_140]]"柳敬亭\\柳敬亭4.ogg", text = --[[!AUTO_141]]"哎哎，別急著走啊，我這兒還有其他的八卦你聽不聽？"},
	},
}
NPCVoiceConfig[44130] =	--柳小樱
{
	finish_task =
	{
		[3802] = {sfx = TASK_VOICE--[[!AUTO_142]]"柳小璎\\娇脆.ogg", text = --[[!AUTO_143]]"他們胡說，我師父才不是那樣的人！"},
		[3772] = {sfx = TASK_VOICE--[[!AUTO_144]]"柳小璎\\愉悦.ogg", text = --[[!AUTO_145]]"多謝大俠仗義相助。"},
	},
}
NPCVoiceConfig[66871] =	--曲非烟
{
	finish_task =
	{
		[3798] = {sfx = TASK_VOICE--[[!AUTO_146]]"曲非烟\\可爱的萝莉.ogg", text = --[[!AUTO_147]]"你也是來幫令狐哥哥的嗎？"},
		[5578] = {sfx = TASK_VOICE--[[!AUTO_148]]"曲非烟\\惊喜.ogg", text = --[[!AUTO_149]]"咦？好可愛的小猴兒啊。"},
	},
}
NPCVoiceConfig[35377] =	--曲非烟
{
	finish_task =
	{
		[5584] = {sfx = TASK_VOICE--[[!AUTO_150]]"曲非烟\\理直气壮.ogg", text = --[[!AUTO_151]]"朋友有難自當相助！哪裡來得這麼多拘束！"},
	},
}
NPCVoiceConfig[67956] =	--曲洋
{
	receive_task =
	{
		[5581] = {sfx = TASK_VOICE--[[!AUTO_152]]"曲洋\\冷静.ogg", text = --[[!AUTO_153]]"你將這酒給令狐少俠服下，抑制他體內的寒氣。"},
		[5584] = {sfx = TASK_VOICE--[[!AUTO_154]]"曲洋\\担忧.ogg", text = --[[!AUTO_155]]"此事頗有蹊蹺，有勞少俠前往打探。"},
	},
	finish_task =
	{
		[5579] = {sfx = TASK_VOICE--[[!AUTO_156]]"曲洋\\松口气.ogg", text = --[[!AUTO_157]]"是非非那丫頭帶你來的？"},
	},
}
NPCVoiceConfig[37956] =	--曲洋
{
	receive_task =
	{
		[3828] = {sfx = TASK_VOICE--[[!AUTO_158]]"曲洋\\惋惜.ogg", text = --[[!AUTO_159]]"沒想到我們竟還是晚了一步……"},
	},
	finish_task =
	{
		[4075] = {sfx = TASK_VOICE--[[!AUTO_160]]"曲洋\\气愤.ogg", text = --[[!AUTO_161]]"哼，好一個甕中捉鼈！"},
	},
}
NPCVoiceConfig[58739] =	--任盈盈
{
	finish_task =
	{
		[5543] = {sfx = TASK_VOICE--[[!AUTO_162]]"任盈盈\\无奈包容.ogg", text = --[[!AUTO_163]]"你們鬧夠了吧。"},
	},
}
NPCVoiceConfig[56456] =	--桃谷六仙
{
	finish_task =
	{
		[4605] = {sfx = TASK_VOICE--[[!AUTO_164]]"桃根仙桃花仙桃实仙\\三仙3.ogg", text = --[[!AUTO_165]]"是你！我記得你！"},
	},
}
NPCVoiceConfig[35353] =	--田伯光
{
	finish_task =
	{
		[4292] = {sfx = TASK_VOICE--[[!AUTO_166]]"田伯光\\欣赏笑骂.ogg", text = --[[!AUTO_167]]"令狐沖那小子騙得我好苦！"},
	},
}
NPCVoiceConfig[56327] =	--田伯光
{
	finish_task =
	{
		[4596] = {sfx = TASK_VOICE--[[!AUTO_168]]"田伯光\\2.ogg", text = --[[!AUTO_169]]"令狐沖這廝不消半日功力大為長進，這山洞一定隱藏著什麼秘密。"},
	},
}
NPCVoiceConfig[44361] =	--吴坤山
{
	finish_task =
	{
		[3875] = {sfx = TASK_VOICE--[[!AUTO_170]]"吴坤山\\吴坤山3.ogg", text = --[[!AUTO_171]]"真是後生可畏啊！"},
	},
}
NPCVoiceConfig[35591] =	--杨涟
{
	finish_task =
	{
		[3876] = {sfx = TASK_VOICE--[[!AUTO_172]]"杨涟\\杨涟1.ogg", text = --[[!AUTO_173]]"魏忠賢禍亂朝廷，迫害賢臣，人人得而誅之！"},
	},
}
NPCVoiceConfig[35600] =	--杨涟
{
	finish_task =
	{
		[3907] = {sfx = TASK_VOICE--[[!AUTO_174]]"杨涟\\杨涟2.ogg", text = --[[!AUTO_175]]"少俠，看到你我就安心了。"},
	},
}
NPCVoiceConfig[55594] =	--仪琳
{
	receive_task =
	{
		[4587] = {sfx = TASK_VOICE--[[!AUTO_176]]"仪琳\\感激欢欣.ogg", text = --[[!AUTO_177]]"阿彌陀佛，多謝你。"},
	},
}
NPCVoiceConfig[55627] =	--岳灵珊
{
	finish_task =
	{
		[4601] = {sfx = --[[!AUTO_178]]"sfx\\voice\\chinese\\npc\\客户端喊话及任务对白\\客户端喊话\\岳灵珊\\任性.ogg", text = --[[!AUTO_179]]"大師哥他存心氣我，這碧水劍還來又有什麼意義？！"},
	},
}
NPCVoiceConfig[56330] =	--岳灵珊
{
	finish_task =
	{
		[4604] = {sfx = --[[!AUTO_180]]"sfx\\voice\\chinese\\npc\\客户端喊话及任务对白\\客户端喊话\\岳灵珊\\清脆感激.ogg", text = --[[!AUTO_181]]"方才多謝你相助！"},
	},
}
NPCVoiceConfig[61273] =	--白弦音
{
	receive_task =
	{
		[5133] = {sfx = TASK_VOICE--[[!AUTO_182]]"白弦音\\02.ogg", text = --[[!AUTO_183]]"我白弦音願等候於此。"},
	},
}
NPCVoiceConfig[55609] =	--东方姑娘
{
	receive_task =
	{
		[4600] = {sfx = TASK_VOICE--[[!AUTO_184]]"东方不败NPC普通对白\\35.ogg", text = --[[!AUTO_185]]"提劍跨騎揮鬼雨，白骨如山鳥驚飛。塵世如潮人如水，只歎江湖幾人回。"},
	},
}
NPCVoiceConfig[55606] =	--东方姑娘
{
	receive_task =
	{
		[4594] = {sfx = TASK_VOICE--[[!AUTO_186]]"东方不败NPC普通对白\\42.ogg", text = --[[!AUTO_187]]"人生苦短，難得酒逢知己。"},
	},
}
NPCVoiceConfig[61288] =	--鬼祟青年
{
	finish_task =
	{
		[5136] = {sfx = --[[!AUTO_288]]"sfx\\voice\\Chinese\\npc\\风云再起\\客户端喊话及任务对白\\0鬼祟青年.ogg", text = --[[!AUTO_289]]"額地神啊！救星，快救救我們！！"},
	},
}
NPCVoiceConfig[55633] =	--陆大有
{
	receive_task =
	{
		[4603] = {sfx = --[[!AUTO_290]]"sfx\\voice\\Chinese\\npc\\风云再起\\客户端喊话及任务对白\\0陆大有2.ogg", text = --[[!AUTO_291]]"師妹她變了，她已經不是我認識的那個師妹了……"},
	},
}
NPCVoiceConfig[55594] =	--仪琳
{
	finish_task =
	{
		[4585] = {sfx = --[[!AUTO_292]]"sfx\\voice\\Chinese\\npc\\风云再起\\客户端喊话及任务对白\\0仪琳3.ogg", text = --[[!AUTO_293]]"別說笑了，你這次來的正好，我正有事需要你來幫忙！"},
	},
}
NPCVoiceConfig[67954] =	--解风
{
	finish_task =
	{
		[5575] = {sfx = --[[!AUTO_294]]"sfx\\voice\\Chinese\\npc\\风云再起\\客户端喊话及任务对白\\0解风1.ogg", text = --[[!AUTO_295]]"酒？？酒！！"},
		[5817] = {sfx = --[[!AUTO_296]]"sfx\\voice\\Chinese\\npc\\风云再起\\客户端喊话及任务对白\\0解风2.ogg", text = --[[!AUTO_297]]"你……你醉了！！打我家猴兒幹嘛！"},
	},
	receive_task =
	{
		[5819] = {sfx = --[[!AUTO_298]]"sfx\\voice\\Chinese\\npc\\风云再起\\客户端喊话及任务对白\\0解风3.ogg", text = --[[!AUTO_299]]"來來，我跟你說啊，前面有個美人，你要是有膽，就去打個招呼！"},
	},
}
NPCVoiceConfig[71837] =	--曲非烟
{
	receive_task =
	{
		[5574] = {sfx = --[[!AUTO_300]]"sfx\\voice\\Chinese\\npc\\风云再起\\客户端喊话及任务对白\\0曲非烟33.ogg", text = --[[!AUTO_301]]"哼，仗劍行兇，自作自受，活該！"},
	},
}
NPCVoiceConfig[55606] =	--东方姑娘
{
	finish_task =
	{
		[4589] = {sfx = --[[!AUTO_302]]"sfx\\voice\\Chinese\\npc\\风云再起\\客户端喊话及任务对白\\0东方姑娘4.ogg", text = --[[!AUTO_303]]"在下複姓東方，單名一個白字。"},
		[4590] = {sfx = --[[!AUTO_304]]"sfx\\voice\\Chinese\\npc\\风云再起\\客户端喊话及任务对白\\0东方姑娘5.ogg", text = --[[!AUTO_305]]"來去如風，身手俐落，倒是青年一輩難得的才俊。"},
	},
}
---------------------------------------------------门派指引语音配置------------------------------------------------------
NPCVoiceConfig[61767] =	--长鸿道人
{
	begin_talk = {sfx = --[[!AUTO_188]]"sfx\\voice\\chinese\\npc\\功能师门\\长鸿道人.ogg", text = --[[!AUTO_189]]""},
	can_receive_task =
	{
		[5262] = {sfx = SCH_VOICE--[[!AUTO_190]]"峨眉接引长鸿道人\\追忆.ogg", text = --[[!AUTO_191]]"峨嵋派自立派以來，以發揚光大正宗武學為己任，屬於玄門正宗。"},
		[5264] = {sfx = SCH_VOICE--[[!AUTO_192]]"峨眉接引长鸿道人\\告诫2.ogg", text = --[[!AUTO_193]]"我派武學講求靜如處子，動如脫兔，亦柔亦剛，內外並重。化萬法為一法，以一法破萬法，正是我派武學的精要所在。"},
	},
	can_finish_task =
	{
		[5263] = {sfx = SCH_VOICE--[[!AUTO_194]]"峨眉接引长鸿道人\\告诫.ogg", text = --[[!AUTO_195]]"峨眉山月靜不動，琉璃法身淨無瑕。"},
	},
	finish_task =
	{
		[5264] = {sfx = SCH_VOICE--[[!AUTO_196]]"峨眉接引长鸿道人\\嘱咐.ogg", text = --[[!AUTO_197]]"切記，切記！"},
	},
}
NPCVoiceConfig[61779] =	--定逸
{
	begin_talk = {sfx = --[[!AUTO_198]]"sfx\\voice\\chinese\\npc\\功能师门\\定逸.ogg", text = --[[!AUTO_199]]""},
	can_receive_task =
	{
		[5259] = {sfx = SCH_VOICE--[[!AUTO_200]]"恒山接引定逸\\缓缓诉说.ogg", text = --[[!AUTO_201]]"我恆山乃是五嶽劍派之一，恆山三定三位師太在江湖上也素有慈名。"},
		[5261] = {sfx = SCH_VOICE--[[!AUTO_202]]"恒山接引定逸\\告诫.ogg", text = --[[!AUTO_203]]"我派武學綿密嚴謹，長於防守，於無聲處卻又殺招驟起，破敵致勝。"},
	},
	can_finish_task =
	{
		[5260] = {sfx = SCH_VOICE--[[!AUTO_204]]"恒山接引定逸\\追思.ogg", text = --[[!AUTO_205]]"一入恆山風月永，幾回慧劍斬情絲。"},
	},
	finish_task =
	{
		[5261] = {sfx = SCH_VOICE--[[!AUTO_206]]"恒山接引定逸\\嘱咐.ogg", text = --[[!AUTO_207]]"你可記好了？"},
	},
}
NPCVoiceConfig[61776] =	--鲁连荣
{
	begin_talk = {sfx = --[[!AUTO_208]]"sfx\\voice\\chinese\\npc\\功能师门\\鲁连荣.ogg", text = --[[!AUTO_209]]""},
	can_receive_task =
	{
		[5256] = {sfx = SCH_VOICE--[[!AUTO_210]]"衡山接引鲁连荣\\自豪.ogg", text = --[[!AUTO_211]]"我衡山派乃是江湖上大大有名的五嶽劍派之一，掌門人莫大先生號稱瀟湘夜雨，琴中藏劍，劍發琴音，衡山門下風采都是如此。"},
		[5258] = {sfx = SCH_VOICE--[[!AUTO_212]]"衡山接引鲁连荣\\告诫.ogg", text = --[[!AUTO_213]]"我衡山劍法易於上手，難於精通，你當持之以恆。此外，我派武學以樂入劍，樂理的領悟，在修習劍法時將事半功倍。"},
	},
	can_finish_task =
	{
		[5257] = {sfx = SCH_VOICE--[[!AUTO_214]]"衡山接引鲁连荣\\仰慕.ogg", text = --[[!AUTO_215]]"瀟湘夜雨劍華生，秋風搖落劍客老。"},
	},
	finish_task =
	{
		[5258] = {sfx = SCH_VOICE--[[!AUTO_216]]"衡山接引鲁连荣\\提点.ogg", text = --[[!AUTO_217]]"武學、樂理，本是想通之道！"},
	},
}
NPCVoiceConfig[61773] =	--劳德诺
{
	begin_talk = {sfx = --[[!AUTO_218]]"sfx\\voice\\chinese\\npc\\功能师门\\劳德诺.ogg", text = --[[!AUTO_219]]""},
	can_receive_task =
	{
		[5250] = {sfx = SCH_VOICE--[[!AUTO_220]]"华山接引劳德诺\\平静介绍.ogg", text = --[[!AUTO_221]]"我派武學以氣禦劍、劍氣雙修，家師“君子劍”岳先生更是當今武林正道最為稱道的一代宗師。"},
		[5252] = {sfx = SCH_VOICE--[[!AUTO_222]]"华山接引劳德诺\\告诫.ogg", text = --[[!AUTO_223]]"我派劍法，以氣禦劍，劍氣雙修，如華山險峰一般，端是詭異難測，威力驚人。此外，我派氣為劍之本，這也是我華山氣宗根本所在。"},
	},
	can_finish_task =
	{
		[5251] = {sfx = SCH_VOICE--[[!AUTO_224]]"华山接引劳德诺\\平静介绍2.ogg", text = --[[!AUTO_225]]"拳出少林，劍歸華山。"},
	},
	finish_task =
	{
		[5252] = {sfx = SCH_VOICE--[[!AUTO_226]]"华山接引劳德诺\\提点.ogg", text = --[[!AUTO_227]]"你且自取琢磨一番，謹記要領！"},
	},
}
NPCVoiceConfig[61752] =	--贾布
{
	begin_talk = {sfx = --[[!AUTO_228]]"sfx\\voice\\chinese\\npc\\功能师门\\贾布.ogg", text = --[[!AUTO_229]]""},
	can_receive_task =
	{
		[5235] = {sfx = SCH_VOICE--[[!AUTO_230]]"日月接引贾布\\炙热崇敬.ogg", text = --[[!AUTO_231]]"文成武德，仁義英明，中興聖教，澤被蒼生，千秋萬代，一統江湖！"},
		[5237] = {sfx = SCH_VOICE--[[!AUTO_232]]"日月接引贾布\\告诫.ogg", text = --[[!AUTO_233]]"記住！日月經天，乾坤倒轉，意轉奇經，氣導八脈。"},
	},
	receive_task =
	{
		[5236] = {sfx = SCH_VOICE--[[!AUTO_234]]"日月接引贾布\\自豪.ogg", text = --[[!AUTO_235]]"王圖霸業談笑中，日月中天照江湖！"},
	},
	finish_task =
	{
		[5237] = {sfx = SCH_VOICE--[[!AUTO_236]]"日月接引贾布\\傲气.ogg", text = --[[!AUTO_237]]"要殺人、要求勝，一招足矣！"},
	},
}
NPCVoiceConfig[61761] =	--方生
{
	begin_talk = {sfx = --[[!AUTO_238]]"sfx\\voice\\chinese\\npc\\功能师门\\方生_福州城.ogg", text = --[[!AUTO_239]]""},
	can_receive_task =
	{
		[5244] = {sfx = SCH_VOICE--[[!AUTO_240]]"少林接引方生\\谆谆教导.ogg", text = --[[!AUTO_241]]"八方玄學，源自中州；天下武功，出於少林！少林的慈悲，就是為善去惡、降妖伏魔！"},
		[5246] = {sfx = SCH_VOICE--[[!AUTO_242]]"少林接引方生\\告诫.ogg", text = --[[!AUTO_243]]"本門身法最重下盤穩固，泰山壓頂，我亦不動。更要謹記我派乃以禪入武，是以當心存慈悲！"},
	},
	can_finish_task =
	{
		[5245] = {sfx = SCH_VOICE--[[!AUTO_244]]"少林接引方生\\沉吟.ogg", text = --[[!AUTO_245]]"當頭棒喝獅子吼，修行原為伏妖魔。"},
	},
	finish_task =
	{
		[5246] = {sfx = SCH_VOICE--[[!AUTO_246]]"少林接引方生\\嘱咐.ogg", text = --[[!AUTO_247]]"阿彌陀佛，心懷慈悲，以禪入武！"},
	},
}
NPCVoiceConfig[61758] =	--唐威
{
	begin_talk = {sfx = --[[!AUTO_248]]"sfx\\voice\\chinese\\npc\\功能师门\\唐威.ogg", text = --[[!AUTO_249]]""},
	can_receive_task =
	{
		[5241] = {sfx = SCH_VOICE--[[!AUTO_250]]"唐门接引唐威\\自豪.ogg", text = --[[!AUTO_251]]"蜀中唐門，武林世家，暗器飛鏢，天下第一。 只有死人，方能說出唐門暗器的秘密。"},
		[5243] = {sfx = SCH_VOICE--[[!AUTO_252]]"唐门接引唐威\\告诫.ogg", text = --[[!AUTO_253]]"暗器之道，無非三大要訣。即時機要准，出手要穩，打的要准！"},
	},
	can_finish_task =
	{
		[5242] = {sfx = SCH_VOICE--[[!AUTO_254]]"唐门接引唐威\\陶醉.ogg", text = --[[!AUTO_255]]"世界空空無一物，滿天花雨斷人腸。"},
	},
	finish_task =
	{
		[5243] = {sfx = SCH_VOICE--[[!AUTO_256]]"唐门接引唐威\\提点.ogg", text = --[[!AUTO_257]]"記好口訣，勤加苦練！"},
	},
}
NPCVoiceConfig[61755] =	--紫璇护法
{
	begin_talk = {sfx = --[[!AUTO_258]]"sfx\\voice\\chinese\\npc\\功能师门\\紫璇护法.ogg", text = --[[!AUTO_259]]""},
	can_receive_task =
	{
		[5238] = {sfx = SCH_VOICE--[[!AUTO_260]]"五仙接引紫璇护法\\自豪.ogg", text = --[[!AUTO_261]]"五仙教在江湖中以善使毒蠱聞名，向來只收女子。"},
		[5240] = {sfx = SCH_VOICE--[[!AUTO_262]]"五仙接引紫璇护法\\传授.ogg", text = --[[!AUTO_263]]"我派鞭法，當以靈動為要，所謂動若靈蛇，巧妙制敵；更輔以蠱毒秘術，殺人於無形之中。"},
	},
	can_finish_task =
	{
		[5239] = {sfx = SCH_VOICE--[[!AUTO_264]]"五仙接引紫璇护法\\追思.ogg", text = --[[!AUTO_265]]"山中今夜相思蠱，天涯何處有情郎。"},
	},
	finish_task =
	{
		[5240] = {sfx = SCH_VOICE--[[!AUTO_266]]"五仙接引紫璇护法\\期许告诫.ogg", text = --[[!AUTO_267]]"可莫要墮落我五仙女兒的威風！"},
	},
}
NPCVoiceConfig[61770] =	--李玉衡
{
	begin_talk = {sfx = --[[!AUTO_268]]"sfx\\voice\\chinese\\npc\\功能师门\\李玉衡.ogg", text = --[[!AUTO_269]]""},
	can_receive_task =
	{
		[5253] = {sfx = SCH_VOICE--[[!AUTO_270]]"逍遥接引李玉衡\\淡然.ogg", text = --[[!AUTO_271]]"人生於三千紅塵之中，受萬千羈絆，憂多樂少，求得逍遙本不是容易之事。"},
		[5255] = {sfx = SCH_VOICE--[[!AUTO_272]]"逍遥接引李玉衡\\教导.ogg", text = --[[!AUTO_273]]"朝游北海暮蒼梧，我派武學正是講求這種隨情任性，明白了這點，你就算是初窺門徑了。"},
	},
	can_finish_task =
	{
		[5254] = {sfx = SCH_VOICE--[[!AUTO_274]]"逍遥接引李玉衡\\感悟.ogg", text = --[[!AUTO_275]]"武林爭霸經幾載，我自逍遙醉一生。"},
	},
	finish_task =
	{
		[5255] = {sfx = SCH_VOICE--[[!AUTO_276]]"逍遥接引李玉衡\\嘱咐.ogg", text = --[[!AUTO_277]]"你且好好體悟！"},
	},
}
NPCVoiceConfig[61764] =	--玄高
{
	begin_talk = {sfx = --[[!AUTO_278]]"sfx\\voice\\chinese\\npc\\功能师门\\玄高_接引.ogg", text = --[[!AUTO_279]]""},
	can_receive_task =
	{
		[5247] = {sfx = SCH_VOICE--[[!AUTO_280]]"武当接引玄高\\01.ogg", text = --[[!AUTO_281]]"以柔克剛、剛柔並濟，我派太極劍、兩儀劍皆為江湖群豪稱道。"},
		[5249] = {sfx = SCH_VOICE--[[!AUTO_282]]"武当接引玄高\\03.ogg", text = --[[!AUTO_283]]"太極生兩儀，兩儀生四象。"},
	},
	can_finish_task =
	{
		[5248] = {sfx = SCH_VOICE--[[!AUTO_284]]"武当接引玄高\\02.ogg", text = --[[!AUTO_285]]"易有太極，是生兩儀。"},
	},
	finish_task =
	{
		[5249] = {sfx = SCH_VOICE--[[!AUTO_286]]"武当接引玄高\\04.ogg", text = --[[!AUTO_287]]"你且在戰鬥中好好體悟。"},
	},
}
