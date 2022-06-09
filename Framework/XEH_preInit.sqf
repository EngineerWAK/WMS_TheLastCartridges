/**
 * XEH_preinit.sqf
 *
 * TNA-Community
 * https://discord.gg/Zs23URtjwF
 * © 2022 {|||TNA|||}WAKeupneo
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
["WMS 3Dmarker", "Number1+ctrl", "3D Marker", {[nil,false,false,nil,"local1"]call WMS_fnc_client_3Dmarkers}, {}, [0x02, [false, true, false]]] call CBA_fnc_addKeybind;//[DIK, [shift, ctrl, alt]]//number 1
["WMS 3Dmarker", "Number1+ctrl+shift", "Map 3D Marker", {
    openMap true;
    _this spawn {
        uisleep 1;
        onMapSingleClick { 
	        onMapSingleClick {};
	        [(AGLtoASL _pos),false,false,nil,"map1"]call WMS_fnc_client_3Dmarkers;
	        openMap false;
	        true
        };
    };
}, {}, [0x02, [true, true, false]]] call CBA_fnc_addKeybind;//number 1
/*["WMS 3Dmarker", "Number2+ctrl", "3D Marker", {[nil,false,false,nil,"local2"]call WMS_fnc_client_3Dmarkers}, {}, [0x03, [false, true, false]]] call CBA_fnc_addKeybind;//[DIK, [shift, ctrl, alt]]//number 2
["WMS 3Dmarker", "Number2+ctrl+shift", "Map 3D Marker", {
    openMap true;
    _this spawn {
    	uisleep 1;
	    onMapSingleClick { 
		    onMapSingleClick {};
		    [(AGLtoASL _pos),false,false,nil,"map2"]call WMS_fnc_client_3Dmarkers;
		    openMap false;
		    true
	    };
    };
}, {}, [0x03, [true, true, false]]] call CBA_fnc_addKeybind;//number 2*/
["WMS 3Dmarker", "Number2+ctrl", "Crew 3D Marker", {[nil,false,true,nil,"crew1",true]call WMS_fnc_client_3Dmarkers}, {}, [0x03, [false, true, false]]] call CBA_fnc_addKeybind;//[DIK, [shift, ctrl, alt]]//number 2
["WMS 3Dmarker", "Number2+ctrl+shift", "Crew Map 3D Marker", {
    openMap true;
    _this spawn {
    	uisleep 1;
	    onMapSingleClick { 
		    onMapSingleClick {};
		    [(AGLtoASL _pos),false,true,nil,"crewmap1",true]call WMS_fnc_client_3Dmarkers;
		    openMap false;
		    true
	    };
    };
}, {}, [0x03, [true, true, false]]] call CBA_fnc_addKeybind;//number 2

["WMS 3Dmarker", "Number3+ctrl", "Group 3D Marker", {[[],true,true,nil,"group1"]call WMS_fnc_client_3Dmarkers}, {}, [0x04, [false, true, false]]] call CBA_fnc_addKeybind;//number 3
["WMS 3Dmarker", "Number3+ctrl+shift", "Group Map 3D Marker", {
    openMap true;
    _this spawn {
	    uisleep 1;
	    onMapSingleClick { 
		    onMapSingleClick {};
		    [(AGLtoASL _pos),true,true,nil,"groupmap1"]call WMS_fnc_client_3Dmarkers;
		    openMap false;
		    true
	    };
    };
}, {}, [0x04, [true, true, false]]] call CBA_fnc_addKeybind;//number 3

["WMS_3Dmkr_size_local", "SLIDER", ["Local Marker Size","Local Marker Size"], ["WMS", "WMS 3DMarkers", "Local"], [0.2,2,1,1], false, {}] call cba_settings_fnc_init;
["WMS_3Dmkr_color_local1", "COLOR", ["Local Marker 1","First Local Marker color"], ["WMS", "WMS 3DMarkers", "Local"], [1,0,0,1], false, {}] call cba_settings_fnc_init;
["WMS_3Dmkr_color_localMap1", "COLOR", ["Local Marker 1 Map","First Local Marker color"], ["WMS", "WMS 3DMarkers", "Local"], [0.5,0.6,0.4,1], false, {}] call cba_settings_fnc_init;
/*["WMS_3Dmkr_color_local2", "COLOR", ["Local Marker 2","Second Local Marker color"], ["WMS", "WMS 3DMarkers", "Local"], [0,1,0,1], false, {}] call cba_settings_fnc_init;
["WMS_3Dmkr_color_localMap2", "COLOR", ["Local Marker 2 Map","Second Local Marker color"], ["WMS", "WMS 3DMarkers", "Local"], [0.5,0.6,0.4,1], false, {}] call cba_settings_fnc_init;*/
	
["WMS_3Dmkr_size_crew", "SLIDER", ["crew Marker Size","crew Marker Size"], ["WMS", "WMS 3DMarkers", "crew"], [0.2,2,1,1], false, {}] call cba_settings_fnc_init;
["WMS_3Dmkr_color_crew1", "COLOR", ["crew Marker","crew Marker color"], ["WMS", "WMS 3DMarkers", "crew"], [0.85,0.85,0,1], false, {}] call cba_settings_fnc_init;
["WMS_3Dmkr_color_crewMap1", "COLOR", ["crew Marker Map","crew Marker color"], ["WMS", "WMS 3DMarkers", "crew"], [0.5,0.6,0.4,1], false, {}] call cba_settings_fnc_init;
	
["WMS_3Dmkr_size_group", "SLIDER", ["Group Marker Size","Group Marker Size"], ["WMS", "WMS 3DMarkers", "Group"], [0.2,2,1,1], false, {}] call cba_settings_fnc_init;
["WMS_3Dmkr_color_group1", "COLOR", ["Group Marker","Group Marker color"], ["WMS", "WMS 3DMarkers", "Group"], [0,0,1,1], false, {}] call cba_settings_fnc_init;
["WMS_3Dmkr_color_groupMap1", "COLOR", ["Group Marker Map","Group Marker color"], ["WMS", "WMS 3DMarkers", "Group"], [0.5,0.6,0.4,1], false, {}] call cba_settings_fnc_init;