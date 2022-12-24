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
if (WMS_MissionDebug) then {diag_log format ["[WMS_fnc_client_restoreAceFromVar]|WAK|TNA|WMS| _playerObject %1, _aceData %2", _playerObject, _aceData]};
private _aceStuff = [
    //"ace_isdead", //changing this one since at best, it's useless, but can't totally remove it
    "WMS_isdead",
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
    "ace_advanced_fatigue_ae1reserve",
    "acex_field_rations_hunger",
    "acex_field_rations_thirst"
];
if (count _aceData != count _aceStuff) exitWith {
	if (WMS_MissionDebug) then {diag_log format ["[WMS_fnc_client_restoreAceFromVar]|WAK|TNA|WMS|ERROR _aceData %1, _aceStuff %2", (count _aceData), (count _aceStuff)]};
};
/*{ //works but we seems to have instant death liked to previous morphin injection in ace_medical_medications
	private _arrayNumber = (_aceStuff find _x);
	private _savedData = (_aceData select _arrayNumber);
	if !(_savedData isEqualTo [-999]) then {
		_playerObject setVariable [_x,_savedData,true];
		systemChat format ["Restoring ACE Medical %1 %2",_x, _savedData];
	};
}forEach _aceStuff;*/
{
	private _arrayNumber = (_aceStuff find _x);
	private _savedData = (_aceData select _arrayNumber);
	if !(_savedData isEqualTo [-999]) then {
        if (_x isEqualTo "ace_medical_medications") then {
            _savedDataFiltered = [];
            {
                if ("Morphine" in _x) then {
                    _savedDataFiltered pushback [];
		            systemChat format ["Preventing Morphine OD %1 %2",_x, _savedData];
                }else{
                    _savedDataFiltered pushback _x;
                };
            }forEach _savedData;
		   _playerObject setVariable [_x,_savedDataFiltered,true];
		    systemChat format ["Restoring ACE Medical %1 %2",_x, _savedDataFiltered];
        }else{ 
		    _playerObject setVariable [_x,_savedData,true];
		    systemChat format ["Restoring ACE Medical %1 %2",_x, _savedData];
        };
	};
}forEach _aceStuff;