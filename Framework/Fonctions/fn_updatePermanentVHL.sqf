/**
 * WMS_fnc_updatePermanentVHL
 *
 * TNA-Community
 * https://discord.gg/Zs23URtjwF
 * © 2021 {|||TNA|||}WAKeupneo
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */

// [_this]call WMS_fnc_updatePermanentVHL
/*
NEED TO TAKE A LOOK AT THIS:
_yourArray = _yourArray call BIS_fnc_consolidatearray;
*/
private ["_permanentVhlArray","_ownerUID","_vehicleID_inventory_list","_vehicleInventory","_startDamage"];
//(_this select 0) call WMS_fnc_updatePermanentVHL; //from respawnPermanentVehicle
//nul = (_this select 0) remoteExec ['WMS_fnc_updatePermanentVHL', 2]; //from initVehicleAddAction, player side
params [
	"_vehicleObject",
	["_updateType", "lastUpdate"] //"lastUpdate", 'lockunlock', 'vehiclecrew', "destroyed"
	];
//_vehicleObject = _this select 0;
//_updateType = _this select 1; //"lastUpdate", 'lockunlock', 'vehiclecrew', "destroyed"
if (true) then {diag_log format ["[PERMANENT_VEHICLES]|WAK|TNA|WMS|UPDATE: _this %1", _this]};

_vehicleID 			= _vehicleObject getVariable ["WMS_vehicleid", -1];
_ownerUID 			= _vehicleObject getVariable ["WMS_buyerowner", -1];
_friends 			= _vehicleObject getVariable ["WMS_friends", []];
_isPermanent 		= _vehicleObject getVariable ["WMS_permanentvhl", false];
_howmanyrestarts 	= _vehicleObject getVariable ["WMS_howmanyrestarts", 0];
_vehicleID_inventory = _vehicleObject getVariable ["WMS_vehicleID_inventory", ""];
_vehicleInventory 	= profileNameSpace getVariable [_vehicleID_inventory, [[],[],[],[]]];

if (true) then {diag_log format ["[PERMANENT_VEHICLES]|WAK|TNA|WMS|UPDATE: _this: %1, Owner: %2, _vehicleID %3, %4",_vehicleObject,  _ownerUID, _vehicleID,_isPermanent]};
/*
_msgHint = format ["_this: %1m, Owner: %2, _vehicleID %3, %4",_vehicleObject,  _ownerUID, _vehicleID,_isPermanent];
//_msgHint remoteExec ["hint", 0];
[_msgHint] remoteExecCall ['SystemChat',0];
*/
if !(_isPermanent) exitWith {
	//Diag_log error message blablabla
	_vehicleObject setDamage 1; //that would be funny
};
_permanentVhlArray = profileNameSpace getVariable ["WMS_permanentVhlArray", []];
_playerArrayNumber = _ownerUID call WMS_fnc_findUIDinVhlArray; //find the owner Array in the _permanentVhlArray
_vehicleArrayNumber = [_playerArrayNumber,_vehicleID]  call WMS_fnc_findVhlIDinVhlArray; //return -1 if fuckedup

if (_vehicleArrayNumber == -1) exitWith {
	if (true) then {diag_log format ["[PERMANENT_VEHICLES]|WAK|TNA|WMS|It's Fucked up bro: vehicle: %1, _vehicleArrayNumber: %2",_vehicleObject,_vehicleArrayNumber]};
};

_vehicleArray = ((_permanentVhlArray select _playerArrayNumber) select _vehicleArrayNumber);

if (damage _vehicleObject == 1) then { //call from _killed" eventHandler
	//Vehicles destroyed, removing from player array
	(_permanentVhlArray select _playerArrayNumber) deleteAt _vehicleArrayNumber;
	WMS_permanentVehicleObjects deleteAt (WMS_permanentVehicleObjects find _vehicleObject);
	profileNamespace setVariable [_vehicleID_inventory, nil];
} else {
//_vehicleID = _vehicleArray select 0;
_classname	= _vehicleArray select 1;
/*_lastPos 	= _vehicleArray select 2;
_direction 	= _vehicleArray select 3;
_damage 	= _vehicleArray select 4;
_fuel 		= _vehicleArray select 5;
_friends 	= _vehicleArray select 6;
_weap 		= _vehicleInventory select 0;
_ammo 		= _vehicleInventory select 1;
_backpack 	= _vehicleInventory select 2;
_item 		= _vehicleInventory select 3;*/
if !(_classname == TypeOf _vehicleObject) exitwith {
	//Diag_log error message blablabla
	_vehicleObject setDamage 1; //that would be funny
};

_newPos = getPos _vehicleObject;
_newDir = getDir _vehicleObject;
_startDamage = _vehicleObject getVariable ['WMS_startDamage', 999]; //999 means the vehicle has been unloched and is now allowDamage true
_newDam = 0;
if (_startDamage == 999) then { //means vehicles has already been unlocked and is now allowDamage true with it's own damage applied 
	_newDam = damage _vehicleObject;
} else {
	//_newDam = damage _startDamage; //NOPE you moron
	_newDam = _startDamage; //server will keep backing-up the damage from the variable to prevent "auto-repair" is the vehicle is never unlocked
};
//_newDam = damage _vehicleObject;
_newFuel = fuel  _vehicleObject;
_newFriends = _friends;
_newWeap = WeaponCargo _vehicleObject;
_newAmmo = magazineCargo _vehicleObject;
_newPack = backPackCargo _vehicleObject;
_newItem = itemCargo _vehicleObject;
//_permanentVhlArray set [(((_permanentVhlArray select _playerArrayNumber) select _vehicleArrayNumber) select 2), _newPos];
//((_permanentVhlArray select _playerArrayNumber) select _vehicleArrayNumber) set [2, _newPos];
((_permanentVhlArray select _playerArrayNumber) select _vehicleArrayNumber) set [3, _newDir];
((_permanentVhlArray select _playerArrayNumber) select _vehicleArrayNumber) set [4, _newDam];
((_permanentVhlArray select _playerArrayNumber) select _vehicleArrayNumber) set [5, _newFuel];
((_permanentVhlArray select _playerArrayNumber) select _vehicleArrayNumber) set [6, _friends];/*
(((_permanentVhlArray select _playerArrayNumber) select _vehicleArrayNumber) select 7) set [0, _newWeap];
(((_permanentVhlArray select _playerArrayNumber) select _vehicleArrayNumber) select 7) set [1, _newAmmo];
(((_permanentVhlArray select _playerArrayNumber) select _vehicleArrayNumber) select 7) set [2, _newPack];
(((_permanentVhlArray select _playerArrayNumber) select _vehicleArrayNumber) select 7) set [3, _newItem];*/
if (_updateType == 'lockunlock' || _updateType == 'vehiclecrew' || _updateType == 'getout') then {
	((_permanentVhlArray select _playerArrayNumber) select _vehicleArrayNumber) set [8, 0];
	((_permanentVhlArray select _playerArrayNumber) select _vehicleArrayNumber) set [2, _newPos]; //prevent updating vehicle position (even if not used) at every restart
}else {
	if (_updateType == "lastUpdate") then {
		if ((count (nearestObjects [_newPos, ["rhsgref_serhat_radar"], 100])) == 0) then {
			((_permanentVhlArray select _playerArrayNumber) select _vehicleArrayNumber) set [8, (_howmanyrestarts + 1)];
		}else {
			((_permanentVhlArray select _playerArrayNumber) select _vehicleArrayNumber) set [8, 0];
			if (true) then {diag_log format ["[PERMANENT_VEHICLES]|WAK|TNA|WMS|UPDATE: Territory flag detected, resseting restart count _this: %1, Owner: %2, _vehicleID %3",_vehicleObject,  _ownerUID, _vehicleID]};
		};
	};
	
};

//_vehicleInventory set [0, _newWeap];
//_vehicleInventory set [1, _newAmmo];
//_vehicleInventory set [2, _newPack];
//_vehicleInventory set [3, _newItem];

//_vehicleID_inventory_list = [_newWeap,_newAmmo,_newPack,_newItem];
profileNameSpace setVariable [_vehicleID_inventory,[_newWeap,_newAmmo,_newPack,_newItem]];

};
profileNameSpace setVariable ["WMS_permanentVhlArray", _permanentVhlArray];
//saveProfileNamespace;