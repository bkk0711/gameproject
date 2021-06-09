/*

	 /$$   /$$  /$$$$$$          /$$$$$$$  /$$$$$$$
	| $$$ | $$ /$$__  $$        | $$__  $$| $$__  $$
	| $$$$| $$| $$  \__/        | $$  \ $$| $$  \ $$
	| $$ $$ $$| $$ /$$$$ /$$$$$$| $$$$$$$/| $$$$$$$/
	| $$  $$$$| $$|_  $$|______/| $$__  $$| $$____/
	| $$\  $$$| $$  \ $$        | $$  \ $$| $$
	| $$ \  $$|  $$$$$$/        | $$  | $$| $$
	|__/  \__/ \______/         |__/  |__/|__/

						Lottery System

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

forward Lotto(number);
public Lotto(number)
{
	new JackpotFallen = 0, TotalWinners = 0, string[128];

	format(string, sizeof(string), "Tin tuc xo so: Hom nay con so chien thang da giam... %d!.", number);
	OOCOff(COLOR_WHITE, string);

	foreach(new i : Player)
	{
		if(PlayerInfo[i][pLottoNr] > 0)
		{
			for(new t = 0; t < 5; t++)
			{
				if(LottoNumbers[i][t] == number)
				{
					TotalWinners++;
					SetPVarInt(i, "Winner", 1);
					break;
				}
				else
				{
					LottoNumbers[i][t] = 0;
					if(t == 4) {
						SendClientMessageEx(i, COLOR_GREY, "Xin loi, ban da khong tham gia vao lan xo so nay.");
					}
				}
			}
			DeleteTickets(i);
			PlayerInfo[i][pLottoNr] = 0;
		}
		else {
			SendClientMessageEx(i, COLOR_GREY, "Ban da khong tham gia lan xo so nay.");
		}
	}	
	if(TotalWinners == 1)
	{
		foreach(new i : Player)
		{
			if(GetPVarType(i, "Winner"))
			{
				for(new t = 0; t < 5; t++) {
					LottoNumbers[i][t] = 0;
				}
				if(SpecLotto) {
					AddFlag(i, INVALID_PLAYER_ID, LottoPrize);
				}
				JackpotFallen = 1;
				format(string, sizeof(string), "Tin Tuc Xo So: %s da gianh duoc giai Jackpot $%s voi to ve so cua anh ay.", GetPlayerNameEx(i), number_format(Jackpot));
				OOCOff(COLOR_WHITE, string);
				format(string, sizeof(string), "* Ban da thang $%s voi to ve so cua ban - Xin chuc mung!", number_format(Jackpot));
				SendClientMessageEx(i, COLOR_YELLOW, string);
				GivePlayerCash(i, Jackpot);
				DeletePVar(i, "Winner");
			}
		}	
	}
	else if(TotalWinners > 1)
	{
	    foreach(new i : Player)
		{
			if(GetPVarType(i, "Winner"))
			{
				for(new t = 0; t < 5; t++) {
					LottoNumbers[i][t] = 0;
				}
				if(SpecLotto) {
					AddFlag(i, INVALID_PLAYER_ID, LottoPrize);
				}
				JackpotFallen = 1;
				format(string, sizeof(string), "Tin Tuc Xo So: %s da gianh duoc giai Jackpot $%s voi to ve so cua anh ay.", GetPlayerNameEx(i), number_format(Jackpot/TotalWinners));
				OOCOff(COLOR_WHITE, string);
				format(string, sizeof(string), "* Ban da thang $%s voi to ve so cua ban - Xin chuc mung!", number_format(Jackpot/TotalWinners));
				SendClientMessageEx(i, COLOR_YELLOW, string);
				GivePlayerCash(i, Jackpot/TotalWinners);
				DeletePVar(i, "Winner");
			}
		}	
	}
	TicketsSold = 0;
	SpecLotto = 0;
	if(!JackpotFallen)
	{
		Misc_Save();
		format(string, sizeof(string), "Tin Tuc Xo So: Giai dac biet da duoc nang len $%s.", number_format(Jackpot));
		OOCOff(COLOR_WHITE, string);
	}
	else
	{
	    Jackpot = 50000;
	    format(string, sizeof(string), "Tin Tuc Xo So: Giai dac biet moi da duoc bat dau voi so tien $%s.", number_format(Jackpot));
		OOCOff(COLOR_WHITE, string);
	}
	return 1;
}

forward PrepareLotto();
public PrepareLotto()
{
 	SetTimerEx("StartLotto", 60000, 0, "d", 1);
	return 1;
}

forward StartLotto(stage);
public StartLotto(stage)
{
	new minutes, string[128];
	if(stage <= 3 && stage != 0)
	{
	    if(stage == 1) minutes = 6;
	    else if(stage == 2) minutes = 4;
	    else if(stage == 3) minutes = 2;
		format(string, sizeof(string), "Tin Tuc Xo So: Xo so sap bat dau, vui long den cua hang 24/7 de mua ve so. Con lai %d phut.", minutes);
		OOCOff(COLOR_WHITE, string);
		if(stage > 0)
		{
			SetTimerEx("StartLotto", 120000, 0, "d", stage+1);
		}
	}
	else if(stage == 4)
	{
	    SetTimerEx("EndLotto", 1000, 0, "d", 3);
	}
	return 1;
}

forward EndLotto(secondt);
public EndLotto(secondt)
{
	new string[128];
	if(secondt != 0)
	{
		format(string, sizeof(string), "Tin Tuc Xo So Dem: %d.", secondt);
		OOCOff(COLOR_WHITE, string);
		SetTimerEx("EndLotto", 1000, 0, "d", secondt-1);
	}
	else
	{
	    format(string, sizeof(string), "Tin Tuc Xo So: Chung toi da bat dau xo so.");
		OOCOff(COLOR_WHITE, string);
		new rand = RandomEx(1, 300);
		Lotto(rand);
	}
	return 1;
}

hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[]) {

	if(arrAntiCheat[playerid][ac_iFlags][AC_DIALOGSPOOFING] > 0) return 1;
	szMiscArray[0] = 0;
	switch(dialogid)
	{
		case LOTTOMENU: //lotteryticket
		{
			new lotto = strval(inputtext);
			if(response)
			{
				if(lotto < 1 || lotto > 300)
				{
					SendClientMessageEx(playerid, COLOR_GREY, "   Xo so khong duoi 1 hoac cao hon 300!");
					ShowPlayerDialogEx( playerid, LOTTOMENU, DIALOG_STYLE_INPUT, "Lua chon ve so","Vui long nhap so ban muon mua!", "Mua", "Huy bo" );
				}
				else
				{
					if(PlayerInfo[playerid][pLottoNr] >= 5) {
						SendClientMessageEx(playerid, COLOR_GREY, "Ban chi co the mua toi da 5 ve.");
						return 1;
					}
					format(szMiscArray, sizeof(szMiscArray), "* Ban da mua mot ve so co so: %d.", lotto);
					SendClientMessageEx(playerid, COLOR_LIGHTBLUE, szMiscArray);
					AddTicket(playerid, lotto);
					for(new i = 0; i < 5; i++) {
						if(LottoNumbers[playerid][i] == 0) {
							LottoNumbers[playerid][i] = lotto;
							break;
						}
					}
					Jackpot += 800;
					TicketsSold += 1;
					PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
					return 1;
				}
			}
		}
	}
	return 0;
}

CMD:lottoinfo(playerid, params[])
{
	new szMessage[128];
	format(szMessage, sizeof(szMessage), "Xo so tiep theo tai %i:00, ve da ban %i, va tong cong giai dac biet $%s.", NextDrawing, TicketsSold, number_format(Jackpot));
	SendClientMessage(playerid, COLOR_WHITE, szMessage);
	return 1;
}

CMD:speclotto(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] < 4 && PlayerInfo[playerid][pASM] < 1) {
	    SendClientMessage(playerid, COLOR_GREY, "Ban khong co quyen truy cap vao lenh nay.");
	}
	else if(SpecLotto) {
	    SendClientMessage(playerid, COLOR_GREY, "A special lottery has already been started.");
	}
	else {

	    new
	        prize[64],
	        string[128];

	    if(sscanf(params, "s[64]", prize)) {
	        SendClientMessage(playerid, COLOR_GREY, "SU DUNG: /speclotto [van ban]");
		}
		else {
		    SpecLotto = 1;
		    LottoPrize = prize;
		    format(string, sizeof(string), "{AA3333}AdmWarning{FFFF00}: %s da bat dau xo so dac biet. (Giai thuong: %s)", GetPlayerNameEx(playerid), prize);
			ABroadCast(COLOR_YELLOW, string, 4);
			return 1;
		}
	}
	return 1;
}

CMD:cancelspeclotto(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] < 4 && PlayerInfo[playerid][pASM] < 1) {
	    SendClientMessage(playerid, COLOR_GREY, "Ban khong co quyen truy cap vao lenh nay.");
	}
	else if(!SpecLotto) {
	    SendClientMessage(playerid, COLOR_GREY, "Khong co xo so dac biet.");
	}
	else {
	    SpecLotto = 0;
	    LottoPrize = "";
	}
	return 1;
}
