if (isServer) then
{
	[_this, TDMC_current_mission] remoteExecCall ["TOUR_SI_fnc_radioEndSpeech", 0, false];
	[]spawn
	{	
		TDMC_mission_complete = true;
		sleep 15;
		TDMC_mission_running = false;
		TOUR_SI_core setVariable ["TOUR_SI_inuse", nil, true];		
	};
};


