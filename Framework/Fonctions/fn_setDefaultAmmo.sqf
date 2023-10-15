/**
 * WMS_fnc_setDefaultAmmo.sqf
 *
 * TNA-Community
 * https://discord.gg/Zs23URtjwF
 * © 2023 [WMS]WAKeupneo
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */

/*
 	Will register primary weapon "default" ammo by checking the mag in the container and adding it to the list playerUID_defaultAmmo = [[weaponClassname, magClassName]]
	the addAction condition should include:
	(count magazineCargo _target == 1); //not more than 1 mag in the container
	(primaryWeapon player != ""); //player must have a primary weapon
	item (mag) in [primaryWeapon player] call CBA_fnc_compatibleMagazines; //the mag must be compatible //this one might be too heavy for the addAction
	a magazine blacklist will be welcome to prevent some OP ammo, especially from NIA
	[_caller, (primaryWeapon _caller), ((magazineCargo _target) select 0)]call WMS_fnc_setDefaultAmmo; //playerUID_defaultAmmo is local to the player, not on the server so it might need a server log

*/

private ["_magsBL","_compMags","_targetUID","_defaultAmmo","_result","_found"];
params [
	"_target",
	"_weapon",
	"_mag"
];
_magsBL = [];
if (_mag in _magsBL) exitWith {
	systemChat "friendly message, this ammo is blacklisted";
	[format["|WMS|WAK|WMS|WMS_fnc_setDefaultAmmo|BLACKLISTED ammo _this %1",_this]]remoteExec ["diag_log",2];
	};

_compMags = [_weapon] call CBA_fnc_compatibleMagazines;
if !(_mag in _compMags) exitWith {
	//diag_log _this
	[format["|WMS|WAK|WMS|WMS_fnc_setDefaultAmmo|Uncompatible ammo _this %1",_this]]remoteExec ["diag_log",2];
	//remoteExec systemChat //warning for abuse
	systemChat "Please put 1 mag of compatible ammo in the container, only";
	"Instructions" hintC [
		"Get your favorite Primary weapon.",
		"Put one of your favorite ammo mag in the container.",
		"The mag MUST be compatible ammo for your Primary weapon",
		"Activate the Action.",
		"Now, when you buy 'Default Ammo' you will get this registered mag."
	];
	hintC_EH = findDisplay 72 displayAddEventHandler ["Unload", {
		_this spawn {
			_this select 0 displayRemoveEventHandler ["Unload", hintC_EH];
			hintSilent "";
		};
	}];
};
_targetUID = getPlayerUID _target;
_defaultAmmo = profileNameSpace GetVariable [_targetUID+"_defaultAmmo", []];

_result = [];
{  
 _found = _x find _weapon;
 _result pushback _found; 
}forEach _defaultAmmo;
_result = _result find 0;

if (_result == -1) then {
	_defaultAmmo pushback [_weapon,_mag];
} else {
	(_defaultAmmo select _result) set [1,_mag];
};
profileNameSpace setVariable [_targetUID+"_defaultAmmo", _defaultAmmo];
if (true) then {
	//diag_log _this
	[format["|WMS|WAK|WMS|WMS_fnc_setDefaultAmmo|Ammo set as Default _this %1",_this]]remoteExec ["diag_log",2];
	//remoteExec systemChat //"mag" set as default for "weapon classname"
	systemChat format ["%1 set as default",_mag];
	systemChat format ["for %1",_weapon];
};

