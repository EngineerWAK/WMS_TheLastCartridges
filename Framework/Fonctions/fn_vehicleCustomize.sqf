params [
	"_veh"
];
private _vehicleClassName = (typeOf _veh);

if (_vehicleClassName == "vn_b_air_uh1c_03_01") then {
	[
		_veh,
		"uh1c_08", 
		true
	] call BIS_fnc_initVehicle;
};

if (_veh isKindOf "gm_Leopard1_base") then { //"gm_ge_army_Leopard1a1a1"
	/*[
		_veh,
		nil, //["gm_ge_wdl",1], 
		["CamoNet_01_unhide",1,"CamoNet_02_unhide",1,"CamoNet_03_unhide",1,"AmmoBox_01_unhide",1,"AmmoBox_02_unhide",1,"FuelCanister_01_unhide",1,"FuelCanister_02_unhide",1,"FuelCanister_03_unhide",1,"beacon_01_org_unhide",0,"sideskirt_unhide",1,"camonet_hull_unhide",1,"camofoilage_hull_unhide",1,"camonet_MainTurret_trav_unhide",1,"camofoilage_MainTurret_trav_unhide",1,"camonet_MainTurret_elev_unhide",1]
	] call BIS_fnc_initVehicle;*/
	_veh animate 				["camonet_hull_unhide",1];
	_veh animate 				["camofoilage_hull_unhide",1];
	_veh animate 				["camonet_MainTurret_trav_unhide",1];
	_veh animate 				["camofoilage_MainTurret_trav_unhide",1];
	_veh animate 				["camonet_MainTurret_elev_unhide",1];
};
if (_vehicleClassName == "gm_dk_army_bpz2a0") then { //no R3F log, trader vehicle forced at all traders (vehicles)
	_veh setRepairCargo 1;
	_veh setAmmoCargo 1;
	_veh setFuelCargo 1;
	_veh setVariable ["ACE_isRepairVehicle", true, true];
	_veh setVariable ["ace_rearm_isSupplyVehicle", true, true];
	[_veh, 1000] call ace_refuel_fnc_setFuel;
};
if (_vehicleClassName == "rhsgref_cdf_b_reg_uaz_dshkm") then {
	_veh addMagazineTurret ["rhs_mag_127x108mm_150", [0]];
	_veh addMagazineTurret ["rhs_mag_127x108mm_150", [0]];
	_veh addMagazineTurret ["rhs_mag_127x108mm_150", [0]];
	_veh addMagazineTurret ["rhs_mag_127x108mm_150", [0]];
};
if (_vehicleClassName == "C_Quadbike_01_F") then { //no R3F log, trader vehicle forced at all traders (vehicles)
	[
		_veh,
		"White",
		true
	] call BIS_fnc_initVehicle;
};
if (_vehicleClassName == "O_G_Van_01_transport_F") then { //igiload
	[
		_veh,
		"Guerilla_07",//["Guerilla_07",1], 
		true
	] call BIS_fnc_initVehicle;
};
if (_vehicleClassName == "I_G_Van_01_transport_F") then { //no igiload
	[
		_veh,
		"Red",//["Red",1], 
		true
	] call BIS_fnc_initVehicle;
};
if (_vehicleClassName == "I_UGV_01_F") then {
	_veh setObjectTextureGlobal [0, "a3\Soft_F_Orange\UGV_01\Data\UGV_01_ext_IDAP_co.paa"]; 
	_veh setObjectTextureGlobal [1, "a3\Soft_F_Orange\UGV_01\Data\UGV_01_int_IDAP_co.paa"]; 
	_veh setObjectTextureGlobal [2, "a3\Soft_F_Orange\UGV_01\Data\Turret_IDAP_CO.paa"];
};
if (_vehicleClassName == "rhsusf_M1239_M2_Deploy_socom_d" || _vehicleClassName == "rhsusf_M1239_MK19_Deploy_socom_d" || _vehicleClassName ==  "rhsusf_M1239_M2_socom_d" || _vehicleClassName == "rhsusf_M1239_MK19_socom_d") then {
	_veh setObjectTextureGlobal [0, "rhsusf\addons\rhsusf_socomauv\data\m1239_main_wd_co.paa"]; 
	_veh setObjectTextureGlobal [1, "rhsusf\addons\rhsusf_socomauv\data\m1239_wheels_wd_co.paa"]; 
	_veh setObjectTextureGlobal [2, "rhsusf\addons\rhsusf_socomauv\decals\auv_socom_decal_ca.paa"]; 
	_veh setObjectTextureGlobal [3, "rhsusf\addons\rhsusf_caiman\data\m153_wd_co.paa"]; 
	_veh setObjectTextureGlobal [4, "rhsusf\addons\rhsusf_rg33l\data\rhsusf_camonet_wdl_co.paa"];
};
if (_vehicleClassName == "rhsusf_M1238A1_M2_socom_d" || _vehicleClassName == "rhsusf_M1238A1_Mk19_socom_d") then {
	_veh setObjectTextureGlobal [0, "rhsusf\addons\rhsusf_rg33\data\m1238a1_main_wd_co.paa"]; 
	_veh setObjectTextureGlobal [1, "rhsusf\addons\rhsusf_rg33\data\m1238a1_wheels_wd_co.paa"]; 
	_veh setObjectTextureGlobal [2, "rhsusf\addons\rhsusf_rg33\data\m1238a1_markings_ca.paa"]; 
	_veh setObjectTextureGlobal [3, "rhsusf\addons\rhsusf_caiman\data\m153_wd_co.paa"]; 
};
if (_vehicleClassName == "rhsusf_m1165a1_gmv_m134d_m240_socom_d" || _vehicleClassName == "rhsusf_m1165a1_gmv_m2_m240_socom_d" || _vehicleClassName == "rhsusf_m1165a1_gmv_mk19_m240_socom_d") then {
	_veh setObjectTextureGlobal [0, "rhsusf\addons\rhsusf_m1165\data\rhsusf_m1165a1_gmv_ext_wd_co.paa"];
	_veh setObjectTextureGlobal [1, "rhsusf\addons\rhsusf_m11xx\data\rhsusf_m1151_tire_wd_co.paa"];
	_veh setObjectTextureGlobal [2, "rhsusf\addons\rhsusf_m11xx\data\rhsusf_m1151_int_co.paa"];
	_veh setObjectTextureGlobal [3, "rhsusf\addons\rhsusf_hmmwv\textures\mk64mount_w_co.paa"];
	_veh setObjectTextureGlobal [4, "rhsusf\addons\rhsusf_m1165\data\rhsusf_m1165a1_gmv_wd_co.paa"];
	_veh setObjectTextureGlobal [5, "rhsusf\addons\rhsusf_m1165\data\rhsusf_m1165a1_gmv_sag_wd_co.paa"];
	_veh setObjectTextureGlobal [6, "rhsusf\addons\rhsusf_m1165\data\rhsusf_m11165a1_gmv_h246mount_wd_co.paa"]; 
};
if (_vehicleClassName == "rhsusf_mrzr4_w_mud") then {
	_veh setObjectTextureGlobal [0, "rhsusf\addons\rhsusf_mrzr\data\blue_grn_mud_co.paa"];
	_veh setObjectTextureGlobal [1, "rhsusf\addons\rhsusf_mrzr\data\yel_grn_mud_co.paa"];
	_veh setObjectTextureGlobal [2, "rhsusf\addons\rhsusf_mrzr\data\red_grn_mud_co.paa"];
	_veh setObjectTextureGlobal [3, "rhsusf\addons\rhsusf_mrzr\data\grn_grn_mud_co.paa"];
	_veh setObjectTextureGlobal [4, "rhsusf\addons\rhsusf_mrzr\data\merged\orng_grn_mud_co.paa"]; 
};

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
		"rhs_olive",//["rhs_olive",1], 
		["m1152_Hide",0,"m1152_tent_Hide",1,"door_LF",0,"door_RF",0,"iff_hide",0,"dwf_kit_Hide",1,"snorkel_lower",0,"BFT_Hide",0,"Antennas_Hide",0,"hide_spare",0]
	] call BIS_fnc_initVehicle;
};

if(_vehicleClassName == "I_G_Offroad_01_F" ||_vehicleClassName ==  "B_G_Offroad_01_armed_F") then{
	[
		_veh,
		"Green",//["rhs_olive",1], 
		["HideDoor1",0,"HideDoor2",0,"HideDoor3",0,"HideBackpacks",0,"HideBumper1",0,"HideBumper2",1,"HideConstruction",0,"hidePolice",1,"HideServices",1,"BeaconsStart",0,"BeaconsServicesStart",0]
	] call BIS_fnc_initVehicle;
};