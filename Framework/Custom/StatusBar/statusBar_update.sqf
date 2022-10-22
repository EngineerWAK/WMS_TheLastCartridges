/*
	Exile Status Bar by [FPS]kuplion - Based on Stats Bar by Creampie
	Modify by {|||TNA|||}WAKeupneo to fit the missionFile, do not work with Exile anymore
*/

// Accurate Restarts
//_restartTimes	= [0,3,6,9,12,15,18,21,24]; // Military Time
//_serverRunTime = [missionNameSpace, WMS_ServRestartSeconds, (5*3600)] call BIS_fnc_getServerVariable; //NOPE
_serverRunTime 	= 5*3600; //hours running
/*_startHour		= ExileServerStartTime select 3;
_startMinute	= ExileServerStartTime select 4;
_startSecond	= ExileServerStartTime select 5;*/

_startHour		= 0;
_startMinute	= 0;
_startSecond	= 0;
/*
_correcTime		= [];
{
	if (_startHour < _x and _startHour != 24) then
	{
		_correcTime pushBack _x;
	};
} forEach _restartTimes;*/

disableSerialization;

//systemChat format["StatusBar Initialized", _rscLayer];

// Check if Status Bar is showing and restart if not..
if (isNull ((uiNamespace getVariable "StatusBar")displayCtrl 55554)) then
{
	diag_log "Status Bar is Null! Restarting..";
	disableSerialization;
	_rscLayer = "StatusBar" call BIS_fnc_rscLayer;
	_rscLayer cutRsc["StatusBar","PLAIN"];
};

// Additional color codes can be found here:  http://html-color-codes.com/
//_colourDefault 	= parseText "#ADADAD"; // set your default colour here
_colourDefault 	= parseText "#FFFFFF";
_colour108		= parseText "#FF7000";
_colour107		= parseText "#FF9000";
_colour106		= parseText "#FFBB00";
_colour105		= parseText "#FFCC00";
_colour104		= parseText "#81CCDD";
_colour103		= parseText	"#33AACC";
_colour102		= parseText "#3388CC";
_colour101		= parseText "#3366CC";
_colour100 		= parseText "#336600";
_colour90 		= parseText "#339900";
_colour80 		= parseText "#33CC00";
_colour70 		= parseText "#33FF00";
_colour60 		= parseText "#66FF00";
_colour50 		= parseText "#CCFF00";
_colour40 		= parseText "#CCCC00";
_colour30 		= parseText "#CC9900";
_colour20 		= parseText "#CC6600";
_colour10 		= parseText "#CC3300";
_colour0 		= parseText "#CC0000";
_colourDead 	= parseText "#000000";

_traderColors = getArray(missionConfigFile >> "CfgRespectColors" >> "Colors");
_colour1k 		= parseText (_traderColors select 1);
_colour6k 		= parseText (_traderColors select 2);
_colour12k 		= parseText (_traderColors select 3);
_colour18k 		= parseText (_traderColors select 4);
_colour25k 		= parseText (_traderColors select 5);
_colour50k 		= parseText (_traderColors select 6);
/*
_colour1k 		= parseText "#8dfb7e";
_colour6k 		= parseText "#1fd507";
_colour12k 		= parseText "#07d593";
_colour18k 		= parseText "#0797d5";
_colour25k 		= parseText "#8d07d5";
_colour50k 		= parseText "#d5074b";
*/
// Initialize variables and set values
_damage = (round (player getvariable ["ace_medical_heartrate", 0])); //80 by default
_hunger			= 100 - (round (player getvariable ["acex_field_rations_hunger", 0]));
_thirst			= 100 - (round (player getvariable ["acex_field_rations_thirst", 0]));
_kills			= (player getVariable ["ExileKills", 0]);
if (_kills > 999) then
{
	_kills = format ["%1k", floor (_kills / 1000)];
};

_death			= (player getVariable ["ExileDeath", 0]);

_locker			= (player getVariable ["ExileMoney", 0]);
if (_locker > 999) then
{
	_locker = format ["%1k", floor (_locker / 1000)];
};
_wallet = _locker;
_energyPercent	= 100;
_playerFPS		= round diag_fps;
_dir			= round (getDir (vehicle player));
//_rightTime		= (((_correcTime select 0) - _startHour) - _startMinute/60) * 60;
//_time			= (round(_rightTime - (serverTime)/60));
_time			= _serverRunTime-time; //18000-600 (5h - 10 minutes) = 17400
_hours			= (floor(_time/3600)); //17400/3600 = 4 (4.833333)
_minutes		= round((_time - (_hours * 3600))/60); //((17400 - (4 *3600)) /60) = 50

switch (_minutes) do
{
	case 9: {_minutes = "09"};
	case 8: {_minutes = "08"};
	case 7: {_minutes = "07"};
	case 6: {_minutes = "06"};
	case 5: {_minutes = "05"};
	case 4: {_minutes = "04"};
	case 3: {_minutes = "03"};
	case 2: {_minutes = "02"};
	case 1: {_minutes = "01"};
	case 0: {_minutes = "00"};
};

// Damage
_colourDamage = _colourDefault;
switch (true) do
{
	case (_damage >= 200) : {_colourDamage = _colour0;};
	case ((_damage >= 180) && (_damage < 200)) : {_colourDamage =  _colour10;};
	case ((_damage >= 160) && (_damage < 180)) : {_colourDamage =  _colour20;};
	case ((_damage >= 140) && (_damage < 160)) : {_colourDamage =  _colour30;};
	case ((_damage >= 120) && (_damage < 140)) : {_colourDamage =  _colour40;};
	case ((_damage >= 110) && (_damage < 120)) : {_colourDamage =  _colour50;};
	case ((_damage >= 100) && (_damage < 110)) : {_colourDamage =  _colour60;};
	case ((_damage >= 90) && (_damage < 100)) : {_colourDamage =  _colour70;};
	case ((_damage >= 81) && (_damage < 90)) : {_colourDamage =  _colour90;};
	case (_damage == 80) : {_colourDamage = _colour100;};
	case ((_damage >= 70) && (_damage < 80)) : {_colourDamage =  _colour90;};
	case ((_damage >= 60) && (_damage < 70)) : {_colourDamage =  _colour70;};
	case ((_damage >= 50) && (_damage < 60)) : {_colourDamage =  _colour60;};
	case ((_damage >= 40) && (_damage < 50)) : {_colourDamage =  _colour40;};
	case ((_damage >= 30) && (_damage < 40)) : {_colourDamage =  _colour30;};
	case ((_damage >= 20) && (_damage < 30)) : {_colourDamage =  _colour20;};
	case ((_damage >= 10) && (_damage < 20)) : {_colourDamage =  _colour10;};
	case ((_damage >= 1) && (_damage < 10)) : {_colourDamage =  _colour0;};
	case (_damage < 1) : {_colourDamage =  _colourDefault;};
	default {_colourDamage = _colourDefault;};
};

// Hunger
_colourHunger = _colourDefault;
switch (true) do
{
	case (_hunger >= 100) : {_colourHunger = _colour100;};
	case ((_hunger >= 90) && (_hunger < 100)) : {_colourHunger =  _colour90;};
	case ((_hunger >= 80) && (_hunger < 90)) : {_colourHunger =  _colour80;};
	case ((_hunger >= 70) && (_hunger < 80)) : {_colourHunger =  _colour70;};
	case ((_hunger >= 60) && (_hunger < 70)) : {_colourHunger =  _colour60;};
	case ((_hunger >= 50) && (_hunger < 60)) : {_colourHunger =  _colour50;};
	case ((_hunger >= 40) && (_hunger < 50)) : {_colourHunger =  _colour40;};
	case ((_hunger >= 30) && (_hunger < 40)) : {_colourHunger =  _colour30;};
	case ((_hunger >= 20) && (_hunger < 30)) : {_colourHunger =  _colour20;};
	case ((_hunger >= 10) && (_hunger < 20)) : {_colourHunger =  _colour10;};
	case ((_hunger >= 1) && (_hunger < 10)) : {_colourHunger =  _colour0;};
	case (_hunger < 1) : {_colourHunger =  _colourDead;};
	default {_colourHunger = _colourDefault;};
};

// Thirst
_colourThirst = _colourDefault;
switch (true) do
{
	case (_thirst >= 100) : {_colourThirst = _colour101;};
	case ((_thirst >= 90) && (_thirst < 100)) : {_colourThirst =  _colour102;};
	case ((_thirst >= 80) && (_thirst < 90)) : {_colourThirst =  _colour103;};
	case ((_thirst >= 70) && (_thirst < 80)) : {_colourThirst =  _colour104;};
	case ((_thirst >= 60) && (_thirst < 70)) : {_colourThirst =  _colour105;};
	case ((_thirst >= 50) && (_thirst < 60)) : {_colourThirst =  _colour106;};
	case ((_thirst >= 40) && (_thirst < 50)) : {_colourThirst =  _colour107;};
	case ((_thirst >= 30) && (_thirst < 40)) : {_colourThirst =  _colour108;};
	case ((_thirst >= 20) && (_thirst < 30)) : {_colourThirst =  _colour20;};
	case ((_thirst >= 10) && (_thirst < 20)) : {_colourThirst =  _colour10;};
	case ((_thirst >= 1) && (_thirst < 10)) : {_colourThirst =  _colour0;};
	case (_thirst < 1) : {_colourThirst =  _colourDead;};
	default {_colourThirst = _colourDefault;};
};

// respect
_respect		= (player getVariable ["ExileScore", 0]);
_colourRespect = _colourDefault;
switch (true) do
{
	case (_respect >= 50000) : {_colourRespect = _colour50k;};
	case ((_respect >= 25000) && (_respect < 50000)) : {_colourRespect =  _colour25k;};
	case ((_respect >= 18000) && (_respect < 25000)) : {_colourRespect =  _colour18k;};
	case ((_respect >= 12000) && (_respect < 18000)) : {_colourRespect =  _colour12k;};
	case ((_respect >= 6000) && (_respect < 12000)) : {_colourRespect =  _colour6k;};
	case ((_respect >= 1000) && (_respect < 6000)) : {_colourRespect =  _colour1k;};
	case (_respect < 1000) : {_colourRespect =  _colourDefault;};
	default {_colourRespect = _colourDefault;};
};
//_respect		= ExileClientPlayerScore;
if (_respect > 999) then
{
	_respect = format ["%1k", floor (_respect / 1000)];
};

// Display the information 

//<t shadow='1' shadowColor='#000000' size='1.1' color='%10'><img size='1.1'  shadowColor='#000000' image='Custom\StatusBar\Icons\wallet.paa' color='%10'/> %4  </t>
//<t shadow='1' shadowColor='#000000' size='1' color='%11'><img size='1'  shadowColor='#000000' image='Custom\StatusBar\Icons\health.paa' color='%11'/> %3%1  </t>

((uiNamespace getVariable "StatusBar")displayCtrl 55554)ctrlSetStructuredText parseText 
format[
"
<t shadow='1' shadowColor='#000000' size='1' color='%10'><img size='1'  shadowColor='#000000' image='Custom\StatusBar\Icons\players.paa' color='%10'/> %2  </t>

<t shadow='1' shadowColor='#000000' size='1' color='%10'><img size='1'  shadowColor='#000000' image='Custom\StatusBar\Icons\target.paa' color='%10'/> %4  </t>

<t shadow='1' shadowColor='#000000' size='1' color='%10'><img size='1'  shadowColor='#000000' image='Custom\StatusBar\Icons\tomb.paa' color='%10'/> %18  </t>

<t shadow='1' shadowColor='#000000' size='1' color='%10'><img size='1'  shadowColor='#000000' image='Custom\StatusBar\Icons\locker.paa' color='%10'/> %17  </t>

<t shadow='1' shadowColor='#000000' size='1' color='%20'><img size='1'  shadowColor='#000000' image='Custom\StatusBar\Icons\respect.paa' color='%20'/> %9  </t>

<t shadow='1' shadowColor='#000000' size='1' color='%11'><img size='1'  shadowColor='#000000' image='Custom\StatusBar\Icons\health.paa' color='%11'/> %3%19  </t>

<t shadow='1' shadowColor='#000000' size='1' color='%12'><img size='1'  shadowColor='#000000' image='Custom\StatusBar\Icons\hunger.paa' color='%12'/> %5%1  </t>

<t shadow='1' shadowColor='#000000' size='1' color='%13'><img size='1'  shadowColor='#000000' image='Custom\StatusBar\Icons\thirst.paa' color='%13'/> %6%1  </t>

<t shadow='1' shadowColor='#000000' size='1' color='%10'><img size='1'  shadowColor='#000000' image='Custom\StatusBar\Icons\compass.paa' color='%10'/> %14  </t>

<t shadow='1' shadowColor='#000000' size='1' color='%10'><img size='1'  shadowColor='#000000' image='Custom\StatusBar\Icons\restart.paa' color='%10'/> %15:%16  </t>

<t shadow='1' shadowColor='#000000' size='1' color='%10'><img size='1'  shadowColor='#000000' image='Custom\StatusBar\Icons\fps.paa' color='%10'/> %7</t>",
				
"%",						//1
count allPlayers,			//2
_damage,					//3
_kills,						//4
_hunger,					//5
_thirst,					//6
_playerFPS,					//7
_energyPercent,				//8
_respect,					//9
_colourDefault,				//10
_colourDamage,				//11
_colourHunger,				//12
_colourThirst,				//13
_dir,						//14
_hours,						//15
_minutes,					//16
_locker	,					//17
_death,
"BPM",						//19
_colourRespect				//20
];
