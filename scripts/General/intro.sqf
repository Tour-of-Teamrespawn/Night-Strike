if (!isdedicated) then
{
	// if the mission has been running for 5 seconds, do not run the intro and just make the player stand.
	if (time > 5) exitWith
	{
		sleep 1;
		player playAction "stand";
	};
	
	//fade to black straight away and make it say LOADING INTRO, to allow the game to load and render all images. Kill all sound whilst it loads
	cutText ["Loading Intro","BLACK FADED", 0];
	0 fadeSound 0;
	waituntil {player == player};
	sleep 1;
	//define map positions for camera [x,y,z]
	_pos1  = [getMarkerPos "TOUR_mkr_introStart" select 0, getMarkerPos "TOUR_mkr_introStart" select 1, 50];
	_pos2  = [1833.33,5583.32,0];
	_pos3  = [(player getPos [20, (getDir player) + 180]) select 0, (player getPos [20, (getDir player) + 180]) select 1, 15];
	_pos4 = [getpos player select 0, getpos player select 1, ((getpos player select 2) + 1.85)];
	// play intro music
	playSound "TOUR_introMusic";
	// create camera and set first position and where it is looking.
	_cam1 = "camera" camCreate _pos1;
	_cam1 camprepareTarget _pos2; 
	_cam1 camCommitprepared 0;
	_cam1 cameraEffect ["internal", "back"];
	// set blur instantly
	"dynamicBlur" ppEffectEnable true;
	"dynamicBlur" ppEffectAdjust [5];
	"dynamicBlur" ppEffectCommit 0;
	sleep 1;
	cutText ["","BLACK FADED", 0];		
	sleep 1;	
	doStop player;
	//fade in from black over 5 seconds, this command continues running in parallel, hense the 6 second sleep 4 lines further on.
	cutText [" ","BLACK IN", 5];
	// make the blur turn off over 8 seconds
	"dynamicBlur" ppEffectAdjust [0];
	"dynamicBlur" ppEffectCommit 8;
	5 fadeSound 1;
	sleep 6;
	//spawn code for text typing type writer effect
	[]spawn 
	{
		sleep 5;
		_text = ["S","t","r","a","t","i","s","\n","A","i","r","b","a","s","e"];
		_display = "";
		_pointer = 0;
		_sleepTime = 0.1;
		while {_pointer < count _text} do
		{
			_sleepTime = 0.1 + (random 0.05);
			_display = _display + (_text select _pointer);
			titleText [_display,"PLAIN down",_sleepTime];
			_pointer = _pointer + 1;
			if (_pointer == count _text) then
			{
				cutText [_display,"PLAIN down",1];
			}
			else
			{
				playSound "TOUR_key_noise";
			};
			sleep _sleepTime;
		};		

	};
	// wait 4 seconds for the typing to complete.
	sleep 10;
	//fade to black
	cutText [" ","BLACK OUT", 2];
	sleep 3;
	// set the camera at position 3 looking at the player.
	_cam1 camSetPos _pos3;
	_cam1 camCommit 0;
	_cam1 camprepareTarget player; 
	_cam1 camCommitprepared 0;
	"dynamicBlur" ppEffectAdjust [5];
	"dynamicBlur" ppEffectCommit 0;
	sleep 2;
	//fade in with blur set again
	"dynamicBlur" ppEffectAdjust [0];
	"dynamicBlur" ppEffectCommit 3;
	sleep 0.1;
	cutText ["", "BLACK IN", 2];
	sleep 5; 
	// more text type to run in parallel
	[]spawn 
	{
		_text = ["U","S"," ","A","r","m","e","d"," ","F","o","r","c","e","s"];
		_display = "";
		_pointer = 0;
		_sleepTime = 0.1;
		while {_pointer < count _text} do
		{
			_sleepTime = 0.1 + (random 0.05);
			_display = _display + (_text select _pointer);
			titleText [_display,"PLAIN down",_sleepTime];
			_pointer = _pointer + 1;
			if (_pointer == count _text) then
			{
				cutText [_display,"PLAIN down",1];
			}
			else
			{
				playSound "TOUR_key_noise";
			};
			sleep _sleepTime;
		};		
	};	
	sleep 3;
	//move camera into the players head over 10 seconds as if you are going to be that person ingame.
	_cam1 camSetPos _pos4;
	_cam1 camCommit 10;	
	sleep 7.5;
	// fade out just before you enter head and blur out too.
	cutText [" ","BLACK OUT", 2];
	sleep 1;
	"dynamicBlur" ppEffectAdjust [3];
	"dynamicBlur" ppEffectCommit 1;
	sleep 5;
	// kill camera - returning camera into the players eyes, and fade in with unblurring.
	_cam1 cameraEffect ["TERMINATE", "back"];
	"dynamicBlur" ppEffectAdjust [0];
	"dynamicBlur" ppEffectCommit 3;
	cutText [" ","BLACK IN", 4];
	sleep 7;
	//destroy camera object
	camdestroy _cam1;

	// give fancy text
	_date = date;
	_year = _date select 0;
	_month = _date select 1;
	_day = _date select 2;
	_hour = _date select 3;
	_min = _date select 4;
	_text_date = [];

	if (_min < 10) then 
	{ 
		_text_date = format ["%1-%2-%3  %4h0%5m", _month, _day, _year, _hour, _min]; 
	} 
	else 
	{  
		if (_min == 60) then
		{
			_hour = _hour + 1;
			_min = 0;
			_text_date = format ["%1-%2-%3  %4h0%5m", _month, _day, _year, _hour, _min];
		}
		else
		{
			_text_date = format ["%1-%2-%3  %4h%5m", _month, _day, _year, _hour, _min]; 
		};
	};
	_text_1 = "Specops Team";
	_text_2 = "Operation Blue Knight";
	sleep 2;
	[_text_1, _text_date, _text_2] spawn TOUR_fnc_infoText;	
	
	//when the player moves out, give nice text to remind of the mission, like a film intro
	waitUntil {getmarkerPos "TOUR_mkr_Start" distance vehicle player > 300};
	private _text = "<t font='PuristaBold' size='1.6'>09 [Tour] Test Mission</t><br />by Authors Name";
	[parseText _text, true, nil, 7, 0.7, 0] spawn BIS_fnc_textTiles;
};