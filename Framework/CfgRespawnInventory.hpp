
class CfgRespawnInventory
{
	class IND_Bambi
	{
		displayName = "1-Bambi";							// Name visible in the menu
		icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\sergeant_gs.paa";	// Icon displayed next to the name
		//role = "Bambi";										// Optional, see CfgRoles
		role = "LoneWolf";										// Optional, see CfgRoles

		//weapons[] = {};
		magazines[] = {
			"SmokeShellGreen"
		};
		items[] = {
			"ACE_Banana",
			"ACE_Can_Spirit",
			"ACE_fieldDressing",
			"ACE_fieldDressing",
			"ACE_bloodIV_250",
			"ACE_EarPlugs",
			"ACE_MRE_CreamTomatoSoup",
			"ACE_splint",
			"ACE_tourniquet",
			"ACE_WaterBottle"
		};
		linkedItems[] = {
			"ItemMap",
			"ItemCompass",
			"ItemWatch",
			"ItemRadio",
			"rhsusf_ANPVS_14"
		};
		uniformClass = "U_C_Scientist";
		//backpack = "B_AssaultPack_rgr";
	};
	class IND_Medic
	{
		displayName = "2-Medic";							// Name visible in the menu
		icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\sergeant_gs.paa";	// Icon displayed next to the name
		role = "LoneWolf";										// Optional, see CfgRoles

		weapons[] = {
			"SMG_02_F",
			"Binocular"
		};
		magazines[] = {
			"30Rnd_9x21_Mag",
			"30Rnd_9x21_Mag",
			"30Rnd_9x21_Mag",
			"SmokeShellGreen",
			"SmokeShellGreen",
			"SmokeShellGreen"
		};
		items[] = {
			"ACE_personalAidKit",
			"ACE_surgicalKit",
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
			"ACE_adenosine",
			"ACE_adenosine",
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
			"ACE_bodyBag",
			"ACE_EarPlugs",
			"ACE_MRE_BeefStew",
			"ACE_Canteen"
		};
		linkedItems[] = {
			"rhs_lifchik_vog",
			"H_Booniehat_oli",
			"rhs_acc_2dpZenit_ris",
			"rhs_acc_pkas",
			"ItemMap",
			"ItemCompass",
			"ItemWatch",
			"ItemRadio",
			"rhsusf_ANPVS_14"
		};
		uniformClass = "AOR2_Camo_Cyre";
		//backpack = "B_AssaultPack_rgr";
		};
	class IND_Engineer
	{
		displayName = "3-Engineer";							// Name visible in the menu
		icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\sergeant_gs.paa";	// Icon displayed next to the name
		role = "LoneWolf";										// Optional, see CfgRoles

		weapons[] = {
			"hgun_PDW2000_F",
			"Binocular"
		};
		magazines[] = {
			"30Rnd_9x21_Mag",
			"30Rnd_9x21_Mag",
			"30Rnd_9x21_Mag",
			"rhs_mag_an_m14_th3",
			"rhs_mag_an_m14_th3",
			"rhs_charge_tnt_x2_mag",
			"rhs_charge_tnt_x2_mag",
			"SmokeShellGreen"
		};
		items[] = {
			"ToolKit",
			"ACE_Clacker",
			"ACE_Flashlight_MX991",
			"ACE_fieldDressing",
			"ACE_fieldDressing",
			"ACE_fieldDressing",
			"ACE_fieldDressing",
			"ACE_bloodIV_250",
			"ACE_EarPlugs",
			"ACE_morphine",
			"ACE_Can_Spirit",
			"ACE_MRE_ChickenTikkaMasala",
			"ACE_splint",
			"ACE_tourniquet",
			"ACE_plasmaIV_250"
		};
		linkedItems[] = {
			"rhs_6sh117_mg",
			"H_Cap_blk_CMMG",
			"acc_flashlight",
			"ItemMap",
			"ItemCompass",
			"ItemWatch",
			"ItemRadio",
			"rhsusf_ANPVS_14"
		};
		uniformClass = "U_BG_Guerrilla_6_1";
		//backpack = "B_AssaultPack_rgr";
	};
	class IND_Breacher
	{
		displayName = "4-Breacher";								// Name visible in the menu
		icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\sergeant_gs.paa";	// Icon displayed next to the name
		role = "LoneWolf";										// Optional, see CfgRoles

		weapons[] = {
			"rhs_weap_M590_5RD",
			"rhsusf_weap_glock17g4",
			"rhsusf_bino_m24"
		};
		magazines[] = {
			"rhsusf_5Rnd_00Buck",
			"rhsusf_5Rnd_00Buck",
			"rhsusf_5Rnd_00Buck",
			"rhsusf_5Rnd_Slug",
			"rhsusf_5Rnd_Slug",
			"rhsusf_5Rnd_Slug",
			"rhsusf_mag_17Rnd_9x19_JHP",
			"rhsusf_mag_17Rnd_9x19_JHP",
			"rhs_mag_an_m14_th3",
			//"rhs_charge_tnt_x2_mag",
			"SmokeShellGreen"
		};
		items[] = {
			//"DemoCharge_Remote_Mag",
			"rhs_charge_M2tet_x2_mag",
			"ACE_DefusalKit",
			"ACE_DeadManSwitch",
			"ACE_M26_Clacker",
			"ACE_Clacker",
			"ACE_Flashlight_MX991",
			"ACE_fieldDressing",
			"ACE_fieldDressing",
			"ACE_fieldDressing",
			"ACE_fieldDressing",
			"ACE_bloodIV_250",
			"ACE_EarPlugs",
			"ACE_morphine",
			"ACE_Can_Spirit",
			"ACE_MRE_ChickenTikkaMasala",
			"ACE_splint",
			"ACE_tourniquet",
			"ACE_plasmaIV_250"
		};
		linkedItems[] = {
			"Marpat_MBSS_PACA",
			"MarPat_Helmet2",
			"rhsusf_ANPVS_14",
			"ItemMap",
			"ItemCompass",
			"ChemicalDetector_01_watch_F",
			"ItemRadio",
			"rhsusf_ANPVS_14"
		};
		uniformClass = "MarPat_Camo_Cyre_GS";
		//backpack = "B_AssaultPack_rgr";
	};
	class IND_Assault
	{
		displayName = "5-Assault A";							// Name visible in the menu
		icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\sergeant_gs.paa";	// Icon displayed next to the name
		role = "LoneWolf";										// Optional, see CfgRoles

		weapons[] = {
			"rhs_weap_hk416d10_LMT",
			"Binocular"
		};
		magazines[] = {
			"ACE_30Rnd_556x45_Stanag_Mk318_mag",
			"ACE_30Rnd_556x45_Stanag_Mk318_mag",
			"ACE_30Rnd_556x45_Stanag_Mk318_mag",
			"ACE_30Rnd_556x45_Stanag_Mk318_mag",
			"rhs_mag_an_m14_th3",
			"rhs_mag_m67",
			"rhs_mag_m67",
			"rhs_mag_m67",
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
			"rhsusf_acc_anpeq15_wmx_light",
			"rhsusf_acc_compm4",
			"DualTex_Vest_2",
			"DualTex_Helmet2",
			"ItemMap",
			"ItemCompass",
			"ItemWatch",
			"ItemRadio",
			"rhsusf_ANPVS_14"
		};
		uniformClass = "DualTex_Camo_Cyre";
		//backpack = "B_AssaultPack_rgr";
	};
	class IND_Assault2
	{
		displayName = "5-Assault B";							// Name visible in the menu
		icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\sergeant_gs.paa";	// Icon displayed next to the name
		role = "LoneWolf";										// Optional, see CfgRoles

		weapons[] = {
			"rhs_weap_mk17_CQC",
			"hgun_Pistol_heavy_01_F",
			"Binocular"
		};
		magazines[] = {
			"rhs_mag_20Rnd_SCAR_762x51_m80_ball",
			"rhs_mag_20Rnd_SCAR_762x51_m80_ball",
			"rhs_mag_20Rnd_SCAR_762x51_m80_ball",
			"rhs_mag_20Rnd_SCAR_762x51_m80_ball",
			"rhs_mag_an_m14_th3",
			"11Rnd_45ACP_Mag",
			"rhs_mag_m67",
			"rhs_mag_m67",
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
			"acc_flashlight",
			"acc_flashlight_pistol",
			"Scorpion_Vest_2",
			"Scorpion_Helmet2",
			"ItemMap",
			"ItemCompass",
			"ItemWatch",
			"ItemRadio",
			"rhsusf_ANPVS_14"
		};
		uniformClass = "Scorpion_Camo_Cyre";
		//backpack = "B_AssaultPack_rgr";
	};
	class IND_Marksman
	{
		displayName = "6-Marksman A";							// Name visible in the menu
		icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\sergeant_gs.paa";	// Icon displayed next to the name
		role = "LoneWolf";										// Optional, see CfgRoles

		weapons[] = {
			"rhs_weap_m14_rail",
			"rhs_weap_type94_new",
			"Rangefinder"
		};
		magazines[] = {
			"rhsusf_20Rnd_762x51_m80_Mag",
			"rhsusf_20Rnd_762x51_m80_Mag",
			"rhsusf_20Rnd_762x51_m80_Mag",
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
			"Scorpion_Vest_2",
			"Scorpion_Helmet2",
			"rhsusf_acc_ACOG",
			//"hlc_muzzle_Evo9",
			"acc_flashlight_pistol",
			"ItemMap",
			"ItemCompass",
			"ItemWatch",
			"ItemRadio",
			"rhsusf_ANPVS_14"
		};
		uniformClass = "rhsgref_uniform_gorka_1_f";
		//backpack = "B_AssaultPack_rgr";
	};
	class IND_Marksman2
	{
		displayName = "6-Marksman B";							// Name visible in the menu
		icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\sergeant_gs.paa";	// Icon displayed next to the name
		role = "LoneWolf";										// Optional, see CfgRoles

		weapons[] = {
			"rhs_weap_m76",
			"rhs_weap_type94_new",
			"Rangefinder"
		};
		magazines[] = {
			"rhsgref_10Rnd_792x57_m76",
			"rhsgref_10Rnd_792x57_m76",
			"rhsgref_10Rnd_792x57_m76",
			"rhsgref_10Rnd_792x57_m76",
			"rhsgref_10Rnd_792x57_m76",
			"rhsgref_10Rnd_792x57_m76",
			"rhsgref_10Rnd_792x57_m76",
			"rhsgref_10Rnd_792x57_m76",
			"rhsgref_10Rnd_792x57_m76",
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
			"rhsusf_shemagh2_grn",
			"Project_Honor_Vest_2",
			"Project_Honor_Helmet2",
			"rhs_acc_pso1m21",
			//"hlc_muzzle_Evo9",
			"acc_flashlight_pistol",
			"ItemMap",
			"ItemCompass",
			"ItemWatch",
			"ItemRadio",
			"rhsusf_ANPVS_14"
		};
		uniformClass = "Project_Honor_Camo_Cyre";
		//backpack = "B_AssaultPack_rgr";
	};
	class IND_Sniper
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
			"ItemMap",
			"ItemCompass",
			"ItemWatch",
			"ItemRadio",
			"rhsusf_ANPVS_14"
		};
		uniformClass = "Tiger_Camo_Cyre";
		//backpack = "B_AssaultPack_rgr";
	};
	class IND_MG
	{
		displayName = "8-MachineGunner";									// Name visible in the menu
		icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\sergeant_gs.paa";	// Icon displayed next to the name
		role = "LoneWolf";											// Optional, see CfgRoles

		weapons[] = {
			"rhs_weap_fnmag",
			"hgun_Pistol_heavy_01_F",
			"Binocular"
		};
		magazines[] = {
			"rhsusf_100Rnd_762x51_m62_tracer",
			"rhsusf_100Rnd_762x51_m62_tracer",
			"11Rnd_45ACP_Mag",
			"11Rnd_45ACP_Mag",
			"rhs_mag_m67",
			"rhs_mag_m67",
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
			"V_PlateCarrier2_rgr_noflag_F",
			"M81_Helmet1",
			"ItemMap",
			"ItemCompass",
			"ItemWatch",
			"ItemRadio",
			"rhsusf_ANPVS_14"
		};
		uniformClass = "M81_Camo_crye";
		//backpack = "B_AssaultPack_mcamo";
	};
	class IND_Pilot
	{
		displayName = "9-Pilot";							// Name visible in the menu
		icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\sergeant_gs.paa";	// Icon displayed next to the name
		role = "LoneWolf";										// Optional, see CfgRoles

		weapons[] = {
			"rhsusf_weap_MP7A2_folded",
			"rhsusf_bino_lrf_Vector21"
		};
		magazines[] = {
			"rhsusf_mag_40Rnd_46x30_FMJ",
			"rhsusf_mag_40Rnd_46x30_FMJ",
			"rhs_mag_an_m14_th3",
			"SmokeShellGreen",
			"SmokeShellGreen"
		};
		items[] = {
			"UH60_jvmf_tablet",
			"rhsusf_ANPVS_14", //remove the helmet if "linkedItems"
			"ACE_microDAGR",
			"ACE_Flashlight_MX991",
			"ACE_fieldDressing",
			"ACE_fieldDressing",
			"ACE_fieldDressing",
			"ACE_fieldDressing",
			"ACE_bloodIV_250",
			"ACE_EarPlugs",
			"ACE_morphine",
			"ACE_Can_Spirit",
			"ACE_MRE_ChickenTikkaMasala",
			"ACE_splint",
			"ACE_tourniquet",
			"ACE_plasmaIV_250"
		};
		linkedItems[] = {
			"ACE_Altimeter",
			"rhsusf_acc_wmx_bk",
			"rhsusf_ihadss",
			"rhsusf_acc_eotech_xps3",
			"OGA_G_Vest_3",
			"ItemMap",
			"ItemCompass",
			//"rhs_radio_R187P1" //Infantry program Radio //too easy
			"rhsusf_radio_anprc152" //will be used for some advanced functions like "call for extraction"
		};
		uniformClass = "OGA_Camo_Cyre_Green";
		//backpack = "B_AssaultPack_rgr";
	};
	class IND_GI
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
	};
};
