
--[[Original script [vrp-fourgon] by NENE(mikou)]]--

vRP = Proxy.getInterface("vRP")
vRPserver = Tunnel.getInterface("vRP", "vrp-fourgon")

local spawn = false
local money = false

function despawn()
Wait(120000)
SetEntityAsNoLongerNeeded(car)
SetModelAsNoLongerNeeded(0x6827CF72)

SetEntityAsNoLongerNeeded(driver)
SetModelAsNoLongerNeeded(0xCDEF5408)

SetEntityAsNoLongerNeeded(passenger)
SetModelAsNoLongerNeeded(0x63858A4A)
end

function fourgon_blip(entity)
fourgon =  AddBlipForEntity(entity)
           SetBlipSprite(fourgon,67)
           SetBlipColour(fourgon,2)
           BeginTextCommandSetBlipName("STRING")
           AddTextComponentString("Fourgon blindé")
           EndTextCommandSetBlipName(fourgon)
end

function removeblip(blip)
    if DoesBlipExist(blip) then  RemoveBlip(blip) end
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
   local timer = math.random(1200000,1600000)
    Wait(timer)
      spawn = true
      money = false
    Wait(timer)
      despawn()
    collectgarbage("collect")
 end
end)

Citizen.CreateThread(function()
 AddRelationshipGroup("fourgon")
 SetRelationshipBetweenGroups(0,GetHashKey("fourgon"),0xA49E591C)
 SetRelationshipBetweenGroups(0,0xA49E591C,GetHashKey("fourgon"))
  while true do
   Wait(0)
    if spawn then

       RequestModel(0x6827CF72)
       while not HasModelLoaded(0x6827CF72) do
       Wait(1)
       end

       RequestModel(0x63858A4A)
       while not HasModelLoaded(0x63858A4A) do
       Wait(1)
       end

        RequestModel(0xCDEF5408)
       while not HasModelLoaded(0xCDEF5408) do
       Wait(1)
       end

       local pos = positions[math.random(1, #positions)]

       car = CreateVehicle(0x6827CF72, pos.x,pos.y,pos.z,pos.h, true, false)        ---fourgon blindé "stockade"
       driver = CreatePed(4, 0xCDEF5408,pos.x,pos.y,pos.z,pos.h, true, true)
       passenger = CreatePed(4, 0x63858A4A,pos.x,pos.y,pos.z,pos.h, true, true)

       SetPedIntoVehicle(driver, car, -1)
       SetPedIntoVehicle(passenger, car, -2)
       TaskVehicleDriveWander(driver,car,35.0, 786603)
       SetPedRelationshipGroupHash(driver,GetHashKey("fourgon"))
       SetPedRelationshipGroupHash(passenger,GetHashKey("fourgon"))
       SetDriverAbility(driver, 10.0)
       SetPedFleeAttributes(driver, 0, 1)
       SetPedFleeAttributes(passenger, 0, 1)
       GiveWeaponToPed(driver, GetHashKey("WEAPON_PUMPSHOTGUN"),-1,0,1)
       GiveWeaponToPed(passenger, GetHashKey("WEAPON_PUMPSHOTGUN"),-1,0,1)
       fourgon_blip(car)
       vRP.notifyPicture({"CHAR_HUMANDEFAULT",4, "Informateur", "~r~Un sale boulot.","~g~Un fourgon blindé vient d'être repéré,prépares tes bombes collantes."})
       spawn = false
    end


     local pickupos = GetOffsetFromEntityInWorldCoords(car,0.0,-4.5,0.0)
     local obj = GetEntityCoords(bag)

        if GetVehicleDoorAngleRatio(car,2) >= 0.0100 and GetVehicleDoorAngleRatio(car,3) >= 0.0100 then

            TaskCombatPed(driver,GetPlayerPed(-1),0,16)
            TaskCombatPed(passenger,GetPlayerPed(-1),0,16)
            removeblip(fourgon)

         if not money then

             if GetPlayerWantedLevel(PlayerId()) <= 3 then
                SetPlayerWantedLevel(PlayerId(), 3, 0)
                SetPlayerWantedLevelNow(PlayerId(), 0)
             end


              bag = CreateObject (GetHashKey("prop_money_bag_01"),pickupos.x, pickupos.y, pickupos.z ,true, false, false)
              PlaceObjectOnGroundProperly(bag)
              FreezeEntityPosition(bag,1)
              objblip =  AddBlipForEntity(bag)
              SetBlipSprite(objblip,108)
              SetBlipColour(objblip,24)
              SetBlipFlashes(objblip,true)
              BeginTextCommandSetBlipName("STRING")
              AddTextComponentString("Sac d'argent")--"Dirty money bag"
              EndTextCommandSetBlipName(objblip)
              money = true
         end

        end

        if DoesEntityExist(bag) then
           DrawMarker(0, obj.x, obj.y, obj.z+1.5, 0.0, 0.0,0.0, 0.0, 0.0,0.0, 0.5, 0.5, 0.45, 49,209, 50, 100, 1, 0, 2, 0, 0, 0, 0)
        end

        if IsEntityAtCoord(GetPlayerPed(-1),obj.x, obj.y, obj.z,0.50,0.50, 4.0, 0, 1, 0) == 1 and IsPedOnFoot(GetPlayerPed(-1)) and DoesEntityExist(car) then
           TriggerServerEvent('give_ok:give')
           DeleteObject(bag)--delete prop after pickup
           despawn()
        end

        if DoesEntityExist(car) and GetEntityHealth(car) < 1 and (not spawn) then
           vRP.notify({"~r~Le braquage de fourgon blindé n'est plus disponible."})
           removeblip(fourgon)
           if DoesBlipExist(objblip) then
              RemoveBlip(objblip)
           end
           despawn()
        end

        collectgarbage("collect")

 end
end)