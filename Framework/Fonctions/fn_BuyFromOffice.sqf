private ["_targetUID","_targetOwner","_playerUID_ExileMoney","_playerMoney","_playerUID_ExileScore","_playerScore","_itemSlotFreeOrNot"];
params [
	"_item", //'Territory', 'TradeRespect5k', 'TradeRespect10k'
	"_price",
	"_caller", //player
	"_type" //'Territory', 'TradeRespect5k', 'TradeRespect10k'
];
//[_item,_price,_caller, _type] remoteExec ['WMS_fnc_BuyFromTrader'];
if (true) then {diag_log format ["[BUY_FROM_OFFICE]|WAK|TNA|WMS|_this %1", _this]};

_targetUID = getPlayerUID _caller;
_targetOwner = (owner _caller);
_itemSlotFreeOrNot = [];
_playerUID_ExileMoney = "ExileMoney_"+_targetUID;
_playerMoney = profileNamespace getVariable [_playerUID_Exilemoney,0];
_playerUID_ExileScore = "ExileScore_"+_targetUID;
_playerScore = profileNamespace getVariable [_playerUID_ExileScore,0];

if (_item == 'TradeRespect5k' || _item == 'TradeRespect10k') then {
	if (_playerScore >= _price) then { //for respect trade the price is in respect, not in money
		_officeTrader = getArray(missionConfigFile >> "CfgOfficeTrader" >> _item);
		_cashBack = (_officeTrader select 1);
		profileNamespace setVariable [_playerUID_ExileScore,_playerScore-_price];
		profileNamespace setVariable [_playerUID_Exilemoney,_playerMoney+_cashBack];
		_caller setVariable ["ExileScore",(_playerScore-_price), true];
		_caller setVariable ["ExileMoney",(_playerMoney+_cashBack), true];
	}else {
		//message something or nothing
	};
} else {
	if (_playerMoney >= _price) then {
		if (_item == 'Territory') then {
			[_item] remoteExecCall ["WMS_fnc_chooseTerritoryPos", (owner _caller)]; //payment will be done in WMS_fnc_createTerritory
		};
		if (_item == 'EmergencySupplyMeds') then {
			_caller setVariable ["WMS_CurentEmergencySupply", _item, true];
			[_item] remoteExecCall ["WMS_fnc_chooseSupplyPos", (owner _caller)]; //payment will be done in WMS_fnc_createTerritory
		};	
		if (_item == 'EmergencySupplyWeaps') then {
			_caller setVariable ["WMS_CurentEmergencySupply", _item, true];
			[_item] remoteExecCall ["WMS_fnc_chooseSupplyPos", (owner _caller)]; //payment will be done in WMS_fnc_createTerritory
		};
		if (_item == 'HaloJump' || _item == 'HaloJumpComputer') then {
			[_item] remoteExecCall ["WMS_fnc_chooseHaloPos", (owner _caller)];
		};		
		if (_item == 'CompDoc') then {
    		_caller setVariable ["WMS_Specialist","medic",true];
    		_caller setVariable ["ace_medical_medicclass", 2, true];
			_caller setUnitTrait ["Medic",true];

			[_caller, _price] call WMS_fnc_smallTransactions;
			'You are now Medic Level 2' remoteExec ["hint", (owner _caller)];
		};		
		if (_item == 'CompEng') then {
    		_caller setVariable ["WMS_Specialist","engineer",true];
    		_caller setVariable ["ace_IsEngineer",2,true];
			_caller setUnitTrait ["Engineer",true];
			//_caller setUnitTrait ["explosiveSpecialist",true]; //Will move to "Breacher" loadout
		
			[_caller, _price] call WMS_fnc_smallTransactions;
			'You are now Engineer Level 2' remoteExec ["hint", (owner _caller)];
		};		
	};
};

/*
profileNamespace setVariable [_playerUID_Exilemoney,(_playerMoney-_price)];
_caller setVariable ["ExileMoney", _playerMoney, true];
saveProfileNamespace;
*/