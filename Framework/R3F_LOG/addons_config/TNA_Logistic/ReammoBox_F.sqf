R3F_LOG_CFG_can_tow = R3F_LOG_CFG_can_tow +
[
];

R3F_LOG_CFG_can_be_towed = R3F_LOG_CFG_can_be_towed +
[
];

R3F_LOG_CFG_can_lift = R3F_LOG_CFG_can_lift +
[
];

R3F_LOG_CFG_can_be_lifted = R3F_LOG_CFG_can_be_lifted +
[
	//"box_nato_ammoveh_f"
];

R3F_LOG_CFG_can_transport_cargo = R3F_LOG_CFG_can_transport_cargo +
[
	//["box_nato_ammoveh_f", 14]
];

R3F_LOG_CFG_can_be_transported_cargo = R3F_LOG_CFG_can_be_transported_cargo +
[
	["Box_East_AmmoVeh_F",15],
	["Box_NATO_AmmoVeh_F",15],
	["I_SupplyCrate_F",10], //mission crate L
	//["B_SupplyCrate_F",10], //B_supplyCrate_F if above the IDAP crate, it will be removed from logistic/moving system [R3F]
	["C_IDAP_CargoNet_01_supplies_F",10],
	["O_CargoNet_01_ammo_F",15],
	["B_CargoNet_01_ammo_F",15], //mission crate XL
	["I_CargoNet_01_ammo_F",15],
	["Box_NATO_Wps_F",5],
	["Box_FIA_Wps_F",10], //not in igiload yet
	["Box_FIA_Support_F",5],
	["Box_T_East_Wps_F",5]
];

R3F_LOG_CFG_can_be_moved_by_player = R3F_LOG_CFG_can_be_moved_by_player +
[
	/*"Box_Syndicate_WpsLaunch_F",
	"Box_Syndicate_Wps_F",
	"Box_Syndicate_Ammo_F",*/
	"Box_East_AmmoVeh_F",
	"Box_NATO_AmmoVeh_F",
	"I_SupplyCrate_F",
	//"B_SupplyCrate_F",//B_supplyCrate_F if above the IDAP crate, it will be removed from logistic/moving system [R3F]
	"C_IDAP_CargoNet_01_supplies_F",
	"O_CargoNet_01_ammo_F",
	"B_CargoNet_01_ammo_F",
	"I_CargoNet_01_ammo_F",
	"Box_NATO_Wps_F",
	"Box_FIA_Wps_F", //not in igiload yet
	"Box_FIA_Support_F",
	"Box_T_East_Wps_F"
];