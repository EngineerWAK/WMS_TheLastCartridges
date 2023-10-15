/**
 * WMS_fnc_buyAmmoOnBox
 *
 * TNA-Community
 * https://discord.gg/Zs23URtjwF
 * © 2021 {|||TNA|||}WAKeupneo
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
private ["_playerMoney","_targetOwner","_targetUID","_price","_ammoTypeRandom","_ammoTypeDefault","_ammoCaliber","_ammoCount","_magsCount","_weaponConfig","_ammoArray","_ammoType"];
params [
	"_playerObject",
	"_boxObject",
	["_option", "random"], //"random" //randompistol
	["_tax","none"] //"emergency" = x3 price
];
if (WMS_MissionDebug) then {diag_log format ["[BUY_AMMO]|WAK|TNA|WMS|_this %1", _this]};

_magsCount = 3;
_ammoCount = 30;
_ammoType = "";
_ammoCaliber = 1;
_ammoArray = [];
_ammoTypeDefaultAll = [];
_ammoTypeDefault = "";
_ammoTypeRandom = "";
_40mmHEList = ["1Rnd_HE_Grenade_shell","rhs_mag_M441_HE", "rhs_mag_M433_HEDP", "rhs_mag_M397_HET","rhsusf_mag_6Rnd_M441_HE", "rhsusf_mag_6Rnd_M433_HEDP", "rhsusf_mag_6Rnd_M397_HET","CBA_40mm_M203", "CBA_40mm_EGLM"];

_targetUID = getPlayerUID _playerObject;
_defaultAmmo = profileNameSpace GetVariable [_targetUID+"_defaultAmmo", []];
_weapPlayer = primaryweapon _playerObject;

_result = [];
_defaultRegist = "";
{  
	_found = _x find _weapPlayer; 
	_result pushback _found; 
}forEach _defaultAmmo;
_result = _result find 0;
if (_result != -1) then {
	_defaultRegist = ((_defaultAmmo select _result) select 1);
};
//_ammoTypeDefault = _ammoArray select 0; //That's definitly NOT the default ammo
switch (tolower _option) do {
    case "default":	{
		_ammoTypeDefaultAll = (getArray (configfile >> "CfgWeapons" >> (primaryWeapon _playerObject) >> "magazines"));
		if (count _ammoTypeDefaultAll != 0) then {
			_ammoTypeDefault = _ammoTypeDefaultAll select 0;
			
			if (_defaultRegist != "") then {_ammoTypeDefault = _defaultRegist;};
			
			if ("hlc_" in (primaryweapon _playerObject) && {!("hlc_" in _ammoTypeDefault)} && {(_defaultRegist == "")}) then {_ammoTypeDefault = format["HLC_%1",_ammoTypeDefault]}; //FUCKYOU with your broken config NIA
			_ammoCount = getNumber (configfile >> "CfgMagazines" >> _ammoTypeDefault >> "count"); //ammo count in the mag
			_ammoType = getText (configfile >> "CfgMagazines" >> _ammoTypeDefault >> "ammo"); //will be used to defind the "caliber" and "extract a price per bullet
			_ammoCaliber = getNumber (configfile >> "CfgAmmo" >> _ammoType >> "caliber"); //not the "real" Caliber but seems to follow some logic
			_ammoArray = ["ammoClassName"];
		}else{
			if (_defaultRegist != "") then {
				_ammoTypeDefault = _defaultRegist;
				if ("hlc_" in (primaryweapon _playerObject) && {!("hlc_" in _ammoTypeDefault)} && {(_defaultRegist == "")}) then {_ammoTypeDefault = format["HLC_%1",_ammoTypeDefault]}; //FUCKYOU with your broken config NIA
				_ammoCount = getNumber (configfile >> "CfgMagazines" >> _ammoTypeDefault >> "count"); //ammo count in the mag
				_ammoType = getText (configfile >> "CfgMagazines" >> _ammoTypeDefault >> "ammo"); //will be used to defind the "caliber" and "extract a price per bullet
				_ammoCaliber = getNumber (configfile >> "CfgAmmo" >> _ammoType >> "caliber"); //not the "real" Caliber but seems to follow some logic
				_ammoArray = ["ammoClassName"];
			}else {
				hint format ["%1 Doesn't have Default ammo because NIA config is crap, buy RANDOM",(primaryWeapon _playerObject)];
			};
			
		};

	};
     case "random":		{
		_ammoArray = [primaryWeapon _playerObject] call CBA_fnc_compatibleMagazines; //CBA
		_ammoTypeRandom = selectRandom _ammoArray;
		_ammoCount = getNumber (configfile >> "CfgMagazines" >> _ammoTypeRandom >> "count"); //ammo count in the mag
		_ammoType = getText (configfile >> "CfgMagazines" >> _ammoTypeRandom >> "ammo"); //will be used to defind the "caliber" and "extract a price per bullet
		_ammoCaliber = getNumber (configfile >> "CfgAmmo" >> _ammoType >> "caliber"); //not the "real" Caliber but seems to follow some logic
	};
     case "randompistol":		{
		_ammoArray = [handgunWeapon _playerObject] call CBA_fnc_compatibleMagazines; //CBA
		_ammoTypeRandom = selectRandom _ammoArray;
		_ammoCount = getNumber (configfile >> "CfgMagazines" >> _ammoTypeRandom >> "count"); //ammo count in the mag
		_ammoType = getText (configfile >> "CfgMagazines" >> _ammoTypeRandom >> "ammo"); //will be used to defind the "caliber" and "extract a price per bullet
		_ammoCaliber = getNumber (configfile >> "CfgAmmo" >> _ammoType >> "caliber"); //not the "real" Caliber but seems to follow some logic
	};
};
if (count _ammoArray == 0) exitWith {Diag_log "something went wrong remoteExec message Blablablabla"};
if (_ammoCaliber < 0.75) then {_ammoCaliber = 0.75};
_price = round (_ammoCaliber*_ammoCount*1.6);
//"rhsusf_40mm_HE"
if ("50rnd" in _ammoTypeDefault || "50rnd" in _ammoTypeRandom) then {_price == _price+50}; //those 50rnds HLC mags are waaaaaaayyyyyyy too cheap, especialy tac-TX, will be adjusted later
if (
	"HET" in _ammoType || "HE" in _ammoType|| "HEDP" in _ammoType||
	"HET" in _ammoTypeDefault || "HE" in _ammoTypeDefault|| "HEDP" in _ammoTypeDefault||
	"HET" in _ammoTypeRandom || "HE" in _ammoTypeRandom|| "HEDP" in _ammoTypeRandom) then { //40mm grenades are 3$ each, thats ridiculous
		_price == _price*15;
	}else {
		if (_ammoTypeDefault in _40mmHEList || _ammoTypeRandom in _40mmHEList) then {_price == _price*15;};
	};
if (_tax == "emergency")then {_price = _price*3};
if (_price < 30)then {_price = 30};
_targetUID = getPlayerUID _playerObject;
_targetOwner = (owner _playerObject);
_playerMoney = _playerObject getVariable ["ExileMoney",0]; //for local use

if (_playerMoney >= (_price*_magsCount)) then {
	if (_option == "default") then {
		_boxObject addMagazineCargoGlobal [_ammoTypeDefault, _magsCount];
		[_playerObject, (_price*_magsCount)] remoteExec ['WMS_fnc_smallTransactions'];
		hint format ["%1 in the container for %2 $",_ammoTypeDefault,(_price*_magsCount)];
	} else { //RANDOM
		if (_option == "random") then {
			_boxObject addMagazineCargoGlobal [_ammoTypeRandom, _magsCount];
			[_playerObject, (_price*_magsCount)] remoteExec ['WMS_fnc_smallTransactions'];
			hint format ["%1 in the container for %2 $",_ammoTypeRandom,(_price*_magsCount)];
		}else {
			if (_option == "randompistol") then {
				_boxObject addMagazineCargoGlobal [_ammoTypeRandom, _magsCount];
				[_playerObject, (_price*_magsCount)] remoteExec ['WMS_fnc_smallTransactions'];
				hint format ["%1 in the container for %2 $",_ammoTypeRandom,(_price*_magsCount)];
			};
		};
	};
} else {
	//Too Poor remoteExec message
		hint "Dude! You are too poor!";
};

