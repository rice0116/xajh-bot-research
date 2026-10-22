--[[#tag push auto]]
--可用函数接口
--GetHostChatTarget：
--		第一个是id，0表示没有，第二个是对方名字
--GetPlayerFullProp:
--		name		名字
--		prof		门派
--AddChatMessage(channel,msg)
--GetHostSnsInfo:
--		age		年龄
--		zodiac		星座
--		horoscope	生肖
--		onlinetime	在线时间

--		province	省
--		city		市
--		occupation	职业
--		intro		自我介绍
--		almamater	毕业学校

ExprOrder = {}

ExprOrder.Cfg = {}

--获取配置数据
function ExprOrder:GetCfg()
	local expr_cfg = {}
	for k,v in pairs(ExprOrder.Cfg) do
		local item_tbl = {}
		for sk,sv in pairs(v) do
			local order_tbl ={}
			order_tbl.Order = {}
			order_tbl.Order["Native"] = sv.Order["Native"]
			order_tbl.Order["Intern"] = sv.Order["Intern"]
			item_tbl[sk] = order_tbl
		end
		expr_cfg[k] = item_tbl
	end
	return expr_cfg
end

--通配符处理
function ExprOrder:FilterContent(sContent)
	if sContent == nil then
		return --[[!AUTO_1]]""
	end

	return sContent
end

--索引基数以1为开始
function ExprOrder:GetOrderContent(idxLable,idxItem,idType)
	if ExprOrder.Cfg[idxLable] and ExprOrder.Cfg[idxLable][idxItem] then
		if idType == 0 then
			local func = ExprOrder.Cfg[idxLable][idxItem].Content["None"].ContentFunc
			return ExprOrder:FilterContent(func())
		elseif idType == 1 then
			local func = ExprOrder.Cfg[idxLable][idxItem].Content["Self"].ContentFunc
			return ExprOrder:FilterContent(func())
		elseif idType == 2 then
			local func = ExprOrder.Cfg[idxLable][idxItem].Content["Other"].ContentFunc
			return ExprOrder:FilterContent(func())
		elseif idType == -1 then
			return ExprOrder:GetOrderContent(idxLable,idxItem,0),ExprOrder:GetOrderContent(idxLable,idxItem,1),ExprOrder:GetOrderContent(idxLable,idxItem,2)
		end
	end
	return --[[!AUTO_2]]""
end

--///数据配置区/////////////////////////////////////////////////////////////////////////
ExprOrder.Cfg[1] =
{
	[1] =
	{
		Order   =
		{
			["Native"] = --[[!AUTO_3]]"星座",
			["Intern"] = --[[!AUTO_4]]"zodiac"
		},

		Content =
		{
			["None"]  =
			{
				ContentFunc = function()
					local snsInfo = GameApi.GetPlayerSnsInfo(0)
					local zodiac  = snsInfo["zodiac"]
					if zodiac == 0 then
						return --[[!AUTO_5]]"沒有填寫自己的星座，打開名片可以完善個人資料。"
					elseif zodiac == 1 then
						return --[[!AUTO_6]]"領袖氣質的白羊：大家一起上，幹完這票我們就吃香勒喝辣勒~"
					elseif zodiac == 2 then
						return --[[!AUTO_7]]"熱愛自然的金牛：額決定和額養的斑馬一起回非洲了，那裡才是額的家。"
					elseif zodiac == 3 then
						return --[[!AUTO_8]]"善於表演的雙子：呵~毋叫我咩演技派，我滴做show水準早就超越曬啦~"
					elseif zodiac == 4 then
						return --[[!AUTO_9]]"浪漫的巨蟹：看到月亮邊邊兒那顆星星莫得？改天有空我帶你克耍。"
					elseif zodiac == 5 then
						return --[[!AUTO_10]]"虛榮自大的獅子：把我們計畫整理一下，先是攻下黑木崖，然後直搗皇城再轉攻歐洲，最後從美洲直撲那美剋星，一舉拿下。"
					elseif zodiac == 6 then
						return --[[!AUTO_11]]"瑣碎挑剔的處女：看剛才飛過去的蒼蠅萎靡不振，就知道它在熬夜。和黑眼圈，肌膚暗啞，痤瘡say goodbey，我堅持使用……"
					elseif zodiac == 7 then
						return --[[!AUTO_12]]"冷漠的天秤：我已經很低調的來了，大家表看我，千萬表看我！"
					elseif zodiac == 8 then
						return --[[!AUTO_13]]"足智多謀的天蠍：我需要大家配合我一下，通緝犯就藏在你們中間，擺地攤那個青少年，不要假裝，說的就是你！"

					elseif zodiac == 9 then
						return --[[!AUTO_14]]"坦率的射手：我聽別人說這世界有一種魚是沒有尾巴的，它只能隨波逐流，累了就在水裡面睡覺，這種魚一輩子只能下鍋一次，蒸太久就鹹了。"
					elseif zodiac == 10 then
						return --[[!AUTO_15]]"負責嚴厲的摩羯：根據明朝擺攤條例三十二章56條規定，這個攤位是我的，你還我。"
					elseif zodiac == 11 then
						return --[[!AUTO_16]]"性情不定的水瓶：聽說波斯商人今天帶來了好多西洋珍寶，實在是太讓人興奮了，大家都去啊？我洗洗睡覺先。"
					elseif zodiac == 12 then
						return --[[!AUTO_17]]"感情豐富的雙魚：這台高麗戲班子唱的劇還真是相當感人，尤其是最後女豬腳得白血病掛了那段。"
					else
						return --[[!AUTO_18]]"**************************"
					end
				end
			},

			["Self"]  =
			{
				ContentFunc = function()
					local snsInfo = GameApi.GetPlayerSnsInfo(0)
					local zodiac  = snsInfo["zodiac"]
					if zodiac == 0 then
						return --[[!AUTO_19]]"沒有填寫自己的星座,打開名片可以完善個人資料。"
					elseif zodiac == 1 then
						return --[[!AUTO_20]]"草率粗魯的白羊：身為一個職業的山賊，我不想插手他們加勒比海盜的事！"
					elseif zodiac == 2 then
						return --[[!AUTO_21]]"貪婪懶惰的金牛：什麼是愛，愛就是精神的食物，說到這兒我又有點餓了，還是先把雞湯給我。"
					elseif zodiac == 3 then
						return --[[!AUTO_22]]"得過且過的雙子：把這些垃圾踢到床下，就當一切都沒有發生過。"
					elseif zodiac == 4 then
						return --[[!AUTO_23]]"猜忌的巨蟹：我覺得我不是那種很敏感的人。不過你這是什麼意思，不說話，你以為我不知道你在想什麼，你不會得逞的！"
					elseif zodiac == 5 then
						return --[[!AUTO_24]]"幼稚的獅子：我終於明白了，兇手不可能是人類，也不可能是靈掌類，哎~想太多，我還是先磕掉這碗洋芋泥好了！"
					elseif zodiac == 6 then
						return --[[!AUTO_25]]"疑心挑剔的處女：你的偽裝太失敗了，你知道失敗就是死亡，比目魚，你臨終前想選擇什麼調料，你說吧！"
					elseif zodiac == 7 then
						return --[[!AUTO_26]]"交際廣闊的天秤：我還需要考慮一下，尤其是跳拉丁這種高難度的事，不過聽說可以順帶相親，先補個濃妝再考慮。"
					elseif zodiac == 8 then
						return --[[!AUTO_27]]"嫉妒報復的天蠍：我才不嫉妒他的裝備，我才不羡慕他的武器，我才不恨……好吧，他的號就是我刪的。"
					elseif zodiac == 9 then
						return --[[!AUTO_28]]"自由樂觀的射手：我相信，我一定會青出於藍，尤其是像我這麼優質的人，簡直就是奇葩啊！師父你真的要逐我出師門嗎？"
					elseif zodiac == 10 then
						return --[[!AUTO_29]]"勤奮節約的摩羯：居然發喜帖給我，他居然我發喜帖給我，看來又是要裝病了，紅包什麼的最討厭了！"
					elseif zodiac == 11 then
						return --[[!AUTO_30]]"獨立創新的水瓶：明天我就去把那匹棕馬畫成斑馬，誰都沒我拉風。"
					elseif zodiac == 12 then
						return --[[!AUTO_31]]"悲觀夢幻的雙魚：眼看那支見血封喉鏢，還差0.5秒就要插到我的身上！這個時候，我想抓緊時間泡個茶，再做個髮型。"
					else
						return --[[!AUTO_32]]"**************************"
					end
				end
			},

			["Other"] =
			{

				ContentFunc = function()
					local snsInfo = GameApi.GetPlayerSnsInfo(0)
					local zodiac  = snsInfo["zodiac"]
					local hostfull = GameApi.GetPlayerFullProp(0)
					local host = hostfull["name"]
					local id,name = GameApi.GetHostChatTarget()
						if id == 0 then
						return --[[!AUTO_33]]"您沒有選擇表情對象，在人物介面打開名片可以填妥個人資料"
					else
					if zodiac == 0 then
						return --[[!AUTO_34]]"沒有填寫自己的星座，打開名片可以完善個人資料。"
					elseif zodiac == 1 then
						return --[[!AUTO_35]]"性情急躁的白羊：『"..host..--[[!AUTO_36]]"』滿腔怒火的擦了擦滿嘴的油，『"..name..--[[!AUTO_37]]"』如果你再不買零食給我續上，我就吃草皮給你看！"
					elseif zodiac == 2 then
						return --[[!AUTO_38]]"保守固執的金牛：『"..name..--[[!AUTO_39]]"』你一定要體諒我！我居然忘了給仙人掌修枝，這就是我必須得離開的理由！『"..host..--[[!AUTO_40]]"』說完一溜煙跑了。"
					elseif zodiac == 3 then
						return --[[!AUTO_41]]"善變好動的雙子:『"..host..--[[!AUTO_42]]"』煩惱的說，我的檔期是滿勒地，接接下來和接接接下來的檔期也是滿勒地，不過我可以抽點時間陪『"..name..--[[!AUTO_43]]"』。"
					elseif zodiac == 4 then
						return --[[!AUTO_44]]"感情豐富的巨蟹:『"..name..--[[!AUTO_45]]"』你不要，不要不再說下去了，我想聽，我想聽，我想聽~『"..host..--[[!AUTO_46]]"』瞬間幻化出了窮搖阿姨的表情。"
					elseif zodiac == 5 then
						return --[[!AUTO_47]]"樂觀自信的獅子:『"..name..--[[!AUTO_48]]"』只要你肯臣服與我，我就把最後這張廁紙讓給你，你先回房考慮好了，再回來找我！『"..host..--[[!AUTO_49]]"』淡定的說。"
					elseif zodiac == 6 then
						return --[[!AUTO_50]]"精確求真的處女:『"..name..--[[!AUTO_51]]"』幫主，這個月遺失的那枚銅板，我已經吩咐全幫的人去找了，你大可放心。『"..host..--[[!AUTO_52]]"』心驚膽戰的說。"
					elseif zodiac == 7 then
						return --[[!AUTO_53]]"猶豫不決的天秤:『"..name..--[[!AUTO_54]]"』你現在叫我選，想玩死我，來啊，我就選這個饅頭！此刻的『"..host..--[[!AUTO_55]]"』做出了人生中一個相當重大的決定。"
					elseif zodiac == 8 then
						return --[[!AUTO_56]]"善於觀察的天蠍:你不要再敲下去了『"..name..--[[!AUTO_57]]"』，你沒發現它是座性格活潑的火山嗎？『"..host..--[[!AUTO_58]]"』的額頭正掛著一顆碩大的汗水！"
					elseif zodiac == 9 then
						return --[[!AUTO_59]]"喜歡勉強的射手:我很久沒出手了，『"..host..--[[!AUTO_60]]"』嚴厲的說：『"..name..--[[!AUTO_61]]"』，今天我就傳你這招，你先將雞翅醃制，再撒上粗鹽……"
					elseif zodiac == 10 then
						return --[[!AUTO_62]]"自我自私的摩羯:你說這頓要我出錢，來『"..name..--[[!AUTO_63]]"』，拿著這把刀，殺了我先了！『"..host..--[[!AUTO_64]]"』一邊說一邊握緊了裝銀票的袋子！"
					elseif zodiac == 11 then
						return --[[!AUTO_65]]"叛逆古怪的水瓶:“我不要去小黑屋，快救我~”。以上是『"..host..--[[!AUTO_66]]"』今天的彩排部分，『"..name..--[[!AUTO_67]]"』你多少給點反映！"
					elseif zodiac == 12 then
						return --[[!AUTO_68]]"善解人意的雙魚:都什麼時候，『"..name..--[[!AUTO_69]]"』你還在這裡種洋芋，不過這個品種看起來還不錯，你選用的化肥是“揮發肥”吧?難怪。『"..host..--[[!AUTO_70]]"』認真的研究到。"
					else
						return --[[!AUTO_71]]"**************************"
					end
					end
				end
			}
		}
	},

	[2] =
	{
		Order   =
		{
			["Native"] = --[[!AUTO_72]]"生肖",
			["Intern"] = --[[!AUTO_73]]"birthpet"
		},

		Content =
		{
			["None"]  =
			{
				ContentFunc = function()
					local snsInfo = GameApi.GetPlayerSnsInfo(0)
					local horoscope  = snsInfo["horoscope"]
					if horoscope == 0 then
						return --[[!AUTO_74]]"沒有填寫自己的生肖，打開名片可以完善個人資料。"
					elseif horoscope == 1 then
						return --[[!AUTO_75]]"浪漫的鼠：今天我在杭州郊外開paty，通宵場一人兩銀，送酒水爆米花加果盤。"
					elseif horoscope == 2 then
						return --[[!AUTO_76]]"勤奮的牛：走啊走的就走到京城了，京城真熱鬧，想起童年出發那天……"
					elseif horoscope == 3 then
						return --[[!AUTO_77]]"富於冒險的虎：我已經接到了入侵警報，大家先睡，我先回天仙座處理點私事。"
					elseif horoscope == 4 then
						return --[[!AUTO_78]]"高貴的兔：這種葡萄酒晶瑩剔透，成色深紅，果然不愧是波斯極品，老闆開瓶二鍋頭！"
					elseif horoscope == 5 then
						return --[[!AUTO_79]]"正義的龍：你們居然亂擺攤，還互相重疊著亂擺攤，知道錯在那裡了嗎？"
					elseif horoscope == 6 then
						return --[[!AUTO_80]]"神經質的蛇：這幅丹青的確出自我手，我畫的就是一隻很像貓的狗，恭喜你們都說對了！"
					elseif horoscope == 7 then
						return --[[!AUTO_81]]"豪爽活潑的馬：我很忙，同時和幾百個人一起聊，大家別擠，取號，等叫！"
					elseif horoscope == 8 then
						return --[[!AUTO_82]]"防禦度極高的羊：居然說我的是山寨貨，大家都在王師傅手裡批發的！何必揭穿！"
					elseif horoscope == 9 then
						return --[[!AUTO_83]]"機智的猴：我掐指一算，這塊地方，果然是擺攤寶地啊！"
					elseif horoscope == 10 then
						return --[[!AUTO_84]]"表現力強的雞：大家好，我就是傳說中鏡頭最少的路人甲，以後請大家多關照。"
					elseif horoscope == 11 then
						return --[[!AUTO_85]]"守規矩的狗：說好打麻將，你們居然窩居在這裡擺攤！"
					elseif horoscope == 12 then
						return --[[!AUTO_86]]"獨斷獨行的豬：我隱姓埋名，忍辱偷生，徹夜難眠，就是為了回來擺個攤，給點面子，多少留個位置給我！"
					else
						return --[[!AUTO_87]]"**************************"

					end
				end
			},

			["Self"]  =
			{
				ContentFunc = function()
					local snsInfo = GameApi.GetPlayerSnsInfo(0)
					local horoscope  = snsInfo["horoscope"]
					if horoscope == 0 then
						return --[[!AUTO_88]]"沒有填寫自己的生肖，打開名片可以完善個人資料。"
					elseif horoscope == 1 then
						return --[[!AUTO_89]]"幽默的鼠：我和他的關係很好啊，他不是叫那個什麼來著。"
					elseif horoscope == 2 then
						return --[[!AUTO_90]]"堅持的牛：這筆賬根本不是這個演算法，我回家先開個平方根，再來跟他理論。"
					elseif horoscope == 3 then
						return --[[!AUTO_91]]"勇敢的虎：來吧，美式摔跤我也是有練過的！"
					elseif horoscope == 4 then
						return --[[!AUTO_92]]"樂觀的兔：這個沙發的棉花很軟，環境也冬涼夏暖，雖然偶爾也有一點吵，下次還是換南門那個天橋睡好了。"
					elseif horoscope == 5 then
						return --[[!AUTO_93]]"可愛的龍：明天我就去告他狀哦！我怎麼有點故作口奈！一定素錯覺啦！就醬子！"
					elseif horoscope == 6 then
						return --[[!AUTO_94]]"有潔癖的蛇：我每次打完怪，一定會拖乾淨血漬，順便給它疊個衣服，抹個馬桶什麼的，從小就愛乾淨，天生的。"
					elseif horoscope == 7 then
						return --[[!AUTO_95]]"頭腦靈活的馬：明天要做的事，居然整理出來，成了一本懸疑、劇情、喜劇、靈異體小說，所以明天還是先找家出版社好了。"
					elseif horoscope == 8 then
						return --[[!AUTO_96]]"有毅力的羊：東方不敗會刺繡有什麼了不起，明天我就織件毛衣給你見識一下。"
					elseif horoscope == 9 then
						return --[[!AUTO_97]]"活潑的猴：經驗告訴我，摔一跤不要緊，關鍵是起身的時候要記得要酷！"
					elseif horoscope == 10 then
						return --[[!AUTO_98]]"愛管閒事的雞：鄰居二姨婆的表妹的舅舅姑媽家的阿花生小狗，也不發請帖給我，太過分了吧！"
					elseif horoscope == 11 then
						return --[[!AUTO_99]]"正直的狗：那件事不能就這麼算了，秀兒你認真聽我說，我一定會幫你查出侮辱你的真凶，也就是孩子的爹！秀兒過來，喵~~喵~~秀兒~"
					elseif horoscope == 12 then
						return --[[!AUTO_100]]"消極過頭的豬：有人來過我屋子，他喝過我的茶，上過我的廁所，還穿了我的睡衣，還睡了我的床，難到是他！………自編自演好無聊，刷牙去！"
					else
						return --[[!AUTO_101]]"**************************"
					end
				end
			},

			["Other"] =
			{

				ContentFunc = function()
					local snsInfo = GameApi.GetPlayerSnsInfo(0)
					local horoscope  = snsInfo["horoscope"]
					local hostfull = GameApi.GetPlayerFullProp(0)
					local host = hostfull["name"]
					local id,name = GameApi.GetHostChatTarget()
						if id == 0 then
						return --[[!AUTO_102]]"您沒有選擇表情對象，在人物介面打開名片可以填妥個人資料"
					else
					if horoscope == 0 then
						return --[[!AUTO_103]]"沒有填寫自己的生肖，打開名片可以完善個人資料。"
					elseif horoscope == 1 then
						return --[[!AUTO_104]]"敏銳的鼠：『"..host..--[[!AUTO_105]]"』憤怒的看著『"..name..--[[!AUTO_106]]"』說：居然來我家行竊，你先竊著，等我洗了面膜再收拾你！"
					elseif horoscope == 2 then
						return --[[!AUTO_107]]"偏激的牛：『"..name..--[[!AUTO_108]]"』癱軟在『"..host..--[[!AUTO_109]]"』的腳下，傲嬌的說：我最討厭人家睡我的床，尤其是我不在的時候。"
					elseif horoscope == 3 then
						return --[[!AUTO_110]]"有魄力的虎：『"..name..--[[!AUTO_111]]"』我們一起表演胸口碎大石吧，忘了說，演大石這個角色難度真的很高，但保證你會上癮~說完『"..host..--[[!AUTO_112]]"』嬌羞的咬住下唇！"
					elseif horoscope == 4 then
						return --[[!AUTO_113]]"防衛感強的兔：這樣高級的武器展『"..name..--[[!AUTO_114]]"』你見識過嗎？每一把都是神兵利器，喂！你放下那把修枝的剪刀，此刻『"..host..--[[!AUTO_115]]"』一臉無奈。"
					elseif horoscope == 5 then
						return --[[!AUTO_116]]"熱情的龍：攀到頂峰之前，『"..name..--[[!AUTO_117]]"』我很認真的再提醒你一次，不要隨便爬到別人的背上！『"..host..--[[!AUTO_118]]"』早已內牛滿面！"
					elseif horoscope == 6 then
						return --[[!AUTO_119]]"猜疑心重的蛇：『"..host..--[[!AUTO_120]]"』突然興奮起來，我知道『"..name..--[[!AUTO_121]]"』你今天為什麼不同！是鞋，一定是鞋，這是LV秋冬毛絨新款吧！"
					elseif horoscope == 7 then
						return --[[!AUTO_122]]"推斷力強的馬：『"..name..--[[!AUTO_123]]"』你知道嗎？我能跟蹤到你，完全是你的粉撲得太厚，你自己回頭看地上。『"..host..--[[!AUTO_124]]"』抬了抬鼻子上的眼鏡架。"
					elseif horoscope == 8 then
						return --[[!AUTO_125]]"略帶神經質的羊：『"..name..--[[!AUTO_126]]"』你貼個“寶馬”的商標也沒有人會相信的，它只是個洋芋！『"..host..--[[!AUTO_127]]"』嚴肅的說到！"
					elseif horoscope == 9 then
						return --[[!AUTO_128]]"幽默的猴：『"..host..--[[!AUTO_129]]"』相當低調的問『"..name..--[[!AUTO_130]]"』：吃沒，哦，恩，我是JAY，請叫我姐倫~"
					elseif horoscope == 10 then
						return --[[!AUTO_131]]"能言善道的雞：『"..name..--[[!AUTO_132]]"』我們聊那麼久，你是男還是女？無所謂了，老實說~我其實很想（系統瘋狂擋字中）你曉得地！『"..host..--[[!AUTO_133]]"』邊說邊拿出嘴裡面的棒棒糖~"
					elseif horoscope == 11 then
						return --[[!AUTO_134]]"自戀的狗：我想說我真想（系統憤怒的擋字），我知道『"..name..--[[!AUTO_135]]"』你一定也很想，所以（系統十分憤怒的擋字）不見不散，說完『"..host..--[[!AUTO_136]]"』妖嬈的一扭，消失在了人群中！"
					elseif horoscope == 12 then
						return --[[!AUTO_137]]"缺乏應變的豬：『"..name..--[[!AUTO_138]]"』我不是反對你挖鼻孔，其實我偶爾也會挖……不過你能不用我的手指嗎？『"..host..--[[!AUTO_139]]"』又一次淚如泉湧。"
					else
						return --[[!AUTO_140]]"**************************"
					end
					end
				end
			}
		}
	},

	[3] =
	{
		Order   =
		{
			["Native"] = --[[!AUTO_141]]"門派",
			["Intern"] = --[[!AUTO_142]]"prof"
		},

		Content =
		{
			["None"]  =
			{
				ContentFunc = function()
					local playerInfo = GameApi.GetPlayerFullProp(0)
					local prof  = playerInfo["prof"]
					if prof == 1 then
						return --[[!AUTO_143]]"天龍四眾，唯然世尊，『少林』拜見！"
					elseif prof == 2 then
						return --[[!AUTO_144]]"太嶽歸一，劍化兩級，南尊『武當』！"
					elseif prof == 3 then
						return --[[!AUTO_145]]"軒轅成華，西嶽淩駕，『華山派』覲見！"
					elseif prof == 4 then
						return --[[!AUTO_146]]"紫嶽其東，五蘊皆空，『恆山派』拜會！"
					elseif prof == 5 then
						return --[[!AUTO_147]]"刀劍逐酒，南嶽獨秀，『衡山派』淩駕！"
					elseif prof == 6 then
						return --[[!AUTO_148]]"『日月神教』一統江湖，放眼眾生唯我獨尊！"
					elseif prof == 7 then
						return --[[!AUTO_149]]"蒼海無間，雷臨『五仙』，破曉千年！"
					elseif prof == 8 then
						return --[[!AUTO_150]]"聲色書畫三千遍，不如『逍遙』遊人間！"
					elseif prof == 9 then
						return --[[!AUTO_151]]"『唐門』青霄誰人了，一身無招且有招！"
					elseif prof == 10 then
						return --[[!AUTO_152]]"『峨眉』百年天下秀，縱橫武林與誰鬥！"

					else
						return --[[!AUTO_153]]"『新手』其實我只是一個低調的小角色，大家多關照~"

					end
				end
			},

			["Self"]  =
			{
				ContentFunc = function()
					local playerInfo = GameApi.GetPlayerFullProp(0)
					local prof  = playerInfo["prof"]
					if prof == 1 then
						return --[[!AUTO_154]]"少林：悟空說那本“藏經閣”裡的秘笈叫《金瓶梅》，看來事有蹊蹺！待我再細細品讀一遍。"
					elseif prof == 2 then
						return --[[!AUTO_155]]"武當：師弟，你又偷香火錢，我說過，“淨樂宮'的這個香火錢只有我能……"
					elseif prof == 3 then
						return --[[!AUTO_156]]"華山派：嶽不群師尊為了招攬遊客，居然又自編自導一台新戲《劈山救母》，他越來越喜歡演母后的角色……有點怪怪的……"
					elseif prof == 4 then
						return --[[!AUTO_157]]"恆山派：事實證明“懸空寺”的護欄上是不能曬被子的……好冷……"
					elseif prof == 5 then
						return --[[!AUTO_158]]"衡山派：我時常會去一個知音的墳前彈琴，算起來，已經五年了。要不是遇到那個樵夫，我都還不知道，原來這個墳是磨豆漿的王二姑的，知音的墳還要再往前行五百步。"
					elseif prof == 6 then
						return --[[!AUTO_159]]"日月神教：每當黑木崖月色高懸的時候，總會想起娘講的故事，它的名字很怪，叫“阿飯大”，講的是一個飯量很大的孩子，後來……"
					elseif prof == 7 then
						return --[[!AUTO_160]]"五仙：師妹，雖然這是天下獨一無二的秘笈，不過這本《玉女劍法》我想我們已經沒法修練了！"
					elseif prof == 8 then
						return --[[!AUTO_161]]"逍遙：你看你聰明伶俐，德高望重，賢良淑德，火裡水裡去去就來，居然學人搞詐胡！……身為師父……你……"
					elseif prof == 9 then
						return --[[!AUTO_162]]"唐門：由於我滿身都是唐門重型暗器，那日失足滾下山坡，我才知道，它們的威力有多大。"
					elseif prof == 10 then
						return --[[!AUTO_163]]"峨眉：那隻猴子偷了我的武器，牠還偷了我的錢……裝備……名字……等級……，現在牠去打怪去了，我還在樹上吃著蕉，現在你該明白我的內涵了吧！"

					else
						return --[[!AUTO_164]]"新手：為了讓自己顯得更有角度一些，我決定明天就去加入門派！"

					end
				end
			},

			["Other"] =
			{

				ContentFunc = function()
					local playerInfo = GameApi.GetPlayerFullProp(0)
					local prof  = playerInfo["prof"]
					local hostfull = GameApi.GetPlayerFullProp(0)
					local host = hostfull["name"]
					local id,name = GameApi.GetHostChatTarget()
					if id == 0 then
						return --[[!AUTO_165]]"您沒有選擇表情對象，您可以在右鍵互動功能表選擇表情對象"
					else
					if prof == 1 then
						return --[[!AUTO_166]]"少林：『"..host..--[[!AUTO_167]]"』安詳的對『"..name..--[[!AUTO_168]]"』說，貧僧剛才太大意啦！又動了凡心~"
					elseif prof == 2 then
						return --[[!AUTO_169]]"武當：這位開心的『"..name..--[[!AUTO_170]]"』朋友，『"..host..--[[!AUTO_171]]"』道長除了摸骨看相，還自創出一套技法，名叫“馬殺雞”，來！給你“殺”兩下！"
					elseif prof == 3 then
						return --[[!AUTO_172]]"華山派：『"..name..--[[!AUTO_173]]"』師兄，你的內心戲太多，可憐的『"..host..--[[!AUTO_174]]"』和你已經對望了一把香的時間，華山風大雨大的，來~趕快給他說句話！"
					elseif prof == 4 then
						return --[[!AUTO_175]]"恆山派：定逸師叔說那些人，都喜歡藏在山門邊的樹後出恭，弄得臭臭的！『"..name..--[[!AUTO_176]]"』這是你的新武器“擀麵杖”，不要問激動的『"..host..--[[!AUTO_177]]"』怎麼用，你懂的！出發！"
					elseif prof == 5 then
						return --[[!AUTO_178]]"衡山派：『"..name..--[[!AUTO_179]]"』我們不能坐以待斃，而且身為兩個惜音之人，已經等了三把香時間！事到如今，你還是出去買一卷手紙回來吧！茅房真的好臭……『"..host..--[[!AUTO_180]]"』無奈道。"
					elseif prof == 6 then
						return --[[!AUTO_181]]"日月神教：來了！來了！“東方教主”最新刺繡真品《鴛鴦與水》，蘇繡的終極演繹~~~『"..host..--[[!AUTO_182]]"』狡猾的對『"..name..--[[!AUTO_183]]"』說要不要來一幅~"
					elseif prof == 7 then
						return --[[!AUTO_184]]"五仙：『"..name..--[[!AUTO_185]]"』你真的不肯打折！我最討厭就是原價兩個字！哪怕給個九折也行，否則就受死吧，『"..host..--[[!AUTO_186]]"』說完瘋狂的撲了上去！"
					elseif prof == 8 then
						return --[[!AUTO_187]]"逍遙：『"..host..--[[!AUTO_188]]"』平靜的對『"..name..--[[!AUTO_189]]"』說道，你可知，雖然我內心逍遙，但是我說話的時候，最討厭人家吃雞，而且這塊雞，還是我筷子上的！"
					elseif prof == 9 then
						return --[[!AUTO_190]]"唐門：『"..name..--[[!AUTO_191]]"』你居然對一個弱女子出手。什麼？你說他是男的！好吧，驚訝的『"..host..--[[!AUTO_192]]"』決定和你聯手！反正這“黃瓜銷魂杵”也好久沒用過了！"
					elseif prof == 10 then
						return --[[!AUTO_193]]"峨眉：峨眉的雪真的很大，一點點飄落在人身上，慢慢的融化，讓人心也平靜起來，『"..name..--[[!AUTO_194]]"』扭頭溫柔的對『"..host..--[[!AUTO_195]]"』說：我都開始結冰了，你還愣著做啥，快把我抬回屋去！"

					else
						return --[[!AUTO_196]]"新手：『"..name..--[[!AUTO_197]]"』你現在混得怎麼樣？我目前很挫，等你提攜！"

					end
					end
				end
			}
		}
	},

	[4] =
	{
		Order   =
		{
			["Native"] = --[[!AUTO_198]]"縣市",
			["Intern"] = --[[!AUTO_199]]"province"
		},

		Content =
		{
			["None"]  =
			{
				ContentFunc = function()
					local snsInfo = GameApi.GetPlayerSnsInfo(0)
					local prov  = snsInfo["province"]
					if	prov == --[[!AUTO_200]]"無" then
						return --[[!AUTO_201]]"您還沒有填寫縣市資訊，您可以在名片內詳填個人資訊~"
					elseif prov == --[[!AUTO_202]]"北京" then
						return --[[!AUTO_203]]"北京：八道灣兒胡同裡有惡犬喜歡溜兒早兒！大家小心，切記不要和它四目對望，更不要試圖去觸摸它~"
					elseif prov == --[[!AUTO_204]]"天津" then
						return --[[!AUTO_205]]"天津：聽說走完十七條街有家麻花的味道不錯，不過最近聽說朝廷施工，哪邊又多修了一條街。"
					elseif prov == --[[!AUTO_206]]"河北省" then
						return --[[!AUTO_207]]"河北：回憶在河北的時日總是逍遙的，閑來和趙雲騎騎馬，和武松打打虎，和曹雪芹聊聊小說，不知不覺幾千年就過去了~"
					elseif prov == --[[!AUTO_208]]"山西省" then
						return --[[!AUTO_209]]"山西：大家注意！這裡很危險，請趕快離開。告訴我到底是誰帶頭在壺口瀑布洗衣服的！"
					elseif prov == --[[!AUTO_210]]"內蒙古" then
						return --[[!AUTO_211]]"內蒙古：錫林格勒是很兇險的，我曾經帶過一個團，最後就導遊回來了，我說的曾經，就是昨天。接下來的時間大家自由活動，請不要怕那些野生狼群，它們昨天才吃過。"
					elseif prov == --[[!AUTO_212]]"遼寧省" then
						return --[[!AUTO_213]]"遼寧：“昭陵”倒鬥不吹燈！走過路過，表錯過，龍捲風都吹不熄的蠟燭，倒鬥必備~"
					elseif prov == --[[!AUTO_214]]"吉林省" then
						return --[[!AUTO_215]]"吉林：明朝萬曆二十五年，令狐中來天池泡澡，同日，長白山那座火山噴發！後來記錄的人流著冷汗，默默刪除了令狐中的事。"
					elseif prov == --[[!AUTO_216]]"上海" then
						return --[[!AUTO_217]]"上海：我在外灘賣過切糕，給黃浦江截過流，不過現在已經轉行理髮了，儂要做個什麼坡度的髮型！"
					elseif prov == --[[!AUTO_218]]"江蘇省" then
						return --[[!AUTO_219]]"江蘇：自從“東方教主”涉足於蘇繡以來，只要一提到他，很多資深蘇繡達人總是會緊張。"
					elseif prov == --[[!AUTO_220]]"浙江省" then
						return --[[!AUTO_221]]"浙江：聽聞千島湖的農婦，當年只出了三拳，就稱霸天下了，現在她退出武林種了點田，不過那些要簽名的人，至今都絡繹不絕。"
					elseif prov == --[[!AUTO_222]]"安徽省" then
						return --[[!AUTO_223]]"安徽：“祁門儺舞”又俗稱鬼舞，表情要冷漠，步伐要飄逸，要跳到嚇哭周圍所有小朋友才算成功！"
					elseif prov == --[[!AUTO_224]]"黑龍江省" then
						return --[[!AUTO_225]]"黑龍江：漠河鎮極光要出來了，大家快來我這兒買3D眼鏡啊~"
					elseif prov == --[[!AUTO_226]]"福建省" then
						return --[[!AUTO_227]]"福建：福州的魚丸味道不差，可惜就是少了個人陪我吃！"
					elseif prov == --[[!AUTO_228]]"江西省" then
						return --[[!AUTO_229]]"江西：這只景德鎮的粉彩碗，可是官窯出品，官窯貨哦！不信，大家看“官窯”兩個字寫得滿碗都是，原價99999，現價只賣99，還送雪泥面膜。"
					elseif prov == --[[!AUTO_230]]"山東省" then
						return --[[!AUTO_231]]"山東：想當年蒲松齡在淄川寫《聊齋志異》的時候，我總是在旁邊給他講鬼故事~"
					elseif prov == --[[!AUTO_232]]"河南省" then
						return --[[!AUTO_233]]"河南：聽說少林寺的掃地僧人的功夫，不亞於掌門，就因為傳出謠言，後來聽說少林寺再沒人敢掃地了。"
					elseif prov == --[[!AUTO_234]]"湖北省" then
						return --[[!AUTO_235]]"湖北：當年要不是我酒量好，灌醉了李白，他怎麼會在宜昌留下“千里江陵一日還。”的神句！"
					elseif prov == --[[!AUTO_236]]"湖南省" then
						return --[[!AUTO_237]]"湖南：“汨羅山”果然有當年屈原的墓啊~不知道會不會有當年祭祀的粽子，深想片刻……肯定都爛了，不過萬一他選擇真空包裝的話……去買小鏟……"
					elseif prov == --[[!AUTO_238]]"廣東省" then
						return --[[!AUTO_239]]"廣東：這次的合唱曲目已經定好了，叫“東方蜘蛛”大家有什麼意見？"
					elseif prov == --[[!AUTO_240]]"廣西" then
						return --[[!AUTO_241]]"廣西：失足跌下象鼻山后，我忘了很多事情，這也就是我忘記付錢的理由了。不知道這樣說，老闆你會不會接受！"
					elseif prov == --[[!AUTO_242]]"海南省" then
						return --[[!AUTO_243]]"海南：聽聞南沙群島的海域，的確有很多沉船，不過沒人敢去打撈的原因並不是因為門票太貴~所以你們以這個作為貸款理由，是不是太誇張了！"
					elseif prov == --[[!AUTO_244]]"重慶" then
						return --[[!AUTO_245]]"重慶：哪個來陪我擺哈龍門陣嘛~我都在朝天門逛了好多圈了。"
					elseif prov == --[[!AUTO_246]]"四川省" then
						return --[[!AUTO_247]]"四川：大家不要抱怨，也不要急，黃龍景區就是這樣，等那些猴子泡完溫泉，我們就可以下水了~"
					elseif prov == --[[!AUTO_248]]"貴州省" then
						return --[[!AUTO_249]]"貴州：黃角樹瀑布靠近看，很壯觀吧！而且落差也很大，我們的皮划艇被沖落下來，這麼久都沒到底，淚……"
					elseif prov == --[[!AUTO_250]]"雲南省" then
						return --[[!AUTO_251]]"雲南：看見那個人沒有，他當年攀爬出安全護欄，去玉龍雪山的冰川上自拍，現在都凍結了一千多年，後來就成為這裡一個新景點了。"
					elseif prov == --[[!AUTO_252]]"陝西省" then
						return --[[!AUTO_253]]"『陝西』剛才是誰扮演“關中大俠”把道具刀弄斷的，我數三聲，請自己承認！唉~我早叫老闆別在這裡放那麼多角色面具，窩火！"
					elseif prov == --[[!AUTO_254]]"甘肅省" then
						return --[[!AUTO_255]]"『甘肅』大家好，敦煌是開放遊覽的……大家別對著那尊佛像好嗎？我在這邊（下次誰再叫我帶深度近視觀光團，我就辭職！）"
					elseif prov == --[[!AUTO_256]]"青海省" then
						return --[[!AUTO_257]]"『青海』少給我裝失望的表情，把泳裝都給我收起來，誰告訴你們“長江源”可以游泳的！"
					elseif prov == --[[!AUTO_258]]"寧夏" then
						return --[[!AUTO_259]]"寧夏：大家想不想看明長城啊？但是由於現在還在建設中，所以門票提前三十年預售，各位請掏銀票吧！"
					elseif prov == --[[!AUTO_260]]"新疆" then
						return --[[!AUTO_261]]"新疆：電臺節目《昆侖》接聽熱線：昆侖山那個“地獄之門”我剛去過。為什麼我還能活著回來？呵，你確定我現在是活著的？"
					elseif prov == --[[!AUTO_262]]"西藏" then
						return --[[!AUTO_263]]"西藏：羊卓雍湖的風好大，上次我就看到一團的遊客被吹到湖裡，大家跟上，遊快點，我們就要上岸了。"
					elseif prov == --[[!AUTO_264]]"香港" then
						return --[[!AUTO_265]]"香港：我也想請大家去蘭桂坊喝酒，不過在這個朝代中，蘭桂坊還沒有修建……"
					elseif prov == --[[!AUTO_266]]"澳門" then
						return --[[!AUTO_267]]"澳門：稍安勿躁，我知道大家都想當賭王，不過起碼先要學會認得撲克牌吧~"
					elseif prov == --[[!AUTO_268]]"臺灣省" then
						return --[[!AUTO_269]]"臺灣：啊喲！沒關係啦！你錢帶得不多哦，就先回台中去吧，我死也不會借給你的啦！"
					else
						return --[[!AUTO_270]]"我是『"..prov..--[[!AUTO_271]]"』的，大家加個好友哈，以後一起玩！"

					end
				end
			},

			["Self"]  =
			{
				ContentFunc = function()
					local snsInfo = GameApi.GetPlayerSnsInfo(0)
					local prov  = snsInfo["province"]
					local hostfull = GameApi.GetPlayerFullProp(0)
					local host = hostfull["name"]
					if	prov == --[[!AUTO_272]]"無" then
						return --[[!AUTO_273]]"您還沒有填寫縣市資訊，您可以在名片內詳填個人資訊~"
					elseif prov == --[[!AUTO_274]]"北京" then
						return --[[!AUTO_275]]"北京：朝廷苛捐雜稅，去“養心殿”遞個奏摺都要買門票，『"..host..--[[!AUTO_276]]"』羞澀的摸摸乾癟的銀袋。"
					elseif prov == --[[!AUTO_277]]"天津" then
						return --[[!AUTO_278]]"天津：天后宮是求子的，關鍵我第一步還沒邁出，痛苦沉思ing……"
					elseif prov == --[[!AUTO_279]]"河北省" then
						return --[[!AUTO_280]]"河北：我的秦皇島捕魚日記，第一天，浪大吐了，第二天，浪大吐了，第三天，唉~都吐空了。"
					elseif prov == --[[!AUTO_281]]"山西省" then
						return --[[!AUTO_282]]"山西：他居然去挖墓了！沒想到我說武當山下的古墓中有小龍女，他還真的相信！黑烏鴉帶著……飛過~"
					elseif prov == --[[!AUTO_283]]"內蒙古" then
						return --[[!AUTO_284]]"內蒙古：每當狼群追來的時候，我總是告訴大家，你們先頂住，我去解個手！"
					elseif prov == --[[!AUTO_285]]"遼寧" then
						return --[[!AUTO_286]]"遼寧：他別以為自己是正黃旗就得意，因為目前還是明朝，『"..host..--[[!AUTO_287]]"』淡定的一笑，顯得很有角度。"
					elseif prov == --[[!AUTO_288]]"吉林省" then
						return --[[!AUTO_289]]"吉林：這絕對不是小雞燉蘑菇，他真單純，話說這鍋子裡的鵪鶉他從哪裡抓來的~"
					elseif prov == --[[!AUTO_290]]"上海" then
						return --[[!AUTO_291]]"上海：儂曉得伐，我吃飯想儂，落雨想儂，連的刷牙齒都想儂，儂接受麼好來！"
					elseif prov == --[[!AUTO_292]]"江蘇省" then
						return --[[!AUTO_293]]"江蘇：每次吃著無錫的佳餚，我都內牛滿面，可能真的是太甜了，『"..host..--[[!AUTO_294]]"』無奈的吞下甜肉包。"
					elseif prov == --[[!AUTO_295]]"浙江省" then
						return --[[!AUTO_296]]"浙江：雁蕩山的香魚能存活至今的原因，那是因為山上的那些出家人都是吃素的。"
					elseif prov == --[[!AUTO_297]]"安徽省" then
						return --[[!AUTO_298]]"安徽：黃山，我經常曬被子的那顆松樹，若干年後它走紅了，大家都叫它“迎客松”。"
					elseif prov == --[[!AUTO_299]]"黑龍江省" then
						return --[[!AUTO_300]]"黑龍江：鏡泊湖的確有大鯽魚，可惜都被皇上買去給後宮的妃子煲湯了。"
					elseif prov == --[[!AUTO_301]]"福建省" then
						return --[[!AUTO_302]]"福建：他到底餓了多久，雖然武夷山的大紅袍是好茶，也不至於連渣都嚼著吞了吧！"
					elseif prov == --[[!AUTO_303]]"江西省" then
						return --[[!AUTO_304]]"江西：原來九江名勝“煙水亭”果然不是批發煙和水的小亭啊，我說上次歷史考試怎麼沒及格~"
					elseif prov == --[[!AUTO_305]]"山東省" then
						return --[[!AUTO_306]]"山東：不行，俺不要大馬，俺想出門騎洋車子！"
					elseif prov == --[[!AUTO_307]]"河南省" then
						return --[[!AUTO_308]]"河南：夜登焦作的雲臺山，果然別有一番野趣啊，可以望星、吟詩、唱歌、攀爬、迷路、摔傷、昏迷、撥打110求助。"
					elseif prov == --[[!AUTO_309]]"湖北省" then
						return --[[!AUTO_310]]"湖北：生於千湖之地，最大的杯具就是，我居然吃河鮮過敏~"
					elseif prov == --[[!AUTO_311]]"湖南省" then
						return --[[!AUTO_312]]"湖南：如果不是鳳凰古鎮，陶淵明就寫不出《桃花源記》了，『"..host..--[[!AUTO_313]]"』舔了舔沾滿墨汁的筆尖，記錄到。"
					elseif prov == --[[!AUTO_314]]"廣東省" then
						return --[[!AUTO_315]]"廣東：我這家鋪子叫“包子林”你們要踢館的“寶芝林”在街尾~"
					elseif prov == --[[!AUTO_316]]"廣西" then
						return --[[!AUTO_317]]"廣西：自從去過北海醫院後，我終於知道，吃蛤蜊是要去殼的！"
					elseif prov == --[[!AUTO_318]]"海南省" then
						return --[[!AUTO_319]]"海南：在永慶寺的齋堂，他啃著一隻油膩膩的白斬文昌雞，我頓時明白這是件很挫的事！所以我趕快把手上的白斬文昌雞塞到了背包裡。"
					elseif prov == --[[!AUTO_320]]"重慶" then
						return --[[!AUTO_321]]"重慶：我又夢到好多丁丁貓兒，就是夢裡面沒得掃把抓！"
					elseif prov == --[[!AUTO_322]]"四川省" then
						return --[[!AUTO_323]]"四川：他不用質疑，“三星堆”的這幾個面具，根本就是參考他的長相做的！"
					elseif prov == --[[!AUTO_324]]"貴州省" then
						return --[[!AUTO_325]]"貴州：那次千人齊跳錦雞舞，後來我為什麼哭了？不是因為感動，而是我瞬間被踩了幾千腳。"
					elseif prov == --[[!AUTO_326]]"雲南省" then
						return --[[!AUTO_327]]"雲南：原來西雙版納的潑水節不是人人都穿泳裝上街的啊！丟死人了，我得回去換衣服。"
					elseif prov == --[[!AUTO_328]]"陝西省" then
						return --[[!AUTO_329]]"陝西：自從在秦嶺被金絲猴追打後，我再也不想去了，雖然那件事已經過去很久，但是每當打雷下雨的時候，傷口偶爾還會隱隱作痛。"
					elseif prov == --[[!AUTO_330]]"甘肅省" then
						return --[[!AUTO_331]]"甘肅：“崆峒山”每到山花爛漫的時候，就是我花粉過敏的時候，所以我今天不出門了。"
					elseif prov == --[[!AUTO_332]]"青海省" then
						return --[[!AUTO_333]]"青海：青海湖的水這麼鹹，還好我平時口味重，嗆了這麼多口，還能活下來！"
					elseif prov == --[[!AUTO_334]]"寧夏" then
						return --[[!AUTO_335]]"寧夏：都說來到沙坡頭一定要吃黃河大鯉魚，但是醫生你先別問那麼多了，快幫我把卡喉嚨的刺取出來！~痛"
					elseif prov == --[[!AUTO_336]]"新疆" then
						return --[[!AUTO_337]]"新疆：天山真冷啊……他給我說穿短袖就可以了……等我活著回去，一定滅了他！"
					elseif prov == --[[!AUTO_338]]"西藏" then
						return --[[!AUTO_339]]"西藏：我很平靜的告訴自己，這次在大昭寺買到的假唐卡，回去可以轉送給別人，但是為什麼眼淚又情不自禁的留下-"
					elseif prov == --[[!AUTO_340]]"香港" then
						return --[[!AUTO_341]]"香港：皇后的頭像馬，就是因為“皇后碼（馬）頭”，每次聽他講這個冷笑話，我都有想揍他的衝動！"
					elseif prov == --[[!AUTO_342]]"澳門" then
						return --[[!AUTO_343]]"澳門：媽閣廟看出去，一方景致甚好，海闊天空，外酥內嫩，肥而不膩，實在是讓人感慨~"
					elseif prov == --[[!AUTO_344]]"臺灣省" then
						return --[[!AUTO_345]]"臺灣：“日月潭”和“日月神教”原來真沒有關聯啊？那這麼多年，我一直埋伏錯了地方，師父，我對不起你！~淚奔"
					else
						return --[[!AUTO_346]]"我是『"..prov..--[[!AUTO_347]]"』的，大家加個好友哈，以後一起玩！"

					end
				end

			},

			["Other"] =
			{

				ContentFunc = function()
					local snsInfo = GameApi.GetPlayerSnsInfo(0)
					local prov  = snsInfo["province"]
					local hostfull = GameApi.GetPlayerFullProp(0)
					local host = hostfull["name"]
					local id,name = GameApi.GetHostChatTarget()
					if id == 0 then
						return --[[!AUTO_348]]"您沒有選擇表情對象，您可以在右鍵互動功能表選擇表情對象"
					else
					if	prov == --[[!AUTO_349]]"無" then
						return --[[!AUTO_350]]"您還沒有填寫縣市資訊，您可以在名片內詳填個人資訊~"
					elseif prov == --[[!AUTO_351]]"北京" then
						return --[[!AUTO_352]]"北京：『"..host..--[[!AUTO_353]]"』冷酷的看著『"..name..--[[!AUTO_354]]"』說：我們是來紫禁城修補房頂的，不是玩“決戰紫禁之巔”，放下武器，然後給我老實抬土去。"
					elseif prov == --[[!AUTO_355]]"天津" then
						return --[[!AUTO_356]]"天津：『"..host..--[[!AUTO_357]]"』乖巧的依偎著『"..name..--[[!AUTO_358]]"』，慢慢轉過頭，帶著溫柔的星星眼，你知道為什麼那些狗不理你嗎？因為你的臉好像包子！"
					elseif prov == --[[!AUTO_359]]"河北省" then
						return --[[!AUTO_360]]"河北：『"..host..--[[!AUTO_361]]"』拍了拍手，看著地上躺在的『"..name..--[[!AUTO_362]]"』道，你不知道霍元甲是河北東光縣人士嗎？不過我收拾你這幾招是自創的。"
					elseif prov == --[[!AUTO_363]]"山西省" then
						return --[[!AUTO_364]]"山西：『"..name..--[[!AUTO_365]]"』拿著一張髒兮兮的平遙“日升昌”的銀票遞進窗口時，『"..host..--[[!AUTO_366]]"』青筋頓現，仍舊強顏微笑著說，對不起，我們這裡是銀行！"
					elseif prov == --[[!AUTO_367]]"內蒙古" then
						return --[[!AUTO_368]]"內蒙古：『"..host..--[[!AUTO_369]]"』流著口水對『"..name..--[[!AUTO_370]]"』說:烏蘭巴托的烤全羊味道的確很好，手抓肉也不錯。只是我們兩人的錢加起來，還不夠買個饅頭，所以你還是理智點。"
					elseif prov == --[[!AUTO_371]]"遼寧" then
						return --[[!AUTO_372]]"遼寧：『"..name..--[[!AUTO_373]]"』在鏡頭前表情很不自然，『"..host..--[[!AUTO_374]]"』怒斥道，這是鴨綠江，你背後圍觀幾隻野生的狼虎豹是很正常的。連演只兔子都不會！再來一次！"
					elseif prov == --[[!AUTO_375]]"吉林省" then
						return --[[!AUTO_376]]"吉林：『"..host..--[[!AUTO_377]]"』很羞愧的對『"..name..--[[!AUTO_378]]"』說，本來給你捎了點長白三寶，由於路上太餓，我給嗑掉了，現在就剩我這個寶了，你要嗎?"
					elseif prov == --[[!AUTO_379]]"上海" then
						return --[[!AUTO_380]]"上海：『"..host..--[[!AUTO_381]]"』拍拍『"..name..--[[!AUTO_382]]"』的頭說：小駒頭，乖點，聽吾閒話，我會得喜歡儂咯！"
					elseif prov == --[[!AUTO_383]]"江蘇省" then
						return --[[!AUTO_384]]"江蘇：『"..host..--[[!AUTO_385]]"』可憐的向『"..name..--[[!AUTO_386]]"』哀求，你別在唱你的原創昆曲了，實在是要命啊~"
					elseif prov == --[[!AUTO_387]]"浙江省" then
						return --[[!AUTO_388]]"浙江：『"..host..--[[!AUTO_389]]"』疑惑的看著『"..name..--[[!AUTO_390]]"』，我們來看錢塘潮，你給我套個救生圈，到底有何目的！若想偷踢我落潮，我死也會拖著你一起。"
					elseif prov == --[[!AUTO_391]]"安徽省" then
						return --[[!AUTO_392]]"安徽：走過徽州牌坊區，『"..host..--[[!AUTO_393]]"』遺憾的對『"..name..--[[!AUTO_394]]"』說，要不是因為你當年………，這裡應該還會多立一塊“貞潔牌坊”。"
					elseif prov == --[[!AUTO_395]]"黑龍江省" then
						return --[[!AUTO_396]]"黑龍江：暴雪中的『"..host..--[[!AUTO_397]]"』窩火的對『"..name..--[[!AUTO_398]]"』說，給你說黑龍江這邊的冰燈絕對是冰做的，你還非要去舔，現在粘上面，你叫我怎麼給你弄下來！"
					elseif prov == --[[!AUTO_399]]"福建省" then
						return --[[!AUTO_400]]"福建：『"..host..--[[!AUTO_401]]"』自言自語的笑著說，每次路過“三坊七巷”的這口井，我都會想起當年『"..name..--[[!AUTO_402]]"』失足掉落時驚聲尖叫的樣子！"
					elseif prov == --[[!AUTO_403]]"江西省" then
						return --[[!AUTO_404]]"江西：『"..host..--[[!AUTO_405]]"』翻開手中的劄記，『"..name..--[[!AUTO_406]]"』我再解釋一次，撫州湯顯祖，他絕對不是煲湯的大師！但是他也有可能會煲湯，你懂我的意思哈？"
					elseif prov == --[[!AUTO_407]]"山東省" then
						return --[[!AUTO_408]]"山東：『"..host..--[[!AUTO_409]]"』盯著做了壞事還洋洋自得的『"..name..--[[!AUTO_410]]"』,頓時燃起無明業火，順手抄起一根章丘大蔥把『"..name..--[[!AUTO_411]]"』結結實實的抽了一頓。"
					elseif prov == --[[!AUTO_412]]"河南省" then
						return --[[!AUTO_413]]"河南：『"..host..--[[!AUTO_414]]"』收到一封『"..name..--[[!AUTO_415]]"』的信，你把我遺忘在“龍門石窟”都幾個月了，抽個時間把我領回家吧~求領養~"
					elseif prov == --[[!AUTO_416]]"湖北省" then
						return --[[!AUTO_417]]"湖北：我只所以在“黃鶴樓”給你點一壺“鶴頂紅”完全是為了應景，『"..name..--[[!AUTO_418]]"』你完全不用心存顧忌，來！『"..host..--[[!AUTO_419]]"』說完把酒杯直接遞了過去。"
					elseif prov == --[[!AUTO_420]]"湖南省" then
						return --[[!AUTO_421]]"湖南：湖南沅陵龍舟賽的目的，不是要大家用船槳對打，而是要劃到終點。此刻的『"..host..--[[!AUTO_422]]"』和『"..name..--[[!AUTO_423]]"』已經完全無視裁判和規則，正鬥毆飆血中……"
					elseif prov == --[[!AUTO_424]]"廣東省" then
						return --[[!AUTO_425]]"廣東：『"..host..--[[!AUTO_426]]"』佩服的說到：『"..name..--[[!AUTO_427]]"』你終於吃到了番禺“薑撞奶”了吧，不過這個製作過程能在嘴裡完成，你強了！"
					elseif prov == --[[!AUTO_428]]"廣西" then
						return --[[!AUTO_429]]"廣西：『"..host..--[[!AUTO_430]]"』趁其不備一腳把『"..name..--[[!AUTO_431]]"』踹下“龍脊梯田”，『"..name..--[[!AUTO_432]]"』在“啊啊哦哦”加“哎呀”的聲音中，漸漸消失在梯田的盡頭~"
					elseif prov == --[[!AUTO_433]]"海南省" then
						return --[[!AUTO_434]]"海南：『"..host..--[[!AUTO_435]]"』同情的看著病床上呆呆傻傻的『"..name..--[[!AUTO_436]]"』，溫柔的說:當初叫你不要在亞龍灣爬那顆椰子樹，你就是不聽。"
					elseif prov == --[[!AUTO_437]]"重慶" then
						return --[[!AUTO_438]]"重慶：『"..host..--[[!AUTO_439]]"』把手銬的鑰匙丟進馬桶沖水後，轉身無辜的看著帶著手銬的『"..name..--[[!AUTO_440]]"』說，背時娃兒，我不是故意的！"
					elseif prov == --[[!AUTO_441]]"四川省" then
						return --[[!AUTO_442]]"四川：『"..host..--[[!AUTO_443]]"』認真的盯著『"..name..--[[!AUTO_444]]"』說，每次被你惹生氣的時候，我都好想變成樂山大佛，然後一腳踢你臉上！"
					elseif prov == --[[!AUTO_445]]"貴州省" then
						return --[[!AUTO_446]]"貴州：『"..host..--[[!AUTO_447]]"』拍拍『"..name..--[[!AUTO_448]]"』的肩膀道：“赤水丹霞”只是一種地貌，不是兵器，仙丹。孩子，別找了，趁天還沒黑，趕快回家吧~"
					elseif prov == --[[!AUTO_449]]"雲南省" then
						return --[[!AUTO_450]]"雲南：原來怒江的滑鎖過江，是要把鎖扣在腰上的，不是抓在手上的，『"..host..--[[!AUTO_451]]"』眼睜睜的看著『"..name..--[[!AUTO_452]]"』落到滾滾波濤中~"
					elseif prov == --[[!AUTO_453]]"陝西省" then
						return --[[!AUTO_454]]"陝西：別在為虞姬感傷了~“霸王別雞”現在都是菜名了，『"..name..--[[!AUTO_455]]"』你到底吃不吃，已經吃得滿嘴油的『"..host..--[[!AUTO_456]]"』問到！"
					elseif prov == --[[!AUTO_457]]"甘肅省" then
						return --[[!AUTO_458]]"甘肅：『"..host..--[[!AUTO_459]]"』一本正經的對『"..name..--[[!AUTO_460]]"』說，我說過“月牙泉”是沒有鯨魚的，也沒有鱷魚和蛇頸龍，你可以靠近點。"
					elseif prov == --[[!AUTO_461]]"青海省" then
						return --[[!AUTO_462]]"青海：『"..name..--[[!AUTO_463]]"』每當你看到北極星的時候，你可知道自己錯在哪裡嗎？我們之所以在“可哥西裡”茹毛飲血三年，全是因為你當初沒帶指南針！『"..host..--[[!AUTO_464]]"』平靜的說到。"
					elseif prov == --[[!AUTO_465]]"寧夏" then
						return --[[!AUTO_466]]"寧夏：『"..host..--[[!AUTO_467]]"』惡狠狠的盯著『"..name..--[[!AUTO_468]]"』說，你說沒有倒鬥，你手拿工兵鏟，腰系纜繩，頭戴探照燈，半夜跑來西夏王陵然後給我說是散步？"
					elseif prov == --[[!AUTO_469]]"新疆" then
						return --[[!AUTO_470]]"新疆：咯納斯湖邊，『"..host..--[[!AUTO_471]]"』羡慕的說，『"..name..--[[!AUTO_472]]"』你也出來遛水怪啊，曾經我也有一隻，不過小花去年跳到湖裡了。"
					elseif prov == --[[!AUTO_473]]"西藏" then
						return --[[!AUTO_474]]"西藏：『"..host..--[[!AUTO_475]]"』同情的背著『"..name..--[[!AUTO_476]]"』，早叫你別喝那麼多青稞酒，居然和羊群一起爬到瑪尼堆上睡覺。"
					elseif prov == --[[!AUTO_477]]"香港" then
						return --[[!AUTO_478]]"香港：『"..name..--[[!AUTO_479]]"』興奮的拿出禮物，這包豬肉鬆，是我在香港買的，『"..host..--[[!AUTO_480]]"』滿臉黑線，接過這包商標為“東方之豬”的豬肉鬆。"
					elseif prov == --[[!AUTO_481]]"澳門" then
						return --[[!AUTO_482]]"澳門：『"..host..--[[!AUTO_483]]"』一臉崇拜的看著『"..name..--[[!AUTO_484]]"』，很好，你贏定了，四條A，不過你也死定了，它們都是紅桃的~"
					elseif prov == --[[!AUTO_485]]"臺灣省" then
						return --[[!AUTO_486]]"臺灣：『"..host..--[[!AUTO_487]]"』慚愧的對昏迷『"..name..--[[!AUTO_488]]"』說，我忘了告訴你，我和阿美族去月洞提水的時候，順便抓了只電鰻，由於還沒找到地方養才養到你浴缸裡的。"
					else
						return --[[!AUTO_489]]"我是『"..prov..--[[!AUTO_490]]"』的，大家加個好友哈，以後一起玩！"

					end
					end
			end
			}
		}
	},

	[5] =
	{
		Order   =
		{
			["Native"] = --[[!AUTO_491]]"配偶",
			["Intern"] = --[[!AUTO_492]]"spouse"
		},

		Content =
		{
			["None"]  =
			{
				ContentFunc = function()
					local playerInfo = GameApi.GetPlayerFullProp(0)
					local spouse  = playerInfo["spouse"]
					if spouse == --[[!AUTO_493]]"" then
						return --[[!AUTO_494]]"您還沒有配偶，江湖中哪個大俠甘心形單影隻，快去找到你的另一半浪跡天涯吧！"
					else

						return --[[!AUTO_495]]"也是時候和『"..spouse..--[[!AUTO_496]]"』做一對神仙眷侶了，為什麼要在乎那些旁人眼光。"
					end


				end
			},

			["Self"]  =
			{
				ContentFunc = function()
					local playerInfo = GameApi.GetPlayerFullProp(0)
					local spouse  = playerInfo["spouse"]
					if spouse == --[[!AUTO_497]]"" then
						return --[[!AUTO_498]]"您還沒有配偶，江湖中哪個大俠甘心形單影隻，快去找到你的另一半浪跡天涯吧！"
					else

						return --[[!AUTO_499]]"東邊日出西邊雨，道是無情卻有情，我一生一世，都不會與『"..spouse..--[[!AUTO_500]]"』訣別。"
					end

				end
			},

			["Other"] =
			{

				ContentFunc = function()
					local playerInfo = GameApi.GetPlayerFullProp(0)
					local spouse  = playerInfo["spouse"]
					local hostfull = GameApi.GetPlayerFullProp(0)
					local host = hostfull["name"]
					local id,name = GameApi.GetHostChatTarget()
					if id == 0 then
						return --[[!AUTO_501]]"您沒有選擇表情對象，您可以在右鍵互動功能表選擇表情對象"
					else
					if spouse == --[[!AUTO_502]]"" then
						return --[[!AUTO_503]]"您還沒有配偶，江湖中哪個大俠甘心形單影隻，快去找到你的另一半浪跡天涯吧！"
					else
						return --[[!AUTO_504]]"相見難時別亦難，『"..spouse..--[[!AUTO_505]]"』只要我在身邊，這個江湖永遠都不會孤單。"
					end
					end

				end
			}
		}
	},

	[6] =
	{
		Order   =
		{
			["Native"] = --[[!AUTO_506]]"師傅",
			["Intern"] = --[[!AUTO_507]]"master"
		},

		Content =
		{
			["None"]  =
			{
				ContentFunc = function()
					local playerInfo = GameApi.GetPlayerSnsInfo(0)
					local mastername  = playerInfo["mastername"]
					if mastername == --[[!AUTO_508]]"" then
						return --[[!AUTO_509]]"您還沒有師傅，有了師傅的幫助，升級打怪事倍功半，難道還不心動嗎？"
					else

						return --[[!AUTO_510]]"初來乍道，我特代師尊『"..mastername..--[[!AUTO_511]]"』拜候各位大俠，請各位多多指教。"
					end


				end
			},

			["Self"]  =
			{
				ContentFunc = function()
					local playerInfo = GameApi.GetPlayerSnsInfo(0)
					local mastername  = playerInfo["mastername"]
					if mastername == --[[!AUTO_512]]"" then
						return --[[!AUTO_513]]"您還沒有師傅，有了師傅的幫助，升級打怪事倍功半，難道還不心動嗎？"
					else

						return --[[!AUTO_514]]"不知道『"..mastername..--[[!AUTO_515]]"』師尊何時才捨得把香火錢交給我管啊。"
					end

				end
			},

			["Other"] =
			{

				ContentFunc = function()
					local playerInfo = GameApi.GetPlayerSnsInfo(0)
					local mastername  = playerInfo["mastername"]
					local hostfull = GameApi.GetPlayerFullProp(0)
					local host = hostfull["name"]
					local id,name = GameApi.GetHostChatTarget()
					if id == 0 then
						return --[[!AUTO_516]]"您沒有選擇表情對象，您可以在右鍵互動功能表選擇表情對象"
					else
					if mastername == --[[!AUTO_517]]"" then
						return --[[!AUTO_518]]"您還沒有師傅，有了師傅的幫助，升級打怪事倍功半，難道還不心動嗎？"
					else
						return --[[!AUTO_519]]"『"..name..--[[!AUTO_520]]"』，我家師尊乃『"..mastername..--[[!AUTO_521]]"』也，敢問你有何指教？"
					end
					end

				end
			}
		}
	},
	[7] =
	{
		Order   =
		{
			["Native"] = --[[!AUTO_522]]"結義",
			["Intern"] = --[[!AUTO_523]]"family"
		},

		Content =
		{
			["None"]  =
			{
				ContentFunc = function()
					local playerInfo = GameApi.GetPlayerSnsInfo(0)
					local family  = playerInfo["familyname"]
					if family == --[[!AUTO_524]]"" then
						return --[[!AUTO_525]]"你還沒有結義，快去找幾個志同道合的弟兄，義結金蘭吧！"
					else

						return --[[!AUTO_526]]"『"..family..--[[!AUTO_527]]"』的好兄弟，今日一別何年才能再見呢？"
					end


				end
			},

			["Self"]  =
			{
				ContentFunc = function()
					local playerInfo = GameApi.GetPlayerSnsInfo(0)
					local family  = playerInfo["familyname"]
					if family == --[[!AUTO_528]]"" then
						return --[[!AUTO_529]]"你還沒有結義，快去找幾個志同道合的弟兄，義結金蘭吧！"
					else

						return --[[!AUTO_530]]"今日風清雲淡，我得買壺酒去找我那拜把兄弟『"..family..--[[!AUTO_531]]"』逍遙去。"
					end

				end
			},

			["Other"] =
			{

				ContentFunc = function()
					local playerInfo = GameApi.GetPlayerSnsInfo(0)
					local family  = playerInfo["familyname"]
					local hostfull = GameApi.GetPlayerFullProp(0)
					local host = hostfull["name"]
					local id,name = GameApi.GetHostChatTarget()
					if id == 0 then
						return --[[!AUTO_532]]"您沒有選擇表情對象，您可以在右鍵互動功能表選擇表情對象"
					else
					if family == --[[!AUTO_533]]"" then
						return --[[!AUTO_534]]"你還沒有結義，快去找幾個志同道合的弟兄，義結金蘭吧！"
					else
						return --[[!AUTO_535]]"我與『"..family..--[[!AUTO_536]]"』燒過黃紙，拜過碼頭，說好有福同享，有難同當。"
					end
					end

				end
			}
		}
	},

	[8] =
	{
		Order   =
		{
			["Native"] = --[[!AUTO_537]]"幫派",
			["Intern"] = --[[!AUTO_538]]"faction"
		},

		Content =
		{
			["None"]  =
			{
				ContentFunc = function()
					local playerInfo = GameApi.GetPlayerFullProp(0)
					local faction  = playerInfo["faction"]
					if faction == --[[!AUTO_539]]"" then
						return --[[!AUTO_540]]"你還沒有幫派，快加入幫派，和幫裡的弟兄一起共創江湖吧！"
					else

						return --[[!AUTO_541]]"我們幫派——『"..faction..--[[!AUTO_542]]"』的壓軸好戲就要開台了，各位膽大膽小的都睜大眼睛看好！"
					end


				end
			},

			["Self"]  =
			{
				ContentFunc = function()
					local playerInfo = GameApi.GetPlayerFullProp(0)
					local faction  = playerInfo["faction"]
					if faction == --[[!AUTO_543]]"" then
						return --[[!AUTO_544]]"你還沒有幫派，快加入幫派，和幫裡的弟兄一起共創江湖吧！"
					else

						return --[[!AUTO_545]]"我說過總有一天我也會爬到『"..faction..--[[!AUTO_546]]"』幫主的位置，這叫天命所歸！"
					end

				end
			},

			["Other"] =
			{

				ContentFunc = function()
					local playerInfo = GameApi.GetPlayerFullProp(0)
					local faction  = playerInfo["faction"]
					local hostfull = GameApi.GetPlayerFullProp(0)
					local host = hostfull["name"]
					local id,name = GameApi.GetHostChatTarget()
					if id == 0 then
						return --[[!AUTO_547]]"您沒有選擇表情對象，您可以在右鍵互動功能表選擇表情對象"
					else
					if faction == --[[!AUTO_548]]"" then
						return --[[!AUTO_549]]"你還沒有幫派，快加入幫派，和幫裡的弟兄一起共創江湖吧！"
					else
						return --[[!AUTO_550]]"『"..name..--[[!AUTO_551]]"』你惹到我的後果將是被我們『"..faction..--[[!AUTO_552]]"』的人追殺，一定讓你有生之年生不如死。"
					end
					end

				end
			}
		}
	},


}



	ExprOrder.Cfg[2] =
{

	[1] =
	{
		Order   =
		{
			["Native"] = --[[!AUTO_553]]"打招呼",
			["Intern"] = --[[!AUTO_554]]"hello"
		},

		Content =
		{
			["None"]  =
			{
				ContentFunc = function()
					return --[[!AUTO_555]]"地下跑的，水裡遊的，天上轉的，大家早中晚好啊！"
				end
			},

			["Self"]  =
			{
				ContentFunc = function()
					return --[[!AUTO_556]]"對著鏡子說，你最近混得不錯啊，啥時候有空一起泡泡茶！"
				end
			},

			["Other"] =
			{

				ContentFunc = function()
					local idTarget,name = GameApi.GetHostChatTarget()
						if idTarget > 0 then
						return --[[!AUTO_557]]"從腰間摸出壺酒，給 『"..name..--[[!AUTO_558]]"』滿上一杯，好酒都不見，這濁酒雖差一點，勝在是陳釀。"
					else
					return --[[!AUTO_559]]"請選擇聊天對象。"
					end
				end

			}
		}
	},

	[2] =
	{
		Order   =
		{
			["Native"] = --[[!AUTO_560]]"大笑",
			["Intern"] = --[[!AUTO_561]]"laugh"
		},

		Content =
		{
			["None"]  =
			{
				ContentFunc = function()
					return --[[!AUTO_562]]"哈哈哈哈，只能哈四聲，上次有人哈了十聲，後來他窒息了。"
				end
			},

			["Self"]  =
			{
				ContentFunc = function()
					return --[[!AUTO_563]]"突然遇見挫了幾年的一個人，笑到上氣不接下氣，笑得滿地打滾，一直笑到面部神經抽搐。"
				end
			},

			["Other"] =
			{

				ContentFunc = function()
					local idTarget,name = GameApi.GetHostChatTarget()
						if idTarget > 0 then
						return --[[!AUTO_564]]"看著『"..name..--[[!AUTO_565]]"』實在太想笑了，於是趕快拉著『"..name..--[[!AUTO_566]]"』跑出喪事現場，對著他的臉痛痛快快的笑了一宿。"
					else
					return --[[!AUTO_567]]"請選擇聊天對象。"
					end
				end

			}
		}
	},

	[3] =
	{
		Order   =
		{
			["Native"] = --[[!AUTO_568]]"問候",
			["Intern"] = --[[!AUTO_569]]"courage"
		},

		Content =
		{
			["None"]  =
			{
				ContentFunc = function()
					return --[[!AUTO_570]]"這麼早就上山圍毆老虎啊，大家的體質提高都很快嘛~~"
				end
			},

			["Self"]  =
			{
				ContentFunc = function()
					return --[[!AUTO_571]]"把上半身探出車窗，面帶微笑的給兩邊的路人揮手~這樣就沒人知道我卡住了……"
				end
			},

			["Other"] =
			{

				ContentFunc = function()
					local idTarget,name = GameApi.GetHostChatTarget()
						if idTarget > 0 then
						return --[[!AUTO_572]]"急忙握住『"..name..--[[!AUTO_573]]"』的手，山頂上的朋友，看你的背簍，就知道咱村豐收了！"
					else
					return --[[!AUTO_574]]"請選擇聊天對象。"
					end
				end

			}
		}
	},

	[4] =
	{
		Order   =
		{
			["Native"] = --[[!AUTO_575]]"謝謝1",
			["Intern"] = --[[!AUTO_576]]"thanks1"
		},

		Content =
		{
			["None"]  =
			{
				ContentFunc = function()
					return --[[!AUTO_577]]"感謝蒼天啊!一出門就砸冰雹，一進門就停。"
				end
			},

			["Self"]  =
			{
				ContentFunc = function()
					return --[[!AUTO_578]]"rap:謝~他叫小謝，沒啥差別，但千萬別到外國說謝，它的發音很像那個~OH謝！"
				end
			},

			["Other"] =
			{

				ContentFunc = function()
					local hostfull = GameApi.GetPlayerFullProp(0)
					local host = hostfull["name"]
					local idTarget,name = GameApi.GetHostChatTarget()
						if idTarget > 0 then
						return --[[!AUTO_579]]"望著『"..name..--[[!AUTO_580]]"』走來，越來越近，越來越近，簡直就是腳尖貼腳尖，鼻尖頂鼻尖的時候，『"..host..--[[!AUTO_581]]"』突然說“我只在這個距離說謝謝！”"
					else
					return --[[!AUTO_582]]"請選擇聊天對象。"
					end
				end

			}
		}
	},

	[5] =
	{
		Order   =
		{
			["Native"] = --[[!AUTO_583]]"謝謝2",
			["Intern"] = --[[!AUTO_584]]"thanks2"
		},

		Content =
		{
			["None"]  =
			{
				ContentFunc = function()
					return --[[!AUTO_585]]"謝謝CCV,TV，謝謝我的爸（抽泣1次）爸媽媽！還有一直（抽泣2次）支持我的粉絲！謝謝大家！"
				end
			},

			["Self"]  =
			{
				ContentFunc = function()
					return --[[!AUTO_586]]"老師只教了謝謝和重謝，沒有教過不用謝！"
				end
			},

			["Other"] =
			{

				ContentFunc = function()
					local hostfull = GameApi.GetPlayerFullProp(0)
					local host = hostfull["name"]
					local idTarget,name = GameApi.GetHostChatTarget()
						if idTarget > 0 then
						return --[[!AUTO_587]]"太空中，『"..name..--[[!AUTO_588]]"』右手托起月亮，左手攬著星星眼的『"..host..--[[!AUTO_589]]"』，風中淩亂的『"..host..--[[!AUTO_590]]"』崇拜的望著『"..name..--[[!AUTO_591]]"』，thank！My hero！"
					else
					return --[[!AUTO_592]]"請選擇聊天對象。"
					end
				end

			}
		}
	},

	[6] =
	{
		Order   =
		{
			["Native"] = --[[!AUTO_593]]"再見1",
			["Intern"] = --[[!AUTO_594]]"bye1"
		},

		Content =
		{
			["None"]  =
			{
				ContentFunc = function()
					return --[[!AUTO_595]]"要吃飯，睡覺，沐浴，更衣，so~大家再見~"
				end
			},

			["Self"]  =
			{
				ContentFunc = function()
					return --[[!AUTO_596]]"另一個自己，再見！"
				end
			},

			["Other"] =
			{

				ContentFunc = function()
					local idTarget,name = GameApi.GetHostChatTarget()
						if idTarget > 0 then
						return --[[!AUTO_597]]"我……可能不能陪你了，『"..name..--[[!AUTO_598]]"』，以後希望你幸福……我吃完飯就回來~"
					else
					return --[[!AUTO_599]]"請選擇聊天對象。"
					end
				end

			}
		}
	},

	[7] =
	{
		Order   =
		{
			["Native"] = --[[!AUTO_600]]"再見2",
			["Intern"] = --[[!AUTO_601]]"bye2"
		},

		Content =
		{
			["None"]  =
			{
				ContentFunc = function()
					return --[[!AUTO_602]]"即然相別於江湖，那就再別也於江湖好了~"
				end
			},

			["Self"]  =
			{
				ContentFunc = function()
					return --[[!AUTO_603]]"再見！西出羊關無故人！那是因為裡面都是羊！"
				end
			},

			["Other"] =
			{

				ContentFunc = function()
					local idTarget,name = GameApi.GetHostChatTarget()
						if idTarget > 0 then
						return --[[!AUTO_604]]"握著電話對『"..name..--[[!AUTO_605]]"』說：借你的錢…喂…這裡訊號不好……喂喂……再見！"
					else
					return --[[!AUTO_606]]"請選擇聊天對象。"
					end
				end

			}
		}
	},

	[8] =
	{
		Order   =
		{
			["Native"] = --[[!AUTO_607]]"再見3",
			["Intern"] = --[[!AUTO_608]]"bye3"
		},

		Content =
		{
			["None"]  =
			{
				ContentFunc = function()
					return --[[!AUTO_609]]"再見！（這是有史以來，最正經的一次，所以尾碼特別加長！）"
				end
			},

			["Self"]  =
			{
				ContentFunc = function()
					return --[[!AUTO_610]]"哈哈哈哈，我不會和你說再見的，因為我還會回來的！"
				end
			},

			["Other"] =
			{

				ContentFunc = function()
					local idTarget,name = GameApi.GetHostChatTarget()
						if idTarget > 0 then
						return --[[!AUTO_611]]"正正經經的對『"..name..--[[!AUTO_612]]"』認認真真的唱到“我怕我沒有機會，對你說一聲再見”。停，就到這，這首歌其它部分不用寫了！"
					else
					return --[[!AUTO_613]]"請選擇聊天對象。"
					end
				end

			}
		}
	},

	[9] =
	{
		Order   =
		{
			["Native"] = --[[!AUTO_614]]"讚揚1",
			["Intern"] = --[[!AUTO_615]]"praise1"
		},

		Content =
		{
			["None"]  =
			{
				ContentFunc = function()
					return --[[!AUTO_616]]"果然除了NPC，個個都不是等閒之輩啊……"
				end
			},

			["Self"]  =
			{
				ContentFunc = function()
					return --[[!AUTO_617]]"每次看到你，我都想說：你就是強！"
				end
			},

			["Other"] =
			{

				ContentFunc = function()
					local idTarget,name = GameApi.GetHostChatTarget()
						if idTarget > 0 then
						return --[[!AUTO_618]]"拍拍『"..name..--[[!AUTO_619]]"』的肩膀，我本來想用天津快板誇你的，後來想想……這樣場面會變得很慫。"
					else
					return --[[!AUTO_620]]"請選擇聊天對象。"
					end
				end

			}
		}
	},

	[10] =
	{
		Order   =
		{
			["Native"] = --[[!AUTO_621]]"讚揚2",
			["Intern"] = --[[!AUTO_622]]"praise2"
		},

		Content =
		{
			["None"]  =
			{
				ContentFunc = function()
					return --[[!AUTO_623]]"好！高！強啊！所以大家努力繼續好高強吧！"
				end
			},

			["Self"]  =
			{
				ContentFunc = function()
					return --[[!AUTO_624]]"真是煩惱，果然用盡天下所有詞，都描繪不出我嘴角完美的一笑！"
				end
			},

			["Other"] =
			{

				ContentFunc = function()
					local idTarget,name = GameApi.GetHostChatTarget()
						if idTarget > 0 then
						return --[[!AUTO_625]]"大喊道：『"..name..--[[!AUTO_626]]"』你簡直是酣暢淋漓，明媒正娶，翻江倒海！我詞彙量少，以上就算讚揚吧！"
					else
					return --[[!AUTO_627]]"請選擇聊天對象。"
					end
				end

			}
		}
	},

}

ExprOrder.Cfg[3] =
{

	[1] =
	{
		Order   =
		{
			["Native"] = --[[!AUTO_628]]"愛人",
			["Intern"] = --[[!AUTO_629]]"lover"
		},

		Content =
		{
			["None"]  =
			{
				ContentFunc = function()
					return --[[!AUTO_630]]"君當做磐石，妾當做蒲葦。蒲葦韌入絲，磐石不一定。"
				end
			},

			["Self"]  =
			{
				ContentFunc = function()
					return --[[!AUTO_631]]"驀然回首，那人卻在，燈火欄杆處。"
				end
			},

			["Other"] =
			{

				ContentFunc = function()
					local idTarget,name = GameApi.GetHostChatTarget()
						if idTarget > 0 then
						return --[[!AUTO_632]]"深情的對『"..name..--[[!AUTO_633]]"』說，我……愛……你……做的菜！我終於說出那三個字了！"
					else
					return --[[!AUTO_634]]"請選擇聊天對象。"
					end
				end

			}
		}
	},

	[2] =
	{
		Order   =
		{
			["Native"] = --[[!AUTO_635]]"仇人",
			["Intern"] = --[[!AUTO_636]]"enemy"
		},

		Content =
		{
			["None"]  =
			{
				ContentFunc = function()
					return --[[!AUTO_637]]"此恨綿綿，不共戴天，君子報酬，十年不給，且看蒼天饒過誰！"
				end
			},

			["Self"]  =
			{
				ContentFunc = function()
					return --[[!AUTO_638]]"等我吃完飯，我就去老師家告狀。"
				end
			},

			["Other"] =
			{

				ContentFunc = function()
					local idTarget,name = GameApi.GetHostChatTarget()
						if idTarget > 0 then
						return --[[!AUTO_639]]"雖然『"..name..--[[!AUTO_640]]"』你死期未到，不過，在我眼中你早已經過期了，掙紮個啥！受死吧！"
					else
					return --[[!AUTO_641]]"請選擇聊天對象。"
					end
				end

			}
		}
	},

	[3] =
	{
		Order   =
		{
			["Native"] = --[[!AUTO_642]]"美女",
			["Intern"] = --[[!AUTO_643]]"beauty"
		},

		Content =
		{
			["None"]  =
			{
				ContentFunc = function()
					return --[[!AUTO_644]]"只要一甩秀髮，必定冠絕天下！"
				end
			},

			["Self"]  =
			{
				ContentFunc = function()
					return --[[!AUTO_645]]"美人在時花滿堂，美人去後餘空床。"
				end
			},

			["Other"] =
			{

				ContentFunc = function()
					local idTarget,name = GameApi.GetHostChatTarget()
						if idTarget > 0 then
						return --[[!AUTO_646]]"自言自語的說，我都不敢看『"..name..--[[!AUTO_647]]"』的臉，的確沒有誇張，實在是芳華~~~~~絕代的芳華~"
					else
					return --[[!AUTO_648]]"請選擇聊天對象。"
					end
				end

			}
		}
	},

	[4] =
	{
		Order   =
		{
			["Native"] = --[[!AUTO_649]]"帥哥",
			["Intern"] = --[[!AUTO_650]]"handsome"
		},

		Content =
		{
			["None"]  =
			{
				ContentFunc = function()
					return --[[!AUTO_651]]"不要提帥鍋兩個字，因為都已經聽膩了！"
				end
			},

			["Self"]  =
			{
				ContentFunc = function()
					return --[[!AUTO_652]]"我這張俊俏的臉，怎麼了得啊！"
				end
			},

			["Other"] =
			{

				ContentFunc = function()
					local idTarget,name = GameApi.GetHostChatTarget()
						if idTarget > 0 then
						return --[[!AUTO_653]]"對『"..name..--[[!AUTO_654]]"』嚴肅的說，不要逼本少爺拿下遮臉的扇子，我怕你經受不起自行慚愧的打擊！"
					else
					return --[[!AUTO_655]]"請選擇聊天對象。"
					end
				end

			}
		}
	},

	[5] =
	{
		Order   =
		{
			["Native"] = --[[!AUTO_656]]"兄弟",
			["Intern"] = --[[!AUTO_657]]"brother"
		},

		Content =
		{
			["None"]  =
			{
				ContentFunc = function()
					return --[[!AUTO_658]]"來呀來個酒啊，不醉不甘休！"
				end
			},

			["Self"]  =
			{
				ContentFunc = function()
					return --[[!AUTO_659]]"我才不要和自己做兄弟！"
				end
			},

			["Other"] =
			{

				ContentFunc = function()
					local idTarget,name = GameApi.GetHostChatTarget()
						if idTarget > 0 then
						return --[[!AUTO_660]]"拉著『"..name..--[[!AUTO_661]]"』的手，快走！這邊腐女太多，我們換個地方再酗酒。"
					else
					return --[[!AUTO_662]]"請選擇聊天對象。"
					end
				end

			}
		}
	},

	[6] =
	{
		Order   =
		{
			["Native"] = --[[!AUTO_663]]"英雄",
			["Intern"] = --[[!AUTO_664]]"hero"
		},

		Content =
		{
			["None"]  =
			{
				ContentFunc = function()
					return --[[!AUTO_665]]"說英雄，誰是英雄？"
				end
			},

			["Self"]  =
			{
				ContentFunc = function()
					return --[[!AUTO_666]]"就算我姓英，我也不會名雄，這樣很容易短命。"
				end
			},

			["Other"] =
			{

				ContentFunc = function()
					local idTarget,name = GameApi.GetHostChatTarget()
						if idTarget > 0 then
						return --[[!AUTO_667]]"對『"..name..--[[!AUTO_668]]"』說，雖然你是英雄，不過吃飯也是要給錢的！誠惠七兩七錢七，不收銀票，欠條。"
					else
					return --[[!AUTO_669]]"請選擇聊天對象。"
					end
				end

			}
		}
	},

	[7] =
	{
		Order   =
		{
			["Native"] = --[[!AUTO_670]]"姐妹",
			["Intern"] = --[[!AUTO_671]]"handsome"
		},

		Content =
		{
			["None"]  =
			{
				ContentFunc = function()
					return --[[!AUTO_672]]"姐妹歸姐妹，銀子要算對！"
				end
			},

			["Self"]  =
			{
				ContentFunc = function()
					return --[[!AUTO_673]]"我就知道姐姐送我的粉底，一定是路邊攤買1送3的便宜貨！"
				end
			},

			["Other"] =
			{

				ContentFunc = function()
					local idTarget,name = GameApi.GetHostChatTarget()
						if idTarget > 0 then
						return --[[!AUTO_674]]"挽過『"..name..--[[!AUTO_675]]"』的手說,姐姐，快來看那個“新一代的開山怪”。"
					else
					return --[[!AUTO_676]]"請選擇聊天對象。"
					end
				end

			}
		}
	},

	[8] =
	{
		Order   =
		{
			["Native"] = --[[!AUTO_677]]"商人",
			["Intern"] = --[[!AUTO_678]]"business"
		},

		Content =
		{
			["None"]  =
			{
				ContentFunc = function()
					return --[[!AUTO_679]]"義莊真不適合擺攤，客人都用紙錢，面值太大，不好找零。"
				end
			},

			["Self"]  =
			{
				ContentFunc = function()
					return --[[!AUTO_680]]"我可愛的小錢袋，每次看到你，腰也不酸了，腿也不痛了！"
				end
			},

			["Other"] =
			{

				ContentFunc = function()
					local idTarget,name = GameApi.GetHostChatTarget()
						if idTarget > 0 then
						return --[[!AUTO_681]]"一笑說：『"..name..--[[!AUTO_682]]"』你這筆爛帳，我十二把算盤算給你看！"
					else
					return --[[!AUTO_683]]"請選擇聊天對象。"
					end
				end

			}
		}
	},

	[9] =
	{
		Order   =
		{
			["Native"] = --[[!AUTO_684]]"速度",
			["Intern"] = --[[!AUTO_685]]"speed"
		},

		Content =
		{
			["None"]  =
			{
				ContentFunc = function()
					return --[[!AUTO_686]]"要練速度啊？打口永春囉！"
				end
			},

			["Self"]  =
			{
				ContentFunc = function()
					return --[[!AUTO_687]]"速度太快，我會吐的……"
				end
			},

			["Other"] =
			{

				ContentFunc = function()
					local idTarget,name = GameApi.GetHostChatTarget()
						if idTarget > 0 then
						return --[[!AUTO_688]]"上氣不接下氣的說，『"..name..--[[!AUTO_689]]"』，等等我，你速度太快了！"
					else
					return --[[!AUTO_690]]"請選擇聊天對象。"
					end
				end

			}
		}
	},

	[10] =
	{
		Order   =
		{
			["Native"] = --[[!AUTO_691]]"力量",
			["Intern"] = --[[!AUTO_692]]"power"
		},

		Content =
		{
			["None"]  =
			{
				ContentFunc = function()
					return --[[!AUTO_693]]"聽說紅內褲外穿的就是那個人，他力氣很大~"
				end
			},

			["Self"]  =
			{
				ContentFunc = function()
					return --[[!AUTO_694]]"下次，再也不去“花鳥市場”買這種捏不爛的核桃了。"
				end
			},

			["Other"] =
			{

				ContentFunc = function()
					local idTarget,name = GameApi.GetHostChatTarget()
						if idTarget > 0 then
						return --[[!AUTO_695]]"怒吼一聲，鷹的眼睛，熊的力……『"..name..--[[!AUTO_696]]"』，快幫我，脫臼了……。”"
					else
					return --[[!AUTO_697]]"請選擇聊天對象。"
					end
				end

			}
		}
	},

	[11] =
	{
		Order   =
		{
			["Native"] = --[[!AUTO_698]]"拍檔",
			["Intern"] = --[[!AUTO_699]]"partners"
		},

		Content =
		{
			["None"]  =
			{
				ContentFunc = function()
					return --[[!AUTO_700]]"哼！一個包，一個抄，肯定是包抄~"
				end
			},

			["Self"]  =
			{
				ContentFunc = function()
					return --[[!AUTO_701]]"多年出生入死，所以有空的時候也常幫他接接孩子，餵餵魚~"
				end
			},

			["Other"] =
			{

				ContentFunc = function()
					local idTarget,name = GameApi.GetHostChatTarget()
						if idTarget > 0 then
						return --[[!AUTO_702]]"無奈的對『"..name..--[[!AUTO_703]]"』說：剛才的暗號手勢不是行動說明，只是我單純的在罵你！"
					else
					return --[[!AUTO_704]]"請選擇聊天對象。"
					end
				end

			}
		}
	},

}

ExprOrder.Cfg[4] =
{

	[1] =
	{
		Order   =
		{
			["Native"] = --[[!AUTO_705]]"親吻",
			["Intern"] = --[[!AUTO_706]]"kiss"
		},

		Content =
		{
			["None"]  =
			{
				ContentFunc = function()
					return --[[!AUTO_707]]"在晦澀的年代，還是不要太OPEN的好！"
				end
			},

			["Self"]  =
			{
				ContentFunc = function()
					return --[[!AUTO_708]]"師父說這個技巧的終極奧義，就是麻花~"
				end
			},

			["Other"] =
			{

				ContentFunc = function()
					local idTarget,name = GameApi.GetHostChatTarget()
						if idTarget > 0 then
						return --[[!AUTO_709]]"深情的對『"..name..--[[!AUTO_710]]"』說，討厭！沒想到你今天居然是榴槤味的~"
					else
					return --[[!AUTO_711]]"請選擇聊天對象。"
					end
				end

			}
		}
	},

	[2] =
	{
		Order   =
		{
			["Native"] = --[[!AUTO_712]]"擁抱",
			["Intern"] = --[[!AUTO_713]]"hug"
		},

		Content =
		{
			["None"]  =
			{
				ContentFunc = function()
					return --[[!AUTO_714]]"天旋地轉的感覺，會導致腦充血，心跳加速~"
				end
			},

			["Self"]  =
			{
				ContentFunc = function()
					return --[[!AUTO_715]]"我還沒自戀到和自己擁抱的地步！"
				end
			},

			["Other"] =
			{

				ContentFunc = function()
					local idTarget,name = GameApi.GetHostChatTarget()
						if idTarget > 0 then
						return --[[!AUTO_716]]"拉過『"..name..--[[!AUTO_717]]"』緊緊的擁入懷中，來！請你盡情的窒息在我的懷抱中吧！"
					else
					return --[[!AUTO_718]]"請選擇聊天對象。"
					end
				end

			}
		}
	},

	[3] =
	{
		Order   =
		{
			["Native"] = --[[!AUTO_719]]"對視",
			["Intern"] = --[[!AUTO_720]]"stare"
		},

		Content =
		{
			["None"]  =
			{
				ContentFunc = function()
					return --[[!AUTO_721]]"怪我好奇心過盛，真是瞎了我這雙眼！"
				end
			},

			["Self"]  =
			{
				ContentFunc = function()
					return --[[!AUTO_722]]"鬥雞眼算嗎？"
				end
			},

			["Other"] =
			{

				ContentFunc = function()
					local idTarget,name = GameApi.GetHostChatTarget()
						if idTarget > 0 then
						return --[[!AUTO_723]]"默默注視著『"..name..--[[!AUTO_724]]"』，親愛的，你今天你最大的不同就是你沒有洗臉！"
					else
					return --[[!AUTO_725]]"請選擇聊天對象。"
					end
				end

			}
		}
	},

	[4] =
	{
		Order   =
		{
			["Native"] = --[[!AUTO_726]]"野餐",
			["Intern"] = --[[!AUTO_727]]"picnic"
		},

		Content =
		{
			["None"]  =
			{
				ContentFunc = function()
					return --[[!AUTO_728]]"看來這裡的環境非常適合野餐，就地取材吧！"
				end
			},

			["Self"]  =
			{
				ContentFunc = function()
					return --[[!AUTO_729]]"該死的野蜂，我今天就算追到天涯海角，也要打死它！"
				end
			},

			["Other"] =
			{

				ContentFunc = function()
					local hostfull = GameApi.GetPlayerFullProp(0)
					local host = hostfull["name"]
					local idTarget,name = GameApi.GetHostChatTarget()
						if idTarget > 0 then
						return --[[!AUTO_730]]"大老遠來珠穆朗瑪峰野餐,『"..name..--[[!AUTO_731]]"』你就帶了兩饅頭，還是旺仔，『"..host..--[[!AUTO_732]]"』憤怒的說到。"
					else
					return --[[!AUTO_733]]"請選擇聊天對象。"
					end
				end

			}
		}
	},

	[5] =
	{
		Order   =
		{
			["Native"] = --[[!AUTO_734]]"電影",
			["Intern"] = --[[!AUTO_735]]"movie"
		},

		Content =
		{
			["None"]  =
			{
				ContentFunc = function()
					return --[[!AUTO_736]]"真是史料未及，這個導演又一次突破了他的下線！"
				end
			},

			["Self"]  =
			{
				ContentFunc = function()
					return --[[!AUTO_737]]"像我這種早場達人，從來不屑他們那些晚場的蟻群。"
				end
			},

			["Other"] =
			{

				ContentFunc = function()
					local idTarget,name = GameApi.GetHostChatTarget()
						if idTarget > 0 then
						return --[[!AUTO_738]]"懷疑的對『"..name..--[[!AUTO_739]]"』說：我不覺得《電鋸驚魂》是一部謳歌伐木業的電影。"
					else
					return --[[!AUTO_740]]"請選擇聊天對象。"
					end
				end

			}
		}
	},

	[6] =
	{
		Order   =
		{
			["Native"] = --[[!AUTO_741]]"表白",
			["Intern"] = --[[!AUTO_742]]"unbruden"
		},

		Content =
		{
			["None"]  =
			{
				ContentFunc = function()
					return --[[!AUTO_743]]"表白這種話一旦說出口，就收不回來了，不少人一直後悔這事。"
				end
			},

			["Self"]  =
			{
				ContentFunc = function()
					return --[[!AUTO_744]]"還是先和大黃先練習下的好！（注：大黃是一隻狗。）"
				end
			},

			["Other"] =
			{

				ContentFunc = function()
					local idTarget,name = GameApi.GetHostChatTarget()
						if idTarget > 0 then
						return --[[!AUTO_745]]"清了一下喉嚨,『"..name..--[[!AUTO_746]]"』，我想對你說，大黃……（和大黃練習次數太多，照成對象混亂。）"
					else
					return --[[!AUTO_747]]"請選擇聊天對象。"
					end
				end

			}
		}
	},

	[7] =
	{
		Order   =
		{
			["Native"] = --[[!AUTO_748]]"定情",
			["Intern"] = --[[!AUTO_749]]"engagein"
		},

		Content =
		{
			["None"]  =
			{
				ContentFunc = function()
					return --[[!AUTO_750]]"羊過當年和小聾女就是一吻定情的！後來他們就被改編了，之前兩人都是買豆腐的！"
				end
			},

			["Self"]  =
			{
				ContentFunc = function()
					return --[[!AUTO_751]]"唉~存錢買戒子ing"
				end
			},

			["Other"] =
			{

				ContentFunc = function()
					local idTarget,name = GameApi.GetHostChatTarget()
						if idTarget > 0 then
						return --[[!AUTO_752]]"『"..name..--[[!AUTO_753]]"』，我說戒子上咱能不鑲鴿子蛋這麼大的鑽石嗎？"
					else
					return --[[!AUTO_754]]"請選擇聊天對象。"
					end
				end

			}
		}
	},

	[8] =
	{
		Order   =
		{
			["Native"] = --[[!AUTO_755]]"蜜語",
			["Intern"] = --[[!AUTO_756]]"sweet"
		},

		Content =
		{
			["None"]  =
			{
				ContentFunc = function()
					return --[[!AUTO_757]]"這種肉麻的話，兩個人私底下肉麻就好了，需要在武林大會用擴音器喊出來嗎！"
				end
			},

			["Self"]  =
			{
				ContentFunc = function()
					return --[[!AUTO_758]]"全身都是，雞皮疙瘩~"
				end
			},

			["Other"] =
			{

				ContentFunc = function()
					local idTarget,name = GameApi.GetHostChatTarget()
						if idTarget > 0 then
						return --[[!AUTO_759]]"好奇的盯著『"..name..--[[!AUTO_760]]"』，心想：居然用《獾豬哥哥》的對白來敷衍我，一點創意都沒有！"
					else
					return --[[!AUTO_761]]"請選擇聊天對象。"
					end
				end

			}
		}
	},

	[9] =
	{
		Order   =
		{
			["Native"] = --[[!AUTO_762]]"約會",
			["Intern"] = --[[!AUTO_763]]"date"
		},

		Content =
		{
			["None"]  =
			{
				ContentFunc = function()
					return --[[!AUTO_764]]"地點黑木崖，暗號我奈你！但是你更奈我！"
				end
			},

			["Self"]  =
			{
				ContentFunc = function()
					return --[[!AUTO_765]]"這是常有的事兒~"
				end
			},

			["Other"] =
			{

				ContentFunc = function()
					local idTarget,name = GameApi.GetHostChatTarget()
						if idTarget > 0 then
						return --[[!AUTO_766]]"無奈的問到，『"..name..--[[!AUTO_767]]"』，為什麼我們約會地點是“夕陽紅老年公社匯演預選賽”的現場。"
					else
					return --[[!AUTO_768]]"請選擇聊天對象。"
					end
				end

			}
		}
	},

	[10] =
	{
		Order   =
		{
			["Native"] = --[[!AUTO_769]]"情歌",
			["Intern"] = --[[!AUTO_770]]"song"
		},

		Content =
		{
			["None"]  =
			{
				ContentFunc = function()
					return --[[!AUTO_771]]"“當初是你要分開，分開就分開~”這首神曲，就素很難絕跡於江湖的那種~"
				end
			},

			["Self"]  =
			{
				ContentFunc = function()
					return --[[!AUTO_772]]"學了很多首，最後自己開始原創了。"
				end
			},

			["Other"] =
			{

				ContentFunc = function()
					local idTarget,name = GameApi.GetHostChatTarget()
						if idTarget > 0 then
						return --[[!AUTO_773]]"深情的說，『"..name..--[[!AUTO_774]]"』，許多年以後，你一定會回來和我一起唱這首歌的，紅星閃閃放光芒……"
					else
					return --[[!AUTO_775]]"請選擇聊天對象。"
					end
				end

			}
		}
	},


}

ExprOrder.Cfg[5] =
{

	[1] =
	{
		Order   =
		{
			["Native"] = --[[!AUTO_776]]"跳舞",
			["Intern"] = --[[!AUTO_777]]"dance"
		},

		Content =
		{
			["None"]  =
			{
				ContentFunc = function()
					return --[[!AUTO_778]]"問世界，誰才能真正的稱霸“舞林”"
				end
			},

			["Self"]  =
			{
				ContentFunc = function()
					return --[[!AUTO_779]]"個人而言還是喜歡鬥牛~"
				end
			},

			["Other"] =
			{

				ContentFunc = function()
					local idTarget,name = GameApi.GetHostChatTarget()
						if idTarget > 0 then
						return --[[!AUTO_780]]"冷汗淋漓的看著地上的『"..name..--[[!AUTO_781]]"』，你下次再跳“彩帶舞”把自己給捆住的話，別叫我救你！"
					else
					return --[[!AUTO_782]]"請選擇聊天對象。"
					end
				end

			}
		}
	},

	[2] =
	{
		Order   =
		{
			["Native"] = --[[!AUTO_783]]"揮手",
			["Intern"] = --[[!AUTO_784]]"wave"
		},

		Content =
		{
			["None"]  =
			{
				ContentFunc = function()
					return --[[!AUTO_785]]"最後向地球揮揮手，阿波羅30號的能量已經徹底耗完，即將被氣流捲入宇宙中。"
				end
			},

			["Self"]  =
			{
				ContentFunc = function()
					return --[[!AUTO_786]]"煩惱！再見！"
				end
			},

			["Other"] =
			{

				ContentFunc = function()
					local idTarget,name = GameApi.GetHostChatTarget()
						if idTarget > 0 then
						return --[[!AUTO_787]]"焦急的對遠方的『"..name..--[[!AUTO_788]]"』揮手，示意他別在往前走了，地上有個大坑，可惜已經晚了……"
					else
					return --[[!AUTO_789]]"請選擇聊天對象。"
					end
				end

			}
		}
	},

	[3] =
	{
		Order   =
		{
			["Native"] = --[[!AUTO_790]]"圍毆",
			["Intern"] = --[[!AUTO_791]]"beat"
		},

		Content =
		{
			["None"]  =
			{
				ContentFunc = function()
					return --[[!AUTO_792]]"圍毆就是，勾結少林十八銅人，然後痛痛快快扁一個人！"
				end
			},

			["Self"]  =
			{
				ContentFunc = function()
					return --[[!AUTO_793]]"我人品好，不會的！"
				end
			},

			["Other"] =
			{

				ContentFunc = function()
					local idTarget,name = GameApi.GetHostChatTarget()
						if idTarget > 0 then
						return --[[!AUTO_794]]"拿出一包衛生紙丟給灰塵滿身的『"..name..--[[!AUTO_795]]"』，不是叫你擦鼻血，去把地擦了！"
					else
					return --[[!AUTO_796]]"請選擇聊天對象。"
					end
				end

			}
		}
	},

	[4] =
	{
		Order   =
		{
			["Native"] = --[[!AUTO_797]]"跌倒",
			["Intern"] = --[[!AUTO_798]]"tumble"
		},

		Content =
		{
			["None"]  =
			{
				ContentFunc = function()
					return --[[!AUTO_799]]"一摔數百步，中無雜樹，芳草鮮美，落英繽紛~"
				end
			},

			["Self"]  =
			{
				ContentFunc = function()
					return --[[!AUTO_800]]"唉喲~我的門牙~"
				end
			},

			["Other"] =
			{

				ContentFunc = function()
					local hostfull = GameApi.GetPlayerFullProp(0)
					local host = hostfull["name"]
					local idTarget,name = GameApi.GetHostChatTarget()
						if idTarget > 0 then
						return --[[!AUTO_801]]"不小心摔倒在『"..name..--[[!AUTO_802]]"』面前，但是他一記“鯉魚打挺“起身，拍拍灰塵說：酷哦！"
					else
					return --[[!AUTO_803]]"請選擇聊天對象。"
					end
				end

			}
		}
	},

	[5] =
	{
		Order   =
		{
			["Native"] = --[[!AUTO_804]]"吃",
			["Intern"] = --[[!AUTO_805]]"eat"
		},

		Content =
		{
			["None"]  =
			{
				ContentFunc = function()
					return --[[!AUTO_806]]"民以食為天~"
				end
			},

			["Self"]  =
			{
				ContentFunc = function()
					return --[[!AUTO_807]]"我不挑食的，所以，請我吃飯吧~"
				end
			},

			["Other"] =
			{

				ContentFunc = function()
					local idTarget,name = GameApi.GetHostChatTarget()
						if idTarget > 0 then
						return --[[!AUTO_808]]"用力往遠處扔出一塊骨頭，然後看著『"..name..--[[!AUTO_809]]"』興奮的追了過去~"
					else
					return --[[!AUTO_810]]"請選擇聊天對象。"
					end
				end

			}
		}
	},

	[6] =
	{
		Order   =
		{
			["Native"] = --[[!AUTO_811]]"發呆",
			["Intern"] = --[[!AUTO_812]]"dazed"
		},

		Content =
		{
			["None"]  =
			{
				ContentFunc = function()
					return --[[!AUTO_813]]"發呆太久，眼睛會合不上了，然後一直流淚~"
				end
			},

			["Self"]  =
			{
				ContentFunc = function()
					return --[[!AUTO_814]]"啊！發呆太入神，這裡是哪裡！"
				end
			},

			["Other"] =
			{

				ContentFunc = function()
					local idTarget,name = GameApi.GetHostChatTarget()
						if idTarget > 0 then
						return --[[!AUTO_815]]"看著床上的『"..name..--[[!AUTO_816]]"』，沒想到當初你說要發會兒呆，一發就發了三年~"
					else
					return --[[!AUTO_817]]"請選擇聊天對象。"
					end
				end

			}
		}
	},

	[7] =
	{
		Order   =
		{
			["Native"] = --[[!AUTO_818]]"奔跑",
			["Intern"] = --[[!AUTO_819]]"run"
		},

		Content =
		{
			["None"]  =
			{
				ContentFunc = function()
					return --[[!AUTO_820]]"奔跑速度再快，該栽的時候一樣會栽~"
				end
			},

			["Self"]  =
			{
				ContentFunc = function()
					return --[[!AUTO_821]]"我是個專業的宅男！"
				end
			},

			["Other"] =
			{

				ContentFunc = function()
					local idTarget,name = GameApi.GetHostChatTarget()
						if idTarget > 0 then
						return --[[!AUTO_822]]"『"..name..--[[!AUTO_823]]"』,這個山頭的掃雷任務就交給你了，反正你跑得快不會有事的，去吧~我知道你放黑白照片的抽屜！"
					else
					return --[[!AUTO_824]]"請選擇聊天對象。"
					end
				end

			}
		}
	},

	[8] =
	{
		Order   =
		{
			["Native"] = --[[!AUTO_825]]"游泳",
			["Intern"] = --[[!AUTO_826]]"swim"
		},

		Content =
		{
			["None"]  =
			{
				ContentFunc = function()
					return --[[!AUTO_827]]"沒想到是來得快，沉得更快，就因為沒人肯頂一下~"
				end
			},

			["Self"]  =
			{
				ContentFunc = function()
					return --[[!AUTO_828]]"想潛個水，沒想到就抽筋了~潛水什麼的最討厭了！"
				end
			},

			["Other"] =
			{

				ContentFunc = function()
					local idTarget,name = GameApi.GetHostChatTarget()
						if idTarget > 0 then
						return --[[!AUTO_829]]"看著『"..name..--[[!AUTO_830]]"』說：你長得像青蛙，就不要學蛙泳了！"
					else
					return --[[!AUTO_831]]"請選擇聊天對象。"
					end
				end

			}
		}
	},

	[9] =
	{
		Order   =
		{
			["Native"] = --[[!AUTO_832]]"輕功",
			["Intern"] = --[[!AUTO_833]]"fly"
		},

		Content =
		{
			["None"]  =
			{
				ContentFunc = function()
					return --[[!AUTO_834]]"剛才飛過去的不是流星雨，應該是一群高手中的高手！"
				end
			},

			["Self"]  =
			{
				ContentFunc = function()
					return --[[!AUTO_835]]"一葦渡江這招已經太寒酸了~"
				end
			},

			["Other"] =
			{

				ContentFunc = function()
					local idTarget,name = GameApi.GetHostChatTarget()
						if idTarget > 0 then
						return --[[!AUTO_836]]"看著地上的『"..name..--[[!AUTO_837]]"』冷笑到：我這把瑞士5.56毫米SG550狙擊步槍還行吧？看你還敢不敢來我家炫耀輕功。"
					else
					return --[[!AUTO_838]]"請選擇聊天對象。"
					end
				end

			}
		}
	},

	[10] =
	{
		Order   =
		{
			["Native"] = --[[!AUTO_839]]"咳嗽",
			["Intern"] = --[[!AUTO_840]]"cough"
		},

		Content =
		{
			["None"]  =
			{
				ContentFunc = function()
					return --[[!AUTO_841]]"這種咳嗽是典型的喝水嗆著的！"
				end
			},

			["Self"]  =
			{
				ContentFunc = function()
					return --[[!AUTO_842]]"我是不會被隔離的！"
				end
			},

			["Other"] =
			{

				ContentFunc = function()
					local idTarget,name = GameApi.GetHostChatTarget()
						if idTarget > 0 then
						return --[[!AUTO_843]]"關心的把藥水餵到『"..name..--[[!AUTO_844]]"』口中，『"..name..--[[!AUTO_845]]"』內牛滿面：我很感動，不過我是咳嗽，這個藥水是治痢疾的~"
					else
					return --[[!AUTO_846]]"請選擇聊天對象。"
					end
				end

			}
		}
	},

	[11] =
	{
		Order   =
		{
			["Native"] = --[[!AUTO_847]]"泡茶",
			["Intern"] = --[[!AUTO_848]]"tea"
		},

		Content =
		{
			["None"]  =
			{
				ContentFunc = function()
					return --[[!AUTO_849]]"功夫茶只有功夫高強的人，才有資格泡~"
				end
			},

			["Self"]  =
			{
				ContentFunc = function()
					return --[[!AUTO_850]]"烏龍能泡，還能耍~"
				end
			},

			["Other"] =
			{

				ContentFunc = function()
					local idTarget,name = GameApi.GetHostChatTarget()
						if idTarget > 0 then
						return --[[!AUTO_851]]"觀賞『"..name..--[[!AUTO_852]]"』最近練成的茶道，點點頭說，你們老師教的是磨咖啡！"
					else
					return --[[!AUTO_853]]"請選擇聊天對象。"
					end
				end

			}
		}
	},


}

ExprOrder.Cfg[6] =
{

	[1] =
	{
		Order   =
		{
			["Native"] = --[[!AUTO_854]]"高興",
			["Intern"] = --[[!AUTO_855]]"happy"
		},

		Content =
		{
			["None"]  =
			{
				ContentFunc = function()
					return --[[!AUTO_856]]"真是無法言語的快樂啊，來吧！牽起對方手，然後露出花癡一般純真的微笑旋轉吧，俠士。"
				end
			},

			["Self"]  =
			{
				ContentFunc = function()
					return --[[!AUTO_857]]"今天我非常高興，我要把我這種快樂傳遞給大家，傳遞給在座的每一位……晚會體還真是很晚會"
				end
			},

			["Other"] =
			{

				ContentFunc = function()
					local idTarget,name = GameApi.GetHostChatTarget()
						if idTarget > 0 then
						return --[[!AUTO_858]]"『"..name..--[[!AUTO_859]]"』#2你門牙這麼大，很適合做出快樂的表情啊~"
					else
					return --[[!AUTO_860]]"請選擇聊天對象。"
					end
				end

			}
		}
	},

	[2] =
	{
		Order   =
		{
			["Native"] = --[[!AUTO_861]]"難過",
			["Intern"] = --[[!AUTO_862]]"sad"
		},

		Content =
		{
			["None"]  =
			{
				ContentFunc = function()
					return --[[!AUTO_863]]"這種憂傷無法釋懷，交叉傳染給了路過的每一個無辜人士。"
				end
			},

			["Self"]  =
			{
				ContentFunc = function()
					return --[[!AUTO_864]]"我只想一個人安安靜靜的去河邊抽支煙，別來打擾我。"
				end
			},

			["Other"] =
			{

				ContentFunc = function()
					local idTarget,name = GameApi.GetHostChatTarget()
						if idTarget > 0 then
						return --[[!AUTO_865]]"『"..name..--[[!AUTO_866]]"』，，你知道我今天有多難過嗎？陪我去看海吧~難過就要去看海。"
					else
					return --[[!AUTO_867]]"請選擇聊天對象。"
					end
				end

			}
		}
	},

	[3] =
	{
		Order   =
		{
			["Native"] = --[[!AUTO_868]]"痛快",
			["Intern"] = --[[!AUTO_869]]"tongkuai"
		},

		Content =
		{
			["None"]  =
			{
				ContentFunc = function()
					return --[[!AUTO_870]]"心情大好，老闆再來碗鹵牛肉，今天誰做東？"
				end
			},

			["Self"]  =
			{
				ContentFunc = function()
					return --[[!AUTO_871]]"每次大把花銀子真的很痛快，當然也伴隨著痛苦。"
				end
			},

			["Other"] =
			{

				ContentFunc = function()
					local idTarget,name = GameApi.GetHostChatTarget()
						if idTarget > 0 then
						return --[[!AUTO_872]]"『"..name..--[[!AUTO_873]]"』你說話倒是痛快，就是沒幾句說到做到的。"
					else
					return --[[!AUTO_874]]"請選擇聊天對象。"
					end
				end

			}
		}
	},

	[4] =
	{
		Order   =
		{
			["Native"] = --[[!AUTO_875]]"抑鬱",
			["Intern"] = --[[!AUTO_876]]"unhappy"
		},

		Content =
		{
			["None"]  =
			{
				ContentFunc = function()
					return --[[!AUTO_877]]"唉~愛情~唉~銀子~唉~葵花寶典，我都沒有。"
				end
			},

			["Self"]  =
			{
				ContentFunc = function()
					return --[[!AUTO_878]]"沒想到一夜之間，頭髮居然白了黑，黑了白，我到底怎麼了？"
				end
			},

			["Other"] =
			{

				ContentFunc = function()
					local hostfull = GameApi.GetPlayerFullProp(0)
					local host = hostfull["name"]
					local idTarget,name = GameApi.GetHostChatTarget()
						if idTarget > 0 then
						return --[[!AUTO_879]]"我明白『"..name..--[[!AUTO_880]]"』最抑鬱的時候，就是他早晨起床的那一刹那。"
					else
					return --[[!AUTO_881]]"請選擇聊天對象。"
					end
				end

			}
		}
	},

	[5] =
	{
		Order   =
		{
			["Native"] = --[[!AUTO_882]]"激動",
			["Intern"] = --[[!AUTO_883]]"exciting"
		},

		Content =
		{
			["None"]  =
			{
				ContentFunc = function()
					return --[[!AUTO_884]]"這滴眼淚不是從眼框流落的，它是激動到說不出話所以從眼角給逼出來的。"
				end
			},

			["Self"]  =
			{
				ContentFunc = function()
					return --[[!AUTO_885]]"我不知道對鏡子練習這個表情，到底有多大的意義。"
				end
			},

			["Other"] =
			{

				ContentFunc = function()
					local hostfull = GameApi.GetPlayerFullProp(0)
					local host = hostfull["name"]
					local idTarget,name = GameApi.GetHostChatTarget()
						if idTarget > 0 then
						return --[[!AUTO_886]]"『"..name..--[[!AUTO_887]]"』……你……你……看我激動的表情，這是內心戲，明白？"
					else
					return --[[!AUTO_888]]"請選擇聊天對象。"
					end
				end

			}
		}
	},

	[6] =
	{
		Order   =
		{
			["Native"] = --[[!AUTO_889]]"幻想",
			["Intern"] = --[[!AUTO_890]]"fantacy"
		},

		Content =
		{
			["None"]  =
			{
				ContentFunc = function()
					return --[[!AUTO_891]]"我記得古代的插圖上，凡是在幻想的人，頭上都會冒泡。"
				end
			},

			["Self"]  =
			{
				ContentFunc = function()
					return --[[!AUTO_892]]"總有一天，我會變成NPC，我會讓那些擺地攤的統統給我上貢。"
				end
			},

			["Other"] =
			{

				ContentFunc = function()
					local idTarget,name = GameApi.GetHostChatTarget()
						if idTarget > 0 then
						return --[[!AUTO_893]]"『"..name..--[[!AUTO_894]]"』你怎麼可以這樣子，你忘了曾經我一個人左手抗BOSS，右手打BOSS保護你的歲月嗎？"
					else
					return --[[!AUTO_895]]"請選擇聊天對象。"
					end
				end

			}
		}
	},

	[7] =
	{
		Order   =
		{
			["Native"] = --[[!AUTO_896]]"怒火",
			["Intern"] = --[[!AUTO_897]]"angry"
		},

		Content =
		{
			["None"]  =
			{
				ContentFunc = function()
					return --[[!AUTO_898]]"喜怒無常的人，容易短命，所以要經常保持心態平和。"
				end
			},

			["Self"]  =
			{
				ContentFunc = function()
					return --[[!AUTO_899]]"就算我對自己發怒，也不會打自己一頓，這是原則問題。"
				end
			},

			["Other"] =
			{

				ContentFunc = function()
					local idTarget,name = GameApi.GetHostChatTarget()
						if idTarget > 0 then
						return --[[!AUTO_900]]"『"..host..--[[!AUTO_901]]"』指著『"..name..--[[!AUTO_902]]"』的鼻子，整個開始燃燒起來，熊熊烈焰將其包圍。"
					else
					return --[[!AUTO_903]]"請選擇聊天對象。"
					end
				end

			}
		}
	},

	[8] =
	{
		Order   =
		{
			["Native"] = --[[!AUTO_904]]"感慨",
			["Intern"] = --[[!AUTO_905]]"gankai"
		},

		Content =
		{
			["None"]  =
			{
				ContentFunc = function()
					return --[[!AUTO_906]]"滿天風雨下西樓，西樓客滿趕我走！"
				end
			},

			["Self"]  =
			{
				ContentFunc = function()
					return --[[!AUTO_907]]"唉，人不可以長得這麼好看，這也許是懲罰吧！"
				end
			},

			["Other"] =
			{

				ContentFunc = function()
					local idTarget,name = GameApi.GetHostChatTarget()
						if idTarget > 0 then
						return --[[!AUTO_908]]"感慨是要吟詩的，『"..name..--[[!AUTO_909]]"』你會吟嗎？你有我能吟嗎？那我就吟了，你注意聽我吟。"
					else
					return --[[!AUTO_910]]"請選擇聊天對象。"
					end
				end

			}
		}
	},

	[9] =
	{
		Order   =
		{
			["Native"] = --[[!AUTO_911]]"焦躁",
			["Intern"] = --[[!AUTO_912]]"jiaozao"
		},

		Content =
		{
			["None"]  =
			{
				ContentFunc = function()
					return --[[!AUTO_913]]"焦躁會讓人速度變快，甚至會快到滿天暗器在眼前變成定格加特寫。"
				end
			},

			["Self"]  =
			{
				ContentFunc = function()
					return --[[!AUTO_914]]"『"..host..--[[!AUTO_915]]"』用力抓住自己的頭髮，呲牙裂嘴的把自己拖了出去。"
				end
			},

			["Other"] =
			{

				ContentFunc = function()
					local idTarget,name = GameApi.GetHostChatTarget()
						if idTarget > 0 then
						return --[[!AUTO_916]]"『"..host..--[[!AUTO_917]]"』一盆冷水潑在『"..name..--[[!AUTO_918]]"』身上，現在是不是能冷靜下來了，那就回去換套衣服先。"
					else
					return --[[!AUTO_919]]"請選擇聊天對象。"
					end
				end

			}
		}
	},

	[10] =
	{
		Order   =
		{
			["Native"] = --[[!AUTO_920]]"多疑",
			["Intern"] = --[[!AUTO_921]]"duoyi"
		},

		Content =
		{
			["None"]  =
			{
				ContentFunc = function()
					return --[[!AUTO_922]]"東廠的人混在其中，恐怕他們的目的不是買回血藥這麼簡單。"
				end
			},

			["Self"]  =
			{
				ContentFunc = function()
					return --[[!AUTO_923]]"鏡中人的人看了我三天三夜，他難道以為我會大意的睡著。"
				end
			},

			["Other"] =
			{

				ContentFunc = function()
					local idTarget,name = GameApi.GetHostChatTarget()
						if idTarget > 0 then
						return --[[!AUTO_924]]"『"..name..--[[!AUTO_925]]"』你做那些事，我可都知道，你打算做哪些事，我也知道，所以你最好本份點。"
					else
					return --[[!AUTO_926]]"請選擇聊天對象。"
					end
				end

			}
		}
	},

	[11] =
	{
		Order   =
		{
			["Native"] = --[[!AUTO_927]]"分裂",
			["Intern"] = --[[!AUTO_928]]"fenlie"
		},

		Content =
		{
			["None"]  =
			{
				ContentFunc = function()
					return --[[!AUTO_929]]"不對，令狐沖練成《葵花寶典》就帶“東方不敗”離開了中原，後來還生了個兒子“令狐東”這事大家都知道。"
				end
			},

			["Self"]  =
			{
				ContentFunc = function()
					return --[[!AUTO_930]]"雖然我不認識你，但是我想請你喝茶。好啊！不如就去街尾”得意茶樓“好了。"
				end
			},

			["Other"] =
			{

				ContentFunc = function()
					local idTarget,name = GameApi.GetHostChatTarget()
						if idTarget > 0 then
						return --[[!AUTO_931]]"我是鼎鼎大名的“公孫爵”，『"..name..--[[!AUTO_932]]"』！你說認識『"..host..--[[!AUTO_933]]"』？哼！這人膽子真夠大，連本少都敢冒充。"
					else
					return --[[!AUTO_934]]"請選擇聊天對象。"
					end
				end

			}
		}
	},

	[12] =
	{
		Order   =
		{
			["Native"] = --[[!AUTO_935]]"哀傷",
			["Intern"] = --[[!AUTO_936]]"aishang"
		},

		Content =
		{
			["None"]  =
			{
				ContentFunc = function()
					return --[[!AUTO_937]]"聽聞有兩把神器，一把名為“霜之”一把名為“哀傷”，被北方的蠻夷盜走後，熔煉成了一把名器。"
				end
			},

			["Self"]  =
			{
				ContentFunc = function()
					return --[[!AUTO_938]]"實在太哀傷了，居然趁我切洋蔥的時候，專程跑來放這種失戀的歌，看我不下樓收拾這群小兔崽子！"
				end
			},

			["Other"] =
			{

				ContentFunc = function()
					local idTarget,name = GameApi.GetHostChatTarget()
						if idTarget > 0 then
						return --[[!AUTO_939]]"『"..name..--[[!AUTO_940]]"』，我好難過，你可以借個肩膀給我用嗎？我要右邊的，肉多。"
					else
					return --[[!AUTO_941]]"請選擇聊天對象。"
					end
				end

			}
		}
	},


}

