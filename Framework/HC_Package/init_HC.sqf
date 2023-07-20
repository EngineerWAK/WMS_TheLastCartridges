_targetUID = getPlayerUID player;
_targetOwner = (owner player);
//WMS_HC_AllDeadsMgr = [];
if (WMS_MissionDebug) then {diag_log format ["[PLAYERJOINING_HC1]|WAK|TNA|WMS| player: %1, UID: %2", player, _targetUID]};

//test to run AmbientLife on HC1 ONLY
waitUntil {time > 5};
if (name player == "HC1") then {
	WMS_HC1 = true;
	publicVariable "WMS_HC1";
	//if (worldName == "Cam_Lao_Nam") then {
		//[] execVM "HC_Package\HC_CustomFunctions.sqf"; //workInProgress
		[] execVM "HC_Package\WMS_AL_Functions_HC1.sqf"; //workInProgress
	//};
};
		
if (name player == "HC2") then {
	WMS_HC2 = true; //workInProgress
	publicVariable "WMS_HC2";
};
		
if (name player == "HC3") then {
	WMS_HC3 = true; //workInProgress
	publicVariable "WMS_HC3";
};

addMissionEventHandler ["PlayerDisconnected", //DOESNT WORK //old
	{
		params ["_id", "_uid", "_name", "_jip", "_owner", "_idstr"];
		if (_name == "HC1") then {
			WMS_HC1 = false;
			publicVariable "WMS_HC1";
		};
		if (_name == "HC2") then {
			WMS_HC2 = false;
			publicVariable "WMS_HC2";
		};
		if (_name == "HC3") then {
			WMS_HC3 = false;
			publicVariable "WMS_HC3";
		};		
		if (true) then {diag_log format ["[PLAYERLEAVING]|WAK|TNA|WMS| HC name: %1, UID: %2", _name, _uid]};
		[format["[RECEIVING MESSAGE FROM HC]'PlayerDisconnected' %1",(["_id", "_uid", "_name", "_jip", "_owner", "_idstr"])]] RemoteExec ["diag_log",2];
	}
];

player addMPEventHandler ["MPkilled", {
		params ["_unit", "_killer", "_instigator", "_useEffects"];
		if (true) then {diag_log format ["[PLAYERLEAVING_HC1]|WAK|TNA|WMS| HeadlessClient is... DEAD ??? _this: %1", _this]};
		if (name _unit == "HC1") then {
			WMS_HC1 = false;
			publicVariable "WMS_HC1";
		};
		if (name _unit == "HC2") then {
			WMS_HC2 = false;
			publicVariable "WMS_HC2";
		};
		if (name _unit == "HC3") then {
			WMS_HC3 = false;
			publicVariable "WMS_HC3";
		};		
		[format["[RECEIVING MESSAGE FROM HC]'MPkilled' %1",(["_unit", "_killer", "_instigator", "_useEffects"])]] RemoteExec ["diag_log",2];
	}];

HC_60secLoop = {
    while {true} do
    {
		if (true) then {diag_log format ["[HC1_60SecLoop]|WAK|TNA|WMS| player: %1, UID: %2, FPS: %3", name player, getPlayerUID player, diag_fps]};
        uisleep 50;
		if (name player == "HC1") then {
			WMS_HC1 = true; //workInProgress
			publicVariable "WMS_HC1";
			//call WMS_fnc_HC_AllDeadsMgr; //workInProgress
			call WMS_fnc_AllDeadsMgr; //@infantryProgram
		};
		uisleep 5;
		if (name player == "HC2") then {
			WMS_HC2 = true; //workInProgress
			publicVariable "WMS_HC2";
			//call WMS_fnc_HC_AllDeadsMgr; //workInProgress
			call WMS_fnc_AllDeadsMgr; //@infantryProgram
		};
		uisleep 5;
		if (name player == "HC3") then {
			WMS_HC3 = true; //workInProgress
			publicVariable "WMS_HC3";
			//call WMS_fnc_HC_AllDeadsMgr; //workInProgress
			call WMS_fnc_AllDeadsMgr; //@infantryProgram
		};
		[format["[RECEIVING MESSAGE FROM HC]'HC_60secLoop' %1",([name player, getPlayerUID player, diag_fps])]] RemoteExec ["diag_log",2];
    };
 };
[] call HC_60secLoop;