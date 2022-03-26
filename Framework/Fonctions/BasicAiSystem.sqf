/**
 * Basic Ai System, roaming infantry on triggers
 *
 * TNA-Community
 * https://discord.gg/Zs23URtjwF
 * © 2021 {|||TNA|||}WAKeupneo
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */

WMS_trigGlob_CoolD 	= 300;
WMS_TrigPos_Rdz 		= 50;
WMS_TrigSize 			= 400;
WMS_TrigLocals_Chance = 50;
WMS_trigMaxSpeed 		= 100;

WMS_LoopTime		= 60;
WMS_PlayerEntity	= "I_Survivor_F";
WMS_PlayerDistToDespawnAI	= 300;
WMS_MaxOPFORtoRun = 100;
WMS_sysChatMsg 	= 1; //1 general, 2 group, 3 player
WMS_RespectRwdOnKill = true;
WMS_respectBonus 	= 100;
WMS_distBonusMax 	= 300;
WMS_distBonusCoef = 0.333;
WMS_DestroyVHL 	= true;
WMS_remRPG		= true;

WMS_AI_Additems = [2,1];
WMS_AI_grenades = [];
WMS_AI_Launchers = [];
WMS_AI_inventory = [];
WMS_Loadout_Civilian = [ //uniform, vest, helmet, backback, facewear
	["U_C_Poloshirt_burgundy","U_C_Poloshirt_stripped","U_Competitor","U_C_man_sport_2_F","U_C_Man_casual_3_F","U_C_Man_casual_5_F"],
	["V_BandollierB_blk","V_Chestrig_blk","V_TacVest_blk","V_Pocketed_black_F"],
	["H_Cap_blu","H_MilCap_blue","H_Hat_blue","H_RacingHelmet_1_F","H_RacingHelmet_2_F","H_HeadBandage_bloody_F"],
	["B_FieldPack_oucamo","B_FieldPack_blk","B_Messenger_IDAP_F"],
	[]
];
WMS_Loadout_Bandit = [
	["U_I_C_Soldier_Para_1_F","U_I_C_Soldier_Para_2_F","U_I_C_Soldier_Para_3_F","U_I_C_Soldier_Para_4_F","U_I_C_Soldier_Para_5_F","U_I_C_Soldier_Bandit_1_F","U_I_C_Soldier_Bandit_2_F","U_I_C_Soldier_Bandit_3_F","U_I_C_Soldier_Bandit_4_F","U_I_C_Soldier_Bandit_5_F"],
	["V_BandollierB_khk","V_Chestrig_khk","V_TacVest_khk","V_TacVestCamo_khk","V_HarnessOSpec_brn","V_TacChestrig_cbr_F"],
	["H_Booniehat_khk","H_Cap_headphones","H_Shemag_olive","H_Shemag_tan","H_Watchcap_khk","R3F_beret","H_MilCap_ghex_F"],
	["B_AssaultPack_khk","B_FieldPack_khk","B_OutdoorPack_tan"],
	["G_Bandanna_tan","G_Balaclava_blk"]
];
WMS_Loadout_HeavyBandit = [
	["U_I_C_Soldier_Para_1_F","U_I_C_Soldier_Para_2_F","U_I_C_Soldier_Para_3_F","U_I_C_Soldier_Para_4_F","U_I_C_Soldier_Para_5_F","U_I_C_Soldier_Bandit_1_F","U_I_C_Soldier_Bandit_2_F","U_I_C_Soldier_Bandit_3_F","U_I_C_Soldier_Bandit_4_F","U_I_C_Soldier_Bandit_5_F","U_I_L_Uniform_01_camo_F","U_I_L_Uniform_01_deserter_F","U_I_L_Uniform_01_tshirt_skull_F","U_I_L_Uniform_01_tshirt_black_F","U_I_L_Uniform_01_tshirt_olive_F","U_C_E_LooterJacket_01_F"],
	["V_PlateCarrierGL_rgr","V_PlateCarrierGL_mtp","V_PlateCarrierSpec_rgr","V_PlateCarrierSpec_mtp","V_PlateCarrierIAGL_oli","V_PlateCarrier1_rgr_noflag_F","V_PlateCarrier2_rgr_noflag_F","V_EOD_coyote_F","V_CarrierRigKBT_01_EAF_F","V_CarrierRigKBT_01_heavy_EAF_F"],
	["H_Booniehat_khk","H_Cap_headphones","H_Shemag_olive","H_Shemag_tan","H_Watchcap_khk","R3F_beret","H_MilCap_ghex_F","H_CrewHelmetHeli_O","H_PilotHelmetHeli_O","H_PilotHelmetFighter_O","H_HelmetCrew_O","H_HelmetB_light_desert","H_HelmetSpecO_ocamo","H_HelmetLeaderO_ocamo","H_HelmetB_camo","H_HelmetSpecB_paint2"],
	["B_AssaultPack_khk","B_FieldPack_khk","B_OutdoorPack_tan","B_Carryall_ocamo","B_Carryall_taiga_F","B_Carryall_mcamo","B_Kitbag_mcamo","B_Kitbag_cbr"],
	["G_RegulatorMask_F","G_AirPurifyingRespirator_02_sand_F","G_AirPurifyingRespirator_02_black_F","G_Bandanna_tan","G_Balaclava_blk"]
];
WMS_Weaps_Light = [ //weap, scope, pistol
	["arifle_Mk20_plain_F","arifle_TRG20_F","hgun_PDW2000_F","SMG_03C_TR_camo","arifle_AKS_F","arifle_SPAR_01_khk_F","sgun_HunterShotgun_01_F"],
	["optic_Holosight","optic_ACO_grn","optic_MRCO","optic_Arco","optic_Holosight_khk_F","optic_Holosight_blk_F"],
	["hgun_P07_F","hgun_Rook40_F"]
];
WMS_Weaps_Medium = [
	["rhs_weap_hk416d10_LMT","rhs_weap_m16a4_imod","rhs_weap_m4a1_blockII_KAC","rhs_weap_mk18_KAC","arifle_AK12_arid_F","arifle_SPAR_01_khk_F"],
	["rhsusf_acc_eotech_552","rhsusf_acc_EOTECH","rhsusf_acc_compm4","rhsusf_acc_ACOG_USMC","rhsusf_acc_ELCAN","rhsusf_acc_ACOG","rhsusf_acc_ACOG_RMR","optic_Arco_arid_F","optic_Arco_AK_arid_F","optic_DMS_weathered_Kir_F"],
	["hgun_Pistol_heavy_01_F","hgun_Pistol_heavy_01_F"]
];
WMS_Weaps_Heavy = [
	["rhs_weap_hk416d10_LMT","rhs_weap_m16a4_imod","rhs_weap_m4a1_blockII_KAC","rhs_weap_mk18_KAC","rhs_weap_m27iar","rhs_weap_sr25_ec","rhs_weap_m24sws_d","rhs_weap_m40a5_d","rhs_weap_m249",
	"arifle_AK12_GL_arid_F","arifle_AK12_arid_F","arifle_MSBS65_sand_F","arifle_MSBS65_Mark_sand_F","arifle_MSBS65_GL_sand_F","arifle_MSBS65_UBS_sand_F","arifle_MX_SW_F",
	"srifle_DMR_05_tan_f","srifle_DMR_06_camo_F","srifle_GM6_camo_F","srifle_LRR_tna_F"
	],
	["rhsusf_acc_eotech_552","rhsusf_acc_EOTECH","rhsusf_acc_compm4","rhsusf_acc_ACOG_USMC","rhsusf_acc_ELCAN","rhsusf_acc_ACOG","rhsusf_acc_ACOG_RMR","rhsusf_acc_M8541","rhsusf_acc_LEUPOLDMK4","optic_Arco_arid_F","optic_Arco_AK_arid_F","optic_DMS_weathered_Kir_F","optic_SOS","optic_LRPS","optic_AMS"],
	["hgun_Pistol_heavy_01_green_F","hgun_Pistol_heavy_01_F","hgun_Pistol_heavy_01_green_F","hgun_Pistol_heavy_01_F"]
];

WMS_Pos_Locals = [];
WMS_Pos_Villages = [];
WMS_Pos_Cities = [];
WMS_Pos_Capitals = [];
WMS_Pos_Hills = [];
WMS_activatedTriggs = [];
WMS_TrigGlob_LastT = time;
WMS_TrigAI_Running = [];
WMS_VehicleAI_Running = [];
WMS_fnc_CreateTriggers = {
	private _worldCenter 	= [worldsize/2,worldsize/2,0]; 
	private _worldDiameter 	= ((worldsize/2)*1.413);
	{WMS_Pos_Locals pushback position _x}forEach (nearestLocations [_worldCenter, ["nameLocal"],_worldDiameter]);
	{WMS_Pos_Villages pushback position _x}forEach (nearestLocations [_worldCenter, ["nameVillage"],_worldDiameter]);
	{WMS_Pos_Cities pushback position _x}forEach (nearestLocations [_worldCenter, ["nameCity"],_worldDiameter]);
	{WMS_Pos_Capitals pushback position _x}forEach (nearestLocations [_worldCenter, ["nameCityCapital"],_worldDiameter]);
	{WMS_Pos_Hills pushback position _x}forEach (nearestLocations [_worldCenter, ["hill"],_worldDiameter]);

	{
		private _trigLocals = createTrigger ["EmptyDetector", [[[_x, WMS_TrigPos_Rdz]],[]] call BIS_fnc_randomPos];
		_trigLocals setTriggerArea [WMS_TrigSize, WMS_TrigSize, 0, false, WMS_TrigSize];
		_trigLocals setTriggerActivation ["ANYPLAYER", "PRESENT", true];
		_trigLocals setTriggerStatements ["this",
		"
			private _triggTime = round Time;
			thisTrigger setVariable ['WMS_triggRef',[thisTrigger, _triggTime],true];
			WMS_activatedTriggs pushBack [thisTrigger, _triggTime];
			if (time > (WMS_TrigGlob_LastT + WMS_trigGlob_CoolD) && {((random 100) < WMS_TrigLocals_Chance)} && {(speed (thisList select 0) < WMS_trigMaxSpeed)}) then {
				WMS_TrigGlob_LastT = time;
				[(position thisTrigger), (thisList select 0), 'trigger'] call WMS_fnc_SpawnTrigGroup;
			};
		",
		"
			private _trigRef = thisTrigger getVariable 'WMS_triggRef';
			WMS_activatedTriggs deleteAt (WMS_activatedTriggs find _trigRef);
		"];
	}forEach (WMS_Pos_Locals+WMS_Pos_Villages+WMS_Pos_Cities+WMS_Pos_Capitals+WMS_Pos_Hills);
};

WMS_fnc_SpawnTrigGroup = {
	private ["_safePos","_grps","_InfGrp_O"];
	params[
		"_pos",
		"_playerObject",
		["_type", "trigger"],
		["_timer", 300],
		["_AIcount", (3+random 2)],
		["_launcherChance", 20],
		["_skill", (0.2+random 0.4)],
		["_loadout", "bandit"]
	];
	if ((EAST countside allUnits) > WMS_MaxOPFORtoRun) exitWith {
		diag_log "Max OPFOR AI limit reached (WMS_MaxOPFORtoRun), no spawn for now";
	};
	_safePos = [_pos, 0, 50, 2, 0, 0, 0, [], [_pos,[]]] call BIS_fnc_findSafePos;
	_InfGrp_O = createGroup [OPFOR, false];
	for "_i" from 1 to _AIcount do {
		"O_Soldier_F" createUnit [
			_safePos, 
			_InfGrp_O
		];
	};
	[(units _InfGrp_O),_type,_launcherChance,_skill,_loadout] call WMS_fnc_SetAIunit;
	[_InfGrp_O, _safePos, 75, 3, "MOVE", "AWARE", "YELLOW", "NORMAL", "DIAMOND", "", [1,2,3]] call CBA_fnc_taskPatrol;
	WMS_TrigAI_Running pushback [(time+(_timer)),[_InfGrp_O],[],[],[],[],""];

};

WMS_fnc_SetAIunit = {
	private ["_weaps","_poptabs","_unit","_weapRandom","_weapRandomNoSnipNoMG","_mainWeap","_pistol","_expl1","_expl2","_expl3","_launcher"];
	params[
		["_units",[]],
		["_unitFunction","trigger"],
		["_launcherChance", 25],
		["_skill", 0.5],
		["_loadout", "bandit"],
		["_info", 'nothingYet']
	];
	_weaps = WMS_Loadout_Bandit;

	switch (toLower _loadout) do {
		case "civilian" 	: {_loadout = WMS_Loadout_Civilian; 	_weaps = WMS_Weaps_Light};
		case "bandit" 		: {_loadout = WMS_Loadout_Bandit; 	_weaps = WMS_Weaps_Medium};
		case "heavybandit" 	: {_loadout = WMS_Loadout_HeavyBandit; _weaps = WMS_Weaps_Heavy};
	};
	{
		_unit = _x;
		_unit setSkill _skill;
		_unit allowFleeing 0;
		removeAllItems _unit;
		removeAllWeapons _unit;
		removeBackpackGlobal _unit; 
		_unit forceaddUniform selectrandom (_loadout select 0); 
		_unit addVest selectrandom (_loadout select 1); 
		_unit addHeadGear selectrandom (_loadout select 2);
		_unit addBackpack selectrandom (_loadout select 3);
		_unit additem "FirstAidKit";
		switch (toLower _unitFunction) do {
			case  "trigger" : {
				_mainWeap = [_unit, selectrandom (_weaps select 0), 5, 0] call BIS_fnc_addWeapon;
				_unit addPrimaryWeaponItem selectrandom (_weaps select 1);
				_pistol = [_unit, selectrandom (_weaps select 2), 2] call BIS_fnc_addWeapon; 
				_unit addGoggles selectrandom (_loadout select 4);
				_unit additem selectRandom WMS_AI_grenades;
				_unit additem selectRandom WMS_AI_grenades;
			};
			case  "vehicle" : {
				_mainWeap = [_unit, selectrandom (WMS_Weaps_Light select 0), 5, 0] call BIS_fnc_addWeapon;
				_unit addPrimaryWeaponItem selectrandom (WMS_Weaps_Light select 1);
				_pistol = [_unit, selectrandom (WMS_Weaps_Light select 2), 1] call BIS_fnc_addWeapon;
				_unit additem selectRandom WMS_AI_grenades;
			};
		};
		if((random 100) <= _launcherChance) then { _launcher = [_unit, selectrandom (WMS_AI_Launchers select 0), 1] call BIS_fnc_addWeapon;};
		_items = (WMS_AI_Additems select 0) + round (random (WMS_AI_Additems select 1));
		for "_i" from 1 to _items do {
			_unit additem (selectRandom WMS_AI_inventory);
		};
		_unit addEventHandler ["Killed", " 
			if (isplayer (_this select 1)) then {
				[(_this select 0),(_this select 1)] call WMS_fnc_RwdMsgOnKill;
			};
		"];
	}forEach _units;
};
WMS_fnc_RwdMsgOnKill = {
	private ["_unitFunction","_info","_unit","_msgx","_sessionID","_unitName","_payload","_bonus","_distanceKill","_playerRep","_bonusDist","_malusDist","_type"];
	params[
		"_killed",
		"_killer"
	];
	_unitFunction 	= _killed getVariable ["unitFunction", "Assault"];
	_info 			= _killed getVariable ["info", "nothingYet"];
	_killerName 	= name _killer;
	_distanceKill	= (round(_killer distance _killed));
	_bonus 			= WMS_respectBonus;
	if (_distanceKill > WMS_distBonusMax) then {_bonus = 0};
	_bonusDist 		= round (_distanceKill * WMS_distBonusCoef);
	_malusDist 		= 0;
	_payload 		= [[format ["KILLED %1",toUpper(name _killed)],_bonus]];
	_msgx 			= "";

	if (((random 100) < WMS_DestroyVHL) && (_killed == leader _killed)) then {vehicle _killed setDamage 1};

	if (WMS_remRPG) then {_killed removeWeapon (secondaryWeapon _killed)};

	_killerUID 	= getPlayerUID _killer;
	_playerRepUpdated = 0;
	_playerUID_ExileKills = "ExileKills_"+_killerUID;
	_playerUID_ExileScore = "ExileScore_"+_killerUID;
  	_playerRep = profileNamespace getVariable [_playerUID_ExileScore,0];
  	_playerKills = profileNamespace getVariable [_playerUID_ExileKills,0];
	_playerKills = _playerKills + 1;
	_killer setVariable ["ExileKills", _playerKills, true];
	profileNamespace setVariable [_playerUID_ExileKills,_playerKills];
	if (WMS_RespectRwdOnKill && (vehicle _killer == _killer)) then {
		if (_distanceKill < WMS_distBonusMax) then {
			_malusDist = _bonusDist -(_bonusDist*2);
			_payload pushBack [format ["%1m RANGE MALUS",_distanceKill], _malusDist];
			_bonus = WMS_respectBonus + _malusDist;
		};
		_killer setVariable ["ExileScore",(_playerRep+_bonus), true];
  		profileNamespace setVariable [_playerUID_ExileScore,(_playerRep+_bonus)];	
	} else {
		_bonus = 0;
		_payload = [[format ["KILLED %1",toUpper(name _killed)],_bonus]];
	};
	if (WMS_sysChatMsg == 1) then {
		if (_bonus == 0) then {
			_msgx = format ['%2 killed %1, %3m away.', (name _killed), _killerName,_distanceKill];
		} else {
			_msgx = format ['%2 killed %1, %3m away and received %4 respect.', (name _killed), _killerName,_distanceKill,_bonus];
		};
		[_msgx] remoteexec ['SystemChat',0];
	} else {
		if (WMS_sysChatMsg == 2) then {
			if (_bonus == 0) then {
				_msgx = format["%1 killed %2 from %3 meters away.",_killerName,(name _killed),_distanceKill];
			} else {
				_msgx = format["%1 killed %2 from %3 meters away and received %4 respect.",_killerName,(name _killed),_distanceKill,_bonus];
			};
			{_msgx remoteExecCall ["systemChat", _x]} forEach units (group _killer);
		} else {
			if (WMS_sysChatMsg == 3) then {
				if (_bonus == 0) then {
					_msgx = format ['%2 killed %1, %3m away.', (name _killed), _killerName,_distanceKill];
				} else {
					_msgx = format ['%2 killed %1, %3m away and received %4 respect.', (name _killed), _killerName,_distanceKill,_bonus];
				};
				[_msgx] remoteExecCall ['SystemChat',_killer];
			};
		};
	};
	moveout _killed
	//saveProfileNamespace;
};

WMS_AImanager = {	
	private ["_triggerAIrunning","_grpArray","_vhl","_obj","_mkr","_wps","_ref"];
	_triggerAIrunning = (count WMS_TrigAI_Running);

	if !(_triggerAIrunning == 0) then { 
		{ 
			if (time > (_x select 0) && count ((position (leader (_x select 1 select 0))) nearEntities [WMS_PlayerEntity, WMS_PlayerDistToDespawnAI]) == 0) then { //this probably doesnt work
				_grpArray = (_x select 1);
				_vhl = (_x select 2);
				_obj = (_x select 3);
				_mkr = (_x select 4);
				_wps = (_x select 5);
				_ref = (_x select 6);
				if (_ref == "ALARM") then {
					PlaySound3D ["A3\Sounds_F\sfx\siren.wss", (_obj select 0), false, position (_obj select 0), 2, 1, 0];
				};
				{
					{ 
						_Shaft = "CMflare_Chaff_Ammo" createVehicle position _x;
						deleteVehicle _x;
					} foreach units _x;
				} forEach _grpArray; 
				{deleteVehicle _x} forEach _vhl;
				{deleteVehicle _x;} foreach _obj; 
				{deleteMarker _x;} foreach _mkr; 
				{deleteWaypoint _x;} foreach _wps;
				{deleteGroup _x;} forEach _grpArray; 
				WMS_TrigAI_Running deleteAt (WMS_TrigAI_Running find _x);
			};
		} foreach WMS_TrigAI_Running;
	};
};


while {true} do {
	call WMS_AImanager;
	uisleep WMS_LoopTime;
};