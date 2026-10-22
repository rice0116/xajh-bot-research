--[[#encode ansi]]
--[[#tag push auto]]

PlayerDiscount = {}

----------------------------------------------------
--数据配置区

PlayerDiscount.Type = 
{
	DISCOUNT_DAY		=	1,	--每天
	DISCONT_SUM			=	2,	--累计
}

PlayerDiscount.Version = 1		
PlayerDiscount.MaxAwardItemNum = 3		
PlayerDiscount.AwardCount = 7 --目前是7档

PlayerDiscount.DayActivityIndex = 923		--每日促销活动索引
PlayerDiscount.DayActivityTid = 11032	  	 --每日促销活动ID

PlayerDiscount.SumActivityIndex = 924		--累计促销活动索引
PlayerDiscount.SumActivityTid = 11033		 --累计促销活动ID

PlayerDiscount.DayAward = {}
PlayerDiscount.DayAward =
{
	--需要花费 奖励
	[1] = {Cost = 2000, AwardItemID1 = 100650,AwardItemNum1 = 1,AwardItemID2 = -1,AwardItemNum2 = -1,AwardItemID3 = -1,AwardItemNum3 = -1},
	[2] = {Cost = 4000, AwardItemID1 = 100651,AwardItemNum1 = 1,AwardItemID2 = -1,AwardItemNum2 = -1,AwardItemID3 = -1,AwardItemNum3 = -1},
	[3] = {Cost = 8000, AwardItemID1 = 100652,AwardItemNum1 = 1,AwardItemID2 = -1,AwardItemNum2 = -1,AwardItemID3 = -1,AwardItemNum3 = -1},
	[4] = {Cost = 4000, AwardItemID1 = 100653,AwardItemNum1 = 1,AwardItemID2 = -1,AwardItemNum2 = -1,AwardItemID3 = -1,AwardItemNum3 = -1},
	[5] = {Cost = 20000, AwardItemID1 = 100654,AwardItemNum1 = 1,AwardItemID2 = -1,AwardItemNum2 = -1,AwardItemID3 = -1,AwardItemNum3 = -1},
	[6] = {Cost = 20000, AwardItemID1 = 100655,AwardItemNum1 = 1,AwardItemID2 = -1,AwardItemNum2 = -1,AwardItemID3 = -1,AwardItemNum3 = -1},
	[7] = {Cost = 8000, AwardItemID1 = 100656,AwardItemNum1 = 1,AwardItemID2 = -1,AwardItemNum2 = -1,AwardItemID3 = -1,AwardItemNum3 = -1},
}

PlayerDiscount.SumAward = {}
PlayerDiscount.SumAward =
{
	--需要花费 奖励
	[1] = {Cost = 4000, AwardItemID1 = 100657,AwardItemNum1 = 1,AwardItemID2 = -1,AwardItemNum2 = -1,AwardItemID3 = -1,AwardItemNum3 = -1},
	[2] = {Cost = 12000, AwardItemID1 = 100658,AwardItemNum1 = 1,AwardItemID2 = -1,AwardItemNum2 = -1,AwardItemID3 = -1,AwardItemNum3 = -1},
	[3] = {Cost = 20000, AwardItemID1 = 100659,AwardItemNum1 = 1,AwardItemID2 = -1,AwardItemNum2 = -1,AwardItemID3 = -1,AwardItemNum3 = -1},
	[4] = {Cost = 40000, AwardItemID1 = 100660,AwardItemNum1 = 1,AwardItemID2 = -1,AwardItemNum2 = -1,AwardItemID3 = -1,AwardItemNum3 = -1},
	[5] = {Cost = 80000, AwardItemID1 = 100661,AwardItemNum1 = 1,AwardItemID2 = -1,AwardItemNum2 = -1,AwardItemID3 = -1,AwardItemNum3 = -1},
	[6] = {Cost = 120000, AwardItemID1 = 100662,AwardItemNum1 = 1,AwardItemID2 = -1,AwardItemNum2 = -1,AwardItemID3 = -1,AwardItemNum3 = -1},
	[7] = {Cost = 200000, AwardItemID1 = 100663,AwardItemNum1 = 1,AwardItemID2 = -1,AwardItemNum2 = -1,AwardItemID3 = -1,AwardItemNum3 = -1},
}


----------------------------------------------------
--通用接口

function PlayerDiscount:GetAwardCount()
	return PlayerDiscount.AwardCount
end


function PlayerDiscount:GetDayActivityIndex()
	return PlayerDiscount.DayActivityIndex
end

function PlayerDiscount:GetDayActivityTid()
	return PlayerDiscount.DayActivityTid
end

function PlayerDiscount:GetSumActivityIndex()
	return PlayerDiscount.SumActivityIndex
end

function PlayerDiscount:GetSumActivityTid()
	return PlayerDiscount.SumActivityTid
end

function PlayerDiscount:GetDayAward()
	return PlayerDiscount.DayAward
end

function PlayerDiscount:GetSumAward()
	return PlayerDiscount.SumAward
end


----------------------------------------------------
--客户端用接口
function PlayerDiscount:GetDayAwardConfig( day )
    local award_table = PlayerDiscount.DayAward[day]
    if award_table == nil then
        return
    end
    
    return award_table.AwardItemID1, award_table.AwardItemNum1, award_table.AwardItemID2, award_table.AwardItemNum2, award_table.AwardItemID3, award_table.AwardItemNum3, award_table.Cost
end

function PlayerDiscount:GetSumAwardConfig( day )
    local award_table = PlayerDiscount.SumAward[day]
    if award_table == nil then
        return
    end
    
    return award_table.AwardItemID1, award_table.AwardItemNum1, award_table.AwardItemID2, award_table.AwardItemNum2, award_table.AwardItemID3, award_table.AwardItemNum3, award_table.Cost
end

----------------------------------------------------
----------------------------------------------------
--服务器用接口

function GetDayAwardConfig()
local ret_table = {}
for k,v in ipairs(PlayerDiscount.DayAward) do
        ret_table[#ret_table + 1] = v.Cost
        ret_table[#ret_table + 1] = v.AwardItemID1
        ret_table[#ret_table + 1] = v.AwardItemNum1
        ret_table[#ret_table + 1] = v.AwardItemID2
        ret_table[#ret_table + 1] = v.AwardItemNum2
        ret_table[#ret_table + 1] = v.AwardItemID3
        ret_table[#ret_table + 1] = v.AwardItemNum3
    end
    return unpack(ret_table)
end

function GetSumAwardConfig()
local ret_table = {}
for k,v in ipairs(PlayerDiscount.SumAward) do
        ret_table[#ret_table + 1] = v.Cost
        ret_table[#ret_table + 1] = v.AwardItemID1
        ret_table[#ret_table + 1] = v.AwardItemNum1
        ret_table[#ret_table + 1] = v.AwardItemID2
        ret_table[#ret_table + 1] = v.AwardItemNum2
        ret_table[#ret_table + 1] = v.AwardItemID3
        ret_table[#ret_table + 1] = v.AwardItemNum3
    end
    return unpack(ret_table)
end
----------------------------------------------------
----------------------------------------------------
--以下是春节促销相关(春节返还套餐用）
NewYearDiscount = {}
NewYearDiscount.Type = 
{
	NEW_YEAR_A = 0, --A套餐
	NEW_YEAR_B = 1, --B套餐
}
NewYearDiscount.Version = 1		--数据版本

NewYearDiscount.ActivityIndex = 865 --活动索引
NewYearDiscount.ActivityTid = 10760   --活动ID

NewYearDiscount.ActivityDarwIndex = 866 --积极参与活动索引
NewYearDiscount.ActivityDarwTid =  10761  --积极参与活动ID

NewYearDiscount.DrawInfo = 
{
	[1] = 					 	--套餐A
	{
		MaxCost = 2000000,		--消耗上限
		MaxReturnNum = 2000000, 	--返还上限
		ReturnRadio = 100,		--套餐返还比例,直接配50 ,代表50%
		DrawBeginTime = {year=2018, month=1, day=31,hour=0, min=0, sec=0};
		DrawEndTime = {year=2018, month=12, day=29,hour=0, min=0, sec=0};
		DrawAward = 			--套餐领取时间
		{
			[1] = { ratio=9, begintime = {year=2018, month=2, day=28,hour=0, min=0, sec=0} },
			[2] = { ratio=9, begintime = {year=2018, month=3, day=28,hour=0, min=0, sec=0} },
			[3] = { ratio=9, begintime = {year=2018, month=4, day=28,hour=0, min=0, sec=0} },
			[4] = { ratio=9, begintime = {year=2018, month=5, day=28,hour=0, min=0, sec=0} },
			[5] = { ratio=9, begintime = {year=2018, month=6, day=28,hour=0, min=0, sec=0} },
			[6] = { ratio=9, begintime = {year=2018, month=7, day=28,hour=0, min=0, sec=0} },
			[7] = { ratio=9, begintime = {year=2018, month=8, day=28,hour=0, min=0, sec=0} },
			[8] = { ratio=9, begintime = {year=2018, month=9, day=28,hour=0, min=0, sec=0} },
			[9] = { ratio=9, begintime = {year=2018, month=10, day=28,hour=0, min=0, sec=0} },
			[10] = { ratio=9, begintime = {year=2018, month=11, day=28,hour=0, min=0, sec=0} },
			[11] = { ratio=10, begintime = {year=2018, month=12, day=28,hour=0, min=0, sec=0} },
		}
	},	
	[2] = 					 	--套餐B
	{
		MaxCost = 2000000,		--消耗上限
		MaxReturnNum = 1000000, 	--返还上限
		ReturnRadio = 50,		--套餐返还比例,直接配50 ,代表50%
		DrawBeginTime = {year=2018, month=1, day=31,hour=0, min=0, sec=0};
		DrawEndTime = {year=2018, month=12, day=29,hour=0, min=0, sec=0};
		DrawAward = 			--套餐领取时间
		{
			[1] = { ratio=50, begintime = {year=2018, month=2, day=28,hour=0, min=0, sec=0} },
			[2] = { ratio=30, begintime = {year=2018, month=3, day=15,hour=0, min=0, sec=0} },
			[3] = { ratio=20, begintime = {year=2018, month=3, day=30,hour=0, min=0, sec=0} },
		}
	},
}

----------------------------------------------------
--通用接口

function NewYearDiscount:GetDataVersion()
	return NewYearDiscount.Version
end

function NewYearDiscount:GetActivityIndex()
	return NewYearDiscount.ActivityIndex
end

function NewYearDiscount:GetActivityTid()
	return NewYearDiscount.ActivityTid
end

function NewYearDiscount:GetDrawActivityIndex()
	return NewYearDiscount.ActivityDarwIndex
end

function NewYearDiscount:GetDrawActivityTid()
	return NewYearDiscount.ActivityDarwTid
end
----------------------------------------------------
--服务器接口
function NewYearDiscount:GetNewYearDiscout()
	local ret_table = {}
	local draw_num = #NewYearDiscount.DrawInfo
	ret_table[#ret_table + 1] = draw_num
	for i=1,draw_num do
		ret_table[#ret_table + 1] = NewYearDiscount.DrawInfo[i].MaxCost
		ret_table[#ret_table + 1] = os.time(NewYearDiscount.DrawInfo[i].DrawBeginTime)
		ret_table[#ret_table + 1] = os.time(NewYearDiscount.DrawInfo[i].DrawEndTime)
		ret_table[#ret_table + 1] = NewYearDiscount.DrawInfo[i].MaxReturnNum
		ret_table[#ret_table + 1] = NewYearDiscount.DrawInfo[i].ReturnRadio
		local drawinfo = NewYearDiscount.DrawInfo[i].DrawAward
		ret_table[#ret_table + 1] = #drawinfo
		for j=1,#drawinfo do
			ret_table[#ret_table + 1] = drawinfo[j].ratio 
			ret_table[#ret_table + 1] = os.time(drawinfo[j].begintime)
		end
	end 
	return unpack(ret_table)
end

----------------------------------------------------
--2017春节消费返还客户端接口
function NewYearDiscount:GetNewYearDiscoutMaxCost( index )
	local award_table = NewYearDiscount.DrawInfo[index]
	if award_table == nil then
        return
    end
	
	return award_table.MaxCost
end

function NewYearDiscount:GetNewYearDiscoutReturnRadio( index )
	local award_table = NewYearDiscount.DrawInfo[index]
	if award_table == nil then
        return
    end
	
	return award_table.ReturnRadio
end

function NewYearDiscount:GetNewYearDiscoutAwardTime( index )

	local ret_table = {}
	
	local award_table = NewYearDiscount.DrawInfo[index].DrawAward

	for k, v in ipairs (award_table) do
		ret_table[#ret_table + 1] = os.time(v.begintime)
	end
	
	return ret_table
end

function NewYearDiscount:GetNewYearDiscoutRadio( index )

	local ret_table = {}
	
	local award_table = NewYearDiscount.DrawInfo[index].DrawAward

	for k, v in ipairs (award_table) do
		ret_table[#ret_table + 1] = v.ratio
	end
	
	return ret_table
end

function NewYearDiscount:GetNewYearDiscoutDrawTime( index )

	local ret_table = {}
	
	local award_table = NewYearDiscount.DrawInfo[index]

	ret_table[1] = os.time(award_table.DrawBeginTime)
	ret_table[2] = os.time(award_table.DrawEndTime)

	return ret_table
end


----------------------------------------------------
----------------------------------------------------
--以下是会员功能相关

PlayerMember = {}

PlayerMember.ActiveCashRep = 1200 --激活获得宝银
PlayerMember.DayCashRep = 80  --每日获得宝银
PlayerMember.MallServiceItemId = 2009  --商城服务ID

PlayerMember.RandItemID = 
{
	100258,
	100259,
	100260,
	100261,
	100262,
	100263,
	100264,
	100645,
	100646,
	100647,
	100648,
}
function PlayerMember:GetActiveRep()
	return PlayerMember.ActiveCashRep
end

function PlayerMember:GetDayRep()
	return PlayerMember.DayCashRep
end

function PlayerMember:GetRandItems()
	return unpack(PlayerMember.RandItemID)
end

function PlayerMember:GetMallServiceID()
	return PlayerMember.MallServiceItemId
end


----------------------------------------------------
----------------------------------------------------
--以下是直播平台
GameLive = {}

GameLive.MallServiceItemId = 2010  --商城服务ID
GameLive.ItemInfo = 			--物品信息
--物品信息 平台ID 游戏ID(免费道具需要ID，收费道具0) 元宝(免费道具是ID,收费道具是元宝价格) 
{
	[1] = {arcitemid = 20001, itemtid = 0,cash = 20800 },
	[2] = {arcitemid = 20002, itemtid = 0,cash = 2640 },
	[3] = {arcitemid = 20003, itemtid = 0,cash = 440 },
	[4] = {arcitemid = 20004, itemtid = 0,cash = 40 },
	[5] = {arcitemid = 20005, itemtid = 100268,cash = 0 },
}

function GameLive:GetMallServiceID()
	return GameLive.MallServiceItemId
end

function GameLive:GetItemInfo()
	local ret_table = {}
	ret_table[#ret_table + 1] = #GameLive.ItemInfo
	for j=1,#GameLive.ItemInfo do
		ret_table[#ret_table + 1] = GameLive.ItemInfo[j].arcitemid 
		ret_table[#ret_table + 1] = GameLive.ItemInfo[j].itemtid 
		ret_table[#ret_table + 1] = GameLive.ItemInfo[j].cash
	end
	return unpack(ret_table)
end


