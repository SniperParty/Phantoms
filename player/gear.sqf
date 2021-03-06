#include "..\logic\activeMods.sqf"

if (side player == east) then {
	//add explosives equal to half the defenders to the infiltrators
	_bomb_amount = ( (playersNumber west / 2) / playersNumber east );
	if (player == leader group player) then {
		_bomb_amount = ceil _bomb_amount;
	} else {
		_bomb_amount = floor _bomb_amount + 1;
	};

	for "_i" from 1 to _bomb_amount do { player addItemToBackpack "DemoCharge_Remote_Mag";};
	
	//ACE detonator
	if ("ace_" call caran_checkMod) then {
		player addItemToUniform "";
	};
};

//Medical gear
if ( "ace_" call caran_checkMod ) then {
	{
		for "_i" from 1 to 4 do {
			player addItemToUniform _x;
		};
	} forEach ["ACE_morphine", "ACE_epinephrine"];
	{
		for "_i" from 1 to 8 do {
			player addItemToUniform _x;
		};
	} forEach ["ACE_elasticBandage", "ACE_packingBandage"];
} else {
	for "_i" from 1 to 2 do {
		player addItemToUniform "FirstAidKit";
	};
};

//Medic gear for medics
if (toUpper typeOf player == "B_G_MEDIC_F") then {
	if ( "ace_" call caran_checkMod ) then {
		player addItemToBackpack "ACE_personalAidKit";
		for "_i" from 1 to 2 do { player addItemToBackpack "ACE_bloodIV"; };
		for "_i" from 1 to 4 do { player addItemToBackpack "ACE_BloodIV_500"; };
		for "_i" from 1 to 5 do { player addItemToBackpack "ACE_tourniquet"; };
		{ for "_i" from 1 to 10 do { player addItemToBackpack _x; }; } forEach ["ACE_morphine", "ACE_epinephrine", "ACE_atropine"];
		{ for "_i" from 1 to 25 do { player addItemToBackpack _x; }; } forEach ["ACE_packingBandage", "ACE_elasticBandage"];
	} else {
		player addItemToBackpack "Medikit";
		for "_i" from 1 to 10 do { player addItemToBackpack "FirstAidKit"; };
	};
};

//Radio
