/*

	 /$$   /$$  /$$$$$$          /$$$$$$$  /$$$$$$$
	| $$$ | $$ /$$__  $$        | $$__  $$| $$__  $$
	| $$$$| $$| $$  \__/        | $$  \ $$| $$  \ $$
	| $$ $$ $$| $$ /$$$$ /$$$$$$| $$$$$$$/| $$$$$$$/
	| $$  $$$$| $$|_  $$|______/| $$__  $$| $$____/
	| $$\  $$$| $$  \ $$        | $$  \ $$| $$
	| $$ \  $$|  $$$$$$/        | $$  | $$| $$
	|__/  \__/ \______/         |__/  |__/|__/

					Contract Group Type

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

forward PickUpC4(playerid);
public PickUpC4(playerid)
{
   	DestroyDynamicObject(PlayerInfo[playerid][pC4]);
   	PlayerInfo[playerid][pC4] = 0;
	return 1;
}


stock SearchingHit(playerid)
{
	new string[128], group = PlayerInfo[playerid][pMember];
   	SendClientMessageEx(playerid, COLOR_WHITE, "Hop dong co san:");
   	new hits;
	foreach(new i : Player)
	{
		if(!IsAHitman(i) && PlayerInfo[i][pHeadValue] > 0)
		{
			if(GotHit[i] == 0)
			{
				hits++;
				format(string, sizeof(string), "%s (ID %d) | $%s | Duoc dat boi: %s | Ly do: %s | Duoi theo: Khong", GetPlayerNameEx(i), i, number_format(PlayerInfo[i][pHeadValue]), PlayerInfo[i][pContractBy], PlayerInfo[i][pContractDetail]);
				SendClientMessageEx(playerid, COLOR_GRAD2, string);
			}
			else
			{
				format(string, sizeof(string), "%s (ID %d) | $%s | Duoc dat boi: %s | Ly do: %s | Duoi theo: %s", GetPlayerNameEx(i), i, number_format(PlayerInfo[i][pHeadValue]), PlayerInfo[i][pContractBy], PlayerInfo[i][pContractDetail], GetPlayerNameEx(GetChased[i]));
				SendClientMessageEx(playerid, COLOR_GRAD2, string);
			}
		}
	}
	if(hits && PlayerInfo[playerid][pRank] <= 1 && arrGroupData[group][g_iGroupType] == GROUP_TYPE_CONTRACT)
	{
		SendClientMessageEx(playerid, COLOR_YELLOW, "Dung /givemehit giao hop dong cho chinh minh.");
	}
	if(hits && PlayerInfo[playerid][pRank] >= 6 && arrGroupData[group][g_iGroupType] == GROUP_TYPE_CONTRACT)
	{
		SendClientMessageEx(playerid, COLOR_YELLOW, "Dung /givehit giao hop dong cho mot trong nhung ke tan cong.");
	}
	if(hits == 0)
	{
	    SendClientMessageEx(playerid, COLOR_GREY, "Khong co luot truy cap co san.");
	}
	return 0;
}


hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[]) {

	if(arrAntiCheat[playerid][ac_iFlags][AC_DIALOGSPOOFING] > 0) return 1;
	szMiscArray[0] = 0;

	switch(dialogid)
	{
		case DIALOG_ORDER_HMA1:
		{
			if(response) {
				switch(listitem) {
					case 0: {
						if(GetPlayerCash(playerid) >= 2000) {
							SetHealth(playerid, 100);
							SetArmour(playerid, 100);
							GivePlayerCash(playerid, - 2000);
						}
						else SendClientMessageEx(playerid, COLOR_GRAD2, MSG_NOMONEY);
					}
					case 1: {
						if(PlayerInfo[playerid][pRank] < 4) { // use this to check their rank
							format(szMiscArray, sizeof(szMiscArray), "\nTear Gas\t\t $5,000\n\
							Knife\t\t\t $12,000\n\
							Baton\t\t\t $5,000\n\
							Spraycan\t\t $4,500\n\
							Colt.45\t\t\t $5,000\n\
							SD Pistol\t\t $7,500\n\
							Deagle\t\t\t $12,000\n\
							MP5\t\t\t $17,500\n\
							UZI\t\t\t $17,500\n\
							TEC9\t\t\t $17,500\n\
							Shotgun\t\t $11,000\n\
							SPAS12\t\t\t $90,000\n\
							AK47\t\t\t $35,000\n\
							M4\t\t\t $70,000\n\
							Rifle\t\t\t $10,000\n\
							Sniper\t\t\t $65,000"
							);
						}
						else {
							format(szMiscArray, sizeof(szMiscArray), "\nTear Gas\t\t $5,000\n\
							Knife\t\t\t $12,000\n\
							Baton\t\t\t $5,000\n\
							Spraycan\t\t $4,500\n\
							Colt.45\t\t\t $5,000\n\
							SD Pistol\t\t $7,500\n\
							Deagle\t\t\t $12,000\n\
							MP5\t\t\t $17,500\n\
							UZI\t\t\t $17,500\n\
							TEC9\t\t\t $17,500\n\
							Shotgun\t\t $11,000\n\
							SPAS12\t\t\t $90,000\n\
							AK47\t\t\t $35,000\n\
							M4\t\t\t $70,000\n\
							Rifle\t\t\t $10,000\n\
							Sniper\t\t\t $65,000\n\
							Chainsaw\t\t $20,000\n\
							C4\t\t\t $50,000"
							);
						}
						ShowPlayerDialogEx(playerid, DIALOG_ORDER_HMAWPS, DIALOG_STYLE_LIST, "Lua chon vu khi", szMiscArray, "Lua chon", "Lui lai");
					}
					case 2: {
						ShowPlayerDialogEx(playerid, DIALOG_ORDER_HMASKIN, DIALOG_STYLE_INPUT, "Dong phuc", "Lua chon dong phuc (nhap ID).", "Thay doi", "Lui lai");
					}
					case 3: {
						if(gettime()-GetPVarInt(playerid, "LastNameChange") < 120) {
							return SendClientMessageEx(playerid, COLOR_GRAD2, "Ban chi co the yeu cau thay doi ten cu sau hai phut.");
						}
						ShowPlayerDialogEx(playerid, DIALOG_NAMECHANGE, DIALOG_STYLE_INPUT, "Thay doi ten","Vui long nhap ten moi cua ban!\n\nGhi chu: Thay doi ten mien phi do to chuc cua ban.", "Thay doi", "Lui lai");
					}
				}
			}
		}
		case DIALOG_ORDER_HMAWPS:
		{
			if(!response) {
				format(szMiscArray, sizeof(szMiscArray), "Mau va giap\t\t $2000\nVu khi\nDong phuc\nThay doi ten");
				ShowPlayerDialogEx(playerid, DIALOG_ORDER_HMA1, DIALOG_STYLE_LIST, "HMA Order Vu khi", szMiscArray, "Order", "Huy bo");
			}
			else {
				switch(listitem) {
					case 0: { // tear gas - $5000
						if(GetPlayerCash(playerid) >= 5000) {
							GivePlayerValidWeapon(playerid, 17);
							GivePlayerCash(playerid, - 5000);
						}
						else SendClientMessageEx(playerid, COLOR_GRAD2, MSG_NOMONEY);
					}
					case 1: { // knife - $12000
						if(GetPlayerCash(playerid) >= 12000) {
							GivePlayerValidWeapon(playerid, 4);
							GivePlayerCash(playerid, - 12000);
						}
						else SendClientMessageEx(playerid, COLOR_GRAD2, MSG_NOMONEY);
					}
					case 2: {// baton - $5000
						if(GetPlayerCash(playerid) >= 5000) {
							GivePlayerValidWeapon(playerid, 3);
							GivePlayerCash(playerid, - 5000);
						}
						else SendClientMessageEx(playerid, COLOR_GRAD2, MSG_NOMONEY);
					}
					case 3: { // Spraycan - $4500
						if(GetPlayerCash(playerid) >= 4500) {
							GivePlayerValidWeapon(playerid, 41);
							GivePlayerCash(playerid, - 4500);
						}
						else SendClientMessageEx(playerid, COLOR_GRAD2, MSG_NOMONEY);
					}
					case 4: { // Colt.45 - $5000
						if(GetPlayerCash(playerid) >= 5000) {
							GivePlayerValidWeapon(playerid, 22);
							GivePlayerCash(playerid, - 5000);
						}
						else SendClientMessageEx(playerid, COLOR_GRAD2, MSG_NOMONEY);
					}
					case 5: { // SD Pistol - $7500
						if(GetPlayerCash(playerid) >= 7500) {
							GivePlayerValidWeapon(playerid, 23);
							GivePlayerCash(playerid, - 7500);
						}
						else SendClientMessageEx(playerid, COLOR_GRAD2, MSG_NOMONEY);
					}
					case 6: { // Deagle - $12000
						if(GetPlayerCash(playerid) >= 12000) {
							GivePlayerValidWeapon(playerid, 24);
							GivePlayerCash(playerid, - 12000);
						}
						else SendClientMessageEx(playerid, COLOR_GRAD2, MSG_NOMONEY);
					}
					case 7: { // MP5 - $17500
						if(GetPlayerCash(playerid) >= 17500) {
							GivePlayerValidWeapon(playerid, 29);
							GivePlayerCash(playerid, - 17500);
						}
						else SendClientMessageEx(playerid, COLOR_GRAD2, MSG_NOMONEY);
					}
					case 8: { // UZI - $17500
						if(GetPlayerCash(playerid) >= 17500) {
							GivePlayerValidWeapon(playerid, 28);
							GivePlayerCash(playerid, - 17500);
						}
						else SendClientMessageEx(playerid, COLOR_GRAD2, MSG_NOMONEY);
					}
					case 9: { // TEC9 - $17500
						if(GetPlayerCash(playerid) >= 17500) {
							GivePlayerValidWeapon(playerid, 32);
							GivePlayerCash(playerid, - 17500);
						}
						else SendClientMessageEx(playerid, COLOR_GRAD2, MSG_NOMONEY);
					}
					case 10: { // Shotgun - $11000
						if(GetPlayerCash(playerid) >= 11000) {
							GivePlayerValidWeapon(playerid, 25);
							GivePlayerCash(playerid, - 11000);
						}
						else SendClientMessageEx(playerid, COLOR_GRAD2, MSG_NOMONEY);
					}
					case 11: { // SPAS - $90000
						if(GetPlayerCash(playerid) >= 90000) {
							GivePlayerValidWeapon(playerid, 27);
							GivePlayerCash(playerid, - 90000);
						}
						else SendClientMessageEx(playerid, COLOR_GRAD2, MSG_NOMONEY);
					}
					case 12: { // AK47 - $35000
						if(GetPlayerCash(playerid) >= 35000) {
							GivePlayerValidWeapon(playerid, 30);
							GivePlayerCash(playerid, - 35000);
						}
						else SendClientMessageEx(playerid, COLOR_GRAD2, MSG_NOMONEY);
					}
					case 13: { // M4 - $70000
						if(GetPlayerCash(playerid) >= 70000) {
							GivePlayerValidWeapon(playerid, 31);
							GivePlayerCash(playerid, - 70000);
						}
						else SendClientMessageEx(playerid, COLOR_GRAD2, MSG_NOMONEY);
					}
					case 14: { // Rifle - $10000
						if(GetPlayerCash(playerid) >= 10000) {
							GivePlayerValidWeapon(playerid, 33);
							GivePlayerCash(playerid, - 10000);
						}
						else SendClientMessageEx(playerid, COLOR_GRAD2, MSG_NOMONEY);
					}
					case 15: { // Sniper - $65000
						if(GetPlayerCash(playerid) >= 65000) {
							GivePlayerValidWeapon(playerid, 34);
							GivePlayerCash(playerid, - 65000);
						}
						else SendClientMessageEx(playerid, COLOR_GRAD2, MSG_NOMONEY);
					}
					case 16: { // Chainsaws - $20000
						if(GetPlayerCash(playerid) >= 20000) {
							GivePlayerValidWeapon(playerid, 9);
							GivePlayerCash(playerid, - 20000);
						}
						else SendClientMessageEx(playerid, COLOR_GRAD2, MSG_NOMONEY);
					}
					case 17: { // C4s - $50000
						if(GetPlayerCash(playerid) >= 20000) {
							PlayerInfo[playerid][pC4Get] = 1;
							PlayerInfo[playerid][pBombs]++;
							GivePlayerCash(playerid, -50000);
							SendClientMessageEx(playerid, COLOR_LIGHTBLUE,"   Ban da mua mot khoi C4!");
						}
						else SendClientMessageEx(playerid, COLOR_GRAD2, MSG_NOMONEY);
					}
				}
			}
		}
		case DIALOG_ORDER_HMASKIN:
		{
			if(response)	{
				new skin = strval(inputtext);
				if(IsInvalidSkin(skin)) {
					return ShowPlayerDialogEx(playerid, DIALOG_ORDER_HMASKIN, DIALOG_STYLE_INPUT, "Dong phuc","Trang phuc khong hop le. Chon cai khac.", "Lua chon", "Huy bo");
				}
				PlayerInfo[playerid][pModel] = skin;
				SetPlayerSkin(playerid, PlayerInfo[playerid][pModel]);
			}
			else {
				format(szMiscArray, sizeof(szMiscArray), "Mau va giap\t\t $2000\nVu khi\nDong phuc\nThay doi ten");
				ShowPlayerDialogEx(playerid, DIALOG_ORDER_HMA1, DIALOG_STYLE_LIST, "HMA Order Vu khi", szMiscArray, "Order", "Huy bo");
			}
		}
	}
	return 0;
}


CMD:contracts(playerid, params[])
{
    if(IsAHitman(playerid) || PlayerInfo[playerid][pAdmin] >= 4 || PlayerInfo[playerid][pASM] >= 1)
	{
        SearchingHit(playerid);
    }
    return 1;
}

CMD:order(playerid, params[])
{
	if (IsAHitman(playerid))
	{
	    if(IsPlayerInAnyVehicle(playerid)) return SendClientMessageEx(playerid, COLOR_GREY, "Ban khong the lam dieu nay ngay bay gio.");
		if(IsPlayerInRangeOfPoint(playerid, 4.0, 63.973995, 1973.618774, -68.786064) || IsPlayerInRangeOfPoint(playerid, 6.0, 1415.727905, -1299.371093, 15.054657))
		{
			if(PlayerInfo[playerid][pConnectHours] < 2 || PlayerInfo[playerid][pWRestricted] > 0) return SendClientMessageEx(playerid, COLOR_GRAD2, "Ban khong the su dung dieu nay vi ban dang bi han che so huu vu khi!");
			new string[128];
			format(string, sizeof(string), "Mau va giap\t\t $2000\nVu khi\nDong phuc\nThay doi ten");
			ShowPlayerDialogEx(playerid, DIALOG_ORDER_HMA1, DIALOG_STYLE_LIST, "HMA Order Vu khi", string, "Order", "Huy bo");
		}
		else
		{
			SendClientMessageEx(playerid, COLOR_GRAD2, " Ban khong o trong khu cua to chuc!");
			return 1;
		}
	}
	else
	{
		SendClientMessageEx(playerid, COLOR_GRAD2, "Ban khong phai la thanh vien cua to chuc hitman!");
		return 1;
	}
	return 1;
}

CMD:hbadge(playerid, params[])
{
    #if defined zombiemode
	if(zombieevent == 1 && GetPVarType(playerid, "pIsZombie")) return SendClientMessageEx(playerid, COLOR_GREY, "Zombie khong the su dung cai nay.");
	#endif
	if (IsAHitman(playerid))
	{
		new giveplayerid = 1;
 		if(sscanf(params, "d", giveplayerid)) {
			SendClientMessageEx(playerid, COLOR_GREY, "go /hbadge 0 de thiet lap lai");
		}
		if(giveplayerid == 0)
		{
			DeletePVar(playerid, "HitmanBadgeColour");
  			SendClientMessageEx(playerid, COLOR_WHITE, "Ban da dat huy hieu cua ban tro lai binh thuong.");
  			SetPlayerColor(playerid,TEAM_HIT_COLOR);
		}
		else
		{
			Group_ListGroups(playerid, DIALOG_HBADGE);
		}
	}
	return 1;
}

CMD:execute(playerid, params[])
{
	if(IsAHitman(playerid))
	{
		if(GoChase[playerid] != INVALID_PLAYER_ID || HitToGet[playerid] != INVALID_PLAYER_ID) {
			if(GetPVarInt(playerid, "KillShotCooldown") != 0 && gettime() < GetPVarInt(playerid, "KillShotCooldown") + 300) return SendClientMessageEx(playerid, COLOR_GRAD2, "Ban phai doi 5 phut de thuc hien lan tiep theo.");

			SetPVarInt(playerid, "ExecutionMode", 1);
			SendClientMessageEx(playerid, COLOR_GRAD2, " Ban da tai mot vong diem rong. Muc tieu cho nguoi dung dau khi thuc hien muc tieu cua ban. ");
			SetPVarInt(playerid, "KillShotCooldown", gettime());
		}
		else return SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong co hop dong hoat dong!");
	}
	return 1;
}

CMD:resetheadshot(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] >= 1337)
	{
		return SetPVarInt(playerid, "KillShotCooldown", gettime()-300);
	}
	return 1;
}

CMD:profile(playerid, params[])
{
	if(IsAHitman(playerid))
	{
		new string[600], giveplayerid;
		if(sscanf(params, "u", giveplayerid)) return SendClientMessageEx(playerid, COLOR_GREY, "Su dung: /profile [nguoi choi]");

		if(IsPlayerConnected(giveplayerid))
		{
		    new str2[64];
			if(0 <= PlayerInfo[giveplayerid][pMember] < MAX_GROUPS)
			{
				format(str2, sizeof(str2), "%s", arrGroupData[PlayerInfo[giveplayerid][pMember]][g_szGroupName]);
			}
			else str2 = "None";



			format(string, sizeof(string),
			"{FF6347}Ten: {BFC0C2}%s\n\
			{FF6347}Ngay sinh nhat: {BFC0C2}%s\n\
			{FF6347}So dien thoai: {BFC0C2}%d\n\n\
			{FF6347}Co quan: {BFC0C2}%s\n\
			{FF6347}tien thuong: {BFC0C2}$%d\n\
			{FF6347}Ly do: {BFC0C2}%s", GetPlayerNameEx(giveplayerid), PlayerInfo[giveplayerid][pBirthDate], PlayerInfo[giveplayerid][pPnumber], str2, PlayerInfo[giveplayerid][pHeadValue], PlayerInfo[giveplayerid][pContractDetail]);
			ShowPlayerDialogEx(playerid, DIALOG_NOTHING, DIALOG_STYLE_MSGBOX, "Ho so muc tieu", string, "OK", "");
		}
	}
	return 1;
}

CMD:ranks(playerid, params[])
{
	if ((!IsAHitman(playerid)) && PlayerInfo[playerid][pAdmin] < 4 && PlayerInfo[playerid][pASM] < 1) return SendClientMessageEx(playerid, COLOR_GREY, "Ban khong phai la thanh vien cua Hitman Agency!");
	SendClientMessageEx(playerid, COLOR_WHITE, "|__________________ Agency's Ranks __________________|");

	new string[128];
	foreach(new i : Player)
	{
		if((IsAHitman(i)))
		{
			if( GoChase[playerid] == INVALID_PLAYER_ID )
			{
				format(string, sizeof(string), "* Ten: %s | Cap bac %d | So luot da hoan thanh: %d | So luot that bai: %d", GetPlayerNameEx(i),PlayerInfo[i][pRank], PlayerInfo[i][pCHits], PlayerInfo[i][pFHits]);
				SendClientMessageEx(playerid, COLOR_GREY, string);
			}
			else
			{
				format(string, sizeof(string), "* Ten: %s | Cap bac %d | So luot da hoan thanh: %d | So luot that bai: %d | Duoi theo: %s", GetPlayerNameEx(i),PlayerInfo[i][pRank], PlayerInfo[i][pCHits], PlayerInfo[i][pFHits], GetPlayerNameEx(GoChase[i]));
				SendClientMessageEx(playerid, COLOR_GREY, string);
			}
		}
	}
	return 1;
}

CMD:plantcarbomb(playerid, params[]) {
	return cmd_pcb(playerid, params);
}

CMD:pcb(playerid, params[])
{
	if (IsAHitman(playerid))
	{
		if (PlayerInfo[playerid][pC4] == 0)
		{
			if (PlayerInfo[playerid][pBombs] != 0)
			{
				new carid = GetPlayerVehicleID(playerid);
				new closestcar = GetClosestCar(playerid, carid);
				if(IsPlayerInRangeOfVehicle(playerid, closestcar, 4.0))
				{
					if(VehicleBomb{closestcar} == 1)
					{
						SendClientMessageEx(playerid, COLOR_GRAD2, "Da co mot chiec C4 tren dong co xe!");
						return 1;
					}
					VehicleBomb{closestcar} = 1;
					PlacedVehicleBomb[playerid] = closestcar;
					ApplyAnimation(playerid,"BOMBER","BOM_Plant",4.0,0,0,0,0,0);
					ApplyAnimation(playerid,"BOMBER","BOM_Plant",4.0,0,0,0,0,0);
					SendClientMessageEx(playerid, COLOR_GREEN, "Ban da dat C4 tren dong co xe, /pickupbomb de loai bo bom.");
					PlayerInfo[playerid][pC4] = 1;
					PlayerInfo[playerid][pBombs]--;
					PlayerInfo[playerid][pC4Used] = 2;
				}
				else
				{
					SendClientMessageEx(playerid, COLOR_GRAD2, "Ban khong du gan voi bat ky chiec xe nao!");
					return 1;
				}
			}
			else
			{
				SendClientMessageEx(playerid, COLOR_GRAD2, "Ban khong co C4!");
				return 1;
			}
		}
		else
		{
			SendClientMessageEx(playerid, COLOR_GRAD2, " Ban chi co the dat 1 C4 moi lan ! ");
			return 1;
		}
	}
	else
	{
		SendClientMessageEx(playerid, COLOR_GRAD2, " Ban khong phai la thanh vien cua Hitman Agency ! ");
	}
	return 1;
}

CMD:plantbomb(playerid, params[]) {
	return cmd_pb(playerid, params);
}

CMD:pb(playerid, params[])
{
	if (IsAHitman(playerid))
	{
		if (PlayerInfo[playerid][pC4] == 0)
		{
			if (PlayerInfo[playerid][pBombs] != 0)
			{
				if(IsPlayerInAnyVehicle(playerid))
				{
					SendClientMessageEx(playerid, COLOR_LIGHTRED,"Ban khong the dat C4 khi dang o trong xe!");
					return 1;
				}
				GetPlayerPos(playerid, Positions[0][0], Positions[0][1], Positions[0][2]);
				SetPVarFloat(playerid, "DYN_C4_FLOAT_X", Positions[0][0]);
				SetPVarFloat(playerid, "DYN_C4_FLOAT_Y", Positions[0][1]);
				SetPVarFloat(playerid, "DYN_C4_FLOAT_Z", Positions[0][2]);
				new models[9] = {1654, 1230, 1778, 2814, 1271, 1328, 2919, 2770, 1840};
				ShowModelSelectionMenuEx(playerid, models, sizeof(models), "Chon mo hinh C4", 1338, 0.0, 0.0, 180.0);
			}
			else
			{
				SendClientMessageEx(playerid, COLOR_GRAD2, "Ban khong co C4!");
				return 1;
			}
		}
		else
		{
			SendClientMessageEx(playerid, COLOR_GRAD2, "Ban chi co the dat 1 C4 moi lan!");
			return 1;
		}
	}
	else
	{
		SendClientMessageEx(playerid, COLOR_GRAD2, "Ban khong phai la thanh vien cua Hitman Agency!");
	}
	return 1;
}

CMD:pub(playerid, params[]) {
	return cmd_pickupbomb(playerid, params);
}

CMD:pickupbomb(playerid, params[])
{
	if (!IsAHitman(playerid))
	{
		SendClientMessageEx(playerid, COLOR_GREY, "Ban khong phai la Hitman!");
		return 1;
	}
	if (PlayerInfo[playerid][pC4] == 0)
	{
		SendClientMessageEx(playerid, COLOR_GREY, "Ban da khong dat C4!");
		return 1;
	}
	new carid = GetPlayerVehicleID(playerid);
	new closestcar = GetClosestCar(playerid, carid);
	if(IsPlayerInRangeOfVehicle(playerid, closestcar, 4.0) && VehicleBomb{closestcar} == 1)
	{
		VehicleBomb{closestcar} = 0;
		PlacedVehicleBomb[playerid] = INVALID_VEHICLE_ID;
		PickUpC4(playerid);
		SendClientMessageEx(playerid, COLOR_GREEN, "Ban nhat bom thanh cong.");
		PlayerInfo[playerid][pBombs]++;
		PlayerInfo[playerid][pC4Used] = 0;
		PlayerInfo[playerid][pC4Get] = 1;
		return 1;
	}
	if(IsPlayerInRangeOfPoint(playerid, 3.0, GetPVarFloat(playerid, "DYN_C4_FLOAT_X"), GetPVarFloat(playerid, "DYN_C4_FLOAT_Y"), GetPVarFloat(playerid, "DYN_C4_FLOAT_Z")))
	{
		PickUpC4(playerid);
		SendClientMessageEx(playerid, COLOR_GREEN, "Bom da nhat thanh cong.");
		PlayerInfo[playerid][pBombs]++;
		PlayerInfo[playerid][pC4Used] = 0;
		PlayerInfo[playerid][pC4Get] = 1;
		return 1;
	}
	return 1;
}

CMD:myc4(playerid, params[])
{
	if (IsAHitman(playerid))
	{
		new string[128];

		if (PlayerInfo[playerid][pBombs] > 0)
		{
			format(string, sizeof(string), "Hien tai ban co %i C4 trong tui do.", PlayerInfo[playerid][pBombs]);
		}
		else
		{
			format(string, sizeof(string), "Ban khong co C4 trong tui do.");
		}

		SendClientMessageEx(playerid, COLOR_GRAD2, string);
	}

	return 1;
}

CMD:setmylevel(playerid, params[])
{
	if (!IsAHitman(playerid)) return SendClientMessageEx(playerid, COLOR_GREY, "Ban khong the dung lenh nay.");
	new level;
	if(sscanf(params, "d", level)) return SendClientMessageEx(playerid, COLOR_GREY, "Su dung: /setmylevel [cap do]");
	if(PlayerInfo[playerid][pLevel] < level)  return SendClientMessageEx(playerid, COLOR_GREY, "Cap do moi khong the lon hon cap do hien tai cua ban.");
	DeletePVar(playerid, "TempLevel");
	SetPVarInt(playerid, "TempLevel", level);
	SetPlayerScore(playerid, level);
	format(szMiscArray, sizeof(szMiscArray), "Ban da dat cap do cua minh thanh %d", level);
	return SendClientMessage(playerid, COLOR_LIGHTRED, szMiscArray);
}

CMD:givehit(playerid, params[])
{
	if (IsAHitman(playerid))
	{
		if(PlayerInfo[playerid][pRank] < 5)
		{
			SendClientMessageEx(playerid, COLOR_GREY, "   Chi cap bac 5 tro len moi co the giao hop dong cho moi nguoi !");
			return 1;
		}

		new string[128], giveplayerid, targetid;
		if(sscanf(params, "uu", giveplayerid, targetid)) return SendClientMessageEx(playerid, COLOR_GREY, "Su dung: /givehit [Nguoi choi] [muc tieu]");

		if(IsPlayerConnected(giveplayerid))
		{
			if(!ProxDetectorS(8.0, playerid, giveplayerid)) return SendClientMessageEx(playerid, COLOR_GREY, "Nguoi choi do khong o gan ban.");
			if(giveplayerid == targetid) return SendClientMessageEx(playerid, COLOR_GREY, "Ban khong the phat hanh luot truy cap den muc tieu.");
			if(GoChase[giveplayerid] != INVALID_PLAYER_ID)
			{
				SendClientMessageEx(playerid, COLOR_GREY, "   Hitman dang ban ron voi hop dong khac!");
				return 1;
			}
			if(GotHit[targetid] == 1)
			{
				SendClientMessageEx(playerid, COLOR_GREY, "   Mot ke tan cong khac da duoc chi dinh muc tieu nay!");
				return 1;
			}
			if(IsPlayerConnected(targetid))
			{
				if(PlayerInfo[targetid][pHeadValue] == 0)
				{
					SendClientMessageEx(playerid, COLOR_GREY, "   Muc tieu do khong co hop dong voi ho!");
					return 1;
				}

				format(string, sizeof(string), "* Ban duoc cung cap %s hop dong giet %s.", GetPlayerNameEx(giveplayerid), GetPlayerNameEx(targetid));
				SendClientMessageEx(playerid, COLOR_LIGHTBLUE, string);
				format(string, sizeof(string), "* Hitman %s da de nghi cho ban mot hop dong giet %s (go /accept contract), de chap nhan hop dong.", GetPlayerNameEx(playerid), GetPlayerNameEx(targetid));
				SendClientMessageEx(giveplayerid, COLOR_LIGHTBLUE, string);
				HitOffer[giveplayerid] = playerid;
				HitToGet[giveplayerid] = targetid;
				return 1;
			}
			else
			{
				SendClientMessageEx(playerid, COLOR_GREY, "   Nguoi ky hop dong dang ngoai tuyen, su dung /contracts!");
				return 1;
			}
		}
		else
		{
			SendClientMessageEx(playerid, COLOR_GREY, "   Khong co Hitman truc tuyen!");
			return 1;
		}
	}
	return 1;
}

CMD:givemehit(playerid, params[])
{
	if (IsAHitman(playerid))
	{
		new string[128], targetid;
		if(sscanf(params, "u", targetid)) return SendClientMessageEx(playerid, COLOR_GREY, "Su dung: /givemehit [muc tieu]");

		if(IsPlayerConnected(targetid))
		{
			if(GoChase[playerid] != INVALID_PLAYER_ID)
			{
				SendClientMessageEx(playerid, COLOR_GREY, "   Ban dang ban ron voi mot hop dong khac!");
				return 1;
			}
			if(GotHit[targetid] == 1)
			{
				SendClientMessageEx(playerid, COLOR_GREY, "   Mot ke tan cong khac da duoc chi dinh muc tieu nay!");
				return 1;
			}
			if(PlayerInfo[targetid][pHeadValue] == 0)
			{
				SendClientMessageEx(playerid, COLOR_GREY, "  Muc tieu do khong co hop dong voi ho!");
				return 1;
			}
			format(string, sizeof(string), "* Ban da cung cap cho minh mot hop dong de giet %s. (go /accept contract)", GetPlayerNameEx(targetid));
			SendClientMessageEx(playerid, COLOR_LIGHTBLUE, string);
			HitOffer[playerid] = playerid;
			HitToGet[playerid] = targetid;
			return 1;
		}
		else
		{
			SendClientMessageEx(playerid, COLOR_GREY, "   Nguoi ky hop dong dang ngoai tuyen, dung /contracts!");
			return 1;
		}
	}
	return 1;
}

CMD:deletehit(playerid, params[])
{
	if( PlayerInfo[playerid][pAdmin] >= 4 || PlayerInfo[playerid][pASM] >= 1 || (arrGroupData[PlayerInfo[playerid][pMember]][g_iGroupType] == GROUP_TYPE_CONTRACT && PlayerInfo[playerid][pRank] >= 5) || arrGroupData[PlayerInfo[playerid][pLeader]][g_iGroupType] == GROUP_TYPE_CONTRACT )
	{
		new string[128], giveplayerid;
		if(sscanf(params, "u", giveplayerid)) return SendClientMessageEx(playerid, COLOR_GREY, "Su dung: /deletehit [nguoi choi]");

		if(!IsPlayerConnected(giveplayerid))
		{
			SendClientMessageEx(playerid, COLOR_GREY, "Nguoi choi khong hop le.");
			return 1;
		}

		if(PlayerInfo[giveplayerid][pHeadValue] >= 1 )
		{
			PlayerInfo[giveplayerid][pHeadValue] = 0;
			format(string, sizeof(string), "<< %s(%d) da xoa hop dong %s(%d) >>", GetPlayerNameEx(playerid), GetPlayerSQLId(playerid), GetPlayerNameEx(giveplayerid), GetPlayerSQLId(giveplayerid));
			Log("logs/contracts.log", string);
			format(string, sizeof(string), "Ban da xoa hop dong %s's.", GetPlayerNameEx(giveplayerid) );
			SendClientMessageEx(playerid, COLOR_WHITE, string);
			GoChase[giveplayerid] = INVALID_PLAYER_ID;

			foreach(new i : Player)
			{
				if( HitToGet[i] == giveplayerid )
				{
					HitToGet[i] = INVALID_PLAYER_ID;
					HitOffer[i] = INVALID_PLAYER_ID;
				}
			}
		}
		else
		{
			SendClientMessageEx( playerid, COLOR_WHITE, "Khong co hop dong hoat dong voi nguoi choi do!" );
		}
	}
	return 1;
}

CMD:contract(playerid, params[])
{
	if(PlayerCuffed[playerid] != 0) return SendClientMessageEx(playerid, COLOR_GREY, "Ban khong the dat hop dong trong khi bi cong.");
	if(PlayerInfo[playerid][pJailTime] > 0) return SendClientMessageEx(playerid, COLOR_GREY, "Ban khong the dat hop dong khi o trong tu.");

	new string[128], giveplayerid, moneys, detail[32];
	if(sscanf(params, "uds[32]", giveplayerid, moneys, detail))
		return SendClientMessageEx(playerid, COLOR_GREY, "Su dung: /contract [nguoi choi] [so tien] [chi tiet]");

	if (IsPlayerConnected(giveplayerid) && giveplayerid != INVALID_PLAYER_ID)
	{
		if(giveplayerid == playerid)
			return SendClientMessageEx(playerid, COLOR_GREY, "Ban khong the dat hop dong chinh minh.");

		if(PlayerInfo[playerid][pLevel] < 3 || PlayerInfo[giveplayerid][pLevel] < 3)
			return SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong the dat hop dong tru khi ban va Hitman deu o tren cap do 3.");

		if(moneys < 50000 || moneys > 3000000)
			return SendClientMessageEx(playerid, COLOR_GREY, "Ban khong the dat cac hop dong it hon $50.000 hoac nhieu hon $3,000,000.");

		if((moneys < 50000 || moneys > 3000000) && IsACop(giveplayerid))
			return SendClientMessageEx(playerid, COLOR_GREY, "So tien trung toi thieu cho mot nhan vien thuc thi phap luat la $150,000.");

		if(PlayerInfo[playerid][pMember] != INVALID_GROUP_ID && arrGroupData[PlayerInfo[playerid][pMember]][g_iGroupType] == GROUP_TYPE_CONTRACT)
			return SendClientMessageEx(playerid, COLOR_GREY, "Ban khong the lam dieu nay de tiep tuc.");

		if(PlayerInfo[giveplayerid][pHeadValue] >= 3000000 || moneys + PlayerInfo[giveplayerid][pHeadValue] > 3000000)
			return SendClientMessageEx(playerid, COLOR_GREY, "Nguoi do co toi da tren dau cua ho.");

		if(PlayerInfo[playerid][pJailTime] > 0 || PlayerCuffed[playerid] > 0)
			return SendClientMessageEx(playerid, COLOR_GREY, "Ban khong the lam dieu nay ngay bay gio");

		if (moneys > 0 && GetPlayerCash(playerid) >= moneys)
		{
			if(strlen(detail) > 32) return SendClientMessageEx(playerid, COLOR_GRAD1, "Chi tiet hop dong khong the dai hon 32 ky tu.");
			GivePlayerCash(playerid, (0 - moneys));
			PlayerInfo[giveplayerid][pHeadValue] += moneys;
			strmid(PlayerInfo[giveplayerid][pContractBy], GetPlayerNameEx(playerid), 0, strlen(GetPlayerNameEx(playerid)), MAX_PLAYER_NAME);
			strmid(PlayerInfo[giveplayerid][pContractDetail], detail, 0, strlen(detail), 32);
			format(string, sizeof(string), "%s da dat hop dong %s gia $%s, chi tiet: %s", GetPlayerNameEx(playerid), GetPlayerNameEx(giveplayerid), number_format(moneys), detail);
			SendGroupMessage(GROUP_TYPE_CONTRACT, COLOR_YELLOW, string);
			format(string, sizeof(string), "* ban da dat hop dong %s gia $%s, chi tiet: %s", GetPlayerNameEx(giveplayerid), number_format(moneys), detail);
			SendClientMessageEx(playerid, COLOR_LIGHTBLUE, string);
			format(string, sizeof(string), "<< %s da dat hop dong %s gia $%s, chi tiet: %s >>", GetPlayerNameEx(playerid), GetPlayerNameEx(giveplayerid), number_format(moneys), detail);
			Log("logs/contracts.log", string);
			format(string, sizeof(string), "%s da dat hop dong %s gia $%s, chi tiet: %s", GetPlayerNameEx(playerid), GetPlayerNameEx(giveplayerid), number_format(moneys), detail);
			ABroadCast(COLOR_YELLOW, string, 2);
			PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
		}
		else
		{
			SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong co du tien cho viec nay.");
		}
	}
	else
	{
		SendClientMessageEx(playerid, COLOR_GRAD1, "Nguoi choi khong hop le.");
	}
	return 1;
}

CMD:knife(playerid, params[])
{
	if(IsAHitman(playerid)) {
		if(GetPVarInt(playerid, "HidingKnife") == 1) {
			GivePlayerValidWeapon(playerid, 4);
			DeletePVar(playerid, "HidingKnife");
			SendClientMessageEx(playerid, COLOR_YELLOW, "Ban da rut dao ra.");
		}
		else {
			if(PlayerInfo[playerid][pGuns][1] == WEAPON_KNIFE) {
				RemovePlayerWeapon(playerid, 4); // Remove Knife
				SetPVarInt(playerid, "HidingKnife", 1);
				SendClientMessageEx(playerid, COLOR_YELLOW, "Ban da giau con dao cua ban.");
			}
			else {
				SendClientMessageEx(playerid, COLOR_WHITE, "Ban khong co san dao.");
			}
		}
	}
	return 1;
}
