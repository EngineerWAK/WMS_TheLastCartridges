/**
 * WMS_fnc_client_dynamicCamo
 *
 * TNA-Community
 * https://discord.gg/Zs23URtjwF
 * © 2022 {|||TNA|||}WAKeupneo
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 /*
Modify "on the fly" the camouflage coefficient depending of:
- vehicle
- stance
- speed
- vegetation around
- ground texture (forest)
- uniform
- day/night
later:
-fire a weapon, suppressed or not
*/
WMS_DynamicCamoDebug = false;
[]spawn {
while {alive player} do {
	if (vehicle player == player) then {
    	_sounds = player getVariable ["WMS_CamoCoef",[1,0.25]];
    	_camos = player getVariable ["WMS_AudiCoef",[1,0.25]];
		_soundMax = _sounds select 0;
		_soundMin = _sounds select 1;
		_camoMax = _camos select 0;
		_camoMin = _camos select 1;
		_playerSpd = speed player;
		_playerUni = uniform player;
		_objects = count nearestObjects [position player, ["TREE", "SMALL TREE", "BUSH", "ROCK"], 4];
		_st_A = 0;_st_C = 0;
		_sp_A = 0;_sp_C = 0;
		_ob_A = 0;_ob_C = 0;
		_fo_A = 0;_fo_C = 0;
		_un_A = 0;_un_C = 0;
		_sm_A = 0;_sm_C = 0;
		switch (stance player) do
		{
			case "STAND": 		{_st_A = 0;_st_C = 0};
			case "CROUCH": 		{_st_A = 0;_st_C = -0.1};
			case "PRONE": 		{_st_A = 0;_st_C = -0.2};
			case "UNDEFINED": 	{_st_A = 0.1;_st_C = 0.1};
		};
		if (_playerSpd == 0) then {_sp_A = -0.2;_sp_C = -0.2}
		else {
			if (_playerSpd > 0 && _playerSpd < 5.4) then {_sp_A = -0.1;_sp_C = -0.1}
			else {
				if (_playerSpd >= 5.4 && _playerSpd < 10) then {_sp_A = 0.1;_sp_C = 0.1}
				else {
					if (_playerSpd >= 10 && _playerSpd < 15) then {_sp_A = 0.2;_sp_C = 0.2}
					else {
						if (_playerSpd > 15) then {_sp_A = 0.3;_sp_C = 0.3}
					};
				};
			};
		};
		if (_objects == 0) then {}
		else {
			if (_objects == 1 || _objects == 2) then {_ob_A = 0;_ob_C = -0.15}
			else {
				if (_objects == 3 || _objects == 4) then {_ob_A = -0.05;_ob_C = -0.2}
				else {
					if (_objects == 5 || _objects == 6) then {_ob_A = -0.1;_ob_C = -0.25}
					else {
						if (_objects > 6) then {_ob_A = -0.2;_ob_C = -0.3}
					};
				};
			};
		};
		if (tolower (surfaceType position player) find  "forest" > 0) then {_fo_A = -0.15;_fo_C = -0.25};
		if (_playerUni find "FullGhillie" > 0) then {_un_A = -0.1;_un_C = 0.3};
		if (_playerUni find "GhillieSuit" > 0 || _playerUni find "Sniper" > 0 ) then {_un_A = -0.05;_un_C = -0.2};
		if (_playerUni find "U_C_" > 0 || _playerUni isEqualTo "") then {_un_A = 0.1;_un_C = 0.2};
		if (sunOrMoon < 0.5) then {_sm_A = 0.1;_sm_C = -0.2};

		_sound = _soundMax+_st_A+_sp_A+_ob_A+_fo_A+_un_A+_sm_A;
		_camo = _camoMax+_st_C+_sp_C+_ob_C+_fo_C+_un_C+_sm_C;
		if (_sound > _soundMax) then {_sound = _soundMax};
		if (_sound < _soundMin) then {_sound = _soundMin};
		if (_camo > _camoMax) then {_camo = _camoMax};
		if (_camo < _camoMin) then {_camo = _camoMin};
		player setUnitTrait ["audibleCoef",_sound];
		player setUnitTrait ["camouflageCoef",_camo];
		if(WMS_DynamicCamoDebug) then {hintSilent format ["Sound %1, Camo %2", _sound, _camo]};
	}else {
		player setUnitTrait ["audibleCoef",1];
		player setUnitTrait ["camouflageCoef",1];
	};
	if(WMS_DynamicCamoDebug) then {
		uisleep 3;
	}else{
		uisleep 15;
	};
};
};