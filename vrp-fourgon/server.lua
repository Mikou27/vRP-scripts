
--[[Script original vrp-fourgon by NENE(mikou)]]--

local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vrp-fourgon")


RegisterServerEvent('give_ok:give')
AddEventHandler('give_ok:give', function()

local user_id = vRP.getUserId({source})

    local reward = math.random(22000,50000)
    if(user_id)then
     vRP.giveInventoryItem({user_id,"dirty_money",reward,1})
     --vRP.varyExp({user_id,"criminel","braquage",2})
     collectgarbage("collect")
    end

end)
