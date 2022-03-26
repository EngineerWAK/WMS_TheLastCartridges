//Created by [CPC] ToejaM -
Waituntil{!isNull player};

while{true} do {
	sleep 0.5;
	if((isPlayer cursorTarget) && (alive cursorTarget) && (side cursorTarget == side player) && !((getplayerUID cursorTarget) in WMS_IP_Active_list) && (player distance cursorTarget < 1200)) then {
		_tag = name cursorTarget;
		cutText [_tag,"PLAIN",0.1];
	} else { 
		if ((alive cursorTarget) && (side cursorTarget == BLUFOR) && !((getplayerUID cursorTarget) in WMS_IP_Active_list) && (player distance cursorTarget < 600)) then {
			cutText ["<t color='#24b700' size='1'>Friendly</t><br/>", "PLAIN",0.1, false, true];
		} else { 
			if ((alive cursorTarget) && ((getplayerUID cursorTarget) in WMS_IP_Active_list) && (player distance cursorTarget < 300)) then {
				cutText ["<t color='#0d4900' size='0.85'>Infantry Program</t><br/>", "PLAIN",0.1, false, true];
			} else {
			};
		};
	};
};