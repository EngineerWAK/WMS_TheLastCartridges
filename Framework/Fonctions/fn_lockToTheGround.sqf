/**
 * WMS_fnc_LockToTheGround
 *
 * TNA-Community
 * https://discord.gg/Zs23URtjwF
 * © 2021 {|||TNA|||}WAKeupneo
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
//[] call WMS_fnc_lockToTheGround;
private ["_pos","_dir","_anchor"];
params [
	"_target",
	["_offsetZ", 0]
];
_pos = getposATL _target;
_dir = getDir _target;
if (true) then {diag_log format ["[LOCK_TO_THE_GROUND]|WAK|TNA|WMS|_this %1", _this]};

_anchor = createVehicle ["VR_Area_01_square_1x1_grey_F",[0,0,0], [], 0, "NONE"];
//private _anchor setObjectTextureGlobal [0, "#(rgb,8,8,3)color(0,1,0,0.15)"]; //NOPE
	
_anchor setPosATL _pos;
_anchor setDir _dir;
_anchor enableSimulationGlobal false;
_target attachTo [_anchor, [0, 0, _offsetZ]];
_target enableRopeAttach false;