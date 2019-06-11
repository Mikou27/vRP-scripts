local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vrp-fourgon")

RegisterServerEvent('vrp-fourgon:give')
AddEventHandler('vrp-fourgon:give', function()             
	local user_id = vRP.getUserId({source})
	local reward = math.random(22000,50000)
	if user_id then
		vRP.giveInventoryItem({user_id, "dirty_money", reward, 1})			
		--vRP.varyExp({user_id,"criminel","braquage",2})
     end
end)