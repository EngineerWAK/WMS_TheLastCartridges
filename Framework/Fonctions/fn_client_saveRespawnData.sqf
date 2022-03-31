/**
 * WMS_fnc_client_saveRespawnData
 *
 * TNA-Community
 * https://discord.gg/Zs23URtjwF
 * © 2021 {|||TNA|||}WAKeupneo
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */

if (true) then {diag_log format ["[WMS_fnc_client_saveRespawnData]|WAK|TNA|WMS|_time %1, player %2", time, name player]};
player setVariable["WMS_saveAndDisconnect",true,true]; //this to filter the difference between just dying or dying after this action
_inventory = [player, [missionNamespace, (getPlayerUID player)], [], true ] call BIS_fnc_saveInventory;
[player,position player,_inventory]remoteExec ["WMS_fnc_saveRespawnData",2];
//missionNamespace setVariable["WMS_client_canCustomRespawn",true]; //this should make the custom Respawn available during the same run and not only after restart