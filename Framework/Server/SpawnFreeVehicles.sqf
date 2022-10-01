/**
 * SpawnFreeVehicles
 *
 * TNA-Community
 * https://discord.gg/Zs23URtjwF
 * © 2021 {|||TNA|||}WAKeupneo
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
_postExile_Vehicles = [
	[//_this select 0 = Military
		"I_G_Quadbike_01_F",
		"I_E_Quadbike_01_F",
		"I_G_Quadbike_01_F",
		"I_E_Quadbike_01_F",
		"rhsusf_mrzr4_w_mud",
		"rhsusf_mrzr4_w_mud",
		"rhsusf_mrzr4_w_mud",
		"rhsgref_nat_uaz_open",
		"rhsgref_nat_uaz_open",
		"I_LT_01_scout_F",
		"rhsgref_hidf_m113a3_unarmed",
		"rhsusf_m113_usarmy_medical",
		//"UK3CB_BAF_MAN_HX58_Repair_Green",
		"rhsusf_m113_usarmy_supply"
	],
	[//_this select 1 = Civilian
		"C_Kart_01_F",
		"C_Quadbike_01_F",
		"C_Quadbike_01_F",
		"C_Quadbike_01_F",
		"C_Tractor_01_F",
		"C_Tractor_01_F",
		"C_Van_01_fuel_F",
		"C_Hatchback_01_F",
		"C_Offroad_02_unarmed_F",
		//"UK3CB_Civ_LandRover_Soft_Blue_A",
		"C_Van_01_transport_F",
		"C_Offroad_01_F",
		"C_IDAP_Truck_02_water_F",
		"RHS_Ural_Open_Civ_02"
	],
	[//_this select 2 = Air
		"C_Heli_Light_01_civil_F",
		"C_Heli_Light_01_civil_F",
		"C_Heli_Light_01_civil_F",
		"C_Heli_Light_01_civil_F",
		"C_Heli_Light_01_civil_F",
		"RHS_Mi8t_civilian",
		"RHS_Mi8t_civilian",
		"RHS_UH60M_MEV2",
		"RHS_UH60M_MEV2",
		"RHS_CH_47F_cargo"
	]
];

_postExile_Zones = [];
_markerVehicleCIV = ["respawn_motor"];
_markerVehicleAIR = ["respawn_air"];
_markerVehicleMIL = ["respawn_armor"];
{
	if (markertype _x in _markerVehicleCIV) then {
		_postExile_Zones pushback [getMarkerPos _x,600,"civ"];		
	};
	if (markertype _x in _markerVehicleAIR) then {
		_postExile_Zones pushback [getMarkerPos _x,300,"air"];		
	};
	if (markertype _x in _markerVehicleMIL) then {
		_postExile_Zones pushback [getMarkerPos _x,300,"mil"];		
	};
}forEach allMapMarkers;

_postExile_Spawn_Zones 	= true;
_postExile_Spawn_Rad 	= 6;
_postExile_MilAmmo 		= 0; //0 = empty, 1 = full
_postExile_Mil_count	= 2;
_postExile_Civ_count	= 10;
_postExile_Air_count	= 1;
_postExile_setDamageMax = 0.6;
_postExile_setGasMax	= 0.40;
_price = 799;
_display = "<t size='0.8' color='#44f708'>Full Repair for 799!</t>";

if (_postExile_Spawn_Zones) then {
	_postExile_spawn_count = 0;
	_postExile_Vehicles_List = [];
	{
		switch (_x select 2) do {
			case "mil" : {_postExile_spawn_count = _postExile_Mil_count; _postExile_Vehicles_List = (_postExile_Vehicles select 0);_price = 2499;_display = "<t size='0.8' color='#44f708'>Full Repair for 2499!</t>";};
			case "civ" : {_postExile_spawn_count = _postExile_Civ_count; _postExile_Vehicles_List = (_postExile_Vehicles select 1);_price = 799;_display = "<t size='0.8' color='#44f708'>Full Repair for 799!</t>";};
			case "air" : {_postExile_spawn_count = _postExile_Air_count; _postExile_Vehicles_List = (_postExile_Vehicles select 2); _postExile_Spawn_Rad = _postExile_Spawn_Rad*1.5;_price = 1899;_display = "<t size='0.8' color='#44f708'>Full Repair for 1899!</t>";};
		};
		_vhl = objNull;
		for "_i" from 1 to _postExile_spawn_count do {
			_pos = [(_x select 0), 1, (_x select 1), _postExile_Spawn_Rad, 0] call BIS_fnc_findSafePos; //[center, minDist, maxDist, objDist, waterMode, maxGrad, shoreMode, blacklistPos, defaultPos] call BIS_fnc_findSafePos
			if ((count _pos) == 3) then { //successful findSafePos result is [x,y], not [x,y,z]
				_pos = [[[(_x select 0), (_x select 1)]],[]] call BIS_fnc_randomPos;
				_vhl = createVehicle [(selectRandom _postExile_Vehicles_List), _pos, [], 50, "NONE"]; 
				if (WMS_MissionDebug) then {diag_log format ["[VHL RANDOM SPAWN BUSTED]|WAK|TNA|WMS| Vehicle = %1 @ %2", _vhl, _pos]};
			} else {
				_vhl = (selectRandom _postExile_Vehicles_List) createVehicle _pos;
			};
			_vhl setVariable ['freeVehiclesrepairPrice', _price, true];
			_vhl setDir (random 359);
			_vhl setDamage (random _postExile_setDamageMax);
			_vhl setFuel (random _postExile_setGasMax);
			_vhl setVehicleAmmo _postExile_MilAmmo;
			clearMagazineCargoGlobal _vhl; 
			clearWeaponCargoGlobal _vhl; 
			clearItemCargoGlobal _vhl; 
			clearBackpackCargoGlobal _vhl;  
			if (WMS_MissionDebug) then {diag_log format ["[VHL RANDOM SPAWN]|WAK|TNA|WMS| Vehicle spawned = %1 @ %2", _vhl, _pos]};
			
			[
				_vhl,
				[
					_display,//_display,
					"
						_target = _this select 0; _caller = _this select 1;
						_target setDamage 0;
						[_caller, ((_this select 3)select 0)] remoteExec ['WMS_fnc_smallTransactions', 2];
						(_this select 0) removeaction (_this select 2);

					", //params ["_target", "_caller", "_actionId", "_arguments"]; 
					[_price], //argument accessible in the script ((_this select 3)select 0)
					1,
					true,
					true,
					"",
					"
					(alive _target) &&
					{((_this getVariable ['exileMoney', -1]) > (_target getVariable ['freeVehiclesrepairPrice', 9999]))} &&
					{(vehicle _this == _this)};
					",//condition: _target = object, _this = caller
					5
				]
			] remoteExec [
				"addAction",
				0, //-2 doesnt work here
				true
			];
			
_forceAmmoFacilities = getArray(missionConfigFile >> "CfgForceAmmoFacilities" >> "vehicles");
if ((typeOf _vhl) in _forceAmmoFacilities) then {
	if (WMS_MissionDebug) then {diag_log format ["|WAK|TNA|WMS| Creating %1 as Ammo Facility", _vhl];};
	_vhl setVariable ["ace_rearm_isSupplyVehicle", true, true];
};

_forceRepairFacilities = getArray(missionConfigFile >> "CfgForceRepairFacilities" >> "vehicles");
if ((typeOf _vhl) in _forceRepairFacilities) then {
	if (WMS_MissionDebug) then {diag_log format ["|WAK|TNA|WMS| Creating %1 as Repair Facility", _vhl];};
	_vhl setVariable ["ACE_isRepairVehicle", true, true];
};
			_forceMedicalFacilities = getArray(missionConfigFile >> "CfgForceMedicalFacilities" >> "vehicles");
			if ((typeOf _vhl) in _forceMedicalFacilities) then {	
				if (WMS_MissionDebug) then {diag_log format ["|WAK|TNA|WMS| Creating %1 as Medical Facility", _vhl];};
				_vhl setVariable ["ace_medical_isMedicalFacility", true, true];
				_vhl setVariable ["WMS_resetFatigueTimer", time, true];
				//[player, nil] call ace_advanced_fatigue_fnc_handlePlayerChanged; //addAction "Reset Fatigue" for owner;
				[ //params ["_target", "_caller", "_actionId", "_arguments"];
					_vhl,
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
		};
	} forEach _postExile_Zones;
};