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

if (WMS_MissionDebug) then {diag_log format ["[WMS_fnc_client_saveRespawnData]|WAK|TNA|WMS|_time %1, player %2", time, name player]};
player setVariable["WMS_saveAndDisconnect",true,true]; //this to filter the difference between just dying or dying after this action
private _aceMedical = [];
private _aceStuff = [
    "ace_isdead",
    "ace_isunconscious",
    "ace_eyesdamaged",
    "ace_medical_openwounds",
    "ace_medical_bloodpressure",
    "ace_medical_incardiacarrest",
    "ace_medical_woundbleeding",
    "ace_medical_inpain",
    "ace_medical_medications",
    "ace_medical_heartrate",
    //"ace_medical_status_killed",
    "ace_medical_pain",
    "ace_medical_bloodvolume",
    "ace_medical_fractures",
    "ace_medical_bodypartdamage",
    "ace_medical_hemorrhage",
    "ace_medical_islimping",
    "ace_medical_bandagedwounds",
    "ace_medical_engine_aimfracture",
    "ace_medical_painsuppress",
    "ace_medical_peripheralresistance",
    "ace_advanced_fatigue_aimfatigue",
    "ace_advanced_fatigue_ae2reserve",
    "ace_advanced_fatigue_anreserve",
    "ace_advanced_fatigue_muscledamage",
    "ace_advanced_fatigue_anfatigue",
    "ace_advanced_fatigue_ae1reserve",
    "acex_field_rations_hunger",
    "acex_field_rations_thirst"
];
{
    _aceMedical pushBack (player getVariable [_x, [-999]]);
}forEach _aceStuff;
private _playerTraits = [
    player getVariable ["WMS_Specialist_Bambi",false],
    player getVariable ["WMS_Specialist_Breacher",false],
    player getVariable ["WMS_Specialist_Engineer",false],
    player getVariable ["WMS_Specialist_Sniper",false],
    player getVariable ["WMS_Specialist_Medic",false]
];
serverCommand "#Logout";
[player,getPosASL player,_aceMedical,_playerTraits]remoteExec ["WMS_fnc_saveRespawnData",2];
//missionNamespace setVariable["WMS_client_canCustomRespawn",true]; //this should make the custom Respawn available during the same run and not only after restart

//////////////////////////////////////////////////////////////////////////////////
