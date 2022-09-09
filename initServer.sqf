// All code in here is ran for the server only - either for a dedicated machine or the player hosting the server (listen server)
// It is ran AFTER the init.sqf and before the initLocalPlayer.sqf

waitUntil {!isNil "TOUR_init_completed"};

// This will tidy up any units that you with to clear up through the missions. This is useful for missions that continually spawn enemies.
_g = execVM "scripts\control\garbageLoop.sqf";
waitUntil {!isNil "TOUR_mission_Units"};

// Runs script to setup objectives.
_o = execVM "scripts\control\setupObjectives.sqf";

// Creates ambient pedestrians walking from building to building in given area.
// Pass the information of [marker name, number of civilans, [array of civilian class names]]
_cp = ["TOUR_mkr_AO", 10, ["UK3CB_TKC_C_CIV", "UK3CB_TKC_C_CIV","UK3CB_TKC_C_CIV", "UK3CB_TKC_C_SPOT", "UK3CB_TKC_C_WORKER"]] execVM "scripts\ambientLife\createPedestrians.sqf";
waitUntil {scriptDone _cp};

// creates vehicles driving from random spawn points to various locations. There is a small chance that enemies will spawn also.
// make markers called "TOUR_mkrCarSpawn_1" to 5 or however many you need. These are where the cars will spawn.
// make markers called "TOUR_mkrCarCentre_1" to however many you need. These are the positions that the car will drive to before returning to a random spawn location.
// remember to keep the spawn positions out of the view of the players so they can disappear without being noticed!
// the info passed to the scripts are [[array of vehicle types for civlians],[array of vehicle types for enemyies], % chance of enemy spawn, player side]  - you can leave the enemy vehicle array empty if you do not want any.
_cc = [
		[
			"C_Offroad_01_F",
			"C_Offroad_01_repair_F",
			"C_Truck_02_covered_F",
			"C_Hatchback_01_F",
			"C_Van_01_transport_F"
		],
		[
			"rhs_tigr_sts_vdv",
			"rhs_uaz_vdv",
			"rhs_uaz_open_vdv"
		],
		7,
		WEST,
		EAST,
		["UK3CB_CHC_C_CIT", "UK3CB_CHC_C_WORKER","UK3CB_CHC_C_HIKER", "UK3CB_CHC_C_VILL", "UK3CB_CHC_C_WOOD", "UK3CB_CHC_C_LABOUR", "UK3CB_CHC_C_FUNC"]
] execVM "scripts\ambientLife\createVehicles.sqf";

// execute code to setup various enemies on the made - alter settings within	
_e =  execVM "scripts\control\setupEnemy.sqf";

TOUR_initServer_complete = true;