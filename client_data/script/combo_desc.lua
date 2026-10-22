--[[#tag push auto]]
--  所有快捷动作内容的生成函数

-- require "desc_text"
-- require "desc_utility"

--增加一个LUA脚本函数SkillTip:GetTalentDescrib(TalentID, HitCount)，用于客户端显示当前连击下的心法效果。

--其中参数TalentID是当前使用的心法模板ID，HitCount是当前的连击数，这个函数的返回值将会是一个字符串，里面是当前心法效果的文字描述，按照连击面板的指定字体、颜色格式来显示。


--require "skill_text"
--SkillTip = {}

strIncrease = --[[!AUTO_1]]"增加"

function SkillTip:GetTalentDescrib(idTalent, cntHit)
	if idTalent == 2 then
		if TalentDesc[idTalent][cntHit] ~= --[[!AUTO_2]]"" then
			return string.format(--[[!AUTO_3]]"%s%s%s",COMBO_DAMAGE_TEXT,strIncrease,TalentDesc[idTalent][cntHit])
		end
	end
end

TalentDesc =
{
	--key为心法ID，依次按HIT数描述效果

	[2] =
	{
	[1] = --[[!AUTO_4]]"",
	[2] = --[[!AUTO_5]]"",
	[3] = --[[!AUTO_6]]"",
	[4] = --[[!AUTO_7]]" 兩倍",
	[5] = --[[!AUTO_8]]"",
	[6] = --[[!AUTO_9]]"",
	[7] = --[[!AUTO_10]]" 三倍",
	[8] = --[[!AUTO_11]]"",
	[9] = --[[!AUTO_12]]"",
	[10] = --[[!AUTO_13]]" 四倍",
	},
}


