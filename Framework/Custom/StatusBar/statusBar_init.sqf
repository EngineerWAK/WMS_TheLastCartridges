/*
	Exile Status Bar by [FPS]kuplion - Based on Stats Bar by Creampie
    Reworked by {|||TNA|||} WAKepneo to run outside of Exile Mod
*/
WMS_IP_Active_list = []; //From AI system server side
private ['_code', '_function', '_file'];
{
    _code = '';
    _function = _x select 0;
    _file = _x select 1;
    _code = compileFinal (preprocessFileLineNumbers _file);
    missionNamespace setVariable [_function, _code];
}
forEach
[
    ['statusBar_load','Custom\StatusBar\statusBar_load.sqf'],
	['statusBar_update','Custom\StatusBar\statusBar_update.sqf']
];

call statusBar_load;
