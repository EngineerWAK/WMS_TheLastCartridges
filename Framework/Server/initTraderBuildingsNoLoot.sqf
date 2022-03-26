
_customMapMarkers = getArray(missionConfigFile >> "CfgOfficeTrader" >> "MarkersToCheck");
_postExile_markerTraders = [(_customMapMarkers select 0)];
_postExile_markerTerritory = [(_customMapMarkers select 2)];
//_postExile_markerTraders = ["select"];
_postExile_NoLootSpawnDistance = 250;
_houses = [];
{
	if (false) then {diag_log format ["[TRADERZONENOLOOT]|WAK|TNA|WMS| Checking Trader Markers %1", (markertype _x)]};
	if (markertype _x in _postExile_markerTraders) then {
		_houses = (getMarkerPos _x) nearObjects ["Building", _postExile_NoLootSpawnDistance];
		if (false) then {diag_log format ["[TRADERZONENOLOOT]|WAK|TNA|WMS| Trader found @ %1, %2 buildings lootspawn deactivated", (getMarkerPos _x), (count _houses)]};
		{
			_x setVariable ["_lootAllowed",false,true];
		}foreach _houses
	};
	if (markertype _x in _postExile_markerTerritory) then { //this function run BEFORE the bases are re-created :/
		_houses = (getMarkerPos _x) nearObjects ["Building", 150];
		if (false) then {diag_log format ["[TRADERZONENOLOOT]|WAK|TNA|WMS| Territory found @ %1, %2 buildings lootspawn deactivated", (getMarkerPos _x), (count _houses)]};
		{
			_x setVariable ["_lootAllowed",false,true];
		}foreach _houses
	};
}forEach allMapMarkers;


