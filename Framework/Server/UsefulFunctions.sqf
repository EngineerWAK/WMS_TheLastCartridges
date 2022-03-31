WMS_countPermanentVehicles = {
	private _permamentVehicle = profileNameSpace getVariable ["permanentVhlArray", []];
	private _count = [];
	{
		_count pushBack (_x select 0);
		_count pushBack ((count _x)-1);
	}forEach _permamentVehicle;
	_count
};

WMS_exportMissionObjects = {
	_missionObjects = [];
	private _skipObjects = ["CamCurator","#lightpoint","babe_helper","Camera","Sign_Arrow_F","Sign_Arrow_Green_F","Sign_Arrow_Yellow_F","Logic"];
	private _allObjects = nearestObjects [[0,0,0], [], 100]; 
	{ 
		if !((TypeOf _x) in _skipObjects) then {
			_pos 	= (GetPosATL _x);
			_Xpos	= [(_pos select 0), 1] call BIS_fnc_cutDecimals;
			_Ypos 	= [(_pos select 1), 1] call BIS_fnc_cutDecimals;
			_Zpos 	= [(_pos select 2), 2] call BIS_fnc_cutDecimals;
			_Dir 	= [(GetDir _x), 1] call BIS_fnc_cutDecimals;
			_object = [(TypeOf _x),[_Xpos,_Ypos,_Zpos], _Dir];
			_missionObjects pushBack _object; 
		};
	}forEach _allObjects; 
	_missionObjects sort true;
	copyToClipBoard format ["%1", _missionObjects]; 
	systemChat format ["%1 Objects Exported", (count _missionObjects)];
};

//Modify array in players permanent vehicle array
-arrayModification = {
	_UIDplayer = "76561197965501020";
	_UIDplayerArrayPos = [_UIDplayer] call WMS_fnc_findUIDinVhlArray;
	_permamentVehicle = profileNameSpace getVariable ["permanentVhlArray", []];
	_result = [];
	{
		if !(typeName _x == "STRING") then {
			_x set [8, 0]; //modification
			_result pushback _x;
		};
	}forEach (_permamentVehicle select _UIDplayerArrayPos);
	_result
};
//Set multiple markers from position in an array
_Pos_Array = [];
_mkrNameArray = [];
{  
  _mkr1 = createMarkerLocal [format ["MKR1_%1_%2",_x, time], _x]; 
  _mkr1 setMarkerTypeLocal "selector_selectedMission"; 
  _mkr1 setMarkerColorLocal "colorOPFOR";
  _mkrNameArray pushBack _mkr1;
}forEach _Pos_Array;

WMS_fnc_GetOwnedPermanentVhl = {
	params [
		"_ownerUID"
	];
	_result = [];
	_UIDplayerArrayPos = [_ownerUID] call WMS_fnc_findUIDinVhlArray; //return -1 if no result
	if !(_UIDplayerArrayPos == -1) then {
		_permamentVehicles = profileNameSpace getVariable ["permanentVhlArray", []];
		{
			if !(typeName _x == "STRING") then {
				_result pushback [_x select 1,_x select 2]; //[Type,position]
			};
		}forEach (_permamentVehicles select _UIDplayerArrayPos);
	};
	_result
};

WMS_fnc_markerOnPersonalVhls = { //spawn from client
	_Pos_Array = [];
	_mkrNameArray = [];
	_vehicleArray = [(getPlayerUID player)] remoteExec ["WMS_GetOwnedPermanentVhl", 2] //to the server
	uisleep 1;
	if !((count _vehicleArray) == 0) then {
		{ 
			_displayName = getText (configFile >> "CfgVehicles" >> (_x select 0) >> "displayName");
			_mkr1 = createMarkerLocal [format ["MKR1_%1_%2",(_x select 1), time], _x]; 
			_mkr1 setMarkerTypeLocal "loc_car"; 
			_mkr1 setMarkerText _displayName;
			_mkr1 setMarkerColorLocal "ColorGUER";
			_mkrNameArray pushBack _mkr1;
		}forEach _vehicleArray; //type, position]
		uisleep 300;
		{
			deleteMarkerLocal _x;
		}forEach _mkrNameArray;
	}else {
		systemChat "No Personal Vehicle found";
	};
};

//GetMarkers position 
_result = [];
{
	_result pushBack (getMarkerPos _x)
}forEach allMapMarkers;
_result

//prevent autoLanding, maybe
if (!isServer) then {
inGameUISetEventHandler ["Action", " 
 if (_this select 3 == 'Land') then { 
  hint 'TEXT IF NEEDED';  
  true 
 } 
"];
};

//modify player money server side
_targetUID = "76561197965501020";
_moneyToAdd = 10000;
_playerUID_ExileMoney = "ExileMoney_"+_targetUID;
_playerMoney = profileNamespace getVariable [_playerUID_Exilemoney,0];
profileNamespace setVariable [_playerUID_Exilemoney,(_playerMoney+_moneyToAdd)];
//modify player money local
_moneyToAdd = 10000;
_playerMoney = player getVariable ["ExileMoney",0];
player setVariable ["ExileMoney",(_playerMoney+_playerMoney), true];

//get players owners from server side
_result = [];
{_result pushBack [name _x, owner _x]}forEach allPlayers;
_result;
///////////////////////////////////////////////
//Export and save data for later custom respawn
	//ACE customAction "save loadout and disconnect"
WMS_fnc_client_saveRespawnData = {
	player setVariable["WMS_saveAndDisconnect",true,true]; //this to filter the difference between just dying or dying after this action
	_inventory = [player, [missionNamespace, (getPlayerUID player)], [], true ] call BIS_fnc_saveInventory;
	[player,position player,_inventory]remoteExec "WMS_fnc_saveRespawnData";
	//missionNamespace setVariable["WMS_client_canCustomRespawn",true];
};
WMS_fnc_saveRespawnData = {
	params [
		"_playerObject",
		"_pos",
		"_inventory"
	];
	private _playerUID = getPlayerUID _playerObject;
	profileNameSpace setvariable[(_playerUID+"_RespawnData"),["playerUID",_pos,_inventory]];
	private _customRespawnList = serverNameSpace getvariable["WMS_customRespawnList",[]];
	if !(_playerUID in _customRespawnList) then {
		_customRespawnList pushBack _playerUID;
		serverNameSpace setvariable["WMS_customRespawnList",_customRespawnList];
	};
	removeAllItems _playerObject;
	{_playerObject unassignItem _x; _playerObject removeItem _x}forEach (assignedItems _playerObject)
	removeBackpackGlobal _playerObject;
	removeAllWeapons _playerObject;
	removeVest _playerObject;
	removeUniform _playerObject;;
	"password" serverCommand format ["#kick %1",_playerUID];
};
WMS_fnc_deleteRespawnData = {
	params [
		"_playerObject"
	];
	private _playerUID = getPlayerUID _playerObject;
	profileNameSpace setvariable[(_playerUID+"_RespawnData"),nil];
	private _customRespawnList = serverNameSpace getvariable["WMS_customRespawnList",[]];
	_customRespawnList deleteAt (_customRespawnList find _playerUID);
	serverNameSpace setvariable["WMS_customRespawnList",_customRespawnList];
};
WMS_fnc_client_retrieveRespawnData = {
	if (missionNamespace getVariable["WMS_client_canCustomRespawn",true] && {(getPlayerUID player) in WMS_customRespawnList}) then {
		_customRespawnData = [ProfileNameSpace, ((getPlayerUID player)+"_RespawnData"), []] call BIS_fnc_getServerVariable;
		if ((count _customRespawnData) == 3) then {
			missionNamespace setVariable["WMS_client_customRespawnPos",(_customRespawnData select 1)];
			missionNamespace setVariable["WMS_client_customRespawnInv",(_customRespawnData select 2)];
			_customRespawn = [player,(_customRespawnData select 1),'Last Known Position'] call BIS_fnc_addRespawnPosition;
			missionNamespace setVariable["WMS_client_customRespawnToDelete",_customRespawn];
		}else {systemChat "No custom Spawn Data Not Available"};
	}else {systemChat "No custom Spawn Data on the server"};
};
	//this in randomizeSpawnPos.sqf //DONE
private _customRespawnPos = missionNamespace getVariable["WMS_client_customRespawnPos",[-999,-999,-999]];	
if (missionNamespace getVariable["WMS_client_canCustomRespawn",true] && {((position player) distance _customRespawnPos) <= 25})then {
	removeAllItems player;
	{player unassignItem _x; player removeItem _x}forEach (assignedItems player);
	removeBackpackGlobal player;
	removeAllWeapons player;
	removeVest player;
	removeUniform player;
	[player, [missionNamespace, "WMS_client_customRespawnInv"]] call BIS_fnc_loadInventory;
	missionNamespace setVariable["WMS_client_customRespawnPos",[-999,-999,-999]];
	missionNamespace setVariable["WMS_client_canCustomRespawn",false];
	[player] remoteExec "WMS_fnc_deleteRespawnData";
}else{
	"randomiseSpawnPos"
};
	//at server start, server need to retrieve WMS_customRespawnList from profileNamespace and store it in missionNameSpace
WMS_customRespawnList = profileNameSpace getvariable["WMS_customRespawnList",[]];
publicVariable "WMS_customRespawnList";
serverNameSpace setvariable["WMS_customRespawnList",WMS_customRespawnList]; //so the server can modify the list without modifying the public one
	//before shutdown, server must save WMS_customRespawnList from serverNameSpace to profileNameSpace
private _dataToSave = serverNameSpace getvariable["WMS_customRespawnList",[]];
profileNamespace setVariable ["WMS_customRespawnList",_dataToSave];
_loadoutData = [
	["U_C_Scientist",["ACE_Banana","ACE_Can_Spirit","ACE_fieldDressing","ACE_fieldDressing","ACE_bloodIV_250","ACE_EarPlugs","ACE_MRE_CreamTomatoSoup","ACE_tourniquet","SmokeShellGreen"]],
	["rhs_6b23_6sh116",[]],
	["B_Carryall_cbr",["ACE_Can_RedGull"]],
	"H_HelmetB_camo",
	"G_Balaclava_oli",
	"Rangefinder",
	["rhs_weap_ak105_zenitco01_b33",["rhs_acc_pgs64","","rhsusf_acc_ACOG_USMC",""],"rhs_30Rnd_545x39_7N10_AK"],
	["rhs_weap_M136",["","","",""],"rhs_m136_mag"],
	["rhsusf_weap_MP7A2_folded",["","ACE_acc_pointer_red","",""],"rhsusf_mag_40Rnd_46x30_FMJ"],
	["ItemMap","ItemCompass","ItemWatch","ItemRadio","ItemGPS","O_NVGoggles_ghex_F"],
	[]
];
player forceaddUniform ((_loadoutData select 0) select 0);
{player addItemToUniform _x}forEach  ((_loadoutData select 0) select 1);
player addVest ((_loadoutData select 1) select 0);
{player addItemToVest _x}forEach  ((_loadoutData select 1) select 1);
player addBackpackGlobal ((_loadoutData select 2) select 0);
{player addItemToBackpack _x}forEach  ((_loadoutData select 2) select 1);
player addHeadgear (_loadoutData select 3);
player addGoggles (_loadoutData select 4);
player addWeapon (_loadoutData select 5);
player addMagazine ((_loadoutData select 6) select 2);
player addWeapon ((_loadoutData select 6) select 0);
{player addPrimaryWeaponItem _x}forEach  ((_loadoutData select 6) select 1);
player addMagazine ((_loadoutData select 7) select 2);
player addWeapon ((_loadoutData select 7) select 0);
{player addSecondaryWeaponItem _x}forEach  ((_loadoutData select 7) select 1);
player addMagazine ((_loadoutData select 8) select 2);
player addWeapon ((_loadoutData select 8) select 0);
{player addHandgunItem _x}forEach  ((_loadoutData select 8) select 1);
{player additem _x; player assignItem _x}forEach  (_loadoutData select 9);

//////////////////////////////////
//////////NOTE FOR LATER//////////
private [];
params[
	["_timer", 300],
	["_message", ["chest"]],
	["_option", "option"]
];
[ 
 [ 
  ["LOADING DATA...", "<t align = 'left' shadow = '1' size = '0.7' font='PuristaMedium'>%1</t><br/>", 30], 
  ["Data loaded", "<t align = 'left' shadow = '1' size = '0.7' font='PuristaMedium'>%1</t><br/>"], 
  ["Launching Infantry Radar", "<t align = 'left' shadow = '1' size = '0.7' font='PuristaMedium'>%1</t>", 30] 
 ] 
] spawn BIS_fnc_typeText;

[
	[["LOADING DATA...", "<t align = 'left' shadow = '1' size = '0.7' font='PuristaMedium'>%1</t><br/>", 30], 
	["Data loaded", "<t align = 'left' shadow = '1' size = '0.7' font='PuristaMedium'>%1</t><br/>"], 
	["Launching Infantry Radar", "<t align = 'left' shadow = '1' size = '0.7' font='PuristaMedium'>%1</t>", 30]]	
]remoteExec ["BIS_fnc_typeText"];

[
	"Somewhere on Altis", 
	format ["Year %1", date select 0], 
	mapGridPosition player
] spawn BIS_fnc_infoText;

["<t color='#ff0000' size='.8'>Warning!<br />Stop doing what you are doing</t>",-1,-1,4,1,0,789] spawn BIS_fnc_dynamicText;

[parseText "<t font='PuristaMedium' size='1.6'>The Last Cartridges</t><br />by {|||TNA|||} WAKeupneo", true, nil, 7, 0.7, 0] spawn BIS_fnc_textTiles;

getNumber(configFile >> "CfgVehicles" >> (typeOf vehicle player) >> "maximumLoad");

[this,"WATCH"] call BIS_fnc_ambientAnim;
[123.4567, 2] call BIS_fnc_cutDecimals; //123.45

"Banana" call CBA_fnc_notify;
["Banana", 1.5, [1, 1, 0, 1]] call CBA_fnc_notify;
[["Banana", 1.5, [1, 1, 0, 1]], ["Not Apple"], true] call CBA_fnc_notify;

[[0,0,0], 0, "B_UAV_02_F", west] call BIS_fnc_spawnVehicle;
_uav = "uavobject";
createVehicleCrew _uav;