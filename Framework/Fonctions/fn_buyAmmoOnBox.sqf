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
	["_option", "random"] //"random"
];
if (true) then {diag_log format ["[BUY_AMMO]|WAK|TNA|WMS|_this %1", _this]};

_magsCount = 3;
_ammoCount = 30;
_ammoType = "";
_ammoCaliber = 1;
_ammoArray = [];
_ammoTypeDefault = "";
_ammoTypeRandom = "";
//_ammoTypeDefault = _ammoArray select 0; //That's definitly NOT the default ammo
switch (tolower _option) do {
    case "default":	{
		_ammoTypeDefault = ((getArray (configfile >> "CfgWeapons" >> (primaryWeapon _playerObject) >> "magazines")) select 0);
		if ("hlc_" in (primaryweapon _playerObject) && !("hlc_" in _ammoTypeDefault)) then {_ammoTypeDefault = format["HLC_%1",_ammoTypeDefault]}; //FUCKYOU with your broken config NIA
		_ammoCount = getNumber (configfile >> "CfgMagazines" >> _ammoTypeDefault >> "count"); //ammo count in the mag
		_ammoType = getText (configfile >> "CfgMagazines" >> _ammoTypeDefault >> "ammo"); //will be used to defind the "caliber" and "extract a price per bullet
		_ammoCaliber = getNumber (configfile >> "CfgAmmo" >> _ammoType >> "caliber"); //not the "real" Caliber but seems to follow some logic
		_ammoArray = ["ammoClassName"];
	};
     case "random":		{
		_ammoArray = [primaryWeapon _playerObject] call CBA_fnc_compatibleMagazines; //CBA
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
if ("40mm" in _ammoType || "HE" in _ammoType) then {_price == _price*10}; //40mm grenades are 3$ each, thats ridiculous
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
		};
	};
} else {
	//Too Poor remoteExec message
		hint "Dude! You are too poor!";
};

