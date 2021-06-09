#include <YSI\y_hooks>

#define MAX_LISTINGS_PER_PAGE (35)

hook OnPlayerConnect(playerid)
{
	AdTracking[playerid] = 0;
	HouseMarketTracking[playerid] = 0;
	ClearDoorSaleVariables(playerid);
	return 1;
}

hook OnPlayerDisconnect(playerid, reason)
{
	for(new i = 0; i < sizeof(HouseInfo); i ++) if(HouseInfo[i][hOwnerID] == GetPlayerSQLId(playerid) && HouseInfo[i][Listed] == 1 && HouseInfo[i][PendingApproval] == 1) ClearHouseSaleVariables(i);
	foreach(new i : Player)
	{
		if(DDSaleTarget[i] == playerid && i != playerid)
		{
			SendClientMessageEx(i, COLOR_GREY, "The person purchasing your dynamic doors has disconnected.");
			ClearDoorSaleVariables(i);
			break;
		}
	}
	return 1;
}

ClearHouseSaleVariables(houseid)
{
	HouseInfo[houseid][Listed] = 0;
	HouseInfo[houseid][PendingApproval] = 0;
	HouseInfo[houseid][ListedTimeStamp] = 0;
	HouseInfo[houseid][ListingPrice] = 0;
	for(new i = 0; i < 5; i ++)
	{
		if(i < 2) HouseInfo[houseid][LinkedGarage][i] = 0;
		HouseInfo[houseid][LinkedDoor][i] = 0;
	}
	strcpy(HouseInfo[houseid][ListingDescription], "N/A", 128);
	SaveHouse(houseid);
	return 1;
}

ShowListingInformation(playerid, houseid, dialogid)
{
	new count[3];
	szMiscArray[0] = 0;
	format(szMiscArray, sizeof(szMiscArray), "Thong tin chung:\n\n  » Nha ID: %d\n  » Gia tien: $%s\n  » Nguoi ban: %s", houseid, number_format(HouseInfo[houseid][ListingPrice]), StripUnderscore(HouseInfo[houseid][hOwnerName]));
	if(strcmp("N/A", HouseInfo[houseid][ListingDescription], true) != 0) format(szMiscArray, sizeof(szMiscArray), "%s\n  » Mo ta: %s", szMiscArray, HouseInfo[houseid][ListingDescription]);
	format(szMiscArray, sizeof(szMiscArray), "%s\n  » Het han: %s", szMiscArray, date(HouseInfo[houseid][ListedTimeStamp], 4));
	strcat(szMiscArray, "\n\nLien ket Doors:\n");
	for(new i = 0; i < 5; i ++)
	{
		if(HouseInfo[houseid][LinkedDoor][i] != 0 && DDoorsInfo[HouseInfo[houseid][LinkedDoor][i]][ddOwner] == HouseInfo[houseid][hOwnerID]) 
		{
			format(szMiscArray, sizeof(szMiscArray), "%s\n  » Door ID: %d (%s)", szMiscArray, HouseInfo[houseid][LinkedDoor][i], DDoorsInfo[HouseInfo[houseid][LinkedDoor][i]][ddDescription]);
			count[0] ++;
		}
	}
	if(count[0] == 0) strcat(szMiscArray, "\n  » Trong");
	strcat(szMiscArray, "\n\nLien ket Gates:\n");
	for(new i = 0; i < sizeof(GateInfo); i ++)
	{
		if(GateInfo[i][gHID] == houseid) 
		{
			format(szMiscArray, sizeof(szMiscArray), "%s\n  » Gate ID: %d", szMiscArray, i);
			count[1] ++;
		}
	}
	if(count[1] == 0) strcat(szMiscArray, "\n  » Trong");
	strcat(szMiscArray, "\n\nLien ket Garages:\n");
	for(new i = 0; i < 2; i ++)
	{
		if(HouseInfo[houseid][LinkedGarage][i] != 0 && GarageInfo[HouseInfo[houseid][LinkedGarage][i]][gar_Owner] == HouseInfo[houseid][hOwnerID]) 
		{
			format(szMiscArray, sizeof(szMiscArray), "%s\n  » Garage ID: %d", szMiscArray, HouseInfo[houseid][LinkedGarage][i]);
			count[2] ++;
		}
	}
	if(count[2] == 0) strcat(szMiscArray, "\n  » Trong");
	ShowPlayerDialogEx(playerid, dialogid, DIALOG_STYLE_MSGBOX, "Thong tin danh sach nha", szMiscArray, "Okay", "Cancel");
	return 1;
}

GetNearestOwnedHouse(playerid)
{
	for(new i = 0; i < sizeof(HouseInfo); i ++) if(GetPlayerSQLId(playerid) == HouseInfo[i][hOwnerID] && IsPlayerInRangeOfPoint(playerid, 3.0, HouseInfo[i][hExteriorX], HouseInfo[i][hExteriorY], HouseInfo[i][hExteriorZ]) && GetPlayerVirtualWorld(playerid) == HouseInfo[i][hExtVW] && GetPlayerInterior(playerid) == HouseInfo[i][hExtIW]) return i;
	return -1;
}

ShowMainListingDialog(playerid)
{
	new houseid;
	szMiscArray[0] = 0;
	houseid = GetNearestOwnedHouse(playerid);
	if(houseid == -1) return 1;
	format(szMiscArray, sizeof(szMiscArray), "Cai dat\tGia tri\nGia tien\t$%s\nLien ket Door 1\t%s\nLien ket Door 2\t%s\nLien ket Door 3\t%s\nLien ket Door 4\t%s\nLien ket Door 5\t%s\nLien ket Garage 1\t%s\nLien ket Garage 2\t%s\nMo ta\t%s\nHoan tat va gui di",
	number_format(HouseInfo[houseid][ListingPrice]), ReturnDoorLineDetails(playerid, HouseInfo[houseid][LinkedDoor][0]),
	ReturnDoorLineDetails(playerid, HouseInfo[houseid][LinkedDoor][1]), ReturnDoorLineDetails(playerid, HouseInfo[houseid][LinkedDoor][2]),
	ReturnDoorLineDetails(playerid, HouseInfo[houseid][LinkedDoor][3]), ReturnDoorLineDetails(playerid, HouseInfo[houseid][LinkedDoor][4]), 
	ReturnGarageLineDetails(playerid, HouseInfo[houseid][LinkedGarage][0]), ReturnGarageLineDetails(playerid, HouseInfo[houseid][LinkedGarage][1]), HouseInfo[houseid][ListingDescription]);
	ShowPlayerDialogEx(playerid, DIALOG_LISTHOUSEMAIN, DIALOG_STYLE_TABLIST_HEADERS, "House Market", szMiscArray, "Okay", "Cancel");
	return 1;
}

AdditionalAdvertisements(index)
{
	for(new i = index; i < sizeof(HouseInfo); i ++) if(HouseInfo[i][Listed] == 1 && HouseInfo[i][PendingApproval] == 0) return true;
	return false;
}

task HouseMarket[60000]()
{
	new bool:notification;
	for(new i = 0; i < sizeof(HouseInfo); i ++)
	{
		if(HouseInfo[i][Listed] == 1)
		{
			switch(HouseInfo[i][PendingApproval])
			{
				case 0:
				{
					if(gettime() >= HouseInfo[i][ListedTimeStamp])
					{
						ClearHouseSaleVariables(i);
						foreach(new p : Player) 
						{
							if(gPlayerLogged{p} == 1 && HouseInfo[i][hOwnerID] == GetPlayerSQLId(p))
							{
								SendClientMessageEx(p, COLOR_GREY, "Danh sach nha cua ban da het han va da bi xoa khoi thi truong.");
								break;
							}
						}
					}
				}
				case 1:
				{
					if(notification == false)
					{
						ABroadCast(COLOR_LIGHTRED, "Mot hoac nhieu danh sach dang cho xem xet.", 4, true);
						notification = true;
					}
				}
			}
		}
	}
	return 1;
}

CMD:al(playerid, params[]) return cmd_approvelisting(playerid, params);
CMD:dli(playerid, params[]) return cmd_denylisting(playerid, params);

CMD:houselistinghelp(playerid, params[])
{
	SendClientMessageEx(playerid, COLOR_WHITE, "** DANH SACH LENH NHA **");
	SendClientMessageEx(playerid, COLOR_GREY, "» /listhouse - Cho phep ban dat mot danh sach nha ($500,000).");
	SendClientMessageEx(playerid, COLOR_GREY, "» /renewlisting - Cho phep ban gia han danh sach nha dang hoat dong ($100,000).");
	SendClientMessageEx(playerid, COLOR_GREY, "» /listingdate - Cho phep ban xem ngay danh sach nha cua ban het han.");
	SendClientMessageEx(playerid, COLOR_GREY, "» /deletelisting - Cho phep ban xoa mot danh sach nha ban da dat truoc do.");
	SendClientMessageEx(playerid, COLOR_GREY, "» /houselistings - Cho phep ban xem cac danh sach nha dang hoat dong.");
	if(PlayerInfo[playerid][pAdmin] >= 4 || PlayerInfo[playerid][pASM] >= 1)
	{
		SendClientMessageEx(playerid, COLOR_GREY, "» {EE9A4D}SENIOR ADMIN{D8D8D8} /pendinglistings - Allows you to view a list of active Danh sach nha pending administrative approval.");
		SendClientMessageEx(playerid, COLOR_GREY, "» {EE9A4D}SENIOR ADMIN{D8D8D8} /listingdetails [House ID] - Allows you view the details of a specified and pending house listing.");
		SendClientMessageEx(playerid, COLOR_GREY, "» {EE9A4D}SENIOR ADMIN{D8D8D8} /(a)pprove(l)isting [House ID] - Allows you to approve the specified pending house listing.");
		SendClientMessageEx(playerid, COLOR_GREY, "» {EE9A4D}SENIOR ADMIN{D8D8D8} /(d)eny(li)sting [House ID] - Allows you to deny the specified pending house listing.");
		SendClientMessageEx(playerid, COLOR_GREY, "» {EE9A4D}SENIOR ADMIN{D8D8D8} /adeletelisting [House ID] - Allows you to delete the specified pending house listing.");
		SendClientMessageEx(playerid, COLOR_GREY, "* NOTICE: Using the (/admute) command will deny players the ability to post housing listings. *");
	}
	return 1;
}

CMD:denylisting(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] < 4 && PlayerInfo[playerid][pASM] < 1) return SendClientMessageEx(playerid, COLOR_GREY, "You are unauthorized to use this command.");
	new houseid, reason[64], string[128];
	if(sscanf(params, "ds[64]", houseid, reason)) return SendClientMessageEx(playerid, COLOR_GREY, "[USAGE]: /denylisting [House ID] [Reason]");
	if(houseid < 1 || houseid >= MAX_HOUSES)
	{
		format(szMiscArray, sizeof(szMiscArray), "The specified house ID must be between 1 and %d.", MAX_HOUSES - 1);
		SendClientMessageEx(playerid, COLOR_GREY, szMiscArray);
		return 1;
	}
	if(strlen(reason) < 3 || strlen(reason) > 60) return SendClientMessageEx(playerid, COLOR_GREY, "The specified reason cannot be under 3 characters or over 60 characters.");
	if(HouseInfo[houseid][hOwned] == 0) return SendClientMessageEx(playerid, COLOR_GREY, "The specified house is not currently owned.");
	if(HouseInfo[houseid][Listed] == 0 || HouseInfo[houseid][PendingApproval] == 0) return SendClientMessageEx(playerid, COLOR_GREY, "The specified house is not currently pending approval to be listed.");
	ClearHouseSaleVariables(houseid);
	format(string, sizeof(string), "You have denied house ID %d's house listing request (owner: %s), reason: %s.", houseid, StripUnderscore(HouseInfo[houseid][hOwnerName]), reason);
	SendClientMessageEx(playerid, COLOR_YELLOW, string);
	foreach(new i : Player) 
	{
		if(gPlayerLogged{i} == 1 && HouseInfo[houseid][hOwnerID] == GetPlayerSQLId(i))
		{
			format(string, sizeof(string), "%s tu choi yeu cau danh sach nha cua ban (house ID %d), li do: %s.", GetPlayerNameEx(playerid), houseid, reason);
			SendClientMessageEx(i, COLOR_LIGHTRED, string);
			break;
		}
	}
	PlayerInfo[playerid][pTrashReport] ++;
	format(string, sizeof(string), "AdmCmd: %s denied house ID %d's house listing request (owner: %s), li do: %s.", GetPlayerNameEx(playerid), houseid, StripUnderscore(HouseInfo[houseid][hOwnerName]), reason);
	ABroadCast(COLOR_LIGHTRED, string, 4);
	Log("logs/admin.log", string);
	return 1;
}

CMD:approvelisting(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] < 4 && PlayerInfo[playerid][pASM] < 1) return SendClientMessageEx(playerid, COLOR_GREY, "You are unauthorized to use this command.");
	new houseid, seller, string[128];
	if(sscanf(params, "d", houseid)) return SendClientMessageEx(playerid, COLOR_GREY, "[USAGE]: /approvelisting [House ID]");
	if(houseid < 1 || houseid >= MAX_HOUSES)
	{
		format(szMiscArray, sizeof(szMiscArray), "The specified house ID must be between 1 and %d.", MAX_HOUSES - 1);
		SendClientMessageEx(playerid, COLOR_GREY, szMiscArray);
		return 1;
	}
	if(HouseInfo[houseid][hOwned] == 0) return SendClientMessageEx(playerid, COLOR_GREY, "The specified house is not currently owned.");
	if(HouseInfo[houseid][Listed] == 0 || HouseInfo[houseid][PendingApproval] == 0) return SendClientMessageEx(playerid, COLOR_GREY, "The specified house is not currently pending approval to be listed.");
	seller = INVALID_PLAYER_ID;
	foreach(new i : Player) 
	{
		if(gPlayerLogged{i} == 1 && HouseInfo[houseid][hOwnerID] == GetPlayerSQLId(i))
		{
			seller = i;
			break;
		}
	}
	switch(seller)
	{
		case INVALID_PLAYER_ID:
		{
			PlayerInfo[playerid][pAcceptReport] ++;
			ReportCount[playerid] ++;
			ReportHourCount[playerid] ++;
			format(string, sizeof(string), "House ID %d's listing is currently bugged, the listing has been removed.", houseid);
			SendClientMessageEx(playerid, COLOR_YELLOW, string);
			return 1;
		}
		default:
		{
			if(GetPlayerCash(seller) < 500000)
			{
				ClearHouseSaleVariables(houseid);
				SendClientMessageEx(seller, COLOR_GREY, "Danh sach nha cua ban da duoc phe duyet boi Administrator, tuy nhien ban khong co du $500,000.");
				SendClientMessageEx(seller, COLOR_GREY, "Danh sach nha cua ban chua duoc dua ra thi truong vi ban khong du kha nang tra phi cho bai dang.");
				PlayerInfo[playerid][pAcceptReport] ++;
				ReportCount[playerid] ++;
				ReportHourCount[playerid] ++;
				format(string, sizeof(string), "Ban da phe duyet nha ID %d's yeu cau danh sach nha (khong du tien - chu so huu: %s).", houseid, StripUnderscore(HouseInfo[houseid][hOwnerName]));
				SendClientMessageEx(playerid, COLOR_YELLOW, string);
				format(string, sizeof(string), "AdmCmd: %s nha duoc phe duyet ID %d's yeu cau danh sach nha (khong du tien - chu so huu: %s).", GetPlayerNameEx(playerid), houseid, StripUnderscore(HouseInfo[houseid][hOwnerName]));
				ABroadCast(COLOR_LIGHTRED, string, 4);
				Log("logs/admin.log", string);
				return 1;
			}
			else if(GetPlayerCash(seller) >= 500000)
			{
				GivePlayerCashEx(seller, TYPE_ONHAND, -500000);
				HouseInfo[houseid][PendingApproval] = 0;
				HouseInfo[houseid][ListedTimeStamp] = gettime() + 259200;
				SaveHouse(houseid);
				SendClientMessageEx(seller, COLOR_GREEN, "Danh sach nha cua ban da duoc phe duyet boi mot Administrator, ban da bi tinh phi $500,000.");
				PlayerInfo[playerid][pAcceptReport] ++;
				ReportCount[playerid] ++;
				ReportHourCount[playerid] ++;
				format(string, sizeof(string), "Ban da phe duyet nha ID %d's yeu cau danh sach nha (chu so huu: %s).", houseid, StripUnderscore(HouseInfo[houseid][hOwnerName]));
				SendClientMessageEx(playerid, COLOR_YELLOW, string);
				format(string, sizeof(string), "AdmCmd: %s nha duoc phe duyet ID %d's yeu cau danh sach nha (chu so huu: %s).", GetPlayerNameEx(playerid), houseid, StripUnderscore(HouseInfo[houseid][hOwnerName]));
				ABroadCast(COLOR_LIGHTRED, string, 4);
				Log("logs/admin.log", string);
				return 1;
			}
			return 1;
		}
	}
	return 1;
}

CMD:adeletelisting(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] < 4 && PlayerInfo[playerid][pASM] < 1) return SendClientMessageEx(playerid, COLOR_GREY, "You are unauthorized to use this command.");
	new houseid, string[128];
	if(sscanf(params, "d", houseid)) return SendClientMessageEx(playerid, COLOR_GREY, "[USAGE]: /adeletelisting [House ID]");
	if(houseid < 1 || houseid >= MAX_HOUSES)
	{
		format(szMiscArray, sizeof(szMiscArray), "The specified house ID must be between 1 and %d.", MAX_HOUSES - 1);
		SendClientMessageEx(playerid, COLOR_GREY, szMiscArray);
		return 1;
	}
	if(HouseInfo[houseid][hOwned] == 0) return SendClientMessageEx(playerid, COLOR_GREY, "The specified house is not currently owned.");
	if(HouseInfo[houseid][Listed] == 0 || HouseInfo[houseid][PendingApproval] == 1) return SendClientMessageEx(playerid, COLOR_GREY, "The specified house is not currently listed.");
	ClearHouseSaleVariables(houseid);
	format(string, sizeof(string), "You have deleted house ID %d's listing (owner: %s).", houseid, StripUnderscore(HouseInfo[houseid][hOwnerName]));
	SendClientMessageEx(playerid, COLOR_YELLOW, string);
	format(string, sizeof(string), "AdmCmd: %s deleted house ID %d's house listing (owner: %s).", GetPlayerNameEx(playerid), houseid, StripUnderscore(HouseInfo[houseid][hOwnerName]));
	ABroadCast(COLOR_LIGHTRED, string, 4);
	Log("logs/admin.log", string);
	return 1;
}

CMD:listingdetails(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] < 4 && PlayerInfo[playerid][pASM] < 1) return SendClientMessageEx(playerid, COLOR_GREY, "You are unauthorized to use this command.");
	new houseid;
	if(sscanf(params, "d", houseid)) return SendClientMessageEx(playerid, COLOR_GREY, "[USAGE]: /listingdetails [House ID]");
	szMiscArray[0] = 0;
	if(houseid < 1 || houseid >= MAX_HOUSES)
	{
		format(szMiscArray, sizeof(szMiscArray), "The specified house ID must be between 1 and %d.", MAX_HOUSES - 1);
		SendClientMessageEx(playerid, COLOR_GREY, szMiscArray);
		return 1;
	}
	if(HouseInfo[houseid][hOwned] == 0) return SendClientMessageEx(playerid, COLOR_GREY, "The specified house is not currently owned.");
	if(HouseInfo[houseid][Listed] == 0 || HouseInfo[houseid][PendingApproval] == 0) return SendClientMessageEx(playerid, COLOR_GREY, "The specified house is not currently pending approval to be listed.");
	ShowListingInformation(playerid, houseid, DIALOG_LISTINGINFORMATION);
	return 1;
}

CMD:pendinglistings(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] < 4 && PlayerInfo[playerid][pASM] < 1) return SendClientMessageEx(playerid, COLOR_GREY, "You are unauthorized to use this command.");
	new count, string[64];
	SendClientMessageEx(playerid, COLOR_WHITE, "** Danh sach nha PENDING APPROVAL: **");
	for(new i = 0; i < sizeof(HouseInfo); i ++)
	{
		if(HouseInfo[i][hOwned] == 1 && HouseInfo[i][Listed] == 1 && HouseInfo[i][PendingApproval] == 1)
		{
			format(string, sizeof(string), "(House ID: %d) Owner: %s", i, StripUnderscore(HouseInfo[i][hOwnerName]));
			SendClientMessageEx(playerid, COLOR_GREY, string);
			count ++;
		}
	}
	if(count == 0) return SendClientMessageEx(playerid, COLOR_GREY, "There are not currently any Danh sach nha pending approval.");
	return 1;
}

CMD:listhouse(playerid, params[])
{
	if(gPlayerLogged{playerid} == 0) return SendClientMessageEx(playerid, COLOR_GREY, "You're not logged in.");
	if(PlayerInfo[playerid][pADMute] == 1) return SendClientMessageEx(playerid, COLOR_GREY, "You are muted from advertisements.");
	if(GetPVarType(playerid, "Injured")) return SendClientMessageEx(playerid, COLOR_GREY, "Ban khong the su dung danh sach nha trong khi bi thuong.");
	if(PlayerCuffed[playerid] != 0) return SendClientMessageEx(playerid, COLOR_GREY, "Ban khong the su dung danh sach nha ngay bay gio.");
	if(PlayerInfo[playerid][pJailTime] > 0) return SendClientMessageEx(playerid, COLOR_GREY, "You can't use Danh sach nha while in jail.");
	if(PlayerInfo[playerid][pLevel] < 3) return SendClientMessageEx(playerid, COLOR_GREY, "Ban phai it nhat la cap 3 de truy cap danh sach nha.");
	if(GetPlayerCash(playerid) < 500000) return SendClientMessageEx(playerid, COLOR_GREY, "Ban phai co it nhat $500.000 de dat danh sach nha.");
	new houseid;
	if(servernumber == 2) return SendClientMessage(playerid, COLOR_WHITE, "This command is disabled!");
	houseid = GetNearestOwnedHouse(playerid);
	if(houseid == -1) return SendClientMessageEx(playerid, COLOR_GREY, "Ban khong o gan mot ngoi nha ban so huu.");
	if(HouseInfo[houseid][Listed] == 1) return SendClientMessageEx(playerid, COLOR_GREY, "Ngoi nha nay da duoc liet ke tren thi truong nha.");
	HouseInfo[houseid][ListingPrice] = 0;
	HouseInfo[houseid][PendingApproval] = 0;
	HouseInfo[houseid][ListedTimeStamp] = 0;
	for(new i = 0; i < 5; i ++) 
	{
		if(i < 2) HouseInfo[houseid][LinkedGarage][i] = 0;
		HouseInfo[houseid][LinkedDoor][i] = 0;
	}
	strcpy(HouseInfo[houseid][ListingDescription], "N/A", 128);
	SaveHouse(houseid);
	ShowMainListingDialog(playerid);	
    return 1;
}

CMD:listingdate(playerid, params[])
{
	if(gPlayerLogged{playerid} == 0) return SendClientMessageEx(playerid, COLOR_GREY, "You're not logged in.");
	if(GetPVarType(playerid, "Injured")) return SendClientMessageEx(playerid, COLOR_GREY, "You can't use Danh sach nha while injured.");
	if(PlayerCuffed[playerid] != 0) return SendClientMessageEx(playerid, COLOR_GREY, "You can't use Danh sach nha right now.");
	if(PlayerInfo[playerid][pJailTime] > 0) return SendClientMessageEx(playerid, COLOR_GREY, "You can't use Danh sach nha while in jail.");
	if(PlayerInfo[playerid][pLevel] < 3) return SendClientMessageEx(playerid, COLOR_GREY, "Ban phai co it nhat cap do 3 de su dung danh sach nha.");
	new houseid, string[128];
	if(servernumber == 2) return SendClientMessage(playerid, COLOR_WHITE, "This command is disabled!");
	houseid = GetNearestOwnedHouse(playerid);
	if(houseid == -1) return SendClientMessageEx(playerid, COLOR_GREY, "You are not near a house that you own.");
	if(HouseInfo[houseid][Listed] == 0 || HouseInfo[houseid][PendingApproval] == 1) return SendClientMessageEx(playerid, COLOR_GREY, "This house is not currently listed on the house market.");
	format(string, sizeof(string), "Danh sach nha cua ban se het han vao %s.", date(HouseInfo[houseid][ListedTimeStamp], 4));
	SendClientMessageEx(playerid, COLOR_WHITE, string);
    return 1;
}

CMD:renewlisting(playerid, params[])
{
	if(gPlayerLogged{playerid} == 0) return SendClientMessageEx(playerid, COLOR_GREY, "You're not logged in.");
	if(GetPVarType(playerid, "Injured")) return SendClientMessageEx(playerid, COLOR_GREY, "You can't use Danh sach nha while injured.");
	if(PlayerCuffed[playerid] != 0) return SendClientMessageEx(playerid, COLOR_GREY, "You can't use Danh sach nha right now.");
	if(PlayerInfo[playerid][pJailTime] > 0) return SendClientMessageEx(playerid, COLOR_GREY, "You can't use Danh sach nha while in jail.");
	if(PlayerInfo[playerid][pLevel] < 3) return SendClientMessageEx(playerid, COLOR_GREY, "Ban phai co it nhat cap do 3 de su dung danh sach nha.");
	if(GetPlayerCash(playerid) < 100000) return SendClientMessageEx(playerid, COLOR_GREY, "You must have at least $100,000 to renew your house listing.");
	new houseid, string[128];
	if(servernumber == 2) return SendClientMessage(playerid, COLOR_WHITE, "This command is disabled!");
	houseid = GetNearestOwnedHouse(playerid);
	if(houseid == -1) return SendClientMessageEx(playerid, COLOR_GREY, "You are not near a house that you own.");
	if(HouseInfo[houseid][Listed] == 0 || HouseInfo[houseid][PendingApproval] == 1) return SendClientMessageEx(playerid, COLOR_GREY, "This house is not currently listed on the house market.");
	HouseInfo[houseid][ListedTimeStamp] += 86400;
	SaveHouse(houseid);
	format(string, sizeof(string), "Ban da gia han danh sach nha cua ban mot ngay, no se het han vao %s.", date(HouseInfo[houseid][ListedTimeStamp], 4));
	SendClientMessageEx(playerid, COLOR_GREEN, string);
	GivePlayerCashEx(playerid, TYPE_ONHAND, -100000);
    return 1;
}

CMD:deletelisting(playerid, params[])
{
	if(gPlayerLogged{playerid} == 0) return SendClientMessageEx(playerid, COLOR_GREY, "You're not logged in.");
	if(GetPVarType(playerid, "Injured")) return SendClientMessageEx(playerid, COLOR_GREY, "You can't use Danh sach nha while injured.");
	if(PlayerCuffed[playerid] != 0) return SendClientMessageEx(playerid, COLOR_GREY, "You can't use Danh sach nha right now.");
	if(PlayerInfo[playerid][pJailTime] > 0) return SendClientMessageEx(playerid, COLOR_GREY, "You can't use Danh sach nha while in jail.");
	if(PlayerInfo[playerid][pLevel] < 3) return SendClientMessageEx(playerid, COLOR_GREY, "Ban phai co it nhat cap do 3 de su dung danh sach nha.");
	new houseid;
	if(servernumber == 2) return SendClientMessage(playerid, COLOR_WHITE, "This command is disabled!");
	houseid = GetNearestOwnedHouse(playerid);
	if(houseid == -1) return SendClientMessageEx(playerid, COLOR_GREY, "You are not near a house that you own.");
	if(HouseInfo[houseid][Listed] == 0 || HouseInfo[houseid][PendingApproval] == 1) return SendClientMessageEx(playerid, COLOR_GREY, "This house is not currently listed on the house market.");
	ClearHouseSaleVariables(houseid);
	SendClientMessageEx(playerid, COLOR_GREY, "Ban da dua danh sach nha cua ban ra khoi thi truong.");
    return 1;
}

CMD:houselistings(playerid, params[])
{
	if(gPlayerLogged{playerid} == 0) return SendClientMessageEx(playerid, COLOR_GREY, "You're not logged in.");
	if(GetPVarType(playerid, "Injured")) return SendClientMessageEx(playerid, COLOR_GREY, "You can't use Danh sach nha while injured.");
	if(PlayerCuffed[playerid] != 0) return SendClientMessageEx(playerid, COLOR_GREY, "You can't use Danh sach nha right now.");
	if(PlayerInfo[playerid][pJailTime] > 0) return SendClientMessageEx(playerid, COLOR_GREY, "You can't use Danh sach nha while in jail.");
	if(PlayerInfo[playerid][pLevel] < 3) return SendClientMessageEx(playerid, COLOR_GREY, "Ban phai co it nhat cap do 3 de su dung danh sach nha.");
	new count[4], location[MAX_ZONE_NAME];
	szMiscArray[0] = 0;
	for(new i = 0; i < sizeof(HouseInfo); i ++)
	{
		if(HouseInfo[i][hOwned] == 1 && HouseInfo[i][Listed] == 1 && HouseInfo[i][PendingApproval] == 0)
		{
			location = "San Andreas";
			for(new l = 1; l < sizeof(count); l ++) count[l] = 0;
			for(new l = 0; l < 5; l ++) 
			{
				if(l < 2) if(HouseInfo[i][LinkedGarage][l] != 0) count[3] ++;
				if(HouseInfo[i][LinkedDoor][l] != 0) count[1] ++;
			}
			for(new l = 0; l < sizeof(GateInfo); l ++) if(GateInfo[l][gHID] == i) count[2] ++;
			Get3DZone(HouseInfo[i][hExteriorX], HouseInfo[i][hExteriorY], HouseInfo[i][hExteriorZ], location, sizeof(location));
			format(szMiscArray, sizeof(szMiscArray), "%s\n(%d) [$%s] [%s] [%d DD(s)] [%d DG(s)] [%d G(s)]", szMiscArray, i, number_format(HouseInfo[i][ListingPrice]), location, count[1], count[2], count[3]);
			AdTracking[playerid] = i;
			count[0] ++;
		}
		if(count[0] == MAX_LISTINGS_PER_PAGE) break;
	}
	if(count[0] == 0) return SendClientMessage(playerid, COLOR_GREY, "Khong co quang cao hoat dong tai thoi diem nay.");
	if(count[0] == MAX_LISTINGS_PER_PAGE) format(szMiscArray, sizeof(szMiscArray), "%s\n[Trang ke...]", szMiscArray);
	ShowPlayerDialogEx(playerid, DIALOG_LISTHOUSELISTINGS, DIALOG_STYLE_LIST, "Danh sach nha", szMiscArray, "Okay", "Cancel");
	return 1;
}

hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[]) {

	if(arrAntiCheat[playerid][ac_iFlags][AC_DIALOGSPOOFING] > 0) return 1;
	new string[128];
	switch(dialogid)
	{
		case DIALOG_LISTHOUSEMAIN:
		{
			new houseid;
			houseid = GetNearestOwnedHouse(playerid);
			switch(response)
			{
				case false: if(houseid != -1)  return ClearHouseSaleVariables(houseid);
				case true:
				{
					if(gPlayerLogged{playerid} == 0) return SendClientMessageEx(playerid, COLOR_GREY, "You're not logged in.");
					if(PlayerInfo[playerid][pADMute] == 1) return SendClientMessageEx(playerid, COLOR_GREY, "You are muted from advertisements.");
					if(GetPVarType(playerid, "Injured")) return SendClientMessageEx(playerid, COLOR_GREY, "You can't use Danh sach nha while injured.");
					if(PlayerCuffed[playerid] != 0) return SendClientMessageEx(playerid, COLOR_GREY, "You can't use Danh sach nha right now.");
					if(PlayerInfo[playerid][pJailTime] > 0) return SendClientMessageEx(playerid, COLOR_GREY, "You can't use Danh sach nha while in jail.");
					if(PlayerInfo[playerid][pLevel] < 3) return SendClientMessageEx(playerid, COLOR_GREY, "Ban phai co it nhat cap do 3 de su dung danh sach nha.");
					if(GetPlayerCash(playerid) < 500000) return SendClientMessageEx(playerid, COLOR_GREY, "Ban phai co it nhat $500,000 de dat yeu cau danh sach nha.");
					if(houseid == -1) return SendClientMessageEx(playerid, COLOR_GREY, "You are not near a house that you own.");
					if(HouseInfo[houseid][Listed] == 1) return SendClientMessageEx(playerid, COLOR_GREY, "This house is already listed on the house market.");
					switch(listitem)
					{
						case 0: return ShowPlayerDialogEx(playerid, DIALOG_LISTHOUSEPRICE, DIALOG_STYLE_INPUT, "Danh sach nha", "Nhap gia cua ban vao duoi day.", "Okay", "Cancel");
						case 1..5:
						{
							HouseMarketTracking[playerid] = listitem - 1;
							ShowPlayerDialogEx(playerid, DIALOG_LISTHOUSEDOORS, DIALOG_STYLE_INPUT, "Danh sach nha", "Nhap ID cua mot ngoi nha de lien ket no voi danh sach cua ban. Nhap \"0\" de xoa Door.", "Okay", "Cancel");
							return 1;
						}
						case 6, 7:
						{
							HouseMarketTracking[playerid] = listitem - 6;
							ShowPlayerDialogEx(playerid, DIALOG_LISTHOUSEGARAGES, DIALOG_STYLE_INPUT, "Danh sach nha", "Nhap ID Garage de lien ket no voi danh sach cua ban. Nhap \"0\" de xoa Garage..", "Okay", "Cancel");
							return 1;
						}
						case 8: return ShowPlayerDialogEx(playerid, DIALOG_LISTHOUSEDESCRIPTION, DIALOG_STYLE_INPUT, "Danh sach nha", "Nhap mo ta danh sach cua ban duoi day.", "Okay", "Cancel");
						case 9:
						{
							if(HouseInfo[houseid][ListingPrice] == 0)
							{
								SendClientMessageEx(playerid, COLOR_GREY, "Ban phai chi dinh gia truoc khi gui danh sach nha.");
								ShowMainListingDialog(playerid);
								return 1;
							}
							for(new i = 0; i < 5; i ++) 
							{
								if(i < 2) if(HouseInfo[houseid][LinkedGarage][i] != 0 && GetPlayerSQLId(playerid) != GarageInfo[HouseInfo[houseid][LinkedGarage][i]][gar_Owner]) HouseInfo[houseid][LinkedGarage][i] = 0;
								if(HouseInfo[houseid][LinkedDoor][i] != 0 && GetPlayerSQLId(playerid) != DDoorsInfo[HouseInfo[houseid][LinkedDoor][i]][ddOwner]) HouseInfo[houseid][LinkedDoor][i] = 0;
							}
							HouseInfo[houseid][Listed] = 1;
							HouseInfo[houseid][PendingApproval] = 1;
							SaveHouse(houseid);
							SendClientMessageEx(playerid, COLOR_GREEN, "Danh sach nha o cua ban da duoc gui de xem xet boi Administrator Server.");
							format(string, sizeof(string), "[Yeu cau danh sach nha moi]: Nha ID %d, Chu so huu: %s.", houseid, GetPlayerNameEx(playerid));
							ABroadCast(COLOR_LIGHTRED, string, 4);
							return 1;
						}
					}
					return 1;
				}
			}
			return 1;
		}
		case DIALOG_LISTHOUSEPRICE:
		{
			switch(response)
			{
				case false: return ShowMainListingDialog(playerid);
				case true:
				{
					if(gPlayerLogged{playerid} == 0) return SendClientMessageEx(playerid, COLOR_GREY, "You're not logged in.");
					if(PlayerInfo[playerid][pADMute] == 1) return SendClientMessageEx(playerid, COLOR_GREY, "You are muted from advertisements.");
					if(GetPVarType(playerid, "Injured")) return SendClientMessageEx(playerid, COLOR_GREY, "You can't use Danh sach nha while injured.");
					if(PlayerCuffed[playerid] != 0) return SendClientMessageEx(playerid, COLOR_GREY, "You can't use Danh sach nha right now.");
					if(PlayerInfo[playerid][pJailTime] > 0) return SendClientMessageEx(playerid, COLOR_GREY, "You can't use Danh sach nha while in jail.");
					if(PlayerInfo[playerid][pLevel] < 3) return SendClientMessageEx(playerid, COLOR_GREY, "Ban phai co it nhat cap do 3 de su dung danh sach nha.");
					if(GetPlayerCash(playerid) < 500000) return SendClientMessageEx(playerid, COLOR_GREY, "Ban phai co it nhat $500.000 de dat danh sach nha.");
					new houseid, price;
					houseid = GetNearestOwnedHouse(playerid);
					if(houseid == -1) return SendClientMessageEx(playerid, COLOR_GREY, "You are not near a house that you own.");
					if(HouseInfo[houseid][Listed] == 1) return SendClientMessageEx(playerid, COLOR_GREY, "This house is already listed on the house market.");
					if(sscanf(inputtext, "d", price))
					{
						SendClientMessageEx(playerid, COLOR_GREY, "Gia quy dinh phai bang so.");
						ShowPlayerDialogEx(playerid, DIALOG_LISTHOUSEPRICE, DIALOG_STYLE_INPUT, "Danh sach nha", "Nhap gia cua ban vao duoi day.", "Okay", "Cancel");
						return 1;
					}
					if(price < 100000 || price > 500000000)
					{
						SendClientMessageEx(playerid, COLOR_GREY, "Gia quy dinh khong the duoi $100,000 va tren $500,000,000.");
						ShowPlayerDialogEx(playerid, DIALOG_LISTHOUSEPRICE, DIALOG_STYLE_INPUT, "Danh sach nha", "Nhap gia cua ban vao duoi day.", "Okay", "Cancel");
						return 1;
					}
					if(price == HouseInfo[houseid][ListingPrice])
					{
						format(string, sizeof(string), "Gia danh sach nha cua ban da duoc dat thanh $%s.", number_format(price));
						SendClientMessageEx(playerid, COLOR_GREY, string);
						ShowPlayerDialogEx(playerid, DIALOG_LISTHOUSEPRICE, DIALOG_STYLE_INPUT, "Danh sach nha", "Nhap gia cua ban vao duoi day.", "Okay", "Cancel");
						return 1;
					}
					HouseInfo[houseid][ListingPrice] = price;
					SaveHouse(houseid);
					SendClientMessageEx(playerid, COLOR_WHITE, "Ban da cap nhat gia danh sach cua ban.");
					ShowMainListingDialog(playerid);
					return 1;
				}
			}
			return 1;
		}
		case DIALOG_LISTHOUSEDESCRIPTION:
		{
			switch(response)
			{
				case false: return ShowMainListingDialog(playerid);
				case true:
				{
					if(gPlayerLogged{playerid} == 0) return SendClientMessageEx(playerid, COLOR_GREY, "You're not logged in.");
					if(PlayerInfo[playerid][pADMute] == 1) return SendClientMessageEx(playerid, COLOR_GREY, "You are muted from advertisements.");
					if(GetPVarType(playerid, "Injured")) return SendClientMessageEx(playerid, COLOR_GREY, "You can't use Danh sach nha while injured.");
					if(PlayerCuffed[playerid] != 0) return SendClientMessageEx(playerid, COLOR_GREY, "You can't use Danh sach nha right now.");
					if(PlayerInfo[playerid][pJailTime] > 0) return SendClientMessageEx(playerid, COLOR_GREY, "You can't use Danh sach nha while in jail.");
					if(PlayerInfo[playerid][pLevel] < 3) return SendClientMessageEx(playerid, COLOR_GREY, "Ban phai co it nhat cap do 3 de su dung danh sach nha.");
					if(GetPlayerCash(playerid) < 500000) return SendClientMessageEx(playerid, COLOR_GREY, "Ban phai co it nhat $500.000 de dat danh sach nha.");
					new houseid;
					houseid = GetNearestOwnedHouse(playerid);
					if(houseid == -1) return SendClientMessageEx(playerid, COLOR_GREY, "You are not near a house that you own.");
					if(HouseInfo[houseid][Listed] == 1) return SendClientMessageEx(playerid, COLOR_GREY, "This house is already listed on the house market.");
					if(strlen(inputtext) < 1 || strlen(inputtext) > 128)
					{
						SendClientMessageEx(playerid, COLOR_GREY, "Mo ta danh sach khong the duoi 1 ky tu hoac tren 128 ky tu.");
						ShowPlayerDialogEx(playerid, DIALOG_LISTHOUSEDESCRIPTION, DIALOG_STYLE_INPUT, "Danh sach nha", "Nhap mo ta danh sach cua ban duoi day.", "Okay", "Cancel");
						return 1;
					}
					if(strcmp(inputtext, HouseInfo[houseid][ListingDescription], false) == 0)
					{
						SendClientMessageEx(playerid, COLOR_GREY, "Mo ta ban da chi dinh da duoc dat mo ta.");
						ShowPlayerDialogEx(playerid, DIALOG_LISTHOUSEDESCRIPTION, DIALOG_STYLE_INPUT, "Danh sach nha", "Nhap mo ta danh sach cua ban duoi day.", "Okay", "Cancel");
						return 1;
					}
					for(new i = 0; i < strlen(inputtext) - 7; i ++)
					{
						if(inputtext[i] == '{' && inputtext[i + 7] == '}')
						{
							strmid(string, inputtext, i + 1, i + 7);
							if(ishex(string))
							{
								strdel(inputtext, i, i + 8);
								continue;
							}
						}
					}
					strcpy(HouseInfo[houseid][ListingDescription], inputtext, 128);
					SaveHouse(houseid);
					SendClientMessageEx(playerid, COLOR_WHITE, "Ban da cap nhat mo ta danh sach.");
					ShowMainListingDialog(playerid);
					return 1;
				}
			}
			return 1;
		}
		case DIALOG_LISTHOUSEDOORS:
		{
			switch(response)
			{
				case false: return ShowMainListingDialog(playerid);
				case true:
				{
					if(gPlayerLogged{playerid} == 0) return SendClientMessageEx(playerid, COLOR_GREY, "You're not logged in.");
					if(PlayerInfo[playerid][pADMute] == 1) return SendClientMessageEx(playerid, COLOR_GREY, "You are muted from advertisements.");
					if(GetPVarType(playerid, "Injured")) return SendClientMessageEx(playerid, COLOR_GREY, "You can't use Danh sach nha while injured.");
					if(PlayerCuffed[playerid] != 0) return SendClientMessageEx(playerid, COLOR_GREY, "You can't use Danh sach nha right now.");
					if(PlayerInfo[playerid][pJailTime] > 0) return SendClientMessageEx(playerid, COLOR_GREY, "You can't use Danh sach nha while in jail.");
					if(PlayerInfo[playerid][pLevel] < 3) return SendClientMessageEx(playerid, COLOR_GREY, "Ban phai co it nhat cap do 3 de su dung danh sach nha.");
					if(GetPlayerCash(playerid) < 500000) return SendClientMessageEx(playerid, COLOR_GREY, "Ban phai co it nhat $500.000 de dat danh sach nha.");
					new houseid, doorid;
					houseid = GetNearestOwnedHouse(playerid);
					if(houseid == -1) return SendClientMessageEx(playerid, COLOR_GREY, "You are not near a house that you own.");
					if(HouseInfo[houseid][Listed] == 1) return SendClientMessageEx(playerid, COLOR_GREY, "This house is already listed on the house market.");
					if(sscanf(inputtext, "d", doorid))
					{
						SendClientMessageEx(playerid, COLOR_GREY, "ID Door chi dinh phai la so.");
						ShowPlayerDialogEx(playerid, DIALOG_LISTHOUSEDOORS, DIALOG_STYLE_INPUT, "Danh sach nha", "Nhap ID cua mot ngoi nha de lien ket no voi danh sach cua ban. Nhap \"0\" de xoa Door.", "Okay", "Cancel");
						return 1;
					}
					if(doorid < 0 || doorid >= MAX_DDOORS)
					{
						SendClientMessageEx(playerid, COLOR_GREY, "ID Door chi dinh khong hop le.");
						ShowPlayerDialogEx(playerid, DIALOG_LISTHOUSEDOORS, DIALOG_STYLE_INPUT, "Danh sach nha", "Nhap ID cua mot ngoi nha de lien ket no voi danh sach cua ban. Nhap \"0\" de xoa Door.", "Okay", "Cancel");
						return 1;
					}
					for(new i = 0; i < 5; i ++)
					{
						if(HouseInfo[houseid][LinkedDoor][i] == doorid && doorid != 0)
						{
							SendClientMessageEx(playerid, COLOR_GREY, "Door duoc chi dinh da duoc lien ket voi danh sach cua ban.");
							ShowPlayerDialogEx(playerid, DIALOG_LISTHOUSEDOORS, DIALOG_STYLE_INPUT, "Danh sach nha", "Nhap ID cua mot ngoi nha de lien ket no voi danh sach cua ban. Nhap \"0\" de xoa Door.", "Okay", "Cancel");
							return 1;
						}
					}
					switch(doorid)
					{
						case 0:
						{
							if(HouseInfo[houseid][LinkedDoor][HouseMarketTracking[playerid]] == 0)
							{
								SendClientMessageEx(playerid, COLOR_GREY, "Door duoc chi dinh da duoc lien ket voi danh sach cua ban.");
								ShowPlayerDialogEx(playerid, DIALOG_LISTHOUSEDOORS, DIALOG_STYLE_INPUT, "Danh sach nha", "Nhap ID cua mot ngoi nha de lien ket no voi danh sach cua ban. Nhap \"0\" de xoa Door.", "Okay", "Cancel");
								return 1;
							}
							HouseInfo[houseid][LinkedDoor][HouseMarketTracking[playerid]] = 0;
							SaveHouse(houseid);
							SendClientMessageEx(playerid, COLOR_WHITE, "Ban da cap nhat/xoa cac Door duoc lien ket voi danh sach cua ban.");
							ShowMainListingDialog(playerid);
							return 1;
						}
						default:
						{
							if(DDoorsInfo[doorid][ddOwner] != GetPlayerSQLId(playerid))
							{
								SendClientMessageEx(playerid, COLOR_GREY, "Ban khong so huu Door duoc chi dinh.");
								ShowPlayerDialogEx(playerid, DIALOG_LISTHOUSEDOORS, DIALOG_STYLE_INPUT, "Danh sach nha", "Nhap ID cua mot ngoi nha de lien ket no voi danh sach cua ban. Nhap \"0\" de xoa Door.", "Okay", "Cancel");
								return 1;
							}
							if(HouseInfo[houseid][hIntIW] != DDoorsInfo[doorid][ddInteriorInt] || HouseInfo[houseid][hIntVW] != DDoorsInfo[doorid][ddInteriorVW])
							{
								SendClientMessageEx(playerid, COLOR_GREY, "Door duoc chi dinh khong duoc lien ket voi ngoi nha cua ban.");
								ShowPlayerDialogEx(playerid, DIALOG_LISTHOUSEDOORS, DIALOG_STYLE_INPUT, "Danh sach nha", "Nhap ID cua mot ngoi nha de lien ket no voi danh sach cua ban. Nhap \"0\" de xoa Door.", "Okay", "Cancel");
								return 1;
							}
							HouseInfo[houseid][LinkedDoor][HouseMarketTracking[playerid]] = doorid;
							SaveHouse(houseid);
							SendClientMessageEx(playerid, COLOR_WHITE, "Ban da cap nhat cac Door duoc lien ket voi danh sach cau ban.");
							ShowMainListingDialog(playerid);
							return 1;
						}
					}
					return 1;
				}
			}
			return 1;
		}
		case DIALOG_LISTHOUSEGARAGES:
		{
			switch(response)
			{
				case false: return ShowMainListingDialog(playerid);
				case true:
				{
					if(gPlayerLogged{playerid} == 0) return SendClientMessageEx(playerid, COLOR_GREY, "You're not logged in.");
					if(PlayerInfo[playerid][pADMute] == 1) return SendClientMessageEx(playerid, COLOR_GREY, "You are muted from advertisements.");
					if(GetPVarType(playerid, "Injured")) return SendClientMessageEx(playerid, COLOR_GREY, "You can't use Danh sach nha while injured.");
					if(PlayerCuffed[playerid] != 0) return SendClientMessageEx(playerid, COLOR_GREY, "You can't use Danh sach nha right now.");
					if(PlayerInfo[playerid][pJailTime] > 0) return SendClientMessageEx(playerid, COLOR_GREY, "You can't use Danh sach nha while in jail.");
					if(PlayerInfo[playerid][pLevel] < 3) return SendClientMessageEx(playerid, COLOR_GREY, "Ban phai co it nhat cap do 3 de su dung danh sach nha.");
					if(GetPlayerCash(playerid) < 500000) return SendClientMessageEx(playerid, COLOR_GREY, "Ban phai co it nhat $500.000 de dat danh sach nha.");
					new houseid, garageid;
					houseid = GetNearestOwnedHouse(playerid);
					if(houseid == -1) return SendClientMessageEx(playerid, COLOR_GREY, "You are not near a house that you own.");
					if(HouseInfo[houseid][Listed] == 1) return SendClientMessageEx(playerid, COLOR_GREY, "This house is already listed on the house market.");
					if(sscanf(inputtext, "d", garageid))
					{
						SendClientMessageEx(playerid, COLOR_GREY, "ID Garage duoc chi dinh phai bang so.");
						ShowPlayerDialogEx(playerid, DIALOG_LISTHOUSEGARAGES, DIALOG_STYLE_INPUT, "Danh sach nha", "Nhap ID Garage de lien ket no voi danh sach cua ban. Nhap \"0\" de xoa Garage..", "Okay", "Cancel");
						return 1;
					}
					if(garageid < 0 || garageid >= MAX_GARAGES)
					{
						SendClientMessageEx(playerid, COLOR_GREY, "ID Garage chi dinh khong hop le.");
						ShowPlayerDialogEx(playerid, DIALOG_LISTHOUSEGARAGES, DIALOG_STYLE_INPUT, "Danh sach nha", "Nhap ID Garage de lien ket no voi danh sach cua ban. Nhap \"0\" de xoa Garage..", "Okay", "Cancel");
						return 1;
					}
					for(new i = 0; i < 2; i ++)
					{
						if(HouseInfo[houseid][LinkedGarage][i] == garageid && garageid != 0)
						{
							SendClientMessageEx(playerid, COLOR_GREY, "Garage duoc chi dinh da duoc lien ket voi danh sach cua ban.");
							ShowPlayerDialogEx(playerid, DIALOG_LISTHOUSEGARAGES, DIALOG_STYLE_INPUT, "Danh sach nha", "Nhap ID Garage de lien ket no voi danh sach cua ban. Nhap \"0\" de xoa Garage..", "Okay", "Cancel");
							return 1;
						}
					}
					switch(garageid)
					{
						case 0:
						{
							if(HouseInfo[houseid][LinkedGarage][HouseMarketTracking[playerid]] == 0)
							{
								SendClientMessageEx(playerid, COLOR_GREY, "Ban khong co Garage de lien ket trong vi tri da chi dinh.");
								ShowPlayerDialogEx(playerid, DIALOG_LISTHOUSEGARAGES, DIALOG_STYLE_INPUT, "Danh sach nha", "Nhap ID Garage de lien ket no voi danh sach cua ban. Nhap \"0\" de xoa Garage..", "Okay", "Cancel");
								return 1;
							}
							HouseInfo[houseid][LinkedGarage][HouseMarketTracking[playerid]] = 0;
							SaveHouse(houseid);
							SendClientMessageEx(playerid, COLOR_WHITE, "Ban da cap nhat/xoa cac Garage duoc lien ket voi danh sach cua ban.");
							ShowMainListingDialog(playerid);
							return 1;
						}
						default:
						{
							if(DDoorsInfo[garageid][ddOwner] != GetPlayerSQLId(playerid))
							{
								SendClientMessageEx(playerid, COLOR_GREY, "Ban khong so huu Garage duoc chi dinh.");
								ShowPlayerDialogEx(playerid, DIALOG_LISTHOUSEGARAGES, DIALOG_STYLE_INPUT, "Danh sach nha", "Nhap ID Garage de lien ket no voi danh sach cua ban. Nhap \"0\" de xoa Garage..", "Okay", "Cancel");
								return 1;
							}
							HouseInfo[houseid][LinkedGarage][HouseMarketTracking[playerid]] = garageid;
							SaveHouse(houseid);
							SendClientMessageEx(playerid, COLOR_WHITE, "Ban da cap nhat cac Garage duoc lien ket voi danh sach cua ban.");
							ShowMainListingDialog(playerid);
							return 1;
						}
					}
					return 1;
				}
			}
			return 1;
		}
		case DIALOG_LISTHOUSELISTINGS:
		{
			if(response)
			{
				if(gPlayerLogged{playerid} == 0) return SendClientMessageEx(playerid, COLOR_GREY, "You're not logged in.");
				if(GetPVarType(playerid, "Injured")) return SendClientMessageEx(playerid, COLOR_GREY, "You can't use Danh sach nha while injured.");
				if(PlayerCuffed[playerid] != 0) return SendClientMessageEx(playerid, COLOR_GREY, "You can't use Danh sach nha right now.");
				if(PlayerInfo[playerid][pJailTime] > 0) return SendClientMessageEx(playerid, COLOR_GREY, "You can't use Danh sach nha while in jail.");
				if(PlayerInfo[playerid][pLevel] < 3) return SendClientMessageEx(playerid, COLOR_GREY, "Ban phai co it nhat cap do 3 de su dung danh sach nha.");
				szMiscArray[0] = 0;
				new houseid, position[2], count[4], location[MAX_ZONE_NAME];
				if(strcmp(inputtext, "[Next Page...]", true) == 0)
				{
					for(new i = AdTracking[playerid] + 1; i < sizeof(HouseInfo); i ++)
					{
						if(HouseInfo[i][hOwned] == 1 && HouseInfo[i][Listed] == 1 && HouseInfo[i][PendingApproval] == 0)
						{
							location = "San Andreas";
							for(new l = 1; l < sizeof(count); l ++) count[l] = 0;
							for(new l = 0; l < 5; l ++) 
							{
								if(l < 2) if(HouseInfo[i][LinkedGarage][l] != 0) count[3] ++;
								if(HouseInfo[i][LinkedDoor][l] != 0) count[1] ++;
							}
							for(new l = 0; l < sizeof(GateInfo); l ++) if(GateInfo[l][gHID] == i) count[2] ++;
							Get3DZone(HouseInfo[i][hExteriorX], HouseInfo[i][hExteriorY], HouseInfo[i][hExteriorZ], location, sizeof(location));
							format(szMiscArray, sizeof(szMiscArray), "%s\n(%d) [$%s] [%s] [%d DD(s)] [%d DG(s)] [%d G(s)]", szMiscArray, i, number_format(HouseInfo[i][ListingPrice]), location, count[1], count[2], count[3]);
							AdTracking[playerid] = i;
							count[0] ++;
						}
						if(count[0] == MAX_LISTINGS_PER_PAGE) break;
					}
					if(count[0] == 0) return SendClientMessage(playerid, COLOR_GREY, "Khong co quang cao hoat dong tai thoi diem nay.");
					if(count[0] == MAX_LISTINGS_PER_PAGE && AdditionalAdvertisements(AdTracking[playerid] + 1)) strcat(szMiscArray, "\n[Trang ke...]");
					ShowPlayerDialogEx(playerid, DIALOG_LISTHOUSELISTINGS, DIALOG_STYLE_LIST, "Danh sach nha", szMiscArray, "Okay", "Cancel");
					return 1;
				}
				position[0] = strfind(inputtext, "(");
				position[1] = strfind(inputtext, ")");
				strmid(string, inputtext, position[0] + 1, position[1]);
				houseid = strval(string);
				if(HouseInfo[houseid][hOwned] == 0 || HouseInfo[houseid][Listed] == 0 || HouseInfo[houseid][PendingApproval] == 1)
				{
					SendClientMessageEx(playerid, COLOR_GREY, "Nha duoc chi dinh hien khong duoc ban.");
					cmd_houselistings(playerid, "");
					return 1;
				}
				HouseMarketTracking[playerid] = houseid;
				ShowListingInformation(playerid, houseid, DIALOG_SELECTEDLISTING);
				return 1;
			}
		}
		case DIALOG_SELECTEDLISTING:
		{
			if(gPlayerLogged{playerid} == 0) return SendClientMessageEx(playerid, COLOR_GREY, "You're not logged in.");
			if(GetPVarType(playerid, "Injured")) return SendClientMessageEx(playerid, COLOR_GREY, "You can't use Danh sach nha while injured.");
			if(PlayerCuffed[playerid] != 0) return SendClientMessageEx(playerid, COLOR_GREY, "You can't use Danh sach nha right now.");
			if(PlayerInfo[playerid][pJailTime] > 0) return SendClientMessageEx(playerid, COLOR_GREY, "You can't use Danh sach nha while in jail.");
			if(PlayerInfo[playerid][pLevel] < 3) return SendClientMessageEx(playerid, COLOR_GREY, "Ban phai co it nhat cap do 3 de su dung danh sach nha.");
			switch(response)
			{
				case false: return cmd_houselistings(playerid, "");
				case true: 
				{
					if(HouseInfo[HouseMarketTracking[playerid]][hOwned] == 0 || HouseInfo[HouseMarketTracking[playerid]][Listed] == 0 || HouseInfo[HouseMarketTracking[playerid]][PendingApproval] == 1)
					{
						SendClientMessageEx(playerid, COLOR_GREY, "Nha duoc chi dinh hien khong duoc ban.");
						cmd_houselistings(playerid, "");
						return 1;
					}
					ShowPlayerDialogEx(playerid, DIALOG_LISTINGOPTIONS, DIALOG_STYLE_LIST, "Danh sach nha", "Xem nha\nMua nha", "Okay", "Cancel");
					return 1;
				}
			}
			return 1;
		}
		case DIALOG_LISTINGOPTIONS:
		{
			if(gPlayerLogged{playerid} == 0) return SendClientMessageEx(playerid, COLOR_GREY, "You're not logged in.");
			if(GetPVarType(playerid, "Injured")) return SendClientMessageEx(playerid, COLOR_GREY, "You can't use Danh sach nha while injured.");
			if(PlayerCuffed[playerid] != 0) return SendClientMessageEx(playerid, COLOR_GREY, "You can't use Danh sach nha right now.");
			if(PlayerInfo[playerid][pJailTime] > 0) return SendClientMessageEx(playerid, COLOR_GREY, "You can't use Danh sach nha while in jail.");
			if(PlayerInfo[playerid][pLevel] < 3) return SendClientMessageEx(playerid, COLOR_GREY, "Ban phai co it nhat cap do 3 de su dung danh sach nha.");
			if(HouseInfo[HouseMarketTracking[playerid]][hOwned] == 0 || HouseInfo[HouseMarketTracking[playerid]][Listed] == 0 || HouseInfo[HouseMarketTracking[playerid]][PendingApproval] == 1)
			{
				SendClientMessageEx(playerid, COLOR_GREY, "Nha duoc chi dinh hien khong duoc ban.");
				cmd_houselistings(playerid, "");
				return 1;
			}
			switch(response)
			{
				case false: return ShowListingInformation(playerid, HouseMarketTracking[playerid], DIALOG_SELECTEDLISTING);
				case true:
				{
					switch(listitem)
					{
						case 0:
						{
							if(GetPlayerSQLId(playerid) == HouseInfo[HouseMarketTracking[playerid]][hOwnerID])
							{
								SendClientMessageEx(playerid, COLOR_GREY, "Ban khong the den tham nha rieng cua ban thong qua danh sach nha, dung (/home).");
								ShowPlayerDialogEx(playerid, DIALOG_LISTINGOPTIONS, DIALOG_STYLE_LIST, "Danh sach nha", "Xem nha\nMua nha", "Okay", "Cancel");
								return 1;
							}
							if(HouseInfo[HouseMarketTracking[playerid]][hExtIW] != 0 || HouseInfo[HouseMarketTracking[playerid]][hExtVW] != 0)
							{
								SendClientMessageEx(playerid, COLOR_GREY, "Diem vao ngoi nha da duoc chi dinh khong nam ngoai. Lien he voi chu so huu de xem nha.");
								ShowPlayerDialogEx(playerid, DIALOG_LISTINGOPTIONS, DIALOG_STYLE_LIST, "Danh sach nha", "Xem nha\nMua nha", "Okay", "Cancel");
								return 1;
							}
							DisablePlayerCheckpoint(playerid);
							SetPlayerCheckpoint(playerid, HouseInfo[HouseMarketTracking[playerid]][hExteriorX], HouseInfo[HouseMarketTracking[playerid]][hExteriorY], HouseInfo[HouseMarketTracking[playerid]][hExteriorZ], 4.0);
							gPlayerCheckpointStatus[playerid] = CHECKPOINT_HOME;
							hInviteHouse[playerid] = HouseMarketTracking[playerid];
							SendClientMessageEx(playerid, COLOR_WHITE, "Mot diem kiem tra da duoc dat cho ngoi nha chi dinh.");
							return 1;
						}
						case 1:
						{
							if(GetPlayerSQLId(playerid) == HouseInfo[HouseMarketTracking[playerid]][hOwnerID])
							{
								SendClientMessageEx(playerid, COLOR_GREY, "Ban khong the mua nha rieng cua ban.");
								ShowPlayerDialogEx(playerid, DIALOG_LISTINGOPTIONS, DIALOG_STYLE_LIST, "Danh sach nha", "Xem nha\nMua nha", "Okay", "Cancel");
								return 1;
							}
							if(Homes[playerid] >= MAX_OWNABLE_HOUSES)
							{
								SendClientMessageEx(playerid, COLOR_GREY, "Ban khong the so huu bat ky ngoi nha nao nua.");
								ShowPlayerDialogEx(playerid, DIALOG_LISTINGOPTIONS, DIALOG_STYLE_LIST, "Danh sach nha", "Xem nha\nMua nha", "Okay", "Cancel");
								return 1;
							}
							if(GetPlayerCash(playerid) < HouseInfo[HouseMarketTracking[playerid]][ListingPrice])
							{
								format(string, sizeof(string), "Ban khong co du $%s tien nha.", number_format(HouseInfo[HouseMarketTracking[playerid]][ListingPrice]));
								SendClientMessageEx(playerid, COLOR_GREY, string);
								ShowPlayerDialogEx(playerid, DIALOG_LISTINGOPTIONS, DIALOG_STYLE_LIST, "Danh sach nha", "Xem nha\nMua nha", "Okay", "Cancel");
								return 1;
							}
							new name[24], bool:online;
							foreach(new i : Player) 
							{
								if(gPlayerLogged{i} == 1 && HouseInfo[HouseMarketTracking[playerid]][hOwnerID] == GetPlayerSQLId(i))
								{
									GivePlayerCashEx(i, TYPE_BANK, HouseInfo[HouseMarketTracking[playerid]][ListingPrice]);
									format(string, sizeof(string), "%s mua nha cua ban (nha ID: %d) gia $%s.", GetPlayerNameEx(playerid), HouseMarketTracking[playerid], number_format(HouseInfo[HouseMarketTracking[playerid]][ListingPrice]));
									SendClientMessageEx(i, COLOR_GREEN, string);
									online = true;
									break;
								}
							}
							if(online == false)
							{
								szMiscArray[0] = 0;
								mysql_escape_string(HouseInfo[HouseMarketTracking[playerid]][hOwnerName], name);
								mysql_format(MainPipeline, szMiscArray, sizeof(szMiscArray), "UPDATE `accounts` SET `Bank`=`Bank`+%d WHERE `Username`='%s'", HouseInfo[HouseMarketTracking[playerid]][ListingPrice], name);
								mysql_tquery(MainPipeline, szMiscArray, "", "i", playerid);
								format(string, sizeof(string), "Toi da mua nha cua ban (ID: %d) gia $%s.", HouseMarketTracking[playerid], number_format(HouseInfo[HouseMarketTracking[playerid]][ListingPrice]));
								mysql_format(MainPipeline, szMiscArray, sizeof(szMiscArray), "INSERT INTO `letters` (`Sender_Id`, `Receiver_Id`, `Date`, `Message`, `Delivery_Min`, `Notify`) VALUES (%d, %d, NOW(), '%e', 0, 1)", GetPlayerSQLId(playerid), HouseInfo[HouseMarketTracking[playerid]][hOwnerID], string);
								mysql_tquery(MainPipeline, szMiscArray, "OnQueryFinish", "ii", SENDDATA_THREAD, playerid);
								
							}
							format(string, sizeof(string), "Ban da mua nha ID %d gia $%s.", HouseMarketTracking[playerid], number_format(HouseInfo[HouseMarketTracking[playerid]][ListingPrice]));
							SendClientMessageEx(playerid, COLOR_GREEN, string);
							Homes[playerid] ++;
							GivePlayerCashEx(playerid, TYPE_ONHAND, -HouseInfo[HouseMarketTracking[playerid]][ListingPrice]);
							for(new i = 0; i < 5; i ++)
							{
								if(i < 2)
								{
									if(HouseInfo[HouseMarketTracking[playerid]][LinkedGarage][i] != 0 && HouseInfo[HouseMarketTracking[playerid]][hOwnerID] == GarageInfo[HouseInfo[HouseMarketTracking[playerid]][LinkedGarage][i]][gar_Owner])
									{
										strcpy(GarageInfo[HouseInfo[HouseMarketTracking[playerid]][LinkedGarage][i]][gar_OwnerName], GetPlayerNameEx(playerid), MAX_PLAYER_NAME);
										GarageInfo[HouseInfo[HouseMarketTracking[playerid]][LinkedGarage][i]][gar_Owner] = GetPlayerSQLId(playerid);
										CreateGarage(HouseInfo[HouseMarketTracking[playerid]][LinkedGarage][i]);
										SaveGarage(HouseInfo[HouseMarketTracking[playerid]][LinkedGarage][i]);
									}
								}
								if(HouseInfo[HouseMarketTracking[playerid]][LinkedDoor][i] != 0 && HouseInfo[HouseMarketTracking[playerid]][hOwnerID] == DDoorsInfo[HouseInfo[HouseMarketTracking[playerid]][LinkedDoor][i]][ddOwner])
								{
									strcpy(DDoorsInfo[HouseInfo[HouseMarketTracking[playerid]][LinkedDoor][i]][ddOwnerName], GetPlayerNameEx(playerid), MAX_PLAYER_NAME);
									DDoorsInfo[HouseInfo[HouseMarketTracking[playerid]][LinkedDoor][i]][ddOwner] = GetPlayerSQLId(playerid);
									DestroyDynamicPickup(DDoorsInfo[HouseInfo[HouseMarketTracking[playerid]][LinkedDoor][i]][ddPickupID]);
									if(IsValidDynamic3DTextLabel(DDoorsInfo[HouseInfo[HouseMarketTracking[playerid]][LinkedDoor][i]][ddTextID])) DestroyDynamic3DTextLabel(DDoorsInfo[HouseInfo[HouseMarketTracking[playerid]][LinkedDoor][i]][ddTextID]);
									CreateDynamicDoor(HouseInfo[HouseMarketTracking[playerid]][LinkedDoor][i]);
									SaveDynamicDoor(HouseInfo[HouseMarketTracking[playerid]][LinkedDoor][i]);
								}
							}
							if(PlayerInfo[playerid][pPhousekey] == INVALID_HOUSE_ID) PlayerInfo[playerid][pPhousekey] = HouseMarketTracking[playerid];
							else PlayerInfo[playerid][pPhousekey2] = HouseMarketTracking[playerid];
							HouseInfo[HouseMarketTracking[playerid]][hOwnerID] = GetPlayerSQLId(playerid);
							strcpy(HouseInfo[HouseMarketTracking[playerid]][hOwnerName], GetPlayerNameEx(playerid), MAX_PLAYER_NAME);
							ReloadHouseText(HouseMarketTracking[playerid]);
							ClearHouseSaleVariables(HouseMarketTracking[playerid]);
							return 1;
						}
					}
				}
			}
			return 1;
		}
	}
	return 0;
}