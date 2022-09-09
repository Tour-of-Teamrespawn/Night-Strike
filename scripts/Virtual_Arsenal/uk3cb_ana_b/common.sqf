_weapon_accessories = [

];

_magazines = [

	"SmokeShellBlue",
	"SmokeShellGreen",
	"SmokeShellOrange",
	"SmokeShellPurple",
	"SmokeShellRed",
	"SmokeShellYellow",
	
	"rhs_vog25",
    "rhs_vog25p",
	"rhs_grd40_white",
	"rhs_grd40_red",
	"rhs_grd40_green",
	"rhs_vg40op_white",
	"rhs_vg40op_red",
	"rhs_vg40op_green",

	"Chemlight_red",
	"Chemlight_yellow",
	"Chemlight_green",
	
	"B_IR_Grenade",
	
	"rhs_mag_m67",
	"rhs_mag_an_m8hc",
	"rhs_mag_mk84",
	"rhs_mag_30Rnd_556x45_M855_Stanag",
	"rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Red",
	"rhs_30Rnd_762x39mm_bakelite",
	"rhs_30Rnd_762x39mm_bakelite_tracer",
	"rhs_30Rnd_762x39mm",
	"rhs_30Rnd_762x39mm_tracer",
	
	"rhs_100Rnd_762x54mmR",

	"rhsusf_100Rnd_762x51",
	"rhsusf_100Rnd_556x45_soft_pouch",
	
	"rhs_mag_M433_HEDP",
	"rhs_mag_M441_HE",
	"rhs_mag_M397_HET",
	"rhs_mag_m661_green",
	"rhs_mag_m662_red",
	"rhs_mag_m713_Red",
	"rhs_mag_m714_White",
	"rhs_mag_m715_Green",
	"rhs_mag_m716_yellow",
	"rhs_mag_M585_white",

	"rhs_rpg7_OG7V_mag",	
	"rhs_rpg7_PG7VL_mag",
	"rhs_rpg7_PG7V_mag",
	"rhs_rpg7_PG7VM_mag",
	
	"rhsusf_5Rnd_762x51_m993_Mag",
	"rhs_10Rnd_762x54mmR_7N1",
	
	"rhsusf_mag_17Rnd_9x19_FMJ",
	"rhsusf_mag_15Rnd_9x19_FMJ",

	"acex_intelitems_notepad"
];


_weapons = [
	"rhsusf_weap_m9",
	"rhs_weap_makarov_pm"
];

_static = [

];

_backpacks = [
	"B_parachute"
];

_uniform_glasses = [
	"rhs_goggles_black",
	"rhs_goggles_clear",
	"rhs_goggles_orange",
	"rhs_goggles_yellow",
	"rhs_ess_black",
	"G_Aviator"
];

_uniform_items = [
	"rhsusf_ANPVS_14"
];

_uniform_vests = [
	"uk3cb_ana_b_v_vest_tan_01",
	"uk3cb_ana_b_v_vest_wdl_01"
];

_bis_items = [
	"ItemWatch",
	"ItemCompass",
	"ItemMap"
];

_ACE_items = [
	//general items
//	"ACE_IR_Strobe_Item",
	"ACE_CableTie",
	"ACE_EntrenchingTool",
	"ACE_Chemlight_HiOrange", "ACE_Chemlight_HiRed", "ACE_Chemlight_HiYellow", "ACE_Chemlight_HiWhite", "2ACE_Chemlight_Orange", "ACE_Chemlight_White", "ACE_Chemlight_IR",
	"ACE_ConcertinaWireCoil",
	"ACE_Flashlight_XL50",
	"ACE_bodyBag",

	"ACE_HandFlare_White",
	"ACE_HandFlare_Red",
	"ACE_HandFlare_Green",
	"ACE_HandFlare_Yellow",
	"ACE_Earplugs",
	"ACE_wirecutter",
	"ACE_MapTools",

	//medical common
//	"ACE_atropine",
	"ACE_fieldDressing",
//	"ACE_elasticBandage",
//	"ACE_quikclot",
	"ACE_bodyBag",
	"ACE_bodyBagObject", 
	"ACE_epinephrine",
	"ACE_morphine",
//	"ACE_packingBandage",
//	"ACE_personalAidKit",
	"ACE_tourniquet",
	"ACE_bloodIV",
	"ACE_bloodIV_500",
	"ACE_bloodIV_250",
	
	"ACE_rope12",
	"ACE_rope15",
	"ACE_rope18",
	"ACE_rope_27",
	"ACE_rope_36",

	"ACE_Altimeter"
];

_ACRE_radio = [
	"ACRE_PRC77",
	"ACRE_PRC117F",
	"ACRE_PRC148",
//	"ACRE_PRC152",
	"ACRE_PRC343",
	"ACRE_SEM52SL",
	"ACRE_SEM70",
	"ACRE_VRC64",
	"ACRE_VRC103",
	"ACRE_VRC110",
	"ACRE_VRC111",
	"ACRE_SEM90",
	"ACRE_VHF30108SPIKE",
	"ACRE_VHF30108",
	"ACRE_VHF30108MAST"
];

_ACE_backpack = 
[
	"ACE_TacticalLadder_Pack",
	"ACE_NonSteerableParachute",
	"ACE_ReserveParachute"
];

_array = [
			(_weapons + _static), 
			(_ACE_items + _bis_items + _weapon_accessories + _uniform_glasses + _uniform_items + _ACRE_radio + _uniform_vests),
			_magazines,
			(_backpacks + _ACE_backpack)
			];

_array
