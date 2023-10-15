/**
 * WMS_fnc_findVhlIDinVhlArray
 *
 * {|||TNA|||}WAKeupneo
 * www.TNA-community.com
 * © 2021 {|||TNA|||}WAKeupneo
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
//[["76561197965501020",["5ce9f13f","rhsusf_m998_w_s_4dr",[[1762.26,7335.67,0.00136757]],213.934,0,[[],[],[],[]]]]]
//[_arrayPosition,_vehicleID]  call WMS_fnc_findVhlIDinVhlArray;
params[
	//"_arrayPosition",
	"_targetUID",
	"_vehicleID"
];
//_permanentVhlArray = (profileNameSpace getVariable ["WMS_permanentVhlArray", []]);
_playerVhlArray = (profileNameSpace getVariable [_targetUID+"_VHLs", []]);
//_playerArray = _permanentVhlArray select _arrayPosition; //that should give ["76561197965501020",["5ce9f13f","rhsusf_m998_w_s_4dr",[[1762.26,7335.67,0.00136757]],213.934,0,[[],[],[],[]]]]
/*
_msgHint = format ["FindVehicleInArray _playerArray: %1", _playerArray];
//_msgHint remoteExec ["hint", 0];
[_msgHint] remoteExecCall ['SystemChat',0];
*/
_result = []; //_result = [-1, 0]; for the exemple
{ 
	_found = _x find _vehicleID;
	_result pushback _found;
}forEach _playerVhlArray;
/*
_msgHint = format ["FindVehicleInArray _resultArray: %1", _result];
//_msgHint remoteExec ["hint", 0];
[_msgHint] remoteExecCall ['SystemChat',0];
*/
_result = _result find 0; //_result = 1; for the exemple
/*
_msgHint2 = format ["FindVehicleInArray _result: %1", _result];
//_msgHint remoteExec ["hint", 0];
[_msgHint2] remoteExecCall ['SystemChat',0];
*/
_result;