--传入点坐标,TransInPos[x] = {x,y,z} 第x号图的传入点坐标为xyz
TransInPos = {}

TransInPos[4] = { Name = "衡山郊外", x=-55,y=40,z=-112 }
TransInPos[5] = { Name = "衡山派", x=14.78,y=51.37,z=-31.71 }
TransInPos[6] = { Name = "武当派", x=-36.25,y=37.8,z=-138.4 }
TransInPos[18] = { Name = "逍遥派", x=89.48,y=46.65,z=-40.96 }
TransInPos[26] = { Name = "五仙派", x=28.86,y=76,z=-58.95 }
TransInPos[31] = { Name = "峨嵋派", x=31.12,y=111.44,z=-33.09 }
TransInPos[33] = { Name = "唐门", x=4.18,y=82.39,z=-51.1 }
TransInPos[36] = { Name = "恒山派", x=29.65,y=60.01,z=-68.87 }
TransInPos[42] = { Name = "日月派", x=-16.07,y=46,z=-146.77 }
TransInPos[66] = { Name = "少林派", x=-66.75,y=123.92,z=81.67 }
TransInPos[67] = { Name = "衡山城", x=-6,y=82,z=-28 }
TransInPos[68] = { Name = "福州城", x=13.67,y=54.05,z=-99.67 }
TransInPos[69] = { Name = "武当山", x=130,y=88,z=-17 }
TransInPos[71] = { Name = "药王谷", x=156.35,y=10.3,z=142.57 }
TransInPos[72] = { Name = "福州郊外", x=-113.3,y=122.09,z=198.77 }
TransInPos[73] = { Name = "夜岚谷", x=-12,y=35,z=-42}
TransInPos[74] = { Name = "华山派", x=-16.54,y=124.77,z=-99.39 }
TransInPos[75] = { Name = "洛阳城", x=-223.57,y=33.2,z=-24.29 }
TransInPos[76] = { Name = "华山", x=102.54,y=96.9,z=38.67 }
TransInPos[77] = { Name = "少室山", x=273.66,y=85,z=-273.58 }
TransInPos[78] = { Name = "泰山", x=37.58,y=51.61,z=-12.7 }
TransInPos[79] = { Name = "朱仙镇", x=-95.67,y=132,z=115.13 }
TransInPos[80] = { Name = "仙愁峡", x=144.17,y=37.07,z=72.41 }
TransInPos[81] = { Name = "五霸岗", x=136.78,y=78.18,z=-149.13 }
TransInPos[82] = { Name = "余杭", x=-75.46,y=33.08,z=108.09 }
TransInPos[83] = { Name = "仙霞岭", x=-45.46,y=221.62,z=-128.81 }
TransInPos[85] = { Name = "龙泉", x=147.27,y=201.33,z=45.35 }

--传送坐标范围
TransInWarPos = {}

TransInWarPos[1] = { Name = "嵩山中央入口", Mapid=1032,X=-18,Y=100,Z=50, radius=20}
TransInWarPos[2] = { Name = "嵩山北方入口", Mapid=1032,X=-118,Y=115,Z=41, radius=20}
TransInWarPos[3] = { Name = "嵩山南方入口", Mapid=1032,X=146,Y=72,Z=-105, radius=20}
TransInWarPos[4] = { Name = "嵩山东方入口", Mapid=1032,X=73,Y=95,Z=91, radius=20}
TransInWarPos[5] = { Name = "嵩山西方入口", Mapid=1032,X=16,Y=88,Z=-120, radius=20}
TransInWarPos[6] = { Name = "嵩山传出地点", Mapid=55,X=23,Y=35,Z=59, radius=5}



--得到instID图上的传入点坐标
function GetInPos( instID )
	if( TransInPos[instID] ~= nil ) then
		return TransInPos[instID].x,TransInPos[instID].y,TransInPos[instID].z
	else
		return -1
	end
end

function GetOutPos( ID )
	if ( TransInWarPos[ID] ~= nil) then
		return TransInWarPos[ID].Mapid,TransInWarPos[ID].X,TransInWarPos[ID].Y,TransInWarPos[ID].Z,TransInWarPos[ID].radius
	else
		return -1
	end
end 