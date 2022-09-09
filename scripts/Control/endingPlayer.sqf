_player = _this select 0;
_officer = _this select 1;
_action = _this select 2;

if (!isDedicated) then
{
	TOUR_officer removeAction _action;
};

_player directSay "TOUR_reportingback";
sleep 5;
_officer directSay "TOUR_welcomeback";
sleep 5;

_success = if 
				(
					("TOUR_objFind" call A2S_taskState == "SUCCEEDED")
					&&
					("TOUR_objTank" call A2S_taskState == "SUCCEEDED")
					&&
					("TOUR_objRadio" call A2S_taskState == "SUCCEEDED")
					&&
					("TOUR_objtruck" call A2S_taskState == "SUCCEEDED")
					&&
					("TOUR_objClear" call A2S_taskState == "SUCCEEDED")
				) 
				then {true} else {false};

if (isServer) then
{
	[]spawn
	{
		if ("TOUR_objFind" call A2S_taskState != "SUCCEEDED") then
		{
			["TOUR_objFind", "failed"] call A2S_setTaskState;
			"TOUR_objFind" call A2S_taskCommit;
		};
		if ("TOUR_objTank" call A2S_taskState != "SUCCEEDED") then
		{
			["TOUR_objTank", "failed"] call A2S_setTaskState;
			"TOUR_objTank" call A2S_taskCommit;
		};
		if ("TOUR_objRadio" call A2S_taskState != "SUCCEEDED") then
		{
			["TOUR_objRadio", "failed"] call A2S_setTaskState;
			"TOUR_objRadio" call A2S_taskCommit;
		};
		if ("TOUR_objtruck" call A2S_taskState != "SUCCEEDED") then
		{
			["TOUR_objtruck", "failed"] call A2S_setTaskState;
			"TOUR_objtruck" call A2S_taskCommit;
		};
		if ("TOUR_objClear" call A2S_taskState != "SUCCEEDED") then
		{
			["TOUR_objClear", "failed"] call A2S_setTaskState;
			"TOUR_objClear" call A2S_taskCommit;
		};
	};	
};

if (!_success) then
{
	_player directSay "TOUR_playernotgood";
	sleep 5;
	_officer directSay "TOUR_officernotgood";
}else
{
	_player directSay "TOUR_playergood";
	sleep 5;
	_officer directSay "TOUR_officergood";
};

sleep 3;

if (_success) then
{
	"complete" remoteExecCall ["BIS_fnc_endMissionServer", 0, true];
}else
{
	"aborted" remoteExecCall ["BIS_fnc_endMissionServer", 0, true];
};
