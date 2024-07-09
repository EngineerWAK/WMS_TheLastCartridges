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

if (WMS_MissionDebug) then {diag_log format ["[WMS_fnc_saveRespawnData]|WAK|TNA|WMS|_this %1", _this]};
params [
	"_playerObject",
	"_pos", //ASL
	["_aceMedical",[]], //got it's own function, but transit from here
	["_playerTraits",[false,false,false,false,false,false,false]] //[_bambi,_breacher,_engineer,_sniper,_medic,_CanBuildComputer,_RMO]
];
private _playerUID = getPlayerUID _playerObject;
private _inventoryVarName = (_playerUID+"_RespawnData");
/////////////////////////////////////////
//--- Get magazines loaded to weapons //from BIS_fnc_saveInventory, mofified to get ammo count in each mags
private ["_primaryWeaponMagazine","_secondaryWeaponMagazine","_handgunMagazine"];
_primaryWeaponMagazine = [];
_secondaryWeaponMagazine = [];
_handgunMagazine = [];

{
	if (count _x > 4 && {typename (_x select 4) == typename []}) then {
		private ["_weapon","_magazine"];
		_weapon = _x select 0;
		_magazine = _x select 4 select 0;
		if !(isnil "_magazine") then {
			switch _weapon do {
				case (primaryweapon _playerObject): {_primaryWeaponMagazine = _magazine;};
				case (secondaryweapon _playerObject): {_secondaryWeaponMagazine = _magazine;};
				case (handgunweapon _playerObject): {_handgunMagazine = _magazine;};
			};
		};
	};
} foreach weaponsitems _playerObject;

//--- Get current values
private ["_export","_uniformItems","_vestItems","_backpackItems"];
_uniformItems = [];
_vestItems = [];
_backpackItems = [];
{if !(_x isKindOf ["CA_Magazine", configFile >> "CfgMagazines"]) then {_uniformItems pushBack _x}}forEach (uniformitems _playerObject);
{if !(_x isKindOf ["CA_Magazine", configFile >> "CfgMagazines"]) then {_vestItems pushBack _x}}forEach (vestitems _playerObject);
{if !(_x isKindOf ["CA_Magazine", configFile >> "CfgMagazines"]) then {_backpackItems pushBack _x}}forEach (backpackitems _playerObject);

_export = [
	/* 00 */	[uniform _playerObject,_uniformItems],
	/* 01 */	[vest _playerObject,_vestItems],
	/* 02 */	[backpack _playerObject,_backpackItems],
	/* 03 */	headgear _playerObject,
	/* 04 */	goggles _playerObject,
	/* 05 */	binocular _playerObject,
	/* 06 */	[primaryweapon _playerObject call bis_fnc_baseWeapon,_playerObject weaponaccessories primaryweapon _playerObject,_primaryWeaponMagazine],
	/* 07 */	[secondaryweapon _playerObject call bis_fnc_baseWeapon,_playerObject weaponaccessories secondaryweapon _playerObject,_secondaryWeaponMagazine],
	/* 08 */	[handgunweapon _playerObject call bis_fnc_baseWeapon,_playerObject weaponaccessories handgunweapon _playerObject,_handgunMagazine],
	/* 09 */	assigneditems _playerObject - [binocular _playerObject],
	/* 10 */	magazinesAmmo _playerObject
];
//from BIS_fnc_saveInventory, mofified to get ammo count in each mags
/////////////////////////////////////////

profileNameSpace setvariable[_inventoryVarName,[_playerUID,_pos,_aceMedical,_export,_playerTraits]];
missionNameSpace setvariable[format ["WMS_%1",_inventoryVarName],[_playerUID,_pos,_aceMedical,_export,_playerTraits]];
private _customRespawnList = serverNameSpace getvariable["WMS_customRespawnList",[]];
if !(_playerUID in _customRespawnList) then {
	_customRespawnList pushBack _playerUID;
	//serverNameSpace setvariable["WMS_customRespawnList",_customRespawnList];
	profilenameSpace setvariable["WMS_customRespawnList",_customRespawnList];
	missionNameSpace setvariable["WMS_customRespawnList",_customRespawnList];
};
publicVariable "WMS_customRespawnList";
publicVariable (format ["WMS_%1",_inventoryVarName]);
removeuniform _playerObject;
removevest _playerObject;
removeheadgear _playerObject;
removegoggles _playerObject;
removebackpack _playerObject;
removeallitems _playerObject;
removeallassigneditems _playerObject;
removeallweapons _playerObject;
if (count (getmagazinecargo _playerObject select 0) > 0) then {clearmagazinecargoglobal _playerObject;};
if (count (getweaponcargo _playerObject select 0) > 0) then {clearweaponcargoglobal _playerObject;};
if (count (getitemcargo _playerObject select 0) > 0) then {clearitemcargoglobal _playerObject;};
[{(findDisplay 46)closeDisplay 0;}] remoteExecCall ['call',(owner _playerObject),false];
//_playerObject setDamage 1;
//WMS_serverCMDpwd serverCommand format ["#kick %1",_playerUID]; //thats pretty hardcore xD
saveprofileNameSpace;
if (WMS_MissionDebug) then {diag_log "[WMS_fnc_saveRespawnData]|WAK|TNA|WMS|ProfileNameSpace Saved"};
[_playerObject] spawn { //this spawn will now trigger a "last vehicle backup" if no player left on the server to try to minimize dirty server restart where vehicle data are lost
	hideBody  (_this select 0);
	uisleep 2;
	if ((_this select 0) isKindOf "man" ) then {
		deleteVehicle (_this select 0); //Suspicious destruction of some personal vehicles at the same time
	}else{
		diag_log "[WMS_fnc_saveRespawnData]|WAK|TNA|WMS|WTF DUDE!?!? THIS IS NOT A DEAD BODY!!!"
	};
	uisleep 1;
	if (count allPlayers == 0) then { //need a check to not force the update during the last 2 minutes, check WMS_ServRestartSeconds
		if (serverTime <= (WMS_ServRestartSeconds-120)) then {
			[] call WMS_fnc_permanentVehiclesLastUpdate; //TheLastCartridges permanent vehicles
		};
	};
};