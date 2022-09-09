
// Parameters from the lobby selection are passed here. Remove time of day selection as needed. You can add other things in such as difficulty settings etc, if needed.
// Additional settings in the description.ext file to make this work!!!

if (isMultiplayer) then 
{
	//mulitplayer

	//Respawn time
	TOUR_respawnTime = (paramsArray select 0);
	
	//Lives
	TOUR_respawnTickets = [(paramsArray select 1),(paramsArray select 1),(paramsArray select 1),(paramsArray select 1)];

	//Time of Day
	TOUR_TOD = (paramsArray select 2);
	
}else
{
	//singleplayer
	
	//Respawn time
	TOUR_respawnTime = 30;
	
	//lives
	TOUR_respawnTickets = [1,1,1,1];

	//Time of Day
	TOUR_TOD = 1;	
};

if (isServer) then
{
	_timeAdd = switch (TOUR_TOD) do
	{
		case 0: {-8};	//sunrise
		case 1: {0};	//noon
		case 2: {7};	//sunset
		case 3: {11};	//night
		case 4: {[0, -8, 7, 11] call BIS_fnc_selectRandom};	//random
	};
	skipTime _timeAdd;
};

_rc = [TOUR_respawnTickets, TOUR_respawnTime]execVM "scripts\TOUR_RC\init.sqf";
waitUntil {scriptDone _rc};