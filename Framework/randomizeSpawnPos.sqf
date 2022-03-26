private ["_pos"];
params["_target"];
_pos = position _target;
_hight = 1000;
		//////////CUSTOM SPAWN POSITION FILTER//////////
		_markersToCheck = getArray(missionConfigFile >> "CfgOfficeTrader" >> "MarkersToCheck");
		_markerTraders = [(_markersToCheck select 0)];
		_markerTerritory = [(_markersToCheck select 2)];
		_territoryOfficeData = getArray(missionConfigFile >> "CfgOfficeTrader" >> "territory");
		_zoneTrader = (_territoryOfficeData select 2);
		_zoneTerritory = (_territoryOfficeData select 6);
		_spawnAllowed = true;
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
_target setVariable ["_spawnedPlayerReadyToFight", true, true];
setCurrentChannel 3; //Force Group Channel test