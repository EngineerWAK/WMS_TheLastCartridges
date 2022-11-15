private ["_targetUID","_targetOwner","_playerUID_ExileKills","_playerUID_ExileMoney","_playerUID_ExileScore","_playerUID_ExileDeath","_playerKills","_playerMoney","_playerScore","_playerDeath","_playerAlreadyConnected"];
params ["_playerUnit", "_didJIP"];

_targetUID = getPlayerUID _playerUnit;
_targetOwner = (owner _playerUnit);

_playerUID_ExileKills = "ExileKills_"+_targetUID;
_playerUID_ExileMoney = "ExileMoney_"+_targetUID;
_playerUID_ExileScore = "ExileScore_"+_targetUID;
_playerUID_ExileDeath = "ExileDeath_"+_targetUID;

_playerKills = profileNamespace getVariable [_playerUID_ExileKills,0];
_playerMoney = profileNamespace getVariable [_playerUID_Exilemoney,0];
_playerScore = profileNamespace getVariable [_playerUID_ExileScore,0];
_playerDeath = profileNamespace getVariable [_playerUID_ExileDeath,0];

if (missionNamespace getVariable ["WMS_firstPlayerConnected", true]) then { //Ace Fortify act very weird
	[] execVM "Server\AceFortifyList.sqf";
	missionNamespace setVariable ["WMS_firstPlayerConnected", false];
	//forceRespawn _playerUnit; //this might fix the first player stuck before spawn map //nope it didnt
};


//profileNamespace setVariable [_playerUID_ExileScore, round (_playerScore*1.01)];

_playerAlreadyConnected = profileNamespace getVariable ["WMS_playerAlreadyConnected",[]];
if !(_targetUID in _playerAlreadyConnected) then {
	_playerAlreadyConnected pushback _targetUID;
	profileNamespace setVariable ["WMS_playerAlreadyConnected",_playerAlreadyConnected];
};
//saveProfileNamespace;

if (WMS_MissionDebug) then {diag_log format ["[PLAYERJOINING]|WAK|TNA|WMS| player: %1, UID: %2, Kills: %3, Poptabs: %4, Score: %5, Death: %6", _playerUnit, _targetUID, _playerKills,_playerMoney,_playerScore,_playerDeath]};

//saveProfileNamespace;


_territoryFastTravel = profileNameSpace getVariable ["WMS_territoryfasttravel", []];
_territoriesArray = profileNameSpace getVariable ["WMS_territoriesArray", []];
_territoryOwner = [];
_fastTraveler = [];
if ((count _territoryFastTravel != 0) && {_targetUID in _territoryFastTravel}) then {
	{
		if (_targetUID == (_x select 3)) then {
			_territoryOwner pushback (_x select 1);
		}; //owner
		if (_targetUID in (_x select 4) && !(_targetUID in (_x select 3))) then {
			_fastTraveler pushback (_x select 1);
		}; //Friends list
	}forEach _territoriesArray;//[_flagID,_pos,_territoryLevel,_targetUID,[_targetUID],_flagDir,_layout];
	[_territoryOwner,_fastTraveler] remoteExec ["WMS_fnc_client_createBaseMarkers", (owner _playerUnit)];
};
