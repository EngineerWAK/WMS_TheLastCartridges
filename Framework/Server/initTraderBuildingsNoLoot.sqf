
private _customMapMarkers = getArray(missionConfigFile >> "CfgOfficeTrader" >> "MarkersToCheck");
private _markerTraders = [(_customMapMarkers select 0)];
private _markerTerritory = [(_customMapMarkers select 2)];
//_markerTraders = ["select"];
private _NoLootSpawnDistance = 250;
private _houses = [];
{
	if (false) then {diag_log format ["[TRADERZONENOLOOT]|WAK|TNA|WMS| Checking Trader Markers %1", (markertype _x)]};
	if (markertype _x in _markerTraders) then {
		_houses = (getMarkerPos _x) nearObjects ["Building", _NoLootSpawnDistance];
		if (false) then {diag_log format ["[TRADERZONENOLOOT]|WAK|TNA|WMS| Trader found @ %1, %2 buildings lootspawn deactivated", (getMarkerPos _x), (count _houses)]};
		{
			_x setVariable ["_lootAllowed",false,true];
		}foreach _houses
	};
	if (markertype _x in _markerTerritory) then { //this function run BEFORE the bases are re-created :/
		_houses = (getMarkerPos _x) nearObjects ["Building", 150];
		if (false) then {diag_log format ["[TRADERZONENOLOOT]|WAK|TNA|WMS| Territory found @ %1, %2 buildings lootspawn deactivated", (getMarkerPos _x), (count _houses)]};
		{
			_x setVariable ["_lootAllowed",false,true];
		}foreach _houses
	};
}forEach allMapMarkers;


