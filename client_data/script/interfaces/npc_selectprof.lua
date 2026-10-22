local DlgTemplate = DlgTemplate or {new = function () return {} end}
local DlgApi  = DlgApi
local pairs = pairs
local assert = assert
local type = type

local TaskConfig =
{
	[5244] =
	{
		profName = "少林",		--门派名
		defaultVideo = "music\\video\\prof1.avi",	--刚打开时显示的视频
		skills = {38095, 23127, 23128},		--标签对应的技能
		desc = "八方玄学，源自中州；天下武功，出于少林！“当头棒喝狮子吼，修行原为伏妖魔。”少林的慈悲，就是为善去恶、降妖伏魔！#Y若与我派有缘，入我少林门下，我将传你一些入门功夫，日后，等你领会此中奥妙后，就能面见掌门，正式成为少林弟子了。",			--文字说明
	},
	[5247] =
	{
		profName = "武当",		--门派名
		defaultVideo = "music\\video\\prof2.avi",	--刚打开时显示的视频
		skills = {38096, 23132, 23133},		--标签对应的技能
		desc = "“易有太极，是生两仪”。我派武学，以柔克刚、刚柔并济，太极剑、两仪剑更为江湖群豪称道。自张三丰祖师创派以来，一直是武林支柱。#Y若与我派有缘，入我武当门下，我将传你一些入门功夫，日后，等你领会此中奥妙后，就能面见掌门，正式成为武当弟子了。",			--文字说明
	},
	[5250] =
	{
		profName = "华山",		--门派名
		defaultVideo = "music\\video\\prof3.avi",	--刚打开时显示的视频
		skills = {38097, 23137, 23138},		--标签对应的技能
		desc = "“拳出少林，剑归华山”。我派武学以气御剑、剑气双修，端是耀古烁今，威震武林。家师“君子剑”岳先山更是当今武林正道最为称道的一代宗师。今日你若归我华山，就能成为记名弟子，我将教你一些简单的拳脚功夫，等你江湖历练足够的话，就能拜见家师，正式入门了。",			--文字说明
	},
	[5259] =
	{
		profName = "恒山",		--门派名
		defaultVideo = "music\\video\\prof4.avi",	--刚打开时显示的视频
		skills = {38098, 23142, 23143},		--标签对应的技能
		desc = "恒山乃是五岳剑派之一，恒山三定三位师太在江湖上也素有慈名。“一入恒山风月永，几回慧剑斩情丝。”恒山门人，在武林中如此超然脱俗，又能坚持正道！\r#Y若与我派有缘，入我恒山门下，我将传你一些入门功夫，日后，等你领会此中奥妙后，就能面见掌门，正式成为恒山弟子了。",			--文字说明
	},
	[5256] =
	{
		profName = "衡山",		--门派名
		defaultVideo = "music\\video\\prof5.avi",	--刚打开时显示的视频
		skills = {38099, 23147, 23148},		--标签对应的技能
		desc = "衡山派乃是江湖上大大有名的五岳剑派之一，掌门人莫大先生号称潇湘夜雨，琴中藏剑，剑发琴音，“潇湘夜雨剑华生，秋风摇落剑客老”，衡山门下风采都是如此。\r#Y若与我派有缘，入我衡山门下，我将传你一些入门功夫，日后，等你领会此中奥妙后，就能面见掌门，正式成为衡山弟子了。",			--文字说明
	},
	[5235] =
	{
		profName = "日月",		--门派名
		defaultVideo = "music\\video\\prof6.avi",	--刚打开时显示的视频
		skills = {38100, 23152, 23153},		--标签对应的技能
		desc = "文成武德，仁义英明，中兴圣教，泽被苍生，千秋万代，一统江湖！\r“王图霸业谈笑中，日月中天照江湖！”\r我圣教都是至情至性之人，从不做虚情假意之事。\r#Y若加入圣教，在下马上传你日月绝学。",			--文字说明
	},
	[5238] =
	{
		profName = "五仙",		--门派名
		defaultVideo = "music\\video\\prof7.avi",	--刚打开时显示的视频
		skills = {38101, 23157, 23158},		--标签对应的技能
		desc = "我五仙教在江湖中以善使毒蛊闻名，向来只收女子。“山中今夜相思蛊，天涯何处有情郎。”五仙教女子，道是无情，还是有情？\r#Y若加入五仙教，在下马上传你几手入门绝学，等此间事了，你便可拜见教主，正式成为五仙教的入室弟子。",			--文字说明
	},
	[5253] =
	{
		profName = "逍遥",		--门派名
		defaultVideo = "music\\video\\prof8.avi",	--刚打开时显示的视频
		skills = {38102, 23162, 23163},		--标签对应的技能
		desc = "人生于三千红尘之中，受万千羁绊，忧多乐少，求得逍遥本不是容易之事。\r“武林争霸经几载，我自逍遥醉一生。”世间真有逍遥一派，是求得逍遥的好处所。\r#Y若与我派有缘，入我逍遥门下，我将传你一些入门功夫，日后，等你领会此中奥妙后，就能面见掌门，正式成为逍遥弟子了。",			--文字说明
	},
	[5241] =
	{
		profName = "唐门",		--门派名
		defaultVideo = "music\\video\\prof9.avi",	--刚打开时显示的视频
		skills = {38103, 23167, 23168},		--标签对应的技能
		desc = "蜀中唐门，武林世家，暗器飞镖，天下第一。\r“世界空空无一物，满天花雨断人肠。”只有死人，方能说出唐门暗器的秘密。\r#Y若入我唐门，我将传你一些本门的粗浅功夫，此后行走江湖，也多了几分手段。他日你经历了考验后，就能拜见门主，正式成为唐门弟子了。",			--文字说明
	},
	[5262] =
	{
		profName = "峨嵋",		--门派名
		defaultVideo = "music\\video\\prof10.avi",	--刚打开时显示的视频
		skills = {38104, 23172, 23173},		--标签对应的技能
		desc = "峨嵋派自立派以来，以发扬光大正宗武学为己任，属于玄门正宗。“峨眉山月静不动，琉璃法身净无瑕。”峨眉正宗武学，习之可以超凡入圣。\r#Y若与我派有缘，入我峨嵋门下，我将传你一些入门功夫，日后，等你领会此中奥妙后，就能面见掌门，正式成为峨嵋弟子了。",			--文字说明
	},
}

Win_NPCSelectProf = DlgTemplate:new({this = "Win_NPCSelectProf"})

do
	local Class = Win_NPCSelectProf
	local Name = "Win_NPCSelectProf"

	function Class:GetTaskConfig (taskId)
		local config = TaskConfig[taskId]
		if not config then	--未找到
			return
		end

		-- 生成客户端所需信息
		local info = {}
		info.profName = config.profName
		info.defaultVideo = config.defaultVideo
		info.skills = {}
		for i=1, 3 do
			local skillId = config.skills[i]
			local name = SkillTip.VideoPath.WuXueName[skillId]
			local video = SkillTip.VideoPath.WuXue[skillId]
			info.skills[i] = { name = name, video = video }
		end
		info.desc = config.desc

		return info
	end
end
