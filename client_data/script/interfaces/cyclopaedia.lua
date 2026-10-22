-- 百科全书字典
--------------------------------------------------------------------
--人物	11	官职			战斗	21	兵种		装备	31	升级
--		12	结婚					22	历练				32	武器
--		13	称号					23	技能				33	防具
--		14	图鉴					24	专精				34	宝物
--		15	声望					25	骑战				35	配饰
--------------------------------------------------------------------
--物品	41	秘文			任务	51	主线		战场	61	战场
--		42	符玉					52	支线				62	无双
--		43	坐骑					53	活动				63	外传
--		44	消耗					54	国家				64	征战
--		45	材料					55	日常				65	演义
--------------------------------------------------------------------
--生活	71	生产			社交	81	综合		特色	91	拖管
--		72	铁匠					82	结义				92	古币
--		73	裁缝					83	军团				93	读书
--		74	巧匠工匠驯养			84	阵营				94	连招
--		75	急救药师烹饪			85	国战				95	时装
--------------------------------------------------------------------
CYCLOPAEDIA_DICT = {}
-- CYCLOPAEDIA_DICT[2] = {keyword = "百科全书" , class = 11 , content = "百科全书测试版说明。"}
CYCLOPAEDIA_DICT[2] = {keyword = "百科全书" , class = 11 , content = "百科全书测试版说明。"}
CYCLOPAEDIA_DICT[23] = {keyword = "铁匠配方" , class = 32 , content = "铁匠配方测试版说明。"}
CYCLOPAEDIA_DICT[75] = {keyword = "铁匠说明" , class = 95 , content = "铁匠说明测试版说明。"}

-- 百科全书相关描述
TEXT_CYCLOPAEDIA_NORMALRESULT = "^fedc40搜索^ffffff%s^fedc40结果：共^ffffff%s^fedc40个。"
TEXT_CYCLOPAEDIA_NORMALNOKEYWORD = "^fedc40请输入合适的^ffffff关键词^fedc40。"
TEXT_CYCLOPAEDIA_SETTING = "查找分类列表"
TEXT_CYCLOPAEDIA_SETTINGSAVE = "保存设置"
TEXT_CYCLOPAEDIA_SETTINGBUTTON = "查找设置"
TEXT_CYCLOPAEDIA_SETTINGWARNING = "设置内未勾选任何分类"
TEXT_CYCLOPAEDIA_SETTINGALL = "当前已设置为全百科查询"
TEXT_CYCLOPAEDIA_CONTENT = "详细资料"
TEXT_CYCLOPAEDIA_PLZINPUTKEYWORD = "请在^ffffff↑^fedc40的框内输入关键词"
TEXT_CYCLOPAEDIA_ALLRESULT = "^fedc40当前分类设置下的共有^ffffff%s^fedc40条内容。"
TEXT_CYCLOPAEDIA_ALLRESULTNULL = "^fedc40当前分类暂未开放，请在^ffffff查找设置^fedc40中调整。"
TEXT_CYCLOPAEDIA_DEFAULTSEARCHFILTER = "111111111111111111111111111111111111111111111"

-- cyclopaedia class
CYCLOPAEDIA_CLASS = {}
CYCLOPAEDIA_CLASS[1] = {category = 1 , class = 11 }
CYCLOPAEDIA_CLASS[2] = {category = 1 , class = 12 }
CYCLOPAEDIA_CLASS[3] = {category = 1 , class = 13 }
CYCLOPAEDIA_CLASS[4] = {category = 1 , class = 14 }
CYCLOPAEDIA_CLASS[5] = {category = 1 , class = 15 }
CYCLOPAEDIA_CLASS[6] = {category = 2 , class = 21 }
CYCLOPAEDIA_CLASS[7] = {category = 2 , class = 22 }
CYCLOPAEDIA_CLASS[8] = {category = 2 , class = 23 }
CYCLOPAEDIA_CLASS[9] = {category = 2 , class = 24 }
CYCLOPAEDIA_CLASS[10] = {category = 2 , class = 25 }
CYCLOPAEDIA_CLASS[11] = {category = 3 , class = 31 }
CYCLOPAEDIA_CLASS[12] = {category = 3 , class = 32 }
CYCLOPAEDIA_CLASS[13] = {category = 3 , class = 33 }
CYCLOPAEDIA_CLASS[14] = {category = 3 , class = 34 }
CYCLOPAEDIA_CLASS[15] = {category = 3 , class = 35 }
CYCLOPAEDIA_CLASS[16] = {category = 4 , class = 41 }
CYCLOPAEDIA_CLASS[17] = {category = 4 , class = 42 }
CYCLOPAEDIA_CLASS[18] = {category = 4 , class = 43 }
CYCLOPAEDIA_CLASS[19] = {category = 4 , class = 44 }
CYCLOPAEDIA_CLASS[20] = {category = 4 , class = 45 }
CYCLOPAEDIA_CLASS[21] = {category = 5 , class = 51 }
CYCLOPAEDIA_CLASS[22] = {category = 5 , class = 52 }
CYCLOPAEDIA_CLASS[23] = {category = 5 , class = 53 }
CYCLOPAEDIA_CLASS[24] = {category = 5 , class = 54 }
CYCLOPAEDIA_CLASS[25] = {category = 5 , class = 55 }
CYCLOPAEDIA_CLASS[26] = {category = 6 , class = 61 }
CYCLOPAEDIA_CLASS[27] = {category = 6 , class = 62 }
CYCLOPAEDIA_CLASS[28] = {category = 6 , class = 63 }
CYCLOPAEDIA_CLASS[29] = {category = 6 , class = 64 }
CYCLOPAEDIA_CLASS[30] = {category = 6 , class = 65 }
CYCLOPAEDIA_CLASS[31] = {category = 7 , class = 71 }
CYCLOPAEDIA_CLASS[32] = {category = 7 , class = 72 }
CYCLOPAEDIA_CLASS[33] = {category = 7 , class = 73 }
CYCLOPAEDIA_CLASS[34] = {category = 7 , class = 74 }
CYCLOPAEDIA_CLASS[35] = {category = 7 , class = 75 }
CYCLOPAEDIA_CLASS[36] = {category = 8 , class = 81 }
CYCLOPAEDIA_CLASS[37] = {category = 8 , class = 82 }
CYCLOPAEDIA_CLASS[38] = {category = 8 , class = 83 }
CYCLOPAEDIA_CLASS[39] = {category = 8 , class = 84 }
CYCLOPAEDIA_CLASS[40] = {category = 8 , class = 85 }
CYCLOPAEDIA_CLASS[41] = {category = 9 , class = 91 }
CYCLOPAEDIA_CLASS[42] = {category = 9 , class = 92 }
CYCLOPAEDIA_CLASS[43] = {category = 9 , class = 93 }
CYCLOPAEDIA_CLASS[44] = {category = 9 , class = 94 }
CYCLOPAEDIA_CLASS[45] = {category = 9 , class = 95 }

-- cyclopaedia class opposite
CYCLOPAEDIA_CLASSOP = {}
CYCLOPAEDIA_CLASSOP[11] = 1
CYCLOPAEDIA_CLASSOP[12] = 2
CYCLOPAEDIA_CLASSOP[13] = 3
CYCLOPAEDIA_CLASSOP[14] = 4
CYCLOPAEDIA_CLASSOP[15] = 5
CYCLOPAEDIA_CLASSOP[21] = 6
CYCLOPAEDIA_CLASSOP[22] = 7
CYCLOPAEDIA_CLASSOP[23] = 8
CYCLOPAEDIA_CLASSOP[24] = 9
CYCLOPAEDIA_CLASSOP[25] = 10
CYCLOPAEDIA_CLASSOP[31] = 11
CYCLOPAEDIA_CLASSOP[32] = 12
CYCLOPAEDIA_CLASSOP[33] = 13
CYCLOPAEDIA_CLASSOP[34] = 14
CYCLOPAEDIA_CLASSOP[35] = 15
CYCLOPAEDIA_CLASSOP[41] = 16
CYCLOPAEDIA_CLASSOP[42] = 17
CYCLOPAEDIA_CLASSOP[43] = 18
CYCLOPAEDIA_CLASSOP[44] = 19
CYCLOPAEDIA_CLASSOP[45] = 20
CYCLOPAEDIA_CLASSOP[51] = 21
CYCLOPAEDIA_CLASSOP[52] = 22
CYCLOPAEDIA_CLASSOP[53] = 23
CYCLOPAEDIA_CLASSOP[54] = 24
CYCLOPAEDIA_CLASSOP[55] = 25
CYCLOPAEDIA_CLASSOP[61] = 26
CYCLOPAEDIA_CLASSOP[62] = 27
CYCLOPAEDIA_CLASSOP[63] = 28
CYCLOPAEDIA_CLASSOP[64] = 29
CYCLOPAEDIA_CLASSOP[65] = 30
CYCLOPAEDIA_CLASSOP[71] = 31
CYCLOPAEDIA_CLASSOP[72] = 32
CYCLOPAEDIA_CLASSOP[73] = 33
CYCLOPAEDIA_CLASSOP[74] = 34
CYCLOPAEDIA_CLASSOP[75] = 35
CYCLOPAEDIA_CLASSOP[81] = 36
CYCLOPAEDIA_CLASSOP[82] = 37
CYCLOPAEDIA_CLASSOP[83] = 38
CYCLOPAEDIA_CLASSOP[84] = 39
CYCLOPAEDIA_CLASSOP[85] = 40
CYCLOPAEDIA_CLASSOP[91] = 41
CYCLOPAEDIA_CLASSOP[92] = 42
CYCLOPAEDIA_CLASSOP[93] = 43
CYCLOPAEDIA_CLASSOP[94] = 44
CYCLOPAEDIA_CLASSOP[95] = 45

-- searchlst : searchlist
-- searchflt : searchfilter
local Dlp = DlgTemplate
local DlgApi  = DlgApi
local GameApi = GameApi
local Format = string.format
local searchlst = {}
local searchflt = ""

Win_Cyclopaedia = Dlp:new({this = "Win_Cyclopaedia"})

-- function : hide search
function Win_Cyclopaedia:HideSearch()
	local ctrlname
	for k , v in pairs(CYCLOPAEDIA_CLASS) do
		ctrlname = string.format("%s%s" , "Lab_Class" , v.class)
		DlgApi.ShowItem(self.this, ctrlname, false);
		ctrlname = string.format("%s%s" , "Chk_Class" , v.class)
		DlgApi.ShowItem(self.this, ctrlname, false);
	end
	for i=1,9 do
		ctrlname = string.format("%s%s" , "Lab_Category" , i)
		DlgApi.ShowItem(self.this, ctrlname, false);
		ctrlname = string.format("%s%s" , "Chk_Category" , i)
		DlgApi.ShowItem(self.this, ctrlname, false);
	end	
	DlgApi.ShowItem(self.this, "Btn_SelectAll", false);
	DlgApi.ShowItem(self.this, "Btn_DeselectAll", false);
 	DlgApi.ShowItem(self.this, "Bg_Cat1", false);
 	DlgApi.ShowItem(self.this, "Bg_Cat2", false);
 	DlgApi.ShowItem(self.this, "Bg_Cat3", false);
	DlgApi.ShowItem(self.this, "Bg_Cat4", false);
	DlgApi.ShowItem(self.this, "Bg_Cat5", false);
 	DlgApi.ShowItem(self.this, "Bg_Cat6", false);
	DlgApi.ShowItem(self.this, "Bg_Cat7", false);
 	DlgApi.ShowItem(self.this, "Bg_Cat8", false);
	DlgApi.ShowItem(self.this, "Bg_Cat9", false);
end

-- function : show search
function Win_Cyclopaedia:ShowSearch()
	local ctrlname
	for k , v in pairs(CYCLOPAEDIA_CLASS) do
		ctrlname = string.format("%s%s" , "Lab_Class" , v.class)
		DlgApi.ShowItem(self.this, ctrlname, true);
		ctrlname = string.format("%s%s" , "Chk_Class" , v.class)
		DlgApi.ShowItem(self.this, ctrlname, true);
	end
	for i = 1 , 9 do
		ctrlname = string.format("%s%s" , "Lab_Category" , i)
		DlgApi.ShowItem(self.this, ctrlname, true);
		ctrlname = string.format("%s%s" , "Chk_Category" , i)
		DlgApi.ShowItem(self.this, ctrlname, true);
	end
	DlgApi.ShowItem(self.this, "Btn_SelectAll", true);
	DlgApi.ShowItem(self.this, "Btn_DeselectAll", true);
 	DlgApi.ShowItem(self.this, "Bg_Cat1", true);
 	DlgApi.ShowItem(self.this, "Bg_Cat2", true);
 	DlgApi.ShowItem(self.this, "Bg_Cat3", true);
	DlgApi.ShowItem(self.this, "Bg_Cat4", true);
	DlgApi.ShowItem(self.this, "Bg_Cat5", true);
 	DlgApi.ShowItem(self.this, "Bg_Cat6", true);
	DlgApi.ShowItem(self.this, "Bg_Cat7", true);
 	DlgApi.ShowItem(self.this, "Bg_Cat8", true);
	DlgApi.ShowItem(self.this, "Bg_Cat9", true);
end

-- function : keywordsearch
function Win_Cyclopaedia:KwSearch(searchlib , searchkw)
	local schid = 0
	local schlst = {}
	local schrst = {}
		for k , v in pairs(searchlib) do
		    if string.sub(searchflt , CYCLOPAEDIA_CLASSOP[v.class] , CYCLOPAEDIA_CLASSOP[v.class]) == "1" then
		    	if string.find(v.keyword , searchkw) and string.find(v.content , searchkw) ~= nil then
				schid = schid + 1
				schlst[schid] = k
				schrst[schid] = v.keyword
				end
		    end
		end
	return schid , schlst , schrst
end

-- dialog : init
function Win_Cyclopaedia:Init()
	searchlst = nil
	searchflt = TEXT_CYCLOPAEDIA_DEFAULTSEARCHFILTER

	for k , v in pairs(CYCLOPAEDIA_CLASS) do
		local ischktrue = string.sub(searchflt , k , k)
		if ischktrue == "1" then
			local ctrlname = string.format("%s%s" , "Chk_Class" , v.class)
			DlgApi.CheckItem (self.this , ctrlname, true)
		end
	end

	for i = 1 , 9 do
		local ischktrue = string.sub(searchflt , 5*i-4 , 5*i)
		if ischktrue == "11111" then
			local ctrlname = string.format("%s%s" , "Chk_Category" , i)
			DlgApi.CheckItem (self.this , ctrlname, true)
		end
	end

	self:RegisterEvent("Btn_Close", self.OnClose);
	self:RegisterEvent("Btn_Search", self.OnSearch);
	self:RegisterEvent("Btn_Setting", self.OnSetting);
	self:RegisterEvent("Btn_Clear", self.OnClear);
	self:RegisterEvent("Btn_ShowAll", self.OnShowAll);	
	self:RegisterEvent("Btn_SelectAll", self.SelectAll);
	self:RegisterEvent("Btn_DeselectAll", self.DeselectAll);
	self:RegisterEvent(WM_LBUTTONDOWN, self.OnLButtonDown);
	
	DlgApi.ShowItem(self.this, "Gfx_Searching", false);
	DlgApi.ShowItem(self.this, "Gfx_Setting", false);
	Win_Cyclopaedia:HideSearch()
end

-- event : button close dialog
function Win_Cyclopaedia:OnClose()
	DlgApi.ShowDialog("Win_Cyclopaedia", false);
end

-- event : button search
function Win_Cyclopaedia:OnSearch()
	local searchkw = DlgApi.GetItemText(self.this, "Edt_Search");
	local searchrst = {}
	local searchrstnull = {}
	searchlst = nil
	if searchkw ~= "" then
		DlgApi.ShowItem(self.this, "Gfx_Searching", true);
		searchcount , searchlst , searchrst = Win_Cyclopaedia:KwSearch(CYCLOPAEDIA_DICT , searchkw)
		local searchcounttext = string.format(TEXT_CYCLOPAEDIA_NORMALRESULT , searchkw , searchcount)
		DlgApi.SetItemText(self.this, "Lab_List", searchcounttext)
		DlgApi.SetListText(self.this, "List_Result", searchrst)
		DlgApi.SetItemText(self.this , "Txt_Content" , "")
		DlgApi.ShowItem(self.this, "Gfx_Searching", false);
	else
	    DlgApi.SetItemText(self.this, "Lab_List" , TEXT_CYCLOPAEDIA_NORMALNOKEYWORD)
   		DlgApi.SetListText(self.this, "List_Result" , searchrstnull)
		DlgApi.SetItemText(self.this , "Txt_Content" , "")
		DlgApi.ChangeFocus(self.this , "Edt_Search" , true)
	end
end

-- event : button setting
function Win_Cyclopaedia:OnSetting()
    if DlgApi.IsItemShow(self.this, "Gfx_Setting") == false then
	 	DlgApi.ShowItem(self.this, "Gfx_Setting", true);
   		DlgApi.ShowItem(self.this, "Txt_Content", false);
	   	DlgApi.SetItemText(self.this , "Lab_Content" , TEXT_CYCLOPAEDIA_SETTING)
		DlgApi.SetItemText(self.this , "Btn_Setting" , TEXT_CYCLOPAEDIA_SETTINGSAVE)
		DlgApi.EnableItem(self.this , "Edt_Search" , false);
		DlgApi.EnableItem(self.this , "Btn_ShowAll" , false);
		DlgApi.EnableItem(self.this , "Btn_Search" , false);
		DlgApi.EnableItem(self.this , "Btn_Clear" , false);	
		DlgApi.EnableItem(self.this , "List_Result" , false);
		DlgApi.EnableItem(self.this , "Lab_List" , false);
		Win_Cyclopaedia:ShowSearch()
    else
        DlgApi.ShowItem(self.this, "Gfx_Setting", false);
   		DlgApi.ShowItem(self.this, "Txt_Content", true);
		DlgApi.SetItemText(self.this , "Btn_Setting" , TEXT_CYCLOPAEDIA_SETTINGBUTTON)
		DlgApi.EnableItem(self.this , "Edt_Search" , true);
		DlgApi.EnableItem(self.this , "Btn_ShowAll" , true);
		DlgApi.EnableItem(self.this , "Btn_Search" , true);
		DlgApi.EnableItem(self.this , "Btn_Clear" , true);	
		DlgApi.EnableItem(self.this , "List_Result" , true);
		DlgApi.EnableItem(self.this , "Lab_List" , true);
		local newsearchflt = ""
		local ctrlname
		for k , v in pairs(CYCLOPAEDIA_CLASS) do
			ctrlname = string.format("%s%s" , "Chk_Class" , v.class)
    		if DlgApi.IsItemChecked(self.this , ctrlname) == true then
    		    newsearchflt = newsearchflt .. "1"
    		else
    		    newsearchflt = newsearchflt .. "0"
    		end
		end
		if newsearchflt == "000000000000000000000000000000000000000000000" then
		   	DlgApi.SetItemText(self.this , "Lab_Content" , TEXT_CYCLOPAEDIA_SETTINGWARNING)
		elseif newsearchflt == "111111111111111111111111111111111111111111111" then
		   	DlgApi.SetItemText(self.this , "Lab_Content" , TEXT_CYCLOPAEDIA_SETTINGALL)		   	
		else
   		   	DlgApi.SetItemText(self.this , "Lab_Content" , TEXT_CYCLOPAEDIA_CONTENT)
		end
		searchflt = newsearchflt
		Win_Cyclopaedia:HideSearch()
    end
end

-- event : button clear
function Win_Cyclopaedia:OnClear()
	local nulltab = {}
	DlgApi.SetListText(self.this, "List_Result" , nulltab)
	DlgApi.SetItemText(self.this , "Txt_Content" , "")
	DlgApi.SetItemText(self.this , "Edt_Search" , "")
	DlgApi.SetItemText(self.this , "Lab_List" , TEXT_CYCLOPAEDIA_PLZINPUTKEYWORD)
	DlgApi.ChangeFocus(self.this , "Edt_Search" , true)
end

-- event : button showall
function Win_Cyclopaedia:OnShowAll()
	local searchrst = {}
	local searchrstnull = {}
	searchlst = nil
	DlgApi.ShowItem(self.this, "Gfx_Searching", true);
	searchcount , searchlst , searchrst = Win_Cyclopaedia:KwSearch(CYCLOPAEDIA_DICT , "")
	local searchcounttext = string.format(TEXT_CYCLOPAEDIA_ALLRESULT , searchcount)
	if searchcount == 0 then
	    DlgApi.SetItemText(self.this, "Lab_List" , TEXT_CYCLOPAEDIA_ALLRESULTNULL)
   		DlgApi.SetListText(self.this, "List_Result" , searchrstnull)
	else
	    DlgApi.SetItemText(self.this, "Lab_List", searchcounttext)
		DlgApi.SetListText(self.this, "List_Result", searchrst)
	end
	DlgApi.SetItemText(self.this , "Txt_Content" , "")
	DlgApi.ShowItem(self.this, "Gfx_Searching", false);
end

-- event : button selectall
function Win_Cyclopaedia:SelectAll()
	for k , v in pairs(CYCLOPAEDIA_CLASS) do
		local ctrlname = string.format("%s%s" , "Chk_Class" , v.class)
		DlgApi.CheckItem (self.this , ctrlname, true)
	end
	for i = 1 , 9 do
		local ctrlname = string.format("%s%s" , "Chk_Category" , i)
		DlgApi.CheckItem (self.this , ctrlname, true)
	end
end

-- event : button deselectall
function Win_Cyclopaedia:DeselectAll()
	for k , v in pairs(CYCLOPAEDIA_CLASS) do
		local ctrlname = string.format("%s%s" , "Chk_Class" , v.class)
		DlgApi.CheckItem (self.this , ctrlname, false)
	end
	for i = 1 , 9 do
		local ctrlname = string.format("%s%s" , "Chk_Category" , i)
		DlgApi.CheckItem (self.this , ctrlname, false)
	end
end

-- event : l mouse down
function Win_Cyclopaedia:OnLButtonDown(name)
	if name == "List_Result" then --click on listbox
		local ctid = DlgApi.GetListCurLine(self.this , "List_Result") + 1
		local ctline = searchlst[ctid]
		DlgApi.SetItemText(self.this , "Lab_Content" , CYCLOPAEDIA_DICT[ctline].keyword)
		DlgApi.SetItemText(self.this , "Txt_Content" , CYCLOPAEDIA_DICT[ctline].content)
	elseif string.sub(name , 1 , 6) == "Chk_Ca" then -- click on category
		local catst = DlgApi.IsItemChecked(self.this , name)
		local catid = string.byte(name , -1) - 48
		for k , v in pairs(CYCLOPAEDIA_CLASS) do
    		if v.category == catid then
    			local ctrlname = string.format("%s%s" , "Chk_Class" , v.class)
    			DlgApi.CheckItem(self.this , ctrlname , not catst)
    		end
		end
	elseif string.sub(name , 1 , 6) == "Chk_Cl" then -- click on class
	    local clalt = string.byte(name , -1) - 48
		local claid = string.byte(name , -2) - 48
		local catistrue = true
		local ctrlname
		for i = claid * 10 + 1 , claid * 10 + 5 do
			ctrlname = string.format("%s%s" , "Chk_Class" , i)
			if i == claid * 10 + clalt then
				catistrue = catistrue and (not DlgApi.IsItemChecked(self.this , ctrlname))
			else
			    catistrue = catistrue and DlgApi.IsItemChecked(self.this , ctrlname)
			end
		end
		ctrlname = string.format("%s%s" , "Chk_Category" , claid)
		DlgApi.CheckItem(self.this , ctrlname , catistrue)
	end		
end

