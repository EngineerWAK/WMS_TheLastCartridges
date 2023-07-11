WMS_HeadlessOwnerID = (owner player);
publicVariable "WMS_HeadlessOwnerID";
_targetUID = getPlayerUID player;
_targetOwner = (owner player);
if (WMS_MissionDebug) then {diag_log format ["[PLAYERJOINING_HC1]|WAK|TNA|WMS| player: %1, UID: %2", player, _targetUID]};

addMissionEventHandler ["PlayerDisconnected", //DOESNT WORK //old
	{
		params ["_id", "_uid", "_name", "_jip", "_owner", "_idstr"];
		WMS_HeadlessOwnerID = 2;
		publicVariable "WMS_HeadlessOwnerID";
		if (WMS_MissionDebug) then {diag_log format ["[PLAYERLEAVING_HC1]|WAK|TNA|WMS| player: %1, UID: %2", _name, _uid]};
	}
];

player addMPEventHandler ["killed", {
		if (WMS_MissionDebug) then {diag_log format ["[PLAYERLEAVING_HC1]|WAK|TNA|WMS| HeadlessClient is... DEAD ??? _this: %1", _this]};
	}];

HC1_60secLoop = {
    while {true} do
    {
		if (WMS_MissionDebug) then {diag_log format ["[HC1_60SecLoop]|WAK|TNA|WMS| player: %1, UID: %2, FPS: %3", name player, getPlayerUID player, diag_fps]};
        uisleep 60;
    };
 };
[] call HC1_60secLoop;