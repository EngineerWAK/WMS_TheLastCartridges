/**
 * WMS_fnc_saveRespawnData
 *
 * TNA-Community
 * https://discord.gg/Zs23URtjwF
 * © 2021 {|||TNA|||}WAKeupneo
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */

if (true) then {diag_log format ["[WMS_fnc_saveRespawnData]|WAK|TNA|WMS|_this %1", _this]};
params [
	"_playerObject",
	"_pos",
	"_inventory"
];
private _playerUID = getPlayerUID _playerObject;
profileNameSpace setvariable[(_playerUID+"_RespawnData"),[_playerUID,_pos,_inventory]];
private _customRespawnList = serverNameSpace getvariable["WMS_customRespawnList",[]];
if !(_playerUID in _customRespawnList) then {
	_customRespawnList pushBack _playerUID;
	serverNameSpace setvariable["WMS_customRespawnList",_customRespawnList];
};
_playerObject removeWeapon (primaryWeapon _playerObject);
_playerObject removeWeapon (secondaryWeapon _playerObject);
_playerObject removeWeapon (handgunWeapon _playerObject);
removeAllItems _playerObject;
{_playerObject unassignItem _x; _playerObject removeItem _x}forEach (assignedItems _playerObject);
removeBackpackGlobal _playerObject;
//removeAllWeapons _playerObject; //do not work
removeVest _playerObject;
removeUniform _playerObject;
_playerObject setDamage 1;
[{(findDisplay 46)closeDisplay 0;}] remoteExecCall ['call',(owner _playerObject),false];
//WMS_serverCMDpwd serverCommand format ["#kick %1",_playerUID]; //thats pretty hardcore xD
deleteVehicle _playerObject;
//[_playerUID,{(findDisplay 46)closeDisplay 0;};] remoteExecCall ['call',owner _playerObject,false];
//(findDisplay 46)closeDisplay 0;