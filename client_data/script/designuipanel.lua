local Dlp = DlgTemplate
local DlgApi  = DlgApi
local GameApi = GameApi
local Format = string.format

UD_DesignUIPanel = Dlp:new({this = "UD_DesignUIPanel"})

function UD_DesignUIPanel:Init()
	for k, v in pairs(DESIGN_PANEL_BUTTON) do
	    DlgApi.SetItemText(self.this, v.name, v.text)
	    DlgApi.SetItemHint(self.this, v.name, v.hint)
	    DlgApi.SetItemColor(self.this, v.name, GAME_UI_COLOR[v.offcolor].ired, GAME_UI_COLOR[v.offcolor].igreen, GAME_UI_COLOR[v.offcolor].iblue, GAME_UI_ALPAH_FULL)
	end
    self:RegisterEvent("Btn_DesignCyclopaedia", self.OnCyclopaedia);
    self:RegisterEvent("Btn_DesignGuide", self.OnGuide);
    self:RegisterEvent("Btn_DesignPathfinder", self.OnPathfinder);
    self:RegisterEvent("Btn_DesignItemDroper", self.OnItemDroper);
    self:RegisterEvent("Btn_DesignHelper", self.OnHelper);
    self:RegisterEvent("Btn_DesignUnknown", self.OnUnknown);
end

LuaEvent = {

}

function UD_DesignUIPanel:RegisterGameEvent()
	  return LuaEvent
end

function UD_DesignUIPanel:OnCyclopaedia()
	if DlgApi.IsDialogShow("UD_DesignCyclopaedia") == true then
		DlgApi.ShowDialog("UD_DesignCyclopaedia", false)
	else
		DlgApi.ShowDialog("UD_DesignCyclopaedia", true)
	end
end

function UD_DesignUIPanel:OnGuide()
	GameApi.RunConsoleCmd ("d_cmd 50000")
	GameApi.RunConsoleCmd ("d_cmd 40006")
end

function UD_DesignUIPanel:OnPathfinder()
	if DlgApi.IsDialogShow("UD_DesignPathfinder") == true then
		DlgApi.ShowDialog("UD_DesignPathfinder", false)
	else
		DlgApi.ShowDialog("UD_DesignPathfinder", true)
	end
end

function UD_DesignUIPanel:OnItemDroper()
	if DlgApi.IsDialogShow("UD_DesignItemDroper") == true then
		DlgApi.ShowDialog("UD_DesignItemDroper", false)
	else
		DlgApi.ShowDialog("UD_DesignItemDroper", true)
	end
end

function UD_DesignUIPanel:OnHelper()
	if DlgApi.IsDialogShow("UD_DesignHelper") == true then
		DlgApi.ShowDialog("UD_DesignHelper", false)
	else
		DlgApi.ShowDialog("UD_DesignHelper", true)
	end
end

function UD_DesignUIPanel:OnUnknown()
	if DlgApi.IsDialogShow("UD_DesignUnknown") == true then
		DlgApi.ShowDialog("UD_DesignUnknown", false)
	else
		DlgApi.ShowDialog("UD_DesignUnknown", true)
	end
end

function UD_DesignUIPanel:OnProfGuide()
	DlgApi.ShowDialog("UD_DesignProfGuide", true);
end


--------------------研发小工具配置--------------------
----------------Design Toolset Config-----------------
--定义工具面板 Define Tool Panel
DESIGN_TOOL_BTNSTYLE = "%s%s"
DESIGN_TOOL_SHOWTIP = "^00ffff左键^ffffff选中^fedc40↓^00ffff右键^ffffff执行关闭"
DESIGN_TOOL_RUNTIP = "执行"
DESIGN_PANEL_BUTTON = {}
DESIGN_PANEL_BUTTON[1] = {name = "Btn_DesignCyclopaedia", hint = "资料查询" , text = "书" , offcolor = "标黄" , oncolor = "标绿"}
DESIGN_PANEL_BUTTON[2] = {name = "Btn_DesignGuide", hint = "一键快速功能\r试图强行击杀任意目标\r重置自身所有冷却" , text = "杀" , offcolor = "标黄" , oncolor = "标绿"}
DESIGN_PANEL_BUTTON[3] = {name = "Btn_DesignPathfinder", hint = "快速传送" , text = "飞" , offcolor = "标黄" , oncolor = "标绿"}
DESIGN_PANEL_BUTTON[4] = {name = "Btn_DesignItemDroper", hint = "神秘功能" , text = "秘" , offcolor = "标黄" , oncolor = "标绿"}
DESIGN_PANEL_BUTTON[5] = {name = "Btn_DesignHelper", hint = "调试命令" , text = "神" , offcolor = "标黄" , oncolor = "标绿"}
DESIGN_PANEL_BUTTON[6] = {name = "Btn_DesignUnknown", hint = "实时调试" , text = "调" , offcolor = "标黄" , oncolor = "标绿"}
--定义传送列表 Define Transfer List
DESIGN_TRANS_LIST = {}
DESIGN_TRANS_LIST[1] = {item = "^ffcb4a离开副本专用传送" , line = "d_cmd 2006 0"}
DESIGN_TRANS_LIST[2] = {item = "^d7c4a2派-武当派 SID:6 MAP:x5" , line = "d_cmd 2008 6 -37 -87"}
DESIGN_TRANS_LIST[3] = {item = "^d7c4a2派-少林寺 SID:15 MAP:x14" , line = "d_cmd 2008 15 78 -76"}
DESIGN_TRANS_LIST[4] = {item = "^d7c4a2派-衡山派 SID:5 MAP:x17" , line = "d_cmd 2008 5 30 -70"}
DESIGN_TRANS_LIST[5] = {item = "^d7c4a2派-恒山派 SID:36 MAP:x20" , line = "d_cmd 2008 36 70 -120"}
DESIGN_TRANS_LIST[6] = {item = "^d7c4a2派-逍遥派 SID:18 MAP:x21" , line = "d_cmd 2008 18 -27 -147"}
DESIGN_TRANS_LIST[7] = {item = "^d7c4a2派-日月神教 SID:42 MAP:x22" , line = "d_cmd 2008 42 -16 -101"}
DESIGN_TRANS_LIST[8] = {item = "^d7c4a2派-唐门 SID:33 MAP:x28" , line = "d_cmd 2008 33 4 17"}
DESIGN_TRANS_LIST[9] = {item = "^d7c4a2派-峨嵋派 SID:31 MAP:x29" , line = "d_cmd 2008 31 30 -72"}
DESIGN_TRANS_LIST[10] = {item = "^d7c4a2派-五仙教 SID:26 MAP:x31" , line = "d_cmd 2008 26 140 -43"}
DESIGN_TRANS_LIST[11] = {item = "^d7c4a2派-华山派 SID:10 MAP:x34" , line = "d_cmd 2008 10 105 -87"}
DESIGN_TRANS_LIST[12] = {item = "^d7c4a2派-新少林寺 SID:66 MAP:x60" , line = "d_cmd 2008 66 0 0"}
DESIGN_TRANS_LIST[13] = {item = "^e76041城-老洛阳 SID:12 MAP:x1" , line = "d_cmd 2008 12 12 0"}
DESIGN_TRANS_LIST[14] = {item = "^e76041城-杭州 SID:24 MAP:x10" , line = "d_cmd 2008 24 -52 -28"}
DESIGN_TRANS_LIST[15] = {item = "^e76041城-福州城 SID:2 MAP:x23" , line = "d_cmd 2008 2 35 34"}
DESIGN_TRANS_LIST[16] = {item = "^e76041城-衡山城郊外 SID:4 MAP:x24" , line = "d_cmd 2008 4 18 -97"}
DESIGN_TRANS_LIST[17] = {item = "^e76041城-西安 SID:8 MAP:x37" , line = "d_cmd 2008 8 54 -31"}
DESIGN_TRANS_LIST[18] = {item = "^e76041城-洛阳城 SID:55 MAP:x40" , line = "d_cmd 2008 55 64 -90"}
DESIGN_TRANS_LIST[19] = {item = "^e76041城-大理 SID:27 MAP:x44" , line = "d_cmd 2008 27 47 1"}
DESIGN_TRANS_LIST[20] = {item = "^e76041城-京师 SID:40 MAP:x46" , line = "d_cmd 2008 40 2 -38"}
DESIGN_TRANS_LIST[21] = {item = "^e76041城-衡山城 SID:65 MAP:x53" , line = "d_cmd 2008 65 0 0"}
DESIGN_TRANS_LIST[22] = {item = "^e76041城-新衡山城 SID:67 MAP:x57" , line = "d_cmd 2008 67 6 -14"}
DESIGN_TRANS_LIST[23] = {item = "^e76041城-新福州城 SID:68 MAP:x59" , line = "d_cmd 2008 68 -44 -68"}
DESIGN_TRANS_LIST[24] = {item = "^e76041城-新洛阳城 SID:75 MAP:x64" , line = "d_cmd 2008 75 -295 10"}
DESIGN_TRANS_LIST[25] = {item = "^b6e3bb野-临江镇 SID:54 MAP:x39" , line = "d_cmd 2008 54 21 -38"}
DESIGN_TRANS_LIST[26] = {item = "^b6e3bb野-梅关古道 SID:3 MAP:x56" , line = "d_cmd 2008 3 0 0"}
DESIGN_TRANS_LIST[27] = {item = "^b6e3bb野-武当山 SID:7 MAP:x19" , line = "d_cmd 2008 7 56 -63"}
DESIGN_TRANS_LIST[28] = {item = "^b6e3bb野-药王谷 SID:11 MAP:a03" , line = "d_cmd 2008 11 21 -8"}
DESIGN_TRANS_LIST[29] = {item = "^b6e3bb野-少室山 SID:13 MAP:x18" , line = "d_cmd 2008 13 22 -58"}
DESIGN_TRANS_LIST[30] = {item = "^b6e3bb野-嵩山 SID:14 MAP:a18" , line = "d_cmd 2008 14 129 -153"}
DESIGN_TRANS_LIST[31] = {item = "^b6e3bb野-仙愁峡 SID:16 MAP:x12" , line = "d_cmd 2008 16 63 -82"}
DESIGN_TRANS_LIST[32] = {item = "^b6e3bb野-余杭 SID:17 MAP:x9" , line = "d_cmd 2008 17 2 -5"}
DESIGN_TRANS_LIST[33] = {item = "^b6e4bb野-仙霞岭 SID:19 MAP:x15" , line = "d_cmd 2008 19 -4 -55"}
DESIGN_TRANS_LIST[34] = {item = "^b6e3bb野-廿八铺 SID:20 MAP:x26" , line = "d_cmd 2008 20 -26 -20"}
DESIGN_TRANS_LIST[35] = {item = "^b6e3bb野-龙泉 SID:22 MAP:x11" , line = "d_cmd 2008 22 -8 -40"}
DESIGN_TRANS_LIST[36] = {item = "^b6e3bb野-铸剑谷 SID:21 MAP:x8" , line = "d_cmd 2008 21 78 -12"}
DESIGN_TRANS_LIST[37] = {item = "^b6e3bb野-朱仙镇 SID:37 MAP:x4" , line = "d_cmd 2008 37 57 99"}
DESIGN_TRANS_LIST[38] = {item = "^b6e3bb野-五霸岗 SID:38 MAP:x6" , line = "d_cmd 2008 38 -12 102"}
DESIGN_TRANS_LIST[39] = {item = "^b6e3bb野-泰山 SID:39 MAP:x7" , line = "d_cmd 2008 39 24 48"}
DESIGN_TRANS_LIST[40] = {item = "^b6e3bb野-桂林 SID:43 MAP:x32" , line = "d_cmd 2008 43 -9 -60"}
DESIGN_TRANS_LIST[41] = {item = "^b6e3bb野-南疆 SID:25 MAP:x33" , line = "d_cmd 2008 25 -158 -32"}
DESIGN_TRANS_LIST[42] = {item = "^b6e3bb野-蜀南竹海 SID:32 MAP:x16" , line = "d_cmd 2008 32 -86 -63"}
DESIGN_TRANS_LIST[43] = {item = "^b6e3bb野-乐山 SID:30 MAP:x38" , line = "d_cmd 2008 30 41 -76"}
DESIGN_TRANS_LIST[44] = {item = "^b6e3bb野-青城山 SID:29 MAP:x45" , line = "d_cmd 2008 29 86 -40"}
DESIGN_TRANS_LIST[45] = {item = "^b6e3bb野-剑阁 SID:28 MAP:x47" , line = "d_cmd 2008 28 48 -95"}
DESIGN_TRANS_LIST[46] = {item = "^b6e3bb野-华山 SID:9 MAP:x30" , line = "d_cmd 2008 9 119 -129"}
DESIGN_TRANS_LIST[47] = {item = "^b6e3bb野-蒙古草原 SID:56 MAP:x43" , line = "d_cmd 2008 56 -78 29"}
DESIGN_TRANS_LIST[48] = {item = "^b6e3bb野-阴山草原 SID:60 MAP:x42" , line = "d_cmd 2008 60 -78 29"}
DESIGN_TRANS_LIST[49] = {item = "^b6e3bb野-黑木崖 SID:41 MAP:x35" , line = "d_cmd 2008 41 101 -168"}
DESIGN_TRANS_LIST[50] = {item = "^b6e3bb野-恒山 SID:35 MAP:x41" , line = "d_cmd 2008 35 56 -63"}
DESIGN_TRANS_LIST[51] = {item = "^b6e3bb野-平凉 SID:34 MAP:x49" , line = "d_cmd 2008 34 88 -50"}
DESIGN_TRANS_LIST[52] = {item = "^b6e3bb野-敦煌 SID:44 MAP:x50" , line = "d_cmd 2008 44 0 0"}
DESIGN_TRANS_LIST[53] = {item = "^b6e3bb野-戈壁 SID:49 MAP:x51" , line = "d_cmd 2008 49 97 -123"}
DESIGN_TRANS_LIST[54] = {item = "^b6e3bb野-横屿滩 SID:23 MAP:x52" , line = "d_cmd 2008 23 0 0"}
DESIGN_TRANS_LIST[55] = {item = "^b6e3bb野-桃花岛 SID:50 MAP:x54" , line = "d_cmd 2008 50 0 0"}
DESIGN_TRANS_LIST[56] = {item = "^b6e4bb野-擂台 SID:57 MAP:x244" , line = "d_cmd 2008 57 0 3"}
DESIGN_TRANS_LIST[57] = {item = "^b6e4bb野-市场 SID:58 MAP:x243" , line = "d_cmd 2008 58 60 12"}
DESIGN_TRANS_LIST[58] = {item = "^b6e4bb野-客栈 SID:59 MAP:x245" , line = "d_cmd 2008 59 5 -16"}
DESIGN_TRANS_LIST[59] = {item = "^b6e4bb野-惊蛰城 SID:61 MAP:x24" , line = "d_cmd 2008 61 0 0"}
DESIGN_TRANS_LIST[60] = {item = "^b6e4bb野-云中谷 SID:62 MAP:x8" , line = "d_cmd 2008 62 0 0"}
DESIGN_TRANS_LIST[61] = {item = "^b6e4bb野-黑木崖 SID:63 MAP:x35" , line = "d_cmd 2008 63 0 0"}
DESIGN_TRANS_LIST[62] = {item = "^b6e4bb野-碧水江 SID:64 MAP:a12" , line = "d_cmd 2008 64 0 0"}
DESIGN_TRANS_LIST[63] = {item = "^b6e3bb野-新武当山脚 SID:69 MAP:x48" , line = "d_cmd 2008 69 0 0"}
DESIGN_TRANS_LIST[64] = {item = "^b6e3bb野-福州郊外 SID:72 MAP:x63" , line = "d_cmd 2008 72 0 0"}
DESIGN_TRANS_LIST[65] = {item = "^53b2c0副-结婚大堂 SID:1020 MAP:x246" , line = "d_cmd 2008 1020 0 0"}
DESIGN_TRANS_LIST[66] = {item = "^53b2c0副-新绿竹巷 SID:1005 MAP:x25" , line = "d_cmd 2008 1005 49 -10"}
DESIGN_TRANS_LIST[67] = {item = "^53b2c0副-梅庄地牢 SID:1004 MAP:x27" , line = "d_cmd 2008 1004 -79 1"}
DESIGN_TRANS_LIST[68] = {item = "^53b2c0副-灭门 SID:1006 MAP:a05" , line = "d_cmd 2008 1006 1 7"}
DESIGN_TRANS_LIST[69] = {item = "^53b2c0副-授谱 SID:1007 MAP:a06" , line = "d_cmd 2008 1007 -14 -39"}
DESIGN_TRANS_LIST[70] = {item = "^53b2c0副-雨夜 SID:1008 MAP:a07" , line = "d_cmd 2008 1008 0 1"}
DESIGN_TRANS_LIST[71] = {item = "^53b2c0副-换血 SID:1009 MAP:a08" , line = "d_cmd 2008 1009 9 21"}
DESIGN_TRANS_LIST[72] = {item = "^53b2c0副-联手 SID:1010 MAP:a09" , line = "d_cmd 2008 1010 92 -26"}
DESIGN_TRANS_LIST[73] = {item = "^53b2c0副-救尼 SID:1011 MAP:a10" , line = "d_cmd 2008 1011 -32 44"}
DESIGN_TRANS_LIST[74] = {item = "^53b2c1副-活动用绿竹巷 SID:1016 MAP:a11" , line = "d_cmd 2008 1016 49 -10"}
DESIGN_TRANS_LIST[75] = {item = "^53b2c1副-战场 SID:1017 MAP:a16" , line = "d_cmd 2008 1017 0 0"}
DESIGN_TRANS_LIST[76] = {item = "^53b2c1副-千秋美酒 SID:1022 MAP:d05" , line = "d_cmd 2008 1022 0 0"}
DESIGN_TRANS_LIST[77] = {item = "^53b2c1副-龙岭迷窟 SID:1023 MAP:a1_002" , line = "d_cmd 2008 1023 0 0"}
DESIGN_TRANS_LIST[78] = {item = "^53b2c1副-聚贤塔 SID:1024 MAP:a1_003" , line = "d_cmd 2008 1024 -402 390"}
DESIGN_TRANS_LIST[79] = {item = "^53b2c1副-街市 SID:1025 MAP:a15" , line = "d_cmd 2008 1025 0 0"}
DESIGN_TRANS_LIST[80] = {item = "^53b2c1副-帮派_镖局 SID:1026 MAP:p001" , line = "d_cmd 2008 1026 0 0"}
DESIGN_TRANS_LIST[81] = {item = "^53b2c1副-帮派_马帮 SID:1027 MAP:p003" , line = "d_cmd 2008 1027 0 0"}
DESIGN_TRANS_LIST[82] = {item = "^53b2c1副-帮派_山寨 SID:1028 MAP:p004" , line = "d_cmd 2008 1028 0 0"}
DESIGN_TRANS_LIST[83] = {item = "^53b2c1副-帮派_工坊 SID:1029 MAP:p002" , line = "d_cmd 2008 1029 67 -5"}
DESIGN_TRANS_LIST[84] = {item = "^53b2c1副-帮派_寻宝副本1 SID:1043 MAP:a35" , line = "d_cmd 2008 1043 0 0"}
DESIGN_TRANS_LIST[85] = {item = "^53b2c1副-帮派_寻宝副本2 SID:1044 MAP:a35" , line = "d_cmd 2008 1044 0 0"}
DESIGN_TRANS_LIST[86] = {item = "^53b2c1副-帮派_寻宝副本3 SID:1045 MAP:a35" , line = "d_cmd 2008 1045 0 0"}
DESIGN_TRANS_LIST[87] = {item = "^53b2c1副-帮派_寻宝副本4 SID:1046 MAP:a35" , line = "d_cmd 2008 1046 0 0"}
DESIGN_TRANS_LIST[88] = {item = "^53b2c1副-帮派_寻宝副本5 SID:1047 MAP:a35" , line = "d_cmd 2008 1047 0 0"}
DESIGN_TRANS_LIST[89] = {item = "^53b2c1副-专家副本-无尽逍遥 SID:1049 MAP:x21" , line = "d_cmd 2008 1049 0 0"}
DESIGN_TRANS_LIST[90] = {item = "^53b2c1副-荒火圣殿 SID:1030 MAP:d06" , line = "d_cmd 2008 1030 0 0"}
DESIGN_TRANS_LIST[91] = {item = "^53b2c1副-城郊农田 SID:1033 MAP:a17" , line = "d_cmd 2008 1033 0 0"}
DESIGN_TRANS_LIST[92] = {item = "^53b2c1副-武林盟主战 SID:1032 MAP:a18" , line = "d_cmd 2008 1032 0 0"}
DESIGN_TRANS_LIST[93] = {item = "^53b2c1副-马戏团竞技场 SID:1034 MAP:a20" , line = "d_cmd 2008 1034 0 0"}
DESIGN_TRANS_LIST[94] = {item = "^53b2c1副-夜临江 SID:1035 MAP:x39" , line = "d_cmd 2008 1035 0 0"}
DESIGN_TRANS_LIST[95] = {item = "^53b2c1副-鬼府灵台 SID:1036 MAP:x256" , line = "d_cmd 2008 1036 0 0"}
DESIGN_TRANS_LIST[96] = {item = "^53b2c1副-新梅庄地牢 SID:1039 MAP:a21" , line = "d_cmd 2008 1039 -75 4"}
DESIGN_TRANS_LIST[97] = {item = "^53b2c1副-大理围攻 SID:1040 MAP:a32" , line = "d_cmd 2008 1040 0 0"}
DESIGN_TRANS_LIST[98] = {item = "^53b2c0副-少林秘境 SID:2001 MAP:a04" , line = "d_cmd 2008 2001 23 52"}
DESIGN_TRANS_LIST[99] = {item = "^53b2c1副-峨眉秘境 SID:1302 MAP:a0_01" , line = "d_cmd 2008 1302 0 0"}
DESIGN_TRANS_LIST[100] = {item = "^53b2c1副-唐门秘境 SID:1301 MAP:a0_02" , line = "d_cmd 2008 1301 0 0"}
DESIGN_TRANS_LIST[101] = {item = "^53b2c1副-逍遥秘境 SID:1303 MAP:a0_03" , line = "d_cmd 2008 1303 0 0"}
DESIGN_TRANS_LIST[102] = {item = "^53b2c1副-衡山秘境 SID:1304 MAP:a0_04" , line = "d_cmd 2008 1304 0 0"}
DESIGN_TRANS_LIST[103] = {item = "^53b2c1副-恒山秘境 SID:1305 MAP:a0_05" , line = "d_cmd 2008 1305 0 0"}
DESIGN_TRANS_LIST[104] = {item = "^53b2c1副-五仙秘境 SID:1306 MAP:a0_06" , line = "d_cmd 2008 1306 0 0"}
DESIGN_TRANS_LIST[105] = {item = "^53b2c1副-日月秘境 SID:1307 MAP:a0_07" , line = "d_cmd 2008 1307 0 0"}
DESIGN_TRANS_LIST[106] = {item = "^53b2c1副-武当秘境 SID:1308 MAP:a0_08" , line = "d_cmd 2008 1308 0 0"}
DESIGN_TRANS_LIST[107] = {item = "^53b2c1副-华山秘境 SID:1309 MAP:a0_09" , line = "d_cmd 2008 1309 0 0"}
DESIGN_TRANS_LIST[108] = {item = "^53b2c0副-授谱副本英雄模式 SID:1201 MAP:a06" , line = "d_cmd 2008 1201 0 0"}
DESIGN_TRANS_LIST[109] = {item = "^53b2c0副-剧情副本-衡山支线01 SID:1205 MAP:x34" , line = "d_cmd 2008 1205 0 0"}
DESIGN_TRANS_LIST[110] = {item = "^53b2c0副-剧情副本-衡山支线02 SID:1206 MAP:x57" , line = "d_cmd 2008 1206 0 0"}
DESIGN_TRANS_LIST[111] = {item = "^53b2c0副-剧情副本-衡山支线03 SID:1207 MAP:x24" , line = "d_cmd 2008 1207 0 0"}
DESIGN_TRANS_LIST[112] = {item = "^53b2c0副-剧情副本-衡山支线04 SID:1208 MAP:x34" , line = "d_cmd 2008 1208 0 0"}
DESIGN_TRANS_LIST[113] = {item = "^53b2c0副-剧情副本-衡山相位-酒楼 SID:1209 MAP:x247" , line = "d_cmd 2008 1209 0 0"}
DESIGN_TRANS_LIST[114] = {item = "^53b2c0副-剧情副本-衡山相位-洗手 SID:1210 MAP:x57" , line = "d_cmd 2008 1210 0 0"}
DESIGN_TRANS_LIST[115] = {item = "^53b2c0副-剧情副本-衡山相位-偷听 SID:1215 MAP:x24" , line = "d_cmd 2008 1215 0 0"}
DESIGN_TRANS_LIST[116] = {item = "^53b2c0副-剧情副本-武当-摆阵 SID:1211 MAP:x48" , line = "d_cmd 2008 1211 0 0"}
DESIGN_TRANS_LIST[117] = {item = "^53b2c0副-剧情副本-武当-剑魔秘洞 SID:1212 MAP:x241" , line = "d_cmd 2008 1212 0 0"}
DESIGN_TRANS_LIST[118] = {item = "^53b2c0副-剧情副本-武当-成不忧之死 SID:1213 MAP:x34" , line = "d_cmd 2008 1213 0 0"}
DESIGN_TRANS_LIST[119] = {item = "^53b2c0副-剧情副本-武当-思过崖心魔 SID:1214 MAP:x241" , line = "d_cmd 2008 1214 0 0"}
DESIGN_TRANS_LIST[120] = {item = "^53b2c0副-还阳轩 SID:1015 MAP:d01" , line = "d_cmd 2008 1015 -1 -1"}
DESIGN_TRANS_LIST[121] = {item = "^b6e3bb野-灭门地宫 SID:1200 MAP:a05" , line = "d_cmd 2008 1200 0 0"}
DESIGN_TRANS_LIST[122] = {item = "^b6e3bb野-墓穴一层 SID:2005 MAP:d02_1" , line = "d_cmd 2008 2005 5 -43"}
DESIGN_TRANS_LIST[123] = {item = "^b6e3bb野-墓穴二层 SID:2006 MAP:d02_2" , line = "d_cmd 2008 2006 48 -16"}
DESIGN_TRANS_LIST[124] = {item = "^b6e3bb野-墓穴三层 SID:2007 MAP:d02_3" , line = "d_cmd 2008 2007 29 -29"}
DESIGN_TRANS_LIST[125] = {item = "^b6e3bb野-剑冢一层 SID:2011 MAP:d04_1" , line = "d_cmd 2008 2011 0 0"}
DESIGN_TRANS_LIST[126] = {item = "^b6e4bb野-剑冢二层 SID:2012 MAP:d04_2" , line = "d_cmd 2008 2012 0 0"}
DESIGN_TRANS_LIST[127] = {item = "^b6e5bb野-剑冢三层 SID:2013 MAP:d04_3" , line = "d_cmd 2008 2013 0 0"}
DESIGN_TRANS_LIST[128] = {item = "^b6e6bb野-剑冢四层 SID:2014 MAP:d04_4" , line = "d_cmd 2008 2014 44 -13"}
DESIGN_TRANS_LIST[129] = {item = "^b6e7bb野-剑冢五层 SID:2015 MAP:d04_5" , line = "d_cmd 2008 2015 0 0"}
DESIGN_TRANS_LIST[130] = {item = "^b6e3bb野-家园 SID:3001 MAP:h01" , line = "d_cmd 2008 3001 0 0"}
DESIGN_TRANS_LIST[131] = {item = "^b37c01宠-万兽谷 SID:2003 MAP:x200" , line = "d_cmd 2008 2003 2 -130"}
DESIGN_TRANS_LIST[132] = {item = "^b37c01宠-聚贤庄 SID:2004 MAP:x203" , line = "d_cmd 2008 2004 138 73"}
DESIGN_TRANS_LIST[133] = {item = "^b6e4bb野-小村（临） SID:1 MAP:x3" , line = "d_cmd 2008 1 0 0"}
DESIGN_TRANS_LIST[134] = {item = "^b37cda测-NPC模型 SID:9001 MAP:x250" , line = "d_cmd 2008 9001 -235 250"}
DESIGN_TRANS_LIST[135] = {item = "^b37cda测-怪模型 SID:9001 MAP:x250" , line = "d_cmd 2008 9001 5 180"}
DESIGN_TRANS_LIST[136] = {item = "^b37cda测-职业相关 SID:9001 MAP:x250" , line = "d_cmd 2008 9001 -53 -65"}
DESIGN_TRANS_LIST[137] = {item = "^b37cda测-怪物类型 SID:9001 MAP:x250" , line = "d_cmd 2008 9001 -69 -69"}
DESIGN_TRANS_LIST[138] = {item = "^b37cda测-弱怪隔5m SID:9001 MAP:x250" , line = "d_cmd 2008 9001 -165 128"}
DESIGN_TRANS_LIST[139] = {item = "^b37cda测-弱怪隔10m SID:9001 MAP:x250" , line = "d_cmd 2008 9001 -128 -82"}
DESIGN_TRANS_LIST[140] = {item = "^b37cda测-弱怪隔20m SID:9001 MAP:x250" , line = "d_cmd 2008 9001 -181 -158"}
DESIGN_TRANS_LIST[141] = {item = "^b37cda测-强怪隔5m SID:9001 MAP:x250" , line = "d_cmd 2008 9001 120 -162"}
DESIGN_TRANS_LIST[142] = {item = "^b37cda测-强怪隔10m SID:9001 MAP:x250" , line = "d_cmd 2008 9001 88 -138"}
DESIGN_TRANS_LIST[143] = {item = "^b37cda测-强怪隔20m SID:9001 MAP:x250" , line = "d_cmd 2008 9001 -142 -183"}
DESIGN_TRANS_LIST[144] = {item = "^b37cda测-角色列表 SID:9002 MAP:x2" , line = "d_cmd 2008 9002 -13 -34"}
DESIGN_TRANS_LIST[145] = {item = "^b37cda测-兰封镇 SID:9003 MAP:x3" , line = "d_cmd 2008 9003 204 192"}
DESIGN_TRANS_LIST[146] = {item = "^b37cda测-选人界面 SID:9004 MAP:x251" , line = "d_cmd 2008 9004 1 1"}
DESIGN_TRANS_LIST[147] = {item = "^b37cda测-室内小酒馆 SID:9005 MAP:x240" , line = "d_cmd 2008 9005 -13 -24"}
DESIGN_TRANS_LIST[148] = {item = "^b37cda测-测试物理图 SID:9006 MAP:x254" , line = "d_cmd 2008 9006 -2 -27"}
DESIGN_TRANS_LIST[149] = {item = "^b42cda测-室内小洞穴 SID:9012 MAP:x241" , line = "d_cmd 2008 9012 28 -26"}
DESIGN_TRANS_LIST[150] = {item = "^b38cda测-剑冢布怪测试01 SID:9019 MAP:a01_1" , line = "d_cmd 2008 9019 0 0"}
DESIGN_TRANS_LIST[151] = {item = "^b39cda测-剑冢布怪测试02 SID:9020 MAP:a01_2" , line = "d_cmd 2008 9020 0 0"}
DESIGN_TRANS_LIST[152] = {item = "^b40cda测-剑冢布怪测试03 SID:9021 MAP:a01_3" , line = "d_cmd 2008 9021 0 0"}
DESIGN_TRANS_LIST[153] = {item = "^b41cda测-剑冢布怪测试04 SID:9022 MAP:a01_4" , line = "d_cmd 2008 9022 0 0"}
DESIGN_TRANS_LIST[154] = {item = "^b42cda测-剑冢布怪测试05 SID:9023 MAP:a01_5" , line = "d_cmd 2008 9023 0 0"}
DESIGN_TRANS_LIST[155] = {item = "^b37cda测-结婚测试空间 SID:9024 MAP:a13" , line = "d_cmd 2008 9024 0 0"}
DESIGN_TRANS_LIST[156] = {item = "^b38cda测-绿竹巷 SID:1001 MAP:a01" , line = "d_cmd 2008 1001 0 0"}
DESIGN_TRANS_LIST[157] = {item = "^b39cda测-药王秘洞 SID:1002 MAP:a02" , line = "d_cmd 2008 1002 0 0"}
DESIGN_TRANS_LIST[158] = {item = "^b40cda测-木人巷测试用 SID:1003 MAP:a04（废）" , line = "d_cmd 2008 1003 0 0"}
DESIGN_TRANS_LIST[159] = {item = "^b41cda测-梅庄地面1 SID:1012 MAP:x27" , line = "d_cmd 2008 1012 0 0"}
DESIGN_TRANS_LIST[160] = {item = "^b42cda测-梅庄地面2 SID:1013 MAP:x27" , line = "d_cmd 2008 1013 0 0"}
DESIGN_TRANS_LIST[161] = {item = "^b43cda测-梅庄简单模式 SID:1014 MAP:x27" , line = "d_cmd 2008 1014 0 0"}
DESIGN_TRANS_LIST[162] = {item = "^b44cda测-PVP教程模式 SID:1018 MAP:x244" , line = "d_cmd 2008 1018 0 0"}
DESIGN_TRANS_LIST[163] = {item = "^b45cda测-战场（测试） SID:1019 MAP:x244" , line = "d_cmd 2008 1019 0 0"}
DESIGN_TRANS_LIST[164] = {item = "^b47cda测-茶棚之战 SID:2002 MAP:x3" , line = "d_cmd 2008 2002 204 192"}
DESIGN_TRANS_LIST[165] = {item = "^b48cda测-随机副本测试地图 SID:9025 MAP:a1_001" , line = "d_cmd 2008 9025 0 0"}
DESIGN_TRANS_LIST[166] = {item = "^53b2c0副-雨夜英雄副本 SID:1202 MAP:a07" , line = "d_cmd 2008 1202 0 0"}
DESIGN_TRANS_LIST[167] = {item = "^53b2c0副-仙愁峡 SID:1037 MAP:a09" , line = "d_cmd 2008 1037 75 0"}
DESIGN_TRANS_LIST[168] = {item = "^53b2c0副-青城 SID:1203 MAP:a19" , line = "d_cmd 2008 1203 0 0"}
DESIGN_TRANS_LIST[169] = {item = "^53b2c0副-横屿滩副本 SID:1031 MAP:x52" , line = "d_cmd 2008 1031 0 0"}
DESIGN_TRANS_LIST[170] = {item = "^53b2c0副-梅寨聚义厅 SID:1038 MAP:x246" , line = "d_cmd 2008 1038 0 0"}
DESIGN_TRANS_LIST[171] = {item = "^888888废-新手村方案01 SID:9013 MAP:x39" , line = "d_cmd 2008 9013 0 0"}
DESIGN_TRANS_LIST[172] = {item = "^888888废-新手村方案02 SID:9014 MAP:x39" , line = "d_cmd 2008 9014 0 0"}
DESIGN_TRANS_LIST[173] = {item = "^888888废-新手村方案03 SID:9015 MAP:x39" , line = "d_cmd 2008 9015 0 0"}
DESIGN_TRANS_LIST[174] = {item = "^888888废-新手村方案04 SID:9016 MAP:x39" , line = "d_cmd 2008 9016 0 0"}
DESIGN_TRANS_LIST[175] = {item = "^888888废-怪物布设05 SID:9011 MAP:x18" , line = "d_cmd 2008 9011 0 0"}
DESIGN_TRANS_LIST[176] = {item = "^888888废-新手村方案05 SID:9017 MAP:x39" , line = "d_cmd 2008 9017 0 0"}
DESIGN_TRANS_LIST[177] = {item = "^53b2c0副-挑战名人于人豪 SID:1101 MAP:x23" , line = "d_cmd 2008 1101 0 0"}
DESIGN_TRANS_LIST[178] = {item = "^53b2c0副-挑战名人曲非烟 SID:1102 MAP:x13" , line = "d_cmd 2008 1102 0 0"}
DESIGN_TRANS_LIST[179] = {item = "^53b2c0副-挑战名人鲁连荣 SID:1103 MAP:x24" , line = "d_cmd 2008 1103 0 0"}
DESIGN_TRANS_LIST[180] = {item = "^53b2c0副-挑战名人杨莲亭 SID:1104 MAP:x10" , line = "d_cmd 2008 1104 0 0"}
DESIGN_TRANS_LIST[181] = {item = "^53b2c0副-挑战名人青城四秀 SID:1105 MAP:x23" , line = "d_cmd 2008 1105 0 0"}
DESIGN_TRANS_LIST[182] = {item = "^53b2c0副-挑战名人劳德诺 SID:1106 MAP:x23" , line = "d_cmd 2008 1106 0 0"}
DESIGN_TRANS_LIST[183] = {item = "^53b2c0副-挑战名人陆柏 SID:1107 MAP:x18" , line = "d_cmd 2008 1107 0 0"}
DESIGN_TRANS_LIST[184] = {item = "^53b2c0副-挑战名人丁勉 SID:1108 MAP:x18" , line = "d_cmd 2008 1108 0 0"}
DESIGN_TRANS_LIST[185] = {item = "^53b2c0副-挑战名人田伯光 SID:1109 MAP:x24" , line = "d_cmd 2008 1109 0 0"}
DESIGN_TRANS_LIST[186] = {item = "^53b2c0副-挑战名人桃谷六仙 SID:1110 MAP:x4" , line = "d_cmd 2008 1110 0 0"}
DESIGN_TRANS_LIST[187] = {item = "^53b2c0副-挑战名人封不平 SID:1111 MAP:x19" , line = "d_cmd 2008 1111 0 0"}
DESIGN_TRANS_LIST[188] = {item = "^53b2c0副-挑战名人绿竹翁 SID:1112 MAP:x40" , line = "d_cmd 2008 1112 0 0"}
DESIGN_TRANS_LIST[189] = {item = "^53b2c0副-挑战名人童百熊 SID:1113 MAP:x12" , line = "d_cmd 2008 1113 0 0"}
DESIGN_TRANS_LIST[190] = {item = "^53b2c0副-挑战名人天门道人 SID:1114 MAP:x7" , line = "d_cmd 2008 1114 0 0"}
DESIGN_TRANS_LIST[191] = {item = "^53b2c0副-挑战名人余沧海 SID:1115 MAP:x45" , line = "d_cmd 2008 1115 0 0"}
DESIGN_TRANS_LIST[192] = {item = "^53b2c0副-挑战名人定闲师太 SID:1116 MAP:x20" , line = "d_cmd 2008 1116 0 0"}
DESIGN_TRANS_LIST[193] = {item = "^53b2c0副-挑战名人曲洋 SID:1117 MAP:x13" , line = "d_cmd 2008 1117 0 0"}
DESIGN_TRANS_LIST[194] = {item = "^53b2c0副-挑战名人江南四友 SID:1118 MAP:x10" , line = "d_cmd 2008 1118 0 0"}
DESIGN_TRANS_LIST[195] = {item = "^53b2c0副-挑战名人向问天 SID:1119 MAP:x9" , line = "d_cmd 2008 1119 0 0"}
DESIGN_TRANS_LIST[196] = {item = "^53b2c0副-挑战名人岳不群 SID:1120 MAP:x34" , line = "d_cmd 2008 1120 0 0"}
DESIGN_TRANS_LIST[197] = {item = "^53b2c0副-挑战名人林平之 SID:1121 MAP:x30" , line = "d_cmd 2008 1121 0 0"}
DESIGN_TRANS_LIST[198] = {item = "^53b2c0副-挑战名人左冷禅 SID:1122 MAP:x8" , line = "d_cmd 2008 1122 0 0"}
DESIGN_TRANS_LIST[199] = {item = "^53b2c0副-挑战名人费彬 SID:1123 MAP:x18" , line = "d_cmd 2008 1123 0 0"}
DESIGN_TRANS_LIST[200] = {item = "^53b2c0副-挑战名人何三七 SID:1124 MAP:x13" , line = "d_cmd 2008 1124 0 0"}
DESIGN_TRANS_LIST[201] = {item = "^53b2c0副-挑战名人老头子 SID:1125 MAP:x19" , line = "d_cmd 2008 1125 0 0"}
DESIGN_TRANS_LIST[202] = {item = "^53b2c0副-挑战名人漠北双熊 SID:1126 MAP:x6" , line = "d_cmd 2008 1126 0 0"}
DESIGN_TRANS_LIST[203] = {item = "^53b2c0副-挑战名人令狐冲 SID:1127 MAP:x6" , line = "d_cmd 2008 1127 0 0"}
DESIGN_TRANS_LIST[204] = {item = "^53b2c0副-挑战名人祖千秋 SID:1128 MAP:x6" , line = "d_cmd 2008 1128 0 0"}
DESIGN_TRANS_LIST[205] = {item = "^53b2c0副-挑战名人刘正风 SID:1129 MAP:x39" , line = "d_cmd 2008 1129 0 0"}
DESIGN_TRANS_LIST[206] = {item = "^53b2c0副-挑战名人木高峰 SID:1130 MAP:x12" , line = "d_cmd 2008 1130 0 0"}
DESIGN_TRANS_LIST[207] = {item = "^53b2c0副-挑战名人岳灵珊 SID:1131 MAP:x30" , line = "d_cmd 2008 1131 0 0"}
DESIGN_TRANS_LIST[208] = {item = "^53b2c0副-挑战名人宁中则 SID:1132 MAP:x34" , line = "d_cmd 2008 1132 0 0"}
DESIGN_TRANS_LIST[209] = {item = "^53b2c0副-挑战名人曹少钦 SID:1133 MAP:x46" , line = "d_cmd 2008 1133 0 0"}
DESIGN_TRANS_LIST[210] = {item = "^53b2c0副-挑战名人蓝凤凰 SID:1134 MAP:x31" , line = "d_cmd 2008 1134 0 0"}
DESIGN_TRANS_LIST[211] = {item = "^53b2c0副-挑战名人戚继光 SID:1135 MAP:x46" , line = "d_cmd 2008 1135 0 0"}
DESIGN_TRANS_LIST[212] = {item = "^53b2c0副-挑战名人不戒和尚 SID:1136 MAP:x4" , line = "d_cmd 2008 1136 0 0"}
DESIGN_TRANS_LIST[213] = {item = "^53b2c0副-挑战名人任盈盈 SID:1137 MAP:x40" , line = "d_cmd 2008 1137 0 0"}
DESIGN_TRANS_LIST[214] = {item = "^53b2c0副-挑战名人莫大 SID:1138 MAP:x17" , line = "d_cmd 2008 1138 0 0"}
DESIGN_TRANS_LIST[215] = {item = "^53b2c0副-挑战名人林平之（后期） SID:1139 MAP:x36" , line = "d_cmd 2008 1139 0 0"}
DESIGN_TRANS_LIST[216] = {item = "^53b2c0副-挑战名人左冷禅 SID:1140 MAP:x36" , line = "d_cmd 2008 1140 0 0"}
DESIGN_TRANS_LIST[217] = {item = "^53b2c0副-挑战名人任我行 SID:1141 MAP:x35" , line = "d_cmd 2008 1141 0 0"}
DESIGN_TRANS_LIST[218] = {item = "^53b2c0副-挑战名人令狐冲（后期） SID:1142 MAP:x10" , line = "d_cmd 2008 1142 0 0"}
DESIGN_TRANS_LIST[219] = {item = "^53b2c0副-挑战名人冲虚 SID:1143 MAP:x5" , line = "d_cmd 2008 1143 0 0"}
DESIGN_TRANS_LIST[220] = {item = "^53b2c0副-挑战名人方证大师 SID:1144 MAP:x14" , line = "d_cmd 2008 1144 0 0"}
DESIGN_TRANS_LIST[221] = {item = "^53b2c0副-挑战名人东方不败 SID:1145 MAP:x22" , line = "d_cmd 2008 1145 0 0"}
DESIGN_TRANS_LIST[222] = {item = "^53b2c0副-挑战名人风清扬 SID:1146 MAP:a0_09" , line = "d_cmd 2008 1146 0 0"}
DESIGN_TRANS_LIST[223] = {item = "^53b2c0副-挑战名人独孤求败 SID:1147 MAP:x8" , line = "d_cmd 2008 1147 0 0"}
DESIGN_TRANS_LIST[224] = {item = "^53b2c0副-擂台五仙青蛇沼 SID:1401 MAP:x31" , line = "d_cmd 2008 1401 0 0"}
DESIGN_TRANS_LIST[225] = {item = "^53b2c0副-擂台日月成德殿前 SID:1403 MAP:x22" , line = "d_cmd 2008 1403 0 0"}
DESIGN_TRANS_LIST[226] = {item = "^53b2c0副-擂台京师擂台 SID:1405 MAP:x244" , line = "d_cmd 2008 1405 0 0"}
DESIGN_TRANS_LIST[227] = {item = "^53b2c0副-擂台峨眉 SID:1410 MAP:x29" , line = "d_cmd 2008 1410 0 0"}
DESIGN_TRANS_LIST[228] = {item = "^53b2c0副-擂台武当八卦台 SID:1411 MAP:x5" , line = "d_cmd 2008 1411 0 0"}
DESIGN_TRANS_LIST[229] = {item = "^53b2c0副-擂台逍遥时钟 SID:1412 MAP:x21" , line = "d_cmd 2008 1412 0 0"}
DESIGN_TRANS_LIST[230] = {item = "^53b2c0副-擂台黑木崖魔象 SID:1413 MAP:x35" , line = "d_cmd 2008 1413 0 0"}
DESIGN_TRANS_LIST[231] = {item = "^53b2c0副-擂台临江镇擂台 SID:1414 MAP:x39" , line = "d_cmd 2008 1414 0 0"}
DESIGN_TRANS_LIST[232] = {item = "^53b2c0副-擂台戈壁吊桥 SID:1415 MAP:x51" , line = "d_cmd 2008 1415 0 0"}
DESIGN_TRANS_LIST[233] = {item = "^53b2c0副-擂台朱仙镇街市 SID:1416 MAP:x4" , line = "d_cmd 2008 1416 0 0"}
DESIGN_TRANS_LIST[234] = {item = "^53b2c0副-东厂盗宝 SID:1500 MAP:a22" , line = "d_cmd 2008 1500 0 0"}
DESIGN_TRANS_LIST[235] = {item = "^53b2c0副-日月分舵 SID:1501 MAP:a23" , line = "d_cmd 2008 1501 0 0"}
DESIGN_TRANS_LIST[236] = {item = "^53b2c0副-百毒禁地 SID:1041 MAP:a33" , line = "d_cmd 2008 1041 -344 -1"}
DESIGN_TRANS_LIST[237] = {item = "^53b2c0副-副本_门派图少林 SID:1503 MAP:a24" , line = "d_cmd 2008 1503 0 0"}
DESIGN_TRANS_LIST[238] = {item = "^53b2c0副-副本_门派图武当 SID:1504 MAP:a25" , line = "d_cmd 2008 1504 0 0"}
DESIGN_TRANS_LIST[239] = {item = "^53b2c0副-副本_门派图华山 SID:1505 MAP:a26" , line = "d_cmd 2008 1505 0 0"}
DESIGN_TRANS_LIST[240] = {item = "^53b2c0副-副本_门派图恒山 SID:1506 MAP:a27" , line = "d_cmd 2008 1506 0 0"}
DESIGN_TRANS_LIST[241] = {item = "^53b2c0副-副本_门派图衡山 SID:1507 MAP:a28" , line = "d_cmd 2008 1507 0 0"}
DESIGN_TRANS_LIST[242] = {item = "^53b2c0副-副本_门派图五毒 SID:1508 MAP:a29" , line = "d_cmd 2008 1508 0 0"}
DESIGN_TRANS_LIST[243] = {item = "^53b2c0副-副本_门派图逍遥 SID:1509 MAP:a30" , line = "d_cmd 2008 1509 0 0"}
DESIGN_TRANS_LIST[244] = {item = "^53b2c0副-副本_门派图峨眉 SID:1510 MAP:a31" , line = "d_cmd 2008 1510 0 0"}
DESIGN_TRANS_LIST[245] = {item = "^53b2c0副-副本图_授谱2012 SID:1042 MAP:a06" , line = "d_cmd 2008 1042 0 0"}
DESIGN_TRANS_LIST[246] = {item = "^b6e3bb野-关卡入口客栈 SID:1204 MAP:x245" , line = "d_cmd 2008 1204 5 -16"}
DESIGN_TRANS_LIST[247] = {item = "^b6e3bb野-衡山城回雁楼室内 SID:70 MAP:x247" , line = "d_cmd 2008 70 0 0"}
DESIGN_TRANS_LIST[248] = {item = "^53b2c0副-独孤求拜副本 SID:1048 MAP:a34" , line = "d_cmd 2008 1048 2 -104"}
DESIGN_TRANS_LIST[249] = {item = "^b6e3bb野-产品视频演示青城 SID:1511 MAP:a19" , line = "d_cmd 2008 1511 0 0"}
DESIGN_TRANS_LIST[250] = {item = "^b6e3bb野-新药王谷 SID:71 MAP:x61" , line = "d_cmd 2008 71 0 0"}
DESIGN_TRANS_LIST[251] = {item = "^53b2c0副-帮派_劫法场副本 SID:1050 MAP:a36" , line = "d_cmd 2008 1050 0 0"}
DESIGN_TRANS_LIST[252] = {item = "^53b2c0副-青城深渊 SID:1512 MAP:a38" , line = "d_cmd 2008 1512 0 0"}
DESIGN_TRANS_LIST[253] = {item = "^53b2c0副-镖局血案 SID:1513 MAP:x59" , line = "d_cmd 2008 1513 -124 -122"}
DESIGN_TRANS_LIST[254] = {item = "^53b2c0副-思过崖秘洞 SID:1310 MAP:a37" , line = "d_cmd 2008 1310 0 0"}
DESIGN_TRANS_LIST[255] = {item = "^b6e3bb野-夜岚谷 SID:73 MAP:a06" , line = "d_cmd 2008 73 0 0"}
DESIGN_TRANS_LIST[256] = {item = "^d7c4a2派-新华山派 SID:74 MAP:x62" , line = "d_cmd 2008 74 0 0"}
DESIGN_TRANS_LIST[257] = {item = "^53b2c0副-剧情副本-衡山城-茶馆 SID:1216 MAP:x57" , line = "d_cmd 2008 1216 0 0"}
DESIGN_TRANS_LIST[258] = {item = "^53b2c0副-剧情副本-衡山城-房顶 SID:1217 MAP:x57" , line = "d_cmd 2008 1217 0 0"}
DESIGN_TRANS_LIST[259] = {item = "^53b2c0副-剧情副本-衡山郊外-莲池 SID:1218 MAP:x24" , line = "d_cmd 2008 1218 0 0"}
DESIGN_TRANS_LIST[260] = {item = "^53b2c0副-剧情副本-衡山郊外-贼寨 SID:1219 MAP:x24" , line = "d_cmd 2008 1219 0 0"}
DESIGN_TRANS_LIST[261] = {item = "^b6e3bb野-笑傲客栈 SID:1051 MAP:x248" , line = "d_cmd 2008 1051 0 0"}
DESIGN_TRANS_LIST[262] = {item = "^53b2c0副-剧情副本-福州-激战 SID:1220 MAP:x63" , line = "d_cmd 2008 1220 0 0"}
DESIGN_TRANS_LIST[263] = {item = "^53b2c0副-剧情副本-福州-黑衣恶徒 SID:1221 MAP:x59" , line = "d_cmd 2008 1221 0 0"}
DESIGN_TRANS_LIST[264] = {item = "^53b2c0副-剧情副本-福州-密林劫匪 SID:1222 MAP:x59" , line = "d_cmd 2008 1222 0 0"}
DESIGN_TRANS_LIST[265] = {item = "^53b2c0副-剧情副本-福州-狂傲剑客 SID:1223 MAP:x59" , line = "d_cmd 2008 1223 0 0"}
DESIGN_TRANS_LIST[266] = {item = "^53b2c0副-剧情副本-福州-闻沧澜 SID:1224 MAP:x59" , line = "d_cmd 2008 1224 0 0"}
DESIGN_TRANS_LIST[267] = {item = "^53b2c0副-剧情副本-福州-疯魔刀手 SID:1225 MAP:x59" , line = "d_cmd 2008 1225 0 0"}
DESIGN_TRANS_LIST[268] = {item = "^53b2c0副-剧情副本-福州-左挺 SID:1226 MAP:x63" , line = "d_cmd 2008 1226 0 0"}
DESIGN_TRANS_LIST[269] = {item = "^53b2c0副-剧情副本-福州-刘宁 SID:1227 MAP:x63" , line = "d_cmd 2008 1227 0 0"}
DESIGN_TRANS_LIST[270] = {item = "^53b2c0副-剧情副本-福州-邓飞 SID:1228 MAP:x63" , line = "d_cmd 2008 1228 0 0"}
DESIGN_TRANS_LIST[271] = {item = "^b6e3bb野-新华山 SID:76 MAP:x65" , line = "d_cmd 2008 76 0 0"}
DESIGN_TRANS_LIST[272] = {item = "^b6e3bb野-新少室山 SID:77 MAP:x66" , line = "d_cmd 2008 77 0 0"}
DESIGN_TRANS_LIST[273] = {item = "^b6e3bb野-新泰山 SID:78 MAP:x67" , line = "d_cmd 2008 78 0 0"}
DESIGN_TRANS_LIST[274] = {item = "^b6e3bb野-新朱仙镇 SID:79 MAP:x68" , line = "d_cmd 2008 79 0 0"}
DESIGN_TRANS_LIST[275] = {item = "^53b2c0副-剧情副本-成不忧之死 SID:1229 MAP:x62" , line = "d_cmd 2008 1229 0 0"}
DESIGN_TRANS_LIST[276] = {item = "^53b2c0副-剧情副本-思过崖心魔 SID:1230 MAP:a37" , line = "d_cmd 2008 1230 0 0"}
DESIGN_TRANS_LIST[277] = {item = "^53b2c0副-剧情副本少室山嵩阳书院 SID:1231 MAP:x66" , line = "d_cmd 2008 1231 0 0"}
DESIGN_TRANS_LIST[278] = {item = "^53b2c0副-剧情副本少室山大佛 SID:1232 MAP:x66" , line = "d_cmd 2008 1232 0 0"}
DESIGN_TRANS_LIST[279] = {item = "^53b2c0副-剧情副本-药王谷-柳诗诗 SID:1233 MAP:x61" , line = "d_cmd 2008 1233 0 0"}
DESIGN_TRANS_LIST[280] = {item = "^53b2c0副-剧情副本-药王谷-林忍冬 SID:1234 MAP:x61" , line = "d_cmd 2008 1234 0 0"}
DESIGN_TRANS_LIST[281] = {item = "^53b2c0副-剧情副本-药王谷菊花宝典 SID:1235 MAP:x61" , line = "d_cmd 2008 1235 0 0"}
DESIGN_TRANS_LIST[282] = {item = "^53b2c0副-剧情副本-药王谷药王庙 SID:1236 MAP:x61" , line = "d_cmd 2008 1236 0 0"}
DESIGN_TRANS_LIST[283] = {item = "^53b2c0副-剧情副本-药王谷林当归 SID:1237 MAP:x61" , line = "d_cmd 2008 1237 0 0"}
DESIGN_TRANS_LIST[284] = {item = "^53b2c0副-剧情副本-洛阳绿竹巷 SID:1238 MAP:x64" , line = "d_cmd 2008 1238 0 0"}
DESIGN_TRANS_LIST[285] = {item = "^53b2c0副-剧情副本-思过崖对抗 SID:1239 MAP:a37" , line = "d_cmd 2008 1239 0 0"}
DESIGN_TRANS_LIST[286] = {item = "^53b2c0副-教学副本-华山派-10级 SID:1240 MAP:a0_09" , line = "d_cmd 2008 1240 0 0"}
DESIGN_TRANS_LIST[287] = {item = "^b6e3bb野-华山别院 SID:1052 MAP:d01" , line = "d_cmd 2008 1052 0 0"}
DESIGN_TRANS_LIST[288] = {item = "^53b2c0副-教学副本-华山派-20级 SID:1241 MAP:a0_09" , line = "d_cmd 2008 1241 0 0"}
DESIGN_TRANS_LIST[289] = {item = "^53b2c0副-教学副本-日月教-10级 SID:1242 MAP:a0_07" , line = "d_cmd 2008 1242 0 0"}
DESIGN_TRANS_LIST[290] = {item = "^53b2c0副-教学副本-日月教-20级 SID:1243 MAP:a0_07" , line = "d_cmd 2008 1243 0 0"}
DESIGN_TRANS_LIST[291] = {item = "^53b2c0副-副本郊外酒肆 SID:1514 MAP:a39" , line = "d_cmd 2008 1514 81 -96"}
DESIGN_TRANS_LIST[292] = {item = "^53b2c0副-剧情副本-泰山叛乱 SID:1244 MAP:x67" , line = "d_cmd 2008 1244 0 0"}
DESIGN_TRANS_LIST[293] = {item = "^53b2c0副-剧情副本-朱仙镇换血 SID:1245 MAP:a08" , line = "d_cmd 2008 1245 0 0"}
DESIGN_TRANS_LIST[294] = {item = "^b6e3bb野-新仙愁峡 SID:80 MAP:x69" , line = "d_cmd 2008 80 0 0"}
DESIGN_TRANS_LIST[295] = {item = "^b6e3bb野-新五霸岗 SID:81 MAP:x70" , line = "d_cmd 2008 81 0 0"}
DESIGN_TRANS_LIST[296] = {item = "^b6e3bb野-新余杭 SID:82 MAP:x71" , line = "d_cmd 2008 82 0 0"}
DESIGN_TRANS_LIST[297] = {item = "^b6e3bb野-新仙霞岭 SID:83 MAP:x72" , line = "d_cmd 2008 83 0 0"}
DESIGN_TRANS_LIST[298] = {item = "^53b2c0副-新手村海上遇袭副本 SID:1246 MAP:a12" , line = "d_cmd 2008 1246 0 0"}
DESIGN_TRANS_LIST[299] = {item = "^53b2c0副-剧情副本-五霸岗厨师 SID:1247 MAP:x70" , line = "d_cmd 2008 1247 0 0"}
DESIGN_TRANS_LIST[300] = {item = "^53b2c0副-剧情副本-五霸岗猩猩 SID:1248 MAP:x70" , line = "d_cmd 2008 1248 0 0"}
DESIGN_TRANS_LIST[301] = {item = "^53b2c0副-副本海中孤岛 SID:1515 MAP:a40" , line = "d_cmd 2008 1515 111 -79"}
DESIGN_TRANS_LIST[302] = {item = "^b6e3bb野-苦水沼泽上层 SID:2016 MAP:d07_1" , line = "d_cmd 2008 2016 0 0"}
DESIGN_TRANS_LIST[303] = {item = "^b6e3bb野-苦水沼泽下层 SID:2017 MAP:d07_2" , line = "d_cmd 2008 2017 0 0"}
DESIGN_TRANS_LIST[304] = {item = "^53b2c0副-教学副本-唐门-10级 SID:1249 MAP:a0_02" , line = "d_cmd 2008 1249 0 0"}
DESIGN_TRANS_LIST[305] = {item = "^53b2c0副-教学副本-唐门-20级 SID:1250 MAP:a0_02" , line = "d_cmd 2008 1250 0 0"}
DESIGN_TRANS_LIST[306] = {item = "^53b2c0副-教学副本-恒山-10级 SID:1251 MAP:a0_05" , line = "d_cmd 2008 1251 0 0"}
DESIGN_TRANS_LIST[307] = {item = "^53b2c0副-教学副本-恒山-20级 SID:1252 MAP:a0_05" , line = "d_cmd 2008 1252 0 0"}
DESIGN_TRANS_LIST[308] = {item = "^53b2c0副-湖心棋洲 SID:1516 MAP:a41" , line = "d_cmd 2008 1516 0 0"}
DESIGN_TRANS_LIST[309] = {item = "^b6e3bb野-新铸剑谷 SID:84 MAP:x73" , line = "d_cmd 2008 84 0 0"}
DESIGN_TRANS_LIST[310] = {item = "^b6e3bb野-新龙泉 SID:85 MAP:x74" , line = "d_cmd 2008 85 0 0"}
DESIGN_TRANS_LIST[311] = {item = "^b6e3bb野-新南疆 SID:86 MAP:x76" , line = "d_cmd 2008 86 0 0"}
DESIGN_TRANS_LIST[312] = {item = "^53b2c0副-梅庄四友 SID:1253 MAP:a42" , line = "d_cmd 2008 1253 0 0"}
DESIGN_TRANS_LIST[313] = {item = "^53b2c0副-活动副本资源保卫 SID:1254 MAP:a43" , line = "d_cmd 2008 1254 0 0"}
DESIGN_TRANS_LIST[314] = {item = "^53b2c0副-活动副本比武大会 SID:1255 MAP:a44" , line = "d_cmd 2008 1255 0 0"}
DESIGN_TRANS_LIST[315] = {item = "^b6e3bb野-仙霞岭空山堡垒一层 SID:2018 MAP:d08_1" , line = "d_cmd 2008 2018 0 0"}
DESIGN_TRANS_LIST[316] = {item = "^b6e3bb野-仙霞岭空上堡垒二层 SID:2019 MAP:d08_2" , line = "d_cmd 2008 2019 0 0"}



--定义扔物品指令列表 Define Matter List
DESIGN_MATTER_LIST = {}
DESIGN_MATTER_LIST[1] = {item = "^00ff00加入少林" , line = "d_cmd 2007 1"}
DESIGN_MATTER_LIST[2] = {item = "^00ffff少林武器变形－三截棍" , line = "d_cmd 2013 803"}
DESIGN_MATTER_LIST[3] = {item = "^00ffff少林武器变形－拳掌" , line = "d_cmd 2013 804"}
DESIGN_MATTER_LIST[4] = {item = "^00ff00加入武当" , line = "d_cmd 2007 2"}
DESIGN_MATTER_LIST[5] = {item = "^00ffff武当武器变形－剑魔" , line = "d_cmd 2013 806"}
DESIGN_MATTER_LIST[6] = {item = "^00ff00加入华山" , line = "d_cmd 2007 3"}
DESIGN_MATTER_LIST[7] = {item = "^00ff00加入恒山" , line = "d_cmd 2007 4"}
DESIGN_MATTER_LIST[8] = {item = "^00ff00加入衡山" , line = "d_cmd 2007 5"}
DESIGN_MATTER_LIST[9] = {item = "^00ff00加入日月" , line = "d_cmd 2007 6"}
DESIGN_MATTER_LIST[10] = {item = "^00ffff日月武器变形－明剑" , line = "d_cmd 2013 818"}
DESIGN_MATTER_LIST[11] = {item = "^00ff00加入五仙" , line = "d_cmd 2007 7"}
DESIGN_MATTER_LIST[12] = {item = "^00ff00加入逍遥" , line = "d_cmd 2007 8"}
DESIGN_MATTER_LIST[13] = {item = "^00ffff逍遥武器变形－折扇" , line = "d_cmd 2013 824"}
DESIGN_MATTER_LIST[14] = {item = "^00ffff逍遥武器变形－团扇" , line = "d_cmd 2013 825"}
DESIGN_MATTER_LIST[15] = {item = "^00ff00加入唐门" , line = "d_cmd 2007 9"}
DESIGN_MATTER_LIST[16] = {item = "^00ffff唐门武器变形－手炮" , line = "d_cmd 2013 827"}
DESIGN_MATTER_LIST[17] = {item = "^00ff00加入峨眉" , line = "d_cmd 2007 10"}
--定义辅助功能列表 Define Help Function List
DESIGN_HELP_LIST = {}
DESIGN_HELP_LIST[1] = {item = "^53b2c0金蚕王：提一级" , line = "d_cmd 2000"}
DESIGN_HELP_LIST[2] = {item = "^53b2c0百万富翁：加一百万绑定币" , line = "d_cmd 2003 0 1000000"}
DESIGN_HELP_LIST[3] = {item = "^53b2c0富甲天下：加一百万交易币" , line = "d_cmd 2003 1 1000000"}
DESIGN_HELP_LIST[4] = {item = "^53b2c0久经沙场：加一百万经验" , line = "d_cmd 2018 1000000"}
DESIGN_HELP_LIST[5] = {item = "^53b2c0左膀右臂：加一百万伙伴经验" , line = "d_cmd 2027 1000000"}
DESIGN_HELP_LIST[6] = {item = "^53b2c0生技全能：加八千生活名望" , line = "d_cmd 2010 3 8000"}
DESIGN_HELP_LIST[7] = {item = "^53b2c0生产达人：加一千生产点" , line = "d_cmd 2030 0 1000"}
DESIGN_HELP_LIST[8] = {item = "^53b2c0社交达人：加一千社交点" , line = "d_cmd 2030 1 1000"}
DESIGN_HELP_LIST[9] = {item = "^53b2c0活动达人：加一千活动点" , line = "d_cmd 2030 2 1000"}
DESIGN_HELP_LIST[10] = {item = "^53b2c0家财万贯：加一万元宝" , line = "d_delcmd 168 1000000"}
DESIGN_HELP_LIST[11] = {item = "^53b2c0全球修理：召唤福利团" , line = "d_cmd 2005 10393"}
DESIGN_HELP_LIST[12] = {item = "^d03030原地自杀" , line = "d_cmd 2019"}
DESIGN_HELP_LIST[13] = {item = "^d03030飞到本队镖车" , line = "d_cmd 3061"}
DESIGN_HELP_LIST[14] = {item = "^B6E3BB奔跑加速：打开" , line = "d_runspeed 10"}
DESIGN_HELP_LIST[15] = {item = "^FFED72奔跑加速：关闭" , line = "d_runspeed 4"}
DESIGN_HELP_LIST[16] = {item = "^B6E3BB查看帧数：打开" , line = "d_fps 1"}
DESIGN_HELP_LIST[17] = {item = "^FFED72查看帧数：关闭" , line = "d_fps 0"}
DESIGN_HELP_LIST[18] = {item = "^B6E3BB调试LOG：打开" , line = "d_rtdebug 1"}
DESIGN_HELP_LIST[19] = {item = "^FFED72调试LOG：关闭" , line = "d_rtdebug 0"}
DESIGN_HELP_LIST[20] = {item = "^B6E3BB查看坐标：所有" , line = "d_showpos 127"}
DESIGN_HELP_LIST[21] = {item = "^B6E3BB查看坐标：自身" , line = "d_showpos 1"}
DESIGN_HELP_LIST[22] = {item = "^B6E3BB查看坐标：宠物" , line = "d_showpos 16"}
DESIGN_HELP_LIST[23] = {item = "^B6E3BB查看坐标：子物体" , line = "d_showpos 64"}
DESIGN_HELP_LIST[24] = {item = "^B6E3BB查看坐标：自身＋宠物＋子物体" , line = "d_showpos 81"}
DESIGN_HELP_LIST[25] = {item = "^B6E3BB查看坐标：所有玩家" , line = "d_showpos 3"}
DESIGN_HELP_LIST[26] = {item = "^B6E3BB查看坐标：怪物" , line = "d_showpos 4"}
DESIGN_HELP_LIST[27] = {item = "^B6E3BB查看坐标：NPC" , line = "d_showpos 8"}
DESIGN_HELP_LIST[28] = {item = "^B6E3BB查看坐标：自身＋怪物＋NPC" , line = "d_showpos 13"}
DESIGN_HELP_LIST[29] = {item = "^B6E3BB查看坐标：矿＋动态物品＋掉落" , line = "d_showpos 32"}
DESIGN_HELP_LIST[30] = {item = "^B6E3BB查看坐标：自身＋怪物＋掉落" , line = "d_showpos 37"}
DESIGN_HELP_LIST[31] = {item = "^FFED72查看坐标：关闭" , line = "d_showpos 0"}
DESIGN_HELP_LIST[32] = {item = "^B6E3BB查看通过图：打开" , line = "d_showmovemap 1"}
DESIGN_HELP_LIST[33] = {item = "^FFED72查看通过图：关闭" , line = "d_showmovemap 0"}
DESIGN_HELP_LIST[34] = {item = "^B6E3BB查看版面范围：打开" , line = "d_showboardarea 1"}
DESIGN_HELP_LIST[35] = {item = "^FFED72查看版面范围：关闭" , line = "d_showboardarea 0"}
DESIGN_HELP_LIST[36] = {item = "^B6E3BB查看阴影亮度：打开" , line = "d_instcfg 1"}
DESIGN_HELP_LIST[37] = {item = "^FFED72查看阴影亮度：关闭" , line = "d_instcfg 0"}
DESIGN_HELP_LIST[38] = {item = "^B6E3BB角色、生成器、模板id：打开" , line = "d_showid 1"}
DESIGN_HELP_LIST[39] = {item = "^FFED72角色、生成器、模板id：关闭" , line = "d_showid 0"}
DESIGN_HELP_LIST[40] = {item = "^B6E3BB客户端放技能模式：打开" , line = "d_rawclient 1"}
DESIGN_HELP_LIST[41] = {item = "^FFED72客户端放技能模式：关闭" , line = "d_rawclient 0"}
DESIGN_HELP_LIST[42] = {item = "^B6E3BB相机的自动调整：打开" , line = "d_autoadjcam 1"}
DESIGN_HELP_LIST[43] = {item = "^FFED72相机的自动调整：关闭" , line = "d_autoadjcam 0"}
DESIGN_HELP_LIST[44] = {item = "^B6E3BB静止帧：打开" , line = "d_frozenframe 1"}
DESIGN_HELP_LIST[45] = {item = "^FFED72静止帧：关闭" , line = "d_frozenframe 0"}
DESIGN_HELP_LIST[46] = {item = "^B6E3BB索敌模式：逻辑" , line = "d_lockenemy 1 0"}
DESIGN_HELP_LIST[47] = {item = "^B6E3BB索敌模式：逻辑和摄像机" , line = "d_lockenemy 1 1"}
DESIGN_HELP_LIST[48] = {item = "^FFED72索敌模式：关闭" , line = "d_lockenemy 0 0"}
DESIGN_HELP_LIST[49] = {item = "^B6E3BB技能判定调试：实心" , line = "d_skilldebug 1"}
DESIGN_HELP_LIST[50] = {item = "^B6E3BB技能判定调试：线框" , line = "d_skilldebug 2"}
DESIGN_HELP_LIST[51] = {item = "^B6E3BB技能判定调试：周围地形" , line = "d_skilldebug 8"}
DESIGN_HELP_LIST[52] = {item = "^B6E3BB技能判定调试：全部" , line = "d_skilldebug 13"}
DESIGN_HELP_LIST[53] = {item = "^FFED72技能判定调试：关闭" , line = "d_skilldebug 0"}
DESIGN_HELP_LIST[54] = {item = "^FFED72获得十万功力" , line = "d_cmd 2078 100000"}
DESIGN_HELP_LIST[55] = {item = "^B6E3BB查看凸包：打开" , line = "d_showch 1"}
DESIGN_HELP_LIST[56] = {item = "^FFED72查看凸包：关闭" , line = "d_showch 0"}
DESIGN_HELP_LIST[57] = {item = "^FFED72将目标扣一血（制造仇恨）" , line = "d_cmd 50005 1"}
DESIGN_HELP_LIST[58] = {item = "^FFED72将目标扣一百血" , line = "d_cmd 50005 100"}
DESIGN_HELP_LIST[59] = {item = "^FFED72将目标扣一千血" , line = "d_cmd 50005 1000"}
DESIGN_HELP_LIST[60] = {item = "^FFED72将目标扣一万血" , line = "d_cmd 50005 10000"}
DESIGN_HELP_LIST[61] = {item = "^FFED72将目标扣一十万血" , line = "d_cmd 50005 100000"}
DESIGN_HELP_LIST[62] = {item = "^FFED72将目标扣一百万血" , line = "d_cmd 50005 1000000"}
DESIGN_HELP_LIST[63] = {item = "^FFED72将目标扣一千万血" , line = "d_cmd 50005 10000000"}
DESIGN_HELP_LIST[64] = {item = "^d03030清空绑定币" , line = "d_cmd 2003 0 0"}
--DESIGN_HELP_LIST[?] = {item = "^B6E3BB物品技能TIP显ID" , line = "d_script TestShowItemId = 1"}
--DESIGN_HELP_LIST[?] = {item = "^FFED72物品技能TIP隐ID" , line = "d_script TestShowItemId = 0"}
--定义摄像机调节功能列表 Define Camera Mode List
DESIGN_CAMERA_ACTIVE_COLOR = "标绿"
DESIGN_CAMERA_INACTIVE_COLOR = "标白"
DESIGN_CAMERA_DISABLE_COLOR = "标灰"
DESIGN_CAMERA_TIPS_STRING = "提示：当前视角有可能需要选其它再切回。"
DESIGN_CAMERA_LIST = {}
DESIGN_CAMERA_LIST[1] = {item = "第三人称环绕俯视（天龙八部）" , line = "d_setcameratype 2"}
DESIGN_CAMERA_LIST[2] = {item = "第三人称锁定俯视（大波罗Ⅲ）" , line = "d_setcameratype 1"}
DESIGN_CAMERA_LIST[4] = {item = "第一人称追尾（三国无双）" , line = "d_setcameratype 5"}
DESIGN_CAMERA_LIST[5] = {item = "第三人称射击视角（龙之谷）" , line = "d_setcameratype 6"}
DESIGN_CAMERA_LIST[6] = {item = "第三人称自由俯视（鬼泣Ⅳ）" , line = "d_setcameratype 4"}
DESIGN_CAMERA_LIST[3] = {item = "第三人称自由俯视（魔兽世界）" , line = "d_setcameratype 3"}
--定义实时调试功能列表 Define Ingame Function List
DESIGN_INGAME_TEST_LIST = {}
DESIGN_INGAME_TEST_LIST[1] = {name = "^00ffff10分钟后重启当前线" , command = {40}}
DESIGN_INGAME_TEST_LIST[2] = {name = "^00ffff 5分钟后重启当前线（荐）" , command = {41}}
DESIGN_INGAME_TEST_LIST[3] = {name = "^00ffff 1分钟后重启当前线" , command = {42}}
DESIGN_INGAME_TEST_LIST[4] = {name = "^00ffff 15秒后后重启当前线" , command = {43}}
DESIGN_INGAME_TEST_LIST[5] = {name = "^00ffff立刻重启当前线（慎）" , command = {44}}
DESIGN_INGAME_TEST_LIST[6] = {name = "^00ffff取消当前线重启倒计时" , command = {45}}
DESIGN_INGAME_TEST_LIST[7] = {name = "^666666－－－－－－－－－－" , command = {}}
DESIGN_INGAME_TEST_LIST[8] = {name = "^00ffff重新加载：^E76041instance.txt相位配置" , command = {20}}
DESIGN_INGAME_TEST_LIST[9] = {name = "^00ffff重新加载：^E76041color.txt文本显示格式" , command = {19}}
DESIGN_INGAME_TEST_LIST[10] = {name = "^00ffff重新加载：^E76041常用显示文本" , command = {5, 6, 21}}
DESIGN_INGAME_TEST_LIST[11] = {name = "^00ffff重新加载：^E76041物品描述脚本" , command = {1, 2, 3, 4}}
DESIGN_INGAME_TEST_LIST[12] = {name = "^00ffff重新加载：^E76041技能描述脚本" , command = {11, 22, 23, 24}}
DESIGN_INGAME_TEST_LIST[13] = {name = "^666666－－－－－－－－－－" , command = {}}
DESIGN_INGAME_TEST_LIST[14] = {name = "^00ffff重新加载：^E76041组合动作名称脚本" , command = {7, 8, 9}}
DESIGN_INGAME_TEST_LIST[15] = {name = "^00ffff重新加载：^E76041技能显示效果脚本" , command = {10, 94}}
DESIGN_INGAME_TEST_LIST[16] = {name = "^00ffff重新加载：^E76041表情配置信息脚本" , command = {7, 8, 12}}
DESIGN_INGAME_TEST_LIST[17] = {name = "^00ffff重新加载：^E76041任务追踪提示脚本" , command = {25}}
DESIGN_INGAME_TEST_LIST[18] = {name = "^00ffff重新加载：^E76041AI喊话脚本" , command = {35, 36}}
DESIGN_INGAME_TEST_LIST[19] = {name = "^666666－－－－－－－－－－" , command = {}}
DESIGN_INGAME_TEST_LIST[20] = {name = "^00ffff学会加速跑" , command = {46}}
DESIGN_INGAME_TEST_LIST[21] = {name = "^00ffff学会水上漂" , command = {51}}
DESIGN_INGAME_TEST_LIST[22] = {name = "^00ffff学会一、二段跳" , command = {47, 48}}
DESIGN_INGAME_TEST_LIST[23] = {name = "^00ffff学会三段跳" , command = {49}}
DESIGN_INGAME_TEST_LIST[24] = {name = "^00ffff学会四段跳" , command = {50}}
DESIGN_INGAME_TEST_LIST[25] = {name = "^666666－－－－－－－－－－" , command = {}}
DESIGN_INGAME_TEST_LIST[26] = {name = "^00ffff关闭所有蒙板" , command = {34}}
DESIGN_INGAME_TEST_LIST[27] = {name = "^00ffff1号蒙板：4m、8m" , command = {33}}
DESIGN_INGAME_TEST_LIST[28] = {name = "^666666－－－－－－－－－－" , command = {}}
DESIGN_INGAME_TEST_LIST[29] = {name = "^00ffff自由视角" , command = {31}}
DESIGN_INGAME_TEST_LIST[30] = {name = "^00ffff摄像机无偏移" , command = {32}}
DESIGN_INGAME_TEST_LIST[31] = {name = "^00ffff摄像机向上偏移" , command = {26}}
--DESIGN_INGAME_TEST_LIST[32] = {name = "^ffffff测试PK场景：擂台" , command = {27,26}}
--DESIGN_INGAME_TEST_LIST[33] = {name = "^ffffff测试PK场景：山门" , command = {28,26}}
--DESIGN_INGAME_TEST_LIST[34] = {name = "^ffffff测试PK场景：村外" , command = {29,26}}
--DESIGN_INGAME_TEST_LIST[35] = {name = "^ffffff测试PK场景：水乡" , command = {30,26}}
DESIGN_INGAME_TEST_LIST[32] = {name = "^00ffff天气调整：^53B2C0阴天" , command = {54}}
DESIGN_INGAME_TEST_LIST[33] = {name = "^00ffff天气调整：^B6E3BB阴天打雷" , command = {55}}
DESIGN_INGAME_TEST_LIST[34] = {name = "^00ffff天气调整：^FFED72小雨" , command = {56}}
DESIGN_INGAME_TEST_LIST[35] = {name = "^00ffff天气调整：^CCCCCC大雨" , command = {57}}
DESIGN_INGAME_TEST_LIST[36] = {name = "^00ffff天气调整：^1D9DFF雷雨" , command = {58}}
DESIGN_INGAME_TEST_LIST[37] = {name = "^00ffff天气调整：^FFFFFF晴天" , command = {59}}
--DESIGN_INGAME_TEST_LIST[37] = {name = "^00ffff天气调整：^53B2C0晴朗" , command = {14}}
--DESIGN_INGAME_TEST_LIST[38] = {name = "^00ffff天气调整：^B6E3BB小雨" , command = {17}}
--DESIGN_INGAME_TEST_LIST[39] = {name = "^00ffff天气调整：^FFED72雷雨" , command = {13}}
--DESIGN_INGAME_TEST_LIST[40] = {name = "^00ffff天气调整：^CCCCCC薄雾" , command = {15}}
--DESIGN_INGAME_TEST_LIST[41] = {name = "^00ffff天气调整：^1D9DFF洞窟" , command = {16}}
--DESIGN_INGAME_TEST_LIST[42] = {name = "^00ffff天气调整：^FFFFFF瑞雪" , command = {18}}
DESIGN_INGAME_TEST_LIST[38] = {name = "^666666－－^FFED72操作模式切换^666666－－" , command = {}}
DESIGN_INGAME_TEST_LIST[39] = {name = "^00ffff目标优先模式（默认）" , command = {37}}
DESIGN_INGAME_TEST_LIST[40] = {name = "^00ffff面向优先模式" , command = {38}}
DESIGN_INGAME_TEST_LIST[41] = {name = "^00ffff鼠标优先模式" , command = {52}}
DESIGN_INGAME_TEST_LIST[42] = {name = "^00ffff手动操作模式" , command = {53}}
DESIGN_INGAME_TEST_LIST[43] = {name = "^666666－－－－－－－－－－" , command = {}}
DESIGN_INGAME_TEST_LIST[44] = {name = "^00ffff复制60级角色数据：^B6E3BB少林（男）" , command = {60}}
DESIGN_INGAME_TEST_LIST[45] = {name = "^00ffff复制60级角色数据：^B6E3BB少林（女）" , command = {61}}
DESIGN_INGAME_TEST_LIST[46] = {name = "^00ffff复制60级角色数据：^ffffff武当（男）" , command = {62}}
DESIGN_INGAME_TEST_LIST[47] = {name = "^00ffff复制60级角色数据：^ffffff武当（女）" , command = {63}}
DESIGN_INGAME_TEST_LIST[48] = {name = "^00ffff复制60级角色数据：^B6E3BB华山（男）" , command = {64}}
DESIGN_INGAME_TEST_LIST[49] = {name = "^00ffff复制60级角色数据：^B6E3BB华山（女）" , command = {65}}
DESIGN_INGAME_TEST_LIST[50] = {name = "^00ffff复制60级角色数据：^ffffff恒山（男）" , command = {66}}
DESIGN_INGAME_TEST_LIST[51] = {name = "^00ffff复制60级角色数据：^ffffff恒山（女）" , command = {67}}
DESIGN_INGAME_TEST_LIST[52] = {name = "^00ffff复制60级角色数据：^B6E3BB衡山（男）" , command = {68}}
DESIGN_INGAME_TEST_LIST[53] = {name = "^00ffff复制60级角色数据：^B6E3BB衡山（女）" , command = {69}}
DESIGN_INGAME_TEST_LIST[54] = {name = "^00ffff复制60级角色数据：^ffffff日月（男）" , command = {70}}
DESIGN_INGAME_TEST_LIST[55] = {name = "^00ffff复制60级角色数据：^ffffff日月（女）" , command = {71}}
DESIGN_INGAME_TEST_LIST[56] = {name = "^00ffff复制60级角色数据：^B6E3BB五仙（男）" , command = {72}}
DESIGN_INGAME_TEST_LIST[57] = {name = "^00ffff复制60级角色数据：^B6E3BB五仙（女）" , command = {73}}
DESIGN_INGAME_TEST_LIST[58] = {name = "^00ffff复制60级角色数据：^ffffff逍遥（男）" , command = {74}}
DESIGN_INGAME_TEST_LIST[59] = {name = "^00ffff复制60级角色数据：^ffffff逍遥（女）" , command = {75}}
DESIGN_INGAME_TEST_LIST[60] = {name = "^00ffff复制60级角色数据：^B6E3BB唐门（男）" , command = {76}}
DESIGN_INGAME_TEST_LIST[61] = {name = "^00ffff复制60级角色数据：^B6E3BB唐门（女）" , command = {77}}
DESIGN_INGAME_TEST_LIST[62] = {name = "^00ffff复制60级角色数据：^ffffff峨嵋（男）" , command = {78}}
DESIGN_INGAME_TEST_LIST[63] = {name = "^00ffff复制60级角色数据：^ffffff峨嵋（女）" , command = {79}}
DESIGN_INGAME_TEST_LIST[64] = {name = "^00ffff复制1级角色" , command = {95}}
DESIGN_INGAME_TEST_LIST[65] = {name = "^666666－－－－－－－－－－" , command = {}}
DESIGN_INGAME_TEST_LIST[66] = {name = "^00ffff重置少林所有技能" , command = {1001,1002,1003,1004,1005,1006,2001,2002,2003,2004,2005,2006,2007,2008,2009,2010,2011,2012,2013,2014,2015,2016,2017,2018,2019,4001,4002,4003,4004,4005,4006,4007,4008,4009,4010,4011,4012,4013,4014,4015,5001}}
DESIGN_INGAME_TEST_LIST[67] = {name = "^00ffff重置武当所有技能" , command = {1101,1102,1103,1104,1105,1106,2101,2102,2103,2104,2105,2106,2107,2108,2109,2110,2111,2112,2113,2114,2115,2116,2117,3101,3102,3103,3104,3105,3106,3107,3108,3109,3110,3111,3112,3113,3114,3115,3116,3117,4101,4102,4103,4104,4105,4106,5101}}
DESIGN_INGAME_TEST_LIST[68] = {name = "^00ffff重置华山所有技能" , command = {1201,1202,1203,1204,1205,1206,2201,2202,2203,2204,2205,2206,2207,2208,2209,2210,2211,2212,2213,2214,2215,2216,3201,3202,3203,3204,3205,3206,3207,3208,3209,3210,3211,3212,3213,3214,3215,3216,4201,4202,4203,4204,4205,5201}}
DESIGN_INGAME_TEST_LIST[69] = {name = "^00ffff重置恒山所有技能" , command = {1301,1302,1303,1304,1305,1306,2301,2302,2303,2304,2305,2306,2307,2308,2309,2310,2311,2312,2313,2314,2315,2316,4301,4302,4303,4304,4305,4306,4307,4308,4309,5301}}
DESIGN_INGAME_TEST_LIST[70] = {name = "^00ffff重置衡山所有技能" , command = {1401,1402,1403,1404,1405,1406,2401,2402,2403,2404,2405,2406,2407,2408,2409,2410,2411,2412,2413,4401,4402,4403,4404,4405,4406,4407,4408,4409,4410,5401}}
DESIGN_INGAME_TEST_LIST[71] = {name = "^00ffff重置日月所有技能" , command = {1501,1502,1503,1504,1505,1506,2501,2502,2503,2504,2505,2506,2507,2508,2509,2510,2511,2512,2513,2514,2515,2516,3501,3502,3503,3504,3505,3506,3507,3508,3509,3510,3511,3512,3513,3514,3515,3516,4501,4502,4503,4504,4505,4506,4507,4508,4509,5501}}
DESIGN_INGAME_TEST_LIST[72] = {name = "^00ffff重置五仙所有技能" , command = {1601,1602,1603,1604,1605,1606,2601,2602,2603,2604,2605,2606,2607,2608,2609,2610,2611,2612,2613,2614,4601,4602,4603,4604,4605,4606,4607,4608,4609,4610,4611,4612,4613,4614,4615,4616,5601}}
DESIGN_INGAME_TEST_LIST[73] = {name = "^00ffff重置逍遥所有技能" , command = {1701,1702,1703,1704,1705,1706,2701,2702,2703,2704,2705,2706,2707,2708,2709,2710,2711,2712,2713,2714,2715,4701,4702,4703,4704,4705,4706,4707,5701}}
DESIGN_INGAME_TEST_LIST[74] = {name = "^00ffff重置唐门所有技能" , command = {1801,1802,1803,1804,1805,1806,2801,2802,2803,2804,2805,2806,2807,2808,2809,2810,2811,2812,2813,2814,2815,2816,3801,3802,3803,3804,3805,3806,3807,3808,3809,3810,3811,3812,3813,3814,3815,3816,5801}}
DESIGN_INGAME_TEST_LIST[75] = {name = "^00ffff重置峨嵋所有技能" , command = {1901,1902,1903,1904,1905,1906,2901,2902,2903,2904,2905,2906,2907,2908,2909,2910,2911,2912,2913,2914,2915,2916,4901,4902,4903,4904,4905,5901}}
DESIGN_INGAME_TEST_LIST[76] = {name = "^666666－－－－－－－－－－" , command = {}}
DESIGN_INGAME_TEST_LIST[77] = {name = "^00ffff学全身法(要求等级)" , command = {80,81,82,83,84,85,86,87,88,89,90,91,92,93}}
DESIGN_INGAME_TEST_LIST[78] = {name = "^00ffff全名人变身(清包裹留60格)" , command = {901,902,903,904,905,906,907,908,909,910,911,912,913,914,915,916,917,918,919,920,921,922,923,924,925,926,927,928,929,930,931,932,933,934,935,936,937,938,939,940,941,942,943,944,945,946,947,948,949,950,951,952,953,954,955,956,957,958,959,960,}}
--定义调试功能列表
DESIGN_FUNCTION_LIST = {}
DESIGN_FUNCTION_LIST[1] = "d_reloadscript item_tip.lua"
DESIGN_FUNCTION_LIST[2] = "d_reloadscript desc_tool.lua"
DESIGN_FUNCTION_LIST[3] = "d_reloadscript desc_utility.lua"
DESIGN_FUNCTION_LIST[4] = "d_reloadscript desc_text.lua"
DESIGN_FUNCTION_LIST[5] = "d_reloadscript Text.lua"
DESIGN_FUNCTION_LIST[6] = "d_reloadscript NpcPrologue.lua"
DESIGN_FUNCTION_LIST[7] = "d_reloadscript Visual.lua"
DESIGN_FUNCTION_LIST[8] = "d_reloadscript action.lua"
DESIGN_FUNCTION_LIST[9] = "d_reloadscript ecmactname.lua"
DESIGN_FUNCTION_LIST[10] = "d_reloadscript skillvisual.lua"
DESIGN_FUNCTION_LIST[11] = "d_reloadscript skillpackvis.lua"
DESIGN_FUNCTION_LIST[12] = "d_reloadscript emote.lua"
DESIGN_FUNCTION_LIST[13] = "d_env 1"
DESIGN_FUNCTION_LIST[14] = "d_env 2"
DESIGN_FUNCTION_LIST[15] = "d_env 3"
DESIGN_FUNCTION_LIST[16] = "d_env 10"
DESIGN_FUNCTION_LIST[17] = "d_env 16"
DESIGN_FUNCTION_LIST[18] = "d_env 20"
DESIGN_FUNCTION_LIST[19] = "d_reloadcolor"
DESIGN_FUNCTION_LIST[20] = "d_reloadsection"
DESIGN_FUNCTION_LIST[21] = "d_reloadscript item_ext_desc.lua"
DESIGN_FUNCTION_LIST[22] = "d_reloadscript skill_tip.lua"
DESIGN_FUNCTION_LIST[23] = "d_reloadscript skill_text.lua"
DESIGN_FUNCTION_LIST[24] = "d_reloadscript buff_tip.lua"
DESIGN_FUNCTION_LIST[25] = "d_reloadscript task_help.lua"
DESIGN_FUNCTION_LIST[26] = "d_camheight 0.8 0.5"
DESIGN_FUNCTION_LIST[27] = "d_cmd 2008 12 -22 -35"
DESIGN_FUNCTION_LIST[28] = "d_cmd 2008 6 24 -26"
DESIGN_FUNCTION_LIST[29] = "d_cmd 2008 11 40 -10"
DESIGN_FUNCTION_LIST[30] = "d_cmd 2008 16 -2 -38"
DESIGN_FUNCTION_LIST[31] = "d_setcameratype 3"
DESIGN_FUNCTION_LIST[32] = "d_camheight 0.6 0.1"
DESIGN_FUNCTION_LIST[33] = "d_maskboard 0 1 1 4 8"
DESIGN_FUNCTION_LIST[34] = "d_maskboard 0"
DESIGN_FUNCTION_LIST[35] = "d_reloadscript obj_speak.lua"
DESIGN_FUNCTION_LIST[36] = "d_reloadscript obj_speak_data.lua"
DESIGN_FUNCTION_LIST[37] = "d_oprmode 0"
DESIGN_FUNCTION_LIST[38] = "d_oprmode 1"
DESIGN_FUNCTION_LIST[39] = "d_oprmode 1"
DESIGN_FUNCTION_LIST[40] = "d_cmd 20000 600"
DESIGN_FUNCTION_LIST[41] = "d_cmd 20000 300"
DESIGN_FUNCTION_LIST[42] = "d_cmd 20000 66"
DESIGN_FUNCTION_LIST[43] = "d_cmd 20000 24"
DESIGN_FUNCTION_LIST[44] = "d_cmd 20000 0"
DESIGN_FUNCTION_LIST[45] = "d_cmd 20000 -1"
DESIGN_FUNCTION_LIST[46] = "d_cmd 2013 3104"
DESIGN_FUNCTION_LIST[47] = "d_cmd 2013 3105"
DESIGN_FUNCTION_LIST[48] = "d_cmd 2013 3106"
DESIGN_FUNCTION_LIST[49] = "d_cmd 2013 3107"
DESIGN_FUNCTION_LIST[50] = "d_cmd 2013 3108"
DESIGN_FUNCTION_LIST[51] = "d_cmd 2013 3114"
DESIGN_FUNCTION_LIST[52] = "d_oprmode 2"
DESIGN_FUNCTION_LIST[53] = "d_oprmode 3"
DESIGN_FUNCTION_LIST[54] = "d_env 101"
DESIGN_FUNCTION_LIST[55] = "d_env 102"
DESIGN_FUNCTION_LIST[56] = "d_env 103"
DESIGN_FUNCTION_LIST[57] = "d_env 104"
DESIGN_FUNCTION_LIST[58] = "d_env 105"
DESIGN_FUNCTION_LIST[59] = "d_env 32"
DESIGN_FUNCTION_LIST[60] = "d_delcmd 169 测试少林男"
DESIGN_FUNCTION_LIST[61] = "d_delcmd 169 测试少林女"
DESIGN_FUNCTION_LIST[62] = "d_delcmd 169 测试武当男"
DESIGN_FUNCTION_LIST[63] = "d_delcmd 169 测试武当女"
DESIGN_FUNCTION_LIST[64] = "d_delcmd 169 测试华山男"
DESIGN_FUNCTION_LIST[65] = "d_delcmd 169 测试华山女"
DESIGN_FUNCTION_LIST[66] = "d_delcmd 169 测试恒山男"
DESIGN_FUNCTION_LIST[67] = "d_delcmd 169 测试恒山女"
DESIGN_FUNCTION_LIST[68] = "d_delcmd 169 测试衡山男"
DESIGN_FUNCTION_LIST[69] = "d_delcmd 169 测试衡山女"
DESIGN_FUNCTION_LIST[70] = "d_delcmd 169 测试日月男"
DESIGN_FUNCTION_LIST[71] = "d_delcmd 169 测试日月女"
DESIGN_FUNCTION_LIST[72] = "d_delcmd 169 测试五仙男"
DESIGN_FUNCTION_LIST[73] = "d_delcmd 169 测试五仙女"
DESIGN_FUNCTION_LIST[74] = "d_delcmd 169 测试逍遥男"
DESIGN_FUNCTION_LIST[75] = "d_delcmd 169 测试逍遥女"
DESIGN_FUNCTION_LIST[76] = "d_delcmd 169 测试唐门男"
DESIGN_FUNCTION_LIST[77] = "d_delcmd 169 测试唐门女"
DESIGN_FUNCTION_LIST[78] = "d_delcmd 169 测试峨嵋男"
DESIGN_FUNCTION_LIST[79] = "d_delcmd 169 测试峨嵋女"
DESIGN_FUNCTION_LIST[80] = "d_cmd 2013 3105"
DESIGN_FUNCTION_LIST[81] = "d_cmd 2013 3106"
DESIGN_FUNCTION_LIST[82] = "d_cmd 2013 3107"
DESIGN_FUNCTION_LIST[83] = "d_cmd 2013 3108"
DESIGN_FUNCTION_LIST[84] = "d_cmd 2013 23"
DESIGN_FUNCTION_LIST[85] = "d_cmd 2013 24"
DESIGN_FUNCTION_LIST[86] = "d_cmd 2013 25"
DESIGN_FUNCTION_LIST[87] = "d_cmd 2013 26"
DESIGN_FUNCTION_LIST[88] = "d_cmd 2013 3104"
DESIGN_FUNCTION_LIST[89] = "d_cmd 2013 3114"
DESIGN_FUNCTION_LIST[90] = "d_cmd 2013 2685"
DESIGN_FUNCTION_LIST[91] = "d_cmd 2013 3591"
DESIGN_FUNCTION_LIST[92] = "d_cmd 2013 2074"
DESIGN_FUNCTION_LIST[93] = "d_cmd 2013 2261"
DESIGN_FUNCTION_LIST[94] = "d_reloadscript skillvisual_misc.lua"
DESIGN_FUNCTION_LIST[95] = "d_delcmd 169 新手攻击测试"
DESIGN_FUNCTION_LIST[96] = "d_reloadscript curnpclist.lua"

--变身包


DESIGN_FUNCTION_LIST[901] = "d_cmd 2001 30356 1000"
DESIGN_FUNCTION_LIST[902] = "d_cmd 2001 55512 100"
DESIGN_FUNCTION_LIST[903] = "d_cmd 2001 55513 100"
DESIGN_FUNCTION_LIST[904] = "d_cmd 2001 55514 100"
DESIGN_FUNCTION_LIST[905] = "d_cmd 2001 55515 100"
DESIGN_FUNCTION_LIST[906] = "d_cmd 2001 55516 100"
DESIGN_FUNCTION_LIST[907] = "d_cmd 2001 55517 100"
DESIGN_FUNCTION_LIST[908] = "d_cmd 2001 55518 100"
DESIGN_FUNCTION_LIST[909] = "d_cmd 2001 55519 100"
DESIGN_FUNCTION_LIST[910] = "d_cmd 2001 55520 100"
DESIGN_FUNCTION_LIST[911] = "d_cmd 2001 55521 100"
DESIGN_FUNCTION_LIST[912] = "d_cmd 2001 55522 100"
DESIGN_FUNCTION_LIST[913] = "d_cmd 2001 55523 100"
DESIGN_FUNCTION_LIST[914] = "d_cmd 2001 55524 100"
DESIGN_FUNCTION_LIST[915] = "d_cmd 2001 55525 100"
DESIGN_FUNCTION_LIST[916] = "d_cmd 2001 55526 100"
DESIGN_FUNCTION_LIST[917] = "d_cmd 2001 55527 100"
DESIGN_FUNCTION_LIST[918] = "d_cmd 2001 55528 100"
DESIGN_FUNCTION_LIST[919] = "d_cmd 2001 55529 100"
DESIGN_FUNCTION_LIST[920] = "d_cmd 2001 55530 100"
DESIGN_FUNCTION_LIST[921] = "d_cmd 2001 55531 100"
DESIGN_FUNCTION_LIST[922] = "d_cmd 2001 55532 100"
DESIGN_FUNCTION_LIST[923] = "d_cmd 2001 55533 100"
DESIGN_FUNCTION_LIST[924] = "d_cmd 2001 55534 100"
DESIGN_FUNCTION_LIST[925] = "d_cmd 2001 55535 100"
DESIGN_FUNCTION_LIST[926] = "d_cmd 2001 55536 100"
DESIGN_FUNCTION_LIST[927] = "d_cmd 2001 55537 100"
DESIGN_FUNCTION_LIST[928] = "d_cmd 2001 55538 100"
DESIGN_FUNCTION_LIST[929] = "d_cmd 2001 55539 100"
DESIGN_FUNCTION_LIST[930] = "d_cmd 2001 55540 100"
DESIGN_FUNCTION_LIST[931] = "d_cmd 2001 55541 100"
DESIGN_FUNCTION_LIST[932] = "d_cmd 2001 55542 100"
DESIGN_FUNCTION_LIST[933] = "d_cmd 2001 55543 100"
DESIGN_FUNCTION_LIST[934] = "d_cmd 2001 55544 100"
DESIGN_FUNCTION_LIST[935] = "d_cmd 2001 55545 100"
DESIGN_FUNCTION_LIST[936] = "d_cmd 2001 55546 100"
DESIGN_FUNCTION_LIST[937] = "d_cmd 2001 55547 100"
DESIGN_FUNCTION_LIST[938] = "d_cmd 2001 55548 100"
DESIGN_FUNCTION_LIST[939] = "d_cmd 2001 55549 100"
DESIGN_FUNCTION_LIST[940] = "d_cmd 2001 55550 100"
DESIGN_FUNCTION_LIST[941] = "d_cmd 2001 55551 100"
DESIGN_FUNCTION_LIST[942] = "d_cmd 2001 55552 100"
DESIGN_FUNCTION_LIST[943] = "d_cmd 2001 55553 100"
DESIGN_FUNCTION_LIST[944] = "d_cmd 2001 55554 100"
DESIGN_FUNCTION_LIST[945] = "d_cmd 2001 55555 100"
DESIGN_FUNCTION_LIST[946] = "d_cmd 2001 55556 100"
DESIGN_FUNCTION_LIST[947] = "d_cmd 2001 55557 100"
DESIGN_FUNCTION_LIST[948] = "d_cmd 2001 55558 100"
DESIGN_FUNCTION_LIST[949] = "d_cmd 2001 55559 100"
DESIGN_FUNCTION_LIST[950] = "d_cmd 2001 55560 100"
DESIGN_FUNCTION_LIST[951] = "d_cmd 2001 55561 100"
DESIGN_FUNCTION_LIST[952] = "d_cmd 2001 55562 100"
DESIGN_FUNCTION_LIST[953] = "d_cmd 2001 55563 100"
DESIGN_FUNCTION_LIST[954] = "d_cmd 2001 55564 100"
DESIGN_FUNCTION_LIST[955] = "d_cmd 2001 55565 100"
DESIGN_FUNCTION_LIST[956] = "d_cmd 2001 55566 100"
DESIGN_FUNCTION_LIST[957] = "d_cmd 2001 55567 100"
DESIGN_FUNCTION_LIST[958] = "d_cmd 2001 55568 100"
DESIGN_FUNCTION_LIST[959] = "d_cmd 2001 55569 100"
DESIGN_FUNCTION_LIST[960] = "d_cmd 2001 55570 100"
--新手
DESIGN_FUNCTION_LIST[1000] = "d_cmd 2024 18689"

--少林
DESIGN_FUNCTION_LIST[1001] = "d_cmd 2024 38004"
DESIGN_FUNCTION_LIST[1002] = "d_cmd 2024 38005"
DESIGN_FUNCTION_LIST[1003] = "d_cmd 2024 38006"
DESIGN_FUNCTION_LIST[1004] = "d_cmd 2024 38007"
DESIGN_FUNCTION_LIST[1005] = "d_cmd 2024 38008"
DESIGN_FUNCTION_LIST[1006] = "d_cmd 2024 38009"

DESIGN_FUNCTION_LIST[2001] = "d_cmd 2024 38175"
DESIGN_FUNCTION_LIST[2002] = "d_cmd 2024 38176"
DESIGN_FUNCTION_LIST[2003] = "d_cmd 2024 38177"
DESIGN_FUNCTION_LIST[2004] = "d_cmd 2024 38179"
DESIGN_FUNCTION_LIST[2005] = "d_cmd 2024 38180"
DESIGN_FUNCTION_LIST[2006] = "d_cmd 2024 38181"
DESIGN_FUNCTION_LIST[2007] = "d_cmd 2024 38182"
DESIGN_FUNCTION_LIST[2008] = "d_cmd 2024 38183"
DESIGN_FUNCTION_LIST[2009] = "d_cmd 2024 38184"
DESIGN_FUNCTION_LIST[2010] = "d_cmd 2024 38185"
DESIGN_FUNCTION_LIST[2011] = "d_cmd 2024 38187"
DESIGN_FUNCTION_LIST[2012] = "d_cmd 2024 38188"
DESIGN_FUNCTION_LIST[2013] = "d_cmd 2024 38191"
DESIGN_FUNCTION_LIST[2014] = "d_cmd 2024 38192"
DESIGN_FUNCTION_LIST[2015] = "d_cmd 2024 38193"
DESIGN_FUNCTION_LIST[2016] = "d_cmd 2024 38194"
DESIGN_FUNCTION_LIST[2017] = "d_cmd 2024 38195"
DESIGN_FUNCTION_LIST[2018] = "d_cmd 2024 38196"
DESIGN_FUNCTION_LIST[2019] = "d_cmd 2024 38197"

DESIGN_FUNCTION_LIST[4001] = "d_cmd 2013 4822"
DESIGN_FUNCTION_LIST[4002] = "d_cmd 2013 4823"
DESIGN_FUNCTION_LIST[4003] = "d_cmd 2013 4824"
DESIGN_FUNCTION_LIST[4004] = "d_cmd 2013 4825"
DESIGN_FUNCTION_LIST[4005] = "d_cmd 2013 4826"
DESIGN_FUNCTION_LIST[4006] = "d_cmd 2013 4827"
DESIGN_FUNCTION_LIST[4007] = "d_cmd 2013 4828"
DESIGN_FUNCTION_LIST[4008] = "d_cmd 2013 4829"
DESIGN_FUNCTION_LIST[4009] = "d_cmd 2013 4830"
DESIGN_FUNCTION_LIST[4010] = "d_cmd 2013 4831"
DESIGN_FUNCTION_LIST[4011] = "d_cmd 2013 4832"
DESIGN_FUNCTION_LIST[4012] = "d_cmd 2013 4833"
DESIGN_FUNCTION_LIST[4013] = "d_cmd 2013 4834"
DESIGN_FUNCTION_LIST[4014] = "d_cmd 2013 4838"
DESIGN_FUNCTION_LIST[4015] = "d_cmd 2013 4839"

DESIGN_FUNCTION_LIST[5001] = "d_cmd 2013 5408"
--武当
DESIGN_FUNCTION_LIST[1101] = "d_cmd 2024 38010"
DESIGN_FUNCTION_LIST[1102] = "d_cmd 2024 38011"
DESIGN_FUNCTION_LIST[1103] = "d_cmd 2024 38012"
DESIGN_FUNCTION_LIST[1104] = "d_cmd 2024 38013"
DESIGN_FUNCTION_LIST[1105] = "d_cmd 2024 38014"
DESIGN_FUNCTION_LIST[1106] = "d_cmd 2024 38015"

DESIGN_FUNCTION_LIST[2101] = "d_cmd 2024 38199"
DESIGN_FUNCTION_LIST[2102] = "d_cmd 2024 38200"
DESIGN_FUNCTION_LIST[2103] = "d_cmd 2024 38201"
DESIGN_FUNCTION_LIST[2104] = "d_cmd 2024 38203"
DESIGN_FUNCTION_LIST[2105] = "d_cmd 2024 38204"
DESIGN_FUNCTION_LIST[2106] = "d_cmd 2024 38205"
DESIGN_FUNCTION_LIST[2107] = "d_cmd 2024 38206"
DESIGN_FUNCTION_LIST[2108] = "d_cmd 2024 38207"
DESIGN_FUNCTION_LIST[2109] = "d_cmd 2024 38211"
DESIGN_FUNCTION_LIST[2110] = "d_cmd 2024 38215"
DESIGN_FUNCTION_LIST[2111] = "d_cmd 2024 38216"
DESIGN_FUNCTION_LIST[2112] = "d_cmd 2024 38217"
DESIGN_FUNCTION_LIST[2113] = "d_cmd 2024 38218"
DESIGN_FUNCTION_LIST[2114] = "d_cmd 2024 38219"
DESIGN_FUNCTION_LIST[2115] = "d_cmd 2024 38220"
DESIGN_FUNCTION_LIST[2116] = "d_cmd 2024 38221"
DESIGN_FUNCTION_LIST[2117] = "d_cmd 2024 38222"

DESIGN_FUNCTION_LIST[3101] = "d_cmd 2013 2657"
DESIGN_FUNCTION_LIST[3102] = "d_cmd 2013 2658"
DESIGN_FUNCTION_LIST[3103] = "d_cmd 2013 2659"
DESIGN_FUNCTION_LIST[3104] = "d_cmd 2013 4323"
DESIGN_FUNCTION_LIST[3105] = "d_cmd 2013 1374"
DESIGN_FUNCTION_LIST[3106] = "d_cmd 2013 2508"
DESIGN_FUNCTION_LIST[3107] = "d_cmd 2013 2674"
DESIGN_FUNCTION_LIST[3108] = "d_cmd 2013 2661"
DESIGN_FUNCTION_LIST[3109] = "d_cmd 2013 2676"
DESIGN_FUNCTION_LIST[3110] = "d_cmd 2013 4488"
DESIGN_FUNCTION_LIST[3111] = "d_cmd 2013 4489"
DESIGN_FUNCTION_LIST[3112] = "d_cmd 2013 4490"
DESIGN_FUNCTION_LIST[3113] = "d_cmd 2013 4491"
DESIGN_FUNCTION_LIST[3114] = "d_cmd 2013 4492"
DESIGN_FUNCTION_LIST[3115] = "d_cmd 2013 4493"
DESIGN_FUNCTION_LIST[3116] = "d_cmd 2013 4494"
DESIGN_FUNCTION_LIST[3117] = "d_cmd 2013 4495"

DESIGN_FUNCTION_LIST[4101] = "d_cmd 2013 4887"
DESIGN_FUNCTION_LIST[4102] = "d_cmd 2013 4888"
DESIGN_FUNCTION_LIST[4103] = "d_cmd 2013 4889"
DESIGN_FUNCTION_LIST[4104] = "d_cmd 2013 4891"
DESIGN_FUNCTION_LIST[4105] = "d_cmd 2013 4892"
DESIGN_FUNCTION_LIST[4106] = "d_cmd 2013 4893"

DESIGN_FUNCTION_LIST[5101] = "d_cmd 2013 5409"
--华山
DESIGN_FUNCTION_LIST[1201] = "d_cmd 2024 38016"
DESIGN_FUNCTION_LIST[1202] = "d_cmd 2024 38017"
DESIGN_FUNCTION_LIST[1203] = "d_cmd 2024 38018"
DESIGN_FUNCTION_LIST[1204] = "d_cmd 2024 38019"
DESIGN_FUNCTION_LIST[1205] = "d_cmd 2024 38020"
DESIGN_FUNCTION_LIST[1206] = "d_cmd 2024 38021"

DESIGN_FUNCTION_LIST[2201] = "d_cmd 2024 38223"
DESIGN_FUNCTION_LIST[2202] = "d_cmd 2024 38224"
DESIGN_FUNCTION_LIST[2203] = "d_cmd 2024 38227"
DESIGN_FUNCTION_LIST[2204] = "d_cmd 2024 38228"
DESIGN_FUNCTION_LIST[2205] = "d_cmd 2024 38229"
DESIGN_FUNCTION_LIST[2206] = "d_cmd 2024 38230"
DESIGN_FUNCTION_LIST[2207] = "d_cmd 2024 38231"
DESIGN_FUNCTION_LIST[2208] = "d_cmd 2024 38232"
DESIGN_FUNCTION_LIST[2209] = "d_cmd 2024 38233"
DESIGN_FUNCTION_LIST[2210] = "d_cmd 2024 38235"
DESIGN_FUNCTION_LIST[2211] = "d_cmd 2024 38239"
DESIGN_FUNCTION_LIST[2212] = "d_cmd 2024 38240"
DESIGN_FUNCTION_LIST[2213] = "d_cmd 2024 38241"
DESIGN_FUNCTION_LIST[2214] = "d_cmd 2024 38242"
DESIGN_FUNCTION_LIST[2215] = "d_cmd 2024 38243"
DESIGN_FUNCTION_LIST[2216] = "d_cmd 2024 38244"

DESIGN_FUNCTION_LIST[3201] = "d_cmd 2013 2049"
DESIGN_FUNCTION_LIST[3202] = "d_cmd 2013 3703"
DESIGN_FUNCTION_LIST[3203] = "d_cmd 2013 3665"
DESIGN_FUNCTION_LIST[3204] = "d_cmd 2013 3601"
DESIGN_FUNCTION_LIST[3205] = "d_cmd 2013 3625"
DESIGN_FUNCTION_LIST[3206] = "d_cmd 2013 3603"
DESIGN_FUNCTION_LIST[3207] = "d_cmd 2013 4483"
DESIGN_FUNCTION_LIST[3208] = "d_cmd 2013 4484"
DESIGN_FUNCTION_LIST[3209] = "d_cmd 2013 850"
DESIGN_FUNCTION_LIST[3210] = "d_cmd 2013 2732"
DESIGN_FUNCTION_LIST[3211] = "d_cmd 2013 845"
DESIGN_FUNCTION_LIST[3212] = "d_cmd 2013 3666"
DESIGN_FUNCTION_LIST[3213] = "d_cmd 2013 4486"
DESIGN_FUNCTION_LIST[3214] = "d_cmd 2013 836"
DESIGN_FUNCTION_LIST[3215] = "d_cmd 2013 4487"
DESIGN_FUNCTION_LIST[3216] = "d_cmd 2013 2046"

DESIGN_FUNCTION_LIST[4201] = "d_cmd 2013 1152"
DESIGN_FUNCTION_LIST[4202] = "d_cmd 2013 3602"
DESIGN_FUNCTION_LIST[4203] = "d_cmd 2013 834"
DESIGN_FUNCTION_LIST[4204] = "d_cmd 2013 838"
DESIGN_FUNCTION_LIST[4205] = "d_cmd 2013 852"

DESIGN_FUNCTION_LIST[5201] = "d_cmd 2013 5410"
--恒山
DESIGN_FUNCTION_LIST[1301] = "d_cmd 2024 38022"
DESIGN_FUNCTION_LIST[1302] = "d_cmd 2024 38023"
DESIGN_FUNCTION_LIST[1303] = "d_cmd 2024 38024"
DESIGN_FUNCTION_LIST[1304] = "d_cmd 2024 38025"
DESIGN_FUNCTION_LIST[1305] = "d_cmd 2024 38026"
DESIGN_FUNCTION_LIST[1306] = "d_cmd 2024 38027"

DESIGN_FUNCTION_LIST[2301] = "d_cmd 2024 38247"
DESIGN_FUNCTION_LIST[2302] = "d_cmd 2024 38248"
DESIGN_FUNCTION_LIST[2303] = "d_cmd 2024 38249"
DESIGN_FUNCTION_LIST[2304] = "d_cmd 2024 38251"
DESIGN_FUNCTION_LIST[2305] = "d_cmd 2024 38252"
DESIGN_FUNCTION_LIST[2306] = "d_cmd 2024 38253"
DESIGN_FUNCTION_LIST[2307] = "d_cmd 2024 38254"
DESIGN_FUNCTION_LIST[2308] = "d_cmd 2024 38255"
DESIGN_FUNCTION_LIST[2309] = "d_cmd 2024 38259"
DESIGN_FUNCTION_LIST[2310] = "d_cmd 2024 38260"
DESIGN_FUNCTION_LIST[2311] = "d_cmd 2024 38261"
DESIGN_FUNCTION_LIST[2312] = "d_cmd 2024 38263"
DESIGN_FUNCTION_LIST[2313] = "d_cmd 2024 38264"
DESIGN_FUNCTION_LIST[2314] = "d_cmd 2024 38265"
DESIGN_FUNCTION_LIST[2315] = "d_cmd 2024 38266"
DESIGN_FUNCTION_LIST[2316] = "d_cmd 2024 38267"

DESIGN_FUNCTION_LIST[4301] = "d_cmd 2013 4681"
DESIGN_FUNCTION_LIST[4302] = "d_cmd 2013 4682"
DESIGN_FUNCTION_LIST[4303] = "d_cmd 2013 4683"
DESIGN_FUNCTION_LIST[4304] = "d_cmd 2013 4684"
DESIGN_FUNCTION_LIST[4305] = "d_cmd 2013 4686"
DESIGN_FUNCTION_LIST[4306] = "d_cmd 2013 4687"
DESIGN_FUNCTION_LIST[4307] = "d_cmd 2013 4689"
DESIGN_FUNCTION_LIST[4308] = "d_cmd 2013 4690"
DESIGN_FUNCTION_LIST[4309] = "d_cmd 2013 4691"

DESIGN_FUNCTION_LIST[5301] = "d_cmd 2013 5411"
--衡山
DESIGN_FUNCTION_LIST[1401] = "d_cmd 2024 38028"
DESIGN_FUNCTION_LIST[1402] = "d_cmd 2024 38029"
DESIGN_FUNCTION_LIST[1403] = "d_cmd 2024 38030"
DESIGN_FUNCTION_LIST[1404] = "d_cmd 2024 38031"
DESIGN_FUNCTION_LIST[1405] = "d_cmd 2024 38032"
DESIGN_FUNCTION_LIST[1406] = "d_cmd 2024 38033"

DESIGN_FUNCTION_LIST[2401] = "d_cmd 2024 38271"
DESIGN_FUNCTION_LIST[2402] = "d_cmd 2024 38275"
DESIGN_FUNCTION_LIST[2403] = "d_cmd 2024 38276"
DESIGN_FUNCTION_LIST[2404] = "d_cmd 2024 38277"
DESIGN_FUNCTION_LIST[2405] = "d_cmd 2024 38278"
DESIGN_FUNCTION_LIST[2406] = "d_cmd 2024 38279"
DESIGN_FUNCTION_LIST[2407] = "d_cmd 2024 38280"
DESIGN_FUNCTION_LIST[2408] = "d_cmd 2024 38283"
DESIGN_FUNCTION_LIST[2409] = "d_cmd 2024 38287"
DESIGN_FUNCTION_LIST[2410] = "d_cmd 2024 38288"
DESIGN_FUNCTION_LIST[2411] = "d_cmd 2024 38289"
DESIGN_FUNCTION_LIST[2412] = "d_cmd 2024 38290"
DESIGN_FUNCTION_LIST[2413] = "d_cmd 2024 38291"

DESIGN_FUNCTION_LIST[4401] = "d_cmd 2013 4711"
DESIGN_FUNCTION_LIST[4402] = "d_cmd 2013 4712"
DESIGN_FUNCTION_LIST[4403] = "d_cmd 2013 4713"
DESIGN_FUNCTION_LIST[4404] = "d_cmd 2013 4714"
DESIGN_FUNCTION_LIST[4405] = "d_cmd 2013 4715"
DESIGN_FUNCTION_LIST[4406] = "d_cmd 2013 4716"
DESIGN_FUNCTION_LIST[4407] = "d_cmd 2013 4717"
DESIGN_FUNCTION_LIST[4408] = "d_cmd 2013 4718"
DESIGN_FUNCTION_LIST[4409] = "d_cmd 2013 4719"
DESIGN_FUNCTION_LIST[4410] = "d_cmd 2013 4720"

DESIGN_FUNCTION_LIST[5401] = "d_cmd 2013 5412"
--日月
DESIGN_FUNCTION_LIST[1501] = "d_cmd 2024 38034"
DESIGN_FUNCTION_LIST[1502] = "d_cmd 2024 38035"
DESIGN_FUNCTION_LIST[1503] = "d_cmd 2024 38036"
DESIGN_FUNCTION_LIST[1504] = "d_cmd 2024 38037"
DESIGN_FUNCTION_LIST[1505] = "d_cmd 2024 38038"
DESIGN_FUNCTION_LIST[1506] = "d_cmd 2024 38039"

DESIGN_FUNCTION_LIST[2501] = "d_cmd 2024 38295"
DESIGN_FUNCTION_LIST[2502] = "d_cmd 2024 38296"
DESIGN_FUNCTION_LIST[2503] = "d_cmd 2024 38299"
DESIGN_FUNCTION_LIST[2504] = "d_cmd 2024 38300"
DESIGN_FUNCTION_LIST[2505] = "d_cmd 2024 38301"
DESIGN_FUNCTION_LIST[2506] = "d_cmd 2024 38302"
DESIGN_FUNCTION_LIST[2507] = "d_cmd 2024 38303"
DESIGN_FUNCTION_LIST[2508] = "d_cmd 2024 38304"
DESIGN_FUNCTION_LIST[2509] = "d_cmd 2024 38307"
DESIGN_FUNCTION_LIST[2510] = "d_cmd 2024 38311"
DESIGN_FUNCTION_LIST[2511] = "d_cmd 2024 38312"
DESIGN_FUNCTION_LIST[2512] = "d_cmd 2024 38313"
DESIGN_FUNCTION_LIST[2513] = "d_cmd 2024 38314"
DESIGN_FUNCTION_LIST[2514] = "d_cmd 2024 38315"
DESIGN_FUNCTION_LIST[2515] = "d_cmd 2024 38316"
DESIGN_FUNCTION_LIST[2516] = "d_cmd 2024 38317"

DESIGN_FUNCTION_LIST[3501] = "d_cmd 2013 1056"
DESIGN_FUNCTION_LIST[3502] = "d_cmd 2013 4085"
DESIGN_FUNCTION_LIST[3503] = "d_cmd 2013 1048"
DESIGN_FUNCTION_LIST[3504] = "d_cmd 2013 4148"
DESIGN_FUNCTION_LIST[3505] = "d_cmd 2013 4509"
DESIGN_FUNCTION_LIST[3506] = "d_cmd 2013 4510"
DESIGN_FUNCTION_LIST[3507] = "d_cmd 2013 4511"
DESIGN_FUNCTION_LIST[3508] = "d_cmd 2013 4512"
DESIGN_FUNCTION_LIST[3509] = "d_cmd 2013 2936"
DESIGN_FUNCTION_LIST[3510] = "d_cmd 2013 2988"
DESIGN_FUNCTION_LIST[3511] = "d_cmd 2013 2989"
DESIGN_FUNCTION_LIST[3512] = "d_cmd 2013 4071"
DESIGN_FUNCTION_LIST[3513] = "d_cmd 2013 4506"
DESIGN_FUNCTION_LIST[3514] = "d_cmd 2013 4505"
DESIGN_FUNCTION_LIST[3515] = "d_cmd 2013 4507"
DESIGN_FUNCTION_LIST[3516] = "d_cmd 2013 4508"

DESIGN_FUNCTION_LIST[4501] = "d_cmd 2013 3030"
DESIGN_FUNCTION_LIST[4502] = "d_cmd 2013 4899"
DESIGN_FUNCTION_LIST[4503] = "d_cmd 2013 4900"
DESIGN_FUNCTION_LIST[4504] = "d_cmd 2013 4901"
DESIGN_FUNCTION_LIST[4505] = "d_cmd 2013 4902"
DESIGN_FUNCTION_LIST[4506] = "d_cmd 2013 4903"
DESIGN_FUNCTION_LIST[4507] = "d_cmd 2013 4904"
DESIGN_FUNCTION_LIST[4508] = "d_cmd 2013 4905"
DESIGN_FUNCTION_LIST[4509] = "d_cmd 2013 4906"

DESIGN_FUNCTION_LIST[5501] = "d_cmd 2013 5413"
--五仙
DESIGN_FUNCTION_LIST[1601] = "d_cmd 2024 38040"
DESIGN_FUNCTION_LIST[1602] = "d_cmd 2024 38041"
DESIGN_FUNCTION_LIST[1603] = "d_cmd 2024 38042"
DESIGN_FUNCTION_LIST[1604] = "d_cmd 2024 38043"
DESIGN_FUNCTION_LIST[1605] = "d_cmd 2024 38044"
DESIGN_FUNCTION_LIST[1606] = "d_cmd 2024 38045"

DESIGN_FUNCTION_LIST[2601] = "d_cmd 2024 38319"
DESIGN_FUNCTION_LIST[2602] = "d_cmd 2024 38323"
DESIGN_FUNCTION_LIST[2603] = "d_cmd 2024 38324"
DESIGN_FUNCTION_LIST[2604] = "d_cmd 2024 38325"
DESIGN_FUNCTION_LIST[2605] = "d_cmd 2024 38326"
DESIGN_FUNCTION_LIST[2606] = "d_cmd 2024 38327"
DESIGN_FUNCTION_LIST[2607] = "d_cmd 2024 38328"
DESIGN_FUNCTION_LIST[2608] = "d_cmd 2024 38331"
DESIGN_FUNCTION_LIST[2609] = "d_cmd 2024 38335"
DESIGN_FUNCTION_LIST[2610] = "d_cmd 2024 38336"
DESIGN_FUNCTION_LIST[2611] = "d_cmd 2024 38337"
DESIGN_FUNCTION_LIST[2612] = "d_cmd 2024 38338"
DESIGN_FUNCTION_LIST[2613] = "d_cmd 2024 38339"
DESIGN_FUNCTION_LIST[2614] = "d_cmd 2024 38340"

DESIGN_FUNCTION_LIST[4601] = "d_cmd 2013 4749"
DESIGN_FUNCTION_LIST[4602] = "d_cmd 2013 4750"
DESIGN_FUNCTION_LIST[4603] = "d_cmd 2013 4751"
DESIGN_FUNCTION_LIST[4604] = "d_cmd 2013 4752"
DESIGN_FUNCTION_LIST[4605] = "d_cmd 2013 4753"
DESIGN_FUNCTION_LIST[4606] = "d_cmd 2013 4754"
DESIGN_FUNCTION_LIST[4607] = "d_cmd 2013 4755"
DESIGN_FUNCTION_LIST[4608] = "d_cmd 2013 4756"
DESIGN_FUNCTION_LIST[4609] = "d_cmd 2013 4757"
DESIGN_FUNCTION_LIST[4610] = "d_cmd 2013 4758"
DESIGN_FUNCTION_LIST[4611] = "d_cmd 2013 4759"
DESIGN_FUNCTION_LIST[4612] = "d_cmd 2013 4760"
DESIGN_FUNCTION_LIST[4613] = "d_cmd 2013 4761"
DESIGN_FUNCTION_LIST[4614] = "d_cmd 2013 4762"
DESIGN_FUNCTION_LIST[4615] = "d_cmd 2013 4763"
DESIGN_FUNCTION_LIST[4616] = "d_cmd 2013 4764"

DESIGN_FUNCTION_LIST[5601] = "d_cmd 2013 5414"
--逍遥
DESIGN_FUNCTION_LIST[1701] = "d_cmd 2024 38046"
DESIGN_FUNCTION_LIST[1702] = "d_cmd 2024 38047"
DESIGN_FUNCTION_LIST[1703] = "d_cmd 2024 38048"
DESIGN_FUNCTION_LIST[1704] = "d_cmd 2024 38049"
DESIGN_FUNCTION_LIST[1705] = "d_cmd 2024 38050"
DESIGN_FUNCTION_LIST[1706] = "d_cmd 2024 38051"

DESIGN_FUNCTION_LIST[2701] = "d_cmd 2024 38343"
DESIGN_FUNCTION_LIST[2702] = "d_cmd 2024 38347"
DESIGN_FUNCTION_LIST[2703] = "d_cmd 2024 38348"
DESIGN_FUNCTION_LIST[2704] = "d_cmd 2024 38349"
DESIGN_FUNCTION_LIST[2705] = "d_cmd 2024 38350"
DESIGN_FUNCTION_LIST[2706] = "d_cmd 2024 38351"
DESIGN_FUNCTION_LIST[2707] = "d_cmd 2024 38352"
DESIGN_FUNCTION_LIST[2708] = "d_cmd 2024 38355"
DESIGN_FUNCTION_LIST[2709] = "d_cmd 2024 38356"
DESIGN_FUNCTION_LIST[2710] = "d_cmd 2024 38359"
DESIGN_FUNCTION_LIST[2711] = "d_cmd 2024 38360"
DESIGN_FUNCTION_LIST[2712] = "d_cmd 2024 38361"
DESIGN_FUNCTION_LIST[2713] = "d_cmd 2024 38362"
DESIGN_FUNCTION_LIST[2714] = "d_cmd 2024 38363"
DESIGN_FUNCTION_LIST[2715] = "d_cmd 2024 38364"

DESIGN_FUNCTION_LIST[4701] = "d_cmd 2013 4778"
DESIGN_FUNCTION_LIST[4702] = "d_cmd 2013 4779"
DESIGN_FUNCTION_LIST[4703] = "d_cmd 2013 4780"
DESIGN_FUNCTION_LIST[4704] = "d_cmd 2013 4781"
DESIGN_FUNCTION_LIST[4705] = "d_cmd 2013 4782"
DESIGN_FUNCTION_LIST[4706] = "d_cmd 2013 4783"
DESIGN_FUNCTION_LIST[4707] = "d_cmd 2013 4784"

DESIGN_FUNCTION_LIST[5701] = "d_cmd 2013 5415"
--唐门
DESIGN_FUNCTION_LIST[1801] = "d_cmd 2024 38052"
DESIGN_FUNCTION_LIST[1802] = "d_cmd 2024 38053"
DESIGN_FUNCTION_LIST[1803] = "d_cmd 2024 38054"
DESIGN_FUNCTION_LIST[1804] = "d_cmd 2024 38055"
DESIGN_FUNCTION_LIST[1805] = "d_cmd 2024 38056"
DESIGN_FUNCTION_LIST[1806] = "d_cmd 2024 38057"

DESIGN_FUNCTION_LIST[2801] = "d_cmd 2024 38367"
DESIGN_FUNCTION_LIST[2802] = "d_cmd 2024 38371"
DESIGN_FUNCTION_LIST[2803] = "d_cmd 2024 38372"
DESIGN_FUNCTION_LIST[2804] = "d_cmd 2024 38373"
DESIGN_FUNCTION_LIST[2805] = "d_cmd 2024 38374"
DESIGN_FUNCTION_LIST[2806] = "d_cmd 2024 38375"
DESIGN_FUNCTION_LIST[2807] = "d_cmd 2024 38376"
DESIGN_FUNCTION_LIST[2808] = "d_cmd 2024 38379"
DESIGN_FUNCTION_LIST[2809] = "d_cmd 2024 38383"
DESIGN_FUNCTION_LIST[2810] = "d_cmd 2024 38384"
DESIGN_FUNCTION_LIST[2811] = "d_cmd 2024 38385"
DESIGN_FUNCTION_LIST[2812] = "d_cmd 2024 38386"
DESIGN_FUNCTION_LIST[2813] = "d_cmd 2024 38387"
DESIGN_FUNCTION_LIST[2814] = "d_cmd 2024 38388"
DESIGN_FUNCTION_LIST[2815] = "d_cmd 2024 38389"
DESIGN_FUNCTION_LIST[2816] = "d_cmd 2024 38390"

DESIGN_FUNCTION_LIST[3801] = "d_cmd 2013 2620"
DESIGN_FUNCTION_LIST[3802] = "d_cmd 2013 921"
DESIGN_FUNCTION_LIST[3803] = "d_cmd 2013 2617"
DESIGN_FUNCTION_LIST[3804] = "d_cmd 2013 2827"
DESIGN_FUNCTION_LIST[3805] = "d_cmd 2013 4498"
DESIGN_FUNCTION_LIST[3806] = "d_cmd 2013 4499"
DESIGN_FUNCTION_LIST[3807] = "d_cmd 2013 4497"
DESIGN_FUNCTION_LIST[3808] = "d_cmd 2013 4503"
DESIGN_FUNCTION_LIST[3809] = "d_cmd 2013 926"
DESIGN_FUNCTION_LIST[3810] = "d_cmd 2013 2624"
DESIGN_FUNCTION_LIST[3811] = "d_cmd 2013 2627"
DESIGN_FUNCTION_LIST[3812] = "d_cmd 2013 2630"
DESIGN_FUNCTION_LIST[3813] = "d_cmd 2013 4501"
DESIGN_FUNCTION_LIST[3814] = "d_cmd 2013 4502"
DESIGN_FUNCTION_LIST[3815] = "d_cmd 2013 4500"
DESIGN_FUNCTION_LIST[3816] = "d_cmd 2013 4504"

DESIGN_FUNCTION_LIST[5801] = "d_cmd 2013 5416"
--峨嵋
DESIGN_FUNCTION_LIST[1901] = "d_cmd 2024 38058"
DESIGN_FUNCTION_LIST[1902] = "d_cmd 2024 38059"
DESIGN_FUNCTION_LIST[1903] = "d_cmd 2024 38060"
DESIGN_FUNCTION_LIST[1904] = "d_cmd 2024 38061"
DESIGN_FUNCTION_LIST[1905] = "d_cmd 2024 38062"
DESIGN_FUNCTION_LIST[1906] = "d_cmd 2024 38063"

DESIGN_FUNCTION_LIST[2901] = "d_cmd 2024 38391"
DESIGN_FUNCTION_LIST[2902] = "d_cmd 2024 38392"
DESIGN_FUNCTION_LIST[2903] = "d_cmd 2024 38393"
DESIGN_FUNCTION_LIST[2904] = "d_cmd 2024 38395"
DESIGN_FUNCTION_LIST[2905] = "d_cmd 2024 38396"
DESIGN_FUNCTION_LIST[2906] = "d_cmd 2024 38397"
DESIGN_FUNCTION_LIST[2907] = "d_cmd 2024 38398"
DESIGN_FUNCTION_LIST[2908] = "d_cmd 2024 38399"
DESIGN_FUNCTION_LIST[2909] = "d_cmd 2024 38403"
DESIGN_FUNCTION_LIST[2910] = "d_cmd 2024 38407"
DESIGN_FUNCTION_LIST[2911] = "d_cmd 2024 38408"
DESIGN_FUNCTION_LIST[2912] = "d_cmd 2024 38409"
DESIGN_FUNCTION_LIST[2913] = "d_cmd 2024 38410"
DESIGN_FUNCTION_LIST[2914] = "d_cmd 2024 38411"
DESIGN_FUNCTION_LIST[2915] = "d_cmd 2024 38412"
DESIGN_FUNCTION_LIST[2916] = "d_cmd 2024 38413"

DESIGN_FUNCTION_LIST[4901] = "d_cmd 2013 4669"
DESIGN_FUNCTION_LIST[4902] = "d_cmd 2013 4671"
DESIGN_FUNCTION_LIST[4903] = "d_cmd 2013 4673"
DESIGN_FUNCTION_LIST[4904] = "d_cmd 2013 4674"
DESIGN_FUNCTION_LIST[4905] = "d_cmd 2013 4675"

DESIGN_FUNCTION_LIST[5901] = "d_cmd 2013 5417"
------------------------------------------------------

-------------------百科全书字典配置--------------------
--------------DesignCyclopaedia Confs---------------
--常用	11	测试	单位	21	APC	物品	31	药品
--	12	BUFF		22	怪物		32	材料
--	13	……		23	NPC		33	……



--	14	……		24	宠物		34	……



--	15	……		25	……		35	……



------------------------------------------------------
--名门	41	少林	名派	51	日月	服饰	61	男性



--	42	武当		52	五仙		62	女性



--	43	华山		53	遥逍		63	饰品
--	44	恒山		54	唐门		64	变形
--	45	衡山		55	峨眉		65	GM装



------------------------------------------------------
--	72	头部		82	头部		92	头部
--	72	上装		82	上装		92	上装
--	73	下装		83	下装		93	下装
--	74	腕部		84	腕部		94	腕部
--	75	脚部		85	脚部		95	脚部
------------------------------------------------------
--词条列表分类
CYCLOPAEDIA_CATEGORY = {}
CYCLOPAEDIA_CATEGORY[1] = {text = "常用", hint = "常"}
CYCLOPAEDIA_CATEGORY[2] = {text = "单位", hint = "单"}
CYCLOPAEDIA_CATEGORY[3] = {text = "物品", hint = "物"}
CYCLOPAEDIA_CATEGORY[4] = {text = "名门", hint = "门"}
CYCLOPAEDIA_CATEGORY[5] = {text = "名派", hint = "派"}
CYCLOPAEDIA_CATEGORY[6] = {text = "服饰", hint = "服"}
CYCLOPAEDIA_CATEGORY[7] = {text = "袍衫", hint = "布"}
CYCLOPAEDIA_CATEGORY[8] = {text = "布甲", hint = "绵"}
CYCLOPAEDIA_CATEGORY[9] = {text = "皮衣", hint = "皮"}
CYCLOPAEDIA_CLASS = {}
CYCLOPAEDIA_CLASS[1] = {category = 1 , class = 11 , text = "测试", hint = "测" }
CYCLOPAEDIA_CLASS[2] = {category = 1 , class = 12 , text = "BUFF", hint = "态" }
CYCLOPAEDIA_CLASS[3] = {category = 1 , class = 13 , text = "……", hint = "…" }
CYCLOPAEDIA_CLASS[4] = {category = 1 , class = 14 , text = "……", hint = "…" }
CYCLOPAEDIA_CLASS[5] = {category = 1 , class = 15 , text = "……", hint = "…" }
CYCLOPAEDIA_CLASS[6] = {category = 2 , class = 21 , text = "APC", hint = "AP" }
CYCLOPAEDIA_CLASS[7] = {category = 2 , class = 22 , text = "怪物", hint = "怪" }
CYCLOPAEDIA_CLASS[8] = {category = 2 , class = 23 , text = "NPC", hint = "NP" }
CYCLOPAEDIA_CLASS[9] = {category = 2 , class = 24 , text = "宠物", hint = "宠" }
CYCLOPAEDIA_CLASS[10] = {category = 2 , class = 25 , text = "……", hint = "…" }
CYCLOPAEDIA_CLASS[11] = {category = 3 , class = 31 , text = "药品", hint = "常" }
CYCLOPAEDIA_CLASS[12] = {category = 3 , class = 32 , text = "材料", hint = "常" }
CYCLOPAEDIA_CLASS[13] = {category = 3 , class = 33 , text = "……", hint = "…" }
CYCLOPAEDIA_CLASS[14] = {category = 3 , class = 34 , text = "……", hint = "…" }
CYCLOPAEDIA_CLASS[15] = {category = 3 , class = 35 , text = "……", hint = "…" }
CYCLOPAEDIA_CLASS[16] = {category = 4 , class = 41 , text = "少林", hint = "少" }
CYCLOPAEDIA_CLASS[17] = {category = 4 , class = 42 , text = "武当", hint = "武" }
CYCLOPAEDIA_CLASS[18] = {category = 4 , class = 43 , text = "华山", hint = "华" }
CYCLOPAEDIA_CLASS[19] = {category = 4 , class = 44 , text = "恒山", hint = "恒" }
CYCLOPAEDIA_CLASS[20] = {category = 4 , class = 45 , text = "衡山", hint = "衡" }
CYCLOPAEDIA_CLASS[21] = {category = 5 , class = 51 , text = "日月", hint = "明" }
CYCLOPAEDIA_CLASS[22] = {category = 5 , class = 52 , text = "五仙", hint = "毒" }
CYCLOPAEDIA_CLASS[23] = {category = 5 , class = 53 , text = "逍遥", hint = "逍" }
CYCLOPAEDIA_CLASS[24] = {category = 5 , class = 54 , text = "唐门", hint = "唐" }
CYCLOPAEDIA_CLASS[25] = {category = 5 , class = 55 , text = "峨眉", hint = "嵋" }
CYCLOPAEDIA_CLASS[26] = {category = 6 , class = 61 , text = "男性", hint = "男" }
CYCLOPAEDIA_CLASS[27] = {category = 6 , class = 62 , text = "女性", hint = "女" }
CYCLOPAEDIA_CLASS[28] = {category = 6 , class = 63 , text = "饰品", hint = "饰" }
CYCLOPAEDIA_CLASS[29] = {category = 6 , class = 64 , text = "变形", hint = "变" }
CYCLOPAEDIA_CLASS[30] = {category = 6 , class = 65 , text = "GM装", hint = "GM" }
CYCLOPAEDIA_CLASS[31] = {category = 7 , class = 71 , text = "头部", hint = "头" }
CYCLOPAEDIA_CLASS[32] = {category = 7 , class = 72 , text = "上装", hint = "上" }
CYCLOPAEDIA_CLASS[33] = {category = 7 , class = 73 , text = "下装", hint = "下" }
CYCLOPAEDIA_CLASS[34] = {category = 7 , class = 74 , text = "腕部", hint = "腕" }
CYCLOPAEDIA_CLASS[35] = {category = 7 , class = 75 , text = "脚部", hint = "足" }
CYCLOPAEDIA_CLASS[36] = {category = 8 , class = 81 , text = "头部", hint = "头" }
CYCLOPAEDIA_CLASS[37] = {category = 8 , class = 82 , text = "上装", hint = "上" }
CYCLOPAEDIA_CLASS[38] = {category = 8 , class = 83 , text = "下装", hint = "下" }
CYCLOPAEDIA_CLASS[39] = {category = 8 , class = 84 , text = "腕部", hint = "腕" }
CYCLOPAEDIA_CLASS[40] = {category = 8 , class = 85 , text = "脚部", hint = "足" }
CYCLOPAEDIA_CLASS[41] = {category = 9 , class = 91 , text = "头部", hint = "头" }
CYCLOPAEDIA_CLASS[42] = {category = 9 , class = 92 , text = "上装", hint = "上" }
CYCLOPAEDIA_CLASS[43] = {category = 9 , class = 93 , text = "下装", hint = "下" }
CYCLOPAEDIA_CLASS[44] = {category = 9 , class = 94 , text = "腕部", hint = "腕" }
CYCLOPAEDIA_CLASS[45] = {category = 9 , class = 95 , text = "脚部", hint = "足" }
CYCLOPAEDIA_CLASSOP = {} -- type list ,just opposite to above
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
--词条列表 Term List
CYCLOPAEDIA_DICT = {}
--标准格式 Common Style
CYCLOPAEDIA_DICT[1] = {keyword = "^FDEE01查询说明" , class = 11 , content = "^fedc40查询说明\r\r^ffffff　　本工具可用于查询游戏中大部分的模板，输入关键字查找或点“显示全部”即可列出内容，如果内容过多，可以通过右上的“设置”调整搜索过范围。\r\r　　如果某项查询某项时发现“执行”按钮有效，可以点击执行，从而生成物品、怪物、宠物等。"}
CYCLOPAEDIA_DICT[2] = {keyword = "^D7C4A2广播道具" , class = 11 , content = "^fedc40千里传音100个", command = "d_cmd 2001 1032 100"}
CYCLOPAEDIA_DICT[3] = {keyword = "^D7C4A2大回血药" , class = 11 , content = "^fedc40大回血药100个", command = "d_cmd 2001 3619 100"}
CYCLOPAEDIA_DICT[4] = {keyword = "^D7C4A2大回蓝药" , class = 11 , content = "^fedc40大回蓝药100个", command = "d_cmd 2001 5217 100"}
CYCLOPAEDIA_DICT[5] = {keyword = "^D7C4A2小怒气药" , class = 11 , content = "^fedc40小怒气药100个，+10怒气", command = "d_cmd 2001 19064 100"}
CYCLOPAEDIA_DICT[6] = {keyword = "^D7C4A2中怒气药" , class = 11 , content = "^fedc40中怒气药100个，+50怒气", command = "d_cmd 2001 19065 100"}
CYCLOPAEDIA_DICT[7] = {keyword = "^D7C4A2大怒气药" , class = 11 , content = "^fedc40大怒气药100个，+200怒气", command = "d_cmd 2001 19066 100"}
CYCLOPAEDIA_DICT[8] = {keyword = "^D7C4A2体力药" , class = 11 , content = "^fedc40体力药100个", command = "d_cmd 2001 28927 100"}
CYCLOPAEDIA_DICT[9] = {keyword = "^D7C4A21级宠物经验药" , class = 11 , content = "^fedc401级宠物经验药", command = "d_cmd 2001 7139 1"}
CYCLOPAEDIA_DICT[10] = {keyword = "^D7C4A220级宠物经验药" , class = 11 , content = "^fedc4020级宠物经验药", command = "d_cmd 2001 7140 1"}
CYCLOPAEDIA_DICT[11] = {keyword = "^D7C4A240级宠物经验药" , class = 11 , content = "^fedc4040级宠物经验药", command = "d_cmd 2001 7141 1"}
CYCLOPAEDIA_DICT[12] = {keyword = "^D7C4A21万内功伤害物品" , class = 11 , content = "^fedc40对自身周围目标造成1万点内功伤害", command = "d_cmd 2001 16890 100"}
CYCLOPAEDIA_DICT[13] = {keyword = "^D7C4A21万外功伤害物品" , class = 11 , content = "^fedc40对自身周围目标造成1万点外功伤害", command = "d_cmd 2001 16893 100"}
CYCLOPAEDIA_DICT[14] = {keyword = "^D7C4A210万内功伤害物品" , class = 11 , content = "^fedc40对自身周围目标造成10万点内功伤害", command = "d_cmd 2001 16894 100"}
CYCLOPAEDIA_DICT[15] = {keyword = "^D7C4A210万外功伤害物品" , class = 11 , content = "^fedc40对自身周围目标造成10万点外功伤害", command = "d_cmd 2001 16895 100"}
CYCLOPAEDIA_DICT[16] = {keyword = "^D7C4A2100万内功伤害物品" , class = 11 , content = "^fedc40对自身周围目标造成100万点内功伤害", command = "d_cmd 2001 16896 100"}
CYCLOPAEDIA_DICT[17] = {keyword = "^D7C4A2100万外功伤害物品" , class = 11 , content = "^fedc40对自身周围目标造成100万点外功伤害", command = "d_cmd 2001 16897 100"}
CYCLOPAEDIA_DICT[18] = {keyword = "^D7C4A2副本复活币" , class = 11 , content = "^ffd0d0在清版副本内复活所需的道具", command = "d_cmd 2001 44374 100"}
CYCLOPAEDIA_DICT[19] = {keyword = "^D7C4A2末世预兆" , class = 11 , content = "^ffd0d0任务前置物品999个", command = "d_cmd 2001 6176 999"}
CYCLOPAEDIA_DICT[20] = {keyword = "^D7C4A2探索大部分地图用道具" , class = 11 , content = "^d0d0ff探索大部分地图用道具", command = "d_cmd 2001 4218"}
CYCLOPAEDIA_DICT[21] = {keyword = "装备加工功能全开物品" , class = 11 , content = "装备加工功能全开物品", command = "d_cmd 2001 16727"}
CYCLOPAEDIA_DICT[22] = {keyword = "^D7C4A2任务大马" , class = 11 , content = "任务大马", command = "d_cmd 2001 21865"}
CYCLOPAEDIA_DICT[23] = {keyword = "^D7C4A2扩60格的大包" , class = 11 , content = "60格的大包", command = "d_cmd 2001 10456"}
CYCLOPAEDIA_DICT[24] = {keyword = "^D7C4A2100个低级飞行旗" , class = 11 , content = "100个低级飞行旗", command = "d_cmd 2001 22792 100"}
CYCLOPAEDIA_DICT[25] = {keyword = "^D7C4A2100个高级飞行旗" , class = 11 , content = "100个高级飞行旗", command = "d_cmd 2001 22793 100"}
CYCLOPAEDIA_DICT[26] = {keyword = "装备打孔物品99个" , class = 11 , content = "装备打孔物品99个", command = "d_cmd 2001 13134 99"}
CYCLOPAEDIA_DICT[27] = {keyword = "解封符99个" , class = 11 , content = "解封符99个", command = "d_cmd 2001 13709 99"}
CYCLOPAEDIA_DICT[28] = {keyword = "开光石99个" , class = 11 , content = "开光石99个", command = "d_cmd 2001 13711 99"}
CYCLOPAEDIA_DICT[29] = {keyword = "强化石99个" , class = 11 , content = "强化石99个", command = "d_cmd 2001 13713 99"}
CYCLOPAEDIA_DICT[30] = {keyword = "取出装备上的1级宝石物品99个" , class = 11 , content = "取出装备上的1级宝石物品99个", command = "d_cmd 2001 13136 99"}
CYCLOPAEDIA_DICT[31] = {keyword = "取出装备上的2级宝石物品99个" , class = 11 , content = "取出装备上的2级宝石物品99个", command = "d_cmd 2001 13137 99"}
CYCLOPAEDIA_DICT[32] = {keyword = "取出装备上的3级宝石物品99个" , class = 11 , content = "取出装备上的3级宝石物品99个", command = "d_cmd 2001 13717 99"}
CYCLOPAEDIA_DICT[33] = {keyword = "取出装备上的4级宝石物品99个" , class = 11 , content = "取出装备上的4级宝石物品99个", command = "d_cmd 2001 13718 99"}
CYCLOPAEDIA_DICT[34] = {keyword = "取出装备上的5级宝石物品99个" , class = 11 , content = "取出装备上的5级宝石物品99个", command = "d_cmd 2001 13719 99"}
CYCLOPAEDIA_DICT[35] = {keyword = "取出装备上的6级宝石物品99个" , class = 11 , content = "取出装备上的6级宝石物品99个", command = "d_cmd 2001 13720 99"}
CYCLOPAEDIA_DICT[36] = {keyword = "取出装备上的7级宝石物品99个" , class = 11 , content = "取出装备上的7级宝石物品99个", command = "d_cmd 2001 13721 99"}
CYCLOPAEDIA_DICT[37] = {keyword = "取出装备上的8级宝石物品99个" , class = 11 , content = "取出装备上的8级宝石物品99个", command = "d_cmd 2001 13722 99"}
CYCLOPAEDIA_DICT[38] = {keyword = "宝石黑玛瑙1级" , class = 11 , content = "宝石黑玛瑙1级", command = "d_cmd 2001 13344"}
CYCLOPAEDIA_DICT[39] = {keyword = "宝石黑玛瑙2级" , class = 11 , content = "宝石黑玛瑙2级", command = "d_cmd 2001 13345"}
CYCLOPAEDIA_DICT[40] = {keyword = "宝石黑玛瑙3级" , class = 11 , content = "宝石黑玛瑙3级", command = "d_cmd 2001 13346"}
CYCLOPAEDIA_DICT[41] = {keyword = "宝石黑玛瑙4级" , class = 11 , content = "宝石黑玛瑙4级", command = "d_cmd 2001 13347"}
CYCLOPAEDIA_DICT[42] = {keyword = "宝石黑玛瑙5级" , class = 11 , content = "宝石黑玛瑙5级", command = "d_cmd 2001 13348"}
CYCLOPAEDIA_DICT[43] = {keyword = "宝石黑玛瑙6级" , class = 11 , content = "宝石黑玛瑙6级", command = "d_cmd 2001 13349"}
CYCLOPAEDIA_DICT[44] = {keyword = "宝石蓝珍珠1级" , class = 11 , content = "宝石蓝珍珠1级", command = "d_cmd 2001 13350"}
CYCLOPAEDIA_DICT[45] = {keyword = "宝石蓝珍珠2级" , class = 11 , content = "宝石蓝珍珠2级", command = "d_cmd 2001 13351"}
CYCLOPAEDIA_DICT[46] = {keyword = "宝石蓝珍珠3级" , class = 11 , content = "宝石蓝珍珠3级", command = "d_cmd 2001 13352"}
CYCLOPAEDIA_DICT[47] = {keyword = "宝石蓝珍珠4级" , class = 11 , content = "宝石蓝珍珠4级", command = "d_cmd 2001 13353"}
CYCLOPAEDIA_DICT[48] = {keyword = "宝石蓝珍珠5级" , class = 11 , content = "宝石蓝珍珠5级", command = "d_cmd 2001 13354"}
CYCLOPAEDIA_DICT[49] = {keyword = "宝石蓝珍珠6级" , class = 11 , content = "宝石蓝珍珠6级", command = "d_cmd 2001 13355"}
CYCLOPAEDIA_DICT[50] = {keyword = "宝石绿松石1级" , class = 11 , content = "宝石绿松石1级", command = "d_cmd 2001 13356"}
CYCLOPAEDIA_DICT[51] = {keyword = "宝石绿松石2级" , class = 11 , content = "宝石绿松石2级", command = "d_cmd 2001 13357"}
CYCLOPAEDIA_DICT[52] = {keyword = "宝石绿松石3级" , class = 11 , content = "宝石绿松石3级", command = "d_cmd 2001 13358"}
CYCLOPAEDIA_DICT[53] = {keyword = "宝石绿松石4级" , class = 11 , content = "宝石绿松石4级", command = "d_cmd 2001 13359"}
CYCLOPAEDIA_DICT[54] = {keyword = "宝石绿松石5级" , class = 11 , content = "宝石绿松石5级", command = "d_cmd 2001 13360"}
CYCLOPAEDIA_DICT[55] = {keyword = "宝石绿松石6级" , class = 11 , content = "宝石绿松石6级", command = "d_cmd 2001 13361"}
CYCLOPAEDIA_DICT[56] = {keyword = "宝石墨翡翠1级" , class = 11 , content = "宝石墨翡翠1级", command = "d_cmd 2001 13362"}
CYCLOPAEDIA_DICT[57] = {keyword = "宝石墨翡翠2级" , class = 11 , content = "宝石墨翡翠2级", command = "d_cmd 2001 13363"}
CYCLOPAEDIA_DICT[58] = {keyword = "宝石墨翡翠3级" , class = 11 , content = "宝石墨翡翠3级", command = "d_cmd 2001 13364"}
CYCLOPAEDIA_DICT[59] = {keyword = "宝石墨翡翠4级" , class = 11 , content = "宝石墨翡翠4级", command = "d_cmd 2001 13365"}
CYCLOPAEDIA_DICT[60] = {keyword = "宝石墨翡翠5级" , class = 11 , content = "宝石墨翡翠5级", command = "d_cmd 2001 13366"}
CYCLOPAEDIA_DICT[61] = {keyword = "宝石墨翡翠6级" , class = 11 , content = "宝石墨翡翠6级", command = "d_cmd 2001 13367"}
CYCLOPAEDIA_DICT[62] = {keyword = "宝石红珊瑚1级" , class = 11 , content = "宝石红珊瑚1级", command = "d_cmd 2001 13368"}
CYCLOPAEDIA_DICT[63] = {keyword = "宝石红珊瑚2级" , class = 11 , content = "宝石红珊瑚2级", command = "d_cmd 2001 13369"}
CYCLOPAEDIA_DICT[64] = {keyword = "宝石红珊瑚3级" , class = 11 , content = "宝石红珊瑚3级", command = "d_cmd 2001 13370"}
CYCLOPAEDIA_DICT[65] = {keyword = "宝石红珊瑚4级" , class = 11 , content = "宝石红珊瑚4级", command = "d_cmd 2001 13371"}
CYCLOPAEDIA_DICT[66] = {keyword = "宝石红珊瑚5级" , class = 11 , content = "宝石红珊瑚5级", command = "d_cmd 2001 13372"}
CYCLOPAEDIA_DICT[67] = {keyword = "宝石红珊瑚6级" , class = 11 , content = "宝石红珊瑚6级", command = "d_cmd 2001 13373"}
CYCLOPAEDIA_DICT[68] = {keyword = "宝石碧波玉1级" , class = 11 , content = "宝石碧波玉1级", command = "d_cmd 2001 13374"}
CYCLOPAEDIA_DICT[69] = {keyword = "宝石碧波玉2级" , class = 11 , content = "宝石碧波玉2级", command = "d_cmd 2001 13375"}
CYCLOPAEDIA_DICT[70] = {keyword = "宝石碧波玉3级" , class = 11 , content = "宝石碧波玉3级", command = "d_cmd 2001 13376"}
CYCLOPAEDIA_DICT[71] = {keyword = "宝石碧波玉4级" , class = 11 , content = "宝石碧波玉4级", command = "d_cmd 2001 13377"}
CYCLOPAEDIA_DICT[72] = {keyword = "宝石碧波玉5级" , class = 11 , content = "宝石碧波玉5级", command = "d_cmd 2001 13378"}
CYCLOPAEDIA_DICT[73] = {keyword = "宝石碧波玉6级" , class = 11 , content = "宝石碧波玉6级", command = "d_cmd 2001 13379"}
CYCLOPAEDIA_DICT[74] = {keyword = "^D7C4A2基础坐骑" , class = 11 , content = "^ffffff测试坐骑", command = "d_cmd 2001 142"}
CYCLOPAEDIA_DICT[75] = {keyword = "^FFFFFF测试无攻击鞭子" , class = 11 , content = "^1d9dff测试无攻击鞭子", command = "d_cmd 2001 3628"}
CYCLOPAEDIA_DICT[76] = {keyword = "^FFFFFF测试无攻击长剑" , class = 11 , content = "^1d9dff测试无攻击长剑", command = "d_cmd 2001 3629"}
CYCLOPAEDIA_DICT[77] = {keyword = "^FFFFFF测试无攻击结棍" , class = 11 , content = "^1d9dff测试无攻击结棍", command = "d_cmd 2001 3630"}
CYCLOPAEDIA_DICT[78] = {keyword = "^FFFFFF测试无攻击琴剑" , class = 11 , content = "^1d9dff测试无攻击琴剑", command = "d_cmd 2001 3631"}
CYCLOPAEDIA_DICT[79] = {keyword = "^FFFFFF测试无攻击法杖" , class = 11 , content = "^1d9dff测试无攻击法杖", command = "d_cmd 2001 3632"}
CYCLOPAEDIA_DICT[80] = {keyword = "^FFFFFF测试无攻击拳刃" , class = 11 , content = "^1d9dff测试无攻击拳刃", command = "d_cmd 2001 3633"}
CYCLOPAEDIA_DICT[81] = {keyword = "^FFFFFF测试无攻击扇子" , class = 11 , content = "^1d9dff测试无攻击扇子", command = "d_cmd 2001 3634"}
CYCLOPAEDIA_DICT[82] = {keyword = "^FFFFFF测试无攻击双剑" , class = 11 , content = "^1d9dff测试无攻击双剑", command = "d_cmd 2001 3635"}
CYCLOPAEDIA_DICT[83] = {keyword = "^FFFFFF测试无攻击双刃" , class = 11 , content = "^1d9dff测试无攻击双刃", command = "d_cmd 2001 3636"}
CYCLOPAEDIA_DICT[84] = {keyword = "^FFFFFF测试无攻击单剑" , class = 11 , content = "^1d9dff测试无攻击单剑", command = "d_cmd 2001 3637"}
CYCLOPAEDIA_DICT[85] = {keyword = "^33CC331级APC采药人" , class = 21 , content = "^fedc40采药人\r^ffffff1级战斗NPC。", command = "d_cmd 2005 8943"}
CYCLOPAEDIA_DICT[86] = {keyword = "^33CC331级APC采药人乙" , class = 21 , content = "^fedc40采药人乙\r^ffffff1级战斗NPC。", command = "d_cmd 2005 12324"}
CYCLOPAEDIA_DICT[87] = {keyword = "^33CC331级APC樵夫" , class = 21 , content = "^fedc40樵夫\r^ffffff1级战斗NPC。", command = "d_cmd 2005 8944"}
CYCLOPAEDIA_DICT[88] = {keyword = "^33CC331级APC樵夫乙" , class = 21 , content = "^fedc40樵夫乙\r^ffffff1级战斗NPC。", command = "d_cmd 2005 12325"}
CYCLOPAEDIA_DICT[89] = {keyword = "^33CC331级APC算命先生" , class = 21 , content = "^fedc40算命先生\r^ffffff1级战斗NPC。", command = "d_cmd 2005 8945"}
CYCLOPAEDIA_DICT[90] = {keyword = "^33CC331级APC算命先生乙" , class = 21 , content = "^fedc40算命先生乙\r^ffffff1级战斗NPC。", command = "d_cmd 2005 12325"}
CYCLOPAEDIA_DICT[91] = {keyword = "^33CC331级APC算命先生丙" , class = 21 , content = "^fedc40算命先生丙\r^ffffff1级战斗NPC。", command = "d_cmd 2005 12326"}
CYCLOPAEDIA_DICT[92] = {keyword = "^33CC331级APC中年男子" , class = 21 , content = "^fedc40中年男子\r^ffffff1级战斗NPC。", command = "d_cmd 2005 8946"}
CYCLOPAEDIA_DICT[93] = {keyword = "^33CC332级APC中年男乙" , class = 21 , content = "^fedc40中年男子乙\r^ffffff2级战斗NPC。", command = "d_cmd 2005 12338"}
CYCLOPAEDIA_DICT[94] = {keyword = "^33CC331级APC大胡子壮汉" , class = 21 , content = "^fedc40大胡子壮汉\r^ffffff1级战斗NPC。", command = "d_cmd 2005 8947"}
CYCLOPAEDIA_DICT[95] = {keyword = "^33CC331级APC大胡子壮汉乙" , class = 21 , content = "^fedc40大胡子壮汉乙\r^ffffff1级战斗NPC。", command = "d_cmd 2005 12328"}
CYCLOPAEDIA_DICT[96] = {keyword = "^33CC331级APC江南青年女" , class = 21 , content = "^fedc40江南青年女\r^ffffff1级战斗NPC。", command = "d_cmd 2005 8948"}
CYCLOPAEDIA_DICT[97] = {keyword = "^33CC331级APC江南青年女乙" , class = 21 , content = "^fedc40江南青年女乙\r^ffffff1级战斗NPC。", command = "d_cmd 2005 12331"}
CYCLOPAEDIA_DICT[98] = {keyword = "^33CC331级APC江南青年女丙" , class = 21 , content = "^fedc40江南青年女丙\r^ffffff1级战斗NPC。", command = "d_cmd 2005 12332"}
CYCLOPAEDIA_DICT[99] = {keyword = "^33CC331级APC江南青年女丁" , class = 21 , content = "^fedc40江南青年女丁\r^ffffff1级战斗NPC。", command = "d_cmd 2005 12333"}
CYCLOPAEDIA_DICT[100] = {keyword = "^33CC331级APC江南青年女戊" , class = 21 , content = "^fedc40江南青年女戊\r^ffffff1级战斗NPC。", command = "d_cmd 2005 12334"}
CYCLOPAEDIA_DICT[101] = {keyword = "^33CC331级APC老者" , class = 21 , content = "^fedc40老者\r^ffffff1级战斗NPC。", command = "d_cmd 2005 8949"}
CYCLOPAEDIA_DICT[102] = {keyword = "^33CC331级APC老者乙" , class = 21 , content = "^fedc40老者乙\r^ffffff1级战斗NPC。", command = "d_cmd 2005 12330"}
CYCLOPAEDIA_DICT[103] = {keyword = "^33CC331级APC原老者" , class = 21 , content = "^fedc40原老者\r^ffffff1级战斗NPC。", command = "d_cmd 2005 12329"}
CYCLOPAEDIA_DICT[104] = {keyword = "^33CC331级APC董先生" , class = 21 , content = "^fedc40董先生\r^ffffff1级战斗NPC。", command = "d_cmd 2005 8950"}
CYCLOPAEDIA_DICT[105] = {keyword = "^33CC332级APC林福" , class = 21 , content = "^fedc40林福\r^ffffff2级战斗NPC。", command = "d_cmd 2005 8951"}
CYCLOPAEDIA_DICT[106] = {keyword = "^33CC332级APC林家高镖头" , class = 21 , content = "^fedc40林家高镖头\r^ffffff2级战斗NPC。", command = "d_cmd 2005 8952"}
CYCLOPAEDIA_DICT[107] = {keyword = "^33CC332级APC林家季镖头" , class = 21 , content = "^fedc40林家季镖头\r^ffffff2级战斗NPC。", command = "d_cmd 2005 8953"}
CYCLOPAEDIA_DICT[108] = {keyword = "^33CC332级APC林家褚镖头" , class = 21 , content = "^fedc40林家褚镖头\r^ffffff2级战斗NPC。", command = "d_cmd 2005 8954"}
CYCLOPAEDIA_DICT[109] = {keyword = "^33CC332级APC崔镖头" , class = 21 , content = "^fedc40崔镖头\r^ffffff2级战斗NPC。", command = "d_cmd 2005 8955"}
CYCLOPAEDIA_DICT[110] = {keyword = "^33CC332级APC狄镖师" , class = 21 , content = "^fedc40狄镖师\r^ffffff2级战斗NPC。", command = "d_cmd 2005 8956"}
CYCLOPAEDIA_DICT[111] = {keyword = "^33CC332级APC富镖头" , class = 21 , content = "^fedc40富镖头\r^ffffff2级战斗NPC。", command = "d_cmd 2005 8957"}
CYCLOPAEDIA_DICT[112] = {keyword = "^33CC332级APC霍镖头" , class = 21 , content = "^fedc40霍镖头\r^ffffff2级战斗NPC。", command = "d_cmd 2005 8958"}
CYCLOPAEDIA_DICT[113] = {keyword = "^33CC332级APC钱镖头" , class = 21 , content = "^fedc40钱镖头\r^ffffff2级战斗NPC。", command = "d_cmd 2005 8959"}
CYCLOPAEDIA_DICT[114] = {keyword = "^33CC332级APC吴镖头" , class = 21 , content = "^fedc40吴镖头\r^ffffff2级战斗NPC。", command = "d_cmd 2005 8960"}
CYCLOPAEDIA_DICT[115] = {keyword = "^33CC332级APC江湖侠士男" , class = 21 , content = "^fedc40江湖侠士男\r^ffffff2级战斗NPC。", command = "d_cmd 2005 12335"}
CYCLOPAEDIA_DICT[116] = {keyword = "^33CC332级APC江湖侠士女" , class = 21 , content = "^fedc40江湖侠士女\r^ffffff2级战斗NPC。", command = "d_cmd 2005 12336"}
CYCLOPAEDIA_DICT[117] = {keyword = "^33CC332级APC江湖侠士女乙" , class = 21 , content = "^fedc40江湖侠士女乙\r^ffffff2级战斗NPC。", command = "d_cmd 2005 12337"}
CYCLOPAEDIA_DICT[118] = {keyword = "^33CC333级APC老不死" , class = 21 , content = "^fedc40老不死\r^ffffff3级战斗NPC。", command = "d_cmd 2005 8961"}
CYCLOPAEDIA_DICT[119] = {keyword = "^33CC333级APC老太监" , class = 21 , content = "^fedc40老太监\r^ffffff3级战斗NPC。", command = "d_cmd 2005 8962"}
CYCLOPAEDIA_DICT[120] = {keyword = "^33CC333级APC年轻太监" , class = 21 , content = "^fedc40年轻太监\r^ffffff3级战斗NPC。", command = "d_cmd 2005 8963"}
CYCLOPAEDIA_DICT[121] = {keyword = "^33CC333级APC年轻太监乙" , class = 21 , content = "^fedc40年轻太监乙\r^ffffff3级战斗NPC。", command = "d_cmd 2005 12339"}
CYCLOPAEDIA_DICT[122] = {keyword = "^33CC333级APC西域青年" , class = 21 , content = "^fedc40西域青年\r^ffffff3级战斗NPC。", command = "d_cmd 2005 8964"}
CYCLOPAEDIA_DICT[123] = {keyword = "^33CC333级APC西域青年乙" , class = 21 , content = "^fedc40西域青年乙\r^ffffff3级战斗NPC。", command = "d_cmd 2005 12340"}
CYCLOPAEDIA_DICT[124] = {keyword = "^33CC333级APC西域青年丙" , class = 21 , content = "^fedc40西域青年丙\r^ffffff3级战斗NPC。", command = "d_cmd 2005 12341"}
CYCLOPAEDIA_DICT[125] = {keyword = "^33CC334级APC少林年轻弟子" , class = 21 , content = "^fedc40少林年轻弟子\r^ffffff4级战斗NPC。", command = "d_cmd 2005 8965"}
CYCLOPAEDIA_DICT[126] = {keyword = "^33CC334级APC少林中年弟子" , class = 21 , content = "^fedc40少林中年弟子\r^ffffff4级战斗NPC。", command = "d_cmd 2005 8966"}
CYCLOPAEDIA_DICT[127] = {keyword = "^33CC334级APC衡山护卫弟子" , class = 21 , content = "^fedc40衡山护卫弟子\r^ffffff4级战斗NPC。", command = "d_cmd 2005 8967"}
CYCLOPAEDIA_DICT[128] = {keyword = "^33CC334级APC日月教中年弟子" , class = 21 , content = "^fedc40日月教中年弟子\r^ffffff4级战斗NPC。", command = "d_cmd 2005 12342"}
CYCLOPAEDIA_DICT[129] = {keyword = "^33CC334级APC醉剑客" , class = 21 , content = "^fedc40醉剑客\r^ffffff4级战斗NPC。", command = "d_cmd 2005 8968"}
CYCLOPAEDIA_DICT[130] = {keyword = "^33CC334级APC青年将军" , class = 21 , content = "^fedc40青年将军\r^ffffff4级战斗NPC。", command = "d_cmd 2005 12343"}
CYCLOPAEDIA_DICT[131] = {keyword = "^33CC335级APC白发老人" , class = 21 , content = "^fedc40白发老人\r^ffffff5级战斗NPC。", command = "d_cmd 2005 8969"}
CYCLOPAEDIA_DICT[132] = {keyword = "^33CC335级APC白发老人乙" , class = 21 , content = "^fedc40白发老人乙\r^ffffff5级战斗NPC。", command = "d_cmd 2005 12347"}
CYCLOPAEDIA_DICT[133] = {keyword = "^33CC335级APC丁勉" , class = 21 , content = "^fedc40丁勉\r^ffffff5级战斗NPC。", command = "d_cmd 2005 8970"}
CYCLOPAEDIA_DICT[134] = {keyword = "^33CC335级APC鲁连荣" , class = 21 , content = "^fedc40鲁连荣\r^ffffff5级战斗NPC。", command = "d_cmd 2005 8971"}
CYCLOPAEDIA_DICT[135] = {keyword = "^33CC335级APC陆柏" , class = 21 , content = "^fedc40陆柏\r^ffffff5级战斗NPC。", command = "d_cmd 2005 8972"}
CYCLOPAEDIA_DICT[136] = {keyword = "^33CC335级APC得道高僧胖" , class = 21 , content = "^fedc40得道高僧胖\r^ffffff5级战斗NPC。", command = "d_cmd 2005 12344"}
CYCLOPAEDIA_DICT[137] = {keyword = "^33CC335级APC得道高僧瘦" , class = 21 , content = "^fedc40得道高僧瘦\r^ffffff5级战斗NPC。", command = "d_cmd 2005 12345"}
CYCLOPAEDIA_DICT[138] = {keyword = "^33CC335级APC杨莲亭" , class = 21 , content = "^fedc40杨莲亭\r^ffffff5级战斗NPC。", command = "d_cmd 2005 8973"}
CYCLOPAEDIA_DICT[139] = {keyword = "^33CC335级APC原绿竹翁" , class = 21 , content = "^fedc40原绿竹翁\r^ffffff5级战斗NPC。", command = "d_cmd 2005 8974"}
CYCLOPAEDIA_DICT[140] = {keyword = "^33CC335级APC黑衣老者" , class = 21 , content = "^fedc40黑衣老者\r^ffffff5级战斗NPC。", command = "d_cmd 2005 12346"}
CYCLOPAEDIA_DICT[141] = {keyword = "^33CC335级APC曲非烟" , class = 21 , content = "^fedc40曲非烟\r^ffffff5级战斗NPC。", command = "d_cmd 2005 12348"}
CYCLOPAEDIA_DICT[142] = {keyword = "^33CC335级APC天松道人" , class = 21 , content = "^fedc40天松道人\r^ffffff5级战斗NPC。", command = "d_cmd 2005 12349"}
CYCLOPAEDIA_DICT[143] = {keyword = "^33CC335级APC天乙道人" , class = 21 , content = "^fedc40天乙道人\r^ffffff5级战斗NPC。", command = "d_cmd 2005 12350"}
CYCLOPAEDIA_DICT[144] = {keyword = "^33CC336级APC候人英" , class = 21 , content = "^fedc40候人英\r^ffffff6级战斗NPC。", command = "d_cmd 2005 8976"}
CYCLOPAEDIA_DICT[145] = {keyword = "^33CC336级APC吉人通" , class = 21 , content = "^fedc40吉人通\r^ffffff6级战斗NPC。", command = "d_cmd 2005 8977"}
CYCLOPAEDIA_DICT[146] = {keyword = "^33CC336级APC贾人达" , class = 21 , content = "^fedc40贾人达\r^ffffff6级战斗NPC。", command = "d_cmd 2005 8978"}
CYCLOPAEDIA_DICT[147] = {keyword = "^33CC336级APC黎人洪" , class = 21 , content = "^fedc40黎人洪\r^ffffff6级战斗NPC。", command = "d_cmd 2005 8979"}
CYCLOPAEDIA_DICT[148] = {keyword = "^33CC336级APC罗人杰" , class = 21 , content = "^fedc40罗人杰\r^ffffff6级战斗NPC。", command = "d_cmd 2005 8980"}
CYCLOPAEDIA_DICT[149] = {keyword = "^33CC336级APC于人豪" , class = 21 , content = "^fedc40于人豪\r^ffffff6级战斗NPC。", command = "d_cmd 2005 8981"}
CYCLOPAEDIA_DICT[150] = {keyword = "^33CC336级APC罗柯耶" , class = 21 , content = "^fedc40罗柯耶\r^ffffff6级战斗NPC。", command = "d_cmd 2005 12351"}
CYCLOPAEDIA_DICT[151] = {keyword = "^33CC336级APC方人智" , class = 21 , content = "^fedc40方人智\r^ffffff6级战斗NPC。", command = "d_cmd 2005 12352"}
CYCLOPAEDIA_DICT[152] = {keyword = "^33CC337级APC戚继光" , class = 21 , content = "^fedc40戚继光\r^ffffff7级战斗NPC。", command = "d_cmd 2005 8982"}
CYCLOPAEDIA_DICT[153] = {keyword = "^33CC337级APC曲洋" , class = 21 , content = "^fedc40曲洋\r^ffffff7级战斗NPC。", command = "d_cmd 2005 8983"}
CYCLOPAEDIA_DICT[154] = {keyword = "^33CC337级APC令狐冲" , class = 21 , content = "^fedc40令狐冲\r^ffffff7级战斗NPC。", command = "d_cmd 2005 8984"}
CYCLOPAEDIA_DICT[155] = {keyword = "^33CC337级APC童百熊" , class = 21 , content = "^fedc40童百熊\r^ffffff7级战斗NPC。", command = "d_cmd 2005 8985"}
CYCLOPAEDIA_DICT[156] = {keyword = "^33CC337级APC林平之" , class = 21 , content = "^fedc40林平之\r^ffffff7级战斗NPC。", command = "d_cmd 2005 12353"}
CYCLOPAEDIA_DICT[157] = {keyword = "^33CC337级APC田伯光" , class = 21 , content = "^fedc40田伯光\r^ffffff7级战斗NPC。", command = "d_cmd 2005 12354"}
CYCLOPAEDIA_DICT[158] = {keyword = "^33CC337级APC余沧海" , class = 21 , content = "^fedc40余沧海\r^ffffff7级战斗NPC。", command = "d_cmd 2005 12355"}
CYCLOPAEDIA_DICT[159] = {keyword = "^33CC337级APC原岳不群" , class = 21 , content = "^fedc40原岳不群\r^ffffff7级战斗NPC。", command = "d_cmd 2005 8986"}
CYCLOPAEDIA_DICT[160] = {keyword = "^33CC337级APC岳不群＿精英" , class = 21 , content = "^fedc40岳不群＿精英\r^ffffff7级战斗NPC。", command = "d_cmd 2005 12356"}
CYCLOPAEDIA_DICT[161] = {keyword = "^33CC337级APC左冷禅" , class = 21 , content = "^fedc40左冷禅\r^ffffff7级战斗NPC。", command = "d_cmd 2005 8987"}
CYCLOPAEDIA_DICT[162] = {keyword = "^33CC338级APC桃干仙" , class = 21 , content = "^fedc40桃干仙\r^ffffff8级战斗NPC。", command = "d_cmd 2005 8994"}
CYCLOPAEDIA_DICT[163] = {keyword = "^33CC338级APC桃根仙" , class = 21 , content = "^fedc40桃根仙\r^ffffff8级战斗NPC。", command = "d_cmd 2005 8995"}
CYCLOPAEDIA_DICT[164] = {keyword = "^33CC338级APC桃花仙" , class = 21 , content = "^fedc40桃花仙\r^ffffff8级战斗NPC。", command = "d_cmd 2005 8996"}
CYCLOPAEDIA_DICT[165] = {keyword = "^33CC338级APC桃实仙" , class = 21 , content = "^fedc40桃实仙\r^ffffff8级战斗NPC。", command = "d_cmd 2005 8997"}
CYCLOPAEDIA_DICT[166] = {keyword = "^33CC338级APC桃叶仙" , class = 21 , content = "^fedc40桃叶仙\r^ffffff8级战斗NPC。", command = "d_cmd 2005 8998"}
CYCLOPAEDIA_DICT[167] = {keyword = "^33CC338级APC桃枝仙" , class = 21 , content = "^fedc40桃枝仙\r^ffffff8级战斗NPC。", command = "d_cmd 2005 8999"}
CYCLOPAEDIA_DICT[168] = {keyword = "^33CC339级APC东方不败" , class = 21 , content = "^fedc40东方不败\r^ffffff9级战斗NPC。", command = "d_cmd 2005 9000"}
CYCLOPAEDIA_DICT[169] = {keyword = "^33CC33新手村游荡山鸡" , class = 22 , content = "^fedc40雉鸡", command = "d_cmd 2005 2872"}
CYCLOPAEDIA_DICT[170] = {keyword = "^33CC33新手村拦路流氓" , class = 22 , content = "^fedc40拦路流氓", command = "d_cmd 2005 2873"}
CYCLOPAEDIA_DICT[171] = {keyword = "^33CC33新手村小BOSS" , class = 22 , content = "^fedc40胡人格", command = "d_cmd 2005 2874"}
CYCLOPAEDIA_DICT[172] = {keyword = "^33CC33梅关古道怪物梅花寨喽啰" , class = 22 , content = "^fedc40梅寨喽啰", command = "d_cmd 2005 3461"}
CYCLOPAEDIA_DICT[173] = {keyword = "^33CC33梅关古道怪物梅花寨小头目" , class = 22 , content = "^fedc40梅寨小头目", command = "d_cmd 2005 3466"}
CYCLOPAEDIA_DICT[174] = {keyword = "^33CC33梅关古道怪物穿山甲" , class = 22 , content = "^fedc40穿山甲", command = "d_cmd 2005 3467"}
CYCLOPAEDIA_DICT[175] = {keyword = "^33CC33梅关古道怪物梅花寨斥候" , class = 22 , content = "^fedc40梅寨探子", command = "d_cmd 2005 3468"}
CYCLOPAEDIA_DICT[176] = {keyword = "^33CC33梅关古道怪物黑蹄野牛" , class = 22 , content = "^fedc40弯角野牛", command = "d_cmd 2005 3470"}
CYCLOPAEDIA_DICT[177] = {keyword = "^33CC33梅关古道怪物利剑山贼" , class = 22 , content = "^fedc40利剑山贼", command = "d_cmd 2005 3472"}
CYCLOPAEDIA_DICT[178] = {keyword = "^33CC33梅关古道怪物长枪山贼" , class = 22 , content = "^fedc40长枪山贼", command = "d_cmd 2005 3473"}
CYCLOPAEDIA_DICT[179] = {keyword = "^33CC33梅关古道怪物梅花寨头目铁劲BOSS" , class = 22 , content = "^fedc40梅寨寨主铁劲", command = "d_cmd 2005 3474"}
CYCLOPAEDIA_DICT[180] = {keyword = "^33CC33梅关古道怪物梅花寨弩手" , class = 22 , content = "^fedc40梅寨弩手", command = "d_cmd 2005 3475"}
CYCLOPAEDIA_DICT[181] = {keyword = "^33CC33梅关古道怪物梅岭黑熊" , class = 22 , content = "^fedc40梅岭黑熊", command = "d_cmd 2005 3476"}
CYCLOPAEDIA_DICT[182] = {keyword = "^33CC33武当山怪物拦路贼人" , class = 22 , content = "^fedc40拦路劫匪", command = "d_cmd 2005 4682"}
CYCLOPAEDIA_DICT[183] = {keyword = "^33CC33武当山怪物衡山叛徒吕钟" , class = 22 , content = "^fedc40吕钟", command = "d_cmd 2005 4683"}
CYCLOPAEDIA_DICT[184] = {keyword = "^33CC33武当山怪物武当恶徒" , class = 22 , content = "^fedc40武当恶人", command = "d_cmd 2005 4684"}
CYCLOPAEDIA_DICT[185] = {keyword = "^33CC33武当山怪物邪道人" , class = 22 , content = "^fedc40邋遢道人", command = "d_cmd 2005 4685"}
CYCLOPAEDIA_DICT[186] = {keyword = "^33CC33武当山怪物青芯子" , class = 22 , content = "^fedc40青芯子", command = "d_cmd 2005 4705"}
CYCLOPAEDIA_DICT[187] = {keyword = "^33CC33武当山怪物白尾松鼠" , class = 22 , content = "^fedc40山猪", command = "d_cmd 2005 4745"}
CYCLOPAEDIA_DICT[188] = {keyword = "^33CC33武当山怪物鸡鸣之徒" , class = 22 , content = "^fedc40鸡鸣之徒", command = "d_cmd 2005 4746"}
CYCLOPAEDIA_DICT[189] = {keyword = "^33CC33武当山怪物红狸" , class = 22 , content = "^fedc40红狸", command = "d_cmd 2005 4747"}
CYCLOPAEDIA_DICT[190] = {keyword = "^33CC33武当山怪物护药野人" , class = 22 , content = "^fedc40护药野人", command = "d_cmd 2005 4748"}
CYCLOPAEDIA_DICT[191] = {keyword = "^33CC33武当山怪物金丝龟" , class = 22 , content = "^fedc40金毛貂", command = "d_cmd 2005 4749"}
CYCLOPAEDIA_DICT[192] = {keyword = "^33CC33药王谷怪物百药门制药师" , class = 22 , content = "^fedc40百药门制药师", command = "d_cmd 2005 4769"}
CYCLOPAEDIA_DICT[193] = {keyword = "^33CC33药王谷怪物百药门采药师" , class = 22 , content = "^fedc40百药门采药师", command = "d_cmd 2005 4772"}
CYCLOPAEDIA_DICT[194] = {keyword = "^33CC33药王谷怪物金环蛇" , class = 22 , content = "^fedc40金环蛇", command = "d_cmd 2005 4773"}
CYCLOPAEDIA_DICT[195] = {keyword = "^33CC33梅关古道怪物梅寨死士" , class = 22 , content = "^fedc40梅寨死士", command = "d_cmd 2005 4857"}
CYCLOPAEDIA_DICT[196] = {keyword = "^33CC33嵩山怪物金毛狼" , class = 22 , content = "^fedc40金鬃狼", command = "d_cmd 2005 4900"}
CYCLOPAEDIA_DICT[197] = {keyword = "^33CC33嵩山怪物长耳猫头鹰" , class = 22 , content = "^fedc40逐魂鸟", command = "d_cmd 2005 4901"}
CYCLOPAEDIA_DICT[198] = {keyword = "^33CC33嵩山怪物黑爪毒蝎" , class = 22 , content = "^fedc40黑爪毒蝎", command = "d_cmd 2005 4902"}
CYCLOPAEDIA_DICT[199] = {keyword = "^33CC33嵩山怪物窃书贼" , class = 22 , content = "^fedc40窃书小贼", command = "d_cmd 2005 4903"}
CYCLOPAEDIA_DICT[200] = {keyword = "^33CC33嵩山怪物金毛狼王" , class = 22 , content = "^fedc40金鬃狼王", command = "d_cmd 2005 4904"}
CYCLOPAEDIA_DICT[201] = {keyword = "^33CC33嵩山怪物游方僧人" , class = 22 , content = "^fedc40游方僧人", command = "d_cmd 2005 4905"}
CYCLOPAEDIA_DICT[202] = {keyword = "^33CC33嵩山怪物恶头陀" , class = 22 , content = "^fedc40恶头陀", command = "d_cmd 2005 4907"}
CYCLOPAEDIA_DICT[203] = {keyword = "^33CC33嵩山怪物伪装的游方僧人" , class = 22 , content = "^fedc40游方僧人", command = "d_cmd 2005 4926"}
CYCLOPAEDIA_DICT[204] = {keyword = "^33CC33仙愁峡六乔寨小头目李二狗" , class = 22 , content = "^fedc40林斗海", command = "d_cmd 2005 4986"}
CYCLOPAEDIA_DICT[205] = {keyword = "^33CC33仙愁峡六乔寨探子" , class = 22 , content = "^fedc40六乔寨探子", command = "d_cmd 2005 4987"}
CYCLOPAEDIA_DICT[206] = {keyword = "^33CC33仙愁峡六乔寨女兵" , class = 22 , content = "^fedc40六乔寨罗刹兵", command = "d_cmd 2005 4988"}
CYCLOPAEDIA_DICT[207] = {keyword = "^33CC33仙愁峡六乔寨喽啰" , class = 22 , content = "^fedc40六乔寨天霸兵", command = "d_cmd 2005 4989"}
CYCLOPAEDIA_DICT[208] = {keyword = "^33CC33仙愁峡峡谷飞鸦群" , class = 22 , content = "^fedc40飞鸦", command = "d_cmd 2005 4990"}
CYCLOPAEDIA_DICT[209] = {keyword = "^33CC33仙愁峡闪电貂" , class = 22 , content = "^fedc40闪电貂", command = "d_cmd 2005 4991"}
CYCLOPAEDIA_DICT[210] = {keyword = "^33CC33仙愁峡江湖侠士落雪仙" , class = 22 , content = "^fedc40落雪仙", command = "d_cmd 2005 4992"}
CYCLOPAEDIA_DICT[211] = {keyword = "^33CC33仙愁峡六乔寨女兵首领" , class = 22 , content = "^fedc40罗刹兵首领", command = "d_cmd 2005 5008"}
CYCLOPAEDIA_DICT[212] = {keyword = "^33CC33仙愁峡六乔寨喽啰头领" , class = 22 , content = "^fedc40天霸兵首领", command = "d_cmd 2005 5009"}
CYCLOPAEDIA_DICT[213] = {keyword = "^33CC33余杭落魄刀客" , class = 22 , content = "^fedc40风雷帮帮众", command = "d_cmd 2005 5441"}
CYCLOPAEDIA_DICT[214] = {keyword = "^33CC33余杭护塔道士" , class = 22 , content = "^fedc40护塔道士", command = "d_cmd 2005 5442"}
CYCLOPAEDIA_DICT[215] = {keyword = "^33CC33余杭东厂番役" , class = 22 , content = "^fedc40东厂番役", command = "d_cmd 2005 5443"}
CYCLOPAEDIA_DICT[216] = {keyword = "^33CC33余杭女贼" , class = 22 , content = "^fedc40余杭女贼", command = "d_cmd 2005 5444"}
CYCLOPAEDIA_DICT[217] = {keyword = "^33CC33余杭毒蛛" , class = 22 , content = "^fedc40余杭毒蛛", command = "d_cmd 2005 5445"}
CYCLOPAEDIA_DICT[218] = {keyword = "^33CC33余杭长舌箭蛙" , class = 22 , content = "^fedc40毒蜂", command = "d_cmd 2005 5446"}
CYCLOPAEDIA_DICT[219] = {keyword = "^33CC33余杭女贼头目" , class = 22 , content = "^fedc40扈飞烟", command = "d_cmd 2005 5477"}
CYCLOPAEDIA_DICT[220] = {keyword = "^33CC33武当山怪物异刃怪客" , class = 22 , content = "^fedc40接应使", command = "d_cmd 2005 6052"}
CYCLOPAEDIA_DICT[221] = {keyword = "^33CC33余杭清玄子" , class = 22 , content = "^fedc40清玄子", command = "d_cmd 2005 6173"}
CYCLOPAEDIA_DICT[222] = {keyword = "^33CC33仙霞岭仙霞金吾卫" , class = 22 , content = "^fedc40仙霞帮众", command = "d_cmd 2005 6580"}
CYCLOPAEDIA_DICT[223] = {keyword = "^33CC33仙霞岭仙霞神射手" , class = 22 , content = "^fedc40火枪手", command = "d_cmd 2005 6581"}
CYCLOPAEDIA_DICT[224] = {keyword = "^33CC33仙霞岭仙霞金刀将" , class = 22 , content = "^fedc40东厂密探", command = "d_cmd 2005 6582"}
CYCLOPAEDIA_DICT[225] = {keyword = "^33CC33仙霞岭仙霞前锋将" , class = 22 , content = "^fedc40金甲力士", command = "d_cmd 2005 6583"}
CYCLOPAEDIA_DICT[226] = {keyword = "^33CC33仙霞岭领主刘元鹤" , class = 22 , content = "^fedc40领主刘元鹤", command = "d_cmd 2005 6584"}
CYCLOPAEDIA_DICT[227] = {keyword = "^33CC33仙霞岭青竹蛇" , class = 22 , content = "^fedc40竹叶青", command = "d_cmd 2005 6585"}
CYCLOPAEDIA_DICT[228] = {keyword = "^33CC33仙霞岭青竹鬼蛾" , class = 22 , content = "^fedc40青竹鬼蛾", command = "d_cmd 2005 6586"}
CYCLOPAEDIA_DICT[229] = {keyword = "^33CC33廿八铺黄风寨首领刘一杰" , class = 22 , content = "^fedc40王豹子", command = "d_cmd 2005 6599"}
CYCLOPAEDIA_DICT[230] = {keyword = "^33CC33廿八铺黄风寨强人" , class = 22 , content = "^fedc40神秘刺客", command = "d_cmd 2005 6600"}
CYCLOPAEDIA_DICT[231] = {keyword = "^33CC33廿八铺东厂役长" , class = 22 , content = "^fedc40东厂役长", command = "d_cmd 2005 6601"}
CYCLOPAEDIA_DICT[232] = {keyword = "^33CC33廿八铺钟镇" , class = 22 , content = "^fedc40钟镇", command = "d_cmd 2005 6602"}
CYCLOPAEDIA_DICT[233] = {keyword = "^33CC33廿八铺水贼" , class = 22 , content = "^fedc40水贼", command = "d_cmd 2005 6607"}
CYCLOPAEDIA_DICT[234] = {keyword = "^33CC33仙霞岭嵩山派弟子" , class = 22 , content = "^fedc40神秘刺客", command = "d_cmd 2005 6947"}
CYCLOPAEDIA_DICT[235] = {keyword = "^33CC33廿八铺嵩山派弟子" , class = 22 , content = "^fedc40嵩山派弟子", command = "d_cmd 2005 6948"}
CYCLOPAEDIA_DICT[236] = {keyword = "^33CC33朱仙镇绿竹" , class = 22 , content = "^fedc40绿竹", command = "d_cmd 2005 8391"}
CYCLOPAEDIA_DICT[237] = {keyword = "^33CC33朱仙镇藏龙恶少" , class = 22 , content = "^fedc40藏龙恶少", command = "d_cmd 2005 8392"}
CYCLOPAEDIA_DICT[238] = {keyword = "^33CC33泰山脚夫" , class = 22 , content = "^fedc40脚夫", command = "d_cmd 2005 8441"}
CYCLOPAEDIA_DICT[239] = {keyword = "^33CC33泰山夏侯子桓" , class = 22 , content = "^fedc40夏侯子桓", command = "d_cmd 2005 8442"}
CYCLOPAEDIA_DICT[240] = {keyword = "^33CC33泰山逆徒" , class = 22 , content = "^fedc40泰山逆徒", command = "d_cmd 2005 8443"}
CYCLOPAEDIA_DICT[241] = {keyword = "^33CC33五霸岗来路不明的盗匪" , class = 22 , content = "^fedc40来路不明的盗匪", command = "d_cmd 2005 8452"}
CYCLOPAEDIA_DICT[242] = {keyword = "^33CC33五霸岗异装强人" , class = 22 , content = "^fedc40异装强人", command = "d_cmd 2005 8453"}
CYCLOPAEDIA_DICT[243] = {keyword = "^33CC33五霸岗百药门使者赤松子" , class = 22 , content = "^fedc40百药门使者赤松子", command = "d_cmd 2005 8454"}
CYCLOPAEDIA_DICT[244] = {keyword = "^33CC33龙泉盗匪" , class = 22 , content = "^fedc40龙泉盗匪", command = "d_cmd 2005 8580"}
CYCLOPAEDIA_DICT[245] = {keyword = "^33CC33龙泉铸剑叛逆" , class = 22 , content = "^fedc40铸剑叛逆", command = "d_cmd 2005 8581"}
CYCLOPAEDIA_DICT[246] = {keyword = "^33CC33龙泉欢喜和尚" , class = 22 , content = "^fedc40欢喜和尚", command = "d_cmd 2005 8582"}
CYCLOPAEDIA_DICT[247] = {keyword = "^33CC33龙泉红叶白虎" , class = 22 , content = "^fedc40红叶白虎", command = "d_cmd 2005 8583"}
CYCLOPAEDIA_DICT[248] = {keyword = "^33CC33龙泉盗墓山民" , class = 22 , content = "^fedc40盗墓山民", command = "d_cmd 2005 8584"}
CYCLOPAEDIA_DICT[249] = {keyword = "^33CC33龙泉自在奔牛" , class = 22 , content = "^fedc40自在奔牛", command = "d_cmd 2005 8585"}
CYCLOPAEDIA_DICT[250] = {keyword = "^33CC33铸剑谷罗公公" , class = 22 , content = "^fedc40罗公公", command = "d_cmd 2005 8588"}
CYCLOPAEDIA_DICT[251] = {keyword = "^33CC33铸剑谷役长曾离云" , class = 22 , content = "^fedc40役长曾离云", command = "d_cmd 2005 8589"}
CYCLOPAEDIA_DICT[252] = {keyword = "^33CC33铸剑谷役长邱化雨" , class = 22 , content = "^fedc40役长邱化雨", command = "d_cmd 2005 8590"}
CYCLOPAEDIA_DICT[253] = {keyword = "^33CC33铸剑谷东厂番子" , class = 22 , content = "^fedc40东厂番役", command = "d_cmd 2005 8591"}
CYCLOPAEDIA_DICT[254] = {keyword = "^33CC33铸剑谷镇抚军士" , class = 22 , content = "^fedc40镇抚军士", command = "d_cmd 2005 8592"}
CYCLOPAEDIA_DICT[255] = {keyword = "^33CC33铸剑谷赵佑" , class = 22 , content = "^fedc40赵佑", command = "d_cmd 2005 8593"}
CYCLOPAEDIA_DICT[256] = {keyword = "^33CC33铸剑谷张少岚" , class = 22 , content = "^fedc40张少岚", command = "d_cmd 2005 8594"}
CYCLOPAEDIA_DICT[257] = {keyword = "^33CC33铸剑谷司马堂" , class = 22 , content = "^fedc40司马堂", command = "d_cmd 2005 8595"}
CYCLOPAEDIA_DICT[258] = {keyword = "^33CC33铸剑谷灰衣剑客" , class = 22 , content = "^fedc40冷血剑客", command = "d_cmd 2005 8596"}
CYCLOPAEDIA_DICT[259] = {keyword = "^33CC33铸剑谷铸剑苦工" , class = 22 , content = "^fedc40铸剑苦工", command = "d_cmd 2005 8597"}
CYCLOPAEDIA_DICT[260] = {keyword = "^33CC33铸剑谷疯魔铸剑苦工" , class = 22 , content = "^fedc40疯魔铸剑师", command = "d_cmd 2005 8598"}
CYCLOPAEDIA_DICT[261] = {keyword = "^33CC33铸剑谷赤血巨蝎" , class = 22 , content = "^fedc40赤血巨蝎", command = "d_cmd 2005 8599"}
CYCLOPAEDIA_DICT[262] = {keyword = "^33CC33五霸岗花斑毒尾蝎" , class = 22 , content = "^fedc40花斑毒尾蝎", command = "d_cmd 2005 9044"}
CYCLOPAEDIA_DICT[263] = {keyword = "^33CC33五霸岗座山雕" , class = 22 , content = "^fedc40座山雕", command = "d_cmd 2005 9045"}
CYCLOPAEDIA_DICT[264] = {keyword = "^33CC33五霸岗乌鸦小偷" , class = 22 , content = "^fedc40乌鸦小偷", command = "d_cmd 2005 9046"}
CYCLOPAEDIA_DICT[265] = {keyword = "^33CC33朱仙镇棕狼" , class = 22 , content = "^fedc40棕狼", command = "d_cmd 2005 9047"}
CYCLOPAEDIA_DICT[266] = {keyword = "^33CC33朱仙镇路胜[金环九连刀]" , class = 22 , content = "^fedc40路胜[金环九连刀]", command = "d_cmd 2005 9050"}
CYCLOPAEDIA_DICT[267] = {keyword = "^33CC33朱仙镇采花小贼" , class = 22 , content = "^fedc40窃药小贼", command = "d_cmd 2005 9051"}
CYCLOPAEDIA_DICT[268] = {keyword = "^33CC33朱仙镇小兔子" , class = 22 , content = "^fedc40小松鼠", command = "d_cmd 2005 9052"}
CYCLOPAEDIA_DICT[269] = {keyword = "^33CC33朱仙镇海砂帮帮众" , class = 22 , content = "^fedc40海砂帮帮众", command = "d_cmd 2005 9053"}
CYCLOPAEDIA_DICT[270] = {keyword = "^FFFFFF兔子" , class = 24 , content = "^FFFFFF兔子", command = "d_cmd 2001 5266"}
CYCLOPAEDIA_DICT[271] = {keyword = "^FFFFFF小猫" , class = 24 , content = "^FFFFFF小猫", command = "d_cmd 2001 5267"}
CYCLOPAEDIA_DICT[272] = {keyword = "^FFFFFF松鼠" , class = 24 , content = "^FFFFFF松鼠", command = "d_cmd 2001 5268"}
CYCLOPAEDIA_DICT[273] = {keyword = "^FFFFFF鹦鹉" , class = 24 , content = "^FFFFFF鹦鹉", command = "d_cmd 2001 5269"}
CYCLOPAEDIA_DICT[274] = {keyword = "^FFFFFF蛤蟆" , class = 24 , content = "^FFFFFF蛤蟆", command = "d_cmd 2001 5270"}
CYCLOPAEDIA_DICT[275] = {keyword = "^FFFFFF猴子" , class = 24 , content = "^FFFFFF猴子", command = "d_cmd 2001 5271"}
CYCLOPAEDIA_DICT[276] = {keyword = "^FFFFFF小丫鬟" , class = 24 , content = "^FFFFFF小丫鬟", command = "d_cmd 2001 5272"}
CYCLOPAEDIA_DICT[277] = {keyword = "^FFFFFF小伙计" , class = 24 , content = "^FFFFFF小伙计", command = "d_cmd 2001 5273"}
CYCLOPAEDIA_DICT[278] = {keyword = "^FFFFFF蜘蛛" , class = 24 , content = "^FFFFFF蜘蛛", command = "d_cmd 2001 5274"}
CYCLOPAEDIA_DICT[279] = {keyword = "^FFFFFF猎犬" , class = 24 , content = "^FFFFFF猎犬", command = "d_cmd 2001 5275"}
CYCLOPAEDIA_DICT[280] = {keyword = "^FFFFFF蝎子" , class = 24 , content = "^FFFFFF蝎子", command = "d_cmd 2001 5276"}
CYCLOPAEDIA_DICT[281] = {keyword = "^FFFFFF蜈蚣" , class = 24 , content = "^FFFFFF蜈蚣", command = "d_cmd 2001 5277"}
CYCLOPAEDIA_DICT[282] = {keyword = "^FFFFFF家奴小歌女" , class = 24 , content = "^FFFFFF家奴小歌女", command = "d_cmd 2001 5278"}
CYCLOPAEDIA_DICT[283] = {keyword = "^FFFFFF人质小歌女" , class = 24 , content = "^FFFFFF人质小歌女", command = "d_cmd 2001 5279"}
CYCLOPAEDIA_DICT[284] = {keyword = "^FFFFFF家奴赌徒" , class = 24 , content = "^FFFFFF家奴赌徒", command = "d_cmd 2001 5280"}
CYCLOPAEDIA_DICT[285] = {keyword = "^FFFFFF人质赌徒" , class = 24 , content = "^FFFFFF人质赌徒", command = "d_cmd 2001 5281"}
CYCLOPAEDIA_DICT[286] = {keyword = "^FFFFFF毒蛇" , class = 24 , content = "^FFFFFF毒蛇", command = "d_cmd 2001 5282"}
CYCLOPAEDIA_DICT[287] = {keyword = "^FFFFFF野猪" , class = 24 , content = "^FFFFFF野猪", command = "d_cmd 2001 5283"}
CYCLOPAEDIA_DICT[288] = {keyword = "^FFFFFF人质纨绔子弟" , class = 24 , content = "^FFFFFF人质纨绔子弟", command = "d_cmd 2001 5284"}
CYCLOPAEDIA_DICT[289] = {keyword = "^FFFFFF家奴纨绔子弟" , class = 24 , content = "^FFFFFF家奴纨绔子弟", command = "d_cmd 2001 5285"}
CYCLOPAEDIA_DICT[290] = {keyword = "^FFFFFF人质账房" , class = 24 , content = "^FFFFFF人质账房", command = "d_cmd 2001 5286"}
CYCLOPAEDIA_DICT[291] = {keyword = "^FFFFFF家奴账房" , class = 24 , content = "^FFFFFF家奴账房", command = "d_cmd 2001 5287"}
CYCLOPAEDIA_DICT[292] = {keyword = "^FFFFFF布制人偶" , class = 24 , content = "^FFFFFF布制人偶", command = "d_cmd 2001 5288"}
CYCLOPAEDIA_DICT[293] = {keyword = "^FFFFFF教书先生" , class = 24 , content = "^FFFFFF教书先生", command = "d_cmd 2001 5289"}
CYCLOPAEDIA_DICT[294] = {keyword = "^FFFFFF少林小师弟" , class = 24 , content = "^FFFFFF少林小师弟", command = "d_cmd 2001 5290"}
CYCLOPAEDIA_DICT[295] = {keyword = "^FFFFFF武当小师弟" , class = 24 , content = "^FFFFFF武当小师弟", command = "d_cmd 2001 5291"}
CYCLOPAEDIA_DICT[296] = {keyword = "^FFFFFF华山小师妹" , class = 24 , content = "^FFFFFF华山小师妹", command = "d_cmd 2001 5292"}
CYCLOPAEDIA_DICT[297] = {keyword = "^FFFFFF恒山小师妹" , class = 24 , content = "^FFFFFF恒山小师妹", command = "d_cmd 2001 5293"}
CYCLOPAEDIA_DICT[298] = {keyword = "^FFFFFF衡山小师妹" , class = 24 , content = "^FFFFFF衡山小师妹", command = "d_cmd 2001 5294"}
CYCLOPAEDIA_DICT[299] = {keyword = "^FFFFFF日月小师弟" , class = 24 , content = "^FFFFFF日月小师弟", command = "d_cmd 2001 5295"}
CYCLOPAEDIA_DICT[300] = {keyword = "^FFFFFF五仙小师妹" , class = 24 , content = "^FFFFFF五仙小师妹", command = "d_cmd 2001 5296"}
CYCLOPAEDIA_DICT[301] = {keyword = "^FFFFFF逍遥小师弟" , class = 24 , content = "^FFFFFF逍遥小师弟", command = "d_cmd 2001 5297"}
CYCLOPAEDIA_DICT[302] = {keyword = "^FFFFFF唐门小师弟" , class = 24 , content = "^FFFFFF唐门小师弟", command = "d_cmd 2001 5298"}
CYCLOPAEDIA_DICT[303] = {keyword = "^FFFFFF峨嵋小师妹" , class = 24 , content = "^FFFFFF峨嵋小师妹", command = "d_cmd 2001 5299"}
CYCLOPAEDIA_DICT[304] = {keyword = "^FFFFFF闪电貂" , class = 24 , content = "^FFFFFF闪电貂", command = "d_cmd 2001 5300"}
CYCLOPAEDIA_DICT[305] = {keyword = "^FFFFFF家奴飞贼" , class = 24 , content = "^FFFFFF家奴飞贼", command = "d_cmd 2001 5301"}
CYCLOPAEDIA_DICT[306] = {keyword = "^FFFFFF人质飞贼" , class = 24 , content = "^FFFFFF人质飞贼", command = "d_cmd 2001 5302"}
CYCLOPAEDIA_DICT[307] = {keyword = "^FFFFFF人质打手" , class = 24 , content = "^FFFFFF人质打手", command = "d_cmd 2001 5303"}
CYCLOPAEDIA_DICT[308] = {keyword = "^FFFFFF家奴打手" , class = 24 , content = "^FFFFFF家奴打手", command = "d_cmd 2001 5304"}
CYCLOPAEDIA_DICT[309] = {keyword = "^FFFFFF人质山贼" , class = 24 , content = "^FFFFFF人质山贼", command = "d_cmd 2001 5305"}
CYCLOPAEDIA_DICT[310] = {keyword = "^FFFFFF家奴山贼" , class = 24 , content = "^FFFFFF家奴山贼", command = "d_cmd 2001 5306"}
CYCLOPAEDIA_DICT[311] = {keyword = "^FFFFFF老虎" , class = 24 , content = "^FFFFFF老虎", command = "d_cmd 2001 5307"}
CYCLOPAEDIA_DICT[312] = {keyword = "^FFFFFF宦官" , class = 24 , content = "^FFFFFF宦官", command = "d_cmd 2001 5308"}
CYCLOPAEDIA_DICT[313] = {keyword = "^FFFFFF白熊" , class = 24 , content = "^FFFFFF白熊", command = "d_cmd 2001 5309"}
CYCLOPAEDIA_DICT[314] = {keyword = "^FFFFFF相扑" , class = 24 , content = "^FFFFFF相扑", command = "d_cmd 2001 5310"}
CYCLOPAEDIA_DICT[315] = {keyword = "^FFFFFF僵尸" , class = 24 , content = "^FFFFFF僵尸", command = "d_cmd 2001 5311"}
CYCLOPAEDIA_DICT[316] = {keyword = "^FFFFFF雕兄" , class = 24 , content = "^FFFFFF雕兄", command = "d_cmd 2001 5312"}
CYCLOPAEDIA_DICT[317] = {keyword = "^FFFFFF忍者" , class = 24 , content = "^FFFFFF忍者", command = "d_cmd 2001 5313"}
CYCLOPAEDIA_DICT[318] = {keyword = "^FFFFFF兔子宝宝" , class = 24 , content = "^FFFFFF兔子宝宝", command = "d_cmd 2001 5314"}
CYCLOPAEDIA_DICT[319] = {keyword = "^FFFFFF筋骨变异兔子" , class = 24 , content = "^FFFFFF筋骨变异兔子", command = "d_cmd 2001 5315"}
CYCLOPAEDIA_DICT[320] = {keyword = "^FFFFFF内劲变异兔子" , class = 24 , content = "^FFFFFF内劲变异兔子", command = "d_cmd 2001 5316"}
CYCLOPAEDIA_DICT[321] = {keyword = "^FFFFFF小猫宝宝" , class = 24 , content = "^FFFFFF小猫宝宝", command = "d_cmd 2001 5317"}
CYCLOPAEDIA_DICT[322] = {keyword = "^FFFFFF筋骨变异小猫" , class = 24 , content = "^FFFFFF筋骨变异小猫", command = "d_cmd 2001 5318"}
CYCLOPAEDIA_DICT[323] = {keyword = "^FFFFFF力量变异小猫" , class = 24 , content = "^FFFFFF力量变异小猫", command = "d_cmd 2001 5319"}
CYCLOPAEDIA_DICT[324] = {keyword = "^FFFFFF松鼠宝宝" , class = 24 , content = "^FFFFFF松鼠宝宝", command = "d_cmd 2001 5320"}
CYCLOPAEDIA_DICT[325] = {keyword = "^FFFFFF力量变异松鼠" , class = 24 , content = "^FFFFFF力量变异松鼠", command = "d_cmd 2001 5321"}
CYCLOPAEDIA_DICT[326] = {keyword = "^FFFFFF筋骨变异松鼠" , class = 24 , content = "^FFFFFF筋骨变异松鼠", command = "d_cmd 2001 5322"}
CYCLOPAEDIA_DICT[327] = {keyword = "^FFFFFF鹦鹉宝宝" , class = 24 , content = "^FFFFFF鹦鹉宝宝", command = "d_cmd 2001 5323"}
CYCLOPAEDIA_DICT[328] = {keyword = "^FFFFFF力量变异鹦鹉" , class = 24 , content = "^FFFFFF力量变异鹦鹉", command = "d_cmd 2001 5324"}
CYCLOPAEDIA_DICT[329] = {keyword = "^FFFFFF蛤蟆宝宝" , class = 24 , content = "^FFFFFF蛤蟆宝宝", command = "d_cmd 2001 5325"}
CYCLOPAEDIA_DICT[330] = {keyword = "^FFFFFF内劲变异蛤蟆" , class = 24 , content = "^FFFFFF内劲变异蛤蟆", command = "d_cmd 2001 5326"}
CYCLOPAEDIA_DICT[331] = {keyword = "^FFFFFF猴子宝宝" , class = 24 , content = "^FFFFFF猴子宝宝", command = "d_cmd 2001 5327"}
CYCLOPAEDIA_DICT[332] = {keyword = "^FFFFFF筋骨变异猴子" , class = 24 , content = "^FFFFFF筋骨变异猴子", command = "d_cmd 2001 5328"}
CYCLOPAEDIA_DICT[333] = {keyword = "^FFFFFF力量变异猴子" , class = 24 , content = "^FFFFFF力量变异猴子", command = "d_cmd 2001 5329"}
CYCLOPAEDIA_DICT[334] = {keyword = "^FFFFFF小丫鬟宝宝" , class = 24 , content = "^FFFFFF小丫鬟宝宝", command = "d_cmd 2001 5330"}
CYCLOPAEDIA_DICT[335] = {keyword = "^FFFFFF内劲变异小丫鬟" , class = 24 , content = "^FFFFFF内劲变异小丫鬟", command = "d_cmd 2001 5331"}
CYCLOPAEDIA_DICT[336] = {keyword = "^FFFFFF筋骨变异小丫鬟" , class = 24 , content = "^FFFFFF筋骨变异小丫鬟", command = "d_cmd 2001 5332"}
CYCLOPAEDIA_DICT[337] = {keyword = "^FFFFFF小伙计宝宝" , class = 24 , content = "^FFFFFF小伙计宝宝", command = "d_cmd 2001 5333"}
CYCLOPAEDIA_DICT[338] = {keyword = "^FFFFFF内劲变异小伙计" , class = 24 , content = "^FFFFFF内劲变异小伙计", command = "d_cmd 2001 5334"}
CYCLOPAEDIA_DICT[339] = {keyword = "^FFFFFF筋骨变异小伙计" , class = 24 , content = "^FFFFFF筋骨变异小伙计", command = "d_cmd 2001 5335"}
CYCLOPAEDIA_DICT[340] = {keyword = "^FFFFFF蜘蛛宝宝" , class = 24 , content = "^FFFFFF蜘蛛宝宝", command = "d_cmd 2001 5336"}
CYCLOPAEDIA_DICT[341] = {keyword = "^FFFFFF内劲变异蜘蛛" , class = 24 , content = "^FFFFFF内劲变异蜘蛛", command = "d_cmd 2001 5337"}
CYCLOPAEDIA_DICT[342] = {keyword = "^FFFFFF猎犬宝宝" , class = 24 , content = "^FFFFFF猎犬宝宝", command = "d_cmd 2001 5338"}
CYCLOPAEDIA_DICT[343] = {keyword = "^FFFFFF力量变异猎犬" , class = 24 , content = "^FFFFFF力量变异猎犬", command = "d_cmd 2001 5339"}
CYCLOPAEDIA_DICT[344] = {keyword = "^FFFFFF体魄变异猎犬" , class = 24 , content = "^FFFFFF体魄变异猎犬", command = "d_cmd 2001 5340"}
CYCLOPAEDIA_DICT[345] = {keyword = "^FFFFFF蝎子宝宝" , class = 24 , content = "^FFFFFF蝎子宝宝", command = "d_cmd 2001 5341"}
CYCLOPAEDIA_DICT[346] = {keyword = "^FFFFFF内劲变异蝎子" , class = 24 , content = "^FFFFFF内劲变异蝎子", command = "d_cmd 2001 5342"}
CYCLOPAEDIA_DICT[347] = {keyword = "^FFFFFF筋骨变异蝎子" , class = 24 , content = "^FFFFFF筋骨变异蝎子", command = "d_cmd 2001 5343"}
CYCLOPAEDIA_DICT[348] = {keyword = "^FFFFFF蜈蚣宝宝" , class = 24 , content = "^FFFFFF蜈蚣宝宝", command = "d_cmd 2001 5344"}
CYCLOPAEDIA_DICT[349] = {keyword = "^FFFFFF内劲变异蜈蚣" , class = 24 , content = "^FFFFFF内劲变异蜈蚣", command = "d_cmd 2001 5345"}
CYCLOPAEDIA_DICT[350] = {keyword = "^FFFFFF家奴小歌女宝宝" , class = 24 , content = "^FFFFFF家奴小歌女宝宝", command = "d_cmd 2001 5346"}
CYCLOPAEDIA_DICT[351] = {keyword = "^FFFFFF家奴内劲变异小歌女" , class = 24 , content = "^FFFFFF家奴内劲变异小歌女", command = "d_cmd 2001 5347"}
CYCLOPAEDIA_DICT[352] = {keyword = "^FFFFFF人质小歌女宝宝" , class = 24 , content = "^FFFFFF人质小歌女宝宝", command = "d_cmd 2001 5348"}
CYCLOPAEDIA_DICT[353] = {keyword = "^FFFFFF人质内劲变异小歌女" , class = 24 , content = "^FFFFFF人质内劲变异小歌女", command = "d_cmd 2001 5349"}
CYCLOPAEDIA_DICT[354] = {keyword = "^FFFFFF家奴赌徒宝宝" , class = 24 , content = "^FFFFFF家奴赌徒宝宝", command = "d_cmd 2001 5350"}
CYCLOPAEDIA_DICT[355] = {keyword = "^FFFFFF家奴力量变异赌徒" , class = 24 , content = "^FFFFFF家奴力量变异赌徒", command = "d_cmd 2001 5351"}
CYCLOPAEDIA_DICT[356] = {keyword = "^FFFFFF人质赌徒宝宝" , class = 24 , content = "^FFFFFF人质赌徒宝宝", command = "d_cmd 2001 5352"}
CYCLOPAEDIA_DICT[357] = {keyword = "^FFFFFF人质力量变异赌徒" , class = 24 , content = "^FFFFFF人质力量变异赌徒", command = "d_cmd 2001 5353"}
CYCLOPAEDIA_DICT[358] = {keyword = "^FFFFFF毒蛇宝宝" , class = 24 , content = "^FFFFFF毒蛇宝宝", command = "d_cmd 2001 5354"}
CYCLOPAEDIA_DICT[359] = {keyword = "^FFFFFF内劲变异毒蛇" , class = 24 , content = "^FFFFFF内劲变异毒蛇", command = "d_cmd 2001 5355"}
CYCLOPAEDIA_DICT[360] = {keyword = "^FFFFFF野猪宝宝" , class = 24 , content = "^FFFFFF野猪宝宝", command = "d_cmd 2001 5356"}
CYCLOPAEDIA_DICT[361] = {keyword = "^FFFFFF体魄变异野猪" , class = 24 , content = "^FFFFFF体魄变异野猪", command = "d_cmd 2001 5357"}
CYCLOPAEDIA_DICT[362] = {keyword = "^FFFFFF筋骨变异野猪" , class = 24 , content = "^FFFFFF筋骨变异野猪", command = "d_cmd 2001 5358"}
CYCLOPAEDIA_DICT[363] = {keyword = "^FFFFFF人质纨绔子弟宝宝" , class = 24 , content = "^FFFFFF人质纨绔子弟宝宝", command = "d_cmd 2001 5359"}
CYCLOPAEDIA_DICT[364] = {keyword = "^FFFFFF人质内劲变异纨绔子弟" , class = 24 , content = "^FFFFFF人质内劲变异纨绔子弟", command = "d_cmd 2001 5360"}
CYCLOPAEDIA_DICT[365] = {keyword = "^FFFFFF家奴纨绔子弟宝宝" , class = 24 , content = "^FFFFFF家奴纨绔子弟宝宝", command = "d_cmd 2001 5361"}
CYCLOPAEDIA_DICT[366] = {keyword = "^FFFFFF家奴内劲变异纨绔子弟" , class = 24 , content = "^FFFFFF家奴内劲变异纨绔子弟", command = "d_cmd 2001 5362"}
CYCLOPAEDIA_DICT[367] = {keyword = "^FFFFFF人质账房宝宝" , class = 24 , content = "^FFFFFF人质账房宝宝", command = "d_cmd 2001 5363"}
CYCLOPAEDIA_DICT[368] = {keyword = "^FFFFFF人质内劲变异账房" , class = 24 , content = "^FFFFFF人质内劲变异账房", command = "d_cmd 2001 5364"}
CYCLOPAEDIA_DICT[369] = {keyword = "^FFFFFF家奴账房宝宝" , class = 24 , content = "^FFFFFF家奴账房宝宝", command = "d_cmd 2001 5365"}
CYCLOPAEDIA_DICT[370] = {keyword = "^FFFFFF家奴体魄变异账房" , class = 24 , content = "^FFFFFF家奴体魄变异账房", command = "d_cmd 2001 5366"}
CYCLOPAEDIA_DICT[371] = {keyword = "^FFFFFF布质人偶宝宝" , class = 24 , content = "^FFFFFF布质人偶宝宝", command = "d_cmd 2001 5367"}
CYCLOPAEDIA_DICT[372] = {keyword = "^FFFFFF体质变异布质人偶" , class = 24 , content = "^FFFFFF体质变异布质人偶", command = "d_cmd 2001 5368"}
CYCLOPAEDIA_DICT[373] = {keyword = "^FFFFFF力量变异布质人偶" , class = 24 , content = "^FFFFFF力量变异布质人偶", command = "d_cmd 2001 5369"}
CYCLOPAEDIA_DICT[374] = {keyword = "^FFFFFF教书先生宝宝" , class = 24 , content = "^FFFFFF教书先生宝宝", command = "d_cmd 2001 5370"}
CYCLOPAEDIA_DICT[375] = {keyword = "^FFFFFF内劲变异教书先生" , class = 24 , content = "^FFFFFF内劲变异教书先生", command = "d_cmd 2001 5371"}
CYCLOPAEDIA_DICT[376] = {keyword = "^FFFFFF体魄变异教书先生" , class = 24 , content = "^FFFFFF体魄变异教书先生", command = "d_cmd 2001 5372"}
CYCLOPAEDIA_DICT[377] = {keyword = "^FFFFFF闪电貂宝宝" , class = 24 , content = "^FFFFFF闪电貂宝宝", command = "d_cmd 2001 5373"}
CYCLOPAEDIA_DICT[378] = {keyword = "^FFFFFF体魄变异闪电貂" , class = 24 , content = "^FFFFFF体魄变异闪电貂", command = "d_cmd 2001 5374"}
CYCLOPAEDIA_DICT[379] = {keyword = "^FFFFFF力量变异闪电貂" , class = 24 , content = "^FFFFFF力量变异闪电貂", command = "d_cmd 2001 5375"}
CYCLOPAEDIA_DICT[380] = {keyword = "^FFFFFF家奴飞贼宝宝" , class = 24 , content = "^FFFFFF家奴飞贼宝宝", command = "d_cmd 2001 5376"}
CYCLOPAEDIA_DICT[381] = {keyword = "^FFFFFF家奴筋骨变异飞贼" , class = 24 , content = "^FFFFFF家奴筋骨变异飞贼", command = "d_cmd 2001 5377"}
CYCLOPAEDIA_DICT[382] = {keyword = "^FFFFFF人质飞贼宝宝" , class = 24 , content = "^FFFFFF人质飞贼宝宝", command = "d_cmd 2001 5378"}
CYCLOPAEDIA_DICT[383] = {keyword = "^FFFFFF人质内劲变异飞贼" , class = 24 , content = "^FFFFFF人质内劲变异飞贼", command = "d_cmd 2001 5379"}
CYCLOPAEDIA_DICT[384] = {keyword = "^FFFFFF人质打手宝宝" , class = 24 , content = "^FFFFFF人质打手宝宝", command = "d_cmd 2001 5380"}
CYCLOPAEDIA_DICT[385] = {keyword = "^FFFFFF力量变异人质打手" , class = 24 , content = "^FFFFFF力量变异人质打手", command = "d_cmd 2001 5381"}
CYCLOPAEDIA_DICT[386] = {keyword = "^FFFFFF家奴打手宝宝" , class = 24 , content = "^FFFFFF家奴打手宝宝", command = "d_cmd 2001 5382"}
CYCLOPAEDIA_DICT[387] = {keyword = "^FFFFFF体魄变异家奴打手" , class = 24 , content = "^FFFFFF体魄变异家奴打手", command = "d_cmd 2001 5383"}
CYCLOPAEDIA_DICT[388] = {keyword = "^FFFFFF人质山贼宝宝" , class = 24 , content = "^FFFFFF人质山贼宝宝", command = "d_cmd 2001 5384"}
CYCLOPAEDIA_DICT[389] = {keyword = "^FFFFFF力量变异人质山贼" , class = 24 , content = "^FFFFFF力量变异人质山贼", command = "d_cmd 2001 5385"}
CYCLOPAEDIA_DICT[390] = {keyword = "^FFFFFF家奴山贼宝宝" , class = 24 , content = "^FFFFFF家奴山贼宝宝", command = "d_cmd 2001 5386"}
CYCLOPAEDIA_DICT[391] = {keyword = "^FFFFFF体魄变异家奴山贼" , class = 24 , content = "^FFFFFF体魄变异家奴山贼", command = "d_cmd 2001 5387"}
CYCLOPAEDIA_DICT[392] = {keyword = "^FFFFFF老虎宝宝" , class = 24 , content = "^FFFFFF老虎宝宝", command = "d_cmd 2001 5388"}
CYCLOPAEDIA_DICT[393] = {keyword = "^FFFFFF力量变异老虎" , class = 24 , content = "^FFFFFF力量变异老虎", command = "d_cmd 2001 5389"}
CYCLOPAEDIA_DICT[394] = {keyword = "^FFFFFF体魄变异老虎" , class = 24 , content = "^FFFFFF体魄变异老虎", command = "d_cmd 2001 5390"}
CYCLOPAEDIA_DICT[395] = {keyword = "^FFFFFF宦官宝宝" , class = 24 , content = "^FFFFFF宦官宝宝", command = "d_cmd 2001 5391"}
CYCLOPAEDIA_DICT[396] = {keyword = "^FFFFFF内劲变异宦官" , class = 24 , content = "^FFFFFF内劲变异宦官", command = "d_cmd 2001 5392"}
CYCLOPAEDIA_DICT[397] = {keyword = "^FFFFFF白熊宝宝" , class = 24 , content = "^FFFFFF白熊宝宝", command = "d_cmd 2001 5393"}
CYCLOPAEDIA_DICT[398] = {keyword = "^FFFFFF力量变异白熊" , class = 24 , content = "^FFFFFF力量变异白熊", command = "d_cmd 2001 5394"}
CYCLOPAEDIA_DICT[399] = {keyword = "^FFFFFF体魄变异白熊" , class = 24 , content = "^FFFFFF体魄变异白熊", command = "d_cmd 2001 5395"}
CYCLOPAEDIA_DICT[400] = {keyword = "^FFFFFF相扑宝宝" , class = 24 , content = "^FFFFFF相扑宝宝", command = "d_cmd 2001 5396"}
CYCLOPAEDIA_DICT[401] = {keyword = "^FFFFFF力量变异相扑" , class = 24 , content = "^FFFFFF力量变异相扑", command = "d_cmd 2001 5397"}
CYCLOPAEDIA_DICT[402] = {keyword = "^FFFFFF体魄变异相扑" , class = 24 , content = "^FFFFFF体魄变异相扑", command = "d_cmd 2001 5398"}
CYCLOPAEDIA_DICT[403] = {keyword = "^FFFFFF僵尸宝宝" , class = 24 , content = "^FFFFFF僵尸宝宝", command = "d_cmd 2001 5399"}
CYCLOPAEDIA_DICT[404] = {keyword = "^FFFFFF内劲变异僵尸" , class = 24 , content = "^FFFFFF内劲变异僵尸", command = "d_cmd 2001 5400"}
CYCLOPAEDIA_DICT[405] = {keyword = "^FFFFFF体魄变异僵尸" , class = 24 , content = "^FFFFFF体魄变异僵尸", command = "d_cmd 2001 5401"}
CYCLOPAEDIA_DICT[406] = {keyword = "^FFFFFF雕兄宝宝" , class = 24 , content = "^FFFFFF雕兄宝宝", command = "d_cmd 2001 5402"}
CYCLOPAEDIA_DICT[407] = {keyword = "^FFFFFF力量变异雕兄" , class = 24 , content = "^FFFFFF力量变异雕兄", command = "d_cmd 2001 5403"}
CYCLOPAEDIA_DICT[408] = {keyword = "^FFFFFF体魄变异雕兄" , class = 24 , content = "^FFFFFF体魄变异雕兄", command = "d_cmd 2001 5404"}
CYCLOPAEDIA_DICT[409] = {keyword = "^FFFFFF忍者宝宝" , class = 24 , content = "^FFFFFF忍者宝宝", command = "d_cmd 2001 5405"}
CYCLOPAEDIA_DICT[410] = {keyword = "^FFFFFF力量变异忍者" , class = 24 , content = "^FFFFFF力量变异忍者", command = "d_cmd 2001 5406"}
CYCLOPAEDIA_DICT[411] = {keyword = "^FFFFFF体魄变异忍者" , class = 24 , content = "^FFFFFF体魄变异忍者", command = "d_cmd 2001 5407"}
CYCLOPAEDIA_DICT[412] = {keyword = "^FFFFFF西洋男火枪手" , class = 24 , content = "^FFFFFF西洋男火枪手", command = "d_cmd 2001 12257"}
CYCLOPAEDIA_DICT[413] = {keyword = "^FFFFFF西班牙男剑客" , class = 24 , content = "^FFFFFF西班牙男剑客", command = "d_cmd 2001 12258"}
CYCLOPAEDIA_DICT[414] = {keyword = "^FFFFFF肚皮女舞娘" , class = 24 , content = "^FFFFFF肚皮女舞娘", command = "d_cmd 2001 12259"}
CYCLOPAEDIA_DICT[415] = {keyword = "^FFFFFF任务兔子宝宝" , class = 24 , content = "^FFFFFF任务兔子宝宝", command = "d_cmd 2001 12361"}
CYCLOPAEDIA_DICT[416] = {keyword = "^FFFFFF任务小猫宝宝" , class = 24 , content = "^FFFFFF任务小猫宝宝", command = "d_cmd 2001 12362"}
CYCLOPAEDIA_DICT[417] = {keyword = "^FFFFFF任务猎犬宝宝" , class = 24 , content = "^FFFFFF任务猎犬宝宝", command = "d_cmd 2001 12363"}
CYCLOPAEDIA_DICT[418] = {keyword = "^FFFFFF新手鹦鹉宝宝" , class = 24 , content = "^FFFFFF新手鹦鹉宝宝", command = "d_cmd 2001 12364"}
CYCLOPAEDIA_DICT[419] = {keyword = "^FFFFFF西洋男火枪手宝宝" , class = 24 , content = "^FFFFFF西洋男火枪手宝宝", command = "d_cmd 2001 12365"}
CYCLOPAEDIA_DICT[420] = {keyword = "^FFFFFF西洋男火枪手变异" , class = 24 , content = "^FFFFFF西洋男火枪手变异", command = "d_cmd 2001 12366"}
CYCLOPAEDIA_DICT[421] = {keyword = "^FFFFFF西班牙男剑客宝宝" , class = 24 , content = "^FFFFFF西班牙男剑客宝宝", command = "d_cmd 2001 12367"}
CYCLOPAEDIA_DICT[422] = {keyword = "^FFFFFF西班牙男剑客变异" , class = 24 , content = "^FFFFFF西班牙男剑客变异", command = "d_cmd 2001 12368"}
CYCLOPAEDIA_DICT[423] = {keyword = "^FFFFFF肚皮女舞娘宝宝" , class = 24 , content = "^FFFFFF肚皮女舞娘宝宝", command = "d_cmd 2001 12369"}
CYCLOPAEDIA_DICT[424] = {keyword = "^FFFFFF肚皮女舞娘变异" , class = 24 , content = "^FFFFFF肚皮女舞娘变异", command = "d_cmd 2001 12370"}
CYCLOPAEDIA_DICT[425] = {keyword = "^FFFFFF人质西洋男火枪手" , class = 24 , content = "^FFFFFF人质西洋男火枪手", command = "d_cmd 2001 12371"}
CYCLOPAEDIA_DICT[426] = {keyword = "^FFFFFF人质西洋男火枪手宝宝" , class = 24 , content = "^FFFFFF人质西洋男火枪手宝宝", command = "d_cmd 2001 12372"}
CYCLOPAEDIA_DICT[427] = {keyword = "^FFFFFF人质西洋男火枪手变异" , class = 24 , content = "^FFFFFF人质西洋男火枪手变异", command = "d_cmd 2001 12373"}
CYCLOPAEDIA_DICT[428] = {keyword = "^FFFFFF人质西班牙男剑客" , class = 24 , content = "^FFFFFF人质西班牙男剑客", command = "d_cmd 2001 12374"}
CYCLOPAEDIA_DICT[429] = {keyword = "^FFFFFF人质西班牙男剑客宝宝" , class = 24 , content = "^FFFFFF人质西班牙男剑客宝宝", command = "d_cmd 2001 12375"}
CYCLOPAEDIA_DICT[430] = {keyword = "^FFFFFF人质西班牙男剑客变异" , class = 24 , content = "^FFFFFF人质西班牙男剑客变异", command = "d_cmd 2001 12376"}
CYCLOPAEDIA_DICT[431] = {keyword = "^FFFFFF人质肚皮女舞娘" , class = 24 , content = "^FFFFFF人质肚皮女舞娘", command = "d_cmd 2001 12377"}
CYCLOPAEDIA_DICT[432] = {keyword = "^FFFFFF人质肚皮女舞娘宝宝" , class = 24 , content = "^FFFFFF人质肚皮女舞娘宝宝", command = "d_cmd 2001 12378"}
CYCLOPAEDIA_DICT[433] = {keyword = "^FFFFFF人质肚皮女舞娘变异" , class = 24 , content = "^FFFFFF人质肚皮女舞娘变异", command = "d_cmd 2001 12379"}
CYCLOPAEDIA_DICT[434] = {keyword = "^fedc40普通止痛丸" , class = 31 , content = "^fedc40普通止痛丸", command = "d_cmd 2001 5486 100"}
CYCLOPAEDIA_DICT[435] = {keyword = "^fedc40精品止痛丸" , class = 31 , content = "^fedc40精品止痛丸", command = "d_cmd 2001 5487 100"}
CYCLOPAEDIA_DICT[436] = {keyword = "^fedc40特制止痛丸" , class = 31 , content = "^fedc40特制止痛丸", command = "d_cmd 2001 5488 100"}
CYCLOPAEDIA_DICT[437] = {keyword = "^fedc40普通金疮药" , class = 31 , content = "^fedc40普通金疮药", command = "d_cmd 2001 5489 100"}
CYCLOPAEDIA_DICT[438] = {keyword = "^fedc40精品金疮药" , class = 31 , content = "^fedc40精品金疮药", command = "d_cmd 2001 5490 100"}
CYCLOPAEDIA_DICT[439] = {keyword = "^fedc40特制金疮药" , class = 31 , content = "^fedc40特制金疮药", command = "d_cmd 2001 5491 100"}
CYCLOPAEDIA_DICT[440] = {keyword = "^fedc40普通活血散" , class = 31 , content = "^fedc40普通活血散", command = "d_cmd 2001 5492 100"}
CYCLOPAEDIA_DICT[441] = {keyword = "^fedc40精品活血散" , class = 31 , content = "^fedc40精品活血散", command = "d_cmd 2001 5493 100"}
CYCLOPAEDIA_DICT[442] = {keyword = "^fedc40特制活血散" , class = 31 , content = "^fedc40特制活血散", command = "d_cmd 2001 5494 100"}
CYCLOPAEDIA_DICT[443] = {keyword = "^fedc40普通万灵丹" , class = 31 , content = "^fedc40普通万灵丹", command = "d_cmd 2001 5495 100"}
CYCLOPAEDIA_DICT[444] = {keyword = "^fedc40普通回力丸" , class = 31 , content = "^fedc40普通回力丸", command = "d_cmd 2001 5497 100"}
CYCLOPAEDIA_DICT[445] = {keyword = "^fedc40精品回力丸" , class = 31 , content = "^fedc40精品回力丸", command = "d_cmd 2001 5498 100"}
CYCLOPAEDIA_DICT[446] = {keyword = "^fedc40特制回力丸" , class = 31 , content = "^fedc40特制回力丸", command = "d_cmd 2001 5499 100"}
CYCLOPAEDIA_DICT[447] = {keyword = "^fedc40普通凝气丹" , class = 31 , content = "^fedc40普通凝气丹", command = "d_cmd 2001 5500 100"}
CYCLOPAEDIA_DICT[448] = {keyword = "^fedc40精品凝气丹" , class = 31 , content = "^fedc40精品凝气丹", command = "d_cmd 2001 5501 100"}
CYCLOPAEDIA_DICT[449] = {keyword = "^fedc40特制凝气丹" , class = 31 , content = "^fedc40特制凝气丹", command = "d_cmd 2001 5502 100"}
CYCLOPAEDIA_DICT[450] = {keyword = "^fedc40普通聚气散" , class = 31 , content = "^fedc40普通聚气散", command = "d_cmd 2001 5503 100"}
CYCLOPAEDIA_DICT[451] = {keyword = "^fedc40精品聚气散" , class = 31 , content = "^fedc40精品聚气散", command = "d_cmd 2001 5504 100"}
CYCLOPAEDIA_DICT[452] = {keyword = "^fedc40特制聚气散" , class = 31 , content = "^fedc40特制聚气散", command = "d_cmd 2001 5505 100"}
CYCLOPAEDIA_DICT[453] = {keyword = "^fedc40普通养气丸" , class = 31 , content = "^fedc40普通养气丸", command = "d_cmd 2001 5506 100"}
CYCLOPAEDIA_DICT[454] = {keyword = "^FFFFFF光效道具－0：空" , class = 32 , content = "^fedc40光效道具－0\r^ffffff使用后可以加上状态：空", command = "d_cmd 2001 3714 100"}
CYCLOPAEDIA_DICT[455] = {keyword = "^FFFFFF光效道具－1：迟缓" , class = 32 , content = "^fedc40光效道具－1\r^ffffff使用后可以加上状态：迟缓", command = "d_cmd 2001 3715 100"}
CYCLOPAEDIA_DICT[456] = {keyword = "^FFFFFF光效道具－2：定身" , class = 32 , content = "^fedc40光效道具－2\r^ffffff使用后可以加上状态：定身", command = "d_cmd 2001 3716 100"}
CYCLOPAEDIA_DICT[457] = {keyword = "^FFFFFF光效道具－3：网缚" , class = 32 , content = "^fedc40光效道具－3\r^ffffff使用后可以加上状态：网缚", command = "d_cmd 2001 3717 100"}
CYCLOPAEDIA_DICT[458] = {keyword = "^FFFFFF光效道具－4：麻痹" , class = 32 , content = "^fedc40光效道具－4\r^ffffff使用后可以加上状态：麻痹", command = "d_cmd 2001 3718 100"}
CYCLOPAEDIA_DICT[459] = {keyword = "^FFFFFF光效道具－5：封印" , class = 32 , content = "^fedc40光效道具－5\r^ffffff使用后可以加上状态：封印", command = "d_cmd 2001 3719 100"}
CYCLOPAEDIA_DICT[460] = {keyword = "^FFFFFF光效道具－6：入睡" , class = 32 , content = "^fedc40光效道具－6\r^ffffff使用后可以加上状态：入睡", command = "d_cmd 2001 3720 100"}
CYCLOPAEDIA_DICT[461] = {keyword = "^FFFFFF光效道具－7：昏迷" , class = 32 , content = "^fedc40光效道具－7\r^ffffff使用后可以加上状态：昏迷", command = "d_cmd 2001 3721 100"}
CYCLOPAEDIA_DICT[462] = {keyword = "^FFFFFF光效道具－8：眩晕" , class = 32 , content = "^fedc40光效道具－8\r^ffffff使用后可以加上状态：眩晕", command = "d_cmd 2001 3722 100"}
CYCLOPAEDIA_DICT[463] = {keyword = "^FFFFFF光效道具－9：半破绽" , class = 32 , content = "^fedc40光效道具－9\r^ffffff使用后可以加上状态：半破绽", command = "d_cmd 2001 3723 100"}
CYCLOPAEDIA_DICT[464] = {keyword = "^FFFFFF光效道具－10：全破绽" , class = 32 , content = "^fedc40光效道具－10\r^ffffff使用后可以加上状态：全破绽", command = "d_cmd 2001 3724 100"}
CYCLOPAEDIA_DICT[465] = {keyword = "^FFFFFF光效道具－13：外攻降低" , class = 32 , content = "^fedc40光效道具－13\r^ffffff使用后可以加上状态：外攻降低", command = "d_cmd 2001 3725 100"}
CYCLOPAEDIA_DICT[466] = {keyword = "^FFFFFF光效道具－14：内攻降低" , class = 32 , content = "^fedc40光效道具－14\r^ffffff使用后可以加上状态：内攻降低", command = "d_cmd 2001 3726 100"}
CYCLOPAEDIA_DICT[467] = {keyword = "^FFFFFF光效道具－11：外防降低" , class = 32 , content = "^fedc40光效道具－11\r^ffffff使用后可以加上状态：外防降低", command = "d_cmd 2001 3727 100"}
CYCLOPAEDIA_DICT[468] = {keyword = "^FFFFFF光效道具－12：内防降低" , class = 32 , content = "^fedc40光效道具－12\r^ffffff使用后可以加上状态：内防降低", command = "d_cmd 2001 3728 100"}
CYCLOPAEDIA_DICT[469] = {keyword = "^FFFFFF光效道具－15：燃烧流失" , class = 32 , content = "^fedc40光效道具－15\r^ffffff使用后可以加上状态：燃烧流失", command = "d_cmd 2001 3729 100"}
CYCLOPAEDIA_DICT[470] = {keyword = "^FFFFFF光效道具－16：受伤流失" , class = 32 , content = "^fedc40光效道具－16\r^ffffff使用后可以加上状态：受伤流失", command = "d_cmd 2001 3730 100"}
CYCLOPAEDIA_DICT[471] = {keyword = "^FFFFFF光效道具－17：中毒流失" , class = 32 , content = "^fedc40光效道具－17\r^ffffff使用后可以加上状态：中毒流失", command = "d_cmd 2001 3731 100"}
CYCLOPAEDIA_DICT[472] = {keyword = "^FFFFFF光效道具－18：诅咒流失" , class = 32 , content = "^fedc40光效道具－18\r^ffffff使用后可以加上状态：诅咒流失", command = "d_cmd 2001 3732 100"}
CYCLOPAEDIA_DICT[473] = {keyword = "^FFFFFF光效道具－19：中毒虚弱" , class = 32 , content = "^fedc40光效道具－19\r^ffffff使用后可以加上状态：中毒虚弱", command = "d_cmd 2001 3733 100"}
CYCLOPAEDIA_DICT[474] = {keyword = "^FFFFFF光效道具－20：诅咒虚弱" , class = 32 , content = "^fedc40光效道具－20\r^ffffff使用后可以加上状态：诅咒虚弱", command = "d_cmd 2001 3734 100"}
CYCLOPAEDIA_DICT[475] = {keyword = "^FFFFFF光效道具－21：攻速提升" , class = 32 , content = "^fedc40光效道具－21\r^ffffff使用后可以加上状态：攻速提升", command = "d_cmd 2001 3735 100"}
CYCLOPAEDIA_DICT[476] = {keyword = "^FFFFFF光效道具－22：闪避提升" , class = 32 , content = "^fedc40光效道具－22\r^ffffff使用后可以加上状态：闪避提升", command = "d_cmd 2001 3736 100"}
CYCLOPAEDIA_DICT[477] = {keyword = "^FFFFFF光效道具－23：速度提升" , class = 32 , content = "^fedc40光效道具－23\r^ffffff使用后可以加上状态：速度提升", command = "d_cmd 2001 3737 100"}
CYCLOPAEDIA_DICT[478] = {keyword = "^FFFFFF光效道具－24：外攻提升" , class = 32 , content = "^fedc40光效道具－24\r^ffffff使用后可以加上状态：外攻提升", command = "d_cmd 2001 3738 100"}
CYCLOPAEDIA_DICT[479] = {keyword = "^FFFFFF光效道具－25：内攻提升" , class = 32 , content = "^fedc40光效道具－25\r^ffffff使用后可以加上状态：内攻提升", command = "d_cmd 2001 3739 100"}
CYCLOPAEDIA_DICT[480] = {keyword = "^FFFFFF光效道具－26：外防提升" , class = 32 , content = "^fedc40光效道具－26\r^ffffff使用后可以加上状态：外防提升", command = "d_cmd 2001 3740 100"}
CYCLOPAEDIA_DICT[481] = {keyword = "^FFFFFF光效道具－27：内防提升" , class = 32 , content = "^fedc40光效道具－27\r^ffffff使用后可以加上状态：内防提升", command = "d_cmd 2001 3741 100"}
CYCLOPAEDIA_DICT[482] = {keyword = "^FFFFFF光效道具－28：冰抗提升" , class = 32 , content = "^fedc40光效道具－28\r^ffffff使用后可以加上状态：冰抗提升", command = "d_cmd 2001 3742 100"}
CYCLOPAEDIA_DICT[483] = {keyword = "^FFFFFF光效道具－30：火抗提升" , class = 32 , content = "^fedc40光效道具－30\r^ffffff使用后可以加上状态：火抗提升", command = "d_cmd 2001 3743 100"}
CYCLOPAEDIA_DICT[484] = {keyword = "^FFFFFF光效道具－29：毒抗提升" , class = 32 , content = "^fedc40光效道具－29\r^ffffff使用后可以加上状态：毒抗提升", command = "d_cmd 2001 3744 100"}
CYCLOPAEDIA_DICT[485] = {keyword = "^FFFFFF光效道具－33：阴抗提升" , class = 32 , content = "^fedc40光效道具－33\r^ffffff使用后可以加上状态：阴抗提升", command = "d_cmd 2001 3745 100"}
CYCLOPAEDIA_DICT[486] = {keyword = "^FFFFFF光效道具－31：阳抗提升" , class = 32 , content = "^fedc40光效道具－31\r^ffffff使用后可以加上状态：阳抗提升", command = "d_cmd 2001 3746 100"}
CYCLOPAEDIA_DICT[487] = {keyword = "^FFFFFF光效道具－32：玄抗提升" , class = 32 , content = "^fedc40光效道具－32\r^ffffff使用后可以加上状态：玄抗提升", command = "d_cmd 2001 3747 100"}
CYCLOPAEDIA_DICT[488] = {keyword = "^FFFFFF光效道具－35：力量提升" , class = 32 , content = "^fedc40光效道具－35\r^ffffff使用后可以加上状态：力量提升", command = "d_cmd 2001 3748 100"}
CYCLOPAEDIA_DICT[489] = {keyword = "^FFFFFF光效道具－34：敏捷提升" , class = 32 , content = "^fedc40光效道具－34\r^ffffff使用后可以加上状态：敏捷提升", command = "d_cmd 2001 3749 100"}
CYCLOPAEDIA_DICT[490] = {keyword = "^FFFFFF光效道具－37：体力提升" , class = 32 , content = "^fedc40光效道具－37\r^ffffff使用后可以加上状态：体力提升", command = "d_cmd 2001 3750 100"}
CYCLOPAEDIA_DICT[491] = {keyword = "^FFFFFF光效道具－36：智力提升" , class = 32 , content = "^fedc40光效道具－36\r^ffffff使用后可以加上状态：智力提升", command = "d_cmd 2001 3751 100"}
CYCLOPAEDIA_DICT[492] = {keyword = "^FFFFFF光效道具－38：精神提升" , class = 32 , content = "^fedc40光效道具－38\r^ffffff使用后可以加上状态：精神提升", command = "d_cmd 2001 3752 100"}
CYCLOPAEDIA_DICT[493] = {keyword = "^FFFFFF光效道具－39：恢复气血" , class = 32 , content = "^fedc40光效道具－39\r^ffffff使用后可以加上状态：恢复气血", command = "d_cmd 2001 3753 100"}
CYCLOPAEDIA_DICT[494] = {keyword = "^FFFFFF光效道具－40：恢复内力" , class = 32 , content = "^fedc40光效道具－40\r^ffffff使用后可以加上状态：恢复内力", command = "d_cmd 2001 3754 100"}
CYCLOPAEDIA_DICT[495] = {keyword = "^D7C4A2华山武器包" , class = 33 , content = "^fedc40华山武器包", command = "d_cmd 2001 9898"}
CYCLOPAEDIA_DICT[496] = {keyword = "^D7C4A2恒山武器包" , class = 33 , content = "^fedc40恒山武器包", command = "d_cmd 2001 9899"}
CYCLOPAEDIA_DICT[497] = {keyword = "^D7C4A2武当武器包" , class = 33 , content = "^fedc40武当武器包", command = "d_cmd 2001 9900"}
CYCLOPAEDIA_DICT[498] = {keyword = "^D7C4A2少林武器包" , class = 33 , content = "^fedc40少林武器包", command = "d_cmd 2001 9901"}
CYCLOPAEDIA_DICT[499] = {keyword = "^D7C4A2五仙武器包" , class = 33 , content = "^fedc40五仙武器包", command = "d_cmd 2001 9902"}
CYCLOPAEDIA_DICT[500] = {keyword = "^D7C4A2日月武器包" , class = 33 , content = "^fedc40日月武器包", command = "d_cmd 2001 9903"}
CYCLOPAEDIA_DICT[501] = {keyword = "^D7C4A2唐门武器包" , class = 33 , content = "^fedc40唐门武器包", command = "d_cmd 2001 9904"}
CYCLOPAEDIA_DICT[502] = {keyword = "^D7C4A2峨眉武器包" , class = 33 , content = "^fedc40峨眉武器包", command = "d_cmd 2001 9905"}
CYCLOPAEDIA_DICT[503] = {keyword = "^D7C4A2衡山武器包" , class = 33 , content = "^fedc40衡山武器包", command = "d_cmd 2001 9906"}
CYCLOPAEDIA_DICT[504] = {keyword = "^D7C4A2逍遥武器包" , class = 33 , content = "^fedc40逍遥武器包", command = "d_cmd 2001 9907"}
CYCLOPAEDIA_DICT[505] = {keyword = "^D7C4A2品级1棉甲包" , class = 33 , content = "^fedc40品级1棉甲包", command = "d_cmd 2001 9908"}
CYCLOPAEDIA_DICT[506] = {keyword = "^D7C4A2品级1皮甲包" , class = 33 , content = "^fedc40品级1皮甲包", command = "d_cmd 2001 9909"}
CYCLOPAEDIA_DICT[507] = {keyword = "^D7C4A2品级1布衣包" , class = 33 , content = "^fedc40品级1布衣包", command = "d_cmd 2001 9910"}
CYCLOPAEDIA_DICT[508] = {keyword = "^D7C4A2品级2棉甲包" , class = 33 , content = "^fedc40品级2棉甲包", command = "d_cmd 2001 9911"}
CYCLOPAEDIA_DICT[509] = {keyword = "^D7C4A2品级2皮甲包" , class = 33 , content = "^fedc40品级2皮甲包", command = "d_cmd 2001 9912"}
CYCLOPAEDIA_DICT[510] = {keyword = "^D7C4A2品级2布衣包" , class = 33 , content = "^fedc40品级2布衣包", command = "d_cmd 2001 9913"}
CYCLOPAEDIA_DICT[511] = {keyword = "^D7C4A2品级3棉甲包" , class = 33 , content = "^fedc40品级3棉甲包", command = "d_cmd 2001 9914"}
CYCLOPAEDIA_DICT[512] = {keyword = "^D7C4A2品级3皮甲包" , class = 33 , content = "^fedc40品级3皮甲包", command = "d_cmd 2001 9915"}
CYCLOPAEDIA_DICT[513] = {keyword = "^D7C4A2品级3布衣包" , class = 33 , content = "^fedc40品级3布衣包", command = "d_cmd 2001 9916"}
CYCLOPAEDIA_DICT[514] = {keyword = "^D7C4A2品级4棉甲包" , class = 33 , content = "^fedc40品级4棉甲包", command = "d_cmd 2001 9917"}
CYCLOPAEDIA_DICT[515] = {keyword = "^D7C4A2品级4皮甲包" , class = 33 , content = "^fedc40品级4皮甲包", command = "d_cmd 2001 9918"}
CYCLOPAEDIA_DICT[516] = {keyword = "^D7C4A2品级4布衣包" , class = 33 , content = "^fedc40品级4布衣包", command = "d_cmd 2001 9919"}
CYCLOPAEDIA_DICT[517] = {keyword = "^D7C4A2品级5棉甲包" , class = 33 , content = "^fedc40品级5棉甲包", command = "d_cmd 2001 9920"}
CYCLOPAEDIA_DICT[518] = {keyword = "^D7C4A2品级5皮甲包" , class = 33 , content = "^fedc40品级5皮甲包", command = "d_cmd 2001 9921"}
CYCLOPAEDIA_DICT[519] = {keyword = "^D7C4A2品级5布衣包" , class = 33 , content = "^fedc40品级5布衣包", command = "d_cmd 2001 9922"}
CYCLOPAEDIA_DICT[520] = {keyword = "^D7C4A2品级6棉甲包" , class = 33 , content = "^fedc40品级6棉甲包", command = "d_cmd 2001 9923"}
CYCLOPAEDIA_DICT[521] = {keyword = "^D7C4A2品级6皮甲包" , class = 33 , content = "^fedc40品级6皮甲包", command = "d_cmd 2001 9924"}
CYCLOPAEDIA_DICT[522] = {keyword = "^D7C4A2品级6布衣包" , class = 33 , content = "^fedc40品级6布衣包", command = "d_cmd 2001 9925"}
CYCLOPAEDIA_DICT[523] = {keyword = "^D7C4A2品级7棉甲包" , class = 33 , content = "^fedc40品级7棉甲包", command = "d_cmd 2001 9926"}
CYCLOPAEDIA_DICT[524] = {keyword = "^D7C4A2品级7皮甲包" , class = 33 , content = "^fedc40品级7皮甲包", command = "d_cmd 2001 9927"}
CYCLOPAEDIA_DICT[525] = {keyword = "^D7C4A2品级7布衣包" , class = 33 , content = "^fedc40品级7布衣包", command = "d_cmd 2001 9928"}
CYCLOPAEDIA_DICT[526] = {keyword = "^D7C4A2品级8棉甲包" , class = 33 , content = "^fedc40品级8棉甲包", command = "d_cmd 2001 9929"}
CYCLOPAEDIA_DICT[527] = {keyword = "^D7C4A2品级8皮甲包" , class = 33 , content = "^fedc40品级8皮甲包", command = "d_cmd 2001 9930"}
CYCLOPAEDIA_DICT[528] = {keyword = "^D7C4A2品级8布衣包" , class = 33 , content = "^fedc40品级8布衣包", command = "d_cmd 2001 9931"}
CYCLOPAEDIA_DICT[529] = {keyword = "^D7C4A2华山时装包（男）" , class = 33 , content = "^fedc40华山时装包（男）", command = "d_cmd 2001 9888"}
CYCLOPAEDIA_DICT[530] = {keyword = "^D7C4A2恒山时装包（男）" , class = 33 , content = "^fedc40恒山时装包（男）", command = "d_cmd 2001 9889"}
CYCLOPAEDIA_DICT[531] = {keyword = "^D7C4A2武当时装包（男）" , class = 33 , content = "^fedc40武当时装包（男）", command = "d_cmd 2001 9890"}
CYCLOPAEDIA_DICT[532] = {keyword = "^D7C4A2少林时装包（男）" , class = 33 , content = "^fedc40少林时装包（男）", command = "d_cmd 2001 9891"}
CYCLOPAEDIA_DICT[533] = {keyword = "^D7C4A2五仙时装包（女）" , class = 33 , content = "^fedc40五仙时装包（女）", command = "d_cmd 2001 9892"}
CYCLOPAEDIA_DICT[534] = {keyword = "^D7C4A2日月时装包（男）" , class = 33 , content = "^fedc40日月时装包（男）", command = "d_cmd 2001 9893"}
CYCLOPAEDIA_DICT[535] = {keyword = "^D7C4A2唐门时装包（男）" , class = 33 , content = "^fedc40唐门时装包（男）", command = "d_cmd 2001 9894"}
CYCLOPAEDIA_DICT[536] = {keyword = "^D7C4A2峨眉时装包（男）" , class = 33 , content = "^fedc40峨眉时装包（男）", command = "d_cmd 2001 9895"}
CYCLOPAEDIA_DICT[537] = {keyword = "^D7C4A2衡山时装包（男）" , class = 33 , content = "^fedc40衡山时装包（男）", command = "d_cmd 2001 9896"}
CYCLOPAEDIA_DICT[538] = {keyword = "^D7C4A2逍遥时装包（男）" , class = 33 , content = "^fedc40逍遥时装包（男）", command = "d_cmd 2001 9897"}
CYCLOPAEDIA_DICT[539] = {keyword = "^D7C4A2华山时装包（女）" , class = 33 , content = "^fedc40华山时装包（女）", command = "d_cmd 2001 9935"}
CYCLOPAEDIA_DICT[540] = {keyword = "^D7C4A2恒山时装包（女）" , class = 33 , content = "^fedc40恒山时装包（女）", command = "d_cmd 2001 9936"}
CYCLOPAEDIA_DICT[541] = {keyword = "^D7C4A2武当时装包（女）" , class = 33 , content = "^fedc40武当时装包（女）", command = "d_cmd 2001 9937"}
CYCLOPAEDIA_DICT[542] = {keyword = "^D7C4A2日月时装包（女）" , class = 33 , content = "^fedc40日月时装包（女）", command = "d_cmd 2001 9938"}
CYCLOPAEDIA_DICT[543] = {keyword = "^D7C4A2唐门时装包（女）" , class = 33 , content = "^fedc40唐门时装包（女）", command = "d_cmd 2001 9939"}
CYCLOPAEDIA_DICT[544] = {keyword = "^D7C4A2峨眉时装包（女）" , class = 33 , content = "^fedc40峨眉时装包（女）", command = "d_cmd 2001 9940"}
CYCLOPAEDIA_DICT[545] = {keyword = "^D7C4A2衡山时装包（女）" , class = 33 , content = "^fedc40衡山时装包（女）", command = "d_cmd 2001 9941"}
CYCLOPAEDIA_DICT[546] = {keyword = "^D7C4A2逍遥时装包（女）" , class = 33 , content = "^fedc40逍遥时装包（女）", command = "d_cmd 2001 9942"}
CYCLOPAEDIA_DICT[547] = {keyword = "^D7C4A2测试跑马机" , class = 33 , content = "^fedc40测试跑马机", command = "d_cmd 2001 9268"}
CYCLOPAEDIA_DICT[548] = {keyword = "^D7C4A2测试老虎机" , class = 33 , content = "^fedc40测试老虎机", command = "d_cmd 2001 9269"}
CYCLOPAEDIA_DICT[549] = {keyword = "^D7C4A2测试猜大小" , class = 33 , content = "^fedc40测试猜大小", command = "d_cmd 2001 9270"}
CYCLOPAEDIA_DICT[550] = {keyword = "^D7C4A2测试猜拳" , class = 33 , content = "^fedc40测试猜拳", command = "d_cmd 2001 9271"}
CYCLOPAEDIA_DICT[551] = {keyword = "^D7C4A2测试抽签" , class = 33 , content = "^fedc40测试抽签", command = "d_cmd 2001 9272"}
CYCLOPAEDIA_DICT[552] = {keyword = "^D7C4A2测试求卦" , class = 33 , content = "^fedc40测试求卦", command = "d_cmd 2001 9273"}
CYCLOPAEDIA_DICT[553] = {keyword = "^D7C4A2测试诗迷" , class = 33 , content = "^fedc40测试诗迷", command = "d_cmd 2001 9274"}
CYCLOPAEDIA_DICT[554] = {keyword = "^D7C4A2测试砸蛋" , class = 33 , content = "^fedc40测试砸蛋", command = "d_cmd 2001 9275"}
CYCLOPAEDIA_DICT[555] = {keyword = "^D7C4A2测试礼包" , class = 33 , content = "^fedc40测试礼包", command = "d_cmd 2001 9276"}
CYCLOPAEDIA_DICT[556] = {keyword = "^D7C4A2测试直接开启" , class = 33 , content = "^fedc40测试直接开启", command = "d_cmd 2001 9277"}
CYCLOPAEDIA_DICT[557] = {keyword = "^D7C4A2测试藏宝图辨识" , class = 33 , content = "^fedc40测试藏宝图辨识", command = "d_cmd 2001 9278"}
CYCLOPAEDIA_DICT[558] = {keyword = "^D7C4A2测试藏宝图挖掘" , class = 33 , content = "^fedc40测试藏宝图挖掘", command = "d_cmd 2001 9279"}
CYCLOPAEDIA_DICT[559] = {keyword = "^D7C4A2测试通关翻牌" , class = 33 , content = "^fedc40测试通关翻牌", command = "d_cmd 2001 9280"}
CYCLOPAEDIA_DICT[560] = {keyword = "^D7C4A2测试跑马机2" , class = 33 , content = "^fedc40测试跑马机2", command = "d_cmd 2001 9795"}
CYCLOPAEDIA_DICT[561] = {keyword = "^33CC33时装衣服少林男01" , class = 61 , content = "^9287ff时装衣服少林男01", command = "d_cmd 2001 4517"}
CYCLOPAEDIA_DICT[562] = {keyword = "^33CC33时装衣服少林男02" , class = 61 , content = "^9287ff时装衣服少林男02", command = "d_cmd 2001 5697"}
CYCLOPAEDIA_DICT[563] = {keyword = "^33CC33时装衣服少林男03" , class = 61 , content = "^9287ff时装衣服少林男03", command = "d_cmd 2001 5698"}
CYCLOPAEDIA_DICT[564] = {keyword = "^33CC33时装头饰少林男01" , class = 61 , content = "^9287ff时装头饰少林男01", command = "d_cmd 2001 4575"}
CYCLOPAEDIA_DICT[565] = {keyword = "^33CC33时装头饰少林男02" , class = 61 , content = "^9287ff时装头饰少林男02", command = "d_cmd 2001 5859"}
CYCLOPAEDIA_DICT[566] = {keyword = "^33CC33时装头饰少林男03" , class = 61 , content = "^9287ff时装头饰少林男03", command = "d_cmd 2001 5860"}
CYCLOPAEDIA_DICT[567] = {keyword = "^33CC33时装衣服武当男01" , class = 61 , content = "^ffd200时装衣服武当男01", command = "d_cmd 2001 4518"}
CYCLOPAEDIA_DICT[568] = {keyword = "^33CC33时装衣服武当男02" , class = 61 , content = "^ffd200时装衣服武当男02", command = "d_cmd 2001 5706"}
CYCLOPAEDIA_DICT[569] = {keyword = "^33CC33时装衣服武当男03" , class = 61 , content = "^ffd200时装衣服武当男03", command = "d_cmd 2001 5707"}
CYCLOPAEDIA_DICT[570] = {keyword = "^33CC33时装头饰武当男01" , class = 61 , content = "^ffd200时装头饰武当男01", command = "d_cmd 2001 4658"}
CYCLOPAEDIA_DICT[571] = {keyword = "^33CC33时装头饰武当男02" , class = 61 , content = "^ffd200时装头饰武当男02", command = "d_cmd 2001 5868"}
CYCLOPAEDIA_DICT[572] = {keyword = "^33CC33时装头饰武当男03" , class = 61 , content = "^ffd200时装头饰武当男03", command = "d_cmd 2001 5869"}
CYCLOPAEDIA_DICT[573] = {keyword = "^33CC33时装衣服华山男01" , class = 61 , content = "^ffd200时装衣服华山男01", command = "d_cmd 2001 4520"}
CYCLOPAEDIA_DICT[574] = {keyword = "^33CC33时装衣服华山男02" , class = 61 , content = "^ffd200时装衣服华山男02", command = "d_cmd 2001 5724"}
CYCLOPAEDIA_DICT[575] = {keyword = "^33CC33时装衣服华山男03" , class = 61 , content = "^ffd200时装衣服华山男03", command = "d_cmd 2001 5725"}
CYCLOPAEDIA_DICT[576] = {keyword = "^33CC33时装头饰华山男01" , class = 61 , content = "^ffd200时装头饰华山男01", command = "d_cmd 2001 4660"}
CYCLOPAEDIA_DICT[577] = {keyword = "^33CC33时装头饰华山男02" , class = 61 , content = "^ffd200时装头饰华山男02", command = "d_cmd 2001 5886"}
CYCLOPAEDIA_DICT[578] = {keyword = "^33CC33时装头饰华山男03" , class = 61 , content = "^ffd200时装头饰华山男03", command = "d_cmd 2001 5887"}
CYCLOPAEDIA_DICT[579] = {keyword = "^33CC33时装衣服恒山男01" , class = 61 , content = "^ffd200时装衣服恒山男01", command = "d_cmd 2001 4522"}
CYCLOPAEDIA_DICT[580] = {keyword = "^33CC33时装衣服恒山男02" , class = 61 , content = "^ffd200时装衣服恒山男02", command = "d_cmd 2001 5742"}
CYCLOPAEDIA_DICT[581] = {keyword = "^33CC33时装衣服恒山男03" , class = 61 , content = "^ffd200时装衣服恒山男03", command = "d_cmd 2001 5743"}
CYCLOPAEDIA_DICT[582] = {keyword = "^33CC33时装头饰恒山男01" , class = 61 , content = "^ffd200时装头饰恒山男01", command = "d_cmd 2001 4662"}
CYCLOPAEDIA_DICT[583] = {keyword = "^33CC33时装头饰恒山男02" , class = 61 , content = "^ffd200时装头饰恒山男02", command = "d_cmd 2001 5904"}
CYCLOPAEDIA_DICT[584] = {keyword = "^33CC33时装头饰恒山男03" , class = 61 , content = "^ffd200时装头饰恒山男03", command = "d_cmd 2001 5905"}
CYCLOPAEDIA_DICT[585] = {keyword = "^33CC33时装衣服衡山男01" , class = 61 , content = "^ffd200时装衣服衡山男01", command = "d_cmd 2001 4524"}
CYCLOPAEDIA_DICT[586] = {keyword = "^33CC33时装衣服衡山男02" , class = 61 , content = "^ffd200时装衣服衡山男02", command = "d_cmd 2001 5760"}
CYCLOPAEDIA_DICT[587] = {keyword = "^33CC33时装衣服衡山男03" , class = 61 , content = "^ffd200时装衣服衡山男03", command = "d_cmd 2001 5761"}
CYCLOPAEDIA_DICT[588] = {keyword = "^33CC33时装头饰衡山男01" , class = 61 , content = "^ffd200时装头饰衡山男01", command = "d_cmd 2001 4664"}
CYCLOPAEDIA_DICT[589] = {keyword = "^33CC33时装头饰衡山男02" , class = 61 , content = "^ffd200时装头饰衡山男02", command = "d_cmd 2001 5922"}
CYCLOPAEDIA_DICT[590] = {keyword = "^33CC33时装头饰衡山男03" , class = 61 , content = "^ffd200时装头饰衡山男03", command = "d_cmd 2001 5923"}
CYCLOPAEDIA_DICT[591] = {keyword = "^33CC33时装衣服日月男01" , class = 61 , content = "^ffd200时装衣服日月男01", command = "d_cmd 2001 4526"}
CYCLOPAEDIA_DICT[592] = {keyword = "^33CC33时装衣服日月男02" , class = 61 , content = "^ffd200时装衣服日月男02", command = "d_cmd 2001 5778"}
CYCLOPAEDIA_DICT[593] = {keyword = "^33CC33时装衣服日月男03" , class = 61 , content = "^ffd200时装衣服日月男03", command = "d_cmd 2001 5779"}
CYCLOPAEDIA_DICT[594] = {keyword = "^33CC33时装头饰日月男01" , class = 61 , content = "^ffd200时装头饰日月男01", command = "d_cmd 2001 4666"}
CYCLOPAEDIA_DICT[595] = {keyword = "^33CC33时装头饰日月男02" , class = 61 , content = "^ffd200时装头饰日月男02", command = "d_cmd 2001 5940"}
CYCLOPAEDIA_DICT[596] = {keyword = "^33CC33时装头饰日月男03" , class = 61 , content = "^ffd200时装头饰日月男03", command = "d_cmd 2001 5941"}
CYCLOPAEDIA_DICT[597] = {keyword = "^33CC33时装衣服逍遥男01" , class = 61 , content = "^9287ff时装衣服逍遥男01", command = "d_cmd 2001 4626"}
CYCLOPAEDIA_DICT[598] = {keyword = "^33CC33时装衣服逍遥男02" , class = 61 , content = "^9287ff时装衣服逍遥男02", command = "d_cmd 2001 5805"}
CYCLOPAEDIA_DICT[599] = {keyword = "^33CC33时装衣服逍遥男03" , class = 61 , content = "^9287ff时装衣服逍遥男03", command = "d_cmd 2001 5806"}
CYCLOPAEDIA_DICT[600] = {keyword = "^33CC33时装头饰逍遥男01" , class = 61 , content = "^9287ff时装头饰逍遥男01", command = "d_cmd 2001 4669"}
CYCLOPAEDIA_DICT[601] = {keyword = "^33CC33时装头饰逍遥男02" , class = 61 , content = "^9287ff时装头饰逍遥男02", command = "d_cmd 2001 5967"}
CYCLOPAEDIA_DICT[602] = {keyword = "^33CC33时装头饰逍遥男03" , class = 61 , content = "^9287ff时装头饰逍遥男03", command = "d_cmd 2001 5968"}
CYCLOPAEDIA_DICT[603] = {keyword = "^33CC33时装衣服唐门男01" , class = 61 , content = "^9287ff时装衣服唐门男01", command = "d_cmd 2001 4628"}
CYCLOPAEDIA_DICT[604] = {keyword = "^33CC33时装衣服唐门男02" , class = 61 , content = "^9287ff时装衣服唐门男02", command = "d_cmd 2001 5823"}
CYCLOPAEDIA_DICT[605] = {keyword = "^33CC33时装衣服唐门男03" , class = 61 , content = "^9287ff时装衣服唐门男03", command = "d_cmd 2001 5824"}
CYCLOPAEDIA_DICT[606] = {keyword = "^33CC33时装头饰唐门男01" , class = 61 , content = "^9287ff时装头饰唐门男01", command = "d_cmd 2001 4671"}
CYCLOPAEDIA_DICT[607] = {keyword = "^33CC33时装头饰唐门男02" , class = 61 , content = "^9287ff时装头饰唐门男02", command = "d_cmd 2001 5985"}
CYCLOPAEDIA_DICT[608] = {keyword = "^33CC33时装头饰唐门男03" , class = 61 , content = "^9287ff时装头饰唐门男03", command = "d_cmd 2001 5986"}
CYCLOPAEDIA_DICT[609] = {keyword = "^33CC33时装衣服峨眉男01" , class = 61 , content = "^9287ff时装衣服峨眉男01", command = "d_cmd 2001 4630"}
CYCLOPAEDIA_DICT[610] = {keyword = "^33CC33时装衣服峨眉男02" , class = 61 , content = "^9287ff时装衣服峨眉男02", command = "d_cmd 2001 5841"}
CYCLOPAEDIA_DICT[611] = {keyword = "^33CC33时装衣服峨眉男03" , class = 61 , content = "^9287ff时装衣服峨眉男03", command = "d_cmd 2001 5842"}
CYCLOPAEDIA_DICT[612] = {keyword = "^33CC33时装头饰峨眉男01" , class = 61 , content = "^9287ff时装头饰峨眉男01", command = "d_cmd 2001 4673"}
CYCLOPAEDIA_DICT[613] = {keyword = "^33CC33时装头饰峨眉男02" , class = 61 , content = "^9287ff时装头饰峨眉男02", command = "d_cmd 2001 6003"}
CYCLOPAEDIA_DICT[614] = {keyword = "^33CC33时装头饰峨眉男03" , class = 61 , content = "^9287ff时装头饰峨眉男03", command = "d_cmd 2001 6004"}
CYCLOPAEDIA_DICT[615] = {keyword = "^33CC33时装衣服武当女01" , class = 62 , content = "^9287ff时装衣服武当女01", command = "d_cmd 2001 4519"}
CYCLOPAEDIA_DICT[616] = {keyword = "^33CC33时装衣服武当女02" , class = 62 , content = "^9287ff时装衣服武当女02", command = "d_cmd 2001 5715"}
CYCLOPAEDIA_DICT[617] = {keyword = "^33CC33时装衣服武当女03" , class = 62 , content = "^9287ff时装衣服武当女03", command = "d_cmd 2001 5716"}
CYCLOPAEDIA_DICT[618] = {keyword = "^33CC33时装头饰武当女01" , class = 62 , content = "^9287ff时装头饰武当女01", command = "d_cmd 2001 4659"}
CYCLOPAEDIA_DICT[619] = {keyword = "^33CC33时装头饰武当女02" , class = 62 , content = "^9287ff时装头饰武当女02", command = "d_cmd 2001 5877"}
CYCLOPAEDIA_DICT[620] = {keyword = "^33CC33时装头饰武当女03" , class = 62 , content = "^9287ff时装头饰武当女03", command = "d_cmd 2001 5878"}
CYCLOPAEDIA_DICT[621] = {keyword = "^33CC33时装衣服华山女01" , class = 62 , content = "^9287ff时装衣服华山女01", command = "d_cmd 2001 4521"}
CYCLOPAEDIA_DICT[622] = {keyword = "^33CC33时装衣服华山女02" , class = 62 , content = "^9287ff时装衣服华山女02", command = "d_cmd 2001 5733"}
CYCLOPAEDIA_DICT[623] = {keyword = "^33CC33时装衣服华山女03" , class = 62 , content = "^9287ff时装衣服华山女03", command = "d_cmd 2001 5734"}
CYCLOPAEDIA_DICT[624] = {keyword = "^33CC33时装头饰华山女01" , class = 62 , content = "^9287ff时装头饰华山女01", command = "d_cmd 2001 4661"}
CYCLOPAEDIA_DICT[625] = {keyword = "^33CC33时装头饰华山女02" , class = 62 , content = "^9287ff时装头饰华山女02", command = "d_cmd 2001 5895"}
CYCLOPAEDIA_DICT[626] = {keyword = "^33CC33时装头饰华山女03" , class = 62 , content = "^9287ff时装头饰华山女03", command = "d_cmd 2001 5896"}
CYCLOPAEDIA_DICT[627] = {keyword = "^33CC33时装衣服恒山女01" , class = 62 , content = "^9287ff时装衣服恒山女01", command = "d_cmd 2001 4523"}
CYCLOPAEDIA_DICT[628] = {keyword = "^33CC33时装衣服恒山女02" , class = 62 , content = "^9287ff时装衣服恒山女02", command = "d_cmd 2001 5751"}
CYCLOPAEDIA_DICT[629] = {keyword = "^33CC33时装衣服恒山女03" , class = 62 , content = "^9287ff时装衣服恒山女03", command = "d_cmd 2001 5752"}
CYCLOPAEDIA_DICT[630] = {keyword = "^33CC33时装头饰恒山女01" , class = 62 , content = "^9287ff时装头饰恒山女01", command = "d_cmd 2001 4663"}
CYCLOPAEDIA_DICT[631] = {keyword = "^33CC33时装头饰恒山女02" , class = 62 , content = "^9287ff时装头饰恒山女02", command = "d_cmd 2001 5913"}
CYCLOPAEDIA_DICT[632] = {keyword = "^33CC33时装头饰恒山女03" , class = 62 , content = "^9287ff时装头饰恒山女03", command = "d_cmd 2001 5914"}
CYCLOPAEDIA_DICT[633] = {keyword = "^33CC33时装衣服衡山女01" , class = 62 , content = "^9287ff时装衣服衡山女01", command = "d_cmd 2001 4525"}
CYCLOPAEDIA_DICT[634] = {keyword = "^33CC33时装衣服衡山女02" , class = 62 , content = "^9287ff时装衣服衡山女02", command = "d_cmd 2001 5769"}
CYCLOPAEDIA_DICT[635] = {keyword = "^33CC33时装衣服衡山女03" , class = 62 , content = "^9287ff时装衣服衡山女03", command = "d_cmd 2001 5770"}
CYCLOPAEDIA_DICT[636] = {keyword = "^33CC33时装头饰衡山女01" , class = 62 , content = "^9287ff时装头饰衡山女01", command = "d_cmd 2001 4665"}
CYCLOPAEDIA_DICT[637] = {keyword = "^33CC33时装头饰衡山女02" , class = 62 , content = "^9287ff时装头饰衡山女02", command = "d_cmd 2001 5931"}
CYCLOPAEDIA_DICT[638] = {keyword = "^33CC33时装头饰衡山女03" , class = 62 , content = "^9287ff时装头饰衡山女03", command = "d_cmd 2001 5932"}
CYCLOPAEDIA_DICT[639] = {keyword = "^33CC33时装衣服日月女01" , class = 62 , content = "^9287ff时装衣服日月女01", command = "d_cmd 2001 4624"}
CYCLOPAEDIA_DICT[640] = {keyword = "^33CC33时装衣服日月女02" , class = 62 , content = "^9287ff时装衣服日月女02", command = "d_cmd 2001 5787"}
CYCLOPAEDIA_DICT[641] = {keyword = "^33CC33时装衣服日月女03" , class = 62 , content = "^9287ff时装衣服日月女03", command = "d_cmd 2001 5788"}
CYCLOPAEDIA_DICT[642] = {keyword = "^33CC33时装头饰日月女01" , class = 62 , content = "^9287ff时装头饰日月女01", command = "d_cmd 2001 4667"}
CYCLOPAEDIA_DICT[643] = {keyword = "^33CC33时装头饰日月女02" , class = 62 , content = "^9287ff时装头饰日月女02", command = "d_cmd 2001 5949"}
CYCLOPAEDIA_DICT[644] = {keyword = "^33CC33时装头饰日月女03" , class = 62 , content = "^9287ff时装头饰日月女03", command = "d_cmd 2001 5950"}
CYCLOPAEDIA_DICT[645] = {keyword = "^33CC33时装衣服五仙女01" , class = 62 , content = "^ffd200时装衣服五仙女01", command = "d_cmd 2001 4625"}
CYCLOPAEDIA_DICT[646] = {keyword = "^33CC33时装衣服五仙女02" , class = 62 , content = "^ffd200时装衣服五仙女02", command = "d_cmd 2001 5796"}
CYCLOPAEDIA_DICT[647] = {keyword = "^33CC33时装衣服五仙女03" , class = 62 , content = "^ffd200时装衣服五仙女03", command = "d_cmd 2001 5797"}
CYCLOPAEDIA_DICT[648] = {keyword = "^33CC33时装头饰五仙女01" , class = 62 , content = "^ffd200时装头饰五仙女01", command = "d_cmd 2001 4668"}
CYCLOPAEDIA_DICT[649] = {keyword = "^33CC33时装头饰五仙女02" , class = 62 , content = "^ffd200时装头饰五仙女02", command = "d_cmd 2001 5958"}
CYCLOPAEDIA_DICT[650] = {keyword = "^33CC33时装头饰五仙女03" , class = 62 , content = "^ffd200时装头饰五仙女03", command = "d_cmd 2001 5959"}
CYCLOPAEDIA_DICT[651] = {keyword = "^33CC33时装衣服逍遥女01" , class = 62 , content = "^ffd200时装衣服逍遥女01", command = "d_cmd 2001 4627"}
CYCLOPAEDIA_DICT[652] = {keyword = "^33CC33时装衣服逍遥女02" , class = 62 , content = "^ffd200时装衣服逍遥女02", command = "d_cmd 2001 5814"}
CYCLOPAEDIA_DICT[653] = {keyword = "^33CC33时装衣服逍遥女03" , class = 62 , content = "^ffd200时装衣服逍遥女03", command = "d_cmd 2001 5815"}
CYCLOPAEDIA_DICT[654] = {keyword = "^33CC33时装头饰逍遥女01" , class = 62 , content = "^ffd200时装头饰逍遥女01", command = "d_cmd 2001 4670"}
CYCLOPAEDIA_DICT[655] = {keyword = "^33CC33时装头饰逍遥女02" , class = 62 , content = "^ffd200时装头饰逍遥女02", command = "d_cmd 2001 5976"}
CYCLOPAEDIA_DICT[656] = {keyword = "^33CC33时装头饰逍遥女03" , class = 62 , content = "^ffd200时装头饰逍遥女03", command = "d_cmd 2001 5977"}
CYCLOPAEDIA_DICT[657] = {keyword = "^33CC33时装衣服唐门女01" , class = 62 , content = "^ffd200时装衣服唐门女01", command = "d_cmd 2001 4629"}
CYCLOPAEDIA_DICT[658] = {keyword = "^33CC33时装衣服唐门女02" , class = 62 , content = "^ffd200时装衣服唐门女02", command = "d_cmd 2001 5832"}
CYCLOPAEDIA_DICT[659] = {keyword = "^33CC33时装衣服唐门女03" , class = 62 , content = "^ffd200时装衣服唐门女03", command = "d_cmd 2001 5833"}
CYCLOPAEDIA_DICT[660] = {keyword = "^33CC33时装头饰唐门女01" , class = 62 , content = "^ffd200时装头饰唐门女01", command = "d_cmd 2001 4672"}
CYCLOPAEDIA_DICT[661] = {keyword = "^33CC33时装头饰唐门女02" , class = 62 , content = "^ffd200时装头饰唐门女02", command = "d_cmd 2001 5994"}
CYCLOPAEDIA_DICT[662] = {keyword = "^33CC33时装头饰唐门女03" , class = 62 , content = "^ffd200时装头饰唐门女03", command = "d_cmd 2001 5995"}
CYCLOPAEDIA_DICT[663] = {keyword = "^33CC33时装衣服峨眉女01" , class = 62 , content = "^ffd200时装衣服峨眉女01", command = "d_cmd 2001 4631"}
CYCLOPAEDIA_DICT[664] = {keyword = "^33CC33时装衣服峨眉女02" , class = 62 , content = "^ffd200时装衣服峨眉女02", command = "d_cmd 2001 5850"}
CYCLOPAEDIA_DICT[665] = {keyword = "^33CC33时装衣服峨眉女03" , class = 62 , content = "^ffd200时装衣服峨眉女03", command = "d_cmd 2001 5851"}
CYCLOPAEDIA_DICT[666] = {keyword = "^33CC33时装头饰峨眉女01" , class = 62 , content = "^ffd200时装头饰峨眉女01", command = "d_cmd 2001 4674"}
CYCLOPAEDIA_DICT[667] = {keyword = "^33CC33时装头饰峨眉女02" , class = 62 , content = "^ffd200时装头饰峨眉女02", command = "d_cmd 2001 6012"}
CYCLOPAEDIA_DICT[668] = {keyword = "^33CC33时装头饰峨眉女03" , class = 62 , content = "^ffd200时装头饰峨眉女03", command = "d_cmd 2001 6013"}
CYCLOPAEDIA_DICT[669] = {keyword = "^D7C4A2武器变形专用少林结棍" , class = 64 , content = "^00ff00武器变形专用少林结棍", command = "d_cmd 2001 4646"}
CYCLOPAEDIA_DICT[670] = {keyword = "^D7C4A2武器变形专用武当长剑" , class = 64 , content = "^00ff00武器变形专用武当长剑", command = "d_cmd 2001 4647"}
CYCLOPAEDIA_DICT[671] = {keyword = "^D7C4A2武器变形专用华山单剑" , class = 64 , content = "^00ff00武器变形专用华山单剑", command = "d_cmd 2001 4648"}
CYCLOPAEDIA_DICT[672] = {keyword = "^D7C4A2武器变形专用恒山双剑" , class = 64 , content = "^00ff00武器变形专用恒山双剑", command = "d_cmd 2001 4649"}
CYCLOPAEDIA_DICT[673] = {keyword = "^D7C4A2武器变形专用衡山琴剑" , class = 64 , content = "^00ff00武器变形专用衡山琴剑", command = "d_cmd 2001 4650"}
CYCLOPAEDIA_DICT[674] = {keyword = "^D7C4A2武器变形专用日月双刃" , class = 64 , content = "^00ff00武器变形专用日月双刃", command = "d_cmd 2001 4651"}
CYCLOPAEDIA_DICT[675] = {keyword = "^D7C4A2武器变形专用五仙鞭子" , class = 64 , content = "^00ff00武器变形专用五仙鞭子", command = "d_cmd 2001 4652"}
CYCLOPAEDIA_DICT[676] = {keyword = "^D7C4A2武器变形专用逍遥扇子" , class = 64 , content = "^00ff00武器变形专用逍遥扇子", command = "d_cmd 2001 4653"}
CYCLOPAEDIA_DICT[677] = {keyword = "^D7C4A2武器变形专用唐门拳刃" , class = 64 , content = "^00ff00武器变形专用唐门拳刃", command = "d_cmd 2001 4654"}
CYCLOPAEDIA_DICT[678] = {keyword = "^D7C4A2武器变形专用峨眉法杖" , class = 64 , content = "^00ff00武器变形专用峨眉法杖", command = "d_cmd 2001 4655"}
CYCLOPAEDIA_DICT[679] = {keyword = "^FFFFFF新手武器木剑" , class = 65 , content = "^ffffff新手武器木剑", command = "d_cmd 2001 1313"}
CYCLOPAEDIA_DICT[680] = {keyword = "^33CC33神之鞭子t5r5++1X30o" , class = 65 , content = "^a0a0a0a神之鞭子t5r5++1X30o", command = "d_cmd 2001 98"}
CYCLOPAEDIA_DICT[681] = {keyword = "^33CC33神之长剑t3r3+6X50o" , class = 65 , content = "^a0a0a0a神之长剑t3r3+6X50o", command = "d_cmd 2001 123"}
CYCLOPAEDIA_DICT[682] = {keyword = "^33CC33神之结棍t4r3+30X60o" , class = 65 , content = "^a0a0a0a神之结棍t4r3+30X60o", command = "d_cmd 2001 124"}
CYCLOPAEDIA_DICT[683] = {keyword = "^33CC33神之琴剑t10r3*180X80o" , class = 65 , content = "^a0a0a0a神之琴剑t10r3*180X80o", command = "d_cmd 2001 125"}
CYCLOPAEDIA_DICT[684] = {keyword = "^33CC33神之法杖t8r3*1000X120o" , class = 65 , content = "^a0a0a0a神之法杖t8r3*1000X120o", command = "d_cmd 2001 126"}
CYCLOPAEDIA_DICT[685] = {keyword = "^33CC33神之拳刃t7r3-1X30i" , class = 65 , content = "^a0a0a0a神之拳刃t7r3-1X30i", command = "d_cmd 2001 127"}
CYCLOPAEDIA_DICT[686] = {keyword = "^33CC33神之扇子t9r3*6X50i" , class = 65 , content = "^a0a0a0a神之扇子t9r3*6X50i", command = "d_cmd 2001 128"}
CYCLOPAEDIA_DICT[687] = {keyword = "^33CC33神之双剑t2r3*30X60i" , class = 65 , content = "^a0a0a0a神之双剑t2r3*30X60i", command = "d_cmd 2001 129"}
CYCLOPAEDIA_DICT[688] = {keyword = "^33CC33神之双刃t6r3-180X80i" , class = 65 , content = "^a0a0a0a神之双刃t6r3-180X80i", command = "d_cmd 2001 130"}
CYCLOPAEDIA_DICT[689] = {keyword = "^33CC33神之单剑t1r3*1000X120i" , class = 65 , content = "^a0a0a0a神之单剑t1r3*1000X120i", command = "d_cmd 2001 131"}
CYCLOPAEDIA_DICT[690] = {keyword = "^33CC33神之棉衣50oD5wiD" , class = 65 , content = "^a0a0a0a神之棉衣50oD5wiD", command = "d_cmd 2001 99"}
CYCLOPAEDIA_DICT[691] = {keyword = "^33CC33神之皮衣99oR25iR" , class = 65 , content = "^a0a0a0a神之皮衣99oR25iR", command = "d_cmd 2001 132"}
CYCLOPAEDIA_DICT[692] = {keyword = "^33CC33神之棉裤5boD5qiD" , class = 65 , content = "^a0a0a0a神之棉裤5boD5qiD", command = "d_cmd 2001 133"}
CYCLOPAEDIA_DICT[693] = {keyword = "^33CC33神之皮裤75oR50iR" , class = 65 , content = "^a0a0a0a神之皮裤75oR50iR", command = "d_cmd 2001 134"}
CYCLOPAEDIA_DICT[694] = {keyword = "^33CC33神之棉鞋5qoD5biD" , class = 65 , content = "^a0a0a0a神之棉鞋5qoD5biD", command = "d_cmd 2001 135"}
CYCLOPAEDIA_DICT[695] = {keyword = "^33CC33神之皮鞋50oR75iR" , class = 65 , content = "^a0a0a0a神之皮鞋50oR75iR", command = "d_cmd 2001 136"}
CYCLOPAEDIA_DICT[696] = {keyword = "^33CC33神之棉腕5woD50iD" , class = 65 , content = "^a0a0a0a神之棉腕5woD50iD", command = "d_cmd 2001 137"}
CYCLOPAEDIA_DICT[697] = {keyword = "^33CC33神之皮腕25oR99iR" , class = 65 , content = "^a0a0a0a神之皮腕25oR99iR", command = "d_cmd 2001 138"}
CYCLOPAEDIA_DICT[698] = {keyword = "^FFFFFF试练之木剑" , class = 65 , content = "^b981ff试练之木剑", command = "d_cmd 2001 1327"}
CYCLOPAEDIA_DICT[699] = {keyword = "^FFFFFF试练之单剑" , class = 65 , content = "^b981ff试练之单剑", command = "d_cmd 2001 1328"}
CYCLOPAEDIA_DICT[700] = {keyword = "^FFFFFF试练之双剑" , class = 65 , content = "^b981ff试练之双剑", command = "d_cmd 2001 1329"}
CYCLOPAEDIA_DICT[701] = {keyword = "^FFFFFF试练之长剑" , class = 65 , content = "^b981ff试练之长剑", command = "d_cmd 2001 1330"}
CYCLOPAEDIA_DICT[702] = {keyword = "^FFFFFF试练之结棍" , class = 65 , content = "^b981ff试练之结棍", command = "d_cmd 2001 1331"}
CYCLOPAEDIA_DICT[703] = {keyword = "^FFFFFF试练之鞭子" , class = 65 , content = "^b981ff试练之鞭子", command = "d_cmd 2001 1332"}
CYCLOPAEDIA_DICT[704] = {keyword = "^FFFFFF试练之双刃" , class = 65 , content = "^b981ff试练之双刃", command = "d_cmd 2001 1333"}
CYCLOPAEDIA_DICT[705] = {keyword = "^FFFFFF试练之拳刃" , class = 65 , content = "^b981ff试练之拳刃", command = "d_cmd 2001 1334"}
CYCLOPAEDIA_DICT[706] = {keyword = "^FFFFFF试练之法杖" , class = 65 , content = "^b981ff试练之法杖", command = "d_cmd 2001 1335"}
CYCLOPAEDIA_DICT[707] = {keyword = "^FFFFFF试练之琴剑" , class = 65 , content = "^b981ff试练之琴剑", command = "d_cmd 2001 1336"}
CYCLOPAEDIA_DICT[708] = {keyword = "^FFFFFF试练之扇子" , class = 65 , content = "^b981ff试练之扇子", command = "d_cmd 2001 1337"}
CYCLOPAEDIA_DICT[709] = {keyword = "^FFFFFF试练之棉腕" , class = 65 , content = "^53b2c0试练之棉腕", command = "d_cmd 2001 1338"}
CYCLOPAEDIA_DICT[710] = {keyword = "^FFFFFF试练之棉鞋" , class = 65 , content = "^53b2c0试练之棉鞋", command = "d_cmd 2001 1339"}
CYCLOPAEDIA_DICT[711] = {keyword = "^FFFFFF试练之棉裤" , class = 65 , content = "^53b2c0试练之棉裤", command = "d_cmd 2001 1340"}
CYCLOPAEDIA_DICT[712] = {keyword = "^FFFFFF试练之棉衣" , class = 65 , content = "^53b2c0试练之棉衣", command = "d_cmd 2001 1341"}
CYCLOPAEDIA_DICT[713] = {keyword = "^FFFFFF试练之棉头" , class = 65 , content = "^53b2c0试练之棉头", command = "d_cmd 2001 1342"}
CYCLOPAEDIA_DICT[714] = {keyword = "^FFFFFF试练之皮腕" , class = 65 , content = "^53b2c0试练之皮腕", command = "d_cmd 2001 1343"}
CYCLOPAEDIA_DICT[715] = {keyword = "^FFFFFF试练之皮鞋" , class = 65 , content = "^53b2c0试练之皮鞋", command = "d_cmd 2001 1344"}
CYCLOPAEDIA_DICT[716] = {keyword = "^FFFFFF试练之皮裤" , class = 65 , content = "^53b2c0试练之皮裤", command = "d_cmd 2001 1345"}
CYCLOPAEDIA_DICT[717] = {keyword = "^FFFFFF试练之皮衣" , class = 65 , content = "^53b2c0试练之皮衣", command = "d_cmd 2001 1346"}
CYCLOPAEDIA_DICT[718] = {keyword = "^FFFFFF试练之皮头" , class = 65 , content = "^53b2c0试练之皮头", command = "d_cmd 2001 1347"}
CYCLOPAEDIA_DICT[719] = {keyword = "^FFFFFF试练之布腕" , class = 65 , content = "^53b2c0试练之布腕", command = "d_cmd 2001 1348"}
CYCLOPAEDIA_DICT[720] = {keyword = "^FFFFFF试练之布鞋" , class = 65 , content = "^53b2c0试练之布鞋", command = "d_cmd 2001 1349"}
CYCLOPAEDIA_DICT[721] = {keyword = "^FFFFFF试练之布裤" , class = 65 , content = "^53b2c0试练之布裤", command = "d_cmd 2001 1350"}
CYCLOPAEDIA_DICT[722] = {keyword = "^FFFFFF试练之布衣" , class = 65 , content = "^53b2c0试练之布衣", command = "d_cmd 2001 1351"}
CYCLOPAEDIA_DICT[723] = {keyword = "^FFFFFF试练之布头" , class = 65 , content = "^53b2c0试练之布头", command = "d_cmd 2001 1352"}
CYCLOPAEDIA_DICT[724] = {keyword = "^FFFFFF众神之木剑" , class = 65 , content = "^e76041众神之木剑", command = "d_cmd 2001 1353"}
CYCLOPAEDIA_DICT[725] = {keyword = "^FFFFFF众神之单剑" , class = 65 , content = "^e76041众神之单剑", command = "d_cmd 2001 1354"}
CYCLOPAEDIA_DICT[726] = {keyword = "^FFFFFF众神之双剑" , class = 65 , content = "^e76041众神之双剑", command = "d_cmd 2001 1355"}
CYCLOPAEDIA_DICT[727] = {keyword = "^FFFFFF众神之长剑" , class = 65 , content = "^e76041众神之长剑", command = "d_cmd 2001 1356"}
CYCLOPAEDIA_DICT[728] = {keyword = "^FFFFFF众神之结棍" , class = 65 , content = "^e76041众神之结棍", command = "d_cmd 2001 1357"}
CYCLOPAEDIA_DICT[729] = {keyword = "^FFFFFF众神之鞭子" , class = 65 , content = "^e76041众神之鞭子", command = "d_cmd 2001 1358"}
CYCLOPAEDIA_DICT[730] = {keyword = "^FFFFFF众神之双刃" , class = 65 , content = "^e76041众神之双刃", command = "d_cmd 2001 1359"}
CYCLOPAEDIA_DICT[731] = {keyword = "^FFFFFF众神之拳刃" , class = 65 , content = "^e76041众神之拳刃", command = "d_cmd 2001 1360"}
CYCLOPAEDIA_DICT[732] = {keyword = "^FFFFFF众神之法杖" , class = 65 , content = "^e76041众神之法杖", command = "d_cmd 2001 1361"}
CYCLOPAEDIA_DICT[733] = {keyword = "^FFFFFF众神之琴剑" , class = 65 , content = "^e76041众神之琴剑", command = "d_cmd 2001 1362"}
CYCLOPAEDIA_DICT[734] = {keyword = "^FFFFFF众神之扇子" , class = 65 , content = "^e76041众神之扇子", command = "d_cmd 2001 1363"}
CYCLOPAEDIA_DICT[735] = {keyword = "^FFFFFF众神之棉腕" , class = 65 , content = "^b981ff众神之棉腕", command = "d_cmd 2001 1364"}
CYCLOPAEDIA_DICT[736] = {keyword = "^FFFFFF众神之棉鞋" , class = 65 , content = "^b981ff众神之棉鞋", command = "d_cmd 2001 1365"}
CYCLOPAEDIA_DICT[737] = {keyword = "^FFFFFF众神之棉裤" , class = 65 , content = "^b981ff众神之棉裤", command = "d_cmd 2001 1366"}
CYCLOPAEDIA_DICT[738] = {keyword = "^FFFFFF众神之棉衣" , class = 65 , content = "^b981ff众神之棉衣", command = "d_cmd 2001 1367"}
CYCLOPAEDIA_DICT[739] = {keyword = "^FFFFFF众神之棉头" , class = 65 , content = "^b981ff众神之棉头", command = "d_cmd 2001 1368"}
CYCLOPAEDIA_DICT[740] = {keyword = "^FFFFFF众神之皮腕" , class = 65 , content = "^b981ff众神之皮腕", command = "d_cmd 2001 1369"}
CYCLOPAEDIA_DICT[741] = {keyword = "^FFFFFF众神之皮鞋" , class = 65 , content = "^b981ff众神之皮鞋", command = "d_cmd 2001 1370"}
CYCLOPAEDIA_DICT[742] = {keyword = "^FFFFFF众神之皮裤" , class = 65 , content = "^b981ff众神之皮裤", command = "d_cmd 2001 1371"}
CYCLOPAEDIA_DICT[743] = {keyword = "^FFFFFF众神之皮衣" , class = 65 , content = "^b981ff众神之皮衣", command = "d_cmd 2001 1372"}
CYCLOPAEDIA_DICT[744] = {keyword = "^FFFFFF众神之皮头" , class = 65 , content = "^b981ff众神之皮头", command = "d_cmd 2001 1373"}
CYCLOPAEDIA_DICT[745] = {keyword = "^FFFFFF众神之布腕" , class = 65 , content = "^b981ff众神之布腕", command = "d_cmd 2001 1374"}
CYCLOPAEDIA_DICT[746] = {keyword = "^FFFFFF众神之布鞋" , class = 65 , content = "^b981ff众神之布鞋", command = "d_cmd 2001 1375"}
CYCLOPAEDIA_DICT[747] = {keyword = "^FFFFFF众神之布裤" , class = 65 , content = "^b981ff众神之布裤", command = "d_cmd 2001 1376"}
CYCLOPAEDIA_DICT[748] = {keyword = "^FFFFFF众神之布衣" , class = 65 , content = "^b981ff众神之布衣", command = "d_cmd 2001 1377"}
CYCLOPAEDIA_DICT[749] = {keyword = "^FFFFFF众神之布头" , class = 65 , content = "^b981ff众神之布头", command = "d_cmd 2001 1378"}
CYCLOPAEDIA_DICT[750] = {keyword = "6月版本1级帽子" , class = 91 , content = "1级帽子", command = "d_cmd 2001 36379"}
CYCLOPAEDIA_DICT[751] = {keyword = "6月版本1级衣服" , class = 92 , content = "1级衣服", command = "d_cmd 2001 36391"}
CYCLOPAEDIA_DICT[752] = {keyword = "6月版本1级护腕" , class = 94 , content = "1级护腕", command = "d_cmd 2001 36403"}
CYCLOPAEDIA_DICT[753] = {keyword = "6月版本1级裤子" , class = 93 , content = "1级裤子", command = "d_cmd 2001 36415"}
CYCLOPAEDIA_DICT[754] = {keyword = "6月版本1级鞋子" , class = 95 , content = "1级鞋子", command = "d_cmd 2001 36427"}
CYCLOPAEDIA_DICT[755] = {keyword = "武当10级装备包" , class = 33 , content = "武当10级装备包", command = "d_cmd 2001 37436"}
CYCLOPAEDIA_DICT[756] = {keyword = "武当20级装备包" , class = 33 , content = "武当20级装备包", command = "d_cmd 2001 37437"}
CYCLOPAEDIA_DICT[757] = {keyword = "武当30级装备包" , class = 33 , content = "武当30级装备包", command = "d_cmd 2001 37438"}
CYCLOPAEDIA_DICT[758] = {keyword = "华山10级装备包" , class = 33 , content = "华山10级装备包", command = "d_cmd 2001 37439"}
CYCLOPAEDIA_DICT[759] = {keyword = "华山20级装备包" , class = 33 , content = "华山20级装备包", command = "d_cmd 2001 37440"}
CYCLOPAEDIA_DICT[760] = {keyword = "华山30级装备包" , class = 33 , content = "华山30级装备包", command = "d_cmd 2001 37441"}
CYCLOPAEDIA_DICT[761] = {keyword = "唐门10级装备包" , class = 33 , content = "唐门10级装备包", command = "d_cmd 2001 37442"}
CYCLOPAEDIA_DICT[762] = {keyword = "唐门20级装备包" , class = 33 , content = "唐门20级装备包", command = "d_cmd 2001 37443"}
CYCLOPAEDIA_DICT[763] = {keyword = "唐门30级装备包" , class = 33 , content = "唐门30级装备包", command = "d_cmd 2001 37444"}
CYCLOPAEDIA_DICT[764] = {keyword = "日月10级装备包" , class = 33 , content = "日月10级装备包", command = "d_cmd 2001 37445"}
CYCLOPAEDIA_DICT[765] = {keyword = "日月20级装备包" , class = 33 , content = "日月20级装备包", command = "d_cmd 2001 37446"}
CYCLOPAEDIA_DICT[766] = {keyword = "日月30级装备包" , class = 33 , content = "日月30级装备包", command = "d_cmd 2001 37447"}
CYCLOPAEDIA_DICT[767] = {keyword = "戒指装备包" , class = 33 , content = "戒指装备包", command = "d_cmd 2001 37455"}
CYCLOPAEDIA_DICT[768] = {keyword = "武器华山单剑2品白装" , class = 43 , content = "武器华山单剑2品白装", command = "d_cmd 2001 6254"}
CYCLOPAEDIA_DICT[769] = {keyword = "武器华山单剑2品蓝装" , class = 43 , content = "武器华山单剑2品蓝装", command = "d_cmd 2001 6255"}
CYCLOPAEDIA_DICT[770] = {keyword = "武器华山单剑2品紫装" , class = 43 , content = "武器华山单剑2品紫装", command = "d_cmd 2001 6256"}
CYCLOPAEDIA_DICT[771] = {keyword = "武器华山单剑2品黄装" , class = 43 , content = "武器华山单剑2品黄装", command = "d_cmd 2001 6257"}
CYCLOPAEDIA_DICT[772] = {keyword = "武器华山单剑2品任务蓝装" , class = 43 , content = "武器华山单剑2品任务蓝装", command = "d_cmd 2001 6258"}
CYCLOPAEDIA_DICT[773] = {keyword = "武器华山单剑2品任务紫装" , class = 43 , content = "武器华山单剑2品任务紫装", command = "d_cmd 2001 6259"}
CYCLOPAEDIA_DICT[774] = {keyword = "武器恒山双剑1品白装" , class = 44 , content = "武器恒山双剑1品白装", command = "d_cmd 2001 6260"}
CYCLOPAEDIA_DICT[775] = {keyword = "武器恒山双剑1品蓝装" , class = 44 , content = "武器恒山双剑1品蓝装", command = "d_cmd 2001 6261"}
CYCLOPAEDIA_DICT[776] = {keyword = "武器恒山双剑1品紫装" , class = 44 , content = "武器恒山双剑1品紫装", command = "d_cmd 2001 6262"}
CYCLOPAEDIA_DICT[777] = {keyword = "武器恒山双剑1品黄装" , class = 44 , content = "武器恒山双剑1品黄装", command = "d_cmd 2001 6263"}
CYCLOPAEDIA_DICT[778] = {keyword = "武器恒山双剑1品任务蓝装" , class = 44 , content = "武器恒山双剑1品任务蓝装", command = "d_cmd 2001 6264"}
CYCLOPAEDIA_DICT[779] = {keyword = "武器恒山双剑1品任务紫装" , class = 44 , content = "武器恒山双剑1品任务紫装", command = "d_cmd 2001 6265"}
CYCLOPAEDIA_DICT[780] = {keyword = "武器恒山双剑2品白装" , class = 44 , content = "武器恒山双剑2品白装", command = "d_cmd 2001 6266"}
CYCLOPAEDIA_DICT[781] = {keyword = "武器恒山双剑2品蓝装" , class = 44 , content = "武器恒山双剑2品蓝装", command = "d_cmd 2001 6267"}
CYCLOPAEDIA_DICT[782] = {keyword = "武器恒山双剑2品紫装" , class = 44 , content = "武器恒山双剑2品紫装", command = "d_cmd 2001 6268"}
CYCLOPAEDIA_DICT[783] = {keyword = "武器恒山双剑2品黄装" , class = 44 , content = "武器恒山双剑2品黄装", command = "d_cmd 2001 6269"}
CYCLOPAEDIA_DICT[784] = {keyword = "武器恒山双剑2品任务蓝装" , class = 44 , content = "武器恒山双剑2品任务蓝装", command = "d_cmd 2001 6270"}
CYCLOPAEDIA_DICT[785] = {keyword = "武器恒山双剑2品任务紫装" , class = 44 , content = "武器恒山双剑2品任务紫装", command = "d_cmd 2001 6271"}
CYCLOPAEDIA_DICT[786] = {keyword = "武器武当长剑1品白装" , class = 42 , content = "武器武当长剑1品白装", command = "d_cmd 2001 6272"}
CYCLOPAEDIA_DICT[787] = {keyword = "武器武当长剑1品蓝装" , class = 42 , content = "武器武当长剑1品蓝装", command = "d_cmd 2001 6273"}
CYCLOPAEDIA_DICT[788] = {keyword = "武器武当长剑1品紫装" , class = 42 , content = "武器武当长剑1品紫装", command = "d_cmd 2001 6274"}
CYCLOPAEDIA_DICT[789] = {keyword = "武器武当长剑1品黄装" , class = 42 , content = "武器武当长剑1品黄装", command = "d_cmd 2001 6275"}
CYCLOPAEDIA_DICT[790] = {keyword = "武器武当长剑1品任务蓝装" , class = 42 , content = "武器武当长剑1品任务蓝装", command = "d_cmd 2001 6276"}
CYCLOPAEDIA_DICT[791] = {keyword = "武器武当长剑1品任务紫装" , class = 42 , content = "武器武当长剑1品任务紫装", command = "d_cmd 2001 6277"}
CYCLOPAEDIA_DICT[792] = {keyword = "武器武当长剑2品白装" , class = 42 , content = "武器武当长剑2品白装", command = "d_cmd 2001 6278"}
CYCLOPAEDIA_DICT[793] = {keyword = "武器武当长剑2品蓝装" , class = 42 , content = "武器武当长剑2品蓝装", command = "d_cmd 2001 6279"}
CYCLOPAEDIA_DICT[794] = {keyword = "武器武当长剑2品紫装" , class = 42 , content = "武器武当长剑2品紫装", command = "d_cmd 2001 6280"}
CYCLOPAEDIA_DICT[795] = {keyword = "武器武当长剑2品黄装" , class = 42 , content = "武器武当长剑2品黄装", command = "d_cmd 2001 6281"}
CYCLOPAEDIA_DICT[796] = {keyword = "武器武当长剑2品任务蓝装" , class = 42 , content = "武器武当长剑2品任务蓝装", command = "d_cmd 2001 6282"}
CYCLOPAEDIA_DICT[797] = {keyword = "武器武当长剑2品任务紫装" , class = 42 , content = "武器武当长剑2品任务紫装", command = "d_cmd 2001 6283"}
CYCLOPAEDIA_DICT[798] = {keyword = "武器五仙鞭子1品白装" , class = 52 , content = "武器五仙鞭子1品白装", command = "d_cmd 2001 6284"}
CYCLOPAEDIA_DICT[799] = {keyword = "武器五仙鞭子1品蓝装" , class = 52 , content = "武器五仙鞭子1品蓝装", command = "d_cmd 2001 6285"}
CYCLOPAEDIA_DICT[800] = {keyword = "武器五仙鞭子1品紫装" , class = 52 , content = "武器五仙鞭子1品紫装", command = "d_cmd 2001 6286"}
CYCLOPAEDIA_DICT[801] = {keyword = "武器五仙鞭子1品黄装" , class = 52 , content = "武器五仙鞭子1品黄装", command = "d_cmd 2001 6287"}
CYCLOPAEDIA_DICT[802] = {keyword = "武器五仙鞭子1品任务蓝装" , class = 52 , content = "武器五仙鞭子1品任务蓝装", command = "d_cmd 2001 6288"}
CYCLOPAEDIA_DICT[803] = {keyword = "武器五仙鞭子1品任务紫装" , class = 52 , content = "武器五仙鞭子1品任务紫装", command = "d_cmd 2001 6289"}
CYCLOPAEDIA_DICT[804] = {keyword = "武器五仙鞭子2品白装" , class = 52 , content = "武器五仙鞭子2品白装", command = "d_cmd 2001 6290"}
CYCLOPAEDIA_DICT[805] = {keyword = "武器五仙鞭子2品蓝装" , class = 52 , content = "武器五仙鞭子2品蓝装", command = "d_cmd 2001 6291"}
CYCLOPAEDIA_DICT[806] = {keyword = "武器五仙鞭子2品紫装" , class = 52 , content = "武器五仙鞭子2品紫装", command = "d_cmd 2001 6292"}
CYCLOPAEDIA_DICT[807] = {keyword = "武器五仙鞭子2品黄装" , class = 52 , content = "武器五仙鞭子2品黄装", command = "d_cmd 2001 6293"}
CYCLOPAEDIA_DICT[808] = {keyword = "武器五仙鞭子2品任务蓝装" , class = 52 , content = "武器五仙鞭子2品任务蓝装", command = "d_cmd 2001 6294"}
CYCLOPAEDIA_DICT[809] = {keyword = "武器五仙鞭子2品任务紫装" , class = 52 , content = "武器五仙鞭子2品任务紫装", command = "d_cmd 2001 6295"}
CYCLOPAEDIA_DICT[810] = {keyword = "武器日月双刃1品白装" , class = 51 , content = "武器日月双刃1品白装", command = "d_cmd 2001 6296"}
CYCLOPAEDIA_DICT[811] = {keyword = "武器日月双刃1品蓝装" , class = 51 , content = "武器日月双刃1品蓝装", command = "d_cmd 2001 6297"}
CYCLOPAEDIA_DICT[812] = {keyword = "武器日月双刃1品紫装" , class = 51 , content = "武器日月双刃1品紫装", command = "d_cmd 2001 6298"}
CYCLOPAEDIA_DICT[813] = {keyword = "武器日月双刃1品黄装" , class = 51 , content = "武器日月双刃1品黄装", command = "d_cmd 2001 6299"}
CYCLOPAEDIA_DICT[814] = {keyword = "武器日月双刃1品任务蓝装" , class = 51 , content = "武器日月双刃1品任务蓝装", command = "d_cmd 2001 6300"}
CYCLOPAEDIA_DICT[815] = {keyword = "武器日月双刃1品任务紫装" , class = 51 , content = "武器日月双刃1品任务紫装", command = "d_cmd 2001 6301"}
CYCLOPAEDIA_DICT[816] = {keyword = "武器日月双刃2品白装" , class = 51 , content = "武器日月双刃2品白装", command = "d_cmd 2001 6302"}
CYCLOPAEDIA_DICT[817] = {keyword = "武器日月双刃2品蓝装" , class = 51 , content = "武器日月双刃2品蓝装", command = "d_cmd 2001 6303"}
CYCLOPAEDIA_DICT[818] = {keyword = "武器日月双刃2品紫装" , class = 51 , content = "武器日月双刃2品紫装", command = "d_cmd 2001 6304"}
CYCLOPAEDIA_DICT[819] = {keyword = "武器日月双刃2品黄装" , class = 51 , content = "武器日月双刃2品黄装", command = "d_cmd 2001 6305"}
CYCLOPAEDIA_DICT[820] = {keyword = "武器日月双刃2品任务蓝装" , class = 51 , content = "武器日月双刃2品任务蓝装", command = "d_cmd 2001 6306"}
CYCLOPAEDIA_DICT[821] = {keyword = "武器日月双刃2品任务紫装" , class = 51 , content = "武器日月双刃2品任务紫装", command = "d_cmd 2001 6307"}
CYCLOPAEDIA_DICT[822] = {keyword = "武器唐门拳刃1品白装" , class = 54 , content = "武器唐门拳刃1品白装", command = "d_cmd 2001 6308"}
CYCLOPAEDIA_DICT[823] = {keyword = "武器唐门拳刃1品蓝装" , class = 54 , content = "武器唐门拳刃1品蓝装", command = "d_cmd 2001 6309"}
CYCLOPAEDIA_DICT[824] = {keyword = "武器唐门拳刃1品紫装" , class = 54 , content = "武器唐门拳刃1品紫装", command = "d_cmd 2001 6310"}
CYCLOPAEDIA_DICT[825] = {keyword = "武器唐门拳刃1品黄装" , class = 54 , content = "武器唐门拳刃1品黄装", command = "d_cmd 2001 6311"}
CYCLOPAEDIA_DICT[826] = {keyword = "武器唐门拳刃1品任务蓝装" , class = 54 , content = "武器唐门拳刃1品任务蓝装", command = "d_cmd 2001 6312"}
CYCLOPAEDIA_DICT[827] = {keyword = "武器唐门拳刃1品任务紫装" , class = 54 , content = "武器唐门拳刃1品任务紫装", command = "d_cmd 2001 6313"}
CYCLOPAEDIA_DICT[828] = {keyword = "武器唐门拳刃2品白装" , class = 54 , content = "武器唐门拳刃2品白装", command = "d_cmd 2001 6314"}
CYCLOPAEDIA_DICT[829] = {keyword = "武器唐门拳刃2品蓝装" , class = 54 , content = "武器唐门拳刃2品蓝装", command = "d_cmd 2001 6315"}
CYCLOPAEDIA_DICT[830] = {keyword = "武器唐门拳刃2品紫装" , class = 54 , content = "武器唐门拳刃2品紫装", command = "d_cmd 2001 6316"}
CYCLOPAEDIA_DICT[831] = {keyword = "武器唐门拳刃2品黄装" , class = 54 , content = "武器唐门拳刃2品黄装", command = "d_cmd 2001 6317"}
CYCLOPAEDIA_DICT[832] = {keyword = "武器唐门拳刃2品任务蓝装" , class = 54 , content = "武器唐门拳刃2品任务蓝装", command = "d_cmd 2001 6318"}
CYCLOPAEDIA_DICT[833] = {keyword = "武器唐门拳刃2品任务紫装" , class = 54 , content = "武器唐门拳刃2品任务紫装", command = "d_cmd 2001 6319"}
CYCLOPAEDIA_DICT[834] = {keyword = "武器峨眉法杖1品白装" , class = 55 , content = "武器峨眉法杖1品白装", command = "d_cmd 2001 6320"}
CYCLOPAEDIA_DICT[835] = {keyword = "武器峨眉法杖1品蓝装" , class = 55 , content = "武器峨眉法杖1品蓝装", command = "d_cmd 2001 6321"}
CYCLOPAEDIA_DICT[836] = {keyword = "武器峨眉法杖1品紫装" , class = 55 , content = "武器峨眉法杖1品紫装", command = "d_cmd 2001 6322"}
CYCLOPAEDIA_DICT[837] = {keyword = "武器峨眉法杖1品黄装" , class = 55 , content = "武器峨眉法杖1品黄装", command = "d_cmd 2001 6323"}
CYCLOPAEDIA_DICT[838] = {keyword = "武器峨眉法杖1品任务蓝装" , class = 55 , content = "武器峨眉法杖1品任务蓝装", command = "d_cmd 2001 6324"}
CYCLOPAEDIA_DICT[839] = {keyword = "武器峨眉法杖1品任务紫装" , class = 55 , content = "武器峨眉法杖1品任务紫装", command = "d_cmd 2001 6325"}
CYCLOPAEDIA_DICT[840] = {keyword = "武器峨眉法杖2品白装" , class = 55 , content = "武器峨眉法杖2品白装", command = "d_cmd 2001 6326"}
CYCLOPAEDIA_DICT[841] = {keyword = "武器峨眉法杖2品蓝装" , class = 55 , content = "武器峨眉法杖2品蓝装", command = "d_cmd 2001 6327"}
CYCLOPAEDIA_DICT[842] = {keyword = "武器峨眉法杖2品紫装" , class = 55 , content = "武器峨眉法杖2品紫装", command = "d_cmd 2001 6328"}
CYCLOPAEDIA_DICT[843] = {keyword = "武器峨眉法杖2品黄装" , class = 55 , content = "武器峨眉法杖2品黄装", command = "d_cmd 2001 6329"}
CYCLOPAEDIA_DICT[844] = {keyword = "武器峨眉法杖2品任务蓝装" , class = 55 , content = "武器峨眉法杖2品任务蓝装", command = "d_cmd 2001 6330"}
CYCLOPAEDIA_DICT[845] = {keyword = "武器峨眉法杖2品任务紫装" , class = 55 , content = "武器峨眉法杖2品任务紫装", command = "d_cmd 2001 6331"}
CYCLOPAEDIA_DICT[846] = {keyword = "武器衡山琴剑1品白装" , class = 45 , content = "武器衡山琴剑1品白装", command = "d_cmd 2001 6332"}
CYCLOPAEDIA_DICT[847] = {keyword = "武器衡山琴剑1品蓝装" , class = 45 , content = "武器衡山琴剑1品蓝装", command = "d_cmd 2001 6333"}
CYCLOPAEDIA_DICT[848] = {keyword = "武器衡山琴剑1品紫装" , class = 45 , content = "武器衡山琴剑1品紫装", command = "d_cmd 2001 6334"}
CYCLOPAEDIA_DICT[849] = {keyword = "武器衡山琴剑1品黄装" , class = 45 , content = "武器衡山琴剑1品黄装", command = "d_cmd 2001 6335"}
CYCLOPAEDIA_DICT[850] = {keyword = "武器衡山琴剑1品任务蓝装" , class = 45 , content = "武器衡山琴剑1品任务蓝装", command = "d_cmd 2001 6336"}
CYCLOPAEDIA_DICT[851] = {keyword = "武器衡山琴剑1品任务紫装" , class = 45 , content = "武器衡山琴剑1品任务紫装", command = "d_cmd 2001 6337"}
CYCLOPAEDIA_DICT[852] = {keyword = "武器衡山琴剑2品白装" , class = 45 , content = "武器衡山琴剑2品白装", command = "d_cmd 2001 6338"}
CYCLOPAEDIA_DICT[853] = {keyword = "武器衡山琴剑2品蓝装" , class = 45 , content = "武器衡山琴剑2品蓝装", command = "d_cmd 2001 6339"}
CYCLOPAEDIA_DICT[854] = {keyword = "武器衡山琴剑2品紫装" , class = 45 , content = "武器衡山琴剑2品紫装", command = "d_cmd 2001 6340"}
CYCLOPAEDIA_DICT[855] = {keyword = "武器衡山琴剑2品黄装" , class = 45 , content = "武器衡山琴剑2品黄装", command = "d_cmd 2001 6341"}
CYCLOPAEDIA_DICT[856] = {keyword = "武器衡山琴剑2品任务蓝装" , class = 45 , content = "武器衡山琴剑2品任务蓝装", command = "d_cmd 2001 6342"}
CYCLOPAEDIA_DICT[857] = {keyword = "武器衡山琴剑2品任务紫装" , class = 45 , content = "武器衡山琴剑2品任务紫装", command = "d_cmd 2001 6343"}
CYCLOPAEDIA_DICT[858] = {keyword = "武器逍遥扇子1品白装" , class = 53 , content = "武器逍遥扇子1品白装", command = "d_cmd 2001 6344"}
CYCLOPAEDIA_DICT[859] = {keyword = "武器逍遥扇子1品蓝装" , class = 53 , content = "武器逍遥扇子1品蓝装", command = "d_cmd 2001 6345"}
CYCLOPAEDIA_DICT[860] = {keyword = "武器逍遥扇子1品紫装" , class = 53 , content = "武器逍遥扇子1品紫装", command = "d_cmd 2001 6346"}
CYCLOPAEDIA_DICT[861] = {keyword = "武器逍遥扇子1品黄装" , class = 53 , content = "武器逍遥扇子1品黄装", command = "d_cmd 2001 6347"}
CYCLOPAEDIA_DICT[862] = {keyword = "武器逍遥扇子1品任务蓝装" , class = 53 , content = "武器逍遥扇子1品任务蓝装", command = "d_cmd 2001 6348"}
CYCLOPAEDIA_DICT[863] = {keyword = "武器逍遥扇子1品任务紫装" , class = 53 , content = "武器逍遥扇子1品任务紫装", command = "d_cmd 2001 6349"}
CYCLOPAEDIA_DICT[864] = {keyword = "武器逍遥扇子2品白装" , class = 53 , content = "武器逍遥扇子2品白装", command = "d_cmd 2001 6350"}
CYCLOPAEDIA_DICT[865] = {keyword = "武器逍遥扇子2品蓝装" , class = 53 , content = "武器逍遥扇子2品蓝装", command = "d_cmd 2001 6351"}
CYCLOPAEDIA_DICT[866] = {keyword = "武器逍遥扇子2品紫装" , class = 53 , content = "武器逍遥扇子2品紫装", command = "d_cmd 2001 6352"}
CYCLOPAEDIA_DICT[867] = {keyword = "武器逍遥扇子2品黄装" , class = 53 , content = "武器逍遥扇子2品黄装", command = "d_cmd 2001 6353"}
CYCLOPAEDIA_DICT[868] = {keyword = "武器逍遥扇子2品任务蓝装" , class = 53 , content = "武器逍遥扇子2品任务蓝装", command = "d_cmd 2001 6354"}
CYCLOPAEDIA_DICT[869] = {keyword = "武器逍遥扇子2品任务紫装" , class = 53 , content = "武器逍遥扇子2品任务紫装", command = "d_cmd 2001 6355"}
CYCLOPAEDIA_DICT[870] = {keyword = "棉甲通用护腕1品白装" , class = 84 , content = "棉甲通用护腕1品白装", command = "d_cmd 2001 6356"}
CYCLOPAEDIA_DICT[871] = {keyword = "棉甲通用护腕1品蓝装" , class = 84 , content = "棉甲通用护腕1品蓝装", command = "d_cmd 2001 6357"}
CYCLOPAEDIA_DICT[872] = {keyword = "棉甲通用护腕1品紫装" , class = 84 , content = "棉甲通用护腕1品紫装", command = "d_cmd 2001 6358"}
CYCLOPAEDIA_DICT[873] = {keyword = "棉甲通用护腕1品黄装" , class = 84 , content = "棉甲通用护腕1品黄装", command = "d_cmd 2001 6359"}
CYCLOPAEDIA_DICT[874] = {keyword = "棉甲通用护腕1品任务蓝装" , class = 84 , content = "棉甲通用护腕1品任务蓝装", command = "d_cmd 2001 6360"}
CYCLOPAEDIA_DICT[875] = {keyword = "棉甲通用护腕1品任务紫装" , class = 84 , content = "棉甲通用护腕1品任务紫装", command = "d_cmd 2001 6361"}
CYCLOPAEDIA_DICT[876] = {keyword = "棉甲通用护腕2品白装" , class = 84 , content = "棉甲通用护腕2品白装", command = "d_cmd 2001 6362"}
CYCLOPAEDIA_DICT[877] = {keyword = "棉甲通用护腕2品蓝装" , class = 84 , content = "棉甲通用护腕2品蓝装", command = "d_cmd 2001 6363"}
CYCLOPAEDIA_DICT[878] = {keyword = "棉甲通用护腕2品紫装" , class = 84 , content = "棉甲通用护腕2品紫装", command = "d_cmd 2001 6364"}
CYCLOPAEDIA_DICT[879] = {keyword = "棉甲通用护腕2品黄装" , class = 84 , content = "棉甲通用护腕2品黄装", command = "d_cmd 2001 6365"}
CYCLOPAEDIA_DICT[880] = {keyword = "棉甲通用护腕2品任务蓝装" , class = 84 , content = "棉甲通用护腕2品任务蓝装", command = "d_cmd 2001 6366"}
CYCLOPAEDIA_DICT[881] = {keyword = "棉甲通用护腕2品任务紫装" , class = 84 , content = "棉甲通用护腕2品任务紫装", command = "d_cmd 2001 6367"}
CYCLOPAEDIA_DICT[882] = {keyword = "棉甲通用裤子1品白装" , class = 83 , content = "棉甲通用裤子1品白装", command = "d_cmd 2001 6368"}
CYCLOPAEDIA_DICT[883] = {keyword = "棉甲通用裤子1品蓝装" , class = 83 , content = "棉甲通用裤子1品蓝装", command = "d_cmd 2001 6369"}
CYCLOPAEDIA_DICT[884] = {keyword = "棉甲通用裤子1品紫装" , class = 83 , content = "棉甲通用裤子1品紫装", command = "d_cmd 2001 6370"}
CYCLOPAEDIA_DICT[885] = {keyword = "棉甲通用裤子1品黄装" , class = 83 , content = "棉甲通用裤子1品黄装", command = "d_cmd 2001 6371"}
CYCLOPAEDIA_DICT[886] = {keyword = "棉甲通用裤子1品任务蓝装" , class = 83 , content = "棉甲通用裤子1品任务蓝装", command = "d_cmd 2001 6372"}
CYCLOPAEDIA_DICT[887] = {keyword = "棉甲通用裤子1品任务紫装" , class = 83 , content = "棉甲通用裤子1品任务紫装", command = "d_cmd 2001 6373"}
CYCLOPAEDIA_DICT[888] = {keyword = "棉甲通用裤子2品白装" , class = 83 , content = "棉甲通用裤子2品白装", command = "d_cmd 2001 6374"}
CYCLOPAEDIA_DICT[889] = {keyword = "棉甲通用裤子2品蓝装" , class = 83 , content = "棉甲通用裤子2品蓝装", command = "d_cmd 2001 6375"}
CYCLOPAEDIA_DICT[890] = {keyword = "棉甲通用裤子2品紫装" , class = 83 , content = "棉甲通用裤子2品紫装", command = "d_cmd 2001 6376"}
CYCLOPAEDIA_DICT[891] = {keyword = "棉甲通用裤子2品黄装" , class = 83 , content = "棉甲通用裤子2品黄装", command = "d_cmd 2001 6377"}
CYCLOPAEDIA_DICT[892] = {keyword = "棉甲通用裤子2品任务蓝装" , class = 83 , content = "棉甲通用裤子2品任务蓝装", command = "d_cmd 2001 6378"}
CYCLOPAEDIA_DICT[893] = {keyword = "棉甲通用裤子2品任务紫装" , class = 83 , content = "棉甲通用裤子2品任务紫装", command = "d_cmd 2001 6379"}
CYCLOPAEDIA_DICT[894] = {keyword = "棉甲通用上衣1品白装" , class = 82 , content = "棉甲通用上衣1品白装", command = "d_cmd 2001 6380"}
CYCLOPAEDIA_DICT[895] = {keyword = "棉甲通用上衣1品蓝装" , class = 82 , content = "棉甲通用上衣1品蓝装", command = "d_cmd 2001 6381"}
CYCLOPAEDIA_DICT[896] = {keyword = "棉甲通用上衣1品紫装" , class = 82 , content = "棉甲通用上衣1品紫装", command = "d_cmd 2001 6382"}
CYCLOPAEDIA_DICT[897] = {keyword = "棉甲通用上衣1品黄装" , class = 82 , content = "棉甲通用上衣1品黄装", command = "d_cmd 2001 6383"}
CYCLOPAEDIA_DICT[898] = {keyword = "棉甲通用上衣1品任务蓝装" , class = 82 , content = "棉甲通用上衣1品任务蓝装", command = "d_cmd 2001 6384"}
CYCLOPAEDIA_DICT[899] = {keyword = "棉甲通用上衣1品任务紫装" , class = 82 , content = "棉甲通用上衣1品任务紫装", command = "d_cmd 2001 6385"}
CYCLOPAEDIA_DICT[900] = {keyword = "棉甲通用上衣2品白装" , class = 82 , content = "棉甲通用上衣2品白装", command = "d_cmd 2001 6386"}
CYCLOPAEDIA_DICT[901] = {keyword = "棉甲通用上衣2品蓝装" , class = 82 , content = "棉甲通用上衣2品蓝装", command = "d_cmd 2001 6387"}
CYCLOPAEDIA_DICT[902] = {keyword = "棉甲通用上衣2品紫装" , class = 82 , content = "棉甲通用上衣2品紫装", command = "d_cmd 2001 6388"}
CYCLOPAEDIA_DICT[903] = {keyword = "棉甲通用上衣2品黄装" , class = 82 , content = "棉甲通用上衣2品黄装", command = "d_cmd 2001 6389"}
CYCLOPAEDIA_DICT[904] = {keyword = "棉甲通用上衣2品任务蓝装" , class = 82 , content = "棉甲通用上衣2品任务蓝装", command = "d_cmd 2001 6390"}
CYCLOPAEDIA_DICT[905] = {keyword = "棉甲通用上衣2品任务紫装" , class = 82 , content = "棉甲通用上衣2品任务紫装", command = "d_cmd 2001 6391"}
CYCLOPAEDIA_DICT[906] = {keyword = "棉甲通用头部1品白装" , class = 81 , content = "棉甲通用头部1品白装", command = "d_cmd 2001 6392"}
CYCLOPAEDIA_DICT[907] = {keyword = "棉甲通用头部1品蓝装" , class = 81 , content = "棉甲通用头部1品蓝装", command = "d_cmd 2001 6393"}
CYCLOPAEDIA_DICT[908] = {keyword = "棉甲通用头部1品紫装" , class = 81 , content = "棉甲通用头部1品紫装", command = "d_cmd 2001 6394"}
CYCLOPAEDIA_DICT[909] = {keyword = "棉甲通用头部1品黄装" , class = 81 , content = "棉甲通用头部1品黄装", command = "d_cmd 2001 6395"}
CYCLOPAEDIA_DICT[910] = {keyword = "棉甲通用头部1品任务蓝装" , class = 81 , content = "棉甲通用头部1品任务蓝装", command = "d_cmd 2001 6396"}
CYCLOPAEDIA_DICT[911] = {keyword = "棉甲通用头部1品任务紫装" , class = 81 , content = "棉甲通用头部1品任务紫装", command = "d_cmd 2001 6397"}
CYCLOPAEDIA_DICT[912] = {keyword = "棉甲通用头部2品白装" , class = 81 , content = "棉甲通用头部2品白装", command = "d_cmd 2001 6398"}
CYCLOPAEDIA_DICT[913] = {keyword = "棉甲通用头部2品蓝装" , class = 81 , content = "棉甲通用头部2品蓝装", command = "d_cmd 2001 6399"}
CYCLOPAEDIA_DICT[914] = {keyword = "棉甲通用头部2品紫装" , class = 81 , content = "棉甲通用头部2品紫装", command = "d_cmd 2001 6400"}
CYCLOPAEDIA_DICT[915] = {keyword = "棉甲通用头部2品黄装" , class = 81 , content = "棉甲通用头部2品黄装", command = "d_cmd 2001 6401"}
CYCLOPAEDIA_DICT[916] = {keyword = "棉甲通用头部2品任务蓝装" , class = 81 , content = "棉甲通用头部2品任务蓝装", command = "d_cmd 2001 6402"}
CYCLOPAEDIA_DICT[917] = {keyword = "棉甲通用头部2品任务紫装" , class = 81 , content = "棉甲通用头部2品任务紫装", command = "d_cmd 2001 6403"}
CYCLOPAEDIA_DICT[918] = {keyword = "皮甲通用护腕1品白装" , class = 94 , content = "皮甲通用护腕1品白装", command = "d_cmd 2001 6404"}
CYCLOPAEDIA_DICT[919] = {keyword = "皮甲通用护腕1品蓝装" , class = 94 , content = "皮甲通用护腕1品蓝装", command = "d_cmd 2001 6405"}
CYCLOPAEDIA_DICT[920] = {keyword = "皮甲通用护腕1品紫装" , class = 94 , content = "皮甲通用护腕1品紫装", command = "d_cmd 2001 6406"}
CYCLOPAEDIA_DICT[921] = {keyword = "皮甲通用护腕1品黄装" , class = 94 , content = "皮甲通用护腕1品黄装", command = "d_cmd 2001 6407"}
CYCLOPAEDIA_DICT[922] = {keyword = "皮甲通用护腕1品任务蓝装" , class = 94 , content = "皮甲通用护腕1品任务蓝装", command = "d_cmd 2001 6408"}
CYCLOPAEDIA_DICT[923] = {keyword = "皮甲通用护腕1品任务紫装" , class = 94 , content = "皮甲通用护腕1品任务紫装", command = "d_cmd 2001 6409"}
CYCLOPAEDIA_DICT[924] = {keyword = "皮甲通用护腕2品白装" , class = 94 , content = "皮甲通用护腕2品白装", command = "d_cmd 2001 6410"}
CYCLOPAEDIA_DICT[925] = {keyword = "皮甲通用护腕2品蓝装" , class = 94 , content = "皮甲通用护腕2品蓝装", command = "d_cmd 2001 6411"}
CYCLOPAEDIA_DICT[926] = {keyword = "皮甲通用护腕2品紫装" , class = 94 , content = "皮甲通用护腕2品紫装", command = "d_cmd 2001 6412"}
CYCLOPAEDIA_DICT[927] = {keyword = "皮甲通用护腕2品黄装" , class = 94 , content = "皮甲通用护腕2品黄装", command = "d_cmd 2001 6413"}
CYCLOPAEDIA_DICT[928] = {keyword = "皮甲通用护腕2品任务蓝装" , class = 94 , content = "皮甲通用护腕2品任务蓝装", command = "d_cmd 2001 6414"}
CYCLOPAEDIA_DICT[929] = {keyword = "皮甲通用护腕2品任务紫装" , class = 94 , content = "皮甲通用护腕2品任务紫装", command = "d_cmd 2001 6415"}
CYCLOPAEDIA_DICT[930] = {keyword = "皮甲通用裤子1品白装" , class = 93 , content = "皮甲通用裤子1品白装", command = "d_cmd 2001 6416"}
CYCLOPAEDIA_DICT[931] = {keyword = "皮甲通用裤子1品蓝装" , class = 93 , content = "皮甲通用裤子1品蓝装", command = "d_cmd 2001 6417"}
CYCLOPAEDIA_DICT[932] = {keyword = "皮甲通用裤子1品紫装" , class = 93 , content = "皮甲通用裤子1品紫装", command = "d_cmd 2001 6418"}
CYCLOPAEDIA_DICT[933] = {keyword = "皮甲通用裤子1品黄装" , class = 93 , content = "皮甲通用裤子1品黄装", command = "d_cmd 2001 6419"}
CYCLOPAEDIA_DICT[934] = {keyword = "皮甲通用裤子1品任务蓝装" , class = 93 , content = "皮甲通用裤子1品任务蓝装", command = "d_cmd 2001 6420"}
CYCLOPAEDIA_DICT[935] = {keyword = "皮甲通用裤子1品任务紫装" , class = 93 , content = "皮甲通用裤子1品任务紫装", command = "d_cmd 2001 6421"}
CYCLOPAEDIA_DICT[936] = {keyword = "皮甲通用裤子2品白装" , class = 93 , content = "皮甲通用裤子2品白装", command = "d_cmd 2001 6422"}
CYCLOPAEDIA_DICT[937] = {keyword = "皮甲通用裤子2品蓝装" , class = 93 , content = "皮甲通用裤子2品蓝装", command = "d_cmd 2001 6423"}
CYCLOPAEDIA_DICT[938] = {keyword = "皮甲通用裤子2品紫装" , class = 93 , content = "皮甲通用裤子2品紫装", command = "d_cmd 2001 6424"}
CYCLOPAEDIA_DICT[939] = {keyword = "皮甲通用裤子2品黄装" , class = 93 , content = "皮甲通用裤子2品黄装", command = "d_cmd 2001 6425"}
CYCLOPAEDIA_DICT[940] = {keyword = "皮甲通用裤子2品任务蓝装" , class = 93 , content = "皮甲通用裤子2品任务蓝装", command = "d_cmd 2001 6426"}
CYCLOPAEDIA_DICT[941] = {keyword = "皮甲通用裤子2品任务紫装" , class = 93 , content = "皮甲通用裤子2品任务紫装", command = "d_cmd 2001 6427"}
CYCLOPAEDIA_DICT[942] = {keyword = "皮甲通用上衣1品白装" , class = 92 , content = "皮甲通用上衣1品白装", command = "d_cmd 2001 6428"}
CYCLOPAEDIA_DICT[943] = {keyword = "皮甲通用上衣1品蓝装" , class = 92 , content = "皮甲通用上衣1品蓝装", command = "d_cmd 2001 6429"}
CYCLOPAEDIA_DICT[944] = {keyword = "皮甲通用上衣1品紫装" , class = 92 , content = "皮甲通用上衣1品紫装", command = "d_cmd 2001 6430"}
CYCLOPAEDIA_DICT[945] = {keyword = "皮甲通用上衣1品黄装" , class = 92 , content = "皮甲通用上衣1品黄装", command = "d_cmd 2001 6431"}
CYCLOPAEDIA_DICT[946] = {keyword = "皮甲通用上衣1品任务蓝装" , class = 92 , content = "皮甲通用上衣1品任务蓝装", command = "d_cmd 2001 6432"}
CYCLOPAEDIA_DICT[947] = {keyword = "皮甲通用上衣1品任务紫装" , class = 92 , content = "皮甲通用上衣1品任务紫装", command = "d_cmd 2001 6433"}
CYCLOPAEDIA_DICT[948] = {keyword = "皮甲通用上衣2品白装" , class = 92 , content = "皮甲通用上衣2品白装", command = "d_cmd 2001 6434"}
CYCLOPAEDIA_DICT[949] = {keyword = "皮甲通用上衣2品蓝装" , class = 92 , content = "皮甲通用上衣2品蓝装", command = "d_cmd 2001 6435"}
CYCLOPAEDIA_DICT[950] = {keyword = "皮甲通用上衣2品紫装" , class = 92 , content = "皮甲通用上衣2品紫装", command = "d_cmd 2001 6436"}
CYCLOPAEDIA_DICT[951] = {keyword = "皮甲通用上衣2品黄装" , class = 92 , content = "皮甲通用上衣2品黄装", command = "d_cmd 2001 6437"}
CYCLOPAEDIA_DICT[952] = {keyword = "皮甲通用上衣2品任务蓝装" , class = 92 , content = "皮甲通用上衣2品任务蓝装", command = "d_cmd 2001 6438"}
CYCLOPAEDIA_DICT[953] = {keyword = "皮甲通用上衣2品任务紫装" , class = 92 , content = "皮甲通用上衣2品任务紫装", command = "d_cmd 2001 6439"}
CYCLOPAEDIA_DICT[954] = {keyword = "皮甲通用头部1品白装" , class = 91 , content = "皮甲通用头部1品白装", command = "d_cmd 2001 6440"}
CYCLOPAEDIA_DICT[955] = {keyword = "皮甲通用头部1品蓝装" , class = 91 , content = "皮甲通用头部1品蓝装", command = "d_cmd 2001 6441"}
CYCLOPAEDIA_DICT[956] = {keyword = "皮甲通用头部1品紫装" , class = 91 , content = "皮甲通用头部1品紫装", command = "d_cmd 2001 6442"}
CYCLOPAEDIA_DICT[957] = {keyword = "皮甲通用头部1品黄装" , class = 91 , content = "皮甲通用头部1品黄装", command = "d_cmd 2001 6443"}
CYCLOPAEDIA_DICT[958] = {keyword = "皮甲通用头部1品任务蓝装" , class = 91 , content = "皮甲通用头部1品任务蓝装", command = "d_cmd 2001 6444"}
CYCLOPAEDIA_DICT[959] = {keyword = "皮甲通用头部1品任务紫装" , class = 91 , content = "皮甲通用头部1品任务紫装", command = "d_cmd 2001 6445"}
CYCLOPAEDIA_DICT[960] = {keyword = "皮甲通用头部2品白装" , class = 91 , content = "皮甲通用头部2品白装", command = "d_cmd 2001 6446"}
CYCLOPAEDIA_DICT[961] = {keyword = "皮甲通用头部2品蓝装" , class = 91 , content = "皮甲通用头部2品蓝装", command = "d_cmd 2001 6447"}
CYCLOPAEDIA_DICT[962] = {keyword = "皮甲通用头部2品紫装" , class = 91 , content = "皮甲通用头部2品紫装", command = "d_cmd 2001 6448"}
CYCLOPAEDIA_DICT[963] = {keyword = "皮甲通用头部2品黄装" , class = 91 , content = "皮甲通用头部2品黄装", command = "d_cmd 2001 6449"}
CYCLOPAEDIA_DICT[964] = {keyword = "皮甲通用头部2品任务蓝装" , class = 91 , content = "皮甲通用头部2品任务蓝装", command = "d_cmd 2001 6450"}
CYCLOPAEDIA_DICT[965] = {keyword = "皮甲通用头部2品任务紫装" , class = 91 , content = "皮甲通用头部2品任务紫装", command = "d_cmd 2001 6451"}
CYCLOPAEDIA_DICT[966] = {keyword = "布衣通用护腕1品白装" , class = 74 , content = "布衣通用护腕1品白装", command = "d_cmd 2001 6452"}
CYCLOPAEDIA_DICT[967] = {keyword = "布衣通用护腕1品蓝装" , class = 74 , content = "布衣通用护腕1品蓝装", command = "d_cmd 2001 6453"}
CYCLOPAEDIA_DICT[968] = {keyword = "布衣通用护腕1品紫装" , class = 74 , content = "布衣通用护腕1品紫装", command = "d_cmd 2001 6454"}
CYCLOPAEDIA_DICT[969] = {keyword = "布衣通用护腕1品黄装" , class = 74 , content = "布衣通用护腕1品黄装", command = "d_cmd 2001 6455"}
CYCLOPAEDIA_DICT[970] = {keyword = "布衣通用护腕1品任务蓝装" , class = 74 , content = "布衣通用护腕1品任务蓝装", command = "d_cmd 2001 6456"}
CYCLOPAEDIA_DICT[971] = {keyword = "布衣通用护腕1品任务紫装" , class = 74 , content = "布衣通用护腕1品任务紫装", command = "d_cmd 2001 6457"}
CYCLOPAEDIA_DICT[972] = {keyword = "布衣通用护腕2品白装" , class = 74 , content = "布衣通用护腕2品白装", command = "d_cmd 2001 6458"}
CYCLOPAEDIA_DICT[973] = {keyword = "布衣通用护腕2品蓝装" , class = 74 , content = "布衣通用护腕2品蓝装", command = "d_cmd 2001 6459"}
CYCLOPAEDIA_DICT[974] = {keyword = "布衣通用护腕2品紫装" , class = 74 , content = "布衣通用护腕2品紫装", command = "d_cmd 2001 6460"}
CYCLOPAEDIA_DICT[975] = {keyword = "布衣通用护腕2品黄装" , class = 74 , content = "布衣通用护腕2品黄装", command = "d_cmd 2001 6461"}
CYCLOPAEDIA_DICT[976] = {keyword = "布衣通用护腕2品任务蓝装" , class = 74 , content = "布衣通用护腕2品任务蓝装", command = "d_cmd 2001 6462"}
CYCLOPAEDIA_DICT[977] = {keyword = "布衣通用护腕2品任务紫装" , class = 74 , content = "布衣通用护腕2品任务紫装", command = "d_cmd 2001 6463"}
CYCLOPAEDIA_DICT[978] = {keyword = "布衣通用裤子1品白装" , class = 73 , content = "布衣通用裤子1品白装", command = "d_cmd 2001 6464"}
CYCLOPAEDIA_DICT[979] = {keyword = "布衣通用裤子1品蓝装" , class = 73 , content = "布衣通用裤子1品蓝装", command = "d_cmd 2001 6465"}
CYCLOPAEDIA_DICT[980] = {keyword = "布衣通用裤子1品紫装" , class = 73 , content = "布衣通用裤子1品紫装", command = "d_cmd 2001 6466"}
CYCLOPAEDIA_DICT[981] = {keyword = "布衣通用裤子1品黄装" , class = 73 , content = "布衣通用裤子1品黄装", command = "d_cmd 2001 6467"}
CYCLOPAEDIA_DICT[982] = {keyword = "布衣通用裤子1品任务蓝装" , class = 73 , content = "布衣通用裤子1品任务蓝装", command = "d_cmd 2001 6468"}
CYCLOPAEDIA_DICT[983] = {keyword = "布衣通用裤子1品任务紫装" , class = 73 , content = "布衣通用裤子1品任务紫装", command = "d_cmd 2001 6469"}
CYCLOPAEDIA_DICT[984] = {keyword = "布衣通用裤子2品白装" , class = 73 , content = "布衣通用裤子2品白装", command = "d_cmd 2001 6470"}
CYCLOPAEDIA_DICT[985] = {keyword = "布衣通用裤子2品蓝装" , class = 73 , content = "布衣通用裤子2品蓝装", command = "d_cmd 2001 6471"}
CYCLOPAEDIA_DICT[986] = {keyword = "布衣通用裤子2品紫装" , class = 73 , content = "布衣通用裤子2品紫装", command = "d_cmd 2001 6472"}
CYCLOPAEDIA_DICT[987] = {keyword = "布衣通用裤子2品黄装" , class = 73 , content = "布衣通用裤子2品黄装", command = "d_cmd 2001 6473"}
CYCLOPAEDIA_DICT[988] = {keyword = "布衣通用裤子2品任务蓝装" , class = 73 , content = "布衣通用裤子2品任务蓝装", command = "d_cmd 2001 6474"}
CYCLOPAEDIA_DICT[989] = {keyword = "布衣通用裤子2品任务紫装" , class = 73 , content = "布衣通用裤子2品任务紫装", command = "d_cmd 2001 6475"}
CYCLOPAEDIA_DICT[990] = {keyword = "布衣通用上衣1品白装" , class = 72 , content = "布衣通用上衣1品白装", command = "d_cmd 2001 6476"}
CYCLOPAEDIA_DICT[991] = {keyword = "布衣通用上衣1品蓝装" , class = 72 , content = "布衣通用上衣1品蓝装", command = "d_cmd 2001 6477"}
CYCLOPAEDIA_DICT[992] = {keyword = "布衣通用上衣1品紫装" , class = 72 , content = "布衣通用上衣1品紫装", command = "d_cmd 2001 6478"}
CYCLOPAEDIA_DICT[993] = {keyword = "布衣通用上衣1品黄装" , class = 72 , content = "布衣通用上衣1品黄装", command = "d_cmd 2001 6479"}
CYCLOPAEDIA_DICT[994] = {keyword = "布衣通用上衣1品任务蓝装" , class = 72 , content = "布衣通用上衣1品任务蓝装", command = "d_cmd 2001 6480"}
CYCLOPAEDIA_DICT[995] = {keyword = "布衣通用上衣1品任务紫装" , class = 72 , content = "布衣通用上衣1品任务紫装", command = "d_cmd 2001 6481"}
CYCLOPAEDIA_DICT[996] = {keyword = "布衣通用上衣2品白装" , class = 72 , content = "布衣通用上衣2品白装", command = "d_cmd 2001 6482"}
CYCLOPAEDIA_DICT[997] = {keyword = "布衣通用上衣2品蓝装" , class = 72 , content = "布衣通用上衣2品蓝装", command = "d_cmd 2001 6483"}
CYCLOPAEDIA_DICT[998] = {keyword = "布衣通用上衣2品紫装" , class = 72 , content = "布衣通用上衣2品紫装", command = "d_cmd 2001 6484"}
CYCLOPAEDIA_DICT[999] = {keyword = "布衣通用上衣2品黄装" , class = 72 , content = "布衣通用上衣2品黄装", command = "d_cmd 2001 6485"}
CYCLOPAEDIA_DICT[1000] = {keyword = "布衣通用上衣2品任务蓝装" , class = 72 , content = "布衣通用上衣2品任务蓝装", command = "d_cmd 2001 6486"}
CYCLOPAEDIA_DICT[1001] = {keyword = "布衣通用上衣2品任务紫装" , class = 72 , content = "布衣通用上衣2品任务紫装", command = "d_cmd 2001 6487"}
CYCLOPAEDIA_DICT[1002] = {keyword = "布衣通用头部1品白装" , class = 71 , content = "布衣通用头部1品白装", command = "d_cmd 2001 6488"}
CYCLOPAEDIA_DICT[1003] = {keyword = "布衣通用头部1品蓝装" , class = 71 , content = "布衣通用头部1品蓝装", command = "d_cmd 2001 6489"}
CYCLOPAEDIA_DICT[1004] = {keyword = "布衣通用头部1品紫装" , class = 71 , content = "布衣通用头部1品紫装", command = "d_cmd 2001 6490"}
CYCLOPAEDIA_DICT[1005] = {keyword = "布衣通用头部1品黄装" , class = 71 , content = "布衣通用头部1品黄装", command = "d_cmd 2001 6491"}
CYCLOPAEDIA_DICT[1006] = {keyword = "布衣通用头部1品任务蓝装" , class = 71 , content = "布衣通用头部1品任务蓝装", command = "d_cmd 2001 6492"}
CYCLOPAEDIA_DICT[1007] = {keyword = "布衣通用头部1品任务紫装" , class = 71 , content = "布衣通用头部1品任务紫装", command = "d_cmd 2001 6493"}
CYCLOPAEDIA_DICT[1008] = {keyword = "布衣通用头部2品白装" , class = 71 , content = "布衣通用头部2品白装", command = "d_cmd 2001 6494"}
CYCLOPAEDIA_DICT[1009] = {keyword = "布衣通用头部2品蓝装" , class = 71 , content = "布衣通用头部2品蓝装", command = "d_cmd 2001 6495"}
CYCLOPAEDIA_DICT[1010] = {keyword = "布衣通用头部2品紫装" , class = 71 , content = "布衣通用头部2品紫装", command = "d_cmd 2001 6496"}
CYCLOPAEDIA_DICT[1011] = {keyword = "布衣通用头部2品黄装" , class = 71 , content = "布衣通用头部2品黄装", command = "d_cmd 2001 6497"}
CYCLOPAEDIA_DICT[1012] = {keyword = "布衣通用头部2品任务蓝装" , class = 71 , content = "布衣通用头部2品任务蓝装", command = "d_cmd 2001 6498"}
CYCLOPAEDIA_DICT[1013] = {keyword = "布衣通用头部2品任务紫装" , class = 71 , content = "布衣通用头部2品任务紫装", command = "d_cmd 2001 6499"}
CYCLOPAEDIA_DICT[1014] = {keyword = "棉甲通用鞋子1品白装" , class = 85 , content = "棉甲通用鞋子1品白装", command = "d_cmd 2001 6500"}
CYCLOPAEDIA_DICT[1015] = {keyword = "棉甲通用鞋子1品蓝装" , class = 85 , content = "棉甲通用鞋子1品蓝装", command = "d_cmd 2001 6501"}
CYCLOPAEDIA_DICT[1016] = {keyword = "棉甲通用鞋子1品紫装" , class = 85 , content = "棉甲通用鞋子1品紫装", command = "d_cmd 2001 6502"}
CYCLOPAEDIA_DICT[1017] = {keyword = "棉甲通用鞋子1品黄装" , class = 85 , content = "棉甲通用鞋子1品黄装", command = "d_cmd 2001 6503"}
CYCLOPAEDIA_DICT[1018] = {keyword = "棉甲通用鞋子1品任务蓝装" , class = 85 , content = "棉甲通用鞋子1品任务蓝装", command = "d_cmd 2001 6504"}
CYCLOPAEDIA_DICT[1019] = {keyword = "棉甲通用鞋子1品任务紫装" , class = 85 , content = "棉甲通用鞋子1品任务紫装", command = "d_cmd 2001 6505"}
CYCLOPAEDIA_DICT[1020] = {keyword = "棉甲通用鞋子2品白装" , class = 85 , content = "棉甲通用鞋子2品白装", command = "d_cmd 2001 6506"}
CYCLOPAEDIA_DICT[1021] = {keyword = "棉甲通用鞋子2品蓝装" , class = 85 , content = "棉甲通用鞋子2品蓝装", command = "d_cmd 2001 6507"}
CYCLOPAEDIA_DICT[1022] = {keyword = "棉甲通用鞋子2品紫装" , class = 85 , content = "棉甲通用鞋子2品紫装", command = "d_cmd 2001 6508"}
CYCLOPAEDIA_DICT[1023] = {keyword = "棉甲通用鞋子2品黄装" , class = 85 , content = "棉甲通用鞋子2品黄装", command = "d_cmd 2001 6509"}
CYCLOPAEDIA_DICT[1024] = {keyword = "棉甲通用鞋子2品任务蓝装" , class = 85 , content = "棉甲通用鞋子2品任务蓝装", command = "d_cmd 2001 6510"}
CYCLOPAEDIA_DICT[1025] = {keyword = "棉甲通用鞋子2品任务紫装" , class = 85 , content = "棉甲通用鞋子2品任务紫装", command = "d_cmd 2001 6511"}
CYCLOPAEDIA_DICT[1026] = {keyword = "皮甲通用鞋子1品白装" , class = 95 , content = "皮甲通用鞋子1品白装", command = "d_cmd 2001 6512"}
CYCLOPAEDIA_DICT[1027] = {keyword = "皮甲通用鞋子1品蓝装" , class = 95 , content = "皮甲通用鞋子1品蓝装", command = "d_cmd 2001 6513"}
CYCLOPAEDIA_DICT[1028] = {keyword = "皮甲通用鞋子1品紫装" , class = 95 , content = "皮甲通用鞋子1品紫装", command = "d_cmd 2001 6514"}
CYCLOPAEDIA_DICT[1029] = {keyword = "皮甲通用鞋子1品黄装" , class = 95 , content = "皮甲通用鞋子1品黄装", command = "d_cmd 2001 6515"}
CYCLOPAEDIA_DICT[1030] = {keyword = "皮甲通用鞋子1品任务蓝装" , class = 95 , content = "皮甲通用鞋子1品任务蓝装", command = "d_cmd 2001 6516"}
CYCLOPAEDIA_DICT[1031] = {keyword = "皮甲通用鞋子1品任务紫装" , class = 95 , content = "皮甲通用鞋子1品任务紫装", command = "d_cmd 2001 6517"}
CYCLOPAEDIA_DICT[1032] = {keyword = "皮甲通用鞋子2品白装" , class = 95 , content = "皮甲通用鞋子2品白装", command = "d_cmd 2001 6518"}
CYCLOPAEDIA_DICT[1033] = {keyword = "皮甲通用鞋子2品蓝装" , class = 95 , content = "皮甲通用鞋子2品蓝装", command = "d_cmd 2001 6519"}
CYCLOPAEDIA_DICT[1034] = {keyword = "皮甲通用鞋子2品紫装" , class = 95 , content = "皮甲通用鞋子2品紫装", command = "d_cmd 2001 6520"}
CYCLOPAEDIA_DICT[1035] = {keyword = "皮甲通用鞋子2品黄装" , class = 95 , content = "皮甲通用鞋子2品黄装", command = "d_cmd 2001 6521"}
CYCLOPAEDIA_DICT[1036] = {keyword = "皮甲通用鞋子2品任务蓝装" , class = 95 , content = "皮甲通用鞋子2品任务蓝装", command = "d_cmd 2001 6522"}
CYCLOPAEDIA_DICT[1037] = {keyword = "皮甲通用鞋子2品任务紫装" , class = 95 , content = "皮甲通用鞋子2品任务紫装", command = "d_cmd 2001 6523"}
CYCLOPAEDIA_DICT[1038] = {keyword = "布衣通用鞋子1品白装" , class = 75 , content = "布衣通用鞋子1品白装", command = "d_cmd 2001 6524"}
CYCLOPAEDIA_DICT[1039] = {keyword = "布衣通用鞋子1品蓝装" , class = 75 , content = "布衣通用鞋子1品蓝装", command = "d_cmd 2001 6525"}
CYCLOPAEDIA_DICT[1040] = {keyword = "布衣通用鞋子1品紫装" , class = 75 , content = "布衣通用鞋子1品紫装", command = "d_cmd 2001 6526"}
CYCLOPAEDIA_DICT[1041] = {keyword = "布衣通用鞋子1品黄装" , class = 75 , content = "布衣通用鞋子1品黄装", command = "d_cmd 2001 6527"}
CYCLOPAEDIA_DICT[1042] = {keyword = "布衣通用鞋子1品任务蓝装" , class = 75 , content = "布衣通用鞋子1品任务蓝装", command = "d_cmd 2001 6528"}
CYCLOPAEDIA_DICT[1043] = {keyword = "布衣通用鞋子1品任务紫装" , class = 75 , content = "布衣通用鞋子1品任务紫装", command = "d_cmd 2001 6529"}
CYCLOPAEDIA_DICT[1044] = {keyword = "布衣通用鞋子2品白装" , class = 75 , content = "布衣通用鞋子2品白装", command = "d_cmd 2001 6530"}
CYCLOPAEDIA_DICT[1045] = {keyword = "布衣通用鞋子2品蓝装" , class = 75 , content = "布衣通用鞋子2品蓝装", command = "d_cmd 2001 6531"}
CYCLOPAEDIA_DICT[1046] = {keyword = "布衣通用鞋子2品紫装" , class = 75 , content = "布衣通用鞋子2品紫装", command = "d_cmd 2001 6532"}
CYCLOPAEDIA_DICT[1047] = {keyword = "布衣通用鞋子2品黄装" , class = 75 , content = "布衣通用鞋子2品黄装", command = "d_cmd 2001 6533"}
CYCLOPAEDIA_DICT[1048] = {keyword = "布衣通用鞋子2品任务蓝装" , class = 75 , content = "布衣通用鞋子2品任务蓝装", command = "d_cmd 2001 6534"}
CYCLOPAEDIA_DICT[1049] = {keyword = "布衣通用鞋子2品任务紫装" , class = 75 , content = "布衣通用鞋子2品任务紫装", command = "d_cmd 2001 6535"}
CYCLOPAEDIA_DICT[1050] = {keyword = "武器少林结棍3品白装" , class = 41 , content = "武器少林结棍3品白装", command = "d_cmd 2001 10223"}
CYCLOPAEDIA_DICT[1051] = {keyword = "武器少林结棍3品蓝装" , class = 41 , content = "武器少林结棍3品蓝装", command = "d_cmd 2001 10224"}
CYCLOPAEDIA_DICT[1052] = {keyword = "武器少林结棍3品紫装" , class = 41 , content = "武器少林结棍3品紫装", command = "d_cmd 2001 10225"}
CYCLOPAEDIA_DICT[1053] = {keyword = "武器少林结棍3品黄装" , class = 41 , content = "武器少林结棍3品黄装", command = "d_cmd 2001 10226"}
CYCLOPAEDIA_DICT[1054] = {keyword = "武器少林结棍3品任务蓝装" , class = 41 , content = "武器少林结棍3品任务蓝装", command = "d_cmd 2001 10227"}
CYCLOPAEDIA_DICT[1055] = {keyword = "武器少林结棍3品任务紫装" , class = 41 , content = "武器少林结棍3品任务紫装", command = "d_cmd 2001 10228"}
CYCLOPAEDIA_DICT[1056] = {keyword = "武器武当长剑3品白装" , class = 42 , content = "武器武当长剑3品白装", command = "d_cmd 2001 10229"}
CYCLOPAEDIA_DICT[1057] = {keyword = "武器武当长剑3品蓝装" , class = 42 , content = "武器武当长剑3品蓝装", command = "d_cmd 2001 10230"}
CYCLOPAEDIA_DICT[1058] = {keyword = "武器武当长剑3品紫装" , class = 42 , content = "武器武当长剑3品紫装", command = "d_cmd 2001 10231"}
CYCLOPAEDIA_DICT[1059] = {keyword = "武器武当长剑3品黄装" , class = 42 , content = "武器武当长剑3品黄装", command = "d_cmd 2001 10232"}
CYCLOPAEDIA_DICT[1060] = {keyword = "武器武当长剑3品任务蓝装" , class = 42 , content = "武器武当长剑3品任务蓝装", command = "d_cmd 2001 10233"}
CYCLOPAEDIA_DICT[1061] = {keyword = "武器武当长剑3品任务紫装" , class = 42 , content = "武器武当长剑3品任务紫装", command = "d_cmd 2001 10234"}
CYCLOPAEDIA_DICT[1062] = {keyword = "武器华山单剑3品白装" , class = 43 , content = "武器华山单剑3品白装", command = "d_cmd 2001 10235"}
CYCLOPAEDIA_DICT[1063] = {keyword = "武器华山单剑3品蓝装" , class = 43 , content = "武器华山单剑3品蓝装", command = "d_cmd 2001 10236"}
CYCLOPAEDIA_DICT[1064] = {keyword = "武器华山单剑3品紫装" , class = 43 , content = "武器华山单剑3品紫装", command = "d_cmd 2001 10237"}
CYCLOPAEDIA_DICT[1065] = {keyword = "武器华山单剑3品黄装" , class = 43 , content = "武器华山单剑3品黄装", command = "d_cmd 2001 10238"}
CYCLOPAEDIA_DICT[1066] = {keyword = "武器华山单剑3品任务蓝装" , class = 43 , content = "武器华山单剑3品任务蓝装", command = "d_cmd 2001 10239"}
CYCLOPAEDIA_DICT[1067] = {keyword = "武器华山单剑3品任务紫装" , class = 43 , content = "武器华山单剑3品任务紫装", command = "d_cmd 2001 10240"}
CYCLOPAEDIA_DICT[1068] = {keyword = "武器恒山双剑3品白装" , class = 44 , content = "武器恒山双剑3品白装", command = "d_cmd 2001 10241"}
CYCLOPAEDIA_DICT[1069] = {keyword = "武器恒山双剑3品蓝装" , class = 44 , content = "武器恒山双剑3品蓝装", command = "d_cmd 2001 10242"}
CYCLOPAEDIA_DICT[1070] = {keyword = "武器恒山双剑3品紫装" , class = 44 , content = "武器恒山双剑3品紫装", command = "d_cmd 2001 10243"}
CYCLOPAEDIA_DICT[1071] = {keyword = "武器恒山双剑3品黄装" , class = 44 , content = "武器恒山双剑3品黄装", command = "d_cmd 2001 10244"}
CYCLOPAEDIA_DICT[1072] = {keyword = "武器恒山双剑3品任务蓝装" , class = 44 , content = "武器恒山双剑3品任务蓝装", command = "d_cmd 2001 10245"}
CYCLOPAEDIA_DICT[1073] = {keyword = "武器恒山双剑3品任务紫装" , class = 44 , content = "武器恒山双剑3品任务紫装", command = "d_cmd 2001 10246"}
CYCLOPAEDIA_DICT[1074] = {keyword = "武器衡山琴剑3品白装" , class = 45 , content = "武器衡山琴剑3品白装", command = "d_cmd 2001 10247"}
CYCLOPAEDIA_DICT[1075] = {keyword = "武器衡山琴剑3品蓝装" , class = 45 , content = "武器衡山琴剑3品蓝装", command = "d_cmd 2001 10248"}
CYCLOPAEDIA_DICT[1076] = {keyword = "武器衡山琴剑3品紫装" , class = 45 , content = "武器衡山琴剑3品紫装", command = "d_cmd 2001 10249"}
CYCLOPAEDIA_DICT[1077] = {keyword = "武器衡山琴剑3品黄装" , class = 45 , content = "武器衡山琴剑3品黄装", command = "d_cmd 2001 10250"}
CYCLOPAEDIA_DICT[1078] = {keyword = "武器衡山琴剑3品任务蓝装" , class = 45 , content = "武器衡山琴剑3品任务蓝装", command = "d_cmd 2001 10251"}
CYCLOPAEDIA_DICT[1079] = {keyword = "武器衡山琴剑3品任务紫装" , class = 45 , content = "武器衡山琴剑3品任务紫装", command = "d_cmd 2001 10252"}
CYCLOPAEDIA_DICT[1080] = {keyword = "武器日月双刃3品白装" , class = 51 , content = "武器日月双刃3品白装", command = "d_cmd 2001 10253"}
CYCLOPAEDIA_DICT[1081] = {keyword = "武器日月双刃3品蓝装" , class = 51 , content = "武器日月双刃3品蓝装", command = "d_cmd 2001 10254"}
CYCLOPAEDIA_DICT[1082] = {keyword = "武器日月双刃3品紫装" , class = 51 , content = "武器日月双刃3品紫装", command = "d_cmd 2001 10255"}
CYCLOPAEDIA_DICT[1083] = {keyword = "武器日月双刃3品黄装" , class = 51 , content = "武器日月双刃3品黄装", command = "d_cmd 2001 10256"}
CYCLOPAEDIA_DICT[1084] = {keyword = "武器日月双刃3品任务蓝装" , class = 51 , content = "武器日月双刃3品任务蓝装", command = "d_cmd 2001 10257"}
CYCLOPAEDIA_DICT[1085] = {keyword = "武器日月双刃3品任务紫装" , class = 51 , content = "武器日月双刃3品任务紫装", command = "d_cmd 2001 10258"}
CYCLOPAEDIA_DICT[1086] = {keyword = "武器五仙鞭子3品白装" , class = 52 , content = "武器五仙鞭子3品白装", command = "d_cmd 2001 10259"}
CYCLOPAEDIA_DICT[1087] = {keyword = "武器五仙鞭子3品蓝装" , class = 52 , content = "武器五仙鞭子3品蓝装", command = "d_cmd 2001 10260"}
CYCLOPAEDIA_DICT[1088] = {keyword = "武器五仙鞭子3品紫装" , class = 52 , content = "武器五仙鞭子3品紫装", command = "d_cmd 2001 10261"}
CYCLOPAEDIA_DICT[1089] = {keyword = "武器五仙鞭子3品黄装" , class = 52 , content = "武器五仙鞭子3品黄装", command = "d_cmd 2001 10262"}
CYCLOPAEDIA_DICT[1090] = {keyword = "武器五仙鞭子3品任务蓝装" , class = 52 , content = "武器五仙鞭子3品任务蓝装", command = "d_cmd 2001 10263"}
CYCLOPAEDIA_DICT[1091] = {keyword = "武器五仙鞭子3品任务紫装" , class = 52 , content = "武器五仙鞭子3品任务紫装", command = "d_cmd 2001 10264"}
CYCLOPAEDIA_DICT[1092] = {keyword = "武器逍遥扇子3品白装" , class = 53 , content = "武器逍遥扇子3品白装", command = "d_cmd 2001 10265"}
CYCLOPAEDIA_DICT[1093] = {keyword = "武器逍遥扇子3品蓝装" , class = 53 , content = "武器逍遥扇子3品蓝装", command = "d_cmd 2001 10266"}
CYCLOPAEDIA_DICT[1094] = {keyword = "武器逍遥扇子3品紫装" , class = 53 , content = "武器逍遥扇子3品紫装", command = "d_cmd 2001 10267"}
CYCLOPAEDIA_DICT[1095] = {keyword = "武器逍遥扇子3品黄装" , class = 53 , content = "武器逍遥扇子3品黄装", command = "d_cmd 2001 10268"}
CYCLOPAEDIA_DICT[1096] = {keyword = "武器逍遥扇子3品任务蓝装" , class = 53 , content = "武器逍遥扇子3品任务蓝装", command = "d_cmd 2001 10269"}
CYCLOPAEDIA_DICT[1097] = {keyword = "武器逍遥扇子3品任务紫装" , class = 53 , content = "武器逍遥扇子3品任务紫装", command = "d_cmd 2001 10270"}
CYCLOPAEDIA_DICT[1098] = {keyword = "武器唐门拳刃3品白装" , class = 54 , content = "武器唐门拳刃3品白装", command = "d_cmd 2001 10271"}
CYCLOPAEDIA_DICT[1099] = {keyword = "武器唐门拳刃3品蓝装" , class = 54 , content = "武器唐门拳刃3品蓝装", command = "d_cmd 2001 10272"}
CYCLOPAEDIA_DICT[1100] = {keyword = "武器唐门拳刃3品紫装" , class = 54 , content = "武器唐门拳刃3品紫装", command = "d_cmd 2001 10273"}
CYCLOPAEDIA_DICT[1101] = {keyword = "武器唐门拳刃3品黄装" , class = 54 , content = "武器唐门拳刃3品黄装", command = "d_cmd 2001 10274"}
CYCLOPAEDIA_DICT[1102] = {keyword = "武器唐门拳刃3品任务蓝装" , class = 54 , content = "武器唐门拳刃3品任务蓝装", command = "d_cmd 2001 10275"}
CYCLOPAEDIA_DICT[1103] = {keyword = "武器唐门拳刃3品任务紫装" , class = 54 , content = "武器唐门拳刃3品任务紫装", command = "d_cmd 2001 10276"}
CYCLOPAEDIA_DICT[1104] = {keyword = "武器峨眉法杖3品白装" , class = 55 , content = "武器峨眉法杖3品白装", command = "d_cmd 2001 10277"}
CYCLOPAEDIA_DICT[1105] = {keyword = "武器峨眉法杖3品蓝装" , class = 55 , content = "武器峨眉法杖3品蓝装", command = "d_cmd 2001 10278"}
CYCLOPAEDIA_DICT[1106] = {keyword = "武器峨眉法杖3品紫装" , class = 55 , content = "武器峨眉法杖3品紫装", command = "d_cmd 2001 10279"}
CYCLOPAEDIA_DICT[1107] = {keyword = "武器峨眉法杖3品黄装" , class = 55 , content = "武器峨眉法杖3品黄装", command = "d_cmd 2001 10280"}
CYCLOPAEDIA_DICT[1108] = {keyword = "武器峨眉法杖3品任务蓝装" , class = 55 , content = "武器峨眉法杖3品任务蓝装", command = "d_cmd 2001 10281"}
CYCLOPAEDIA_DICT[1109] = {keyword = "武器峨眉法杖3品任务紫装" , class = 55 , content = "武器峨眉法杖3品任务紫装", command = "d_cmd 2001 10282"}
CYCLOPAEDIA_DICT[1110] = {keyword = "布衣通用头部3品白装" , class = 71 , content = "布衣通用头部3品白装", command = "d_cmd 2001 10283"}
CYCLOPAEDIA_DICT[1111] = {keyword = "布衣通用头部3品蓝装" , class = 71 , content = "布衣通用头部3品蓝装", command = "d_cmd 2001 10284"}
CYCLOPAEDIA_DICT[1112] = {keyword = "布衣通用头部3品紫装" , class = 71 , content = "布衣通用头部3品紫装", command = "d_cmd 2001 10285"}
CYCLOPAEDIA_DICT[1113] = {keyword = "布衣通用头部3品黄装" , class = 71 , content = "布衣通用头部3品黄装", command = "d_cmd 2001 10286"}
CYCLOPAEDIA_DICT[1114] = {keyword = "布衣通用头部3品任务蓝装" , class = 71 , content = "布衣通用头部3品任务蓝装", command = "d_cmd 2001 10287"}
CYCLOPAEDIA_DICT[1115] = {keyword = "布衣通用头部3品任务紫装" , class = 71 , content = "布衣通用头部3品任务紫装", command = "d_cmd 2001 10288"}
CYCLOPAEDIA_DICT[1116] = {keyword = "布衣通用上衣3品白装" , class = 72 , content = "布衣通用上衣3品白装", command = "d_cmd 2001 10289"}
CYCLOPAEDIA_DICT[1117] = {keyword = "布衣通用上衣3品蓝装" , class = 72 , content = "布衣通用上衣3品蓝装", command = "d_cmd 2001 10290"}
CYCLOPAEDIA_DICT[1118] = {keyword = "布衣通用上衣3品紫装" , class = 72 , content = "布衣通用上衣3品紫装", command = "d_cmd 2001 10291"}
CYCLOPAEDIA_DICT[1119] = {keyword = "布衣通用上衣3品黄装" , class = 72 , content = "布衣通用上衣3品黄装", command = "d_cmd 2001 10292"}
CYCLOPAEDIA_DICT[1120] = {keyword = "布衣通用上衣3品任务蓝装" , class = 72 , content = "布衣通用上衣3品任务蓝装", command = "d_cmd 2001 10293"}
CYCLOPAEDIA_DICT[1121] = {keyword = "布衣通用上衣3品任务紫装" , class = 72 , content = "布衣通用上衣3品任务紫装", command = "d_cmd 2001 10294"}
CYCLOPAEDIA_DICT[1122] = {keyword = "布衣通用裤子3品白装" , class = 73 , content = "布衣通用裤子3品白装", command = "d_cmd 2001 10295"}
CYCLOPAEDIA_DICT[1123] = {keyword = "布衣通用裤子3品蓝装" , class = 73 , content = "布衣通用裤子3品蓝装", command = "d_cmd 2001 10296"}
CYCLOPAEDIA_DICT[1124] = {keyword = "布衣通用裤子3品紫装" , class = 73 , content = "布衣通用裤子3品紫装", command = "d_cmd 2001 10297"}
CYCLOPAEDIA_DICT[1125] = {keyword = "布衣通用裤子3品黄装" , class = 73 , content = "布衣通用裤子3品黄装", command = "d_cmd 2001 10298"}
CYCLOPAEDIA_DICT[1126] = {keyword = "布衣通用裤子3品任务蓝装" , class = 73 , content = "布衣通用裤子3品任务蓝装", command = "d_cmd 2001 10299"}
CYCLOPAEDIA_DICT[1127] = {keyword = "布衣通用裤子3品任务紫装" , class = 73 , content = "布衣通用裤子3品任务紫装", command = "d_cmd 2001 10300"}
CYCLOPAEDIA_DICT[1128] = {keyword = "布衣通用鞋子3品白装" , class = 75 , content = "布衣通用鞋子3品白装", command = "d_cmd 2001 10301"}
CYCLOPAEDIA_DICT[1129] = {keyword = "布衣通用鞋子3品蓝装" , class = 75 , content = "布衣通用鞋子3品蓝装", command = "d_cmd 2001 10302"}
CYCLOPAEDIA_DICT[1130] = {keyword = "布衣通用鞋子3品紫装" , class = 75 , content = "布衣通用鞋子3品紫装", command = "d_cmd 2001 10303"}
CYCLOPAEDIA_DICT[1131] = {keyword = "布衣通用鞋子3品黄装" , class = 75 , content = "布衣通用鞋子3品黄装", command = "d_cmd 2001 10304"}
CYCLOPAEDIA_DICT[1132] = {keyword = "布衣通用鞋子3品任务蓝装" , class = 75 , content = "布衣通用鞋子3品任务蓝装", command = "d_cmd 2001 10305"}
CYCLOPAEDIA_DICT[1133] = {keyword = "布衣通用鞋子3品任务紫装" , class = 75 , content = "布衣通用鞋子3品任务紫装", command = "d_cmd 2001 10306"}
CYCLOPAEDIA_DICT[1134] = {keyword = "布衣通用护腕3品白装" , class = 74 , content = "布衣通用护腕3品白装", command = "d_cmd 2001 10307"}
CYCLOPAEDIA_DICT[1135] = {keyword = "布衣通用护腕3品蓝装" , class = 74 , content = "布衣通用护腕3品蓝装", command = "d_cmd 2001 10308"}
CYCLOPAEDIA_DICT[1136] = {keyword = "布衣通用护腕3品紫装" , class = 74 , content = "布衣通用护腕3品紫装", command = "d_cmd 2001 10309"}
CYCLOPAEDIA_DICT[1137] = {keyword = "布衣通用护腕3品黄装" , class = 74 , content = "布衣通用护腕3品黄装", command = "d_cmd 2001 10310"}
CYCLOPAEDIA_DICT[1138] = {keyword = "布衣通用护腕3品任务蓝装" , class = 74 , content = "布衣通用护腕3品任务蓝装", command = "d_cmd 2001 10311"}
CYCLOPAEDIA_DICT[1139] = {keyword = "布衣通用护腕3品任务紫装" , class = 74 , content = "布衣通用护腕3品任务紫装", command = "d_cmd 2001 10312"}
CYCLOPAEDIA_DICT[1140] = {keyword = "棉甲通用头部3品白装" , class = 81 , content = "棉甲通用头部3品白装", command = "d_cmd 2001 10313"}
CYCLOPAEDIA_DICT[1141] = {keyword = "棉甲通用头部3品蓝装" , class = 81 , content = "棉甲通用头部3品蓝装", command = "d_cmd 2001 10314"}
CYCLOPAEDIA_DICT[1142] = {keyword = "棉甲通用头部3品紫装" , class = 81 , content = "棉甲通用头部3品紫装", command = "d_cmd 2001 10315"}
CYCLOPAEDIA_DICT[1143] = {keyword = "棉甲通用头部3品黄装" , class = 81 , content = "棉甲通用头部3品黄装", command = "d_cmd 2001 10316"}
CYCLOPAEDIA_DICT[1144] = {keyword = "棉甲通用头部3品任务蓝装" , class = 81 , content = "棉甲通用头部3品任务蓝装", command = "d_cmd 2001 10317"}
CYCLOPAEDIA_DICT[1145] = {keyword = "棉甲通用头部3品任务紫装" , class = 81 , content = "棉甲通用头部3品任务紫装", command = "d_cmd 2001 10318"}
CYCLOPAEDIA_DICT[1146] = {keyword = "棉甲通用上衣3品白装" , class = 82 , content = "棉甲通用上衣3品白装", command = "d_cmd 2001 10319"}
CYCLOPAEDIA_DICT[1147] = {keyword = "棉甲通用上衣3品蓝装" , class = 82 , content = "棉甲通用上衣3品蓝装", command = "d_cmd 2001 10320"}
CYCLOPAEDIA_DICT[1148] = {keyword = "棉甲通用上衣3品紫装" , class = 82 , content = "棉甲通用上衣3品紫装", command = "d_cmd 2001 10321"}
CYCLOPAEDIA_DICT[1149] = {keyword = "棉甲通用上衣3品黄装" , class = 82 , content = "棉甲通用上衣3品黄装", command = "d_cmd 2001 10322"}
CYCLOPAEDIA_DICT[1150] = {keyword = "棉甲通用上衣3品任务蓝装" , class = 82 , content = "棉甲通用上衣3品任务蓝装", command = "d_cmd 2001 10323"}
CYCLOPAEDIA_DICT[1151] = {keyword = "棉甲通用上衣3品任务紫装" , class = 82 , content = "棉甲通用上衣3品任务紫装", command = "d_cmd 2001 10324"}
CYCLOPAEDIA_DICT[1152] = {keyword = "棉甲通用裤子3品白装" , class = 83 , content = "棉甲通用裤子3品白装", command = "d_cmd 2001 10325"}
CYCLOPAEDIA_DICT[1153] = {keyword = "棉甲通用裤子3品蓝装" , class = 83 , content = "棉甲通用裤子3品蓝装", command = "d_cmd 2001 10326"}
CYCLOPAEDIA_DICT[1154] = {keyword = "棉甲通用裤子3品紫装" , class = 83 , content = "棉甲通用裤子3品紫装", command = "d_cmd 2001 10327"}
CYCLOPAEDIA_DICT[1155] = {keyword = "棉甲通用裤子3品黄装" , class = 83 , content = "棉甲通用裤子3品黄装", command = "d_cmd 2001 10328"}
CYCLOPAEDIA_DICT[1156] = {keyword = "棉甲通用裤子3品任务蓝装" , class = 83 , content = "棉甲通用裤子3品任务蓝装", command = "d_cmd 2001 10329"}
CYCLOPAEDIA_DICT[1157] = {keyword = "棉甲通用裤子3品任务紫装" , class = 83 , content = "棉甲通用裤子3品任务紫装", command = "d_cmd 2001 10330"}
CYCLOPAEDIA_DICT[1158] = {keyword = "棉甲通用鞋子3品白装" , class = 85 , content = "棉甲通用鞋子3品白装", command = "d_cmd 2001 10331"}
CYCLOPAEDIA_DICT[1159] = {keyword = "棉甲通用鞋子3品蓝装" , class = 85 , content = "棉甲通用鞋子3品蓝装", command = "d_cmd 2001 10332"}
CYCLOPAEDIA_DICT[1160] = {keyword = "棉甲通用鞋子3品紫装" , class = 85 , content = "棉甲通用鞋子3品紫装", command = "d_cmd 2001 10333"}
CYCLOPAEDIA_DICT[1161] = {keyword = "棉甲通用鞋子3品黄装" , class = 85 , content = "棉甲通用鞋子3品黄装", command = "d_cmd 2001 10334"}
CYCLOPAEDIA_DICT[1162] = {keyword = "棉甲通用鞋子3品任务蓝装" , class = 85 , content = "棉甲通用鞋子3品任务蓝装", command = "d_cmd 2001 10335"}
CYCLOPAEDIA_DICT[1163] = {keyword = "棉甲通用鞋子3品任务紫装" , class = 85 , content = "棉甲通用鞋子3品任务紫装", command = "d_cmd 2001 10336"}
CYCLOPAEDIA_DICT[1164] = {keyword = "棉甲通用护腕3品白装" , class = 84 , content = "棉甲通用护腕3品白装", command = "d_cmd 2001 10337"}
CYCLOPAEDIA_DICT[1165] = {keyword = "棉甲通用护腕3品蓝装" , class = 84 , content = "棉甲通用护腕3品蓝装", command = "d_cmd 2001 10338"}
CYCLOPAEDIA_DICT[1166] = {keyword = "棉甲通用护腕3品紫装" , class = 84 , content = "棉甲通用护腕3品紫装", command = "d_cmd 2001 10339"}
CYCLOPAEDIA_DICT[1167] = {keyword = "棉甲通用护腕3品黄装" , class = 84 , content = "棉甲通用护腕3品黄装", command = "d_cmd 2001 10340"}
CYCLOPAEDIA_DICT[1168] = {keyword = "棉甲通用护腕3品任务蓝装" , class = 84 , content = "棉甲通用护腕3品任务蓝装", command = "d_cmd 2001 10341"}
CYCLOPAEDIA_DICT[1169] = {keyword = "棉甲通用护腕3品任务紫装" , class = 84 , content = "棉甲通用护腕3品任务紫装", command = "d_cmd 2001 10342"}
CYCLOPAEDIA_DICT[1170] = {keyword = "皮甲通用头部3品白装" , class = 91 , content = "皮甲通用头部3品白装", command = "d_cmd 2001 10343"}
CYCLOPAEDIA_DICT[1171] = {keyword = "皮甲通用头部3品蓝装" , class = 91 , content = "皮甲通用头部3品蓝装", command = "d_cmd 2001 10344"}
CYCLOPAEDIA_DICT[1172] = {keyword = "皮甲通用头部3品紫装" , class = 91 , content = "皮甲通用头部3品紫装", command = "d_cmd 2001 10345"}
CYCLOPAEDIA_DICT[1173] = {keyword = "皮甲通用头部3品黄装" , class = 91 , content = "皮甲通用头部3品黄装", command = "d_cmd 2001 10346"}
CYCLOPAEDIA_DICT[1174] = {keyword = "皮甲通用头部3品任务蓝装" , class = 91 , content = "皮甲通用头部3品任务蓝装", command = "d_cmd 2001 10347"}
CYCLOPAEDIA_DICT[1175] = {keyword = "皮甲通用头部3品任务紫装" , class = 91 , content = "皮甲通用头部3品任务紫装", command = "d_cmd 2001 10348"}
CYCLOPAEDIA_DICT[1176] = {keyword = "皮甲通用上衣3品白装" , class = 92 , content = "皮甲通用上衣3品白装", command = "d_cmd 2001 10349"}
CYCLOPAEDIA_DICT[1177] = {keyword = "皮甲通用上衣3品蓝装" , class = 92 , content = "皮甲通用上衣3品蓝装", command = "d_cmd 2001 10350"}
CYCLOPAEDIA_DICT[1178] = {keyword = "皮甲通用上衣3品紫装" , class = 92 , content = "皮甲通用上衣3品紫装", command = "d_cmd 2001 10351"}
CYCLOPAEDIA_DICT[1179] = {keyword = "皮甲通用上衣3品黄装" , class = 92 , content = "皮甲通用上衣3品黄装", command = "d_cmd 2001 10352"}
CYCLOPAEDIA_DICT[1180] = {keyword = "皮甲通用上衣3品任务蓝装" , class = 92 , content = "皮甲通用上衣3品任务蓝装", command = "d_cmd 2001 10353"}
CYCLOPAEDIA_DICT[1181] = {keyword = "皮甲通用上衣3品任务紫装" , class = 92 , content = "皮甲通用上衣3品任务紫装", command = "d_cmd 2001 10354"}
CYCLOPAEDIA_DICT[1182] = {keyword = "皮甲通用裤子3品白装" , class = 93 , content = "皮甲通用裤子3品白装", command = "d_cmd 2001 10355"}
CYCLOPAEDIA_DICT[1183] = {keyword = "皮甲通用裤子3品蓝装" , class = 93 , content = "皮甲通用裤子3品蓝装", command = "d_cmd 2001 10356"}
CYCLOPAEDIA_DICT[1184] = {keyword = "皮甲通用裤子3品紫装" , class = 93 , content = "皮甲通用裤子3品紫装", command = "d_cmd 2001 10357"}
CYCLOPAEDIA_DICT[1185] = {keyword = "皮甲通用裤子3品黄装" , class = 93 , content = "皮甲通用裤子3品黄装", command = "d_cmd 2001 10358"}
CYCLOPAEDIA_DICT[1186] = {keyword = "皮甲通用裤子3品任务蓝装" , class = 93 , content = "皮甲通用裤子3品任务蓝装", command = "d_cmd 2001 10359"}
CYCLOPAEDIA_DICT[1187] = {keyword = "皮甲通用裤子3品任务紫装" , class = 93 , content = "皮甲通用裤子3品任务紫装", command = "d_cmd 2001 10360"}
CYCLOPAEDIA_DICT[1188] = {keyword = "皮甲通用鞋子3品白装" , class = 95 , content = "皮甲通用鞋子3品白装", command = "d_cmd 2001 10361"}
CYCLOPAEDIA_DICT[1189] = {keyword = "皮甲通用鞋子3品蓝装" , class = 95 , content = "皮甲通用鞋子3品蓝装", command = "d_cmd 2001 10362"}
CYCLOPAEDIA_DICT[1190] = {keyword = "皮甲通用鞋子3品紫装" , class = 95 , content = "皮甲通用鞋子3品紫装", command = "d_cmd 2001 10363"}
CYCLOPAEDIA_DICT[1191] = {keyword = "皮甲通用鞋子3品黄装" , class = 95 , content = "皮甲通用鞋子3品黄装", command = "d_cmd 2001 10364"}
CYCLOPAEDIA_DICT[1192] = {keyword = "皮甲通用鞋子3品任务蓝装" , class = 95 , content = "皮甲通用鞋子3品任务蓝装", command = "d_cmd 2001 10365"}
CYCLOPAEDIA_DICT[1193] = {keyword = "皮甲通用鞋子3品任务紫装" , class = 95 , content = "皮甲通用鞋子3品任务紫装", command = "d_cmd 2001 10366"}
CYCLOPAEDIA_DICT[1194] = {keyword = "皮甲通用护腕3品白装" , class = 94 , content = "皮甲通用护腕3品白装", command = "d_cmd 2001 10367"}
CYCLOPAEDIA_DICT[1195] = {keyword = "皮甲通用护腕3品蓝装" , class = 94 , content = "皮甲通用护腕3品蓝装", command = "d_cmd 2001 10368"}
CYCLOPAEDIA_DICT[1196] = {keyword = "皮甲通用护腕3品紫装" , class = 94 , content = "皮甲通用护腕3品紫装", command = "d_cmd 2001 10369"}
CYCLOPAEDIA_DICT[1197] = {keyword = "皮甲通用护腕3品黄装" , class = 94 , content = "皮甲通用护腕3品黄装", command = "d_cmd 2001 10370"}
CYCLOPAEDIA_DICT[1198] = {keyword = "皮甲通用护腕3品任务蓝装" , class = 94 , content = "皮甲通用护腕3品任务蓝装", command = "d_cmd 2001 10371"}
CYCLOPAEDIA_DICT[1199] = {keyword = "皮甲通用护腕3品任务紫装" , class = 94 , content = "皮甲通用护腕3品任务紫装", command = "d_cmd 2001 10372"}
CYCLOPAEDIA_DICT[1200] = {keyword = "武器少林结棍4品白装" , class = 41 , content = "武器少林结棍4品白装", command = "d_cmd 2001 12631"}
CYCLOPAEDIA_DICT[1201] = {keyword = "武器少林结棍4品蓝装" , class = 41 , content = "武器少林结棍4品蓝装", command = "d_cmd 2001 12632"}
CYCLOPAEDIA_DICT[1202] = {keyword = "武器少林结棍4品紫装" , class = 41 , content = "武器少林结棍4品紫装", command = "d_cmd 2001 12633"}
CYCLOPAEDIA_DICT[1203] = {keyword = "武器少林结棍4品黄装" , class = 41 , content = "武器少林结棍4品黄装", command = "d_cmd 2001 12634"}
CYCLOPAEDIA_DICT[1204] = {keyword = "武器少林结棍4品任务蓝装" , class = 41 , content = "武器少林结棍4品任务蓝装", command = "d_cmd 2001 12635"}
CYCLOPAEDIA_DICT[1205] = {keyword = "武器少林结棍4品任务紫装" , class = 41 , content = "武器少林结棍4品任务紫装", command = "d_cmd 2001 12636"}
CYCLOPAEDIA_DICT[1206] = {keyword = "武器武当长剑4品白装" , class = 42 , content = "武器武当长剑4品白装", command = "d_cmd 2001 12637"}
CYCLOPAEDIA_DICT[1207] = {keyword = "武器武当长剑4品蓝装" , class = 42 , content = "武器武当长剑4品蓝装", command = "d_cmd 2001 12638"}
CYCLOPAEDIA_DICT[1208] = {keyword = "武器武当长剑4品紫装" , class = 42 , content = "武器武当长剑4品紫装", command = "d_cmd 2001 12639"}
CYCLOPAEDIA_DICT[1209] = {keyword = "武器武当长剑4品黄装" , class = 42 , content = "武器武当长剑4品黄装", command = "d_cmd 2001 12640"}
CYCLOPAEDIA_DICT[1210] = {keyword = "武器武当长剑4品任务蓝装" , class = 42 , content = "武器武当长剑4品任务蓝装", command = "d_cmd 2001 12641"}
CYCLOPAEDIA_DICT[1211] = {keyword = "武器武当长剑4品任务紫装" , class = 42 , content = "武器武当长剑4品任务紫装", command = "d_cmd 2001 12642"}
CYCLOPAEDIA_DICT[1212] = {keyword = "武器华山单剑4品白装" , class = 43 , content = "武器华山单剑4品白装", command = "d_cmd 2001 12643"}
CYCLOPAEDIA_DICT[1213] = {keyword = "武器华山单剑4品蓝装" , class = 43 , content = "武器华山单剑4品蓝装", command = "d_cmd 2001 12644"}
CYCLOPAEDIA_DICT[1214] = {keyword = "武器华山单剑4品紫装" , class = 43 , content = "武器华山单剑4品紫装", command = "d_cmd 2001 12645"}
CYCLOPAEDIA_DICT[1215] = {keyword = "武器华山单剑4品黄装" , class = 43 , content = "武器华山单剑4品黄装", command = "d_cmd 2001 12646"}
CYCLOPAEDIA_DICT[1216] = {keyword = "武器华山单剑4品任务蓝装" , class = 43 , content = "武器华山单剑4品任务蓝装", command = "d_cmd 2001 12647"}
CYCLOPAEDIA_DICT[1217] = {keyword = "武器华山单剑4品任务紫装" , class = 43 , content = "武器华山单剑4品任务紫装", command = "d_cmd 2001 12648"}
CYCLOPAEDIA_DICT[1218] = {keyword = "武器恒山双剑4品白装" , class = 44 , content = "武器恒山双剑4品白装", command = "d_cmd 2001 12649"}
CYCLOPAEDIA_DICT[1219] = {keyword = "武器恒山双剑4品蓝装" , class = 44 , content = "武器恒山双剑4品蓝装", command = "d_cmd 2001 12650"}
CYCLOPAEDIA_DICT[1220] = {keyword = "武器恒山双剑4品紫装" , class = 44 , content = "武器恒山双剑4品紫装", command = "d_cmd 2001 12651"}
CYCLOPAEDIA_DICT[1221] = {keyword = "武器恒山双剑4品黄装" , class = 44 , content = "武器恒山双剑4品黄装", command = "d_cmd 2001 12652"}
CYCLOPAEDIA_DICT[1222] = {keyword = "武器恒山双剑4品任务蓝装" , class = 44 , content = "武器恒山双剑4品任务蓝装", command = "d_cmd 2001 12653"}
CYCLOPAEDIA_DICT[1223] = {keyword = "武器恒山双剑4品任务紫装" , class = 44 , content = "武器恒山双剑4品任务紫装", command = "d_cmd 2001 12654"}
CYCLOPAEDIA_DICT[1224] = {keyword = "武器衡山琴剑4品白装" , class = 45 , content = "武器衡山琴剑4品白装", command = "d_cmd 2001 12655"}
CYCLOPAEDIA_DICT[1225] = {keyword = "武器衡山琴剑4品蓝装" , class = 45 , content = "武器衡山琴剑4品蓝装", command = "d_cmd 2001 12656"}
CYCLOPAEDIA_DICT[1226] = {keyword = "武器衡山琴剑4品紫装" , class = 45 , content = "武器衡山琴剑4品紫装", command = "d_cmd 2001 12657"}
CYCLOPAEDIA_DICT[1227] = {keyword = "武器衡山琴剑4品黄装" , class = 45 , content = "武器衡山琴剑4品黄装", command = "d_cmd 2001 12658"}
CYCLOPAEDIA_DICT[1228] = {keyword = "武器衡山琴剑4品任务蓝装" , class = 45 , content = "武器衡山琴剑4品任务蓝装", command = "d_cmd 2001 12659"}
CYCLOPAEDIA_DICT[1229] = {keyword = "武器衡山琴剑4品任务紫装" , class = 45 , content = "武器衡山琴剑4品任务紫装", command = "d_cmd 2001 12660"}
CYCLOPAEDIA_DICT[1230] = {keyword = "武器日月双刃4品白装" , class = 51 , content = "武器日月双刃4品白装", command = "d_cmd 2001 12661"}
CYCLOPAEDIA_DICT[1231] = {keyword = "武器日月双刃4品蓝装" , class = 51 , content = "武器日月双刃4品蓝装", command = "d_cmd 2001 12662"}
CYCLOPAEDIA_DICT[1232] = {keyword = "武器日月双刃4品紫装" , class = 51 , content = "武器日月双刃4品紫装", command = "d_cmd 2001 12663"}
CYCLOPAEDIA_DICT[1233] = {keyword = "武器日月双刃4品黄装" , class = 51 , content = "武器日月双刃4品黄装", command = "d_cmd 2001 12664"}
CYCLOPAEDIA_DICT[1234] = {keyword = "武器日月双刃4品任务蓝装" , class = 51 , content = "武器日月双刃4品任务蓝装", command = "d_cmd 2001 12665"}
CYCLOPAEDIA_DICT[1235] = {keyword = "武器日月双刃4品任务紫装" , class = 51 , content = "武器日月双刃4品任务紫装", command = "d_cmd 2001 12666"}
CYCLOPAEDIA_DICT[1236] = {keyword = "武器五仙鞭子4品白装" , class = 52 , content = "武器五仙鞭子4品白装", command = "d_cmd 2001 12667"}
CYCLOPAEDIA_DICT[1237] = {keyword = "武器五仙鞭子4品蓝装" , class = 52 , content = "武器五仙鞭子4品蓝装", command = "d_cmd 2001 12668"}
CYCLOPAEDIA_DICT[1238] = {keyword = "武器五仙鞭子4品紫装" , class = 52 , content = "武器五仙鞭子4品紫装", command = "d_cmd 2001 12669"}
CYCLOPAEDIA_DICT[1239] = {keyword = "武器五仙鞭子4品黄装" , class = 52 , content = "武器五仙鞭子4品黄装", command = "d_cmd 2001 12670"}
CYCLOPAEDIA_DICT[1240] = {keyword = "武器五仙鞭子4品任务蓝装" , class = 52 , content = "武器五仙鞭子4品任务蓝装", command = "d_cmd 2001 12671"}
CYCLOPAEDIA_DICT[1241] = {keyword = "武器五仙鞭子4品任务紫装" , class = 52 , content = "武器五仙鞭子4品任务紫装", command = "d_cmd 2001 12672"}
CYCLOPAEDIA_DICT[1242] = {keyword = "武器逍遥扇子4品白装" , class = 53 , content = "武器逍遥扇子4品白装", command = "d_cmd 2001 12673"}
CYCLOPAEDIA_DICT[1243] = {keyword = "武器逍遥扇子4品蓝装" , class = 53 , content = "武器逍遥扇子4品蓝装", command = "d_cmd 2001 12674"}
CYCLOPAEDIA_DICT[1244] = {keyword = "武器逍遥扇子4品紫装" , class = 53 , content = "武器逍遥扇子4品紫装", command = "d_cmd 2001 12675"}
CYCLOPAEDIA_DICT[1245] = {keyword = "武器逍遥扇子4品黄装" , class = 53 , content = "武器逍遥扇子4品黄装", command = "d_cmd 2001 12676"}
CYCLOPAEDIA_DICT[1246] = {keyword = "武器逍遥扇子4品任务蓝装" , class = 53 , content = "武器逍遥扇子4品任务蓝装", command = "d_cmd 2001 12677"}
CYCLOPAEDIA_DICT[1247] = {keyword = "武器逍遥扇子4品任务紫装" , class = 53 , content = "武器逍遥扇子4品任务紫装", command = "d_cmd 2001 12678"}
CYCLOPAEDIA_DICT[1248] = {keyword = "武器唐门拳刃4品白装" , class = 54 , content = "武器唐门拳刃4品白装", command = "d_cmd 2001 12679"}
CYCLOPAEDIA_DICT[1249] = {keyword = "武器唐门拳刃4品蓝装" , class = 54 , content = "武器唐门拳刃4品蓝装", command = "d_cmd 2001 12680"}
CYCLOPAEDIA_DICT[1250] = {keyword = "武器唐门拳刃4品紫装" , class = 54 , content = "武器唐门拳刃4品紫装", command = "d_cmd 2001 12681"}
CYCLOPAEDIA_DICT[1251] = {keyword = "武器唐门拳刃4品黄装" , class = 54 , content = "武器唐门拳刃4品黄装", command = "d_cmd 2001 12682"}
CYCLOPAEDIA_DICT[1252] = {keyword = "武器唐门拳刃4品任务蓝装" , class = 54 , content = "武器唐门拳刃4品任务蓝装", command = "d_cmd 2001 12683"}
CYCLOPAEDIA_DICT[1253] = {keyword = "武器唐门拳刃4品任务紫装" , class = 54 , content = "武器唐门拳刃4品任务紫装", command = "d_cmd 2001 12684"}
CYCLOPAEDIA_DICT[1254] = {keyword = "武器峨眉法杖4品白装" , class = 55 , content = "武器峨眉法杖4品白装", command = "d_cmd 2001 12685"}
CYCLOPAEDIA_DICT[1255] = {keyword = "武器峨眉法杖4品蓝装" , class = 55 , content = "武器峨眉法杖4品蓝装", command = "d_cmd 2001 12686"}
CYCLOPAEDIA_DICT[1256] = {keyword = "武器峨眉法杖4品紫装" , class = 55 , content = "武器峨眉法杖4品紫装", command = "d_cmd 2001 12687"}
CYCLOPAEDIA_DICT[1257] = {keyword = "武器峨眉法杖4品黄装" , class = 55 , content = "武器峨眉法杖4品黄装", command = "d_cmd 2001 12688"}
CYCLOPAEDIA_DICT[1258] = {keyword = "武器峨眉法杖4品任务蓝装" , class = 55 , content = "武器峨眉法杖4品任务蓝装", command = "d_cmd 2001 12689"}
CYCLOPAEDIA_DICT[1259] = {keyword = "武器峨眉法杖4品任务紫装" , class = 55 , content = "武器峨眉法杖4品任务紫装", command = "d_cmd 2001 12690"}
CYCLOPAEDIA_DICT[1260] = {keyword = "布衣通用头部4品白装" , class = 71 , content = "布衣通用头部4品白装", command = "d_cmd 2001 12691"}
CYCLOPAEDIA_DICT[1261] = {keyword = "布衣通用头部4品蓝装" , class = 71 , content = "布衣通用头部4品蓝装", command = "d_cmd 2001 12692"}
CYCLOPAEDIA_DICT[1262] = {keyword = "布衣通用头部4品紫装" , class = 71 , content = "布衣通用头部4品紫装", command = "d_cmd 2001 12693"}
CYCLOPAEDIA_DICT[1263] = {keyword = "布衣通用头部4品黄装" , class = 71 , content = "布衣通用头部4品黄装", command = "d_cmd 2001 12694"}
CYCLOPAEDIA_DICT[1264] = {keyword = "布衣通用头部4品任务蓝装" , class = 71 , content = "布衣通用头部4品任务蓝装", command = "d_cmd 2001 12695"}
CYCLOPAEDIA_DICT[1265] = {keyword = "布衣通用头部4品任务紫装" , class = 71 , content = "布衣通用头部4品任务紫装", command = "d_cmd 2001 12696"}
CYCLOPAEDIA_DICT[1266] = {keyword = "布衣通用上衣4品白装" , class = 72 , content = "布衣通用上衣4品白装", command = "d_cmd 2001 12697"}
CYCLOPAEDIA_DICT[1267] = {keyword = "布衣通用上衣4品蓝装" , class = 72 , content = "布衣通用上衣4品蓝装", command = "d_cmd 2001 12698"}
CYCLOPAEDIA_DICT[1268] = {keyword = "布衣通用上衣4品紫装" , class = 72 , content = "布衣通用上衣4品紫装", command = "d_cmd 2001 12699"}
CYCLOPAEDIA_DICT[1269] = {keyword = "布衣通用上衣4品黄装" , class = 72 , content = "布衣通用上衣4品黄装", command = "d_cmd 2001 12700"}
CYCLOPAEDIA_DICT[1270] = {keyword = "布衣通用上衣4品任务蓝装" , class = 72 , content = "布衣通用上衣4品任务蓝装", command = "d_cmd 2001 12701"}
CYCLOPAEDIA_DICT[1271] = {keyword = "布衣通用上衣4品任务紫装" , class = 72 , content = "布衣通用上衣4品任务紫装", command = "d_cmd 2001 12702"}
CYCLOPAEDIA_DICT[1272] = {keyword = "布衣通用裤子4品白装" , class = 73 , content = "布衣通用裤子4品白装", command = "d_cmd 2001 12703"}
CYCLOPAEDIA_DICT[1273] = {keyword = "布衣通用裤子4品蓝装" , class = 73 , content = "布衣通用裤子4品蓝装", command = "d_cmd 2001 12704"}
CYCLOPAEDIA_DICT[1274] = {keyword = "布衣通用裤子4品紫装" , class = 73 , content = "布衣通用裤子4品紫装", command = "d_cmd 2001 12705"}
CYCLOPAEDIA_DICT[1275] = {keyword = "布衣通用裤子4品黄装" , class = 73 , content = "布衣通用裤子4品黄装", command = "d_cmd 2001 12706"}
CYCLOPAEDIA_DICT[1276] = {keyword = "布衣通用裤子4品任务蓝装" , class = 73 , content = "布衣通用裤子4品任务蓝装", command = "d_cmd 2001 12707"}
CYCLOPAEDIA_DICT[1277] = {keyword = "布衣通用裤子4品任务紫装" , class = 73 , content = "布衣通用裤子4品任务紫装", command = "d_cmd 2001 12708"}
CYCLOPAEDIA_DICT[1278] = {keyword = "布衣通用鞋子4品白装" , class = 75 , content = "布衣通用鞋子4品白装", command = "d_cmd 2001 12709"}
CYCLOPAEDIA_DICT[1279] = {keyword = "布衣通用鞋子4品蓝装" , class = 75 , content = "布衣通用鞋子4品蓝装", command = "d_cmd 2001 12710"}
CYCLOPAEDIA_DICT[1280] = {keyword = "布衣通用鞋子4品紫装" , class = 75 , content = "布衣通用鞋子4品紫装", command = "d_cmd 2001 12711"}
CYCLOPAEDIA_DICT[1281] = {keyword = "布衣通用鞋子4品黄装" , class = 75 , content = "布衣通用鞋子4品黄装", command = "d_cmd 2001 12712"}
CYCLOPAEDIA_DICT[1282] = {keyword = "布衣通用鞋子4品任务蓝装" , class = 75 , content = "布衣通用鞋子4品任务蓝装", command = "d_cmd 2001 12713"}
CYCLOPAEDIA_DICT[1283] = {keyword = "布衣通用鞋子4品任务紫装" , class = 75 , content = "布衣通用鞋子4品任务紫装", command = "d_cmd 2001 12714"}
CYCLOPAEDIA_DICT[1284] = {keyword = "布衣通用护腕4品白装" , class = 74 , content = "布衣通用护腕4品白装", command = "d_cmd 2001 12715"}
CYCLOPAEDIA_DICT[1285] = {keyword = "布衣通用护腕4品蓝装" , class = 74 , content = "布衣通用护腕4品蓝装", command = "d_cmd 2001 12716"}
CYCLOPAEDIA_DICT[1286] = {keyword = "布衣通用护腕4品紫装" , class = 74 , content = "布衣通用护腕4品紫装", command = "d_cmd 2001 12717"}
CYCLOPAEDIA_DICT[1287] = {keyword = "布衣通用护腕4品黄装" , class = 74 , content = "布衣通用护腕4品黄装", command = "d_cmd 2001 12718"}
CYCLOPAEDIA_DICT[1288] = {keyword = "布衣通用护腕4品任务蓝装" , class = 74 , content = "布衣通用护腕4品任务蓝装", command = "d_cmd 2001 12719"}
CYCLOPAEDIA_DICT[1289] = {keyword = "布衣通用护腕4品任务紫装" , class = 74 , content = "布衣通用护腕4品任务紫装", command = "d_cmd 2001 12720"}
CYCLOPAEDIA_DICT[1290] = {keyword = "棉甲通用头部4品白装" , class = 81 , content = "棉甲通用头部4品白装", command = "d_cmd 2001 12721"}
CYCLOPAEDIA_DICT[1291] = {keyword = "棉甲通用头部4品蓝装" , class = 81 , content = "棉甲通用头部4品蓝装", command = "d_cmd 2001 12722"}
CYCLOPAEDIA_DICT[1292] = {keyword = "棉甲通用头部4品紫装" , class = 81 , content = "棉甲通用头部4品紫装", command = "d_cmd 2001 12723"}
CYCLOPAEDIA_DICT[1293] = {keyword = "棉甲通用头部4品黄装" , class = 81 , content = "棉甲通用头部4品黄装", command = "d_cmd 2001 12724"}
CYCLOPAEDIA_DICT[1294] = {keyword = "棉甲通用头部4品任务蓝装" , class = 81 , content = "棉甲通用头部4品任务蓝装", command = "d_cmd 2001 12725"}
CYCLOPAEDIA_DICT[1295] = {keyword = "棉甲通用头部4品任务紫装" , class = 81 , content = "棉甲通用头部4品任务紫装", command = "d_cmd 2001 12726"}
CYCLOPAEDIA_DICT[1296] = {keyword = "棉甲通用上衣4品白装" , class = 82 , content = "棉甲通用上衣4品白装", command = "d_cmd 2001 12727"}
CYCLOPAEDIA_DICT[1297] = {keyword = "棉甲通用上衣4品蓝装" , class = 82 , content = "棉甲通用上衣4品蓝装", command = "d_cmd 2001 12728"}
CYCLOPAEDIA_DICT[1298] = {keyword = "棉甲通用上衣4品紫装" , class = 82 , content = "棉甲通用上衣4品紫装", command = "d_cmd 2001 12729"}
CYCLOPAEDIA_DICT[1299] = {keyword = "棉甲通用上衣4品黄装" , class = 82 , content = "棉甲通用上衣4品黄装", command = "d_cmd 2001 12730"}
CYCLOPAEDIA_DICT[1300] = {keyword = "棉甲通用上衣4品任务蓝装" , class = 82 , content = "棉甲通用上衣4品任务蓝装", command = "d_cmd 2001 12731"}
CYCLOPAEDIA_DICT[1301] = {keyword = "棉甲通用上衣4品任务紫装" , class = 82 , content = "棉甲通用上衣4品任务紫装", command = "d_cmd 2001 12732"}
CYCLOPAEDIA_DICT[1302] = {keyword = "棉甲通用裤子4品白装" , class = 83 , content = "棉甲通用裤子4品白装", command = "d_cmd 2001 12733"}
CYCLOPAEDIA_DICT[1303] = {keyword = "棉甲通用裤子4品蓝装" , class = 83 , content = "棉甲通用裤子4品蓝装", command = "d_cmd 2001 12734"}
CYCLOPAEDIA_DICT[1304] = {keyword = "棉甲通用裤子4品紫装" , class = 83 , content = "棉甲通用裤子4品紫装", command = "d_cmd 2001 12735"}
CYCLOPAEDIA_DICT[1305] = {keyword = "棉甲通用裤子4品黄装" , class = 83 , content = "棉甲通用裤子4品黄装", command = "d_cmd 2001 12736"}
CYCLOPAEDIA_DICT[1306] = {keyword = "棉甲通用裤子4品任务蓝装" , class = 83 , content = "棉甲通用裤子4品任务蓝装", command = "d_cmd 2001 12737"}
CYCLOPAEDIA_DICT[1307] = {keyword = "棉甲通用裤子4品任务紫装" , class = 83 , content = "棉甲通用裤子4品任务紫装", command = "d_cmd 2001 12738"}
CYCLOPAEDIA_DICT[1308] = {keyword = "棉甲通用鞋子4品白装" , class = 85 , content = "棉甲通用鞋子4品白装", command = "d_cmd 2001 12739"}
CYCLOPAEDIA_DICT[1309] = {keyword = "棉甲通用鞋子4品蓝装" , class = 85 , content = "棉甲通用鞋子4品蓝装", command = "d_cmd 2001 12740"}
CYCLOPAEDIA_DICT[1310] = {keyword = "棉甲通用鞋子4品紫装" , class = 85 , content = "棉甲通用鞋子4品紫装", command = "d_cmd 2001 12741"}
CYCLOPAEDIA_DICT[1311] = {keyword = "棉甲通用鞋子4品黄装" , class = 85 , content = "棉甲通用鞋子4品黄装", command = "d_cmd 2001 12742"}
CYCLOPAEDIA_DICT[1312] = {keyword = "棉甲通用鞋子4品任务蓝装" , class = 85 , content = "棉甲通用鞋子4品任务蓝装", command = "d_cmd 2001 12743"}
CYCLOPAEDIA_DICT[1313] = {keyword = "棉甲通用鞋子4品任务紫装" , class = 85 , content = "棉甲通用鞋子4品任务紫装", command = "d_cmd 2001 12744"}
CYCLOPAEDIA_DICT[1314] = {keyword = "棉甲通用护腕4品白装" , class = 84 , content = "棉甲通用护腕4品白装", command = "d_cmd 2001 12745"}
CYCLOPAEDIA_DICT[1315] = {keyword = "棉甲通用护腕4品蓝装" , class = 84 , content = "棉甲通用护腕4品蓝装", command = "d_cmd 2001 12746"}
CYCLOPAEDIA_DICT[1316] = {keyword = "棉甲通用护腕4品紫装" , class = 84 , content = "棉甲通用护腕4品紫装", command = "d_cmd 2001 12747"}
CYCLOPAEDIA_DICT[1317] = {keyword = "棉甲通用护腕4品黄装" , class = 84 , content = "棉甲通用护腕4品黄装", command = "d_cmd 2001 12748"}
CYCLOPAEDIA_DICT[1318] = {keyword = "棉甲通用护腕4品任务蓝装" , class = 84 , content = "棉甲通用护腕4品任务蓝装", command = "d_cmd 2001 12749"}
CYCLOPAEDIA_DICT[1319] = {keyword = "棉甲通用护腕4品任务紫装" , class = 84 , content = "棉甲通用护腕4品任务紫装", command = "d_cmd 2001 12750"}
CYCLOPAEDIA_DICT[1320] = {keyword = "皮甲通用头部4品白装" , class = 91 , content = "皮甲通用头部4品白装", command = "d_cmd 2001 12751"}
CYCLOPAEDIA_DICT[1321] = {keyword = "皮甲通用头部4品蓝装" , class = 91 , content = "皮甲通用头部4品蓝装", command = "d_cmd 2001 12752"}
CYCLOPAEDIA_DICT[1322] = {keyword = "皮甲通用头部4品紫装" , class = 91 , content = "皮甲通用头部4品紫装", command = "d_cmd 2001 12753"}
CYCLOPAEDIA_DICT[1323] = {keyword = "皮甲通用头部4品黄装" , class = 91 , content = "皮甲通用头部4品黄装", command = "d_cmd 2001 12754"}
CYCLOPAEDIA_DICT[1324] = {keyword = "皮甲通用头部4品任务蓝装" , class = 91 , content = "皮甲通用头部4品任务蓝装", command = "d_cmd 2001 12755"}
CYCLOPAEDIA_DICT[1325] = {keyword = "皮甲通用头部4品任务紫装" , class = 91 , content = "皮甲通用头部4品任务紫装", command = "d_cmd 2001 12756"}
CYCLOPAEDIA_DICT[1326] = {keyword = "皮甲通用上衣4品白装" , class = 92 , content = "皮甲通用上衣4品白装", command = "d_cmd 2001 12757"}
CYCLOPAEDIA_DICT[1327] = {keyword = "皮甲通用上衣4品蓝装" , class = 92 , content = "皮甲通用上衣4品蓝装", command = "d_cmd 2001 12758"}
CYCLOPAEDIA_DICT[1328] = {keyword = "皮甲通用上衣4品紫装" , class = 92 , content = "皮甲通用上衣4品紫装", command = "d_cmd 2001 12759"}
CYCLOPAEDIA_DICT[1329] = {keyword = "皮甲通用上衣4品黄装" , class = 92 , content = "皮甲通用上衣4品黄装", command = "d_cmd 2001 12760"}
CYCLOPAEDIA_DICT[1330] = {keyword = "皮甲通用上衣4品任务蓝装" , class = 92 , content = "皮甲通用上衣4品任务蓝装", command = "d_cmd 2001 12761"}
CYCLOPAEDIA_DICT[1331] = {keyword = "皮甲通用上衣4品任务紫装" , class = 92 , content = "皮甲通用上衣4品任务紫装", command = "d_cmd 2001 12762"}
CYCLOPAEDIA_DICT[1332] = {keyword = "皮甲通用裤子4品白装" , class = 93 , content = "皮甲通用裤子4品白装", command = "d_cmd 2001 12763"}
CYCLOPAEDIA_DICT[1333] = {keyword = "皮甲通用裤子4品蓝装" , class = 93 , content = "皮甲通用裤子4品蓝装", command = "d_cmd 2001 12764"}
CYCLOPAEDIA_DICT[1334] = {keyword = "皮甲通用裤子4品紫装" , class = 93 , content = "皮甲通用裤子4品紫装", command = "d_cmd 2001 12765"}
CYCLOPAEDIA_DICT[1335] = {keyword = "皮甲通用裤子4品黄装" , class = 93 , content = "皮甲通用裤子4品黄装", command = "d_cmd 2001 12766"}
CYCLOPAEDIA_DICT[1336] = {keyword = "皮甲通用裤子4品任务蓝装" , class = 93 , content = "皮甲通用裤子4品任务蓝装", command = "d_cmd 2001 12767"}
CYCLOPAEDIA_DICT[1337] = {keyword = "皮甲通用裤子4品任务紫装" , class = 93 , content = "皮甲通用裤子4品任务紫装", command = "d_cmd 2001 12768"}
CYCLOPAEDIA_DICT[1338] = {keyword = "皮甲通用鞋子4品白装" , class = 95 , content = "皮甲通用鞋子4品白装", command = "d_cmd 2001 12769"}
CYCLOPAEDIA_DICT[1339] = {keyword = "皮甲通用鞋子4品蓝装" , class = 95 , content = "皮甲通用鞋子4品蓝装", command = "d_cmd 2001 12770"}
CYCLOPAEDIA_DICT[1340] = {keyword = "皮甲通用鞋子4品紫装" , class = 95 , content = "皮甲通用鞋子4品紫装", command = "d_cmd 2001 12771"}
CYCLOPAEDIA_DICT[1341] = {keyword = "皮甲通用鞋子4品黄装" , class = 95 , content = "皮甲通用鞋子4品黄装", command = "d_cmd 2001 12772"}
CYCLOPAEDIA_DICT[1342] = {keyword = "皮甲通用鞋子4品任务蓝装" , class = 95 , content = "皮甲通用鞋子4品任务蓝装", command = "d_cmd 2001 12773"}
CYCLOPAEDIA_DICT[1343] = {keyword = "皮甲通用鞋子4品任务紫装" , class = 95 , content = "皮甲通用鞋子4品任务紫装", command = "d_cmd 2001 12774"}
CYCLOPAEDIA_DICT[1344] = {keyword = "皮甲通用护腕4品白装" , class = 94 , content = "皮甲通用护腕4品白装", command = "d_cmd 2001 12775"}
CYCLOPAEDIA_DICT[1345] = {keyword = "皮甲通用护腕4品蓝装" , class = 94 , content = "皮甲通用护腕4品蓝装", command = "d_cmd 2001 12776"}
CYCLOPAEDIA_DICT[1346] = {keyword = "皮甲通用护腕4品紫装" , class = 94 , content = "皮甲通用护腕4品紫装", command = "d_cmd 2001 12777"}
CYCLOPAEDIA_DICT[1347] = {keyword = "皮甲通用护腕4品黄装" , class = 94 , content = "皮甲通用护腕4品黄装", command = "d_cmd 2001 12778"}
CYCLOPAEDIA_DICT[1348] = {keyword = "皮甲通用护腕4品任务蓝装" , class = 94 , content = "皮甲通用护腕4品任务蓝装", command = "d_cmd 2001 12779"}
CYCLOPAEDIA_DICT[1349] = {keyword = "皮甲通用护腕4品任务紫装" , class = 94 , content = "皮甲通用护腕4品任务紫装", command = "d_cmd 2001 12780"}
CYCLOPAEDIA_DICT[1350] = {keyword = "武器少林结棍5品白装" , class = 41 , content = "武器少林结棍5品白装", command = "d_cmd 2001 12781"}
CYCLOPAEDIA_DICT[1351] = {keyword = "武器少林结棍5品蓝装" , class = 41 , content = "武器少林结棍5品蓝装", command = "d_cmd 2001 12782"}
CYCLOPAEDIA_DICT[1352] = {keyword = "武器少林结棍5品紫装" , class = 41 , content = "武器少林结棍5品紫装", command = "d_cmd 2001 12783"}
CYCLOPAEDIA_DICT[1353] = {keyword = "武器少林结棍5品黄装" , class = 41 , content = "武器少林结棍5品黄装", command = "d_cmd 2001 12784"}
CYCLOPAEDIA_DICT[1354] = {keyword = "武器少林结棍5品任务蓝装" , class = 41 , content = "武器少林结棍5品任务蓝装", command = "d_cmd 2001 12785"}
CYCLOPAEDIA_DICT[1355] = {keyword = "武器少林结棍5品任务紫装" , class = 41 , content = "武器少林结棍5品任务紫装", command = "d_cmd 2001 12786"}
CYCLOPAEDIA_DICT[1356] = {keyword = "武器武当长剑5品白装" , class = 42 , content = "武器武当长剑5品白装", command = "d_cmd 2001 12787"}
CYCLOPAEDIA_DICT[1357] = {keyword = "武器武当长剑5品蓝装" , class = 42 , content = "武器武当长剑5品蓝装", command = "d_cmd 2001 12788"}
CYCLOPAEDIA_DICT[1358] = {keyword = "武器武当长剑5品紫装" , class = 42 , content = "武器武当长剑5品紫装", command = "d_cmd 2001 12789"}
CYCLOPAEDIA_DICT[1359] = {keyword = "武器武当长剑5品黄装" , class = 42 , content = "武器武当长剑5品黄装", command = "d_cmd 2001 12790"}
CYCLOPAEDIA_DICT[1360] = {keyword = "武器武当长剑5品任务蓝装" , class = 42 , content = "武器武当长剑5品任务蓝装", command = "d_cmd 2001 12791"}
CYCLOPAEDIA_DICT[1361] = {keyword = "武器武当长剑5品任务紫装" , class = 42 , content = "武器武当长剑5品任务紫装", command = "d_cmd 2001 12792"}
CYCLOPAEDIA_DICT[1362] = {keyword = "武器华山单剑5品白装" , class = 43 , content = "武器华山单剑5品白装", command = "d_cmd 2001 12793"}
CYCLOPAEDIA_DICT[1363] = {keyword = "武器华山单剑5品蓝装" , class = 43 , content = "武器华山单剑5品蓝装", command = "d_cmd 2001 12794"}
CYCLOPAEDIA_DICT[1364] = {keyword = "武器华山单剑5品紫装" , class = 43 , content = "武器华山单剑5品紫装", command = "d_cmd 2001 12795"}
CYCLOPAEDIA_DICT[1365] = {keyword = "武器华山单剑5品黄装" , class = 43 , content = "武器华山单剑5品黄装", command = "d_cmd 2001 12796"}
CYCLOPAEDIA_DICT[1366] = {keyword = "武器华山单剑5品任务蓝装" , class = 43 , content = "武器华山单剑5品任务蓝装", command = "d_cmd 2001 12797"}
CYCLOPAEDIA_DICT[1367] = {keyword = "武器华山单剑5品任务紫装" , class = 43 , content = "武器华山单剑5品任务紫装", command = "d_cmd 2001 12798"}
CYCLOPAEDIA_DICT[1368] = {keyword = "武器恒山双剑5品白装" , class = 44 , content = "武器恒山双剑5品白装", command = "d_cmd 2001 12799"}
CYCLOPAEDIA_DICT[1369] = {keyword = "武器恒山双剑5品蓝装" , class = 44 , content = "武器恒山双剑5品蓝装", command = "d_cmd 2001 12800"}
CYCLOPAEDIA_DICT[1370] = {keyword = "武器恒山双剑5品紫装" , class = 44 , content = "武器恒山双剑5品紫装", command = "d_cmd 2001 12801"}
CYCLOPAEDIA_DICT[1371] = {keyword = "武器恒山双剑5品黄装" , class = 44 , content = "武器恒山双剑5品黄装", command = "d_cmd 2001 12802"}
CYCLOPAEDIA_DICT[1372] = {keyword = "武器恒山双剑5品任务蓝装" , class = 44 , content = "武器恒山双剑5品任务蓝装", command = "d_cmd 2001 12803"}
CYCLOPAEDIA_DICT[1373] = {keyword = "武器恒山双剑5品任务紫装" , class = 44 , content = "武器恒山双剑5品任务紫装", command = "d_cmd 2001 12804"}
CYCLOPAEDIA_DICT[1374] = {keyword = "武器衡山琴剑5品白装" , class = 45 , content = "武器衡山琴剑5品白装", command = "d_cmd 2001 12805"}
CYCLOPAEDIA_DICT[1375] = {keyword = "武器衡山琴剑5品蓝装" , class = 45 , content = "武器衡山琴剑5品蓝装", command = "d_cmd 2001 12806"}
CYCLOPAEDIA_DICT[1376] = {keyword = "武器衡山琴剑5品紫装" , class = 45 , content = "武器衡山琴剑5品紫装", command = "d_cmd 2001 12807"}
CYCLOPAEDIA_DICT[1377] = {keyword = "武器衡山琴剑5品黄装" , class = 45 , content = "武器衡山琴剑5品黄装", command = "d_cmd 2001 12808"}
CYCLOPAEDIA_DICT[1378] = {keyword = "武器衡山琴剑5品任务蓝装" , class = 45 , content = "武器衡山琴剑5品任务蓝装", command = "d_cmd 2001 12809"}
CYCLOPAEDIA_DICT[1379] = {keyword = "武器衡山琴剑5品任务紫装" , class = 45 , content = "武器衡山琴剑5品任务紫装", command = "d_cmd 2001 12810"}
CYCLOPAEDIA_DICT[1380] = {keyword = "武器日月双刃5品白装" , class = 51 , content = "武器日月双刃5品白装", command = "d_cmd 2001 12811"}
CYCLOPAEDIA_DICT[1381] = {keyword = "武器日月双刃5品蓝装" , class = 51 , content = "武器日月双刃5品蓝装", command = "d_cmd 2001 12812"}
CYCLOPAEDIA_DICT[1382] = {keyword = "武器日月双刃5品紫装" , class = 51 , content = "武器日月双刃5品紫装", command = "d_cmd 2001 12813"}
CYCLOPAEDIA_DICT[1383] = {keyword = "武器日月双刃5品黄装" , class = 51 , content = "武器日月双刃5品黄装", command = "d_cmd 2001 12814"}
CYCLOPAEDIA_DICT[1384] = {keyword = "武器日月双刃5品任务蓝装" , class = 51 , content = "武器日月双刃5品任务蓝装", command = "d_cmd 2001 12815"}
CYCLOPAEDIA_DICT[1385] = {keyword = "武器日月双刃5品任务紫装" , class = 51 , content = "武器日月双刃5品任务紫装", command = "d_cmd 2001 12816"}
CYCLOPAEDIA_DICT[1386] = {keyword = "武器五仙鞭子5品白装" , class = 52 , content = "武器五仙鞭子5品白装", command = "d_cmd 2001 12817"}
CYCLOPAEDIA_DICT[1387] = {keyword = "武器五仙鞭子5品蓝装" , class = 52 , content = "武器五仙鞭子5品蓝装", command = "d_cmd 2001 12818"}
CYCLOPAEDIA_DICT[1388] = {keyword = "武器五仙鞭子5品紫装" , class = 52 , content = "武器五仙鞭子5品紫装", command = "d_cmd 2001 12819"}
CYCLOPAEDIA_DICT[1389] = {keyword = "武器五仙鞭子5品黄装" , class = 52 , content = "武器五仙鞭子5品黄装", command = "d_cmd 2001 12820"}
CYCLOPAEDIA_DICT[1390] = {keyword = "武器五仙鞭子5品任务蓝装" , class = 52 , content = "武器五仙鞭子5品任务蓝装", command = "d_cmd 2001 12821"}
CYCLOPAEDIA_DICT[1391] = {keyword = "武器五仙鞭子5品任务紫装" , class = 52 , content = "武器五仙鞭子5品任务紫装", command = "d_cmd 2001 12822"}
CYCLOPAEDIA_DICT[1392] = {keyword = "武器逍遥扇子5品白装" , class = 53 , content = "武器逍遥扇子5品白装", command = "d_cmd 2001 12823"}
CYCLOPAEDIA_DICT[1393] = {keyword = "武器逍遥扇子5品蓝装" , class = 53 , content = "武器逍遥扇子5品蓝装", command = "d_cmd 2001 12824"}
CYCLOPAEDIA_DICT[1394] = {keyword = "武器逍遥扇子5品紫装" , class = 53 , content = "武器逍遥扇子5品紫装", command = "d_cmd 2001 12825"}
CYCLOPAEDIA_DICT[1395] = {keyword = "武器逍遥扇子5品黄装" , class = 53 , content = "武器逍遥扇子5品黄装", command = "d_cmd 2001 12826"}
CYCLOPAEDIA_DICT[1396] = {keyword = "武器逍遥扇子5品任务蓝装" , class = 53 , content = "武器逍遥扇子5品任务蓝装", command = "d_cmd 2001 12827"}
CYCLOPAEDIA_DICT[1397] = {keyword = "武器逍遥扇子5品任务紫装" , class = 53 , content = "武器逍遥扇子5品任务紫装", command = "d_cmd 2001 12828"}
CYCLOPAEDIA_DICT[1398] = {keyword = "武器唐门拳刃5品白装" , class = 54 , content = "武器唐门拳刃5品白装", command = "d_cmd 2001 12829"}
CYCLOPAEDIA_DICT[1399] = {keyword = "武器唐门拳刃5品蓝装" , class = 54 , content = "武器唐门拳刃5品蓝装", command = "d_cmd 2001 12830"}
CYCLOPAEDIA_DICT[1400] = {keyword = "武器唐门拳刃5品紫装" , class = 54 , content = "武器唐门拳刃5品紫装", command = "d_cmd 2001 12831"}
CYCLOPAEDIA_DICT[1401] = {keyword = "武器唐门拳刃5品黄装" , class = 54 , content = "武器唐门拳刃5品黄装", command = "d_cmd 2001 12832"}
CYCLOPAEDIA_DICT[1402] = {keyword = "武器唐门拳刃5品任务蓝装" , class = 54 , content = "武器唐门拳刃5品任务蓝装", command = "d_cmd 2001 12833"}
CYCLOPAEDIA_DICT[1403] = {keyword = "武器唐门拳刃5品任务紫装" , class = 54 , content = "武器唐门拳刃5品任务紫装", command = "d_cmd 2001 12834"}
CYCLOPAEDIA_DICT[1404] = {keyword = "武器峨眉法杖5品白装" , class = 55 , content = "武器峨眉法杖5品白装", command = "d_cmd 2001 12835"}
CYCLOPAEDIA_DICT[1405] = {keyword = "武器峨眉法杖5品蓝装" , class = 55 , content = "武器峨眉法杖5品蓝装", command = "d_cmd 2001 12836"}
CYCLOPAEDIA_DICT[1406] = {keyword = "武器峨眉法杖5品紫装" , class = 55 , content = "武器峨眉法杖5品紫装", command = "d_cmd 2001 12837"}
CYCLOPAEDIA_DICT[1407] = {keyword = "武器峨眉法杖5品黄装" , class = 55 , content = "武器峨眉法杖5品黄装", command = "d_cmd 2001 12838"}
CYCLOPAEDIA_DICT[1408] = {keyword = "武器峨眉法杖5品任务蓝装" , class = 55 , content = "武器峨眉法杖5品任务蓝装", command = "d_cmd 2001 12839"}
CYCLOPAEDIA_DICT[1409] = {keyword = "武器峨眉法杖5品任务紫装" , class = 55 , content = "武器峨眉法杖5品任务紫装", command = "d_cmd 2001 12840"}
CYCLOPAEDIA_DICT[1410] = {keyword = "布衣通用头部5品白装" , class = 71 , content = "布衣通用头部5品白装", command = "d_cmd 2001 12841"}
CYCLOPAEDIA_DICT[1411] = {keyword = "布衣通用头部5品蓝装" , class = 71 , content = "布衣通用头部5品蓝装", command = "d_cmd 2001 12842"}
CYCLOPAEDIA_DICT[1412] = {keyword = "布衣通用头部5品紫装" , class = 71 , content = "布衣通用头部5品紫装", command = "d_cmd 2001 12843"}
CYCLOPAEDIA_DICT[1413] = {keyword = "布衣通用头部5品黄装" , class = 71 , content = "布衣通用头部5品黄装", command = "d_cmd 2001 12844"}
CYCLOPAEDIA_DICT[1414] = {keyword = "布衣通用头部5品任务蓝装" , class = 71 , content = "布衣通用头部5品任务蓝装", command = "d_cmd 2001 12845"}
CYCLOPAEDIA_DICT[1415] = {keyword = "布衣通用头部5品任务紫装" , class = 71 , content = "布衣通用头部5品任务紫装", command = "d_cmd 2001 12846"}
CYCLOPAEDIA_DICT[1416] = {keyword = "布衣通用上衣5品白装" , class = 72 , content = "布衣通用上衣5品白装", command = "d_cmd 2001 12847"}
CYCLOPAEDIA_DICT[1417] = {keyword = "布衣通用上衣5品蓝装" , class = 72 , content = "布衣通用上衣5品蓝装", command = "d_cmd 2001 12848"}
CYCLOPAEDIA_DICT[1418] = {keyword = "布衣通用上衣5品紫装" , class = 72 , content = "布衣通用上衣5品紫装", command = "d_cmd 2001 12849"}
CYCLOPAEDIA_DICT[1419] = {keyword = "布衣通用上衣5品黄装" , class = 72 , content = "布衣通用上衣5品黄装", command = "d_cmd 2001 12850"}
CYCLOPAEDIA_DICT[1420] = {keyword = "布衣通用上衣5品任务蓝装" , class = 72 , content = "布衣通用上衣5品任务蓝装", command = "d_cmd 2001 12851"}
CYCLOPAEDIA_DICT[1421] = {keyword = "布衣通用上衣5品任务紫装" , class = 72 , content = "布衣通用上衣5品任务紫装", command = "d_cmd 2001 12852"}
CYCLOPAEDIA_DICT[1422] = {keyword = "布衣通用裤子5品白装" , class = 73 , content = "布衣通用裤子5品白装", command = "d_cmd 2001 12853"}
CYCLOPAEDIA_DICT[1423] = {keyword = "布衣通用裤子5品蓝装" , class = 73 , content = "布衣通用裤子5品蓝装", command = "d_cmd 2001 12854"}
CYCLOPAEDIA_DICT[1424] = {keyword = "布衣通用裤子5品紫装" , class = 73 , content = "布衣通用裤子5品紫装", command = "d_cmd 2001 12855"}
CYCLOPAEDIA_DICT[1425] = {keyword = "布衣通用裤子5品黄装" , class = 73 , content = "布衣通用裤子5品黄装", command = "d_cmd 2001 12856"}
CYCLOPAEDIA_DICT[1426] = {keyword = "布衣通用裤子5品任务蓝装" , class = 73 , content = "布衣通用裤子5品任务蓝装", command = "d_cmd 2001 12857"}
CYCLOPAEDIA_DICT[1427] = {keyword = "布衣通用裤子5品任务紫装" , class = 73 , content = "布衣通用裤子5品任务紫装", command = "d_cmd 2001 12858"}
CYCLOPAEDIA_DICT[1428] = {keyword = "布衣通用鞋子5品白装" , class = 75 , content = "布衣通用鞋子5品白装", command = "d_cmd 2001 12859"}
CYCLOPAEDIA_DICT[1429] = {keyword = "布衣通用鞋子5品蓝装" , class = 75 , content = "布衣通用鞋子5品蓝装", command = "d_cmd 2001 12860"}
CYCLOPAEDIA_DICT[1430] = {keyword = "布衣通用鞋子5品紫装" , class = 75 , content = "布衣通用鞋子5品紫装", command = "d_cmd 2001 12861"}
CYCLOPAEDIA_DICT[1431] = {keyword = "布衣通用鞋子5品黄装" , class = 75 , content = "布衣通用鞋子5品黄装", command = "d_cmd 2001 12862"}
CYCLOPAEDIA_DICT[1432] = {keyword = "布衣通用鞋子5品任务蓝装" , class = 75 , content = "布衣通用鞋子5品任务蓝装", command = "d_cmd 2001 12863"}
CYCLOPAEDIA_DICT[1433] = {keyword = "布衣通用鞋子5品任务紫装" , class = 75 , content = "布衣通用鞋子5品任务紫装", command = "d_cmd 2001 12864"}
CYCLOPAEDIA_DICT[1434] = {keyword = "布衣通用护腕5品白装" , class = 74 , content = "布衣通用护腕5品白装", command = "d_cmd 2001 12865"}
CYCLOPAEDIA_DICT[1435] = {keyword = "布衣通用护腕5品蓝装" , class = 74 , content = "布衣通用护腕5品蓝装", command = "d_cmd 2001 12866"}
CYCLOPAEDIA_DICT[1436] = {keyword = "布衣通用护腕5品紫装" , class = 74 , content = "布衣通用护腕5品紫装", command = "d_cmd 2001 12867"}
CYCLOPAEDIA_DICT[1437] = {keyword = "布衣通用护腕5品黄装" , class = 74 , content = "布衣通用护腕5品黄装", command = "d_cmd 2001 12868"}
CYCLOPAEDIA_DICT[1438] = {keyword = "布衣通用护腕5品任务蓝装" , class = 74 , content = "布衣通用护腕5品任务蓝装", command = "d_cmd 2001 12869"}
CYCLOPAEDIA_DICT[1439] = {keyword = "布衣通用护腕5品任务紫装" , class = 74 , content = "布衣通用护腕5品任务紫装", command = "d_cmd 2001 12870"}
CYCLOPAEDIA_DICT[1440] = {keyword = "棉甲通用头部5品白装" , class = 81 , content = "棉甲通用头部5品白装", command = "d_cmd 2001 12871"}
CYCLOPAEDIA_DICT[1441] = {keyword = "棉甲通用头部5品蓝装" , class = 81 , content = "棉甲通用头部5品蓝装", command = "d_cmd 2001 12872"}
CYCLOPAEDIA_DICT[1442] = {keyword = "棉甲通用头部5品紫装" , class = 81 , content = "棉甲通用头部5品紫装", command = "d_cmd 2001 12873"}
CYCLOPAEDIA_DICT[1443] = {keyword = "棉甲通用头部5品黄装" , class = 81 , content = "棉甲通用头部5品黄装", command = "d_cmd 2001 12874"}
CYCLOPAEDIA_DICT[1444] = {keyword = "棉甲通用头部5品任务蓝装" , class = 81 , content = "棉甲通用头部5品任务蓝装", command = "d_cmd 2001 12875"}
CYCLOPAEDIA_DICT[1445] = {keyword = "棉甲通用头部5品任务紫装" , class = 81 , content = "棉甲通用头部5品任务紫装", command = "d_cmd 2001 12876"}
CYCLOPAEDIA_DICT[1446] = {keyword = "棉甲通用上衣5品白装" , class = 82 , content = "棉甲通用上衣5品白装", command = "d_cmd 2001 12877"}
CYCLOPAEDIA_DICT[1447] = {keyword = "棉甲通用上衣5品蓝装" , class = 82 , content = "棉甲通用上衣5品蓝装", command = "d_cmd 2001 12878"}
CYCLOPAEDIA_DICT[1448] = {keyword = "棉甲通用上衣5品紫装" , class = 82 , content = "棉甲通用上衣5品紫装", command = "d_cmd 2001 12879"}
CYCLOPAEDIA_DICT[1449] = {keyword = "棉甲通用上衣5品黄装" , class = 82 , content = "棉甲通用上衣5品黄装", command = "d_cmd 2001 12880"}
CYCLOPAEDIA_DICT[1450] = {keyword = "棉甲通用上衣5品任务蓝装" , class = 82 , content = "棉甲通用上衣5品任务蓝装", command = "d_cmd 2001 12881"}
CYCLOPAEDIA_DICT[1451] = {keyword = "棉甲通用上衣5品任务紫装" , class = 82 , content = "棉甲通用上衣5品任务紫装", command = "d_cmd 2001 12882"}
CYCLOPAEDIA_DICT[1452] = {keyword = "棉甲通用裤子5品白装" , class = 83 , content = "棉甲通用裤子5品白装", command = "d_cmd 2001 12883"}
CYCLOPAEDIA_DICT[1453] = {keyword = "棉甲通用裤子5品蓝装" , class = 83 , content = "棉甲通用裤子5品蓝装", command = "d_cmd 2001 12884"}
CYCLOPAEDIA_DICT[1454] = {keyword = "棉甲通用裤子5品紫装" , class = 83 , content = "棉甲通用裤子5品紫装", command = "d_cmd 2001 12885"}
CYCLOPAEDIA_DICT[1455] = {keyword = "棉甲通用裤子5品黄装" , class = 83 , content = "棉甲通用裤子5品黄装", command = "d_cmd 2001 12886"}
CYCLOPAEDIA_DICT[1456] = {keyword = "棉甲通用裤子5品任务蓝装" , class = 83 , content = "棉甲通用裤子5品任务蓝装", command = "d_cmd 2001 12887"}
CYCLOPAEDIA_DICT[1457] = {keyword = "棉甲通用裤子5品任务紫装" , class = 83 , content = "棉甲通用裤子5品任务紫装", command = "d_cmd 2001 12888"}
CYCLOPAEDIA_DICT[1458] = {keyword = "棉甲通用鞋子5品白装" , class = 85 , content = "棉甲通用鞋子5品白装", command = "d_cmd 2001 12889"}
CYCLOPAEDIA_DICT[1459] = {keyword = "棉甲通用鞋子5品蓝装" , class = 85 , content = "棉甲通用鞋子5品蓝装", command = "d_cmd 2001 12890"}
CYCLOPAEDIA_DICT[1460] = {keyword = "棉甲通用鞋子5品紫装" , class = 85 , content = "棉甲通用鞋子5品紫装", command = "d_cmd 2001 12891"}
CYCLOPAEDIA_DICT[1461] = {keyword = "棉甲通用鞋子5品黄装" , class = 85 , content = "棉甲通用鞋子5品黄装", command = "d_cmd 2001 12892"}
CYCLOPAEDIA_DICT[1462] = {keyword = "棉甲通用鞋子5品任务蓝装" , class = 85 , content = "棉甲通用鞋子5品任务蓝装", command = "d_cmd 2001 12893"}
CYCLOPAEDIA_DICT[1463] = {keyword = "棉甲通用鞋子5品任务紫装" , class = 85 , content = "棉甲通用鞋子5品任务紫装", command = "d_cmd 2001 12894"}
CYCLOPAEDIA_DICT[1464] = {keyword = "棉甲通用护腕5品白装" , class = 84 , content = "棉甲通用护腕5品白装", command = "d_cmd 2001 12895"}
CYCLOPAEDIA_DICT[1465] = {keyword = "棉甲通用护腕5品蓝装" , class = 84 , content = "棉甲通用护腕5品蓝装", command = "d_cmd 2001 12896"}
CYCLOPAEDIA_DICT[1466] = {keyword = "棉甲通用护腕5品紫装" , class = 84 , content = "棉甲通用护腕5品紫装", command = "d_cmd 2001 12897"}
CYCLOPAEDIA_DICT[1467] = {keyword = "棉甲通用护腕5品黄装" , class = 84 , content = "棉甲通用护腕5品黄装", command = "d_cmd 2001 12898"}
CYCLOPAEDIA_DICT[1468] = {keyword = "棉甲通用护腕5品任务蓝装" , class = 84 , content = "棉甲通用护腕5品任务蓝装", command = "d_cmd 2001 12899"}
CYCLOPAEDIA_DICT[1469] = {keyword = "棉甲通用护腕5品任务紫装" , class = 84 , content = "棉甲通用护腕5品任务紫装", command = "d_cmd 2001 12900"}
CYCLOPAEDIA_DICT[1470] = {keyword = "皮甲通用头部5品白装" , class = 91 , content = "皮甲通用头部5品白装", command = "d_cmd 2001 12901"}
CYCLOPAEDIA_DICT[1471] = {keyword = "皮甲通用头部5品蓝装" , class = 91 , content = "皮甲通用头部5品蓝装", command = "d_cmd 2001 12902"}
CYCLOPAEDIA_DICT[1472] = {keyword = "皮甲通用头部5品紫装" , class = 91 , content = "皮甲通用头部5品紫装", command = "d_cmd 2001 12903"}
CYCLOPAEDIA_DICT[1473] = {keyword = "皮甲通用头部5品黄装" , class = 91 , content = "皮甲通用头部5品黄装", command = "d_cmd 2001 12904"}
CYCLOPAEDIA_DICT[1474] = {keyword = "皮甲通用头部5品任务蓝装" , class = 91 , content = "皮甲通用头部5品任务蓝装", command = "d_cmd 2001 12905"}
CYCLOPAEDIA_DICT[1475] = {keyword = "皮甲通用头部5品任务紫装" , class = 91 , content = "皮甲通用头部5品任务紫装", command = "d_cmd 2001 12906"}
CYCLOPAEDIA_DICT[1476] = {keyword = "皮甲通用上衣5品白装" , class = 92 , content = "皮甲通用上衣5品白装", command = "d_cmd 2001 12907"}
CYCLOPAEDIA_DICT[1477] = {keyword = "皮甲通用上衣5品蓝装" , class = 92 , content = "皮甲通用上衣5品蓝装", command = "d_cmd 2001 12908"}
CYCLOPAEDIA_DICT[1478] = {keyword = "皮甲通用上衣5品紫装" , class = 92 , content = "皮甲通用上衣5品紫装", command = "d_cmd 2001 12909"}
CYCLOPAEDIA_DICT[1479] = {keyword = "皮甲通用上衣5品黄装" , class = 92 , content = "皮甲通用上衣5品黄装", command = "d_cmd 2001 12910"}
CYCLOPAEDIA_DICT[1480] = {keyword = "皮甲通用上衣5品任务蓝装" , class = 92 , content = "皮甲通用上衣5品任务蓝装", command = "d_cmd 2001 12911"}
CYCLOPAEDIA_DICT[1481] = {keyword = "皮甲通用上衣5品任务紫装" , class = 92 , content = "皮甲通用上衣5品任务紫装", command = "d_cmd 2001 12912"}
CYCLOPAEDIA_DICT[1482] = {keyword = "皮甲通用裤子5品白装" , class = 93 , content = "皮甲通用裤子5品白装", command = "d_cmd 2001 12913"}
CYCLOPAEDIA_DICT[1483] = {keyword = "皮甲通用裤子5品蓝装" , class = 93 , content = "皮甲通用裤子5品蓝装", command = "d_cmd 2001 12914"}
CYCLOPAEDIA_DICT[1484] = {keyword = "皮甲通用裤子5品紫装" , class = 93 , content = "皮甲通用裤子5品紫装", command = "d_cmd 2001 12915"}
CYCLOPAEDIA_DICT[1485] = {keyword = "皮甲通用裤子5品黄装" , class = 93 , content = "皮甲通用裤子5品黄装", command = "d_cmd 2001 12916"}
CYCLOPAEDIA_DICT[1486] = {keyword = "皮甲通用裤子5品任务蓝装" , class = 93 , content = "皮甲通用裤子5品任务蓝装", command = "d_cmd 2001 12917"}
CYCLOPAEDIA_DICT[1487] = {keyword = "皮甲通用裤子5品任务紫装" , class = 93 , content = "皮甲通用裤子5品任务紫装", command = "d_cmd 2001 12918"}
CYCLOPAEDIA_DICT[1488] = {keyword = "皮甲通用鞋子5品白装" , class = 95 , content = "皮甲通用鞋子5品白装", command = "d_cmd 2001 12919"}
CYCLOPAEDIA_DICT[1489] = {keyword = "皮甲通用鞋子5品蓝装" , class = 95 , content = "皮甲通用鞋子5品蓝装", command = "d_cmd 2001 12920"}
CYCLOPAEDIA_DICT[1490] = {keyword = "皮甲通用鞋子5品紫装" , class = 95 , content = "皮甲通用鞋子5品紫装", command = "d_cmd 2001 12921"}
CYCLOPAEDIA_DICT[1491] = {keyword = "皮甲通用鞋子5品黄装" , class = 95 , content = "皮甲通用鞋子5品黄装", command = "d_cmd 2001 12922"}
CYCLOPAEDIA_DICT[1492] = {keyword = "皮甲通用鞋子5品任务蓝装" , class = 95 , content = "皮甲通用鞋子5品任务蓝装", command = "d_cmd 2001 12923"}
CYCLOPAEDIA_DICT[1493] = {keyword = "皮甲通用鞋子5品任务紫装" , class = 95 , content = "皮甲通用鞋子5品任务紫装", command = "d_cmd 2001 12924"}
CYCLOPAEDIA_DICT[1494] = {keyword = "皮甲通用护腕5品白装" , class = 94 , content = "皮甲通用护腕5品白装", command = "d_cmd 2001 12925"}
CYCLOPAEDIA_DICT[1495] = {keyword = "皮甲通用护腕5品蓝装" , class = 94 , content = "皮甲通用护腕5品蓝装", command = "d_cmd 2001 12926"}
CYCLOPAEDIA_DICT[1496] = {keyword = "皮甲通用护腕5品紫装" , class = 94 , content = "皮甲通用护腕5品紫装", command = "d_cmd 2001 12927"}
CYCLOPAEDIA_DICT[1497] = {keyword = "皮甲通用护腕5品黄装" , class = 94 , content = "皮甲通用护腕5品黄装", command = "d_cmd 2001 12928"}
CYCLOPAEDIA_DICT[1498] = {keyword = "皮甲通用护腕5品任务蓝装" , class = 94 , content = "皮甲通用护腕5品任务蓝装", command = "d_cmd 2001 12929"}
CYCLOPAEDIA_DICT[1499] = {keyword = "皮甲通用护腕5品任务紫装" , class = 94 , content = "皮甲通用护腕5品任务紫装", command = "d_cmd 2001 12930"}
CYCLOPAEDIA_DICT[1500] = {keyword = "戒指1品蓝装" , class = 61 , content = "戒指1品蓝装", command = "d_cmd 2001 16028"}
CYCLOPAEDIA_DICT[1501] = {keyword = "戒指1品紫装" , class = 61 , content = "戒指1品紫装", command = "d_cmd 2001 16029"}
CYCLOPAEDIA_DICT[1502] = {keyword = "戒指1品黄装" , class = 61 , content = "戒指1品黄装", command = "d_cmd 2001 16030"}
CYCLOPAEDIA_DICT[1503] = {keyword = "戒指1品任务蓝装" , class = 61 , content = "戒指1品任务蓝装", command = "d_cmd 2001 16031"}
CYCLOPAEDIA_DICT[1504] = {keyword = "戒指1品任务紫装" , class = 61 , content = "戒指1品任务紫装", command = "d_cmd 2001 16032"}
CYCLOPAEDIA_DICT[1505] = {keyword = "戒指1品蓝装" , class = 61 , content = "戒指1品蓝装", command = "d_cmd 2001 16033"}
CYCLOPAEDIA_DICT[1506] = {keyword = "戒指1品紫装" , class = 61 , content = "戒指1品紫装", command = "d_cmd 2001 16034"}
CYCLOPAEDIA_DICT[1507] = {keyword = "戒指1品黄装" , class = 61 , content = "戒指1品黄装", command = "d_cmd 2001 16035"}
CYCLOPAEDIA_DICT[1508] = {keyword = "戒指1品任务蓝装" , class = 61 , content = "戒指1品任务蓝装", command = "d_cmd 2001 16036"}
CYCLOPAEDIA_DICT[1509] = {keyword = "戒指1品任务紫装" , class = 61 , content = "戒指1品任务紫装", command = "d_cmd 2001 16037"}
CYCLOPAEDIA_DICT[1510] = {keyword = "戒指2品蓝装" , class = 61 , content = "戒指2品蓝装", command = "d_cmd 2001 16038"}
CYCLOPAEDIA_DICT[1511] = {keyword = "戒指2品紫装" , class = 61 , content = "戒指2品紫装", command = "d_cmd 2001 16039"}
CYCLOPAEDIA_DICT[1512] = {keyword = "戒指2品黄装" , class = 61 , content = "戒指2品黄装", command = "d_cmd 2001 16040"}
CYCLOPAEDIA_DICT[1513] = {keyword = "戒指2品任务蓝装" , class = 61 , content = "戒指2品任务蓝装", command = "d_cmd 2001 16041"}
CYCLOPAEDIA_DICT[1514] = {keyword = "戒指2品任务紫装" , class = 61 , content = "戒指2品任务紫装", command = "d_cmd 2001 16042"}
CYCLOPAEDIA_DICT[1515] = {keyword = "戒指2品蓝装" , class = 61 , content = "戒指2品蓝装", command = "d_cmd 2001 16043"}
CYCLOPAEDIA_DICT[1516] = {keyword = "戒指2品紫装" , class = 61 , content = "戒指2品紫装", command = "d_cmd 2001 16044"}
CYCLOPAEDIA_DICT[1517] = {keyword = "戒指2品黄装" , class = 61 , content = "戒指2品黄装", command = "d_cmd 2001 16045"}
CYCLOPAEDIA_DICT[1518] = {keyword = "戒指2品任务蓝装" , class = 61 , content = "戒指2品任务蓝装", command = "d_cmd 2001 16046"}
CYCLOPAEDIA_DICT[1519] = {keyword = "戒指2品任务紫装" , class = 61 , content = "戒指2品任务紫装", command = "d_cmd 2001 16047"}
CYCLOPAEDIA_DICT[1520] = {keyword = "戒指3品蓝装" , class = 61 , content = "戒指3品蓝装", command = "d_cmd 2001 16048"}
CYCLOPAEDIA_DICT[1521] = {keyword = "戒指3品紫装" , class = 61 , content = "戒指3品紫装", command = "d_cmd 2001 16049"}
CYCLOPAEDIA_DICT[1522] = {keyword = "戒指3品黄装" , class = 61 , content = "戒指3品黄装", command = "d_cmd 2001 16050"}
CYCLOPAEDIA_DICT[1523] = {keyword = "戒指3品任务蓝装" , class = 61 , content = "戒指3品任务蓝装", command = "d_cmd 2001 16051"}
CYCLOPAEDIA_DICT[1524] = {keyword = "戒指3品任务紫装" , class = 61 , content = "戒指3品任务紫装", command = "d_cmd 2001 16052"}
CYCLOPAEDIA_DICT[1525] = {keyword = "戒指3品蓝装" , class = 61 , content = "戒指3品蓝装", command = "d_cmd 2001 16053"}
CYCLOPAEDIA_DICT[1526] = {keyword = "戒指3品紫装" , class = 61 , content = "戒指3品紫装", command = "d_cmd 2001 16054"}
CYCLOPAEDIA_DICT[1527] = {keyword = "戒指3品黄装" , class = 61 , content = "戒指3品黄装", command = "d_cmd 2001 16055"}
CYCLOPAEDIA_DICT[1528] = {keyword = "戒指3品任务蓝装" , class = 61 , content = "戒指3品任务蓝装", command = "d_cmd 2001 16056"}
CYCLOPAEDIA_DICT[1529] = {keyword = "戒指3品任务紫装" , class = 61 , content = "戒指3品任务紫装", command = "d_cmd 2001 16057"}
CYCLOPAEDIA_DICT[1530] = {keyword = "戒指4品蓝装" , class = 61 , content = "戒指4品蓝装", command = "d_cmd 2001 16058"}
CYCLOPAEDIA_DICT[1531] = {keyword = "戒指4品紫装" , class = 61 , content = "戒指4品紫装", command = "d_cmd 2001 16059"}
CYCLOPAEDIA_DICT[1532] = {keyword = "戒指4品黄装" , class = 61 , content = "戒指4品黄装", command = "d_cmd 2001 16060"}
CYCLOPAEDIA_DICT[1533] = {keyword = "戒指4品任务蓝装" , class = 61 , content = "戒指4品任务蓝装", command = "d_cmd 2001 16061"}
CYCLOPAEDIA_DICT[1534] = {keyword = "戒指4品任务紫装" , class = 61 , content = "戒指4品任务紫装", command = "d_cmd 2001 16062"}
CYCLOPAEDIA_DICT[1535] = {keyword = "戒指4品蓝装" , class = 61 , content = "戒指4品蓝装", command = "d_cmd 2001 16063"}
CYCLOPAEDIA_DICT[1536] = {keyword = "戒指4品紫装" , class = 61 , content = "戒指4品紫装", command = "d_cmd 2001 16064"}
CYCLOPAEDIA_DICT[1537] = {keyword = "戒指4品黄装" , class = 61 , content = "戒指4品黄装", command = "d_cmd 2001 16065"}
CYCLOPAEDIA_DICT[1538] = {keyword = "戒指4品任务蓝装" , class = 61 , content = "戒指4品任务蓝装", command = "d_cmd 2001 16066"}
CYCLOPAEDIA_DICT[1539] = {keyword = "戒指4品任务紫装" , class = 61 , content = "戒指4品任务紫装", command = "d_cmd 2001 16067"}
CYCLOPAEDIA_DICT[1540] = {keyword = "戒指5品蓝装" , class = 61 , content = "戒指5品蓝装", command = "d_cmd 2001 16068"}
CYCLOPAEDIA_DICT[1541] = {keyword = "戒指5品紫装" , class = 61 , content = "戒指5品紫装", command = "d_cmd 2001 16069"}
CYCLOPAEDIA_DICT[1542] = {keyword = "戒指5品黄装" , class = 61 , content = "戒指5品黄装", command = "d_cmd 2001 16070"}
CYCLOPAEDIA_DICT[1543] = {keyword = "戒指5品任务蓝装" , class = 61 , content = "戒指5品任务蓝装", command = "d_cmd 2001 16071"}
CYCLOPAEDIA_DICT[1544] = {keyword = "戒指5品任务紫装" , class = 61 , content = "戒指5品任务紫装", command = "d_cmd 2001 16072"}
CYCLOPAEDIA_DICT[1545] = {keyword = "戒指5品蓝装" , class = 61 , content = "戒指5品蓝装", command = "d_cmd 2001 16073"}
CYCLOPAEDIA_DICT[1546] = {keyword = "戒指5品紫装" , class = 61 , content = "戒指5品紫装", command = "d_cmd 2001 16074"}
CYCLOPAEDIA_DICT[1547] = {keyword = "戒指5品黄装" , class = 61 , content = "戒指5品黄装", command = "d_cmd 2001 16075"}
CYCLOPAEDIA_DICT[1548] = {keyword = "戒指5品任务蓝装" , class = 61 , content = "戒指5品任务蓝装", command = "d_cmd 2001 16076"}
CYCLOPAEDIA_DICT[1549] = {keyword = "戒指5品任务紫装" , class = 61 , content = "戒指5品任务紫装", command = "d_cmd 2001 16077"}
CYCLOPAEDIA_DICT[1550] = {keyword = "戒指6品蓝装" , class = 61 , content = "戒指6品蓝装", command = "d_cmd 2001 16078"}
CYCLOPAEDIA_DICT[1551] = {keyword = "戒指6品紫装" , class = 61 , content = "戒指6品紫装", command = "d_cmd 2001 16079"}
CYCLOPAEDIA_DICT[1552] = {keyword = "戒指6品黄装" , class = 61 , content = "戒指6品黄装", command = "d_cmd 2001 16080"}
CYCLOPAEDIA_DICT[1553] = {keyword = "戒指6品任务蓝装" , class = 61 , content = "戒指6品任务蓝装", command = "d_cmd 2001 16081"}
CYCLOPAEDIA_DICT[1554] = {keyword = "戒指6品任务紫装" , class = 61 , content = "戒指6品任务紫装", command = "d_cmd 2001 16082"}
CYCLOPAEDIA_DICT[1555] = {keyword = "戒指6品蓝装" , class = 61 , content = "戒指6品蓝装", command = "d_cmd 2001 16083"}
CYCLOPAEDIA_DICT[1556] = {keyword = "戒指6品紫装" , class = 61 , content = "戒指6品紫装", command = "d_cmd 2001 16084"}
CYCLOPAEDIA_DICT[1557] = {keyword = "戒指6品黄装" , class = 61 , content = "戒指6品黄装", command = "d_cmd 2001 16085"}
CYCLOPAEDIA_DICT[1558] = {keyword = "戒指6品任务蓝装" , class = 61 , content = "戒指6品任务蓝装", command = "d_cmd 2001 16086"}
CYCLOPAEDIA_DICT[1559] = {keyword = "戒指6品任务紫装" , class = 61 , content = "戒指6品任务紫装", command = "d_cmd 2001 16087"}
CYCLOPAEDIA_DICT[1560] = {keyword = "戒指7品蓝装" , class = 61 , content = "戒指7品蓝装", command = "d_cmd 2001 16088"}
CYCLOPAEDIA_DICT[1561] = {keyword = "戒指7品紫装" , class = 61 , content = "戒指7品紫装", command = "d_cmd 2001 16089"}
CYCLOPAEDIA_DICT[1562] = {keyword = "戒指7品黄装" , class = 61 , content = "戒指7品黄装", command = "d_cmd 2001 16090"}
CYCLOPAEDIA_DICT[1563] = {keyword = "戒指7品任务蓝装" , class = 61 , content = "戒指7品任务蓝装", command = "d_cmd 2001 16091"}
CYCLOPAEDIA_DICT[1564] = {keyword = "戒指7品任务紫装" , class = 61 , content = "戒指7品任务紫装", command = "d_cmd 2001 16092"}
CYCLOPAEDIA_DICT[1565] = {keyword = "戒指7品蓝装" , class = 61 , content = "戒指7品蓝装", command = "d_cmd 2001 16093"}
CYCLOPAEDIA_DICT[1566] = {keyword = "戒指7品紫装" , class = 61 , content = "戒指7品紫装", command = "d_cmd 2001 16094"}
CYCLOPAEDIA_DICT[1567] = {keyword = "戒指7品黄装" , class = 61 , content = "戒指7品黄装", command = "d_cmd 2001 16095"}
CYCLOPAEDIA_DICT[1568] = {keyword = "戒指7品任务蓝装" , class = 61 , content = "戒指7品任务蓝装", command = "d_cmd 2001 16096"}
CYCLOPAEDIA_DICT[1569] = {keyword = "戒指7品任务紫装" , class = 61 , content = "戒指7品任务紫装", command = "d_cmd 2001 16097"}
CYCLOPAEDIA_DICT[1570] = {keyword = "戒指8品蓝装" , class = 61 , content = "戒指8品蓝装", command = "d_cmd 2001 16098"}
CYCLOPAEDIA_DICT[1571] = {keyword = "戒指8品紫装" , class = 61 , content = "戒指8品紫装", command = "d_cmd 2001 16099"}
CYCLOPAEDIA_DICT[1572] = {keyword = "戒指8品黄装" , class = 61 , content = "戒指8品黄装", command = "d_cmd 2001 16100"}
CYCLOPAEDIA_DICT[1573] = {keyword = "戒指8品任务蓝装" , class = 61 , content = "戒指8品任务蓝装", command = "d_cmd 2001 16101"}
CYCLOPAEDIA_DICT[1574] = {keyword = "戒指8品任务紫装" , class = 61 , content = "戒指8品任务紫装", command = "d_cmd 2001 16102"}
CYCLOPAEDIA_DICT[1575] = {keyword = "戒指8品蓝装" , class = 61 , content = "戒指8品蓝装", command = "d_cmd 2001 16103"}
CYCLOPAEDIA_DICT[1576] = {keyword = "戒指8品紫装" , class = 61 , content = "戒指8品紫装", command = "d_cmd 2001 16104"}
CYCLOPAEDIA_DICT[1577] = {keyword = "戒指8品黄装" , class = 61 , content = "戒指8品黄装", command = "d_cmd 2001 16105"}
CYCLOPAEDIA_DICT[1578] = {keyword = "戒指8品任务蓝装" , class = 61 , content = "戒指8品任务蓝装", command = "d_cmd 2001 16106"}
CYCLOPAEDIA_DICT[1579] = {keyword = "戒指8品任务紫装" , class = 61 , content = "戒指8品任务紫装", command = "d_cmd 2001 16107"}
CYCLOPAEDIA_DICT[1580] = {keyword = "戒指9品蓝装" , class = 61 , content = "戒指9品蓝装", command = "d_cmd 2001 16108"}
CYCLOPAEDIA_DICT[1581] = {keyword = "戒指9品紫装" , class = 61 , content = "戒指9品紫装", command = "d_cmd 2001 16109"}
CYCLOPAEDIA_DICT[1582] = {keyword = "戒指9品黄装" , class = 61 , content = "戒指9品黄装", command = "d_cmd 2001 16110"}
CYCLOPAEDIA_DICT[1583] = {keyword = "戒指9品任务蓝装" , class = 61 , content = "戒指9品任务蓝装", command = "d_cmd 2001 16111"}
CYCLOPAEDIA_DICT[1584] = {keyword = "戒指9品任务紫装" , class = 61 , content = "戒指9品任务紫装", command = "d_cmd 2001 16112"}
CYCLOPAEDIA_DICT[1585] = {keyword = "戒指9品蓝装" , class = 61 , content = "戒指9品蓝装", command = "d_cmd 2001 16113"}
CYCLOPAEDIA_DICT[1586] = {keyword = "戒指9品紫装" , class = 61 , content = "戒指9品紫装", command = "d_cmd 2001 16114"}
CYCLOPAEDIA_DICT[1587] = {keyword = "戒指9品黄装" , class = 61 , content = "戒指9品黄装", command = "d_cmd 2001 16115"}
CYCLOPAEDIA_DICT[1588] = {keyword = "戒指9品任务蓝装" , class = 61 , content = "戒指9品任务蓝装", command = "d_cmd 2001 16116"}
CYCLOPAEDIA_DICT[1589] = {keyword = "戒指9品任务紫装" , class = 61 , content = "戒指9品任务紫装", command = "d_cmd 2001 16117"}
CYCLOPAEDIA_DICT[1590] = {keyword = "戒指10品蓝装" , class = 61 , content = "戒指10品蓝装", command = "d_cmd 2001 16118"}
CYCLOPAEDIA_DICT[1591] = {keyword = "戒指10品紫装" , class = 61 , content = "戒指10品紫装", command = "d_cmd 2001 16119"}
CYCLOPAEDIA_DICT[1592] = {keyword = "戒指10品黄装" , class = 61 , content = "戒指10品黄装", command = "d_cmd 2001 16120"}
CYCLOPAEDIA_DICT[1593] = {keyword = "戒指10品任务蓝装" , class = 61 , content = "戒指10品任务蓝装", command = "d_cmd 2001 16121"}
CYCLOPAEDIA_DICT[1594] = {keyword = "戒指10品任务紫装" , class = 61 , content = "戒指10品任务紫装", command = "d_cmd 2001 16122"}
CYCLOPAEDIA_DICT[1595] = {keyword = "戒指10品蓝装" , class = 61 , content = "戒指10品蓝装", command = "d_cmd 2001 16123"}
CYCLOPAEDIA_DICT[1596] = {keyword = "戒指10品紫装" , class = 61 , content = "戒指10品紫装", command = "d_cmd 2001 16124"}
CYCLOPAEDIA_DICT[1597] = {keyword = "戒指10品黄装" , class = 61 , content = "戒指10品黄装", command = "d_cmd 2001 16125"}
CYCLOPAEDIA_DICT[1598] = {keyword = "戒指10品任务蓝装" , class = 61 , content = "戒指10品任务蓝装", command = "d_cmd 2001 16126"}
CYCLOPAEDIA_DICT[1599] = {keyword = "戒指10品任务紫装" , class = 61 , content = "戒指10品任务紫装", command = "d_cmd 2001 16127"}
CYCLOPAEDIA_DICT[1600] = {keyword = "项链1品蓝装" , class = 61 , content = "项链1品蓝装", command = "d_cmd 2001 16128"}
CYCLOPAEDIA_DICT[1601] = {keyword = "项链1品紫装" , class = 61 , content = "项链1品紫装", command = "d_cmd 2001 16129"}
CYCLOPAEDIA_DICT[1602] = {keyword = "项链1品黄装" , class = 61 , content = "项链1品黄装", command = "d_cmd 2001 16130"}
CYCLOPAEDIA_DICT[1603] = {keyword = "项链1品任务蓝装" , class = 61 , content = "项链1品任务蓝装", command = "d_cmd 2001 16131"}
CYCLOPAEDIA_DICT[1604] = {keyword = "项链1品任务紫装" , class = 61 , content = "项链1品任务紫装", command = "d_cmd 2001 16132"}
CYCLOPAEDIA_DICT[1605] = {keyword = "项链1品蓝装" , class = 61 , content = "项链1品蓝装", command = "d_cmd 2001 16133"}
CYCLOPAEDIA_DICT[1606] = {keyword = "项链1品紫装" , class = 61 , content = "项链1品紫装", command = "d_cmd 2001 16134"}
CYCLOPAEDIA_DICT[1607] = {keyword = "项链1品黄装" , class = 61 , content = "项链1品黄装", command = "d_cmd 2001 16135"}
CYCLOPAEDIA_DICT[1608] = {keyword = "项链1品任务蓝装" , class = 61 , content = "项链1品任务蓝装", command = "d_cmd 2001 16136"}
CYCLOPAEDIA_DICT[1609] = {keyword = "项链1品任务紫装" , class = 61 , content = "项链1品任务紫装", command = "d_cmd 2001 16137"}
CYCLOPAEDIA_DICT[1610] = {keyword = "项链2品蓝装" , class = 61 , content = "项链2品蓝装", command = "d_cmd 2001 16138"}
CYCLOPAEDIA_DICT[1611] = {keyword = "项链2品紫装" , class = 61 , content = "项链2品紫装", command = "d_cmd 2001 16139"}
CYCLOPAEDIA_DICT[1612] = {keyword = "项链2品黄装" , class = 61 , content = "项链2品黄装", command = "d_cmd 2001 16140"}
CYCLOPAEDIA_DICT[1613] = {keyword = "项链2品任务蓝装" , class = 61 , content = "项链2品任务蓝装", command = "d_cmd 2001 16141"}
CYCLOPAEDIA_DICT[1614] = {keyword = "项链2品任务紫装" , class = 61 , content = "项链2品任务紫装", command = "d_cmd 2001 16142"}
CYCLOPAEDIA_DICT[1615] = {keyword = "项链2品蓝装" , class = 61 , content = "项链2品蓝装", command = "d_cmd 2001 16143"}
CYCLOPAEDIA_DICT[1616] = {keyword = "项链2品紫装" , class = 61 , content = "项链2品紫装", command = "d_cmd 2001 16144"}
CYCLOPAEDIA_DICT[1617] = {keyword = "项链2品黄装" , class = 61 , content = "项链2品黄装", command = "d_cmd 2001 16145"}
CYCLOPAEDIA_DICT[1618] = {keyword = "项链2品任务蓝装" , class = 61 , content = "项链2品任务蓝装", command = "d_cmd 2001 16146"}
CYCLOPAEDIA_DICT[1619] = {keyword = "项链2品任务紫装" , class = 61 , content = "项链2品任务紫装", command = "d_cmd 2001 16147"}
CYCLOPAEDIA_DICT[1620] = {keyword = "项链3品蓝装" , class = 61 , content = "项链3品蓝装", command = "d_cmd 2001 16148"}
CYCLOPAEDIA_DICT[1621] = {keyword = "项链3品紫装" , class = 61 , content = "项链3品紫装", command = "d_cmd 2001 16149"}
CYCLOPAEDIA_DICT[1622] = {keyword = "项链3品黄装" , class = 61 , content = "项链3品黄装", command = "d_cmd 2001 16150"}
CYCLOPAEDIA_DICT[1623] = {keyword = "项链3品任务蓝装" , class = 61 , content = "项链3品任务蓝装", command = "d_cmd 2001 16151"}
CYCLOPAEDIA_DICT[1624] = {keyword = "项链3品任务紫装" , class = 61 , content = "项链3品任务紫装", command = "d_cmd 2001 16152"}
CYCLOPAEDIA_DICT[1625] = {keyword = "项链3品蓝装" , class = 61 , content = "项链3品蓝装", command = "d_cmd 2001 16153"}
CYCLOPAEDIA_DICT[1626] = {keyword = "项链3品紫装" , class = 61 , content = "项链3品紫装", command = "d_cmd 2001 16154"}
CYCLOPAEDIA_DICT[1627] = {keyword = "项链3品黄装" , class = 61 , content = "项链3品黄装", command = "d_cmd 2001 16155"}
CYCLOPAEDIA_DICT[1628] = {keyword = "项链3品任务蓝装" , class = 61 , content = "项链3品任务蓝装", command = "d_cmd 2001 16156"}
CYCLOPAEDIA_DICT[1629] = {keyword = "项链3品任务紫装" , class = 61 , content = "项链3品任务紫装", command = "d_cmd 2001 16157"}
CYCLOPAEDIA_DICT[1630] = {keyword = "项链4品蓝装" , class = 61 , content = "项链4品蓝装", command = "d_cmd 2001 16158"}
CYCLOPAEDIA_DICT[1631] = {keyword = "项链4品紫装" , class = 61 , content = "项链4品紫装", command = "d_cmd 2001 16159"}
CYCLOPAEDIA_DICT[1632] = {keyword = "项链4品黄装" , class = 61 , content = "项链4品黄装", command = "d_cmd 2001 16160"}
CYCLOPAEDIA_DICT[1633] = {keyword = "项链4品任务蓝装" , class = 61 , content = "项链4品任务蓝装", command = "d_cmd 2001 16161"}
CYCLOPAEDIA_DICT[1634] = {keyword = "项链4品任务紫装" , class = 61 , content = "项链4品任务紫装", command = "d_cmd 2001 16162"}
CYCLOPAEDIA_DICT[1635] = {keyword = "项链4品蓝装" , class = 61 , content = "项链4品蓝装", command = "d_cmd 2001 16163"}
CYCLOPAEDIA_DICT[1636] = {keyword = "项链4品紫装" , class = 61 , content = "项链4品紫装", command = "d_cmd 2001 16164"}
CYCLOPAEDIA_DICT[1637] = {keyword = "项链4品黄装" , class = 61 , content = "项链4品黄装", command = "d_cmd 2001 16165"}
CYCLOPAEDIA_DICT[1638] = {keyword = "项链4品任务蓝装" , class = 61 , content = "项链4品任务蓝装", command = "d_cmd 2001 16166"}
CYCLOPAEDIA_DICT[1639] = {keyword = "项链4品任务紫装" , class = 61 , content = "项链4品任务紫装", command = "d_cmd 2001 16167"}
CYCLOPAEDIA_DICT[1640] = {keyword = "项链5品蓝装" , class = 61 , content = "项链5品蓝装", command = "d_cmd 2001 16168"}
CYCLOPAEDIA_DICT[1641] = {keyword = "项链5品紫装" , class = 61 , content = "项链5品紫装", command = "d_cmd 2001 16169"}
CYCLOPAEDIA_DICT[1642] = {keyword = "项链5品黄装" , class = 61 , content = "项链5品黄装", command = "d_cmd 2001 16170"}
CYCLOPAEDIA_DICT[1643] = {keyword = "项链5品任务蓝装" , class = 61 , content = "项链5品任务蓝装", command = "d_cmd 2001 16171"}
CYCLOPAEDIA_DICT[1644] = {keyword = "项链5品任务紫装" , class = 61 , content = "项链5品任务紫装", command = "d_cmd 2001 16172"}
CYCLOPAEDIA_DICT[1645] = {keyword = "项链5品蓝装" , class = 61 , content = "项链5品蓝装", command = "d_cmd 2001 16173"}
CYCLOPAEDIA_DICT[1646] = {keyword = "项链5品紫装" , class = 61 , content = "项链5品紫装", command = "d_cmd 2001 16174"}
CYCLOPAEDIA_DICT[1647] = {keyword = "项链5品黄装" , class = 61 , content = "项链5品黄装", command = "d_cmd 2001 16175"}
CYCLOPAEDIA_DICT[1648] = {keyword = "项链5品任务蓝装" , class = 61 , content = "项链5品任务蓝装", command = "d_cmd 2001 16176"}
CYCLOPAEDIA_DICT[1649] = {keyword = "项链5品任务紫装" , class = 61 , content = "项链5品任务紫装", command = "d_cmd 2001 16177"}
CYCLOPAEDIA_DICT[1650] = {keyword = "项链6品蓝装" , class = 61 , content = "项链6品蓝装", command = "d_cmd 2001 16178"}
CYCLOPAEDIA_DICT[1651] = {keyword = "项链6品紫装" , class = 61 , content = "项链6品紫装", command = "d_cmd 2001 16179"}
CYCLOPAEDIA_DICT[1652] = {keyword = "项链6品黄装" , class = 61 , content = "项链6品黄装", command = "d_cmd 2001 16180"}
CYCLOPAEDIA_DICT[1653] = {keyword = "项链6品任务蓝装" , class = 61 , content = "项链6品任务蓝装", command = "d_cmd 2001 16181"}
CYCLOPAEDIA_DICT[1654] = {keyword = "项链6品任务紫装" , class = 61 , content = "项链6品任务紫装", command = "d_cmd 2001 16182"}
CYCLOPAEDIA_DICT[1655] = {keyword = "项链6品蓝装" , class = 61 , content = "项链6品蓝装", command = "d_cmd 2001 16183"}
CYCLOPAEDIA_DICT[1656] = {keyword = "项链6品紫装" , class = 61 , content = "项链6品紫装", command = "d_cmd 2001 16184"}
CYCLOPAEDIA_DICT[1657] = {keyword = "项链6品黄装" , class = 61 , content = "项链6品黄装", command = "d_cmd 2001 16185"}
CYCLOPAEDIA_DICT[1658] = {keyword = "项链6品任务蓝装" , class = 61 , content = "项链6品任务蓝装", command = "d_cmd 2001 16186"}
CYCLOPAEDIA_DICT[1659] = {keyword = "项链6品任务紫装" , class = 61 , content = "项链6品任务紫装", command = "d_cmd 2001 16187"}
CYCLOPAEDIA_DICT[1660] = {keyword = "项链7品蓝装" , class = 61 , content = "项链7品蓝装", command = "d_cmd 2001 16188"}
CYCLOPAEDIA_DICT[1661] = {keyword = "项链7品紫装" , class = 61 , content = "项链7品紫装", command = "d_cmd 2001 16189"}
CYCLOPAEDIA_DICT[1662] = {keyword = "项链7品黄装" , class = 61 , content = "项链7品黄装", command = "d_cmd 2001 16190"}
CYCLOPAEDIA_DICT[1663] = {keyword = "项链7品任务蓝装" , class = 61 , content = "项链7品任务蓝装", command = "d_cmd 2001 16191"}
CYCLOPAEDIA_DICT[1664] = {keyword = "项链7品任务紫装" , class = 61 , content = "项链7品任务紫装", command = "d_cmd 2001 16192"}
CYCLOPAEDIA_DICT[1665] = {keyword = "项链7品蓝装" , class = 61 , content = "项链7品蓝装", command = "d_cmd 2001 16193"}
CYCLOPAEDIA_DICT[1666] = {keyword = "项链7品紫装" , class = 61 , content = "项链7品紫装", command = "d_cmd 2001 16194"}
CYCLOPAEDIA_DICT[1667] = {keyword = "项链7品黄装" , class = 61 , content = "项链7品黄装", command = "d_cmd 2001 16195"}
CYCLOPAEDIA_DICT[1668] = {keyword = "项链7品任务蓝装" , class = 61 , content = "项链7品任务蓝装", command = "d_cmd 2001 16196"}
CYCLOPAEDIA_DICT[1669] = {keyword = "项链7品任务紫装" , class = 61 , content = "项链7品任务紫装", command = "d_cmd 2001 16197"}
CYCLOPAEDIA_DICT[1670] = {keyword = "项链8品蓝装" , class = 61 , content = "项链8品蓝装", command = "d_cmd 2001 16198"}
CYCLOPAEDIA_DICT[1671] = {keyword = "项链8品紫装" , class = 61 , content = "项链8品紫装", command = "d_cmd 2001 16199"}
CYCLOPAEDIA_DICT[1672] = {keyword = "项链8品黄装" , class = 61 , content = "项链8品黄装", command = "d_cmd 2001 16200"}
CYCLOPAEDIA_DICT[1673] = {keyword = "项链8品任务蓝装" , class = 61 , content = "项链8品任务蓝装", command = "d_cmd 2001 16201"}
CYCLOPAEDIA_DICT[1674] = {keyword = "项链8品任务紫装" , class = 61 , content = "项链8品任务紫装", command = "d_cmd 2001 16202"}
CYCLOPAEDIA_DICT[1675] = {keyword = "项链8品蓝装" , class = 61 , content = "项链8品蓝装", command = "d_cmd 2001 16203"}
CYCLOPAEDIA_DICT[1676] = {keyword = "项链8品紫装" , class = 61 , content = "项链8品紫装", command = "d_cmd 2001 16204"}
CYCLOPAEDIA_DICT[1677] = {keyword = "项链8品黄装" , class = 61 , content = "项链8品黄装", command = "d_cmd 2001 16205"}
CYCLOPAEDIA_DICT[1678] = {keyword = "项链8品任务蓝装" , class = 61 , content = "项链8品任务蓝装", command = "d_cmd 2001 16206"}
CYCLOPAEDIA_DICT[1679] = {keyword = "项链8品任务紫装" , class = 61 , content = "项链8品任务紫装", command = "d_cmd 2001 16207"}
CYCLOPAEDIA_DICT[1680] = {keyword = "项链9品蓝装" , class = 61 , content = "项链9品蓝装", command = "d_cmd 2001 16208"}
CYCLOPAEDIA_DICT[1681] = {keyword = "项链9品紫装" , class = 61 , content = "项链9品紫装", command = "d_cmd 2001 16209"}
CYCLOPAEDIA_DICT[1682] = {keyword = "项链9品黄装" , class = 61 , content = "项链9品黄装", command = "d_cmd 2001 16210"}
CYCLOPAEDIA_DICT[1683] = {keyword = "项链9品任务蓝装" , class = 61 , content = "项链9品任务蓝装", command = "d_cmd 2001 16211"}
CYCLOPAEDIA_DICT[1684] = {keyword = "项链9品任务紫装" , class = 61 , content = "项链9品任务紫装", command = "d_cmd 2001 16212"}
CYCLOPAEDIA_DICT[1685] = {keyword = "项链9品蓝装" , class = 61 , content = "项链9品蓝装", command = "d_cmd 2001 16213"}
CYCLOPAEDIA_DICT[1686] = {keyword = "项链9品紫装" , class = 61 , content = "项链9品紫装", command = "d_cmd 2001 16214"}
CYCLOPAEDIA_DICT[1687] = {keyword = "项链9品黄装" , class = 61 , content = "项链9品黄装", command = "d_cmd 2001 16215"}
CYCLOPAEDIA_DICT[1688] = {keyword = "项链9品任务蓝装" , class = 61 , content = "项链9品任务蓝装", command = "d_cmd 2001 16216"}
CYCLOPAEDIA_DICT[1689] = {keyword = "项链9品任务紫装" , class = 61 , content = "项链9品任务紫装", command = "d_cmd 2001 16217"}
CYCLOPAEDIA_DICT[1690] = {keyword = "项链10品蓝装" , class = 61 , content = "项链10品蓝装", command = "d_cmd 2001 16218"}
CYCLOPAEDIA_DICT[1691] = {keyword = "项链10品紫装" , class = 61 , content = "项链10品紫装", command = "d_cmd 2001 16219"}
CYCLOPAEDIA_DICT[1692] = {keyword = "项链10品黄装" , class = 61 , content = "项链10品黄装", command = "d_cmd 2001 16220"}
CYCLOPAEDIA_DICT[1693] = {keyword = "项链10品任务蓝装" , class = 61 , content = "项链10品任务蓝装", command = "d_cmd 2001 16221"}
CYCLOPAEDIA_DICT[1694] = {keyword = "项链10品任务紫装" , class = 61 , content = "项链10品任务紫装", command = "d_cmd 2001 16222"}
CYCLOPAEDIA_DICT[1695] = {keyword = "项链10品蓝装" , class = 61 , content = "项链10品蓝装", command = "d_cmd 2001 16223"}
CYCLOPAEDIA_DICT[1696] = {keyword = "项链10品紫装" , class = 61 , content = "项链10品紫装", command = "d_cmd 2001 16224"}
CYCLOPAEDIA_DICT[1697] = {keyword = "项链10品黄装" , class = 61 , content = "项链10品黄装", command = "d_cmd 2001 16225"}
CYCLOPAEDIA_DICT[1698] = {keyword = "项链10品任务蓝装" , class = 61 , content = "项链10品任务蓝装", command = "d_cmd 2001 16226"}
CYCLOPAEDIA_DICT[1699] = {keyword = "项链10品任务紫装" , class = 61 , content = "项链10品任务紫装", command = "d_cmd 2001 16227"}
CYCLOPAEDIA_DICT[1700] = {keyword = "腰饰1品蓝装" , class = 61 , content = "腰饰1品蓝装", command = "d_cmd 2001 16228"}
CYCLOPAEDIA_DICT[1701] = {keyword = "腰饰1品紫装" , class = 61 , content = "腰饰1品紫装", command = "d_cmd 2001 16229"}
CYCLOPAEDIA_DICT[1702] = {keyword = "腰饰1品黄装" , class = 61 , content = "腰饰1品黄装", command = "d_cmd 2001 16230"}
CYCLOPAEDIA_DICT[1703] = {keyword = "腰饰1品任务蓝装" , class = 61 , content = "腰饰1品任务蓝装", command = "d_cmd 2001 16231"}
CYCLOPAEDIA_DICT[1704] = {keyword = "腰饰1品任务紫装" , class = 61 , content = "腰饰1品任务紫装", command = "d_cmd 2001 16232"}
CYCLOPAEDIA_DICT[1705] = {keyword = "腰饰1品蓝装" , class = 61 , content = "腰饰1品蓝装", command = "d_cmd 2001 16233"}
CYCLOPAEDIA_DICT[1706] = {keyword = "腰饰1品紫装" , class = 61 , content = "腰饰1品紫装", command = "d_cmd 2001 16234"}
CYCLOPAEDIA_DICT[1707] = {keyword = "腰饰1品黄装" , class = 61 , content = "腰饰1品黄装", command = "d_cmd 2001 16235"}
CYCLOPAEDIA_DICT[1708] = {keyword = "腰饰1品任务蓝装" , class = 61 , content = "腰饰1品任务蓝装", command = "d_cmd 2001 16236"}
CYCLOPAEDIA_DICT[1709] = {keyword = "腰饰1品任务紫装" , class = 61 , content = "腰饰1品任务紫装", command = "d_cmd 2001 16237"}
CYCLOPAEDIA_DICT[1710] = {keyword = "腰饰2品蓝装" , class = 61 , content = "腰饰2品蓝装", command = "d_cmd 2001 16238"}
CYCLOPAEDIA_DICT[1711] = {keyword = "腰饰2品紫装" , class = 61 , content = "腰饰2品紫装", command = "d_cmd 2001 16239"}
CYCLOPAEDIA_DICT[1712] = {keyword = "腰饰2品黄装" , class = 61 , content = "腰饰2品黄装", command = "d_cmd 2001 16240"}
CYCLOPAEDIA_DICT[1713] = {keyword = "腰饰2品任务蓝装" , class = 61 , content = "腰饰2品任务蓝装", command = "d_cmd 2001 16241"}
CYCLOPAEDIA_DICT[1714] = {keyword = "腰饰2品任务紫装" , class = 61 , content = "腰饰2品任务紫装", command = "d_cmd 2001 16242"}
CYCLOPAEDIA_DICT[1715] = {keyword = "腰饰2品蓝装" , class = 61 , content = "腰饰2品蓝装", command = "d_cmd 2001 16243"}
CYCLOPAEDIA_DICT[1716] = {keyword = "腰饰2品紫装" , class = 61 , content = "腰饰2品紫装", command = "d_cmd 2001 16244"}
CYCLOPAEDIA_DICT[1717] = {keyword = "腰饰2品黄装" , class = 61 , content = "腰饰2品黄装", command = "d_cmd 2001 16245"}
CYCLOPAEDIA_DICT[1718] = {keyword = "腰饰2品任务蓝装" , class = 61 , content = "腰饰2品任务蓝装", command = "d_cmd 2001 16246"}
CYCLOPAEDIA_DICT[1719] = {keyword = "腰饰2品任务紫装" , class = 61 , content = "腰饰2品任务紫装", command = "d_cmd 2001 16247"}
CYCLOPAEDIA_DICT[1720] = {keyword = "腰饰3品蓝装" , class = 61 , content = "腰饰3品蓝装", command = "d_cmd 2001 16248"}
CYCLOPAEDIA_DICT[1721] = {keyword = "腰饰3品紫装" , class = 61 , content = "腰饰3品紫装", command = "d_cmd 2001 16249"}
CYCLOPAEDIA_DICT[1722] = {keyword = "腰饰3品黄装" , class = 61 , content = "腰饰3品黄装", command = "d_cmd 2001 16250"}
CYCLOPAEDIA_DICT[1723] = {keyword = "腰饰3品任务蓝装" , class = 61 , content = "腰饰3品任务蓝装", command = "d_cmd 2001 16251"}
CYCLOPAEDIA_DICT[1724] = {keyword = "腰饰3品任务紫装" , class = 61 , content = "腰饰3品任务紫装", command = "d_cmd 2001 16252"}
CYCLOPAEDIA_DICT[1725] = {keyword = "腰饰3品蓝装" , class = 61 , content = "腰饰3品蓝装", command = "d_cmd 2001 16253"}
CYCLOPAEDIA_DICT[1726] = {keyword = "腰饰3品紫装" , class = 61 , content = "腰饰3品紫装", command = "d_cmd 2001 16254"}
CYCLOPAEDIA_DICT[1727] = {keyword = "腰饰3品黄装" , class = 61 , content = "腰饰3品黄装", command = "d_cmd 2001 16255"}
CYCLOPAEDIA_DICT[1728] = {keyword = "腰饰3品任务蓝装" , class = 61 , content = "腰饰3品任务蓝装", command = "d_cmd 2001 16256"}
CYCLOPAEDIA_DICT[1729] = {keyword = "腰饰3品任务紫装" , class = 61 , content = "腰饰3品任务紫装", command = "d_cmd 2001 16257"}
CYCLOPAEDIA_DICT[1730] = {keyword = "腰饰4品蓝装" , class = 61 , content = "腰饰4品蓝装", command = "d_cmd 2001 16258"}
CYCLOPAEDIA_DICT[1731] = {keyword = "腰饰4品紫装" , class = 61 , content = "腰饰4品紫装", command = "d_cmd 2001 16259"}
CYCLOPAEDIA_DICT[1732] = {keyword = "腰饰4品黄装" , class = 61 , content = "腰饰4品黄装", command = "d_cmd 2001 16260"}
CYCLOPAEDIA_DICT[1733] = {keyword = "腰饰4品任务蓝装" , class = 61 , content = "腰饰4品任务蓝装", command = "d_cmd 2001 16261"}
CYCLOPAEDIA_DICT[1734] = {keyword = "腰饰4品任务紫装" , class = 61 , content = "腰饰4品任务紫装", command = "d_cmd 2001 16262"}
CYCLOPAEDIA_DICT[1735] = {keyword = "腰饰4品蓝装" , class = 61 , content = "腰饰4品蓝装", command = "d_cmd 2001 16263"}
CYCLOPAEDIA_DICT[1736] = {keyword = "腰饰4品紫装" , class = 61 , content = "腰饰4品紫装", command = "d_cmd 2001 16264"}
CYCLOPAEDIA_DICT[1737] = {keyword = "腰饰4品黄装" , class = 61 , content = "腰饰4品黄装", command = "d_cmd 2001 16265"}
CYCLOPAEDIA_DICT[1738] = {keyword = "腰饰4品任务蓝装" , class = 61 , content = "腰饰4品任务蓝装", command = "d_cmd 2001 16266"}
CYCLOPAEDIA_DICT[1739] = {keyword = "腰饰4品任务紫装" , class = 61 , content = "腰饰4品任务紫装", command = "d_cmd 2001 16267"}
CYCLOPAEDIA_DICT[1740] = {keyword = "腰饰5品蓝装" , class = 61 , content = "腰饰5品蓝装", command = "d_cmd 2001 16268"}
CYCLOPAEDIA_DICT[1741] = {keyword = "腰饰5品紫装" , class = 61 , content = "腰饰5品紫装", command = "d_cmd 2001 16269"}
CYCLOPAEDIA_DICT[1742] = {keyword = "腰饰5品黄装" , class = 61 , content = "腰饰5品黄装", command = "d_cmd 2001 16270"}
CYCLOPAEDIA_DICT[1743] = {keyword = "腰饰5品任务蓝装" , class = 61 , content = "腰饰5品任务蓝装", command = "d_cmd 2001 16271"}
CYCLOPAEDIA_DICT[1744] = {keyword = "腰饰5品任务紫装" , class = 61 , content = "腰饰5品任务紫装", command = "d_cmd 2001 16272"}
CYCLOPAEDIA_DICT[1745] = {keyword = "腰饰5品蓝装" , class = 61 , content = "腰饰5品蓝装", command = "d_cmd 2001 16273"}
CYCLOPAEDIA_DICT[1746] = {keyword = "腰饰5品紫装" , class = 61 , content = "腰饰5品紫装", command = "d_cmd 2001 16274"}
CYCLOPAEDIA_DICT[1747] = {keyword = "腰饰5品黄装" , class = 61 , content = "腰饰5品黄装", command = "d_cmd 2001 16275"}
CYCLOPAEDIA_DICT[1748] = {keyword = "腰饰5品任务蓝装" , class = 61 , content = "腰饰5品任务蓝装", command = "d_cmd 2001 16276"}
CYCLOPAEDIA_DICT[1749] = {keyword = "腰饰5品任务紫装" , class = 61 , content = "腰饰5品任务紫装", command = "d_cmd 2001 16277"}
CYCLOPAEDIA_DICT[1750] = {keyword = "腰饰6品蓝装" , class = 61 , content = "腰饰6品蓝装", command = "d_cmd 2001 16278"}
CYCLOPAEDIA_DICT[1751] = {keyword = "腰饰6品紫装" , class = 61 , content = "腰饰6品紫装", command = "d_cmd 2001 16279"}
CYCLOPAEDIA_DICT[1752] = {keyword = "腰饰6品黄装" , class = 61 , content = "腰饰6品黄装", command = "d_cmd 2001 16280"}
CYCLOPAEDIA_DICT[1753] = {keyword = "腰饰6品任务蓝装" , class = 61 , content = "腰饰6品任务蓝装", command = "d_cmd 2001 16281"}
CYCLOPAEDIA_DICT[1754] = {keyword = "腰饰6品任务紫装" , class = 61 , content = "腰饰6品任务紫装", command = "d_cmd 2001 16282"}
CYCLOPAEDIA_DICT[1755] = {keyword = "腰饰6品蓝装" , class = 61 , content = "腰饰6品蓝装", command = "d_cmd 2001 16283"}
CYCLOPAEDIA_DICT[1756] = {keyword = "腰饰6品紫装" , class = 61 , content = "腰饰6品紫装", command = "d_cmd 2001 16284"}
CYCLOPAEDIA_DICT[1757] = {keyword = "腰饰6品黄装" , class = 61 , content = "腰饰6品黄装", command = "d_cmd 2001 16285"}
CYCLOPAEDIA_DICT[1758] = {keyword = "腰饰6品任务蓝装" , class = 61 , content = "腰饰6品任务蓝装", command = "d_cmd 2001 16286"}
CYCLOPAEDIA_DICT[1759] = {keyword = "腰饰6品任务紫装" , class = 61 , content = "腰饰6品任务紫装", command = "d_cmd 2001 16287"}
CYCLOPAEDIA_DICT[1760] = {keyword = "腰饰7品蓝装" , class = 61 , content = "腰饰7品蓝装", command = "d_cmd 2001 16288"}
CYCLOPAEDIA_DICT[1761] = {keyword = "腰饰7品紫装" , class = 61 , content = "腰饰7品紫装", command = "d_cmd 2001 16289"}
CYCLOPAEDIA_DICT[1762] = {keyword = "腰饰7品黄装" , class = 61 , content = "腰饰7品黄装", command = "d_cmd 2001 16290"}
CYCLOPAEDIA_DICT[1763] = {keyword = "腰饰7品任务蓝装" , class = 61 , content = "腰饰7品任务蓝装", command = "d_cmd 2001 16291"}
CYCLOPAEDIA_DICT[1764] = {keyword = "腰饰7品任务紫装" , class = 61 , content = "腰饰7品任务紫装", command = "d_cmd 2001 16292"}
CYCLOPAEDIA_DICT[1765] = {keyword = "腰饰7品蓝装" , class = 61 , content = "腰饰7品蓝装", command = "d_cmd 2001 16293"}
CYCLOPAEDIA_DICT[1766] = {keyword = "腰饰7品紫装" , class = 61 , content = "腰饰7品紫装", command = "d_cmd 2001 16294"}
CYCLOPAEDIA_DICT[1767] = {keyword = "腰饰7品黄装" , class = 61 , content = "腰饰7品黄装", command = "d_cmd 2001 16295"}
CYCLOPAEDIA_DICT[1768] = {keyword = "腰饰7品任务蓝装" , class = 61 , content = "腰饰7品任务蓝装", command = "d_cmd 2001 16296"}
CYCLOPAEDIA_DICT[1769] = {keyword = "腰饰7品任务紫装" , class = 61 , content = "腰饰7品任务紫装", command = "d_cmd 2001 16297"}
CYCLOPAEDIA_DICT[1770] = {keyword = "腰饰8品蓝装" , class = 61 , content = "腰饰8品蓝装", command = "d_cmd 2001 16298"}
CYCLOPAEDIA_DICT[1771] = {keyword = "腰饰8品紫装" , class = 61 , content = "腰饰8品紫装", command = "d_cmd 2001 16299"}
CYCLOPAEDIA_DICT[1772] = {keyword = "腰饰8品黄装" , class = 61 , content = "腰饰8品黄装", command = "d_cmd 2001 16300"}
CYCLOPAEDIA_DICT[1773] = {keyword = "腰饰8品任务蓝装" , class = 61 , content = "腰饰8品任务蓝装", command = "d_cmd 2001 16301"}
CYCLOPAEDIA_DICT[1774] = {keyword = "腰饰8品任务紫装" , class = 61 , content = "腰饰8品任务紫装", command = "d_cmd 2001 16302"}
CYCLOPAEDIA_DICT[1775] = {keyword = "腰饰8品蓝装" , class = 61 , content = "腰饰8品蓝装", command = "d_cmd 2001 16303"}
CYCLOPAEDIA_DICT[1776] = {keyword = "腰饰8品紫装" , class = 61 , content = "腰饰8品紫装", command = "d_cmd 2001 16304"}
CYCLOPAEDIA_DICT[1777] = {keyword = "腰饰8品黄装" , class = 61 , content = "腰饰8品黄装", command = "d_cmd 2001 16305"}
CYCLOPAEDIA_DICT[1778] = {keyword = "腰饰8品任务蓝装" , class = 61 , content = "腰饰8品任务蓝装", command = "d_cmd 2001 16306"}
CYCLOPAEDIA_DICT[1779] = {keyword = "腰饰8品任务紫装" , class = 61 , content = "腰饰8品任务紫装", command = "d_cmd 2001 16307"}
CYCLOPAEDIA_DICT[1780] = {keyword = "腰饰9品蓝装" , class = 61 , content = "腰饰9品蓝装", command = "d_cmd 2001 16308"}
CYCLOPAEDIA_DICT[1781] = {keyword = "腰饰9品紫装" , class = 61 , content = "腰饰9品紫装", command = "d_cmd 2001 16309"}
CYCLOPAEDIA_DICT[1782] = {keyword = "腰饰9品黄装" , class = 61 , content = "腰饰9品黄装", command = "d_cmd 2001 16310"}
CYCLOPAEDIA_DICT[1783] = {keyword = "腰饰9品任务蓝装" , class = 61 , content = "腰饰9品任务蓝装", command = "d_cmd 2001 16311"}
CYCLOPAEDIA_DICT[1784] = {keyword = "腰饰9品任务紫装" , class = 61 , content = "腰饰9品任务紫装", command = "d_cmd 2001 16312"}
CYCLOPAEDIA_DICT[1785] = {keyword = "腰饰9品蓝装" , class = 61 , content = "腰饰9品蓝装", command = "d_cmd 2001 16313"}
CYCLOPAEDIA_DICT[1786] = {keyword = "腰饰9品紫装" , class = 61 , content = "腰饰9品紫装", command = "d_cmd 2001 16314"}
CYCLOPAEDIA_DICT[1787] = {keyword = "腰饰9品黄装" , class = 61 , content = "腰饰9品黄装", command = "d_cmd 2001 16315"}
CYCLOPAEDIA_DICT[1788] = {keyword = "腰饰9品任务蓝装" , class = 61 , content = "腰饰9品任务蓝装", command = "d_cmd 2001 16316"}
CYCLOPAEDIA_DICT[1789] = {keyword = "腰饰9品任务紫装" , class = 61 , content = "腰饰9品任务紫装", command = "d_cmd 2001 16317"}
CYCLOPAEDIA_DICT[1790] = {keyword = "腰饰10品蓝装" , class = 61 , content = "腰饰10品蓝装", command = "d_cmd 2001 16318"}
CYCLOPAEDIA_DICT[1791] = {keyword = "腰饰10品紫装" , class = 61 , content = "腰饰10品紫装", command = "d_cmd 2001 16319"}
CYCLOPAEDIA_DICT[1792] = {keyword = "腰饰10品黄装" , class = 61 , content = "腰饰10品黄装", command = "d_cmd 2001 16320"}
CYCLOPAEDIA_DICT[1793] = {keyword = "腰饰10品任务蓝装" , class = 61 , content = "腰饰10品任务蓝装", command = "d_cmd 2001 16321"}
CYCLOPAEDIA_DICT[1794] = {keyword = "腰饰10品任务紫装" , class = 61 , content = "腰饰10品任务紫装", command = "d_cmd 2001 16322"}
CYCLOPAEDIA_DICT[1795] = {keyword = "腰饰10品蓝装" , class = 61 , content = "腰饰10品蓝装", command = "d_cmd 2001 16323"}
CYCLOPAEDIA_DICT[1796] = {keyword = "腰饰10品紫装" , class = 61 , content = "腰饰10品紫装", command = "d_cmd 2001 16324"}
CYCLOPAEDIA_DICT[1797] = {keyword = "腰饰10品黄装" , class = 61 , content = "腰饰10品黄装", command = "d_cmd 2001 16325"}
CYCLOPAEDIA_DICT[1798] = {keyword = "腰饰10品任务蓝装" , class = 61 , content = "腰饰10品任务蓝装", command = "d_cmd 2001 16326"}
CYCLOPAEDIA_DICT[1799] = {keyword = "腰饰10品任务紫装" , class = 61 , content = "腰饰10品任务紫装", command = "d_cmd 2001 16327"}


--文本描述 Common Text
TEXT_CYCLOPAEDIA_NORMALRESULT = "^fedc40搜索^ffffff%s^fedc40结果：共^ffffff%s^fedc40个。"
TEXT_CYCLOPAEDIA_NORMALNOKEYWORD = "^fedc40请输入合适的^ffffff关键词^fedc40。"
TEXT_CYCLOPAEDIA_SETTING = "查找分类列表"
TEXT_CYCLOPAEDIA_SETTINGSAVE = "保存设置"
TEXT_CYCLOPAEDIA_SETTINGBUTTON = "查找设置"
TEXT_CYCLOPAEDIA_SETTINGWARNING = "设置内未勾选任何分类"
TEXT_CYCLOPAEDIA_SETTINGALL = "当前已设置为全百科查询"
TEXT_CYCLOPAEDIA_CONTENT = "详细资料"
TEXT_CYCLOPAEDIA_HELP = "^00ffff(左键^ffffff选中^fedc40，^00ffff右键^ffffff执行^00ffff）"
TEXT_CYCLOPAEDIA_PLZINPUTKEYWORD = "请在^ffffff↑^fedc40的框内输入关键词"
TEXT_CYCLOPAEDIA_ALLRESULT = "^fedc40数据库共有^ffffff%s^fedc40条内容。"
TEXT_CYCLOPAEDIA_ALLRESULTNULL = "^fedc40当前分类暂未开放，请在^ffffff查找设置^fedc40中调整。"
TEXT_CYCLOPAEDIA_DEFAULTSEARCHFILTER = "111111111111111111111111111111111111111111111"
------------------------------------------------------
