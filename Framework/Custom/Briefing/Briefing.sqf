if (!hasInterface) exitWith {};

//waitUntil {!isNil "ExileClientLoadedIn"};
 // Waits for Exile to finish up

player createDiarySubject ["Main","TNA Briefing"];
//player createDiarySubject ["Info","Website"];


// Main Section

	player createDiaryRecord ["Main",
		[
			"Contact us",
			"
			<br/>
			We are on Discord: https://discord.gg/Zs23URtjwF
			<br/>
			www.TNA-Community.com
			"
		]
	];

	player createDiaryRecord ["Main",
		[
			"Infantry Program",
			"
			<br/>
			If you are part of the Infantry program ONLY: <br/>
			We are testing a custom-made addon, more oriented infantry,<br/>
			the use of vehicle is very restricted, Driver, Cargo or whatever,<br/>
			Allowed vehicles: C130J and Parachute, maybe one Chopper and one ATV.<br/>
			Supplydrop request*, <br/>
			halojump from/to anywhere*, <br/>
			player events, <br/>
			personal missions, <br/>
			Group halojump from C130J, <br/>
			Extraction by helicopter, <br/>
			possibility to 'secretly' carry crates and increase your inventory,<br/>
			DO NOT KILL OTHER PLAYERS!<br/>
			And more coming!<br/>
			Most of it is server side, do not wast your time with the mission files,<br/>
			* from custom computer.<br/>
			"
		]
	];
	
	player createDiaryRecord ["Main",
		[
			"PVE Rules",
			"
			<br/>
			DO NOT KILL OTHER PLAYERS !<br/>
			Do not steal other players stuff/vehicles.<br/>
			Do not put your territory flag in/around other buildings.<br/>
			Do not try to breach in other players bases, unless you are part of the Infantry Program*.<br/>
			Do not park your vehicles in the middle of the road or in front of the traders doors/inside the traders.<br/>
			Tag your mission on the map and claim them in the side chat.<br/>
			"
		]
	];
	
	player createDiaryRecord ["Main",
		[
			"PVP Rules",
			"
			<br/>
			KILL OTHER PLAYERS !<br/>
			Kill Other Players ONLY if both of you are OUTSIDE Exclusion Zones (red Circles)<br/>
			DO NOT destroy other players vehicles if they are not inside.<br/>
			DO NOT destroy other players vehicles INSIDE Exclusion Zones.<br/>
			DO NOT destroy other players UNARMED vehicles.<br/>
			AT/AP mines kills are not welcome.<br/>
			DO NOT camp in other player base/territory<br/>
			Do not put your territory flag in/around other buildings.<br/>
			Do not park your vehicles in the middle of the road or in front of the traders doors/inside the traders.<br/>
			No 'Role Play' bulshit, you either kill or not but the first one coming with a 'put your hands on your head' will be ban.<br/>
			DO NOT BE A MORON, everything will be logged server side even if there is no Admin on the server.<br/>
			"
		]
	];
	
	player createDiaryRecord ["Main",
		[
			"Useful Items",
			"
			<br/>
			'CSAT ID card' v1 + v2 + v3 + v4 + v5 (in your inventory)<br/>
			Go to the WastDump Container at any trader to 'Claim a Reward', you can get from RocketMan to a Tank<br/>
			Lower is your respect, better is the reward<br/>
			<br/>
			'Radio R-187-P1' (in the Radio slot)<br/>
			this Radio is the new Item to build the 'InfantryProgram computer' ('Old Chest' in Exile) and acces some new things<br/>
			<br/>
			'Ace Personal Aid Kit' (in your enventory) + Territory Medical Facilities<br/>
			You can 'Reset ACE fatigue' (every hour) and patch yourself up<br/>
			<br/>
			'FilesSecret' + 'FileNetworkStructure' + 'FileTopSecret' in your inventory + backpack 'RadioBag woodland NATO'<br/>
			you can activate a radar for about 5 minutes which will show you on the map all the patroling AI vehicles<br/>
			<br/>
			"
		]
	];

	player createDiaryRecord ["Main",
		[
			"Territory, Base Layouts, FastTravel.",
			"
			<br/>
			You can have 2 territories, to get a territory, go to the Office Trader, scroll-wheel and click on 'select territory Position (experimental)' (you need 20000 what ever is the name of the money).<br/>
			It will open the map, click on the map where you want your territory (after 2 seconds), done.<br/>
			Limitations:<br/>
			- minimum 750m from traders<br/>
			- minimum 750m from spawns<br/>
			- minimum 300m from other 'flags' (Might reduce)<br/>
			- outside of military/factory/city unless enough space to create the territory 50m away from lootSpawn (buildings)<br/>
			At the Coordinates you clicked, it spawned a beacon/flag/radar/whatever is the territory object (Radar for now) AND a basic bunker camp<br/>
			From the Radar (flag?) you can:<br/>
			- Activate Rotation Engine (you can turn your all base)<br/>
			- Add member to the Fast Travel<br/>
			- Change Base Layout<br/>
			- Upgrade your territory<br/>
			- Delete Territory<br/>
			<br/>
			*Activate Rotation Engine:<br/>
			you can turn your all base, it's a bit tricky but it works.<br/>
			- Add member to the Fast Travel<br/>
			up to 4 members, you can add players (10m around the Radar (flag?)) to the FastTravel function on this territory.<br/>
			Each member added increase the level of the base attack, 4 members +4 levels.<br/>
			*Change Base Layout:<br/>
			Several base layouts available at each level, you can spawn it after restart (cheaper) or right now (more expensive) in any case, you MUST MOVE YOUR VEHICLES away from the base (at least 40m) or they might be destroyed.<br/>
			*Upgrade your territory:<br/>
			You can upgrade up to level 6, increase level add different (bigger) layouts, <br/>
			Increase the FastTravel accuracy, LvL 1 = 1000m, LvL 2 = 800m, LvL 3 = 600m, LvL 4 = 400m, LvL 5 = 200m, LvL 6 = 80m.<br/>
			*Delete Territory:<br/>
			Boom, gone, no refund.<br/>
			<br/>
			FastTravel:<br/>
			You can FastTravel from spawn Zone, you must spawn as Bambie, be in freefall at least 300m above the ground.<br/>
			Limitations:
			- Maximum 3 FastTravel positions.<br/>
			<br/>
			Base Attack:<br/>
			Based on 10 levels (Like Exile), combination of Territory level (1 to 6) and Friends fastTravelers (0 to 4), the player who trigger the base attack (usually the owner, USUALLY) will get a base attack notification (logged in map/log).<br/>
			Higher is the level harder is the attack, in any case they will get reinforcement and probably wreck your ass.<br/>
			"
		]
	];

	player createDiaryRecord ["Main",
		[
			"Welcome",
			"
			<br/>
			Welcome!<br/>
			The community is running differents Arma servers, usualy 3 of them,<br/>
			Most of TNA servers are PVE and we try to help each other.<br/>
			You can FastTravel from the spawn point if you have a territory and you spawn as 'Bambi', the accuracy of the FastTravel will depend of level of the Territory, 100 to 800m radius.<br/>
			Choppers are flying with ADVANCED FLIGHT MODEL, there is nothing you can do to change that, training is the best option (NDLR: I can help. WAKeupneo) or, join the Infantry Program*.<br/>
			<br/>
			AI:<br/>
			- Roaming infantry in villages/cities with cooldown and random chance to spawn, they are not spawning behind you, they are already there when you get in the city.<br/>
			- Roaming AI vehicles, from unarmed offroads to heavy tanks (sometimes), Ai are driving Tan/sand/desert color vehicles, you can steal and sell those vehicles, you can not put a lock on them.<br/>
			- AI Air patrol might fire at you if they are armed.<br/>
			- Mission AI, the hardcore level has been lowered but they can still one shot you, yeah, AI kill players. Closer you are, more respect you get when you kill them<br/>
			"
		]
	];
	
	player createDiaryRecord ["Main",
		[
			"The Last Cartridges",
			"
			<br/>
			(Les Dernieres Cartouches)<br/>
			Is an 1873 painting by the French artist Alphonse de Neuville (What!? WTF are you talking about!?).<br/>
			It recreates an incident of the Franco-Prussian War, when the French defenders of Bazeilles fought to the last cartridge during the 1870 Battle of Sedan.<br/>
			The fighting at Bazeilles was celebrated by the French nation as a moral victory amidst an otherwise catastrophic defeat. (wikipedia)<br/>
			Battle Of Bazeille:<br/>
			The Battle of Bazeilles was fought on 1 September 1870 during the Franco-Prussian War as a portion of the larger Battle of Sedan and was one of the first battles to feature modern urban warfare tactics.<br/>
			It took place in Bazeilles, France, a small village in the department of Ardennes near Sedan, and involved a force of Bavarian soldiers battling against French marines and partisans.<br/>
			The battle was, in effect, an ambush of the Bavarians (who were allies of the Prussians), by a small detachment of the 'Blue Division' Troupes de marine (known also as marsouins),<br/>
			under the command of Élie de Vassoigne. Marsouin snipers, along with local guerrillas, fired on the Bavarian troops using quick-firing Chassepot breech-loading rifles.<br/>
			Although outnumbered ten to one, the French held the village until Napoleon III gave orders to withdraw. A small group under commander Arsène Lambert remained in the last house on the road to Sedan,<br/>
			the Auberge Bourgerie, fighting to the last bullet in order to cover the retreat.<br/>
			After seven hours of conflict, the Bavarian troops took the village, and the captured Franc-tireur partisans, along with other civilians who were considered unlawful combatants, were later executed.<br/>
			General de Vassoigne famously remarked on the French soldiers involved in the battle, 'The troupes de marine fought beyond the extreme limits of duty.'<br/>
			https://en.wikipedia.org/wiki/Battle_of_Bazeilles<br/>
			<br/>
			The server is running less than 7 hours so you should be fine. xD<br/>
			<br/>
			"
		]
	];