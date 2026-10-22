
---------登录窗口异常优化相关-------------------

------------------------------------
-- MsgErr
------------------------------------

MsgErr = {}

MsgErr.MsgErrListInfo =
{
	[10] =
	{
		Title = "密码和账号不匹配",
		Desc = "^ffffff原因可能是：\r       ^ffffff密码不符合规则：密码位数6-16位；支持数字和英文字母；区分大小写；\r       账号不符合规则：邮箱账号请输入完整的邮箱地址；\r       账号和密码不能为空；\r\r^ffffff提交3次以上均不正确，可能是密码丢失或者遗忘，请访问完美世界客服中心",
		LinkName = "修改密码",
		LinkAd = "http://cs.wanmei.com/self/passemail.shtml",
		
		Desc2 = "\r^ff0000提示：^ffffff如果密码泄露或账号被盗也会出现密码验证错误，点击这里可以",
		LinkName2 = "申请找回",
		LinkAd2 = "http://cs.wanmei.com/selfguided/filost.htm",
	},
	
	[27] =
	{
		Title = "密保验证失败",
		Desc = "^ffffff您输入的矩阵数字^ee9a4b3次^ffffff均不正确，系统已将您的账号暂时封停，您可以^ee9a4b10分钟^ffffff后再次尝试登录。\r\r^ff0000提示：^ffffff您可以访问完美世界客服中心",
		LinkName = "解绑密保卡",
		LinkAd = "http://cs.wanmei.com/selfguided/fmbnologin.htm",
		
		Desc2 = "",
		LinkName2 = "",
		LinkAd2 = "",
	},

	[34] =
	{
		Title = "密保验证失败",
		Desc = "^ffffff您输入的矩阵数字^ee9a4b错误^ffffff，请重新输入。\r\r^ff0000提示：^ffffff输入^ee9a4b3次^ffffff不正确，账号将被暂时封停^ee9a4b10分钟^ffffff。您可以访问完美世界客服中心",
		LinkName = "解绑密保卡",
		LinkAd = "http://cs.wanmei.com/selfguided/fmbnologin.htm",
		
		Desc2 = "",
		LinkName2 = "",
		LinkAd2 = "",
	},
	
	[43] =
	{
		Title = "令牌验证失败",
		Desc = "^ffffff手机令牌动态密码输入^ee9a4b错误^ffffff或^ee9a4b已过期^ffffff，请重新输入。\r\r^ff0000提示：^ffffff输入^ee9a4b3次^ffffff不正确，账号将被暂时封停^ee9a4b10分钟^ffffff。您可以访问完美世界客服中心",
		LinkName = "解绑手机令牌",
		LinkAd = "http://cs.wanmei.com/selfguided/fmbnologin.htm",
		
		Desc2 = "",
		LinkName2 = "",
		LinkAd2 = "",
	},
	
	[137] =
	{
		Title = "令牌验证失败",
		Desc = "^ffffff您输入的手机令牌动态密码^ee9a4b3次^ffffff均不正确，系统已将您的账号暂时封停，您可以^ee9a4b10分钟^ffffff后再次尝试登录。\r\r^ff0000提示：^ffffff您可以访问完美世界客服中心",
		LinkName = "解绑手机令牌",
		LinkAd = "http://cs.wanmei.com/selfguided/fmbnologin.htm",
		
		Desc2 = "",
		LinkName2 = "",
		LinkAd2 = "",
	},
	
	--1
	[-1] =
	{
		Title = "禁止登录",
		Desc = "^ff0000提示：^ffffff您可以访问完美世界客服中心自助专区提交信息，",
		LinkName = "申请解封",
		LinkAd = "http://cs.wanmei.com/selfguided/ffax.htm",
		
		Desc2 = "",
		LinkName2 = "",
		LinkAd2 = "",
	},
	
	[1] =
	{
		Title = "禁止登录",
		Desc = "^ff0000提示：^ffffff您可以访问完美世界客服中心自助专区提交信息，",
		LinkName = "申请解封",
		LinkAd = "http://cs.wanmei.com/selfguided/ffax.htm",
		
		Desc2 = "",
		LinkName2 = "",
		LinkAd2 = "",
	},
	[2] =
	{
		Title = "禁止登录",
		Desc = "^ffffff请您拨打客服游戏专线，根据语音提示快速解封游戏账号。\r\r^ff0000提示：^ffffff您可以访问完美世界客服中心自助专区提交信息，",
		LinkName = "申请解封",
		LinkAd = "http://cs.wanmei.com/selfguided/ffax.htm",
		
		Desc2 = "",
		LinkName2 = "",
		LinkAd2 = "",
	},
	[3] =
	{
		Title = "禁止登录",
		Desc = "^ffffff请您进入客户服务微信客户端，在\“我的账号\”中提交账号解封申请。\r\r^ff0000提示：^ffffff您可以访问完美世界客服中心自助专区提交信息，",
		LinkName = "申请解封",
		LinkAd = "http://cs.wanmei.com/selfguided/ffax.htm",
		
		Desc2 = "",
		LinkName2 = "",
		LinkAd2 = "",
	},
	[4] =
	{
		Title = "禁止登录",
		Desc = "\r\r^ff0000提示：^ffffff您可以联系完美世界",
		LinkName = "在线客服",
		LinkAd = "http://service.wanmei.com/jsp/im/im.jsp?imName=im",
		
		Desc2 = "，提交信息申请解封；",
		LinkName2 = "",
		LinkAd2 = "",
	},
	[5] =
	{
		Title = "禁止登录",
		Desc = "\r\r^ff0000提示：^ffffff您可以联系完美世界",
		LinkName = "在线客服",
		LinkAd = "http://service.wanmei.com/jsp/im/im.jsp?imName=im",
		
		Desc2 = "，提交信息申请解封；",
		LinkName2 = "",
		LinkAd2 = "",
	},
	
	
	[6] =
	{
		Title = "禁止登录",
		Desc = "^ff0000提示：^ffffff如果账号被盗，由盗号者使用第三方软件，您可以",
		LinkName = "申诉解封",
		LinkAd = "http://cs.wanmei.com/selfguided/fdisturb.htm",
		
		Desc2 = "\r^ffffff原因可能是：\r^ffffff1. 答错或未回答反外挂题目，重新登录回答正确即可。\r2. 使用第三方辅助软件，请等候封停结束。",
		LinkName2 = "",
		LinkAd2 = "",
	},
	
	[7] =
	{
		Title = "禁止登录",
		Desc = "^ff0000提示：^ffffff您可以访问完美世界客服中心自助专区提交信息，",
		LinkName = "申请解封",
		LinkAd = "http://cs.wanmei.com/selfguided/tzhaohui.htm",
		
		Desc2 = "",
		LinkName2 = "",
		LinkAd2 = "",
	},
	
	[8] =
	{
		Title = "禁止登录",
		Desc = "^ff0000提示：^ffffff如果账号被盗，由盗号者在游戏内违规喊话，您可以",
		LinkName = "申诉解封",
		LinkAd = "http://cs.wanmei.com/selfguided/fdisturb.htm",
		
		Desc2 = "",
		LinkName2 = "",
		LinkAd2 = "",
	},

}

MsgErr.MsgErrListreson = { "玩家要求封停", "玩家语音自助封停", "微信自助封停", "数据异常", "账号注册异常", "请勿使用第三方非法软件", "被申请完美找回服务", "扰乱游戏秩序", }


function MsgErr:MsgErrInfo(errid,title,msg)
	
	local Title 		= MsgErr.MsgErrListInfo[errid].Title
	local Desc 			= MsgErr.MsgErrListInfo[errid].Desc
	local LinkName 	= MsgErr.MsgErrListInfo[errid].LinkName
	local LinkAd 		= MsgErr.MsgErrListInfo[errid].LinkAd
	
	local Desc2 			= MsgErr.MsgErrListInfo[errid].Desc2
	local LinkName2 	= MsgErr.MsgErrListInfo[errid].LinkName2
	local LinkAd2 		= MsgErr.MsgErrListInfo[errid].LinkAd2

	local msgErrStr = ""
	
	
	if errid == -1 then
	
		if msg:find( MsgErr.MsgErrListreson[1] ) ~= nil then
		
			msgErrStr = msg .. "\r\r" .. title .. "\r\r" .. Desc..TextLink:BuildCodeLink( LinkName, LinkAd, 0xffe71f ).."。" 
			
		elseif msg:find( MsgErr.MsgErrListreson[2] ) ~= nil then
		
			Title 		= MsgErr.MsgErrListInfo[2].Title
			Desc 			= MsgErr.MsgErrListInfo[2].Desc
			LinkName 	= MsgErr.MsgErrListInfo[2].LinkName
			LinkAd 		= MsgErr.MsgErrListInfo[2].LinkAd
			Desc2 		= MsgErr.MsgErrListInfo[2].Desc2
		
			msgErrStr = msg .. "\r\r" .. title .. "\r\r" .. Desc..TextLink:BuildCodeLink( LinkName, LinkAd, 0xffe71f ).."。" 
			
		elseif msg:find( MsgErr.MsgErrListreson[3] ) ~= nil then
		
			Title 		= MsgErr.MsgErrListInfo[3].Title
			Desc 			= MsgErr.MsgErrListInfo[3].Desc
			LinkName 	= MsgErr.MsgErrListInfo[3].LinkName
			LinkAd 		= MsgErr.MsgErrListInfo[3].LinkAd
			Desc2 		= MsgErr.MsgErrListInfo[3].Desc2
			
			msgErrStr = msg .. "\r\r" .. title .. "\r\r" .. Desc..TextLink:BuildCodeLink( LinkName, LinkAd, 0xffe71f ).."。" 
		
		elseif msg:find( MsgErr.MsgErrListreson[4] ) ~= nil then
		
			Title 		= MsgErr.MsgErrListInfo[4].Title
			Desc 			= MsgErr.MsgErrListInfo[4].Desc
			LinkName 	= MsgErr.MsgErrListInfo[4].LinkName
			LinkAd 		= MsgErr.MsgErrListInfo[4].LinkAd
			Desc2 		= MsgErr.MsgErrListInfo[4].Desc2
			
			msgErrStr = msg .. "\r\r" .. title .. "\r\r" .. Desc..TextLink:BuildCodeLink( LinkName, LinkAd, 0xffe71f ) .. Desc2 
			
		elseif msg:find( MsgErr.MsgErrListreson[5] ) ~= nil then
		
			Title 		= MsgErr.MsgErrListInfo[5].Title
			Desc 			= MsgErr.MsgErrListInfo[5].Desc
			LinkName 	= MsgErr.MsgErrListInfo[5].LinkName
			LinkAd 		= MsgErr.MsgErrListInfo[5].LinkAd
			Desc2 		= MsgErr.MsgErrListInfo[5].Desc2
			
			msgErrStr = msg .. "\r\r" .. title .. "\r\r" .. Desc..TextLink:BuildCodeLink( LinkName, LinkAd, 0xffe71f ) .. Desc2 
		
		elseif msg:find( MsgErr.MsgErrListreson[6] ) ~= nil then
		
			Title 		= MsgErr.MsgErrListInfo[6].Title
			Desc 			= MsgErr.MsgErrListInfo[6].Desc
			LinkName 	= MsgErr.MsgErrListInfo[6].LinkName
			LinkAd 		= MsgErr.MsgErrListInfo[6].LinkAd
			Desc2 		= MsgErr.MsgErrListInfo[6].Desc2
			
			msgErrStr = msg .. Desc2 .. "\r\r" .. title .. "\r\r" .. Desc..TextLink:BuildCodeLink( LinkName, LinkAd, 0xffe71f ).."。" 
		
		elseif msg:find( MsgErr.MsgErrListreson[7] ) ~= nil then
		
			LinkName 	= MsgErr.MsgErrListInfo[7].LinkName
			LinkAd 		= MsgErr.MsgErrListInfo[7].LinkAd
			
			msgErrStr = msg .. "\r\r" .. title .. "\r\r" .. Desc..TextLink:BuildCodeLink( LinkName, LinkAd, 0xffe71f ).."。" 
		
		elseif msg:find( MsgErr.MsgErrListreson[8] ) ~= nil then
		
			Title 		= MsgErr.MsgErrListInfo[8].Title
			Desc 			= MsgErr.MsgErrListInfo[8].Desc
			LinkName 	= MsgErr.MsgErrListInfo[8].LinkName
			LinkAd 		= MsgErr.MsgErrListInfo[8].LinkAd
			
			msgErrStr = msg .. "\r\r" .. title .. "\r\r" .. Desc..TextLink:BuildCodeLink( LinkName, LinkAd, 0xffe71f ).."。" 
		
		else
		
			Title = msg
			msgErrStr = "" 
		
		end
	
	else
		msgErrStr = Desc..TextLink:BuildCodeLink( LinkName, LinkAd, 0xffe71f ).."。" 
		if Desc2 ~= ""  then
			msgErrStr = msgErrStr .. Desc2..TextLink:BuildCodeLink( LinkName2, LinkAd2, 0xffe71f ).."。"
		end

	end
	
	return Title,msgErrStr

end