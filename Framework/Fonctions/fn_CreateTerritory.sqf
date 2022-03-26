/**
 * WMS_fnc_CreateTerritory
 *
 * TNA-Community
 * https://discord.gg/Zs23URtjwF
 * © 2021 {|||TNA|||}WAKeupneo
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
//[player, _pos] remoteExec ['WAMmp_fnc_CreateTerritory']; //_pos is defined by the 'click' itself
private ["_territoryBuiltCount","_targetUID","_targetOwner","_playerUID_ExileMoney","_playerMoney","_territoryLevel","_territoryOfficeData","_flagID","_flag","_flagDir","_layout","_marker","_objectsToDespawn","_terrainobjects"];
params  [
	"_caller",
	"_pos"
];

_targetUID = getPlayerUID _caller;
_targetOwner = (owner _caller);
_playerUID_ExileMoney = "ExileMoney_"+_targetUID;
_playerMoney = profileNamespace getVariable [_playerUID_Exilemoney,0];
_territoryOfficeData = getArray(missionConfigFile >> "CfgOfficeTrader" >> "territory");
_price = (_territoryOfficeData select 0);
_territoryLevel = 1;
/*
	Territory[] = 
	{
		20000, //TerritoryPrice = 
		100, //TerritoryRadius = 
		750, //DistTraders = 
		750, //DistSpawn = 
		300, //DistTerritories = 
		2 //maximum Territories/player
	};
*/
/////How many flag the player already own:
_territoryBuiltCount = 0;
_territoriesArray = profileNameSpace getVariable ["territoriesArray", []];
if !(count _territoriesArray == 0) then {
	{
		if ((_x select 3) == (getPlayerUID _caller)) then {
			_territoryBuiltCount = _territoryBuiltCount+1;
		};
	}forEach _territoriesArray;
	if (_territoryBuiltCount >= (_territoryOfficeData select 5)) exitWith {
		"Nope, you can not have more territories" remoteExec ["hint", (owner _caller)];
	};
};
//////////
//if (_targetUID == "76561197965501020") then {
if (_playerMoney > _price) then {
	//////////
	//_territoriesArray = profileNameSpace getVariable ["territoriesArray", []];
	//////////
	_flagID = call WMS_fnc_generateHexaID;

	_objectsToDespawn = ["TREE", "SMALL TREE", "BUSH", "BUILDING", "HOUSE", "FOREST BORDER", "FOREST TRIANGLE", "FOREST SQUARE","BUNKER","FOUNTAIN", "FENCE", "WALL", "HIDE", "BUSSTOP", "FOREST", "STACK", "RUIN", "TOURISM", "ROCK", "ROCKS", "RAILWAY"];
	_terrainobjects = nearestTerrainObjects [_Pos,_objectsToDespawn,20];
	{hideObjectGlobal _x} foreach _terrainobjects;

	_flag = createVehicle ["rhsgref_serhat_radar", _Pos, [], 1, "NONE"];//rhsgref_serhat_radar //Flag_Redburger_F
	_flagDir = (random 360);
	_flag setDir _flagDir;
	_layout = "bunkercamp"; //will depend of the level I guess
	[_flag]call WMS_fnc_initFlagAddActions;
	[_flag, _pos, _flagDir, "bunkercamp"] call WMS_fnc_SpawnCamps;
	_flag setVariable ["ace_rearm_isSupplyVehicle", true, true];
	_flag setVariable ["ACE_isRepairFacility", true, true];
	_flag setVariable ["vehicleID", _flagID, true];
	_flag setVariable ["BuyerOwner", _targetUID, true];
	_flag setVariable ["WMS_BaseFriends", [_targetUID], true];
	_flag setVariable ["layout", _layout, true]; //not sure about this one yet
	//from Exile used in the mission system:
	_flag setvariable ["exileowneruid",_targetUID, true];
	_flag setvariable ["exileterritoryname",_flagID, true];
	_flag setvariable ["exileterritorybuildrights",[_targetUID], true];
	_flag setvariable ["exileterritorylevel",_territoryLevel, true];
	//create invisible marker on the flag for later check:
	_marker = createMarker [_flagID, _pos];
	_marker setMarkerType "mil_flag";
	_marker setMarkerAlpha 0; //keep it invisible

	_territoryFastTravel = profileNameSpace getVariable ["territoryfasttravel", []]; //if ("banana" in (Items Player) && {vehicle player isKindOf "Steerable_Parachute_F"} && {getPlayerUID player in _territoryFastTravel}) then {"fastTravelToBase"};
	//if !(_targetUID in _territoryFastTravel) then {
		_territoryFastTravel pushBack _targetUID;
		profileNameSpace setVariable ["territoryfasttravel", _territoryFastTravel];
	//};

	_territoriesArray pushBack [_flagID,_pos,_territoryLevel,_targetUID,[_targetUID],_flagDir,_layout];
	profileNameSpace setVariable ["territoriesArray", _territoriesArray];
	profileNamespace setVariable [_playerUID_Exilemoney,(_playerMoney-_price)];
	_caller setVariable ["ExileMoney", _playerMoney-_price, true];

	saveProfileNamespace;
} else {
	"Dude, make some money first !" remoteExec ["hint", (owner _caller)];
};
