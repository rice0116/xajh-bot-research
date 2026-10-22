local DlgTemplate = DlgTemplate
local GameApi = GameApi
local DlgApi  = DlgApi

Win_HelpText = DlgTemplate:new({this = "Win_HelpText"})


------------------------------------
-- 界面设置相关变量
------------------------------------
local value1 = Help_AllConfig[ShowHelpDialogName][1]
local value2 = Help_AllConfig[ShowHelpDialogName][2]
local value3 = Help_AllConfig[ShowHelpDialogName][3]
local value4 = Help_AllConfig[ShowHelpDialogName][4]
local tstring = ShowHelpDialogName
------------------------------------
-- 文本设置相关变量
------------------------------------
local color = {}
	  color["紫色"] = 0xff00ff
	  color["蓝色"] = 0x00ffff
	  color["橙色"] = 0xff8000
	  color["红色"] = 0xff0000

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
	self:SetWinPos(value1, value2)
	DlgApi.SetItemText(self.this, "Txt_HelpText", self:EditText(tstring))
end

------------------------------------
-- 界面Tick调整界面位置
------------------------------------
function Win_HelpText:Tick()
	if DlgApi.IsDialogShow(tstring) then
		self:SetWinPos(value1, value2)
	else
		DlgApi.ShowDialog("Win_HelpText", false)
	end
end

------------------------------------
-- 界面中控件消息控制
------------------------------------
function Win_HelpText:OnLButtonDown(objName)
	if objName == "Txt_HelpText" then
		local posx2, posy2 = GameApi.GetCursorPos()
		KeyWord = DlgApi.GetItemLink(self.this, "Txt_HelpText", posx2, posy2)
		if KeyWord then
			GameApi.AddChatMessage(GP_CHAT_MISC, Help_KeyWord[KeyWord].text)
		end
	end
end

------------------------------------
-- 获取需要显示的文本
------------------------------------
function Win_HelpText:EditText(searchstring)
local str = ""
	 for k, v in ipairs(Help_AllText[searchstring][1]) do
		str = str .. v .. "\r\r"
	 end
	 str = self:FindKeyWord(str)
	 return str
end

------------------------------------
-- 设置窗口位置函数
------------------------------------
function Win_HelpText:SetWinPos(DialogName, ItemName)
	local new_scalse = DlgApi.GetWindowScale() -- 确定当前窗口比例
	local WinPosSwitch = DlgApi.GetItemRect(DialogName, ItemName)
	DlgApi.SetDialogPosition(self.this, (WinPosSwitch.x + value3) * new_scalse , (WinPosSwitch.y + value4) * new_scalse)
end

------------------------------------
-- 遍历关键字
------------------------------------
function Win_HelpText:FindKeyWord(keystring)
	 for k1, v1 in pairs(Help_KeyWord) do
		keystring = string.gsub(keystring, k1, GameApi.ConvertItemLinkText(v1.title, k1, v1.color))
	 end
	 return keystring
end

------------------------------------
-- 鼠标移动消息控制
------------------------------------
function Win_HelpText:OnMOUSEMOVE()
local posx1, posy1 = GameApi.GetCursorPos()
local resault = DlgApi.GetItemLink(self.this, "Txt_HelpText", posx1, posy1)
	if resault == nil then
		--GameApi.ScriptChangeCursor(0)
	else
		--GameApi.ScriptChangeCursor(14)
	end
	return true;
end
