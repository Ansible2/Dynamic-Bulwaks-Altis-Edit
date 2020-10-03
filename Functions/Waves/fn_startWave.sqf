if (!isServer OR {!canSuspend}) exitWith {};

// update wave number
private _previousWaveNum = missionNamespace getVariable ["BLWK_currentWaveNumber",0];
missionNamespace setVariable ["BLWK_currentWaveNumber", _previousWaveNum + 1,true];

call BLWK_fnc_decideWaveType;

// loot is spawned before the wave starts at round 1
if (BLWK_currentWaveNumber > 1) then {
	// this will also clean up previous loot
	call BLWK_fnc_spawnLoot;
};

call BLWK_fnc_cleanUpTheDead;

// loop to check wave end
waitUntil {
	if (call BLWK_fnc_isWaveCleared) exitWith {
		call BLWK_fnc_endWave;
		true
	};

	sleep 3;
	false
};