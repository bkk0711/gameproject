/*

	 /$$   /$$  /$$$$$$          /$$$$$$$  /$$$$$$$
	| $$$ | $$ /$$__  $$        | $$__  $$| $$__  $$
	| $$$$| $$| $$  \__/        | $$  \ $$| $$  \ $$
	| $$ $$ $$| $$ /$$$$ /$$$$$$| $$$$$$$/| $$$$$$$/
	| $$  $$$$| $$|_  $$|______/| $$__  $$| $$____/
	| $$\  $$$| $$  \ $$        | $$  \ $$| $$
	| $$ \  $$|  $$$$$$/        | $$  | $$| $$
	|__/  \__/ \______/         |__/  |__/|__/

						Lawyer System

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
CMD:lawyerduty(playerid, params[])
{
	if(!IsALawyer(playerid)) return SendClientMessageEx(playerid, COLOR_GREY, "   Ban khong phai la luat su!");
	if(GetPVarInt(playerid, "LawyerDuty") == 1)
	{
        SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "* Ban da offduty cong viec luat su cua ban, bay gio ban se khong the nhan cuoc goi nao.");
		SetPVarInt(playerid, "LawyerDuty", 0);
        Lawyers -= 1;
    }
    else if(GetPVarInt(playerid, "LawyerDuty") == 0)
	{
        SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "* Ban da onduty cong viec luat su cua ban, bay gio ban se ban se nhan cuoc goi tu nguoi can giup.");
		SetPVarInt(playerid, "LawyerDuty", 1);
        Lawyers += 1;
    }
    return 1;
}
CMD:defendtime(playerid, params[])
{
	new string[128];
	if(PlayerInfo[playerid][pDefendTime] < 1)
	{
		SendClientMessageEx(playerid, COLOR_YELLOW, "Ban da co the bao chua bay gio.");
	}
	else {	
		format(string, sizeof(string), "Ban se duoc bao chua trong  %d phut.", PlayerInfo[playerid][pDefendTime]);
		SendClientMessageEx(playerid, COLOR_YELLOW, string);
	}	
	return 1;
}

CMD:offerappeal(playerid, params[])
{
  	if(!IsALawyer(playerid)) return SendClientMessageEx(playerid, COLOR_GREY, "   Ban khong phai la luat su!");
    new string[128], giveplayerid;
	if(sscanf(params, "u", giveplayerid)) return SendClientMessageEx(playerid, COLOR_GREY, "USAGE: /offerappeal [player]");
	if(giveplayerid == playerid) return SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong the su dung lenh nay cho chinh minh!");
	if(IsPlayerConnected(giveplayerid))
	{
	    if(PlayerInfo[giveplayerid][pBeingSentenced] == 0) return SendClientMessageEx(playerid, COLOR_GRAD1, "Nguoi nay khong co vu an nao can xu ly!");
	    if(AppealOfferAccepted[giveplayerid] == 1) return SendClientMessageEx(playerid, COLOR_GRAD1, "Nguoi nay da chap nhan luat su bao chua cho ho!");
		AppealOffer[giveplayerid] = playerid;
	    format(string, sizeof(string), "Ban da de nghi dich vu luat su cua ban %s.",GetPlayerNameEx(giveplayerid));
	    SendClientMessageEx(playerid, COLOR_WHITE, string);
	    format(string, sizeof(string), "%s da de nghi dich vu luat su cua ho (dung /chapnhan appeal de chap nhan ho).", GetPlayerNameEx(playerid));
	    SendClientMessageEx(giveplayerid, COLOR_WHITE, string);
	}
	return 1;
}

CMD:free(playerid, params[])
{

	if(!IsALawyer(playerid)) return SendClientMessageEx(playerid, COLOR_GREY, "   Ban khong phai la luat su!");

	if(PlayerInfo[playerid][pLawSkill] >= 401)
	{
		ApprovedLawyer[playerid] = 1;
	}

	new
		giveplayerid;

	if(sscanf(params, "u", giveplayerid)) {
		SendClientMessageEx(playerid, COLOR_GREY, "USAGE: /free [player]");
	}
	else if(!IsPlayerConnected(giveplayerid)) {
		SendClientMessageEx(playerid, COLOR_GREY, "Invalid player specified.");
	}
	else if(giveplayerid == playerid) {
		SendClientMessageEx(playerid, COLOR_GREY, "You cannot free yourself.");
	}
	else if(PlayerInfo[giveplayerid][pJailTime] > 0 && ApprovedLawyer[playerid] == 1 && WantLawyer[giveplayerid] >= 1) {

		new
			string[128];

		format(string, sizeof(string), "* Ban giai thoat %s tu nha tu.", GetPlayerNameEx(giveplayerid));
		SendClientMessageEx(playerid, COLOR_LIGHTBLUE, string);
		format(string, sizeof(string), "* Ban da duoc giai thoat tu nha tu, boi luat su %s.", GetPlayerNameEx(playerid));
		SendClientMessageEx(giveplayerid, COLOR_LIGHTBLUE, string);
		ApprovedLawyer[playerid] = 0;
		WantLawyer[giveplayerid] = 0;
		CallLawyer[giveplayerid] = 0;
		PlayerInfo[giveplayerid][pBailPrice] = 0;
		PlayerInfo[giveplayerid][pJailTime] = 1;

		if(PlayerInfo[playerid][pDoubleEXP] > 0)
		{
			format(string, sizeof(string), "Ban da dat duoc 2 diem ky nang luat su thay vi 1. Ban co %d gio tren nhan doi EXP Token.", PlayerInfo[playerid][pDoubleEXP]);
			SendClientMessageEx(playerid, COLOR_YELLOW, string);
			PlayerInfo[playerid][pLawSkill] += 2;
		}
		else ++PlayerInfo[playerid][pLawSkill];

		switch(PlayerInfo[playerid][pLawSkill]) {
			case 50: SendClientMessageEx(playerid, COLOR_YELLOW, "* Ky nang luat su cua ban da dat cap 2, ban se nhan duoc tien va thoi gian giam tu se ngan hon.");
			case 100: SendClientMessageEx(playerid, COLOR_YELLOW, "* Ky nang luat su cua ban da dat cap 3, ban se nhan duoc tien va thoi gian giam tu se ngan hon.");
			case 200: SendClientMessageEx(playerid, COLOR_YELLOW, "* Ky nang luat su cua ban da dat cap 4, ban se nhan duoc tien va thoi gian giam tu se ngan hon.");
			case 400: SendClientMessageEx(playerid, COLOR_YELLOW, "* Ky nang luat su cua ban da dat cap 5, ban se nhan duoc tien va thoi gian giam tu se ngan hon.");
		}
	}
	else SendClientMessageEx(playerid, COLOR_GRAD1, "Nguoi nay khong can luat su.");
	return 1;
}
CMD:finishappeal(playerid, params[])
{
	if(!IsALawyer(playerid)) return SendClientMessageEx(playerid, COLOR_GREY, "   Ban khong phai la luat su!");
    new string[128], giveplayerid;
	if(sscanf(params, "u", giveplayerid)) return SendClientMessageEx(playerid, COLOR_GREY, "USAGE: /finishappeal [player]");
	if(giveplayerid == playerid) return SendClientMessageEx(playerid, COLOR_GRAD1, "You can't use this command on yourself!");
	if(IsPlayerConnected(giveplayerid))
	{
	    if(AppealOffer[giveplayerid] != playerid) return SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong de nghi dich vu cua minh cho nguoi choi nay!");
	    format(string, sizeof(string), "Ban da hoan thanh dich vu luat su cua ban de %s.",GetPlayerNameEx(giveplayerid));
	    SendClientMessageEx(playerid, COLOR_WHITE, string);
	    format(string, sizeof(string), "%s da hoan thanh viec cung cap dich vu Luat Su cua ho.", GetPlayerNameEx(playerid));
	    SendClientMessageEx(giveplayerid, COLOR_WHITE, string);
	    AppealOffer[giveplayerid] = INVALID_PLAYER_ID;
		AppealOfferAccepted[giveplayerid] = 0;
	}
	return 1;
}

CMD:defend(playerid, params[])
{
	if(!IsALawyer(playerid)) return SendClientMessageEx(playerid, COLOR_GREY, "   Ban khong phai la luat su!");

	new string[128];
	if(gettime() < PlayerInfo[playerid][pLawyerTime])
	{
		format(string, sizeof(string), "You must wait %d seconds!", PlayerInfo[playerid][pLawyerTime]-gettime());
		SendClientMessageEx(playerid, COLOR_GRAD1,string);
		return 1;
	}

	new giveplayerid, money;
	if(sscanf(params, "ud", giveplayerid, money)) return SendClientMessageEx(playerid, COLOR_GREY, "USAGE: /defend [player] [price]");
	if(money < 20000 || money > 1000000) { SendClientMessageEx(playerid, COLOR_GREY, "   Price not lower then $20,000 or above $1,000,000!"); return 1; }
	if(IsPlayerConnected(giveplayerid))
	{
		if(ProxDetectorS(8.0, playerid, giveplayerid))
		{
			if(giveplayerid == playerid)
			{
				SendClientMessageEx(playerid, COLOR_GREY, "   Cant offer protection to yourself!");
				return 1;
			}
			if(PlayerInfo[giveplayerid][pDefendTime] > 0) {
			    return SendClientMessageEx(playerid, COLOR_GRAD2, "Ban phai doi 1 tieng de co the bao chua nguoi nay.");
			}
			if(PlayerInfo[giveplayerid][pWantedLevel] > 0)
			{
				format(string, sizeof(string), "* Ban da de nghi bao chua %s cho $%d.", GetPlayerNameEx(giveplayerid), money);
				SendClientMessageEx(playerid, COLOR_LIGHTBLUE, string);
				format(string, sizeof(string), "* Luat su %s muon bao chua cho ban de lay $%d, (type /accept defense) to accept.", GetPlayerNameEx(playerid), money);
				SendClientMessageEx(giveplayerid, COLOR_LIGHTBLUE, string);
				PlayerInfo[playerid][pLawyerTime] = gettime()+60;
				DefendOffer[giveplayerid] = playerid;
				DefendPrice[giveplayerid] = money;
			}
			else
			{
				SendClientMessageEx(playerid, COLOR_GREY, "   Nguoi nay khong bi truy na!");
			}
		}
		else
		{
			SendClientMessageEx(playerid, COLOR_GREY, "Nguoi nay khong dung gan ban.");
		}
	}
	else
	{
		SendClientMessageEx(playerid, COLOR_GREY, "Invalid player specified.");
	}
	return 1;
}

