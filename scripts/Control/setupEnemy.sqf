// place random enemies in houses within a marker
// marker name, side of enemy, minimum number, max number of enemies, array of enemy class names
_eh = 	[
			"TOUR_mkr_AO",
			EAST,
			10,
			20, 
			[
				"UK3CB_TKM_O_SL",
				"UK3CB_TKM_O_TL",
				"UK3CB_TKM_O_MD",
				"UK3CB_TKM_O_MG",
				"UK3CB_TKM_O_MG_ASST",
				"UK3CB_TKM_O_AR",
				"UK3CB_TKM_O_AT",
				"UK3CB_TKM_O_AT",
				"UK3CB_TKM_O_AT",
				"UK3CB_TKM_O_AT_ASST",
				"UK3CB_TKM_O_AA",
				"UK3CB_TKM_O_MK",
				"UK3CB_TKM_O_SNI",
				"UK3CB_TKM_O_SPOT",
				"UK3CB_TKM_O_ENG",
				"UK3CB_TKM_O_DEM",
				"UK3CB_TKM_O_IED",
				"UK3CB_TKM_O_RIF_1",
				"UK3CB_TKM_O_RIF_2",
				"UK3CB_TKM_O_GL"
			]
		] call TOUR_fnc_EnemyHouse;

// place enemies at predefined positions to patrol. These can be vehicle groups or infantry. 
// Predefined points are an array of markers. You can randomize it my min and max values to spawn.
// You will need to pass the information for the groups, with the type of group and group class name. See config editor for paths.
// marker name, side of enemy, minimum number, max number of enemies, array of enemy class names.
// min value, max value, marker position array, faction, side, group types, patrol distance.
_ep = 	[
			7,
			10,
			[
				"TOUR_mkr_patrol_1",
				"TOUR_mkr_patrol_2",
				"TOUR_mkr_patrol_3",
				"TOUR_mkr_patrol_4",
				"TOUR_mkr_patrol_5",
				"TOUR_mkr_patrol_6",
				"TOUR_mkr_patrol_7",
				"TOUR_mkr_patrol_8",
				"TOUR_mkr_patrol_9",
				"TOUR_mkr_patrol_10"
			],
			"UK3CB_TKM_O",
			EAST,
			[
				["infantry", "UK3CB_TKM_O_RIF_Sentry"],
				["infantry", "UK3CB_TKM_O_IED_Sentry"],
				["infantry", "UK3CB_TKM_O_AT_Sentry"],
				["infantry", "UK3CB_TKM_O_AR_Sentry"],
				["infantry", "UK3CB_TKM_O_MG_Sentry"],
				["infantry", "UK3CB_TKM_O_UGL_Sentry"],
				["infantry", "UK3CB_TKM_O_AT_FireTeam"],
				["infantry", "UK3CB_TKM_O_UGL_FireTeam"],
				["infantry", "UK3CB_TKM_O_MG_FireTeam"],
				["infantry", "UK3CB_TKM_O_RIF_FireTeam"],
				["infantry", "UK3CB_TKM_O_MK_FireTeam"],
				["infantry", "UK3CB_TKM_O_AR_FireTeam"]
			],
			120
		] call TOUR_fnc_mkrPatrols;