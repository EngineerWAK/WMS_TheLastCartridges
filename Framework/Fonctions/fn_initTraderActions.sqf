/**
 * WMS_fnc_initTraderActions
 *
 * TNA-Community
 * https://discord.gg/Zs23URtjwF
 * © 2021 {|||TNA|||}WAKeupneo
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
//[this, "CarsToBuy", 5] call WMS_fnc_initTraderActions_vehicles;
private ["_itemsCategories","_itemsSelected","_item","_quality","_levelArray","_respectLevel","_price","_itemName","_display","_traderColors"];
params[
	"_traderObject",
	["_traderType", 'notYet'], //'notyet','weapons','equipement','office','accessories','vehiclesarmed','vehiclesunarmed','airarmed','airunarmed'
	["_count", 10],
	["_clientID", 0]
];
_traderObject allowDamage false;

if (false) then {diag_log format ["[INIT_TRADERS_ACTIONS]|WAK|TNA|WMS|_this %1", _this]};
if (_traderType == 'notYet') exitWith {diag_log "[INIT_TRADERS]|WAK|TNA|WMS|Trader not setup yet, exiting the init"};
if (_traderType == 'weapons' || _traderType == 'accessories' || _traderType == 'weapons_RHS' || _traderType == 'weapons_RHS_NIA' || _traderType == 'accessories_RHS' || _traderType == 'accessories_RHS_NIA') exitWith {[_traderObject, _traderType, _count] call WMS_fnc_initTraderActions_Weapons;};
if (_traderType == 'equipement' || _traderType == 'foodandhealth' || _traderType == 'equipement_RHS' || _traderType == 'foodandhealth_RHS') exitWith {[_traderObject, _traderType, _count] call WMS_fnc_initTraderActions_Equipement;};
if (_traderType == 'office') exitWith {[_traderObject, _traderType, _count] call WMS_fnc_initTraderActions_Office;};
if (_traderType == 'specopsItems' || _traderType == 'specopsExplo' || _traderType == 'specopsItems_RHS' || _traderType == 'specopsExplo_RHS') exitWith {[_traderObject, _traderType, _count] call WMS_fnc_initTraderActions_Specops;};
_itemsCategories = getArray(missionConfigFile >> "CfgVehicleCategories" >> _traderType >> "items");
_itemsSelected = [];
if (_traderType == "vehiclesunarmed" || _traderType == "vehiclesunarmed_RHS" || _traderType == "vehiclesunarmed_RHS_Hatchet" || _traderType == "VehiclesUnarmed_GM") then {
	_itemsSelected pushBack "C_Quadbike_01_F"; //forced low respect vehicle
};
for "_i" from 1 to _count do {
	_item = selectRandom _itemsCategories;
	_itemsCategories deleteAt (_itemsCategories find _item);
	_itemsSelected pushBack _item;
};
if (false) then {diag_log format ["[INIT_TRADERS]|WAK|TNA|WMS|UPDATE: _itemsSelected %1", _itemsSelected]};
{
	_item = _x;
	_quality = getNumber(missionConfigFile >> "CfgAllPrices" >> _item >> "quality");
	_levelArray = getArray(missionConfigFile >> "CfgRespectLevels" >> "Respect");
	_respectLevel = (_levelArray select _quality);
	_price = getNumber(missionConfigFile >> "CfgAllPrices" >> _item >> "price");
	_itemName =  getText (configFile >> "CfgVehicles" >> _item >> "displayName");
	_display = ("<t size=""0.85""  color=""#ffffff"">" + (str _itemName) +"</t>") + ("<t size=""0.85""  color=""#ffffff"">" + ("$") + (str _price) +"</t>");
	_traderColors = getArray(missionConfigFile >> "CfgRespectColors" >> "Colors");
	switch (_quality) do
	{
		case 0: { _display = ("<t size=""0.9""  color=""#ffffff"">" + _itemName +"</t>") + ("<t size=""0.9""  color=""#ffffff"">" + (", ") + (str _price) + (" $") +"</t>"); };
		case 1: { _display = ("<t size=""0.9""  color=""#8dfb7e"">" + _itemName +"</t>") + ("<t size=""0.9""  color=""#ffffff"">" + (", ") + (str _price) + (" $") +"</t>"); };
		case 2: { _display = ("<t size=""0.9""  color=""#1fd507"">" + _itemName +"</t>") + ("<t size=""0.9""  color=""#ffffff"">" + (", ") + (str _price) + (" $") +"</t>"); };
		case 3: { _display = ("<t size=""0.9""  color=""#07d593"">" + _itemName +"</t>") + ("<t size=""0.9""  color=""#ffffff"">" + (", ") + (str _price) + (" $") +"</t>"); };
		case 4: { _display = ("<t size=""0.9""  color=""#0797d5"">" + _itemName +"</t>") + ("<t size=""0.9""  color=""#ffffff"">" + (", ") + (str _price) + (" $") +"</t>"); };
		case 5: { _display = ("<t size=""0.9""  color=""#8d07d5"">" + _itemName +"</t>") + ("<t size=""0.9""  color=""#ffffff"">" + (", ") + (str _price) + (" $") +"</t>"); };
		case 6: { _display = ("<t size=""0.9""  color=""#d5074b"">" + _itemName +"</t>") + ("<t size=""0.9""  color=""#ffffff"">" + (", ") + (str _price) + (" $") +"</t>"); };
		default { _display = ("<t size=""0.9""  color=""#ffffff"">" + _itemName +"</t>") + ("<t size=""0.9""  color=""#ffffff"">" + (", ") + (str _price) + (" $") +"</t>"); };
	};

	if (false) then {diag_log format ["[INIT_TRADERS]|WAK|TNA|WMS|_item %1, _quality %2, _respectLevel %3, _price %4", _item, _quality, _respectLevel, _price]};

	[ //params ["_target", "_caller", "_actionId", "_arguments"];
		_traderObject,
		[
			_display,
			"
				if ((_this select 1) getVariable ['ExileMoney', 0] >= (_this select 3) select 1) then {
					if ((_this select 1) getVariable ['ExileScore', 0] >= (_this select 3) select 2) then {
						hint 'Ok, now we are talking';
						[(_this select 3) select 0,(_this select 3) select 1,(_this select 1),(_this select 3) select 3] remoteExec ['WMS_fnc_BuyFromTrader'];
					} else {
						hint 'Bro! your respect is too low';
						execVM 'Custom\Intro\levels.sqf';
					};
				} else {
					hint 'You are too poor Dude';
				};
			",
			[_item,_price,_respectLevel,'vehicle'], //argument accessible in the script (_this select 3)
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
}forEach _itemsSelected;