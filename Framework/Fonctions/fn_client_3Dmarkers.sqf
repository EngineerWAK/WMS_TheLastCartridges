/**
 * WMS_fnc_client_3Dmarkers
 *
 * TNA-Community
 * https://discord.gg/Zs23URtjwF
 * © 2021 {|||TNA|||}WAKeupneo
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 /*
    ["WMS 3Dmarker", "UserAction17", "Place 3D Marker", {[]call WMS_fnc_client_3Dmarkers}, {}, [0x10A, [false, false, false]]] call CBA_fnc_addKeybind;//Custom user action 17
    ["WMS 3Dmarker", "UserAction18", "Place Group 3D Marker", {[[],true,true]call WMS_fnc_client_3Dmarkers}, {}, [0x10B, [false, false, false]]] call CBA_fnc_addKeybind;//Custom user action 18
    _action0 = ["3DMarker","3D Marker","",{[]call WMS_fnc_client_3Dmarkers},{true}] call ace_interact_menu_fnc_createAction;
    [player, 1, ["ACE_SelfActions"], _action0] call ace_interact_menu_fnc_addActionToObject;
    _action1 = ["Group3DMarker","Group 3D Marker","",{[[],true,true]call WMS_fnc_client_3Dmarkers},{true}] call ace_interact_menu_fnc_createAction;
    [player, 1, ["ACE_SelfActions"], _action1] call ace_interact_menu_fnc_addActionToObject;
 */
private ["_ID","_ins"];
params [
	["_pos", []],
	["_grp", false],
	["_remoteEx",false],
	["_PlayerName",(name player)],
	["_color", "orange"]
];
if (true) then {diag_log format ["|WAK|TNA|WMS| WMS_fnc_client_3Dmarkers _this = %1",_this]};
if (_grp) then {
	_ID = missionNamespace getVariable ["WMS_3Dmkr_ID_grp", -1];
	_ins = [];
	if (_ID != -1) then {
		removeMissionEventHandler ["Draw3D",WMS_3Dmkr_ID_grp];
		WMS_3Dmkr_ID_grp = -1;
		WMS_3Dmkr_pos_grp = [];
	};
	if (count _pos == 0) then {
		_ins = lineIntersectsSurfaces [
			AGLToASL positionCameraToWorld [0,0,0],
			AGLToASL positionCameraToWorld [0,0,1000],
			vehicle player
		];
		if (count _ins != 0) then {
			WMS_3Dmkr_pos_grp = (_ins select 0 select 0);
		};
	}else {
		WMS_3Dmkr_pos_grp = _pos;
	};
	if (count WMS_3Dmkr_pos_grp == 0) exitWith {};
	WMS_3Dmkr_name = _PlayerName;
	switch (toLower _color) do {
		case "orange": {
			WMS_3Dmkr_ID_grp = addMissionEventHandler ["Draw3D", {
				drawIcon3D [getMissionPath "Custom\3Dmarkers\WMS_3Dmarker.paa", [[0.85,0.4,0,1],[0.85,0.4,0,1]], ASLToAGL WMS_3Dmkr_pos_grp, 1, 1, 0,WMS_3Dmkr_name, 1, 0.05, "TahomaB"];
			}];
		};
		case "blue": {
			WMS_3Dmkr_ID_grp = addMissionEventHandler ["Draw3D", {
				drawIcon3D [getMissionPath "Custom\3Dmarkers\WMS_3Dmarker.paa", [[0,0.3,0.6,1],[0,0.3,0.6,1]], ASLToAGL WMS_3Dmkr_pos_grp, 1, 1, 0,WMS_3Dmkr_name, 1, 0.05, "TahomaB"];
			}];
		};
		case "green": {
			WMS_3Dmkr_ID_grp = addMissionEventHandler ["Draw3D", {
				drawIcon3D [getMissionPath "Custom\3Dmarkers\WMS_3Dmarker.paa", [[0,0.5,0,1],[0,0.5,0,1]], ASLToAGL WMS_3Dmkr_pos_grp, 1, 1, 0,WMS_3Dmkr_name, 1, 0.05, "TahomaB"];
			}];
		};
		case "red": {
			WMS_3Dmkr_ID_grp = addMissionEventHandler ["Draw3D", {
				drawIcon3D [getMissionPath "Custom\3Dmarkers\WMS_3Dmarker.paa", [[0.5,0,0,1],[0.5,0,0,1]], ASLToAGL WMS_3Dmkr_pos_grp, 1, 1, 0,WMS_3Dmkr_name, 1, 0.05, "TahomaB"];
			}];
		};
		case "yellow": {
			WMS_3Dmkr_ID_grp = addMissionEventHandler ["Draw3D", {
				drawIcon3D [getMissionPath "Custom\3Dmarkers\WMS_3Dmarker.paa", [[0.85,0.85,0,1],[0.85,0.85,0,1]], ASLToAGL WMS_3Dmkr_pos_grp, 1, 1, 0,WMS_3Dmkr_name, 1, 0.05, "TahomaB"];
			}];
		};
		case "khaki": {
			WMS_3Dmkr_ID_grp = addMissionEventHandler ["Draw3D", {
				drawIcon3D [getMissionPath "Custom\3Dmarkers\WMS_3Dmarker.paa", [[0.5,0.6,0.4,1],[0.5,0.6,0.4,1]], ASLToAGL WMS_3Dmkr_pos_grp, 1, 1, 0,WMS_3Dmkr_name, 1, 0.05, "TahomaB"];
			}];
		};
	};
	if (_remoteEx) then {
		{
			if (_x != player) then {[WMS_3Dmkr_pos_grp,true,false,_PlayerName,_color]remoteExec ["WMS_fnc_client_3Dmarkers",owner _x];};
		}forEach Units (group player);
	};
} else {
	_ID = missionNamespace getVariable ["WMS_3Dmkr_ID", -1];
	_ins = [];
	if (_ID != -1) then {
		removeMissionEventHandler ["Draw3D",WMS_3Dmkr_ID];
		WMS_3Dmkr_ID = -1;
		WMS_3Dmkr_pos = [];
	};
	if (count _pos == 0) then {
		_ins = lineIntersectsSurfaces [
			AGLToASL positionCameraToWorld [0,0,0],
			AGLToASL positionCameraToWorld [0,0,1000],
			vehicle player
		];
		if (count _ins != 0) then {
			WMS_3Dmkr_pos = (_ins select 0 select 0);
		};
	}else {
		WMS_3Dmkr_pos = _pos;
	};
	if (count WMS_3Dmkr_pos == 0) exitWith {};
	switch (toLower _color) do {
		case "orange": {
			WMS_3Dmkr_ID = addMissionEventHandler ["Draw3D", {
				drawIcon3D [getMissionPath "Custom\3Dmarkers\WMS_3Dmarker.paa", [0.85,0.4,0,1], ASLToAGL WMS_3Dmkr_pos, 1, 1, 0];
			}];
		};
		case "blue": {
			WMS_3Dmkr_ID = addMissionEventHandler ["Draw3D", {
				drawIcon3D [getMissionPath "Custom\3Dmarkers\WMS_3Dmarker.paa", [0,0.3,0.6,1], ASLToAGL WMS_3Dmkr_pos, 1, 1, 0];
			}];
		};
		case "green": {
			WMS_3Dmkr_ID = addMissionEventHandler ["Draw3D", {
				drawIcon3D [getMissionPath "Custom\3Dmarkers\WMS_3Dmarker.paa", [0,0.5,0,1], ASLToAGL WMS_3Dmkr_pos, 1, 1, 0];
			}];
		};
		case "red": {
			WMS_3Dmkr_ID = addMissionEventHandler ["Draw3D", {
				drawIcon3D [getMissionPath "Custom\3Dmarkers\WMS_3Dmarker.paa", [0.5,0,0,1], ASLToAGL WMS_3Dmkr_pos, 1, 1, 0];
			}];
		};
		case "yellow": {
			WMS_3Dmkr_ID = addMissionEventHandler ["Draw3D", {
				drawIcon3D [getMissionPath "Custom\3Dmarkers\WMS_3Dmarker.paa", [0.85,0.85,0,1], ASLToAGL WMS_3Dmkr_pos, 1, 1, 0];
			}];
		};
		case "khaki": {
			WMS_3Dmkr_ID = addMissionEventHandler ["Draw3D", {
				drawIcon3D [getMissionPath "Custom\3Dmarkers\WMS_3Dmarker.paa", [0.5,0.6,0.4,1], ASLToAGL WMS_3Dmkr_pos, 1, 1, 0];
			}];
		};
	};
};
