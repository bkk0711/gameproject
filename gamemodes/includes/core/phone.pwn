/*

	 /$$   /$$  /$$$$$$          /$$$$$$$  /$$$$$$$
	| $$$ | $$ /$$__  $$        | $$__  $$| $$__  $$
	| $$$$| $$| $$  \__/        | $$  \ $$| $$  \ $$
	| $$ $$ $$| $$ /$$$$ /$$$$$$| $$$$$$$/| $$$$$$$/
	| $$  $$$$| $$|_  $$|______/| $$__  $$| $$____/
	| $$\  $$$| $$  \ $$        | $$  \ $$| $$
	| $$ \  $$|  $$$$$$/        | $$  | $$| $$
	|__/  \__/ \______/         |__/  |__/|__/

						Phone System

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

forward RingToner();
public RingToner()
{
	foreach(new i : Player)
	{
		if(RingTone[i] != 6 && RingTone[i] != 0 && RingTone[i] < 11)
		{
			RingTone[i] = RingTone[i] -1;
			PlayerPlaySound(i, 1138, 0.0, 0.0, 0.0);
		}
		if(RingTone[i] == 6)
		{
			RingTone[i] = RingTone[i] -1;
		}
		if(RingTone[i] == 20)
		{
			RingTone[i] = RingTone[i] -1;
			PlayerPlaySound(i, 1139, 0.0, 0.0, 0.0);
		}
	}
	SetTimer("RingTonerRev", 1000, 0);
	return 1;
}

forward RingTonerRev();
public RingTonerRev()
{
	foreach(new i : Player)
	{
		if(RingTone[i] != 5 && RingTone[i] != 0 && RingTone[i] < 10)
		{
			RingTone[i] = RingTone[i] -1;
			PlayerPlaySound(i, 1137, 0.0, 0.0, 0.0);
		}
		if(RingTone[i] == 5)
		{
			RingTone[i] = RingTone[i] -1;
		}
		if(RingTone[i] == 19)
		{
			PlayerPlaySound(i, 1139, 0.0, 0.0, 0.0);
			RingTone[i] = 0;
		}
	}
	SetTimer("RingToner", 1000, 0);
	return 1;
}

CMD:ocellphonehelp(playerid, params[])
{
	SetPVarInt(playerid, "HelpResultCat0", 4);
	Help_ListCat(playerid, DIALOG_HELPCATOTHER1);
	return 1;
}
CMD:trogiupdienthoai(playerid, params[]) {
	return cmd_cellphonehelp(playerid, params);
}
CMD:cellphonehelp(playerid, params[])
{
    SendClientMessageEx(playerid, COLOR_GREEN,"_______________________________________");
    if (PlayerInfo[playerid][pPnumber] != 0) {
        SendClientMessageEx(playerid, COLOR_WHITE,"*** HELP *** - go met lenh de biet them thong tin.");
        SendClientMessageEx(playerid, COLOR_GRAD3,"*** CELLPHONE *** /call 'vi du: /call 911' /sms (/p)ickup (/h)angup /speakerphone /sdt");
    }
    else {
        SendClientMessageEx(playerid, COLOR_WHITE,"Ban co the mua dien thoai tai 24-7");
    }
    return 1;
}

CMD:phoneprivacy(playerid, params[])
{
    if(PlayerInfo[playerid][pPnumber] != 0 && PlayerInfo[playerid][pDonateRank] >= 2)
	{
        if(PlayerInfo[playerid][pPhonePrivacy] == 1)
		{
            PlayerInfo[playerid][pPhonePrivacy] = 0;
            SendClientMessageEx(playerid, COLOR_WHITE, "Ban da vo hieu hoa dien thoai cua ban.");
        }
        else
		{
            PlayerInfo[playerid][pPhonePrivacy] = 1;
            SendClientMessageEx(playerid, COLOR_WHITE, "Ban da kich hoat dien thoai cua ban.");
        }
    }
    else
	{
        SendClientMessageEx(playerid, COLOR_WHITE, "Ban khong co dien thoai hoac ban khong phai la Silver VIP.");
    }
    return 1;
}

CMD:speakerphone(playerid, params[])
{
    if(PlayerInfo[playerid][pPnumber] != 0)
	{
        if(PlayerInfo[playerid][pSpeakerPhone] == 1)
		{
            PlayerInfo[playerid][pSpeakerPhone] = 0;
            SendClientMessageEx(playerid, COLOR_WHITE, "Ban da tat tinh nang loa ngoai tren dien thoai.");
        }
        else
		{
            PlayerInfo[playerid][pSpeakerPhone] = 1;
            SendClientMessageEx(playerid, COLOR_WHITE, "Ban da mo tinh nang loa ngoai tren dien thoai.");
        }
    }
    else
	{
        SendClientMessageEx(playerid, COLOR_WHITE, "Ban khong co dien thoai.");
    }
    return 1;
}

CMD:colorcar(playerid, params[]) {
	new iColors[2];
	if(!IsPlayerInAnyVehicle(playerid)) return SendClientMessageEx(playerid, COLOR_GRAD2, "Ban khong o trong xe.");
	else if(PlayerInfo[playerid][pSpraycan] == 0) return SendClientMessageEx(playerid, COLOR_GRAD2, "Ban khong co binh son xe.");
	if(sscanf(params, "ii", iColors[0], iColors[1])) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /colorcar [ID 1] [ID 2]. May sac phai la ID.");
	else if((PlayerInfo[playerid][pDonateRank] == 0) && (iColors[0] > 127 || iColors[1] > 127)) return SendClientMessageEx(playerid, COLOR_GREY, "Chi co VIP moi su dung ID mau dac bien o tren 127.");
	else if(!(0 <= iColors[0] <= 255 && 0 <= iColors[1] <= 255)) return SendClientMessageEx(playerid, COLOR_GRAD2, "Mau da chi dinh khong hop le (ID bat dau tu 0 va ket thuc bang 255).");
	new szMessage[60];
	for(new i = 0; i < MAX_PLAYERVEHICLES; i++)
	{
		if(IsPlayerInVehicle(playerid, PlayerVehicleInfo[playerid][i][pvId]))
		{
			PlayerVehicleInfo[playerid][i][pvColor1] = iColors[0], PlayerVehicleInfo[playerid][i][pvColor2] = iColors[1];
			ChangeVehicleColor(PlayerVehicleInfo[playerid][i][pvId], PlayerVehicleInfo[playerid][i][pvColor1], PlayerVehicleInfo[playerid][i][pvColor2]);
			PlayerInfo[playerid][pSpraycan]--;
			g_mysql_SaveVehicle(playerid, i);
			format(szMessage, sizeof(szMessage), "Ban da thay doi mau sac cua chiec xe cua ban thanh ID %d, %d.", iColors[0], iColors[1]);
			return SendClientMessageEx(playerid, COLOR_GRAD2, szMessage);
		}
	}
	for(new i = 0; i < sizeof(VIPVehicles); i++)
	{
		if(IsPlayerInVehicle(playerid, VIPVehicles[i]))
		{
			ChangeVehicleColor(VIPVehicles[i], iColors[0], iColors[1]);
			PlayerInfo[playerid][pSpraycan]--;
			format(szMessage, sizeof(szMessage), "Ban da thay doi mau sac cua chiec xe cua ban thanh ID %d, %d.", iColors[0], iColors[1]);
			return SendClientMessageEx(playerid, COLOR_GRAD2, szMessage);
		}
	}
	for(new i = 0; i < sizeof(FamedVehicles); i++)
	{
		if(IsPlayerInVehicle(playerid, FamedVehicles[i]))
		{
			ChangeVehicleColor(FamedVehicles[i], iColors[0], iColors[1]);
			PlayerInfo[playerid][pSpraycan]--;
			format(szMessage, sizeof(szMessage), "Ban da thay doi mau sac cua chiec xe cua ban thanh ID %d, %d.", iColors[0], iColors[1]);
			return SendClientMessageEx(playerid, COLOR_GRAD2, szMessage);
		}
	}
	SendClientMessageEx(playerid, COLOR_GREY, "Ban khong the son xe cua nguoi khac.");
	return 1;
}
CMD:sdt(playerid, params[]) {
	return cmd_number(playerid, params);
}
CMD:number(playerid, params[]) {
	if(PlayerInfo[playerid][pPhoneBook] == 1) {

		new
			iTarget;

		if(sscanf(params, "u", iTarget)) {
			SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /number [player]");
		}
		else if(IsPlayerConnected(iTarget)) {
			new
				szNumber[16 + MAX_PLAYER_NAME];

			format(szNumber, sizeof(szNumber), "* %s (%i)", GetPlayerNameEx(iTarget), PlayerInfo[iTarget][pPnumber]);
			SendClientMessageEx(playerid, COLOR_GRAD1, szNumber);
		}
		else SendClientMessageEx(playerid, COLOR_GRAD1, "Nguoi choi chi dinh khong hop le.");
	}
	else SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong co danh ba.");
	return 1;
}

CMD:tempnum(playerid, params[]) {
	return cmd_tempnumber(playerid, params);
}

CMD:tempnumber(playerid, params[]){
	if (PlayerInfo[playerid][pMember] != INVALID_GROUP_ID && PlayerInfo[playerid][pRank] >= arrGroupData[PlayerInfo[playerid][pMember]][gTempNum] || IsAHitman(playerid)) {
        new num;
        if(TempNumber[playerid] == 1) {
			SendClientMessageEx(playerid, COLOR_GREY, "So tam thoi cua ban da bi vo hieu hoa va so ban dau cua ban da duoc khoi phuc.");
			TempNumber[playerid] = 0;
			PlayerInfo[playerid][pPnumber] = GetPVarInt(playerid, "oldnum");
			return 1;
		}
        if(sscanf(params, "i", num) && TempNumber[playerid] == 0)
			return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /tempnumber [number]");

		if(strlen(params) > 10 || strlen(params) < 2) 
			return SendClientMessage(playerid, COLOR_GREY, "So dien thoai tam thoi chi co the dai tu 2 den 10 so.");

		if(PlayerInfo[playerid][pPnumber] == num)
			return SendClientMessageEx(playerid,COLOR_GREY,"Ban khong the dat so tam thoi cua minh thanh so hien tai");

		else {

			SetPVarInt(playerid, "oldnum", PlayerInfo[playerid][pPnumber]);
			SetPVarInt(playerid, "tempnum", num);
			mysql_format(MainPipeline, szMiscArray, sizeof(szMiscArray), "SELECT `Username` FROM `accounts` WHERE `PhoneNr` = '%d'",num);
			mysql_tquery(MainPipeline, szMiscArray, "OnPhoneNumberCheck", "ii", playerid, 5);
		}
	} else SendClientMessageEx(playerid, COLOR_GREY, "Ban khong co quyen truy cap vao lenh nay.");
	return 1;
}

/*
CMD:ringtone(playerid, params[])
{
    if(GetPVarType(playerid, "PlayerCuffed") || GetPVarType(playerid, "Injured") || GetPVarType(playerid, "IsFrozen")) {
   		return SendClientMessage(playerid, COLOR_GRAD2, "You can't do that at this time!");
	}

	if(!IsPlayerInAnyVehicle(playerid))
	{
		SetPlayerSpecialAction(playerid, SPECIAL_ACTION_USECELLPHONE);
		SetPlayerAttachedObject(playerid, 9, 330, 6);
	}
	return ShowPlayerDialogEx(playerid,RTONEMENU,DIALOG_STYLE_LIST,"Ringtone - Change Your Ringtone:","Ringtone 1\nRingtone 2\nRingtone 3\nRingtone 4\nRingtone 5\nRingtone 6\nRingtone 7\nRingtone 8\nRingtone 9\nTurn Off","Select","Close");
}
*/

CMD:setautoreply(playerid, params[])
{
	if(strlen(PlayerInfo[playerid][pAutoTextReply]) > 0)
	{
		strdel(PlayerInfo[playerid][pAutoTextReply], 0, 64);
		SendClientMessageEx(playerid, COLOR_WHITE, "Ban da tat tra loi tu dong.");
		return 1;
	}

	if(PlayerInfo[playerid][pDonateRank] < 2)
	{
		SendClientMessageEx(playerid, COLOR_GREY, "Ban khong phai la VIP.");
		return 1;
	}

	if(isnull(params))
	{
		SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /setautoreply [text]");
		return 1;
	}

	new string[128];
	if(strlen(params) >= 1 && strlen(params) < 63)
	{
		format(PlayerInfo[playerid][pAutoTextReply], 64, "%s", params);
		format(string, sizeof(string), "Ban da thay doi tra loi tu dong cua ban thanh: %s", params);
		SendClientMessageEx(playerid, COLOR_WHITE, string);
	}
	else
	{
		SendClientMessageEx(playerid, COLOR_GREY, "LOI: Tra loi tu dong cua ban phai co it nhat 1 ky tu va khong the vuot qua 64 ky tu.");
	}
	return 1;
}

CMD:call(playerid, params[])
{
	new string[128], phonenumb;

	if(sscanf(params, "d", phonenumb)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /call [phonenumber]");

	if(PlayerInfo[playerid][pJailTime] > 0 && !GetPVarType(playerid, "PayPhone"))
	{
		SendClientMessageEx(playerid,COLOR_GREY,"Ban khong the su dung dien thoai khi o trong tu.");
		return 1;
	}
	if(PlayerTied[playerid] != 0 || PlayerCuffed[playerid] != 0 || GetPVarInt(playerid, "pBagged") >= 1)
	{
		SendClientMessageEx(playerid,COLOR_GREY,"Ban khong the su dung dien thoai cua ban bi han che.");
		return 1;
	}
	if(!GetPVarType(playerid, "PayPhone")) {

		if(PlayerInfo[playerid][pPnumber] == 0)
		{
			SendClientMessageEx(playerid, COLOR_GRAD2, "Ban khong co dien thoai di dong.");
			return 1;
		}
		if(PhoneOnline[playerid] > 0)
		{
			SendClientMessageEx(playerid, COLOR_GREY, "Dien thoai cua ban bi tat.");
			return 1;
		}
	}
	if(GetPVarType(playerid, "PlayerCuffed") || GetPVarInt(playerid, "pBagged") >= 1 || GetPVarType(playerid, "Injured") || GetPVarType(playerid, "IsFrozen") || PlayerInfo[playerid][pHospital] > 0) {
   		return SendClientMessage(playerid, COLOR_GRAD2, "Ban khong the lam dieu do vao luc nay!");
	}
	format(string, sizeof(string), "* %s lay ra mot chiec dien thoai.", GetPlayerNameEx(playerid));
	ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);

	switch(phonenumb) {

		case 911: {

			if(PlayerInfo[playerid][pJailTime] > 0 && !GetPVarType(playerid, "PayPhone")) return SendClientMessageEx(playerid, COLOR_WHITE, "Khong the su dung no trong khi o trong tu!");
			if(GetPVarType(playerid, "Has911Call")) SendClientMessageEx(playerid, COLOR_GREY, "Ban chi co the co mot cuoc goi hoat dong tai mot thoi diem. (/cancelcall)");
			else if(PlayerInfo[playerid][p911Muted] != 0) ShowPlayerDialogEx(playerid, 7955, DIALOG_STYLE_MSGBOX, "Cuoc goi bi chan", "You are currently blocked from using 911 emergency services. This is generally caused by abuse of services.\n\n((Use /report to report for an unmute))", "Close", "");
			else ShowPlayerDialogEx(playerid, DIALOG_911MENU, DIALOG_STYLE_LIST, "Dich vu 911 Truong hop khan cap", "Truong hop khan cap\nBac Si\nPolice Assistance (Non-Emergency)\nTowing\nVehicle Burglary (In Progress)\nFire", "Select", "End Call");
			return 1;
		}
		case 18004444, 18001800, 18008080, 18001111, 18001020: {

			if(PlayerInfo[playerid][pJailTime] > 0) return SendClientMessageEx(playerid, COLOR_WHITE, "Khong the su dung no trong khi o trong tu!");
			if(GetPVarType(playerid, "Has911Call")) SendClientMessageEx(playerid, COLOR_GREY, "Ban chi co the co mot cuoc goi hoat dong tai mot thoi diem. (/cancelcall)");
			else {

				new iGroupID;

				if(phonenumb == 18004444) iGroupID = 5;
				if(phonenumb == 18001800) iGroupID = 12;
				if(phonenumb == 18008080) iGroupID = 4;
				if(phonenumb == 18001111) iGroupID = 6; // SATR
				if(phonenumb == 18001020) iGroupID = 2; // SAPS

				if(GetPVarType(playerid, "PayPhone")) TogglePlayerControllable(playerid, false);

				format(szMiscArray, sizeof(szMiscArray), "GROUP ID: %d", iGroupID);
				SendClientMessage(playerid, COLOR_YELLOW, szMiscArray);
				SetPVarInt(playerid, "GRPCALL", iGroupID);
				format(szMiscArray, sizeof(szMiscArray), "{%s}%s's Hotline", Group_NumToDialogHex(arrGroupData[iGroupID][g_hDutyColour]), arrGroupData[iGroupID][g_szGroupName]);
				ShowPlayerDialogEx(playerid, DIALOG_HOTLINE, DIALOG_STYLE_INPUT, szMiscArray, "Xin vui long cho chung toi biet ngan ve nhu cau cua bName.", "Nhap", "Ket thuc cuoc goi");
			}
			return 1;
		}
		/*case 1738: {

			if(!GetPVarType(playerid, "ShipmentCallActive"))
			{
				SetPVarInt(playerid, "ShipmentCallActive", 1);

				SendClientMessageEx(playerid, COLOR_PINK, "** An unknown person picks up the phone.");
				SetTimerEx("ShipmentConvo", 2000, false, "ii", playerid, 1);
			}
			return 1;
		}*/
	}

	if(GetPVarType(playerid, "BUSICALL")) {


		if(PlayerInfo[playerid][pJailTime] > 0) return SendClientMessageEx(playerid, COLOR_WHITE, "Khong the su dung nguoi nay khi o trong tu!");
		if(GetPVarType(playerid, "Has911Call")) SendClientMessageEx(playerid, COLOR_GREY, "Ban chi co the co mot cuoc goi hoat dong tai mot thoi diem. (/cancelcall)");
		else {

			new i = GetPVarInt(playerid, "BUSICALL");
			format(szMiscArray, sizeof(szMiscArray), "%s's Dien thoai co dinh | %d", Businesses[i][bName], Businesses[i][bPhoneNr]);
			ShowPlayerDialogEx(playerid, DIALOG_HOTLINE, DIALOG_STYLE_INPUT, szMiscArray, "Xin vui long cho chung toi biet ngan gon ve nhu cau cua ban.", "Nhap", "Ket thuc cuoc goi");
		}
		return 1;
	}
	if(GetPVarType(playerid, "PayPhone")) {

		new i = GetPVarInt(playerid, "PayPhone");
		if(arrPayPhoneData[i][pp_iNumber] == phonenumb) {
			DeletePVar(playerid, "PayPhone");
			return SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong the goi den so dien thoai cong cong ma ban dang goi.");
		}
	}
	for(new i; i < MAX_PAYPHONES; ++i) {

		if(IsValidDynamicArea(arrPayPhoneData[i][pp_iAreaID] && phonenumb == arrPayPhoneData[i][pp_iNumber])) {

			if(arrPayPhoneData[i][pp_iCallerID] != INVALID_PLAYER_ID) return SendClientMessageEx(playerid, COLOR_GRAD1, "Dien thoai cong cong nay da duoc su dung.");
			SetPVarInt(playerid, "PayPhone", i);
			arrPayPhoneData[i][pp_iCallerID] = playerid;
			PayPhone_UpdateTextLabel(i, 1);
			Mobile[playerid] = 2000; // trial
			SendClientMessageEx(playerid, COLOR_GRAD1, "Quay so dien thoai cong cong...");
			SendClientMessageEx(playerid, COLOR_WHITE, "HINT: Bay gio ban su dung T de noi chuyen dien thoai, Go /hangup de tat.");
			CellTime[playerid] = 1;
			SetPlayerAttachedObject(playerid, 8, 330, 6);
			return SetPlayerSpecialAction(playerid, SPECIAL_ACTION_USECELLPHONE);
		}
	}
	for(new i; i < MAX_BUSINESSES; ++i) {

		if(IsValidBusinessID(i)) {

			if(phonenumb == Businesses[i][bPhoneNr]) {

				if(PlayerInfo[playerid][pJailTime] > 0) return SendClientMessageEx(playerid, COLOR_WHITE, "Khong the su dung nguoi nay khi o trong tu!");
				if(GetPVarType(playerid, "Has911Call")) SendClientMessageEx(playerid, COLOR_GREY, "Ban chi co the co mot cuoc goi hoat dong tai mot thoi diem. (/cancelcall)");
				else {

					SetPVarInt(playerid, "BUSICALL", i);
					format(szMiscArray, sizeof(szMiscArray), "%s's Company Line | %d", Businesses[i][bName], Businesses[i][bPhoneNr]);
					ShowPlayerDialogEx(playerid, DIALOG_HOTLINE, DIALOG_STYLE_INPUT, szMiscArray, "Xin vui long cho chung toi biet ngan gon ve nhu cau cua ban.", "Nhap", "Ket thuc cuoc goi");
				}
				return 1;
			}
		}
	}
	if(phonenumb == PlayerInfo[playerid][pPnumber])
	{
		SendClientMessageEx(playerid, COLOR_GRAD2, "  Ban khong the goi chinh ban...");
		return 1;
	}
	if(Mobile[playerid] != INVALID_PLAYER_ID)
	{
		SendClientMessageEx(playerid, COLOR_GRAD2, "  Ban dang co mot cuoc goi...");
		return 1;
	}
	foreach(new i : Player)
	{
		if(PlayerInfo[i][pPnumber] == phonenumb && phonenumb != 0)
		{
			Mobile[playerid] = i; //caller connecting
			if(IsPlayerConnected(i))
			{
				if(i != INVALID_PLAYER_ID)
				{
					if(PhoneOnline[i] > 0)
					{
						SendClientMessageEx(playerid, COLOR_GREY, "Dien thoai cua nguoi choi do bi tat.");
						Mobile[playerid] = INVALID_PLAYER_ID;
						DeletePVar(playerid, "PayPhone");
						return 1;
					}
					if(Mobile[i] != INVALID_PLAYER_ID)
					{
						SendClientMessageEx(playerid, COLOR_GRAD2, "You just get a busy tone...");
						Mobile[playerid] = INVALID_PLAYER_ID;
						DeletePVar(playerid, "PayPhone");
						return 1;
					}
					if(Spectating[i]!=0)
					{
						SendClientMessageEx(playerid, COLOR_GRAD2, "You just get a busy tone...");
						Mobile[playerid] = INVALID_PLAYER_ID;
						DeletePVar(playerid, "PayPhone");
						return 1;
					}
					if(Mobile[i] == INVALID_PLAYER_ID)
					{
						if(GetPVarType(playerid, "PayPhone")) {

							format(string, sizeof(string), "Dien thoai cua ban dang do chuong - go /p de tra loi. [Nguoi goi: Dien thoai tra phi (%d)]", arrPayPhoneData[GetPVarInt(playerid, "PayPhone")][pp_iNumber]);
							TogglePlayerControllable(playerid, false);
							SendClientMessageEx(i, COLOR_YELLOW, string);
						}
						else {
							format(string, sizeof(string), "Dien thoai cua ban dang do chuong - go /p de tra loi. [Nguoi goi ID: %d]", PlayerInfo[playerid][pPnumber]);
							SendClientMessageEx(i, COLOR_YELLOW, string);
							FetchContact(i, PlayerInfo[playerid][pPnumber]);
						}
						RingTone[i] = 10;
						format(string, sizeof(string), "* %s's dien thoai bat dau do chuong.", GetPlayerNameEx(i));
						SendClientMessageEx(playerid, COLOR_WHITE, "HINT: Bay gio ban su dung T de noi chuyen tren dien thoai di dong cua ban, go /hangup de tat may.");
						ProxDetector(30.0, i, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
						CellTime[playerid] = 1;
						SetPlayerAttachedObject(playerid, 8, 330, 6);
						Phone_Calling(playerid, i);
						return SetPlayerSpecialAction(playerid, SPECIAL_ACTION_USECELLPHONE);
					}
				}
			}
		}
	}
	SendClientMessageEx(playerid, COLOR_GRAD2, "Cuoc goi cua ban khong the hoan thanh nhu da gio, vui long kiem tra so va thu lai.");
	DeletePVar(playerid, "PayPhone");
	return 1;
}

CMD:t(playerid, params[])
{
	return cmd_sms(playerid, params);
}

CMD:txt(playerid, params[])
{
	return cmd_sms(playerid, params);
}

CMD:sms(playerid, params[])
{
	if(gPlayerLogged{playerid} == 0) return SendClientMessageEx(playerid, COLOR_GREY, "   Ban chua dang nhap!");
	if(PlayerInfo[playerid][pJailTime] && strfind(PlayerInfo[playerid][pPrisonReason], "[OOC]", true) != -1) return SendClientMessageEx(playerid, COLOR_GREY, "Bi tu OOC han che su dung binh thuong chi su dung /b");
	if(PlayerInfo[playerid][pPnumber] == 0) return SendClientMessageEx(playerid, COLOR_GRAD2, "  Ban khong co dien thoai.");
	if(PhoneOnline[playerid] > 0) return SendClientMessageEx(playerid, COLOR_GREY, "Dien thoai ban tat nguon.");
	if(GetPVarInt(playerid, "Injured") != 0 || PlayerInfo[playerid][pHospital] != 0) return SendClientMessageEx (playerid, COLOR_GRAD2, "Ban khong the lam dieu do ngay bay gio.");
	if(PlayerTied[playerid] != 0 || PlayerCuffed[playerid] != 0 || GetPVarInt(playerid, "pBagged") >= 1) return SendClientMessageEx(playerid, COLOR_GREY, "Ban khong the su dung dien thoai cua ban.");
	if(PlayerInfo[playerid][pJailTime] > 0) return SendClientMessageEx(playerid, COLOR_GREY, "   Ban khong the su dung dien thoai cua ban khi o tu!");

	szMiscArray[0] = 0;

	new phonenumb, text[100];
	if(sscanf(params, "ds[100]", phonenumb, text)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: (/t)ext [phonenumber] [text chat]");

	if(Spectating[playerid] == 0 || !GetPVarType(playerid, "FlyMode"))
	{
		format(szMiscArray, sizeof(szMiscArray), "* %s lay ra mot chiec dien thoai.", GetPlayerNameEx(playerid));
		ProxDetector(30.0, playerid, szMiscArray, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
	}

	if(phonenumb == 555)
	{
		if ((strcmp("yes", text, true, strlen(text)) == 0) && (strlen(text) == strlen("yes")))
		{
			ChatTrafficProcess(playerid, COLOR_YELLOW, "Tin nhan van ban duoc gui.", 7);
			ChatTrafficProcess(playerid, COLOR_YELLOW, "SMS: Toi dang theo doi ban, Nguoi gui: MOLE (555)", 7);
			//SendAudioToPlayer(playerid, 47, 100);
			RingTone[playerid] = 20;
			return 1;
		}
		else
		{
			ChatTrafficProcess(playerid, COLOR_YELLOW, "SMS: Toi dang theo dio ban, Nguoi gui: MOLE (555)", 7);
			//SendAudioToPlayer(playerid, 47, 100);
			RingTone[playerid] = 20;
			return 1;
		}
	}
	szMiscArray[0] = 0;
	foreach(new i : Player)
	{
		if(PlayerInfo[i][pPnumber] == phonenumb && phonenumb != 0)
		{
			new giveplayerid = i;
			if(Mobile[giveplayerid] != INVALID_PLAYER_ID)
			{
				ChatTrafficProcess(playerid, COLOR_GREY, "Dien thoai cua nguoi choi do dang ban (trong mot cuoc goi).", 7);
				DeletePVar(playerid, "PayPhone");
				return 1;
			}
			Mobile[playerid] = giveplayerid; //caller connecting
			if(IsPlayerConnected(giveplayerid))
			{
				if(giveplayerid != INVALID_PLAYER_ID)
				{

					if(PhoneOnline[giveplayerid] > 0)
					{
						ChatTrafficProcess(playerid, COLOR_GREY, "Dien thoai cua nguoi choi do bi tat.", 7);
						Mobile[playerid] = INVALID_PLAYER_ID;
						return 1;
					}
					foreach(new u: Player)
					{
						if(GetPVarInt(u, "BigEar") == 6 && (GetPVarInt(u, "BigEarPlayer") == playerid || GetPVarInt(u, "BigEarPlayer") == giveplayerid))
						{
							format(szMiscArray, sizeof(szMiscArray), "(BE) %s SMS den %s: %s", GetPlayerNameEx(playerid), GetPlayerNameEx(giveplayerid), text);
							ChatTrafficProcess(u, COLOR_YELLOW, szMiscArray, 7);
						}
					}
					if(PlayerInfo[playerid][pPhonePrivacy] == 1)
					{
						format(szMiscArray, sizeof(szMiscArray), "SMS: %s, Nguoi gui: Khoang xac dinh.", text);
					}
					else
					{
						format(szMiscArray, sizeof(szMiscArray), "SMS: %s, Nguoi gui: %d (( %s ))", text, PlayerInfo[playerid][pPnumber], GetPlayerNameEx(playerid));
					}

					if(i != playerid)
					{
						if(PlayerInfo[i][pSmslog] > 0)
						{
							new query[384], ftext[128];
							mysql_escape_string(text, ftext);
							if(PlayerInfo[playerid][pPhonePrivacy] == 1) mysql_format(MainPipeline, query, sizeof(query), "INSERT INTO `sms` (`id`, `sender`, `senderid`, `sendernumber`, `receiver`, `receiverid`, `receivernumber`, `message`, `date`) VALUES (NULL, '%s', %d, 0, '%s', %d, %d, '%s', NOW())", GetPlayerNameExt(playerid), GetPlayerSQLId(playerid), GetPlayerNameExt(i), GetPlayerSQLId(i), phonenumb, ftext);
							else mysql_format(MainPipeline, query, sizeof(query), "INSERT INTO `sms` (`id`, `sender`, `senderid`, `sendernumber`, `receiver`, `receiverid`, `receivernumber`, `message`, `date`) VALUES (NULL, '%s', %d, %d, '%s', %d, %d, '%s', NOW())", GetPlayerNameExt(playerid), GetPlayerSQLId(playerid), PlayerInfo[playerid][pPnumber], GetPlayerNameExt(i), GetPlayerSQLId(i), phonenumb, ftext);
							mysql_tquery(MainPipeline, query, "OnQueryFinish", "i", SENDDATA_THREAD);
						}
					}

					//format(szMiscArray, sizeof(szMiscArray), "* %s's phone beeps.", sendername);
					RingTone[giveplayerid] =20;
					ChatTrafficProcess(giveplayerid, COLOR_YELLOW, szMiscArray, 7);
					ChatTrafficProcess(playerid, COLOR_YELLOW, szMiscArray, 7);
					ChatTrafficProcess(playerid, COLOR_YELLOW, "Tin nhan van ban duoc gui", 7);
					FetchContact(giveplayerid, PlayerInfo[playerid][pPnumber]);
					format(szMiscArray, sizeof(szMiscArray), "~r~$-%d", 25);
					GameTextForPlayer(playerid, szMiscArray, 5000, 1);
					GivePlayerCash(playerid,-25);
					//PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
					//SendAudioToPlayer(playerid, 47, 100);
					//SendAudioToPlayer(giveplayerid, 47, 100);
					Mobile[playerid] = INVALID_PLAYER_ID;

					if(strcmp(PlayerInfo[giveplayerid][pAutoTextReply], "Nothing", true) != 0)
					{
						format(szMiscArray, sizeof(szMiscArray), "SMS: %s, Nguoi gui: %d [Tra loi tu dong]", PlayerInfo[giveplayerid][pAutoTextReply], PlayerInfo[giveplayerid][pPnumber]);
						ChatTrafficProcess(playerid, COLOR_YELLOW, szMiscArray, 7);
					}

					return 1;
				}
			}
		}
	}
	SendClientMessageEx(playerid, COLOR_GRAD2, "  Gui tin that bai...");
	return 1;
}

CMD:p(playerid, params[]) {
	return cmd_pickup(playerid, params);
}

CMD:pickup(playerid, params[])
{
	new string[128];
	if(Mobile[playerid] != INVALID_PLAYER_ID)
	{
		SendClientMessageEx(playerid, COLOR_GRAD2, "  Ban dang co cuoc goi...");
		return 1;
	}
	if(GetPVarType(playerid, "PlayerCuffed") || GetPVarInt(playerid, "pBagged") >= 1 || GetPVarType(playerid, "Injured") || GetPVarType(playerid, "IsFrozen") || PlayerInfo[playerid][pHospital] > 0) {
   		return SendClientMessage(playerid, COLOR_GRAD2, "Ban khong the lam dieu do ngay bay gio!");
	}
	if(GetPVarType(playerid, "PayPhone")) {

		new x = GetPVarInt(playerid, "PayPhone");

		if(arrPayPhoneData[x][pp_iCallerID] != INVALID_PLAYER_ID) {

			if(arrPayPhoneData[x][pp_iCallerID] == playerid) return SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong the tra loi dien thoai tra tien ban dang quay so.");

			foreach(new i : Player) {

				if(GetPVarInt(i, "PayPhone") == x) {
					if(i != playerid) return SendClientMessage(playerid, COLOR_GRAD1, "Mot nguoi khac da su dung dien thoai tra tien nay.");
				}
			}
			foreach(new i : Player) 	{


				if(i == arrPayPhoneData[x][pp_iCallerID])
				{
					Mobile[playerid] = i;
					Mobile[i] = playerid;
					SendClientMessageEx(i,  COLOR_GRAD2, "   Co nguoi nhan cuoc goi.");
					format(string, sizeof(string), "* %s tra loi dien thoai tra tien.", GetPlayerNameEx(playerid));
					ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
					TogglePlayerControllable(playerid, false);
					SetPlayerAttachedObject(playerid, 8, 330, 6);
					return SetPlayerSpecialAction(playerid, SPECIAL_ACTION_USECELLPHONE);
				}
			}
		}
	}
	foreach(new i : Player)
	{
		if(Mobile[i] == playerid)
		{
			Mobile[playerid] = i; //caller connecting
			SendClientMessageEx(i,  COLOR_GRAD2, "   Ho da nhan cuoc goi.");
			format(string, sizeof(string), "* %s tra loi dien thoai di dong cua ho.", GetPlayerNameEx(playerid));
			ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
			RingTone[playerid] = 0;
			SetPlayerAttachedObject(playerid, 8, 330, 6);
			Phone_PickupCall(playerid, i);
			return SetPlayerSpecialAction(playerid, SPECIAL_ACTION_USECELLPHONE);
		}
	}
	return 1;
}

CMD:h(playerid, params[]) {
	return cmd_hangup(playerid, params);
}

CMD:hangup(playerid,params[])
{
	new string[128];
	if(GetPVarInt(playerid, "Injured") != 0||PlayerCuffed[playerid]!=0||PlayerInfo[playerid][pHospital]!=0)
	{
		SendClientMessageEx (playerid, COLOR_GRAD2, "Ban khong the lam dieu do ngay bay gio.");
		return 1;
	}
	if(GetPVarType(playerid, "Has911Call")) {

		if(GetPVarType(playerid, "PayPhone")) TogglePlayerControllable(playerid, true);
		cmd_cancelcall(playerid, "");
	}
	new caller = Mobile[playerid];
	if((IsPlayerConnected(caller)/* && caller != INVALID_PLAYER_ID*/))
	{
		if(caller < MAX_PLAYERS)
		{
			if(GetPVarInt(caller, "_UsingJailPhone") == 1)
			{
				TogglePlayerControllable(caller, 1);
				DeletePVar(caller, "_UsingJailPhone");
				bJailPhoneUse[GetClosestPrisonPhone(caller)] = false;
			}

			SendClientMessageEx(caller,  COLOR_GRAD2, "   Cup may.");
			format(string, sizeof(string), "* %s cat dien thoai cua ho vao.", GetPlayerNameEx(caller));
			ProxDetector(30.0, caller, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
			CellTime[caller] = 0;
			Mobile[caller] = INVALID_PLAYER_ID;
		}

		if(GetPVarType(playerid, "PayPhone")) {

			new x = GetPVarInt(playerid, "PayPhone");
			DeletePVar(playerid, "PayPhone");
			arrPayPhoneData[x][pp_iCallerID] = INVALID_PLAYER_ID;
			TogglePlayerControllable(playerid, true);
			PayPhone_UpdateTextLabel(x, 0);
		}
		if(GetPVarType(caller, "PayPhone")) {

			new x = GetPVarInt(caller, "PayPhone");
			DeletePVar(caller, "PayPhone");
			arrPayPhoneData[x][pp_iCallerID] = INVALID_PLAYER_ID;
			TogglePlayerControllable(caller, true);
			PayPhone_UpdateTextLabel(x, 0);
		}

		DeletePVar(playerid, "GRPCALL");
		DeletePVar(caller, "GRPCALL");
		DeletePVar(playerid, "BUSICALL");
		DeletePVar(caller, "BUSICALL");
		CellTime[playerid] = 0;
		Phone_HangupCall(playerid, Mobile[playerid]);
		SendClientMessageEx(playerid,  COLOR_GRAD2, "   Ban cup may.");
		format(string, sizeof(string), "* %s cat dien thoai cua ho vao.", GetPlayerNameEx(playerid));
		ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
		Mobile[playerid] = INVALID_PLAYER_ID;
		CellTime[playerid] = 0;
		RingTone[playerid] = 0;
		RemovePlayerAttachedObject(playerid, 8);
		RemovePlayerAttachedObject(caller, 8);
		SetPlayerSpecialAction(caller, SPECIAL_ACTION_STOPUSECELLPHONE);
		SetPlayerSpecialAction(playerid, SPECIAL_ACTION_STOPUSECELLPHONE);
		return 1;
	}
	else {

		if(GetPVarType(playerid, "PayPhone")) {

			CellTime[playerid] = 0;
			SendClientMessageEx(playerid,  COLOR_GRAD2, "   Ban cup may.");
			format(string, sizeof(string), "* %s cat dien thoai cua ho vao.", GetPlayerNameEx(playerid));
			ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
			Mobile[playerid] = INVALID_PLAYER_ID;
			CellTime[playerid] = 0;
			RingTone[playerid] = 0;
			RemovePlayerAttachedObject(playerid, 8);
			RemovePlayerAttachedObject(caller, 8);
			SetPlayerSpecialAction(caller, SPECIAL_ACTION_STOPUSECELLPHONE);
			SetPlayerSpecialAction(playerid, SPECIAL_ACTION_STOPUSECELLPHONE);

			new x = GetPVarInt(playerid, "PayPhone");
			DeletePVar(playerid, "PayPhone");
			arrPayPhoneData[x][pp_iCallerID] = INVALID_PLAYER_ID;
			PayPhone_UpdateTextLabel(x, 0);
			return 1;
		}
	}
	SendClientMessageEx(playerid,  COLOR_GRAD2, "   Dien thoai cua ban o trong tui cua ban.");
	return 1;
}

FetchContact(iReceiverID, iCallerNumber) {

	mysql_format(MainPipeline, szMiscArray, sizeof(szMiscArray), "SELECT `contactname` FROM `phone_contacts` WHERE `id` = '%d' AND `contactnr` = '%d' LIMIT 1", GetPlayerSQLId(iReceiverID), iCallerNumber);
	mysql_tquery(MainPipeline, szMiscArray, "OnFetchContact", "i", iReceiverID);
}

forward OnFetchContact(iReceiverID);
public OnFetchContact(iReceiverID) {

	new
		iRows,
		szName[MAX_PLAYER_NAME];

	szMiscArray[0] = 0;
	cache_get_row_count(iRows);

	if(!iRows) return 1;
	cache_get_value_name(0, "contactname", szName, MAX_PLAYER_NAME);
	format(szMiscArray, sizeof(szMiscArray), "[LIEN HE]: %s", szName);
	ChatTrafficProcess(iReceiverID, COLOR_GRAD1, szMiscArray, 7);
	return 1;
}
