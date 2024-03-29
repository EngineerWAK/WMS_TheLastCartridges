/**
 * PlayerActions.sqf
 *
 * TNA-Community
 * https://discord.gg/Zs23URtjwF
 * © 2023 {|||TNA|||}WAKeupneo
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
/*_playerTraits = 
    player getVariable ["WMS_Specialist_Bambi",false],
    player getVariable ["WMS_Specialist_RMO",false],
	
    player getVariable ["WMS_Specialist_Engineer",false],
    player getVariable ["WMS_Specialist_Medic",false]

    player getVariable ["WMS_Specialist_Sniper",false],
    player getVariable ["WMS_Specialist_Breacher",false],

	player getVariable ["WMS_CamoCoef",[1,1]]; //[0.8,0.1]
    player getVariable ["WMS_AudiCoef",[1,1]]; //[0.8,0.1]

    player getVariable ["ace_IsEngineer",0]; //0,1,2
    player getVariable ["ace_medical_medicclass",0]; //0,1,2
*/

private _action1 = ["SkillsSets","Display Skills","",{
		showChat true;
		[playerSide, 'PAPA_BEAR'] commandChat format ["SKILL Bambi: %1, SKILL RealMenOnly: %2", player getVariable ["WMS_Specialist_Bambi",false], player getVariable ["WMS_Specialist_RMO",false]];
		[playerSide, 'PAPA_BEAR'] commandChat format ["SKILL Engineer: %1, SKILL Medic: %2", player getVariable ["WMS_Specialist_Engineer",false], player getVariable ["WMS_Specialist_Medic",false]];
		[playerSide, 'PAPA_BEAR'] commandChat format ["SKILL Sniper: %1, SKILL Breacher: %2", player getVariable ["WMS_Specialist_Sniper",false], player getVariable ["WMS_Specialist_Breacher",false]];
		[playerSide, 'PAPA_BEAR'] commandChat format ["Camo Coef: %1, Audible Coef: %2", player getVariable ["WMS_CamoCoef",[1,1]], player getVariable ["WMS_AudiCoef",[1,1]]];
		[playerSide, 'PAPA_BEAR'] commandChat format ["ACE Engineer lvl: %1, ACE Medic lvl: %2", player getVariable ["ace_IsEngineer",0], player getVariable ["ace_medical_medicclass",0]];
		[playerSide, 'PAPA_BEAR'] commandChat format ["Save&Disconnect Time: %1, Server Time: %2", player getVariable ["WMS_SaveAndResp_Timer",0], serverTime];
	},{true}] call ace_interact_menu_fnc_createAction;
    [player, 1, ["ACE_SelfActions"], _action1] call ace_interact_menu_fnc_addActionToObject;

private _action2 = ["FixMyChat","Fix My Chat","",{showChat true},{true}] call ace_interact_menu_fnc_createAction;
    [player, 1, ["ACE_SelfActions"], _action2] call ace_interact_menu_fnc_addActionToObject;

private _action22 = ["DeactivateMyChat","Deactivate My Chat","",{showChat false},{true}] call ace_interact_menu_fnc_createAction;
    [player, 1, ["ACE_SelfActions"], _action22] call ace_interact_menu_fnc_addActionToObject;

private _action3 = ["vhlInvSize","Inventory Size","",{hint format ["cargo size is %1",(getNumber(configFile >> "CfgVehicles" >> (typeOf vehicle player) >> "maximumLoad"))]},{(vehicle player) != player}] call ace_interact_menu_fnc_createAction;
    [player, 1, ["ACE_SelfActions"], _action3] call ace_interact_menu_fnc_addActionToObject;

private _action4 = ["MoveOutCrew","Eject Crew","",{
            ({if (_x != player) then {moveOut _x}}forEach (crew (vehicle player)))
        },{
            ((vehicle player) != player)&&
            {(driver (vehicle player) == player)}&&
            {(count (crew (vehicle player)) > 1)}
        }] call ace_interact_menu_fnc_createAction;
    [player, 1, ["ACE_SelfActions"], _action4] call ace_interact_menu_fnc_addActionToObject;

private _action5 = ["MoveOutForced","Force MoveOut","",{moveOut player},{((vehicle player) != player)&&{damage (vehicle player) == 1}}] call ace_interact_menu_fnc_createAction;
    [player, 1, ["ACE_SelfActions"], _action5] call ace_interact_menu_fnc_addActionToObject;

/////_target setVariable ["WMS_SaveAndResp_Timer",serverTime+3600,true]; //will be use to block ACE "Save & Respawn" option
private _action6 = ["SaveAndDisconnectTimed","Save and Disconnect, Timed","",{
			[]call WMS_fnc_client_saveRespawnData
        },{
            ((vehicle player) == player) &&
            {servertime > ((player getVariable ["WMS_lastKill",0])+60)} &&
            {servertime > (player getVariable ["WMS_SaveAndResp_Timer",0])} &&
            {(localNamespace getVariable ['WMS_Loc_CanBuildComputer',true])};
        }] call ace_interact_menu_fnc_createAction;
    [player, 1, ["ACE_SelfActions"], _action6] call ace_interact_menu_fnc_addActionToObject;

private _action7 = ["SaveAndDisconnectTimed","REMOVE YOUR COMPUTER BEFORE Save and Disconnect!","",{
			[]call WMS_fnc_client_saveRespawnData
        },{
            ((vehicle player) == player) &&
            {servertime > ((player getVariable ["WMS_lastKill",0])+60)} &&
            {servertime > (player getVariable ["WMS_SaveAndResp_Timer",0])} &&
            {!(localNamespace getVariable ['WMS_Loc_CanBuildComputer',true])};
        }] call ace_interact_menu_fnc_createAction;
    [player, 1, ["ACE_SelfActions"], _action7] call ace_interact_menu_fnc_addActionToObject;