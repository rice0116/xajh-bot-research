--	交互相关配置脚本
--  created:   2011.7.28

SocialDesc = {}

function SocialDesc:GetMasterLvUpBenefit(master_level)
	local MasterLvUpBenefit = ""
		if master_level == 1 then
			MasterLvUpBenefit =  "提示：提升为2级宗师，可以同时收3个徒弟，对徒弟的鼓励效果也会增强。"
		elseif master_level == 2 then
			MasterLvUpBenefit =  "提示：提升为3级宗师，可以同时收4个徒弟，对徒弟的鼓励效果也会增强。"
		elseif master_level == 3 then
			MasterLvUpBenefit =  "提示：提升为4级宗师，可以同时收5个徒弟，对徒弟的鼓励效果也会增强。"
		elseif master_level == 4 then
			MasterLvUpBenefit =  "提示：提升为5级宗师，可以同时收6个徒弟，对徒弟的鼓励效果也会增强。"
		else
			MasterLvUpBenefit = "提示：你的宗师等级已满，不需要再提升。"
		end
			
	return MasterLvUpBenefit

end
