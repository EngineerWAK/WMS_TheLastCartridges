/**
 * WMS_fnc_territoryUpdate
 *
 * TNA-Community
 * https://discord.gg/Zs23URtjwF
 * © 2021 {|||TNA|||}WAKeupneo
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
//	[
//		["327cbc1e",[5534.31,9379.95,0],4,"76561197965501020",["76561197965501020","76561198040890495"],103.731,"helipadbig"]
//	]
private ["_ownerUID","_territoriesArray","_results","_result","_found","_vehicleID"];
params [
	"_flag",
	"_caller",
	"_update", //array of the "friend(s) to add
	"_type" //"friends"
];
_ownerUID = getPlayerUID _caller;
_territoriesArray = profileNameSpace getVariable ["WMS_territoriesArray", []];
_vehicleID = _flag getVariable ["WMS_vehicleid", 0]; //select 0
_territoryFastTravel = [];
if (WMS_MissionDebug) then {diag_log format ["[UPDATETERRITORY]|WAK|TNA|WMS| _this %1", _this]};

_results = [];
{ 
	_found = _x find _vehicleID;
	_results pushback _found;
}forEach _territoriesArray;
_result = _results find 0;

if (_result == -1) exitWith {diag_log format ["[UPDATETERRITORY]|WAK|TNA|WMS|ERROR _result = %1", _result]};
diag_log format ["[UPDATETERRITORY]|WAK|TNA|WMS| _territoriesArray select _result %1", (_territoriesArray select _result)];
if (_type == 'friends' && _result != -1) then {
	//_buildingRightUID = ((_territoriesArray select _result) select 4); //not used
	(_territoriesArray select _result) set [4, _update];

	_territoryFastTravel = profileNameSpace getVariable ['WMS_territoryfasttravel', []];
	_territoryFastTravel = _territoryFastTravel + _update; //will probably add some already existing UID since the owner is includ in "friends" but should work
};
diag_log format ["[UPDATETERRITORY]|WAK|TNA|WMS| _territoriesArray %1", _territoriesArray];
diag_log format ["[UPDATETERRITORY]|WAK|TNA|WMS| _territoryFastTravel %1", _territoryFastTravel];
profileNameSpace setVariable ["WMS_territoriesArray", _territoriesArray]; //no ', true'
profileNameSpace setVariable ['WMS_territoryfasttravel', _territoryFastTravel]; //no ', true'

