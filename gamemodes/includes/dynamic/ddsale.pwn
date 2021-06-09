#include <YSI\y_hooks>

ClearDoorSaleVariables(playerid)
{
	stop DDSaleTimer[playerid];
	DDSalePendingAdmin[playerid] = false;
	DDSalePendingPlayer[playerid] = false;
	DDSaleTarget[playerid] = INVALID_PLAYER_ID;
	DDSalePrice[playerid] = 0;
	DDSaleTracking[playerid] = 0;
	for(new i = 0; i < sizeof(DDSaleDoors[]); i ++) DDSaleDoors[playerid][i] = 0;
	return 1;
}

CalculatePercentage(source, percentage, minimum)
{
	new amount;
	amount = percentage * source / 100;
	if(amount < minimum) amount = minimum;
	return amount;
}

ReturnDoorLineDetails(playerid, doorid)
{
	new string[32];
	string = "N/A";
	if(doorid != 0 && GetPlayerSQLId(playerid) == DDoorsInfo[doorid][ddOwner]) format(string, sizeof(string), "%d (%s)", doorid, DDoorsInfo[doorid][ddDescription]);
	return string;
}

ShowDynamicDoorDialog(playerid)
{
	if(!IsPlayerConnected(DDSaleTarget[playerid]) || DDSaleTarget[playerid] == INVALID_PLAYER_ID)
	{
		SendClientMessageEx(playerid, COLOR_GREY, "Nguoi mua duoc chi dinh khong ket noi.");
		ClearDoorSaleVariables(playerid);
		return 1;
	}
	if(DDSalePendingPlayer[playerid] == true) return SendClientMessageEx(playerid, COLOR_GREY, "Ban Door cua ban dang cho phe duyet tu nguoi mua duoc chi dinh.");
	if(DDSalePendingAdmin[playerid] == true) return SendClientMessageEx(playerid, COLOR_GREY, "Ban Door cua ban dang cho phe duyet tu Administrator Server.");
	szMiscArray[0] = 0;
	format(szMiscArray, sizeof(szMiscArray), "Cai dat\tGia tri\nNguoi mua\t%s\nGia ban\t$%s\nPhi ban\t$%s\nDoor 1\t%s\nDoor 2\t%s\nDoor 3\t%s\nDoor 4\t%s\nDoor 5\t%s\nGarage 1\t%s\nGarage 2\t%s\nHoan thien va gui", 
	GetPlayerNameEx(DDSaleTarget[playerid]), number_format(DDSalePrice[playerid]), number_format(CalculatePercentage(DDSalePrice[playerid], 10, 1000000)),
	ReturnDoorLineDetails(playerid, DDSaleDoors[playerid][0]), ReturnDoorLineDetails(playerid, DDSaleDoors[playerid][1]), ReturnDoorLineDetails(playerid, DDSaleDoors[playerid][2]), 
	ReturnDoorLineDetails(playerid, DDSaleDoors[playerid][3]), ReturnDoorLineDetails(playerid, DDSaleDoors[playerid][4]), ReturnGarageLineDetails(playerid, DDSaleDoors[playerid][5]), ReturnGarageLineDetails(playerid, DDSaleDoors[playerid][6]));
	ShowPlayerDialogEx(playerid, DIALOG_DDSALEMAIN, DIALOG_STYLE_TABLIST_HEADERS, "Ban Door", szMiscArray, "Hoan tat", "Huy bo");
	return 1;
}

task DynamicDoorSellRequests[60000]()
{
	new bool:notification;
	foreach(new i : Player)
	{
		if(gPlayerLogged{i} == 1 && DDSalePendingAdmin[i] == true)
		{
			notification = true;
			break;
		}
	}
	if(notification == true)
	{
		ABroadCast(COLOR_LIGHTRED, "Mot hoac nhieu yeu cau ban Door dang cho xem xet.", 4, true);
		return 1;
	}
	return 1;
}

timer DDSaleTimerEx[30000](playerid)
{
	if(IsPlayerConnected(playerid) && !IsPlayerNPC(playerid) && playerid != INVALID_PLAYER_ID)
	{
		new string[128];
		format(string, sizeof(string), "De nghi Door cua ban (Nguoi mua: %s) da het han.", GetPlayerNameEx(DDSaleTarget[playerid]));
		SendClientMessageEx(playerid, COLOR_GREY, string);
		format(string, sizeof(string), "De nghi ban Door tu %s da het han.", GetPlayerNameEx(playerid));
		SendClientMessageEx(DDSaleTarget[playerid], COLOR_GREY, string);
		ClearDoorSaleVariables(playerid);
		return 1;
	}
	return 1;
}

CMD:ad(playerid, params[]) return cmd_approvedoorsale(playerid, params);
CMD:ds(playerid, params[]) return cmd_denydoorsale(playerid, params);

CMD:doorsalehelp(playerid, params[])
{
	SendClientMessageEx(playerid, COLOR_WHITE, "** LENH BAN DOOR **");
	SendClientMessageEx(playerid, COLOR_GREY, "» /selldoors [Part Of Name/ ID] - Cho phep ban ban Door cho mot nguoi choi duoc chi dinh voi gia da dat.");
	SendClientMessageEx(playerid, COLOR_GREY, "» /huybo door - Huy yeu cau ban Door cua ban (phai cho xem xet tu Administrator Server).");
	if(PlayerInfo[playerid][pAdmin] >= 4 || PlayerInfo[playerid][pASM] >= 1)
	{
		SendClientMessageEx(playerid, COLOR_GREY, "» {EE9A4D}SENIOR ADMIN{D8D8D8} /doorrequests - View the list of current door requests pending review from administration.");
		SendClientMessageEx(playerid, COLOR_GREY, "» {EE9A4D}SENIOR ADMIN{D8D8D8} /doorsaleinfo - View detailed information on a door sale request.");
		SendClientMessageEx(playerid, COLOR_GREY, "» {EE9A4D}SENIOR ADMIN{D8D8D8} /(a)pprove(d)oorsale [Part Of Name/ ID] - Approve a specified player's door sale.");
		SendClientMessageEx(playerid, COLOR_GREY, "» {EE9A4D}SENIOR ADMIN{D8D8D8} /(d)enydoor(s)ale [Part Of Name/ ID] - Deny a specified player's door sale.");
		return 1;
	}
	return 1;
}

CMD:selldoors(playerid, params[])
{
	if(gPlayerLogged{playerid} == 0) return SendClientMessageEx(playerid, COLOR_GREY, "Ban chua dang nhap vao tai khoan cua ban.");
	if(GetPVarType(playerid, "Injured")) return SendClientMessageEx(playerid, COLOR_GREY, "Ban khong the ban Door trong khi bi thuong.");
	if(PlayerCuffed[playerid] != 0) return SendClientMessageEx(playerid, COLOR_GREY, "Ban khong the ban Door trong khi bi cong.");
	if(PlayerInfo[playerid][pJailTime] > 0) return SendClientMessageEx(playerid, COLOR_GREY, "Ban khong the ban Door trong khi o tu.");
	new target;
	if(sscanf(params, "u", target)) return SendClientMessageEx(playerid, COLOR_GREY, "[USAGE]: /selldoors [Part Of Name/ ID]");
	if(!IsPlayerConnected(target)) return SendClientMessageEx(playerid, COLOR_GREY, "Chi dinh nguoi choi khong ket noi.");
	if(target == playerid) return SendClientMessageEx(playerid, COLOR_GREY, "Ban khong the ban Door chinh ban.");
	if(GetPlayerCash(playerid) < 1000000) return SendClientMessageEx(playerid, COLOR_GREY, "Ban khong du $1,000,000 tien phat.");
	if(gPlayerLogged{target} == 0) return SendClientMessageEx(playerid, COLOR_GREY, "Nguoi choi duoc chi dinh khong dang nhap vao tai khoan cua ho.");
	if(DDSalePendingPlayer[playerid] == true || DDSalePendingAdmin[playerid] == true) return SendClientMessageEx(playerid, COLOR_GREY, "Ban co mot de nghi ban Door hien co, dung (/huybo door) de huy bo.");
	foreach(new i : Player) if(DDSaleTarget[i] == target) return SendClientMessageEx(playerid, COLOR_GREY, "Nguoi choi khac da cung cap cho nguoi choi ban chi dinh mua Door.");
	ClearDoorSaleVariables(playerid);
	DDSaleTarget[playerid] = target;
	ShowDynamicDoorDialog(playerid);
	return 1;
}

CMD:doorrequests(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] < 4 && PlayerInfo[playerid][pASM] < 1) return SendClientMessageEx(playerid, COLOR_GREY, "Ban khong duoc phep su dung lenh nay.");
	new count, string[64];
	SendClientMessageEx(playerid, COLOR_WHITE, "** DOOR SALE REQUESTS PENDING APPROVAL: **");
	foreach(new i : Player)
	{
		if(gPlayerLogged{i} == 1 && DDSalePendingAdmin[i] == true)
		{
			format(string, sizeof(string), "(ID: %d) %s", i, GetPlayerNameEx(i));
			SendClientMessageEx(playerid, COLOR_GREY, string);
			count ++;
		}
	}
	if(count == 0) return SendClientMessageEx(playerid, COLOR_GREY, "There are not currently any door sale requests approval.");
	return 1;
}

CMD:doorsaleinfo(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] < 4 && PlayerInfo[playerid][pASM] < 1) return SendClientMessageEx(playerid, COLOR_GREY, "Ban khong duoc phep su dung lenh nay.");
	new target;
	if(sscanf(params, "u", target)) return SendClientMessageEx(playerid, COLOR_GREY, "[USAGE]: /doorsaleinfo [Part Of Name/ ID]");
	if(!IsPlayerConnected(target)) return SendClientMessageEx(playerid, COLOR_GREY, "The specified player isn't connected.");
	if(gPlayerLogged{target} == 0) return SendClientMessageEx(playerid, COLOR_GREY, "The specified player isn't logged into their account.");
	if(DDSalePendingAdmin[target] == false) return SendClientMessageEx(playerid, COLOR_GREY, "The specified player does not have a pending door sale request.");
	szMiscArray[0] = 0;
	format(szMiscArray, sizeof(szMiscArray), "General Information:\n\n  » Seller: %s\n  » Buyer: %s\n  » Price: $%s\n  » Fine: $%s\n\nDoor(s):\n\n", GetPlayerNameEx(target), GetPlayerNameEx(DDSaleTarget[target]), number_format(DDSalePrice[target]), CalculatePercentage(DDSalePrice[target], 10, 1000000));
	for(new i = 0; i < sizeof(DDSaleDoors[]); i ++) if(DDSaleDoors[target][i] != 0 && GetPlayerSQLId(target) == DDoorsInfo[DDSaleDoors[target][i]][ddOwner]) format(szMiscArray, sizeof(szMiscArray), "%s\n  » Door ID: %d (%s)", szMiscArray, DDSaleDoors[target][i], DDoorsInfo[DDSaleDoors[target][i]][ddDescription]);
	ShowPlayerDialogEx(playerid, DIALOG_DDSALEINFO, DIALOG_STYLE_MSGBOX, "Door Sale Details", szMiscArray, "Okay", "Cancel");
	return 1;
}

CMD:approvedoorsale(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] < 4 && PlayerInfo[playerid][pASM] < 1) return SendClientMessageEx(playerid, COLOR_GREY, "Ban khong duoc phep su dung lenh nay.");
	new target, fine, count[2], timex[3], string[128];
	if(sscanf(params, "u", target)) return SendClientMessageEx(playerid, COLOR_GREY, "[USAGE]: /approvedoorsale [Part Of Name/ ID]");
	if(!IsPlayerConnected(target)) return SendClientMessageEx(playerid, COLOR_GREY, "The specified player isn't connected.");
	if(gPlayerLogged{target} == 0) return SendClientMessageEx(playerid, COLOR_GREY, "The specified player isn't logged into their account.");
	if(DDSalePendingAdmin[target] == false) return SendClientMessageEx(playerid, COLOR_GREY, "The specified player does not have a pending door sale request.");
	fine = CalculatePercentage(DDSalePrice[target], 10, 1000000);
	if(GetPlayerCash(DDSaleTarget[target]) < DDSalePrice[target])
	{
		format(string, sizeof(string), "You have approved %s's door sale request.", GetPlayerNameEx(target));
		SendClientMessageEx(playerid, COLOR_YELLOW, string);
		format(string, sizeof(string), "No transactions have been made however, as %s does not have the sufficient funds ($%s).", GetPlayerNameEx(DDSaleTarget[target]), number_format(DDSalePrice[target]));
		SendClientMessageEx(playerid, COLOR_GREY, string);
		format(string, sizeof(string), "%s has approved your door sale request.", GetPlayerNameEx(playerid));
		SendClientMessageEx(target, COLOR_GREEN, string);
		format(string, sizeof(string), "No transactions have been made however, as %s does not have the sufficient funds ($%s).", GetPlayerNameEx(DDSaleTarget[target]), number_format(DDSalePrice[target]));
		SendClientMessageEx(target, COLOR_GREY, string);
		format(string, sizeof(string), "%s has approved %s's door sale request.", GetPlayerNameEx(playerid), GetPlayerNameEx(target));
		SendClientMessageEx(DDSaleTarget[target], COLOR_GREEN, string);
		format(string, sizeof(string), "No transactions have been made however, as you do not have the sufficient funds ($%s).", number_format(DDSalePrice[target]));
		SendClientMessageEx(DDSaleTarget[target], COLOR_GREY, string);
		ClearDoorSaleVariables(target);
		PlayerInfo[playerid][pAcceptReport] ++;
		ReportCount[playerid] ++;
		ReportHourCount[playerid] ++;
		format(string, sizeof(string), "AdmCmd: %s approved %s's door sale request (sale failed).", GetPlayerNameEx(playerid), GetPlayerNameEx(target));
		ABroadCast(COLOR_LIGHTRED, string, 4);
		Log("logs/admin.log", string);
		return 1;
	}
	else if(GetPlayerCash(target) < fine)
	{
		format(string, sizeof(string), "You have approved %s's door sale request.", GetPlayerNameEx(target));
		SendClientMessageEx(playerid, COLOR_YELLOW, string);
		format(string, sizeof(string), "No transactions have been made however, as %s does not have the sufficient funds for the fine ($%s).", GetPlayerNameEx(target), number_format(fine));
		SendClientMessageEx(playerid, COLOR_GREY, string);
		format(string, sizeof(string), "%s has approved your door sale request.", GetPlayerNameEx(playerid));
		SendClientMessageEx(target, COLOR_GREEN, string);
		format(string, sizeof(string), "No transactions have been made however, as you does not have the sufficient funds for the fine ($%s).", number_format(fine));
		SendClientMessageEx(target, COLOR_GREY, string);
		format(string, sizeof(string), "%s has approved %s's door sale request.", GetPlayerNameEx(playerid), GetPlayerNameEx(target));
		SendClientMessageEx(DDSaleTarget[target], COLOR_GREEN, string);
		format(string, sizeof(string), "No transactions have been made however, as %s does not have the sufficient funds for the fine ($%s).", GetPlayerNameEx(target), number_format(fine));
		SendClientMessageEx(DDSaleTarget[target], COLOR_GREY, string);
		PlayerInfo[playerid][pAcceptReport] ++;
		ReportCount[playerid] ++;
		ReportHourCount[playerid] ++;
		format(string, sizeof(string), "AdmCmd: %s approved %s's door sale request (sale failed).", GetPlayerNameEx(playerid), GetPlayerNameEx(target));
		ABroadCast(COLOR_LIGHTRED, string, 4);
		Log("logs/admin.log", string);
		ClearDoorSaleVariables(target);
		return 1;
	}
	else if(GetPlayerCash(DDSaleTarget[target]) >= DDSalePrice[target])
	{
		szMiscArray[0] = 0;
		gettime(timex[0], timex[1], timex[2]);
		format(string, sizeof(string), "You have approved %s's door sale request.", GetPlayerNameEx(target));
		SendClientMessageEx(playerid, COLOR_YELLOW, string);
		format(string, sizeof(string), "%s has approved your door sale request ($%s).", GetPlayerNameEx(playerid), number_format(DDSalePrice[target]));
		SendClientMessageEx(target, COLOR_GREEN, string);
		format(string, sizeof(string), "%s has approved %s's door sale request ($%s).", GetPlayerNameEx(playerid), GetPlayerNameEx(target), number_format(DDSalePrice[target]));
		SendClientMessageEx(DDSaleTarget[target], COLOR_GREEN, string);
		GivePlayerCashEx(target, TYPE_ONHAND, DDSalePrice[target]);
		GivePlayerCashEx(target, TYPE_ONHAND, -fine);
		GivePlayerCashEx(DDSaleTarget[target], TYPE_ONHAND, -DDSalePrice[target]);
		format(szMiscArray, sizeof(szMiscArray), "General Transaction Information:\n\n  » Seller: %s\n  » Buyer: %s\n  » Price: $%s\n  » Seller Fine: $%s\n  » Date: %s (%02d:%02d:%02d)\n\nDoors:\n", 
		GetPlayerNameEx(target), GetPlayerNameEx(DDSaleTarget[target]), number_format(DDSalePrice[target]), number_format(fine), date(gettime(), 4), timex[0], timex[1], timex[2]);
		for(new i = 0; i < sizeof(DDSaleDoors[]) - 2; i ++) 
		{
			if(DDSaleDoors[target][i] != 0 && GetPlayerSQLId(target) == DDoorsInfo[DDSaleDoors[target][i]][ddOwner])
			{
				format(szMiscArray, sizeof(szMiscArray), "%s\n  » Door ID: %d (%s)", szMiscArray, DDSaleDoors[target][i], DDoorsInfo[DDSaleDoors[target][i]][ddDescription]);
				strcpy(DDoorsInfo[DDSaleDoors[target][i]][ddOwnerName], GetPlayerNameEx(DDSaleTarget[target]), MAX_PLAYER_NAME);
				DDoorsInfo[DDSaleDoors[target][i]][ddOwner] = GetPlayerSQLId(DDSaleTarget[target]);
				DestroyDynamicPickup(DDoorsInfo[DDSaleDoors[target][i]][ddPickupID]);
				if(IsValidDynamic3DTextLabel(DDoorsInfo[DDSaleDoors[target][i]][ddTextID])) DestroyDynamic3DTextLabel(DDoorsInfo[DDSaleDoors[target][i]][ddTextID]);
				CreateDynamicDoor(DDSaleDoors[target][i]);
				SaveDynamicDoor(DDSaleDoors[target][i]);
				count[0] ++;
			}
		}
		if(count[0] == 0) strcat(szMiscArray, "\n  » None");
		strcat(szMiscArray, "\n\nGarages:\n");
		for(new i = sizeof(DDSaleDoors[]) - 2; i < sizeof(DDSaleDoors[]); i ++)
		{
			if(DDSaleDoors[target][i] != 0 && GetPlayerSQLId(target) == GarageInfo[DDSaleDoors[target][i]][gar_Owner])
			{
				format(szMiscArray, sizeof(szMiscArray), "%s\n  » Garage ID: %d", szMiscArray, DDSaleDoors[target][i]);
				strcpy(GarageInfo[DDSaleDoors[target][i]][gar_OwnerName], GetPlayerNameEx(DDSaleTarget[target]), MAX_PLAYER_NAME);
				GarageInfo[DDSaleDoors[target][i]][gar_Owner] = GetPlayerSQLId(DDSaleTarget[target]);
				CreateGarage(DDSaleDoors[target][i]);
				SaveGarage(DDSaleDoors[target][i]);
				count[1] ++;
			}
		}
		if(count[1] == 0) strcat(szMiscArray, "\n  » None");
		strcat(szMiscArray, "\n\nPress (F8) to take a screen-shot of this receipt for future reference.");
		ShowPlayerDialogEx(target, DIALOG_DDSALERECIEPT, DIALOG_STYLE_MSGBOX, "Door Sale Receipt", szMiscArray, "Okay", "Cancel");
		ShowPlayerDialogEx(DDSaleTarget[target], DIALOG_DDSALERECIEPT, DIALOG_STYLE_MSGBOX, "Door Sale Receipt", szMiscArray, "Okay", "Cancel");
		PlayerInfo[playerid][pAcceptReport] ++;
		ReportCount[playerid] ++;
		ReportHourCount[playerid] ++;
		format(string, sizeof(string), "AdmCmd: DDSale: Auth: %s DD sale (Seller:%s) (DD:%d) (F:$%s) (P:$%s) (TO: (%s)).", GetPlayerNameEx(playerid), GetPlayerNameEx(target), DDSaleTracking[target], number_format(fine), number_format(DDSalePrice[target]), GetPlayerNameEx(DDSaleTarget[target]));
		ABroadCast(COLOR_LIGHTRED, string, 4);
		Log("logs/admin.log", string);
		ClearDoorSaleVariables(target);
		return 1;
	}
	return 1;
}

CMD:denydoorsale(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] < 4 && PlayerInfo[playerid][pASM] < 1) return SendClientMessageEx(playerid, COLOR_GREY, "Ban khong duoc phep su dung lenh nay.");
	new target, reason[64], string[128];
	if(sscanf(params, "us[64]", target, reason)) return SendClientMessageEx(playerid, COLOR_GREY, "[USAGE]: /denydoorsale [Part Of Name/ ID] [Reason]");
	if(!IsPlayerConnected(target)) return SendClientMessageEx(playerid, COLOR_GREY, "The specified player isn't connected.");
	if(gPlayerLogged{target} == 0) return SendClientMessageEx(playerid, COLOR_GREY, "The specified player isn't logged into their account.");
	if(DDSalePendingAdmin[target] == false) return SendClientMessageEx(playerid, COLOR_GREY, "The specified player does not have a pending door sale request.");
	if(strlen(reason) < 3 || strlen(reason) > 60) return SendClientMessageEx(playerid, COLOR_GREY, "The specified reason cannot be under 3 characters or over 60 characters.");
	ClearDoorSaleVariables(target);
	format(string, sizeof(string), "Ban da tu choi %s's yeu cau ban Door, ly do: %s.", GetPlayerNameEx(target), reason);
	SendClientMessageEx(playerid, COLOR_YELLOW, string);
	format(string, sizeof(string), "%s da tu choi yeu cau ban Door cua ban, ly do: %s.", GetPlayerNameEx(playerid), reason);
	SendClientMessageEx(target, COLOR_LIGHTRED, string);
	PlayerInfo[playerid][pTrashReport] ++;
	format(string, sizeof(string), "AdmCmd: %s tu choi %s's yeu cau ban Door, ly do: %s.", GetPlayerNameEx(playerid), GetPlayerNameEx(target), reason);
	ABroadCast(COLOR_LIGHTRED, string, 4);
	Log("logs/admin.log", string);
	return 1;
}

hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[]) {

	if(arrAntiCheat[playerid][ac_iFlags][AC_DIALOGSPOOFING] > 0) return 1;
	new string[128];
	switch(dialogid)
	{
		case DIALOG_DDSALEMAIN:
		{
			switch(response)
			{
				case false: return ClearDoorSaleVariables(playerid);
				case true:
				{
					if(!IsPlayerConnected(DDSaleTarget[playerid]) || DDSaleTarget[playerid] == INVALID_PLAYER_ID)
					{
						SendClientMessageEx(playerid, COLOR_GREY, "Nguoi chi dinh khong ket noi.");
						ClearDoorSaleVariables(playerid);
						return 1;
					}
					if(DDSalePendingPlayer[playerid] == true) return SendClientMessageEx(playerid, COLOR_GREY, "Ban Door cua ban dang cho phe duyet	tu nguoi mua duoc chi dinh.");
					if(DDSalePendingAdmin[playerid] == true) return SendClientMessageEx(playerid, COLOR_GREY, "Ban Door cua ban dang cho phe duyet tu Administrator Server.");
					switch(listitem)
					{
						case 0:
						{
							ShowDynamicDoorDialog(playerid);
							SendClientMessageEx(playerid, COLOR_GREY, "De sua doi nguoi mua Door(s) cua ban, thoat khoi Dialog va su dung lai lenh.");
							return 1;
						}
						case 1: return ShowPlayerDialogEx(playerid, DIALOG_DDSALEPRICE, DIALOG_STYLE_INPUT, "Ban Door", "Nhap tong gia ban duoi day.", "Okay", "Cancel");
						case 2: 
						{
							SendClientMessageEx(playerid, COLOR_GREY, "Tien phat cua nguoi ban duoc tu dong xac dinh boi tong gia ban. No khong the sua doi.");
							ShowDynamicDoorDialog(playerid);
							return 1;
						}
						case 3..7:
						{
							DDSaleTracking[playerid] = (listitem - 3);
							ShowPlayerDialogEx(playerid, DIALOG_DDSALELINK, DIALOG_STYLE_INPUT, "Ban Door", "Nhap ID ben duoi Door ma ban muon ban. Nhap \"0\" de xoa Door.", "Okay", "Cancel");
							return 1;
						}
						case 8, 9:
						{
							DDSaleTracking[playerid] = (listitem - 8);
							ShowPlayerDialogEx(playerid, DIALOG_GARAGESALELINK, DIALOG_STYLE_INPUT, "Ban Door", "Nhap ID ben duoi Garage ma ban muon ban. Nhap \"0\" de xoa Garage.", "Okay", "Cancel");
							return 1;
						}
						case 10:
						{
							if(DDSalePrice[playerid] < 1 || DDSalePrice[playerid] > 1000000000)
							{
								SendClientMessageEx(playerid, COLOR_GREY, "Ban phai chi dinh gia tien tren $1 va duoi $1,000,000,000.");
								ShowDynamicDoorDialog(playerid);
								return 1;
							}
							new fine, bool:linked;
							for(new i = 0; i < sizeof(DDSaleDoors[]); i ++)
							{
								if(DDSaleDoors[playerid][i] != 0)
								{
									if(GetPlayerSQLId(playerid) == DDoorsInfo[DDSaleDoors[playerid][i]][ddOwner] && linked == false) linked = true;
									else if(GetPlayerSQLId(playerid) != DDoorsInfo[DDSaleDoors[playerid][i]][ddOwner]) DDSaleDoors[playerid][i] = 0;
								}
							}
							if(linked == false)
							{
								SendClientMessageEx(playerid, COLOR_GREY, "Ban phai chon toi thieu 1 Door cua ban de ban.");
								ShowDynamicDoorDialog(playerid);
								return 1;
							}
							fine = CalculatePercentage(DDSalePrice[playerid], 10, 1000000);
							if(GetPlayerCash(playerid) < fine)
							{
								format(string, sizeof(string), "Ban khong co du tien cho viec chuyen tien phat ($%s).", number_format(fine));
								SendClientMessageEx(playerid, COLOR_GREY, string);
								return 1;
							}
							format(string, sizeof(string), "Ban da gui yeu cau ban Door cua ban den %s gia $%s.", GetPlayerNameEx(DDSaleTarget[playerid]), number_format(DDSalePrice[playerid]));
							SendClientMessageEx(playerid, COLOR_CYAN, string);
							SendClientMessageEx(playerid, COLOR_GREY, "De huy bo yeu cau ban Door cua ban, dung (/huybo door).");
							format(string, sizeof(string), "** DE NGHI BAN DOOR MOI TU %s: **", GetPlayerNameEx(playerid));
							SendClientMessageEx(DDSaleTarget[playerid], COLOR_CYAN, string);
							format(string, sizeof(string), "» (Gia tien): $%s", number_format(DDSalePrice[playerid]));
							SendClientMessageEx(DDSaleTarget[playerid], COLOR_WHITE, string);
							for(new i = 0; i < sizeof(DDSaleDoors[]); i ++)
							{
								if(DDSaleDoors[playerid][i] != 0 && GetPlayerSQLId(playerid) == DDoorsInfo[DDSaleDoors[playerid][i]][ddOwner])
								{
									format(string, sizeof(string), "» (Door ID %d): %s", DDSaleDoors[playerid][i], DDoorsInfo[DDSaleDoors[playerid][i]][ddDescription]);
									SendClientMessageEx(DDSaleTarget[playerid], COLOR_WHITE, string);
								}
							}
							SendClientMessageEx(DDSaleTarget[playerid], COLOR_CYAN, "Dung (/chapnhan door) chap nhan de nghi ban Door.");
							DDSalePendingPlayer[playerid] = true;
							DDSaleTimer[playerid] = defer DDSaleTimerEx(playerid);
							return 1;
						}
					}
					return 1;
				}
			}
			return 1;
		}
		case DIALOG_DDSALEPRICE:
		{
			switch(response)
			{
				case false: return ShowDynamicDoorDialog(playerid);
				case true:
				{
					if(!IsPlayerConnected(DDSaleTarget[playerid]) || DDSaleTarget[playerid] == INVALID_PLAYER_ID)
					{
						SendClientMessageEx(playerid, COLOR_GREY, "The specified buyer is no longer connected.");
						ClearDoorSaleVariables(playerid);
						return 1;
					}
					if(DDSalePendingPlayer[playerid] == true) return SendClientMessageEx(playerid, COLOR_GREY, "Ban cua Door cua ban dang cho phe duyet tu nguoi mua chi dinh.");
					if(DDSalePendingAdmin[playerid] == true) return SendClientMessageEx(playerid, COLOR_GREY, "Ban Door cua ban dang cho phe duyet tu Administrator Server.");
					new price, fine;
					if(sscanf(inputtext, "d", price))
					{
						SendClientMessageEx(playerid, COLOR_GREY, "Gia ban Door quy dinh phai bang so.");
						ShowPlayerDialogEx(playerid, DIALOG_DDSALEPRICE, DIALOG_STYLE_INPUT, "Ban Door", "Nhap tong gia ban duoi day.", "Okay", "Cancel");
						return 1;
					}
					if(price < 1 || price > 1000000000)
					{
						SendClientMessageEx(playerid, COLOR_GREY, "Gia ban Door quy dinh khong the duoi $1 hoac tren $1,000,000,000.");
						ShowPlayerDialogEx(playerid, DIALOG_DDSALEPRICE, DIALOG_STYLE_INPUT, "Ban Door", "Nhap tong gia ban duoi day.", "Okay", "Cancel");
						return 1;
					}
					if(GetPlayerCash(DDSaleTarget[playerid]) < price)
					{
						format(string, sizeof(string), "%s khong co du tien cho giao dich ($%s).", GetPlayerNameEx(DDSaleTarget[playerid]), number_format(price));
						SendClientMessageEx(playerid, COLOR_GREY, string);
						ShowPlayerDialogEx(playerid, DIALOG_DDSALEPRICE, DIALOG_STYLE_INPUT, "Ban Door", "Nhap tong gia ban duoi day.", "Okay", "Cancel");
						return 1;
					}
					fine = CalculatePercentage(price, 10, 1000000);
					if(GetPlayerCash(playerid) < fine)
					{
						format(string, sizeof(string), "Ban khong co du tien cho viec dong tien phat ($%s).", number_format(fine));
						SendClientMessageEx(playerid, COLOR_GREY, string);
						ShowPlayerDialogEx(playerid, DIALOG_DDSALEPRICE, DIALOG_STYLE_INPUT, "Ban Door", "Nhap tong gia ban duoi day.", "Okay", "Cancel");
						return 1;
					}
					DDSalePrice[playerid] = price;
					SendClientMessageEx(playerid, COLOR_GREEN, "Ban da cap nhat gia ban Door cua ban.");
					ShowDynamicDoorDialog(playerid);
					return 1;
				}
			}
			return 1;
		}
		case DIALOG_DDSALELINK:
		{
			switch(response)
			{
				case false: return ShowDynamicDoorDialog(playerid);
				case true:
				{
					if(!IsPlayerConnected(DDSaleTarget[playerid]) || DDSaleTarget[playerid] == INVALID_PLAYER_ID)
					{
						SendClientMessageEx(playerid, COLOR_GREY, "The specified buyer is no longer connected.");
						ClearDoorSaleVariables(playerid);
						return 1;
					}
					if(DDSalePendingPlayer[playerid] == true) return SendClientMessageEx(playerid, COLOR_GREY, "Ban cua Door cua ban dang cho phe duyet tu nguoi mua chi dinh.");
					if(DDSalePendingAdmin[playerid] == true) return SendClientMessageEx(playerid, COLOR_GREY, "Ban Door cua ban dang cho phe duyet tu Administrator Server.");
					new doorid;
					if(sscanf(inputtext, "d", doorid))
					{
						SendClientMessageEx(playerid, COLOR_GREY, "ID Door duoc chi dinh phai la so.");
						ShowPlayerDialogEx(playerid, DIALOG_DDSALELINK, DIALOG_STYLE_INPUT, "Ban Door", "Ban ID ben duoi Door ma ban muon ban. Nhap \"0\" de xoa Door.", "Okay", "Cancel");
						return 1;
					}
					if(doorid < 0 || doorid >= MAX_DDOORS)
					{
						SendClientMessageEx(playerid, COLOR_GREY, "ID Door chi dinh khong hop le.");
						ShowPlayerDialogEx(playerid, DIALOG_DDSALELINK, DIALOG_STYLE_INPUT, "Ban Door", "Ban ID ben duoi Door ma ban muon ban. Nhap \"0\" de xoa Door.", "Okay", "Cancel");
						return 1;
					}
					for(new i = 0; i < sizeof(DDSaleDoors[]); i ++)
					{
						if(DDSaleDoors[playerid][i] == doorid && doorid != 0)
						{
							SendClientMessageEx(playerid, COLOR_GREY, "Door duoc chi dinh dang co trong ban hang cua ban.");
							ShowPlayerDialogEx(playerid, DIALOG_DDSALELINK, DIALOG_STYLE_INPUT, "Ban Door", "Ban ID ben duoi Door ma ban muon ban. Nhap \"0\" de xoa Door.", "Okay", "Cancel");
							return 1;
						}
					}
					switch(doorid)
					{
						case 0:
						{
							if(DDSaleDoors[playerid][DDSaleTracking[playerid]] == 0)
							{
								SendClientMessageEx(playerid, COLOR_GREY, "Hien tai khong co Door trong slot duoc chi dinh.");
								ShowPlayerDialogEx(playerid, DIALOG_DDSALELINK, DIALOG_STYLE_INPUT, "Ban Door", "Ban ID ben duoi Door ma ban muon ban. Nhap \"0\" de xoa Door.", "Okay", "Cancel");
								return 1;
							}
							DDSaleDoors[playerid][DDSaleTracking[playerid]] = 0;
							SendClientMessageEx(playerid, COLOR_GREEN, "Ban da cap nhat/xoa (cac) Door duoc lien ket de ban hang cua ban.");
							ShowDynamicDoorDialog(playerid);
							return 1;
						}
						default:
						{
							if(DDoorsInfo[doorid][ddOwner] != GetPlayerSQLId(playerid))
							{
								SendClientMessageEx(playerid, COLOR_GREY, "Ban khong so huu Door duoc chi dinh.");
								ShowPlayerDialogEx(playerid, DIALOG_DDSALELINK, DIALOG_STYLE_INPUT, "Ban Door", "Ban ID ben duoi Door ma ban muon ban. Nhap \"0\" de xoa Door.", "Okay", "Cancel");
								return 1;
							}
							DDSaleDoors[playerid][DDSaleTracking[playerid]] = doorid;
							SendClientMessageEx(playerid, COLOR_GREEN, "Ban da cap nhat (cac) Door duoc lien ket de ban hang cua ban.");
							ShowDynamicDoorDialog(playerid);
							return 1;
						}
					}
					return 1;
				}
			}
			return 1;
		}
		case DIALOG_GARAGESALELINK:
		{
			switch(response)
			{
				case false: return ShowDynamicDoorDialog(playerid);
				case true:
				{
					if(!IsPlayerConnected(DDSaleTarget[playerid]) || DDSaleTarget[playerid] == INVALID_PLAYER_ID)
					{
						SendClientMessageEx(playerid, COLOR_GREY, "The specified buyer is no longer connected.");
						ClearDoorSaleVariables(playerid);
						return 1;
					}
					if(DDSalePendingPlayer[playerid] == true) return SendClientMessageEx(playerid, COLOR_GREY, "Ban cua Door cua ban dang cho phe duyet tu nguoi mua chi dinh.");
					if(DDSalePendingAdmin[playerid] == true) return SendClientMessageEx(playerid, COLOR_GREY, "Ban Door cua ban dang cho phe duyet tu Administrator Server.");
					new garageid;
					if(sscanf(inputtext, "d", garageid))
					{
						SendClientMessageEx(playerid, COLOR_GREY, "ID Garage duoc chi dinh phai bang so.");
						ShowPlayerDialogEx(playerid, DIALOG_GARAGESALELINK, DIALOG_STYLE_INPUT, "Ban Door", "Nhap ID ben duoi Garage ma ban muon ban. Nhap \"0\" de xoa Garage.", "Okay", "Cancel");
						return 1;
					}
					if(garageid < 0 || garageid >= MAX_GARAGES)
					{
						SendClientMessageEx(playerid, COLOR_GREY, "ID Garage chi dinh khong hop le.");
						ShowPlayerDialogEx(playerid, DIALOG_GARAGESALELINK, DIALOG_STYLE_INPUT, "Ban Door", "Nhap ID ben duoi Garage ma ban muon ban. Nhap \"0\" de xoa Garage.", "Okay", "Cancel");
						return 1;
					}
					if(garageid == 0)
					{
						DDSaleDoors[playerid][DDSaleTracking[playerid]] = 0;
						ShowDynamicDoorDialog(playerid);
						return 1;
					}
					for(new i = 0; i < sizeof(DDSaleDoors[]); i ++)
					{
						if(DDSaleDoors[playerid][i] == garageid && garageid != 0)
						{
							SendClientMessageEx(playerid, COLOR_GREY, "Garage duoc chi dinh duoc lien ket voi ban hang cua ban.");
							ShowPlayerDialogEx(playerid, DIALOG_GARAGESALELINK, DIALOG_STYLE_INPUT, "Ban Door", "Nhap ID ben duoi Garage ma ban muon ban. Nhap \"0\" de xoa Garage.", "Okay", "Cancel");
							return 1;
						}
					}
					switch(garageid)
					{
						case 0:
						{
							if(DDSaleDoors[playerid][DDSaleTracking[playerid]] == 0)
							{
								SendClientMessageEx(playerid, COLOR_GREY, "Ban hien khong co Garage duoc chi dinh de ban hang.");
								ShowPlayerDialogEx(playerid, DIALOG_GARAGESALELINK, DIALOG_STYLE_INPUT, "Ban Door", "Nhap ID ben duoi Garage ma ban muon ban. Nhap \"0\" de xoa Garage.", "Okay", "Cancel");
								return 1;
							}
							DDSaleDoors[playerid][DDSaleTracking[playerid]] = 0;
							SendClientMessageEx(playerid, COLOR_GREEN, "Ban da cap nhat/xoa (cac) Garage duoc lien ket de ban hang cua ban.");
							ShowDynamicDoorDialog(playerid);
							return 1;
						}
						default:
						{
							if(GarageInfo[garageid][gar_Owner] != GetPlayerSQLId(playerid))
							{
								SendClientMessageEx(playerid, COLOR_GREY, "Ban khong so huu Garage duoc chi dinh.");
								ShowPlayerDialogEx(playerid, DIALOG_GARAGESALELINK, DIALOG_STYLE_INPUT, "Ban Door", "Nhap ID ben duoi Garage ma ban muon ban. Nhap \"0\" de xoa Garage.", "Okay", "Cancel");
								return 1;
							}
							DDSaleDoors[playerid][DDSaleTracking[playerid]] = garageid;
							SendClientMessageEx(playerid, COLOR_GREEN, "Ban da cap nhat (cac) Garage lien ket de ban hang cua ban.");
							ShowDynamicDoorDialog(playerid);
							return 1;
						}
					}
					return 1;
				}
			}
			return 1;
		}
	}
	return 0;
}