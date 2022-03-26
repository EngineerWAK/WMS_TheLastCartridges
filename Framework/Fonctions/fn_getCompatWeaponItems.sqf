/**
 * ExileClient_util_gear_getCompatibleWeaponItems
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
/*
this addAction
[
	"Log Compatible items",	// title
	{
		(primaryWeapon (_this select 1)) remoteExec ["WMS_fnc_getCompatWeaponItems"];
	},
	nil,		// arguments
	1.5,		// priority
	true,		// showWindow
	true,		// hideOnUse
	"",			// shortcut
	"true", 	// condition
	5,			// radius
	false,		// unconscious
	"",			// selection
	""			// memoryPoint
];
 */

private["_weaponClassName", "_weaponConfig", "_compatibleItems"];
_weaponClassName = _this; //primaryWeapon player
_weaponConfig = configFile >> "CfgWeapons" >> _weaponClassName;
_compatibleItems = getArray (_weaponConfig >> "magazines");
{
	if (isClass (_weaponConfig >> "WeaponSlotsInfo" >> _x)) then
	{
		_compatibleItems append getArray (_weaponConfig >> "WeaponSlotsInfo" >> _x >> "compatibleItems");
	};
}
forEach ["CowsSlot", "PointerSlot", "MuzzleSlot", "UnderBarrelSlot"];
{
	if !(_x isEqualTo "this") then
	{
		_compatibleItems append getArray (_weaponConfig >> _x >> "magazines");
	};
}
forEach getArray (_weaponConfig >> "muzzles");
{
	_compatibleItems set [_forEachIndex, toLower _x];
}
forEach _compatibleItems;
if (true) then {diag_log format ["[COMPATIBLE_ITEMS]|WAK|TNA|WMS| %1 | %2", _weaponClassName, _compatibleItems]};
_compatibleItems