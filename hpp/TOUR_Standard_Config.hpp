enableItemsDropping = 0;
disabledAI = 1;
allowProfileGlasses = 1;

// leave this code as is. Respawn control will set up all parameters for Arma 3 to work seemlessly with itself.
#include "scripts\TOUR_RC\dialog\hpp\config.hpp"

onLoadMissionTime = true;
overviewPicture = "";

// Vanilla Radio Channels
disableChannels[] = {
	{0, false, true}, // Disable Global voice chat
	{1, false, true}, // Disable Side voice chat
	{2, false, true}, // Disable Command voice chat
	{3, false, true}, // Disable Group voice chat
	{4, false, true}, // Disable Vehicle voice chat
	{5, false, true}  // Disable Direct voice chat
};

// Add own steam ID if required for debug during play purposes
enableDebugConsole[] = {};