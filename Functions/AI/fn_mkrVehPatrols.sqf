private ["_radius", "_rnd", "_roads", "_marker", "_types_array", "_class_type", "_group_type", "_type", "_number", "_rndpos", "_safepos", "_grp", "_pat_distance", "_initdone", "_guardpos", "_side"];

_safepos = [0,0,0];
_min = _this select 0;
_max = _this select 1;
_markers = _this select 2;
_roads = _this select 3;
_side = _this select 4;
_group_type = _this select 5;	
_radius = _this select 6;		

if (count _markers > _max) exitWith {hint "There are not enough marker positions for the max value"};
if (_min > _max) exitWith {hint "The minimum value should be less than the maximum value"};

_rnd = _min + (ceil (random (_max - _min)));

for "_i" from 1 to _rnd do
{
	_spawn = _markers call BIS_fnc_selectRandom;
	_markers = _markers - [_spawn];
	_type = _group_type call BIS_fnc_selectRandom;
	_veh = createVehicle [_type, getMarkerPos _spawn, [], 0, "CAN_COLLIDE"];
	_veh setPosATL getMarkerPos _spawn;
	_veh setVelocity [0,0,-1];
	_grp = createGroup _side;
	[_veh, _grp] call BIS_fnc_spawnCrew;
	waitUntil {(count units _grp > 0)};
	{
		//sort out accuracy and skill and loadouts if needed
		_x call Tour_fnc_garbageEH;
		_x call TOUR_fnc_loadouts;
	}forEach units _grp;
	[_grp, getMarkerPos _spawn, _radius, [],"TOUR_Null_Marker_Name",_roads]spawn TOUR_fnc_rndPatrol;
	sleep 2;
};