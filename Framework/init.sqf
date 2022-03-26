///////////Artillery computer
//enableEngineArtillery false; //here also block AI to use artillery

/////////////////// Welcome Credits by Gr8 /////////////
//execVM "addons\intro\introPVP.sqf";
execVM "addons\intro\intro.sqf";
//execVM "addons\intro\intro_planes.sqf";
//execVM "addons\intro\introAirAssist.sqf";

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
CHVD_maxView = 6000;
CHVD_maxObj = 4500;