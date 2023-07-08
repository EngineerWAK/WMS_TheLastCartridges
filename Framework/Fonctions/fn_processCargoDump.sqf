
/*this addAction ["Process Cargo Dump", { 
		if !(count ((ItemCargo (_this select 0))+(WeaponCargo (_this select 0))+(MagazineCargo (_this select 0))+(backpackCargo (_this select 0))) == 0) then { 
			[(_this select 1), (_this select 0)] remoteExec ["WMS_fnc_processCargoDump"]; 
		} else { 
			"Cargo Dump Container is empty, you punk" remoteExec ["hint", (owner (_this select 1))]; 
		}; 
	}, 
	nil, 
	1, 
	true, 
	true, 
	"", 
	"",  
	5, 
	false 
]; //params ["_target", "_caller", "_actionId", "_arguments"];
*/
private ["_items","_item","_priceDefault","_priceAmmo","_priceGrenade","_priceRocket","_priceLauncher","_priceHeavyWeap","_priceAssault","_priceSMG","_pricePistol","_priceBunch","_priceRoll","_priceStack","_priceQuest","_priceBig",
		"_totalPriceDump","_totalScoreDump","_TotalScoreBonus","_scoreDumpCoef","_targetUID","_targetOwner","_playerUID_ExileMoney","_playerUID_ExileScore","_playerMoney","_playerScore"];
params [
	"_target", //player
	"_cargo" //the crate, "_items" could be listed server side from the _cargo
	//"_items", [] //_items = (ItemCargo _cargo)+(WeaponCargo _cargo)+(MagazineCargo _cargo)
];

//Need a WMS_CargoDumpLastCall = [_target,_cargo,time] or _cargo setVariable ["_CargoDumpLastCall", [_target,_totalPriceDump,time]]; to prevent 2 players so sell the same cargo since the call will come from AddAction
_items = (ItemCargo _cargo)+(WeaponCargo _cargo)+(MagazineCargo _cargo)+(backpackCargo _cargo);
_item = "";

_priceDefault 	= getNumber(missionConfigFile >> "cfgCargoDump" >> "priceDefault");
_priceAmmo 		= getNumber(missionConfigFile >> "cfgCargoDump" >> "priceAmmo");
_priceGrenade 	= getNumber(missionConfigFile >> "cfgCargoDump" >> "priceGrenade");
_priceRocket 	= getNumber(missionConfigFile >> "cfgCargoDump" >> "priceRocket");
_priceLauncher 	= getNumber(missionConfigFile >> "cfgCargoDump" >> "priceLauncher");
_priceHeavyWeap = getNumber(missionConfigFile >> "cfgCargoDump" >> "priceHeavyWeap");
_priceAssault 	= getNumber(missionConfigFile >> "cfgCargoDump" >> "priceAssault");
_priceSMG 		= getNumber(missionConfigFile >> "cfgCargoDump" >> "priceSMG");
_pricePistol 	= getNumber(missionConfigFile >> "cfgCargoDump" >> "pricePistol");
_scoreDumpCoef 	= getNumber(missionConfigFile >> "cfgCargoDump" >> "scoreDumpCoef");
_specialItemsToSell = getArray(missionConfigFile >> "CfgItemsCategories" >> "specialItemsToSell" >> "items");
_totalPriceDump = 0; //all item Converted to poptabs
_totalScoreDump = 0;
_TotalScoreBonus = 0;
_priceDefaultRST = _priceDefault;

if !(count _items == 0) then {
_targetUID = getPlayerUID _target;
_targetOwner = (owner _target);
_playerUID_ExileMoney = "ExileMoney_"+_targetUID;
_playerUID_ExileScore = "ExileScore_"+_targetUID;

_playerMoney = profileNamespace getVariable [_playerUID_Exilemoney,0];
_playerScore = profileNamespace getVariable [_playerUID_ExileScore,0];

//_playerMoney = _target getVariable ["ExileMoney", 0];
//_playerScore = _target getVariable ["ExileScore", 0];


{
	_item = _x;
	//SPECIAL PRICED ITEMS
	if (_item in _specialItemsToSell) then {
		_priceDefault = getNumber(missionConfigFile >> "CfgAllPrices" >> _item >> "price");
		if (true) then {diag_log format ["[WMS_fnc_processCargoDump]|WAK|TNA|WMS|player %3, SPECIAL ITEM %1, price %2", _item, _priceDefault, (getPlayerUID _target)]};
	} else {
		if (_item isKindOf ["Launcher_Base_F", configFile >> "CfgWeapons"]) then {
			//hint "this is a Launcher";
			_priceDefault = _priceLauncher;
		};
		if (_item isKindOf ["Pistol_Base_F", configFile >> "CfgWeapons"]) then {
			//hint "this is a pistol";
			_priceDefault = _pricePistol;
		};
		if (_item isKindOf ["Rifle_Base_F", configFile >> "CfgWeapons"]) then {
			if (_item isKindOf ["Rifle_Long_Base_F", configFile >> "CfgWeapons"]) then {
				//hint "this is a LMG/Sniper";
				_priceDefault = _priceHeavyWeap;
			} else {
				if (_item isKindOf ["Rifle_Short_Base_F", configFile >> "CfgWeapons"]) then {
					//hint "this is a SMG";
					_priceDefault = _priceSMG;
				} else {
					//hint "this is a Assault Rifle";
					_priceDefault = _priceAssault;
				};
			};
		};
		if (_item isKindOf ["CA_Magazine", configFile >> "CfgMagazines"]) then {
			if (_item isKindOf ["CA_LauncherMagazine", configFile >> "CfgMagazines"]) then {
				//hint "this is a rocket";
				_priceDefault = _priceRocket;
			} else {
				if (_item isKindOf ["HandGrenade", configFile >> "CfgMagazines"]) then {
					//hint "this is a grenade";
					_priceDefault = _priceGrenade;
				} else {
					//hint "this is ammo";
					//_priceDefault = _priceAmmo;
					_ammoCount = getNumber (configfile >> "CfgMagazines" >> _item >> "count");
					_ammoType = getText (configfile >> "CfgMagazines" >> _item >> "ammo");
					_ammoCaliber = getNumber (configfile >> "CfgAmmo" >> _ammoType >> "caliber"); //not the "real" Caliber but seems to follow some logic
					if (_ammoCaliber < 0.75) then {_ammoCaliber = 0.75};
					_price = round (_ammoCaliber*_ammoCount*1.5);
					_priceDefault = round (_price*0.75);
				};
			};
		};
		if (_item isKindOf ["Money_bunch", configFile >> "CfgMagazines"]) then {
			_priceDefault = getNumber(missionConfigFile >> "CfgAllPrices" >> "Money_bunch" >> "price");
			_scoreDumpCoef = 0;
			}else{
		if (_item isKindOf ["Money_roll", configFile >> "CfgMagazines"]) then {
			_priceDefault = getNumber(missionConfigFile >> "CfgAllPrices" >> "Money_Roll" >> "price");
			_scoreDumpCoef = 0;
			}else{
		if (_item isKindOf ["Money_stack_quest", configFile >> "CfgMagazines"]) then {
			_priceDefault = getNumber(missionConfigFile >> "CfgAllPrices" >> "Money_stack_quest" >> "price");
			_scoreDumpCoef = 0;
			}else{
		if (_item isKindOf ["Money_stack", configFile >> "CfgMagazines"]) then {
			_priceDefault = getNumber(missionConfigFile >> "CfgAllPrices" >> "Money_Stack" >> "price");
			_scoreDumpCoef = 0;
			}else{
		if (_item isKindOf ["Money", configFile >> "CfgMagazines"]) then {
			_priceDefault = getNumber(missionConfigFile >> "CfgAllPrices" >> "Money" >> "price");
			_scoreDumpCoef = 0;
			};};};};};
		if (true) then {diag_log format ["[WMS_fnc_processCargoDump]|WAK|TNA|WMS|player %3, Item %1, price %2", _item, _priceDefault, (getPlayerUID _target)]};
	};
	_totalPriceDump = round _totalPriceDump+_priceDefault;
	_priceDefault = _priceDefaultRST; //reset before next item
}forEach _items;

clearMagazineCargoGlobal _cargo; 
clearWeaponCargoGlobal _cargo; 
clearItemCargoGlobal _cargo; 
clearBackpackCargoGlobal _cargo;

_TotalScoreBonus = round (_totalPriceDump*_scoreDumpCoef);
_totalScoreDump = _totalScoreDump+_TotalScoreBonus;

profileNamespace setVariable [_playerUID_Exilemoney,_playerMoney+_totalPriceDump];
profileNamespace setVariable [_playerUID_ExileScore,_playerScore+_totalScoreDump];
_target setVariable ["ExileMoney", _playerMoney+_totalPriceDump, true];
_target setVariable ["ExileScore", _playerScore+_totalScoreDump, true];
saveProfileNamespace;
if (WMS_MissionDebug) then {diag_log "[WMS_fnc_processCargoDump]|WAK|TNA|WMS|ProfileNameSpace Saved"};

_msgHint = format ["Total: Money: %1, Score: %2", (profileNamespace getVariable [_playerUID_Exilemoney,0]),(profileNamespace getVariable [_playerUID_ExileScore,0])];
_msgHint remoteExec ["hint", _targetOwner];
[format ["Dumped for %1 $ and %2 Respect", _totalPriceDump, _totalScoreDump]] remoteExecCall ['SystemChat',_targetOwner];
[_msgHint] remoteExecCall ['SystemChat',_targetOwner];
};