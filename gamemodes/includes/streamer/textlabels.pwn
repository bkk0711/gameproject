#include <YSI\y_hooks>

hook OnGameModeInit() {

	print("[Streamer] Loading 3D Text Labels...");
	
    //CreateDynamic3DTextLabel("{FF8000}/loadforklift\nTo load the crate onto your forklift", COLOR_YELLOW, -2114.1, -1723.5, 11984.5, 20.0, _, _, 1, 0, -1, _, 20.0);
	CreateDynamic3DTextLabel("{FF8000}/loadforklift\nTo load the crate onto your forklift", COLOR_YELLOW, 134.7094,-4380.9165,52.603, 20.0, _, _, -1, -1, -1, _, 20.0);
	CreateDynamic3DTextLabel("{FF8000}LOCKDOWN\nCHI CO TRONG TRUONG HOP KHAN CAP", COLOR_YELLOW, -1121.70, 4290.41, 5.88, 20.0, _, _, 1, 0, 0, _, 20.0);

	// General text labels
	/*
	CreateDynamic3DTextLabel("All Saints Plaza Parking Garage\nType /enter with your vehicle to enter",COLOR_YELLOW,1218.69,-1425.01,13.15+0.6,25.0);
	CreateDynamic3DTextLabel("Club VIP Parking\nType /enter with your vehicle to enter",COLOR_YELLOW,1814.6857,-1559.2028,13.4834+0.4,15.0);
	CreateDynamic3DTextLabel("Gym Parking Garage\nType /enter with your vehicle to enter",COLOR_YELLOW,2273.4026,-1724.3064,13.5469+0.6,25.0);
	CreateDynamic3DTextLabel("Courthouse Parking Garage\nType /enter with your vehicle to enter",COLOR_YELLOW,1418.5190,-1663.8959,13.5395+0.6,25.0);
	*/
    CreateDynamic3DTextLabel("De thay doi so dien thoai cua ban /vipnum",COLOR_YELLOW,2549.548095, 1404.047729, 7699.584472+0.6,4.0);//
    CreateDynamic3DTextLabel("De thay doi so dien thoai cua ban /vipnum",COLOR_YELLOW,1832.6000, 1375.1700, 1464.4600+0.6,4.0);//
    CreateDynamic3DTextLabel("Go /travel\nDe ra khoi Garage cua VIP bang xe cua ban",COLOR_YELLOW,-4429.944824, 905.032470, 987.078186+0.5,13.0);// VIP garage travel
    CreateDynamic3DTextLabel("/viplocker\nDe mo VIP locker.",COLOR_YELLOW,2555.747314, 1404.106079, 7699.584472+0.6,4.0);/// LS VIP locker room
	CreateDynamic3DTextLabel("/viplocker\nDe mo VIP locker.",COLOR_YELLOW,1832.0533, 1380.7281, 1464.3822+0.6,4.0);/// LV Main VIP locker room
    CreateDynamic3DTextLabel("/viplocker\nDe mo VIP locker.",COLOR_YELLOW,772.4844, 1715.7213, 1938.0391+0.6,4.0);/// LV Plat VIP locker room
	CreateDynamic3DTextLabel("/getgift\nDe nhan qua.",COLOR_YELLOW,2546.611572, 1403.323608, 7700.768066,8.0);/// VIP Lounge
	CreateDynamic3DTextLabel("/getgift\nDe nhan qua.",COLOR_YELLOW,1726.1000, 1370.1000, 1449.9000,8.0);/// LV VIP Lounge
	CreateDynamic3DTextLabel("/getgift\nDe nhan qua.",COLOR_YELLOW,1763.5000, 1432.5000, 2015.7000,8.0);/// LV GVIP Lounge
	CreateDynamic3DTextLabel("/getgift\nDe nhan qua.",COLOR_YELLOW,772.4000, 1743.2000, 1938.8800,8.0);/// LV PVIP Lounge
	CreateDynamic3DTextLabel("Factions Duty Point", COLOR_DBLUE, -2043.527832, -189.208435, 985.183105+0.6, 4.0); //
	CreateDynamic3DTextLabel("Factions Duty Point", COLOR_DBLUE, 1112.7, -2055.8, 1409.7+0.6, 4.0); //
	CreateDynamic3DTextLabel("Factions Duty Point", COLOR_DBLUE, 321.43, 303.96, 999.14+0.6, 4.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, 2112, 5, -1); //
	CreateDynamic3DTextLabel("Factions Duty Point", COLOR_DBLUE, 1533.6, -1760.9, 2264.4+0.6, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, 2345, 18, -1); //
	CreateDynamic3DTextLabel("Loi vao lai", COLOR_DBLUE, -2033.7502,-154.8784,35.3203+0.6, 4.0); // Prison
	CreateDynamic3DTextLabel("/dplocker\nTo open the Dedicated locker.",COLOR_YELLOW,166.6540, -2001.0413, 3499.6482+0.6,4.0);/// Dedicated Locker
	
	//CreateDynamic3DTextLabel("Type /getmats from a boat \nto obtain Materials Packages",COLOR_YELLOW,2102.71,-103.97,2.28+0.5,8.0);// Deliver
    CreateDynamic3DTextLabel("/getpizza \nDe lay banh Pizza!",COLOR_YELLOW,-1713.961425, 1348.545166, 7.180452, 4.0); //getpizza Pier 69
    CreateDynamic3DTextLabel("/getpizza \nDe lay banh Pizza!",COLOR_YELLOW,2103.6714,-1785.5222,12.9849, 4.0); //getpizza Idlewood
	//CreateDynamic3DTextLabel("Type /registerplate to\nchange your license plate.",COLOR_YELLOW,366.54,159.09,1008.38+1,8.0);// Licenses.
    CreateDynamic3DTextLabel("/buyclothes\n De thay doi trang phuc.",COLOR_YELLOW,208.8970,-100.3289,1005.2578,8.0);
    CreateDynamic3DTextLabel("/buyclothes\n De thay doi trang phuc.",COLOR_YELLOW,206.5429,-41.2313,1001.8047,8.0);
    CreateDynamic3DTextLabel("/buyclothes\n De thay doi trang phuc.",COLOR_YELLOW,209.3064,-8.3033,1005.2109,8.0);
    CreateDynamic3DTextLabel("/buyclothes\n De thay doi trang phuc.",COLOR_YELLOW,159.6771,-83.2866,1001.8120,8.0);
    CreateDynamic3DTextLabel("/buyclothes\n De thay doi trang phuc.",COLOR_YELLOW,206.4552,-163.0903,1000.5234,8.0);
    CreateDynamic3DTextLabel("/buytoys\n De mua trang bi.",COLOR_YELLOW,206.3253,-100.3268,1005.2578,8.0);
    CreateDynamic3DTextLabel("/buytoys\n De mua trang bi.",COLOR_YELLOW,201.0413,-40.1616,1001.8047,8.0);
    CreateDynamic3DTextLabel("/buytoys\n De mua trang bi.",COLOR_YELLOW,206.3963,-8.2122,1001.2109,8.0);
    CreateDynamic3DTextLabel("/buytoys\n De mua trang bi.",COLOR_YELLOW,162.7706,-83.2726,1001.8047,8.0);
    CreateDynamic3DTextLabel("/buytoys\n De mua trang bi.",COLOR_YELLOW,2787.095947, 2390.353027, 1240.531127+0.6,4.0); // Gold+ VIP Room
    CreateDynamic3DTextLabel("/buytoys\n De mua trang bi.",COLOR_YELLOW,202.6777,-163.0623,1000.5306,8.0);
	CreateDynamic3DTextLabel("/buytoys\n De mua trang bi.",COLOR_YELLOW,1774.7533, 1422.6665, 2013.4979,8.0);
	CreateDynamic3DTextLabel("/buytoys\n De mua trang bi.",COLOR_YELLOW,775.0900, 1742.4900, 1938.3800,8.0);

    CreateDynamic3DTextLabel("Tank Spawn\nZone",COLOR_YELLOW,286.7334, 2024.3762, 17.6406,10.0);
    CreateDynamic3DTextLabel("Air Vehicle Spawn\nZone", COLOR_YELLOW, 326.2754,1887.7212,17.6566, 10.0);

	// Paintball Arena
	CreateDynamic3DTextLabel("Paintball Rooms\n\nGo /joinarena de chon phong",COLOR_YELLOW,1294.5062,-1445.0599,0.4403+0.5,6.0);

	// SANews Broadcast
	/*
	SANews3DText[0] = CreateDynamic3DTextLabel(string,COLOR_LIGHTBLUE,650.2051,-6.5939,1101.2085,8.0);
	SANews3DText[1] = CreateDynamic3DTextLabel(string,COLOR_LIGHTBLUE,648.7708,-20.0820,1101.2126,8.0);
	SANews3DText[2] = CreateDynamic3DTextLabel(string,COLOR_LIGHTBLUE,664.2178,0.9587,1101.2085,8.0);
	*/

    //CreateDynamic3DTextLabel("Type /getmats to purchase material packages",COLOR_YELLOW,-1816.528686, -179.502624, 9.398437+0.6,5.0);
	CreateDynamic3DTextLabel("Diem thay doi ten \nGo /changename de thay doi ten cua ban",COLOR_YELLOW,1154.7295,-1440.2323,15.7969+0.6,18.0); // Namechange at mall
	CreateDynamic3DTextLabel("Diem thay doi ten \nGo /changename de thay doi ten cua ban",COLOR_YELLOW,-2279.6545, 2311.2238, 4.9641+0.6,18.0); // Namechange (TR)

	CreateDynamic3DTextLabel("Famed Locker \nType /famedlocker to access the locker", COLOR_YELLOW,901.4825,1429.7404,-82.3235+0.6,4.0); //Famed Locker
	
	//NGGShop
	//CreateDynamic3DTextLabel(const text[], color, Float:x, Float:y, Float:z, Float:drawdistance, attachedplayer = INVALID_PLAYER_ID, attachedvehicle = INVALID_VEHICLE_ID, testlos = 0, worldid = -1, interiorid = -1, playerid = -1, Float:distance = 100.0); 
	
	CreateDynamic3DTextLabel("Hot Dogs\n/buyhotdog", COLOR_YELLOW, 1973.0710, -1298.6427, 25.0172+0.6, 10.0);//Glen Park
	
	CreateDynamic3DTextLabel("Prisoner Delivery Point\n/deliverinmates", COLOR_YELLOW, -2053.6279,-198.0207,15.0703, 10.0);

	//CreateDynamic3DTextLabel("Drug Run\nType /getcrate here to get meth & ecsasy", COLOR_YELLOW, -1446.8916,1503.4746,1.7366, 10.0);
	
	for(new i = 0; i < MAX_DELIVERY_POINTS; i++)
	{
		CreateDynamic3DTextLabel("EMS Delivery Point\n/deliverpt", COLOR_YELLOW, HospitalDeliveryPoints[i][0], HospitalDeliveryPoints[i][1], HospitalDeliveryPoints[i][2], 10);
		CreateDynamicPickup(1240, 23, HospitalDeliveryPoints[i][0], HospitalDeliveryPoints[i][1], HospitalDeliveryPoints[i][2], -1);
	}
	
	print("[Streamer] Dynamic 3D Text Labels has been loaded.");
	return 1;
}
