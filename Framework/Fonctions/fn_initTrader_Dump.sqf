
//wastDump trader
_playerObject = _this;
_vehicleObject = _playerObject getVariable ["PlayerLastVehicle", "nope"];
if ((_vehicleObject != "nope") && {(Alive _vehicleObject)}) then {
	if ((_playerObject distance2D _vehicleObject) < 100 && {((owner _vehicleObject) isEqualTo (owner _playerObject))}) then {
		[_playerObject, _vehicleObject] call WMS_fnc_processCargoDump;
	};
};

/*
_nearVehicles = nearestObjects [player, ["LandVehicle", "Air", "Ship"], 80];
{
	if (local _x) then
	{
		if (alive _x) then
		{
			//_index = _inventoryDropdown lbAdd getText(configFile >> "CfgVehicles" >> (typeOf _x) >> "displayName");
		};
	};
}forEach _nearVehicles;

if !((owner _vehicleObject) isEqualTo (owner _playerObject)) then 
{
		
};
//

if !((uniform player) isEqualTo "") then
{
	
};
if !((vest player) isEqualTo "") then
{
	
};
if !((backpack player) isEqualTo "") then
{
	
};*/