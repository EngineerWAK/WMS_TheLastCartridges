/*this addAction ["Buy Default Ammo", { 
	//[(_this select 1), (_this select 0), "default"] remoteExec ["WMS_fnc_buyAmmoOnBox"]; 
 	[(_this select 1), (_this select 0), "random"] call WMS_fnc_buyAmmoOnBox; 
	},
	nil,
	1,
	true,
	true,
	"",
	"", 
	5,
	false
];

this addAction ["Buy Random Ammo", { 
  //[(_this select 1), (_this select 0), "random"] remoteExec ["WMS_fnc_buyAmmoOnBox"]; 
  [(_this select 1), (_this select 0), "random"] call WMS_fnc_buyAmmoOnBox;
	},
	nil,
	1,
	true,
	true,
	"",
	"", 
	5,
	false
];
*/
private ["_weaponConfig","_ammoArray","_ammoType"];
params [
	"_playerObject",
	"_boxObject",
	["_option", "random"] //"random"
];
if (true) then {diag_log format ["[BUY_AMMO]|WAK|TNA|WMS|_this %1", _this]};

_magsCount = 3;
//_weaponConfig = configFile >> "CfgWeapons" >> primaryWeapon _playerObject;  //VANILLA
//_ammoArray = getArray (_weaponConfig >> "magazines"); //VANILLA

_ammoArray = [primaryWeapon _playerObject] call CBA_fnc_compatibleMagazines; //CBA

if (count _ammoArray == 0) exitWith {
	//diag_log something
	//something went wrong remoteExec message
};
_ammoTypeDefault = _ammoArray select 0;
_ammoTypeRandom = selectRandom _ammoArray;
_ammoCount = getNumber (configfile >> "CfgMagazines" >> _ammoTypeRandom >> "count");
_ammoType = getText (configfile >> "CfgMagazines" >> _ammoTypeRandom >> "ammo");
_ammoCaliber = getNumber (configfile >> "CfgAmmo" >> _ammoType >> "caliber"); //not the "real" Caliber but seems to follow some logic
if (_ammoCaliber < 0.75) then {_ammoCaliber = 0.75};
_price = round (_ammoCaliber*_ammoCount*1.5);

_targetUID = getPlayerUID _playerObject;
_targetOwner = (owner _playerObject);
//_playerUID_ExileMoney = "ExileMoney_"+_targetUID;
//_playerMoney = profileNamespace getVariable [_playerUID_Exilemoney,0]; //for server use
_playerMoney = _playerObject getVariable ["ExileMoney",0]; //for local use

if (_playerMoney >= (_price*_magsCount)) then {
	//maybe a player addAction to confirm/cancel including the price
	if (_option == "default") then { //NOT USED ANYMORE
		/*_display = ("<t size=""0.9""  color=""#ffffff"">" + (str _ammoTypeDefault) +"</t>") + ("<t size=""0.9""  color=""#ffffff"">" + (" $") + (str (_price*_magsCount)) +"</t>");
		_playerObject addAction
		[
			_display,	// title
			{ 
				params ["_target", "_caller", "_actionId", "_arguments"]; // script
				_target removeAction _actionId;
				(_arguments select 0) addMagazineCargoGlobal [(_arguments select 1), (_arguments select 2)];
				//[(_arguments select 1),(_arguments select 3),_caller, "ammoOnBox"] remoteExec ['WMS_fnc_BuyFromTrader'];
				[_caller, (_arguments select 3)] remoteExec ['WMS_fnc_smallTransactions'];
			},
			[_boxObject,_ammoTypeDefault,_magsCount,(_price*_magsCount)],		// arguments
			1,		// priority
			true,		// showWindow
			true,		// hideOnUse
			"",			// shortcut
			"(_target distance2D _this) < 50", 	// condition
			//"", 	// condition
			5,			// radius
			false,		// unconscious
			"",			// selection
			""			// memoryPoint
		];*/
		//_boxObject addMagazineCargoGlobal [_ammoType, _magsCount];
	} else { //RANDOM
		_display = ("<t size=""0.9""  color=""#ffffff"">" + (str _ammoTypeRandom) +"</t>") + ("<t size=""0.9""  color=""#ffffff"">" + ("$") + (str (_price*_magsCount)) +"</t>");
		_playerObject addAction
		[
			_display,	// title
			{ 
				params ["_target", "_caller", "_actionId", "_arguments"]; // script
				_target removeAction _actionId;
				(_arguments select 0) addMagazineCargoGlobal [(_arguments select 1), (_arguments select 2)];
				//[(_arguments select 1),(_arguments select 3),_caller, "ammoOnBox"] remoteExec ['WMS_fnc_BuyFromTrader']; //SMALL TRANSACTION, not buyfromtrader
				[_caller, (_arguments select 3)] remoteExec ['WMS_fnc_smallTransactions'];
			},
			[_boxObject,_ammoTypeRandom,_magsCount,(_price*_magsCount)],		// arguments
			1,		// priority
			true,		// showWindow
			true,		// hideOnUse
			"",			// shortcut
			"(_target distance2D _this) < 50", 	// condition
			//"", 	// condition
			5,			// radius
			false,		// unconscious
			"",			// selection
			""			// memoryPoint
		];
		//_boxObject addMagazineCargoGlobal [_ammoTypeRandom, _magsCount];
	};
/*
	profileNamespace setVariable [_playerUID_Exilemoney,(_playerMoney-_price)]; //here it will adjust the player money BEFORE he click on the AddAction
	_playerObject setVariable ["ExileMoney", _playerMoney, true];
	saveProfileNamespace;*/
} else {
	if (_playerMoney >= _price) then {
	//maybe a player addAction to confirm/cancel, including the price
		_display = ("<t size=""0.9""  color=""#ffffff"">" + (str _ammoTypeRandom) +"</t>") + ("<t size=""0.9""  color=""#ffffff"">" + ("$") + (str _price) +"</t>");
		_playerObject addAction
		[
			_display,	// title
			{ 
				params ["_target", "_caller", "_actionId", "_arguments"]; // script
				_target removeAction _actionId;
				(_arguments select 0) addMagazineCargoGlobal [(_arguments select 1), (_arguments select 2)];
				//[(_arguments select 1),(_arguments select 3),_caller, "ammoOnBox"] remoteExec ['WMS_fnc_BuyFromTrader']; //SMALL TRANSACTION, not buyfromtrader
				[_caller, (_arguments select 3)] remoteExec ['WMS_fnc_smallTransactions'];
			},
			[_boxObject,_ammoTypeRandom,1,_price],		// arguments
			1,		// priority
			true,		// showWindow
			true,		// hideOnUse
			"",			// shortcut
			"(_target distance2D _this) < 50", 	// condition
			//"", 	// condition
			5,			// radius
			false,		// unconscious
			"",			// selection
			""			// memoryPoint
		];
		//_boxObject addMagazineCargoGlobal [_ammoType, 1];
		/*
		profileNamespace setVariable [_playerUID_Exilemoney,(_playerMoney-_price)]; //here it will adjust the player money BEFORE he click on the AddAction
		_playerObject setVariable ["ExileMoney", _playerMoney, true];
		saveProfileNamespace;*/
	} else {
		//Too Poor remoteExec message
	};
};

