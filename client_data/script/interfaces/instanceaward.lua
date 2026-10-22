local DlgTemplate = DlgTemplate or {new = function () return {} end}
local DlgApi  = DlgApi
local pairs = pairs
local assert = assert
local type = type

-- 音效配置
local SfxDir = "sfx\\策划联入\\ui\\"
local SfxConfig =
{
	-- 项目 = 文件路径, ("SFX\\...\\xxx.wav")
	show = SfxDir.."副本结束页面_副本过关.WAV",			--当界面打开时
	score_name = SfxDir.."副本结束页面_文字弹出.WAV",	--显示评价名时
	score = SfxDir.."副本结束页面_评价分数.wav",		--显示单项评价时
	total_score = SfxDir.."副本结束页面_总评价.WAV",	--显示总评价时
	
	exp_background = SfxDir.."副本结束页面_奖励文字.WAV",	--显示经验背景图时
	award_background = SfxDir.."副本结束页面_奖励文字.WAV",	--显示奖励背景图时
	
	exp_progress = SfxDir.."副本结束页面_经验奖励进度条.WAV",	--显示经验条时
	award = SfxDir.."副本结束页面_奖励宝箱.WAV",	--奖励宝箱弹出
	select_award = SfxDir.."副本结束页面_点开宝箱.WAV",	--选择宝箱物品时
	
	score_tick = "SFX\\策划联入\\ui\\通用_计数累加.wav",	--分数增加时
	exp_tick = "SFX\\策划联入\\ui\\通用_计数累加.wav",		--经验条增加时
}

-- 时长配置
local TimeConfig =
{
	-- 项目 = 值
	score_min = 200,		--单项奖励分数滚动时间 ms (最小值)
	score_max = 2000,		--单项奖励分数滚动时间 ms (最大值)
	score_rate = 1000,		--滚动时间(毫秒) = clamp(log10(value)*score_rate, score_min, score_max)
	
	exp = 3000,				--经验值滚动时间 ms
	exp_stay = 1200,		--经验值停留时间 ms
	
	lottery_wait = 300,		--显示抽奖延迟时间 ms
	count_down = 8000,		--倒计时时长
}

Win_InstanceAward = DlgTemplate:new({this = "Win_InstanceAward"})

do
	local Class = Win_InstanceAward
	local Name = "Win_InstanceAward"
	
	function Class:GetSfxConfig (which)
		return SfxConfig[which]
	end
	
	function Class:GetTimeConfig (which)
		return TimeConfig[which]
	end
end
