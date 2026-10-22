--好友推荐配置
FriendRecommendationConfig = {}
FriendRecommendationConfig.Question = {
	[1] = {
		question_type = 2,     --question_type:1代表单选，2代表多选
		question_desc = "共6道题目，将依据答题结果为您匹配“知音”，请依据自己\r的真实情况作答。\r工作日您的游戏活跃时间包含在以下哪几个时间段？（多选）",
		answers = {			   --选项支持任意个数
			["A"] = "早晨6:00-11:00",
			["B"] = "中午11:00-14:00",
			["C"] = "下午14:00-18:00",
			["D"] = "晚上18:00-24:00",
			["E"] = "凌晨0:00以后",
        },
    },

	[2] = {
		question_type = 2,     --question_type:1代表单选，2代表多选
		question_desc = "周末您的游戏活跃时间包含在以下哪几个时间段内？（多选）",
		answers = {			   --选项支持任意个数
			["A"] = "早晨6:00-11:00",
			["B"] = "中午11:00-14:00",
			["C"] = "下午14:00-18:00",
			["D"] = "晚上18:00-24:00",
			["E"] = "凌晨0:00以后",
		},
	},

	[3] = {
		question_type = 1,     --question_type:1代表单选，2代表多选
		question_desc = "你穿越到笑傲江湖的时代，如果能自己选择，你希望自己出\r生在什么样的家庭？",
		answers = {			   --选项支持任意个数
			["A"] = "闾阎扑地、钟鸣鼎食的富贵人家",
			["B"] = "父母成谜，但从小就被绝世高手收养传授武艺",
			["C"] = "平凡的家庭，虽不富裕，却家庭关系和睦、其乐融融",
			["D"] = "父母被残害，被当作魔教的棋子抚养长大，却暗中掌\r握了高深武学，受到了教主的赏识",
        },
    },

	[4] = {
		question_type = 1,     --question_type:1代表单选，2代表多选
		question_desc = "如果你有机会学习一项独门秘技，你更想向谁学习何种技能？",
		answers = {			   --选项支持任意个数
			["A"] = "令狐冲的独孤九剑，有进无退，招招都是进攻",
			["B"] = "蓝凤凰驯养各种动物的能力",
			["C"] = "万里独行田伯光出众的轻功技巧",
			["D"] = "任我行的吸星大法，化别人内功为己用",
        },
    },

	[5] = {
		question_type = 1,     --question_type:1代表单选，2代表多选
		question_desc = "你更期待获得什么样的爱？",
		answers = {			   --选项支持任意个数
			["A"] = "任盈盈与令狐冲的个性契合、灵魂之交",
			["B"] = "仪琳对令狐冲的爱，默默守护，不求回报",
			["C"] = "阿朱与乔峰，由互相欣赏逐渐升华的爱",
			["D"] = "张无忌与赵敏，爱上与自己旗鼓相当的对手",
        },
    },

	[6] = {
		question_type = 1,     --question_type:1代表单选，2代表多选
		question_desc = "当你遭遇挚爱之人背叛时，你的反应会是？",
		answers = {			   --选项支持任意个数
			["A"] = "像段誉之母刀白凤一样，你背叛我，我也背叛你",
			["B"] = "像令狐冲，尽管遭遇小师妹背叛，仍为对方着想，\r自己倒也看得开",
			["C"] = "背叛就是不可饶恕的，也不相信什么浪子回头",
			["D"] = "看情况，不能一概而论",
        },
    },

}

FriendRecommendationConfig.CommonConfig = {
    ZhiYinTaskNpc = 74134,--NPC
    SayHi = "只是因为在人群中多看了你一眼。我人还不错，你愿意认识我一下吗？",--打招呼
    AutoRecommendTime = 10,         --单位:分钟
}

--以下为供客户端调用的接口
function FriendRecommendationConfig:GetQuestionType(index)
    if FriendRecommendationConfig.Question[index] then
        return FriendRecommendationConfig.Question[index].question_type
    else
        return 0
    end
end

function FriendRecommendationConfig:GetQuestionCount()
    if FriendRecommendationConfig.Question then
        return #(FriendRecommendationConfig.Question)
    else
        return 0
    end
end

function FriendRecommendationConfig:GetQuestionAndAnswers(index)
    if FriendRecommendationConfig.Question[index] then
        return FriendRecommendationConfig.Question[index].question_type, FriendRecommendationConfig.Question[index].question_desc, FriendRecommendationConfig.Question[index].answers
    else
        return 0
    end
end

function FriendRecommendationConfig:GetZhiYinTaskNpcTid()
    if FriendRecommendationConfig.CommonConfig then
        return FriendRecommendationConfig.CommonConfig.ZhiYinTaskNpc
    else
        return 0
    end
end

function FriendRecommendationConfig:GetSayHiContentString()
    if FriendRecommendationConfig.CommonConfig then
        return FriendRecommendationConfig.CommonConfig.SayHi
    else
        return 0
    end
end

function FriendRecommendationConfig:GetAutoRecommendTime()
    if FriendRecommendationConfig.CommonConfig then
        return FriendRecommendationConfig.CommonConfig.AutoRecommendTime
    else
        return 0
    end
end
