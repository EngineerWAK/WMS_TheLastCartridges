private ["_BuildingList","_lootToSpawn","_lootToSpawnList","_timeToDelete","_weight","_lootHolder","_SpawnLootLifeTime"];

//params["_BuildingList"]; //[[_house,_lootPos,_lootType],[_house,_lootPos,_lootType]
_BuildingList = _this;

if (WMS_MissionDebug) then {diag_log format ["[SERVERLOOTSPAWN]|WAK|TNA|WMS| _BuildingList: %1", _BuildingList]};

_timeToDelete = 180;
_lootToSpawn = objNull;
_lootHolder = objNull;
_weight = getArray(missionConfigFile >> "CfgLootToSpawnWeight" >> "Default" >> "weight");
_SpawnLootLifeTime = getNumber(missionConfigFile >> "CfgLootSettings" >> "LootlifeTime");

if !(count _BuildingList == 0) then {
{
	if ((_x select 2) == "special") then {
		_weight = getArray(missionConfigFile >> "CfgLootToSpawnWeight" >> "Special" >> "weight");
		};
	if ((_x select 2) == "military") then {
		_weight = getArray(missionConfigFile >> "CfgLootToSpawnWeight" >> "Military" >> "weight");
		};
	if ((_x select 2) == "medical") then {
		_weight = getArray(missionConfigFile >> "CfgLootToSpawnWeight" >> "Medical" >> "weight");
		};
	if ((_x select 2) == "industrial") then {
		_weight = getArray(missionConfigFile >> "CfgLootToSpawnWeight" >> "Industrial" >> "weight");
		};
	_lootToSpawn = selectRandom (WMS_lootToSpawnList selectRandomWeighted _weight);
	_lootHolder = createVehicle ["WeaponHolderSimulated_scripted", [(_x select 1 select 0),(_x select 1 select 1),((_x select 1 select 2)+0.50)], [], 0, "CAN_COLLIDE"];
	WMS_lootHolderList pushback [(_x select 0),_lootHolder,(time+_timeToDelete)];
	if (
		_lootToSpawn in (getArray(missionConfigFile >> "CfgLootToSpawnCategories" >> "weapons" >> "items"))|| 
		_lootToSpawn in (getArray(missionConfigFile >> "CfgLootToSpawnCategories" >> "weapons_SPE" >> "items"))|| 
		_lootToSpawn in (getArray(missionConfigFile >> "CfgLootToSpawnCategories" >> "weapons_MIL" >> "items"))
		) then {
		_lootHolder addMagazineCargoGlobal [((getArray (configfile >> "CfgWeapons" >> _lootToSpawn >> "magazines")) select 0),3];
		_lootHolder addWeaponCargoGlobal [_lootToSpawn,1];
	} else {
		if (
			_lootToSpawn in (getArray(missionConfigFile >> "CfgLootToSpawnCategories" >> "backpacks" >> "items"))||
			_lootToSpawn in (getArray(missionConfigFile >> "CfgLootToSpawnCategories" >> "backpacks_SPE" >> "items"))||
			_lootToSpawn in (getArray(missionConfigFile >> "CfgLootToSpawnCategories" >> "backpacks_MIL" >> "items"))
			) then {
			_lootHolder addBackpackCargoGlobal [_lootToSpawn,1];
		} else {
			_lootHolder addItemCargoGlobal [_lootToSpawn,1];
		};
	};
	(_x select 0) setVariable ["_lootSpawned", 1, true];
    (_x select 0) setVariable ["_lootTimer",(time+_SpawnLootLifeTime), true];
	//if (WMS_MissionDebug) then {diag_log format ["[SERVERLOOTSPAWN]|WAK|TNA|WMS| %3 | _house,_lootPos,servertime: %1, WMS_lootHolderList count : %2", _x, (count WMS_lootHolderList), time]};
}forEach _buildingList;
};


//this should be in a loop and not each time the function is called by the client
//however, now the client is calling only if he moved far enough and if new loot position
{
	if (time > (_x select 2))then{
		(_x select 0) setVariable ["_lootSpawned", nil, true];
		clearItemCargoGlobal(_x select 1);
		deleteVehicle (_x select 1);
		//if (WMS_MissionDebug) then {diag_log format ["[SERVERLOOTSPAWN]|WAK|TNA|WMS| Despawning: %1", _x]};
		WMS_lootHolderList deleteAt (WMS_lootHolderList find _x);
	};
}ForEach WMS_lootHolderList;