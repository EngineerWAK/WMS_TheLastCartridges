//if (true) then {diag_log format ["[BUY_FROM_OFFICE]|WAK|TNA|WMS|_this %1", _this]}; //rpt client side
openMap true;
[] spawn {
	uisleep 2;
	onMapSingleClick { 
		onMapSingleClick {};		
		//////////POSITION FILTER//////////
		_markersToCheck = getArray(missionConfigFile >> "CfgOfficeTrader" >> "MarkersToCheck");
		//if (true) then {diag_log format ["[BUY_FROM_OFFICE]|WAK|TNA|WMS|_markersToCheck %1", _markersToCheck]}; //rpt client side
		_markerTraders = [(_markersToCheck select 0)];
		_markerSpawns = [(_markersToCheck select 1)];
		_markerTerritory = [(_markersToCheck select 2)];
		_territoryOfficeData = getArray(missionConfigFile >> "CfgOfficeTrader" >> "territory");
		//if (true) then {diag_log format ["[BUY_FROM_OFFICE]|WAK|TNA|WMS|_territoryOfficeData %1", _territoryOfficeData]}; //rpt client side
		_zoneTrader = (_territoryOfficeData select 2);
		_zoneSpawn = (_territoryOfficeData select 3);
		_zoneTerritory = (_territoryOfficeData select 4);
		_buildingAutorisation = true;
		/////Is it too close to a marker:
		{
			if (markertype _x in _markerTraders) then {
				if((_pos distance2D (getMarkerPos _x)) <= _zoneTrader)ExitWith{
					_buildingAutorisation = false;
					//"Too Close To Traders" remoteExec ["hint", (owner _caller)];
					//hint "Too Close To Traders";
					hint parseText "<t color='#ff0000'>Too Close To Traders</t>";
					openMap false;
					true
				};
			};
			if (markertype _x in _markerSpawns) then {
				if((_pos distance2D (getMarkerPos _x)) <= _zoneSpawn)ExitWith{
					_buildingAutorisation = false;
					//"Too Close To Spawn" remoteExec ["hint", (owner _caller)];
					//hint "Too Close To Spawn";
					hint parseText "<t color='#ff0000'>Too Close To Spawn</t>";
					openMap false;
					true
				};
			};
			if (markertype _x in _markerTerritory) then {
				if((_pos distance2D (getMarkerPos _x)) <= _zoneTerritory)ExitWith{
					_buildingAutorisation = false;
					//"Too Close To Other Territory" remoteExec ["hint", (owner _caller)];
					//hint "Too Close To Other Territory";
					hint parseText "<t color='#ff0000'>Too Close To Other Territory</t>";
					openMap false;
					true
				};
			};
		}forEach allMapMarkers;
		//////////////////////////////
		if (_buildingAutorisation) then {
			[player, _pos] remoteExec ['WMS_fnc_CreateTerritory']; //_pos is defined by the 'click' itself
			_mkr1 = createMarkerLocal [format ["MKR1_%1_%2",_pos, time], _pos];
			_mkr1 setMarkerTypeLocal "selector_selectedMission";
			_mkr1 setMarkerColorLocal "colorBLUFOR";
			_mkr1 setMarkerTextLocal "Base Owner";
		};
		openMap false;
		true
	};
};