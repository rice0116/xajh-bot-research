--[[#tag push auto]]

local DlgTemplate = DlgTemplate
local GameApi = GameApi
local DlgApi  = DlgApi

Win_KeyWordHelp = DlgTemplate:new({this = --[[!AUTO_1]]"Win_KeyWordHelp"})

------------------------------------
-- 文本设置相关变量
------------------------------------
local pageindex = 1
local fristpage = --[[!AUTO_2]]""
------------------------------------
-- 界面初始化
------------------------------------
function Win_KeyWordHelp:Init()
	self:RegisterEvent(WM_LBUTTONDOWN, self.OnLButtonDown);
	self:RegisterEvent(WM_MOUSEMOVE, self.OnMOUSEMOVE);
	self:RegisterEvent(--[[!AUTO_3]]"Btn_Close", self.OnClose)
end

------------------------------------
-- 开启界面
------------------------------------
function Win_KeyWordHelp:ShowDialog()
	pageindex = 1
	fristpage = KeyWord
	DlgApi.ShowItem(--[[!AUTO_4]]"Win_KeyWordHelp", --[[!AUTO_5]]"Btn_FristPage", false)
	DlgApi.SetItemText(self.this, --[[!AUTO_6]]"Txt_KeyInfo", --[[!AUTO_7]]"")
	DlgApi.AppendItemText(self.this, --[[!AUTO_8]]"Txt_KeyInfo", self:EditText(KeyWord_Text))
	DlgApi.SetItemText(self.this, --[[!AUTO_9]]"Txt_AutoMove", --[[!AUTO_10]]"")
	DlgApi.AppendItemText(self.this, --[[!AUTO_11]]"Txt_AutoMove", self:BuildPath(KeyWord_Npc))
end

------------------------------------
-- 关闭界面
------------------------------------
function Win_KeyWordHelp:OnClose()
	DlgApi.ShowDialog(--[[!AUTO_12]]"Win_KeyWordHelp", false)
end

------------------------------------
-- 寻径转换
------------------------------------
function Win_KeyWordHelp:BuildPath(id)
	local str = --[[!AUTO_13]]""
	if ObjInfo[id] then
		local curx, cury = GameApi.GetMapOffset(ObjInfo[id].SID)
		local Title = string.format(--[[!AUTO_14]]"%s - %s[%d,%d]", ObjInfo[id].scene, ObjInfo[id].name, ObjInfo[id].x - curx, ObjInfo[id].z - cury)
		str = --[[!AUTO_15]]"^ff7e00出售地點：" .. GameApi.ConvertItemLinkText(Title, tostring(id), color["粉色"])
	else
		str = --[[!AUTO_16]]""
	end
	return str
end

------------------------------------
-- 按键操作
------------------------------------
function Win_KeyWordHelp:OnLButtonDown(objName)
	if objName == --[[!AUTO_17]]"Txt_AutoMove" then
		local posx2, posy2 = GameApi.GetCursorPos()
		local pathid = tonumber(DlgApi.GetItemLink(self.this, --[[!AUTO_18]]"Txt_AutoMove", posx2, posy2))
		if pathid ~= 0 then
			self:GetNpcInfo(pathid)
		end
	end
	if objName == --[[!AUTO_19]]"Txt_KeyInfo" then
		local posx2, posy2 = GameApi.GetCursorPos()
		local KeyWord = DlgApi.GetItemLink(self.this, --[[!AUTO_20]]"Txt_KeyInfo", posx2, posy2)
		if KeyWord then
			pageindex = pageindex + 1
			if pageindex >= 2 then
				DlgApi.ShowItem(--[[!AUTO_21]]"Win_KeyWordHelp", --[[!AUTO_22]]"Btn_FristPage", true)
			end
			self:ShowText(KeyWord)
		end
	end
	if objName == --[[!AUTO_23]]"Btn_FristPage" then
		local fpg = fristpage
		pageindex = pageindex - 1
		self:ShowText(fpg)
		if pageindex == 1 then
			DlgApi.ShowItem(--[[!AUTO_24]]"Win_KeyWordHelp", --[[!AUTO_25]]"Btn_FristPage", false)
		end
	end
end
------------------------------------
-- 控件文字显示
------------------------------------
function Win_KeyWordHelp:ShowText(str)
	DlgApi.SetItemText(self.this, --[[!AUTO_26]]"Txt_KeyInfo", --[[!AUTO_27]]"")
	DlgApi.AppendItemText(self.this, --[[!AUTO_28]]"Txt_KeyInfo", self:EditText(Help_KeyWord[str].text))
	DlgApi.SetItemText(self.this, --[[!AUTO_29]]"Txt_AutoMove", --[[!AUTO_30]]"")
	DlgApi.AppendItemText(self.this, --[[!AUTO_31]]"Txt_AutoMove", self:BuildPath(Help_KeyWord[str].NPC))
end
------------------------------------
-- 获取NPC信息
------------------------------------
function Win_KeyWordHelp:GetNpcInfo(id)
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

------------------------------------
-- 获取需要显示的文本
------------------------------------
function Win_KeyWordHelp:EditText(searchstring)
local str = --[[!AUTO_32]]""
	if searchstring ~= --[[!AUTO_33]]"" then
		str = self:FindKeyWord(searchstring)
	end
	return str
end

------------------------------------
-- 遍历关键字
------------------------------------
function Win_KeyWordHelp:FindKeyWord(keystring)
	 for k, v in pairs(Help_KeyWord) do
		keystring = string.gsub(keystring, k, GameApi.ConvertItemLinkText(v.title, k, v.color))
	 end
	 return keystring
end

------------------------------------
-- 鼠标操作
------------------------------------
function Win_KeyWordHelp:OnMOUSEMOVE()
local posx1, posy1 = GameApi.GetCursorPos()
local resault = DlgApi.GetItemLink(self.this, --[[!AUTO_34]]"Txt_AutoMove", posx1, posy1)
local resault1 = DlgApi.GetItemLink(self.this, --[[!AUTO_35]]"Txt_KeyInfo", posx1, posy1)
	if resault == nil then
		GameApi.ScriptChangeCursor(0)
	else
		GameApi.ScriptChangeCursor(20)
	end

	if resault1 == nil then
		GameApi.ScriptChangeCursor(0)
	else
		GameApi.ScriptChangeCursor(16)
	end
	return true;
end
