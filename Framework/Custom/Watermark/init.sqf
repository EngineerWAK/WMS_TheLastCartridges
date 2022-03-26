/*
_pic = "Custom\Watermark\TNASquad128.paa";
[
    '<img align=''left'' size=''1.7'' shadow=''1'' image='+(str(_pic))+' />',
    safeZoneX+0.02,
    safeZoneY+safeZoneH-0.15,
    99999,
    0,
    0,
    3090
] spawn bis_fnc_dynamicText;
*/

_pic = "Custom\Watermark\TNASquad128.paa";
[
    '<img align=''left'' size=''1.7'' shadow=''1'' image='+(str(_pic))+' />',
    safeZoneX+safezoneW-0.12,
    safeZoneY+safeZoneH-1.80, //-1.82 bit too high
    99999,
    0,
    0,
    3090
] spawn bis_fnc_dynamicText;
