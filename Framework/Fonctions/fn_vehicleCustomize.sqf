params [
	"_veh"
];
private _vehicleClassName = (typeOf _veh);

if(_vehicleClassName == "RHS_UH1Y") then
{
	_veh animate				["hide_FrontDoors", 1];
	_veh animate				["hide_CargoDoors", 1];
};
if (_vehicleClassName == "rhsusf_mkvsoc") then {
	_veh setRepairCargo 1;
	_veh setAmmoCargo 1;
	_veh setFuelCargo 1;
	_veh setVariable ["ACE_isRepairVehicle", true, true];
	_veh setVariable ["ace_rearm_isSupplyVehicle", true, true];
	[_veh, 1000] call ace_refuel_fnc_setFuel;
};
if(_vehicleClassName == "rhsgref_cdf_b_bmd1k" || _vehicleClassName == "rhs_bmd1pk") then
{
	_veh setObjectTextureGlobal [0, "rhsafrf\addons\rhs_bmd_camo\data\sa_bmd2_01_rus3_co.paa"]; 
	_veh setObjectTextureGlobal [1, "rhsafrf\addons\rhs_bmd_camo\data\sa_bmd2_02_rus3_co.paa"]; 
	_veh setObjectTextureGlobal [2, "rhsafrf\addons\rhs_bmd_camo\data\sa_bmd2_03_rus3_co.paa"];
};
if(_vehicleClassName == "rhs_bmd2k" || _vehicleClassName == "rhsgref_cdf_b_bmd2") then
{
	_veh setObjectTextureGlobal [0, "rhsafrf\addons\rhs_bmd_camo\data\sa_bmd2_01_rus4_co.paa"]; 
	_veh setObjectTextureGlobal [1, "rhsafrf\addons\rhs_bmd_camo\data\sa_bmd2_02_rus4_co.paa"]; 
	_veh setObjectTextureGlobal [2, "rhsafrf\addons\rhs_bmd_camo\data\sa_bmd2_03_rus4_co.paa"];
};

/*if (_vehicleClassName == "vtx_MH60S_GAU21L") then { //REMOVED BY HATCHET
	_veh setObjectTextureGlobal [16, "z\vtx\addons\uh60_misc\data\textures\s-70a-9_australia\main_co.paa"]; 
	_veh setObjectTextureGlobal [17, "z\vtx\addons\uh60_misc\data\textures\s-70a-9_australia\misc_co.paa"]; 
	_veh setObjectTextureGlobal [18, "z\vtx\addons\uh60_misc\data\textures\s-70a-9_australia\tail_co.paa"];
};*/

if (_vehicleClassName == "rhsusf_m1152_rsv_usarmy_wd") then {
	_veh setRepairCargo 0; //use the ACE3 one
	_veh setAmmoCargo 0; //use the ACE3 one
	_veh setFuelCargo 0;
	_veh setVariable ["ACE_isRepairVehicle", true, true];
	_veh setVariable ["ace_rearm_isSupplyVehicle", true, true];
	[_veh, 1000] call ace_refuel_fnc_setFuel;

};
if (_vehicleClassName == "B_APC_Tracked_01_CRV_F") then {
	_veh removeWeaponTurret		["HMG_127_APC",[0]];
	_veh animate				["HideTurret", 1];
	_veh setObjectTextureGlobal [0, "A3\Armor_F_exp\APC_Tracked_01\Data\apc_tracked_01_body_crv_olive_co.paa"]; 
	_veh setObjectTextureGlobal [1, "A3\Armor_F_exp\APC_Tracked_01\Data\mbt_01_body_olive_co.paa"]; 
	_veh setObjectTextureGlobal [3, "A3\Armor_F_exp\APC_Tracked_01\Data\apc_tracked_01_crv_olive_co.paa"];
};
if(_vehicleClassName == "I_LT_01_cannon_F" || _vehicleClassName == "I_LT_01_scout_F") then{
	_veh animate 				["showTools",1];
	_veh animate 				["showCamonetHull",1];
	_veh setObjectTextureGlobal [0, "A3\armor_f_tank\lt_01\data\lt_01_main_olive_co.paa"]; 
	_veh setObjectTextureGlobal [1, "A3\armor_f_tank\lt_01\data\lt_01_cannon_olive_co.paa"];
};
if(_vehicleClassName == "O_APC_Wheeled_02_rcws_v2_F") then
{
    _veh removeWeaponTurret     ["HMG_127_APC",[0]];
	_veh removeWeaponTurret		["GMG_40mm",[0]];
	_veh removeMagazinesTurret	["500Rnd_127x99_mag_Tracer_Green",[0]];
	_veh removeMagazinesTurret	["96Rnd_40mm_G_belt",[0]];
	_veh animate 				["HideTurret", 1];
	_veh animate 				["showBags",1];
	_veh animate 				["showCanisters",1];
	_veh animate 				["showTools",1];
	_veh animate 				["showCamonetHull",1];
	_veh setObjectTextureGlobal [0, "a3\armor_f_exp\apc_wheeled_02\data\apc_wheeled_02_ext_01_ghex_co.paa"]; 
	_veh setObjectTextureGlobal [1, "a3\armor_f_exp\apc_wheeled_02\data\apc_wheeled_02_ext_02_ghex_co.paa"]; 
	_veh setObjectTextureGlobal [3, "a3\armor_f\data\camonet_csat_hex_green_co.paa"];
};
if(_vehicleClassName == "R3F_PANDUR_CE") then
{
	_veh removeWeaponTurret		["autocannon_30mm_CTWS",[0]]; 
	_veh removeWeaponTurret		["LMG_coax_ext",[0]]; 
	_veh removeWeaponTurret		["missiles_titan",[0]];
	_veh animate				["HideTurret", 1];
};

if(_vehicleClassName == "I_APC_Wheeled_03_cannon_F") then{
	_veh animate 				["showTools",1];
	_veh animate 				["showCamonetHull",1];
	_veh setObjectTextureGlobal [0, "a3\data_f_tacops\data\apc_wheeled_03_ext_ig_03_co.paa"]; 
	_veh setObjectTextureGlobal [1, "a3\data_f_tacops\data\apc_wheeled_03_ext2_ig_03_co.paa"];
	_veh setObjectTextureGlobal [2, "a3\data_f_tacops\data\rcws30_ig_03_co.paa"];
	_veh setObjectTextureGlobal [4, "a3\armor_f\data\camonet_nato_green_co.paa"];
};

if(_vehicleClassName == "B_AFV_Wheeled_01_cannon_F") then{
	_veh animate 				["showTools",1];
	_veh animate 				["showCamonetHull",1];
	_veh setObjectTextureGlobal [0, "a3\armor_f_tank\afv_wheeled_01\data\afv_wheeled_01_ext1_green_co.paa"]; 
	_veh setObjectTextureGlobal [1, "a3\armor_f_tank\afv_wheeled_01\data\afv_wheeled_01_ext2_green_co.paa"];  
	_veh setObjectTextureGlobal [2, "a3\armor_f_tank\afv_wheeled_01\data\afv_wheeled_01_wheel_green_co.paa"];
	_veh setObjectTextureGlobal [3, "a3\armor_f\data\camonet_nato_green_co.paa"];  
	_veh setObjectTextureGlobal [4, "a3\armor_f_tank\afv_wheeled_01\data\afv_wheeled_01_ext3_co.paa"];
};

if(_vehicleClassName == "B_APC_Wheeled_01_cannon_F") then{
	_veh animate 				["showTools",1];
	_veh animate 				["showCamonetHull",1];
	_veh setObjectTextureGlobal [0, "a3\armor_f_exp\apc_wheeled_01\data\apc_wheeled_01_base_olive_co.paa"]; 
	_veh setObjectTextureGlobal [1, "a3\armor_f_exp\apc_wheeled_01\data\apc_wheeled_01_adds_olive_co.paa"];  
	_veh setObjectTextureGlobal [2, "a3\armor_f_exp\apc_wheeled_01\data\apc_wheeled_01_tows_olive_co.paa"];
	_veh setObjectTextureGlobal [3, "a3\armor_f\data\camonet_nato_green_co.paa"];
};

if(_vehicleClassName == "B_LSV_01_unarmed_black_F") then{
	/*[
		_veh,
		nil, 
		["HideDoor1",1,"HideDoor2",1,"HideDoor3",1,"HideDoor4",1]
	] call BIS_fnc_initVehicle;*/
	_veh animate 				["HideDoor1",1];
	_veh animate 				["HideDoor2",1];
	_veh animate 				["HideDoor3",1];
	_veh animate 				["HideDoor4",1];
};

if(_vehicleClassName == "O_LSV_02_unarmed_black_F") then{
	/*[
		_veh,
		nil, 
		["Unarmed_Doors_Hide",1]
	] call BIS_fnc_initVehicle;*/
	_veh animate 				["Unarmed_Doors_Hide",1];
};

if(_vehicleClassName == "rhsusf_m1152_usarmy_wd") then{
	[
		_veh,
		["rhs_olive",1], 
		["m1152_Hide",0,"m1152_tent_Hide",1,"door_LF",0,"door_RF",0,"iff_hide",0,"dwf_kit_Hide",1,"snorkel_lower",0,"BFT_Hide",0,"Antennas_Hide",0,"hide_spare",0]
	] call BIS_fnc_initVehicle;
};