class CfgFunctions
{
	class WMS
	{
		class myCategory
		{
			file = "Fonctions";
			class buyAmmoOnBox {};
			class buyFromTrader {};
			class buyFromOffice {};
			class confLockUnlock {};
			class createPermanentVHL {};
			class findUIDinVhlArray {};
			class findVhlIDinVhlArray {};
			class generateHexaID {};
			class getCompatWeaponItems {};
			class displayKillStats {};
			class initTraderActions {};
			class initTraderActions_Weapons {};
			class initTraderActions_Equipement {};
			class initTraderActions_Office {};
			class initVehicleAddAction {};
			class playerKilled {};
			class processCargoDump {};
			class sellVehicles {};
			class setVarOnPlayerRespawn {};
			class spawnLootManager {};
			class updatePermanentVHL {};
			class CreateTerritory {};
			class SpawnCamps {};
			class initTraders {};
			class lockToTheGround {};
			class initFlagAddActions {};
			class rotateBaseObjects {};
			class initBaseRotationEngine {};
			class smallTransactions {};
			class territoryUpgrade {};
			class territoryLayoutActions {};
			class territoryLayoutUpgrade {};
			class territoryDelete {};
			class initContainerCargoDump {};
			class initTraderActions_SpecOps {};
			class permanentVehiclesLastUpdate {};
			class territoryUpdate {};
			class EmergencySupply {};
			class claimReward {};
			class rocketman {};
			class getOwnedPermanentVhls {};
			class HatchetCover {};
			class HatchetUnCover {};
			class weaponStationInitiate {};
			class vehicleCustomize {};
			class BaseSafetyPerimeter {};
			class saveRespawnData {};
			class deleteRespawnData {};

			class haloJump {};

			class chooseSupplyPos {}; //client
			class chooseTerritoryPos {}; //client
			class chooseHaloPos {}; //client
			class client_deathmarker {};
			class client_createBaseMarkers {};
			class client_markerOnPersonalVhls {};
			class client_saveRespawnData {};
			class client_retrieveRespawnData {};
			class client_restoreLoadoutFromVar {};
			class client_restoreAceFromVar {};
		};
		class myCategory_IP
		{
			file = "infantryProgram";
			class IP_ArtySupport {};
			class IP_BlackFishSupport {};
			class IP_C130_request {};
			class IP_ExtractionRequest {};
			class IP_GNDextractionRequest {};
			class IP_OpforVHL_radar {};

		};
	};
	#include "CHVD\CfgFunctions.hpp"
};