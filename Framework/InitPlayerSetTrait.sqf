
/*  Number audibleCoef - A lower value means the unit is harder to hear
    Number camouflageCoef - A lower value means the unit is harder to spot
    Number loadCoef - Equipment weight multiplier affecting fatigue and stamina
    Boolean engineer - Ability to partially repair vehicles with toolkit, equivalent to engineer = 1; in CfgVehicles
    Boolean explosiveSpecialist - Ability to defuse mines with toolkit, equivalent to canDeactivateMines = 1; in CfgVehicles
    Boolean medic - Ability to treat self and others with medikit, equivalent to attendant = 1; in CfgVehicles
    Boolean UAVHacker - Ability to hack drones, equivalent to uavHacker = 1; in CfgVehicles
*/
private ["_items"];

params [
	"_caller"
];

_items = (items _caller);
    
//if (worldName == "xcam_taunus") then {_caller setUnitTrait ["camouflageCoef",0.8]};
//Banana only for Bambi Loadout will put the Bambi class to Engineer/Medic level 2
if ("ACE_Banana" in _items) then {
    _caller setVariable ["WMS_Specialist_Bambi",true,true];
    	_caller setVariable ["WMS_Specialist_Engineer",true,true];
    	_caller setVariable ["WMS_Specialist_Medic",true,true];
    _caller setVariable ["ace_IsEngineer",2,true];
    _caller setVariable ["ace_medical_medicclass", 2, true];
	_caller setUnitTrait ["Medic",true];
	_caller setUnitTrait ["Engineer",true];
	//_caller setUnitTrait ["UAVHacker",true]; //messing up with the new Base Weapon system
	_caller setUnitTrait ["explosiveSpecialist",true];
} else {
	//BREACHER
	if ("ACE_DefusalKit" in _items && {"ACE_DeadManSwitch" in _items} && {"ACE_M26_Clacker" in _items} && {"ACE_Clacker" in _items}) then {
    	_caller setVariable ["WMS_Specialist_Breacher",true,true];
		_caller setUnitTrait ["explosiveSpecialist",true];
    	_caller setVariable ["ace_IsEngineer",1,true];
	};
	//ENGINEER LEVEL
	//ToolKit Item only for Engineer Loadout
	if ("ToolKit" in _items) then {
    	_caller setVariable ["WMS_Specialist_Engineer",true,true];
    	_caller setVariable ["ace_IsEngineer",2,true];
		_caller setUnitTrait ["Engineer",true];
	} else {
		if ("ACE_RangeCard" in _items) then {
			//snipers not engineer
    		_caller setVariable ["WMS_Specialist_Sniper",true,true];
    		_caller setVariable ["WMS_CamoCoef",[0.8,0.1],true];
    		_caller setVariable ["WMS_AudiCoef",[0.8,0.1],true];
			_caller setVariable ["ace_IsEngineer",0,true];
			_caller setUnitTrait ["audibleCoef",0.8];
			_caller setUnitTrait ["camouflageCoef",0.8];
		}else{
			_caller setVariable ["ace_IsEngineer",1,true];
		};
	
	};
	//MEDIC LEVEL
	//SurgicalKit only for Medic Loadout
 	if ("ACE_surgicalKit" in _items) then {
    	_caller setVariable ["WMS_Specialist_Medic",true,true];
    	_caller setVariable ["ace_medical_medicclass", 2, true];
		_caller setUnitTrait ["Medic",true];
	} else {
		if ("ACE_RangeCard" in _items) then {
			//snipers not medic
    		_caller setVariable ["ace_medical_medicclass", 0, true];
		}else{
    		_caller setVariable ["ace_medical_medicclass", 1, true];
		};
	};
};

systemChat format ["You are now Medic level %1 and Engineer level %2", (_caller getVariable  ["ace_medical_medicclass", 0]), (_caller getVariable  ["ace_IsEngineer", 0])];