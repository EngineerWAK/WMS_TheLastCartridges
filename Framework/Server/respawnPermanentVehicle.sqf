/**
 * respawnPermanentVehicle.sqf
 *
 * TNA-Community
 * https://discord.gg/Zs23URtjwF
 * © 2021 {|||TNA|||}WAKeupneo
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */

private ["_permanentVhlArray","_playerArray","_targetUID","_vehicleID","_vehicleClassName","_lastPos","_lastPosAGL","_direction","_damage","_weap","_ammo","_backpack","_item","_veh",
			"_TerritoriesArray","_flagID","_flagPos","_territoryLevel","_ownerUID","_buildingRightUID","_flagDir","_flag","_marker","_noRespawnItems","_forceMedicalFacilities",
			"_openVhl","_clusterVhl","_clusterMags","_tradersMkrs","_vehicleProtect"
		];

//Respawn Territories first:
_TerritoriesArray = profileNameSpace GetVariable ["WMS_territoriesArray", []];
if !(count _TerritoriesArray == 0) then {
	{
		_flagID = (_x select 0);
		_flagPos = (_x select 1);
		_territoryLevel = (_x select 2);
		_ownerUID = (_x select 3);
		_buildingRightUID = (_x select 4);
		_flagDir = (_x select 5);
		_layout = (_x select 6);
		if (_layout != "flagonly") then {
			_objectsToDespawn=["TREE", "SMALL TREE", "BUSH", "BUILDING", "HOUSE", "FOREST BORDER", "FOREST TRIANGLE", "FOREST SQUARE","BUNKER","FOUNTAIN", "FENCE", "WALL", "HIDE", "BUSSTOP", "FOREST", "STACK", "RUIN", "TOURISM", "ROCK", "ROCKS", "RAILWAY"];
			_terrainobjects = nearestTerrainObjects [_flagPos,_objectsToDespawn,40];
			{hideObjectGlobal _x} foreach _terrainobjects;
		};
		_flag = createVehicle ["rhsgref_serhat_radar", _flagPos, [], 1, "NONE"];//rhsgref_serhat_radar
		if (surfaceIsWater _flagPos)then{
			_flag setPosASL [_flagPos select 0, _flagPos select 1, 2.413];
		};
		_flag setDir _flagDir;
		[_flag]call WMS_fnc_initFlagAddActions;
		//_flag setVariable ["ace_rearm_isSupplyVehicle", true, true]; //do not work
		//_flag setVariable ["ACE_isRepairFacility", true, true]; //do not work
		_flag setVariable ["WMS_vehicleid", _flagID, true];
		_flag setVariable ["WMS_buyerowner", _ownerUID, true];
		_flag setVariable ["WMS_BaseFriends", _buildingRightUID, true];
		_flag setVariable ["layout", _layout, true]; //not sure about this one yet
		_flag setVariable ['_layoutUpgradable', true, true];
		_flag setVariable ["canSafetyPerimeter", true];
		//from Exile used in the mission system:
		_flag setvariable ["exileowneruid",_ownerUID, true];
		_flag setvariable ["exileterritoryname",_flagID, true];
		_flag setvariable ["exileterritorybuildrights",_buildingRightUID, true];
		_flag setvariable ["exileterritorylevel",_territoryLevel, true];

		//create invisible marker on the flag for later check:
		_marker = createMarker [_flagID, _flagPos];
		_marker setMarkerType "mil_flag";
		_marker setMarkerAlpha 0; //keep it invisible
		[_flag, _flagPos, _flagDir, _layout] call WMS_fnc_SpawnCamps;
		
		_houses = _flagPos nearObjects ["Building", 150];
		if (WMS_MissionDebug) then {diag_log format ["[TERRITORYZONENOLOOT]|WAK|TNA|WMS| Territory found @ %1, %2 buildings lootspawn deactivated", _flagPos, (count _houses)]};
		{
			_x setVariable ["_lootAllowed",false,true];
		}foreach _houses
	}forEach _TerritoriesArray;
};

//Then respawn vehicles
WMS_permanentVehicleObjects = []; //will be used for the last update off all permanent vehicle before restart
WMS_tradersMkrPos = [];
_permanentVhlArray = profileNameSpace getVariable ["WMS_permanentVhlArray", []];
_playerArray = [];
_vehicleClassName = "";
_noRespawnItems = getArray(missionConfigFile >> "CfgBlackListedItems" >> "items");
_vehiclesManagement = getArray(missionConfigFile >> "CfgOfficeTrader" >> "vehiclesManagement"); //select 0
_forceAmmoFacilities = getArray(missionConfigFile >> "CfgForceAmmoFacilities" >> "vehicles");
_forceRepairFacilities = getArray(missionConfigFile >> "CfgForceRepairFacilities" >> "vehicles");
_forceMedicalFacilities = getArray(missionConfigFile >> "CfgForceMedicalFacilities" >> "vehicles");
_clusterVhl = getArray(missionConfigFile >> "CfgPylonVhl" >> "vhl");
_clusterMags = getArray(missionConfigFile >> "CfgBlackListedBomb" >> "mags");
_tradersMkrs = getArray(missionConfigFile>>"CfgOfficeTrader">>"MarkersToCheck");
_howmanyrestarts = 0;
_vehicleProtect = true; //toggle simulation/allowdamage if traderzone or not
_openVhl = getArray(missionConfigFile>>"CfgOpenVhl">>"vhl");
_territoryOfficeData = getArray(missionConfigFile >> "CfgOfficeTrader" >> "ZoneSizes");
{
	if (markertype _x == (_tradersMkrs select 0)) then {
		WMS_tradersMkrPos pushBack (getMarkerPos _x);
	};
}forEach allMapMarkers;
publicVariable "WMS_tradersMkrPos";
{
	_playerArray = _x;
	_targetUID = 0;
	{ 
		if ((count _x) == 17) then { //playerUID is a 17 digit number, the vehicles array are 6
			_targetUID = _x;
		} else {
			//_vehiclesArray pushBack _x; //as test
			//here goes the spawn and init of the vehicle
			_vehicleID = _x select 0;
			_vehicleClassName = _x select 1;
			_lastPos = _x select 2; //need to change this to _x select 2 (array in the array at vehicle first creation)
			_lastPosAGL = (ASLtoAGL (_x select 2));
			//if (_lastPos select 2 < 0.25 || _lastPos select 2 > 50) then {_lastPos set [2,0.25]}; //this to prevent vehicles stuck in the sky or under the ground
			_direction = _x select 3;
			_damage = _x select 4;
			_fuel = _x select 5;
			_friends = _x select 6;
			//_vehicleID_inventory = _x select 7;
			_howmanyrestarts = _x select 8; //need to be converted before
			_vehicleID_inventory = _vehicleID + "_inventory";
			//if (typeName (_x select 7) == "SCALAR") then {_x set [7, _vehicleID_inventory]}; //convert the Old inventory system to the new one
			_vehicleInventory = profileNameSpace getVariable [_vehicleID_inventory, [[],[],[],[]]];
			//NEW System
			_weap = _vehicleInventory select 0;
			_ammo = _vehicleInventory select 1;
			_backpack = _vehicleInventory select 2;
			_item = _vehicleInventory select 3;
			//NEW System END
			_veh = createVehicle [_vehicleClassName, [0,0,6000], [], 0, "CAN_COLLIDE"];
			WMS_permanentVehicleObjects pushBack _veh;
			_veh allowDamage false;
			_veh setDir _direction;
			//_veh setpos _lastPos;
			if ((_lastPosAGL select 2) < -0.2 || (_lastPos select 2) > 1000) then {
					_lastPosAGL set [2,0.25];
					_veh setpos _lastPosAGL;
				}else{
					_veh setposASL _lastPos; //WARNING!!! MOVING TO ASL POSITION
				}; //this to prevent vehicles stuck in the sky or under the ground
			
			//_veh setDamage _damage;
			_veh setVariable ["WMS_startDamage", _damage, true];
			_veh setfuel _fuel;
			_veh setVariable ["WMS_buyerowner", _targetUID, true];
			_veh setVariable ["WMS_friends", _friends, true];
			_veh setVariable ["WMS_vehicleid", _vehicleID, true];
			_veh setVariable ["WMS_howmanyrestarts", _howmanyrestarts, true];
			_vehicleID_inventory = _vehicleID + "_inventory";
			_veh setVariable ["WMS_vehicleID_inventory", _vehicleID_inventory, true];
			_veh setVariable ["WMS_permanentvhl", true, true];
			if (_veh isKindOf "tank"||_veh isKindOf "Wheeled_Apc_F") then {_veh setVariable ["ace_cookoff_enable", true, true];};
			_veh addMPEventHandler ["MPkilled", {
				if (isDedicated) then {
					//[(_this select 0),"destroyed"] remoteExec ['WMS_fnc_updatePermanentVHL', 2]; //remoteExec doesnt make sens
					[(_this select 0),"destroyed"] call WMS_fnc_updatePermanentVHL; //remoteExec doesnt make sens
					//[(format ["a permanent vehicle (%1) has been destroyed by %2, instigator %3", (_this select 0), (_this select 1), (_this select 2)]),"VEHICLEDESTROYED_log"]call A3log;
					if (true) then {
						diag_log "|WAK|TNA|WMS|";
						diag_log "|WAK|TNA|WMS|";
						diag_log format ["a permanent vehicle (%1) has been destroyed by %2, instigator %3", (_this select 0), (_this select 1), (_this select 2)];
						diag_log "|WAK|TNA|WMS|";
						diag_log "|WAK|TNA|WMS|";
						};
				};
				}
			];//params ["_unit", "_killer", "_instigator", "_useEffects"];

			clearMagazineCargoGlobal _veh; 
			clearWeaponCargoGlobal _veh; 
			clearItemCargoGlobal _veh; 
			clearBackpackCargoGlobal _veh;

			{
				if !(_x in _noRespawnItems) then {
					_veh addWeaponCargoGlobal [_x, 1];
				};
			}foreach _weap;
			{
				if !(_x in _noRespawnItems) then {
					_veh addMagazineCargoGlobal [_x, 1];
				};
			}foreach _ammo;
			{
				if !(_x in _noRespawnItems) then {
					_veh addBackpackCargoGlobal [_x, 1];
				};
			}foreach _backpack;
			{
				if !(_x in _noRespawnItems) then {
					_veh addItemCargoGlobal [_x, 1];
				};
			}foreach _item;

			[_veh,0, true]call WMS_fnc_initVehicleAddAction;

			if (typeOf _veh in _openVhl) then {
				if (WMS_MissionDebug) then {diag_log format ["|WAK|TNA|WMS|RespawnPermanentVehicle %1 is blacklisted, %2, checking for trader zone", _veh, typeOf _veh];};
				_nearestTrader = [WMS_tradersMkrPos, _veh] call BIS_fnc_nearestPosition;
				if ((_nearestTrader distance2D _veh) > ((_territoryOfficeData select 0)+(_territoryOfficeData select 3))) then {
					if (WMS_MissionDebug) then {diag_log format ["|WAK|TNA|WMS|RespawnPermanentVehicle %1 is blacklisted, closest Trader %2m away, vehicle is protected", _veh,(_nearestTrader distance2D _veh)];};
					_veh setVehicleLock "LOCKED";
					_veh lockInventory true;
					[_veh, true] remoteExec ["lockInventory", 0, true];
				}else {
					if (WMS_MissionDebug) then {diag_log format ["|WAK|TNA|WMS|RespawnPermanentVehicle %1 is blacklisted, closest Trader %2m away, vehicle UNLOCKED", _veh,(_nearestTrader distance2D _veh)];};
					_vehicleProtect = false;
				};
			}else{ 
				if (WMS_MissionDebug) then {diag_log format ["|WAK|TNA|WMS|RespawnPermanentVehicle %1 NOT blacklisted, %2", _veh, typeOf _veh];};
				_veh setVehicleLock "LOCKED";
				_veh lockInventory true; //that fucking lock "localy" on the server, not client side
				[_veh, true] remoteExec ["lockInventory", 0, true]; //should execute the lock localy on every players connecting after the vehicle creation //YES!
			};
			
			if ((typeOf _veh) in _forceAmmoFacilities) then {
				if (WMS_MissionDebug) then {diag_log format ["|WAK|TNA|WMS| Creating %1 as Ammo Facility", _veh];};
				_veh setVariable ["ace_rearm_isSupplyVehicle", true, true];
			};

			if ((typeOf _veh) in _forceRepairFacilities) then {
				if (WMS_MissionDebug) then {diag_log format ["|WAK|TNA|WMS| Creating %1 as Repair Facility", _veh];};
				_veh setVariable ["ACE_isRepairVehicle", true, true];
			};
			//Force Medical Facility
			if ((typeOf _veh) in _forceMedicalFacilities) then {
				if (WMS_MissionDebug) then {diag_log format ["|WAK|TNA|WMS| Respawning %1 as Medical Facility", _veh];};
				_veh setVariable ["ace_medical_isMedicalFacility", true, true];
				_veh setVariable ["WMS_resetFatigueTimer", time, true];
				//[player, nil] call ace_advanced_fatigue_fnc_handlePlayerChanged; //addAction "Reset Fatigue" for owner;
				[ //params ["_target", "_caller", "_actionId", "_arguments"];
					_veh,
					[
						"<t size='1' color='#528ffa'>Reset ACE Fatigue</t>",
						"
						[(_this select 1), objNull] call ace_advanced_fatigue_fnc_handlePlayerChanged;
						(_this select 0) setVariable ['WMS_resetFatigueTimer', time, true];
						",
						[], //argument accessible in the script (_this select 3)
						1,
						true,
						true,
						"",
						//"((getplayerUID _this) == (_target getVariable ['WMS_BuyerOwner', 0]) && (vehicle _this == _this))",
						"('ACE_personalAidKit' in (items _this)) &&
						{(getplayerUID _this) == (_target getVariable ['WMS_BuyerOwner', 0])} &&
						{(time >= (1800 + (_target getVariable ['WMS_resetFatigueTimer', time])))} && 
						{(vehicle _this == _this)}",
						5
					]
				] remoteExec [
					"addAction",
					0, //0 for all players //2 server only //-2 everyone but the server
					true //JIP
				];
			};
			if (_vehicleClassName in _clusterVhl) then {	
				_veh setVariable ["ace_pylons_magazineBlacklist", _clusterMags];
			};
			if (WMS_MissionDebug) then {diag_log format ["|WAK|TNA|WMS| permanent vehicle (%1), %2/%3 restarts", _vehicleID, _howmanyrestarts,(_vehiclesManagement select 0)];};
			if (_howmanyrestarts >= (_vehiclesManagement select 0)) then {
				if (true) then {diag_log format ["|WAK|TNA|WMS| permanent vehicle (%1) too old %2 restarts, looking for a territory around", _vehicleID, _howmanyrestarts];};
				if ((count (nearestObjects [_veh, ["rhsgref_serhat_radar"], 100])) == 0) then {
				if (true) then {diag_log format ["|WAK|TNA|WMS| permanent vehicle (%1) too old, no territory around", _vehicleID];};
					_veh allowDamage true;
					_veh setDamage 1;
				};
			}else{
				//////////CUSTOM VEHICLES//////////
				[_veh] call WMS_fnc_vehicleCustomize;
				//////////CUSTOM VEHICLES END//////////
			};//destruction of the vehicle will start the cleaning process
			//if (_veh isKindOf "UGV_01_base_F"||_veh isKindOf "UAV") then {createVehicleCrew _veh};
			if (_vehicleProtect) then {
				_veh enableSimulationGlobal false;
			}else {
				_veh allowDamage true;
				if !(_damage == 999) then {
					_veh setDamage _damage;
					_veh setVariable ['WMS_startDamage', 999, true]; //prevent reset damage at every lock/unlock
				};
			};
		};
	}forEach _playerArray; 
}forEach _permanentVhlArray; //Each array is a playerUID array with vehicle(s) array(s) inside

/*
//Then respawn player Stash
WMS_StashObjects = []; //will be used for the last update off all permanent vehicle before restart
_stashArray = profileNameSpace getVariable ["WMS_stashArray", []];
_stashplayerArray = [];
_stashClassName = "";
//_noRespawnItems = getArray(missionConfigFile >> "CfgBlackListedItems" >> "items");
//_vehiclesManagement = getArray(missionConfigFile >> "CfgOfficeTrader" >> "vehiclesManagement"); //select 0
_howmanyrestarts = 0;
{
	_stashplayerArray = _x;
	_targetUID = 0;
	{ 
		if ((count _x) == 17) then { //playerUID is a 17 digit number, the vehicles array are 6
			_targetUID = _x;
		} else {
			//_vehiclesArray pushBack _x; //as test
			//here goes the spawn and init of the vehicle
			_vehicleID = _x select 0;
			_vehicleClassName = _x select 1;
			_lastPos = _x select 2; //need to change this to _x select 2 (array in the array at vehicle first creation)
			if (_lastPos select 2 < 0.25 || _lastPos select 2 > 50) then {_lastPos set [2,0.25]};
			_direction = _x select 3;
			_damage = _x select 4;
			_fuel = _x select 5;
			_friends = _x select 6;
			//_vehicleID_inventory = _x select 7;
			_howmanyrestarts = _x select 8; //need to be converted before
			_vehicleID_inventory = _vehicleID + "_inventory";
			//if (typeName (_x select 7) == "SCALAR") then {_x set [7, _vehicleID_inventory]}; //convert the Old inventory system to the new one
			_vehicleInventory = profileNameSpace getVariable [_vehicleID_inventory, [[],[],[],[]]];
			//NEW System
			_weap = _vehicleInventory select 0;
			_ammo = _vehicleInventory select 1;
			_backpack = _vehicleInventory select 2;
			_item = _vehicleInventory select 3;
			//NEW System END
			_veh = createVehicle [_vehicleClassName, [0,0,6000], [], 0, "CAN_COLLIDE"];
			WMS_permanentVehicleObjects pushBack _veh;
			_veh allowDamage false;
			_veh setDir _direction;
			_veh setpos _lastPos;
			//_veh setDamage _damage;
			_veh setVariable ["WMS_startDamage", _damage, true];
			_veh setfuel _fuel;
			_veh setVariable ["WMS_buyerowner", _targetUID, true];
			_veh setVariable ["WMS_friends", _friends, true];
			_veh setVariable ["WMS_vehicleid", _vehicleID, true];
			_veh setVariable ["WMS_howmanyrestarts", _howmanyrestarts, true];
			_vehicleID_inventory = _vehicleID + "_inventory";
			_veh setVariable ["WMS_vehicleID_inventory", _vehicleID_inventory, true];
			_veh setVariable ["WMS_permanentvhl", true, true];
			_veh addMPEventHandler ["MPkilled", {
					[(_this select 0),"destroyed"] remoteExec ['WMS_fnc_updatePermanentVHL', 2];
					//[(format ["a permanent vehicle (%1) has been destroyed by %2, instigator %3", (_this select 0), (_this select 1), (_this select 2)]),"VEHICLEDESTROYED_log"]call A3log;
					if (WMS_MissionDebug) then {
						diag_log "|WAK|TNA|WMS|";
						diag_log "|WAK|TNA|WMS|";
						diag_log format ["a permanent vehicle (%1) has been destroyed by %2, instigator %3", (_this select 0), (_this select 1), (_this select 2)];
						diag_log "|WAK|TNA|WMS|";
						diag_log "|WAK|TNA|WMS|";
						};
				}
			];//params ["_unit", "_killer", "_instigator", "_useEffects"];

			clearMagazineCargoGlobal _veh; 
			clearWeaponCargoGlobal _veh; 
			clearItemCargoGlobal _veh; 
			clearBackpackCargoGlobal _veh;

			{
				if !(_x in _noRespawnItems) then {
					_veh addWeaponCargoGlobal [_x, 1];
				};
			}foreach _weap;
			{
				if !(_x in _noRespawnItems) then {
					_veh addMagazineCargoGlobal [_x, 1];
				};
			}foreach _ammo;
			{
				if !(_x in _noRespawnItems) then {
					_veh addBackpackCargoGlobal [_x, 1];
				};
			}foreach _backpack;
			{
				if !(_x in _noRespawnItems) then {
					_veh addItemCargoGlobal [_x, 1];
				};
			}foreach _item;

			[_veh,0, true]call WMS_fnc_initVehicleAddAction;

			_veh setVehicleLock "LOCKED";
			_veh lockInventory true; //that fucking lock "localy" on the server, not client side
			[_veh, true] remoteExec ["lockInventory", 0, true]; //should execute the lock localy on every players connecting after the vehicle creation //YES!
			//_veh allowDamage true; //at the unlock so the vehicle is protected from the retarded AI shooting at empty vehicles
			
			_forceAmmoFacilities = getArray(missionConfigFile >> "CfgForceAmmoFacilities" >> "vehicles");
			if ((typeOf _veh) in _forceAmmoFacilities) then {
				if (WMS_MissionDebug) then {diag_log format ["|WAK|TNA|WMS| Creating %1 as Ammo Facility", _veh];};
				_veh setVariable ["ace_rearm_isSupplyVehicle", true, true];
			};

			_forceRepairFacilities = getArray(missionConfigFile >> "CfgForceRepairFacilities" >> "vehicles");
			if ((typeOf _veh) in _forceRepairFacilities) then {
				if (WMS_MissionDebug) then {diag_log format ["|WAK|TNA|WMS| Creating %1 as Repair Facility", _veh];};
				_veh setVariable ["ACE_isRepairVehicle", true, true];
			};
			//Force Medical Facility
			_forceMedicalFacilities = getArray(missionConfigFile >> "CfgForceMedicalFacilities" >> "vehicles");
			if ((typeOf _veh) in _forceMedicalFacilities) then {
				if (WMS_MissionDebug) then {diag_log format ["|WAK|TNA|WMS| Respawning %1 as Medical Facility", _veh];};
				_veh setVariable ["ace_medical_isMedicalFacility", true, true];
				_veh setVariable ["WMS_resetFatigueTimer", time, true];
				//[player, nil] call ace_advanced_fatigue_fnc_handlePlayerChanged; //addAction "Reset Fatigue" for owner;
				[ //params ["_target", "_caller", "_actionId", "_arguments"];
					_veh,
					[
						"<t size='1' color='#528ffa'>Reset ACE Fatigue</t>",
						"
						[(_this select 1), (_this select 1)] call ace_advanced_fatigue_fnc_handlePlayerChanged;
						(_this select 0) setVariable ['WMS_resetFatigueTimer', time, true];
						",
						[], //argument accessible in the script (_this select 3)
						1,
						true,
						true,
						"",
						//"((getplayerUID _this) == (_target getVariable ['WMS_BuyerOwner', 0]) && (vehicle _this == _this))",
						"('ACE_personalAidKit' in (items _this)) &&
						{(time >= (3600 + (_target getVariable ['WMS_resetFatigueTimer', time])))} && 
						{(vehicle _this == _this)}",
						5
					]
				] remoteExec [
					"addAction",
					0, //0 for all players //2 server only //-2 everyone but the server
					true //JIP
				];
			};
			if (WMS_MissionDebug) then {diag_log format ["|WAK|TNA|WMS| permanent vehicle (%1), %2/%3 restarts", _vehicleID, _howmanyrestarts,(_vehiclesManagement select 0)];};
			if (_howmanyrestarts >= (_vehiclesManagement select 0)) then {
				if (WMS_MissionDebug) then {diag_log format ["|WAK|TNA|WMS| permanent vehicle (%1) too old %2 restarts, looking for a territory around", _vehicleID, _howmanyrestarts];};
				if ((count (nearestObjects [_veh, ["rhsgref_serhat_radar"], 100])) == 0) then {
				if (WMS_MissionDebug) then {diag_log format ["|WAK|TNA|WMS| permanent vehicle (%1) too old, no territory around", _vehicleID];};
					_veh allowDamage true;
					_veh setDamage 1;
				};
			}else{
				//////////CUSTOM VEHICLES//////////
				[_veh] call WMS_fnc_vehicleCustomize;
				//////////CUSTOM VEHICLES END//////////
			};//destruction of the vehicle will start the cleaning process
			//if (_veh isKindOf "UGV_01_base_F"||_veh isKindOf "UAV") then {createVehicleCrew _veh};
		};
	}forEach _stashplayerArray; 
}forEach _permanentVhlArray; //Each array is a playerUID array with vehicle(s) array(s) inside
*/