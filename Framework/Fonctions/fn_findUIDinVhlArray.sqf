/**
 * WMS_fnc_findUIDinVhlArray
 *
 * {|||TNA|||}WAKeupneo
 * www.TNA-community.com
 * © 2021 {|||TNA|||}WAKeupneo
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
params[
	"_targetUID"
];
_result = []; 
{ 
	_found = _x find _targetUID;
	_result pushback _found;
}forEach (profileNameSpace getVariable ["permanentVhlArray", []]);
_result = _result find 0;
/*
_msgHint = format ["FindUIDInArray _result: %1", _result];
//_msgHint remoteExec ["hint", 0];
[_msgHint] remoteExecCall ['SystemChat',0];
*/
_result; //return -1 if no result