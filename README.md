# WMS_TheLastCartridges

Mission file for Arma 3 Dedicated Server, but it can run in the mission Editor/MP even if I dont recommend it on the long term<br/>
I used to play/setUp Exile Mod servers for years but with the end of developpement from the Exile Mod Team, well,<br/>
things started to get "broken", more and more, a lot of patch/fix/overrides, Exile Mod is great, it just doesn't fit what I want anymore.<br/>
In parallel, I built (still building?) my own AI/Missions system with a lot of CBA/ACE stuff in it, more and more ACE stuff.<br/>
Then came TheLastCartridges, a "survival" mission file with:<br/>
a vanilla Arma3 spawn system,<br/>
a basic loot system,<br/>
a very basic trader/economy/respect system,<br/>
a basic permanent base/territory system,<br/>
permanent vehicles,<br/>
Ace food/drink,<br/>
custom Respawns,<br/>
no Database (yeah, it's not made for hundreds of players running everywhere 24h/day, but for few friends, it does the job),<br/>
Etc...<br/>
all very basic but easy to fix and update when bohemia break something.<br/>
To keep the AI/mission system compatible with Exile Mod, the money/respect/kill/death variables are the same than Exile.
The money still show up as "poptabs" in some functions I think, the curency didn't really get any name (yet).

"v1.58_2022MAY31_GitHub" modify serverProfile Variables, you need to convert them if you update from previous versions:
```
private _permanentVhlArray = profileNameSpace getVariable ["permanentVhlArray", []]; 
private _TerritoriesArray = profileNameSpace getVariable ["territoriesArray", []];
profileNameSpace setVariable ["WMS_permanentVhlArray", _permanentVhlArray]; 
profileNameSpace setVariable ["WMS_territoriesArray", _TerritoriesArray];
profileNameSpace setVariable ["permanentVhlArray", nil]; 
profileNameSpace setVariable ["territoriesArray", nil]
```

Doesn't include any AI/Mission but ready to work with WMS_InfantryProgram<br/>
This version of the Framework include:

    CHVD - for viewDistance setup
    Igiload - to carry crate/vehicles around
    R3F_LOG - to carry crate/statics around
    3 client side files for Infistar Arma3
    WMS_InfantryProgram mpmission files
    And some old Crap which need to be cleaned...

you will need at least CBA, ACE3, RHS AFRF/USAF/GREF<br/>
CfgSounds and custom\ogg will certainly change

## License

&copy; 2022 {|||TNA|||}WAKeupneo

For any part of this work for which the license is applicable, this work is licensed under the [Attribution-NonCommercial-NoDerivatives 4.0 International](http://creativecommons.org/licenses/by-nc-nd/4.0/) license. See LICENSE.CC-BY-NC-ND-4.0.

<a rel="license" href="http://creativecommons.org/licenses/by-nc-nd/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-nc-nd/4.0/88x31.png" /></a>

Any part of this work for which the CC-BY-NC-ND-4.0 license is not applicable is licensed under the [Mozilla Public License 2.0](https://www.mozilla.org/en-US/MPL/2.0/). See LICENSE.MPL-2.0.

Any part of this work that is known to be derived from an existing work is licensed under the license of that existing work.
