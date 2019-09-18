--[[Original script [vrp-Gruppe6Robbing] by NENE(mikou)]]--
---https://forum.fivem.net/t/release-vrp-gruppe6robbing-gruppe6-armored-truck-robbing/290234

vRP = Proxy.getInterface("vRP")
vRPserver = Tunnel.getInterface("vRP","vrp-Gruppe6Robbing")

-----------------------------------[[[SETTINGS]]]-------------------------------------
--------------------------------------------------------------------------------------
---------------[SPAWN TIMER]---------------------
local spawnTimer = math.random(1200000,1600000)
-------------------------------------------------

---------------[DESPAWN TIMER]-------------------
local despawnTimer = math.random(1200000,1600000)
-------------------------------------------------

---------------------------------------[TEXTS]----------------------------------------
local spawnNotif = {
contact = "Informateur",
title = "~r~Un sale boulot.",
msg = "~g~Un fourgon blindé vient d'être repéré,prépares tes bombes collantes."
}

local rewardnotif = {"Vous avez reçu ~g~"," ~w~$ d'argent sale."}
local onMapBlipName_truck = "Fourgon blindé"
local onMapBlipName_money = "Sac d'argent sale"
local destroyedTruckNotif = "~r~L'argent a était détruit."
local moneyPickup =  "~y~L'argent a était ramassé."
local failNotif = "~y~Le butin d'un braquage de fourgon n'a pas était ramassé faites vite!~g~(3min)"
--------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------

--------------------------------[Variables]-------------------------------------------
local truckBlip = false
local moneyBlip = false
local spawn = false
local money = false
local check = false
local near = false
local notif = false
local door = false
local fail = false
---------------------------------------------------------------------------------------
--------------------------------[functions]--------------------------------------------
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
if fail then
   Notification(failNotif)
   Wait(180000)
   fail = false
   DeleteObject(thisBag)
end
truckBlip = false
moneyBlip = false
door = false
SetEntityAsNoLongerNeeded(thisTruck)
SetModelAsNoLongerNeeded(0x6827CF72)
T_toNet = nil
Wait(120000)
SetEntityAsNoLongerNeeded(driver)
SetModelAsNoLongerNeeded(0xCDEF5408)
SetEntityAsNoLongerNeeded(passenger)
SetModelAsNoLongerNeeded(0x63858A4A)
near = false
notif = false
end

local blips = {}

function addBlip(name,entity,sprite,color,text)
name = AddBlipForEntity(entity)
SetBlipSprite(name,sprite)
SetBlipColour(name,color)
BeginTextCommandSetBlipName("STRING")
AddTextComponentString(text)
EndTextCommandSetBlipName(name)
return name
end

function blipName(name,entity,sprite,color,text)
blips.name = addBlip(name,entity,sprite,color,text)
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

function start_reset()
 spawn = true
 money = false
end
-------------------------------------------------------------------------------------
-----------------------------------[Table]-------------------------------------------
local positions = {--spawn position
{x=241.11,y=-1018.93,z=29.23,h=335.10},
{x=-387.61,y=-376.46,z=31.76,h=81.07},
{x=-984.17,y=-831.63,z=15.49,h=237.51},
{x=543.39,y=249.37,z=103.10,h=249.54},
{x=258.84,y=-1697.63,z=29.11,h=317.59},
{x=-1624.92,y=-428.73,z=39.65,h=320.0},
{x=-295.99,y=-204.59,z=33.18,h=38.22},
{x=807.14,y=-1231.17,z=26.33,h=353.39},
{x=1033.68,y=-216.52,z=70.13,h=242.71},
{x=-905.01,y=-1797.69,z=36.99,h=146.61},
{x=1189.49,y=-1898.83,z=34.62,h=14.53},
{x=1168.30,y=-991.09,z=70.13,h=6.04},
{x= 266.79,y= -570.0,z= 43.31,h=340.78},
{x= 277.58,y= -553.66,z= 43.31,h=342.44},
{x= -1728.26,y= 43.02,z= 67.29,h=35.35},
{x= -434.33,y= -1552.94,z= 38.74,h=156.67},
{x= 456.93,y= -2101.35,z= 21.94,h=319.39},
{x= -1106.95,y= 261.65,z= 63.70,h=264.80},
{x= -229.12,y= -612.21,z= 33.18,h=341.27},
{x=-1193.14,y=-849.12,z=14.11,h=127.46},
{x=-74.69,y= 52.77,z=71.90,h=45.60},
{x=-508.51,y= 260.90,z=83.02,h=78.01},
{x=-255.95,y=-777.38,z=32.53,h=337.59}

}
---------------------------------------------------------------------------------------


Citizen.CreateThread(function()
 while true do
 Wait(0)
  if  NetworkIsHost() then
    Wait(spawnTimer)
      start_reset()
    Wait(despawnTimer)
      despawn()
  end
 end
end)

Citizen.CreateThread(function()
 AddRelationshipGroup("Ar_truck")
 SetRelationshipBetweenGroups(0,GetHashKey("Ar_truck"),0xA49E591C)
 SetRelationshipBetweenGroups(0,0xA49E591C,GetHashKey("Ar_truck"))
  while true do
   Wait(0)

   if spawn then

       modelRequest(0x6827CF72)
       modelRequest(0x63858A4A)
       modelRequest(0xCDEF5408)

       local pos = positions[math.random(1, #positions)]
       Armored_truck = CreateVehicle(0x6827CF72, pos.x,pos.y,pos.z,pos.h, true, true) -- "stockade"
       SetVehicleOnGroundProperly( Armored_truck)
       Citizen.InvokeNative(0x06FAACD625D80CAA, Armored_truck)
       driver = CreatePed(4, 0xCDEF5408,pos.x,pos.y,pos.z,pos.h, true, true)
       passenger = CreatePed(4, 0x63858A4A,pos.x,pos.y,pos.z,pos.h, true, true)
       SetPedIntoVehicle(driver,Armored_truck, -1)
       SetPedIntoVehicle(passenger,Armored_truck, -2)
       TaskVehicleDriveWander(driver,Armored_truck,35.0, 786603)
       SetPedRelationshipGroupHash(driver,GetHashKey("Ar_truck"))
       SetPedRelationshipGroupHash(passenger,GetHashKey("Ar_truck"))
       SetDriverAbility(driver, 10.0)
       SetPedFleeAttributes(driver, 0, 1)
       SetPedFleeAttributes(passenger, 0, 1)
       GiveWeaponToPed(driver, GetHashKey("WEAPON_PUMPSHOTGUN"),-1,0,1)
       GiveWeaponToPed(passenger, GetHashKey("WEAPON_PUMPSHOTGUN"),-1,0,1)
       Wait(200)
       TruckID = VehToNet(Armored_truck)
       Citizen.InvokeNative(0xE05E81A888FA63C8,TruckID,1)
       Wait(250)
       TriggerServerEvent('truckID',TruckID)
       spawn = false

   end

   if NetworkDoesNetworkIdExist(T_toNet) then
      if not truckBlip then
         thisTruck = NetToVeh(T_toNet)
		 Wait(200)
         blipName(Ar_truck_blip,thisTruck,67,2,onMapBlipName_truck)
         IconNotif("CHAR_HUMANDEFAULT",4,spawnNotif.contact,spawnNotif.title,spawnNotif.msg)
         check = true
         truckBlip = true
      end

      local pickupos = GetOffsetFromEntityInWorldCoords(thisTruck,0.0,-4.5,0.0)
      local obj = GetEntityCoords(thisBag)

        if GetVehicleDoorAngleRatio(thisTruck,2) >= 0.0100 and GetVehicleDoorAngleRatio(thisTruck,3) >= 0.0100 and (not door) then
            local robPos = GetEntityCoords(thisTruck)
            local zone = GetNameOfZone(robPos.x,robPos.y,robPos.z)
            TriggerServerEvent('Cops',robPos.x,robPos.y,robPos.z,zone)
            TaskCombatPed(driver,GetPlayerPed(-1),0,16)
            TaskCombatPed(passenger,GetPlayerPed(-1),0,16)
            removeblip(Ar_truck)

            if not money then
              if GetPlayerWantedLevel(PlayerId()) <= 4 then
                 SetPlayerWantedLevel(PlayerId(), 4, 0)
                 SetPlayerWantedLevelNow(PlayerId(), 0)
              end

              if NetworkIsHost() then
                 modelRequest(GetHashKey("prop_money_bag_01"))
                 money_bag = CreateObject (GetHashKey("prop_money_bag_01"),pickupos.x, pickupos.y, pickupos.z ,true, true, true)
                 PlaceObjectOnGroundProperly(money_bag )
                 FreezeEntityPosition(money_bag ,1)
              end
              Wait(200)
              netBag = ObjToNet(money_bag)
              Wait(150)
              TriggerServerEvent('objID',netBag)
              money = true
            end
              door = true
        end

        if NetworkDoesNetworkIdExist(O_toNet) then
           if not moneyBlip then

              thisBag = NetToObj(O_toNet)
              Wait(200)
              blipName(money_bag_blip,thisBag,108,24,onMapBlipName_money)
              moneyBlip = true
              FreezeEntityPosition(thisBag,0)------------------------------------------------------------------------------------
           end
        end

        if DoesEntityExist(thisBag) then
           DrawMarker(0, obj.x, obj.y, obj.z+1.5, 0.0, 0.0,0.0, 0.0, 0.0,0.0, 0.5, 0.5, 0.45, 49,209, 50, 100, 1, 0, 2, 0, 0, 0, 0)
        end

        if IsEntityAtCoord(GetPlayerPed(-1),obj.x, obj.y, obj.z,0.50,0.50, 4.0, 0, 1, 0) and IsPedOnFoot(GetPlayerPed(-1)) and DoesEntityExist(thisTruck) and DoesEntityExist(thisBag)then
           TriggerServerEvent('check:Pos')
           Wait(200)
           PlaySoundFrontend(-1,"PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
           Wait(100)
           DeleteObject(thisBag)
           check = false
           TriggerServerEvent('give_ok:give')
           despawn()
        end

        if near and (not notif) then
           Notification(moneyPickup)
           notif = true
        end

        if DoesEntityExist(thisTruck) and GetEntityHealth(thisTruck) < 1 and check and (not near) then
           removeblip(Ar_truck)
           Notification(destroyedTruckNotif)
           if DoesEntityExist(thisBag) then
              DeleteObject(thisBag)
           end
           despawn()
        end

        if vRP.isInComa() then
           if DoesEntityExist(thisBag) then
              removeblip(money_bag_blip)
              fail = true
              despawn()
           end
        end
   end
 end
end)


------------------------------------[Events]-------------------------------------------
RegisterNetEvent('sharedID')
AddEventHandler('sharedID', function(T_ID)
 T_toNet = T_ID
end)

RegisterNetEvent('sharedObj')
AddEventHandler('sharedObj', function(O_ID)
 O_toNet = O_ID
end)

RegisterNetEvent('sharedPos')
AddEventHandler('sharedPos', function(nearMoney)
  near = nearMoney
end)

RegisterNetEvent('rewardNotif')
AddEventHandler('rewardNotif', function(reward)
Notification(rewardnotif[1]..reward..rewardnotif[2])
end)
---------------------------------------------------------------------------------------
