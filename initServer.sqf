["<t size = '.5'>Preparing Global Vars.<br/>Please wait...</t>", 0, 0, 10, 0] remoteExec ["BIS_fnc_dynamicText", 0];

call BLWK_fnc_prepareGlobals;

[BLUFOR,BLWK_numRespawnTickets] call BIS_fnc_respawnTickets;

["<t size = '.5'>Preparing Play Area.<br/>Please wait...</t>", 0, 0, 10, 0] remoteExec ["BIS_fnc_dynamicText", 0];

// find a location for the mission, setup area, create bulwark
call BLWK_fnc_preparePlayArea;

setDate [2020, 7, 1, BLWK_timeOfDay, 0];

waitUntil {count (call CBAP_fnc_players) > 0};

null = [] spawn BLWK_fnc_arePlayersAliveLoop;

if (BLWK_buildingsNearBulwarkAreIndestructable) then {
	null = [] spawn BLWK_fnc_bulwarkBuildingsLoop;
};

call BLWK_fnc_spawnLoot;

// CIPHER COMMENT: Need to add countdown to wave start

call BLWK_fnc_startWave;





/*
// variable to prevent players rejoining during a wave
playersInWave = [];
publicVariable "playersInWave";
missionNamespace setVariable ["buildPhase", true, true];


["<t size = '.5'>Creating Base...</t>", 0, 0, 30, 0] remoteExec ["BIS_fnc_dynamicText", 0];
_basepoint = [] execVM "bulwark\createBase.sqf";
waitUntil { scriptDone _basepoint };

["<t size = '.5'>Ready</t>", 0, 0, 0.5, 0] remoteExec ["BIS_fnc_dynamicText", 0];

publicVariable "bulwarkBox";



//[] execVM "revivePlayers.sqf";
[bulwarkRoomPos] execVM "missionLoop.sqf";


[] execVM "hostiles\clearStuck.sqf";
//[] execVM "hostiles\solidObjects.sqf";
[] execVM "hostiles\moveHosToPlayer.sqf";
*/