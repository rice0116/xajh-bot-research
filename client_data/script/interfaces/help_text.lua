--[[#tag push auto]]

local DlgTemplate = DlgTemplate
local GameApi = GameApi
local DlgApi  = DlgApi

Win_HelpText = DlgTemplate:new({this = --[[!AUTO_1]]"Win_HelpText"})

------------------------------------
-- 文本设置相关变量
------------------------------------
local pageindex = 1
local fristpage = --[[!AUTO_2]]""

------------------------------------
-- 界面配置
------------------------------------
if ShowHelpDialogName == --[[!AUTO_3]]"" then
	KeyWord = --[[!AUTO_4]]""
	KeyWord_Text = --[[!AUTO_5]]""
	KeyWord_Npc = --[[!AUTO_6]]""
end

if ShowHelpDialogParentName == --[[!AUTO_7]]"" then
	KeyWord = --[[!AUTO_8]]""
	KeyWord_Text = --[[!AUTO_9]]""
	KeyWord_Npc = --[[!AUTO_10]]""
end
------------------------------------
-- 界面设置相关变量
------------------------------------
--[[
local value1 = Help_AllConfig[ShowHelpDialogName][1]
local value2 = Help_AllConfig[ShowHelpDialogName][2]
local value3 = Help_AllConfig[ShowHelpDialogName][3]
local value4 = Help_AllConfig[ShowHelpDialogName][4]
--]]
local tstring = ShowHelpDialogName
------------------------------------
-- 文本设置相关变量
------------------------------------
local color = {}
	  color[--[[!]]"紫色"] = 0xff00ff
	  color[--[[!]]"蓝色"] = 0x00ffff
	  color[--[[!]]"橙色"] = 0xff8000
	  color[--[[!]]"红色"] = 0xff0000

------------------------------------
-- 初始化界面
------------------------------------
function Win_HelpText:Init()
	self:RegisterEvent(WM_LBUTTONDOWN, self.OnLButtonDown);
	self:RegisterEvent(WM_MOUSEMOVE, self.OnMOUSEMOVE);
end

------------------------------------
-- 开启界面
------------------------------------
function Win_HelpText:ShowDialog()
	--self:SetWinPos(Help_AllConfig[ShowHelpDialogName][1], Help_AllConfig[ShowHelpDialogName][2])
	DlgApi.SetItemText(self.this, --[[!AUTO_11]]"Txt_HelpText", --[[!AUTO_12]]"")
	DlgApi.SetItemText(self.this, --[[!AUTO_13]]"Txt_KeyInfo", --[[!AUTO_14]]"")
	DlgApi.AppendItemText(self.this, --[[!AUTO_15]]"Txt_HelpText", self:EditText(ShowHelpDialogName))
	DlgApi.AppendItemText(self.this, --[[!AUTO_16]]"Txt_KeyInfo", self:EditInfoText(Help_KeyWord[Help_AllText[ShowHelpDialogName][1][1]].text))
end

------------------------------------
-- 界面Tick调整界面位置
------------------------------------
function Win_HelpText:Tick()
	if DlgApi.IsDialogShow(ShowHelpDialogParentName) then

	else
		DlgApi.ShowDialog(--[[!AUTO_17]]"Win_HelpText", false);
		DlgApi.ShowItem(ShowHelpDialogName, --[[!AUTO_18]]"Img_XAJHHelpDialogImage", false);
	end
end

------------------------------------
-- 界面中控件消息控制
------------------------------------
function Win_HelpText:OnLButtonDown(objName)
	if objName == --[[!AUTO_19]]"Txt_HelpText" then
		local posx2, posy2 = GameApi.GetCursorPos()
		KeyWord = DlgApi.GetItemLink(self.this, --[[!AUTO_20]]"Txt_HelpText", posx2, posy2)
		if KeyWord then
			DlgApi.ShowItem(--[[!AUTO_21]]"Win_HelpText", --[[!AUTO_22]]"Btn_FristPage", false)
			pageindex = 1
			fristpage = KeyWord
			KeyWord_Text = Help_KeyWord[KeyWord].text
			KeyWord_Npc = Help_KeyWord[KeyWord].NPC
			DlgApi.SetItemText(self.this, --[[!AUTO_23]]"Txt_KeyInfo", --[[!AUTO_24]]"")
			DlgApi.AppendItemText(self.this, --[[!AUTO_25]]"Txt_KeyInfo", self:EditInfoText(KeyWord_Text))
		end
	end
	if objName == --[[!AUTO_26]]"Txt_KeyInfo" then
		local posx2, posy2 = GameApi.GetCursorPos()
		local KeyWord = DlgApi.GetItemLink(self.this, --[[!AUTO_27]]"Txt_KeyInfo", posx2, posy2)
		if KeyWord == --[[!AUTO_28]]"{3.在滿足幫派升級條件後，該怎麼升級呀？}" then
			DlgApi.ShowDialog(--[[!AUTO_29]]"Win_FactionMain",true)
			HelpSystem:ShowHelpUI(--[[!AUTO_30]]"Help_Tips", -1, -1)
			Help_Tips:ShowTip(101, --[[!AUTO_31]]"Win_FactionMain", --[[!AUTO_32]]"")
			DelayCall(5000, function () Help_Tips:HideTip(--[[!AUTO_33]]"Win_FactionMain") end, true)
		end
		local i, j = string.find(KeyWord, --[[!AUTO_34]]"{#%d+#}")
		if i then
			local npcid = string.sub(KeyWord, i + 2, j - 2)
			if npcid then
				self:GetNpcInfo(tonumber(npcid))
				DlgApi.ShowDialog(--[[!AUTO_35]]"Win_HelpText", false);
			end
		end
		if KeyWord then
			pageindex = pageindex + 1
			if pageindex >= 2 then
				DlgApi.ShowItem(--[[!AUTO_36]]"Win_HelpText", --[[!AUTO_37]]"Btn_FristPage", true)
			end
			self:ShowText(KeyWord)
		end
	end
	if objName == --[[!AUTO_38]]"Btn_FristPage" then
		local fpg = fristpage
		pageindex = pageindex - 1
		self:ShowText(fpg)
		if pageindex == 1 then
			DlgApi.ShowItem(--[[!AUTO_39]]"Win_HelpText", --[[!AUTO_40]]"Btn_FristPage", false)
		end
	end
end


--延时后调用函数，delayTime单位为毫秿
function DelayCall(delayTime, func)
	local waitedTime = 0
	HelpSystem:RegisterDataEvent(
	function (params)
		waitedTime = waitedTime + params.tick_time
		if waitedTime >= delayTime then
			safeCall(func)
			return --[[!AUTO_41]]"end"
		end
	end, DataEvent.DATA_TIME)
end

function safeCall (func, ...)
	local flag, ret = pcall(func, ...)
	if not flag then
		LogPrint(ret)
	else
		return ret
	end
end


------------------------------------
-- 获取需要显示的文本
------------------------------------
function Win_HelpText:EditText(searchstring)
local str = --[[!AUTO_42]]""
	if searchstring ~= --[[!AUTO_43]]"" then
		if Help_AllText[searchstring] then
			 for k, v in ipairs(Help_AllText[searchstring][1]) do
				str = str .. v .. --[[!AUTO_44]]"\r"
			 end
			 str = self:FindKeyWord(str)
		else
			LogPrint(string.format(--[[!AUTO_45]]"沒有目前副本的説明資訊"))
		end
	end
	return str
end

function Win_HelpText:EditInfoText(searchstring)
local str = --[[!AUTO_46]]""
	if searchstring ~= --[[!AUTO_47]]"" then
		str = self:FindKeyWord(searchstring)
	end
	return str
end

------------------------------------
-- 设置窗口位置函数
------------------------------------
function Win_HelpText:SetWinPos(DialogName, ItemName)
	DlgApi.SetDialogPosition(self.this, 0, 0, DialogName, AUIDIALOG_ALIGN_OUTSIDE, AUIDIALOG_ALIGN_RIGHT, AUIDIALOG_ALIGN_INSIDE, AUIDIALOG_ALIGN_BOTTOM)
end

------------------------------------
-- 控件文字显示
------------------------------------
function Win_HelpText:ShowText(str)
	DlgApi.SetItemText(self.this, --[[!AUTO_48]]"Txt_KeyInfo", --[[!AUTO_49]]"")
	DlgApi.AppendItemText(self.this, --[[!AUTO_50]]"Txt_KeyInfo", self:EditInfoText(Help_KeyWord[str].text))
end

------------------------------------
-- 遍历关键字
------------------------------------
function Win_HelpText:FindKeyWord(keystring)
	 for k, v in pairs(Help_KeyWord) do
		local i, j = string.find(k, --[[!AUTO_51]]"{#%d+#}")
		if i then
			local id = tonumber(string.sub(k, i + 2, j - 2))
			keystring = string.gsub(keystring, k, GameApi.ConvertItemLinkText(ObjInfo[id].name, k, v.color))
		else
			keystring = string.gsub(keystring, k, GameApi.ConvertItemLinkText(v.title, k, v.color))
		end
	 end
	 return keystring
end

------------------------------------
-- 鼠标移动消息控制
------------------------------------
function Win_HelpText:OnMOUSEMOVE()
local posx1, posy1 = GameApi.GetCursorPos()
local resault = DlgApi.GetItemLink(self.this, --[[!AUTO_52]]"Txt_HelpText", posx1, posy1)
	if resault == nil then
		GameApi.ScriptChangeCursor(0)
	else
		GameApi.ScriptChangeCursor(16)
	end
	return true;
end

------------------------------------
-- 获取NPC信息
------------------------------------
function Win_HelpText:GetNpcInfo(id)
	local typeTarget = ObjInfo[id].objtype
	local idTarget = id
	local idFrom = ObjInfo[id].souceID
	local x = ObjInfo[id].x
	local y = ObjInfo[id].y
	local z = ObjInfo[id].z
	local mapid = ObjInfo[id].SID
	GameApi.AutoSearchPathWithScriptCB( typeTarget, idTarget, idFrom, x, y, z, mapid );
	return true
end
