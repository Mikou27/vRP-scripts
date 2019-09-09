--[[Original script [Gruppe6Robbing] by NENE(mikou)]]--
---https://forum.fivem.net/t/release-vrp-gruppe6robbing-gruppe6-armored-truck-robbing/290234


RegisterServerEvent('give_ok:give')
AddEventHandler('give_ok:give', function()
local reward =  50000
--Add your reward(give money to player) function here
end)


RegisterServerEvent('truckID')
AddEventHandler('truckID', function(TruckID)
T_ID = TruckID
TriggerClientEvent('sharedID',-1, T_ID)
end)

RegisterServerEvent('objID')
AddEventHandler('objID', function(ObjID)
O_ID = ObjID
TriggerClientEvent('sharedObj',-1, O_ID)
end)


RegisterServerEvent('check:Pos')
AddEventHandler('check:Pos', function()
nearMoney = true
TriggerClientEvent('sharedPos',-1, nearMoney)
end)