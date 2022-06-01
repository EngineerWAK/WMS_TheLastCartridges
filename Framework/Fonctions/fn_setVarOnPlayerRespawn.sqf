/**
 * WMS_fnc_setVarOnPlayerRespawn
 *
 * TNA-Community
 * https://discord.gg/Zs23URtjwF
 * © 2021 {|||TNA|||}WAKeupneo
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
private ["_targetUID","_targetOwner","_playerUID_ExileKills","_playerUID_ExileMoney","_playerUID_ExileScore","_playerUID_ExileDeath","_playerKills","_playerMoney","_playerScore","_playerDeath","_msgHint","_baseNamesList","_MkrCount","_territoryPos","_territoryPos2","_territoryLVLs","_territoryLVLs2","_territoryLVL"];

params["_target"];
_targetUID = getPlayerUID _target;
_targetOwner = (owner _target);

_playerUID_ExileKills = "ExileKills_"+_targetUID;
_playerUID_ExileMoney = "ExileMoney_"+_targetUID;
_playerUID_ExileScore = "ExileScore_"+_targetUID;
_playerUID_ExileDeath = "ExileDeath_"+_targetUID;

_playerKills = profileNamespace getVariable [_playerUID_ExileKills,0];
_playerMoney = profileNamespace getVariable [_playerUID_Exilemoney,0];
_playerScore = profileNamespace getVariable [_playerUID_ExileScore,0];
_playerDeath = profileNamespace getVariable [_playerUID_ExileDeath,0];

//profileNamespace setVariable [_playerUID_ExileDeath,(_playerDeath-1)]; //try to fix the double death count each time the player die and respawn
	
_target setVariable ["ExileKills", _playerKills, true];
_target setVariable ["ExileMoney", _playerMoney, true];
_target setVariable ["ExileScore", _playerScore, true];
_target setVariable ["ExileDeath", _playerDeath, true]; //try to fix the double death count each time the player die and respawn //This has no sense xD
_target setVariable ["PlayerInTraderZone", false];

if (true) then {diag_log format ["[SETVARONPLAYERRESPAWN]|WAK|TNA|WMS| player: %1, UID: %2, Kills: %3, Poptabs: %4, Score: %5, Death: %6", _target, _targetUID, _playerKills,_playerMoney,(profileNamespace getVariable [_playerUID_ExileScore,0]),(profileNamespace getVariable [_playerUID_ExileDeath,0])]};

_msgHint = format ["K: %1, D: %2, Poptabs: %3, Score: %4", _playerKills,(profileNamespace getVariable [_playerUID_ExileDeath,0]),_playerMoney,(profileNamespace getVariable [_playerUID_ExileScore,0])];
_msgHint remoteExec ["hint", _targetOwner];

//add the fast travel addAction to territory owner:
//if ("banana" in (Items Player) && {vehicle player isKindOf "Steerable_Parachute_F"} && {getPlayerUID player in _territoryFastTravel}) then {"fastTravelToBase"};

_territoryFastTravel = profileNameSpace getVariable ["WMS_territoryfasttravel", []];
_territoriesArray = profileNameSpace getVariable ["WMS_territoriesArray", []];
_territoryPos = []; //Owner
_territoryPos2 = []; //FastTraveler
_territoryLVLs = []; //Owner
_territoryLVLs2 = []; //FastTraveler
_territoryLVL = 1;
_baseNamesList = ["ABLE","BAKER","CHARLIE"];
_fastTravelAccuracy = 250;
_MkrCount = count _baseNamesList;
if ((count _territoryFastTravel != 0) && {_targetUID in _territoryFastTravel}) then {
	{
		if (false) then {diag_log format ["[SETVARONPLAYERRESPAWN]|WAK|TNA|WMS| Territory Array %1", _x]};
		if (_targetUID == (_x select 3)) then {
			_territoryPos pushback (_x select 1);
			_territoryLVLs pushback (_x select 2);
			}; //owner
		if (_targetUID in (_x select 4) && !(_targetUID in (_x select 3))) then {
			if !(_targetUID in (_x select 3)) then {
				_territoryPos2 pushback (_x select 1);
				_territoryLVLs2 pushback (_x select 2);
			};
		}; //Friends list
	}forEach _territoriesArray;//[_flagID,_pos,_territoryLevel,_targetUID,[_targetUID],_flagDir,_layout];
	_territoryPos = _territoryPos+_territoryPos2;
	_territoryLVLs = _territoryLVLs+_territoryLVLs2;
	if (count _territoryPos <= _MkrCount) then {_MkrCount = count _territoryPos};

	if !(count _territoryPos == 0) then {
		"FastTravel Available For Bambies" remoteExec ["systemChat", _targetOwner];
					//playSound3D [getMissionPath'\custom\ogg\fastTravel.ogg', (_this select 1), false, position (_this select 1), 2, 1, 0];
		for "_i" from 1 to _MkrCount do {
			_territoryLVL = _territoryLVLs select 0;
			switch  _territoryLVL do {
				case 1	: {_fastTravelAccuracy = 1000};
				case 2 	: {_fastTravelAccuracy = 800};
				case 3 	: {_fastTravelAccuracy = 600};
				case 4 	: {_fastTravelAccuracy = 400};
				case 5	: {_fastTravelAccuracy = 200};
				case 6	: {_fastTravelAccuracy = 80};
			};
			_display = format ["<t color='#9b48f9'>FastTravel To %1 Base </t>", _baseNamesList select 0];
			[
				_target,
				[
					_display,
					"	
						_fastTravelPos = [[[((_this select 3) select 0), ((_this select 3) select 1)]],[]] call BIS_fnc_randomPos;
						_altitudeFastTravel = ((position (_this select 1)) select 2);
						(_this select 1) setPos [(_fastTravelPos select 0),(_fastTravelPos select 1),_altitudeFastTravel];
						(_this select 0) removeaction (_this select 2);
						playSound 'fastTravel';
					",
					[(_territoryPos select 0),_fastTravelAccuracy], //argument accessible in the script (_this select 3)
					1,
					true,
					true,
					"",
					//"(alive _this) && {'ACE_Banana' in (Items _this);} && {typeof vehicle _this == 'Steerable_Parachute_F';} && {driver vehicle _this getVariable ['playerInSpawnZone', false]}", //banana is the Bambi item
					"
					(alive _this) && 
					{'ACE_Banana' in (Items _this);} && 
					{vehicle player == player;} && 
					{backpack player == 'B_Parachute' || backpack player == 'ACE_ReserveParachute';} && 
					{((position _this) select 2) > 300;} && 
					{_this getVariable ['playerInSpawnZone', false]}
					",
					5
				]
			] remoteExec [
				"addAction",
				_targetOwner, //0 for all players
				false //JIP
			];
			_territoryPos deleteat 0;
			_baseNamesList deleteat 0;
			_territoryLVLs deleteAt 0;
		};
	};
};