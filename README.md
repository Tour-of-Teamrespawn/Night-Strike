# TOUR Mission Template

## Template components

### BRIEFING.HPP
Edit this for map screen briefing and mission information and is ran on player machines only (INITLOCALPLAYER.SQF)

### INIT.SQF
sets up functions and code ran on all machines

### INITSERVER.SQF
this should be where other scripts are called to set up the mission, such as objectives and enemy, so the server handles AI and mission control

### INITPLAYERLOCAL.SQF
this is where things for player only that are not needed to be ran on dedicated servers, such as effects, loadouts. intro etc.

### FUNCTIONS FOLDER
these are predefined functions. Do not edit unless you know what you are doing. You can add other functions to be called for your mission here by creating a 
function file "fn_functionName" and then adding it into the functions_init.sqf such as
TOUR_fnc_functionName = compile preProcessFileLineNumbers "scripts\functions\fn_functionName.sqf";

fn_Loadouts.sqf - Here the server default AI settings are managed for existing or spawned units when this function is called for a unit.
                    Add the unit classes here to define if they are special forces or snipers, which will tailor the values for accuracy etc to the role.

### AMBIENT LIFE
this is where scripts that can add friendly and enemy ambience to the area from walking and driving civilians. This is called from the INITSERVER.SQF. 
alter the information passed to it in the INITSERVER.SQF as per commented instruction.

### TOUR_SI FOLDER
this is where support interface resides. Do not alter.

### TOUR_RC FOLDER
this is where respawn control resides. Do not alter.

### VIRTUAL ARSENAL FOLDER
this is where you can setup aresenal loadouts specific to units. You can always edit unit loadouts for starting manually from the editor.
1. create a folder titled as the faction name. (you can get this info by playing as that faction and typing "copytoclipboard faction player" in the debug console when testing in single player)
2. create a file with the example structure shown, with the file name being the classname of the unit. (you can get this info by playing as that faction and typing "copytoclipboard typeof player" in the debug console when testing in single player)
3. edit the loadouts with classnames of items, magazines and weapons as appropriate. The scripts are called from the INITLOCALPLAYER.sqf.
4. You can alter basic items that are common to all units for starting.
5. Using the arsenal in this example, will remove all loadouts and add only basic items. You can disable this commenting out line 31 in basicItems.sqf within the virtual arsenal folder.

### GENERAL FOLDER
this contains misc scripts you want in your missions, such as basic intros, dust effects etc. Add to this as needed.

### ENDING missions
this is generally done through the SETUPOBJECTIVES.sqf which can detect players dead from the respawn control functions. You can change the conditions in here for that.
you can also make it (like in this example) to abort missions or report back in. In this example there is an action placed on the officer, that triggers code within endingAction.sqf and endingPlayer.sqf subsequently.
The text generate is linked to the description.ext.

### DESCRIPTION.ext
Lots of mission setup info is held in here, relating to speech, mission ending scenario's and dialogs. Go through and alter accordingly.
You will need to add pictures here for mission loading, and register any sounds used.

### A2S_multiTask
A helpful structure for making tasks in an MP environment. THough many improvements have been made for this by BIS, I personally still use it because I am used to it and it works really well.

### MISSION.SQM
Do not alter - this contains all the info from the editor when you press save.

### PARAMS.SQF
Information taken from the lobby settings and you can find further configuration for lobby game settings in the description.ext. 
This info is used to give to respawn control and time of day settings for example or anything else you can dream up needed for the mission.

### STRINGTABLE.CSV 
needed to define HQ for radio comms - archane throwback to OFP never developed further in engine. You will need to change this to east or resistance for different sides.

## General advice

### Variable Names and Tagging

As will become more apparant in the such scripts as setupObjectives.sqf lots of items within the game will use varibale names. These are handles / names we assign to objects so that we can
check and check values / states of them, and manipulate them. Variables can exist as local or global variables.

Local variable - these start with an underscore such as _myUnitVariable. These can only be used within the script, and not seen or used outside the script in which is defined / created in.

Global varibales - these do not start with an underscore such as myUnitVariable. These can be seen by every script and within the game, providing they have been defined before they are checked against.

As you can see from the example template mission, I have prefixed the variable with TOUR_ such as TOUR_HVT. Bohemia prefix their variables with BIS_. In otherwords, try to not use TOUR_ or BIS_. 
Otherwise if they or have a variable name the same, and you overwrite it by redefining it, it will break the game. This could be done for mods as well, i.e. don't use ACE_ to prefix your variable names.
There is a nice thing created at https://www.ofpec.com/ where you can register your prefix so that other mod or mission makers will not overwrite your variables (or less chance of it!).
You are welcome to use TOUR_ . however please note that this is used for private mods and bolt on scripts such as respawn control and support interface using the prefixes TOUR_RC_ and TOUR_SI_ etc.
Hopefully the naming convension should be clear and why should be careful or try to set up your own.

There is much more to learn and discover. I would suggest you bookmark the commands wiki page https://community.bistudio.com/wiki/Category:Arma_3:_Scripting_Commands 

This document does not go through the editor controls or settings. 

### Miscellaneous

Advice... missions don't have to be crazy, have 1000 objectives or unique mechanics to be great. Focus on simple clear objectives with a focus on location, and ambience for you first missions.
The setting and ambience will make or break the mission, more than interesting mechanics. Use the editor to look for good places for the type of engagements you want to create with the units you have chosen.
Set the weather, time of day, season, and effects to go with it. Place amient fire fighting modules in the editor. Make it feel alive or dead!

### Mission polish

Once created, make sure it is polished. Checklist:

Briefing - clear and concise, freee off speling errrrors (not like this readme) :)
Loadouts - appropiate for mission task, duration and number and type of enemy
Tasks and mechanics - documented and understandable - they may be to you, but not to people who havent made the mission!
Intro - almost all missions should have some kind of intro where appropriate, however simple - it sets the scene and stirs immersion to the task at hand
Setting - does the setting lend itself to the ambience of the mission. Is the weather, post processing effects contributing to the feeling correctly
Ending - can you abort if needed? Sometimes it is better to call it a day, rather than carry on whilst people wait bored. You dont have to fight to the death in all missions.
Ambience - can you add life to your mission, explosions, fire fights in the distance, civilian presence, friendly forces presence
Bugs - test test test test test - if it can happen, it will happen. Account for every eventuality. Someone will try something different at some point, which coulld break the mission!

Above all, make it the best it can be. Better to deliver something fantastic than a buggy unfinished mission! Take your time and ask for help if you need it :)

## Closing Notes

There are a million ways to script something, to make a mission. This template is by no means perfect. Some scripts have been thrown together quickly to deliver something helpful to you.
But it should illustrate the basics and give you a structure to work from. You are welcome to use this as a spring board and develope your own improved versions.
Just remember, it is not always about being clever. If a script is not needed to be supper efficient for resources etc, sometimes its best to be simple and easy to read.
Where possible comment as much as you can, to make it clear for other people learning and for you when you come back in 12 months time and wonder what you did!
These scripts provided will be updated and commented more in the coming weeks.

Tour has a great set of mission makers, and the Arma community itself is vast with plenty of info out there on the web. Ask for help, we all had lots of help getting started and the same will be repaid to you!
