Markers:
"Select",		//_markerTraders //80m
"respawn_para",	//_markerSpawns //300m
"mil_flag"		//_markerTerritory //Alpha 0 //100m
_markerVehicleCIV = ["respawn_motor"]; //600m
_markerVehicleAIR = ["respawn_air"]; //300m
_markerVehicleMIL = ["respawn_armor"]; //300m
trader Marker on the player enty point variable "NotATraderButNeedIt", alpha 0

Player Slots:
INDEPENDENT
"I_Survivor_F"
init: this setVariable ["_spawnedPlayerReadyToFight", false,false];
Role: LoneWolf
Playable
ShowModel
Enable damage

Traders:
CIVILIAN
"C_Man_1"
enable simulation
show model
init:
private _fonctions = [ 'notyet', 'weapons', 'equipement', 'office', 'accessories', 'vehiclesarmed', 'vehiclesunarmed', 'airarmed', 'airunarmed', 'foodandhealth' ];
if (isserver) then {
    [this, "office", 1] call WMS_fnc_initTraders;
};

CargoDump:
"B_Slingload_01_Cargo_F"
equipement storage: empty!
is medical facility
is repair facility
Init: [this] call WMS_fnc_initContainerCargoDump;