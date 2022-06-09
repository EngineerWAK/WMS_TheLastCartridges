/**
 * WMS_fnc_client_3Dmarkers
 *
 * TNA-Community
 * https://discord.gg/Zs23URtjwF
 * © 2022 {|||TNA|||}WAKeupneo
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
private ["_ID","_ID1","_ID2","_ID3","_ins","_3Dmkr_Failed"];
params [
	["_pos", []],
	["_grp", false],
	["_remoteEx",false],
	["_PlayerName",(name player)],
	["_type", "orange"],
	["_crew", false]
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
	switch (toLower _type) do {
		case "group1": { //CBA Settings
			WMS_3Dmkr_ID_grp = addMissionEventHandler ["Draw3D", {
				drawIcon3D [getMissionPath "Custom\3Dmarkers\WMS_3Dmarker.paa", [WMS_3Dmkr_color_group1,WMS_3Dmkr_color_group1], ASLToAGL WMS_3Dmkr_pos_grp, WMS_3Dmkr_size_group, WMS_3Dmkr_size_group, 0,WMS_3Dmkr_name, 1, 0.035];
			}];
		};
		case "groupmap1": { //CBA Settings
			WMS_3Dmkr_ID_grp = addMissionEventHandler ["Draw3D", {
				drawIcon3D [getMissionPath "Custom\3Dmarkers\WMS_3Dmarker.paa", [WMS_3Dmkr_color_groupMap1,WMS_3Dmkr_color_groupMap1], ASLToAGL WMS_3Dmkr_pos_grp, WMS_3Dmkr_size_group, WMS_3Dmkr_size_group, 0,WMS_3Dmkr_name, 1, 0.035];
			}];
		};
		case "orange": {
			WMS_3Dmkr_ID_grp = addMissionEventHandler ["Draw3D", {
				drawIcon3D [getMissionPath "Custom\3Dmarkers\WMS_3Dmarker.paa", [[0.85,0.4,0,1],[0.85,0.4,0,1]], ASLToAGL WMS_3Dmkr_pos_grp, 1, 1, 0,WMS_3Dmkr_name, 1, 0.035];
			}];
		};
	};
	if (_remoteEx) then {
		{
			if (_x != player) then {[WMS_3Dmkr_pos_grp,true,false,_PlayerName,_type]remoteExec ["WMS_fnc_client_3Dmarkers",owner _x];};
		}forEach Units (group player);
	};
} else {
	if (_crew) then {
		_ID3 = missionNamespace getVariable ["WMS_3Dmkr_ID_crew", -1];
		_ins = [];
		if (_ID3 != -1) then {
			removeMissionEventHandler ["Draw3D",WMS_3Dmkr_ID_crew];
			WMS_3Dmkr_ID_crew = -1;
			WMS_3Dmkr_pos_crew = [];
		};
		if (count _pos == 0) then {
			_ins = lineIntersectsSurfaces [
				AGLToASL positionCameraToWorld [0,0,0],
				AGLToASL positionCameraToWorld [0,0,1000],
				vehicle player
			];
			if (count _ins != 0) then {
				WMS_3Dmkr_pos_crew = (_ins select 0 select 0);
			};
		}else {
			WMS_3Dmkr_pos_crew = _pos;
		};
		if (count WMS_3Dmkr_pos_crew == 0) exitWith {};
		if (vehicle player == player) exitWith {};
			WMS_3Dmkr_name_crew = _PlayerName;
			switch (toLower _type) do {
				case "crew1": { //CBA Settings
					WMS_3Dmkr_ID_crew = addMissionEventHandler ["Draw3D", {
						drawIcon3D [getMissionPath "Custom\3Dmarkers\WMS_3Dmarker.paa", [WMS_3Dmkr_color_crew1,WMS_3Dmkr_color_crew1], ASLToAGL WMS_3Dmkr_pos_crew, WMS_3Dmkr_size_crew, WMS_3Dmkr_size_crew, 0,WMS_3Dmkr_name_crew, 1, 0.035];
					}];
				};
				case "crewmap1": { //CBA Settings
					WMS_3Dmkr_ID_crew = addMissionEventHandler ["Draw3D", {
						drawIcon3D [getMissionPath "Custom\3Dmarkers\WMS_3Dmarker.paa", [WMS_3Dmkr_color_crewMap1,WMS_3Dmkr_color_crewMap1], ASLToAGL WMS_3Dmkr_pos_crew, WMS_3Dmkr_size_crew, WMS_3Dmkr_size_crew, 0,WMS_3Dmkr_name_crew, 1, 0.035];
					}];
				};
				case "orange": {
					WMS_3Dmkr_ID_crew = addMissionEventHandler ["Draw3D", {
						drawIcon3D [getMissionPath "Custom\3Dmarkers\WMS_3Dmarker.paa", [[0.85,0.4,0,1],[0.85,0.4,0,1]], ASLToAGL WMS_3Dmkr_pos_crew, 1, 1, 0,WMS_3Dmkr_name, 1, 0.035];
					}];
				};
			};
			if (_remoteEx) then {
				{
					if (_x != player) then {[WMS_3Dmkr_pos_crew,true,false,_PlayerName,_type]remoteExec ["WMS_fnc_client_3Dmarkers",owner _x];};
				}forEach crew (vehicle player);
			};
		
	} else {
		_3Dmkr_Failed = false;
		_ID1 = missionNamespace getVariable ["WMS_3Dmkr_ID1", -1];
		_ID2 = missionNamespace getVariable ["WMS_3Dmkr_ID2", -1];
		_ins = [];
		if (_type == "local1"||_type == "map1") then {
			if (_ID1 != -1) then {
				removeMissionEventHandler ["Draw3D",WMS_3Dmkr_ID1];
				WMS_3Dmkr_ID1 = -1;
				WMS_3Dmkr_pos1 = [];
			};
			if (count _pos == 0) then {
				_ins = lineIntersectsSurfaces [
					AGLToASL positionCameraToWorld [0,0,0],
					AGLToASL positionCameraToWorld [0,0,1000],
					vehicle player
				];
				if (count _ins != 0) then {
					WMS_3Dmkr_pos1 = (_ins select 0 select 0);
				};
			}else {
				WMS_3Dmkr_pos1 = _pos;
			};
			if (count WMS_3Dmkr_pos1 == 0) then {_3Dmkr_Failed = true};
		};
		if (_type == "local2"||_type == "map2") then {
			if (_ID2 != -1) then {
				removeMissionEventHandler ["Draw3D",WMS_3Dmkr_ID2];
				WMS_3Dmkr_ID2 = -1;
				WMS_3Dmkr_pos2 = [];
			};
			if (count _pos == 0) then {
				_ins = lineIntersectsSurfaces [
					AGLToASL positionCameraToWorld [0,0,0],
					AGLToASL positionCameraToWorld [0,0,1000],
					vehicle player
				];
				if (count _ins != 0) then {
					WMS_3Dmkr_pos2 = (_ins select 0 select 0);
				};
			}else {
				WMS_3Dmkr_pos2 = _pos;
			};
			if (count WMS_3Dmkr_pos2 == 0) then {_3Dmkr_Failed = true};
		};
		if (_type == "orange") then {_3Dmkr_Failed = true}; //for now
		if (_3Dmkr_Failed) exitWith {diag_log "3DMKR_DELETE_3DMKR_FAILED_3DMKR_DELETE_3DMKR_FAILED_3DMKR_DELETE_3DMKR_FAILED_3DMKR_DELETE_"};
		switch (toLower _type) do {
			case "local1": { //CBA Settings
				WMS_3Dmkr_ID1 = addMissionEventHandler ["Draw3D", {
					drawIcon3D [getMissionPath "Custom\3Dmarkers\WMS_3Dmarker.paa", WMS_3Dmkr_color_local1, ASLToAGL WMS_3Dmkr_pos1, WMS_3Dmkr_size_local, WMS_3Dmkr_size_local, 0,"",1];
				}];
			};
			case "map1": { //CBA Settings
				WMS_3Dmkr_ID1 = addMissionEventHandler ["Draw3D", {
					drawIcon3D [getMissionPath "Custom\3Dmarkers\WMS_3Dmarker.paa", WMS_3Dmkr_color_localMap1, ASLToAGL WMS_3Dmkr_pos1, WMS_3Dmkr_size_local, WMS_3Dmkr_size_local, 0,"",1];
				}];
			};
			/*case "local2": { //CBA Settings
				WMS_3Dmkr_ID2 = addMissionEventHandler ["Draw3D", {
					drawIcon3D [getMissionPath "Custom\3Dmarkers\WMS_3Dmarker.paa", WMS_3Dmkr_color_local2, ASLToAGL WMS_3Dmkr_pos2, WMS_3Dmkr_size_local, WMS_3Dmkr_size_local, 0,"",1];
				}];
			};
			case "map2": { //CBA Settings
				WMS_3Dmkr_ID2 = addMissionEventHandler ["Draw3D", {
					drawIcon3D [getMissionPath "Custom\3Dmarkers\WMS_3Dmarker.paa", WMS_3Dmkr_color_localMap2, ASLToAGL WMS_3Dmkr_pos2, WMS_3Dmkr_size_local, WMS_3Dmkr_size_local, 0,"",1];
				}];
			};*/
		};
	};
};
