Markers:
"Select",		//_markerTraders //80m //used to create traders zones
"respawn_para",	//_markerSpawns //300m  //used to create spawn zones
"respawn_motor" //_markerVehicleCIV //600m //used to auto spawn random vehicles //alpha 0
"respawn_air"   //_markerVehicleAIR //300m //used to auto spawn random vehicles //alpha 0
"respawn_armor" //_markerVehicleMIL //300m //used to auto spawn random vehicles //alpha 0
"mil_flag"		//_markerTerritory //100m //Alpha 0  //used for the territory system, do not put it in the mission.sqm
trader Marker on the player entry point variable "NotATraderButNeedIt", alpha 0

Player Slots:
    INDEPENDENT
    "I_Survivor_F" //this is kind of important if you run WMS_InfantryProgram
    Playable
    ShowModel
    Enable damage
    Role: LoneWolf
init: 
this setVariable ["_spawnedPlayerReadyToFight", false,false];

Traders:
    CIVILIAN
    "C_Man_1"
    enable simulation
    show model
Default types: ['weapons', 'equipement', 'office', 'accessories', 'vehiclesarmed', 'vehiclesunarmed', 'airarmed', 'airunarmed', 'foodandhealth', 'freakingBoats' ];
You can create any new list of items or vehicles and call it from the trader in one of the ClassNames\*.hpp, 
*Categories.hpp for the availability and *Prices.hpp for the price/level
Basically, any trader can sell anything you want, you can even create an hidden trader who will sell only one object
since it's a call, anything could be a "trader", even a computer, a table or a truck
Init: 
if (isserver) then {
    [this, "office", 1] call WMS_fnc_initTraders; //[_traderObject, the trader config you want to sell, how many items/vehicles]
};

CargoDump:
    "B_Slingload_01_Cargo_F"
    equipement storage: empty!
    is medical facility
    is repair facility
Init: 
if (isServer) then {
    [this] call WMS_fnc_initContainerCargoDump;
};

Billboards object:
"Land_Billboard_F"
Textures:
"Custom\Billboards\Billboard_Spawn.paa"
"Custom\Billboards\Billboard_Traders.paa"
"Custom\Billboards\Billboard_Stuck.paa"

Watermark:
Change your server watermark in "Custom\Watermark\init.sqf"
you need to add your .paa image in "Custom\Watermark"

Welcome message:
Modify your server welcome message to fit your needs in "Custom\Intro\intro.sqf" and/or "Custom\Intro\introPVP.sqf"
Welcome message is called from init.sqm: execVM "Custom\Intro\intro.sqf";

Artillery Computer:
is DEACTIVATED by default,  your choice:
initPlayerLocal.sqf\enableEngineArtillery false;

Advanced Flight Model (AFM):
Is FORCED by default
Description.ext\forceRotorLibSimulation = 1;
AND
Mission.sqm\forceRotorLibSimulation = 1;

Remote Execution:
CfgRemoteExec.hpp use white list 'mode = 1;'
So you need to add your own remoteExec for custom mods/functions