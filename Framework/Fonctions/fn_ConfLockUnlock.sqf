/*
(_this select 0) setVehicleLock 'UNLOCKED';
(_this select 0) lockInventory false;
nul = [(_this select 0),'LOCKED'] remoteExec ['WMS_fnc_ConfLockUnlock', 2];*/

params [
	"_vehicleObject",
	["_status", "LOCKED"]
];
if (true) then {diag_log format ["[VEHICLES_LOCKUNLOCK]|WAK|TNA|WMS|UPDATE: _this %1", _this]};
private _inventoryAcces = true;
/*
_openVhl = getArray(missionConfigFile>>"CfgOpenVhl">>"vhl");
_territoryOfficeData = getArray(missionConfigFile >> "CfgOfficeTrader" >> "ZoneSizes");
_traderZoneSize = (_territoryOfficeData select 0);
if (typeOf _veh in _openVhl) then {
	_nearestTrader = [WMS_tradersMkrPos, _veh] call BIS_fnc_nearestPosition;
	if (_nearestTrader distance2D _veh > _traderZoneSize) then {
		_veh setVehicleLock "LOCKED";
		_veh lockInventory true;
		[_veh, true] remoteExec ["lockInventory", 0, true];
	};
}else{ 
	_veh setVehicleLock "LOCKED";
	_veh lockInventory true; //that fucking lock "localy" on the server, not client side
	[_veh, true] remoteExec ["lockInventory", 0, true]; //should execute the lock localy on every players connecting after the vehicle creation //YES!
};
*/
if (_status == "UNLOCKED") then {
	_inventoryAcces = false;
	_vehicleObject setVariable ['WMS_howmanyrestarts', 0, true];
	if !(simulationEnabled _vehicleObject) then {
		_vehicleObject enableSimulationGlobal true;
	};
	}else{
		if ((count (crew _vehicleObject)) == 0)then{
			_vehicleObject setOwner 2;
			if (true) then {diag_log format ["[VEHICLES_LOCKUNLOCK]|WAK|TNA|WMS|UPDATE: %1 transfert ownership to server", _vehicleObject]};
		};
	};
_vehicleObject setVehicleLock _status;
[_vehicleObject,_inventoryAcces] remoteExec ["lockInventory", 0];