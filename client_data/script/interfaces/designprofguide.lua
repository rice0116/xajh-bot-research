local Dlp = DlgTemplate
local DlgApi  = DlgApi
local GameApi = GameApi
local Format = string.format
local iGuideState = 0		--[[0－未开始，1-99－答题中，100+－题]]
local tSubQueue = {1,2,6,3,5,9,8,11,12,10,13}	--[[题目列表，不限量]]
local tAnswer = {}		--[[答题结果列表]]
local tScore = {}		--[[得分列表，共10个]]
local iProf = 0			--[[最大得分职业序号，1－10代表十大门派]]

UD_DesignProfGuide = Dlp:new({this = "UD_DesignProfGuide"})
--UD_DesignProfGuide = {}

function UD_DesignProfGuide:Init()
	self:RegisterEvent("Btn_Close", self.OnClose);
	self:RegisterEvent("Btn_A", self.OnBtnA);
	self:RegisterEvent("Btn_B", self.OnBtnB);
end

LuaEvent = {
	
}

function UD_DesignProfGuide:RegisterGameEvent()
	  return LuaEvent
end

function UD_DesignProfGuide:ShowDialog()
	iGuideState = 0
	for i = 1, 10 do
		tScore[i] = 0
	end
	DlgApi.SetItemText(self.this, "Title", DESIGN_PROF_GUIDE_TITLE)
	DlgApi.SetItemText(self.this, "Txt_Question1", DESIGN_PROF_GUIDE_OP.q_str1)
	DlgApi.SetItemText(self.this, "Txt_Question2", DESIGN_PROF_GUIDE_OP.q_str2)
	DlgApi.SetItemText(self.this, "Txt_Question3", DESIGN_PROF_GUIDE_OP.q_str3)
	DlgApi.SetItemText(self.this, "Txt_Question4", DESIGN_PROF_GUIDE_OP.q_str4)
	DlgApi.SetItemText(self.this, "Btn_A", DESIGN_PROF_GUIDE_START)
	DlgApi.SetItemText(self.this, "Btn_B", "")
	DlgApi.ShowItem(self.this, "Btn_A", true)
	DlgApi.ShowItem(self.this, "Btn_B", false)
	DlgApi.ShowItem(self.this, "Txt_Link", false)
end

function UD_DesignProfGuide:HideDialog()
	--
end

function UD_DesignProfGuide:OnClose()
	DlgApi.ShowDialog("UD_DesignProfGuide", false);
end

function UD_DesignProfGuide:OnBtnA()
	UD_DesignProfGuide:OnChoose(1)
end

function UD_DesignProfGuide:OnBtnB()
	UD_DesignProfGuide:OnChoose(2)
end

function UD_DesignProfGuide:OnChoose(iAnswer)
	if tSubQueue[iGuideState] then --[[计算得分]]
		if iAnswer == 1 then
			tAnswer[iGuideState] = "A"
			for i = 1, 10 do
				tScore[i] = tScore[i] + DESIGN_PROF_GUIDE_TEXT[tSubQueue[iGuideState]].n_val1[i]
			end
		elseif iAnswer == 2 then
			tAnswer[iGuideState] = "B"
			for i = 1, 10 do
				tScore[i] = tScore[i] + DESIGN_PROF_GUIDE_TEXT[tSubQueue[iGuideState]].n_val2[i]
			end
		end
		--DlgApi.SetItemText(self.this, "Title", tScore[1] .. " " .. tScore[2] .. " " .. tScore[3] .. " " .. tScore[4] .. " " .. tScore[5] .. " " .. tScore[6] .. " " .. tScore[7] .. " " .. tScore[8] .. " " .. tScore[9] .. " " .. tScore[10])
	else
	end
	if tSubQueue[iGuideState + 1] then --[[显示下一道题]]
		iGuideState = iGuideState + 1
		DlgApi.SetItemText(self.this, "Txt_Question1", DESIGN_PROF_GUIDE_TEXT[tSubQueue[iGuideState]].q_str1)
		DlgApi.SetItemText(self.this, "Txt_Question2", DESIGN_PROF_GUIDE_TEXT[tSubQueue[iGuideState]].q_str2)
		DlgApi.SetItemText(self.this, "Txt_Question3", DESIGN_PROF_GUIDE_TEXT[tSubQueue[iGuideState]].q_str3)
		DlgApi.SetItemText(self.this, "Txt_Question4", DESIGN_PROF_GUIDE_TEXT[tSubQueue[iGuideState]].q_str4)
		DlgApi.SetItemText(self.this, "Btn_A", DESIGN_PROF_GUIDE_TEXT[tSubQueue[iGuideState]].a_str1)
		DlgApi.SetItemText(self.this, "Btn_B", DESIGN_PROF_GUIDE_TEXT[tSubQueue[iGuideState]].a_str2)
		DlgApi.ShowItem(self.this, "Btn_A", true)
		DlgApi.ShowItem(self.this, "Btn_B", true)
	else
		if tSubQueue[iGuideState] then
			iGuideState = iGuideState + 100
			DlgApi.SetItemText(self.this, "Txt_Question1", DESIGN_PROF_GUIDE_WAIT.q_str1)
			DlgApi.SetItemText(self.this, "Txt_Question2", DESIGN_PROF_GUIDE_WAIT.q_str2)
			DlgApi.SetItemText(self.this, "Txt_Question3", DESIGN_PROF_GUIDE_WAIT.q_str3)
			DlgApi.SetItemText(self.this, "Txt_Question4", DESIGN_PROF_GUIDE_WAIT.q_str4)
			local str1 = ""
			for i = 1, #tSubQueue do
				if str1 == "" then
					str1 = tAnswer[i]
				else
					str1 = str1 .. " " .. tAnswer[i]
				end
			end
			local str2 = tScore[1] .. " " .. tScore[2] .. " " .. tScore[3] .. " " .. tScore[4] .. " " .. tScore[5] .. " " .. tScore[6] .. " " .. tScore[7] .. " " .. tScore[8] .. " " .. tScore[9] .. " " .. tScore[10]
			DlgApi.SetItemText(self.this, "Txt_Question3", str1)
			DlgApi.SetItemText(self.this, "Txt_Question4", str2)
			DlgApi.SetItemText(self.this, "Btn_A", DESIGN_PROF_GUIDE_WAITING)
			DlgApi.SetItemText(self.this, "Btn_B", "")
			DlgApi.ShowItem(self.this, "Btn_A", true)
			DlgApi.ShowItem(self.this, "Btn_B", false)
		elseif iGuideState < 1000 then
			iGuideState = iGuideState + 1000
			iProf = 0
			local nowProf = 0
			for i = 1, 10 do
				if nowProf <= tScore[i] then	--[[相同积分，以后为准]]
					nowProf = tScore[i]
					iProf = i
				end
			end
			DlgApi.SetItemText(self.this, "Txt_Question1", DESIGN_PROF_GUIDE_RESULT.q_str1)
			DlgApi.SetItemText(self.this, "Txt_Question2", DESIGN_PROF_GUIDE_RESULT.q_str2)
			DlgApi.SetItemText(self.this, "Txt_Question3", string.format(DESIGN_PROF_GUIDE_RESULT.q_str3, GAME_PROF_TYPE[iProf+1]))
			DlgApi.SetItemText(self.this, "Txt_Question4", DESIGN_PROF_GUIDE_RESULT.q_str4)
			DlgApi.SetItemText(self.this, "Btn_A", string.format(DESIGN_PROF_GUIDE_GO, GAME_PROF_TYPE[iProf+1]))
			DlgApi.SetItemText(self.this, "Btn_B", DESIGN_PROF_GUIDE_RETRY)
			DlgApi.ShowItem(self.this, "Btn_A", true);
			DlgApi.ShowItem(self.this, "Btn_B", true);
		else
			if iAnswer == 1 then
				--[[GameApi.StartAutoMove(10, 10, 10)]]
				local profNPCid = {1212,1214,1215,1216,1217,1219,1213,1218,1220,1211}
				LogPrint(profNPCid[iProf])
				GameApi.AutoClickNpc(0, profNPCid[iProf])
				UD_DesignProfGuide:OnClose()
			elseif iAnswer == 2 then
				iGuideState = 0
				for i = 1, 10 do
					tScore[i] = 0
				end
				DlgApi.SetItemText(self.this, "Title", DESIGN_PROF_GUIDE_TITLE)
				DlgApi.SetItemText(self.this, "Txt_Question1", DESIGN_PROF_GUIDE_OP.q_str1)
				DlgApi.SetItemText(self.this, "Txt_Question2", DESIGN_PROF_GUIDE_OP.q_str2)
				DlgApi.SetItemText(self.this, "Txt_Question3", DESIGN_PROF_GUIDE_OP.q_str3)
				DlgApi.SetItemText(self.this, "Txt_Question4", DESIGN_PROF_GUIDE_OP.q_str4)
				DlgApi.SetItemText(self.this, "Btn_A", DESIGN_PROF_GUIDE_START)
				DlgApi.SetItemText(self.this, "Btn_B", "")
				DlgApi.ShowItem(self.this, "Btn_A", true)
				DlgApi.ShowItem(self.this, "Btn_B", false)
				DlgApi.ShowItem(self.this, "Txt_Link", false)
			end
		end
	end
end