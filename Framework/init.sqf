///////////Artillery computer
//enableEngineArtillery false; //here also block AI to use artillery
if (hasInterface) then
{
	[] spawn
	{
		waitUntil {!isNull player};
		[player, didJIP] remoteExec ["WMS_fnc_initPlayerServer", 2];
	};
};
/////////////////// Welcome Credits by Gr8 /////////////
//execVM "Custom\Intro\introPVP.sqf";
execVM "Custom\Intro\intro.sqf";
//execVM "Custom\Intro\intro_planes.sqf";
//execVM "Custom\Intro\introAirAssist.sqf";

///////////Watermark////////////
execVM "Custom\Watermark\init.sqf";

////////////////// Igiload /////////////////////////////
[] execVM "Igiload\IgiLoadInit.sqf";

///////////////From Old Mission file /////////////////////
[] execVM "Custom\Nametag\nametage.sqf"; //Deactivate if PVP

//////////R3F Logistic//////////
execVM "R3F_LOG\init.sqf";

////////// Infantry Program local variables //////////
[] execVM "InfantryProgram\InfantryProgram_LocVar.sqf";

//////////Briefing//////////
//[] execVM "Custom\Briefing\briefing.sqf"; // Briefing and Rules

//ACE Custom actions //WORKS in dedicated server
[] execVM "Server\ACEcustomActions.sqf";

CHVD_allowNoGrass = false;
CHVD_maxView = 12000;
CHVD_maxObj = 12000;

WMS_MissionDebug = true;


if (!hasInterface && !isServer) then
{
	execVM "init_HC.sqf";
};
