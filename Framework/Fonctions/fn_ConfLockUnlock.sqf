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
if (_status == "UNLOCKED") then {
	_inventoryAcces = false;
	_vehicleObject setVariable ['WMS_howmanyrestarts', 0, true];
	};
_vehicleObject setVehicleLock _status;
[_vehicleObject,_inventoryAcces] remoteExec ["lockInventory", 0];