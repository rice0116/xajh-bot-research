--[[#tag push auto]]

--[[ 宠物技能列表和宠物放技能接口说明 GameApi
GetPetFightSkill:   参数为: 宠物索引，默认为0，返回宠物战斗技能表skill_tbl,
                    访问方式 skill_tbl[1]["id"] 和 skill_tbl[1]["level"]，skill_tbl[1]["index"],skill_tbl[1]["name"]
					"index"表示在宠物固定12个技能列表中的顺序,从0开始.
GetPetLifeSkill:    参数为: 宠物索引，默认为0，返回宠物生活技能表skill_tbl,访问方式 skill_tbl[1]，即为1号技能的ID
GetPetBornSkill:    参数为: 宠物索引，默认为0，返回宠物出生技能 id,level,name 出生技能只有一个
PetCastSkill:       参数为: 技能ID，宠物索引，宠物索引默认为0
HostCanCastSkill:   参数为: 技能ID,目标的世界id
PetCanCastSkill:    参数为: 宠物索引,技能ID,目标的世界id
PlayerHasBuffState: 参数为: 玩家世界id(0表示自己),buff 的ID
NpcHasBuffState:    参数为: NPC的世界ID，buff 的ID
GetAroundMonterNum: 参数为: 玩家周围半径(m),获得玩家周围的怪物数目
GetNpcBasicProp:	参数为: npc的世界ID,返回一个属性表，键值为name,level,hp,maxhp
GetPlayerBasicProp	参数为: 玩家ID,返回一个属性表，键值为name,level,hp,maxhp
GetSelectedTarget:  获取当前玩家的选择目标
GetPetSelectedTarget:  获取当前宠物跟随玩家的选择目标
GetPetShortcutSkill：返回宠物技能快捷栏技能状态
--]]

PetAI = {}

PETAI_FIGHT_SKILL_LIST = {}

--宠物技能事件
PetEvent =
{
	LBTN_SKILL			= 1,	--对于参数表键值:skill_id
	RBTN_SKILL			= 2,	--对于参数表键值:skill_id
	MONSTER_CASTSKILL	= 3,	--对于参数表键值:npc_ruid,skill_id,target_host(技能使用对象是否为主人/宠物)
	MONSTER_KILLED		= 4,	--对于参数表键值:npc_ruid
	MONSTER_FLEE		= 5,	--对于参数表键值:npc_ruid
}
--技能分类
PetSkillType =
{
	NORMAL = 0,--服务器普攻
	CLIENT = 1,--客户端技能
	SPECIAL= 2,--特殊逻辑
}

--技能生效方式
PetSkillCastType =
{
	NONE = 0,--不生效
	AUTO = 1,--自动
	MANUAL = 2,--手动
	PASSIVE = 3,--被动
}
--技能生效类型
PetSkillCond =
{
	NONE = 0,--无
	BUFF = 1,--主人增益状态
	DEBUFF = 2,--目标负面状态
	MP_CURE = 3,--主人内力值
	HP_CURE = 4,--主人生命值
	DISPEL = 5,--主人负面状态
	SILENCE = 6,--目标施法
	REVIVE = 7,--主人死亡
	CONTROL = 8,--怪物逃跑时
	SEARCH = 9,--怪物死亡时
}

PetAI.SkillCfg =
{
--Type：	技能分类
--CastType：技能生效方式
--CondType：技能判断条件
--Var：		技能判断条件参数
--Order：	技能施放优先级
--宠物技能类型及施放顺序配置开始
	[1160] = { Type = PetSkillType.CLIENT, CastType = PetSkillCastType.MANUAL, CondType = PetSkillCond.NONE, Var = {}, Order = 0 },
	[1162] = { Type = PetSkillType.CLIENT, CastType = PetSkillCastType.MANUAL, CondType = PetSkillCond.NONE, Var = {}, Order = 0 },
	[1164] = { Type = PetSkillType.CLIENT, CastType = PetSkillCastType.MANUAL, CondType = PetSkillCond.NONE, Var = {}, Order = 0 },
	[1166] = { Type = PetSkillType.CLIENT, CastType = PetSkillCastType.MANUAL, CondType = PetSkillCond.NONE, Var = {}, Order = 0 },
	[1168] = { Type = PetSkillType.CLIENT, CastType = PetSkillCastType.MANUAL, CondType = PetSkillCond.NONE, Var = {}, Order = 0 },
	[1170] = { Type = PetSkillType.CLIENT, CastType = PetSkillCastType.MANUAL, CondType = PetSkillCond.NONE, Var = {}, Order = 0 },
	[1172] = { Type = PetSkillType.SPECIAL, CastType = PetSkillCastType.MANUAL, CondType = PetSkillCond.REVIVE, Var = {}, Order = 0 },
	[1174] = { Type = PetSkillType.SPECIAL, CastType = PetSkillCastType.MANUAL, CondType = PetSkillCond.REVIVE, Var = {}, Order = 0 },
	[1176] = { Type = PetSkillType.CLIENT, CastType = PetSkillCastType.MANUAL, CondType = PetSkillCond.NONE, Var = {}, Order = 0 },
	[1178] = { Type = PetSkillType.CLIENT, CastType = PetSkillCastType.MANUAL, CondType = PetSkillCond.NONE, Var = {}, Order = 0 },
	[1180] = { Type = PetSkillType.CLIENT, CastType = PetSkillCastType.MANUAL, CondType = PetSkillCond.NONE, Var = {}, Order = 0 },
	[1182] = { Type = PetSkillType.CLIENT, CastType = PetSkillCastType.MANUAL, CondType = PetSkillCond.NONE, Var = {}, Order = 0 },
	[1184] = { Type = PetSkillType.CLIENT, CastType = PetSkillCastType.MANUAL, CondType = PetSkillCond.MP_CURE, Var = {.3}, Order = 0 },
	[1186] = { Type = PetSkillType.CLIENT, CastType = PetSkillCastType.MANUAL, CondType = PetSkillCond.HP_CURE, Var = {.8}, Order = 0 },
	[1188] = { Type = PetSkillType.CLIENT, CastType = PetSkillCastType.MANUAL, CondType = PetSkillCond.DEBUFF, Var = {188}, Order = 0 },
	[1190] = { Type = PetSkillType.CLIENT, CastType = PetSkillCastType.MANUAL, CondType = PetSkillCond.DEBUFF, Var = {186}, Order = 0 },
	[1192] = { Type = PetSkillType.CLIENT, CastType = PetSkillCastType.MANUAL, CondType = PetSkillCond.NONE, Var = {}, Order = 0 },
	[1194] = { Type = PetSkillType.CLIENT, CastType = PetSkillCastType.MANUAL, CondType = PetSkillCond.NONE, Var = {}, Order = 0 },
	[1196] = { Type = PetSkillType.CLIENT, CastType = PetSkillCastType.MANUAL, CondType = PetSkillCond.NONE, Var = {}, Order = 0 },
	[1198] = { Type = PetSkillType.CLIENT, CastType = PetSkillCastType.MANUAL, CondType = PetSkillCond.DISPEL, Var = {}, Order = 0 },
	[1200] = { Type = PetSkillType.CLIENT, CastType = PetSkillCastType.MANUAL, CondType = PetSkillCond.MP_CURE, Var = {.3}, Order = 0 },
	[1202] = { Type = PetSkillType.CLIENT, CastType = PetSkillCastType.MANUAL, CondType = PetSkillCond.HP_CURE, Var = {.8}, Order = 0 },
	[1204] = { Type = PetSkillType.CLIENT, CastType = PetSkillCastType.MANUAL, CondType = PetSkillCond.NONE, Var = {}, Order = 0 },
	[1206] = { Type = PetSkillType.CLIENT, CastType = PetSkillCastType.MANUAL, CondType = PetSkillCond.REVIVE, Var = {}, Order = 0 },
	[1208] = { Type = PetSkillType.CLIENT, CastType = PetSkillCastType.MANUAL, CondType = PetSkillCond.NONE, Var = {}, Order = 0 },
	[1210] = { Type = PetSkillType.CLIENT, CastType = PetSkillCastType.MANUAL, CondType = PetSkillCond.NONE, Var = {}, Order = 0 },
	[1212] = { Type = PetSkillType.CLIENT, CastType = PetSkillCastType.MANUAL, CondType = PetSkillCond.NONE, Var = {}, Order = 0 },
	[1214] = { Type = PetSkillType.CLIENT, CastType = PetSkillCastType.MANUAL, CondType = PetSkillCond.NONE, Var = {}, Order = 0 },
	[1216] = { Type = PetSkillType.CLIENT, CastType = PetSkillCastType.MANUAL, CondType = PetSkillCond.NONE, Var = {}, Order = 0 },
	[1218] = { Type = PetSkillType.CLIENT, CastType = PetSkillCastType.MANUAL, CondType = PetSkillCond.NONE, Var = {}, Order = 0 },
	[1220] = { Type = PetSkillType.CLIENT, CastType = PetSkillCastType.MANUAL, CondType = PetSkillCond.NONE, Var = {}, Order = 0 },
	[1222] = { Type = PetSkillType.CLIENT, CastType = PetSkillCastType.MANUAL, CondType = PetSkillCond.NONE, Var = {}, Order = 0 },
	[1224] = { Type = PetSkillType.CLIENT, CastType = PetSkillCastType.MANUAL, CondType = PetSkillCond.NONE, Var = {}, Order = 0 },
	[1226] = { Type = PetSkillType.CLIENT, CastType = PetSkillCastType.MANUAL, CondType = PetSkillCond.NONE, Var = {}, Order = 0 },
	[1228] = { Type = PetSkillType.CLIENT, CastType = PetSkillCastType.MANUAL, CondType = PetSkillCond.NONE, Var = {}, Order = 0 },
	[1230] = { Type = PetSkillType.CLIENT, CastType = PetSkillCastType.MANUAL, CondType = PetSkillCond.NONE, Var = {}, Order = 0 },
	[1232] = { Type = PetSkillType.CLIENT, CastType = PetSkillCastType.MANUAL, CondType = PetSkillCond.NONE, Var = {}, Order = 0 },
	[1234] = { Type = PetSkillType.CLIENT, CastType = PetSkillCastType.MANUAL, CondType = PetSkillCond.NONE, Var = {}, Order = 0 },
	[1236] = { Type = PetSkillType.CLIENT, CastType = PetSkillCastType.MANUAL, CondType = PetSkillCond.NONE, Var = {}, Order = 0 },
	[1238] = { Type = PetSkillType.CLIENT, CastType = PetSkillCastType.MANUAL, CondType = PetSkillCond.NONE, Var = {}, Order = 0 },
	[1240] = { Type = PetSkillType.CLIENT, CastType = PetSkillCastType.MANUAL, CondType = PetSkillCond.NONE, Var = {}, Order = 0 },
	[1242] = { Type = PetSkillType.CLIENT, CastType = PetSkillCastType.MANUAL, CondType = PetSkillCond.NONE, Var = {}, Order = 0 },
	[1244] = { Type = PetSkillType.CLIENT, CastType = PetSkillCastType.MANUAL, CondType = PetSkillCond.NONE, Var = {}, Order = 0 },
	[1246] = { Type = PetSkillType.CLIENT, CastType = PetSkillCastType.MANUAL, CondType = PetSkillCond.NONE, Var = {}, Order = 0 },
	[1248] = { Type = PetSkillType.CLIENT, CastType = PetSkillCastType.MANUAL, CondType = PetSkillCond.NONE, Var = {}, Order = 0 },
	[1250] = { Type = PetSkillType.CLIENT, CastType = PetSkillCastType.MANUAL, CondType = PetSkillCond.NONE, Var = {}, Order = 0 },
	[1252] = { Type = PetSkillType.CLIENT, CastType = PetSkillCastType.MANUAL, CondType = PetSkillCond.NONE, Var = {}, Order = 0 },
	[1254] = { Type = PetSkillType.CLIENT, CastType = PetSkillCastType.MANUAL, CondType = PetSkillCond.NONE, Var = {}, Order = 0 },
	[2512] = { Type = PetSkillType.CLIENT, CastType = PetSkillCastType.MANUAL, CondType = PetSkillCond.NONE, Var = {}, Order = 0 },
	[2513] = { Type = PetSkillType.CLIENT, CastType = PetSkillCastType.MANUAL, CondType = PetSkillCond.NONE, Var = {}, Order = 0 },
	[2514] = { Type = PetSkillType.CLIENT, CastType = PetSkillCastType.MANUAL, CondType = PetSkillCond.NONE, Var = {}, Order = 0 },
	[2515] = { Type = PetSkillType.CLIENT, CastType = PetSkillCastType.MANUAL, CondType = PetSkillCond.NONE, Var = {}, Order = 0 },
	[2516] = { Type = PetSkillType.CLIENT, CastType = PetSkillCastType.MANUAL, CondType = PetSkillCond.NONE, Var = {}, Order = 0 },
	[2517] = { Type = PetSkillType.CLIENT, CastType = PetSkillCastType.MANUAL, CondType = PetSkillCond.NONE, Var = {}, Order = 0 },
	[1256] = { Type = PetSkillType.CLIENT, CastType = PetSkillCastType.AUTO, CondType = PetSkillCond.NONE, Var = {}, Order = 0 },
	[1257] = { Type = PetSkillType.CLIENT, CastType = PetSkillCastType.AUTO, CondType = PetSkillCond.NONE, Var = {}, Order = 0 },
	[1258] = { Type = PetSkillType.CLIENT, CastType = PetSkillCastType.AUTO, CondType = PetSkillCond.NONE, Var = {}, Order = 0 },
	[1259] = { Type = PetSkillType.CLIENT, CastType = PetSkillCastType.AUTO, CondType = PetSkillCond.NONE, Var = {}, Order = 0 },
	[1260] = { Type = PetSkillType.CLIENT, CastType = PetSkillCastType.AUTO, CondType = PetSkillCond.NONE, Var = {}, Order = 0 },
	[1261] = { Type = PetSkillType.CLIENT, CastType = PetSkillCastType.AUTO, CondType = PetSkillCond.NONE, Var = {}, Order = 0 },
	[1262] = { Type = PetSkillType.CLIENT, CastType = PetSkillCastType.AUTO, CondType = PetSkillCond.NONE, Var = {}, Order = 0 },
	[1263] = { Type = PetSkillType.CLIENT, CastType = PetSkillCastType.AUTO, CondType = PetSkillCond.NONE, Var = {}, Order = 0 },
	[1264] = { Type = PetSkillType.CLIENT, CastType = PetSkillCastType.AUTO, CondType = PetSkillCond.NONE, Var = {}, Order = 0 },
	[1265] = { Type = PetSkillType.CLIENT, CastType = PetSkillCastType.AUTO, CondType = PetSkillCond.NONE, Var = {}, Order = 0 },
	[1266] = { Type = PetSkillType.CLIENT, CastType = PetSkillCastType.AUTO, CondType = PetSkillCond.NONE, Var = {}, Order = 0 },
	[1267] = { Type = PetSkillType.CLIENT, CastType = PetSkillCastType.AUTO, CondType = PetSkillCond.NONE, Var = {}, Order = 0 },
	[1268] = { Type = PetSkillType.CLIENT, CastType = PetSkillCastType.AUTO, CondType = PetSkillCond.NONE, Var = {}, Order = 0 },
	[1269] = { Type = PetSkillType.CLIENT, CastType = PetSkillCastType.AUTO, CondType = PetSkillCond.NONE, Var = {}, Order = 0 },
	[1350] = { Type = PetSkillType.CLIENT, CastType = PetSkillCastType.MANUAL, CondType = PetSkillCond.NONE, Var = {}, Order = 0 },
	[1351] = { Type = PetSkillType.CLIENT, CastType = PetSkillCastType.MANUAL, CondType = PetSkillCond.NONE, Var = {}, Order = 0 },
	[2518] = { Type = PetSkillType.CLIENT, CastType = PetSkillCastType.MANUAL, CondType = PetSkillCond.NONE, Var = {}, Order = 0 },
	[2519] = { Type = PetSkillType.CLIENT, CastType = PetSkillCastType.MANUAL, CondType = PetSkillCond.NONE, Var = {}, Order = 0 },
	[2520] = { Type = PetSkillType.CLIENT, CastType = PetSkillCastType.MANUAL, CondType = PetSkillCond.NONE, Var = {}, Order = 0 },
	[2521] = { Type = PetSkillType.CLIENT, CastType = PetSkillCastType.MANUAL, CondType = PetSkillCond.NONE, Var = {}, Order = 0 },
	[1270] = { Type = PetSkillType.CLIENT, CastType = PetSkillCastType.AUTO, CondType = PetSkillCond.HP_CURE, Var = {1}, Order = 0 },
	[1271] = { Type = PetSkillType.CLIENT, CastType = PetSkillCastType.AUTO, CondType = PetSkillCond.HP_CURE, Var = {1}, Order = 0 },
	[1272] = { Type = PetSkillType.SPECIAL, CastType = PetSkillCastType.AUTO, CondType = PetSkillCond.MP_CURE, Var = {1}, Order = 0 },
	[1273] = { Type = PetSkillType.CLIENT, CastType = PetSkillCastType.AUTO, CondType = PetSkillCond.MP_CURE, Var = {1}, Order = 0 },
	[1274] = { Type = PetSkillType.CLIENT, CastType = PetSkillCastType.AUTO, CondType = PetSkillCond.BUFF, Var = {211}, Order = 0 },
	[1275] = { Type = PetSkillType.CLIENT, CastType = PetSkillCastType.AUTO, CondType = PetSkillCond.BUFF, Var = {213}, Order = 0 },
	[1276] = { Type = PetSkillType.CLIENT, CastType = PetSkillCastType.AUTO, CondType = PetSkillCond.BUFF, Var = {215}, Order = 0 },
	[1277] = { Type = PetSkillType.CLIENT, CastType = PetSkillCastType.AUTO, CondType = PetSkillCond.BUFF, Var = {217}, Order = 0 },
	[1278] = { Type = PetSkillType.CLIENT, CastType = PetSkillCastType.AUTO, CondType = PetSkillCond.BUFF, Var = {219}, Order = 0 },
	[1279] = { Type = PetSkillType.CLIENT, CastType = PetSkillCastType.AUTO, CondType = PetSkillCond.BUFF, Var = {196}, Order = 0 },
	[1280] = { Type = PetSkillType.CLIENT, CastType = PetSkillCastType.AUTO, CondType = PetSkillCond.BUFF, Var = {185}, Order = 0 },
	[1281] = { Type = PetSkillType.CLIENT, CastType = PetSkillCastType.AUTO, CondType = PetSkillCond.BUFF, Var = {187}, Order = 0 },
	[1282] = { Type = PetSkillType.CLIENT, CastType = PetSkillCastType.AUTO, CondType = PetSkillCond.BUFF, Var = {189}, Order = 0 },
	[1283] = { Type = PetSkillType.CLIENT, CastType = PetSkillCastType.AUTO, CondType = PetSkillCond.BUFF, Var = {191}, Order = 0 },
	[1304] = { Type = PetSkillType.CLIENT, CastType = PetSkillCastType.AUTO, CondType = PetSkillCond.CONTROL, Var = {}, Order = 0 },
	[1305] = { Type = PetSkillType.CLIENT, CastType = PetSkillCastType.AUTO, CondType = PetSkillCond.CONTROL, Var = {}, Order = 0 },
	[1306] = { Type = PetSkillType.CLIENT, CastType = PetSkillCastType.AUTO, CondType = PetSkillCond.CONTROL, Var = {}, Order = 0 },
	[1307] = { Type = PetSkillType.CLIENT, CastType = PetSkillCastType.AUTO, CondType = PetSkillCond.SEARCH, Var = {}, Order = 0 },
	[1314] = { Type = PetSkillType.CLIENT, CastType = PetSkillCastType.AUTO, CondType = PetSkillCond.DEBUFF, Var = {186}, Order = 0 },
	[1315] = { Type = PetSkillType.CLIENT, CastType = PetSkillCastType.MANUAL, CondType = PetSkillCond.NONE, Var = {0}, Order = 0 },
	[1316] = { Type = PetSkillType.CLIENT, CastType = PetSkillCastType.AUTO, CondType = PetSkillCond.DEBUFF, Var = {188}, Order = 0 },
	[1317] = { Type = PetSkillType.CLIENT, CastType = PetSkillCastType.MANUAL, CondType = PetSkillCond.NONE, Var = {0}, Order = 0 },
	[1318] = { Type = PetSkillType.CLIENT, CastType = PetSkillCastType.AUTO, CondType = PetSkillCond.DEBUFF, Var = {190}, Order = 0 },
	[1319] = { Type = PetSkillType.CLIENT, CastType = PetSkillCastType.MANUAL, CondType = PetSkillCond.NONE, Var = {0}, Order = 0 },
	[1320] = { Type = PetSkillType.CLIENT, CastType = PetSkillCastType.AUTO, CondType = PetSkillCond.DEBUFF, Var = {192}, Order = 0 },
	[1321] = { Type = PetSkillType.CLIENT, CastType = PetSkillCastType.MANUAL, CondType = PetSkillCond.NONE, Var = {0}, Order = 0 },
	[1322] = { Type = PetSkillType.CLIENT, CastType = PetSkillCastType.AUTO, CondType = PetSkillCond.DEBUFF, Var = {194}, Order = 0 },
	[1323] = { Type = PetSkillType.CLIENT, CastType = PetSkillCastType.AUTO, CondType = PetSkillCond.DEBUFF, Var = {203}, Order = 0 },
	[1324] = { Type = PetSkillType.CLIENT, CastType = PetSkillCastType.MANUAL, CondType = PetSkillCond.NONE, Var = {0}, Order = 0 },
	[1325] = { Type = PetSkillType.CLIENT, CastType = PetSkillCastType.AUTO, CondType = PetSkillCond.DEBUFF, Var = {205}, Order = 0 },
	[1326] = { Type = PetSkillType.CLIENT, CastType = PetSkillCastType.MANUAL, CondType = PetSkillCond.NONE, Var = {0}, Order = 0 },
	[1327] = { Type = PetSkillType.CLIENT, CastType = PetSkillCastType.AUTO, CondType = PetSkillCond.DEBUFF, Var = {206}, Order = 0 },
	[1328] = { Type = PetSkillType.CLIENT, CastType = PetSkillCastType.MANUAL, CondType = PetSkillCond.NONE, Var = {0}, Order = 0 },
	[1330] = { Type = PetSkillType.CLIENT, CastType = PetSkillCastType.PASSIVE, CondType = PetSkillCond.NONE, Var = {}, Order = 0 },
	[1331] = { Type = PetSkillType.CLIENT, CastType = PetSkillCastType.PASSIVE, CondType = PetSkillCond.NONE, Var = {}, Order = 0 },
	[1332] = { Type = PetSkillType.CLIENT, CastType = PetSkillCastType.PASSIVE, CondType = PetSkillCond.NONE, Var = {}, Order = 0 },
	[1333] = { Type = PetSkillType.CLIENT, CastType = PetSkillCastType.PASSIVE, CondType = PetSkillCond.NONE, Var = {}, Order = 0 },
	[1334] = { Type = PetSkillType.CLIENT, CastType = PetSkillCastType.PASSIVE, CondType = PetSkillCond.NONE, Var = {}, Order = 0 },
	[1335] = { Type = PetSkillType.CLIENT, CastType = PetSkillCastType.PASSIVE, CondType = PetSkillCond.NONE, Var = {}, Order = 0 },
	[1336] = { Type = PetSkillType.CLIENT, CastType = PetSkillCastType.PASSIVE, CondType = PetSkillCond.NONE, Var = {}, Order = 0 },
	[1337] = { Type = PetSkillType.CLIENT, CastType = PetSkillCastType.PASSIVE, CondType = PetSkillCond.NONE, Var = {}, Order = 0 },
	[1338] = { Type = PetSkillType.CLIENT, CastType = PetSkillCastType.PASSIVE, CondType = PetSkillCond.NONE, Var = {}, Order = 0 },
	[1339] = { Type = PetSkillType.CLIENT, CastType = PetSkillCastType.PASSIVE, CondType = PetSkillCond.NONE, Var = {}, Order = 0 },
	[1340] = { Type = PetSkillType.CLIENT, CastType = PetSkillCastType.PASSIVE, CondType = PetSkillCond.NONE, Var = {}, Order = 0 },
	[1341] = { Type = PetSkillType.CLIENT, CastType = PetSkillCastType.PASSIVE, CondType = PetSkillCond.NONE, Var = {}, Order = 0 },
	[1342] = { Type = PetSkillType.CLIENT, CastType = PetSkillCastType.PASSIVE, CondType = PetSkillCond.NONE, Var = {}, Order = 0 },
	[1343] = { Type = PetSkillType.CLIENT, CastType = PetSkillCastType.PASSIVE, CondType = PetSkillCond.NONE, Var = {}, Order = 0 },
	[1344] = { Type = PetSkillType.CLIENT, CastType = PetSkillCastType.PASSIVE, CondType = PetSkillCond.NONE, Var = {}, Order = 0 },
	[1345] = { Type = PetSkillType.CLIENT, CastType = PetSkillCastType.PASSIVE, CondType = PetSkillCond.NONE, Var = {}, Order = 0 },
	[1346] = { Type = PetSkillType.CLIENT, CastType = PetSkillCastType.PASSIVE, CondType = PetSkillCond.NONE, Var = {}, Order = 0 },
	[1347] = { Type = PetSkillType.CLIENT, CastType = PetSkillCastType.PASSIVE, CondType = PetSkillCond.NONE, Var = {}, Order = 0 },
	[2522] = { Type = PetSkillType.CLIENT, CastType = PetSkillCastType.PASSIVE, CondType = PetSkillCond.NONE, Var = {}, Order = 0 },
	[2523] = { Type = PetSkillType.CLIENT, CastType = PetSkillCastType.PASSIVE, CondType = PetSkillCond.NONE, Var = {}, Order = 0 },
	[2524] = { Type = PetSkillType.CLIENT, CastType = PetSkillCastType.PASSIVE, CondType = PetSkillCond.NONE, Var = {}, Order = 0 },
	[2525] = { Type = PetSkillType.CLIENT, CastType = PetSkillCastType.PASSIVE, CondType = PetSkillCond.NONE, Var = {}, Order = 0 },
	[2526] = { Type = PetSkillType.CLIENT, CastType = PetSkillCastType.PASSIVE, CondType = PetSkillCond.NONE, Var = {}, Order = 0 },
	[2527] = { Type = PetSkillType.CLIENT, CastType = PetSkillCastType.PASSIVE, CondType = PetSkillCond.NONE, Var = {}, Order = 0 },
	[2528] = { Type = PetSkillType.CLIENT, CastType = PetSkillCastType.PASSIVE, CondType = PetSkillCond.NONE, Var = {}, Order = 0 },
	[2529] = { Type = PetSkillType.CLIENT, CastType = PetSkillCastType.PASSIVE, CondType = PetSkillCond.NONE, Var = {}, Order = 0 },
	[2530] = { Type = PetSkillType.CLIENT, CastType = PetSkillCastType.PASSIVE, CondType = PetSkillCond.NONE, Var = {}, Order = 0 },
	[2531] = { Type = PetSkillType.CLIENT, CastType = PetSkillCastType.PASSIVE, CondType = PetSkillCond.NONE, Var = {}, Order = 0 },
--宠物技能类型及施放顺序配置结束
}

------------------------------------------------------------------------------------------------------------------------------
--宠物AI相关
------------------------------------------------------------------------------------------------------------------------------

PetAI.FSPeriod = 0
PetAI.BSPeriod = 0
PetAI.BUFFPeriod = 0
PetAI.REVIVEPeriod = 0
PetAI.FSPeriod_Const = 500			--宠物施放技能最小间隔
PetAI.BSPeriod_Const = 2000
PetAI.BUFFPeriod_Const = 1500		--宠物施放buff技能最小间隔
PetAI.REVIVEPeriod_Const = 2000		--宠物施放复活技能最小间隔
PetAI.ReliveFlag = 0				--宠物复活技能标志位

--宠物技能列表
local FightSkillList = {
	[1] = {ID = 0, name = --[[!AUTO_1]]"", state = false},
	[2] = {ID = 0, name = --[[!AUTO_2]]"", state = false},
	[3] = {ID = 0, name = --[[!AUTO_3]]"", state = false},
	[4] = {ID = 0, name = --[[!AUTO_4]]"", state = false},
	[5] = {ID = 0, name = --[[!AUTO_5]]"", state = false},
	[6] = {ID = 0, name = --[[!AUTO_6]]"", state = false},
	[7] = {ID = 0, name = --[[!AUTO_7]]"", state = false},
	[8] = {ID = 0, name = --[[!AUTO_8]]"", state = false},
	[9] = {ID = 0, name = --[[!AUTO_9]]"", state = false},
	[10] = {ID = 0, name = --[[!AUTO_10]]"", state = false},
	[11] = {ID = 0, name = --[[!AUTO_11]]"", state = false},
	[12] = {ID = 0, name = --[[!AUTO_12]]"", state = false},
}
local LifeSkillList = {}

--Tick函数
function PetAI:Tick(dwPeriod,iPetIndex,petObjID,isFighting)
	do
		return		--目前宠物技能由服务器控制
	end

	local fs_list
	local i,j
    local skill_id
	local pet_target
	local master_prop = {}
	local skill_tbl
	local is_host_dead
	local is_fighting

	PetAI.FSPeriod =  PetAI.FSPeriod + dwPeriod
	PetAI.BUFFPeriod = PetAI.BUFFPeriod + dwPeriod
	PetAI.REVIVEPeriod = PetAI.REVIVEPeriod + dwPeriod

	if PetAI.FSPeriod < PetAI.FSPeriod_Const then
		return
	else
		PetAI.FSPeriod  = 0
	end

	fs_list = GameApi.GetPetFightSkill(iPetIndex)
	PETAI_FIGHT_SKILL_LIST = fs_list
	skill_tbl = GameApi.GetPetShortcutSkill()

	for i = 1, #fs_list do
		if fs_list[i] then
			FightSkillList[i].ID = fs_list[i]["id"]
			FightSkillList[i].name = fs_list[i]["name"]
		end
		skill_id = FightSkillList[i].ID
		if PetAI.SkillCfg[skill_id] and PetAI.SkillCfg[skill_id].CastType ~= PetSkillCastType.PASSIVE then
			for j = 1, 4 do
				if skill_id ~= 0 and skill_tbl and skill_tbl[j]["id_skill"] ==  skill_id then
					FightSkillList[i].state = skill_tbl[j]["is_open"]
					break
				end
			end

			if (skill_id ~= 0 and PetAI.SkillCfg[skill_id] and PetAI.SkillCfg[skill_id].CastType == PetSkillCastType.MANUAL and FightSkillList[i].state == true) or(skill_id ~= 0 and PetAI.SkillCfg[skill_id].CastType == PetSkillCastType.AUTO) then
				--施放复活技能
				is_host_dead = GameApi.IsHostPlayerDead()
				is_fighting = GameApi.IsFighting()
				if is_host_dead == false then
					PetAI.ReliveFlag = 0
				end
				if	is_host_dead == true then
					if PetAI.ReliveFlag == 0 then
						PetAI.ReliveFlag = 1
					end
					if PetAI.ReliveFlag == 1 and PetAI.SkillCfg[skill_id].CondType == PetSkillCond.REVIVE and PetAI.REVIVEPeriod >= PetAI.REVIVEPeriod_Const and GameApi.PetCanCastSkill(iPetIndex,skill_id,0) == SkillTip.SkillCode.CHKCASTSKL_OK then
						PetAI.ReliveFlag = 2
						GameApi.PetCastSkill(skill_id,iPetIndex)
						PetAI.REVIVEPeriod = 0
					end
				--施放无限制技能
				elseif PetAI.SkillCfg[skill_id].CondType == PetSkillCond.NONE and is_fighting == true then
					pet_target = GameApi.GetPetSelectedTarget()
					if GameApi.PetCanCastSkill(iPetIndex,skill_id,pet_target) == SkillTip.SkillCode.CHKCASTSKL_OK  then
						GameApi.PetCastSkill(skill_id,iPetIndex)
					end
				--施放BUFF类技能
				elseif PetAI.SkillCfg[skill_id].CondType == PetSkillCond.BUFF then
					if (not GameApi.PlayerHasBuffState(0,PetAI.SkillCfg[skill_id].Var[1])) and GameApi.PetCanCastSkill(iPetIndex,skill_id,0) == SkillTip.SkillCode.CHKCASTSKL_OK then
						if	PetAI.BUFFPeriod >= PetAI.BUFFPeriod_Const then
							GameApi.PetCastSkill(skill_id,iPetIndex)
							PetAI.BUFFPeriod = 0
						end
					end
				--施放DEBUFF类技能
				elseif PetAI.SkillCfg[skill_id].CondType == PetSkillCond.DEBUFF and is_fighting == true then
					pet_target = GameApi.GetPetSelectedTarget()
					if (not GameApi.NpcHasBuffState(pet_target,PetAI.SkillCfg[skill_id].Var[1])) and GameApi.PetCanCastSkill(iPetIndex,skill_id,pet_target) == SkillTip.SkillCode.CHKCASTSKL_OK then
						GameApi.PetCastSkill(skill_id,iPetIndex)
					end
				--施放回蓝类技能
				elseif PetAI.SkillCfg[skill_id].CondType == PetSkillCond.MP_CURE then
					master_prop = GameApi.GetPlayerBasicProp(0)
					if master_prop["mp1"]/master_prop["maxmp1"] < PetAI.SkillCfg[skill_id].Var[1] and GameApi.PetCanCastSkill(iPetIndex,skill_id,0) == SkillTip.SkillCode.CHKCASTSKL_OK then
						GameApi.PetCastSkill(skill_id,iPetIndex)
					end
				--施放回血类技能
				elseif PetAI.SkillCfg[skill_id].CondType == PetSkillCond.HP_CURE then
					master_prop = GameApi.GetPlayerBasicProp(0)
					if master_prop["hp"]/master_prop["maxhp"] < PetAI.SkillCfg[skill_id].Var[1] and GameApi.PetCanCastSkill(iPetIndex,skill_id,0) == SkillTip.SkillCode.CHKCASTSKL_OK  then
						GameApi.PetCastSkill(skill_id,iPetIndex)
					end
				end
			end
		end
	end
	return
end

local LClick_LastCD = 0
local LClick_CD = 0

--Event函数
function PetAI:OnPetEvent(iPetIndex,idEvent,argsMap)
	do
		return		--目前宠物技能由服务器控制
	end

	local id
	local i
	local pet_target
	local fs_list

	LClick_CD = os.clock()
	if LClick_CD - LClick_LastCD >= 1 then
		LClick_LastCD = LClick_CD
	else
		return
	end

	fs_list = GameApi.GetPetFightSkill(iPetIndex)
	--左键点击施放技能
	if	idEvent == PetEvent.LBTN_SKILL then
		id = argsMap["id_skill"]
		pet_target = GameApi.GetPetSelectedTarget()
		local skill_code
		skill_code = GameApi.PetCanCastSkill(iPetIndex,id,pet_target)
		if id ~= 0 and skill_code == SkillTip.SkillCode.CHKCASTSKL_OK then
			GameApi.PetCastSkill(id,iPetIndex)
		elseif skill_code == SkillTip.SkillCode.CHKCASTSKL_NOTENOUGH_MP then
			GameApi.AddSystemHint(--[[!AUTO_13]]"門徒怒氣值不足")
		elseif skill_code == SkillTip.SkillCode.CHKCASTSKL_SKILL_COOLING then
			GameApi.AddSystemHint(--[[!AUTO_14]]"門徒怒氣技或招式正在冷卻中")
		else
			GameApi.AddSystemHint(--[[!AUTO_15]]"門徒不能使用這個怒氣技或招式")
		end
	--怪物施放技能事件
	elseif idEvent == PetEvent.MONSTER_CASTSKILL then
		for i = 1, #fs_list do
			pet_target = GameApi.GetPetSelectedTarget()
			id = FightSkillList[i].ID
			if id ~= 0 and PetAI.SkillCfg[id] and  PetAI.SkillCfg[id].CondType == PetSkillCond.SILENCE and FightSkillList[i].state == true and GameApi.PetCanCastSkill(iPetIndex,id,pet_target) then
				GameApi.PetCastSkill(id,iPetIndex)
			end
		end
	--怪物死亡事件
	elseif idEvent == PetEvent.MONSTER_KILLED then
		for i = 1, #fs_list do
			id = FightSkillList[i].ID
			if id ~= 0 and PetAI.SkillCfg[id] and  PetAI.SkillCfg[id].CondType == PetSkillCond.SEARCH and FightSkillList[i].state == true and GameApi.PetCanCastSkill(iPetIndex,id,0) then
				GameApi.PetCastSkill(id,iPetIndex)
			end
		end
	--怪物逃跑事件
	elseif idEvent == PetEvent.MONSTER_FLEE then
		for i = 1, #fs_list do
			pet_target = GameApi.GetPetSelectedTarget()
			id = FightSkillList[i].ID
			if id ~= 0 and PetAI.SkillCfg[id] and  PetAI.SkillCfg[id].CondType == PetSkillCond.CONTROL and FightSkillList[i].state == true and GameApi.PetCanCastSkill(iPetIndex,id,pet_target) then
				GameApi.PetCastSkill(id,iPetIndex)
			end
		end
	end
end

------------------------------------------------------------------------------------------------------------------------------
--宠物喊话相关
------------------------------------------------------------------------------------------------------------------------------
function PetAI:GetUsePetItemMsgTbl(pet_index,item_cid,item_tid)
	local msg_id = 0
	if ObjSpeak.UsePetItemMsg[item_cid] and ObjSpeak.UsePetItemMsg[item_cid][item_tid] then
		msg_id = ObjSpeak.UsePetItemMsg[item_cid][item_tid]
		return ObjSpeak.PetMsgList[msg_id]
	else
		return --[[!AUTO_16]]""
	end
end

--使用宠物物品调用
function PetAI:OnUsePetItem(pet_index,item_cid,item_tid)
	local ret_mode = nil
	local msg_tbl  = PetAI:GetUsePetItemMsgTbl(pet_index,item_cid,item_tid)
	if msg_tbl and msg_tbl.Word and msg_tbl.Mode then
		local sMsg = GameApi.PetConverSvrMsg(pet_index,msg_tbl.Word)
		if sMsg then
			if msg_tbl.Mode then
				local mode = ObjSpeak:CopyTable(ObjSpeak.DisplayMode)
				mode = ObjSpeak:BestrowTable(mode,msg_tbl.Mode)
				ret_mode = ObjSpeak:CopyArray(mode)
			end
			--喊话API
			local pet_tbl = GameApi.GetSummonedPetInfo()
			if pet_tbl["pet_tid"] > 0 and pet_tbl["pet_index"] == pet_index then
				GameApi.ObjSpeak(ObjSpeak.ObjType.OBJ_PET,pet_tbl["pet_nid"],pet_tbl["pet_tid"],ObjSpeak.ValidTarget.PET_HOST,sMsg,ret_mode)
			elseif msg_tbl.Mode.ShowChat then
				GameApi.AddChatMessage(msg_tbl.Mode.ChatChannel,sMsg)
			end
		end
	end
end
------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------
--宠物技能快捷栏接口
--判断宠物技能是否需要拖到宠物技能快捷栏
function PetAI:IsShortcutPetSkill(pet_index,id_skill)
	--手动技能
	if id_skill ~= 0 and PetAI.SkillCfg[id_skill].CastType ~= PetSkillCastType.PASSIVE then
		return true
	else
		return false
	end
end
