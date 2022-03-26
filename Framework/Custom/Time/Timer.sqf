/* Altis 3h
if (time < 9960) then {
	if (time < 7200) then {
		_serverStartTime = ((10800-time)/3600);
		systemchat format [str "Hours before restart : %1",_serverStartTime];
	} else {
		_serverStartTime = ((10800-time)/60);
		systemchat format [str "Minutes before restart : %1",_serverStartTime];
	};
} else { systemchat format [str "don't you see the timer on the top of the screen!?"];};


//Malden 4h

if (time < 13650) then {
	if (time < 10800) then {
		_serverStartTime = ((14400-time)/3600);
		systemchat format [str "Hours before restart : %1",_serverStartTime];
	} else {
		_serverStartTime = ((14400-time)/60);
		systemchat format [str "Minutes before restart : %1",_serverStartTime];
	};
} else { systemchat format [str "don't you see the timer on the top of the screen!?"];};*/

 _hours = floor(time / 60 / 60);
 _minutes = floor((((time / 60 / 60) - _hours) max 0.0001)*60);
systemchat format [str "Server Uptime: %1h %2min, restart every 3 hours", _hours, _minutes];