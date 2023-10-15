/**
 * WMS_fnc_createPermanentVHL
 *
 * TNA-Community
 * https://discord.gg/Zs23URtjwF
 * © 2021 {|||TNA|||}WAKeupneo
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */

private ["_playerVHLarray","_playerArray","_targetUID","_targetOwner","_permanentVhlArray","_arrayPosition","_veh","_vehicleID","_helipadList","_helipad","_helipadOccupied"];
params[
	"_vehicleClassName",
	"_buyer",
	["_pos",[]]
];
if (WMS_MissionDebug) then {diag_log format ["[CREATE_PERMANENT_VHL]|WAK|TNA|WMS|UPDATE: _this %1", _this]};

_playerArray = [];
_playerVHLarray = [];
_helipadList = [];
_helipad = "";
_veh = ObjNull;
_targetUID = getPlayerUID _buyer;
_targetOwner = (owner _buyer);
_permanentVhlArray = profileNameSpace getVariable ["WMS_permanentVhlArray", []];
_arrayPosition = _targetUID call WMS_fnc_findUIDinVhlArray;//if (_result == -1) exitWith {"not in the array"}

////////////////////////NEEDED UPDATE///////////////////////////
/*
	"WMS_permanentVhlArray" can get very big if it contain all vehicles of all players
	Each player should have it's own _permanentVhlArray with just a reference in the general "WMS_permanentVhlArray"
	"WMS_permanentVhlArray" could contain "only" the player UID and maybe vehicles HexaID like: 
	WMS_permanentVhlArray = [
		["76561197965501020",["504b0617","a6e1c0a0","8b825bbe"]],
		["76561198008251883",["9aff3be9","9e09c0fe"]]
		];
	then use the hexaID array to find the vehicle in the player _permanentVhlArray like:
	"76561197965501020_VHLs" = [
		"76561197965501020",
		["504b0617","vn_b_wheeled_m54_repair",[10926.3,14381.5,70.0854],33.3324,0,0.942812,["76561197965501020"],"",0],
		["a6e1c0a0","vn_b_air_ch47_02_02",[10880.4,14417.5,70.5312],99.185,0,0.717694,["76561197965501020"],"",0],
		["8b825bbe","vn_b_air_uh1c_03_01",[10979.6,14472.8,69.8176],204.327,0.0472441,0.790981,["76561197965501020"],"",0]
		];
	A convertion function will be needed to convert the old "WMS_permanentVhlArray" to the new one with new playerID_VHLs:
	/////
		private _permanentVhlArray_Temp = profileNameSpace getVariable ["WMS_permanentVhlArray", []];
		profileNameSpace setVariable ["WMS_permanentVhlArray_BKP", _permanentVhlArray_Temp];
		profileNameSpace setVariable ["WMS_permanentVhlArray", []];
		{
			//export each player stuff to it's own vehicle array:
			private _playerID_Vhls = (_x select 0)+"_VHLs";
			profileNameSpace setVariable [_playerID_Vhls, _x];
			//modify _permanentVhlArray_Temp to the new format [["playerUID",["VHLhexaID"]],["playerUID",["VHLhexaID"]],["playerUID",["VHLhexaID"]]]
			private _playerVHLhexaIDs = [(_x select 0),[]];
			{
				if (count _x != 17 && {count _x != 0}) then {
					(_playerVHLhexaIDs select 1) pushBack (_x select 0);
				};
			}forEach _x;
			WMS_permanentVhlArray pushBack _playerVHLhexaIDs;
		}forEach _permanentVhlArray_Temp;
		_permanentVhlArray_Temp = [];
	/////
	if everything is fine:
	profileNameSpace setVariable ["WMS_permanentVhlArray_BKP", nil];
*/
////////////////////////NEEDED UPDATE\\\\\\\\\\\\\\\\\\\\\\\\\\

///////////////BOAT FILTER TO SPAWN ON WATER///////////////
if (_vehicleClassName isKindOf "Ship" ||_vehicleClassName isKindOf "rhs_pontoon_float") then {
	_helipadList =  nearestObjects [_buyer, ["Land_HelipadEmpty_F"], 50];
	if (count _helipadList != 0) then {
			_helipad = _helipadList select 0;
			_helipadOccupied  =  nearestObjects [(position _helipad),["car","truck","tank","air","Ship"], 4];
			if (count _helipadOccupied == 0) then {
				_pos = position _helipad;
			} else{
				_pos = position _buyer findEmptyPosition [20,100,_vehicleClassName];
			};
		}else {
			_pos = position _buyer findEmptyPosition [20,100,_vehicleClassName];
		};
	if (WMS_MissionDebug) then {diag_log format ["[CREATE_PERMANENT_VHL]|WAK|TNA|WMS|UPDATE: Looking for empty position for the Boat: %1", _pos]};
	//if (surFaceIsWater _pos) then{};
	_veh = createVehicle [_vehicleClassName, _pos, [], 0, "NONE"];
} else {
	if (count _pos == 0) then {
		_helipadList =  nearestObjects [_buyer, ["Land_HelipadEmpty_F"], 150];
		if (count _helipadList != 0) then {
			_helipad = _helipadList select 0;
			_helipadOccupied  =  nearestObjects [(position _helipad),["car","truck","tank","air"], 4];
			if (count _helipadOccupied == 0) then {
				_pos = position _helipad;
			} else{
				_pos = position _buyer findEmptyPosition [20,100,_vehicleClassName];
			};
		} else {
			_pos = position _buyer findEmptyPosition [20,100,_vehicleClassName];
		};
		if (WMS_MissionDebug) then {diag_log format ["[CREATE_PERMANENT_VHL]|WAK|TNA|WMS|UPDATE: Looking for empty position: %1", _pos]};
		if !(count _pos == 0) then {
			_veh = createVehicle [_vehicleClassName, _pos, [], 0, "NONE"];
		} else {
			_veh = createVehicle [_vehicleClassName, position _buyer, [], 100, "NONE"];
		};
	}else{
		_veh = createVehicle [_vehicleClassName, _pos, [], 0, "NONE"];
	};
};
//////////////

if !(_arrayPosition == -1) then {
	_playerArray = (_permanentVhlArray select _arrayPosition); //[_targetUID,["0a0a0a0a","1a0a0a0a","2a0a0a0a"]]
} else {
	//_permanentVhlArray pushback [_targetUID]; //OLD
	_permanentVhlArray pushback [_targetUID,[]]; //Add the player uid in the _permanentVhlArray //NEW
	profileNameSpace setVariable ["WMS_permanentVhlArray", _permanentVhlArray];
	/////NEW SYSTEM/////
	//profileNameSpace setVariable [_targetUID+"_VHLs", [_targetUID,[]]]; //create the new player vehicle array, one for each player and not one for all players
	profileNameSpace setVariable [_targetUID+"_VHLs", [_targetUID]]; //create the new player vehicle array, one for each player and not one for all players
	/////NEW SYSTEM\\\\\
	_arrayPosition = _targetUID call WMS_fnc_findUIDinVhlArray;
	_playerArray = (_permanentVhlArray select _arrayPosition);
};
_playerVHLarray = profileNameSpace getVariable [_targetUID+"_VHLs", [_targetUID]]; //NEW
WMS_permanentVehicleObjects pushBack _veh;
//_veh setOwner _buyer;
_vehicleID = call WMS_fnc_generateHexaID;
_veh setVariable ["WMS_buyerowner", _targetUID, true];
_veh setVariable ["WMS_friends", [_targetUID], true];
_veh setVariable ["WMS_vehicleid", _vehicleID, true];
_veh setVariable ["WMS_permanentvhl", true, true];
_veh setVariable ["WMS_howmanyrestarts", 0];
_vehicleID_inventory = _vehicleID + "_inventory";
_veh setVariable ["WMS_vehicleID_inventory", _vehicleID_inventory, true];
if (_veh isKindOf "tank"||_veh isKindOf "Wheeled_Apc_F") then {_veh setVariable ["ace_cookoff_enable", true, true];};
/////VEHICLE DESTROYED EH/////
_veh addMPEventHandler ["MPkilled", {
	if (isDedicated) then {
		[(_this select 0),"destroyed"] call WMS_fnc_updatePermanentVHL;
		//[(format ["a permanent vehicle (%1) has been destroyed by %2, instigator %3", (_this select 0), (_this select 1), (_this select 2)]),"VEHICLEDESTROYED_log"]call A3log;
		if (true) then {
			diag_log "|WAK|TNA|WMS|";
			diag_log format ["a permanent vehicle (%1) has been destroyed by %2, instigator %3", (_this select 0), (_this select 1), (_this select 2)];
			diag_log "|WAK|TNA|WMS|";
		};
	};
}];//params ["_unit", "_killer", "_instigator", "_useEffects"];
/////VEHICLE DESTROYED EH\\\\\
clearMagazineCargoGlobal _veh; 
clearWeaponCargoGlobal _veh; 
clearItemCargoGlobal _veh; 
clearBackpackCargoGlobal _veh;
_veh setVehicleLock "LOCKED";
_veh lockInventory true;
_smoke = "smokeShellOrange" createVehicle position _veh;
_smoke attachTo [_veh, [0,0,0]];

playSound3D [getMissionPath "Custom\Ogg\magicBus.ogg", _veh, false, position _veh, 9, 1, 0]; //keep the last number (distance) 0 !!!!

_playerVHLarray pushback [_vehicleID,_vehicleClassName,_pos,(direction _veh),0,1,[_targetUID],"",0]; //OLD but new array unic to player
(_playerArray select 1) pushback _vehicleID;
_permanentVhlArray set [_arrayPosition, _playerArray];
profileNameSpace setVariable [_targetUID+"_VHLs", _playerVHLarray]; //full vehicle array unic to the player
profileNameSpace setVariable ["WMS_permanentVhlArray", _permanentVhlArray]; //permanent vehicle array for all player with only _vehicleID
profileNameSpace setVariable [_vehicleID_inventory, [[],[],[],[]]]; //vehicle inventory

if (_veh isKindOf "UGV_01_base_F"||_veh isKindOf "UAV") then {createVehicleCrew _veh};
[_veh,_targetOwner, false]call WMS_fnc_initVehicleAddAction;

//"ToolKit"
_forceAmmoFacilities = getArray(missionConfigFile >> "CfgForceAmmoFacilities" >> "vehicles");
_forceAmmoInv = getArray(missionConfigFile >> "CfgForceAmmoFacilities" >> "inventory");
if ((typeOf _veh) in _forceAmmoFacilities) then {
	if (WMS_MissionDebug) then {diag_log format ["|WAK|TNA|WMS| Creating %1 as Ammo Facility", _veh];};
	_veh setVariable ["ace_rearm_isSupplyVehicle", true, true];
	{_veh addItemCargoGlobal [_x select 0,_x select 1];}forEach _forceAmmoInv;
};

_forceRepairFacilities = getArray(missionConfigFile >> "CfgForceRepairFacilities" >> "vehicles");
_forceRepairInv = getArray(missionConfigFile >> "CfgForceRepairFacilities" >> "inventory");
if ((typeOf _veh) in _forceRepairFacilities) then {
	if (WMS_MissionDebug) then {diag_log format ["|WAK|TNA|WMS| Creating %1 as Repair Facility", _veh];};
	_veh setVariable ["ACE_isRepairVehicle", true, true];
	{_veh addItemCargoGlobal [_x select 0,_x select 1];}forEach _forceRepairInv;
};

_forceMedicalFacilities = getArray(missionConfigFile >> "CfgForceMedicalFacilities" >> "vehicles");
_forceMedicalInv = getArray(missionConfigFile >> "CfgForceMedicalFacilities" >> "inventory");
if ((typeOf _veh) in _forceMedicalFacilities) then {
	if (WMS_MissionDebug) then {diag_log format ["|WAK|TNA|WMS| Creating %1 as Medical Facility", _veh];};
	_veh setVariable ["ace_medical_isMedicalFacility", true, true];
	_veh setVariable ["WMS_resetFatigueTimer", time, true];
	{_veh addItemCargoGlobal [_x select 0,_x select 1];}forEach _forceMedicalInv;
	//[player, nil] call ace_advanced_fatigue_fnc_handlePlayerChanged; //addAction "Reset Fatigue" for owner;
	[ //params ["_target", "_caller", "_actionId", "_arguments"];
		_veh,
		[
			"<t size='1' color='#528ffa'>Reset ACE Fatigue</t>",
			"
			[(_this select 1), objNull] call ace_advanced_fatigue_fnc_handlePlayerChanged;
			(_this select 0) setVariable ['WMS_resetFatigueTimer', time, true];
			",
			[], //argument accessible in the script (_this select 3)
			1,
			true,
			true,
			"",
			//"((getplayerUID _this) == (_target getVariable ['WMS_BuyerOwner', 0]) && (vehicle _this == _this))",
			"('ACE_personalAidKit' in (items _this)) &&
			{(getplayerUID _this) == (_target getVariable ['WMS_BuyerOwner', 0])} &&
			{(time >= (1800 + (_target getVariable ['WMS_resetFatigueTimer', time])))} && 
			{(vehicle _this == _this)}",
			5
		]
	] remoteExec [
		"addAction",
		0, //0 for all players //2 server only //-2 everyone but the server
		true //JIP
	];
};

private _clusterVhl = getArray(missionConfigFile >> "CfgPylonVhl" >> "vhl");
private _clusterMags = getArray(missionConfigFile >> "CfgBlackListedBomb" >> "mags");
if (_vehicleClassName in _clusterVhl) then {	
	_veh setVariable ["ace_pylons_magazineBlacklist", _clusterMags];
};

//////////CUSTOM VEHICLES//////////
[_veh] call WMS_fnc_vehicleCustomize;
//////////CUSTOM VEHICLES END//////////