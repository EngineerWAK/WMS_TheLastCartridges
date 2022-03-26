//////////////////////////////////////////////////////////////////
//	Rocket Man script from {|||TNA|||}WAKeupneo, www.tna-community.com
//	This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
//	To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
//////////////////////////////////////////////////////////////////
[] spawn
{
diag_log format ["*****ROCKET MAAAAAAAAANNNNNNNN*****"];   
diag_log format [str player];   
systemchat "ROCKET MAAAAAAAAANNNNNNNN";
_target = player; 
_target setVelocityModelSpace [0,30,50]; 
PlaySound "RocketMan"; 
_Shaft = "CMflare_Chaff_Ammo" createVehicle (position _target);  
_Shaft attachTo [_target, [0,0,0.9]]; 
_Light = "F_Signal_Red" createVehicle (position _target);  
_Light attachTo [_target, [0,0.25,0.7]];  
_Smoke = "smokeshell" createVehicle (position _target);  
_Smoke attachTo [_target, [0,0,0.9]]; 
playSound3D ["A3\sounds_f\weapons\Rockets\Titan_5.wss", _target, false, getPosATL _target, 1, -1, 0];
uisleep 20;
deleteVehicle _smoke;
};