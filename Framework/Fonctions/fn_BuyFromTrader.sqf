/**
 * WMS_fnc_buyFromTrader
 *
 * TNA-Community
 * https://discord.gg/Zs23URtjwF
 * © 2021 {|||TNA|||}WAKeupneo
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 //if (_caller canAdd _item)then{}else{};
private ["_totalAllowedLvl","_totalVhl","_totalLvl","_playerVHLArray","_targetUID","_targetOwner","_playerUID_ExileMoney","_playerMoney","_itemSlotFreeOrNot","_compatibleItems"];
params [
	"_item", //classename
	"_price",
	"_caller", //player
	"_type" //'vehicle', 'weapons', 'backpack, 'foodandhealth'
];
//[_item,_price,_caller, _type] remoteExec ['WMS_fnc_BuyFromTrader'];
if (WMS_MissionDebug) then {diag_log format ["[BUY_FROM_TRADERS]|WAK|TNA|WMS|_this %1", _this]};

_targetUID = getPlayerUID _caller;
_targetOwner = (owner _caller);
_playerUID_ExileMoney = "ExileMoney_"+_targetUID;
_playerMoney = profileNamespace getVariable [_playerUID_Exilemoney,0];
_itemSlotFreeOrNot = [];
_totalVhl = 0;
_totalLvl = 0;
_playerVHLArray = [_targetUID];
_totalAllowed = 0;
_totalAllowedLvl = 0;

if (_playerMoney >= _price) then {
	/////VEHICLES
	if (_type == 'vehicle' || _type == 'sea') then {  //Including the Boats
		//_ownerArray = _targetUID call WMS_fnc_findUIDinVhlArray; //-1 if not in the array yet //no need anymore
		_vehiclesManagement = getArray(missionConfigFile >> "CfgOfficeTrader" >> "vehiclesManagement"); //select 3 = start vehicle //select 4 = territory level
		//if (_ownerArray != -1)then {
		_playerVHLArray = profileNameSpace getVariable [_targetUID+"_VHLs", [_targetUID]]; //NEW
		if (count _playerVHLArray != 0)then {
			//_playerVHLArray = profileNameSpace getVariable [_targetUID+"_VHLs", [_targetUID,[]]]; //NEW
			//_totalVhl = count ((profileNameSpace getVariable ["WMS_permanentVhlArray", []]) select _ownerArray)-1;
			_totalVhl = ((count _playerVHLArray)-1); //NEW
		};
		_totalAllowed = _vehiclesManagement select 3;
		_totalAllowedLvl = _vehiclesManagement select 4;
		if ((_vehiclesManagement select 4) != 0) then {
			{
				if (_x select 3 == _targetUID) then {
					_totalLvl = _totalLvl+ (_x select 2);
				};
			}forEach (profileNameSpace GetVariable ["WMS_territoriesArray", []]);
		};
		_totalAllowed = _totalAllowed+(_totalAllowedLvl*_totalLvl);
		if (true) then {diag_log format ["[BUY_FROM_TRADERS]|WAK|TNA|WMS|_caller %1, _targetUID %2, _totalVhl %3, _totalAllowed %4",_caller, _targetUID, _totalVhl ,_totalAllowed]};
		if (_totalVhl < _totalAllowed) then {
			[_item,_caller] call WMS_fnc_createPermanentVHL;
			profileNamespace setVariable [_playerUID_Exilemoney,(_playerMoney-_price)];
			_caller setVariable ["ExileMoney", (_playerMoney-_price), true];
		}else{
			'Dude! you already got too many vehicles' remoteExec ["hint", (owner _caller)];
			"Dude! you already got too many vehicles" remoteExec ["systemChat", (owner _caller)];
		};
	}else {
	/////VEHICLES END
	/////WEAPONS
	if (_type == 'weapons') then {
			_ammo = (getArray (configfile >> "CfgWeapons" >> _item >> "magazines")) select 0;
		if (primaryWeapon _caller == "") then {
 			_caller addMagazineGlobal ((getArray (configfile >> "CfgWeapons" >> _item >> "magazines")) select 0); 
			_caller addWeaponGlobal _item;
		} else {
			if (_caller canAdd _item)then{
				_caller addItem _item;
				//_caller addItem [_ammo,1]; //NOPE
				_caller addItem _ammo;
				'Item in your inventory' remoteExec ["hint", (owner _caller)];
			}else{
				_weaponHolderTrader = createVehicle ["GroundWeaponHolder", [(position _caller select 0),(position _caller select 1),((position _caller select 2)+0.10)], [], 1, "CAN_COLLIDE"];
				_weaponHolderTrader addWeaponcargoGlobal [_item,1];
				_weaponHolderTrader addMagazinecargoGlobal [_ammo,1];
				'inventory full, Item on the ground' remoteExec ["hint", (owner _caller)];
			};
		};
	};
	/////WEAPONS END
	/////EQUIPEMENT
	if (_type == 'equipement') then {
		if (_item in (getArray(missionConfigFile >> "CfgItemsCategories" >> "uniform" >> "items")) || _item in (getArray(missionConfigFile >> "CfgItemsCategories" >> "uniform_RHS" >> "items"))) then {
			if (uniform _caller == "") then {
				_caller forceAddUniform _item;
			} else {
				if (_caller canAdd _item)then{
					_caller addItem _item;
					'Item in your inventory' remoteExec ["hint", (owner _caller)];
				}else{
					_weaponHolderTrader = createVehicle ["GroundWeaponHolder", [(position _caller select 0),(position _caller select 1),((position _caller select 2)+0.10)], [], 1, "CAN_COLLIDE"];
					_weaponHolderTrader addItemcargoGlobal [_item,1];
					'inventory full, Item on the ground' remoteExec ["hint", (owner _caller)];
				};
			};
		};
		if (_item in (getArray(missionConfigFile >> "CfgItemsCategories" >> "vest" >> "items")) || _item in (getArray(missionConfigFile >> "CfgItemsCategories" >> "vest_RHS" >> "items"))) then {
			if (vest _caller == "") then {
					_caller AddVest _item;
			} else {
				if (_caller canAdd _item)then{
					_caller addItem _item;
					'Item in your inventory' remoteExec ["hint", (owner _caller)];
				}else{
					_weaponHolderTrader = createVehicle ["GroundWeaponHolder", [(position _caller select 0),(position _caller select 1),((position _caller select 2)+0.10)], [], 1, "CAN_COLLIDE"];
					_weaponHolderTrader addItemcargoGlobal [_item,1];
					'inventory full, Item on the ground' remoteExec ["hint", (owner _caller)];
				};
			};
		}; 
		if (_item in (getArray(missionConfigFile >> "CfgItemsCategories" >> "helmet" >> "items")) || _item in (getArray(missionConfigFile >> "CfgItemsCategories" >> "helmet_RHS" >> "items"))) then {
			if (headgear _caller == "") then {
				_caller addHeadgear _item;
			} else {
				if (_caller canAdd _item)then{
					_caller addItem _item;
					'Item in your inventory' remoteExec ["hint", (owner _caller)];
				}else{
					_weaponHolderTrader = createVehicle ["GroundWeaponHolder", [(position _caller select 0),(position _caller select 1),((position _caller select 2)+0.10)], [], 1, "CAN_COLLIDE"];
					_weaponHolderTrader addItemcargoGlobal [_item,1];
					'inventory full, Item on the ground' remoteExec ["hint", (owner _caller)];
				};
			};
		};
			if (_item in (getArray(missionConfigFile >> "CfgItemsCategories" >> "backpack" >> "items")) ||_item in (getArray(missionConfigFile >> "CfgItemsCategories" >> "backpack_RHS" >> "items"))) then {
			if (backpack _caller == "") then {
				_caller AddBackpackGlobal _item;
			} else {
				_weaponHolderTrader = createVehicle ["GroundWeaponHolder", [(position _caller select 0),(position _caller select 1),((position _caller select 2)+0.10)], [], 1, "CAN_COLLIDE"];
				_weaponHolderTrader addBackpackcargoGlobal [_item,1];
				'inventory full, Item on the ground' remoteExec ["hint", (owner _caller)];
			};
		};
	};
	/////EQUIPEMENT END
	/////ACCESSORIES
	if (_type == 'accessories') then { //primaryWeaponItems player; //return [silencer, laserpointer/flashlight, optics, bipod]
		//if !(primaryWeapon _caller == "") then {
		if (false) then {
			_itemSlotFreeOrNot = primaryWeaponItems _caller;
			_compatibleItems = [primaryWeapon _caller] call CBA_fnc_compatibleItems;
			/////
			if (
				_item in (getArray(missionConfigFile >> "CfgWeapCategories" >> "Accessories" >> "Scopes")) ||
				_item in (getArray(missionConfigFile >> "CfgWeapCategories" >> "Accessories_RHS" >> "Scopes")) ||
				_item in (getArray(missionConfigFile >> "CfgWeapCategories" >> "Accessories_RHS_NIA" >> "Scopes"))
				) then {
				if ((_itemSlotFreeOrNot select 2 == "") && (_item in _compatibleItems)) then {_caller addPrimaryWeaponItem _item} else {
					if (_caller canAdd _item)then{
						_caller addItem _item;
						'Item in your inventory' remoteExec ["hint", (owner _caller)];
					}else{
						_weaponHolderTrader = createVehicle ["GroundWeaponHolder", [(position _caller select 0),(position _caller select 1),((position _caller select 2)+0.10)], [], 1, "CAN_COLLIDE"];
						_weaponHolderTrader addItemcargoGlobal [_item,1];
						'inventory full, Item on the ground' remoteExec ["hint", (owner _caller)];
					};
				};
			}else {
			/////
				if (
					_item in (getArray(missionConfigFile >> "CfgWeapCategories" >> "Accessories" >> "LaserLights")) || 
					_item in (getArray(missionConfigFile >> "CfgWeapCategories" >> "Accessories_RHS" >> "LaserLights")) || 
					_item in (getArray(missionConfigFile >> "CfgWeapCategories" >> "Accessories_RHS_NIA" >> "LaserLights"))
					) then {
					if ((_itemSlotFreeOrNot select 1 == "") && (_item in _compatibleItems)) then {_caller addPrimaryWeaponItem _item} else {
						if (_caller canAdd _item)then{
							_caller addItem _item;
							'Item in your inventory' remoteExec ["hint", (owner _caller)];
						}else{
							_weaponHolderTrader = createVehicle ["GroundWeaponHolder", [(position _caller select 0),(position _caller select 1),((position _caller select 2)+0.10)], [], 1, "CAN_COLLIDE"];
							_weaponHolderTrader addItemcargoGlobal [_item,1];
							'inventory full, Item on the ground' remoteExec ["hint", (owner _caller)];
						};
					};
				}else {
			/////
					if (
						_item in (getArray(missionConfigFile >> "CfgWeapCategories" >> "Accessories" >> "Bipods")) || 
						_item in (getArray(missionConfigFile >> "CfgWeapCategories" >> "Accessories_RHS" >> "Bipods")) || 
						_item in (getArray(missionConfigFile >> "CfgWeapCategories" >> "Accessories_RHS_NIA" >> "Bipods"))
						) then {
						if ((_itemSlotFreeOrNot select 3 == "") && (_item in _compatibleItems)) then {_caller addPrimaryWeaponItem _item} else {
							if (_caller canAdd _item)then{
								_caller addItem _item;
								'Item in your inventory' remoteExec ["hint", (owner _caller)];
							}else{
								_weaponHolderTrader = createVehicle ["GroundWeaponHolder", [(position _caller select 0),(position _caller select 1),((position _caller select 2)+0.10)], [], 1, "CAN_COLLIDE"];
								_weaponHolderTrader addItemcargoGlobal [_item,1];
								'inventory full, Item on the ground' remoteExec ["hint", (owner _caller)];
							};
						};
					}else {
			/////
						if (
							_item in (getArray(missionConfigFile >> "CfgWeapCategories" >> "Accessories" >> "Suppressors")) || 
							_item in (getArray(missionConfigFile >> "CfgWeapCategories" >> "Accessories_RHS" >> "Suppressors")) || 
							_item in (getArray(missionConfigFile >> "CfgWeapCategories" >> "Accessories_RHS_NIA" >> "Suppressors"))
							) then {
							if ((_itemSlotFreeOrNot select 0 == "") && (_item in _compatibleItems)) then {_caller addPrimaryWeaponItem _item} else {
								if (_caller canAdd _item)then{
									_caller addItem _item;
									'Item in your inventory' remoteExec ["hint", (owner _caller)];
								}else{
									_weaponHolderTrader = createVehicle ["GroundWeaponHolder", [(position _caller select 0),(position _caller select 1),((position _caller select 2)+0.10)], [], 1, "CAN_COLLIDE"];
									_weaponHolderTrader addItemcargoGlobal [_item,1];
									'inventory full, Item on the ground' remoteExec ["hint", (owner _caller)];
								};
							};
						};
					};
				};
			};/////
		} else {
			if (_caller canAdd _item)then{
				_caller addItem _item;
				'Item in your inventory' remoteExec ["hint", (owner _caller)];
			}else{
				_weaponHolderTrader = createVehicle ["GroundWeaponHolder", [(position _caller select 0),(position _caller select 1),((position _caller select 2)+0.10)], [], 1, "CAN_COLLIDE"];
				_weaponHolderTrader addItemcargoGlobal [_item,1];
				'inventory full, Item on the ground' remoteExec ["hint", (owner _caller)];
			};
		};
	};
	/////ACCESSORIES END
	if (_type == 'foodandhealth') then {
		if (_caller canAdd _item)then{
			_caller addItem _item;
			'Item in your inventory' remoteExec ["hint", (owner _caller)];
		}else{
			_weaponHolderTrader = createVehicle ["GroundWeaponHolder", [(position _caller select 0),(position _caller select 1),((position _caller select 2)+0.10)], [], 1, "CAN_COLLIDE"];
			_weaponHolderTrader addItemcargoGlobal [_item,1];
			'inventory full, Item on the ground' remoteExec ["hint", (owner _caller)];
		};
	};
	/////SPECOPS
	if (_type == 'specops') then { //only one call for the 2 specops (weapon/items and ammo/explo)
		if (_item in (getArray(missionConfigFile >> "CfgWeapCategories" >> "Launchers" >> "items")) || _item in (getArray(missionConfigFile >> "CfgWeapCategories" >> "Launchers_RHS" >> "items"))) then {
			if (secondaryWeapon _caller == "") then {
				_caller addWeaponGlobal _item;
			} else {
				_weaponHolderTrader = createVehicle ["GroundWeaponHolder", [(position _caller select 0),(position _caller select 1),((position _caller select 2)+0.10)], [], 1, "CAN_COLLIDE"];
				_weaponHolderTrader addItemcargoGlobal [_item,1];	
				'inventory full, Item on the ground' remoteExec ["hint", (owner _caller)];			
			};
		} else {
			if (_caller canAdd _item)then{
				_caller addItem _item;
				'Item in your inventory' remoteExec ["hint", (owner _caller)];
			}else{
				_weaponHolderTrader = createVehicle ["GroundWeaponHolder", [(position _caller select 0),(position _caller select 1),((position _caller select 2)+0.10)], [], 1, "CAN_COLLIDE"];
				_weaponHolderTrader addItemcargoGlobal [_item,1];	
				'inventory full, Item on the ground' remoteExec ["hint", (owner _caller)];			
			};
		};
	};
	/////SPECOPS END
	profileNamespace setVariable [_playerUID_Exilemoney,(_playerMoney-_price)];
	_caller setVariable ["ExileMoney", (_playerMoney-_price), true];
	//saveProfileNamespace;
};
};