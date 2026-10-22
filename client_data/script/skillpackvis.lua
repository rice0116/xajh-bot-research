--新提供接口GameApi.BubbleSkillText(str)
SkillPackVis = {}

--idObj表示玩家或者NPC的ID
function SkillPackVis:OnPlaySkillPackage(idObj,idPackage,idSkill,idOrder)
	local sMsg = ""	
	if idPackage > 0 then
		if idOrder == 0 then
			local skillpackdetail = GameApi.GetSkillPack(idPackage)
			sMsg = skillpackdetail["name"]
		end
	else 
	local skilldetail = GameApi.GetSkillEssence(idSkill,1)
	sMsg = skilldetail["display_name"]
	end
	GameApi.BubbleSkillText(idObj,sMsg)
end

