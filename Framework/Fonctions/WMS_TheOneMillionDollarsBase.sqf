//TheOneMillionDollarsBase

//////////////////////////////////////////////////////////////////
// [_flag, _posFlag, _dirFlag, _layout] execVM "Fonctions\WMS_TheOneMillionDollarsBase.sqf";
//////////////////////////////////////////////////////////////////
private ["_statics","_owner","_walls","_NoWalls","_objList","_objects","_bunkercamp","_compoRefPoint","_waterSources","_weaponSystemObjects","_waterWorldObjectASL"];
params [
	"_flagObject",
	"_posFlag",
	"_dirFlag",
	"_layout"
];

if (WMS_MissionDebug) then {diag_log format ["[TheOneMillionDollarsBase]|WAK|TNA|WMS| _this = %1", _this];};
if (_layout != "TheOneMillionDollarsBase") exitWith {diag_log format ["[TheOneMillionDollarsBase]|WAK|TNA|WMS|Wrong Layout Dude, _layout = %1", _layout];};

_objects = [];

/*_wallsV1 = [ //array walls only
	["Land_HBarrier_01_line_5_green_F",[-5.5,-49.7,0],6.3],["Land_HBarrier_01_line_5_green_F",[-11,-48.8,0],12.7],["Land_HBarrier_01_line_5_green_F",[-16.2,-47.3,0],18.9],["Land_HBarrier_01_line_5_green_F",[-33.3,-37.3,0],41.7],["Land_HBarrier_01_line_5_green_F",[-37.1,-33.6,0],47.9],["Land_HBarrier_01_line_5_green_F",[-47.7,-15.2,0],72.5],["Land_HBarrier_01_line_5_green_F",[-49.1,-10,0],78.6],["Land_HBarrier_01_line_5_green_F",[-49,9.8,0],101.3],["Land_HBarrier_01_line_5_green_F",[-47.7,15,0],107.4],["Land_HBarrier_01_line_5_green_F",[-45.7,20.2,0],113.8],["Land_HBarrier_01_line_5_green_F",[-40.3,29.6,0],126.3],["Land_HBarrier_01_line_5_green_F",[-36.9,33.9,0],132.7],["Land_HBarrier_01_line_5_green_F",[-32.9,37.7,0],138.9],["Land_HBarrier_01_line_5_green_F",[-15.7,47.5,0],161.7],["Land_HBarrier_01_line_5_green_F",[-10.5,48.9,0],167.8],["Land_HBarrier_01_line_5_green_F",[10.7,48.9,0],192.5],["Land_HBarrier_01_line_5_green_F",[15.9,47.5,0],198.6],["Land_HBarrier_01_line_5_green_F",[33.1,37.6,0],221.4],["Land_HBarrier_01_line_5_green_F",[36.9,33.9,0],227.5],["Land_HBarrier_01_line_5_green_F",[40.4,29.5,0],233.9],["Land_HBarrier_01_line_5_green_F",[45.8,20.1,0],246.3],["Land_HBarrier_01_line_5_green_F",[47.8,14.9,0],252.7],["Land_HBarrier_01_line_5_green_F",[49.1,9.7,0],258.9],["Land_HBarrier_01_line_5_green_F",[49,-10.1,0],281.7],["Land_HBarrier_01_line_5_green_F",[47.6,-15.3,0],287.9],["Land_HBarrier_01_line_5_green_F",[37,-33.6,0],312.2],["Land_HBarrier_01_line_5_green_F",[33.2,-37.4,0],318.4],["Land_HBarrier_01_line_5_green_F",[16.1,-47.3,0],341.2],["Land_HBarrier_01_line_5_green_F",[10.8,-48.8,0],347.5],["Land_HBarrier_01_line_5_green_F",[5.4,-49.7,0],353.9],["Land_Mil_WallBig_4m_battered_F",[-1.5,-40,0],2.3],["Land_Mil_WallBig_4m_battered_F",[-5.4,-39.6,0],7.8],["Land_Mil_WallBig_4m_battered_F",[-9.2,-38.9,0],13.4],["Land_Mil_WallBig_4m_battered_F",[-13,-37.8,0],19.1],["Land_Mil_WallBig_4m_battered_F",[-16.5,-36.4,0],24.4],["Land_Mil_WallBig_4m_battered_F",[-20,-34.7,0],29.9],["Land_Mil_WallBig_4m_battered_F",[-23.3,-32.5,0],35.6],["Land_Mil_WallBig_4m_battered_F",[-26.3,-30.1,0],41.2],["Land_Mil_WallBig_4m_battered_F",[-39,-8.8,0],77.3],["Land_Mil_WallBig_4m_battered_F",[-39.7,-4.9,0],83],["Land_Mil_WallBig_4m_battered_F",[-40,-1,0],88.5],["Land_Mil_WallBig_4m_battered_F",[-39.9,2.9,0],94.1],["Land_Mil_WallBig_4m_battered_F",[-39.4,6.8,0],99.8],["Land_Mil_WallBig_4m_battered_F",[-38.6,10.6,0],105.3],["Land_Mil_WallBig_4m_battered_F",[-37.4,14.3,0],110.9],["Land_Mil_WallBig_4m_battered_F",[-35.8,17.9,0],116.6],["Land_Mil_WallBig_4m_battered_F",[-33.9,21.3,0],122.2],["Land_Mil_WallBig_4m_battered_F",[-31.7,24.4,0],127.6],["Land_Mil_WallBig_4m_battered_F",[-29.1,27.4,0],133.2],["Land_Mil_WallBig_4m_battered_F",[-26.3,30.2,0],138.9],["Land_Mil_WallBig_4m_battered_F",[-23.3,32.5,0],144.4],["Land_Mil_WallBig_4m_battered_F",[-20,34.7,0],150.1],["Land_Mil_WallBig_4m_battered_F",[-16.5,36.4,0],155.7],["Land_Mil_WallBig_4m_battered_F",[-12.9,37.9,0],161.2],["Land_Mil_WallBig_4m_battered_F",[8,39.2,0.09],191.7],["Land_Mil_WallBig_4m_battered_F",[11.9,38.2,0.09],197.4],["Land_Mil_WallBig_4m_battered_F",[15.5,36.9,0],202.9],["Land_Mil_WallBig_4m_battered_F",[19,35.2,0],208.5],["Land_Mil_WallBig_4m_battered_F",[22.4,33.1,0],214.2],["Land_Mil_WallBig_4m_battered_F",[25.5,30.8,0],219.6],["Land_Mil_WallBig_4m_battered_F",[28.4,28.2,0],225.2],["Land_Mil_WallBig_4m_battered_F",[31,25.3,0],230.8],["Land_Mil_WallBig_4m_battered_F",[33.3,22.2,0],236.4],["Land_Mil_WallBig_4m_battered_F",[35.3,18.8,0],242],["Land_Mil_WallBig_4m_battered_F",[37,15.2,0],247.6],["Land_Mil_WallBig_4m_battered_F",[38.3,11.6,0],253.2],["Land_Mil_WallBig_4m_battered_F",[39.2,7.8,0],258.8],["Land_Mil_WallBig_4m_battered_F",[39.8,3.9,0],264.4],["Land_Mil_WallBig_4m_battered_F",[40,0,0],270],["Land_Mil_WallBig_4m_battered_F",[39.8,-3.9,0],275.6],["Land_Mil_WallBig_4m_battered_F",[39.2,-7.8,0],281.2],["Land_Mil_WallBig_4m_battered_F",[27.1,-29.4,0],317.4],["Land_Mil_WallBig_4m_battered_F",[24.1,-31.9,0],323],["Land_Mil_WallBig_4m_battered_F",[20.8,-34.1,0],328.7],["Land_Mil_WallBig_4m_battered_F",[17.4,-36,0],334.2],["Land_Mil_WallBig_4m_battered_F",[13.8,-37.5,0],339.8],["Land_Mil_WallBig_4m_battered_F",[10.1,-38.7,0],345.5],["Land_Mil_WallBig_4m_battered_F",[6.3,-39.5,0],351],["Land_Mil_WallBig_4m_battered_F",[2.4,-39.9,0],356.6]
];
_NoWallsV1 = [ //array no walls
	["B_AAA_System_01_F",[-30.5,-8.1,0],61.4],["B_AAA_System_01_F",[-8.2,31.3,0],180],["B_AAA_System_01_F",[31.1,-8.7,0],300.1],["B_SAM_System_01_F",[9.6,31.1,0],207.5],["B_SAM_System_03_F",[0.8,-12.9,0],90],["B_Slingload_01_Cargo_F",[0,-20.8,0],0],["Box_IND_AmmoVeh_F",[-25.5,-26.8,0],61],["Box_IND_AmmoVeh_F",[36.1,-8.7,0],303.4],["Box_IND_AmmoVeh_F",[-10.8,35.4,0],359.7],["Campfire_burning_F",[-31.4,22.8,0],0],["Campfire_burning_F",[-4.2,-38.3,0],0],["Campfire_burning_F",[35.2,15.1,0],0],["Fridge_01_closed_F",[-4.1,2.8,0],331.5],["Land_BagFence_01_long_green_F",[-8.2,28.2,0],0],["Land_BagFence_01_long_green_F",[9.4,28.6,0],0.2],["Land_BagFence_01_long_green_F",[-11.6,31.4,0],87.2],["Land_BagFence_01_long_green_F",[12.7,31.8,0],88],["Land_BagFence_01_long_green_F",[28.5,-7.6,0],118.7],["Land_BagFence_01_long_green_F",[-32.7,-5.6,0],154.4],["Land_BagFence_01_long_green_F",[32.9,-6.2,0],206],["Land_BagFence_01_long_green_F",[-28.3,-7,0],241.6],["Land_BagFence_01_round_green_F",[6.8,29.1,0],36.1],["Land_BagFence_01_round_green_F",[-10.8,28.8,0],41.3],["Land_BagFence_01_round_green_F",[27.8,-10.1,0],75.7],["Land_BagFence_01_round_green_F",[-36.8,21.1,0],116.5],["Land_BagFence_01_round_green_F",[30.2,-5.6,0],160.1],["Land_BagFence_01_round_green_F",[-30.1,-5,0],195.7],["Land_BagFence_01_round_green_F",[36.7,21.2,0],237.6],["Land_BagFence_01_round_green_F",[-27.5,-9.5,0],278.9],["Land_BagFence_01_round_green_F",[-5.7,28.9,0],314.3],["Land_BagFence_01_round_green_F",[12,29.3,0],314.3],["Land_BagFence_01_round_green_F",[0.1,-42.5,0],358.5],["Land_Bunker_01_blocks_3_F",[31.8,-13.9,1.01],31.4],["Land_Bunker_01_blocks_3_F",[-28,-20.6,0],150.3],["Land_Bunker_01_blocks_3_F",[-3.8,34.5,0.94],270.9],["Land_Bunker_01_small_F",[-30.1,-25.2,0],60],["Land_Bunker_01_small_F",[-6.7,38.7,0],180],["Land_Bunker_01_small_F",[36.9,-13.5,0],300],["Land_Bunker_01_tall_F",[-36.4,-13.3,0],60],["Land_Bunker_01_tall_F",[6.7,38.2,0],180],["Land_Bunker_01_tall_F",[29.7,-24.9,0],300],["Land_Cargo_Patrol_V1_F",[0,-39.3,0],0],["Land_Cargo_Patrol_V1_F",[-34,19.7,0],120],["Land_Cargo_Patrol_V1_F",[34,19.6,0],240],["Land_CncBarrierMedium4_F",[0,-28.3,0],90],["Land_fs_feed_F",[0.1,-32.4,0],0.3],["Land_fs_feed_F",[-35.4,20.3,0],119.8],["Land_fs_feed_F",[35.5,20.5,0],240],["Land_fs_feed_F",[0.2,-40.9,0],359.8],["Land_HBarrier_01_big_tower_green_F",[-0,-48.2,-1],0],["Land_HBarrier_01_big_tower_green_F",[-41.2,23.9,-1],120],["Land_HBarrier_01_big_tower_green_F",[41.8,24.2,-1],240],["Land_HelipadCircle_F",[-24.5,-42.5,0],30],["Land_HelipadCircle_F",[-49,0,0],90],["Land_HelipadCircle_F",[-24.6,42.4,0],149.9],["Land_HelipadCircle_F",[-11.6,-25,0],172],["Land_HelipadCircle_F",[11.5,-25,0],188],["Land_HelipadCircle_F",[24.5,42.4,0],210.1],["Land_HelipadCircle_F",[49,-0,0],270],["Land_HelipadCircle_F",[24.5,-42.5,0],330],["Land_HelipadEmpty_F",[-0,22.3,0],0],["Land_LampShabby_F",[34.1,-23.6,0],63.2],["Land_LampShabby_F",[-37.6,-17.8,0],189.6],["Land_LampShabby_F",[6.1,5.8,0],220.2],["Land_LampShabby_F",[3.3,41.3,0],306.9],["Land_MedicalTent_01_NATO_generic_open_F",[0,0,0],90],["Land_Net_Fence_Gate_F",[0,40,0],0],["Land_Net_Fence_Gate_F",[34.6,-20,0],120],["Land_Net_Fence_Gate_F",[-34.6,-20,0],240],["Land_Research_house_V1_F",[18.5,29.6,0],32.7],["Land_SandbagBarricade_01_F",[-5.7,6.6,0],0],["Land_SandbagBarricade_01_F",[5.5,6.7,0],0],["Land_SandbagBarricade_01_F",[7.1,-4.2,0],90],["Land_SandbagBarricade_01_F",[6.5,-12.8,0],90],["Land_SandbagBarricade_01_F",[7,5.9,0],90],["Land_SandbagBarricade_01_F",[5.8,-14.5,0],131.5],["Land_SandbagBarricade_01_F",[-6.7,-5.7,0],180],["Land_SandbagBarricade_01_F",[6.4,-5.8,0],180],["Land_SandbagBarricade_01_F",[-4.5,-5.8,0],180],["Land_SandbagBarricade_01_F",[4.3,-5.8,0],180],["Land_SandbagBarricade_01_F",[-2.4,-5.8,0],180],["Land_SandbagBarricade_01_F",[-0.2,-5.8,0],180],["Land_SandbagBarricade_01_F",[2,-5.8,0],180],["Land_SandbagBarricade_01_F",[-4.1,-14.4,0],240.1],["Land_SandbagBarricade_01_F",[-7.1,6,0],270],["Land_SandbagBarricade_01_F",[-4.6,-12.3,0],270],["Land_SandbagBarricade_01_F",[-7.3,-4.2,0],270],["Land_SandbagBarricade_01_half_F",[-3.5,6.7,0],0],["Land_SandbagBarricade_01_half_F",[-1.2,6.7,0],0],["Land_SandbagBarricade_01_half_F",[3.3,6.7,0],0],["Land_SandbagBarricade_01_half_F",[1,6.7,0],0],["Land_SandbagBarricade_01_half_F",[45.4,-7,0],11.9],["Land_SandbagBarricade_01_half_F",[47.7,-7.4,0],11.9],["Land_SandbagBarricade_01_half_F",[26,-19.1,0],30.2],["Land_SandbagBarricade_01_half_F",[28,-20.2,0],30.2],["Land_SandbagBarricade_01_half_F",[37.4,-30.7,0],40.9],["Land_SandbagBarricade_01_half_F",[-28.5,36,0],51.6],["Land_SandbagBarricade_01_half_F",[-29.9,37.8,0],51.6],["Land_SandbagBarricade_01_half_F",[-25.3,-20.3,0],59.8],["Land_SandbagBarricade_01_half_F",[-24.2,-22.2,0],59.8],["Land_SandbagBarricade_01_half_F",[17.7,-44.8,0],68.3],["Land_SandbagBarricade_01_half_F",[16.9,-42.7,0],68.3],["Land_SandbagBarricade_01_half_F",[-7.8,47.5,0],78.7],["Land_SandbagBarricade_01_half_F",[7.1,3.7,0],90],["Land_SandbagBarricade_01_half_F",[7.2,-2,0],90],["Land_SandbagBarricade_01_half_F",[16.6,42.9,0],111.6],["Land_SandbagBarricade_01_half_F",[17.5,45,0],111.6],["Land_SandbagBarricade_01_half_F",[-30.3,-37.4,0],131.4],["Land_SandbagBarricade_01_half_F",[-28.8,-35.7,0],131.4],["Land_SandbagBarricade_01_half_F",[-29.5,-13,0],150.2],["Land_SandbagBarricade_01_half_F",[-31.4,-14.1,0],150.2],["Land_SandbagBarricade_01_half_F",[-45.3,-16.9,0],161.8],["Land_SandbagBarricade_01_half_F",[45.4,6.6,0],169.1],["Land_SandbagBarricade_01_half_F",[47.6,7.1,0],169.1],["Land_SandbagBarricade_01_half_F",[-45.4,6.7,0],191.9],["Land_SandbagBarricade_01_half_F",[-47.6,7.2,0],191.9],["Land_SandbagBarricade_01_half_F",[45.2,-17.1,0],197.9],["Land_SandbagBarricade_01_half_F",[28.7,-35.8,0],229.3],["Land_SandbagBarricade_01_half_F",[30.2,-37.5,0],229.3],["Land_SandbagBarricade_01_half_F",[-17.4,45,0],252.1],["Land_SandbagBarricade_01_half_F",[-16.7,42.8,0],252.1],["Land_SandbagBarricade_01_half_F",[3.6,34.4,0],269.8],["Land_SandbagBarricade_01_half_F",[3.6,32.1,0],269.8],["Land_SandbagBarricade_01_half_F",[-7.3,-2,0],270],["Land_SandbagBarricade_01_half_F",[-7.2,3.7,0],270],["Land_SandbagBarricade_01_half_F",[8,47.6,0],281.7],["Land_SandbagBarricade_01_half_F",[-17,-42.6,0],289.9],["Land_SandbagBarricade_01_half_F",[-17.8,-44.7,0],289.9],["Land_SandbagBarricade_01_half_F",[28.5,36.1,0],311.6],["Land_SandbagBarricade_01_half_F",[30,37.8,0],311.6],["Land_SandbagBarricade_01_half_F",[-37.4,-30.5,0],314.6],["Land_SandbagBarricade_01_half_F",[-45.5,-7,0],350.9],["Land_SandbagBarricade_01_half_F",[-47.7,-7.3,0],350.9],["Land_TentHangar_V1_F",[-23.5,13.6,0],120],["Land_TentHangar_V1_F",[23.6,13.6,0],240],["Land_WaterBarrel_F",[4,-2.8,0],0],["Land_WaterBarrel_F",[16.8,29.2,0],0],["Sign_Sphere10cm_F",[5.9,22.2,0.22],0],["Sign_Sphere10cm_F",[0,16.2,0.22],0],["Sign_Sphere10cm_F",[-0.1,28.1,0.22],0],["Sign_Sphere10cm_F",[-6,22.1,0.22],0],["Sign_Sphere10cm_F",[4.2,26.4,0.22],315],["Sign_Sphere10cm_F",[-4.3,17.9,0.22],315],["Sign_Sphere10cm_F",[4.2,17.9,0.22],315],["Sign_Sphere10cm_F",[-4.3,26.3,0.22],315],["Windsock_01_F",[-0.2,-5.7,2.54],0]
];*/
_walls = [ //in _secondList = ["Land_Mil_WallBig_4m_battered_F", "Land_HelipadSquare_F","Land_HelipadCircle_F", "Land_SandbagBarricade_01_half_F", "Land_SandbagBarricade_01_F", "Land_HBarrier_01_line_5_green_F", "Land_Bunker_01_blocks_3_F"];
	["Land_Bunker_01_blocks_3_F",[40.5,-18.8,1.01],31.4],["Land_Bunker_01_blocks_3_F",[-36.4,-25.5,0],150.3],["Land_Bunker_01_blocks_3_F",[35.3,-24.6,1.01],210.1],["Land_Bunker_01_blocks_3_F",[31,-22.1,1.01],210.1],["Land_Bunker_01_blocks_3_F",[-3.8,44.5,0.94],270.9],["Land_HBarrier_01_line_5_green_F",[11.8,-32.8,0],70],["Land_HBarrier_01_line_5_green_F",[13.8,-38.2,0],70],["Land_HBarrier_01_line_5_green_F",[9.8,-27.5,0],70],["Land_HBarrier_01_line_5_green_F",[-14,-38.4,0],110],["Land_HBarrier_01_line_5_green_F",[-10.2,-27.7,0],110],["Land_HBarrier_01_line_5_green_F",[-12.1,-33,0],110],["Land_HBarrier_01_line_5_green_F",[26.2,-19.5,0],210],["Land_HelipadCircle_F",[20.8,-28.2,0],143.6],["Land_HelipadCircle_F",[0,-35,0],180],["Land_HelipadCircle_F",[-21.6,-27.6,0],218.1],["Land_HelipadSquare_F",[-30.8,-57.3,0],30],["Land_HelipadSquare_F",[-65,-1.9,0],90],["Land_HelipadSquare_F",[-32.5,56.3,0],150],["Land_HelipadSquare_F",[32.5,56.3,0],210],["Land_HelipadSquare_F",[65,-0,0],270],["Land_HelipadSquare_F",[34.1,-55.4,0],330],["Land_Mil_WallBig_4m_battered_F",[0,-50,0],0],["Land_Mil_WallBig_4m_battered_F",[-3.9,-49.8,0],4.5],["Land_Mil_WallBig_4m_battered_F",[-7.8,-49.4,0],9],["Land_Mil_WallBig_4m_battered_F",[-11.6,-48.6,0],13.4],["Land_Mil_WallBig_4m_battered_F",[-15.4,-47.6,-0],17.9],["Land_Mil_WallBig_4m_battered_F",[-19.1,-46.2,0],22.4],["Land_Mil_WallBig_4m_battered_F",[-22.7,-44.6,-0],27],["Land_Mil_WallBig_4m_battered_F",[-26.1,-42.6,0],31.5],["Land_Mil_WallBig_4m_battered_F",[-29.3,-40.5,0],35.9],["Land_Mil_WallBig_4m_battered_F",[-32.4,-38.1,-0],40.4],["Land_Mil_WallBig_4m_battered_F",[-35.3,-35.4,0],44.9],["Land_Mil_WallBig_4m_battered_F",[-48,-13.9,-0],73.9],["Land_Mil_WallBig_4m_battered_F",[-49,-10.1,0],78.4],["Land_Mil_WallBig_4m_battered_F",[-49.6,-6.2,0],82.9],["Land_Mil_WallBig_4m_battered_F",[-49.9,-2.3,0],87.4],["Land_Mil_WallBig_4m_battered_F",[-50,1.6,0],91.9],["Land_Mil_WallBig_4m_battered_F",[-49.7,5.6,0],96.4],["Land_Mil_WallBig_4m_battered_F",[-49.1,9.5,0],100.9],["Land_Mil_WallBig_4m_battered_F",[-48.2,13.3,0],105.4],["Land_Mil_WallBig_4m_battered_F",[-47,17,0],109.9],["Land_Mil_WallBig_4m_battered_F",[-45.5,20.6,0],114.4],["Land_Mil_WallBig_4m_battered_F",[-43.8,24.2,0],118.9],["Land_Mil_WallBig_4m_battered_F",[-41.7,27.5,0],123.4],["Land_Mil_WallBig_4m_battered_F",[-39.5,30.7,0],127.8],["Land_Mil_WallBig_4m_battered_F",[-37,33.7,0],132.3],["Land_Mil_WallBig_4m_battered_F",[-34.2,36.5,0],136.8],["Land_Mil_WallBig_4m_battered_F",[-31.2,39,0],141.3],["Land_Mil_WallBig_4m_battered_F",[-28.1,41.4,0],145.8],["Land_Mil_WallBig_4m_battered_F",[-24.8,43.4,0],150.3],["Land_Mil_WallBig_4m_battered_F",[-21.3,45.2,0],154.8],["Land_Mil_WallBig_4m_battered_F",[-17.7,46.8,0],159.3],["Land_Mil_WallBig_4m_battered_F",[-13.9,48,0],163.8],["Land_Mil_WallBig_4m_battered_F",[12.1,48.5,0],194],["Land_Mil_WallBig_4m_battered_F",[15.8,47.4,0],198.4],["Land_Mil_WallBig_4m_battered_F",[19.4,46.1,0],202.8],["Land_Mil_WallBig_4m_battered_F",[22.9,44.4,0],207.3],["Land_Mil_WallBig_4m_battered_F",[26.4,42.5,0],211.8],["Land_Mil_WallBig_4m_battered_F",[29.6,40.3,0],216.3],["Land_Mil_WallBig_4m_battered_F",[32.7,37.8,0],220.8],["Land_Mil_WallBig_4m_battered_F",[35.6,35.2,0],225.3],["Land_Mil_WallBig_4m_battered_F",[38.2,32.3,0],229.8],["Land_Mil_WallBig_4m_battered_F",[40.6,29.2,0],234.3],["Land_Mil_WallBig_4m_battered_F",[42.8,25.9,0],238.8],["Land_Mil_WallBig_4m_battered_F",[44.7,22.5,0],243.3],["Land_Mil_WallBig_4m_battered_F",[46.3,19,0],247.7],["Land_Mil_WallBig_4m_battered_F",[47.6,15.3,0],252.2],["Land_Mil_WallBig_4m_battered_F",[48.7,11.5,0],256.7],["Land_Mil_WallBig_4m_battered_F",[49.4,7.7,0],261.2],["Land_Mil_WallBig_4m_battered_F",[49.9,3.8,0],265.7],["Land_Mil_WallBig_4m_battered_F",[50,-0.1,0],270.2],["Land_Mil_WallBig_4m_battered_F",[49.8,-4,0],274.7],["Land_Mil_WallBig_4m_battered_F",[49.4,-8,0],279.2],["Land_Mil_WallBig_4m_battered_F",[48.6,-11.8,0],283.7],["Land_Mil_WallBig_4m_battered_F",[35.4,-35.4,0],315],["Land_Mil_WallBig_4m_battered_F",[32.4,-38,0],319.5],["Land_Mil_WallBig_4m_battered_F",[29.4,-40.5,0],324],["Land_Mil_WallBig_4m_battered_F",[26.2,-42.6,0],328.5],["Land_Mil_WallBig_4m_battered_F",[22.7,-44.5,0],332.9],["Land_Mil_WallBig_4m_battered_F",[19.2,-46.2,0],337.5],["Land_Mil_WallBig_4m_battered_F",[15.5,-47.5,0],342],["Land_Mil_WallBig_4m_battered_F",[11.7,-48.6,0],346.5],["Land_Mil_WallBig_4m_battered_F",[7.8,-49.4,0],351],["Land_Mil_WallBig_4m_battered_F",[3.9,-49.8,0],355.5],["Land_SandbagBarricade_01_F",[-12.6,5.4,0],0],["Land_SandbagBarricade_01_F",[-5.2,8.9,0],0],["Land_SandbagBarricade_01_F",[5.9,8.9,0],0],["Land_SandbagBarricade_01_F",[7.4,8.2,0],90],["Land_SandbagBarricade_01_F",[7.5,-4.4,0],90],["Land_SandbagBarricade_01_F",[7.5,3.8,0],90],["Land_SandbagBarricade_01_F",[0.1,-6,0],180],["Land_SandbagBarricade_01_F",[6.7,-5.9,0],180],["Land_SandbagBarricade_01_F",[-13.1,-5.7,0],180],["Land_SandbagBarricade_01_F",[4.7,-5.9,0],180],["Land_SandbagBarricade_01_F",[2.3,-6,0],180],["Land_SandbagBarricade_01_F",[-14.8,-5,0],221.5],["Land_SandbagBarricade_01_F",[-16.1,-3.3,0],246.7],["Land_SandbagBarricade_01_F",[-7.3,-4.2,0],270],["Land_SandbagBarricade_01_F",[-7.3,-6.2,0],270],["Land_SandbagBarricade_01_F",[-7.3,-8.4,0],270],["Land_SandbagBarricade_01_F",[-6.8,8.3,0],320.9],["Land_SandbagBarricade_01_F",[-14.7,4.9,0],330.1],["Land_SandbagBarricade_01_half_F",[1.5,9,0],0],["Land_SandbagBarricade_01_half_F",[3.7,9,0],0],["Land_SandbagBarricade_01_half_F",[-8.6,7.9,0],0],["Land_SandbagBarricade_01_half_F",[-0.7,9,0],0],["Land_SandbagBarricade_01_half_F",[-10.6,5.5,0],0],["Land_SandbagBarricade_01_half_F",[-3,9,0],0],["Land_SandbagBarricade_01_half_F",[-33.8,-25.2,0],59.8],["Land_SandbagBarricade_01_half_F",[-32.6,-27.2,0],59.8],["Land_SandbagBarricade_01_half_F",[7.5,6,0],90],["Land_SandbagBarricade_01_half_F",[7.6,-2.5,0],90],["Land_SandbagBarricade_01_half_F",[-39.9,-19.1,0],150.2],["Land_SandbagBarricade_01_half_F",[-37.9,-17.9,0],150.2],["Land_SandbagBarricade_01_half_F",[-6.8,-10.3,0],230],["Land_SandbagBarricade_01_half_F",[3.6,44.3,0],269.8],["Land_SandbagBarricade_01_half_F",[3.6,42,0],269.8],["Land_SandbagBarricade_01_half_F",[-7.3,-2,0],270]
];
_NoWalls = [ //NOT in _secondList = ["Land_Mil_WallBig_4m_battered_F", "Land_HelipadSquare_F","Land_HelipadCircle_F", "Land_SandbagBarricade_01_half_F", "Land_SandbagBarricade_01_F", "Land_HBarrier_01_line_5_green_F", "Land_Bunker_01_blocks_3_F"];
	//["B_AAA_System_01_F",[-37.9,-13.2,0],61.4],["B_AAA_System_01_F",[8.2,40.6,0],180],["B_AAA_System_01_F",[39.4,-13.6,0],300.1],["B_SAM_System_01_F",[4.3,-9,0],90],["B_SAM_System_03_F",[-13.2,0,0],180],["B_Slingload_01_Cargo_F",[-2.2,-7.9,0],270],
	["Box_IND_AmmoVeh_F",[-32.7,-33,0],61],["Box_IND_AmmoVeh_F",[32.9,-28.7,0],303.4],["Box_IND_AmmoVeh_F",[5.5,7.2,0],359.7],["Box_IND_AmmoVeh_F",[-5.6,43.9,0],359.7],["CamoNet_wdl_open_F",[33,19.7,0.89],244.7],["Campfire_burning_F",[-45.1,-10.4,0],0],["Campfire_burning_F",[12.3,-46.5,0],0],["Campfire_burning_F",[31.9,23.4,0],0],["Campfire_burning_F",[-44.6,19.1,0],0],["Campfire_burning_F",[14.2,43.7,0],97.5],["Fridge_01_closed_F",[-4.1,2.8,0],331.5],["Land_BagBunker_01_small_green_F",[-18.9,-51.7,0],20.2],["Land_BagBunker_01_small_green_F",[-54.2,8.8,0],98.8],["Land_BagBunker_01_small_green_F",[-34.6,42.5,0],141.9],["Land_BagBunker_01_small_green_F",[17.8,51.9,0],201.8],["Land_BagBunker_01_small_green_F",[54.5,10.5,0],260],["Land_BagBunker_01_small_green_F",[18.7,-52.1,0],339],["Land_BagFence_01_long_green_F",[-8.2,38.1,0],0],["Land_BagFence_01_long_green_F",[7.9,37.7,0],0.2],["Land_BagFence_01_long_green_F",[4.5,-11.1,0],0.9],["Land_BagFence_01_long_green_F",[-31.8,-31.2,0],57.3],["Land_BagFence_01_long_green_F",[-11.6,41.4,0],87.2],["Land_BagFence_01_long_green_F",[11.2,40.8,0],88],["Land_BagFence_01_long_green_F",[7.6,-8,0],88.1],["Land_BagFence_01_long_green_F",[1.2,-7.8,0],88.1],["Land_BagFence_01_long_green_F",[36.7,-12.5,0],118.7],["Land_BagFence_01_long_green_F",[31.3,-26.7,0],122.2],["Land_BagFence_01_long_green_F",[-40,-10.7,0],154.4],["Land_BagFence_01_long_green_F",[41.1,-11.1,0],206],["Land_BagFence_01_long_green_F",[32.1,-30.9,0],209.4],["Land_BagFence_01_long_green_F",[-35.6,-12.1,0],241.6],["Land_BagFence_01_long_green_F",[-33.1,-35.2,0],330.1],["Land_BagFence_01_round_green_F",[5.4,38.2,0],36.1],["Land_BagFence_01_round_green_F",[-10.8,38.8,0],41.3],["Land_BagFence_01_round_green_F",[2,-10.5,0],42.2],["Land_BagFence_01_round_green_F",[36,-15,0],75.7],["Land_BagFence_01_round_green_F",[30.5,-29.2,0],79.1],["Land_BagFence_01_round_green_F",[38.4,-10.5,0],160.1],["Land_BagFence_01_round_green_F",[-37.5,-10.1,0],195.7],["Land_BagFence_01_round_green_F",[-34.9,-14.6,0],278.9],["Land_BagFence_01_round_green_F",[-31.2,-33.4,0],287],["Land_BagFence_01_round_green_F",[10.6,38.4,0],314.3],["Land_BagFence_01_round_green_F",[-5.7,38.8,0],314.3],["Land_BagFence_01_round_green_F",[7,-10.5,0],315.1],["Land_Bunker_01_small_F",[-38.6,-30.1,0],60],["Land_Bunker_01_small_F",[-6.7,48.6,0],180],["Land_Bunker_01_small_F",[45.6,-18.4,0],300],["Land_Bunker_01_tall_F",[-44.8,-18.3,0],60],["Land_Bunker_01_tall_F",[6.7,48.1,0],180],["Land_Bunker_01_tall_F",[38.4,-29.8,0],300],["Land_Cargo_Patrol_V1_F",[-17,-46.6,0],20],["Land_Cargo_Patrol_V1_F",[-43,24.8,0],120],["Land_Cargo_Patrol_V1_F",[42.9,24.9,0],239.9],["Land_Cargo_Patrol_V1_F",[17,-46.6,0],340],["Land_ClothShelter_01_F",[-6.2,44.7,0],91.8],["Land_ClothShelter_01_F",[32.9,-28.5,0],123.7],["Land_ClothShelter_01_F",[-32.8,-32.8,0],332.2],["Land_ClothShelter_02_F",[3.9,6.6,0],0],["Land_ClothShelter_02_F",[-46.5,-11,0],74.7],["Land_ClothShelter_02_F",[-43.8,16.4,0],185.8],["Land_ClothShelter_02_F",[14.6,45.3,0],195.5],["Land_fs_feed_F",[-56.1,6.4,0],7.5],["Land_fs_feed_F",[-9,-24.7,0],18.2],["Land_fs_feed_F",[-33.4,45.7,0],53.1],["Land_fs_feed_F",[21.8,-52.4,0],69],["Land_fs_feed_F",[20.9,52.4,0],117.3],["Land_fs_feed_F",[56.6,8.3,0],169.1],["Land_fs_feed_F",[-22,-52.3,0],290],["Land_fs_feed_F",[8.6,-24.4,0],340.8],["Land_GH_Stairs_F",[21.7,19.9,-0.85],34.4],["Land_GH_Stairs_F",[29.1,-3.7,-0.72],84.2],["Land_GH_Stairs_F",[45,10.4,-0.82],263.9],["Land_HelipadEmpty_F",[-55.4,-32,0],60],["Land_i_Shed_Ind_old_F",[21.8,25.1,0],305.2],["Land_i_Shed_Ind_old_F",[33.3,-0.5,0],355.1],["Land_LampShabby_F",[42.8,-28.5,0],63.2],["Land_LampShabby_F",[-46.1,-22.7,0],189.6],["Land_LampShabby_F",[6.6,8.1,0],220.2],["Land_LampShabby_F",[3.3,51.3,0],306.9],["Land_MedicalTent_01_NATO_generic_open_F",[0,0,0],90],["Land_Mil_WallBig_corner_battered_F",[-11.4,49.1,0],124],["Land_Mil_WallBig_corner_battered_F",[48.2,-14.5,0],243.9],["Land_Mil_WallBig_corner_battered_F",[37.3,-33.9,0],269.4],["Land_Net_Fence_Gate_F",[0,50,0],0],["Land_Net_Fence_Gate_F",[43.3,-24.9,0],120],["Land_Net_Fence_Gate_F",[-43.1,-25,0],240],["Land_PortableLight_single_F",[-22,-50.7,0],57.8],["Land_PortableLight_single_F",[-54.7,5.9,0],60.1],["Land_PortableLight_single_F",[21.7,-44.2,0],172.9],["Land_PortableLight_single_F",[-32.3,44.4,0],181.5],["Land_PortableLight_single_F",[-22.9,-43.2,0],187.5],["Land_PortableLight_single_F",[-10.5,-48.1,0],217.5],["Land_PortableLight_single_F",[20.3,50.6,0],239],["Land_PortableLight_single_F",[21.8,-51.1,0],285.4],["Land_PortableLight_single_F",[54.8,7.5,0],307.6],["Land_Research_house_V1_F",[33.1,16.7,0],62.5],["Land_TentHangar_V1_F",[-37.1,3.3,0],95],["Land_TentHangar_V1_F",[-21.3,30.5,0],145.1],["Land_WaterBarrel_F",[30.9,17.1,0],0],["Land_WaterBarrel_F",[4,-2.8,0],0],["Land_WoodenLog_F",[-45.4,17.5,0],28.1],["Land_WoodenLog_F",[-46.6,-13.1,0],30.8],["Land_WoodenLog_F",[29.9,23.5,0],93.5],["Land_WoodenLog_F",[-47.7,-9.8,0],110.7],["Land_WoodenLog_F",[12.5,45.5,0],134.9],["Land_WoodenLog_F",[31.6,25.6,0],171.6],["Land_WoodenLog_F",[14.6,46.3,0],189.1],["Land_WoodenLog_F",[16.3,44.7,0],245.8],["Land_WoodenLog_F",[34.3,23.1,0],275.4],["Sign_Sphere10cm_F",[-54.1,-26.2,0.22],15],["Sign_Sphere10cm_F",[-61.3,-30.5,0.22],15],["Sign_Sphere10cm_F",[-49.8,-33.6,0.22],15],["Sign_Sphere10cm_F",[-57.1,-37.8,0.22],15],["Sign_Sphere10cm_F",[-50.4,-29,0.22],60],["Sign_Sphere10cm_F",[-60.7,-35.1,0.22],60],["Sign_Sphere10cm_F",[-52.5,-37.2,0.22],60],["Sign_Sphere10cm_F",[-58.6,-26.8,0.22],60],["SignAd_Sponsor_F",[-48.2,-21.6,0],36.1],["SignAd_Sponsor_F",[5.5,52.5,0],155.5],["SignAd_Sponsor_F",[42.9,-30.9,0],276.1],["Windsock_01_F",[-0.2,-5.7,2.54],0]
];//["Land_WaterBarrel_F",[16.8,29.2,0],0],
_statics = [
	["B_Slingload_01_Cargo_F",[-2.2,-7.9,0],270],["B_AAA_System_01_F",[-37.9,-13.2,0],61.4],["B_AAA_System_01_F",[8.2,40.6,0],180],["B_AAA_System_01_F",[39.4,-13.6,0],300.1],["B_SAM_System_01_F",[4.3,-9,0],90],["B_SAM_System_03_F",[-13.2,0,0],180]
];

if (WMS_MissionDebug) then {diag_log format ["[TheOneMillionDollarsBase]|WAK|TNA|WMS| _layout = %1", _layout];};

_fastTravelers = _flagObject getVariable ["WMS_BaseFriends", []]; //this will be used to acces the container actions or at least "punish" those who are not in this list
_owner = _flagObject getVariable ["WMS_buyerowner", ""];
_weaponSystemList = ["B_AAA_System_01_F","B_SAM_System_01_F","B_SAM_System_02_F","B_SAM_System_03_F","B_Radar_System_01_F"];
_weaponSystemObjects = [];
_waterWorldObjectASL = ["Land_QuayConcrete_01_20m_F","Land_QuayConcrete_01_20m_wall_F","Land_QuayConcrete_01_5m_ladder_F","Land_QuayConcrete_01_innerCorner_F","Land_QuayConcrete_01_outterCorner_F","Land_QuayConcrete_01_pier_F"];
_waterSources = ["Land_ConcreteWell_02_F"];
_ammoSources = ["Box_IND_AmmoVeh_F"];
_forceMedicalFacilities = getArray(missionConfigFile >> "CfgForceMedicalFacilities" >> "vehicles");
_compoRefPoint = createVehicle ["VR_Area_01_circle_4_yellow_F", _posFlag, [], 0, "CAN_COLLIDE"];
_compoRefPoint setDir _dirFlag;

{
	_objects = [];
	if (_x == "_walls") then {
		_objects = _walls;
	}else{
		if (_x == "_NoWalls") then {
			_objects = _NoWalls;
		}else {
			if (_x == "_statics") then {
				_objects = _statics;
			};
		};
	};

	{    
	_object = createVehicle [(_x select 0), [0,0,4000], [], 0, "CAN_COLLIDE"];
	_object setdir _dirFlag + (_x select 2); 
	_objectVectoriel = (_compoRefPoint modeltoworld  [(_x select 1 select 0),(_x select 1 select 1),0]);
	if(surfaceIsWater _objectVectoriel || (_x select 0) in _waterWorldObjectASL)then{
		_object setposASL [(_objectVectoriel select 0),(_objectVectoriel select 1),((_x select 1) select 2)];
	}else{
		_object setposATL [(_objectVectoriel select 0),(_objectVectoriel select 1),((_x select 1) select 2)];
		_gradient = surfaceNormal position _object; 
		//if ((count _x) > 3 && {(_x select 3) == "flat"}) then {
		if (true) then {//everything "flat
			_object setVectorUp [0,0,1];
		//}else {
		//	_object setvectorup _gradient;
		};
	};
	/*if ((count _x) > 4) then { //useless
		_objPos = position _object;
		_object setpos [(_objPos select 0), (_objPos select 1), (_x select 4)];
	};*/
	/*if ((_x select 0) in _waterSources) then {
		[_object, 150] call acex_field_rations_fnc_setRemainingWater;
	};*/
	if ((_x select 0) in _forceMedicalFacilities) then {
		_object setVariable ["ace_medical_isMedicalFacility", true, true];
		_object setVariable ["WMS_resetFatigueTimer", time, true];
		
		[ //params ["_target", "_caller", "_actionId", "_arguments"];
			_object,
			[
				"<t size='1' color='#528ffa'>Reset ACE Fatigue</t>",
				"
				[(_this select 1), objNull] call ace_advanced_fatigue_fnc_handlePlayerChanged;
				(_this select 0) setVariable ['WMS_resetFatigueTimer', time, true];
				",
				[], //argument accessible in the script (_this select 3)
				1,
				true,
				true,
				"",
				//"((getplayerUID _this) == (_target getVariable ['WMS_BuyerOwner', 0]) && (vehicle _this == _this))",
				"('ACE_personalAidKit' in (items _this)) &&
				{(time >= (3600 + (_target getVariable ['WMS_resetFatigueTimer', time])))} && 
				{(vehicle _this == _this)}",
				5
			]
		] remoteExec [
			"addAction",
			0, //0 for all players //2 server only //-2 everyone but the server
			true //JIP
		];
	};
	if ((_x select 0) in _ammoSources) then {
		_object setVariable ["ACE_isRepairFacility", true, true];
		_object lock true;
	
		[ //params ["_target", "_caller", "_actionId", "_arguments"];
			_object,
			[
				"<t size='1' color='#528ffa'>Buy Ammo Default</t>",
				"
				[(_this select 1), (_this select 0), 'default'] call WMS_fnc_buyAmmoOnBox;
				",
				[], //argument accessible in the script (_this select 3)
				1,
				true,
				true,
				"",
				//"((getplayerUID _this) == (_target getVariable ['WMS_BuyerOwner', 0]) && (vehicle _this == _this))",
				"(_this getVariable ['playerInTerritory', false])",
				5
			]
		] remoteExec [
			"addAction",
			0, //0 for all players //2 server only //-2 everyone but the server
			true //JIP
		];
		[ //params ["_target", "_caller", "_actionId", "_arguments"];
			_object,
			[
				"<t size='1' color='#528ffa'>Buy Ammo Random</t>",
				"
				[(_this select 1), (_this select 0), 'random'] call WMS_fnc_buyAmmoOnBox;
				",
				[], //argument accessible in the script (_this select 3)
				1,
				true,
				true,
				"",
				//"((getplayerUID _this) == (_target getVariable ['WMS_BuyerOwner', 0]) && (vehicle _this == _this))",
				"(_this getVariable ['playerInTerritory', false])",
				5
			]
		] remoteExec [
			"addAction",
			0, //0 for all players //2 server only //-2 everyone but the server
			true //JIP
		];
	};
	if !(_object isKindOf "Land_vn_b_helipad_01") then {
		_object enableSimulationGlobal true; 
	};
	if (_object isKindOf "B_Slingload_01_Cargo_F") then { //this is a special one, it will need some work
    	if (isServer) then {
			_object enableRopeAttach false;
			clearMagazineCargoGlobal _object; 
			clearWeaponCargoGlobal _object; 
			clearItemCargoGlobal _object; 
			clearBackpackCargoGlobal _object; 
			_object setVariable ["TheOneMillionDollarsBase",true,true];
			_object setVariable ["WMS_BaseFriends", _fastTravelers,true];
			_object setVariable ["WMS_buyerowner", _owner,true];
			[_object] call WMS_fnc_initContainerCargoDump;
		};
	};
	_object allowDamage false;
	_object setVariable ["_lootAllowed",false,true];
	_object setVariable ["_territoryObject",true,true];
	
	if ((_x select 0) in _weaponSystemList) then {
		_object allowDamage true;
		//_object enableSimulationGlobal false;
		_object setVehicleLock "LOCKED";
		_weaponSystemObjects pushBack _object;
	};
    _object enableRopeAttach false;
	} forEach _objects; 
} forEach ["_walls","_NoWalls","_statics"];
_flagObject setVariable ["WMS_weaponSystemObjects",_weaponSystemObjects, true];
_flagObject setVariable ["TheOneMillionDollarsBase", true, true];
deleteVehicle _compoRefPoint;