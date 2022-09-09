_player = _this select 1;
_officer = _this select 0;
_action = (_this select 2);
TOUR_logic setVariable ["TOUR_task_reportIn", true, true];
[[_player, _officer, _action],"scripts\control\endingPlayer.sqf"] remoteExec ["execVM", 0, false];