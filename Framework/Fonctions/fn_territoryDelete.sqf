/**
 * WMS_fnc_territoryDelete
 *
 * TNA-Community
 * https://discord.gg/Zs23URtjwF
 * © 2021 {|||TNA|||}WAKeupneo
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private ["_ownerUID","_territoriesArray","_results","_result","_found","_vehicleID"];
params [
	"_flag",
	"_caller"
];
/*
		[["327cbc1e",[5535.49,9383.5,0],1,"76561197965501020",["76561197965501020","76561198040890495"],23.7314,"helipad"]]
		_flagID = (_x select 0);
		_flagPos = (_x select 1);
		_territoryLevel = (_x select 2);
		_ownerUID = (_x select 3);
		_buildingRightUID = (_x select 4);
		_flagDir = (_x select 5);
		_layout = (_x select 6);
*/
_ownerUID = getPlayerUID _caller;
_territoriesArray = profileNameSpace getVariable ["territoriesArray", []];
_vehicleID = _flag getVariable ["vehicleID", "broken"];
if (true) then {diag_log format ["[DELETETERRITORY]|WAK|TNA|WMS| _this %1", _this]};
if (_vehicleID == "broken") exitWith {};

_results = [];
{ 
	_found = _x find _vehicleID;
	_results pushback _found;
}forEach _territoriesArray;
_result = _results find 0;
if (_result == -1) exitWith {};

_territoriesArray deleteAt _result;
deleteVehicle _flag;
//then remove player UID from the FastTravel array if no other territory
_territoryFastTravel = profileNameSpace getVariable ["territoryfasttravel", []];
_territoryFastTravel deleteAt (_territoryFastTravel find _ownerUID); //if multiUID, find will return only the first one
profileNameSpace setVariable ["territoryfasttravel", _territoryFastTravel];
profileNameSpace setVariable ["territoriesArray", _territoriesArray];
