/**
 * WMS_fnc_createNONpermanentVHL
 *
 * TNA-Community
 * https://discord.gg/Zs23URtjwF
 * © 2021 {|||TNA|||}WAKeupneo
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */

private ["_targetUID","_targetOwner","_permanentVhlArray","_arrayPosition","_veh","_vehicleID","_helipadList","_helipad","_helipadOccupied"];
params[
	"_vehicleClassName",
	"_buyer",
	["_pos",[]]
];
if (WMS_MissionDebug) then {diag_log format ["[CREATE_NONpermanent_VHL]|WAK|TNA|WMS|UPDATE: _this %1", _this]};

_helipadList = [];
_helipad = "";
_veh = ObjNull;
_targetUID = getPlayerUID _buyer;
_targetOwner = (owner _buyer);

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
//_veh setOwner _buyer;
_vehicleID = call WMS_fnc_generateHexaID;
_veh setVariable ["WMS_buyerowner", _targetUID, true];
_veh setVariable ["WMS_friends", [_targetUID], true];
_veh setVariable ["WMS_vehicleid", _vehicleID, true];
_veh setVariable ["WMS_permanentvhl", false, true];
_veh setVariable ["WMS_howmanyrestarts", 1000];
clearMagazineCargoGlobal _veh; 
clearWeaponCargoGlobal _veh; 
clearItemCargoGlobal _veh; 
clearBackpackCargoGlobal _veh;
_veh setVehicleLock "UNLOCKED";
_smoke = "smokeShellBlue" createVehicle position _veh;
_smoke attachTo [_veh, [0,0,0]];
//add sound/music here
//playsound "magicbus"; //no position for this on
playSound3D [getMissionPath "Custom\Ogg\magicBus.ogg", _veh, false, position _veh, 9, 1, 0]; //keep the last number (distance) 0 !!!!

private _clusterVhl = getArray(missionConfigFile >> "CfgPylonVhl" >> "vhl");
private _clusterMags = getArray(missionConfigFile >> "CfgBlackListedBomb" >> "mags");
if (_vehicleClassName in _clusterVhl) then {	
	_veh setVariable ["ace_pylons_magazineBlacklist", _clusterMags];
};

//////////CUSTOM VEHICLES//////////
//[_veh] call WMS_fnc_vehicleCustomize;
//////////CUSTOM VEHICLES END//////////