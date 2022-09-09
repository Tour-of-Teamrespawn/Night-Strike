class CfgDebriefing
{
	class complete
	{
		title = "Mission Success";
		subtitle = "Objectives Complete!";
		description = "You have successfully completed all objectives and returned to base!";
		pictureBackground = "img\USFlag.paa";
		picture = "b_inf";
		pictureColor[] = { 0.0, 0.3, 0.6, 1 }; // blufor colours
	};
	class aborted
	{
		title = "Mission Aborted";
		subtitle = "Objectives Not Complete!";
		description = "You reported back in without completing all objectives.";
		pictureBackground = "img\USFlag.paa";
		picture = "b_inf";
		pictureColor[] = { 0.0, 0.3, 0.6, 1 }; // blufor colours
	};
	class kia
	{
		title = "Mission Failure";
		subtitle = "KIA";
		description = "All teammates were killed in action.";
		pictureBackground = "img\USFlag.paa";
		picture = "o_inf";
		pictureColor[] = { 0.6,0.1,0.2,1 }; // opfor colours
	};
};