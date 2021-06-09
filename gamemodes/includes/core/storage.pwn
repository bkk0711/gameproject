/*

	 /$$   /$$  /$$$$$$          /$$$$$$$  /$$$$$$$
	| $$$ | $$ /$$__  $$        | $$__  $$| $$__  $$
	| $$$$| $$| $$  \__/        | $$  \ $$| $$  \ $$
	| $$ $$ $$| $$ /$$$$ /$$$$$$| $$$$$$$/| $$$$$$$/
	| $$  $$$$| $$|_  $$|______/| $$__  $$| $$____/
	| $$\  $$$| $$  \ $$        | $$  \ $$| $$
	| $$ \  $$|  $$$$$$/        | $$  | $$| $$
	|__/  \__/ \______/         |__/  |__/|__/

						Storage System

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

stock ShowStorageEquipDialog(playerid)
{
	if(gPlayerLogged{playerid} != 1) return SendClientMessageEx(playerid, COLOR_WHITE, "You are not logged in!");

	new dialogstring[256];
	new epstring[][] = { "Unequipped", "Equipped", "Not Owned" };

	for(new i = 0; i < 3; i++)
	{
		format(dialogstring, sizeof(dialogstring), "%s%s", dialogstring, storagetype[i+1]);
		if(StorageInfo[playerid][i][sStorage] != 1) format(dialogstring, sizeof(dialogstring), "%s (%s)\n", dialogstring, epstring[2]);
		else format(dialogstring, sizeof(dialogstring), "%s (%s)\n", dialogstring, epstring[StorageInfo[playerid][i][sAttached]]);
	}

	ShowPlayerDialogEx(playerid, STORAGEEQUIP, DIALOG_STYLE_LIST, "Storage - Equip/Unequip", dialogstring, "Chon", "Ra");
	return 1;
}

/*stock ShowStorageDialog(playerid, fromplayerid, fromstorageid, itemid, amount, price, special)
{
	new titlestring[128], dialogstring[512];

	SetPVarInt(playerid, "Storage_transaction", 1); // Prevent double transactions.
	SetPVarInt(playerid, "Storage_fromplayerid", fromplayerid);
	SetPVarInt(playerid, "Storage_fromstorageid", fromstorageid);
	SetPVarInt(playerid, "Storage_itemid", itemid);
	SetPVarInt(playerid, "Storage_amount", amount);
	SetPVarInt(playerid, "Storage_price", price);
	SetPVarInt(playerid, "Storage_special", special);

	if(price == -1) format(titlestring, sizeof(titlestring), "Where do you want to store %d %s?", amount, itemtype[itemid]);
	else format(titlestring, sizeof(titlestring), "You are buying %d %s for %d", amount, itemtype[itemid], price);

	switch(itemid)
	{
		case 1:
		{
			format(dialogstring, sizeof(dialogstring), "Hand/Pocket - ($%d)\n", PlayerInfo[playerid][pCash]);
			for(new i = 0; i < 3; i++)
			{
				if(StorageInfo[playerid][i][sAttached] == 1)
				{
					format(dialogstring, sizeof(dialogstring), "%s(%s) - ($%d/$%d)\n", dialogstring, storagetype[i+1], StorageInfo[playerid][i][sCash], limits[i+1][0]);
				}
			}

			//format(dialogstring, sizeof(dialogstring), "Hand/Pocket - ($%d)\nBag - ($%d/$%d)\nBackpack - ($%d/$%d)\nBriefcase - ($%d/$%d)",
				//PlayerInfo[playerid][pCash],
				//StorageInfo[playerid][0][sCash],
				//bbackpacklimit[itemid-1],
				//StorageInfo[playerid][1][sCash],
				//backpacklimit[itemid-1],
				//StorageInfo[playerid][2][sCash],
				//briefcaselimit[itemid-1]
			//);
		}
		case 2:
		{
			format(dialogstring, sizeof(dialogstring), "Hand/Pocket - (%d)\n", PlayerInfo[playerid][pPot]);
			for(new i = 0; i < 3; i++)
			{
				if(StorageInfo[playerid][i][sAttached] == 1)
				{
					format(dialogstring, sizeof(dialogstring), "%s(%s) - (%d/%d)\n", dialogstring, storagetype[i+1], StorageInfo[playerid][i][sPot], limits[i+1][0]);
				}
			}

			//format(dialogstring, sizeof(dialogstring), "Hand/Pocket - (%d/%d)\nBag - (%d/%d)\nBackpack - (%d/%d)\nBriefcase - (%d/%d)",
				//PlayerInfo[playerid][pPot],
				//onhandlimit[itemid-1],
				//StorageInfo[playerid][0][sPot],
				//bbackpacklimit[itemid-1],
				//StorageInfo[playerid][1][sPot],
				//backpacklimit[itemid-1],
				//StorageInfo[playerid][2][sPot],
				//briefcaselimit[itemid-1]
			//);
		}
		case 3:
		{
			format(dialogstring, sizeof(dialogstring), "Hand/Pocket - ($%d)\n", PlayerInfo[playerid][pCrack]);
			for(new i = 0; i < 3; i++)
			{
				if(StorageInfo[playerid][i][sAttached] == 1)
				{
					format(dialogstring, sizeof(dialogstring), "%s(%s) - (%d/%d)\n", dialogstring, storagetype[i+1], StorageInfo[playerid][i][sCrack], limits[i+1][0]);
				}
			}

			//format(dialogstring, sizeof(dialogstring), "Hand/Pocket - (%d/%d)\nBag - (%d/%d)\nBackpack - (%d/%d)\nBriefcase - (%d/%d)",
				//PlayerInfo[playerid][pCrack],
				//onhandlimit[itemid-1],
				//StorageInfo[playerid][0][sCrack],
				//bbackpacklimit[itemid-1],
				//StorageInfo[playerid][1][sCrack],
				//backpacklimit[itemid-1],
				//StorageInfo[playerid][2][sCrack],
				//briefcaselimit[itemid-1]
			//);
		}
		case 4:
		{
			format(dialogstring, sizeof(dialogstring), "Hand/Pocket - (%d)\n", PlayerInfo[playerid][pMats]);
			for(new i = 0; i < 3; i++)
			{
				if(StorageInfo[playerid][i][sAttached] == 1)
				{
					format(dialogstring, sizeof(dialogstring), "%s(%s) - (%d/%d)\n", dialogstring, storagetype[i+1], StorageInfo[playerid][i][sMats], limits[i+1][3]);
				}
			}

			//format(dialogstring, sizeof(dialogstring), "Hand/Pocket - (%d/%d)\nBag - (%d/%d)\nBackpack - (%d/%d)\nBriefcase - (%d/%d)",
				//PlayerInfo[playerid][pMats],
				//onhandlimit[itemid-1],
				//StorageInfo[playerid][0][sMats],
				//bbackpacklimit[itemid-1],
				//StorageInfo[playerid][1][sMats],
				//backpacklimit[itemid-1],
				//StorageInfo[playerid][2][sMats],
				//briefcaselimit[itemid-1]
			//);
		}
	}

	ShowPlayerDialogEx(playerid, STORAGESTORE, DIALOG_STYLE_LIST, titlestring, dialogstring, "Choose", "Cancel");
}

stock DeathDrop(playerid)
{
	new storageid;
	new bool:itemEquipped = false;
	for(new i = 0; i < 3; i++)
	{
		if(StorageInfo[playerid][i][sAttached] == 1) {
			storageid = i;
			if(storageid != 0) itemEquipped = true; // Bag is exempted from death drops.
		}
	}

	if(itemEquipped == true)
	{

		new rand = random(101);

		switch (PlayerInfo[playerid][pDonateRank])
		{
			case 0: // Normal (50 Percent)
			{
				if(rand > 0 && rand <= 50) {
					StorageInfo[playerid][storageid][sCash] = 0;
					StorageInfo[playerid][storageid][sPot] = 0;
					StorageInfo[playerid][storageid][sCrack] = 0;
					StorageInfo[playerid][storageid][sMats] = 0;

					return SendClientMessageEx(playerid, COLOR_RED, "You have lost all items within your storage device.");
				}
				else return SendClientMessageEx(playerid, COLOR_YELLOW, "Luck is on your side today, you didn't lose any items within your storage device.");
			}
			case 1: // BVIP (40 Percent)
			{
				if(rand > 0 && rand <= 40) {
					StorageInfo[playerid][storageid][sCash] = 0;
					StorageInfo[playerid][storageid][sPot] = 0;
					StorageInfo[playerid][storageid][sCrack] = 0;
					StorageInfo[playerid][storageid][sMats] = 0;

					return SendClientMessageEx(playerid, COLOR_RED, "You have lost all items within your storage device.");
				}
				else return SendClientMessageEx(playerid, COLOR_YELLOW, "Luck is on your side today, you didn't lose any items within your storage device.");
			}
			case 2: // SVIP (30 Percent)
			{
				if(rand > 0 && rand <= 30) {
					StorageInfo[playerid][storageid][sCash] = 0;
					StorageInfo[playerid][storageid][sPot] = 0;
					StorageInfo[playerid][storageid][sCrack] = 0;
					StorageInfo[playerid][storageid][sMats] = 0;

					return SendClientMessageEx(playerid, COLOR_RED, "You have lost all items within your storage device.");
				}
				else return SendClientMessageEx(playerid, COLOR_YELLOW, "Luck is on your side today, you didn't lose any items within your storage device.");
			}
			case 3: // GVIP (20 Percent)
			{
				if(rand > 0 && rand <= 20) {
					StorageInfo[playerid][storageid][sCash] = 0;
					StorageInfo[playerid][storageid][sPot] = 0;
					StorageInfo[playerid][storageid][sCrack] = 0;
					StorageInfo[playerid][storageid][sMats] = 0;

					return SendClientMessageEx(playerid, COLOR_RED, "You have lost all items within your storage device.");
				}
				else return SendClientMessageEx(playerid, COLOR_YELLOW, "Luck is on your side today, you didn't lose any items within your storage device.");
			}
			case 4: // PVIP (No Chance)
			{
				return SendClientMessageEx(playerid, COLOR_YELLOW, "Since you are Platinum VIP, you lose nothing from storage device.");
			}
			case 5: // Moderator (No Chance)
			{
				return SendClientMessageEx(playerid, COLOR_YELLOW, "Since you are (Moderator) Platinum VIP, you lose nothing from storage device.");
			}
		}
	}
	return 1;
}

// Doc SU DUNG:
// playerid - Person Reciving the Item's Amount. (Who is storing the amount)
// storageid - PlayerID's storage index. (Where to store sending amount)
// fromplayerid - Person Giving the Item's Amount. (Notice: Use -1 if from a non-player, script-based etc.).
// fromstorageid - FromStorageID's storage index. (Notice: Use -1 if from a non-player, script-based etc.)
// itemid - ItemID index that is tradeing, used for both. (What is storing)
// amount - The amount of ItemID that is tradeing, used for both. (What amount is storing)
// price - The price of the transaction (in pCash), sent to playerid from sender. (Notice: Use -1 if no price is required)
// special - Set this to 1 if function is being used by skills or other things. (Notice: Use -1 if no special is required)

// ItemIDs:
// 0 - Nothing
// 1 - Cash
// 2 - Pot
// 3 - Crack
// 4 - Materials

// StorageIDs:
// 0 - Pocket/OnHand
// 1 - Bag
// 2 - Backpack
// 3 - Briefcase
*/

stock TransferStorage(playerid, storageid, fromplayerid, fromstorageid, itemid, amount, price, special)
{
	if(playerid == fromplayerid)
	{
		return SendClientMessageEx(playerid, COLOR_WHITE, "LOI! Ban khong the chuyen tu chinh minh sang chinh minh");
	}

	storageid=0; fromstorageid=0; //temp
	//printf("TransferStorage(playerid=%d, storageid=%d, fromplayerid=%d, fromstorageid=%d, itemid=%d, amount=%d, price=%d, special=%d)", playerid, storageid, fromplayerid, fromstorageid, itemid, amount, price, special);

	if(GetPVarInt(playerid, "Storage_transaction") == 1)
	{
		if(fromplayerid != -1 && fromstorageid != -1) {
			SendClientMessageEx(fromplayerid, COLOR_WHITE, "Nguoi choi dang ban ron voi mot giao dich hien co.");
		}
		return 0;
	}

	new string[128];

	// Disable Prices for Cash Transfers
	if(price != -1 && itemid == 1) price = -1;

	// Ask the player where to store
	if(storageid == -1)
	{
		//UNCOMMENT WHEN RE RELEASE
		//ShowStorageDialog(playerid, fromplayerid, fromstorageid, itemid, amount, price, special);
		return 0;
	}

	// Check if such item is equipped.
	if(storageid > 0 && storageid < 4)
	{
		if(StorageInfo[playerid][storageid-1][sAttached] == 0)
		{
			format(string, sizeof(string), "Ban khong co %s equipped!", storagetype[storageid]);
			SendClientMessageEx(playerid, COLOR_WHITE, string);
			return 0;
		}
	}

	if(fromplayerid != -1 && fromstorageid != -1)
	{
		if(!IsPlayerConnected(fromplayerid)) return 0;
		if(amount < 0) return 0;

		if(fromstorageid > 0 && fromstorageid < 4)
		{
			if(StorageInfo[fromplayerid][fromstorageid-1][sAttached] == 0)
			{
				format(string, sizeof(string), "Ban khong co %s equipped!", storagetype[fromstorageid]);
				SendClientMessageEx(fromplayerid, COLOR_WHITE, string);
				return 0;
			}
		}
	}

    if(special == 1 && itemid == 2) // Pot Special "Selling"
	{
		ExtortionTurfsWarsZone(PotOffer[playerid], 0, PotPrice[playerid]);

        GivePlayerCash(PotOffer[playerid], PotPrice[playerid]);
		GivePlayerCash(playerid, -PotPrice[playerid]);

  		if(PlayerInfo[PotOffer[playerid]][pDoubleEXP] > 0)
		{
			format(string, sizeof(string), "Ban da dat duoc 2 diem ky nang Nguoi Buon Ma Tuy thay vi 1 diem. Ban con %d gio voi Double EXP token.", PlayerInfo[PotOffer[playerid]][pDoubleEXP]);
			SendClientMessageEx(PotOffer[playerid], COLOR_YELLOW, string);
			PlayerInfo[PotOffer[playerid]][pDrugSmuggler] += 2;
		}
		else
		{
			PlayerInfo[PotOffer[playerid]][pDrugSmuggler] += 1;
		}

        if(PlayerInfo[PotOffer[playerid]][pDrugSmuggler] == 50)
        { SendClientMessageEx(PotOffer[playerid], COLOR_YELLOW, "* Ky nang Drug Dealer cua ban hien la cap 2, ban co the mua them Grams va Re hon."); }
        else if(PlayerInfo[PotOffer[playerid]][pDrugSmuggler] == 100)
        { SendClientMessageEx(PotOffer[playerid], COLOR_YELLOW, "* Ky nang Drug Dealer cua ban hien la cap 3, ban co the mua them Grams va Re hon."); }
        else if(PlayerInfo[PotOffer[playerid]][pDrugSmuggler] == 200)
        { SendClientMessageEx(PotOffer[playerid], COLOR_YELLOW, "* Ky nang Drug Dealer cua ban hien la cap 4, ban co the mua them Grams va Re hon."); }
        else if(PlayerInfo[PotOffer[playerid]][pDrugSmuggler] == 400)
        { SendClientMessageEx(PotOffer[playerid], COLOR_YELLOW, "* Ky nang Drug Dealer cua ban hien la cap 5, ban co the mua them Grams va Re hon."); }
        OnPlayerStatsUpdate(playerid);
        OnPlayerStatsUpdate(PotOffer[playerid]);
		PotOffer[playerid] = INVALID_PLAYER_ID;
		PotStorageID[playerid] = -1;
        PotPrice[playerid] = 0;
        PotGram[playerid] = 0;

	}
	if(special == 1 && itemid == 3) // Crack Special "Selling"
	{
		ExtortionTurfsWarsZone(CrackOffer[playerid], 0, CrackPrice[playerid]);


        GivePlayerCash(CrackOffer[playerid], CrackPrice[playerid]);
		GivePlayerCash(playerid, -CrackPrice[playerid]);

		if(PlayerInfo[CrackOffer[playerid]][pDoubleEXP] > 0)
		{
			format(string, sizeof(string), "Ban da dat duoc 2 diem ky nang Nguoi Buon Ma Tuy thay vi 1 diem. Ban con %d gio voi Double EXP token.", PlayerInfo[CrackOffer[playerid]][pDoubleEXP]);
			SendClientMessageEx(CrackOffer[playerid], COLOR_YELLOW, string);
			PlayerInfo[CrackOffer[playerid]][pDrugSmuggler] += 2;
		}
		else
		{
			PlayerInfo[CrackOffer[playerid]][pDrugSmuggler] += 1;
		}

        PlayerInfo[playerid][pDrugs][2] += CrackGram[playerid];
        PlayerInfo[CrackOffer[playerid]][pDrugs][2] -= CrackGram[playerid];
        if(PlayerInfo[CrackOffer[playerid]][pDrugSmuggler] == 50)
        { SendClientMessageEx(CrackOffer[playerid], COLOR_YELLOW, "* Ky nang Drug Dealer cua ban hien la cap 2, ban co the mua them Grams va Re hon."); }
        else if(PlayerInfo[CrackOffer[playerid]][pDrugSmuggler] == 100)
		{ SendClientMessageEx(CrackOffer[playerid], COLOR_YELLOW, "* Ky nang Drug Dealer cua ban hien la cap 3, ban co the mua them Grams va Re hon."); }
        else if(PlayerInfo[CrackOffer[playerid]][pDrugSmuggler] == 200)
        { SendClientMessageEx(CrackOffer[playerid], COLOR_YELLOW, "* Ky nang Drug Dealer cua ban hien la cap 4, ban co the mua them Grams va Re hon."); }
        else if(PlayerInfo[CrackOffer[playerid]][pDrugSmuggler] == 400)
        { SendClientMessageEx(CrackOffer[playerid], COLOR_YELLOW, "* Ky nang Drug Dealer cua ban hien la cap 5, ban co the mua them Grams va Re hon."); }
		OnPlayerStatsUpdate(playerid);
        OnPlayerStatsUpdate(CrackOffer[playerid]);
		CrackOffer[playerid] = INVALID_PLAYER_ID;
		CrackStorageID[playerid] = -1;
        CrackPrice[playerid] = 0;
        CrackGram[playerid] = 0;
	}
	if(special == 2 && itemid == 2) // Pot Special "Getting"
	{
		new mypoint = -1;
		for (new i=0; i<MAX_POINTS; i++)
		{
			if (IsPlayerInRangeOfPoint(playerid, 3.0, Points[i][Pointx], Points[i][Pointy], Points[i][Pointz]) && Points[i][Type] == 3)
			{
				new myvw = GetPlayerVirtualWorld(playerid);
				if(myvw == Points[i][pointVW3])
				{
					mypoint = i;
				}	
			}
		}

		if(PlayerInfo[playerid][pDonateRank] < 1)
		{
			Points[mypoint][Stock] -= amount;
			format(string, sizeof(string), " Pot/OPIUM AVAILABLE: %d/1000.", Points[mypoint][Stock]);
			UpdateDynamic3DTextLabelText(Points[mypoint][TextLabel], COLOR_YELLOW, string);
		}
		for(new i = 0; i < MAX_GROUPS; i++)
		{
			if(strcmp(Points[mypoint][Owner], arrGroupData[i][g_szGroupName], true) == 0)
			{
				arrGroupData[i][g_iBudget] += price/2;
			}
		}
	}
	if(special == 2 && itemid == 3) // Crack Special "Getting"
	{
		new mypoint = -1;
		for (new i=0; i<MAX_POINTS; i++)
		{
			if (IsPlayerInRangeOfPoint(playerid, 3.0, Points[i][Pointx], Points[i][Pointy], Points[i][Pointz]) && Points[i][Type] == 4)
			{
				new myvw = GetPlayerVirtualWorld(playerid);
				if(myvw == Points[i][pointVW3])
				{
					mypoint = i;
				}	
			}
		}
		if(PlayerInfo[playerid][pDonateRank] < 1)
		{
			Points[mypoint][Stock] -= amount;
			format(string, sizeof(string), " CRACK AVAILABLE: %d/500.", Points[mypoint][Stock]);
			UpdateDynamic3DTextLabelText(Points[mypoint][TextLabel], COLOR_YELLOW, string);
		}
		for(new i = 0; i < MAX_GROUPS; i++)
		{
			if(strcmp(Points[mypoint][Owner], arrGroupData[i][g_szGroupName], true) == 0)
			{
				arrGroupData[i][g_iBudget] += price/2;
			}
		}
	}
	if(special == 2 && itemid == 4) // Materials Special "Getting"
	{
		DeletePVar(playerid, "Packages");
		DeletePVar(playerid, "MatDeliver");
		DisablePlayerCheckpoint(playerid);
	}
	if(special == 4 && itemid == 1) // House Withdraw - Cash
	{
		new houseid = GetPVarInt(playerid, "Special_HouseID");
		DeletePVar(playerid, "Special_HouseID");

		HouseInfo[houseid][hSafeMoney] -= amount;
	}
	if(special == 4 && itemid == 2) // House Withdraw - Pot
	{
		new houseid = GetPVarInt(playerid, "Special_HouseID");
		DeletePVar(playerid, "Special_HouseID");

		HouseInfo[houseid][hPot] -= amount;
	}
	if(special == 4 && itemid == 3) // House Withdraw - Crack
	{
		new houseid = GetPVarInt(playerid, "Special_HouseID");
		DeletePVar(playerid, "Special_HouseID");

		HouseInfo[houseid][hCrack] -= amount;
	}
	if(special == 4 && itemid == 4) // House Withdraw - Mats
	{
		new houseid = GetPVarInt(playerid, "Special_HouseID");
		DeletePVar(playerid, "Special_HouseID");

		HouseInfo[houseid][hMaterials] -= amount;
	}

	switch(storageid)
	{
		case 0: // Pocket or On Hand
		{
			if(itemid == 1)
			{
				// Check if Sending Player has sufficient amount.
				if(fromplayerid != -1 && fromstorageid != -1)
				{
					if(fromstorageid == 0)
					{
						if(PlayerInfo[fromplayerid][pCash] < amount)
						{
							format(string, sizeof(string), "Ban khong co du tien de cung cap $%d %s.", amount, itemtype[itemid]);
							SendClientMessageEx(fromplayerid, COLOR_WHITE, string);
							return 0;
						}
					}
					else
					{
						if(StorageInfo[fromplayerid][fromstorageid-1][sCash] < amount)
						{
							format(string, sizeof(string), "Ban khong co du tien de cung cap $%d %s.", amount, itemtype[itemid]);
							SendClientMessageEx(fromplayerid, COLOR_WHITE, string);
							return 0;
						}
					}

					if(fromstorageid == 0) PlayerInfo[fromplayerid][pCash] -= amount;
					else StorageInfo[fromplayerid][fromstorageid-1][sCash] -= amount;
				}
				PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
				PlayerInfo[playerid][pCash] += amount;
				OnPlayerStatsUpdate(playerid);
				if(fromplayerid != -1) {
        			OnPlayerStatsUpdate(fromplayerid);
        		}
				format(string, sizeof(string), "$%d da duoc chuyen vao Pocket cua ban ($%d).", amount, PlayerInfo[playerid][pCash]);
				SendClientMessage(playerid, COLOR_WHITE, string);

				if(fromplayerid != -1 && fromstorageid != -1 && playerid != fromplayerid) {
					format(string, sizeof(string), "$%d da duoc chuyen tu %s cho %s's %s.", amount, storagetype[fromstorageid], GetPlayerNameEx(playerid), storagetype[storageid]);
					SendClientMessage(fromplayerid, COLOR_WHITE, string);

					PlayerPlaySound(fromplayerid, 1052, 0.0, 0.0, 0.0);
					format(string, sizeof(string), "* %s lay mot so %s tu %s, va giao no cho %s.", GetPlayerNameEx(fromplayerid), itemtype[itemid], storagetype[fromstorageid], GetPlayerNameEx(playerid));
					ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);

					if(PlayerInfo[playerid][pAdmin] >= 2 || PlayerInfo[fromplayerid][pAdmin] >= 2)
					{
						format(string, sizeof(string), "[Admin] %s(%d) (IP:%s) has given $%s %s to %s(%d) (IP:%s)", GetPlayerNameEx(fromplayerid), GetPlayerSQLId(fromplayerid), GetPlayerIpEx(fromplayerid), number_format(amount), itemtype[itemid], GetPlayerNameEx(playerid), GetPlayerSQLId(playerid), GetPlayerIpEx(playerid));
						Log("logs/adminpay.log", string);
						format(string, sizeof(string), "{AA3333}AdmWarning{FFFF00}: %s has given $%s %s to %s", GetPlayerNameEx(fromplayerid), number_format(amount), itemtype[itemid], GetPlayerNameEx(playerid));
						if(!strcmp(GetPlayerIpEx(playerid),  GetPlayerIpEx(fromplayerid), true)) strcat(string, " (1)");
						ABroadCast(COLOR_YELLOW, string, 4);
					}
					else
					{
						format(string, sizeof(string), "%s(%d) (IP:%s) has given $%s %s to %s(%d) (IP:%s)", GetPlayerNameEx(fromplayerid), GetPlayerSQLId(fromplayerid), GetPlayerIpEx(fromplayerid), number_format(amount), itemtype[itemid], GetPlayerNameEx(playerid), GetPlayerSQLId(playerid), GetPlayerIpEx(playerid));
						Log("logs/pay.log", string);
						format(string, sizeof(string), "%s (IP:%s) has given $%s %s to %s (IP:%s)", GetPlayerNameEx(fromplayerid), GetPlayerIpEx(fromplayerid), number_format(amount), itemtype[itemid], GetPlayerNameEx(playerid), GetPlayerIpEx(playerid));
						if(amount >= 100000 && PlayerInfo[fromplayerid][pLevel] <= 3 && itemid == 1) ABroadCast(COLOR_YELLOW, string, 2);
						if(amount >= 1000000 && itemid == 1)	ABroadCast(COLOR_YELLOW,string,2);
					}
				}
				return 1;
			}
			if(itemid == 2 && (PlayerInfo[playerid][pDrugs][1] + amount <= onhandlimit[itemid-1]))
			{
				// Check if Sending Player has sufficient amount.
				if(fromplayerid != -1 && fromstorageid != -1)
				{
					if(fromstorageid == 0)
					{
						if(PlayerInfo[fromplayerid][pDrugs][1] < amount)
						{
							format(string, sizeof(string), "Ban khong co du tien de cung cap $%d %s.", amount, itemtype[itemid]);
							SendClientMessageEx(fromplayerid, COLOR_WHITE, string);
							return 0;
						}
					}
					else
					{
						if(StorageInfo[fromplayerid][fromstorageid-1][sPot] < amount)
						{
							format(string, sizeof(string), "Ban khong co du tien de cung cap $%d %s.", amount, itemtype[itemid]);
							SendClientMessageEx(fromplayerid, COLOR_WHITE, string);
							return 0;
						}
					}

					if(fromstorageid == 0) PlayerInfo[fromplayerid][pDrugs][1] -= amount;
					else StorageInfo[fromplayerid][fromstorageid-1][sPot] -= amount;
				}
				PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
				PlayerInfo[playerid][pDrugs][1] += amount;
				format(string, sizeof(string), "%d Pot da duoc chuyen vao Pocket cua ban (%d).", amount, PlayerInfo[playerid][pDrugs][1]);
				SendClientMessage(playerid, COLOR_WHITE, string);

				if(fromplayerid != -1 && fromstorageid != -1 && playerid != fromplayerid) {
					format(string, sizeof(string), "%d Pot da duoc chuyen tu %s cho %s's %s.", amount, storagetype[fromstorageid], GetPlayerNameEx(playerid), storagetype[storageid]);
					SendClientMessage(fromplayerid, COLOR_WHITE, string);

					PlayerPlaySound(fromplayerid, 1052, 0.0, 0.0, 0.0);
					format(string, sizeof(string), "* %s lay mot so %s tu %s, va giao no cho %s.", GetPlayerNameEx(fromplayerid), itemtype[itemid], storagetype[fromstorageid], GetPlayerNameEx(playerid));
					ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);

					if(PlayerInfo[playerid][pAdmin] >= 2 || PlayerInfo[fromplayerid][pAdmin] >= 2)
					{
						format(string, sizeof(string), "[Admin] %s(%d) (IP:%s) has given %s %s to %s(%d) (IP:%s)", GetPlayerNameEx(fromplayerid), GetPlayerSQLId(fromplayerid), GetPlayerIpEx(fromplayerid), number_format(amount), itemtype[itemid], GetPlayerNameEx(playerid), GetPlayerSQLId(playerid), GetPlayerIpEx(playerid));
						Log("logs/adminpay.log", string);
						format(string, sizeof(string), "{AA3333}AdmWarning{FFFF00}: %s has given %s %s to %s", GetPlayerNameEx(fromplayerid), number_format(amount), itemtype[itemid], GetPlayerNameEx(playerid));
						if(!strcmp(GetPlayerIpEx(playerid),  GetPlayerIpEx(fromplayerid), true)) strcat(string, " (1)");
						ABroadCast(COLOR_YELLOW, string, 4);
					}
					else
					{
						format(string, sizeof(string), "%s(%d) (IP:%s) has given %s %s to %s(%d) (IP:%s)", GetPlayerNameEx(fromplayerid), GetPlayerSQLId(fromplayerid), GetPlayerIpEx(fromplayerid), number_format(amount), itemtype[itemid], GetPlayerNameEx(playerid), GetPlayerSQLId(playerid), GetPlayerIpEx(playerid));
						Log("logs/pay.log", string);
						format(string, sizeof(string), "%s (IP:%s) has given %s %s to %s (IP:%s)", GetPlayerNameEx(fromplayerid), GetPlayerIpEx(fromplayerid), number_format(amount), itemtype[itemid], GetPlayerNameEx(playerid), GetPlayerIpEx(playerid));
						if(amount >= 100000 && PlayerInfo[fromplayerid][pLevel] <= 3 && itemid == 1) ABroadCast(COLOR_YELLOW, string, 2);
						if(amount >= 1000000 && itemid == 1)	ABroadCast(COLOR_YELLOW,string,2);
					}
				}
				return 1;
			}
			if(itemid == 3 && (PlayerInfo[playerid][pDrugs][2] + amount <= onhandlimit[itemid-1]))
			{
				// Check if Sending Player has sufficient amount.
				if(fromplayerid != -1 && fromstorageid != -1)
				{
					if(fromstorageid == 0)
					{
						if(PlayerInfo[fromplayerid][pDrugs][2] < amount)
						{
							format(string, sizeof(string), "Ban khong co du tien de cung cap $%d %s.", amount, itemtype[itemid]);
							SendClientMessageEx(fromplayerid, COLOR_WHITE, string);
							return 0;
						}
					}
					else
					{
						if(StorageInfo[fromplayerid][fromstorageid-1][sCrack] < amount)
						{
							format(string, sizeof(string), "Ban khong co du tien de cung cap $%d %s.", amount, itemtype[itemid]);
							SendClientMessageEx(fromplayerid, COLOR_WHITE, string);
							return 0;
						}
					}

					if(fromstorageid == 0) PlayerInfo[fromplayerid][pDrugs][2] -= amount;
					else StorageInfo[fromplayerid][fromstorageid-1][sCrack] -= amount;
				}
				PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
				PlayerInfo[playerid][pDrugs][2] += amount;
				format(string, sizeof(string), "%d Crack da duoc chuyen vao Pocket cua ban (%d).", amount, PlayerInfo[playerid][pDrugs][2]);
				SendClientMessage(playerid, COLOR_WHITE, string);

				if(fromplayerid != -1 && fromstorageid != -1 && playerid != fromplayerid) {
					format(string, sizeof(string), "%d Crack da duoc chuyen tu %s cho %s's %s.", amount, storagetype[fromstorageid], GetPlayerNameEx(playerid), storagetype[storageid]);
					SendClientMessage(fromplayerid, COLOR_WHITE, string);

					PlayerPlaySound(fromplayerid, 1052, 0.0, 0.0, 0.0);
					format(string, sizeof(string), "* %s lay mot so %s tu %s, va giao no cho %s.", GetPlayerNameEx(fromplayerid), itemtype[itemid], storagetype[fromstorageid], GetPlayerNameEx(playerid));
					ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);

					if(PlayerInfo[playerid][pAdmin] >= 2 || PlayerInfo[fromplayerid][pAdmin] >= 2)
					{
						format(string, sizeof(string), "[Admin] %s(%d) (IP:%s) has given %s %s to %s(%d) (IP:%s)", GetPlayerNameEx(fromplayerid), GetPlayerSQLId(fromplayerid), GetPlayerIpEx(fromplayerid), number_format(amount), itemtype[itemid], GetPlayerNameEx(playerid), GetPlayerSQLId(playerid), GetPlayerIpEx(playerid));
						Log("logs/adminpay.log", string);
						format(string, sizeof(string), "{AA3333}AdmWarning{FFFF00}: %s has given %s %s to %s", GetPlayerNameEx(fromplayerid), number_format(amount), itemtype[itemid], GetPlayerNameEx(playerid));
						if(!strcmp(GetPlayerIpEx(playerid),  GetPlayerIpEx(fromplayerid), true)) strcat(string, " (1)");
						ABroadCast(COLOR_YELLOW, string, 4);
					}
					else
					{
						format(string, sizeof(string), "%s(%d) (IP:%s) has given %s %s to %s(%d) (IP:%s)", GetPlayerNameEx(fromplayerid), GetPlayerSQLId(fromplayerid), GetPlayerIpEx(fromplayerid), number_format(amount), itemtype[itemid], GetPlayerNameEx(playerid), GetPlayerSQLId(playerid), GetPlayerIpEx(playerid));
						Log("logs/pay.log", string);
						format(string, sizeof(string), "%s (IP:%s) has given %s %s to %s (IP:%s)", GetPlayerNameEx(fromplayerid), GetPlayerIpEx(fromplayerid), number_format(amount), itemtype[itemid], GetPlayerNameEx(playerid), GetPlayerIpEx(playerid));
						if(amount >= 100000 && PlayerInfo[fromplayerid][pLevel] <= 3 && itemid == 1) ABroadCast(COLOR_YELLOW, string, 2);
						if(amount >= 1000000 && itemid == 1)	ABroadCast(COLOR_YELLOW,string,2);
					}
				}
				return 1;
			}
			if(itemid == 4 && (PlayerInfo[playerid][pMats] + amount <= onhandlimit[itemid-1]))
			{
				// Check if Sending Player has sufficient amount.
				if(fromplayerid != -1 && fromstorageid != -1)
				{
					if(fromstorageid == 0)
					{
						if(PlayerInfo[fromplayerid][pMats] < amount)
						{
							format(string, sizeof(string), "Ban khong co du tien de cung cap %d %s.", amount, itemtype[itemid]);
							SendClientMessageEx(fromplayerid, COLOR_WHITE, string);
							return 0;
						}
					}
					else
					{
						if(StorageInfo[fromplayerid][fromstorageid-1][sMats] < amount)
						{
							format(string, sizeof(string), "Ban khong co du tien de cung cap %d %s.", amount, itemtype[itemid]);
							SendClientMessageEx(fromplayerid, COLOR_WHITE, string);
							return 0;
						}
					}

					if(fromstorageid == 0) PlayerInfo[fromplayerid][pMats] -= amount;
					else StorageInfo[fromplayerid][fromstorageid-1][sMats] -= amount;
				}
				PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
				PlayerInfo[playerid][pMats] += amount;
				//format(string, sizeof(string), "%d Materials da duoc chuyen vao Pocket cua ban (%d/%d).", amount, PlayerInfo[playerid][pMats], onhandlimit[itemid-1]);
				format(string, sizeof(string), "%s Materials da duoc chuyen vao Pocket cua ban (%s).", number_format(amount), number_format(PlayerInfo[playerid][pMats]));
				SendClientMessage(playerid, COLOR_WHITE, string);

				if(fromplayerid != -1 && fromstorageid != -1 && playerid != fromplayerid) {
					format(string, sizeof(string), "%d Materials da duoc chuyen tu %s cho %s's %s.", amount, storagetype[fromstorageid], GetPlayerNameEx(playerid), storagetype[storageid]);
					SendClientMessage(fromplayerid, COLOR_WHITE, string);

					PlayerPlaySound(fromplayerid, 1052, 0.0, 0.0, 0.0);
					format(string, sizeof(string), "* %s lay mot so %s tu %s, va giao no cho %s.", GetPlayerNameEx(fromplayerid), itemtype[itemid], storagetype[fromstorageid], GetPlayerNameEx(playerid));
					ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);

					new ipplayerid[16], ipfromplayerid[16];
					GetPlayerIp(playerid, ipplayerid, sizeof(ipplayerid));
					GetPlayerIp(fromplayerid, ipfromplayerid, sizeof(ipfromplayerid));

					if(PlayerInfo[playerid][pAdmin] >= 2 || PlayerInfo[fromplayerid][pAdmin] >= 2)
					{
						format(string, sizeof(string), "[Admin] %s(%d) (IP:%s) has given %s %s to %s(%d) (IP:%s)", GetPlayerNameEx(fromplayerid), GetPlayerSQLId(fromplayerid), ipfromplayerid, number_format(amount), itemtype[itemid], GetPlayerNameEx(playerid), GetPlayerSQLId(playerid), ipplayerid);
						Log("logs/adminpay.log", string);
						format(string, sizeof(string), "{AA3333}AdmWarning{FFFF00}: %s has given %s %s to %s", GetPlayerNameEx(fromplayerid), number_format(amount), itemtype[itemid], GetPlayerNameEx(playerid));
						if(!strcmp(GetPlayerIpEx(playerid),  GetPlayerIpEx(fromplayerid), true)) strcat(string, " (1)");
						ABroadCast(COLOR_YELLOW, string, 4);
					}
					else
					{
						format(string, sizeof(string), "%s(%d) (IP:%s) has given %s %s to %s(%d) (IP:%s)", GetPlayerNameEx(fromplayerid), GetPlayerSQLId(fromplayerid), ipfromplayerid, number_format(amount), itemtype[itemid], GetPlayerNameEx(playerid), GetPlayerSQLId(playerid), ipplayerid);
						Log("logs/pay.log", string);
						format(string, sizeof(string), "%s (IP:%s) has given %s %s to %s (IP:%s)", GetPlayerNameEx(fromplayerid), ipfromplayerid, number_format(amount), itemtype[itemid], GetPlayerNameEx(playerid), ipplayerid);
						if(amount >= 100000 && PlayerInfo[fromplayerid][pLevel] <= 3 && itemid == 1) ABroadCast(COLOR_YELLOW, string, 2);
						if(amount >= 1000000 && itemid == 1)	ABroadCast(COLOR_YELLOW,string,2);
					}
				}
				return 1;
			}
			/*if(itemid == 4)
			{
				SendClientMessageEx(playerid, COLOR_WHITE, "You need at least a Bag to be able to store Materials.");
				return 0;
			}*/

			if(itemid == 1) format(string, sizeof(string), "Khong the chuyen $%d to %s ($%d).", amount, storagetype[storageid], PlayerInfo[playerid][pCash]);
			else if(itemid == 2) format(string, sizeof(string), "Khong the chuyen %d %s to %s (%d/%d).", amount, itemtype[itemid], storagetype[storageid], PlayerInfo[playerid][pDrugs][1], onhandlimit[itemid-1]);
			else if(itemid == 3) format(string, sizeof(string), "Khong the chuyen %d %s to %s (%d/%d).", amount, itemtype[itemid], storagetype[storageid], PlayerInfo[playerid][pDrugs][2], onhandlimit[itemid-1]);
			else if(itemid == 4) format(string, sizeof(string), "Khong the chuyen %d %s to %s (%d/%d).", amount, itemtype[itemid], storagetype[storageid], PlayerInfo[playerid][pMats], onhandlimit[itemid-1]);

			SendClientMessageEx(playerid, COLOR_WHITE, string);
		}
		case 1: // Bag
		{
			if(StorageInfo[playerid][0][sStorage] == 0)
			{
				SendClientMessageEx(playerid, COLOR_WHITE, "Ban khong so huu Balo. Ban co the mua no tai Cua Hang 24/7.");
				return 0;
			}

			if(itemid == 1 && (StorageInfo[playerid][0][sCash] + amount <= bbackpacklimit[itemid-1]))
			{
				// Check if Sending Player has sufficient amount.
				if(fromplayerid != -1 && fromstorageid != -1)
				{
					if(fromstorageid == 0)
					{
						if(PlayerInfo[fromplayerid][pCash] < amount)
						{
							format(string, sizeof(string), "Ban khong co du tien de cung cap $%d %s.", amount, itemtype[itemid]);
							SendClientMessageEx(fromplayerid, COLOR_WHITE, string);
							return 0;
						}
					}
					else
					{
						if(StorageInfo[fromplayerid][fromstorageid-1][sCash] < amount)
						{
							format(string, sizeof(string), "Ban khong co du tien de cung cap $%d %s.", amount, itemtype[itemid]);
							SendClientMessageEx(fromplayerid, COLOR_WHITE, string);
							return 0;
						}
					}

					if(fromstorageid == 0) PlayerInfo[fromplayerid][pCash] -= amount;
					else StorageInfo[fromplayerid][fromstorageid-1][sCash] -= amount;
				}
				PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
				StorageInfo[playerid][0][sCash] += amount;
				format(string, sizeof(string), "$%d da duoc chuyen vao Balo cua ban ($%d/$%d).", amount, StorageInfo[playerid][0][sCash], bbackpacklimit[itemid-1]);
				SendClientMessage(playerid, COLOR_WHITE, string);

				if(fromplayerid != -1 && fromstorageid != -1 && playerid != fromplayerid) {
					format(string, sizeof(string), "$%d da duoc chuyen tu %s cho %s's %s.", amount, storagetype[fromstorageid], GetPlayerNameEx(playerid), storagetype[storageid]);
					SendClientMessage(fromplayerid, COLOR_WHITE, string);

					PlayerPlaySound(fromplayerid, 1052, 0.0, 0.0, 0.0);
					format(string, sizeof(string), "* %s lay mot so %s tu %s, va giao no cho %s.", GetPlayerNameEx(fromplayerid), itemtype[itemid], storagetype[fromstorageid], GetPlayerNameEx(playerid));
					ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);

					new ipplayerid[16], ipfromplayerid[16];
					GetPlayerIp(playerid, ipplayerid, sizeof(ipplayerid));
					GetPlayerIp(fromplayerid, ipfromplayerid, sizeof(ipfromplayerid));

					if(PlayerInfo[playerid][pAdmin] >= 2 || PlayerInfo[fromplayerid][pAdmin] >= 2)
					{
						format(string, sizeof(string), "[Admin] %s(%d) (IP:%s) has given %s %s to %s(%d) (IP:%s)", GetPlayerNameEx(fromplayerid), GetPlayerSQLId(fromplayerid), ipfromplayerid, number_format(amount), itemtype[itemid], GetPlayerNameEx(playerid), GetPlayerSQLId(playerid), ipplayerid);
						Log("logs/adminpay.log", string);
						format(string, sizeof(string), "{AA3333}AdmWarning{FFFF00}: %s has given %s %s to %s", GetPlayerNameEx(fromplayerid), number_format(amount), itemtype[itemid], GetPlayerNameEx(playerid));
						if(!strcmp(GetPlayerIpEx(playerid),  GetPlayerIpEx(fromplayerid), true)) strcat(string, " (1)");
						ABroadCast(COLOR_YELLOW, string, 4);
					}
					else
					{
						format(string, sizeof(string), "%s(%d) (IP:%s) has given %s %s to %s(%d) (IP:%s)", GetPlayerNameEx(fromplayerid), GetPlayerSQLId(fromplayerid), ipfromplayerid, number_format(amount), itemtype[itemid], GetPlayerNameEx(playerid), GetPlayerSQLId(playerid), ipplayerid);
						Log("logs/pay.log", string);
						format(string, sizeof(string), "%s (IP:%s) has given %s %s to %s (IP:%s)", GetPlayerNameEx(fromplayerid), ipfromplayerid, number_format(amount), itemtype[itemid], GetPlayerNameEx(playerid), ipplayerid);
						if(amount >= 100000 && PlayerInfo[fromplayerid][pLevel] <= 3 && itemid == 1) ABroadCast(COLOR_YELLOW, string, 2);
						if(amount >= 1000000 && itemid == 1)	ABroadCast(COLOR_YELLOW,string,2);
					}
				}
				return 1;
			}
			if(itemid == 2 && (StorageInfo[playerid][0][sPot] + amount <= bbackpacklimit[itemid-1]))
			{
				// Check if Sending Player has sufficient amount.
				if(fromplayerid != -1 && fromstorageid != -1)
				{
					if(fromstorageid == 0)
					{
						if(PlayerInfo[fromplayerid][pDrugs][1] < amount)
						{
							format(string, sizeof(string), "Ban khong co du tien de cung cap $%d %s.", amount, itemtype[itemid]);
							SendClientMessageEx(fromplayerid, COLOR_WHITE, string);
							return 0;
						}
					}
					else
					{
						if(StorageInfo[fromplayerid][fromstorageid-1][sPot] < amount)
						{
							format(string, sizeof(string), "Ban khong co du tien de cung cap $%d %s.", amount, itemtype[itemid]);
							SendClientMessageEx(fromplayerid, COLOR_WHITE, string);
							return 0;
						}
					}

					if(fromstorageid == 0) PlayerInfo[fromplayerid][pDrugs][1] -= amount;
					else StorageInfo[fromplayerid][fromstorageid-1][sPot] -= amount;
				}
				PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
				StorageInfo[playerid][0][sPot] += amount;
				format(string, sizeof(string), "%d Pot da duoc chuyen vao Balo cua ban (%d/%d).", amount, StorageInfo[playerid][0][sPot], bbackpacklimit[itemid-1]);
				SendClientMessage(playerid, COLOR_WHITE, string);

				if(fromplayerid != -1 && fromstorageid != -1 && playerid != fromplayerid) {
					format(string, sizeof(string), "%d Pot da duoc chuyen tu %s cho %s's %s.", amount, storagetype[fromstorageid], GetPlayerNameEx(playerid), storagetype[storageid]);
					SendClientMessage(fromplayerid, COLOR_WHITE, string);

					PlayerPlaySound(fromplayerid, 1052, 0.0, 0.0, 0.0);
					format(string, sizeof(string), "* %s lay mot so %s tu %s, va giao no cho %s.", GetPlayerNameEx(fromplayerid), itemtype[itemid], storagetype[fromstorageid], GetPlayerNameEx(playerid));
					ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);

					new ipplayerid[16], ipfromplayerid[16];
					GetPlayerIp(playerid, ipplayerid, sizeof(ipplayerid));
					GetPlayerIp(fromplayerid, ipfromplayerid, sizeof(ipfromplayerid));

					if(PlayerInfo[playerid][pAdmin] >= 2 || PlayerInfo[fromplayerid][pAdmin] >= 2)
					{
						format(string, sizeof(string), "[Admin] %s(%d) (IP:%s) has given %s %s to %s(%d) (IP:%s)", GetPlayerNameEx(fromplayerid), GetPlayerSQLId(fromplayerid), ipfromplayerid, number_format(amount), itemtype[itemid], GetPlayerNameEx(playerid), GetPlayerSQLId(playerid), ipplayerid);
						Log("logs/adminpay.log", string);
						format(string, sizeof(string), "{AA3333}AdmWarning{FFFF00}: %s has given %s %s to %s", GetPlayerNameEx(fromplayerid), number_format(amount), itemtype[itemid], GetPlayerNameEx(playerid));
						if(!strcmp(GetPlayerIpEx(playerid),  GetPlayerIpEx(fromplayerid), true)) strcat(string, " (1)");
						ABroadCast(COLOR_YELLOW, string, 4);
					}
					else
					{
						format(string, sizeof(string), "%s(%d) (IP:%s) has given %s %s to %s(%d) (IP:%s)", GetPlayerNameEx(fromplayerid), GetPlayerSQLId(fromplayerid), ipfromplayerid, number_format(amount), itemtype[itemid], GetPlayerNameEx(playerid), GetPlayerSQLId(playerid), ipplayerid);
						Log("logs/pay.log", string);
						format(string, sizeof(string), "%s (IP:%s) has given %s %s to %s (IP:%s)", GetPlayerNameEx(fromplayerid), ipfromplayerid, number_format(amount), itemtype[itemid], GetPlayerNameEx(playerid), ipplayerid);
						if(amount >= 100000 && PlayerInfo[fromplayerid][pLevel] <= 3 && itemid == 1) ABroadCast(COLOR_YELLOW, string, 2);
						if(amount >= 1000000 && itemid == 1)	ABroadCast(COLOR_YELLOW,string,2);
					}
				}
				return 1;
			}
			if(itemid == 3 && (StorageInfo[playerid][0][sCrack] + amount <= bbackpacklimit[itemid-1]))
			{
				// Check if Sending Player has sufficient amount.
				if(fromplayerid != -1 && fromstorageid != -1)
				{
					if(fromstorageid == 0)
					{
						if(PlayerInfo[fromplayerid][pDrugs][2] < amount)
						{
							format(string, sizeof(string), "Ban khong co du tien de cung cap $%d %s.", amount, itemtype[itemid]);
							SendClientMessageEx(fromplayerid, COLOR_WHITE, string);
							return 0;
						}
					}
					else
					{
						if(StorageInfo[fromplayerid][fromstorageid-1][sCrack] < amount)
						{
							format(string, sizeof(string), "Ban khong co du tien de cung cap $%d %s.", amount, itemtype[itemid]);
							SendClientMessageEx(fromplayerid, COLOR_WHITE, string);
							return 0;
						}
					}

					if(fromstorageid == 0) PlayerInfo[fromplayerid][pDrugs][2] -= amount;
					else StorageInfo[fromplayerid][fromstorageid-1][sCrack] -= amount;
				}
				PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
				StorageInfo[playerid][0][sCrack] += amount;
				format(string, sizeof(string), "%d Crack da duoc chuyen vao Balo cua ban (%d/%d).", amount, StorageInfo[playerid][0][sCrack], bbackpacklimit[itemid-1]);
				SendClientMessage(playerid, COLOR_WHITE, string);

				if(fromplayerid != -1 && fromstorageid != -1 && playerid != fromplayerid) {
					format(string, sizeof(string), "%d Crack da duoc chuyen tu %s cho %s's %s.", amount, storagetype[fromstorageid], GetPlayerNameEx(playerid), storagetype[storageid]);
					SendClientMessage(fromplayerid, COLOR_WHITE, string);

					PlayerPlaySound(fromplayerid, 1052, 0.0, 0.0, 0.0);
					format(string, sizeof(string), "* %s lay mot so %s tu %s, va giao no cho %s.", GetPlayerNameEx(fromplayerid), itemtype[itemid], storagetype[fromstorageid], GetPlayerNameEx(playerid));
					ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);

					new ipplayerid[16], ipfromplayerid[16];
					GetPlayerIp(playerid, ipplayerid, sizeof(ipplayerid));
					GetPlayerIp(fromplayerid, ipfromplayerid, sizeof(ipfromplayerid));

					if(PlayerInfo[playerid][pAdmin] >= 2 || PlayerInfo[fromplayerid][pAdmin] >= 2)
					{
						format(string, sizeof(string), "[Admin] %s(%d) (IP:%s) has given %s %s to %s(%d) (IP:%s)", GetPlayerNameEx(fromplayerid), GetPlayerSQLId(fromplayerid), ipfromplayerid, number_format(amount), itemtype[itemid], GetPlayerNameEx(playerid), GetPlayerSQLId(playerid), ipplayerid);
						Log("logs/adminpay.log", string);
						format(string, sizeof(string), "{AA3333}AdmWarning{FFFF00}: %s has given %s %s to %s", GetPlayerNameEx(fromplayerid), number_format(amount), itemtype[itemid], GetPlayerNameEx(playerid));
						if(!strcmp(GetPlayerIpEx(playerid),  GetPlayerIpEx(fromplayerid), true)) strcat(string, " (1)");
						ABroadCast(COLOR_YELLOW, string, 4);
					}
					else
					{
						format(string, sizeof(string), "%s(%d) (IP:%s) has given %s %s to %s(%d) (IP:%s)", GetPlayerNameEx(fromplayerid), GetPlayerSQLId(fromplayerid), ipfromplayerid, number_format(amount), itemtype[itemid], GetPlayerNameEx(playerid), GetPlayerSQLId(playerid), ipplayerid);
						Log("logs/pay.log", string);
						format(string, sizeof(string), "%s (IP:%s) has given %s %s to %s (IP:%s)", GetPlayerNameEx(fromplayerid), ipfromplayerid, number_format(amount), itemtype[itemid], GetPlayerNameEx(playerid), ipplayerid);
						if(amount >= 100000 && PlayerInfo[fromplayerid][pLevel] <= 3 && itemid == 1) ABroadCast(COLOR_YELLOW, string, 2);
						if(amount >= 1000000 && itemid == 1)	ABroadCast(COLOR_YELLOW,string,2);
					}
				}
				return 1;
			}
			if(itemid == 4 && (StorageInfo[playerid][0][sMats] + amount <= bbackpacklimit[itemid-1]))
			{
				// Check if Sending Player has sufficient amount.
				if(fromplayerid != -1 && fromstorageid != -1)
				{
					if(fromstorageid == 0)
					{
						if(PlayerInfo[fromplayerid][pMats] < amount)
						{
							format(string, sizeof(string), "Ban khong co du tien de cung cap $%d %s.", amount, itemtype[itemid]);
							SendClientMessageEx(fromplayerid, COLOR_WHITE, string);
							return 0;
						}
					}
					else
					{
						if(StorageInfo[fromplayerid][fromstorageid-1][sMats] < amount)
						{
							format(string, sizeof(string), "Ban khong co du tien de cung cap $%d %s.", amount, itemtype[itemid]);
							SendClientMessageEx(fromplayerid, COLOR_WHITE, string);
							return 0;
						}
					}

					if(fromstorageid == 0) PlayerInfo[fromplayerid][pMats] -= amount;
					else StorageInfo[fromplayerid][fromstorageid-1][sMats] -= amount;
				}
				PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
				StorageInfo[playerid][0][sMats] += amount;
				format(string, sizeof(string), "%d Materials da duoc chuyen vao Balo cua ban (%d/%d).", amount, StorageInfo[playerid][0][sMats], bbackpacklimit[itemid-1]);
				SendClientMessage(playerid, COLOR_WHITE, string);

				if(fromplayerid != -1 && fromstorageid != -1 && playerid != fromplayerid) {
					format(string, sizeof(string), "%d Materials da duoc chuyen tu %s cho %s's %s.", amount, storagetype[fromstorageid], GetPlayerNameEx(playerid), storagetype[storageid]);
					SendClientMessage(fromplayerid, COLOR_WHITE, string);

					PlayerPlaySound(fromplayerid, 1052, 0.0, 0.0, 0.0);
					format(string, sizeof(string), "* %s lay mot so %s tu %s, va giao no cho %s.", GetPlayerNameEx(fromplayerid), itemtype[itemid], storagetype[fromstorageid], GetPlayerNameEx(playerid));
					ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);

					new ipplayerid[16], ipfromplayerid[16];
					GetPlayerIp(playerid, ipplayerid, sizeof(ipplayerid));
					GetPlayerIp(fromplayerid, ipfromplayerid, sizeof(ipfromplayerid));

					if(PlayerInfo[playerid][pAdmin] >= 2 || PlayerInfo[fromplayerid][pAdmin] >= 2)
					{
						format(string, sizeof(string), "[Admin] %s(%d) (IP:%s) has given %s %s to %s(%d) (IP:%s)", GetPlayerNameEx(fromplayerid), GetPlayerSQLId(fromplayerid), ipfromplayerid, number_format(amount), itemtype[itemid], GetPlayerNameEx(playerid), GetPlayerSQLId(playerid), ipplayerid);
						Log("logs/adminpay.log", string);
						format(string, sizeof(string), "{AA3333}AdmWarning{FFFF00}: %s has given %s %s to %s", GetPlayerNameEx(fromplayerid), number_format(amount), itemtype[itemid], GetPlayerNameEx(playerid));
						if(!strcmp(GetPlayerIpEx(playerid),  GetPlayerIpEx(fromplayerid), true)) strcat(string, " (1)");
						ABroadCast(COLOR_YELLOW, string, 4);
					}
					else
					{
						format(string, sizeof(string), "%s(%d) (IP:%s) has given %s %s to %s(%d) (IP:%s)", GetPlayerNameEx(fromplayerid), GetPlayerSQLId(fromplayerid), ipfromplayerid, number_format(amount), itemtype[itemid], GetPlayerNameEx(playerid), GetPlayerSQLId(playerid), ipplayerid);
						Log("logs/pay.log", string);
						format(string, sizeof(string), "%s (IP:%s) has given %s %s to %s (IP:%s)", GetPlayerNameEx(fromplayerid), ipfromplayerid, number_format(amount), itemtype[itemid], GetPlayerNameEx(playerid), ipplayerid);
						if(amount >= 100000 && PlayerInfo[fromplayerid][pLevel] <= 3 && itemid == 1) ABroadCast(COLOR_YELLOW, string, 2);
						if(amount >= 1000000 && itemid == 1)	ABroadCast(COLOR_YELLOW,string,2);
					}
				}
				return 1;
			}

			if(itemid == 1) format(string, sizeof(string), "Khong the chuyen $%d to %s ($%d/$%d).", amount, storagetype[storageid], StorageInfo[playerid][0][sCash], bbackpacklimit[itemid-1]);
			else if(itemid == 2) format(string, sizeof(string), "Khong the chuyen %d %s to %s (%d/%d).", amount, itemtype[itemid], storagetype[storageid], StorageInfo[playerid][0][sPot], bbackpacklimit[itemid-1]);
			else if(itemid == 3) format(string, sizeof(string), "Khong the chuyen %d %s to %s (%d/%d).", amount, itemtype[itemid], storagetype[storageid], StorageInfo[playerid][0][sCrack], bbackpacklimit[itemid-1]);
			else if(itemid == 4) format(string, sizeof(string), "Khong the chuyen %d %s to %s (%d/%d).", amount, itemtype[itemid], storagetype[storageid], StorageInfo[playerid][0][sMats], bbackpacklimit[itemid-1]);
			SendClientMessageEx(playerid, COLOR_WHITE, string);

		}
		case 2: // Backpack
		{
			if(StorageInfo[playerid][1][sStorage] == 0)
			{
				SendClientMessageEx(playerid, COLOR_WHITE, "You do not own a Backpack. You may purchase one on our E-Store.");
				return 0;
			}

			if(itemid == 1 && (StorageInfo[playerid][1][sCash] + amount <= backpacklimit[itemid-1]))
			{
				// Check if Sending Player has sufficient amount.
				if(fromplayerid != -1 && fromstorageid != -1)
				{
					if(fromstorageid == 0)
					{
						if(PlayerInfo[fromplayerid][pCash] < amount)
						{
							format(string, sizeof(string), "Ban khong co du tien de cung cap $%d %s.", amount, itemtype[itemid]);
							SendClientMessageEx(fromplayerid, COLOR_WHITE, string);
							return 0;
						}
					}
					else
					{
						if(StorageInfo[fromplayerid][fromstorageid-1][sCash] < amount)
						{
							format(string, sizeof(string), "Ban khong co du tien de cung cap $%d %s.", amount, itemtype[itemid]);
							SendClientMessageEx(fromplayerid, COLOR_WHITE, string);
							return 0;
						}
					}

					if(fromstorageid == 0) PlayerInfo[fromplayerid][pCash] -= amount;
					else StorageInfo[fromplayerid][fromstorageid-1][sCash] -= amount;
				}
				PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
				StorageInfo[playerid][1][sCash] += amount;
				format(string, sizeof(string), "$%d has been transfered to your Backpack ($%d/$%d).", amount, StorageInfo[playerid][1][sCash], backpacklimit[itemid-1]);
				SendClientMessage(playerid, COLOR_WHITE, string);

				if(fromplayerid != -1 && fromstorageid != -1 && playerid != fromplayerid) {
					format(string, sizeof(string), "$%d da duoc chuyen tu %s cho %s's %s.", amount, storagetype[fromstorageid], GetPlayerNameEx(playerid), storagetype[storageid]);
					SendClientMessage(fromplayerid, COLOR_WHITE, string);

					PlayerPlaySound(fromplayerid, 1052, 0.0, 0.0, 0.0);
					format(string, sizeof(string), "* %s lay mot so %s tu %s, va giao no cho %s.", GetPlayerNameEx(fromplayerid), itemtype[itemid], storagetype[fromstorageid], GetPlayerNameEx(playerid));
					ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);

					new ipplayerid[16], ipfromplayerid[16];
					GetPlayerIp(playerid, ipplayerid, sizeof(ipplayerid));
					GetPlayerIp(fromplayerid, ipfromplayerid, sizeof(ipfromplayerid));

					if(PlayerInfo[playerid][pAdmin] >= 2 || PlayerInfo[fromplayerid][pAdmin] >= 2)
					{
						format(string, sizeof(string), "[Admin] %s(%d) (IP:%s) has given %s %s to %s(%d) (IP:%s)", GetPlayerNameEx(fromplayerid), GetPlayerSQLId(fromplayerid), ipfromplayerid, number_format(amount), itemtype[itemid], GetPlayerNameEx(playerid), GetPlayerSQLId(playerid), ipplayerid);
						Log("logs/adminpay.log", string);
						format(string, sizeof(string), "{AA3333}AdmWarning{FFFF00}: %s has given %s %s to %s", GetPlayerNameEx(fromplayerid), number_format(amount), itemtype[itemid], GetPlayerNameEx(playerid));
						if(!strcmp(GetPlayerIpEx(playerid),  GetPlayerIpEx(fromplayerid), true)) strcat(string, " (1)");
						ABroadCast(COLOR_YELLOW, string, 4);
					}
					else
					{
						format(string, sizeof(string), "%s(%d) (IP:%s) has given %s %s to %s(%d) (IP:%s)", GetPlayerNameEx(fromplayerid), GetPlayerSQLId(fromplayerid), ipfromplayerid, number_format(amount), itemtype[itemid], GetPlayerNameEx(playerid), GetPlayerSQLId(playerid), ipplayerid);
						Log("logs/pay.log", string);
						format(string, sizeof(string), "%s (IP:%s) has given %s %s to %s (IP:%s)", GetPlayerNameEx(fromplayerid), ipfromplayerid, number_format(amount), itemtype[itemid], GetPlayerNameEx(playerid), ipplayerid);
						if(amount >= 100000 && PlayerInfo[fromplayerid][pLevel] <= 3 && itemid == 1) ABroadCast(COLOR_YELLOW, string, 2);
						if(amount >= 1000000 && itemid == 1)	ABroadCast(COLOR_YELLOW,string,2);
					}
				}
				return 1;
			}
			if(itemid == 2 && (StorageInfo[playerid][1][sPot] + amount <= backpacklimit[itemid-1]))
			{
				// Check if Sending Player has sufficient amount.
				if(fromplayerid != -1 && fromstorageid != -1)
				{
					if(fromstorageid == 0)
					{
						if(PlayerInfo[fromplayerid][pDrugs][1] < amount)
						{
							format(string, sizeof(string), "Ban khong co du tien de cung cap $%d %s.", amount, itemtype[itemid]);
							SendClientMessageEx(fromplayerid, COLOR_WHITE, string);
							return 0;
						}
					}
					else
					{
						if(StorageInfo[fromplayerid][fromstorageid-1][sPot] < amount)
						{
							format(string, sizeof(string), "Ban khong co du tien de cung cap $%d %s.", amount, itemtype[itemid]);
							SendClientMessageEx(fromplayerid, COLOR_WHITE, string);
							return 0;
						}
					}

					if(fromstorageid == 0) PlayerInfo[fromplayerid][pDrugs][1] -= amount;
					else StorageInfo[fromplayerid][fromstorageid-1][sPot] -= amount;
				}
				PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
				StorageInfo[playerid][1][sPot] += amount;
				format(string, sizeof(string), "%d Pot has been transfered to your Backpack (%d/%d).", amount, StorageInfo[playerid][1][sPot], backpacklimit[itemid-1]);
				SendClientMessage(playerid, COLOR_WHITE, string);

				if(fromplayerid != -1 && fromstorageid != -1 && playerid != fromplayerid) {
					format(string, sizeof(string), "%d Pot da duoc chuyen tu %s cho %s's %s.", amount, storagetype[fromstorageid], GetPlayerNameEx(playerid), storagetype[storageid]);
					SendClientMessage(fromplayerid, COLOR_WHITE, string);

					PlayerPlaySound(fromplayerid, 1052, 0.0, 0.0, 0.0);
					format(string, sizeof(string), "* %s lay mot so %s tu %s, va giao no cho %s.", GetPlayerNameEx(fromplayerid), itemtype[itemid], storagetype[fromstorageid], GetPlayerNameEx(playerid));
					ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);

					new ipplayerid[16], ipfromplayerid[16];
					GetPlayerIp(playerid, ipplayerid, sizeof(ipplayerid));
					GetPlayerIp(fromplayerid, ipfromplayerid, sizeof(ipfromplayerid));

					if(PlayerInfo[playerid][pAdmin] >= 2 || PlayerInfo[fromplayerid][pAdmin] >= 2)
					{
						format(string, sizeof(string), "[Admin] %s(%d) (IP:%s) has given %s %s to %s(%d) (IP:%s)", GetPlayerNameEx(fromplayerid), GetPlayerSQLId(fromplayerid), ipfromplayerid, number_format(amount), itemtype[itemid], GetPlayerNameEx(playerid), GetPlayerSQLId(playerid), ipplayerid);
						Log("logs/adminpay.log", string);
						format(string, sizeof(string), "{AA3333}AdmWarning{FFFF00}: %s has given %s %s to %s", GetPlayerNameEx(fromplayerid), number_format(amount), itemtype[itemid], GetPlayerNameEx(playerid));
						if(!strcmp(GetPlayerIpEx(playerid),  GetPlayerIpEx(fromplayerid), true)) strcat(string, " (1)");
						ABroadCast(COLOR_YELLOW, string, 4);
					}
					else
					{
						format(string, sizeof(string), "%s(%d) (IP:%s) has given %s %s to %s(%d) (IP:%s)", GetPlayerNameEx(fromplayerid), GetPlayerSQLId(fromplayerid), ipfromplayerid, number_format(amount), itemtype[itemid], GetPlayerNameEx(playerid), GetPlayerSQLId(playerid), ipplayerid);
						Log("logs/pay.log", string);
						format(string, sizeof(string), "%s (IP:%s) has given %s %s to %s (IP:%s)", GetPlayerNameEx(fromplayerid), ipfromplayerid, number_format(amount), itemtype[itemid], GetPlayerNameEx(playerid), ipplayerid);
						if(amount >= 100000 && PlayerInfo[fromplayerid][pLevel] <= 3 && itemid == 1) ABroadCast(COLOR_YELLOW, string, 2);
						if(amount >= 1000000 && itemid == 1)	ABroadCast(COLOR_YELLOW,string,2);
					}
				}
				return 1;
			}
			if(itemid == 3 && (StorageInfo[playerid][1][sCrack] + amount <= backpacklimit[itemid-1]))
			{
				// Check if Sending Player has sufficient amount.
				if(fromplayerid != -1 && fromstorageid != -1)
				{
					if(fromstorageid == 0)
					{
						if(PlayerInfo[fromplayerid][pDrugs][2] < amount)
						{
							format(string, sizeof(string), "Ban khong co du tien de cung cap $%d %s.", amount, itemtype[itemid]);
							SendClientMessageEx(fromplayerid, COLOR_WHITE, string);
							return 0;
						}
					}
					else
					{
						if(StorageInfo[fromplayerid][fromstorageid-1][sCrack] < amount)
						{
							format(string, sizeof(string), "Ban khong co du tien de cung cap $%d %s.", amount, itemtype[itemid]);
							SendClientMessageEx(fromplayerid, COLOR_WHITE, string);
							return 0;
						}
					}

					if(fromstorageid == 0) PlayerInfo[fromplayerid][pDrugs][2] -= amount;
					else StorageInfo[fromplayerid][fromstorageid-1][sCrack] -= amount;
				}
				PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
				StorageInfo[playerid][1][sCrack] += amount;
				format(string, sizeof(string), "%d Crack has been transfered to your Backpack (%d/%d).", amount, StorageInfo[playerid][1][sCrack], backpacklimit[itemid-1]);
				SendClientMessage(playerid, COLOR_WHITE, string);

				if(fromplayerid != -1 && fromstorageid != -1 && playerid != fromplayerid) {
					format(string, sizeof(string), "%d Crack da duoc chuyen tu %s cho %s's %s.", amount, storagetype[fromstorageid], GetPlayerNameEx(playerid), storagetype[storageid]);
					SendClientMessage(fromplayerid, COLOR_WHITE, string);

					PlayerPlaySound(fromplayerid, 1052, 0.0, 0.0, 0.0);
					format(string, sizeof(string), "* %s lay mot so %s tu %s, va giao no cho %s.", GetPlayerNameEx(fromplayerid), itemtype[itemid], storagetype[fromstorageid], GetPlayerNameEx(playerid));
					ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);

					new ipplayerid[16], ipfromplayerid[16];
					GetPlayerIp(playerid, ipplayerid, sizeof(ipplayerid));
					GetPlayerIp(fromplayerid, ipfromplayerid, sizeof(ipfromplayerid));

					if(PlayerInfo[playerid][pAdmin] >= 2 || PlayerInfo[fromplayerid][pAdmin] >= 2)
					{
						format(string, sizeof(string), "[Admin] %s(%d) (IP:%s) has given %s %s to %s(%d) (IP:%s)", GetPlayerNameEx(fromplayerid), GetPlayerSQLId(fromplayerid), ipfromplayerid, number_format(amount), itemtype[itemid], GetPlayerNameEx(playerid), GetPlayerSQLId(playerid), ipplayerid);
						Log("logs/adminpay.log", string);
						format(string, sizeof(string), "{AA3333}AdmWarning{FFFF00}: %s has given %s %s to %s", GetPlayerNameEx(fromplayerid), number_format(amount), itemtype[itemid], GetPlayerNameEx(playerid));
						if(!strcmp(GetPlayerIpEx(playerid),  GetPlayerIpEx(fromplayerid), true)) strcat(string, " (1)");
						ABroadCast(COLOR_YELLOW, string, 4);
					}
					else
					{
						format(string, sizeof(string), "%s(%d) (IP:%s) has given %s %s to %s(%d) (IP:%s)", GetPlayerNameEx(fromplayerid), GetPlayerSQLId(fromplayerid), ipfromplayerid, number_format(amount), itemtype[itemid], GetPlayerNameEx(playerid), GetPlayerSQLId(playerid), ipplayerid);
						Log("logs/pay.log", string);
						format(string, sizeof(string), "%s (IP:%s) has given %s %s to %s (IP:%s)", GetPlayerNameEx(fromplayerid), ipfromplayerid, number_format(amount), itemtype[itemid], GetPlayerNameEx(playerid), ipplayerid);
						if(amount >= 100000 && PlayerInfo[fromplayerid][pLevel] <= 3 && itemid == 1) ABroadCast(COLOR_YELLOW, string, 2);
						if(amount >= 1000000 && itemid == 1)	ABroadCast(COLOR_YELLOW,string,2);
					}
				}
				return 1;
			}
			if(itemid == 4 && (StorageInfo[playerid][1][sMats] + amount <= backpacklimit[itemid-1]))
			{
				// Check if Sending Player has sufficient amount.
				if(fromplayerid != -1 && fromstorageid != -1)
				{
					if(fromstorageid == 0)
					{
						if(PlayerInfo[fromplayerid][pMats] < amount)
						{
							format(string, sizeof(string), "Ban khong co du tien de cung cap $%d %s.", amount, itemtype[itemid]);
							SendClientMessageEx(fromplayerid, COLOR_WHITE, string);
							return 0;
						}
					}
					else
					{
						if(StorageInfo[fromplayerid][fromstorageid-1][sMats] < amount)
						{
							format(string, sizeof(string), "Ban khong co du tien de cung cap $%d %s.", amount, itemtype[itemid]);
							SendClientMessageEx(fromplayerid, COLOR_WHITE, string);
							return 0;
						}
					}

					if(fromstorageid == 0) PlayerInfo[fromplayerid][pMats] -= amount;
					else StorageInfo[fromplayerid][fromstorageid-1][sMats] -= amount;
				}
				PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
				StorageInfo[playerid][1][sMats] += amount;
				format(string, sizeof(string), "%d Materials has been transfered to your Backpack (%d/%d).", amount, StorageInfo[playerid][1][sMats], backpacklimit[itemid-1]);
				SendClientMessage(playerid, COLOR_WHITE, string);

				if(fromplayerid != -1 && fromstorageid != -1 && playerid != fromplayerid) {
					format(string, sizeof(string), "%d Materials da duoc chuyen tu %s cho %s's %s.", amount, storagetype[fromstorageid], GetPlayerNameEx(playerid), storagetype[storageid]);
					SendClientMessage(fromplayerid, COLOR_WHITE, string);

					PlayerPlaySound(fromplayerid, 1052, 0.0, 0.0, 0.0);
					format(string, sizeof(string), "* %s lay mot so %s tu %s, va giao no cho %s.", GetPlayerNameEx(fromplayerid), itemtype[itemid], storagetype[fromstorageid], GetPlayerNameEx(playerid));
					ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);

					new ipplayerid[16], ipfromplayerid[16];
					GetPlayerIp(playerid, ipplayerid, sizeof(ipplayerid));
					GetPlayerIp(fromplayerid, ipfromplayerid, sizeof(ipfromplayerid));

					if(PlayerInfo[playerid][pAdmin] >= 2 || PlayerInfo[fromplayerid][pAdmin] >= 2)
					{
						format(string, sizeof(string), "[Admin] %s(%d) (IP:%s) has given %s %s to %s(%d) (IP:%s)", GetPlayerNameEx(fromplayerid), GetPlayerSQLId(fromplayerid), ipfromplayerid, number_format(amount), itemtype[itemid], GetPlayerNameEx(playerid), GetPlayerSQLId(playerid), ipplayerid);
						Log("logs/adminpay.log", string);
						format(string, sizeof(string), "{AA3333}AdmWarning{FFFF00}: %s has given %s %s to %s", GetPlayerNameEx(fromplayerid), number_format(amount), itemtype[itemid], GetPlayerNameEx(playerid));
						if(!strcmp(GetPlayerIpEx(playerid),  GetPlayerIpEx(fromplayerid), true)) strcat(string, " (1)");
						ABroadCast(COLOR_YELLOW, string, 4);
					}
					else
					{
						format(string, sizeof(string), "%s(%d) (IP:%s) has given %s %s to %s(%d) (IP:%s)", GetPlayerNameEx(fromplayerid), GetPlayerSQLId(fromplayerid), ipfromplayerid, number_format(amount), itemtype[itemid], GetPlayerNameEx(playerid), GetPlayerSQLId(playerid), ipplayerid);
						Log("logs/pay.log", string);
						format(string, sizeof(string), "%s (IP:%s) has given %s %s to %s (IP:%s)", GetPlayerNameEx(fromplayerid), ipfromplayerid, number_format(amount), itemtype[itemid], GetPlayerNameEx(playerid), ipplayerid);
						if(amount >= 100000 && PlayerInfo[fromplayerid][pLevel] <= 3 && itemid == 1) ABroadCast(COLOR_YELLOW, string, 2);
						if(amount >= 1000000 && itemid == 1)	ABroadCast(COLOR_YELLOW,string,2);
					}
				}
				return 1;
			}
			if(itemid == 1) format(string, sizeof(string), "Khong the chuyen $%d to %s ($%d/$%d).", amount, storagetype[storageid], StorageInfo[playerid][1][sCash], backpacklimit[itemid-1]);
			else if(itemid == 2) format(string, sizeof(string), "Khong the chuyen %d %s to %s (%d/%d).", amount, itemtype[itemid], storagetype[storageid], StorageInfo[playerid][1][sPot], backpacklimit[itemid-1]);
			else if(itemid == 3) format(string, sizeof(string), "Khong the chuyen %d %s to %s (%d/%d).", amount, itemtype[itemid], storagetype[storageid], StorageInfo[playerid][1][sCrack], backpacklimit[itemid-1]);
			else if(itemid == 4) format(string, sizeof(string), "Khong the chuyen %d %s to %s (%d/%d).", amount, itemtype[itemid], storagetype[storageid], StorageInfo[playerid][1][sMats], backpacklimit[itemid-1]);
			SendClientMessageEx(playerid, COLOR_WHITE, string);
		}
		case 3: // Briefcase
		{
			if(StorageInfo[playerid][2][sStorage] == 0)
			{
				SendClientMessageEx(playerid, COLOR_WHITE, "You do not own a Briefcase. You may purchase one on our E-Store.");
				return 0;
			}

			if(itemid == 1 && (StorageInfo[playerid][2][sCash] + amount <= briefcaselimit[itemid-1]))
			{
				// Check if Sending Player has sufficient amount.
				if(fromplayerid != -1 && fromstorageid != -1)
				{
					if(fromstorageid == 0)
					{
						if(PlayerInfo[fromplayerid][pCash] < amount)
						{
							format(string, sizeof(string), "Ban khong co du tien de cung cap $%d %s.", amount, itemtype[itemid]);
							SendClientMessageEx(fromplayerid, COLOR_WHITE, string);
							return 0;
						}
					}
					else
					{
						if(StorageInfo[fromplayerid][fromstorageid-1][sCash] < amount)
						{
							format(string, sizeof(string), "Ban khong co du tien de cung cap $%d %s.", amount, itemtype[itemid]);
							SendClientMessageEx(fromplayerid, COLOR_WHITE, string);
							return 0;
						}
					}

					if(fromstorageid == 0) PlayerInfo[fromplayerid][pCash] -= amount;
					else StorageInfo[fromplayerid][fromstorageid-1][sCash] -= amount;
				}
				PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
				StorageInfo[playerid][2][sCash] += amount;
				format(string, sizeof(string), "$%d da duoc chuyen den Briefcase cua ban ($%d/$%d).", amount, StorageInfo[playerid][2][sCash], briefcaselimit[itemid-1]);
				SendClientMessage(playerid, COLOR_WHITE, string);

				if(fromplayerid != -1 && fromstorageid != -1 && playerid != fromplayerid) {
					format(string, sizeof(string), "$%d da duoc chuyen tu %s cho %s's %s.", amount, storagetype[fromstorageid], GetPlayerNameEx(playerid), storagetype[storageid]);
					SendClientMessage(fromplayerid, COLOR_WHITE, string);

					PlayerPlaySound(fromplayerid, 1052, 0.0, 0.0, 0.0);
					format(string, sizeof(string), "* %s lay mot so %s tu %s, va giao no cho %s.", GetPlayerNameEx(fromplayerid), itemtype[itemid], storagetype[fromstorageid], GetPlayerNameEx(playerid));
					ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);

					new ipplayerid[16], ipfromplayerid[16];
					GetPlayerIp(playerid, ipplayerid, sizeof(ipplayerid));
					GetPlayerIp(fromplayerid, ipfromplayerid, sizeof(ipfromplayerid));

					if(PlayerInfo[playerid][pAdmin] >= 2 || PlayerInfo[fromplayerid][pAdmin] >= 2)
					{
						format(string, sizeof(string), "[Admin] %s(%d) (IP:%s) has given %s %s to %s(%d) (IP:%s)", GetPlayerNameEx(fromplayerid), GetPlayerSQLId(fromplayerid), ipfromplayerid, number_format(amount), itemtype[itemid], GetPlayerNameEx(playerid), GetPlayerSQLId(playerid), ipplayerid);
						Log("logs/adminpay.log", string);
						format(string, sizeof(string), "{AA3333}AdmWarning{FFFF00}: %s has given %s %s to %s", GetPlayerNameEx(fromplayerid), number_format(amount), itemtype[itemid], GetPlayerNameEx(playerid));
						if(!strcmp(GetPlayerIpEx(playerid),  GetPlayerIpEx(fromplayerid), true)) strcat(string, " (1)");
						ABroadCast(COLOR_YELLOW, string, 4);
					}
					else
					{
						format(string, sizeof(string), "%s(%d) (IP:%s) has given %s %s to %s(%d) (IP:%s)", GetPlayerNameEx(fromplayerid), GetPlayerSQLId(fromplayerid), ipfromplayerid, number_format(amount), itemtype[itemid], GetPlayerNameEx(playerid), GetPlayerSQLId(playerid), ipplayerid);
						Log("logs/pay.log", string);
						format(string, sizeof(string), "%s (IP:%s) has given %s %s to %s (IP:%s)", GetPlayerNameEx(fromplayerid), ipfromplayerid, number_format(amount), itemtype[itemid], GetPlayerNameEx(playerid), ipplayerid);
						if(amount >= 100000 && PlayerInfo[fromplayerid][pLevel] <= 3 && itemid == 1) ABroadCast(COLOR_YELLOW, string, 2);
						if(amount >= 1000000 && itemid == 1)	ABroadCast(COLOR_YELLOW,string,2);
					}
				}
				return 1;
			}
			if(itemid == 2 && (StorageInfo[playerid][2][sPot] + amount <= briefcaselimit[itemid-1]))
			{
				// Check if Sending Player has sufficient amount.
				if(fromplayerid != -1 && fromstorageid != -1)
				{
					if(fromstorageid == 0)
					{
						if(PlayerInfo[fromplayerid][pDrugs][1] < amount)
						{
							format(string, sizeof(string), "Ban khong co du tien de cung cap %d %s.", amount, itemtype[itemid]);
							SendClientMessageEx(fromplayerid, COLOR_WHITE, string);
							return 0;
						}
					}
					else
					{
						if(StorageInfo[fromplayerid][fromstorageid-1][sPot] < amount)
						{
							format(string, sizeof(string), "Ban khong co du tien de cung cap %d %s.", amount, itemtype[itemid]);
							SendClientMessageEx(fromplayerid, COLOR_WHITE, string);
							return 0;
						}
					}

					if(fromstorageid == 0) PlayerInfo[fromplayerid][pDrugs][1] -= amount;
					else StorageInfo[fromplayerid][fromstorageid-1][sPot] -= amount;
				}
				PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
				StorageInfo[playerid][2][sPot] += amount;
				format(string, sizeof(string), "%d Pot da duoc chuyen den Briefcase cua ban (%d/%d).", amount, StorageInfo[playerid][2][sPot], briefcaselimit[itemid-1]);
				SendClientMessage(playerid, COLOR_WHITE, string);

				if(fromplayerid != -1 && fromstorageid != -1 && playerid != fromplayerid) {
					format(string, sizeof(string), "%d Pot da duoc chuyen tu %s cho %s's %s.", amount, storagetype[fromstorageid], GetPlayerNameEx(playerid), storagetype[storageid]);
					SendClientMessage(fromplayerid, COLOR_WHITE, string);

					PlayerPlaySound(fromplayerid, 1052, 0.0, 0.0, 0.0);
					format(string, sizeof(string), "* %s lay mot so %s tu %s, va giao no cho %s.", GetPlayerNameEx(fromplayerid), itemtype[itemid], storagetype[fromstorageid], GetPlayerNameEx(playerid));
					ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);

					new ipplayerid[16], ipfromplayerid[16];
					GetPlayerIp(playerid, ipplayerid, sizeof(ipplayerid));
					GetPlayerIp(fromplayerid, ipfromplayerid, sizeof(ipfromplayerid));

					if(PlayerInfo[playerid][pAdmin] >= 2 || PlayerInfo[fromplayerid][pAdmin] >= 2)
					{
						format(string, sizeof(string), "[Admin] %s(%d) (IP:%s) has given %s %s to %s(%d) (IP:%s)", GetPlayerNameEx(fromplayerid), GetPlayerSQLId(fromplayerid), ipfromplayerid, number_format(amount), itemtype[itemid], GetPlayerNameEx(playerid), GetPlayerSQLId(playerid), ipplayerid);
						Log("logs/adminpay.log", string);
						format(string, sizeof(string), "{AA3333}AdmWarning{FFFF00}: %s has given %s %s to %s", GetPlayerNameEx(fromplayerid), number_format(amount), itemtype[itemid], GetPlayerNameEx(playerid));
						if(!strcmp(GetPlayerIpEx(playerid),  GetPlayerIpEx(fromplayerid), true)) strcat(string, " (1)");
						ABroadCast(COLOR_YELLOW, string, 4);
					}
					else
					{
						format(string, sizeof(string), "%s(%d) (IP:%s) has given %s %s to %s(%d) (IP:%s)", GetPlayerNameEx(fromplayerid), GetPlayerSQLId(fromplayerid), ipfromplayerid, number_format(amount), itemtype[itemid], GetPlayerNameEx(playerid), GetPlayerSQLId(playerid), ipplayerid);
						Log("logs/pay.log", string);
						format(string, sizeof(string), "%s (IP:%s) has given %s %s to %s (IP:%s)", GetPlayerNameEx(fromplayerid), ipfromplayerid, number_format(amount), itemtype[itemid], GetPlayerNameEx(playerid), ipplayerid);
						if(amount >= 100000 && PlayerInfo[fromplayerid][pLevel] <= 3 && itemid == 1) ABroadCast(COLOR_YELLOW, string, 2);
						if(amount >= 1000000 && itemid == 1)	ABroadCast(COLOR_YELLOW,string,2);
					}
				}
				return 1;
			}
			if(itemid == 3 && (StorageInfo[playerid][2][sCrack] + amount <= briefcaselimit[itemid-1]))
			{
				// Check if Sending Player has sufficient amount.
				if(fromplayerid != -1 && fromstorageid != -1)
				{
					if(fromstorageid == 0)
					{
						if(PlayerInfo[fromplayerid][pDrugs][2] < amount)
						{
							format(string, sizeof(string), "Ban khong co du tien de cung cap %d %s.", amount, itemtype[itemid]);
							SendClientMessageEx(fromplayerid, COLOR_WHITE, string);
							return 0;
						}
					}
					else
					{
						if(StorageInfo[fromplayerid][fromstorageid-1][sCrack] < amount)
						{
							format(string, sizeof(string), "Ban khong co du tien de cung cap %d %s.", amount, itemtype[itemid]);
							SendClientMessageEx(fromplayerid, COLOR_WHITE, string);
							return 0;
						}
					}

					if(fromstorageid == 0) PlayerInfo[fromplayerid][pDrugs][2] -= amount;
					else StorageInfo[fromplayerid][fromstorageid-1][sCrack] -= amount;
				}
				PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
				StorageInfo[playerid][2][sCrack] += amount;
				format(string, sizeof(string), "%d Crack da duoc chuyen den Briefcase cua ban. (%d/%d)", amount, StorageInfo[playerid][2][sCrack], briefcaselimit[itemid-1]);
				SendClientMessage(playerid, COLOR_WHITE, string);

				if(fromplayerid != -1 && fromstorageid != -1 && playerid != fromplayerid) {
					format(string, sizeof(string), "%d Crack da duoc chuyen tu %s cho %s's %s.", amount, storagetype[fromstorageid], GetPlayerNameEx(playerid), storagetype[storageid]);
					SendClientMessage(fromplayerid, COLOR_WHITE, string);

					PlayerPlaySound(fromplayerid, 1052, 0.0, 0.0, 0.0);
					format(string, sizeof(string), "* %s lay mot so %s tu %s, va giao no cho %s.", GetPlayerNameEx(fromplayerid), itemtype[itemid], storagetype[fromstorageid], GetPlayerNameEx(playerid));
					ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);

					new ipplayerid[16], ipfromplayerid[16];
					GetPlayerIp(playerid, ipplayerid, sizeof(ipplayerid));
					GetPlayerIp(fromplayerid, ipfromplayerid, sizeof(ipfromplayerid));

					if(PlayerInfo[playerid][pAdmin] >= 2 || PlayerInfo[fromplayerid][pAdmin] >= 2)
					{
						format(string, sizeof(string), "[Admin] %s(%d) (IP:%s) has given %s %s to %s(%d) (IP:%s)", GetPlayerNameEx(fromplayerid), GetPlayerSQLId(fromplayerid), ipfromplayerid, number_format(amount), itemtype[itemid], GetPlayerNameEx(playerid), GetPlayerSQLId(playerid), ipplayerid);
						Log("logs/adminpay.log", string);
						format(string, sizeof(string), "{AA3333}AdmWarning{FFFF00}: %s has given %s %s to %s", GetPlayerNameEx(fromplayerid), number_format(amount), itemtype[itemid], GetPlayerNameEx(playerid));
						if(!strcmp(GetPlayerIpEx(playerid),  GetPlayerIpEx(fromplayerid), true)) strcat(string, " (1)");
						ABroadCast(COLOR_YELLOW, string, 4);
					}
					else
					{
						format(string, sizeof(string), "%s(%d) (IP:%s) has given %s %s to %s(%d) (IP:%s)", GetPlayerNameEx(fromplayerid), GetPlayerSQLId(fromplayerid), ipfromplayerid, number_format(amount), itemtype[itemid], GetPlayerNameEx(playerid), GetPlayerSQLId(playerid), ipplayerid);
						Log("logs/pay.log", string);
						format(string, sizeof(string), "%s (IP:%s) has given %s %s to %s (IP:%s)", GetPlayerNameEx(fromplayerid), ipfromplayerid, number_format(amount), itemtype[itemid], GetPlayerNameEx(playerid), ipplayerid);
						if(amount >= 100000 && PlayerInfo[fromplayerid][pLevel] <= 3 && itemid == 1) ABroadCast(COLOR_YELLOW, string, 2);
						if(amount >= 1000000 && itemid == 1)	ABroadCast(COLOR_YELLOW,string,2);
					}
				}
				return 1;
			}
			if(itemid == 4 && (StorageInfo[playerid][2][sMats] + amount <= briefcaselimit[itemid-1]))
			{
				// Check if Sending Player has sufficient amount.
				if(fromplayerid != -1 && fromstorageid != -1)
				{
					if(fromstorageid == 0)
					{
						if(PlayerInfo[fromplayerid][pMats] < amount)
						{
							format(string, sizeof(string), "Ban khong co du tien de cung cap $%d %s.", amount, itemtype[itemid]);
							SendClientMessageEx(fromplayerid, COLOR_WHITE, string);
							return 0;
						}
					}
					else
					{
						if(StorageInfo[fromplayerid][fromstorageid-1][sMats] < amount)
						{
							format(string, sizeof(string), "Ban khong co du tien de cung cap $%d %s.", amount, itemtype[itemid]);
							SendClientMessageEx(fromplayerid, COLOR_WHITE, string);
							return 0;
						}
					}

					if(fromstorageid == 0) PlayerInfo[fromplayerid][pMats] -= amount;
					else StorageInfo[fromplayerid][fromstorageid-1][sMats] -= amount;
				}
				PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
				StorageInfo[playerid][2][sMats] += amount;
				format(string, sizeof(string), "%d Vat lieu da duoc chuyen den Briefcase cua ban (%d/%d).", amount, StorageInfo[playerid][2][sMats], briefcaselimit[itemid-1]);
				SendClientMessage(playerid, COLOR_WHITE, string);

				if(fromplayerid != -1 && fromstorageid != -1 && playerid != fromplayerid) {
					format(string, sizeof(string), "%d Materials da duoc chuyen tu %s cho %s's %s.", amount, storagetype[fromstorageid], GetPlayerNameEx(playerid), storagetype[storageid]);
					SendClientMessage(fromplayerid, COLOR_WHITE, string);

					PlayerPlaySound(fromplayerid, 1052, 0.0, 0.0, 0.0);
					format(string, sizeof(string), "* %s lay mot so %s tu %s, va giao no cho %s.", GetPlayerNameEx(fromplayerid), itemtype[itemid], storagetype[fromstorageid], GetPlayerNameEx(playerid));
					ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);

					new ipplayerid[16], ipfromplayerid[16];
					GetPlayerIp(playerid, ipplayerid, sizeof(ipplayerid));
					GetPlayerIp(fromplayerid, ipfromplayerid, sizeof(ipfromplayerid));

					if(PlayerInfo[playerid][pAdmin] >= 2 || PlayerInfo[fromplayerid][pAdmin] >= 2)
					{
						format(string, sizeof(string), "[Admin] %s(%d) (IP:%s) has given %s %s to %s(%d) (IP:%s)", GetPlayerNameEx(fromplayerid), GetPlayerSQLId(fromplayerid), ipfromplayerid, number_format(amount), itemtype[itemid], GetPlayerNameEx(playerid), GetPlayerSQLId(playerid), ipplayerid);
						Log("logs/adminpay.log", string);
						format(string, sizeof(string), "{AA3333}AdmWarning{FFFF00}: %s has given %s %s to %s", GetPlayerNameEx(fromplayerid), number_format(amount), itemtype[itemid], GetPlayerNameEx(playerid));
						if(!strcmp(GetPlayerIpEx(playerid),  GetPlayerIpEx(fromplayerid), true)) strcat(string, " (1)");
						ABroadCast(COLOR_YELLOW, string, 4);
					}
					else
					{
						format(string, sizeof(string), "%s(%d) (IP:%s) has given %s %s to %s(%d) (IP:%s)", GetPlayerNameEx(fromplayerid), GetPlayerSQLId(fromplayerid), ipfromplayerid, number_format(amount), itemtype[itemid], GetPlayerNameEx(playerid), GetPlayerSQLId(playerid), ipplayerid);
						Log("logs/pay.log", string);
						format(string, sizeof(string), "%s (IP:%s) has given %s %s to %s (IP:%s)", GetPlayerNameEx(fromplayerid), ipfromplayerid, number_format(amount), itemtype[itemid], GetPlayerNameEx(playerid), ipplayerid);
						if(amount >= 100000 && PlayerInfo[fromplayerid][pLevel] <= 3 && itemid == 1) ABroadCast(COLOR_YELLOW, string, 2);
						if(amount >= 1000000 && itemid == 1)	ABroadCast(COLOR_YELLOW,string,2);
					}
				}
				return 1;
			}

			if(itemid == 1) format(string, sizeof(string), "Khong the chuyen $%d to %s ($%d/$%d).", amount, storagetype[storageid], StorageInfo[playerid][2][sCash], briefcaselimit[itemid-1]);
			else if(itemid == 2) format(string, sizeof(string), "Khong the chuyen %d %s to %s (%d/%d).", amount, itemtype[itemid], storagetype[storageid], StorageInfo[playerid][2][sPot], briefcaselimit[itemid-1]);
			else if(itemid == 3) format(string, sizeof(string), "Khong the chuyen %d %s to %s (%d/%d).", amount, itemtype[itemid], storagetype[storageid], StorageInfo[playerid][2][sCrack], briefcaselimit[itemid-1]);
			else if(itemid == 4) format(string, sizeof(string), "Khong the chuyen %d %s to %s (%d/%d).", amount, itemtype[itemid], storagetype[storageid], StorageInfo[playerid][2][sMats], briefcaselimit[itemid-1]);
			SendClientMessageEx(playerid, COLOR_WHITE, string);
		}
	}
	return 0;
}

stock ShowInventory(playerid,targetid)
{
	if(IsPlayerConnected(targetid))
	{
		new resultline[1024], header[64], pnumber[20], toolboxstring[30];
		if(PlayerInfo[targetid][pPnumber] == 0) pnumber = "None"; else format(pnumber, sizeof(pnumber), "%d", PlayerInfo[targetid][pPnumber]);

		new totalwealth;
		totalwealth = PlayerInfo[targetid][pAccount] + GetPlayerCash(targetid);
		if(PlayerInfo[targetid][pPhousekey] != INVALID_HOUSE_ID && HouseInfo[PlayerInfo[targetid][pPhousekey]][hOwnerID] == GetPlayerSQLId(targetid)) totalwealth += HouseInfo[PlayerInfo[targetid][pPhousekey]][hSafeMoney];
		if(PlayerInfo[targetid][pPhousekey2] != INVALID_HOUSE_ID && HouseInfo[PlayerInfo[targetid][pPhousekey2]][hOwnerID] == GetPlayerSQLId(targetid)) totalwealth += HouseInfo[PlayerInfo[targetid][pPhousekey2]][hSafeMoney];
		if(PlayerInfo[targetid][pPhousekey3] != INVALID_HOUSE_ID && HouseInfo[PlayerInfo[targetid][pPhousekey3]][hOwnerID] == GetPlayerSQLId(targetid)) totalwealth += HouseInfo[PlayerInfo[targetid][pPhousekey3]][hSafeMoney];

		if(PlayerInfo[targetid][pToolBox] >= 1) format(toolboxstring, 50, "Tool Box: 1, (Usages: %s)", number_format(PlayerInfo[targetid][pToolBox]));
		else format(toolboxstring, 50, "Tool Box: 0");
		
		SetPVarInt(playerid, "ShowInventory", targetid);
		format(header, sizeof(header), "Tui Do %s's", GetPlayerNameEx(targetid));
		format(resultline, sizeof(resultline),"{FFFFFF}Tong Tai San: $%s\n\
		Cash: $%s\n\
		Bank: $%s\n\
		So Dien Thoai: %s\n\
		Radio Frequency: %dkhz\n\
		Vat Lieu: %s\n\
		Rope: %s\n\
		Rags: %s\n\
		Tua Vit: %s\n\
		Tires: %s\n\
		Paper: %s\n\
		Cigars: %s\n\
		Sprunk Cans: %s\n\
		Spraycans: %s\n\
		%s\n\
		Crowbar: %d",
		number_format(totalwealth),
		number_format(GetPlayerCash(targetid)),
		number_format(PlayerInfo[targetid][pAccount]),
		pnumber,
		PlayerInfo[targetid][pRadioFreq],
		number_format(PlayerInfo[targetid][pMats]),
		number_format(PlayerInfo[targetid][pRope]),
		number_format(PlayerInfo[targetid][pRags]),
		number_format(PlayerInfo[targetid][pScrewdriver]),
		number_format(PlayerInfo[targetid][pTire]),
		number_format(PlayerInfo[targetid][pPaper]),		
		number_format(PlayerInfo[targetid][pCigar]),
		number_format(PlayerInfo[targetid][pSprunk]),
		number_format(PlayerInfo[targetid][pSpraycan]),
		toolboxstring,
		PlayerInfo[targetid][pCrowBar]);
		ShowPlayerDialogEx(playerid, DISPLAY_INV, DIALOG_STYLE_MSGBOX, header, resultline, "Trang Tiep", "Dong");
	}
	return 1;
}

stock FindGunInVehicleForPlayer(ownerid, slot, playerid)
{
	new
		i = 0;
	while (i < (PlayerVehicleInfo[ownerid][slot][pvWepUpgrade] + 1) && (!PlayerVehicleInfo[ownerid][slot][pvWeapons][i] || PlayerInfo[playerid][pGuns][GetWeaponSlot(PlayerVehicleInfo[ownerid][slot][pvWeapons][i])] == PlayerVehicleInfo[ownerid][slot][pvWeapons][i]))
	{
		i++;
	}
	if (i == (PlayerVehicleInfo[ownerid][slot][pvWepUpgrade] + 1)) return -1;
	return i;
}

hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[]) {

	if(arrAntiCheat[playerid][ac_iFlags][AC_DIALOGSPOOFING] > 0) return 1;
	szMiscArray[0] = 0;
	switch(dialogid)
	{
		case DISPLAY_INV:
		{
			new targetid = GetPVarInt(playerid, "ShowInventory");
			if(IsPlayerConnected(targetid))
			{
				if(response)
				{
					new resultline[1024], header[64];

					format(header, sizeof(header), "Tui Do %s's", GetPlayerNameEx(targetid));
					format(resultline, sizeof(resultline),"{FFFFFF}Khoa: %d\n\
					First Aid Kit: %d\n\
					Receivers: %d\n\
					GPS: %d\n\
					Bug Sweeps: %d\n\
					Fireworks: %d\n\
					Boomboxes: %d\n\
					Mailboxes: %d\n\
					Rim Kits: %d\n\
					Checks: %s\n\
					Additional Vehicle Slots: %s\n\
					Additional Toy Slots: %s",
					PlayerInfo[targetid][pLock],
					PlayerInfo[targetid][pFirstaid],
					PlayerInfo[targetid][pReceiver],
					PlayerInfo[targetid][pGPS],
					PlayerInfo[targetid][pSweep],
					PlayerInfo[targetid][pFirework],
					PlayerInfo[targetid][pBoombox],
					PlayerInfo[targetid][pMailbox],
					PlayerInfo[targetid][pRimMod],
					number_format(PlayerInfo[targetid][pChecks]),
					number_format(PlayerInfo[targetid][pVehicleSlot]),
					number_format(PlayerInfo[targetid][pToySlot]));
					if(zombieevent) format(resultline, sizeof(resultline), "%s\nCure Vials: %d\nScrap Metal: %d\nAntibiotic Injections: %d\n.50 Cals: %d\nSurvivor Kits: %d\nFuel Can: %d%% Fuel", resultline, PlayerInfo[targetid][pVials], PlayerInfo[targetid][mInventory][16], PlayerInfo[targetid][mInventory][17], PlayerInfo[targetid][mPurchaseCount][18], PlayerInfo[targetid][mInventory][19], PlayerInfo[targetid][zFuelCan]);
					ShowPlayerDialogEx(playerid, DISPLAY_INV2, DIALOG_STYLE_MSGBOX, header, resultline, "Trang Dau", "Dong");
				}
				else DeletePVar(playerid, "ShowInventory");
			}
			else
			{
				SendClientMessageEx(playerid, COLOR_GRAD1, "Nguoi choi ma ban dang kiem tra da dang xuat.");
				DeletePVar(playerid, "ShowInventory");
				return 1;
			}
		}
		case DISPLAY_INV2:
		{
			new targetid = GetPVarInt(playerid, "ShowInventory");
			if(IsPlayerConnected(targetid))
			{
				if(response)
				{
					ShowInventory(playerid, targetid);
				}
				else DeletePVar(playerid, "ShowInventory");
			}
			else
			{
				SendClientMessageEx(playerid, COLOR_GRAD1, "Nguoi choi ban dang kiem tra da dang xuat.");
				DeletePVar(playerid, "ShowInventory");
				return 1;
			}
		}
	}
	return 0;
}

/*CMD:storagehelp(playerid, params[])
{
	SendClientMessageEx(playerid, COLOR_GREEN,"_______________________________________");
    SendClientMessageEx(playerid, COLOR_WHITE,"*** HELP *** - type a command for more infomation.");
    SendClientMessageEx(playerid, COLOR_GRAD3,"*** STORAGE *** /(vs)viewstorage /(es)equipstorage /personalwithdraw /personaldeposit /storagegive");
	SendClientMessageEx(playerid, COLOR_GRAD3,"*** STORAGE *** /transferstorage");
    return 1;
}*/
CMD:inv(playerid, params[]) {
	return cmd_tuido(playerid, params);
}

CMD:tuido(playerid, params[])
{
	if(gPlayerLogged{playerid} != 0) ShowInventory(playerid, playerid);
	return 1;
}

CMD:mytokens(playerid, params[])
{
	szMiscArray[0] = 0;

	SendClientMessage(playerid, COLOR_GREY, "------------------------------------------------------------------------------------------------");

	format(szMiscArray, sizeof(szMiscArray), "VIP Tokens: %s, Paintball Tokens: %s, EXP Tokens: %s (Hours: %s), Event Tokens: %s, Gold Giftbox: %s",
		number_format(PlayerInfo[playerid][pTokens]),
		number_format(PlayerInfo[playerid][pPaintTokens]),
		number_format(PlayerInfo[playerid][pEXPToken]),
		number_format(PlayerInfo[playerid][pDoubleEXP]),
		number_format(PlayerInfo[playerid][pEventTokens]),
		number_format(PlayerInfo[playerid][pGoldBoxTokens]));

	SendClientMessage(playerid, COLOR_WHITE, szMiscArray);

	SendClientMessage(playerid, COLOR_GREY, "------------------------------------------------------------------------------------------------");
	return 1;
}
CMD:catsung(playerid, params[]) {
	return cmd_trunkput(playerid, params);
}
CMD:trunkput(playerid, params[])
{
	if(GetPVarType(playerid, "IsInArena"))
	{
		SendClientMessageEx(playerid, COLOR_WHITE, "Ban khong the lam dieu nay ngay bay gio, ban dang o trong mot dau truong!");
		return 1;
	}
	if(GetPVarInt( playerid, "EventToken") != 0)
	{
		SendClientMessageEx(playerid, COLOR_GREY, "Ban khong the su dung cai nay khi dang tham giam ot su kien.");
		return 1;
	}
	if(IsPlayerInAnyVehicle(playerid)) { SendClientMessageEx(playerid, COLOR_WHITE, "Ban khong the lam dieu nay khi dang o trong xe!"); return 1; }
	if(GetPVarInt(playerid, "EMSAttempt") != 0) return SendClientMessageEx(playerid, COLOR_GRAD2, "Ban khong the su dung lenh nay!");

	new string[128], weaponchoice[32], slot;
	if(sscanf(params, "s[32]D(0)", weaponchoice, slot)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /trunkput [weapon] [slot]");

	new pvid = -1, Float: x, Float: y, Float: z;

	for(new d = 0 ; d < MAX_PLAYERVEHICLES; d++)
	{
		if(PlayerVehicleInfo[playerid][d][pvId] != INVALID_PLAYER_VEHICLE_ID) GetVehiclePos(PlayerVehicleInfo[playerid][d][pvId], x, y, z);
		if(IsPlayerInRangeOfPoint(playerid, 3.0, x, y, z))
		{
			pvid = d;
			break;
		}
	}
	if(pvid == -1) return SendClientMessageEx(playerid,COLOR_GREY,"Ban khong o gan bat ky phuong tien nao ma ban so huu.");
	new engine,lights,alarm,doors,bonnet,boot,objective;
	GetVehicleParamsEx(PlayerVehicleInfo[playerid][pvid][pvId],engine,lights,alarm,doors,bonnet,boot,objective);
	if(boot == VEHICLE_PARAMS_OFF || boot == VEHICLE_PARAMS_UNSET) return SendClientMessageEx(playerid, COLOR_GRAD3, "Ban khong the lay/de do ben trong Cop xe neu no dang dong (/car trunk) de mo no");
	if(GetVehicleModel(PlayerVehicleInfo[playerid][pvid][pvId]) == 481 || GetVehicleModel(PlayerVehicleInfo[playerid][pvid][pvId]) == 510)  return SendClientMessageEx(playerid,COLOR_GREY,"Xe do khong co Cop.");

	new Float: Health;
	GetHealth(playerid, Health);
	if(Health < 50.0) return SendClientMessageEx(playerid,COLOR_GREY,"Ban khong the cat vu khi hoac ma tuy trong o to khi suc khoe cua ban thap hon 50.");
	if (GetPVarInt(playerid, "GiveWeaponTimer") > 0)
	{
		format(string, sizeof(string), "   Ban phai doi %d truoc khi su dung vu khi khac.", GetPVarInt(playerid, "GiveWeaponTimer"));
		SendClientMessageEx(playerid,COLOR_GREY,string);
		return 1;
	}
	
	new maxslots = PlayerVehicleInfo[playerid][pvid][pvWepUpgrade]+1;
	if(slot > maxslots || slot < 1)
	{
		SendClientMessageEx(playerid, COLOR_GREY, "Vi tri khong hop le.");
		return 1;
	}

	if( PlayerVehicleInfo[playerid][pvid][pvWeapons][slot-1] != 0)
	{
		SendClientMessageEx(playerid, COLOR_GREY, "Ban da co vu khi duoc luu tru trong vi tri do roi.");
		return 1;
	}

	new weapon;
	if(strcmp(weaponchoice, "sdpistol", true, strlen(weaponchoice)) == 0)
	{
		if(pTazer{playerid} == 1) return SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong the luu tru mot Tazer!");
		if( PlayerInfo[playerid][pGuns][2] == 23 && PlayerInfo[playerid][pAGuns][2] == 0 )
		{
			SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "Ban da cat mot khau sung Silenced Pistol vao Cop xe cua ban.");
			weapon = PlayerInfo[playerid][pGuns][2];
			format(string,sizeof(string), "* %s cat khau Silenced Pistol vao cop xe cua ho.", GetPlayerNameEx(playerid));
			ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
			SetPVarInt(playerid, "GiveWeaponTimer", 10); SetTimerEx("OtherTimerEx", 1000, false, "ii", playerid, TYPE_GIVEWEAPONTIMER);
		}
	}
	else if(strcmp(weaponchoice, "9mm", true, strlen(weaponchoice)) == 0)
	{
		if( PlayerInfo[playerid][pGuns][2] == 22 && PlayerInfo[playerid][pAGuns][2] == 0 )
		{
			SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "Ban da cat mot khau sung 9MM vao Cop xe cua ban.");
			weapon = PlayerInfo[playerid][pGuns][2];
			format(string,sizeof(string), "* %s cat khau 9MM vao cop xe cua ho.", GetPlayerNameEx(playerid));
			ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
			SetPVarInt(playerid, "GiveWeaponTimer", 10); SetTimerEx("OtherTimerEx", 1000, false, "ii", playerid, TYPE_GIVEWEAPONTIMER);
		}
	}
	else if(strcmp(weaponchoice, "deagle", true, strlen(weaponchoice)) == 0)
	{
		if( PlayerInfo[playerid][pGuns][2] == 24 && PlayerInfo[playerid][pAGuns][2] == 0 )
		{
			SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "Ban da cat mot khau sung Desert Eagle vao Cop xe cua ban.");
			weapon = PlayerInfo[playerid][pGuns][2];
			format(string,sizeof(string), "* %s cat khau Desert Eagle vao cop xe cua ho.", GetPlayerNameEx(playerid));
			ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
			SetPVarInt(playerid, "GiveWeaponTimer", 10); SetTimerEx("OtherTimerEx", 1000, false, "ii", playerid, TYPE_GIVEWEAPONTIMER);
		}
	}
	else if(strcmp(weaponchoice, "shotgun", true, strlen(weaponchoice)) == 0)
	{
		if( PlayerInfo[playerid][pGuns][3] == 25 && PlayerInfo[playerid][pAGuns][3] == 0 )
		{
			SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "Ban da cat mot khau sung ShotGun vao Cop xe cua ban.");
			weapon = PlayerInfo[playerid][pGuns][3];
			format(string,sizeof(string), "* %s cat khau ShotGun vao cop xe cua ho.", GetPlayerNameEx(playerid));
			ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
			SetPVarInt(playerid, "GiveWeaponTimer", 10); SetTimerEx("OtherTimerEx", 1000, false, "ii", playerid, TYPE_GIVEWEAPONTIMER);
		}
	}
	else if(strcmp(weaponchoice, "spas12", true, strlen(weaponchoice)) == 0)
	{
		if( PlayerInfo[playerid][pGuns][3] == 27 && PlayerInfo[playerid][pAGuns][3] == 0 )
		{
			SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "Ban da cat mot khau sung ComBat ShotGun vao Cop xe cua ban.");
			weapon = PlayerInfo[playerid][pGuns][3];
			format(string,sizeof(string), "* %s cat khau Combat Shotgun vao cop xe cua ho.", GetPlayerNameEx(playerid));
			ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
			SetPVarInt(playerid, "GiveWeaponTimer", 10); SetTimerEx("OtherTimerEx", 1000, false, "ii", playerid, TYPE_GIVEWEAPONTIMER);
		}
	}
	else if(strcmp(weaponchoice, "mp5", true, strlen(weaponchoice)) == 0)
	{
		if( PlayerInfo[playerid][pGuns][4] == 29 && PlayerInfo[playerid][pAGuns][4] == 0 )
		{
			SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "Ban da cat mot khau sung MP5 vao Cop xe cua ban.");
			weapon = PlayerInfo[playerid][pGuns][4];
			format(string,sizeof(string), "* %s cat khau MP5 vao cop xe cua ho.", GetPlayerNameEx(playerid));
			ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
			SetPVarInt(playerid, "GiveWeaponTimer", 10); SetTimerEx("OtherTimerEx", 1000, false, "ii", playerid, TYPE_GIVEWEAPONTIMER);
		}
	}

	else if(strcmp(weaponchoice, "tec9", true, strlen(weaponchoice)) == 0)
	{
		if( PlayerInfo[playerid][pGuns][4] == 32 && PlayerInfo[playerid][pAGuns][4] == 0 )
		{
			SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "Ban da cat mot khau sung TEC9 vao Cop xe cua ban.");
			weapon = PlayerInfo[playerid][pGuns][4];
			format(string,sizeof(string), "* %s cat khau TEC9 vao cop xe cua ho.", GetPlayerNameEx(playerid));
			ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
			SetPVarInt(playerid, "GiveWeaponTimer", 10); SetTimerEx("OtherTimerEx", 1000, false, "ii", playerid, TYPE_GIVEWEAPONTIMER);
		}
	}

	else if(strcmp(weaponchoice, "ak47", true, strlen(weaponchoice)) == 0)
	{
		if( PlayerInfo[playerid][pGuns][5] == 30 && PlayerInfo[playerid][pAGuns][5] == 0 )
		{
			SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "Ban da cat mot khau sung AK-47 vao Cop xe cua ban.");
			weapon = PlayerInfo[playerid][pGuns][5];
			format(string,sizeof(string), "* %s cat khau AK-47 vao cop xe cua ho.", GetPlayerNameEx(playerid));
			ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
			SetPVarInt(playerid, "GiveWeaponTimer", 10); SetTimerEx("OtherTimerEx", 1000, false, "ii", playerid, TYPE_GIVEWEAPONTIMER);
		}
	}
	else if(strcmp(weaponchoice, "m4", true, strlen(weaponchoice)) == 0)
	{
		if( PlayerInfo[playerid][pGuns][5] == 31 && PlayerInfo[playerid][pAGuns][5] == 0 )
		{
			SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "Ban da cat mot khau sung M4 vao Cop xe cua ban.");
			weapon = PlayerInfo[playerid][pGuns][5];
			format(string,sizeof(string), "* %s cat khau M4 vao cop xe cua ho.", GetPlayerNameEx(playerid));
			ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
			SetPVarInt(playerid, "GiveWeaponTimer", 10); SetTimerEx("OtherTimerEx", 1000, false, "ii", playerid, TYPE_GIVEWEAPONTIMER);
		}
	}
	else if(strcmp(weaponchoice, "rifle", true, strlen(weaponchoice)) == 0)
	{
		if( PlayerInfo[playerid][pGuns][6] == 33 && PlayerInfo[playerid][pAGuns][6] == 0 )
		{
			SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "Ban da cat mot khau sung Rifle vao Cop xe cua ban.");
			weapon = PlayerInfo[playerid][pGuns][6];
			format(string,sizeof(string), "* %s cat khau Rifle vao cop xe cua ho.", GetPlayerNameEx(playerid));
			ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
			SetPVarInt(playerid, "GiveWeaponTimer", 10); SetTimerEx("OtherTimerEx", 1000, false, "ii", playerid, TYPE_GIVEWEAPONTIMER);
		}
	}
	else if(strcmp(weaponchoice, "sniper", true, strlen(weaponchoice)) == 0)
	{
		if( PlayerInfo[playerid][pGuns][6] == 34 && PlayerInfo[playerid][pAGuns][6] == 0 )
		{
			SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "Ban da cat mot khau sung Sniper Rifle vao Cop xe cua ban.");
			weapon = PlayerInfo[playerid][pGuns][6];
			format(string,sizeof(string), "* %s cat khau Sniper Rifle vao cop xe cua ho.", GetPlayerNameEx(playerid));
			ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
			SetPVarInt(playerid, "GiveWeaponTimer", 10); SetTimerEx("OtherTimerEx", 1000, false, "ii", playerid, TYPE_GIVEWEAPONTIMER);
		}
	}
	else if(strcmp(weaponchoice, "golfclub", true, strlen(weaponchoice)) == 0)
	{
		if( PlayerInfo[playerid][pGuns][1] == 2 && PlayerInfo[playerid][pAGuns][1] == 0 )
		{
			SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "Ban da cat mot Golf Club vao Cop xe cua ban.");
			weapon = PlayerInfo[playerid][pGuns][1];
			format(string,sizeof(string), "* %s cat Golf Club vao cop xe cua ho.", GetPlayerNameEx(playerid));
			ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
			SetPVarInt(playerid, "GiveWeaponTimer", 10); SetTimerEx("OtherTimerEx", 1000, false, "ii", playerid, TYPE_GIVEWEAPONTIMER);
		}
	}
	else if(strcmp(weaponchoice, "baseballbat", true, strlen(weaponchoice)) == 0)
	{
		if( PlayerInfo[playerid][pGuns][1] == 5 && PlayerInfo[playerid][pAGuns][1] == 0 )
		{
			SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "Ban da cat mot BaseBall Bat vao Cop xe cua ban.");
			weapon = PlayerInfo[playerid][pGuns][1];
			format(string,sizeof(string), "* %s cat BaseBall vao cop xe cua ho.", GetPlayerNameEx(playerid));
			ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
			SetPVarInt(playerid, "GiveWeaponTimer", 10); SetTimerEx("OtherTimerEx", 1000, false, "ii", playerid, TYPE_GIVEWEAPONTIMER);
		}
	}
	else if(strcmp(weaponchoice, "shovel", true, strlen(weaponchoice)) == 0)
	{
		if( PlayerInfo[playerid][pGuns][1] == 6 && PlayerInfo[playerid][pAGuns][1] == 0 )
		{
			SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "Ban da cat mot Shovel vao Cop xe cua ban.");
			weapon = PlayerInfo[playerid][pGuns][1];
			format(string,sizeof(string), "* %s cat Shovel vao cop xe cua ho.", GetPlayerNameEx(playerid));
			ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
			SetPVarInt(playerid, "GiveWeaponTimer", 10); SetTimerEx("OtherTimerEx", 1000, false, "ii", playerid, TYPE_GIVEWEAPONTIMER);
		}
	}
	else if(strcmp(weaponchoice, "poolcue", true, strlen(weaponchoice)) == 0)
	{
		if( PlayerInfo[playerid][pGuns][1] == 7 && PlayerInfo[playerid][pAGuns][1] == 0 )
		{
			SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "Ban da cat mot Pool Cue vao Cop xe cua ban.");
			weapon = PlayerInfo[playerid][pGuns][1];
			format(string,sizeof(string), "* %s cat Pool Cue vao cop xe cua ho.", GetPlayerNameEx(playerid));
			ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
			SetPVarInt(playerid, "GiveWeaponTimer", 10); SetTimerEx("OtherTimerEx", 1000, false, "ii", playerid, TYPE_GIVEWEAPONTIMER);
		}
	}
	else if(strcmp(weaponchoice, "katana", true, strlen(weaponchoice)) == 0)
	{
		if( PlayerInfo[playerid][pGuns][1] == 8 && PlayerInfo[playerid][pAGuns][1] == 0 )
		{
			SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "Ban da cat mot Katana vao Cop xe cua ban.");
			weapon = PlayerInfo[playerid][pGuns][1];
			format(string,sizeof(string), "* %s cat Katana vao cop xe cua ho.", GetPlayerNameEx(playerid));
			ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
			SetPVarInt(playerid, "GiveWeaponTimer", 10); SetTimerEx("OtherTimerEx", 1000, false, "ii", playerid, TYPE_GIVEWEAPONTIMER);
		}
	}
	else if(strcmp(weaponchoice, "cane", true, strlen(weaponchoice)) == 0)
	{
		if( PlayerInfo[playerid][pGuns][10] == 15 && PlayerInfo[playerid][pAGuns][1] == 0 )
		{
			SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "Ban da cat mot Cane vao Cop xe cua ban.");
			weapon = PlayerInfo[playerid][pGuns][10];
			format(string,sizeof(string), "* %s cat Cane vao cop xe cua ho.", GetPlayerNameEx(playerid));
			ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
			SetPVarInt(playerid, "GiveWeaponTimer", 10); SetTimerEx("OtherTimerEx", 1000, false, "ii", playerid, TYPE_GIVEWEAPONTIMER);
		}
	}
	else if(strcmp(weaponchoice, "flowers", true, strlen(weaponchoice)) == 0)
	{
		if( PlayerInfo[playerid][pGuns][10] == 14 && PlayerInfo[playerid][pAGuns][1] == 0 )
		{
			SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "Ban da cat mot Flowers vao Cop xe cua ban.");
			weapon = PlayerInfo[playerid][pGuns][10];
			format(string,sizeof(string), "* %s cat Flowers vao cop xe cua ho.", GetPlayerNameEx(playerid));
			ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
			SetPVarInt(playerid, "GiveWeaponTimer", 10); SetTimerEx("OtherTimerEx", 1000, false, "ii", playerid, TYPE_GIVEWEAPONTIMER);
		}
	}
	else if(strcmp(weaponchoice, "parachute", true, strlen(weaponchoice)) == 0)
	{
		if( PlayerInfo[playerid][pGuns][11] == 46 && PlayerInfo[playerid][pAGuns][1] == 0 )
		{
			SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "Ban da cat mot Parachute vao Cop xe cua ban.");
			weapon = PlayerInfo[playerid][pGuns][11];
			format(string,sizeof(string), "* %s cat Parachute vao cop xe cua ho.", GetPlayerNameEx(playerid));
			ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
			SetPVarInt(playerid, "GiveWeaponTimer", 10); SetTimerEx("OtherTimerEx", 1000, false, "ii", playerid, TYPE_GIVEWEAPONTIMER);
		}
	}
	else if(strcmp(weaponchoice, "dildo", true, strlen(weaponchoice)) == 0)
	{
		if( PlayerInfo[playerid][pGuns][10] == 10 && PlayerInfo[playerid][pAGuns][1] == 0 )
		{
			SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "Ban da cat mot Dildo vao Cop xe cua ban.");
			weapon = PlayerInfo[playerid][pGuns][10];
			format(string,sizeof(string), "* %s cat Dildo vao cop xe cua ho.", GetPlayerNameEx(playerid));
			ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
			SetPVarInt(playerid, "GiveWeaponTimer", 10); SetTimerEx("OtherTimerEx", 1000, false, "ii", playerid, TYPE_GIVEWEAPONTIMER);
		}
	}	
	else { SendClientMessageEx(playerid,COLOR_GREY,"   Ten Vu Khi Khong Hop Le!"); return 1; }
	if(PlayerVehicleInfo[playerid][pvid][pvWeapons][slot-1] == 0)
	{
		PlayerVehicleInfo[playerid][pvid][pvWeapons][slot-1] = weapon;
		RemovePlayerWeapon(playerid, weapon);
		g_mysql_SaveVehicle(playerid, pvid);
	}
	return 1;
}
CMD:laysung(playerid, params[]) {
	return cmd_trunktake(playerid, params);
}
CMD:trunktake(playerid, params[]) {
	if(IsPlayerInAnyVehicle(playerid)) return SendClientMessageEx(playerid, COLOR_WHITE, "Ban khong the lam dieu nay khi o trong xe.");
	if(PlayerInfo[playerid][pAccountRestricted] != 0) return SendClientMessageEx(playerid, COLOR_GRAD1, "Tai khoan cua ban bi han che!");
	else if(GetPVarType(playerid, "IsInArena")) return SendClientMessageEx(playerid, COLOR_WHITE, "Ban khong the lam dieu nay ngay bay gio, ban dang o trong dau truong!");
	else if(GetPVarInt( playerid, "EventToken") != 0) return SendClientMessageEx(playerid, COLOR_GREY, "Ban khong the su dung khi dang o trong su kien.");
	else if(PlayerInfo[playerid][pConnectHours] < 2 || PlayerInfo[playerid][pWRestricted] > 0) return SendClientMessageEx(playerid, COLOR_GRAD2, "Ban khong the su dung khi dang bi han che vu khi!");
	else if(GetPVarInt(playerid, "GiveWeaponTimer") >= 1)
	{
		new szMessage[59];
		format(szMessage, sizeof(szMessage), "   Ban phai doi %d giay truoc khi nhan vu khi khac.", GetPVarInt(playerid, "GiveWeaponTimer"));
		return SendClientMessageEx(playerid, COLOR_GREY, szMessage);
	}

	new
		Float: fVehPos[3],
		iWeaponSlot = strval(params);

	for(new d = 0 ; d < MAX_PLAYERVEHICLES; d++) {
		if(PlayerVehicleInfo[playerid][d][pvId] != INVALID_PLAYER_VEHICLE_ID) {
			GetVehiclePos(PlayerVehicleInfo[playerid][d][pvId], fVehPos[0], fVehPos[1], fVehPos[2]);
			if(IsPlayerInRangeOfPoint(playerid, 4.0, fVehPos[0], fVehPos[1], fVehPos[2])) {
				if(isnull(params)) {

					new
						szMessage[64];

					format(szMessage, sizeof(szMessage), "*** %s's %s Safe ***", GetPlayerNameEx(playerid), GetVehicleName(PlayerVehicleInfo[playerid][d][pvId]));
					SendClientMessageEx(playerid, COLOR_WHITE, szMessage);
					for(new s = 0; s < 3; s++) if(PlayerVehicleInfo[playerid][d][pvWeapons][s] != 0) {

						new
							szWeapon[16];

						GetWeaponName(PlayerVehicleInfo[playerid][d][pvWeapons][s], szWeapon, sizeof(szWeapon));
						format(szMessage, sizeof(szMessage), "Slot %d: %s", s+1, szWeapon);
						SendClientMessageEx(playerid, COLOR_WHITE, szMessage);
					}
					return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /laysung [slot]");
				}
				else if(GetVehicleModel(PlayerVehicleInfo[playerid][d][pvId]) == 481 || GetVehicleModel(PlayerVehicleInfo[playerid][d][pvId]) == 509) {
					return SendClientMessageEx(playerid,COLOR_GREY,"Xe do khong co Cop.");
				}

				new
					engine, lights, alarm, doors, bonnet, boot, objective;

				GetVehicleParamsEx(PlayerVehicleInfo[playerid][d][pvId], engine, lights, alarm, doors, bonnet, boot, objective);

				if(boot == VEHICLE_PARAMS_OFF || boot == VEHICLE_PARAMS_UNSET) {
					return SendClientMessageEx(playerid, COLOR_GRAD3, "Ban khong the lay vu khi tu cop xe neu no bi dong (/car trunk) de mo no.");
				}

				new maxslots = PlayerVehicleInfo[playerid][d][pvWepUpgrade]+1;
				if(iWeaponSlot > maxslots || iWeaponSlot < 1) {
					return SendClientMessageEx(playerid, COLOR_GREY, "Vi tri khong hop le.");
				}

				else if(PlayerVehicleInfo[playerid][d][pvWeapons][iWeaponSlot - 1] != 0) {
					new
						szWeapon[16],
						szMessage[128];


					new aWeapons[13][2];

					for(new i; i < 13; ++i) {
						GetPlayerWeaponData(playerid, i, aWeapons[i][0], aWeapons[i][1]);
						if(aWeapons[i][0] == PlayerVehicleInfo[playerid][d][pvWeapons][iWeaponSlot - 1]) return SendClientMessageEx(playerid, COLOR_GRAD1, "You are already carrying this weapon.");
					}

					GetWeaponName(PlayerVehicleInfo[playerid][d][pvWeapons][iWeaponSlot - 1], szWeapon, sizeof(szWeapon));
					GivePlayerValidWeapon(playerid, PlayerVehicleInfo[playerid][d][pvWeapons][iWeaponSlot - 1]);
					PlayerVehicleInfo[playerid][d][pvWeapons][iWeaponSlot - 1] = 0;
					g_mysql_SaveVehicle(playerid, d);

					format(szMessage, sizeof(szMessage), "Ban da rut mot %s tu Cop Xe.", szWeapon);
					SendClientMessageEx(playerid, COLOR_WHITE, szMessage);

					format(szMessage, sizeof(szMessage), "* %s da rut mot %s tu cop xe.", GetPlayerNameEx(playerid), szWeapon);
					return ProxDetector(30.0, playerid, szMessage, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
				}
				else return SendClientMessageEx(playerid, COLOR_WHITE, "Ban khong co vu khi duoc luu tru o vi tri do.");
			}
		}
	}
	return SendClientMessageEx(playerid,COLOR_GREY,"Ban khong o gan bat ky phuong tien nao ma ban so huu");
}

CMD:storegun(playerid, params[])
{
	if(Homes[playerid] > 0)
	{
		if(GetPVarType(playerid, "IsInArena")) return SendClientMessageEx(playerid, COLOR_WHITE, "Ban khong the lam dieu nay ngay bay gio, ban dang o trong mot dau truong!");
		if(GetPVarInt( playerid, "EventToken") != 0) return SendClientMessageEx(playerid, COLOR_GREY, "Ban khong the su dung khi dang tham gia su kien.");
		if(GetPVarType(playerid, "PlayerCuffed") || GetPVarInt(playerid, "pBagged") >= 1 || GetPVarType(playerid, "Injured") || GetPVarType(playerid, "IsFrozen")) return SendClientMessage(playerid, COLOR_GRAD2, "Ban khong the lam dieu do vao luc nay!");
		new string[128], weaponchoice[32], slot;
		if(sscanf(params, "s[32]d", weaponchoice, slot)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /storegun [weapon] [slot]");

		for(new i; i < MAX_HOUSES; i++)
		{
			if(GetPlayerSQLId(playerid) == HouseInfo[i][hOwnerID] && IsPlayerInRangeOfPoint(playerid, 50, HouseInfo[i][hInteriorX], HouseInfo[i][hInteriorY], HouseInfo[i][hInteriorZ]) && GetPlayerVirtualWorld(playerid) == HouseInfo[i][hIntVW] && GetPlayerInterior(playerid) == HouseInfo[i][hIntIW])
			{
				if (GetPVarInt(playerid, "GiveWeaponTimer") > 0)
				{
					format(string, sizeof(string), "   Ban phai duoi %d giay truoc khi gui vu khi khac.", GetPVarInt(playerid, "GiveWeaponTimer"));
					SendClientMessageEx(playerid,COLOR_GREY,string);
					return 1;
				}

				new maxslots = HouseInfo[i][hGLUpgrade];
				if(slot > maxslots || slot == 0)
				{
					SendClientMessageEx(playerid, COLOR_GREY, "Do khong phai la vi tri hop le. Vi tri tu 1-5.");
					return 1;
				}

				if( HouseInfo[i][hWeapons][slot-1] != 0)
				{
					SendClientMessageEx(playerid, COLOR_GREY, "Ban da co vu khi luu tru o vi tri do roi.");
					return 1;
				}

				new weapon;
				if(strcmp(weaponchoice, "sdpistol", true, strlen(weaponchoice)) == 0)
				{
					if( PlayerInfo[playerid][pGuns][2] == 23 && PlayerInfo[playerid][pAGuns][2] == 0 )
					{
						SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "Ban da cat mot khau Silicenced Pistol vao tu dung sung cua minh.");
						weapon = PlayerInfo[playerid][pGuns][2];
						format(string,sizeof(string), "* %s cat khau Slicenced Pistol vao nha an toan.", GetPlayerNameEx(playerid));
						ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
						SetPVarInt(playerid, "GiveWeaponTimer", 10); SetTimerEx("OtherTimerEx", 1000, false, "ii", playerid, TYPE_GIVEWEAPONTIMER);
					}
				}
				else if(strcmp(weaponchoice, "deagle", true, strlen(weaponchoice)) == 0)
				{
					if( PlayerInfo[playerid][pGuns][2] == 24 && PlayerInfo[playerid][pAGuns][2] == 0 )
					{
						SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "Ban da cat mot khau Desert Eagle vao tu dung sung cua minh.");
						weapon = PlayerInfo[playerid][pGuns][2];
						format(string,sizeof(string), "* %s cat khau Desert Eagle vao nha an toan.", GetPlayerNameEx(playerid));
						ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
						SetPVarInt(playerid, "GiveWeaponTimer", 10); SetTimerEx("OtherTimerEx", 1000, false, "ii", playerid, TYPE_GIVEWEAPONTIMER);
					}
				}
				else if(strcmp(weaponchoice, "shotgun", true, strlen(weaponchoice)) == 0)
				{
					if( PlayerInfo[playerid][pGuns][3] == 25 && PlayerInfo[playerid][pAGuns][3] == 0 )
					{
						SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "Ban da cat mot khau Shotgun vao tu dung sung cua minh.");
						weapon = PlayerInfo[playerid][pGuns][3];
						format(string,sizeof(string), "* %s cat khau Shotgun vao nha an toan.", GetPlayerNameEx(playerid));
						ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
						SetPVarInt(playerid, "GiveWeaponTimer", 10); SetTimerEx("OtherTimerEx", 1000, false, "ii", playerid, TYPE_GIVEWEAPONTIMER);
					}
				}
				else if(strcmp(weaponchoice, "spas12", true, strlen(weaponchoice)) == 0)
				{
					if( PlayerInfo[playerid][pGuns][3] == 27 && PlayerInfo[playerid][pAGuns][3] == 0 )
					{
						SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "Ban da cat mot khau ComBat Shotgun vao tu dung sung cua minh.");
						weapon = PlayerInfo[playerid][pGuns][3];
						format(string,sizeof(string), "* %s cat khau Combat Shotgun vao nha an toan.", GetPlayerNameEx(playerid));
						ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
						SetPVarInt(playerid, "GiveWeaponTimer", 10); SetTimerEx("OtherTimerEx", 1000, false, "ii", playerid, TYPE_GIVEWEAPONTIMER);
					}
				}
				else if(strcmp(weaponchoice, "mp5", true, strlen(weaponchoice)) == 0)
				{
					if( PlayerInfo[playerid][pGuns][4] == 29 && PlayerInfo[playerid][pAGuns][4] == 0 )
					{
						SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "Ban da cat mot khau MP5 vao tu dung sung cua minh.");
						weapon = PlayerInfo[playerid][pGuns][4];
						format(string,sizeof(string), "* %s cat khau MP5 vao nha an toan.", GetPlayerNameEx(playerid));
						ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
						SetPVarInt(playerid, "GiveWeaponTimer", 10); SetTimerEx("OtherTimerEx", 1000, false, "ii", playerid, TYPE_GIVEWEAPONTIMER);
					}
				}
				else if(strcmp(weaponchoice, "ak47", true, strlen(weaponchoice)) == 0)
				{
					if( PlayerInfo[playerid][pGuns][5] == 30 && PlayerInfo[playerid][pAGuns][5] == 0 )
					{
						SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "Ban da cat mot khau AK-47 vao tu dung sung cua minh.");
						weapon = PlayerInfo[playerid][pGuns][5];
						format(string,sizeof(string), "* %s cat khau AK-47 vao nha an toan.", GetPlayerNameEx(playerid));
						ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
						SetPVarInt(playerid, "GiveWeaponTimer", 10); SetTimerEx("OtherTimerEx", 1000, false, "ii", playerid, TYPE_GIVEWEAPONTIMER);
					}
				}
				else if(strcmp(weaponchoice, "m4", true, strlen(weaponchoice)) == 0)
				{
					if( PlayerInfo[playerid][pGuns][5] == 31 && PlayerInfo[playerid][pAGuns][5] == 0 )
					{
						SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "Ban da cat mot khau M4 vao tu dung sung cua minh.");
						weapon = PlayerInfo[playerid][pGuns][5];
						format(string,sizeof(string), "* %s cat khau M4 vao nha an toan.", GetPlayerNameEx(playerid));
						ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
						SetPVarInt(playerid, "GiveWeaponTimer", 10); SetTimerEx("OtherTimerEx", 1000, false, "ii", playerid, TYPE_GIVEWEAPONTIMER);
					}
				}
				else if(strcmp(weaponchoice, "rifle", true, strlen(weaponchoice)) == 0)
				{
					if( PlayerInfo[playerid][pGuns][6] == 33 && PlayerInfo[playerid][pAGuns][6] == 0 )
					{
						SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "Ban da cat mot khau Rifle vao tu dung sung cua minh.");
						weapon = PlayerInfo[playerid][pGuns][6];
						format(string,sizeof(string), "* %s cat khau Rifle vao nha an toan.", GetPlayerNameEx(playerid));
						ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
						SetPVarInt(playerid, "GiveWeaponTimer", 10); SetTimerEx("OtherTimerEx", 1000, false, "ii", playerid, TYPE_GIVEWEAPONTIMER);
					}
				}
				else if(strcmp(weaponchoice, "sniper", true, strlen(weaponchoice)) == 0)
				{
					if( PlayerInfo[playerid][pGuns][6] == 34 && PlayerInfo[playerid][pAGuns][6] == 0 )
					{
						SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "Ban da cat mot khau Sniper Rifle vao tu dung sung cua minh.");
						weapon = PlayerInfo[playerid][pGuns][6];
						format(string,sizeof(string), "* %s cat khau Sniper Rifle vao nha an toan.", GetPlayerNameEx(playerid));
						ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
						SetPVarInt(playerid, "GiveWeaponTimer", 10); SetTimerEx("OtherTimerEx", 1000, false, "ii", playerid, TYPE_GIVEWEAPONTIMER);
					}
				}
				else if(strcmp(weaponchoice, "uzi", true, strlen(weaponchoice)) == 0)
				{
					if( PlayerInfo[playerid][pGuns][4] == 28 && PlayerInfo[playerid][pAGuns][4] == 0 )
					{
						SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "Ban da cat mot khau Uzi vao tu dung sung cua minh.");
						weapon = PlayerInfo[playerid][pGuns][4];
						format(string,sizeof(string), "* %s cat khau Uzi vao nha an toan.", GetPlayerNameEx(playerid));
						ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
						SetPVarInt(playerid, "GiveWeaponTimer", 10); SetTimerEx("OtherTimerEx", 1000, false, "ii", playerid, TYPE_GIVEWEAPONTIMER);
					}
				}
				else if(strcmp(weaponchoice, "tec9", true, strlen(weaponchoice)) == 0)
				{
					if( PlayerInfo[playerid][pGuns][4] == 32 && PlayerInfo[playerid][pAGuns][4] == 0 )
					{
						SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "Ban da cat mot khau Tec9 vao tu dung sung cua minh.");
						weapon = PlayerInfo[playerid][pGuns][4];
						format(string,sizeof(string), "* %s cat khau Tec9 vao nha an toan.", GetPlayerNameEx(playerid));
						ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
						SetPVarInt(playerid, "GiveWeaponTimer", 10); SetTimerEx("OtherTimerEx", 1000, false, "ii", playerid, TYPE_GIVEWEAPONTIMER);
					}
				}
				if(weapon == 0) return SendClientMessageEx(playerid, COLOR_GREY, "Ban khong co vu khi.");
				if(HouseInfo[i][hWeapons][slot-1] == 0)
				{
					HouseInfo[i][hWeapons][slot-1] = weapon;
					RemovePlayerWeapon(playerid, weapon);
					SaveHouse(i);
					return 1;
				}
				else { SendClientMessageEx(playerid,COLOR_GREY,"   Ten vu khi khong hop le!"); return 1; }
			}
		}
		SendClientMessageEx(playerid, COLOR_GREY, "Ban khong o trong ngoi nha ma ban so huu.");
	}
	else return SendClientMessageEx(playerid, COLOR_GREY, "Ban khong so huu mot ngoi nha nao.");
	return 1;
}

CMD:getgun(playerid, params[])
{
	if(Homes[playerid] > 0)
	{
		new string[128], slot;

		for(new i; i < MAX_HOUSES; i++)
		{
			if(GetPlayerSQLId(playerid) == HouseInfo[i][hOwnerID] && IsPlayerInRangeOfPoint(playerid, 50, HouseInfo[i][hInteriorX], HouseInfo[i][hInteriorY], HouseInfo[i][hInteriorZ]) && GetPlayerVirtualWorld(playerid) == HouseInfo[i][hIntVW] && GetPlayerInterior(playerid) == HouseInfo[i][hIntIW])
			{
				if(PlayerInfo[playerid][pConnectHours] < 2 || PlayerInfo[playerid][pWRestricted] > 0) return SendClientMessageEx(playerid, COLOR_GRAD2, "Ban khong the su dung khi dang bi han che vu khi!");

				if(sscanf(params, "d", slot))
				{
					new weaponname[50];
					SendClientMessageEx(playerid, COLOR_GREEN, "________________________________________________");
					format(string, sizeof(string), "*** %s's Safe ***", GetPlayerNameEx(playerid));
					SendClientMessageEx(playerid, COLOR_WHITE, string);
					for(new s = 0; s < 5; s++)
					{
						if( HouseInfo[i][hWeapons][s] != 0 )
						{
							GetWeaponName(HouseInfo[i][hWeapons][s], weaponname, sizeof(weaponname));
							format(string, sizeof(string), "Slot %d: %s", s+1, weaponname);
							SendClientMessageEx(playerid, COLOR_WHITE, string);
						}
					}
					SendClientMessageEx(playerid, COLOR_GREEN, "________________________________________________");
					SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /getgun [slot]");
					return 1;
				}

				if (GetPVarInt(playerid, "GiveWeaponTimer") > 0)
				{
					format(string, sizeof(string), "   Ban phai doi %d truoc khi lay vu khi khac.", GetPVarInt(playerid, "GiveWeaponTimer"));
					SendClientMessageEx(playerid,COLOR_GREY,string);
					return 1;
				}
				new maxslots = HouseInfo[i][hGLUpgrade];
				if(slot > maxslots)
				{
					SendClientMessageEx(playerid, COLOR_GREY, "Vi tri khong hop le.");
					return 1;
				}

				if(HouseInfo[i][hWeapons][slot-1] != 0)
				{
					new weaponname[50];
					GetWeaponName(HouseInfo[i][hWeapons][slot-1], weaponname, sizeof(weaponname));
					GivePlayerValidWeapon(playerid, HouseInfo[i][hWeapons][slot-1]);
					HouseInfo[i][hWeapons][slot-1] = 0;
					if(strcmp(weaponname, "silenced pistol", true, strlen(weaponname)) == 0)
					{
						SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "Ban da lay Silenced Pistol tu kho dung sung.");
						format(string,sizeof(string), "* %s da lay mot Silenced Pistol tu ngoi nha.", GetPlayerNameEx(playerid));
						ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
						SetPVarInt(playerid, "GiveWeaponTimer", 10); SetTimerEx("OtherTimerEx", 1000, false, "ii", playerid, TYPE_GIVEWEAPONTIMER);
					}
					if(strcmp(weaponname, "desert eagle", true, strlen(weaponname)) == 0)
					{
						SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "Ban da lay Desert Eagle tu kho dung sung.");
						format(string,sizeof(string), "* %s da lay mot Desert Eagle tu ngoi nha.", GetPlayerNameEx(playerid));
						ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
						SetPVarInt(playerid, "GiveWeaponTimer", 10); SetTimerEx("OtherTimerEx", 1000, false, "ii", playerid, TYPE_GIVEWEAPONTIMER);
					}
					if(strcmp(weaponname, "shotgun", true, strlen(weaponname)) == 0)
					{
						SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "Ban da lay Shotgun tu kho dung sung.");
						format(string,sizeof(string), "* %s da lay mot Shotgun tu ngoi nha.", GetPlayerNameEx(playerid));
						ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
						SetPVarInt(playerid, "GiveWeaponTimer", 10); SetTimerEx("OtherTimerEx", 1000, false, "ii", playerid, TYPE_GIVEWEAPONTIMER);
					}
					if(strcmp(weaponname, "combat shotgun", true, strlen(weaponname)) == 0)
					{
						SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "Ban da lay Combat Shotgun tu kho dung sung.");
						format(string,sizeof(string), "* %s da lay mot Combat Shotgun tu ngoi nha.", GetPlayerNameEx(playerid));
						ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
						SetPVarInt(playerid, "GiveWeaponTimer", 10); SetTimerEx("OtherTimerEx", 1000, false, "ii", playerid, TYPE_GIVEWEAPONTIMER);
					}
					if(strcmp(weaponname, "mp5", true, strlen(weaponname)) == 0)
					{
						SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "Ban da lay MP5 tu kho dung sung.");
						format(string,sizeof(string), "* %s da lay mot MP5 tu ngoi nha.", GetPlayerNameEx(playerid));
						ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
						SetPVarInt(playerid, "GiveWeaponTimer", 10); SetTimerEx("OtherTimerEx", 1000, false, "ii", playerid, TYPE_GIVEWEAPONTIMER);
					}
					if(strcmp(weaponname, "ak47", true, strlen(weaponname)) == 0)
					{
						SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "Ban da lay AK-47 tu kho dung sung.");
						format(string,sizeof(string), "* %s da lay mot AK-47 tu ngoi nha.", GetPlayerNameEx(playerid));
						ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
						SetPVarInt(playerid, "GiveWeaponTimer", 10); SetTimerEx("OtherTimerEx", 1000, false, "ii", playerid, TYPE_GIVEWEAPONTIMER);
					}
					if(strcmp(weaponname, "m4", true, strlen(weaponname)) == 0)
					{
						SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "Ban da lay M4 tu kho dung sung.");
						format(string,sizeof(string), "* %s da lay mot M4 tu ngoi nha.", GetPlayerNameEx(playerid));
						ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
						SetPVarInt(playerid, "GiveWeaponTimer", 10); SetTimerEx("OtherTimerEx", 1000, false, "ii", playerid, TYPE_GIVEWEAPONTIMER);
					}
					if(strcmp(weaponname, "rifle", true, strlen(weaponname)) == 0)
					{
						SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "Ban da lay Rifle tu kho dung sung.");
						format(string,sizeof(string), "* %s da lay mot Rifle tu ngoi nha.", GetPlayerNameEx(playerid));
						ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
						SetPVarInt(playerid, "GiveWeaponTimer", 10); SetTimerEx("OtherTimerEx", 1000, false, "ii", playerid, TYPE_GIVEWEAPONTIMER);
					}
					if(strcmp(weaponname, "sniper rifle", true, strlen(weaponname)) == 0)
					{
						SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "Ban da lay Sniper Rifle tu kho dung sung.");
						SetPVarInt(playerid, "GiveWeaponTimer", 10); SetTimerEx("OtherTimerEx", 1000, false, "ii", playerid, TYPE_GIVEWEAPONTIMER);
						format(string,sizeof(string), "* %s da lay mot Sniper Rifle tu ngoi nha.", GetPlayerNameEx(playerid));
						ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
					}
					if(strcmp(weaponname, "micro smg", true, strlen(weaponname)) == 0)
					{
						SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "Ban da lay Uzi tu kho dung sung.");
						SetPVarInt(playerid, "GiveWeaponTimer", 10); SetTimerEx("OtherTimerEx", 1000, false, "ii", playerid, TYPE_GIVEWEAPONTIMER);
						format(string,sizeof(string), "* %s da lay mot Uzi tu ngoi nha.", GetPlayerNameEx(playerid));
						ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
					}
					if(strcmp(weaponname, "tec9", true, strlen(weaponname)) == 0)
					{
						SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "Ban da lay Tec9 tu kho dung sung.");
						SetPVarInt(playerid, "GiveWeaponTimer", 10); SetTimerEx("OtherTimerEx", 1000, false, "ii", playerid, TYPE_GIVEWEAPONTIMER);
						format(string,sizeof(string), "* %s da lay mot Tec9 tu ngoi nha.", GetPlayerNameEx(playerid));
						ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
					}
					SaveHouse(i);
					return 1;
				}
				else
				{
					SendClientMessageEx(playerid, COLOR_WHITE, "You don't have a weapon stored in that slot.");
					return 1;
				}
			}
		}
		SendClientMessageEx(playerid, COLOR_GREY, "Ban khong o trong mot ngoi nha ma ban so huu.");
	}
	else return SendClientMessageEx(playerid, COLOR_GREY, "Ban khong so huu mot ngoi nha.");
	return 1;
}


CMD:hwithdraw(playerid, params[])
{
	if(Homes[playerid] > 0)
	{
		for(new i; i < MAX_HOUSES; i++)
		{
			if(GetPlayerSQLId(playerid) == HouseInfo[i][hOwnerID] && IsPlayerInRangeOfPoint(playerid, 50, HouseInfo[i][hInteriorX], HouseInfo[i][hInteriorY], HouseInfo[i][hInteriorZ]) && GetPlayerVirtualWorld(playerid) == HouseInfo[i][hIntVW] && GetPlayerInterior(playerid) == HouseInfo[i][hIntIW])
			{
				new itemid, amount, string[128];

				if(sscanf(params, "dd", itemid, amount))
				{
					SendClientMessageEx(playerid, COLOR_WHITE, "SU DUNG: /hwithdraw [itemid] [amount]");
					SendClientMessageEx(playerid, COLOR_GREY, "ItemIDs: (1) Cash - (2) Pot - (3) Crack - (4) Materials - (5) Meth - (6) Ecstasy - (7) Heroin");
					return 1;
				}
				if(itemid < 1 || itemid > 7) {
					SendClientMessageEx(playerid, COLOR_WHITE, "SU DUNG: /hwithdraw [itemid] [amount]");
					SendClientMessageEx(playerid, COLOR_GREY, "ItemIDs: (1) Cash - (2) Pot - (3) Crack - (4) Materials - (5) Meth - (6) Ecstasy - (7) Heroin");
					return 1;
				}

				if(amount < 1) return SendClientMessageEx(playerid, COLOR_WHITE, "You can't withdraw less than 1.");

				switch(itemid)
				{
					case 1: // Cash
					{
						if(HouseInfo[i][hSafeMoney] >= amount)
						{
							HouseInfo[i][hSafeMoney] -= amount;
							GivePlayerCash(playerid, amount);
							OnPlayerStatsUpdate(playerid);
							SaveHouse(i);
							format(string, sizeof(string), "Ban da lay $%d tu ngoi nha cua ban.", amount);
							SendClientMessageEx(playerid, COLOR_WHITE, string);
							format(string, sizeof(string), "%s (SQL: %d) da lay $%d tu ngoi nha (ID: %d) an toan.", GetPlayerNameEx(playerid), GetPlayerSQLId(playerid), amount, i);
							Log("logs/hsafe.log", string);
							return 1;
						}
						else return SendClientMessageEx(playerid, COLOR_WHITE, "Ban khong co du tien de rut!");
					}
					case 2: // Pot
					{
						if(HouseInfo[i][hPot] >= amount)
						{
							HouseInfo[i][hPot] -= amount;
							PlayerInfo[playerid][pDrugs][0] += amount;
							OnPlayerStatsUpdate(playerid);
							SaveHouse(i);
							format(string, sizeof(string), "Ban da lay %d Pot tu ngoi nha an toan.", amount);
							SendClientMessageEx(playerid, COLOR_WHITE, string);
							format(string, sizeof(string), "%s (SQL: %d) da lay %d Pot tu ngoi nha (ID: %d) an toan.", GetPlayerNameEx(playerid), GetPlayerSQLId(playerid), amount, i);
							Log("logs/hsafe.log", string);
							return 1;
						}
						else return SendClientMessageEx(playerid, COLOR_WHITE, "Ban khong co du no de rut!");
					}
					case 3: // Crack
					{
						if(HouseInfo[i][hCrack] >= amount)
						{
							HouseInfo[i][hCrack] -= amount;
							PlayerInfo[playerid][pDrugs][1] += amount;
							OnPlayerStatsUpdate(playerid);
							SaveHouse(i);
							format(string, sizeof(string), "Ban da lay %d crack tu ngoi nha an toan.", amount);
							SendClientMessageEx(playerid, COLOR_WHITE, string);
							format(string, sizeof(string), "%s (SQL: %d) da lay %d crack tu ngoi nha (ID: %d) an toan.", GetPlayerNameEx(playerid), GetPlayerSQLId(playerid), amount, i);
							Log("logs/hsafe.log", string);
							return 1;
						}
						else return SendClientMessageEx(playerid, COLOR_WHITE, "Ban khong co du no de rut!");
					}
					case 4: // Materials
					{
						if(HouseInfo[i][hMaterials] >= amount)
						{
							HouseInfo[i][hMaterials] -= amount;
							PlayerInfo[playerid][pMats] += amount;
							OnPlayerStatsUpdate(playerid);
							SaveHouse(i);
							format(string, sizeof(string), "Ban da lay %d materials tu ngoi nha an toan.", amount);
							SendClientMessageEx(playerid, COLOR_WHITE, string);
							format(string, sizeof(string), "%s (SQL: %d) da lay %d materials tu ngoi nha (ID: %d) an toan.", GetPlayerNameEx(playerid), GetPlayerSQLId(playerid), amount, i);
							Log("logs/hsafe.log", string);
							return 1;
						}
						else return SendClientMessageEx(playerid, COLOR_WHITE, "Ban khong co du no de rut!");
					}
					case 5: // Meth
					{
						if(HouseInfo[i][hMeth] >= amount)
						{
							HouseInfo[i][hMeth] -= amount;
							PlayerInfo[playerid][pDrugs][2] += amount;
							OnPlayerStatsUpdate(playerid);
							SaveHouse(i);
							format(string, sizeof(string), "Ban da lay %d meth tu ngoi nha an toan.", amount);
							SendClientMessageEx(playerid, COLOR_WHITE, string);
							format(string, sizeof(string), "%s (SQL: %d) da lay %d meth tu ngoi nha (ID: %d) an toan.", GetPlayerNameEx(playerid), GetPlayerSQLId(playerid), amount, i);
							Log("logs/hsafe.log", string);
							return 1;
						}
						else return SendClientMessageEx(playerid, COLOR_WHITE, "Ban khong co du no de rut!");
					}
					case 6: // Ecstasy
					{
						if(HouseInfo[i][hEcstasy] >= amount)
						{
							HouseInfo[i][hEcstasy] -= amount;
							PlayerInfo[playerid][pDrugs][3] += amount;
							OnPlayerStatsUpdate(playerid);
							SaveHouse(i);
							format(string, sizeof(string), "Ban da lay %d ecstasy tu ngoi nha an toan.", amount);
							SendClientMessageEx(playerid, COLOR_WHITE, string);
							format(string, sizeof(string), "%s (SQL: %d) da lay %d ecstasy tu ngoi nha (ID: %d) an toan.", GetPlayerNameEx(playerid), GetPlayerSQLId(playerid), amount, i);
							Log("logs/hsafe.log", string);
							return 1;
						}
						else return SendClientMessageEx(playerid, COLOR_WHITE, "Ban khong co du no de rut!");
					}
					case 7: // Heroin
					{
						if(HouseInfo[i][hHeroin] >= amount)
						{
							HouseInfo[i][hHeroin] -= amount;
							PlayerInfo[playerid][pDrugs][4] += amount;
							OnPlayerStatsUpdate(playerid);
							SaveHouse(i);
							format(string, sizeof(string), "Ban da lay %d heroin tu ngoi nha an toan.", amount);
							SendClientMessageEx(playerid, COLOR_WHITE, string);
							format(string, sizeof(string), "%s (SQL: %d) da lay %d heroin tu ngoi nha (ID: %d) an toan.", GetPlayerNameEx(playerid), GetPlayerSQLId(playerid), amount, i);
							Log("logs/hsafe.log", string);
							return 1;
						}
						else return SendClientMessageEx(playerid, COLOR_WHITE, "Ban khong co du no de rut!");
					}
				}
			}
		}
		SendClientMessageEx(playerid, COLOR_GREY, "Ban khong o trong ngoi nha ma ban so huu.");
	}
	else return SendClientMessageEx(playerid, COLOR_GREY, "Ban khong so huu mot ngoi nha.");
	return 1;
}

CMD:hdeposit(playerid, params[])
{
	if(Homes[playerid] > 0)
	{
		for(new i; i < MAX_HOUSES; i++)
		{
			if(GetPlayerSQLId(playerid) == HouseInfo[i][hOwnerID] && IsPlayerInRangeOfPoint(playerid, 50, HouseInfo[i][hInteriorX], HouseInfo[i][hInteriorY], HouseInfo[i][hInteriorZ]) && GetPlayerVirtualWorld(playerid) == HouseInfo[i][hIntVW] && GetPlayerInterior(playerid) == HouseInfo[i][hIntIW])
			{
				new string[128], itemid, amount;

				if(sscanf(params, "dd", itemid, amount))
				{
					SendClientMessageEx(playerid, COLOR_WHITE, "SU DUNG: /hdeposit [itemid] [amount]");
					SendClientMessageEx(playerid, COLOR_GREY, "ItemIDs: (1) Cash - (2) Pot - (3) Crack - (4) Materials - (5) Meth - (6) Ecstasy - (7) Heroin");
					return 1;
				}
				if(itemid < 1 || itemid > 7) {
					SendClientMessageEx(playerid, COLOR_WHITE, "SU DUNG: /hdeposit [itemid] [amount]");
					SendClientMessageEx(playerid, COLOR_GREY, "ItemIDs: (1) Cash - (2) Pot - (3) Crack - (4) Materials - (5) Meth - (6) Ecstasy - (7) Heroin");
					return 1;
				}

				if(amount < 1) return SendClientMessageEx(playerid, COLOR_WHITE, "Ban khong the cat it hon 1.");
				switch(itemid)
				{
					case 1: // Cash
					{
						if(PlayerInfo[playerid][pCash] >= amount) PlayerInfo[playerid][pCash] -= amount;
						else return SendClientMessageEx(playerid, COLOR_WHITE, "Ban khong co du tien cat!");

						HouseInfo[i][hSafeMoney] += amount;
						format(string, sizeof(string), "Ban da cat $%d vao ngoi nha cua ban.", amount);
						SendClientMessageEx(playerid, COLOR_WHITE, string);
						OnPlayerStatsUpdate(playerid);
						SaveHouse(i);
						format(string, sizeof(string), "%s (SQL: %d) da cat $%d vao ngoi nha (ID: %d) an toan.", GetPlayerNameEx(playerid), GetPlayerSQLId(playerid), amount, i);
						Log("logs/hsafe.log", string);
						return 1;
					}
					case 2: // Pot
					{
						if(PlayerInfo[playerid][pDrugs][0] >= amount) PlayerInfo[playerid][pDrugs][0] -= amount;
						else return SendClientMessageEx(playerid, COLOR_WHITE, "Ban khong co du no de cat!");

						HouseInfo[i][hPot] += amount;
						format(string, sizeof(string), "Ban da cat %d Pot vao ngoi nha cua ban.", amount);
						SendClientMessageEx(playerid, COLOR_WHITE, string);
						OnPlayerStatsUpdate(playerid);
						SaveHouse(i);
						format(string, sizeof(string), "%s (SQL: %d) da cat %d Pot vao ngoi nha (ID: %d) an toan.", GetPlayerNameEx(playerid), GetPlayerSQLId(playerid), amount, i);
						Log("logs/hsafe.log", string);
						return 1;
					}
					case 3: // Crack
					{
						if(PlayerInfo[playerid][pDrugs][1] >= amount) PlayerInfo[playerid][pDrugs][1] -= amount;
						else return SendClientMessageEx(playerid, COLOR_WHITE, "Ban khong co du no de cat!");

						HouseInfo[i][hCrack] += amount;
						format(string, sizeof(string), "Ban da cat %d Crack vao ngoi nha cua ban.", amount);
						SendClientMessageEx(playerid, COLOR_WHITE, string);
						OnPlayerStatsUpdate(playerid);
						SaveHouse(i);
						format(string, sizeof(string), "%s (SQL: %d) da cat %d crack vao ngoi nha (ID: %d) an toan.", GetPlayerNameEx(playerid), GetPlayerSQLId(playerid), amount, i);
						Log("logs/hsafe.log", string);
						return 1;
					}
					case 4: // Materials
					{
						if(PlayerInfo[playerid][pMats] >= amount) PlayerInfo[playerid][pMats] -= amount;
						else return SendClientMessageEx(playerid, COLOR_WHITE, "Ban khong co du no de cat!");

						HouseInfo[i][hMaterials] += amount;
						format(string, sizeof(string), "Ban da cat %d Materials vao ngoi nha cua ban.", amount);
						SendClientMessageEx(playerid, COLOR_WHITE, string);
						OnPlayerStatsUpdate(playerid);
						SaveHouse(i);
						format(string, sizeof(string), "%s (SQL: %d) da cat %d materials vao ngoi nha (ID: %d) an toan.", GetPlayerNameEx(playerid), GetPlayerSQLId(playerid), amount, i);
						Log("logs/hsafe.log", string);
						return 1;
					}
					case 5: // Meth
					{
						if(PlayerInfo[playerid][pDrugs][2] >= amount) PlayerInfo[playerid][pDrugs][2] -= amount;
						else return SendClientMessageEx(playerid, COLOR_WHITE, "Ban khong co du no de cat!");

						HouseInfo[i][hMeth] += amount;
						format(string, sizeof(string), "Ban da cat %d Meth vao ngoi nha cua ban.", amount);
						SendClientMessageEx(playerid, COLOR_WHITE, string);
						OnPlayerStatsUpdate(playerid);
						SaveHouse(i);
						format(string, sizeof(string), "%s (SQL: %d) da cat %d meth vao ngoi nha (ID: %d) an toan.", GetPlayerNameEx(playerid), GetPlayerSQLId(playerid), amount, i);
						Log("logs/hsafe.log", string);
						return 1;
					}
					case 6: // Ecstasy
					{
						if(PlayerInfo[playerid][pDrugs][3] >= amount) PlayerInfo[playerid][pDrugs][3] -= amount;
						else return SendClientMessageEx(playerid, COLOR_WHITE, "Ban khong co du no de cat!");

						HouseInfo[i][hEcstasy] += amount;
						format(string, sizeof(string), "Ban da cat %d Ecstasy vao ngoi nha cua ban.", amount);
						SendClientMessageEx(playerid, COLOR_WHITE, string);
						OnPlayerStatsUpdate(playerid);
						SaveHouse(i);
						format(string, sizeof(string), "%s (SQL: %d) da cat %d Ecstasy vao ngoi nha (ID: %d) an toan.", GetPlayerNameEx(playerid), GetPlayerSQLId(playerid), amount, i);
						Log("logs/hsafe.log", string);
						return 1;
					}
					case 7: // Heroin
					{
						if(PlayerInfo[playerid][pDrugs][4] >= amount) PlayerInfo[playerid][pDrugs][4] -= amount;
						else return SendClientMessageEx(playerid, COLOR_WHITE, "Ban khong co du no de cat!");

						HouseInfo[i][hHeroin] += amount;
						format(string, sizeof(string), "Ban da cat %d Heroin vao ngoi nha cua ban.", amount);
						SendClientMessageEx(playerid, COLOR_WHITE, string);
						OnPlayerStatsUpdate(playerid);
						SaveHouse(i);
						format(string, sizeof(string), "%s (SQL: %d) da cat %d heroin vao ngoi nha (ID: %d) an toan.", GetPlayerNameEx(playerid), GetPlayerSQLId(playerid), amount, i);
						Log("logs/hsafe.log", string);
						return 1;
					}
				}
			}
		}
		SendClientMessageEx(playerid, COLOR_GREY, "Ban khong o trong ngoi nha ma ban so huu.");
	}
	else return SendClientMessageEx(playerid, COLOR_GREY, "Ban khong co nha.");
	return 1;
}

/*
CMD:workbench(playerid, params[]) {
        new szType[10], iChoice, iAmount, houseid;
        if(sscanf(params, "s[6]ii", szType, iChoice, iAmount)) {
            SendClientMessageEx(playerid, COLOR_GRAD2, "SU DUNG: /workbench [type] [choice] [amount]");
            SendClientMessageEx(playerid, COLOR_GRAD2, "TYPE: melee, gun");
            SendClientMessageEx(playerid, COLOR_GRAD2, "CHOICE GUN: 9mm (0), SDPistol (1), Shotgun (2), Rifle (3)");
            SendClientMessageEx(playerid, COLOR_GRAD2, "CHOICE MELEE: Brass Knuckles (0), Baseball Bat (1), Shovel (2), Pool Cue (3), Cane (4)");
            return SendClientMessageEx(playerid, COLOR_GRAD2, "CHOICE MELEE: Dildo (5), Vibrator (6), Katana (7), Flowers (8), SprayCan (9)");
        }
        for(new i = 0; i < 3; i++)
        {
            if(i == 0) houseid = PlayerInfo[playerid][pPhousekey];
            if(i == 1) houseid = PlayerInfo[playerid][pPhousekey2];
            if(i == 2) houseid = PlayerInfo[playerid][pPhousekey3];
            if(houseid != INVALID_HOUSE_ID && HouseInfo[houseid][hOwnerID] == GetPlayerSQLId(playerid) && IsPlayerInRangeOfPoint(playerid, 50, HouseInfo[houseid][hInteriorX], HouseInfo[houseid][hInteriorY], HouseInfo[houseid][hInteriorZ]) && GetPlayerVirtualWorld(playerid) == HouseInfo[houseid][hIntVW] && GetPlayerInterior(playerid) == HouseInfo[houseid][hIntIW])
            {
       			if(iAmount <= 0) return SendClientMessageEx(playerid, -1, "You can't have negative amount values.");
				if(strcmp(szType,"melee",true) == 0) 
				{
           			if(playerid != INVALID_PLAYER_ID && iChoice >= 0 || iChoice <= 9) 
           	   		  	{
                    		if(PlayerInfo[playerid][pMats] < 150) return SendClientMessageEx(playerid, COLOR_GRAD2, "You dont have enough materials to produce the weapon.");
                    		if(PlayerInfo[playerid][pMats] < 2000 && iChoice == 9) return SendClientMessageEx(playerid, COLOR_GRAD2, "You dont have enough materials to produce the weapon.");
                    		switch(iChoice)
                    		{
                    			case 0: GivePlayerValidWeapon(playerid, WEAPON_BRASSKNUCKLE);
								case 1: GivePlayerValidWeapon(playerid, WEAPON_BAT);
								case 2: GivePlayerValidWeapon(playerid, WEAPON_SHOVEL);	
								case 3: GivePlayerValidWeapon(playerid, WEAPON_POOLSTICK);
								case 4: GivePlayerValidWeapon(playerid, WEAPON_CANE);
								case 5:	GivePlayerValidWeapon(playerid, WEAPON_DILDO);
								case 6:	GivePlayerValidWeapon(playerid, WEAPON_VIBRATOR);
								case 7:	GivePlayerValidWeapon(playerid, WEAPON_KATANA);
								case 8: GivePlayerValidWeapon(playerid, WEAPON_FLOWER);
								case 9: GivePlayerValidWeapon(playerid, WEAPON_SPRAYCAN);
                    		}
                    		if(iChoice == 9) { PlayerInfo[playerid][pMats] -= 1850; }
                    		PlayerInfo[playerid][pMats] -= 150;
                    		format(szMiscArray, sizeof(szMiscArray), "You have crafted a melee weapon.", iAmount);
                    		return SendClientMessageEx(playerid, COLOR_WHITE, szMiscArray);
               			}
				}
				if(strcmp(szType,"gun",true) == 0) 
				{
            		if(playerid != INVALID_PLAYER_ID && iChoice >= 0 || iChoice <= 3) 
               		{
                   		switch(iChoice)
                   		{
                   			case 0:
                   			{
                   				if(PlayerInfo[playerid][pMats] < 3000) return SendClientMessageEx(playerid, COLOR_GRAD2, "You dont have enough materials to produce the gun.");
                   				GivePlayerValidWeapon(playerid, WEAPON_COLT45);
                   				PlayerInfo[playerid][pMats] -= 3000;
                    			format(szMiscArray, sizeof(szMiscArray), "You have crafted a 9mm weapon.", iAmount);
                   			}
                   			case 1:
                   			{
                   				if(PlayerInfo[playerid][pMats] < 3000) return SendClientMessageEx(playerid, COLOR_GRAD2, "You dont have enough materials to produce the gun.");
                   				GivePlayerValidWeapon(playerid, WEAPON_SILENCED);
                   				PlayerInfo[playerid][pMats] -= 3000;
                    			format(szMiscArray, sizeof(szMiscArray), "You have crafted a Silenced weapon.", iAmount);
                   			}
                   			case 2:
                   			{
                   				if(PlayerInfo[playerid][pMats] < 4000) return SendClientMessageEx(playerid, COLOR_GRAD2, "You dont have enough materials to produce the gun.");
                   				GivePlayerValidWeapon(playerid, WEAPON_SHOTGUN);
                   				PlayerInfo[playerid][pMats] -= 4000;
                    			format(szMiscArray, sizeof(szMiscArray), "You have crafted a Shotgun weapon.", iAmount);
                   			}
                   			case 3:
                   			{
                   				if(PlayerInfo[playerid][pMats] < 4000) return SendClientMessageEx(playerid, COLOR_GRAD2, "You dont have enough materials to produce the gun.");
                   				GivePlayerValidWeapon(playerid, WEAPON_RIFLE);
                   				PlayerInfo[playerid][pMats] -= 4000;
                    			format(szMiscArray, sizeof(szMiscArray), "You have crafted a Country Rifle weapon.", iAmount);
                   			}
                   		}
                    	return SendClientMessageEx(playerid, COLOR_WHITE, szMiscArray);
                	}
            	}
       		}
        	SendClientMessageEx(playerid, COLOR_WHITE, "You're not in a house you own.");
    	}
		return 1;
}*/

CMD:hbalance(playerid, params[])
{
	if(Homes[playerid] > 0)
	{
		for(new i; i < MAX_HOUSES; i++)
		{
			if(GetPlayerSQLId(playerid) == HouseInfo[i][hOwnerID] && IsPlayerInRangeOfPoint(playerid, 50, HouseInfo[i][hInteriorX], HouseInfo[i][hInteriorY], HouseInfo[i][hInteriorZ]) && GetPlayerVirtualWorld(playerid) == HouseInfo[i][hIntVW] && GetPlayerInterior(playerid) == HouseInfo[i][hIntIW])
			{
				new string[128];
				SendClientMessageEx(playerid, COLOR_GREEN, "|___________________________________ House Safe ___________________________________|");
				format(string, sizeof(string), "Cash: $%s | Pot: %s | Crack: %s | Materials: %s | Meth: %s | Ecstasy: %s | Heroin: %s", number_format(HouseInfo[i][hSafeMoney]), number_format(HouseInfo[i][hPot]), number_format(HouseInfo[i][hCrack]), number_format(HouseInfo[i][hMaterials]), number_format(HouseInfo[i][hMeth]), number_format(HouseInfo[i][hEcstasy]), number_format(HouseInfo[i][hHeroin]));
				SendClientMessageEx(playerid, COLOR_WHITE, string);
				
				SendClientMessageEx(playerid, COLOR_GREEN, "|__________________________________________________________________________________|");
				return 1;
			}
		}
		SendClientMessageEx(playerid, COLOR_GREY, "Ban khong o trong ngoi nha ma ban so huu.");
	}
	else return SendClientMessageEx(playerid, COLOR_GREY, "Ban khong co nha.");
	return 1;
}

CMD:closet(playerid, params[])
{
	if(Homes[playerid] > 0)
	{
		for(new i; i < MAX_HOUSES; i++)
		{
			if(GetPlayerSQLId(playerid) == HouseInfo[i][hOwnerID] && IsPlayerInRangeOfPoint(playerid, 50, HouseInfo[i][hInteriorX], HouseInfo[i][hInteriorY], HouseInfo[i][hInteriorZ]) && GetPlayerVirtualWorld(playerid) == HouseInfo[i][hIntVW] && GetPlayerInterior(playerid) == HouseInfo[i][hIntIW])
			{
				if(HouseInfo[i][hClosetX] != 0)
				{
					if(IsPlayerInRangeOfPoint(playerid, 3.0, HouseInfo[i][hClosetX], HouseInfo[i][hClosetY], HouseInfo[i][hClosetZ]))
					{
						return DisplaySkins(playerid);
					}
					else return SendClientMessageEx(playerid, COLOR_GREY, "Ban khong o gan tu quan ao cua ban!");
				}
				else return SendClientMessageEx(playerid, COLOR_GREY, "Ban khong co tu nao trong ngoi nha nay!");
			}
		}
		SendClientMessageEx(playerid, COLOR_GREY, "Ban khong o trong ngoi nha ma ban so huu.");
	}
	else return SendClientMessageEx(playerid, COLOR_GREY, "Ban khong so huu mot ngoi nha nao.");
	return 1;
}

CMD:closetadd(playerid, params[])
{
	if(Homes[playerid] > 0)
	{
		for(new i; i < MAX_HOUSES; i++)
		{
			if(GetPlayerSQLId(playerid) == HouseInfo[i][hOwnerID] && IsPlayerInRangeOfPoint(playerid, 50, HouseInfo[i][hInteriorX], HouseInfo[i][hInteriorY], HouseInfo[i][hInteriorZ]) && GetPlayerVirtualWorld(playerid) == HouseInfo[i][hIntVW] && GetPlayerInterior(playerid) == HouseInfo[i][hIntIW])
			{
				if(HouseInfo[i][hClosetX] != 0)
				{
					if(IsPlayerInRangeOfPoint(playerid, 3.0, HouseInfo[i][hClosetX], HouseInfo[i][hClosetY], HouseInfo[i][hClosetZ]))
					{
						CountSkins(playerid);
						if((PlayerInfo[playerid][pDonateRank] <= 0 && PlayerInfo[playerid][pSkins] <= 10) || (PlayerInfo[playerid][pDonateRank] > 0 && PlayerInfo[playerid][pSkins] <= 25))
						{
							new string[128];
							new skinid = GetPlayerSkin(playerid);
							AddSkin(playerid, skinid);
							format(string, sizeof(string), "Ban da them Skin ID %d vao tu quan ao.", skinid);
							SendClientMessageEx(playerid, COLOR_WHITE, string);
							return 1;
						}
						else return SendClientMessageEx(playerid, COLOR_GREY, "Tu quan ao cua ban khong con cho cho quan ao nua!");
					}
					else return SendClientMessageEx(playerid, COLOR_GREY, "Ban khong o gan tu quan ao cua ban!");
				}
				else return SendClientMessageEx(playerid, COLOR_GREY, "Ban khong co tu quan ao trong ngoi nha nay!");
			}
		}
		SendClientMessageEx(playerid, COLOR_GREY, "Ban khong o trong ngoi nha ma ban so huu.");
	}
	else return SendClientMessageEx(playerid, COLOR_GREY, "Ban khong so huu mot ngoi nha nao.");
	return 1;
}

CMD:closetremove(playerid, params[])
{
	if(Homes[playerid] > 0)
	{
		for(new i; i < MAX_HOUSES; i++)
		{
			if(GetPlayerSQLId(playerid) == HouseInfo[i][hOwnerID] && IsPlayerInRangeOfPoint(playerid, 50, HouseInfo[i][hInteriorX], HouseInfo[i][hInteriorY], HouseInfo[i][hInteriorZ]) && GetPlayerVirtualWorld(playerid) == HouseInfo[i][hIntVW] && GetPlayerInterior(playerid) == HouseInfo[i][hIntIW])
			{
				if(HouseInfo[i][hClosetX] != 0)
				{
					if(IsPlayerInRangeOfPoint(playerid, 3.0, HouseInfo[i][hClosetX], HouseInfo[i][hClosetY], HouseInfo[i][hClosetZ]))
					{
						new query[128];
						mysql_format(MainPipeline, query, sizeof(query), "SELECT `skinid` FROM `house_closet` WHERE playerid = %d ORDER BY `skinid` ASC", GetPlayerSQLId(playerid));
						mysql_tquery(MainPipeline, query, "SkinQueryFinish", "ii", playerid, Skin_Query_Delete);
						return 1;
					}
					else return SendClientMessageEx(playerid, COLOR_GREY, "Ban khong o gan tu quan ao cua ban!");
				}
				else return SendClientMessageEx(playerid, COLOR_GREY, "Ban khong co tu quan ao trong ngoi nha nay!");
			}
		}
		SendClientMessageEx(playerid, COLOR_GREY, "Ban khong o trong ngoi nha ma ban so huu.");
	}
	else return SendClientMessageEx(playerid, COLOR_GREY, "Ban khong so huu mot ngoi nha nao.");
	return 1;
}
CMD:vutbo(playerid, params[]) return cmd_drop(playerid, params);
CMD:drop(playerid, params[])
{
	new string[128], amount, choice[32];
	if(sscanf(params, "s[32]D(0)", choice, amount))
	{
		SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /drop [name] [(optional) amount]");
		SendClientMessageEx(playerid, COLOR_GREY, "Ten Co San: Weapons, Materials, Packages, Radio, Pizza, Syringes, Backpack, Phone");
		SendClientMessageEx(playerid, COLOR_GREY, "Ten Co San: Pot, Crack, Meth, Ecstasy, Heroin");
		return 1;
	}
	else if(strcmp(choice,"backpack",true) == 0)
	{
		if(PlayerInfo[playerid][pBackpack] > 0)
		{
			ShowPlayerDialogEx(playerid, DIALOG_BDROP, DIALOG_STYLE_MSGBOX, "Drop Backpack Confirmation", "{FFFFFF}Ban co chac chan muon bo balo cua minh khong?\n{FF8000}Ghi chu{FFFFFF}: Dieu nay se {FF0000}Vinh Vien{FFFFFF} thao bo balo va tat ca vat pham ben trong!", "Co", "Khong");
		}
		else
		{
			SendClientMessageEx(playerid, COLOR_GREY, "Ban khong co Balo!");
		}
	}
	else if(strcmp(choice,"syringes",true) == 0)
	{
		if(PlayerInfo[playerid][pSyringes] > 0)
		{
			if(amount < 1) return SendClientMessageEx(playerid, COLOR_GREY, "Vui long chi dinh chi so.");
			if(amount > PlayerInfo[playerid][pSyringes]) return SendClientMessageEx(playerid, COLOR_GREY, "Ban khong co nhieu ong tiem nhu vay!");
			PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
			format(string, sizeof(string), "Ban da danh roi %d syringes.", amount);
			SendClientMessageEx(playerid, COLOR_WHITE, string);
			PlayerInfo[playerid][pSyringes] -= amount;
			format(string, sizeof(string), "* %s da vut bo mot so syringes.", GetPlayerNameEx(playerid));
			ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
		}
		else
		{
			SendClientMessageEx(playerid, COLOR_GREY, "Ban khong mang theo ong tiem nao de vut bo!");
		}
	}
	else if(strcmp(choice,"pot",true) == 0)
	{
		if(PlayerInfo[playerid][pDrugs][0] > 0)
		{
			if(amount < 1) return SendClientMessageEx(playerid, COLOR_GREY, "Vui long chi so luong.");
			if(amount > PlayerInfo[playerid][pDrugs][0]) return SendClientMessageEx(playerid, COLOR_GREY, "Ban khong co nhieu Pot nhu vay!");
			PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
			format(string, sizeof(string), "Ban da danh roi %d pot.", amount);
			SendClientMessageEx(playerid, COLOR_WHITE, string);
			PlayerInfo[playerid][pDrugs][0] -= amount;
			format(string, sizeof(string), "* %s da vut bo mot so pot.", GetPlayerNameEx(playerid));
			ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
		}
		else
		{
			SendClientMessageEx(playerid, COLOR_GREY, "Ban khong mang theo Pot nao de vut bo!");
		}
	}
	else if(strcmp(choice,"crack",true) == 0)
	{
		if(PlayerInfo[playerid][pDrugs][1] > 0)
		{
			if(amount < 1) return SendClientMessageEx(playerid, COLOR_GREY, "Vui long chi so luong.");
			if(amount > PlayerInfo[playerid][pDrugs][1]) return SendClientMessageEx(playerid, COLOR_GREY, "Ban khong co nhieu Crack nhu vay!");
			PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
			format(string, sizeof(string), "Ban da danh roi %d crack.", amount);
			SendClientMessageEx(playerid, COLOR_WHITE, string);
			PlayerInfo[playerid][pDrugs][1] -= amount;
			format(string, sizeof(string), "* %s da vut bo mot so crack.", GetPlayerNameEx(playerid));
			ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
		}
		else
		{
			SendClientMessageEx(playerid, COLOR_GREY, "Ban khong mang theo bat ky Crack nao de vut bo!");
		}
	}
	else if(strcmp(choice,"meth",true) == 0)
	{
		if(PlayerInfo[playerid][pDrugs][2] > 0)
		{
			if(amount < 1) return SendClientMessageEx(playerid, COLOR_GREY, "Vui long chi so luong.");
			if(amount > PlayerInfo[playerid][pDrugs][2]) return SendClientMessageEx(playerid, COLOR_GREY, "Ban khong co nhieu Meth nhu vay!");
			PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
			format(string, sizeof(string), "Ban da danh roi %d meth.", amount);
			SendClientMessageEx(playerid, COLOR_WHITE, string);
			PlayerInfo[playerid][pDrugs][2] -= amount;
			format(string, sizeof(string), "* %s da vut bo mot so meth.", GetPlayerNameEx(playerid));
			ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
		}
		else
		{
			SendClientMessageEx(playerid, COLOR_GREY, "Ban khong mang theo bat ky Meth nao de vut bo!");
		}
	}
	else if(strcmp(choice,"ecstasy",true) == 0)
	{
		if(PlayerInfo[playerid][pDrugs][3] > 0)
		{
			if(amount < 1) return SendClientMessageEx(playerid, COLOR_GREY, "Vui long chi so luong.");
			if(amount > PlayerInfo[playerid][pDrugs][3]) return SendClientMessageEx(playerid, COLOR_GREY, "Ban khong co nhieu thuoc lac nhu vay!");
			PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
			format(string, sizeof(string), "Ban da danh roi %d thuoc lac.", amount);
			SendClientMessageEx(playerid, COLOR_WHITE, string);
			PlayerInfo[playerid][pDrugs][3] -= amount;
			format(string, sizeof(string), "* %s da vut bo mot so thuoc lac.", GetPlayerNameEx(playerid));
			ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
		}
		else
		{
			SendClientMessageEx(playerid, COLOR_GREY, "Ban khong mang theo thuoc lac nao de vut bo!");
		}
	}
	else if(strcmp(choice,"heroin",true) == 0)
	{
		if(PlayerInfo[playerid][pDrugs][4] > 0)
		{
			if(amount < 1) return SendClientMessageEx(playerid, COLOR_GREY, "Vui long chi so luong.");
			if(amount > PlayerInfo[playerid][pDrugs][4]) return SendClientMessageEx(playerid, COLOR_GREY, "Ban khong co nhieu Heroin nhu vay!");
			PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
			format(string, sizeof(string), "Ban da danh roi %d heroin.", amount);
			SendClientMessageEx(playerid, COLOR_WHITE, string);
			PlayerInfo[playerid][pDrugs][4] -= amount;
			format(string, sizeof(string), "* %s da vut bo mot so heroin.", GetPlayerNameEx(playerid));
			ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
		}
		else
		{
			SendClientMessageEx(playerid, COLOR_GREY, "Ban khong mang theo Heroin nao de vut bo!");
		}
	}

	else if(strcmp(choice,"materials",true) == 0)
	{
		if(PlayerInfo[playerid][pMats] > 0)
		{
			if(amount < 1) return SendClientMessageEx(playerid, COLOR_GREY, "Vui long chi so luong.");
			if(amount > PlayerInfo[playerid][pMats]) return SendClientMessageEx(playerid, COLOR_GREY, "Ban khong co nhieu vat lieu nhu vay!");
			PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
			format(string, sizeof(string), "Ban da danh roi %d vat lieu.", amount);
			SendClientMessageEx(playerid, COLOR_WHITE, string);
			format(string, sizeof(string), "* %s da vut bo mot so vat lieu.", GetPlayerNameEx(playerid));
			ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
			PlayerInfo[playerid][pMats] -= amount;
		}
		else
		{
			SendClientMessageEx(playerid, COLOR_GREY, "Ban khong mang theo bat ky vat lieu nao de bo!");
		}
	}
	else if(strcmp(choice,"radio",true) == 0)
	{
		if(PlayerInfo[playerid][pRadio] != 0)
		{
			PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
			format(string, sizeof(string), "* %s da vut bo Radio cam tay.", GetPlayerNameEx(playerid));
			ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
			PlayerInfo[playerid][pRadio] = 0;
			PlayerInfo[playerid][pRadioFreq] = 0;
		}
		else
		{
			SendClientMessageEx(playerid, COLOR_GREY, "Ban khong mang theo Radio nao de vut bo!");
		}
	}
	else if(strcmp(choice,"weapons",true) == 0)
	{
		if(GetPVarType(playerid, "IsInArena"))
		{
			SendClientMessageEx(playerid, COLOR_WHITE, "Ban khong the lam dieu nay ngay bay gio, ban dang o trong mot dau truong!");
			return 1;
		}
		if(GetPVarInt( playerid, "EventToken") != 0)
		{
			SendClientMessageEx(playerid, COLOR_GREY, "Ban khong the su dung khi dang tham gia su kien.");
			return 1;
		}
		PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
		ResetPlayerWeaponsEx(playerid);
		format(string, sizeof(string), "* %s da vut bo Vu Khi.", GetPlayerNameEx(playerid));
		ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
	}
	else if(strcmp(choice,"packages",true) == 0)
	{
		if(GetPVarInt(playerid, "Packages") > 0)
		{
			PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
			format(string, sizeof(string), "* %s da vut bo Goi vat lieu.", GetPlayerNameEx(playerid));
			ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
			DeletePVar(playerid, "Packages");
		}
		else
		{
			SendClientMessageEx(playerid, COLOR_GREY, "Ban khong mang theo bat ky goi vat lieu nao de vut bo!");
		}
	}
	else if(strcmp(choice,"pizza",true) == 0)
	{
		if(GetPVarType(playerid, "Pizza"))
		{
			PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
			format(string, sizeof(string), "* %s da vut bo Banh Pizza.", GetPlayerNameEx(playerid));
			ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
            DeletePVar(playerid, "Pizza");
			DeletePVar(playerid, "pizzaTimer");
		}
		else
		{
			SendClientMessageEx(playerid, COLOR_GREY, "Ban khong co bat ky chiec Pizza nao!");
		}
	}
	else if(strcmp(choice,"phone", true) == 0)
	{
		if(PlayerInfo[playerid][pPnumber] != 0)
		{
			PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
			format(string, sizeof(string), "* %s da vut bo chiec dien thoai.", GetPlayerNameEx(playerid));
			ProxChatBubble(playerid, string);
			PlayerInfo[playerid][pPnumber] = 0;
		}
		else
		{
			SendClientMessageEx(playerid, COLOR_GREY, "Ban khong co dien thoai.");
		}
	}
	else
	{
		SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /drop [name] [(optional) amount]");
		SendClientMessageEx(playerid, COLOR_GREY, "Ten Co San: Weapons, Materials, Packages, Radio, Pizza, Syringes, Backpack, Phone");
		return SendClientMessageEx(playerid, COLOR_GREY, "Ten Co San: Pot, Crack, Meth, Ecstasy, Heroin");
	}
	return 1;
}

CMD:show(playerid, params[])
{
	new string[128], giveplayerid, choice[32];
	if(sscanf(params, "us[32]", giveplayerid, choice))
	{
		SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /show [player] [name]");
		SendClientMessageEx(playerid, COLOR_GREY, "Ten Co San: Pot, Crack, Meth, Ecstasy, Heroin, Materials, Credits");
		return 1;
	}

	if(giveplayerid == playerid)
	{
	    SendClientMessageEx(playerid, COLOR_GREY, "Ban khong the hien thi dieu nay cho chinh minh!");
		return 1;
	}

	if(IsPlayerConnected(giveplayerid))
	{
		if(giveplayerid != INVALID_PLAYER_ID)
		{
			if (!ProxDetectorS(5.0, playerid, giveplayerid))
			{
				SendClientMessageEx(playerid, COLOR_GREY, "Nguoi do khong o gan ban.");
				return 1;
			}

			if (strcmp(choice, "materials", true) == 0)
			{
			    new amount = PlayerInfo[playerid][pMats];
			    if(amount < 1)
			    {
			        SendClientMessageEx(playerid, COLOR_GREY, "Ban khong co bat ky vat lieu nao!");
					return 1;
			    }
				format(string, sizeof(string), "%s da cho ban xem %d vat lieu cua ho.",  GetPlayerNameEx(playerid), amount);
				SendClientMessageEx(giveplayerid, COLOR_GRAD2, string);

				format(string, sizeof(string), "Ban da cho %s xem %d vat lieu cua ban.", GetPlayerNameEx(giveplayerid), amount);
				SendClientMessageEx(playerid, COLOR_GRAD2, string);

				format(string, sizeof(string), "* %s da cho %s xem mot so vat lieu.", GetPlayerNameEx(playerid), GetPlayerNameEx(giveplayerid));
				ProxDetector(10.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
				return 1;
			}
			if (strcmp(choice, "pot", true) == 0)
			{
			    new amount = PlayerInfo[playerid][pDrugs][0];
			    if(amount < 1)
			    {
			        SendClientMessageEx(playerid, COLOR_GREY, "Ban khong co bat ky pot nao!");
					return 1;
			    }
				format(string, sizeof(string), "%s da cho ban xem %d grams pot cua ban.",  GetPlayerNameEx(playerid), amount);
				SendClientMessageEx(giveplayerid, COLOR_GRAD2, string);

				format(string, sizeof(string), "Ban da cho %s xem %d grams pot cua ban.", GetPlayerNameEx(giveplayerid), amount);
				SendClientMessageEx(playerid, COLOR_GRAD2, string);

				format(string, sizeof(string), "* %s da cho %s xem mot so pot.", GetPlayerNameEx(playerid), GetPlayerNameEx(giveplayerid));
				ProxDetector(10.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
				return 1;
			}
			if (strcmp(choice, "crack", true) == 0)
			{
			    new amount = PlayerInfo[playerid][pDrugs][1];
			    if(amount < 1)
			    {
			        SendClientMessageEx(playerid, COLOR_GREY, "Ban khong co bat ky crack nao!");
					return 1;
			    }
				format(string, sizeof(string), "%s da cho ban xem %d grams crack cua ho.",  GetPlayerNameEx(playerid), amount);
				SendClientMessageEx(giveplayerid, COLOR_GRAD2, string);

				format(string, sizeof(string), "Ban da cho %s xem %d grams crack cua ban.", GetPlayerNameEx(giveplayerid), amount);
				SendClientMessageEx(playerid, COLOR_GRAD2, string);

				format(string, sizeof(string), "* %s da cho %s xem mot so crack.", GetPlayerNameEx(playerid), GetPlayerNameEx(giveplayerid));
				ProxDetector(10.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
				return 1;
			}
			if (strcmp(choice, "meth", true) == 0)
			{
			    new amount = PlayerInfo[playerid][pDrugs][2];
			    if(amount < 1)
			    {
			        SendClientMessageEx(playerid, COLOR_GREY, "Ban khong co bat ky meth nao!");
					return 1;
			    }
				format(string, sizeof(string), "%s da cho ban xem %d grams meth cua ho.",  GetPlayerNameEx(playerid), amount);
				SendClientMessageEx(giveplayerid, COLOR_GRAD2, string);

				format(string, sizeof(string), "Ban da cho %s xem %d grams meth cua ban.", GetPlayerNameEx(giveplayerid), amount);
				SendClientMessageEx(playerid, COLOR_GRAD2, string);

				format(string, sizeof(string), "* %s da cho %s xem mot so meth.", GetPlayerNameEx(playerid), GetPlayerNameEx(giveplayerid));
				ProxDetector(10.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
				return 1;
			}
			if (strcmp(choice, "ecstasy", true) == 0)
			{
			    new amount = PlayerInfo[playerid][pDrugs][3];
			    if(amount < 1)
			    {
			        SendClientMessageEx(playerid, COLOR_GREY, "Ban khong co bat ky thuoc lac nao!");
					return 1;
			    }
				format(string, sizeof(string), "%s da cho ban xem %d grams thuoc lac cua ho.",  GetPlayerNameEx(playerid), amount);
				SendClientMessageEx(giveplayerid, COLOR_GRAD2, string);

				format(string, sizeof(string), "Ban da cho %s xem %d grams thuoc lac cua ban.", GetPlayerNameEx(giveplayerid), amount);
				SendClientMessageEx(playerid, COLOR_GRAD2, string);

				format(string, sizeof(string), "* %s da cho %s xem mot so thuoc lac.", GetPlayerNameEx(playerid), GetPlayerNameEx(giveplayerid));
				ProxDetector(10.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
				return 1;
			}
   			if (strcmp(choice, "heroin", true) == 0)
			{
			    new amount = PlayerInfo[playerid][pDrugs][4];
			    if(amount < 1)
			    {
			        SendClientMessageEx(playerid, COLOR_GREY, "Ban khong co bat ky heroin nao!");
					return 1;
			    }
				format(string, sizeof(string), "%s da cho ban xem %d milligrams heroin cua ho.",  GetPlayerNameEx(playerid), amount);
				SendClientMessageEx(giveplayerid, COLOR_GRAD2, string);

				format(string, sizeof(string), "Ban da cho %s xem %d milligrams heroin cua ban.", GetPlayerNameEx(giveplayerid), amount);
				SendClientMessageEx(playerid, COLOR_GRAD2, string);

				format(string, sizeof(string), "* %s da cho %s xem mot so heroin.", GetPlayerNameEx(playerid), GetPlayerNameEx(giveplayerid));
				ProxDetector(10.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
				return 1;
			}
			if (strcmp(choice, "credits", true) == 0)
			{
			    new amount = PlayerInfo[playerid][pCredits];
			    if(amount < 1)
			    {
			        SendClientMessageEx(playerid, COLOR_GREY, "Ban khong co bat ky credits nao!");
					return 1;
			    }
				format(string, sizeof(string), "%s da cho ban xem %d credits cua ho.",  GetPlayerNameEx(playerid), amount);
				SendClientMessageEx(giveplayerid, COLOR_GRAD2, string);

				format(string, sizeof(string), "Ban da cho %s xem %d credits cua ban.", GetPlayerNameEx(giveplayerid), amount);
				SendClientMessageEx(playerid, COLOR_GRAD2, string);

				format(string, sizeof(string), "* %s da cho %s xem mot so credits.", GetPlayerNameEx(playerid), GetPlayerNameEx(giveplayerid));
				ProxDetector(10.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
				return 1;
			}
		}
	}
	return 1;
}
//CMD:ban(playerid, params[]) return cmd_sell(playerid, params);
CMD:sell(playerid, params[])
{
	new string[128], giveplayerid, choice[32], amount, price;
    if(sscanf(params, "us[32]dd", giveplayerid, choice, amount, price))
	{
		SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /sell [Nguoi choi] [Ten] [So luong] [Gia]");
		SendClientMessageEx(playerid, COLOR_GREY, "Ten Co San: Pot, Crack, Materials, Firework, Syringes, Rawopium, Heroin, RimKit, Carvoucher, PVIPVoucher");
		return 1;
	}
	if(PlayerCuffed[playerid] >= 1 || GetPVarInt(playerid, "pBagged") >= 1 ||PlayerInfo[playerid][pHospital] > 0) return SendClientMessageEx(playerid, COLOR_WHITE, "Ban khong the lam dieu nay ngay bay gio.");
	if(GetPVarInt(playerid, "WatchingTV")) return SendClientMessageEx(playerid, COLOR_GREY, "Ban khong the lam dieu nay khi dang xem TV!");
	if(price < 500) return SendClientMessageEx(playerid, COLOR_GREY, "Gia khong duoc thap hon $500. Su dung /give cho nhung giao dich khong qua lua dao.");
	if(price > 5000000) return SendClientMessageEx(playerid, COLOR_GREY, "Gia khong duoc thap hon $500. Su dung /give cho nhung giao dich khong qua lua dao.");
	if(price > 10000000)
	{
		format(string, sizeof(string), "{AA3333}AdmWarning{FFFF00}: %s dang co gang ban %s cho %s voi gia $%d.", GetPlayerNameEx(playerid), choice, GetPlayerNameEx(giveplayerid), price);
		ABroadCast(COLOR_YELLOW, string, 2);
	}
	if(amount < 1) return SendClientMessageEx(playerid, COLOR_GREY, "So luong khong duoc thap hon 1.");
	if(!IsPlayerConnected(giveplayerid)) return SendClientMessageEx(playerid, COLOR_GRAD1, "Da chi dinh nguoi choi khong hop le.");
	if(playerid == giveplayerid) return SendClientMessageEx(playerid, COLOR_GREY, "Ban khong the ban cho chinh minh!");
	if(!ProxDetectorS(8.0, playerid, giveplayerid)) return SendClientMessageEx(playerid, COLOR_GREY, "Nguoi do khong o gan ban.");

    else if (strcmp(choice, "rimkit", true) == 0)
	{
		if(amount > PlayerInfo[playerid][pRimMod])
			return SendClientMessageEx(playerid, COLOR_GREY, " Ban khong co nhieu rim kits.");

		format(string, sizeof(string), "* Ban da de nghi %s mua %d rim kits voi gia $%s.", GetPlayerNameEx(giveplayerid), amount, number_format(price));
		SendClientMessageEx(playerid, COLOR_LIGHTBLUE, string);
		format(string, sizeof(string), "* %s muon ban cho ban %d rim kits voi gia $%s, (Go /chapnhan rimkit) de mua.", GetPlayerNameEx(playerid), amount, number_format(price));
		SendClientMessageEx(giveplayerid, COLOR_LIGHTBLUE, string);
	 	SetPVarInt(giveplayerid, "RimOffer", playerid);
	 	SetPVarInt(giveplayerid, "RimPrice", price);
	 	SetPVarInt(giveplayerid, "RimCount", amount);
	 	SetPVarInt(giveplayerid, "RimSeller_SQLId", GetPlayerSQLId(playerid));
	}
	else if (strcmp(choice, "pvipvoucher", true) == 0)
	{
		if(amount > PlayerInfo[playerid][pPVIPVoucher])
			return SendClientMessageEx(playerid, COLOR_GREY, " Ban khong co nhieu PVIP Vouchers 1 thang.");

		format(string, sizeof(string), "* Ban da de nghi %s mua %d PVIP Voucher(s) 1 thang voi gia $%s.", GetPlayerNameEx(giveplayerid), amount, number_format(price));
		SendClientMessageEx(playerid, COLOR_LIGHTBLUE, string);
		format(string, sizeof(string), "* %s muon ban cho ban %d PVIP Voucher(s) 1 thang voi gia $%s, (Go /chapnhan pvipvoucher) de mua.", GetPlayerNameEx(playerid), amount, number_format(price));
		SendClientMessageEx(giveplayerid, COLOR_LIGHTBLUE, string);
	 	SetPVarInt(giveplayerid, "PVIPVoucherOffer", playerid);
	 	SetPVarInt(giveplayerid, "PVIPVoucherPrice", price);
	 	SetPVarInt(giveplayerid, "PVIPVoucherCount", amount);
	 	SetPVarInt(giveplayerid, "PVIPVoucherSeller_SQLId", GetPlayerSQLId(playerid));
	}
	return 1;

}
