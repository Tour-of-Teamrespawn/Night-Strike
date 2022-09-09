player createDiarySubject ["About", "About"];

player createDiaryRecord 
["Diary", ["About", 
	"
		Tour of Teamrespawn
		<br />
		<br />
		Mission Design: AUTHOR NAME and YEAR 
		<br />
		<br />
		Thanks to all Tour members for testing and feedback.
		<br />
	"
]];

// give information about the actual mission itself, such as any unique mechanisms to the missions, and how to abort and complete the mission.
player createDiaryRecord 
["Diary", ["Mission", 
	"
		You can access the support menu using a PRC148, available to group leaders only.
		<br />
		<br />
		The mission can be ended at any point by returning and reporting in the the <marker name=""TOUR_mkr_HQ"">officer</marker>, whether the objectives are completed or not.
		<br />
		<br />
		Ensure the truck is not damaged! If it is unable to be driven, the objective cannot be complete.
	"
]];

// give any information about assets here, do you have vehicles, which ones are available, how many, support systems such as medical facilities, artillery etc.
player createDiaryRecord 
["Diary", ["Assets", 
	"
		<font size='20' align='center' color='#0080ff'>Vehicles</font>
		<br />
		<br />
		 3 Humvees have been assigned for personal transport in additional to air support.
		<br />
		<br />
		<font size='20' align='center' color='#0080ff'>Weapons</font>
		<br />
		<br />
		 A full completement of wepaons can be accessed at the <marker name=""TOUR_mkr_ammo"">weapons crates</marker>.
	"
]];

// Add information for settings required for radio channels
player createDiaryRecord 
["Diary", ["Radio Channels", 
	"
		<font size='20' align='center' color='#0080ff'>Default Radio Channels</font>
		<br />
		<br />	
		<font size='16' color='#ffa500'>Lead:</font> PRC343 - Channel 3
		<br />
		<br />	
		<font size='16' color='#ffa500'>Alpha:</font> PRC343 - Channel 1
		<br />
		<br />
		<font size='16' color='#ffa500'>Bravo:</font> PRC343 - Channel 2
		<br />
		<br />
		Long range intersquad communications PRC148 set to channel 1
	"
]];

// give all callsign details of groups, including AI support units if used
player createDiaryRecord 
["Diary", ["Callsigns", 
	"
		<font size='20' align='center' color='#0080ff'>Special Forces</font>
		<br />
		<br />	
		<font size='16' color='#ffa500'>Lead:</font> Mission Lead
		<br />
		<br />	
		<font size='16' color='#ffa500'>Alpha:</font> Delta Team
		<br />
		<br />
		<font size='16' color='#ffa500'>Bravo:</font> Delta Team
		<br />
		<br />	
		<font size='20' align='center' color='#0080ff'>Support</font>
		<br />
		<br />	
		<font size='16' color='#ffa500'>Thunder One:</font> Artillery
		<br />
		<br />	
		<font size='16' color='#ffa500'>Dusty One:</font> LitteBird
		<br />
		<br />	
		<font size='16' color='#ffa500'>Dusty Two:</font> Ghosthawk
		<br />
		<br />	
		<font size='16' color='#ffa500'>Dusty Three:</font> Apache
	"
]];

// sumarries the mission details, for background info for immersion, any intel on enemy etc. Keep it to the point and spaced out, nobody likes a wall of text!!!
player createDiaryRecord 
["Diary", ["Briefing", 
	"
		<font size='20' align='center' color='#0080ff'>Overview</font>
		<br />
		<br />
		 As the war for Stratis rages on, high command has identified some strategic objectives that could tip the balance of the war.
		<br />
		<br />
		 On your map there are 4 key areas and small objectives to accomplish in order to complete the mission.
		<br />
		<br />
		<br />
		<font size='20' align='center' color='#0080ff'>Intel</font>
		<br />
		<br />
		 Expect enemy infantry patrols and the possibility of technicals. The enemy is not well equiped but expect heavy resistance and fighting, particulary in the <marker name=""TOUR_mkr_patrol_2"">town</marker>.
		<br />
		<br />
		 Local informants have sightings of the HVT confirmed in the town around <marker name=""TOUR_mkr_objFind"">these buildings</marker>.
		<br />
		<br />
		<font size='20' align='center' color='#0080ff'>Support</font>
		<br />
		<br />
		 Command has issued full logistical and tactical support for this mission. You have an array of chopper and artillery support to call in, using the support menu.
		<br />
	"
]];