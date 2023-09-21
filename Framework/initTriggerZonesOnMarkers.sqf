/**
 * InitTriggerOnMarkers.sqf
 *
 * TNA-Community
 * https://discord.gg/Zs23URtjwF
 * © 2021 {|||TNA|||}WAKeupneo
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
_customMapMarkers 	= getArray(missionConfigFile >> "CfgOfficeTrader" >> "MarkersToCheck");
_markerTraders 		= [(_customMapMarkers select 0)];
_markerSpawns 		= [(_customMapMarkers select 1)];
_markerTerritory 	= [(_customMapMarkers select 2)];

_territoryOfficeData = getArray(missionConfigFile >> "CfgOfficeTrader" >> "territory");
_exclusionZoneSizeTrad 	= (_territoryOfficeData select 2);
_exclusionZoneSizeSpaw 	= (_territoryOfficeData select 3);
//_zoneTerritory 			= (_territoryOfficeData select 6);
_zonesOfficeData = getArray(missionConfigFile >> "CfgOfficeTrader" >> "ZoneSizes");
_tradersZoneSize 	= (_zonesOfficeData select 0);
_spawnZoneSize 		= (_zonesOfficeData select 1);
_territorySize 		= (_zonesOfficeData select 2);
_The1M = false;
_Flist = [];
WMS_createTriggerLocal = { //[_pos, _size, _msgIN, _msgOUT, height]
	private _trg = createTrigger ["EmptyDetector", _this select 0, false];
	_trg setTriggerArea [_this select 1, _this select 1, 0, false,_this select 4];
	_trg setTriggerActivation ["GUER", "PRESENT", true];
	_trg setTriggerStatements ["this && vehicle player in thisList", _this select 2, _this select 3];
	if (false) then {diag_log format ["[SETTINGTRIGGERS] _pos: %1, _size: %2", _this select 0, _this select 1]};
};
WMS_createTrigLocWarnHint = { //because I'm an idiot
	params [
		"_stat"
	];
	diag_log format ["[WMS_createTrigLocWarnHint]_this = %1", _this];
	if (_stat == "IN")then{
		hint parseText "<t color='#ff0000'>DO NOT ENTER THIS AREA, DO NOT USE THIS FACILITY</t>";
		//a slap in the face here would be great
		};
	if (_stat == "OUT")then{
		hint parseText "<t color='#ff0000'>Contact the Base OWNER for more informations</t>";
		};
};
WMS_createTrigLocWarn = { //[_pos, _size, _msgIN, _msgOUT, height]
	params [
		"_pos",
		"_rad",
		["_StatIN",""], //not used yet
		["_StatOUT",""] //not used yet
	];
	diag_log format ["[WMS_createTrigLocWarn]_this = %1", _this];
	//_StatIN = hint parseText "<t color='#ff0000'>DO NOT ENTER THIS AREA, DO NOT USE THIS FACILITY</t>";
	//_StatOUT = hint parseText "<t color='#ff0000'>Contact the Base OWNER for more informations</t>";
	private _trg = createTrigger ["EmptyDetector", _pos, false];
	_trg setTriggerArea [_rad, _rad, 0, false,_rad];
	_trg setTriggerActivation ["GUER", "PRESENT", true];
	_trg setTriggerStatements ["this && vehicle player in thisList", "systemChat 'Good Luck!';['IN']call WMS_createTrigLocWarnHint", "systemChat 'Yeah, I thought so...';['OUT']call WMS_createTrigLocWarnHint"];
	if (false) then {diag_log format ["[SETTINGTRIGGERS] _pos: %1, _size: %2", _this select 0, _rad]};
};

{
	if (markertype _x in _markerTraders) then {
		if (_x != "NotATraderButNeedIt") then { //there is an invisible trader marker at [0,0,0] on lionia (player slots), the marker prevent Ai system to be triggered and will set an ExclusionZone but not a traderZone
			[getMarkerPos _x, _tradersZoneSize, "hint 'TradersZone IN'; player setVariable ['playerInTraderZone', true, true]", "hint 'TradersZone OUT'; player setVariable ['playerInTraderZone', false, true]", _tradersZoneSize] call WMS_createTriggerLocal;
		};
		[getMarkerPos _x, _exclusionZoneSizeTrad, 
			"
				_inOrNot = player getVariable ['playerInRestrictionZone',0];
				player setVariable ['playerInRestrictionZone', (_inOrNot +1), true];
			",
			"
				_inOrNot = player getVariable ['playerInRestrictionZone',0];
				player setVariable ['playerInRestrictionZone', (_inOrNot -1), true];
			"
			,1000
		] call WMS_createTriggerLocal;
		
	};
	if (markertype _x in _markerSpawns) then {
		[getMarkerPos _x, _exclusionZoneSizeSpaw, 
			"
				_inOrNot = player getVariable ['playerInRestrictionZone',0];
				player setVariable ['playerInRestrictionZone', (_inOrNot +1), true];
			",
			"
				_inOrNot = player getVariable ['playerInRestrictionZone',0];
				player setVariable ['playerInRestrictionZone', (_inOrNot -1), true];
			"
			,1000
		] call WMS_createTriggerLocal;
		[getMarkerPos _x, _spawnZoneSize, "hint 'SpawnZone IN'; player setVariable ['playerInSpawnZone', true, true]", "hint 'SpawnZone OUT'; player setVariable ['playerInSpawnZone', false, true]",1000] call WMS_createTriggerLocal;
	};
	if (markertype _x in _markerTerritory) then {
		_flags = (getMarkerPos _x) nearObjects ["rhsgref_serhat_radar", 100];
		if !(count _flags == 0) then {
			_The1M = (_flags select 0) getVariable ['TheOneMillionDollarsBase',false];
			//diag_log format ["[WMS_createTrigger_Territory]'TheOneMillionDollarsBase' = %1, @ %2", _The1M, (position (_flags select 0))];
			if (_The1M) then {
				_Flist = (_flags select 0) getVariable ['WMS_BaseFriends',[]];
				diag_log format ["[WMS_createTrigger_Territory]Friends List = %1", _Flist];
				if !(getPlayerUID player in _Flist)then{
					[getMarkerPos _x, 49.5] call WMS_createTrigLocWarn;
				};
			};
			[getMarkerPos _x, _territorySize, "hint 'You are now in a private territory'; player setVariable ['playerInTerritory', true, true]", "player setVariable ['playerInTerritory', false, true]", _territorySize] call WMS_createTriggerLocal;
		};
	};
}forEach allMapMarkers;