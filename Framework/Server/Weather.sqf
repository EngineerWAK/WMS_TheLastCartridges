// Script by Zonekiller  -- http://www.zonekiller.net --    -- zonekiller@live.com.au --


//Set All the weather settings to manual and full in the mission editor of your mission

sleep 1;

//  ARRAY SETTINGS [fog,gusts,(wind dir),(wind force),overcast,rain]

// Weather Types
_interval 		= getNumber(missionConfigFile >> "CfgWeatherSetting" >> "interval");
_middleEastMaps = getArray(missionConfigFile >> "CfgWeatherSetting" >> "middleEastMaps"); //keyframesMiddleEast
_SOGMaps 		= getArray(missionConfigFile >> "CfgWeatherSetting" >> "SOGMaps"); //SOGMaps
_lowFogMaps 	= getArray(missionConfigFile >> "CfgWeatherSetting" >> "lowFogMaps");
_lowFogSetup 	= getArray(missionConfigFile >> "CfgWeatherSetting" >> "lowFogSetup");
_clearCfg 		= getArray(missionConfigFile >> "CfgWeatherSetting" >> "Clear");
_clearwindyCfg 	= getArray(missionConfigFile >> "CfgWeatherSetting" >> "clearwindy");
_windyCfg 		= getArray(missionConfigFile >> "CfgWeatherSetting" >> "windy");
_stillrainCfg 	= getArray(missionConfigFile >> "CfgWeatherSetting" >> "stillrain");
_stormCfg 		= getArray(missionConfigFile >> "CfgWeatherSetting" >> "storm");
_coverCfg 		= getArray(missionConfigFile >> "CfgWeatherSetting" >> "cover"); 
_popeyeCfg 		= getArray(missionConfigFile >> "CfgWeatherSetting" >> "popeye");//popeye

_clear = [(_clearCfg select 0 +(_clearCfg select 1)),(_clearCfg select 2 +(_clearCfg select 3)),(random 360),(_clearCfg select 4 +(_clearCfg select 5)),(_clearCfg select 6 +(_clearCfg select 7)),(_clearCfg select 8 +(_clearCfg select 9))];
_clearwindy = [(_clearwindyCfg select 0 +(_clearwindyCfg select 1)),(_clearwindyCfg select 2 +(_clearwindyCfg select 3)),(random 360),(_clearwindyCfg select 4 +(_clearwindyCfg select 5)),(_clearwindyCfg select 6 +(_clearwindyCfg select 7)),(_clearwindyCfg select 8 +(_clearwindyCfg select 9))];
_windy = [(_windyCfg select 0 +(_windyCfg select 1)),(_windyCfg select 2 +(_windyCfg select 3)),(random 360),(_windyCfg select 4 +(_windyCfg select 5)),(_windyCfg select 6 +(_windyCfg select 7)),(_windyCfg select 8 +(_windyCfg select 9))];
_stillrain = [(_stillrainCfg select 0 +(_stillrainCfg select 1)),(_stillrainCfg select 2 +(_stillrainCfg select 3)),(random 360),(_stillrainCfg select 4 +(_stillrainCfg select 5)),(_stillrainCfg select 6 +(_stillrainCfg select 7)),(_stillrainCfg select 8 +(_stillrainCfg select 9))];
_storm = [(_stormCfg select 0 +(_stormCfg select 1)),(_stormCfg select 2 +(_stormCfg select 3)),(random 360),(_stormCfg select 4 +(_stormCfg select 5)),(_stormCfg select 6 +(_stormCfg select 7)),(_stormCfg select 8 +(_stormCfg select 9))];
_cover = [(_coverCfg select 0 +(_coverCfg select 1)),(_coverCfg select 2 +(_coverCfg select 3)),(random 360),(_coverCfg select 4 +(_coverCfg select 5)),(_coverCfg select 6 +(_coverCfg select 7)),(_coverCfg select 8 +(_coverCfg select 9))];
_popeye = [(_popeyeCfg select 0 +(_popeyeCfg select 1)),(_popeyeCfg select 2 +(_popeyeCfg select 3)),(random 360),(_popeyeCfg select 4 +(_popeyeCfg select 5)),(_popeyeCfg select 6 +(_popeyeCfg select 7)),(_popeyeCfg select 8 +(_popeyeCfg select 9))];

_weatherpattern = [_clear];
if (worldName in _middleEastMaps) then {
	_weatherpattern = [_clear,_clear,_clearwindy,_cover]; //_keyFrames = ["clear","clear","clearwindy","cover"];
} else {
	if ((worldName in _SOGMaps) || (missionName == "TheLastCartridges_SOG_Special")) then {
		_weatherpattern = [_clear,_popeye,_windy,_stillrain,_clear,_storm,_popeye]; //_keyFrames = ["clear","clear","clearwindy","cover"];
	}else {
		_weatherpattern = [_clear,_clearwindy,_windy,_stillrain,_clear,_storm,_windy]; //_keyFrames = ["clear","clearwindy","windy","stillrain","storm"];
	};
};

_weather = (_weatherpattern select (floor(random (count _weatherpattern))));

_fog = (_weather select 0);
_gust = (_weather select 1);
_dir = (_weather select 2);
_force = (_weather select 3);
_oc = (_weather select 4);
_rain = (_weather select 5);


0 setGusts _gust;
0 setWindDir _dir;
0 setWindForce _force;
0 setOvercast _oc;
0 setRain _rain;

_foggy = 0;
sleep 120;

while {true} do
{

_weather = (_weatherpattern select (floor(random (count _weatherpattern))));

_fog = (_weather select 0);
_gust = (_weather select 1);
_dir = (_weather select 2);
_force = (_weather select 3);
_oc = (_weather select 4);
_rain = (_weather select 5); 

// only foggy in the mornings

if ((daytime > 4) && (daytime < 10)) then {
	if (worldname in _lowFogMaps ) then {
		(60 + (Random 60)) setFog _lowFogSetup;
	} else {
		(60 + (Random 60)) setFog _fog;
	};
	_foggy = 0;
}else{
	if (_foggy == 0) then {
		_foggy = 1;
		(60 + (Random 60)) setFog 0};
};

(120 + (Random 1680)) setGusts _gust;
(120 + (Random 1680)) setWindDir _dir;
(120 + (Random 1680)) setWindForce _force;
(120 + (Random 1680)) setOvercast _oc;

if (worldName in _middleEastMaps) then {
	10 setRain 0;
} else {
	(120 + (Random 1680)) setRain _rain;
};

sleep (60*_interval); 

};