-----------------------------------------------------------
--[[Original ###vrp_carjcaking### Script BY NéNé(mikou)]]--
-----------------------------------------------------------

--[[ List of vehicle class 
0: Compacts	 
1: Sedans  
2: SUVs	 
3: Coupes  
4: Muscle  
5: Sports Classics	
6: Sports  
7: Super  
8: Motorcycles	
9: Off-road	 
10: Industrial	
11: Utility	 
12: Vans  
13: Cycles	
14: Boats  
15: Helicopters	 
16: Planes	
17: Service	 
18: Emergency  
19: Military  
20: Commercial	
21: Trains	
-Souce-> https://runtime.fivem.net/doc/natives/#_0x29439776AAA00A62 ]]

local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vrp_carjacking")

local Class = {}
local Damage = {}


--[!!!Only set one boolean true at once!!!]--
										   --
-------------[use a group/job]---------------
local useGroup = false					   --
---------------------------------------------			
										   --
-----------[use permission]------------------		 
local usePermission = false				   --
---------------------------------------------			
										   --
-------[use multiples permissions]-----------
local useMultiplesPermissions = false	   --
---------------------------------------------
										   --
------------[no permissions]-----------------
local noPermission = true				   --
---------------------------------------------


--------------------[check player group]-----------------------															   
if useGroup then											 --
-------------------------[config]------------------------------
local group = "Deal weed" --add your group(job) here		 --
---------------------------------------------------------------															   
RegisterServerEvent('perm:carjacking')						 --	  
AddEventHandler('perm:carjacking', function()				 --
local user_id = vRP.getUserId({source})						 --
	if(user_id)then											 --
	  if vRP.hasGroup({user_id,group})	then				 --
		 local perm = true									 --
		 TriggerClientEvent('carjacking_perm:OK',source,perm)--
	  else													 --
		 local perm = false									 --
		 TriggerClientEvent('carjacking_perm:OK',source,perm)--
	  end													 --
	end														 --
end)														 --
end															 --
---------------------------------------------------------------

------------------------[check player permission]--------------------------
if usePermission then													 --																			
-----------------------------[config]--------------------------------------
local permission = "mission.weedseller.weed" --add your permission here	 --
---------------------------------------------------------------------------																		  
RegisterServerEvent('perm:carjacking')									 --
AddEventHandler('perm:carjacking', function()							 --
local user_id = vRP.getUserId({source})									 --
	if(user_id)then														 --
	  if vRP.hasPermission({user_id,permission})  then					 --
		 local perm = true												 --
		 TriggerClientEvent('carjacking_perm:OK',source,perm)			 --
	  else																 --
		 local perm = false												 --
		 TriggerClientEvent('carjacking_perm:OK',source,perm)			 --
	  end																 --
	end																	 --
end)																	 --
end																		 --
---------------------------------------------------------------------------

---------------------------------------[check player multiples permission]----------------------------------------
if useMultiplesPermissions then																					--																											
---------------------------[config]-------------------------------------------------------------------------------
local permissions = "mission.weedseller.weed","emergency.market","drugseller.market" --add your permissions here--
------------------------------------------------------------------------------------------------------------------																											
RegisterServerEvent('perm:carjacking')																			--
AddEventHandler('perm:carjacking', function()																	--
local user_id = vRP.getUserId({source})																			--
	if(user_id)then																								--
	  if vRP.hasPermission({user_id,permissions})  then															--
		 local perm = true																						--
		 TriggerClientEvent('carjacking_perm:OK',source,perm)													--
	  else																										--
		 local perm = false																						--
		 TriggerClientEvent('carjacking_perm:OK',source,perm)													--
	  end																										--
	end																											--
end)																											--
end																												--
------------------------------------------------------------------------------------------------------------------

---------------------[set no permission]-----------------------															   
if noPermission then										 --														   
RegisterServerEvent('perm:carjacking')						 --
AddEventHandler('perm:carjacking', function()				 --											 
local perm = true											 --
local noLoop = true											 --
TriggerClientEvent('carjacking_perm:OK',source,perm,noLoop)	 --																												 
end)														 --
end															 --
---------------------------------------------------------------

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
	  vRPclient.notifyPicture(player,{"CHAR_BLOCKED",4, "Infos", "","~w~Descends du ~b~vehicule et vas voir le receleur."})	--get out
   end

end)

RegisterServerEvent('taff_ok:veh')
AddEventHandler('taff_ok:veh', function()			  
local user_id = vRP.getUserId({source})
local player = vRP.getUserSource({user_id})
   
   if(user_id)then
	  vRPclient.notifyPicture(player,{"CHAR_JOE",4, "Receleur", "Vous dit...",'"~g~Beau boulot! Reviens quand tu veux."'})--good job
   end

end)

RegisterServerEvent('flic_notok:veh')
AddEventHandler('flic_notok:veh', function()			 
local user_id = vRP.getUserId({source})
local player = vRP.getUserSource({user_id})
   
   if(user_id)then
	   vRPclient.notifyPicture(player,{"CHAR_JOE",4, "Receleur", "Vous dit...",'"~w~Sémes les ~r~flics ~w~et reviens."'})--must clear your wanted level
   end

end)
