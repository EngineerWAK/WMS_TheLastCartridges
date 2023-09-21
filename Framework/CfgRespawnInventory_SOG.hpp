
class CfgRespawnInventory
{
	class IND_Bambi
	{
		displayName = "1-Bambi";							// Name visible in the menu
		icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\sergeant_gs.paa";	// Icon displayed next to the name
		//role = "Bambi";										// Optional, see CfgRoles
		role = "LoneWolf";										// Optional, see CfgRoles

		weapons[] = {"vn_m_bayo_m16"};//you wanted a weapon? you got a weapon.
		magazines[] = {
			"vn_m18_purple_mag"
		};
		items[] = {
			"ACE_Banana", //Define "Bambi"
			"vn_fkb1",//flashlight
			//"ACE_Can_Spirit",
			"ACE_fieldDressing",
			"ACE_fieldDressing",
			"ACE_bloodIV_250",
			"ACE_EarPlugs",
			"vn_prop_food_can_03_04",
			"ACE_splint",
			"ACE_tourniquet",
			"vn_prop_drink_01"
		};
		linkedItems[] = {
			"vn_o_item_map",,
			//"rhsusf_ANPVS_14"
			"vn_b_item_compass",
			"vn_b_item_watch",
			"vn_b_item_radio_urc10",
			"vn_b_headband_02"
		};
		uniformClass = "vn_o_uniform_vc_02_05";
		//backpack = "B_AssaultPack_rgr";
	};
	class IND_Medic
	{
		displayName = "2-Medic";							// Name visible in the menu
		icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\sergeant_gs.paa";	// Icon displayed next to the name
		role = "LoneWolf";										// Optional, see CfgRoles

		weapons[] = {
			"vn_m45_camo",
			"Binocular"
		};
		magazines[] = {
			"vn_m45_mag",
			"vn_m45_mag",
			"vn_m45_mag",
			"vn_m18_purple_mag",
			"vn_m18_purple_mag"
		};
		items[] = {
			"ACE_personalAidKit",
			"ACE_EarPlugs",
			"ACE_surgicalKit", //Define "Medic"
			"ACE_fieldDressing",
			"ACE_fieldDressing",
			"ACE_fieldDressing",
			"ACE_fieldDressing",
			"ACE_fieldDressing",
			"ACE_fieldDressing",
			"ACE_fieldDressing",
			"ACE_packingBandage",
			"ACE_packingBandage",
			"ACE_packingBandage",
			"ACE_packingBandage",
			"ACE_packingBandage",
			"ACE_packingBandage",
			"ACE_packingBandage",
			"ACE_morphine",
			"ACE_morphine",
			"ACE_morphine",
			"ACE_morphine",
			"ACE_epinephrine",
			"ACE_epinephrine",
			"ACE_epinephrine",
			"ACE_epinephrine",
			//"ACE_adenosine",
			//"ACE_adenosine",
			"ACE_splint",
			"ACE_splint",
			"ACE_splint",
			"ACE_splint",
			"ACE_tourniquet",
			"ACE_tourniquet",
			"ACE_tourniquet",
			"ACE_tourniquet",
			"ACE_bloodIV",
			"ACE_bloodIV",
			"ACE_bloodIV_500",
			"ACE_bloodIV_500",
			"ACE_bloodIV_500",
			"ACE_bloodIV_500",
			"ACE_plasmaIV_250",
			"ACE_plasmaIV_250",
			"ACE_plasmaIV_250",
			"ACE_plasmaIV_250",
			"vn_prop_food_can_02_04",
			"vn_prop_drink_02"
		};
		linkedItems[] = {
			"vn_b_vest_sog_02",
			"vn_i_helmet_m1_01_01",
			"vn_o_item_map",
			"vn_b_item_compass",
			"vn_b_item_watch",
			"vn_b_item_radio_urc10",
			"rhsusf_ANPVS_14"
		};
		uniformClass = "vn_b_uniform_macv_03_17";
		//backpack = "B_AssaultPack_rgr";
		};
	class IND_Engineer
	{
		displayName = "3-Engineer";							// Name visible in the menu
		icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\sergeant_gs.paa";	// Icon displayed next to the name
		role = "LoneWolf";										// Optional, see CfgRoles

		weapons[] = {
			"vn_mat49",
			"vn_m19_binocs_grn"
		};
		magazines[] = {
			"vn_mat49_mag",
			"vn_mat49_mag",
			"vn_mat49_mag",
			"rhs_mag_an_m14_th3",
			"rhs_mag_an_m14_th3",
			"vn_m7_grenade_mag",
			"vn_m7_grenade_mag",
			"vn_m18_purple_mag"
		};
		items[] = {
			"ToolKit",//Define "Engineer"
			"ACE_Clacker",
			"ACE_Flashlight_MX991",
			"ACE_fieldDressing",
			"ACE_fieldDressing",
			"ACE_fieldDressing",
			"ACE_fieldDressing",
			"ACE_bloodIV_250",
			"ACE_EarPlugs",
			"ACE_morphine",
			"vn_prop_drink_04",
			"vn_prop_food_can_02_03",
			"ACE_splint",
			"ACE_tourniquet",
			"ACE_plasmaIV_250"
		};
		linkedItems[] = {
			"vn_b_vest_seal_07",//"rhs_6sh117_mg",
			"vn_b_helmet_m1_03_01",
			"vn_o_item_map",
			"vn_b_item_compass",
			"vn_b_item_watch",
			"vn_b_item_radio_urc10",
			"rhsusf_ANPVS_14"
		};
		uniformClass = "vn_b_uniform_macv_04_07";
		//backpack = "B_AssaultPack_rgr";
	};
	class IND_Breacher
	{
		displayName = "4-Breacher";								// Name visible in the menu
		icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\sergeant_gs.paa";	// Icon displayed next to the name
		role = "LoneWolf";										// Optional, see CfgRoles

		weapons[] = {
			"vn_m1897",
			"vn_m1911",
			"vn_m19_binocs_grn"
		};
		magazines[] = {
			"vn_m1897_fl_mag",
			"vn_m1897_fl_mag",
			"vn_m1897_fl_mag",
			"vn_m1897_fl_mag",
			"vn_m1897_fl_mag",
			"vn_m1911_mag",
			"vn_m1911_mag",
			"rhs_mag_an_m14_th3",
			//"rhs_charge_tnt_x2_mag",
			"SmokeShellGreen"
		};
		items[] = {
			//"DemoCharge_Remote_Mag",
			"rhs_charge_M2tet_x2_mag",
			"ACE_DefusalKit",//Define "Breacher"
			"ACE_DeadManSwitch",//Define "Breacher"
			"ACE_M26_Clacker",//Define "Breacher"
			"ACE_Clacker",//Define "Breacher"
			"ACE_Flashlight_MX991",
			"ACE_fieldDressing",
			"ACE_fieldDressing",
			"ACE_fieldDressing",
			"ACE_fieldDressing",
			"ACE_bloodIV_250",
			"ACE_EarPlugs",
			"ACE_morphine",
			"vn_prop_drink_05",
			"vn_prop_food_can_02_05",
			"ACE_splint",
			"ACE_tourniquet",
			"ACE_plasmaIV_250"
		};
		linkedItems[] = {
			"vn_b_vest_sog_03",
			"vn_b_helmet_m1_02_01",
			"vn_o_item_map",
			"vn_b_item_compass",
			"vn_b_item_watch",
			"vn_b_item_radio_urc10",
			"rhsusf_ANPVS_14"
		};
		uniformClass = "vn_b_uniform_macv_05_05";
		//backpack = "B_AssaultPack_rgr";
	};
	class IND_Assault
	{
		displayName = "5-Assault A";							// Name visible in the menu
		icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\sergeant_gs.paa";	// Icon displayed next to the name
		role = "LoneWolf";										// Optional, see CfgRoles

		weapons[] = {
			"vn_m16_camo",
			"vn_m19_binocs_grn"
		};
		magazines[] = {
			"vn_m16_20_t_mag",
			"vn_m16_20_t_mag",
			"vn_m16_20_t_mag",
			"vn_m16_20_t_mag",
			"rhs_mag_an_m14_th3",
			"vn_m61_grenade_mag",
			"vn_m61_grenade_mag",
			"vn_m61_grenade_mag",
			"vn_m18_purple_mag"
		};
		items[] = {
			"ACE_fieldDressing",
			"ACE_fieldDressing",
			"ACE_fieldDressing",
			"ACE_fieldDressing",
			"ACE_bloodIV_250",
			"ACE_EarPlugs",
			"ACE_morphine",
			"vn_prop_drink_02",
			"vn_prop_food_can_03_01",
			"ACE_plasmaIV_250",
			"ACE_splint",
			"ACE_tourniquet"
		};
		linkedItems[] = {
			"vn_b_m16", //baillonete
			"vn_b_vest_usmc_01",
			"vn_i_helmet_m1_02_01",
			"vn_o_item_map",
			"vn_b_item_compass",
			"vn_b_item_watch",
			"vn_b_item_radio_urc10",
			"rhsusf_ANPVS_14"
		};
		uniformClass = "vn_b_uniform_macv_06_07";
		//backpack = "B_AssaultPack_rgr";
	};
	class IND_Assault2
	{
		displayName = "5-Assault B";							// Name visible in the menu
		icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\sergeant_gs.paa";	// Icon displayed next to the name
		role = "LoneWolf";										// Optional, see CfgRoles

		weapons[] = {
			"vn_m1_garand",
			"vn_m19_binocs_grn"
		};
		magazines[] = {
			"vn_m1_garand_mag",
			"vn_m1_garand_mag",
			"vn_m1_garand_mag",
			"vn_m1_garand_mag",
			"vn_m1_garand_mag",
			"rhs_mag_an_m14_th3",
			"vn_m61_grenade_mag",
			"vn_m61_grenade_mag",
			"vn_m18_purple_mag"
		};
		items[] = {
			"ACE_fieldDressing",
			"ACE_fieldDressing",
			"ACE_fieldDressing",
			"ACE_fieldDressing",
			"ACE_bloodIV_250",
			"ACE_EarPlugs",
			"ACE_morphine",
			"vn_prop_drink_01",
			"vn_prop_food_can_01_13",
			"ACE_plasmaIV_250",
			"ACE_splint",
			"ACE_tourniquet"
		};
		linkedItems[] = {
			"vn_b_vest_usmc_02",
			"vn_b_helmet_m1_07_01",
			"vn_o_item_map",
			"vn_b_item_compass",
			"vn_b_item_watch",
			"vn_b_item_radio_urc10",
			"rhsusf_ANPVS_14"
		};
		uniformClass = "vn_b_uniform_macv_05_05";
		//backpack = "B_AssaultPack_rgr";
	};
	class IND_Marksman
	{
		displayName = "6-Marksman A";							// Name visible in the menu
		icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\sergeant_gs.paa";	// Icon displayed next to the name
		role = "LoneWolf";										// Optional, see CfgRoles

		weapons[] = {
			"vn_k98k",
			"vn_m10",
			"ACE_Yardage450"
		};
		magazines[] = {
			"vn_k98k_mag",
			"vn_k98k_mag",
			"vn_k98k_mag",
			"vn_k98k_mag",
			"vn_k98k_mag",
			"vn_m10_mag",
			"vn_m10_mag",
			"vn_m18_purple_mag"
		};
		items[] = {
			"ACE_Flashlight_MX991",
			"ACE_Kestrel4500",
			"ACE_RangeCard",//Define "Sniper"
			"ACE_SpottingScope",
			"ACE_fieldDressing",
			"ACE_fieldDressing",
			"ACE_fieldDressing",
			"ACE_fieldDressing",
			"ACE_bloodIV_250",
			"ACE_EarPlugs",
			"ACE_morphine",
			"vn_prop_drink_01",
			"vn_prop_food_can_01_12",
			"ACE_plasmaIV_250",
			"ACE_splint",
			"ACE_tourniquet"
		};
		linkedItems[] = {
			"vn_b_vest_sog_06",
			"vn_b_helmet_m1_08_01",
			"vn_b_k98k",
			"vn_o_1_5x_k98k",
			"vn_b_camo_k98k",
			"vn_o_item_map",
			"vn_b_item_compass",
			"vn_b_item_watch",
			"vn_b_item_radio_urc10",
			"rhsusf_ANPVS_14"
		};
		uniformClass = "vn_b_uniform_macv_03_05";
		//backpack = "B_AssaultPack_rgr";
	};
	class IND_Marksman2
	{
		displayName = "6-Marksman B";							// Name visible in the menu
		icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\sergeant_gs.paa";	// Icon displayed next to the name
		role = "LoneWolf";										// Optional, see CfgRoles

		weapons[] = {
			"vn_m1903",
			"vn_fkb1_pm",
			"ACE_Yardage450"
		};
		magazines[] = {
			"vn_m1903_mag",
			"vn_m1903_mag",
			"vn_m1903_mag",
			"vn_m1903_mag",
			"vn_m1903_mag",
			"vn_m1903_mag",
			"vn_m1903_mag",
			"vn_pm_mag",
			"vn_pm_mag",
			"vn_m18_purple_mag"
		};
		items[] = {
			"ACE_Flashlight_MX991",
			"ACE_Kestrel4500",
			"ACE_RangeCard",//Define "Sniper"
			"ACE_SpottingScope",
			"ACE_fieldDressing",
			"ACE_fieldDressing",
			"ACE_fieldDressing",
			"ACE_fieldDressing",
			"ACE_bloodIV_250",
			"ACE_EarPlugs",
			"ACE_morphine",
			"vn_prop_drink_02",
			"vn_prop_food_can_01_9",
			"ACE_plasmaIV_250",
			"ACE_splint",
			"ACE_tourniquet"
		};
		linkedItems[] = {
			"vn_b_scarf_01_01",
			"vn_b_vest_sog_01",
			"vn_b_bandana_01",
			"vn_b_m1903",
			"vn_o_8x_m1903",
			"vn_b_camo_m1903",
			"vn_o_item_map",
			"vn_b_item_compass",
			"vn_b_item_watch",
			"vn_b_item_radio_urc10",
			"rhsusf_ANPVS_14"
		};
		uniformClass = "vn_b_uniform_macv_02_17";
		//backpack = "B_AssaultPack_rgr";
	};
	/*class IND_Sniper
	{
		displayName = "7-Sniper";							// Name visible in the menu
		icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\sergeant_gs.paa";	// Icon displayed next to the name
		role = "LoneWolf";										// Optional, see CfgRoles

		weapons[] = {
			"rhs_weap_m40a5",
			"rhs_weap_type94_new",
			"Rangefinder"
		};
		magazines[] = {
			"rhsusf_10Rnd_762x51_m118_special_Mag",
			"rhsusf_10Rnd_762x51_m118_special_Mag",
			"rhsusf_10Rnd_762x51_m118_special_Mag",
			"rhsusf_10Rnd_762x51_m118_special_Mag",
			"rhs_mag_6x8mm_mhp",
			"rhs_mag_6x8mm_mhp",
			"SmokeShellGreen"
		};
		items[] = {
			"ACE_Flashlight_MX991",
			"ACE_Kestrel4500",
			"ACE_RangeCard",
			"ACE_SpottingScope",
			"ACE_fieldDressing",
			"ACE_fieldDressing",
			"ACE_fieldDressing",
			"ACE_fieldDressing",
			"ACE_bloodIV_250",
			"ACE_EarPlugs",
			"ACE_morphine",
			"ACE_MRE_BeefStew",
			"ACE_plasmaIV_250",
			"ACE_splint",
			"ACE_tourniquet",
			"ACE_Canteen"
		};
		linkedItems[] = {
			"rhs_acc_harris_swivel",
			"Tiger_Vest_2",
			"rhsusf_ach_helmet_camo_ocp",
			"rhsusf_shemagh2_od",
			"rhsusf_acc_nxs_3515x50f1_h58",
			//"hlc_muzzle_Evo9",
			"acc_flashlight_pistol",
			"vn_o_item_map",
			"vn_b_item_compass",
			"vn_b_item_watch",
			"vn_b_item_radio_urc10",
			"rhsusf_ANPVS_14"
		};
		uniformClass = "Tiger_Camo_Cyre";
		//backpack = "B_AssaultPack_rgr";
	};*/
	class IND_MG
	{
		displayName = "8-MachineGunner";									// Name visible in the menu
		icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\sergeant_gs.paa";	// Icon displayed next to the name
		role = "LoneWolf";											// Optional, see CfgRoles

		weapons[] = {
			"vn_m1918_bipod",
			"vn_mx991_m1911",
			"vn_m19_binocs_grn"
		};
		magazines[] = {
			"vn_m1918_t_mag",
			"vn_m1918_t_mag",
			"vn_m1918_t_mag",
			"vn_m1918_t_mag",
			"vn_m1918_t_mag",
			"vn_m1918_t_mag",
			"vn_m1918_t_mag",
			"vn_m1911_mag",
			"vn_m1911_mag",
			"vn_m67_grenade_mag",
			"vn_m67_grenade_mag",
			"vn_m18_yellow_mag"
		};
		items[] = {
			"ACE_fieldDressing",
			"ACE_fieldDressing",
			"ACE_fieldDressing",
			"ACE_fieldDressing",
			"ACE_bloodIV_250",
			"ACE_EarPlugs",
			"ACE_morphine",
			"vn_prop_food_can_03_01",
			"ACE_plasmaIV_250",
			"ACE_splint",
			"ACE_tourniquet",
			"vn_prop_drink_07_03"
		};
		linkedItems[] = {
			"vn_b_vest_seal_03",
			"vn_b_helmet_m1_04_01",
			"vn_bipod_m1918",
			"vn_o_item_map",
			"vn_b_item_compass",
			"vn_b_item_watch",
			"vn_b_item_radio_urc10",
			"rhsusf_ANPVS_14"
		};
		uniformClass = "vn_b_uniform_macv_06_05";
		//backpack = "B_AssaultPack_mcamo";
	};
	class IND_Pilot
	{
		displayName = "9-Pilot";							// Name visible in the menu
		icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\sergeant_gs.paa";	// Icon displayed next to the name
		role = "LoneWolf";										// Optional, see CfgRoles

		weapons[] = {
			"vn_vz61_p",
			"rhsusf_bino_lrf_Vector21"
		};
		magazines[] = {
			"vn_vz61_mag",
			"vn_vz61_mag",
			"vn_vz61_mag",
			"rhs_mag_an_m14_th3",
			"vn_m61_grenade_mag",
			"vn_m18_purple_mag"
		};
		items[] = {
			//"UH60_jvmf_tablet",
			"ACE_microDAGR",
			"ACE_Flashlight_MX991",
			"ACE_fieldDressing",
			"ACE_fieldDressing",
			"ACE_fieldDressing",
			"ACE_fieldDressing",
			"ACE_bloodIV_250",
			"ACE_EarPlugs",
			"ACE_morphine",
			"vn_prop_food_can_03_02",
			"vn_prop_drink_07_03",
			"ACE_splint",
			"ACE_tourniquet",
			"ACE_plasmaIV_250"
		};
		linkedItems[] = {
			"ACE_Altimeter",
			"vn_b_helmet_svh4_01_01",
			"vn_b_vest_aircrew_05",
			"vn_o_item_map",
			"vn_b_item_compass",
			//"vn_b_item_watch",
			"rhsusf_ANPVS_14",
			//"vn_b_item_radio_urc10",
			"rhsusf_radio_anprc152" //will be used for some advanced functions like "call for extraction"
		};
		uniformClass = "vn_b_uniform_k2b_02_02";
		//backpack = "B_AssaultPack_rgr";
	};
	/*class IND_GI
	{
		displayName = "GI";							// Name visible in the menu
		icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\sergeant_gs.paa";	// Icon displayed next to the name
		role = "LoneWolf";										// Optional, see CfgRoles

		weapons[] = {
			"rhs_weap_m1garand_sa43",
			"Binocular"
		};
		magazines[] = {
			"rhsgref_8Rnd_762x63_Tracer_M1T_M1rifle",
			"rhsgref_8Rnd_762x63_Tracer_M1T_M1rifle",
			"rhsgref_8Rnd_762x63_Tracer_M1T_M1rifle",
			"rhsgref_8Rnd_762x63_Tracer_M1T_M1rifle",
			"rhsgref_8Rnd_762x63_Tracer_M1T_M1rifle",
			"rhsgref_8Rnd_762x63_Tracer_M1T_M1rifle",
			"rhsgref_8Rnd_762x63_Tracer_M1T_M1rifle",
			"rhsgref_8Rnd_762x63_Tracer_M1T_M1rifle",
			"rhsgref_8Rnd_762x63_Tracer_M1T_M1rifle",
			"rhsgref_8Rnd_762x63_Tracer_M1T_M1rifle",
			"rhs_mag_f1",
			"rhs_mag_f1",
			"SmokeShellGreen"
		};
		items[] = {
			"ACE_fieldDressing",
			"ACE_fieldDressing",
			"ACE_fieldDressing",
			"ACE_fieldDressing",
			"ACE_bloodIV_250",
			"ACE_EarPlugs",
			"ACE_morphine",
			"ACE_MRE_BeefStew",
			"ACE_plasmaIV_250",
			"ACE_splint",
			"ACE_tourniquet",
			"ACE_Canteen"
		};
		linkedItems[] = {
			"rhsgref_otv_khaki",
			"rhsgref_helmet_M1_bare_alt01",
			"ItemMap",
			"ItemCompass",
			"ItemWatch",
			"ItemRadio",
			"rhsusf_ANPVS_14"
		};
		uniformClass = "rhsgref_uniform_woodland";
		//backpack = "B_AssaultPack_rgr";
	};
	class IND_Frantz
	{
		displayName = "Frantz";							// Name visible in the menu
		icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\sergeant_gs.paa";	// Icon displayed next to the name
		role = "LoneWolf";										// Optional, see CfgRoles

		weapons[] = {
			"rhs_weap_MP44",
			"rhs_weap_pb_6p9",
			"Binocular"
		};
		magazines[] = {
			"rhsgref_30Rnd_792x33_SmE_StG",
			"rhsgref_30Rnd_792x33_SmE_StG",
			"rhsgref_30Rnd_792x33_SmE_StG",
			"rhs_mag_9x18_8_57N181S",
			"rhs_mag_9x18_8_57N181S",
			"rhs_grenade_sthgr24_x7bundle_mag",
			"SmokeShellGreen"
		};
		items[] = {
			"ACE_fieldDressing",
			"ACE_fieldDressing",
			"ACE_fieldDressing",
			"ACE_fieldDressing",
			"ACE_bloodIV_250",
			"ACE_EarPlugs",
			"ACE_morphine",
			"ACE_MRE_BeefStew",
			"ACE_plasmaIV_250",
			"ACE_splint",
			"ACE_tourniquet",
			"ACE_Canteen"
		};
		linkedItems[] = {
			"rhsgref_otv_digi",
			"rhsgref_helmet_m1940",
			"ItemMap",
			"ItemCompass",
			"ItemWatch",
			"ItemRadio",
			"rhsusf_ANPVS_14"
		};
		uniformClass = "rhsgref_uniform_flecktarn";
		//backpack = "B_AssaultPack_rgr";
	};*/
};
