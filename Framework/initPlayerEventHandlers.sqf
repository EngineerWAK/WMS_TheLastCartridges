
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
		if (true) then {diag_log format ["[PLAYERRESPAWN_LOG_FROM_EH]|WAK|TNA|WMS| %1, %2, respawning at %3, %4", name (_this select 0), getPlayerUID (_this select 0), time, getposASL (_this select 0)]};
		[(_this select 0)] spawn {
			waitUntil {alive player};
			player setVariable ["WMS_respawnTime",time];
			[(_this select 0)] remoteExec ["WMS_fnc_setVarOnPlayerRespawn",2];
			(_this select 0) execVM "randomizeSpawnPos.sqf";
			(_this select 0) execVM "spawnLoot.sqf";
			[(_this select 0)] execVM "infantryProgram\infantryProgram.sqf";
			(_this select 0) addrating 100000; //to prevent players to get shot by fucking territory weapon system
			_mkr = createmarkerLocal ["MKR_"+(name player), position player];
			_mkr setMarkerTypeLocal "mil_triangle_noShadow";
			_mkr setMarkerColorLocal "ColorGUER";
			if (true) then {diag_log format ["[PLAYERRESPAWN_LOG_FROM_EH]|WAK|TNA|WMS| %1, %2, IS ALIVE at %3, %4", name (_this select 0), getPlayerUID (_this select 0), time, getposASL (_this select 0)]};
		};
	}
];

player addEventHandler ["GetOutMan", {
		//params ["_unit", "_role", "_vehicle", "_turret"];
		//(_this select 0) setVariable ["PlayerLastVehicle", (_this select 2), true]; //try to use this for wasteDump trader
		if ((_this select 2) getVariable ["WMS_permanentvhl", false] && {(((_this select 2) getVariable ["WMS_buyerowner", 0]) == (getPlayerUID (_this select 0)))}) then {
			[(_this select 2),"getout"] remoteExec ['WMS_fnc_updatePermanentVHL', 2];
		};
	}
];

player addMPEventHandler ["mpkilled", {
		deleteMarkerLocal "MKR_"+(name (_this select 0));
		_actualPlayer = (_this select 0) getVariable ["_spawnedPlayerReadyToFight", true];
		if (_actualPlayer && hasInterface) then {
			if ((getPlayerUID player) in WMS_customRespawnList) then {
				[player] remoteExec ["WMS_fnc_deleteRespawnData",2];
				//[]spawn{};
				private _customRespawnToDelete = missionNamespace getVariable["WMS_client_customRespawnToDelete",[]];
				_customRespawnToDelete call BIS_fnc_removeRespawnPosition;
				if (true) then {diag_log format ["[PLAYERKILLED_LOG_FROM_EH]|WAK|TNA|WMS|Deleting CustomSpawn information _customRespawnToDelete %1", _customRespawnToDelete]};
			};
			if (true) then {diag_log format ["[PLAYERKILLED_LOG_FROM_EH]|WAK|TNA|WMS|Client Side _this: %1, time: %2, _actualPlayer: %3", _this, time, _actualPlayer]};
		};
		if (_actualPlayer && isServer) then {
			if ((_this select 0) getVariable["WMS_saveAndDisconnect",false]) then {
				//do nothing if the player save and disconnect
				if (true) then {diag_log format ["[PLAYERSAVEANDISCONNECT_LOG_FROM_EH]|WAK|TNA|WMS|Server Side _this: %1, time: %2, _actualPlayer: %3", _this, time, _actualPlayer]};
			} else {
				_this call WMS_fnc_playerKilled; //[killed, killer]
				if (true) then {diag_log format ["[PLAYERKILLED_LOG_FROM_EH]|WAK|TNA|WMS|Server Side _this: %1, time: %2, _actualPlayer: %3", _this, time, _actualPlayer]};
			};
		};
	}
];
