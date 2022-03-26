/*
//ACE_Action//
private _action0 = ["CoverHatchet","Cover Chopper","",{[_this]call WMS_fnc_coverHatchet},{_this getVariable ["WMS_coverHatchet",false];}] call ace_interact_menu_fnc_createAction;
[_this, 0, ["ACE_Actions"], _action0] call ace_interact_menu_fnc_addActionToObject;

_action = ["CoverHatchet", "Cover Chopper", "", {[_target]call WMS_fnc_coverHatchet},{_target getVariable ["WMS_coverHatchet",true]}, {true}] call ace_interact_menu_fnc_createAction;
["vtx_H60_base", 0, ["ACE_MainActions"], _action, true] call ace_interact_menu_fnc_addActionToClass;
*/
params [
	"_vehicleObject"
];
_coverObject = [
	["CamoNet_wdl_big_F",[0.4,2.5,0],55.6],
	//["Land_TentLamp_01_standing_red_F",[-4.8,6.2,0],291],
	["Land_SandbagBarricade_01_F",[-4.8,-2.8,0],219.9],
	["Land_SandbagBarricade_01_F",[-7.4,0.6,0],252.5],
	["Land_SandbagBarricade_01_half_F",[2.5,9.6,0],12.3],
	["Land_SandbagBarricade_01_half_F",[4.5,8.5,0],45.6],
	["Land_SandbagBarricade_01_half_F",[6.8,4.8,0],53.9],
	["Land_SandbagBarricade_01_half_F",[5.7,6.7,0],63],
	["Land_SandbagBarricade_01_half_F",[7.7,2.7,0],84.2],
	["Land_SandbagBarricade_01_half_F",[6,-1.4,0],115.9],
	["Land_SandbagBarricade_01_half_F",[7.1,0.5,0],121.5],
	["Land_SandbagBarricade_01_half_F",[3.1,-4.8,0],125.1],
	["Land_SandbagBarricade_01_half_F",[4.6,-3.1,0],137.7],
	["Land_SandbagBarricade_01_half_F",[-6.4,-1.2,0],228.6],
	["Land_SandbagBarricade_01_half_F",[-7.4,2.6,0],282.5],
	["Land_SandbagBarricade_01_half_F",[-6.8,4.7,0],288.7],
	["Land_SandbagBarricade_01_half_F",[-5.8,6.6,0],307.2],
	["Land_SandbagBarricade_01_half_F",[-4.1,8.2,0],326.1],
	["Land_SandbagBarricade_01_half_F",[-2,9.2,0],338.4],
	["Land_SandbagBarricade_01_half_F",[0.1,9.7,0],353.7]
];
_coverObjectTank = [
	["CamoNet_ghex_big_F",[0.1,-3.9,0],180],
	["Land_HBarrier_01_line_3_green_F",[-3,3.6,0],149.8],
	["Land_HBarrier_01_line_3_green_F",[0.1,4.4,0],180.4],
	["Land_HBarrier_01_line_3_green_F",[3.1,3.4,0],223.4],
	["Land_HBarrier_01_line_5_green_F",[-4.4,-2.3,0],90],
	["Land_HBarrier_01_line_5_green_F",[4.6,-2.5,0],270],
	["Land_SandbagBarricade_01_half_F",[5.1,-8,0],121.5],
	["Land_SandbagBarricade_01_half_F",[3.7,-9.4,0],155.6],
	["Land_SandbagBarricade_01_half_F",[-0.5,-9.9,0],176.1],
	["Land_SandbagBarricade_01_half_F",[1.6,-9.9,0],176.1],
	["Land_SandbagBarricade_01_half_F",[-2.4,-9.3,0],215.2],
	["Land_SandbagBarricade_01_half_F",[-3.4,-7.6,0],258.5]
	];
if (_vehicleObject isKindOf "rhs_a3t72tank_base" ||_vehicleObject isKindOf "MBT_01_base_F" ||_vehicleObject isKindOf "RHS_M2A2_Base") then {
	_coverObject = _coverObjectTank;
};
_objects = [];
_compoRefPoint = createVehicle ["VR_Area_01_circle_4_yellow_F", (position _vehicleObject), [], 0, "CAN_COLLIDE"];
_direction = (getDir _vehicleObject);
_compoRefPoint setDir _direction;
{    
	_object = createVehicle [(_x select 0), [0,0,5000], [], 0, "CAN_COLLIDE"];
	_object setdir _direction + (_x select 2); 
	_objectVectoriel = (_compoRefPoint modeltoworld  [(_x select 1 select 0),(_x select 1 select 1),0]);
	_object setposATL [(_objectVectoriel select 0),(_objectVectoriel select 1),((_x select 1) select 2)];
	_gradient = surfaceNormal position _object; 

	if ((count _x) > 3 && {(_x select 3) == "flat"}) then {
		_object setVectorUp [0,0,1];
	}else {
		_object setvectorup _gradient;
	};
	_object enableSimulationGlobal true; 
	_object allowDamage true;
	_object setVariable ["_lootAllowed",false,true];
	_object setVariable ["_territoryObject",true,true];
	_objects pushBack _object;
} forEach _coverObject; 
_vehicleObject setVariable ["WMS_coverHatchetObjects",_objects];
_vehicleObject setVariable ["WMS_Hatchetcover",false, true];
/*_vehicleObject spawn {
	uisleep 600;
	_coverObjects = _this  getVariable ["WMS_coverHatchetObjects",[]];
	{deleteVehicle _x}forEach _coverObjects;
	_this setVariable ["WMS_HatchetCover",true, true];
};*/