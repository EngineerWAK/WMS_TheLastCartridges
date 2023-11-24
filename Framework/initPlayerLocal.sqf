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
        [INDEPENDENT, "IND_Breacher"] call BIS_fnc_addRespawnInventory;
        [INDEPENDENT, "IND_GI"] call BIS_fnc_addRespawnInventory;
        [INDEPENDENT, "IND_Frantz"] call BIS_fnc_addRespawnInventory;
        [INDEPENDENT, "IND_Sniper"] call BIS_fnc_addRespawnInventory;
        [INDEPENDENT, "IND_Pilot"] call BIS_fnc_addRespawnInventory;
        [INDEPENDENT, "IND_RMO"] call BIS_fnc_addRespawnInventory;
    };
};
//USER ACTIONS: //it seems that it not always 100% working from here, oving to "respawn EH"
    /*//Bohemia shit plane auto-landing
    inGameUISetEventHandler ["Action", " 
    if (_this select 3 == 'Land' || _this select 4 == 'Landing autopilot') then 
    { 
        hint 'NOPE! No AutoLanding';  
        true 
    } 
    "];
    //Hatchet shit function to autostart choppers
    inGameUISetEventHandler ["Action", " 
    if (_this select 4 == 'Automatic Engine Startup') then 
    { 
        hint 'NOPE! No QuickStart';  
        true 
    } 
    "];
    //RHS shit function to tow statics
    inGameUISetEventHandler ["Action", " 
    if (_this select 4 == ' Switch to moving mode') then 
    { 
        hint 'NOPE! Not gonna happen';  
        true 
    } 
    "];*/
call WMS_fnc_UIactions;
/////
if (hasinterface) then {
    ///////////Artillery computer
    enableEngineArtillery false;

    //Dynamic camo
    //[]spawn WMS_fnc_client_dynamicCamo;
    [] execVM "Fonctions\WMS_client_dynamicCamo.sqf";
    //DFO Choppers Actions
    //[] execVM "DFO\DFO_playerLocal.sqf"; //not with standalone
    //LBIS tips and tricks
    []spawn WMS_fnc_client_LBIS;

    [] execVM "PlayerActions.sqf";
/////
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
    missionNameSpace setVariable ["WMS_PlayerConnect", serverTime];

    /////////// Load Status Bar //////////
    [] execVM "Custom\StatusBar\statusBar_init.sqf"; //Use Exile Threads manager
    WMS_StatusBarTest = {
        while {true} do
        {
            if !(player getVariable ["WMS_Specialist_RMO",false])then{
                "MKR_"+(name player) setMarkerPosLocal (position player);
                "MKR_"+(name player) setMarkerDirLocal (getDir player);
            };
            [] call statusBar_update;
            uisleep 2;
        };
    };
};