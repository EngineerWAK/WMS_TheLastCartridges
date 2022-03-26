/**
 * WMS_fnc_territoryUpgrade
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
private ["_ownerUID","_territoriesArray","_playerUID_ExileMoney","_playerMoney","_territoryLvL","_results","_found","_vehicleID","_BuyerOwner","_layout"];
params [
	"_flag",
	"_caller"
];
_ownerUID = getPlayerUID _caller;
_territoriesArray = profileNameSpace getVariable ["territoriesArray", []];
_playerUID_ExileMoney = "ExileMoney_"+_ownerUID;
_playerMoney = profileNamespace getVariable [_playerUID_Exilemoney,0];
_vehicleID = _flag getVariable ["vehicleID", 0]; //select 0
_BuyerOwner = _flag getVariable ["BuyerOwner", 0]; //select 3
_layout = _flag getVariable ["layout", "bunkercamp"]; //select 6

if (true) then {diag_log format ["[UPGRADETERRITORY]|WAK|TNA|WMS| _this %1", _this]};

_results = [];
{ 
	_found = _x find _vehicleID;
	_results pushback _found;
}forEach _territoriesArray;
_result = _results find 0;

if (_result == -1) exitWith {};

_territoryLvL = ((_territoriesArray select _result) select 2);
(_territoriesArray select _result) set [2, _territoryLvL+1];
profileNameSpace setVariable ["territoriesArray", _territoriesArray];

_flag setvariable ["exileterritorylevel",_territoryLvL+1, true];
_caller setVariable ["ExileMoney", _playerMoney-20000, true];

profileNamespace setVariable [_playerUID_Exilemoney,(_playerMoney-20000)];

