/**
 * WMS_fnc_deleteRespawnData
 *
 * TNA-Community
 * https://discord.gg/Zs23URtjwF
 * © 2021 {|||TNA|||}WAKeupneo
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */

if (true) then {diag_log format ["[WMS_fnc_deleteRespawnData]|WAK|TNA|WMS|_this %1", _this]};
params [
	"_playerObject"
];
private _playerUID = getPlayerUID _playerObject;
profileNameSpace setvariable[(_playerUID+"_RespawnData"),nil];
missionNamespace setvariable[(_playerUID+"_RespawnData"),nil];
private _customRespawnList = serverNameSpace getvariable["WMS_customRespawnList",[]];
_customRespawnList deleteAt (_customRespawnList find _playerUID);
//serverNameSpace setvariable["WMS_customRespawnList",_customRespawnList];
profileNameSpace setvariable["WMS_customRespawnList",_customRespawnList];
missionNameSpace setvariable["WMS_customRespawnList",_customRespawnList];
publicVariable "WMS_customRespawnList";
saveprofileNameSpace;
if (true) then {diag_log "[WMS_fnc_deleteRespawnData]|WAK|TNA|WMS|ProfileNameSpace Saved"};