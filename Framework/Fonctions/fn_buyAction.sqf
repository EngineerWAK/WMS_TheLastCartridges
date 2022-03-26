/*this addAction ["Buy a Vehicle", {
	if ((_this select 1) getVariable ["ExileMoney", 0] > 1000) then {
		[(_this select 1), "vehicle", 1000] remoteExec ["WMS_fnc_buyAction"];
	} else {
		"Dude! get some money first!" remoteExec ["hint", (owner (_this select 1))];
	};
	}
	];//params ["_target", "_caller", "_actionId", "_arguments"];
*/
/*this addAction ["Buy a Choppa", {
	if ((_this select 1) getVariable ["ExileMoney", 0] > 1000) then {
		[(_this select 1), "chopper", 1000] remoteExec ["WMS_fnc_buyAction"];
	} else {
		"Dude! get some money first!" remoteExec ["hint", (owner (_this select 1))];
	};
	}
	];//params ["_target", "_caller", "_actionId", "_arguments"];
*/
/*
this addAction
[
	"title",	// title
	{
		params ["_target", "_caller", "_actionId", "_arguments"]; // script
	},
	nil,		// arguments
	1.5,		// priority
	true,		// showWindow
	true,		// hideOnUse
	"",			// shortcut
	"true", 	// condition
	50,			// radius
	false,		// unconscious
	"",			// selection
	""			// memoryPoint
];
*/
private ["_vhlList","_veh","_smoke","_msgHint","_pos","_dir"];
params [
	"_caller",
	"_buyType", //"vehicle", "chopper"
	"_price"
];

_targetUID = getPlayerUID _caller;
_targetOwner = (owner _caller);
_playerUID_ExileMoney = "ExileMoney_"+_targetUID;
_playerMoney = profileNamespace getVariable [_playerUID_Exilemoney,0];
_veh = objNull;
_vhlList = [];
if (_buyType == "vehicle") then {
	_vhlList = getArray(missionConfigFile >> "CfgVehicleCategories" >> "CarsToBuy" >> "items");
} else {
	if (_buyType == "chopper") then {
		_vhlList = getArray(missionConfigFile >> "CfgVehicleCategories" >> "ChoppersToBuy" >> "items");
	} else {
		//next here //if () then {} else {};
	};
};

if (_playerMoney >= _price && (count _vhlList != 0)) then {
	_vhl = selectRandom _vhlList;
	_pos = position _caller findEmptyPosition [5,50,_vhl];
	if !(count _pos == 0) then {
		_veh = createVehicle [_vhl, _pos, [], 0, "NONE"];
	} else {
		_veh = createVehicle [_vhl, position _caller, [], 50, "NONE"];
	};
	_veh setDir (random 359);
	_veh setOwner _targetOwner;
	_veh setVariable ["BuyerOwner", _targetUID, true];
	_veh setVariable ["MarketPrice", _price, true];
	_smoke = "smokeShellGreen" createVehicle position _veh;
	_smoke attachTo [_veh, [0,0,0]];
	clearMagazineCargoGlobal _veh; 
	clearWeaponCargoGlobal _veh; 
	clearItemCargoGlobal _veh; 
	clearBackpackCargoGlobal _veh;
	_veh setVehicleLock "LOCKED";
	_veh lockInventory true;
	[_veh,_targetOwner]call WMS_fnc_initVehicleAddAction;

	profileNamespace setVariable [_playerUID_Exilemoney,(_playerMoney-_price)];
	_caller setVariable ["ExileMoney", _playerMoney, true];
	saveProfileNamespace;

	_msgHint = format ["Congrat, vehicle %1m away, dir %2", round (_caller Distance2D _veh), round ([_caller,_veh] call BIS_fnc_relativeDirTo)];
	_msgHint remoteExec ["hint", _targetOwner];
	[_msgHint] remoteExecCall ['SystemChat',_targetOwner];
} else {
	["Something went wrong"] remoteExecCall ['SystemChat',_targetOwner];
};

