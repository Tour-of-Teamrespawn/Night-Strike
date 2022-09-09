if (!isServer) exitwith {};

private ["_spawnCount", "_arraymidpos", "_type_array","_type_array2","_side","_faction","_chance","_vehicle_spawn","_vehicle_end","_grp","_wp1","_detinationreached","_veh","_time", "_new", "_area", "_side", "_enemySide", "_civs"];

_type_array = _this select 0;
_enemy_array = _this select 1;
_chance = _this select 2;
_side = _this select 3;
_enemySide = _this select 4;
_civs = _this select 5;

_spawnCount = 1;
while {true} do 
{
	if (str(getMarkerPos format ["TOUR_mkr_carSpawn_%1", _spawnCount]) == "[0,0,0]") exitWith {}; 
	_spawnCount = _spawnCount + 1;
};

while {true} do
{
	if ((_chance > 0)&&((floor (random 101)) <= _chance)) then
	{
		_positions = [];
		for "_i" from 1 to _spawnCount do
		{
			_positions set [count _positions, getMarkerPos (format ["TOUR_mkrCarSpawn_%1", _i])];
		};
		_vehicle_spawn = _positions call BIS_fnc_selectRandom;
		_positions = _positions - [_vehicle_spawn];
		_vehicle_end = _positions call BIS_fnc_selectRandom;			

		waitUntil {count (nearestObjects [_vehicle_spawn, ["LandVehicle"], 10]) == 0};

		_veh = createVehicle [_enemy_array call BIS_fnc_selectRandom, _vehicle_spawn, [], 0, "CAN_COLLIDE"];
		_veh setDir ([_vehicle_spawn, _vehicle_end] call BIS_fnc_dirTo);
		_veh setPosATL _vehicle_spawn;
		_veh setVelocity [0,0,-1];

		_grp = createGroup _enemySide;
		[_veh, _grp] call BIS_fnc_spawnCrew;
		{
			_x call Tour_fnc_garbageEH;
			_x call TOUR_fnc_loadouts;
		}forEach units _grp;
		_wp1 = _grp addWaypoint [_vehicle_end, 0];
		_wp1 setWaypointSpeed "NORMAL";
		_wp1 setWaypointCombatMode "RED";
		_time = time + 100;
		_detinationreached = false;
		while {(({alive _x} count units _grp) > 0)} do 
		{
			if ( ({((_vehicle_end distance (vehicle _x)) <= 30)&&(alive _x)} count units _grp) == ({alive _x} count units _grp) ) exitwith {_detinationreached = true;};
			if ((({((_vehicle_spawn distance (vehicle _x)) < 50)&&(alive _x)} count units _grp) == ({alive _x} count units _grp)) && (_time < time) ) exitWith {_detinationreached = true;};	
			if (!canMove _veh) exitWith {};				
			sleep 2;
		};
		_time = time + 300;
		while {!_detinationreached} do
		{
			if ((({(side _x == _side)} count nearestObjects [_veh, ["landvehicle", "man"], 500]) == 0)or(_time < time)) exitWith {};
			sleep 2;
		};
		if (!isNull _veh) then 
		{
			deleteVehicle _veh;
		};
		if (!isNull _grp) then
		{
			{
				deleteVehicle _x;
			}foreach units _grp;
			deleteGroup _grp;
		};
	}else
	{
		_positions = [];
		for "_i" from 1 to _spawnCount do
		{
			_positions set [count _positions, getMarkerPos (format ["TOUR_mkr_CarSpawn_%1", _i])];
		};
		_vehicle_spawn = _positions call BIS_fnc_selectRandom;
		_positions = _positions - [_vehicle_spawn];
		_vehicle_end = _positions call BIS_fnc_selectRandom;			

		waitUntil {count (nearestObjects [_vehicle_spawn, ["LandVehicle"], 10]) == 0};
		
		_veh = createVehicle [_type_array call BIS_fnc_selectRandom, _vehicle_spawn, [], 0, "CAN_COLLIDE"];
		_veh setDir ([_vehicle_spawn, _vehicle_end] call BIS_fnc_dirTo);
		_veh setPosATL _vehicle_spawn;
		_veh setVelocity [0,0,-1];

		_grp = createGroup CIVILIAN;
		_man = _grp createUnit [(_civs call BIS_fnc_selectRandom), _vehicle_spawn, [], 0, "NONE"];
		_man assignAsDriver _veh;
		_man moveInDriver _veh;
		
		{
			_x call Tour_fnc_garbageEH;
			_x call TOUR_fnc_loadouts;
			_x setVariable ["BIS_noCoreConversations",true];
		}forEach units _grp;
		
		_wp1 = _grp addWaypoint [_vehicle_end, 0];
		_wp1 setWaypointSpeed "NORMAL";
		
		_detinationreached = false;
		_time = time + 100;
		while {(({alive _x} count units _grp) > 0)} do 
		{
			if ( ({((_vehicle_end distance (vehicle _x)) <= 30)&&(alive _x)} count units _grp) == ({alive _x} count units _grp) ) exitwith {_detinationreached = true;};
			if ((({((_vehicle_spawn distance (vehicle _x)) < 50)&&(alive _x)} count units _grp) == ({alive _x} count units _grp)) && (_time < time) ) exitWith {_detinationreached = true;};
			if (!canMove _veh) exitWith {};
			sleep 2;
		};
		_time = time + 300;
		while {!_detinationreached} do
		{
			if ((({(side _x == _side)} count nearestObjects [_veh, ["landvehicle", "man"], 500]) == 0)or(_time < time)) exitWith {};
			sleep 2;
		};
		if (!isNull _veh) then 
		{
			deleteVehicle _veh;
		};
		if (!isNull _grp) then
		{
			{
				deleteVehicle _x;
			}foreach units _grp;
			deleteGroup _grp;
		};

	};
	
	sleep random 200;
};
