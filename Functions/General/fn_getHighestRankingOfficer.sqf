/*
    Gets the highest ranking unit out of input array.
    Inputs
        0 (_units) - ARRAY of type objNull (unit)

    Returns
        typeName objNull

    Usage:
        _rankingOffier = allPlayers call A455_fnc_getHighestRankingOfficer;

    Notes:
        Shamelessly stolen from A3 forums.
*/

private ["_units", "_candidate"];
_units = _this;
_candidate = objNull;

{
    if (isNull _candidate) then {
        _candidate = _x;
    } else {
        if(((rankId _x) >= (rankId _candidate))) then {
            _candidate = _x;
        };
    };
} forEach _units;

_candidate