_targetUID = getPlayerUID player;
_targetOwner = (owner player);
WMS_HC_AllDeadsMgr = [];
if (WMS_MissionDebug) then {diag_log format ["[PLAYERJOINING_HC1]|WAK|TNA|WMS| player: %1, UID: %2", player, _targetUID]};

//test to run AmbientLife on HC1 ONLY
waitUntil {time > 5};
if (name player == "HC1") then {
	/*WMS_HC1 = (owner player);*/ //moron!
	WMS_HC1 = true;
	publicVariable "WMS_HC1";
	if (worldName == "Cam_Lao_Nam") then {
		[] execVM "HC_Package\HC_CustomFunctions.sqf"; //workInProgress
		[] execVM "HC_Package\WMS_AL_Functions_HC1.sqf"; //workInProgress
	};
};

addMissionEventHandler ["PlayerDisconnected", //DOESNT WORK //old
	{
		params ["_id", "_uid", "_name", "_jip", "_owner", "_idstr"];
		WMS_HC1 = false;
		publicVariable "WMS_HC1";
		if (true) then {diag_log format ["[PLAYERLEAVING_HC1]|WAK|TNA|WMS| player: %1, UID: %2", _name, _uid]};
	}
];

player addMPEventHandler ["MPkilled", {
		if (true) then {diag_log format ["[PLAYERLEAVING_HC1]|WAK|TNA|WMS| HeadlessClient is... DEAD ??? _this: %1", _this]};
		WMS_HC1 = false;
		publicVariable "WMS_HC1";
	}];

HC1_60secLoop = {
    while {true} do
    {
		if (true) then {diag_log format ["[HC1_60SecLoop]|WAK|TNA|WMS| player: %1, UID: %2, FPS: %3", name player, getPlayerUID player, diag_fps]};
        uisleep 60;
		if (worldName == "Cam_Lao_Nam"&&{name player == "HC1"}) then {
			WMS_HC1 = true; //workInProgress
			publicVariable "WMS_HC1";
			call WMS_fnc_HC_AllDeadsMgr; //workInProgress
		};
    };
 };
[] call HC1_60secLoop;