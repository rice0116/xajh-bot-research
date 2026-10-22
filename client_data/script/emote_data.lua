--[[#tag push auto]]
-------------------------------
-- 表情信息配置
-------------------------------
Emote.EmoteInfo =
{
	[EXPRESSION_TYPE.WAVE] = --挥手
	{
		[0] = -- 男
		{
			needTargetName 	= true,			--消息中是否需要对象名称

			chatMsg 		= --[[!AUTO_1]]"對%s揮揮手，重逢已非昔日，今朝一醉方休如何？",
			chatMsgNoTarget	= --[[!AUTO_2]]"興高采烈地從人群中冒出來，揮了揮手，向大家打了個招呼。",	--无目标时，上面的消息用这个替代

			popMsg			= --[[!AUTO_3]]"%s，近日可好?",		--头顶泡泡
			popMsgNoTarget	= --[[!AUTO_4]]"近日可好?",

			chatMsgResponse = --[[!AUTO_5]]"還行吧。",

			gfx 			= Emote.GFX[1],
		},
		[1] = -- 女
		{
			needTargetName 	= true,			--消息中是否需要对象名称

			chatMsg 		= --[[!AUTO_6]]"對%s揮揮手，自上回一別數日，今朝相見可否把酒一敘。",
			chatMsgNoTarget	= --[[!AUTO_7]]"興高采烈地從人群中冒出來，揮了揮手，向大家打了個招呼。",	--无目标时，上面的消息用这个替代

			popMsg			= --[[!AUTO_8]]"%s，近日可好?",		--头顶泡泡
			popMsgNoTarget	= --[[!AUTO_9]]"近日可好?",
			chatMsgResponse = --[[!AUTO_10]]"還行吧。",
			gfx 			= Emote.GFX[2],
		},
		[Emote.EmoteGenderNPC] = -- NPC
		{
			Msg				= --[[!AUTO_11]]"甚好甚好。",
		},
		[Emote.EmoteGenderMonster] = -- Monster
		{
			Msg				= --[[!AUTO_12]]"看什麼看？小心我打你！",
		},
		[Emote.EmoteGenderPet] = -- Pet反应动作喊话id，第一个为主人，第二个为其他玩家
		{
			MsgID			= {500, 519},
		},
	},

	[EXPRESSION_TYPE.ASK] = --请求
	{
		[0] = -- 男
		{
			needTargetName 	= true,			--消息中是否需要对象名称

			chatMsg 		= --[[!AUTO_13]]"無奈的向%s舉手的求情，看起來上去非常誠懇。",
			chatMsgNoTarget	= --[[!AUTO_14]]"雙手合十高舉過頭，低頭求情，看起來讓人不由得心中一軟。",
			popMsg			= --[[!AUTO_15]]"%s，求您高抬貴手……",		--头顶泡泡
			popMsgNoTarget	= --[[!AUTO_16]]"求您高抬貴手……",
			gfx				= Emote.GFX[1],
		},
		[1] = -- 女
		{
			needTargetName 	= true,			--消息中是否需要对象名称


			chatMsg 		= --[[!AUTO_17]]"娥眉緊蹙，眼帶愧疚的向%s求情，欲言又止惹人憐憫。",
			chatMsgNoTarget	= --[[!AUTO_18]]"身子向前微傾，雙手合十懇求，令人不由得心生憐香惜玉之情。",
			popMsg			= --[[!AUTO_19]]"%s，請求。。",		--头顶泡泡
			popMsgNoTarget	= --[[!AUTO_20]]"請求大家。。",
			gfx				= Emote.GFX[2],
		},
		[Emote.EmoteGenderNPC] = -- NPC
		{
			Msg				= --[[!AUTO_21]]"所謂何事？",
		},
		[Emote.EmoteGenderMonster] = -- Monster
		{
			Msg				= --[[!AUTO_22]]"看什麼看？小心我打你！",
		},
		[Emote.EmoteGenderPet] = -- Pet反应动作喊话id，第一个为主人，第二个为其他玩家
		{
			MsgID			= {501,520},
		},
	},

	[EXPRESSION_TYPE.KNEEL] = --下跪抱拳
	{
		[0] = -- 男
		{
			needTargetName 	= true,			--消息中是否需要对象名称

			chatMsg 		= --[[!AUTO_23]]"上前單膝跪地，向%s抱拳行禮，十分恭敬。",
			chatMsgNoTarget	= --[[!AUTO_24]]"一把撩起衣襟，單膝跪倒在地，雙手抱拳向大家鄭重的行了個禮。",	--无目标时，上面的消息用这个替代


			popMsg			= --[[!AUTO_25]]"給前輩問好！",		--头顶泡泡
			popMsgNoTarget	= --[[!AUTO_26]]"給前輩問好！",
			gfx 			= Emote.GFX[1],
		},
		[1] = -- 女
		{
			needTargetName 	= true,			--消息中是否需要对象名称


			chatMsg 		= --[[!AUTO_27]]"上前單膝跪地，向%s抱拳行禮，英姿颯爽。",
			chatMsgNoTarget	= --[[!AUTO_28]]"單膝跪倒，雙手抱拳向大家鄭重的行了個禮。",	--无目标时，上面的消息用这个替代


			popMsg			= --[[!AUTO_29]]"給前輩問好！",		--头顶泡泡
			popMsgNoTarget	= --[[!AUTO_30]]"給前輩問好！",
			gfx 			= Emote.GFX[2],
		},
		[Emote.EmoteGenderNPC] = -- NPC
		{
			Msg				= --[[!AUTO_31]]"快快請起！",
		},
		[Emote.EmoteGenderMonster] = -- Monster
		{
			Msg				= --[[!AUTO_32]]"看什麼看？小心我打你！",
		},
		[Emote.EmoteGenderPet] = -- Pet反应动作喊话id，第一个为主人，第二个为其他玩家
		{
			MsgID			= {502,521},
		},
	},
	[EXPRESSION_TYPE.POINT] = --手指前方
	{
		[0] = -- 男
		{
			needTargetName 	= true,			--消息中是否需要对象名称

			chatMsg 		= --[[!AUTO_33]]"向前指指，眼珠亦隨之一動，示意%s看他所指之處。",
			chatMsgNoTarget	= --[[!AUTO_34]]"舉臂直直地指向前方，眾人不由得都朝他的指向望去。",--无目标时，上面的消息用这个替代

			popMsg			= --[[!AUTO_35]]"%s，看那邊……",		--头顶泡泡
			popMsgNoTarget	= --[[!AUTO_36]]"看那邊……",
			gfx 			= Emote.GFX[1],
		},
		[1] = -- 女
		{
			needTargetName 	= true,			--消息中是否需要对象名称

			chatMsg 		= --[[!AUTO_37]]"肯定的往那方一指，並示意%s看他所指之處。",
			chatMsgNoTarget	= --[[!AUTO_38]]"伸出纖纖玉手朝前一指，眾人不由得都朝她的指向望去。",	--无目标时，上面的消息用这个替代

			popMsg			= --[[!AUTO_39]]"%s，看那邊……",		--头顶泡泡
			popMsgNoTarget	= --[[!AUTO_40]]"看那邊……",
			gfx 			= Emote.GFX[2],
		},
		[Emote.EmoteGenderNPC] = -- NPC
		{
			Msg				= --[[!AUTO_41]]"嗯？",
		},
		[Emote.EmoteGenderMonster] = -- Monster
		{
			Msg				= --[[!AUTO_42]]"看什麼看？小心我打你！",
		},
		[Emote.EmoteGenderPet] = -- Pet反应动作喊话id，第一个为主人，第二个为其他玩家
		{
			MsgID			= {503,522},
		},
	},
	[EXPRESSION_TYPE.SALUTE] = --抱拳
	{
		[0] = -- 男
 		{
			needTargetName 	= true,			--消息中是否需要对象名称

			chatMsg 		= --[[!AUTO_43]]"面帶微笑對%s雙手抱拳。",
			chatMsgNoTarget	= --[[!AUTO_44]]"雙手抱拳，對周圍的人拱了拱手。",		--无目标时，上面的消息用这个替代

			popMsg			= --[[!AUTO_45]]"失敬。",		--头顶泡泡
			popMsgNoTarget	= --[[!AUTO_46]]"失敬。",
			gfx 			= Emote.GFX[1],
		},
		[1] = -- 女
		{
			needTargetName 	= true,			--消息中是否需要对象名称

			chatMsg 		= --[[!AUTO_47]]"表情嚴肅的對%s抱拳。",
			chatMsgNoTarget	= --[[!AUTO_48]]"雙手抱拳，對周圍的人拱了拱手。",	--无目标时，上面的消息用这个替代

			popMsg			= --[[!AUTO_49]]"%s，小女子這廂有禮了",		--头顶泡泡
			popMsgNoTarget	= --[[!AUTO_50]]"小女子這廂有禮了",
			gfx 			= Emote.GFX[2],
		},
		[Emote.EmoteGenderNPC] = -- NPC
		{
			Msg				= --[[!AUTO_51]]"久仰。",
		},
		[Emote.EmoteGenderMonster] = -- Monster
		{
			Msg				= --[[!AUTO_52]]"看什麼看？小心我打你！",
		},
		[Emote.EmoteGenderPet] = -- Pet反应动作喊话id，第一个为主人，第二个为其他玩家
		{
			MsgID			= {504,523},
		},
	},
	[EXPRESSION_TYPE.SHY] = --害羞
	{
		[0] = -- 男
		{
			needTargetName 	= true,			--消息中是否需要对象名称

			chatMsg 		= --[[!AUTO_53]]"對%s傻笑著撓撓頭，有點不好意思。",
			chatMsgNoTarget	= --[[!AUTO_54]]"一向豪邁，此時卻有些羞澀，一邊低頭囁嚅著什麼，一邊用手搔頭。",	--无目标时，无目标时，上面的消息用这个替代
			popMsg			= --[[!AUTO_55]]"我……那個……有點……",		--头顶泡泡
			popMsgNoTarget	= --[[!AUTO_56]]"我……那個……有點……",
			gfx 			= Emote.GFX[1],
		},
		[1] = -- 女
		{
			needTargetName 	= true,			--消息中是否需要对象名称

			chatMsg 		= --[[!AUTO_57]]"對著%s羞得滿臉通紅，低頭不語，十分可愛。",
			chatMsgNoTarget	= --[[!AUTO_58]]"雙手背在身後，低下頭扭捏的微微搖著，一副嬌羞的模樣。",		--无目标时，无目标时，上面的消息用这个替代
			popMsg			= --[[!AUTO_59]]"我……那個……有點……",		--头顶泡泡
			popMsgNoTarget	= --[[!AUTO_60]]"我……那個……有點……",
			gfx 			= Emote.GFX[2],
		},
		[Emote.EmoteGenderNPC] = -- NPC
		{
			Msg				= --[[!AUTO_61]]"你是傻了還是？",
		},
		[Emote.EmoteGenderMonster] = -- Monster
		{
			Msg				= --[[!AUTO_62]]"看什麼看？小心我打你！",
		},
		[Emote.EmoteGenderPet] = -- Pet反应动作喊话id，第一个为主人，第二个为其他玩家
		{
			MsgID			= {505,524},
		},
	},

	[EXPRESSION_TYPE.ANGRY] = --发怒
	{
		[0] = -- 男
		{
			needTargetName 	= true,			--消息中是否需要对象名称


			chatMsg 		= --[[!AUTO_63]]"眼神之中似乎燒起一團熊熊怒火，這團怒火似乎要把%s吞噬。",
			chatMsgNoTarget	= --[[!AUTO_64]]"怒髮衝冠，邁開一步張開雙手，仰天長嘯一聲。",		--无目标时，消息用这个替代
			popMsg			= --[[!AUTO_65]]"%s，聽著！",		--头顶泡泡
			popMsgNoTarget	= --[[!AUTO_66]]"聽著！",
			gfx 			= Emote.GFX[1],
		},
		[1] = -- 女
		{
			needTargetName 	= true,			--消息中是否需要对象名称

			chatMsg 		= --[[!AUTO_67]]"眉宇之間流出幾縷寒意，似乎要把%s凍結起來。",
			chatMsgNoTarget	= --[[!AUTO_68]]"不知為何發了很大的脾氣，雙手叉腰，嬌蠻的樣子顯得別樣的可愛。",		--无目标时，消息用这个替代
			popMsg			= --[[!AUTO_69]]"%s，聽著！",		--头顶泡泡
			popMsgNoTarget	= --[[!AUTO_70]]"聽著！",
			gfx 			= Emote.GFX[2],
		},
		[Emote.EmoteGenderNPC] = -- NPC
		{
			Msg				= --[[!AUTO_71]]"有話好說。",
		},
		[Emote.EmoteGenderMonster] = -- Monster
		{
			Msg				= --[[!AUTO_72]]"看什麼看？小心我打你！",
		},
		[Emote.EmoteGenderPet] = -- Pet反应动作喊话id，第一个为主人，第二个为其他玩家
		{
			MsgID			= {506,525},
		},
	},

	[EXPRESSION_TYPE.SAD] = --伤心
	{
		[0] = -- 男
		{
			needTargetName 	= true,			--消息中是否需要对象名称

			chatMsg 		= --[[!AUTO_73]]"站在%s掩面痛哭，至於個中因果別人又怎能知曉。",
			chatMsgNoTarget	= --[[!AUTO_74]]"傷心欲絕，捶胸頓足，雙手抱住頭不住地嗚咽。",		--无目标时，消息用这个替代
			popMsg			= --[[!AUTO_75]]"……",		--头顶泡泡
			popMsgNoTarget	= --[[!AUTO_76]]"……",
			gfx 			= Emote.GFX[1],
		},
		[1] = -- 女
		{
			needTargetName 	= true,			--消息中是否需要对象名称

			chatMsg 		= --[[!AUTO_77]]"在%s面前坐地哭泣，試問誰人懂她眼角一滴淚落。",
			chatMsgNoTarget	= --[[!AUTO_78]]"傷心欲絕，雙膝跪倒在地上，掩面無聲地飲泣，讓人看了真心疼。",		--无目标时，消息用这个替代
			popMsg			= --[[!AUTO_79]]"……",		--头顶泡泡
			popMsgNoTarget	= --[[!AUTO_80]]"……",
			gfx 			= Emote.GFX[2],
		},
		[Emote.EmoteGenderNPC] = -- NPC
		{
			Msg				= --[[!AUTO_81]]"世事無常，終要釋懷。",
		},
		[Emote.EmoteGenderMonster] = -- Monster
		{
			Msg				= --[[!AUTO_82]]"看什麼看？小心我打你！",
		},
		[Emote.EmoteGenderPet] = -- Pet反应动作喊话id，第一个为主人，第二个为其他玩家
		{
			MsgID			= {507,526},
		},
	},

	[EXPRESSION_TYPE.CLAP] = --鼓掌
	{
		[0] = -- 男
		{
			needTargetName 	= true,			--消息中是否需要对象名称

			chatMsg 		= --[[!AUTO_83]]"對%s大喝一聲“好！”，然後用力鼓起掌來。",
			chatMsgNoTarget	= --[[!AUTO_84]]"感到頗為欣賞，一邊點頭，一邊鼓掌稱快。",		--无目标时，消息用这个替代
			popMsg			= --[[!AUTO_85]]"%s，好！",		--头顶泡泡
			popMsgNoTarget	= --[[!AUTO_86]]"好！",
			gfx 			= Emote.GFX[1],
		},
		[1] = -- 女
		{
			needTargetName 	= true,			--消息中是否需要对象名称


			chatMsg 		= --[[!AUTO_87]]"對著%s輕快的鼓起掌來，顯得十分雀躍。",
			chatMsgNoTarget	= --[[!AUTO_88]]"感到頗為欣賞，笑吟吟地拍起手。",		--无目标时，消息用这个替代
			popMsg			= --[[!AUTO_89]]"%s，好！",		--头顶泡泡
			popMsgNoTarget	= --[[!AUTO_90]]"好！",
			gfx 			= Emote.GFX[2],
		},
		[Emote.EmoteGenderNPC] = -- NPC
		{
			Msg				= --[[!AUTO_91]]"好什麼好？",
		},
		[Emote.EmoteGenderMonster] = -- Monster
		{
			Msg				= --[[!AUTO_92]]"看什麼看？小心我打你！",
		},
		[Emote.EmoteGenderPet] = -- Pet反应动作喊话id，第一个为主人，第二个为其他玩家
		{
			MsgID			= {508,527},
		},
	},

	[EXPRESSION_TYPE.APPLAUSE] = --欢呼
	{
		[0] = -- 男
		{
			needTargetName 	= true,			--消息中是否需要对象名称


			chatMsg 		= --[[!AUTO_93]]"心頭十分痛快，淩空一翻，對著%s歡呼起來。",
			chatMsgNoTarget	= --[[!AUTO_94]]"按耐不住心中的喜悅，淩空翻了個筋斗，落地高舉手臂，歡呼呐喊。",		--无目标时，消息用这个替代
			popMsg			= --[[!AUTO_95]]"%s，喔喔……",		--头顶泡泡
			popMsgNoTarget	= --[[!AUTO_96]]"喔喔……",
			gfx 			= Emote.GFX[1],
		},
		[1] = -- 女
		{
			needTargetName 	= true,			--消息中是否需要对象名称

			chatMsg 		= --[[!AUTO_97]]"掩藏不住心底的興奮，大聲對著%s歡呼。",
			chatMsgNoTarget	= --[[!AUTO_98]]"心情大好，按耐不住心中的喜悅，高興地舉起雙手，歡跳起來。",		--无目标时，消息用这个替代
			popMsg			= --[[!AUTO_99]]"%s，喔喔……",		--头顶泡泡
			popMsgNoTarget	= --[[!AUTO_100]]"喔喔……",
			gfx 			= Emote.GFX[2],
		},
		[Emote.EmoteGenderNPC] = -- NPC
		{
			Msg				= --[[!AUTO_101]]"有何喜事？",
		},
		[Emote.EmoteGenderMonster] = -- Monster
		{
			Msg				= --[[!AUTO_102]]"看什麼看？小心我打你！",
		},
		[Emote.EmoteGenderPet] = -- Pet反应动作喊话id，第一个为主人，第二个为其他玩家
		{
			MsgID			= {509,528},
		},
	},

	[EXPRESSION_TYPE.KISS] = --亲吻
	{
		[0] = -- 男
		{
			needTargetName 	= true,			--消息中是否需要对象名称


			chatMsg 		= --[[!AUTO_103]]"彎著嘴角，斜著眉梢，向%s丟出一個飛吻，十分瀟灑。",
			chatMsgNoTarget	= --[[!AUTO_104]]"瀟灑的向大家送出一個飛吻，嘴角帶笑，真是風情萬種。",		--无目标时，消息用这个替代
			popMsg			= --[[!AUTO_105]]"%s，接著……",		--头顶泡泡
			popMsgNoTarget	= --[[!AUTO_106]]"接著……",
			gfx 			= Emote.GFX[1],
		},
		[1] = -- 女
		{
			needTargetName 	= true,			--消息中是否需要对象名称

			chatMsg 		= --[[!AUTO_107]]"對%s豁達的拋出一個香吻，引起周遭無數人的嫉妒。",
			chatMsgNoTarget	= --[[!AUTO_108]]"雙手向大家送出一個飛吻，讓周圍的人們不由得一陣心跳加速。",		--无目标时，消息用这个替代
			popMsg			= --[[!AUTO_109]]"%s，接著……",		--头顶泡泡
			popMsgNoTarget	= --[[!AUTO_110]]"接著……",
			gfx 			= Emote.GFX[2],
		},
		[Emote.EmoteGenderNPC] = -- NPC
		{
			Msg				= --[[!AUTO_111]]"失禮失禮，相當失禮。",
		},
		[Emote.EmoteGenderMonster] = -- Monster
		{
			Msg				= --[[!AUTO_112]]"看什麼看？小心我打你！",
		},
		[Emote.EmoteGenderPet] = -- Pet反应动作喊话id，第一个为主人，第二个为其他玩家
		{
			MsgID			= {510,529},
		},
	},

	[EXPRESSION_TYPE.DRINK] = --喝酒
	{
		[0] = -- 男
		{
			needTargetName 	= true,			--消息中是否需要对象名称


			chatMsg 		= --[[!AUTO_113]]"痛痛快快灌下一大口烈酒，在%s面前演來一式“采和攔腰”。",
			chatMsgNoTarget	= --[[!AUTO_114]]"看似有些微醉，踉蹌著拿起酒壺豪飲起來。",		--无目标时，消息用这个替代
			popMsg			= --[[!AUTO_115]]"呼~~~~~~~",		--头顶泡泡
			popMsgNoTarget	= --[[!AUTO_116]]"呼~~~~~~~",
			gfx 			= Emote.GFX[1],
		},
		[1] = -- 女
		{
			needTargetName 	= true,			--消息中是否需要对象名称


			chatMsg 		= --[[!AUTO_117]]"在%s面前抿了一小口，臉頰微微有些泛紅。",
			chatMsgNoTarget	= --[[!AUTO_118]]"以纖纖玉手托杯，微抿了一小口酒。",		--无目标时，消息用这个替代
			popMsg			= --[[!AUTO_119]]"呼~~~~~~~",		--头顶泡泡
			popMsgNoTarget	= --[[!AUTO_120]]"呼~~~~~~~",
			gfx 			= Emote.GFX[2],
		},
		[Emote.EmoteGenderNPC] = -- NPC
		{
			Msg				= --[[!AUTO_121]]"酒至微醺最佳，過頭就完。",
		},
		[Emote.EmoteGenderMonster] = -- Monster
		{
			Msg				= --[[!AUTO_122]]"看什麼看？小心我打你！",
		},
		[Emote.EmoteGenderPet] = -- Pet反应动作喊话id，第一个为主人，第二个为其他玩家
		{
			MsgID			= {511,530},
		},
	},

	[EXPRESSION_TYPE.EAT] = --吃肉
	{
		[0] = -- 男
		{
			needTargetName 	= true,			--消息中是否需要对象名称


			chatMsg 		= --[[!AUTO_123]]"咬下一大口肉，然後遞給%s。",
			chatMsgNoTarget	= --[[!AUTO_124]]"拿出酒肉，大口大口的吃了起來。",		--无目标时，消息用这个替代
			popMsg			= --[[!AUTO_125]]"%s，有肉請肉，有酒請酒！",		--头顶泡泡
			popMsgNoTarget	= --[[!AUTO_126]]"有肉請肉，有酒請酒！",
			gfx 			= Emote.GFX[1],
		},
		[1] = -- 女
		{
			needTargetName 	= true,			--消息中是否需要对象名称

			chatMsg 		= --[[!AUTO_127]]"在%s面前細細品嘗著烤肉。",
			chatMsgNoTarget	= --[[!AUTO_128]]"拿起一串肉，咬下一塊，細細品嘗。",		--无目标时，消息用这个替代
			popMsg			= --[[!AUTO_129]]"%s，有肉請肉，有酒請酒！",		--头顶泡泡
			popMsgNoTarget	= --[[!AUTO_130]]"有肉請肉，有酒請酒！",
			gfx 			= Emote.GFX[2],
		},
		[Emote.EmoteGenderNPC] = -- NPC
		{
			Msg				= --[[!AUTO_131]]"我是吃素的。",
		},
		[Emote.EmoteGenderMonster] = -- Monster
		{
			Msg				= --[[!AUTO_132]]"看什麼看？小心我打你！",
		},
		[Emote.EmoteGenderPet] = -- Pet反应动作喊话id，第一个为主人，第二个为其他玩家
		{
			MsgID			= {512,531},
		},
	},

	[EXPRESSION_TYPE.BEG] = --跪求
	{
		[0] = -- 男
		{
			needTargetName 	= true,			--消息中是否需要对象名称

			chatMsg 		= --[[!AUTO_133]]"跪在%s面前雙手置於頭頂哀求，看起來有些搞怪。",
			chatMsgNoTarget	= --[[!AUTO_134]]"雙膝跪倒在地，雙手伸出置於頭頂，不住地哀求。",		--无目标时，消息用这个替代
			popMsg			= --[[!AUTO_135]]"%s，我求您……",		--头顶泡泡
			popMsgNoTarget	= --[[!AUTO_136]]"我求您……",
			gfx 			= Emote.GFX[1],
		},
		[1] = -- 女
		{
			needTargetName 	= true,			--消息中是否需要对象名称

			chatMsg 		= --[[!AUTO_137]]"癱倒在地，低聲下氣的向%s祈求。",
			chatMsgNoTarget	= --[[!AUTO_138]]"突然雙膝跪倒在地，兩手抱拳，不住地哀求。",		--无目标时，消息用这个替代
			popMsg			= --[[!AUTO_139]]"%s，我求您……",		--头顶泡泡
			popMsgNoTarget	= --[[!AUTO_140]]"我求您……",
			gfx 			= Emote.GFX[2],
		},
		[Emote.EmoteGenderNPC] = -- NPC
		{
			Msg				= --[[!AUTO_141]]"要幹什麼直說。",
		},
		[Emote.EmoteGenderMonster] = -- Monster
		{
			Msg				= --[[!AUTO_142]]"看什麼看？小心我打你！",
		},
		[Emote.EmoteGenderPet] = -- Pet反应动作喊话id，第一个为主人，第二个为其他玩家
		{
			MsgID			= {513,532},
		},
	},

	[EXPRESSION_TYPE.PUSHUP] = --锻炼
	{
		[0] = -- 男
		{
			needTargetName 	= true,			--消息中是否需要对象名称

			chatMsg 		= --[[!AUTO_143]]"當著%s的面突然俯身炫耀起一指禪，簡直令人人咋舌！",
			chatMsgNoTarget	= --[[!AUTO_144]]"輕輕鬆松的在地上練起“一指禪”。",		--无目标时，消息用这个替代
			popMsg			= --[[!AUTO_145]]"說來就來！",		--头顶泡泡
			popMsgNoTarget	= --[[!AUTO_146]]"說來就來！",
			gfx 			= Emote.GFX[1],
		},
		[1] = -- 女
		{
			needTargetName 	= true,			--消息中是否需要对象名称

			chatMsg 		= --[[!AUTO_147]]"當著%s的面突然俯身鍛煉起來，簡直令人人咋舌！",
			chatMsgNoTarget	= --[[!AUTO_148]]"輕輕鬆松的俯地鍛煉起來。",		--无目标时，消息用这个替代
			popMsg			= --[[!AUTO_149]]"說來就來！",		--头顶泡泡
			popMsgNoTarget	= --[[!AUTO_150]]"說來就來！",
			gfx 			= Emote.GFX[2],
		},
		[Emote.EmoteGenderNPC] = -- NPC
		{
			Msg				= --[[!AUTO_151]]"力道不錯~",
		},
		[Emote.EmoteGenderMonster] = -- Monster
		{
			Msg				= --[[!AUTO_152]]"看什麼看？小心我打你！",
		},
		[Emote.EmoteGenderPet] = -- Pet反应动作喊话id，第一个为主人，第二个为其他玩家
		{
			MsgID			= {514,533},
		},
	},

	[EXPRESSION_TYPE.SAUCE] = --赊酒
	{
		[0] = -- 男
		{
			needTargetName 	= false,			--消息中是否需要对象名称

			chatMsg 		= --[[!AUTO_153]]"賒了一壺老酒，一副吊兒郎當的樣子。",
			chatMsgNoTarget	= --[[!AUTO_154]]"賒了一壺老酒，心裡盤算著何時結了這酒賬。",		--无目标时，消息用这个替代
			popMsg			= --[[!AUTO_155]]"%s，為君多賒一壺酒~",		--头顶泡泡
			popMsgNoTarget	= --[[!AUTO_156]]"為君多賒一壺酒~",
			gfx 			= Emote.GFX[1],
		},
		[1] = -- 女
		{
			needTargetName 	= false,			--消息中是否需要对象名称

			chatMsg 		= --[[!AUTO_157]]"大大方方把手中酒壺遞給%s。",
			chatMsgNoTarget	= --[[!AUTO_158]]"雖然賒了一壺酒，但心裡絲毫不慌，因為酒錢記在別人的帳上了。",		--无目标时，消息用这个替代
			popMsg			= --[[!AUTO_159]]"%s，為君多賒一壺酒~",		--头顶泡泡
			popMsgNoTarget	= --[[!AUTO_160]]"為君多賒一壺酒~",
			gfx 			= Emote.GFX[2],
		},
		[Emote.EmoteGenderNPC] = -- NPC
		{
			Msg				= --[[!AUTO_161]]"偷來浮生半日閑~",
		},
		[Emote.EmoteGenderMonster] = -- Monster
		{
			Msg				= --[[!AUTO_162]]"看什麼看？小心我打你！",
		},
		[Emote.EmoteGenderPet] = -- Pet反应动作喊话id，第一个为主人，第二个为其他玩家
		{
			MsgID			= {515,534},
		},
	},

	[EXPRESSION_TYPE.SLEEP] = --睡觉
	{
		[0] = -- 男
		{
			needTargetName 	= true,			--消息中是否需要对象名称

			chatMsg 		= --[[!AUTO_163]]"居然當著%s的面倒地就睡，招搖過市，絲毫不顧及形象。",
			chatMsgNoTarget	= --[[!AUTO_164]]"雙手抱頭躺在地上，一會兒就美美的進入了夢鄉。",		--无目标时，消息用这个替代
			popMsg			= --[[!AUTO_165]]"zzzzzzz",		--头顶泡泡
			popMsgNoTarget	= --[[!AUTO_166]]"zzzzzzz",
			gfx 			= Emote.GFX[1],
		},
		[1] = -- 女
		{
			needTargetName 	= true,			--消息中是否需要对象名称

			chatMsg 		= --[[!AUTO_167]]"一臉倦容，在%s面前倒地就睡，嚇得對方措手不及。",
			chatMsgNoTarget	= --[[!AUTO_168]]"側身躺倒在地，安然進入夢鄉。",		--无目标时，消息用这个替代
			popMsg			= --[[!AUTO_169]]"zzzzzzz",		--头顶泡泡
			popMsgNoTarget	= --[[!AUTO_170]]"zzzzzzz",
			gfx 			= Emote.GFX[2],
		},
		[Emote.EmoteGenderNPC] = -- NPC
		{
			Msg				= --[[!AUTO_171]]"你這又是哪一齣？",
		},
		[Emote.EmoteGenderMonster] = -- Monster
		{
			Msg				= --[[!AUTO_172]]"看什麼看？小心我打你！",
		},
		[Emote.EmoteGenderPet] = -- Pet反应动作喊话id，第一个为主人，第二个为其他玩家
		{
			MsgID			= {516,535},
		},
	},

	[EXPRESSION_TYPE.LIEDOWNDRINK] = --躺下喝酒
	{
		[0] = -- 男
		{
			needTargetName 	= true,			--消息中是否需要对象名称

			chatMsg 		= --[[!AUTO_173]]"躺在%s身前一番暢飲，隨即一招鯉魚打挺，似醉非醉。",
			chatMsgNoTarget	= --[[!AUTO_174]]"有些醉意，順勢倒在地上，豪飲一杯後，竟又一個鯉魚打挺跳起來，穩穩地站在地上。",		--无目标时，消息用这个替代
			popMsg			= --[[!AUTO_175]]"%s，一飲成三歎",		--头顶泡泡
			popMsgNoTarget	= --[[!AUTO_176]]"一飲成三歎",
			gfx 			= Emote.GFX[1],
		},
		[1] = -- 女
		{
			needTargetName 	= true,			--消息中是否需要对象名称

			chatMsg 		= --[[!AUTO_177]]"在%s身邊半依半臥舉杯盡飲，紅唇微張，懾人心神。",
			chatMsgNoTarget	= --[[!AUTO_178]]"斜身躺在地上，舉起酒杯，美美地飲下一杯。",		--无目标时，消息用这个替代
			popMsg			= --[[!AUTO_179]]"%s，一飲成三歎",		--头顶泡泡
			popMsgNoTarget	= --[[!AUTO_180]]"一飲成三歎",
			gfx 			= Emote.GFX[2],
		},
		[Emote.EmoteGenderNPC] = -- NPC
		{
			Msg				= --[[!AUTO_181]]"酒能不醉人？笑話。",
		},
		[Emote.EmoteGenderMonster] = -- Monster
		{
			Msg				= --[[!AUTO_182]]"看什麼看？小心我打你！",
		},
		[Emote.EmoteGenderPet] = -- Pet反应动作喊话id，第一个为主人，第二个为其他玩家
		{
			MsgID			= {517,536},
		},
	},

	[EXPRESSION_TYPE.BOW] = --作揖
	{
		[0] = -- 男
		{
			needTargetName 	= true,			--消息中是否需要对象名称

			chatMsg 		= --[[!AUTO_183]]"恭恭敬敬的對%s抱拳作揖。",
			chatMsgNoTarget	= --[[!AUTO_184]]"雙手抱拳，身體微向前傾，作揖行禮。",		--无目标时，消息用这个替代
			popMsg			= --[[!AUTO_185]]"%s，幸會幸會。",		--头顶泡泡
			popMsgNoTarget	= --[[!AUTO_186]]"幸會幸會。",
			gfx 			= Emote.GFX[1],
		},
		[1] = -- 女
		{
			needTargetName 	= true,			--消息中是否需要对象名称

			chatMsg 		= --[[!AUTO_187]]"對%s簡簡單單做了個萬福。",
			chatMsgNoTarget	= --[[!AUTO_188]]"側身做了個萬福。",		--无目标时，消息用这个替代
			popMsg			= --[[!AUTO_189]]"%s，幸會幸會。",		--头顶泡泡
			popMsgNoTarget	= --[[!AUTO_190]]"幸會幸會。",
			gfx 			= Emote.GFX[2],
		},
		[Emote.EmoteGenderNPC] = -- NPC
		{
			Msg				= --[[!AUTO_191]]"客氣客氣。",
		},
		[Emote.EmoteGenderMonster] = -- Monster
		{
			Msg				= --[[!AUTO_192]]"看什麼看？小心我打你！",
		},
		[Emote.EmoteGenderPet] = -- Pet反应动作喊话id，第一个为主人，第二个为其他玩家
		{
			MsgID			= {518,537},
		},
	},

	[EXPRESSION_TYPE.ROLEEXP_TWO_KISS] =
	{
		[0] = -- 男
		{
			needTargetName 	= true,			--消息中是否需要对象名称

			chatMsg 		= --[[!AUTO_193]]"對%s深情一吻。",
			chatMsgNoTarget	= --[[!AUTO_194]]"做了個飛吻的姿勢。",		--无目标时，消息用这个替代
			popMsg			= --[[!AUTO_195]]"%s，春宵一刻值千金啊！",		--头顶泡泡
			popMsgNoTarget	= --[[!AUTO_196]]"春宵一刻值千金啊！",
			gfx 			= Emote.GFX[1],
		},
		[1] = -- 女
		{
			needTargetName 	= true,			--消息中是否需要对象名称

			chatMsg 		= --[[!AUTO_197]]"對%s深情回吻。",
			chatMsgNoTarget	= --[[!AUTO_198]]"做了個飛吻的姿勢。",		--无目标时，消息用这个替代
			popMsg			= --[[!AUTO_199]]"%s，我和你在天願作比翼鳥，在地願為連理枝。",		--头顶泡泡
			popMsgNoTarget	= --[[!AUTO_200]]"在天願作比翼鳥，在地願為連理枝。",
			gfx 			= Emote.GFX[2],
		},
		[Emote.EmoteGenderNPC] = -- NPC
		{
			Msg				= --[[!AUTO_201]]"不知羞不知羞。",
		},
		[Emote.EmoteGenderMonster] = -- Monster
		{
			Msg				= --[[!AUTO_202]]"看什麼看？小心我打你！",
		},
	},

	[EXPRESSION_TYPE.ROLEEXP_TIP] =
	{
		[0] = -- 男
		{
			needTargetName 	= true,			--消息中是否需要对象名称

			chatMsg 		= --[[!AUTO_193]]"對著%s不好意思的搓了搓手，眼神中盡是呼之欲出的渴望",
			chatMsgNoTarget	= --[[!AUTO_194]]"豪氣沖天的將手探進錢包，掏出一疊紅包。",		--无目标时，消息用这个替代
			popMsg			= --[[!AUTO_195]]"萬水千山總是情，給點打賞行不行？",		--头顶泡泡
			popMsgNoTarget	= --[[!AUTO_196]]"爺自己包養自己。",
			gfx 			= Emote.GFX[1],
		},
		[1] = -- 女
		{
			needTargetName 	= true,			--消息中是否需要对象名称

			chatMsg 		= --[[!AUTO_197]]"對著%s不好意思的搓了搓手，眼神中盡是呼之欲出的渴望。",
			chatMsgNoTarget	= --[[!AUTO_198]]"豪氣沖天的將手探進錢包，掏出一疊紅包。",		--无目标时，消息用这个替代
			popMsg			= --[[!AUTO_199]]"萬水千山總是情，給點打賞行不行？",		--头顶泡泡
			popMsgNoTarget	= --[[!AUTO_200]]"爺自己包養自己。",
			gfx 			= Emote.GFX[2],
		},
		[Emote.EmoteGenderNPC] = -- NPC
		{
			Msg				= --[[!AUTO_201]]"不知羞不知羞。",
		},
		[Emote.EmoteGenderMonster] = -- Monster
		{
			Msg				= --[[!AUTO_202]]"看什麼看？小心我打你！",
		},
	},
}

Emote.Icon =
{
	--[[!AUTO_203]]"02251表情行为.dds",
	--[[!AUTO_204]]"02236表情捡拾.dds",
	--[[!AUTO_205]]"02235表情切换走跑.dds",
	"02251表情行為.dds",		-- 求打赏
	--[[!AUTO_206]]"02215表情挥手.dds",
	--[[!AUTO_207]]"02216表情请求.dds",
	--[[!AUTO_208]]"02220表情下跪抱拳.dds",
	--[[!AUTO_209]]"02219表情手指前方.dds",
	--[[!AUTO_210]]"02217表情抱拳.dds",
	--[[!AUTO_211]]"02221表情害羞.dds",
	--[[!AUTO_212]]"02222表情发怒.dds",
	--[[!AUTO_213]]"02223表情伤心.dds",
	--[[!AUTO_214]]"02224表情鼓掌.dds",
	--[[!AUTO_215]]"02225表情欢呼.dds",
	--[[!AUTO_216]]"02226亲吻.dds",
	--[[!AUTO_217]]"02227表情喝酒.dds",
	--[[!AUTO_218]]"02228表情吃肉.dds",
	--[[!AUTO_219]]"02229表情跪求.dds",
	--[[!AUTO_220]]"02230表情俯卧撑.dds",
	--[[!AUTO_221]]"02231表情打酱油.dds",
	--[[!AUTO_222]]"02232表情睡觉.dds",
	--[[!AUTO_223]]"02233表情躺下喝酒.dds",
	--[[!AUTO_224]]"02218表情作揖.dds",
	"08917表情無聊.dds",
	"08918表情害怕.dds",
	"08919表情猜拳石頭.dds",
	"08920表情猜拳剪子.dds",
	"08921表情猜拳布.dds",
	"08922表情搖頭拒絕.dds",
	"08923表情裝可愛.dds",
	"11396表情坐下.dds",
	"11397表情潛伏.dds",
}

Emote.SpecialDesc =
{
	[1]	= {info1 = --[[!AUTO_232]]"^FFE673行為功能鍵用途：^FFFFFF\r1.選中其它玩家、人物、怪物；\r2.向已選中的目標移動；\r3.順風跳躍（奔跑情況下）；\r4.原地跳躍（站定情況下）；\r5.輕功翔躍（閃身情況下）。", info2 = --[[!AUTO_233]]"^64E3E3預設快速鍵：^FFFFFF滑鼠右鍵"},
	[2]	= {info1 = --[[!AUTO_234]]"^FFE673操作功能鍵用途：^FFFFFF\r1.搜索並拾取戰利品（大範圍）；\r2.搜索並採集挖掘品（中範圍）；\r3.搜索並尋找座位（小範圍）。", info2 = --[[!AUTO_235]]"^64E3E3預設快速鍵：^FFFFFF空白鍵"},
	[3]	= {info1 = --[[!AUTO_236]]"^FFE673切換走跑用途：^FFFFFF\r1.切為行走狀態（奔跑狀態中）；\r2.切為奔跑狀態（行走狀態中）。", info2 = --[[!AUTO_237]]"^64E3E3預設快速鍵：^FFFFFF無"},
	[4] = {info1 = "^FFE673向英俠玩家討賞用：^FFFFFF\r選中英俠玩家，即可討賞了", info2 = "^64E3E3默認快速鍵：^FFFFFF滑鼠右鍵"},
}
--自动表情回复配置

Emote.ObjList["NPC"] = {
--NPC自动表情回复开始
	[2713] = {mode = 1, reaction = {
		[1] = {EmoteID = 0, Cond = 0, Var = {0}, Actname = 1, Msgid = 1, pFlag = true, pMsgid = 1},
		}
	},
	[19080] = {mode = 2, reaction = {
		[1] = {EmoteID = 18, Cond = 1, Var = {2000}, Actname = 0, Msgid = 0, pFlag = true, pMsgid = 2},
		}
	},
	[19081] = {mode = 2, reaction = {
		[1] = {EmoteID = 18, Cond = 1, Var = {2005}, Actname = 0, Msgid = 2, pFlag = true, pMsgid = 3},
		}
	},
	[3259] = {mode = 1, reaction = {
		[1] = {EmoteID = 2, Cond = 1, Var = {1448,1523,1524,1525,1526,1527,1528,1529,1530,1531}, Actname = 2, Msgid = 3, pFlag = true, pMsgid = 4},
		}
	},
	[62703] = {mode = 2, reaction = {
		[1] = {EmoteID = 2, Cond = 1, Var = {5339}, Actname = 0, Msgid = 0, pFlag = true, pMsgid = 12},
		}
	},
	[55654] = {mode = 2, reaction = {}},
	[63358] = {mode = 2, reaction = {}},
	[63356] = {mode = 2, reaction = {}},
	[63357] = {mode = 2, reaction = {}},
	[63359] = {mode = 2, reaction = {}},
	[62697] = {mode = 2, reaction = {}},
	[62698] = {mode = 2, reaction = {}},
	[62699] = {mode = 2, reaction = {}},
	[35416] = {mode = 2, reaction = {}},
	[9476] = {mode = 2, reaction = {}},
	[35395] = {mode = 2, reaction = {}},
	[66939] = {mode = 2, reaction = {}},
	[44133] = {mode = 2, reaction = {}},
	[66859] = {mode = 2, reaction = {}},
	[16882] = {mode = 2, reaction = {}},
	[67421] = {mode = 2, reaction = {}},
	[68529] = {mode = 1, reaction = {
		[1] = {EmoteID = 3, Cond = 1, Var = {5838}, Actname = 1, Msgid = 4, pFlag = true, pMsgid = 5},
		}
	},
	[68538] = {mode = 1, reaction = {
		[1] = {EmoteID = 1, Cond = 1, Var = {5839}, Actname = 1, Msgid = 5, pFlag = true, pMsgid = 6},
		}
	},
	[67681] = {mode = 1, reaction = {
		[1] = {EmoteID = 11, Cond = 1, Var = {5589}, Actname = 1, Msgid = 6, pFlag = true, pMsgid = 7},
		}
	},
	[67699] = {mode = 1, reaction = {
		[1] = {EmoteID = 1, Cond = 1, Var = {5596}, Actname = 1, Msgid = 7, pFlag = true, pMsgid = 8},
		}
	},
	[67690] = {mode = 1, reaction = {
		[1] = {EmoteID = 4, Cond = 1, Var = {5610}, Actname = 0, Msgid = 8, pFlag = true, pMsgid = 9},
		}
	},
	[67732] = {mode = 1, reaction = {
		[1] = {EmoteID = 4, Cond = 1, Var = {5611}, Actname = 0, Msgid = 9, pFlag = true, pMsgid = 10},
		}
	},
	[63351] = {mode = 1, reaction = {
		[1] = {EmoteID = 0, Cond = 1, Var = {5219}, Actname = 0, Msgid = 10, pFlag = true, pMsgid = 11},
		}
	},
	[68303] = {mode = 2, reaction = {
		[1] = {EmoteID = 5, Cond = 1, Var = {5819}, Actname = 1, Msgid = 11, pFlag = true, pMsgid = 17},
		[2] = {EmoteID = 10, Cond = 1, Var = {5819}, Actname = 1, Msgid = 11, pFlag = true, pMsgid = 20},
		[3] = {EmoteID = 14, Cond = 1, Var = {5819}, Actname = 1, Msgid = 11, pFlag = true, pMsgid = 18},
		[4] = {EmoteID = 25, Cond = 1, Var = {5819}, Actname = 1, Msgid = 11, pFlag = true, pMsgid = 19},
		}
	},
	[68304] = {mode = 2, reaction = {
		[1] = {EmoteID = 5, Cond = 1, Var = {5820}, Actname = 1, Msgid = 11, pFlag = true, pMsgid = 15},
		[2] = {EmoteID = 10, Cond = 1, Var = {5820}, Actname = 1, Msgid = 11, pFlag = true, pMsgid = 16},
		[3] = {EmoteID = 7, Cond = 1, Var = {5820}, Actname = 1, Msgid = 11, pFlag = true, pMsgid = 13},
		[4] = {EmoteID = 25, Cond = 1, Var = {5820}, Actname = 1, Msgid = 11, pFlag = true, pMsgid = 14},
		}
	},
	[61767] = {mode = 1, reaction = {
		[1] = {EmoteID = 4, Cond = 1, Var = {5262}, Actname = 1, Msgid = 12, pFlag = true, pMsgid = 21},
		}
	},
	[61779] = {mode = 1, reaction = {
		[1] = {EmoteID = 4, Cond = 1, Var = {5259}, Actname = 1, Msgid = 12, pFlag = true, pMsgid = 21},
		}
	},
	[61776] = {mode = 1, reaction = {
		[1] = {EmoteID = 4, Cond = 1, Var = {5256}, Actname = 1, Msgid = 12, pFlag = true, pMsgid = 21},
		}
	},
	[61773] = {mode = 1, reaction = {
		[1] = {EmoteID = 4, Cond = 1, Var = {5250}, Actname = 1, Msgid = 12, pFlag = true, pMsgid = 21},
		}
	},
	[61752] = {mode = 1, reaction = {
		[1] = {EmoteID = 4, Cond = 1, Var = {5235}, Actname = 1, Msgid = 12, pFlag = true, pMsgid = 21},
		}
	},
	[61761] = {mode = 1, reaction = {
		[1] = {EmoteID = 4, Cond = 1, Var = {5244}, Actname = 1, Msgid = 12, pFlag = true, pMsgid = 21},
		}
	},
	[61758] = {mode = 1, reaction = {
		[1] = {EmoteID = 4, Cond = 1, Var = {5241}, Actname = 1, Msgid = 12, pFlag = true, pMsgid = 21},
		}
	},
	[61755] = {mode = 1, reaction = {
		[1] = {EmoteID = 4, Cond = 1, Var = {5238}, Actname = 1, Msgid = 12, pFlag = true, pMsgid = 21},
		}
	},
	[61764] = {mode = 1, reaction = {
		[1] = {EmoteID = 4, Cond = 1, Var = {5247}, Actname = 1, Msgid = 12, pFlag = true, pMsgid = 21},
		}
	},
	[61770] = {mode = 1, reaction = {
		[1] = {EmoteID = 4, Cond = 1, Var = {5253}, Actname = 1, Msgid = 12, pFlag = true, pMsgid = 21},
		}
	},
	[68302] = {mode = 2, reaction = {}},
	[59280] = {mode = 1, reaction = {
		[1] = {EmoteID = 11, Cond = 1, Var = {5553}, Actname = 2, Msgid = 13, pFlag = true, pMsgid = 22},
		}
	},
	[67072] = {mode = 2, reaction = {}},
	[35416] = {mode = 2, reaction = {}},
	[61401] = {mode = 2, reaction = {}},
	[61417] = {mode = 2, reaction = {}},
	[61416] = {mode = 2, reaction = {}},
	[61422] = {mode = 2, reaction = {}},
	[61421] = {mode = 2, reaction = {}},
	[61400] = {mode = 2, reaction = {}},
	[61418] = {mode = 2, reaction = {}},
	[61420] = {mode = 2, reaction = {}},
	[61419] = {mode = 2, reaction = {}},
	[62162] = {mode = 2, reaction = {}},
	[61402] = {mode = 2, reaction = {}},
	[61408] = {mode = 2, reaction = {}},
	[61414] = {mode = 2, reaction = {}},
	[63260] = {mode = 2, reaction = {}},
	[63259] = {mode = 2, reaction = {}},
	[63255] = {mode = 2, reaction = {}},
	[63258] = {mode = 2, reaction = {}},
	[63252] = {mode = 2, reaction = {}},
	[63253] = {mode = 2, reaction = {}},
	[63257] = {mode = 2, reaction = {}},
	[63254] = {mode = 2, reaction = {}},
	[66023] = {mode = 2, reaction = {}},
	[63256] = {mode = 2, reaction = {}},
	[66025] = {mode = 2, reaction = {}},
	[63251] = {mode = 2, reaction = {}},
	[66024] = {mode = 2, reaction = {}},
	[63321] = {mode = 2, reaction = {}},
	[63320] = {mode = 2, reaction = {}},
	[63317] = {mode = 2, reaction = {}},
	[63323] = {mode = 2, reaction = {}},
	[63324] = {mode = 2, reaction = {}},
	[63322] = {mode = 2, reaction = {}},
	[63325] = {mode = 2, reaction = {}},
	[63316] = {mode = 2, reaction = {}},
	[72693] = {mode = 2, reaction = {}},
	[63318] = {mode = 2, reaction = {}},
	[63319] = {mode = 2, reaction = {}},
	[63842] = {mode = 2, reaction = {}},
	[63841] = {mode = 2, reaction = {}},
	[63845] = {mode = 2, reaction = {}},
	[63840] = {mode = 2, reaction = {}},
	[63867] = {mode = 2, reaction = {}},
	[63851] = {mode = 2, reaction = {}},
	[63843] = {mode = 2, reaction = {}},
	[63868] = {mode = 2, reaction = {}},
	[63844] = {mode = 2, reaction = {}},
	[64202] = {mode = 2, reaction = {}},
	[64203] = {mode = 2, reaction = {}},
	[64200] = {mode = 2, reaction = {}},
	[64156] = {mode = 2, reaction = {}},
	[64157] = {mode = 2, reaction = {}},
	[64159] = {mode = 2, reaction = {}},
	[64201] = {mode = 2, reaction = {}},
	[64158] = {mode = 2, reaction = {}},
	[64155] = {mode = 2, reaction = {}},
	[64160] = {mode = 2, reaction = {}},
	[64199] = {mode = 2, reaction = {}},
	[64154] = {mode = 2, reaction = {}},
	[67147] = {mode = 2, reaction = {}},
	[67149] = {mode = 2, reaction = {}},
	[67146] = {mode = 2, reaction = {}},
	[67144] = {mode = 2, reaction = {}},
	[67148] = {mode = 2, reaction = {}},
	[67138] = {mode = 2, reaction = {}},
	[67139] = {mode = 2, reaction = {}},
	[67140] = {mode = 2, reaction = {}},
	[67143] = {mode = 2, reaction = {}},
	[67141] = {mode = 2, reaction = {}},
	[67142] = {mode = 2, reaction = {}},
	[67145] = {mode = 2, reaction = {}},
	[72135] = {mode = 2, reaction = {}},
	[72132] = {mode = 2, reaction = {}},
	[72131] = {mode = 2, reaction = {}},
	[72134] = {mode = 2, reaction = {}},
	[72140] = {mode = 2, reaction = {}},
	[72133] = {mode = 2, reaction = {}},
	[72138] = {mode = 2, reaction = {}},
	[72130] = {mode = 2, reaction = {}},
	[72136] = {mode = 2, reaction = {}},
	[72139] = {mode = 2, reaction = {}},
	[72137] = {mode = 2, reaction = {}},
	[61707] = {mode = 1, reaction = {
		[1] = {EmoteID = 11, Cond = 1, Var = {5206}, Actname = 2, Msgid = 14, pFlag = true, pMsgid = 23},
		}
	},
	[57517] = {mode = 2, reaction = {}},
	[74210] = {mode = 2, reaction = {}},
	[74209] = {mode = 2, reaction = {}},
	[61980] = {mode = 2, reaction = {}},
	[61998] = {mode = 2, reaction = {}},
	[61992] = {mode = 2, reaction = {}},
	[76205] = {mode = 2, reaction = {
		[1] = {EmoteID = 3, Cond = 1, Var = {6668}, Actname = 0, Msgid = 0, pFlag = true, pMsgid = 24},
		}
	},
	[2668] = {mode = 1, reaction = {}},
	[3334] = {mode = 1, reaction = {}},
	[12961] = {mode = 1, reaction = {}},
}

Emote.SpeakList = {}
Emote.SpeakList["Target"] = {
	[1] = {Text = --[[!AUTO_504]]"孺子可教！", SoundPath = --[[!AUTO_505]]""},
	[2] = {Text = --[[!AUTO_506]]"救……救救我！", SoundPath = --[[!AUTO_507]]""},
	[3] = {Text = --[[!AUTO_508]]"早就聽聞少俠大名,今日一見果然英姿颯爽、名不虛傳！", SoundPath = --[[!AUTO_509]]""},
	[4] = {Text = --[[!AUTO_510]]"妖邪之輩，一併誅卻！！！", SoundPath = --[[!AUTO_511]]""},
	[5] = {Text = --[[!AUTO_512]]"阿彌陀佛，若非諸位手下容情，老衲早已丟了性命！", SoundPath = --[[!AUTO_513]]""},
	[6] = {Text = --[[!AUTO_514]]"哈哈哈哈，好酒量，今日你我不醉不歸！", SoundPath = --[[!AUTO_515]]""},
	[7] = {Text = --[[!AUTO_516]]"人生在世，會當暢情適意，連酒也不能喝，女人不能想，人家欺到頭上不能還手，還做甚麼人？不如及早死了，來得爽快。", SoundPath = --[[!AUTO_517]]""},
	[8] = {Text = --[[!AUTO_518]]"說這等話，可坑殺俺了。俺求你別提來到五霸岡上的事，只是為免得惹人生氣，以後你有甚麼差遣，只須傳個訊來，火裡火裡去，水裡水裡去，司馬大只要皺一皺眉，祖宗十八代都是烏龜王八蛋。", SoundPath = --[[!AUTO_519]]""},
	[9] = {Text = --[[!AUTO_520]]"這件事，咳，當真是我們做得魯莽了，大夥兒一來是好奇，二來是想獻殷勤，想不到……本來嘛，人家臉皮子薄，不願張揚其事，我們這些莽漢粗人，誰都不懂。藍教主又是苗家姑娘，這個……", SoundPath = --[[!AUTO_521]]""},
	[10] = {Text = --[[!AUTO_522]]"咕咕……咕咕……", SoundPath = --[[!AUTO_523]]""},
	[11] = {Text = --[[!AUTO_524]]"…………", SoundPath = --[[!AUTO_525]]""},
	[12] = {Text = --[[!AUTO_526]]"少俠與本派有緣，亦是天意。", SoundPath = --[[!AUTO_527]]""},
	[13] = {Text = --[[!AUTO_528]]"在下也不知能再活得幾日，室家之想，那是永遠不會有的了。", SoundPath = --[[!AUTO_529]]""},
	[14] = {Text = --[[!AUTO_530]]"路見不平，拔刀相助，乃習武之人本分，不必客氣！", SoundPath = --[[!AUTO_531]]""},
}

Emote.SpeakList["Player"] = {
	[1] = {Text = --[[!AUTO_532]]"最近怎麼樣啊。", SoundPath = --[[!AUTO_533]]""},
	[2] = {Text = --[[!AUTO_534]]"今日乃前輩忌日，晚輩特來拜祭，請受在下一拜。", SoundPath = --[[!AUTO_535]]""},
	[3] = {Text = --[[!AUTO_536]]"江湖動盪，民不聊生，這位先生慘遭不幸，實在令人惋惜，一路走好。", SoundPath = --[[!AUTO_537]]""},
	[4] = {Text = --[[!AUTO_538]]"晚輩奉家師之命，前來為夫人賀壽，見過林老幫主。", SoundPath = --[[!AUTO_539]]""},
	[5] = {Text = --[[!AUTO_540]]"大師，明明就是這些人無禮在先，趁人之危，恃強淩弱！", SoundPath = --[[!AUTO_541]]""},
	[6] = {Text = --[[!AUTO_542]]"方生大師，事出有因，還望見諒！！！", SoundPath = --[[!AUTO_543]]""},
	[7] = {Text = --[[!AUTO_544]]"東方姑娘，請！", SoundPath = --[[!AUTO_545]]""},
	[8] = {Text = --[[!AUTO_546]]"請令狐兄能夠戒酒、戒色、戒鬥，不枉平大夫一片苦心！", SoundPath = --[[!AUTO_547]]""},
	[9] = {Text = --[[!AUTO_548]]"在下既然不配做閣下的朋友，自是從此不敢高攀的了。", SoundPath = --[[!AUTO_549]]""},
	[10] = {Text = --[[!AUTO_550]]"黃幫主請了，五霸崗上之事，在下不會向別人提起！", SoundPath = --[[!AUTO_551]]""},
	[11] = {Text = --[[!AUTO_552]]"天高雲闊、江湖路遠，鵰兄後會有期！", SoundPath = --[[!AUTO_553]]""},
	[12] = {Text = --[[!AUTO_554]]"您定是獨孤前輩，晚輩給你行禮了，可是孤劍村卻……", SoundPath = --[[!AUTO_555]]""},
	[13] = {Text = --[[!AUTO_556]]"人家剛剛失戀了，心口好疼，心裡好苦，求安慰……", SoundPath = --[[!AUTO_557]]""},
	[14] = {Text = --[[!AUTO_558]]"兩隻小蜜蜂呀，飛到花叢中呀……", SoundPath = --[[!AUTO_559]]""},
	[15] = {Text = --[[!AUTO_560]]"這個……那個……請問帥哥年方幾許……已否婚配……", SoundPath = --[[!AUTO_561]]""},
	[16] = {Text = --[[!AUTO_562]]"給你……愛的麼麼噠~", SoundPath = --[[!AUTO_563]]""},
	[17] = {Text = --[[!AUTO_564]]"這個……那個……請問美女年方幾許……已否婚配……", SoundPath = --[[!AUTO_565]]""},
	[18] = {Text = --[[!AUTO_566]]"失禮了，又到了每天的健身時間了，998，999……", SoundPath = --[[!AUTO_567]]""},
	[19] = {Text = --[[!AUTO_568]]"大象~大象~你的鼻子怎麼這麼長！", SoundPath = --[[!AUTO_569]]""},
	[20] = {Text = --[[!AUTO_570]]"木哈哈哈，在下今天的初吻，就請拿去吧！", SoundPath = --[[!AUTO_571]]""},
	[21] = {Text = --[[!AUTO_572]]"請前輩收我為徒，渡過此生死劫！", SoundPath = --[[!AUTO_573]]""},
	[22] = {Text = --[[!AUTO_574]]"‘緣’之一事，不能強求。古人道得好：‘各有因緣莫羨人’。令狐兄，你今日雖然失意，他日未始不能另有佳偶。", SoundPath = --[[!AUTO_575]]""},
	[23] = {Text = --[[!AUTO_576]]"多謝令狐兄救命之恩！", SoundPath = --[[!AUTO_577]]""},
	[24] = {Text = --[[!AUTO_578]]"嶽肅老賊，你和蔡子峰遺禍後人，害得華山派同門相殘，真是千古罪人！", SoundPath = --[[!AUTO_579]]""},
}
--NPC自动表情回复结束

-------------------------------
-- 放技能时的表情配置
-------------------------------
Emote.EmoteSkillInfo =
{
	[5427] = --技能id
	{
		[0] = -- 技能发失败
		{
			[0] = -- 男
			{
				needTargetName 	= true,			--消息中是否需要对象名称

				chatMsg 		= --[[!AUTO_312]]"對%s揮揮手，加錢失敗，今朝一醉方休如何？",
				chatMsgNoTarget	= --[[!AUTO_313]]"從人群中冒出來，揮了揮手，向大家打了個招呼：加錢失敗",	--无目标时，上面的消息用这个替代

				popMsg			= --[[!AUTO_314]]"%s，加錢失敗",		--头顶泡泡
				popMsgNoTarget	= --[[!AUTO_315]]"加錢失敗",

				chatMsgResponse = --[[!AUTO_316]]"加錢失敗。",

				gfx 			= Emote.GFX[1],
			},
			[1] = -- 女
			{
				needTargetName 	= true,			--消息中是否需要对象名称

				chatMsg 		= --[[!AUTO_317]]"對%s揮揮手，加錢失敗，今朝一醉方休如何？",
				chatMsgNoTarget	= --[[!AUTO_318]]"從人群中冒出來，揮了揮手，向大家打了個招呼：加錢失敗",	--无目标时，上面的消息用这个替代

				popMsg			= --[[!AUTO_319]]"%s，加錢失敗",		--头顶泡泡
				popMsgNoTarget	= --[[!AUTO_320]]"加錢失敗",

				chatMsgResponse = --[[!AUTO_321]]"加錢失敗。",

				gfx 			= Emote.GFX[2],
			},
			[Emote.EmoteGenderNPC] = -- NPC
			{
				Msg				= --[[!AUTO_322]]"加錢失敗。",
			},
			[Emote.EmoteGenderMonster] = -- Monster
			{
				Msg				= --[[!AUTO_323]]"加錢失敗！",
			},
			[Emote.EmoteGenderPet] = -- Pet反应动作喊话id，第一个为主人，第二个为其他玩家
			{
				MsgID			= {500, 519},
			},
		},

		[1] = -- 技能发成功
		{
			[0] = -- 男
			{
				needTargetName 	= true,			--消息中是否需要对象名称

				chatMsg 		= --[[!AUTO_324]]"對%s揮揮手，重逢已非昔日，今朝一醉方休如何？",
				chatMsgNoTarget	= --[[!AUTO_325]]"興高采烈地從人群中冒出來，揮了揮手，向大家打了個招呼。",	--无目标时，上面的消息用这个替代

				popMsg			= --[[!AUTO_326]]"%s，近日可好?",		--头顶泡泡
				popMsgNoTarget	= --[[!AUTO_327]]"近日可好?",

				chatMsgResponse = --[[!AUTO_328]]"還行吧。",

				gfx 			= Emote.GFX[1],
			},
			[1] = -- 女
			{
				needTargetName 	= true,			--消息中是否需要对象名称

				chatMsg 		= --[[!AUTO_329]]"對%s揮揮手，自上回一別數日，今朝相見可否把酒一敘。",
				chatMsgNoTarget	= --[[!AUTO_330]]"興高采烈地從人群中冒出來，揮了揮手，向大家打了個招呼。",	--无目标时，上面的消息用这个替代

				popMsg			= --[[!AUTO_331]]"%s，近日可好?",		--头顶泡泡
				popMsgNoTarget	= --[[!AUTO_332]]"近日可好?",

				chatMsgResponse = --[[!AUTO_333]]"還行吧。",

				gfx 			= Emote.GFX[2],
			},
			[Emote.EmoteGenderNPC] = -- NPC
			{
				Msg				= --[[!AUTO_334]]"甚好甚好。",
			},
			[Emote.EmoteGenderMonster] = -- Monster
			{
				Msg				= --[[!AUTO_335]]"看什麼看？小心我打你！",
			},
			[Emote.EmoteGenderPet] = -- Pet反应动作喊话id，第一个为主人，第二个为其他玩家
			{
				MsgID			= {500, 519},
			},
		},
	},

	[5808] = --喷火
	{
		[0] = -- 技能发失败
		{
			[0] = -- 男
			{
				needTargetName 	= true,			--消息中是否需要对象名称
				chatMsg 		= --[[!AUTO_336]]"",
				chatMsgNoTarget	= --[[!AUTO_337]]"",	--无目标时，上面的消息用这个替代
				popMsg			= --[[!AUTO_338]]"呸呸，是哪家死孩子在我火油中撒了尿。",		--头顶泡泡
				popMsgNoTarget	= --[[!AUTO_339]]"呸呸，是哪家死孩子在我火油中撒了尿。",
				chatMsgResponse = --[[!AUTO_340]]"好像是剛才路過的醉漢……",
				gfx 			= Emote.GFX[1],
			},
			[1] = -- 女
			{
				needTargetName 	= true,			--消息中是否需要对象名称
				chatMsg 		= --[[!AUTO_341]]"",
				chatMsgNoTarget	= --[[!AUTO_342]]"",	--无目标时，上面的消息用这个替代
				popMsg			= --[[!AUTO_343]]"呸呸，是哪家死孩子在我火油中撒了尿。",		--头顶泡泡
				popMsgNoTarget	= --[[!AUTO_344]]"呸呸，是哪家死孩子在我火油中撒了尿。",
				chatMsgResponse = --[[!AUTO_345]]"好像是剛才路過的醉漢……",
				gfx 			= Emote.GFX[2],
			},
			[Emote.EmoteGenderNPC] = -- NPC
			{
				Msg				= --[[!AUTO_346]]"好像是剛才路過的醉漢……",
			},
			[Emote.EmoteGenderMonster] = -- Monster
			{
				Msg				= --[[!AUTO_347]]"",
			},
			[Emote.EmoteGenderPet] = -- Pet反应动作喊话id，第一个为主人，第二个为其他玩家
			{
				MsgID			= {500, 519},
			},
		},
		[1] = -- 技能发成功
		{
			[0] = -- 男
			{
				needTargetName 	= true,			--消息中是否需要对象名称
				chatMsg 		= --[[!AUTO_348]]"",
				chatMsgNoTarget	= --[[!AUTO_349]]"",	--无目标时，上面的消息用这个替代
				popMsg			= --[[!AUTO_350]]"各位看官待會兒若我沒被燒死，請隨便打賞個吃飯錢兒！",		--头顶泡泡
				popMsgNoTarget	= --[[!AUTO_351]]"各位看官待會兒若我沒被燒死，請隨便打賞個吃飯錢兒！",
				chatMsgResponse = --[[!AUTO_352]]"原來看點不是全身起火啊？",
				gfx 			= Emote.GFX[1],
			},
			[1] = -- 女
			{
				needTargetName 	= true,			--消息中是否需要对象名称
				chatMsg 		= --[[!AUTO_353]]"",
				chatMsgNoTarget	= --[[!AUTO_354]]"",	--无目标时，上面的消息用这个替代
				popMsg			= --[[!AUTO_355]]"各位看官待會兒若我沒被燒死，請隨便打賞個吃飯錢兒！",		--头顶泡泡
				popMsgNoTarget	= --[[!AUTO_356]]"各位看官待會兒若我沒被燒死，請隨便打賞個吃飯錢兒！",
				chatMsgResponse = --[[!AUTO_357]]"原來看點不是全身起火啊？",
				gfx 			= Emote.GFX[2],
			},
			[Emote.EmoteGenderNPC] = -- NPC
			{
				Msg				= --[[!AUTO_358]]"原來看點不是全身起火啊？",
			},
			[Emote.EmoteGenderMonster] = -- Monster
			{
				Msg				= --[[!AUTO_359]]"",
			},
			[Emote.EmoteGenderPet] = -- Pet反应动作喊话id，第一个为主人，第二个为其他玩家
			{
				MsgID			= {500, 519},
			},
		},
	},

	[5807] = --顶大缸
	{
		[0] = -- 技能发失败
		{
			[0] = -- 男
			{
				needTargetName 	= true,			--消息中是否需要对象名称
				chatMsg 		= --[[!AUTO_360]]"",
				chatMsgNoTarget	= --[[!AUTO_361]]"",	--无目标时，上面的消息用这个替代
				popMsg			= --[[!AUTO_362]]"這大缸不是我準備的道具啊！！",		--头顶泡泡
				popMsgNoTarget	= --[[!AUTO_363]]"這大缸不是我準備的道具啊！！",
				chatMsgResponse = --[[!AUTO_364]]"快放下！！！那是我家的泡菜缸！！",
				gfx 			= Emote.GFX[1],
			},
			[1] = -- 女
			{
				needTargetName 	= true,			--消息中是否需要对象名称
				chatMsg 		= --[[!AUTO_365]]"",
				chatMsgNoTarget	= --[[!AUTO_366]]"",	--无目标时，上面的消息用这个替代
				popMsg			= --[[!AUTO_367]]"這大缸不是我準備的道具啊！！",		--头顶泡泡
				popMsgNoTarget	= --[[!AUTO_368]]"這大缸不是我準備的道具啊！！",
				chatMsgResponse = --[[!AUTO_369]]"快放下！！！那是我家的泡菜缸！！",
				gfx 			= Emote.GFX[2],
			},
			[Emote.EmoteGenderNPC] = -- NPC
			{
				Msg				= --[[!AUTO_370]]"快放下！！！那是我家的泡菜缸！！",
			},
			[Emote.EmoteGenderMonster] = -- Monster
			{
				Msg				= --[[!AUTO_371]]"",
			},
			[Emote.EmoteGenderPet] = -- Pet反应动作喊话id，第一个为主人，第二个为其他玩家
			{
				MsgID			= {500, 519},
			},
		},
		[1] = -- 技能发成功
		{
			[0] = -- 男
			{
				needTargetName 	= true,			--消息中是否需要对象名称
				chatMsg 		= --[[!AUTO_372]]"",
				chatMsgNoTarget	= --[[!AUTO_373]]"",	--无目标时，上面的消息用这个替代
				popMsg			= --[[!AUTO_374]]"看我一邊兒頂大缸，一邊兒討打賞。",		--头顶泡泡
				popMsgNoTarget	= --[[!AUTO_375]]"看我一邊兒頂大缸，一邊兒討打賞。",
				chatMsgResponse = --[[!AUTO_376]]"可惜我身上也沒什麼錢開鍋啊……",
				gfx 			= Emote.GFX[1],
			},
			[1] = -- 女
			{
				needTargetName 	= true,			--消息中是否需要对象名称
				chatMsg 		= --[[!AUTO_377]]"",
				chatMsgNoTarget	= --[[!AUTO_378]]"",	--无目标时，上面的消息用这个替代
				popMsg			= --[[!AUTO_379]]"看我一邊兒頂大缸，一邊兒討打賞。",		--头顶泡泡
				popMsgNoTarget	= --[[!AUTO_380]]"看我一邊兒頂大缸，一邊兒討打賞。",
				chatMsgResponse = --[[!AUTO_381]]"可惜我身上也沒什麼錢開鍋啊……",
				gfx 			= Emote.GFX[2],
			},
			[Emote.EmoteGenderNPC] = -- NPC
			{
				Msg				= --[[!AUTO_382]]"可惜我身上也沒什麼錢開鍋啊……",
			},
			[Emote.EmoteGenderMonster] = -- Monster
			{
				Msg				= --[[!AUTO_383]]"",
			},
			[Emote.EmoteGenderPet] = -- Pet反应动作喊话id，第一个为主人，第二个为其他玩家
			{
				MsgID			= {500, 519},
			},
		},
	},

	[5810] = --猜拳
	{
		[0] = -- 技能发失败
		{
			[0] = -- 男
			{
				needTargetName 	= true,			--消息中是否需要对象名称
				chatMsg 		= --[[!AUTO_384]]"",
				chatMsgNoTarget	= --[[!AUTO_385]]"",	--无目标时，上面的消息用这个替代
				popMsg			= --[[!AUTO_386]]"我手上四條A除非你是同花順。",		--头顶泡泡
				popMsgNoTarget	= --[[!AUTO_387]]"我手上四條A除非你是同花順。",
				chatMsgResponse = --[[!AUTO_388]]"你在說啥呢？",
				gfx 			= Emote.GFX[1],
			},
			[1] = -- 女
			{
				needTargetName 	= true,			--消息中是否需要对象名称
				chatMsg 		= --[[!AUTO_389]]"",
				chatMsgNoTarget	= --[[!AUTO_390]]"",	--无目标时，上面的消息用这个替代
				popMsg			= --[[!AUTO_391]]"我手上四條A除非你是同花順。",		--头顶泡泡
				popMsgNoTarget	= --[[!AUTO_392]]"我手上四條A除非你是同花順。",
				chatMsgResponse = --[[!AUTO_393]]"你在說啥呢？",
				gfx 			= Emote.GFX[2],
			},
			[Emote.EmoteGenderNPC] = -- NPC
			{
				Msg				= --[[!AUTO_394]]"你在說啥呢？",
			},
			[Emote.EmoteGenderMonster] = -- Monster
			{
				Msg				= --[[!AUTO_395]]"",
			},
			[Emote.EmoteGenderPet] = -- Pet反应动作喊话id，第一个为主人，第二个为其他玩家
			{
				MsgID			= {500, 519},
			},
		},
		[1] = -- 技能发成功
		{
			[0] = -- 男
			{
				needTargetName 	= true,			--消息中是否需要对象名称
				chatMsg 		= --[[!AUTO_396]]"",
				chatMsgNoTarget	= --[[!AUTO_397]]"",	--无目标时，上面的消息用这个替代
				popMsg			= --[[!AUTO_398]]"麻將！牌九！骰子！我統統不會，剪刀石頭布，一決勝負！",		--头顶泡泡
				popMsgNoTarget	= --[[!AUTO_399]]"麻將！牌九！骰子！我統統不會，剪刀石頭布，一決勝負！",
				chatMsgResponse = --[[!AUTO_400]]"既然如此，不如我直接給你銀子好了。",
				gfx 			= Emote.GFX[1],
			},
			[1] = -- 女
			{
				needTargetName 	= true,			--消息中是否需要对象名称
				chatMsg 		= --[[!AUTO_401]]"",
				chatMsgNoTarget	= --[[!AUTO_402]]"",	--无目标时，上面的消息用这个替代
				popMsg			= --[[!AUTO_403]]"麻將！牌九！骰子！我統統不會，剪刀石頭布，一決勝負！",		--头顶泡泡
				popMsgNoTarget	= --[[!AUTO_404]]"麻將！牌九！骰子！我統統不會，剪刀石頭布，一決勝負！",
				chatMsgResponse = --[[!AUTO_405]]"既然如此，不如我直接給你銀子好了。",
				gfx 			= Emote.GFX[2],
			},
			[Emote.EmoteGenderNPC] = -- NPC
			{
				Msg				= --[[!AUTO_406]]"既然如此，不如我直接給你銀子好了。",
			},
			[Emote.EmoteGenderMonster] = -- Monster
			{
				Msg				= --[[!AUTO_407]]"",
			},
			[Emote.EmoteGenderPet] = -- Pet反应动作喊话id，第一个为主人，第二个为其他玩家
			{
				MsgID			= {500, 519},
			},
		},
	},

	[5811] = --骰子
	{
		[0] = -- 技能发失败
		{
			[0] = -- 男
			{
				needTargetName 	= true,			--消息中是否需要对象名称
				chatMsg 		= --[[!AUTO_408]]"",
				chatMsgNoTarget	= --[[!AUTO_409]]"",	--无目标时，上面的消息用这个替代
				popMsg			= --[[!AUTO_410]]"沒見過吧，四顆骰子疊成一條線。",		--头顶泡泡
				popMsgNoTarget	= --[[!AUTO_411]]"沒見過吧，四顆骰子疊成一條線。",
				chatMsgResponse = --[[!AUTO_412]]"頂上那顆一點是吧，我十六點，給錢。",
				gfx 			= Emote.GFX[1],
			},
			[1] = -- 女
			{
				needTargetName 	= true,			--消息中是否需要对象名称
				chatMsg 		= --[[!AUTO_413]]"",
				chatMsgNoTarget	= --[[!AUTO_414]]"",	--无目标时，上面的消息用这个替代
				popMsg			= --[[!AUTO_415]]"沒見過吧，四顆骰子疊成一條線。",		--头顶泡泡
				popMsgNoTarget	= --[[!AUTO_416]]"沒見過吧，四顆骰子疊成一條線。",
				chatMsgResponse = --[[!AUTO_417]]"頂上那顆一點是吧，我十六點，給錢。",
				gfx 			= Emote.GFX[2],
			},
			[Emote.EmoteGenderNPC] = -- NPC
			{
				Msg				= --[[!AUTO_418]]"頂上那顆一點是吧，我十六點，給錢。",
			},
			[Emote.EmoteGenderMonster] = -- Monster
			{
				Msg				= --[[!AUTO_419]]"",
			},
			[Emote.EmoteGenderPet] = -- Pet反应动作喊话id，第一个为主人，第二个为其他玩家
			{
				MsgID			= {500, 519},
			},
		},
		[1] = -- 技能发成功
		{
			[0] = -- 男
			{
				needTargetName 	= true,			--消息中是否需要对象名称
				chatMsg 		= --[[!AUTO_420]]"",
				chatMsgNoTarget	= --[[!AUTO_421]]"",	--无目标时，上面的消息用这个替代
				popMsg			= --[[!AUTO_422]]"開！！豹子！！通殺！！",		--头顶泡泡
				popMsgNoTarget	= --[[!AUTO_423]]"開！！豹子！！通殺！！",
				chatMsgResponse = --[[!AUTO_424]]"哎呀！我煮飯忘了關火，再見！",
				gfx 			= Emote.GFX[1],
			},
			[1] = -- 女
			{
				needTargetName 	= true,			--消息中是否需要对象名称
				chatMsg 		= --[[!AUTO_425]]"",
				chatMsgNoTarget	= --[[!AUTO_426]]"",	--无目标时，上面的消息用这个替代
				popMsg			= --[[!AUTO_427]]"開！！豹子！！通殺！！",		--头顶泡泡
				popMsgNoTarget	= --[[!AUTO_428]]"開！！豹子！！通殺！！",
				chatMsgResponse = --[[!AUTO_429]]"哎呀！我煮飯忘了關火，再見！",
				gfx 			= Emote.GFX[2],
			},
			[Emote.EmoteGenderNPC] = -- NPC
			{
				Msg				= --[[!AUTO_430]]"哎呀！我煮飯忘了關火，再見！",
			},
			[Emote.EmoteGenderMonster] = -- Monster
			{
				Msg				= --[[!AUTO_431]]"",
			},
			[Emote.EmoteGenderPet] = -- Pet反应动作喊话id，第一个为主人，第二个为其他玩家
			{
				MsgID			= {500, 519},
			},
		},
	},

	[5813] = --把脉
	{
		[0] = -- 技能发失败
		{
			[0] = -- 男
			{
				needTargetName 	= true,			--消息中是否需要对象名称
				chatMsg 		= --[[!AUTO_432]]"",
				chatMsgNoTarget	= --[[!AUTO_433]]"",	--无目标时，上面的消息用这个替代
				popMsg			= --[[!AUTO_434]]"我一把脈就知道，你家耕牛年底就能生了，喜脈！好好安胎！",		--头顶泡泡
				popMsgNoTarget	= --[[!AUTO_435]]"我一把脈就知道，你家耕牛年底就能生了，喜脈！好好安胎！",
				chatMsgResponse = --[[!AUTO_436]]"……大夫，你把的是我的手……",
				gfx 			= Emote.GFX[1],
			},
			[1] = -- 女
			{
				needTargetName 	= true,			--消息中是否需要对象名称
				chatMsg 		= --[[!AUTO_437]]"",
				chatMsgNoTarget	= --[[!AUTO_438]]"",	--无目标时，上面的消息用这个替代
				popMsg			= --[[!AUTO_439]]"我一把脈就知道，你家耕牛年底就能生了，喜脈！好好安胎！",		--头顶泡泡
				popMsgNoTarget	= --[[!AUTO_440]]"我一把脈就知道，你家耕牛年底就能生了，喜脈！好好安胎！",
				chatMsgResponse = --[[!AUTO_441]]"……大夫，你把的是我的手……",
				gfx 			= Emote.GFX[2],
			},
			[Emote.EmoteGenderNPC] = -- NPC
			{
				Msg				= --[[!AUTO_442]]"……大夫，你把的是我的手……",
			},
			[Emote.EmoteGenderMonster] = -- Monster
			{
				Msg				= --[[!AUTO_443]]"",
			},
			[Emote.EmoteGenderPet] = -- Pet反应动作喊话id，第一个为主人，第二个为其他玩家
			{
				MsgID			= {500, 519},
			},
		},
		[1] = -- 技能发成功
		{
			[0] = -- 男
			{
				needTargetName 	= true,			--消息中是否需要对象名称
				chatMsg 		= --[[!AUTO_444]]"",
				chatMsgNoTarget	= --[[!AUTO_445]]"",	--无目标时，上面的消息用这个替代
				popMsg			= --[[!AUTO_446]]"身體並無大礙，就是有些肝火旺。",		--头顶泡泡
				popMsgNoTarget	= --[[!AUTO_447]]"身體並無大礙，就是有些肝火旺。",
				chatMsgResponse = --[[!AUTO_448]]"不是肝火，是欲火！小壞蛋，讓我一口吞了你吧！",
				gfx 			= Emote.GFX[1],
			},
			[1] = -- 女
			{
				needTargetName 	= true,			--消息中是否需要对象名称
				chatMsg 		= --[[!AUTO_449]]"",
				chatMsgNoTarget	= --[[!AUTO_450]]"",	--无目标时，上面的消息用这个替代
				popMsg			= --[[!AUTO_451]]"身體並無大礙，就是有些肝火旺。",		--头顶泡泡
				popMsgNoTarget	= --[[!AUTO_452]]"身體並無大礙，就是有些肝火旺。",
				chatMsgResponse = --[[!AUTO_453]]"不是肝火，是欲火！小壞蛋，讓我一口吞了你吧！",
				gfx 			= Emote.GFX[2],
			},
			[Emote.EmoteGenderNPC] = -- NPC
			{
				Msg				= --[[!AUTO_454]]"不是肝火，是欲火！小壞蛋，讓我一口吞了你吧！",
			},
			[Emote.EmoteGenderMonster] = -- Monster
			{
				Msg				= --[[!AUTO_455]]"",
			},
			[Emote.EmoteGenderPet] = -- Pet反应动作喊话id，第一个为主人，第二个为其他玩家
			{
				MsgID			= {500, 519},
			},
		},
	},

	[5814] = --喂药
	{
		[0] = -- 技能发失败
		{
			[0] = -- 男
			{
				needTargetName 	= true,			--消息中是否需要对象名称
				chatMsg 		= --[[!AUTO_456]]"",
				chatMsgNoTarget	= --[[!AUTO_457]]"",	--无目标时，上面的消息用这个替代
				popMsg			= --[[!AUTO_458]]"這千年老參丹，可遇不可求，今天你遇到我，可是……",		--头顶泡泡
				popMsgNoTarget	= --[[!AUTO_459]]"這千年老參丹，可遇不可求，今天你遇到我，可是……",
				chatMsgResponse = --[[!AUTO_460]]"昨天那些蘿蔔和麵粉都是我賣給你的。",
				gfx 			= Emote.GFX[1],
			},
			[1] = -- 女
			{
				needTargetName 	= true,			--消息中是否需要对象名称
				chatMsg 		= --[[!AUTO_461]]"",
				chatMsgNoTarget	= --[[!AUTO_462]]"",	--无目标时，上面的消息用这个替代
				popMsg			= --[[!AUTO_463]]"這千年老參丹，可遇不可求，今天你遇到我，可是……",		--头顶泡泡
				popMsgNoTarget	= --[[!AUTO_464]]"這千年老參丹，可遇不可求，今天你遇到我，可是……",
				chatMsgResponse = --[[!AUTO_465]]"昨天那些蘿蔔和麵粉都是我賣給你的。",
				gfx 			= Emote.GFX[2],
			},
			[Emote.EmoteGenderNPC] = -- NPC
			{
				Msg				= --[[!AUTO_466]]"昨天那些蘿蔔和麵粉都是我賣給你的。",
			},
			[Emote.EmoteGenderMonster] = -- Monster
			{
				Msg				= --[[!AUTO_467]]"",
			},
			[Emote.EmoteGenderPet] = -- Pet反应动作喊话id，第一个为主人，第二个为其他玩家
			{
				MsgID			= {500, 519},
			},
		},
		[1] = -- 技能发成功
		{
			[0] = -- 男
			{
				needTargetName 	= true,			--消息中是否需要对象名称
				chatMsg 		= --[[!AUTO_468]]"",
				chatMsgNoTarget	= --[[!AUTO_469]]"",	--无目标时，上面的消息用这个替代
				popMsg			= --[[!AUTO_470]]"這服藥回頭你三碗水熬成一碗，下一位。",		--头顶泡泡
				popMsgNoTarget	= --[[!AUTO_471]]"這服藥回頭你三碗水熬成一碗，下一位。",
				chatMsgResponse = --[[!AUTO_472]]"你還沒說我得了什麼病。",
				gfx 			= Emote.GFX[1],
			},
			[1] = -- 女
			{
				needTargetName 	= true,			--消息中是否需要对象名称
				chatMsg 		= --[[!AUTO_473]]"",
				chatMsgNoTarget	= --[[!AUTO_474]]"",	--无目标时，上面的消息用这个替代
				popMsg			= --[[!AUTO_475]]"這服藥回頭你三碗水熬成一碗，下一位。",		--头顶泡泡
				popMsgNoTarget	= --[[!AUTO_476]]"這服藥回頭你三碗水熬成一碗，下一位。",
				chatMsgResponse = --[[!AUTO_477]]"你還沒說我得了什麼病。",
				gfx 			= Emote.GFX[2],
			},
			[Emote.EmoteGenderNPC] = -- NPC
			{
				Msg				= --[[!AUTO_478]]"你還沒說我得了什麼病。",
			},
			[Emote.EmoteGenderMonster] = -- Monster
			{
				Msg				= --[[!AUTO_479]]"",
			},
			[Emote.EmoteGenderPet] = -- Pet反应动作喊话id，第一个为主人，第二个为其他玩家
			{
				MsgID			= {500, 519},
			},
		},
	},

	[5802] = --骰子
	{
		[0] = -- 技能发失败
		{
			[0] = -- 男
			{
				needTargetName 	= true,			--消息中是否需要对象名称
				chatMsg 		= --[[!AUTO_480]]"",
				chatMsgNoTarget	= --[[!AUTO_481]]"",	--无目标时，上面的消息用这个替代
				popMsg			= --[[!AUTO_482]]"哎呀，我也不知道這顆骰子是那裡來的，還真是奇怪呢~",		--头顶泡泡
				popMsgNoTarget	= --[[!AUTO_483]]"哎呀，我也不知道這顆骰子是那裡來的，還真是奇怪呢~",
				chatMsgResponse = --[[!AUTO_484]]"小癟三！敢出老千！",
				gfx 			= Emote.GFX[1],
			},
			[1] = -- 女
			{
				needTargetName 	= true,			--消息中是否需要对象名称
				chatMsg 		= --[[!AUTO_485]]"",
				chatMsgNoTarget	= --[[!AUTO_486]]"",	--无目标时，上面的消息用这个替代
				popMsg			= --[[!AUTO_487]]"哎呀，我也不知道這顆骰子是那裡來的，還真是奇怪呢~",		--头顶泡泡
				popMsgNoTarget	= --[[!AUTO_488]]"哎呀，我也不知道這顆骰子是那裡來的，還真是奇怪呢~",
				chatMsgResponse = --[[!AUTO_489]]"小癟三！敢出老千！",
				gfx 			= Emote.GFX[2],
			},
			[Emote.EmoteGenderNPC] = -- NPC
			{
				Msg				= --[[!AUTO_490]]"小癟三！敢出老千！",
			},
			[Emote.EmoteGenderMonster] = -- Monster
			{
				Msg				= --[[!AUTO_491]]"",
			},
			[Emote.EmoteGenderPet] = -- Pet反应动作喊话id，第一个为主人，第二个为其他玩家
			{
				MsgID			= {500, 519},
			},
		},
		[1] = -- 技能发成功
		{
			[0] = -- 男
			{
				needTargetName 	= true,			--消息中是否需要对象名称
				chatMsg 		= --[[!AUTO_492]]"",
				chatMsgNoTarget	= --[[!AUTO_493]]"",	--无目标时，上面的消息用这个替代
				popMsg			= --[[!AUTO_494]]"你知道輸了的人會有什麼後果嗎？",		--头顶泡泡
				popMsgNoTarget	= --[[!AUTO_495]]"你知道輸了的人會有什麼後果嗎？",
				chatMsgResponse = --[[!AUTO_496]]"不就是劫財，難不成還要我給你生兒育女。",
				gfx 			= Emote.GFX[1],
			},
			[1] = -- 女
			{
				needTargetName 	= true,			--消息中是否需要对象名称
				chatMsg 		= --[[!AUTO_497]]"",
				chatMsgNoTarget	= --[[!AUTO_498]]"",	--无目标时，上面的消息用这个替代
				popMsg			= --[[!AUTO_499]]"你知道輸了的人會有什麼後果嗎？",		--头顶泡泡
				popMsgNoTarget	= --[[!AUTO_500]]"你知道輸了的人會有什麼後果嗎？",
				chatMsgResponse = --[[!AUTO_501]]"不就是劫財，難不成還要我給你生兒育女。",
				gfx 			= Emote.GFX[2],
			},
			[Emote.EmoteGenderNPC] = -- NPC
			{
				Msg				= --[[!AUTO_502]]"不就是劫財，難不成還要我給你生兒育女。",
			},
			[Emote.EmoteGenderMonster] = -- Monster
			{
				Msg				= --[[!AUTO_503]]"",
			},
			[Emote.EmoteGenderPet] = -- Pet反应动作喊话id，第一个为主人，第二个为其他玩家
			{
				MsgID			= {500, 519},
			},
		},
	},


[10231] = --拽文
	{
		[0] = -- 技能发失败
		{
			[0] = -- 男
			{
				needTargetName 	= true,			--消息中是否需要对象名称
				chatMsg 		= "",
				chatMsgNoTarget	= "",	--无目标时，上面的消息用这个替代
				popMsg			= "看看，這本工匠書上的口訣念起來很有韻味",		--头顶泡泡
				popMsgNoTarget	= "看看，這本工匠書上的口訣念起來很有韻味",
				chatMsgResponse = "快住嘴吧，此文簡直狗屁不通！",
				gfx 			= Emote.GFX[1],
			},
			[1] = -- 女
			{
				needTargetName 	= true,			--消息中是否需要对象名称
				chatMsg 		= "",
				chatMsgNoTarget	= "",	--无目标时，上面的消息用这个替代
				popMsg			= "看看，這本工匠書上的口訣念起來很有韻味",		--头顶泡泡
				popMsgNoTarget	= "看看，這本工匠書上的口訣念起來很有韻味",
				chatMsgResponse = "快住嘴吧，此文簡直狗屁不通！",
				gfx 			= Emote.GFX[2],
			},
			[Emote.EmoteGenderNPC] = -- NPC
			{
				Msg				= "快住嘴吧，此文簡直狗屁不通！",
			},
			[Emote.EmoteGenderMonster] = -- Monster
			{
				Msg				= "",
			},
			[Emote.EmoteGenderPet] = -- Pet反应动作喊话id，第一个为主人，第二个为其他玩家
			{
				MsgID			= {500, 519},
			},
		},
		[1] = -- 技能发成功
		{
			[0] = -- 男
			{
				needTargetName 	= true,			--消息中是否需要对象名称
				chatMsg 		= "",
				chatMsgNoTarget	= "",	--无目标时，上面的消息用这个替代
				popMsg			= "聽過念營造之多艱，獨滄然而淚下麼？",		--头顶泡泡
				popMsgNoTarget	= "聽過念營造之多艱，獨滄然而淚下麼？",
				chatMsgResponse = "好詩，生吞活剝聖人之作果然不同凡響！",
				gfx 			= Emote.GFX[1],
			},
			[1] = -- 女
			{
				needTargetName 	= true,			--消息中是否需要对象名称
				chatMsg 		= "",
				chatMsgNoTarget	= "",	--无目标时，上面的消息用这个替代
				popMsg			= "聽過念營造之多艱，獨滄然而淚下麼？",		--头顶泡泡
				popMsgNoTarget	= "聽過念營造之多艱，獨滄然而淚下麼？",
				chatMsgResponse = "好詩，生吞活剝聖人之作果然不同凡響！",
				gfx 			= Emote.GFX[2],
			},
			[Emote.EmoteGenderNPC] = -- NPC
			{
				Msg				= "好詩，生吞活剝聖人之作果然不同凡響！",
			},
			[Emote.EmoteGenderMonster] = -- Monster
			{
				Msg				= "",
			},
			[Emote.EmoteGenderPet] = -- Pet反应动作喊话id，第一个为主人，第二个为其他玩家
			{
				MsgID			= {500, 519},
			},
		},
	},

[10232] = --算数
	{
		[0] = -- 技能发失败
		{
			[0] = -- 男
			{
				needTargetName 	= true,			--消息中是否需要对象名称
				chatMsg 		= "",
				chatMsgNoTarget	= "",	--无目标时，上面的消息用这个替代
				popMsg			= "為人不通數理，豈不與禽獸無異？",		--头顶泡泡
				popMsgNoTarget	= "為人不通數理，豈不與禽獸無異？",
				chatMsgResponse = "混帳，居然張口就罵人禽獸！",
				gfx 			= Emote.GFX[1],
			},
			[1] = -- 女
			{
				needTargetName 	= true,			--消息中是否需要对象名称
				chatMsg 		= "",
				chatMsgNoTarget	= "",	--无目标时，上面的消息用这个替代
				popMsg			= "為人不通數理，豈不與禽獸無異？",		--头顶泡泡
				popMsgNoTarget	= "為人不通數理，豈不與禽獸無異？",
				chatMsgResponse = "混帳，居然張口就罵人禽獸！",
				gfx 			= Emote.GFX[2],
			},
			[Emote.EmoteGenderNPC] = -- NPC
			{
				Msg				= "混帳，居然張口就罵人禽獸！",
			},
			[Emote.EmoteGenderMonster] = -- Monster
			{
				Msg				= "",
			},
			[Emote.EmoteGenderPet] = -- Pet反应动作喊话id，第一个为主人，第二个为其他玩家
			{
				MsgID			= {500, 519},
			},
		},
		[1] = -- 技能发成功
		{
			[0] = -- 男
			{
				needTargetName 	= true,			--消息中是否需要对象名称
				chatMsg 		= "",
				chatMsgNoTarget	= "",	--无目标时，上面的消息用这个替代
				popMsg			= "載九履一，左三右七，二四為肩，六八為足......",		--头顶泡泡
				popMsgNoTarget	= "載九履一，左三右七，二四為肩，六八為足......",
				chatMsgResponse = "學會了這九宮之秘，就可以佈設奇門遁甲了吧？",
				gfx 			= Emote.GFX[1],
			},
			[1] = -- 女
			{
				needTargetName 	= true,			--消息中是否需要对象名称
				chatMsg 		= "",
				chatMsgNoTarget	= "",	--无目标时，上面的消息用这个替代
				popMsg			= "載九履一，左三右七，二四為肩，六八為足......",		--头顶泡泡
				popMsgNoTarget	= "載九履一，左三右七，二四為肩，六八為足......",
				chatMsgResponse = "學會了這九宮之秘，就可以佈設奇門遁甲了吧？",
				gfx 			= Emote.GFX[2],
			},
			[Emote.EmoteGenderNPC] = -- NPC
			{
				Msg				= "學會了這九宮之秘，就可以佈設奇門遁甲了吧？",
			},
			[Emote.EmoteGenderMonster] = -- Monster
			{
				Msg				= "",
			},
			[Emote.EmoteGenderPet] = -- Pet反应动作喊话id，第一个为主人，第二个为其他玩家
			{
				MsgID			= {500, 519},
			},
		},
	},

[10233] = --卖弄
	{
		[0] = -- 技能发失败
		{
			[0] = -- 男
			{
				needTargetName 	= true,			--消息中是否需要对象名称
				chatMsg 		= --[[!AUTO_480]]"",
				chatMsgNoTarget	= --[[!AUTO_481]]"",	--无目标时，上面的消息用这个替代
				popMsg			= --[[!AUTO_482]]"看我這一身肌肉，開眼了吧！",		--头顶泡泡
				popMsgNoTarget	= --[[!AUTO_483]]"看我這一身肌肉，開眼了吧！",
				chatMsgResponse = --[[!AUTO_484]]"不就是一身傻疙瘩麼？",
				gfx 			= Emote.GFX[1],
			},
			[1] = -- 女
			{
				needTargetName 	= true,			--消息中是否需要对象名称
				chatMsg 		= --[[!AUTO_485]]"",
				chatMsgNoTarget	= --[[!AUTO_486]]"",	--无目标时，上面的消息用这个替代
				popMsg			= --[[!AUTO_487]]"看我這一身肌肉，開眼了吧！",		--头顶泡泡
				popMsgNoTarget	= --[[!AUTO_488]]"看我這一身肌肉，開眼了吧！",
				chatMsgResponse = --[[!AUTO_489]]"不就是一身傻疙瘩麼？",
				gfx 			= Emote.GFX[2],
			},
			[Emote.EmoteGenderNPC] = -- NPC
			{
				Msg				= --[[!AUTO_490]]"不就是一身傻疙瘩麼？",
			},
			[Emote.EmoteGenderMonster] = -- Monster
			{
				Msg				= --[[!AUTO_491]]"",
			},
			[Emote.EmoteGenderPet] = -- Pet反应动作喊话id，第一个为主人，第二个为其他玩家
			{
				MsgID			= {500, 519},
			},
		},
		[1] = -- 技能发成功
		{
			[0] = -- 男
			{
				needTargetName 	= true,			--消息中是否需要对象名称
				chatMsg 		= --[[!AUTO_492]]"",
				chatMsgNoTarget	= --[[!AUTO_493]]"",	--无目标时，上面的消息用这个替代
				popMsg			= --[[!AUTO_494]]"整日打鐵，自然就練出了這一身肌肉！",		--头顶泡泡
				popMsgNoTarget	= --[[!AUTO_495]]"整日打鐵，自然就練出了這一身肌肉！",
				chatMsgResponse = --[[!AUTO_496]]"果然精壯，求傳授練體技巧！",
				gfx 			= Emote.GFX[1],
			},
			[1] = -- 女
			{
				needTargetName 	= true,			--消息中是否需要对象名称
				chatMsg 		= --[[!AUTO_497]]"",
				chatMsgNoTarget	= --[[!AUTO_498]]"",	--无目标时，上面的消息用这个替代
				popMsg			= --[[!AUTO_499]]"整日打鐵，自然就練出了這一身肌肉！",		--头顶泡泡
				popMsgNoTarget	= --[[!AUTO_500]]"整日打鐵，自然就練出了這一身肌肉！",
				chatMsgResponse = --[[!AUTO_501]]"果然精壯，求傳授練體技巧！",
				gfx 			= Emote.GFX[2],
			},
			[Emote.EmoteGenderNPC] = -- NPC
			{
				Msg				= --[[!AUTO_502]]"果然精壯，求傳授練體技巧！",
			},
			[Emote.EmoteGenderMonster] = -- Monster
			{
				Msg				= --[[!AUTO_503]]"",
			},
			[Emote.EmoteGenderPet] = -- Pet反应动作喊话id，第一个为主人，第二个为其他玩家
			{
				MsgID			= {500, 519},
			},
		},
	},

[10234] = --修理
	{
		[0] = -- 技能发失败
		{
			[0] = -- 男
			{
				needTargetName 	= true,			--消息中是否需要对象名称
				chatMsg 		= --[[!AUTO_480]]"",
				chatMsgNoTarget	= --[[!AUTO_481]]"",	--无目标时，上面的消息用这个替代
				popMsg			= --[[!AUTO_482]]"這兵刃損傷嚴重，我來修修吧，只收成本價。",		--头顶泡泡
				popMsgNoTarget	= --[[!AUTO_483]]"這兵刃損傷嚴重，我來修修吧，只收成本價。",
				chatMsgResponse = --[[!AUTO_484]]"怎麼修完短了兩寸，你這是修兵刃還是吞兵刃？",
				gfx 			= Emote.GFX[1],
			},
			[1] = -- 女
			{
				needTargetName 	= true,			--消息中是否需要对象名称
				chatMsg 		= --[[!AUTO_485]]"",
				chatMsgNoTarget	= --[[!AUTO_486]]"",	--无目标时，上面的消息用这个替代
				popMsg			= --[[!AUTO_487]]"這兵刃損傷嚴重，我來修修吧，只收成本價。",		--头顶泡泡
				popMsgNoTarget	= --[[!AUTO_488]]"這兵刃損傷嚴重，我來修修吧，只收成本價。",
				chatMsgResponse = --[[!AUTO_489]]"怎麼修完短了兩寸，你這是修兵刃還是吞兵刃？",
				gfx 			= Emote.GFX[2],
			},
			[Emote.EmoteGenderNPC] = -- NPC
			{
				Msg				= --[[!AUTO_490]]"怎麼修完短了兩寸，你這是修兵刃還是吞兵刃？",
			},
			[Emote.EmoteGenderMonster] = -- Monster
			{
				Msg				= --[[!AUTO_491]]"",
			},
			[Emote.EmoteGenderPet] = -- Pet反应动作喊话id，第一个为主人，第二个为其他玩家
			{
				MsgID			= {500, 519},
			},
		},
		[1] = -- 技能发成功
		{
			[0] = -- 男
			{
				needTargetName 	= true,			--消息中是否需要对象名称
				chatMsg 		= --[[!AUTO_492]]"",
				chatMsgNoTarget	= --[[!AUTO_493]]"",	--无目标时，上面的消息用这个替代
				popMsg			= --[[!AUTO_494]]"翻修甲刃咯~保證光潔如新！",		--头顶泡泡
				popMsgNoTarget	= --[[!AUTO_495]]"翻修甲刃咯~保證光潔如新！",
				chatMsgResponse = --[[!AUTO_496]]"好手藝，護甲修得都能當鏡子照了。",
				gfx 			= Emote.GFX[1],
			},
			[1] = -- 女
			{
				needTargetName 	= true,			--消息中是否需要对象名称
				chatMsg 		= --[[!AUTO_497]]"",
				chatMsgNoTarget	= --[[!AUTO_498]]"",	--无目标时，上面的消息用这个替代
				popMsg			= --[[!AUTO_499]]"翻修甲刃咯~保證光潔如新！",		--头顶泡泡
				popMsgNoTarget	= --[[!AUTO_500]]"翻修甲刃咯~保證光潔如新！",
				chatMsgResponse = --[[!AUTO_501]]"好手藝，護甲修得都能當鏡子照了。",
				gfx 			= Emote.GFX[2],
			},
			[Emote.EmoteGenderNPC] = -- NPC
			{
				Msg				= --[[!AUTO_502]]"好手藝，護甲修得都能當鏡子照了。",
			},
			[Emote.EmoteGenderMonster] = -- Monster
			{
				Msg				= --[[!AUTO_503]]"",
			},
			[Emote.EmoteGenderPet] = -- Pet反应动作喊话id，第一个为主人，第二个为其他玩家
			{
				MsgID			= {500, 519},
			},
		},
	},

[10235] = --推销
	{
		[0] = -- 技能发失败
		{
			[0] = -- 男
			{
				needTargetName 	= true,			--消息中是否需要对象名称
				chatMsg 		= --[[!AUTO_480]]"",
				chatMsgNoTarget	= --[[!AUTO_481]]"",	--无目标时，上面的消息用这个替代
				popMsg			= --[[!AUTO_482]]"歇業清貨，過這個村沒這個店咯！",		--头顶泡泡
				popMsgNoTarget	= --[[!AUTO_483]]"歇業清貨，過這個村沒這個店咯！",
				chatMsgResponse = --[[!AUTO_484]]"你喊歇業都喊大半年了，怎麼還在賣？",
				gfx 			= Emote.GFX[1],
			},
			[1] = -- 女
			{
				needTargetName 	= true,			--消息中是否需要对象名称
				chatMsg 		= --[[!AUTO_485]]"",
				chatMsgNoTarget	= --[[!AUTO_486]]"",	--无目标时，上面的消息用这个替代
				popMsg			= --[[!AUTO_487]]"歇業清貨，過這個村沒這個店咯！",		--头顶泡泡
				popMsgNoTarget	= --[[!AUTO_488]]"歇業清貨，過這個村沒這個店咯！",
				chatMsgResponse = --[[!AUTO_489]]"你喊歇業都喊大半年了，怎麼還在賣？",
				gfx 			= Emote.GFX[2],
			},
			[Emote.EmoteGenderNPC] = -- NPC
			{
				Msg				= --[[!AUTO_490]]"你喊歇業都喊大半年了，怎麼還在賣？",
			},
			[Emote.EmoteGenderMonster] = -- Monster
			{
				Msg				= --[[!AUTO_491]]"",
			},
			[Emote.EmoteGenderPet] = -- Pet反应动作喊话id，第一个为主人，第二个为其他玩家
			{
				MsgID			= {500, 519},
			},
		},
		[1] = -- 技能发成功
		{
			[0] = -- 男
			{
				needTargetName 	= true,			--消息中是否需要对象名称
				chatMsg 		= --[[!AUTO_492]]"",
				chatMsgNoTarget	= --[[!AUTO_493]]"",	--无目标时，上面的消息用这个替代
				popMsg			= --[[!AUTO_494]]"價廉物美，多買有折上折~",		--头顶泡泡
				popMsgNoTarget	= --[[!AUTO_495]]"價廉物美，多買有折上折~",
				chatMsgResponse = --[[!AUTO_496]]"那麼划算？那我可得多買點兒。",
				gfx 			= Emote.GFX[1],
			},
			[1] = -- 女
			{
				needTargetName 	= true,			--消息中是否需要对象名称
				chatMsg 		= --[[!AUTO_497]]"",
				chatMsgNoTarget	= --[[!AUTO_498]]"",	--无目标时，上面的消息用这个替代
				popMsg			= --[[!AUTO_499]]"價廉物美，多買有折上折~",		--头顶泡泡
				popMsgNoTarget	= --[[!AUTO_500]]"價廉物美，多買有折上折~",
				chatMsgResponse = --[[!AUTO_501]]"那麼划算？那我可得多買點兒。",
				gfx 			= Emote.GFX[2],
			},
			[Emote.EmoteGenderNPC] = -- NPC
			{
				Msg				= --[[!AUTO_502]]"那麼划算？那我可得多買點兒。",
			},
			[Emote.EmoteGenderMonster] = -- Monster
			{
				Msg				= --[[!AUTO_503]]"",
			},
			[Emote.EmoteGenderPet] = -- Pet反应动作喊话id，第一个为主人，第二个为其他玩家
			{
				MsgID			= {500, 519},
			},
		},
	},

[10236] = --求购
	{
		[0] = -- 技能发失败
		{
			[0] = -- 男
			{
				needTargetName 	= true,			--消息中是否需要对象名称
				chatMsg 		= --[[!AUTO_480]]"",
				chatMsgNoTarget	= --[[!AUTO_481]]"",	--无目标时，上面的消息用这个替代
				popMsg			= --[[!AUTO_482]]"收購各色貨品，價格絕對厚道！",		--头顶泡泡
				popMsgNoTarget	= --[[!AUTO_483]]"收購各色貨品，價格絕對厚道！",
				chatMsgResponse = --[[!AUTO_484]]"越是奸商就越愛宣揚自己厚道！",
				gfx 			= Emote.GFX[1],
			},
			[1] = -- 女
			{
				needTargetName 	= true,			--消息中是否需要对象名称
				chatMsg 		= --[[!AUTO_485]]"",
				chatMsgNoTarget	= --[[!AUTO_486]]"",	--无目标时，上面的消息用这个替代
				popMsg			= --[[!AUTO_487]]"收購各色貨品，價格絕對厚道！",		--头顶泡泡
				popMsgNoTarget	= --[[!AUTO_488]]"收購各色貨品，價格絕對厚道！",
				chatMsgResponse = --[[!AUTO_489]]"越是奸商就越愛宣揚自己厚道！",
				gfx 			= Emote.GFX[2],
			},
			[Emote.EmoteGenderNPC] = -- NPC
			{
				Msg				= --[[!AUTO_490]]"越是奸商就越愛宣揚自己厚道！",
			},
			[Emote.EmoteGenderMonster] = -- Monster
			{
				Msg				= --[[!AUTO_491]]"",
			},
			[Emote.EmoteGenderPet] = -- Pet反应动作喊话id，第一个为主人，第二个为其他玩家
			{
				MsgID			= {500, 519},
			},
		},
		[1] = -- 技能发成功
		{
			[0] = -- 男
			{
				needTargetName 	= true,			--消息中是否需要对象名称
				chatMsg 		= --[[!AUTO_492]]"",
				chatMsgNoTarget	= --[[!AUTO_493]]"",	--无目标时，上面的消息用这个替代
				popMsg			= --[[!AUTO_494]]"家裡閒置的，破損嚴重的，不知咋用的，統統賣給我咧~",		--头顶泡泡
				popMsgNoTarget	= --[[!AUTO_495]]"家裡閒置的，破損嚴重的，不知咋用的，統統賣給我咧~",
				chatMsgResponse = --[[!AUTO_496]]"反正這些破爛都用不著，就都給你了吧！",
				gfx 			= Emote.GFX[1],
			},
			[1] = -- 女
			{
				needTargetName 	= true,			--消息中是否需要对象名称
				chatMsg 		= --[[!AUTO_497]]"",
				chatMsgNoTarget	= --[[!AUTO_498]]"",	--无目标时，上面的消息用这个替代
				popMsg			= --[[!AUTO_499]]"家裡閒置的，破損嚴重的，不知咋用的，統統賣給我咧~",		--头顶泡泡
				popMsgNoTarget	= --[[!AUTO_500]]"家裡閒置的，破損嚴重的，不知咋用的，統統賣給我咧~",
				chatMsgResponse = --[[!AUTO_501]]"反正這些破爛都用不著，就都給你了吧！",
				gfx 			= Emote.GFX[2],
			},
			[Emote.EmoteGenderNPC] = -- NPC
			{
				Msg				= --[[!AUTO_502]]"反正這些破爛都用不著，就都給你了吧！",
			},
			[Emote.EmoteGenderMonster] = -- Monster
			{
				Msg				= --[[!AUTO_503]]"",
			},
			[Emote.EmoteGenderPet] = -- Pet反应动作喊话id，第一个为主人，第二个为其他玩家
			{
				MsgID			= {500, 519},
			},
		},
	},



}




















