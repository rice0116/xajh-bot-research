--[[
  description:   the template for all dialogs.
  author:      Wang Kuiwu (wangkuiwu@world2.cn)
  Copyright (c) , All Rights Reserved.
  warning:   Please do NOT modify this file.  Contact me if any question.
  警告   ：  请不要修改本文件。如有问题请与我联系。
  说明 1. 对于windows message的响应函数，必须有返回值
		  true表示响应了该message，false表示没有。
]]--



-----------------global func--------------
-- can make cpp define the DlgTemplate method  directly, not in another table,
-- Maybe better? NOT sure.

local DlgApi = DlgApi      --from c

------------------------------------------------------
--配置
------------------------------------------------------
ShowHelpDialogName = ""  -- 帮助窗口名
OldHelpDialogName = ""   -- 存储已开启的帮助窗口

-----------------template implementation--------------
DlgTemplate =
{
this = 0,
eventMap = {}
}

-----------------create DebugFunction-----------------------
Debug_ScriptList = {}
function ExInEdMode(ScriptName)
	table.insert(Debug_ScriptList, #(Debug_ScriptList) + 1, ScriptName)
end

-------------------create instance--------------------------
function  DlgTemplate:new(datamember)
  local inst = CreateObj(self, datamember)
  inst.eventMap['IDCANCEL'] =  self.OnCancel
  return inst
end

function DlgTemplate:RegisterEvent(event, handler)
    if  event and handler then
        self.eventMap[event] = handler
    else  -- need report ???

    end
end

function DlgTemplate:UnRegisterEvent(event)
    self.eventMap[event] = nil
end


function DlgTemplate:OnEventMap( event, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8)
    local handler = self.eventMap[event];
    if not handler then
    	return false;
    end
	local ret = handler(self, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8);
	if ret ~= nil then
		return ret;
    else
    	return true;  --handler default return true
    end
end

function DlgTemplate:OnCancel()
      DlgApi.ShowDialog(self.this, false)
end

function DlgTemplate:OnMessageBox(name, bRet)
end

------------------------------------
-- 获取当前对应帮助名称
------------------------------------
function DlgTemplate:HelpDialogName(DialogName,ParentDialogName)
	if ParentDialogName == nil then
		ShowHelpDialogParentName = DialogName
	else
		ShowHelpDialogParentName = ParentDialogName
	end
	if DialogName ~= "" then
		ShowHelpDialogName = DialogName
		if OldHelpDialogName == "" then
			OldHelpDialogName = ShowHelpDialogName
		else
			if OldHelpDialogName ~= ShowHelpDialogName then
				OldHelpDialogName = ShowHelpDialogName
			end
		end
		
		local dlgisshow = DlgApi.IsDialogShow("Win_HelpText")
		local itemisshow = DlgApi.IsItemShow(OldHelpDialogName, "Img_XAJHHelpDialogImage")
		if Help_AllText[DialogName] then
			DlgApi.ShowDialog("Win_HelpText", not dlgisshow);
		else
			if DialogName ~= "Win_InstanceInfoTips" then
				KeyWord = "{" .. DialogName .. "}"
				KeyWord_Text = Help_KeyWord[ "{" .. DialogName .. "}"].text
				DlgApi.ShowDialog("Win_KeyWordHelp", true);
			else
				local SceneID = GameApi.GetSceneID()
				if Help_KeyWord[ "{" .. SceneID .. "}"] then
					KeyWord = "{" .. SceneID .. "}"
					KeyWord_Text = Help_KeyWord[ "{" .. SceneID .. "}"].text
					DlgApi.ShowDialog("Win_KeyWordHelp", true);
				else
					LogPrint("此副本没有对应的帮助说明")
				end
			end
		end
	end
end

function DlgTemplate:HelpDialogName2(DialogName,ParentDialogName)
	
	if DialogName ~= "" then
		ShowHelpDialogName = ParentDialogName
		if OldHelpDialogName == "" then
			OldHelpDialogName = DialogName
		else
			if OldHelpDialogName ~= DialogName then
				OldHelpDialogName = DialogName
			end
		end
		
		local dlgisshow = DlgApi.IsDialogShow("Win_HelpText")
		local itemisshow = DlgApi.IsItemShow(OldHelpDialogName, "Img_XAJHHelpDialogImage")
		if Help_AllText[DialogName] then
			DlgApi.ShowDialog("Win_HelpText", not dlgisshow);
		else
			if DialogName ~= "Win_InstanceInfoTips" then
				KeyWord = "{" .. DialogName .. "}"
				KeyWord_Text = Help_KeyWord[ "{" .. DialogName .. "}"].text
				DlgApi.ShowDialog("Win_KeyWordHelp", true);
			else
				local SceneID = GameApi.GetSceneID()
				if Help_KeyWord[ "{" .. SceneID .. "}"] then
					KeyWord = "{" .. SceneID .. "}"
					KeyWord_Text = Help_KeyWord[ "{" .. SceneID .. "}"].text
					DlgApi.ShowDialog("Win_KeyWordHelp", true);
				else
					LogPrint("此副本没有对应的帮助说明")
				end
			end
		end
	end
end

-----------------overload method----------------------
function DlgTemplate:Init()
end



function DlgTemplate:ShowDialog()
end

function DlgTemplate:HideDialog()
end


function DlgTemplate:Release()
end

function DlgTemplate:IsTick()
   return (self.Tick ~= nil);
end

function DlgTemplate:IsRender()
 	 return (self.Render ~= nil);
end

