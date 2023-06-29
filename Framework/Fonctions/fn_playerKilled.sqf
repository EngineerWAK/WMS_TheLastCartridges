private ["_Difficulty","_Difficulty","_msgx","_targetUID","_targetOwner","_playerUID_ExileKills","_playerUID_ExileMoney","_playerUID_ExileScore","_playerUID_ExileDeath","_playerKills","_playerMoney","_playerScore","_playerDeath","_msgHint","_suicideMalus","_deathMalus","_scoreMalus","_mkr1"];

params["_target", "_killer","_instigator","_useEffects"];
_targetUID = getPlayerUID _target;
_targetOwner = (owner _target);
	_suicideMalus = 5; //not used
_deathMalus = 2;
_scoreMalus = 0;
_scoreMalusKILLER = 0;
_killerScore = 0;
if !(isServer) exitWith {
	if (WMS_MissionDebug) then {diag_log format ["[PLAYERKILLED_LOG_FROM_FN_PLAYERKILLED]|WAK|TNA|WMS| WTF Is Going On Dude ??? _this: %1, time: %2", _this, time]};
};
[_target] remoteExecCall ['moveOut',_targetOwner];
if (WMS_MissionDebug) then {diag_log format ["[PLAYERKILLED_LOG_FROM_FN_PLAYERKILLED]|WAK|TNA|WMS| _this: %1, time: %2", _this, time]};

_playerUID_ExileKills = "ExileKills_"+_targetUID;
_playerUID_ExileMoney = "ExileMoney_"+_targetUID;
_playerUID_ExileScore = "ExileScore_"+_targetUID;
_playerUID_ExileDeath = "ExileDeath_"+_targetUID;

_playerKills = profileNamespace getVariable [_playerUID_ExileKills,0];
_playerMoney = profileNamespace getVariable [_playerUID_Exilemoney,0];
_playerScore = profileNamespace getVariable [_playerUID_ExileScore,0];
_playerDeath = profileNamespace getVariable [_playerUID_ExileDeath,0];

/*
	PVPStatus 		= 1; //1 true, 0 false
	PVPpunishment 	= 25;
	PVPreward 		= 10;
	PVEpunishmentTK	= 10;
	PVEdeath		= 2;
*/
private _difficulty = "none";
private _skills = [];
[_target] remoteExec ["WMS_fnc_client_deathmarker", (owner _target)];
if !(isPlayer _killer) then {
	//_x setVariable ["WMS_skills",_skillsCut,true]; //will be used for AI killfeed on player EH killed
	//_x setVariable ["WMS_Difficulty",_difficulty, true]; //will be used for AI killfeed on player EH killed
	_difficulty = _killer getVariable ["WMS_Difficulty","none"];
	_skills = _killer getVariable ["WMS_skills",[]];
	[_target] remoteExec ["WMS_fnc_client_deathmarker", (owner _target)];
	_msgx = format ['%2 killed %1, %3m away! %4 %5', (name _target), (name _killer),(_killer distance2d _target),_difficulty,_skills];
	[_msgx] remoteexec ['SystemChat',0];
	if (WMS_MissionDebug) then {diag_log format ['|WAK|TNA|WMS| %2 killed %1, %3m away! %4 %5', (name _target), (name _killer),(_killer distance2d _target),_difficulty,_skills]};
};
if (isPlayer _killer && {_killer != _target} && {_target != _instigator}) then { //PLAYER Killer
	_killerScore = profileNamespace getVariable ["ExileScore_"+(getPlayerUID _killer),0];
	if (getNumber(missionConfigFile >> "CfgPVP" >> "PVPStatus") == 1) then { //PVP ON, PLAYER killer
		if ((_killer getVariable ['playerInRestrictionZone',0]) != 0 || (_target getVariable ['playerInRestrictionZone',0]) != 0) then { //Punishment for killer, reward for killed if one of then in ExclusionZone
			_scoreMalusKILLER = round ((_killerScore*0.01)*(getNumber(missionConfigFile >> "CfgPVP" >> "PVPpunishment"))); //kill in ExclusionZone = punishment
			profileNamespace setVariable ["ExileScore_"+(getPlayerUID _killer),(_killerScore-_scoreMalusKILLER)]; //killer punishment
			_killer setVariable ["ExileScore", (_killerScore-_scoreMalusKILLER), true];
			profileNamespace setVariable [_playerUID_ExileScore,(_playerScore+_scoreMalusKILLER)]; //killed reward
			profileNamespace setVariable [_playerUID_ExileDeath,(_playerDeath+1)];
		} else {//regular kill outside of exclusionZone
			_scoreBonusKILLER = round ((_playerScore*0.01)*(getNumber(missionConfigFile >> "CfgPVP" >> "PVPreward")));
			profileNamespace setVariable ["ExileScore_"+(getPlayerUID _killer),(_killerScore+_scoreBonusKILLER)]; //killer reward from Killed
			_killer setVariable ["ExileScore", (_killerScore+_scoreBonusKILLER), true];
			_killerKills = profileNamespace getVariable ["ExileKills_"+(getPlayerUID _killer),0];
			profileNamespace setVariable ["ExileKills_"+(getPlayerUID _killer),(_killerKills+1)];
			_killer setVariable ["ExileKills", (_killerKills+1), true];
			profileNamespace setVariable [_playerUID_ExileScore,(_playerScore-_scoreBonusKILLER)]; //killed malus
			profileNamespace setVariable [_playerUID_ExileDeath,(_playerDeath+1)];
		};

	} else { //PVP OFF, PLAYER Killer
		_scoreMalusKILLER = round ((_killerScore*0.01)*(getNumber(missionConfigFile >> "CfgPVP" >> "PVEpunishmentTK")));
		profileNamespace setVariable ["ExileScore_"+(getPlayerUID _killer),(_killerScore-_scoreMalusKILLER)]; //killer punishment
		_killer setVariable ["ExileScore", (_killerScore-_scoreMalusKILLER), true];
		profileNamespace setVariable [_playerUID_ExileScore,(_playerScore+_scoreMalusKILLER)]; //killed reward
		profileNamespace setVariable [_playerUID_ExileDeath,(_playerDeath+1)];
	};
} else {
	if (isPlayer _instigator && {_killer != _target} && {_target != _instigator}) then { //PLAYER instigator
		_killerScore = profileNamespace getVariable ["ExileScore_"+(getPlayerUID _instigator),0];
		if (getNumber(missionConfigFile >> "CfgPVP" >> "PVPStatus") == 1) then { //PVP ON, PLAYER instigator
			if ((_instigator getVariable ['playerInRestrictionZone',0]) != 0 || (_target getVariable ['playerInRestrictionZone',0]) != 0) then { //Punishment for killer, reward for killed if one of then in ExclusionZone
				_scoreMalusKILLER = round ((_killerScore*0.01)*(getNumber(missionConfigFile >> "CfgPVP" >> "PVPpunishment"))); //kill in ExclusionZone = punishment
				profileNamespace setVariable ["ExileScore_"+(getPlayerUID _instigator),(_killerScore-_scoreMalusKILLER)]; //killer punishment
				_instigator setVariable ["ExileScore", (_killerScore-_scoreMalusKILLER), true];
				profileNamespace setVariable [_playerUID_ExileScore,(_playerScore+_scoreMalusKILLER)]; //killed reward
				profileNamespace setVariable [_playerUID_ExileDeath,(_playerDeath+1)];
			} else {//regular kill outside of exclusionZone
				_scoreBonusKILLER = round ((_playerScore*0.01)*(getNumber(missionConfigFile >> "CfgPVP" >> "PVPreward")));
				profileNamespace setVariable ["ExileScore_"+(getPlayerUID _instigator),(_killerScore+_scoreBonusKILLER)]; //killer reward from Killed
				_instigator setVariable ["ExileScore", (_killerScore+_scoreBonusKILLER), true];
				_killerKills = profileNamespace getVariable ["ExileKills_"+(getPlayerUID _instigator),0];
				profileNamespace setVariable ["ExileKills_"+(getPlayerUID _instigator),(_killerKills+1)];
				_instigator setVariable ["ExileKills", (_killerKills+1), true];
				profileNamespace setVariable [_playerUID_ExileScore,(_playerScore-_scoreBonusKILLER)]; //killed malus
				profileNamespace setVariable [_playerUID_ExileDeath,(_playerDeath+1)];
			};

		} else { //PVP OFF, PLAYER _instigator
			_scoreMalusKILLER = round ((_killerScore*0.01)*(getNumber(missionConfigFile >> "CfgPVP" >> "PVEpunishmentTK")));
			profileNamespace setVariable ["ExileScore_"+(getPlayerUID _instigator),(_killerScore-_scoreMalusKILLER)]; //killer punishment
			_instigator setVariable ["ExileScore", (_killerScore-_scoreMalusKILLER), true];
			profileNamespace setVariable [_playerUID_ExileScore,(_playerScore+_scoreMalusKILLER)]; //killed reward
			profileNamespace setVariable [_playerUID_ExileDeath,(_playerDeath+1)];
		};

	} else { //"regular" death, no player involved
		_scoreMalus = round ((_playerScore*0.01)*_deathMalus);
		profileNamespace setVariable [_playerUID_ExileScore,(_playerScore-_scoreMalus)];
		profileNamespace setVariable [_playerUID_ExileDeath,(_playerDeath+1)];
	};
};

if (WMS_MissionDebug) then {diag_log format ["[PLAYERKILLED]|WAK|TNA|WMS| player: %1, UID: %2, Kills: %3, Money: %4, Score: %5, Death: %6", _target, _targetUID, _playerKills,_playerMoney,(profileNamespace getVariable [_playerUID_ExileScore,0]),(profileNamespace getVariable [_playerUID_ExileDeath,0])]};

//_msgHint = format ["K: %1, D: %2, Money: %3, Score: %4", _playerKills,(profileNamespace getVariable [_playerUID_ExileDeath,0]),_playerMoney,(profileNamespace getVariable [_playerUID_ExileScore,0])];
//_msgHint remoteExec ["hint", _targetOwner];
//[_msgHint] remoteExecCall ['SystemChat',_targetOwner];
//saveProfileNamespace;
