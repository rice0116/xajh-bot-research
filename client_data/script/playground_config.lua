PlaygroundConfig = {}

PlaygroundConfig.activity_template_id = 10069		--游乐场活动模板id
PlaygroundConfig.words_count = 10				--留言板显示留言数
PlaygroundConfig.limit_level = 60               --活动限制等级
PlaygroundConfig.server_rgb = "^fad88c"         --留言板服务器名字颜色
PlaygroundConfig.name_rgb = "^fad88c"           --留言板玩家名字颜色
PlaygroundConfig.message_rgb = "^fef2d8"        --留言板留言信息颜色

PlaygroundConfig.TransmitScene = {}				--游乐场场景信息
PlaygroundConfig.TransmitScene = {
	id = 145,
	pos_x = 73.7048,
	pos_y = 34.6496,
	pos_z = 408.16,
	pos_radius = 15.0,
}
PlaygroundConfig.FinishAward = {}
PlaygroundConfig.FinishAward = {
	{
		begin_number = 1,			--开始名次
		end_number = 1,				--结束名次
		award = 10694				--奖励模板id
	},
	{
		begin_number = 2,
		end_number = 10,
		award = 10695
	},
		{
		begin_number = 11,
		end_number = 100,
		award = 10696
	},
		{
		begin_number = 101,
		end_number = 200,
		award = 10697
	},
}

PlaygroundConfig.IndexConfig = {}
PlaygroundConfig.IndexConfig = {
{
	index = 1,						--格子号
	type = 3,						--格子类型 1-单人2-多人3-奖励
	instance_tid = 0,				--副本tid
	award = 10222,						--奖励id
	punish_back = 0,				--惩罚退格子数
	failed_pay_item = 0,			--失败消耗道具通关
	failed_pay_count = 0,			--失败消耗道具数量
	jump_number_min = 0,			--配置跳格范围最小数
	jump_number_max = 0,			--配置跳格范围最大数
	roadblock = 0,					--是否打开屏障
	roadblock_player_min = 0,		--打开屏障玩家最小人数
	roadblock_player_max = 0,		--打开屏障玩家最小大数
	icon_path_id = 27869,		--图片路径
	instance_brief = "恭喜你踩到狗屎一坨，带到终点有惊喜！",	--副本文字介绍
	instance_title = "1-狗屎运"	--副本标题
},
{
	index = 2,
	type = 3,
	instance_tid = 0,
	award = 0,
	punish_back = 0,
	failed_pay_item = 0,
	failed_pay_count = 0,
	jump_number_min = 3,
	jump_number_max = 6,
	roadblock = 0,
	roadblock_player_min = 0,
	roadblock_player_max = 0,
	icon_path_id = 27917,
	instance_brief = "向前冲刺3-6格",
	instance_title = "2-快马一鞭"
},
{
	index = 3,
	type = 3,
	instance_tid = 0,
	award = 10216,
	punish_back = 0,
	failed_pay_item = 0,
	failed_pay_count = 0,
	jump_number_min = 0,
	jump_number_max = 0,
	roadblock = 0,
	roadblock_player_min = 0,
	roadblock_player_max = 0,
	icon_path_id = 27869,
	instance_brief = "你走到转角突然被绊倒，正要开口骂人，发现脚下躺着5锭金子。",
	instance_title = "3-捡到钱"
},
{
	index = 4,
	type = 1,
	instance_tid = 10158,
	award = 10699,
	punish_back = 0,
	failed_pay_item = 91154,
	failed_pay_count = 1,
	jump_number_min = 0,
	jump_number_max = 0,
	roadblock = 0,
	roadblock_player_min = 0,
	roadblock_player_max = 0,
	icon_path_id = 0,
	instance_brief = "客栈中混入了5个奇怪的家伙,其中只有1个是真正的首领,找出并干掉他!\r注意不要误伤其他的入侵者",
	instance_title = "4-真假难辨"
},
{
	index = 5,
	type = 1,
	instance_tid = 10161,
	award = 10699,
	punish_back = 0,
	failed_pay_item = 91154,
	failed_pay_count = 1,
	jump_number_min = 0,
	jump_number_max = 0,
	roadblock = 0,
	roadblock_player_min = 0,
	roadblock_player_max = 0,
	icon_path_id = 0,
	instance_brief = "击杀掉不寻常的葫芦就能过关,可以选择直接击杀,也可以选择先从周围的魔剑柱下手,击破4个魔剑柱后,会有意想不到的变化!\r要注意躲避葫芦的攻击哦!",
	instance_title = "5-身手矫健"
},
{
	index = 6,
	type = 1,
	instance_tid = 10164,
	award = 10699,
	punish_back = 0,
	failed_pay_item = 0,
	failed_pay_count = 0,
	jump_number_min = 0,
	jump_number_max = 0,
	roadblock = 0,
	roadblock_player_min = 0,
	roadblock_player_max = 0,
	icon_path_id = 0,
	instance_brief = "你看见一个熟悉的身影从青楼遁进这个迷宫，找到他。迷宫共有5层，每层有4个入口，只有一个入口能进入下一层，选错入口将走回第一层。",
	instance_title = "6-扫黄"
},
{
	index = 7,
	type = 1,
	instance_tid = 10052,
	award = 10699,
	punish_back = 0,
	failed_pay_item = 91154,
	failed_pay_count = 1,
	jump_number_min = 0,
	jump_number_max = 0,
	roadblock = 0,
	roadblock_player_min = 0,
	roadblock_player_max = 0,
	icon_path_id = 0,
	instance_brief = "在此关卡中，少侠需要将四种不同的神秘石台用相应神石激活，四盏石台被成功点亮时即可过关",
	instance_title = "7-破阵"
},
{
	index = 8,
	type = 1,
	instance_tid = 10071,
	award = 10699,
	punish_back = 0,
	failed_pay_item = 91154,
	failed_pay_count = 1,
	jump_number_min = 0,
	jump_number_max = 0,
	roadblock = 0,
	roadblock_player_min = 0,
	roadblock_player_max = 0,
	icon_path_id = 0,
	instance_brief = "通过添柴、倒水等操作控制丹炉温度。请将丹炉保持在一定的温度范围，并注意前来干扰的怪物！添柴方法：采集木材后到丹炉旁使用。倒水方法：击杀水桶怪，捡起他的木桶后到丹炉旁使用",
	instance_title = "8-炼丹"
},
{
	index = 9,
	type = 2,
	instance_tid = 10137,
	award = 10699,
	punish_back = 0,
	failed_pay_item = 91154,
	failed_pay_count = 1,
	jump_number_min = 0,
	jump_number_max = 0,
	roadblock = 1,
	roadblock_player_min = 1,
	roadblock_player_max = 10,
	icon_path_id = 0,
	instance_brief = "熊猫酒厂被黑熊军团占领。玩家可变身为3种不同的炸弹人，帮助熊猫族人化解这场危机。\r\r^D98719击杀黑熊拳师 ^32CD32+100分\r^D98719击杀黑熊哨兵 ^32CD32+200分\r^D98719击杀黑熊百夫长 ^32CD32+300分\r^D98719摧毁浮夸的金像 ^32CD32+500分\r^D98719误杀熊猫精酿管理员 ^FF0000 -300分\r\r^FFFFFF【完成条件】：获得2000分\r^FFFFFF【限制复活次数】：5次",
	instance_title = "9-炸弹人"
},
{
	index = 10,
	type = 1,
	instance_tid = 10091,
	award = 10699,
	punish_back = 0,
	failed_pay_item = 91154,
	failed_pay_count = 1,
	jump_number_min = 0,
	jump_number_max = 0,
	roadblock = 0,
	roadblock_player_min = 0,
	roadblock_player_max = 0,
	icon_path_id = 0,
	instance_brief = "武林前辈留了一个宝箱迷阵给后人，其中有增益宝箱和陷阱宝箱。你只有一次机会，成功开启10个增益宝箱即可通过先人的考验！留心每个宝箱开启后显示的数字，那是先人留下的唯一提示",
	instance_title = "10-宝箱扫雷"
},
{
	index = 11,
	type = 1,
	instance_tid = 10113,
	award = 10699,
	punish_back = 0,
	failed_pay_item = 91154,
	failed_pay_count = 1,
	jump_number_min = 0,
	jump_number_max = 0,
	roadblock = 0,
	roadblock_player_min = 0,
	roadblock_player_max = 0,
	icon_path_id = 0,
	instance_brief = "击败途中的坏蛋，保护师妹安全到达终点。",
	instance_title = "11-放开我师妹"
},
{
	index = 12,
	type = 1,
	instance_tid = 10168,
	award = 10699,
	punish_back = 0,
	failed_pay_item = 91154,
	failed_pay_count = 1,
	jump_number_min = 0,
	jump_number_max = 0,
	roadblock = 0,
	roadblock_player_min = 0,
	roadblock_player_max = 0,
	icon_path_id = 0,
	instance_brief = "巧妙借助雕像躲避邪神教主的石化之眼，并成功解救六名人质即可通关。",
	instance_title = "12-石化凝视"
},
{
	index = 13,
	type = 1,
	instance_tid = 10166,
	award = 10699,
	punish_back = 0,
	failed_pay_item = 91154,
	failed_pay_count = 1,
	jump_number_min = 0,
	jump_number_max = 0,
	roadblock = 0,
	roadblock_player_min = 0,
	roadblock_player_max = 0,
	icon_path_id = 0,
	instance_brief = "教主喵贪吃小鱼，掉进迷阵。只有翻出相同的卡牌才能抵消封印之力，从而救出萌萌的教主喵。快来帮她吧。",
	instance_title = "13-宝箱消消乐"
},
{
	index = 14,
	type = 2,
	instance_tid = 10073,
	award = 10699,
	punish_back = 0,
	failed_pay_item = 91154,
	failed_pay_count = 1,
	jump_number_min = 0,
	jump_number_max = 0,
	roadblock = 1,
	roadblock_player_min = 1,
	roadblock_player_max = 10,
	icon_path_id = 0,
	instance_brief = "在雪域进行一场打雪仗对决\r进入游戏后获得两个技能：\r团雪球——获得一枚雪球，最多持有3枚雪球丢雪球——将雪球朝鼠标所指方向丢出，蓄力时间越久丢得越远，击中对方雪人或玩家可以令其冻住一段时间\r击中对方雪人得1分，击中对方玩家得5分，被对方击中积分清0，获得10分即可胜出.注意：击中冻住状态的雪人或玩家不得分",
	instance_title = "14-打雪仗"
},
{
	index = 15,
	type = 1,
	instance_tid = 10142,
	award = 10699,
	punish_back = 0,
	failed_pay_item = 91154,
	failed_pay_count = 1,
	jump_number_min = 0,
	jump_number_max = 0,
	roadblock = 0,
	roadblock_player_min = 0,
	roadblock_player_max = 0,
	icon_path_id = 0,
	instance_brief = "作为饲养员，帮助火麒麟幼崽在3分钟内完成狩猎，并保证火麒麟的安全，获得30积分即可通关",
	instance_title = "15-神兽饲养员"
},
{
	index = 16,
	type = 1,
	instance_tid = 10072,
	award = 10699,
	punish_back = 0,
	failed_pay_item = 91154,
	failed_pay_count = 1,
	jump_number_min = 0,
	jump_number_max = 0,
	roadblock = 0,
	roadblock_player_min = 0,
	roadblock_player_max = 0,
	icon_path_id = 0,
	instance_brief = "追捕梅庄逃犯，通过用技能把逃犯驱赶到指定地点通关",
	instance_title = "16-追捕梅庄逃犯"
},
{
	index = 17,
	type = 2,
	instance_tid = 10141,
	award = 10699,
	punish_back = 0,
	failed_pay_item = 91154,
	failed_pay_count = 1,
	jump_number_min = 0,
	jump_number_max = 0,
	roadblock = 0,
	roadblock_player_min = 0,
	roadblock_player_max = 0,
	icon_path_id = 0,
	instance_brief = "场景中分布着红绿蓝三种颜色的染缸，玩家进入关卡后，将随机被染色成红绿蓝中的一种颜色，击碎5个不同于自己颜色的染缸即可过关。每当染缸被击碎后，所有玩家的颜色将被重新随机。\r注意：与自己相同颜色的染缸被击碎3次，则挑战失败！",
	instance_title = "17-染色大战"
},
{
	index = 18,
	type = 1,
	instance_tid = 10076,
	award = 10699,
	punish_back = 0,
	failed_pay_item = 91154,
	failed_pay_count = 1,
	jump_number_min = 0,
	jump_number_max = 0,
	roadblock = 0,
	roadblock_player_min = 0,
	roadblock_player_max = 0,
	icon_path_id = 0,
	instance_brief = "俘获箭羽精灵来获得一定分数即可过关。越靠近箭靶中心得分越多哟。\r切记合理利用特殊精灵的效果哟",
	instance_title = "18-神射手大作战"
},
{
	index = 19,
	type = 3,
	instance_tid = 0,
	award = 0,
	punish_back = 0,
	failed_pay_item = 0,
	failed_pay_count = 0,
	jump_number_min = 5,
	jump_number_max = 5,
	roadblock = 0,
	roadblock_player_min = 0,
	roadblock_player_max = 0,
	icon_path_id = 27916,
	instance_brief = "这里是个三岔路，据说好多人误入歧途会走到3格，官府特在此设立了引路使者，这位神秘的使者就是千小伊，可是走过这条路的人都说小伊也是个路痴……\r前进至24格",
	instance_title = "19-三岔路"
},
{
	index = 20,
	type = 1,
	instance_tid = 10099,
	award = 10699,
	punish_back = 0,
	failed_pay_item = 91154,
	failed_pay_count = 1,
	jump_number_min = 0,
	jump_number_max = 0,
	roadblock = 0,
	roadblock_player_min = 0,
	roadblock_player_max = 0,
	icon_path_id = 0,
	instance_brief = "采集4个宝箱即可完成副本。采集时，注意躲避怪物的攻击，玩家死亡副本即失败。在炸弹旁停留可触发炸弹，3秒后炸弹会使周围范围内的玩家、怪晕眩。有效借助炸弹可以阻止怪物的攻击，但要注意不要误伤自己。",
	instance_title = "20-夺宝奇兵"
},
{
	index = 21,
	type = 1,
	instance_tid = 10138,
	award = 10699,
	punish_back = 0,
	failed_pay_item = 91154,
	failed_pay_count = 1,
	jump_number_min = 0,
	jump_number_max = 0,
	roadblock = 0,
	roadblock_player_min = 0,
	roadblock_player_max = 0,
	icon_path_id = 0,
	instance_brief = "前往四位琴女处倾听他们弹奏的小曲儿，再与【老鸨】对话进行答题，【老鸨】会随机演奏之前在琴女处听到的四首曲子之一，准确答出【老鸨】弹奏的曲目名称即可过关。\r注意：在与【老鸨】对话开始答题前，可以重复倾听琴女弹奏！",
	instance_title = "21-听音"
},
{
	index = 22,
	type = 1,
	instance_tid = 10077,
	award = 10699,
	punish_back = 0,
	failed_pay_item = 91154,
	failed_pay_count = 1,
	jump_number_min = 0,
	jump_number_max = 0,
	roadblock = 0,
	roadblock_player_min = 0,
	roadblock_player_max = 0,
	icon_path_id = 0,
	instance_brief = "化身为一门大炮进入海底世界，发射能量弹来捕杀各种鱼类！\r能量数有限，注意合理使用；\r越大的鱼越难打，但是相应的积分越高，如果你不小心碰到了海底神兽，是冒险一搏还是避而远之……\r在限定时间内达到指定积分即可过关。",
	instance_title = "22-捕鱼达人"
},
{
	index = 23,
	type = 2,
	instance_tid = 10104,
	award = 10699,
	punish_back = 0,
	failed_pay_item = 91154,
	failed_pay_count = 1,
	jump_number_min = 6,
	jump_number_max = 6,
	roadblock = 0,
	roadblock_player_min = 0,
	roadblock_player_max = 0,
	icon_path_id = 0,
	instance_brief = "大家一起来捕捉水池中的乌龟吧~绿龟2分，银龟3分，金龟5分，取得25分就通关啦！不要因为龟龟可爱不忍心下手哦\r挑战成功可以从水池后方小路通过。",
	instance_title = "23-捕龟大作战"
},
{
	index = 24,
	type = 3,
	instance_tid = 0,
	award = 10210,
	punish_back = 0,
	failed_pay_item = 0,
	failed_pay_count = 0,
	jump_number_min = 0,
	jump_number_max = 0,
	roadblock = 0,
	roadblock_player_min = 0,
	roadblock_player_max = 0,
	icon_path_id = 27869,
	instance_brief = "帮助迷路的千小伊，小伊送你50宝银。",
	instance_title = "24-千小伊的赠礼"
},
{
	index = 25,
	type = 3,
	instance_tid = 0,
	award = 10211,
	punish_back = 0,
	failed_pay_item = 0,
	failed_pay_count = 0,
	jump_number_min = 0,
	jump_number_max = 0,
	roadblock = 0,
	roadblock_player_min = 0,
	roadblock_player_max = 0,
	icon_path_id = 27869,
	instance_brief = "获得2个金蚕果",
	instance_title = "25-金蚕果"
},
{
	index = 26,
	type = 3,
	instance_tid = 0,
	award = 10212,
	punish_back = 0,
	failed_pay_item = 0,
	failed_pay_count = 0,
	jump_number_min = 0,
	jump_number_max = 0,
	roadblock = 0,
	roadblock_player_min = 0,
	roadblock_player_max = 0,
	icon_path_id = 27869,
	instance_brief = "参观染坊，获得2个天然染色剂",
	instance_title = "26-五颜六色"
},
{
	index = 27,
	type = 3,
	instance_tid = 0,
	award = 10213,
	punish_back = 0,
	failed_pay_item = 0,
	failed_pay_count = 0,
	jump_number_min = 0,
	jump_number_max = 0,
	roadblock = 0,
	roadblock_player_min = 0,
	roadblock_player_max = 0,
	icon_path_id = 27869,
	instance_brief = "一阵大风吹来，你的怀里多了1个月尘砂。",
	instance_title = "27-风沙漫天"
},
{
	index = 28,
	type = 3,
	instance_tid = 0,
	award = 10214,
	punish_back = 0,
	failed_pay_item = 0,
	failed_pay_count = 0,
	jump_number_min = 0,
	jump_number_max = 0,
	roadblock = 0,
	roadblock_player_min = 0,
	roadblock_player_max = 0,
	icon_path_id = 27869,
	instance_brief = "路过镖局门口，镖局推广人员硬塞给你1个橙镖令。",
	instance_title = "28-镖行天下"
},
{
	index = 29,
	type = 2,
	instance_tid = 10040,
	award = 10699,
	punish_back = 0,
	failed_pay_item = 91154,
	failed_pay_count = 1,
	jump_number_min = 0,
	jump_number_max = 0,
	roadblock = 0,
	roadblock_player_min = 0,
	roadblock_player_max = 0,
	icon_path_id = 0,
	instance_brief = "你变身的小狗饱受饥饿的折磨，每3秒便会损失一次生命，赶紧寻找地上的骨头来充饥，每拾取一根骨头获得一点饱餐值。击杀别的玩家获得他的全部饱餐值并获得5点额外饱餐值奖励，达到10点饱餐值即可获胜。拾取蓝色的骨头会使你狂暴，狂暴时间内无法拾取骨头，只能通过攻击别的玩家来回复生命值。",
	instance_title = "29-饥荒"
},
--{
--	index = 30,
--	type = 1,
--	instance_tid = 10173,
--	award = 0,
--	punish_back = 0,
--	failed_pay_item = 91154,
--	failed_pay_count = 1,
--	jump_number_min = 0,
--	jump_number_max = 0,
--	roadblock = 0,
--	roadblock_player_min = 0,
--	roadblock_player_max = 0,
--	icon_path_id = 0,
--	instance_brief = "进入场景后将变身欢乐斗士站在指定地点不可移动，并获得钩子技能。需要各位斗士在规定的时间内，根据任务说明捕捉场景内指定的小动物，即可通过考验。",
--	instance_title = "30-快抓住他"
--},
{
	index = 30,
	type = 3,
	instance_tid = 0,
	award = 10699,
	punish_back = 0,
	failed_pay_item = 0,
	failed_pay_count = 0,
	jump_number_min = 0,
	jump_number_max = 0,
	roadblock = 0,
	roadblock_player_min = 0,
	roadblock_player_max = 0,
	icon_path_id = 0,
	instance_brief = "街上一座神秘的建筑大门紧闭，你走上前推了推没有开门，仔细一看才发现门上有一张告示：敬请期待",
	instance_title = "30-下次再来"
},
{
	index = 31,
	type = 3,
	instance_tid = 0,
	award = 10699,
	punish_back = 0,
	failed_pay_item = 0,
	failed_pay_count = 0,
	jump_number_min = 0,
	jump_number_max = 0,
	roadblock = 0,
	roadblock_player_min = 0,
	roadblock_player_max = 0,
	icon_path_id = 0,
	instance_brief = "在马路边扶老大爷过马路，一辆马车过来将你们撞倒了，你正担心时老大爷一个翻身起来并将你扶起，拍拍手走了。",
	instance_title = "31-虚惊一场"
},
--{
--	index = 31,
--	type = 2,
--	instance_tid = 10174,
--	award = 0,
--	punish_back = 0,
--	failed_pay_item = 91154,
--	failed_pay_count = 1,
--	jump_number_min = 0,
--	jump_number_max = 0,
--	roadblock = 0,
--	roadblock_player_min = 0,
--	roadblock_player_max = 0,
--	icon_path_id = 0,
--	instance_brief = "进入场景后将变身欢乐斗士并获得推推技能。需要各位斗士在规定的时间内，根据任务说明将场景内指定的小动物驱赶至指定地点，即可通过考验。",
--	instance_title = "31-驱散他们"
--},
{
	index = 32,
	type = 1,
	instance_tid = 10057,
	award = 10699,
	punish_back = 0,
	failed_pay_item = 91154,
	failed_pay_count = 1,
	jump_number_min = 0,
	jump_number_max = 0,
	roadblock = 0,
	roadblock_player_min = 0,
	roadblock_player_max = 0,
	icon_path_id = 0,
	instance_brief = "找到小秋利用变身后技能帮助他击退骚扰者\r变身后获得技能：\r1大炸弹（召唤炸弹桶，5秒后引爆）\r2冰霜（减慢移动速度）\r3怒火（对周围造成持续伤害）贴近骚扰者会有很好的效果哦~~",
	instance_title = "32-单身狗大战"
},
{
	index = 33,
	type = 2,
	instance_tid = 10122,
	award = 10699,
	punish_back = 0,
	failed_pay_item = 91154,
	failed_pay_count = 1,
	jump_number_min = 0,
	jump_number_max = 0,
	roadblock = 0,
	roadblock_player_min = 0,
	roadblock_player_max = 0,
	icon_path_id = 0,
	instance_brief = "鸡年就要结束了，不甘心的小鸡们倾巢而出，快把它们捉回来！\r您将获得三个技能：“表面麻醉”、“认真麻醉”和“丟网”\r“表面麻醉”和“认真麻醉”均会使小鸡晕眩，且外观完全一样，但只有被认真麻醉的小鸡才能被网捕获哦\r中了“表面麻醉”的小鸡解除眩晕前无法被“认真麻醉”。",
	instance_title = "33-小鸡快跑"
},
{
	index = 34,
	type = 1,
	instance_tid = 10194,
	award = 10699,
	punish_back = 0,
	failed_pay_item = 91154,
	failed_pay_count = 1,
	jump_number_min = 0,
	jump_number_max = 0,
	roadblock = 0,
	roadblock_player_min = 0,
	roadblock_player_max = 0,
	icon_path_id = 0,
	instance_brief = "每打败一类怪物可获得一个字，需要按不戒和尚给出的谒语依次获得对应文字才可以过关，一旦弄错顺序会从头开始。",
	instance_title = "34-拼谒语"
},
{
	index = 35,
	type = 1,
	instance_tid = 10063,
	award = 10699,
	punish_back = 0,
	failed_pay_item = 91154,
	failed_pay_count = 1,
	jump_number_min = 0,
	jump_number_max = 0,
	roadblock = 0,
	roadblock_player_min = 0,
	roadblock_player_max = 0,
	icon_path_id = 0,
	instance_brief = "天上掉下来的全是宝物,咦,不对,好像还有炸弹!啊...\r积分达到150分即可过关,金币3分,宝箱10分,如果被炸弹砸到3次则会导致失败\r大财神:一段时间会大量掉落宝箱.大恶魔:碰撞后一段时间会掉落大量炸弹.红色福袋:获得加速.白色福袋:免疫炸弹眩晕.金色福袋:短时间内接到的物品积分加倍",
	instance_title = "35-大富翁"
},
{
	index = 36,
	type = 1,
	instance_tid = 10143,
	award = 10699,
	punish_back = 0,
	failed_pay_item = 91154,
	failed_pay_count = 1,
	jump_number_min = 0,
	jump_number_max = 0,
	roadblock = 0,
	roadblock_player_min = 0,
	roadblock_player_max = 0,
	icon_path_id = 0,
	instance_brief = "五仙教叛徒将偷出的宝物藏在毒蜂阵中，通过声音辨识毒蜂的位置通过毒蜂阵取回宝物。",
	instance_title = "36-蜂巢夺宝"
},
{
	index = 37,
	type = 1,
	instance_tid = 10195,
	award = 10699,
	punish_back = 0,
	failed_pay_item = 91154,
	failed_pay_count = 1,
	jump_number_min = 0,
	jump_number_max = 0,
	roadblock = 0,
	roadblock_player_min = 0,
	roadblock_player_max = 0,
	icon_path_id = 0,
	instance_brief = "场地上出现的贼人会迅速消失，需要尽快击中他们来加以拦截，拦截并消灭一定数量的贼人后才能过关。",
	instance_title = "37-左支右绌"
},
{
	index = 38,
	type = 3,
	instance_tid = 0,
	award = 10215,
	punish_back = 0,
	failed_pay_item = 0,
	failed_pay_count = 0,
	jump_number_min = 0,
	jump_number_max = 0,
	roadblock = 0,
	roadblock_player_min = 0,
	roadblock_player_max = 0,
	icon_path_id = 27869,
	instance_brief = "路上施舍一个老乞丐，老乞丐揉了揉胸口，掏出两粒根骨丹。",
	instance_title = "38-路遇名师"
},
{
	index = 39,
	type = 3,
	instance_tid = 0,
	award = 10699,
	punish_back = 0,
	failed_pay_item = 0,
	failed_pay_count = 0,
	jump_number_min = 0,
	jump_number_max = 0,
	roadblock = 0,
	roadblock_player_min = 0,
	roadblock_player_max = 0,
	icon_path_id = 27869,
	instance_brief = "当时我和终点的距离只有0.01米，但是四分之一柱香之后，我决定停下来拿个奖",
	instance_title = "39-临门一脚"
},
{
	index = 40,
	type = 3,
	instance_tid = 0,
	award = 10698,
	punish_back = 0,
	failed_pay_item = 0,
	failed_pay_count = 0,
	jump_number_min = 0,
	jump_number_max = 0,
	roadblock = 0,
	roadblock_player_min = 0,
	roadblock_player_max = 0,
	icon_path_id = 0,
	instance_brief = "恭喜过关！\r咦！你有没有带狗屎？",
	instance_title = "40-终点"
},
}

function GetActivityTemplateId()
	local ret = 0
	if PlaygroundConfig.activity_template_id ~= nil then
		ret = PlaygroundConfig.activity_template_id
	end
	return ret
end
function GetWordsCount()
	local ret = 0
	if PlaygroundConfig.words_count ~= nil then
		ret = PlaygroundConfig.words_count
	end
	return ret
end
function GetLimitLevel()
    local ret = 0 
    if PlaygroundConfig.limit_level ~= nil then
        ret = PlaygroundConfig.limit_level
    end
    return ret
end
function GetTransmitScene()
	local ret_table = {}
	ret_table[1] = PlaygroundConfig.TransmitScene.id
	ret_table[2] = PlaygroundConfig.TransmitScene.pos_x
	ret_table[3] = PlaygroundConfig.TransmitScene.pos_y
	ret_table[4] = PlaygroundConfig.TransmitScene.pos_z
	ret_table[5] = PlaygroundConfig.TransmitScene.pos_radius
	return unpack(ret_table)
end

function GetPlaygroundConfig()
	local ret_table = {}
	for k, v in pairs (PlaygroundConfig.IndexConfig) do
		ret_table[#ret_table + 1] = v.index
		ret_table[#ret_table + 1] = v.type
		ret_table[#ret_table + 1] = v.instance_tid
		ret_table[#ret_table + 1] = v.award
		ret_table[#ret_table + 1] = v.punish_back
		ret_table[#ret_table + 1] = v.failed_pay_item
		ret_table[#ret_table + 1] = v.failed_pay_count
		ret_table[#ret_table + 1] = v.jump_number_min
		ret_table[#ret_table + 1] = v.jump_number_max
		ret_table[#ret_table + 1] = v.roadblock
		ret_table[#ret_table + 1] = v.roadblock_player_min
		ret_table[#ret_table + 1] = v.roadblock_player_max
	end
	return unpack(ret_table)
end
function GetFinishAward()
	local ret_table = {}
	for k, v in pairs (PlaygroundConfig.FinishAward) do
		ret_table[#ret_table + 1] = v.begin_number
		ret_table[#ret_table + 1] = v.end_number
		ret_table[#ret_table + 1] = v.award
	end
	return unpack(ret_table)
end

--------------------------------------------------
--客户端接口
function PlaygroundConfig:GetPlaygroundIconPath()
	local ret_table = {}

	for k, v in pairs (PlaygroundConfig.IndexConfig) do
		ret_table[#ret_table + 1] = v.icon_path_id
	end
	return ret_table
end

function PlaygroundConfig:GetPlaygroundInstanceBrief( index )
	local index_table = PlaygroundConfig.IndexConfig[index]
	if index_table == nil then
		return
	end
	
	if index_table.instance_brief ~= nil then
		return index_table.instance_brief
	end
end

function PlaygroundConfig:GetPlaygroundInstanceTitle( index )
	local index_table = PlaygroundConfig.IndexConfig[index]
	if index_table == nil then
		return
	end
	
	if index_table.instance_title ~= nil then
		return index_table.instance_title
	end
end

function PlaygroundConfig:GetPlaygroundFailedItem( index )
	local index_table = PlaygroundConfig.IndexConfig[index]
	if index_table == nil then
		return
	end
	
	if index_table.failed_pay_item ~= nil and index_table.failed_pay_count ~= nil then
		return index_table.failed_pay_item, index_table.failed_pay_count
	end
end

function PlaygroundConfig:GetPlaygroundMessgaeBoardRGB( )	
	if PlaygroundConfig.server_rgb ~= nil and PlaygroundConfig.name_rgb ~= nil and PlaygroundConfig.message_rgb ~= nil then
		return PlaygroundConfig.server_rgb, PlaygroundConfig.name_rgb, PlaygroundConfig.message_rgb
	end
end

function PlaygroundConfig:GetPlaygroundLimitLevel( )	
	if PlaygroundConfig.limit_level ~= nil then
		return PlaygroundConfig.limit_level
	end
end

function PlaygroundConfig:GetPlaygroundIndexType( index )
	local index_table = PlaygroundConfig.IndexConfig[index]
	if index_table == nil then
		return
	end
	
	if index_table.type ~= nil then
		return index_table.type
	end
end

function PlaygroundConfig:GetTransmitSceneID( )	
	if PlaygroundConfig.TransmitScene.id ~= nil then
		return PlaygroundConfig.TransmitScene.id
	end
end

function PlaygroundConfig:GetRichmanActivityID( )	
	if PlaygroundConfig.activity_template_id ~= nil then
		return PlaygroundConfig.activity_template_id
	end
end


--------------------------------------------------
