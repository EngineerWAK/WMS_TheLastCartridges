//[this, "CarsToBuy", 5] call WMS_fnc_initTraderActions_vehicles;
private ["_itemsCategories","_itemsSelected","_item","_quality","_levelArray","_respectLevel","_price","_itemName","_display","_traderColors"];
params[
	"_traderObject",
	["_traderType", 'notYet'], //"SniperRifles" //"CarsToBuy" class from Cfg
	["_count", 10],
	["_clientID", 0]
];

if (false) then {diag_log format ["[INIT_TRADERS_ACTIONS]|WAK|TNA|WMS|_this %1", _this]};
if (_traderType == 'notYet') exitWith {diag_log "[INIT_TRADERS]|WAK|TNA|WMS|Trader not setup yet, exiting the init"};
_itemsCategories = [];

if (_traderType == 'specopsItems') then {
	_traderType = 'specops'; //' ' and not " "
	_itemsCategories = getArray(missionConfigFile >> "CfgWeapCategories" >> "launchers" >> "items");
	_itemsCategories = _itemsCategories + getArray(missionConfigFile >> "CfgItemsCategories" >> "Specops" >> "items");
};
if (_traderType == 'specopsItems_RHS') then {
	_traderType = 'specops'; //' ' and not " "
	_itemsCategories = getArray(missionConfigFile >> "CfgWeapCategories" >> "launchers_RHS" >> "items");
	_itemsCategories = _itemsCategories + getArray(missionConfigFile >> "CfgItemsCategories" >> "Specops_RHS" >> "items");
};
if (_traderType == 'specopsExplo') then {
	_traderType = 'specops'; //' ' and not " "
	_itemsCategories = getArray(missionConfigFile >> "CfgAmmoCategories" >> "RocketMissiles" >> "items");
	_itemsCategories = _itemsCategories + getArray(missionConfigFile >> "CfgItemsCategories" >> "Specops" >> "explo");
	_itemsCategories = _itemsCategories + getArray(missionConfigFile >> "CfgItemsCategories" >> "Specops" >> "grenades");
};
if (_traderType == 'specopsExplo_RHS') then {
	_traderType = 'specops'; //' ' and not " "
	_itemsCategories = getArray(missionConfigFile >> "CfgAmmoCategories" >> "RocketMissiles_RHS" >> "items");
	_itemsCategories = _itemsCategories + getArray(missionConfigFile >> "CfgItemsCategories" >> "Specops_RHS" >> "explo");
	_itemsCategories = _itemsCategories + getArray(missionConfigFile >> "CfgItemsCategories" >> "Specops_RHS" >> "grenades");
};

_itemsSelected = [];
for "_i" from 1 to _count do {
	_item = selectRandom _itemsCategories;
	_itemsCategories deleteAt (_itemsCategories find _item);
	_itemsSelected pushBack _item;
};
if (false) then {diag_log format ["[INIT_TRADERS]|WAK|TNA|WMS|UPDATE: _itemsSelected %1", _itemsSelected]};
{
	_item = _x;
	_itemName = _item;
	_quality = getNumber(missionConfigFile >> "CfgAllPrices" >> _item >> "quality"); //_Respectlevel 0 to 7
	_levelArray = getArray(missionConfigFile >> "CfgRespectLevels" >> "Respect");
	_respectLevel = (_levelArray select _quality);
	_price = getNumber(missionConfigFile >> "CfgAllPrices" >> _item >> "price");

//THIS CHANGE:
		//WEAPONS
	if (
			_item in getArray(missionConfigFile >> "CfgWeapCategories" >> "launchers" >> "items") ||
			_item in getArray(missionConfigFile >> "CfgItemsCategories" >> "Specops" >> "items") ||
			_item in getArray(missionConfigFile >> "CfgWeapCategories" >> "launchers_RHS" >> "items") ||
			_item in getArray(missionConfigFile >> "CfgItemsCategories" >> "Specops_RHS" >> "items")
		) then {
			_itemName =  getText (configFile >> "CfgWeapons" >> _item >> "displayName");
	};
		//MAGAZINES
	if (
			_item in getArray(missionConfigFile >> "CfgAmmoCategories" >> "RocketMissiles" >> "items") ||
			_item in getArray(missionConfigFile >> "CfgItemsCategories" >> "Specops" >> "explo") ||
			_item in getArray(missionConfigFile >> "CfgItemsCategories" >> "Specops" >> "grenades") ||
			_item in getArray(missionConfigFile >> "CfgAmmoCategories" >> "RocketMissiles_RHS" >> "items") ||
			_item in getArray(missionConfigFile >> "CfgItemsCategories" >> "Specops_RHS" >> "explo") ||
			_item in getArray(missionConfigFile >> "CfgItemsCategories" >> "Specops_RHS" >> "grenades")
		) then {
			_itemName =  getText (configFile >> "CfgMagazines" >> _item >> "displayName");
	};
		//VEHICLES
	if (false) then {
		_itemName =  getText (configFile >> "CfgVehicles" >> _item >> "displayName");
	};

//Modify display name
/*
	if (_item in (getArray(missionConfigFile >> "CfgWeapCategories" >> "Accessories" >> "Scopes"))) then {
		_itemName = format ["SCP %1",_itemName];
	};
	if (_item in (getArray(missionConfigFile >> "CfgWeapCategories" >> "Accessories" >> "LaserLights"))) then {
		_itemName = format ["LZR %1",_itemName];
	};
	if (_item in (getArray(missionConfigFile >> "CfgWeapCategories" >> "Accessories" >> "Bipods"))) then {
		_itemName = format ["GRP %1",_itemName];
	};
*/

//////////
	_display = ("<t size=""0.85""  color=""#ffffff"">" + (str _itemName) +"</t>") + ("<t size=""0.85""  color=""#ffffff"">" + ("$") + (str _price) +"</t>");
	_traderColors = getArray(missionConfigFile >> "CfgRespectColors" >> "Colors");
	switch (_quality) do
	{
		case 0: { _display = ("<t size=""0.9""  color=""#ffffff"">" + _itemName +"</t>") + ("<t size=""0.9""  color=""#ffffff"">" + (", ") + (str _price) + (" PopTabs") +"</t>"); };
		case 1: { _display = ("<t size=""0.9""  color=""#8dfb7e"">" + _itemName +"</t>") + ("<t size=""0.9""  color=""#ffffff"">" + (", ") + (str _price) + (" PopTabs") +"</t>"); };
		case 2: { _display = ("<t size=""0.9""  color=""#1fd507"">" + _itemName +"</t>") + ("<t size=""0.9""  color=""#ffffff"">" + (", ") + (str _price) + (" PopTabs") +"</t>"); };
		case 3: { _display = ("<t size=""0.9""  color=""#07d593"">" + _itemName +"</t>") + ("<t size=""0.9""  color=""#ffffff"">" + (", ") + (str _price) + (" PopTabs") +"</t>"); };
		case 4: { _display = ("<t size=""0.9""  color=""#0797d5"">" + _itemName +"</t>") + ("<t size=""0.9""  color=""#ffffff"">" + (", ") + (str _price) + (" PopTabs") +"</t>"); };
		case 5: { _display = ("<t size=""0.9""  color=""#8d07d5"">" + _itemName +"</t>") + ("<t size=""0.9""  color=""#ffffff"">" + (", ") + (str _price) + (" PopTabs") +"</t>"); };
		case 6: { _display = ("<t size=""0.9""  color=""#d5074b"">" + _itemName +"</t>") + ("<t size=""0.9""  color=""#ffffff"">" + (", ") + (str _price) + (" PopTabs") +"</t>"); };
		default { _display = ("<t size=""0.9""  color=""#ffffff"">" + _itemName +"</t>") + ("<t size=""0.9""  color=""#ffffff"">" + (", ") + (str _price) + (" PopTabs") +"</t>"); };
	};
	//_display = format ['<t color=%3> %1, %2 poptabs</t>',_itemName,_price, _color]; //NOPE, not with colors
	//_display = ((str _color) + (str _itemName) + (str _price)+ "</t>");// NOPE

	if (false) then {diag_log format ["[INIT_TRADERS]|WAK|TNA|WMS|_item %1, _quality %2, _respectLevel %3, _price %4", _item, _quality, _respectLevel, _price]};

	[ //params ["_target", "_caller", "_actionId", "_arguments"];
		_traderObject,
		[
						//[(_this select 3) select 0,(_this select 3) select 1,(_this select 1),(_this select 3) select 3] remoteExec ['WMS_fnc_BuyFromTrader']; //_item, _price, player
						//[(_this select 3) select 0,(_this select 1)] remoteExec ['WMS_fnc_createPermanentVHL'];
			//"<t color='#035c10'>Lock/Unlock</t>",
			_display,
			"
				if ((_this select 1) getVariable ['ExileMoney', 0] >= (_this select 3) select 1) then {
					if ((_this select 1) getVariable ['ExileScore', 0] >= (_this select 3) select 2) then {
						[(_this select 3) select 0,(_this select 3) select 1,(_this select 1),(_this select 3) select 3] remoteExec ['WMS_fnc_BuyFromTrader'];
					} else {
						hint 'Bro! your respect is too low';
						execVM 'addons\intro\levels.sqf';
					};
				} else {
					hint 'You are too poor Dude';
				};
			",
			[_item,_price,_respectLevel,_traderType], //argument accessible in the script (_this select 3)
			1,
			true,
			true,
			"",
			//"((getplayerUID _this) == (_target getVariable ['BuyerOwner', 0]) && (vehicle _this == _this))",
			"",
			5
		]
	] remoteExec [
		"addAction",
		_clientID, //0 for all players //2 server only //-2 everyone but the server
		true //JIP
	];
}forEach _itemsSelected;