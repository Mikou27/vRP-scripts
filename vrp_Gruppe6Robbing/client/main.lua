--[[Original script [vrp_Gruppe6Robbing] by NENE(mikou)]]--
---https://forum.fivem.net/t/release-vrp-gruppe6robbing-gruppe6-armored-truck-robbing/290234
cfg = {}

vRP = Proxy.getInterface("vRP")
vRPserver = Tunnel.getInterface("vRP","vrp_Gruppe6Robbing")


local truckBlip = false
local moneyBlip = false
local spawn = false
local near = false
local notif = false
local door = false
local dist = false
local isCop = false
local copsGet = false
local cleanPeds = false
local attack = false

function Notification(text)
SetNotificationTextEntry("STRING")
AddTextComponentString(text)
DrawNotification(false, false)
end

function IconNotif(sprite,style,contact,title,text)
SetNotificationTextEntry("STRING")
AddTextComponentString(text)
SetNotificationMessage(sprite,sprite,true,style,contact,title, text)
DrawNotification(false, true)
end

function despawn()
if DoesEntityExist(thisBag) then
   DeleteObject(thisBag)
end
TriggerServerEvent("CReset")
cleanPeds = true
end

local blips = {}

function addBlip(name,entity,sprite,color,text,flash)
name = AddBlipForEntity(entity)
SetBlipSprite(name,sprite)
SetBlipColour(name,color)
SetBlipFlashes(name,flash)
BeginTextCommandSetBlipName("STRING")
AddTextComponentString(text)
EndTextCommandSetBlipName(name)
return name
end

function blipName(name,entity,sprite,color,text,flash)
blips.name = addBlip(name,entity,sprite,color,text,flash)
return blips
end

function removeblip(name)
if blips.name ~= nil then
   RemoveBlip(blips.name)
   blips.name = nil
end
end

function modelRequest(model)
 RequestModel(model)
 while not HasModelLoaded(model) do
 Wait(1)
 end
end

function AIConfig(ped,veh,seat,weapon)
SetPedIntoVehicle(ped,veh,seat)
SetPedRelationshipGroupHash(ped,GetHashKey("Ar_truck"))
SetDriverAbility(ped, 1.0)
SetPedFleeAttributes(ped, 0, 1)
GiveWeaponToPed(ped,weapon,-1,0,1)
SetPedCombatAttributes(ped, 2,1)
SetPedCombatAttributes(ped, 3,1)
end

Citizen.CreateThread(function()
 while true do
 Wait(0)
  if NetworkIsHost() then
     Wait(cfg.spawnTimer)
      spawn = true
     Wait(cfg.despawnTimer)
      despawn()
  end
 end
end)

Citizen.CreateThread(function()
while true do
 if NetworkIsHost() then
  if (not door) and (not attack) and (not cleanPeds) then
   local GRDpos = GetEntityCoords(thisPatriot)
   local ARpos = GetOffsetFromEntityInWorldCoords(thisTruck,0.0,-7.5,0.0)
   if (Vdist(ARpos.x,ARpos.y,ARpos.z,GRDpos.x,GRDpos.y,GRDpos.z) > 30) then
      Wait(300)
      TaskVehicleDriveToCoordLongrange(Grd_driver,thisPatriot,ARpos.x,ARpos.y,ARpos.z,25.0,524860,2.0)
   elseif
     (Vdist(ARpos.x,ARpos.y,ARpos.z,GRDpos.x,GRDpos.y,GRDpos.z) > 10) and (Vdist(ARpos.x,ARpos.y,ARpos.z,GRDpos.x,GRDpos.y,GRDpos.z) < 30)then
      Wait(300)
      TaskVehicleDriveToCoordLongrange(Grd_driver,thisPatriot,ARpos.x,ARpos.y,ARpos.z,15.0,786603,2.0)
   elseif
     (Vdist(ARpos.x,ARpos.y,ARpos.z,GRDpos.x,GRDpos.y,GRDpos.z) < 10) then
      Wait(300)
      TaskVehicleDriveToCoordLongrange(Grd_driver,thisPatriot,ARpos.x,ARpos.y,ARpos.z,6.0,786603,2.0)
   end
  end
 end
  Wait(0)
end
end)

Citizen.CreateThread(function()
 AddRelationshipGroup("Ar_truck")
 SetRelationshipBetweenGroups(0,GetHashKey("Ar_truck"),0xA49E591C)
 SetRelationshipBetweenGroups(0,0xA49E591C,GetHashKey("Ar_truck"))
  while true do
   Wait(0)
   local player = GetPlayerPed(-1)
   if spawn then
      local pos = cfg.positions[math.random(1, #cfg.positions)]

     -----------------------[Vehicles]---------------
      modelRequest(0x6827CF72)--stockade
      Armored_truck = CreateVehicle(0x6827CF72,pos.x,pos.y,pos.z,pos.h, true, true)
      SetVehicleOnGroundProperly(Armored_truck)
      SetVehicleTyresCanBurst(Armored_truck,0)
      SetVehicleDoorsLockedForAllPlayers(Armored_truck,1)
      Citizen.InvokeNative(0x06FAACD625D80CAA, Armored_truck)


      modelRequest(0xCFCFEB3B)--patriot
      Wait(100)
      local Grd_pos = GetOffsetFromEntityInWorldCoords(Armored_truck,0.0,-12.0,0.0)
      Grd_patriot = CreateVehicle(0xCFCFEB3B,Grd_pos.x,Grd_pos.y,Grd_pos.z,pos.h, true, true)
      SetVehicleDoorsLockedForAllPlayers(Grd_patriot,1)
      Citizen.InvokeNative(0x06FAACD625D80CAA,Grd_patriot)
      SetVehicleOnGroundProperly(Grd_patriot)
      SetVehicleTyresCanBurst(Grd_patriot,0)
      SetVehicleCustomPrimaryColour(Grd_patriot,94,201,110)
      SetVehicleCustomSecondaryColour(Grd_patriot,255,255,255)
      SetVehicleEngineOn(Grd_patriot,true,true,false)

      ---------------------[Peds]---------------------

      modelRequest(0xCDEF5408)
      modelRequest(0x63858A4A)
      modelRequest(0xB3F3EE34)
      modelRequest(0x7A05FA59)

      driver = CreatePed(4, 0xCDEF5408,pos.x,pos.y,pos.z,pos.h, true, true)
      AIConfig(driver,Armored_truck,-1,GetHashKey("WEAPON_PUMPSHOTGUN"))
      TaskVehicleDriveWander(driver,Armored_truck,20.0,786603)


      passenger = CreatePed(4, 0x63858A4A,pos.x,pos.y,pos.z,pos.h, true, true)
      AIConfig(passenger,Armored_truck,-2,GetHashKey("WEAPON_PUMPSHOTGUN"))

      Wait(100)

      Grd_driver = CreatePed(4,0xB3F3EE34,Grd_pos.x,Grd_pos.y,Grd_pos.z,pos.h, true, true)
      AIConfig(Grd_driver, Grd_patriot,-1,GetHashKey("WEAPON_ASSAULTRIFLE"))

      Grd_passenger1 = CreatePed(4,0x7A05FA59,Grd_pos.x,Grd_pos.y,Grd_pos.z,pos.h, true, true)
      AIConfig(Grd_passenger1, Grd_patriot,0,GetHashKey("WEAPON_PUMPSHOTGUN"))

      Grd_passenger2 = CreatePed(4,0x7A05FA59,Grd_pos.x,Grd_pos.y,Grd_pos.z,pos.h, true, true)
      AIConfig(Grd_passenger2, Grd_patriot,1,GetHashKey("WEAPON_MICROSMG"))

      Grd_passenger3 = CreatePed(4,0xB3F3EE34,Grd_pos.x,Grd_pos.y,Grd_pos.z,pos.h, true, true)
      AIConfig(Grd_passenger3, Grd_patriot,2,GetHashKey("WEAPON_ASSAULTRIFLE"))

      Wait(200)
      TruckID = VehToNet(Armored_truck)
      GrdpID = VehToNet(Grd_patriot)

      Citizen.InvokeNative(0xE05E81A888FA63C8,TruckID,1)
      Citizen.InvokeNative(0xE05E81A888FA63C8,GrdpID,1)

      Wait(250)
      TriggerServerEvent("IDS",TruckID,GrdpID)
      spawn = false
   end

   if NetworkDoesNetworkIdExist(T_toNet) and NetworkDoesNetworkIdExist(G_toNet) then
      if not truckBlip then
         thisTruck = NetToVeh(T_toNet)
         thisPatriot = NetToVeh(G_toNet)
         TriggerServerEvent("IsPlyAcop")
         Wait(500)
         if isCop then
            IconNotif("CHAR_ANDREAS",4,cfg.lang.copsSpawnNotif.contact,cfg.lang.copsSpawnNotif.title,cfg.lang.copsSpawnNotif.msg)
            blipName(Ar_truck_blip,thisTruck,67,75,cfg.lang.onMapBlipName_truck,1)
         else
            IconNotif("CHAR_HUMANDEFAULT",4,cfg.lang.spawnNotif.contact,cfg.lang.spawnNotif.title,cfg.lang.spawnNotif.msg)
            blipName(Ar_truck_blip,thisTruck,67,2,cfg.lang.onMapBlipName_truck,0)
         end
         truckBlip = true
      end

      local pickupos = GetOffsetFromEntityInWorldCoords(thisTruck,0.0,-4.5,0.0)
      local obj = GetEntityCoords(thisBag)
      local plyPos = GetEntityCoords(player)

        if GetVehicleDoorAngleRatio(thisTruck,2) >= 0.0100 and GetVehicleDoorAngleRatio(thisTruck,3) >= 0.0100 and (not door) then
           removeblip(Ar_truck_blip)

           if NetworkIsHost() then
              local robPos = GetEntityCoords(thisTruck)
              local zone = GetNameOfZone(robPos.x,robPos.y,robPos.z)

              --TriggerServerEvent("Cops",robPos.x,robPos.y,robPos.z,zone)
              modelRequest(GetHashKey("prop_money_bag_01"))
              money_bag = CreateObject (GetHashKey("prop_money_bag_01"),pickupos.x, pickupos.y, pickupos.z ,true, true, true)
              PlaceObjectOnGroundProperly(money_bag )
              FreezeEntityPosition(money_bag ,1)
           end
           Wait(200)
           netBag = ObjToNet(money_bag)
           Wait(200)
           TriggerServerEvent("objID",netBag)
           door = true
        end

        if NetworkDoesNetworkIdExist(O_toNet) then
           thisBag = NetToObj(O_toNet)
           if not moneyBlip then
              Wait(500)
              blipName(money_bag_blip,thisBag,108,24,cfg.lang.onMapBlipName_money,0)
              FreezeEntityPosition(thisBag,0)------------------------------------------------------------------------------------
              moneyBlip = true
           end
        end


        if HasEntityBeenDamagedByEntity(thisTruck, player,1) and not attack and (not isCop) or HasEntityBeenDamagedByEntity(thisPatriot,player,1) and not attack and (not isCop) then
           if GetPlayerWantedLevel(PlayerId()) <= 4 then
              SetPlayerWantedLevel(PlayerId(), 4, 0)
              SetPlayerWantedLevelNow(PlayerId(), 0)
           end
           local robPos = GetEntityCoords(thisTruck)
           local zone = GetNameOfZone(robPos.x,robPos.y,robPos.z)
           TriggerServerEvent("Cops",robPos.x,robPos.y,robPos.z,zone)
           attack = true
        end

        if DoesEntityExist(thisBag) then
           DrawMarker(0, obj.x, obj.y, obj.z+1.5, 0.0, 0.0,0.0, 0.0, 0.0,0.0, 0.5, 0.5, 0.45, 49,209, 50, 100, 1, 0, 2, 0, 0, 0, 0)
        end

        if IsEntityAtCoord(player,obj.x, obj.y, obj.z,0.50,0.50, 4.0, 0, 1, 0) and IsPedOnFoot(player) and DoesEntityExist(thisTruck) and DoesEntityExist(thisBag) and (not near) then
           DeleteObject(thisBag)
           PlaySoundFrontend(-1,"PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
           if isCop then
              Notification(cfg.lang.cops_Collect_money)
              copsGet = true
           else
              TriggerServerEvent("giveMoney")
              local suspectPlate = GetVehicleNumberPlateText(GetPlayersLastVehicle())
              local getVehHash = GetEntityModel(GetPlayersLastVehicle())
              local suspectVehModel = GetDisplayNameFromVehicleModel(getVehHash)
              Wait(100)
              if suspectVehModel ~= "STOCKADE" and suspectVehModel ~= "PATRIOT" then
                 TriggerServerEvent("svCopClue",suspectPlate,suspectVehModel)
              end
           end
           despawn()
        end


        if DoesEntityExist(thisTruck) and GetEntityHealth(thisTruck) < 1 and (not near) then
           removeblip(Ar_truck_blip)
           if (Vdist(plyPos.x,plyPos.y,plyPos.z,obj.x,obj.y,obj.z) < 100) and (not isCop) then
               Notification(cfg.lang.destroyedTruckNotif)
           end

           if DoesEntityExist(thisBag) then
              DeleteObject(thisBag)
           end
           despawn()
        end

        if vRP.isInComa() then
           if DoesEntityExist(thisBag) then
              removeblip(money_bag_blip)
           end
        end
   end
 end
end)

------------------------------------[Events]-------------------------------------------

RegisterNetEvent("IDS")
AddEventHandler("IDS", function(T_ID,G_ID)
 T_toNet = T_ID
 G_toNet = G_ID
end)

RegisterNetEvent("sharedObj")
AddEventHandler("sharedObj", function(O_ID)
 O_toNet = O_ID
end)

RegisterNetEvent("sharedPickupCheck")
AddEventHandler("sharedPickupCheck", function(nearMoney)
  near = nearMoney
end)

RegisterNetEvent("rewardNotif")
AddEventHandler("rewardNotif", function(reward)
Notification(cfg.lang.rewardnotif[1]..reward..cfg.lang.rewardnotif[2])
end)

RegisterNetEvent("IsCop")
AddEventHandler("IsCop", function()
isCop = true
SetRelationshipBetweenGroups(0, GetHashKey("Ar_truck"), GetHashKey("PLAYER"))
SetRelationshipBetweenGroups(0, GetHashKey("PLAYER"), GetHashKey("Ar_truck"))
end)


RegisterNetEvent("sharedPlate")
AddEventHandler("sharedPlate", function(plate,suspectModel)
if isCop and (not copsGet) then
   if plate ~= nil then
      IconNotif("CHAR_DEFAULT",4,"~g~Radio",cfg.lang.cops_Veh_plate[1],cfg.lang.cops_Veh_plate[2]..plate..cfg.lang.cops_Veh_plate[3]..suspectModel)
   else
      Notification(cfg.lang.copsNoClueNofif)
   end
end
end)

RegisterNetEvent("clientReset")
AddEventHandler("clientReset", function()
removeblip(Ar_truck_blip)
door = false
near = false
notif = false
attack = false
T_toNet = nil
G_toNet = nil
O_toNet = nil
moneyBlip = false
truckBlip = false
wanted = false
isCop = false
copsGet = false
blips = {}
end)
---------------------------------------------------------------------------------------


Citizen.CreateThread(function()
 while true do
 Wait(10000)
  if NetworkIsHost() then
    if cleanPeds then
      Wait(120000)
      SetEntityAsNoLongerNeeded(Armored_truck)
      SetEntityAsNoLongerNeeded(Grd_patriot)
      SetEntityAsNoLongerNeeded(driver)
      SetEntityAsNoLongerNeeded(passenger)
      SetEntityAsNoLongerNeeded(Grd_passenger1)
      SetEntityAsNoLongerNeeded(Grd_driver)
      SetEntityAsNoLongerNeeded(Grd_passenger2)
      SetEntityAsNoLongerNeeded(Grd_passenger3)
      SetModelAsNoLongerNeeded(0x63858A4A)
      SetModelAsNoLongerNeeded(0xCFCFEB3B)
      SetModelAsNoLongerNeeded(0xCDEF5408)
      SetModelAsNoLongerNeeded(0xB3F3EE34)
      SetModelAsNoLongerNeeded(0x7A05FA59)
      ClearRelationshipBetweenGroups(0, GetHashKey("Ar_truck"), GetHashKey("PLAYER"))
      ClearRelationshipBetweenGroups(0, GetHashKey("PLAYER"), GetHashKey("Ar_truck"))
      cleanPeds = false
    end
  end
 end
end)