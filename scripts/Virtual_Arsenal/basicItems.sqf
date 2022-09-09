if (isDedicated) exitWith {};

removeUniform player;
removeAllWeapons player;
removeAllItems player;
removeAllAssignedItems player;
removebackpack player;
removeVest player;
removeHeadGear player;

private _uniform = "";

_uniform = switch (toLower TypeOf player) do 
{
	case "rhsusf_socom_marsoc_cso_breacher": {"rhs_uniform_g3_mc"};
	case "rhsusf_socom_marsoc_cso": {"rhs_uniform_g3_mc"};
	case "rhsusf_socom_marsoc_marksman": {"rhs_uniform_g3_mc"};
	case "rhsusf_socom_marsoc_sarc": {"rhs_uniform_g3_mc"};
	case "rhsusf_socom_marsoc_teamleader": {"rhs_uniform_g3_mc"};
	case "rhsusf_army_ucp_helipilot": {"U_B_HeliPilotCoveralls"};
	case "rhsusf_army_ucp_sniper_m24sws": {"rhs_uniform_g3_mc"};
	case "rhsusf_army_ucp_sniper": {"rhs_uniform_g3_mc"};
	case "rhsusf_socom_marsoc_teamleader": {"rhs_uniform_g3_mc"};
	default {"rhs_uniform_acu_ucp"};
};

if (toLower (faction player) == "uk3cb_ana_b") then 
{
	_uniform = "uk3cb_ana_b_u_combatuniform_01_spec4ce";
};

player addUniform _uniform;

{
	player addItem _x;
	player assignItem _x;
}forEach ["ItemMap","ItemCompass","ItemWatch"];

{
	player addItemToUniform _x;
}forEach 
[
	"ACE_fieldDressing","ACE_fieldDressing","ACE_fieldDressing","ACE_fieldDressing","ACE_fieldDressing","ACE_fieldDressing","ACE_fieldDressing","ACE_fieldDressing",
	"ACE_tourniquet",
	"ACE_morphine","ACE_morphine","ACE_morphine",
	"ACE_epinephrine",
	"ACE_bloodIV_500",
	"ACE_Earplugs",
	"ACRE_PRC343"
];

