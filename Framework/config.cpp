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
	name = "v1.526_2022APR01_MoltenTungsten_GitHub";
};

class CfgBuildingsCategories
{	//_weaponsCategories = getArray(missionConfigFile >> "CfgBuildingsCategories" >> "BuildingClass_Spe" >> "items");
    #include "ClassNames\BuildingsLootSpawn.hpp"
};
class CfgAmmoCategories
{	//_weaponsCategories = getArray(missionConfigFile >> "CfgAmmoCategories" >> "Ammunition" >> "items");
    #include "ClassNames\AmmoCategories.hpp"
};
class CfgWeapCategories
{	//_weaponsCategories = getArray(missionConfigFile >> "CfgWeapCategories" >> "SniperRifles" >> "items");
    #include "ClassNames\WeaponsCategories.hpp"
};
class CfgVehicleCategories
{	//_vehicleCategories = getArray(missionConfigFile >> "CfgVehicleCategories" >> "Cars" >> "items");
    #include "ClassNames\VehiclesCategories.hpp"
};
class CfgItemsCategories
{   //_itemsCategories = getArray(missionConfigFile >> "CfgItemsCategories" >> "ItemsBlabla" >> "items");
    #include "ClassNames\ItemsCategories.hpp"
	#include "ClassNames\EquipementCategories.hpp"
};
class CfgLootToSpawnCategories
{   //_itemsCategories = getArray(missionConfigFile >> "CfgLootToSpawnCategories" >> "weapons" >> "items");
    #include "ClassNames\LootToSpawnCategories.hpp"
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
		"C_IDAP_Van_02_medevac_F",
		"C_Van_02_medevac_F",
		"I_E_Van_02_medevac_F",
		"B_Truck_01_medical_F",
		"B_T_Truck_01_medical_F",
		"O_Truck_02_medical_F",
		"O_Truck_03_medical_F",
		"O_T_Truck_02_Medical_F",
		"O_T_Truck_03_medical_ghex_F",

		"GUE_WarfareBFieldhHospital", //CUP trader
		"Land_Research_house_V1_F",
		"Land_Medevac_house_V1_F",
		"Land_MedicalTent_01_NATO_generic_open_F"
	};
};
class CfgForceRepairFacilities //some Repair vehicles/buildings are not recognized as Medical facilities
{//_forceMedicalFacilities = getArray(missionConfigFile >> "CfgForceRepairFacilities" >> "vehicles");
	vehicles[] = 
	{
		"B_APC_Tracked_01_CRV_F",
		"O_Heli_Transport_04_repair_black_F",
		"rhsusf_M1078A1R_SOV_M2_WD_fmtv_socom",
		"rhsusf_M977A4_REPAIR_usarmy_wd",
		"RHS_Ural_Repair_VDV_01",
		"rhsusf_m1152_rsv_usarmy_wd"
	};
};
class CfgForceAmmoFacilities //some Ammo vehicles/buildings are not recognized as Medical facilities
{//_forceMedicalFacilities = getArray(missionConfigFile >> "CfgForceAmmoFacilities" >> "vehicles");
	vehicles[] = 
	{
		"B_APC_Tracked_01_CRV_F",
		"O_Heli_Transport_04_ammo_black_F",
		"O_T_Truck_03_ammo_ghex_F",
		"rhs_kamaz5350_ammo_vdv",
		"rhsusf_m113_usarmy_supply",
		"rhsusf_M1078A1R_SOV_M2_WD_fmtv_socom",
		"rhsusf_m1152_rsv_usarmy_wd"
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
	staticList[] =
	{
		{"RHS_Metis_Gun_Bag",
		"RHS_Metis_Tripod_Bag"},
		{"RHS_Kornet_Gun_Bag",
		"RHS_Kornet_Tripod_Bag"},
		{"RHS_DShkM_Gun_Bag",
		"RHS_DShkM_TripodHigh_Bag"},
		{"RHS_Kord_Tripod_Bag",
		"RHS_Kord_Gun_Bag"},
		{"RHS_NSV_Tripod_Bag",
		"RHS_NSV_Gun_Bag"},
		{"RHS_SPG9_Gun_Bag",
		"RHS_SPG9_Tripod_Bag"},
		{"rhs_Tow_Gun_Bag",
		"rhs_TOW_Tripod_Bag"},
		{"rhs_M252_Gun_Bag",
		"rhs_M252_Bipod_Bag"}
	};
	itemsList[] =
	{
		{
			"rocketMan",
			"ACE_Can_Franta",
			"ACE_Can_RedGull",
			"ACE_Can_Spirit"
		},
		{
			"static",
			"B_Patrol_Respawn_bag_F",
			"B_Respawn_Sleeping_bag_brown_F",
			"I_UAV_01_backpack_F",
			"H_HelmetO_ViperSP_ghex_F"
		},
		{
			"rhs_weap_asval_grip_npz",
			"rhs_weap_M107_w",
			"MMG_02_black_F",
			"MMG_01_hex_F",
			//"LMG_03_F",
			"rhs_weap_m32",
			"rhs_weap_SCARH_USA_LB",
			"rhs_weap_SCARH_USA_CQC",
			"rhs_weap_SCARH_USA_STD",
			"rhs_weap_m14_socom_rail"
		},
		{
			"rhs_weap_smaw",
			"rhs_weap_rpg7",
			"launch_I_Titan_short_F",
			"rhs_weap_fgm148"
		},
		{
			"rhsgref_tla_g_ZU23", //ZSU23-2 as test
			"rhsgref_tla_g_ZU23", //ZSU23-2 as test
			"RHS_Stinger_AA_pod_WD", //stingers station
			"rhs_Igla_AA_pod_vdv", //Igla station
			"rhsgref_nat_d30_at", //AT cannon
			//"rhs_KORD_high_MSV",

			"I_UAV_02_CAS_F",
			
			"B_T_VTOL_01_armed_F",
			"B_Plane_CAS_01_F", //A10
			"rhs_l159_CDF", //small fighter
			"rhs_uh1h_hidf_gunship",
			"rhs_uh1h_idap",
			"rhs_uh1h_un",

			"RHS_M6_wd", //Bradley stingers
			"I_E_APC_tracked_03_cannon_F", //FV-720
			"rhsusf_stryker_m1134_wd", //Missiles
			"rhsgref_cdf_zsu234",
			"rhsusf_M1078A1R_SOV_M2_WD_fmtv_socom",
			"rhs_bmd1pk",
			"rhs_bmd2k",
			"RHS_Ural_Zu23_VDV_01",
			"rhsgref_nat_btr70",
			"rhs_t72bc_tv",
			"rhs_btr80a_vdv",
			"rhsusf_m1152_rsv_usarmy_wd",
			"rhsusf_m1151_m240_v3_usmc_wd",
			"RHS_Ural_Repair_VDV_01"
		}
	};
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
		HaloJump
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
			"ACE_atropine", //250
			"ACE_adenosine", //250
			"ACE_tourniquet", //30
			"ACE_fieldDressing", //25
			"ACE_fieldDressing", //25
			"ACE_fieldDressing", //25
			"ACE_fieldDressing", //25
			"ACE_fieldDressing" //25
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
	vehiclesManagement[] = 
	{
		34, //number of restarts before unused vehicles get destroyed //34*5 = one week
		28, //number of restart before warning
		10000 //price to pay to the trader to reset restart counter //not yet
	};

	MarkersToCheck[] = 
	{
		"Select",		//_markerTraders "n_installation" //TYPO ???
		"respawn_para",	//_markerSpawns
		"mil_flag"		//_markerTerritory
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
class CfgRespectColors {     
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
	LootlifeTime = 480;
	minDistToTraders = 200; //not used yet
	minDistToTerritories = 100; //not used yet
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
	APCPrice 		= 40000; //default dump price for 'isKindOf "Wheeled_Apc_F"' vehicles before priceReSellCoef
    
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
	//keyframes[] = {"clear","clearwindy","windy","stillrain","storm"}; //not used yet
	//keyframesMiddleEast[] = {"clear","clear","clearwindy","cover"}; //not used yet

	lowFogmaps[] = {"Tanoa"}; //not used yet
	lowFogSetup[] = {0.05,0.05,40};
    
	Clear[] =
	{
		0,    //fogValue = 
		0.1,    //fogValueR =
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
		0.1,    //fogValueR =
		0.2,    //gusts = 
		0.2,    //gustsR = 
		0.2,    //windFor = 
		0.2,    //windForR = 
		0.2,   //overcast = 
		0.2,   //overcastR = 
		0,      //rain = 
		0     //rainR = 
	};
	StillRain[] =
	{
		0.1,    //fogValue = 
		0.1,    //fogValueR =
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
		0.2,    //fogValue = 
		0.1,    //fogValueR =
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
		0.3,   //overcast = 
		0.6,   //overcastR = 
		0,      //rain = 
		0      //rainR = 
	};

};
//_noRespawnItems = getArray(missionConfigFile >> "CfgBlackListedItems" >> "items"); //those items wont be transfered at vehicleRespawn but can still be used
class CfgBlackListedItems {     
	items[] =
	{
		"ACRE_PRC77",
		"ACRE_PRC117F",
		"ACRE_PRC148",
		"ACRE_PRC152",
		"ACRE_PRC343",
		"ACRE_SEM52SL",
		"ACRE_SEM70",

		"ACE_tourniquet",
		"ItemMap",
		"ItemCompass",
		"ItemWatch",
		"ItemRadio"
	};
 };