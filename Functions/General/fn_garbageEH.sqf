_this addEventHandler ["KILLED", {_this spawn TOUR_fnc_garbage;}];
if (side _this == CIVILIAN) then
{
	_this addEventHandler ["KILLED", 
	{
		params ["_unit", "_killer", "_instigator", "_useEffects"];
		if ((("TOUR_objCiv" call BIS_fnc_taskState) != "FAILED") && (side _instigator == WEST)) then 
		{
			["TOUR_objCiv", "FAILED", false] call BIS_fnc_tasksetState;
			[] spawn
			{
				sleep 4;
				["TOUR_objCiv", "FAILED", true] call BIS_fnc_tasksetState;
			};
		};
	}];
};
