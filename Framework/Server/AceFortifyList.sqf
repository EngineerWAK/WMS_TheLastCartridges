if (worldName == "Cam_Lao_Nam") then {
[INDEPENDENT, 1500, [
    ["rhs_pontoon_float",200], //test
    ["rhs_pontoon_static",200], //test
    ["rhs_pontoon_end_static",200], //test
    ["Land_Plank_01_4m_F", 20],
    ["Land_Plank_01_8m_F", 35],
    ["Land_BagFence_Short_F", 20],
    ["Land_BagFence_Long_F", 25],
    ["Land_BagFence_Round_F", 30],
    ["Land_BagFence_01_short_green_F", 20],
    ["Land_BagFence_01_long_green_F", 25],
    ["Land_BagFence_01_round_green_F", 30],
    ["Land_SandbagBarricade_01_half_F", 40],
    ["Land_SandbagBarricade_01_F", 50],
    ["Land_SandbagBarricade_01_hole_F", 60],
    ["Campfire_burning_F", 50],
    ["Land_vn_o_bunker_02",56],
    ["Land_vn_o_bunker_03",66],
    ["Land_vn_o_platform_06",46],
    ["Land_vn_o_tower_02",56],
    ["Land_vn_o_shelter_06",36],
    ["Land_vn_o_shelter_01",46],
    ["Land_vn_b_foxhole_01",66],
    ["Land_vn_b_mortarpit_01",56],
    ["Land_vn_b_tower_01",86],
    ["Land_vn_b_trench_bunker_05_01",46]
    ]
] call ace_fortify_fnc_registerObjects;
}else {
[INDEPENDENT, 1500, [
    ["rhs_pontoon_float",200], //test
    ["rhs_pontoon_static",200], //test
    ["rhs_pontoon_end_static",200], //test
    ["Land_Plank_01_4m_F", 20],
    ["Land_Plank_01_8m_F", 35],
    ["Land_BagFence_Short_F", 20],
    ["Land_BagFence_Long_F", 25],
    ["Land_BagFence_Round_F", 30],
    ["Land_BagFence_01_short_green_F", 20],
    ["Land_BagFence_01_long_green_F", 25],
    ["Land_BagFence_01_round_green_F", 30],
    ["Land_SandbagBarricade_01_half_F", 40],
    ["Land_SandbagBarricade_01_F", 50],
    ["Land_SandbagBarricade_01_hole_F", 60],
    ["Campfire_burning_F", 50]
    ]
] call ace_fortify_fnc_registerObjects;
};