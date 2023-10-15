/**
 * WMS_fnc_generateHexaID
 *
 * {|||TNA|||}WAKeupneo
 * www.TNA-community.com
 * © 2021 {|||TNA|||}WAKeupneo
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */

private _hexaBase = [0,1,2,3,4,5,6,7,8,9,"a","b","c","e","e","f"];
private _hexaArray = [];
private _hexaID = "";
for "_i" from 1 to 10 do {
	_hexaArray pushBack	(selectRandom _hexaBase);
};
_hexaID = format ["%1%2%3%4%5%6%7%8%9%10",(_hexaArray select 0),(_hexaArray select 1),(_hexaArray select 2),(_hexaArray select 3),(_hexaArray select 4),(_hexaArray select 5),(_hexaArray select 6),(_hexaArray select 7),(_hexaArray select 8),(_hexaArray select 9)];

_hexaID;