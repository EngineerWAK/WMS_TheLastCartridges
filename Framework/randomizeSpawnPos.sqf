private ["_pos","_customRespawnPos","_hight","_spawnAllowed"];
params["_target"];
_pos = position _target;
_hight = 1000;
_spawnAllowed = true;
_customRespawnPos = missionNamespace getVariable["WMS_client_customRespawnPos",[-999,-999,-999]];	

if (missionNamespace getVariable["WMS_client_canCustomRespawn",true] && {((position _target) distance _customRespawnPos) <= 25})then {
	removeAllItems _target;
	{_target unassignItem _x; _target removeItem _x}forEach (assignedItems _target);
	removeBackpackGlobal _target;
	removeAllWeapons _target;
	removeVest _target;
	removeUniform _target;
	//[_target, [missionNamespace, "WMS_client_customRespawnInv"]] call BIS_fnc_loadInventory;
	[player,WMS_client_customRespawnInv]call WMS_fnc_client_restoreLoadoutFromVar;
	missionNamespace setVariable["WMS_client_customRespawnPos",[-999,-999,-999]];
	missionNamespace setVariable["WMS_client_canCustomRespawn",false];
	[_target] remoteExec ["WMS_fnc_deleteRespawnData",2];
	private _customRespawnToDelete = missionNamespace getVariable["WMS_client_customRespawnToDelete",[]];
	_customRespawnToDelete call BIS_fnc_removeRespawnPosition;
}else{
	//"randomiseSpawnPos"
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
				//hint parseText "<t color='#ff0000'>CustomSpawn Too Close To Traders</t>";
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

_target setVariable ["_spawnedPlayerReadyToFight", true, true];
setCurrentChannel 3; //Force Group Channel test