
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
//First, reset the "specialist" traits, for "after restart", no more permanent doctors or advanced engineers
_caller setVariable ["WMS_Specialist_Bambi",false,true];
_caller setVariable ["WMS_Specialist_Breacher",false,true];
_caller setVariable ["WMS_Specialist_Engineer",false,true];
_caller setVariable ["WMS_Specialist_Sniper",false,true];
_caller setVariable ["WMS_Specialist_Medic",false,true];
_caller setVariable ["WMS_Specialist_RMO",false,true]; //new
_caller setVariable ["ace_IsEngineer",0,true];
_caller setVariable ["ace_medical_medicclass", 0, true];
_caller setUnitTrait ["UAVHacker",false];
_caller setUnitTrait ["explosiveSpecialist",false];
_caller setUnitTrait ["Medic",false];
_caller setUnitTrait ["Engineer",false];
if (true) then {diag_log format ["[InitPlayerSetTrait.sqf]|WAK|TNA|WMS|THIS IS A DEBUG FOR BROKEN PLAYERS TRAITS: %1, RESET ALL TRAITS", name _caller]};
	
//if (worldName == "xcam_taunus") then {_caller setUnitTrait ["camouflageCoef",0.8]};
//Banana only for Bambi Loadout will put the Bambi class to Engineer/Medic level 2
if ("ACE_Chemlight_HiGreen" in (magazines _caller)) then { //this one spawn on the ground, random position, no map
    _caller setVariable ["WMS_Specialist_Bambi",false,true];
    _caller setVariable ["WMS_Specialist_Breacher",true,true];
    _caller setVariable ["WMS_Specialist_Engineer",true,true];
    _caller setVariable ["WMS_Specialist_Medic",true,true];
	_caller setVariable ["WMS_Specialist_RMO",true,true];
    _caller setVariable ["ace_IsEngineer",2,true];
    _caller setVariable ["ace_medical_medicclass", 2, true];
	_caller setUnitTrait ["Medic",true];
	_caller setUnitTrait ["Engineer",true];
    
	_caller setVariable ["WMS_Specialist_Sniper",true,true];
	_caller setUnitTrait ["audibleCoef",0.8];
	_caller setUnitTrait ["camouflageCoef",0.8];

	_caller setVariable ["WMS_SaveAndResp_Timer",serverTime+3600,true]; //will be use to block ACE "Save & Respawn" option
}else{

if ("ACE_Banana" in _items) then {
    _caller setVariable ["WMS_Specialist_Bambi",true,true];
    _caller setVariable ["WMS_Specialist_Breacher",false,true];
    _caller setVariable ["WMS_Specialist_Engineer",true,true];
    _caller setVariable ["WMS_Specialist_Medic",true,true];
	_caller setVariable ["WMS_Specialist_RMO",false,true]; //new
    _caller setVariable ["ace_IsEngineer",2,true];
    _caller setVariable ["ace_medical_medicclass", 2, true];
	_caller setUnitTrait ["Medic",true];
	_caller setUnitTrait ["Engineer",true];
	//_caller setUnitTrait ["UAVHacker",true]; //messing up with the new Base Weapon system
	//_caller setUnitTrait ["explosiveSpecialist",true];
	if (true) then {diag_log format ["[InitPlayerSetTrait.sqf]|WAK|TNA|WMS|THIS IS A DEBUG FOR BROKEN PLAYERS TRAITS: %1, BAMBI", name _caller]};
} else {
	//BREACHER
	if ("ACE_DefusalKit" in _items && {"ACE_DeadManSwitch" in _items} && {"ACE_M26_Clacker" in _items} && {"ACE_Clacker" in _items}) then {
    	_caller setVariable ["WMS_Specialist_Bambi",false,true];
    	_caller setVariable ["WMS_Specialist_Breacher",true,true];
    	_caller setVariable ["WMS_Specialist_Engineer",false,true];
    	_caller setVariable ["WMS_Specialist_Sniper",false,true];
    	_caller setVariable ["WMS_Specialist_Medic",false,true];
		_caller setVariable ["WMS_Specialist_RMO",false,true]; //new
		_caller setUnitTrait ["explosiveSpecialist",true];
    	_caller setVariable ["ace_IsEngineer",1,true];
    	_caller setVariable ["ace_medical_medicclass", 0, true];
		_caller setUnitTrait ["Medic",false];
		_caller setUnitTrait ["Engineer",false];
		if (true) then {diag_log format ["[InitPlayerSetTrait.sqf]|WAK|TNA|WMS|THIS IS A DEBUG FOR BROKEN PLAYERS TRAITS: %1, BREACHER", name _caller]};
	};
	//ENGINEER LEVEL
	//ToolKit Item only for Engineer Loadout
	if ("ToolKit" in _items) then {
    	_caller setVariable ["WMS_Specialist_Bambi",false,true];
    	_caller setVariable ["WMS_Specialist_Engineer",true,true];
    	_caller setVariable ["WMS_Specialist_Sniper",false,true];
    	_caller setVariable ["WMS_Specialist_Medic",false,true];
    	_caller setVariable ["WMS_Specialist_Breacher",false,true];
		_caller setVariable ["WMS_Specialist_RMO",false,true]; //new
    	_caller setVariable ["ace_IsEngineer",2,true];
    	_caller setVariable ["ace_medical_medicclass", 0, true];
		_caller setUnitTrait ["Medic",false];
		_caller setUnitTrait ["Engineer",true];
		if (true) then {diag_log format ["[InitPlayerSetTrait.sqf]|WAK|TNA|WMS|THIS IS A DEBUG FOR BROKEN PLAYERS TRAITS: %1, ENGINEER", name _caller]};
	} else {
		if ("ACE_RangeCard" in _items) then {
			//snipers not engineer
    		_caller setVariable ["WMS_Specialist_Bambi",false,true];
    		_caller setVariable ["WMS_Specialist_Sniper",true,true];
    		_caller setVariable ["WMS_Specialist_Engineer",false,true];
    		_caller setVariable ["WMS_Specialist_Medic",false,true];
    		_caller setVariable ["WMS_Specialist_Breacher",false,true];
			_caller setVariable ["WMS_Specialist_RMO",false,true]; //new
    		_caller setVariable ["WMS_CamoCoef",[0.8,0.1],true];
    		_caller setVariable ["WMS_AudiCoef",[0.8,0.1],true];
			_caller setVariable ["ace_IsEngineer",0,true];
    		_caller setVariable ["ace_medical_medicclass", 0, true];
			_caller setUnitTrait ["audibleCoef",0.8];
			_caller setUnitTrait ["camouflageCoef",0.8];
			_caller setUnitTrait ["Medic",false];
			_caller setUnitTrait ["Engineer",false];
			if (true) then {diag_log format ["[InitPlayerSetTrait.sqf]|WAK|TNA|WMS|THIS IS A DEBUG FOR BROKEN PLAYERS TRAITS: %1, SNIPER", name _caller]};
		};
	};
	//MEDIC LEVEL
	//SurgicalKit only for Medic Loadout
 	if ("ACE_personalAidKit" in _items) then {//ACE_personalAidKit //ACE_surgicalKit
    	_caller setVariable ["WMS_Specialist_Bambi",false,true];
    	_caller setVariable ["WMS_Specialist_Medic",true,true];
    	_caller setVariable ["WMS_Specialist_Engineer",false,true];
    	_caller setVariable ["WMS_Specialist_Sniper",false,true];
    	_caller setVariable ["WMS_Specialist_Breacher",false,true];
		_caller setVariable ["WMS_Specialist_RMO",false,true]; //new
    	_caller setVariable ["ace_medical_medicclass", 2, true];
		_caller setUnitTrait ["Medic",true];
    	_caller setVariable ["ace_IsEngineer",0,true];
		_caller setUnitTrait ["Engineer",false];
		if (true) then {diag_log format ["[InitPlayerSetTrait.sqf]|WAK|TNA|WMS|THIS IS A DEBUG FOR BROKEN PLAYERS TRAITS: %1, DOCTOR", name _caller]};
	} else {
		if ("ACE_RangeCard" in _items) then {
			//snipers not medic
    		_caller setVariable ["ace_medical_medicclass", 0, true];
			_caller setUnitTrait ["Medic",false];
			if (true) then {diag_log format ["[InitPlayerSetTrait.sqf]|WAK|TNA|WMS|THIS IS A DEBUG FOR BROKEN PLAYERS TRAITS: %1, NO MEDIC FOR SNIPER", name _caller]};
		};
	};
};
};
systemChat format ["You are now Medic level %1 and Engineer level %2", (_caller getVariable  ["ace_medical_medicclass", 0]), (_caller getVariable  ["ace_IsEngineer", 0])];