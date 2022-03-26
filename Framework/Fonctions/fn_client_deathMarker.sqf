params [
	["_playerObject", player] //probably useless
];
private _mkrdeath = createMarkerLocal [format ["MKRdeath_%1", round time], position player];
_mkrdeath setMarkerTypeLocal "KIA";
_mkrdeath setMarkerColorLocal "colorRed";
_mkrdeath setMarkerSizeLocal [0.6,0.6];