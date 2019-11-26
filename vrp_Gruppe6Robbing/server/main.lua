--[[Original script [vrp_Gruppe6Robbing] by NENE(mikou)]]--
---https://forum.fivem.net/t/release-vrp-gruppe6robbing-gruppe6-armored-truck-robbing/290234
cfg = {}
local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vrp_Gruppe6Robbing")

local mapZones = {AIRP = "Los Santos International Airport",ALAMO = "Alamo Sea",ALTA = "Alta",ARMYB = "Fort Zancudo",BANHAMC = "Banham Canyon Dr",BANNING = "Banning",BEACH = "Vespucci Beach",BHAMCA = "Banham Canyon",BRADP = "Braddock Pass",BRADT = "Braddock Tunnel",BURTON = "Burton",CALAFB = "Calafia Bridge",CANNY = "Raton Canyon",CCREAK = "Cassidy Creek",CHAMH = "Chamberlain Hills",CHIL = "Vinewood Hills",CHU = "Chumash",CMSW = "Chiliad Mountain State Wilderness",CYPRE = "Cypress Flats",DAVIS = "Davis",DELBE = "Del Perro Beach",DELPE = "Del Perro",DELSOL = "La Puerta",DESRT = "Grand Senora Desert",DOWNT = "Downtown",DTVINE = "Downtown Vinewood",EAST_V = "East Vinewood",EBURO = "El Burro Heights",ELGORL = "El Gordo Lighthouse",ELYSIAN = "Elysian Island",GALFISH = "Galilee",GOLF = "GWC and Golfing Society",GRAPES = "Grapeseed",GREATC = "Great Chaparral",HARMO = "Harmony",HAWICK = "Hawick",HORS = "Vinewood Racetrack",HUMLAB = "Humane Labs and Research",JAIL = "Bolingbroke Penitentiary",KOREAT = "Little Seoul",LACT = "Land Act Reservoir",LAGO = "Lago Zancudo",LDAM = "Land Act Dam",LEGSQU = "Legion Square",LMESA = "La Mesa",LOSPUER = "La Puerta",MIRR = "Mirror Park",MORN = "Morningwood",MOVIE = "Richards Majestic",MTCHIL = "Mount Chiliad",MTGORDO = "Mount Gordo",MTJOSE = "Mount Josiah",MURRI = "Murrieta Heights",NCHU = "North Chumash",NOOSE = "N.O.O.S.E",OCEANA = "Pacific Ocean",PALCOV = "Paleto Cove",PALETO = "Paleto Bay" ,PALFOR = "Paleto Forest",PALHIGH = "Palomino Highlands",PALMPOW = "Palmer-Taylor Power Station",PBLUFF = "Pacific Bluffs",PBOX = "Pillbox Hill"  ,PROCOB = "Procopio Beach",RANCHO = "Rancho"  ,RGLEN = "Richman Glen",RICHM = "Richman" ,ROCKF = "Rockford Hills",RTRAK = "Redwood Lights Track",SANAND = "San Andreas" ,SANCHIA = "San Chianski Mountain Range",SANDY = "Sandy Shores" ,SKID = "Mission Row" ,SLAB = "Stab City"  ,STAD = "Maze Bank Arena",STRAW = "Strawberry" ,TATAMO = "Tataviam Mountains",TERMINA = "Terminal",TEXTI = "Textile City",TONGVAH = "Tongva Hills",TONGVAV = "Tongva Valley",VCANA = "Vespucci Canals" ,VESP = "Vespucci"  ,VINE = "Vinewood",WINDF = "Ron Alternates Wind Farm",WVINE = "West Vinewood"  ,ZANCUDO = "Zancudo River" ,ZP_ORT = "Port of South Los Santos",ZQ_UAR = "Davis Quartz"}

RegisterServerEvent("IsPlyAcop")
AddEventHandler("IsPlyAcop", function()
local users = vRP.getUsers()
for k,v in pairs (users) do
    if k then
       if vRP.hasPermission({k,"police.mission"}) then
          TriggerClientEvent("IsCop",v)
       end
    end
end
end)

RegisterServerEvent("giveMoney")
AddEventHandler("giveMoney", function()
local user_id = vRP.getUserId({source})
local nearMoney = true
local robber = source
local reward = cfg.reward
if user_id then
   vRP.giveInventoryItem({user_id,"dirty_money",reward,false})
  -- vRP.varyExp({user_id,"criminel","braquage",2})
end
TriggerClientEvent("sharedPickupCheck",-1, nearMoney)
Wait(100)
TriggerClientEvent("rewardNotif",robber,reward)
end)

RegisterServerEvent("IDS")
AddEventHandler("IDS", function(TruckID,GrdpID)
T_ID = TruckID
G_ID = GrdpID
TriggerClientEvent("IDS",-1, T_ID,G_ID)
end)

RegisterServerEvent("objID")
AddEventHandler("objID", function(ObjID)
O_ID = ObjID
TriggerClientEvent("sharedObj",-1, O_ID)
end)

RegisterServerEvent("CReset")
AddEventHandler("CReset", function()
TriggerClientEvent("clientReset",-1)
end)

RegisterServerEvent("svCopClue")
AddEventHandler("svCopClue", function(suspectPlate,suspectVehModel)
local plate = suspectPlate
local suspectModel = suspectVehModel
TriggerClientEvent("sharedPlate",-1,plate,suspectModel)
end)

RegisterServerEvent("Cops")
AddEventHandler("Cops", function(x,y,z,zone)
local robZone = mapZones[zone]
vRP.sendServiceAlert({nil,"police",x,y,z,cfg.lang.CopsRobbingAlert..robZone.."."})
end)

