local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vrp_carjacking")

local Class = {}
local Damage = {}

RegisterServerEvent('deposit_ok:give')
AddEventHandler('deposit_ok:give', function(Class,Damage)			   
local user_id = vRP.getUserId({source})
		
  if(user_id)then
	-- print(Damage)
	 Wait(2500)
	 
	 if Class == 0 then			  
			--print(Class)
			vRP.giveInventoryItem({user_id,"dirty_money",math.floor(math.random(6000,11000)*Damage),1})			
			--vRP.varyExp({user_id,"criminel","braquage",2})
	 
	 elseif Class == 1 then
			-- print(Class)
			 vRP.giveInventoryItem({user_id,"dirty_money",math.floor(math.random(4000,8000)*Damage),1})			
			 --vRP.varyExp({user_id,"criminel","braquage",2})
	 
	 elseif Class == 2 then
			--print(Class)
			vRP.giveInventoryItem({user_id,"dirty_money",math.floor(math.random(9000,15000)*Damage),1})			
			--vRP.varyExp({user_id,"criminel","braquage",2})
	
	 elseif Class == 3 then 
		   --print(Class)
		   vRP.giveInventoryItem({user_id,"dirty_money",math.floor(math.random(6000,11000)*Damage),1})			
		   --vRP.varyExp({user_id,"criminel","braquage",2}) 
	 
	 elseif Class == 4 then 
			--print(Class)
			vRP.giveInventoryItem({user_id,"dirty_money",math.floor(math.random(8000,13000)*Damage),1})			
			--vRP.varyExp({user_id,"criminel","braquage",2}) 
	 
	 elseif Class == 5 then 
			--print(Class)
			vRP.giveInventoryItem({user_id,"dirty_money",math.floor(math.random(12000,20000)*Damage),1})			
			--vRP.varyExp({user_id,"criminel","braquage",2}) 
	 
	 elseif Class == 6 then
			--print(Class)
			vRP.giveInventoryItem({user_id,"dirty_money",math.floor(math.random(9000,16000)*Damage),1})			
			--vRP.varyExp({user_id,"criminel","braquage",2})
	 
	 elseif Class == 7 then 
			--print(Class)
			vRP.giveInventoryItem({user_id,"dirty_money",math.floor(math.random(25000,35000)*Damage),1})			
			--vRP.varyExp({user_id,"criminel","braquage",2}) 
	 
	 elseif Class == 8 then 
			--print(Class)
			vRP.giveInventoryItem({user_id,"dirty_money",math.floor(math.random(6000,9000)*Damage),1})			
			--vRP.varyExp({user_id,"criminel","braquage",2}) 
	 
	 elseif Class == 9 then 
			--print(Class)
			vRP.giveInventoryItem({user_id,"dirty_money",math.floor(math.random(5000,10000)*Damage),1})			
			--vRP.varyExp({user_id,"criminel","braquage",2}) 
	 
	 
	 elseif Class == 12 then 
			--print(Class)
			vRP.giveInventoryItem({user_id,"dirty_money",math.floor(math.random(1500,6000)*Damage),1})			
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