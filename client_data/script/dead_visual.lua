---------------------------------------------------------------
--  死亡表现脚本
--	Creator: Guo Jie, 2012.12.27
---------------------------------------------------------------

DeadVisual = {}

--总规则：分为特殊死亡、普通死亡
--	光效位，技能，att会引起特殊死亡

--特殊死亡有4种，每种对应一个Gfx
--	如果同一个攻击算出了多种特殊死亡，4＞2＞1＞3
--1：冰冻死亡	"程序联入\\模型状态\\冰冻死亡.gfx"
--2：燃烧死亡	"程序联入\\模型状态\\火焰死亡.gfx"
--3：中毒死亡	"程序联入\\模型状态\\绿毒死亡.gfx"
--4：必杀死亡	"程序联入\\模型状态\\必杀死亡.gfx"

-- 优先级排列表（优先级从低到高）
local SpecDeadPriorityTab =
{
	[3] = 1,
	[1] = 2,
	[2] = 3,
	[4] = 4,
}

DeadVisual.attList = {}
DeadVisual.attList[8202] = 2
DeadVisual.attList[8234] = 2
DeadVisual.attList[8266] = 2
DeadVisual.attList[8299] = 3
DeadVisual.attList[8306] = 1
DeadVisual.attList[8320] = 2
DeadVisual.attList[8336] = 3
DeadVisual.attList[8337] = 3
DeadVisual.attList[8340] = 3
DeadVisual.attList[8365] = 1
DeadVisual.attList[8366] = 3
DeadVisual.attList[8372] = 2
DeadVisual.attList[8375] = 2
DeadVisual.attList[8376] = 2
DeadVisual.attList[8387] = 3
DeadVisual.attList[8400] = 2
DeadVisual.attList[8414] = 2
DeadVisual.attList[8466] = 3
DeadVisual.attList[8472] = 1
DeadVisual.attList[8473] = 1
DeadVisual.attList[8478] = 2
DeadVisual.attList[11892] = 3
DeadVisual.attList[12246] = 2
DeadVisual.attList[12247] = 2
DeadVisual.attList[12249] = 2
DeadVisual.attList[12254] = 1
DeadVisual.attList[12256] = 3
DeadVisual.attList[12266] = 4
DeadVisual.attList[12271] = 3
DeadVisual.attList[12274] = 1
DeadVisual.attList[12280] = 3
DeadVisual.attList[12281] = 2
DeadVisual.attList[12282] = 3
DeadVisual.attList[12304] = 1
DeadVisual.attList[12305] = 1
DeadVisual.attList[12319] = 2
DeadVisual.attList[12320] = 2
DeadVisual.attList[12321] = 2
DeadVisual.attList[12322] = 2
DeadVisual.attList[12324] = 3
DeadVisual.attList[12325] = 3
DeadVisual.attList[12340] = 3
DeadVisual.attList[12457] = 2
DeadVisual.attList[12458] = 2
DeadVisual.attList[12459] = 2
DeadVisual.attList[12502] = 2
DeadVisual.attList[12515] = 2
DeadVisual.attList[12622] = 2
DeadVisual.attList[12630] = 2
DeadVisual.attList[12631] = 2
DeadVisual.attList[12632] = 2
DeadVisual.attList[12693] = 3
DeadVisual.attList[12694] = 2
DeadVisual.attList[12699] = 2
DeadVisual.attList[12700] = 2
DeadVisual.attList[12709] = 2
DeadVisual.attList[12871] = 2
DeadVisual.attList[12873] = 2
DeadVisual.attList[12875] = 2
DeadVisual.attList[12876] = 2
DeadVisual.attList[12877] = 2
DeadVisual.attList[12878] = 2
DeadVisual.attList[12880] = 1
DeadVisual.attList[12923] = 2
DeadVisual.attList[12924] = 1
DeadVisual.attList[13083] = 3
DeadVisual.attList[13265] = 2
DeadVisual.attList[13282] = 2
DeadVisual.attList[13283] = 2
DeadVisual.attList[13297] = 2
DeadVisual.attList[13345] = 2
DeadVisual.attList[13354] = 2
DeadVisual.attList[13356] = 3
DeadVisual.attList[13357] = 2
DeadVisual.attList[13360] = 3
DeadVisual.attList[13361] = 2
DeadVisual.attList[13367] = 2
DeadVisual.attList[13370] = 1
DeadVisual.attList[13373] = 1
DeadVisual.attList[13395] = 1
DeadVisual.attList[13396] = 1
DeadVisual.attList[13397] = 2
DeadVisual.attList[13402] = 3
DeadVisual.attList[13418] = 3
DeadVisual.attList[13433] = 2
DeadVisual.attList[13457] = 2
DeadVisual.attList[13466] = 2
DeadVisual.attList[13472] = 3
DeadVisual.attList[13551] = 2
DeadVisual.attList[13552] = 2
DeadVisual.attList[13586] = 1
DeadVisual.attList[13618] = 2
DeadVisual.attList[13619] = 1
DeadVisual.attList[13946] = 4
DeadVisual.attList[13947] = 3
DeadVisual.attList[13950] = 3
DeadVisual.attList[14053] = 4
DeadVisual.attList[14060] = 4
DeadVisual.attList[14066] = 4
DeadVisual.attList[14077] = 4
DeadVisual.attList[14085] = 4
DeadVisual.attList[14088] = 4
DeadVisual.attList[14098] = 4
DeadVisual.attList[14102] = 4
DeadVisual.attList[14107] = 4
DeadVisual.attList[14225] = 1
DeadVisual.attList[14230] = 3
DeadVisual.attList[14231] = 4
DeadVisual.attList[14232] = 3
DeadVisual.attList[14278] = 1
DeadVisual.attList[14280] = 2
DeadVisual.attList[14305] = 3
DeadVisual.attList[14360] = 3
DeadVisual.attList[14363] = 3
DeadVisual.attList[14364] = 3
DeadVisual.attList[14365] = 2
DeadVisual.attList[14475] = 3
DeadVisual.attList[14487] = 2
DeadVisual.attList[14497] = 2
DeadVisual.attList[14500] = 3
DeadVisual.attList[14501] = 3
DeadVisual.attList[14578] = 2
DeadVisual.attList[14625] = 2
DeadVisual.attList[14631] = 1
DeadVisual.attList[14641] = 2
DeadVisual.attList[14642] = 2
DeadVisual.attList[14663] = 2
DeadVisual.attList[14664] = 2
DeadVisual.attList[14665] = 3
DeadVisual.attList[14668] = 4
DeadVisual.attList[14669] = 4
DeadVisual.attList[14670] = 4
DeadVisual.attList[14674] = 3
DeadVisual.attList[14676] = 3
DeadVisual.attList[14678] = 2
DeadVisual.attList[14709] = 3
DeadVisual.attList[14799] = 1
DeadVisual.attList[14825] = 3
DeadVisual.attList[14848] = 1
DeadVisual.attList[14853] = 3
DeadVisual.attList[14855] = 3
DeadVisual.attList[14856] = 3
DeadVisual.attList[14880] = 1
DeadVisual.attList[14881] = 1
DeadVisual.attList[14904] = 2
DeadVisual.attList[14905] = 2
DeadVisual.attList[14945] = 3
DeadVisual.attList[14946] = 2
DeadVisual.attList[14981] = 1
DeadVisual.attList[14989] = 4
DeadVisual.attList[15014] = 4
DeadVisual.attList[15020] = 4
DeadVisual.attList[15026] = 4
DeadVisual.attList[15031] = 4
DeadVisual.attList[15037] = 4

DeadVisual.skillList = {}
DeadVisual.skillList[6023] = 2
DeadVisual.skillList[5960] = 2
DeadVisual.skillList[4407] = 2
DeadVisual.skillList[4424] = 2
DeadVisual.skillList[1152] = 1
DeadVisual.skillList[4684] = 2
DeadVisual.skillList[8586] = 2
DeadVisual.skillList[2928] = 2
DeadVisual.skillList[4565] = 1
DeadVisual.skillList[4691] = 1
DeadVisual.skillList[4568] = 3
DeadVisual.skillList[2989] = 2
DeadVisual.skillList[2988] = 2
DeadVisual.skillList[2936] = 2
DeadVisual.skillList[8576] = 2
DeadVisual.skillList[4906] = 2
DeadVisual.skillList[1086] = 3
DeadVisual.skillList[4761] = 1
DeadVisual.skillList[4759] = 2
DeadVisual.skillList[4760] = 2
DeadVisual.skillList[4753] = 3
DeadVisual.skillList[8570] = 3
DeadVisual.skillList[4783] = 2
DeadVisual.skillList[2242] = 2
DeadVisual.skillList[8460] = 2
DeadVisual.skillList[875] = 2
DeadVisual.skillList[8456] = 1
DeadVisual.skillList[2245] = 1
DeadVisual.skillList[4782] = 1
DeadVisual.skillList[2244] = 1
DeadVisual.skillList[2246] = 1
DeadVisual.skillList[2248] = 1
DeadVisual.skillList[4592] = 3
DeadVisual.skillList[2622] = 2
DeadVisual.skillList[926] = 2
DeadVisual.skillList[2627] = 2
DeadVisual.skillList[4597] = 2
DeadVisual.skillList[4600] = 2
DeadVisual.skillList[5919] = 2
DeadVisual.skillList[3041] = 2
DeadVisual.skillList[8358] = 2
DeadVisual.skillList[8571] = 2
DeadVisual.skillList[4671] = 2
DeadVisual.skillList[6104] = 4
DeadVisual.skillList[6105] = 4
DeadVisual.skillList[6106] = 4
DeadVisual.skillList[6107] = 4
DeadVisual.skillList[6108] = 4
DeadVisual.skillList[6109] = 4
DeadVisual.skillList[6110] = 4
DeadVisual.skillList[6111] = 4
DeadVisual.skillList[6112] = 4
DeadVisual.skillList[6113] = 4
DeadVisual.skillList[8950] = 1
DeadVisual.skillList[8955] = 1
DeadVisual.skillList[8956] = 3
DeadVisual.skillList[8961] = 2
DeadVisual.skillList[8962] = 2
DeadVisual.skillList[8963] = 2
DeadVisual.skillList[8964] = 4
DeadVisual.skillList[8965] = 4
DeadVisual.skillList[8966] = 4
DeadVisual.skillList[8967] = 4
DeadVisual.skillList[8968] = 4
DeadVisual.skillList[9108] = 4

DeadVisual.ExtGfxList = {}
DeadVisual.skillList[6023] = 2
DeadVisual.skillList[5960] = 2
DeadVisual.skillList[4407] = 2
DeadVisual.skillList[4424] = 2
DeadVisual.skillList[1152] = 1
DeadVisual.skillList[4684] = 2
DeadVisual.skillList[8586] = 2
DeadVisual.skillList[2928] = 2
DeadVisual.skillList[4565] = 1
DeadVisual.skillList[4691] = 1
DeadVisual.skillList[4568] = 3
DeadVisual.skillList[2989] = 2
DeadVisual.skillList[2988] = 2
DeadVisual.skillList[2936] = 2
DeadVisual.skillList[8576] = 2
DeadVisual.skillList[4906] = 2
DeadVisual.skillList[1086] = 3
DeadVisual.skillList[4761] = 1
DeadVisual.skillList[4759] = 2
DeadVisual.skillList[4760] = 2
DeadVisual.skillList[4753] = 3
DeadVisual.skillList[8570] = 3
DeadVisual.skillList[4783] = 2
DeadVisual.skillList[2242] = 2
DeadVisual.skillList[8460] = 2
DeadVisual.skillList[875] = 2
DeadVisual.skillList[8456] = 1
DeadVisual.skillList[2245] = 1
DeadVisual.skillList[4782] = 1
DeadVisual.skillList[2244] = 1
DeadVisual.skillList[2246] = 1
DeadVisual.skillList[2248] = 1
DeadVisual.skillList[4592] = 3
DeadVisual.skillList[2622] = 2
DeadVisual.skillList[926] = 2
DeadVisual.skillList[2627] = 2
DeadVisual.skillList[4597] = 2
DeadVisual.skillList[4600] = 2
DeadVisual.skillList[5919] = 2
DeadVisual.skillList[3041] = 2
DeadVisual.skillList[8358] = 2
DeadVisual.skillList[8571] = 2
DeadVisual.skillList[4671] = 2
DeadVisual.skillList[6104] = 4
DeadVisual.skillList[6105] = 4
DeadVisual.skillList[6106] = 4
DeadVisual.skillList[6107] = 4
DeadVisual.skillList[6108] = 4
DeadVisual.skillList[6109] = 4
DeadVisual.skillList[6110] = 4
DeadVisual.skillList[6111] = 4
DeadVisual.skillList[6112] = 4
DeadVisual.skillList[6113] = 4
DeadVisual.skillList[8950] = 1
DeadVisual.skillList[8955] = 1
DeadVisual.skillList[8956] = 3
DeadVisual.skillList[8961] = 2
DeadVisual.skillList[8962] = 2
DeadVisual.skillList[8963] = 2
DeadVisual.skillList[8964] = 4
DeadVisual.skillList[8965] = 4
DeadVisual.skillList[8966] = 4
DeadVisual.skillList[8967] = 4
DeadVisual.skillList[8968] = 4
DeadVisual.skillList[9108] = 4
DeadVisual.skillList[10300] = 2
DeadVisual.skillList[10301] = 2
DeadVisual.skillList[10297] = 2
DeadVisual.skillList[10296] = 2
DeadVisual.skillList[10303] = 2

DeadVisual.ModelPathList = {}
DeadVisual.ModelPathList[18141] = {false, false, false, false}
DeadVisual.ModelPathList[3625] = {false, false, false, false}
DeadVisual.ModelPathList[3658] = {false, false, false, false}
DeadVisual.ModelPathList[3678] = {false, false, false, false}
DeadVisual.ModelPathList[4638] = {false, false, false, false}
DeadVisual.ModelPathList[463] = {false, false, false, false}
DeadVisual.ModelPathList[4640] = {false, false, false, false}
DeadVisual.ModelPathList[4641] = {false, false, false, false}




-- ExtGfxTable: NPC死亡时身上光效位为1的位置列表
-- idSkill: 打死NPC的技能
-- idAtt: 打死NPC的Att
function DeadVisual:GetDeadEffctVal(ExtGfxTable, idSkill, idAtt, modelPath)

	--local str = string.format("DeadVisual: Skill %d, Att %d\n", idSkill, idAtt)
	--LogPrint(str)

	local DeadVal_ExtGfx = 0
	local maxPrioExtGfx = 0
	for i = 1, #ExtGfxTable do
		local extPos = ExtGfxTable[i]
		local deadVal = DeadVisual.ExtGfxList[extPos]
		if deadVal and SpecDeadPriorityTab[deadVal] and SpecDeadPriorityTab[deadVal] > maxPrioExtGfx then
			DeadVal_ExtGfx = deadVal
			maxPrioExtGfx = SpecDeadPriorityTab[deadVal]
			if modelPath and DeadVisual.ModelPathList[modelPath] then
				if not DeadVisual.ModelPathList[modelPath][deadVal] then
					DeadVal_ExtGfx = 0
				end
			end
			--str = string.format("DeadVisual: ExtStatePos %d has DeadVal %d\n", extPos, deadVal)
			--LogPrint(str)
		end
	end

	local DeadVal_Skill = 0
	local PrioSkill = 0
	if idSkill and DeadVisual.skillList[idSkill] then
		local deadVal = DeadVisual.skillList[idSkill]
		if SpecDeadPriorityTab[deadVal] then
			DeadVal_Skill = deadVal
			PrioSkill = SpecDeadPriorityTab[deadVal]
			if modelPath and DeadVisual.ModelPathList[modelPath] then
				if not DeadVisual.ModelPathList[modelPath][deadVal] then
					DeadVal_Skill = 0
				end
			end
			--str = string.format("DeadVisual: Skill %d has DeadVal %d\n", idSkill, deadVal)
			--LogPrint(str)
		end
	end

	local DeadVal_Att = 0
	local PrioAtt = 0
	if idAtt and DeadVisual.attList[idAtt] then
		local deadVal = DeadVisual.attList[idAtt]
		if SpecDeadPriorityTab[deadVal] then
			DeadVal_Att = deadVal
			PrioAtt = SpecDeadPriorityTab[deadVal]
			if modelPath and DeadVisual.ModelPathList[modelPath] then
				if not DeadVisual.ModelPathList[modelPath][deadVal] then
					DeadVal_Att = 0
				end
			end
			--str = string.format("DeadVisual: Att %d has DeadVal %d\n", idAtt, deadVal)
			--LogPrint(str)
		end
	end

	--允许返回三种DeadVal_Gfx（同时播）
	--如果觉得哪几种同时播不好看，把相应的DeadVal_xxx设为0
	return DeadVal_ExtGfx, DeadVal_Skill, DeadVal_Att

end
