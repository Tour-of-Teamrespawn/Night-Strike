if (isServer) then
{
	[]spawn
	{
		// if ("TOUR_objFind" call A2S_taskState != "SUCCEEDED") then
		// {
		// 	["TOUR_objFind", "failed"] call A2S_setTaskState;
		// 	"TOUR_objFind" call A2S_taskCommit;
		// };
		// if ("TOUR_objTank" call A2S_taskState != "SUCCEEDED") then
		// {
		// 	["TOUR_objTank", "failed"] call A2S_setTaskState;
		// 	"TOUR_objTank" call A2S_taskCommit;
		// };
		// if ("TOUR_objRadio" call A2S_taskState != "SUCCEEDED") then
		// {
		// 	["TOUR_objRadio", "failed"] call A2S_setTaskState;
		// 	"TOUR_objRadio" call A2S_taskCommit;
		// };
		// if ("TOUR_objtruck" call A2S_taskState != "SUCCEEDED") then
		// {
		// 	["TOUR_objtruck", "failed"] call A2S_setTaskState;
		// 	"TOUR_objtruck" call A2S_taskCommit;
		// };
		// if ("TOUR_objClear" call A2S_taskState != "SUCCEEDED") then
		// {
		// 	["TOUR_objClear", "failed"] call A2S_setTaskState;
		// 	"TOUR_objClear" call A2S_taskCommit;
		// };
		sleep 20;
		"aborted" remoteExecCall ["BIS_fnc_endMissionServer", 0, true];
	};
};

if (!isDedicated) then
{
	_this spawn
	{
		private ["_unit", "_group", "_groupstring", "_mission"];
		_unit = _this select 0;
		enableRadio true;
		sleep 2;
		_group = group _unit;
		_groupstring = (str _group) call TOUR_SI_fnc_groupNameFix;
		_unit sideChat format ["HQ this is %1, do you read? OVER", _groupstring];
		sleep 5;
		TOUR_HQ sideChat format ["Loud and clear %1, go ahead. OVER", _groupstring];
		sleep 5;
		_unit sideChat format ["HQ, we are unable to complete the objectives. OVER", _groupstring];
		sleep 5;
		TOUR_HQ sideChat format ["Understood %1, what the hell happened out there?! Get back to base ASAP! OVER", _groupstring];	
		sleep 5;
		_unit sideChat format ["Copy that HQ. %1 OUT", _groupstring];
		sleep 2;
		enableRadio false;
	};
};
