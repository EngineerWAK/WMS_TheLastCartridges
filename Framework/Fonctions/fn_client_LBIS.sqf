/**
 * WMS_fnc_client_LBIS //Local Broadcast Information System
 *
 * TNA-Community
 * https://discord.gg/Zs23URtjwF
 * © 2021 {|||TNA|||}WAKeupneo
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
//["WMS_LBIS", "CHECKBOX", ["Help Messages", "Local Brodcast Information System give you 'Tips and Tricks' and information about the server"], ["WMS", "LBIS", "Local"], true] call cba_settings_fnc_init;
private ["_run","_msgs","_stuck","_cash","_R187P1","_halo","_fastTravel","_AceFatigue","_saveAndDis","_roamingVHL","_cargoDump","_fridge","_lock","_reward","_safer"];
params [
	["_msg",["This is a Local Broadcast Information System Test, stay inside, lock your doors, they are coming, but not to help you",'#ff0000',5]],
	["_option",""]
];
_run 		= WMS_LBIS; //CBA var
_msgs 		= ["default","stuck","cash","r187p1","halo","fasttravel","acefatigue","save","roamingvhl","cargodump","fridge","lock","reward","safer","dfo"];

_stuck 		= ["If you are stuck after connecting to the server with no map to respawn, just hit 'esc' and click 'respawn'","#1fd507",80];
_cash 		= ["Do not sell cash with other items, cash remove the respect bonus you can get","#1fd507",60];
_R187P1 	= ["Use the radio R-187-P1 to build a computer and activate a spawn beacon and more","#1fd507",60];
_halo 		= ["You can halo jump from the office trader","#1fd507",40];
_fastTravel = ["If you spawn as Bambi and have a territory, you can Fast Travel from spawn zones to your base","#1fd507",70];
_AceFatigue = ["Buy a medical vehicle to 'Reset ACE Fatigue' when your stamina doesn't comeback","#1fd507",60];
_saveAndDis = ["Use ACE Self Action 'Save and Disconnect' to leave the server if you want to keep your loadout","#1fd507",70];
_roamingVHL = ["You can steal Roaming AI vehices but you have to be quick before they despawn!","#1fd507",60];
_cargoDump 	= ["Use the green container at the traders to buy ammo or sell items","#1fd507",40];
_fridge 	= ["The fridge at the food trader can give you 100% food and drink","#1fd507",40];
_lock 		= ["Lock your vehicles! AI will come to steal them!","#1fd507",40];
_reward 	= ["Go claim a reward at the trader green container with all the CSAT cards","#1fd507",60];
_safer 		= ["Respawning as Bambi and Fast travel to a territory is MUCH safer than 'Save And Disconnect'","#1fd507",60];
_DFO 		= ["DFO, DynamicFlightOperations, is a mission system for helicopters, acces locked to registered players'","#1fd507",70];
_civilians 	= ["Do not kill CIVILIANS, you will be punished and anyway you can not use their vehicles","#1fd507",70];

while {_run && WMS_LBIS} do {
	uisleep 900+random 900;
	_selected = selectRandom _msgs;
	diag_log format ["LBIS %1",_selected];
	_msgs deleteAt (_msgs find _selected);
	diag_log format ["LBIS %1",_msgs];
	switch (_selected) do
		{
			case "stuck": 		{ _msg  = _stuck; };
			case "cash": 		{ _msg  =  _cash; };
			case "r187p1": 		{ _msg  =  _R187P1; };
			case "halo": 		{ _msg  =  _halo; };
			case "fasttravel": 	{ _msg  =  _fastTravel; };
			case "acefatigue": 	{ _msg  =  _AceFatigue; };
			case "save": 		{ _msg  =  _saveAndDis; };
			case "roamingvhl": 	{ _msg  =  _roamingVHL; };
			case "cargodump": 	{ _msg  =  _cargoDump; };
			case "fridge": 		{ _msg  =  _fridge; };
			case "lock": 		{ _msg  =  _lock; };
			case "reward": 		{ _msg  =  _reward; };
			case "safer": 		{ _msg  =  _safer; };
			case "dfo": 		{ _msg  =  _DFO; };
			case "civilians": 	{ _msg  =  _civilians; };
			default 			{ _msg  =  ["This is a Local Broadcast Information System Test, stay inside, lock your doors, they are coming, but not to help you",'#ff0000',100] };
		};
	[
		[
			[(_msg select 0), "<t align = 'center' shadow = '1' size = '0.7' font='PuristaLight'>%1</t>", (_msg select 2)]
		],
		0, safeZoneY + safeZoneH * 0.05
	] spawn BIS_fnc_typeText;
	if(count _msgs == 0)then{_run = false};
};