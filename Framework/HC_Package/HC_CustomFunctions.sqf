/**
* WMS_fnc_AllDeadsMgr - InfantryProgram
*
* TNA-Community
* https://discord.gg/Zs23URtjwF
* © 2022 {|||TNA|||}WAKeupneo
*
* This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
* To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
* Do Not Re-Upload
*/
WMS_fnc_HC_AllDeadsMgr = {
	if (true) then {diag_log format ['|WAK|TNA|WMS|[AllDeadsMgr] WMS_fnc_AllDeadsMgr, AllDeads Cleanup, %1 deads', count WMS_HC_AllDeadsMgr]};
	{
		if (count WMS_HC_AllDeadsMgr != 0 && {serverTime >= (_x select 1)}) then {
			if ((_x select 0) isKindOf "WeaponHolderSimulated") then {
				clearItemCargoGlobal (_x select 0);
				deleteVehicle (_x select 0);
				WMS_HC_AllDeadsMgr deleteAt (WMS_HC_AllDeadsMgr find _x);
			}else{
				if !(alive (_x select 0)) then {
					if (true) then {diag_log format ['|WAK|TNA|WMS|[AllDeadsMgr] WMS_fnc_AllDeadsMgr, your fignt is over %1',(_x select 0)]};
					deleteVehicle (_x select 0);
				WMS_HC_AllDeadsMgr deleteAt (WMS_HC_AllDeadsMgr find _x);
				};
			};
		};
	}forEach WMS_HC_AllDeadsMgr;
};