/**
 * VehiclesCategories
 *
 * TNA-Community
 * https://discord.gg/Zs23URtjwF
 * © 2021 {|||TNA|||}WAKeupneo
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
	//'notyet','weapons','equipement','office','accessories','vehiclesarmed','vehiclesunarmed','airarmed','airunarmed'
	class VehiclesUnarmed
	{
		name = "Chopper";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemacc_ca.paa";
		items[] = 
		{
			
			"R3F_KAMAZ_CE_trans",
			"R3F_KAMAZ_CE_VPC",
			"R3F_KAMAZ_CE_MEDEVAC",
			"R3F_KAMAZ_CE_FUEL",
			
	        "B_Truck_01_mover_F",
	        "B_Truck_01_cargo_F",
	        "B_Truck_01_transport_F",
	        "UK3CB_BAF_LandRover_Soft_Green_A",
	        "UK3CB_BAF_MAN_HX60_Cargo_Green_A",
	        "B_T_LSV_01_unarmed_F",
			"B_LSV_01_unarmed_black_F", //custom loadable 
	        "R3F_FENNEC_CE",
	        "R3F_MATV_CE",
			"rhsusf_m1152_usarmy_wd", //armored humvee 2dr
	        "rhsusf_m1025_w",
	        "rhsusf_m998_w_4dr",
			"rhsusf_m998_w_2dr_halftop",
	        "rhsusf_m1151_usarmy_wd",
	        "rhsusf_M1232_usarmy_wd",
	        //"rhsusf_M1078A1P2_WD_fmtv_usarmy",
	        //"rhsusf_M1083A1P2_WD_fmtv_usarmy",
			"rhsusf_M1078A1P2_WD_open_fmtv_usarmy", //igiload
			"rhsusf_M1083A1P2_WD_open_fmtv_usarmy", //igiload
			"rhsusf_M1084A1P2_WD_fmtv_usarmy", //igiload
	        "rhsusf_M1084A1P2_B_WD_fmtv_usarmy",
	        "rhsusf_mrzr4_w_mud",
	        "rhsusf_M1238A1_socom_wd",
	        "rhsusf_M1239_socom_wd",
	        "rhsgref_un_uaz",
	        "rhsgref_un_zil131",
	        "I_G_Offroad_01_F",
	        "I_G_Van_01_transport_F",
			"C_Van_01_box_F",
	        "I_E_Truck_02_transport_F",
	        "rhsgref_nat_ural",
	        "rhsgref_nat_ural_open",
	        "I_C_Offroad_02_unarmed_F",
	        "rhsusf_m113_usarmy_unarmed",
	        "O_MRAP_02_F",
	        "O_LSV_02_unarmed_F",
			"O_LSV_02_unarmed_black_F", //transportable cargo chopper
	        "O_Truck_03_transport_F",
	        "O_G_Van_01_transport_F",
	        "rhs_tigr_vdv",
	        "rhs_tigr_m_vdv",
	        "rhsgref_BRDM2UM_vdv",
			"O_APC_Wheeled_02_rcws_v2_F",//FORCED UNARMED
	        "R3F_PANDUR_CE",//FORCED UNARMED
			"B_APC_Tracked_01_CRV_F" //FORCED UNARMED
		};
	};
	class VehiclesUnarmed_GM
	{
		name = "GND Unarmed GM";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemacc_ca.paa";
		items[] = 
		{
			"gm_ge_army_k125",
			"gm_ge_army_iltis_cargo",
			"gm_ge_civ_u1300l",
			"gm_ge_army_u1300l_firefighter",
			"gm_ge_army_u1300l_medic",
			"gm_pl_army_ural4320_cargo",
			"gm_gc_ff_p601", //zastava kind of car
			"gm_ge_ff_typ1200", //cox
			//regular non-GM:
			//MEDICAL FACILITIES
			"I_UGV_01_F",
			//"C_IDAP_UGV_01_F",
			"C_IDAP_Van_02_medevac_F",
			"C_IDAP_Offroad_02_unarmed_F",
			"C_IDAP_Offroad_01_F",
			"C_IDAP_Van_02_vehicle_F",
			"C_IDAP_Van_02_transport_F",
			"C_IDAP_Truck_02_transport_F",
			"C_IDAP_Truck_02_F",
			//
			"rhsgref_tla_g_kraz255b1_cargo_open",
			"rhs_kamaz5350_flatbed_cover_vdv", //flatbed cover
			"RHS_Ural_Flat_VDV_01", //flatbed cover
			"rhs_gaz66_flat_vdv", //flatbed cover
			"O_T_Truck_03_ammo_ghex_F", //ammo
			"rhs_kamaz5350_ammo_vdv", ///ammo
			"B_Quadbike_01_F",
			"rhsusf_m113_usarmy_medical",
	        "B_Truck_01_mover_F",
	        "B_Truck_01_cargo_F",
	        "B_Truck_01_transport_F",
	        "B_T_LSV_01_unarmed_F",
			"B_LSV_01_unarmed_black_F", //custom loadable 
			"rhsusf_m1152_usarmy_wd", //armored humvee 2dr
	        "rhsusf_m1025_w",
	        "rhsusf_m998_w_4dr",
			"rhsusf_m998_w_2dr_halftop",
	        "rhsusf_m1151_usarmy_wd",
	        "rhsusf_M1232_usarmy_wd",
	        //"rhsusf_M1078A1P2_WD_fmtv_usarmy",
	        //"rhsusf_M1083A1P2_WD_fmtv_usarmy",
			"rhsusf_M1078A1P2_WD_open_fmtv_usarmy", //igiload
			"rhsusf_M1083A1P2_WD_open_fmtv_usarmy", //igiload
			"rhsusf_M1084A1P2_WD_fmtv_usarmy", //igiload
	        "rhsusf_M1084A1P2_B_WD_fmtv_usarmy",
	        "rhsusf_mrzr4_w_mud",
	        "rhsusf_M1238A1_socom_wd",
	        "rhsusf_M1239_socom_wd",
	        "rhsgref_un_uaz",
	        "rhsgref_un_zil131",
	        "I_G_Offroad_01_F",
	        "I_G_Van_01_transport_F",
			"C_Van_01_box_F",
	        "I_E_Truck_02_transport_F",
	        "rhsgref_nat_ural",
	        "rhsgref_nat_ural_open",
	        "I_C_Offroad_02_unarmed_F",
	        "rhsusf_m113_usarmy_unarmed",
	        "O_MRAP_02_F",
	        "O_LSV_02_unarmed_F",
			"O_LSV_02_unarmed_black_F", //transportable cargo chopper
	        "O_Truck_03_transport_F",
	        "O_G_Van_01_transport_F",
	        "rhs_tigr_vdv",
	        "rhs_tigr_m_vdv",
	        "rhsgref_BRDM2UM_vdv",
			"O_APC_Wheeled_02_rcws_v2_F",//FORCED UNARMED
	       //"R3F_PANDUR_CE",//FORCED UNARMED
			"B_APC_Tracked_01_CRV_F" //FORCED UNARMED
	        
		};
	};
	class VehiclesUnarmed_RHS_Hatchet
	{
		name = "Chopper";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemacc_ca.paa";
		items[] = 
		{	
			//MEDICAL FACILITIES
			"I_UGV_01_F",
			//"C_IDAP_UGV_01_F",
			"C_IDAP_Van_02_medevac_F",
			"C_IDAP_Offroad_02_unarmed_F",
			"C_IDAP_Offroad_01_F",
			"C_IDAP_Van_02_vehicle_F",
			"C_IDAP_Van_02_transport_F",
			"C_IDAP_Truck_02_transport_F",
			"C_IDAP_Truck_02_F",
			//
			"rhsgref_tla_g_kraz255b1_cargo_open",
			"rhs_kamaz5350_flatbed_cover_vdv", //flatbed cover
			"RHS_Ural_Flat_VDV_01", //flatbed cover
			"rhs_gaz66_flat_vdv", //flatbed cover
			"O_T_Truck_03_ammo_ghex_F", //ammo
			"rhs_kamaz5350_ammo_vdv", ///ammo
			"B_Quadbike_01_F",
			"rhsusf_m113_usarmy_medical",
	        "B_Truck_01_mover_F",
	        "B_Truck_01_cargo_F",
	        "B_Truck_01_transport_F",
	        "B_T_LSV_01_unarmed_F",
			"B_LSV_01_unarmed_black_F", //custom loadable 
			"rhsusf_m1152_usarmy_wd", //armored humvee 2dr
	        "rhsusf_m1025_w",
	        "rhsusf_m998_w_4dr",
			"rhsusf_m998_w_2dr_halftop",
	        "rhsusf_m1151_usarmy_wd",
	        "rhsusf_M1232_usarmy_wd",
	        //"rhsusf_M1078A1P2_WD_fmtv_usarmy",
	        //"rhsusf_M1083A1P2_WD_fmtv_usarmy",
			"rhsusf_M1078A1P2_WD_open_fmtv_usarmy", //igiload
			"rhsusf_M1083A1P2_WD_open_fmtv_usarmy", //igiload
			"rhsusf_M1084A1P2_WD_fmtv_usarmy", //igiload
	        "rhsusf_M1084A1P2_B_WD_fmtv_usarmy",
	        "rhsusf_mrzr4_w_mud",
	        "rhsusf_M1238A1_socom_wd",
	        "rhsusf_M1239_socom_wd",
	        "rhsgref_un_uaz",
	        "rhsgref_un_zil131",
	        "I_G_Offroad_01_F",
	        "I_G_Van_01_transport_F",
			"C_Van_01_box_F",
	        "I_E_Truck_02_transport_F",
	        "rhsgref_nat_ural",
	        "rhsgref_nat_ural_open",
	        "I_C_Offroad_02_unarmed_F",
	        "rhsusf_m113_usarmy_unarmed",
	        "O_MRAP_02_F",
	        "O_LSV_02_unarmed_F",
			"O_LSV_02_unarmed_black_F", //transportable cargo chopper
	        "O_Truck_03_transport_F",
	        "O_G_Van_01_transport_F",
	        "rhs_tigr_vdv",
	        "rhs_tigr_m_vdv",
	        "rhsgref_BRDM2UM_vdv",
			"O_APC_Wheeled_02_rcws_v2_F",//FORCED UNARMED
	       //"R3F_PANDUR_CE",//FORCED UNARMED
			"B_APC_Tracked_01_CRV_F" //FORCED UNARMED
		};
	};

	class VehiclesArmed
	{
		name = "VehiclesArmed";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemacc_ca.paa";
		items[] = 
		{
			//RCWS
			"B_MRAP_01_gmg_F",
			"B_MRAP_01_hmg_F",
			//"B_T_MRAP_01_gmg_F",
			//"B_T_MRAP_01_hmg_F",
			//"O_MRAP_02_gmg_F",
			//"O_MRAP_02_hmg_F",
			"O_T_MRAP_02_gmg_ghex_F",
			"O_T_MRAP_02_hmg_ghex_F",
			"I_MRAP_03_gmg_F",
			"I_MRAP_03_hmg_F",
			//
	        "BWA3_Puma_Fleck",
	        "BWA3_Eagle_FLW100_Fleck",
	        "BWA3_Dingo2_FLW100_MG3_CG13_Fleck",
	        "BWA3_Leopard2_Fleck",
	        "rhsgref_cdf_b_reg_uaz_dshkm",
	        "rhsgref_cdf_b_reg_uaz_spg9",
	        "rhsgref_cdf_b_bmd1k",
	        "rhsgref_cdf_b_bmd2",
	        "rhsgref_cdf_b_gaz66_zu23",
	        "B_G_Offroad_01_armed_F",
	        "B_G_Offroad_01_AT_F",
	        "rhsgref_hidf_m113a3_m2",
	        "rhsgref_hidf_m1025_m2",
	        "UK3CB_BAF_Coyote_Passenger_L111A1_W",
	        "UK3CB_BAF_Jackal2_L111A1_W",
	        "UK3CB_BAF_LandRover_WMIK_HMG_Green_B",
	        "B_APC_Wheeled_01_cannon_F",
			"I_APC_Wheeled_03_cannon_F",
			"B_AFV_Wheeled_01_cannon_F",
			"I_LT_01_cannon_F",
	        "rhsusf_stryker_m1127_m2_wd",
	        "rhsusf_m113_usarmy",
	        "rhsusf_m1025_w_m2",
	        "rhsusf_m1045_w",
	        "rhsusf_m1151_m2_lras3_v1_usarmy_wd",
	        "rhsusf_m1151_m2_v2_usarmy_wd",
	        "RHS_M2A2_wd",
	        "RHS_M2A3_BUSKIII_wd",
	        "rhsusf_M1237_M2_usarmy_wd",
	        "rhsusf_m1240a1_m2_usarmy_wd",
	        "rhsusf_m1240a1_m2_uik_usarmy_wd",
	        "rhsusf_m1a1aimwd_usarmy",
	        "rhsusf_m1a2sep1tuskiiwd_usarmy",
	        "rhsusf_M1078A1P2_B_M2_WD_open_fmtv_usarmy",
	        "rhsusf_M1084A1P2_B_M2_WD_fmtv_usarmy",
	        "rhsusf_CGRCAT1A2_M2_usmc_wd",
	        "I_C_Offroad_02_LMG_F",
	        "I_C_Offroad_02_AT_F",
	        "O_T_LSV_02_armed_F",
	        "rhs_btr80a_vdv",
	        "rhs_brm1k_vdv",
	        "rhs_sprut_vdv",
			"rhs_t90sm_tv", //faster turret
			"rhs_t90saa_tv",
			"rhs_t80u45m",
	        "rhs_t80bv",
	        "rhs_t72ba_tv",
	        "rhs_t72be_tv",
	        "rhs_t72bb_tv"
		};
	};
	class VehiclesArmed_GM
	{
		name = "GND Armed GM";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemacc_ca.paa";
		items[] = 
		{
	        "gm_ge_army_iltis_mg3",
	        "gm_dk_army_u1300l_container",
	        "gm_ge_army_u1300l_cargo",
			"gm_ge_army_kat1_454_cargo", //10t mg3
	        "gm_dk_army_bpz2a0",
	        "gm_ge_army_fuchsa0_command",
	        "gm_ge_army_fuchsa0_reconnaissance",
			"gm_ge_army_m113a1g_apc", //mg3
			"gm_dk_army_m113a1dk_apc", //M2 shield
			"gm_dk_army_m113a2dk",
	        "gm_ge_army_marder1a2",
			"gm_ge_army_Leopard1a1", //green
	        //"gm_ge_army_Leopard1a1a1",
	        "gm_dk_army_Leopard1a3",
			"gm_ge_army_Leopard1a3a1",
			"gm_ge_army_Leopard1a5",
			"gm_gc_army_t55ak",
			"gm_ge_army_gepard1a1", //AA
		//regular non-GM: //modified
			//RCWS
			"B_MRAP_01_gmg_F",
			"B_MRAP_01_hmg_F",
			//"B_T_MRAP_01_gmg_F",
			//"B_T_MRAP_01_hmg_F",
			//"O_MRAP_02_gmg_F",
			//"O_MRAP_02_hmg_F",
			"O_T_MRAP_02_gmg_ghex_F",
			"O_T_MRAP_02_hmg_ghex_F",
			"I_MRAP_03_gmg_F",
			"I_MRAP_03_hmg_F",
			"O_T_APC_Wheeled_02_rcws_v2_ghex_F",
			//CROWS
			"rhsusf_M1239_M2_Deploy_socom_d",
			"rhsusf_M1239_MK19_Deploy_socom_d",
			"rhsusf_M1239_M2_socom_d",
			"rhsusf_M1239_MK19_socom_d",
			"rhsusf_M1238A1_M2_socom_d",
			"rhsusf_M1238A1_Mk19_socom_d",
			"rhsusf_m1165a1_gmv_m134d_m240_socom_d",
			//"rhsusf_m1165a1_gmv_m2_m240_socom_d",
			//"rhsusf_m1165a1_gmv_mk19_m240_socom_d",
			//
			"RHS_M119_WD", //Old Arti canon, need to ad to R3f Log
			"rhsgref_cdf_reg_d30", //Old Arti canon, need to ad to R3f Log
			"rhsgref_cdf_2s1", //Old Arti Tank
			"rhsusf_m113_usarmy_supply", //ammo
	        "rhsgref_cdf_b_reg_uaz_dshkm",
	        "rhsgref_cdf_b_reg_uaz_spg9",
	        "rhsgref_cdf_b_bmd1k",
			"rhsgref_cdf_bmd1pk",
	        "rhsgref_cdf_b_bmd2",
	        "rhsgref_cdf_b_gaz66_zu23",
	        "B_G_Offroad_01_armed_F",
	        "B_G_Offroad_01_AT_F",
	        "rhsgref_hidf_m113a3_m2",
	        "rhsgref_hidf_m1025_m2",
	        "B_APC_Wheeled_01_cannon_F",
			"I_APC_Wheeled_03_cannon_F",
			"B_AFV_Wheeled_01_cannon_F",
			"I_LT_01_cannon_F",
	        "rhsusf_stryker_m1127_m2_wd",
	        "rhsusf_m113_usarmy",
	        "rhsusf_m1025_w_m2",
	        "rhsusf_m1045_w",
	        "rhsusf_m1151_m2_lras3_v1_usarmy_wd",
	        "rhsusf_m1151_m2_v2_usarmy_wd",
	        "RHS_M2A2_wd",
	        "RHS_M2A3_BUSKIII_wd",
	        "rhsusf_M1237_M2_usarmy_wd",
	        "rhsusf_m1240a1_m2_usarmy_wd",
	        "rhsusf_m1240a1_m2_uik_usarmy_wd",
	        "rhsusf_m1a1aimwd_usarmy",
	        "rhsusf_m1a2sep1tuskiiwd_usarmy",
	        "rhsusf_M1078A1P2_B_M2_WD_open_fmtv_usarmy",
	        "rhsusf_M1084A1P2_B_M2_WD_fmtv_usarmy",
	        "rhsusf_CGRCAT1A2_M2_usmc_wd",
	        "I_C_Offroad_02_LMG_F",
	        "I_C_Offroad_02_AT_F",
	        "O_T_LSV_02_armed_F",
	        "rhs_btr80a_vdv",
	        "rhs_brm1k_vdv",
	        "rhs_sprut_vdv",
			"rhs_t90sm_tv", //faster turret
			"rhs_t90saa_tv",
			"rhs_t80u45m",
	        "rhs_t80bv",
	        "rhs_t72ba_tv",
	        "rhs_t72be_tv",
	        "rhs_t72bb_tv"
		};
	};
	class VehiclesArmed_RHS_Hatchet
	{
		name = "VehiclesArmed";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemacc_ca.paa";
		items[] = 
		{
			//RCWS
			"B_MRAP_01_gmg_F",
			"B_MRAP_01_hmg_F",
			//"B_T_MRAP_01_gmg_F",
			//"B_T_MRAP_01_hmg_F",
			//"O_MRAP_02_gmg_F",
			//"O_MRAP_02_hmg_F",
			"O_T_MRAP_02_gmg_ghex_F",
			"O_T_MRAP_02_hmg_ghex_F",
			"I_MRAP_03_gmg_F",
			"I_MRAP_03_hmg_F",
			"O_T_APC_Wheeled_02_rcws_v2_ghex_F",
			//CROWS
			"rhsusf_M1239_M2_Deploy_socom_d",
			"rhsusf_M1239_MK19_Deploy_socom_d",
			"rhsusf_M1239_M2_socom_d",
			"rhsusf_M1239_MK19_socom_d",
			"rhsusf_M1238A1_M2_socom_d",
			"rhsusf_M1238A1_Mk19_socom_d",
			"rhsusf_m1165a1_gmv_m134d_m240_socom_d",
			//"rhsusf_m1165a1_gmv_m2_m240_socom_d",
			//"rhsusf_m1165a1_gmv_mk19_m240_socom_d",
			//
			"RHS_M119_WD", //Old Arti canon, need to ad to R3f Log
			"rhsgref_cdf_reg_d30", //Old Arti canon, need to ad to R3f Log
			"rhsgref_cdf_2s1", //Old Arti Tank
			"rhsusf_m113_usarmy_supply", //ammo
	        "rhsgref_cdf_b_reg_uaz_dshkm",
	        "rhsgref_cdf_b_reg_uaz_spg9",
	        "rhsgref_cdf_b_bmd1k",
			"rhsgref_cdf_bmd1pk",
	        "rhsgref_cdf_b_bmd2",
	        "rhsgref_cdf_b_gaz66_zu23",
	        "B_G_Offroad_01_armed_F",
	        "B_G_Offroad_01_AT_F",
	        "rhsgref_hidf_m113a3_m2",
	        "rhsgref_hidf_m1025_m2",
	        "B_APC_Wheeled_01_cannon_F",
			"I_APC_Wheeled_03_cannon_F",
			"B_AFV_Wheeled_01_cannon_F",
			"I_LT_01_cannon_F",
	        "rhsusf_stryker_m1127_m2_wd",
	        "rhsusf_m113_usarmy",
	        "rhsusf_m1025_w_m2",
	        "rhsusf_m1045_w",
	        "rhsusf_m1151_m2_lras3_v1_usarmy_wd",
	        "rhsusf_m1151_m2_v2_usarmy_wd",
	        "RHS_M2A2_wd",
	        "RHS_M2A3_BUSKIII_wd",
	        "rhsusf_M1237_M2_usarmy_wd",
	        "rhsusf_m1240a1_m2_usarmy_wd",
	        "rhsusf_m1240a1_m2_uik_usarmy_wd",
	        "rhsusf_m1a1aimwd_usarmy",
	        "rhsusf_m1a2sep1tuskiiwd_usarmy",
	        "rhsusf_M1078A1P2_B_M2_WD_open_fmtv_usarmy",
	        "rhsusf_M1084A1P2_B_M2_WD_fmtv_usarmy",
	        "rhsusf_CGRCAT1A2_M2_usmc_wd",
	        "I_C_Offroad_02_LMG_F",
	        "I_C_Offroad_02_AT_F",
	        "O_T_LSV_02_armed_F",
	        "rhs_btr80a_vdv",
	        "rhs_brm1k_vdv",
	        "rhs_sprut_vdv",
			"rhs_t90sm_tv", //faster turret
			"rhs_t90saa_tv",
			"rhs_t80u45m",
	        "rhs_t80bv",
	        "rhs_t72ba_tv",
	        "rhs_t72be_tv",
	        "rhs_t72bb_tv"
		};
	};

	class airUnarmed
	{
		name = "Chopper";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemacc_ca.paa";
		items[] = 
		{
			"rhsgred_hidf_cessna_o3a",
			"B_T_VTOL_01_vehicle_F",
	        "rhs_uh1h_hidf_unarmed",
	        "UK3CB_BAF_Merlin_HC3_Cargo",
	        "UK3CB_BAF_Merlin_HM2_18",
	        "RHS_UH60M2",
	        "RHS_MELB_MH6M",
	        "RHS_UH1Y_UNARMED",
	        "B_Heli_Transport_03_unarmed_F",
	        "I_Heli_light_03_unarmed_F",
	        "rhsgref_cdf_reg_Mi8amt",
	        "C_Heli_Light_01_civil_F",
	        "C_IDAP_Heli_Transport_02_F",
	        "RHS_Mi8t_civilian",
	        "O_Heli_Transport_04_F",
	        "O_Heli_Transport_04_bench_F",
	        "O_Heli_Transport_04_box_F",
	        "RHS_Mi8mt_Cargo_vvs",
	        "O_Heli_Light_02_unarmed_F"
		};
	};

	class airUnarmed_GM
	{
		name = "Chopper GM";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemacc_ca.paa";
		items[] = 
		{
			"gm_ge_adak_bo105m_vbh",
			"gm_gc_civ_mi2sr",
			"gm_ge_army_bo105m_vbh",
			"gm_ge_army_bo105p1m_vbh",
			"gm_gc_airforce_l410t", //plane
			//"gm_ge_airforce_do28d2" //plane
			
			//regular non-GM: //modified
			"vtx_UH60M_MEDEVAC",
			"vtx_UH60M_SLICK",
			"rhsgred_hidf_cessna_o3a",
			"B_T_VTOL_01_vehicle_F",
	        "rhs_uh1h_hidf_unarmed",
	        "RHS_UH60M2",
	        "RHS_MELB_MH6M",
	        "RHS_UH1Y_UNARMED",
	        "B_Heli_Transport_03_unarmed_F",
	        "I_Heli_light_03_unarmed_F",
	        "rhsgref_cdf_reg_Mi8amt",
	        "C_Heli_Light_01_civil_F",
	        "C_IDAP_Heli_Transport_02_F",
	        "RHS_Mi8t_civilian",
	        "RHS_Mi8mt_Cargo_vvs",
	        "O_Heli_Light_02_unarmed_F",
			"RHS_C130J_Cargo"
		};
	};

	class airUnarmed_RHS_Hatchet
	{
		name = "Chopper_RHS_Hatchet";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemacc_ca.paa";
		items[] = 
		{
			//"O_Heli_Transport_04_medevac_black_F", //Taru is broken
			//"O_Heli_Transport_04_repair_black_F",
			//"O_Heli_Transport_04_ammo_black_F",
			//"O_Heli_Transport_04_fuel_black_F",
	       	//"O_Heli_Transport_04_F",
	       	//"O_Heli_Transport_04_bench_F",
	        //"O_Heli_Transport_04_box_F",
			"vtx_UH60M_MEDEVAC",
			"vtx_UH60M_SLICK",
			"rhsgred_hidf_cessna_o3a",
			"B_T_VTOL_01_vehicle_F",
	        "rhs_uh1h_hidf_unarmed",
	        "RHS_UH60M2",
	        "RHS_MELB_MH6M",
	        "RHS_UH1Y_UNARMED",
	        "B_Heli_Transport_03_unarmed_F",
	        "I_Heli_light_03_unarmed_F",
	        "rhsgref_cdf_reg_Mi8amt",
	        "C_Heli_Light_01_civil_F",
	        "C_IDAP_Heli_Transport_02_F",
	        "RHS_Mi8t_civilian",
	        "RHS_Mi8mt_Cargo_vvs",
	        "O_Heli_Light_02_unarmed_F",
			"RHS_C130J_Cargo"
		};
	};

	class airArmed
	{
		name = "Chopper";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemacc_ca.paa";
		items[] = 
		{
			"RHSGREF_A29B_HIDF", //super Tucano
			"RHS_A10",
			"rhs_l159_cdf_b_CDF",
			"rhs_l39_cdf_b_cdf",

			"RHS_MELB_AH6M_M",
	        "BWA3_Tiger_RMK_Universal",
	        "rhsgref_b_mi24g_CAS",
			"rhs_uh1h_hidf_gunship",
	        "rhsgref_cdf_b_reg_Mi17Sh",
	        "rhs_uh1h_hidf",
	        "B_Heli_Light_01_dynamicLoadout_F",
	        "B_Heli_Transport_03_F",
	        "UK3CB_BAF_Merlin_HC4_18_GPMG",
	        "UK3CB_BAF_Wildcat_AH1_HEL_8A",
	        "UK3CB_BAF_Wildcat_AH1_CAS_8D",
	        "R3F_AH6_CE_ARMED",
	        "RHS_CH_47F",
	        "RHS_CH_47F_cargo",
	        "RHS_UH60M",
	        "RHS_MELB_AH6M",
	        "RHS_AH1Z_wd",
	        "RHS_UH1Y",
	        "rhsgref_cdf_Mi35",
	        "I_E_Heli_light_03_dynamicLoadout_F",
	        "RHS_Ka52_vvsc",
	        "rhs_mi28n_vvs",
			"rhs_mi28n_s13_vvsc",
	        "RHS_Mi24P_vvsc",
			"RHS_AH64D_wd",
	        "B_Heli_Attack_01_dynamicLoadout_F"
		};
	};

	class airArmed_GM
	{
		name = "Armed Chopper GM";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemacc_ca.paa";
		items[] = 
		{
			"gm_ge_army_bo105p_pah1a1",
			"gm_gc_bgs_mi2us",
			"gm_gc_airforce_mi2urn",
			//regular non-GM: //modified
			"vtx_HH60",
			"vtx_UH60M",
			"vtx_MH60M",
			"vtx_MH60M_DAP",
			"vtx_MH60M_DAP_MLASS",
			//"vtx_MH60S", //REMOVED BY HATCHET
			//"vtx_MH60S_GAU21L", //REMOVED BY HATCHET
			//"vtx_MH60S_Pylons", //REMOVED BY HATCHET
			"O_Heli_Light_02_dynamicLoadout_F",
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
	        "I_E_Heli_light_03_dynamicLoadout_F",
			"RHS_Su25SM_CAS_vvs",
	        "RHS_Ka52_vvsc",
	        "rhs_mi28n_vvs",
			"rhs_mi28n_s13_vvsc",
	        "RHS_Mi24P_vvsc",
			"RHS_AH64D_wd",
	        "B_Heli_Attack_01_dynamicLoadout_F",

			"B_Heli_Transport_01_F",
			"B_CTRG_Heli_Transport_01_tropic_F",
	        "rhs_uh1h_hidf",
	        "B_Heli_Light_01_dynamicLoadout_F",
	        "B_Heli_Transport_03_F",
	        "RHS_CH_47F",
	        "RHS_CH_47F_cargo",
	        "RHS_UH60M",
	        "RHS_UH1Y"
		};
	};

	class airArmed_RHS_Hatchet
	{
		name = "Armed Chopper_RHS_Hatchet";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemacc_ca.paa";
		items[] = 
		{
			"vtx_HH60",
			"vtx_UH60M",
			"vtx_MH60M",
			"vtx_MH60M_DAP",
			"vtx_MH60M_DAP_MLASS",
			//"vtx_MH60S", //REMOVED BY HATCHET
			//"vtx_MH60S_GAU21L", //REMOVED BY HATCHET
			//"vtx_MH60S_Pylons", //REMOVED BY HATCHET
			"O_Heli_Light_02_dynamicLoadout_F",
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
	        "I_E_Heli_light_03_dynamicLoadout_F",
			"RHS_Su25SM_CAS_vvs",
	        "RHS_Ka52_vvsc",
	        "rhs_mi28n_vvs",
			"rhs_mi28n_s13_vvsc",
	        "RHS_Mi24P_vvsc",
			"RHS_AH64D_wd",
	        "B_Heli_Attack_01_dynamicLoadout_F",

			"B_Heli_Transport_01_F",
			"B_CTRG_Heli_Transport_01_tropic_F",
	        "rhs_uh1h_hidf",
	        "B_Heli_Light_01_dynamicLoadout_F",
	        "B_Heli_Transport_03_F",
	        "RHS_CH_47F",
	        "RHS_CH_47F_cargo",
	        "RHS_UH60M",
	        "RHS_UH1Y"
		};
	};

	class freakingBoats
	{
		name = "Boats";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemacc_ca.paa";
		items[] = 
		{
			"B_Boat_Transport_01_F",
			"B_Lifeboat",
			"B_Boat_Armed_01_minigun_F",
			"I_Boat_Transport_01_F",
			"I_C_Boat_Transport_02_F"
		};
	};

	class freakingBoats_RHS
	{
		name = "Boats";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemacc_ca.paa";
		items[] = 
		{
			//"rhs_pontoon_float"
			"B_Boat_Transport_01_F",
			"B_Lifeboat",
			"B_Boat_Armed_01_minigun_F",
			"rhsgref_hidf_canoe",
			"rhsusf_mkvsoc",
			"I_Boat_Transport_01_F",
			"I_C_Boat_Transport_02_F"
		};
	};
