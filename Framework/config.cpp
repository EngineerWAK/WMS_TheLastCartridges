/**
 * config.cpp
 *
 * TNA-Community
 * https://discord.gg/Zs23URtjwF
 * © 2021 {|||TNA|||}WAKeupneo
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
//getText(missionConfigFile >> "CfgSystemVersion" >> "serial")
class CfgSystemVersion
{
	name = "v1.817_2023OCT21_GitHub"; //Office trader fix (_price) //GM_SPE_SOG vehicles //SPE_Normandy update //LootToSpawnCategories_GM_SPE_SOG
};

class Extended_PreInit_EventHandlers {
    class My_pre_init_event {
        init = "call compile preprocessFileLineNumbers 'XEH_preInit.sqf'";
    };
};

///////////////////////
// REMEMBER CfgRespawnInventory IN description.ext _SOG
///////////////////////

/////TRADERS
class CfgWeapCategories
{	//_weaponsCategories = getArray(missionConfigFile >> "CfgWeapCategories" >> "SniperRifles" >> "items");
    #include "ClassNames\WeaponsCategories.hpp"
    //#include "ClassNames\WeaponsCategories_SOG.hpp"
};
class CfgVehicleCategories
{	//_vehicleCategories = getArray(missionConfigFile >> "CfgVehicleCategories" >> "Cars" >> "items");
    #include "ClassNames\VehiclesCategories.hpp"
    //#include "ClassNames\VehiclesCategories_SOG.hpp"
    //#include "ClassNames\VehiclesCategories_GM_SPE_SOG.hpp"
};
class CfgItemsCategories
{   //_itemsCategories = getArray(missionConfigFile >> "CfgItemsCategories" >> "ItemsBlabla" >> "items");
    #include "ClassNames\ItemsCategories.hpp"
	#include "ClassNames\EquipementCategories.hpp"
    //#include "ClassNames\ItemsCategories_SOG.hpp"
	//#include "ClassNames\EquipementCategories_SOG.hpp"
};

/////LOOT SPAWN
class CfgBuildingsCategories
{	//_weaponsCategories = getArray(missionConfigFile >> "CfgBuildingsCategories" >> "BuildingClass_Spe" >> "items");
    #include "ClassNames\BuildingsLootSpawn.hpp"
};
class CfgLootToSpawnCategories
{   //_itemsCategories = getArray(missionConfigFile >> "CfgLootToSpawnCategories" >> "weapons" >> "items");
    #include "ClassNames\LootToSpawnCategories.hpp"
    //#include "ClassNames\LootToSpawnCategories_SOG.hpp"
    //#include "ClassNames\LootToSpawnCategories_GM_SPE_SOG.hpp" //not yet, next coming
};
class CfgLootToSpawnWeight
{  //_weight = getArray(missionConfigFile >> "CfgLootToSpawnWeight" >> "Special" >> "weight");
    #include "ClassNames\LootToSpawnWeight.hpp"
};

//_itemClassName = _x;
//_quality = getNumber(missionConfigFile >> "CfgAllPrices" >> _itemClassName >> "quality");
//_price = getNumber(missionConfigFile >> "CfgAllPrices" >> _itemClassName >> "price");
class CfgAllPrices
{
	#include "ClassNames\ItemsPrices.hpp"
    #include "ClassNames\VehiclesPrices.hpp"
	#include "ClassNames\WeaponsPrices.hpp"
	#include "ClassNames\EquipementPrices.hpp"
};
//_PVPtrue = getNumber(missionConfigFile >> "CfgPVP" >> "PVPStatus");
class CfgPVP
{
	PVPStatus 		= 0; //1 true, 0 false
	PVPpunishment 	= 25;
	PVPreward 		= 10;
	PVEpunishmentTK = 10;
	PVEdeath		= 2;
};
class CfgForceMedicalFacilities //some Medical vehicles/buildings are not recognized as Medical facilities
{//_forceMedicalFacilities = getArray(missionConfigFile >> "CfgForceMedicalFacilities" >> "vehicles");
	vehicles[] = {
		//SPE Medicals
		"SPE_FFI_OpelBlitz_Ambulance",
		"SPE_FR_M3_Halftrack_Ambulance",
		//SOG Medicals
		"Land_vn_tent_mash_01_03",//base med tent
		"vn_b_wheeled_lr2a_03_nz_army",
		"vn_i_wheeled_btr40_02_fank_70",
		"vn_b_armor_m577_02", //m113 medic
		"vn_o_armor_btr50pk_03_nva65",
		//SOG Medical choppers
		"vn_b_air_uh1b_01_02",
		"vn_b_air_uh1b_01_01",
		"vn_b_air_uh1b_01_04",
		"vn_b_air_uh1d_01_02", //bigger open
		"vn_b_air_uh1d_01_07", //bigger open
		"vn_o_air_mi2_02_02",
		"vn_b_air_ch47_02_02",
		//SOG Medical ship
		"vn_b_boat_06_02", //big forced medical
		//GM
		"gm_dk_army_m113a1dk_medic",
		"gm_ge_army_m113a1g_medic",
		"gm_ge_army_u1300l_medic",
		"gm_ge_airforce_do28d2_medevac",
		"gm_gc_army_ural375d_medic",
		"gm_gc_bgs_ural375d_medic",
		"gm_pl_army_ural375d_medic",
		"gm_ge_ff_u1300l_firefighter",
		"gm_gc_ff_p601", //zastava kind of car
		"gm_ge_ff_typ1200", //cox
		//
		"rhsusf_mkvsoc",
		//
		"vtx_UH60M_MEDEVAC",
		"RHS_UH60M_MEV2",
		"RHS_UH60M_MEV2_d",
		"RHS_UH60M_MEV",
		"RHS_UH60M_MEV_d",
		"O_Heli_Transport_04_medevac_black_F",
		"O_Heli_Transport_04_medevac_F",
		"rhsusf_M1078A1R_SOV_M2_WD_fmtv_socom",

		"B_Slingload_01_Medevac_F",
		"Land_Pod_Heli_Transport_04_medevac_black_F",
		"Land_Pod_Heli_Transport_04_medevac_F",
		"rhsusf_m113_usarmy_medical",
		"rhsusf_m113d_usarmy_medical",
		"rhsusf_M1230a1_usarmy_wd",
		"rhsusf_M1230a1_usarmy_d",
		"rhsusf_M1083A1P2_B_M2_d_Medical_fmtv_usarmy",
		"rhsusf_M1083A1P2_B_M2_wd_Medical_fmtv_usarmy",
		"rhsusf_M1085A1P2_B_D_Medical_fmtv_usarmy",
		"rhsusf_M1085A1P2_B_Medical_fmtv_usarmy",
		"rhsusf_M1085A1P2_B_WD_Medical_fmtv_usarmy",
		"C_Van_02_medevac_F",
		"I_E_Van_02_medevac_F",
		"B_Truck_01_medical_F",
		"B_T_Truck_01_medical_F",
		"O_Truck_02_medical_F",
		"O_Truck_03_medical_F",
		"O_T_Truck_02_Medical_F",
		"O_T_Truck_03_medical_ghex_F",
		"C_UAV_06_medical_F",
		"I_UGV_01_F",
		"C_IDAP_UGV_01_F", //Can not be used by players so replaced by I_UGV_01_F with IDAP textures
		"C_IDAP_UAV_06_F",
		"C_IDAP_Van_02_medevac_F",
		"C_IDAP_Offroad_02_unarmed_F",
		"C_IDAP_Offroad_01_F",
		"C_IDAP_Van_02_vehicle_F",
		"C_IDAP_Van_02_transport_F",
		"C_IDAP_Truck_02_transport_F",
		"C_IDAP_Truck_02_F",
		"C_IDAP_UAV_06_medical_F",
		"C_IDAP_Heli_Transport_02_F",

		"GUE_WarfareBFieldhHospital", //CUP trader
		"Land_Research_house_V1_F",
		"Land_Medevac_house_V1_F",
		"Land_MedicalTent_01_NATO_generic_open_F"
	};
	inventory[] = { 
		{"ACE_personalAidKit",1},
		{"ACE_bloodIV_500",5},
		{"ACE_bloodIV_250",10},
		{"ACE_elasticBandage",10},
		{"ACE_fieldDressing",10},
		{"ACE_splint",10},
		{"ACE_epinephrine",5},
		{"ACE_morphine",5}//,
		//{"vtx_stretcher_item",2} //nope
	};
};
class CfgForceRepairFacilities //some Repair vehicles/buildings are not recognized as Medical facilities
{//_forceMedicalFacilities = getArray(missionConfigFile >> "CfgForceRepairFacilities" >> "vehicles");
	vehicles[] = 
	{	
		//SOG
		"vn_b_wheeled_m54_repair_aus_army",//claimreward
		"vn_b_wheeled_m54_repair",
		//SOG Medical ship
		"vn_b_boat_06_02", //big forced medical
		//GM
		"gm_dk_army_m113a1dk_engineer",
		"gm_dk_army_bpz2a0",
		"gm_ge_army_fuchsa0_engineer",
		"gm_ge_army_u1300l_repair",
		"gm_gc_army_ural4320_repair",
		"gm_gc_bgs_ural4320_repair",
		"gm_pl_army_ural4320_repair",
		//
		"rhsusf_mkvsoc",
		//
		"B_APC_Tracked_01_CRV_F",
		"O_Heli_Transport_04_repair_black_F",
		"rhsusf_M1078A1R_SOV_M2_WD_fmtv_socom",
		"rhsusf_M977A4_REPAIR_usarmy_wd",
		"RHS_Ural_Repair_VDV_01",
		"rhsusf_m1152_rsv_usarmy_wd"
	};
	inventory[] = {
		{"ToolKit",1},
		{"ACE_EntrenchingTool",5},
		{"ACE_wirecutter",5},
		{"SatchelCharge_Remote_Mag",10},
		{"ACE_rope15",2},
		{"ACE_rope36",2},
		{"ACE_rope6",2}
	};
};
class CfgForceAmmoFacilities //some Ammo vehicles/buildings are not recognized as Medical facilities
{//_forceMedicalFacilities = getArray(missionConfigFile >> "CfgForceAmmoFacilities" >> "vehicles");
	vehicles[] = 
	{
		//SOG
		"vn_b_wheeled_m54_ammo",
		//SOG Medical ship
		"vn_b_boat_06_02", //big forced medical
		//GM
		"gm_dk_army_bpz2a0",
		"gm_ge_army_kat1_454_reammo",
		"gm_ge_army_kat1_451_reammo",
		"gm_gc_army_ural4320_reammo",
		"gm_gc_bgs_ural4320_reammo",
		"gm_pl_army_ural4320_reammo",
		//
		"rhsusf_mkvsoc",
		//
		"B_APC_Tracked_01_CRV_F",
		"O_Heli_Transport_04_ammo_black_F",
		"O_T_Truck_03_ammo_ghex_F",
		"rhs_kamaz5350_ammo_vdv",
		"rhsusf_m113_usarmy_supply",
		"rhsusf_M1078A1R_SOV_M2_WD_fmtv_socom",
		"rhsusf_m1152_rsv_usarmy_wd"
	};
	inventory[] = { //not yet
		{"rhs_mag_an_m14_th3",10},
		{"rhs_charge_tnt_x2_mag",10},
		{"DemoCharge_Remote_Mag",10},
		{"ACE_DefusalKit",4},
		{"ACE_Clacker",4},
		{"ACE_RangeTable_82mm",3},
		{"ACE_artilleryTable",3},
		{"ACE_RangeCard",3}
	};
};
class CfgClaimReward
{//_itemsList = getArray(missionConfigFile >> "CfgClaimReward" >> "itemsList");
	levels[] =
	{	
		0,
		1000,
		2500,
		5000,
		10000,
		25000
	};
	weight[] =  {
		{0.05, 0.1,0.3,0.2, 0.8},//["trash", "item", "weap", "launcher", "vhl"];
		{0.1, 0.1,0.3,0.2, 0.6},
		{0.2, 0.2,0.3,0.2, 0.5},
		{0.3, 0.2,0.3,0.3, 0.4},
		{0.4, 0.2,0.2,0.3, 0.3},
		{0.5, 0.3,0.2,0.2, 0.2}
	};
	#include "ClassNames\ClaimReward.hpp"
	//#include "ClassNames\ClaimReward_SOG.hpp"
};
//_customMapMarkers = getArray(missionConfigFile >> "CfgOfficeTrader" >> "MarkersToCheck");
class CfgOfficeTrader
{
	itemsList[] = 
	{
		Territory,
		TradeRespect5k,
		TradeRespect10k,
		EmergencySupplyMeds,
		EmergencySupplyWeaps,
		HaloJump,
		CompDoc,
		CompEng,
		CompExplo, //Breatcher
		TheOneMillionDollarsBase
	};

	Territory[] = 
	{
		20000, //TerritoryPrice = 
		100, //TerritoryRadius = 
		750, //DistTraders = 
		750, //DistSpawnZone = 
		210, //DistTerritories = 
		2, //maximum Territories/player
		300 //DistTerritoriesNoCustomSpawn
	};
	TradeRespect5k[] = 
	{
		5000, //respect price
		15000 //cashBack
	};
	TradeRespect10k[] = 
	{
		10000, //respect price
		50000 //cashBack
	};
	EmergencySupplyMeds[] = 
	{
		3000,
		{	
			"ACE_MRE_ChickenHerbDumplings", //30
			"ACE_Can_RedGull", //25
			"ACE_splint", //50
			"ACE_splint", //50
			"ACE_bloodIV_250", //150
			"ACE_bloodIV_500", //250
			"ACE_bloodIV", //500
			"ACE_morphine", //250
			"ACE_morphine", //250
			"ACE_epinephrine", //250
			"ACE_tourniquet", //30
			"ACE_tourniquet", //30
			"ACE_fieldDressing", //25
			"ACE_fieldDressing", //25
			"ACE_fieldDressing", //25
			"ACE_fieldDressing", //25
			"ACE_fieldDressing" //25
		}
	};
	EmergencySupplyWeaps[] = 
	{
		3000,
		{	//weap, random select 1 + default ammo x3
			"rhs_weap_hk416d10_LMT",
			"rhs_weap_mk17_CQC",
			"rhs_weap_m1garand_sa43",
			"rhs_weap_MP44",
			"rhs_weap_m14_rail",
			"rhs_weap_m76",
			"SMG_02_F",
			"hgun_PDW2000_F"
		},
		{//mags other than default ammo, all
			"SmokeShellGreen",
			"SmokeShellGreen"
		},
		{//items //all
			"ACE_fieldDressing",
			"ACE_splint",
			"ACE_tourniquet"
		},
		{//backpack //not used yet
			"B_AssaultPack_rgr"
		}
	};
	HaloJump[] = 
	{
		2500, //price from office trader
		3500, //price from Infantry computer
		[1000, 1500], 	//respect, accuracy //1500~2000, 2000 hardcoded in the fonction itself
		[2500, 1000],	//1000~1500
		[6000, 750],	//750~1000
		[12000, 500],	//500~750
		[18000, 250],	//250~500
		[25000, 50] 	//50~250
	};
	CompDoc[] = 
	{
		7500 //Price to get Doctor Competence
	};
	CompEng[] = 
	{
		7500 //Price to get Adv Engineer Competence
	};
	CompExplo[] = 
	{
		3500 //Price to get Explosive Competence
	};
	TheOneMillionDollarsBase[] = 
	{
		1000000
	};
	vehiclesManagement[] = 
	{
		34, //number of restarts before unused vehicles get destroyed //34*5 = one week
		28, //number of restart before warning
		10000, //price to pay to the trader to reset restart counter //not yet
		3, //allowed vehicles at start, no territory, that include vehicles from "claim reward"
		1, //0 = no more vehicles //1 or 2 or 3 or n = use territories level to count max vehicles, n*territory level of all territories. if 1, 2 territories level 6 = "allowed vehicle at start" + 6 + 6
		1 //0 = false //unlock vehicles in traders zone // Default is now = 1
	};

	MarkersToCheck[] = 
	{
		"Select",		//_markerTraders "n_installation" //TYPO ???
		"respawn_para",	//_markerSpawns //this is also used for respawn beacon (local to the owner) which cancel the halo jump posibility, migh thave to change
		"mil_flag"		//_markerTerritory
	};
	ZoneSizes[] =
	{
 		80,		//_tradersZoneSize
 		300,	//_spawnZoneSize
 		100,	//_territorySize
		270		//_vhlUnlockDist //blacklisted vehicles closer than _tradersZoneSize + this will be unlocked at server restart and can not be locked in this zone by players
	};
	
};
//_traderCategories = getArray(missionConfigFile >> "CfgRespectLevels" >> "Respect");
class CfgRespectLevels {     
	Respect[] =
	{
		0,
        1000,
		6000,
		12000,
		18000,
		25000,
		50000
	};
 };
 //_traderColors = getArray(missionConfigFile >> "CfgRespectColors" >> "Colors");
class CfgRespectColors { //not used but I keep it as references
	Colors[] =
	{
		"#ffffff", //white
		"#8dfb7e",
		"#1fd507",
		"#07d593",
		"#0797d5",
		"#8d07d5",
		"#d5074b",
		"#ffffff"
	};
 };
class CfgLootSettings
{   //_lifeTime = getNumber(missionConfigFile >> "CfgLootSettings" >> "SpawnLootRad");
	SpawnLootRad = 50;
	SpawnLoopTime = 30;
	SpawnLootDistToMove = 30;
	LootlifeTime = 1950; //bit confusing but this is the delay before loot can spawn again
	TimeToDelete = 180; //timer to delete loot and weaponHolder
	minDistToTraders = 200; //not used yet
	minDistToTerritories = 100; //not used yet
};
class CfgLootBlacklist
{	//_LootBL = getArray(missionConfigFile >> "CfgLootBlacklist" >> "buildings");
	buildings[] = //those buildings/objects will not spawn any loot
	{
		"Land_vn_dyke_10",
		"Land_vn_b_trench_45_01",
		"Land_vn_b_trench_20_01",
		"Land_vn_b_trench_05_01",
		"Land_vn_crater_01_01",
		"Land_vn_crater_01_02",
		"Land_vn_crater_02_01",
		"Land_vn_crater_02_02",
		"Land_vn_crater_03_01",
		"Land_vn_crater_03_02",
		"Land_vn_crater_04_01",
		"Land_vn_crater_04_02",
		"Land_vn_usaf_revetment_comp_06",
		"Land_vn_b_trench_revetment_tall_03",
		"Land_vn_b_trench_revetment_05_01",
		"Land_vn_b_trench_revetment_90_01",
		"Land_vn_b_trench_revetment_tall_09",
		"Land_vn_usaf_revetment_1_01",
		"Land_vn_usaf_revetment_1_02",
		"Land_vn_usaf_revetment_1_03",
		"Land_vn_usaf_revetment_1_04",
		"Land_vn_usaf_revetment_1_05",
		"Land_vn_usaf_revetment_1_06",
		"Land_vn_usaf_revetment_1_07",
		"Land_vn_usaf_revetment_1_08",
		"Land_vn_usaf_revetment_1_09",
		"Land_vn_usaf_revetment_1_10",
		"Land_vn_usaf_revetment_comp_01",
		"Land_vn_usaf_revetment_comp_02",
		"Land_vn_usaf_revetment_comp_03",
		"Land_vn_usaf_revetment_comp_04",
		"Land_vn_usaf_revetment_comp_05",
		"Land_vn_usaf_revetment_comp_06",
		"Land_vn_usaf_revetment_comp_07",
		"Land_vn_usaf_revetment_comp_08",
		"Land_vn_usaf_revetment_comp_09",
		"Land_vn_usaf_revetment_comp_10",
		"Land_vn_usaf_revetment_comp_solo_01",
		"Land_vn_usaf_revetment_low_2",
		"Land_vn_usaf_revetment_low_3",
		"Land_vn_usaf_revetment_low_8",
		"Land_vn_usaf_revetment_01",
		"Land_vn_usaf_revetment_02",
		"Land_vn_usaf_revetment_03",
		"Land_vn_usaf_revetment_04",
		"Land_vn_usaf_revetment_1",
		"Land_vn_usaf_revetment_2",
		"Land_vn_usaf_revetment_3",
		"Land_vn_usaf_revetment_8",
		
		"Land_vn_pierwooden_01_10m_norails_f",
		"Land_vn_o_trench_firing_01"
	};
};

class cfgCargoDump //for General sell/unlisted objects
{   //_lifeTime = getNumber(missionConfigFile >> "cfgCargoDump" >> "priceDefault");
    scoreDumpCoef   = 0.05;
	priceReSellCoef	= 0.6; //at least fo vehicle re-sell

    priceDefault    = 5;
    priceAmmo       = 11; //m76 ammo*3 = 33
    priceGrenade    = 30;
    priceRocket     = 1200;
    priceLauncher   = 2000;
    priceHeavyWeap  = 750;
    priceAssault    = 300;
    priceSMG        = 100;
    pricePistol     = 50;

	vhlDefaultPrice	= 5000; //if the vehicle is not in getNumber(missionConfigFile >> "CfgAllPrices" >> _itemClassName >> "price"); //that include mission crates
	tanksPrice 		= 80000; //default dump price for 'isKindOf "tank"' vehicles before priceReSellCoef
	APCPrice 		= 50000; //default dump price for 'isKindOf "Wheeled_Apc_F"' vehicles before priceReSellCoef
    
};
  //_interval = getNumber(missionConfigFile >> "CfgWeatherSetting" >> "interval");
  //_keyframes = getArray(missionConfigFile >> "CfgWeatherSetting" >> "keyframes");
  //_numbers = getArray(missionConfigFile >> "CfgWeatherSetting" >> "Clear");
class CfgWeatherSetting { //[fog,gusts,(wind dir),(wind force),overcast,rain]
    /*
    _clear = [(Random 0.3),0,0,0,0,0];
    _clearwindy = [(Random 0.1),(.5 + (Random .5)),(Random 360),(.5 + (Random .5)),0,0];
    _windy = [0,(.5 + (Random .5)),(Random 360),(.5 + (Random .5)),(.1 + (Random .9)),0];
    _stillrain = [(Random 0.2),0,0,0,(.45 + (Random .55)),(.1 + (Random .9))];
    _storm = [(Random 0.5),(.5 + (Random .5)),(Random 360),(.5 + (Random .5)),(.5 + (Random .5)),(.5 + (Random .5))];
    */
   //sleep 1500;
	interval = 30;
   	middleEastMaps[] = {"Lythium"}; //not much rain
   	SOGMaps[] = {"Cam_Lao_Nam"}; //not much rain
	//keyframes[] = {"clear","clearwindy","windy","stillrain","storm"}; //not used yet
	//keyframesMiddleEast[] = {"clear","clear","clearwindy","cover"}; //not used yet

	lowFogmaps[] = {"Tanoa"}; //not used yet
	lowFogSetup[] = {0.04,0.04,40};
    
	Clear[] =
	{
		0,    //fogValue = 
		0.06,    //fogValueR =
		0,    //gusts = 
		0,    //gustsR = 
		0,    //windFor = 
		0,    //windForR = 
		0.1,   //overcast = 
		0,   //overcastR = 
		0,      //rain = 
		0      //rainR = 
	};
	ClearWindy[] =
	{
		0,    //fogValue = 
		0,    //fogValueR =
		0.2,    //gusts = 
		0.3,    //gustsR = 
		0.2,    //windFor = 
		0.3,    //windForR = 
		0,   //overcast = 
		0.1,   //overcastR = 
		0.2,      //rain = 
		0      //rainR = 
	};
	Windy[] =
	{
		0,    //fogValue = 
		0.05,    //fogValueR =
		0.2,    //gusts = 
		0.2,    //gustsR = 
		0.2,    //windFor = 
		0.2,    //windForR = 
		0.3,   //overcast = 
		0.2,   //overcastR = 
		0,      //rain = 
		0     //rainR = 
	};
	StillRain[] =
	{
		0.06,    //fogValue = 
		0.06,    //fogValueR =
		0,    //gusts = 
		0,    //gustsR = 
		0,    //windFor = 
		0,    //windForR = 
		0.45,   //overcast = 
		0.55,   //overcastR = 
		0.1,      //rain = 
		0.7      //rainR = 
	};
	storm[] =
	{
		0.1,    //fogValue = 
		0.05,    //fogValueR =
		0.4,    //gusts = 
		0.4,    //gustsR = 
		0.4,    //windFor = 
		0.4,    //windForR = 
		0.5,   //overcast = 
		0.5,   //overcastR = 
		0.3,      //rain = 
		0.2      //rainR = 
	};
	cover[] =
	{
		0.05,    //fogValue = 
		0.1,    //fogValueR =
		0,    //gusts = 
		0,    //gustsR = 
		0,    //windFor = 
		0,    //windForR = 
		0.6,   //overcast = 
		0.35,   //overcastR = 
		0,      //rain = 
		0      //rainR = 
	};
	popeye[] =
	{
		0.05,    //fogValue = 
		0.1,    //fogValueR =
		0.1,    //gusts = 
		0.1,    //gustsR = 
		0.1,    //windFor = 
		0.1,    //windForR = 
		1,   //overcast = 
		0,   //overcastR = 
		1,      //rain = 
		0      //rainR = 
	};

};
/*//Operation Popeye
60 setGusts 0.1;
60 setWindDir (random 359);
60 setWindForce 0.1;
60 setOvercast 1;
60 setRain 1;
60 setFog 0;*/

///////////Unlocked Vehicles in traders to prevent players to harvest them in the trader zone. Made mostly to keep Hatchet chopper away from trader since they ruine everybody's FPS
//_OpenVhl = getArray(missionConfigFile >> "CfgOpenVhl" >> "vhl");
class CfgOpenVhl {
	vhl[] =
	{
		"vtx_UH60M_MEDEVAC",
		"vtx_UH60M_SLICK",
		"vtx_HH60",
		"vtx_UH60M",
		"vtx_MH60M",
		"vtx_MH60M_DAP",
		"vtx_MH60M_DAP_MLASS"
	};
};
//////////////////////BLACKLISTED STUFF/////////////////////
//_noRespawnItems = getArray(missionConfigFile >> "CfgBlackListedItems" >> "items"); //those items wont be transfered at vehicleRespawn but can still be used
class CfgBlackListedItems {//from respawn vehicle inventory
	items[] =
	{
		//"MineDetector", //increasing price A LOT so here for cleanup
		//ACRE Radio
		"ACRE_PRC77",
		"ACRE_PRC117F",
		"ACRE_PRC148",
		"ACRE_PRC152",
		"ACRE_PRC343",
		"ACRE_SEM52SL",
		"ACRE_SEM70",

		"rhs_acc_dtk",
		"rhs_acc_dtk1",
		"rhs_acc_dtk1983",
		"rhs_acc_dtk1l",
		"rhs_acc_dtk1p",
		"rhs_acc_dtk2",
		"rhs_acc_dtk3",
		"rhs_acc_dtk4long",
		"rhs_acc_dtk4screws",
		"rhs_acc_dtk4short",
		"rhs_acc_dtkakm",
		"rhs_acc_dtkrpk",
		"rhs_muzzleFlash_dtk",
		"rhs_muzzleFlash_dtk1",
		"rhs_muzzleFlash_dtk2",
		"rhs_muzzleFlash_dtk3",
		"rhs_muzzleflash_dtkakm",

		"rhs_rpg18_mag",//RPG-18
		"rhs_rpg26_mag",//RPG-26
		"rhs_rpg75_mag",//RPG-75
		"rhs_m72a7_mag",//M72 HEDP
		"rhs_rshg2_mag",//RShG-2
		"rhs_dummy_mag",//M136 HEAT
		"rhs_m136_hedp_mag",//M136 HEDP
		"rhs_m136_hp_mag",//M136 HP
		"rhs_m136_mag",//M136 HEAT

		"FlashDisk", //quest Item

		"ACE_rope12", //One rope change className and duplicate //that was the new ACE "add rope to vehicle" function
		"ACE_tourniquet",
		"ItemMap",
		"ItemCompass",
		"ItemWatch",
		"ItemRadio"
	};
};
class CfgBlackListedInv {//from player inventory at custom respawn
	items[] =
	{	
		//"MineDetector", //increasing price A LOT so here for cleanup
		//ACRE Radio
		"ACRE_PRC77",
		"ACRE_PRC117F",
		"ACRE_PRC148",
		"ACRE_PRC152",
		"ACRE_PRC343",
		"ACRE_SEM52SL",
		"ACRE_SEM70",

		"rhs_acc_dtk",
		"rhs_acc_dtk1",
		"rhs_acc_dtk1983",
		"rhs_acc_dtk1l",
		"rhs_acc_dtk1p",
		"rhs_acc_dtk2",
		"rhs_acc_dtk3",
		"rhs_acc_dtk4long",
		"rhs_acc_dtk4screws",
		"rhs_acc_dtk4short",
		"rhs_acc_dtkakm",
		"rhs_acc_dtkrpk",
		"rhs_muzzleFlash_dtk",
		"rhs_muzzleFlash_dtk1",
		"rhs_muzzleFlash_dtk2",
		"rhs_muzzleFlash_dtk3",
		"rhs_muzzleflash_dtkakm",

		"FlashDisk", //quest Item

		"rhs_rpg18_mag",//RPG-18
		"rhs_rpg26_mag",//RPG-26
		"rhs_rpg75_mag",//RPG-75
		"rhs_m72a7_mag",//M72 HEDP
		"rhs_rshg2_mag",//RShG-2
		"rhs_dummy_mag",//M136 HEAT
		"rhs_m136_hedp_mag",//M136 HEDP
		"rhs_m136_hp_mag",//M136 HP
		"rhs_m136_mag"//M136 HEAT
	};
};
class CfgArtyVhl { //allow the vehicle but tag it for CfgBlackListedShell blacklist
	vhl[] =
	{//Not used yet

	};
};
class CfgBlackListedShell {
	mags[] =
	{//Not used yet
		"12Rnd_230mm_rockets_cluster",//230 mm Cluster Rocket
		"2Rnd_155mm_Mo_Cluster",//Cluster Shells
		"2Rnd_155mm_Mo_Cluster_O",//Cluster Shells
		"6Rnd_155mm_Mo_AT_mine",//AT Mine Cluster
		"6Rnd_155mm_Mo_AT_mine_O",//AT Mine Cluster
		"6Rnd_155mm_Mo_mine",//Mine Cluster
		"6Rnd_155mm_Mo_mine_O",//Mine Cluster
		"magazine_ShipCannon_120mm_AT_mine_shells_x6",//AT Mine Cluster
		"magazine_ShipCannon_120mm_HE_cluster_shells_x2",//Cluster Shells
		"magazine_ShipCannon_120mm_mine_shells_x6",//Mine Cluster
		"magazine_Missiles_Cruise_01_Cluster_x18",//Cruise Missile Cluster
		"rhs_mag_155mm_m731_1",//Mine Cluster
		"rhs_mag_155mm_m864_3",//Cluster Shells
		"rhs_mag_155mm_raams_1"//AT Mine Cluster
	};
};
//_clusterVhl = getArray(missionConfigFile >> "CfgPylonVhl" >> "vhl");
//_clusterMags = getArray(missionConfigFile >> "CfgBlackListedBomb" >> "mags");
//this setVariable ["ace_pylons_magazineBlacklist", ["PylonRack_7Rnd_Rocket_04_HE_F","PylonRack_7Rnd_Rocket_04_AP_F"]];
class CfgPylonVhl { //allow the vehicle but tag it for CfgBlackListedBomb blacklist
	vhl[] =
	{	//classname, not isKindOf
		"O_Heli_Light_02_dynamicLoadout_F",
	    "I_E_Heli_light_03_dynamicLoadout_F",
	    "B_Heli_Attack_01_dynamicLoadout_F",
		"vtx_MH60M_DAP",
		"vtx_MH60M_DAP_MLASS",
		"RHSGREF_A29B_HIDF", //super Tucano
		"RHS_A10",
		"rhs_l159_cdf_b_CDF",
		"rhs_l39_cdf_b_cdf",
		"RHS_MELB_AH6M_M",
	    "rhsgref_b_mi24g_CAS",
		"rhs_uh1h_hidf_gunship",
	    "rhsgref_cdf_b_reg_Mi17Sh",
	    "RHS_MELB_AH6M",
	    "RHS_AH1Z_wd",
	    "rhsgref_cdf_Mi35",
		"RHS_Su25SM_CAS_vvs",
	    "RHS_Ka52_vvsc",
	    "rhs_mi28n_vvs",
		"rhs_mi28n_s13_vvsc",
	    "RHS_Mi24P_vvsc",
		"RHS_AH64D_wd"
	};
};
class CfgBlackListedBomb {
	mags[] =
	{
		//LongBow hellfires are just flying around looking for ANY target
		"6Rnd_ACE_Hellfire_AGM114L",//AGM-114L [ACE]
		"ace_compat_rhs_usf3_pylon_mag_2rnd_hellfire_l",//2x AGM-114L [ACE]
		"PylonMissile_1Rnd_ACE_Hellfire_AGM114L",//1x AGM-114L [ACE]
		"PylonRack_1Rnd_ACE_Hellfire_AGM114L",//1x AGM-114L [ACE]
		"PylonRack_3Rnd_ACE_Hellfire_AGM114L",//3x AGM-114L [ACE]
		"PylonRack_4Rnd_ACE_Hellfire_AGM114L",//4x AGM-114L [ACE]
		"rhs_mag_AGM114L",//AGM-114L
		"rhs_mag_AGM114L_2",//AGM-114L (M310)
		"rhs_mag_AGM114L_2_plane",//AGM-114L (M310)
		"rhs_mag_AGM114L_4",//AGM-114L (M299)
		"rhs_mag_AGM114L_plane",//AGM-114L
		"rhs_mag_Hellfire_base",//AGM-114L Hellfire II
		"UK3CB_BAF_PylonRack_4Rnd_Hellfire_L",//AGM-114L x4
		//clusters/mines
		"4Rnd_BombCluster_01_F",//CBU-85
		"PylonMissile_1Rnd_BombCluster_01_F",//CBU-85 Cluster x1
		"PylonRack_2Rnd_BombCluster_01_F",//CBU-85 Cluster x2
		"PylonMissile_1Rnd_BombCluster_02_cap_F",//RBK-500F Cluster x1
		"PylonMissile_1Rnd_BombCluster_02_F",//RBK-500F Cluster x1
		"PylonMissile_1Rnd_BombCluster_03_F",//BL778 Cluster x1
		"PylonRack_2Rnd_BombCluster_03_F",//BL778 Cluster x2
		"rhs_mag_cbu100",//CBU-100
		"rhs_mag_cbu100_3",//CBU-100 (BRU-42)
		"rhs_mag_cbu87",//CBU-87
		"rhs_mag_cbu87_3",//CBU-87 (BRU-42)
		"rhs_mag_cbu89",//CBU-89
		"rhs_mag_cbu89_3",//CBU-89 (BRU-42)
		"4Rnd_BombCluster_02_F",//RBK-500F
		"4Rnd_BombCluster_03_F"//BL778

	};
};