//[(_this select 1), (_this select 0)] remoteExec ['WMS_fnc_sellVehicles'];

private ["_scoreDumpCoef","_totalPriceDump","_totalScoreDump","_TotalScoreBonus","_targetUID","_targetOwner","_playerUID_ExileMoney","_playerUID_ExileScore","_playerMoney","_playerScore","_reSellCoef"];
params [
	"_target", //player
	"_cargo" //the crate, "_items" could be listed server side from the _cargo
]; 
if (WMS_MissionDebug) then {diag_log format ["[SELLVEHICLES]|WAK|TNA|WMS| _this = %1", _this]};

_itemClassName = TypeOf _cargo;
_cfgPriceDump = 0;
//_totalPriceDump = 5000; //the vehicle itself, fix for now
_totalPriceDump = getNumber(missionConfigFile >> "cfgCargoDump" >> "vhlDefaultPrice");
_tankPriceDump 	= getNumber(missionConfigFile >> "cfgCargoDump" >> "tanksPrice");
_APCPriceDump 	= getNumber(missionConfigFile >> "cfgCargoDump" >> "APCPrice");
_reSellCoef 	= getNumber(missionConfigFile >> "cfgCargoDump" >> "priceReSellCoef");
if !(_itemClassName == "") then {
	_cfgPriceDump = getNumber(missionConfigFile >> "CfgAllPrices" >> _itemClassName >> "price"); //What if the vehicle/crate is not in the CfgAllPrices? // With an not existing entry, getNumber returns 0. 
	if !(_cfgPriceDump == 0) then {
		_totalPriceDump = round (_cfgPriceDump*_reSellCoef);
		if (_cargo isKindOf "tank" && {_cfgPriceDump >= _tankPriceDump}) then {
			_totalPriceDump = round (_tankPriceDump*_reSellCoef);
		};
		if (_cargo isKindOf "Wheeled_Apc_F" && {_cfgPriceDump >= _APCPriceDump}) then {
			_totalPriceDump = round (_APCPriceDump*_reSellCoef);
		};
	}else{
		if (_cargo isKindOf "tank") then {
			_totalPriceDump = round (_tankPriceDump*_reSellCoef);
		};
		if (_cargo isKindOf "Wheeled_Apc_F") then {
			_totalPriceDump = round (_APCPriceDump*_reSellCoef);
		};
	};
}; 
if (WMS_MissionDebug) then {diag_log format ["[SELLVEHICLES]|WAK|TNA|WMS| _itemClassName = %3 _cfgPriceDump = %1 _totalPriceDump = %2", _cfgPriceDump, _totalPriceDump, _itemClassName]};

_scoreDumpCoef 	= getNumber(missionConfigFile >> "cfgCargoDump" >> "scoreDumpCoef");
_totalScoreDump = 0;
_TotalScoreBonus = 0;

_targetUID = getPlayerUID _target;
_targetOwner = (owner _target);
_playerUID_ExileMoney = "ExileMoney_"+_targetUID;
_playerUID_ExileScore = "ExileScore_"+_targetUID;

_playerMoney = profileNamespace getVariable [_playerUID_Exilemoney,0];
_playerScore = profileNamespace getVariable [_playerUID_ExileScore,0];

_TotalScoreBonus = round (_totalPriceDump*_scoreDumpCoef);
_totalScoreDump = _totalScoreDump+_TotalScoreBonus;

//////RESELL PERMANENT VEHICLES
_isPermanent 	= _cargo getVariable ["WMS_permanentvhl", false];
_isAMS 			= _cargo getVariable ["AMS_MissionReward", false]; //not used yet
_isRoaming 		= _cargo getVariable ["roamingAIVehicle", false];

if (_isPermanent) then {
	//Vehicles destroyed/sold, removing from player array
	_vehicleID = _cargo getVariable ["WMS_vehicleid", -1]; //OK
	_ownerUID = _cargo getVariable ["WMS_buyerowner", -1]; //OK
	_permanentVhlArray = profileNameSpace getVariable ["WMS_permanentVhlArray", []];  //OK but not the same = [playerUID, [vhlHexaID,vhlHexaID,vhlHexaID]];
	//_playerVHLarray = profileNameSpace getVariable [_targetUID+"_VHLs", [_targetUID,[]]]; //NEW, replace _permanentVhlArray+_playerArrayNumber for the vehicle datas
	_playerVHLarray = profileNameSpace getVariable [_targetUID+"_VHLs", [_targetUID]]; //NEW, replace _permanentVhlArray+_playerArrayNumber for the vehicle datas
	_playerArrayNumber = _ownerUID call WMS_fnc_findUIDinVhlArray; //find the owner Array in the _permanentVhlArray //OK but not the one with all the data from the vehicle
	((_permanentVhlArray select _playerArrayNumber) select 1) deleteAt (((_permanentVhlArray select _playerArrayNumber) select 1) find _vehicleID);//NEW this take care only of the _vehicleID
	_vehicleArrayNumber = [_targetUID,_vehicleID] call WMS_fnc_findVhlIDinVhlArray; //return -1 if fuckedup //OK

	if (_vehicleArrayNumber != -1)then{
		_playerVHLarray deleteAt _vehicleArrayNumber;
	}else {
		diag_log format["[WMS_fnc_SellVehicles]|WAK|TNA|WMS|SOMETHING IS REALLY BROKEN WITH THIS PERMENENT VEHICLE _this = %1",_this];
	};
	profileNameSpace setVariable ["WMS_permanentVhlArray", _permanentVhlArray];	//WHY IT WASN'T THERE BEFORE???
	profileNameSpace setVariable [_targetUID+"_VHLs", _playerVHLarray];	//WHY IT WASN'T THERE BEFORE???
	_totalScoreDump = 0;
};
if (_isRoaming) then {
	_totalPriceDump = 5000;
	_totalScoreDump = 50;
};
/////////
profileNamespace setVariable [_playerUID_Exilemoney,_playerMoney+_totalPriceDump];
profileNamespace setVariable [_playerUID_ExileScore,_playerScore+_totalScoreDump];
_target setVariable ["ExileMoney", _playerMoney+_totalPriceDump, true];
_target setVariable ["ExileScore", _playerScore+_totalScoreDump, true];
//saveProfileNamespace;

//need to eject all players fom it (should be done BEFORE the transaction or as "condition" for the AddAction)
deleteVehicle _cargo;

_msgHint = format ["Total: Money: %1, Score: %2", (profileNamespace getVariable [_playerUID_Exilemoney,0]),(profileNamespace getVariable [_playerUID_ExileScore,0])];
_msgHint remoteExec ["hint", _targetOwner];
[format ["Dumped for %1 $ and %2 Respect", _totalPriceDump, _totalScoreDump]] remoteExecCall ['SystemChat',_targetOwner];
[_msgHint] remoteExecCall ['SystemChat',_targetOwner];