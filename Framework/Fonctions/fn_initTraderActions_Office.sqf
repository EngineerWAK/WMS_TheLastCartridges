/*Territory[] = 
	{
		20000, //TerritoryPrice = 
		100, //TerritoryRadius = 
		750, //DistTraders = 
		750, //DistSpawn = 
		300 //DistTerritories = 
	};
*/
private ["_itemsCategories","_itemsSelected","_item","_quality","_levelArray","_respectLevel","_price","_itemName","_display","_traderColors"];
params[
	"_traderObject",
	["_traderType", 'notYet'], //"office"
	["_count", 10],
	["_clientID", 0]
];

if (false) then {diag_log format ["[INIT_TRADERS_ACTIONS]|WAK|TNA|WMS|_this %1", _this]};

if (_traderType == 'notYet') exitWith {diag_log "[INIT_TRADERS]|WAK|TNA|WMS|Trader not setup yet, exiting the init"};

_officeTrader = []; //[price, radius]
_itemsCategories = [];
_hintMessage = 'This is the way';
_itemsList = getArray(missionConfigFile >> "CfgOfficeTrader" >> "itemsList");
_itemName = '';
_quality = 0;

if (false) then {diag_log format ["[INIT_TRADERS]|WAK|TNA|WMS|UPDATE: _itemsSelected %1", _itemsList]};

{
	_item = _x;
	_itemName = _item;
	if (_item == 'Territory') then {
		_itemName = "select territory Position on the map";
		_quality = 1;
	};
	if (_item == 'TradeRespect5k') then {
		_itemName = "Trade Respect (-5k) for Money (+15k)";
		_quality = 2;
	};
	if (_item == 'TradeRespect10k') then {
		_itemName = "Trade Respect (-10k) for Money (+50k)";
		_quality = 3;
	};
	if (_item == 'EmergencySupplyMeds') then {
		_itemName = "Medical Emergency Supply Drop";
		_quality = 2;
	};
	if (_item == 'HaloJump') then {
		_itemName = "Halo Jump";
		_quality = 2;
	};

	_levelArray = getArray(missionConfigFile >> "CfgRespectLevels" >> "Respect");
	_respectLevel = (_levelArray select _quality);
	_officeTrader = getArray(missionConfigFile >> "CfgOfficeTrader" >> _item);
	_price = (_officeTrader select 0);

//////////
	_display = ("<t size=""0.85""  color=""#ffffff"">" + (str _itemName) +"</t>") + ("<t size=""0.85""  color=""#ffffff"">" + ("$") + (str _price) +"</t>");
	_traderColors = getArray(missionConfigFile >> "CfgRespectColors" >> "Colors");
	switch (_quality) do
	{
		case 0: { _display = ("<t size=""0.9""  color=""#ffffff"">" + _itemName +"</t>") + ("<t size=""0.9""  color=""#ffffff"">" + (", ") + (str _price) + ("") +"</t>"); };
		case 1: { _display = ("<t size=""0.9""  color=""#8dfb7e"">" + _itemName +"</t>") + ("<t size=""0.9""  color=""#ffffff"">" + (", ") + (str _price) + ("") +"</t>"); };
		case 2: { _display = ("<t size=""0.9""  color=""#1fd507"">" + _itemName +"</t>") + ("<t size=""0.9""  color=""#ffffff"">" + (", ") + (str _price) + ("") +"</t>"); };
		case 3: { _display = ("<t size=""0.9""  color=""#07d593"">" + _itemName +"</t>") + ("<t size=""0.9""  color=""#ffffff"">" + (", ") + (str _price) + ("") +"</t>"); };
		case 4: { _display = ("<t size=""0.9""  color=""#0797d5"">" + _itemName +"</t>") + ("<t size=""0.9""  color=""#ffffff"">" + (", ") + (str _price) + ("") +"</t>"); };
		case 5: { _display = ("<t size=""0.9""  color=""#8d07d5"">" + _itemName +"</t>") + ("<t size=""0.9""  color=""#ffffff"">" + (", ") + (str _price) + ("") +"</t>"); };
		case 6: { _display = ("<t size=""0.9""  color=""#d5074b"">" + _itemName +"</t>") + ("<t size=""0.9""  color=""#ffffff"">" + (", ") + (str _price) + ("") +"</t>"); };
		default { _display = ("<t size=""0.9""  color=""#ffffff"">" + _itemName +"</t>") + ("<t size=""0.9""  color=""#ffffff"">" + (", ") + (str _price) + ("") +"</t>"); };
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
						hint ((_this select 3) select 4);
						[(_this select 3) select 0,(_this select 3) select 1,(_this select 1),(_this select 3) select 3] remoteExec ['WMS_fnc_BuyFromOffice'];
					} else {
						hint 'Bro! your respect is too low';
						execVM 'addons\intro\levels.sqf';
					};
				} else {
					hint 'You are too poor Dude';
				};
			",
			[_item,_price,_respectLevel,_item,_hintMessage], //argument accessible in the script (_this select 3)
			1,
			true,
			true,
			"",
			//"((getplayerUID _this) == (_target getVariable ['WMS_BuyerOwner', 0]) && (vehicle _this == _this))",
			"",
			5
		]
	] remoteExec [
		"addAction",
		_clientID, //0 for all players //2 server only //-2 everyone but the server
		true //JIP
	];
}forEach _itemsList;