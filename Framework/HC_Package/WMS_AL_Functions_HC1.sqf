/**
* WMS_AL_functions.sqf
*
* TNA-Community
* https://discord.gg/Zs23URtjwF
* © 2022 {|||TNA|||}WAKeupneo
*
* This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
* To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
* Do Not Re-Upload
*/
/*
	WMS Ambient Life (civilian by default) should provide some roaming NPC driving around the map and later on probably flying.
	Mostly build to fill empty map running with DFO standalone, would be useless with WMS_InfantryProgram since it use it's own roaming system.
	You can obviously use armed vehicles and change the faction to get hostile roaming units.
	Combat Ready (Optional);
	
	// Start Ambient Life from initServer.sqf
	if (true)then {execVM "WMS_AL_Functions.sqf"};
*/

WMS_AL_Version		= "v0.3xBeta_HCVersion_2023JUL13";
WMS_AmbientLife		= true;
WMS_AL_Standalone	= true; //Keep true if you don't use WMS_DFO or WMS_InfantryProgram
WMS_AL_LOGs			= true; //Debug
WMS_AL_IncludeLoc	= true; //will include "nameLocal" locations in the position list
WMS_AL_StripOffUnit = true; //Remove or not NPC loadout when they die
WMS_AL_LockVehicles = true; //lock vehicles for players
WMS_AL_VHLmax		= 35; //Max vehicles (all included) running at the same time
WMS_AL_UnitMax		= 35; //Max units (groups if _CombatBehav true) patroling at the same time
WMS_AL_VhlBalance	= [0,2,0,2,1,2,1,2]; //0 = AIR, 1 = GROUND, 2 = SEA //Random select at vehicle creation
WMS_AL_Skills		= [0.8, 0.7, 0.2, 0.3, 0.3, 0.6, 0, 0.5, 0.5]; //"spotDistance","spotTime","aimingAccuracy","aimingShake","aimingSpeed","reloadSpeed","courage","commanding","general"
/*
//VANILLA
WMS_AL_CombatBehav	= false;
WMS_AL_Faction		= CIVILIAN;
WMS_AL_Units		= [//infantry classname, do not mix factions!
						"C_man_p_beggar_F","C_man_1","C_Man_casual_1_F","C_Man_casual_2_F","C_Man_casual_3_F","C_Man_casual_4_F","C_Man_casual_5_F","C_Man_casual_6_F","C_man_polo_1_F","C_man_polo_2_F","C_man_polo_3_F","C_man_polo_4_F","C_man_polo_5_F","C_man_polo_6_F",
						"C_Man_ConstructionWorker_01_Black_F","C_Man_ConstructionWorker_01_Blue_F","C_Man_ConstructionWorker_01_Red_F","C_Man_ConstructionWorker_01_Vrana_F","C_man_p_fugitive_F","C_man_p_shorts_1_F","C_man_hunter_1_F","C_Man_Paramedic_01_F","C_Man_UtilityWorker_01_F"
					]; 
WMS_AL_Vehicles		= [[ //[[AIR],[GROUND],[SEA]]
						"C_Heli_Light_01_civil_F","C_IDAP_Heli_Transport_02_F","C_Heli_light_01_digital_F","C_Heli_light_01_shadow_F"
					],[
						"C_Van_01_fuel_F","C_Hatchback_01_F","C_Hatchback_01_sport_F","C_Offroad_02_unarmed_F","C_Truck_02_transport_F","C_Truck_02_covered_F","C_Offroad_01_F","C_Offroad_01_comms_F","C_Offroad_01_repair_F","C_Quadbike_01_F","C_SUV_01_F","C_Tractor_01_F","C_Van_01_transport_F","C_Van_01_box_F","C_Van_02_medevac_F","C_Van_02_transport_F"
					],[
						"C_Boat_Civil_01_F","C_Boat_Civil_01_police_F","C_Boat_Civil_01_rescue_F","C_Rubberboat","C_Boat_Transport_02_F","C_Scooter_Transport_01_F"
					]];
*/
//SOG Prairie Fire
WMS_AL_CombatBehav	= false;
WMS_AL_Faction		= CIVILIAN;
WMS_AL_Units		= [//infantry classname, do not mix factions!
						"vn_c_men_22","vn_c_men_29","vn_c_men_30","vn_c_men_32","vn_c_men_18","vn_c_men_06","vn_c_men_08","vn_c_men_01","vn_c_men_03","vn_c_men_09","vn_c_men_11"
					]; 
WMS_AL_Vehicles		= [[ //[[AIR],[GROUND],[SEA]]
						"vn_b_air_uh1b_01_09","vn_b_air_uh1d_04_09","RHS_Mi8amt_civilian","C_Heli_Light_01_civil_F","rhs_uh1h_idap"
					],[
						"vn_c_bicycle_02","vn_c_car_02_01","vn_c_bicycle_02","vn_c_car_03_01","vn_c_bicycle_02","vn_c_car_01_01","vn_c_bicycle_02","vn_c_car_04_01"
					],[
						"vn_c_boat_01_03","vn_c_boat_01_01","vn_c_boat_02_03","vn_c_boat_02_04","vn_c_boat_08_02","vn_c_boat_07_02","vn_c_boat_07_01","vn_c_boat_08_01"
					]];

/*
//GM
WMS_AL_CombatBehav	= false;
WMS_AL_Faction		= CIVILIAN;
WMS_AL_Units		= [//array of classnames
						"gm_gc_civ_man_02_80_gry","gm_gc_civ_man_01_80_blk","gm_gc_civ_man_03_80_blu","gm_gc_civ_man_02_80_brn","gm_gc_civ_man_03_80_grn","gm_gc_civ_man_03_80_gry","gm_gc_civ_pilot_80_blk","gm_gc_pol_officer_80_blu","gm_gc_civ_man_04_80_blu",
						"gm_gc_civ_man_04_80_gry","gm_ge_ff_man_80_orn","gm_ge_dbp_man_01_80_blu","gm_ge_adak_pilot_80_sar","gm_ge_pol_officer_80_grn","gm_ge_pol_patrol_80_blk"
						]; 
WMS_AL_Vehicles		= [[ //array of arrays or classnames //[[AIR],[GROUND],[SEA]]
						"gm_gc_civ_l410s_salon","gm_ge_pol_bo105m_vbh","gm_gc_civ_mi2p","gm_ge_adak_bo105m_vbh","gm_gc_civ_mi2sr"
					],[
						"gm_gc_civ_p601","gm_gc_ff_p601","gm_gc_pol_p601","gm_gc_dp_p601","gm_gc_civ_ural375d_cargo","gm_xx_civ_bicycle_01","gm_ge_civ_u1300l","gm_ge_civ_typ1200","gm_ge_ff_typ1200","gm_ge_pol_typ1200","gm_ge_dbp_typ1200","gm_ge_ff_u1300l_firefighter"
					],[
						"C_Boat_Civil_01_F","C_Boat_Civil_01_police_F","C_Boat_Civil_01_rescue_F","C_Rubberboat","C_Boat_Transport_02_F","C_Scooter_Transport_01_F" //No civilan boats in GM
					]];
///////////////////////
//GM OPFOR
WMS_AL_CombatBehav	= true;
WMS_AL_Faction		= OPFOR;
WMS_AL_Units		= [//array of classnames
						"gm_gc_army_antiair_mpiak74n_9k32m_80_str","gm_gc_army_antitank_mpiak74n_rpg7_80_str","gm_gc_army_machinegunner_lmgrpk_80_str","gm_gc_army_machinegunner_pk_80_str","gm_gc_army_medic_mpiak74n_80_str",
						"gm_gc_army_radioman_mpiak74n_80_str","gm_gc_army_rifleman_mpiak74n_80_str","gm_gc_army_sf_engineer_mpikms72_80_str","gm_gc_army_sf_marksman_svd_80_str","gm_gc_army_sf_demolition_pm63_80_str"
						]; 
WMS_AL_Vehicles		= [[ //array of arrays or classnames //[[AIR],[GROUND],[SEA]]
						"gm_gc_airforce_mi2p","gm_gc_airforce_mi2sr","gm_gc_airforce_mi2t","gm_gc_airforce_mi2urn","gm_gc_airforce_mi2us","gm_gc_airforce_l410t"
					],[
						"gm_gc_army_brdm2um","gm_gc_army_btr60pa","gm_gc_army_btr60pb","gm_gc_army_btr60pu12","gm_gc_army_p601","gm_gc_army_uaz469_cargo","gm_gc_army_ural4320_reammo","gm_gc_army_ural375d_refuel","gm_gc_army_ural44202","gm_gc_army_ural4320_cargo","gm_gc_army_ural4320_repair","gm_pl_army_ot64a",
						"gm_pl_army_pt76b","gm_pl_army_t55","gm_pl_army_t55a","gm_pl_army_t55ak","gm_pl_army_uaz469_dshkm","gm_pl_army_ural375d_mlrs","gm_pl_army_2p16","gm_pl_army_bmp1sp2","gm_pl_army_brdm2","gm_pl_army_zsu234v1"
					],[
						"O_Boat_Transport_01_F","O_Boat_Armed_01_hmg_F","O_Boat_Transport_01_F" //No civilan boats in GM
					]];
///////////////////////
//RHS
WMS_AL_CombatBehav	= true;
WMS_AL_Faction		= OPFOR;
WMS_AL_Units		= [//array of classnames
						"rhs_vdv_mflora_at","rhs_vdv_mflora_arifleman_rpk","rhs_vdv_mflora_efreitor","rhs_vdv_mflora_engineer","rhs_vdv_mflora_machinegunner","rhs_vdv_mflora_marksman","rhs_vdv_mflora_medic","rhs_vdv_mflora_rifleman","rhs_vdv_mflora_grenadier","rhs_vdv_mflora_sergeant"
						]; 
WMS_AL_Vehicles		= [[ //array of arrays or classnames //[[AIR],[GROUND],[SEA]]
						"RHS_Mi8T_vdv","RHS_Mi8mt_Cargo_vdv","rhs_ka60_c","RHS_Mi8mt_vvsc"
					],[
						"rhs_btr60_vdv","rhs_btr80a_vdv","rhs_tigr_3camo_vdv","rhs_tigr_m_3camo_vdv","rhs_tigr_sts_3camo_vdv","rhs_uaz_open_vdv",
						"rhs_uaz_vdv","rhs_bmd1k","rhsgref_BRDM2UM_vdv","rhs_gaz66_vdv","rhs_gaz66o_vdv","rhs_gaz66_r142_vdv","rhs_gaz66_ap2_vdv","rhs_gaz66_repair_vdv","rhs_kamaz5350_flatbed_cover_vdv","rhs_kamaz5350_flatbed_vdv",
						"rhs_kraz255b1_cargo_open_vdv","rhs_kraz255b1_fuel_vdv","RHS_Ural_Fuel_VDV_01","RHS_Ural_Ammo_VDV_01","RHS_Ural_Open_VDV_01","rhs_zil131_vdv","rhs_zil131_open_vdv","rhs_brm1k_tv","rhs_t72bb_tv","rhs_t80","rhs_t90_tv"
					],[
						"O_Boat_Transport_01_F","O_Boat_Armed_01_hmg_F","O_Boat_Transport_01_F"
					]];
///////////////////////
//RHS
WMS_AL_CombatBehav	= true;
WMS_AL_Faction		= BLUFOR;
WMS_AL_Units		= [//array of classnames
						
						]; 
WMS_AL_Vehicles		= [[ //array of arrays or classnames //[[AIR],[GROUND],[SEA]]
						
					],[
						
					],[
						
					]];
*/
WMS_AL_AceIsRunning = true; //Automatic //Not, in this version
WMS_AL_LastUsedPos	= [0,0,0]; //Dynamic
WMS_AL_Running		= [[],[]]; //array of arrays of data [[VEHICLES],[INFANTRY]] //[HexaID,time,group,vehicle]

///////////////////////////////////////
//Variables
if (WMS_AL_Standalone) then {
	WMS_SeaPos = [];
	WMS_Roads = []; //array of roads //Dynamic //pushBack //You can put yours if you want but the system will pushback roads here
		//WMS_exileFireAndForget = false;
	WMS_AMS_MaxGrad 	= 0.15;
		//WMS_exileToastMsg 	= false; //Exile Mod Notifications
	WMS_Pos_Locals 		= []; //AutoScan
	WMS_Pos_Villages	= []; //AutoScan
	WMS_Pos_Cities 		= []; //AutoScan
	WMS_Pos_Capitals 	= []; //AutoScan
		//WMS_Pos_Forests 	= []; //DIY, if no position, back to random _pos
		//WMS_Pos_Military 	= []; //DIY, if no position, back to random _pos
		//WMS_Pos_Factory 	= []; //DIY, if no position, back to random _pos
		//WMS_Pos_Custom	 	= []; //DIY, if no position, back to random _pos
};
///////////////////////////////////////
//Standalone stuff
if (WMS_AL_Standalone) then {
	WMS_fnc_GenerateHexaID = {	//will be used to find the mission data in arrays
		private _hexaBase = [0,1,2,3,4,5,6,7,8,9,"a","b","c","e","e","f"];
		private _hexaArray = [];
		for "_i" from 1 to 8 do {
			_hexaArray pushBack	(selectRandom _hexaBase);
		};
		private _MissionHexaID = format ["%1%2%3%4%5%6%7%8",(_hexaArray select 0),(_hexaArray select 1),(_hexaArray select 2),(_hexaArray select 3),(_hexaArray select 4),(_hexaArray select 5),(_hexaArray select 6),(_hexaArray select 7)];
		if (WMS_AL_LOGs) then {diag_log format ['|WAK|TNA|WMS|WMS_fnc_AL_generateHexaID _MissionHexaID %1', _MissionHexaID]};
		_MissionHexaID
	};
	WMS_fnc_CollectPos = { //at server launch
		if (WMS_AL_LOGs) then {diag_log format ['|WAK|TNA|WMS|WMS_fnc_AL_CollectPos time %1', time]};
		private _worldCenter 	= [worldsize/2,worldsize/2,0]; 
		private _worldDiameter 	= ((worldsize/2)*1.413);
		if (WMS_AL_LOGs) then {Diag_log '|WAK|TNA|WMS|[AL] collecting LOCALS positions'};
		{WMS_Pos_Locals pushback getPos _x}forEach (nearestLocations [_worldCenter, ["nameLocal"],_worldDiameter]);
		if (WMS_AL_LOGs) then {Diag_log '|WAK|TNA|WMS|[AL] collecting VILLAGES positions'};
		{WMS_Pos_Villages pushback getPos _x}forEach (nearestLocations [_worldCenter, ["nameVillage"],_worldDiameter]);
		if (WMS_AL_LOGs) then {Diag_log '|WAK|TNA|WMS|[AL] collecting CITIES positions'};
		{WMS_Pos_Cities pushback getPos _x}forEach (nearestLocations [_worldCenter, ["nameCity"],_worldDiameter]);
		if (WMS_AL_LOGs) then {Diag_log '|WAK|TNA|WMS|[AL] collecting CAPITALS positions'};
		{WMS_Pos_Capitals pushback getPos _x}forEach (nearestLocations [_worldCenter, ["nameCityCapital"],_worldDiameter]);
	};
	WMS_fnc_ScanForWater = { //this one will be a tricky one
		if (WMS_AL_LOGs) then {Diag_log format ['|WAK|TNA|WMS|WMS_fnc_AL_ScanForWater start scanning %1', time]};
		params [
			["_resolution", 1000], //1km resolution
			["_closeLand", true] //thats pretty hardcore on server for few seconds if a lot of water but it's worth it
		];
		private _size = worldSize;
		private _divide = (round (_size/_resolution))-1;
		private _steps = []; //[1000,2000,3000,4000,5000,6000,7000,8000] for a 8km map 1000m resolution
		private _step = _resolution;
		private _scanPos = [_resolution,_resolution];
		for "_i" from 1 to _divide do {
			_steps pushback _step;
			_step = _step+_resolution;
		};
		{
			private _Xaxis = _x;
			{
				_scanPos = [_Xaxis,_x,0];
				if (surfaceIsWater _scanPos && {((ATLtoASL _scanPos) select 2) <= -3}) then {
					if (_closeLand) then {
						private _land = nearestTerrainObjects [_scanPos,["TREE", "SMALL TREE", "BUSH", "BUILDING", "HOUSE","ROAD"],1500];
						if (count _land != 0) then {WMS_SeaPos pushback _scanPos};
					}else{
						WMS_SeaPos pushback _scanPos;
					};
				};
			}forEach _steps; //this steps become Y axis
		}forEach _steps; //this steps become X axis
		if (WMS_AL_LOGs) then {Diag_log format ['|WAK|TNA|WMS|WMS_fnc_AL_ScanForWater Scan finished  %1, %2 positions found', time, count WMS_SeaPos]};
		(count WMS_SeaPos)
	};
	WMS_fnc_FindRoad = { //at server launch
		if (WMS_AL_LOGs) then {diag_log format ['|WAK|TNA|WMS|WMS_fnc_AL_FindRoad time %1', time]};
		private _arrayOfPos = WMS_Pos_Villages+WMS_Pos_Cities+WMS_Pos_Capitals;
		if (count _arrayOfPos == 0) exitWith {if (WMS_AL_LOGs) then {diag_log format ['|WAK|TNA|WMS|WMS_fnc_AL_FindRoad _arrayOfPos IS EMPTY %1', time]};};
		if (WMS_AL_IncludeLoc) then {_arrayOfPos+WMS_Pos_Locals}; 
		{
			_roads = _x nearRoads 150;
			if (count _roads != 0) then {
				_road = selectRandom _roads;
				WMS_Roads pushBack _road;
			}else{
				if (WMS_AL_LOGs) then {Diag_log format ['|WAK|TNA|WMS|WMS_fnc_AL_FindRoad no road around %1', _x]};
			};
		}forEach _arrayOfPos;
		if (WMS_AL_LOGs) then {Diag_log format ['|WAK|TNA|WMS|WMS_fnc_AL_FindRoad %1 roads found', (count WMS_Roads)]};
	};
};
///////////////////////////////////////
//ManagementLoop
WMS_fnc_AL_ManagementLoop = {
	if (WMS_AL_LOGs) then {diag_log format ['|WAK|TNA|WMS|WMS_fnc_AL_ManagementLoop time %1', time]};
	uisleep 5;
	for "_i" from 1 to WMS_AL_VHLmax do {
		[] call WMS_fnc_AL_createVHL;
		uisleep 1;
	};
	for "_i" from 1 to WMS_AL_UnitMax do {
		[] call WMS_fnc_AL_createUnits;
		uisleep 0.5;
	};
	uisleep 120;
	while {WMS_AmbientLife} do {
		if (true) then {diag_log format ['|WAK|TNA|WMS|WMS_fnc_AL_ManagementLoop Side: %1, Units: %4, server FPS %2, players %3', WMS_AL_Faction, diag_fps, count allPlayers, (WMS_AL_Faction countSide allUnits)]};
		{
			//destroying stuck vehicles
			if (speed ((_x select 3) select 0) < 3) then {
				_lastPos = _x select 3 select 0 getVariable ["WMS_AL_LastPos", [0,0,0]];
				if ((position ((_x select 3) select 0)) distance2D _lastPos < 30) then {
					if (({isPlayer _x} count crew ((_x select 3)select 0)) == 0) then {
						if (WMS_AL_LOGs) then {diag_log format ['|WAK|TNA|WMS|WMS_fnc_AL_ManagementLoop %1 Is stuck ! bye bye', _x]};
						{
							{moveOut _x; _x setDamage 1} forEach crew _x;
							_x setDamage 1;
						}forEach (_x select 3);
					};
				}else {((_x select 3) select 0) setVariable ["WMS_AL_LastPos", position ((_x select 3)select 0)]};
			};
			//refuel vehicles
			if(owner ((_x select 3) select 0) == 2)then{((_x select 3) select 0) setFuel 1};
			uisleep 0.2;
		}forEach (WMS_AL_Running select 0);
		//respawn missing vehicles, ONE per loop
		if (count (WMS_AL_Running select 0) < WMS_AL_VHLmax) then {
			if (WMS_AL_LOGs) then {diag_log format ['|WAK|TNA|WMS|WMS_fnc_AL_ManagementLoop spawning a new vehicle %1', time]};
			[] call WMS_fnc_AL_createVHL;
		};
		//respawn missing dudes, ONE (group) per loop
		if (count (WMS_AL_Running select 1) < WMS_AL_UnitMax) then {
			if (WMS_AL_LOGs) then {diag_log format ['|WAK|TNA|WMS|WMS_fnc_AL_ManagementLoop spawning a new little dude %1', time]};
			[] call WMS_fnc_AL_createUnits;
		};
		uisleep 115;
	};
};
///////////////////////////////////////
//Functions
///////////////////////////////////////
WMS_fnc_AL_createVHL = {
	if (WMS_AL_LOGs) then {diag_log format ['|WAK|TNA|WMS|WMS_fnc_AL_createVHL _this %1', _this]};
	params [
		["_pos", []],
		["_vhl", selectRandom (WMS_AL_Vehicles select (selectRandom WMS_AL_VhlBalance))],
		["_combat",WMS_AL_CombatBehav]
	];
	private _dir = Random 359;
	private _waypoints = [];
	private _hexaID = []call WMS_fnc_generateHexaID;
	private _road = objNull;
	private _arrayOfPos = [];
	if(count _pos == 0) then {
		if (_vhl in (WMS_AL_Vehicles select 2) && {count WMS_SeaPos >= 9}) then {
			_pos = selectRandom WMS_SeaPos;
		} else {
			if (_vhl in (WMS_AL_Vehicles select 2)) then {_vhl = selectRandom (WMS_AL_Vehicles select 1)};
			if (count WMS_Roads != 0) then { 
				_road = selectRandom WMS_Roads;
				//_pos = position _road; //if they are too slow to move, they can spawn on eachothers
				_pos = [position _road, 0, 100, 15, 0, 0, 0, [], [(position _road),[]]] call BIS_fnc_FindSafePos;
				if (_pos distance2D WMS_AL_LastUsedPos < 20) then {
					_pos = [_pos, 25, 250, 25, 0, 0, 0, [], [([] call BIS_fnc_randomPos),[]]] call BIS_fnc_FindSafePos;
				};
				_dir = direction _road;
			} else { //WAYPOINTS also use WMS_Roads, at this point it's fuckedUp
				_arrayOfPos = WMS_Pos_Villages+WMS_Pos_Cities+WMS_Pos_Capitals+WMS_Pos_Locals;
				_pos = (selectRandom _arrayOfPos);
				_pos = [_pos, 0, 100, 15, 0, 0, 0, [], [_pos,[]]] call BIS_fnc_FindSafePos;
				_dir = random 359;
			};
		};
		WMS_AL_LastUsedPos = _pos;
	};
	private _grp = createGroup WMS_AL_Faction;
	//2 possibilities, create the vehicle ready to go with crew or create a vehicel and then the crew
	//lets do the easy one first: //this way spawn the vehicle AND the crew, which pose problem with BIS command "side" ruturning the faction from a config and not the chosen one
	private _vehicleData = [_pos, _dir, _vhl, _grp] call BIS_fnc_spawnVehicle; //[createdVehicle, crew, group]
	private _vhlObject = (_vehicleData select 0);
	_waypoints = [_hexaID,_pos,_grp,_vhlObject,false,_combat] call WMS_fnc_AL_Patrol; //[_hexaID, pos, group,_vhlObject, boulean infantry, boulean combat]
	if (WMS_AL_LOGs) then {diag_log format ['|WAK|TNA|WMS|WMS_fnc_AL_createVHL _vehicleData %1', _vehicleData]};
	if (WMS_AL_LockVehicles) then {_vhlObject lock 3};
	clearMagazineCargoGlobal _vhlObject; 
	clearWeaponCargoGlobal _vhlObject; 
	clearItemCargoGlobal _vhlObject; 
	clearBackpackCargoGlobal _vhlObject;
	_vhlObject setVariable ["WMS_AL_lastPos", position _vhlObject];
	_vhlObject setVariable ["WMS_HexaID", _hexaID];
	_vhlObject setVariable ["WMS_KickVehAss",0,true]; //for the unstick fonction from InfantryProgram
	[(_vehicleData select 1)] call WMS_fnc_AL_setUnits;
	_vhlObject setVariable ["WMS_RealFuckingSide",WMS_AL_Faction];
	_vhlObject addEventHandler ["Killed", " 
		[(_this select 0),(_this select 1),(_this select 2)] call WMS_fnc_AL_VhlEH;
		"];//params ["_unit", "_killer", "_instigator", "_useEffects"];
	(WMS_AL_Running select 0) pushBack [_hexaID,time,_grp,[_vhlObject],_waypoints]; //[HexaID,time,group,[vehicle],[waypoints]]
};
WMS_fnc_AL_createUnits = {
	if (WMS_AL_LOGs) then {diag_log format ['|WAK|TNA|WMS|WMS_fnc_AL_createUnits _this %1', _this]};
	params [
		["_pos", []],
		["_units", WMS_AL_Units],
		["_combat",WMS_AL_CombatBehav]
	];
	private _unitsCount = 1;
	private _unitObject = ObjNull;
	private _dir = Random 359;
	private _waypoints = [];
	private _hexaID = []call WMS_fnc_generateHexaID;
	if (_combat) then {_unitsCount = selectRandom [2,2,3]};
	if(count _pos == 0) then {
		_road = selectRandom WMS_Roads;
		_pos = position _road;
		if (_pos distance2D WMS_AL_LastUsedPos < 20) then {
			_pos = [_pos, 10, 250, 5, 0, 0, 0, [], [([] call BIS_fnc_randomPos),[]]] call BIS_fnc_FindSafePos;
		};
		_dir = direction _road;
		WMS_AL_LastUsedPos = _pos;
	};
	private _grp = createGroup WMS_AL_Faction;
	_waypoints = [_hexaID,_pos,_grp,"nan",true,_combat] call WMS_fnc_AL_Patrol; //[_hexaID, pos, group, boulean infantry, boulean combat]
	for "_i" from 1 to _unitsCount do {
		_unitObject = _grp createUnit [selectRandom _units, _pos, [], 15, "FORM"];
		_unitObject setVariable ["WMS_HexaID", _hexaID];
	};
	
	[units _grp] call WMS_fnc_AL_setUnits;
	(WMS_AL_Running select 1) pushBack [_hexaID,time,_grp,units _grp,_waypoints]; //[HexaID,time,group,[units],[waypoints]]
};
WMS_fnc_AL_setUnits = {
	if (WMS_AL_LOGs) then {diag_log format ['|WAK|TNA|WMS|WMS_fnc_AL_setUnits _this %1', _this]};
	private [];
	params [
		"_units",
		["_options", []],
		["_skills",WMS_AL_Skills]
	];
	{
		//setSkill
		_x setSkill ["spotDistance", 	(_skills select 0)];
		_x setSkill ["spotTime", 		(_skills select 1)];
		_x setSkill ["aimingAccuracy", 	(_skills select 2)];
		_x setSkill ["aimingShake", 	(_skills select 3)];
		_x setSkill ["aimingSpeed", 	(_skills select 4)];
		_x setSkill ["reloadSpeed", 	(_skills select 5)];
		_x setSkill ["courage", 		(_skills select 6)];
		_x setSkill ["commanding", 		(_skills select 7)];
		_x setSkill ["general", 		(_skills select 8)];
		_x setVariable ["WMS_DFO_options",_options];
		_x allowFleeing 0;
		_x setVariable ["WMS_RealFuckingSide",WMS_AL_Faction];
		_x addEventHandler ["Killed", " 
		[(_this select 0),(_this select 1),(_this select 2)] call WMS_fnc_AL_UnitEH;
		"];//params ["_unit", "_killer", "_instigator", "_useEffects"];
	}forEach _units
};

WMS_fnc_AL_UnitEH = {
	if (WMS_AL_LOGs) then {diag_log format ['|WAK|TNA|WMS|WMS_fnc_AL_UnitEH _this %1', _this]};
	params [
		"_killed",
		"_killer", //the registered _playerObject for the mission is the pilot who launched the mission, if the pilot die and come back, he doesnt match the registered anymore
		"_instigator"
	];
	if (isPlayer _instigator) then {_killer = _instigator};
	if(isPlayer _killer && {((side _killer) getfriend (_killed getVariable ["WMS_RealFuckingSide",WMS_AL_Faction])) > 0.5}) then {
		[_killer] call WMS_fnc_AL_PunishPunks;
	};
	private _hexaID = _killed getVariable ["WMS_HexaID", "zzzzzzzz"];
	WMS_HC_AllDeadsMgr pushBack [_killed,(serverTime+60)];
	if (WMS_AL_StripOffUnit) then {
		_killed removeWeapon (primaryWeapon _killed);
		_killed removeWeapon (secondaryWeapon _killed); //launcher
		//removeAllItems _killed;
		removeAllWeapons _killed;
		removeBackpackGlobal _killed;
		removeVest _killed;
		//moveOut _killed;
	};
	if ({alive _x} count (units (group _killed)) == 0) then {
		deleteGroup (group _killed);
		//if the group is empty, remove it from the manager
		private _result = []; 
		{ 
			_found = (_x select 0) find _hexaID;
			_result pushback _found;
		}forEach (WMS_AL_Running select 1);
		private _RefIndex = _result find 0;
		//{deleteWaypoint _x}forEach (((WMS_AL_Running select 1) select _RefIndex) select 4); //units use CBA patrol which manage the waypoints itself
		(WMS_AL_Running select 1) deleteAt _RefIndex;
	};
};
WMS_fnc_AL_VhlEH = {
	if (WMS_AL_LOGs) then {diag_log format ['|WAK|TNA|WMS|WMS_fnc_AL_VhlEH _this %1', _this]};
	params [
		"_killed",
		"_killer", //the registered _playerObject for the mission is the pilot who launched the mission, if the pilot die and come back, he doesnt match the registered anymore
		"_instigator"
	];
	if (isPlayer _instigator) then {_killer = _instigator};
	private _hexaID = _killed getVariable ["WMS_HexaID", "zzzzzzzz"];
	if(isPlayer _killer && {((side _killer) getfriend (_killed getVariable ["WMS_RealFuckingSide",WMS_AL_Faction])) > 0.5}) then {
		[_killer] call WMS_fnc_AL_PunishPunks;
	};
	{
		moveOut _x; 
		_x setDamage 1;
		if (WMS_AL_StripOffUnit) then {
			_x removeWeapon (primaryWeapon _x);
			_x removeWeapon (secondaryWeapon _x); //launcher
			//removeAllItems _x;
			removeAllWeapons _x;
			removeBackpackGlobal _x;
			removeVest _x;
		};
	} forEach units (group _killed);
	deleteGroup (group _killed);
	//if the unit die, remove it from the manager
	private _result = []; 
	{ 
		_found = (_x select 0) find _hexaID;
		_result pushback _found;
	}forEach (WMS_AL_Running select 0);
	private _RefIndex = _result find 0;
	{deleteWaypoint _x}forEach (((WMS_AL_Running select 0) select _RefIndex) select 4);
	[_killed] spawn {uisleep 5; deleteVehicle (_this select 0)};
	(WMS_AL_Running select 0) deleteAt _RefIndex;
};

WMS_fnc_AL_Patrol = {
	if (WMS_AL_LOGs) then {diag_log format ['|WAK|TNA|WMS|WMS_fnc_AL_Patrol _this %1', _this]};
	params [
		"_hexaID",
		"_pos", 
		"_grp", 
		"_vhl", //_vhlObject
		["_infantry", true],
		["_combat", WMS_AL_CombatBehav]
	];
	private _waypoints = [];
	private _wpt0 = [];
	private _wpt1 = [];
	private _wpt2 = [];
	private _wpt3 = [];
	//create Waypoints, lets say 4 of them, in random cities for Vehicles, around for dudes
	if (_infantry) then {
		if (_combat) then {
			[_grp, _pos, 150, 4, "MOVE", "AWARE", "RED", "NORMAL", "COLUMN", "", [1,2,3]] call CBA_fnc_taskPatrol;
		} else {
			[_grp, _pos, 150, 4, "MOVE", "CARELESS", "BLUE", "LIMITED", "COLUMN", "", [1,2,3]] call CBA_fnc_taskPatrol;
		};
	} else {
		if (surfaceIsWater _pos) then {
			_wpt0 = _grp addWaypoint [_pos, 50, 0, format["WPT0_%1",round time]];
			_wpt1 = _grp addWaypoint [(selectRandom WMS_SeaPos), 150, 1, format["WPT1_%1",round time]];
			_wpt2 = _grp addWaypoint [(selectRandom WMS_SeaPos), 150, 2, format["WPT2_%1",round time]];
			private _lastPos = (selectRandom WMS_SeaPos);
			if (_lastPos distance2D (getWPPos _wpt2) < 150 || _lastPos distance2D (getWPPos _wpt0) < 50) then {
				private _findPos = true;
				private _cycles = 100;
				while {_findPos} do {
					_lastPos = (selectRandom WMS_SeaPos);
					if (_lastPos distance2D (getWPPos _wpt2) > 50 && _lastPos distance2D (getWPPos _wpt0) > 50) then {
						_findPos = false;
						_wpt3 = _grp addWaypoint [_lastPos, 150, 3, format["WPT3_%1",round time]];
					};
					_cycles = _cycles-1;
					if (_cycles < 1) then {
						_findPos = false;
						_wpt3 = _grp addWaypoint [_lastPos, 150, 3, format["WPT3_%1",round time]];
					};
				};
			}else {_wpt3 = _grp addWaypoint [_lastPos, 150, 3, format["WPT3_%1",round time]];};
		} else {
			if (_vhl isKindOf "helicopter") then { //choppers can also fly over water
				_wpt0 = _grp addWaypoint [_pos, 50, 0, format["WPT0_%1",round time]];
				if (count WMS_SeaPos != 0) then {
					_wpt1 = _grp addWaypoint [selectRandom [getPos (selectRandom WMS_Roads),(selectRandom WMS_SeaPos)], 150, 1, format["WPT1_%1",round time]];
					_wpt2 = _grp addWaypoint [selectRandom [getPos (selectRandom WMS_Roads),(selectRandom WMS_SeaPos)], 150, 2, format["WPT2_%1",round time]];
				} else {
					_wpt1 = _grp addWaypoint [getPos (selectRandom WMS_Roads), 150, 1, format["WPT1_%1",round time]];
					_wpt2 = _grp addWaypoint [getPos (selectRandom WMS_Roads), 150, 2, format["WPT2_%1",round time]];
				};
				
				private _lastPos = getPos (selectRandom WMS_Roads);
				if (_lastPos distance2D (getWPPos _wpt2) < 150 || _lastPos distance2D (getWPPos _wpt0) < 50) then {
					private _findPos = true;
					private _cycles = 100;
					while {_findPos} do {
						if (count WMS_SeaPos != 0) then {
							_lastPos = selectRandom [getPos (selectRandom WMS_Roads),(selectRandom WMS_SeaPos)];
						}else{
							_lastPos = getPos (selectRandom WMS_Roads);
						};
						if (_lastPos distance2D (getWPPos _wpt2) > 50 && _lastPos distance2D (getWPPos _wpt0) > 50) then {
							_findPos = false;
							_wpt3 = _grp addWaypoint [_lastPos, 150, 3, format["WPT3_%1",round time]];
						};
						_cycles = _cycles-1;
						if (_cycles < 1) then {
							_findPos = false;
							_wpt3 = _grp addWaypoint [_lastPos, 150, 3, format["WPT3_%1",round time]];
						};
					};
				}else {_wpt3 = _grp addWaypoint [_lastPos, 150, 3, format["WPT3_%1",round time]];};
				//if (count (allAirports select 0) != 0) then {_vhl landAt selectRandom (allAirports select 0)}; //NOPE
			}else {
				_wpt0 = _grp addWaypoint [_pos, 50, 0, format["WPT0_%1",round time]];
				_wpt1 = _grp addWaypoint [getPos (selectRandom WMS_Roads), 150, 1, format["WPT1_%1",round time]];
				_wpt2 = _grp addWaypoint [getPos (selectRandom WMS_Roads), 150, 2, format["WPT2_%1",round time]];
				private _lastPos = getPos (selectRandom WMS_Roads);
				if (_lastPos distance2D (getWPPos _wpt2) < 150 || _lastPos distance2D (getWPPos _wpt0) < 50) then {
					private _findPos = true;
					private _cycles = 100;
					while {_findPos} do {
						_lastPos = getPos (selectRandom WMS_Roads);
						if (_lastPos distance2D (getWPPos _wpt2) > 50 && _lastPos distance2D (getWPPos _wpt0) > 50) then {
							_findPos = false;
							_wpt3 = _grp addWaypoint [_lastPos, 150, 3, format["WPT3_%1",round time]];
						};
						_cycles = _cycles-1;
						if (_cycles < 1) then {
							_findPos = false;
							_wpt3 = _grp addWaypoint [_lastPos, 150, 3, format["WPT3_%1",round time]];
						};
					};
				}else {_wpt3 = _grp addWaypoint [_lastPos, 150, 3, format["WPT3_%1",round time]];};
			};
		};
		_waypoints pushBack _wpt0;
		_wpt0 setWaypointType "MOVE";
		_waypoints pushBack _wpt1;
		_wpt1 setWaypointType "MOVE";
		_waypoints pushBack _wpt2;
		_wpt2 setWaypointType "MOVE";
		_waypoints pushBack _wpt3;
		_wpt3 setWaypointType "CYCLE";
		{
			if (_combat) then {
				_x setWaypointCombatMode "YELLOW";
				_x setWaypointBehaviour "AWARE";
				_x setWaypointSpeed "NORMAL";
				_x setWaypointCompletionRadius 300;
			} else {
				if (surfaceIsWater _pos) then {
					_x setWaypointSpeed "FULL";
				}else{
					_x setWaypointSpeed "LIMITED";
				};
				_x setWaypointCombatMode "BLUE";
				_x setWaypointBehaviour "CARELESS";
			};
		}forEach _waypoints;
	};
	_waypoints
};
WMS_fnc_AL_PunishPunks = { //will be use to remind to those getting in the mission zone that it's not their mission, ACE broken legs and things like that
	if (WMS_AL_LOGs) then {diag_log format ['|WAK|TNA|WMS|WMS_fnc_AL_PunishPunks _this %1', _this]};
	params [
		"_playerObject",
		["_maxDamage",0.4],
		["_part", selectRandom ["head", "body", "leftarm", "rightarm", "leftleg", "rightleg"]], //["head", "body", "leftarm", "rightarm", "leftleg", "rightleg"] ACE
		["_projectiles", selectRandom ["stab","bullet","grenade","explosive","shell","vehiclecrash","backblast","falling"]] //["stab","bullet","grenade","explosive","shell","vehiclecrash","collision","backblast","punch","falling","ropeburn","fire"]
		];

	if (WMS_AL_AceIsRunning) then {
		if (isPlayer _playerObject) then {
			[_playerObject, _maxDamage, _part, _projectiles, _playerObject] remoteExecCall ["ace_medical_fnc_addDamageToUnit",owner _playerObject];
		} else {
			[_playerObject, 0.3, _part, _projectiles, _playerObject] call ace_medical_fnc_addDamageToUnit;
		};
	} else {
		//Bohemia:
		/*_parts = [
			"face_hub", //Unit dies at damage equal to or above 1
			"neck", //Unit dies at damage equal to or above 1
			"head", //Unit dies at damage equal to or above 1
			"pelvis", //Unit dies at damage equal to or above 1
			"spine1", //Unit dies at damage equal to or above 1
			"spine2", //Unit dies at damage equal to or above 1
			"spine3", //Unit dies at damage equal to or above 1
			"body", //Unit dies at damage equal to or above 1
			"arms", //Unit doesn't die with damage to this part
			"hands", //Unit doesn't die with damage to this part
			"legs" //Unit doesn't die with damage to this part 
		];*/
		//_playerObject setHit [selectRandom _parts,random 0.25,true,_playerObject];
		private _dmg = damage _playerObject;
		_playerObject setDamage _dmg+(random _maxDamage); //it's not sexy but it should do the job for now
	};
};

///////////////////////////
{if ("Advanced Combat Environment" in (_x select 0))then {WMS_AL_AceIsRunning = true;}}forEach getLoadedModsInfo;

if (WMS_AL_Standalone) then {
	[]call WMS_fnc_CollectPos;
	[]call WMS_fnc_ScanForWater;
	[]call WMS_fnc_FindRoad;
};
uisleep 15;
if (WMS_AmbientLife) then {
	[] spawn WMS_fnc_AL_ManagementLoop;
	if (true) then {diag_log format ['|WAK|TNA|WMS|WMS_AmbientLife Started, version %1', WMS_AL_Version]};
};