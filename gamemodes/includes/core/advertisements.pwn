/*

	 /$$   /$$  /$$$$$$          /$$$$$$$  /$$$$$$$
	| $$$ | $$ /$$__  $$        | $$__  $$| $$__  $$
	| $$$$| $$| $$  \__/        | $$  \ $$| $$  \ $$
	| $$ $$ $$| $$ /$$$$ /$$$$$$| $$$$$$$/| $$$$$$$/
	| $$  $$$$| $$|_  $$|______/| $$__  $$| $$____/
	| $$\  $$$| $$  \ $$        | $$  \ $$| $$
	| $$ \  $$|  $$$$$$/        | $$  | $$| $$
	|__/  \__/ \______/         |__/  |__/|__/

					Advertisements System

				Next Generation Gaming, LLC
	(created by Next Generation Gaming Development Team)
					
	* Copyright (c) 2016, Next Generation Gaming, LLC
	*
	* All rights reserved.
	*
	* Redistribution and use in source and binary forms, with or without modification,
	* are not permitted in any case.
	*
	*
	* THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
	* "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
	* LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
	* A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR
	* CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
	* EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
	* PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
	* PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
	* LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
	* NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
	* SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

#include <YSI\y_hooks>

stock ShowAdMuteFine(playerid)
{
	new string[128];
	new playername[MAX_PLAYER_NAME];
	GetPlayerName(playerid, playername, sizeof(playername));

	new totalwealth = PlayerInfo[playerid][pAccount] + GetPlayerCash(playerid);
	if(PlayerInfo[playerid][pPhousekey] != INVALID_HOUSE_ID && HouseInfo[PlayerInfo[playerid][pPhousekey]][hOwnerID] == GetPlayerSQLId(playerid)) totalwealth += HouseInfo[PlayerInfo[playerid][pPhousekey]][hSafeMoney];
	if(PlayerInfo[playerid][pPhousekey2] != INVALID_HOUSE_ID && HouseInfo[PlayerInfo[playerid][pPhousekey2]][hOwnerID] == GetPlayerSQLId(playerid)) totalwealth += HouseInfo[PlayerInfo[playerid][pPhousekey2]][hSafeMoney];
	if(PlayerInfo[playerid][pPhousekey3] != INVALID_HOUSE_ID && HouseInfo[PlayerInfo[playerid][pPhousekey3]][hOwnerID] == GetPlayerSQLId(playerid)) totalwealth += HouseInfo[PlayerInfo[playerid][pPhousekey3]][hSafeMoney];

    new fine = 10*totalwealth/100;
	if(PlayerInfo[playerid][pADMuteTotal] < 4)
	{
		format(string,sizeof(string),"Phat tu %d Phut\nTien phat ($%d)",PlayerInfo[playerid][pADMuteTotal]*15,fine);
	}
	if(PlayerInfo[playerid][pADMuteTotal] == 4)
	{
	    format(string,sizeof(string),"O tu trong 1 gio");
	}
	if(PlayerInfo[playerid][pADMuteTotal] == 5)
	{
	    format(string,sizeof(string),"O tu trong 1 gio 15 phut");
	}
	if(PlayerInfo[playerid][pADMuteTotal] == 6)
	{
	    format(string,sizeof(string),"O tu trong 1 gio 30 phut");
	}
	ShowPlayerDialogEx(playerid,ADMUTE,DIALOG_STYLE_LIST,"Quang cao Bat tieng - Chon Hinh phat cua ban:",string,"Chon","Huy bo");
}


hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[]) {

	if(arrAntiCheat[playerid][ac_iFlags][AC_DIALOGSPOOFING] > 0) return 1;
	if(strfind(inputtext, "%", true) != -1)
	{
		SendClientMessage(playerid, COLOR_GREY, "Ky thu khong hop le, vui long thu lai.");
		return 1;
	}
	switch(dialogid)
	{
		case DIALOG_ADCATEGORY:
		{
			if(!response) return 1;
			szMiscArray[0] = 0;
			new szBuffer[32],
				arrAdverts[MAX_PLAYERS] = INVALID_PLAYER_ID,
				iDialogCount,
				iCount,
				iBreak,
				iRand;
			for(new x; x < 50; ++x) ListItemTrackId[playerid][x] = -1;
			foreach(new i : Player) if(!isnull(szAdvert[i])) arrAdverts[iCount++] = i;

			while(iDialogCount < 50 && iBreak < 500) {
				iRand = random(iCount);
				if(iCount && arrAdverts[iRand] != INVALID_PLAYER_ID) {
					if(AdvertType[arrAdverts[iRand]] == listitem+1)
					{
						strcpy(szBuffer, szAdvert[arrAdverts[iRand]], sizeof(szBuffer));
						if(PlayerInfo[playerid][pAdmin] <= 1) format(szMiscArray, sizeof(szMiscArray), "%s%s... (%i)\r\n", szMiscArray, szBuffer, PlayerInfo[arrAdverts[iRand]][pPnumber]);
						else format(szMiscArray, sizeof(szMiscArray), "%s%s... (%s)\r\n", szMiscArray, szBuffer, GetPlayerNameEx(arrAdverts[iRand]));
						ListItemTrackId[playerid][iDialogCount++] = arrAdverts[iRand];
						arrAdverts[iRand] = INVALID_PLAYER_ID;
					}
				}
				++iBreak;
			}
			if(!isnull(szMiscArray)) return ShowPlayerDialogEx(playerid, DIALOG_ADLIST, DIALOG_STYLE_LIST, "Danh sach - Quang cao", szMiscArray, "Lua chon", "Tro lai");
			ShowPlayerDialogEx(playerid, DIALOG_ADCATEGORY, DIALOG_STYLE_LIST, "Danh muc quang cao", "Bat dong san\nO to\nMua\nBan\nKhac", "Lua chon", "Huy bo");
			SendClientMessage(playerid, COLOR_GREY, "Khong co quang cao da duoc dang.");
		}
		case DIALOG_ADMAIN: if(response) switch(listitem) {
			case 0: ShowPlayerDialogEx(playerid, DIALOG_ADCATEGORY, DIALOG_STYLE_LIST, "Danh muc quang cao", "Bat dong san\nO to\nMua\nBan\nKhac", "Lua chon", "Huy bo");
			case 1: ShowPlayerDialogEx(playerid, DIALOG_ADSEARCH, DIALOG_STYLE_INPUT, "Tim kiem - Quang cao", "Nhap cum tu tim kiem.", "Tim kiem", "Tro lai");
			case 2: {
				if(PlayerInfo[playerid][pADMute] == 1) {
					SendClientMessageEx(playerid, COLOR_GREY, "You are muted from advertisements.");
				}
				else if(PlayerInfo[playerid][pPnumber] == 0) {
					SendClientMessageEx(playerid, COLOR_GRAD2, "Ban khong co dien thoai.");
				}
				else ShowPlayerDialogEx(playerid, DIALOG_ADCATEGORYPLACE, DIALOG_STYLE_LIST, "Chon mot danh muc", "Bat dong san\nO to\nMua\nBan\nKhac", "Lua chon", "Huy bo");
			}
			case 3: {
				if(PlayerInfo[playerid][pADMute] == 1) {
					SendClientMessageEx(playerid, COLOR_GREY, "Ban da bi cam khoi quang cao.");
				}
				else if(PlayerInfo[playerid][pPnumber] == 0) {
					SendClientMessageEx(playerid, COLOR_GRAD2, "Ban khong co dien thoai.");
				}
				else if(gettime() < GetPVarInt(playerid, "adT")) {
					ShowMainAdvertMenu(playerid);
					return SendClientMessageEx(playerid, COLOR_GREY, "Ban chi co the dat quang cao uu tien sau 2 phut moi lan.");
				}	
				else if(gettime() < iAdverTimer) {
					ShowMainAdvertMenu(playerid);
					return SendClientMessageEx(playerid, COLOR_GREY, "Chi mot quang cao uu tien co the duoc dat sau 30 giay.");
				}
				else
				{
					if(PlayerInfo[playerid][pAdvertVoucher] != 0)
					{
						ShowPlayerDialogEx(playerid, DIALOG_ADVERTVOUCHER, DIALOG_STYLE_MSGBOX, "Phieu quang cao uu tien", "Chung toi da tim thay Phieu quang cao uu tien tren tai khoan cua ban, ban co muon su dung no khong?\n\n{FF0000}Ghi chu: Ban se mat 1 phieu neu ban chon co.{FFFFFF}", "Dong Y", "Khong");
					}
					else if(PlayerInfo[playerid][pAdvertVoucher] == 0)
						return ShowPlayerDialogEx(playerid, DIALOG_ADCATEGORYPLACEP, DIALOG_STYLE_LIST, "Chon mot danh muc", "Bat dong san\nO to\nMua\nBan\nKhac", "Lua chon", "Huy bo");
				}
			}
			case 4: cmd_houselistings(playerid, "");
		}
		case DIALOG_ADCATEGORYPLACE: {
			if(response) switch(listitem) {
				case 0: {
					AdvertType[playerid] = 1;
					ShowPlayerDialogEx(playerid, DIALOG_ADPLACE, DIALOG_STYLE_INPUT, "Quang cao",
					"Nhap quang cao Bat Dong San cua ban! Phai duoi 128 ky tu.", "Gui", "Quay lai");
				}
				case 1: {
					AdvertType[playerid] = 2;
					ShowPlayerDialogEx(playerid, DIALOG_ADPLACE, DIALOG_STYLE_INPUT, "Quang cao",
					"Nhap quang cao O to cua ban! Phai duoi 128 ky tu.", "Gui", "Quay lai");
				}	
				case 2: {
					AdvertType[playerid] = 3;
					ShowPlayerDialogEx(playerid, DIALOG_ADPLACE, DIALOG_STYLE_INPUT, "Quang cao",
					"Nhap quang cao mua hang cua ban! Phai duoi 128 ky tu.", "Gui", "Quay lai");
				}
				case 3: {
					AdvertType[playerid] = 4;
					ShowPlayerDialogEx(playerid, DIALOG_ADPLACE, DIALOG_STYLE_INPUT, "Quang cao",
					"Nhap quang cao ban hang cua ban! Phai duoi 128 ky tu.", "Gui", "Quay lai");
				}
				case 4: {
					AdvertType[playerid] = 5;
					ShowPlayerDialogEx(playerid, DIALOG_ADPLACE, DIALOG_STYLE_INPUT, "Quang cao",
					"Nhap quang cao tat ca cua ban! Phai duoi 128 ky tu.", "Gui", "Quay lai");
				}
			}
		}	
		case DIALOG_ADCATEGORYPLACEP: {
			if(response) switch(listitem) {
				case 0: {
					AdvertType[playerid] = 1;
					ShowPlayerDialogEx(playerid, DIALOG_ADPLACEP, DIALOG_STYLE_INPUT, "Quang cao - Quang Cao Uu Tien",
					"Nhap Quang Cao Uu Tien Bat dong san! Phai duoi 128 ky tu.\nVi day la Quang Cao Uu Tien, se duoc phat toan cau, gia la 20.000$.", "Gui", "Quay lai");
				}
				case 1: {
					AdvertType[playerid] = 2;
					ShowPlayerDialogEx(playerid, DIALOG_ADPLACEP, DIALOG_STYLE_INPUT, "Quang cao - Quang Cao Uu Tien",
					"Nhap Quang Cao Uu Tien O to! Phai duoi 128 ky tu.\nVi day la Quang Cao Uu Tien, se duoc phat toan cau, gia la 20.000$.", "Gui", "Quay lai");
				}	
				case 2: {
					AdvertType[playerid] = 3;
					ShowPlayerDialogEx(playerid, DIALOG_ADPLACEP, DIALOG_STYLE_INPUT, "Quang cao - Quang Cao Uu Tien",
					"Nhap Quang Cao Uu Tien Mua Hang! Phai duoi 128 ky tu.\nVi day la Quang Cao Uu Tien, se duoc phat toan cau, gia la 20.000$.", "Gui", "Quay lai");
				}
				case 3: {
					AdvertType[playerid] = 4;
					ShowPlayerDialogEx(playerid, DIALOG_ADPLACEP, DIALOG_STYLE_INPUT, "Quang cao - Quang Cao Uu Tien",
					"Nhap Quang Cao Uu Tien Ban hang! Phai duoi 128 ky tu.\nVi day la Quang Cao Uu Tien, se duoc phat toan cau, gia la 20.000$.", "Gui", "Quay lai");
				}
				case 4: {
					AdvertType[playerid] = 5;
					ShowPlayerDialogEx(playerid, DIALOG_ADPLACEP, DIALOG_STYLE_INPUT, "Quang cao - Quang Cao Uu Tien",
					"Nhap Quang Cao Uu Tien Tat ca! Phai duoi 128 ky tu.\nVi day la Quang Cao Uu Tien, se duoc phat toan cau, gia la 20.000$.", "Gui", "Quay lai");
				}
			}
		}		
		case DIALOG_ADPLACE: {
			if(response) {

				new iLength = strlen(inputtext);
				
				if(GetPVarInt(playerid, "RequestingAdP") == 1) return SendClientMessageEx(playerid, COLOR_GRAD1, "You already have a Quang Cao Uu Tien pending.");

				if(!(2 <= iLength <= 127)) {
					ShowMainAdvertMenu(playerid);
					return SendClientMessageEx(playerid, COLOR_GREY, "Your input was too long or too short.");
				}

				iLength *= 50;
				if(GetPlayerCash(playerid) < iLength) {
					ShowMainAdvertMenu(playerid);
					return SendClientMessageEx(playerid, COLOR_GREY, "You don't have enough cash for this.");
				}
				/*if(Homes[playerid] > 0 && AdvertType[playerid] == 1 && !PlayerInfo[playerid][pShopNotice])
				{
					PlayerTextDrawSetString(playerid, MicroNotice[playerid], ShopMsg[6]);
					PlayerTextDrawShow(playerid, MicroNotice[playerid]);
					SetTimerEx("HidePlayerTextDraw", 10000, false, "ii", playerid, _:MicroNotice[playerid]);
				}*/
				strcpy(szAdvert[playerid], inputtext, 128);
				StripColorEmbedding(szAdvert[playerid]);
				GivePlayerCash(playerid, -iLength);
				SendClientMessageEx(playerid, COLOR_WHITE, "Xin chao mung, ban da dat quang cao cua minh!");
			}
			else ShowMainAdvertMenu(playerid);
		}
		case DIALOG_ADPLACEP: {
			if(response) {
				if(GetPVarInt(playerid, "RequestingAdP") == 1) return SendClientMessageEx(playerid, COLOR_GRAD1, "Ban da co mot Quang Cao Uu Tien dang cho xu ly.");
			
				if(gettime() < iAdverTimer) {
					SendClientMessageEx(playerid, COLOR_GREY, "Chi mot quang cao uu tien co the duoc dat sau 30 giay.");
					return ShowPlayerDialogEx(playerid, DIALOG_ADPLACEP, DIALOG_STYLE_INPUT, "Quang cao - Quang Cao Uu Tien",
					"Enter your desired advertisement text! Phai duoi 128 ky tu.\nVi day la Quang Cao Uu Tien, se duoc phat toan cau, gia la 20.000$.", "Gui", "Quay lai");
				}
				if(!(2 <= strlen(inputtext) <= 79)) {
					ShowMainAdvertMenu(playerid);
					return SendClientMessageEx(playerid, COLOR_GREY, "Your input was too long or too short.");
				}				
				if(GetPVarInt(playerid, "AdvertVoucher") > 0)
				{
				}
				else if(PlayerInfo[playerid][pFreeAdsLeft] > 0)
				{
				}
				else if(PlayerInfo[playerid][pDonateRank] == 2 && GetPlayerCash(playerid) < 40000) {
					ShowMainAdvertMenu(playerid);
					return SendClientMessageEx(playerid, COLOR_GREY, "You don't have enough cash for this.");
				}
				else if(PlayerInfo[playerid][pDonateRank] == 3 && GetPlayerCash(playerid) < 30000) {
					ShowMainAdvertMenu(playerid);
					return SendClientMessageEx(playerid, COLOR_GREY, "You don't have enough cash for this.");
				}
				else if(PlayerInfo[playerid][pDonateRank] >= 4 && GetPlayerCash(playerid) < 20000) {
					ShowMainAdvertMenu(playerid);
					return SendClientMessageEx(playerid, COLOR_GREY, "You don't have enough cash for this.");
				}
				else if(PlayerInfo[playerid][pDonateRank] <= 1 && GetPlayerCash(playerid) < 50000) {
					ShowMainAdvertMenu(playerid);
					return SendClientMessageEx(playerid, COLOR_GREY, "You don't have enough cash for this.");
				}
				SetPVarInt(playerid, "adT", gettime()+120);
				strcpy(szAdvert[playerid], inputtext, 128);
				StripColorEmbedding(szAdvert[playerid]);
					
				SetPVarInt(playerid, "RequestingAdP", 1);
				SetPVarString(playerid, "PriorityAdText", szAdvert[playerid]);
				new playername[MAX_PLAYER_NAME];
				GetPlayerName(playerid, playername, sizeof(playername));
				SendReportToQue(playerid, "Quang Cao Uu Tien", 2, 4);
					
				return SendClientMessageEx(playerid, COLOR_WHITE, "Ban da dat quang cao uu tien, hay doi cho den khi Quan Tri Vien kiem duyet quang cao.");
			}
			else ShowMainAdvertMenu(playerid);
		}
		case DIALOG_ADSEARCH: {
			if(response) {

				if(!(4 <= strlen(inputtext) <= 80)) {
					return ShowPlayerDialogEx(playerid, DIALOG_ADSEARCH, DIALOG_STYLE_INPUT, "Quang cao - Tim", "Cac truy van phai tu 4\n va 80 ky tu.\n\nNhap cum tu tim kiem.", "Tim kiem", "Quay lai");
				}
				else for(new x; x < 50; ++x) ListItemTrackId[playerid][x] = -1;

				new
					szDialog[2256],
					szSearch[80],
					szBuffer[32],
					iCount;

				strcat(szSearch, inputtext, sizeof(szSearch)); // strfind is a piece of shit when it comes to non-indexed arrays, maybe this'll help.
				foreach(new i : Player)
				{
					if(!isnull(szAdvert[i])) {
						// printf("[ads] [NAME: %s] [ID: %i] [AD: %s] [SEARCH: %s]", GetPlayerNameEx(i), i, szAdvert[i], szSearch);
						if(strfind(szAdvert[i], szSearch, true) != -1 && iCount < 50) {
							// printf("[ads - MATCH] [NAME: %s] [ID: %i] [AD: %s] [SEARCH: %s] [COUNT: %i] [DIALOG LENGTH: %i] [FINDPOS: %i]", GetPlayerNameEx(i), i, szAdvert[i], szSearch, iCount, strlen(szDialog), strfind(szAdvert[i], szSearch, true));
							strcpy(szBuffer, szAdvert[i], sizeof(szBuffer));
							if(PlayerInfo[playerid][pAdmin] <= 1) format(szDialog, sizeof(szDialog), "%s%s... (%i)\r\n", szDialog, szBuffer, PlayerInfo[i][pPnumber]);
							else format(szDialog, sizeof(szDialog), "%s%s... (%s)\r\n", szDialog, szBuffer, GetPlayerNameEx(i));
							ListItemTrackId[playerid][iCount++] = i;
						}
					}
				}	
				if(!isnull(szDialog)) ShowPlayerDialogEx(playerid, DIALOG_ADSEARCHLIST, DIALOG_STYLE_LIST, "Quang cao - Ket Qua Tim Kiem", szDialog, "Lua chon", "Quay lai");
				else ShowPlayerDialogEx(playerid, DIALOG_ADSEARCH, DIALOG_STYLE_INPUT, "Quang cao - Tim", "Khong tim thay ket qua.\n\nNhap mot cum tu tim kiem.", "Tim", "Quay lai");

			}
			else ShowMainAdvertMenu(playerid);
		}
		case DIALOG_ADSEARCHLIST: if(response) {

			new
				i = ListItemTrackId[playerid][listitem],
				szDialog[164];

			if(IsPlayerConnected(i) && !isnull(szAdvert[i])) {
				SetPVarInt(playerid, "advertContact", PlayerInfo[i][pPnumber]);
				format(szDialog, sizeof(szDialog), "%s\r\nContact: %i", szAdvert[i], PlayerInfo[i][pPnumber]);
				ShowPlayerDialogEx(playerid, DIALOG_ADFINAL, DIALOG_STYLE_MSGBOX, "Quang cao - Ket Qua Tim Kiem", szDialog, "Goi", "Ra");
			}
			else SendClientMessage(playerid, COLOR_GREY, "Nguoi nay da ngat ket noi hoac da rut lai quang cao.");
		}
		case DIALOG_ADFINAL: {
			if(response) {
				new params[32];
				format(params, sizeof(params), "%d", GetPVarInt(playerid, "advertContact"));
				DeletePVar(playerid, "adverContact");
				return cmd_call(playerid, params);
			}
		}		
		case DIALOG_ADLIST: {
			if(response) {

				new
					i = ListItemTrackId[playerid][listitem],
					szDialog[164];

				if(IsPlayerConnected(i) && !isnull(szAdvert[i])) {
					SetPVarInt(playerid, "advertContact", PlayerInfo[i][pPnumber]);
					format(szDialog, sizeof(szDialog), "%s\r\nContact: %i", szAdvert[i], PlayerInfo[i][pPnumber]);
					return ShowPlayerDialogEx(playerid, DIALOG_ADFINAL, DIALOG_STYLE_MSGBOX, "Quang cao - Ket Qua Tim Kiem", szDialog, "Goi", "Ra");
				}
				else SendClientMessage(playerid, COLOR_GREY, "Nguoi nay da ngat ket noi hoac da rut lai quang cao.");
			}
			else ShowMainAdvertMenu(playerid);
		}
		case DIALOG_ADVERTVOUCHER:
		{
			if(response) // Clicked Yes
			{
				SetPVarInt(playerid, "AdvertVoucher", 1);
				ShowPlayerDialogEx(playerid, DIALOG_ADCATEGORYPLACEP, DIALOG_STYLE_LIST, "Lua chon mot doanh muc", "Bat dong san\nO to\nMua\nBan\nKhac", "Lua chon", "Huy bo");
			}
			else // Clicked No
			{
				ShowPlayerDialogEx(playerid, DIALOG_ADCATEGORYPLACEP, DIALOG_STYLE_LIST, "Lua chon mot doanh muc", "Bat dong san\nO to\nMua\nBan\nKhac", "Lua chon", "Huy bo");
			}
		}
	}
	return 0;
}

CMD:ads(playerid, params[]) {
	return cmd_advertisements(playerid, params);
}

CMD:advertisements(playerid, params[]) {
	if(gPlayerLogged{playerid} == 0) {
		SendClientMessageEx(playerid, COLOR_GREY, "You're not logged in.");
	}
	else if(GetPVarType(playerid, "Injured")) {
		SendClientMessageEx(playerid, COLOR_GREY, "Ban khong the su dung quang cao trong khi bi thuong.");
	}
	else if(PlayerCuffed[playerid] != 0) {
		SendClientMessageEx(playerid, COLOR_GREY, "Ban khong the su dung quang cao ngay bay gio.");
	}
	else if(PlayerInfo[playerid][pJailTime] > 0) {
		SendClientMessageEx(playerid, COLOR_GREY, "Ban khong the su dung quang cao khi dang trong tu.");
	}
	else ShowMainAdvertMenu(playerid);
	return 1;
}

CMD:adunmute(playerid, params[])
{
	if (PlayerInfo[playerid][pAdmin] >= 2 || PlayerInfo[playerid][pWatchdog] >= 2)
	{
		new string[128], giveplayerid;
		if(sscanf(params, "u", giveplayerid)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /adunmute [player]");

		if(IsPlayerConnected(giveplayerid))
		{
			if(PlayerInfo[giveplayerid][pADMute] == 1)
			{
				if(PlayerInfo[giveplayerid][pJailTime] != 0)
				{
					SendClientMessageEx(playerid, COLOR_LIGHTRED, "You cannot offer someone in jail/prison an unmute!");
					SendClientMessageEx(giveplayerid, COLOR_LIGHTRED, "Sorry, you cannot be unmuted from /ad while you are in jail/prison.");
					return 1;
				}
				format(string, sizeof(string), "AdmCmd: %s(%d) was unmuted from /ad by %s.", GetPlayerNameEx(giveplayerid), GetPlayerSQLId(giveplayerid), GetPlayerNameEx(playerid));
				Log("logs/admin.log", string);
				format(string, sizeof(string), "AdmCmd: %s was unmuted from /ad by %s.", GetPlayerNameEx(giveplayerid), GetPlayerNameEx(playerid));
				ABroadCast(COLOR_LIGHTRED,string,2);
				PlayerInfo[giveplayerid][pADMute] = 0;
				PlayerInfo[giveplayerid][pADMuteTotal]--;
			}
			else
			{
				SendClientMessageEx(playerid, COLOR_LIGHTRED,"That person is not muted from /newb!");
			}

		}
	}
	return 1;
}

CMD:admute(playerid, params[])
{
	if (PlayerInfo[playerid][pAdmin] >= 2 || PlayerInfo[playerid][pSMod] == 1)
	{
		new string[128], giveplayerid;
		if(sscanf(params, "u", giveplayerid)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /admute [player]");

		if(IsPlayerConnected(giveplayerid))
		{
				if(PlayerInfo[giveplayerid][pAdmin] >= 2) return SendClientMessageEx(playerid, COLOR_LIGHTRED, "Ban khong the /admute quan tri vien");
				if(PlayerInfo[giveplayerid][pADMute] == 0)
				{
				    SetPVarInt(giveplayerid, "UnmuteTime", gettime());
					PlayerInfo[giveplayerid][pADMute] = 1;
					PlayerInfo[giveplayerid][pADMuteTotal] += 1;
					format(string, sizeof(string), "AdmCmd: %s(%d) da bi cam /ad's boi %s(%d).", GetPlayerNameEx(giveplayerid), GetPlayerSQLId(giveplayerid), GetPlayerNameEx(playerid), GetPlayerSQLId(playerid));
					Log("logs/admin.log", string);
					format(string, sizeof(string), "AdmCmd: %s da bi cam /ad's boi %s.", GetPlayerNameEx(giveplayerid), GetPlayerNameEx(playerid));
					ABroadCast(COLOR_LIGHTRED,string,2);

					if(PlayerInfo[giveplayerid][pADMuteTotal] > 6)
					{
						PlayerInfo[giveplayerid][pADMuteTotal] = 0; 
						CreateBan(playerid, PlayerInfo[giveplayerid][pId], giveplayerid, PlayerInfo[giveplayerid][pIP], "An quang cao qua muc", 14);
					}

					if(PlayerInfo[playerid][pAdmin] == 1)
					{
						format(string, sizeof(string), "AdmCmd: %s bi cam /ad's boi Admin.", GetPlayerNameEx(giveplayerid));
						SendDutyAdvisorMessage(TEAM_AZTECAS_COLOR, string);
						SendClientMessageEx(giveplayerid, COLOR_LIGHTRED, "Ban vua bi cam khoi [/ads] boi mot Admin.");
					}
					else
					{
						format(string, sizeof(string), "AdmCmd: %s da bi cam /ad's boi %s.", GetPlayerNameEx(giveplayerid), GetPlayerNameEx(playerid));
						SendDutyAdvisorMessage(TEAM_AZTECAS_COLOR, string);
						format(string, sizeof(string), "Ban vua bi cam khoi (/ads) boi %s.", GetPlayerNameEx(playerid));
						SendClientMessageEx(giveplayerid, COLOR_LIGHTRED, string);
					}

					SendClientMessageEx(giveplayerid, COLOR_LIGHTRED, "Hay nho rang, quang cao chi co the duoc su dung cho muc dich vi mach va khong duoc su dung cho bat ky muc dich nao khac, tru khi duoc quan tri vien quy dinh khac.");
					SendClientMessageEx(giveplayerid, COLOR_LIGHTRED, "Neu ban muon khong duoc nhac den, ban se bi phat hoac bo tu. Lam dung trong tuong lai co the dan den hinh phat gia tang. Neu ban cam thay day la loi, hay lien he voi quan tri vien cap cao.");

					format(string, sizeof(string), "AdmCmd: %s vua bi cam Quang cao [/ads] do lam dung.", GetPlayerNameEx(giveplayerid));
					SendClientMessageToAllEx(COLOR_LIGHTRED, string);
				}
				else
				{
					if(PlayerInfo[playerid][pAdmin] >= 2)
					{
						ShowAdMuteFine(giveplayerid);
						format(string, sizeof(string), "You offered %s an unmute from /ads.", GetPlayerNameEx(giveplayerid));
						SendClientMessageEx(playerid, COLOR_LIGHTRED, string);
					}
					else
					{
						SendClientMessageEx(playerid, COLOR_GRAD1, "Nguoi do hien da bi tat tieng. Ban khong the hien thi nguoi choi khoi quang cao voi tu cach la Advisors.");
					}
				}

		}
	}
	else
	{
		SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh do.");
	}
	return 1;
}

CMD:freeads(playerid, params[])
{
	if(PlayerInfo[playerid][pDonateRank] < 4) return SendClientMessageEx(playerid, COLOR_GREY, "Ban khong phai la mot Platinum VIP+");
	new string[128], days;
	ConvertTime(gettime() - PlayerInfo[playerid][pFreeAdsDay], .ctd=days);
	if(days >= 1)
	{
		PlayerInfo[playerid][pFreeAdsDay] = gettime();
		PlayerInfo[playerid][pFreeAdsLeft] = 3;
		SendClientMessageEx(playerid, COLOR_YELLOW, "* Ban van con 3 quang cao mien phi cho ngay hom nay.");
	}	
	else if(PlayerInfo[playerid][pFreeAdsLeft] > 0)
	{
		format(string, sizeof(string), "* Ban van con %d mien phi quang cao cho ngay hom nay.", PlayerInfo[playerid][pFreeAdsLeft]);
		SendClientMessageEx(playerid, COLOR_YELLOW, string);
	}
	else
	{
		new datestring[32];
		datestring = date(PlayerInfo[playerid][pFreeAdsDay]+86400, 3);
		format(string, sizeof(string), "* Ban da su dung tat ca cac quang cao mien phi cua minh, ban se can doi den %s.", datestring);
		SendClientMessageEx(playerid, COLOR_YELLOW, string);
	}
	return 1;
}

ShowMainAdvertMenu(playerid)
	return ShowPlayerDialogEx(playerid, DIALOG_ADMAIN, DIALOG_STYLE_LIST, "Quang cao", "Danh sach Quang cao\nTim kiem Quang cao\nDat Quang cao\nDat Quang cao Uu tien\nDanh sach nha", "Lua chon", "Huy bo");
