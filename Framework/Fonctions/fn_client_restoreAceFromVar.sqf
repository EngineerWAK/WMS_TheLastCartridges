/**
 * WMS_fnc_client_restoreAceFromVar
 *
 * TNA-Community
 * https://discord.gg/Zs23URtjwF
 * © 2021 {|||TNA|||}WAKeupneo
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
params [
	"_playerObject",
	"_aceData"
];
diag_log format ["[WMS_fnc_client_restoreAceFromVar]|WAK|TNA|WMS| _playerObject %1, _aceStuff %2", _playerObject, _aceData];
private _aceStuff = [
    "ace_isdead",
    "ace_isunconscious",
    "ace_eyesdamaged",
    "ace_medical_openwounds",
    "ace_medical_bloodpressure",
    "ace_medical_incardiacarrest",
    "ace_medical_woundbleeding",
    "ace_medical_inpain",
    "ace_medical_medications",
    "ace_medical_heartrate",
    //"ace_medical_status_killed",
    "ace_medical_pain",
    "ace_medical_bloodvolume",
    "ace_medical_fractures",
    "ace_medical_bodypartdamage",
    "ace_medical_hemorrhage",
    "ace_medical_islimping",
    "ace_medical_bandagedwounds",
    "ace_medical_engine_aimfracture",
    "ace_medical_painsuppress",
    "ace_medical_peripheralresistance",
    "ace_advanced_fatigue_aimfatigue",
    "ace_advanced_fatigue_ae2reserve",
    "ace_advanced_fatigue_anreserve",
    "ace_advanced_fatigue_muscledamage",
    "ace_advanced_fatigue_anfatigue",
    "ace_advanced_fatigue_ae1reserve"
];
if (count _aceData != count _aceStuff) exitWith {
	diag_log format ["[WMS_fnc_client_restoreAceFromVar]|WAK|TNA|WMS|ERROR _aceData %1, _aceStuff %2", (count _aceData), (count _aceStuff)];
};
{
	private _arrayNumber = (_aceStuff find _x);
	private _savedData = (_aceData select _arrayNumber);
	if (_savedData != [-999]) then {
		_playerObject setVariable [_x,_savedData,true];
	};
}forEach _aceStuff;