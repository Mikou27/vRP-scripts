vRP = Proxy.getInterface("vRP")
vRPserver = Tunnel.getInterface("vRP", "vrp_carjacking")

local Class = {}
local toolate = false
local onfoot = false
local vehspawn = false
local incar = false

function vehicle_blip(entity)

vehicle =  AddBlipForEntity(entity)
		   SetBlipSprite(vehicle,595) 
		   SetBlipColour(vehicle,3)
		   BeginTextCommandSetBlipName("STRING")
		   AddTextComponentString("Carjacking")
		   EndTextCommandSetBlipName(vehicle)
end

function despawntimer()
	   toolate = true  
	   
	   Wait(10000)	   
	   SetEntityAsNoLongerNeeded(DriverPed)	  
	   SetModelAsNoLongerNeeded(GetHashKey(drivermodel))	   
	   
	   Wait(200)
	   SetEntityAsNoLongerNeeded(SellableCar)
	   SetModelAsNoLongerNeeded(GetHashKey(vehmodel))
end

local positions = { -- spawn positions

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

 local vehmodels = {
   
	"SENTINEL",
	"BLISTA", 
	"DILETTANTE", 
	"LANDSTALKER", 
	"FACTION",
	"PENUMBRA",
	"WINDSOR", 
	"SCHAFTER3",
	"BUFFALO", 
	"FELTZER2",
	"F620",
	"INGOT", 
	"HUNTLEY", 
	"TROPOS", 
	"SABREGT", 
	"DOMINATOR", 
	"EXEMPLAR",
	"RAPIDGT", 
	"BUFFALO", 
	"COMET2",
	"PICADOR",
	"WASHINGTON",
	"GLENDALE",
	"XLS",
	"SULTAN",
	"STRATUM",
	"TAILGATER",
	"CHEETAH",
	"COMET2",
	"CUTTER",
	"ELEGY2",
	"EMPEROR2",
	"FELON",
	"FUGITIVE",
	"LANDSTALKER",
	"NINEF",
	"NINEF2",
	"ORACLE",
	"ORACLE2",
	"PHOENIX", 
	"PICADOR", 
	"RAPIDGT",
	"RAPIDGT2",
	"SANCHEZ",
	"SANCHEZ2", 
	"STINGERGT",
	"STRATUM",
	"SULTAN",
	"VOODOO2",
	"WASHINGTON",
	"SWIFT2",
	"LUXOR2", 
	"FELTZER3",
	"OSIRIS", 
	"VIRGO",
	"WINDSOR"

   }  

local drivermodels = {
	"A_F_M_BEACH_01",
	"A_F_M_BEVHILLS_01",
	"A_F_M_BEVHILLS_02",
	"A_F_M_BODYBUILD_01",
	"A_F_M_BUSINESS_02",
	"A_F_M_DOWNTOWN_01",
	"A_F_M_EASTSA_01",
	"A_F_M_EASTSA_02",
	"A_F_M_FATBLA_01",
	"A_F_M_FATCULT_01",
	"A_F_M_FATWHITE_01",
	"A_F_M_KTOWN_01",
	"A_F_M_KTOWN_02",
	"A_F_M_PROLHOST_01",
	"A_F_M_SALTON_01",
	"A_F_M_SKIDROW_01",
	"A_F_M_SOUCENTMC_01",
	"A_F_M_SOUCENT_01",
	"A_F_M_SOUCENT_02",
	"A_F_M_TOURIST_01",
	"A_F_M_TRAMPBEAC_01",
	"A_F_M_TRAMP_01",
	"A_F_O_GENSTREET_01",
	"A_F_O_INDIAN_01",
	"A_F_O_KTOWN_01",
	"A_F_O_SALTON_01",
	"A_F_O_SOUCENT_01",
	"A_F_O_SOUCENT_02",
	"A_F_Y_BEACH_01",
	"A_F_Y_BEVHILLS_01",
	"A_F_Y_BEVHILLS_02",
	"A_F_Y_BEVHILLS_03",
	"A_F_Y_BEVHILLS_04",
	"A_F_Y_BUSINESS_01",
	"A_F_Y_BUSINESS_02",
	"A_F_Y_BUSINESS_03",
	"A_F_Y_BUSINESS_04",
	"A_F_Y_EASTSA_01",
	"A_F_Y_EASTSA_02",
	"A_F_Y_EASTSA_03",
	"A_F_Y_EPSILON_01",
	"A_F_Y_FITNESS_01",
	"A_F_Y_FITNESS_02",
	"A_F_Y_GENHOT_01",
	"A_F_Y_GOLFER_01",
	"A_F_Y_HIKER_01",
	"A_F_Y_HIPPIE_01",
	"A_F_Y_HIPSTER_01",
	"A_F_Y_HIPSTER_02",
	"A_F_Y_HIPSTER_03",
	"A_F_Y_HIPSTER_04",
	"A_F_Y_INDIAN_01",
	"A_F_Y_JUGGALO_01",
	"A_F_Y_RUNNER_01",
	"A_F_Y_RURMETH_01",
	"A_F_Y_SCDRESSY_01",
	"A_F_Y_SKATER_01",
	"A_F_Y_SOUCENT_01",
	"A_F_Y_SOUCENT_02",
	"A_F_Y_SOUCENT_03",
	"A_F_Y_TENNIS_01",
	"A_F_Y_TOPLESS_01",
	"A_F_Y_TOURIST_01",
	"A_F_Y_TOURIST_02",
	"A_F_Y_VINEWOOD_01",
	"A_F_Y_VINEWOOD_02",
	"A_F_Y_VINEWOOD_03",
	"A_F_Y_VINEWOOD_04",
	"A_F_Y_YOGA_01",
	"A_M_M_ACULT_01",
	"A_M_M_AFRIAMER_01",
	"A_M_M_BEACH_01",
	"A_M_M_BEACH_02",
	"A_M_M_BEVHILLS_01",
	"A_M_M_BEVHILLS_02",
	"A_M_M_BUSINESS_01",
	"A_M_M_EASTSA_01",
	"A_M_M_EASTSA_02",
	"A_M_M_FARMER_01",
	"A_M_M_FATLATIN_01",
	"A_M_M_GENFAT_01",
	"A_M_M_GENFAT_02",
	"A_M_M_GOLFER_01",
	"A_M_M_HASJEW_01",
	"A_M_M_HILLBILLY_01",
	"A_M_M_HILLBILLY_02",
	"A_M_M_INDIAN_01",
	"A_M_M_KTOWN_01",
	"A_M_M_MALIBU_01",
	"A_M_M_MEXCNTRY_01",
	"A_M_M_MEXLABOR_01",
	"A_M_M_OG_BOSS_01",
	"A_M_M_PAPARAZZI_01",
	"A_M_M_POLYNESIAN_01",
	"A_M_M_RURMETH_01",
	"A_M_M_SALTON_01",
	"A_M_M_SALTON_02",
	"A_M_M_SALTON_03",
	"A_M_M_SALTON_04",
	"A_M_M_SKATER_01",
	"A_M_M_SKIDROW_01",
	"A_M_M_SOCENLAT_01",
	"A_M_M_SOUCENT_01",
	"A_M_M_SOUCENT_02",
	"A_M_M_SOUCENT_03",
	"A_M_M_SOUCENT_04",
	"A_M_M_STLAT_02",
	"A_M_M_TRAMPBEAC_01",
	"A_M_M_TRAMP_01",
	"A_M_M_TRANVEST_01",
	"A_M_M_TRANVEST_02",
	"A_M_O_GENSTREET_01",
	"A_M_O_KTOWN_01",
	"A_M_O_SALTON_01",
	"A_M_O_SOUCENT_01",
	"A_M_O_SOUCENT_02",
	"A_M_O_SOUCENT_03",
	"A_M_Y_BEACHVESP_01",
	"A_M_Y_BEACHVESP_02",
	"A_M_Y_BEACH_01",
	"A_M_Y_BEACH_02",
	"A_M_Y_BEACH_03",
	"A_M_Y_BEVHILLS_01",
	"A_M_Y_BEVHILLS_02",
	"A_M_Y_BREAKDANCE_01",
	"A_M_Y_BUSICAS_01",
	"A_M_Y_BUSINESS_01",
	"A_M_Y_BUSINESS_02",
	"A_M_Y_BUSINESS_03",
	"A_M_Y_CYCLIST_01",
	"A_M_Y_DHILL_01",
	"A_M_Y_DOWNTOWN_01",
	"A_M_Y_EASTSA_01",
	"A_M_Y_EASTSA_02",
	"A_M_Y_EPSILON_01",
	"A_M_Y_EPSILON_02",
	"A_M_Y_GAY_01",
	"A_M_Y_GAY_02",
	"A_M_Y_GENSTREET_01",
	"A_M_Y_GENSTREET_02",
	"A_M_Y_GOLFER_01",
	"A_M_Y_HASJEW_01",
	"A_M_Y_HIKER_01",
	"A_M_Y_HIPPY_01",
	"A_M_Y_HIPSTER_01",
	"A_M_Y_HIPSTER_02",
	"A_M_Y_HIPSTER_03",
	"A_M_Y_INDIAN_01",
	"A_M_Y_JUGGALO_01",
	"A_M_Y_KTOWN_01",
	"A_M_Y_KTOWN_02",
	"A_M_Y_LATINO_01",
	"A_M_Y_POLYNESIAN_01",
	"A_M_Y_ROADCYC_01",
	"A_M_Y_RUNNER_01",
	"A_M_Y_RUNNER_02",
	"A_M_Y_SALTON_01",
	"A_M_Y_SKATER_01",
	"A_M_Y_SKATER_02",
	"A_M_Y_SOUCENT_01",
	"A_M_Y_SOUCENT_02",
	"A_M_Y_SOUCENT_03",
	"A_M_Y_SOUCENT_04",
	"A_M_Y_STBLA_01",
	"A_M_Y_STBLA_02",
	"A_M_Y_STLAT_01",
	"A_M_Y_STWHI_01",
	"A_M_Y_STWHI_02",
	"A_M_Y_VINEWOOD_01",
	"A_M_Y_VINEWOOD_02",
	"A_M_Y_VINEWOOD_03",
	"A_M_Y_VINEWOOD_04",
	"A_M_Y_YOGA_01",
	"G_F_Y_FAMILIES_01",
	"G_M_M_ARMBOSS_01",
	"G_M_M_ARMGOON_01",
	"G_M_M_ARMLIEUT_01",
	"G_M_M_CHEMWORK_01",
	"G_M_M_CHIBOSS_01",
	"G_M_M_CHICOLD_01",
	"G_M_M_CHIGOON_01",
	"G_M_M_CHIGOON_02",
	"G_M_M_KORBOSS_01",
	"G_M_M_MEXBOSS_01",
	"G_M_M_MEXBOSS_02",
	"G_M_Y_ARMGOON_02",
	"G_M_Y_BALLAEAST_01",
	"G_M_Y_BALLAORIG_01",
	"G_M_Y_FAMCA_01",
	"G_M_Y_FAMDNF_01",
	"G_M_Y_FAMFOR_01",
	"G_M_Y_KOREAN_01",
	"G_M_Y_KOREAN_02",
	"G_M_Y_KORLIEUT_01",
	"G_M_Y_MEXGOON_01",
	"G_M_Y_MEXGOON_02",
	"G_M_Y_MEXGOON_03",
	"G_M_Y_POLOGOON_01",
	"G_M_Y_POLOGOON_02",
	"G_M_Y_SALVABOSS_01",
	"G_M_Y_SALVAGOON_01",
	"G_M_Y_SALVAGOON_02",
	"G_M_Y_SALVAGOON_03",
	"G_M_Y_STRPUNK_01",
	"G_M_Y_STRPUNK_02",
	"HC_DRIVER",
	"HC_GUNMAN",
	"HC_HACKER",
	"IG_ABIGAIL",
	"IG_AMANDATOWNLEY",
	"IG_ANDREAS",
	"IG_ASHLEY",
	"IG_BANKMAN",
	"IG_BARRY",
	"IG_BESTMEN",
	"IG_BEVERLY",
	"IG_BRAD",
	"IG_BRIDE",
	"IG_CAR3GUY1",
	"IG_CAR3GUY2",
	"IG_CASEY",
	"IG_CHEF",
	"IG_CHENGSR",
	"IG_CHRISFORMAGE",
	"IG_CLAY",
	"IG_CLAYPAIN",
	"IG_CLETUS",
	"IG_DALE",
	"IG_DAVENORTON",
	"IG_DENISE",
	"IG_DEVIN",
	"IG_DOM",
	"IG_DREYFUSS",
	"IG_DRFRIEDLANDER",
	"IG_FABIEN",
	"IG_FLOYD",
	"IG_GROOM",
	"IG_HAO",
	"IG_HUNTER",
	"IG_JANET",
	"IG_JAY_NORRIS",
	"IG_JEWELASS",
	"IG_JIMMYBOSTON",
	"IG_JIMMYDISANTO",
	"IG_JOEMINUTEMAN",
	"IG_JOHNNYKLEBITZ",
	"IG_JOSEF",
	"IG_JOSH",
	"IG_KERRYMCINTOSH",
	"IG_LAMARDAVIS",
	"IG_LESTERCREST",
	"IG_LIFEINVAD_01",
	"IG_LIFEINVAD_02",
	"IG_MAGENTA",
	"IG_MANUEL",
	"IG_MARNIE",
	"IG_MARYANN",
	"IG_MAUDE",
	"IG_MICHELLE",
	"IG_MILTON",
	"IG_MOLLY",
	"IG_MRK",
	"IG_MRSPHILLIPS",
	"IG_MRS_THORNHILL",
	"IG_NATALIA",
	"IG_NERVOUSRON",
	"IG_NIGEL",
	"IG_OLD_MAN1A",
	"IG_OLD_MAN2",
	"IG_OMEGA",
	"IG_ONEIL",
	"IG_ORLEANS",
	"IG_ORTEGA",
	"IG_PAPER",
	"IG_PATRICIA",
	"IG_RAMP_HIC",
	"IG_RAMP_HIPSTER",
	"IG_RAMP_MEX",
	"IG_ROCCOPELOSI",
	"IG_RUSSIANDRUNK",
	"IG_SCREEN_WRITER",
	"IG_SIEMONYETARIAN",
	"IG_SOLOMON",
	"IG_STEVEHAINS",
	"IG_STRETCH",
	"IG_TALINA",
	"IG_TANISHA",
	"IG_TAOCHENG",
	"IG_TAOSTRANSLATOR"

}


Citizen.CreateThread(function()		   
 while true do
 local times = math.random(750000,850000)	
	 
	 Wait(times)	
	 if not DoesEntityExist(SellableCar) then 
			vehspawn = true	 
	 else	vehspawn = false	 
	 end
	
	 Wait(times)
	 if DoesEntityExist(SellableCar) then
		vRP.notify({"~g~Le vehicule n'est plus recherché."})--vehicle not needed anymore   
		Wait(10000) 
		despawntimer()
	 else vehspawn = false
	 end			
 end
end)

Citizen.CreateThread(function()	 
  while true do 
   Wait(0)
   if not toolate then
	if incar then	 
	   DrawMarker(1,1204.52, -3115.68, 4.54,0,0,0,0,0,0,6.0,6.0,0.5001,5,217,241,0.75,0,0,0,0)
	   DrawMarker(4,1204.52, -3115.68, 5.74,0,0,0,0,0,0,2.5,2.5,1.5001,5,217,241,0.75,0,0,0,0)
	end
   end	
  end
end)

Citizen.CreateThread(function()
  while true do 
   Wait(0)
 
	if vehspawn then 
 
	 vehmodel = vehmodels[math.random(1, #vehmodels)]
	 vehmodel = string.upper(vehmodel)
	 RequestModel(GetHashKey(vehmodel))
	 while not HasModelLoaded(GetHashKey(vehmodel)) or not HasCollisionForModelLoaded(GetHashKey(vehmodel)) do
		Wait(1)
	 end
	
	 drivermodel = drivermodels[math.random(1, #drivermodels)]
	 drivermodel = string.upper(drivermodel)
	 RequestModel(GetHashKey(drivermodel))
	 while not HasModelLoaded(GetHashKey(drivermodel)) or not HasCollisionForModelLoaded(GetHashKey(drivermodel)) do
		Wait(1)
	 end
	  
	 local pos = positions[math.random(1, #positions)]
		
	 SellableCar = CreateVehicle(vehmodel, pos.x,pos.y,pos.z,pos.h, true, true)		
	 DriverPed = CreatePed(4,drivermodel,pos.x,pos.y,pos.z,pos.h, true, true)		
	 SetEntityAsMissionEntity(DriverPed,1,1)
	 SetEntityAsMissionEntity(SellableCar,1,1)
	 SetPedIntoVehicle(DriverPed, SellableCar, -1)
	 TaskVehicleDriveWander(DriverPed,SellableCar,35.0, 786603)
	 SetDriverAbility(DriverPed, 1.0)
	 SetPedFleeAttributes(DriverPed, 10, 1)
	  
	 vehicle_blip(SellableCar)
		 
	 vehspawn = false	
	 toolate = false
   
	end		
	
	if DoesEntityExist(SellableCar) and (not IsPedInVehicle(GetPlayerPed(-1),SellableCar,1)) and (not toolate) then 
	   local vehpos = GetEntityCoords(SellableCar)
	   DrawMarker(0, vehpos.x, vehpos.y, vehpos.z+2.0, 0.0, 0.0,0.0, 0.0, 0.0,0.0, 0.5, 0.5, 0.45, 250,230,30, 100, 1, 0, 2, 0, 0, 0, 0)	
	end	  
	
	if not toolate then	 
	 if IsEntityAtCoord(GetPlayerPed(-1),1204.52, -3115.68, 5.54,3.0,3.0, 4.0, 0, 1, 0) then				 
		 if IsPedInModel(GetPlayerPed(-1),GetHashKey(vehmodel)) then 
			 if IsPlayerWantedLevelGreater(PlayerId(),0) then
				
				 TriggerServerEvent('flic_notok:veh')
			 else
				 TriggerServerEvent('descendre_ok:veh')
				 Class = GetVehicleClass(SellableCar)
				 SetVehicleUndriveable(SellableCar,1)
				 onfoot = true
			 end
		 end
	  end
	end 
	  
	if onfoot then
	  if IsPedOnFoot(GetPlayerPed(-1)) then 
		 TriggerServerEvent('deposit_ok:give',Class)
		 TriggerServerEvent('taff_ok:veh')
		 despawntimer()
		 onfoot = false
	   end
	end

	
	if GetEntityHealth(SellableCar) <= 700	then --valuable threshold
	   if not toolate then
			  vRP.notify({"~r~Le vehicule ne vaut plus rien..."})--the vehicle is not valuable anymore
			  despawntimer()
	   end
	end 
	
   
	if IsPedJacking(GetPlayerPed(-1)) and IsPedInVehicle(GetPlayerPed(-1),SellableCar,1) then 
	   SetPlayerWantedLevel(PlayerId(), 2, 0) 
	   SetPlayerWantedLevelNow(PlayerId(), 0)
	end	
	
 
	if IsPedInVehicle(GetPlayerPed(-1),SellableCar,0) then
		 Wait(100)
		 incar = true 
	else incar = false
	end
	 
	 
	if not DoesBlipExist(delivery) then 
	  if not toolate then
		if incar then
		   Wait(200)

		   delivery = AddBlipForCoord(1204.52, -3115.68, 5.54)
					   SetBlipSprite(delivery,38)
					   SetBlipColour(delivery,12)
					   SetBlipFlashes(delivery,1)
					   BeginTextCommandSetBlipName("STRING")
					   AddTextComponentString("Livraison carjacking")--set name of the delivery place
					   EndTextCommandSetBlipName(delivery)
		end			   
	  end 
	end
		 
	
	if not IsPedInVehicle(GetPlayerPed(-1),SellableCar,0) then 
		if DoesBlipExist(delivery) then 
		   RemoveBlip(delivery)
		end	
	end
	
	if toolate then 
	  if DoesBlipExist(vehicle) then
		 RemoveBlip(vehicle)	
	  end
	 
	  if DoesBlipExist(delivery) then
		 RemoveBlip(delivery)
	  end
	 
	end	
	
  end
end)
  
