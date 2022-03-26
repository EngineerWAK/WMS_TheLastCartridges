/**
 * WMS_fnc_rotateBaseObjects
 *
 * TNA-Community
 * https://discord.gg/Zs23URtjwF
 * © 2021 {|||TNA|||}WAKeupneo
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
private ["_ownerUID","_territoriesArray","_playerUID_ExileMoney","_playerMoney","_buildingsToDelete","_results","_found","_vehicleID","_BuyerOwner","_layout"];
params [
	"_flag",
	"_caller",
	"_newHading",
	["_price", "notFree"]
];
_ownerUID = getPlayerUID _caller;
_territoriesArray = profileNameSpace getVariable ["territoriesArray", []];
//_playerUID_ExileMoney = "ExileMoney_"+_ownerUID;
//_playerMoney = profileNamespace getVariable [_playerUID_Exilemoney,0];
_vehicleID = _flag getVariable ["vehicleID", 0];
_BuyerOwner = _flag getVariable ["BuyerOwner", 0];
_layout = _flag getVariable ["layout", "bunkercamp"];
_buildingsToDelete = [];
if (true) then {diag_log format ["[ROTATEBASE]|WAK|TNA|WMS| _this %1", _this]};

_results = [];
{ 
	_found = _x find _vehicleID;
	_results pushback _found;
}forEach _territoriesArray;
_result = _results find 0;

_flag setDir _newHading;
(_territoriesArray select _result) set [5, _newHading];
profileNameSpace setVariable ["territoriesArray", _territoriesArray];

{
	_territoryObject = _x getVariable ["_territoryObject",false];
	if (_territoryObject) then {
		_buildingsToDelete pushBack _x;
	};
}forEach ((position _flag) nearObjects ["Building", 150]);

{
	deleteVehicle _x;
}forEach _buildingsToDelete;

[_flag, (position _flag), _newHading, _layout] call WMS_fnc_SpawnCamps;

if (_price != "free") then { //free from the Layout Upgrade
	//profileNamespace setVariable [_playerUID_Exilemoney,(_playerMoney-2500)];
	//_caller setVariable ["ExileMoney", _playerMoney-2500, true];
	[_caller, 2500] call WMS_fnc_smallTransactions;
};
_flag setVariable ['_origininalHeading', (getDir _flag), true];

