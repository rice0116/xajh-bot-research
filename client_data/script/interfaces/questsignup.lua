local DlgTemplate = DlgTemplate or {new = function () return {} end}
local DlgApi  = DlgApi
local pairs = pairs
local assert = assert
local type = type

Win_QuestSignUp = DlgTemplate:new({this = "Win_QuestSignUp"})

do
	local Class = Win_QuestSignUp
	local Name = "Win_QuestSignUp"
	
	--在 configs 中未找到此，使用此默認值，也就是主要簽到會優先使用這個結構。
	local defaultConfig =
	{
		defaultTask = 9780,	--簽到任務ID
		maxProgress = 31,	--進條度滿時的次數
		counterTask = 9813,	--記次任務ID
		awardTasks =		--獎勵任務。{{count=xxx, task=xxx}, ...}
		{
			{count=1, task=9782},
			{count=2, task=9783},
			{count=3, task=9784},
			{count=4, task=9785},
			{count=5, task=9786},
			{count=6, task=9787},
			{count=7, task=9788},
			{count=8, task=9789},
			{count=9, task=9790},
			{count=10, task=9791},
			{count=11, task=9792},
			{count=12, task=9793},
			{count=13, task=9794},
			{count=14, task=9795},
			{count=15, task=9796},
			{count=16, task=9797},
			{count=17, task=9798},
			{count=18, task=9799},
			{count=19, task=9800},
			{count=20, task=9801},
			{count=21, task=9802},
			{count=22, task=9803},
			{count=23, task=9804},
			{count=24, task=9805},
			{count=25, task=9806},
			{count=26, task=9807},
			{count=27, task=9808},
			{count=28, task=9809},
			{count=29, task=9810},
			{count=30, task=9811},
			{count=31, task=9812},
		}
	}
	
		--指定特定NPC的簽到任務
		--這裡可以對特定NPC賦予其他簽到任務，以下是注意事項:
		--1.NPC一定要設定啟用:簽到服務，否則與NPC對話不會觸發簽到。
		--2.NPC一定要設定任務列表，並且任務列表中要有這些任務ID。
		--3.EL配置該簽到活動的配置中，也必須要有這些任務ID。
	local configs =
	{
		--指定NPC
		[195003] =
		{
			defaultTask = 30717, --主要簽到任務ID
			maxProgress = 31,    --簽到總天數
			counterTask = 30749, --紀錄簽到的任務ID
			awardTasks =
			{
			{count=1, task=30718}, --(第一天,任務ID)
			{count=2, task=30719},
			{count=3, task=30720},
			{count=4, task=30721},
			{count=5, task=30722},
			{count=6, task=30723},
			{count=7, task=30724},
			{count=8, task=30725},
			{count=9, task=30726},
			{count=10, task=30727},
			{count=11, task=30728},
			{count=12, task=30729},
			{count=13, task=30730},
			{count=14, task=30731},
			{count=15, task=30732},
			{count=16, task=30733},
			{count=17, task=30734},
			{count=18, task=30735},
			{count=19, task=30736},
			{count=20, task=30737},
			{count=21, task=30738},
			{count=22, task=30739},
			{count=23, task=30740},
			{count=24, task=30741},
			{count=25, task=30742},
			{count=26, task=30743},
			{count=27, task=30744},
			{count=28, task=30745},
			{count=29, task=30746},
			{count=30, task=30747},
			{count=31, task=30748},
			}
		}
		
	}
	
	local configs =
	{
		--指定NPC
		[195003] =
		{
			defaultTask = 30717, --主要簽到任務ID
			maxProgress = 31,    --簽到總天數
			counterTask = 30749, --紀錄簽到的任務ID
			awardTasks =
			{
			{count=1, task=30718}, --(第一天,任務ID)
			{count=2, task=30719},
			{count=3, task=30720},
			{count=4, task=30721},
			{count=5, task=30722},
			{count=6, task=30723},
			{count=7, task=30724},
			{count=8, task=30725},
			{count=9, task=30726},
			{count=10, task=30727},
			{count=11, task=30728},
			{count=12, task=30729},
			{count=13, task=30730},
			{count=14, task=30731},
			{count=15, task=30732},
			{count=16, task=30733},
			{count=17, task=30734},
			{count=18, task=30735},
			{count=19, task=30736},
			{count=20, task=30737},
			{count=21, task=30738},
			{count=22, task=30739},
			{count=23, task=30740},
			{count=24, task=30741},
			{count=25, task=30742},
			{count=26, task=30743},
			{count=27, task=30744},
			{count=28, task=30745},
			{count=29, task=30746},
			{count=30, task=30747},
			{count=31, task=30748},
			}
		}
		
	}
	
	
	
	local function FindConfig (npcTid)
		return configs[npcTid] or defaultConfig
	end
	
	--簽到任務ID
	function Class:GetDefaultTask (npcTid)
		return FindConfig(npcTid).defaultTask
	end

	--進條度滿時的次數
	function Class:GetMaxProgressBar (npcTid)
		return FindConfig(npcTid).maxProgress
	end
	
	--記次任務ID
	function Class:GetCounterTask (npcTid)
		return FindConfig(npcTid).counterTask
	end
	
	--奖励任务。返回 {{count=xxx, task=xxx}}
	function Class:GetAwardTasks (npcTid)
		return FindConfig(npcTid).awardTasks
	end
end
