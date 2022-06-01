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

private ["_playerArray","_targetUID","_targetOwner","_permanentVhlArray","_arrayPosition","_veh","_vehicleID","_helipadList","_helipad","_helipadOccupied"];
params[
	"_vehicleClassName",
	"_buyer",
	["_pos",[]]
];
if (WMS_MissionDebug) then {diag_log format ["[CREATE_PERMANENT_VHL]|WAK|TNA|WMS|UPDATE: _this %1", _this]};

_playerArray = [];
_helipadList = [];
_helipad = "";
_veh = ObjNull;
_targetUID = getPlayerUID _buyer;
_targetOwner = (owner _buyer);
_permanentVhlArray = profileNameSpace getVariable ["WMS_permanentVhlArray", []];
_arrayPosition = _targetUID call WMS_fnc_findUIDinVhlArray;//if (_result == -1) exitWith {"not in the array"}
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
};

if !(_arrayPosition == -1) then {
		_playerArray = (_permanentVhlArray select _arrayPosition); //[_targetUID,["0a0a0a0a",_vehicleClassName,[0,0,0],359,0,[[],[],[],[]]]]
	} else {
		_permanentVhlArray pushback [_targetUID];
		profileNameSpace setVariable ["WMS_permanentVhlArray", _permanentVhlArray];
		//saveProfileNameSpace;
		_arrayPosition = _targetUID call WMS_fnc_findUIDinVhlArray;
		_playerArray = (_permanentVhlArray select _arrayPosition);
	};

//_veh = createVehicle [_vehicleClassName, _pos, [], 0, "NONE"];
/*if (count _pos == 0) then {
	_pos = position _buyer findEmptyPosition [5,75,_vehicleClassName];
	if !(count _pos == 0) then {
		_veh = createVehicle [_vehicleClassName, _pos, [], 0, "NONE"];
	} else {
		_veh = createVehicle [_vehicleClassName, position _buyer, [], 75, "NONE"];
	};
};*/
_veh setDir (random 359);
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
			_veh addMPEventHandler ["MPkilled", {
					[(_this select 0),"destroyed"] remoteExec ['WMS_fnc_updatePermanentVHL', 2];
					//[(format ["a permanent vehicle (%1) has been destroyed by %2, instigator %3", (_this select 0), (_this select 1), (_this select 2)]),"VEHICLEDESTROYED_log"]call A3log;
					if (true) then {
						if (WMS_MissionDebug) then {diag_log "|WAK|TNA|WMS|";};
						if (WMS_MissionDebug) then {diag_log format ["a permanent vehicle (%1) has been destroyed by %2, instigator %3", (_this select 0), (_this select 1), (_this select 2)];};
						if (WMS_MissionDebug) then {diag_log "|WAK|TNA|WMS|";};
						};
				}
			];//params ["_unit", "_killer", "_instigator", "_useEffects"];

			/*_veh addEventHandler ["ContainerClosed", { //DO NOT WORK
					diag_log "|WAK|TNA|WMS|";
					diag_log format ["permanent vehicle (%1) inventory acces by  %2", (_this select 0), (_this select 1)];
					diag_log "|WAK|TNA|WMS|";
					//params ["_container", "_unit"];
					(_this select 0) remoteExec ['WMS_fnc_updatePermanentVHL', 2];
				}
			];*/
clearMagazineCargoGlobal _veh; 
clearWeaponCargoGlobal _veh; 
clearItemCargoGlobal _veh; 
clearBackpackCargoGlobal _veh;
_veh setVehicleLock "LOCKED";
_veh lockInventory true;
_smoke = "smokeShellOrange" createVehicle position _veh;
_smoke attachTo [_veh, [0,0,0]];
	//add sound/music here
//playsound "magicbus"; //no position for this on
playSound3D [getMissionPath "Custom\Ogg\magicBus.ogg", _veh, false, position _veh, 9, 1, 0]; //keep the last number (distance) 0 !!!!
//_playerArray pushback [_vehicleID,_vehicleClassName,_pos,(direction _veh),0,[[],[],[],[]]]; //OLD
//_playerArray pushback [_vehicleID,_vehicleClassName,_pos,(direction _veh),0,1,[_targetUID],[[],[],[],[]]]; //NEW [vID,classename,position,direction,damage,fuel,[friends],inventory]
_playerArray pushback [_vehicleID,_vehicleClassName,_pos,(direction _veh),0,1,[_targetUID],_vehicleID_inventory,0]; //NEW [vID,classename,position,direction,damage,fuel,[friends],inventory,_howmanyrestarts]
_permanentVhlArray set [_arrayPosition, _playerArray];
profileNameSpace setVariable ["WMS_permanentVhlArray", _permanentVhlArray];
profileNameSpace setVariable [_vehicleID_inventory, [[],[],[],[]]];
//saveProfileNameSpace;

if (_veh isKindOf "UGV_01_base_F"||_veh isKindOf "UAV") then {createVehicleCrew _veh};
[_veh,_targetOwner, false]call WMS_fnc_initVehicleAddAction;

//"ToolKit"
_forceAmmoFacilities = getArray(missionConfigFile >> "CfgForceAmmoFacilities" >> "vehicles");
if ((typeOf _veh) in _forceAmmoFacilities) then {
	if (WMS_MissionDebug) then {diag_log format ["|WAK|TNA|WMS| Creating %1 as Ammo Facility", _veh];};
	_veh setVariable ["ace_rearm_isSupplyVehicle", true, true];
	_veh addItemCargoGlobal ["rhs_mag_an_m14_th3",10];
	_veh addItemCargoGlobal ["rhs_charge_tnt_x2_mag",10];
	_veh addItemCargoGlobal ["DemoCharge_Remote_Mag",10];
	_veh addItemCargoGlobal ["ACE_DefusalKit",4];
	_veh addItemCargoGlobal ["ACE_Clacker",4];
	_veh addItemCargoGlobal ["ACE_RangeTable_82mm",3];
	_veh addItemCargoGlobal ["ACE_artilleryTable",3];
	_veh addItemCargoGlobal ["ACE_RangeCard",3];
};

_forceRepairFacilities = getArray(missionConfigFile >> "CfgForceRepairFacilities" >> "vehicles");
if ((typeOf _veh) in _forceRepairFacilities) then {
	if (WMS_MissionDebug) then {diag_log format ["|WAK|TNA|WMS| Creating %1 as Repair Facility", _veh];};
	_veh setVariable ["ACE_isRepairVehicle", true, true];
	_veh addItemCargoGlobal ["ToolKit",1];
	_veh addItemCargoGlobal ["ACE_EntrenchingTool",5];
	_veh addItemCargoGlobal ["ACE_wirecutter",5];
	_veh addItemCargoGlobal ["SatchelCharge_Remote_Mag",10];
	_veh addItemCargoGlobal ["ACE_rope15",2];
	_veh addItemCargoGlobal ["ACE_rope36",2];
	_veh addItemCargoGlobal ["ACE_rope6",2];
};

_forceMedicalFacilities = getArray(missionConfigFile >> "CfgForceMedicalFacilities" >> "vehicles");
if ((typeOf _veh) in _forceMedicalFacilities) then {
	if (WMS_MissionDebug) then {diag_log format ["|WAK|TNA|WMS| Creating %1 as Medical Facility", _veh];};
	_veh addItemCargoGlobal ["ACE_personalAidKit",1];
	_veh addItemCargoGlobal ["ACE_bloodIV_500",5];
	_veh addItemCargoGlobal ["ACE_bloodIV_250",10];
	_veh addItemCargoGlobal ["ACE_elasticBandage",10];
	_veh addItemCargoGlobal ["ACE_fieldDressing",10];
	_veh addItemCargoGlobal ["ACE_splint",10];
	_veh addItemCargoGlobal ["ACE_epinephrine",5];
	_veh addItemCargoGlobal ["ACE_morphine",5];
	_veh addItemCargoGlobal ["vtx_stretcher_item",2];


	_veh setVariable ["ace_medical_isMedicalFacility", true, true];
	_veh setVariable ["WMS_resetFatigueTimer", time, true];
	//[player, nil] call ace_advanced_fatigue_fnc_handlePlayerChanged; //addAction "Reset Fatigue" for owner;
	[ //params ["_target", "_caller", "_actionId", "_arguments"];
		_veh,
		[
			"<t size='1' color='#528ffa'>Reset ACE Fatigue</t>",
			"
			[(_this select 1), nil] call ace_advanced_fatigue_fnc_handlePlayerChanged;
			(_this select 0) setVariable ['WMS_resetFatigueTimer', time, true];
			",
			[], //argument accessible in the script (_this select 3)
			1,
			true,
			true,
			"",
			//"((getplayerUID _this) == (_target getVariable ['BuyerOwner', 0]) && (vehicle _this == _this))",
			"('ACE_personalAidKit' in (items _this)) &&
			{(time >= (3600 + (_target getVariable ['WMS_resetFatigueTimer', time])))} && 
			{(vehicle _this == _this)}",
			5
		]
	] remoteExec [
		"addAction",
		0, //0 for all players //2 server only //-2 everyone but the server
		true //JIP
	];
};

//////////CUSTOM VEHICLES//////////
[_veh] call WMS_fnc_vehicleCustomize;
//////////CUSTOM VEHICLES END//////////