if (isDedicated) exitWith {};

_box = _this;

// Remove all items from the object
[_box, [_box] call BIS_fnc_getVirtualBackpackCargo] call BIS_fnc_removeVirtualBackpackCargo;
[_box, [_box] call BIS_fnc_getVirtualItemCargo] call BIS_fnc_removeVirtualItemCargo;
[_box, [_box] call BIS_fnc_getVirtualMagazineCargo] call BIS_fnc_removeVirtualMagazineCargo;
[_box, [_box] call BIS_fnc_getVirtualWeaponCargo] call BIS_fnc_removeVirtualWeaponCargo;

// Aquire items dependent on faction - class should be sorted within script
_fnc_items = compile PreprocessfileLineNumbers format ["scripts\Virtual_Arsenal\%1\%2.sqf", faction player, typeOf player];
_fnc_common = compile PreprocessfileLineNumbers format ["scripts\Virtual_Arsenal\%1\common.sqf", faction player];

_items = call _fnc_items;
_common = call _fnc_common;

[_box, (_items select 0) + (_common select 0),false, true] call BIS_fnc_addVirtualWeaponCargo;
[_box, (_items select 1) + (_common select 1),false, true] call BIS_fnc_addVirtualItemCargo;
[_box, (_items select 2) + (_common select 2),false, true] call BIS_fnc_addVirtualMagazineCargo;
[_box, (_items select 3) + (_common select 3),false, true] call BIS_fnc_addVirtualBackpackCargo;

["Preload", _box] spawn BIS_fnc_arsenal;

//remove the ability to use load, save and random arsenal buttons and clear player weapons

if (isNil "TOUR_VA_init") then
{
	TOUR_VA_init = true;

	execVM "scripts\virtual_arsenal\basicItems.sqf";

	[missionNamespace, "arsenalOpened", 
	{
		disableSerialization;
		params ["_display﻿"];
		_display displayAddEventHandler ["keydown", "_this select 3"];
		{(_display displayCtrl _x) ctrlShow false} forEach [44151, 44150, 44146, 44147, 44148, 44149, 44346];
	}] call BIS_fnc_addScriptedEventHandler;	

};