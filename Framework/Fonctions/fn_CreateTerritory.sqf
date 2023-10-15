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
private ["_maxTerr","_allowed","_territoryBuiltCount","_targetUID","_targetOwner","_playerUID_ExileMoney","_playerMoney","_territoryLevel","_territoryOfficeData","_flagID","_flag","_flagDir","_layout","_marker","_objectsToDespawn","_terrainobjects"];
params  [
	"_caller",
	"_pos",
	"_layout" //used for "TheOneMillionDollarsBase" //default is now "Territory" 
];
if (true) then {diag_log format ["[WMS_fnc_CreateTerritory]|WAK|TNA|WMS|_This = %1",_this]};
_targetUID = getPlayerUID _caller;
_targetOwner = (owner _caller);
_playerUID_ExileMoney = "ExileMoney_"+_targetUID;
_playerMoney = profileNamespace getVariable [_playerUID_Exilemoney,0];
_territoryOfficeData = getArray(missionConfigFile >> "CfgOfficeTrader" >> "territory");
_price = (_territoryOfficeData select 0);
_territoryLevel = 1;
_cleanRad = 20;
_allowed = true;
//_layout = ""; //will depend of the level I guess
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
_territoriesArray = profileNameSpace getVariable ["WMS_territoriesArray", []];
_maxTerr = (_territoryOfficeData select 5);
if (_layout == "TheOneMillionDollarsBase") then{
	_price = 1000000;
	_maxTerr = _maxTerr+1;
	_territoryLevel = 6;
	_cleanRad = 80;
	}else{
		_layout = "bunkercamp";
	};
if !(count _territoriesArray == 0) then {
	{
		if ((_x select 3) == (getPlayerUID _caller)) then {
			_territoryBuiltCount = _territoryBuiltCount+1;
		};
	}forEach _territoriesArray;
	if (_territoryBuiltCount >= _maxTerr) exitWith { //this doesnt exit
		"Nope, you can not have more territories" remoteExec ["hint", (owner _caller)];
		_allowed = false;
	};
};
//////////
if (_allowed) then {
	if (_playerMoney > _price) then {
		//////////
		//_territoriesArray = profileNameSpace getVariable ["WMS_territoriesArray", []];
		//////////
		_flagID = call WMS_fnc_generateHexaID;
		_objectsToDespawn = ["TREE", "SMALL TREE", "BUSH", "BUILDING", "HOUSE", "FOREST BORDER", "FOREST TRIANGLE", "FOREST SQUARE","BUNKER","FOUNTAIN", "FENCE", "WALL", "HIDE", "BUSSTOP", "FOREST", "STACK", "RUIN", "TOURISM", "ROCK", "ROCKS", "RAILWAY"];
		_terrainobjects = nearestTerrainObjects [_Pos,_objectsToDespawn,_cleanRad];
		{hideObjectGlobal _x} foreach _terrainobjects;
		_flag = createVehicle ["rhsgref_serhat_radar", _Pos, [], 1, "NONE"];//rhsgref_serhat_radar //Flag_Redburger_F
		if (surfaceIsWater _pos && {((atltoasl _pos) select 2 < -5)})then{
			_flag setPosASL [_Pos select 0, _Pos select 1, 2.413];
			_layout = "waterworld";
		};
		_flagDir = (random 360);
		_flag setDir _flagDir;
		[_flag]call WMS_fnc_initFlagAddActions;
		
		if (_layout == "TheOneMillionDollarsBase") then {
			[_flag, _pos, _flagDir, _layout] execVM "Fonctions\WMS_TheOneMillionDollarsBase.sqf";
		}else{
			[_flag, _pos, _flagDir, _layout] call WMS_fnc_SpawnCamps;
		};
		//[_flag, _pos, _flagDir, _layout] call WMS_fnc_SpawnCamps;

		_flag setVariable ["ace_rearm_isSupplyVehicle", true, true];
		_flag setVariable ["ACE_isRepairFacility", true, true];
		_flag setVariable ["WMS_vehicleid", _flagID, true];
		_flag setVariable ["WMS_buyerowner", _targetUID, true];
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
		_territoryFastTravel = profileNameSpace getVariable ["WMS_territoryfasttravel", []];
		_territoryFastTravel pushBack _targetUID;
		profileNameSpace setVariable ["WMS_territoryfasttravel", _territoryFastTravel];
		_territoriesArray pushBack [_flagID,_pos,_territoryLevel,_targetUID,[_targetUID],_flagDir,_layout];
		profileNameSpace setVariable ["WMS_territoriesArray", _territoriesArray];
		profileNamespace setVariable [_playerUID_Exilemoney,(_playerMoney-_price)];
		_caller setVariable ["ExileMoney", _playerMoney-_price, true];
		if (true) then {diag_log format ["[WMS_fnc_CreateTerritory]|WAK|TNA|WMS|Territory Allowed. _This = %1",_this]};
		saveProfileNamespace;
		if (WMS_MissionDebug) then {diag_log "[WMS_fnc_createTerritory]|WAK|TNA|WMS|ProfileNameSpace Saved"};
	} else {
		"Dude, make some money first !" remoteExec ["hint", (owner _caller)];
	};
};
