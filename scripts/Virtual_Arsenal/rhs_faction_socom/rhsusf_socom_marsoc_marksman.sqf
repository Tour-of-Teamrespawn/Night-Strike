_weapon_accessories = [
	"rhsusf_acc_ACOG_RMR_3d",
	"rhsusf_acc_ACOG2_USMC_3d",
	"rhsusf_acc_ACOG_USMC_3d",
	"rhsusf_acc_ACOG_RMR_3d",
	"rhsusf_acc_ACOG_d_3d",

	"rhsusf_acc_kac_grip",

	"rhsusf_acc_anpeq15_light",
	"rhsusf_acc_anpeq15side",
	"rhsusf_acc_anpeq15side_bk",
	"rhsusf_acc_anpeq15A",
	"rhsusf_acc_anpeq16a",
	"rhsusf_acc_anpeq16a_light",
	
	"rhsusf_acc_rotex5_grey",
	"optic_Hamr",
	"optic_Hamr_khk_F",
	"rhsusf_acc_saw_bipod",
	"rhsusf_acc_harris_bipod",
	"rhsusf_acc_nt4_black",
	"rhsusf_acc_nt4_tan",
	"rhsusf_acc_su230_mrds_3d",
	"rhsusf_acc_su230_mrds_c_3d",
	"rhsusf_acc_anpeq15_light",
	"rhsusf_acc_rvg_blk",
	
	"rhsusf_acc_M8541_mrds",
	"rhsusf_acc_aac_m14dcqd_silencer_d",
	"rhsusf_acc_anpeq15side",
	"RKSL_optic_PMII_312_sunshade_des_3d",
	"rhsusf_acc_m14_bipod",
	"muzzle_snds_B_arid_F",
	
	"rhs_optic_maaws"
	
];

_magazines = [];

_weapons = [
	"rhs_weap_m4a1_blockII_KAC",
	"rhs_weap_m4a1_blockII_KAC_d",
	"rhs_weap_m4a1_blockII_KAC_wd",
	"rhs_weap_mk18_KAC_bk",
	"rhs_weap_mk18_d",
	"rhs_weap_mk18_wd",
	"rhs_weap_mk18_SU230",
	
	"rhs_weap_m14_ris_d",
	"rhs_weap_m14_ris_fiberglass",
	"rhs_weap_m14_ris_wd",
	"rhs_weap_mk17_LB",
	
	"arifle_SDAR_F",
	"rhsusf_weap_glock17g4"
];

_launchers = 
[
	"rhs_weap_fgm148",
	"rhs_weap_fim92",
	"rhs_weap_maaws_optic",
	"rhs_weap_M136"
];

_static = 
[
	"rhs_Tow_Gun_Bag",
	"RHS_M2_Gun_Bag",
	"RHS_Mk19_Gun_Bag"
];

_backpacks = 
[
	"rhsusf_assault_eagleaiii_coy",
	"rhsusf_falconii_coy"
];

_uniform_berets = 
[

];

_uniform_boonie = 
[
	"rhs_booniehat2_marpatd",
	"rhs_booniehat2_marpatwd"
];

_uniform_bowman = 
[
	"rhsusf_Bowman",
	"rhsusf_bowman_cap"
];

_uniform_glasses = 
[
	"G_B_Diving"
];

_uniform_helmet = 
[
	"rhsusf_mich_bare_norotos_alt_tan_headset",
	"rhsusf_mich_bare_norotos_alt_tan",
	"rhsusf_mich_bare_norotos_arc_alt_semi",
	"rhsusf_opscore_mar_ut_pelt",
	"rhsusf_mich_bare_norotos_arc_alt_tan",
	
	"H_Bandanna_gry",
	"H_Bandanna_khk_hs",
	"H_Bandanna_mcamo",
	"H_Watchcap_blk",
	
	"rhsusf_patrolcap_ucp",
	"rhsusf_patrolcap_ocp"
];

_uniform_items = 
[
	"rhsusf_ANPVS_15",
	"rhsusf_bino_lrf_Vector21"
];

_uniform_uniform = 
[
	"U_B_Wetsuit",
	"rhs_uniform_g3_mc",
	"rhs_uniform_g3_aor2",
	"rhs_uniform_g3_blk",
	"rhs_uniform_g3_m81",
	"rhs_uniform_g3_rgr",
	"rhs_uniform_g3_tan"
];

_uniform_vest = 
[
	"V_RebreatherB",
	"rhsusf_plateframe_marksman"
];

_bis_items = 
[
	"rhsusf_bino_m24"
];

_bis_magazines = 
[

];

_ACE_items =
[	
	"ACE_Clacker",
	"ACE_M26_Clacker",
	"ACE_DefusalKit",
	"ACE_DeadManSwitch",
	"ACE_HuntIR_monitor",
	"ACE_HuntIR_M203",
	"ACE_Kestrel4500",
	"ACE_DAGR",
	"ACE_Vector",
	"ACE_VectorDay",
	"ACE_Yardage450",
	"ACE_MX2A",
	"ACE_SpottingScope",
	"ACE_RangeCard"
];

_ctab = 
[
	"ItemMicroDAGR",
	"ItemAndroid",
	"ItemcTab",
	"ItemcTabHCam"
];

_array = [
			(_weapons + _launchers + _static), 
			(_ctab + _bis_items + _weapon_accessories + _uniform_uniform + _uniform_berets + _uniform_boonie + _uniform_bowman + _uniform_glasses + _uniform_helmet + _uniform_items + _uniform_vest + _ACE_items),
			(_magazines + _bis_magazines),
			(_backpacks)
			];

_array
