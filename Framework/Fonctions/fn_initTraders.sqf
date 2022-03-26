/**
 * WMS_fnc_initTraders
 *
 * TNA-Community
 * https://discord.gg/Zs23URtjwF
 * © 2021 {|||TNA|||}WAKeupneo
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
//[_traderObject, _fonction, _itemsCount] call WMS_fnc_initTraders;
//"VehicleArmed","weapons","equipement","office","VehicleUnarmed","ChoppersArmed","ChoppersUnarmed","accessories"
private [];
params [
	"_traderObject",
	["_fonction", "office"], //'notyet','weapons','equipement','office','accessories','vehiclesarmed','vehiclesunarmed','airarmed','airunarmed'
	["_itemsCount", 10]
];
if (false) then {diag_log format ["[INIT_TRADERS_BEHAVIOR]|WAK|TNA|WMS|_this %1", _this]};

    [_traderObject, _fonction, _itemsCount] call WMS_fnc_initTraderActions; //WAK
    _traderObject allowDamage false;
	_traderObject setCombatBehaviour "safe";
	//put the variable to remove ACE shit here
    
    _traderObject setVariable ["BIS_enableRandomization", true];
    _traderObject setVariable ["BIS_fnc_animalBehaviour_disable", true];
    _traderObject setVariable ["ExileTraderType", "custom"];
	
    _traderObject setVariable ["ReCreateTraderData", []];

    _traderObject disableAI "ALL";
    /*_traderObject disableAI "ANIM";
	_traderObject disableAI "SUPPRESSION";
	_traderObject disableAI "AUTOCOMBAT";
	_traderObject disableAI "COVER";
    _traderObject disableAI "MOVE";
    _traderObject disableAI "PATH";
    _traderObject disableAI "FSM";
    _traderObject disableAI "AUTOTARGET";
    _traderObject disableAI "TARGET";
    _traderObject disableAI "CHECKVISIBLE";*/

	[_traderObject] call WMS_fnc_lockToTheGround;
	/*
	_traderObject addEventHandler ["hit", {
		(_this select 0) setDamage 0;
		(_this select 0) allowDamage false;
	}];*/
	_traderObject addEventHandler ["killed", {
		removeAllWeapons (_this select 0);
		deleteVehicle (_this select 0);
		
		removeAllWeapons (_this select 1);
		vehicle (_this select 1) setDamage 1;
		deleteVehicle (_this select 1);

		removeAllWeapons (_this select 2);
		vehicle (_this select 2) setDamage 1;
		deleteVehicle (_this select 2);
/*
    	_TraderData = (_this select 0) getVariable ["ReCreateTraderData", []];
		if !(count _TraderData == 0) then {
			_TraderData call WMS_respawnDeadTrader;
		};
*/
	}];