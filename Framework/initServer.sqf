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

WMS_lootHolderList = []; //[_house,_lootHolder,(serverTime+_timeToDelete)];
WMS_HeadlessOwnerID = 2;

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

while {true} do
	{
		private _permanentVehiclesCount = 0;
		private _permanentVhlArray = profileNameSpace getVariable ["permanentVhlArray", []];
		private _TerritoriesArray = profileNameSpace GetVariable ["territoriesArray", []];

		saveProfilenameSpace;

		{
			_permanentVehiclesCount = _permanentVehiclesCount + (count _x)-1;
		}forEach _permanentVhlArray;

		if (true) then {diag_log format ["[240SEC_SERVER_LOOP]|WAK|TNA|WMS|UPDATE: FPS: %1, Players: %2, NPC: %3, Permanent Vehicles: %4, Territories: %5", (diag_fps), (count allplayers), (EAST countSide allUnits), _permanentVehiclesCount, (count _TerritoriesArray)];};
		uisleep 240;
    };