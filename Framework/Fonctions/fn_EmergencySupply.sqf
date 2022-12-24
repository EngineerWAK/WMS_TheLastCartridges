
//[player, _pos, _item] remoteExec ['WMS_fnc_EmergencySupply', 2]; //_pos is defined by the 'click' itself
private ["_officeTrader","_itemPrice","_itemList","_rad","_altitude","_objs","_vhls","_posPara","_parachute","_cargo","_smoke"];
params [
	"_caller",
	"_pos",
	"_item"
];
if (WMS_MissionDebug) then {diag_log format ["|WAK|WAK|WAK| EMERGENCY_SUPPLY |WAK|WAK|WAK| _this = %1",_this]};

_officeTrader = getArray(missionConfigFile >> "CfgOfficeTrader" >> _item);
_itemPrice = (_officeTrader select 0);
_itemList = (_officeTrader select 1);
_itemListM = [];
_itemListI = [];
_itemListB = [];
//if () then {};
switch (tolower _item) do {
    case "emergencysupplymeds":	{
		_itemPrice = (_officeTrader select 0);
		_itemList = (_officeTrader select 1);
	};
     case "emergencysupplyweaps":		{
		_itemPrice = (_officeTrader select 0);
		_itemList = (_officeTrader select 1);
		_itemListM = (_officeTrader select 2);
		_itemListI = (_officeTrader select 3);
		_itemListB = (_officeTrader select 4);
	};
};
if (WMS_MissionDebug) then {diag_log format ["|WAK|WAK|WAK| EMERGENCY_SUPPLY |WAK|WAK|WAK| _officeTrader = %1",_officeTrader]};

_rad = 250;
_altitude = 150;
_objs = [];
_vhls = [];
_pos = [[[_pos, _rad]],[]] call BIS_fnc_randomPos;
//Paradrop the crate and fil it 
_posPara = [_pos select 0, _pos select 1, _altitude];
_parachute = createVehicle ["B_Parachute_02_F",_posPara, [], 5];
_parachute 	setdir winddir;
_parachute 	setPos _posPara;
_parachute 	setvelocity [0,0,-8];
_cargo = createVehicle ["C_IDAP_supplyCrate_F",_posPara, [],5];
_smoke = createVehicle ["SmokeShellPurple",position _cargo, [],5];
_smoke attachTo [_cargo,[0,0,1]];
_vhls pushBack _cargo; //carry variables for conditions
_cargo allowdamage false;
_cargo attachTo [_parachute,[0,0,0]];
clearMagazineCargoGlobal _cargo; 
clearWeaponCargoGlobal _cargo; 
clearItemCargoGlobal _cargo; 
clearBackpackCargoGlobal _cargo;
if (_item == "EmergencySupplyMeds") then {
	{_cargo addItemCargoGlobal [_x,1]} forEach _itemList;
	//reset ACE Fatigue
	_cargo setVariable ["ace_medical_isMedicalFacility", true, true];
	_cargo setVariable ["WMS_resetFatigueTimer", (time-660), true];
	[
		_cargo,
		[
			"<t size='0.95' color='#528ffa'>Reset ACE Fatigue, Every 10 Minutes</t>",
			"
			[(_this select 1), objNull] call ace_advanced_fatigue_fnc_handlePlayerChanged;
			(_this select 0) setVariable ['WMS_resetFatigueTimer', time, true];
			",
			[],
			1,
			true,
			true,
			"",
			"('ACE_personalAidKit' in (items _this)) &&
			{(time >= (600 + (_target getVariable ['WMS_resetFatigueTimer', time])))} && 
			{(vehicle _this == _this)}",
			3
		]
	] remoteExec [
		"addAction",
		0,
		false //JIP
	];
	};
if (_item == "EmergencySupplyWeaps") then {
	_weap = selectRandom _itemList;
	_cargo addWeaponCargoGlobal [_weap,1];
	_cargo addMagazineCargoGlobal [((getArray (configfile >> "CfgWeapons" >> _weap >> "magazines")) select 0), 3];
	{_cargo addItemCargoGlobal [_x,1]} forEach _itemListI;
	{_cargo addMagazineCargoGlobal [_x, 1]} forEach _itemListM;
	//{_cargo addBackpackCargoGlobal [(_x select 0),((_x select 1)+(round (random (_x select 2))))]} forEach _bagList;
	[
		_cargo,
		[
			"<t size='1' color='#528ffa'>Buy Ammo Default</t>",
			"
			[(_this select 1), (_this select 0), 'default','emergency'] call WMS_fnc_buyAmmoOnBox;
			",
			[],
			1,
			true,
			true,
			"",
			"(vehicle _this == _this)",
			5
		]
	] remoteExec [
		"addAction",
		0,
		true //JIP
	];
	[
		_cargo,
		[
			"<t size='1' color='#528ffa'>Buy Ammo Random</t>",
			"
			[(_this select 1), (_this select 0), 'random','emergency'] call WMS_fnc_buyAmmoOnBox;
			",
			[],
			1,
			true,
			true,
			"",
			"(vehicle _this == _this)",
			5
		]
	] remoteExec [
		"addAction",
		0,
		true
	];
};

//{_cargo addMagazineCargoGlobal [_x,1]} forEach _ammoList;
//{_cargo addBackpackCargoGlobal [_x,1]} forEach _bag;
//{_cargo addWeaponCargoGlobal [_x,1]} forEach _weap;
if (WMS_MissionDebug) then {diag_log format ["|WAK|WAK|WAK| EMERGENCY_SUPPLY |WAK|WAK|WAK|  Crate created and Filled, %1",_cargo]};
//Paradrop the crate and fil it
playSound3D ["A3\Sounds_F\ambient\battlefield\battlefield_heli1.wss", _cargo, false, _pos, 3, 1, 0];

[_caller, _itemPrice] remoteExec ['WMS_fnc_smallTransactions',2];