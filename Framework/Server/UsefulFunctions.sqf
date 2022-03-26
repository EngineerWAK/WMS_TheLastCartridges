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