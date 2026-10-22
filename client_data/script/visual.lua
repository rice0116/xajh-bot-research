---This script is coded in ASCII/ANSI. Be careful saving it!

--------------------------职业类型---------------------
PROF_TYPE =
{
	NEWBIE					= 0,		--	0	新手
	SHAOLIN					= 1,		--		少林
	WUDANG					= 2,		--		武当
	HUASHAN					= 3,		--		华山
	NORTH_HENGSHAN			= 4,		--		恒山(北岳)
	SOUTH_HENGSHAN			= 5,		--	5	衡山(南岳)
	RIYUE					= 6,		--		日月
	WUXIAN					= 7,		--		五仙
	XIAOYAO					= 8,		--		逍遥
	TANGMEN					= 9,		--		唐门
	EMEI					= 10,		--	10	峨嵋
	MONSTER_HUMANSHAPE_1	= 11,		--		人形怪物1
	MONSTER_HUMANSHAPE_2	= 12,		--		人形怪物2
	MONSTER_HUMANSHAPE_3	= 13,		--		人形怪物3
	MONSTER_BEAST_1			= 14,		--		野兽怪物1
	MONSTER_BEAST_2			= 15,		--	15	野兽怪物2
	MONSTER_GHOST_1			= 16,		--		鬼怪怪物1
	MONSTER_GHOST_2			= 17,		--		鬼怪怪物2
	MONSTER_GHOST_3			= 18,		--		鬼怪怪物3
	MONSTER_GEAR_1			= 19,		--		机关怪物1
	MONSTER_GEAR_2			= 20,		--	20	机关怪物2
	MONSTER_PLANT_1			= 21,		--		植物怪物1
	MONSTER_PLANT_2			= 22,		--		植物怪物2
	MONSTER_SPIRITBEAST_1	= 23,		--		神兽怪物1
	MONSTER_SPIRITBEAST_2	= 24,		--		神兽怪物2
	MONSTER_SPIRITBEAST_3	= 25,		--	25	神兽怪物3
	MONSTER_BOSS_1			= 26,		--		BOSS怪物1
	MONSTER_BOSS_2			= 27,		--		BOSS怪物2
	MONSTER_BOSS_3			= 28,		--		BOSS怪物3
	MONSTER_UNUSED_C		= 29,		--		待定C
	MONSTER_UNUSED_B		= 30,		--	30	待定B
	PET						= 31,		--		宠物

	COUNT					= 32,		--	32	最大职业数
}
------------------------------------------------------

-----------------客户端定义的Object类型---------------
OBJECT_TYPE =
{
		OCID_OBJECT = 0,			--	CECObject：Object基类

		OCID_PLAYER_BASE = 1,	--	CECPlayer：Player基类
		OCID_HOSTPLAYER = 2,	--	CECHostPlayer：主角
		OCID_ELSEPLAYER = 3,	--	CECElsePlayer：别人
		OCID_LOGINPLAYER = 4,	--	CECLoginPlayer：登陆角色/界面角色
		OCID_PORTRAIT_PLAYER= 5, --	CECPortraitPlayer: 玩家3D肖像
		OCID_PLAYER_END = 6,

		OCID_MATTER = 11,			--	CECMatter：Loot/矿/动态物品

		OCID_SUBOBJECT = 16,	--	CECSubObj：子物体

		OCID_NPC_BASE = 21,		--	CECNPC：NPC基类
		OCID_MONSTER = 22,		--	CECNPCMonster：怪物
		OCID_SERVER = 23,			--	CECNPCServer：服务NPC
		OCID_CARRIER = 24,		--	CECNPCCarrier：战船
		OCID_PET = 25,				--	CECPet：宠物
		OCID_DARTCAR = 26,		--	CECNPCDartCar：镖车
		OCID_NPC_BECKON = 27,	--	CECNPCBeckon：客户端召出的npc
		OCID_NPC_CLIENTVIHECLE = 28, --CECClientSimuVehicle：客户端召出的载具npc
		OCID_NPC_END = 29,

		OCID_DYNBLD_BASE = 41,		--	CECDynBuilding：动态建筑基类
		OCID_DYNBLD_HOME = 42,		--	CECDynBld_Home：家园建筑
		OCID_DYNBLD_FACTION = 43, --	CECDynBld_Faction：帮派建筑
		OCID_DYNBLD_END = 44,

}
------------------------------------------------------

--------------------------攻击类型---------------------
ATTACK_TYPE =
{
	NEWBIE					= 0,		-- 0	空手
	SHAOLIN					= 1,		--		少林
	WUDANG					= 2,		--		武当
	HUASHAN					= 3,		--		华山
	NORTH_HENGSHAN			= 4,		--		恒山
	SOUTH_HENGSHAN			= 5,		-- 5	衡山
	RIYUE					= 6,		--		日月
	WUXIAN					= 7,		--		五仙
	XiAOYAO					= 8,		--		逍遥
	TANGMEN					= 9,		--		唐门
	EMEI					= 10,		-- 10	峨嵋
	MONSTER					= 11,		--		怪物
	METAL_SHARP				= 12,		--		金属锐器
	DONGHUA					= 13,		--		东华
	METAL_KEEN				= 14,		--		金属利器
	METAL_SOFT				= 15,		-- 15	金属软体
	WOOD_SHARP				= 16,		--		木质锐器
	WOOD_BLUNT				= 17,		--		木质钝器
	WOOD_KEEN				= 18,		--		木质利器
	WOOD_SOFT				= 19,		--		木质软体
	STONE_SHARP				= 20,		-- 20	石制锐器
	STONE_BLUNT				= 21,		--		石制钝器
	STONE_KEEN				= 22,		--		石制利器
	STONE_SOFT				= 23,		--		石制软体
	FLESH_SHARP				= 24,		--		肉身锐器
	FLESH_BLUNT				= 25,		-- 25	肉身钝器
	FLESH_KEEN				= 26,		--		肉身利器
	FLESH_SOFT				= 27,		--		肉身软体
	UNUSED_3				= 28,		--		待定3
	UNUSED_2				= 29,		--		待定2
	UNUSED_1				= 30,		-- 30	待定1
	UNUSED_0				= 31,		--		待定0

	COUNT					= 32,		-- 32
}
------------------------------------------------------

--------------------------防御类型---------------------
DEFENCE_TYPE =
{
	FLESH    				= 0,		-- 0	肉体
	CLOTH    				= 1,		--		布衣
	LEATHER  				= 2,		--		皮甲
	COTTON   				= 3,		--		棉甲
	FUR      				= 4,		--		毛皮
	SCALE    				= 5,		-- 5	鳞片
	FETHER   				= 6,		--		羽毛
	IRON     				= 7,		--		铁
	COPPER   				= 8,		--		铜
	STONE    				= 9,		--		石头
	WOOD     				= 10,		-- 10	木头
	STRAW	 				= 11,		--		稻草
	GHOST	 				= 12,		--		幽灵
	UNUSED_18				= 13,		--		待定18
	UNUSED_17				= 14,		--		待定17
	UNUSED_16				= 15,		-- 15	待定16
	UNUSED_15				= 16,		--		待定15
	UNUSED_14				= 17,		--		待定14
	UNUSED_13				= 18,		--		待定13
	UNUSED_12				= 19,		--		待定12
	UNUSED_11				= 20,		-- 20	待定11
	UNUSED_10				= 21,		--		待定10
	UNUSED_9 				= 22,		--		待定9
	UNUSED_8 				= 23,		--		待定8
	UNUSED_7 				= 24,		--		待定7
	UNUSED_6 				= 25,		-- 25	待定6
	UNUSED_5 				= 26,		--		待定5
	UNUSED_4 				= 27,		--		待定4
	UNUSED_3 				= 28,		--		待定3
	UNUSED_2 				= 29,		--		待定2
	UNUSED_1 				= 30,		-- 30	待定1
	UNUSED_0 				= 31,		--		待定0

	COUNT					= 32,		-- 32
}
------------------------------------------------------

--------------------------表情类型---------------------
EXPRESSION_TYPE =
{
	WAVE 			= 0,	--	挥手
	ASK				= 1,	--	请求
	KNEEL			= 2,	--	下跪抱拳
	POINT			= 3,	--	手指前方
	SALUTE		= 4,	--	抱拳
	SHY				= 5,	--	害羞
	ANGRY			= 6,	--	发怒
	SAD				= 7,	--	伤心
	CLAP			= 8,	--	鼓掌
	APPLAUSE	= 9,	--	欢呼
	KISS			= 10,	--	亲吻
	DRINK			= 11,	--	喝酒
	EAT				= 12,	--	吃肉
	BEG				= 13,	--	跪求
	PUSHUP			= 14,	--	俯卧撑
	SAUCE			= 15,	--	打酱油
	SLEEP			= 16,	--	睡觉
	LIEDOWNDRINK 	= 17,	--	躺下喝酒
	BOW				= 18,	--	作揖
	BORING			= 19,	--	无聊
	SCARED			= 20,	--	海派
	GAMBLING_0	= 21,--	猜拳石头
	GAMBLING_1	= 22,--	猜拳剪刀
	GAMBLING_2	= 23,--	猜拳布
	SHAKEHEAD		= 24,	--	摇头
	CUTE			= 25,	--	装可爱
	SITDOWN		= 26,	--	坐下
	HIDE			= 27,	--	潜伏
        WATERMELON		= 28,	--	吃瓜
	NUM_ROLEEXP = 29,

	--	Special expression
	SPECIAL_BEGIN 		= 100,
	ROLEEXP_TWO_KISS	= 101,	--	双人亲吻
	ROLEEXP_FIREWORK	= 102,	--	放烟花
	ROLEEXP_DANCE_START = 103,
	ROLEEXP_DANCE_1 	= 103,
	ROLEEXP_DANCE_2		= 104,
	ROLEEXP_DANCE_3		= 105,
	ROLEEXP_DANCE_END 	= 105,
	ROLEEXP_TIP = 106,		-- 求打赏
	ROLEEXP_CARESS = 107,	-- 爱抚
}

-- 战场胜利动作：挑一些表情动作代替
BATTLE_WIN_EMOTE =
{
	[1] = EXPRESSION_TYPE.WAVE,
	[2] = EXPRESSION_TYPE.POINT,
	[3] = EXPRESSION_TYPE.SALUTE,
	[4] = EXPRESSION_TYPE.SHY,
	[5] = EXPRESSION_TYPE.ANGRY,
	[6] = EXPRESSION_TYPE.CLAP,
	[7] = EXPRESSION_TYPE.APPLAUSE,
	[8] = EXPRESSION_TYPE.KISS,
	[9] = EXPRESSION_TYPE.DRINK,
	[10] = EXPRESSION_TYPE.EAT,
	[11] = EXPRESSION_TYPE.PUSHUP,
	[12] = EXPRESSION_TYPE.SAUCE,
	[13] = EXPRESSION_TYPE.SLEEP,
	[14] = EXPRESSION_TYPE.LIEDOWNDRINK,
	[15] = EXPRESSION_TYPE.BOW,

	COUNT = 15,
}

------------------------------------------------------


---------------------战斗姿态类型--------------------
STANCE_TYPE =
{
	BLOCK		= 0,	--	戒备姿态
	NORMAL		= 1,	--	普通姿态
	TRANS1		= 2,	--	武器变形1
	TRANS2		= 3,	--	武器变形2
	JUEXUE		= 4,	--	江湖绝学

	COUNT		= 5,
}
------------------------------------------------------


---------------------- 摔投配置 ------------------------

-- 摔投配置：以挂点进行分类
BINDTHROW_HOOKTYPE_HEAD 	= 0	--头部挂点
BINDTHROW_HOOKTYPE_CHEST 	= 1	--胸部挂点
BINDTHROW_HOOKTYPE_SPINE 	= 2	--腰部挂点
BINDTHROW_HOOKTYPE_FOOT 	= 3	--脚部挂点

-- 客户端定义的抓投模板id
BindThrow_TemplateID =
{
	[BINDTHROW_HOOKTYPE_HEAD] 	= 10000000,
	[BINDTHROW_HOOKTYPE_CHEST] 	= 10000001,
	[BINDTHROW_HOOKTYPE_SPINE] 	= 10000002,
	[BINDTHROW_HOOKTYPE_FOOT] 	= 10000003,
}


-------------------- 子模型绑定类型 ---------------------

EC_CHILDBIND_NONE = 0			--	未绑
EC_CHILDBIND_MODEL_BIND = 1		--	模型已绑上
EC_CHILDBIND_LOGICBIND_NEEDMODEL = 2	--	逻辑上已绑，但模型加载后要绑上
EC_CHILDBIND_LOGICBIND_IGNOREMODEL = 3	--	逻辑上已绑，且不需绑模型

------------------------------------------------------


-----------------实体（玩家、NPC等）基本动作调用事件定义-------------------
-----------------define action type flag--------------------

ObjectLogicActFlag =
{
	NONE				= 0,	--无动作

	--	出生死亡相关
	BORN				= 1,	--出生
	DIED				= 2,	--死亡
	TRANSMIT			= 3,	--传送
	DIEDLOOP			= 4,	--死亡循环
	REVIVE				= 5,	--复活
	DISAPPEAR			= 6,	--消失
	DISAPPEAR_NOTDEAD		= 7,	--非死亡消失

	--	运动相关
	STAND				= 20,	--站立
	WALK				= 21,	--行走
	RUN				= 22,	--奔跑
	MOVEFOWARD			= 23,	--索敌前进
	MOVERIGHT			= 24,	--索敌右移
	MOVEBACK			= 25,	--索敌后退
	MOVELEFT			= 26,	--索敌左移
	JUMPSTART			= 27,	--起跳
	JUMPLOOP			= 28,	--起跳空中循环
	JUMPLAND_PREPARE	= 29,	--落地之前的缓冲动作
	JUMPLAND			= 30,	--跳跃落地
	PULLUPHORSE		= 31,	--马上拉马头
	ROLL_INAIR		= 32,	--空中翻滚
	TURN					= 33,	--原地转向
	STAND_COLLIDE_FRONT= 34,	--站立前碰撞
	STAND_COLLIDE_BACK = 35,	--站立后碰撞
	STAND_COLLIDE_LEFT = 36,	--站立左碰撞
	STAND_COLLIDE_RIGHT= 37,	--站立右碰撞
	WALK_COLLIDE_FRONT= 38,	--行走前碰撞
	WALK_COLLIDE_BACK = 39,	--行走后碰撞
	WALK_COLLIDE_LEFT = 40,	--行走左碰撞
	WALK_COLLIDE_RIGHT= 41,	--行走右碰撞
	RUN_COLLIDE_FRONT = 42,	--奔跑前碰撞
	RUN_COLLIDE_BACK  = 43,	--奔跑后碰撞
	RUN_COLLIDE_LEFT  = 44,	--奔跑左碰撞
	RUN_COLLIDE_RIGHT = 45,	--奔跑右碰撞
	FASTRUN_BREAK	= 46,		--加速跑刹车
	JUMPINTO_WATER = 47,	--入水
	JUMPOUT_WATER = 48,	--出水
	TURN_INMOVE		= 49,	--运动中转向
	VEHICLE_CHANGE = 50,	-- 坐骑变形
	VEHICLE_RESTORE = 51,	-- 坐骑还原
	FLY_RISEUP = 52,		-- 飞行上升
	FLY_FALLDOWN = 53,	-- 飞行下降
	JUMP_SWALLOWMOVE = 54, --跳跃燕行
	

	--	技能相关
	CASTSKILL			= 60,	--施放技能
	WOUNDED				= 61,	--受伤
	DRAWWEAPON		= 62,	--抽出武器
	RETURNWEAPON	= 63,	--收起武器
	DODGE				= 64,	--闪避
	BEATBACK		= 65,	--被击退
	GUARD				= 66,	--防御（怪物放技能后会播这个动作）
	NEKDRAWWEAPON		= 67,	--新大逃杀取出武器
	NEKRETURNWEAPON		= 68,	--新大逃杀收回武器

	--	操作相关
	LOOT				= 70,	--拾取
	MINE				= 71,	--采集
	STANDOPT			= 72,	--站立通用操作
	EXPRESSION			= 73,	--表情
	GREETING			= 74,	--召呼
	OBJACT_BOOTH			= 75,	--摆摊
	TAKEMEDICINE = 76,	-- 吃药
	ESCAPE_CELEBRATE = 77,		-- 大逃杀庆祝
	RELOAD				= 78,	--新大逃杀换子弹

	--	绑定相关
	BINDACTION			= 90,	--绑定各阶段（开始、确认、绑定中、结束）动作
	TWOKISS				= 91,	--双人亲吻
	BINDFLYSTART = 92,		-- 绑定飞行坐骑起始动作（只有坐骑播这个动作）
	CARESS				= 93,	--爱抚

	--	休闲
	IDLE				= 100,	--随机休闲
	IDLE1				= 101,	--休闲1
	IDLE2				= 102,	--休闲2
	IDLE3				= 103,	--休闲3
	IDLE4				= 104,	--休闲4
	IDLE_SPECIAL			= 105,	--配饰特殊休闲

	--	交互
	INTERACT			= 111,	--随机交互
	INTERACT1			= 112,	--交互1
	INTERACT2			= 113,	--交互2
	INTERACT3			= 114,	--交互3
	INTERACT4			= 115,	--交互4
	EMOTE_RESPONSE		= 116,	--表情回应动作

	-- 	创建角色相关
	CREATESHOW			= 120,	--创建角色动作
	CREATESTAND			= 121,	--创建角色站立
	RESTORE					= 122,	--恢复
	REST						= 123,	--休息
	SELECT_GENDER		= 124,	--创建选性别

	--	战场相关
	BATTLE_START		= 130,	--战场开局动作
	BATTLE_WIN			= 131,	--战场胜利动作
	BATTLE_LOSE			= 132,	--战场失败动作

	PLAYER_NPC_SHOW 	= 133,

	CORSESACTION		= 134,

	-- 奏乐相关
	MUSIC_START		= 140,	-- 开始
	MUSIC_STAND		= 141,	-- 站立
	MUSIC_PLAY		= 142,	-- 演奏
	MUSIC_IDLE		= 143,	-- 休闲
	MUSIC_STOP		= 144,	-- 停止

	-- 	其他
	LIANSHOU		= 901,	--联手专用下山动作
	CUSTOM_NPCBORNDEFAULT	= 951,	--用于NPC的默认出生动作
	CUSTOM_SPEEDUP		= 998,	--策划自定加速

}
------------------------------------------------------------


---------------------NPC逻辑类型---------------------
NPCLogicType =
{
	MONSTER			= 1,	--怪物
	NPC			= 2,	--NPC
	PET			= 3,	--宠物
	RIDE_VEHICLE		= 4,	--骑乘NPC
	BECKON			= 5,	--客户端召唤的NPC
	PLAYER_TRANSFORM	= 6,	--玩家变身成的NPC
}
------------------------------------------------------

----------------------------------相机特殊逻辑-----------------------------------
CAM_SPECOP_NONE = 0
CAM_SPECOP_LOCKFACE_RUN = 1	--固定人的朝向奔跑
----------------------------------------------------------------------------------


-----------------定义人物组合动作名称标识-------------------
------------------Act String Suffix Flag--------------------
ActStringFlag =
{
	--通用后缀，不仅要看门派，也要看武器
	NONE		= 1,		--无前后缀
	COMMON		= 2,		--所有门派的通用动作后缀均为"通用"
	FACTION		= 3,		--特定门派调用动作，其实是武器，考虑武器变形
	WEAPON		= 4,		--按门派再按武器调用动作
	COMMON	= 5,		--调用对应门派的未完成动作，通常动作是按门派制作，供未完成时写成这个
 	--特殊后缀，通常动作出现本身会有武器限制或别的限制，所以不随角色拿的武器影响
	SPECIAL		= 11,		--调用对应门派的专属动作
	CHANGE1		= 12,		--调用对应门派的武器变形动作1
	CHANGE2		= 13,		--调用对应门派的武器变形动作2
	CHANGE3		= 14,		--调用对应门派的武器变形动作3
}
----------------- -------------------------------------------


-------------------人物模型组合动作名称---------------------
---------------------Combine Act Name-----------------------
ACTIONSTRINGNULL	= ""
ACTIONSTRINGSPECIAL	= "空"
CANNAMESIMPLESTYLE	= "%s"
CANNAMENORMALSTYLE	= "%s_%s_%s"
CANFULLNAMESTYLE	= "%s_%s_%s_%s"
LASTACTLOGIC		= nil
PlayerActionPrefix	= {"pt","zd","zs","bq","cj","",  "qc",   "sq"}
PlayerActionInfix	= {"",  "",  "",  "",  "", "绑定","骑乘","双骑"}		--骑乘前面一格是绑定，其它的一般不用中间词
CombineActName =
{
--动作名称		= {"pt","zd","zs","bq","cj",""  ,"qc","sq",		首选动作后缀},
["抱拳"] 		= {nil ,nil ,nil ,true,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.WEAPON},
["抱拳"] 		= {nil ,nil ,nil ,true,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.WEAPON},
["吃肉"] 		= {nil ,nil ,nil ,true,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.WEAPON},
["打酱油"] 		= {nil ,nil ,nil ,true,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.WEAPON},
["发怒"] 		= {nil ,nil ,nil ,true,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.WEAPON},
["俯卧撑"] 		= {nil ,nil ,nil ,true,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.WEAPON},
["鼓掌"] 		= {nil ,nil ,nil ,true,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.WEAPON},
["跪求"] 		= {nil ,nil ,nil ,true,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.WEAPON},
["害羞"] 		= {nil ,nil ,nil ,true,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.WEAPON},
["喝酒"] 		= {nil ,nil ,nil ,true,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.WEAPON},
["欢呼"] 		= {nil ,nil ,nil ,true,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.WEAPON},
["挥手"] 		= {nil ,nil ,nil ,true,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.WEAPON},
["亲吻"] 		= {nil ,nil ,nil ,true,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.WEAPON},
["请求"] 		= {nil ,nil ,nil ,true,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.WEAPON},
["伤心"] 		= {nil ,nil ,nil ,true,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.WEAPON},
["手指前方"]		= {nil ,nil ,nil ,true,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.WEAPON},
["睡觉"] 		= {nil ,nil ,nil ,true,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.WEAPON},
["躺下喝酒"]		= {nil ,nil ,nil ,true,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.WEAPON},
["持续喝酒"] 		= {true ,nil ,nil ,nil,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["下跪抱拳"]		= {nil ,nil ,nil ,true,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.WEAPON},
["作揖"] 		= {nil ,nil ,nil ,true,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.WEAPON},
["无聊"] 		= {nil ,nil ,nil ,true,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.WEAPON},
["害怕"] 		= {nil ,nil ,nil ,true,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.WEAPON},
["猜拳石头"] 		= {nil ,nil ,nil ,true,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.WEAPON},
["猜拳剪刀"] 		= {nil ,nil ,nil ,true,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.WEAPON},
["猜拳布"] 		= {nil ,nil ,nil ,true,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.WEAPON},
["摇头拒绝"] 		= {nil ,nil ,nil ,true,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.WEAPON},
["装可爱"] 		= {nil ,nil ,nil ,true,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.WEAPON},
["坐地上"] 		= {nil ,nil ,nil ,true,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.WEAPON},
["潜伏"] 		= {nil ,nil ,nil ,true,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.WEAPON},
["吃西瓜"] 		= {true ,nil ,nil ,nil,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["弹琴"] 		= {true ,nil ,nil ,nil,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["打水"] 		= {true ,nil ,nil ,nil,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["泼水"] 		= {true ,nil ,nil ,nil,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["耍花灯"] 		= {true ,nil ,nil ,nil,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["上香"] 		= {true ,nil ,nil ,nil,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["求打赏"] 		= {nil ,nil ,nil ,true,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.WEAPON},
--孩子系统新增
["孩子射箭"] 		= {true ,nil ,nil ,nil,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["算术"] 		= {true ,nil ,nil ,nil,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["木马"] 		= {true ,nil ,nil ,nil,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["孩子射箭"] 		= {true ,nil ,nil ,nil,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["孩子射箭循环"] 		= {true ,nil ,nil ,nil,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["弹琴_短"] 		= {true ,nil ,nil ,nil,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["弹琴循环"] 		= {true ,nil ,nil ,nil,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["算术循环"] 		= {true ,nil ,nil ,nil,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["木马循环"] 		= {true ,nil ,nil ,nil,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["被抱起"] 		= {nil ,nil ,nil ,nil,nil ,true ,nil ,nil  ,	suftype =  ActStringFlag.NONE},
["被放下"] 		= {nil ,nil ,nil ,nil,nil ,true ,nil ,nil  ,	suftype =  ActStringFlag.NONE},

--大逃杀
["大逃杀吃肉"] 		= {nil ,nil ,nil ,true,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},

--差事动作
["差事_门徒"] 		= {true ,nil ,nil ,nil, nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["差事_社交001"] 		= {true ,nil ,nil ,nil, nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["差事_社交002"] 		= {true ,nil ,nil ,nil, nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["差事_社交004"] 		= {true ,nil ,nil ,nil, nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["差事_社交005"] 		= {true ,nil ,nil ,nil, nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["差事_社交006"] 		= {true ,nil ,nil ,nil, nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["差事_社交007"] 		= {true ,nil ,nil ,nil, nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["差事_社交008"] 		= {true ,nil ,nil ,nil, nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["差事_治疗001"] 		= {true ,nil ,nil ,nil, nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["差事_治疗002"] 		= {true ,nil ,nil ,nil, nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["差事_治疗003"] 		= {true ,nil ,nil ,nil, nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["差事_治疗004"] 		= {true ,nil ,nil ,nil, nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["差事_治疗005"] 		= {true ,nil ,nil ,nil, nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["差事_治疗006"] 		= {true ,nil ,nil ,nil, nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["差事_治疗007"] 		= {true ,nil ,nil ,nil, nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},

-------------以下动作为“绑定常用动作”
--动作名称		= {"pt","zd","zs","bq","cj",""  ,"qc","sq",		首选动作后缀},
["亲亲密密"]		= {nil ,nil ,nil ,true,nil ,true ,true ,nil  ,	suftype =  ActStringFlag.WEAPON},
---（连入时小心）此六动作命名很特殊
["相依相偎跳空中"]	= {nil ,nil ,nil ,true,nil ,true ,true ,nil  ,	suftype =  ActStringFlag.WEAPON},
["相依相偎跳落地"]	= {nil ,nil ,nil ,true,nil ,true ,true ,nil  ,	suftype =  ActStringFlag.WEAPON},
["相依相偎跳起"]	= {nil ,nil ,nil ,true,nil ,true ,true ,nil  ,	suftype =  ActStringFlag.WEAPON},
["相依相偎站立"]	= {nil ,nil ,nil ,true,nil ,true ,true ,nil  ,	suftype =  ActStringFlag.WEAPON},
["相依相偎走"]	= {nil ,nil ,nil ,true,nil ,true ,true ,nil  ,	suftype =  ActStringFlag.WEAPON},
["相依相偎跑"]	= {nil ,nil ,nil ,true,nil ,true ,true ,nil  ,	suftype =  ActStringFlag.WEAPON},
["相依相偎小跑"]	= {nil ,nil ,nil ,true,nil ,true ,true ,nil  ,	suftype =  ActStringFlag.WEAPON},
["相依相偎挥鞭"]	= {nil ,nil ,nil ,true,nil ,true ,true ,nil  ,	suftype =  ActStringFlag.WEAPON},
["相依相偎刹车"]	= {nil ,nil ,nil ,true,nil ,true ,true ,nil  ,	suftype =  ActStringFlag.WEAPON},
["相依相偎受伤"]	= {nil ,nil ,nil ,true,nil ,true ,true ,nil  ,	suftype =  ActStringFlag.WEAPON},
["双人原地跳跃"]	= {nil ,nil ,nil ,true,nil ,true ,true ,nil  ,	suftype =  ActStringFlag.WEAPON},
["双人原地转身L"]	= {nil ,nil ,nil ,true,nil ,true ,true ,nil  ,	suftype =  ActStringFlag.WEAPON},
["双人原地转身R"]	= {nil ,nil ,nil ,true,nil ,true ,true ,nil  ,	suftype =  ActStringFlag.WEAPON},
["双人运动转身L"]	= {nil ,nil ,nil ,true,nil ,true ,true ,nil  ,	suftype =  ActStringFlag.WEAPON},
["双人运动转身R"]	= {nil ,nil ,nil ,true,nil ,true ,true ,nil  ,	suftype =  ActStringFlag.WEAPON},
["抱起"]		= {nil, nil ,nil ,true,nil ,true ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["放下"]		= {nil, nil ,nil ,true,nil ,true ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},

-- 男背女
["男背女背起"]	= {nil, nil ,nil ,true,nil ,true ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["男背女站立"]	= {nil ,nil ,nil ,true,nil ,true ,nil ,nil  ,	suftype =  ActStringFlag.WEAPON},
["男背女行走"]	= {nil ,nil ,nil ,true,nil ,true ,nil ,nil  ,	suftype =  ActStringFlag.WEAPON},
["男背女奔跑"]	= {nil ,nil ,nil ,true,nil ,true ,nil ,nil  ,	suftype =  ActStringFlag.WEAPON},
["男背女跳起"]	= {nil ,nil ,nil ,true,nil ,true ,nil ,nil  ,	suftype =  ActStringFlag.WEAPON},
["男背女跳空中"]= {nil ,nil ,nil ,true,nil ,true ,nil ,nil  ,	suftype =  ActStringFlag.WEAPON},
["男背女落地"]	= {nil ,nil ,nil ,true,nil ,true ,nil ,nil  ,	suftype =  ActStringFlag.WEAPON},
["男背女亲密"]	= {nil ,nil ,nil ,true,nil ,true ,nil ,nil  ,	suftype =  ActStringFlag.WEAPON},
["男背女放下"]	= {nil, nil ,nil ,true,nil ,true ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},

["萝莉坐肩抱起"]	= {nil, nil ,nil ,true,nil ,true ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["萝莉坐肩站立"]	= {nil ,nil ,nil ,true,nil ,true ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["萝莉坐肩行走"]	= {nil ,nil ,nil ,true,nil ,true ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["萝莉坐肩奔跑"]	= {nil ,nil ,nil ,true,nil ,true ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["萝莉坐肩跳起"]	= {nil ,nil ,nil ,true,nil ,true ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["萝莉坐肩空中循环"]= {nil ,nil ,nil ,true,nil ,true ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["萝莉坐肩落地"]	= {nil ,nil ,nil ,true,nil ,true ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["萝莉坐肩亲密"]	= {nil ,nil ,nil ,true,nil ,true ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["萝莉坐肩放下"]	= {nil, nil ,nil ,true,nil ,true ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},

--男女拥抱
["拥抱开始"]	= {nil, nil ,nil ,true,nil ,true ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["拥抱"]		= {nil ,nil ,nil ,true,nil ,true ,nil ,nil  ,	suftype =  ActStringFlag.WEAPON},
["拥抱亲密"]	= {nil ,nil ,nil ,true,nil ,true ,nil ,nil  ,	suftype =  ActStringFlag.WEAPON},
["拥抱结束"]	= {nil, nil ,nil ,true,nil ,true ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},

--孩子交互动作
--萝莉动作
["萝莉爱抚孩子"]	= {nil, nil ,nil ,true,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["萝莉牵手女孩"]	= {nil, nil ,nil ,true,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["萝莉牵手男孩"]	= {nil, nil ,nil ,true,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
--女孩动作
["成女抱女孩"]	= {nil, nil ,nil ,true,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["成女抱女孩循环"]	= {nil, nil ,nil ,true,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["成女抱女孩放下"]	= {nil, nil ,nil ,true,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["成女爱抚女孩"]	= {nil, nil ,nil ,true,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["女孩坐成男肩膀"]	= {nil, nil ,nil ,true,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["女孩坐成男肩膀循环"]	= {nil, nil ,nil ,true,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["女孩坐成人肩膀循环"]	= {nil, nil ,nil ,true,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["女孩坐成男肩膀放下"]	= {nil, nil ,nil ,true,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["女孩坐肩膀放下"]	= {nil, nil ,nil ,true,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["成男爱抚女孩"]	= {nil, nil ,nil ,true,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["萝莉牵手女孩_女孩"]	= {nil, nil ,nil ,true,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["萝莉爱抚女孩_女孩"]	= {nil, nil ,nil ,true,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["萝莉爱抚孩子_孩子"]	= {nil, nil ,nil ,true,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},


--男孩
["成女抱男孩"]	= {nil, nil ,nil ,true,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["成女抱男孩循环"]	= {nil, nil ,nil ,true,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["成女抱男孩放下"]	= {nil, nil ,nil ,true,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["成女爱抚男孩"]	= {nil, nil ,nil ,true,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["男孩坐成男肩膀"]	= {nil, nil ,nil ,true,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["男孩坐成男肩膀循环"]	= {nil, nil ,nil ,true,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["男孩坐成人肩膀循环"]	= {nil, nil ,nil ,true,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["男孩坐成男肩膀放下"]	= {nil, nil ,nil ,true,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["男孩坐肩膀放下"]	= {nil, nil ,nil ,true,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["成男爱抚男孩"]	= {nil, nil ,nil ,true,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},


--	打伞
["单独打伞站立"] = {true, nil ,nil ,nil,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.WEAPON},
["单独打伞行走"] = {true, nil ,nil ,nil,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.WEAPON},
["共伞站立_左"]	= {true, nil ,nil ,nil,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["共伞站立_右"]	= {true, nil ,nil ,nil,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["共伞行走_左"]	= {true, nil ,nil ,nil,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["共伞行走_右"]	= {true, nil ,nil ,nil,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["撑开伞"]	= {true, nil ,nil ,nil,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["打伞原地转身_L"]	= {true, nil ,nil ,nil,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["打伞原地转身_R"]	= {true, nil ,nil ,nil,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["共伞亲密_左"]	= {true, nil ,nil ,nil,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["共伞亲密_右"]	= {true, nil ,nil ,nil,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},

--	抱宠
["抱起宠物"]	= {true, nil ,nil ,nil,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["放下宠物"]	= {true, nil ,nil ,nil,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["抱棉花羊"]	= {true, nil ,nil ,nil,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["棉花羊蹭腿"]	= {true, nil ,nil ,nil,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["抱宠站立"]	= {true, nil ,nil ,nil,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["抱宠原地转身_L"]	= {true, nil ,nil ,nil,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["抱宠原地转身_R"]	= {true, nil ,nil ,nil,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["抱宠行走"]	= {true, nil ,nil ,nil,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["抱宠奔跑"]	= {true, nil ,nil ,nil,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["抱羊加速跑"]	= {true, nil ,nil ,nil,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["抱宠起跳"]	= {true, nil ,nil ,nil,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["抱宠空中循环"]	= {true, nil ,nil ,nil,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["抱宠落地"]	= {true, nil ,nil ,nil,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},


--- 绑定特殊动作
--动作名称		= {"pt","zd","zs","bq","cj",""  ,"qc","sq",		首选动作后缀},
["扔物品"]		= {true,nil ,nil ,nil, nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["跪地循环"]		= {true,nil ,nil ,nil, nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["结婚对拜"]		= {true,nil ,nil ,nil, nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["拜高堂"]		= {true,nil ,nil ,nil, nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["结义"]		= {true,nil ,nil ,nil, nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["推"]			= {true,nil ,nil ,nil, nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["饮血为盟"]		= {nil, nil ,nil ,nil, nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["上马"]		= {nil, nil ,nil ,nil, nil ,nil ,true ,nil  ,	suftype =  ActStringFlag.COMMON},
["骑乘上马"]		= {nil, nil ,nil ,nil, nil ,nil ,true ,nil  ,	suftype =  ActStringFlag.COMMON},
["下马"]		= {nil, nil ,nil ,nil, nil ,nil ,true ,nil  ,	suftype =  ActStringFlag.COMMON},
["推车绑定站立"]	= {true,nil ,nil ,nil, nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["推车绑定行走"]	= {true,nil ,nil ,nil, nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["推车绑定奔跑"]	= {true,nil ,nil ,nil, nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["打伞绑定站立"]	= {true,nil ,nil ,nil, nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["打伞绑定行走"]	= {true,nil ,nil ,nil, nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["打伞绑定奔跑"]	= {true,nil ,nil ,nil, nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["酒坛绑定站立"]	= {true,nil ,nil ,nil, nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["酒坛绑定行走"]	= {true,nil ,nil ,nil, nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["酒坛绑定奔跑"]	= {true,nil ,nil ,nil, nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["灯笼绑定站立"]	= {true,nil ,nil ,nil, nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["灯笼绑定行走"]	= {true,nil ,nil ,nil, nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["灯笼绑定奔跑"]	= {true,nil ,nil ,nil, nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["马车站立"]		= {true,nil ,nil ,nil, nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["马车行走"]		= {true,nil ,nil ,nil, nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["马车奔跑"]		= {true,nil ,nil ,nil, nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["抗麻袋行走"]		= {true,nil ,nil ,nil, nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["携带猴子站立"]		= {true,nil ,nil ,nil, nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["携带猴子行走"]		= {true,nil ,nil ,nil, nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["抗麻袋站立"]		= {true,nil ,nil ,nil, nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["宴会吃喝"]		= {true,nil ,nil ,nil, nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["背伤员行走"]		= {true,nil ,nil ,nil, nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["背伤员站立"]		= {true,nil ,nil ,nil, nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["载具站立"]		= {nil,nil ,nil ,nil, nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["载具行走"]		= {nil,nil ,nil ,nil, nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["被四仙扛挣扎"]		= {nil,nil ,nil ,nil, nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["坐马车"]		= {nil, nil ,nil ,nil, nil ,nil ,true ,nil  ,	suftype =  ActStringFlag.COMMON},
["提水站立"]	= {true,nil ,nil ,nil, nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["提水行走"]	= {true,nil ,nil ,nil, nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["滚油桶"]	= {true,nil ,nil ,nil, nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["滚油桶站立"]	= {true,nil ,nil ,nil, nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["滚油桶站立"]	= {true,nil ,nil ,nil, nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["抱跨服羊站立"]	= {true,nil ,nil ,nil, nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["抱跨服羊奔跑"]	= {true,nil ,nil ,nil, nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["春节祝酒"]	= {true,nil ,nil ,nil, nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["耍花灯"]	= {true,nil ,nil ,nil, nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},

-------------“绑定常用动作”结束
["捕获起"]		= {nil ,nil ,nil ,nil ,true,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["捕获循环"]		= {nil ,nil ,nil ,nil ,true,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["捕获结束"]		= {nil ,nil ,nil ,nil ,true,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["恐吓起"]		= {nil ,nil ,nil ,nil ,true,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["恐吓循环"]		= {nil ,nil ,nil ,nil ,true,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["恐吓结束"]		= {nil ,nil ,nil ,nil ,true,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["招揽起"]		= {nil ,nil ,nil ,nil ,true,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["招揽循环"]		= {nil ,nil ,nil ,nil ,true,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["招揽结束"]		= {nil ,nil ,nil ,nil ,true,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["扔小雪球"]		= {true ,nil ,nil ,nil ,nil,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["采集钓"]		= {nil ,nil ,nil ,nil ,true,nil ,nil ,nil  ,	suftype =  ActStringFlag.WEAPON},
["采集钓循环"]		= {nil ,nil ,nil ,nil ,true,nil ,nil ,nil  ,	suftype =  ActStringFlag.WEAPON},
["采集读书"]		= {nil ,nil ,nil ,nil ,true,nil ,nil ,nil  ,	suftype =  ActStringFlag.WEAPON},
["采集砍"]		= {nil ,nil ,nil ,nil ,true,nil ,nil ,nil  ,	suftype =  ActStringFlag.WEAPON},
["采集刨"]		= {nil ,nil ,nil ,nil ,true,nil ,nil ,nil  ,	suftype =  ActStringFlag.WEAPON},
["采集扑"]		= {nil ,nil ,nil ,nil ,true,nil ,nil ,nil  ,	suftype =  ActStringFlag.WEAPON},
["采集扑循环"]		= {nil ,nil ,nil ,nil ,true,nil ,nil ,nil  ,	suftype =  ActStringFlag.WEAPON},
["采集挖"]		= {nil ,nil ,nil ,nil ,true,nil ,nil ,nil  ,	suftype =  ActStringFlag.WEAPON},
["采集写画"]		= {nil ,nil ,nil ,nil ,true,nil ,nil ,nil  ,	suftype =  ActStringFlag.WEAPON},
["采集挖"]		= {nil ,nil ,nil ,nil ,true,nil ,nil ,nil  ,	suftype =  ActStringFlag.WEAPON},
["采集凿"]		= {nil ,nil ,nil ,nil ,true,nil ,nil ,nil  ,	suftype =  ActStringFlag.WEAPON},
["采集凿"]		= {nil ,nil ,nil ,nil ,true,nil ,nil ,nil  ,	suftype =  ActStringFlag.WEAPON},
["蹲下操作"]		= {nil ,nil ,nil ,nil ,true,nil ,nil ,nil  ,	suftype =  ActStringFlag.WEAPON},
["站立操作"]		= {nil ,nil ,nil ,nil ,true,nil ,nil ,nil  ,	suftype =  ActStringFlag.WEAPON},
["撒网回收"]		= {true,nil ,nil ,nil ,nil,nil ,nil ,nil  ,	suftype =  ActStringFlag.WEAPON},
["弯腰抱酒坛"]		= {true,nil ,nil ,nil ,nil,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["跪地循环"]		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
-------------以下动作为“水上水中动作”
["水上漂"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
["水上站立"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
["水中站立"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
["水中死亡"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
["水中死亡循环"]  	= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
["水中移动"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
["入水"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
["出水"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},

------------------飞行动作
["飞行奔跑"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
["飞行站立"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
["飞行上马"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.COMMON},
["飞行跳起"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
["飞行跳空中"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
["飞行跳落地"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
["飞行挥鞭"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
["飞行受伤"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
["飞行原地转身"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
["飞行原地跳跃"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
["飞行刹车"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
["飞行小跑"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
["飞行行走"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
["飞行下马"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.COMMON},
["飞行小跑"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
["飞行行走"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
["飞行原地转身_L"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
["飞行原地转身_R"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
["飞行运动中转身_L"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
["飞行运动中转身_R"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
["飞行休闲动作2"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
["飞行休闲动作3"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
["飞行休闲动作4"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
["飞行休闲动作7"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},

["飞行翅膀向上"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
["飞行翅膀向上加速"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
["飞行翅膀向下"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
["飞行翅膀向下加速"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
["飞行翅膀向左"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
["飞行翅膀向左加速"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
["飞行翅膀向右"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
["飞行翅膀向右加速"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
["飞行翅膀垂直上升"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
["飞行翅膀运动中向上"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
["飞行翅膀上马"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.COMMON},
["飞行翅膀下马"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.COMMON},
["飞行翅膀奔跑"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
["飞行翅膀挥鞭"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
["飞行翅膀受伤"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
["飞行翅膀行走"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
["飞行翅膀向上刹车"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
["飞行翅膀刹车"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
["飞行翅膀站立"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
["飞行翅膀小跑"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
["飞行翅膀休闲1"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
["飞行翅膀休闲2"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
["飞行翅膀休闲3"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
["飞行翅膀休闲4"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},

------------------放风筝动作
["放风筝上马"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.COMMON},
["放风筝下马"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.COMMON},
["放风筝奔跑"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.COMMON},
["放风筝奔跑起步"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.COMMON},
["放风筝奔跑刹车"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.COMMON},
["放风筝站立"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.COMMON},
["放风筝休闲1"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.COMMON},
["放风筝休闲2"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.COMMON},
["放风筝交互动作2下"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.COMMON},
["放风筝交互动作1上"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.COMMON},

--花枝动作
["花枝站立"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
["花枝垂直上升"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
["花枝向下加速"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
["花枝挥鞭"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
["花枝奔跑"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
["花枝刹车"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
["花枝上马"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
["花枝下马"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
["花枝休闲动作2"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
["花枝休闲动作3"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
["花枝休闲动作4"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
["花枝休闲动作7"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
["花枝原地转身_L"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
["花枝原地转身_R"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
["花枝运动中转身_L"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
["花枝运动中转身_R"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
["花枝原地跳跃"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
["花枝跳起"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
["花枝跳循环"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
["花枝跳落地"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},

--花环动作
["花环上马"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
["花环下马"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
["花环运动中转身_L"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
["花环运动中转身_R"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
["花环受伤"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
["花环小跑"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
["花环行走"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
["花环原地跳跃"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
["花环跳起"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
["花环跳空中"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
["花环跳落地"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},

--水晶球动作
["坐地上循环"]  		= {nil, nil ,nil ,nil, nil ,nil ,true ,nil  ,	suftype =  ActStringFlag.COMMON},


--滑板动作
["滑板奔跑"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
["滑板刹车"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
["滑板行走"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
["滑板挥鞭"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
["滑板上马"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
["滑板受伤"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
["滑板跳空中"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
["滑板跳落地"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
["滑板跳起"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
["滑板下马"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
["滑板小跑"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
["滑板休闲动作2"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
["滑板休闲动作3"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
["滑板休闲动作4"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
["滑板休闲动作7"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
["滑板原地跳跃"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
["滑板站立"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
["滑板原地转身_L"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
["滑板原地转身_R"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
["滑板运动中转身_L"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
["滑板运动中转身_R"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
["滑板云奔跑"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
["滑板云挥鞭"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
["滑板剑休闲动作2"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
["滑板剑休闲动作3"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
["滑板剑休闲动作4"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
["滑板剑休闲动作7"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
--摩托动作
["摩托奔跑"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
["摩托刹车"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
["摩托行走"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
["摩托挥鞭"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
["摩托上马"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
["摩托受伤"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
["摩托跳空中"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
["摩托跳落地"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
["摩托跳起"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
["摩托下马"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
["摩托小跑"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
["摩托休闲动作2"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
["摩托休闲动作3"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
["摩托休闲动作4"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
["摩托休闲动作7"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
["摩托原地跳跃"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
["摩托站立"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
["摩托原地转身_L"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
["摩托原地转身_R"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
["摩托运动中转身_L"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
["摩托运动中转身_R"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},


--飞行相依相偎成女/萝莉
["飞行翅膀相依相偎小跑"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
["飞行翅膀相依相偎向下"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
["飞行翅膀相依相偎向上"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
["飞行翅膀相依相偎向上加速"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
["飞行翅膀相依相偎向下"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
["飞行翅膀相依相偎向下加速"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
["飞行翅膀相依相偎受伤"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
["飞行翅膀相依相偎抱中"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
["飞行翅膀相依相偎抱起"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
["飞行翅膀相依相偎起抱"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
["飞行翅膀相依相偎抱"] = {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
["飞行翅膀相依相偎垂直上升"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
["飞行翅膀相依相偎奔跑"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
["飞行翅膀相依相偎行走"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
["飞行翅膀相依相偎刹车"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
["飞行翅膀相依相偎挥鞭"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
["飞行翅膀相依相偎站立"] = {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},

--飞行相依相偎成男
["飞行翅膀相依相偎萝莉小跑"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
["飞行翅膀相依相偎萝莉向下"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
["飞行翅膀相依相偎萝莉向上"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
["飞行翅膀相依相偎萝莉向上加速"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
["飞行翅膀相依相偎萝莉向下"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
["飞行翅膀相依相偎萝莉向下加速"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
["飞行翅膀相依相偎萝莉受伤"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
["飞行翅膀相依相偎抱中"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
["飞行翅膀相依相偎抱起"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
["飞行翅膀相依相偎起抱"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
["飞行翅膀相依相偎萝莉垂直上升"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
["飞行翅膀相依相偎萝莉奔跑"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
["飞行翅膀相依相偎萝莉行走"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
["飞行翅膀相依相偎萝莉刹车"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
["飞行翅膀相依相偎萝莉挥鞭"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},

--奏乐相关
["弹琴开始"] = {true, nil ,nil ,nil,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["弹琴站立循环"] = {true, nil ,nil ,nil,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["弹琴演奏循环"] = {true, nil ,nil ,nil,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["弹琴演奏循环技能"] = {true, nil ,nil ,nil,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["弹琴施法"] = {true, nil ,nil ,nil,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["弹琴结束"] = {true, nil ,nil ,nil,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["弹琴一键施法"] = {true, nil ,nil ,nil,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["弹琴回血一键施法"] = {true, nil ,nil ,nil,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["弹琴休闲1"] = {true, nil ,nil ,nil,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["弹琴休闲2"] = {true, nil ,nil ,nil,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["吹笛开始"] = {true, nil ,nil ,nil,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["吹笛站立循环"] = {true, nil ,nil ,nil,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["吹笛演奏循环"] = {true, nil ,nil ,nil,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["吹笛演奏循环技能"] = {true, nil ,nil ,nil,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["吹笛施法"] = {true, nil ,nil ,nil,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["吹笛结束"] = {true, nil ,nil ,nil,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["吹笛一键施法"] = {true, nil ,nil ,nil,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["吹笛回血一键施法"] = {true, nil ,nil ,nil,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["吹笛休闲1"] = {true, nil ,nil ,nil,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["吹笛休闲2"] = {true, nil ,nil ,nil,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},

-------------以下动作为“常用动作”
---（连入时小心）理论上应有普通、绑定、骑乘、双骑四种，绑定部分在表情，部分缺失。
--动作名称		= {"pt","zd","zs","bq","cj",""  ,"qc","sq",		首选动作后缀},
--					   {"",  "",  "",  "",  "", "绑定","骑乘","双骑"} --中缀
["站立"]		= {true,nil ,nil ,nil ,nil ,nil ,true,true ,	suftype =  ActStringFlag.WEAPON},
["行走"]		= {true,nil ,nil ,nil ,nil ,nil ,true,true ,	suftype =  ActStringFlag.WEAPON},
["奔跑"]		= {true,nil ,nil ,nil ,nil ,nil ,true,true ,	suftype =  ActStringFlag.WEAPON},
["武器切换"]		= {true,nil ,nil ,nil ,nil ,nil ,true,true ,	suftype =  ActStringFlag.WEAPON},
["武器切换转"]		= {true,nil ,nil ,nil ,nil ,nil ,true,true ,	suftype =  ActStringFlag.WEAPON},
["武器转站立"]		= {true,nil ,nil ,nil ,nil ,nil ,true,true ,	suftype =  ActStringFlag.WEAPON},
["加速奔跑"]		= {nil,nil ,true ,nil ,nil ,nil ,true,true ,	suftype =  ActStringFlag.WEAPON},
["加速奔跑2"]		= {nil,nil ,true ,nil ,nil ,nil ,true,true ,	suftype =  ActStringFlag.WEAPON},
["冲刺"]		= {nil,nil ,true ,nil ,nil ,nil ,true,true ,	suftype =  ActStringFlag.WEAPON},
["加速奔跑缓冲"]	= {nil,nil ,true ,nil ,nil ,nil ,true,true ,	suftype =  ActStringFlag.WEAPON},
["挥鞭"]		= {nil,nil ,nil ,nil ,nil ,nil ,true,true ,	suftype =  ActStringFlag.WEAPON},
["刹车"]		= {nil,nil ,nil ,nil ,nil ,nil ,true,true ,	suftype =  ActStringFlag.WEAPON},
---（连入时小心）交谈建议加齐一套
["交谈"]		= {true,nil ,nil ,nil ,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.WEAPON},
["摆摊循环"]		= {true,nil ,nil ,nil ,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.WEAPON},
["连续吃药"] = {nil, true, nil, nil, nil, nil, nil, nil, suftype = ActStringFlag.COMMON},
["受伤1"]		= {true,nil ,nil ,nil ,nil ,nil ,true,true ,	suftype =  ActStringFlag.WEAPON},
["受伤2"]		= {true,nil ,nil ,nil ,nil ,nil ,true,true ,	suftype =  ActStringFlag.WEAPON},
["受伤3"]		= {true,nil ,nil ,nil ,nil ,nil ,true,true ,	suftype =  ActStringFlag.WEAPON},
["受伤4"]		= {true,nil ,nil ,nil ,nil ,nil ,true,true ,	suftype =  ActStringFlag.WEAPON},
["受伤5"]		= {true,nil ,nil ,nil ,nil ,nil ,true,true ,	suftype =  ActStringFlag.WEAPON},
["受伤6"]		= {true,nil ,nil ,nil ,nil ,nil ,true,true ,	suftype =  ActStringFlag.WEAPON},
["受伤7"]		= {true,nil ,nil ,nil ,nil ,nil ,true,true ,	suftype =  ActStringFlag.WEAPON},
["受伤8"]		= {true,nil ,nil ,nil ,nil ,nil ,true,true ,	suftype =  ActStringFlag.WEAPON},
["受伤9"]		= {true,nil ,nil ,nil ,nil ,nil ,true,true ,	suftype =  ActStringFlag.WEAPON},
["受伤10"]		= {true,nil ,nil ,nil ,nil ,nil ,true,true ,	suftype =  ActStringFlag.WEAPON},
["受伤11"]		= {true,nil ,nil ,nil ,nil ,nil ,true,true ,	suftype =  ActStringFlag.WEAPON},
["受伤12"]		= {true,nil ,nil ,nil ,nil ,nil ,true,true ,	suftype =  ActStringFlag.WEAPON},
["受伤13"]		= {true,nil ,nil ,nil ,nil ,nil ,true,true ,	suftype =  ActStringFlag.WEAPON},
["受伤14"]		= {true,nil ,nil ,nil ,nil ,nil ,true,true ,	suftype =  ActStringFlag.WEAPON},
---（连入时小心）跳跃循环动作命名不统一
["跳空中循环"]		= {true,nil ,nil ,nil ,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.WEAPON},
["跳空中"]		= {nil ,nil ,nil ,nil ,nil ,nil ,true,true ,	suftype =  ActStringFlag.WEAPON},
["跳落地"]		= {true,nil ,nil ,nil ,nil ,nil ,true,true ,	suftype =  ActStringFlag.WEAPON},
["跳起"]		= {true,nil ,nil ,nil ,nil ,nil ,true,true ,	suftype =  ActStringFlag.WEAPON},
["轻功起跳"]		= {nil,nil ,true ,nil ,nil ,nil ,true,true ,	suftype =  ActStringFlag.COMMON},
["一段跳"]		= {nil,nil ,true ,nil ,nil ,nil ,true,true ,	suftype =  ActStringFlag.WEAPON},
["二段跳"]		= {nil,nil ,true ,nil ,nil ,nil ,true,true ,	suftype =  ActStringFlag.WEAPON},
["三段跳"]		= {nil,nil ,true ,nil ,nil ,nil ,true,true ,	suftype =  ActStringFlag.WEAPON},
["四段跳"]		= {nil,nil ,true ,nil ,nil ,nil ,true,true ,	suftype =  ActStringFlag.WEAPON},
["空中循环"]		= {nil,nil ,true ,nil ,nil ,nil ,true,true ,	suftype =  ActStringFlag.WEAPON},
["落地准备"]		= {nil,nil ,true ,nil ,nil ,nil ,true,true ,	suftype =  ActStringFlag.WEAPON},
["一段跳1"]		= {nil,nil ,true ,nil ,nil ,nil ,true,true ,	suftype =  ActStringFlag.WEAPON},
["一段跳2"]		= {nil,nil ,true ,nil ,nil ,nil ,true,true ,	suftype =  ActStringFlag.WEAPON},
["一段跳3"]		= {nil,nil ,true ,nil ,nil ,nil ,true,true ,	suftype =  ActStringFlag.WEAPON},
["一段跳4"]		= {nil,nil ,true ,nil ,nil ,nil ,true,true ,	suftype =  ActStringFlag.WEAPON},
["一段跳5"]		= {nil,nil ,true ,nil ,nil ,nil ,true,true ,	suftype =  ActStringFlag.WEAPON},
["落地1"]		= {nil,nil ,true ,nil ,nil ,nil ,true,true ,	suftype =  ActStringFlag.WEAPON},
["落地2"]		= {nil,nil ,true ,nil ,nil ,nil ,true,true ,	suftype =  ActStringFlag.WEAPON},
["落地3"]		= {nil,nil ,true ,nil ,nil ,nil ,true,true ,	suftype =  ActStringFlag.WEAPON},
["落地4"]		= {nil,nil ,true ,nil ,nil ,nil ,true,true ,	suftype =  ActStringFlag.WEAPON},
["落地5"]		= {nil,nil ,true ,nil ,nil ,nil ,true,true ,	suftype =  ActStringFlag.WEAPON},
---（连入时小心）休闲动作命名不统一
["休闲动作1"]		= {true,nil ,nil ,nil ,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.WEAPON},
["休闲动作2"]		= {true,nil ,nil ,nil ,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.WEAPON},
["休闲动作3"]		= {true,nil ,nil ,nil ,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.WEAPON},
["休闲动作4"]		= {true,nil ,nil ,nil ,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.WEAPON},
["休闲动作5"]		= {true,nil ,nil ,nil ,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.WEAPON},
["休闲动作7"]		= {true,nil ,nil ,nil ,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.WEAPON},
["休闲动作"]		= {nil ,nil ,nil ,nil ,nil ,nil ,true,true ,	suftype =  ActStringFlag.WEAPON},
-------------“常用动作”结束
--动作名称			= {"pt","zd","zs","bq","cj",""  ,"qc","sq",		首选动作后缀},
["左站立碰撞"]		= {true,nil ,nil ,nil ,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["右站立碰撞"]		= {true,nil ,nil ,nil ,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["左行走碰撞"]		= {true,nil ,nil ,nil ,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["右行走碰撞"]		= {true,nil ,nil ,nil ,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["左奔跑碰撞"]		= {true,nil ,nil ,nil ,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["右奔跑碰撞"]		= {true,nil ,nil ,nil ,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["后碰撞"]			= {true,nil ,nil ,nil ,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["回城"]		= {true,nil ,nil ,nil ,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.WEAPON},
["回城循环"]		= {true,nil ,nil ,nil ,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.WEAPON},
["拾取"]		= {true,nil ,nil ,nil ,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.WEAPON},
["拾取循环"]		= {true,nil ,nil ,nil ,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.WEAPON},
["被击飞"]		= {true,nil ,nil ,nil ,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.WEAPON},
["被击退"]		= {true,nil ,nil ,nil ,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.WEAPON},
["被击晕"]		= {true,nil ,nil ,nil ,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.WEAPON},
["战斗站立"]		= {true,nil ,nil ,nil ,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.WEAPON},
["空手战斗站立"]	= {true,nil ,nil ,nil ,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.WEAPON},
["战斗行走"]		= {true,nil ,nil ,nil ,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.WEAPON},
["战斗奔跑"]		= {true,nil ,nil ,nil ,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.WEAPON},
["战场战斗奔跑"]	= {true,nil ,nil ,nil ,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["战斗奔跑1"]		= {true,nil ,nil ,nil ,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.WEAPON},
["战斗跳起"]		= {true,nil ,nil ,nil ,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.WEAPON},
["战斗跳空中循环"]	= {true,nil ,nil ,nil ,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.WEAPON},
["战斗跳落地"]		= {true,nil ,nil ,nil ,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.WEAPON},
["左平移"]		= {true,nil ,nil ,nil ,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.WEAPON},
["右平移"]		= {true,nil ,nil ,nil ,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.WEAPON},
["后平移"]		= {true,nil ,nil ,nil ,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.WEAPON},
["索敌后退"]		= {true,nil ,nil ,nil ,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.WEAPON},
["索敌前进"]		= {true,nil ,nil ,nil ,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.WEAPON},
["索敌右移"]		= {true,nil ,nil ,nil ,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.WEAPON},
["索敌左移"]		= {true,nil ,nil ,nil ,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.WEAPON},
["战场索敌后退"]	= {true,nil ,nil ,nil ,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["战场索敌前进"]	= {true,nil ,nil ,nil ,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["战场索敌右移"]	= {true,nil ,nil ,nil ,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["战场索敌左移"]	= {true,nil ,nil ,nil ,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.COMMON},
["格挡前进"]		= {nil,nil ,true ,nil ,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.WEAPON},
["格挡后退"]		= {nil,nil ,true ,nil ,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.WEAPON},
["格挡左移"]		= {nil,nil ,true ,nil ,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.WEAPON},
["格挡右移"]		= {nil,nil ,true ,nil ,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.WEAPON},
["被击倒"]		= {true,nil ,nil ,nil ,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.WEAPON},
["复活"]		= {true,nil ,nil ,nil ,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.WEAPON},
["打坐"]		= {true,nil ,nil ,nil ,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.WEAPON},
["打坐持续"]		= {true,nil ,nil ,nil ,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.WEAPON},
["传功"]		= {true,nil ,nil ,nil ,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.WEAPON},
["传功持续"]		= {true,nil ,nil ,nil ,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.WEAPON},
["死亡"]		= {true,nil ,nil ,nil ,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.WEAPON},
["死亡循环"]		= {true,nil ,nil ,nil ,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.WEAPON},
["原地跳跃"]		= {nil, nil ,nil ,nil ,nil ,nil ,true ,nil  ,	suftype =  ActStringFlag.WEAPON},
["原地转身_L"]		= {true,nil ,nil ,nil ,nil ,nil ,true ,nil  ,	suftype =  ActStringFlag.WEAPON},
["原地转身_R"]		= {true,nil ,nil ,nil ,nil ,nil ,true ,nil  ,	suftype =  ActStringFlag.WEAPON},
["运动中转身_L"]		= {true,nil ,nil ,nil ,nil ,nil ,true ,nil  ,	suftype =  ActStringFlag.WEAPON},
["运动中转身_R"]		= {true,nil ,nil ,nil ,nil ,nil ,true ,nil  ,	suftype =  ActStringFlag.WEAPON},
["原地180度转身_L"]	= {true,nil ,nil ,nil ,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.WEAPON},
["原地180度转身_R"]	= {true,nil ,nil ,nil ,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.WEAPON},
["变形坐骑"] = {nil, nil, nil, nil, nil, nil, true, nil, suftype = ActStringFlag.COMMON},
---（连入时小心）这些动作必定用于战斗中，但前缀只有pt
--动作名称	= {"pt","zd","zs","bq","cj",""  ,"qc","sq",		首选动作后缀},
["抽刀"]		= {true,nil ,nil ,nil ,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.WEAPON},
["收刀"]		= {true,nil ,nil ,nil ,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.WEAPON},
["双剑抽刀"]		= {true,nil ,nil ,nil ,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.WEAPON},
["双剑收刀"]		= {true,nil ,nil ,nil ,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.WEAPON},
["气宗抽刀"]		= {true,nil ,nil ,nil ,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.WEAPON},
["气宗收刀"]		= {true,nil ,nil ,nil ,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.WEAPON},
["双刀抽刀"]		= {true,nil ,nil ,nil ,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.WEAPON},
["双刀收刀"]		= {true,nil ,nil ,nil ,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.WEAPON},
["鞭法抽刀"]		= {true,nil ,nil ,nil ,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.WEAPON},
["鞭法收刀"]		= {true,nil ,nil ,nil ,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.WEAPON},
["攻击1"]		= {true,nil ,nil ,nil ,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.WEAPON},
["攻击2"]		= {true,nil ,nil ,nil ,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.WEAPON},
["攻击3"]		= {true,nil ,nil ,nil ,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.WEAPON},
["攻击4"]		= {true,nil ,nil ,nil ,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.WEAPON},
---新加的坐下等表现类动作（包括绑定动作
["坐下"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
["坐下循环"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
["起身"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
["攀爬_1"]  		= {nil ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.NONE},
["攀爬_2"]  		= {nil ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.NONE},
["攀爬_3"]  		= {nil ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.NONE},
["潜入东厂"]  		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
["海中孤岛跳跃"]  	= {nil ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
["海中孤岛跳跃2"]  	= {nil ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
["屠村副本大树躲藏"]  	= {nil ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.NONE},
["绑定滑下跳起"]  	= {nil ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.NONE},
["绑定滑下循环"]  	= {nil ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.NONE},
["绑定滑下落地"]  	= {nil ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.NONE},
["绳索爬_开始"]  	= {nil ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.NONE},
["绳索爬_循环"]  	= {nil ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.NONE},
["绳索爬_结束"]  	= {nil ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.NONE},
["CG用跳跃空中循环"]  	= {nil ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.NONE},
--["通用动作"]		= {"pt","zd","zs","bq","cj",""  ,"qc","sq",	首选动作后缀},
["摆酷"]		= {nil ,nil ,true,nil ,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.WEAPON},
["暴气"]		= {nil ,nil ,true,nil ,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.WEAPON},
["二段跳翻滚"]		= {nil ,nil ,true,nil ,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.WEAPON},
["二段跳滑翔"]		= {nil ,nil ,true,nil ,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.WEAPON},
["格挡"]		= {nil ,nil ,true,nil ,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.WEAPON},
["格挡反击"]		= {nil ,nil ,true,nil ,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.WEAPON},
["格挡击中1"]		= {nil ,nil ,true,nil ,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.WEAPON},
["格挡击中2"]		= {nil ,nil ,true,nil ,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.WEAPON},
["格挡击中3"]		= {nil ,nil ,true,nil ,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.WEAPON},
["格挡击中4"]		= {nil ,nil ,true,nil ,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.WEAPON},
["跪地"]		= {nil ,nil ,true,nil ,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.WEAPON},
["喝药"]		= {nil ,nil ,true,nil ,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.WEAPON},
["聚气"]		= {nil ,nil ,true,nil ,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.WEAPON},
["空中持续"]		= {nil ,nil ,true,nil ,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.WEAPON},
["空中滑翔"]		= {nil ,nil ,true,nil ,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.WEAPON},
["落地"]		= {nil ,nil ,true,nil ,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.WEAPON},
["起手"]		= {nil ,nil ,true,nil ,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.WEAPON},
["使用暗器"]		= {nil ,nil ,true,nil ,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.WEAPON},
["使用物品"]		= {nil ,nil ,true,nil ,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.WEAPON},
["挑衅"]		= {nil ,nil ,true,nil ,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.WEAPON},
["轻功1"]		= {nil ,nil ,true,nil ,nil ,nil ,true,true ,	suftype =  ActStringFlag.WEAPON},
["轻功2"]		= {nil ,nil ,true,nil ,nil ,nil ,true,true ,	suftype =  ActStringFlag.WEAPON},
["俯冲循环"]		= {nil ,nil ,true,nil ,nil ,nil ,nil ,nil ,	suftype =  ActStringFlag.WEAPON},
["俯冲落地翻滚"]= {nil ,nil ,true,nil ,nil ,nil ,nil ,nil ,	suftype =  ActStringFlag.WEAPON},
--["跳起"]		= {nil ,nil ,true,nil ,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.WEAPON},
------上面这个动作和普通动作有冲突，暂时注掉了，需要时可调整其一命名。
--特殊动作
["调息"]		= {nil ,nil ,true,nil ,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.WEAPON},
["位移闪躲"]		= {nil ,nil ,true,nil ,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.WEAPON},
["原地闪躲左"]		= {nil ,nil ,true,nil ,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.WEAPON},
["原地闪躲右"]		= {nil ,nil ,true,nil ,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.WEAPON},
["闪躲上"]		= {nil ,nil ,true,nil ,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.WEAPON},
["闪躲下"]		= {nil ,nil ,true,nil ,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.WEAPON},
["闪躲左"]		= {nil ,nil ,true,nil ,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.WEAPON},
["闪躲右"]		= {nil ,nil ,true,nil ,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.WEAPON},
["闪躲前"]		= {nil ,nil ,true,nil ,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.WEAPON},
["闪躲后"]		= {nil ,nil ,true,nil ,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.WEAPON},
["空中闪躲左"]		= {nil ,nil ,true,nil ,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.WEAPON},
["空中闪躲右"]		= {nil ,nil ,true,nil ,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.WEAPON},
["空中闪躲前"]		= {nil ,nil ,true,nil ,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.WEAPON},
["空中闪躲后"]		= {nil ,nil ,true,nil ,nil ,nil ,nil ,nil  ,	suftype =  ActStringFlag.WEAPON},
["翻桥"]  		= {nil ,nil ,true,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.COMMON},
["翻跟头"]		= {nil ,nil ,true,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
["空中前冲翻滚"]	= {nil ,nil ,true,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.WEAPON},
--["少林动作"]		= {"pt","zd","zs","bq","cj",""  ,"qc","sq",	首选动作后缀, 动作对应武器攻防类型},
["伸棍长打"]		= {nil ,true,nil ,nil ,nil ,nil ,nil ,nil  , suftype =  ActStringFlag.WEAPON},
["右刺"]		= {nil ,true,nil ,nil ,nil ,nil ,nil ,nil  , suftype =  ActStringFlag.WEAPON},
["左挑"]		= {nil ,true,nil ,nil ,nil ,nil ,nil ,nil  , suftype =  ActStringFlag.WEAPON},
["小左轮"]		= {nil ,true,nil ,nil ,nil ,nil ,nil ,nil  , suftype =  ActStringFlag.WEAPON},
["旋风棍"]		= {nil ,true,nil ,nil ,nil ,nil ,nil ,nil  , suftype =  ActStringFlag.WEAPON},
["反手直击"]		= {nil ,true,nil ,nil ,nil ,nil ,nil ,nil  , suftype =  ActStringFlag.WEAPON},
["背转碓"]		= {nil ,true,nil ,nil ,nil ,nil ,nil ,nil  , suftype =  ActStringFlag.WEAPON},
["暴气"]		= {nil ,nil,true ,nil ,nil ,nil ,nil ,nil  , suftype =  ActStringFlag.WEAPON},
["左横扫"]		= {nil ,true,nil ,nil ,nil ,nil ,nil ,nil  , suftype =  ActStringFlag.WEAPON},
["旋转右轮"]		= {nil ,true,nil ,nil ,nil ,nil ,nil ,nil  , suftype =  ActStringFlag.WEAPON},
["转身左横扫"]		= {nil ,true,nil ,nil ,nil ,nil ,nil ,nil  , suftype =  ActStringFlag.WEAPON},
["后向准备持续"]	= {nil ,true,nil ,nil ,nil ,nil ,nil ,nil  , suftype =  ActStringFlag.WEAPON},
["右向准备持续"]	= {nil ,true,nil ,nil ,nil ,nil ,nil ,nil  , suftype =  ActStringFlag.WEAPON},
["下劈弹棍"]		= {nil ,true,nil ,nil ,nil ,nil ,nil ,nil  , suftype =  ActStringFlag.WEAPON},
["小右下劈"]		= {nil ,true,nil ,nil ,nil ,nil ,nil ,nil  , suftype =  ActStringFlag.WEAPON},
["左碓转棍"]		= {nil ,true,nil ,nil ,nil ,nil ,nil ,nil  , suftype =  ActStringFlag.WEAPON},
["转你脸"]		= {nil ,true,nil ,nil ,nil ,nil ,nil ,nil  , suftype =  ActStringFlag.WEAPON},
["双绕大右扫"]		= {nil ,true,nil ,nil ,nil ,nil ,nil ,nil  , suftype =  ActStringFlag.WEAPON},
["转身下劈"]		= {nil ,true,nil ,nil ,nil ,nil ,nil ,nil  , suftype =  ActStringFlag.WEAPON},
["飞天脚"]		= {nil ,true,nil ,nil ,nil ,nil ,nil ,nil  , suftype =  ActStringFlag.WEAPON},
["转身抽棍"]		= {nil ,true,nil ,nil ,nil ,nil ,nil ,nil  , suftype =  ActStringFlag.WEAPON},
["战斗休闲"]		= {nil ,nil,true ,nil ,nil ,nil ,nil ,nil  , suftype =  ActStringFlag.WEAPON},
--["华山动作"]		= {"pt","zd","zs","bq","cj",""  ,"qc","sq",	首选动作后缀, 动作对应武器攻防类型},
["侧身翻"]		= {nil ,true,nil ,nil ,nil ,nil ,nil ,nil  , suftype =  ActStringFlag.WEAPON},
["侧手翻"]		= {nil ,true,nil ,nil ,nil ,nil ,nil ,nil  , suftype =  ActStringFlag.WEAPON},
["插地"]		= {nil ,true,nil ,nil ,nil ,nil ,nil ,nil  , suftype =  ActStringFlag.WEAPON},
["大斜上挑"]		= {nil ,true,nil ,nil ,nil ,nil ,nil ,nil  , suftype =  ActStringFlag.WEAPON},
["单脚斜下刺"]		= {nil ,true,nil ,nil ,nil ,nil ,nil ,nil  , suftype =  ActStringFlag.WEAPON},
["横跨步竖砍"]		= {nil ,true,nil ,nil ,nil ,nil ,nil ,nil  , suftype =  ActStringFlag.WEAPON},
["回剑准备"]		= {nil ,true,nil ,nil ,nil ,nil ,nil ,nil  , suftype =  ActStringFlag.WEAPON},
["回剑准备循环"]	= {nil ,true,nil ,nil ,nil ,nil ,nil ,nil  , suftype =  ActStringFlag.WEAPON},
["跨步撩剑"]		= {nil ,true,nil ,nil ,nil ,nil ,nil ,nil  , suftype =  ActStringFlag.WEAPON},
["跨步右砍"]		= {nil ,true,nil ,nil ,nil ,nil ,nil ,nil  , suftype =  ActStringFlag.WEAPON},
["连环踢1"]		= {nil ,true,nil ,nil ,nil ,nil ,nil ,nil  , suftype =  ActStringFlag.WEAPON},
["连环踢2"]		= {nil ,true,nil ,nil ,nil ,nil ,nil ,nil  , suftype =  ActStringFlag.WEAPON},
["连环踢3"]		= {nil ,true,nil ,nil ,nil ,nil ,nil ,nil  , suftype =  ActStringFlag.WEAPON},
["平刺"]		= {nil ,true,nil ,nil ,nil ,nil ,nil ,nil  , suftype =  ActStringFlag.WEAPON},
["仆步竖砍"]		= {nil ,true,nil ,nil ,nil ,nil ,nil ,nil  , suftype =  ActStringFlag.WEAPON},
["前刺"]		= {nil ,true,nil ,nil ,nil ,nil ,nil ,nil  , suftype =  ActStringFlag.WEAPON},
["绕身绕剑"]		= {nil ,true,nil ,nil ,nil ,nil ,nil ,nil  , suftype =  ActStringFlag.WEAPON},
["身前绕剑"]		= {nil ,true,nil ,nil ,nil ,nil ,nil ,nil  , suftype =  ActStringFlag.WEAPON},
["身前绕剑循环"]	= {nil ,true,nil ,nil ,nil ,nil ,nil ,nil  , suftype =  ActStringFlag.WEAPON},
["竖砍收剑"]		= {nil ,true,nil ,nil ,nil ,nil ,nil ,nil  , suftype =  ActStringFlag.WEAPON},
["头顶绕剑"]		= {nil ,true,nil ,nil ,nil ,nil ,nil ,nil  , suftype =  ActStringFlag.WEAPON},
["头顶绕剑循环"]	= {nil ,true,nil ,nil ,nil ,nil ,nil ,nil  , suftype =  ActStringFlag.WEAPON},
["下扫腿"]		= {nil ,true,nil ,nil ,nil ,nil ,nil ,nil  , suftype =  ActStringFlag.WEAPON},
["小右砍"]		= {nil ,true,nil ,nil ,nil ,nil ,nil ,nil  , suftype =  ActStringFlag.WEAPON},
["小左砍"]		= {nil ,true,nil ,nil ,nil ,nil ,nil ,nil  , suftype =  ActStringFlag.WEAPON},
["旋风腿"]		= {nil ,true,nil ,nil ,nil ,nil ,nil ,nil  , suftype =  ActStringFlag.WEAPON},
["旋风腿循环"]		= {nil ,true,nil ,nil ,nil ,nil ,nil ,nil  , suftype =  ActStringFlag.WEAPON},
["旋转上撩剑"]		= {nil ,true,nil ,nil ,nil ,nil ,nil ,nil  , suftype =  ActStringFlag.WEAPON},
["旋转下劈剑"]		= {nil ,true,nil ,nil ,nil ,nil ,nil ,nil  , suftype =  ActStringFlag.WEAPON},
["右侧绕剑"]		= {nil ,true,nil ,nil ,nil ,nil ,nil ,nil  , suftype =  ActStringFlag.WEAPON},
["右劈"]		= {nil ,true,nil ,nil ,nil ,nil ,nil ,nil  , suftype =  ActStringFlag.WEAPON},
["转身跳砍"]		= {nil ,true,nil ,nil ,nil ,nil ,nil ,nil  , suftype =  ActStringFlag.WEAPON},
["左砍"]		= {nil ,true,nil ,nil ,nil ,nil ,nil ,nil  , suftype =  ActStringFlag.WEAPON},
["左斜上挑"]		= {nil ,true,nil ,nil ,nil ,nil ,nil ,nil  , suftype =  ActStringFlag.WEAPON},
["右斜刺"]		= {nil ,true,nil ,nil ,nil ,nil ,nil ,nil  , suftype =  ActStringFlag.WEAPON},
["左斜刺"]		= {nil ,true,nil ,nil ,nil ,nil ,nil ,nil  , suftype =  ActStringFlag.WEAPON},
["气宗站立"]		= {true ,nil,nil ,nil ,nil ,nil ,nil ,nil  , suftype =  ActStringFlag.WEAPON},
--["东华动作"]		= {"pt","zd","zs","bq","cj",""  ,"qc","sq",	首选动作后缀, 动作对应武器攻防类型},
["狂风站立"]		= {true ,nil,nil ,nil ,nil ,nil ,nil ,nil  , suftype =  ActStringFlag.WEAPON},
["东华索敌前进"]		= {true ,nil,nil ,nil ,nil ,nil ,nil ,nil  , suftype =  ActStringFlag.WEAPON},
["东华索敌左移"]		= {true ,nil,nil ,nil ,nil ,nil ,nil ,nil  , suftype =  ActStringFlag.WEAPON},
["东华索敌右移"]		= {true ,nil,nil ,nil ,nil ,nil ,nil ,nil  , suftype =  ActStringFlag.WEAPON},
["东华索敌后退"]		= {true ,nil,nil ,nil ,nil ,nil ,nil ,nil  , suftype =  ActStringFlag.WEAPON},
--["各门派姿态动作"]	= {"pt","zd","zs","bq","cj",""  ,"qc","sq",	首选动作后缀, 动作对应武器攻防类型},
["举鞭子架构"]		= {true ,nil,nil ,nil ,nil ,nil ,nil ,nil  , suftype =  ActStringFlag.WEAPON},
["御剑战斗站立"]	= {true ,nil,nil ,nil ,nil ,nil ,nil ,nil  , suftype =  ActStringFlag.WEAPON},
--["武当索敌动作"]	= {"pt","zd","zs","bq","cj",""  ,"qc","sq",	首选动作后缀, 动作对应武器攻防类型},
["御剑索敌右移"]	= {true ,nil,nil ,nil ,nil ,nil ,nil ,nil  , suftype =  ActStringFlag.WEAPON},
["御剑索敌左移"]	= {true ,nil,nil ,nil ,nil ,nil ,nil ,nil  , suftype =  ActStringFlag.WEAPON},
["御剑索敌前进"]	= {true ,nil,nil ,nil ,nil ,nil ,nil ,nil  , suftype =  ActStringFlag.WEAPON},
["御剑索敌后退"]	= {true ,nil,nil ,nil ,nil ,nil ,nil ,nil  , suftype =  ActStringFlag.WEAPON},
--["衡山索敌动作"]	= {"pt","zd","zs","bq","cj",""  ,"qc","sq",	首选动作后缀, 动作对应武器攻防类型},
["武器索敌右移"]	= {true ,nil,nil ,nil ,nil ,nil ,nil ,nil  , suftype =  ActStringFlag.WEAPON},
["武器索敌左移"]	= {true ,nil,nil ,nil ,nil ,nil ,nil ,nil  , suftype =  ActStringFlag.WEAPON},
["武器索敌前进"]	= {true ,nil,nil ,nil ,nil ,nil ,nil ,nil  , suftype =  ActStringFlag.WEAPON},
["武器索敌后退"]	= {true ,nil,nil ,nil ,nil ,nil ,nil ,nil  , suftype =  ActStringFlag.WEAPON},
--["唐门索敌动作"]	= {"pt","zd","zs","bq","cj",""  ,"qc","sq",	首选动作后缀, 动作对应武器攻防类型},
["组合索敌右移"]	= {true ,nil,nil ,nil ,nil ,nil ,nil ,nil  , suftype =  ActStringFlag.WEAPON},
["组合索敌左移"]	= {true ,nil,nil ,nil ,nil ,nil ,nil ,nil  , suftype =  ActStringFlag.WEAPON},
["组合索敌前进"]	= {true ,nil,nil ,nil ,nil ,nil ,nil ,nil  , suftype =  ActStringFlag.WEAPON},
["组合索敌后退"]	= {true ,nil,nil ,nil ,nil ,nil ,nil ,nil  , suftype =  ActStringFlag.WEAPON},
--["峨嵋索敌动作"]	= {"pt","zd","zs","bq","cj",""  ,"qc","sq",	首选动作后缀, 动作对应武器攻防类型},
["空手索敌右移"]	= {true ,nil,nil ,nil ,nil ,nil ,nil ,nil  , suftype =  ActStringFlag.WEAPON},
["空手索敌左移"]	= {true ,nil,nil ,nil ,nil ,nil ,nil ,nil  , suftype =  ActStringFlag.WEAPON},
["空手索敌前进"]	= {true ,nil,nil ,nil ,nil ,nil ,nil ,nil  , suftype =  ActStringFlag.WEAPON},
["空手索敌后退"]	= {true ,nil,nil ,nil ,nil ,nil ,nil ,nil  , suftype =  ActStringFlag.WEAPON},
--["其它门派动作"]	= {"pt","zd","zs","bq","cj",""  ,"qc","sq",	首选动作后缀, 动作对应武器攻防类型},
["右斩"]		= {nil ,true,nil ,nil ,nil ,nil ,nil ,nil  , suftype =  ActStringFlag.WEAPON},
["上挑"]		= {nil ,true,nil ,nil ,nil ,nil ,nil ,nil  , suftype =  ActStringFlag.WEAPON},
["左手刺击"]		= {nil ,true,nil ,nil ,nil ,nil ,nil ,nil  , suftype =  ActStringFlag.WEAPON},
["右手刺击"]		= {nil ,true,nil ,nil ,nil ,nil ,nil ,nil  , suftype =  ActStringFlag.WEAPON},
["小右撩剑"]		= {nil ,true,nil ,nil ,nil ,nil ,nil ,nil  , suftype =  ActStringFlag.WEAPON},
["左一下"]		= {nil ,true,nil ,nil ,nil ,nil ,nil ,nil  , suftype =  ActStringFlag.WEAPON},
["小右下砍"]		= {nil ,true,nil ,nil ,nil ,nil ,nil ,nil  , suftype =  ActStringFlag.WEAPON},
["小左下砍"]		= {nil ,true,nil ,nil ,nil ,nil ,nil ,nil  , suftype =  ActStringFlag.WEAPON},
["绕头直抽"]		= {nil ,true,nil ,nil ,nil ,nil ,nil ,nil  , suftype =  ActStringFlag.WEAPON},
["上绕抽"]		= {nil ,true,nil ,nil ,nil ,nil ,nil ,nil  , suftype =  ActStringFlag.WEAPON},
["合扇攻击1"]		= {nil ,true,nil ,nil ,nil ,nil ,nil ,nil  , suftype =  ActStringFlag.WEAPON},
["合扇攻击3"]		= {nil ,true,nil ,nil ,nil ,nil ,nil ,nil  , suftype =  ActStringFlag.WEAPON},
["左直拳"]		= {nil ,true,nil ,nil ,nil ,nil ,nil ,nil  , suftype =  ActStringFlag.WEAPON},
["左摆拳"]		= {nil ,true,nil ,nil ,nil ,nil ,nil ,nil  , suftype =  ActStringFlag.WEAPON},
["小右下抡"]		= {nil ,true,nil ,nil ,nil ,nil ,nil ,nil  , suftype =  ActStringFlag.WEAPON},
["小左横抡"]		= {nil ,true,nil ,nil ,nil ,nil ,nil ,nil  , suftype =  ActStringFlag.WEAPON},
--动作名称（其它）	= {"pt","zd","zs","bq","cj",""  ,"qc","sq",		首选动作后缀},
["新人界面演武"]  	= {nil ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.NONE},
["少林界面演武"]  	= {nil ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.NONE},
["武当界面演武"]  	= {nil ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.NONE},
["华山界面演武"]  	= {nil ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.NONE},
["恒山界面演武"]  	= {nil ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.NONE},
["衡山界面演武"]  	= {nil ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.NONE},
["日月界面演武"]  	= {nil ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.NONE},
["五毒界面演武"]  	= {nil ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.NONE},
["唐门界面演武"]  	= {nil ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.NONE},
["逍遥界面演武"]  	= {nil ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.NONE},
["峨嵋界面演武"]  	= {nil ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.NONE},
["新手创建动作1"]  	= {nil ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.NONE},
["新手创建动作2"]  	= {nil ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.NONE},
["新手创建动作3"]  	= {nil ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.NONE},
["新手创建动作4"] 	= {nil ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.NONE},
["新手创建动作5"]  	= {nil ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.NONE},
["新手创建动作6"]  	= {nil ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.NONE},
["新手创建动作4"] 	= {nil ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.NONE},
["新手创建动作5"]  	= {nil ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.NONE},
["新手创建动作6"]  	= {nil ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.NONE},
["选人"]		= {true ,nil ,nil ,nil ,nil ,nil ,nil ,nil ,	suftype =  ActStringFlag.COMMON},
["zd_施法蓄力5_日月"]		= {nil ,nil, nil ,nil ,nil ,nil ,nil ,nil  , suftype =  ActStringFlag.NONE},
["变身绝技2"] = {nil ,true,nil ,nil ,nil ,nil ,nil ,nil  , suftype =  ActStringFlag.WEAPON},
--临时测测试动作
["111"]			= {nil ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.NONE},
["222"]			= {nil ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.NONE},
["333"]  		= {nil ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.NONE},
["普通攻击1"]		= {nil ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.NONE},
["普通攻击2"]  		= {nil ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.NONE},
["技能攻击1"]		= {nil ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.NONE},
["技能攻击2"]  		= {nil ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , 	suftype =  ActStringFlag.NONE},
--["避邪剑法敌动作"]	= {"pt","zd","zs","bq","cj",""  ,"qc","sq",	首选动作后缀, 动作对应武器攻防类型},
["避邪剑法索敌移动右"]	= {nil ,true,nil ,nil ,nil ,nil ,nil ,nil  , suftype =  ActStringFlag.COMMON},
["避邪剑法索敌移动左"]	= {nil ,true,nil ,nil ,nil ,nil ,nil ,nil  , suftype =  ActStringFlag.COMMON},
["避邪剑法索敌移动前"]	= {nil ,true,nil ,nil ,nil ,nil ,nil ,nil  , suftype =  ActStringFlag.COMMON},
["避邪剑法索敌移动后"]	= {nil ,true,nil ,nil ,nil ,nil ,nil ,nil  , suftype =  ActStringFlag.COMMON},
["避邪剑法加速跑"]	= {nil ,true,nil ,nil ,nil ,nil ,nil ,nil  , suftype =  ActStringFlag.COMMON},
--舞蹈类表情动作
["泡沫舞蹈"]		= {true, nil, nil, nil, nil, nil, nil, nil,	suftype = ActStringFlag.COMMON},
["东方姑娘舞蹈"]	= {true, nil, nil, nil, nil, nil, nil, nil,	suftype = ActStringFlag.COMMON},
["任我行舞蹈"]		= {true, nil, nil, nil, nil, nil, nil, nil,	suftype = ActStringFlag.COMMON},
["仪琳舞蹈"]		= {true, nil, nil, nil, nil, nil, nil, nil,	suftype = ActStringFlag.COMMON},
["田伯光舞蹈"]		= {true, nil, nil, nil, nil, nil, nil, nil,	suftype = ActStringFlag.COMMON},
["飞天舞蹈"]		= {true, nil, nil, nil, nil, nil, nil, nil,	suftype = ActStringFlag.COMMON},
["备用4舞蹈"]		= {true, nil, nil, nil, nil, nil, nil, nil,	suftype = ActStringFlag.COMMON},
["东方姑娘舞蹈2016比赛"]		= {true, nil, nil, nil, nil, nil, nil, nil,	suftype = ActStringFlag.COMMON},
["任我行舞蹈2016比赛"]		= {true, nil, nil, nil, nil, nil, nil, nil,	suftype = ActStringFlag.COMMON},
["岳灵珊舞蹈"]		= {true, nil, nil, nil, nil, nil, nil, nil,	suftype = ActStringFlag.COMMON},
["林平之舞蹈"]		= {true, nil, nil, nil, nil, nil, nil, nil,	suftype = ActStringFlag.COMMON},
["备用1舞蹈"]		= {true, nil, nil, nil, nil, nil, nil, nil,	suftype = ActStringFlag.COMMON},
["备用3舞蹈"]		= {true, nil, nil, nil, nil, nil, nil, nil,	suftype = ActStringFlag.COMMON},
["拳击舞蹈"]		= {true, nil, nil, nil, nil, nil, nil, nil,	suftype = ActStringFlag.COMMON},
["令狐冲舞蹈"]		= {true, nil, nil, nil, nil, nil, nil, nil,	suftype = ActStringFlag.COMMON},
["任盈盈舞蹈"]		= {true, nil, nil, nil, nil, nil, nil, nil,	suftype = ActStringFlag.COMMON},
["芭蕾舞蹈"]		= {true, nil, nil, nil, nil, nil, nil, nil,	suftype = ActStringFlag.COMMON},
["花式足球"]		= {true, nil, nil, nil, nil, nil, nil, nil,	suftype = ActStringFlag.COMMON},
["清秋舞蹈"]		= {true, nil, nil, nil, nil, nil, nil, nil,	suftype = ActStringFlag.COMMON},
["蓝凤凰舞蹈"]		= {true, nil, nil, nil, nil, nil, nil, nil,	suftype = ActStringFlag.COMMON},
["清秋_青烟装舞蹈"]		= {true, nil, nil, nil, nil, nil, nil, nil,	suftype = ActStringFlag.COMMON},
["背饰休闲追光"]		= {true, nil, nil, nil, nil, nil, nil, nil,	suftype = ActStringFlag.COMMON},
["第二批备用舞蹈"]		= {true, nil, nil, nil, nil, nil, nil, nil,	suftype = ActStringFlag.COMMON},  --复制上面的一行，将[“”]内的名称换成舞蹈动作名即可。
["甩肩开始"]		= {true, nil, nil, nil, nil, nil, nil, nil,	suftype = ActStringFlag.COMMON},
["甩肩循环"]		= {true, nil, nil, nil, nil, nil, nil, nil,	suftype = ActStringFlag.COMMON},
["甩肩结束"]		= {true, nil, nil, nil, nil, nil, nil, nil,	suftype = ActStringFlag.COMMON},
["仙气飘飘舞蹈"]	= {true, nil, nil, nil, nil, nil, nil, nil,	suftype = ActStringFlag.COMMON},
["哪吒舞蹈"]		= {true, nil, nil, nil, nil, nil, nil, nil,	suftype = ActStringFlag.COMMON},
["韩风舞蹈"]		= {true, nil, nil, nil, nil, nil, nil, nil,	suftype = ActStringFlag.COMMON},
["姝颜千翊舞蹈"]		= {true, nil, nil, nil, nil, nil, nil, nil,	suftype = ActStringFlag.COMMON},
["极乐净土舞蹈"]		= {true, nil, nil, nil, nil, nil, nil, nil,	suftype = ActStringFlag.COMMON},
--武罗动作
["变身招式1"]		= {nil ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , suftype =  ActStringFlag.WEAPON},
["变身招式2"]		= {nil ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , suftype =  ActStringFlag.WEAPON},
["变身招式3"]		= {nil ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , suftype =  ActStringFlag.WEAPON},
["变身招式4"]		= {nil ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , suftype =  ActStringFlag.WEAPON},
["变身绝技1"]		= {nil ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , suftype =  ActStringFlag.WEAPON},
["变身绝技2"]		= {nil ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , suftype =  ActStringFlag.WEAPON},
["变身绝技4"]		= {nil ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , suftype =  ActStringFlag.WEAPON},
["变身绝技5"]		= {nil ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , suftype =  ActStringFlag.WEAPON},
["变身绝技6"]		= {nil ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , suftype =  ActStringFlag.WEAPON},
["变身绝技7"]		= {nil ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , suftype =  ActStringFlag.WEAPON},
["变身绝技3"]		= {nil ,nil ,nil ,nil ,nil ,nil ,nil ,nil  , suftype =  ActStringFlag.WEAPON},

--测试用
["冰弓战斗准备"]	= {nil, true, nil, nil, nil, nil, nil, nil, suftype = ActStringFlag.COMMON},
["手部武器战斗准备"]= {nil, true, nil, nil, nil, nil, nil, nil, suftype = ActStringFlag.COMMON},
["zd_武器切换拿出_飞轮"]	= {nil, nil, nil, nil, nil, nil, nil, nil, suftype = ActStringFlag.NONE},	--配成none是为了避免对以前的动作产生影响
["zd_武器切换拿出_毒针"]	= {nil, nil, nil, nil, nil, nil, nil, nil, suftype = ActStringFlag.NONE},
["zd_武器切换拿出_毒烟"]	= {nil, nil, nil, nil, nil, nil, nil, nil, suftype = ActStringFlag.NONE},
["zd_武器切换拿出_火箭拳"]	= {nil, nil, nil, nil, nil, nil, nil, nil, suftype = ActStringFlag.NONE},
["zd_武器切换拿出_冰弓"]	= {nil, nil, nil, nil, nil, nil, nil, nil, suftype = ActStringFlag.NONE},
["zd_武器切换拿出_喷火器"]	= {nil, nil, nil, nil, nil, nil, nil, nil, suftype = ActStringFlag.NONE},
["zd_武器切换拿出_拳刃"]	= {nil, nil, nil, nil, nil, nil, nil, nil, suftype = ActStringFlag.NONE},
["zd_武器切换收起_飞轮"]	= {nil, nil, nil, nil, nil, nil, nil, nil, suftype = ActStringFlag.NONE},	--配成none是为了避免对以前的动作产生影响
["zd_武器切换收起_毒针"]	= {nil, nil, nil, nil, nil, nil, nil, nil, suftype = ActStringFlag.NONE},
["zd_武器切换收起_毒烟"]	= {nil, nil, nil, nil, nil, nil, nil, nil, suftype = ActStringFlag.NONE},
["zd_武器切换收起_火箭拳"]	= {nil, nil, nil, nil, nil, nil, nil, nil, suftype = ActStringFlag.NONE},
["zd_武器切换收起_冰弓"]	= {nil, nil, nil, nil, nil, nil, nil, nil, suftype = ActStringFlag.NONE},
["zd_武器切换收起_喷火器"]	= {nil, nil, nil, nil, nil, nil, nil, nil, suftype = ActStringFlag.NONE},
["zd_武器切换收起_拳刃"]	= {nil, nil, nil, nil, nil, nil, nil, nil, suftype = ActStringFlag.NONE},
["战场换弹"]			   = {true, nil, nil, nil, nil, nil, nil, nil, suftype = ActStringFlag.COMMON},
}------------------------------------------------------------


------------------人物游戏职业动作调用配置------------------
-------------------act config by faction--------------------
FactionList =
{
--职业ID	= {通用后缀,       门派专用攻防类型,  门派名称,   未作完的替代名, 武器变形1, 武器变形2, 武器变形3  },
[1]			= {s_cmn = "通用", w_spe = 0, s_spe = "通用", s_tmp = "完成", s_chg1 = "", s_chg2 = "", s_chg3 = ""},
[2]			= {s_cmn = "通用", w_spe = 1, s_spe = "少林", s_tmp = "完成", s_chg1 = "", s_chg2 = "", s_chg3 = ""},
[3]			= {s_cmn = "通用", w_spe = 2, s_spe = "武当", s_tmp = "完成", s_chg1 = "", s_chg2 = "", s_chg3 = ""},
[4]			= {s_cmn = "通用", w_spe = 3, s_spe = "华山", s_tmp = "完成", s_chg1 = "", s_chg2 = "", s_chg3 = ""},
[5]			= {s_cmn = "通用", w_spe = 4, s_spe = "恒山", s_tmp = "----", s_chg1 = "", s_chg2 = "", s_chg3 = ""},
[6]			= {s_cmn = "通用", w_spe = 5, s_spe = "衡山", s_tmp = "----", s_chg1 = "", s_chg2 = "", s_chg3 = ""},
[7]			= {s_cmn = "通用", w_spe = 6, s_spe = "日月", s_tmp = "----", s_chg1 = "", s_chg2 = "", s_chg3 = ""},
[8]			= {s_cmn = "通用", w_spe = 7, s_spe = "五毒", s_tmp = "----", s_chg1 = "", s_chg2 = "", s_chg3 = ""},
[9]			= {s_cmn = "通用", w_spe = 8, s_spe = "逍遥", s_tmp = "----", s_chg1 = "", s_chg2 = "", s_chg3 = ""},
[10]		= {s_cmn = "通用", w_spe = 9, s_spe = "唐门", s_tmp = "----", s_chg1 = "", s_chg2 = "", s_chg3 = ""},
[11]		= {s_cmn = "通用", w_spe = 10, s_spe = "峨嵋", s_tmp = "----", s_chg1 = "", s_chg2 = "", s_chg3 = ""},
[12]		= {s_cmn = "通用", w_spe = 11, s_spe = "无名", s_tmp = "----", s_chg1 = "", s_chg2 = "", s_chg3 = ""},
[13]		= {s_cmn = "通用", w_spe = 12, s_spe = "武罗", s_tmp = "----", s_chg1 = "", s_chg2 = "", s_chg3 = ""},
[14]		= {s_cmn = "通用", w_spe = 0, s_spe = "东华", s_tmp = "----", s_chg1 = "", s_chg2 = "", s_chg3 = ""},
--从以下起，理论上暂不会被调用，拷虑到将来的扩展性以及可能要制作的内容（如宠物），所以先扩了
[15]		= {s_cmn = "通用", w_spe = 0, s_spe = "通用", s_tmp = "----", s_chg1 = "", s_chg2 = "", s_chg3 = ""},
--新大逃杀开始
[16]		= {s_cmn = "通用", w_spe = 0, s_spe = "通用"--[["飞轮"]], s_tmp = "----", s_chg1 = "", s_chg2 = "", s_chg3 = ""},
[17]		= {s_cmn = "通用", w_spe = 0, s_spe = "通用"--[["毒针"]], s_tmp = "----", s_chg1 = "", s_chg2 = "", s_chg3 = ""},
[18]		= {s_cmn = "通用", w_spe = 0, s_spe = "通用"--[["毒烟"]], s_tmp = "----", s_chg1 = "", s_chg2 = "", s_chg3 = ""},
[19]		= {s_cmn = "通用", w_spe = 0, s_spe = "通用"--[["火箭拳"]], s_tmp = "----", s_chg1 = "", s_chg2 = "", s_chg3 = ""},
[20]		= {s_cmn = "通用", w_spe = 0, s_spe = "通用"--[["冰弓"]], s_tmp = "----", s_chg1 = "", s_chg2 = "", s_chg3 = ""},
[21]		= {s_cmn = "通用", w_spe = 0, s_spe = "通用"--[["喷火器"]], s_tmp = "----", s_chg1 = "", s_chg2 = "", s_chg3 = ""},
[22]		= {s_cmn = "通用", w_spe = 0, s_spe = "通用", s_tmp = "----", s_chg1 = "", s_chg2 = "", s_chg3 = ""},
[23]		= {s_cmn = "通用", w_spe = 0, s_spe = "通用", s_tmp = "----", s_chg1 = "", s_chg2 = "", s_chg3 = ""},
--新大逃杀结束，预留两个
[24]		= {s_cmn = "通用", w_spe = 0, s_spe = "通用", s_tmp = "----", s_chg1 = "", s_chg2 = "", s_chg3 = ""},
[25]		= {s_cmn = "通用", w_spe = 0, s_spe = "通用", s_tmp = "----", s_chg1 = "", s_chg2 = "", s_chg3 = ""},
[26]		= {s_cmn = "通用", w_spe = 0, s_spe = "通用", s_tmp = "----", s_chg1 = "", s_chg2 = "", s_chg3 = ""},
[27]		= {s_cmn = "通用", w_spe = 0, s_spe = "通用", s_tmp = "----", s_chg1 = "", s_chg2 = "", s_chg3 = ""},
[28]		= {s_cmn = "通用", w_spe = 0, s_spe = "通用", s_tmp = "----", s_chg1 = "", s_chg2 = "", s_chg3 = ""},
[29]		= {s_cmn = "通用", w_spe = 0, s_spe = "通用", s_tmp = "----", s_chg1 = "", s_chg2 = "", s_chg3 = ""},
[30]		= {s_cmn = "通用", w_spe = 0, s_spe = "通用", s_tmp = "----", s_chg1 = "", s_chg2 = "", s_chg3 = ""},
[31]		= {s_cmn = "通用", w_spe = 0, s_spe = "通用", s_tmp = "----", s_chg1 = "", s_chg2 = "", s_chg3 = ""},
[32]		= {s_cmn = "通用", w_spe = 0, s_spe = "通用", s_tmp = "----", s_chg1 = "", s_chg2 = "", s_chg3 = ""},
}
------------------------------------------------------------



---------------------人物武型类型配置-----------------------
---------------------weapon type list ----------------------
WeaponList =
{
--武器ID	= {名称,				武器变形1,			武器变形2,			武器变形3},
[1]			= {str = "普通",	 	[0] = "格挡",			[1] = nil,			[2] = nil,			[3] = nil},
[2]			= {str = "结棍",		[0] = "格挡",			[1] = nil,			[2] = "空手",		[3] = "武器转站立"},
[3]			= {str = "大剑",		[0] = "格挡",			[1] = nil,			[2] = "御剑战斗站立",		[3] = nil},
[4]			= {str = "单剑",	 	[0] = "格挡",			[1] = nil,			[2] = "气宗站立",		[3] = nil},
[5]			= {str = "双剑",	 	[0] = "格挡",			[1] = nil,			[2] = "武器转站立",		[3] = nil},
[6]			= {str = "琴剑",		[0] = "格挡",			[1] = nil,			[2] = "武器转站立",		[3] = nil},
[7]			= {str = "双刃",	 	[0] = "格挡",			[1] = "武器转站立",		[2] = nil,			[3] = nil},
[8]			= {str = "鞭子",	 	[0] = "格挡",			[1] = "举鞭子架构",		[2] = nil,			[3] = "格挡"},
[9]			= {str = "扇子",	 	[0] = "武器转站立",		[1] = nil,			[2] = nil,			[3] = "格挡"},
[10]		= {str = "拳刃",	 	[0] = "格挡",			[1] = nil,			[2] = "武器转站立",		[3] = nil},
[11]		= {str = "法杖",	 	[0] = "格挡",			[1] = nil,			[2] = "武器转站立",			[3] = nil},
[12]		= {str = "重锤",	 	[0] = "格挡",			[1] = nil,			[2] = "武器转站立",			[3] = nil},
[13]		= {str = "待定20",	 	[1] = nil,			[2] = nil,			[3] = nil},
[14]		= {str = "细剑",	 	[0] = "格挡",			[1] = "狂风站立",			[2] = nil,			[3] = nil},
[15]		= {str = "待定18",	 	[1] = nil,	 		[2] = nil,			[3] = nil},
-- 新大逃杀
[16]		= {str = "飞轮",	 	[0] = "格挡",			[1] = "手部武器战斗准备",	 [2] = "手部武器战斗准备",	[3] = "手部武器战斗准备"},
[17]		= {str = "毒针",	 	[0] = "格挡",			[1] = "手部武器战斗准备",	 [2] = "手部武器战斗准备",	[3] = "手部武器战斗准备"},
[18]		= {str = "毒烟",	 	[0] = "格挡",			[1] = "手部武器战斗准备",	 [2] = "手部武器战斗准备",	[3] = "手部武器战斗准备"},
[19]		= {str = "火箭拳",	 	[0] = "格挡",			[1] = "手部武器战斗准备",	 [2] = "手部武器战斗准备",	[3] = "手部武器战斗准备"},
[20]		= {str = "冰弓",	 	[0] = "格挡",			[1] = "冰弓战斗准备",	 	[2] = "冰弓战斗准备",	[3] = "冰弓战斗准备"},
[21]		= {str = "喷火器",	 	[0] = "格挡",			[1] = "手部武器战斗准备",	 [2] = "手部武器战斗准备",	[3] = "手部武器战斗准备"},
[22]		= {str = "冰扇",	 	[0] = "格挡",			[1] = "手部武器战斗准备",	[2] = "手部武器战斗准备",	[3] = "手部武器战斗准备"},
[23]		= {str = "大逃杀预留2",	 	[1] = nil,			[2] = nil,			[3] = nil},
--新大逃杀结束，预留两个
[24]		= {str = "待定9",	 	[1] = nil,			[2] = nil,			[3] = nil},
[25]		= {str = "待定8",	 	[1] = nil,			[2] = nil,			[3] = nil},
[26]		= {str = "待定7",	 	[1] = nil,			[2] = nil,			[3] = nil},
[27]		= {str = "待定6",	 	[1] = nil,			[2] = nil,			[3] = nil},
[28]		= {str = "待定5",	 	[1] = nil,			[2] = nil,			[3] = nil},
[29]		= {str = "待定4",	 	[1] = nil,			[2] = nil,			[3] = nil},
[30]		= {str = "待定3",	 	[1] = nil,			[2] = nil,			[3] = nil},
[31]		= {str = "待定2",	 	[1] = nil,			[2] = nil,			[3] = nil},
[32]		= {str = "待定1",	 	[1] = nil,			[2] = nil,			[3] = nil},
}
------------------------------------------------------------

--------------------新大逃杀切换武器配置----------------------
NEKSwitchWeaponList =
{
--武器攻击类型	 = {抽刀动作										收刀动作		},
[16]			= {["draw"] = "zd_武器切换拿出_飞轮",				["return"] = "zd_武器切换收起_飞轮"},
[17]			= {["draw"] = "zd_武器切换拿出_毒针",				["return"] = "zd_武器切换收起_毒针"},
[18]			= {["draw"] = "zd_武器切换拿出_毒烟",				["return"] = "zd_武器切换收起_毒烟"},
[19]			= {["draw"] = "zd_武器切换拿出_火箭拳",				["return"] = "zd_武器切换收起_火箭拳"},
[20]			= {["draw"] = "zd_武器切换拿出_冰弓",				["return"] = "zd_武器切换收起_冰弓"},
[21]			= {["draw"] = "zd_武器切换拿出_喷火器",				["return"] = "zd_武器切换收起_喷火器"},
[22]			= {["draw"] = "zd_武器切换拿出_拳刃",				["return"] = "zd_武器切换收起_拳刃"},

["default"]		= {["draw"] = "zd_武器切换拿出_通用",				["return"] = "zd_武器切换收起_通用"},
}
------------------------------------------------------------


-------------------LOADING界面资源配置--------------------------
------------LOADING Interface Resources Config------------------
--准备阶段动画
ANISEQSTART = {}
ANISEQSTART[1] = "Lot_animation\\loading0000.tga"
ANISEQSTART[2] =  "Lot_animation\\loading0001.tga"
ANISEQSTART[3] =  "Lot_animation\\loading0002.tga"
ANISEQSTART[4] =  "Lot_animation\\loading0003.tga"
ANISEQSTART[5] =  "Lot_animation\\loading0004.tga"
ANISEQSTART[6] =  "Lot_animation\\loading0005.tga"
ANISEQSTART[7] =  "Lot_animation\\loading0006.tga"
ANISEQSTART[8] =  "Lot_animation\\loading0007.tga"
ANISEQSTART[9] =  "Lot_animation\\loading0008.tga"
ANISEQSTART[10] =  "Lot_animation\\loading0009.tga"
ANISEQSTART[11] =  "Lot_animation\\loading0010.tga"
ANISEQSTART[12] =  "Lot_animation\\loading0011.tga"
ANISEQSTART[13] =  "Lot_animation\\loading0012.tga"
ANISEQSTART[14] =  "Lot_animation\\loading0013.tga"
ANISEQSTART[15] =  "Lot_animation\\loading0014.tga"
ANISEQSTART[16] =  "Lot_animation\\loading0015.tga"
ANISEQSTART[17] =  "Lot_animation\\loading0016.tga"
ANISEQSTART[18] =  "Lot_animation\\loading0017.tga"
ANISEQSTART[19] =  "Lot_animation\\loading0018.tga"
ANISEQSTART[20] =  "Lot_animation\\loading0019.tga"
ANISEQSTART[21] =  "Lot_animation\\loading0020.tga"

--动作阶段动画
ANISEQACT = {}
ANISEQACT[1] =  "Lot_animation\\loading0021.tga"
--结束阶段动画
ANISEQEND = {}
ANISEQEND[1] =  "Lot_animation\\loading0021.tga"
--背景图列表 Picture List
LOADING_BACKGROUND = {}
LOADING_BACKGROUND[1] = {color = "^ffe6aa", file = "MapLoading\\a1.dds"}
LOADING_BACKGROUND[2] = {color = "^d3f3ff", file = "Worldmaps\\WorldMap.dds"}
LOADING_BACKGROUND[3] = {color = "^e0d6ff", file = "Worldmaps\\WorldMap_h.dds"}
LOADING_BACKGROUND[4] = {color = "^ffffff", file = "LoginWorld\\CreateBack.dds"}
LOADING_BACKGROUND[5] = {color = "^ceffc7", file = "LoginWorld\\Create1Back.dds"}
------------------------------------------------------------

-------------------物品拿起放下音效配置---------------------
----------Item Take Up and Put Down Sound Config------------
--装备拿起放下音效
ICON_SOUND_PATH = {}
	--新手
	ICON_SOUND_PATH[1] = {takeup = "Sfx\\策划联入\\物品道具\\武器_新手剑拿起.wav",drop = "Sfx\\策划联入\\物品道具\\武器_新手剑放下.wav"}
	--少林
	ICON_SOUND_PATH[2] = {takeup = "Sfx\\策划联入\\物品道具\\武器_少林棍拿起.wav",drop = "Sfx\\策划联入\\物品道具\\武器_少林棍放下.wav"}
	--武当
	ICON_SOUND_PATH[3] = {takeup = "Sfx\\策划联入\\物品道具\\武器_武当剑拿起.wav",drop = "Sfx\\策划联入\\物品道具\\武器_武当剑放下.wav"}
	--华山
	ICON_SOUND_PATH[4] = {takeup = "Sfx\\策划联入\\物品道具\\武器_华山剑拿起.wav",drop = "Sfx\\策划联入\\物品道具\\武器_华山剑放下.wav"}
	--恒山
	ICON_SOUND_PATH[5] = {takeup = "Sfx\\策划联入\\物品道具\\武器_恒山剑拿起.wav",drop = "Sfx\\策划联入\\物品道具\\武器_恒山剑放下.wav"}
	--衡山
	ICON_SOUND_PATH[6] = {takeup = "Sfx\\策划联入\\物品道具\\武器_衡山剑拿起.wav",drop = "Sfx\\策划联入\\物品道具\\武器_衡山剑放下.wav"}
	--衡山
	ICON_SOUND_PATH[7] = {takeup = "Sfx\\策划联入\\物品道具\\武器_日月刀拿起.wav",drop = "Sfx\\策划联入\\物品道具\\武器_日月刀放下.wav"}
	--衡山
	ICON_SOUND_PATH[8] = {takeup = "Sfx\\策划联入\\物品道具\\武器_五仙鞭拿起.wav",drop = "Sfx\\策划联入\\物品道具\\武器_五仙鞭放下.wav"}
	--衡山
	ICON_SOUND_PATH[9] = {takeup = "Sfx\\策划联入\\物品道具\\武器_逍遥扇拿起.wav",drop = "Sfx\\策划联入\\物品道具\\武器_逍遥扇放下.wav"}
	--衡山
	ICON_SOUND_PATH[10] = {takeup = "Sfx\\策划联入\\物品道具\\武器_唐门火器拿起.wav",drop = "Sfx\\策划联入\\物品道具\\武器_唐门火器放下.wav"}
	--衡山
	ICON_SOUND_PATH[11] = {takeup = "Sfx\\策划联入\\物品道具\\武器_峨嵋杖拿起.wav",drop = "Sfx\\策划联入\\物品道具\\武器_峨嵋杖放下.wav"}
	--衡山
	ICON_SOUND_PATH[12] = {takeup = "Sfx\\策划联入\\物品道具\\防具_布甲拿起.wav",drop = "Sfx\\策划联入\\物品道具\\防具_布甲放下.wav"}
	--衡山
	ICON_SOUND_PATH[13] = {takeup = "Sfx\\策划联入\\物品道具\\防具_棉甲拿起.wav",drop = "Sfx\\策划联入\\物品道具\\防具_棉甲放下.wav"}
	--皮甲
	ICON_SOUND_PATH[14] = {takeup = "Sfx\\策划联入\\物品道具\\防具_皮甲拿起.wav",drop = "Sfx\\策划联入\\物品道具\\防具_皮甲放下.wav"}
	--戒指
	ICON_SOUND_PATH[15] = {takeup = "Sfx\\策划联入\\物品道具\\首饰_戒指拿起.wav",drop = "Sfx\\策划联入\\物品道具\\首饰_戒指放下.wav"}
	--项链
	ICON_SOUND_PATH[16] = {takeup = "Sfx\\策划联入\\物品道具\\首饰_项链拿起.wav",drop = "Sfx\\策划联入\\物品道具\\首饰_项链放下.wav"}
	--饰品
	ICON_SOUND_PATH[17] = {takeup = "Sfx\\策划联入\\物品道具\\首饰_饰品拿起.wav",drop = "Sfx\\策划联入\\物品道具\\首饰_饰品放下.wav"}
	--时装
	ICON_SOUND_PATH[18] = {takeup = "Sfx\\策划联入\\物品道具\\时装拿起.wav",drop = "Sfx\\策划联入\\物品道具\\时装放下.wav"}
	--草本
	ICON_SOUND_PATH[19] = {takeup = "Sfx\\策划联入\\物品道具\\植物_草本拿起.wav",drop = "Sfx\\策划联入\\物品道具\\植物_草本放下.wav"}
	--木材
	ICON_SOUND_PATH[20] = {takeup = "Sfx\\策划联入\\物品道具\\植物_木材拿起.wav",drop = "Sfx\\策划联入\\物品道具\\植物_木材放下.wav"}
	--肉类
	ICON_SOUND_PATH[21] = {takeup = "Sfx\\策划联入\\物品道具\\动物_肉类拿起.wav",drop = "Sfx\\策划联入\\物品道具\\动物_肉类放下.wav"}
	--毛皮
	ICON_SOUND_PATH[22] = {takeup = "Sfx\\策划联入\\物品道具\\动物_毛皮拿起.wav",drop = "Sfx\\策划联入\\物品道具\\动物_毛皮放下.wav"}
	--宝石
	ICON_SOUND_PATH[23] = {takeup = "Sfx\\策划联入\\物品道具\\采矿_宝石拿起.wav",drop = "Sfx\\策划联入\\物品道具\\采矿_宝石放下.wav"}
	--矿土
	ICON_SOUND_PATH[24] = {takeup = "Sfx\\策划联入\\物品道具\\采矿_矿土拿起.wav",drop = "Sfx\\策划联入\\物品道具\\采矿_矿土放下.wav"}
	--金属
	ICON_SOUND_PATH[25] = {takeup = "Sfx\\策划联入\\物品道具\\采矿_金属拿起.wav",drop = "Sfx\\策划联入\\物品道具\\采矿_金属放下.wav"}
	--药瓶
	ICON_SOUND_PATH[26] = {takeup = "Sfx\\策划联入\\物品道具\\药品_药瓶拿起.wav",drop = "Sfx\\策划联入\\物品道具\\药品_药瓶放下.wav"}
	--药膏
	ICON_SOUND_PATH[27] = {takeup = "Sfx\\策划联入\\物品道具\\药品_药膏拿起.wav",drop = "Sfx\\策划联入\\物品道具\\药品_药膏放下.wav"}
	--食物
	ICON_SOUND_PATH[28] = {takeup = "Sfx\\策划联入\\物品道具\\药品_食物拿起.wav",drop = "Sfx\\策划联入\\物品道具\\药品_食物放下.wav"}
	--书本
	ICON_SOUND_PATH[29] = {takeup = "Sfx\\策划联入\\物品道具\\通用书本拿起.wav",drop = "Sfx\\策划联入\\物品道具\\通用书本放下.wav"}
	--卷轴
	ICON_SOUND_PATH[30] = {takeup = "Sfx\\策划联入\\物品道具\\通用卷轴拿起.wav",drop = "Sfx\\策划联入\\物品道具\\通用卷轴放下.wav"}
	--石头
	ICON_SOUND_PATH[31] = {takeup = "Sfx\\策划联入\\物品道具\\通用石头拿起.wav",drop = "Sfx\\策划联入\\物品道具\\通用石头放下.wav"}
	--其他
	ICON_SOUND_PATH[32] = {takeup = "Sfx\\策划联入\\物品道具\\通用物品拿起.wav",drop = "Sfx\\策划联入\\物品道具\\通用物品放下.wav"}
	--金钱
	ICON_SOUND_PATH[33] = {takeup = "Sfx\\策划联入\\物品道具\\通用金钱拿起.wav",drop = "Sfx\\策划联入\\物品道具\\通用金钱放下.wav"}


------------------------飞行坐骑列表----------------------
FlyingVehicleList = 
{
	89955,95207,92838,96003,96004,96130,96131,96307,96308,96430,96432,96791,96792,97503,97504,97893,98698,98794,98818,99072,99224,99754,
	100117,100118,100119,100453,100454,103448,103610,103611,103612,103613,103614,103979,104730,104731,105517,105524,105915,106396,106537,107838,107891,108171,108172,108173,108271,108283,
	
}

------------------------挂点比较低的坐骑(需要把pate向上移)------------------
LowerHookVehicleList = 
{
	[103978] = {
		-- 0男1女
		[0] = 				
		{
			-- 0成体1正太萝莉2孩子
			[0] = 0.3,
			[1] = 0.3,
			[2] = 0.3,
		},
		[1] = 
		{
			[0] = 0.3,
			[1] = 0.3,
			[2] = 0.3,
		},
	},
	[106853] = {
		[0] = 
		{
			[0] = 0.3,
			[1] = 0.3,
			[2] = 0.3,
		},
		[1] = 
		{
			[0] = 0.3,
			[1] = 0.3,
			[2] = 0.3,
		},
	},
	[106878] = {
		[0] = 
		{
			[0] = 3.0,
			[1] = 2.0,
			[2] = 2.0,
		},
		[1] = 
		{
			[0] = 2.0,
			[1] = 2.0,
			[2] = 2.0,
		},
	},

	["default"] = 0.3, -- HH_头发为0
}

------------------------主被绑播不同动作坐骑列表----------
SeparatePlayActVehicleList = 
{
	100403,103978,104931,106853
}

------------------------不需要调整玩家坐标的坐骑----------------------
NotAdjustPosVehicleList = 
{
	100403,103978,104931,106853
}

------------------------根据骑乘模板id决定基准速度-----------------
SpecialVehicleSpeed =
{
--	标准走速	标准跑速		
[100403] = {ws = 1.5, ms = 5.0},
--	标准走速	标准跑速		
[104931] = {ws = 1.5, ms = 5.0},
--	标准走速	标准跑速		
[106853] = {ws = 1.5, ms = 5.0},
}

--PLAYER NPC 特殊SHOW动作
PlayerNPCShowAct = 
{
	["default"] = "站立",
	[103619] = "孩子射箭循环",
	[103620] = "算术循环",
	[103621] = "算术循环",
	[103622] = "采集读书",
	[103623] = "弹琴循环",
	[103625] = "木马循环",
	[103626] = "木马循环",
	[103627] = "木马循环",
	[103654] = "东方姑娘舞蹈",
	[103954] = "备用1舞蹈"
}