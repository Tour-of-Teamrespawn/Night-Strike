TOUR_garbagearray = [];
TOUR_mission_groups = [];
TOUR_mission_units = [];
private ["_arrayold", "_array", "_unit", "_time", "_grp"];

while {true} do
{
	if (count TOUR_garbagearray > 0) then
	{
		{
			_array = _x;
			_unit = (_array select 0);
			_time = (_array select 1);
			
			if (count _array == 3) then
			{
				_grp = _array select 2;
				if ((!isNull _grp)&&(({alive _x}count units _grp) == 0)) then
				{
					deleteGroup _grp;
				};
			};

			if (!isNull _unit) then
			{
				if (_unit isKindOf "man") then
				{
					if (((_time + 900) < time)or(count TOUR_garbagearray > 50)) then
					{
						hideBody _unit;
						sleep 5;
						deleteVehicle _unit;
					};
				}else
				{
					if (((_time + 1800 < time)or(count TOUR_garbagearray > 50))&&({_x distance _unit < 500} count (playableunits + switchableUnits) == 0)) then
					{
						deleteVehicle _unit;
					};
				};
			};
		}forEach TOUR_garbagearray;
		
		_arrayold = TOUR_garbagearray;
		TOUR_garbagearray = [];
		{
			if (!isNull (_x select 0)) then
			{
				TOUR_garbagearray set [count TOUR_garbagearray, _x];
			};
		}forEach _arrayold;
			
	};
	sleep 1;
};