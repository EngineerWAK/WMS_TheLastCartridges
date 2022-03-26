//if (true) then {diag_log format ["[BUY_FROM_OFFICE]|WAK|TNA|WMS|_this %1", _this]}; //rpt client side
openMap true;
_this spawn {
	uisleep 2;
	onMapSingleClick { 
		onMapSingleClick {};
		if (true) then {diag_log format ["|WAK|WAK|WAK| EMERGENCY_SUPPLY_CHOOSE_POS |WAK|WAK|WAK| _this = %1",_this]};		
		//////////POSITION FILTER//////////
		_markersToCheck = getArray(missionConfigFile >> "CfgOfficeTrader" >> "MarkersToCheck");
		//if (true) then {diag_log format ["[BUY_FROM_OFFICE]|WAK|TNA|WMS|_markersToCheck %1", _markersToCheck]}; //rpt client side
		_markerTraders = [(_markersToCheck select 0)];
		_markerSpawns = [(_markersToCheck select 1)];
		_territoryOfficeData = getArray(missionConfigFile >> "CfgOfficeTrader" >> "territory");
		//if (true) then {diag_log format ["[BUY_FROM_OFFICE]|WAK|TNA|WMS|_territoryOfficeData %1", _territoryOfficeData]}; //rpt client side
		_zoneTrader = (_territoryOfficeData select 2);
		_zoneSpawn = (_territoryOfficeData select 3);
		_buildingAutorisation = true;
		/////Is it too close to a marker:
		{
			if (markertype _x in _markerTraders) then {
				if((_pos distance2D (getMarkerPos _x)) <= _zoneTrader)ExitWith{
					_buildingAutorisation = false;
					//"Too Close To Traders" remoteExec ["hint", (owner _caller)];
					//hint "Too Close To Traders";
					hint parseText "<t color='#ff0000'>Not available in Exclusion Zones</t>";
					openMap false;
					true
				};
			};
			if (markertype _x in _markerSpawns) then {
				if((_pos distance2D (getMarkerPos _x)) <= _zoneSpawn)ExitWith{
					_buildingAutorisation = false;
					//"Too Close To Spawn" remoteExec ["hint", (owner _caller)];
					//hint "Too Close To Spawn";
					hint parseText "<t color='#ff0000'>Not available in Exclusion Zones</t>";
					openMap false;
					true
				};
			};
		}forEach allMapMarkers;
		//////////////////////////////
		if (_buildingAutorisation) then {
			_curentEmergencySypply = player getVariable ["WMS_CurentEmergencySupply", "none"]; //'EmergencySupplyMeds'
			if !(_curentEmergencySypply == "none") then {
				[player, _pos, _curentEmergencySypply] remoteExec ['WMS_fnc_EmergencySupply', 2]; //_pos is defined by the 'click' itself
				/*_mkr1 = createMarkerLocal [format ["MKR1_%1_%2",_pos, time], _pos];
				_mkr1 setMarkerTypeLocal "selector_selectedMission";
				_mkr1 setMarkerColorLocal "colorBLUFOR";
				_mkr1 setMarkerTextLocal "Base Owner";*/
			} else {hint "Emergency Supply Error, try again later"};
		};
		openMap false;
		true
	};
};