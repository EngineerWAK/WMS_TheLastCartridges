/**
 * WMS_fnc_ActivateDeactUAVs
 *
 * TNA-Community
 * https://discord.gg/Zs23URtjwF
 * © 2023 {|||TNA|||}WAKeupneo
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */

params[
	["_UAVObject",objNull],
	["_activate", true]
];
if (isnull _UAVObject) exitWith {if (true) then {diag_log format ["[UAV/UGV ACTIVATION]|WAK|TNA|WMS|WMS_fnc_ActivateDeactUAVs NO VEHICLE TO ACTIVATE !!! _this %1", _this]};};
if (true) then {diag_log format ["[UAV/UGV ACTIVATION]|WAK|TNA|WMS|WMS_fnc_ActivateDeactUAVs _this %1", _this]};
if (_activate) then {
	createVehicleCrew _UAVObject;
	_UAVObject setVariable ["WMS_UAVcanActivate", false, true];
	_UAVObject setVariable ["WMS_UAVcanDeActivate", true, true];
} else {
	deleteVehicleCrew _UAVObject;
	_UAVObject setVariable ["WMS_UAVcanActivate", true, true];
	_UAVObject setVariable ["WMS_UAVcanDeActivate", false, true];
};