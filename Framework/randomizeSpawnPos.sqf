/**
 * randomizeSpawnPos.sqf
 *
 * TNA-Community
 * https://discord.gg/Zs23URtjwF
 * © 2021 {|||TNA|||}WAKeupneo
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */

private ["_pos","_customRespawnPos","_hight","_spawnAllowed","_customRespawnToDelete"];
params["_target"];
_pos = position _target;
_hight = 1000;
_spawnAllowed = true;
_customRespawnPos = missionNamespace getVariable["WMS_client_customRespawnPos",[-999,-999,-999]];
_customRespawnToDelete = missionNamespace getVariable["WMS_client_customRespawnToDelete",[]];
if (true) then {diag_log format ["[RandomizeSpawnPosition]|WAK|TNA|WMS|Randomazing Position: _customRespawnPos %1, _pos %2, _target %3", _customRespawnPos, _pos, (name _target)]};	

if (missionNamespace getVariable["WMS_client_canCustomRespawn",true] && {((position _target) distance _customRespawnPos) <= 25})then {
	//"CustomRespawn"
	player allowDamage false;
	if(((ASLtoATL _customRespawnPos) select 2) >= 0)then{
		player setPosASL _customRespawnPos;
	};
	[player,WMS_client_customRespawnInv]call WMS_fnc_client_restoreLoadoutFromVar;
	[]spawn {
		diag_log "[WMS_ANTI_ACE_BULSHIT]Launched";
		uisleep 3;
		if (count (missionNamespace getVariable["WMS_client_customRespawnAce",[]]) != 0) then {[player,WMS_client_customRespawnAce]call WMS_fnc_client_restoreAceFromVar;};
		uisleep 1;
		missionNamespace setVariable["WMS_client_customRespawnPos",[-999,-999,-999]];
		missionNamespace setVariable["WMS_client_customRespawnAce",[]];
		missionNamespace setVariable["WMS_client_canCustomRespawn",false];
		if(((player getVariable ['playerInRestrictionZone',-1]) == -1)) then {player setVariable ['playerInRestrictionZone',0]};
		player allowDamage true;
		diag_log "[WMS_ANTI_ACE_BULSHIT]player ready to die again";
	};
}else{
	//"randomiseSpawnPos"
	if ((getPlayerUID player) in WMS_customRespawnList) then {	
		[_target] remoteExec ["WMS_fnc_deleteRespawnData",2];
	};
	//////////CUSTOM SPAWN POSITION FILTER//////////
	_markersToCheck = getArray(missionConfigFile >> "CfgOfficeTrader" >> "MarkersToCheck");
	_markerTraders = [(_markersToCheck select 0)];
	_markerTerritory = [(_markersToCheck select 2)];
	_territoryOfficeData = getArray(missionConfigFile >> "CfgOfficeTrader" >> "territory");
	_zoneTrader = (_territoryOfficeData select 2);
	_zoneTerritory = (_territoryOfficeData select 6);
	/////Is it too close to a marker:
	{
		if (markertype _x in _markerTraders) then {
			if((position _target distance2D (getMarkerPos _x)) <= _zoneTrader)ExitWith{
				_spawnAllowed = false;
				["EventWarning", ["Custom Spawn", "Too Close To Traders"]] call BIS_fnc_showNotification;
			};
		};
		if (markertype _x in _markerTerritory) then {
			if((position _target distance2D (getMarkerPos _x)) <= _zoneTerritory)ExitWith{
				_spawnAllowed = false;
				hint parseText "<t color='#ff0000'>CustomSpawn Too Close To Territory</t>";
				["EventWarning", ["Custom Spawn", "Too Close To Territory"]] call BIS_fnc_showNotification;
			};
		};
	}forEach allMapMarkers;
	//////////////////////////////
	if (_spawnAllowed) then {
		_pos = [[[position _target, 300]],[]] call BIS_fnc_randomPos;
		_hight = 750;
	}else {
		_pos = [position _target, 1500, 2500, 0, 1] call BIS_fnc_findSafePos;
		_hight = 300;
	};
	removeBackpackGlobal _target;
	_target addBackpackGlobal "B_Parachute";
	_target setposATL [(_pos select 0), (_pos select 1), _hight];
};

if ((getPlayerUID player) in WMS_customRespawnList) then {
	if (true) then {diag_log format ["[RandomizeSpawnPosition]|WAK|TNA|WMS|Deleting CustomSpawn information _customRespawnToDelete %1", _customRespawnToDelete]};
	_customRespawnToDelete call BIS_fnc_removeRespawnPosition;
	[player] remoteExec ["WMS_fnc_deleteRespawnData",2];
};
_target setVariable ["_spawnedPlayerReadyToFight", true, true];
setCurrentChannel 3; //Force Group Channel test
_target execVM "InitPlayerSetTrait.sqf";
if (true) then {diag_log format ["[RandomizeSpawnPosition]|WAK|TNA|WMS|player respawned and ready to fight %1", time]};