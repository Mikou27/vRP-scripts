
--[[Original script [vrp-Gruppe6Robbing] by NENE(mikou)]]--


-----------------------------------[[[SETTINGS]]]-------------------------------------
--------------------------------------------------------------------------------------
---------------[SPAWN TIMER]----------------
local spawnTimer =  math.random(1200000,1600000)
--------------------------------------------

---------------[DESPAWN TIMER]-------------------
local despawnTimer = math.random(1200000,1600000)
-------------------------------------------------
---------------------------------------[TEXTS]----------------------------------------
local spawnNotif = {contact = "Informateur",
                    title = "~r~Un sale boulot.",
                    msg = "~g~Un fourgon blindé vient d'être repéré,prépares tes bombes collantes."
                    }

local onMapBlipName_truck = "Fourgon blindé"
local onMapBlipName_money = "Sac d'argent sale"
local destroyedTruckNotif = {notif = "~r~L'argent a était détruit."}
--------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------
vRP = Proxy.getInterface("vRP")
vRPserver = Tunnel.getInterface("vRP","vrp-Gruppe6Robbing")

local spawn = false
local money = false
local check = false

function despawn()
check = false
Wait(120000)
SetEntityAsNoLongerNeeded(Armored_truck)
SetModelAsNoLongerNeeded(0x6827CF72)

SetEntityAsNoLongerNeeded(driver)
SetModelAsNoLongerNeeded(0xCDEF5408)

SetEntityAsNoLongerNeeded(passenger)
SetModelAsNoLongerNeeded(0x63858A4A)

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

local positions = {--spawn position
{x=241.11,y=-1018.93,z=29.23,h=335.10},
{x=-387.61,y=-376.46,z=31.76,h=81.07},
{x=-984.17,y=-831.63,z=15.49,h=237.51},
{x=552.48,y=256.65,z=103.06,h=248.65},
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
{x=-1193.14,y=-849.12,z=14.11,h=127.46}
}

Citizen.CreateThread(function()
 while true do

    Wait(spawnTimer)
      start_reset()

    Wait(despawnTimer)
      despawn()
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

       Armored_truck = CreateVehicle(0x6827CF72, pos.x,pos.y,pos.z,pos.h, true, false)        ---fourgon blindé "stockade"
       driver = CreatePed(4, 0xCDEF5408,pos.x,pos.y,pos.z,pos.h, true, true)
       passenger = CreatePed(4, 0x63858A4A,pos.x,pos.y,pos.z,pos.h, true, true)

       SetPedIntoVehicle(driver, Armored_truck, -1)
       SetPedIntoVehicle(passenger, Armored_truck, -2)
       TaskVehicleDriveWander(driver,Armored_truck,35.0, 786603)
       SetPedRelationshipGroupHash(driver,GetHashKey("Ar_truck"))
       SetPedRelationshipGroupHash(passenger,GetHashKey("Ar_truck"))
       SetDriverAbility(driver, 10.0)
       SetPedFleeAttributes(driver, 0, 1)
       SetPedFleeAttributes(passenger, 0, 1)
       GiveWeaponToPed(driver, GetHashKey("WEAPON_PUMPSHOTGUN"),-1,0,1)
       GiveWeaponToPed(passenger, GetHashKey("WEAPON_PUMPSHOTGUN"),-1,0,1)
       blipName(Ar_truck_blip,Armored_truck,67,2,onMapBlipName_truck)
       vRP.notifyPicture({"CHAR_HUMANDEFAULT",4,spawnNotif.contact,spawnNotif.title,spawnNotif.msg})
       spawn = false
       check = true
    end


     local pickupos = GetOffsetFromEntityInWorldCoords(Armored_truck,0.0,-4.5,0.0)
     local obj = GetEntityCoords(money_bag)

        if GetVehicleDoorAngleRatio(Armored_truck,2) >= 0.0100 and GetVehicleDoorAngleRatio(Armored_truck,3) >= 0.0100 then

            TaskCombatPed(driver,GetPlayerPed(-1),0,16)
            TaskCombatPed(passenger,GetPlayerPed(-1),0,16)
            removeblip(Ar_truck)

         if not money then

             if GetPlayerWantedLevel(PlayerId()) <= 3 then
                SetPlayerWantedLevel(PlayerId(), 3, 0)
                SetPlayerWantedLevelNow(PlayerId(), 0)
             end

              modelRequest(GetHashKey("prop_money_bag_01"))
              money_bag = CreateObject (GetHashKey("prop_money_bag_01"),pickupos.x, pickupos.y, pickupos.z ,true, false, false)
              PlaceObjectOnGroundProperly(money_bag)
              FreezeEntityPosition(money_bag,1)
              addBlip(money_bag_blip,money_bag,108,24,onMapBlipName_money)
              money = true
         end

        end

        if DoesEntityExist(money_bag) then
           DrawMarker(0, obj.x, obj.y, obj.z+1.5, 0.0, 0.0,0.0, 0.0, 0.0,0.0, 0.5, 0.5, 0.45, 49,209, 50, 100, 1, 0, 2, 0, 0, 0, 0)
        end

        if IsEntityAtCoord(GetPlayerPed(-1),obj.x, obj.y, obj.z,0.50,0.50, 4.0, 0, 1, 0) and IsPedOnFoot(GetPlayerPed(-1)) and DoesEntityExist(Armored_truck)then
           TriggerServerEvent('give_ok:give')
           DeleteObject(money_bag)--delete prop after pickup
           despawn()
        end

        if DoesEntityExist(Armored_truck) and GetEntityHealth(Armored_truck) < 1 and check then
           removeblip(Ar_truck)
           vRP.notify({destroyedTruckNotif.notif})
           if DoesEntityExist(money_bag) then
              DeleteObject(money_bag)
           end
           despawn()
        end

        if vRP.isInComa() then
           if DoesEntityExist(money_bag) then
              DeleteObject(money_bag)
           end
           despawn()
        end

 end
end)