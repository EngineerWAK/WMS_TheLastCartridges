//WMS_IP_Extract_Alt = missionNameSpace getVariable ["WMS_IP_Extract_Alt",200];
//WMS_ExtractionChopper_Type = missionNameSpace getVariable ["WMS_ExtractionChopper_Type",["vn_b_air_uh1d_02_06"]];
//WMS_IP_Extract_Alt = 200;
//WMS_ExtractionChopper_Type = ["vn_b_air_uh1d_02_06"];
WMS_OffloadToHC1 = false;
WMS_exileToastMsg = false;

WMS_fnc_RemoteTaskPatrol = { //OLD
	/*
		After many years using the trusty CBA_fnc_taskPatrol, I had to make "my own" since CBA_fnc_taskPatrol prevent me to use it on HC with "non Local" groups
		"if !(local _group) exitWith {}; // Don't create waypoints on each machine" CBA_fnc_taskPatrol line 45
	*/
	private ["_Grp","_step","_offset","_rad","_heading","_WPT","_WPT_Cycle"];
	params [
		"_units", //the difference is there
		["_Pos",[worldsize/2,worldsize/2,0]],
		["_radius",150],
		["_wptscnt",4],
		["_wptype","MOVE"],
		["_wpbeha","STEALTH"],
		["_wpcbtm","YELLOW"],
		["_wpspeed","NORMAL"],
		["_wpform","STAG COLUMN"],
		["_wpcode",""],
		["_wptimeout",[1,2,3]],
		["_wptcomprad",10]
	];
	if (true) then {diag_log format ['|WAK|TNA|WMS|[WMS_fnc_RemoteTaskPatrol] _this = %1', _this]};

	_grp = grpNull;
	if (typeName _units == "ARRAY") then {
		_grp = group (_units select 0);
	}else{
		if (typeName _units == "GROUP") then {
			_grp = _units;
		};
	};
	if (isNull _grp) exitWith {diag_log format ['|WAK|TNA|WMS|[WMS_fnc_waypoints_Patrol]Exiting Function, no group. _units = %1', _units]};

	for "_i" from 1 to count (waypoints _grp) do {
		deleteWaypoint [_grp,0];
	};
	_step = 360 / _wptscnt; //From CBATeam
	_offset = random _step; //From CBATeam
	for "_i" from 1 to _wptscnt do {
    	_rad = _radius * random [0.25, 0.75, 1]; //From CBATeam
    	//_heading = (_i % 2) * 180 + sin (deg (_step * _i)) * _offset + _step * _i; //From CBATeam, I guess it's a very scientific way to get a heading
    	_heading = random 359; //From CBATeam, I guess it's a very scientific way to get a heading
		_Pos = _Pos getPos [_rad, _heading];
		_WPT = _Grp addWaypoint [_Pos, _radius];
		_WPT setWaypointType _wptype;
		_WPT setWaypointBehaviour _wpbeha;
		_WPT setWaypointCombatMode _wpcbtm;
		_WPT setWaypointSpeed _wpspeed;
		_WPT setWaypointFormation _wpform;
		_WPT setWaypointStatements ["TRUE", _wpcode];
		_WPT setWaypointTimeout _wptimeout;
		_WPT setWaypointCompletionRadius _wptcomprad;	
	};

    _rad = _radius * random [0.25, 0.75, 1]; //From CBATeam
    //_heading = (_i % 2) * 180 + sin (deg (_step * _i)) * _offset + _step * _i; //From CBATeam, I guess it's a very scientific way to get a heading
    _heading = random 359; //From CBATeam, I guess it's a very scientific way to get a heading
	_Pos = _Pos getPos [_rad, _heading];
	_WPT_Cycle = _Grp addWaypoint [_Pos, 10];     
	_WPT_Cycle setWaypointType "CYCLE";     
	_WPT_Cycle setWaypointCombatMode "NO CHANGE";     
	_WPT_Cycle setWaypointbehaviour  "UNCHANGED";
	
	if (true) then {diag_log format ['|WAK|TNA|WMS|[WMS_fnc_RemoteTaskPatrol]Group = %1, owner = %2, waypoints = %3', _Grp, (owner (leader _grp)), waypoints _Grp]};
};

WMS_fnc_HC_AllDeadsMgr = {
	/**
* WMS_fnc_AllDeadsMgr - InfantryProgram
*
* TNA-Community
* https://discord.gg/Zs23URtjwF
* © 2022 {|||TNA|||}WAKeupneo
*
* This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
* To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
* Do Not Re-Upload
*/
	if (true) then {diag_log format ['|WAK|TNA|WMS|[AllDeadsMgr] WMS_fnc_AllDeadsMgr, AllDeads Cleanup, %1 deads', count WMS_HC_AllDeadsMgr]};
	{
		if (count WMS_HC_AllDeadsMgr != 0 && {serverTime >= (_x select 1)}) then {
			if ((_x select 0) isKindOf "WeaponHolderSimulated") then {
				clearItemCargoGlobal (_x select 0);
				deleteVehicle (_x select 0);
				WMS_HC_AllDeadsMgr deleteAt (WMS_HC_AllDeadsMgr find _x);
			}else{
				if !(alive (_x select 0)) then {
					if (true) then {diag_log format ['|WAK|TNA|WMS|[AllDeadsMgr] WMS_fnc_AllDeadsMgr, your fignt is over %1',(_x select 0)]};
					deleteVehicle (_x select 0);
				WMS_HC_AllDeadsMgr deleteAt (WMS_HC_AllDeadsMgr find _x);
				};
			};
		};
	}forEach WMS_HC_AllDeadsMgr;
};
WMS_fnc_lvl2_cleanup = {
	/**
* InfantryProgram
*
* TNA-Community
* https://discord.gg/Zs23URtjwF
* © 2021 {|||TNA|||}WAKeupneo
*
* This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
* To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
* Do Not Re-Upload
*/

{deleteVehicle _x} foreach units (_this select 0);
{deleteVehicle _x} foreach (_this select 1);
{deleteMarker _x} foreach (_this select 2);
{deleteWaypoint _x} foreach (_this select 3);
//deleteGroup (_this select 0);

//16:12:37   Error units: Type Number, expected Object,Side,Group
//16:12:37 File InfantryProgram\scripts\fn_lvl2_cleanUp.sqf..., line 13
};