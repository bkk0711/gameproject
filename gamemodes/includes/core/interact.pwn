/*

	 /$$   /$$  /$$$$$$          /$$$$$$$  /$$$$$$$
	| $$$ | $$ /$$__  $$        | $$__  $$| $$__  $$
	| $$$$| $$| $$  \__/        | $$  \ $$| $$  \ $$
	| $$ $$ $$| $$ /$$$$ /$$$$$$| $$$$$$$/| $$$$$$$/
	| $$  $$$$| $$|_  $$|______/| $$__  $$| $$____/
	| $$\  $$$| $$  \ $$        | $$  \ $$| $$
	| $$ \  $$|  $$$$$$/        | $$  | $$| $$
	|__/  \__/ \______/         |__/  |__/|__/

						Interaction System Revision
						  Remastered by Winterfield

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

CMD:interact(playerid, params[])
{
	new id;

	if(sscanf(params, "u", id)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /interact [playerid]");

	if(IsPlayerConnected(id))
	{
		if(!ProxDetectorS(8.0, playerid, GetPVarInt(playerid, "pInteract"))) return SendClientMessageEx(playerid, COLOR_GREY, "Nguoi choi khong o gan ban!.");
		if(id == playerid) return SendClientMessageEx(playerid, COLOR_GREY, "Ban khong the tuong tac voi chinh minh.");
		SetPVarInt(playerid, "pInteract", id);
		ShowInteractionMenu(playerid, 0);
	}
	else SendClientMessageEx(playerid, COLOR_GRAD1, "Nguoi choi khong duoc ket noi!");
	return 1;
}

ShowInteractionMenu(playerid, menu)
{
	szMiscArray[0] = 0;
	if(!ProxDetectorS(8.0, playerid, GetPVarInt(playerid, "pInteract"))) return SendClientMessageEx(playerid, COLOR_GREY, "Nguoi choi ban da co gang tuong tac khong o gan ban."); // An extra check never hurts! - Winterfield

	switch(menu)
	{
		case 0: // Main Menu
		{
			DeletePVar(playerid, "pGiving");
			DeletePVar(playerid, "pSelling");

			format(szMiscArray, sizeof(szMiscArray), "Pay\nGive Item\nSell Item\nLuc soat\nShow License");

			if(IsACop(playerid)) format(szMiscArray, sizeof(szMiscArray), "%s\nCop", szMiscArray);
			if(IsAMedic(playerid)) format(szMiscArray, sizeof(szMiscArray), "%s\nMedic", szMiscArray);
			if(IsADocGuard(playerid)) format(szMiscArray, sizeof(szMiscArray), "%s\nGuard", szMiscArray);

			ShowPlayerDialogEx(playerid, DIALOG_INTERACT, DIALOG_STYLE_LIST, "Menu Tuong Tac", szMiscArray, "Chon", "Thoat");
		}
		case 1: // Give / Sell
		{
			format(szMiscArray, sizeof(szMiscArray), "Item\tCurrent Amount\n\
				Drugs\n\
				Weapons\n\
				Materials\t%d\n\
				Syringes\t%d\n\
				Sprunk\t%d\n\
				Fireworks\t%d",
				PlayerInfo[playerid][pMats],
				PlayerInfo[playerid][pSyringes],
				PlayerInfo[playerid][pSprunk],
				PlayerInfo[playerid][pFirework]);

			if(GetPVarInt(playerid, "pGiving")) ShowPlayerDialogEx(playerid, DIALOG_INTERACT_GIVEITEM, DIALOG_STYLE_TABLIST_HEADERS, "Menu Tuong Tac - Give", szMiscArray, "Chon", "Thoat");
			else if(GetPVarInt(playerid, "pSelling")) ShowPlayerDialogEx(playerid, DIALOG_INTERACT_SELLITEM, DIALOG_STYLE_TABLIST_HEADERS, "Menu Tuong Tac - Sell", szMiscArray, "Chon", "Thoat");
		}
	}
	return 1;
}

hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[]) {

	if(arrAntiCheat[playerid][ac_iFlags][AC_DIALOGSPOOFING] > 0) return 1;
	switch(dialogid)
	{
		case DIALOG_INTERACT:
		{
			if(!response) return 1;
			if(!IsPlayerConnected(GetPVarInt(playerid, "pInteract"))) return SendClientMessage(playerid, COLOR_GRAD1, "Nguoi choi ma ban dang tuong tac da ngat ket noi!");
			if(!ProxDetectorS(8.0, playerid, GetPVarInt(playerid, "pInteract"))) return SendClientMessageEx(playerid, COLOR_GREY, "Nguoi choi ma ban tuong tac da khong o gan ban.");

			szMiscArray[0] = 0;
			switch(listitem)
			{
				case 0: ShowPlayerDialogEx(playerid, DIALOG_INTERACT_PAY, DIALOG_STYLE_INPUT, "Menu Tuong Tac - Pay", "Ban muon chuyen bao nhieu?", "Chon", "Thoat"); // Pay
				case 1: // Give
				{
					SetPVarInt(playerid, "pGiving", 1);
					ShowInteractionMenu(playerid, 1);
				}
				case 2: // Sell
				{
					SetPVarInt(playerid, "pSelling", 1);
					ShowInteractionMenu(playerid, 1);
				}
				case 3: // Frisk
				{
					new id[3];
					valstr(id, GetPVarInt(playerid, "pInteract"));

					cmd_frisk(playerid, id);
				}
				case 4: // Show License
				{
					new id[3];
					valstr(id, GetPVarInt(playerid, "pInteract"));

					cmd_showlicenses(playerid, id);
				}
			}

			if(listitem == 5 && IsACop(playerid))
			{
				format(szMiscArray, sizeof(szMiscArray), "(Un)cuff\nJailcuff\nDan di\nDua len xe\nVe phat\nTich thu", szMiscArray);
				ShowPlayerDialogEx(playerid, DIALOG_INTERACT_COP, DIALOG_STYLE_LIST, "Menu Tuong Tac - Canh Sat", szMiscArray, "Chon", "Thoat");
			}
			if(listitem == 5 && IsAMedic(playerid))
			{
				format(szMiscArray, sizeof(szMiscArray), "Di chuyen benh nhan\nTai Benh Nhan\nThu nghiem\nHeal", szMiscArray);
				ShowPlayerDialogEx(playerid, DIALOG_INTERACT_MEDIC, DIALOG_STYLE_LIST, "Menu Tuong Tac - Bac Si", szMiscArray, "Chon", "Thoat");
			}
			if(listitem == 5 && IsADocGuard(playerid))
			{
				format(szMiscArray, sizeof(szMiscArray), "(Un)cuff\nJailcuff\nDan di\nDua len xe\nTich thu\nGia Han Tu\nGiam An Tu\nIsolate", szMiscArray);
				ShowPlayerDialogEx(playerid, DIALOG_INTERACT_GUARD, DIALOG_STYLE_LIST, "Menu Tuong Tac - DoC", szMiscArray, "Chon", "Thoat");
			}
		}
		case DIALOG_INTERACT_PAY: 
		{
			if(!response) return 1;
			if(!IsPlayerConnected(GetPVarInt(playerid, "pInteract"))) return SendClientMessage(playerid, COLOR_GRAD1, "Nguoi choi ma ban dang tuong tac da ngat ket noi!");
			if(!ProxDetectorS(8.0, playerid, GetPVarInt(playerid, "pInteract"))) return SendClientMessageEx(playerid, COLOR_GREY, "Nguoi choi ma ban dang tuong tac da khong o gan ban.");

			new id[3], realstring[50];
			valstr(id, GetPVarInt(playerid, "pInteract"));
			format(realstring, 50, "%s %s", id, inputtext);

			cmd_pay(playerid, realstring);
		}
		case DIALOG_INTERACT_GIVEITEM:
		{
			if(!response) return 1;
			if(!IsPlayerConnected(GetPVarInt(playerid, "pInteract"))) return SendClientMessage(playerid, COLOR_GRAD1, "Nguoi choi ma ban dang tuong tac da ngat ket noi!");
			if(!ProxDetectorS(8.0, playerid, GetPVarInt(playerid, "pInteract"))) return SendClientMessageEx(playerid, COLOR_GREY, "Nguoi choi ma ban dang tuong tac da khong o gan ban.");

			switch(listitem)
			{
				case 0:
				{
					szMiscArray[0] = 0;
					for(new i; i < sizeof(Drugs); i++) format(szMiscArray, sizeof(szMiscArray), "%s\n{A9C4E4}%s {FFFFFF}(%dg){A9C4E4}", szMiscArray, GetDrugName(i), PlayerInfo[playerid][pDrugs][i]);

					ShowPlayerDialogEx(playerid, DIALOG_INTERACT_GI_DRUGS, DIALOG_STYLE_LIST, "Menu Tuong Tac - Give Item (Drugs)", szMiscArray, "Chon", "Thoat");
				}
				case 1:
				{
					szMiscArray[0] = 0;
					new weapon[16], weapons[13][2];
					for (new i = 0; i <= 12; i++) 
					{
						GetPlayerWeaponData(playerid, i, weapons[i][0], weapons[i][1]);
						GetWeaponName(weapons[i][0], weapon, sizeof(weapon));
						if(PlayerInfo[playerid][pGuns][i] == weapons[i][0]) format(szMiscArray, sizeof(szMiscArray), "%s\n{A9C4E4}%s {FFFFFF}(%d){A9C4E4}", szMiscArray, weapon, weapons[i][0]);
					}

					ShowPlayerDialogEx(playerid, DIALOG_INTERACT_GI_WEAPON, DIALOG_STYLE_LIST, "Menu Tuong Tac - Give Item (Weapons)", szMiscArray, "Chon", "Thoat");
				}
			}
		}
		case DIALOG_INTERACT_COP:
		{
			if(!response) return 1;
			if(!IsPlayerConnected(GetPVarInt(playerid, "pInteract"))) return SendClientMessage(playerid, COLOR_GRAD1, "Nguoi choi ma ban dang tuong tac da ngat ket noi!");
			if(!ProxDetectorS(8.0, playerid, GetPVarInt(playerid, "pInteract"))) return SendClientMessageEx(playerid, COLOR_GREY, "Nguoi choi ma ban dang tuong tac da khong o gan ban.");

			switch(listitem)
			{
				case 0: // (Un)cuff
				{
					new id[3];
					valstr(id, GetPVarInt(playerid, "pInteract"));

					if(PlayerCuffed[GetPVarInt(playerid, "pInteract")] > 1) cmd_uncuff(playerid, id);
					else cmd_cuff(playerid, id);
				}
				case 1: // Jailcuff
				{
					new id[3];
					valstr(id, GetPVarInt(playerid, "pInteract"));

					cmd_jailcuff(playerid, id);
				}
				case 2: // Drag
				{
					new id[3];
					valstr(id, GetPVarInt(playerid, "pInteract"));

					cmd_drag(playerid, id);
				}
				case 3: ShowPlayerDialogEx(playerid, DIALOG_INTERACT_DETAIN, DIALOG_STYLE_INPUT, "Menu Tuong Tac - Dua Len Xe", "Vui long chon so ghe ma ban muon dua len xe. (1-3)", "Chon", "Thoat");
				case 4: ShowPlayerDialogEx(playerid, DIALOG_INTERACT_TICKET, DIALOG_STYLE_INPUT, "Menu Tuong Tac - Ve Phat", "Vui long chon so tien ma ban muon phat.", "Chon", "Thoat");
				case 5: ShowPlayerDialogEx(playerid, DIALOG_INTERACT_CONFISCATE, DIALOG_STYLE_LIST, "Menu Tuong Tac - Tich thu", "Weapons\nPot\nCrack\nMeth\nEcstasy\nMaterials\nRadio\nHeroin\nRawopium\nSyringes\nPotSeeds\nOpiumSeeds\nDrugCrates", "Chon", "Thoat");
			}
		}
		case DIALOG_INTERACT_MEDIC:
		{
			if(!response) return 1;
			if(!IsPlayerConnected(GetPVarInt(playerid, "pInteract"))) return SendClientMessage(playerid, COLOR_GRAD1, "Nguoi choi ma ban dang tuong tac da ngat ket noi!");
			if(!ProxDetectorS(8.0, playerid, GetPVarInt(playerid, "pInteract"))) return SendClientMessageEx(playerid, COLOR_GREY, "Nguoi choi ma ban dang tuong tac da khong o gan ban.");

			switch(listitem)
			{
				case 0: // Move Patient
				{
					new id[3];
					valstr(id, GetPVarInt(playerid, "pInteract"));

					cmd_movept(playerid, id);
				}
				case 1: // Load Patient
				{
					new id[3], seat = -1, realstring[50];
					valstr(id, GetPVarInt(playerid, "pInteract"));

					new carid = gLastCar[playerid];
                    if(IsAnAmbulance(carid))
					{
						for(new i = 2; i < 3; i++)
                        if(!IsVehicleOccupied(carid, i)) { seat = i; break; } 
					}
					else return 1;
					format(realstring, 50, "%s %d", id, seat);

					if(seat != -1) cmd_loadpt(playerid, realstring);
				}
				case 2: // Jailcuff
				{
					new id[3];
					valstr(id, GetPVarInt(playerid, "pInteract"));

					cmd_jailcuff(playerid, id);
				}
				case 3: // Triage
				{
					new id[3];
					valstr(id, GetPVarInt(playerid, "pInteract"));

					cmd_triage(playerid, id);
				}
				case 4: ShowPlayerDialogEx(playerid, DIALOG_INTERACT_HEAL, DIALOG_STYLE_INPUT, "Menu Tuong Tac - Heal", "Ban muon chua benh cho benh nhan gia bao nhieu? ($200 - $1,000)", "Chon", "Thoat");
			}
		}
		case DIALOG_INTERACT_GUARD:
		{
			if(!response) return 1;
			if(!IsPlayerConnected(GetPVarInt(playerid, "pInteract"))) return SendClientMessage(playerid, COLOR_GRAD1, "Nguoi choi ma ban dang tuong tac da ngat ket noi!");
			if(!ProxDetectorS(8.0, playerid, GetPVarInt(playerid, "pInteract"))) return SendClientMessageEx(playerid, COLOR_GREY, "Nguoi choi ma ban dang tuong tac da khong o gan ban.");

			switch(listitem)
			{
				case 0: // (Un)cuff
				{
					new id[3];
					valstr(id, GetPVarInt(playerid, "pInteract"));

					if(PlayerCuffed[GetPVarInt(playerid, "pInteract")] > 1) cmd_uncuff(playerid, id);
					else cmd_cuff(playerid, id);
				}
				case 1: // Jailcuff
				{
					new id[3];
					valstr(id, GetPVarInt(playerid, "pInteract"));

					cmd_jailcuff(playerid, id);
				}
				case 2: // Drag
				{
					new id[3];
					valstr(id, GetPVarInt(playerid, "pInteract"));

					cmd_drag(playerid, id);
				}
				case 3: ShowPlayerDialogEx(playerid, DIALOG_INTERACT_DETAIN, DIALOG_STYLE_INPUT, "Menu Tuong Tac - Dua len xe", "Vui long chon so ghe ma ban muon dua len xe. (1-3)", "Chon", "Thoat");
				case 4: ShowPlayerDialogEx(playerid, DIALOG_INTERACT_CONFISCATE, DIALOG_STYLE_LIST, "Menu Tuong Tac - Tich Thu", "Weapons\nPot\nCrack\nMeth\nEcstasy\nMaterials\nRadio\nHeroin\nRawopium\nSyringes\nPotSeeds\nOpiumSeeds\nDrugCrates", "Chon", "Thoat");
				case 5: ShowPlayerDialogEx(playerid, DIALOG_INTERACT_EXTEND, DIALOG_STYLE_INPUT, "Menu Tuong Tac - Gia Han Tu", "Ban muon gia han an tu bao nhieu? (1 - 30)", "Chon", "Thoat");
				case 6: ShowPlayerDialogEx(playerid, DIALOG_INTERACT_REDUCE, DIALOG_STYLE_INPUT, "Menu Tuong Tac - Giam An Tu", "Ban muon giam an tu bao nhieu? (1 - 30)", "Chon", "Thoat");
				case 7: ShowPlayerDialogEx(playerid, DIALOG_INTERACT_ISOLATION, DIALOG_STYLE_LIST, "Menu Tuong Tac - Isolation", "IC Isolation\nOOC Isolation", "Chon", "Thoat");
			}
		}
	}
	return 0;
}
