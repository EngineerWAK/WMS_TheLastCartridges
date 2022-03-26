/**
 * initPlayerLocal.sqf
 *
 * TNA-Community
 * https://discord.gg/Zs23URtjwF
 * © 2021 {|||TNA|||}WAKeupneo
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
_playerRole = roleDescription player;
switch (tolower _playerRole) do {
        case "lonewolf":
    {
        [INDEPENDENT, "IND_Bambi"] call BIS_fnc_addRespawnInventory;
        [INDEPENDENT, "IND_Assault"] call BIS_fnc_addRespawnInventory;
        [INDEPENDENT, "IND_Assault2"] call BIS_fnc_addRespawnInventory;
        [INDEPENDENT, "IND_Marksman"] call BIS_fnc_addRespawnInventory;
        [INDEPENDENT, "IND_Marksman2"] call BIS_fnc_addRespawnInventory;
        [INDEPENDENT, "IND_MG"] call BIS_fnc_addRespawnInventory;
        [INDEPENDENT, "IND_Medic"] call BIS_fnc_addRespawnInventory;
        [INDEPENDENT, "IND_Engineer"] call BIS_fnc_addRespawnInventory;
        [INDEPENDENT, "IND_GI"] call BIS_fnc_addRespawnInventory;
        [INDEPENDENT, "IND_Frantz"] call BIS_fnc_addRespawnInventory;
        [INDEPENDENT, "IND_Sniper"] call BIS_fnc_addRespawnInventory;
        [INDEPENDENT, "IND_Pilot"] call BIS_fnc_addRespawnInventory;
    };
        case "bambi": //no Bambi role yet
    {
        [INDEPENDENT, "IND_Bambi"] call BIS_fnc_addRespawnInventory;
    };
};

if (hasinterface) then {
    inGameUISetEventHandler ["Action", " 
    if (_this select 3 == 'Land') then 
    { 
        hint 'NOPE! no AutoLanding';  
        true 
    } 
    "];
    ///////////Artillery computer
    enableEngineArtillery false;
    //setCurrentChannel 3; //Group Channel DO NOT WORK HERE
    //Fix The Disapearing Chat//
    _action0 = ["FixMyChat","Fix My Chat","",{showChat true},{true}] call ace_interact_menu_fnc_createAction;
    [player, 1, ["ACE_SelfActions"], _action0] call ace_interact_menu_fnc_addActionToObject;

    _action1 = ["vhlInvSize","Inventory Size","",{hint format ["cargo size is %1",(getNumber(configFile >> "CfgVehicles" >> (typeOf vehicle player) >> "maximumLoad"))]},{(vehicle player) != player}] call ace_interact_menu_fnc_createAction;
    [player, 1, ["ACE_SelfActions"], _action1] call ace_interact_menu_fnc_addActionToObject;
    //////////Mission File version on the map//////////
    _markerSystem = createMarkerLocal ["MissionVersion", [(worldsize /2),-500]];
    _markerSystem setMarkerTypeLocal "mil_dot";
    _markerSystem setMarkerColorLocal "ColorKhaki";
    _markerSystem setMarkerTextLocal (format ["The Last Cartridges %1 ", getText(missionConfigFile >> "CfgSystemVersion" >> "name")]);
    ////////// temporary markers on permanent vehicles
    //[] execVM "Custom\MarkerOnPersonalVhls.sqf";
    [player] remoteExec ["WMS_fnc_getOwnedPermanentVhls", 2]; //to the server
    //////////Bypass the "faction only" bulshit //////////
    [] execVM "Custom\AllUniforms.sqf";

    ////////// Parachute / Halo //////////
    //[] execVM "Custom\HaloParachute\init.sqf";

    /////////// Max TerrainGrid //////////
    //[] execVM "Custom\TerrainGrid\TerrainGrid.sqf";

    //////////Briefing//////////
    _null = [] execVM "Custom\Briefing\briefing.sqf"; // Briefing and Rules

    //////////Mission related//////////
    [] execVM "initPlayerEventHandlers.sqf";
    [] execVM "initTriggerZonesOnMarkers.sqf";


    /////////// Load Status Bar //////////
    [] execVM "Custom\StatusBar\statusBar_init.sqf"; //Use Exile Threads manager
    WMS_StatusBarTest = {
        while {true} do
        {
            "MKR_"+(name player) setMarkerPosLocal (position player);
            "MKR_"+(name player) setMarkerDirLocal (getDir player);
            [] call statusBar_update;
            uisleep 2;
        };
    };
};

if !(hasInterface) then {
	WMS_HeadlessOwnerID = (owner player);
	publicVariable "WMS_HeadlessOwnerID";
	_targetUID = getPlayerUID player;
	_targetOwner = (owner player);
	if (true) then {diag_log format ["[PLAYERJOINING_HC1]|WAK|TNA|WMS| player: %1, UID: %2", player, _targetUID]};

	addMissionEventHandler ["PlayerDisconnected", //DOESNT WORK
		{
			params ["_id", "_uid", "_name", "_jip", "_owner", "_idstr"];
			WMS_HeadlessOwnerID = 2;
			publicVariable "WMS_HeadlessOwnerID";
			if (true) then {diag_log format ["[PLAYERLEAVING_HC1]|WAK|TNA|WMS| player: %1, UID: %2", _name, _uid]};

		}
	];

    HC1_60secLoop = {
        while {true} do
        {
			if (true) then {diag_log format ["[HC1_60SecLoop]|WAK|TNA|WMS| player: %1, UID: %2, FPS: %3", name player, getPlayerUID player, diag_fps]};
            uisleep 60;
        };
    };
    [] call HC1_60secLoop;
};