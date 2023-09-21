inGameUISetEventHandler ["Action", " 
if (
	((_this select 3) == 'Land') || 
	((_this select 4) == 'Landing autopilot')  ||
	((_this select 4) == ' Switch to moving mode') ||
	((_this select 4) == 'Automatic Engine Startup')
) then { 
        hint 'SORRY, This Action Is not permited';
	    true 
    };
"];