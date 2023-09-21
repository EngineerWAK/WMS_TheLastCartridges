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
private ["_objToCheck"];
params [
	"_container"
];
if !(isServer) ExitWith {Diag_Log format["Nope, %1, %2",_container, position _container]};
_container enableRopeAttach false;

_objToCheck = missionNameSpace getVariable ["WMS_ObjectsToCheck",[]];
_objToCheck pushBack _container;
missionNameSpace setVariable ["WMS_ObjectsToCheck",_objToCheck]; //this will be useful later
_container setVariable ["WMS_SafPosCheckASL",(getPosASL _container)]; //this will be useful later
///////////////////////CLAIM STUFF//////////////////////////////////////////
[
	_container, [ //"Special Item" is the MAR-10 DMR, because even in arma there is pay to win... and this will create a BIIIIIIG log server side
		"<t size='1' color='#4bff1a'>Initiate Banana Protocol</t>", 
		"
			params ['_target', '_caller', '_actionId', '_arguments'];
			if ((_target getVariable ['TheOneMillionDollarsBase',false]))then{
				if ((_target getVariable ['WMS_buyerowner', '']) == (getPlayerUID _caller)) then {
					[_caller, _target,'banana'] remoteExec ['WMS_fnc_claimItems',2];
					_caller removeItem 'ACE_Cellphone';
					for '_i' from 1 to 100 do {
						_caller removeItem 'ACE_Banana';
					};
				}else{
					[_caller] call WMS_fnc_rocketMan;
				};
			}else{
				[_caller, _target,'banana'] remoteExec ['WMS_fnc_claimItems',2];
					_caller removeItem 'ACE_Cellphone';
				for '_i' from 1 to 100 do {
					_caller removeItem 'ACE_Banana';
				};
			};
			(_this select 0) removeaction (_this select 2);
		", 
		nil,
		1, 
		true, 
		true, 
		"", 
		"
		((_this getVariable ['playerInTraderZone', false])||(_target getVariable ['TheOneMillionDollarsBase',false])) &&
		(vehicle _this == _this)  &&
		{(items player find 'ACE_Cellphone' != -1)} &&
		{(count (items player select {_x == 'ACE_Banana'}) > 99)}
		",
		5, 
		false 
	]
]remoteExec [
	"addAction",
	0, //0 for all players //2 server only //-2 everyone but the server
	true //JIP
];
[
	_container, [ //"Special Item" is the MAR-10 DMR, because even in arma there is pay to win... and this will create a BIIIIIIG log server side
		"<t size='1' color='#4bff1a'>Claim Special Item</t>", 
		"
			params ['_target', '_caller', '_actionId', '_arguments'];
			if ((_target getVariable ['TheOneMillionDollarsBase',false]))then{
				if (((_target getVariable ['WMS_buyerowner', '']) == (getPlayerUID _caller)) || ((getPlayerUID _caller) in (_target getVariable ['WMS_BaseFriends', '']))) then {
					[_caller, _target,'noreen'] remoteExec ['WMS_fnc_claimItems',2];
					[_caller,5000] remoteExec ['WMS_fnc_smallTransactions',2];
					{_caller removeItem _x}forEach ['Csat_Id_01','Csat_Id_02','Csat_Id_03','Csat_Id_04','Csat_Id_05','ACE_Cellphone','FilesSecret'];
					for '_i' from 1 to 25 do {
						_caller removeItem 'FlashDisk';
					};
				}else{
					[_caller] call WMS_fnc_rocketMan;
				};
			}else{
				[_caller, _target,'noreen'] remoteExec ['WMS_fnc_claimItems',2];
				[_caller,5000] remoteExec ['WMS_fnc_smallTransactions',2];
				{_caller removeItem _x}forEach ['Csat_Id_01','Csat_Id_02','Csat_Id_03','Csat_Id_04','Csat_Id_05','ACE_Cellphone','FilesSecret'];
				for '_i' from 1 to 25 do {
					_caller removeItem 'FlashDisk';
				};
			};
			(_this select 0) removeaction (_this select 2);
		", 
		nil,
		1, 
		true, 
		true, 
		"", 
		"
		((_this getVariable ['playerInTraderZone', false])||(_target getVariable ['TheOneMillionDollarsBase',false])) &&
		(vehicle _this == _this) &&
		{(_this getVariable ['ExileMoney', 0] > 4999)} &&
		{(items player find 'ACE_Cellphone' != -1)} &&
		{(magazines player find 'FilesSecret' != -1)} &&
		{(count (magazines player select {_x == 'FlashDisk'}) > 24)} &&
		{(magazines player find 'Csat_Id_01' != -1)} &&
		{(magazines player find 'Csat_Id_02' != -1)} &&
		{(magazines player find 'Csat_Id_03' != -1)} &&
		{(magazines player find 'Csat_Id_04' != -1)} &&
		{(magazines player find 'Csat_Id_05' != -1)}
		",
		5, 
		false 
	]
]remoteExec [
	"addAction",
	0, //0 for all players //2 server only //-2 everyone but the server
	true //JIP
];

[
	_container, [
		"<t size='1' color='#4bff1a'>Claim Reward</t>", 
		"
			params ['_target', '_caller', '_actionId', '_arguments'];
			if ((_target getVariable ['TheOneMillionDollarsBase',false]))then{
				if ((_target getVariable ['WMS_buyerowner', '']) == (getPlayerUID _caller)) then {
					[(_this select 1), (_this select 0)] remoteExec ['WMS_fnc_claimReward',2];
					{_caller removeItem _x}forEach ['Csat_Id_01','Csat_Id_02','Csat_Id_03','Csat_Id_04','Csat_Id_05'];
				}else{
					[_caller] call WMS_fnc_rocketMan;
					(_this select 0) removeaction (_this select 2);
				};
			}else{
				[(_this select 1), (_this select 0)] remoteExec ['WMS_fnc_claimReward',2];
				{_caller removeitem _x}forEach ['Csat_Id_01','Csat_Id_02','Csat_Id_03','Csat_Id_04','Csat_Id_05'];
			};
		", 
		nil, 
		1, 
		true, 
		true, 
		"", 
		"
		((_this getVariable ['playerInTraderZone', false])||(_target getVariable ['TheOneMillionDollarsBase',false])) &&
		(vehicle _this == _this) &&
		{(magazines player find 'Csat_Id_01' >= 0)} &&
		{(magazines player find 'Csat_Id_02' >= 0)} &&
		{(magazines player find 'Csat_Id_03' >= 0)} &&
		{(magazines player find 'Csat_Id_04' >= 0)} &&
		{(magazines player find 'Csat_Id_05' >= 0)}
		",
		5, 
		false 
	]
]remoteExec [
	"addAction",
	0, //0 for all players //2 server only //-2 everyone but the server
	true //JIP
];
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
[
				//hint 'Cargo Dump Container is empty, you punk'; for what ever reason this is general to all players
				//'Cargo Dump Container is empty, you punk' remoteExec ['hint', _own]; //because you are a moron, moron
	_container, [
		"<t size='1' color='#3d74ff'>Sell Inventory</t>", 
		" 
			params ['_target', '_caller', '_actionId', '_arguments'];
			if ((_target getVariable ['TheOneMillionDollarsBase',false]))then{
				if (((_target getVariable ['WMS_buyerowner', '']) == (getPlayerUID _caller)) || ((getPlayerUID _caller) in (_target getVariable ['WMS_BaseFriends', '']))) then {
					if !(count ((ItemCargo _target)+(WeaponCargo _target)+(MagazineCargo _target)+(backpackCargo _target)) == 0) then { 
						[_caller, _target, (_target getVariable ['WMS_buyerowner', ''])] remoteExec ['WMS_fnc_processCargoDump',2]; 
					}; 
				}else{
					[_caller] call WMS_fnc_rocketMan;
					(_this select 0) removeaction (_this select 2);
				};
			}else{
				_own = owner _caller;
				if !(count ((ItemCargo _target)+(WeaponCargo _target)+(MagazineCargo _target)+(backpackCargo _target)) == 0) then { 
					[_caller, _target] remoteExec ['WMS_fnc_processCargoDump',2]; 
				} else { 
					hint 'Cargo Dump Container is empty, you punk';
				}; 
			};
		", 
		nil, 
		1, 
		true, 
		true, 
		"", 
		"((_this getVariable ['playerInTraderZone', false])||(_target getVariable ['TheOneMillionDollarsBase',false]))",  
		5, 
		false 
	]
]remoteExec [
	"addAction",
	0, //0 for all players //2 server only //-2 everyone but the server
	true //JIP
];
[
	_container, [
		"<t size='0.9' color='#26e600'>Buy Default Ammo Primary Weap </t>",
		"   
			[(_this select 1), (_this select 0), 'default'] call WMS_fnc_buyAmmoOnBox;  
		", 
		nil, 
		1, 
		true, 
		true, 
		"", 
		"((_this getVariable ['playerInTraderZone', false])||(_target getVariable ['TheOneMillionDollarsBase',false]))",  
 		5, 
		false 
	]
]remoteExec [
	"addAction",
	0, //0 for all players //2 server only //-2 everyone but the server
	true //JIP
];
[
	_container, [
		"<t size='0.9' color='#26e600'>Buy Random Ammo Primary Weap </t>",
		"   
			[(_this select 1), (_this select 0), 'random'] call WMS_fnc_buyAmmoOnBox;  
		", 
		nil, 
		1, 
		true, 
		true, 
		"", 
		"((_this getVariable ['playerInTraderZone', false])||(_target getVariable ['TheOneMillionDollarsBase',false]))",  
 		5, 
		false 
	]
]remoteExec [
	"addAction",
	0, //0 for all players //2 server only //-2 everyone but the server
	true //JIP
];

[
	_container, [
		"<t size='0.9' color='#26e600'>Buy Pistol Ammo</t>",
		"   
			[(_this select 1), (_this select 0), 'randompistol'] call WMS_fnc_buyAmmoOnBox;  
		", 
		nil, 
		1, 
		true, 
		true, 
		"", 
		"((_this getVariable ['playerInTraderZone', false])||(_target getVariable ['TheOneMillionDollarsBase',false])) && {!(handgunWeapon _this isEqualTo '')}",
 		5, 
		false 
	]
]remoteExec [
	"addAction",
	0, //0 for all players //2 server only //-2 everyone but the server
	true //JIP
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
					execVM 'Custom\Intro\levels.sqf';
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
		"((_this getVariable ['playerInTraderZone', false])||(_target getVariable ['TheOneMillionDollarsBase',false]))",
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
					execVM 'Custom\Intro\levels.sqf';
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
		"((_this getVariable ['playerInTraderZone', false])||(_target getVariable ['TheOneMillionDollarsBase',false]))",
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
					execVM 'Custom\Intro\levels.sqf';
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
		"((_this getVariable ['playerInTraderZone', false])||(_target getVariable ['TheOneMillionDollarsBase',false]))",
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
					execVM 'Custom\Intro\levels.sqf';
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
		"((_this getVariable ['playerInTraderZone', false])||(_target getVariable ['TheOneMillionDollarsBase',false]))",
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
					execVM 'Custom\Intro\levels.sqf';
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
			((_this getVariable ['playerInTraderZone', false])||(_target getVariable ['TheOneMillionDollarsBase',false])) &&
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
					execVM 'Custom\Intro\levels.sqf';
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
			((_this getVariable ['playerInTraderZone', false])||(_target getVariable ['TheOneMillionDollarsBase',false])) &&
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
					execVM 'Custom\Intro\levels.sqf';
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
			((_this getVariable ['playerInTraderZone', false])||(_target getVariable ['TheOneMillionDollarsBase',false])) &&
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