QShop = {}

--type 0代表网页 1代表商城
--icon 图片id
--url  网页地址
--mall_item_id  商品商城id
--注意下面的配置最好为5个，可以比5个多(多出的客户端不会显示)，但是不能比5个少  
QShop.GUIDE_INFO = 
{
	[0] = {type = 1, icon = 27996, url = "", mall_item_id = 1718},--末雨
	[1] = {type = 1, icon = 27362, url = "", mall_item_id = 1591},--玛雅 12.7
	[2] = {type = 1, icon = 27310, url = "", mall_item_id = 1237},--醉舞
	[3] = {type = 1, icon = 27306, url = "", mall_item_id = 1547},--蔷薇
	[4] = {type = 0, icon = 26793, url = "http://store.wanmei.com/xa/duobao", mall_item_id = 0 },--一元夺宝,永久

	--[0] = {type = 1, icon = 27546, url = "", mall_item_id = 1617},--春节	
	--[3] = {type = 1, icon = 26961, url = "", mall_item_id = 1483},--中元
        --[4] = {type = 1, icon = 26960, url = "", mall_item_id = 1461},--七夕
	--[4] = {type = 1, icon = 26833, url = "", mall_item_id = 1438},--云隐
	--[5] = {type = 1, icon = 26312, url = "", mall_item_id = 1350},--云川
}

--导购自动翻页时间(毫秒).
QShop.GUIDE_INFO_CHANGE_TIME = 3000
function QShop:GetGuideInfoChangeTime()
	return QShop.GUIDE_INFO_CHANGE_TIME
end

function QShop:GetGuideInfoCount()
	local count = 0
	for i, val in pairs(QShop.GUIDE_INFO) do
		count = count + 1
	end
	return count
end

function QShop:GetGuideInfoByIndex(i)
	return QShop.GUIDE_INFO[i]
end





QShop.Hot_ACTIVITY_DURATION = 7000  --动画停止后持续显示时间

function QShop:GetHotActivityDuration()
	return QShop.Hot_ACTIVITY_DURATION
end

--链接文本颜色
QShop.HOT_ACTIVITY_LINK_COLOR = { red = 255, green = 0, blue = 0}
function QShop:GetHotActivityLinkColor()
	return QShop.HOT_ACTIVITY_LINK_COLOR
end
--type 0代表网页  1代表商城商品 2代表只是文字描述(不会有链接)
--desc 活动热售横幅描述
--link 有链接时的文字(例如：点击购买),没有链接为空
--url  链接的网页地址，商品时为空
--mall_item_id 链接的商品id，网页时为0
--暂不更新此项
QShop.HOT_ACTIVITY = 
{
	[0] = {type = 1, desc = "★★最新520萌爱系列时装，说好的做彼此的天使1、2、3！",    link = "点击抢购", url = "", mall_item_id = 1396},
	[1] = {type = 1, desc = "★★最新520百年好合礼包，愿得一心人白首不相离，今天不会再错过！",    link = "点击抢购", url = "", mall_item_id = 1389},
	[2] = {type = 1, desc = "★清心治愈系医护系列，至默默呵护我们的白衣天使们！",    link = "点击抢购", url = "", mall_item_id = 1382},
	[3] = {type = 1, desc = "★最强^ff0000[ 热力 ]^ffffff运动系列动感上架！折扣不只一点点！",    link = "点击抢购", url = "", mall_item_id = 1377},
	[4] = {type = 1, desc = "★★最新上架“云川”飘逸装，云絮倾城，在爱的尽头等你！",    link = "点击抢购", url = "", mall_item_id = 1350},
	[5] = {type = 1, desc = "★★“杨柳湖畔雨若浓，此时依依最人心!盛春开售“咏柳”仙气装",  link = "点击抢购", url = "", mall_item_id = 1319},
	[6] = {type = 2, desc = "温馨提示：鼠标右键点击商品可直接购买喽！一般人偶不告诉他！",  link = "", url = "", mall_item_id = 0},
}

function QShop:GetHotActivityCount()
	local count = 0
	for i, val in pairs(QShop.HOT_ACTIVITY) do
		count = count + 1
	end
	return count
end

function QShop:GetHotActivityByIndex(i)
	return QShop.HOT_ACTIVITY[i]
end




---------------------------------------------------------------------------------
--坐骑、伞具、萌宠相关(展示模型)
---------------------------------------------------------------------------------

QShop.MODEL_LIST = {92811, 87833, 83857, 77254, 18625, 86009, 87298, 84781, 18614, 73159, 73161, 87945, 81472, 88160, 87856, 88296, 85526, 89982, 88436, 92994, 83528, 81440, 92364, 90127, 93792,95207,92838,85922,94072,96462,96485,87072,96791,96792,97503,97504,98387,98666,97548,99675,99794,100286,100370} 

function QShop:GetModelList()
	return QShop.MODEL_LIST
end

QShop.ModelPosAndDistToCam = 
{
	[92811] = {Dist = -6.0, XCamera = 0.3, YCamera = 0, XPos = 1, YPos = 0, ZPos = 0},--马
	[93792] = {Dist = -6.0, XCamera = 0.3, YCamera = 0, XPos = 1, YPos = 0, ZPos = 0},
	[87833] = {Dist = -6.0, XCamera = 0.3, YCamera = 0, XPos = 1, YPos = 0, ZPos = 0},
	[83857] = {Dist = -6.5, XCamera = 0, YCamera = 0, XPos = 1, YPos = 0, ZPos = 0},
	[77254] = {Dist = -9.5, XCamera = 0.3, YCamera = 0, XPos = 1, YPos = 0, ZPos = 0},
	[18625] = {Dist = -6.0, XCamera = 0.3, YCamera = 0, XPos = 1, YPos = 0, ZPos = 0},
	[86009] = {Dist = -4.0, XCamera = 0.5, YCamera = 0, XPos = 1, YPos = 0, ZPos = 0},
	[87298] = {Dist = -7.0, XCamera = 0, YCamera = 0, XPos = 1, YPos = 0, ZPos = 0},
	[84781] = {Dist = -4.0, XCamera = 0, YCamera = 0, XPos = 1, YPos = 0, ZPos = 0},
	[18614] = {Dist = -5.0, XCamera = 0.5, YCamera = 0, XPos = 1, YPos = 0, ZPos = 0},
	[73159] = {Dist = -6.0, XCamera = 0.3, YCamera = 0, XPos = 1, YPos = 0, ZPos = 0},
	[73161] = {Dist = -6.0, XCamera = 0.3, YCamera = 0, XPos = 1, YPos = 0, ZPos = 0},
	[87945] = {Dist = -2.5, XCamera = 0, YCamera = 0, XPos = 1, YPos = 0, ZPos = 0},
	[81472] = {Dist = -2.5, XCamera = 0.3, YCamera = 0, XPos = 1, YPos = 0, ZPos = 0},
	[88160] = {Dist = -1.8, XCamera = -0.2, YCamera = 0, XPos = 1, YPos = 0, ZPos = 0},
	[87856] = {Dist = -1.5, XCamera = 0, YCamera = 0, XPos = 1, YPos = 0, ZPos = 0},
	[88296] = {Dist = -3.0, XCamera = 0, YCamera = 0, XPos = 1, YPos = 0, ZPos = 0},
	[96462] = {Dist = -3.0, XCamera = 0, YCamera = 0, XPos = 1, YPos = 0, ZPos = 0},
	[85526] = {Dist = -2.0, XCamera = 0, YCamera = 0.9, XPos = 1, YPos = 0, ZPos = 0},
	[89982] = {Dist = -1.0, XCamera = 0, YCamera = 0, XPos = 0, YPos = 0, ZPos = -1},
	[88436] = {Dist = -1.0, XCamera = 0, YCamera = 0, XPos = 0, YPos = 0, ZPos = -1},
	[92994] = {Dist = -1.0, XCamera = 0, YCamera = 0, XPos = 0, YPos = 0, ZPos = -1},
	[83528] = {Dist = -1.5, XCamera = 0, YCamera = 0, XPos = 1, YPos = 0, ZPos = 0},
	[81440] = {Dist = -1.5, XCamera = 0.1, YCamera = 0, XPos = 1, YPos = 0, ZPos = 0},
	[92364] = {Dist = -2.5, XCamera = 0, YCamera = 0, XPos = 1, YPos = 0, ZPos = 0},
	[90127] = {Dist = -2.5, XCamera = 0, YCamera = 0, XPos = 1, YPos = 0, ZPos = 0},
	[95207] = {Dist = -2.5, XCamera = 0, YCamera = 0, XPos = 0, YPos = 0, ZPos = 1},--灯具
	[92838] = {Dist = -2.5, XCamera = 0, YCamera = 0, XPos = 0, YPos = 0, ZPos = 1},
	[85922] = {Dist = -0.8, XCamera = 0, YCamera = 0, XPos = 0, YPos = 0, ZPos = -1},
	[94072] = {Dist = -9.0, XCamera = 0.3, YCamera = 0, XPos = 1, YPos = 0, ZPos = 0},
	[96485] = {Dist = -3.0, XCamera = 0, YCamera = 0, XPos = 1, YPos = 0, ZPos = 0},--伞具
	[87072] = {Dist = -3.0, XCamera = 0, YCamera = 0, XPos = 1, YPos = 0, ZPos = 0},--伞具
	[98666] = {Dist = -3.0, XCamera = 0, YCamera = 0, XPos = 1, YPos = 0, ZPos = 0},--伞具
	[97548] = {Dist = -3.0, XCamera = 0, YCamera = 0, XPos = 1, YPos = 0, ZPos = 0},--伞具
	[99675] = {Dist = -3.0, XCamera = 0, YCamera = 0, XPos = 1, YPos = 0, ZPos = 0},--伞具
	[99794] = {Dist = -3.0, XCamera = 0, YCamera = 0, XPos = 1, YPos = 0, ZPos = 0},--伞具
	[100286] = {Dist = -3.0, XCamera = 0, YCamera = 0, XPos = 1, YPos = 0, ZPos = 0},--伞具
	[100370] = {Dist = -3.0, XCamera = 0, YCamera = 0, XPos = 1, YPos = 0, ZPos = 0},--伞具
	[96791] = {Dist = -0.7, XCamera = 0.6, YCamera = 0, XPos = 0, YPos = 0, ZPos = -1},--灯具
	[96792] = {Dist = -0.8, XCamera = 0.4, YCamera = 0, XPos = 0, YPos = 0, ZPos = -1},--灯具
	[97503] = {Dist = -1, XCamera = 0, YCamera = 0, XPos = 0, YPos = 0, ZPos = -1},--灯具
	[97504] = {Dist = -1, XCamera = 0, YCamera = 0, XPos = 0, YPos = 0, ZPos = -1},--灯具
	[98387] = {Dist = -6.5, XCamera = 0, YCamera = 0, XPos = 1, YPos = 0, ZPos = 0},
}

function QShop:GetModelPosAndDistToCamByID(i)
	return QShop.ModelPosAndDistToCam[i]
end