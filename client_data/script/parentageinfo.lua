Parentage = {}

Parentage.Info = {
	{id = 1 , icon = 9488 , name = "^88b25f血魔" , skill = 0 },
	{id = 2 , icon = 9493 , name = "^ffffff夜叉" , skill = 0 },
	{id = 3 , icon = 9498 , name = "^ff9494阎罗" , skill = 0 },
	{id = 4 , icon = 9503 , name = "^8ca3d1天魔" , skill = 0 },
	{id = 5 , icon = 9508 , name = "^caae57无常" , skill = 0 },
	{id = 6 , icon = 9489 , name = "^88b25f罪魔" , skill = 0 },
	{id = 7 , icon = 9494 , name = "^ffffff死魔" , skill = 0 },
	{id = 8 , icon = 9499 , name = "^ff9494孟婆" , skill = 0 },
	{id = 9 , icon = 9504 , name = "^8ca3d1判官" , skill = 0 },
	{id = 10 , icon = 9509 , name = "^caae57心魔" , skill = 0 },
	{id = 11 , icon = 9490 , name = "^88b25f贪狼" , skill = 0 },
	{id = 12 , icon = 9495 , name = "^ffffff七杀" , skill = 0 },
	{id = 13 , icon = 9500 , name = "^ff9494武曲" , skill = 0 },
	{id = 14 , icon = 9505 , name = "^8ca3d1破军" , skill = 0 },
	{id = 15 , icon = 9510 , name = "^caae57文曲" , skill = 0 },
	{id = 16 , icon = 9491 , name = "^88b25f夸父" , skill = 2531 },
	{id = 17 , icon = 9492 , name = "^88b25f盘古" , skill = 2522 },
	{id = 18 , icon = 9506 , name = "^8ca3d1黄帝" , skill = 2525 },
	{id = 19 , icon = 9511 , name = "^caae57东皇" , skill = 2526 },
	{id = 20 , icon = 9501 , name = "^ff9494螺祖" , skill = 2524 },
	{id = 21 , icon = 9496 , name = "^ffffff祝融" , skill = 2527 },
	{id = 22 , icon = 9497 , name = "^ffffff伏羲" , skill = 2523 },
	{id = 23 , icon = 9502 , name = "^ff9494混沌" , skill = 2529 },
	{id = 24 , icon = 9512 , name = "^caae57神农" , skill = 2528 },
	{id = 25 , icon = 9507 , name = "^8ca3d1女蜗" , skill = 2530 },
}

Parentage.Affect = {
	{1000,0,500,0,0,0,0,0},
	{0,1000,500,0,0,0,0,0},
	{0,500,1000,0,0,0,0,0},
	{0,0,0,1000,500,0,0,0},					   
	{0,500,0,0,1000,0,0,0},
	{1000,0,0,0,500,0,0,0},
	{500,1000,0,0,0,0,0,0},
	{0,0,1000,500,0,0,0,0},
	{500,0,0,1000,0,0,0,0},
	{0,0,0,500,1000,0,0,0},
	{2000,0,0,0,0,0,0,0},
	{0,2000,0,0,0,0,0,0},
	{0,0,2000,0,0,0,0,0},
	{0,0,0,2000,0,0,0,0},
	{0,0,0,0,2000,0,0,0},					   
	{2000,2000,0,0,0,0,0,0},
	{2000,0,2000,0,0,0,0,0},
	{2000,0,0,2000,0,0,0,0},
	{2000,0,0,0,2000,0,0,0},
	{0,2000,2000,0,0,0,0,0},
	{0,2000,0,2000,0,0,0,0},
	{0,2000,0,0,2000,0,0,0},
	{0,0,2000,2000,0,0,0,0},
	{0,0,2000,0,2000,0,0,0},
	{0,0,0,2000,2000,0,0,0}
}

Parentage.Eat = {  ----血 = 木，外攻 = 金，外防 = 火，内攻 = 水，内防 = 土；
	{},
	{},
	{},
	{},
	{},
	{},
	{},
	{},
	{},
	{},
	{},
	{},
	{},
	{},
	{},
	{5,10,15,19,24},
	{5,10,15,19,24},
	{3,8,13,20,23},
	{4,9,14,18,25},
	{2,7,12,21,22},
	{1,6,11,16,17},
	{1,6,11,16,17},
	{2,7,12,21,22},
	{4,9,14,18,25},
	{3,8,13,20,23},
}

Parentage.Chemical = {
	{ {6,11} },
	{ {7,12} },
	{ {8,13} },
	{ {9,14} },
	{ {10,15} },
	{ {1,11} },
	{ {2,12} },
	{ {3,13} },
	{ {4,14} },
	{ {5,15} },
	{ {12,16},{13,17},{14,18},{15,19} },
	{ {11,16},{13,20},{14,21},{15,22} },
	{ {11,17},{12,20},{14,23},{15,24} },
	{ {11,18},{12,21},{13,23},{15,25} },
	{ {11,19},{12,22},{13,24},{14,25} },
	{},
	{},
	{},
	{},
	{},
	{},
	{},
	{},
	{},
	{}
}

Parentage.TipInfo = {
	{iconpath = "06410低级木血统1.dds", desc1 = 1, desc2 = 3, remark = "^d7c4a2我讨厌血，因为它又脏又臭，但我以此为生。\r　　　　　　　　　　　——血魔"},
	{iconpath = "06415低级金血统1.dds", desc1 = 2, desc2 = 3, remark = "^d7c4a2黑暗能带来很多伤痛，只有我享受于其中。\r　　　　　　　　　　　——夜叉"},
	{iconpath = "06420低级火血统1.dds", desc1 = 2, desc2 = 3, remark = "^d7c4a2如果你觉得“六道轮回”是一种惩罚，那此刻请你正视我的眼睛。\r　　　　　　　　　　　——阎罗"},
	{iconpath = "06425低级水血统1.dds", desc1 = 4, desc2 = 5, remark = "^d7c4a2遍地尸骸又如何？我无需解释。\r　　　　　　　　　　　——天魔"},
	{iconpath = "06430低级土血统1.dds", desc1 = 2, desc2 = 5, remark = "^d7c4a2你不应该召唤我出来，我只和死人打交道。\r　　　　　　　　　　　——无常"},
	{iconpath = "06411低级木血统2.dds", desc1 = 1, desc2 = 5, remark = "^d7c4a2人都有罪，即不得饶恕，那就让其爆发到极致。\r　　　　　　　　　　　——罪魔"},
	{iconpath = "06416低级金血统2.dds", desc1 = 1, desc2 = 2, remark = "^d7c4a2死亡将来的时候，我要大家都睁大眼睛看清楚。\r　　　　　　　　　　　——死魔"},
	{iconpath = "06421低级火血统2.dds", desc1 = 3, desc2 = 4, remark = "^d7c4a2人能忘掉一些东西，未必不是一种福气。\r　　　　　　　　　　　——孟婆"},
	{iconpath = "06426低级水血统2.dds", desc1 = 1, desc2 = 4, remark = "^d7c4a2当人无法审视自己罪孽的时候，我就能帮到他们。\r　　　　　　　　　　　——判官"},
	{iconpath = "06431低级土血统2.dds", desc1 = 4, desc2 = 5, remark = "^d7c4a2潜在心中所历经的各种罪与罚，我都会一一奉还。\r　　　　　　　　　　　——心魔"},
	{iconpath = "06412贪狼星君.dds", desc1 = 1, desc2 = 0, remark = "^d7c4a2也许世人仰望星空的时候，才会感觉到狼的孤独。\r　　　　　　　　　——贪狼星魂"},
	{iconpath = "06417七杀星君.dds", desc1 = 2, desc2 = 0, remark = "^d7c4a2都说人心能包容一切，却搁不下我的杀戮。\r　　　　　　　　　——七杀羽神"},
	{iconpath = "06422武曲星君.dds", desc1 = 3, desc2 = 0, remark = "^d7c4a2我的泪不是垂怜世人，而是宣告屠杀开始。\r　　　　　　　　　　　——武曲"},
	{iconpath = "06427破军星君.dds", desc1 = 4, desc2 = 0, remark = "^d7c4a2我的苏醒将会是一场灾难，你准备好了吗？\r　　　　　　　　　　——破军烈"},
	{iconpath = "06432文曲星君.dds", desc1 = 5, desc2 = 0, remark = "^d7c4a2我敢傲视众神，因为唯我有此资格。\r　　　　　　　　　　　——文曲"},
	{iconpath = "06413夸父.dds", desc1 = 1, desc2 = 2, remark = "^d7c4a2只有最靠近太阳的地方，尔等才能获知那个秘密。\r　　　　　　　　　　　——夸父"},
	{iconpath = "06414盘古.dds", desc1 = 1, desc2 = 3, remark = "^d7c4a2创世只不过因为有个梦太长了，仅此。\r　　　　　　　　　　　——盘古"},
	{iconpath = "06428皇帝.dds", desc1 = 1, desc2 = 4, remark = "^d7c4a2文明若被忽视，它将化为最崇高的刑具，而我将是监刑者。\r　　　　　　　　　　　——黄帝"},
	{iconpath = "06433东皇.dds", desc1 = 1, desc2 = 5, remark = "^d7c4a2当你反掌就能灭世的时候，你才会懂，什么叫无聊。\r　　　　　　　　　　　——东皇"},
	{iconpath = "06423螺祖.dds", desc1 = 2, desc2 = 3, remark = "^d7c4a2你如果能找到我遗世的力量，你就可以战胜你所遇见的一切。\r　　　　　　　　　　　——螺祖"},
	{iconpath = "06418祝融.dds", desc1 = 2, desc2 = 4, remark = "^d7c4a2水与火都是我的魂魄，它们能掌控万物，主宰生死。\r　　　　　　　　　　　——祝融"},
	{iconpath = "06419伏羲.dds", desc1 = 2, desc2 = 5, remark = "^d7c4a2图腾篆刻着我们的过去，我们已经超越了神。\r　　　　　　　　　　　——伏羲"},
	{iconpath = "06424混沌.dds", desc1 = 3, desc2 = 4, remark = "^d7c4a2盘古真的醒了？你们不过活在他另一个梦里，当他醒来，你们都会消失。\r　　　　　　　　　　　——混沌"},
	{iconpath = "06434神农.dds", desc1 = 3, desc2 = 5, remark = "^d7c4a2我从来都不回头，因为我就是希望。\r　　　　　　　　　　　——神农"},
	{iconpath = "06429女娲.dds", desc1 = 4, desc2 = 5, remark = "^d7c4a2我之所以离开，是因为人必须学会背负生死。\r　　　　　　　　　　　——女娲"},
}

Parentage.Factor = { "体魄资质","力道资质","筋骨资质","内劲资质","气海资质" }

Parentage.Rank = {1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,3,3,3,3,3,3,3,3,3,3}

Parentage.Skill = {
				 	{ id = 2531, name = "夸父听鼓" }, 
					{ id = 2522, name = "盘古化梦" }, 
					{ id = 2525, name = "黄帝混元" }, 
					{ id = 2526, name = "东皇披甲" }, 
					{ id = 2524, name = "螺祖挂袍" }, 
					{ id = 2527, name = "祝融予咒" }, 
					{ id = 2523, name = "伏羲裂简" }, 
					{ id = 2529, name = "混沌无界" }, 
					{ id = 2528, name = "神农炼偶" }, 
					{ id = 2530, name = "女娲祭月" }
				  }
				
--血统描述面板内容
--tiptitle	血统名字，显示在悬浮板最上方居中，楷体字
--tipicon	图标文件名，格式为编号+文字+.dds,具体在路径表里查
--tipinf01	血统浓度，位置为图标右侧左边三行，可用\r换行
--tipinf02	悬浮面板的类别，这里写死“门徒血统”，位置为图标右侧右边第一行文字
--tipdesc	血统对资质的修正，function Parentage:GetParentageDesc(id,num)这个接口能取到血统id和浓度，利用上面的资质表，拼一句话，
--tipremark	血统附加描述，每个血统的渊源之类的话
--其他没提到的东西不要加内容，就全设为""即可

function Parentage:GetParentageDesc(id,num)
    local Parentage_tip = {}
	local idParentage  = id
	local numParentage = num
	local affect1,affect2
	
	Parentage_tip["star"] = "-1_0"  --描述面板星级,s_t，s代表星数，-1不显示。t代表显示方案，0为正常，1为同步闪烁，2为待定	
	if idParentage >= 1 and idParentage <= 25 then
		Parentage_tip["title"] = Parentage.Info[idParentage].name
		Parentage_tip["icon"] = Parentage.TipInfo[idParentage].iconpath
		affect1 = Parentage.Affect[idParentage][Parentage.TipInfo[idParentage].desc1]/1000
		if idParentage >= 11 and idParentage <= 15 then
		   if math.ceil(affect1) - affect1 ~= 0 then
              Parentage_tip["desc"] = "^ffffff每^ffffff1%^ffffff浓度可提升"..string.format("^ffffff%.1f",affect1).."%"..string.format("^ffffff%s",Parentage.Factor[Parentage.TipInfo[idParentage].desc1])
           else
		      Parentage_tip["desc"] = "^ffffff每^ffffff1%^ffffff浓度可提升"..string.format("^ffffff%d",affect1).."%"..string.format("^ffffff%s",Parentage.Factor[Parentage.TipInfo[idParentage].desc1])
		   end
		else
		   affect2 = Parentage.Affect[idParentage][Parentage.TipInfo[idParentage].desc2]/1000
		   if math.ceil(affect1) - affect1 ~= 0 and math.ceil(affect2) - affect2 ~= 0 then
		      Parentage_tip["desc"] = "^ffffff每^ffffff1%^ffffff浓度可提升"..string.format("^ffffff%.1f",affect1).."%"..string.format("^ffffff%s",Parentage.Factor[Parentage.TipInfo[idParentage].desc1]).."^ffffff\r每^ffffff1%^ffffff浓度可提升"..string.format("^ffffff%.1f",affect2).."%"..string.format("^ffffff%s",Parentage.Factor[Parentage.TipInfo[idParentage].desc2])
		   elseif math.ceil(affect1) - affect1 == 0 and math.ceil(affect2) - affect2 ~= 0 then
              Parentage_tip["desc"] = "^ffffff每^ffffff1%^ffffff浓度可提升"..string.format("^ffffff%d",affect1).."%"..string.format("^ffffff%s",Parentage.Factor[Parentage.TipInfo[idParentage].desc1]).."^ffffff\r每^ffffff1%^ffffff浓度可提升"..string.format("^ffffff%.1f",affect2).."%"..string.format("^ffffff%s",Parentage.Factor[Parentage.TipInfo[idParentage].desc2])
		   elseif math.ceil(affect1) - affect1 ~= 0 and math.ceil(affect2) - affect2 == 0 then
		      Parentage_tip["desc"] = "^ffffff每^ffffff1%^ffffff浓度可提升"..string.format("^ffffff%.1f",affect1).."%"..string.format("^ffffff%s",Parentage.Factor[Parentage.TipInfo[idParentage].desc1]).."^ffffff\r每^ffffff1%^ffffff浓度可提升"..string.format("^ffffff%d",affect2).."%"..string.format("^ffffff%s",Parentage.Factor[Parentage.TipInfo[idParentage].desc2])
           else
		      Parentage_tip["desc"] = "^ffffff每^ffffff1%^ffffff浓度可提升"..string.format("^ffffff%d",affect1).."%"..string.format("^ffffff%s",Parentage.Factor[Parentage.TipInfo[idParentage].desc1]).."^ffffff\r每^ffffff1%^ffffff浓度可提升"..string.format("^ffffff%d",affect2).."%"..string.format("^ffffff%s",Parentage.Factor[Parentage.TipInfo[idParentage].desc2])
		   end
		end
		if Parentage.Rank[idParentage] == 3 then
		   for i = 1,#Parentage.Skill do
		       if Parentage.Skill[i].id == Parentage.Info[idParentage].skill then
		          Parentage_tip["desc"] = Parentage_tip["desc"].."^ffffff,\r浓度达到^ffffff5%^ffffff激活^ffffff天赋技能"..string.format("^ffffff%s",Parentage.Skill[i].name)
			   end
		   end
		end
		if #Parentage.Eat[idParentage] >= 1 then
		   Parentage_tip["desc"] = Parentage_tip["desc"].."\r"
		   for i = 1,#Parentage.Eat[idParentage] do
               if Parentage.Eat[idParentage][i] >= 1 then
			      Parentage_tip["desc"] = Parentage_tip["desc"].."^ffffff\r可吞噬"..string.format("%s",Parentage.Info[Parentage.Eat[idParentage][i]].name).."^ffffff血统"
			   end
		   end
		end
		if #Parentage.Chemical[idParentage] >= 1 then
		   if #Parentage.Eat[idParentage] <= 0 then
		      Parentage_tip["desc"] = Parentage_tip["desc"].."\r"
		   end
		   for i = 1,#Parentage.Chemical[idParentage] do
		       if Parentage.Chemical[idParentage][i][1] >= 1 and Parentage.Chemical[idParentage][i][2] >= 11 then
			      Parentage_tip["desc"] = Parentage_tip["desc"].."^ffffff\r可以与"..string.format("%s",Parentage.Info[Parentage.Chemical[idParentage][i][1]].name).."^ffffff血统合化,生成"..string.format("%s",Parentage.Info[Parentage.Chemical[idParentage][i][2]].name).."^ffffff血统"
			   end
		   end
		end
		Parentage_tip["remark"] = Parentage.TipInfo[idParentage].remark
	else
		Parentage_tip["title"] = "未知"
		Parentage_tip["icon"] = "00752未知物品.dds"
        Parentage_tip["desc"] = "未知"
        Parentage_tip["remark"] = "未知"
	end
    if numParentage >= 1 and numParentage <= 100 then
		if Parentage.Rank[idParentage] == 1 then
			Parentage_tip["info1"] = string.format("类型：门徒血统\r品级：初级\r浓度：%d%%",numParentage)
		elseif Parentage.Rank[idParentage] == 2 then
			Parentage_tip["info1"] = string.format("类型：门徒血统\r品级：中级\r浓度：%d%%",numParentage)
		elseif Parentage.Rank[idParentage] == 3 then
			Parentage_tip["info1"] = string.format("类型：门徒血统\r品级：高级\r浓度：%d%%",numParentage)
		end
	else
		Parentage_tip["info1"] = "未知"
	end
--返回数据：17项（09.12.11） 
	return Parentage_tip
end

--print(Parentage:GetParentageDesc(1,5))

function Parentage:GetParentageInfo()
	return Parentage.Info
end

function Parentage:GetParentageAffect()
	return Parentage.Affect
end

Parentage:GetParentageDesc(1,1)
