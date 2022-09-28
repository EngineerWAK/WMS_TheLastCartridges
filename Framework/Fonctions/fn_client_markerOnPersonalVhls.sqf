/**
 * MarkerOnPersonalVhls
 *
 * {|||TNA|||}WAKeupneo
 * www.TNA-community.com
 * © 2021 {|||TNA|||}WAKeupneo
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
_this spawn {
	_mkrNameArray = [];
	//_vehicleArray = [(getPlayerUID player)] remoteExec ["WMS_fnc_getOwnedPermanentVhls", 2]; //to the server
	_vehicleArray = _this;
	diag_log format ["Permanent Vehicles Markers _this = %1",_vehicleArray];
	//uisleep 1;
	_vehCount = (count _vehicleArray);
	_vehiclesManagement = getArray(missionConfigFile >> "CfgOfficeTrader" >> "vehiclesManagement"); //select 1
	if !(_vehCount == 0) then {
		systemChat format ["%1 Personal Vehicle(s) found",_vehCount];
		_mkrType = "loc_move";
		{
			if ((_x select 0) isKindOf "Air") then {
				_mkrType = "loc_heli";
				} else {
					if ((_x select 0) isKindOf "Ship")then{
						_mkrType = "loc_boat";
					}else{
						_mkrType = "loc_car"
					};
				};
			_mkr1 = createMarkerLocal [format ["MKR1_%1_%2",(_x select 1), time], (_x select 1)]; 
			_mkr1 setMarkerTypeLocal _mkrType;
			_mkr1 setMarkerTextLocal (getText (configFile >> "CfgVehicles" >> (_x select 0) >> "displayName"));
			if ((_x select 2) >= (_vehiclesManagement select 1)) then {
				_mkr1 setMarkerColorLocal "ColorRed";
			}else{
				_mkr1 setMarkerColorLocal "ColorGUER";
			};
			
			_mkrNameArray pushBack _mkr1;
		}forEach _vehicleArray; //type, position]
		uisleep 300;
		systemChat "Deleting Personal Vehicle Markers";
		{
			deleteMarkerLocal _x;
		}forEach _mkrNameArray;
	}else {
		systemChat "No Personal Vehicle found";
	};
};