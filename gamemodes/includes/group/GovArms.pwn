#include <YSI\y_hooks>

/*
BRIEFING (TIM)

Jingles I have a very important update that if possible I would like pushed to the top of the list. 
There needs to be a booth at city hall players can sell their weapons back to the government. 
Gov leaders need to be able to set a buyback price for each gun and I would prefer a command that lets 
this stay in place and government leaders can do a command to start/stop the program. 

I want all sales to be logged as well so government can issue these weapons to factions in the future, 
and a counter made with the total sales of each gun. Also make it so if they set the price to 0 it wont allow players \
to sell that gun. Make the money come out of the government vault as well. Thanks!
*/

new arrWeaponCosts[47]; // array to store the costs in (NOTE: 46 has the open/close value!!)

new GovArmsPoint;

hook OnGameModeInit()
{
	GovGuns_Streamer();
	return 1;
}

hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[]) {

	if(arrAntiCheat[playerid][ac_iFlags][AC_DIALOGSPOOFING] > 0) return 1;
	switch(dialogid)
	{
		case DIALOG_GOVGUN_MAIN:
		{
			if(response) switch(listitem)
			{
				case 0: return mysql_tquery(MainPipeline, "SELECT * FROM `govgunsales` WHERE 1", "GovGuns_OnShowSales", "i", playerid); 
				case 1:
				{
					GovGuns_EditPrices(playerid);
				}
				case 2:
				{
					szMiscArray[0] = 0;
					switch(arrWeaponCosts[46])
					{
						case 0:
						{
							arrWeaponCosts[46] = 1;
							format(szMiscArray, sizeof(szMiscArray), "%s da mo trung tam vu khi Chinh Phu.", GetPlayerNameEx(playerid));
							SendGroupMessage(arrGroupData[PlayerInfo[playerid][pMember]][g_iGroupType], DEPTRADIO, szMiscArray);
							return 1;
						}
						default:
						{
							arrWeaponCosts[46] = 0;
							format(szMiscArray, sizeof(szMiscArray), "%s da dong trung tam vu khi Chinh Phu.", GetPlayerNameEx(playerid));
							SendGroupMessage(arrGroupData[PlayerInfo[playerid][pMember]][g_iGroupType], DEPTRADIO, szMiscArray);
							return 1;
						}
					}
				}
			}
		}
		case DIALOG_GOVGUN_EDITPRICE:
		{
			if(response)
			{
				szMiscArray[0] = 0;
				new wepid = ListItemTrackId[playerid][listitem];
				SetPVarInt(playerid, "_GovGun", wepid);
				format(szMiscArray, sizeof(szMiscArray), "Chinh sua gia mua cua {00FFFF}%s {FFFFFF}\n\n Gia mua hien tai: $%s", Weapon_ReturnName(wepid), number_format(arrWeaponCosts[wepid]));
				return ShowPlayerDialogEx(playerid, DIALOG_GOVGUN_EDITPRICE2, DIALOG_STYLE_INPUT, "Government Arms | Chinh sua gia vu khi", szMiscArray, "Tien hanh", "Huy bo");
			}
		}
		case DIALOG_GOVGUN_SELL:
		{
			if(response)
			{
				szMiscArray[0] = 0;
				new wepid = ListItemTrackId[playerid][listitem];
				SetPVarInt(playerid, "_GovGun", wepid);
				format(szMiscArray, sizeof(szMiscArray), "Ban co chac chan muon ban %s gia: {FF0000}$%s{FFFFFF}?", Weapon_ReturnName(wepid), number_format(arrWeaponCosts[wepid]));
				return ShowPlayerDialogEx(playerid, DIALOG_GOVGUN_SELL2, DIALOG_STYLE_MSGBOX, "Government Arms | Ban vu khi", szMiscArray, "Ban", "Huy bo");
			}
		}
		case DIALOG_GOVGUN_EDITPRICE2:
		{
			if(response)
			{
				szMiscArray[0] = 0;
				new wepid = GetPVarInt(playerid, "_GovGun");
				arrWeaponCosts[wepid] = strval(inputtext);
				mysql_format(MainPipeline, szMiscArray, sizeof(szMiscArray), "UPDATE `govgunsales` SET `wepprice` = %d WHERE `wepid` = %d", strval(inputtext), wepid);
				mysql_tquery(MainPipeline, szMiscArray, "OnQueryFinish", "ii", SENDDATA_THREAD, playerid);
				format(szMiscArray, sizeof(szMiscArray), "Ban da chinh sua %s's gia: {FFFFFF}$%s", Weapon_ReturnName(wepid), number_format(arrWeaponCosts[wepid]));
				SendClientMessageEx(playerid, COLOR_YELLOW, szMiscArray);
				DeletePVar(playerid, "_GovGun");
				return GovGuns_EditPrices(playerid);
			}
		}
		case DIALOG_GOVGUN_SELL2:
		{
			if(response)
			{
				szMiscArray[0] = 0;
				new iGroupID;
				for(iGroupID = 0; iGroupID < MAX_GROUPS; ++iGroupID)
				{
					if(arrGroupData[iGroupID][g_iGroupType] == 5) break;
				}
				new wepid = GetPVarInt(playerid, "_GovGun");
				if(arrGroupData[iGroupID][g_iBudget] < arrWeaponCosts[wepid]) return SendClientMessageEx(playerid, COLOR_GRAD1, "Chinh phu khong co du tien de tra cho ban.");
				GivePlayerCash(playerid, arrWeaponCosts[wepid]);
				RemovePlayerWeapon(playerid, wepid);
				arrGroupData[iGroupID][g_iBudget] -= arrWeaponCosts[wepid];
	            format(szMiscArray, sizeof(szMiscArray), "%s da ban cua ho %s voi chi phi $%d den %s's quy ngan sach.",GetPlayerNameEx(playerid), Weapon_ReturnName(wepid), arrWeaponCosts[wepid], arrGroupData[iGroupID][g_szGroupName]);
				GroupPayLog(iGroupID, szMiscArray);
				szMiscArray[0] = 0; // unsure if this is needed.
				format(szMiscArray, sizeof(szMiscArray), "Ban da ban %s gia {FFFFFF}$%s", Weapon_ReturnName(wepid), number_format(arrWeaponCosts[wepid]));
				SendClientMessageEx(playerid, COLOR_YELLOW, szMiscArray);
				szMiscArray[0] = 0;
				mysql_format(MainPipeline, szMiscArray, sizeof(szMiscArray), "UPDATE `govgunsales` SET `wepsales` = `wepsales` + 1 WHERE `wepid` = %d", wepid);
				mysql_tquery(MainPipeline, szMiscArray, "OnQueryFinish", "ii", SENDDATA_THREAD, playerid);
				szMiscArray[0] = 0;
				format(szMiscArray, sizeof(szMiscArray), "%s ban cua ho %s voi chinh phu.", GetPlayerNameEx(playerid), Weapon_ReturnName(wepid));
				ProxDetector(8.0, playerid, szMiscArray, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE);
				DeletePVar(playerid, "_GovGun");
				return 1;
			}
		}
		case DIALOG_GOVGUNS_SALES:
		{
			return GovGuns_MainMenu(playerid);
		}
		case ARMS_MENU: {
			if(!response) return SendClientMessageEx(playerid, COLOR_GREY, "Ban da roi khoi trung tam vu khi cua chinh phu.");

			switch(listitem) {
				case 0: {
					
					if(!response) return ShowArmsMenu(playerid);

					new szWeaponName[32],
						iCount, iAmmo, iWepID;

					if(!IsPlayerInRangeOfPoint(playerid, 5.0, 1464.3099, -1747.5853, 15.6267)) return SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong o diem vu khi cua chinh phu tai Toa Thi chinh o Los Santos.");
					if(arrWeaponCosts[46] == 0) return SendClientMessageEx(playerid, COLOR_GRAD1, "Trung tam vu khi cua Chinh Phu hien dang dong cua.");
					szMiscArray = "Ten\tGia ban\n";
					for(new i; i < 12; ++i) {
						
						GetPlayerWeaponData(playerid, i, iWepID, iAmmo);
						if(PlayerInfo[playerid][pGuns][i] == iWepID && GovGuns_IsSelling(iWepID)) {
							ListItemTrackId[playerid][iCount] = iWepID;
							szWeaponName = Weapon_ReturnName(iWepID);
							format(szMiscArray, sizeof(szMiscArray), "%s%s\t$%s\n", szMiscArray, szWeaponName, number_format(arrWeaponCosts[iWepID]));
							iCount++;
						}
					}
					if(iCount == 0) return SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong co bat ky vu khi nao ban co the ban cho Chinh Phu.");
					ShowPlayerDialogEx(playerid, DIALOG_GOVGUN_SELL, DIALOG_STYLE_TABLIST_HEADERS, "Government Arms | Ban vu khi", szMiscArray, "Huy bo", "Ban");	
				}
				case 1: {

					if(!response) return ShowArmsMenu(playerid);

					if(PlayerInfo[playerid][pGunLic] > gettime()) return SendClientMessageEx(playerid, COLOR_GRAD2, "Ban da co giay phep su dung sung");

					ShowPlayerDialogEx(playerid, APPLY_GUN_LIC, DIALOG_STYLE_MSGBOX, 
						"Don xin cap giay phep sung", 
						"Ban sap xin giay phep su dung sung\nBan se co mot kiem tra ly lich cho toi pham trong 3 tuan qua\nQua trinh nay se co gia $100,000", 
						"Ap dung", 
						"Huy bo"
					);
				}
			}
		}
	}
	return 0;
}

GovGuns_MainMenu(playerid)
{
	szMiscArray[0] = 0;
	switch(arrWeaponCosts[46])
	{
		case 0: szMiscArray = "{FF0000}Dong";
		case 1: szMiscArray = "{00FF00}Mo";
	}
	format(szMiscArray, sizeof(szMiscArray), "Danh sach mua hang\nChinh sua gia mua\nMo/Dong trung tam (hien tai: %s{FFFFFF})", szMiscArray);
	return ShowPlayerDialogEx(playerid, DIALOG_GOVGUN_MAIN, DIALOG_STYLE_LIST, "Government Arms Center | Main Menu", szMiscArray, "Lua chon", "");
}

GovGuns_LoadCosts()
{
	mysql_tquery(MainPipeline, "SELECT * FROM `govgunsales` WHERE 1", "GovGuns_OnLoadCosts", "");
	return 1;
}

GovGuns_Streamer()
{
	CreateDynamicObject(3430, 0, 0, 0,   0.00000, 0.00000, 300.33374);
	CreateDynamic3DTextLabel("Government Arms Center\n{DDDDDD}Nhan ~k~~CONVERSATION_YES~ to access the menu", COLOR_YELLOW, 0,0,0, 8.0);
	GovArmsPoint = CreateDynamicSphere(0,0,0, 5.00);
}

GovGuns_IsSellingEdit(i)
{
	switch(i)
	{
		case 22 .. 34: return 1; // enter IDs of weapons that are enabled for sale.
	}
	return 0;
}

GovGuns_IsSelling(i)
{
	switch(i)
	{
		case 22 .. 34: if(arrWeaponCosts[i] > 0) return 1; // enter IDs of weapons that are enabled for sale.
	}
	return 0;
}


GovGuns_EditPrices(playerid)
{
	szMiscArray[0] = 0;
	new iCount;
	szMiscArray = "Name\tPurchase Price\n";
	for(new i; i < 46; ++i)
	{
		if(GovGuns_IsSellingEdit(i)) 
		{
			ListItemTrackId[playerid][iCount] = i;
			format(szMiscArray, sizeof(szMiscArray), "%s%s\t$%s\n", szMiscArray, Weapon_ReturnName(i), number_format(arrWeaponCosts[i]));
			iCount++;
		}
	}
	return ShowPlayerDialogEx(playerid, DIALOG_GOVGUN_EDITPRICE, DIALOG_STYLE_TABLIST_HEADERS, "Government Arms | Chinh sua gia ban", szMiscArray, "Chinh sua", "Huy bo");		
}

forward GovGuns_OnLoadCosts();
public GovGuns_OnLoadCosts()
{
	new iRows, iCount;
	cache_get_row_count(iRows);
	while(iCount < iRows) 
	{
		cache_get_value_name_int(iCount, "wepprice", arrWeaponCosts[iCount]);
		iCount++;
	}
	printf("[Gov Weapon Prices] Loaded %i Weapons", iCount);
	return 1;
}

forward GovGuns_OnShowSales(playerid);
public GovGuns_OnShowSales(playerid)
{
	new iRows, iCount;
	cache_get_row_count(iRows);
	if(!iRows) return SendClientMessageEx(playerid, COLOR_GRAD1, "Da xay ra loi. Vui long thu lai sau.");
	szMiscArray = "Ten\tDa ban\n";
	while(iCount < iRows) 
	{
		if(GovGuns_IsSellingEdit(iCount))
		{
			new value;
			format(szMiscArray, sizeof(szMiscArray), "%s%s\t%spc\n", szMiscArray, Weapon_ReturnName(iCount), number_format(cache_get_value_name_int(iCount, "wepsales", value)));
		}
		iCount++;
	}
	return ShowPlayerDialogEx(playerid, DIALOG_GOVGUNS_SALES, DIALOG_STYLE_TABLIST_HEADERS, "Government Arms | Sales", szMiscArray, "<<", "");
}

CMD:govarms(playerid, params[])
{
	if(IsAGovernment(playerid) && PlayerInfo[playerid][pMember] == PlayerInfo[playerid][pLeader])
	{
		GovGuns_MainMenu(playerid);
	}
	else SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong phai la mot nha lanh dao chinh phu.");
	return 1;
}

/*CMD:sellgovgun(playerid, params[])
{
	szMiscArray[0] = 0;
	new szWeaponName[32],
		iCount, iAmmo, iWepID;
	if(!IsPlayerInRangeOfPoint(playerid, 5.0, 1464.3099, -1747.5853, 15.6267)) return SendClientMessageEx(playerid, COLOR_GRAD1, "You aren't at the government arms point at City Hall in Los Santos.");
	if(arrWeaponCosts[46] == 0) return SendClientMessageEx(playerid, COLOR_GRAD1, "The government arms center is currently closed.");
	szMiscArray = "Name\tSale Price\n";
	for(new i; i < 12; ++i)
	{
		GetPlayerWeaponData(playerid, i, iWepID, iAmmo);
		if(PlayerInfo[playerid][pGuns][i] == iWepID && GovGuns_IsSelling(iWepID))
		{
			ListItemTrackId[playerid][iCount] = iWepID;
			szWeaponName = Weapon_ReturnName(iWepID);
			format(szMiscArray, sizeof(szMiscArray), "%s%s\t$%s\n", szMiscArray, szWeaponName, number_format(arrWeaponCosts[iWepID]));
			iCount++;
		}
	}
	if(iCount == 0) return SendClientMessageEx(playerid, COLOR_GRAD1, "You do not have any weapons that you can sell to the government.");
	ShowPlayerDialogEx(playerid, DIALOG_GOVGUN_SELL, DIALOG_STYLE_TABLIST_HEADERS, "Government Arms | Sell Gun", szMiscArray, "Cancel", "Sell");
	return 1;
}*/

ShowArmsMenu(playerid) {
		
	szMiscArray[0] = 0;

	format(szMiscArray, sizeof(szMiscArray), "{FF8000}** {C2A2DA}%s tiep can ATM, go vao ma PIN.", GetPlayerNameEx(playerid));
	SetPlayerChatBubble(playerid, szMiscArray, COLOR_PURPLE, 15.0, 5000);

	ShowPlayerDialogEx(playerid, ARMS_MENU, DIALOG_STYLE_LIST, "Arms Menu", "Ban sung cho chinh phu\nGiay phep vu khi", "Lua chon", "Huy bo");

	return 1;
}

hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys) {

	if(newkeys & KEY_YES && IsPlayerInDynamicArea(playerid, GovArmsPoint)) {
		ShowArmsMenu(playerid);
	}
	return 1;
}