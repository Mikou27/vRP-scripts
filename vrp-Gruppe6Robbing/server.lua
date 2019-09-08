--[[Original script [vrp-Gruppe6Robbing] by NENE(mikou)]]--
---https://forum.fivem.net/t/release-vrp-gruppe6robbing-gruppe6-armored-truck-robbing/290234

local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vrp-Gruppe6Robbing")


RegisterServerEvent('give_ok:give')
AddEventHandler('give_ok:give', function()
local user_id = vRP.getUserId({source})
local reward = math.random(22000,50000)
 if(user_id)then
    vRP.giveInventoryItem({user_id,"dirty_money",reward,1})
    vRP.varyExp({user_id,"criminel","braquage",2})
 end
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