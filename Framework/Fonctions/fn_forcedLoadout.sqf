_unit = player; 
 
removeAllWeapons _unit; 
removeAllItems _unit; 
removeAllAssignedItems _unit; 
removeUniform _unit; 
removeVest _unit; 
removeBackpack _unit; 
removeHeadgear _unit; 
removeGoggles _unit; 
 
_unit forceAddUniform "Project_Honor_Camo_Cyre"; 
_unit addVest "Project_Honor_Vest_1"; 
_unit addBackpackGlobal "vn_b_pack_05"; 
 
_unit addWeaponGlobal ["rhs_weap_hk416d145_wd_2",1];  
_unit addWeaponGlobal ["rhs_weap_m72a7",1];  
_unit addWeaponGlobal ["vn_m_bayo_m16",1];  
_unit addWeaponGlobal ["rhsusf_bino_lerca_1200_tan",1]; 
 
_unit linkItem "vn_b_item_map"; 
_unit linkItem "vn_b_item_compass_sog"; 
_unit linkItem "ACE_Altimeter"; 
_unit linkItem "rhs_radio_R187P1"; 
_unit linkItem "ItemGPS"; 
_unit linkItem "ACE_NVG_Wide_Green"; 
  
_unit addHeadgear "Project_Honor_Helmet2"; 
_unit addGoggles "vn_b_acc_m17_02"; 
_unit addPrimaryWeaponItem "rhsusf_acc_wmx_bk"; 
_unit addPrimaryWeaponItem "rhsusf_acc_ACOG_wd"; 
_unit addPrimaryWeaponItem "rhs_mag_30Rnd_556x45_Mk318_Stanag_Ranger"; 
_unit addPrimaryWeaponItem "rhs_acc_harris_swivel";

_unit addItem "ACE_Banana"; 
_unit addItem "ACE_Canteen"; 
_unit addItem "ACE_Fortify";  
_unit addItem "ACE_personalAidKit"; 
_unit addItem "ACE_RangeCard"; 
_unit addItem "ACE_MRE_BeefStew"; 
_unit addItem "ACE_bloodIV"; 
_unit addItem "ACE_Can_Franta"; 
_unit addItem "ACE_DefusalKit"; 
_unit addItem "ACE_Clacker"; 
_unit addItem "ToolKit"; 
_unit addItem "ACE_bloodIV"; 
_unit addItem "ACE_Canteen"; 
_unit addItem "ACE_EarPlugs"; 
_unit addItem "rhsusf_m112_mag";
for "_i" from 1 to 6 do {_unit addItem "ACE_splint";}; 
for "_i" from 1 to 4 do {_unit addItem "ACE_tourniquet";}; 
for "_i" from 1 to 9 do {_unit addItem "rhs_mag_30Rnd_556x45_Mk318_Stanag_Ranger";}; 
for "_i" from 1 to 5 do {_unit addItem "vn_m67_grenade_mag";}; 
for "_i" from 1 to 5 do {_unit addItem "ACE_quikclot";}; 
for "_i" from 1 to 15 do {_unit addItem "ACE_fieldDressing";}; 
for "_i" from 1 to 5 do {_unit addItem "ACE_morphine";};
for "_i" from 1 to 3 do {_unit addItem "ACE_epinephrine";}; 
for "_i" from 1 to 2 do {_unit addItem "ACE_bloodIV_250";}; 
for "_i" from 1 to 2 do {_unit addItem "ACE_bloodIV_500";}; 
for "_i" from 1 to 5 do {_unit addItem "ACE_Banana";};  
for "_i" from 1 to 2 do {_unit addItem "ACE_CableTie";}; 