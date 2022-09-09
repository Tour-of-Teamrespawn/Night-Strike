_weapon_accessories = [
	"rhsusf_acc_ACOG_RMR_3d",
	"rhsusf_acc_compm4",
	"rhsusf_acc_anpeq16a_light_top",

	"rhsusf_acc_kac_grip",

	"rhsusf_acc_anpeq15side",
	"rhsusf_acc_anpeq15side_bk",
	"rhsusf_acc_anpeq15A",
	"rhsusf_acc_anpeq16a",
	"rhsusf_acc_anpeq16a_light",
	
	"rhsusf_acc_LEUPOLDMK4",
	"rhsusf_acc_anpas13gv1",
	"rhsusf_acc_rotex5_grey",
	"rhsusf_acc_M8541",
	"rhsusf_acc_M8541_d",
	"rhsusf_acc_M8541_mrds",
	"rhsusf_acc_M8541_wd",
	"rhsusf_acc_harris_bipod",
	"rhsusf_acc_rotex5_tan"

];

_magazines = [];

_weapons = [
	"rhs_weap_m4a1_blockII_d",
	"rhs_weap_m4a1_blockII_bk",
	"rhs_weap_m4a1_blockII_wd",
	"rhs_m4a1_acog",
	"rhs_m4a1_acog2",
	"rhs_m4a1_acog3"
];

_launchers = [

];

_static = 
[

];

_backpacks = 
[
	
];

_uniform_berets = 
[

];

_uniform_boonie = 
[

];

_uniform_bowman = 
[
	
];

_uniform_glasses = 
[

];

_uniform_helmet = 
[
	"rhs_Booniehat_ucp",
	"rhs_Booniehat_ocp",
	"rhsusf_ach_bare_semi",
	"rhsusf_patrolcap_ucp",
	"rhsusf_patrolcap_ocp"
];

_uniform_items = 
[

];

_uniform_uniform = 
[
	"UK3CB_ANA_B_U_CombatUniform_Ghillie_GCAM",
	"U_B_GhillieSuit",
	"rhs_uniform_acu_oefcp",
	"rhs_uniform_acu_ucp"
];

_uniform_vest = 
[
	"rhsusf_iotv_ocp_Rifleman",
	"rhsusf_iotv_ucp_Rifleman"
];

_bis_items = 
[
	"rhsusf_bino_m24",
	"rhsusf_bino_lrf_Vector21"
];

_bis_magazines = 
[
	"ClaymoreDirectionalMine_Remote_Mag"
];

_ACE_items =
[	
	"ACE_Clacker",
	"ACE_M26_Clacker",
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
