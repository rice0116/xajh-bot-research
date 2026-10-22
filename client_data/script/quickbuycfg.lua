--[[#tag push auto]]

QuickBuyCfg = {}

QuickBuyCfg.Button2ItemId = {
    --{���ٹ�����������, ���ٹ���ť������, ���ٹ�����ƷIDΪmalldata�ļ��е���ƷID}
    --����:{"DialogName", "ButtonName", 99999},
	{"Win_Inventory", "But_QuickBuy", 1198},
	{"Win_EquipServ_AnimaReinforce", "But_QuickBuy", 1417},
	{"Win_EquipServ_AnimaRebuild", "But_QuickBuy", 1418},
	{"Win_KungfuSoulSwallow", "But_QuickBuy", 1230},
	{"Win_EquipServ_StoneCompose", "But_QuickBuy", 211},
	{"Win_EquipServ_StoneUpgrade", "But_QuickBuy", 1345},
	{"Win_FactionDonateMoney", "Btn_QuickBuy", 2021},
}

local Button2ItemId = {}

function QuickBuyCfg:Init()
	for k,v in pairs(QuickBuyCfg.Button2ItemId) do
		if type(v) == "table" and table.getn(v)==3 then
			local strNameLink = v[1]..v[2]
			Button2ItemId[strNameLink] = v[3]
		end
	end
end

function QuickBuyCfg:GetItemIdByButtonName(Name)
	if Button2ItemId[Name]  then
		return Button2ItemId[Name]
	else
		return 0
	end
end

QuickBuyCfg:Init()
