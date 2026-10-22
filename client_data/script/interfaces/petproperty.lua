local DlgTemplate = DlgTemplate
local DlgApi  = DlgApi
local GameApi = GameApi

ShowHelpDialogName = "" -- 用来存储当前需要显示什么帮助信息

Win_PetProperty = DlgTemplate:new({this = "Win_PetProperty"})

function Win_PetProperty:Init()
	self:RegisterEvent("Btn_PetHelp", self.OnPetHelp);
	DlgApi.ShowItem(self.this, "Img_HelpPet", false);
end

function Win_PetProperty:ShowDialog()
	DlgApi.ShowItem(self.this, "Img_HelpPet", false);
end

function Win_PetProperty:OnPetHelp()
	ShowHelpDialogName = self.this
	local dlgisshow = DlgApi.IsDialogShow("Win_HelpText")
	local itemisshow = DlgApi.IsItemShow(self.this, "Img_HelpPet")
	DlgApi.ShowItem(self.this, "Img_HelpPet", not itemisshow);
	DlgApi.ShowDialog("Win_HelpText", not dlgisshow);
end


