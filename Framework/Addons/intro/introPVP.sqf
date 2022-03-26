waitUntil{!isNull (findDisplay 46)};
sleep 20;

//playSound3D ["a3\dubbing_radio_f\Sfx\radionoise1.ogg", Player];
//player say3D "Christmas";

_role1 = "Welcome to TNA PVP server";
_role1names = [
"SERVER RESTART EVERY 5 HOURS"
];
_role2 = "PVP server!!!";
_role2names = ["-Do not kill players in ExclusionZones","-Do not kill /Civilians"];
_role3 = "Territories/Camps";
_role3names = ["2 max/player","Territories can be used to FastTravel from Spawn"];
_role4 = "Join us on TNA Discord";
_role4names = ["https://discord.gg/Zs23URtjwF"];
_role5 = "Features";
_role5names = ["Sell Mission VHL/crates","Sell roaming AI vehicles","-Full Custom AI system","-R3F Logistic","-Igiload","-Towing"];
_role6 = "Last Punishment";
_role6names = ["Nobody yet !","Trainers users will be Infistar Global Ban"];
_role7 = "Traders Informations";
_role7names = ["light trader system", "WastDump container to sell stuff","WastDump container to buy Ammo","Ammo only for primary weapon"];
_role8 = "PVP server!!!";
_role8names = ["-Do not kill players in ExclusionZones","-Do not kill /Civilians"];
_role9 = "Respect Levels with Master Level";
_role9names = ["-Level 0 : 0","-Level 1 : 1000","-Level 2 : 6000","-Level 3 : 12000","-Level 4 : 18000","-Level 5 : 25000","-Level 6 : 50000"];
_role10 = "Don't be a fuckup!";
_role10names = [
	"Do not kill players in ExclusionZones",
	"And Have fun"
];

_onScreenTime = 15;

{
	sleep 5;
	_memberFunction = _x select 0;
	_memberNames = _x select 1;
	_finalText = format ["<t size='0.80' color='#800000' align='right'>%1<br /></t>", _memberFunction];
	_finalText = _finalText + "<t size='0.70' color='#FFFFFF' align='right'>";
	{_finalText = _finalText + format ["%1<br />", _x]} forEach _memberNames;
	_finalText = _finalText + "</t>";
	_onScreenTime + (((count _memberNames) - 1) * 0.5);
	[
		_finalText,
		[safezoneX + safezoneW - 0.8,0.50],	//DEFAULT: 0.5,0.35
		[safezoneY + safezoneH - 0.8,0.7], 	//DEFAULT: 0.8,0.7
		_onScreenTime,
		0.5
	] spawn BIS_fnc_dynamicText;
	sleep (_onScreenTime);
} forEach [
	//The list below should have exactly the same amount of roles as the list above
	[_role1, _role1names],
	[_role2, _role2names],
	[_role3, _role3names],
	[_role4, _role4names],
	[_role5, _role5names],
	[_role6, _role6names],
	[_role7, _role7names],
	[_role8, _role8names],
	[_role9, _role9names],
	[_role10, _role10names] //make SURE the last one here does NOT have a , at the end
];
