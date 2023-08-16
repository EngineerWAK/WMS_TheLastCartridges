/**
 * WMS_fnc_initFlagAddAction
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
if (WMS_MissionDebug) then {diag_log format ["[INIT_FLAG_ACTIONS]|WAK|TNA|WMS|UPDATE: _this %1 @ %2 ASL", _this, (getPosASL (_this select 0))]};
_flag setVariable ['_allowRotation', true, true];
_flag setVariable ['_setRotationAngle', 0, true];
_flag setVariable ['_origininalHeading', (getDir _flag), true];

[ //params ["_target", "_caller", "_actionId", "_arguments"]; //condition: _target = object, _this = caller
	_flag,
	[
		"<t size='0.9' color='#80c606'>Territory Level info</t>",//_display,
		"
			_target = _this select 0; _caller = _this select 1;
			_level = (_target getVariable ['exileterritorylevel', -1]);
			hint format ['your territory is level %1', _level];
			systemChat format ['your territory is level %1', _level];
		",
		[], //argument accessible in the script (_this select 3)
		1,
		true,
		true,
		"",
		"
		(alive _target) &&
		{((_target getVariable ['WMS_BuyerOwner', -1]) == (getPlayerUID _this))} &&
		{(vehicle _this == _this)};
		",
		5
	]
] remoteExec [
	"addAction",
	_caller,
	_jip
];
//Add friends to the territory
[ //params ["_target", "_caller", "_actionId", "_arguments"];
	_flag,
	[
		"<t size='0.9' color='#80c606'>Add Members to FastTravel</t>",//_display,
		"
			_friends = (_this select 0) getVariable ['WMS_BaseFriends', [0]];
			if (count _friends < 6) then {
				_playersAround = (position (_this select 0)) nearEntities ['I_Survivor_F', 10];
				{
					if !(getPlayerUID _x in _friends) then {
						_friends pushback getPlayerUID _x;
						['You are now in this territory FastTravel'] remoteExec ['hint', owner _x];
					};
				}forEach _playersAround;
				(_this select 0) setVariable ['WMS_BaseFriends', _friends, true];
				nul = [(_this select 0),(_this select 1),_friends,'friends'] remoteExec ['WMS_fnc_territoryUpdate', 2];
			} else {
				(_this select 0) removeaction (_this select 2);
				hint 'You already reached the FastTravelers limit';
				systemChat 'You already reached the FastTravelers limit';
			};
		",
		[], //argument accessible in the script (_this select 3)
		1,
		true,
		true,
		"",
		"(alive _target) && {(vehicle _this == _this)} && {((_target getVariable ['WMS_BuyerOwner', -1]) == (getPlayerUID _this))} && {((_target getVariable ['exileterritorylevel', 0]) > 1)};",
		5
	]
] remoteExec [
	"addAction",
	_caller, //0 for all players //2 server only //-2 everyone but the server
	_jip //JIP
];

[
	_flag,
	[
		"<t size='0.9' color='#80c606'>Start Base Rotation Engine</t>",//_display,
		"
			_target = _this select 0; _caller = _this select 1;
			[_target, (owner _caller), false] remoteExec ['WMS_fnc_initBaseRotationEngine', 2];
			(_this select 0) removeaction (_this select 2);

		", //params ["_target", "_caller", "_actionId", "_arguments"]; 
		[], //argument accessible in the script (_this select 3)
		1,
		true,
		true,
		"",
		"
		(alive _target) &&
		{(_target getVariable ['_allowRotation', false])} &&
		{((_target getVariable ['WMS_BuyerOwner', -1]) == (getPlayerUID _this))} &&
		{(vehicle _this == _this)};
		",//condition: _target = object, _this = caller
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
		"<t size='0.9' color='#80c606'>Upgrade to next level (20000$)</t>",//_display,
		"
			_target = _this select 0; _caller = _this select 1;
			_level = (_target getVariable ['exileterritorylevel', -1]);
			[_target, _caller] remoteExec ['WMS_fnc_territoryUpgrade', 2];
			hint format ['your territory is now level %1', _level +1];
			systemChat format ['your territory is now level %1', _level +1];
		",
		[], //argument accessible in the script (_this select 3)
		1,
		true,
		true,
		"",
		"
		(alive _target) &&
		{((_target getVariable ['exileterritorylevel', -1]) < 6)} &&
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
[
	_flag,
	[
		"<t size='0.9' color='#80c606'>Change Base Layout</t>",//_display,
		"
			_target = _this select 0; _caller = _this select 1;
			[_target, (owner _caller), false] remoteExec ['WMS_fnc_territoryLayoutActions', 2];
			(_this select 0) removeaction (_this select 2);

		", //params ["_target", "_caller", "_actionId", "_arguments"]; 
		[], //argument accessible in the script (_this select 3)
		1,
		true,
		true,
		"",
		"
		(alive _target) &&
		{(_target getVariable ['_layoutUpgradable', false])} &&
		{((_target getVariable ['WMS_BuyerOwner', -1]) == (getPlayerUID _this))} &&
		{(vehicle _this == _this)};
		",//condition: _target = object, _this = caller
		5
	]
] remoteExec [
	"addAction",
	_caller,
	_jip
];
[
	_flag,
	[
		"<t size='0.9' color='#b80000'>Delete Territory</t>",//_display,
		"
			_target = _this select 0; _caller = _this select 1;
			[_target, _caller] remoteExec ['WMS_fnc_territoryDelete', 2];
			(_this select 0) removeaction (_this select 2);

		", //params ["_target", "_caller", "_actionId", "_arguments"]; 
		[], //argument accessible in the script (_this select 3)
		1,
		true,
		true,
		"",
		"
		(alive _target) &&
		{((_target getVariable ['WMS_BuyerOwner', -1]) == (getPlayerUID _this))} &&
		{(vehicle _this == _this)};
		",//condition: _target = object, _this = caller
		2
	]
] remoteExec [
	"addAction",
	_caller,
	_jip
];

[
	_flag,
	[
		"<t size='0.9' color='#b80000'>Activate Safety Perimeter, 5k</t>",//_display,
		"
			_target = _this select 0; _caller = _this select 1;
			[_target, _caller]remoteExec ['WMS_fnc_BaseSafetyPerimeter', 2];
			_target removeaction (_this select 2);
		", //params ["_target", "_caller", "_actionId", "_arguments"]; 
		[], //argument accessible in the script (_this select 3)
		1,
		true,
		true,
		"",
		"	(_target getVariable ['canSafetyPerimeter', true]) &&
			{
				((_target getVariable ['layout', 'nope']) == 'soglvl6') ||
				((_target getVariable ['layout', 'nope']) == 'logisticpod') || 
				((_target getVariable ['layout', 'nope']) == 'thecamp') || 
				((_target getVariable ['layout', 'nope']) == 'twinheliup') || 
				((_target getVariable ['layout', 'nope']) == 'circularfob')
			} 
		",//condition: _target = object, _this = caller
		2
	]
] remoteExec [
	"addAction",
	_caller,
	_jip
];

