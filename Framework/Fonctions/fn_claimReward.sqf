/**
 * WMS_fnc_claimReward
 *
 * TNA-Community
 * https://discord.gg/Zs23URtjwF
 * © 2021 {|||TNA|||}WAKeupneo
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */

private ["_callerScore","_rewardLevels","_rewardWeight","_rewardList","_rewardWeightIndex","_reward","_ammo","_rewardObject"];
params [
	"_caller",
	"_container"
];
_callerScore = profileNameSpace getVariable ["ExileScore_"+(getPlayerUID _caller), 25000]; //lower is the score, better is the reward
_rewardLevels = getArray(missionConfigFile >> "CfgClaimReward" >> "levels"); //[0,1,2,3,4,5];
_rewardWeight = getArray(missionConfigFile >> "CfgClaimReward" >> "weight"); //[[1,2,3,4,5],[1,2,3,4,5],[1,2,3,4,5],[1,2,3,4,5],[1,2,3,4,5],[1,2,3,4,5]];
_rewardList = getArray(missionConfigFile >> "CfgClaimReward" >> "itemsList"); //["trash", "item", "weap", "launcher", "vhl"];
_staticList = getArray(missionConfigFile >> "CfgClaimReward" >> "staticList");
_rewardWeightIndex = 5;
_reward = "trash";
_ammo = nil;
_rewardObject = objNull;

playSound3D [getMissionPath "Custom\Ogg\claimReward.ogg", _container, false, position _container, 3, 1, 0];

if (_callerScore >= (_rewardLevels select 5)) then {_rewardWeightIndex = 5} else {
	if (_callerScore >= (_rewardLevels select 4)) then {_rewardWeightIndex = 4} else {
		if (_callerScore >= (_rewardLevels select 3)) then {_rewardWeightIndex = 3} else {
			if (_callerScore >= (_rewardLevels select 2)) then {_rewardWeightIndex = 2} else {
				if (_callerScore >= (_rewardLevels select 1)) then {_rewardWeightIndex = 1} else {
					_rewardWeightIndex = 0;
				};
			};
		};
	};
};

_reward = ["trash", "item", "weap", "launcher", "vhl"] selectRandomWeighted (_rewardWeight select _rewardWeightIndex);

switch (tolower _reward) do
{
	case "trash": {
		_rewardObject = selectRandom (_rewardList select 0);
		if (_rewardObject == "rocketman") then {
			//rocketman Call here
			[_caller] remoteExec ["WMS_fnc_rocketMan", (owner _caller)];
		}else{
			_container addItemCargoGlobal [_rewardObject, 3];
		};

	};
	case "item": {
		_rewardObject = selectRandom (_rewardList select 1);
		if (_rewardObject isKindOf "Bag_Base") then {
			_container addBackpackCargoGlobal [_rewardObject, 1];
		}else{
			if( _rewardObject == "static") then {
				_static = selectrandom _staticList;
				{_container addBackpackCargoGlobal [_x, 1]}forEach _static;
			} else {
				_container addItemCargoGlobal [_rewardObject, 1];
			};
		};
	};
	case "weap": {
		_rewardObject = selectRandom (_rewardList select 2);
		_container addItemCargoGlobal [_rewardObject, 1];
		_ammo = (getArray (configfile >> "CfgWeapons" >> _rewardObject >> "magazines")) select 0;
		_container addMagazinecargoGlobal [_ammo,3];

	};
	case "launcher": {
		_rewardObject = selectRandom (_rewardList select 3);
		_container addItemCargoGlobal [_rewardObject, 1];
		_ammo = (getArray (configfile >> "CfgWeapons" >> _rewardObject >> "magazines")) select 0;
		_container addMagazinecargoGlobal [_ammo,3];
	};
	case "vhl": {
		_rewardObject = selectRandom (_rewardList select 4);
		//need to find the position/helipad/trader for the permanent vehicle spawn //NOPE, don't even need xD
		[_rewardObject,_caller] call WMS_fnc_createPermanentVHL;
	};
	default {
		_container addItemCargoGlobal [(selectRandom (_rewardList select 0)), 1];
	};
};
if (true) then {diag_log format ['|WAK|TNA|WMS|[WMS_fnc_claimReward]ClaimReward Debug, the reward is = %1', _rewardObject]};
