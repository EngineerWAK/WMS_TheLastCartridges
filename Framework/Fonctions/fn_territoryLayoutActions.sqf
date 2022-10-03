/**
 * WMS_fnc_territoryLayoutActions
 *
 * TNA-Community
 * https://discord.gg/Zs23URtjwF
 * © 2021 {|||TNA|||}WAKeupneo
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
//[_flag]call WMS_fnc_initFlagAddActions;
params[
	"_flag",
	["_caller", -2],
	["_jip", true]
];
if (true) then {diag_log format ["[INIT_FLAG_ACTIONS]|WAK|TNA|WMS|UPDATE: _this %1", _this]};

/*
switch (tolower _layout) do
{	//lvl 1
	case "bunkercamp": {_objects = _bunkercamp;};
	//lvl 2
	case "bunkercampbigger": {_objects = _bunkercampbigger;};
	case "helipadsmall": {_objects = _bunkerCamp_HelipadSmall;};
	//lvl 3
	case "cargopatrol": {_objects = _bunkercampCargoPatrol;};
	case "helipad": {_objects = _bunkerCamp_Helipad;};
	//lvl 4
	case "helipadbig": {_objects = _bunkercamp_helipadBig;};
	//lvl 5
	case "helipadosorusrex": {_objects = _BunkerCamp_hepipadosorusRex;};
	case "nabuconosorusCamp": {_objects = _nabuconosorusCamp;};
};*/
[ //params ["_target", "_caller", "_actionId", "_arguments"]; //condition: _target = object, _this = caller
	_flag,
	[
		"<t size='0.9' color='#80c606'>Farm Camp LvL1, (3k), after restart</t>",//_display,
		"	
			_target = _this select 0; _caller = _this select 1;
			_target setVariable ['_layoutUpgradable', false, true];
			[_target, _caller, 3000, 'farmcamp', 'restart'] remoteExec ['WMS_fnc_territoryLayoutUpgrade', 2];
			hint 'Congratulation!';

		",
		[], //argument accessible in the script (_this select 3)
		1,
		true,
		true,
		"",
		"
		(alive _target) &&
		{(_target getVariable ['_layoutUpgradable', true])} &&
		{((_target getVariable ['exileterritorylevel', -1]) > 0)} &&
		{((_target getVariable ['exileterritorylevel', -1]) < 4)} &&
		{((_target getVariable ['WMS_BuyerOwner', -1]) == (getPlayerUID _this))} &&
		{((_this getVariable ['exileMoney', 0]) > 3000)} &&
		{(vehicle _this == _this)};
		",
		5
	]
] remoteExec [
	"addAction",
	_caller,
	_jip
];
[ //params ["_target", "_caller", "_actionId", "_arguments"]; //condition: _target = object, _this = caller
	_flag,
	[
		"<t size='0.9' color='#80c606'>Farm Camp LvL1, (5k) right now</t>",//_display,
		"	
			_target = _this select 0; _caller = _this select 1;
			_target setVariable ['_layoutUpgradable', false, true];
			[_target, _caller, 5000, 'farmcamp', 'rightnow'] remoteExec ['WMS_fnc_territoryLayoutUpgrade', 2];
			hint 'Congratulation!';

		",
		[], //argument accessible in the script (_this select 3)
		1,
		true,
		true,
		"",
		"
		(alive _target) &&
		{(_target getVariable ['_layoutUpgradable', true])} &&
		{((_target getVariable ['exileterritorylevel', -1]) > 0)} &&
		{((_target getVariable ['exileterritorylevel', -1]) < 4)} &&
		{((_target getVariable ['WMS_BuyerOwner', -1]) == (getPlayerUID _this))} &&
		{((_this getVariable ['exileMoney', 0]) > 5000)} &&
		{(vehicle _this == _this)};
		",
		5
	]
] remoteExec [
	"addAction",
	_caller,
	_jip
];

[ //params ["_target", "_caller", "_actionId", "_arguments"]; //condition: _target = object, _this = caller
	_flag,
	[
		"<t size='0.9' color='#80c606'>WaterWorld LvL1, (3k), after restart</t>",//_display,
		"	
			_target = _this select 0; _caller = _this select 1;
			_target setVariable ['_layoutUpgradable', false, true];
			[_target, _caller, 3000, 'waterworldlvl1', 'restart'] remoteExec ['WMS_fnc_territoryLayoutUpgrade', 2];
			hint 'Congratulation!';

		",
		[], //argument accessible in the script (_this select 3)
		1,
		true,
		true,
		"",
		"
		(surfaceIsWater (position _target)) &&
		{(_target getVariable ['_layoutUpgradable', true])} &&
		{((_target getVariable ['exileterritorylevel', -1]) > 0)} &&
		{((_target getVariable ['exileterritorylevel', -1]) < 4)} &&
		{((_target getVariable ['WMS_BuyerOwner', -1]) == (getPlayerUID _this))} &&
		{((_this getVariable ['exileMoney', 0]) > 3000)} &&
		{(vehicle _this == _this)};
		",
		5
	]
] remoteExec [
	"addAction",
	_caller,
	_jip
];
[ //params ["_target", "_caller", "_actionId", "_arguments"]; //condition: _target = object, _this = caller
	_flag,
	[
		"<t size='0.9' color='#80c606'>WaterWorld LvL1, (5k) right now</t>",//_display,
		"	
			_target = _this select 0; _caller = _this select 1;
			_target setVariable ['_layoutUpgradable', false, true];
			[_target, _caller, 5000, 'waterworldlvl1', 'rightnow'] remoteExec ['WMS_fnc_territoryLayoutUpgrade', 2];
			hint 'Congratulation!';

		",
		[], //argument accessible in the script (_this select 3)
		1,
		true,
		true,
		"",
		"
		(surfaceIsWater (position _target)) &&
		{(_target getVariable ['_layoutUpgradable', true])} &&
		{((_target getVariable ['exileterritorylevel', -1]) > 0)} &&
		{((_target getVariable ['exileterritorylevel', -1]) < 4)} &&
		{((_target getVariable ['WMS_BuyerOwner', -1]) == (getPlayerUID _this))} &&
		{((_this getVariable ['exileMoney', 0]) > 5000)} &&
		{(vehicle _this == _this)};
		",
		5
	]
] remoteExec [
	"addAction",
	_caller,
	_jip
];
[ //params ["_target", "_caller", "_actionId", "_arguments"]; //condition: _target = object, _this = caller
	_flag,
	[
		"<t size='0.9' color='#80c606'>Bunkers Camp LvL2, (5k), after restart</t>",//_display,
		"	
			_target = _this select 0; _caller = _this select 1;
			_target setVariable ['_layoutUpgradable', false, true];
			[_target, _caller, 5000, 'bunkercampbigger', 'restart'] remoteExec ['WMS_fnc_territoryLayoutUpgrade', 2];
			hint 'Congratulation!';

		",
		[], //argument accessible in the script (_this select 3)
		1,
		true,
		true,
		"",
		"
		(alive _target) &&
		{(_target getVariable ['_layoutUpgradable', true])} &&
		{((_target getVariable ['exileterritorylevel', -1]) > 1)} &&
		{((_target getVariable ['exileterritorylevel', -1]) < 4)} &&
		{((_target getVariable ['WMS_BuyerOwner', -1]) == (getPlayerUID _this))} &&
		{((_this getVariable ['exileMoney', 0]) > 5000)} &&
		{(vehicle _this == _this)};
		",
		5
	]
] remoteExec [
	"addAction",
	_caller,
	_jip
];
[ //params ["_target", "_caller", "_actionId", "_arguments"]; //condition: _target = object, _this = caller
	_flag,
	[
		"<t size='0.9' color='#80c606'>Bunkers Camp LvL2, (8k) right now</t>",//_display,
		"	
			_target = _this select 0; _caller = _this select 1;
			_target setVariable ['_layoutUpgradable', false, true];
			[_target, _caller, 8000, 'bunkercampbigger', 'rightnow'] remoteExec ['WMS_fnc_territoryLayoutUpgrade', 2];
			hint 'Congratulation!';

		",
		[], //argument accessible in the script (_this select 3)
		1,
		true,
		true,
		"",
		"
		(alive _target) &&
		{(_target getVariable ['_layoutUpgradable', true])} &&
		{((_target getVariable ['exileterritorylevel', -1]) > 1)} &&
		{((_target getVariable ['exileterritorylevel', -1]) < 4)} &&
		{((_target getVariable ['WMS_BuyerOwner', -1]) == (getPlayerUID _this))} &&
		{((_this getVariable ['exileMoney', 0]) > 8000)} &&
		{(vehicle _this == _this)};
		",
		5
	]
] remoteExec [
	"addAction",
	_caller,
	_jip
];
[ //params ["_target", "_caller", "_actionId", "_arguments"]; //condition: _target = object, _this = caller
	_flag,
	[
		"<t size='0.9' color='#80c606'>Farm Camp LvL2, (5k), after restart</t>",//_display,
		"	
			_target = _this select 0; _caller = _this select 1;
			_target setVariable ['_layoutUpgradable', false, true];
			[_target, _caller, 5000, 'farmcampbigger', 'restart'] remoteExec ['WMS_fnc_territoryLayoutUpgrade', 2];
			hint 'Congratulation!';

		",
		[], //argument accessible in the script (_this select 3)
		1,
		true,
		true,
		"",
		"
		(alive _target) &&
		{(_target getVariable ['_layoutUpgradable', true])} &&
		{((_target getVariable ['exileterritorylevel', -1]) > 1)} &&
		{((_target getVariable ['exileterritorylevel', -1]) < 4)} &&
		{((_target getVariable ['WMS_BuyerOwner', -1]) == (getPlayerUID _this))} &&
		{((_this getVariable ['exileMoney', 0]) > 5000)} &&
		{(vehicle _this == _this)};
		",
		5
	]
] remoteExec [
	"addAction",
	_caller,
	_jip
];
[ //params ["_target", "_caller", "_actionId", "_arguments"]; //condition: _target = object, _this = caller
	_flag,
	[
		"<t size='0.9' color='#80c606'>Farm Camp LvL2, (8k) right now</t>",//_display,
		"	
			_target = _this select 0; _caller = _this select 1;
			_target setVariable ['_layoutUpgradable', false, true];
			[_target, _caller, 8000, 'farmcampbigger', 'rightnow'] remoteExec ['WMS_fnc_territoryLayoutUpgrade', 2];
			hint 'Congratulation!';

		",
		[], //argument accessible in the script (_this select 3)
		1,
		true,
		true,
		"",
		"
		(alive _target) &&
		{(_target getVariable ['_layoutUpgradable', true])} &&
		{((_target getVariable ['exileterritorylevel', -1]) > 1)} &&
		{((_target getVariable ['exileterritorylevel', -1]) < 4)} &&
		{((_target getVariable ['WMS_BuyerOwner', -1]) == (getPlayerUID _this))} &&
		{((_this getVariable ['exileMoney', 0]) > 8000)} &&
		{(vehicle _this == _this)};
		",
		5
	]
] remoteExec [
	"addAction",
	_caller,
	_jip
];
[ //params ["_target", "_caller", "_actionId", "_arguments"]; //condition: _target = object, _this = caller
	_flag,
	[
		"<t size='0.9' color='#80c606'>Helipad Camp LvL2, (5k), after restart</t>",//_display,
		"	
			_target = _this select 0; _caller = _this select 1;
			_target setVariable ['_layoutUpgradable', false, true];
			[_target, _caller, 5000, 'helipadsmall', 'restart'] remoteExec ['WMS_fnc_territoryLayoutUpgrade', 2];
			hint 'Congratulation!';

		",
		[], //argument accessible in the script (_this select 3)
		1,
		true,
		true,
		"",
		"
		(alive _target) &&
		{(_target getVariable ['_layoutUpgradable', true])} &&
		{((_target getVariable ['exileterritorylevel', -1]) > 1)} &&
		{((_target getVariable ['exileterritorylevel', -1]) < 4)} &&
		{((_target getVariable ['WMS_BuyerOwner', -1]) == (getPlayerUID _this))} &&
		{((_this getVariable ['exileMoney', 0]) > 5000)} &&
		{(vehicle _this == _this)};
		",
		5
	]
] remoteExec [
	"addAction",
	_caller,
	_jip
];
[ //params ["_target", "_caller", "_actionId", "_arguments"]; //condition: _target = object, _this = caller
	_flag,
	[
		"<t size='0.9' color='#80c606'>Helipad Camp LvL2, (8k) right now</t>",//_display,
		"	
			_target = _this select 0; _caller = _this select 1;
			_target setVariable ['_layoutUpgradable', false, true];
			[_target, _caller, 8000, 'helipadsmall', 'rightnow'] remoteExec ['WMS_fnc_territoryLayoutUpgrade', 2];
			hint 'Congratulation!';

		",
		[], //argument accessible in the script (_this select 3)
		1,
		true,
		true,
		"",
		"
		(alive _target) &&
		{(_target getVariable ['_layoutUpgradable', true])} &&
		{((_target getVariable ['exileterritorylevel', -1]) > 1)} &&
		{((_target getVariable ['exileterritorylevel', -1]) < 4)} &&
		{((_target getVariable ['WMS_BuyerOwner', -1]) == (getPlayerUID _this))} &&
		{((_this getVariable ['exileMoney', 0]) > 8000)} &&
		{(vehicle _this == _this)};
		",
		5
	]
] remoteExec [
	"addAction",
	_caller,
	_jip
];
/////
[ //params ["_target", "_caller", "_actionId", "_arguments"]; //condition: _target = object, _this = caller
	_flag,
	[
		"<t size='0.9' color='#80c606'>WaterWorld LvL2, (5k), after restart</t>",//_display,
		"	
			_target = _this select 0; _caller = _this select 1;
			_target setVariable ['_layoutUpgradable', false, true];
			[_target, _caller, 5000, 'waterworldlvl2', 'restart'] remoteExec ['WMS_fnc_territoryLayoutUpgrade', 2];
			hint 'Congratulation!';

		",
		[], //argument accessible in the script (_this select 3)
		1,
		true,
		true,
		"",
		"
		(surfaceIsWater (position _target)) &&
		{(_target getVariable ['_layoutUpgradable', true])} &&
		{((_target getVariable ['exileterritorylevel', -1]) > 1)} &&
		{((_target getVariable ['exileterritorylevel', -1]) < 4)} &&
		{((_target getVariable ['WMS_BuyerOwner', -1]) == (getPlayerUID _this))} &&
		{((_this getVariable ['exileMoney', 0]) > 5000)} &&
		{(vehicle _this == _this)};
		",
		5
	]
] remoteExec [
	"addAction",
	_caller,
	_jip
];
[ //params ["_target", "_caller", "_actionId", "_arguments"]; //condition: _target = object, _this = caller
	_flag,
	[
		"<t size='0.9' color='#80c606'>Helipad Camp LvL2, (8k) right now</t>",//_display,
		"	
			_target = _this select 0; _caller = _this select 1;
			_target setVariable ['_layoutUpgradable', false, true];
			[_target, _caller, 8000, 'waterworldlvl2', 'rightnow'] remoteExec ['WMS_fnc_territoryLayoutUpgrade', 2];
			hint 'Congratulation!';

		",
		[], //argument accessible in the script (_this select 3)
		1,
		true,
		true,
		"",
		"
		(surfaceIsWater (position _target)) &&
		{(_target getVariable ['_layoutUpgradable', true])} &&
		{((_target getVariable ['exileterritorylevel', -1]) > 1)} &&
		{((_target getVariable ['exileterritorylevel', -1]) < 4)} &&
		{((_target getVariable ['WMS_BuyerOwner', -1]) == (getPlayerUID _this))} &&
		{((_this getVariable ['exileMoney', 0]) > 8000)} &&
		{(vehicle _this == _this)};
		",
		5
	]
] remoteExec [
	"addAction",
	_caller,
	_jip
];
[ //params ["_target", "_caller", "_actionId", "_arguments"]; //condition: _target = object, _this = caller
	_flag,
	[
		"<t size='0.9' color='#80c606'>Cargo Post Camp LvL3, (10k), after restart</t>",//_display,
		"	
			_target = _this select 0; _caller = _this select 1;
			_target setVariable ['_layoutUpgradable', false, true];
			[_target, _caller, 10000, 'cargopatrol', 'restart'] remoteExec ['WMS_fnc_territoryLayoutUpgrade', 2];
			hint 'Congratulation!';

		",
		[], //argument accessible in the script (_this select 3)
		1,
		true,
		true,
		"",
		"
		(alive _target) &&
		{(_target getVariable ['_layoutUpgradable', true])} &&
		{((_target getVariable ['exileterritorylevel', -1]) > 2)} &&
		{((_target getVariable ['exileterritorylevel', -1]) < 4)} &&
		{((_target getVariable ['WMS_BuyerOwner', -1]) == (getPlayerUID _this))} &&
		{((_this getVariable ['exileMoney', 0]) > 10000)} &&
		{(vehicle _this == _this)};
		",
		5
	]
] remoteExec [
	"addAction",
	_caller,
	_jip
];
[ //params ["_target", "_caller", "_actionId", "_arguments"]; //condition: _target = object, _this = caller
	_flag,
	[
		"<t size='0.9' color='#80c606'>Cargo Post camp LvL3, (15k) right now</t>",//_display,
		"	
			_target = _this select 0; _caller = _this select 1;
			_target setVariable ['_layoutUpgradable', false, true];
			[_target, _caller, 15000, 'cargopatrol', 'rightnow'] remoteExec ['WMS_fnc_territoryLayoutUpgrade', 2];
			hint 'Congratulation!';

		",
		[], //argument accessible in the script (_this select 3)
		1,
		true,
		true,
		"",
		"
		(alive _target) &&
		{(_target getVariable ['_layoutUpgradable', true])} &&
		{((_target getVariable ['exileterritorylevel', -1]) > 2)} &&
		{((_target getVariable ['exileterritorylevel', -1]) < 4)} &&
		{((_target getVariable ['WMS_BuyerOwner', -1]) == (getPlayerUID _this))} &&
		{((_this getVariable ['exileMoney', 0]) > 15000)} &&
		{(vehicle _this == _this)};
		",
		5
	]
] remoteExec [
	"addAction",
	_caller,
	_jip
];
/////
[ //params ["_target", "_caller", "_actionId", "_arguments"]; //condition: _target = object, _this = caller
	_flag,
	[
		"<t size='0.9' color='#80c606'>Helipad Camp LvL3, (10k), after restart</t>",//_display,
		"	
			_target = _this select 0; _caller = _this select 1;
			_target setVariable ['_layoutUpgradable', false, true];
			[_target, _caller, 10000, 'helipad', 'restart'] remoteExec ['WMS_fnc_territoryLayoutUpgrade', 2];
			hint 'Congratulation!';

		",
		[], //argument accessible in the script (_this select 3)
		1,
		true,
		true,
		"",
		"
		(alive _target) &&
		{(_target getVariable ['_layoutUpgradable', true])} &&
		{((_target getVariable ['exileterritorylevel', -1]) > 2)} &&
		{((_target getVariable ['exileterritorylevel', -1]) < 4)} &&
		{((_target getVariable ['WMS_BuyerOwner', -1]) == (getPlayerUID _this))} &&
		{((_this getVariable ['exileMoney', 0]) > 10000)} &&
		{(vehicle _this == _this)};
		",
		5
	]
] remoteExec [
	"addAction",
	_caller,
	_jip
];
[ //params ["_target", "_caller", "_actionId", "_arguments"]; //condition: _target = object, _this = caller
	_flag,
	[
		"<t size='0.9' color='#80c606'>Helipad Camp LvL3, (15k) right now</t>",//_display,
		"	
			_target = _this select 0; _caller = _this select 1;
			_target setVariable ['_layoutUpgradable', false, true];
			[_target, _caller, 15000, 'helipad', 'rightnow'] remoteExec ['WMS_fnc_territoryLayoutUpgrade', 2];
			hint 'Congratulation!';

		",
		[], //argument accessible in the script (_this select 3)
		1,
		true,
		true,
		"",
		"
		(alive _target) &&
		{(_target getVariable ['_layoutUpgradable', true])} &&
		{((_target getVariable ['exileterritorylevel', -1]) > 2)} &&
		{((_target getVariable ['exileterritorylevel', -1]) < 4)} &&
		{((_target getVariable ['WMS_BuyerOwner', -1]) == (getPlayerUID _this))} &&
		{((_this getVariable ['exileMoney', 0]) > 15000)} &&
		{(vehicle _this == _this)};
		",
		5
	]
] remoteExec [
	"addAction",
	_caller,
	_jip
];
/////
[ //params ["_target", "_caller", "_actionId", "_arguments"]; //condition: _target = object, _this = caller
	_flag,
	[
		"<t size='0.9' color='#80c606'>Farm LvL3, (10k), after restart</t>",//_display,
		"	
			_target = _this select 0; _caller = _this select 1;
			_target setVariable ['_layoutUpgradable', false, true];
			[_target, _caller, 10000, 'farm', 'restart'] remoteExec ['WMS_fnc_territoryLayoutUpgrade', 2];
			hint 'Congratulation!';

		",
		[], //argument accessible in the script (_this select 3)
		1,
		true,
		true,
		"",
		"
		(alive _target) &&
		{(_target getVariable ['_layoutUpgradable', true])} &&
		{((_target getVariable ['exileterritorylevel', -1]) > 2)} &&
		{((_target getVariable ['exileterritorylevel', -1]) < 4)} &&
		{((_target getVariable ['WMS_BuyerOwner', -1]) == (getPlayerUID _this))} &&
		{((_this getVariable ['exileMoney', 0]) > 10000)} &&
		{(vehicle _this == _this)};
		",
		5
	]
] remoteExec [
	"addAction",
	_caller,
	_jip
];
[ //params ["_target", "_caller", "_actionId", "_arguments"]; //condition: _target = object, _this = caller
	_flag,
	[
		"<t size='0.9' color='#80c606'>Farm LvL3, (15k) right now</t>",//_display,
		"	
			_target = _this select 0; _caller = _this select 1;
			_target setVariable ['_layoutUpgradable', false, true];
			[_target, _caller, 15000, 'farm', 'rightnow'] remoteExec ['WMS_fnc_territoryLayoutUpgrade', 2];
			hint 'Congratulation!';

		",
		[], //argument accessible in the script (_this select 3)
		1,
		true,
		true,
		"",
		"
		(alive _target) &&
		{(_target getVariable ['_layoutUpgradable', true])} &&
		{((_target getVariable ['exileterritorylevel', -1]) > 2)} &&
		{((_target getVariable ['exileterritorylevel', -1]) < 4)} &&
		{((_target getVariable ['WMS_BuyerOwner', -1]) == (getPlayerUID _this))} &&
		{((_this getVariable ['exileMoney', 0]) > 15000)} &&
		{(vehicle _this == _this)};
		",
		5
	]
] remoteExec [
	"addAction",
	_caller,
	_jip
];
/////
[ //params ["_target", "_caller", "_actionId", "_arguments"]; //condition: _target = object, _this = caller
	_flag,
	[
		"<t size='0.9' color='#80c606'>WaterWorld LvL3, (10k), after restart</t>",//_display,
		"	
			_target = _this select 0; _caller = _this select 1;
			_target setVariable ['_layoutUpgradable', false, true];
			[_target, _caller, 10000, 'waterworldlvl3', 'restart'] remoteExec ['WMS_fnc_territoryLayoutUpgrade', 2];
			hint 'Congratulation!';

		",
		[], //argument accessible in the script (_this select 3)
		1,
		true,
		true,
		"",
		"
		(surfaceIsWater (position _target)) &&
		{(_target getVariable ['_layoutUpgradable', true])} &&
		{((_target getVariable ['exileterritorylevel', -1]) > 2)} &&
		{((_target getVariable ['exileterritorylevel', -1]) < 4)} &&
		{((_target getVariable ['WMS_BuyerOwner', -1]) == (getPlayerUID _this))} &&
		{((_this getVariable ['exileMoney', 0]) > 10000)} &&
		{(vehicle _this == _this)};
		",
		5
	]
] remoteExec [
	"addAction",
	_caller,
	_jip
];
[ //params ["_target", "_caller", "_actionId", "_arguments"]; //condition: _target = object, _this = caller
	_flag,
	[
		"<t size='0.9' color='#80c606'>WaterWorld LvL3, (15k) right now</t>",//_display,
		"	
			_target = _this select 0; _caller = _this select 1;
			_target setVariable ['_layoutUpgradable', false, true];
			[_target, _caller, 15000, 'waterworldlvl3', 'rightnow'] remoteExec ['WMS_fnc_territoryLayoutUpgrade', 2];
			hint 'Congratulation!';

		",
		[], //argument accessible in the script (_this select 3)
		1,
		true,
		true,
		"",
		"
		(surfaceIsWater (position _target)) &&
		{(_target getVariable ['_layoutUpgradable', true])} &&
		{((_target getVariable ['exileterritorylevel', -1]) > 2)} &&
		{((_target getVariable ['exileterritorylevel', -1]) < 4)} &&
		{((_target getVariable ['WMS_BuyerOwner', -1]) == (getPlayerUID _this))} &&
		{((_this getVariable ['exileMoney', 0]) > 15000)} &&
		{(vehicle _this == _this)};
		",
		5
	]
] remoteExec [
	"addAction",
	_caller,
	_jip
];
/////
[ //params ["_target", "_caller", "_actionId", "_arguments"]; //condition: _target = object, _this = caller
	_flag,
	[
		"<t size='0.9' color='#80c606'>Farm LvL4, (15k), after restart</t>",//_display,
		"	
			_target = _this select 0; _caller = _this select 1;
			_target setVariable ['_layoutUpgradable', false, true];
			[_target, _caller, 15000, 'farmbig', 'restart'] remoteExec ['WMS_fnc_territoryLayoutUpgrade', 2];
			hint 'Congratulation!';

		",
		[], //argument accessible in the script (_this select 3)
		1,
		true,
		true,
		"",
		"
		(alive _target) &&
		{(_target getVariable ['_layoutUpgradable', true])} &&
		{((_target getVariable ['exileterritorylevel', -1]) > 3)} &&
		{((_target getVariable ['WMS_BuyerOwner', -1]) == (getPlayerUID _this))} &&
		{((_this getVariable ['exileMoney', 0]) > 15000)} &&
		{(vehicle _this == _this)};
		",
		5
	]
] remoteExec [
	"addAction",
	_caller,
	_jip
];
[ //params ["_target", "_caller", "_actionId", "_arguments"]; //condition: _target = object, _this = caller
	_flag,
	[
		"<t size='0.9' color='#80c606'>Farm LvL4, (20k) right now</t>",//_display,
		"	
			_target = _this select 0; _caller = _this select 1;
			_target setVariable ['_layoutUpgradable', false, true];
			[_target, _caller, 20000, 'farmbig', 'rightnow'] remoteExec ['WMS_fnc_territoryLayoutUpgrade', 2];
			hint 'Congratulation!';

		",
		[], //argument accessible in the script (_this select 3)
		1,
		true,
		true,
		"",
		"
		(alive _target) &&
		{(_target getVariable ['_layoutUpgradable', true])} &&
		{((_target getVariable ['exileterritorylevel', -1]) > 3)} &&
		{((_target getVariable ['WMS_BuyerOwner', -1]) == (getPlayerUID _this))} &&
		{((_this getVariable ['exileMoney', 0]) > 20000)} &&
		{(vehicle _this == _this)};
		",
		5
	]
] remoteExec [
	"addAction",
	_caller,
	_jip
];
/////
[ //params ["_target", "_caller", "_actionId", "_arguments"]; //condition: _target = object, _this = caller
	_flag,
	[
		"<t size='0.9' color='#80c606'>Helipad Camp LvL4, (15k), after restart</t>",//_display,
		"	
			_target = _this select 0; _caller = _this select 1;
			_target setVariable ['_layoutUpgradable', false, true];
			[_target, _caller, 15000, 'helipadbig', 'restart'] remoteExec ['WMS_fnc_territoryLayoutUpgrade', 2];
			hint 'Congratulation!';

		",
		[], //argument accessible in the script (_this select 3)
		1,
		true,
		true,
		"",
		"
		(alive _target) &&
		{(_target getVariable ['_layoutUpgradable', true])} &&
		{((_target getVariable ['exileterritorylevel', -1]) > 3)} &&
		{((_target getVariable ['WMS_BuyerOwner', -1]) == (getPlayerUID _this))} &&
		{((_this getVariable ['exileMoney', 0]) > 15000)} &&
		{(vehicle _this == _this)};
		",
		5
	]
] remoteExec [
	"addAction",
	_caller,
	_jip
];
[ //params ["_target", "_caller", "_actionId", "_arguments"]; //condition: _target = object, _this = caller
	_flag,
	[
		"<t size='0.9' color='#80c606'>Helipad Camp LvL4, (20k) right now</t>",//_display,
		"	
			_target = _this select 0; _caller = _this select 1;
			_target setVariable ['_layoutUpgradable', false, true];
			[_target, _caller, 20000, 'helipadbig', 'rightnow'] remoteExec ['WMS_fnc_territoryLayoutUpgrade', 2];
			hint 'Congratulation!';

		",
		[], //argument accessible in the script (_this select 3)
		1,
		true,
		true,
		"",
		"
		(alive _target) &&
		{(_target getVariable ['_layoutUpgradable', true])} &&
		{((_target getVariable ['exileterritorylevel', -1]) > 3)} &&
		{((_target getVariable ['WMS_BuyerOwner', -1]) == (getPlayerUID _this))} &&
		{((_this getVariable ['exileMoney', 0]) > 20000)} &&
		{(vehicle _this == _this)};
		",
		5
	]
] remoteExec [
	"addAction",
	_caller,
	_jip
];
/////
[ //params ["_target", "_caller", "_actionId", "_arguments"]; //condition: _target = object, _this = caller
	_flag,
	[
		"<t size='0.9' color='#80c606'>Bunker Camp LvL4, (15k), after restart</t>",//_display,
		"	
			_target = _this select 0; _caller = _this select 1;
			_target setVariable ['_layoutUpgradable', false, true];
			[_target, _caller, 15000, 'bunkerbig', 'restart'] remoteExec ['WMS_fnc_territoryLayoutUpgrade', 2];
			hint 'Congratulation!';

		",
		[], //argument accessible in the script (_this select 3)
		1,
		true,
		true,
		"",
		"
		(alive _target) &&
		{(_target getVariable ['_layoutUpgradable', true])} &&
		{((_target getVariable ['exileterritorylevel', -1]) > 3)} &&
		{((_target getVariable ['WMS_BuyerOwner', -1]) == (getPlayerUID _this))} &&
		{((_this getVariable ['exileMoney', 0]) > 15000)} &&
		{(vehicle _this == _this)};
		",
		5
	]
] remoteExec [
	"addAction",
	_caller,
	_jip
];
[ //params ["_target", "_caller", "_actionId", "_arguments"]; //condition: _target = object, _this = caller
	_flag,
	[
		"<t size='0.9' color='#80c606'>Bunker Camp LvL4, (20k) right now</t>",//_display,
		"	
			_target = _this select 0; _caller = _this select 1;
			_target setVariable ['_layoutUpgradable', false, true];
			[_target, _caller, 20000, 'bunkerbig', 'rightnow'] remoteExec ['WMS_fnc_territoryLayoutUpgrade', 2];
			hint 'Congratulation!';

		",
		[], //argument accessible in the script (_this select 3)
		1,
		true,
		true,
		"",
		"
		(alive _target) &&
		{(_target getVariable ['_layoutUpgradable', true])} &&
		{((_target getVariable ['exileterritorylevel', -1]) > 3)} &&
		{((_target getVariable ['WMS_BuyerOwner', -1]) == (getPlayerUID _this))} &&
		{((_this getVariable ['exileMoney', 0]) > 20000)} &&
		{(vehicle _this == _this)};
		",
		5
	]
] remoteExec [
	"addAction",
	_caller,
	_jip
];
/////
[ //params ["_target", "_caller", "_actionId", "_arguments"]; //condition: _target = object, _this = caller
	_flag,
	[
		"<t size='0.9' color='#80c606'>FOB 45x45 LvL4, (15k), after restart</t>",//_display,
		"	
			_target = _this select 0; _caller = _this select 1;
			_target setVariable ['_layoutUpgradable', false, true];
			[_target, _caller, 15000, 'FOB_45x45', 'restart'] remoteExec ['WMS_fnc_territoryLayoutUpgrade', 2];
			hint 'Congratulation!';

		",
		[], //argument accessible in the script (_this select 3)
		1,
		true,
		true,
		"",
		"
		(alive _target) &&
		{(_target getVariable ['_layoutUpgradable', true])} &&
		{((_target getVariable ['exileterritorylevel', -1]) > 3)} &&
		{((_target getVariable ['WMS_BuyerOwner', -1]) == (getPlayerUID _this))} &&
		{((_this getVariable ['exileMoney', 0]) > 15000)} &&
		{(vehicle _this == _this)};
		",
		5
	]
] remoteExec [
	"addAction",
	_caller,
	_jip
];
[ //params ["_target", "_caller", "_actionId", "_arguments"]; //condition: _target = object, _this = caller
	_flag,
	[
		"<t size='0.9' color='#80c606'>FOB 45x45 LvL4, (20k) right now</t>",//_display,
		"	
			_target = _this select 0; _caller = _this select 1;
			_target setVariable ['_layoutUpgradable', false, true];
			[_target, _caller, 20000, 'FOB_45x45', 'rightnow'] remoteExec ['WMS_fnc_territoryLayoutUpgrade', 2];
			hint 'Congratulation!';

		",
		[], //argument accessible in the script (_this select 3)
		1,
		true,
		true,
		"",
		"
		(alive _target) &&
		{(_target getVariable ['_layoutUpgradable', true])} &&
		{((_target getVariable ['exileterritorylevel', -1]) > 3)} &&
		{((_target getVariable ['WMS_BuyerOwner', -1]) == (getPlayerUID _this))} &&
		{((_this getVariable ['exileMoney', 0]) > 20000)} &&
		{(vehicle _this == _this)};
		",
		5
	]
] remoteExec [
	"addAction",
	_caller,
	_jip
];
/////
[ //params ["_target", "_caller", "_actionId", "_arguments"]; //condition: _target = object, _this = caller
	_flag,
	[
		"<t size='0.9' color='#80c606'>WaterWorld LvL4, (15k), after restart</t>",//_display,
		"	
			_target = _this select 0; _caller = _this select 1;
			_target setVariable ['_layoutUpgradable', false, true];
			[_target, _caller, 15000, 'waterworldlvl4', 'restart'] remoteExec ['WMS_fnc_territoryLayoutUpgrade', 2];
			hint 'Congratulation!';

		",
		[], //argument accessible in the script (_this select 3)
		1,
		true,
		true,
		"",
		"
		(surfaceIsWater (position _target)) &&
		{(_target getVariable ['_layoutUpgradable', true])} &&
		{((_target getVariable ['exileterritorylevel', -1]) > 3)} &&
		{((_target getVariable ['WMS_BuyerOwner', -1]) == (getPlayerUID _this))} &&
		{((_this getVariable ['exileMoney', 0]) > 15000)} &&
		{(vehicle _this == _this)};
		",
		5
	]
] remoteExec [
	"addAction",
	_caller,
	_jip
];
[ //params ["_target", "_caller", "_actionId", "_arguments"]; //condition: _target = object, _this = caller
	_flag,
	[
		"<t size='0.9' color='#80c606'>WaterWorld LvL4, (20k) right now</t>",//_display,
		"	
			_target = _this select 0; _caller = _this select 1;
			_target setVariable ['_layoutUpgradable', false, true];
			[_target, _caller, 20000, 'waterworldlvl4', 'rightnow'] remoteExec ['WMS_fnc_territoryLayoutUpgrade', 2];
			hint 'Congratulation!';

		",
		[], //argument accessible in the script (_this select 3)
		1,
		true,
		true,
		"",
		"
		(surfaceIsWater (position _target)) &&
		{(_target getVariable ['_layoutUpgradable', true])} &&
		{((_target getVariable ['exileterritorylevel', -1]) > 3)} &&
		{((_target getVariable ['WMS_BuyerOwner', -1]) == (getPlayerUID _this))} &&
		{((_this getVariable ['exileMoney', 0]) > 20000)} &&
		{(vehicle _this == _this)};
		",
		5
	]
] remoteExec [
	"addAction",
	_caller,
	_jip
];
/////
[ //params ["_target", "_caller", "_actionId", "_arguments"]; //condition: _target = object, _this = caller
	_flag,
	[
		"<t size='0.9' color='#80c606'>HeliPadosorusRex LvL5, (20k), after restart</t>",//_display,
		"	
			_target = _this select 0; _caller = _this select 1;
			_target setVariable ['_layoutUpgradable', false, true];
			[_target, _caller, 20000, 'helipadosorusrex', 'restart'] remoteExec ['WMS_fnc_territoryLayoutUpgrade', 2];
			hint 'Congratulation!';

		",
		[], //argument accessible in the script (_this select 3)
		1,
		true,
		true,
		"",
		"
		(alive _target) &&
		{(_target getVariable ['_layoutUpgradable', true])} &&
		{((_target getVariable ['exileterritorylevel', -1]) > 4)} &&
		{((_target getVariable ['WMS_BuyerOwner', -1]) == (getPlayerUID _this))} &&
		{((_this getVariable ['exileMoney', 0]) > 20000)} &&
		{(vehicle _this == _this)};
		",
		5
	]
] remoteExec [
	"addAction",
	_caller,
	_jip
];
[ //params ["_target", "_caller", "_actionId", "_arguments"]; //condition: _target = object, _this = caller
	_flag,
	[
		"<t size='0.9' color='#80c606'>HeliPadosorusRex LvL5, (25k) right now</t>",//_display,
		"	
			_target = _this select 0; _caller = _this select 1;
			_target setVariable ['_layoutUpgradable', false, true];
			[_target, _caller, 25000, 'helipadosorusrex', 'rightnow'] remoteExec ['WMS_fnc_territoryLayoutUpgrade', 2];
			hint 'Congratulation!';

		",
		[], //argument accessible in the script (_this select 3)
		1,
		true,
		true,
		"",
		"
		(alive _target) &&
		{(_target getVariable ['_layoutUpgradable', true])} &&
		{((_target getVariable ['exileterritorylevel', -1]) > 4)} &&
		{((_target getVariable ['WMS_BuyerOwner', -1]) == (getPlayerUID _this))} &&
		{((_this getVariable ['exileMoney', 0]) > 25000)} &&
		{(vehicle _this == _this)};
		",
		5
	]
] remoteExec [
	"addAction",
	_caller,
	_jip
];
/////
[ //params ["_target", "_caller", "_actionId", "_arguments"]; //condition: _target = object, _this = caller
	_flag,
	[
		"<t size='0.9' color='#80c606'>NabuconosorusCamp LvL5, (25k), after restart</t>",//_display,
		"	
			_target = _this select 0; _caller = _this select 1;
			_target setVariable ['_layoutUpgradable', false, true];
			[_target, _caller, 25000, 'nabuconosorusCamp', 'restart'] remoteExec ['WMS_fnc_territoryLayoutUpgrade', 2];
			hint 'Congratulation!';

		",
		[], //argument accessible in the script (_this select 3)
		1,
		true,
		true,
		"",
		"
		(alive _target) &&
		{(_target getVariable ['_layoutUpgradable', true])} &&
		{((_target getVariable ['exileterritorylevel', -1]) > 4)} &&
		{((_target getVariable ['WMS_BuyerOwner', -1]) == (getPlayerUID _this))} &&
		{((_this getVariable ['exileMoney', 0]) > 25000)} &&
		{(vehicle _this == _this)};
		",
		5
	]
] remoteExec [
	"addAction",
	_caller,
	_jip
];
[ //params ["_target", "_caller", "_actionId", "_arguments"]; //condition: _target = object, _this = caller
	_flag,
	[
		"<t size='0.9' color='#80c606'>NabuconosorusCamp LvL5, (30k) right now</t>",//_display,
		"	
			_target = _this select 0; _caller = _this select 1;
			_target setVariable ['_layoutUpgradable', false, true];
			[_target, _caller, 30000, 'nabuconosorusCamp', 'rightnow'] remoteExec ['WMS_fnc_territoryLayoutUpgrade', 2];
			hint 'Congratulation!';

		",
		[], //argument accessible in the script (_this select 3)
		1,
		true,
		true,
		"",
		"
		(alive _target) &&
		{(_target getVariable ['_layoutUpgradable', true])} &&
		{((_target getVariable ['exileterritorylevel', -1]) > 4)} &&
		{((_target getVariable ['WMS_BuyerOwner', -1]) == (getPlayerUID _this))} &&
		{((_this getVariable ['exileMoney', 0]) > 30000)} &&
		{(vehicle _this == _this)};
		",
		5
	]
] remoteExec [
	"addAction",
	_caller,
	_jip
];
/////
[ //params ["_target", "_caller", "_actionId", "_arguments"]; //condition: _target = object, _this = caller
	_flag,
	[
		"<t size='0.9' color='#80c606'>FOB 45x75 LvL5, (25k), after restart</t>",//_display,
		"	
			_target = _this select 0; _caller = _this select 1;
			_target setVariable ['_layoutUpgradable', false, true];
			[_target, _caller, 25000, 'FOB_45x75', 'restart'] remoteExec ['WMS_fnc_territoryLayoutUpgrade', 2];
			hint 'Congratulation!';

		",
		[], //argument accessible in the script (_this select 3)
		1,
		true,
		true,
		"",
		"
		(alive _target) &&
		{(_target getVariable ['_layoutUpgradable', true])} &&
		{((_target getVariable ['exileterritorylevel', -1]) > 4)} &&
		{((_target getVariable ['WMS_BuyerOwner', -1]) == (getPlayerUID _this))} &&
		{((_this getVariable ['exileMoney', 0]) > 25000)} &&
		{(vehicle _this == _this)};
		",
		5
	]
] remoteExec [
	"addAction",
	_caller,
	_jip
];
[ //params ["_target", "_caller", "_actionId", "_arguments"]; //condition: _target = object, _this = caller
	_flag,
	[
		"<t size='0.9' color='#80c606'>FOB 45x75 LvL5, (30k) right now</t>",//_display,
		"	
			_target = _this select 0; _caller = _this select 1;
			_target setVariable ['_layoutUpgradable', false, true];
			[_target, _caller, 30000, 'FOB_45x75', 'rightnow'] remoteExec ['WMS_fnc_territoryLayoutUpgrade', 2];
			hint 'Congratulation!';

		",
		[], //argument accessible in the script (_this select 3)
		1,
		true,
		true,
		"",
		"
		(alive _target) &&
		{(_target getVariable ['_layoutUpgradable', true])} &&
		{((_target getVariable ['exileterritorylevel', -1]) > 4)} &&
		{((_target getVariable ['WMS_BuyerOwner', -1]) == (getPlayerUID _this))} &&
		{((_this getVariable ['exileMoney', 0]) > 30000)} &&
		{(vehicle _this == _this)};
		",
		5
	]
] remoteExec [
	"addAction",
	_caller,
	_jip
];
/////
[ //params ["_target", "_caller", "_actionId", "_arguments"]; //condition: _target = object, _this = caller
	_flag,
	[
		"<t size='0.9' color='#80c606'>WaterWorld LvL5, (25k), after restart</t>",//_display,
		"	
			_target = _this select 0; _caller = _this select 1;
			_target setVariable ['_layoutUpgradable', false, true];
			[_target, _caller, 25000, 'waterworldlvl5', 'restart'] remoteExec ['WMS_fnc_territoryLayoutUpgrade', 2];
			hint 'Congratulation!';

		",
		[], //argument accessible in the script (_this select 3)
		1,
		true,
		true,
		"",
		"
		(surfaceIsWater (position _target)) &&
		{(_target getVariable ['_layoutUpgradable', true])} &&
		{((_target getVariable ['exileterritorylevel', -1]) > 4)} &&
		{((_target getVariable ['WMS_BuyerOwner', -1]) == (getPlayerUID _this))} &&
		{((_this getVariable ['exileMoney', 0]) > 25000)} &&
		{(vehicle _this == _this)};
		",
		5
	]
] remoteExec [
	"addAction",
	_caller,
	_jip
];
[ //params ["_target", "_caller", "_actionId", "_arguments"]; //condition: _target = object, _this = caller
	_flag,
	[
		"<t size='0.9' color='#80c606'>WaterWorld LvL5, (30k) right now</t>",//_display,
		"	
			_target = _this select 0; _caller = _this select 1;
			_target setVariable ['_layoutUpgradable', false, true];
			[_target, _caller, 30000, 'waterworldlvl5', 'rightnow'] remoteExec ['WMS_fnc_territoryLayoutUpgrade', 2];
			hint 'Congratulation!';

		",
		[], //argument accessible in the script (_this select 3)
		1,
		true,
		true,
		"",
		"
		(surfaceIsWater (position _target)) &&
		{(_target getVariable ['_layoutUpgradable', true])} &&
		{((_target getVariable ['exileterritorylevel', -1]) > 4)} &&
		{((_target getVariable ['WMS_BuyerOwner', -1]) == (getPlayerUID _this))} &&
		{((_this getVariable ['exileMoney', 0]) > 30000)} &&
		{(vehicle _this == _this)};
		",
		5
	]
] remoteExec [
	"addAction",
	_caller,
	_jip
];
/////
[ //params ["_target", "_caller", "_actionId", "_arguments"]; //condition: _target = object, _this = caller
	_flag,
	[
		"<t size='0.9' color='#80c606'>THE Camp LvL6, (30k), after restart</t>",//_display,
		"	
			_target = _this select 0; _caller = _this select 1;
			_target setVariable ['_layoutUpgradable', false, true];
			[_target, _caller, 30000, 'thecamp', 'restart'] remoteExec ['WMS_fnc_territoryLayoutUpgrade', 2];
			hint 'Congratulation!';

		",
		[], //argument accessible in the script (_this select 3)
		1,
		true,
		true,
		"",
		"
		(alive _target) &&
		{(_target getVariable ['_layoutUpgradable', true])} &&
		{((_target getVariable ['exileterritorylevel', -1]) > 5)} &&
		{((_target getVariable ['WMS_BuyerOwner', -1]) == (getPlayerUID _this))} &&
		{((_this getVariable ['exileMoney', 0]) > 30000)} &&
		{(vehicle _this == _this)};
		",
		5
	]
] remoteExec [
	"addAction",
	_caller,
	_jip
];
[ //params ["_target", "_caller", "_actionId", "_arguments"]; //condition: _target = object, _this = caller
	_flag,
	[
		"<t size='0.9' color='#80c606'>THE Camp LvL6, (35k) right now</t>",//_display,
		"	
			_target = _this select 0; _caller = _this select 1;
			_target setVariable ['_layoutUpgradable', false, true];
			[_target, _caller, 35000, 'thecamp', 'rightnow'] remoteExec ['WMS_fnc_territoryLayoutUpgrade', 2];
			hint 'Congratulation!';

		",
		[], //argument accessible in the script (_this select 3)
		1,
		true,
		true,
		"",
		"
		(alive _target) &&
		{(_target getVariable ['_layoutUpgradable', true])} &&
		{((_target getVariable ['exileterritorylevel', -1]) > 5)} &&
		{((_target getVariable ['WMS_BuyerOwner', -1]) == (getPlayerUID _this))} &&
		{((_this getVariable ['exileMoney', 0]) > 35000)} &&
		{(vehicle _this == _this)};
		",
		5
	]
] remoteExec [
	"addAction",
	_caller,
	_jip
];
/////
[ //params ["_target", "_caller", "_actionId", "_arguments"]; //condition: _target = object, _this = caller
	_flag,
	[
		"<t size='0.9' color='#80c606'>Twin Helipad II LvL6, (30k), after restart</t>",//_display,
		"	
			_target = _this select 0; _caller = _this select 1;
			_target setVariable ['_layoutUpgradable', false, true];
			[_target, _caller, 30000, 'twinheliup', 'restart'] remoteExec ['WMS_fnc_territoryLayoutUpgrade', 2];
			hint 'Congratulation!';

		",
		[], //argument accessible in the script (_this select 3)
		1,
		true,
		true,
		"",
		"
		(alive _target) &&
		{(_target getVariable ['_layoutUpgradable', true])} &&
		{((_target getVariable ['exileterritorylevel', -1]) > 5)} &&
		{((_target getVariable ['WMS_BuyerOwner', -1]) == (getPlayerUID _this))} &&
		{((_this getVariable ['exileMoney', 0]) > 30000)} &&
		{(vehicle _this == _this)};
		",
		5
	]
] remoteExec [
	"addAction",
	_caller,
	_jip
];
[ //params ["_target", "_caller", "_actionId", "_arguments"]; //condition: _target = object, _this = caller
	_flag,
	[
		"<t size='0.9' color='#80c606'>Twin Helipad II LvL6, (35k) right now</t>",//_display,
		"	
			_target = _this select 0; _caller = _this select 1;
			_target setVariable ['_layoutUpgradable', false, true];
			[_target, _caller, 35000, 'twinheliup', 'rightnow'] remoteExec ['WMS_fnc_territoryLayoutUpgrade', 2];
			hint 'Congratulation!';

		",
		[], //argument accessible in the script (_this select 3)
		1,
		true,
		true,
		"",
		"
		(alive _target) &&
		{(_target getVariable ['_layoutUpgradable', true])} &&
		{((_target getVariable ['exileterritorylevel', -1]) > 5)} &&
		{((_target getVariable ['WMS_BuyerOwner', -1]) == (getPlayerUID _this))} &&
		{((_this getVariable ['exileMoney', 0]) > 35000)} &&
		{(vehicle _this == _this)};
		",
		5
	]
] remoteExec [
	"addAction",
	_caller,
	_jip
];
/////
[ //params ["_target", "_caller", "_actionId", "_arguments"]; //condition: _target = object, _this = caller
	_flag,
	[
		"<t size='0.9' color='#80c606'>Medical Center LvL6, (30k), after restart</t>",//_display,
		"	
			_target = _this select 0; _caller = _this select 1;
			_target setVariable ['_layoutUpgradable', false, true];
			[_target, _caller, 30000, 'medicalcenter', 'restart'] remoteExec ['WMS_fnc_territoryLayoutUpgrade', 2];
			hint 'Congratulation!';

		",
		[], //argument accessible in the script (_this select 3)
		1,
		true,
		true,
		"",
		"
		(alive _target) &&
		{(_target getVariable ['_layoutUpgradable', true])} &&
		{((_target getVariable ['exileterritorylevel', -1]) > 5)} &&
		{((_target getVariable ['WMS_BuyerOwner', -1]) == (getPlayerUID _this))} &&
		{((_this getVariable ['exileMoney', 0]) > 30000)} &&
		{(vehicle _this == _this)};
		",
		5
	]
] remoteExec [
	"addAction",
	_caller,
	_jip
];
[ //params ["_target", "_caller", "_actionId", "_arguments"]; //condition: _target = object, _this = caller
	_flag,
	[
		"<t size='0.9' color='#80c606'>Medical Center LvL6, (35k) right now</t>",//_display,
		"	
			_target = _this select 0; _caller = _this select 1;
			_target setVariable ['_layoutUpgradable', false, true];
			[_target, _caller, 35000, 'medicalcenter', 'rightnow'] remoteExec ['WMS_fnc_territoryLayoutUpgrade', 2];
			hint 'Congratulation!';

		",
		[], //argument accessible in the script (_this select 3)
		1,
		true,
		true,
		"",
		"
		(alive _target) &&
		{(_target getVariable ['_layoutUpgradable', true])} &&
		{((_target getVariable ['exileterritorylevel', -1]) > 5)} &&
		{((_target getVariable ['WMS_BuyerOwner', -1]) == (getPlayerUID _this))} &&
		{((_this getVariable ['exileMoney', 0]) > 35000)} &&
		{(vehicle _this == _this)};
		",
		5
	]
] remoteExec [
	"addAction",
	_caller,
	_jip
];

/////
[ //params ["_target", "_caller", "_actionId", "_arguments"]; //condition: _target = object, _this = caller
	_flag,
	[
		"<t size='0.9' color='#80c606'>FOB 70x70 LvL6, (30k), after restart</t>",//_display,
		"	
			_target = _this select 0; _caller = _this select 1;
			_target setVariable ['_layoutUpgradable', false, true];
			[_target, _caller, 30000, 'fob_70x70', 'restart'] remoteExec ['WMS_fnc_territoryLayoutUpgrade', 2];
			hint 'Congratulation!';

		",
		[], //argument accessible in the script (_this select 3)
		1,
		true,
		true,
		"",
		"
		(alive _target) &&
		{(_target getVariable ['_layoutUpgradable', true])} &&
		{((_target getVariable ['exileterritorylevel', -1]) > 5)} &&
		{((_target getVariable ['WMS_BuyerOwner', -1]) == (getPlayerUID _this))} &&
		{((_this getVariable ['exileMoney', 0]) > 30000)} &&
		{(vehicle _this == _this)};
		",
		5
	]
] remoteExec [
	"addAction",
	_caller,
	_jip
];
[ //params ["_target", "_caller", "_actionId", "_arguments"]; //condition: _target = object, _this = caller
	_flag,
	[
		"<t size='0.9' color='#80c606'>FOB 70x70 LvL6, (35k) right now</t>",//_display,
		"	
			_target = _this select 0; _caller = _this select 1;
			_target setVariable ['_layoutUpgradable', false, true];
			[_target, _caller, 35000, 'fob_70x70', 'rightnow'] remoteExec ['WMS_fnc_territoryLayoutUpgrade', 2];
			hint 'Congratulation!';

		",
		[], //argument accessible in the script (_this select 3)
		1,
		true,
		true,
		"",
		"
		(alive _target) &&
		{(_target getVariable ['_layoutUpgradable', true])} &&
		{((_target getVariable ['exileterritorylevel', -1]) > 5)} &&
		{((_target getVariable ['WMS_BuyerOwner', -1]) == (getPlayerUID _this))} &&
		{((_this getVariable ['exileMoney', 0]) > 35000)} &&
		{(vehicle _this == _this)};
		",
		5
	]
] remoteExec [
	"addAction",
	_caller,
	_jip
];
/////
[ //params ["_target", "_caller", "_actionId", "_arguments"]; //condition: _target = object, _this = caller
	_flag,
	[
		"<t size='0.9' color='#80c606'>WaterWorld LvL6, (30k), after restart</t>",//_display,
		"	
			_target = _this select 0; _caller = _this select 1;
			_target setVariable ['_layoutUpgradable', false, true];
			[_target, _caller, 30000, 'waterworldlvl6', 'restart'] remoteExec ['WMS_fnc_territoryLayoutUpgrade', 2];
			hint 'Congratulation!';

		",
		[], //argument accessible in the script (_this select 3)
		1,
		true,
		true,
		"",
		"
		(surfaceIsWater (position _target)) &&
		{(_target getVariable ['_layoutUpgradable', true])} &&
		{((_target getVariable ['exileterritorylevel', -1]) > 5)} &&
		{((_target getVariable ['WMS_BuyerOwner', -1]) == (getPlayerUID _this))} &&
		{((_this getVariable ['exileMoney', 0]) > 30000)} &&
		{(vehicle _this == _this)};
		",
		5
	]
] remoteExec [
	"addAction",
	_caller,
	_jip
];
[ //params ["_target", "_caller", "_actionId", "_arguments"]; //condition: _target = object, _this = caller
	_flag,
	[
		"<t size='0.9' color='#80c606'>WaterWorld LvL6, (35k) right now</t>",//_display,
		"	
			_target = _this select 0; _caller = _this select 1;
			_target setVariable ['_layoutUpgradable', false, true];
			[_target, _caller, 35000, 'waterworldlvl6', 'rightnow'] remoteExec ['WMS_fnc_territoryLayoutUpgrade', 2];
			hint 'Congratulation!';

		",
		[], //argument accessible in the script (_this select 3)
		1,
		true,
		true,
		"",
		"
		(surfaceIsWater (position _target)) &&
		{(_target getVariable ['_layoutUpgradable', true])} &&
		{((_target getVariable ['exileterritorylevel', -1]) > 5)} &&
		{((_target getVariable ['WMS_BuyerOwner', -1]) == (getPlayerUID _this))} &&
		{((_this getVariable ['exileMoney', 0]) > 35000)} &&
		{(vehicle _this == _this)};
		",
		5
	]
] remoteExec [
	"addAction",
	_caller,
	_jip
];
/////
[ //params ["_target", "_caller", "_actionId", "_arguments"]; //condition: _target = object, _this = caller
	_flag,
	[
		"<t size='0.9' color='#80c606'>Armed Round FOB, (85k), after restart</t>",//_display,
		"	
			_target = _this select 0; _caller = _this select 1;
			_target setVariable ['_layoutUpgradable', false, true];
			[_target, _caller, 85000, 'circularfob', 'restart'] remoteExec ['WMS_fnc_territoryLayoutUpgrade', 2];
			hint 'Congratulation!';

		",
		[], //argument accessible in the script (_this select 3)
		1,
		true,
		true,
		"",
		"
		(alive _target) &&
		{(_target getVariable ['_layoutUpgradable', true])} &&
		{((_target getVariable ['exileterritorylevel', -1]) > 5)} &&
		{((_target getVariable ['WMS_BuyerOwner', -1]) == (getPlayerUID _this))} &&
		{((_this getVariable ['exileMoney', 0]) > 100000)} &&
		{(vehicle _this == _this)};
		",
		5
	]
] remoteExec [
	"addAction",
	_caller,
	_jip
];
[ //params ["_target", "_caller", "_actionId", "_arguments"]; //condition: _target = object, _this = caller
	_flag,
	[
		"<t size='0.9' color='#80c606'>Armed Round FOB, (100k) right now</t>",//_display,
		"	
			_target = _this select 0; _caller = _this select 1;
			_target setVariable ['_layoutUpgradable', false, true];
			[_target, _caller, 100000, 'circularfob', 'rightnow'] remoteExec ['WMS_fnc_territoryLayoutUpgrade', 2];
			hint 'Congratulation!';

		",
		[], //argument accessible in the script (_this select 3)
		1,
		true,
		true,
		"",
		"
		(alive _target) &&
		{(_target getVariable ['_layoutUpgradable', true])} &&
		{((_target getVariable ['exileterritorylevel', -1]) > 5)} &&
		{((_target getVariable ['WMS_BuyerOwner', -1]) == (getPlayerUID _this))} &&
		{((_this getVariable ['exileMoney', 0]) > 125000)} &&
		{(vehicle _this == _this)};
		",
		5
	]
] remoteExec [
	"addAction",
	_caller,
	_jip
];

/////
[ //params ["_target", "_caller", "_actionId", "_arguments"]; //condition: _target = object, _this = caller
	_flag,
	[
		"<t size='0.9' color='#80c606'>Armed Logistic Pod, (95k), after restart</t>",//_display,
		"	
			_target = _this select 0; _caller = _this select 1;
			_target setVariable ['_layoutUpgradable', false, true];
			[_target, _caller, 95000, 'logisticpod', 'restart'] remoteExec ['WMS_fnc_territoryLayoutUpgrade', 2];
			hint 'Congratulation!';

		",
		[], //argument accessible in the script (_this select 3)
		1,
		true,
		true,
		"",
		"
		(alive _target) &&
		{(_target getVariable ['_layoutUpgradable', true])} &&
		{((_target getVariable ['exileterritorylevel', -1]) > 5)} &&
		{((_target getVariable ['WMS_BuyerOwner', -1]) == (getPlayerUID _this))} &&
		{((_this getVariable ['exileMoney', 0]) > 100000)} &&
		{(vehicle _this == _this)};
		",
		5
	]
] remoteExec [
	"addAction",
	_caller,
	_jip
];
[ //params ["_target", "_caller", "_actionId", "_arguments"]; //condition: _target = object, _this = caller
	_flag,
	[
		"<t size='0.9' color='#80c606'>Armed Logistic Pod, (115k) right now</t>",//_display,
		"	
			_target = _this select 0; _caller = _this select 1;
			_target setVariable ['_layoutUpgradable', false, true];
			[_target, _caller, 115000, 'logisticpod', 'rightnow'] remoteExec ['WMS_fnc_territoryLayoutUpgrade', 2];
			hint 'Congratulation!';

		",
		[], //argument accessible in the script (_this select 3)
		1,
		true,
		true,
		"",
		"
		(alive _target) &&
		{(_target getVariable ['_layoutUpgradable', true])} &&
		{((_target getVariable ['exileterritorylevel', -1]) > 5)} &&
		{((_target getVariable ['WMS_BuyerOwner', -1]) == (getPlayerUID _this))} &&
		{((_this getVariable ['exileMoney', 0]) > 125000)} &&
		{(vehicle _this == _this)};
		",
		5
	]
] remoteExec [
	"addAction",
	_caller,
	_jip
];
