/*

	 /$$   /$$  /$$$$$$          /$$$$$$$  /$$$$$$$
	| $$$ | $$ /$$__  $$        | $$__  $$| $$__  $$
	| $$$$| $$| $$  \__/        | $$  \ $$| $$  \ $$
	| $$ $$ $$| $$ /$$$$ /$$$$$$| $$$$$$$/| $$$$$$$/
	| $$  $$$$| $$|_  $$|______/| $$__  $$| $$____/
	| $$\  $$$| $$  \ $$        | $$  \ $$| $$
	| $$ \  $$|  $$$$$$/        | $$  | $$| $$
	|__/  \__/ \______/         |__/  |__/|__/

						Service Commands

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

CMD:dichvu(playerid, params[])
{
	new string[128], choice[32];
	if(sscanf(params, "s[32]", choice))
	{
		SendClientMessageEx(playerid, COLOR_GREY, "USAGE: /dichvu [name]");
		SendClientMessageEx(playerid, COLOR_GREY, "Ten co san: Taxi, Bus, CapCuu, SuaXe, EMS");
		return 1;
	}

	if(PlayerInfo[playerid][pJailTime] > 0)
	{
		SendClientMessageEx(playerid, COLOR_WHITE, "Ban khong the dung trong jail/prison.");
		return 1;
	}
	if(gettime() < PlayerInfo[playerid][pServiceTime]) return SendClientMessage(playerid, COLOR_WHITE, "Ban phai doi 30 giay de co the thuc hien lai lenh nay. " );

	if(strcmp(choice,"ems",true) == 0)
	{
		if(GetPVarInt(playerid, "Injured") == 0)
		{
			SendClientMessageEx(playerid, COLOR_GREY, "   Ban khong bi thuong, ban khong the goi cho EMS ngay bay gio!");
			return 1;
		}
		new zone[MAX_ZONE_NAME];
		GetPlayer2DZone(playerid, zone, MAX_ZONE_NAME);
		SetPVarInt(playerid, "EMSAttempt", 1);
		SendClientMessageEx(playerid, COLOR_WHITE, "EMS da duoc thong bao ve vi tri hien tai cua ban va dang tren duong den.");
		format(string, sizeof(string), "Truong hop khan cap bao cao (%d) %s tai %s. Ho yeu cau cuu thuong khan cap ngay lap tuc (/emslist).",playerid, GetPlayerNameEx(playerid), zone);
		SendMedicMessage(TEAM_MED_COLOR, string);
		PlayerInfo[playerid][pServiceTime] = gettime()+30;
		return 1;
	}
	else if(strcmp(choice,"taxi",true) == 0)
	{
		if(TaxiDrivers < 1) return SendClientMessageEx(playerid, COLOR_GREY, "   Hien tai khong co tai xe nao lam nhiem vu, thu lai sau!");
		if(TransportDuty[playerid] > 0) return SendClientMessageEx(playerid, COLOR_GREY, "   Ban khong the goi taxi bay gio!");

		if(GetPVarInt(playerid, "TaxiCall")) return SendClientMessage(playerid, COLOR_GREY, "	Ban dang co yeu cau goi Taxi cho xu ly (/huybo taxi).");

		new szZoneName[MAX_ZONE_NAME];
		GetPlayer2DZone(playerid, szZoneName, MAX_ZONE_NAME);
		format(string, sizeof(string), "** %s (%d) dang can mot tai xe Taxi tai %s - dung /ataxi de chap nhan cuoc goi.", GetPlayerNameEx(playerid), playerid, szZoneName );
		SendTaxiMessage(TEAM_AZTECAS_COLOR, string);
		SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "* Ban da goi cho mot tai xe Taxi, cho tra loi.");
		SetPVarInt(playerid, "TaxiCall", 1);
		PlayerInfo[playerid][pServiceTime] = gettime()+30;
		return 1;
	}
	else if(strcmp(choice,"bus",true) == 0)
	{
		if(BusDrivers < 1) return SendClientMessageEx(playerid, COLOR_GREY, "   Hien tai khong co tai xe Bus, hay thu lai sau!");
		if(TransportDuty[playerid] > 0) SendClientMessageEx(playerid, COLOR_GREY, "   Ban khong the goi Bus bay gio!");
		
		new szZoneName[MAX_ZONE_NAME];
		GetPlayer2DZone(playerid, szZoneName, sizeof(szZoneName));
		format(string, sizeof(string), "** %s(%d) Dang can mot tai xe Bus tai %s - dung /abus de chap nhan cuoc goi.", GetPlayerNameEx(playerid), playerid, szZoneName );
		SendTaxiMessage(TEAM_AZTECAS_COLOR, string);
		SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "* Ban da goi cho mot tai xe Bus, cho tra loi.");
		SetPVarInt(playerid, "BusCall", 1);
		PlayerInfo[playerid][pServiceTime] = gettime()+30;
		return 1;
	}
	else if(strcmp(choice,"capcuu",true) == 0)
	{
		new OnDutyMedics;
		foreach(new i : Player)
		{
			if(IsAMedic(i) || IsFirstAid(i) && PlayerInfo[i][pDuty] == 1)
			{
				OnDutyMedics++;
			}
		}	
		if(OnDutyMedics < 1)
		{
			SendClientMessageEx(playerid, COLOR_GREY, "   Hien khong co Bac Si nao lam viec, hay thu lai sau!");
			return 1;
		}
		else
		{
			format(string, sizeof(string), "** %s dang can mot Bac Si - dung /chapnhan medic de chap nhan cuoc goi.", GetPlayerNameEx(playerid));
			SendDivisionMessage(12, 2, TEAM_AZTECAS_COLOR, string);
			SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "* Ban da goi cho Bac Si, cho tra loi.");
			MedicCall = playerid;
			PlayerInfo[playerid][pServiceTime] = gettime()+30;
			OnDutyMedics = 0;
			return 1;
		}
	}
	else if(strcmp(choice,"suaxe",true) == 0)
	{
		if(Mechanics < 1)
		{
			SendClientMessageEx(playerid, COLOR_GREY, "   Hien khong co Tho sua xe nao lam viec, hay thu lai sau!");
			return 1;
		}
		format(string, sizeof(string), "** %s dang can Tho sua xe - dung /chapnhan mechanic de chap nhan cuoc goi.", GetPlayerNameEx(playerid));
		SendJobMessage(7, TEAM_AZTECAS_COLOR, string);
		SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "* Ban da gio cho Tho sua xe, cho ho tra loi.");
		MechanicCall = playerid;
		PlayerInfo[playerid][pServiceTime] = gettime()+30;
		return 1;
	}
	else
	{
		SendClientMessageEx(playerid, COLOR_GREY, "   Ten dich vu khong xac dinh!");
		return 1;
	}
}
