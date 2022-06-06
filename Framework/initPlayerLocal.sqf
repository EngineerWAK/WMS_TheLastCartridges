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
//////////CustomRespawn
[]call WMS_fnc_client_retrieveRespawnData;
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

    ["WMS 3Dmarker", "UserAction15", "3D Marker", {[nil,false,false,nil,"blue"]call WMS_fnc_client_3Dmarkers}, {}, [0x108, [false, false, false]]] call CBA_fnc_addKeybind;//Custom user action 15
    ["WMS 3Dmarker", "UserAction16", "Group 3D Marker", {[[],true,true,nil,"green"]call WMS_fnc_client_3Dmarkers}, {}, [0x109, [false, false, false]]] call CBA_fnc_addKeybind;//Custom user action 16
    ["WMS 3Dmarker", "UserAction17", "Map 3D Marker", {
        openMap true;
        _this spawn {
	        uisleep 2;
	        onMapSingleClick { 
		        onMapSingleClick {};
		        [(AGLtoASL _pos),false,false,nil,"orange"]call WMS_fnc_client_3Dmarkers;
		        openMap false;
		        true
	        };
        };
    }, {}, [0x10A, [false, false, false]]] call CBA_fnc_addKeybind;//Custom user action 17
    ["WMS 3Dmarker", "UserAction18", "Map Group 3D Marker", {
        openMap true;
        _this spawn {
	        uisleep 2;
	        onMapSingleClick { 
		        onMapSingleClick {};
		        [(AGLtoASL _pos),true,true,nil,"khaki"]call WMS_fnc_client_3Dmarkers;
		        openMap false;
		        true
	        };
        };
    }, {}, [0x10B, [false, false, false]]] call CBA_fnc_addKeybind;//Custom user action 18
        
    _action2 = ["FixMyChat","Fix My Chat","",{showChat true},{true}] call ace_interact_menu_fnc_createAction;
    [player, 1, ["ACE_SelfActions"], _action2] call ace_interact_menu_fnc_addActionToObject;

    _action3 = ["vhlInvSize","Inventory Size","",{hint format ["cargo size is %1",(getNumber(configFile >> "CfgVehicles" >> (typeOf vehicle player) >> "maximumLoad"))]},{(vehicle player) != player}] call ace_interact_menu_fnc_createAction;
    [player, 1, ["ACE_SelfActions"], _action3] call ace_interact_menu_fnc_addActionToObject;

    _action4 = ["SaveAndDisconnect","Save and Disconnect","",{[]call WMS_fnc_client_saveRespawnData},{(vehicle player) == player}] call ace_interact_menu_fnc_createAction;
    [player, 1, ["ACE_SelfActions"], _action4] call ace_interact_menu_fnc_addActionToObject;
    
    /*//DFO Self Action:
	private _actionDFO = ["RequestDFOmission","Request DFO Mission","",{
		if (WMS_DFO_UsePilotsList)then{
			if((getPlayerUID player) in WMS_DFO_PilotsList)then{
				[player,selectRandom WMS_DFO_ObjToAddAction] remoteExec ['WMS_fnc_Event_DFO', 2];
				hint 'Contacting Air Operations HQ';
			}else{
				hint 'DFO only for selected pilots, contact admins';
			};
		}else{
			[player,selectRandom WMS_DFO_ObjToAddAction] remoteExec ['WMS_fnc_Event_DFO', 2];
			hint 'Contacting Air Operations HQ';
		};
	},{
		(alive player) &&
		{vehicle player isKindOf "helicopter"} &&
		{count WMS_DFO_BasePositions != 0} &&
		{count WMS_DFO_ObjToAddAction != 0} &&
		{(count WMS_DFO_Running) < WMS_DFO_MaxRunning} &&
		{time > (WMS_DFO_LastCall+WMS_DFO_CoolDown)}
		}
	] call ace_interact_menu_fnc_createAction;
	[player, 1, ["ACE_SelfActions"], _actionDFO] call ace_interact_menu_fnc_addActionToObject;
    */
    //////////Mission File version on the map//////////
    _markerSystem = createMarkerLocal ["MissionVersion", [(worldsize /2),-500]];
    _markerSystem setMarkerTypeLocal "mil_dot";
    _markerSystem setMarkerColorLocal "ColorKhaki";
    _markerSystem setMarkerTextLocal (format ["The Last Cartridges %1 ", getText(missionConfigFile >> "CfgSystemVersion" >> "name")]);
    ////////// temporary markers on permanent vehicles
    [player] remoteExec ["WMS_fnc_getOwnedPermanentVhls", 2]; //to the server
    //////////Bypass the "faction only" bulshit //////////
    [] execVM "Custom\AllUniforms.sqf";

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