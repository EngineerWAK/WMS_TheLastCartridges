//WMS_IP_Extract_Alt = missionNameSpace getVariable ["WMS_IP_Extract_Alt",200];
//WMS_ExtractionChopper_Type = missionNameSpace getVariable ["WMS_ExtractionChopper_Type",["vn_b_air_uh1d_02_06"]];
WMS_IP_Extract_Alt = 200;
WMS_ExtractionChopper_Type = ["vn_b_air_uh1d_02_06"];
WMS_OffloadToHC1 = false;
WMS_exileToastMsg = false;

WMS_fnc_RemoteTaskPatrol = {	//it seems like CBA_fnc_taskPatrol do not work on transfered units ?
	private ["_Grp"];
	params [
		"_units", //the difference is there
		["_Pos",[worldsize/2,worldsize/2,0]],
		["_radius",50],
		["_wptscnt",4],
		["_wptype","MOVE"],
		["_wpbeha","STEALTH"],
		["_wpcbtm","YELLOW"],
		["_wpspeed","NORMAL"],
		["_wpform","STAG COLUMN"],
		["_wpcode",""],
		["_wptimeout",[1,2,3]]
	];
	if (true) then {diag_log format ['|WAK|TNA|WMS|[WMS_fnc_RemoteTaskPatrol] _this = %1', _this]};
	_Grp = group (_units select 0);
	for "_i" from 1 to count (waypoints _Grp) do {
		deleteWaypoint [_Grp,0];
	};
	//{deleteWaypoint _x}forEach (waypoints _Grp); //I don't think so
	//[_grp, _pos, 150, 4, "MOVE", "AWARE", "RED", "NORMAL", "COLUMN", "", [1,2,3]] call CBA_fnc_taskPatrol;
	[_Grp, _Pos, _radius, _wptscnt, _wptype, _wpbeha, _wpcbtm, _wpspeed, _wpform, _wpcode, _wptimeout] call CBA_fnc_taskPatrol;
	if (true) then {diag_log format ['|WAK|TNA|WMS|[WMS_fnc_RemoteTaskPatrol] group = %1, owner = %2, waypoints = %3', _Grp, (owner (leader _grp)), waypoints _Grp]};
	if (count (waypoints _Grp) == 1)then {
		deleteWaypoint [_Grp,0];
		[_Grp, _Pos, _radius, _wptscnt, _wptype, _wpbeha, _wpcbtm, _wpspeed, _wpform, "", _wptimeout] call CBA_fnc_taskPatrol;
		if (true) then {diag_log format ['|WAK|TNA|WMS|[WMS_fnc_RemoteTaskPatrol]Triy again, group = %1, owner = %2, waypoints = %3', _Grp, (owner (leader _grp)), waypoints _Grp]};
	}else{
		if (count (waypoints _Grp) == 0)then {
			//[_Grp, _Pos, 300, 7, "MOVE", "AWARE", "YELLOW", "FULL", "STAG COLUMN", "this call CBA_fnc_searchNearby", [3, 6, 9]] call CBA_fnc_taskPatrol; //this one from CBA themself
			[_Grp, _Pos, 150, 4, "MOVE", "AWARE", "YELLOW", "NORMAL", "STAG COLUMN", "", [1,2,3]] call CBA_fnc_taskPatrol;
			if (true) then {diag_log format ['|WAK|TNA|WMS|[WMS_fnc_RemoteTaskPatrol]Triy again and again, group = %1, owner = %2, waypoints = %3', _Grp, (owner (leader _grp)), waypoints _Grp]};
			if (count (waypoints _Grp) == 0)then {
				[_Grp,_pos]spawn {
					uisleep 15;
					_Grp = _this select 0;
					_pos = _this select 1;
					if (count (waypoints _Grp) == 0)then {
						_blackList = [[_pos, 40]];
						private _WPT_inf_0 = _Grp addWaypoint [_Pos, 5]; 
						_WPT_inf_0 setWaypointType "MOVE";
						_WPT_inf_0 setWaypointCombatMode "YELLOW";     
						_WPT_inf_0 setWaypointbehaviour  "AWARE";
					
						_pos1 = [_Pos, 0, 150, 3, 0, 0, 0, _blackList, [_pos,[]]] call BIS_fnc_findSafePos;
						_blackList pushBack [_pos1,30];
						private _WPT_inf_1 = _Grp addWaypoint [_pos1, 10]; 
						_WPT_inf_1 setWaypointType "MOVE";
						_WPT_inf_1 setWaypointCombatMode "YELLOW";     
						_WPT_inf_1 setWaypointbehaviour  "AWARE";
					
						_pos2 = [_Pos, 0, 150, 3, 0, 0, 0, _blackList, [_pos,[]]] call BIS_fnc_findSafePos;
						_blackList pushBack [_pos2,30];
						private _WPT_inf_2 = _Grp addWaypoint [_pos2, 10]; 
						_WPT_inf_2 setWaypointType "MOVE";
						_WPT_inf_2 setWaypointCombatMode "YELLOW";     
						_WPT_inf_2 setWaypointbehaviour  "AWARE";

						_pos3 = [_Pos, 0, 150, 3, 0, 0, 0, _blackList, [_pos,[]]] call BIS_fnc_findSafePos;
						_blackList pushBack [_pos3,30];
						private _WPT_inf_3 = _Grp addWaypoint [_pos3, 10];     
						_WPT_inf_3 setWaypointType "CYCLE";     
						_WPT_inf_3 setWaypointCombatMode "YELLOW";     
						_WPT_inf_3 setWaypointbehaviour  "AWARE";
					};
					uisleep 5;
					if (true) then {diag_log format ['|WAK|TNA|WMS|[WMS_fnc_RemoteTaskPatrol]Try again and again AND AGAIN, group = %1, owner = %2, waypoints = %3', _Grp, (owner (leader _grp)), waypoints _Grp]};
				};
			};
		};
	};
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

WMS_fnc_infantryProgram_extraction = {
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

// action = "openMap true; onMapSingleClick { onMapSingleClick {}; [player,_pos,'sab_C130_J',1] remoteExec ['WMS_fnc_ParadropMissionRequest']; openMap false; true };";
//[player,_pos,nil,0,_vehicVarName] remoteExec ["WMS_fnc_infantryProgram_extraction"];
// _pos is generated by onMapSingleClick
diag_log format ["[EXTRACTION CHOPPER]|TNA|TNA|TNA|TNA|TNA| Chopper Transport _this check, _this = %1 |TNA|", _this];

params [
  "_target",
  "_pos",
  ["_plane",(selectRandom WMS_ExtractionChopper_Type)],
  ["_zero",0], //WTF is this 0 for ???
  ["_vehicVarName","fuckingDumbName"] //WTF is this _vehicVarName for ???
];
if !(typeName _pos == "ARRAY") exitWith {diag_log format ["[EXTRACTION CHOPPER]|TNA|TNA|TNA|TNA|TNA| Chopper Transport _pos fuckedup %1", _pos];};

_HC1 = missionNameSpace getVariable ["WMS_HC1",false]; //set by HC1 itself then publicVariable //This can not work, obviously...
_HC1_ID = 2;
if (isServer && _HC1)then{
  {if (name _x == "HC1" && {!hasInterface})then{_HC1_ID = owner _x};}forEach AllPlayers;
};
if (isServer && {_HC1} && {_HC1_ID != 2} && {WMS_OffloadToHC1}) then {
    //get the HC1 owner

    //the Easiest way would be for the HC to run the same function and just send "_this"
		[format["[RECEIVING OFFLOAD FROM SERVER]WMS_fnc_InfantryProgram_Extraction _this = %1",_this]] RemoteExec ["diag_log",_HC1_ID];
		_this RemoteExec ["WMS_fnc_InfantryProgram_Extraction",_HC1_ID];
}else{
  //the all function should go there I guess
private _RandomPosSpawn = [_target, 1500, 2500] call BIS_fnc_findSafePos;
private _RandomPosExtract = [_target, 0, 100, 20, 0, 0.15, 0, [], [(position _target),[]]] call BIS_fnc_findSafePos;
private _RandomPosDest = [_pos, 0, 200, 20, 0, 0.15, 0, [], [_pos,[]]] call BIS_fnc_findSafePos;
private _RandomPosEnd = [_RandomPosDest, worldSize, (worldSize*1.2)] call BIS_fnc_findSafePos;

private _vhl = [_RandomPosSpawn, (0+random 359), _plane, BLUFOR] call bis_fnc_spawnvehicle;
private _vehic = (_vhl select 0);
private _grp = (_vhl select 2);
clearMagazineCargoGlobal _vehic;
clearWeaponCargoGlobal _vehic;
clearItemCargoGlobal _vehic;
clearBackpackCargoGlobal _vehic;
if (_plane == "UK3CB_BAF_Wildcat_AH1_TRN_8A") then {_vehic setObjectTextureGlobal [0,"r3f_retex\data\lynx\heli_light_03_ce_r3f_co.paa"]};
if (_plane == "UK3CB_BAF_Merlin_HC3_32") then {_vehic setObjectTextureGlobal [0,"r3f_retex\data\merlin\heli_transport_02_ce_1_r3f_co.paa"]};

_vehic lockDriver true; 
_vehic lockTurret [[-1], true]; 
_vehic lockTurret [[0], true]; 
//_vehic lockTurret [[1], true]; 
 
_vehic flyInHeight WMS_IP_Extract_Alt;
WMS_Extraction_Chopper_LastTime = time;
publicVariable "WMS_Extraction_Chopper_LastTime";

private _Helipad_1 = "Land_HelipadEmpty_F" createVehicle _RandomPosExtract;
private _GreenSmoke = "SmokeShellGreen" createVehicle _RandomPosExtract;
private _Helipad_2 = "Land_HelipadCircle_F" createVehicle _RandomPosDest;
{
  removeAllItems _x;
  removeAllWeapons _x;
  removeBackpackGlobal _x;
  _x additem "FirstAidKit";
  _x disableAI "AUTOTARGET";
  _x disableAI "TARGET";
  _x disableAI "AUTOCOMBAT";
} forEach units _grp ;

private _WPT_paradrop = _grp addWaypoint [_RandomPosExtract, 0];
_WPT_paradrop setWaypointType "LOAD";
_WPT_paradrop setWaypointCombatMode "BLUE";
_WPT_paradrop setWaypointbehaviour  "CARELESS";
waitUntil  {(_vehic distance2D _RandomPosExtract) <= 200 || !(alive _vehic)}; //NEED A TRIGGER
if (WMS_exileToastMsg && isServer) then {["toastRequest", ["InfoTitleAndText", [format ["Incoming %1 Extraction Chopper",(typeof _vehic)]]]] call ExileServer_system_network_send_broadcast};
[_grp, _RandomPosExtract, _Helipad_1] spawn BIS_fnc_wpLand; //I think there is an error with this one
waitUntil {!(vehicle _target == _target) || !(alive _target) || !(alive _vehic)};
uisleep 5;

private _WPT_paradrop1 = _grp addWaypoint [_RandomPosDest, 0];
_WPT_paradrop1 setWaypointType "TR UNLOAD";
_WPT_paradrop1 setWaypointCombatMode "BLUE";
_WPT_paradrop1 setWaypointbehaviour  "CARELESS";
waitUntil  {(_vehic distance2D _RandomPosDest) <= 200 || !(alive _vehic)};
uisleep 45;
_vehic flyInHeight WMS_IP_Extract_Alt;

private _WPT_paradrop2 = _grp addWaypoint [_RandomPosEnd, 150];
_WPT_paradrop2 setWaypointType "MOVE";
_WPT_paradrop2 setWaypointCombatMode "BLUE";
_WPT_paradrop2 setWaypointbehaviour  "CARELESS";
[units _grp] domove _RandomPosEnd;

//Those "waitUntil" are really fucked up
[_vehic, _pos, _grp, _WPT_paradrop, _RandomPosDest, _WPT_paradrop2, _Helipad_1, _Helipad_2] spawn {
 waituntil  {(_this select 0) distance2d (_this select 4) <= 200 || !(alive (_this select 0))};
 uisleep 60;
 systemchat format ["%1 Extraction done.",(_this select 0)];
if (WMS_exileToastMsg && isServer) then {["toastRequest", ["InfoTitleAndText", [format ["%1 Extraction Done",(typeof (_this select 0))]]]] call ExileServer_system_network_send_broadcast};
 uisleep (60+random 60);
 (_this select 0) setfuel 0;
 (_this select 0) setdamage 0.9;
 {deletevehicle _x} foreach units(_this select 2);
};
[_vehic, _grp, _WPT_paradrop, _WPT_paradrop1, _WPT_paradrop2, _Helipad_1, _Helipad_2] spawn {
 waituntil  {!(alive (_this select 0)) || !(alive (_this select 0))}; //WTF ???
if (WMS_exileToastMsg && isServer) then {["toastRequest", ["InfoTitleAndText", [format ["%1 Extraction Done",(typeof (_this select 0))]]]] call ExileServer_system_network_send_broadcast};
 [(_this select 1),[(_this select 5),(_this select 6)],[],[(_this select 2),(_this select 3),(_this select 4)]] call WMS_fnc_lvl2_cleanup; //this is sooooooooooooo old
};
};
};