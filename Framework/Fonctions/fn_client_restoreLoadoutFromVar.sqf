/**
 * WMS_fnc_client_restoreLoadoutFromVar
 *
 * TNA-Community
 * https://discord.gg/Zs23URtjwF
 * © 2021 {|||TNA|||}WAKeupneo
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 * _loadoutData = [
 * 	["",[]], //uniform 
 *	["",[]], //vest
 *	["",[]], //backpack
 *	"", //helmet
 *	"", //goggles/facewear
 *	"", //binocular
 * 	["",["","","",""],""], //primaryWeapon
 *	["",["","","",""],""], //secondaryWeapon
 *	["",["","","",""],""], //handgunWeapon
 *	[],//linkItem
 *	[] //magazinesAmmo //[["magazine","ammoCount"],["magazine","ammoCount"],["magazine","ammoCount"]] //not yet
 * ];
 */
private ["_uniform","_vest","_headgear","_goggles","_backpack","_weapons","_primaryWeaponItems","_secondaryWeaponItems","_handgunWeaponItems","_linkedItemsMisc","_magazines"];
params [
	"_playerObject",
	"_loadoutData"
];
_uniform = _loadoutData select 0 select 0;
_vest = _loadoutData select 1 select 0;
_headgear = _loadoutData select 3;
_goggles = _loadoutData select 4;
_backpack = _loadoutData select 2 select 0;
_weapons = [_loadoutData select 5,_loadoutData select 6 select 0,_loadoutData select 7 select 0,_loadoutData select 8 select 0];
_primaryWeaponItems = (_loadoutData select 6 select 1);
_secondaryWeaponItems = (_loadoutData select 7 select 1);
_handgunWeaponItems = (_loadoutData select 8 select 1);
_linkedItemsMisc = (_loadoutData select 9);
_magazines = (_loadoutData select 10);
//remove:
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
//Add:
if (_uniform != "") then {
	_playerObject forceadduniform _uniform;
};
{player addItemToUniform _x}forEach  ((_loadoutData select 0) select 1);
if (_vest != "") then {
	_playerObject addvest _vest;
};
{player addItemToVest _x}forEach  ((_loadoutData select 1) select 1);
if (_headgear != "") then {
	_playerObject addheadgear _headgear;
};
if (_goggles != "") then {
	_playerObject addgoggles _goggles;
};
if (_backpack != "") then {
	_playerObject addbackpack _backpack;
	clearAllItemsFromBackpack _playerObject
};
{player addItemToBackpack _x}forEach  ((_loadoutData select 2) select 1);
/*{
	if (_x != "") then {
		_playerObject addmagazine _x;
	};
}foreach _magazines;*/
{
	_playerObject addmagazine _x; //player addMagazine ["magazineName", "ammoCount"];
}foreach _magazines;
player addMagazine ((_loadoutData select 6) select 2); //primary
player addMagazine ((_loadoutData select 7) select 2); //secondary/launcher
player addMagazine ((_loadoutData select 8) select 2); //handGun
{
	if (_x != "") then {
		_playerObject addweapon _x;
	};
}foreach _weapons;
{
	if (_x != "") then {
		_playerObject addPrimaryWeaponItem _x;
	};
} forEach _primaryWeaponItems;
{
	if (_x != "") then {
		_playerObject addSecondaryWeaponItem _x;
	};
} forEach _secondaryWeaponItems;
{
	if (_x != "") then {
		_playerObject addHandgunItem _x;
	};
} forEach _handgunWeaponItems;
{
	if (_x != "") then {
		_playerObject linkitem _x;
	};
}foreach _linkedItemsMisc;
/*
{
	if ((_x select 0) != "") then {
		_playerObject addweaponcargoglobal _x;
	};
} foreach _transportWeapons;*/