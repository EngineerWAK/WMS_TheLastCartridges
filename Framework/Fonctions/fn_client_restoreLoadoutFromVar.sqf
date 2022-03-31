/**
 * WMS_fnc_client_restoreLoadoutFromVar
 *
 * TNA-Community
 * https://discord.gg/Zs23URtjwF
 * © 2021 {|||TNA|||}WAKeupneo
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */

params [
	"_playerObject",
	"_loadoutData"
];
player forceaddUniform ((_loadoutData select 0) select 0);
{player addItemToUniform _x}forEach  ((_loadoutData select 0) select 1);
player addVest ((_loadoutData select 1) select 0);
{player addItemToVest _x}forEach  ((_loadoutData select 1) select 1);
player addBackpackGlobal ((_loadoutData select 2) select 0);
{player addItemToBackpack _x}forEach  ((_loadoutData select 2) select 1);
player addHeadgear (_loadoutData select 3);
player addGoggles (_loadoutData select 4);
player addWeapon (_loadoutData select 5);
player addMagazine ((_loadoutData select 6) select 2);
player addWeapon ((_loadoutData select 6) select 0);
{player addPrimaryWeaponItem _x}forEach  ((_loadoutData select 6) select 1);
player addMagazine ((_loadoutData select 7) select 2);
player addWeapon ((_loadoutData select 7) select 0);
{player addSecondaryWeaponItem _x}forEach  ((_loadoutData select 7) select 1);
player addMagazine ((_loadoutData select 8) select 2);
player addWeapon ((_loadoutData select 8) select 0);
{player addHandgunItem _x}forEach  ((_loadoutData select 8) select 1);
{player additem _x; player assignItem _x}forEach  (_loadoutData select 9);