/**
 * WMS_fnc_client_retrieveRespawnData
 *
 * TNA-Community
 * https://discord.gg/Zs23URtjwF
 * © 2021 {|||TNA|||}WAKeupneo
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
/*private _playerTraits = [
    player getVariable ["WMS_Specialist_Bambi",false],
    player getVariable ["WMS_Specialist_Breacher",false],
    player getVariable ["WMS_Specialist_Engineer",false],
    player getVariable ["WMS_Specialist_Sniper",false],
    player getVariable ["WMS_Specialist_Medic",false]
];*/
if (WMS_MissionDebug) then {diag_log format ["[WMS_client_canCustomRespawn]|WAK|TNA|WMS|_time %1, player %2", time, name player]};
if (missionNamespace getVariable["WMS_client_canCustomRespawn",true] && {(getPlayerUID player) in WMS_customRespawnList}) then {
	//private _customRespawnData = [missionNameSpace, ((getPlayerUID player)+"_RespawnData"), []] call BIS_fnc_getServerVariable; //this is probably why sometime the custom respawn is fucked, busy server doesnt send datas
	//private _customRespawnData = [missionNameSpace, ((getPlayerUID player)+"_RespawnData"), []] call BIS_fnc_getServerVariable; //this is probably why sometime the custom respawn is fucked, busy server doesnt send datas
	private _customRespawnData = missionNamespace getVariable[format ["WMS_%1_RespawnData",(getPlayerUID player)],[]];
	if (WMS_MissionDebug) then {diag_log format ["[WMS_client_canCustomRespawn]|WAK|TNA|WMS|_customRespawnData %1", _customRespawnData]};
	if ((count _customRespawnData) == 4) then { //OLD version WITHOUT Players Traits
		_customRespawn = [player,(_customRespawnData select 1),'1-Last Known Position'] call BIS_fnc_addRespawnPosition;
		missionNamespace setVariable["WMS_client_customRespawnPos",(_customRespawnData select 1)];
		missionNamespace setVariable["WMS_client_customRespawnAce",(_customRespawnData select 2)];
		missionNamespace setVariable["WMS_client_customRespawnInv",(_customRespawnData select 3)];
		missionNamespace setVariable["WMS_client_customRespawnTra",[false,false,false,false,false,true,false]]; //[_bambi,_breacher,_engineer,_sniper,_medic,_CanBuildComputer,_RMO]
		missionNamespace setVariable["WMS_client_customRespawnToDelete",_customRespawn];
	}else {
		if ((count _customRespawnData) == 5) then { //NEW version WITH Players Traits
			_customRespawn = [player,(_customRespawnData select 1),'1-Last Known Position'] call BIS_fnc_addRespawnPosition;
			missionNamespace setVariable["WMS_client_customRespawnPos",(_customRespawnData select 1)];
			missionNamespace setVariable["WMS_client_customRespawnAce",(_customRespawnData select 2)];
			missionNamespace setVariable["WMS_client_customRespawnInv",(_customRespawnData select 3)];
			missionNamespace setVariable["WMS_client_customRespawnTra",(_customRespawnData select 4)];//[_bambi,_breacher,_engineer,_sniper,_medic,_CanBuildComputer,_RMO]
			missionNamespace setVariable["WMS_client_customRespawnToDelete",_customRespawn];
			//if (count (_customRespawnData select 4) == 6) then {
			if (count (_customRespawnData select 4) == 7) then {
				localNamespace setVariable ['WMS_Loc_CanBuildComputer',(_customRespawnData select 4 select 5)]; //this prevent players disconnect/reconnect when they forgot their computer (should)
			} else {
				localNamespace setVariable ['WMS_Loc_CanBuildComputer',true];
				systemChat "Infantry Computer Available By Default";
			};
		} else {
			systemChat "No custom Spawn Data Not Available";
		};
	};
}else {systemChat "No custom Spawn Data on the server"};