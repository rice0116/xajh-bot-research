--[[#tag push auto]]

NpcEvent = {}

NpcEvent.enumEIEmotion = 0
NpcEvent.EIEmotionTag  = --[[!AUTO_1]]""

--寻路链接 参数1:套号 参数2:表情序号
function NpcEvent:GetEmotionLink(emotion_set,emotion_id)
	if #NpcEvent.EIEmotionTag <= 0 then
		NpcEvent.EIEmotionTag = GameApi.GetEmotionTag()
	end
	return string.format(--[[!AUTO_2]]"%s<%d><%d:%d>",NpcEvent.EIEmotionTag,NpcEvent.enumEIEmotion,emotion_set,emotion_id)
end

NPcEventType =
{
	NPC_BORN	= 1,	--出生(进入视野)
	NPC_DISAP	= 2,	--消失
	NPC_DIE		= 3,	--死亡
	NPC_BUY		= 4,	--收购
}

NPcShowType =
{
	GFX = 1, 	--光效
	MSG = 2,	--喊话
}

NPcEventDesign_cfg =
{
----鱼池
	[67487] =
	{
		[NPcShowType.GFX] =
		{
			[NPcEventType.NPC_BORN] 	= {Gfx = 0, strHH = --[[!AUTO_3]]"", Period = 0},
			[NPcEventType.NPC_DISAP] 	= {Gfx = 0, strHH = --[[!AUTO_4]]"", Period = 0},
			[NPcEventType.NPC_DIE] 		= {Gfx = 11877, strHH = --[[!AUTO_5]]"name", Period = 10},
			[NPcEventType.NPC_BUY] 		= {Gfx = 0, strHH = --[[!AUTO_6]]"", Period = 0},
		},
		[NPcShowType.MSG] =
		{
			[NPcEventType.NPC_BORN] 	= {Content = --[[!AUTO_7]]"", Period = 0},
			[NPcEventType.NPC_DISAP] 	= {Content = --[[!AUTO_8]]"", Period = 0},
			[NPcEventType.NPC_DIE] 		= {Content = --[[!AUTO_9]]"", Period = 0},
			[NPcEventType.NPC_BUY] 		= {Content = --[[!AUTO_10]]"", Period = 0},
		}
	},
	[67488] =
	{
		[NPcShowType.GFX] =
		{
			[NPcEventType.NPC_BORN] 	= {Gfx = 0, strHH = --[[!AUTO_11]]"", Period = 0},
			[NPcEventType.NPC_DISAP] 	= {Gfx = 0, strHH = --[[!AUTO_12]]"", Period = 0},
			[NPcEventType.NPC_DIE] 		= {Gfx = 11877, strHH = --[[!AUTO_13]]"name", Period = 10},
			[NPcEventType.NPC_BUY] 		= {Gfx = 0, strHH = --[[!AUTO_14]]"", Period = 0},
		},
		[NPcShowType.MSG] =
		{
			[NPcEventType.NPC_BORN] 	= {Content = --[[!AUTO_15]]"", Period = 0},
			[NPcEventType.NPC_DISAP] 	= {Content = --[[!AUTO_16]]"", Period = 0},
			[NPcEventType.NPC_DIE] 		= {Content = --[[!AUTO_17]]"", Period = 0},
			[NPcEventType.NPC_BUY] 		= {Content = --[[!AUTO_18]]"", Period = 0},
		}
	},
	[67489] =
	{
		[NPcShowType.GFX] =
		{
			[NPcEventType.NPC_BORN] 	= {Gfx = 0, strHH = --[[!AUTO_19]]"", Period = 0},
			[NPcEventType.NPC_DISAP] 	= {Gfx = 0, strHH = --[[!AUTO_20]]"", Period = 0},
			[NPcEventType.NPC_DIE] 		= {Gfx = 11877, strHH = --[[!AUTO_21]]"name", Period = 10},
			[NPcEventType.NPC_BUY] 		= {Gfx = 0, strHH = --[[!AUTO_22]]"", Period = 0},
		},
		[NPcShowType.MSG] =
		{
			[NPcEventType.NPC_BORN] 	= {Content = --[[!AUTO_23]]"", Period = 0},
			[NPcEventType.NPC_DISAP] 	= {Content = --[[!AUTO_24]]"", Period = 0},
			[NPcEventType.NPC_DIE] 		= {Content = --[[!AUTO_25]]"", Period = 0},
			[NPcEventType.NPC_BUY] 		= {Content = --[[!AUTO_26]]"", Period = 0},
		}
	},
	[67490] =
	{
		[NPcShowType.GFX] =
		{
			[NPcEventType.NPC_BORN] 	= {Gfx = 0, strHH = --[[!AUTO_27]]"", Period = 0},
			[NPcEventType.NPC_DISAP] 	= {Gfx = 0, strHH = --[[!AUTO_28]]"", Period = 0},
			[NPcEventType.NPC_DIE] 		= {Gfx = 11877, strHH = --[[!AUTO_29]]"name", Period = 10},
			[NPcEventType.NPC_BUY] 		= {Gfx = 0, strHH = --[[!AUTO_30]]"", Period = 0},
		},
		[NPcShowType.MSG] =
		{
			[NPcEventType.NPC_BORN] 	= {Content = --[[!AUTO_31]]"", Period = 0},
			[NPcEventType.NPC_DISAP] 	= {Content = --[[!AUTO_32]]"", Period = 0},
			[NPcEventType.NPC_DIE] 		= {Content = --[[!AUTO_33]]"", Period = 0},
			[NPcEventType.NPC_BUY] 		= {Content = --[[!AUTO_34]]"", Period = 0},
		}
	},
----千秋美酒
	[28382] =
	{
		[NPcShowType.GFX] =
		{
			[NPcEventType.NPC_BORN] 	= {Gfx = 0, strHH = --[[!AUTO_35]]"", Period = 0},
			[NPcEventType.NPC_DISAP] 	= {Gfx = 0, strHH = --[[!AUTO_36]]"", Period = 0},
			[NPcEventType.NPC_DIE] 		= {Gfx = 11884, strHH = --[[!AUTO_37]]"name", Period = 10},
			[NPcEventType.NPC_BUY] 		= {Gfx = 0, strHH = --[[!AUTO_38]]"", Period = 0},
		},
		[NPcShowType.MSG] =
		{
			[NPcEventType.NPC_BORN] 	= {Content = --[[!AUTO_39]]"", Period = 0},
			[NPcEventType.NPC_DISAP] 	= {Content = --[[!AUTO_40]]"", Period = 0},
			[NPcEventType.NPC_DIE] 		= {Content = --[[!AUTO_41]]"", Period = 0},
			[NPcEventType.NPC_BUY] 		= {Content = --[[!AUTO_42]]"", Period = 0},
		}
	},
	[28383] =
	{
		[NPcShowType.GFX] =
		{
			[NPcEventType.NPC_DIE] 		= {Gfx = 11888, strHH = --[[!AUTO_43]]"name", Period = 10},
		},
	},
	[28384] =
	{
		[NPcShowType.GFX] =
		{
			[NPcEventType.NPC_DIE] 		= {Gfx = 11878, strHH = --[[!AUTO_44]]"name", Period = 10},
		},
	},
	[28385] =
	{
		[NPcShowType.GFX] =
		{
			[NPcEventType.NPC_DIE] 		= {Gfx = 11881, strHH = --[[!AUTO_45]]"name", Period = 10},
		},
	},
	[28386] =
	{
		[NPcShowType.GFX] =
		{
			[NPcEventType.NPC_DIE] 		= {Gfx = 11875, strHH = --[[!AUTO_46]]"name", Period = 10},
		},
	},
	[28387] =
	{
		[NPcShowType.GFX] =
		{
			[NPcEventType.NPC_DIE] 		= {Gfx = 11884, strHH = --[[!AUTO_47]]"name", Period = 10},
		},
	},
	[28388] =
	{
		[NPcShowType.GFX] =
		{
			[NPcEventType.NPC_DIE] 		= {Gfx = 11890, strHH = --[[!AUTO_48]]"name", Period = 10},
		},
	},
	[28389] =
	{
		[NPcShowType.GFX] =
		{
			[NPcEventType.NPC_DIE] 		= {Gfx = 11880, strHH = --[[!AUTO_49]]"name", Period = 10},
		},
	},
	[28390] =
	{
		[NPcShowType.GFX] =
		{
			[NPcEventType.NPC_DIE] 		= {Gfx = 11883, strHH = --[[!AUTO_50]]"name", Period = 10},
		},
	},
	[28391] =
	{
		[NPcShowType.GFX] =
		{
			[NPcEventType.NPC_DIE] 		= {Gfx = 11877, strHH = --[[!AUTO_51]]"name", Period = 10},
		},
	},
	[28398] =
	{
		[NPcShowType.GFX] =
		{
			[NPcEventType.NPC_BORN] 	= {Gfx = 11885, strHH = --[[!AUTO_52]]"name", Period = 10},
		},
	},
	[28399] =
	{
		[NPcShowType.GFX] =
		{
			[NPcEventType.NPC_BORN] 	= {Gfx = 11889, strHH = --[[!AUTO_53]]"name", Period = 10},
		},
	},
	[28400] =
	{
		[NPcShowType.GFX] =
		{
			[NPcEventType.NPC_BORN] 	= {Gfx = 11879, strHH = --[[!AUTO_54]]"name", Period = 10},
		},
	},
	[28401] =
	{
		[NPcShowType.GFX] =
		{
			[NPcEventType.NPC_BORN] 	= {Gfx = 11882, strHH = --[[!AUTO_55]]"name", Period = 10},
		},
	},
	[28402] =
	{
		[NPcShowType.GFX] =
		{
			[NPcEventType.NPC_BORN] 	= {Gfx = 11876, strHH = --[[!AUTO_56]]"name", Period = 10},
		},
	},
	[28404] =
	{
		[NPcShowType.GFX] =
		{
			[NPcEventType.NPC_DIE] 		= {Gfx = 11887, strHH = --[[!AUTO_57]]"name", Period = 10},
		},
	},
---测试
	[4712] =
	{
		[NPcShowType.MSG] =
		{
			[NPcEventType.NPC_BORN] 	= {Content = --[[!AUTO_58]]"我活了#0:1#", Period = 10},
			[NPcEventType.NPC_DISAP] 	= {Content = --[[!AUTO_59]]"我消失了#0:2#", Pemiod = 10},
			[NPcEventType.NPC_DIE] 		= {Content = --[[!AUTO_60]]"我死了#0:3#", Period = 10},
			[NPcEventType.NPC_BUY] 		= {Content = --[[!AUTO_61]]"我買夠了#0:3#", Period = 10},
		}
	},

---西瓜节活动
	[29239] =
	{
		[NPcShowType.MSG] =
		{
			[NPcEventType.NPC_BUY] 		= {Content = --[[!AUTO_62]]"#0:6# \r西瓜生長中…5分鐘後請來施肥", Period = 300},
		}
	},
	[29242] =
	{
		[NPcShowType.MSG] =
		{
			[NPcEventType.NPC_BUY] 		= {Content = --[[!AUTO_63]]"#0:7# \r西瓜被摘掉了！3分鐘後將消失", Period = 180},
		}
	},
--街市
	[29193] =
	{
		[NPcShowType.MSG] =
		{
			[NPcEventType.NPC_BORN] 	= {Content = --[[!AUTO_64]]"#0:0#", Period = 300},
			[NPcEventType.NPC_BUY] 		= {Content = --[[!AUTO_65]]"我很滿意", Period = 3},
		}
	},
	[29196] =
	{
		[NPcShowType.MSG] =
		{
			[NPcEventType.NPC_BORN] 	= {Content = --[[!AUTO_66]]"#0:1#", Period = 300},
			[NPcEventType.NPC_BUY] 		= {Content = --[[!AUTO_67]]"我很滿意", Period = 3},
		}
	},
	[29199] =
	{
		[NPcShowType.MSG] =
		{
			[NPcEventType.NPC_BORN] 	= {Content = --[[!AUTO_68]]"#0:2#", Period = 300},
			[NPcEventType.NPC_BUY] 		= {Content = --[[!AUTO_69]]"我很滿意", Period = 3},
		}
	},
	[29202] =
	{
		[NPcShowType.MSG] =
		{
			[NPcEventType.NPC_BORN] 	= {Content = --[[!AUTO_70]]"#0:3#", Period = 300},
			[NPcEventType.NPC_BUY] 		= {Content = --[[!AUTO_71]]"我很滿意", Period = 3},
			[NPcEventType.NPC_BUY] 		= {Content = --[[!AUTO_72]]"#0:3#", Period = 3},
		}
	},
	[29205] =
	{
		[NPcShowType.MSG] =
		{
			[NPcEventType.NPC_BORN] 	= {Content = --[[!AUTO_73]]"#0:4#", Period = 300},
			[NPcEventType.NPC_BUY] 		= {Content = --[[!AUTO_74]]"我很滿意", Period = 3},
		}
	},
	[29208] =
	{
		[NPcShowType.MSG] =
		{
			[NPcEventType.NPC_BORN] 	= {Content = --[[!AUTO_75]]"#0:5#", Period = 300},
			[NPcEventType.NPC_BUY] 		= {Content = --[[!AUTO_76]]"我很滿意", Period = 3},
		}
	},
	[29214] =
	{
		[NPcShowType.MSG] =
		{
			[NPcEventType.NPC_BORN] 	= {Content = --[[!AUTO_77]]"#0:0#", Period = 60},
			[NPcEventType.NPC_BUY] 		= {Content = --[[!AUTO_78]]"我很滿意", Period = 3},
		}
	},
	[29698] =
	{
		[NPcShowType.MSG] =
		{
			[NPcEventType.NPC_BORN] 	= {Content = --[[!AUTO_79]]"#0:1#", Period = 60},
			[NPcEventType.NPC_BUY] 		= {Content = --[[!AUTO_80]]"我很滿意", Period = 3},
		}
	},
	[29701] =
	{
		[NPcShowType.MSG] =
		{
			[NPcEventType.NPC_BORN] 	= {Content = --[[!AUTO_81]]"#0:2#", Period = 60},
			[NPcEventType.NPC_BUY] 		= {Content = --[[!AUTO_82]]"我很滿意", Period = 3},
		}
	},
	[29704] =
	{
		[NPcShowType.MSG] =
		{
			[NPcEventType.NPC_BORN] 	= {Content = --[[!AUTO_83]]"#0:3#", Period = 60},
			[NPcEventType.NPC_BUY] 		= {Content = --[[!AUTO_84]]"我很滿意", Period = 3},
		}
	},
	[29707] =
	{
		[NPcShowType.MSG] =
		{
			[NPcEventType.NPC_BORN] 	= {Content = --[[!AUTO_85]]"#0:4#", Period = 60},
			[NPcEventType.NPC_BUY] 		= {Content = --[[!AUTO_86]]"我很滿意", Period = 3},
		}
	},
	[29710] =
	{
		[NPcShowType.MSG] =
		{
			[NPcEventType.NPC_BORN] 	= {Content = --[[!AUTO_87]]"#0:5#", Period = 60},
			[NPcEventType.NPC_BUY] 		= {Content = --[[!AUTO_88]]"我很滿意", Period = 3},
		}
	},
}


function NpcEvent:OnEvent(id_event,tid_npc,nid_npc,args_tbl)
	if id_event then
		ShowGFX(id_event,tid_npc,nid_npc)
		ShowMSG(id_event,tid_npc,nid_npc)
	end
end

--光效处理
function ShowGFX(id_event,tid_npc, nid_npc)
	if NPcEventDesign_cfg[tid_npc] then
		if NPcEventDesign_cfg[tid_npc][NPcShowType.GFX] then
			if NPcEventDesign_cfg[tid_npc][NPcShowType.GFX][id_event] then
				local GfxEvent 	= NPcEventDesign_cfg[tid_npc][NPcShowType.GFX][id_event]
				if GfxEvent.Gfx ~= --[[!AUTO_89]]"" then
					local tid 	= tid_npc
					local idGfxPath = GfxEvent.Gfx
					local strHH 	= GfxEvent.strHH
					local dwPeriod 	= GfxEvent.Period * 1000
					GameApi.SetObjScriptGfx(nid_npc,idGfxPath,strHH,dwPeriod,false)
				end
			end
		end
	end
	return nil
end

--喊话处理
function ShowMSG(id_event,tid_npc, nid_npc)
	--LogPrint(id_event)
	if NPcEventDesign_cfg[tid_npc] then
		if NPcEventDesign_cfg[tid_npc][NPcShowType.MSG] then
			if NPcEventDesign_cfg[tid_npc][NPcShowType.MSG][id_event] then
				local MsgEvent	= NPcEventDesign_cfg[tid_npc][NPcShowType.MSG][id_event]
				if MsgEvent.Content ~= --[[!AUTO_90]]"" then
					local tid 		= tid_npc
					local Content 	= Speak:LookUpLink(MsgEvent.Content, 0)
					local dwPeriod 	= MsgEvent.Period * 1000
					--GameApi.SetNPCPopMsgWriteable(false)
					--GameApi.ClosePopMsgOnNPC(nid_npc)
					GameApi.PlayPopMsgOnNPC(nid_npc, Content, dwPeriod)
				end
			end
		end
	end
	return nil
end
