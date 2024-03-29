
/**
 * WMS_fnc_initPlayerEventHandlers
 *
 * TNA-Community
 * https://discord.gg/Zs23URtjwF
 * © 2021 {|||TNA|||}WAKeupneo
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
player addEventHandler ["Respawn",
	{
		if (true) then {diag_log format ["[PLAYERRESPAWN_LOG_FROM_EH]|WAK|TNA|WMS| %1, %2, respawning at %3, %4 ASL", name (_this select 0), getPlayerUID (_this select 0), time, getposASL (_this select 0)]};
		[(_this select 0)] spawn {
			waitUntil {alive player};
			(_this select 0) execVM "randomizeSpawnPos.sqf";
			[(_this select 0)] remoteExec ["WMS_fnc_setVarOnPlayerRespawn",2];
			player setVariable ["WMS_respawnTime",time];
			(_this select 0) execVM "spawnLoot.sqf";
			[(_this select 0)] execVM "infantryProgram\infantryProgram.sqf";
			(_this select 0) addrating 100000; //to prevent players to get shot by fucking territory weapon system
			//_mkr = createmarkerLocal ["MKR_"+(name player), position player];
			_mkr = createmarkerLocal ["MKR_"+(name player), [-1000,-1000,0]];
			_mkr setMarkerTypeLocal "mil_triangle_noShadow";
			_mkr setMarkerColorLocal "ColorGUER";
			_mkr setMarkerDirLocal 0;
   			inGameUISetEventHandler ["Action", "  
   			if (
				((_this select 3) == 'Land') || 
				((_this select 4) == 'Landing autopilot')  ||
				((_this select 4) == ' Switch to moving mode') ||
				((_this select 4) == 'Automatic Engine Startup')
				)
				then 
   			{ 
      			hint 'SORRY, This Action Is not permited';
       			true 
   			};
   			"];// "" and not {}; //Error Type code, expected String
			if (true) then {diag_log format ["[PLAYERRESPAWN_LOG_FROM_EH]|WAK|TNA|WMS| %1, %2, IS ALIVE at %3, %4 ASL", name (_this select 0), getPlayerUID (_this select 0), time, getposASL (_this select 0)]};
		};
	}
];

player addEventHandler ["HandleDamage", { 
		params ["_unit", "_selection", "_damage", "_source", "_projectile", "_hitIndex", "_instigator", "_hitPoint"];
		if (alive _unit) then {
			if !(isServer||isdedicated) then {
				Diag_log format ["|WAK|TNA|WMS|Player eventHandler HandleDamage, _this = %1",_this];
				if (_damage >= 2.5 && {_projectile != ""} && {(_selection == "head") || (_selection == "face_hub")}) then {
					playSound3D [getMissionPath 'Custom\Ogg\HelmetShot.ogg', _unit, false, position _unit, 1, (0.6+random 1)];
					[playerSide, 'PAPA_BEAR'] commandChat format ["%1 got shot strait in the face! With %2", name _unit, _projectile];
				};
			};
		};
	}
];

player addEventHandler ["GetOutMan", {
		params ["_unit", "_role", "_vehicle", "_turret"];
		if (_vehicle getVariable ["WMS_permanentvhl", false] && {damage _vehicle != 1} && {((_vehicle getVariable ["WMS_buyerowner", 0]) == (getPlayerUID _unit))}) then {
			[_vehicle,"getout"] remoteExec ['WMS_fnc_updatePermanentVHL', 2];
		};
	}
];
player addMPEventHandler ["mpkilled", {
		params ["_unit", "_killer", "_instigator", "_useEffects"];
		deleteMarkerLocal "MKR_"+(name _unit);
		_actualPlayer = _unit getVariable ["_spawnedPlayerReadyToFight", true];
		if (_actualPlayer && hasInterface) then {
			//First, reset the "specialist" traits, for "after restart", no more permanent doctors or advanced engineers
			_unit setVariable ["WMS_Specialist_Bambi",false,true];
			_unit setVariable ["WMS_Specialist_Breacher",false,true];
			_unit setVariable ["WMS_Specialist_Engineer",false,true];
			_unit setVariable ["WMS_Specialist_Sniper",false,true];
			_unit setVariable ["WMS_Specialist_Medic",false,true];
			_unit setVariable ["ace_IsEngineer",0,true];
			_unit setVariable ["ace_medical_medicclass", 0, true];
			_unit setUnitTrait ["UAVHacker",false];
			_unit setUnitTrait ["explosiveSpecialist",false];
			_unit setUnitTrait ["Medic",false];
			_unit setUnitTrait ["Engineer",false];
			if (WMS_MissionDebug) then {diag_log format ["[InitPlayerEventHandlers.sqf|MPkilled]|WAK|TNA|WMS|THIS IS A DEBUG FOR BROKEN PLAYERS TRAITS: %1, RESETTING SKILLS", name _unit]};
			if ((getPlayerUID _unit) in WMS_customRespawnList) then {
				[_unit] remoteExec ["WMS_fnc_deleteRespawnData",2];
				//[]spawn{};
				private _customRespawnToDelete = missionNamespace getVariable["WMS_client_customRespawnToDelete",[]];
				_customRespawnToDelete call BIS_fnc_removeRespawnPosition;
				if (WMS_MissionDebug) then {diag_log format ["[PLAYERKILLED_LOG_FROM_EH]|WAK|TNA|WMS|Deleting CustomSpawn information _customRespawnToDelete %1", _customRespawnToDelete]};
			};
			if (WMS_MissionDebug) then {diag_log format ["[PLAYERKILLED_LOG_FROM_EH]|WAK|TNA|WMS|Client Side _this: %1, time: %2, _actualPlayer: %3", _this, time, _actualPlayer]};
		};
		if (_actualPlayer && isServer) then {
			if ((_this select 0) getVariable["WMS_saveAndDisconnect",false]) then {
				//do nothing if the player save and disconnect
				if (WMS_MissionDebug) then {diag_log format ["[PLAYERSAVEANDISCONNECT_LOG_FROM_EH]|WAK|TNA|WMS|Server Side _this: %1, time: %2, _actualPlayer: %3", _this, time, _actualPlayer]};
			} else {
				_this call WMS_fnc_playerKilled; //[killed, killer]
				if (WMS_MissionDebug) then {diag_log format ["[PLAYERKILLED_LOG_FROM_EH]|WAK|TNA|WMS|Server Side _this: %1, time: %2, _actualPlayer: %3", _this, time, _actualPlayer]};
			};
		};
	}
];
