--[[#tag push auto]]

FunctionUnlock = {}
FunctionUnlock.Config = {}

--解锁配置项 功能ID	解锁说明文字	解锁特效路径	解锁模式	参数1	参数2	参数3
--解锁模式：0为初始开放，1为特定等级开放，2为完成特定任务开放，3为完成特定成就开放,4为完成参数3列表中的某一个任务
--参数1，当解锁模式为1时，填写等级数，当解锁模式为2时，填写任务id，当解锁模式为3的时候，填0表示任何成就，其他情况填为0，参数2,3备用，暂无用途
--参数2，解锁表现形式，0为右侧功能按钮解锁，弹出小提示面板，1为左上应用解锁，表现为按钮闪烁大光效
--参数3，在模式 1 2 3的时候为int 类型， 在模式4的时候为taskidlist

FunctionUnlock.Config[0] = {0,--[[!AUTO_1]]"人物",--[[!AUTO_2]]"",0,0,0,0}
FunctionUnlock.Config[1] = {1,--[[!AUTO_3]]"包裹",--[[!AUTO_4]]"",0,0,0,0}
FunctionUnlock.Config[2] = {2,--[[!AUTO_45]]"解鎖了^ffcb40“暗器”^ffffff功能\r同時開啟了第5-8號物品快捷欄。",--[[!AUTO_46]]"界面\\合成效果\\合成周围小方框效果.gfx",0,0,0,0}
FunctionUnlock.Config[3] = {3,--[[!AUTO_5]]"解鎖了^ffcb40“武學”^ffffff功能",--[[!AUTO_6]]"界面\\合成效果\\合成周围小方框效果.gfx",0,0,0,0}
FunctionUnlock.Config[4] = {4,--[[!AUTO_7]]"任務",--[[!AUTO_8]]"",0,0,0,0}
FunctionUnlock.Config[5] = {5,--[[!AUTO_9]]"解鎖了^ffcb40“生產技能”^ffffff功能",--[[!AUTO_10]]"界面\\合成效果\\合成周围小方框效果.gfx",0,0,0,0}
FunctionUnlock.Config[6] = {6,--[[!AUTO_11]]"解鎖了^ffcb40“門徒”^ffffff功能",--[[!AUTO_12]]"界面\\合成效果\\合成周围小方框效果.gfx",0,0,0,0}
FunctionUnlock.Config[7] = {7,--[[!AUTO_13]]"組隊",--[[!AUTO_14]]"",0,0,0,0}
FunctionUnlock.Config[8] = {8,--[[!AUTO_15]]"好友",--[[!AUTO_16]]"",0,0,0,0}
FunctionUnlock.Config[9] = {9,--[[!AUTO_17]]"解鎖了^ffcb40“幫派”^ffffff功能",--[[!AUTO_18]]"界面\\合成效果\\合成周围小方框效果.gfx",0,0,0,0}
FunctionUnlock.Config[10] = {10,--[[!AUTO_19]]"解鎖了^ffcb40“商城”^ffffff功能",--[[!AUTO_20]]"界面\\合成效果\\合成周围小方框效果.gfx",0,0,0,0}
FunctionUnlock.Config[11] = {11,--[[!AUTO_21]]"解鎖了^ffcb40“成就”^ffffff功能",--[[!AUTO_22]]"界面\\合成效果\\合成周围小方框效果.gfx",3,0,0,0}
FunctionUnlock.Config[12] = {12,--[[!AUTO_23]]"解鎖了^ffcb40“排行榜”^ffffff功能",--[[!AUTO_24]]"界面\\合成效果\\合成周围小方框效果.gfx",0,0,0,0}
FunctionUnlock.Config[13] = {13,--[[!AUTO_25]]"系統",--[[!AUTO_26]]"",0,0,0,0}
FunctionUnlock.Config[14] = {14,--[[!AUTO_27]]"解鎖了^ffcb40“裝備淬煉”^ffffff功能",--[[!AUTO_28]]"",1,10,0,0}
FunctionUnlock.Config[15] = {15,--[[!AUTO_27]]"解鎖了^ffcb40“裝備分解”、“裝備注入”\r^ffffff功能",--[[!AUTO_28]]"",1,40,0,0}
FunctionUnlock.Config[16] = {16,--[[!AUTO_29]]"解鎖了^ffcb40“裝備打孔”、“寶石鑲嵌”\r“寶石摘取”、“寶石合成”^ffffff功能",--[[!AUTO_30]]"",1,20,0,0}
FunctionUnlock.Config[17] = {17,"解鎖了^ffcb40“傳奇升級”^ffffff功能","",1,35,0,0}
FunctionUnlock.Config[18] = {18,"解鎖了^ffcb40“傳奇重鑄”^ffffff功能","",1,25,0,0}
FunctionUnlock.Config[19] = {19,"解鎖了^ffcb40“傳奇洗煉”^ffffff功能","",1,30,0,0}
FunctionUnlock.Config[20] = {20,"解鎖了^ffcb40“神器培養”^ffffff功能","",1,30,0,0}
FunctionUnlock.Config[21] = {21,"解鎖了^ffcb40“銘牌培養”^ffffff功能","",1,30,0,0}
FunctionUnlock.Config[22] = {22,--[[!AUTO_31]]"解鎖了^ffcb40“心法”^ffffff功能",--[[!AUTO_32]]"",0,0,0,0}
FunctionUnlock.Config[23] = {23,--[[!AUTO_33]]"解鎖了^ffcb40“怒氣”^ffffff功能",--[[!AUTO_34]]"",0,0,0,0}
FunctionUnlock.Config[24] = {24,--[[!AUTO_35]]"解鎖了^ffcb40“自創武學”^ffffff功能",--[[!AUTO_36]]"",0,0,0,0}
FunctionUnlock.Config[25] = {25,--[[!AUTO_37]]"解鎖了^ffcb40“閉關修煉”^ffffff功能",--[[!AUTO_38]]"",0,0,0,0}
FunctionUnlock.Config[26] = {26,"解鎖了^ffcb40“元寶交易”^ffffff功能","",0,0,0,0}
FunctionUnlock.Config[27] = {27,--[[!AUTO_39]]"解鎖了^ffcb40“副本”^ffffff功能",--[[!AUTO_40]]"",1,15,0,0}
FunctionUnlock.Config[28] = {28,--[[!AUTO_41]]"解鎖了^ffcb40“活動”^ffffff功能",--[[!AUTO_42]]"",1,20,0,0}
FunctionUnlock.Config[29] = {29,--[[!AUTO_43]]"解鎖了^ffcb40“競技場”^ffffff功能",--[[!AUTO_44]]"",1,30,0,0}
FunctionUnlock.Config[30] = {30,--[[!AUTO_43]]"解鎖了^ffcb40“戰隊”^ffffff功能",--[[!AUTO_44]]"",1,60,0,0}
FunctionUnlock.Config[31] = {31,"解鎖了^ffcb40“風物志”^ffffff功能","",0,0,0,0}
FunctionUnlock.Config[32] = {32,"解鎖了^ffcb40“風物志”^ffffff乾位","",1,65,0,0}
FunctionUnlock.Config[33] = {33,"解鎖了^ffcb40“風物志”^ffffff坤位","",1,65,0,0}
FunctionUnlock.Config[34] = {34,"解鎖了^ffcb40“風物志”^ffffff離位","",1,75,0,0}
FunctionUnlock.Config[35] = {35,"解鎖了^ffcb40“風物志”^ffffff坎位","",1,75,0,0}
FunctionUnlock.Config[36] = {36,"解鎖了^ffcb40“風物志”^ffffff頤位","",1,85,0,0}
FunctionUnlock.Config[37] = {37,"解鎖了^ffcb40“風物志”^ffffff過位","",1,85,0,0}
FunctionUnlock.Config[38] = {38,"解鎖了^ffcb40“武魂培養”、“武魂吞噬”\r“武魂分解”、“武魂重生”^ffffff功能","",0,0,0,0}
FunctionUnlock.Config[39] = {39,"解鎖了^ffcb40“清虛裝備”^ffffff功能","",1,60,0,0}
FunctionUnlock.Config[40] = {40,"解鎖了^ffcb40“陣法”^ffffff","",1,70,0,0}
FunctionUnlock.Config[41] = {41,"解鎖了^ffcb40“宗師”^ffffff","",1,60,0,0}
FunctionUnlock.Config[42] = {42,--[[!AUTO_11]]"解鎖了^ffcb40“知音（好友推薦）”^ffffff功能",--[[!AUTO_12]]"介面\\合成效果\\合成周圍小方框效果.gfx",1,15,0,0}
function FunctionUnlock:GetUnlockInfo()
	return FunctionUnlock.Config
end

