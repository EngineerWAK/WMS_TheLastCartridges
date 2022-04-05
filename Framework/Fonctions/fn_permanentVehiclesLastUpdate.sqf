
/**
 * permanentVehiclesLastUpdate.sqf
 *
 * TNA-Community
 * https://discord.gg/Zs23URtjwF
 * © 2021 {|||TNA|||}WAKeupneo
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
{
	//_x remoteExec ['WMS_fnc_updatePermanentVHL', 2];
	[_x,"lastUpdate"] call WMS_fnc_updatePermanentVHL; //??? why not
	diag_log format ["[PERMANENT VHL LAST UPDATE]|WAK|TNA|WMS| updating %1 @ %2, serverTime %3", _x, position _x, (round serverTime)]
}forEach WMS_permanentVehicleObjects;
saveProfileNamespace;
if (true) then {diag_log "[WMS_fnc_permanentVehicleLastUpdate]|WAK|TNA|WMS|ProfileNameSpace Saved"};
diag_log format ["[PERMANENT VHL LAST UPDATE]|WAK|TNA|WMS| All Permanent vehicles Updated, serverTime %1",(round serverTime)]