private ["_emitters"];

_emitters = [vehicle player,-1,0.8,true] call BIS_fnc_sandStorm;

while {alive player} do
{
	waitUntil 
	{	
		!(alive player)
		or
		(vehicle player != player)
		or
		({(_x isKindof "House")} count ((lineIntersectsObjs [eyepos player, [eyepos player select 0, eyepos player select 1, (eyepos player select 2) + 5], objnull, vehicle player, true, 32])) > 0)
	};
	{ deleteVehicle _x}forEach _emitters;
	waitUntil 
	{
		!(alive player)
		or
		(
			(vehicle player == player)
			&&
			({(_x isKindof "House")} count ((lineIntersectsObjs [eyepos player, [eyepos player select 0, eyepos player select 1, (eyepos player select 2) + 5], objnull, vehicle player, true, 32])) == 0)
		)
	};
	_emitters = [vehicle player,-1,0.8,true] call BIS_fnc_sandStorm;
};

{ deleteVehicle _x}forEach _emitters;