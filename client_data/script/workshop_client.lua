--工坊奇物异制相关脚本

Workshop = {}
Workshop.pic = {}
Workshop.part = {}

--Workshop.pic[i]  i为图鉴的编号
--desc 图鉴的描述    icon  图鉴的图标编号
Workshop.pic[1] = 
{
	desc = "",
	icon = "xajh\\工坊\\1.dds",
}

Workshop.pic[2] = 
{
	desc = "",
	icon = "xajh\\工坊\\2.dds",
}

Workshop.pic[3] = 
{
	desc = "",
	icon = "xajh\\工坊\\3.dds",
}

Workshop.pic[4] = 
{
	desc = "",
	icon = "xajh\\工坊\\4.dds",
}

--Workshop.part[i] i为部件的编号
--name 部件的名字    desc 部件的描述    icon  部件的图标编号
Workshop.part[1] = {	name = "蛇", desc = "灵动如我，秒伤全场", icon = 23926,}
Workshop.part[2] = {	name = "鼓", desc = "让鼓点撼动整个江湖", icon = 23927,}
Workshop.part[3] = {	name = "芭蕉", desc = "我不是铁扇公主的宝贝，我只想安安静静的做一颗植物", icon = 23925,}
Workshop.part[4] = {	name = "折扇", desc = "据说是诸葛先生用过的", icon = 23920,}
Workshop.part[5] = {	name = "名贵玉石", desc = "世上玉石千千万，可每一颗都是独一无二的星星", icon = 23921,}
Workshop.part[6] = {	name = "美人琵琶", desc = "犹抱琵琶半遮面，千呼万唤始出来", icon = 23922,}
Workshop.part[7] = {	name = "老鹰", desc = "不要再问何谓神雕侠侣了", icon = 23924,}
Workshop.part[8] = {	name = "纱帽", desc = "这可是花了大价钱从祖上三代一品大臣那儿买来的", icon = 23923,}
Workshop.part[9] = {	name = "牡丹", desc = "既能救人，又能杀人", icon = 5053,}
Workshop.part[10] = {	name = "花斑尾毒蝎", desc = "妈妈教过你吗？这世上所有美貌的东西都是有毒的", icon = 1316,}
Workshop.part[11] = {	name = "元青花梅瓶", desc = "标签上就两个字：宝贝", icon = 11058,}
Workshop.part[12] = {	name = "草药", desc = "你猜我是人参还是天麻？", icon = 3067,}


--part_id 为部件编号
Workshop.partlist =
{
	{NPC_id = 87074 , place = "龙泉" , part_type = "别处找不着的稀有宝贝"},
	{NPC_id = 87075 , place = "余杭" , part_type = "日常生活里的寻常物品"},
	{NPC_id = 87077 , place = "仙霞岭" , part_type = "我这儿的全是各种动物"},
	{NPC_id = 87078 , place = "仙愁峡" , part_type = "我这儿的全是各种植物"},
}

function Workshop:GetPicInfo( i )
	return Workshop.pic[i]
end

function Workshop:GetPartInfo( i )
	return Workshop.part[i]
end

function Workshop:GetPartList()
	return Workshop.partlist
end