class specialItemsToSell //this list will be checked for custom prices, those items should be spawn/loot only
	{
		name = "BusinessIsBusiness";
		items[]=
		{	
			"Csat_Id_01",
			"Csat_Id_02",
			"Csat_Id_03",
			"Csat_Id_04",
			"Csat_Id_05",
			"FilesSecret",
			"FileNetworkStructure",
			"FileTopSecret",
			"DocumentsSecret",
			"Wallet_ID",
			"FlashDisk",
			"ButaneCanister",
			"Keys",
			"ACE_key_east",
			"ACE_Cellphone",
			"ACE_HuntIR_monitor",
			"SatPhone",
			"ACE_UAVBattery",
			"Laptop_closed",
			"Laptop_Unfolded",
			"Antimalaricum",
			"AntimalaricumVaccine",
			"Antibiotic"
		};
	};
class ItemsMOney
    {
	    name = "Money";
	    items[]=
	    {
	    	"Money_bunch",
	    	"Money_roll",
	    	"Money_stack",
	    	"Money_stack_quest",
	    	"Money"
	    };
    };
class foodAndHealth
    {
	    name = "survive";
	    items[]=
	    {
	    	"ACE_Can_Franta",
	    	"ACE_Can_RedGull",
	    	"ACE_Can_Spirit",
	    	"ACE_Canteen",
	    	"ACE_Canteen_Empty",
	    	"ACE_Canteen_Half",
	    	"ACE_WaterBottle",
	    	"ACE_WaterBottle_Empty",
	    	"ACE_WaterBottle_Half",

	    	"ACE_Humanitarian_Ration",
	    	"ACE_MRE_BeefStew",
	    	"ACE_MRE_ChickenTikkaMasala",
	    	"ACE_MRE_ChickenHerbDumplings",
	    	"ACE_MRE_CreamChickenSoup",
	    	"ACE_MRE_CreamTomatoSoup",
	    	"ACE_MRE_LambCurry",
	    	"ACE_MRE_MeatballsPasta",
	    	"ACE_MRE_SteakVegetables",
	
	    	"ACE_personalAidKit",
	    	"ACE_surgicalKit",
	    	"ACE_adenosine",
	    	"ACE_atropine",  	 
	    	"ACE_epinephrine",
	    	"ACE_morphine",
	    	"ACE_fieldDressing",
	    	"ACE_elasticBandage",
	    	"ACE_quikclot",
	    	"ACE_packingBandage",
	    	"ACE_splint",
	    	"ACE_tourniquet",
	    	"ACE_bloodIV",
	    	"ACE_bloodIV_500",
	    	"ACE_bloodIV_250",
	    	"ACE_plasmaIV",
	    	"ACE_plasmaIV_500",
	    	"ACE_plasmaIV_250",
	    	"ACE_salineIV",
	    	"ACE_salineIV_500",
	    	"ACE_salineIV_250",
	    	"ACE_bodyBag"
	    	//"ACE_bodyBagObject", // 	Bodybag (packed)
	    };
    };
class food
    {
	    name = "Food";
	    items[]=
	    {
	    	"ACE_Can_Franta",
	    	"ACE_Can_RedGull",
	    	"ACE_Can_Spirit",
	    	"ACE_Canteen",
	    	"ACE_Canteen_Empty",
	    	"ACE_Canteen_Half",
	    	"ACE_WaterBottle",
	    	"ACE_WaterBottle_Empty",
	    	"ACE_WaterBottle_Half",

	    	"ACE_Humanitarian_Ration",
	    	"ACE_MRE_BeefStew",
	    	"ACE_MRE_ChickenTikkaMasala",
	    	"ACE_MRE_ChickenHerbDumplings",
	    	"ACE_MRE_CreamChickenSoup",
	    	"ACE_MRE_CreamTomatoSoup",
	    	"ACE_MRE_LambCurry",
	    	"ACE_MRE_MeatballsPasta",
	    	"ACE_MRE_SteakVegetables"
	    };
    };
class Health
    {
	    name = "Medical";
	    items[]=
	    {	
	    	"ACE_personalAidKit",
	    	"ACE_surgicalKit",
	    	"ACE_adenosine",
	    	"ACE_atropine",  	 
	    	"ACE_epinephrine",
	    	"ACE_morphine",
	    	"ACE_fieldDressing",
	    	"ACE_elasticBandage",
	    	"ACE_quikclot",
	    	"ACE_packingBandage",
	    	"ACE_splint",
	    	"ACE_tourniquet",
	    	"ACE_bloodIV",
	    	"ACE_bloodIV_500",
	    	"ACE_bloodIV_250",
	    	"ACE_plasmaIV",
	    	"ACE_plasmaIV_500",
	    	"ACE_plasmaIV_250",
	    	"ACE_salineIV",
	    	"ACE_salineIV_500",
	    	"ACE_salineIV_250",
	    	"ACE_bodyBag"
	    	//"ACE_bodyBagObject", // 	Bodybag (packed)
	    };
    };

class SpecOps
    {
	    name = "SpecOps";
	    items[]= //weapon specops //cfgWeapons
	    {	
			//"B_Respawn_Sleeping_bag_brown_F",
	    	"MineDetector",
			"I_UavTerminal",
			"ItemGPS",
			"Integrated_NVG_F",
			"NVGogglesB_grn_F",
			"UK3CB_BAF_Soflam_Laserdesignator",
			"Laserdesignator"
	    };
	    explo[]= //ammo specops //CfgMagazines
	    {	
	    	"DemoCharge_Remote_Mag",
			"SatchelCharge_Remote_Mag",
			"ClaymoreDirectionalMine_Remote_Mag"
	    };
	    grenades[]= //ammo specops  //CfgMagazines
	    {	
	    	"rhs_charge_tnt_x2_mag",
			"rhs_charge_sb3kg_mag",
			"rhs_grenade_sthgr24_x7bundle_mag"
	    };
		
    };
class SpecOps_RHS
    {
	    name = "SpecOps";
	    items[]= //weapon specops //cfgWeapons
	    {	
			//"B_Respawn_Sleeping_bag_brown_F", //BACKPACK
	    	"MineDetector",
			"I_UavTerminal",
			"ItemGPS",
			"Integrated_NVG_F",
			"NVGogglesB_grn_F",
			//"UK3CB_BAF_Soflam_Laserdesignator",
			"Laserdesignator"
	    };
	    explo[]= //ammo specops //CfgMagazines
	    {	
	    	"DemoCharge_Remote_Mag",
			"SatchelCharge_Remote_Mag",
			"ClaymoreDirectionalMine_Remote_Mag"
	    };
	    grenades[]= //ammo specops  //CfgMagazines
	    {	
			"rhs_mag_M441_HE", "rhs_mag_M433_HEDP", "rhs_mag_M397_HET", "1Rnd_HE_Grenade_shell",
			"rhs_VOG25", "rhs_VOG25p", "rhs_vg40tb",
	    	"rhs_charge_tnt_x2_mag",
			"rhs_charge_sb3kg_mag",
			"rhs_grenade_sthgr24_x7bundle_mag"
	    };
		
    };

