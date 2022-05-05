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
uisleep 60;
{deleteMarker _x}forEach _mkrNameArray;

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
//////////

///////////////////////////////////////////////
//Export and save data for later custom respawn
//////////
_magazinesAmmo = magazinesAmmo player; //need something like this to export exact count of bullets in mags
player setAmmo [primaryWeapon player, 19];
player addMagazine ["magazineName", "ammoCount"];
if !("item" isKindOf "CA_Magazine") then {};
_loadoutData = [
	["",[]], //uniform //_loadoutData select 0 select 0
	["",[]], //vest
	["",[]], //backpack
	"", //helmet
	"", //goggles/facewear
	"", //binocular
	["",["","","",""],""], //primaryWeapon
	["",["","","",""],""], //secondaryWeapon
	["",["","","",""],""], //handgunWeapon
	[],//linkItem
	[] //magazinesAmmo
];
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

/////////////
	//["Land_Destroyer_01_base_F",[0,0,0],180],
	//["Land_HelipadEmpty_F",[0,-79.4,8.76],180],
	//["ShipFlag_US_F",[0,-91.8,8.76],180]
private _shipParts = [
	["Land_Destroyer_01_hull_01_F",[0,-85,-2.65],180],
	["Land_Destroyer_01_hull_02_F",[0,-45,-2.65],180],
	["Land_Destroyer_01_hull_03_F",[-0,-0,-2.65],180],
	["Land_Destroyer_01_hull_04_F",[-0,45,-2.65],180],
	["Land_Destroyer_01_hull_05_F",[-0,80,-2.65],180],
	["Land_Destroyer_01_interior_02_F",[0,-45,-2.65],180],
	["Land_Destroyer_01_interior_03_F",[-0,0,-2.65],180],
	["Land_Destroyer_01_interior_04_F",[-0,45,-2.65],180]
];
private _pos = position player;
private _boat = "I_Boat_Armed_01_minigun_F" createVehicle _pos;
_boat allowDamage false;
{
	_part = _x select 0 createVehicle [0,0,500];
	_part setDir (_x select 2);
	_part attachTo [_boat,[_x select 1 select 0,_x select 1 select 1,_x select 1 select 2]];
}forEach _shipParts;
