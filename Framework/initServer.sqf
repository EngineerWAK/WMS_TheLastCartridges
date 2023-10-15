/**
 * initServer.sqf
 *
 * TNA-Community
 * https://discord.gg/Zs23URtjwF
 * © 2021 {|||TNA|||}WAKeupneo
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
// Start DynamicFlightOps
//if (true)then {execVM "DFO\WMS_DFO_functions.sqf"};

WMS_lootHolderList = []; //[_house,_lootHolder,(serverTime+_timeToDelete)];
WMS_HC1_ID = 2;
//WMS_MissionDebug = false; //move to init

WMS_customRespawnList = profileNameSpace getvariable["WMS_customRespawnList",[]]; //move from Profile to missionNameSpace, saved by WMS_infantryProgram, after last players kick before restart
publicVariable "WMS_customRespawnList"; //UID list
//from client, need to change: //this is probably why sometime the custom respawn is fucked, busy server doesnt send datas
//private _customRespawnData = [missionNameSpace, ((getPlayerUID player)+"_RespawnData"), []] call BIS_fnc_getServerVariable;
serverNameSpace setvariable["WMS_customRespawnList",WMS_customRespawnList]; //so the server can modify the list without modifying the public one
if ((count WMS_customRespawnList) != 0) then {
	{
		private _dataVariable = (_x +"_RespawnData"); //works, old version
		private _dataVariableNew = (format ["WMS_%1_RespawnData",_x]);
		if (true) then {diag_log format ["[CUSTOMRESPAWNDATA_INIT]|WAK|TNA|WMS|Transfering data from profilenamespace to missionnamespace for  %1", _dataVariable]};
		private _respawndata = profileNameSpace getVariable[_dataVariable, []];
		missionNamespace setVariable[_dataVariableNew, _respawndata];
		publicVariable _dataVariableNew;
	}forEach WMS_customRespawnList;
};

WMS_lootToSpawnList = [
	(getArray(missionConfigFile >> "CfgLootToSpawnCategories" >> "weapons" >> "items")), 		//_weapList
	(getArray(missionConfigFile >> "CfgLootToSpawnCategories" >> "weapons_SPE" >> "items")),	//_weapList_spe
	(getArray(missionConfigFile >> "CfgLootToSpawnCategories" >> "weapons_MIL" >> "items")), 	//_weapList_mil
	(getArray(missionConfigFile >> "CfgLootToSpawnCategories" >> "scopes" >> "items")), 		//_scopList
	(getArray(missionConfigFile >> "CfgLootToSpawnCategories" >> "scopes_SPE" >> "items")), 	//_scopList_spe
	(getArray(missionConfigFile >> "CfgLootToSpawnCategories" >> "scopes_MIL" >> "items")), 	//_scopList_mil
	(getArray(missionConfigFile >> "CfgLootToSpawnCategories" >> "items" >> "items")), 			//_itemList
	(getArray(missionConfigFile >> "CfgLootToSpawnCategories" >> "items_SPE" >> "items")), 		//_itemList_spe
	(getArray(missionConfigFile >> "CfgLootToSpawnCategories" >> "items_MIL" >> "items")), 		//_itemList_mil
	(getArray(missionConfigFile >> "CfgLootToSpawnCategories" >> "items_IND" >> "items")), 		//_itemList_ind
	(getArray(missionConfigFile >> "CfgLootToSpawnCategories" >> "medical" >> "items")), 		//_medList
	(getArray(missionConfigFile >> "CfgLootToSpawnCategories" >> "backpacks" >> "items")), 		//_bagList
	(getArray(missionConfigFile >> "CfgLootToSpawnCategories" >> "backpacks_SPE" >> "items")), 	//_bagList_spe
	(getArray(missionConfigFile >> "CfgLootToSpawnCategories" >> "backpacks_MIL" >> "items")),  //_bagList_mil
	(getArray(missionConfigFile >> "CfgLootToSpawnCategories" >> "vests" >> "items")),  		//_vestList
	(getArray(missionConfigFile >> "CfgLootToSpawnCategories" >> "vests_SPE" >> "items")),  	//_vestList_spe
	(getArray(missionConfigFile >> "CfgLootToSpawnCategories" >> "vests_MIL" >> "items")),  	//_vestList_mil
	(getArray(missionConfigFile >> "CfgLootToSpawnCategories" >> "uniforms" >> "items")), 		//_unifList
	(getArray(missionConfigFile >> "CfgLootToSpawnCategories" >> "uniforms_SPE" >> "items")), 	//_unifList_spe
	(getArray(missionConfigFile >> "CfgLootToSpawnCategories" >> "uniforms_MIL" >> "items")),  	//_unifList_mil
	(getArray(missionConfigFile >> "CfgLootToSpawnCategories" >> "helmets" >> "items")), 		//_helmets
	(getArray(missionConfigFile >> "CfgLootToSpawnCategories" >> "helmets_SPE" >> "items")), 	//_helmets_spe
	(getArray(missionConfigFile >> "CfgLootToSpawnCategories" >> "helmets_MIL" >> "items")),  	//_helmets_mil
	(getArray(missionConfigFile >> "CfgLootToSpawnCategories" >> "foodAndDrinks" >> "items")) 	//_foodList
];

_nil = [] execVM "Server\initTraderBuildingsNoLoot.sqf";
_nil = [] execVM "Server\Weather.sqf";
_nil = [] execVM "Server\respawnPermanentVehicle.sqf";
_nil = [] execVM "Server\SpawnFreeVehicles.sqf";
//_nil = [] execVM "Server\AceFortifyList.sqf"; //NOPE
if (worldName == "Enoch") then {
	_nil = [] execVM "Server\livoniaBagnoCamp.sqf";
};

/////////////////////////////
//diag_log players stats
_playerAlreadyConnected = profileNamespace getVariable ["WMS_playerAlreadyConnected",[]];
{
	diag_log format ["[PLAYERSTATS]|WAK|TNA|WMS| player UID: %1, Kills: %2, Death: %3, Money: %4, Score: %5", _x, profileNamespace getVariable [("ExileKills_"+_x), "nothing"], profileNamespace getVariable [("ExileDeath_"+_x), "nothing"], profileNamespace getVariable [("ExileMoney_"+_x), "nothing"], profileNamespace getVariable [("ExileScore_"+_x), "nothing"]];
}forEach _playerAlreadyConnected;

while {true} do
	{
		private _permanentVehiclesCount = 0;
		private _permanentVhlArray = profileNameSpace getVariable ["WMS_permanentVhlArray", []];
		
			/*_playerArray = _x; //playerArray will change and will contain only [playerUID, [vhlHexaID,vhlHexaID,vhlHexaID]];
			//_playerArrayRef = _x; //[playerUID, [vhlHexaID,vhlHexaID,vhlHexaID]];
			//_playerArrayVar = (_x select 0)+"_VHLs";
			//_playerArray = profileNameSpace getVariable [_playerArrayVar, []];*/

		private _TerritoriesArray = profileNameSpace getVariable ["WMS_territoriesArray", []];
		if ((count allPlayers) != 0) then {
			saveProfilenameSpace;
			if (WMS_MissionDebug) then {diag_log "[InitServer.sqf]|WAK|TNA|WMS|ProfileNameSpace Saved"};
		};

		{
			_permanentVehiclesCount = _permanentVehiclesCount + (count _x)-1;
		}forEach _permanentVhlArray;

		{
			if (time > (_x select 2))then{
				(objectFromNetID (_x select 0)) setVariable ["_lootSpawned", nil, true];
				clearItemCargoGlobal (objectFromNetID (_x select 1));
				deleteVehicle (objectFromNetID (_x select 1));
				//if (WMS_MissionDebug) then {diag_log format ["[SERVERLOOTSPAWN]|WAK|TNA|WMS| Despawning: %1", _x]};
				WMS_lootHolderList deleteAt (WMS_lootHolderList find _x);
			};
		}ForEach WMS_lootHolderList;

		if (true) then {diag_log format ["[120SEC_SERVER_LOOP]|WAK|TNA|WMS|UPDATE: FPS: %1, Players: %2, OPFOR: %3, CIV: %4, Permanent Vehicles: %5, Territories: %6", (diag_fps), (count allplayers), (EAST countSide allUnits), (CIVILIAN countSide allUnits), _permanentVehiclesCount, (count _TerritoriesArray)];};
		uisleep 120;
    };