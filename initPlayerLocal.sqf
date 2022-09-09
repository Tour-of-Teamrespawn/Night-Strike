// All code in here is ran for players only.
// It is ran AFTER the init.sqf and initServer.sqf

waitUntil {!isNil "TOUR_init_completed"};

// Runs the virtual arsenal for the player = check the virtual arsenal scripts for basic items you can add to players.
TOUR_ammobox execVM "scripts\Virtual_arsenal\init.sqf";

// Forces the player to start with weapon lowered
player playaction "stand";

// Causes dust to blow randomly across the ground
execVM "scripts\general\dust.sqf";

// Add some colour to your mission to set ambience using the colour correction code below. https://community.bistudio.com/wiki/ppEffectAdjust
TOUR_mission_color = ppEffectCreate ["Colorcorrections", 1200];  
TOUR_mission_color ppEffectAdjust [1, 0.8, -0.001, [0.0, 0.0, 0.0, 0.0], [0.9, 0.9, 0.6, 0.65], [0.8, 0.8, 0.6, 0.4]];  
TOUR_mission_color ppEffectCommit 0;  
TOUR_mission_color ppEffectEnable true; 

// Adds an action to an officer to allow you to report in or end the mission.
TOUR_officer addAction ["Report In", "scripts\control\endingAction.sqf", 0, 10, true, false, "", "(isNil {TOUR_logic getVariable 'TOUR_task_reportIn'}) && (player==leader group player) && ({(alive _x)&&((vehicle _x) distance (getMarkerPos ""TOUR_mkr_Start"") > 250)}count (playableUnits + switchableUnits) == 0) && (cursorTarget == _target) && (player distance _target < 2)"];

// Runs the briefing script to populate information when in the map screen.
#include "hpp\briefing.hpp";

// Run an intro from here - see the example for basic commands and intro
_int = execVM "scripts\general\intro.sqf";

waitUntil {scriptDone _int};
["hint", "The mission is setup and ready! You can delete this hint from the initLocalPlayer.sqf!", "MISSION CREATOR"] call TOUR_fnc_hint;