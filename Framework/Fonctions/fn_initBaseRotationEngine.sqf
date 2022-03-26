/**
 * WMS_fnc_initBaseRotationEngine
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
private _dir = getDir _flag;

[ //params ["_target", "_caller", "_actionId", "_arguments"]; //condition: _target = object, _this = caller
	_flag,
	[
		"<t size='0.9' color='#80c606'>Rotate 5deg CW</t>",//_display,
		"	
			_target = _this select 0;
			_origininalHeading = _target getVariable ['_origininalHeading', 0];
			_setRotationAngle = _target getVariable ['_setRotationAngle', 0];
			_target setVariable ['_setRotationAngle', (_setRotationAngle + 5), true];
			_setRotationAngle = _target getVariable ['_setRotationAngle', 0];
			hint format ['New heading: %1', (_origininalHeading+_setRotationAngle)];

		",
		[], //argument accessible in the script (_this select 3)
		1,
		true,
		true,
		"",
		"
		(alive _target) &&
		{(_target getVariable ['_allowRotation', false])} &&
		{((_target getVariable ['BuyerOwner', -1]) == (getPlayerUID _this))} &&
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
		"<t size='0.9' color='#80c606'>Rotate 15deg CW</t>",//_display,
		"
			_target = _this select 0;
			_origininalHeading = _target getVariable ['_origininalHeading', 0];
			_setRotationAngle = _target getVariable ['_setRotationAngle', 0];
			_target setVariable ['_setRotationAngle', (_setRotationAngle + 15), true];
			_setRotationAngle = _target getVariable ['_setRotationAngle', 0];
			hint format ['New heading: %1', (_origininalHeading+_setRotationAngle)];

		",
		[], //argument accessible in the script (_this select 3)
		1,
		true,
		true,
		"",
		"
		(alive _target) &&
		{(_target getVariable ['_allowRotation', false])} &&
		{((_target getVariable ['BuyerOwner', -1]) == (getPlayerUID _this))} &&
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
		"<t size='0.9' color='#80c606'>Rotate 45deg CW</t>",//_display,
		"
			_target = _this select 0;
			_origininalHeading = _target getVariable ['_origininalHeading', 0];
			_setRotationAngle = _target getVariable ['_setRotationAngle', 0];
			_target setVariable ['_setRotationAngle', (_setRotationAngle + 45), true];
			_setRotationAngle = _target getVariable ['_setRotationAngle', 0];
			hint format ['New heading: %1', (_origininalHeading+_setRotationAngle)];

		",
		[], //argument accessible in the script (_this select 3)
		1,
		true,
		true,
		"",
		"
		(alive _target) &&
		{(_target getVariable ['_allowRotation', false])} &&
		{((_target getVariable ['BuyerOwner', -1]) == (getPlayerUID _this))} &&
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
		"<t size='0.9' color='#80c606'>Rotate 5deg CCW</t>",//_display,
		"
			_target = _this select 0;
			_origininalHeading = _target getVariable ['_origininalHeading', 0];
			_setRotationAngle = _target getVariable ['_setRotationAngle', 0];
			_target setVariable ['_setRotationAngle', (_setRotationAngle - 5), true];
			_setRotationAngle = _target getVariable ['_setRotationAngle', 0];
			hint format ['New heading: %1', (_origininalHeading+_setRotationAngle)];

		",
		[], //argument accessible in the script (_this select 3)
		1,
		true,
		true,
		"",
		"
		(alive _target) &&
		{(_target getVariable ['_allowRotation', false])} &&
		{((_target getVariable ['BuyerOwner', -1]) == (getPlayerUID _this))} &&
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
		"<t size='0.9' color='#80c606'>Rotate 15deg CCW</t>",//_display,
		"
			_target = _this select 0;
			_origininalHeading = _target getVariable ['_origininalHeading', 0];
			_setRotationAngle = _target getVariable ['_setRotationAngle', 0];
			_target setVariable ['_setRotationAngle', (_setRotationAngle - 15), true];
			_setRotationAngle = _target getVariable ['_setRotationAngle', 0];
			hint format ['New heading: %1', (_origininalHeading+_setRotationAngle)];

		",
		[], //argument accessible in the script (_this select 3)
		1,
		true,
		true,
		"",
		"
		(alive _target) &&
		{(_target getVariable ['_allowRotation', false])} &&
		{((_target getVariable ['BuyerOwner', -1]) == (getPlayerUID _this))} &&
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
		"<t size='0.9' color='#80c606'>Rotate 45deg CCW</t>",//_display,
		"
			_target = _this select 0;
			_origininalHeading = _target getVariable ['_origininalHeading', 0];
			_setRotationAngle = _target getVariable ['_setRotationAngle', 0];
			_target setVariable ['_setRotationAngle', (_setRotationAngle - 45), true];
			_setRotationAngle = _target getVariable ['_setRotationAngle', 0];
			hint format ['New heading: %1', (_origininalHeading+_setRotationAngle)];

		",
		[], //argument accessible in the script (_this select 3)
		1,
		true,
		true,
		"",
		"
		(alive _target) &&
		{(_target getVariable ['_allowRotation', false])} &&
		{((_target getVariable ['BuyerOwner', -1]) == (getPlayerUID _this))} &&
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
		"<t size='0.9' color='#80c606'>Initiate Rotation (2500pt)</t>",//_display,
		"
			_target = _this select 0; _caller = _this select 1;
			_origininalHeading = _target getVariable ['_origininalHeading', 0];
			_setRotationAngle = _target getVariable ['_setRotationAngle', 0];
			[_target, _caller,(_origininalHeading+_setRotationAngle)] remoteExec ['WMS_fnc_rotateBaseObjects', 2];
			_target setVariable ['_setRotationAngle', 0];
			_target setVariable ['_allowRotation', false, true];

		",
		[], //argument accessible in the script (_this select 3)
		1,
		true,
		true,
		"",
		"
		(alive _target) &&
		{(_target getVariable ['_allowRotation', false])} &&
		{((_target getVariable ['BuyerOwner', -1]) == (getPlayerUID _this))} &&
		{((_this getVariable ['exileMoney', 0]) > 2500)} &&
		{(vehicle _this == _this)};
		",
		5
	]
] remoteExec [
	"addAction",
	_caller,
	_jip
];

