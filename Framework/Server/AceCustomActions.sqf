//
/*private _action0 = ["SafetyPerimeter", "Activate Safety Perimeter, 5k", "", {
		[(_this select 0), (_this select 1)]remoteExec ["WMS_fnc_BaseSafetyPerimeter", 2]
	},{
		true
		//(((_this select 0) getVariable ['layout', 'nope']) == 'logisticpod') && 
		//{(_this select 0) getVariable ['canSafetyPerimeter', true]}
	}
	] call ace_interact_menu_fnc_createAction; //(_this select 0) say3d 'GetToTheChoppa';
["rhsgref_serhat_radar", 0, ["ACE_MainActions"], _action0, true] call ace_interact_menu_fnc_addActionToClass;*/ //DO NOT WORK

//full food&drink on fridges
private _action0 = ["FridgeFoodAndDrink", "Eat And Drink", "", {
		(_this select 1)setVariable ["acex_field_rations_hunger", 0, true];
		(_this select 1)setVariable ["acex_field_rations_thirst", 0, true];
		(_this select 1)setVariable ["WMS_hungryDude", false, true];
	},{
		(_this select 1)getVariable ["WMS_hungryDude", true]
	}
	] call ace_interact_menu_fnc_createAction;
["Fridge_01_closed_F", 0, ["ACE_MainActions"], _action0, true] call ace_interact_menu_fnc_addActionToClass;
//[this, 0, ["ACE_MainActions"], _action0, true] call ace_interact_menu_fnc_addActionToObject;

//Cover H-60 with camonet
private _action1 = ["CoverHatchet", "Cover H-60", "", {
		[(_this select 0)]remoteExec ["WMS_fnc_HatchetCover", 2]
	},{
		(_this select 0)getVariable ["WMS_HatchetCover", true] && 
		{!(isEngineOn (_this select 0))} && 
		{(speed (_this select 0)) == 0} &&
		{(owner (_this select 0)) == (owner (_this select 1))} &&
		{locked (_this select 0) == 0}
	}
	] call ace_interact_menu_fnc_createAction; //(_this select 0) say3d 'GetToTheChoppa';
["vtx_H60_base", 0, ["ACE_MainActions"], _action1, true] call ace_interact_menu_fnc_addActionToClass;

//UnCover H-60
private _action2 = ["UnCoverHatchet", "UnCover", "", {
		[(_this select 0)]remoteExec ["WMS_fnc_HatchetUnCover", 2]
	},{
		!((_this select 0)getVariable ["WMS_HatchetCover", true]) &&
		{(owner (_this select 0)) == (owner (_this select 1))} &&
		{locked (_this select 0) == 0}
	}
	] call ace_interact_menu_fnc_createAction;
["vtx_H60_base", 0, ["ACE_MainActions"], _action2, true] call ace_interact_menu_fnc_addActionToClass;

//_vehicleObject isKindOf "rhs_a3t72tank_base" ||_vehicleObject isKindOf "MBT_01_base_F" ||_vehicleObject isKindOf "RHS_M2A2_Base"
//Cover T-80 tanks with camonet
private _action3 = ["CoverHatchet", "Cover Tank", "", {
		[(_this select 0)]remoteExec ["WMS_fnc_HatchetCover", 2]
	},{
		(_this select 0)getVariable ["WMS_HatchetCover", true] && 
		{!(isEngineOn (_this select 0))} && 
		{(speed (_this select 0)) == 0} &&
		{(owner (_this select 0)) == (owner (_this select 1))} &&
		{locked (_this select 0) == 0}
	}
	] call ace_interact_menu_fnc_createAction;
["rhs_t80b", 0, ["ACE_MainActions"], _action3, true] call ace_interact_menu_fnc_addActionToClass;
//UnCover T-80 tanks
private _action4 = ["UnCoverHatchet", "UnCover", "", {
		[(_this select 0)]remoteExec ["WMS_fnc_HatchetUnCover", 2]
	},{
		!((_this select 0)getVariable ["WMS_HatchetCover", true]) &&
		{(owner (_this select 0)) == (owner (_this select 1))} &&
		{locked (_this select 0) == 0}
	}
	] call ace_interact_menu_fnc_createAction;
["rhs_t80b", 0, ["ACE_MainActions"], _action4, true] call ace_interact_menu_fnc_addActionToClass;
//Cover T-72/90 tanks with camonet
private _action3 = ["CoverHatchet", "Cover Tank", "", {
		[(_this select 0)]remoteExec ["WMS_fnc_HatchetCover", 2]
	},{
		(_this select 0)getVariable ["WMS_HatchetCover", true] && 
		{!(isEngineOn (_this select 0))} && 
		{(speed (_this select 0)) == 0} &&
		{(owner (_this select 0)) == (owner (_this select 1))} &&
		{locked (_this select 0) == 0}
	}
	] call ace_interact_menu_fnc_createAction;
["rhs_a3t72tank_base", 0, ["ACE_MainActions"], _action3, true] call ace_interact_menu_fnc_addActionToClass;
//UnCover T-72/90 tanks
private _action4 = ["UnCoverHatchet", "UnCover", "", {
		[(_this select 0)]remoteExec ["WMS_fnc_HatchetUnCover", 2]
	},{
		!((_this select 0)getVariable ["WMS_HatchetCover", true]) &&
		{(owner (_this select 0)) == (owner (_this select 1))} &&
		{locked (_this select 0) == 0}
	}
	] call ace_interact_menu_fnc_createAction;
["rhs_a3t72tank_base", 0, ["ACE_MainActions"], _action4, true] call ace_interact_menu_fnc_addActionToClass;
//Cover M1a1 tanks with camonet
private _action5 = ["CoverHatchet", "Cover Tank", "", {
		[(_this select 0)]remoteExec ["WMS_fnc_HatchetCover", 2]
	},{
		(_this select 0)getVariable ["WMS_HatchetCover", true] && 
		{!(isEngineOn (_this select 0))} && 
		{(speed (_this select 0)) == 0} &&
		{(owner (_this select 0)) == (owner (_this select 1))} &&
		{locked (_this select 0) == 0}
	}
	] call ace_interact_menu_fnc_createAction;
["MBT_01_base_F", 0, ["ACE_MainActions"], _action5, true] call ace_interact_menu_fnc_addActionToClass;
//UnCover M1a1 tanks
private _action6 = ["UnCoverHatchet", "UnCover", "", {
		[(_this select 0)]remoteExec ["WMS_fnc_HatchetUnCover", 2]
	},{
		!((_this select 0)getVariable ["WMS_HatchetCover", true]) &&
		{(owner (_this select 0)) == (owner (_this select 1))} &&
		{locked (_this select 0) == 0}
	}
	] call ace_interact_menu_fnc_createAction;
["MBT_01_base_F", 0, ["ACE_MainActions"], _action6, true] call ace_interact_menu_fnc_addActionToClass;
/* TOO HIGH for curent layout
//Cover Bradley with camonet
private _action0 = ["CoverHatchet", "Cover Bradley", "", {
		[(_this select 0)]remoteExec ["WMS_fnc_HatchetCover", 2]
	},{
		(_this select 0)getVariable ["WMS_HatchetCover", true] && 
		{!(isEngineOn (_this select 0))} && 
		{(speed (_this select 0)) == 0} &&
		{(owner (_this select 0)) == (owner (_this select 1))} &&
		{locked (_this select 0) == 0}
	}
	] call ace_interact_menu_fnc_createAction;
["RHS_M2A2_Base", 0, ["ACE_MainActions"], _action0, true] call ace_interact_menu_fnc_addActionToClass;
//UnCover Bradley
private _action1 = ["UnCoverHatchet", "UnCover", "", {
		[(_this select 0)]remoteExec ["WMS_fnc_HatchetUnCover", 2]
	},{
		!((_this select 0)getVariable ["WMS_HatchetCover", true]) &&
		{(owner (_this select 0)) == (owner (_this select 1))} &&
		{locked (_this select 0) == 0}
	}
	] call ace_interact_menu_fnc_createAction;
["RHS_M2A2_Base", 0, ["ACE_MainActions"], _action1, true] call ace_interact_menu_fnc_addActionToClass;
*/
//Activate Heavy stationary weapons
private _action7 = ["activateWeaponStation", "Activate Weapon for 2500", "", {
		diag_log format ["TNA|WAK|TNA activateWeaponStation _this = %1", _this];
		[(_this select 0),(_this select 1), 2500]remoteExec ["WMS_fnc_weaponStationInitiate", 2]
	},{
		((_this select 0) getVariable ["WMS_WeaponStationActivate", true]) &&
		{((_this select 1) getVariable ["ExileMoney", 0]) >= 2500}
		//{(_this select 0) getVariable ["WMS_buyerowner", "00000000000000000"] == (getPlayerUID (_this select 1))} && 
		//{alive (_this select 0)}
	}
	] call ace_interact_menu_fnc_createAction;
["B_AAA_System_01_F", 0, ["ACE_MainActions"], _action7] call ace_interact_menu_fnc_addActionToClass;
["B_SAM_System_01_F", 0, ["ACE_MainActions"], _action7] call ace_interact_menu_fnc_addActionToClass;
["B_SAM_System_02_F", 0, ["ACE_MainActions"], _action7] call ace_interact_menu_fnc_addActionToClass;
["B_SAM_System_03_F", 0, ["ACE_MainActions"], _action7] call ace_interact_menu_fnc_addActionToClass;
["B_Radar_System_01_F", 0, ["ACE_MainActions"], _action7] call ace_interact_menu_fnc_addActionToClass;

//Init UGVs/UAVs //if (_veh isKindOf "UGV_01_base_F"||_veh isKindOf "UAV") then {createVehicleCrew _veh};
private _action8 = ["ActivateUGV", "Activate UGV", "", {
		createVehicleCrew (_this select 0);
		(_this select 0)setVariable ["WMS_UAVcanActivate", false, true];
		(_this select 0)setVariable ["WMS_UAVcanDeActivate", true, true];
	},{
		(locked (_this select 0) == 0) &&
		{(_this select 0)getVariable ["WMS_UAVcanActivate", true]}
	}
	] call ace_interact_menu_fnc_createAction; //(_this select 0) say3d 'GetToTheChoppa';
["UGV_01_base_F", 0, ["ACE_MainActions"], _action8, true] call ace_interact_menu_fnc_addActionToClass;

//Init UGVs/UAVs //if (_veh isKindOf "UGV_01_base_F"||_veh isKindOf "UAV") then {createVehicleCrew _veh};
private _action9 = ["ActivateUAV", "Activate UAV", "", {
		createVehicleCrew (_this select 0);
		(_this select 0)setVariable ["WMS_UAVcanActivate", false, true];
		(_this select 0)setVariable ["WMS_UAVcanDeActivate", true, true];
	},{
		(locked (_this select 0) == 0) &&
		{(_this select 0)getVariable ["WMS_UAVcanActivate", true]}
	}
	] call ace_interact_menu_fnc_createAction; //(_this select 0) say3d 'GetToTheChoppa';
["UAV_02_base_F", 0, ["ACE_MainActions"], _action9, true] call ace_interact_menu_fnc_addActionToClass;


//Init UGVs/UAVs //if (_veh isKindOf "UGV_01_base_F"||_veh isKindOf "UAV") then {createVehicleCrew _veh};
private _action10 = ["DeActivateUGV", "DeActivate UGV", "", {
		deleteVehicleCrew (_this select 0);
		(_this select 0)setVariable ["WMS_UAVcanActivate", true, true];
		(_this select 0)setVariable ["WMS_UAVcanDeActivate", false, true];
	},{
		(locked (_this select 0) == 0) &&
		{(_this select 0)getVariable ["WMS_UAVcanDeActivate", false]}
	}
	] call ace_interact_menu_fnc_createAction; //(_this select 0) say3d 'GetToTheChoppa';
["UGV_01_base_F", 0, ["ACE_MainActions"], _action10, true] call ace_interact_menu_fnc_addActionToClass;

//Init UGVs/UAVs //if (_veh isKindOf "UGV_01_base_F"||_veh isKindOf "UAV") then {createVehicleCrew _veh};
private _action11 = ["DeActivateUAV", "DeActivate UAV", "", {
		deleteVehicleCrew (_this select 0);
		(_this select 0)setVariable ["WMS_UAVcanActivate", true, true];
		(_this select 0)setVariable ["WMS_UAVcanDeActivate", false, true];
	},{
		(locked (_this select 0) == 0) &&
		{(_this select 0)getVariable ["WMS_UAVcanDeActivate", false]}
	}
	] call ace_interact_menu_fnc_createAction; //(_this select 0) say3d 'GetToTheChoppa';
["UAV_02_base_F", 0, ["ACE_MainActions"], _action11, true] call ace_interact_menu_fnc_addActionToClass;

//deleteVehicleCrew