WMS_countPermanentVehicles = {
	private _permamentVehicle = profileNameSpace getVariable ["WMS_permanentVhlArray", []];
	private _count = [];
	{
		_count pushBack (_x select 0);
		_count pushBack ((count _x)-1);
	}forEach _permamentVehicle;
	_count
};

WMS_exportMissionObjects = {
	_missionObjects = [];
	private _skipObjects = ["CamCurator","#lightpoint","babe_helper","Camera","Sign_Arrow_F","Sign_Arrow_Green_F","Sign_Arrow_Yellow_F","Logic"];
	private _allObjects = nearestObjects [[0,0,0], [], 100]; 
	{ 
		if !((TypeOf _x) in _skipObjects) then {
			_pos 	= (GetPosATL _x);
			_Xpos	= [(_pos select 0), 1] call BIS_fnc_cutDecimals;
			_Ypos 	= [(_pos select 1), 1] call BIS_fnc_cutDecimals;
			_Zpos 	= [(_pos select 2), 2] call BIS_fnc_cutDecimals;
			_Dir 	= [(GetDir _x), 1] call BIS_fnc_cutDecimals;
			_object = [(TypeOf _x),[_Xpos,_Ypos,_Zpos], _Dir];
			_missionObjects pushBack _object; 
		};
	}forEach _allObjects; 
	_missionObjects sort true;
	copyToClipBoard format ["%1", _missionObjects]; 
	systemChat format ["%1 Objects Exported", (count _missionObjects)];
};
//Modify array in players permanent vehicle array
_arrayModification = {
	_UIDplayer = "76561197965501020";
	_UIDplayerArrayPos = [_UIDplayer] call WMS_fnc_findUIDinVhlArray;
	_permamentVehicle = profileNameSpace getVariable ["WMS_permanentVhlArray", []];
	_result = [];
	{
		if !(typeName _x == "STRING") then {
			_x set [8, 0]; //modification
			_result pushback _x;
		};
	}forEach (_permamentVehicle select _UIDplayerArrayPos);
	_result
};
//Set multiple markers from position in an array
_Pos_Array = [];
_mkrNameArray = [];
{  
  _mkr1 = createMarkerLocal [format ["MKR1_%1_%2",_x, time], _x]; 
  _mkr1 setMarkerTypeLocal "selector_selectedMission"; 
  _mkr1 setMarkerColorLocal "colorOPFOR";
  _mkrNameArray pushBack _mkr1;
}forEach _Pos_Array;
uisleep 60;
{deleteMarker _x}forEach _mkrNameArray;

WMS_fnc_GetOwnedPermanentVhl = {
	params [
		"_ownerUID"
	];
	_result = [];
	_UIDplayerArrayPos = [_ownerUID] call WMS_fnc_findUIDinVhlArray; //return -1 if no result
	if !(_UIDplayerArrayPos == -1) then {
		_permamentVehicles = profileNameSpace getVariable ["WMS_permanentVhlArray", []];
		{
			if !(typeName _x == "STRING") then {
				_result pushback [_x select 1,_x select 2]; //[Type,position]
			};
		}forEach (_permamentVehicles select _UIDplayerArrayPos);
	};
	_result
};

//spawn a mission server side ONLY (WMS_AMS/InfantryProgram)
["commsrelay"] call WMS_fnc_AMS_SpawnMission; //missions from WMS_AMS_MissionList

//change server running time server side compatible with statusBar
WMS_ServRestartSeconds = serverTime+3600; //restart in one hour
publicVariable "WMS_ServRestartSeconds";

//GetMarkers position 
_result = [];
{	
	_result pushBack (getMarkerPos _x)
}forEach allMapMarkers;
_result

//prevent autoLanding
if (!isServer) then {
inGameUISetEventHandler ["Action", " 
 if (_this select 3 == 'Land') then { 
  hint 'Nope, No autoLanding xD';  
  true 
 } 
"];
};
//check every action datas (probably?)
inGameUISetEventHandler ["Action", "hint str _this; false"];


//modify player money server side
_targetUID = "76561197965501020";
_moneyToAdd = 10000;
_playerUID_ExileMoney = "ExileMoney_"+_targetUID;
_playerMoney = profileNamespace getVariable [_playerUID_Exilemoney,0];
profileNamespace setVariable [_playerUID_Exilemoney,(_playerMoney+_moneyToAdd)];
//modify player score server side
_targetUID = "76561197965501020"; 
_ScoreToAdd = 5000; 
_playerUID_ExileScore = "ExileScore_"+_targetUID; 
_playerScore = profileNamespace getVariable [_playerUID_ExileScore,0]; 
profileNamespace setVariable [_playerUID_ExileScore,(_playerScore+_ScoreToAdd)];

//modify player money local
_moneyToAdd = 10000;
_playerMoney = player getVariable ["ExileMoney",0];
player setVariable ["ExileMoney",(_playerMoney+_playerMoney), true];

//get players owners from server side
_result = [];
{_result pushBack [name _x, owner _x]}forEach allPlayers;
_result;

//TP players with their name
_pos = [12217.8,13874.1,0.00117031];
{
if ("Tank" in (name _x))then{_x setPos _pos};
}forEach allPlayers;

//////////////////////////////////
//////////NOTE FOR LATER//////////
[
	"Somewhere on Altis", 
	format ["Year %1", date select 0], 
	mapGridPosition player
] spawn BIS_fnc_infoText;


getNumber(configFile >> "CfgVehicles" >> (typeOf vehicle player) >> "maximumLoad");

this switchMove "HubFixingVehicleProne_idle1";
this addEventHandler [ "AnimDone", {
	params[ "_unit", "_anim" ];
	
	if ( _anim == "HubFixingVehicleProne_idle1" ) then {
		_unit switchMove "HubFixingVehicleProne_idle1";
	};
}];

[this,"WATCH"] call BIS_fnc_ambientAnim;
[123.4567, 2] call BIS_fnc_cutDecimals; //123.45

"Banana" call CBA_fnc_notify;
["Banana", 1.5, [1, 1, 0, 1]] call CBA_fnc_notify;
[["Banana", 1.5, [1, 1, 0, 1]], ["Not Apple"], true] call CBA_fnc_notify;

[[0,0,0], 0, "B_UAV_02_F", west] call BIS_fnc_spawnVehicle;
_uav = "uavobject";
createVehicleCrew _uav;

/////////////
	//["Land_Destroyer_01_base_F",[0,0,0],180],
	//["Land_HelipadEmpty_F",[0,-79.4,8.76],180],
	//["ShipFlag_US_F",[0,-91.8,8.76],180]
private _shipParts = [
	["Land_Destroyer_01_hull_01_F",[0,-85,-2.65],180],
	["Land_Destroyer_01_hull_02_F",[0,-45,-2.65],180],
	["Land_Destroyer_01_hull_03_F",[-0,-0,-2.65],180],
	["Land_Destroyer_01_hull_04_F",[-0,45,-2.65],180],
	["Land_Destroyer_01_hull_05_F",[-0,80,-2.65],180],
	["Land_Destroyer_01_interior_02_F",[0,-45,-2.65],180],
	["Land_Destroyer_01_interior_03_F",[-0,0,-2.65],180],
	["Land_Destroyer_01_interior_04_F",[-0,45,-2.65],180]
];
private _pos = position player;
private _boat = "I_Boat_Armed_01_minigun_F" createVehicle _pos;
_boat allowDamage false;
{
	_part = _x select 0 createVehicle [0,0,500];
	_part setDir (_x select 2);
	_part attachTo [_boat,[_x select 1 select 0,_x select 1 select 1,_x select 1 select 2]];
}forEach _shipParts;

////////////////////////////////
//FastRope ACE action
private _actionFr = ["Fast Rope", "Fast Rope", "", {
		[(_this select 0),false,false] call ace_fastroping_fnc_deployAI;
	},{
		(speed (_this select 0) < 10)
	}
	] call ace_interact_menu_fnc_createAction;
["vtx_H60_base", 0, ["ACE_MainActions"], _actionFr, true] call ace_interact_menu_fnc_addActionToClass;

/////////////////////////////
//diag_log players stats
_playerAlreadyConnected = profileNamespace getVariable ["WMS_playerAlreadyConnected",[]];
{
	diag_log format ["[PLAYERSTATS]|WAK|TNA|WMS| player UID: %1, Kills: %2, Death: %3, Money: %4, Score: %5", 
		_x, 
		profileNamespace getVariable [("ExileKills_"+_x), "nothing"], 
		profileNamespace getVariable [("ExileDeath_"+_x), "nothing"], 
		profileNamespace getVariable [("ExileMoney_"+_x), "nothing"], 
		profileNamespace getVariable [("ExileScore_"+_x), "nothing"]
	];
}forEach _playerAlreadyConnected;
//Console print Players stats
private _playerAlreadyConnected = profileNamespace getVariable ["WMS_playerAlreadyConnected",[]];
private _result = [];
{
	_stats = [
		[_x], 
		["Kills", profileNamespace getVariable [("ExileKills_"+_x), "nothing"]], 
		["Deaths", profileNamespace getVariable [("ExileDeath_"+_x), "nothing"]], 
		["Money", profileNamespace getVariable [("ExileMoney_"+_x), "nothing"]], 
		["Score", profileNamespace getVariable [("ExileScore_"+_x), "nothing"]]
	];
	_result pushBack _stats;
}forEach _playerAlreadyConnected;
_result;
////////////////////////Exile stuff
	_killed = "NPC_object";
	_Instigator = "player_Object";
	_InstigatorUID = getPlayerUID _Instigator;
	_Rep_bonus = _killed getVariable ["Rep_bonus", 500];
	_KillerRespect = _Instigator getVariable ["ExileScore", 0];
	_KillerRespect = _KillerRespect + _Rep_bonus;
	_Instigator setVariable ["ExileScore",_KillerRespect];
	format["setAccountScore:%1:%2", _KillerRespect, _InstigatorUID] call ExileServer_system_database_query_fireAndForget;
	ExileClientPlayerScore = _KillerRespect;
	(owner _Instigator) publicVariableClient "ExileClientPlayerScore";
	ExileClientPlayerScore = nil;
////////////////////////////////
//Export stuff from crate, much easier than from cfg
_crate = cursorTarget;
_result = [(typeOf _crate),[],[],[],[]];
{
	_type = _x;
	_result select (_type select 1) pushback (_type select 0);
	{
		if !(_x in (_result select (_type select 1))) then {_result select (_type select 1) pushBack _x};
	}forEach (_type select 2);
	_result select (_type select 1) pushback (count (_result select (_type select 1))-1);
}forEach [
	["Weapons",1,(WeaponCargo _crate)],
	["Magazines",2,(magazineCargo _crate)],
	["BackPacks",3,(backPackCargo _crate)],
	["Items",4,(itemCargo _crate)]
];
//
_cratesClasses = [
	"vn_b_ammobox_kit_anzac",
	"vn_o_ammobox_kit_nva",
	"vn_b_ammobox_kit_sog",
	"vn_b_ammobox_kit_usmc",
	"vn_b_ammobox_supply_03",
	"vn_b_ammobox_sog"
];
_result = [
	"All Crates Export",
	["WEAPONS"],
	["MAGAZINES"],
	["BACKPACKS"],
	["ITEMS",["HEADGEARS"],["UNIFORMS"],["VESTS"],["BINOCULARS"],["BIPODS"],["SUPPRESSORS"],["LASERS"],["OTHERS"]]];
_cratesObjects = [];
{
	_box = _x createVehicle position player;
	_cratesObjects pushback _box;
}forEach _cratesClasses;
{
	_crate = _x;
	{
		_type = _x;
		_array = (_type select 1);
		{
			if !(_type select 0 == "Items") then {
				if !(_x in (_result select _array)) then {_result select _array pushBack _x};
			}else{
				if (_x isKindOf ["HelmetBase", configFile >> "CfgWeapons"]) then {
					if !(_x in (_result select _array select 1)) then {_result select _array select 1 pushBack _x};
				}else{
					if (_x isKindOf ["Uniform_Base", configFile >> "CfgWeapons"]) then {
						if !(_x in (_result select _array select 2)) then {_result select _array select 2 pushBack _x};
					}else{
						if (_x isKindOf ["Vest_Camo_Base", configFile >> "CfgWeapons"]||_x isKindOf ["Vest_NoCamo_Base", configFile >> "CfgWeapons"]) then {
							if !(_x in (_result select _array select 3)) then {_result select _array select 3 pushBack _x};
						}else{
							if (_x isKindOf ["Binocular", configFile >> "CfgWeapons"]) then {
								if !(_x in (_result select _array select 4)) then {_result select _array select 4 pushBack _x};
							}else{
								if (_x isKindOf ["bipod_01_F_snd", configFile >> "CfgWeapons"]||_x isKindOf ["vn_acc_bipod_base", configFile >> "CfgWeapons"]||_x isKindOf ["vn_acc_camowrap_base", configFile >> "CfgWeapons"]) then {
									if !(_x in (_result select _array select 5)) then {_result select _array select 5 pushBack _x};
								}else{
									if (_x isKindOf ["muzzle_snds_H", configFile >> "CfgWeapons"]) then {
										if !(_x in (_result select _array select 6)) then {_result select _array select 6 pushBack _x};
									}else{
										if (_x isKindOf ["acc_pointer_IR", configFile >> "CfgWeapons"]||_x isKindOf ["acc_flashlight", configFile >> "CfgWeapons"]||_x isKindOf ["acc_flashlight_pistol", configFile >> "CfgWeapons"]) then {
											if !(_x in (_result select _array select 7)) then {_result select _array select 7 pushBack _x};
										}else{
											if !(_x in (_result select _array select 8)) then {_result select _array select 8 pushBack _x};
										};
									};
								};
							};
						};
					};
				};
			};
		}forEach (_type select 2);
	}forEach [
		["Weapons",1,(WeaponCargo _crate)],
		["Magazines",2,(magazineCargo _crate)],
		["BackPacks",3,(backPackCargo _crate)],
		["Items",4,(itemCargo _crate)]
	];
}forEach _cratesObjects;
////////////////////////
//Extract classeNames// from Larrow, bohemia's forum, modified to get SOG stuff
result = [];
filtered = [[],[],[],[],[]];
{
	_cfg = (configFile >> "CfgVehicles");
	for "_i" from 0 to ((count _cfg)-1) do { 
		if (isClass ((_cfg select _i) ) ) then { 
			_cfgName = configName (_cfg select _i); 
			_author = getText ((_cfg select _i) >> "author");
			if (
				(_author == "Savage Game Design") && 
				(_cfgName isKindOf _x) && 
				(getNumber ((_cfg select _i) >> "scope") == 2)
			) then { 
   				_side = getNumber ((_cfg select _i) >> "side"); 
   				_temp = filtered select _side; 
   				_temp set [count _temp, _cfgName ]; 
				filtered set [_side, _temp]; 
			}; 
		}; 
	};
	result pushBack _x;
	result pushBack filtered;
	filtered = [[],[],[],[],[]];
}forEach ["vn_armor_tank_base","APC_Tracked_01_base_F","vn_wheeled_truck_base","vn_wheeled_car_base","Helicopter","Plane","Ship","StaticWeapon"]; 
//BackPacks "Bag_Base",
//food "vn_magazine_provision_base"
/////////////////
	_cfg = (configFile >> "CfgWeapons"); 
	["CannonCore","vn_mgun_base",
	"vn_atgm_launcher_base","vn_Launcher_Base_F","vn_lmg","vn_m63a_lmg","vn_rifle762","vn_m16","vn_shotgun","vn_smg","vn_kbkg","vn_pistol",
	"HelmetBase","Uniform_Base","Vest_NoCamo_Base",
	"vn_acc_bipod_base","vn_optic_base","muzzle_snds_H",
	"vn_acc_bayo_base","vn_melee_base",
	"vn_itemcore","DetectorCore","Binocular"];
	//"vn_acc_camowrap_base" weapons camo //"ItemRadio" a LOT of them //"vn_bomblauncher" well, BOMBS //"vn_m79" //"vn_m63a_lmg"
/////////////////////////////
	_cfg = (configFile >> "CfgMagazines");
	["vn_lmagazine","vn_lmgmag_base","vn_riflemag_base","vn_shotgunmag_base","vn_smgmag_base","vn_pistolmag_base","vn_handgrenade_base","vn_mine_m18_mag",
		"vn_prop_base"];
/////////////
//auto FastCombat //need some stuff in NPC Kill EH to modify WMS_FC_LastKill
WMS_FC_peaceTimer = 1200;
WMS_FC_Timer = 600;
WMS_FC_LastKill = 0;
WMS_FC_FightStart = 0;
