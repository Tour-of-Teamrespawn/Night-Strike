/*
	Title: fn_debugRPT
	Descirption:
	
		Creates an entry in the server and client RPT file with the mission name in place of the %1.
		Makes it easier to debug when you know what mission created the error.
		This should be called first in your init.sqf to ensure that the RPT starts as the mission loads.
		Alternatively define it in the functions config with "preinit = 1" - for details to to https://community.bistudio.com/wiki/Arma_3:_Functions_Library

	Usage:
	
		call TOUR_fnc_debugRPT;

	Author: Mr.Ben (Credit To Razorbacks)
			Andy455 - Added MPEnded with similar info
	Version: 1.0
*/
diag_log text "";
diag_log text "==========================================================================";
diag_log text format["|==================== STARTING: %1 ====================|", missionName];
diag_log text "==========================================================================";
diag_log text "";

private _0 = addMissionEventHandler ["MPEnded", {
	diag_log text "";
    diag_log text "==========================================================================";
	diag_log text format["|====================   ENDING: %1   ====================|", missionName];
    diag_log text "==========================================================================";
	diag_log text "";
}];