/**
 * WMS_fnc_smallTransactions
 *
 * TNA-Community
 * https://discord.gg/Zs23URtjwF
 * © 2021 {|||TNA|||}WAKeupneo
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
//
private ["_ownerUID","_playerUID_ExileMoney","_playerMoney","_newMoney"];
params [
	"_caller", 
	"_price"
];

if (WMS_MissionDebug) then {diag_log format ["[SMALL_TRANSACTION]|WAK|TNA|WMS| _this %1", _this]};

_ownerUID = getPlayerUID _caller;
_playerUID_ExileMoney = "ExileMoney_"+_ownerUID;
_playerMoney = profileNamespace getVariable [_playerUID_Exilemoney,0];
_newMoney = (_playerMoney-_price);

profileNamespace setVariable [_playerUID_Exilemoney,_newMoney];
_caller setVariable ["ExileMoney", _newMoney, true];
if (WMS_MissionDebug) then {diag_log format ["[SMALL_TRANSACTION]|WAK|TNA|WMS| _playerMoney %1- _price %2= _newMoney", _playerMoney, _price, _newMoney]};