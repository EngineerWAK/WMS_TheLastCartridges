/**
 * WMS_fnc_claimItems
 *
 * TNA-Community
 * https://discord.gg/Zs23URtjwF
 * © 2023 {|||TNA|||}WAKeupneo
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */

private ["_callerScore","_rewardLevels","_rewardWeight","_rewardList","_rewardWeightIndex","_reward","_ammo","_rewardObject"];
params [
	"_caller",
	"_container",
	["_type","noreen"] //'banana' for banana protocol
];
_rewardObject = 'ACE_Banana'; //basic for now, this weapon spawn ONLY here and must be logged
//////////////////// //Special weapon
if (_type == "noreen")then {
	_rewardObject = "srifle_DMR_02_F";
	_container addItemCargoGlobal [_rewardObject, 1];
	_ammo = (getArray (configfile >> "CfgWeapons" >> _rewardObject >> "magazines")) select 0;
	_container addMagazinecargoGlobal [_ammo,5];
	};
//////////////////// //Banana Protocol
if (_type == "banana")then {
	_rewardObjects = [ //Viper Loadout
		"U_O_V_Soldier_Viper_F","V_CarrierRigKBT_01_light_EAF_F","B_Carryall_ghex_F","H_HelmetO_ViperSP_ghex_F",
		"arifle_ARX_ghex_F","muzzle_snds_65_TI_ghex_F","acc_pointer_IR","optic_Nightstalker","30Rnd_65x39_caseless_green","30Rnd_65x39_caseless_green","30Rnd_65x39_caseless_green","10Rnd_50BW_Mag_F","10Rnd_50BW_Mag_F","10Rnd_50BW_Mag_F",
		"launch_O_Vorona_green_F","Vorona_HEAT","Vorona_HEAT","Vorona_HEAT",
		"hgun_Rook40_F","muzzle_snds_L","16Rnd_9x21_Mag","16Rnd_9x21_Mag","16Rnd_9x21_Mag",
		"Laserdesignator_02_ghex_F","Laserbatteries",
		"ItemGPS","ToolKit","ACE_personalAidKit","MineDetector","rhs_radio_R187P1","rhsusf_radio_anprc152",
		"ACE_fieldDressing","ACE_fieldDressing","ACE_fieldDressing","ACE_fieldDressing","ACE_morphine","ACE_morphine""ACE_splint","ACE_tourniquet","ACE_plasmaIV_250"
		];
	{
		if (_x isKindOf "backpack") then {
			_container addBackPackCargoGlobal [_x, 1];
		}else{
			_container addItemCargoGlobal [_x, 1];
		};
	}forEach _rewardObjects;
	/////
	_rewardObject = "Money"; //16000$
	_container addItemCargoGlobal [_rewardObject, 1]; //16000$
	/////
	_container setvariable ["exileowneruid","0"];
	_container setvariable ["exileterritoryname","hell"];
	_container setvariable ["exileterritorybuildrights",[0]];
	_container setvariable ["exileterritorylevel",6];
	_container setVariable ["WMS_BaseFriends", ["1","2","3","4","5"]];
	_threatScenario = "BaseAtk";
	WMS_DynAI_LastTime = time;
	[_caller, _container, _threatScenario]spawn WMS_fnc_DynAI_baseATK;
	//_caller setVariable ["WMS_lastKill",servertime+600,true]; //need to use the other var as well since "lastKill" will reset at the next kill
	_caller setVariable ["WMS_SaveAndResp_Timer",serverTime+900,true];
	_caller setVariable ["WMS_lastKill",servertime+900,true];
	};
////////////////////
playSound3D [getMissionPath "Custom\Ogg\claimReward.ogg", _container, false, position _container, 3, 1, 0];
if (true) then {diag_log format ['|WAK|TNA|WMS|[WMS_fnc_claimItems]ClaimItems Debug, Winner = %1, Winner ID = %2, Winner Position = %3', (name _caller), (getPlayerUID _caller), (position _caller)]};
if (true) then {diag_log format ['|WAK|TNA|WMS|[WMS_fnc_claimItems]ClaimItems Debug, the reward is = %1', _rewardObject]};
if (true) then {diag_log format ['|WAK|TNA|WMS|[WMS_fnc_claimItems]ClaimItems Debug, allPlayers = %1', (allPlayers apply {[(name _x), (getPlayerUID _x), (position _x)]})]};

//count (items player select {_x == "FlashDisk"});