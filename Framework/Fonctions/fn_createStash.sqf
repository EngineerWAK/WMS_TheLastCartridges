/**
 * WMS_fnc_createStash
 *
 * TNA-Community
 * https://discord.gg/Zs23URtjwF
 * © 2021 {|||TNA|||}WAKeupneo
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */

private ["_playerArray","_result","_targetUID","_targetOwner","_permanentVhlArray","_arrayPosition","_veh","_vehicleID","_helipadList","_helipad","_helipadOccupied"];
params[
	"_playerObject",
	["_stashClassName","Box_Syndicate_Ammo_F"],//"Box_Syndicate_Ammo_F","Box_Syndicate_Wps_F","Box_IED_Exp_F","Box_Syndicate_WpsLaunch_F"
	["_pos",[]] //(getPosASL _buyer)
];
if (WMS_MissionDebug) then {diag_log format ["[CREATE_STASH]|WAK|TNA|WMS|UPDATE: _this %1", _this]};

if (count _pos == 0) then {_pos = ASLtoAGL (getPosASL _playerObject)};
_playerArray = [];
_result = [];
_veh = ObjNull;
_targetUID = getPlayerUID _playerObject;
_targetOwner = (owner _playerObject);
_stashArray = profileNameSpace getVariable ["WMS_stashArray", []];
{ 
	_found = _x find _targetUID;
	_result pushback _found;
}forEach _stashArray;
_arrayPosition = _result find 0;
_result = [];
if !(_arrayPosition == -1) then {
	_playerArray = (_stashArray select _arrayPosition); //[_targetUID,["0a0a0a0a",classename,position,direction,damage,inventoryID,_howmanyrestarts]
} else {
	_stashArray pushback [_targetUID];
	profileNameSpace setVariable ["WMS_stashArray", _stashArray]; 
	{ 
		_found = _x find _targetUID;
		_result pushback _found;
	}forEach _stashArray;
	_arrayPosition = _result find 0;
	_playerArray = (_stashArray select _arrayPosition);
};
_veh = createVehicle [_stashClassName, [0,0,5555], [], 0, "NONE"];
_veh setpos (_playerObject modelToWorld [0,1,0]);
_veh setDir (getDir _playerObject);
WMS_StashObjects pushBack _veh;
_vehicleID = call WMS_fnc_generateHexaID;
_veh setVariable ["WMS_buyerowner", _targetUID, true];
_veh setVariable ["WMS_vehicleid", _vehicleID, true];
_veh setVariable ["WMS_permanentvhl", true, true];
_veh setVariable ["WMS_howmanyrestarts", 0];
_vehicleID_inventory = _vehicleID + "_inventory";
_veh setVariable ["WMS_vehicleID_inventory", _vehicleID_inventory, true];
_veh addMPEventHandler ["MPkilled", {
	if (isDedicated) then {
		//[(_this select 0),"destroyed"] remoteExec ['WMS_fnc_updatePermanentVHL', 2];//remoteExec doesnt make sens
		[(_this select 0),"destroyed"] call WMS_fnc_updatePermanentVHL; //remoteExec doesnt make sens
		if (WMS_MissionDebug) then {
			if (WMS_MissionDebug) then {diag_log "|WAK|TNA|WMS|";};
			if (WMS_MissionDebug) then {diag_log format ["a stash (%1) has been destroyed by %2, instigator %3", (_this select 0), (_this select 1), (_this select 2)];};
			if (WMS_MissionDebug) then {diag_log "|WAK|TNA|WMS|";};
		};
	};
	}
];//params ["_unit", "_killer", "_instigator", "_useEffects"];

clearMagazineCargoGlobal _veh; 
clearWeaponCargoGlobal _veh; 
clearItemCargoGlobal _veh; 
clearBackpackCargoGlobal _veh;
_playerArray pushback [_vehicleID,_stashClassName,_pos,(direction _veh),0,_vehicleID_inventory,0]; //NEW ["0a0a0a0a",classename,position,direction,damage,inventoryID,_howmanyrestarts]
_stashArray set [_arrayPosition, _playerArray];
profileNameSpace setVariable ["WMS_stashArray", _stashArray];
profileNameSpace setVariable [_vehicleID_inventory, [[],[],[],[]]];
