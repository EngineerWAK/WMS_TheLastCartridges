params [
	"_waponStationObject",
	"_playerObject",
	"_price"
];
if (false) then {diag_log format ["TNA|WAK|TNA WEAPONSTATIONINITIATE _this = %1", _this]};
_waponStationObject allowDamage true;
_waponStationObject enableSimulationGlobal true;
[_waponStationObject,_playerObject,_price] spawn {
	if (false) then {diag_log format ["TNA|WAK|TNA WEAPONSTATIONINITIATE spawn _this = %1", _this]};
	private _dirStation = getDir (_this select 0);
	private _posStation = getPosATL (_this select 0);
	private _typStation = typeOf (_this select 0);
	private _vehic = objNull;
	//blablabla message
	[ 
		[
			["INITIALIZING WEAPON SYSTEM...", "<t align = 'left' shadow = '1' size = '0.7' font='PuristaMedium'>%1</t><br/>", 15],  
			["Weapon System READY", "<t align = 'left' shadow = '1' size = '0.7' font='PuristaMedium'>%1</t><br/>"]
		]  
	]remoteExec ["BIS_fnc_typeText", (owner (_this select 1))];

	uisleep 3;
	deleteVehicle (_this select 0);
	uisleep 1;
	_vhl = [_posStation, _dirStation, _typStation, BLUFOR] call bis_fnc_spawnvehicle;
	_vehic = (_vhl select 0);

	if (_typStation == "B_AAA_System_01_F") then {
		_vehic setObjectTextureGlobal [0, "a3\static_f_jets\aaa_system_01\data\aaa_system_01_olive_co.paa"];
		_vehic setObjectTextureGlobal [1, "a3\static_f_jets\aaa_system_01\data\aaa_system_02_olive_co.paa"];
	} else {
		if (_typStation == "B_SAM_System_01_F") then {
			_vehic setObjectTextureGlobal [0, "a3\static_f_jets\sam_system_01\data\sam_system_01_olive_co.paa"];
		}else{
			if (_typStation == "B_SAM_System_02_F") then {
				_vehic setObjectTextureGlobal [0, "a3\static_f_jets\sam_system_02\data\sam_system_02_olive_co.paa"];
			} else {
				if (_typStation == "B_Radar_System_01_F") then {
					_vehic setObjectTextureGlobal [0, "a3\static_f_sams\radar_system_01\data\radar_system_01_mat_01_olive_co.paa"];
					_vehic setObjectTextureGlobal [1, "a3\static_f_sams\radar_system_01\data\radar_system_01_mat_02_olive_co.paa"];
				} else {
					if (_typStation == "B_SAM_System_03_F") then {
						_vehic setObjectTextureGlobal [0, "a3\static_f_sams\sam_system_03\data\sam_system_03_mat_01_olive_co.paa"];
						_vehic setObjectTextureGlobal [1, "a3\static_f_sams\sam_system_03\data\sam_system_03_mat_02_olive_co.paa"];
					} else {

					};
				};
			};
		};
	};

	_vehic allowDamage true;
	_vehic setVehicleLock "LOCKED";
	_vehic setVariable ["WMS_WeaponStationActivate", false, true];
	[(_this select 1), (_this select 2)] call WMS_fnc_smallTransactions;
};