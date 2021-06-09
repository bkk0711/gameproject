#include <YSI\y_hooks>

hook OnGameModeInit() {
	
	print("[Streamer] Loading Dynamic Objects...");

	//CrateLoad = CreateDynamicObject(964,-2114.1, -1723.5, 11984.5, 0, 0, 337.994, .worldid = 0, .interiorid = 1, .streamdistance = 200); //object(cj_metal_crate) (1)
	//CrateLoad = CreateDynamicObject(964, -2136.05, -1573.24, 3550.00,0.00000000,0.00000000,180.00000000, .worldid = 0, .interiorid = 1, .streamdistance = 200); //object(cj_metal_crate) (1)
	CrateLoad[0] = CreateDynamicObject(964, 2701.17188, -2654.36353, 12.63166,   0.00000, 0.00000, 88.00000, .worldid = 0, .interiorid = 0, .streamdistance = 200); //object(cj_metal_crate) (1)	
	CrateLoad[1] = CreateDynamicObject(964, 2579.03467, 2811.95459, 9.82230,   0.00000, 0.00000, 176.93890, .worldid = 0, .interiorid = 0, .streamdistance = 200);

	new VIPLogo = CreateDynamicObject(19353, 1803.89, -1593.99, 14.05,   0.00, 0.00, 312.26);
	SetDynamicObjectMaterialText(VIPLogo, 0, "{842787}VIP", 90, "Impact", 56, 1, 0xFFFFFFFF, 0, 1);

	new FCTS = CreateDynamicObject(19482, -58.9155, -1118.4808, 7.4781, 0.0000, 0.0000, 160.3858);
	SetDynamicObjectMaterialText(FCTS, 0, "{880000}Dich vu keo xe County Flint", 110, "Impact", 40, 1, 0xFF000000, 0, 1);
    /* (ongamemodeinit) - LSPD stuff */
	eastlobby1 = CreateDynamicObject(1536,253.14941406,110.59960938,1002.21502686,0.00000000,0.00000000,270.00000000,-1,10,-1,100.0); // East lobby door (moves north)
	eastlobby2 = CreateDynamicObject(1536,253.18457031,107.59960938,1002.21502686,0.00000000,0.00000000,90.00000000,-1,10,-1,100.0); // East lobby door (moves south)
	westlobby1 = CreateDynamicObject(1536,239.71582031,116.09179688,1002.21502686,0.00000000,0.00000000,90.00000000,-1,10,-1,100.0); // West lobby door (moves north)
	westlobby2 = CreateDynamicObject(1536,239.67968750,119.09960938,1002.21502686,0.00000000,0.00000000,269.98901367,-1,10,-1,100.0); // West lobby door (moves south)
	locker1 = CreateDynamicObject(1536,267.29980469,112.56640625,1003.61718750,0.00000000,0.00000000,179.99450684,-1,10,-1,100.0); // Locker door (moves east)
	locker2 = CreateDynamicObject(1536,264.29980469,112.52929688,1003.61718750,0.00000000,0.00000000,0.00000000,-1,10,-1,100.0); // Locker door (moves west)
	cctv1 = CreateDynamicObject(1536,264.44921875,115.79980469,1003.61718750,0.00000000,0.00000000,0.00000000,-1,10,-1,100.0); // CCTV door (moves west)
	cctv2 = CreateDynamicObject(1536,267.46875000,115.83691406,1003.61718750,0.00000000,0.00000000,179.99450684,-1,10,-1,100.0); // CCTV door (moves east)
	chief1 = CreateDynamicObject(1536,229.59960938,119.50000000,1009.21875000,0.00000000,0.00000000,0.00000000,-1,10,-1,100.0); // innermost chief's door
	chief2 = CreateDynamicObject(1536,232.59960938,119.53515625,1009.21875000,0.00000000,0.00000000,179.99450684,-1,10,-1,100.0); // outermost chief's door (both move west)

	/* Noose Int Buttons End */
	sasd1A = CreateDynamicObject(1536,2511.65332031,-1697.00976562,561.79223633,0.00000000,0.00000000,0.00000000); //R6
	sasd1B = CreateDynamicObject(1536,2514.67211914,-1696.97485352,561.79223633,0.00000000,0.00000000,180.00000000); //object(gen_doorext15) (2)
 	sasd2A = CreateDynamicObject(1536,2516.87548828,-1697.01525879,561.79223633,0.00000000,0.00000000,0.00000000); //R5
	sasd2B = CreateDynamicObject(1536,2519.89257812,-1696.97509766,561.79223633,0.00000000,0.00000000,179.99450684); //object(gen_doorext15) (4)
	sasd3A = CreateDynamicObject(1536,2522.15600586,-1697.01550293,561.79223633,0.00000000,0.00000000,0.00000000); //R4
	sasd3B = CreateDynamicObject(1536,2525.15893555,-1696.98010254,561.79223633,0.00000000,0.00000000,179.99450684); //object(gen_doorext15) (6)
	sasd4A = CreateDynamicObject(1536,2511.84130859,-1660.08081055,561.79528809,0.00000000,0.00000000,0.00000000); //West
	sasd4B = CreateDynamicObject(1536,2514.81982422,-1660.04650879,561.80004883,0.00000000,0.00000000,180.00000000); //object(gen_doorext15) (1)
	sasd5A = CreateDynamicObject(1536,2522.86059570,-1660.07177734,561.80206299,0.00000000,0.00000000,179.99450684); //East
	sasd5B = CreateDynamicObject(1536,2519.84228516,-1660.10888672,561.80004883,0.00000000,0.00000000,0.00000000); //object(gen_doorext15) (1)

	lspddoor1 = CreateDynamicObject(1569, 246.35150146484, 72.547714233398, 1002.640625, 0.000000, 0.000000, 0.000000); //
	lspddoor2 = CreateDynamicObject(1569, 245.03300476074, 72.568511962891, 1002.640625, 0.000000, 0.000000, 0.000000); //

	DocCellRoomDoors[0] = CreateDynamicObject(1495, 568.36981, 1453.9955, 5999.47168,   0.00000, 0.00000, 270.00000); // cell block 1
	DocCellRoomDoors[1] = CreateDynamicObject(1495, 572.8498, 1453.9955, 5999.47168,   0.00000, 0.00000, 270.00000); // cell block 2
	DocCellRoomDoors[2] = CreateDynamicObject(1495, 585.77289, 1448.87915, 5999.45947,   0.00000, 0.00000, 90.00000); // showers
	DocCellRoomDoors[3] = CreateDynamicObject(1495, 553.98120, 1466.11426, 5999.44971,   0.00000, 0.00000, 0.00000); // cafe 1
	DocCellRoomDoors[4] = CreateDynamicObject(1495, 553.98169, 1474.47205, 5999.48877,   0.00000, 0.00000, 0.00000); // cafe 2
	DocCellRoomDoors[5] = CreateDynamicObject(1495, 583.51978, 1455.05212, 5999.47266,   0.00000, 0.00000, 0.00000); // laundry
	DocCellRoomDoors[6] = CreateDynamicObject(1495, 531.66589, 1428.00647, 10999.45703,   0.00000, 0.00000, 0.00000); // isolation
	DocCellRoomDoors[7] = CreateDynamicObject(1495, 566.54053, 1462.30774, 6003.41699,   0.00000, 0.00000, 0.00000); // control panel
	DocCellRoomDoors[8] = CreateDynamicObject(1569, 572.9866, 1447.5975, 5999.4727,   0.00000, 0.00000, 90.00000); // small control room
	DocCellRoomDoors[9] = CreateDynamicObject(1569, 597.01477, 1452.43774, 5999.44873,   0.00000, 0.00000, 90.00000); // processing 1
	DocCellRoomDoors[10] = CreateDynamicObject(1569, 599.12000, 1451.45422, 5999.47754,   0.00000, 0.00000, 0.00000); // processing 2
	DocCellRoomDoors[11] = CreateDynamicObject(1569, 589.21820, 1448.87537, 5999.46826,   0.00000, 0.00000, 90.00000); // processing 3
	DocCellRoomDoors[12] = CreateDynamicObject(1569, 579.57898, 1463.63379, 5999.46143,   0.00000, 0.00000, 90.00000); // classroom
	DocCellRoomDoors[13] = CreateDynamicObject(1569, 572.99377, 1468.63940, 5999.43994,   0.00000, 0.00000, 90.00000); // closet
	DocCellRoomDoors[14] = CreateDynamicObject(1569, 572.98419, 1434.65295, 5999.52295,   0.00000, 0.00000, 90.00000); // medward
	DocCellRoomDoors[15] = CreateDynamicObject(1569, 575.50751, 1461.82019, 5999.47168,   0.00000, 0.00000, 0.00000); // hallway
	DocCellRoomDoors[16] = CreateDynamicObject(1495, 526.92139, 1414.63281, 10999.45703,   0.00000, 0.00000, 270.00000); // lobby 1 
	DocCellRoomDoors[17] = CreateDynamicObject(1495, 529.96143, 1414.63281, 10999.45703,   0.00000, 0.00000, 270.00000); // lobby 2
	DocCellRoomDoors[18] = CreateDynamicObject(1495, 542.2069, 1417.86682, 10999.45703,   0.00000, 0.00000, 90.00000); // visitation

	DocCellsFloor1[0] = CreateDynamicObject(19302, 567.21069, 1445.88171, 6000.74609,   0.00000, 0.00000, 0.00000); // cell 1 - floor 1
	DocCellsFloor1[1] = CreateDynamicObject(19302, 563.58539, 1445.88171, 6000.74609,   0.00000, 0.00000, 0.00000); // cell 2 - floor 1
	DocCellsFloor1[2] = CreateDynamicObject(19302, 559.87738, 1445.88171, 6000.74609,   0.00000, 0.00000, 0.00000); // cell 3 - floor 1
	DocCellsFloor1[3] = CreateDynamicObject(19302, 556.21832, 1445.88171, 6000.74609,   0.00000, 0.00000, 0.00000); // cell 4 - floor 1
	DocCellsFloor1[4] = CreateDynamicObject(19302, 552.55121, 1445.88171, 6000.74609,   0.00000, 0.00000, 0.00000); // cell 5 - floor 1
	DocCellsFloor1[5] = CreateDynamicObject(19302, 548.86353, 1445.88171, 6000.74609,   0.00000, 0.00000, 0.00000); // cell 6 - floor 1
	DocCellsFloor1[6] = CreateDynamicObject(19302, 545.21039, 1445.86316, 6000.74609,   0.00000, 0.00000, 0.00000); // cell 7 - floor 1
	DocCellsFloor1[7] = CreateDynamicObject(19302, 542.56842, 1446.81152, 6000.74609,   0.00000, 0.00000, 270.00000); // cell 8 - floor 1
	DocCellsFloor1[8] = CreateDynamicObject(19302, 542.54321, 1450.46936, 6000.74609,   0.00000, 0.00000, 270.00000); // cell 9 - floor 1
	DocCellsFloor1[9] = CreateDynamicObject(19302, 542.55432, 1454.13354, 6000.74609,   0.00000, 0.00000, 270.00000); // cell 10 - floor 1
	DocCellsFloor1[10] = CreateDynamicObject(19302, 542.55432, 1457.79626, 6000.74609,   0.00000, 0.00000, 270.00000); // cell 11 - floor 1
	DocCellsFloor1[11] = CreateDynamicObject(19302, 543.48657, 1462.26819, 6000.74609,   0.00000, 0.00000, 180.00000); // cell 12 - floor 1
	DocCellsFloor1[12] = CreateDynamicObject(19302, 547.16162, 1462.26819, 6000.74609,   0.00000, 0.00000, 180.00000); // cell 13 - floor 1
	DocCellsFloor1[13] = CreateDynamicObject(19302, 550.84277, 1462.28821, 6000.74609,   0.00000, 0.00000, 180.00000); // cell 14 - floor 1
	DocCellsFloor1[14] = CreateDynamicObject(19302, 556.91632, 1462.26819, 6000.74609,   0.00000, 0.00000, 180.00000); // cell 15 - floor 1
	DocCellsFloor1[15] =  CreateDynamicObject(19302, 560.60620, 1462.26819, 6000.74609,   0.00000, 0.00000, 180.00000);  // cell 16 - floor 1
	DocCellsFloor2[0] = CreateDynamicObject(19302, 567.23071, 1445.88171, 6004.63135,   0.00000, 0.00000, 0.00000); // cell 1 - floor 2
	DocCellsFloor2[1] = CreateDynamicObject(19302, 563.58539, 1445.88171, 6004.63135,   0.00000, 0.00000, 0.00000); // cell 1 - floor 2
	DocCellsFloor2[2] = CreateDynamicObject(19302, 559.87738, 1445.88171, 6004.63135,   0.00000, 0.00000, 0.00000);  // cell 2 - floor 2
	DocCellsFloor2[3] = CreateDynamicObject(19302, 556.21832, 1445.88171, 6004.63135,   0.00000, 0.00000, 0.00000);  // cell 3 - floor 2
	DocCellsFloor2[4] = CreateDynamicObject(19302, 552.55121, 1445.88171, 6004.63135,   0.00000, 0.00000, 0.00000);  // cell 4 - floor 2
	DocCellsFloor2[5] = CreateDynamicObject(19302, 548.86353, 1445.88171, 6004.63135,   0.00000, 0.00000, 0.00000);  // cell 5 - floor 2
	DocCellsFloor2[6] = CreateDynamicObject(19302, 545.21039, 1445.86316, 6004.63135,   0.00000, 0.00000, 0.00000);  // cell 6 - floor 2
	DocCellsFloor2[7] = CreateDynamicObject(19302, 542.56842, 1446.81152, 6004.63135,   0.00000, 0.00000, 270.00000);  // cell 7 - floor 2
	DocCellsFloor2[8] = CreateDynamicObject(19302, 542.54321, 1450.46936, 6004.63135,   0.00000, 0.00000, 270.00000);  // cell 8 - floor 2
	DocCellsFloor2[9] = CreateDynamicObject(19302, 542.55432, 1454.13354, 6004.63135,   0.00000, 0.00000, 270.00000);  // cell 9 - floor 2
	DocCellsFloor2[10] = CreateDynamicObject(19302, 542.55432, 1457.79626, 6004.63135,   0.00000, 0.00000, 270.00000);  // cell 10 - floor 2
	DocCellsFloor2[11] = CreateDynamicObject(19302, 543.48657, 1462.26819, 6004.63135,   0.00000, 0.00000, 180.00000);  // cell 11 - floor 2
	DocCellsFloor2[12] = CreateDynamicObject(19302, 547.16162, 1462.26819, 6004.63135,   0.00000, 0.00000, 180.00000);  // cell 12 - floor 2
	DocCellsFloor2[13] = CreateDynamicObject(19302, 550.84277, 1462.28821, 6004.63135,   0.00000, 0.00000, 180.00000);  // cell 13 - floor 2
	DocCellsFloor2[14] = CreateDynamicObject(19302, 556.91632, 1462.26819, 6004.63135,   0.00000, 0.00000, 180.00000);  // cell 14 - floor 2
	
	// Gym dynamic objects (bmx parkour)
	BikeParkourObjects[0] = CreateDynamicObject(2669,2848.1015625,-2243.1552734,99.0883789,0.0000000,0.0000000,90.0000000, .worldid = 5, .streamdistance = 300); //object(cj_chris_crate) (1)
	//BikeParkourObjects[1] = CreateDynamicObject(1381,2847.4970703,-2243.1191406,4901.4877930,0.0000000,0.0000000,69.7851562, .worldid = -1, .streamdistance = 300); //object(magnocrane_04) (1)

    MoveDynamicObject(BikeParkourObjects[0], 2848.1015625, -2238.1552734, 99.0883789, 0.5, 0.0, 0.0, 90.0);
	//MoveDynamicObject(BikeParkourObjects[1], 2847.4970703, -2243.1191406, 4901.4877930, 0.5, 0.0, 0.0, 69.7851562);
	
	gFerrisWheel = CreateObject( 18877, gFerrisOrigin[0], gFerrisOrigin[1], gFerrisOrigin[2],
	  							 0.0, 0.0, -270.0, 300.0 );
	CreateObject( 18878, gFerrisOrigin[0], gFerrisOrigin[1], gFerrisOrigin[2],
	  							 0.0, 0.0, -270.0, 300.0 );
 	for(new x;x<10;x++)
    {
        gFerrisCages[x] = CreateObject( 19316, gFerrisOrigin[0], gFerrisOrigin[1], gFerrisOrigin[2],
	  							 0.0, 0.0, -270.0, 300.0 );

        AttachObjectToObject( gFerrisCages[x], gFerrisWheel,
							  gFerrisCageOffsets[x][0],
							  gFerrisCageOffsets[x][1],
	  						  gFerrisCageOffsets[x][2],
							  0.0, 0.0, -270.0, 0 );
	}
	
	//FDSA Static object ground
	CreateObject(8531, 1289.93, -2552.11, 13.34,   0.00, 0.00, 186.04);
	 
	//FDSA Static object roof
	CreateDynamicObject(19377, 1296.63, -2584.18, 16.73,   0.00, 90.00, 6.00, .worldid = 0, .streamdistance = 200);
	CreateDynamicObject(19377, 1301.41, -2578.00, 16.81,   0.00, 90.00, 6.00, .worldid = 0, .streamdistance = 200);
	
	//SFPD
	SFPDHighCMDDoor[0] = CreateDynamicObject(1536, -1578.19397, 702.29370, 18.64510,   0.00000, 0.00000, 0.00000, .streamdistance = 50); // Chief
	SFPDHighCMDDoor[1] = CreateDynamicObject(1536, -1578.26196, 696.84729, 18.64510,   0.00000, 0.00000, 0.00000, .streamdistance = 50); //Deputy Chief
	SFPDHighCMDDoor[2] = CreateDynamicObject(1536, -1587.77795, 697.84589, 18.64510,   0.00000, 0.00000, 0.00000, .streamdistance = 50); //Commander
	
	SFPDLobbyDoor[0] = CreateDynamicObject(1495, -1602.26709, 704.99298, 12.85020,   0.00000, 0.00000, -90.00000, .streamdistance = 50);
	SFPDLobbyDoor[1] = CreateDynamicObject(1495, -1598.17004, 702.68219, 12.85020,   0.00000, 0.00000, 0.00000, .streamdistance = 50);

	CreateDynamicObject(6922, 2551.58936, 112.29691, 28.16482,   0.00000, 0.00000, 90.00000); // New Robada DMV

	// SASD Interior doors.
	SASDDoors[0] = CreateDynamicObject(1495, 14.92530, 53.51950, 996.84857,   0.00000, 0.00000, 90.00000);
	SASDDoors[1] = CreateDynamicObject(1495, 8.70370, 57.32530, 991.03699,   0.00000, 0.00000, 270.00000);

	// Taxi LS
	new TaxiLS; 
    TaxiLS = CreateObject(5033, 1745.199951, -1882.849975, 26.140600, 0.000000, 0.000000, 0.000000, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 1736, "cj_ammo", "CJ_Black_metal", 0x00000000); 
    SetObjectMaterial(TaxiLS, 1, 10101, "2notherbuildsfe", "Bow_Abpave_Gen", 0x00000000); 
    SetObjectMaterial(TaxiLS, 2, 1736, "cj_ammo", "CJ_Black_metal", 0x00000000); 
    SetObjectMaterial(TaxiLS, 3, 7088, "casinoshops1", "hosp02_law", 0x00000000); 
    SetObjectMaterial(TaxiLS, 4, 10101, "2notherbuildsfe", "gz_vicdoor1", 0x00000000); 
    SetObjectMaterial(TaxiLS, 5, 7088, "casinoshops1", "fakestone1_LA", 0x00000000); 
    SetObjectMaterial(TaxiLS, 7, -1, "none", "none", 0xFF000000); 
    TaxiLS = CreateObject(970, 1774.322387, -1905.056274, 13.019184, 0.000000, 0.000000, 90.000000, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 4828, "airport3_las", "gnhotelwall02_128", 0x00000000); 
    SetObjectMaterial(TaxiLS, 1, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000); 
    SetObjectMaterial(TaxiLS, 2, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000); 
    SetObjectMaterial(TaxiLS, 3, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000); 
    SetObjectMaterial(TaxiLS, 4, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000); 
    SetObjectMaterial(TaxiLS, 5, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000); 
    TaxiLS = CreateObject(970, 1768.141113, -1907.136840, 13.019184, 0.000000, 0.000000, 0.000000, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 4828, "airport3_las", "gnhotelwall02_128", 0x00000000); 
    SetObjectMaterial(TaxiLS, 1, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000); 
    SetObjectMaterial(TaxiLS, 2, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000); 
    SetObjectMaterial(TaxiLS, 3, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000); 
    SetObjectMaterial(TaxiLS, 4, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000); 
    SetObjectMaterial(TaxiLS, 5, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000); 
    TaxiLS = CreateObject(970, 1772.262084, -1907.136840, 13.019184, 0.000000, 0.000000, 0.000000, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 4828, "airport3_las", "gnhotelwall02_128", 0x00000000); 
    SetObjectMaterial(TaxiLS, 1, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000); 
    SetObjectMaterial(TaxiLS, 2, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000); 
    SetObjectMaterial(TaxiLS, 3, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000); 
    SetObjectMaterial(TaxiLS, 4, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000); 
    SetObjectMaterial(TaxiLS, 5, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000); 
    TaxiLS = CreateObject(970, 1774.322387, -1899.735717, 13.019184, 0.000000, 0.000000, 90.000000, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 4828, "airport3_las", "gnhotelwall02_128", 0x00000000); 
    SetObjectMaterial(TaxiLS, 1, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000); 
    SetObjectMaterial(TaxiLS, 2, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000); 
    SetObjectMaterial(TaxiLS, 3, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000); 
    SetObjectMaterial(TaxiLS, 4, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000); 
    SetObjectMaterial(TaxiLS, 5, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000); 
    TaxiLS = CreateObject(970, 1774.322387, -1894.485839, 13.019184, 0.000000, 0.000000, 90.000000, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 4828, "airport3_las", "gnhotelwall02_128", 0x00000000); 
    SetObjectMaterial(TaxiLS, 1, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000); 
    SetObjectMaterial(TaxiLS, 2, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000); 
    SetObjectMaterial(TaxiLS, 3, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000); 
    SetObjectMaterial(TaxiLS, 4, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000); 
    SetObjectMaterial(TaxiLS, 5, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000); 
    TaxiLS = CreateObject(970, 1774.322387, -1889.165649, 13.019184, 0.000000, 0.000000, 90.000000, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 4828, "airport3_las", "gnhotelwall02_128", 0x00000000); 
    SetObjectMaterial(TaxiLS, 1, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000); 
    SetObjectMaterial(TaxiLS, 2, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000); 
    SetObjectMaterial(TaxiLS, 3, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000); 
    SetObjectMaterial(TaxiLS, 4, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000); 
    SetObjectMaterial(TaxiLS, 5, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000); 
    TaxiLS = CreateObject(970, 1774.322387, -1885.055541, 13.019184, 0.000000, 0.000000, 90.000000, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 4828, "airport3_las", "gnhotelwall02_128", 0x00000000); 
    SetObjectMaterial(TaxiLS, 1, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000); 
    SetObjectMaterial(TaxiLS, 2, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000); 
    SetObjectMaterial(TaxiLS, 3, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000); 
    SetObjectMaterial(TaxiLS, 4, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000); 
    SetObjectMaterial(TaxiLS, 5, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000); 
    TaxiLS = CreateObject(18981, 1799.154541, -1896.580932, 11.931986, 0.000000, 270.000000, 270.000000, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 9514, "711_sfw", "ws_carpark2", 0x00000000); 
    TaxiLS = CreateObject(18981, 1799.154541, -1921.539306, 11.931986, 0.000000, 270.000000, 270.000000, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 9514, "711_sfw", "ws_carpark2", 0x00000000); 
    TaxiLS = CreateObject(18981, 1799.154541, -1946.538818, 11.931986, 0.000000, 270.000000, 270.000000, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 9514, "711_sfw", "ws_carpark2", 0x00000000); 
    TaxiLS = CreateObject(18981, 1774.212158, -1946.538818, 11.931986, 0.000000, 270.000000, 270.000000, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 9514, "711_sfw", "ws_carpark2", 0x00000000); 
    TaxiLS = CreateObject(18981, 1774.161987, -1921.539306, 11.931986, 0.000000, 270.000000, 270.000000, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 9514, "711_sfw", "ws_carpark2", 0x00000000); 
    TaxiLS = CreateObject(18981, 1774.174804, -1896.580932, 11.931986, 0.000000, 270.000000, 270.000000, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 9514, "711_sfw", "ws_carpark2", 0x00000000); 
    TaxiLS = CreateObject(19417, 1810.048339, -1889.747070, 10.684058, 0.000000, 0.000000, 90.000000, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 18835, "mickytextures", "whiteforletters", 0x00000000); 
    TaxiLS = CreateObject(19417, 1806.849243, -1889.747070, 10.684058, 0.000000, 0.000000, 90.000000, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 18835, "mickytextures", "whiteforletters", 0x00000000); 
    TaxiLS = CreateObject(19417, 1803.637939, -1889.747070, 10.684058, 0.000007, 0.000000, 89.999977, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 18835, "mickytextures", "whiteforletters", 0x00000000); 
    TaxiLS = CreateObject(19417, 1800.438842, -1889.747070, 10.684058, 0.000007, 0.000000, 89.999977, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 18835, "mickytextures", "whiteforletters", 0x00000000); 
    TaxiLS = CreateObject(19417, 1797.249389, -1889.747070, 10.684058, 0.000007, 0.000000, 89.999977, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 18835, "mickytextures", "whiteforletters", 0x00000000); 
    TaxiLS = CreateObject(19417, 1794.059692, -1889.747070, 10.684058, 0.000007, 0.000000, 89.999977, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 18835, "mickytextures", "whiteforletters", 0x00000000); 
    TaxiLS = CreateObject(19417, 1790.868774, -1889.747070, 10.684058, 0.000007, 0.000000, 89.999977, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 18835, "mickytextures", "whiteforletters", 0x00000000); 
    TaxiLS = CreateObject(19417, 1787.668579, -1889.747070, 10.684058, 0.000007, 0.000000, 89.999977, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 18835, "mickytextures", "whiteforletters", 0x00000000); 
    TaxiLS = CreateObject(19417, 1784.468383, -1889.747070, 10.684058, 0.000007, 0.000000, 89.999977, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 18835, "mickytextures", "whiteforletters", 0x00000000); 
    TaxiLS = CreateObject(19417, 1781.258666, -1889.747070, 10.684058, 0.000007, 0.000000, 89.999977, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 18835, "mickytextures", "whiteforletters", 0x00000000); 
    TaxiLS = CreateObject(19417, 1779.578491, -1891.256347, 10.684058, 0.000007, 0.000000, 179.999969, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 18835, "mickytextures", "whiteforletters", 0x00000000); 
    TaxiLS = CreateObject(19417, 1779.578491, -1894.446655, 10.684058, 0.000007, 0.000000, 179.999969, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 18835, "mickytextures", "whiteforletters", 0x00000000); 
    TaxiLS = CreateObject(19417, 1779.578491, -1897.646972, 10.684058, 0.000007, 0.000000, 179.999969, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 18835, "mickytextures", "whiteforletters", 0x00000000); 
    TaxiLS = CreateObject(19417, 1779.578491, -1900.836425, 10.684058, 0.000007, 0.000000, 179.999969, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 18835, "mickytextures", "whiteforletters", 0x00000000); 
    TaxiLS = CreateObject(19417, 1779.578491, -1903.996459, 10.684058, 0.000007, 0.000000, 179.999969, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 18835, "mickytextures", "whiteforletters", 0x00000000); 
    TaxiLS = CreateObject(19417, 1779.578491, -1907.166625, 10.684058, 0.000007, 0.000000, 179.999969, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 18835, "mickytextures", "whiteforletters", 0x00000000); 
    TaxiLS = CreateObject(19417, 1779.578491, -1910.346313, 10.684058, 0.000007, 0.000000, 179.999969, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 18835, "mickytextures", "whiteforletters", 0x00000000); 
    TaxiLS = CreateObject(19417, 1779.578491, -1913.537109, 10.684058, 0.000007, 0.000000, 179.999969, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 18835, "mickytextures", "whiteforletters", 0x00000000); 
    TaxiLS = CreateObject(19417, 1779.578491, -1916.737182, 10.684058, 0.000007, 0.000000, 179.999969, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 18835, "mickytextures", "whiteforletters", 0x00000000); 
    TaxiLS = CreateObject(19417, 1779.578491, -1919.927612, 10.684058, 0.000007, 0.000000, 179.999969, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 18835, "mickytextures", "whiteforletters", 0x00000000); 
    TaxiLS = CreateObject(19417, 1779.578491, -1923.127441, 10.684058, 0.000007, 0.000000, 179.999969, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 18835, "mickytextures", "whiteforletters", 0x00000000); 
    TaxiLS = CreateObject(19417, 1779.578491, -1926.328247, 10.684058, 0.000007, 0.000000, 179.999969, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 18835, "mickytextures", "whiteforletters", 0x00000000); 
    TaxiLS = CreateObject(19417, 1781.268432, -1927.849243, 10.684058, 0.000007, 0.000000, 269.999969, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 18835, "mickytextures", "whiteforletters", 0x00000000); 
    TaxiLS = CreateObject(19417, 1784.468139, -1927.849243, 10.684058, 0.000007, 0.000000, 269.999969, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 18835, "mickytextures", "whiteforletters", 0x00000000); 
    TaxiLS = CreateObject(19417, 1787.658325, -1927.849243, 10.684058, 0.000007, 0.000000, 269.999969, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 18835, "mickytextures", "whiteforletters", 0x00000000); 
    TaxiLS = CreateObject(19417, 1790.857910, -1927.849243, 10.684058, 0.000007, 0.000000, 269.999969, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 18835, "mickytextures", "whiteforletters", 0x00000000); 
    TaxiLS = CreateObject(19417, 1793.968139, -1927.849243, 10.684058, 0.000007, 0.000000, 269.999969, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 18835, "mickytextures", "whiteforletters", 0x00000000); 
    TaxiLS = CreateObject(19417, 1796.807739, -1927.849243, 10.684058, 0.000007, 0.000000, 269.999969, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 18835, "mickytextures", "whiteforletters", 0x00000000); 
    TaxiLS = CreateObject(19417, 1798.328979, -1926.189331, 10.684058, 0.000007, 0.000000, 359.999969, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 18835, "mickytextures", "whiteforletters", 0x00000000); 
    TaxiLS = CreateObject(19417, 1798.328979, -1922.976928, 10.684058, 0.000007, 0.000000, 359.999969, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 18835, "mickytextures", "whiteforletters", 0x00000000); 
    TaxiLS = CreateObject(19417, 1798.328979, -1919.806518, 10.684058, 0.000007, 0.000000, 359.999969, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 18835, "mickytextures", "whiteforletters", 0x00000000); 
    TaxiLS = CreateObject(19417, 1798.328979, -1916.604614, 10.684058, 0.000007, 0.000000, 359.999969, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 18835, "mickytextures", "whiteforletters", 0x00000000); 
    TaxiLS = CreateObject(19417, 1798.328979, -1913.423706, 10.684058, 0.000007, 0.000000, 359.999969, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 18835, "mickytextures", "whiteforletters", 0x00000000); 
    TaxiLS = CreateObject(19417, 1798.328979, -1910.221435, 10.684058, 0.000007, 0.000000, 359.999969, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 18835, "mickytextures", "whiteforletters", 0x00000000); 
    TaxiLS = CreateObject(19417, 1798.328979, -1907.031494, 10.684058, 0.000007, 0.000000, 359.999969, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 18835, "mickytextures", "whiteforletters", 0x00000000); 
    TaxiLS = CreateObject(19417, 1798.328979, -1903.850708, 10.684058, 0.000007, 0.000000, 359.999969, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 18835, "mickytextures", "whiteforletters", 0x00000000); 
    TaxiLS = CreateObject(19417, 1798.328979, -1900.669555, 10.684058, 0.000007, 0.000000, 359.999969, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 18835, "mickytextures", "whiteforletters", 0x00000000); 
    TaxiLS = CreateObject(19417, 1798.328979, -1897.499267, 10.684058, 0.000007, 0.000000, 359.999969, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 18835, "mickytextures", "whiteforletters", 0x00000000); 
    TaxiLS = CreateObject(19417, 1798.328979, -1894.299438, 10.684058, 0.000007, 0.000000, 359.999969, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 18835, "mickytextures", "whiteforletters", 0x00000000); 
    TaxiLS = CreateObject(19417, 1798.328979, -1891.289672, 10.684058, 0.000007, 0.000000, 359.999969, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 18835, "mickytextures", "whiteforletters", 0x00000000); 
    TaxiLS = CreateObject(19417, 1808.918212, -1891.397338, 10.684058, 0.000000, 0.000000, 180.000000, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 18835, "mickytextures", "whiteforletters", 0x00000000); 
    TaxiLS = CreateObject(19417, 1808.918212, -1894.567382, 10.684058, 0.000000, 0.000000, 180.000000, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 18835, "mickytextures", "whiteforletters", 0x00000000); 
    TaxiLS = CreateObject(19417, 1808.918823, -1888.067016, 10.684058, 0.000000, 0.000000, 180.000000, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 18835, "mickytextures", "whiteforletters", 0x00000000); 
    TaxiLS = CreateObject(19417, 1808.918823, -1884.866943, 10.684058, 0.000000, 0.000000, 180.000000, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 18835, "mickytextures", "whiteforletters", 0x00000000); 
    TaxiLS = CreateObject(19417, 1811.578979, -1884.866943, 10.684058, 0.000000, 0.000000, 180.000000, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 18835, "mickytextures", "whiteforletters", 0x00000000); 
    TaxiLS = CreateObject(19417, 1811.578979, -1888.066894, 10.684058, 0.000000, 0.000000, 180.000000, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 18835, "mickytextures", "whiteforletters", 0x00000000); 
    TaxiLS = CreateObject(19417, 1811.578979, -1891.257324, 10.684058, 0.000000, 0.000000, 180.000000, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 18835, "mickytextures", "whiteforletters", 0x00000000); 
    TaxiLS = CreateObject(19417, 1811.578979, -1894.437255, 10.684058, 0.000000, 0.000000, 180.000000, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 18835, "mickytextures", "whiteforletters", 0x00000000); 
    TaxiLS = CreateObject(19417, 1796.446411, -1920.503784, 10.681977, 0.000000, 0.000000, 0.000000, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000); 
    TaxiLS = CreateObject(19417, 1796.446411, -1917.333374, 10.681977, 0.000000, 0.000000, 0.000000, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000); 
    TaxiLS = CreateObject(19417, 1796.446411, -1914.123168, 10.681977, 0.000000, 0.000000, 0.000000, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000); 
    TaxiLS = CreateObject(19417, 1796.446411, -1910.932373, 10.681977, 0.000000, 0.000000, 0.000000, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000); 
    TaxiLS = CreateObject(19417, 1796.446411, -1907.761230, 10.681977, 0.000000, 0.000000, 0.000000, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000); 
    TaxiLS = CreateObject(19417, 1796.446411, -1904.570922, 10.681977, 0.000000, 0.000000, 0.000000, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000); 
    TaxiLS = CreateObject(19417, 1794.766357, -1903.051025, 10.681977, 0.000000, 0.000000, 90.000000, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000); 
    TaxiLS = CreateObject(19417, 1791.586181, -1903.051025, 10.681977, 0.000000, 0.000000, 90.000000, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000); 
    TaxiLS = CreateObject(19417, 1788.435668, -1903.051025, 10.681977, 0.000000, 0.000000, 90.000000, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000); 
    TaxiLS = CreateObject(19417, 1786.805175, -1904.561279, 10.681977, 0.000000, 0.000000, 180.000000, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000); 
    TaxiLS = CreateObject(19417, 1786.805175, -1907.762695, 10.681977, 0.000000, 0.000000, 180.000000, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000); 
    TaxiLS = CreateObject(19417, 1786.805175, -1910.973144, 10.681977, 0.000000, 0.000000, 180.000000, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000); 
    TaxiLS = CreateObject(19417, 1786.805175, -1914.163574, 10.681977, 0.000000, 0.000000, 180.000000, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000); 
    TaxiLS = CreateObject(19417, 1786.805175, -1917.373657, 10.681977, 0.000000, 0.000000, 180.000000, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000); 
    TaxiLS = CreateObject(19417, 1786.805175, -1920.473876, 10.681977, 0.000000, 0.000000, 180.000000, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000); 
    TaxiLS = CreateObject(19417, 1788.335571, -1921.994873, 10.681977, 0.000000, 0.000000, 450.000000, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000); 
    TaxiLS = CreateObject(19417, 1791.534912, -1921.994873, 10.681977, 0.000000, 0.000000, 450.000000, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000); 
    TaxiLS = CreateObject(19417, 1794.705810, -1921.994873, 10.681977, 0.000000, 0.000000, 450.000000, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000); 
    TaxiLS = CreateObject(19417, 1794.875976, -1921.994873, 10.681977, 0.000000, 0.000000, 450.000000, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000); 
    TaxiLS = CreateObject(19417, 1796.283935, -1920.344970, 10.831980, 0.000000, 0.000000, 0.000000, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000); 
    TaxiLS = CreateObject(19417, 1796.283935, -1917.234985, 10.831980, 0.000000, 0.000000, 0.000000, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000); 
    TaxiLS = CreateObject(19417, 1796.283935, -1914.035034, 10.831980, 0.000000, 0.000000, 0.000000, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000); 
    TaxiLS = CreateObject(19417, 1796.283935, -1910.904541, 10.831980, 0.000000, 0.000000, 0.000000, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000); 
    TaxiLS = CreateObject(19417, 1796.283935, -1907.744506, 10.831980, 0.000000, 0.000000, 0.000000, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000); 
    TaxiLS = CreateObject(19417, 1796.283935, -1904.684814, 10.831980, 0.000000, 0.000000, 0.000000, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000); 
    TaxiLS = CreateObject(19417, 1794.753295, -1903.194580, 10.851982, 0.000000, 0.000000, 90.000000, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000); 
    TaxiLS = CreateObject(19417, 1791.604125, -1903.194580, 10.851982, 0.000000, 0.000000, 90.000000, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000); 
    TaxiLS = CreateObject(19417, 1788.474365, -1903.194580, 10.851982, 0.000000, 0.000000, 90.000000, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000); 
    TaxiLS = CreateObject(19417, 1786.973266, -1904.854736, 10.851982, 0.000000, 0.000000, 180.000000, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000); 
    TaxiLS = CreateObject(19417, 1786.973266, -1908.024658, 10.851982, 0.000000, 0.000000, 180.000000, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000); 
    TaxiLS = CreateObject(19417, 1786.973266, -1911.214721, 10.851982, 0.000000, 0.000000, 180.000000, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000); 
    TaxiLS = CreateObject(19417, 1786.973266, -1914.345092, 10.851982, 0.000000, 0.000000, 180.000000, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000); 
    TaxiLS = CreateObject(19417, 1786.973266, -1917.504882, 10.851982, 0.000000, 0.000000, 180.000000, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000); 
    TaxiLS = CreateObject(19417, 1786.973266, -1920.314453, 10.851982, 0.000000, 0.000000, 180.000000, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000); 
    TaxiLS = CreateObject(19417, 1788.612915, -1921.824707, 10.851982, 0.000000, 0.000000, 270.000000, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000); 
    TaxiLS = CreateObject(19417, 1791.742919, -1921.824707, 10.851982, 0.000000, 0.000000, 270.000000, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000); 
    TaxiLS = CreateObject(19417, 1794.612426, -1921.824707, 10.851982, 0.000000, 0.000000, 270.000000, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000); 
    TaxiLS = CreateObject(19426, 1794.474487, -1920.945556, 12.431986, 0.000000, 270.000000, 0.000000, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 10765, "airportgnd_sfse", "desgreengrass", 0x00000000); 
    TaxiLS = CreateObject(19426, 1790.974365, -1920.945556, 12.431986, 0.000000, 270.000000, 0.000000, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 10765, "airportgnd_sfse", "desgreengrass", 0x00000000); 
    TaxiLS = CreateObject(19426, 1788.664306, -1920.945556, 12.421986, 0.000000, 270.000000, 0.000000, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 10765, "airportgnd_sfse", "desgreengrass", 0x00000000); 
    TaxiLS = CreateObject(19426, 1794.474487, -1919.345581, 12.431986, 0.000000, 270.000000, 0.000000, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 10765, "airportgnd_sfse", "desgreengrass", 0x00000000); 
    TaxiLS = CreateObject(19426, 1790.974365, -1919.345581, 12.431986, 0.000000, 270.000000, 0.000000, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 10765, "airportgnd_sfse", "desgreengrass", 0x00000000); 
    TaxiLS = CreateObject(19426, 1788.664306, -1919.345581, 12.421986, 0.000000, 270.000000, 0.000000, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 10765, "airportgnd_sfse", "desgreengrass", 0x00000000); 
    TaxiLS = CreateObject(19426, 1794.474487, -1917.755249, 12.431986, 0.000000, 270.000000, 0.000000, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 10765, "airportgnd_sfse", "desgreengrass", 0x00000000); 
    TaxiLS = CreateObject(19426, 1790.974365, -1917.755249, 12.431986, 0.000000, 270.000000, 0.000000, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 10765, "airportgnd_sfse", "desgreengrass", 0x00000000); 
    TaxiLS = CreateObject(19426, 1788.664306, -1917.755249, 12.421986, 0.000000, 270.000000, 0.000000, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 10765, "airportgnd_sfse", "desgreengrass", 0x00000000); 
    TaxiLS = CreateObject(19426, 1794.474487, -1916.155273, 12.431986, 0.000000, 270.000000, 0.000000, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 10765, "airportgnd_sfse", "desgreengrass", 0x00000000); 
    TaxiLS = CreateObject(19426, 1790.974365, -1916.155273, 12.431986, 0.000000, 270.000000, 0.000000, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 10765, "airportgnd_sfse", "desgreengrass", 0x00000000); 
    TaxiLS = CreateObject(19426, 1788.664306, -1916.155273, 12.421986, 0.000000, 270.000000, 0.000000, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 10765, "airportgnd_sfse", "desgreengrass", 0x00000000); 
    TaxiLS = CreateObject(19426, 1794.474487, -1914.554321, 12.431986, 0.000000, 270.000000, 0.000000, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 10765, "airportgnd_sfse", "desgreengrass", 0x00000000); 
    TaxiLS = CreateObject(19426, 1790.974365, -1914.554321, 12.431986, 0.000000, 270.000000, 0.000000, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 10765, "airportgnd_sfse", "desgreengrass", 0x00000000); 
    TaxiLS = CreateObject(19426, 1788.664306, -1914.554321, 12.421986, 0.000000, 270.000000, 0.000000, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 10765, "airportgnd_sfse", "desgreengrass", 0x00000000); 
    TaxiLS = CreateObject(19426, 1794.474487, -1912.954345, 12.431986, 0.000000, 270.000000, 0.000000, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 10765, "airportgnd_sfse", "desgreengrass", 0x00000000); 
    TaxiLS = CreateObject(19426, 1790.974365, -1912.954345, 12.431986, 0.000000, 270.000000, 0.000000, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 10765, "airportgnd_sfse", "desgreengrass", 0x00000000); 
    TaxiLS = CreateObject(19426, 1788.664306, -1912.954345, 12.421986, 0.000000, 270.000000, 0.000000, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 10765, "airportgnd_sfse", "desgreengrass", 0x00000000); 
    TaxiLS = CreateObject(19426, 1794.474487, -1911.353515, 12.431986, 0.000000, 270.000000, 0.000000, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 10765, "airportgnd_sfse", "desgreengrass", 0x00000000); 
    TaxiLS = CreateObject(19426, 1790.974365, -1911.353515, 12.431986, 0.000000, 270.000000, 0.000000, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 10765, "airportgnd_sfse", "desgreengrass", 0x00000000); 
    TaxiLS = CreateObject(19426, 1788.664306, -1911.353515, 12.421986, 0.000000, 270.000000, 0.000000, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 10765, "airportgnd_sfse", "desgreengrass", 0x00000000); 
    TaxiLS = CreateObject(19426, 1794.474487, -1909.753540, 12.431986, 0.000000, 270.000000, 0.000000, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 10765, "airportgnd_sfse", "desgreengrass", 0x00000000); 
    TaxiLS = CreateObject(19426, 1790.974365, -1909.753540, 12.431986, 0.000000, 270.000000, 0.000000, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 10765, "airportgnd_sfse", "desgreengrass", 0x00000000); 
    TaxiLS = CreateObject(19426, 1788.664306, -1909.753540, 12.421986, 0.000000, 270.000000, 0.000000, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 10765, "airportgnd_sfse", "desgreengrass", 0x00000000); 
    TaxiLS = CreateObject(19426, 1794.474487, -1908.152954, 12.431986, 0.000000, 270.000000, 0.000000, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 10765, "airportgnd_sfse", "desgreengrass", 0x00000000); 
    TaxiLS = CreateObject(19426, 1790.974365, -1908.152954, 12.431986, 0.000000, 270.000000, 0.000000, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 10765, "airportgnd_sfse", "desgreengrass", 0x00000000); 
    TaxiLS = CreateObject(19426, 1788.664306, -1908.152954, 12.421986, 0.000000, 270.000000, 0.000000, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 10765, "airportgnd_sfse", "desgreengrass", 0x00000000); 
    TaxiLS = CreateObject(19426, 1794.474487, -1906.552978, 12.431986, 0.000000, 270.000000, 0.000000, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 10765, "airportgnd_sfse", "desgreengrass", 0x00000000); 
    TaxiLS = CreateObject(19426, 1790.974365, -1906.552978, 12.431986, 0.000000, 270.000000, 0.000000, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 10765, "airportgnd_sfse", "desgreengrass", 0x00000000); 
    TaxiLS = CreateObject(19426, 1788.664306, -1906.552978, 12.421986, 0.000000, 270.000000, 0.000000, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 10765, "airportgnd_sfse", "desgreengrass", 0x00000000); 
    TaxiLS = CreateObject(19426, 1794.474487, -1904.982788, 12.431986, 0.000000, 270.000000, 0.000000, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 10765, "airportgnd_sfse", "desgreengrass", 0x00000000); 
    TaxiLS = CreateObject(19426, 1790.974365, -1904.982788, 12.431986, 0.000000, 270.000000, 0.000000, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 10765, "airportgnd_sfse", "desgreengrass", 0x00000000); 
    TaxiLS = CreateObject(19426, 1788.664306, -1904.982788, 12.421986, 0.000000, 270.000000, 0.000000, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 10765, "airportgnd_sfse", "desgreengrass", 0x00000000); 
    TaxiLS = CreateObject(19426, 1794.474487, -1903.952392, 12.431986, 0.000000, 270.000000, 0.000000, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 10765, "airportgnd_sfse", "desgreengrass", 0x00000000); 
    TaxiLS = CreateObject(19426, 1790.974365, -1903.952392, 12.431986, 0.000000, 270.000000, 0.000000, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 10765, "airportgnd_sfse", "desgreengrass", 0x00000000); 
    TaxiLS = CreateObject(19426, 1788.664306, -1903.952392, 12.421986, 0.000000, 270.000000, 0.000000, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 10765, "airportgnd_sfse", "desgreengrass", 0x00000000); 
    TaxiLS = CreateObject(970, 1796.294799, -1905.426513, 12.259178, 0.000000, 0.000000, 90.000000, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 4828, "airport3_las", "gnhotelwall02_128", 0x00000000); 
    SetObjectMaterial(TaxiLS, 1, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000); 
    SetObjectMaterial(TaxiLS, 2, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000); 
    SetObjectMaterial(TaxiLS, 3, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000); 
    SetObjectMaterial(TaxiLS, 4, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000); 
    SetObjectMaterial(TaxiLS, 5, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000); 
    TaxiLS = CreateObject(970, 1796.294799, -1909.546386, 12.259178, 0.000000, 0.000000, 90.000000, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 4828, "airport3_las", "gnhotelwall02_128", 0x00000000); 
    SetObjectMaterial(TaxiLS, 1, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000); 
    SetObjectMaterial(TaxiLS, 2, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000); 
    SetObjectMaterial(TaxiLS, 3, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000); 
    SetObjectMaterial(TaxiLS, 4, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000); 
    SetObjectMaterial(TaxiLS, 5, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000); 
    TaxiLS = CreateObject(970, 1796.294799, -1913.666381, 12.259178, 0.000000, 0.000000, 90.000000, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 4828, "airport3_las", "gnhotelwall02_128", 0x00000000); 
    SetObjectMaterial(TaxiLS, 1, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000); 
    SetObjectMaterial(TaxiLS, 2, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000); 
    SetObjectMaterial(TaxiLS, 3, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000); 
    SetObjectMaterial(TaxiLS, 4, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000); 
    SetObjectMaterial(TaxiLS, 5, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000); 
    TaxiLS = CreateObject(970, 1796.294799, -1917.787109, 12.259178, 0.000000, 0.000000, 90.000000, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 4828, "airport3_las", "gnhotelwall02_128", 0x00000000); 
    SetObjectMaterial(TaxiLS, 1, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000); 
    SetObjectMaterial(TaxiLS, 2, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000); 
    SetObjectMaterial(TaxiLS, 3, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000); 
    SetObjectMaterial(TaxiLS, 4, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000); 
    SetObjectMaterial(TaxiLS, 5, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000); 
    TaxiLS = CreateObject(970, 1796.294799, -1919.767578, 12.259178, 0.000000, 0.000000, 90.000000, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 4828, "airport3_las", "gnhotelwall02_128", 0x00000000); 
    SetObjectMaterial(TaxiLS, 1, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000); 
    SetObjectMaterial(TaxiLS, 2, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000); 
    SetObjectMaterial(TaxiLS, 3, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000); 
    SetObjectMaterial(TaxiLS, 4, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000); 
    SetObjectMaterial(TaxiLS, 5, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000); 
    TaxiLS = CreateObject(970, 1794.013916, -1921.807739, 12.279177, 0.000000, 0.000000, 180.000000, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 4828, "airport3_las", "gnhotelwall02_128", 0x00000000); 
    SetObjectMaterial(TaxiLS, 1, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000); 
    SetObjectMaterial(TaxiLS, 2, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000); 
    SetObjectMaterial(TaxiLS, 3, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000); 
    SetObjectMaterial(TaxiLS, 4, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000); 
    SetObjectMaterial(TaxiLS, 5, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000); 
    TaxiLS = CreateObject(970, 1789.883544, -1921.807739, 12.279177, 0.000000, 0.000000, 180.000000, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 4828, "airport3_las", "gnhotelwall02_128", 0x00000000); 
    SetObjectMaterial(TaxiLS, 1, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000); 
    SetObjectMaterial(TaxiLS, 2, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000); 
    SetObjectMaterial(TaxiLS, 3, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000); 
    SetObjectMaterial(TaxiLS, 4, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000); 
    SetObjectMaterial(TaxiLS, 5, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000); 
    TaxiLS = CreateObject(970, 1789.252929, -1921.807739, 12.279177, 0.000000, 0.000000, 180.000000, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 4828, "airport3_las", "gnhotelwall02_128", 0x00000000); 
    SetObjectMaterial(TaxiLS, 1, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000); 
    SetObjectMaterial(TaxiLS, 2, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000); 
    SetObjectMaterial(TaxiLS, 3, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000); 
    SetObjectMaterial(TaxiLS, 4, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000); 
    SetObjectMaterial(TaxiLS, 5, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000); 
    TaxiLS = CreateObject(970, 1786.982543, -1919.597167, 12.279177, 0.000000, 0.000000, 270.000000, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 4828, "airport3_las", "gnhotelwall02_128", 0x00000000); 
    SetObjectMaterial(TaxiLS, 1, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000); 
    SetObjectMaterial(TaxiLS, 2, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000); 
    SetObjectMaterial(TaxiLS, 3, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000); 
    SetObjectMaterial(TaxiLS, 4, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000); 
    SetObjectMaterial(TaxiLS, 5, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000); 
    TaxiLS = CreateObject(970, 1786.982543, -1915.466918, 12.279177, 0.000000, 0.000000, 270.000000, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 4828, "airport3_las", "gnhotelwall02_128", 0x00000000); 
    SetObjectMaterial(TaxiLS, 1, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000); 
    SetObjectMaterial(TaxiLS, 2, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000); 
    SetObjectMaterial(TaxiLS, 3, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000); 
    SetObjectMaterial(TaxiLS, 4, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000); 
    SetObjectMaterial(TaxiLS, 5, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000); 
    TaxiLS = CreateObject(970, 1786.982543, -1911.347167, 12.279177, 0.000000, 0.000000, 270.000000, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 4828, "airport3_las", "gnhotelwall02_128", 0x00000000); 
    SetObjectMaterial(TaxiLS, 1, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000); 
    SetObjectMaterial(TaxiLS, 2, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000); 
    SetObjectMaterial(TaxiLS, 3, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000); 
    SetObjectMaterial(TaxiLS, 4, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000); 
    SetObjectMaterial(TaxiLS, 5, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000); 
    TaxiLS = CreateObject(970, 1786.982543, -1907.226440, 12.279177, 0.000000, 0.000000, 270.000000, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 4828, "airport3_las", "gnhotelwall02_128", 0x00000000); 
    SetObjectMaterial(TaxiLS, 1, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000); 
    SetObjectMaterial(TaxiLS, 2, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000); 
    SetObjectMaterial(TaxiLS, 3, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000); 
    SetObjectMaterial(TaxiLS, 4, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000); 
    SetObjectMaterial(TaxiLS, 5, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000); 
    TaxiLS = CreateObject(970, 1786.982543, -1905.425781, 12.279177, 0.000000, 0.000000, 270.000000, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 4828, "airport3_las", "gnhotelwall02_128", 0x00000000); 
    SetObjectMaterial(TaxiLS, 1, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000); 
    SetObjectMaterial(TaxiLS, 2, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000); 
    SetObjectMaterial(TaxiLS, 3, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000); 
    SetObjectMaterial(TaxiLS, 4, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000); 
    SetObjectMaterial(TaxiLS, 5, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000); 
    TaxiLS = CreateObject(970, 1789.283325, -1903.255493, 12.279177, 0.000000, 0.000000, 360.000000, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 4828, "airport3_las", "gnhotelwall02_128", 0x00000000); 
    SetObjectMaterial(TaxiLS, 1, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000); 
    SetObjectMaterial(TaxiLS, 2, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000); 
    SetObjectMaterial(TaxiLS, 3, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000); 
    SetObjectMaterial(TaxiLS, 4, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000); 
    SetObjectMaterial(TaxiLS, 5, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000); 
    TaxiLS = CreateObject(970, 1793.403808, -1903.255493, 12.279177, 0.000000, 0.000000, 360.000000, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 4828, "airport3_las", "gnhotelwall02_128", 0x00000000); 
    SetObjectMaterial(TaxiLS, 1, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000); 
    SetObjectMaterial(TaxiLS, 2, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000); 
    SetObjectMaterial(TaxiLS, 3, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000); 
    SetObjectMaterial(TaxiLS, 4, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000); 
    SetObjectMaterial(TaxiLS, 5, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000); 
    TaxiLS = CreateObject(970, 1794.024047, -1903.255493, 12.279177, 0.000000, 0.000000, 360.000000, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 4828, "airport3_las", "gnhotelwall02_128", 0x00000000); 
    SetObjectMaterial(TaxiLS, 1, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000); 
    SetObjectMaterial(TaxiLS, 2, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000); 
    SetObjectMaterial(TaxiLS, 3, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000); 
    SetObjectMaterial(TaxiLS, 4, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000); 
    SetObjectMaterial(TaxiLS, 5, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000); 
    TaxiLS = CreateObject(19417, 1775.918212, -1913.856811, 10.684058, 0.000007, 0.000000, 269.999969, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 18835, "mickytextures", "whiteforletters", 0x00000000); 
    TaxiLS = CreateObject(19417, 1777.528320, -1912.337646, 10.684058, 0.000007, 0.000000, 359.999969, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 18835, "mickytextures", "whiteforletters", 0x00000000); 
    TaxiLS = CreateObject(19417, 1777.528320, -1909.136596, 10.684058, 0.000007, 0.000000, 359.999969, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 18835, "mickytextures", "whiteforletters", 0x00000000); 
    TaxiLS = CreateObject(19417, 1777.528320, -1907.485839, 10.684058, 0.000007, 0.000000, 359.999969, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 18835, "mickytextures", "whiteforletters", 0x00000000); 
    TaxiLS = CreateObject(19417, 1775.858276, -1905.964477, 10.684058, 0.000007, 0.000000, 449.999969, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 18835, "mickytextures", "whiteforletters", 0x00000000); 
    TaxiLS = CreateObject(19483, 1776.418579, -1909.339477, 12.495524, 360.000000, -87.899993, 0.000000, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 10101, "2notherbuildsfe", "Bow_Abpave_Gen", 0x00000000); 
    SetObjectMaterialText(TaxiLS, "BUS", 0, 130, "Ariel", 199, 0, 0xFFFFFFFF, 0x00000000, 0); 
    TaxiLS = CreateObject(19417, 1775.918212, -1926.037719, 10.684058, 0.000007, 0.000000, 269.999969, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 18835, "mickytextures", "whiteforletters", 0x00000000); 
    TaxiLS = CreateObject(19417, 1777.608886, -1924.528076, 10.684058, 0.000007, 0.000000, 359.999969, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 18835, "mickytextures", "whiteforletters", 0x00000000); 
    TaxiLS = CreateObject(19417, 1777.608886, -1921.327514, 10.684058, 0.000007, 0.000000, 359.999969, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 18835, "mickytextures", "whiteforletters", 0x00000000); 
    TaxiLS = CreateObject(19417, 1777.608886, -1919.246093, 10.684058, 0.000007, 0.000000, 359.999969, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 18835, "mickytextures", "whiteforletters", 0x00000000); 
    TaxiLS = CreateObject(19417, 1776.098754, -1917.565551, 10.684058, 0.000007, 0.000000, 449.999969, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 18835, "mickytextures", "whiteforletters", 0x00000000); 
    TaxiLS = CreateObject(19417, 1772.898803, -1917.565551, 10.684058, 0.000007, 0.000000, 449.999969, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 18835, "mickytextures", "whiteforletters", 0x00000000); 
    TaxiLS = CreateObject(19483, 1776.418579, -1921.270141, 12.495524, 360.000000, -87.899993, 0.000000, 300.00); 
    SetObjectMaterial(TaxiLS, 0, 10101, "2notherbuildsfe", "Bow_Abpave_Gen", 0x00000000); 
    SetObjectMaterialText(TaxiLS, "BUS", 0, 130, "Ariel", 199, 0, 0xFFFFFFFF, 0x00000000, 0);

    //Sanews 
    new SaNews[358];
	SaNews[0] = CreateObject(19893, 786.0947, -1332.7447, 710.0371, 0.0000, 0.0000, -90.0000); //LaptopSAMP1
	SetObjectMaterial(SaNews[0], 1, 10765, "airportgnd_sfse", "white", 0xFFD78E10);
	SaNews[1] = CreateObject(3498, 787.6704, -1330.3199, 708.3530, 0.0000, 30.7999, 180.0000); //wdpillar01_lvs
	SetObjectMaterial(SaNews[1], 0, 3314, "ce_burbhouse", "black_128", 0x00000000);
	SetObjectMaterial(SaNews[1], 1, 3314, "ce_burbhouse", "black_128", 0x00000000);
	SaNews[2] = CreateObject(18753, 767.7476, -1362.5843, 708.7725, 0.0000, 0.0000, 0.0000); //Base125mx125m1
	SetObjectMaterial(SaNews[2], 0, 2423, "cj_ff_counters", "CJ_Laminate1", 0x00000000);
	SaNews[3] = CreateObject(1768, 799.6604, -1338.8889, 709.2672, 0.0000, 0.0000, -180.0000); //LOW_COUCH_3
	SetObjectMaterial(SaNews[3], 0, 1726, "mrk_couches2", "kb_sofa5_256", 0xFFFFF0F5);
	SetObjectMaterial(SaNews[3], 1, 10765, "airportgnd_sfse", "white", 0xFFFFF0F5);
	SetObjectMaterial(SaNews[3], 2, 10765, "airportgnd_sfse", "white", 0xFFFFF0F5);
	SaNews[4] = CreateObject(19375, 782.6774, -1334.7253, 711.1624, 0.0000, 0.0000, 0.0000); //wall023
	SetObjectMaterial(SaNews[4], 0, 6282, "beafron2_law2", "boardwalk2_la", 0x00000000);
	SaNews[5] = CreateObject(19375, 797.0170, -1310.7054, 711.1624, 0.0000, 0.0000, 90.0000); //wall023
	SetObjectMaterial(SaNews[5], 0, 6282, "beafron2_law2", "boardwalk2_la", 0xFFFFF0F5);
	SaNews[6] = CreateObject(19375, 782.6774, -1325.0969, 711.1624, 0.0000, 0.0000, 0.0000); //wall023
	SetObjectMaterial(SaNews[6], 0, 10765, "airportgnd_sfse", "white", 0xFFFFA500);
	SaNews[7] = CreateObject(19375, 782.6774, -1315.4858, 711.1624, 0.0000, 0.0000, 0.0000); //wall023
	SetObjectMaterial(SaNews[7], 0, 10765, "airportgnd_sfse", "white", 0xFFFFA500);
	SaNews[8] = CreateObject(19375, 787.4174, -1310.7054, 711.1624, 0.0000, 0.0000, 90.0000); //wall023
	SetObjectMaterial(SaNews[8], 0, 6282, "beafron2_law2", "boardwalk2_la", 0xFFFFF0F5);
	SaNews[9] = CreateObject(19464, 784.9838, -1332.8962, 712.2960, 0.0000, 90.0000, 0.0000); //wall104
	SetObjectMaterial(SaNews[9], 0, 14530, "estate2", "mp_bobbie_carpet", 0x00000000);
	SaNews[10] = CreateObject(18981, 789.3145, -1341.7829, 708.7907, 0.0000, 90.0000, 0.0000); //Concrete1mx25mx25m
	SetObjectMaterial(SaNews[10], 0, 3979, "civic01_lan", "sl_flagstone1", 0x00000000);
	SaNews[11] = CreateObject(19365, 790.7517, -1310.7065, 712.2968, 90.0000, 0.0000, 90.0000); //wall013
	SaNews[12] = CreateObject(19375, 801.6987, -1315.4858, 711.1624, 0.0000, 0.0000, 0.0000); //wall023
	SetObjectMaterial(SaNews[12], 0, 10765, "airportgnd_sfse", "white", 0xFFFFA500);
	SaNews[13] = CreateObject(19375, 801.6967, -1325.0958, 711.1624, 0.0000, 0.0000, 0.0000); //wall023
	SetObjectMaterial(SaNews[13], 0, 10765, "airportgnd_sfse", "white", 0xFFFFA500);
	SaNews[14] = CreateObject(19375, 801.7006, -1334.6665, 711.1624, 0.0000, 0.0000, 0.0000); //wall023
	SetObjectMaterial(SaNews[14], 0, 10765, "airportgnd_sfse", "white", 0xFFFFA500);
	SaNews[15] = CreateObject(19375, 797.0150, -1339.4250, 711.1624, 0.0000, 0.0000, 90.0000); //wall023
	SetObjectMaterial(SaNews[15], 0, 6282, "beafron2_law2", "boardwalk2_la", 0xFFFFF0F5);
	SaNews[16] = CreateObject(19375, 787.4367, -1339.4455, 711.1624, 0.0000, 0.0000, 90.0000); //wall023
	SetObjectMaterial(SaNews[16], 0, 6282, "beafron2_law2", "boardwalk2_la", 0xFFFFF0F5);
	SaNews[17] = CreateObject(19786, 801.6978, -1336.8492, 711.8208, 0.0000, 0.0000, -90.0000); //LCDTVBig1
	SetObjectMaterial(SaNews[17], 0, 10765, "airportgnd_sfse", "white", 0xFFFFFFFF);
	SetObjectMaterial(SaNews[17], 1, 0, "INVALID", "INVALID", 0xFFFFFFFF);
	SaNews[18] = CreateObject(1698, 790.7957, -1337.9642, 709.3469, 0.0000, 0.0000, 0.0000); //Esc_step8
	SetObjectMaterial(SaNews[18], 0, 10765, "airportgnd_sfse", "white", 0xFF696969);
	SaNews[19] = CreateObject(19175, 801.5737, -1332.6506, 711.8107, 0.0000, 0.0000, -90.0000); //SAMPPicture4
	SetObjectMaterial(SaNews[19], 0, 11631, "mp_ranchcut", "CJ_PAINTING20", 0x00000000);
	SaNews[20] = CreateObject(1768, 801.1409, -1335.8293, 709.2672, 0.0000, 0.0000, -90.0000); //LOW_COUCH_3
	SetObjectMaterial(SaNews[20], 0, 1726, "mrk_couches2", "kb_sofa5_256", 0xFFFFF0F5);
	SetObjectMaterial(SaNews[20], 1, 10765, "airportgnd_sfse", "white", 0xFFFFF0F5);
	SetObjectMaterial(SaNews[20], 2, 10765, "airportgnd_sfse", "white", 0xFFFFF0F5);
	SaNews[21] = CreateObject(1768, 795.5399, -1338.8889, 709.2672, 0.0000, 0.0000, -180.0000); //LOW_COUCH_3
	SetObjectMaterial(SaNews[21], 0, 1726, "mrk_couches2", "kb_sofa5_256", 0xFFFFF0F5);
	SetObjectMaterial(SaNews[21], 1, 10765, "airportgnd_sfse", "white", 0xFFFFF0F5);
	SetObjectMaterial(SaNews[21], 2, 10765, "airportgnd_sfse", "white", 0xFFFFF0F5);
	SaNews[22] = CreateObject(2010, 800.7119, -1338.8586, 709.2506, 0.0000, 0.0000, 0.0000); //nu_plant3_ofc
	SaNews[23] = CreateObject(2010, 792.5214, -1338.8586, 709.2506, 0.0000, 0.0000, 0.0000); //nu_plant3_ofc
	SaNews[24] = CreateObject(19365, 794.2612, -1310.7364, 710.8261, 0.0000, 0.0000, 90.0000); //wall013
	SetObjectMaterialText(SaNews[24], "San Andreas", 0, 130, "Arial", 50, 1, 0xFFFFFFFF, 0x0, 1);
	SaNews[25] = CreateObject(19814, 796.0689, -1339.3385, 709.4547, 0.0000, 0.0000, 180.0000); //ElectricalOutlet2
	SaNews[26] = CreateObject(1808, 796.5725, -1339.1733, 709.2631, 0.0000, 0.0000, 180.0000); //CJ_WATERCOOLER2
	SaNews[27] = CreateObject(19365, 792.4509, -1310.7264, 711.6463, 0.0000, 0.0000, 90.0000); //wall013
	SetObjectMaterialText(SaNews[27], "&#252;", 0, 100, "Webdings", 150, 1, 0xFFFFFFFF, 0x0, 1);
	SaNews[28] = CreateObject(19814, 797.0595, -1339.3385, 709.4547, 0.0000, 0.0000, 180.0000); //ElectricalOutlet2
	SaNews[29] = CreateObject(19176, 801.5269, -1328.4499, 710.7666, 0.0000, 0.0000, -90.0000); //LSOffice1Door1
	SetObjectMaterial(SaNews[29], 0, 6000, "con_drivein", "drvin_door1", 0xFFFFF0F5);
	SaNews[30] = CreateObject(19786, 794.1160, -1310.6844, 712.3690, 0.0000, 0.0000, 0.0000); //LCDTVBig1
	SetObjectMaterial(SaNews[30], 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	SaNews[31] = CreateObject(19786, 790.7257, -1310.6844, 710.6790, 0.0000, 0.0000, 0.0000); //LCDTVBig1
	SetObjectMaterial(SaNews[31], 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	SetObjectMaterial(SaNews[31], 1, 9818, "ship_brijsfw", "ship_screen1sfw", 0x00000000);
	SaNews[32] = CreateObject(19611, 792.2219, -1313.9576, 708.6262, 0.0000, 0.0000, 0.0000); //MicrophoneStand1
	SaNews[33] = CreateObject(18764, 794.3743, -1313.2225, 706.8754, 0.0000, 0.0000, 0.0000); //Concrete5mx5mx5m
	SetObjectMaterial(SaNews[33], 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	SaNews[34] = CreateObject(18764, 790.7036, -1313.2225, 706.8754, 0.0000, 0.0000, 0.0000); //Concrete5mx5mx5m
	SetObjectMaterial(SaNews[34], 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	SaNews[35] = CreateObject(970, 787.1884, -1337.9344, 710.9097, 0.0000, 0.0000, 0.0000); //fencesmallb
	SetObjectMaterial(SaNews[35], 0, 8680, "chnatwnfnce", "ctmallfence", 0xFF000000);
	SaNews[36] = CreateObject(18762, 792.3129, -1314.1468, 709.5227, 0.0000, 90.0000, 0.0000); //Concrete1mx1mx5m
	SetObjectMaterial(SaNews[36], 0, 10765, "airportgnd_sfse", "white", 0xFFD3D3D3);
	SaNews[37] = CreateObject(19786, 794.6071, -1339.4392, 712.5709, 0.0000, 90.0000, -180.0000); //LCDTVBig1
	SetObjectMaterial(SaNews[37], 0, 10765, "airportgnd_sfse", "white", 0xFFFFA500);
	SetObjectMaterial(SaNews[37], 1, 7978, "vgssairport", "airportwindow02_128", 0x00000000);
	SaNews[38] = CreateObject(19786, 798.6478, -1339.4392, 712.5709, 0.0000, 90.0000, -180.0000); //LCDTVBig1
	SetObjectMaterial(SaNews[38], 0, 10765, "airportgnd_sfse", "white", 0xFFFFA500);
	SetObjectMaterial(SaNews[38], 1, 7978, "vgssairport", "airportwindow02_128", 0x00000000);
	SaNews[39] = CreateObject(19375, 794.8764, -1309.9648, 704.1320, 0.0000, 0.0000, 0.0000); //wall023
	SetObjectMaterial(SaNews[39], 0, 10765, "airportgnd_sfse", "white", 0xFFFFA500);
	SaNews[40] = CreateObject(19610, 792.2186, -1313.9842, 710.2465, 0.0000, 0.0000, 0.0000); //Microphone1
	SaNews[41] = CreateObject(1698, 790.8059, -1338.5548, 709.5169, 0.0000, 0.0000, 0.0000); //Esc_step8
	SetObjectMaterial(SaNews[41], 0, 10765, "airportgnd_sfse", "white", 0xFF696969);
	SaNews[42] = CreateObject(19893, 791.6981, -1313.8977, 710.0219, 0.0000, 0.0000, 151.8999); //LaptopSAMP1
	SetObjectMaterial(SaNews[42], 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	SaNews[43] = CreateObject(1698, 790.8162, -1339.0753, 709.7470, 0.0000, 0.0000, 0.0000); //Esc_step8
	SetObjectMaterial(SaNews[43], 0, 10765, "airportgnd_sfse", "white", 0xFF696969);
	SaNews[44] = CreateObject(19893, 791.7028, -1313.8885, 710.0264, 0.0000, 0.0000, 151.8999); //LaptopSAMP1
	SaNews[45] = CreateObject(1698, 790.7960, -1339.6057, 709.9771, 0.0000, 0.0000, 0.0000); //Esc_step8
	SetObjectMaterial(SaNews[45], 0, 10765, "airportgnd_sfse", "white", 0xFF696969);
	SaNews[46] = CreateObject(1698, 788.5355, -1338.5954, 710.2175, 0.0000, 0.0000, 90.0000); //Esc_step8
	SetObjectMaterial(SaNews[46], 0, 10765, "airportgnd_sfse", "white", 0xFF696969);
	SaNews[47] = CreateObject(19893, 791.7072, -1313.8791, 710.0219, 0.0000, 0.0000, 151.8999); //LaptopSAMP1
	SetObjectMaterial(SaNews[47], 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	SaNews[48] = CreateObject(1698, 788.5355, -1339.9560, 710.2175, 0.0000, 0.0000, 90.0000); //Esc_step8
	SetObjectMaterial(SaNews[48], 0, 10765, "airportgnd_sfse", "white", 0xFF696969);
	SaNews[49] = CreateObject(2894, 792.7758, -1313.9349, 710.0275, 0.0000, 0.0000, -156.3999); //kmb_rhymesbook
	SetObjectMaterial(SaNews[49], 0, 2894, "kmb_notebook", "kmb_notebook", 0x00000000);
	SaNews[50] = CreateObject(1698, 788.0349, -1338.5954, 710.4577, 0.0000, 0.0000, 90.0000); //Esc_step8
	SetObjectMaterial(SaNews[50], 0, 10765, "airportgnd_sfse", "white", 0xFF696969);
	SaNews[51] = CreateObject(1698, 788.0352, -1339.9560, 710.4475, 0.0000, 0.0000, 90.0000); //Esc_step8
	SetObjectMaterial(SaNews[51], 0, 10765, "airportgnd_sfse", "white", 0xFF696969);
	SaNews[52] = CreateObject(19371, 788.2926, -1309.2268, 710.3413, 0.0000, 0.0000, 0.0000); //wall019
	SetObjectMaterial(SaNews[52], 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	SaNews[53] = CreateObject(19371, 788.3026, -1309.2166, 712.2517, 0.0000, 0.0000, 0.0000); //wall019
	SetObjectMaterial(SaNews[53], 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	SaNews[54] = CreateObject(19371, 796.7434, -1309.2166, 712.2517, 0.0000, 0.0000, 0.0000); //wall019
	SetObjectMaterial(SaNews[54], 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	SaNews[55] = CreateObject(19371, 796.7534, -1309.2268, 709.9312, 0.0000, 0.0000, 0.0000); //wall019
	SetObjectMaterial(SaNews[55], 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	SaNews[56] = CreateObject(19371, 795.2329, -1309.0566, 713.9514, 0.0000, 90.0000, 90.0000); //wall019
	SetObjectMaterial(SaNews[56], 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	SaNews[57] = CreateObject(19371, 792.0230, -1309.0666, 713.9514, 0.0000, 90.0000, 90.0000); //wall019
	SetObjectMaterial(SaNews[57], 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	SaNews[58] = CreateObject(19371, 789.8031, -1309.0666, 713.9514, 0.0000, 90.0000, 90.0000); //wall019
	SetObjectMaterial(SaNews[58], 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	SaNews[59] = CreateObject(1698, 785.9840, -1338.5954, 711.4284, 0.0000, 0.0000, 90.0000); //Esc_step8
	SetObjectMaterial(SaNews[59], 0, 10765, "airportgnd_sfse", "white", 0xFF696969);
	SaNews[60] = CreateObject(19375, 789.7860, -1309.9648, 704.1320, 0.0000, 0.0000, 0.0000); //wall023
	SetObjectMaterial(SaNews[60], 0, 10765, "airportgnd_sfse", "white", 0xFFFFA500);
	SaNews[61] = CreateObject(1698, 787.4946, -1338.5954, 710.7077, 0.0000, 0.0000, 90.0000); //Esc_step8
	SetObjectMaterial(SaNews[61], 0, 10765, "airportgnd_sfse", "white", 0xFF696969);
	SaNews[62] = CreateObject(19370, 791.3012, -1314.7226, 707.6267, 0.0000, 0.0000, 90.0000); //wall018
	SetObjectMaterial(SaNews[62], 0, 10765, "airportgnd_sfse", "white", 0xFFFFA500);
	SaNews[63] = CreateObject(1698, 787.4946, -1339.9560, 710.7077, 0.0000, 0.0000, 90.0000); //Esc_step8
	SetObjectMaterial(SaNews[63], 0, 10765, "airportgnd_sfse", "white", 0xFF696969);
	SaNews[64] = CreateObject(1698, 786.9644, -1338.5954, 710.9478, 0.0000, 0.0000, 90.0000); //Esc_step8
	SetObjectMaterial(SaNews[64], 0, 10765, "airportgnd_sfse", "white", 0xFF696969);
	SaNews[65] = CreateObject(19370, 793.3623, -1314.7226, 707.6267, 0.0000, 0.0000, 90.0000); //wall018
	SetObjectMaterial(SaNews[65], 0, 10765, "airportgnd_sfse", "white", 0xFFFFA500);
	SaNews[66] = CreateObject(19370, 795.2725, -1315.6230, 707.6267, 0.0000, 0.0000, 90.0000); //wall018
	SetObjectMaterial(SaNews[66], 0, 10765, "airportgnd_sfse", "white", 0xFFFFA500);
	SaNews[67] = CreateObject(1698, 786.9644, -1339.9659, 710.9478, 0.0000, 0.0000, 90.0000); //Esc_step8
	SetObjectMaterial(SaNews[67], 0, 10765, "airportgnd_sfse", "white", 0xFF696969);
	SaNews[68] = CreateObject(19370, 792.0927, -1315.6230, 707.6267, 0.0000, 0.0000, 90.0000); //wall018
	SetObjectMaterial(SaNews[68], 0, 10765, "airportgnd_sfse", "white", 0xFFFFA500);
	SaNews[69] = CreateObject(19370, 789.7927, -1315.6230, 707.6267, 0.0000, 0.0000, 90.0000); //wall018
	SetObjectMaterial(SaNews[69], 0, 10765, "airportgnd_sfse", "white", 0xFFFFA500);
	SaNews[70] = CreateObject(18762, 792.3328, -1314.1468, 709.5227, 0.0000, 90.0000, 0.0000); //Concrete1mx1mx5m
	SetObjectMaterial(SaNews[70], 0, 10765, "airportgnd_sfse", "white", 0xFFD3D3D3);
	SaNews[71] = CreateObject(19370, 788.2520, -1314.1031, 707.6267, 0.0000, 0.0000, 0.0000); //wall018
	SetObjectMaterial(SaNews[71], 0, 10765, "airportgnd_sfse", "white", 0xFFFFA500);
	SaNews[72] = CreateObject(19370, 788.2520, -1312.0721, 707.6267, 0.0000, 0.0000, 0.0000); //wall018
	SetObjectMaterial(SaNews[72], 0, 10765, "airportgnd_sfse", "white", 0xFFFFA500);
	SaNews[73] = CreateObject(19370, 796.8128, -1312.0721, 707.6267, 0.0000, 0.0000, 0.0000); //wall018
	SetObjectMaterial(SaNews[73], 0, 10765, "airportgnd_sfse", "white", 0xFFFFA500);
	SaNews[74] = CreateObject(19370, 796.8128, -1314.0931, 707.6267, 0.0000, 0.0000, 0.0000); //wall018
	SetObjectMaterial(SaNews[74], 0, 10765, "airportgnd_sfse", "white", 0xFFFFA500);
	SaNews[75] = CreateObject(1698, 786.4545, -1339.9560, 711.1981, 0.0000, 0.0000, 90.0000); //Esc_step8
	SetObjectMaterial(SaNews[75], 0, 10765, "airportgnd_sfse", "white", 0xFF696969);
	SaNews[76] = CreateObject(19356, 790.0479, -1337.8332, 708.5808, 0.0000, 0.0000, 0.0000); //wall004
	SetObjectMaterial(SaNews[76], 0, 6282, "beafron2_law2", "boardwalk2_la", 0x00000000);
	SaNews[77] = CreateObject(19356, 791.4987, -1339.2336, 708.3706, 0.0000, 0.0000, 0.0000); //wall004
	SetObjectMaterial(SaNews[77], 0, 6282, "beafron2_law2", "boardwalk2_la", 0x00000000);
	SaNews[78] = CreateObject(19375, 782.3159, -1337.9532, 706.5629, 0.0000, 0.0000, 90.0000); //wall023
	SetObjectMaterial(SaNews[78], 0, 6282, "beafron2_law2", "boardwalk2_la", 0xFFFFF0F5);
	SaNews[79] = CreateObject(19375, 782.7764, -1337.9632, 706.3126, 0.0000, 0.0000, 90.0000); //wall023
	SetObjectMaterial(SaNews[79], 0, 6282, "beafron2_law2", "boardwalk2_la", 0xFFFFF0F5);
	SaNews[80] = CreateObject(19375, 783.2568, -1337.9432, 706.0824, 0.0000, 0.0000, 90.0000); //wall023
	SetObjectMaterial(SaNews[80], 0, 6282, "beafron2_law2", "boardwalk2_la", 0xFFFFF0F5);
	SaNews[81] = CreateObject(19375, 783.7672, -1337.9332, 705.8422, 0.0000, 0.0000, 90.0000); //wall023
	SetObjectMaterial(SaNews[81], 0, 6282, "beafron2_law2", "boardwalk2_la", 0xFFFFF0F5);
	SaNews[82] = CreateObject(19375, 784.3172, -1337.9432, 705.5921, 0.0000, 0.0000, 90.0000); //wall023
	SetObjectMaterial(SaNews[82], 0, 6282, "beafron2_law2", "boardwalk2_la", 0xFFFFF0F5);
	SaNews[83] = CreateObject(19375, 785.3279, -1337.9132, 705.1116, 0.0000, 0.0000, 90.0000); //wall023
	SetObjectMaterial(SaNews[83], 0, 6282, "beafron2_law2", "boardwalk2_la", 0xFFFFF0F5);
	SaNews[84] = CreateObject(19356, 791.4887, -1337.8332, 708.3604, 0.0000, 0.0000, 0.0000); //wall004
	SetObjectMaterial(SaNews[84], 0, 6282, "beafron2_law2", "boardwalk2_la", 0x00000000);
	SaNews[85] = CreateObject(1698, 785.9840, -1339.9250, 711.4284, 0.0000, 0.0000, 90.0000); //Esc_step8
	SetObjectMaterial(SaNews[85], 0, 10765, "airportgnd_sfse", "white", 0xFF696969);
	SaNews[86] = CreateObject(18981, 789.3145, -1316.7895, 708.7907, 0.0000, 90.0000, 0.0000); //Concrete1mx25mx25m
	SetObjectMaterial(SaNews[86], 0, 3979, "civic01_lan", "sl_flagstone1", 0x00000000);
	SaNews[87] = CreateObject(19464, 784.9835, -1335.0780, 712.2957, 0.0000, 90.0000, 0.0000); //wall104
	SetObjectMaterial(SaNews[87], 0, 14530, "estate2", "mp_bobbie_carpet", 0x00000000);
	SaNews[88] = CreateObject(18764, 792.3142, -1312.1218, 706.9055, 0.0000, 0.0000, 0.0000); //Concrete5mx5mx5m
	SetObjectMaterial(SaNews[88], 0, 14476, "carlslounge", "AH_cheapredcarpet", 0x00000000);
	SaNews[89] = CreateObject(970, 788.0288, -1337.9344, 710.5394, 0.0000, 0.0000, 0.0000); //fencesmallb
	SetObjectMaterial(SaNews[89], 0, 8680, "chnatwnfnce", "ctmallfence", 0xFF000000);
	SaNews[90] = CreateObject(970, 786.5482, -1337.9344, 711.0299, 0.0000, 0.0000, 0.0000); //fencesmallb
	SetObjectMaterial(SaNews[90], 0, 8680, "chnatwnfnce", "ctmallfence", 0xFF000000);
	SaNews[91] = CreateObject(1698, 786.4545, -1338.5954, 711.1981, 0.0000, 0.0000, 90.0000); //Esc_step8
	SetObjectMaterial(SaNews[91], 0, 10765, "airportgnd_sfse", "white", 0xFF696969);
	SaNews[92] = CreateObject(970, 791.4899, -1338.3249, 710.2288, 0.0000, 0.0000, 90.0000); //fencesmallb
	SetObjectMaterial(SaNews[92], 0, 8680, "chnatwnfnce", "ctmallfence", 0xFF000000);
	SaNews[93] = CreateObject(1698, 785.5236, -1338.5954, 711.6685, 0.0000, 0.0000, 90.0000); //Esc_step8
	SetObjectMaterial(SaNews[93], 0, 10765, "airportgnd_sfse", "white", 0xFF696969);
	SaNews[94] = CreateObject(1698, 785.5236, -1339.8868, 711.6685, 0.0000, 0.0000, 90.0000); //Esc_step8
	SetObjectMaterial(SaNews[94], 0, 10765, "airportgnd_sfse", "white", 0xFF696969);
	SaNews[95] = CreateObject(1698, 785.1433, -1338.5954, 711.8687, 0.0000, 0.0000, 90.0000); //Esc_step8
	SetObjectMaterial(SaNews[95], 0, 10765, "airportgnd_sfse", "white", 0xFF696969);
	SaNews[96] = CreateObject(1698, 785.1433, -1339.9250, 711.8687, 0.0000, 0.0000, 90.0000); //Esc_step8
	SetObjectMaterial(SaNews[96], 0, 10765, "airportgnd_sfse", "white", 0xFF696969);
	SaNews[97] = CreateObject(1698, 784.7332, -1338.5954, 712.1090, 0.0000, 0.0000, 90.0000); //Esc_step8
	SetObjectMaterial(SaNews[97], 0, 10765, "airportgnd_sfse", "white", 0xFF696969);
	SaNews[98] = CreateObject(970, 790.0999, -1336.8138, 708.7086, 0.0000, 90.0000, 90.0000); //fencesmallb
	SetObjectMaterial(SaNews[98], 0, 8680, "chnatwnfnce", "ctmallfence", 0xFF000000);
	SaNews[99] = CreateObject(1698, 784.7332, -1339.9255, 712.1090, 0.0000, 0.0000, 90.0000); //Esc_step8
	SetObjectMaterial(SaNews[99], 0, 10765, "airportgnd_sfse", "white", 0xFF696969);
	SaNews[100] = CreateObject(1698, 784.3427, -1338.5954, 712.2891, 0.0000, 0.0000, 90.0000); //Esc_step8
	SetObjectMaterial(SaNews[100], 0, 10765, "airportgnd_sfse", "white", 0xFF696969);
	SaNews[101] = CreateObject(1698, 784.3427, -1339.9162, 712.2891, 0.0000, 0.0000, 90.0000); //Esc_step8
	SetObjectMaterial(SaNews[101], 0, 10765, "airportgnd_sfse", "white", 0xFF696969);
	SaNews[102] = CreateObject(970, 790.0999, -1337.3845, 708.7086, 0.0000, 90.0000, 90.0000); //fencesmallb
	SetObjectMaterial(SaNews[102], 0, 8680, "chnatwnfnce", "ctmallfence", 0xFF000000);
	SaNews[103] = CreateObject(19375, 781.5253, -1337.9549, 707.1533, 0.0000, 0.0000, 90.0000); //wall023
	SetObjectMaterial(SaNews[103], 0, 6282, "beafron2_law2", "boardwalk2_la", 0xFFFFF0F5);
	SaNews[104] = CreateObject(19375, 784.8276, -1337.9526, 705.3418, 0.0000, 0.0000, 90.0000); //wall023
	SetObjectMaterial(SaNews[104], 0, 6282, "beafron2_law2", "boardwalk2_la", 0xFFFFF0F5);
	SaNews[105] = CreateObject(19375, 781.9356, -1337.9632, 706.7631, 0.0000, 0.0000, 90.0000); //wall023
	SetObjectMaterial(SaNews[105], 0, 6282, "beafron2_law2", "boardwalk2_la", 0xFFFFF0F5);
	SaNews[106] = CreateObject(638, 789.5631, -1336.5229, 709.8775, 0.0000, 0.0000, 0.0000); //kb_planter+bush
	SetObjectMaterial(SaNews[106], 0, 6282, "beafron2_law2", "boardwalk2_la", 0x00000000);
	SetObjectMaterial(SaNews[106], 1, 1597, "centralresac1", "fuzzyplant256", 0x00000000);
	SaNews[107] = CreateObject(3498, 787.1920, -1329.8375, 708.3054, 0.0000, 30.7999, -90.0000); //wdpillar01_lvs
	SetObjectMaterial(SaNews[107], 0, 3314, "ce_burbhouse", "black_128", 0x00000000);
	SetObjectMaterial(SaNews[107], 1, 3314, "ce_burbhouse", "black_128", 0x00000000);
	SaNews[108] = CreateObject(970, 785.4982, -1337.9344, 711.4505, 0.0000, 0.0000, 0.0000); //fencesmallb
	SetObjectMaterial(SaNews[108], 0, 8680, "chnatwnfnce", "ctmallfence", 0xFF000000);
	SaNews[109] = CreateObject(19375, 791.1281, -1344.1562, 711.1624, 0.0000, 0.0000, 0.0000); //wall023
	SetObjectMaterial(SaNews[109], 0, 10765, "airportgnd_sfse", "white", 0xFFFFA500);
	SaNews[110] = CreateObject(970, 784.6781, -1337.9344, 711.6104, 0.0000, 0.0000, 0.0000); //fencesmallb
	SetObjectMaterial(SaNews[110], 0, 8680, "chnatwnfnce", "ctmallfence", 0xFF000000);
	SaNews[111] = CreateObject(19375, 790.4074, -1344.1562, 711.1624, 0.0000, 0.0000, 0.0000); //wall023
	SetObjectMaterial(SaNews[111], 0, 10765, "airportgnd_sfse", "white", 0xFFFFA500);
	SaNews[112] = CreateObject(18275, 792.3991, -1311.4056, 715.5208, 90.0000, 0.0000, 180.0000); //cw2_mtbfinish
	SaNews[113] = CreateObject(18762, 787.0302, -1330.4172, 714.7006, 0.0000, 0.0000, 0.0000); //Concrete1mx1mx5m
	SetObjectMaterial(SaNews[113], 0, 10765, "airportgnd_sfse", "white", 0xFF696969);
	SaNews[114] = CreateObject(18275, 792.3991, -1315.8774, 715.5208, 90.0000, 0.0000, 0.0000); //cw2_mtbfinish
	SaNews[115] = CreateObject(18762, 782.8649, -1337.5432, 714.7006, 0.0000, 0.0000, 0.0000); //Concrete1mx1mx5m
	SetObjectMaterial(SaNews[115], 0, 10765, "airportgnd_sfse", "white", 0xFF696969);
	SaNews[116] = CreateObject(18762, 787.0302, -1337.5432, 714.7006, 0.0000, 0.0000, 0.0000); //Concrete1mx1mx5m
	SetObjectMaterial(SaNews[116], 0, 10765, "airportgnd_sfse", "white", 0xFF696969);
	SaNews[117] = CreateObject(19464, 785.0036, -1335.0880, 712.2946, 0.0000, 90.0000, 0.0000); //wall104
	SetObjectMaterial(SaNews[117], 0, 10765, "airportgnd_sfse", "white", 0xFF696969);
	SaNews[118] = CreateObject(18762, 782.8400, -1330.4187, 714.7006, 0.0000, 0.0000, 0.0000); //Concrete1mx1mx5m
	SetObjectMaterial(SaNews[118], 0, 10765, "airportgnd_sfse", "white", 0xFF696969);
	SaNews[119] = CreateObject(19325, 783.3881, -1329.9884, 714.4710, 0.0000, 0.0000, 90.0000); //lsmall_window01
	SetObjectMaterial(SaNews[119], 0, 18065, "ab_sfammumain", "shelf_glas", 0xFF000000);
	SaNews[120] = CreateObject(19325, 787.4887, -1334.0799, 714.4710, 0.0000, 0.0000, 0.0000); //lsmall_window01
	SetObjectMaterial(SaNews[120], 0, 18065, "ab_sfammumain", "shelf_glas", 0xFF000000);
	SaNews[121] = CreateObject(18981, 789.1945, -1342.3906, 716.8015, 0.0000, 90.0000, 0.0000); //Concrete1mx25mx25m
	SetObjectMaterial(SaNews[121], 0, 14859, "gf1", "mp_cop_ceiling", 0xFFFFFAFA);
	SaNews[122] = CreateObject(19464, 784.9935, -1332.8668, 712.2949, 0.0000, 90.0000, 0.0000); //wall104
	SetObjectMaterial(SaNews[122], 0, 10765, "airportgnd_sfse", "white", 0xFF696969);
	SaNews[123] = CreateObject(18981, 789.1945, -1317.4001, 716.8015, 0.0000, 90.0000, 0.0000); //Concrete1mx25mx25m
	SetObjectMaterial(SaNews[123], 0, 14859, "gf1", "mp_cop_ceiling", 0xFFFFFAFA);
	SaNews[124] = CreateObject(19464, 784.9832, -1332.8668, 716.1848, 0.0000, 90.0000, 0.0000); //wall104
	SetObjectMaterial(SaNews[124], 0, 10765, "airportgnd_sfse", "white", 0xFF696969);
	SaNews[125] = CreateObject(19464, 784.9635, -1335.0471, 716.1854, 0.0000, 90.0000, 0.0000); //wall104
	SetObjectMaterial(SaNews[125], 0, 10765, "airportgnd_sfse", "white", 0xFF696969);
	SaNews[126] = CreateObject(19143, 793.0280, -1317.1916, 715.0217, -7.4998, 0.0000, 0.0000); //PinSpotLight1
	SaNews[127] = CreateObject(19143, 794.4979, -1317.1888, 715.0415, -7.4998, 0.0000, 0.0000); //PinSpotLight1
	SaNews[128] = CreateObject(19143, 791.5778, -1317.1864, 715.0612, -7.4998, 0.0000, 0.0000); //PinSpotLight1
	SaNews[129] = CreateObject(19143, 790.1173, -1317.1850, 715.0712, -7.4998, 0.0000, 0.0000); //PinSpotLight1
	SaNews[130] = CreateObject(19143, 789.8496, -1315.6745, 715.0263, -7.4998, 0.0000, -90.0000); //PinSpotLight1
	SaNews[131] = CreateObject(2161, 782.7620, -1334.3929, 710.1195, 0.0000, 0.0000, 90.0000); //MED_OFFICE_UNIT_4
	SaNews[132] = CreateObject(19383, 784.9304, -1337.9521, 714.1115, 0.0000, 0.0000, 90.0000); //wall031
	SetObjectMaterial(SaNews[132], 0, 6282, "beafron2_law2", "boardwalk2_la", 0x00000000);
	SaNews[133] = CreateObject(19143, 789.8496, -1314.1241, 715.0263, -7.4998, 0.0000, -90.0000); //PinSpotLight1
	SaNews[134] = CreateObject(19143, 789.8496, -1312.2042, 715.0263, -7.4998, 0.0000, -90.0000); //PinSpotLight1
	SaNews[135] = CreateObject(19143, 794.9362, -1312.2042, 715.0438, -7.4998, 0.0000, 90.0000); //PinSpotLight1
	SaNews[136] = CreateObject(19383, 784.9304, -1337.9520, 717.6115, 180.0000, 0.0000, 90.0000); //wall031
	SetObjectMaterial(SaNews[136], 0, 6282, "beafron2_law2", "boardwalk2_la", 0x00000000);
	SaNews[137] = CreateObject(19143, 794.9362, -1314.1855, 715.0438, -7.4998, 0.0000, 90.0000); //PinSpotLight1
	SaNews[138] = CreateObject(19143, 794.9362, -1315.8663, 715.0438, -7.4998, 0.0000, 90.0000); //PinSpotLight1
	SaNews[139] = CreateObject(2229, 795.7827, -1317.5013, 715.0966, 0.0000, 180.0000, -134.3000); //SWANK_SPEAKER
	SaNews[140] = CreateObject(2370, 798.4309, -1336.9709, 709.2843, 0.0000, 0.0000, 0.0000); //Shop_set_1_Table
	SetObjectMaterial(SaNews[140], 0, 1949, "barrier", "plainboards64HV", 0x00000000);
	SaNews[141] = CreateObject(2166, 785.1453, -1332.1206, 709.2545, 0.0000, 0.0000, 270.0000); //MED_OFFICE_DESK_2
	SaNews[142] = CreateObject(2229, 789.5488, -1317.9167, 715.0667, 0.0000, 180.0000, 143.0997); //SWANK_SPEAKER
	SaNews[143] = CreateObject(2166, 785.1453, -1335.5721, 709.2545, 0.0000, 0.0000, 270.0000); //MED_OFFICE_DESK_2
	SaNews[144] = CreateObject(1714, 784.7136, -1332.9880, 709.2760, 0.0000, 0.0000, 90.0000); //kb_swivelchair1
	SaNews[145] = CreateObject(1714, 784.7136, -1336.3386, 709.2760, 0.0000, 0.0000, 90.0000); //kb_swivelchair1
	SaNews[146] = CreateObject(1886, 793.9663, -1321.1385, 709.9605, 0.0000, 180.0000, 180.0000); //shop_sec_cam
	SetObjectMaterial(SaNews[146], 1, 14832, "lee_stripclub", "Strip_ceiling", 0x00000000);
	SaNews[147] = CreateObject(2985, 794.0227, -1321.3319, 709.2495, 0.0000, 0.0000, 90.0000); //minigun_base
	SetObjectMaterial(SaNews[147], 0, 3314, "ce_burbhouse", "black_128", 0x00000000);
	SetObjectMaterial(SaNews[147], 1, 3314, "ce_burbhouse", "black_128", 0x00000000);
	SaNews[148] = CreateObject(2162, 782.8756, -1332.6655, 709.2918, 0.0000, 0.0000, 90.0000); //MED_OFFICE_UNIT_1
	SaNews[149] = CreateObject(1886, 794.0166, -1321.3586, 709.9605, 0.0000, 180.0000, 0.0000); //shop_sec_cam
	SetObjectMaterial(SaNews[149], 1, 14832, "lee_stripclub", "Strip_ceiling", 0x00000000);
	SaNews[150] = CreateObject(2162, 782.8756, -1336.5257, 709.2918, 0.0000, 0.0000, 90.0000); //MED_OFFICE_UNIT_1
	SaNews[151] = CreateObject(1671, 793.9243, -1322.1842, 709.7202, 0.0000, 0.0000, 180.0000); //swivelchair_A
	SaNews[152] = CreateObject(2001, 786.3106, -1337.4881, 709.2401, 0.0000, 0.0000, 0.0000); //nu_plant_ofc
	SetObjectMaterial(SaNews[152], 1, 13364, "cetown3cs_t", "ws_sandstone2", 0x00000000);
	SaNews[153] = CreateObject(2001, 783.1101, -1330.9270, 709.2401, 0.0000, 0.0000, 0.0000); //nu_plant_ofc
	SetObjectMaterial(SaNews[153], 1, 13364, "cetown3cs_t", "ws_sandstone2", 0x00000000);
	SaNews[154] = CreateObject(2001, 783.1101, -1337.4493, 709.2401, 0.0000, 0.0000, 0.0000); //nu_plant_ofc
	SetObjectMaterial(SaNews[154], 1, 13364, "cetown3cs_t", "ws_sandstone2", 0x00000000);
	SaNews[155] = CreateObject(19375, 792.6572, -1310.7143, 709.2625, 0.0000, 0.0000, 90.0000); //wall023
	SetObjectMaterial(SaNews[155], 0, 10765, "airportgnd_sfse", "white", 0xFFFFA500);
	SaNews[156] = CreateObject(19786, 784.3366, -1310.7287, 712.5709, 0.0000, 90.0000, 0.0000); //LCDTVBig1
	SetObjectMaterial(SaNews[156], 0, 10765, "airportgnd_sfse", "white", 0xFFFFA500);
	SetObjectMaterial(SaNews[156], 1, 7978, "vgssairport", "airportwindow02_128", 0x00000000);
	SaNews[157] = CreateObject(19786, 786.3670, -1310.7287, 712.5709, 0.0000, 90.0000, 0.0000); //LCDTVBig1
	SetObjectMaterial(SaNews[157], 0, 10765, "airportgnd_sfse", "white", 0xFFFFA500);
	SetObjectMaterial(SaNews[157], 1, 7978, "vgssairport", "airportwindow02_128", 0x00000000);
	SaNews[158] = CreateObject(19786, 799.6270, -1310.7287, 712.5709, 0.0000, 90.0000, 0.0000); //LCDTVBig1
	SetObjectMaterial(SaNews[158], 0, 10765, "airportgnd_sfse", "white", 0xFFFFA500);
	SetObjectMaterial(SaNews[158], 1, 7978, "vgssairport", "airportwindow02_128", 0x00000000);
	SaNews[159] = CreateObject(19355, 792.5402, -1322.3786, 709.2100, 0.0000, 90.0000, 90.0000); //wall003
	SetObjectMaterialText(SaNews[159], "Kamerazone - NICHT Betreten!", 0, 130, "Arial", 30, 1, 0xFFFFFFFF, 0x0, 0);
	SetObjectMaterial(SaNews[159], 1, 0, "INVALID", "INVALID", 0xFFFFFFFF);
	SaNews[160] = CreateObject(1886, 790.1259, -1321.3586, 709.9605, 0.0000, 180.0000, 0.0000); //shop_sec_cam
	SetObjectMaterial(SaNews[160], 1, 14832, "lee_stripclub", "Strip_ceiling", 0x00000000);
	SaNews[161] = CreateObject(1886, 790.0961, -1321.2186, 709.9605, 0.0000, 180.0000, 180.0000); //shop_sec_cam
	SetObjectMaterial(SaNews[161], 1, 14832, "lee_stripclub", "Strip_ceiling", 0x00000000);
	SaNews[162] = CreateObject(19089, 787.4973, -1337.0329, 719.8115, 0.0000, 0.0000, 0.0000); //Rope3
	SetObjectMaterial(SaNews[162], 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	SaNews[163] = CreateObject(2985, 790.1220, -1321.3319, 709.2495, 0.0000, 0.0000, 90.0000); //minigun_base
	SetObjectMaterial(SaNews[163], 0, 3314, "ce_burbhouse", "black_128", 0x00000000);
	SetObjectMaterial(SaNews[163], 1, 3314, "ce_burbhouse", "black_128", 0x00000000);
	SaNews[164] = CreateObject(1671, 790.1140, -1322.1842, 709.7202, 0.0000, 0.0000, 180.0000); //swivelchair_A
	SaNews[165] = CreateObject(1671, 786.1740, -1319.1931, 709.7202, 0.0000, 0.0000, 131.8999); //swivelchair_A
	SaNews[166] = CreateObject(1671, 798.5413, -1319.9068, 709.7202, 0.0000, 0.0000, -144.5000); //swivelchair_A
	SaNews[167] = CreateObject(2985, 798.0089, -1319.0362, 709.2495, 0.0000, 0.0000, 124.5998); //minigun_base
	SetObjectMaterial(SaNews[167], 0, 3314, "ce_burbhouse", "black_128", 0x00000000);
	SetObjectMaterial(SaNews[167], 1, 3314, "ce_burbhouse", "black_128", 0x00000000);
	SaNews[168] = CreateObject(1714, 785.4874, -1333.8336, 712.4362, 0.0000, 0.0000, -90.0000); //kb_swivelchair1
	SaNews[169] = CreateObject(19893, 786.0947, -1336.2147, 710.0371, 0.0000, 0.0000, -90.0000); //LaptopSAMP1
	SetObjectMaterial(SaNews[169], 1, 10765, "airportgnd_sfse", "white", 0xFFD78E10);
	SaNews[170] = CreateObject(1768, 801.1409, -1331.8885, 709.2672, 0.0000, 0.0000, -90.0000); //LOW_COUCH_3
	SetObjectMaterial(SaNews[170], 0, 1726, "mrk_couches2", "kb_sofa5_256", 0xFFFFF0F5);
	SetObjectMaterial(SaNews[170], 1, 10765, "airportgnd_sfse", "white", 0xFFFFF0F5);
	SetObjectMaterial(SaNews[170], 2, 10765, "airportgnd_sfse", "white", 0xFFFFF0F5);
	SaNews[171] = CreateObject(19893, 786.0645, -1336.2071, 709.9769, 0.0000, 0.0000, -90.0000); //LaptopSAMP1
	SetObjectMaterial(SaNews[171], 0, 0, "INVALID", "INVALID", 0xFFFFFFFF);
	SetObjectMaterialText(SaNews[171], "Passwort: _____", 1, 90, "Arial", 28, 1, 0xFF000000, 0x0, 1);
	SaNews[172] = CreateObject(1808, 801.4531, -1334.9134, 709.2631, 0.0000, 0.0000, 270.0000); //CJ_WATERCOOLER2
	SaNews[173] = CreateObject(19893, 786.0847, -1332.7447, 710.0269, 0.0000, 0.0000, -90.0000); //LaptopSAMP1
	SetObjectMaterial(SaNews[173], 0, 0, "INVALID", "INVALID", 0xFFFFFFFF);
	SetObjectMaterialText(SaNews[173], "Login: ______", 1, 90, "Arial", 28, 1, 0xFF000000, 0x0, 1);
	SaNews[174] = CreateObject(19893, 786.0645, -1332.7247, 709.9769, 0.0000, 0.0000, -90.0000); //LaptopSAMP1
	SetObjectMaterial(SaNews[174], 0, 0, "INVALID", "INVALID", 0xFFFFFFFF);
	SetObjectMaterialText(SaNews[174], "Passwort: _____", 1, 90, "Arial", 28, 1, 0xFF000000, 0x0, 1);
	SaNews[175] = CreateObject(19893, 786.1148, -1336.2270, 710.0971, 0.0000, 0.0000, -90.0000); //LaptopSAMP1
	SetObjectMaterial(SaNews[175], 0, 0, "INVALID", "INVALID", 0xFFFFFFFF);
	SetObjectMaterialText(SaNews[175], "&#252;", 1, 90, "Webdings", 50, 1, 0xFF000000, 0x0, 1);
	SaNews[176] = CreateObject(2186, 788.4541, -1337.4265, 709.2523, 0.0000, 0.0000, 180.0000); //PHOTOCOPIER_1
	SaNews[177] = CreateObject(19893, 786.0847, -1336.2270, 710.0269, 0.0000, 0.0000, -90.0000); //LaptopSAMP1
	SetObjectMaterial(SaNews[177], 0, 0, "INVALID", "INVALID", 0xFFFFFFFF);
	SetObjectMaterialText(SaNews[177], "Login: _____", 1, 90, "Arial", 28, 1, 0xFF000000, 0x0, 1);
	SaNews[178] = CreateObject(19893, 786.1148, -1332.7464, 710.0971, 0.0000, 0.0000, -90.0000); //LaptopSAMP1
	SetObjectMaterial(SaNews[178], 0, 0, "INVALID", "INVALID", 0xFFFFFFFF);
	SetObjectMaterialText(SaNews[178], "&#252;", 1, 90, "Webdings", 50, 1, 0xFF000000, 0x0, 1);
	SaNews[179] = CreateObject(19835, 786.0902, -1333.2989, 710.1267, 0.0000, 0.0000, 0.0000); //CoffeeCup1
	SaNews[180] = CreateObject(19175, 782.7761, -1326.7115, 711.6054, 0.0000, 0.0000, 90.0000); //SAMPPicture4
	SetObjectMaterialText(SaNews[180], "Kaffee", 0, 90, "Arial", 45, 1, 0xFFD78E10, 0x0, 1);
	SetObjectMaterial(SaNews[180], 1, 0, "INVALID", "INVALID", 0xFFFFFFFF);
	SaNews[181] = CreateObject(19807, 785.3955, -1335.5577, 710.0806, 0.0000, 0.0000, 0.0000); //Telephone1
	SetObjectMaterial(SaNews[181], 0, 10765, "airportgnd_sfse", "white", 0xFFFFA500);
	SaNews[182] = CreateObject(19807, 785.3955, -1332.0471, 710.0806, 0.0000, 0.0000, 0.0000); //Telephone1
	SetObjectMaterial(SaNews[182], 0, 10765, "airportgnd_sfse", "white", 0xFFFFA500);
	SaNews[183] = CreateObject(19089, 787.4973, -1330.6208, 715.2811, 0.0000, 90.0000, 90.0000); //Rope3
	SetObjectMaterial(SaNews[183], 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	SaNews[184] = CreateObject(19089, 787.4973, -1329.9704, 713.2506, 0.0000, 90.0000, 90.0000); //Rope3
	SetObjectMaterial(SaNews[184], 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	SaNews[185] = CreateObject(18075, 782.3010, -1336.3984, 712.2116, 0.0000, 0.0000, 0.0000); //lightD
	SaNews[186] = CreateObject(19089, 786.7968, -1329.9903, 713.2506, 0.0000, 90.0000, 0.0000); //Rope3
	SetObjectMaterial(SaNews[186], 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	SaNews[187] = CreateObject(19089, 786.7677, -1329.9803, 715.2811, 0.0000, 90.0000, 0.0000); //Rope3
	SetObjectMaterial(SaNews[187], 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	SaNews[188] = CreateObject(19089, 786.5269, -1329.9903, 719.7512, 0.0000, 0.0000, 0.0000); //Rope3
	SetObjectMaterial(SaNews[188], 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	SaNews[189] = CreateObject(19089, 783.3563, -1329.9903, 719.7111, 0.0000, 0.0000, 0.0000); //Rope3
	SetObjectMaterial(SaNews[189], 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	SaNews[190] = CreateObject(19089, 786.7968, -1329.9903, 716.0609, 0.0000, 90.0000, 0.0000); //Rope3
	SetObjectMaterial(SaNews[190], 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	SaNews[191] = CreateObject(19089, 786.7968, -1329.9903, 712.4204, 0.0000, 90.0000, 0.0000); //Rope3
	SetObjectMaterial(SaNews[191], 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	SaNews[192] = CreateObject(19089, 787.4973, -1330.6208, 716.0515, 0.0000, 90.0000, 90.0000); //Rope3
	SetObjectMaterial(SaNews[192], 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	SaNews[193] = CreateObject(19089, 787.4973, -1330.6208, 712.4317, 0.0000, 90.0000, 90.0000); //Rope3
	SetObjectMaterial(SaNews[193], 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	SaNews[194] = CreateObject(19089, 787.4973, -1330.9305, 719.8115, 0.0000, 0.0000, 0.0000); //Rope3
	SetObjectMaterial(SaNews[194], 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	SaNews[195] = CreateObject(2985, 786.9506, -1318.4986, 709.2495, 0.0000, 0.0000, 43.1999); //minigun_base
	SetObjectMaterial(SaNews[195], 0, 3314, "ce_burbhouse", "black_128", 0x00000000);
	SetObjectMaterial(SaNews[195], 1, 3314, "ce_burbhouse", "black_128", 0x00000000);
	SaNews[196] = CreateObject(1886, 797.8590, -1318.9587, 709.9605, 0.0000, 180.0000, -144.9998); //shop_sec_cam
	SetObjectMaterial(SaNews[196], 1, 14832, "lee_stripclub", "Strip_ceiling", 0x00000000);
	SaNews[197] = CreateObject(1886, 797.9929, -1319.0498, 709.9605, 0.0000, 180.0000, 34.1001); //shop_sec_cam
	SetObjectMaterial(SaNews[197], 1, 14832, "lee_stripclub", "Strip_ceiling", 0x00000000);
	SaNews[198] = CreateObject(1886, 787.0443, -1318.3541, 709.9605, 0.0000, 180.0000, 133.3999); //shop_sec_cam
	SetObjectMaterial(SaNews[198], 1, 14832, "lee_stripclub", "Strip_ceiling", 0x00000000);
	SaNews[199] = CreateObject(1886, 786.9414, -1318.5058, 709.9605, 0.0000, 180.0000, -46.4999); //shop_sec_cam
	SetObjectMaterial(SaNews[199], 1, 14832, "lee_stripclub", "Strip_ceiling", 0x00000000);
	SaNews[200] = CreateObject(19175, 784.9168, -1329.9947, 714.2406, 0.0000, 0.0000, 180.0000); //SAMPPicture4
	SetObjectMaterialText(SaNews[200], "&#252;", 0, 90, "Webdings", 80, 1, 0xFFFFFFFF, 0x0, 1);
	SetObjectMaterial(SaNews[200], 1, 0, "INVALID", "INVALID", 0xFFFFFFFF);
	SaNews[201] = CreateObject(19175, 787.4973, -1333.0046, 714.3107, 0.0000, 0.0000, -90.0000); //SAMPPicture4
	SetObjectMaterialText(SaNews[201], "Abteilung l", 0, 90, "Arial", 60, 1, 0xFFFFFFFF, 0x0, 1);
	SetObjectMaterial(SaNews[201], 1, 0, "INVALID", "INVALID", 0xFFFFFFFF);
	SaNews[202] = CreateObject(19175, 784.9168, -1329.9947, 714.2406, 0.0000, 0.0000, 0.0000); //SAMPPicture4
	SetObjectMaterialText(SaNews[202], "&#252;", 0, 90, "Webdings", 80, 1, 0xFFFFFFFF, 0x0, 1);
	SetObjectMaterial(SaNews[202], 1, 0, "INVALID", "INVALID", 0xFFFFFFFF);
	SaNews[203] = CreateObject(19175, 801.6181, -1337.7369, 711.6005, 0.0000, 90.0000, -90.0000); //SAMPPicture4
	SetObjectMaterialText(SaNews[203], "__", 0, 130, "Arial", 30, 1, 0xFFFFFFFF, 0x0, 1);
	SetObjectMaterial(SaNews[203], 1, 0, "INVALID", "INVALID", 0xFFFFFFFF);
	SaNews[204] = CreateObject(19175, 787.4973, -1335.2552, 714.3107, 0.0000, 0.0000, -90.0000); //SAMPPicture4
	SetObjectMaterialText(SaNews[204], "Regie", 0, 90, "Arial", 60, 1, 0xFFFFFFFF, 0x0, 1);
	SetObjectMaterial(SaNews[204], 1, 0, "INVALID", "INVALID", 0xFFFFFFFF);
	SaNews[205] = CreateObject(19355, 792.1400, -1322.3786, 709.2100, 0.0000, 90.0000, 90.0000); //wall003
	SetObjectMaterialText(SaNews[205], "------------------------------", 0, 90, "Arial", 29, 1, 0xFFFFFFFF, 0x0, 0);
	SetObjectMaterial(SaNews[205], 1, 0, "INVALID", "INVALID", 0xFFFFFFFF);
	SaNews[206] = CreateObject(19355, 797.0515, -1319.1407, 709.2100, 0.0000, 90.0000, 118.5998); //wall003
	SetObjectMaterialText(SaNews[206], "------------------------------", 0, 90, "Arial", 24, 1, 0xFFFFFFFF, 0x0, 1);
	SetObjectMaterial(SaNews[206], 1, 0, "INVALID", "INVALID", 0xFFFFFFFF);
	SaNews[207] = CreateObject(19175, 787.4973, -1333.0046, 714.3107, 0.0000, 0.0000, 90.0000); //SAMPPicture4
	SetObjectMaterialText(SaNews[207], "Abteilung", 0, 90, "Arial", 60, 1, 0xFFFFFFFF, 0x0, 1);
	SetObjectMaterial(SaNews[207], 1, 0, "INVALID", "INVALID", 0xFFFFFFFF);
	SaNews[208] = CreateObject(19365, 790.7418, -1310.7264, 712.3963, 0.0000, 0.0000, 90.0000); //wall013
	SetObjectMaterialText(SaNews[208], "Tin Tuc", 0, 130, "Arial", 50, 1, 0xFFFFFFFF, 0x0, 1);
	SetObjectMaterial(SaNews[208], 1, 0, "INVALID", "INVALID", 0xFFFFFFFF);
	SaNews[209] = CreateObject(19355, 789.6865, -1320.0267, 709.2100, 0.0000, 90.0000, 40.5000); //wall003
	SetObjectMaterialText(SaNews[209], "------------------------------", 0, 90, "Arial", 24, 1, 0xFFFFFFFF, 0x0, 1);
	SetObjectMaterial(SaNews[209], 1, 0, "INVALID", "INVALID", 0xFFFFFFFF);
	SaNews[210] = CreateObject(19355, 787.9719, -1318.0185, 709.2100, 0.0000, 90.0000, 40.5000); //wall003
	SetObjectMaterialText(SaNews[210], "------------------------------", 0, 90, "Arial", 24, 1, 0xFFFFFFFF, 0x0, 1);
	SetObjectMaterial(SaNews[210], 1, 0, "INVALID", "INVALID", 0xFFFFFFFF);
	SaNews[211] = CreateObject(19355, 794.7158, -1320.4139, 709.2100, 0.0000, 90.0000, 118.5998); //wall003
	SetObjectMaterialText(SaNews[211], "------------------------------", 0, 90, "Arial", 24, 1, 0xFFFFFFFF, 0x0, 1);
	SetObjectMaterial(SaNews[211], 1, 0, "INVALID", "INVALID", 0xFFFFFFFF);
	SaNews[212] = CreateObject(2167, 801.5996, -1325.0633, 709.3068, 0.0000, 0.0000, -90.0000); //MED_OFFICE_UNIT_7
	SaNews[213] = CreateObject(19814, 800.2299, -1339.3385, 709.4547, 0.0000, 0.0000, 180.0000); //ElectricalOutlet2
	SaNews[214] = CreateObject(19814, 801.5700, -1338.5079, 709.4547, 0.0000, 0.0000, 270.0000); //ElectricalOutlet2
	SaNews[215] = CreateObject(19814, 801.5700, -1334.5157, 709.4547, 0.0000, 0.0000, 270.0000); //ElectricalOutlet2
	SaNews[216] = CreateObject(1714, 785.6276, -1331.8933, 712.4362, 0.0000, 0.0000, -90.0000); //kb_swivelchair1
	SaNews[217] = CreateObject(2001, 783.4323, -1338.7136, 712.4301, 0.0000, 0.0000, 0.0000); //nu_plant_ofc
	SetObjectMaterial(SaNews[217], 1, 12855, "cunte_cop", "ws_bigstones", 0x00000000);
	SaNews[218] = CreateObject(2001, 786.2423, -1337.5321, 712.4301, 0.0000, 0.0000, 0.0000); //nu_plant_ofc
	SetObjectMaterial(SaNews[218], 1, 12855, "cunte_cop", "ws_bigstones", 0x00000000);
	SaNews[219] = CreateObject(2001, 786.2423, -1330.6914, 712.4301, 0.0000, 0.0000, 0.0000); //nu_plant_ofc
	SetObjectMaterial(SaNews[219], 1, 12855, "cunte_cop", "ws_bigstones", 0x00000000);
	SaNews[220] = CreateObject(18075, 782.3010, -1336.3984, 716.1018, 0.0000, 0.0000, 0.0000); //lightD
	SaNews[221] = CreateObject(2001, 787.0725, -1331.2213, 712.4301, 0.0000, 0.0000, 0.0000); //nu_plant_ofc
	SetObjectMaterial(SaNews[221], 1, 12855, "cunte_cop", "ws_bigstones", 0x00000000);
	SaNews[222] = CreateObject(19786, 782.6610, -1333.9591, 714.9713, 0.0000, 0.0000, 90.0000); //LCDTVBig1
	SetObjectMaterial(SaNews[222], 1, 6490, "tvstudio_law2", "tvstud03_LAw2", 0x00000000);
	SaNews[223] = CreateObject(14391, 783.6325, -1333.9090, 713.2670, 0.0000, 0.0000, 0.0000); //Dr_GsNEW07
	SetObjectMaterial(SaNews[223], 0, 16640, "a51", "a51_boffstuff3", 0x00000000);
	SetObjectMaterial(SaNews[223], 3, 10226, "sfeship1", "sf_ship_screen1", 0x00000000);
	SetObjectMaterial(SaNews[223], 4, 10226, "sfeship1", "sf_ship_screen1", 0x00000000);
	SetObjectMaterial(SaNews[223], 5, 3267, "milbase", "a51_boffstuff2", 0x00000000);
	SetObjectMaterial(SaNews[223], 6, 16640, "a51", "a51_boffstuff3", 0x00000000);
	SetObjectMaterial(SaNews[223], 7, 6000, "con_drivein", "drvin_screen", 0x00000000);
	SetObjectMaterial(SaNews[223], 11, 14392, "dr_gsstudio", "amp04", 0x00000000);
	SetObjectMaterial(SaNews[223], 12, 10765, "airportgnd_sfse", "white", 0x00000000);
	SetObjectMaterial(SaNews[223], 13, 10226, "sfeship1", "sf_ship_screen1", 0x00000000);
	SetObjectMaterial(SaNews[223], 14, 2894, "kmb_notebook", "kmb_notebook", 0x00000000);
	SaNews[224] = CreateObject(19786, 782.6411, -1333.9591, 714.9713, 0.0000, 0.0000, 90.0000); //LCDTVBig1
	SaNews[225] = CreateObject(2271, 787.5490, -1338.8381, 712.6231, 0.0000, 0.0000, 180.0000); //Frame_WOOD_1
	SetObjectMaterial(SaNews[225], 0, 1560, "7_11_door", "CJ_CHROME2", 0x00000000);
	SetObjectMaterial(SaNews[225], 1, 14812, "lee_studhall", "GoldDisk1", 0x00000000);
	SaNews[226] = CreateObject(2271, 789.0792, -1338.8381, 711.8225, 0.0000, 0.0000, 180.0000); //Frame_WOOD_1
	SetObjectMaterial(SaNews[226], 0, 1560, "7_11_door", "CJ_CHROME2", 0x00000000);
	SetObjectMaterial(SaNews[226], 1, 14812, "lee_studhall", "GoldDisk1", 0x00000000);
	SaNews[227] = CreateObject(2001, 787.0421, -1336.7618, 712.4301, 0.0000, 0.0000, 0.0000); //nu_plant_ofc
	SetObjectMaterial(SaNews[227], 1, 12855, "cunte_cop", "ws_bigstones", 0x00000000);
	SaNews[228] = CreateObject(1846, 784.7489, -1338.8680, 713.4843, 0.0000, 90.0000, 90.0000); //shop_shelf04
	SetObjectMaterial(SaNews[228], 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	SaNews[229] = CreateObject(19375, 806.3756, -1326.7143, 707.0523, 0.0000, 0.0000, 90.0000); //wall023
	SetObjectMaterial(SaNews[229], 0, 10765, "airportgnd_sfse", "white", 0xFFFFF0F5);
	SaNews[230] = CreateObject(1714, 785.4874, -1335.8443, 712.4362, 0.0000, 0.0000, -90.0000); //kb_swivelchair1
	SaNews[231] = CreateObject(19565, 801.5825, -1327.3314, 712.1008, 0.0000, 0.0000, 90.0000); //IceCreamBarsBox1
	SetObjectMaterial(SaNews[231], 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	SaNews[232] = CreateObject(19375, 806.3565, -1330.1750, 707.1223, 0.0000, 0.0000, 90.0000); //wall023
	SetObjectMaterial(SaNews[232], 0, 10765, "airportgnd_sfse", "white", 0xFFFFF0F5);
	SaNews[233] = CreateObject(19565, 801.5825, -1326.8619, 712.1008, 0.0000, 0.0000, 90.0000); //IceCreamBarsBox1
	SetObjectMaterial(SaNews[233], 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	SaNews[234] = CreateObject(1819, 784.1801, -1325.9305, 709.2924, 0.0000, 0.0000, 0.0000); //COFFEE_SWANK_4
	SetObjectMaterial(SaNews[234], 0, 1355, "break_s_bins", "marble1", 0x00000000);
	SaNews[235] = CreateObject(19565, 801.5825, -1327.7812, 712.1008, 0.0000, 0.0000, 90.0000); //IceCreamBarsBox1
	SetObjectMaterial(SaNews[235], 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	SaNews[236] = CreateObject(19565, 801.5825, -1330.0019, 712.1008, 0.0000, 0.0000, 90.0000); //IceCreamBarsBox1
	SetObjectMaterial(SaNews[236], 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	SaNews[237] = CreateObject(19565, 801.5825, -1329.5515, 712.1008, 0.0000, 0.0000, 90.0000); //IceCreamBarsBox1
	SetObjectMaterial(SaNews[237], 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	SaNews[238] = CreateObject(19565, 801.5825, -1329.1009, 712.1008, 0.0000, 0.0000, 90.0000); //IceCreamBarsBox1
	SetObjectMaterial(SaNews[238], 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	SaNews[239] = CreateObject(11717, 783.7609, -1324.0102, 709.1666, 0.0000, 0.0000, 44.4999); //WooziesCouch1
	SaNews[240] = CreateObject(19565, 801.5825, -1328.6308, 712.1008, 0.0000, 0.0000, 90.0000); //IceCreamBarsBox1
	SetObjectMaterial(SaNews[240], 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	SaNews[241] = CreateObject(19565, 801.5825, -1328.2407, 712.1008, 0.0000, 0.0000, 90.0000); //IceCreamBarsBox1
	SetObjectMaterial(SaNews[241], 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	SaNews[242] = CreateObject(19565, 801.5825, -1328.1706, 712.3510, 0.0000, 0.0000, 90.0000); //IceCreamBarsBox1
	SetObjectMaterial(SaNews[242], 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	SaNews[243] = CreateObject(11717, 783.5908, -1326.6866, 709.1666, 0.0000, 0.0000, 119.6997); //WooziesCouch1
	SaNews[244] = CreateObject(19565, 801.5825, -1328.6208, 712.3510, 0.0000, 0.0000, 90.0000); //IceCreamBarsBox1
	SetObjectMaterial(SaNews[244], 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	SaNews[245] = CreateObject(19565, 801.5822, -1328.5107, 712.2509, 0.0000, 0.0000, 90.0000); //IceCreamBarsBox1
	SetObjectMaterial(SaNews[245], 0, 10765, "airportgnd_sfse", "white", 0xFFFFA500);
	SaNews[246] = CreateObject(19565, 801.5822, -1328.2906, 712.2509, 0.0000, 0.0000, 90.0000); //IceCreamBarsBox1
	SetObjectMaterial(SaNews[246], 0, 10765, "airportgnd_sfse", "white", 0xFFFFA500);
	SaNews[247] = CreateObject(11711, 801.5725, -1328.4110, 712.3814, 0.0000, 0.0000, 90.0000); //ExitSign1
	SaNews[248] = CreateObject(13646, 783.2404, -1325.4449, 708.6959, 0.0000, 0.0000, 0.0000); //ramplandpad
	SetObjectMaterial(SaNews[248], 0, 10765, "airportgnd_sfse", "white", 0xFFFFA500);
	SetObjectMaterial(SaNews[248], 1, 10765, "airportgnd_sfse", "white", 0x00000000);
	SaNews[249] = CreateObject(19611, 784.5263, -1324.9807, 708.3751, 0.0000, 0.0000, 0.0000); //MicrophoneStand1
	SaNews[250] = CreateObject(19611, 784.5263, -1325.8215, 708.3751, 0.0000, 0.0000, 0.0000); //MicrophoneStand1
	SaNews[251] = CreateObject(2167, 801.5999, -1324.1427, 709.3068, 0.0000, 0.0000, -90.0000); //MED_OFFICE_UNIT_7
	SaNews[252] = CreateObject(19610, 784.5377, -1325.0124, 710.0053, 0.0000, 0.0000, 23.9999); //Microphone1
	SaNews[253] = CreateObject(2169, 801.4749, -1323.0570, 709.2442, 0.0000, 0.0000, 90.0000); //MED_OFFICE3_DESK_1
	SaNews[254] = CreateObject(19610, 784.5189, -1325.8314, 710.0053, 0.0000, 0.0000, 124.9999); //Microphone1
	SaNews[255] = CreateObject(19431, 782.6870, -1323.8409, 710.2907, 0.0000, 0.0000, 0.0000); //wall071
	SetObjectMaterial(SaNews[255], 0, 6282, "beafron2_law2", "boardwalk2_la", 0x00000000);
	SaNews[256] = CreateObject(19431, 782.6970, -1323.8409, 713.7810, 0.0000, 0.0000, 0.0000); //wall071
	SetObjectMaterial(SaNews[256], 0, 6282, "beafron2_law2", "boardwalk2_la", 0x00000000);
	SaNews[257] = CreateObject(19431, 782.6870, -1323.8409, 717.2907, 0.0000, 0.0000, 0.0000); //wall071
	SetObjectMaterial(SaNews[257], 0, 6282, "beafron2_law2", "boardwalk2_la", 0x00000000);
	SaNews[258] = CreateObject(19431, 782.6870, -1326.7209, 711.0607, 0.0000, 0.0000, 0.0000); //wall071
	SetObjectMaterial(SaNews[258], 0, 6282, "beafron2_law2", "boardwalk2_la", 0x00000000);
	SaNews[259] = CreateObject(19431, 782.7069, -1326.7209, 714.5512, 0.0000, 0.0000, 0.0000); //wall071
	SetObjectMaterial(SaNews[259], 0, 6282, "beafron2_law2", "boardwalk2_la", 0x00000000);
	SaNews[260] = CreateObject(19431, 782.6848, -1328.3120, 711.0607, 0.0000, 0.0000, 0.0000); //wall071
	SetObjectMaterial(SaNews[260], 0, 6282, "beafron2_law2", "boardwalk2_la", 0x00000000);
	SaNews[261] = CreateObject(19431, 782.7050, -1328.3120, 714.5515, 0.0000, 0.0000, 0.0000); //wall071
	SetObjectMaterial(SaNews[261], 0, 6282, "beafron2_law2", "boardwalk2_la", 0x00000000);
	SaNews[262] = CreateObject(367, 801.3455, -1323.1223, 710.0703, 0.0000, 0.0000, 120.0000); //camera
	SaNews[263] = CreateObject(19431, 782.6870, -1322.2408, 710.2907, 0.0000, 0.0000, 0.0000); //wall071
	SetObjectMaterial(SaNews[263], 0, 6282, "beafron2_law2", "boardwalk2_la", 0x00000000);
	SaNews[264] = CreateObject(19431, 782.6870, -1322.2408, 713.7907, 0.0000, 0.0000, 0.0000); //wall071
	SetObjectMaterial(SaNews[264], 0, 6282, "beafron2_law2", "boardwalk2_la", 0x00000000);
	SaNews[265] = CreateObject(367, 801.4240, -1322.6379, 710.0703, 0.0000, 0.0000, 120.0000); //camera
	SaNews[266] = CreateObject(367, 801.3640, -1322.0135, 710.0703, 0.0000, 0.0000, 120.0000); //camera
	SaNews[267] = CreateObject(19431, 782.6870, -1322.2408, 717.2517, 0.0000, 0.0000, 0.0000); //wall071
	SetObjectMaterial(SaNews[267], 0, 6282, "beafron2_law2", "boardwalk2_la", 0x00000000);
	SaNews[268] = CreateObject(19431, 782.6787, -1316.4095, 710.2907, 0.0000, 0.0000, 0.0000); //wall071
	SetObjectMaterial(SaNews[268], 0, 6282, "beafron2_law2", "boardwalk2_la", 0x00000000);
	SaNews[269] = CreateObject(19431, 782.6870, -1314.8387, 710.2907, 0.0000, 0.0000, 0.0000); //wall071
	SetObjectMaterial(SaNews[269], 0, 6282, "beafron2_law2", "boardwalk2_la", 0x00000000);
	SaNews[270] = CreateObject(19431, 782.6889, -1314.8287, 711.8806, 0.0000, 0.0000, 0.0000); //wall071
	SetObjectMaterial(SaNews[270], 0, 6282, "beafron2_law2", "boardwalk2_la", 0x00000000);
	SaNews[271] = CreateObject(19431, 782.6870, -1313.2281, 713.2313, 0.0000, 0.0000, 0.0000); //wall071
	SetObjectMaterial(SaNews[271], 0, 6282, "beafron2_law2", "boardwalk2_la", 0x00000000);
	SaNews[272] = CreateObject(19431, 782.6868, -1313.2381, 709.7310, 0.0000, 0.0000, 0.0000); //wall071
	SetObjectMaterial(SaNews[272], 0, 6282, "beafron2_law2", "boardwalk2_la", 0x00000000);
	SaNews[273] = CreateObject(19431, 782.6868, -1311.6379, 709.7310, 0.0000, 0.0000, 0.0000); //wall071
	SetObjectMaterial(SaNews[273], 0, 6282, "beafron2_law2", "boardwalk2_la", 0x00000000);
	SaNews[274] = CreateObject(19431, 782.6868, -1311.6279, 713.2313, 0.0000, 0.0000, 0.0000); //wall071
	SetObjectMaterial(SaNews[274], 0, 6282, "beafron2_law2", "boardwalk2_la", 0x00000000);
	SaNews[275] = CreateObject(19431, 782.7069, -1311.6279, 716.7321, 0.0000, 0.0000, 0.0000); //wall071
	SetObjectMaterial(SaNews[275], 0, 6282, "beafron2_law2", "boardwalk2_la", 0x00000000);
	SaNews[276] = CreateObject(19431, 782.7069, -1310.0272, 716.7122, 0.0000, 0.0000, 0.0000); //wall071
	SetObjectMaterial(SaNews[276], 0, 6282, "beafron2_law2", "boardwalk2_la", 0x00000000);
	SaNews[277] = CreateObject(19431, 782.6868, -1310.0272, 713.2124, 0.0000, 0.0000, 0.0000); //wall071
	SetObjectMaterial(SaNews[277], 0, 6282, "beafron2_law2", "boardwalk2_la", 0x00000000);
	SaNews[278] = CreateObject(19431, 782.6868, -1310.0272, 709.7128, 0.0000, 0.0000, 0.0000); //wall071
	SetObjectMaterial(SaNews[278], 0, 6282, "beafron2_law2", "boardwalk2_la", 0x00000000);
	SaNews[279] = CreateObject(19431, 801.6779, -1316.4095, 710.2907, 0.0000, 0.0000, 0.0000); //wall071
	SetObjectMaterial(SaNews[279], 0, 6282, "beafron2_law2", "boardwalk2_la", 0x00000000);
	SaNews[280] = CreateObject(19431, 801.6779, -1314.8100, 710.2907, 0.0000, 0.0000, 0.0000); //wall071
	SetObjectMaterial(SaNews[280], 0, 6282, "beafron2_law2", "boardwalk2_la", 0x00000000);
	SaNews[281] = CreateObject(19431, 801.6799, -1314.8100, 711.9113, 0.0000, 0.0000, 0.0000); //wall071
	SetObjectMaterial(SaNews[281], 0, 6282, "beafron2_law2", "boardwalk2_la", 0x00000000);
	SaNews[282] = CreateObject(19431, 801.6801, -1313.2099, 713.2426, 0.0000, 0.0000, 0.0000); //wall071
	SetObjectMaterial(SaNews[282], 0, 6282, "beafron2_law2", "boardwalk2_la", 0x00000000);
	SaNews[283] = CreateObject(19431, 801.6799, -1313.2099, 709.7628, 0.0000, 0.0000, 0.0000); //wall071
	SetObjectMaterial(SaNews[283], 0, 6282, "beafron2_law2", "boardwalk2_la", 0x00000000);
	SaNews[284] = CreateObject(19431, 801.6799, -1311.6097, 709.7628, 0.0000, 0.0000, 0.0000); //wall071
	SetObjectMaterial(SaNews[284], 0, 6282, "beafron2_law2", "boardwalk2_la", 0x00000000);
	SaNews[285] = CreateObject(19431, 801.6779, -1311.6097, 713.2426, 0.0000, 0.0000, 0.0000); //wall071
	SetObjectMaterial(SaNews[285], 0, 6282, "beafron2_law2", "boardwalk2_la", 0x00000000);
	SaNews[286] = CreateObject(19431, 801.6779, -1311.6097, 716.7340, 0.0000, 0.0000, 0.0000); //wall071
	SetObjectMaterial(SaNews[286], 0, 6282, "beafron2_law2", "boardwalk2_la", 0x00000000);
	SaNews[287] = CreateObject(19431, 782.6870, -1320.6412, 710.2907, 0.0000, 0.0000, 0.0000); //wall071
	SetObjectMaterial(SaNews[287], 0, 6282, "beafron2_law2", "boardwalk2_la", 0x00000000);
	SaNews[288] = CreateObject(19431, 782.6870, -1320.6412, 710.2907, 0.0000, 0.0000, 0.0000); //wall071
	SetObjectMaterial(SaNews[288], 0, 6282, "beafron2_law2", "boardwalk2_la", 0x00000000);
	SaNews[289] = CreateObject(2270, 783.2686, -1325.3597, 710.2907, 0.0000, 0.0000, 90.0000); //Frame_WOOD_6
	SaNews[290] = CreateObject(19175, 782.7761, -1324.1115, 711.6054, 0.0000, 0.0000, 90.0000); //SAMPPicture4
	SetObjectMaterialText(SaNews[290], "Talk", 0, 90, "Arial", 45, 1, 0xFFD78E10, 0x0, 1);
	SetObjectMaterial(SaNews[290], 1, 0, "INVALID", "INVALID", 0xFFFFFFFF);
	SaNews[291] = CreateObject(19825, 782.8060, -1325.3425, 711.5712, 0.0000, 0.0000, 90.0000); //SprunkClock1
	SetObjectMaterial(SaNews[291], 0, 1654, "dynamite", "clock64", 0x00000000);
	SaNews[292] = CreateObject(2773, 784.9561, -1328.2672, 709.7937, 0.0000, 0.0000, -60.2999); //CJ_AIRPRT_BAR
	SaNews[293] = CreateObject(2010, 783.1256, -1327.3020, 709.2600, 0.0000, 0.0000, -50.7999); //nu_plant3_ofc
	SetObjectMaterial(SaNews[293], 0, 17958, "burnsalpha", "plantb256", 0x00000000);
	SaNews[294] = CreateObject(19175, 782.7761, -1324.0915, 711.6054, 0.0000, 0.0000, 90.0000); //SAMPPicture4
	SetObjectMaterialText(SaNews[294], "_____", 0, 90, "Arial", 45, 1, 0xFFD78E10, 0x0, 1);
	SetObjectMaterial(SaNews[294], 1, 0, "INVALID", "INVALID", 0xFFFFFFFF);
	SaNews[295] = CreateObject(19175, 782.7761, -1326.6519, 712.0557, 0.0000, 0.0000, 90.0000); //SAMPPicture4
	SetObjectMaterialText(SaNews[295], "______", 0, 90, "Arial", 47, 1, 0xFFD78E10, 0x0, 1);
	SetObjectMaterial(SaNews[295], 1, 0, "INVALID", "INVALID", 0xFFFFFFFF);
	SaNews[296] = CreateObject(19175, 782.7761, -1326.6519, 711.6054, 0.0000, 0.0000, 90.0000); //SAMPPicture4
	SetObjectMaterialText(SaNews[296], "______", 0, 90, "Arial", 47, 1, 0xFFD78E10, 0x0, 1);
	SetObjectMaterial(SaNews[296], 1, 0, "INVALID", "INVALID", 0xFFFFFFFF);
	SaNews[297] = CreateObject(19175, 782.7761, -1324.0915, 712.0557, 0.0000, 0.0000, 90.0000); //SAMPPicture4
	SetObjectMaterialText(SaNews[297], "_____", 0, 90, "Arial", 45, 1, 0xFFD78E10, 0x0, 1);
	SetObjectMaterial(SaNews[297], 1, 0, "INVALID", "INVALID", 0xFFFFFFFF);
	SaNews[298] = CreateObject(19355, 801.6696, -1323.4276, 712.0697, 0.0000, 0.0000, 0.0000); //wall003
	SetObjectMaterialText(SaNews[298], "__________", 0, 100, "Arial", 35, 1, 0xFFD78E10, 0x0, 1);
	SetObjectMaterial(SaNews[298], 1, 0, "INVALID", "INVALID", 0xFFFFFFFF);
	SaNews[299] = CreateObject(19355, 801.6696, -1323.4276, 712.5300, 0.0000, 0.0000, 0.0000); //wall003
	SetObjectMaterialText(SaNews[299], "__________", 0, 100, "Arial", 35, 1, 0xFFD78E10, 0x0, 1);
	SetObjectMaterial(SaNews[299], 1, 0, "INVALID", "INVALID", 0xFFFFFFFF);
	SaNews[300] = CreateObject(19355, 801.6596, -1323.4276, 712.1296, 0.0000, 0.0000, 0.0000); //wall003
	SetObjectMaterialText(SaNews[300], "Ausr&#252;stung", 0, 100, "Arial", 35, 1, 0xFFFFFFFF, 0x0, 1);
	SetObjectMaterial(SaNews[300], 1, 0, "INVALID", "INVALID", 0xFFFFFFFF);
	SaNews[301] = CreateObject(19814, 782.7708, -1325.4256, 709.4547, 0.0000, 0.0000, 90.0000); //ElectricalOutlet2
	SaNews[302] = CreateObject(19814, 782.7708, -1325.1754, 709.4547, 0.0000, 0.0000, 90.0000); //ElectricalOutlet2
	SaNews[303] = CreateObject(19814, 782.7708, -1333.3770, 709.4547, 0.0000, 0.0000, 90.0000); //ElectricalOutlet2
	SaNews[304] = CreateObject(19814, 782.7708, -1334.9769, 709.4547, 0.0000, 0.0000, 90.0000); //ElectricalOutlet2
	SaNews[305] = CreateObject(19431, 801.6900, -1319.0401, 710.2924, 0.0000, 0.0000, 0.0000); //wall071
	SetObjectMaterial(SaNews[305], 0, 6282, "beafron2_law2", "boardwalk2_la", 0x00000000);
	SaNews[306] = CreateObject(1522, 801.6658, -1318.0634, 709.2406, 0.0000, 0.0000, 90.0000); //Gen_doorSHOP3
	SetObjectMaterial(SaNews[306], 0, 2878, "cj_vic", "CJ_VICT_DOOR", 0xFFFFFFFF);
	SaNews[307] = CreateObject(1522, 801.6658, -1320.2143, 709.2406, 0.0000, 0.0000, 90.0000); //Gen_doorSHOP3
	SetObjectMaterial(SaNews[307], 0, 18008, "intclothesa", "CJ_VICT_DOOR2", 0xFFFFFFFF);
	SaNews[308] = CreateObject(19431, 801.6900, -1317.4399, 710.2924, 0.0000, 0.0000, 0.0000); //wall071
	SetObjectMaterial(SaNews[308], 0, 6282, "beafron2_law2", "boardwalk2_la", 0x00000000);
	SaNews[309] = CreateObject(19355, 801.6696, -1318.4870, 712.9697, 0.0000, 0.0000, 0.0000); //wall003
	SetObjectMaterialText(SaNews[309], "WC", 0, 100, "Arial", 60, 1, 0xFFFFFFFF, 0x0, 1);
	SetObjectMaterial(SaNews[309], 1, 0, "INVALID", "INVALID", 0xFFFFFFFF);
	SaNews[310] = CreateObject(1223, 782.6085, -1324.3398, 707.7719, 0.0000, 0.0000, 0.0000); //lampost_coast
	SetObjectMaterial(SaNews[310], 0, 1560, "7_11_door", "cj_sheetmetal2", 0x00000000);
	SaNews[311] = CreateObject(1223, 782.6085, -1326.3308, 707.7719, 0.0000, 0.0000, 0.0000); //lampost_coast
	SetObjectMaterial(SaNews[311], 0, 1560, "7_11_door", "cj_sheetmetal2", 0x00000000);
	SaNews[312] = CreateObject(2245, 784.8007, -1325.4007, 710.0667, 0.0000, 0.0000, 0.0000); //Plant_Pot_11
	SetObjectMaterial(SaNews[312], 0, 10385, "baseballground_sfs", "ws_baseballdirt", 0x00000000);
	SetObjectMaterial(SaNews[312], 1, 14581, "ab_mafiasuitea", "ab_wood01", 0x00000000);
	SetObjectMaterial(SaNews[312], 2, 804, "gta_proc_grasslanda", "veg_leafred", 0x00000000);
	SetObjectMaterial(SaNews[312], 3, 2895, "law_coffinfl", "hot_flowers1", 0x00000000);
	SaNews[313] = CreateObject(2010, 783.1109, -1323.5986, 709.2600, 0.0000, 0.0000, -50.7999); //nu_plant3_ofc
	SetObjectMaterial(SaNews[313], 0, 17958, "burnsalpha", "plantb256", 0x00000000);
	SaNews[314] = CreateObject(2773, 784.9627, -1322.3902, 709.7937, 0.0000, 0.0000, -117.9000); //CJ_AIRPRT_BAR
	SaNews[315] = CreateObject(19431, 782.6870, -1320.6412, 713.7813, 0.0000, 0.0000, 0.0000); //wall071
	SetObjectMaterial(SaNews[315], 0, 6282, "beafron2_law2", "boardwalk2_la", 0x00000000);
	SaNews[316] = CreateObject(19431, 782.6870, -1320.6412, 717.2515, 0.0000, 0.0000, 0.0000); //wall071
	SetObjectMaterial(SaNews[316], 0, 6282, "beafron2_law2", "boardwalk2_la", 0x00000000);
	SaNews[317] = CreateObject(19835, 784.3624, -1325.7115, 709.8668, 0.0000, 0.0000, 0.0000); //CoffeeCup1
	SaNews[318] = CreateObject(19835, 784.6624, -1324.9508, 709.8668, 0.0000, 0.0000, 0.0000); //CoffeeCup1
	SaNews[319] = CreateObject(19623, 788.2271, -1325.4425, 710.9605, 0.0000, 0.0000, -90.0000); //Camera1
	SaNews[320] = CreateObject(19611, 788.2459, -1325.4415, 709.2800, 0.0000, 0.0000, 0.0000); //MicrophoneStand1
	SaNews[321] = CreateObject(2370, 798.4309, -1333.3199, 709.2843, 0.0000, 0.0000, 0.0000); //Shop_set_1_Table
	SetObjectMaterial(SaNews[321], 0, 1949, "barrier", "plainboards64HV", 0x00000000);
	SaNews[322] = CreateObject(19431, 801.6875, -1320.6412, 710.2907, 0.0000, 0.0000, 0.0000); //wall071
	SetObjectMaterial(SaNews[322], 0, 6282, "beafron2_law2", "boardwalk2_la", 0x00000000);
	SaNews[323] = CreateObject(19431, 801.6875, -1322.2318, 710.2907, 0.0000, 0.0000, 0.0000); //wall071
	SetObjectMaterial(SaNews[323], 0, 6282, "beafron2_law2", "boardwalk2_la", 0x00000000);
	SaNews[324] = CreateObject(19431, 801.6774, -1322.2318, 711.9404, 0.0000, 0.0000, 0.0000); //wall071
	SetObjectMaterial(SaNews[324], 0, 6282, "beafron2_law2", "boardwalk2_la", 0x00000000);
	SaNews[325] = CreateObject(19431, 801.6774, -1323.8321, 713.5512, 0.0000, 0.0000, 0.0000); //wall071
	SetObjectMaterial(SaNews[325], 0, 6282, "beafron2_law2", "boardwalk2_la", 0x00000000);
	SaNews[326] = CreateObject(19431, 801.6774, -1323.8321, 710.0510, 0.0000, 0.0000, 0.0000); //wall071
	SetObjectMaterial(SaNews[326], 0, 6282, "beafron2_law2", "boardwalk2_la", 0x00000000);
	SaNews[327] = CreateObject(19431, 801.6774, -1325.4226, 710.0510, 0.0000, 0.0000, 0.0000); //wall071
	SetObjectMaterial(SaNews[327], 0, 6282, "beafron2_law2", "boardwalk2_la", 0x00000000);
	SaNews[328] = CreateObject(19431, 801.6793, -1325.4226, 713.5512, 0.0000, 0.0000, 0.0000); //wall071
	SetObjectMaterial(SaNews[328], 0, 6282, "beafron2_law2", "boardwalk2_la", 0x00000000);
	SaNews[329] = CreateObject(19431, 801.6774, -1325.4226, 714.5518, 0.0000, 0.0000, 0.0000); //wall071
	SetObjectMaterial(SaNews[329], 0, 6282, "beafron2_law2", "boardwalk2_la", 0x00000000);
	SaNews[330] = CreateObject(19431, 801.6774, -1327.0218, 714.5518, 0.0000, 0.0000, 0.0000); //wall071
	SetObjectMaterial(SaNews[330], 0, 6282, "beafron2_law2", "boardwalk2_la", 0x00000000);
	SaNews[331] = CreateObject(19431, 801.6774, -1328.6225, 714.5518, 0.0000, 0.0000, 0.0000); //wall071
	SetObjectMaterial(SaNews[331], 0, 6282, "beafron2_law2", "boardwalk2_la", 0x00000000);
	SaNews[332] = CreateObject(19431, 801.6774, -1330.2231, 714.5518, 0.0000, 0.0000, 0.0000); //wall071
	SetObjectMaterial(SaNews[332], 0, 6282, "beafron2_law2", "boardwalk2_la", 0x00000000);
	SaNews[333] = CreateObject(19431, 801.6674, -1331.3936, 714.5518, 0.0000, 0.0000, 0.0000); //wall071
	SetObjectMaterial(SaNews[333], 0, 6282, "beafron2_law2", "boardwalk2_la", 0x00000000);
	SaNews[334] = CreateObject(19431, 801.6674, -1331.3537, 711.0518, 0.0000, 0.0000, 0.0000); //wall071
	SetObjectMaterial(SaNews[334], 0, 6282, "beafron2_law2", "boardwalk2_la", 0x00000000);
	SaNews[335] = CreateObject(19431, 801.6674, -1332.9543, 711.0418, 0.0000, 0.0000, 0.0000); //wall071
	SetObjectMaterial(SaNews[335], 0, 6282, "beafron2_law2", "boardwalk2_la", 0x00000000);
	SaNews[336] = CreateObject(19431, 801.6693, -1332.9543, 712.9321, 0.0000, 0.0000, 0.0000); //wall071
	SetObjectMaterial(SaNews[336], 0, 6282, "beafron2_law2", "boardwalk2_la", 0x00000000);
	SaNews[337] = CreateObject(19431, 801.6674, -1334.5550, 711.3118, 0.0000, 0.0000, 0.0000); //wall071
	SetObjectMaterial(SaNews[337], 0, 6282, "beafron2_law2", "boardwalk2_la", 0x00000000);
	SaNews[338] = CreateObject(19431, 801.6674, -1334.5550, 707.8015, 0.0000, 0.0000, 0.0000); //wall071
	SetObjectMaterial(SaNews[338], 0, 6282, "beafron2_law2", "boardwalk2_la", 0x00000000);
	SaNews[339] = CreateObject(19431, 801.6674, -1339.0366, 707.8015, 0.0000, 0.0000, 0.0000); //wall071
	SetObjectMaterial(SaNews[339], 0, 6282, "beafron2_law2", "boardwalk2_la", 0x00000000);
	SaNews[340] = CreateObject(19431, 801.6674, -1339.0366, 711.3117, 0.0000, 0.0000, 0.0000); //wall071
	SetObjectMaterial(SaNews[340], 0, 6282, "beafron2_law2", "boardwalk2_la", 0x00000000);
	SaNews[341] = CreateObject(19431, 801.6774, -1339.7270, 713.4716, 0.0000, 0.0000, 0.0000); //wall071
	SetObjectMaterial(SaNews[341], 0, 6282, "beafron2_law2", "boardwalk2_la", 0x00000000);
	SaNews[342] = CreateObject(2370, 794.1204, -1337.0499, 709.2843, 0.0000, 0.0000, 0.0000); //Shop_set_1_Table
	SetObjectMaterial(SaNews[342], 0, 1949, "barrier", "plainboards64HV", 0x00000000);
	SaNews[343] = CreateObject(18075, 797.1143, -1333.0625, 716.3305, 0.0000, 0.0000, 0.0000); //lightD
	SaNews[344] = CreateObject(18075, 797.1143, -1318.1108, 716.3305, 0.0000, 0.0000, 0.0000); //lightD
	SaNews[345] = CreateObject(18075, 787.4130, -1318.1108, 716.3305, 0.0000, 0.0000, 0.0000); //lightD
	SaNews[346] = CreateObject(18075, 787.4130, -1332.9742, 716.3305, 0.0000, 0.0000, 0.0000); //lightD
	SaNews[347] = CreateObject(18981, 803.9027, -1337.7851, 708.8206, 0.0000, 90.0000, 0.0000); //Concrete1mx25mx25m
	SetObjectMaterial(SaNews[347], 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	SaNews[348] = CreateObject(18981, 804.0631, -1338.0052, 708.8306, 0.0000, 90.0000, 0.0000); //Concrete1mx25mx25m
	SetObjectMaterial(SaNews[348], 0, 14500, "imm_roomss", "mp_motel_carpet", 0x00000000);
	SaNews[349] = CreateObject(19175, 787.4973, -1335.3951, 714.3107, 0.0000, 0.0000, 90.0000); //SAMPPicture4
	SetObjectMaterialText(SaNews[349], "Regie l", 0, 90, "Arial", 60, 1, 0xFFFFFFFF, 0x0, 1);
	SetObjectMaterial(SaNews[349], 1, 0, "INVALID", "INVALID", 0xFFFFFFFF);
	SaNews[350] = CreateObject(19355, 801.6895, -1319.4771, 711.9097, 0.0000, 0.0000, 0.0000); //wall003
	SetObjectMaterialText(SaNews[350], "Frauen", 0, 140, "Arial", 35, 1, 0xFFD78E10, 0x0, 1);
	SetObjectMaterial(SaNews[350], 1, 0, "INVALID", "INVALID", 0xFFFFFFFF);
	SaNews[351] = CreateObject(19175, 801.5980, -1336.8759, 711.8507, 0.0000, 0.0000, -90.0000); //SAMPPicture4
	SetObjectMaterialText(SaNews[351], "Tin Tuc", 0, 90, "Arial", 30, 1, 0xFFFFFFFF, 0x0, 1);
	SetObjectMaterial(SaNews[351], 1, 0, "INVALID", "INVALID", 0xFFFFFFFF);
	SaNews[352] = CreateObject(19175, 801.5980, -1337.2763, 711.6405, 0.0000, 0.0000, -90.0000); //SAMPPicture4
	SetObjectMaterialText(SaNews[352], "Los Santos", 0, 130, "Arial", 30, 1, 0xFFFFFFFF, 0x0, 1);
	SetObjectMaterial(SaNews[352], 1, 0, "INVALID", "INVALID", 0xFFFFFFFF);
	SaNews[353] = CreateObject(19175, 801.6181, -1337.3065, 711.6005, 0.0000, 0.0000, -90.0000); //SAMPPicture4
	SetObjectMaterialText(SaNews[353], "__________", 0, 130, "Arial", 30, 1, 0xFFFFFFFF, 0x0, 1);
	SetObjectMaterial(SaNews[353], 1, 0, "INVALID", "INVALID", 0xFFFFFFFF);
	SaNews[354] = CreateObject(19175, 801.6181, -1336.3558, 712.0905, 0.0000, 0.0000, -90.0000); //SAMPPicture4
	SetObjectMaterialText(SaNews[354], "__________", 0, 130, "Arial", 30, 1, 0xFFFFFFFF, 0x0, 1);
	SetObjectMaterial(SaNews[354], 1, 0, "INVALID", "INVALID", 0xFFFFFFFF);
	SaNews[355] = CreateObject(19355, 801.6696, -1317.3170, 711.9097, 0.0000, 0.0000, 0.0000); //wall003
	SetObjectMaterialText(SaNews[355], "M&#228;nner", 0, 140, "Arial", 35, 1, 0xFFD78E10, 0x0, 1);
	SetObjectMaterial(SaNews[355], 1, 0, "INVALID", "INVALID", 0xFFFFFFFF);
	SaNews[356] = CreateObject(19175, 801.6181, -1336.0655, 711.9404, 0.0000, 90.0000, -90.0000); //SAMPPicture4
	SetObjectMaterialText(SaNews[356], "__", 0, 130, "Arial", 30, 1, 0xFFFFFFFF, 0x0, 1);
	SetObjectMaterial(SaNews[356], 1, 0, "INVALID", "INVALID", 0xFFFFFFFF);
	SaNews[357] = CreateObject(16780, 785.0345, -1334.3840, 716.4608, 0.0000, 0.0000, 0.0000); //ufo_light03

	//Int City Hall 
	new kek;
	CreateDynamicObject(2327, 512.219666, -73.598709, 999.099976, 0.000000, 0.000000, 270.000000, -1, -1);
	CreateDynamicObject(2327, 512.219971, -73.705002, 999.099976, 0.000000, 0.000000, 270.000000, -1, -1);
	CreateDynamicObject(2327, 512.219666, -73.814003, 999.099976, 0.000000, 0.000000, 270.000000, -1, -1);
	CreateDynamicObject(19362, 617.653992, -24.885000, 999.880310, 0.000000, 90.000000, 0.000000, -1, -1);
	CreateDynamicObject(19362, 603.936890, -10.840900, 999.878296, 0.000000, 90.000000, 90.000000, -1, -1);
	CreateDynamicObject(19362, 632.574280, -11.855700, 999.882874, 0.000000, 90.000000, 0.000000, -1, -1);
	CreateDynamicObject(19356, 598.274414, -20.291500, 999.826599, 0.000000, 90.000000, 0.000000, -1, -1);
	CreateDynamicObject(19356, 609.774414, -13.352500, 999.864624, 0.000000, 90.000000, 90.000000, -1, -1);
	CreateDynamicObject(19356, 615.274414, -17.886499, 999.839600, 0.000000, 90.000000, 0.000000, -1, -1);
	CreateDynamicObject(8656, 368.239990, 150.000000, 1022.609985, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(2395, 370.399414, 160.000000, 1013.200012, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(2395, 370.399994, 160.000000, 1015.000000, 0.000000, 0.000000, 0.000000, -1, -1);
	kek = CreateDynamicObject(1557, 619.019348, -26.500204, 999.972900, 0.000000, -0.000037, 179.999771, -1, -1);
	kek = CreateDynamicObject(1557, 615.992065, -26.503004, 999.972900, 0.000000, 0.000037, 0.000000, -1, -1);
	kek = CreateDynamicObject(19380, 618.073853, -26.639187, 1004.772827, 89.999992, 180.000031, -89.999962, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 3820, "boxhses_sfsx", "stonewall_la", 0xFFFFFFFFFFFFFFFF);
	kek = CreateDynamicObject(13648, 617.024597, -26.205008, 1005.372864, 0.000000, 0.000045, 269.999969, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 10765, "airportgnd_sfse", "white", 0);
	kek = CreateDynamicObject(14793, 617.386230, -25.899603, 1005.712219, 0.000000, 0.000007, 0.000000, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 19962, "samproadsigns", "materialtext1", 0);
	CreateDynamicObject(2345, 613.147827, -24.243687, 1001.032898, 0.000037, 0.000000, 89.999886, -1, -1);
	CreateDynamicObject(2345, 613.028442, -24.254585, 1001.032898, 0.000037, 0.000000, 89.999886, -1, -1);
	CreateDynamicObject(19325, 622.030701, -25.935976, 998.821411, 0.000014, -0.000029, 179.999741, -1, -1);
	CreateDynamicObject(19325, 613.056641, -26.050976, 998.821411, 0.000000, 0.000000, 180.000000, -1, -1);
	CreateDynamicObject(19325, 622.030701, -27.685976, 998.821411, 0.000014, -0.000029, 179.999741, -1, -1);
	CreateDynamicObject(802, 612.668396, -24.312275, 1001.472900, 0.000000, -0.000037, 179.999771, -1, -1);
	kek = CreateDynamicObject(19443, 622.775146, -24.831608, 1000.832886, 0.000037, 90.000000, 89.999886, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 10765, "airportgnd_sfse", "white", 0);
	CreateDynamicObject(802, 612.549011, -24.323177, 1001.472900, 0.000000, -0.000037, 179.999771, -1, -1);
	CreateDynamicObject(802, 612.548950, -24.323204, 1001.472900, 0.000018, 0.000033, 29.999969, -1, -1);
	kek = CreateDynamicObject(19443, 622.775146, -24.831608, 999.992859, 0.000037, 90.000000, 89.999886, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 10765, "airportgnd_sfse", "white", 0);
	kek = CreateDynamicObject(19443, 612.299744, -24.831608, 1000.832886, 0.000037, 90.000000, 89.999886, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 10765, "airportgnd_sfse", "white", 0);
	CreateDynamicObject(2252, 612.366272, -24.479305, 1001.192871, 0.000000, -0.000037, 179.999771, -1, -1);
	kek = CreateDynamicObject(19443, 622.779480, -26.495001, 999.092896, 0.000037, 0.000000, 89.999886, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 10765, "airportgnd_sfse", "white", 0xFFFFFFFFFFFFFFFF);
	kek = CreateDynamicObject(19443, 612.299194, -24.831608, 999.992859, 0.000037, 90.000000, 89.999886, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 10765, "airportgnd_sfse", "white", 0);
	kek = CreateDynamicObject(19443, 612.299500, -26.510313, 999.092896, 0.000037, 0.000000, 89.999886, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 10765, "airportgnd_sfse", "white", 0);
	kek = CreateDynamicObject(19443, 622.779480, -23.075006, 999.092896, 0.000037, 0.000000, 89.999886, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 10765, "airportgnd_sfse", "white", 0xFFFFFFFFFFFFFFFF);
	CreateDynamicObject(19325, 623.513794, -25.186007, 998.821411, 0.000015, -0.000015, 179.999832, -1, -1);
	CreateDynamicObject(802, 622.750366, -22.227505, 1001.472900, 0.000033, 0.000018, 59.999943, -1, -1);
	kek = CreateDynamicObject(19377, 617.888672, -21.753004, 1005.892883, 0.000000, 90.000038, 0.000000, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 10765, "airportgnd_sfse", "white", 0xFFFFFFFFFFFFFFFF);
	kek = CreateDynamicObject(19443, 612.299561, -23.075006, 999.092896, 0.000037, 0.000000, 89.999886, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 10765, "airportgnd_sfse", "white", 0);
	CreateDynamicObject(2252, 622.788269, -22.197895, 1001.192871, 0.000000, -0.000037, 179.999771, -1, -1);
	CreateDynamicObject(802, 622.807678, -22.235874, 1001.472900, 0.000018, 0.000033, 29.999969, -1, -1);
	CreateDynamicObject(19325, 611.522095, -25.186007, 998.821411, 0.000015, -0.000007, 179.999878, -1, -1);
	CreateDynamicObject(19325, 622.030701, -21.155991, 998.821411, 0.000014, -0.000022, 179.999786, -1, -1);
	kek = CreateDynamicObject(19443, 622.775146, -21.332005, 1000.832886, 0.000037, 90.000000, 89.999886, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 10765, "airportgnd_sfse", "white", 0);
	kek = CreateDynamicObject(19443, 622.775146, -21.334206, 999.992859, 0.000037, 90.000000, 89.999886, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 10765, "airportgnd_sfse", "white", 0);
	kek = CreateDynamicObject(19443, 612.299744, -21.332005, 1000.832886, 0.000037, 90.000000, 89.999886, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 10765, "airportgnd_sfse", "white", 0);
	kek = CreateDynamicObject(19443, 612.299744, -21.332005, 999.992859, 0.000037, 90.000000, 89.999886, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 10765, "airportgnd_sfse", "white", 0);
	CreateDynamicObject(19325, 611.522095, -22.656004, 998.821411, 0.000015, -0.000007, 179.999878, -1, -1);
	CreateDynamicObject(859, 612.408081, -20.312607, 1001.372864, 0.000018, 0.000033, 29.999969, -1, -1);
	CreateDynamicObject(2241, 612.426331, -20.283527, 1001.252869, 0.000000, -0.000037, 179.999771, -1, -1);
	CreateDynamicObject(859, 612.408081, -20.272606, 1001.352905, 0.000000, -0.000037, 179.999771, -1, -1);
	CreateDynamicObject(646, 625.124939, -23.785925, 1001.372864, 0.000000, -0.000037, 179.999771, -1, -1);
	CreateDynamicObject(14804, 609.950745, -24.009977, 1000.952881, 0.000000, -0.000037, 179.999771, -1, -1);
	CreateDynamicObject(19325, 623.513794, -20.906004, 998.821411, 0.000015, -0.000015, 179.999832, -1, -1);
	CreateDynamicObject(19325, 622.030701, -19.405991, 998.821411, 0.000014, -0.000022, 179.999786, -1, -1);
	CreateDynamicObject(19325, 611.522095, -20.906004, 998.821411, 0.000015, -0.000007, 179.999878, -1, -1);
	kek = CreateDynamicObject(14793, 624.256226, -28.019617, 1005.712219, 0.000000, 0.000014, 0.000000, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 19962, "samproadsigns", "materialtext1", 0);
	CreateDynamicObject(19325, 613.056641, -19.410988, 998.821411, 0.000000, 0.000000, 180.000000, -1, -1);
	CreateDynamicObject(1703, 625.069580, -22.395847, 999.972900, 0.000037, 0.000000, 89.999886, -1, -1);
	kek = CreateDynamicObject(19443, 622.779480, -19.580307, 999.092896, 0.000037, 0.000000, 89.999886, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 10765, "airportgnd_sfse", "white", 0);
	kek = CreateDynamicObject(19443, 612.319519, -19.580307, 999.092896, 0.000037, 0.000000, 89.999886, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 10765, "airportgnd_sfse", "white", 0);
	kek = CreateDynamicObject(14793, 610.585938, -28.019617, 1005.712219, 0.000000, 0.000014, 0.000000, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 19962, "samproadsigns", "materialtext1", 0);
	CreateDynamicObject(2811, 622.806152, -18.924747, 1000.872864, 0.000000, -0.000037, 179.999771, -1, -1);
	CreateDynamicObject(1703, 608.789429, -24.281216, 999.972900, 0.000000, -0.000037, 179.999771, -1, -1);
	CreateDynamicObject(1703, 610.040344, -21.042107, 999.972900, -0.000037, 0.000000, -89.999886, -1, -1);
	kek = CreateDynamicObject(19786, 626.989258, -26.627907, 1002.612854, 0.000000, -0.000037, 179.999771, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 10765, "airportgnd_sfse", "black64", 0);
	kek = CreateDynamicObject(19443, 622.775146, -17.831104, 1000.832886, 0.000037, 90.000000, 89.999886, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 10765, "airportgnd_sfse", "white", 0);
	kek = CreateDynamicObject(19443, 622.775146, -17.831104, 999.992859, 0.000037, 90.000000, 89.999886, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 10765, "airportgnd_sfse", "white", 0);
	kek = CreateDynamicObject(19443, 612.299744, -17.831005, 1000.832886, 0.000037, 90.000000, 89.999886, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 10765, "airportgnd_sfse", "white", 0);
	CreateDynamicObject(646, 609.918396, -19.994156, 1001.372864, 0.000000, -0.000037, 179.999771, -1, -1);
	kek = CreateDynamicObject(19443, 612.299744, -17.831005, 999.992859, 0.000037, 90.000000, 89.999886, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 10765, "airportgnd_sfse", "white", 0);
	kek = CreateDynamicObject(19370, 617.508789, -17.236597, 1005.742798, 0.000000, 90.000061, 0.000000, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 10765, "airportgnd_sfse", "white", 0xFFFFFFFFFF808080);
	kek = CreateDynamicObject(19370, 617.499268, -17.236597, 1005.742798, 0.000000, 90.000061, 0.000000, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 10765, "airportgnd_sfse", "white", 0xFFFFFFFFFF808080);
	CreateDynamicObject(14804, 624.929993, -19.287407, 1000.952881, 0.000029, 0.000024, 49.999992, -1, -1);
	kek = CreateDynamicObject(19370, 617.499573, -17.209505, 1005.732910, 0.000000, 90.000061, 0.000000, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 10765, "airportgnd_sfse", "white", 0xFFFFFFFFFF282828);
	kek = CreateDynamicObject(19786, 607.722168, -26.639606, 1002.612854, 0.000000, -0.000037, 179.999771, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 10765, "airportgnd_sfse", "black64", 0);
	CreateDynamicObject(14804, 624.890015, -18.987408, 1000.952881, 0.000000, -0.000037, 179.999771, -1, -1);
	kek = CreateDynamicObject(3498, 622.771057, -16.870943, 1001.384888, 0.000037, 0.000000, 89.999886, -1, -1);
	SetDynamicObjectMaterial(kek, 1, 10765, "airportgnd_sfse", "white", 0xFFFFFFFFFFFFFAB8);
	SetDynamicObjectMaterial(kek, 0, 10765, "airportgnd_sfse", "white", 0xFFFFFFFFFFF5FF6B);
	kek = CreateDynamicObject(1827, 626.993713, -21.330257, 999.952881, 0.000000, 0.000037, 0.000000, -1, -1);
	SetDynamicObjectMaterial(kek, 1, 18065, "ab_sfammumain", "shelf_glas", 0xFFFFFFFFFFFFFFFF);
	SetDynamicObjectMaterial(kek, 0, 10765, "airportgnd_sfse", "black64", 0);
	kek = CreateDynamicObject(3498, 612.318665, -16.874428, 1001.384888, 0.000037, 0.000000, 89.999886, -1, -1);
	SetDynamicObjectMaterial(kek, 1, 10765, "airportgnd_sfse", "white", 0xFFFFFFFFFFFFFAB8);
	SetDynamicObjectMaterial(kek, 0, 10765, "airportgnd_sfse", "white", 0xFFFFFFFFFFF5FF6B);
	kek = CreateDynamicObject(1827, 607.844788, -22.002907, 999.972900, 0.000004, 0.000037, 8.999996, -1, -1);
	SetDynamicObjectMaterial(kek, 1, 18065, "ab_sfammumain", "shelf_glas", 0xFFFFFFFFFFFFFFFF);
	SetDynamicObjectMaterial(kek, 0, 10765, "airportgnd_sfse", "black64", 0);
	kek = CreateDynamicObject(19370, 617.499268, -16.416611, 1005.742798, 0.000000, 90.000061, 0.000000, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 10765, "airportgnd_sfse", "white", 0xFFFFFFFFFF808080);
	kek = CreateDynamicObject(19380, 607.577576, -26.640007, 1004.772827, 89.999992, 180.000031, -89.999962, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 3820, "boxhses_sfsx", "stonewall_la", 0xFFFFFFFFFFFFFFFF);
	CreateDynamicObject(1703, 626.034851, -19.400948, 999.972900, 0.000000, 0.000037, 0.000000, -1, -1);
	CreateDynamicObject(1703, 628.088623, -23.410177, 999.972900, 0.000000, -0.000037, 179.999771, -1, -1);
	kek = CreateDynamicObject(19444, 617.489075, -15.847805, 1005.692871, 0.000037, 90.000000, 89.999886, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 10765, "airportgnd_sfse", "white", 0xFFFFFFFFFFA5A5A5);
	kek = CreateDynamicObject(19786, 617.495972, -15.750005, 1005.732910, 89.999992, 360.000031, -89.999962, -1, -1);
	SetDynamicObjectMaterial(kek, 1, 14581, "ab_mafiasuitea", "barbersmir1", 0xFFFFFFFFFFFFFAB8);
	SetDynamicObjectMaterial(kek, 0, 19962, "samproadsigns", "materialtext1", 0);
	kek = CreateDynamicObject(19340, 627.385803, -22.497276, 996.240295, 0.000000, 0.000022, 0.000000, -1, -1);
	SetDynamicObjectMaterial(kek, 1, 19962, "samproadsigns", "materialtext1", 0);
	SetDynamicObjectMaterial(kek, 0, 16640, "a51", "ws_stationfloor", 0xFFFFFFFFF0FFFFFF);
	kek = CreateDynamicObject(19380, 628.541565, -26.660007, 1004.772827, 89.999992, 180.000031, -89.999962, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 3820, "boxhses_sfsx", "stonewall_la", 0xFFFFFFFFFFFFFFFF);
	CreateDynamicObject(19325, 609.736633, -17.651007, 998.821411, 0.000007, 0.000000, 89.999977, -1, -1);
	CreateDynamicObject(15038, 625.239258, -16.930607, 1001.532898, 0.000000, -0.000037, 179.999771, -1, -1);
	kek = CreateDynamicObject(19443, 625.328247, -16.880306, 1000.832886, 0.000000, 90.000038, 0.000000, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 10765, "airportgnd_sfse", "white", 0);
	kek = CreateDynamicObject(13648, 622.775146, -35.885006, 1005.372864, 0.000000, 0.000045, -0.000029, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 10765, "airportgnd_sfse", "white", 0);
	kek = CreateDynamicObject(19443, 625.328247, -16.880005, 999.992859, 0.000000, 90.000038, 0.000000, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 10765, "airportgnd_sfse", "white", 0);
	kek = CreateDynamicObject(13648, 612.299744, -35.895008, 1005.372864, 0.000000, 0.000045, -0.000029, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 10765, "airportgnd_sfse", "white", 0);
	kek = CreateDynamicObject(19443, 609.747681, -16.883507, 1000.832886, 0.000000, 90.000038, 0.000000, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 10765, "airportgnd_sfse", "white", 0);
	kek = CreateDynamicObject(19377, 607.388000, -21.753004, 1005.892883, 0.000000, 90.000038, 0.000000, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 10765, "airportgnd_sfse", "white", 0xFFFFFFFFFFFFFFFF);
	kek = CreateDynamicObject(19443, 609.747681, -16.883507, 999.992859, 0.000000, 90.000038, 0.000000, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 10765, "airportgnd_sfse", "white", 0);
	CreateDynamicObject(860, 609.636047, -16.803394, 1001.392883, 0.000018, 0.000033, 29.999969, -1, -1);
	CreateDynamicObject(860, 609.616028, -16.783398, 1001.392883, 0.000000, -0.000037, 179.999771, -1, -1);
	CreateDynamicObject(2811, 609.556152, -16.760374, 1000.872864, 0.000000, -0.000037, 179.999771, -1, -1);
	CreateDynamicObject(1703, 606.904785, -19.764206, 999.972900, 0.000000, 0.000037, 0.000000, -1, -1);
	kek = CreateDynamicObject(19377, 628.390564, -21.753004, 1005.892883, 0.000000, 90.000038, 0.000000, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 10765, "airportgnd_sfse", "white", 0xFFFFFFFFFFFFFFFF);
	CreateDynamicObject(19325, 626.804565, -17.606001, 998.821411, 0.000007, -0.000022, -90.000130, -1, -1);
	CreateDynamicObject(19325, 625.346802, -16.090984, 998.821411, 0.000007, 0.000000, 89.999977, -1, -1);
	kek = CreateDynamicObject(14793, 624.256226, -16.089605, 1005.712219, 0.000000, 0.000000, 0.000000, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 19962, "samproadsigns", "materialtext1", 0);
	kek = CreateDynamicObject(19370, 617.508789, -14.046598, 1005.742798, 0.000000, 90.000061, 0.000000, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 10765, "airportgnd_sfse", "white", 0xFFFFFFFFFF808080);
	kek = CreateDynamicObject(19370, 617.499573, -13.998004, 1005.732910, 0.000000, 90.000061, 0.000000, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 10765, "airportgnd_sfse", "white", 0xFFFFFFFFFF282828);
	CreateDynamicObject(19325, 609.736633, -16.090984, 998.821411, 0.000000, 0.000000, 90.000000, -1, -1);
	CreateDynamicObject(19325, 627.184631, -17.606001, 998.821411, 0.000007, -0.000022, -90.000130, -1, -1);
	CreateDynamicObject(19325, 607.986633, -17.651007, 998.821411, 0.000007, 0.000000, 89.999977, -1, -1);
	kek = CreateDynamicObject(14793, 610.585938, -16.089605, 1005.712219, 0.000000, 0.000000, 0.000000, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 19962, "samproadsigns", "materialtext1", 0);
	kek = CreateDynamicObject(19443, 627.077393, -16.887005, 999.092896, 0.000000, -0.000037, 179.999771, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 10765, "airportgnd_sfse", "white", 0);
	kek = CreateDynamicObject(19443, 607.996582, -16.893005, 999.092896, 0.000000, -0.000037, 179.999771, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 10765, "airportgnd_sfse", "white", 0);
	kek = CreateDynamicObject(19370, 617.499268, -13.366608, 1005.742798, 0.000000, 90.000061, 0.000000, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 10765, "airportgnd_sfse", "white", 0xFFFFFFFFFF808080);
	kek = CreateDynamicObject(19786, 617.495972, -13.030005, 1005.732910, 89.999992, 360.000031, -89.999962, -1, -1);
	SetDynamicObjectMaterial(kek, 1, 14581, "ab_mafiasuitea", "barbersmir1", 0xFFFFFFFFFFFFFAB8);
	SetDynamicObjectMaterial(kek, 0, 19962, "samproadsigns", "materialtext1", 0);
	CreateDynamicObject(19325, 627.096802, -16.090984, 998.821411, 0.000007, 0.000000, 89.999977, -1, -1);
	CreateDynamicObject(19325, 607.986633, -16.090984, 998.821411, 0.000000, 0.000000, 90.000000, -1, -1);
	CreateDynamicObject(626, 603.473145, -25.231808, 1002.012878, 0.000000, -0.000037, 179.999771, -1, -1);
	kek = CreateDynamicObject(19444, 617.489075, -12.346606, 1005.692871, 0.000037, 90.000000, 89.999886, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 10765, "airportgnd_sfse", "white", 0xFFFFFFFFFFA5A5A5);
	kek = CreateDynamicObject(19443, 628.828552, -16.880306, 1000.832886, 0.000000, 90.000038, 0.000000, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 10765, "airportgnd_sfse", "white", 0);
	kek = CreateDynamicObject(19443, 628.828552, -16.882404, 999.992859, 0.000000, 90.000038, 0.000000, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 10765, "airportgnd_sfse", "white", 0);
	kek = CreateDynamicObject(19443, 606.246277, -16.883507, 1000.832886, 0.000000, 90.000038, 0.000000, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 10765, "airportgnd_sfse", "white", 0);
	kek = CreateDynamicObject(19443, 606.246277, -16.883507, 999.992859, 0.000000, 90.000038, 0.000000, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 10765, "airportgnd_sfse", "white", 0);
	kek = CreateDynamicObject(19377, 617.888672, -12.119006, 1005.892883, 0.000000, 90.000038, 0.000000, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 10765, "airportgnd_sfse", "white", 0xFFFFFFFFFFFFFFFF);
	CreateDynamicObject(626, 632.509705, -25.657368, 1002.012878, 0.000000, -0.000037, 179.999771, -1, -1);
	kek = CreateDynamicObject(3498, 630.098877, -16.877007, 1001.384888, 0.000037, 0.000000, 89.999886, -1, -1);
	SetDynamicObjectMaterial(kek, 1, 10765, "airportgnd_sfse", "white", 0xFFFFFFFFFFFFFAB8);
	SetDynamicObjectMaterial(kek, 0, 10765, "airportgnd_sfse", "white", 0xFFFFFFFFFFF5FF6B);
	kek = CreateDynamicObject(3498, 604.809082, -16.874405, 1001.384888, 0.000037, 0.000000, 89.999886, -1, -1);
	SetDynamicObjectMaterial(kek, 1, 10765, "airportgnd_sfse", "white", 0xFFFFFFFFFFFFFAB8);
	SetDynamicObjectMaterial(kek, 0, 10765, "airportgnd_sfse", "white", 0xFFFFFFFFFFF5FF6B);
	kek = CreateDynamicObject(2257, 602.346313, -21.962265, 1001.655457, 0.000029, -0.000059, 89.999397, -1, -1);
	SetDynamicObjectMaterial(kek, 1, 14865, "gf2", "mp_bobbie_wood", 0);
	SetDynamicObjectMaterial(kek, 0, 14865, "gf2", "mp_bobbie_wood", 0);
	kek = CreateDynamicObject(2257, 602.343262, -21.962265, 1001.855408, 0.000029, -0.000059, 89.999397, -1, -1);
	SetDynamicObjectMaterial(kek, 1, 14865, "gf2", "mp_bobbie_wood", 0);
	SetDynamicObjectMaterial(kek, 0, 14865, "gf2", "mp_bobbie_wood", 0);
	kek = CreateDynamicObject(2257, 602.359192, -21.862167, 1001.755310, 0.000029, -0.000059, 89.999397, -1, -1);
	SetDynamicObjectMaterial(kek, 1, 11631, "mp_ranchcut", "CJ_PAINTING20", 0xFFFFFFFFFFFFFFFF);
	SetDynamicObjectMaterial(kek, 0, 19962, "samproadsigns", "materialtext1", 0xFFFFFFFFFFFFFFFF);
	kek = CreateDynamicObject(19370, 617.508789, -10.846604, 1005.742798, 0.000000, 90.000061, 0.000000, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 10765, "airportgnd_sfse", "white", 0xFFFFFFFFFF808080);
	kek = CreateDynamicObject(11359, 602.309570, -21.926308, 1001.492859, 0.000037, 0.000000, 89.999886, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 10765, "airportgnd_sfse", "white", 0xFFFFFFFFFFF4F4F4);
	kek = CreateDynamicObject(2257, 602.343262, -21.762192, 1001.655457, 0.000029, -0.000059, 89.999397, -1, -1);
	SetDynamicObjectMaterial(kek, 1, 14865, "gf2", "mp_bobbie_wood", 0);
	SetDynamicObjectMaterial(kek, 0, 14865, "gf2", "mp_bobbie_wood", 0);
	kek = CreateDynamicObject(2257, 602.346313, -21.762192, 1001.855408, 0.000029, -0.000059, 89.999397, -1, -1);
	SetDynamicObjectMaterial(kek, 1, 14865, "gf2", "mp_bobbie_wood", 0);
	SetDynamicObjectMaterial(kek, 0, 14865, "gf2", "mp_bobbie_wood", 0);
	kek = CreateDynamicObject(19443, 630.474976, -16.876905, 999.092896, 0.000000, -0.000037, 179.999771, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 10765, "airportgnd_sfse", "white", 0);
	kek = CreateDynamicObject(19370, 617.499573, -10.787005, 1005.732910, 0.000000, 90.000061, 0.000000, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 10765, "airportgnd_sfse", "white", 0xFFFFFFFFFF282828);
	kek = CreateDynamicObject(19443, 604.586548, -16.893005, 999.092896, 0.000000, -0.000037, 179.999771, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 10765, "airportgnd_sfse", "white", 0);
	kek = CreateDynamicObject(19380, 602.199585, -23.508005, 1004.772827, 89.999992, 90.000046, -89.999962, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 3820, "boxhses_sfsx", "stonewall_la", 0xFFFFFFFFFFFFFFFF);
	kek = CreateDynamicObject(19370, 617.508789, -10.386605, 1005.742798, 0.000000, 90.000061, 0.000000, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 10765, "airportgnd_sfse", "white", 0xFFFFFFFFFF808080);
	kek = CreateDynamicObject(19786, 617.495972, -10.330005, 1005.732910, 89.999992, 360.000031, -89.999962, -1, -1);
	SetDynamicObjectMaterial(kek, 1, 14581, "ab_mafiasuitea", "barbersmir1", 0xFFFFFFFFFFFFFAB8);
	SetDynamicObjectMaterial(kek, 0, 19962, "samproadsigns", "materialtext1", 0);
	kek = CreateDynamicObject(2257, 633.554810, -21.989017, 1001.671631, -0.000030, -0.000067, -90.000435, -1, -1);
	SetDynamicObjectMaterial(kek, 1, 10765, "airportgnd_sfse", "black64", 0);
	SetDynamicObjectMaterial(kek, 0, 10765, "airportgnd_sfse", "black64", 0);
	kek = CreateDynamicObject(2257, 633.551758, -21.989017, 1001.871582, -0.000030, -0.000067, -90.000435, -1, -1);
	SetDynamicObjectMaterial(kek, 1, 10765, "airportgnd_sfse", "black64", 0);
	SetDynamicObjectMaterial(kek, 0, 10765, "airportgnd_sfse", "black64", 0);
	kek = CreateDynamicObject(19370, 617.499268, -10.206607, 1005.742798, 0.000000, 90.000061, 0.000000, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 10765, "airportgnd_sfse", "white", 0xFFFFFFFFFF808080);
	kek = CreateDynamicObject(2257, 633.548706, -21.839041, 1001.821533, -0.000030, -0.000067, -90.000435, -1, -1);
	SetDynamicObjectMaterial(kek, 1, 14816, "whore_furn", "WH_flowers1", 0xFFFFFFFFFFFFFFFF);
	SetDynamicObjectMaterial(kek, 0, 10765, "airportgnd_sfse", "black64", 0xFFFFFFFFFFFFFFFF);
	kek = CreateDynamicObject(2257, 633.551758, -21.788944, 1001.671631, -0.000030, -0.000067, -90.000435, -1, -1);
	SetDynamicObjectMaterial(kek, 1, 10765, "airportgnd_sfse", "black64", 0);
	SetDynamicObjectMaterial(kek, 0, 10765, "airportgnd_sfse", "black64", 0);
	kek = CreateDynamicObject(2257, 633.554810, -21.788944, 1001.871582, -0.000030, -0.000067, -90.000435, -1, -1);
	SetDynamicObjectMaterial(kek, 1, 10765, "airportgnd_sfse", "black64", 0);
	SetDynamicObjectMaterial(kek, 0, 10765, "airportgnd_sfse", "black64", 0);
	kek = CreateDynamicObject(11359, 633.764587, -21.926308, 1001.492859, 0.000037, 0.000000, 89.999886, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 10765, "airportgnd_sfse", "white", 0xFFFFFFFFFFF4F4F4);
	kek = CreateDynamicObject(19380, 633.729553, -23.508005, 1004.772827, 89.999992, 90.000046, -89.999962, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 3820, "boxhses_sfsx", "stonewall_la", 0xFFFFFFFFFFFFFFFF);
	kek = CreateDynamicObject(19444, 617.489075, -8.847805, 1005.692871, 0.000037, 90.000000, 89.999886, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 10765, "airportgnd_sfse", "white", 0xFFFFFFFFFFA5A5A5);
	kek = CreateDynamicObject(3498, 602.349060, -16.874405, 1001.384888, 0.000037, 0.000000, 89.999886, -1, -1);
	SetDynamicObjectMaterial(kek, 1, 10765, "airportgnd_sfse", "white", 0xFFFFFFFFFFFFFAB8);
	SetDynamicObjectMaterial(kek, 0, 10765, "airportgnd_sfse", "white", 0xFFFFFFFFFFF5FF6B);
	kek = CreateDynamicObject(19377, 607.388000, -12.119006, 1005.892883, 0.000000, 90.000038, 0.000000, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 10765, "airportgnd_sfse", "white", 0xFFFFFFFFFFFFFFFF);
	kek = CreateDynamicObject(19377, 628.390564, -12.119006, 1005.892883, 0.000000, 90.000038, 0.000000, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 10765, "airportgnd_sfse", "white", 0xFFFFFFFFFFFFFFFF);
	kek = CreateDynamicObject(3498, 633.601074, -16.877007, 1001.384888, 0.000037, 0.000000, 89.999886, -1, -1);
	SetDynamicObjectMaterial(kek, 1, 10765, "airportgnd_sfse", "white", 0xFFFFFFFFFFFFFAB8);
	SetDynamicObjectMaterial(kek, 0, 10765, "airportgnd_sfse", "white", 0xFFFFFFFFFFFFFAB8);
	kek = CreateDynamicObject(19786, 617.679199, -7.595746, 1005.692871, 89.999992, 270.000031, -89.999962, -1, -1);
	SetDynamicObjectMaterial(kek, 1, 14581, "ab_mafiasuitea", "barbersmir1", 0xFFFFFFFFFFFFFAB8);
	SetDynamicObjectMaterial(kek, 0, 19962, "samproadsigns", "materialtext1", 0);
	kek = CreateDynamicObject(19444, 617.620789, -7.582406, 1005.696899, 0.000000, 90.000038, 0.000000, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 10765, "airportgnd_sfse", "white", 0xFFFFFFFFFFA5A5A5);
	kek = CreateDynamicObject(19370, 617.499573, -7.576604, 1005.732910, 0.000000, 90.000061, 0.000000, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 10765, "airportgnd_sfse", "white", 0xFFFFFFFFFF282828);
	kek = CreateDynamicObject(19370, 617.499573, -7.566605, 1005.742798, 0.000000, 90.000061, 0.000000, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 10765, "airportgnd_sfse", "white", 0xFFFFFFFFFF808080);
	kek = CreateDynamicObject(19444, 620.242188, -7.579706, 1005.692871, 0.000000, 90.000038, 0.000000, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 10765, "airportgnd_sfse", "white", 0xFFFFFFFFFFA5A5A5);
	kek = CreateDynamicObject(19786, 614.859192, -7.595705, 1005.692871, 89.999992, 270.000031, -89.999962, -1, -1);
	SetDynamicObjectMaterial(kek, 1, 14581, "ab_mafiasuitea", "barbersmir1", 0xFFFFFFFFFFFFFAB8);
	SetDynamicObjectMaterial(kek, 0, 19962, "samproadsigns", "materialtext1", 0);
	kek = CreateDynamicObject(19786, 620.499146, -7.595705, 1005.703003, 90.000008, 450.000031, 89.999962, -1, -1);
	SetDynamicObjectMaterial(kek, 1, 14581, "ab_mafiasuitea", "barbersmir1", 0xFFFFFFFFFFFFFAB8);
	SetDynamicObjectMaterial(kek, 0, 19962, "samproadsigns", "materialtext1", 0);
	kek = CreateDynamicObject(19444, 614.742188, -7.579706, 1005.692871, 0.000000, 90.000038, 0.000000, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 10765, "airportgnd_sfse", "white", 0xFFFFFFFFFFA5A5A5);
	kek = CreateDynamicObject(19370, 621.009155, -7.586606, 1005.742798, 0.000000, 90.000061, 0.000000, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 10765, "airportgnd_sfse", "white", 0xFFFFFFFFFF808080);
	kek = CreateDynamicObject(19370, 620.999573, -7.575705, 1005.732910, 0.000000, 90.000061, 0.000000, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 10765, "airportgnd_sfse", "white", 0xFFFFFFFFFF282828);
	kek = CreateDynamicObject(19370, 620.999146, -7.566605, 1005.742798, 0.000000, 90.000061, 0.000000, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 10765, "airportgnd_sfse", "white", 0xFFFFFFFFFF808080);
	kek = CreateDynamicObject(19370, 621.009155, -7.566605, 1005.742798, 0.000000, 90.000061, 0.000000, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 10765, "airportgnd_sfse", "white", 0xFFFFFFFFFF808080);
	kek = CreateDynamicObject(19370, 614.069214, -7.586606, 1005.742798, 0.000000, 90.000061, 0.000000, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 10765, "airportgnd_sfse", "white", 0xFFFFFFFFFF808080);
	kek = CreateDynamicObject(19370, 613.999207, -7.586606, 1005.742798, 0.000000, 90.000061, 0.000000, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 10765, "airportgnd_sfse", "white", 0xFFFFFFFFFF808080);
	kek = CreateDynamicObject(19370, 613.999451, -7.576604, 1005.732910, 0.000000, 90.000061, 0.000000, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 10765, "airportgnd_sfse", "white", 0xFFFFFFFFFF282828);
	kek = CreateDynamicObject(19370, 614.019470, -7.566605, 1005.742798, 0.000000, 90.000061, 0.000000, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 10765, "airportgnd_sfse", "white", 0xFFFFFFFFFF808080);
	kek = CreateDynamicObject(19370, 613.989441, -7.566605, 1005.742798, 0.000000, 90.000061, 0.000000, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 10765, "airportgnd_sfse", "white", 0xFFFFFFFFFF808080);
	kek = CreateDynamicObject(14793, 634.875732, -18.479616, 1005.712219, 0.000000, 0.000037, 0.000000, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 19962, "samproadsigns", "materialtext1", 0);
	kek = CreateDynamicObject(18757, 604.136963, -10.788705, 1001.912903, 0.000000, 0.000037, 0.000000, -1, -1);
	SetDynamicObjectMaterial(kek, 1, 4829, "airport_las", "liftdoorsac256", 0);
	SetDynamicObjectMaterial(kek, 0, 4829, "airport_las", "liftdoorsac256", 0);
	kek = CreateDynamicObject(18756, 604.136963, -10.784106, 1001.912903, 0.000000, 0.000037, 0.000000, -1, -1);
	SetDynamicObjectMaterial(kek, 1, 4829, "airport_las", "liftdoorsac256", 0);
	SetDynamicObjectMaterial(kek, 0, 4829, "airport_las", "liftdoorsac256", 0);
	kek = CreateDynamicObject(19380, 602.199585, -13.007005, 1004.772827, 89.999992, 90.000046, -89.999962, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 3820, "boxhses_sfsx", "stonewall_la", 0xFFFFFFFFFFFFFFFF);
	CreateDynamicObject(19859, 633.645935, -12.609805, 1001.232910, 0.000037, 0.000000, 89.999886, -1, -1);
	kek = CreateDynamicObject(19380, 633.729553, -13.007005, 1004.772827, 89.999992, 90.000046, -89.999962, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 3820, "boxhses_sfsx", "stonewall_la", 0xFFFFFFFFFFFFFFFF);
	kek = CreateDynamicObject(19360, 633.720764, -11.849805, 1001.732910, 0.000000, 0.000037, 0.000000, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 3820, "boxhses_sfsx", "stonewall_la", 0xFFFFFFFFFFFFFFFF);
	kek = CreateDynamicObject(11359, 602.309570, -10.839406, 1001.492859, 0.000037, 0.000000, 89.999886, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 10765, "airportgnd_sfse", "white", 0xFFFFFFFFFFF4F4F4);
	kek = CreateDynamicObject(14793, 617.386230, -4.549605, 1005.712219, 0.000000, 0.000007, 0.000000, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 19962, "samproadsigns", "materialtext1", 0);
	kek = CreateDynamicObject(1846, 617.829407, -3.913105, 999.868042, -0.000052, 270.000000, -89.999847, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 10765, "airportgnd_sfse", "white", 0xFFFFFFFFFFFFFAB8);
	kek = CreateDynamicObject(1846, 615.849243, -3.913105, 999.868042, -0.000052, 270.000000, -89.999847, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 10765, "airportgnd_sfse", "white", 0xFFFFFFFFFFFFFAB8);
	kek = CreateDynamicObject(1846, 619.809448, -3.913105, 999.868042, -0.000052, 270.000000, -89.999847, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 10765, "airportgnd_sfse", "white", 0xFFFFFFFFFFFFFAB8);
	kek = CreateDynamicObject(13648, 602.564575, -9.574995, 1005.372864, 0.000000, 0.000045, 179.999969, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 10765, "airportgnd_sfse", "white", 0);
	kek = CreateDynamicObject(14793, 624.256226, -4.549605, 1005.712219, 0.000000, 0.000007, 0.000000, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 19962, "samproadsigns", "materialtext1", 0);
	kek = CreateDynamicObject(14793, 610.585938, -4.549605, 1005.712219, 0.000000, 0.000007, 0.000000, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 19962, "samproadsigns", "materialtext1", 0);
	kek = CreateDynamicObject(18880, 616.843567, -2.971211, 1001.267822, 0.000000, 540.000000, 0.000000, -1, -1);
	SetDynamicObjectMaterial(kek, 4, 19962, "samproadsigns", "materialtext1", 0);
	SetDynamicObjectMaterial(kek, 3, 19962, "samproadsigns", "materialtext1", 0);
	SetDynamicObjectMaterial(kek, 2, 10765, "airportgnd_sfse", "white", 0xFFFFFFFFFFFFFAB8);
	SetDynamicObjectMaterial(kek, 1, 19962, "samproadsigns", "materialtext1", 0);
	SetDynamicObjectMaterial(kek, 0, 19962, "samproadsigns", "materialtext1", 0);
	kek = CreateDynamicObject(18755, 600.292786, -10.843005, 1001.912903, 0.000000, -0.000037, 179.999771, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 10765, "airportgnd_sfse", "white", 0xFFFFFFFFFFF5FF6B);
	kek = CreateDynamicObject(18880, 618.823730, -2.971211, 1001.267822, 0.000000, 540.000000, 0.000000, -1, -1);
	SetDynamicObjectMaterial(kek, 4, 19962, "samproadsigns", "materialtext1", 0);
	SetDynamicObjectMaterial(kek, 3, 19962, "samproadsigns", "materialtext1", 0);
	SetDynamicObjectMaterial(kek, 2, 10765, "airportgnd_sfse", "white", 0xFFFFFFFFFFFFFAB8);
	SetDynamicObjectMaterial(kek, 1, 19962, "samproadsigns", "materialtext1", 0);
	SetDynamicObjectMaterial(kek, 0, 19962, "samproadsigns", "materialtext1", 0);
	kek = CreateDynamicObject(19866, 617.221863, -2.948004, 999.884888, 0.000037, 0.000000, 89.999886, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 14652, "ab_trukstpa", "CJ_WOOD6", 0xFFFFFFFFFFA5A5A5);
	kek = CreateDynamicObject(19866, 618.387573, -2.950705, 999.884888, 0.000037, 0.000000, 89.999886, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 14652, "ab_trukstpa", "CJ_WOOD6", 0xFFFFFFFFFFA5A5A5);
	kek = CreateDynamicObject(19866, 617.221863, -2.948004, 999.154541, 0.000037, 0.000000, 89.999886, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 14652, "ab_trukstpa", "CJ_WOOD6", 0xFFFFFFFFFFA5A5A5);
	kek = CreateDynamicObject(19866, 618.387573, -2.950705, 999.154785, 0.000037, 0.000000, 89.999886, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 14652, "ab_trukstpa", "CJ_WOOD6", 0xFFFFFFFFFFA5A5A5);
	kek = CreateDynamicObject(18880, 614.853149, -2.971211, 1001.267822, 0.000000, 540.000000, 0.000000, -1, -1);
	SetDynamicObjectMaterial(kek, 4, 19962, "samproadsigns", "materialtext1", 0);
	SetDynamicObjectMaterial(kek, 3, 19962, "samproadsigns", "materialtext1", 0);
	SetDynamicObjectMaterial(kek, 2, 10765, "airportgnd_sfse", "white", 0xFFFFFFFFFFFFFAB8);
	SetDynamicObjectMaterial(kek, 1, 19962, "samproadsigns", "materialtext1", 0);
	SetDynamicObjectMaterial(kek, 0, 19962, "samproadsigns", "materialtext1", 0);
	kek = CreateDynamicObject(18880, 614.813110, -2.971211, 1001.267822, 0.000000, 540.000000, 0.000000, -1, -1);
	SetDynamicObjectMaterial(kek, 4, 19962, "samproadsigns", "materialtext1", 0);
	SetDynamicObjectMaterial(kek, 3, 19962, "samproadsigns", "materialtext1", 0);
	SetDynamicObjectMaterial(kek, 2, 10765, "airportgnd_sfse", "white", 0xFFFFFFFFFFFFFAB8);
	SetDynamicObjectMaterial(kek, 1, 19962, "samproadsigns", "materialtext1", 0);
	SetDynamicObjectMaterial(kek, 0, 19962, "samproadsigns", "materialtext1", 0);
	kek = CreateDynamicObject(18880, 620.793274, -2.971211, 1001.267822, 0.000000, 180.000000, 0.000000, -1, -1);
	SetDynamicObjectMaterial(kek, 4, 19962, "samproadsigns", "materialtext1", 0);
	SetDynamicObjectMaterial(kek, 3, 19962, "samproadsigns", "materialtext1", 0);
	SetDynamicObjectMaterial(kek, 2, 10765, "airportgnd_sfse", "white", 0xFFFFFFFFFFFFFAB8);
	SetDynamicObjectMaterial(kek, 1, 19962, "samproadsigns", "materialtext1", 0);
	SetDynamicObjectMaterial(kek, 0, 19962, "samproadsigns", "materialtext1", 0);
	kek = CreateDynamicObject(19475, 618.107361, -2.724179, 1001.052551, 36.900024, -0.000102, 89.999519, -1, -1);
	SetDynamicObjectMaterialText(kek, 0, "n", 120, "Webdings", 20, 1, 0xFFFFFFFFFF000000, 0, 1);
	kek = CreateDynamicObject(19475, 618.155823, -2.720029, 1000.987549, 0.000021, -0.000081, 89.999352, -1, -1);
	SetDynamicObjectMaterialText(kek, 0, "n", 140, "Webdings", 100, 1, 0xFFFFFFFFFFFFFFFF, 0, 1);
	kek = CreateDynamicObject(19475, 618.087830, -2.715146, 1000.930542, 87.000031, -0.001602, 90.001808, -1, -1);
	SetDynamicObjectMaterialText(kek, 0, "n", 120, "Webdings", 20, 1, 0xFFFFFFFFFFFFFFFF, 0, 1);
	kek = CreateDynamicObject(19475, 618.087463, -2.714169, 1001.022522, 89.999992, 514.453064, -64.452995, -1, -1);
	SetDynamicObjectMaterialText(kek, 0, "n", 120, "Webdings", 20, 1, 0xFFFFFFFFFFFFFFFF, 0, 1);
	kek = CreateDynamicObject(19475, 618.085754, -2.710019, 1000.977539, 0.000021, -0.000081, 89.999352, -1, -1);
	SetDynamicObjectMaterialText(kek, 0, "n", 140, "Webdings", 120, 1, 0xFFFFFFFFFF000000, 0, 1);
	kek = CreateDynamicObject(19883, 618.035461, -2.710996, 1000.662842, 89.999992, 424.471161, -64.471291, -1, -1);
	SetDynamicObjectMaterial(kek, 1, 10765, "airportgnd_sfse", "black64", 0xFFFFFFFFFFFFFFFF);
	SetDynamicObjectMaterial(kek, 0, 10765, "airportgnd_sfse", "black64", 0xFFFFFFFFFFFFFFFF);
	kek = CreateDynamicObject(19883, 618.135559, -2.710996, 1000.661560, 89.999992, 424.471161, -64.471291, -1, -1);
	SetDynamicObjectMaterial(kek, 1, 10765, "airportgnd_sfse", "black64", 0xFFFFFFFFFFFFFFFF);
	SetDynamicObjectMaterial(kek, 0, 10765, "airportgnd_sfse", "black64", 0xFFFFFFFFFFFFFFFF);
	kek = CreateDynamicObject(1581, 618.043396, -2.688169, 1001.021545, 0.000013, 0.000007, -0.000083, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 10765, "airportgnd_sfse", "white", 0xFFFFFFFFFFFFFFFF);
	kek = CreateDynamicObject(1581, 618.043396, -2.688169, 1000.901550, 0.000013, 0.000007, -0.000083, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 10765, "airportgnd_sfse", "white", 0xFFFFFFFFFFFFFFFF);
	kek = CreateDynamicObject(1581, 618.093445, -2.688169, 1001.021545, 0.000013, 0.000007, -0.000083, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 10765, "airportgnd_sfse", "white", 0xFFFFFFFFFFFFFFFF);
	kek = CreateDynamicObject(1581, 618.093445, -2.688169, 1000.901550, 0.000013, 0.000007, -0.000083, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 10765, "airportgnd_sfse", "white", 0xFFFFFFFFFFFFFFFF);
	kek = CreateDynamicObject(19475, 616.107483, -2.724179, 1001.052551, 36.900017, -0.000102, 89.999542, -1, -1);
	SetDynamicObjectMaterialText(kek, 0, "n", 120, "Webdings", 20, 1, 0xFFFFFFFFFF000000, 0, 1);
	kek = CreateDynamicObject(1581, 618.073425, -2.678159, 1001.011536, 0.000013, 0.000007, -0.000083, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 10765, "airportgnd_sfse", "black64", 0xFFFFFFFFFFFFFFFF);
	kek = CreateDynamicObject(19475, 616.155945, -2.720029, 1000.987549, 0.000013, -0.000081, 89.999374, -1, -1);
	SetDynamicObjectMaterialText(kek, 0, "n", 140, "Webdings", 100, 1, 0xFFFFFFFFFFFFFFFF, 0, 1);
	kek = CreateDynamicObject(19475, 616.087952, -2.715146, 1000.930542, 87.000031, -0.001601, 90.001831, -1, -1);
	SetDynamicObjectMaterialText(kek, 0, "n", 120, "Webdings", 20, 1, 0xFFFFFFFFFFFFFFFF, 0, 1);
	kek = CreateDynamicObject(19475, 616.087585, -2.714169, 1001.022522, 89.999992, 494.973511, -44.973434, -1, -1);
	SetDynamicObjectMaterialText(kek, 0, "n", 120, "Webdings", 20, 1, 0xFFFFFFFFFFFFFFFF, 0, 1);
	kek = CreateDynamicObject(19475, 618.085754, -2.669858, 1000.757568, 0.000021, -0.000081, 89.999352, -1, -1);
	SetDynamicObjectMaterialText(kek, 0, "n", 140, "Webdings", 50, 1, 0xFFFFFFFFFF000000, 0, 1);
	kek = CreateDynamicObject(19883, 616.135681, -2.710996, 1000.661560, 89.999992, 404.999969, -45.000103, -1, -1);
	SetDynamicObjectMaterial(kek, 1, 10765, "airportgnd_sfse", "black64", 0xFFFFFFFFFFFFFFFF);
	SetDynamicObjectMaterial(kek, 0, 10765, "airportgnd_sfse", "black64", 0xFFFFFFFFFFFFFFFF);
	kek = CreateDynamicObject(19475, 616.085876, -2.710019, 1000.977539, 0.000013, -0.000081, 89.999374, -1, -1);
	SetDynamicObjectMaterialText(kek, 0, "n", 140, "Webdings", 120, 1, 0xFFFFFFFFFF000000, 0, 1);
	kek = CreateDynamicObject(19475, 618.063782, -2.662778, 1000.760559, 0.000021, -0.000081, 89.999352, -1, -1);
	SetDynamicObjectMaterialText(kek, 0, "n", 140, "Webdings", 30, 1, 0xFFFFFFFFFFFFFFFF, 0, 1);
	kek = CreateDynamicObject(19475, 618.083801, -2.662778, 1000.784546, 0.000021, -0.000081, 89.999352, -1, -1);
	SetDynamicObjectMaterialText(kek, 0, "n", 140, "Webdings", 30, 1, 0xFFFFFFFFFFFFFFFF, 0, 1);
	kek = CreateDynamicObject(19475, 618.083801, -2.662778, 1000.738525, 89.999992, 158.375122, -68.375816, -1, -1);
	SetDynamicObjectMaterialText(kek, 0, "n", 120, "Webdings", 8, 1, 0xFFFFFFFFFFFFFFFF, 0, 1);
	kek = CreateDynamicObject(19883, 616.035583, -2.710996, 1000.662842, 89.999992, 404.999969, -45.000103, -1, -1);
	SetDynamicObjectMaterial(kek, 1, 10765, "airportgnd_sfse", "black64", 0xFFFFFFFFFFFFFFFF);
	SetDynamicObjectMaterial(kek, 0, 10765, "airportgnd_sfse", "black64", 0xFFFFFFFFFFFFFFFF);
	kek = CreateDynamicObject(19475, 618.074036, -2.658627, 1000.791504, 49.899956, -180.000076, -90.000572, -1, -1);
	SetDynamicObjectMaterialText(kek, 0, "n", 120, "Webdings", 8, 1, 0xFFFFFFFFFF000000, 0, 1);
	kek = CreateDynamicObject(19940, 617.744568, -2.652858, 1000.583252, 0.000000, 0.000000, 90.000000, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 14581, "ab_mafiasuitea", "barbersmir1", 0xFFFFFFFFFFFFFAB8);
	kek = CreateDynamicObject(19883, 618.037415, -2.652890, 1000.611511, -0.000007, -0.000000, -90.000015, -1, -1);
	SetDynamicObjectMaterial(kek, 1, 10765, "airportgnd_sfse", "black64", 0xFFFFFFFFFFFFFFFF);
	SetDynamicObjectMaterial(kek, 0, 10765, "airportgnd_sfse", "black64", 0xFFFFFFFFFFFFFFFF);
	kek = CreateDynamicObject(19883, 618.137512, -2.650937, 1000.611511, -0.000007, -0.000000, -90.000015, -1, -1);
	SetDynamicObjectMaterial(kek, 1, 10765, "airportgnd_sfse", "black64", 0xFFFFFFFFFFFFFFFF);
	SetDynamicObjectMaterial(kek, 0, 10765, "airportgnd_sfse", "black64", 0xFFFFFFFFFFFFFFFF);
	kek = CreateDynamicObject(1581, 616.093567, -2.688169, 1001.021545, 0.000013, -0.000000, -0.000083, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 10765, "airportgnd_sfse", "white", 0xFFFFFFFFFFFFFFFF);
	kek = CreateDynamicObject(1581, 616.093567, -2.688169, 1000.901550, 0.000013, -0.000000, -0.000083, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 10765, "airportgnd_sfse", "white", 0xFFFFFFFFFFFFFFFF);
	kek = CreateDynamicObject(1581, 616.043518, -2.688169, 1001.021545, 0.000013, -0.000000, -0.000083, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 10765, "airportgnd_sfse", "white", 0xFFFFFFFFFFFFFFFF);
	kek = CreateDynamicObject(1581, 616.043518, -2.688169, 1000.901550, 0.000013, -0.000000, -0.000083, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 10765, "airportgnd_sfse", "white", 0xFFFFFFFFFFFFFFFF);
	kek = CreateDynamicObject(1581, 616.073547, -2.678159, 1001.011536, 0.000013, -0.000000, -0.000083, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 10765, "airportgnd_sfse", "black64", 0xFFFFFFFFFFFFFFFF);
	kek = CreateDynamicObject(19475, 616.085876, -2.669858, 1000.757568, 0.000013, -0.000081, 89.999374, -1, -1);
	SetDynamicObjectMaterialText(kek, 0, "n", 140, "Webdings", 50, 1, 0xFFFFFFFFFF000000, 0, 1);
	kek = CreateDynamicObject(19475, 616.083923, -2.662778, 1000.784546, 0.000013, -0.000081, 89.999374, -1, -1);
	SetDynamicObjectMaterialText(kek, 0, "n", 140, "Webdings", 30, 1, 0xFFFFFFFFFFFFFFFF, 0, 1);
	kek = CreateDynamicObject(19475, 616.083923, -2.662778, 1000.738525, 89.999992, 116.564964, -26.565664, -1, -1);
	SetDynamicObjectMaterialText(kek, 0, "n", 120, "Webdings", 8, 1, 0xFFFFFFFFFFFFFFFF, 0, 1);
	kek = CreateDynamicObject(19475, 616.063904, -2.662778, 1000.760559, 0.000013, -0.000081, 89.999374, -1, -1);
	SetDynamicObjectMaterialText(kek, 0, "n", 140, "Webdings", 30, 1, 0xFFFFFFFFFFFFFFFF, 0, 1);
	kek = CreateDynamicObject(19475, 616.074158, -2.658627, 1000.791504, 49.899967, -180.000076, -90.000595, -1, -1);
	SetDynamicObjectMaterialText(kek, 0, "n", 120, "Webdings", 8, 1, 0xFFFFFFFFFF000000, 0, 1);
	kek = CreateDynamicObject(19475, 619.998108, -2.724179, 1001.052551, 36.900028, -0.000102, 89.999496, -1, -1);
	SetDynamicObjectMaterialText(kek, 0, "n", 120, "Webdings", 20, 1, 0xFFFFFFFFFF000000, 0, 1);
	kek = CreateDynamicObject(19883, 616.137634, -2.650937, 1000.611511, 0.000000, -0.000000, -90.000038, -1, -1);
	SetDynamicObjectMaterial(kek, 1, 10765, "airportgnd_sfse", "black64", 0xFFFFFFFFFFFFFFFF);
	SetDynamicObjectMaterial(kek, 0, 10765, "airportgnd_sfse", "black64", 0xFFFFFFFFFFFFFFFF);
	kek = CreateDynamicObject(19475, 619.978577, -2.715146, 1000.930542, 87.000031, -0.001602, 90.001785, -1, -1);
	SetDynamicObjectMaterialText(kek, 0, "n", 120, "Webdings", 20, 1, 0xFFFFFFFFFFFFFFFF, 0, 1);
	kek = CreateDynamicObject(19475, 619.978210, -2.714169, 1001.022522, 89.999992, 526.621216, -76.621132, -1, -1);
	SetDynamicObjectMaterialText(kek, 0, "n", 120, "Webdings", 20, 1, 0xFFFFFFFFFFFFFFFF, 0, 1);
	kek = CreateDynamicObject(19475, 620.046570, -2.720029, 1000.987549, 0.000029, -0.000081, 89.999329, -1, -1);
	SetDynamicObjectMaterialText(kek, 0, "n", 140, "Webdings", 100, 1, 0xFFFFFFFFFFFFFFFF, 0, 1);
	kek = CreateDynamicObject(19883, 619.926208, -2.710996, 1000.662842, 89.999992, 436.631409, -76.631523, -1, -1);
	SetDynamicObjectMaterial(kek, 1, 10765, "airportgnd_sfse", "black64", 0xFFFFFFFFFFFFFFFF);
	SetDynamicObjectMaterial(kek, 0, 10765, "airportgnd_sfse", "black64", 0xFFFFFFFFFFFFFFFF);
	kek = CreateDynamicObject(19883, 616.037537, -2.652890, 1000.611511, 0.000000, -0.000000, -90.000038, -1, -1);
	SetDynamicObjectMaterial(kek, 1, 10765, "airportgnd_sfse", "black64", 0xFFFFFFFFFFFFFFFF);
	SetDynamicObjectMaterial(kek, 0, 10765, "airportgnd_sfse", "black64", 0xFFFFFFFFFFFFFFFF);
	kek = CreateDynamicObject(19475, 619.976501, -2.710019, 1000.977539, 0.000029, -0.000081, 89.999329, -1, -1);
	SetDynamicObjectMaterialText(kek, 0, "n", 140, "Webdings", 120, 1, 0xFFFFFFFFFF000000, 0, 1);
	kek = CreateDynamicObject(19883, 620.026306, -2.710996, 1000.661560, 89.999992, 436.631409, -76.631523, -1, -1);
	SetDynamicObjectMaterial(kek, 1, 10765, "airportgnd_sfse", "black64", 0xFFFFFFFFFFFFFFFF);
	SetDynamicObjectMaterial(kek, 0, 10765, "airportgnd_sfse", "black64", 0xFFFFFFFFFFFFFFFF);
	CreateDynamicObject(19808, 617.542786, -2.584763, 1000.597595, 0.000000, 0.000000, 180.000000, -1, -1);
	kek = CreateDynamicObject(1581, 619.934143, -2.688169, 1001.021545, 0.000013, 0.000015, -0.000083, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 10765, "airportgnd_sfse", "white", 0xFFFFFFFFFFFFFFFF);
	kek = CreateDynamicObject(13648, 633.314941, -9.135012, 1005.372864, 0.000000, 0.000045, -0.000029, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 10765, "airportgnd_sfse", "white", 0);
	kek = CreateDynamicObject(1581, 619.934143, -2.688169, 1000.901550, 0.000013, 0.000015, -0.000083, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 10765, "airportgnd_sfse", "white", 0xFFFFFFFFFFFFFFFF);
	kek = CreateDynamicObject(19940, 615.754517, -2.652858, 1000.583252, 0.000000, 0.000000, 90.000000, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 14581, "ab_mafiasuitea", "barbersmir1", 0xFFFFFFFFFFFFFAB8);
	kek = CreateDynamicObject(1581, 619.984192, -2.688169, 1001.021545, 0.000013, 0.000015, -0.000083, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 10765, "airportgnd_sfse", "white", 0xFFFFFFFFFFFFFFFF);
	kek = CreateDynamicObject(1581, 619.984192, -2.688169, 1000.901550, 0.000013, 0.000015, -0.000083, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 10765, "airportgnd_sfse", "white", 0xFFFFFFFFFFFFFFFF);
	kek = CreateDynamicObject(1581, 619.964172, -2.678159, 1001.011536, 0.000013, 0.000015, -0.000083, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 10765, "airportgnd_sfse", "black64", 0xFFFFFFFFFFFFFFFF);
	kek = CreateDynamicObject(19940, 619.744568, -2.652858, 1000.583252, 0.000000, 0.000000, 90.000000, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 14581, "ab_mafiasuitea", "barbersmir1", 0xFFFFFFFFFFFFFAB8);
	kek = CreateDynamicObject(19475, 619.976501, -2.669858, 1000.757568, 0.000029, -0.000081, 89.999329, -1, -1);
	SetDynamicObjectMaterialText(kek, 0, "n", 140, "Webdings", 50, 1, 0xFFFFFFFFFF000000, 0, 1);
	kek = CreateDynamicObject(19475, 619.954529, -2.662778, 1000.760559, 0.000029, -0.000081, 89.999329, -1, -1);
	SetDynamicObjectMaterialText(kek, 0, "n", 140, "Webdings", 30, 1, 0xFFFFFFFFFFFFFFFF, 0, 1);
	kek = CreateDynamicObject(19475, 619.974548, -2.662778, 1000.784546, 0.000029, -0.000081, 89.999329, -1, -1);
	SetDynamicObjectMaterialText(kek, 0, "n", 140, "Webdings", 30, 1, 0xFFFFFFFFFFFFFFFF, 0, 1);
	kek = CreateDynamicObject(19475, 619.974548, -2.662778, 1000.738525, 89.999992, 168.815247, -78.815948, -1, -1);
	SetDynamicObjectMaterialText(kek, 0, "n", 120, "Webdings", 8, 1, 0xFFFFFFFFFFFFFFFF, 0, 1);
	kek = CreateDynamicObject(19475, 619.964783, -2.658627, 1000.791504, 49.899948, -180.000076, -90.000549, -1, -1);
	SetDynamicObjectMaterialText(kek, 0, "n", 120, "Webdings", 8, 1, 0xFFFFFFFFFF000000, 0, 1);
	kek = CreateDynamicObject(19883, 619.928162, -2.652890, 1000.611511, -0.000015, -0.000000, -89.999992, -1, -1);
	SetDynamicObjectMaterial(kek, 1, 10765, "airportgnd_sfse", "black64", 0xFFFFFFFFFFFFFFFF);
	SetDynamicObjectMaterial(kek, 0, 10765, "airportgnd_sfse", "black64", 0xFFFFFFFFFFFFFFFF);
	kek = CreateDynamicObject(19883, 620.028259, -2.650937, 1000.611511, -0.000015, -0.000000, -89.999992, -1, -1);
	SetDynamicObjectMaterial(kek, 1, 10765, "airportgnd_sfse", "black64", 0xFFFFFFFFFFFFFFFF);
	SetDynamicObjectMaterial(kek, 0, 10765, "airportgnd_sfse", "black64", 0xFFFFFFFFFFFFFFFF);
	CreateDynamicObject(19808, 619.472961, -2.584763, 1000.597595, 0.000000, 0.000000, 180.000000, -1, -1);
	CreateDynamicObject(19808, 615.432739, -2.584763, 1000.597595, 0.000000, 0.000000, 180.000000, -1, -1);
	kek = CreateDynamicObject(19377, 617.888672, -2.485305, 1005.892883, 0.000000, 90.000038, 0.000000, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 10765, "airportgnd_sfse", "white", 0xFFFFFFFFFFFFFFFF);
	kek = CreateDynamicObject(19443, 614.806152, -2.231606, 998.892883, 0.000000, 0.000037, 0.000000, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 14650, "ab_trukstpc", "mp_CJ_WOOD5", 0xFFFFFFFFFFA5A5A5);
	kek = CreateDynamicObject(19443, 620.807495, -2.261605, 998.882751, 0.000000, 0.000037, 0.000000, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 14650, "ab_trukstpc", "mp_CJ_WOOD5", 0xFFFFFFFFFFA5A5A5);
	kek = CreateDynamicObject(19370, 616.279541, -1.592104, 999.954895, 0.000000, 90.000061, 0.000000, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 2423, "cj_ff_counters", "CJ_Laminate1", 0);
	kek = CreateDynamicObject(19370, 619.304565, -1.592104, 999.952881, 0.000000, 90.000061, 0.000000, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 2423, "cj_ff_counters", "CJ_Laminate1", 0);
	kek = CreateDynamicObject(19370, 617.828186, -1.465587, 999.942871, 0.000075, 90.000000, 89.999771, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 2423, "cj_ff_counters", "CJ_Laminate1", 0xFFFFFFFFFF808080);
	kek = CreateDynamicObject(19370, 616.127747, -1.465593, 999.942871, 0.000067, 90.000000, 89.999794, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 2423, "cj_ff_counters", "CJ_Laminate1", 0xFFFFFFFFFF808080);
	kek = CreateDynamicObject(18880, 614.853149, -1.541212, 1000.647827, 0.000000, 540.000000, 0.000000, -1, -1);
	SetDynamicObjectMaterial(kek, 4, 19962, "samproadsigns", "materialtext1", 0);
	SetDynamicObjectMaterial(kek, 3, 19962, "samproadsigns", "materialtext1", 0);
	SetDynamicObjectMaterial(kek, 2, 10765, "airportgnd_sfse", "white", 0xFFFFFFFFFFFFFAB8);
	SetDynamicObjectMaterial(kek, 1, 19962, "samproadsigns", "materialtext1", 0);
	SetDynamicObjectMaterial(kek, 0, 19962, "samproadsigns", "materialtext1", 0);
	kek = CreateDynamicObject(18880, 614.813110, -1.541212, 1000.647827, 0.000000, 540.000000, 0.000000, -1, -1);
	SetDynamicObjectMaterial(kek, 4, 19962, "samproadsigns", "materialtext1", 0);
	SetDynamicObjectMaterial(kek, 3, 19962, "samproadsigns", "materialtext1", 0);
	SetDynamicObjectMaterial(kek, 2, 10765, "airportgnd_sfse", "white", 0xFFFFFFFFFFFFFAB8);
	SetDynamicObjectMaterial(kek, 1, 19962, "samproadsigns", "materialtext1", 0);
	SetDynamicObjectMaterial(kek, 0, 19962, "samproadsigns", "materialtext1", 0);
	kek = CreateDynamicObject(19370, 619.458313, -1.465593, 999.942871, 0.000075, 90.000000, 89.999771, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 2423, "cj_ff_counters", "CJ_Laminate1", 0xFFFFFFFFFF808080);
	kek = CreateDynamicObject(18880, 620.793274, -1.541212, 1000.647827, 0.000000, 180.000000, 0.000000, -1, -1);
	SetDynamicObjectMaterial(kek, 4, 19962, "samproadsigns", "materialtext1", 0);
	SetDynamicObjectMaterial(kek, 3, 19962, "samproadsigns", "materialtext1", 0);
	SetDynamicObjectMaterial(kek, 2, 10765, "airportgnd_sfse", "white", 0xFFFFFFFFFFFFFAB8);
	SetDynamicObjectMaterial(kek, 1, 19962, "samproadsigns", "materialtext1", 0);
	SetDynamicObjectMaterial(kek, 0, 19962, "samproadsigns", "materialtext1", 0);
	CreateDynamicObject(1714, 617.868652, -1.277714, 1000.032898, 0.000000, 0.000037, 0.000000, -1, -1);
	CreateDynamicObject(1714, 615.742249, -1.264405, 1000.032898, 0.000000, 0.000037, 0.000000, -1, -1);
	kek = CreateDynamicObject(1721, 609.851868, -2.383205, 1000.052856, -0.000037, 0.000000, -89.999886, -1, -1);
	SetDynamicObjectMaterial(kek, 1, 14665, "genintint711_1", "interiorwindowglow", 0xFFFFFFFFFFFFFAB8);
	SetDynamicObjectMaterial(kek, 0, 10765, "airportgnd_sfse", "white", 0);
	CreateDynamicObject(1714, 620.013794, -1.241806, 1000.032898, 0.000000, 0.000037, 0.000000, -1, -1);
	kek = CreateDynamicObject(2208, 608.620972, -2.661106, 999.773193, 0.000045, 0.000000, 89.999863, -1, -1);
	kek = CreateDynamicObject(1721, 626.450989, -2.375804, 1000.052856, 0.000037, 0.000000, 89.999886, -1, -1);
	SetDynamicObjectMaterial(kek, 1, 14665, "genintint711_1", "interiorwindowglow", 0xFFFFFFFFFFFFFAB8);
	SetDynamicObjectMaterial(kek, 0, 10765, "airportgnd_sfse", "white", 0);
	kek = CreateDynamicObject(2208, 627.689941, -2.672306, 999.773193, 0.000045, 0.000000, 89.999863, -1, -1);
	kek = CreateDynamicObject(19443, 610.092590, -1.375005, 999.952881, 0.000037, 90.000000, 89.999886, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 2423, "cj_ff_counters", "CJ_Laminate1", 0);
	kek = CreateDynamicObject(1721, 607.177368, -2.383205, 1000.052856, 0.000037, 0.000000, 89.999886, -1, -1);
	SetDynamicObjectMaterial(kek, 1, 14665, "genintint711_1", "interiorwindowglow", 0xFFFFFFFFFFFFFAB8);
	SetDynamicObjectMaterial(kek, 0, 10765, "airportgnd_sfse", "white", 0);
	kek = CreateDynamicObject(1721, 609.851868, -1.290104, 1000.052856, -0.000037, 0.000000, -89.999886, -1, -1);
	SetDynamicObjectMaterial(kek, 1, 14665, "genintint711_1", "interiorwindowglow", 0xFFFFFFFFFFFFFAB8);
	SetDynamicObjectMaterial(kek, 0, 10765, "airportgnd_sfse", "white", 0);
	kek = CreateDynamicObject(19370, 609.297974, -1.385569, 999.942871, 0.000067, 90.000000, 89.999794, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 2423, "cj_ff_counters", "CJ_Laminate1", 0xFFFFFFFFFF808080);
	kek = CreateDynamicObject(19370, 609.297974, -1.365569, 999.942871, 0.000067, 90.000000, 89.999794, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 2423, "cj_ff_counters", "CJ_Laminate1", 0xFFFFFFFFFF808080);
	kek = CreateDynamicObject(19377, 607.388000, -2.485605, 1005.892883, 0.000000, 90.000038, 0.000000, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 10765, "airportgnd_sfse", "white", 0xFFFFFFFFFFFFFFFF);
	kek = CreateDynamicObject(1721, 626.450989, -1.375905, 1000.052856, 0.000037, 0.000000, 89.999886, -1, -1);
	SetDynamicObjectMaterial(kek, 1, 14665, "genintint711_1", "interiorwindowglow", 0xFFFFFFFFFFFFFAB8);
	SetDynamicObjectMaterial(kek, 0, 10765, "airportgnd_sfse", "white", 0);
	kek = CreateDynamicObject(638, 608.556458, -1.435281, 1001.001404, 0.000000, 0.000000, 0.000000, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 10765, "airportgnd_sfse", "white", 0);
	kek = CreateDynamicObject(1721, 628.987244, -2.375804, 1000.052856, -0.000037, 0.000000, -89.999886, -1, -1);
	SetDynamicObjectMaterial(kek, 1, 14665, "genintint711_1", "interiorwindowglow", 0xFFFFFFFFFFFFFAB8);
	SetDynamicObjectMaterial(kek, 0, 10765, "airportgnd_sfse", "white", 0);
	kek = CreateDynamicObject(19377, 628.390564, -2.485605, 1005.892883, 0.000000, 90.000038, 0.000000, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 10765, "airportgnd_sfse", "white", 0xFFFFFFFFFFFFFFFF);
	kek = CreateDynamicObject(19370, 626.871094, -1.385565, 999.942871, 0.000060, 90.000000, 89.999817, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 2423, "cj_ff_counters", "CJ_Laminate1", 0xFFFFFFFFFF808080);
	kek = CreateDynamicObject(19370, 626.881104, -1.375565, 999.952881, 0.000060, 90.000000, 89.999817, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 2423, "cj_ff_counters", "CJ_Laminate1", 0);
	kek = CreateDynamicObject(19370, 626.870544, -1.365565, 999.942871, 0.000060, 90.000000, 89.999817, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 2423, "cj_ff_counters", "CJ_Laminate1", 0xFFFFFFFFFF808080);
	kek = CreateDynamicObject(14793, 634.875732, -6.559614, 1005.712219, 0.000000, 0.000045, 0.000000, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 19962, "samproadsigns", "materialtext1", 0);
	kek = CreateDynamicObject(638, 627.627075, -1.435281, 1001.001404, 0.000000, 0.000000, 0.000000, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 10765, "airportgnd_sfse", "white", 0);
	kek = CreateDynamicObject(19370, 607.668213, -1.385565, 999.942871, 0.000067, 90.000000, 89.999794, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 2423, "cj_ff_counters", "CJ_Laminate1", 0xFFFFFFFFFF808080);
	kek = CreateDynamicObject(19370, 607.684265, -1.375605, 999.952881, 0.000060, 90.000000, 89.999817, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 2423, "cj_ff_counters", "CJ_Laminate1", 0);
	kek = CreateDynamicObject(19370, 607.667664, -1.365565, 999.942871, 0.000067, 90.000000, 89.999794, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 2423, "cj_ff_counters", "CJ_Laminate1", 0xFFFFFFFFFF808080);
	kek = CreateDynamicObject(13648, 642.463562, -16.880306, 1005.372864, 0.000029, 0.000014, 89.999916, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 10765, "airportgnd_sfse", "white", 0);
	kek = CreateDynamicObject(1721, 607.177368, -1.290104, 1000.052856, 0.000037, 0.000000, 89.999886, -1, -1);
	SetDynamicObjectMaterial(kek, 1, 14665, "genintint711_1", "interiorwindowglow", 0xFFFFFFFFFFFFFAB8);
	SetDynamicObjectMaterial(kek, 0, 10765, "airportgnd_sfse", "white", 0);
	kek = CreateDynamicObject(1721, 609.851868, -0.285026, 1000.052856, -0.000037, 0.000000, -89.999886, -1, -1);
	SetDynamicObjectMaterial(kek, 1, 14665, "genintint711_1", "interiorwindowglow", 0xFFFFFFFFFFFFFAB8);
	SetDynamicObjectMaterial(kek, 0, 10765, "airportgnd_sfse", "white", 0);
	kek = CreateDynamicObject(19370, 628.500854, -1.385569, 999.942871, 0.000060, 90.000000, 89.999817, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 2423, "cj_ff_counters", "CJ_Laminate1", 0xFFFFFFFFFF808080);
	kek = CreateDynamicObject(19370, 628.500854, -1.365569, 999.942871, 0.000060, 90.000000, 89.999817, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 2423, "cj_ff_counters", "CJ_Laminate1", 0xFFFFFFFFFF808080);
	kek = CreateDynamicObject(13648, 592.618469, -16.883507, 1005.372864, -0.000029, 360.000000, -89.999916, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 10765, "airportgnd_sfse", "white", 0);
	kek = CreateDynamicObject(1721, 628.987244, -1.375905, 1000.052856, -0.000037, 0.000000, -89.999886, -1, -1);
	SetDynamicObjectMaterial(kek, 1, 14665, "genintint711_1", "interiorwindowglow", 0xFFFFFFFFFFFFFAB8);
	SetDynamicObjectMaterial(kek, 0, 10765, "airportgnd_sfse", "white", 0);
	kek = CreateDynamicObject(1721, 626.450989, -0.333705, 1000.052856, 0.000037, 0.000000, 89.999886, -1, -1);
	SetDynamicObjectMaterial(kek, 1, 14665, "genintint711_1", "interiorwindowglow", 0xFFFFFFFFFFFFFAB8);
	SetDynamicObjectMaterial(kek, 0, 10765, "airportgnd_sfse", "white", 0);
	kek = CreateDynamicObject(19443, 629.288574, -1.375604, 999.952881, 0.000037, 90.000000, 89.999886, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 2423, "cj_ff_counters", "CJ_Laminate1", 0);
	kek = CreateDynamicObject(19370, 616.279541, 1.618990, 999.954895, 0.000000, 90.000061, 0.000000, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 2423, "cj_ff_counters", "CJ_Laminate1", 0);
	kek = CreateDynamicObject(19370, 619.304565, 1.618990, 999.952881, 0.000000, 90.000061, 0.000000, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 2423, "cj_ff_counters", "CJ_Laminate1", 0);
	kek = CreateDynamicObject(1721, 607.177795, -0.285006, 1000.052856, 0.000037, 0.000000, 89.999886, -1, -1);
	SetDynamicObjectMaterial(kek, 1, 14665, "genintint711_1", "interiorwindowglow", 0xFFFFFFFFFFFFFAB8);
	SetDynamicObjectMaterial(kek, 0, 10765, "airportgnd_sfse", "white", 0);
	kek = CreateDynamicObject(1721, 628.987244, -0.333674, 1000.052856, -0.000037, 0.000000, -89.999886, -1, -1);
	SetDynamicObjectMaterial(kek, 1, 14665, "genintint711_1", "interiorwindowglow", 0xFFFFFFFFFFFFFAB8);
	SetDynamicObjectMaterial(kek, 0, 10765, "airportgnd_sfse", "white", 0);
	kek = CreateDynamicObject(19370, 616.127747, 2.024406, 999.942871, 0.000067, 90.000000, 89.999794, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 2423, "cj_ff_counters", "CJ_Laminate1", 0xFFFFFFFFFF808080);
	kek = CreateDynamicObject(19370, 619.458313, 2.024406, 999.942871, 0.000075, 90.000000, 89.999771, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 2423, "cj_ff_counters", "CJ_Laminate1", 0xFFFFFFFFFF808080);
	kek = CreateDynamicObject(2257, 602.346313, -2.152264, 1001.655457, 0.000020, -0.000059, 89.999420, -1, -1);
	SetDynamicObjectMaterial(kek, 1, 14865, "gf2", "mp_bobbie_wood", 0);
	SetDynamicObjectMaterial(kek, 0, 14865, "gf2", "mp_bobbie_wood", 0);
	kek = CreateDynamicObject(2257, 602.343262, -2.152264, 1001.855408, 0.000020, -0.000059, 89.999420, -1, -1);
	SetDynamicObjectMaterial(kek, 1, 14865, "gf2", "mp_bobbie_wood", 0);
	SetDynamicObjectMaterial(kek, 0, 14865, "gf2", "mp_bobbie_wood", 0);
	kek = CreateDynamicObject(19380, 602.199585, -2.504606, 1004.772827, 89.999992, 90.000046, -89.999962, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 3820, "boxhses_sfsx", "stonewall_la", 0xFFFFFFFFFFFFFFFF);
	kek = CreateDynamicObject(13648, 618.324829, 2.024995, 1005.372864, 0.000000, 0.000045, 89.999969, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 10765, "airportgnd_sfse", "white", 0);
	kek = CreateDynamicObject(2257, 602.361328, -2.052165, 1001.755310, 0.000020, -0.000059, 89.999420, -1, -1);
	SetDynamicObjectMaterial(kek, 1, 6390, "sancliff_law2", "bluepat_LAw2", 0xFFFFFFFFFFFFFFFF);
	SetDynamicObjectMaterial(kek, 0, 19962, "samproadsigns", "materialtext1", 0xFFFFFFFFFFFFFFFF);
	kek = CreateDynamicObject(2257, 602.359192, -2.052166, 1001.755310, 0.000020, -0.000059, 89.999420, -1, -1);
	SetDynamicObjectMaterial(kek, 1, 10765, "airportgnd_sfse", "white", 0xFFFFFFFFFFFFFFFF);
	SetDynamicObjectMaterial(kek, 0, 19962, "samproadsigns", "materialtext1", 0xFFFFFFFFFFFFFFFF);
	kek = CreateDynamicObject(19426, 615.782410, 2.364606, 1001.670288, -0.000008, -0.000060, -90.000458, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 9907, "monlith_sfe", "sf_windos_4", 0xFFFFFFFFFFFFFFFF);
	kek = CreateDynamicObject(19426, 619.772461, 2.364606, 1001.670288, -0.000016, -0.000060, -90.000435, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 9907, "monlith_sfe", "sf_windos_4", 0xFFFFFFFFFFFFFFFF);
	kek = CreateDynamicObject(11359, 602.309570, -1.990805, 1001.492859, 0.000037, 0.000000, 89.999886, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 10765, "airportgnd_sfse", "white", 0xFFFFFFFFFFF4F4F4);
	kek = CreateDynamicObject(2257, 602.343262, -1.952191, 1001.655457, 0.000020, -0.000059, 89.999420, -1, -1);
	SetDynamicObjectMaterial(kek, 1, 14865, "gf2", "mp_bobbie_wood", 0);
	SetDynamicObjectMaterial(kek, 0, 14865, "gf2", "mp_bobbie_wood", 0);
	kek = CreateDynamicObject(2257, 602.346313, -1.952191, 1001.855408, 0.000020, -0.000059, 89.999420, -1, -1);
	SetDynamicObjectMaterial(kek, 1, 14865, "gf2", "mp_bobbie_wood", 0);
	SetDynamicObjectMaterial(kek, 0, 14865, "gf2", "mp_bobbie_wood", 0);
	kek = CreateDynamicObject(19380, 618.039673, 2.420993, 1004.772827, 89.999992, 180.000031, -89.999962, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 3820, "boxhses_sfsx", "stonewall_la", 0xFFFFFFFFFFFFFFFF);
	kek = CreateDynamicObject(19380, 633.729553, -2.504606, 1004.772827, 89.999992, 90.000046, -89.999962, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 3820, "boxhses_sfsx", "stonewall_la", 0xFFFFFFFFFFFFFFFF);
	kek = CreateDynamicObject(2257, 633.554810, -2.019001, 1001.671631, -0.000024, -0.000067, -90.000458, -1, -1);
	SetDynamicObjectMaterial(kek, 1, 14865, "gf2", "mp_bobbie_wood", 0);
	SetDynamicObjectMaterial(kek, 0, 10765, "airportgnd_sfse", "black64", 0);
	kek = CreateDynamicObject(2257, 633.551758, -2.019001, 1001.871582, -0.000024, -0.000067, -90.000458, -1, -1);
	SetDynamicObjectMaterial(kek, 1, 14865, "gf2", "mp_bobbie_wood", 0);
	SetDynamicObjectMaterial(kek, 0, 10765, "airportgnd_sfse", "black64", 0);
	kek = CreateDynamicObject(2257, 633.548706, -1.919026, 1001.771484, -0.000024, -0.000067, -90.000458, -1, -1);
	SetDynamicObjectMaterial(kek, 1, 14737, "whorewallstuff", "Pict1", 0xFFFFFFFFFFFFFFFF);
	SetDynamicObjectMaterial(kek, 0, 10765, "airportgnd_sfse", "black64", 0xFFFFFFFFFFFFFFFF);
	kek = CreateDynamicObject(11359, 633.764099, -1.990805, 1001.492859, 0.000037, 0.000000, 89.999886, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 10765, "airportgnd_sfse", "white", 0xFFFFFFFFFFF4F4F4);
	kek = CreateDynamicObject(2257, 633.551758, -1.818928, 1001.671631, -0.000024, -0.000067, -90.000458, -1, -1);
	SetDynamicObjectMaterial(kek, 1, 14865, "gf2", "mp_bobbie_wood", 0);
	SetDynamicObjectMaterial(kek, 0, 10765, "airportgnd_sfse", "black64", 0);
	kek = CreateDynamicObject(2257, 633.554810, -1.818928, 1001.871582, -0.000024, -0.000067, -90.000458, -1, -1);
	SetDynamicObjectMaterial(kek, 1, 14865, "gf2", "mp_bobbie_wood", 0);
	SetDynamicObjectMaterial(kek, 0, 10765, "airportgnd_sfse", "black64", 0);
	kek = CreateDynamicObject(19426, 616.592712, 3.054669, 1001.670288, -0.000060, 0.000008, 0.000198, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 10765, "airportgnd_sfse", "white", 0xFFFFFFFFFFFFFAB8);
	kek = CreateDynamicObject(19426, 619.012939, 3.054669, 1001.670288, -0.000060, 0.000016, 0.000198, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 10765, "airportgnd_sfse", "white", 0xFFFFFFFFFFFFFAB8);
	kek = CreateDynamicObject(19426, 615.022888, 3.054669, 1001.670288, -0.000060, 0.000008, 0.000198, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 10765, "airportgnd_sfse", "white", 0xFFFFFFFFFFFFFAB8);
	kek = CreateDynamicObject(19426, 620.582764, 3.054669, 1001.670288, -0.000060, 0.000016, 0.000198, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 10765, "airportgnd_sfse", "white", 0xFFFFFFFFFFFFFAB8);
	kek = CreateDynamicObject(19426, 608.502380, 2.364606, 1001.670288, -0.000000, -0.000060, -90.000481, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 9907, "monlith_sfe", "sf_windos_4", 0xFFFFFFFFFFFFFFFF);
	kek = CreateDynamicObject(19426, 615.832703, 4.004864, 1000.060425, 0.000008, 90.000061, 89.999763, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 10765, "airportgnd_sfse", "white", 0xFFFFFFFFFFFFFAB8);
	kek = CreateDynamicObject(19426, 619.822754, 4.004864, 1000.060425, 0.000016, 90.000061, 89.999741, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 10765, "airportgnd_sfse", "white", 0xFFFFFFFFFFFFFAB8);
	kek = CreateDynamicObject(19426, 627.772583, 2.364606, 1001.670288, -0.000023, -0.000060, -90.000412, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 9907, "monlith_sfe", "sf_windos_4", 0xFFFFFFFFFFFFFFFF);
	kek = CreateDynamicObject(19426, 615.832703, 4.004864, 1003.341919, 0.000008, 90.000061, 89.999763, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 10765, "airportgnd_sfse", "white", 0xFFFFFFFFFFFFFAB8);
	kek = CreateDynamicObject(19426, 619.822754, 4.004864, 1003.341919, 0.000016, 90.000061, 89.999741, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 10765, "airportgnd_sfse", "white", 0xFFFFFFFFFFFFFAB8);
	kek = CreateDynamicObject(19426, 609.312683, 3.054669, 1001.670288, -0.000060, 0.000000, 0.000198, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 10765, "airportgnd_sfse", "white", 0xFFFFFFFFFFFFFAB8);
	kek = CreateDynamicObject(19380, 607.537598, 2.420993, 1004.772827, 89.999992, 180.000031, -89.999962, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 3820, "boxhses_sfsx", "stonewall_la", 0xFFFFFFFFFFFFFFFF);
	kek = CreateDynamicObject(19426, 627.013062, 3.054669, 1001.670288, -0.000060, 0.000023, 0.000198, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 10765, "airportgnd_sfse", "white", 0xFFFFFFFFFFFFFAB8);
	kek = CreateDynamicObject(19380, 628.541565, 2.420993, 1004.772827, 89.999992, 180.000031, -89.999962, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 3820, "boxhses_sfsx", "stonewall_la", 0xFFFFFFFFFFFFFFFF);
	kek = CreateDynamicObject(19426, 607.742859, 3.054669, 1001.670288, -0.000060, 0.000000, 0.000198, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 10765, "airportgnd_sfse", "white", 0xFFFFFFFFFFFFFAB8);
	kek = CreateDynamicObject(19426, 628.582886, 3.054669, 1001.670288, -0.000060, 0.000023, 0.000198, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 10765, "airportgnd_sfse", "white", 0xFFFFFFFFFFFFFAB8);
	kek = CreateDynamicObject(19426, 608.552673, 4.004864, 1000.060425, 0.000000, 90.000061, 89.999786, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 10765, "airportgnd_sfse", "white", 0xFFFFFFFFFFFFFAB8);
	kek = CreateDynamicObject(19426, 608.552673, 4.004864, 1003.341919, 0.000000, 90.000061, 89.999786, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 10765, "airportgnd_sfse", "white", 0xFFFFFFFFFFFFFAB8);
	kek = CreateDynamicObject(19426, 627.822876, 4.004864, 1000.060425, 0.000023, 90.000061, 89.999718, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 10765, "airportgnd_sfse", "white", 0xFFFFFFFFFFFFFAB8);
	kek = CreateDynamicObject(19426, 627.822876, 4.004864, 1003.341919, 0.000023, 90.000061, 89.999718, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 10765, "airportgnd_sfse", "white", 0xFFFFFFFFFFFFFAB8);
	kek = CreateDynamicObject(14793, 648.546021, -18.479616, 1005.712219, 0.000000, 0.000037, 0.000000, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 19962, "samproadsigns", "materialtext1", 0);
	kek = CreateDynamicObject(14793, 634.875732, 3.230385, 1005.712219, 0.000000, 0.000045, 0.000000, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 19962, "samproadsigns", "materialtext1", 0);
	kek = CreateDynamicObject(14793, 648.546021, -6.559614, 1005.712219, 0.000000, 0.000045, 0.000000, -1, -1);
	SetDynamicObjectMaterial(kek, 0, 19962, "samproadsigns", "materialtext1", 0);
	CreateDynamicObject(1510, 512.296143, -72.476898, 998.260010, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(1667, 511.970062, -72.276695, 998.336792, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(1486, 511.964844, -72.368172, 998.393188, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(1543, 512.091614, -72.689209, 998.248230, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(1544, 511.916382, -72.724030, 998.314026, 0.000000, 90.000000, 52.000000, -1, -1);
	CreateDynamicObject(2325, 512.200012, -73.692001, 999.040283, 0.000000, 0.000000, 270.000000, -1, -1);
	CreateDynamicObject(2204, 511.926544, -74.687218, 996.458252, 0.000000, 0.000000, 90.000000, -1, -1);
	
	print("[Streamer] Dynamic Objects has been loaded.");
	return 1;
}