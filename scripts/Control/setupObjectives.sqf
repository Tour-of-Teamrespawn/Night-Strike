// setup objectives using A2S multitask system

// create as many objectives as needed here. Each uses 3 lines of code.
// Line 1 - Creates task
// Line 2 - Adds destriptions for the tasks. Here you can add hyper links to markers on the map, and images 
// Line 3 - Commits the task changes and updates it for every machine across the network.

// you can see hyperlinks work using the names of markers you have made in the editor. Double click on the editor markers, and see the names that have been given.
// TOUR_objFind for example is the variable name / handle that we give the task, so we can use it now, and later on in other scripts.
// The descriptions have been given with silightly different bolt on text of desc 1 and 2. This is to illustrate where the text are different in your task updates, notes and map screen etc.

["TOUR_objFind", {"Kill HVT"}] call A2S_createSimpleTask;
["TOUR_objFind", {"Find and Kill the HVT located somewhere in <marker name=""TOUR_mkr_objFind""> these buildings</marker>"}, {"Kill HVT Desc 1"}, {"Kill HVT Desc 2"}] call A2S_setSimpleTaskDescription;
"TOUR_objFind" call A2S_taskCommit;

["TOUR_objTank", {"Destroy Tank"}] call A2S_createSimpleTask;
["TOUR_objTank", {"Destory the <marker name=""TOUR_mkr_objTank"">tank</marker> located on the hill"}, {"Destroy Tank Desc 1"}, {"Destroy Tank Desc 2"}] call A2S_setSimpleTaskDescription;
"TOUR_objTank" call A2S_taskCommit;

["TOUR_objTruck", {"Retreive Truck"}] call A2S_createSimpleTask;
["TOUR_objTruck", {"Retreive the stolen truck from the <marker name=""TOUR_mkr_objTruck"">FOB</marker>"}, {"Retreive Truck Desc 1"}, {"Retreive Truck Desc 2"}] call A2S_setSimpleTaskDescription;
"TOUR_objTruck" call A2S_taskCommit;

["TOUR_objRadio", {"Blow Up Radio Tower"}] call A2S_createSimpleTask;
["TOUR_objRadio", {"Destroy the <marker name=""TOUR_mkr_objRadio"">radio tower</marker> located on the hill"}, {"Blow Up Radio Tower Desc 1"}, {"Blow Up Radio Tower Desc 2"}] call A2S_setSimpleTaskDescription;
"TOUR_objRadio" call A2S_taskCommit;

["TOUR_objClear", {"Clear Area"}] call A2S_createSimpleTask;
["TOUR_objClear", {"Clear the <marker name=""TOUR_mkr_objClear"">area</marker> of enemies"}, {"Clear Area Desc 1"}, {"Clear Area Desc 2"}] call A2S_setSimpleTaskDescription;
"TOUR_objClear" call A2S_taskCommit;

//we need to assign a variable to handle and check the object for the radio tower
TOUR_radioTower = nearestObject [(getMarkerPos "TAG_mkr_objRadio"), "Land_TTowerBig_2_F"];

//place enemy target in random house 
["TOUR_mkr_objFind", 50, TOUR_HVT] call TOUR_fnc_moveInHouse;

//create random enemies within clear area marker - in this instance we need them to be created before we make the trigger below to detect them, otherwise it will detect no enemies present and update the task!
//Hense why we have made it here and not in the setupEnemy.sqf

_ep = 	[
			2,
			4,
			"TOUR_mkr_objClear",
			"UK3CB_TKM_O",
			EAST,
			[
				["infantry", "UK3CB_TKM_O_RIF_Sentry"],
				["infantry", "UK3CB_TKM_O_IED_Sentry"],
				["infantry", "UK3CB_TKM_O_AT_Sentry"],
				["infantry", "UK3CB_TKM_O_AR_Sentry"],
				["infantry", "UK3CB_TKM_O_MG_Sentry"],
				["infantry", "UK3CB_TKM_O_UGL_Sentry"]
			],
			120
		] call TOUR_fnc_areaPatrols;

// create trigger over the marker area to check the area is sufficiently clear of enemies - there must be 3 times as many friendlies as enemies in order to occupy the area.
// alternatively you can just have it 100% clear and use the other marker activation and statements commented out below
TOUR_sieze_trigger = createTrigger["EmptyDetector", getMarkerPos "TOUR_mkr_objClear"]; 
TOUR_sieze_trigger setTriggerArea[getMarkerSize "TOUR_mkr_objClear" select 0, getMarkerSize "TOUR_mkr_objClear" select 1, markerDir "TOUR_mkr_objClear", if (markerShape "TOUR_mkr_objClear" == "RECTANGLE") then {true}else{false}];
TOUR_sieze_trigger setTriggerActivation["ANY","PRESENT",false];
TOUR_sieze_trigger setTriggerStatements["(({(side _x == WEST)&&(_x in thislist)} count allunits)>(({(side _x == EAST)&&(_x in thislist)} count allunits)*3))", "['TOUR_objClear', 'SUCCEEDED'] call A2S_setTaskState;'TOUR_objClear' call A2S_taskCommit; 'TOUR_objClear' call A2S_taskHint;", ""];
//TOUR_sieze_trigger setTriggerActivation["EAST","NOT PRESENT",false];
//TOUR_sieze_trigger setTriggerStatements["true", "['TOUR_objClear', 'SUCCEEDED'] call A2S_setTaskState;'TOUR_objClear' call A2S_taskCommit; 'TOUR_objClear' call A2S_taskHint;", ""];

// the while loop below checks every 2 seconds that objectives are complete or not - providing all players are alive
// it gets the state of the task, and checks if it is not classed as succeeded. If the check does not return the string "SUECCEEDED", it then looks further...
// if the condition for success is made such as "is the HVT dead" (!alive TOUR_HVT) then it will update the task to succeeded and tell everyone to create a hint on their screen.
// The checks for the tasks conditions are checked against variables. These variable names such as TOUR_HVT or TOUR_tank, are set the editor. You can double click on the unit, and you will see where the variable name is defined.
// TOUR_RC_WEST_DEAD is a variable you can use from respawn control for any side TOUR_RC_EAST_DEAD etc. It does the hard work for you!
// Once this becomes true, it means everyone has no respawn tickets, and is either dead or incapacitated, therefore unable to complete the mission.
// if they are complete, then update the task status
// putting a sleep below, and waitUntil condition, ensures enough time for playableUnits to have synced and joined, so that TOUR_RC_WEST_DEAD will be false.
waitUntil {count (playableUnits + switchableUnits) > 0};
sleep 1;
while {!TOUR_RC_WEST_DEAD} do
{
	if (("TOUR_objFind" call A2S_getTaskState) != "SUCCEEDED") then 
	{
		if (!alive TOUR_HVT) then 
		{
			["TOUR_objFind", "SUCCEEDED"] call A2S_setTaskState;
			"TOUR_objFind" call A2S_taskCommit;
			sleep 2;
			"TOUR_objFind" call A2S_taskHint;			
		};
	};

	if (("TOUR_objTank" call A2S_getTaskState) != "SUCCEEDED") then 
	{
		if (damage TOUR_tank > 0.7) then 
		{
			["TOUR_objTank", "SUCCEEDED"] call A2S_setTaskState;
			"TOUR_objTank" call A2S_taskCommit;
			sleep 2;
			"TOUR_objTank" call A2S_taskHint;			
		};
	};

	if ((("TOUR_objTruck" call A2S_getTaskState) != "SUCCEEDED")&&(("TOUR_objTruck" call A2S_getTaskState) != "FAILED")) then 
	{
		if (TOUR_truck distance (getMarkerPos "TOUR_mkr_start") < 100) then 
		{
			["TOUR_objTruck", "SUCCEEDED"] call A2S_setTaskState;
			"TOUR_objTruck" call A2S_taskCommit;
			sleep 2;
			"TOUR_objTruck" call A2S_taskHint;			
		};

		if (!canMove TOUR_truck) then 
		{
			["TOUR_objTruck", "FAILED"] call A2S_setTaskState;
			"TOUR_objTruck" call A2S_taskCommit;
			sleep 2;
			"TOUR_objTruck" call A2S_taskHint;			
		};
	};

	if (("TOUR_objRadio" call A2S_getTaskState) != "SUCCEEDED") then 
	{
		if (damage TOUR_radioTower > 0.7) then 
		{
			["TOUR_objRadio", "SUCCEEDED"] call A2S_setTaskState;
			"TOUR_objRadio" call A2S_taskCommit;
			sleep 2;
			"TOUR_objRadio" call A2S_taskHint;			
		};
	};	

	sleep 2;
};

// if the loop above is exited, then everyone must be dead
//everyone dead, end the mission and update tasks
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
sleep 5;
"kia" remoteExecCall ["BIS_fnc_endMissionServer", 0, true];