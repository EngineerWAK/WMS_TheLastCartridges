//////////////////////////////////////////////////////////////////
//	HaloJump basic script from {|||TNA|||}WAKeupneo, www.tna-community.com
//	This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
//	To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
//////////////////////////////////////////////////////////////////

diag_log format ["*****Halo Jump 300m*****"];
diag_log format [str player];

openMap true;
onMapSingleClick {
onMapSingleClick {};
private _height = 300;    
private _randomPos = [[[_pos, 500]],[]] call BIS_fnc_randomPos;
Player setpos [(_randomPos select 0),(_randomPos select 1),_height];
openMap false;
systemchat "HaloJump 300m";
true
};
