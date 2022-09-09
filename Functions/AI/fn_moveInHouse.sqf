/*
	BOSS HOUSE SCRIPT
	by Mr.Ben
	
	params passed to script through an array:
	0 = marker name, string
	1 = distance, integer in meters
	2 = object, object name

*/

private ["_centrepos", "_marker", "_array_type", "_skill", "_side", "_pos", "_test", "_buildings", "_building", "_grp", "_unit", "_distance", "_type", "_count", "_min", "_max"];

_marker = _this select 0;
_distance = _this select 1;
_unit = _this select 2;

_pos = [0,0,0];
_test = 0;
_buildingsnew = [];
_posarray = [];
_warLordPosArray = [];

_positions = [];
_buildings = [];

_buildings = (nearestObjects [getMarkerPos _marker,["Building","House"], _distance]);

if ((count _buildings) == 0) exitWith
{
	_pos
};

if (count _buildings == 0) exitWith
{
	_pos
};

{
	_building = _buildings select _forEachIndex;
	_test = 0;
	while {_test < 50} do 
	{
		if (format ["%1", _building buildingPos _test] != "[0,0,0]") then 
		{
			if (({_x isKindOf "House"}count (lineIntersectsObjs [[(AGLtoASL (_building buildingPos _test)) select 0, (AGLtoASL (_building buildingPos _test)) select 1, ((AGLtoASL (_building buildingPos _test)) select 2) + 0.5], [(AGLtoASL (_building buildingPos _test)) select 0, (AGLtoASL (_building buildingPos _test)) select 1, (AGLtoASL (_building buildingPos _test) select 2) + 10], objnull, objnull, true, 32])) > 0) then 
			{
				_warLordPosArray set [count _warLordPosArray, [_building, _building buildingPos _test]];
			}; 
			_posarray set [count _posarray, [_building, _building buildingPos _test]];
		};
		_test = _test + 1
	};
	
}forEach _buildings;

if (count _posarray == 0) exitWith {hint "not enough positions"};

_wlPosArray = (_warLordPosArray call BIS_fnc_selectRandom);

_unit setPos (_wlPosArray select 1);

