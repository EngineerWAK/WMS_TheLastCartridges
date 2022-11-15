/**
 * WMS_fnc_client_createBasemarkers
 *
 * TNA-Community
 * https://discord.gg/Zs23URtjwF
 * © 2021 {|||TNA|||}WAKeupneo
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
private ["_baseNamesList","_MkrCount","_mkr1", "_mkr2","_markerSystem"];
params [
	["_owner", []],
	["_traveler", []]
];
if (WMS_MissionDebug) then {diag_log format ["[PLAYERBASEMARKERS]|WAK|TNA|WMS| _this: %1", _this]}; //local
_baseNamesList = ["ABLE","BAKER","CHARLIE"];
_MkrCount = count _baseNamesList;
{
	if !(_MkrCount == 0) then { //ColorKhaki
		_mkr1 = createMarkerLocal [format ["MKR1_%1_%2",_x, time], _x];
		_mkr1 setMarkerTypeLocal "selector_selectedMission";
		_mkr1 setMarkerColorLocal "colorBLUFOR";
		_mkr1 setMarkerTextLocal format ["%1, Base Owner", (_baseNamesList select 0)];
		_baseNamesList deleteat 0;
		_MkrCount = _MkrCount-1;
		
		_mkr2 = createMarkerLocal [format ["MKR2_%1_%2",_x, time], _x];
		_mkr2 setMarkerColorLocal "ColorKhaki"; //maybe change later
		_mkr2 setMarkerShapeLocal "ELLIPSE";
		_mkr2 setMarkerBrushLocal "border";
		_mkr2 setMarkerSizeLocal [300,300];
		_mkr3 = createMarkerLocal [format ["MKR3_%1_%2",_x, time], _x];
		_mkr3 setMarkerColorLocal "ColorKhaki"; //maybe change later
		_mkr3 setMarkerShapeLocal "ELLIPSE";
		_mkr3 setMarkerBrushLocal "border";
		_mkr3 setMarkerSizeLocal [100,100];
	};
	uisleep 0.1;
}forEach _owner;//[_flagID,_pos,_territoryLevel,_targetUID,[_targetUID],_flagDir,_layout];
uisleep 0.1;
{
	if !(_x in _owner) then {
		if !(_MkrCount == 0) then {
			_mkr2 = createMarkerLocal [format ["MKR1_%1_%2",_x, time], _x];
			_mkr2 setMarkerTypeLocal "selector_selectedFriendly";
			_mkr2 setMarkerColorLocal "colorBLUFOR";
			_mkr2 setMarkerTextLocal format ["%1 FastTraveler", (_baseNamesList select 0)];
			_baseNamesList deleteat 0;
			_MkrCount = _MkrCount-1;
		};
	};
}forEach _traveler;//[_flagID,_pos,_territoryLevel,_targetUID,[_targetUID],_flagDir,_layout];

/*
//////////Mission File version on the map//////////
_markerSystem = createMarkerLocal ["MissionVersion", [(worldsize /2),-500]];
_markerSystem setMarkerTypeLocal "mil_dot";
_markerSystem setMarkerColorLocal "ColorKhaki";
_markerSystem setMarkerTextLocal (format ["The Last Cartridges %1 ", getText(missionConfigFile >> "CfgSystemVersion" >> "name")]);
*/