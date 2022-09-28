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
 /*
 cba_settings_fnc_init Parameters:
    _setting     - Unique setting name. Matches resulting variable name <STRING>
    _settingType - Type of setting. Can be "CHECKBOX", "EDITBOX", "LIST", "SLIDER" or "COLOR" <STRING>
    _title       - Display name or display name + tooltip (optional, default: same as setting name) <STRING, ARRAY>
    _category    - Category for the settings menu + optional sub-category <STRING, ARRAY>
    _valueInfo   - Extra properties of the setting depending of _settingType. See examples below <ANY>
    _isGlobal    - 1: all clients share the same setting, 2: setting can't be overwritten (optional, default: 0) <NUMBER>
    _script      - Script to execute when setting is changed. (optional) <CODE>
    _needRestart - Setting will be marked as needing mission restart after being changed. (optional, default false) <BOOL>
*/

["WMS_DynamicCamoDebug", "CHECKBOX", ["DynamicCamo Debug", "Activate Hint Debug for Dynamic Camo, may reduce performances"], ["WMS", "DynamicCamo", "Local"], false] call cba_settings_fnc_init;
["WMS_LBIS", "CHECKBOX", ["Help Messages", "Local Brodcast Information System give you 'Tips and Tricks' and information about the server"], ["WMS", "LBIS", "Local"], true] call cba_settings_fnc_init;

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

//////////Hatchet Keyboard Interaction
/*
[
	"switch_lights_collision","switch_lights_position","switch_lights_cockpit","switch_minigun_safe_r","gunner_ffv_l","gunner_ffv_r","pylonleft_lass","pylonright_lass","pylonrightegms","pylonleftforward_lass",
	"pylonrightforward_lass","pylonleftegms","pylonforward_l","pylonforward_r","fuelprobe_show","erfs_show","hh60flares_show","skis_show","landinglight_show","positionlights_show","cockpitlight_show",
	"fuelprobe_extend","lasspylons","lasscovers","essspylons","essscovers","radar_hide","flir_hide","flir_back","flir_direction","flir_elevation","gau21_l_hide","gau21l_dir","gau21l_gunner",
	"gau21l_gunner_legs","gau21l_muzzleflash","gau21l_elev","gau21_r_hide","maws_tubes_show","maws_stubs_hide","gau21r_dir","gau21r_gunner","gau21r_gunner_legs","gau21r_elev","minigunl_dir",
	"minigunl_elev","minigunl_barrel","minigunl__flash","minigunl_gunner","minigunl_gunner_legs","minigunr_dir","minigunr_elev","minigunr_barrel","minigunr__flash","minigunr_gunner","minigunr_gunner_legs",
	"minigun_l_hide","minigun_r_hide","minigun_sight_l_hide","minigun_sight_r_hide","minigun_mount_l_hide","minigun_mount_r_hide","cabindoor_l","cabindoor_r","cabinseats_1_hide","cabinseats_2_hide",
	"cabinseats_3_hide","gunnerseats_hide","hoist_hide","hoist_hook_hide","cockpitdoors_hide","stabilator_rotate_user","stabilator_rotate","comm1_rot","comm2_rot","comm3_rot","comm4_rot","comm1r_rot",
	"comm2r_rot","comm3r_rot","comm4r_rot","mvol_rot","mvolr_rot","tx_rot","txr_rot","fd_1_rot","fd_2_rot","fd_3_rot","fd_4_rot","fd_5_rot","fdr_1_rot","fdr_2_rot","fdr_3_rot","fdr_4_rot","fdr_5_rot",
	"rotorbrakegauge","gauge_temp_left","gauge_temp_right","cyclic_right_x","cyclic_right_y","cyclic_left_x","cyclic_left_y","collective_right_anim","collective_left_anim","collective_right_anim_rtd",
	"collective_left_anim_rtd","leftpedalpilot_rtd","rightpedalpilot_rtd","leftpedalcopilot_rtd","rightpedalcopilot_rtd","knob_lightupperconsole","knob_lightlowerconsole","knob_lightinstpanel",
	"lever_engpower1z_off","lever_engpower1z_idle1","lever_engpower1z_idle2","lever_engpower1z_fly","lever_engpower2z_off","lever_engpower2z_idle1","lever_engpower2z_idle2","lever_engpower2z_fly",
	"lever_fuelsys1","lever_fuelsys2","lever_engpower1","lever_engpower2","lever_rotorbrake","mfd1_hide","mfd2_hide","mfd3_hide","mfd4_hide","esis_hide","poweronoff","generatorsonoff","acclow","apufail",
	"apuon","battgood","battlow","emerrlse","oilhot","testlte","cautioneng1out","cautioneng2out","cautionfire","cautionmastercaution","cautionlowrpm","switch_minigun_safe_cover_l","switch_minigun_safe_l",
	"switch_minigun_safe_cover_r","switch_fuelboostpump1","switch_fuelboostpump2",
	"switch_batt1","switch_batt2","switch_stbyinst","switch_airsce","switch_ignition","switch_fuelpump","switch_apucont","switch_apugen","switch_gen1","switch_gen2",
	"handle_wheelbrake","headingball","bankangle1","bankangle2","bankangle3","bankangle4","damper_left","damper_right","damper_rear","wheel_l","wheel_r",
	"wheel_rear","turbinefan_l","turbinefan_r","wheel_rear_rudder_afm","rotortilt","hrotor","vrotor"
]
[]spawn {
_H60 = vehicle player; 
 
_H60 animateSource ["b_gen1", 1]; 
_H60 animateSource ["b_gen2", 1];
_H60 animateSource ["b_batt1", 1]; 
_H60 animateSource ["b_batt2", 1];
_H60 animateSource ["fuelPump", 1]; 
_H60 animateSource ["apucont", 0];
_H60 animateSource ["b_apugen", 1];
_H60 animateSource ["b_stbyinst", 1];
_H60 animateSource ["b_ignition", 1];
_H60 animateSource ["b_airsce", 1];
_H60 animate ["b_fuelsys1", 0.6, 1]; 
_H60 animate ["b_engpowercont1", 0.85, 1]; 
_H60 animate ["b_fuelsys2", 0.6, 1]; 
_H60 animate ["b_engpowercont1", 0.85, 1];
};
*/