/**
 * WMS_fnc_territoryLayoutActions
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
if (WMS_MissionDebug) then {diag_log format ["[INIT_FLAG_ACTIONS]|WAK|TNA|WMS|UPDATE: _this %1", _this]};

private _layoutsList = [
	//["display name", "layout", price, level, display color,'rigntNow' or not, waterworld or not];
	//level 1
	[
		'Farm Camp LvL1', //display name
		'farmcamp', //layout
		3000, //price
		1, //level
		'#80c606', //color
		false, //right now
		false //surface is water
	],
	['Flag Only',				'flagonly',5000,1,'#80c606',true,false], //this remove the buildings for "low profil" territory
	['Farm Camp LvL1',			'farmcamp',5000,1,'#80c606',true,false],
	['WaterWorld LvL1',			'waterworldlvl1',3000,1,'#80c606',false,true],
	['WaterWorld LvL1',			'waterworldlvl1',5000,1,'#80c606',true,true],
	//level 2
	['Bunkers Camp LvL2',		'bunkercampbigger',5000,2,'#80c606',false,false],
	['Bunkers Camp LvL2',		'bunkercampbigger',8000,2,'#80c606',true,false],
	['Farm Camp LvL2',			'farmcampbigger',5000,2,'#80c606',false,false],
	['Farm Camp LvL2',			'farmcampbigger',8000,2,'#80c606',true,false],
	['Helipad Camp LvL2',		'helipadsmall',5000,2,'#80c606',false,false],
	['Helipad Camp LvL2',		'helipadsmall',8000,2,'#80c606',true,false],
	['WaterWorld LvL2',			'waterworldlvl2',5000,2,'#80c606',false,true],
	['WaterWorld LvL2',			'waterworldlvl2',8000,2,'#80c606',true,true],
	//level 3
	['CargoPosts LvL3',			'cargopatrol',10000,3,'#80c606',false,false],
	['CargoPosts LvL3',			'cargopatrol',15000,3,'#80c606',true,false],
	['Helipad Camp LvL3',		'helipad',10000,3,'#80c606',false,false],
	['Helipad Camp LvL3',		'helipad',15000,3,'#80c606',true,false],
	['Farm LvL3, (10k)',		'farm',10000,3,'#80c606',false,false],
	['Farm LvL3, (15k)',		'farm',15000,3,'#80c606',true,false],
	['WaterWorld LvL3',			'waterworldlvl3',10000,3,'#80c606',false,true],
	['WaterWorld LvL3',			'waterworldlvl3',15000,3,'#80c606',true,true],
	//level 4
	['Farm LvL4',				'farmbig',15000,4,'#80c606',false,false],
	['Farm LvL4',				'farmbig',20000,4,'#80c606',true,false],
	['Helipad Camp LvL4',		'helipadbig',15000,4,'#80c606',false,false],
	['Helipad Camp LvL4',		'helipadbig',20000,4,'#80c606',true,false],
	['Bunker Camp LvL4',		'bunkerbig',15000,4,'#80c606',false,false],
	['Bunker Camp LvL4',		'bunkerbig',20000,4,'#80c606',true,false],
	['FOB 45x45 LvL4',			'FOB_45x45',15000,4,'#80c606',false,false],
	['FOB 45x45 LvL4',			'FOB_45x45',20000,4,'#80c606',true,false],
	['WaterWorld LvL4',			'waterworldlvl4',15000,4,'#80c606',false,true],
	['WaterWorld LvL4,',		'waterworldlvl4',20000,4,'#80c606',true,true],
	//level 5
	['HeliPadosorusRex LvL5',	'helipadosorusrex',20000,5,'#80c606',false,false],
	['HeliPadosorusRex LvL5',	'helipadosorusrex',25000,5,'#80c606',true,false],
	['NabuconosorusCamp LvL5',	'nabuconosorusCamp',20000,5,'#80c606',false,false],
	['NabuconosorusCamp LvL5',	'nabuconosorusCamp',25000,5,'#80c606',true,false],
	['FOB 45x75 LvL5',			'FOB_45x75',20000,5,'#80c606',false,false],
	['FOB 45x75 LvL5',			'FOB_45x75',25000,5,'#80c606',true,false],
	['WaterWorld LvL5',			'waterworldlvl5',20000,5,'#80c606',false,true],
	['WaterWorld LvL5',			'waterworldlvl5',25000,5,'#80c606',true,true],
	//level 6
	['THE Camp LvL6',			'thecamp',30000,6,'#80c606',false,false],
	['THE Camp LvL6',			'thecamp',35000,6,'#80c606',true,false],
	['Twin Helipad II LvL6',	'twinheliup',30000,6,'#80c606',false,false],
	['Twin Helipad II LvL6',	'twinheliup',35000,6,'#80c606',true,false],
	['Medical Center LvL6',		'medicalcenter',30000,6,'#80c606',false,false],
	['Medical Center LvL6',		'medicalcenter',35000,6,'#80c606',true,false],
	['FOB 70x70 LvL6',			'fob_70x70',30000,6,'#80c606',false,false],
	['FOB 70x70 LvL6',			'fob_70x70',35000,6,'#80c606',true,false],
	['WaterWorld LvL6',			'waterworldlvl6',30000,6,'#80c606',false,true],
	['WaterWorld LvL6',			'waterworldlvl6',35000,6,'#80c606',true,true],
	//level 6 ARMED
	['Armed Round FOB',			'circularfob',85000,6,'#80c606',false,false],
	['Armed Round FOB',			'circularfob',100000,6,'#80c606',true,false],
	['Armed Logistic Pod',		'logisticpod',95000,6,'#80c606',false,false],
	['Armed Logistic Pod',		'logisticpod',115000,6,'#80c606',true,false]
];
if (worldName == "Cam_Lao_Nam") then {
	_layoutsList = _layoutsList+[
		['SOG Camp LvL6',			'soglvl6',40000,6,'#80c606',false,false],
		['SOG Camp LvL6',			'soglvl6',45000,6,'#80c606',true,false]
	];
};
////////////////////////////////////////////////////////////////////////////
{
	//format the things
	_rightNow = 'after restart';
	if ((_x select 5)) then {_rightNow = 'right now';};
	_display = format ["<t size='0.95' color='%1'>%2, (%3k), %4</t>", (_x select 4), (_x select 0), ((_x select 2)/1000),_rightNow];
	_conditions = true;
	if (_x select 6) then { //surface is water
		_conditions = format ["
			(alive _target) &&
			{(surfaceIsWater (position _target))} &&
			{(_target getVariable ['_layoutUpgradable', true])} &&
			{((_target getVariable ['exileterritorylevel', -1]) > %1)} &&
			{((_target getVariable ['exileterritorylevel', -1]) < %2)} &&
			{((_target getVariable ['WMS_BuyerOwner', -1]) == (getPlayerUID _this))} &&
			{((_this getVariable ['exileMoney', 0]) > %3)} &&
			{(vehicle _this == _this)};
			",
			((_x select 3)-1),((_x select 3)+1),(_x select 2)
		];
	}else { //surface is not water
		_conditions = format ["
			(alive _target) &&
			{!(surfaceIsWater (position _target))} &&
			{(_target getVariable ['_layoutUpgradable', true])} &&
			{((_target getVariable ['exileterritorylevel', -1]) > %1)} &&
			{((_target getVariable ['exileterritorylevel', -1]) < %2)} &&
			{((_target getVariable ['WMS_BuyerOwner', -1]) == (getPlayerUID _this))} &&
			{((_this getVariable ['exileMoney', 0]) > %3)} &&
			{(vehicle _this == _this)};
			",
			((_x select 3)-1),((_x select 3)+2),(_x select 2)
		];
	};
	//create the actions one by one
	[ //params ["_target", "_caller", "_actionId", "_arguments"]; //condition: _target = object, _this = caller
		_flag,
		[
			_display,
			"	
				_target = _this select 0; _caller = _this select 1;
				_target setVariable ['_layoutUpgradable', false, true];
				[_target, _caller, ((_this select 3) select 2), ((_this select 3) select 1), ((_this select 3) select 5)] remoteExec ['WMS_fnc_territoryLayoutUpgrade', 2];
				hint 'Congratulation!';

			",
			_x, //argument accessible in the script ((_this select 3) select) //remember to change WMS_fnc_territoryLayoutUpgrade 'restart' to true/false
			1,
			true,
			true,
			"",
			_conditions,
			5
		]
		] remoteExec [
		"addAction",
		_caller,
		_jip
	];
}forEach _layoutsList;