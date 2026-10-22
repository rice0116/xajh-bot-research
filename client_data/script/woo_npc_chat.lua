--[[#tag push auto]]

------------------------------
WOO_NPC_CHAT = {}

--需要储存的数据
WOO_NPC_CHAT.config =
{
	tid = 0,
	haogandu = 0,
	text = --[[!AUTO_1]]"",
}

--对话内容类型
WOO_NPC_CHAT.TypeEnum =
{
	UIInit = 1,
	ChatAnswer = 2,
	sendGift = 3,
}

--答题内容配置表
WOO_NPC_CHAT.AnswerMessage =
{
	[57380] =
	{
		["你猜猜我有没有妹妹？"] =
		{
			[0] =
			{
				text = --[[!AUTO_2]]"怎麼會，怎麼還沒有個妹妹！",
				answer = --[[!AUTO_3]]"有",
			},
			[1] =
			{
				text = --[[!AUTO_4]]"這都不知道！",
				answer = --[[!AUTO_5]]"沒有",
			},
		},

		["地球是圆的吗？"] =
		{
			[0] =
			{
				text = --[[!AUTO_6]]"這是常識好嗎？",
				answer = --[[!AUTO_7]]"是",
			},
			[1] =
			{
				text = --[[!AUTO_8]]"就知道你說不對！",
				answer = --[[!AUTO_9]]"不是",
			},
		},
	}
}

--初始化聊天配置表
WOO_NPC_CHAT.ChatMessage =
{
	[57379] =
	{
		name = --[[!AUTO_10]]"令狐沖",
		Img  = --[[!AUTO_11]]"XAJH\\半身像\\令狐沖.dds",
		level = 35,
		Message =
		{
			[0] =
			{
				[1] =
				{
					value 	= 5000,
					text 	= "你我一生之中，麻烦天天有，呵……管他娘的，喝酒，喝酒！\r^FF0000每位玩家仅可获得一位NPC好友的归属，请不要贪心~",
					voice	= "Sfx\\voice\\Chinese\\NPC\\求愛NPC\\令狐沖\\男_低.ogg"
				},
				[2] =
				{
					value = 10000,
					text = "你这酒友我可是交定了，你就是赶我，我也赖着你了，呵呵呵呵呵……\r^FF00001、每位玩家仅可获得一位NPC好友的归属，请不要贪心~",
					voice	= "Sfx\\voice\\Chinese\\NPC\\求愛NPC\\令狐沖\\男_中.ogg"
				},
				[3] =
				{
					value = 50000000,
					text = "你我此生结为知己，若得永远如此，便是叫我做神仙，也没这般快活！^FFD200（每周日晚上18点-20点记得来找我。）\r^FF0000每位玩家仅可获得一位NPC好友的归属，请不要贪心~",
					voice	= "Sfx\\voice\\Chinese\\NPC\\求愛NPC\\令狐沖\\男_高.ogg"
				},
			},
			[1] =
			{
				[1] =
				{
					value = 5000,
					text = "我令狐冲向来不是拘泥不化之人，你我有缘，何不痛饮一杯！\r^FF0000每位玩家仅可获得一位NPC好友的归属，请不要贪心~",
					voice	= "Sfx\\voice\\Chinese\\NPC\\求愛NPC\\令狐沖\\女_低.ogg"
				},
				[2] =
				{
					value = 10000,
					text = "昨天夜里独自饮酒，不知怎么，突然想起你……呵……真是痴傻……\r^FF0000每位玩家仅可获得一位NPC好友的归属，请不要贪心~",
					voice	= "Sfx\\voice\\Chinese\\NPC\\求愛NPC\\令狐沖\\女_中.ogg"
				},
				[3] =
				{
					value = 50000000,
					text = "在这世上，我只有你一人。倘若你我之间也生了什么嫌隙，那做人还有什么意味……^FFD200（每周日晚上18点-20点记得来找我。）\r^FF0000每位玩家仅可获得一位NPC好友的归属，请不要贪心~",
					voice	= "Sfx\\voice\\Chinese\\NPC\\求愛NPC\\令狐沖\\女_高.ogg"
				},
			}
		}
	},
	[57380] =
	{
		name = --[[!AUTO_10]]"任盈盈",
		Img  = --[[!AUTO_11]]"XAJH\\半身像\\任盈盈.dds",
		level = 35,
		Message =
		{
			[0] =
			{
				[1] =
				{
					value 	= 5000,
					text 	= --[[!AUTO_12]]"呵呵，又是一个臭男人。\r^FF0000每位玩家仅可获得一位NPC好友的归属，请不要贪心~",
					voice	= --[[!AUTO_13]]"Sfx\\voice\\Chinese\\NPC\\求爱NPC\\任盈盈\\男_低.ogg"
				},
				[2] =
				{
					value = 10000,
					text = --[[!AUTO_14]]"江湖路远，你心里有那么一个人，想让她陪你一起走下去么？\r^FF0000每位玩家仅可获得一位NPC好友的归属，请不要贪心~",
					voice	= --[[!AUTO_15]]"Sfx\\voice\\Chinese\\NPC\\求爱NPC\\任盈盈\\男_中.ogg"
				},
				[3] =
				{
					value = 50000000,
					text = --[[!AUTO_18]]"你……你死哪儿去了！我……我才没有想你……^FFD200（每周日晚上18点-20点记得来找我。）\r^FF0000每位玩家仅可获得一位NPC好友的归属，请不要贪心~",
					voice	= --[[!AUTO_19]]"Sfx\\voice\\Chinese\\NPC\\求爱NPC\\任盈盈\\男_高.ogg"
				},
			},
			[1] =
			{
				[1] =
				{
					value = 5000,
					text = --[[!AUTO_20]]"哼，庸脂俗粉。\r^FF0000每位玩家仅可获得一位NPC好友的归属，请不要贪心~",
					voice	= --[[!AUTO_21]]"Sfx\\voice\\Chinese\\NPC\\求爱NPC\\任盈盈\\女_低.ogg"
				},
				[2] =
				{
					value = 10000,
					text = --[[!AUTO_22]]"你好像挺有意思。\r^FF0000每位玩家仅可获得一位NPC好友的归属，请不要贪心~",
					voice	= --[[!AUTO_23]]"Sfx\\voice\\Chinese\\NPC\\求爱NPC\\任盈盈\\女_中.ogg"
				},
				[3] =
				{
					value = 50000000,
					text = --[[!AUTO_26]]"江湖险恶，能说知心话的人，只你一人而已。^FFD200（每周日晚上18点-20点记得来找我。）\r^FF0000每位玩家仅可获得一位NPC好友的归属，请不要贪心~",
					voice	= --[[!AUTO_27]]"Sfx\\voice\\Chinese\\NPC\\求爱NPC\\任盈盈\\女_高.ogg"
				},
			}
		}
	},
	[57381] =
	{
		name = --[[!AUTO_28]]"岳靈珊",
		Img  = --[[!AUTO_29]]"XAJH\\半身像\\岳灵珊.dds",
		level = 35,
		Message =
		{
			[0] =
			{
				[1] =
				{
					value = 5000,
					text = --[[!AUTO_30]]"本小姐现在没空~\r^FF0000每位玩家仅可获得一位NPC好友的归属，请不要贪心~",
					voice	= --[[!AUTO_31]]"Sfx\\voice\\Chinese\\NPC\\求爱NPC\\岳灵珊\\男_低.ogg"
				},
				[2] =
				{
					value = 10000,
					text = --[[!AUTO_32]]"追本小姐的人多了去了，你可要加油噢~\r^FF0000每位玩家仅可获得一位NPC好友的归属，请不要贪心~",
					voice	= --[[!AUTO_33]]"Sfx\\voice\\Chinese\\NPC\\求爱NPC\\岳灵珊\\男_中.ogg"
				},
				[3] =
				{
					value = 50000000,
					text = --[[!AUTO_36]]"说好了要在一起的，不许反悔！^FFD200（每周日晚上18点-20点记得来找我。）\r^FF0000每位玩家仅可获得一位NPC好友的归属，请不要贪心~",
					voice	= --[[!AUTO_37]]"Sfx\\voice\\Chinese\\NPC\\求爱NPC\\岳灵珊\\男_高.ogg"
				},
			},
			[1] =
			{
				[1] =
				{
					value = 5000,
					text = --[[!AUTO_38]]"和你很熟么？\r^FF0000每位玩家仅可获得一位NPC好友的归属，请不要贪心~",
					voice	= --[[!AUTO_39]]"Sfx\\voice\\Chinese\\NPC\\求爱NPC\\岳灵珊\\女_低.ogg"
				},
				[2] =
				{
					value = 10000,
					text = --[[!AUTO_40]]"你好啊，又见面了。\r^FF0000每位玩家仅可获得一位NPC好友的归属，请不要贪心~",
					voice	= --[[!AUTO_41]]"Sfx\\voice\\Chinese\\NPC\\求爱NPC\\岳灵珊\\女_中.ogg"
				},
				[3] =
				{
					value = 50000000,
					text = --[[!AUTO_44]]"好姐妹！我想死你了！^FFD200（每周日晚上18点-20点记得来找我。）\r^FF0000每位玩家仅可获得一位NPC好友的归属，请不要贪心~",
					voice	= --[[!AUTO_45]]"Sfx\\voice\\Chinese\\NPC\\求爱NPC\\岳灵珊\\女_高.ogg"
				},
			}
		}
	},
	[57382] =
	{
		name = --[[!AUTO_46]]"林平之",
		Img  = --[[!AUTO_47]]"XAJH\\半身像\\林平之.dds",
		level = 35,
		Message =
		{
			[0] =
			{
				[1] =
				{
					value = 5000,
					text = --[[!AUTO_48]]"别以为我不知道你在想什么。\r^FF0000每位玩家仅可获得一位NPC好友的归属，请不要贪心~",
					voice	= --[[!AUTO_49]]"Sfx\\voice\\Chinese\\NPC\\求爱NPC\\林平之\\男_低.ogg"
				},
				[2] =
				{
					value = 10000,
					text = --[[!AUTO_50]]"有机会切磋切磋。\r^FF0000每位玩家仅可获得一位NPC好友的归属，请不要贪心~",
					voice	= --[[!AUTO_51]]"Sfx\\voice\\Chinese\\NPC\\求爱NPC\\林平之\\男_中.ogg"
				},
				[3] =
				{
					value = 50000000,
					text = --[[!AUTO_54]]"好兄弟，你是绝对不会背叛我的，对么？^FFD200（每周日晚上18点-20点记得来找我。）\r^FF0000每位玩家仅可获得一位NPC好友的归属，请不要贪心~",
					voice	= --[[!AUTO_55]]"Sfx\\voice\\Chinese\\NPC\\求爱NPC\\林平之\\男_高.ogg"
				},
			},
			[1] =
			{
				[1] =
				{
					value = 5000,
					text = --[[!AUTO_56]]"别想打我的主意。\r^FF0000每位玩家仅可获得一位NPC好友的归属，请不要贪心~",
					voice	= --[[!AUTO_57]]"Sfx\\voice\\Chinese\\NPC\\求爱NPC\\林平之\\女_低.ogg"
				},
				[2] =
				{
					value = 10000,
					text = --[[!AUTO_58]]"近况如何？偶尔会想起你来。\r^FF0000每位玩家仅可获得一位NPC好友的归属，请不要贪心~",
					voice	= --[[!AUTO_59]]"Sfx\\voice\\Chinese\\NPC\\求爱NPC\\林平之\\女_中.ogg"
				},
				[3] =
				{
					value = 50000000,
					text = --[[!AUTO_62]]"就算我负尽天下人，也不会负了你。^FFD200（每周日晚上18点-20点记得来找我。）\r^FF0000每位玩家仅可获得一位NPC好友的归属，请不要贪心~",
					voice	= --[[!AUTO_63]]"Sfx\\voice\\Chinese\\NPC\\求爱NPC\\林平之\\女_高.ogg"
				},
			}
		}
	},

	[57384] =
	{
		name = --[[!AUTO_64]]"儀琳",
		Img  = --[[!AUTO_65]]"XAJH\\半身像\\仪琳.dds",
		level = 35,
		Message =
		{
			[0] =
			{
				[1] =
				{
					value = 5000,
					text = --[[!AUTO_66]]"别……别离我太近……\r^FF0000每位玩家仅可获得一位NPC好友的归属，请不要贪心~",
					voice	= --[[!AUTO_67]]"Sfx\\voice\\Chinese\\NPC\\求爱NPC\\仪琳\\男_低.ogg"
				},
				[2] =
				{
					value = 10000,
					text = --[[!AUTO_68]]"好久……不见……我还以为你忘了我了……\r^FF0000每位玩家仅可获得一位NPC好友的归属，请不要贪心~",
					voice	= --[[!AUTO_69]]"Sfx\\voice\\Chinese\\NPC\\求爱NPC\\仪琳\\男_中.ogg"
				},
				[3] =
				{
					value = 50000000,
					text = --[[!AUTO_72]]"为什么我一看到你就觉得好开心呢！^FFD200（每周日晚上18点-20点记得来找我。）\r^FF0000每位玩家仅可获得一位NPC好友的归属，请不要贪心~",
					voice	= --[[!AUTO_73]]"Sfx\\voice\\Chinese\\NPC\\求爱NPC\\仪琳\\男_高.ogg"
				},
			},
			[1] =
			{
				[1] =
				{
					value = 5000,
					text = --[[!AUTO_74]]"阿弥陀佛\r^FF0000每位玩家仅可获得一位NPC好友的归属，请不要贪心~",
					voice	= --[[!AUTO_75]]"Sfx\\voice\\Chinese\\NPC\\求爱NPC\\仪琳\\女_低.ogg"
				},
				[2] =
				{
					value = 10000,
					text = --[[!AUTO_76]]"有些事不知道跟谁说才好……\r^FF0000每位玩家仅可获得一位NPC好友的归属，请不要贪心~",
					voice	= --[[!AUTO_77]]"Sfx\\voice\\Chinese\\NPC\\求爱NPC\\仪琳\\女_中.ogg"
				},
				[3] =
				{
					value = 50000000,
					text = --[[!AUTO_80]]"你来啦！好多心里话儿想跟你说！^FFD200（每周日晚上18点-20点记得来找我。）\r^FF0000每位玩家仅可获得一位NPC好友的归属，请不要贪心~",
					voice	= --[[!AUTO_81]]"Sfx\\voice\\Chinese\\NPC\\求爱NPC\\仪琳\\女_高.ogg"
				},
			}
		}
	},

	[57387] =
	{
		name = --[[!AUTO_82]]"藍鳳凰",
		Img  = --[[!AUTO_83]]"XAJH\\半身像\\蓝凤凰.dds",
		level = 35,
		Message =
		{
			[0] =
			{
				[1] =
				{
					value = 5000,
					text = --[[!AUTO_84]]"就算女人如衣服，我也不是你穿得起的那一款。\r^FF0000每位玩家仅可获得一位NPC好友的归属，请不要贪心~",
					voice	= --[[!AUTO_85]]"Sfx\\voice\\Chinese\\NPC\\求爱NPC\\蓝凤凰\\男_低.ogg"
				},
				[2] =
				{
					value = 10000,
					text = --[[!AUTO_86]]"是个汉子！我欣赏你！\r^FF0000每位玩家仅可获得一位NPC好友的归属，请不要贪心~",
					voice	= --[[!AUTO_87]]"Sfx\\voice\\Chinese\\NPC\\求爱NPC\\蓝凤凰\\男_中.ogg"
				},
				[3] =
				{
					value = 50000000,
					text = --[[!AUTO_90]]"我请你吃糖？放心，没有毒，呵呵呵^FFD200（每周日晚上18点-20点记得来找我。）\r^FF0000每位玩家仅可获得一位NPC好友的归属，请不要贪心~",
					voice	= --[[!AUTO_91]]"Sfx\\voice\\Chinese\\NPC\\求爱NPC\\蓝凤凰\\男_高.ogg"
				},
			},
			[1] =
			{
				[1] =
				{
					value = 5000,
					text = --[[!AUTO_92]]"你好，花瓶。\r^FF0000每位玩家仅可获得一位NPC好友的归属，请不要贪心~",
					voice	= --[[!AUTO_93]]"Sfx\\voice\\Chinese\\NPC\\求爱NPC\\蓝凤凰\\女_低.ogg"
				},
				[2] =
				{
					value = 10000,
					text = --[[!AUTO_94]]"不错，姑娘，你今天的打扮很对合我胃口。\r^FF0000每位玩家仅可获得一位NPC好友的归属，请不要贪心~",
					voice	= --[[!AUTO_95]]"Sfx\\voice\\Chinese\\NPC\\求爱NPC\\蓝凤凰\\女_中.ogg"
				},
				[3] =
				{
					value = 50000000,
					text = --[[!AUTO_98]]"好妹妹，有了你，我哪还需要那些臭男人。^FFD200（每周日晚上18点-20点记得来找我。）\r^FF0000每位玩家仅可获得一位NPC好友的归属，请不要贪心~",
					voice	= --[[!AUTO_99]]"Sfx\\voice\\Chinese\\NPC\\求爱NPC\\蓝凤凰\\女_高.ogg"
				},
			}
		}
	},

	[57388] =
	{
		name = --[[!AUTO_100]]"田伯光",
		Img  = --[[!AUTO_101]]"XAJH\\半身像\\田伯光.dds",
		level = 35,
		Message =
		{
			[0] =
			{
				[1] =
				{
					value = 5000,
					text = --[[!AUTO_102]]"抱歉，我不和俗人做朋友。\r^FF0000每位玩家仅可获得一位NPC好友的归属，请不要贪心~",
					voice	= --[[!AUTO_103]]"Sfx\\voice\\Chinese\\NPC\\求爱NPC\\田伯光\\男_低.ogg"
				},
				[2] =
				{
					value = 10000,
					text = --[[!AUTO_104]]"走着，喝花酒去？！\r^FF0000每位玩家仅可获得一位NPC好友的归属，请不要贪心~",
					voice	= --[[!AUTO_105]]"Sfx\\voice\\Chinese\\NPC\\求爱NPC\\田伯光\\男_中.ogg"
				},
				[3] =
				{
					value = 50000000,
					text = --[[!AUTO_108]]"好兄弟讲义气！从今后我的妹子就是你的妹子！^FFD200（每周日晚上18点-20点记得来找我。）\r^FF0000每位玩家仅可获得一位NPC好友的归属，请不要贪心~",
					voice	= --[[!AUTO_109]]"Sfx\\voice\\Chinese\\NPC\\求爱NPC\\田伯光\\男_高.ogg"
				},
			},
			[1] =
			{
				[1] =
				{
					value = 5000,
					text = --[[!AUTO_110]]"抱歉，我对你这杯茶没兴趣。\r^FF0000每位玩家仅可获得一位NPC好友的归属，请不要贪心~",
					voice	= --[[!AUTO_111]]"Sfx\\voice\\Chinese\\NPC\\求爱NPC\\田伯光\\女_低.ogg"
				},
				[2] =
				{
					value = 10000,
					text = --[[!AUTO_112]]"小娘子，一日不见如隔三秋啊~\r^FF0000每位玩家仅可获得一位NPC好友的归属，请不要贪心~",
					voice	= --[[!AUTO_113]]"Sfx\\voice\\Chinese\\NPC\\求爱NPC\\田伯光\\女_中.ogg"
				},
				[3] =
				{
					value = 50000000,
					text = --[[!AUTO_116]]"听见我的心跳了么？每一下都是因为你！^FFD200（每周日晚上18点-20点记得来找我。）\r^FF0000每位玩家仅可获得一位NPC好友的归属，请不要贪心~",
					voice	= --[[!AUTO_117]]"Sfx\\voice\\Chinese\\NPC\\求爱NPC\\田伯光\\女_高.ogg"
				},
			}
		}
	},
}

-- �򿪽����̸����Ϣ
function WOO_NPC_CHAT:get_first_chat( tid, haogandu )
	WOO_NPC_CHAT.config.tid 		= tid
	WOO_NPC_CHAT.config.haogandu 	= haogandu
	local ret					 	= GameApi.GetPlayerFullProp(0)
	local npc_table 				= WOO_NPC_CHAT.ChatMessage[WOO_NPC_CHAT.config.tid]
	local answer01 					= --[[!AUTO_118]]""
	local answer02 					= --[[!AUTO_119]]""
	local img 						= --[[!AUTO_120]]""
	local text						= --[[!AUTO_121]]""
	local voice						= --[[!AUTO_122]]""
	if ret.level < npc_table.level then
		return npc_table.Img, --[[!AUTO_123]]"你資歷尚淺，35級後再來找我好了。", answer01, answer02
	end
	for i = 1, #npc_table.Message[ret.gender] do
		if npc_table.Message[ret.gender][i].value >= haogandu then
			img 						= npc_table.Img
			text 						= npc_table.Message[ret.gender][i].text
			voice						= npc_table.Message[ret.gender][i].voice
			WOO_NPC_CHAT.config.text 	= text
			GameApi.Play3DSound(voice, GameApi.GetSelectedTarget())
			if WOO_NPC_CHAT.AnswerMessage[tid] then
				if WOO_NPC_CHAT.AnswerMessage[tid][text] then
				answer01 = WOO_NPC_CHAT.AnswerMessage[tid][text][0].answer
				answer02 = WOO_NPC_CHAT.AnswerMessage[tid][text][1].answer
				end
			end
			return img, text, answer01, answer02
		end
	end
	return img, text, answer01, answer02
end

-- �������ѡ���������Ϣ
function WOO_NPC_CHAT:get_next_chat(option)
local tid 		=	WOO_NPC_CHAT.config.tid
local text 		=	WOO_NPC_CHAT.config.text
local haogandu 	=	WOO_NPC_CHAT.config.haogandu
local answer01 	= 	--[[!AUTO_124]]""
local answer02 	= 	--[[!AUTO_125]]""
if WOO_NPC_CHAT.AnswerMessage[tid][text] then
	local configs = WOO_NPC_CHAT.AnswerMessage[tid][text]
	text = configs[option].text
	if WOO_NPC_CHAT.AnswerMessage[tid][configs[option].text] then
		answer01 = WOO_NPC_CHAT.AnswerMessage[tid][configs[option].text][0].answer
		answer02 = WOO_NPC_CHAT.AnswerMessage[tid][configs[option].text][1].answer
		WOO_NPC_CHAT.config.text = configs[option].text
	end
	return text, answer01, answer02
end
return text, answer01, answer02
end
