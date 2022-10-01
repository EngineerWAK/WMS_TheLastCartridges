/**
 * WMS_fnc_initContainerCargoDump
 *
 * TNA-Community
 * https://discord.gg/Zs23URtjwF
 * © 2021 {|||TNA|||}WAKeupneo
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
private [];
params [
	"_container"
];
/*
_priceBunch 	= getNumber(missionConfigFile >> "CfgAllPrices" >> "Money_bunch" >> "price"); //"priceBunch"
_priceRoll 		= getNumber(missionConfigFile >> "CfgAllPrices" >> "Money_Roll" >> "price"); //"priceRoll"
_priceStack 	= getNumber(missionConfigFile >> "CfgAllPrices" >> "Money_Stack" >> "price"); //"priceStack"
_priceQuest 	= getNumber(missionConfigFile >> "CfgAllPrices" >> "Money_Quest" >> "price"); //"priceQuest"
_priceBig	 	= getNumber(missionConfigFile >> "CfgAllPrices" >> "Money" >> "price"); //"priceQuest"

	class Money_bunch				    { quality = 1; price = 60; }; //30
    class Money_roll				    { quality = 1; price = 300; }; //150
    class Money_stack				    { quality = 1; price = 1200; }; //600
    class Money_stack_quest			    { quality = 1; price = 2400; }; //1200
    class Money						    { quality = 1; price = 16000; }; //8000 //craft only Money_stack_quest x7
*/
_container enableRopeAttach false;
_container addAction [
	"<t size='1' color='#4bff1a'>Claim Reward</t>", {
		[(_this select 1), (_this select 0)] remoteExec ["WMS_fnc_claimReward",2];
		{player removeitem _x}forEach ['Csat_Id_01','Csat_Id_02','Csat_Id_03','Csat_Id_04','Csat_Id_05'];
	}, 
	nil, 
	1, 
	true, 
	true, 
	"", 
	"
	(_this getVariable ['playerInTraderZone', false]) &&
	(vehicle _this == _this) &&
	{(magazines player find 'Csat_Id_01' >= 0)} &&
	{(magazines player find 'Csat_Id_02' >= 0)} &&
	{(magazines player find 'Csat_Id_03' >= 0)} &&
	{(magazines player find 'Csat_Id_04' >= 0)} &&
	{(magazines player find 'Csat_Id_05' >= 0)}
	",  
	5, 
	false 
];

_container addAction [
	"<t size='1' color='#3d74ff'>Sell Inventory</t>", { 
		if !(count ((ItemCargo (_this select 0))+(WeaponCargo (_this select 0))+(MagazineCargo (_this select 0))+(backpackCargo (_this select 0))) == 0) then { 
			[(_this select 1), (_this select 0)] remoteExec ["WMS_fnc_processCargoDump",2]; 
		} else { 
			"Cargo Dump Container is empty, you punk" remoteExec ["hint", (owner (_this select 1))]; 
		}; 
	}, 
	nil, 
	1, 
	true, 
	true, 
	"", 
	"(_this getVariable ['playerInTraderZone', false])",  
	5, 
	false 
];
 
_container addAction [
	"<t size='1' color='#26e600'>Buy Ammo</t>", {  
		[(_this select 1), (_this select 0), "random"] call WMS_fnc_buyAmmoOnBox;  
	}, 
	nil, 
	1, 
	true, 
	true, 
	"", 
	"(_this getVariable ['playerInTraderZone', false])",  
 	5, 
	false 
];

[ //params ["_target", "_caller", "_actionId", "_arguments"];
	_container,
	[
		"<t size='0.9' color='#528ffa'>Buy MoneyRoll 301</t>",
		"
			if ((_this select 1) getVariable ['ExileMoney', 0] >= (_this select 3) select 1) then {
				if ((_this select 1) getVariable ['ExileScore', 0] >= (_this select 3) select 2) then {
					[(_this select 1),(_this select 3) select 1] remoteExec ['WMS_fnc_smallTransactions',2];
					(_this select 0) addItemCargoGlobal [((_this select 3) select 0), 1];
					hint 'Money in the container';
				} else {
					hint 'Bro! your respect is too low';
					execVM 'addons\intro\levels.sqf';
				};
			} else {
				hint 'You are too poor Dude';
			};
		",
		["Money_roll",301,0], //argument accessible in the script (_this select 3)
		1,
		true,
		true,
		"",
		//"((getplayerUID _this) == (_target getVariable ['WMS_BuyerOwner', 0]) && (vehicle _this == _this))",
		"(_this getVariable ['playerInTraderZone', false])",
		5
	]
] remoteExec [
	"addAction",
	0, //0 for all players //2 server only //-2 everyone but the server
	true //JIP
];
[ //params ["_target", "_caller", "_actionId", "_arguments"];
	_container,
	[
		"<t size='0.9' color='#528ffa'>Buy MoneyStack 1202</t>",
		"
			if ((_this select 1) getVariable ['ExileMoney', 0] >= (_this select 3) select 1) then {
				if ((_this select 1) getVariable ['ExileScore', 0] >= (_this select 3) select 2) then {
					[(_this select 1),(_this select 3) select 1] remoteExec ['WMS_fnc_smallTransactions',2];
					(_this select 0) addItemCargoGlobal [((_this select 3) select 0), 1];
					hint 'Money in the container';
				} else {
					hint 'Bro! your respect is too low';
					execVM 'addons\intro\levels.sqf';
				};
			} else {
				hint 'You are too poor Dude';
			};
		",
		["Money_stack",1202,0], //argument accessible in the script (_this select 3)
		1,
		true,
		true,
		"",
		//"((getplayerUID _this) == (_target getVariable ['WMS_BuyerOwner', 0]) && (vehicle _this == _this))",
		"(_this getVariable ['playerInTraderZone', false])",
		5
	]
] remoteExec [
	"addAction",
	0, //0 for all players //2 server only //-2 everyone but the server
	true //JIP
];
[ //params ["_target", "_caller", "_actionId", "_arguments"];
	_container,
	[
		"<t size='0.9' color='#528ffa'>Buy MoneyStack 2403</t>",
		"
			if ((_this select 1) getVariable ['ExileMoney', 0] >= (_this select 3) select 1) then {
				if ((_this select 1) getVariable ['ExileScore', 0] >= (_this select 3) select 2) then {
					[(_this select 1),(_this select 3) select 1] remoteExec ['WMS_fnc_smallTransactions',2];
					(_this select 0) addItemCargoGlobal [((_this select 3) select 0), 1];
					hint 'Money in the container';
				} else {
					hint 'Bro! your respect is too low';
					execVM 'addons\intro\levels.sqf';
				};
			} else {
				hint 'You are too poor Dude';
			};
		",
		["Money_stack_quest",2403,0], //argument accessible in the script (_this select 3)
		1,
		true,
		true,
		"",
		//"((getplayerUID _this) == (_target getVariable ['WMS_BuyerOwner', 0]) && (vehicle _this == _this))",
		"(_this getVariable ['playerInTraderZone', false])",
		5
	]
] remoteExec [
	"addAction",
	0, //0 for all players //2 server only //-2 everyone but the server
	true //JIP
];
[ //params ["_target", "_caller", "_actionId", "_arguments"];
	_container,
	[
		"<t size='0.9' color='#528ffa'>Buy BigMoney 16005</t>",
		"
			if ((_this select 1) getVariable ['ExileMoney', 0] >= (_this select 3) select 1) then {
				if ((_this select 1) getVariable ['ExileScore', 0] >= (_this select 3) select 2) then {
					[(_this select 1),(_this select 3) select 1] remoteExec ['WMS_fnc_smallTransactions',2];
					(_this select 0) addItemCargoGlobal [((_this select 3) select 0), 1];
					hint 'Money in the container';
				} else {
					hint 'Bro! your respect is too low';
					execVM 'addons\intro\levels.sqf';
				};
			} else {
				hint 'You are too poor Dude';
			};
		",
		["Money",16005,0], //argument accessible in the script (_this select 3)
		1,
		true,
		true,
		"",
		//"((getplayerUID _this) == (_target getVariable ['WMS_BuyerOwner', 0]) && (vehicle _this == _this))",
		"(_this getVariable ['playerInTraderZone', false])",
		5
	]
] remoteExec [
	"addAction",
	0, //0 for all players //2 server only //-2 everyone but the server
	true //JIP
];


[ //params ["_target", "_caller", "_actionId", "_arguments"];
	_container,
	[
		"<t size='0.9' color='#1fd507'>Buy *10 40mm 750$ </t>",
		"
			if ((_this select 1) getVariable ['ExileMoney', 0] >= (_this select 3) select 1) then {
				if ((_this select 1) getVariable ['ExileScore', 0] >= (_this select 3) select 2) then {
					[(_this select 1),(_this select 3) select 1] remoteExec ['WMS_fnc_smallTransactions',2];
					(_this select 0) addMagazineCargoGlobal [(selectRandom ((_this select 3) select 0)), 10];
					hint '40mm in the container';
				} else {
					hint 'Bro! your respect is too low';
					execVM 'addons\intro\levels.sqf';
				};
			} else {
				hint 'You are too poor Dude';
			};
		",
		[["rhs_mag_M441_HE", "rhs_mag_M433_HEDP", "rhs_mag_M397_HET", "1Rnd_HE_Grenade_shell"],750,2500], //argument accessible in the script (_this select 3)
		1,
		true,
		true,
		"",
		//"((getplayerUID _this) == (_target getVariable ['WMS_BuyerOwner', 0]) && (vehicle _this == _this))",
		"
			(_this getVariable ['playerInTraderZone', false]) &&
			{(_this getVariable ['ExileScore', 0] >= 2500)}
		",
		5
	]
] remoteExec [
	"addAction",
	0, //0 for all players //2 server only //-2 everyone but the server
	true //JIP
];
[ //params ["_target", "_caller", "_actionId", "_arguments"];
	_container,
	[
		"<t size='0.9' color='#1fd507'>Buy *10 VOG25 750$ </t>",
		"
			if ((_this select 1) getVariable ['ExileMoney', 0] >= (_this select 3) select 1) then {
				if ((_this select 1) getVariable ['ExileScore', 0] >= (_this select 3) select 2) then {
					[(_this select 1),(_this select 3) select 1] remoteExec ['WMS_fnc_smallTransactions',2];
					(_this select 0) addMagazineCargoGlobal [(selectRandom ((_this select 3) select 0)), 10];
					hint 'VOG25 in the container';
				} else {
					hint 'Bro! your respect is too low';
					execVM 'addons\intro\levels.sqf';
				};
			} else {
				hint 'You are too poor Dude';
			};
		",
		[["rhs_VOG25", "rhs_VOG25p", "rhs_vg40tb"],750,2500], //argument accessible in the script (_this select 3)
		1,
		true,
		true,
		"",
		//"((getplayerUID _this) == (_target getVariable ['WMS_BuyerOwner', 0]) && (vehicle _this == _this))",
		"
			(_this getVariable ['playerInTraderZone', false]) &&
			{(_this getVariable ['ExileScore', 0] >= 2500)}
		",
		5
	]
] remoteExec [
	"addAction",
	0, //0 for all players //2 server only //-2 everyone but the server
	true //JIP
];
//"10Rnd_50BW_Mag_F"
[ //params ["_target", "_caller", "_actionId", "_arguments"];
	_container,
	[
		"<t size='0.9' color='#1fd507'>Buy *3 10Rnd 50BW 150$ </t>",
		"
			if ((_this select 1) getVariable ['ExileMoney', 0] >= (_this select 3) select 1) then {
				if ((_this select 1) getVariable ['ExileScore', 0] >= (_this select 3) select 2) then {
					[(_this select 1),(_this select 3) select 1] remoteExec ['WMS_fnc_smallTransactions',2];
					(_this select 0) addMagazineCargoGlobal [(selectRandom ((_this select 3) select 0)), 3];
					hint '50BW in the container';
				} else {
					hint 'Bro! your respect is too low';
					execVM 'addons\intro\levels.sqf';
				};
			} else {
				hint 'You are too poor Dude';
			};
		",
		[["10Rnd_50BW_Mag_F"],150,2500], //argument accessible in the script (_this select 3)
		1,
		true,
		true,
		"",
		//"((getplayerUID _this) == (_target getVariable ['WMS_BuyerOwner', 0]) && (vehicle _this == _this))",
		"
			(_this getVariable ['playerInTraderZone', false]) &&
			{('ARX' in primaryWeapon player)} &&
			{(_this getVariable ['ExileScore', 0] >= 2500)}
		",
		5
	]
] remoteExec [
	"addAction",
	0, //0 for all players //2 server only //-2 everyone but the server
	true //JIP
];