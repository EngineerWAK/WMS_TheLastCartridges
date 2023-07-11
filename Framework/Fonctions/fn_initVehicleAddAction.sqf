/**
 * WMS_fnc_initVehicleAddAction
 *
 * TNA-Community
 * https://discord.gg/Zs23URtjwF
 * © 2021 {|||TNA|||}WAKeupneo
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */

params[
	"_veh",
	["_targetOwner", 0],
	["_jip", false]
];
if (WMS_MissionDebug) then {diag_log format ["[INIT_PERMANENT_VHL]|WAK|TNA|WMS|UPDATE: _this %1", _this]};
//_OpenVhl = getArray(missionConfigFile>>"CfgOpenVhl">>"vhl");
[
//					if ((_this select 1) getVariable ['playerInTraderZone', true])then{
	_veh,
	[
		"<t color='#035c10'>Lock/Unlock</t>",
		"	
			if (locked (_this select 0) == 0) then {
				_vehiclesManagement = getArray(missionConfigFile >> 'CfgOfficeTrader' >> 'vehiclesManagement');
				if ((_vehiclesManagement select 5) != 0 &&{(player getVariable ['playerInTraderZone', true])}) then {
					[playerSide, 'PAPA_BEAR'] commandChat 'This Vehicle will be UNLOCKED after restart if in the Traders Zone';
				};
				if (typeOf (_this select 0) in (getArray(missionConfigFile>>'CfgOpenVhl'>>'vhl'))) then {
					_territoryOfficeData = getArray(missionConfigFile >> 'CfgOfficeTrader' >> 'ZoneSizes');
					_nearestTrader = [WMS_tradersMkrPos, (_this select 0)] call BIS_fnc_nearestPosition;
					if ((_nearestTrader distance2D (_this select 0)) < ((_territoryOfficeData select 0)+(_territoryOfficeData select 3))) then {
						hint 'Restricted Action in Traders';
						[playerSide, 'PAPA_BEAR'] commandChat 'This Vehicle Can Not Be Locked In Traders Zone +270m'; 
					}else{
						(_this select 0) setVehicleLock 'LOCKED';
						(_this select 0) lockInventory true;
						if(count Crew (_this select 0) == 0)then{(_this select 0) setVelocity [0,0,0]};
						[(_this select 0),'LOCKED'] remoteExec ['WMS_fnc_ConfLockUnlock', 2];
						playSound3D [getMissionPath'\custom\ogg\caralarm.ogg', (_this select 0), false, position (_this select 0), 4, 1, 0];
						if ((_this select 0) getVariable ['permanentVHL', false])then {
							[(_this select 0),'lockunlock'] remoteExec ['WMS_fnc_updatePermanentVHL', 2];
						};
					};
				}else{
					(_this select 0) setVehicleLock 'LOCKED';
					(_this select 0) lockInventory true;
					if(count Crew (_this select 0) == 0)then{(_this select 0) setVelocity [0,0,0]};
					[(_this select 0),'LOCKED'] remoteExec ['WMS_fnc_ConfLockUnlock', 2];
					playSound3D [getMissionPath'\custom\ogg\caralarm.ogg', (_this select 0), false, position (_this select 0), 4, 1, 0];
					if ((_this select 0) getVariable ['permanentVHL', false])then {
						[(_this select 0),'lockunlock'] remoteExec ['WMS_fnc_updatePermanentVHL', 2];
					};
				};
			} else {
				(_this select 0) allowDamage true;
				_startDamage = (_this select 0) getVariable ['WMS_startDamage', 999];
				if !(_startDamage == 999) then {
					(_this select 0) setDamage _startDamage;
					(_this select 0) setVariable ['WMS_startDamage', 999, true];
					};
				(_this select 0) setVehicleLock 'UNLOCKED';
				(_this select 0) lockInventory false;
				[(_this select 0),'UNLOCKED'] remoteExec ['WMS_fnc_ConfLockUnlock', 2];
			};
		",
		nil, //argument accessible in the script (_this select 3)
		1,
		true,
		true,
		"",
		//"((getplayerUID _this) == (_target getVariable ['WMS_BuyerOwner', 0]) && (vehicle _this == _this))",
		"((alive _target) && (speed _this <= 10) && {(getplayerUID _this) in (_target getVariable ['WMS_friends', [0]])})",
		10
	]
] remoteExec [
	"addAction",
	_targetOwner, //0 for all players
	_jip //JIP
];
			/*	(_this select 0) allowDamage false;
				_pos = getPos (_this select 0);
				_dir = getDir (_this select 0);
				(_this select 0) setPos [(_pos select 0),(_pos select 1),((_pos select 2)+3)];
				(_this select 0) setDir _dir;
				(_this select 0) allowDamage true;*/
[
	_veh,
	[
		"<t color='#f50000'>Flip</t>",
		"
			if (locked (_this select 0) == 0) then {
				(_this select 0) call bis_fnc_unflipVehicle;
			};
		",
		nil, //argument accessible in the script (_this select 3)
		1,
		true,
		true,
		"",
		"((alive _target) && {(locked _target == 0)} && {(stance player == 'CROUCH')} && {(getplayerUID _this) in (_target getVariable ['WMS_friends', [0]])} && {(vehicle _this == _this)})",
		5
	]
] remoteExec [
	"addAction",
	_targetOwner, //0 for all players
	_jip //JIP
];

//ADDACTION for resell the vehicle in the traderZone
			/*if !(count ((ItemCargo (_this select 0))+(WeaponCargo (_this select 0))+(MagazineCargo (_this select 0))+(backpackCargo (_this select 0))) == 0) then { 
				[(_this select 1), (_this select 0)] remoteExec ['WMS_fnc_processCargoDump']; 
			};*/
[ //params ["_target", "_caller", "_actionId", "_arguments"];
	_veh,
	[
		"<t color='#f86c20'>Resell the Vehicle</t>",//_display,
		"
			[(_this select 1), (_this select 0)] remoteExec ['WMS_fnc_sellVehicles', 2];
		",
		[], //argument accessible in the script (_this select 3)
		1,
		true,
		true,
		"",
		"(alive _target) && (stance player == 'CROUCH') && {(vehicle _this == _this)} && {(_this getVariable ['playerInTraderZone', false])} && {((_target getVariable ['WMS_BuyerOwner', -1]) == (getPlayerUID _this))};",
		5
	]
] remoteExec [
	"addAction",
	_targetOwner, //0 for all players //2 server only //-2 everyone but the server
	_jip //JIP
];


//Add friends to the vehicle array
[ //params ["_target", "_caller", "_actionId", "_arguments"];
	_veh,
	[
		"<t color='#4b48f9'>Autorize Vehicle Crew</t>",//_display,
		"
			_friends = (_this select 0) getVariable ['WMS_friends', [0]];
			{
				if !(getPlayerUID _x in _friends) then {_friends pushback getPlayerUID _x};
			}forEach (crew (_this select 0));
			(_this select 0) setVariable ['WMS_friends', _friends, true];
			if ((_this select 0) getVariable ['permanentVHL', false])then {
				nul = [(_this select 0),'vehiclecrew'] remoteExec ['WMS_fnc_updatePermanentVHL', 2];
			};
		",
		[], //argument accessible in the script (_this select 3)
		1,
		true,
		true,
		"",
		"(alive _target) && {(vehicle _this == _this)} && {(_this getVariable ['playerInTraderZone', false])} && {((_target getVariable ['WMS_BuyerOwner', -1]) == (getPlayerUID _this))};",
		5
	]
] remoteExec [
	"addAction",
	_targetOwner, //0 for all players //2 server only //-2 everyone but the server
	_jip //JIP
];
[ //params ["_target", "_caller", "_actionId", "_arguments"];
	_veh,
	[
		"<t size='1' color='#4b48f9'>Sell Inventory</t>",// #035c10"
		"
			if !(count ((ItemCargo (_this select 0))+(WeaponCargo (_this select 0))+(MagazineCargo (_this select 0))+(backpackCargo (_this select 0))) == 0) then { 
				[(_this select 1), (_this select 0)] remoteExec ['WMS_fnc_processCargoDump'];
			} else { 
				'Inventory is empty, you punk' remoteExec ['hint', (owner (_this select 1))];
			};
		",
		[], //argument accessible in the script (_this select 3)
		1,
		true,
		true,
		"",
		"(alive _target) && {(vehicle _this == _this)} && {(stance player == 'CROUCH')} && {(_this getVariable ['playerInTraderZone', false])} && {((_target getVariable ['WMS_BuyerOwner', -1]) == (getPlayerUID _this))};",
		5
	]
] remoteExec [
	"addAction",
	_targetOwner, //0 for all players //2 server only //-2 everyone but the server
	_jip //JIP
];