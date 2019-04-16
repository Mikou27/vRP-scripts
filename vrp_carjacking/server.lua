local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vrp_carjacking")

local Class = {}

RegisterServerEvent('deposit_ok:give')
AddEventHandler('deposit_ok:give', function(Class)			   
local user_id = vRP.getUserId({source})
	
	
  if(user_id)then
	 Wait(2500)
	 
	 if Class == 0 then			  
			print(Class)
			vRP.giveInventoryItem({user_id,"dirty_money",math.random(6000,11000),1})			
			--vRP.varyExp({user_id,"criminel","braquage",2})
	 
	 elseif Class == 1 then
			 print(Class)
			 vRP.giveInventoryItem({user_id,"dirty_money",math.random(4000,8000),1})			
			 --vRP.varyExp({user_id,"criminel","braquage",2})
	 
	 elseif Class == 2 then
			print(Class)
			vRP.giveInventoryItem({user_id,"dirty_money",math.random(9000,15000),1})			
			--vRP.varyExp({user_id,"criminel","braquage",2})
	
	 elseif Class == 3 then 
		   print(Class)
		   vRP.giveInventoryItem({user_id,"dirty_money",math.random(6000,11000),1})			
		   --vRP.varyExp({user_id,"criminel","braquage",2}) 
	 
	 elseif Class == 4 then 
			print(Class)
			vRP.giveInventoryItem({user_id,"dirty_money",math.random(8000,13000),1})			
			--vRP.varyExp({user_id,"criminel","braquage",2}) 
	 
	 elseif Class == 5 then 
			print(Class)
			vRP.giveInventoryItem({user_id,"dirty_money",math.random(12000,20000),1})			
			--vRP.varyExp({user_id,"criminel","braquage",2}) 
	 
	 elseif Class == 6 then
			print(Class)
			vRP.giveInventoryItem({user_id,"dirty_money",math.random(9000,16000),1})			
			--vRP.varyExp({user_id,"criminel","braquage",2})
	 
	 elseif Class == 7 then 
			print(Class)
			vRP.giveInventoryItem({user_id,"dirty_money",math.random(25000,35000),1})			
			--vRP.varyExp({user_id,"criminel","braquage",2}) 
	 
	 elseif Class == 8 then 
			print(Class)
			vRP.giveInventoryItem({user_id,"dirty_money",math.random(6000,9000),1})			
			--vRP.varyExp({user_id,"criminel","braquage",2}) 
	 
	 elseif Class == 9 then 
			print(Class)
			vRP.giveInventoryItem({user_id,"dirty_money",math.random(5000,10000),1})			
			--vRP.varyExp({user_id,"criminel","braquage",2}) 
	 
	 
	 elseif Class == 12 then 
			print(Class)
			vRP.giveInventoryItem({user_id,"dirty_money",math.random(1500,6000),1})			
			--vRP.varyExp({user_id,"criminel","braquage",2}) 
	 end	
  end
end)

RegisterServerEvent('descendre_ok:veh')
AddEventHandler('descendre_ok:veh', function()			   
local user_id = vRP.getUserId({source})
local player = vRP.getUserSource({user_id})
   
   if(user_id)then
	  vRPclient.notify(player,{"~w~Descends du ~b~vehicule."})--get out of the vehicle
   end

end)

RegisterServerEvent('taff_ok:veh')
AddEventHandler('taff_ok:veh', function()			  
local user_id = vRP.getUserId({source})
local player = vRP.getUserSource({user_id})
   
   if(user_id)then
	  vRPclient.notify(player,{"~g~Beau boulot! Reviens quand tu veux."})--good job 
   end

end)

RegisterServerEvent('flic_notok:veh')
AddEventHandler('flic_notok:veh', function()			 
local user_id = vRP.getUserId({source})
local player = vRP.getUserSource({user_id})
   
   if(user_id)then
	  vRPclient.notify(player,{"~w~Sémes les ~r~flics ~w~et reviens."})--must clear your wanted level
   end

end)