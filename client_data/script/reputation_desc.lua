--[[#tag push auto]]


--[[常用文本，DESCRIPTION＝描述，NAME＝名称]]
REPUTATION01DESCRIPTION = --[[!AUTO_1]]"魅力"
REPUTATION01NAME = --[[!AUTO_2]]"收取禮物獲得"
REPUTATION02DESCRIPTION = --[[!AUTO_3]]"人緣"
REPUTATION02NAME = --[[!AUTO_4]]"自己升級，好友好感度增加，師徒"
REPUTATION06DESCRIPTION = --[[!AUTO_5]]"武鬥值"
REPUTATION06NAME = --[[!AUTO_6]]"在地宮擊殺其他玩家搶奪資源獲得的聲望"
REPUTATION24DESCRIPTION = --[[!AUTO_7]]"當前剩餘的幫派貢獻值"
REPUTATION24NAME = --[[!AUTO_8]]"當前幫貢"
REPUTATION38DESCRIPTION = --[[!AUTO_9]]"福州城聲望"
REPUTATION38NAME = --[[!AUTO_10]]"福州城"
REPUTATION39DESCRIPTION = --[[!AUTO_11]]"衡山城聲望"
REPUTATION39NAME = --[[!AUTO_12]]"衡山城"
REPUTATION40DESCRIPTION = --[[!AUTO_13]]"洛陽城聲望"
REPUTATION40NAME = --[[!AUTO_14]]"洛陽城"
REPUTATION44DESCRIPTION = --[[!AUTO_15]]"善緣"
REPUTATION44NAME = --[[!AUTO_16]]"帶小號，帶徒弟獲得的聲望"
REPUTATION45DESCRIPTION = --[[!AUTO_17]]"比武幣"
REPUTATION45NAME = --[[!AUTO_18]]"比武場獲得的聲望"
REPUTATION111DESCRIPTION = --[[!AUTO_19]]"貢獻度"
REPUTATION111NAME = --[[!AUTO_20]]"貢獻度"
REPUTATION152DESCRIPTION = --[[!AUTO_31]]"捉迷藏聲望"
REPUTATION152NAME = --[[!AUTO_32]]"捉迷藏聲望"
REPUTATION153DESCRIPTION = --[[!AUTO_31]]"金水菩提"
REPUTATION153NAME = --[[!AUTO_32]]"金水菩提"
REPUTATION172DESCRIPTION = --[[!AUTO_21]]"遊俠戰績"
REPUTATION172NAME = --[[!AUTO_22]]"遊俠戰績"
REPUTATION173DESCRIPTION = --[[!AUTO_23]]"龍幣"
REPUTATION173NAME = --[[!AUTO_24]]"龍幣"
REPUTATION193DESCRIPTION = --[[!AUTO_25]]"余杭聲望"
REPUTATION193NAME = --[[!AUTO_26]]"余杭"
REPUTATION194DESCRIPTION = --[[!AUTO_27]]"南疆聲望"
REPUTATION194NAME = --[[!AUTO_28]]"南疆"
REPUTATION197DESCRIPTION = --[[!AUTO_29]]"通寶"
REPUTATION197NAME = --[[!AUTO_30]]"通寶"
REPUTATION200DESCRIPTION = --[[!AUTO_17]]"比武勝點"
REPUTATION200NAME = --[[!AUTO_18]]"匹配比武獲得的聲望"
REPUTATION210DESCRIPTION = "寶銀"
REPUTATION210NAME = "寶銀"
REPUTATION211DESCRIPTION = "花魁值"
REPUTATION211NAME = "花魁值"
REPUTATION212DESCRIPTION = "情聖值"
REPUTATION212NAME = "情聖值"
REPUTATION222DESCRIPTION = "喜悅度"
REPUTATION222NAME = "喜悅度"
REPUTATION225DESCRIPTION = "門派貢獻"
REPUTATION225NAME = "門派貢獻"

reputationclass_definition = {}
--[[reputationclass_definition为声望分类（显示分类）定义，包括：

	name		分类名

	rep_phase	各阶段声望值

	name_phase	各阶段名称

	clr_phase	各阶段颜色，例如1红2黄3绿4蓝，需通知界面]]
reputationclass_definition[1] = {name = --[[!AUTO_31]]"人物聲望" , phasenumber = 7 , rep_phase = {0 , 500 , 1500 , 5000 , 15000 , 50000 , 150000 } , name_phase = {--[[!AUTO_32]]"鮮為人知" , --[[!AUTO_33]]"長江後浪" , --[[!AUTO_34]]"青出於藍" , --[[!AUTO_35]]"草木知威" , --[[!AUTO_36]]"師道尊嚴" , --[[!AUTO_37]]"高朋滿座" , --[[!AUTO_38]]"人中之龍"} , clr_phase = {2 , 2 , 3 , 3 , 4 , 4 , 5}}
reputationclass_definition[2] = {name = --[[!AUTO_39]]"江湖聲望" , phasenumber = 7 , rep_phase = {0 , 500 , 1500 , 5000 , 15000 , 50000 , 150000 } , name_phase = {--[[!AUTO_40]]"不見經傳" , --[[!AUTO_41]]"初出茅廬" , --[[!AUTO_42]]"小有名氣" , --[[!AUTO_43]]"乘風破浪" , --[[!AUTO_44]]"出類拔萃" , --[[!AUTO_45]]"自成一家" , --[[!AUTO_46]]"威風八面"} , clr_phase = {2 , 2 , 3 , 3 , 4 , 4 , 5}}
reputationclass_definition[3] = {name = --[[!AUTO_47]]"勢力聲望" , phasenumber = 6 , rep_phase = {0 , 2000 , 6000 , 12500 , 21500 ,33500} , name_phase = {--[[!AUTO_48]]"中立" , --[[!AUTO_49]]"友好" , --[[!AUTO_50]]"親密" , --[[!AUTO_51]]"尊敬" , --[[!AUTO_52]]"顯赫" , --[[!AUTO_53]]"崇拜"} , clr_phase = {2 , 3 , 3 , 4 , 4, 5}}
reputationclass_definition[4] = {name = --[[!AUTO_54]]"武鬥聲望" , phasenumber = 7 , rep_phase = {0 , 500 , 1500 , 5000 , 15000 , 50000 , 150000 } , name_phase = {--[[!AUTO_55]]"默默無聞" , --[[!AUTO_56]]"羽翼未豐" , --[[!AUTO_57]]"身經百戰" , --[[!AUTO_58]]"初露崢嶸" , --[[!AUTO_59]]"威震一方" , --[[!AUTO_60]]"如雷貫耳" , --[[!AUTO_61]]"所向披靡"} , clr_phase = {2 , 2 , 3 , 3 , 4 , 4 , 5}}
reputationclass_definition[5] = {name = --[[!AUTO_62]]"門派貢獻" , phasenumber = 1 , rep_phase = {0} , name_phase = {--[[!AUTO_63]]""} , clr_phase = {1}}
reputationclass_definition[6] = {name = --[[!AUTO_64]]"武林等級" , phasenumber = 30 , rep_phase = {0 , 10 , 100 , 200 , 300 , 400 , 500 , 600 , 700 , 800 , 900 , 1000 , 1100 , 1200 , 1300 , 1400 , 1500 , 1600 , 1700 , 1800 , 1900 , 2000 , 2100 , 2200 , 2300 , 2400 , 2500 , 2600 , 2700 , 2800} , name_phase = { --[[!AUTO_65]]"0級" , --[[!AUTO_66]]"一級" , --[[!AUTO_67]]"二級" , --[[!AUTO_68]]"三級" , --[[!AUTO_69]]"四級" , --[[!AUTO_70]]"五級", --[[!AUTO_71]]"六級" , --[[!AUTO_72]]"七級" , --[[!AUTO_73]]"八級", --[[!AUTO_74]]"九級" , --[[!AUTO_75]]"初段" , --[[!AUTO_76]]"一段" , --[[!AUTO_77]]"二段" , --[[!AUTO_78]]"三段" , --[[!AUTO_79]]"四段" , --[[!AUTO_80]]"五段" , --[[!AUTO_81]]"六段" , --[[!AUTO_82]]"七段" , --[[!AUTO_83]]"八段" , --[[!AUTO_84]]"九段" , --[[!AUTO_85]]"初位" , --[[!AUTO_86]]"一位" , --[[!AUTO_87]]"二位" , --[[!AUTO_88]]"三位" , --[[!AUTO_89]]"四位" , --[[!AUTO_90]]"五位" , --[[!AUTO_91]]"六位" , --[[!AUTO_92]]"七位" , --[[!AUTO_93]]"八位" , --[[!AUTO_94]]"九位"  } , clr_phase = {2 , 2 , 2 , 2 , 2 , 2 , 2 , 2 , 2 , 2 , 3 , 3 , 3 , 3 , 3 , 3 , 3 , 3 , 3 , 3 , 4 , 4 , 4 , 4 , 4 , 4 , 4 , 4 , 4 , 4}}
reputationclass_definition[7] = {name = --[[!AUTO_95]]"城市聲望" , phasenumber = 6 , rep_phase = {0 , 3000 , 11000 , 23000 , 48000 , 88000 } , name_phase = {--[[!AUTO_96]]"中立" , --[[!AUTO_97]]"友好" , --[[!AUTO_98]]"親密" , --[[!AUTO_99]]"尊敬" , --[[!AUTO_100]]"顯赫" , --[[!AUTO_101]]"崇拜"} , clr_phase = {2 , 3 , 3 , 4 , 4 , 5}}
reputationclass_definition[8] = {name = --[[!AUTO_102]]"江湖名望" , phasenumber = 1 , rep_phase = {0} , name_phase = {--[[!AUTO_103]]""} , clr_phase = {1}}
reputationclass_definition[10] = {name = --[[!AUTO_104]]"活動次數" , phasenumber = 1 , rep_phase = {0} , name_phase = {--[[!AUTO_105]]""} , clr_phase = {1}}
reputationclass_definition[9] = {name = --[[!AUTO_106]]"待定" , phasenumber = 1 , rep_phase = {0} , name_phase = {--[[!AUTO_107]]""} , clr_phase = {1}}	--[[默认备用，这种情况下不显示声望数值和进度]]


reputation_definition = {}
--[[reputation_definition部分为声望定义，目前有32条，包括：

	id
	class		声望类型
	name		名称
	desc		描述]]
reputation_definition[1] = {class = 1 , note = --[[!AUTO_108]]"魅力" , name = REPUTATION01NAME , desc = REPUTATION01DESCRIPTION , img = --[[!AUTO_109]]"" }
reputation_definition[2] = {class = 1 , note = --[[!AUTO_110]]"人緣" , name = REPUTATION02NAME , desc = REPUTATION02DESCRIPTION , img = --[[!AUTO_111]]"" }
reputation_definition[6] = {class = 4 , note = --[[!AUTO_112]]"武鬥值" , name = REPUTATION03NAME , desc = REPUTATION06DESCRIPTION , img = --[[!AUTO_113]]"" }
reputation_definition[24] = {class = 9 , note = --[[!AUTO_114]]"當前幫貢" , name = REPUTATION24NAME , desc = REPUTATION24DESCRIPTION , img = --[[!AUTO_115]]"" }
reputation_definition[38] = {class = 7 , note = --[[!AUTO_116]]"福州城" , name = REPUTATION38NAME , desc = REPUTATION38DESCRIPTION , img = --[[!AUTO_117]]"" }
reputation_definition[39] = {class = 7 , note = --[[!AUTO_118]]"衡山城" , name = REPUTATION39NAME , desc = REPUTATION39DESCRIPTION , img = --[[!AUTO_119]]"" }
reputation_definition[40] = {class = 3 , note = --[[!AUTO_120]]"洛陽城" , name = REPUTATION40NAME , desc = REPUTATION40DESCRIPTION , img = --[[!AUTO_121]]"" }
reputation_definition[44] = {class = 1 , note = --[[!AUTO_122]]"善緣" , name = REPUTATION44NAME , desc = REPUTATION44DESCRIPTION , img = --[[!AUTO_123]]"" }
reputation_definition[45] = {class = 9 , note = --[[!AUTO_124]]"比武幣" , name = REPUTATION45NAME , desc = REPUTATION45DESCRIPTION , img = --[[!AUTO_125]]"" }
reputation_definition[111] = {class = 3 , note = --[[!AUTO_126]]"貢獻度" , name = REPUTATION111NAME , desc = REPUTATION111DESCRIPTION , img = --[[!AUTO_127]]"" }
reputation_definition[152] = {class = 9 , note = "捉迷藏聲望" , name = REPUTATION152NAME , desc = REPUTATION152DESCRIPTION , img = "" }
reputation_definition[153] = {class = 9 , note = "金水菩提" , name = REPUTATION153NAME , desc = REPUTATION153DESCRIPTION , img = "" }
reputation_definition[172] = {class = 3 , note = --[[!AUTO_128]]"遊俠戰績" , name = REPUTATION172NAME , desc = REPUTATION172DESCRIPTION , img = --[[!AUTO_129]]"" }
reputation_definition[173] = {class = 3 , note = --[[!AUTO_130]]"龍幣" , name = REPUTATION173NAME , desc = REPUTATION173DESCRIPTION , img = --[[!AUTO_131]]"" }
reputation_definition[193] = {class = 3 , note = --[[!AUTO_132]]"余杭" , name = REPUTATION193NAME , desc = REPUTATION193DESCRIPTION , img = --[[!AUTO_133]]"" }
reputation_definition[194] = {class = 3 , note = --[[!AUTO_134]]"南疆" , name = REPUTATION194NAME , desc = REPUTATION194DESCRIPTION , img = --[[!AUTO_135]]"" }
reputation_definition[197] = {class = 9 , note = --[[!AUTO_136]]"通寶" , name = REPUTATION197NAME , desc = REPUTATION197DESCRIPTION , img = --[[!AUTO_137]]"" }
reputation_definition[200] = {class = 9 , note = --[[!AUTO_136]]"比武勝點" , name = REPUTATION200NAME , desc = REPUTATION200DESCRIPTION , img = --[[!AUTO_137]]"" }
reputation_definition[210] = {class = 9 , note = "寶銀" , name = REPUTATION210NAME , desc = REPUTATION210DESCRIPTION , img = "" }
reputation_definition[211] = {class = 9 , note = "花魁值" , name = REPUTATION210NAME , desc = REPUTATION210DESCRIPTION , img = "" }
reputation_definition[212] = {class = 9 , note = "情聖值" , name = REPUTATION210NAME , desc = REPUTATION210DESCRIPTION , img = "" }
reputation_definition[222] = {class = 9 , note = "喜悅度" , name = REPUTATION222NAME , desc = REPUTATION222DESCRIPTION , img = "" }
reputation_definition[225] = {class = 5 , note = "門派貢獻" , name = REPUTATION225NAME , desc = REPUTATION225DESCRIPTION , img = "" }



--取各声望线名称

--function reputation_definition:GetReputationNote()
--	local note_tab = {};
--	local k, v;
--	for k, v in pairs(self) do
--		table.insert(note_tab, v.note);
--	end
--	return note_tab;
--end

---主函数，从程序取得声望id，声望数值value，接口为"GetReputationdesc1()"
---返回客户端显示用数值，repclass（声望种类），repname（声望名称），repdesc（声望描述），repimg（声望图片）, repphasename（阶段名称），showprogress（进度条数字），showcolor（进度条颜色），showpercent（进度条进度）

Reputation_desc1 = {}

function Reputation_desc1:GetReputationdesc1(id, value)

	if reputation_definition[id] == nil then return end

	local repclassid , repname , repdesc , repimg = reputation_definition[id].class , reputation_definition[id].note , reputation_definition[id].desc , reputation_definition[id].img
	local repclassname , phasenumber , phaserep , phasename , phaseclr = reputationclass_definition[repclassid].name , reputationclass_definition[repclassid].phasenumber , reputationclass_definition[repclassid].rep_phase , reputationclass_definition[repclassid].name_phase , reputationclass_definition[repclassid].clr_phase
	local repphaseid = 1

---找到是声望的第几段

	if phasenumber == 1 then
		repphaseid = 1
	else
		for i=1 , phasenumber do
			if value < phaserep[i] then break end
			repphaseid = i
		end
	end

	local repphasename = phasename[repphaseid]
	local showcolor = phaseclr[repphaseid]
	local showprogress , showpercent = --[[!AUTO_138]]"" , 0

	if phasenumber ~= 1 then
		local currep , curphase = 0 , 0
		if repphaseid == phasenumber then
			--currep = phaserep[repphaseid] - phaserep[repphaseid - 1]  新的一级上限是规定的数值本身

            currep = phaserep[repphaseid]
			curphase = currep
			showpercent = 1
		else
			--currep = value - phaserep[repphaseid]
			currep = value
			--curphase = phaserep[repphaseid + 1] - phaserep[repphaseid]
			curphase = phaserep[repphaseid + 1]
			showpercent = currep / curphase
		end
		showprogress = string.format(--[[!AUTO_139]]"%d%s%d" , currep , --[[!AUTO_140]]"/" , curphase)
	else
		showpercent = 1
		showprogress = string.format(--[[!AUTO_141]]"%d點" , value)
	end


	return repclassname , repname , repdesc , repimg , repphasename , showprogress , showcolor , showpercent
end

--[[
---测试声望输出是否正确
local repid = 19
local repvalue = 100

--StdPrint("输入声望类型(1,2,3,...,100)：")
--repid=io.read("*number")

--StdPrint("输入声望数值(int)：")
--repvalue=io.read("*number")

local repclassname , repname , repdesc , _ , repphasename , showprogress , showcolor , showpercent = Reputation_desc1:GetReputationdesc1(28, 100)

local repstr = string.format("%s%s%s%s%s%s%s%s%s%s%s%s%s" , "声望名称：\t" , repname , "\n声望类型：\t" , repclassname , "\n声望阶段：\t" , repphasename , "\n显示数值：\t" , showprogress , "\n显示比例：\t" , showpercent*100 , "%\n显示颜色：\t" , showcolor , "\n")

LogPrint(repstr)
]]--
