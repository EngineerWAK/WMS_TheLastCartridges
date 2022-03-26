params [
	"_chopper"
];
private _objects = _chopper getVariable ["WMS_coverHatchetObjects",[]];
{deleteVehicle _x}forEach _objects;
_chopper setVariable ["WMS_HatchetCover",true, true];