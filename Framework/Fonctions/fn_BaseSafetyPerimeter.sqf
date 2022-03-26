private ["_pos","_radius","_triggContest","_textureG"];
params [
	"_flagObject",
	"_playerObject",
	["_price", 5000]
];
//blablabla message
[ 
	[
		["INITIALIZING SAFETY PERIMETER...", "<t align = 'left' shadow = '1' size = '0.7' font='PuristaMedium'>%1</t><br/>", 5],  
		["Safety Perimeter Activated", "<t align = 'left' shadow = '1' size = '0.7' font='PuristaMedium'>%1</t><br/>"]
	]  
]remoteExec ["BIS_fnc_typeText", (owner (_this select 1))];
_pos = position _flagObject;
_radius = 34.5;
_textureG = "#(rgb,8,8,3)color(0,255,0,1)";
_triggContest = createTrigger ["EmptyDetector", _pos, true];
//_triggContest setVariable ["flagObject", _flagObject];
_triggContest setTriggerActivation ["EAST", "PRESENT", true]; 
_triggContest setTriggerArea [_radius, _radius, 0, false, _radius];
_triggContest setTriggerStatements  
	[ 
  		"this",  
  		"
		{[_x] call WMS_fnc_rocketMan;}forEach thisList;
		",  
  		"
		
		" 
	];

for '_i' from 0 to 360 step (250 / _radius)*2 do 
	{ 
		_posObjects = [(_pos select 0) + ((cos _i) * _radius), (_pos select 1) + ((sin _i) * _radius),1];
		_object = createVehicle ['Sign_Sphere10cm_F', _posObjects, [], 0, 'CAN_COLLIDE'];
		_object setObjectTextureGlobal [0, _textureG];
		_object enableSimulation false;
	};
_flagObject setVariable ["canSafetyPerimeter", false];

[_playerObject, _price] call WMS_fnc_smallTransactions;