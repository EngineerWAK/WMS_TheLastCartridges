
//[player, _pos, _item] remoteExec ['WMS_fnc_EmergencySupply', 2]; //_pos is defined by the 'click' itself
private ["_officeTrader","_itemPrice","_itemList","_rad","_altitude","_objs","_vhls","_posPara","_parachute","_cargo","_smoke"];
params [
	"_caller",
	"_pos",
	"_item"
];
if (true) then {diag_log format ["|WAK|WAK|WAK| EMERGENCY_SUPPLY |WAK|WAK|WAK| _this = %1",_this]};

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
if (true) then {diag_log format ["|WAK|WAK|WAK| EMERGENCY_SUPPLY |WAK|WAK|WAK| _officeTrader = %1",_officeTrader]};

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
if (_item == "EmergencySupplyMeds") then {{_cargo addItemCargoGlobal [_x,1]} forEach _itemList;};
if (_item == "EmergencySupplyWeaps") then {
	_weap = selectRandom _itemList;
	_cargo addWeaponCargoGlobal [_weap,1];
	_cargo addMagazineCargoGlobal [((getArray (configfile >> "CfgWeapons" >> _weap >> "magazines")) select 0), 3];
	{_cargo addItemCargoGlobal [_x,1]} forEach _itemListI;
	{_cargo addMagazineCargoGlobal [_x, 1]} forEach _itemListM;

	//{_cargo addBackpackCargoGlobal [(_x select 0),((_x select 1)+(round (random (_x select 2))))]} forEach _bagList;
};

//{_cargo addMagazineCargoGlobal [_x,1]} forEach _ammoList;
//{_cargo addBackpackCargoGlobal [_x,1]} forEach _bag;
//{_cargo addWeaponCargoGlobal [_x,1]} forEach _weap;
if (true) then {diag_log format ["|WAK|WAK|WAK| EMERGENCY_SUPPLY |WAK|WAK|WAK|  Crate created and Filled, %1",_cargo]};
//Paradrop the crate and fil it
playSound3D ["A3\Sounds_F\ambient\battlefield\battlefield_heli1.wss", _cargo, false, _pos, 3, 1, 0];

[_caller, _itemPrice] remoteExec ['WMS_fnc_smallTransactions',2];