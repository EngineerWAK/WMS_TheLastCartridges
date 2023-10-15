/**
 * WMS_fnc_GetOwnedPermanentVhls
 *
 * {|||TNA|||}WAKeupneo
 * www.TNA-community.com
 * © 2021 {|||TNA|||}WAKeupneo
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
params [
	"_target"
];
_ownerUID = getPlayerUID _target;
//private _UIDplayerArrayPos = [_ownerUID] call WMS_fnc_findUIDinVhlArray; //return -1 if no result //OLD
//private _permamentVehicles = profileNameSpace getVariable ["WMS_permanentVhlArray", []]; //not very usefull anymore //OLD
private _playerVHLarray = profileNameSpace getVariable [_ownerUID+"_VHLs", [_ownerUID]]; //NEW

	/*_playerArray = _x; //playerArray will change and will contain only [playerUID, [vhlHexaID,vhlHexaID,vhlHexaID]];
	//_playerArrayRef = _x; //[playerUID, [vhlHexaID,vhlHexaID,vhlHexaID]];
	//_playerArrayVar = (_x select 0)+"_VHLs";
	//_playerArray = profileNameSpace getVariable [_playerArrayVar, []];*/

private _result = [];
//if !(_UIDplayerArrayPos == -1) then { //OLD
if (count (_playerVHLarray select 1) > 0) then {
	{
		if !(typeName _x == "STRING") then {
			_result pushback [(_x select 1),(_x select 2),(_x select 8)]; //[Type,position,restarts]
		};
	//}forEach (_permamentVehicles select _UIDplayerArrayPos); //OLD
	}forEach _playerVHLarray;
};
if (WMS_MissionDebug) then {diag_log format ["Permanent Vehicles Markers _result = %1",_result]};
_result remoteExec ["WMS_fnc_client_markerOnPersonalVhls", (owner _target)];