//Created by [CPC] ToejaM -
if (hasInterface) then {
	Waituntil{!isNull player};
	while{true} do {
		_IP_ActiveList = missionNameSpace getVariable ["WMS_IP_Active_list",[]];
		sleep 0.5;
		if((isPlayer cursorTarget) && {(alive cursorTarget)} && {(side cursorTarget == side player)} && {!((getplayerUID cursorTarget) in _IP_ActiveList)} && {(player distance cursorTarget < 1500)}) then {
			_tag = name cursorTarget;
			cutText [_tag,"PLAIN",0.1];
		} else { 
			if ((alive cursorTarget) && {(side cursorTarget == BLUFOR)} && !{((getplayerUID cursorTarget) in _IP_ActiveList)} && {(player distance cursorTarget < 800)}) then {
				cutText ["<t color='#24b700' size='1'>Friendly</t><br/>", "PLAIN",0.1, false, true];
			} else { 
				if ((alive cursorTarget) && {((getplayerUID cursorTarget) in _IP_ActiveList)} && {(player distance cursorTarget < 750)}) then {
					cutText ["<t color='#0d4900' size='0.85'>Infantry Program</t><br/>", "PLAIN",0.1, false, true];
				} else {
				};
			};
		};
	};
};