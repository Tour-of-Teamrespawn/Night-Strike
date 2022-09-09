private ["_faction", "_marker", "_types_array", "_class_type", "_group_type", "_number", "_rndpos", "_safepos", "_grp", "_pat_distance", "_initdone"];

_min = _this select 0;
_max = _this select 1;
_marker = _this select 2;
_faction = _this select 3;
_side = _this select 4;
_group_type = _this select 5;	
_radius = _this select 6;	

private ["_checkdistance", "_rnd", "_listsafe", "_blacklist", "_possiblepos", "_found", "_listsafeinf", "_markerDB"];

_checkdistance = selectMax (getmarkerSize _marker);
_rnd = _min + (ceil (random (_max - _min)));

_listsafeinf = [];

while {count _listsafeinf < _rnd} do
{
	{
		_p = [(_x select 0) select 0,(_x select 0) select 1, 0];
		if (_p inArea _marker) then
		{
			_listsafeinf set [count _listsafeinf, [(_x select 0) select 0,(_x select 0) select 1, 0 ]];
		};
	}forEach (selectBestPlaces [(getMarkerPos _marker), _checkdistance,"(1 - houses) * (1 - sea)", 10, 1]);
};
/*
{
	_markerDB = createMarkerLocal [(format ["TDMC_positionsSelectorMarker_%1", (_foreachindex + 1)]), _x];
	_markerDB setMarkertype "hd_dot";
	_markerDB setmarkercolor "colorred";
}forEach _listsafeinf;
*/
for "_i" from 1 to _rnd do
{
	_pos = _listsafeinf call BIS_fnc_selectRandom;
	_listsafeinf = _listsafeinf - [_pos];
	_type = _group_type call BIS_fnc_selectRandom;
	_grp = [_pos, _side, (configFile >> "CfgGroups" >> str _side >> _faction >> (_type select 0) >> (_type select 1))] call BIS_fnc_spawnGroup;
	waitUntil {(count units _grp > 0)};
	{
		//sort out accuracy and skill and loadouts if needed
		_x call Tour_fnc_garbageEH;
		_x call TOUR_fnc_loadouts;
	}forEach units _grp;
	[_grp, _pos, 120]spawn TOUR_fnc_rndpatrol;
};