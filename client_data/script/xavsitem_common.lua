--[[#encode ansi]]
--[[#tag push auto]]

--战场道具买卖与合成通用配置

XAVSItem_Common = {}

--战场区域阵营配置
XAVSItem_Common.Region = {}
--索引号：序号
--id：区域对象（暂时输的副本区域）id
--camp：对战A、B、C、D各方，true为有效，false为无效
--名人对战道具区域配置开始
XAVSItem_Common.Region[1] = {rid = 1073747159, camp = { true,  false, false, false} }
XAVSItem_Common.Region[2] = {rid = 1073747160, camp = { false, true,  false, false} }
XAVSItem_Common.Region[3] = {rid = 1073747161, camp = { true,  true,  false, false} }
XAVSItem_Common.Region[4] = {rid = 1073747162, camp = { true,  true,  false, false} }
XAVSItem_Common.Region[5] = {rid = 1073747163, camp = { true,  true,  false, false} }
XAVSItem_Common.Region[6] = {rid = 1073747164, camp = { true,  true,  false, false} }
--名人对战道具区域配置
--1-6依次为A方基地购买区域、B方基地购买区域、A方神秘购买区域、B方神秘购买区域、A方优势路购买区域、B方优势路购买区域

function XAVSItem_Common:Get_XAVSItem_Region()
	return XAVSItem_Common.Region
end

--战场道具配置
XAVSItem_Common.Item = {}
--索引号：物品id
--price_id：对应声望类型
--vendor_price：店卖价格，0代表无法出售。如果无法出售，从recycle_price后所有项均无效
--recycle_price：回购价格，0代表无法回购
--region：可以买卖的区域，参照上面的区域
--vendor_starttime：首次可用时间，为0即初始可用，为数则为战场开始多长时间后才能用，可用时初始数量为vendor_numlimit
--vendor_numlimit：出售限量，为0则无限数量，此时下一项无用，大于0则无数量限制，注意：每个Region有独立的limit数量
--vendor_incinterval：出售冷却，如果vendor_numlimit为正有意义，则当vendor_numlimit用掉1次后，间隔此时间增加1个计数，计数不超过limit上限
--camp_limit：阵营限制，为0则无限制，如果有限制，则购买时先检查全阵营包裹，总数已到此值则不能再买
--bf_limit：战场限制，为0则无限制，如果有限制，则购买时先检查全战场包裹，总数已到此值则不能再买
--pick_announce：获得广播，0不广播，1友方广播，2战场广播
--名人对战道具出售配置开始XAVSItem_Common.Item[63999] = {price_id = 106, vendor_price = 180, recycle_price = 90, region = {1,2}, vendor_starttime = 0, vendor_numlimit = 0, vendor_incinterval = 0, camp_limit = 0, bf_limit = 0, pick_announce = 0,}
XAVSItem_Common.Item[64000] = {price_id = 106, vendor_price = 250, recycle_price = 125, region = {1,2}, vendor_starttime = 0, vendor_numlimit = 0, vendor_incinterval = 0, camp_limit = 0, bf_limit = 0, pick_announce = 0,}
XAVSItem_Common.Item[64001] = {price_id = 106, vendor_price = 150, recycle_price = 75, region = {1,2}, vendor_starttime = 0, vendor_numlimit = 0, vendor_incinterval = 0, camp_limit = 0, bf_limit = 0, pick_announce = 0,}
XAVSItem_Common.Item[64006] = {price_id = 106, vendor_price = 200, recycle_price = 100, region = {1,2}, vendor_starttime = 0, vendor_numlimit = 0, vendor_incinterval = 0, camp_limit = 0, bf_limit = 0, pick_announce = 0,}
XAVSItem_Common.Item[64002] = {price_id = 106, vendor_price = 200, recycle_price = 100, region = {1,2}, vendor_starttime = 0, vendor_numlimit = 3, vendor_incinterval = 120, camp_limit = 0, bf_limit = 0, pick_announce = 1,}
XAVSItem_Common.Item[64003] = {price_id = 106, vendor_price = 200, recycle_price = 100, region = {1,2}, vendor_starttime = 0, vendor_numlimit = 3, vendor_incinterval = 120, camp_limit = 0, bf_limit = 0, pick_announce = 1,}
XAVSItem_Common.Item[64007] = {price_id = 106, vendor_price = 180, recycle_price = 135, region = {1,2,5,6}, vendor_starttime = 0, vendor_numlimit = 0, vendor_incinterval = 0, camp_limit = 0, bf_limit = 0, pick_announce = 0,}
XAVSItem_Common.Item[64008] = {price_id = 106, vendor_price = 180, recycle_price = 135, region = {1,2,5,6}, vendor_starttime = 0, vendor_numlimit = 0, vendor_incinterval = 0, camp_limit = 0, bf_limit = 0, pick_announce = 0,}
XAVSItem_Common.Item[64009] = {price_id = 106, vendor_price = 180, recycle_price = 135, region = {1,2,5,6}, vendor_starttime = 0, vendor_numlimit = 0, vendor_incinterval = 0, camp_limit = 0, bf_limit = 0, pick_announce = 0,}
XAVSItem_Common.Item[64010] = {price_id = 106, vendor_price = 180, recycle_price = 135, region = {1,2,5,6}, vendor_starttime = 0, vendor_numlimit = 0, vendor_incinterval = 0, camp_limit = 0, bf_limit = 0, pick_announce = 0,}
XAVSItem_Common.Item[64011] = {price_id = 106, vendor_price = 180, recycle_price = 135, region = {1,2,5,6}, vendor_starttime = 0, vendor_numlimit = 0, vendor_incinterval = 0, camp_limit = 0, bf_limit = 0, pick_announce = 0,}
XAVSItem_Common.Item[64012] = {price_id = 106, vendor_price = 220, recycle_price = 165, region = {1,2}, vendor_starttime = 0, vendor_numlimit = 0, vendor_incinterval = 0, camp_limit = 0, bf_limit = 0, pick_announce = 0,}
XAVSItem_Common.Item[64013] = {price_id = 106, vendor_price = 200, recycle_price = 150, region = {1,2}, vendor_starttime = 0, vendor_numlimit = 0, vendor_incinterval = 0, camp_limit = 0, bf_limit = 0, pick_announce = 0,}
XAVSItem_Common.Item[64014] = {price_id = 106, vendor_price = 200, recycle_price = 150, region = {1,2}, vendor_starttime = 0, vendor_numlimit = 0, vendor_incinterval = 0, camp_limit = 0, bf_limit = 0, pick_announce = 0,}
XAVSItem_Common.Item[64015] = {price_id = 106, vendor_price = 350, recycle_price = 263, region = {1,2,5,6}, vendor_starttime = 0, vendor_numlimit = 0, vendor_incinterval = 0, camp_limit = 0, bf_limit = 0, pick_announce = 0,}
XAVSItem_Common.Item[64016] = {price_id = 106, vendor_price = 300, recycle_price = 225, region = {1,2,5,6}, vendor_starttime = 0, vendor_numlimit = 0, vendor_incinterval = 0, camp_limit = 0, bf_limit = 0, pick_announce = 0,}
XAVSItem_Common.Item[64017] = {price_id = 106, vendor_price = 150, recycle_price = 113, region = {1,2}, vendor_starttime = 0, vendor_numlimit = 0, vendor_incinterval = 0, camp_limit = 0, bf_limit = 0, pick_announce = 0,}
XAVSItem_Common.Item[64018] = {price_id = 106, vendor_price = 150, recycle_price = 113, region = {1,2}, vendor_starttime = 0, vendor_numlimit = 0, vendor_incinterval = 0, camp_limit = 0, bf_limit = 0, pick_announce = 0,}
XAVSItem_Common.Item[64019] = {price_id = 106, vendor_price = 150, recycle_price = 113, region = {1,2}, vendor_starttime = 0, vendor_numlimit = 0, vendor_incinterval = 0, camp_limit = 0, bf_limit = 0, pick_announce = 0,}
XAVSItem_Common.Item[64020] = {price_id = 106, vendor_price = 150, recycle_price = 113, region = {1,2}, vendor_starttime = 0, vendor_numlimit = 0, vendor_incinterval = 0, camp_limit = 0, bf_limit = 0, pick_announce = 0,}
XAVSItem_Common.Item[64021] = {price_id = 106, vendor_price = 150, recycle_price = 113, region = {1,2}, vendor_starttime = 0, vendor_numlimit = 0, vendor_incinterval = 0, camp_limit = 0, bf_limit = 0, pick_announce = 0,}
XAVSItem_Common.Item[64028] = {price_id = 106, vendor_price = 500, recycle_price = 375, region = {1,2,5,6}, vendor_starttime = 0, vendor_numlimit = 0, vendor_incinterval = 0, camp_limit = 0, bf_limit = 0, pick_announce = 0,}
XAVSItem_Common.Item[64029] = {price_id = 106, vendor_price = 500, recycle_price = 375, region = {1,2,5,6}, vendor_starttime = 0, vendor_numlimit = 0, vendor_incinterval = 0, camp_limit = 0, bf_limit = 0, pick_announce = 0,}
XAVSItem_Common.Item[64037] = {price_id = 106, vendor_price = 600, recycle_price = 450, region = {1,2}, vendor_starttime = 0, vendor_numlimit = 0, vendor_incinterval = 0, camp_limit = 0, bf_limit = 0, pick_announce = 0,}
XAVSItem_Common.Item[64038] = {price_id = 106, vendor_price = 500, recycle_price = 375, region = {1,2}, vendor_starttime = 0, vendor_numlimit = 0, vendor_incinterval = 0, camp_limit = 0, bf_limit = 0, pick_announce = 0,}
XAVSItem_Common.Item[64039] = {price_id = 106, vendor_price = 660, recycle_price = 495, region = {1,2}, vendor_starttime = 0, vendor_numlimit = 0, vendor_incinterval = 0, camp_limit = 0, bf_limit = 0, pick_announce = 0,}
XAVSItem_Common.Item[64040] = {price_id = 106, vendor_price = 600, recycle_price = 450, region = {1,2,5,6}, vendor_starttime = 0, vendor_numlimit = 0, vendor_incinterval = 0, camp_limit = 0, bf_limit = 0, pick_announce = 0,}
XAVSItem_Common.Item[64041] = {price_id = 106, vendor_price = 700, recycle_price = 525, region = {1,2}, vendor_starttime = 0, vendor_numlimit = 0, vendor_incinterval = 0, camp_limit = 0, bf_limit = 0, pick_announce = 0,}
XAVSItem_Common.Item[64035] = {price_id = 106, vendor_price = 600, recycle_price = 450, region = {1,2,5,6}, vendor_starttime = 0, vendor_numlimit = 0, vendor_incinterval = 0, camp_limit = 0, bf_limit = 0, pick_announce = 0,}
XAVSItem_Common.Item[64042] = {price_id = 106, vendor_price = 600, recycle_price = 450, region = {1,2,5,6}, vendor_starttime = 0, vendor_numlimit = 0, vendor_incinterval = 0, camp_limit = 0, bf_limit = 0, pick_announce = 0,}
XAVSItem_Common.Item[64030] = {price_id = 106, vendor_price = 400, recycle_price = 300, region = {1,2}, vendor_starttime = 0, vendor_numlimit = 0, vendor_incinterval = 0, camp_limit = 0, bf_limit = 0, pick_announce = 0,}
XAVSItem_Common.Item[64031] = {price_id = 106, vendor_price = 400, recycle_price = 300, region = {1,2}, vendor_starttime = 0, vendor_numlimit = 0, vendor_incinterval = 0, camp_limit = 0, bf_limit = 0, pick_announce = 0,}
XAVSItem_Common.Item[64032] = {price_id = 106, vendor_price = 350, recycle_price = 263, region = {1,2}, vendor_starttime = 0, vendor_numlimit = 0, vendor_incinterval = 0, camp_limit = 0, bf_limit = 0, pick_announce = 0,}
XAVSItem_Common.Item[64033] = {price_id = 106, vendor_price = 350, recycle_price = 263, region = {1,2}, vendor_starttime = 0, vendor_numlimit = 0, vendor_incinterval = 0, camp_limit = 0, bf_limit = 0, pick_announce = 0,}
XAVSItem_Common.Item[64051] = {price_id = 106, vendor_price = 800, recycle_price = 600, region = {1,2}, vendor_starttime = 0, vendor_numlimit = 0, vendor_incinterval = 0, camp_limit = 0, bf_limit = 0, pick_announce = 0,}
XAVSItem_Common.Item[64056] = {price_id = 106, vendor_price = 800, recycle_price = 600, region = {1,2}, vendor_starttime = 0, vendor_numlimit = 0, vendor_incinterval = 0, camp_limit = 0, bf_limit = 0, pick_announce = 0,}
XAVSItem_Common.Item[64057] = {price_id = 106, vendor_price = 600, recycle_price = 450, region = {1,2}, vendor_starttime = 0, vendor_numlimit = 0, vendor_incinterval = 0, camp_limit = 0, bf_limit = 0, pick_announce = 0,}
XAVSItem_Common.Item[64022] = {price_id = 106, vendor_price = 450, recycle_price = 338, region = {3,4}, vendor_starttime = 0, vendor_numlimit = 0, vendor_incinterval = 0, camp_limit = 0, bf_limit = 0, pick_announce = 0,}
XAVSItem_Common.Item[64023] = {price_id = 106, vendor_price = 450, recycle_price = 338, region = {3,4}, vendor_starttime = 0, vendor_numlimit = 0, vendor_incinterval = 0, camp_limit = 0, bf_limit = 0, pick_announce = 0,}
XAVSItem_Common.Item[64024] = {price_id = 106, vendor_price = 450, recycle_price = 338, region = {3,4}, vendor_starttime = 0, vendor_numlimit = 0, vendor_incinterval = 0, camp_limit = 0, bf_limit = 0, pick_announce = 0,}
XAVSItem_Common.Item[64025] = {price_id = 106, vendor_price = 450, recycle_price = 338, region = {3,4}, vendor_starttime = 0, vendor_numlimit = 0, vendor_incinterval = 0, camp_limit = 0, bf_limit = 0, pick_announce = 0,}
XAVSItem_Common.Item[64026] = {price_id = 106, vendor_price = 450, recycle_price = 338, region = {3,4}, vendor_starttime = 0, vendor_numlimit = 0, vendor_incinterval = 0, camp_limit = 0, bf_limit = 0, pick_announce = 0,}
XAVSItem_Common.Item[64027] = {price_id = 106, vendor_price = 800, recycle_price = 600, region = {3,4}, vendor_starttime = 0, vendor_numlimit = 0, vendor_incinterval = 0, camp_limit = 0, bf_limit = 0, pick_announce = 0,}
XAVSItem_Common.Item[64034] = {price_id = 106, vendor_price = 900, recycle_price = 675, region = {1,2}, vendor_starttime = 0, vendor_numlimit = 0, vendor_incinterval = 0, camp_limit = 0, bf_limit = 0, pick_announce = 0,}
XAVSItem_Common.Item[64053] = {price_id = 106, vendor_price = 1000, recycle_price = 750, region = {1,2}, vendor_starttime = 0, vendor_numlimit = 0, vendor_incinterval = 0, camp_limit = 0, bf_limit = 0, pick_announce = 0,}
XAVSItem_Common.Item[64054] = {price_id = 106, vendor_price = 1200, recycle_price = 900, region = {1,2}, vendor_starttime = 0, vendor_numlimit = 0, vendor_incinterval = 0, camp_limit = 0, bf_limit = 0, pick_announce = 0,}
XAVSItem_Common.Item[64055] = {price_id = 106, vendor_price = 1000, recycle_price = 750, region = {1,2}, vendor_starttime = 0, vendor_numlimit = 0, vendor_incinterval = 0, camp_limit = 0, bf_limit = 0, pick_announce = 0,}
XAVSItem_Common.Item[64036] = {price_id = 106, vendor_price = 1300, recycle_price = 975, region = {1,2}, vendor_starttime = 0, vendor_numlimit = 0, vendor_incinterval = 0, camp_limit = 0, bf_limit = 0, pick_announce = 0,}
XAVSItem_Common.Item[64043] = {price_id = 106, vendor_price = 1100, recycle_price = 825, region = {1,2}, vendor_starttime = 0, vendor_numlimit = 0, vendor_incinterval = 0, camp_limit = 0, bf_limit = 0, pick_announce = 0,}
XAVSItem_Common.Item[64068] = {price_id = 106, vendor_price = 900, recycle_price = 675, region = {1,2}, vendor_starttime = 0, vendor_numlimit = 0, vendor_incinterval = 0, camp_limit = 0, bf_limit = 0, pick_announce = 0,}
XAVSItem_Common.Item[64046] = {price_id = 106, vendor_price = 600, recycle_price = 450, region = {1,2}, vendor_starttime = 0, vendor_numlimit = 0, vendor_incinterval = 0, camp_limit = 0, bf_limit = 0, pick_announce = 0,}
XAVSItem_Common.Item[64047] = {price_id = 106, vendor_price = 600, recycle_price = 450, region = {1,2}, vendor_starttime = 0, vendor_numlimit = 0, vendor_incinterval = 0, camp_limit = 0, bf_limit = 0, pick_announce = 0,}
XAVSItem_Common.Item[64048] = {price_id = 106, vendor_price = 600, recycle_price = 450, region = {1,2}, vendor_starttime = 0, vendor_numlimit = 0, vendor_incinterval = 0, camp_limit = 0, bf_limit = 0, pick_announce = 0,}
XAVSItem_Common.Item[64049] = {price_id = 106, vendor_price = 600, recycle_price = 450, region = {1,2}, vendor_starttime = 0, vendor_numlimit = 0, vendor_incinterval = 0, camp_limit = 0, bf_limit = 0, pick_announce = 0,}
XAVSItem_Common.Item[64050] = {price_id = 106, vendor_price = 600, recycle_price = 450, region = {1,2}, vendor_starttime = 0, vendor_numlimit = 0, vendor_incinterval = 0, camp_limit = 0, bf_limit = 0, pick_announce = 0,}
XAVSItem_Common.Item[64044] = {price_id = 106, vendor_price = 500, recycle_price = 375, region = {1,2}, vendor_starttime = 0, vendor_numlimit = 0, vendor_incinterval = 0, camp_limit = 0, bf_limit = 0, pick_announce = 0,}
XAVSItem_Common.Item[64052] = {price_id = 106, vendor_price = 500, recycle_price = 375, region = {1,2}, vendor_starttime = 0, vendor_numlimit = 0, vendor_incinterval = 0, camp_limit = 0, bf_limit = 0, pick_announce = 0,}
XAVSItem_Common.Item[64064] = {price_id = 106, vendor_price = 1200, recycle_price = 900, region = {1,2}, vendor_starttime = 0, vendor_numlimit = 0, vendor_incinterval = 0, camp_limit = 0, bf_limit = 0, pick_announce = 0,}
XAVSItem_Common.Item[64060] = {price_id = 106, vendor_price = 1000, recycle_price = 750, region = {1,2}, vendor_starttime = 0, vendor_numlimit = 0, vendor_incinterval = 0, camp_limit = 0, bf_limit = 0, pick_announce = 0,}
XAVSItem_Common.Item[64045] = {price_id = 106, vendor_price = 1500, recycle_price = 1125, region = {1,2}, vendor_starttime = 0, vendor_numlimit = 0, vendor_incinterval = 0, camp_limit = 0, bf_limit = 0, pick_announce = 0,}
XAVSItem_Common.Item[64063] = {price_id = 106, vendor_price = 1300, recycle_price = 975, region = {1,2}, vendor_starttime = 0, vendor_numlimit = 0, vendor_incinterval = 0, camp_limit = 0, bf_limit = 0, pick_announce = 0,}
XAVSItem_Common.Item[64062] = {price_id = 106, vendor_price = 1800, recycle_price = 1350, region = {1,2}, vendor_starttime = 0, vendor_numlimit = 0, vendor_incinterval = 0, camp_limit = 0, bf_limit = 0, pick_announce = 0,}
XAVSItem_Common.Item[64067] = {price_id = 106, vendor_price = 2200, recycle_price = 1650, region = {1,2}, vendor_starttime = 0, vendor_numlimit = 0, vendor_incinterval = 0, camp_limit = 0, bf_limit = 0, pick_announce = 0,}
XAVSItem_Common.Item[64065] = {price_id = 106, vendor_price = 1800, recycle_price = 1350, region = {1,2}, vendor_starttime = 0, vendor_numlimit = 0, vendor_incinterval = 0, camp_limit = 0, bf_limit = 0, pick_announce = 0,}
XAVSItem_Common.Item[64066] = {price_id = 106, vendor_price = 1400, recycle_price = 1050, region = {1,2}, vendor_starttime = 0, vendor_numlimit = 0, vendor_incinterval = 0, camp_limit = 0, bf_limit = 0, pick_announce = 0,}
XAVSItem_Common.Item[64004] = {price_id = 106, vendor_price = 100, recycle_price = 0, region = {1,2}, vendor_starttime = 0, vendor_numlimit = 0, vendor_incinterval = 0, camp_limit = 0, bf_limit = 0, pick_announce = 1,}
XAVSItem_Common.Item[64129] = {price_id = 106, vendor_price = 300, recycle_price = 0, region = {1,2}, vendor_starttime = 0, vendor_numlimit = 0, vendor_incinterval = 0, camp_limit = 0, bf_limit = 0, pick_announce = 1,}
XAVSItem_Common.Item[64130] = {price_id = 106, vendor_price = 1200, recycle_price = 0, region = {1,2}, vendor_starttime = 0, vendor_numlimit = 0, vendor_incinterval = 0, camp_limit = 5, bf_limit = 0, pick_announce = 1,}
XAVSItem_Common.Item[64005] = {price_id = 106, vendor_price = 200, recycle_price = 0, region = {1,2}, vendor_starttime = 0, vendor_numlimit = 0, vendor_incinterval = 0, camp_limit = 0, bf_limit = 0, pick_announce = 1,}
XAVSItem_Common.Item[64131] = {price_id = 106, vendor_price = 300, recycle_price = 0, region = {1,2}, vendor_starttime = 0, vendor_numlimit = 0, vendor_incinterval = 0, camp_limit = 0, bf_limit = 0, pick_announce = 1,}
XAVSItem_Common.Item[64132] = {price_id = 106, vendor_price = 1500, recycle_price = 0, region = {1,2}, vendor_starttime = 0, vendor_numlimit = 0, vendor_incinterval = 0, camp_limit = 1, bf_limit = 0, pick_announce = 1,}
XAVSItem_Common.Item[64077] = {price_id = 106, vendor_price = 300, recycle_price = 0, region = {1,2}, vendor_starttime = 0, vendor_numlimit = 0, vendor_incinterval = 0, camp_limit = 0, bf_limit = 0, pick_announce = 1,}
XAVSItem_Common.Item[64133] = {price_id = 106, vendor_price = 500, recycle_price = 0, region = {1,2}, vendor_starttime = 0, vendor_numlimit = 0, vendor_incinterval = 0, camp_limit = 0, bf_limit = 0, pick_announce = 1,}
XAVSItem_Common.Item[64134] = {price_id = 106, vendor_price = 800, recycle_price = 0, region = {1,2}, vendor_starttime = 0, vendor_numlimit = 0, vendor_incinterval = 0, camp_limit = 1, bf_limit = 0, pick_announce = 1,}
XAVSItem_Common.Item[64082] = {price_id = 106, vendor_price = 600, recycle_price = 0, region = {3,4}, vendor_starttime = 60, vendor_numlimit = 0, vendor_incinterval = 0, camp_limit = 0, bf_limit = 1, pick_announce = 2,}
XAVSItem_Common.Item[64083] = {price_id = 106, vendor_price = 600, recycle_price = 0, region = {3,4}, vendor_starttime = 60, vendor_numlimit = 0, vendor_incinterval = 0, camp_limit = 0, bf_limit = 1, pick_announce = 2,}
XAVSItem_Common.Item[64058] = {price_id = 106, vendor_price = 1200, recycle_price = 0, region = {3,4}, vendor_starttime = 300, vendor_numlimit = 0, vendor_incinterval = 0, camp_limit = 0, bf_limit = 2, pick_announce = 2,}
XAVSItem_Common.Item[64084] = {price_id = 106, vendor_price = 1000, recycle_price = 0, region = {1,2}, vendor_starttime = 0, vendor_numlimit = 0, vendor_incinterval = 0, camp_limit = 0, bf_limit = 0, pick_announce = 1,}
XAVSItem_Common.Item[64135] = {price_id = 106, vendor_price = 600, recycle_price = 0, region = {1,2}, vendor_starttime = 0, vendor_numlimit = 0, vendor_incinterval = 0, camp_limit = 0, bf_limit = 0, pick_announce = 1,}
XAVSItem_Common.Item[64136] = {price_id = 106, vendor_price = 600, recycle_price = 0, region = {1,2}, vendor_starttime = 0, vendor_numlimit = 0, vendor_incinterval = 0, camp_limit = 3, bf_limit = 0, pick_announce = 1,}
XAVSItem_Common.Item[64086] = {price_id = 106, vendor_price = 500, recycle_price = 0, region = {1,2}, vendor_starttime = 0, vendor_numlimit = 0, vendor_incinterval = 0, camp_limit = 0, bf_limit = 0, pick_announce = 1,}
XAVSItem_Common.Item[64137] = {price_id = 106, vendor_price = 600, recycle_price = 0, region = {1,2}, vendor_starttime = 0, vendor_numlimit = 0, vendor_incinterval = 0, camp_limit = 0, bf_limit = 0, pick_announce = 1,}
XAVSItem_Common.Item[64138] = {price_id = 106, vendor_price = 700, recycle_price = 0, region = {1,2}, vendor_starttime = 0, vendor_numlimit = 0, vendor_incinterval = 0, camp_limit = 5, bf_limit = 0, pick_announce = 1,}
XAVSItem_Common.Item[64076] = {price_id = 106, vendor_price = 800, recycle_price = 0, region = {1,2}, vendor_starttime = 0, vendor_numlimit = 0, vendor_incinterval = 0, camp_limit = 0, bf_limit = 0, pick_announce = 1,}
XAVSItem_Common.Item[64139] = {price_id = 106, vendor_price = 500, recycle_price = 0, region = {1,2}, vendor_starttime = 0, vendor_numlimit = 0, vendor_incinterval = 0, camp_limit = 0, bf_limit = 0, pick_announce = 1,}
XAVSItem_Common.Item[64140] = {price_id = 106, vendor_price = 500, recycle_price = 0, region = {1,2}, vendor_starttime = 0, vendor_numlimit = 0, vendor_incinterval = 0, camp_limit = 2, bf_limit = 0, pick_announce = 1,}
XAVSItem_Common.Item[64078] = {price_id = 106, vendor_price = 600, recycle_price = 0, region = {1,2}, vendor_starttime = 0, vendor_numlimit = 0, vendor_incinterval = 0, camp_limit = 0, bf_limit = 0, pick_announce = 1,}
XAVSItem_Common.Item[64141] = {price_id = 106, vendor_price = 500, recycle_price = 0, region = {1,2}, vendor_starttime = 0, vendor_numlimit = 0, vendor_incinterval = 0, camp_limit = 0, bf_limit = 0, pick_announce = 1,}
XAVSItem_Common.Item[64142] = {price_id = 106, vendor_price = 400, recycle_price = 0, region = {1,2}, vendor_starttime = 0, vendor_numlimit = 0, vendor_incinterval = 0, camp_limit = 2, bf_limit = 0, pick_announce = 1,}
XAVSItem_Common.Item[64061] = {price_id = 106, vendor_price = 2000, recycle_price = 0, region = {1,2}, vendor_starttime = 0, vendor_numlimit = 0, vendor_incinterval = 0, camp_limit = 1, bf_limit = 0, pick_announce = 1,}
XAVSItem_Common.Item[64085] = {price_id = 106, vendor_price = 800, recycle_price = 0, region = {1,2}, vendor_starttime = 0, vendor_numlimit = 0, vendor_incinterval = 0, camp_limit = 0, bf_limit = 0, pick_announce = 1,}
XAVSItem_Common.Item[64143] = {price_id = 106, vendor_price = 800, recycle_price = 0, region = {1,2}, vendor_starttime = 0, vendor_numlimit = 0, vendor_incinterval = 0, camp_limit = 0, bf_limit = 0, pick_announce = 1,}
XAVSItem_Common.Item[64144] = {price_id = 106, vendor_price = 800, recycle_price = 0, region = {1,2}, vendor_starttime = 0, vendor_numlimit = 0, vendor_incinterval = 0, camp_limit = 2, bf_limit = 0, pick_announce = 1,}
XAVSItem_Common.Item[64069] = {price_id = 106, vendor_price = 1200, recycle_price = 0, region = {1,2}, vendor_starttime = 0, vendor_numlimit = 0, vendor_incinterval = 0, camp_limit = 0, bf_limit = 0, pick_announce = 1,}
XAVSItem_Common.Item[64145] = {price_id = 106, vendor_price = 1200, recycle_price = 0, region = {1,2}, vendor_starttime = 0, vendor_numlimit = 0, vendor_incinterval = 0, camp_limit = 0, bf_limit = 0, pick_announce = 1,}
XAVSItem_Common.Item[64146] = {price_id = 106, vendor_price = 1200, recycle_price = 0, region = {1,2}, vendor_starttime = 0, vendor_numlimit = 0, vendor_incinterval = 0, camp_limit = 3, bf_limit = 0, pick_announce = 1,}
XAVSItem_Common.Item[64070] = {price_id = 106, vendor_price = 1500, recycle_price = 0, region = {1,2}, vendor_starttime = 0, vendor_numlimit = 0, vendor_incinterval = 0, camp_limit = 0, bf_limit = 0, pick_announce = 1,}
XAVSItem_Common.Item[64147] = {price_id = 106, vendor_price = 500, recycle_price = 0, region = {1,2}, vendor_starttime = 0, vendor_numlimit = 0, vendor_incinterval = 0, camp_limit = 0, bf_limit = 0, pick_announce = 1,}
XAVSItem_Common.Item[64148] = {price_id = 106, vendor_price = 1000, recycle_price = 0, region = {1,2}, vendor_starttime = 0, vendor_numlimit = 0, vendor_incinterval = 0, camp_limit = 2, bf_limit = 0, pick_announce = 1,}
XAVSItem_Common.Item[64071] = {price_id = 106, vendor_price = 1800, recycle_price = 0, region = {1,2}, vendor_starttime = 0, vendor_numlimit = 0, vendor_incinterval = 0, camp_limit = 0, bf_limit = 0, pick_announce = 1,}
XAVSItem_Common.Item[64149] = {price_id = 106, vendor_price = 750, recycle_price = 0, region = {1,2}, vendor_starttime = 0, vendor_numlimit = 0, vendor_incinterval = 0, camp_limit = 0, bf_limit = 0, pick_announce = 1,}
XAVSItem_Common.Item[64150] = {price_id = 106, vendor_price = 1250, recycle_price = 0, region = {1,2}, vendor_starttime = 0, vendor_numlimit = 0, vendor_incinterval = 0, camp_limit = 2, bf_limit = 0, pick_announce = 1,}
XAVSItem_Common.Item[64072] = {price_id = 106, vendor_price = 1600, recycle_price = 0, region = {1,2}, vendor_starttime = 600, vendor_numlimit = 0, vendor_incinterval = 0, camp_limit = 2, bf_limit = 0, pick_announce = 1,}
XAVSItem_Common.Item[64073] = {price_id = 106, vendor_price = 2400, recycle_price = 0, region = {3,4}, vendor_starttime = 600, vendor_numlimit = 0, vendor_incinterval = 0, camp_limit = 1, bf_limit = 0, pick_announce = 1,}
XAVSItem_Common.Item[64074] = {price_id = 106, vendor_price = 2200, recycle_price = 0, region = {3,4}, vendor_starttime = 600, vendor_numlimit = 0, vendor_incinterval = 0, camp_limit = 1, bf_limit = 0, pick_announce = 1,}
XAVSItem_Common.Item[64075] = {price_id = 106, vendor_price = 1600, recycle_price = 0, region = {1,2}, vendor_starttime = 600, vendor_numlimit = 0, vendor_incinterval = 0, camp_limit = 2, bf_limit = 0, pick_announce = 1,}
XAVSItem_Common.Item[64079] = {price_id = 106, vendor_price = 3200, recycle_price = 0, region = {1,2}, vendor_starttime = 600, vendor_numlimit = 0, vendor_incinterval = 0, camp_limit = 0, bf_limit = 1, pick_announce = 2,}
XAVSItem_Common.Item[64080] = {price_id = 106, vendor_price = 2800, recycle_price = 0, region = {3,4}, vendor_starttime = 600, vendor_numlimit = 0, vendor_incinterval = 0, camp_limit = 1, bf_limit = 0, pick_announce = 1,}
XAVSItem_Common.Item[64081] = {price_id = 106, vendor_price = 0, recycle_price = 0, region = {}, vendor_starttime = 0, vendor_numlimit = 0, vendor_incinterval = 0, camp_limit = 0, bf_limit = 0, pick_announce = 2,}
XAVSItem_Common.Item[64059] = {price_id = 106, vendor_price = 0, recycle_price = 0, region = {}, vendor_starttime = 0, vendor_numlimit = 0, vendor_incinterval = 0, camp_limit = 0, bf_limit = 0, pick_announce = 2,}
--名人对战道具配置结束

function XAVSItem_Common:Get_XAVSItem_Items()
	return XAVSItem_Common.Item
end


--战场道具合成配置
XAVSItem_Common.Combine = {}
--在此表中的道具合成时，除了合成产物本身的价格，还需要消耗道具
--如果消耗的道具包裹中都有且数量满足，则扣除并合成
--如果没有，则如果当前所在区域中的道具可以买，则计算总价，折算扣钱并合成
--如果消耗的道具没有，且本身也需要合成，则类似上面继续往下查，直接到找到并合成
--索引号：物品id
--tab内：所有的道具id，出现多次的则需要多个
--名人对战道具合成配置开始
XAVSItem_Common.Combine[64017] = {64007, 64012,}
XAVSItem_Common.Combine[64018] = {64008, 64012,}
XAVSItem_Common.Combine[64019] = {64009, 64012,}
XAVSItem_Common.Combine[64020] = {64010, 64012,}
XAVSItem_Common.Combine[64021] = {64011, 64012,}
XAVSItem_Common.Combine[64030] = {64015, 64010, 64007 ,64016,}
XAVSItem_Common.Combine[64031] = {64015, 64008, 64011 ,64016,}
XAVSItem_Common.Combine[64032] = {64015, 64037, 64042,}
XAVSItem_Common.Combine[64033] = {64015, 64038,}
XAVSItem_Common.Combine[64056] = {64037, 64007, 64009,}
XAVSItem_Common.Combine[64057] = {64038, 64008, 64011,}
XAVSItem_Common.Combine[64034] = {64015,}
XAVSItem_Common.Combine[64053] = {64013, 64014, 64012 ,64012,}
XAVSItem_Common.Combine[64054] = {64007, 64007, 64007 ,64035,}
XAVSItem_Common.Combine[64055] = {64010, 64010, 64010 ,64042,}
XAVSItem_Common.Combine[64068] = {64035, 64042,}
XAVSItem_Common.Combine[64046] = {64022, 64007, 64022,}
XAVSItem_Common.Combine[64047] = {64023, 64008, 64023,}
XAVSItem_Common.Combine[64048] = {64024, 64009, 64024,}
XAVSItem_Common.Combine[64049] = {64025, 64010, 64025,}
XAVSItem_Common.Combine[64050] = {64026, 64011, 64026,}
XAVSItem_Common.Combine[64044] = {64036, 64035,}
XAVSItem_Common.Combine[64052] = {64051, 64035,}
XAVSItem_Common.Combine[64064] = {64036, 64035, 64013 ,64014,}
XAVSItem_Common.Combine[64060] = {64035, 64035, 64007,}
XAVSItem_Common.Combine[64045] = {64016, 64027,}
XAVSItem_Common.Combine[64063] = {64035, 64035, 64042 ,64043,}
XAVSItem_Common.Combine[64062] = {64027, 64037, 64038 ,64039,}
XAVSItem_Common.Combine[64067] = {64048, 64016,}
XAVSItem_Common.Combine[64065] = {64046, 64036,}
XAVSItem_Common.Combine[64066] = {64044, 64049, 64042,}
XAVSItem_Common.Combine[64129] = {64004,}
XAVSItem_Common.Combine[64130] = {64129,}
XAVSItem_Common.Combine[64131] = {64005,}
XAVSItem_Common.Combine[64132] = {64131,}
XAVSItem_Common.Combine[64133] = {64077,}
XAVSItem_Common.Combine[64134] = {64133,}
XAVSItem_Common.Combine[64136] = {64135,}
XAVSItem_Common.Combine[64086] = {64136,}
XAVSItem_Common.Combine[64138] = {64137,}
XAVSItem_Common.Combine[64076] = {64138,}
XAVSItem_Common.Combine[64140] = {64139,}
XAVSItem_Common.Combine[64078] = {64140,}
XAVSItem_Common.Combine[64142] = {64141,}
XAVSItem_Common.Combine[64061] = {64142,}
XAVSItem_Common.Combine[64143] = {64085,}
XAVSItem_Common.Combine[64144] = {64143,}
XAVSItem_Common.Combine[64145] = {64069,}
XAVSItem_Common.Combine[64146] = {64145,}
XAVSItem_Common.Combine[64147] = {64070,}
XAVSItem_Common.Combine[64148] = {64147,}
XAVSItem_Common.Combine[64149] = {64071,}
XAVSItem_Common.Combine[64150] = {64149,}
--名人对战道具合成配置结束
--------------------------------------------------------------------------------------------------------



--------------------------------------------------------------------------------------------------------
--通用错误码
XAVSITEM_SUCCESS                      = 0
XAVSITEM_ERR_UNKNOWN                  = 1
XAVSITEM_ERR_DUPLICATE                = 2
XAVSITEM_ERR_INVALID_INPUT            = 3
XAVSITEM_ERR_INVALID_REGION           = 4
XAVSITEM_ERR_INVALID_ITEM             = 5
XAVSITEM_ERR_INVALID_FORMULA          = 6
XAVSITEM_ERR_COMBINE_CYCLIC_DEP       = 7
XAVSITEM_ERR_ITEM_CANNOT_BUY          = 8
XAVSITEM_ERR_ITEM_CANNOT_RECYCLE      = 9
XAVSITEM_ERR_ITEM_NOT_OPEN_FOR_SALE   = 10
XAVSITEM_ERR_ITEM_NOT_ENOUGH_FOR_SALE = 11
XAVSITEM_ERR_NOT_ENOUGH_MONEY         = 12
XAVSITEM_ERR_NOT_ENOUGH_PACK_SLOTS    = 13
XAVSITEM_ERR_MONEY_UPLIMIT            = 14
XAVSITEM_ERR_NOT_ENOUGH_ITEM          = 15
XAVSITEM_ERR_REGION_LIMIT             = 16
XAVSITEM_ERR_FACTION_LIMIT            = 17
XAVSITEM_ERR_BATTLEFIELD_LIMIT        = 18



--------------------------------------------------------------------------------------------------------
--通用程序逻辑
XAVSItem_Common.Logic = {
	GetCombineMaterials = function(item_tid, count)
		if item_tid <= 0 or count <= 0 then
			return XAVSITEM_ERR_INVALID_INPUT, item_tid
		end

		if not XAVSItem_Common.Combine[item_tid] then
			return XAVSITEM_ERR_INVALID_FORMULA, item_tid
		end
		local materials = {}
		for dummy_index, material_tid in pairs(XAVSItem_Common.Combine[item_tid]) do
			if not materials[material_tid] then
				materials[material_tid] = 1
			else
				materials[material_tid] = materials[material_tid] + 1
			end
		end
		for material_tid, material_count in pairs(materials) do
			materials[material_tid] = material_count * count
		end
		return XAVSITEM_SUCCESS, materials
	end,

	--计算购买商品所需支付的金钱和材料
	CalculateCombineCost = function(btype, item_tid, count, money_to_use, items_to_dec)
		if item_tid <= 0 or count <= 0 then
			return XAVSITEM_ERR_INVALID_INPUT, item_tid
		end
		if not XAVSItem_Common.Item[item_tid] then
			return XAVSITEM_ERR_INVALID_ITEM, item_tid
		end
		local item_info = XAVSItem_Common.Item[item_tid]
		--Calculate money cost of the product
		if item_info.price_id > 0 and item_info.vendor_price > 0 then
			if not money_to_use[item_info.price_id] then
				money_to_use[item_info.price_id] = item_info.vendor_price * count
			else
				money_to_use[item_info.price_id] = money_to_use[item_info.price_id] + item_info.vendor_price * count
			end
		end
		--Check if the item should be combined
		if XAVSItem_Common.Combine[item_tid] then
			local errcode, materials = XAVSItem_Common.Logic.GetCombineMaterials(item_tid, count)
			if XAVSITEM_SUCCESS ~= errcode then
				return errcode, item_tid
			end
			--Check materials' expense
			for material_tid, material_count in pairs(materials) do
				local num_in_inv = btype:GetPlayerItemCount(material_tid)
				local num_to_buy = material_count - num_in_inv
				if num_to_buy <= 0 then
					if not items_to_dec[material_tid] then
						items_to_dec[material_tid] = material_count
					else
						items_to_dec[material_tid] = items_to_dec[material_tid] + material_count
					end
				else
					if num_to_buy < material_count then
						if not items_to_dec[material_tid] then
							items_to_dec[material_tid] = num_in_inv
						else
							items_to_dec[material_tid] = items_to_dec[material_tid] + num_in_inv
						end
					end
					local tmp_errcode, tmp_item_tid = XAVSItem_Common.Logic.CalculateCombineCost(btype, material_tid, num_to_buy, money_to_use, items_to_dec)
					if XAVSITEM_SUCCESS ~= tmp_errcode then
						return tmp_errcode, tmp_item_tid
					end
				end
			end
		end
		return XAVSITEM_SUCCESS, 0
	end,
}



--检查区域配置
function XAVSItem_CheckRegionConfig()
	local rid_set = {}
	for region_id, region_info in pairs(XAVSItem_Common.Region) do
		if rid_set[region_info.rid] then
			return XAVSITEM_ERR_DUPLICATE, region_info.rid
		end
		rid_set[region_info.rid] = 1
	end
	return XAVSITEM_SUCCESS, 0
end


--检查道具列表
--返回值：错误码，道具ID
function XAVSItem_CheckItemList()
	for item_tid, item_info in pairs(XAVSItem_Common.Item) do
		for i = 1, #item_info.region do
			if not XAVSItem_Common.Region[item_info.region[i]] then
				return XAVSITEM_ERR_INVALID_REGION, item_tid
			end
		end
		if item_info.vendor_numlimit > 0 and item_info.vendor_incinterval <= 0 then
			return XAVSITEM_ERR_INVALID_ITEM, item_tid
		end
	end
	return XAVSITEM_SUCCESS, 0
end


--检查道具合成配置
--返回值：错误码，产物ID，原料ID
function XAVSItem_CheckCombineConfig()
	for product_tid, materials in pairs(XAVSItem_Common.Combine) do
		if not XAVSItem_Common.Item[product_tid] then
			return XAVSITEM_ERR_INVALID_ITEM, product_tid, 0
		end
		if 0 == #materials then
			return XAVSITEM_ERR_INVALID_FORMULA, product_tid, 0
		end
		for i = 1, #materials do
			if not XAVSItem_Common.Item[materials[i]] then
				return XAVSITEM_ERR_INVALID_ITEM, product_tid, materials[i]
			end
			if materials[i] == product_tid then
				return XAVSITEM_ERR_INVALID_FORMULA, product_tid, materials[i]
			end
		end
	end

	function CheckCyclicDependency(tbl, item_tid)
		if not XAVSItem_Common.Combine[item_tid] then
			return XAVSITEM_SUCCESS, 0
		end
		local tmp_tbl = {}
		for i = 1, #XAVSItem_Common.Combine[item_tid] do
			local material_tid = XAVSItem_Common.Combine[item_tid][i]
			if not tmp_tbl[material_tid] then
				tmp_tbl[material_tid] = 1
			else
				tmp_tbl[material_tid] = tmp_tbl[material_tid] + 1
			end
		end
		for material_tid, dummy in pairs(tmp_tbl) do
			if tbl[material_tid] then
				return XAVSITEM_ERR_COMBINE_CYCLIC_DEP, material_tid
			end
			tbl[material_tid] = 1
			local errcode, tmp_item_tid = CheckCyclicDependency(tbl, material_tid)
			if XAVSITEM_SUCCESS ~= errcode then
				return errcode, tmp_item_tid
			end
		end
		return XAVSITEM_SUCCESS, 0
	end
	--Check cyclic dependency
	for item_tid, materials in pairs(XAVSItem_Common.Combine) do
		local tbl = {}
		tbl[item_tid] = 1
		local errcode, tmp_item_tid = CheckCyclicDependency(tbl, item_tid)
		if XAVSITEM_SUCCESS ~= errcode then
			return errcode, tmp_item_tid, tmp_item_tid
		end
	end

	return XAVSITEM_SUCCESS, 0, 0
end



--------------------------------------------------------------------------------------------------------
--Test
XAVSItem_Common.Test = function()
	print(--[[!AUTO_1]][====[---------------Test Begin-------------]====])
	print(--[[!AUTO_2]][====[XAVSItem_Common.Region Check:]====])
	print(XAVSItem_CheckRegionConfig())
	print(--[[!AUTO_3]][====[XAVSItem_Common.Item Check:]====])
	print(XAVSItem_CheckItemList())
	print(--[[!AUTO_4]][====[XAVSItem_Common.Combine Check:]====])
	print(XAVSItem_CheckCombineConfig())
	print(--[[!AUTO_5]][====[----------------Test End--------------]====])
end

--XAVSItem_Common.Test()
