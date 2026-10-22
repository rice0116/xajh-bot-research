--------血统反应关系--------
----------------------------

Parentage_pack={				
				eat = {  ----血 = 木，外攻 = 金，外防 = 火，内攻 = 水，内防 = 土；
						{},
						{},
						{},
						{},
						{},
						{},
						{},
						{},
						{},
						{},
						{},
						{},
						{},
						{},
						{},
						{5,10,15,19,24},
						{5,10,15,19,24},
						{3,8,13,20,23},
						{4,9,14,18,25},
						{2,7,12,21,22},
						{1,6,11,16,17},
						{1,6,11,16,17},
						{2,7,12,21,22},
						{4,9,14,18,25},
						{3,8,13,20,23},
						},
				chemical = {
							  { {6,11} },
							  { {7,12} },
							  { {8,13} },
							  { {9,14} },
						      { {10,15} },
							  { {1,11} },
							  { {2,12} },
							  { {3,13} },
							  { {4,14} },
							  { {5,15} },
							  { {12,16},{13,17},{14,18},{15,19} },
							  { {11,16},{13,20},{14,21},{15,22} },
							  { {11,17},{12,20},{14,23},{15,24} },
							  { {11,18},{12,21},{13,23},{15,25} },
							  { {11,19},{12,22},{13,24},{14,25} },
							  {},
							  {},
							  {},
							  {},
							  {},
							  {},
							  {},
							  {},
							  {},
							  {}
							}
				}


function Parentage_pack:Parentage_taxis(Parentage_get)
	local i,j
	for i = 3,2,-1 do
		for j = 1,i-1 do
			if Parentage_get[i+1-j][2] >Parentage_get[i-j][2] then
			   Parentage_get[i+1-j][1],Parentage_get[i-j][1] = Parentage_get[i-j][1],Parentage_get[i+1-j][1]
               Parentage_get[i+1-j][2],Parentage_get[i-j][2] = Parentage_get[i-j][2],Parentage_get[i+1-j][2]
               Parentage_get[i+1-j][3],Parentage_get[i-j][3] = Parentage_get[i-j][3],Parentage_get[i+1-j][3]
			end
		end
	end
	return Parentage_get
end


function Parentage_pack:Pet_Exchange_Preview(pet_get_pack,pet_give_pack)
	local Parentage_get = {
							{0,0,0},
							{0,0,0},
							{0,0,0}
							}
	local Parentage_give = {
							{0,0,0},
							{0,0,0},
							{0,0,0}
							}
	local Parentage_final = {
							 {getidx = 0 ,giveidx = 0 ,resultid = 0 ,density = 0 ,stackidx = 0 ,finalidx = 0 ,finaldensity = 0 ,mode = 0},
							 {getidx = 0 ,giveidx = 0 ,resultid = 0 ,density = 0 ,stackidx = 0 ,finalidx = 0 ,finaldensity = 0 ,mode = 0},
							 {getidx = 0 ,giveidx = 0 ,resultid = 0 ,density = 0 ,stackidx = 0 ,finalidx = 0 ,finaldensity = 0 ,mode = 0}
							}
	local Parentage_get_num = 0
	local Parentage_give_num = 0
	local Parentage_give_used = 0
	--local C1 = 75
	--local C2 = 0.75
	--local C3 = 0.25
	--local C4 = 1
	--local C5 = 2
	local ParentageDensity_sum = 0
	local exchanged_num = 1
	local i,j,k,l,pro,blank_left,get_used

--获取双方的血统及浓度
	for i = 1,3 do
		--血统序号为0表示未鉴定血统，255表示空血统
		if pet_get_pack[i][1] >= 1 and pet_get_pack[i][1] ~= 255 then
		   Parentage_get[i][1] = pet_get_pack[i][1]
		   Parentage_get[i][2] = pet_get_pack[i][2]
		   Parentage_get_num = Parentage_get_num + 1
		end
	end
	for i = 1,3 do
		--血统序号为0表示未鉴定血统，255表示空血统
		if pet_give_pack[i][1] >= 1 and pet_give_pack[i][1] ~= 255 then
		   Parentage_give[i][1] = pet_give_pack[i][1]
		   --Parentage_final[i].giveidx = i  (这会把所有反应的血统都放进去，但实际上有些血统不一定会反应)
		   Parentage_give[i][2] = pet_give_pack[i][2]
		   Parentage_give_num = Parentage_give_num + 1
		elseif i == 1 then
		   for j = 1,3 do		       
		       if Parentage_get[j][1] >= 1 then
			      Parentage_final[j].getidx = j
		          Parentage_final[j].resultid = Parentage_get[j][1]
				  Parentage_final[j].density = Parentage_get[j][2]
				  Parentage_final[j].finalidx = j
				  Parentage_final[j].finaldensity = Parentage_get[j][2]
			   end
		   end
		   return  Parentage_final
		end
	end
--计算完美概率
	--if Parentage_give[1][2] > Parentage_get[1][2] then
	   --pro = C1 - Parentage_get[1][2]*C2 + (Parentage_give[1][2] - Parentage_get[1][2])*C3 + (Parentage_get[2][2] + Parentage_give[2][2])*C4 + (Parentage_get[3][2] + Parentage_give[3][2])*C5
	--else
	   --pro = C1 - Parentage_get[1][2]*C2 + (Parentage_get[2][2] + Parentage_give[2][2])*C4 + (Parentage_get[3][2] + Parentage_give[3][2])*C5
	--end
--完美换血
	if Parentage_get_num == 0 then
		   for i = 1,Parentage_give_num do
		       Parentage_get[i][1] = Parentage_give[i][1]
			   Parentage_get[i][2] = Parentage_give[i][2]
			   Parentage_get[i][3] = 1
			   Parentage_final[i].getidx = i
			   Parentage_final[i].giveidx = i
			   Parentage_final[i].resultid = Parentage_give[i][1]
			   Parentage_final[i].density = Parentage_give[i][2]
			   Parentage_final[i].stackidx = i
			   Parentage_final[i].finalidx = i
			   Parentage_final[i].finaldensity = Parentage_give[i][2]
			   Parentage_final[i].mode = 4
		   end
	else
       --吞噬,从浓度低的开始 
	   for i = 1,Parentage_give_num do   			   
		   if Parentage_give[i][3] ~= 1 then
			  for j = Parentage_get_num,1,-1 do  
				  if Parentage_get[j][3] ~= 1 and #Parentage_pack.eat[Parentage_give[i][1]] >= 1 then
				     for k = 1,#Parentage_pack.eat[Parentage_give[i][1]] do
						 if Parentage_get[j][1] == Parentage_pack.eat[Parentage_give[i][1]][k] then
							if Parentage_get[j][2] - Parentage_give[i][2] > 0 then
							   Parentage_get[j][2] = Parentage_get[j][2] - Parentage_give[i][2]
							elseif Parentage_get[j][2] - Parentage_give[i][2] == 0 then
								   Parentage_get[j][1] = 0
								   Parentage_get[j][2] = 0
								   Parentage_final[exchanged_num].stackidx = j
								   Parentage_get_num = Parentage_get_num - 1 --不确定是否会出错，需要注意其他地方配合使用
							elseif Parentage_get[j][2] - Parentage_give[i][2] < 0 then
   								   for l = 1,Parentage_get_num do									
								       if Parentage_get[l][1] == Parentage_give[i][1] and Parentage_get[l][3] ~= 1 then
										  Parentage_get[l][2] = Parentage_get[l][2] + Parentage_give[i][2] - Parentage_get[j][2]
										  if Parentage_get[l][3] ~= 1 then
										     Parentage_final[exchanged_num].stackidx = l
										  end
										  Parentage_get[j][1] = 0
										  Parentage_get[j][2] = 0
										  break
									   end
								   end
								   if Parentage_get[j][2] ~= 0 then
								      Parentage_get[j][1] = Parentage_give[i][1]
									  Parentage_get[j][2] = Parentage_give[i][2] - Parentage_get[j][2]
								   end
							end
							Parentage_get[j][3] = 1
							Parentage_give[i][3] = 1
							Parentage_final[exchanged_num].getidx = j
							Parentage_final[exchanged_num].giveidx = i
							Parentage_final[exchanged_num].resultid = Parentage_get[j][1]
                            Parentage_final[exchanged_num].density =  Parentage_get[j][2]
							Parentage_final[exchanged_num].mode = 1
							exchanged_num = exchanged_num + 1
							Parentage_give_used = Parentage_give_used + 1
							break
						 end
					 end
					 if Parentage_get[j][3] == 1 then
						break
					 end
				  end
			  end
		   end
		   if Parentage_give_used >= Parentage_give_num then
			  break
		   end
	   end
	   for i = 1,3 do
	       print("after mod1:get"..i.." = "..Parentage_get[i][1].."-"..Parentage_get[i][2])
	   end
	   --累加
	   if Parentage_give_used < Parentage_give_num then  
	      for i = 1,Parentage_give_num do  
			  if Parentage_give[i][3] ~= 1 then
				 for j = 1,Parentage_get_num do
					 if Parentage_get[j][3] ~= 1 and Parentage_give[i][1] == Parentage_get[j][1] then 
						Parentage_get[j][2] = Parentage_get[j][2] + Parentage_give[i][2]
						Parentage_give[i][3] = 1
						Parentage_get[j][3] = 1
						Parentage_final[exchanged_num].getidx = j
                        Parentage_final[exchanged_num].giveidx = i
						Parentage_final[exchanged_num].resultid = Parentage_get[j][1]
						Parentage_final[exchanged_num].density = Parentage_get[j][2]
						Parentage_final[exchanged_num].mode = 2
						exchanged_num = exchanged_num + 1
						Parentage_give_used = Parentage_give_used + 1
						break
					 end
				 end
			  end
		      if Parentage_give_used >= Parentage_give_num then
			     break
			  end
		  end
	   end
	   for i = 1,3 do
	       print("after mod2:get"..i.." = "..Parentage_get[i][1].."-"..Parentage_get[i][2])
	   end
       --合化
	   if Parentage_give_used < Parentage_give_num then  
		  for i = 1,Parentage_give_num do  			  
			  if Parentage_give[i][3] ~= 1 then
				 for j = 1,Parentage_get_num do
					 if Parentage_get[j][3] ~= 1 and #Parentage_pack.chemical[Parentage_give[i][1]] >= 1 then
						for k = 1,#Parentage_pack.chemical[Parentage_give[i][1]] do
							if Parentage_get[j][1] == Parentage_pack.chemical[Parentage_give[i][1]][k][1] then
							   for l = 1,Parentage_get_num do
								   if Parentage_get[l][1] == Parentage_pack.chemical[Parentage_give[i][1]][k][2] and Parentage_get[l][3] ~= 1 then
									  Parentage_get[l][2] = Parentage_get[l][2] + math.ceil((Parentage_give[i][2] + Parentage_get[j][2])/2)
									  Parentage_get[j][1] = 0
									  Parentage_get[j][2] = 0
									  Parentage_get[j][3] = 1
									  Parentage_get_num = Parentage_get_num - 1
									  Parentage_give[i][3] = 1
									  Parentage_final[exchanged_num].getidx = j
									  Parentage_final[exchanged_num].giveidx = i
									  Parentage_final[exchanged_num].resultid = Parentage_get[l][1]
									  Parentage_final[exchanged_num].density = Parentage_get[l][2]
									  if Parentage_get[l][3] ~= 1 then
									     Parentage_final[exchanged_num].stackidx = l
									  end
                                      Parentage_final[exchanged_num].mode = 3
									  exchanged_num = exchanged_num + 1
									  Parentage_give_used = Parentage_give_used + 1
									  break
								   end
							   end
							   if Parentage_get[j][3] == 1 then
								  break
							   end
							   Parentage_get[j][1] = Parentage_pack.chemical[Parentage_give[i][1]][k][2]
							   Parentage_get[j][2] = math.ceil((Parentage_give[i][2] + Parentage_get[j][2])/2)
							   Parentage_get[j][3] = 1
							   Parentage_give[i][3] = 1
							   Parentage_final[exchanged_num].getidx = j
							   Parentage_final[exchanged_num].giveidx = i
                               Parentage_final[exchanged_num].resultid = Parentage_get[j][1]
                               Parentage_final[exchanged_num].density = Parentage_get[j][2]
							   Parentage_final[exchanged_num].mode = 3
							   exchanged_num = exchanged_num + 1
							   Parentage_give_used = Parentage_give_used + 1
							   break
							end
						end
						if Parentage_get[j][3] == 1 then
						   break
						end
					 end
				 end					 
			  end
			  if Parentage_give_used >= Parentage_give_num then
				 break
			  end
		  end
	   end
	   for i = 1,3 do
	       print("after mod3:get"..i.." = "..Parentage_get[i][1].."-"..Parentage_get[i][2])
	   end
	   --融入
	   blank_left = 3 - Parentage_get_num  
	   if Parentage_give_used < Parentage_give_num and blank_left >= 1 then
		  for i = 1,Parentage_give_num do  				  
			  if Parentage_give[i][3] ~= 1 then
				 for j = 1,3 do
					 if Parentage_get[j][1] == 0 then  --此处本来要验证是否为反应后剩下的空格，但暂时允许放入因吞噬反应多出的空格，记得改SERVER脚本
					    Parentage_get[j][1] = Parentage_give[i][1]
						Parentage_get[j][2] = Parentage_give[i][2]
						Parentage_get[j][3] = 1
						Parentage_give[i][3] = 1
                        Parentage_final[exchanged_num].getidx = j
						Parentage_final[exchanged_num].giveidx = i
						Parentage_final[exchanged_num].resultid = Parentage_get[j][1]
                        Parentage_final[exchanged_num].density = Parentage_get[j][2]
						Parentage_final[exchanged_num].mode = 4
						exchanged_num = exchanged_num + 1
						Parentage_get_num = Parentage_get_num + 1
						Parentage_give_used = Parentage_give_used + 1
						blank_left = blank_left - 1
						break
					 end
				 end
			  end				 
			  if Parentage_give_used >= Parentage_give_num or Blank_left == 0 then
				 break
			  end
		  end
	   end
	   for i = 1,3 do
	       print("after mod4:get"..i.." = "..Parentage_get[i][1].."-"..Parentage_get[i][2])
	   end
	   --替换，从浓度低的开始
	   if Parentage_give_used < Parentage_give_num then
		  for i = 1,Parentage_give_num do
			  if Parentage_give[i][3] ~= 1 then
				 for j = Parentage_get_num,1,-1 do
					 if Parentage_get[j][3] ~= 1 and Parentage_get[j][2] < Parentage_give[i][2] then
						Parentage_get[j][1] = Parentage_give[i][1]
						Parentage_get[j][2] = Parentage_give[i][2]
						Parentage_get[j][3] = 1
						Parentage_give[i][3] = 1
						Parentage_final[exchanged_num].getidx = j
                        Parentage_final[exchanged_num].giveidx = i
						Parentage_final[exchanged_num].resultid = Parentage_get[j][1]
                        Parentage_final[exchanged_num].density = Parentage_get[j][2]
						Parentage_final[exchanged_num].mode = 5
						exchanged_num = exchanged_num + 1
                        Parentage_give_used = Parentage_give_used + 1
						break
					 end
				 end
			  end
			  if Parentage_give_used >= Parentage_give_num then
				 break
			  end
		  end
	   end
	end
   
	if Parentage_get_num > 1 then
       for i = 1,Parentage_get_num do
	       for j = i+1,Parentage_get_num do
		       if Parentage_get[i][1] == Parentage_get[j][1] then
			      Parentage_get[i][2] = Parentage_get[i][2] + Parentage_get[j][2]
				  Parentage_get[j][1] = 0
				  Parentage_get[j][2] = 0
			   end
		   end
	   end
	end

	for i = 1,3 do
	    print("after mod5:get"..i.." = "..Parentage_get[i][1].."-"..Parentage_get[i][2])
	end

    Parentage_get = Parentage_pack:Parentage_taxis(Parentage_get)
	for i= 1,Parentage_get_num do
		ParentageDensity_sum = ParentageDensity_sum + Parentage_get[i][2]
	end
	if ParentageDensity_sum > 100 then
	   for i = 1,3 do
		   if ParentageDensity_sum - 100 >= Parentage_get[i][2] then
			  ParentageDensity_sum = ParentageDensity_sum - Parentage_get[i][2]
			  Parentage_get[i][1] = 0
			  Parentage_get[i][2] = 0
			  Parentage_get_num = Parentage_get_num - 1
		   else
			  Parentage_get[i][2] = Parentage_get[i][2] - ParentageDensity_sum + 100
			  break
		   end
	   end
	end
	Parentage_get = Parentage_pack:Parentage_taxis(Parentage_get)

	for i = 1,3 do
	    if Parentage_final[i].resultid >= 1 then  --对比最终结果，填写FINAL部分
		   for j = 1,Parentage_get_num do
		       if Parentage_final[i].resultid == Parentage_get[j][1] then
			      Parentage_final[i].finalidx = j
				  Parentage_final[i].finaldensity = Parentage_get[j][2]
			      break
			   end
		   end
		end
	end

	for i = 1,Parentage_give_num do  --填写give不反应血统
	    if Parentage_give[i][1] >= 1 and Parentage_give[i][3] == 0 then
	       for j = 1,Parentage_get_num do
		       get_used = 0
		       for k = 1,#Parentage_final do
			       if Parentage_final[k].getidx ~= 0 then
			          if pet_get_pack[Parentage_final[k].getidx][1] == Parentage_get[j][1] then
				         get_used = 1
					     break
					  end
				   end
		       end
		       if Parentage_get[j][3] == 0 and get_used == 0 then
			      if exchanged_num >= 4 then
		             Parentage_final[exchanged_num] = {getidx = 0 ,giveidx = 0 ,resultid = 0 ,density = 0 ,stackidx = 0 ,finalidx = 0 ,finaldensity = 0 ,mode = 0}
			      end
				  for l = 1,Parentage_get_num do
				      if Parentage_get[j][1] == pet_get_pack[l][1] then
			             Parentage_final[exchanged_num].getidx = l
						 break
				      end
				  end
                  Parentage_final[exchanged_num].giveidx = i
			      Parentage_final[exchanged_num].resultid = Parentage_get[j][1]
			      Parentage_final[exchanged_num].density = Parentage_get[j][2]
				  Parentage_final[exchanged_num].finalidx = j
                  Parentage_final[exchanged_num].finaldensity = Parentage_get[j][2]
			      Parentage_final[exchanged_num].mode = 6
			      exchanged_num = exchanged_num + 1
				  break
			   end
		   end
		end
	end
    
	for i = 1,Parentage_get_num do  --填写get不反应血统
	    if Parentage_get[i][1] >= 1 and Parentage_get[i][3] == 0 then
		   for j = 1,#Parentage_final do
		       if Parentage_final[j].resultid == Parentage_get[i][1] then
			      get_used = 1
				  break
			   elseif j == #Parentage_final then
			      get_used = 0
			   end
		   end
		   if get_used == 0 then
		      if exchanged_num >= 4 then
		         Parentage_final[exchanged_num] = {getidx = 0 ,giveidx = 0 ,resultid = 0 ,density = 0 ,stackidx = 0 ,finalidx = 0 ,finaldensity = 0 ,mode = 0}
		      end
		      for j = 1,#pet_get_pack do
		          if pet_get_pack[j][1] == Parentage_get[i][1] then 
		             Parentage_final[exchanged_num].getidx = j
			      end
		      end
		      Parentage_final[exchanged_num].resultid = Parentage_get[i][1]
              Parentage_final[exchanged_num].density = Parentage_get[i][2]
		      Parentage_final[exchanged_num].finalidx = i
		      Parentage_final[exchanged_num].finaldensity = Parentage_get[i][2]
		      exchanged_num = exchanged_num + 1
		   end
		end
    end

    for i = 1,#Parentage_final do
	    print("final"..i.." = "..Parentage_final[i].getidx.."-"..Parentage_final[i].giveidx.."-"..Parentage_final[i].resultid.."-"..Parentage_final[i].density.."-"..Parentage_final[i].stackidx.."-"..Parentage_final[i].finalidx.."-"..Parentage_final[i].finaldensity.."-"..Parentage_final[i].mode)
    end

	for i = 1,3 do
	    print("SevResult"..i.." = "..Parentage_get[i][1].."-"..Parentage_get[i][2])
	end

	return Parentage_final

end

	       
--[[test_get = {
				{1,1},
				{11,1},
				{3,1}
			}
test_give= {
				{7,7},
				{1,3},
				{9,1}
			}


Parentage_pack:Pet_Exchange_Preview(test_get,test_give)]]
