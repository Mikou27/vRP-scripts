--Credit yourself here(ex: English translation by "TheNiceGuy") for any translations you've made, and make a pull request on my GitHub.

cfg = {}

---------------------------------[locales]-------------------------------------------
fr = {

spawnNotif = {
contact = "Informateur",
title = "~r~Un sale boulot.",
msg = "~g~Un fourgon blindé vient d'être repéré,prépares tes bombes collantes."
},

copsSpawnNotif = {
contact = "Directeur agence Gruppe Sechs",
title = "~r~Transport de fonds",
msg = "~g~Un de nos fourgon vient de prendre la route soyez vigilants."
},

rewardnotif = {"Vous avez reçu ~g~"," ~w~$ d'argent sale."},
onMapBlipName_truck = "Fourgon blindé",
copsOnMapBlipName_truck = "Fourgon blindé Gruppe Sechs",
onMapBlipName_money = "Sac d'argent",
destroyedTruckNotif = "~r~L'argent a était détruit.",
cops_notification = "Un braquage de fourgon blindé est en cours à ~y~",
cops_Collect_money = "~y~Un agent de police a récupérer l'argent du braquage de fourgon blindé.",
cops_Veh_plate = {"~r~Indice(s) braquage de fourgon","~y~Véhicule potentiellement suspect  :  ~g~","  ~y~Modèle :  ~g~"},
copsNoClueNofif = "~y~Aucun indice sur le braquage du fourgon pour le moment...",

}

en = {--need to be translated

spawnNotif = {
contact = "Informateur",
title = "~r~Un sale boulot.",
msg = "~g~Un fourgon blindé vient d'être repéré,prépares tes bombes collantes."
},

copsSpawnNotif = {
contact = "Directeur agence Gruppe Sechs",
title = "~r~Transport de fonds",
msg = "~g~Un de nos fourgon vient de prendre la route soyez vigilants."
},

rewardnotif = {"Vous avez reçu ~g~"," ~w~$ d'argent sale."},
onMapBlipName_truck = "Fourgon blindé",
copsOnMapBlipName_truck = "Fourgon blindé Gruppe Sechs",
onMapBlipName_money = "Sac d'argent",
destroyedTruckNotif = "~r~L'argent a était détruit.",
cops_notification = "Un braquage de fourgon blindé est en cours à ~y~",
cops_Collect_money = "~y~Un agent de police a récupérer l'argent du braquage de fourgon blindé.",
cops_Veh_plate = {"~r~Indice(s) braquage de fourgon","~y~Véhicule potentiellement suspect  :  ~g~","  ~y~Modèle :  ~g~"},
copsNoClueNofif = "~y~Aucun indice sur le braquage du fourgon pour le moment...",

}
--------------------------------------------------------------------------------------

-----------------------------------[[[SETTINGS]]]-------------------------------------
--------------------------------------------------------------------------------------
cfg.lang = fr

---------------[SPAWN TIMER]---------------------
cfg.spawnTimer = math.random(1200000,1600000)
-------------------------------------------------

---------------[DESPAWN TIMER]-------------------
cfg.despawnTimer = math.random(1200000,1600000)
-------------------------------------------------

--------[ARMORED TRUCK SPAWN POSITIONS]----------

cfg.positions = {
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



