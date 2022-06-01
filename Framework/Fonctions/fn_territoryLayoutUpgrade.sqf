/**
 * WMS_fnc_territoryLayoutUpgrade
 *
 * TNA-Community
 * https://discord.gg/Zs23URtjwF
 * © 2021 {|||TNA|||}WAKeupneo
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
private ["_ownerUID","_territoriesArray","_playerUID_ExileMoney","_playerMoney","_buildingsToDelete","_results","_result","_found","_vehicleID","_BuyerOwner","_layout"];
params [
	"_flag",
	"_caller",
	"_price", //25000
	"_layout", //'bunkercampbigger'
	"_when" //'rightnow' //'restart'
];
/*
		_flagID = (_x select 0);
		_flagPos = (_x select 1);
		_territoryLevel = (_x select 2);
		_ownerUID = (_x select 3);
		_buildingRightUID = (_x select 4);
		_flagDir = (_x select 5);
		_layout = (_x select 6);
*/
_ownerUID = getPlayerUID _caller;
_territoriesArray = profileNameSpace getVariable ["WMS_territoriesArray", []];
_playerUID_ExileMoney = "ExileMoney_"+_ownerUID;
_playerMoney = profileNamespace getVariable [_playerUID_Exilemoney,0];

if (_playerMoney < _price) exitWith {};

_vehicleID = _flag getVariable ["WMS_vehicleid", 0];
_buildingsToDelete = [];
if (true) then {diag_log format ["[UPDATELAYOUT]|WAK|TNA|WMS| _this %1", _this]};

_results = [];
{ 
	_found = _x find _vehicleID;
	_results pushback _found;
}forEach _territoriesArray;
_result = _results find 0;

(_territoriesArray select _result) set [6, _layout];
_flag setVariable ["layout", _layout, true];
profileNameSpace setVariable ["WMS_territoriesArray", _territoriesArray];

if (_when == 'rightnow') then {
	[_flag, _caller,(getDir _flag), "free"] call WMS_fnc_rotateBaseObjects;
};

[_caller, _price] call WMS_fnc_smallTransactions;