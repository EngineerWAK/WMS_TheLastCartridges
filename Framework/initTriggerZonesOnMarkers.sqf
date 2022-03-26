
_customMapMarkers 	= getArray(missionConfigFile >> "CfgOfficeTrader" >> "MarkersToCheck");
_markerTraders 		= [(_customMapMarkers select 0)];
_markerSpawns 		= [(_customMapMarkers select 1)];
_markerTerritory 	= [(_customMapMarkers select 2)];

_tradersZoneSize 	= 80;
_exclusionZoneSize 	= 750;
_spawnZoneSize 		= 300;
_territorySize 		= 100;

PEM_createTriggerLocal = { //[_pos, _size, _msgIN, _msgOUT]
		private _trg = createTrigger ["EmptyDetector", _this select 0, false];
		_trg setTriggerArea [_this select 1, _this select 1, 0, false];
		_trg setTriggerActivation ["GUER", "PRESENT", true];
		_trg setTriggerStatements ["this && vehicle player in thisList", _this select 2, _this select 3];
		if (false) then {diag_log format ["[SETTINGTRIGGERS] _pos: %1, _size: %2", _this select 0, _this select 1]};
	};

{
	if (markertype _x in _markerTraders) then {
		if (_x != "NotATraderButNeedIt") then { //there is an invisible trader marker at [0,0,0] on lionia (player slots), the marker prevent Ai system to be triggered and will set an ExclusionZone but not a traderZone
			[getMarkerPos _x, _tradersZoneSize, "hint 'TradersZone IN'; player setVariable ['playerInTraderZone', true, true]", "hint 'TradersZone OUT'; player setVariable ['playerInTraderZone', false, true]"] call PEM_createTriggerLocal;
		};
		[getMarkerPos _x, _exclusionZoneSize, 
			"
				_inOrNot = player getVariable ['playerInRestrictionZone',0];
				player setVariable ['playerInRestrictionZone', (_inOrNot +1), true];
			",
			"
				_inOrNot = player getVariable ['playerInRestrictionZone',0];
				player setVariable ['playerInRestrictionZone', (_inOrNot -1), true];
			"
		] call PEM_createTriggerLocal;
		
	};
	if (markertype _x in _markerSpawns) then {
		[getMarkerPos _x, _exclusionZoneSize, 
			"
				_inOrNot = player getVariable ['playerInRestrictionZone',0];
				player setVariable ['playerInRestrictionZone', (_inOrNot +1), true];
			",
			"
				_inOrNot = player getVariable ['playerInRestrictionZone',0];
				player setVariable ['playerInRestrictionZone', (_inOrNot -1), true];
			"
		] call PEM_createTriggerLocal;
		[getMarkerPos _x, _spawnZoneSize, "hint 'SpawnZone IN'; player setVariable ['playerInSpawnZone', true, true]", "hint 'SpawnZone OUT'; player setVariable ['playerInSpawnZone', false, true]"] call PEM_createTriggerLocal;
	};
	if (markertype _x in _markerTerritory) then {
		[getMarkerPos _x, _territorySize, "hint 'You are now in a private territory'; player setVariable ['playerInTerritory', true, true]", "player setVariable ['playerInTerritory', false, true]"] call PEM_createTriggerLocal;
		
	};
}forEach allMapMarkers;