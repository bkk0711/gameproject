/*

	 /$$   /$$  /$$$$$$          /$$$$$$$  /$$$$$$$
	| $$$ | $$ /$$__  $$        | $$__  $$| $$__  $$
	| $$$$| $$| $$  \__/        | $$  \ $$| $$  \ $$
	| $$ $$ $$| $$ /$$$$ /$$$$$$| $$$$$$$/| $$$$$$$/
	| $$  $$$$| $$|_  $$|______/| $$__  $$| $$____/
	| $$\  $$$| $$  \ $$        | $$  \ $$| $$
	| $$ \  $$|  $$$$$$/        | $$  | $$| $$
	|__/  \__/ \______/         |__/  |__/|__/

				  Accept / Cancel Commands

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
CMD:accept(playerid, params[]) {
	return cmd_chapnhan(playerid, params);
}
CMD:chapnhan(playerid, params[])
{
	if(restarting) return SendClientMessageEx(playerid, COLOR_GRAD2, "Giao dich hien dang bi vo hieu hoa do may chu duoc khoi dong lai de ba otri.");
	new szMessage[256];
	new string[128];
	new sendername[MAX_PLAYER_NAME];
	new giveplayer[MAX_PLAYER_NAME];
	new giveplayerid;
	if(HungerPlayerInfo[playerid][hgInEvent] != 0) return SendClientMessageEx(playerid, COLOR_GREY, "   Ban khong the lam dieu nay khi tham gia su kien!");
    if(IsPlayerConnected(playerid)) {
        if(isnull(params)) {
            SendClientMessageEx(playerid, COLOR_GREY, "USAGE: /chapnhan [name]");
            SendClientMessageEx(playerid, COLOR_GREY, "Ten co san: Sex, Mats, Crack, Cannabis, Weapon, Craft, Repair, Lawyer, Bodyguard, CongViec, Live, DoXang");
            SendClientMessageEx(playerid, COLOR_GREY, "Ten co san: Firework, Group, Boxing, Medic, Mechanic, VePhat, Car, Chet, Backpack");
            SendClientMessageEx(playerid, COLOR_GREY, "Ten co san: Business, Item, Offer, Heroin, Rawopium, Syringes, Rimkit, Voucher, Kiss, RenderAid, Frisk");
            return 1;
        }
		if(strcmp(params, "door", true) == 0)
		{
			new target, fine, count;
			target = INVALID_PLAYER_ID;
			foreach(new i : Player)
			{
				if(gPlayerLogged{i} == 1 && DDSalePendingAdmin[i] == false && DDSalePendingPlayer[i] == true && DDSaleTarget[i] == playerid)
				{
					target = i;
					count ++;
					if(count > 1) break;
				}
			}
			if(target == INVALID_PLAYER_ID) return SendClientMessageEx(playerid, COLOR_GREY, "Ban khong co mot de nghi ban door.");
			if(count > 1)
			{
				foreach(new i : Player) if(gPlayerLogged{i} == 1 && DDSaleTarget[i] == playerid) ClearDoorSaleVariables(i);
				SendClientMessageEx(playerid, COLOR_GREY, "Xay ra loi, vui long thu thuc hien lai giao dich cua ban.");
				return 1;
			}
			if(GetPlayerCash(playerid) < DDSalePrice[target])
			{
				format(string, sizeof(string), "Ban khong co du tien cho giao dich nay ($%s).", number_format(DDSalePrice[target]));
				SendClientMessageEx(playerid, COLOR_GREY, string);
				return 1;
			}
			fine = CalculatePercentage(DDSalePrice[target], 10, 1000000);
			if(GetPlayerCash(target) < fine)
			{
				format(string, sizeof(string), "%s Khong co du tien cho viec chuyen tien phat ($%s).", GetPlayerNameEx(target), number_format(fine));
				SendClientMessageEx(playerid, COLOR_GREY, string);
				return 1;
			}
			stop DDSaleTimer[target];
			DDSalePendingAdmin[target] = true;
			DDSalePendingPlayer[target] = false;
			format(string, sizeof(string), "Ban da chap nhan %s's de nghi ban door gia $%s.", GetPlayerNameEx(target), number_format(DDSalePrice[target]));
			SendClientMessageEx(playerid, COLOR_GREEN, string);
			SendClientMessageEx(playerid, COLOR_GREEN, "Administrator se xem xet yeu cau truoc khi no duoc xu ly.");
			format(string, sizeof(string), "%s chap nhan de nghi ban door cua ban gia $%s.", GetPlayerNameEx(playerid), number_format(DDSalePrice[target]));
			SendClientMessageEx(target, COLOR_GREEN, string);
			SendClientMessageEx(target, COLOR_GREEN, "Administrator se xem xet yeu cau truoc khi no duoc xu ly.");
			format(string, sizeof(string), "[Yeu cau ban door moi]: (ID: %d) %s.", target, GetPlayerNameEx(target));
			ABroadCast(COLOR_LIGHTRED, string, 4);
			return 1;
		}
		else if(strcmp(params, "renderaid", true) == 0)
		{
			if(!GetPVarType(playerid, "Injured")) return SendClientMessageEx(playerid, COLOR_GRAD2, "Ban khong o trong tinh trang bi thuong.");
			if(!GetPVarType(playerid, "renderaid")) return SendClientMessageEx(playerid, COLOR_GRAD2, "Khong ai de nghi ban giup do!");
			new target = GetPVarInt(playerid, "renderaid");
			if(!IsPlayerConnected(target)) return SendClientMessageEx(playerid, COLOR_GRAD2, "Nguoi de nghi giup do ban khong con truc tuyen.");
			new Float:pos[3];
			GetPlayerPos(playerid, pos[0], pos[1], pos[2]);
			if(!IsPlayerInRangeOfPoint(target, 5.0, pos[0], pos[1], pos[2])) return SendClientMessageEx(playerid, COLOR_GRAD2, "Ban khong o gan nguoi de nghi giup do ban.");
			if(GetPVarInt(target, "MedVestKit") != 1)
				return SendClientMessageEx(target, COLOR_GRAD2, "Ban khong mang theo mot bo."), SendClientMessageEx(playerid, COLOR_GRAD2, "Nguoi choi khong the ho tro ban vi ho khong con co bo dung cu med.");
			ApplyAnimation(target, "BOMBER", "BOM_Plant", 4.0, 0, 0, 0, 0, 0, 1);
			SetHealth(playerid, 100);
			format(string, sizeof(string), "{FF8000}** {C2A2DA}%s vien tro cho %s.", GetPlayerNameEx(target), GetPlayerNameEx(playerid));
			ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
			DeletePVar(playerid, "renderaid");
			DeletePVar(target, "MedVestKit");
		}
		else if(strcmp(params, "weapon", true) == 0)
		{
			if(!GetPVarType(playerid, "pSellGunID") || GetPVarInt(playerid, "pSellGunID") == INVALID_PLAYER_ID) return SendClientMessageEx(playerid, COLOR_GRAD2, "Khong ai moi ban mot khau sung!");

			new id = GetPVarInt(playerid, "pSellGunID");

			if(PlayerInfo[id][pMats] < GetPVarInt(playerid, "pSellGunMats")) 
			{
				SendClientMessage(id, COLOR_WHITE, "Ban khong co du nguyen lieu de ban mat hang nay!");
				return SendClientMessage(playerid, COLOR_WHITE, "Nguoi ban khong con du nguyen lieu de ban mat hang nay!");
			}

			new weapon[16];
			GetWeaponName(GetPVarInt(playerid, "pSellGun"), weapon, sizeof(weapon));

			PlayerInfo[id][pMats] -= GetPVarInt(playerid, "pSellGunMats");
			GivePlayerValidWeapon(playerid, GetPVarInt(playerid, "pSellGun"));

  			if(PlayerInfo[id][pDoubleEXP] > 0)
			{
				SendClientMessageEx(id, COLOR_YELLOW, "Ban da nhan duoc 2 diem ky nang thay vi 1. Ban co %d so gio con lai nhan x2 EXP.", PlayerInfo[id][pDoubleEXP]);
   				PlayerInfo[id][pArmsSkill] += (GetPVarInt(playerid, "pSellGunXP")*2);
			}
			else
			{
  				PlayerInfo[id][pArmsSkill] += GetPVarInt(playerid, "pSellGunXP");
			}

			format(szMiscArray, sizeof(szMiscArray), "%s che tao %s tu vat lieu, dua no cho %s.", GetPlayerNameEx(id), weapon, GetPlayerNameEx(playerid)); 
			ProxDetector(30.0, playerid, szMiscArray, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);

			PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0); // Just a little 'classic' feel to it. -Winterfield
			PlayerPlaySound(id, 1052, 0.0, 0.0, 0.0);

			DeletePVar(playerid, "pSellGun");
			DeletePVar(playerid, "pSellGunID");
			DeletePVar(playerid, "pSellGunMats");
			DeletePVar(playerid, "pSellGunXP");
		}
        else if(strcmp(params, "valentine", true) == 0)
		{
	        if (!GetPVarType(playerid, "kissvaloffer")) {
       	 		return SendClientMessageEx(playerid, COLOR_GREY, "Khong ai tang ban valentine!");
			}
			if (GetPVarInt(playerid,"kissvalsqlid") != GetPlayerSQLId(GetPVarInt(playerid, "kissvaloffer"))) {
				return SendClientMessageEx(playerid, COLOR_GREY, "Nguoi moi da ngat ket noi.");
			}
			new Float: ppFloats[3], targetid;
			targetid = GetPVarInt(playerid, "kissvaloffer");
			GetPlayerPos(targetid, ppFloats[0], ppFloats[1], ppFloats[2]);

			if(!IsPlayerInRangeOfPoint(playerid, 2, ppFloats[0], ppFloats[1], ppFloats[2]) || Spectating[targetid] > 0)
			{
				SendClientMessageEx(playerid, COLOR_GREY, "Ban o qua xa!");
				DeletePVar(playerid, "kissvaloffer");
	      		DeletePVar(playerid, "kissvalsqlid");
				DeletePVar(targetid, "kissvalstyle");
				return 1;
			}
			if(PlayerInfo[playerid][pGiftTime] > 0)
			{
				format(string, sizeof(string),"Item: Reset Gift Timer\nYour Credits: %s\nCost: {FFD700}%s{A9C4E4}\nCredits Left: %s", number_format(PlayerInfo[playerid][pCredits]), number_format(ShopItems[17][sItemPrice]), number_format(PlayerInfo[playerid][pCredits]-ShopItems[17][sItemPrice]));
				ShowPlayerDialogEx( playerid, DIALOG_SHOPGIFTRESET, DIALOG_STYLE_MSGBOX, "Reset Gift Timer", string, "Purchase", "Exit" );
				SendClientMessageEx(playerid, COLOR_GRAD2, "You have already received a gift in the last 5 hours!");
				SendClientMessageEx(targetid, COLOR_GRAD2, "Your requested valentine cannot accept.");
				DeletePVar(playerid, "kissvaloffer");
	      		DeletePVar(playerid, "kissvalsqlid");
				DeletePVar(targetid, "kissvalstyle");
				return 1;
			}
			else if(PlayerInfo[targetid][pGiftTime] > 0)
			{
				SendClientMessageEx(playerid, COLOR_GRAD2, "That player has already received a gift in the last 5 hours!");
				DeletePVar(playerid, "kissvaloffer");
	      		DeletePVar(playerid, "kissvalsqlid");
				DeletePVar(targetid, "kissvalstyle");
				return 1;
			}
			ClearAnimationsEx(playerid);
			ClearAnimationsEx(targetid);
			PlayerFacePlayer( playerid, targetid );
			switch(GetPVarInt(targetid,"kissvalstyle")) {
				case 1:
				{
					ApplyAnimation( playerid, "KISSING", "Playa_Kiss_01", 4.1, 0, 0, 0, 0, 0, 1);
					ApplyAnimation( targetid, "KISSING", "Playa_Kiss_01", 4.1, 0, 0, 0, 0, 0, 1);
				}
				case 2:
				{
					ApplyAnimation( playerid, "KISSING", "Playa_Kiss_02", 4.1, 0, 0, 0, 0, 0, 1);
					ApplyAnimation( targetid, "KISSING", "Playa_Kiss_02", 4.1, 0, 0, 0, 0, 0, 1);
				}
				case 3:
				{
					ApplyAnimation( playerid, "KISSING", "Playa_Kiss_03", 4.1, 0, 0, 0, 0, 0, 1);
					ApplyAnimation( targetid, "KISSING", "Playa_Kiss_03", 4.1, 0, 0, 0, 0, 0, 1);
				}
				case 4:
				{
					ApplyAnimation( playerid, "KISSING", "Grlfrd_Kiss_01", 4.1, 0, 0, 0, 0, 0, 1);
					ApplyAnimation( targetid, "KISSING", "Grlfrd_Kiss_01", 4.1, 0, 0, 0, 0, 0, 1);
				}
				case 5:
				{
					ApplyAnimation( playerid, "KISSING", "Grlfrd_Kiss_02", 4.1, 0, 0, 0, 0, 0, 1);
					ApplyAnimation( targetid, "KISSING", "Grlfrd_Kiss_02", 4.1, 0, 0, 0, 0, 0, 1);
				}
				case 6:
				{
					ApplyAnimation( playerid, "KISSING", "Grlfrd_Kiss_03", 4.1, 0, 0, 0, 0, 0, 1);
					ApplyAnimation( targetid, "KISSING", "Grlfrd_Kiss_03", 4.1, 0, 0, 0, 0, 0, 1);
				}
			}
			format(string, sizeof(string), "* %s has given %s a kiss.", GetPlayerNameEx(playerid), GetPlayerNameEx(targetid));
			ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
			GiftPlayer(MAX_PLAYERS, playerid);
			GiftPlayer(MAX_PLAYERS, targetid);
   			DeletePVar(playerid, "kissvaloffer");
      		DeletePVar(playerid, "kissvalsqlid");
			DeletePVar(targetid, "kissvalstyle");
   		}
		else if(strcmp(params, "business", true) == 0)
		{
	        if (!GetPVarType(playerid, "Business_Inviter")) {
       	 		return SendClientMessageEx(playerid, COLOR_GREY, "Khong ai moi ban tham gia cua hang!");
			}
			if (PlayerInfo[playerid][pBusiness] != INVALID_BUSINESS_ID) {
				return SendClientMessageEx(playerid, COLOR_GREY, "Ban dang trnog cua hang khac. Truoc tien ban phai tu chuc truoc khi chap nhan de nghi nay.");
			}
			if (GetPVarInt(playerid,"Business_InviterSQLId") != GetPlayerSQLId(GetPVarInt(playerid, "Business_Inviter"))) {
				return SendClientMessageEx(playerid, COLOR_GREY, "Nguoi moi da ngat ket noi.");
			}
			PlayerInfo[playerid][pBusiness] = GetPVarInt(playerid, "Business_Invited");
			PlayerInfo[playerid][pBusinessRank] = 0;
            format(string, sizeof(string), "* Ban da chap nhan loi moi tham gia %s, ban duoc moi boi %s.", Businesses[GetPVarInt(playerid, "Business_Invited")][bName], GetPlayerNameEx(GetPVarInt(playerid, "Business_Inviter")));
            SendClientMessageEx(playerid, COLOR_LIGHTBLUE, string);
            format(string, sizeof(string), "* %s da chap nhan loi moi tham gia %s", GetPlayerNameEx(playerid),Businesses[GetPVarInt(playerid, "Business_Invited")][bName]);
            SendClientMessageEx(GetPVarInt(playerid, "Business_Inviter"), COLOR_LIGHTBLUE, string);
			format(string, sizeof(string), "%s(%d) da chap nhan %s's(%d) loi moi tham gia  %s", GetPlayerNameEx(playerid), GetPlayerSQLId(playerid), GetPlayerNameEx(GetPVarInt(playerid, "Business_Inviter")), GetPlayerSQLId(GetPVarInt(playerid, "Business_Inviter")), Businesses[GetPVarInt(playerid, "Business_Invited")][bName]);
			Log("logs/business.log", string);
   			DeletePVar(playerid, "Business_Inviter");
      		DeletePVar(playerid, "Business_Invited");
   		}
        else if(strcmp(params, "gun", true) == 0)
		{
			if (!GetPVarType(playerid, "Business_WeapOfferer"))	{
		        return SendClientMessageEx(playerid, COLOR_GREY, "Khong ai cung cap vu khi cho ban!");
			}
		    new offerer = GetPVarInt(playerid, "Business_WeapOfferer"), business = PlayerInfo[offerer][pBusiness];
			if (GetPlayerSQLId(offerer) != GetPVarInt(playerid, "Business_WeapOffererSQLId")) {
   				return SendClientMessage(playerid, COLOR_GRAD2, "Nguoi cung cap da ngat ket noi!");
			}
            if(!ProxDetectorS(5.0, playerid, offerer)) {
       	        SendClientMessageEx(playerid, COLOR_GREY, "Nguoi ban khong o gan ban!");
       	        return 1;
            }
		    if(GetPVarType(playerid, "IsInArena")) {
				SendClientMessageEx(playerid, COLOR_WHITE, "Ban khong the lam dieu nay khi dang o trong dau truong!");
				return 1;
			}
		    if (GetPlayerCash(playerid) < GetPVarInt(playerid, "Business_WeapPrice")) {
			    SendClientMessageEx(playerid, COLOR_GREY, "Ban khong du tien de mua vu khi");
			    return 1;
		    }
		    if (Businesses[business][bInventory] < GetWeaponParam(GetPVarInt(playerid, "Business_WeapType"), WeaponMats)) {
				SendClientMessage(playerid, COLOR_GRAD2, "Shop doesnt have mats anymore");
				return 1;
		    }
			if(GetPVarType(playerid, "PlayerCuffed") || GetPVarInt(playerid, "pBagged") >= 1 || GetPVarType(playerid, "Injured") || GetPVarType(playerid, "IsFrozen")) {
   				SendClientMessage(playerid, COLOR_GRAD2, "Ban khong the lam dieu nay ngay bay gio!");
   				return 1;
			}

		    Businesses[business][bTotalSales]++;
		    Businesses[business][bLevelProgress]++;
		    Businesses[business][bSafeBalance] += TaxSale(GetPVarInt(playerid, "Business_WeapPrice"));
  			GivePlayerCash(playerid, -GetPVarInt(playerid, "Business_WeapPrice"));
		    Businesses[business][bInventory] -= GetWeaponParam(GetPVarInt(playerid, "Business_WeapType"), WeaponMats);
		    SaveBusiness(business);

            format(string, sizeof(string), "   Ban da ban %s mot %s.", GetPlayerNameEx(playerid),Weapon_ReturnName(GetPVarInt(playerid, "Business_WeapType")));
            SendClientMessageEx(offerer, COLOR_GRAD1, string);
            format(string, sizeof(string), "   Ban da nhan duoc mot %s tu %s.", Weapon_ReturnName(GetPVarInt(playerid, "Business_WeapType")), GetPlayerNameEx(offerer));
            SendClientMessageEx(playerid, COLOR_GRAD1, string);
            PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
            PlayerPlaySound(offerer, 1052, 0.0, 0.0, 0.0);
            format(string, sizeof(string), "* %s tao ra mot khau sung tu vat lieu va ban no cho %s.", GetPlayerNameEx(offerer), GetPlayerNameEx(playerid));
            ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
            GivePlayerValidWeapon(playerid,GetPVarInt(playerid, "Business_WeapType"));

			format(string, sizeof(string), "%s %s(%d) (IP: %s) has sold a %s to %s(%d) (IP: %s) for $%d in %s (%d)", GetBusinessRankName(PlayerInfo[offerer][pBusinessRank]), GetPlayerNameEx(offerer), GetPlayerSQLId(offerer), GetPlayerIpEx(offerer), Weapon_ReturnName(GetPVarInt(playerid, "Business_WeapType")), GetPlayerNameEx(playerid), GetPlayerSQLId(playerid), GetPlayerIpEx(playerid), GetPVarInt(playerid, "Business_WeapPrice"), Businesses[business][bName], business);
			Log("logs/business.log", string);

  		    DeletePVar(playerid, "Business_WeapPrice");
		    DeletePVar(playerid, "Business_WeapType");
		    DeletePVar(playerid, "Business_WeapOfferer");
		    DeletePVar(playerid, "Business_WeapOffererSQLId");
		}

        else if(strcmp(params, "item", true) == 0) {

			if (!GetPVarType(playerid, "Business_ItemOfferer")) {
		        SendClientMessageEx(playerid, COLOR_GREY, "Khong ai cung cap ban item!");
		        return 1;
			}

		    new offerer = GetPVarInt(playerid, "Business_ItemOfferer");
		    new item = GetPVarInt(playerid, "Business_ItemType");
		    new price = GetPVarInt(playerid, "Business_ItemPrice");
			new business = InBusiness(playerid);

			if (business == INVALID_BUSINESS_ID)
			{
				SendClientMessage(playerid, COLOR_GRAD2, "You are not in the business interior");
   				return 1;
			}
			if (GetPlayerSQLId(offerer) != GetPVarInt(playerid, "Business_ItemOffererSQLId")) {
   				SendClientMessage(playerid, COLOR_GRAD2, "Nguoi cung cap da ngat ket noi!");
   				return 1;
			}
		    if (GetPlayerCash(playerid) < price) {
			    SendClientMessageEx(playerid, COLOR_GREY, "You can't afford the item!");
			    return 1;
		    }
			if (!Businesses[business][bItemPrices][item]) {
			    SendClientMessageEx(playerid, COLOR_GRAD4, "Item is not for sale anymore.");
			    return 1;
			}
		 	if (Businesses[business][bInventory] < 1) {
	   	 		SendClientMessageEx(playerid, COLOR_GRAD2, "Store does not have any items anymore!");
	   	 		return 1;
			}
			if (GetPVarInt(playerid, "Business_ItemPrice") != Businesses[business][bItemPrices][item]) {
			    SendClientMessageEx(playerid, COLOR_GRAD4, "Purchase failed because the price for this item has changed.");
			    return 1;
			}

			if(item == ITEM_ILOCK || item == ITEM_SCALARM || item == ITEM_ELOCK)
   			{
      			if(Businesses[business][bInventory] >= StoreItemCost[item][ItemValue])
	        	{

					SetPVarInt(playerid, "lockcost", price);
     				SetPVarInt(playerid, "businessid", business);
	        		SetPVarInt(playerid, "item", item);
		        	SetPVarInt(playerid, "playersold", item);
			        GivePlayerStoreItem(playerid, 1, business, item+1, price);
				}
				else return SendClientMessageEx(playerid, COLOR_GRAD2, "The store does not have enough stock for that item!");
    		}
  			else GivePlayerStoreItem(playerid, 1, business, item+1, price);
		}


        else if(strcmp(params, "vehicle", true) == 0) {

		    new offerer = GetPVarInt(playerid, "Business_VehicleOfferer");
		    new price = GetPVarInt(playerid, "Business_VehiclePrice");
		    new slot = GetPVarInt(playerid, "Business_VehicleSlot");
		    new businessid = PlayerInfo[offerer][pBusiness];

			if (!GetPVarType(playerid, "Business_VehicleOfferer")) {
		        SendClientMessageEx(playerid, COLOR_GREY, "No one has offered you a vehicle!");
		        return 1;
			}

			if (GetPlayerSQLId(offerer) != GetPVarInt(playerid, "Business_VehicleOffererSQLId")) {
   				SendClientMessage(playerid, COLOR_GRAD2, "Nguoi cung cap da ngat ket noi!");
   				return 1;
			}
		    if (GetPlayerCash(playerid) < price) {
			    SendClientMessageEx(playerid, COLOR_GREY, "Ban khong co du tien de mua!");
			    return 1;
		    }

            new playervehicleid = GetPlayerFreeVehicleId(playerid);

			if(!vehicleCountCheck(playerid)) {
				return SendClientMessage(playerid, COLOR_GRAD2, "Ban khong the so huu them phuong tien nao nua.");
			}
			if(!vehicleSpawnCountCheck(playerid)) {
				return SendClientMessage(playerid, COLOR_GRAD2, "Ban co qua nhieu xe duoc spawn ra - hay cat vao.");
			}
            PlayerVehicleInfo[playerid][playervehicleid][pvId] = Businesses[businessid][bVehID][slot];
            PlayerVehicleInfo[playerid][playervehicleid][pvModelId] = Businesses[businessid][bModel][slot];
            PlayerVehicleInfo[playerid][playervehicleid][pvPosX] = Businesses[businessid][bParkPosX][slot];
            PlayerVehicleInfo[playerid][playervehicleid][pvPosY] = Businesses[businessid][bParkPosY][slot];
            PlayerVehicleInfo[playerid][playervehicleid][pvPosZ] = Businesses[businessid][bParkPosZ][slot];
            PlayerVehicleInfo[playerid][playervehicleid][pvPosAngle] = Businesses[businessid][bParkAngle][slot];
            PlayerVehicleInfo[playerid][playervehicleid][pvSpawned] = 1;
            Businesses[businessid][DealershipVehStock][slot] = 0;
            VehicleSpawned[playerid]++;

		    g_mysql_SaveVehicle(playerid, playervehicleid);

    		Businesses[businessid][bSafeBalance] += TaxSale(GetPVarInt(playerid, "Business_ItemPrice"));
			GivePlayerCash(playerid, -GetPVarInt(playerid, "Business_VehiclePrice"));
			if (PlayerInfo[playerid][pBusiness] != PlayerInfo[offerer][pBusiness]) Businesses[businessid][bLevelProgress]++;
			SaveBusiness(businessid);
			OnPlayerStatsUpdate(playerid);
			PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);

			DeletePVar(playerid, "Business_VehiclePrice");
			DeletePVar(playerid, "Business_VehicleOfferer");
			DeletePVar(playerid, "Business_VehicleOffererSQLId");
			DeletePVar(playerid, "Business_VehicleSlot");
        }
        else if(strcmp(params, "chet", true) == 0) {
            if(GetPVarInt(playerid, "Injured") == 1) {

            	if(GetPVarInt(playerid, "InjuredWait") > gettime())
            		return SendClientMessageEx(playerid, COLOR_GRAD2, "Vui long doi 5 giay truoc khi ban chap nhan chet.");

                SendClientMessageEx(playerid, COLOR_WHITE, "Ban da tu bo hy vong va bat tinh, ban lap tuc duoc dua den benh vien.");
                KillEMSQueue(playerid);
                ResetPlayerWeaponsEx(playerid);
                SpawnPlayer(playerid);
            }
            else SendClientMessageEx(playerid, COLOR_GREY, "   Ban khong bi thuong, ban khong the lam dieu nay ngay bay gio!");
        }
        else if(strcmp(params, "car", true) == 0) {
            if(VehicleOffer[playerid] != INVALID_PLAYER_ID) {
                if(IsPlayerConnected(VehicleOffer[playerid])) {
                    if(GetPlayerCash(playerid) > VehiclePrice[playerid]) {
                        if(IsPlayerInVehicle(VehicleOffer[playerid], PlayerVehicleInfo[VehicleOffer[playerid]][VehicleId[playerid]][pvId])) {
                            if(!ProxDetectorS(8.0, VehicleOffer[playerid], playerid)) return SendClientMessageEx(playerid, COLOR_GREY, "Ban khong co gan dai ly xe");
                            new playervehicleid = GetPlayerFreeVehicleId(playerid);

			 				if(!vehicleCountCheck(playerid)) {
								return SendClientMessage(playerid, COLOR_GRAD2, "You can't own any more vehicles.");
							}
   							if(!vehicleSpawnCountCheck(playerid)) {
								return SendClientMessage(playerid, COLOR_GRAD2, "You have too many vehicles spawned - store one first.");
							}
							if(PlayerVehicleInfo[VehicleOffer[playerid]][VehicleId[playerid]][pvBeingPickLocked])
								return SendClientMessage(playerid, COLOR_GRAD2, "There was an error while trying to sell this vehicle.");

                            new ip[32], ipex[32];
                            GetPlayerIp(playerid, ip, sizeof(ip));
                            GetPlayerIp(VehicleOffer[playerid], ipex, sizeof(ipex));
                            format(szMessage, sizeof(szMessage), "[CAR] %s(%d) (IP: %s) has paid $%s to %s(%d) for the %s (IP: %s)", GetPlayerNameEx(playerid), GetPlayerSQLId(playerid), ip, number_format(VehiclePrice[playerid]), GetPlayerNameEx(VehicleOffer[playerid]), GetPlayerSQLId(VehicleOffer[playerid]), GetVehicleName(PlayerVehicleInfo[VehicleOffer[playerid]][VehicleId[playerid]][pvId]), ipex);
                            Log("logs/pay.log", szMessage);

                            format(szMiscArray, sizeof(szMiscArray), "[CARSALE][$%s] %s(%d) bought a %s from %s(%d)", number_format(VehiclePrice[playerid]), GetPlayerNameEx(playerid), playerid, GetVehicleName(PlayerVehicleInfo[VehicleOffer[playerid]][VehicleId[playerid]][pvId]), GetPlayerNameEx(VehicleOffer[playerid]), VehicleOffer[playerid]);
                            ABroadCast(COLOR_YELLOW, szMiscArray, 2);

                            GetPlayerName(VehicleOffer[playerid], giveplayer, sizeof(giveplayer));
                            GetPlayerName(playerid, sendername, sizeof(sendername));
                            format(szMessage, sizeof(szMessage), "* Ban da mua %s gia $%s, tu %s. (Go /carhelp de duoc giup nhieu hon)", GetVehicleName(PlayerVehicleInfo[VehicleOffer[playerid]][VehicleId[playerid]][pvId]), number_format(VehiclePrice[playerid]), giveplayer);
                            SendClientMessageEx(playerid, COLOR_LIGHTBLUE, szMessage);
                            format(szMessage, sizeof(szMessage), "* Ban da ban %s den %s gia $%s.",GetVehicleName(PlayerVehicleInfo[VehicleOffer[playerid]][VehicleId[playerid]][pvId]), sendername, number_format(VehiclePrice[playerid]));
                            SendClientMessageEx(VehicleOffer[playerid], COLOR_LIGHTBLUE, szMessage);
							GivePlayerCashEx(playerid, TYPE_ONHAND, -VehiclePrice[playerid]);

							if(IsWeaponizedVehicle(PlayerVehicleInfo[VehicleOffer[playerid]][VehicleId[playerid]][pvModelId]))
							{
								new fine = GetPVarInt(VehicleOffer[playerid], "WepVehSaleFine");
								GivePlayerCashEx(VehicleOffer[playerid], TYPE_ONHAND, VehiclePrice[playerid] - fine);

								format(szMessage, sizeof(szMessage), "*Ban da bi phat %s cho giao dich nay", number_format(fine));
                            	SendClientMessageEx(VehicleOffer[playerid], COLOR_LIGHTBLUE, szMessage);

								DeletePVar(VehicleOffer[playerid], "WepVehSalePlayer");
								DeletePVar(VehicleOffer[playerid], "WepVehSaleVehicle");
								DeletePVar(VehicleOffer[playerid], "WepVehSalePrice");
								DeletePVar(VehicleOffer[playerid], "WepVehSaleFine");
							}
							else GivePlayerCashEx(VehicleOffer[playerid], TYPE_ONHAND, VehiclePrice[playerid]);

                            /*GivePlayerCash( VehicleOffer[playerid], VehiclePrice[playerid] );
                            GivePlayerCash(playerid, -VehiclePrice[playerid]);*/
                            RemovePlayerFromVehicle(VehicleOffer[playerid]);
                            new Float:slx, Float:sly, Float:slz;
                            GetPlayerPos(VehicleOffer[playerid], slx, sly, slz);
                            SetPlayerPos(VehicleOffer[playerid], slx, sly, slz+2);
							if(PlayerInfo[VehicleOffer[playerid]][pBackpack] > 0 && PlayerInfo[VehicleOffer[playerid]][pBStoredV] == PlayerVehicleInfo[VehicleOffer[playerid]][VehicleId[playerid]][pvSlotId])
							{
								PlayerInfo[VehicleOffer[playerid]][pBackpack] = 0;
								PlayerInfo[VehicleOffer[playerid]][pBEquipped] = 0;
								PlayerInfo[VehicleOffer[playerid]][pBStoredV] = INVALID_PLAYER_VEHICLE_ID;
								PlayerInfo[VehicleOffer[playerid]][pBStoredH] = INVALID_HOUSE_ID;
								SendClientMessageEx(VehicleOffer[playerid], COLOR_WHITE, "Ban da mat balo vi ban khong rut no");

							}
                            PlayerVehicleInfo[playerid][playervehicleid][pvId] = PlayerVehicleInfo[VehicleOffer[playerid]][VehicleId[playerid]][pvId];
                            PlayerVehicleInfo[playerid][playervehicleid][pvModelId] = PlayerVehicleInfo[VehicleOffer[playerid]][VehicleId[playerid]][pvModelId];
                            PlayerVehicleInfo[playerid][playervehicleid][pvPosX] = PlayerVehicleInfo[VehicleOffer[playerid]][VehicleId[playerid]][pvPosX];
                            PlayerVehicleInfo[playerid][playervehicleid][pvPosY] = PlayerVehicleInfo[VehicleOffer[playerid]][VehicleId[playerid]][pvPosY];
                            PlayerVehicleInfo[playerid][playervehicleid][pvPosZ] = PlayerVehicleInfo[VehicleOffer[playerid]][VehicleId[playerid]][pvPosZ];
                            PlayerVehicleInfo[playerid][playervehicleid][pvPosAngle] = PlayerVehicleInfo[VehicleOffer[playerid]][VehicleId[playerid]][pvPosAngle];
                            PlayerVehicleInfo[playerid][playervehicleid][pvLock] = PlayerVehicleInfo[VehicleOffer[playerid]][VehicleId[playerid]][pvLock];
                            PlayerVehicleInfo[playerid][playervehicleid][pvLocked] = PlayerVehicleInfo[VehicleOffer[playerid]][VehicleId[playerid]][pvLocked];
                            PlayerVehicleInfo[playerid][playervehicleid][pvPaintJob] = PlayerVehicleInfo[VehicleOffer[playerid]][VehicleId[playerid]][pvPaintJob];
                            PlayerVehicleInfo[playerid][playervehicleid][pvColor1] = PlayerVehicleInfo[VehicleOffer[playerid]][VehicleId[playerid]][pvColor1];
                            PlayerVehicleInfo[playerid][playervehicleid][pvColor2] = PlayerVehicleInfo[VehicleOffer[playerid]][VehicleId[playerid]][pvColor2];
                            PlayerVehicleInfo[playerid][playervehicleid][pvAllowedPlayerId] = PlayerVehicleInfo[VehicleOffer[playerid]][VehicleId[playerid]][pvAllowedPlayerId];
                            PlayerVehicleInfo[playerid][playervehicleid][pvPark] = PlayerVehicleInfo[VehicleOffer[playerid]][VehicleId[playerid]][pvPark];
                            PlayerVehicleInfo[playerid][playervehicleid][pvVW] = PlayerVehicleInfo[VehicleOffer[playerid]][VehicleId[playerid]][pvVW];
                            PlayerVehicleInfo[playerid][playervehicleid][pvInt] = PlayerVehicleInfo[VehicleOffer[playerid]][VehicleId[playerid]][pvInt];
							PlayerVehicleInfo[playerid][playervehicleid][pvAlarm] = PlayerVehicleInfo[VehicleOffer[playerid]][VehicleId[playerid]][pvAlarm];
							PlayerVehicleInfo[playerid][playervehicleid][pvLocksLeft] = PlayerVehicleInfo[VehicleOffer[playerid]][VehicleId[playerid]][pvLocksLeft];
							PlayerVehicleInfo[playerid][playervehicleid][pvWeapons][0] = 0;
							PlayerVehicleInfo[playerid][playervehicleid][pvWeapons][1] = 0;
							PlayerVehicleInfo[playerid][playervehicleid][pvWeapons][2] = 0;
							PlayerVehicleInfo[playerid][playervehicleid][pvPlate] = 0;
							PlayerVehicleInfo[playerid][playervehicleid][pvTicket] = 0;
                            PlayerVehicleInfo[playerid][playervehicleid][pvSpawned] = 1;
							PlayerVehicleInfo[playerid][playervehicleid][pvAlarmTriggered] = 0;
							PlayerVehicleInfo[playerid][playervehicleid][pvBeingPickLocked] = 0;
							PlayerVehicleInfo[playerid][playervehicleid][pvLastLockPickedBy] = 0;
                            VehicleSpawned[playerid]++;
                            for(new m = 0; m < MAX_MODS; m++) {
                                PlayerVehicleInfo[playerid][playervehicleid][pvMods][m] = PlayerVehicleInfo[VehicleOffer[playerid]][VehicleId[playerid]][pvMods][m];
                            }

        					mysql_format(MainPipeline, szMessage, sizeof(szMessage), "INSERT INTO `vehicles` (`sqlID`) VALUES ('%d')", GetPlayerSQLId(playerid));
							mysql_tquery(MainPipeline, szMessage, "OnQueryCreateVehicle", "ii", playerid, playervehicleid);

							mysql_format(MainPipeline, szMessage, sizeof(szMessage), "DELETE FROM `vehicles` WHERE `id` = '%d'", PlayerVehicleInfo[VehicleOffer[playerid]][VehicleId[playerid]][pvSlotId]);
							mysql_tquery(MainPipeline, szMessage, "OnQueryFinish", "ii", SENDDATA_THREAD, VehicleOffer[playerid]);

							PlayerVehicleInfo[VehicleOffer[playerid]][VehicleId[playerid]][pvSlotId] = 0;
                            PlayerVehicleInfo[VehicleOffer[playerid]][VehicleId[playerid]][pvId] = 0;
                            PlayerVehicleInfo[VehicleOffer[playerid]][VehicleId[playerid]][pvModelId] = 0;
                            PlayerVehicleInfo[VehicleOffer[playerid]][VehicleId[playerid]][pvPosX] = 0.0;
                            PlayerVehicleInfo[VehicleOffer[playerid]][VehicleId[playerid]][pvPosY] = 0.0;
                            PlayerVehicleInfo[VehicleOffer[playerid]][VehicleId[playerid]][pvPosZ] = 0.0;
                            PlayerVehicleInfo[VehicleOffer[playerid]][VehicleId[playerid]][pvPosAngle] = 0.0;
                            PlayerVehicleInfo[VehicleOffer[playerid]][VehicleId[playerid]][pvLock] = 0;
							PlayerVehicleInfo[VehicleOffer[playerid]][VehicleId[playerid]][pvLocksLeft] = 0;
                            PlayerVehicleInfo[VehicleOffer[playerid]][VehicleId[playerid]][pvLocked] = 0;
                            PlayerVehicleInfo[VehicleOffer[playerid]][VehicleId[playerid]][pvPaintJob] = -1;
                            PlayerVehicleInfo[VehicleOffer[playerid]][VehicleId[playerid]][pvColor1] = 0;
							PlayerVehicleInfo[VehicleOffer[playerid]][VehicleId[playerid]][pvImpounded] = 0;
                            PlayerVehicleInfo[VehicleOffer[playerid]][VehicleId[playerid]][pvColor2] = 0;
                            PlayerVehicleInfo[VehicleOffer[playerid]][VehicleId[playerid]][pvAllowedPlayerId] = INVALID_PLAYER_ID;
                            PlayerVehicleInfo[VehicleOffer[playerid]][VehicleId[playerid]][pvPark] = 0;
                            PlayerVehicleInfo[VehicleOffer[playerid]][VehicleId[playerid]][pvSpawned] = 0;
                            PlayerVehicleInfo[VehicleOffer[playerid]][VehicleId[playerid]][pvVW] = 0;
                            PlayerVehicleInfo[VehicleOffer[playerid]][VehicleId[playerid]][pvInt] = 0;
							PlayerVehicleInfo[VehicleOffer[playerid]][VehicleId[playerid]][pvWeapons][0] = 0;
							PlayerVehicleInfo[VehicleOffer[playerid]][VehicleId[playerid]][pvWeapons][1] = 0;
							PlayerVehicleInfo[VehicleOffer[playerid]][VehicleId[playerid]][pvWeapons][2] = 0;
							PlayerVehicleInfo[VehicleOffer[playerid]][VehicleId[playerid]][pvPlate] = 0;
							PlayerVehicleInfo[VehicleOffer[playerid]][VehicleId[playerid]][pvTicket] = 0;
							PlayerVehicleInfo[VehicleOffer[playerid]][VehicleId[playerid]][pvAlarm] = 0;
							PlayerVehicleInfo[VehicleOffer[playerid]][VehicleId[playerid]][pvAlarmTriggered] = 0;
							PlayerVehicleInfo[VehicleOffer[playerid]][VehicleId[playerid]][pvBeingPickLocked] = 0;
							PlayerVehicleInfo[VehicleOffer[playerid]][VehicleId[playerid]][pvLastLockPickedBy] = 0;
                            VehicleSpawned[VehicleOffer[playerid]]--;
                            for(new m = 0; m < MAX_MODS; m++) {
                                PlayerVehicleInfo[VehicleOffer[playerid]][VehicleId[playerid]][pvMods][m] = 0;
                            }

                            VehicleOffer[playerid] = INVALID_PLAYER_ID;
                            VehiclePrice[playerid] = 0;
                            return 1;
                        }
                        else {
                            SendClientMessageEx(playerid, COLOR_GREY, "   The Car Dealer is not in the offered car!");
                            return 1;
                        }
                    }
                    else {
                        SendClientMessageEx(playerid, COLOR_GREY, "   You can't afford the car!");
                        return 1;
                    }
                }
                return 1;
            }
            else {
                SendClientMessageEx(playerid, COLOR_GREY, "   Nobody offered to buy a car!");
                return 1;
            }
        }
        else if(strcmp(params, "house", true) == 0)
		{
            if(HouseOffer[playerid] != INVALID_PLAYER_ID)
			{
                if(IsPlayerConnected(HouseOffer[playerid]))
				{
                    if(HouseInfo[House[playerid]][hOwnerID] != GetPlayerSQLId(HouseOffer[playerid])) return SendClientMessageEx(playerid, COLOR_GREY, "They don't own that house.");
					if(House[playerid] == INVALID_HOUSE_ID) return SendClientMessageEx(playerid, COLOR_RED, "Error: No house specified.");
                    if(GetPlayerCash(playerid) > HousePrice[playerid])
					{
						if(PlayerInfo[HouseOffer[playerid]][pBackpack] > 0 && PlayerInfo[HouseOffer[playerid]][pBStoredH] == HouseInfo[House[playerid]][hSQLId])
						{
							PlayerInfo[HouseOffer[playerid]][pBackpack] = 0;
							PlayerInfo[HouseOffer[playerid]][pBEquipped] = 0;
							PlayerInfo[HouseOffer[playerid]][pBStoredV] = INVALID_PLAYER_VEHICLE_ID;
							PlayerInfo[HouseOffer[playerid]][pBStoredH] = INVALID_HOUSE_ID;
							SendClientMessageEx(HouseOffer[playerid], COLOR_WHITE, "Ban da mat ba lo vi ban khong rut no");
						}
                        ClearHouse(House[playerid]);
                        HouseInfo[House[playerid]][hLock] = 1;
                        format(HouseInfo[House[playerid]][hOwnerName], 128, "Khong ai so huu");
						HouseInfo[House[playerid]][hOwnerID] = -1;
                        sendername = GetPlayerNameEx(HouseOffer[playerid]);
                        PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
                        format(szMessage, sizeof(szMessage), "~w~Chuc mung~n~ Ban da ban tai san cua minh cho ~n~~g~$%d", HousePrice[playerid]);
                        GameTextForPlayer(HouseOffer[playerid], szMessage, 4000, 3);
                        if(House[playerid] == PlayerInfo[HouseOffer[playerid]][pPhousekey])
						{
							PlayerInfo[HouseOffer[playerid]][pPhousekey] = INVALID_HOUSE_ID;
							PlayerInfo[playerid][pPhousekey] = House[playerid];
						}
                        else if(House[playerid] == PlayerInfo[HouseOffer[playerid]][pPhousekey2])
						{
							PlayerInfo[HouseOffer[playerid]][pPhousekey2] = INVALID_HOUSE_ID;
							PlayerInfo[playerid][pPhousekey2] = House[playerid];
						}
						else if(House[playerid] == PlayerInfo[HouseOffer[playerid]][pPhousekey3])
						{
							PlayerInfo[HouseOffer[playerid]][pPhousekey3] = INVALID_HOUSE_ID;
							PlayerInfo[playerid][pPhousekey3] = House[playerid];
						}
						Homes[HouseOffer[playerid]]--;
						Homes[playerid]++;
                        GivePlayerCash(HouseOffer[playerid],HousePrice[playerid]);
						OnPlayerStatsUpdate(HouseOffer[playerid]);

						HouseInfo[House[playerid]][hOwnerID] = GetPlayerSQLId(playerid);
                        HouseInfo[House[playerid]][hOwned] = 1;
                        GetPlayerName(playerid, sendername, sizeof(sendername));
                        strmid(HouseInfo[House[playerid]][hOwnerName], sendername, 0, strlen(sendername), 255);
                        GivePlayerCash(playerid,-HousePrice[playerid]);
                        SendClientMessageEx(playerid, COLOR_WHITE, "Chuc mung ban da mua nha moi!");
                        SendClientMessageEx(playerid, COLOR_WHITE, "Go /help de xem lai phan tro giup tai san!");
                        SaveHouse(House[playerid]);
                        OnPlayerStatsUpdate(playerid);
						ReloadHouseText(House[playerid]);

                        new ip[32], ipex[32];
                        GetPlayerIp(HouseOffer[playerid], ip, sizeof(ip));
                        GetPlayerIp(playerid, ipex, sizeof(ipex));
                        format(szMessage,sizeof(szMessage),"%s(%d) (IP: %s) has sold their house (ID %d) to %s(%d) (IP: %s) for $%s.", GetPlayerNameEx(HouseOffer[playerid]), GetPlayerSQLId(HouseOffer[playerid]), ip, House[playerid], GetPlayerNameEx(playerid), GetPlayerSQLId(playerid), ipex, number_format(HousePrice[playerid]));
                        Log("logs/house.log", szMessage);

                        HouseOffer[playerid] = INVALID_PLAYER_ID;
                        HousePrice[playerid] = 0;
                        House[playerid] = INVALID_HOUSE_ID;
						return 1;
                    }
                    else
					{
                        SendClientMessageEx(playerid, COLOR_GREY, "   Ban khong du tien mua nha!");
                        HouseOffer[playerid] = INVALID_PLAYER_ID;
                        HousePrice[playerid] = 0;
                        House[playerid] = INVALID_HOUSE_ID;
                        return 1;
                    }
                }
				else return SendClientMessageEx(playerid, COLOR_GREY, "   Nguoi ban bi ngat ket noi!");
            }
            else return SendClientMessageEx(playerid, COLOR_GREY, "   Khong ai de nghi ban mua nha!");
        }
        else if(strcmp(params, "handshake", true) == 0) {
            new
                Count;

            foreach(new i : Player)
			{
				if(GetPVarType(i, "shrequest") && GetPVarInt(i, "shrequest") == playerid) {
					new
						Float: ppFloats[3];

					GetPlayerPos(i, ppFloats[0], ppFloats[1], ppFloats[2]);

					if(!IsPlayerInRangeOfPoint(playerid, 5, ppFloats[0], ppFloats[1], ppFloats[2]) || Spectating[i] > 0) {
						Count++;
						SendClientMessageEx(playerid, COLOR_WHITE, "Ban o qua xa. Ban khong the chap nhan cai bat tay ngay bay gio.");
					}
					else {
						switch(GetPVarInt(i, "shstyle")) {
							case 1:
							{
								Count++;
								PlayerFacePlayer( playerid, i );
								ApplyAnimation( playerid, "GANGS", "hndshkaa", 4.0, 1, 1, 1, 0, 1000 );
								ApplyAnimation( i, "GANGS", "hndshkaa", 4.0, 1, 1, 1, 0, 1000 );
								DeletePVar(i, "shrequest");
								format(szMessage, sizeof(szMessage), "* %s da bat tay voi %s.", GetPlayerNameEx(i), GetPlayerNameEx(playerid));
								ProxDetector(30.0, playerid, szMessage, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
								DeletePVar(i, "shstyle");
							}
							case 2:
							{
								Count++;
								PlayerFacePlayer( playerid, i );
								ApplyAnimation( playerid, "GANGS", "hndshkba", 4.0, 1, 1, 1, 0, 1000 );
								ApplyAnimation( i, "GANGS", "hndshkba", 4.0, 1, 1, 1, 0, 1000 );
								DeletePVar(i, "shrequest");
								format(szMessage, sizeof(szMessage), "* %s da bat tay voi %s.", GetPlayerNameEx(i), GetPlayerNameEx(playerid));
								ProxDetector(30.0, playerid, szMessage, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
								DeletePVar(i, "shstyle");
							}
							case 3:
							{
								Count++;
								PlayerFacePlayer( playerid, i );
								ApplyAnimation( playerid, "GANGS", "hndshkca", 4.0, 1, 1, 1, 0, 1000 );
								ApplyAnimation( i, "GANGS", "hndshkca", 4.0, 1, 1, 1, 0, 1000 );
								DeletePVar(i, "shrequest");
								format(szMessage, sizeof(szMessage), "* %s da bat tay voi %s.", GetPlayerNameEx(i), GetPlayerNameEx(playerid));
								ProxDetector(30.0, playerid, szMessage, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
								DeletePVar(i, "shstyle");
							}
							case 4:
							{
								Count++;
								PlayerFacePlayer( playerid, i );
								ApplyAnimation( playerid, "GANGS", "hndshkcb", 4.0, 1, 1, 1, 0, 1000 );
								ApplyAnimation( i, "GANGS", "hndshkca", 4.0, 1, 1, 1, 0, 1000 );
								DeletePVar(i, "shrequest");
								format(szMessage, sizeof(szMessage), "* %s da bat tay voi %s.", GetPlayerNameEx(i), GetPlayerNameEx(playerid));
								ProxDetector(30.0, playerid, szMessage, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
								DeletePVar(i, "shstyle");
							}
							case 5:
							{
								Count++;
								PlayerFacePlayer( playerid, i );
								ApplyAnimation( playerid, "GANGS", "hndshkda", 4.0, 1, 1, 1, 0, 1000 );
								ApplyAnimation( i, "GANGS", "hndshkca", 4.0, 1, 1, 1, 0, 1000 );
								DeletePVar(i, "shrequest");
								format(szMessage, sizeof(szMessage), "* %s da bat tay voi %s.", GetPlayerNameEx(i), GetPlayerNameEx(playerid));
								ProxDetector(30.0, playerid, szMessage, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
								DeletePVar(i, "shstyle");
							}
							case 6:
							{
								Count++;
								PlayerFacePlayer( playerid, i );
								ApplyAnimation( playerid, "GANGS","hndshkfa_swt", 4.0, 1, 1, 1, 0, 2600 );
								ApplyAnimation( i, "GANGS","hndshkfa_swt", 4.0, 1, 1, 1, 0, 2600 );
								DeletePVar(i, "shrequest");
								format(szMessage, sizeof(szMessage), "* %s da bat tay voi %s.", GetPlayerNameEx(i), GetPlayerNameEx(playerid));
								ProxDetector(30.0, playerid, szMessage, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
								DeletePVar(i, "shstyle");
							}
							case 7:
							{
								Count++;
								PlayerFacePlayer( playerid, i );
								ApplyAnimation( playerid, "GANGS", "prtial_hndshk_01", 4.0, 1, 1, 1, 0, 1250 );
								ApplyAnimation( i, "GANGS", "prtial_hndshk_01", 4.0, 1, 1, 1, 0, 1250 );
								DeletePVar(i, "shrequest");
								format(szMessage, sizeof(szMessage), "* %s da bat tay voi %s.", GetPlayerNameEx(i), GetPlayerNameEx(playerid));
								ProxDetector(30.0, playerid, szMessage, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
								DeletePVar(i, "shstyle");
							}
							case 8:
							{
								Count++;
								PlayerFacePlayer( playerid, i );
								ApplyAnimation( playerid, "GANGS", "prtial_hndshk_biz_01", 3.7, 1, 1, 1, 0, 2200 );
								ApplyAnimation( i, "GANGS", "prtial_hndshk_biz_01", 3.5, 1, 1, 1, 0, 2200 );
								DeletePVar(i, "shrequest");
								format(szMessage, sizeof(szMessage), "* %s da bat tay voi %s.", GetPlayerNameEx(i), GetPlayerNameEx(playerid));
								ProxDetector(30.0, playerid, szMessage, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
								DeletePVar(i, "shstyle");
							}
						}
					}
				}
            }
            if(Count == 0) return SendClientMessageEx(playerid, COLOR_WHITE, "Ban khong co bat ky yeu cau bat tay nao ca.");
            return 1;
        }
		else if(strcmp(params, "rflteam",true) == 0) {
			if(!GetPVarType(playerid, "RFLTeam_Invite")) return SendClientMessageEx(playerid, COLOR_GREY, "Nobody offered you to join a team.");
			new team = GetPVarInt(playerid, "RFLTeam_Team");
			giveplayerid = GetPVarInt(playerid, "RFLTeam_Inviter");
			DeletePVar(playerid, "RFLTeam_Invite");
			DeletePVar(playerid, "RFLTeam_Team");
			DeletePVar(playerid, "RFLTeam_Inviter");
			PlayerInfo[playerid][pRFLTeam] = team;
			RFLInfo[team][RFLmembers] +=1;
			format(szMessage, sizeof(szMessage), "* You are now part of %s's team. You may now use /rflhelp.", GetPlayerNameEx(giveplayerid));
			SendClientMessageEx(playerid, COLOR_LIGHTBLUE, szMessage);
			format(szMessage, sizeof(szMessage), "* %s has accepted your invite.", GetPlayerNameEx(playerid));
			SendClientMessageEx(giveplayerid, COLOR_LIGHTBLUE, szMessage);
			if( GetPVarInt( playerid, "EventToken" ) == 1 ) {
				if( EventKernel[ EventStatus ] == 1 || EventKernel[ EventStatus ] == 2 ) {
					if(EventKernel[EventType] == 3) {
						new Float:X, Float:Y, Float:Z;
						GetPlayerPos( playerid, X, Y, Z );
						format(szMessage, sizeof(szMessage), "Team: %s", RFLInfo[team][RFLname]);
						RFLTeamN3D[playerid] = CreateDynamic3DTextLabel(szMessage,0x008080FF,X,Y,Z,10.0,.attachedplayer = playerid, .worldid = GetPlayerVirtualWorld(playerid));
					}
				}
			}
			OnPlayerStatsUpdate(playerid);
			SaveRelayForLifeTeam(team);
		}
        else if(strcmp(params, "invite", true) == 0)
		{
            if(hInviteOffer[playerid] != INVALID_PLAYER_ID)
			{
                if(IsPlayerConnected(hInviteOffer[playerid]))
				{
	                if(CheckPointCheck(playerid)) return SendClientMessageEx(playerid, COLOR_WHITE, "Vui long dam bao rang diem kiem tra hien tai cua ban bi huy truoc tien (ban co goi vat lieu hoac diem kiem tra hien dang co).");
                    format(szMessage, sizeof(szMessage), "* Ban da chap nhan %s's moi vao nha, mot checkpoint da duoc dat de den nha cua ho.", GetPlayerNameEx(hInviteOffer[playerid]));
                    SendClientMessageEx(playerid, COLOR_LIGHTBLUE, szMessage);
                    format(szMessage, sizeof(szMessage), "* %s da chap nhan loi moi vao nha.", GetPlayerNameEx(playerid));
                    SendClientMessageEx(hInviteOffer[playerid], COLOR_LIGHTBLUE, szMessage);
					DisablePlayerCheckpoint(playerid);
                    SetPlayerCheckpoint(playerid, HouseInfo[hInviteHouse[playerid]][hExteriorX], HouseInfo[hInviteHouse[playerid]][hExteriorY], HouseInfo[hInviteHouse[playerid]][hExteriorZ], 4.0);
                    gPlayerCheckpointStatus[playerid] = CHECKPOINT_HOME;
					SetPVarInt(playerid, "hInviteHouse", hInviteHouse[playerid]);
                    hInviteOffer[playerid] = INVALID_PLAYER_ID;
					hInviteHouse[playerid] = INVALID_HOUSE_ID;
                    return 1;
                }
                else
				{
                    hInviteOffer[playerid] = INVALID_PLAYER_ID;
                    hInviteHouse[playerid] = INVALID_HOUSE_ID;
                    SendClientMessageEx(playerid, COLOR_GREY, "Nguoi gui loi moi vao nha da ngat ket nooi.");
                }
            }
            else return SendClientMessageEx(playerid, COLOR_GREY, "Khong ai gui cho ban mot loi moi vao nha.");
            return 1;
        }
        /*else if(strcmp(params, "divorce", true) == 0) {
            if(DivorceOffer[playerid] != INVALID_PLAYER_ID) {
                if(IsPlayerConnected(DivorceOffer[playerid])) {
                    if(ProxDetectorS(10.0, playerid, DivorceOffer[playerid])) {
                        GetPlayerName(DivorceOffer[playerid], giveplayer, sizeof(giveplayer));
                        GetPlayerName(playerid, sendername, sizeof(sendername));
                        format(szMessage, sizeof(szMessage), "* You have signed the divorce papers from %s, you are now single again.", giveplayer);
                        SendClientMessageEx(playerid, COLOR_LIGHTBLUE, szMessage);
                        format(szMessage, sizeof(szMessage), "* %s has signed the divorce papers, you are now single again.", sendername);
                        SendClientMessageEx(DivorceOffer[playerid], COLOR_LIGHTBLUE, szMessage);
                        ClearMarriage(playerid);
                        ClearMarriage(DivorceOffer[playerid]);
                        PlayerInfo[playerid][pPhousekey] = INVALID_HOUSE_ID;
                        return 1;
                    }
                    else {
                        SendClientMessageEx(playerid, COLOR_GREY, "   The person that sent you the Divorce Papers is not near you!");
                        return 1;
                    }
                }
            }
            else {
                SendClientMessageEx(playerid, COLOR_GREY, "Nobody sent you any divorce papers.");
                return 1;
            }
        }*/
        else if(strcmp(params, "group", true) == 0) {
            if(GetPVarType(playerid, "Group_Inviter")) {

    			new
					iInviter = GetPVarInt(playerid, "Group_Inviter"),
					iGroupID = PlayerInfo[iInviter][pLeader],
					iRank = PlayerInfo[iInviter][pRank];

				if (PlayerInfo[playerid][pCSFBanned]) {
					if (arrGroupData[iGroupID][g_iGroupType] == GROUP_TYPE_LEA || arrGroupData[iGroupID][g_iGroupType] == GROUP_TYPE_MEDIC)	{
						SendClientMessageEx(playerid, COLOR_WHITE, "Ban khong the chap nhan loi moi nhom nay, ban bi khoa trong cac to chuc. lien he thanh vien Administrator.");
						DeletePVar(playerid, "Group_Invite");
						DeletePVar(iInviter, "Group_Invited");
						return 1;
					}
				}

                if(IsPlayerConnected(iInviter) && GetPVarInt(iInviter, "Group_Invited") == playerid && 0 <= iGroupID < MAX_GROUPS) {
					PlayerInfo[playerid][pMember] = iGroupID;
					PlayerInfo[playerid][pRank] = 0;
					PlayerInfo[playerid][pDivision] = INVALID_DIVISION;
					strcpy(PlayerInfo[playerid][pBadge], "None", 9);
					arrGroupData[iGroupID][g_iMemberCount]++;

					format(szMessage, sizeof szMessage, "Ban da chap nhan loi moi %s %s's, va hien la thanh vien cua %s.", arrGroupRanks[iGroupID][iRank], GetPlayerNameEx(iInviter), arrGroupData[iGroupID][g_szGroupName]);
					SendClientMessageEx(playerid, COLOR_LIGHTBLUE, szMessage);

					format(szMessage, sizeof szMessage, "%s chap nhan loi moi to chuc cua ban.", GetPlayerNameEx(playerid));
					SendClientMessageEx(iInviter, COLOR_LIGHTBLUE, szMessage);

					format(szMessage, sizeof szMessage, "%s (%d) chap nhan %s %s's (%d) loi moi tham gia %s (%d).", GetPlayerNameEx(playerid), GetPlayerSQLId(playerid), arrGroupRanks[iGroupID][iRank], GetPlayerNameEx(iInviter), GetPlayerSQLId(iInviter), arrGroupData[iGroupID][g_szGroupName], iGroupID + 1);
					GroupLog(iGroupID, szMessage);

					DeletePVar(playerid, "Group_Invite");
					DeletePVar(iInviter, "Group_Invited");
                }
				else SendClientMessageEx(playerid, COLOR_GREY, "Nguoi moi ban da ngat ket noi.");
            }
            else SendClientMessageEx(playerid, COLOR_GREY, "Khong ai moi ban vao to chuc.");
        }
        else if(strcmp(params, "witness", true) == 0) {
            if(MarryWitnessOffer[playerid] != INVALID_PLAYER_ID) {
                if(IsPlayerConnected(MarryWitnessOffer[playerid])) {
                    if(ProxDetectorS(10.0, playerid, MarryWitnessOffer[playerid])) {
                        GetPlayerName(MarryWitnessOffer[playerid], giveplayer, sizeof(giveplayer));
                        GetPlayerName(playerid, sendername, sizeof(sendername));
                        format(szMessage, sizeof(szMessage), "* Ban da chap nhan %s's yeu cau lam nhan chung hon nhan cua ho.", giveplayer);
                        SendClientMessageEx(playerid, COLOR_LIGHTBLUE, szMessage);
                        format(szMessage, sizeof(szMessage), "* %s da chap nhan yeu cau lam nhan chung hon nhan cua ban.", sendername);
                        SendClientMessageEx(MarryWitnessOffer[playerid], COLOR_LIGHTBLUE, szMessage);
                        MarryWitness[MarryWitnessOffer[playerid]] = playerid;
                        MarryWitnessOffer[playerid] = INVALID_PLAYER_ID;
                        return 1;
                    }
                    else {
                        SendClientMessageEx(playerid, COLOR_GREY, "   The person that requested you to be their marriage witness is not near you!");
                        return 1;
                    }
                }
            }
            else {
                SendClientMessageEx(playerid, COLOR_GREY, "   No-one asked you to be their marriage witness!");
                return 1;
            }
        }
        else if(strcmp(params, "marriage", true) == 0) {
            if(ProposeOffer[playerid] != INVALID_PLAYER_ID) {
                if(IsPlayerConnected(ProposeOffer[playerid])) {
                    if(ProxDetectorS(10.0, playerid, ProposeOffer[playerid])) {
                        if(MarryWitness[ProposeOffer[playerid]] == INVALID_PLAYER_ID) {
                            SendClientMessageEx(playerid, COLOR_GREY, "   Nguoi cau hon khong co nhan chung hon nhan!");
                            return 1;
                        }
                        if(IsPlayerConnected(MarryWitness[ProposeOffer[playerid]])) {
                            if(ProxDetectorS(12.0, ProposeOffer[playerid], MarryWitness[ProposeOffer[playerid]])) {
                                if(IsPlayerInRangeOfPoint(playerid, 10.0, 1963.9612, -369.1851, 1093.7289)) {
                                    GetPlayerName(ProposeOffer[playerid], giveplayer, sizeof(giveplayer));
                                    GetPlayerName(playerid, sendername, sizeof(sendername));
                                    format(szMessage, sizeof(szMessage), "* Ban da chap nhan %s's yeu cau lam chong cua ban.", giveplayer);
                                    SendClientMessageEx(playerid, COLOR_LIGHTBLUE, szMessage);
                                    format(szMessage, sizeof(szMessage), "* %s da chap nhan yeu cau lam vo cua ban.", sendername);
                                    SendClientMessageEx(ProposeOffer[playerid], COLOR_LIGHTBLUE, szMessage);
                                    format(szMessage, sizeof(szMessage), "Cha su: %s, ban co lay %s lam chong dang yeu cua ban? (Go 'yes', nhu bat ky dieu gi khac se tu choi cuoc hon nhan.)", sendername, giveplayer);
                                    SendClientMessageEx(playerid, COLOR_WHITE, szMessage);
                                    MarriageCeremoney[playerid] = 1;
									if(GetPVarInt(ProposeOffer[playerid], "marriagelastname") == 1)
									{
										ShowPlayerDialogEx(playerid, DIALOG_MARRIAGE, DIALOG_STYLE_MSGBOX, "Ho ket hon",
										"Ban co quyet dinh thay doi ho hay giu ho cua ban hay khong, ho cua minh hoac quyet dinh ho cua vo/chong cua ban.\n\
										vui long su dung cac nut ben duoi de dua ra quyet dinh cua ban.", "Giu", "Dung ho nguoi do");
									}
									if(GetPVarInt(ProposeOffer[playerid], "marriagelastname") == 2)
									{
										SendClientMessageEx(playerid, -1, "Nguoi ket hon quyet dinh su dung ho cua ban.");
									}
                                    ProposedTo[ProposeOffer[playerid]] = playerid;
                                    GotProposedBy[playerid] = ProposeOffer[playerid];
                                    MarryWitness[ProposeOffer[playerid]] = INVALID_PLAYER_ID;
                                    ProposeOffer[playerid] = INVALID_PLAYER_ID;
                                    return 1;
                                }
                                else {
                                    SendClientMessageEx(playerid, COLOR_GREY, "   You are not at the church!");
                                    return 1;
                                }
                            }
                            else {
                                SendClientMessageEx(playerid, COLOR_GREY, "   The marriage witness is not near your proposer!");
                                return 1;
                            }
                        }
                        return 1;
                    }
                    else {
                        SendClientMessageEx(playerid, COLOR_GREY, "   The person that proposed to you is not near you!");
                        return 1;
                    }
                }
            }
            else {
                SendClientMessageEx(playerid, COLOR_GREY, "   Nobody proposed to you!");
                return 1;
            }
        }
        else if(strcmp(params, "vephat", true) == 0) {
            if(TicketOffer[playerid] != INVALID_PLAYER_ID) {
                if(IsPlayerConnected(TicketOffer[playerid])) {
                    if (ProxDetectorS(5.0, playerid, TicketOffer[playerid])) {
                        if(GetPlayerCash(playerid) >= TicketMoney[playerid]) {
                            //new ip[32], ipex[32];
                            //GetPlayerIp(playerid, ip, sizeof(ip));
                            //GetPlayerIp(TicketOffer[playerid], ipex, sizeof(ipex));
                            //format(szMessage, sizeof(szMessage), "[FACTION TICKET] %s (IP: %s) has paid $%d to %s (IP: %s)", GetPlayerNameEx(playerid), ip, TicketMoney[playerid], GetPlayerNameEx(TicketOffer[playerid]), ipex);
                            // Log("logs/pay.log", szMessage);
                            format(szMessage, sizeof(szMessage), "* Ban da tra ve $%d den %s.", TicketMoney[playerid], GetPlayerNameEx(TicketOffer[playerid]));
                            SendClientMessageEx(playerid, COLOR_LIGHTBLUE, szMessage);
                            format(szMessage, sizeof(szMessage), "* %s da tra ve cua ban $%d.", GetPlayerNameEx(playerid), TicketMoney[playerid]);
                            SendClientMessageEx(TicketOffer[playerid], COLOR_LIGHTBLUE, szMessage);
                            format(szMessage, sizeof(szMessage), "* %s da tra ve.", GetPlayerNameEx(playerid));
                            ProxDetector(30.0, playerid, szMessage, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
                            GivePlayerCash(playerid, - TicketMoney[playerid]);
                            new money = floatround(TicketMoney[playerid] / 3), iGroupID = PlayerInfo[TicketOffer[playerid]][pMember];
                            Tax += money;
                            arrGroupData[iGroupID][g_iBudget] += money;
                            GetPVarString(playerid, "ticketreason", szMiscArray, sizeof(szMiscArray));
                            new str[128];
			                format(str, sizeof(str), "%s da thanh toan %s's ticket of $%d [Reason: %s] and $%d has been sent to %s's budget fund.", GetPlayerNameEx(playerid), GetPlayerNameEx(TicketOffer[playerid]), TicketMoney[playerid], szMiscArray, money, arrGroupData[iGroupID][g_szGroupName]);
							GroupPayLog(iGroupID, str);
                            TicketOffer[playerid] = INVALID_PLAYER_ID;
                            TicketMoney[playerid] = 0;
                            DeletePVar(playerid, "ticketreason");
                            if(GetPlayerCash(playerid) < 1) GivePlayerCash(playerid, 0);
                            return 1;
                        }
                    }
                    else {
                        SendClientMessageEx(playerid, COLOR_GREY, "   The officer is not near you!");
                        return 1;
                    }
                }
            }
            else {
                SendClientMessageEx(playerid, COLOR_GREY, "   No-one offered you a ticket!");
                return 1;
            }
        }
		else if(strcmp(params, "boxing", true) == 0) {
            if(BoxOffer[playerid] != INVALID_PLAYER_ID) {
                if(IsPlayerConnected(BoxOffer[playerid])) {
                    new points;
                    new mypoints;
                    GetPlayerName(BoxOffer[playerid], giveplayer, sizeof(giveplayer));
                    GetPlayerName(playerid, sendername, sizeof(sendername));
                    new level = PlayerInfo[BoxOffer[playerid]][pBoxSkill];
                    if(level >= 0 && level <= 50) { points = 40; }
                    else if(level >= 51 && level <= 100) { points = 50; }
                    else if(level >= 101 && level <= 200) { points = 60; }
                    else if(level >= 201 && level <= 400) { points = 70; }
                    else if(level >= 401) { points = 80; }
                    if(PlayerInfo[playerid][pJob] == 12 || PlayerInfo[playerid][pJob2] == 12 || PlayerInfo[playerid][pJob3] == 12) {
                        new clevel = PlayerInfo[playerid][pBoxSkill];
                        if(clevel >= 0 && clevel <= 50) { mypoints = 40; }
                        else if(clevel >= 51 && clevel <= 100) { mypoints = 50; }
                        else if(clevel >= 101 && clevel <= 200) { mypoints = 60; }
                        else if(clevel >= 201 && clevel <= 400) { mypoints = 70; }
                        else if(clevel >= 401) { mypoints = 80; }
                    }
                    else {
                        mypoints = 30;
                    }
                    format(szMessage, sizeof(szMessage), "* Ban da chap nhan thu thach Boxing tu %s, va se chien dau voi %d Mau.",giveplayer,mypoints);
                    SendClientMessageEx(playerid, COLOR_LIGHTBLUE, szMessage);
                    format(szMessage, sizeof(szMessage), "* %s da chap nhan yeu cau thu thach Boxing cua ban, ban se chien dau voi %d Mau.",sendername,points);
                    SendClientMessageEx(BoxOffer[playerid], COLOR_LIGHTBLUE, szMessage);
                    if(IsPlayerInRangeOfPoint(playerid,20.0,758.98, -60.32, 1000.78) || IsPlayerInRangeOfPoint(BoxOffer[playerid],20.0,758.98, -60.32, 1000.78)) {
                        ResetPlayerWeapons(playerid);
                        ResetPlayerWeapons(BoxOffer[playerid]);
                        SetHealth(playerid, mypoints);
                        SetHealth(BoxOffer[playerid], points);
                        SetPlayerInterior(playerid, 7); SetPlayerInterior(BoxOffer[playerid], 7);
                        SetPlayerPos(playerid, 768.94, -70.87, 1001.56); SetPlayerFacingAngle(playerid, 131.8632);
                        SetPlayerPos(BoxOffer[playerid], 764.35, -66.48, 1001.56); SetPlayerFacingAngle(BoxOffer[playerid], 313.1165);
                        TogglePlayerControllable(playerid, 0); TogglePlayerControllable(BoxOffer[playerid], 0);
                        GameTextForPlayer(playerid, "~r~Dang cho doi", 3000, 1); GameTextForPlayer(BoxOffer[playerid], "~r~Dang cho doi", 3000, 1);
                        new name[MAX_PLAYER_NAME];
                        new dszMessage[MAX_PLAYER_NAME];
                        new wszMessage[MAX_PLAYER_NAME];
                        GetPlayerName(playerid, name, sizeof(name));
                        format(dszMessage, sizeof(dszMessage), "%s", name);
                        strmid(wszMessage, dszMessage, 0, strlen(dszMessage), 255);
                        if(strcmp(Titel[TitelName] ,wszMessage, true ) == 0 ) {
                            format(szMessage, sizeof(szMessage), "Tin tuc Boxing: Boxing Champion %s se chien dau VS %s, trong 60 giay (Grove Street Gym).",  sendername, giveplayer);
                            ProxDetector(30.0, playerid, szMessage, COLOR_WHITE,COLOR_WHITE,COLOR_WHITE,COLOR_WHITE,COLOR_WHITE);
                            TBoxer = playerid;
                            BoxDelay = 60;
                        }
                        GetPlayerName(BoxOffer[playerid], name, sizeof(name));
                        format(dszMessage, sizeof(dszMessage), "%s", name);
                        strmid(wszMessage, dszMessage, 0, strlen(dszMessage), 255);
                        if(strcmp(Titel[TitelName] ,wszMessage, true ) == 0 ) {
                            format(szMessage, sizeof(szMessage), "Tin tuc Boxing: Boxing Champion %s se chien dau VS %s, trong 60 giay (Grove Street Gym).",  giveplayer, sendername);
                            ProxDetector(30.0, playerid, szMessage, COLOR_WHITE,COLOR_WHITE,COLOR_WHITE,COLOR_WHITE,COLOR_WHITE);
                            TBoxer = BoxOffer[playerid];
                            BoxDelay = 60;
                        }
                        BoxWaitTime[playerid] = 1; BoxWaitTime[BoxOffer[playerid]] = 1;
                        if(BoxDelay < 1) { BoxDelay = 20; }
                        InRing = 1;
                        Boxer1 = BoxOffer[playerid];
                        Boxer2 = playerid;
                        PlayerBoxing[playerid] = 1;
                        PlayerBoxing[BoxOffer[playerid]] = 1;
                        BoxOffer[playerid] = INVALID_PLAYER_ID;
                        return 1;
                    }
                    ResetPlayerWeapons(playerid);
                    ResetPlayerWeapons(BoxOffer[playerid]);
                    SetHealth(playerid, mypoints);
                    SetHealth(BoxOffer[playerid], points);
                    SetPlayerInterior(playerid, 5); SetPlayerInterior(BoxOffer[playerid], 5);
                    SetPlayerPos(playerid, 762.9852,2.4439,1001.5942); SetPlayerFacingAngle(playerid, 131.8632);
                    SetPlayerPos(BoxOffer[playerid], 758.7064,-1.8038,1001.5942); SetPlayerFacingAngle(BoxOffer[playerid], 313.1165);
                    TogglePlayerControllable(playerid, 0); TogglePlayerControllable(BoxOffer[playerid], 0);
                    GameTextForPlayer(playerid, "~r~Dang cho doi", 3000, 1); GameTextForPlayer(BoxOffer[playerid], "~r~Dang cho doi", 3000, 1);
                    new name[MAX_PLAYER_NAME];
                    new dszMessage[MAX_PLAYER_NAME];
                    new wszMessage[MAX_PLAYER_NAME];
                    GetPlayerName(playerid, name, sizeof(name));
                    format(dszMessage, sizeof(dszMessage), "%s", name);
                    strmid(wszMessage, dszMessage, 0, strlen(dszMessage), 255);
                    if(strcmp(Titel[TitelName] ,wszMessage, true ) == 0 ) {
                        format(szMessage, sizeof(szMessage), "Tin tuc Boxing: Boxing Champion %s se chien dau VS %s, trong 60 giay (Grove Street Gym).",  sendername, giveplayer);
                        ProxDetector(30.0, playerid, szMessage, COLOR_WHITE,COLOR_WHITE,COLOR_WHITE,COLOR_WHITE,COLOR_WHITE);
                        TBoxer = playerid;
                        BoxDelay = 60;
                    }
                    GetPlayerName(BoxOffer[playerid], name, sizeof(name));
                    format(dszMessage, sizeof(dszMessage), "%s", name);
                    strmid(wszMessage, dszMessage, 0, strlen(dszMessage), 255);
                    if(strcmp(Titel[TitelName] ,wszMessage, true ) == 0 ) {
                        format(szMessage, sizeof(szMessage), "Tin tuc Boxing: Boxing Champion %s se chien dau VS %s, trong 60 giay (Grove Street Gym).",  giveplayer, sendername);
                        ProxDetector(30.0, playerid, szMessage, COLOR_WHITE,COLOR_WHITE,COLOR_WHITE,COLOR_WHITE,COLOR_WHITE);
                        TBoxer = BoxOffer[playerid];
                        BoxDelay = 60;
                    }
                    BoxWaitTime[playerid] = 1; BoxWaitTime[BoxOffer[playerid]] = 1;
                    if(BoxDelay < 1) { BoxDelay = 20; }
                    InRing = 1;
                    Boxer1 = BoxOffer[playerid];
                    Boxer2 = playerid;
                    PlayerBoxing[playerid] = 1;
                    PlayerBoxing[BoxOffer[playerid]] = 1;
                    BoxOffer[playerid] = INVALID_PLAYER_ID;
                    return 1;
                }
                return 1;
            }
            else {
                SendClientMessageEx(playerid, COLOR_GREY, "   No-one offered you a Boxing Challenge!");
                return 1;
            }
        }
                                                  // accept taxi
   /*     else if(strcmp(params,"taxi",true) == 0) {
            if(TransportDuty[playerid] != 1) {
                SendClientMessageEx(playerid, COLOR_GREY, "   You are not a Taxi Driver!");
                return 1;
            }
            if(TaxiCallTime[playerid] > 0) {
                SendClientMessageEx(playerid, COLOR_GREY, "   You have already accepted a taxi call!");
                return 1;
            }
            if(TaxiCall != INVALID_PLAYER_ID) {
                if(IsPlayerConnected(TaxiCall)) {
                	if(taxitime[TaxiCall] == 1 && PlayerInfo[playerid][pMember] != 10 && PlayerInfo[playerid][pLeader] != 10)
					{
					    return SendClientMessageEx(playerid, COLOR_GREY, "You must wait 20 seconds before accepting this call! To recieve priority, join the Taxi Company!");
					}
                    GetPlayerName(playerid, sendername, sizeof(sendername));
                    GetPlayerName(TaxiCall, giveplayer, sizeof(giveplayer));
                    format(szMessage, sizeof(szMessage), "* You have accepted the taxi call from %s, you will see the marker until you have reached it.",giveplayer);
                    SendClientMessageEx(playerid, COLOR_LIGHTBLUE, szMessage);
                    new zone[MAX_ZONE_NAME];
					GetPlayer3DZone(TaxiCall, zone, sizeof(zone));
					format(szMessage, sizeof(szMessage), "* %s can be found at %s.", GetPlayerNameEx(TaxiCall), zone);
					SendClientMessageEx(playerid, COLOR_LIGHTBLUE, szMessage);
                    format(szMessage, sizeof(szMessage), "* Taxi Driver %s has accepted your Taxi Call; please wait at your current position.",sendername);
                    SendClientMessageEx(TaxiCall, COLOR_LIGHTBLUE, szMessage);
                    GameTextForPlayer(playerid, "~w~Taxi Caller~n~~r~Go to the red marker.", 5000, 1);
                    TaxiCallTime[playerid] = 1;
                    TaxiAccepted[playerid] = TaxiCall;
                    TaxiCall = INVALID_PLAYER_ID;
                    return 1;
                }
            }
            else {
                SendClientMessageEx(playerid, COLOR_GREY, "   Nobody called for a taxi yet!");
                return 1;
            }
        }
        else if(strcmp(params, "bus", true) == 0) {
            if(TransportDuty[playerid] != 2) {
                SendClientMessageEx(playerid, COLOR_GREY, "   You are not a bus driver!");
                return 1;
            }
            if(BusCallTime[playerid] > 0) {
                SendClientMessageEx(playerid, COLOR_GREY, "   You have already accepted a bus call!");
                return 1;
            }
            if(BusCall != INVALID_PLAYER_ID) {
                if(IsPlayerConnected(BusCall)) {
                    if(CheckPointCheck(playerid)) {
                        SendClientMessageEx(playerid, COLOR_WHITE, "Vui long dam bao rang diem kiem tra hien tai cua ban bi huy truoc tien (ban co goi vat lieu hoac co diem kiem tra hien co khac).");
                        return 1;
                    }
                    GetPlayerName(playerid, sendername, sizeof(sendername));
                    GetPlayerName(BusCall, giveplayer, sizeof(giveplayer));
                    format(szMessage, sizeof(szMessage), "* You have accepted the Bus Call from %s, you will see the marker untill you have reached it.",giveplayer);
                    SendClientMessageEx(playerid, COLOR_LIGHTBLUE, szMessage);
                    new zone[MAX_ZONE_NAME];
					GetPlayer3DZone(BusCall, zone, sizeof(zone));
					format(szMessage, sizeof(szMessage), "* %s can be found at %s.", GetPlayerNameEx(BusCall), zone);
					SendClientMessageEx(playerid, COLOR_LIGHTBLUE, szMessage);
                    format(szMessage, sizeof(szMessage), "* Bus Driver %s has accepted your bus call; please wait at your current position.",sendername);
                    SendClientMessageEx(BusCall, COLOR_LIGHTBLUE, szMessage);
                    new Float:X,Float:Y,Float:Z;
                    GetPlayerPos(BusCall, X, Y, Z);
                    SetPlayerCheckpoint(playerid, X, Y, Z, 5);
                    GameTextForPlayer(playerid, "~w~Bus Caller~n~~r~Goto redmarker", 5000, 1);
                    BusCallTime[playerid] = 1;
                    BusAccepted[playerid] = BusCall;
                    BusCall = INVALID_PLAYER_ID;
                    return 1;
                }
            }
            else {
                SendClientMessageEx(playerid, COLOR_GREY, "   No-one called for a Bus yet!");
                return 1;
            }
        }*/
        else if(strcmp(params, "medic", true) == 0) {
            if(IsAMedic(playerid)) {
                if(MedicCallTime[playerid] > 0) {
                    SendClientMessageEx(playerid, COLOR_GREY, "   Ban da chap nhan cuoc goi cap cuu!");
                    return 1;
                }
                if(CheckPointCheck(playerid)) {
                    SendClientMessageEx(playerid, COLOR_WHITE, "Vui long dam bao rang diem kiem tra hien tai cua ban bi huy truoc tien (ban co goi vat lieu hoac co diem kiem tra hien co khac).");
                    return 1;
                }
                if(MedicCall != INVALID_PLAYER_ID) {
                    if(IsPlayerConnected(MedicCall)) {
                        GetPlayerName(playerid, sendername, sizeof(sendername));
                        GetPlayerName(MedicCall, giveplayer, sizeof(giveplayer));
                        format(szMessage, sizeof(szMessage), "* Ban da chap nhan cuoc goi cap cuu tu %s.",giveplayer);
                        SendClientMessageEx(playerid, COLOR_LIGHTBLUE, szMessage);
                        // SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "* After the 45 Seconds the red marker will dissapear.");
                        format(szMessage, sizeof(szMessage), "* Bac si %s da chap nhan cuoc goi cap cuu cua ban, vui long doi o vi tri hien tai cua ban.",sendername);
                        SendClientMessageEx(MedicCall, COLOR_LIGHTBLUE, szMessage);
                        new Float:X,Float:Y,Float:Z;
                        GetPlayerPos(MedicCall, X, Y, Z);
                        SetPlayerCheckpoint(playerid, X, Y, Z, 5);
                        new zone[MAX_ZONE_NAME];
                        GetPlayer3DZone(MedicCall, zone, sizeof(zone));
                        format(szMessage, sizeof(szMessage), "HINT: %s nam o %s", GetPlayerNameEx(MedicCall), zone);
                        SendClientMessageEx(playerid, COLOR_WHITE, szMessage);
                        MedicCallTime[playerid] = 1;
                        MedicAccepted[playerid] = MedicCall;
                        MedicCall = INVALID_PLAYER_ID;
                        return 1;
                    }
                }
                else {
                    SendClientMessageEx(playerid, COLOR_GREY, "   No-one called for a Medic yet!");
                    return 1;
                }
            }
            else {
                SendClientMessageEx(playerid, COLOR_GREY, "   You are not a Medic!");
                return 1;
            }
        }
        else if(strcmp(params, "mechanic", true) == 0) {
            if(PlayerInfo[playerid][pJob] != 7 && PlayerInfo[playerid][pJob2] != 7 && PlayerInfo[playerid][pJob3] != 7) {
                SendClientMessageEx(playerid, COLOR_GREY, "   You are not a Car Mechanic!");
                return 1;
            }
            if(MechanicCallTime[playerid] > 0) {
                SendClientMessageEx(playerid, COLOR_GREY, "   Ban da chap nhan mot cuoc goi sua xe khac!");
                return 1;
            }
            if(CheckPointCheck(playerid)) {
                SendClientMessageEx(playerid, COLOR_WHITE, "Vui long dam bao rang diem kiem tra hien tai cua ban bi huy truoc tien (ban co goi vat lieu hoac co diem kiem tra hien co khac).");
                return 1;
            }
            if(MechanicCall != INVALID_PLAYER_ID) {
                if(IsPlayerConnected(MechanicCall)) {
                    if(playerid == MechanicCall) return 1;
                    GetPlayerName(playerid, sendername, sizeof(sendername));
                    GetPlayerName(MechanicCall, giveplayer, sizeof(giveplayer));
                    format(szMessage, sizeof(szMessage), "* Ban da chap nhan cuoc goi sua xe tu %s, ban co 30 giay de den do.",giveplayer);
                    SendClientMessageEx(playerid, COLOR_LIGHTBLUE, szMessage);
                    SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "* Sau 30 giay, diem danh dau mau do se bien mat.");
                    format(szMessage, sizeof(szMessage), "* Tho sua xe %s da chap nhan cuoc goi sua xe, vui long doi o vi tri hien tai cua ban.",sendername);
                    SendClientMessageEx(MechanicCall, COLOR_LIGHTBLUE, szMessage);
                    new Float:X,Float:Y,Float:Z;
                    GetPlayerPos(MechanicCall, X, Y, Z);
                    SetPlayerCheckpoint(playerid, X, Y, Z, 5);
                    GameTextForPlayer(playerid, "~w~Cuoc goi sua xe~n~~r~Di den diem danh dau mau d", 5000, 1);
                    MechanicCallTime[playerid] = 1;
                    MechanicCall = INVALID_PLAYER_ID;
                    return 1;
                }
            }
            else {
                SendClientMessageEx(playerid, COLOR_GREY, "   No-one called for a Car Mechanic yet!");
                return 1;
            }
        }
        else if(strcmp(params, "live", true) == 0) {
            if(LiveOffer[playerid] != INVALID_PLAYER_ID) {
                if(IsPlayerConnected(LiveOffer[playerid])) {
                    if (ProxDetectorS(5.0, playerid, LiveOffer[playerid])) {
                        SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "* Ban bi dong bang cho den khi cuoc tro chuyen truc tiep ket thuc.");
                        SendClientMessageEx(LiveOffer[playerid], COLOR_LIGHTBLUE, "* Ban bi dong bang cho den khi cuoc tro chuyen truc tiep ket thuc (dung /live again).");
                        TogglePlayerControllable(playerid, 0);
                        TogglePlayerControllable(LiveOffer[playerid], 0);
						SetPVarInt(playerid, "IsLive", 1);
						SetPVarInt(LiveOffer[playerid], "IsLive", 1);
                        TalkingLive[playerid] = LiveOffer[playerid];
                        TalkingLive[LiveOffer[playerid]] = playerid;
                        LiveOffer[playerid] = INVALID_PLAYER_ID;
                        return 1;
                    }
                    else {
                        SendClientMessageEx(playerid, COLOR_GREY, "   You are to far away from the News Reporter!");
                        return 1;
                    }
                }
                return 1;
            }
            else {
                SendClientMessageEx(playerid, COLOR_GREY, "   No-one gave you a Live Conversation offer!");
                return 1;
            }
        }
        else if(strcmp(params, "lawyer", true) == 0) {
            if(sscanf(params, "u", giveplayerid))
            {
                SendClientMessageEx(playerid, COLOR_GREY, "USAGE: /chapnhan lawyer [player]");
                return 1;
            }
            if (IsACop(playerid)) {
                if(IsPlayerConnected(giveplayerid)) {
                    if(giveplayerid != INVALID_PLAYER_ID) {
                        if(PlayerInfo[giveplayerid][pJob] == 2 || PlayerInfo[giveplayerid][pJob2] == 2 || PlayerInfo[giveplayerid][pJob3] == 2) {
                            GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
                            GetPlayerName(playerid, sendername, sizeof(sendername));
                            format(szMessage, sizeof(szMessage), "* Ban cho phep %s giai thoat mot nguoi bi boo tu.", giveplayer);
                            SendClientMessageEx(playerid, COLOR_LIGHTBLUE,szMessage);
                            format(szMessage, sizeof(szMessage), "* De nghi %s chap thuan(cho phep) ban tha nguoi bi bo tu. (dung /free)", sendername);
                            SendClientMessageEx(giveplayerid, COLOR_LIGHTBLUE,szMessage);
                            ApprovedLawyer[giveplayerid] = 1;
                            return 1;
                        }
                    }
                }
                return 1;
            }
            else {
                SendClientMessageEx(playerid, COLOR_GREY, "Invalid action! (You are no cop / person is not a Lawyer / Bad ID)");
                return 1;
            }
        }
        else if(strcmp(params, "bodyguard", true) == 0) {
        	if(GetPVarType(playerid, "IsInArena")) return SendClientMessageEx(playerid, COLOR_WHITE, "You can't do this while being in an arena!");
            if(GuardOffer[playerid] != INVALID_PLAYER_ID) {
                if(GetPlayerCash(playerid) > GuardPrice[playerid]) {
                    if(IsPlayerConnected(GuardOffer[playerid])) {
                        if(ProxDetectorS(6.0, playerid, GuardOffer[playerid])) {
                            new Float:armour;
                            GetArmour(playerid, armour);
                            if(armour >= 50) {
                                SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "* Ban da co mot bo giap!");
                                return 1;
                            }
                            new ip[32], ipex[32];
                            GetPlayerIp(playerid, ip, sizeof(ip));
                            GetPlayerIp(GuardOffer[playerid], ipex, sizeof(ipex));
                            //format(szMessage, sizeof(szMessage), "[BODYGUARD] %s (IP:%s) has paid $%d to %s (IP:%s)", GetPlayerNameEx(playerid), ip, GuardPrice[playerid], GetPlayerNameEx(GuardOffer[playerid]), ipex);
                            // Log("logs/pay.log", szMessage);

                            if(GuardPrice[playerid] >= 25000 && (PlayerInfo[GuardOffer[playerid]][pLevel] <= 3 || PlayerInfo[playerid][pLevel] <= 3)) {
                                format(szMessage, sizeof(szMessage), "%s (IP:%s) has guarded %s (IP:%s) $%d in this session.", GetPlayerNameEx(playerid), ip, GetPlayerNameEx(GuardOffer[playerid]), ipex, GuardPrice[playerid]);
                                // Log("logs/pay.log", szMessage);
                                ABroadCast(COLOR_YELLOW, szMessage, 2);
                            }

                            SetArmour(playerid, 50);
                            GetPlayerName(GuardOffer[playerid], giveplayer, sizeof(giveplayer));
                            GetPlayerName(playerid, sendername, sizeof(sendername));
                            format(szMessage, sizeof(szMessage), "* Ban da chap nhan giap gia $%d tu %s.",GuardPrice[playerid],GetPlayerNameEx(GuardOffer[playerid]));
                            SendClientMessageEx(playerid, COLOR_LIGHTBLUE, szMessage);
                            format(szMessage, sizeof(szMessage), "* %s chap nhan giap cua ban, gia $%d da duoc them vao tui tien cua ban.",GetPlayerNameEx(playerid),GuardPrice[playerid]);
                            SendClientMessageEx(GuardOffer[playerid], COLOR_LIGHTBLUE, szMessage);
                            GivePlayerCash(GuardOffer[playerid], GuardPrice[playerid]);
                            GivePlayerCash(playerid, -GuardPrice[playerid]);
                            ExtortionTurfsWarsZone(GuardOffer[playerid], 2, GuardPrice[playerid]);
                            GuardOffer[playerid] = INVALID_PLAYER_ID;
                            GuardPrice[playerid] = 0;
                            return 1;
                        }
                        else {
                            SendClientMessageEx(playerid, COLOR_GRAD2, "You are not near the person offering you guard!");
                            return 1;
                        }
                    }
                    return 1;
                }
                else {
                    SendClientMessageEx(playerid, COLOR_GREY, "   You can't afford the Protection!");
                    return 1;
                }
            }
            else {
                SendClientMessageEx(playerid, COLOR_GREY, "   No-one offered you any Protection!");
                return 1;
            }
        }
        else if(strcmp(params, "defense", true) == 0) {
            if(DefendOffer[playerid] != INVALID_PLAYER_ID) {
                if(GetPlayerCash(playerid) > DefendPrice[playerid]) {
                    if(IsPlayerConnected(DefendOffer[playerid])) {
                        /*new ip[32], ipex[32];
                        GetPlayerIp(playerid, ip, sizeof(ip));
                        GetPlayerIp(DefendOffer[playerid], ipex, sizeof(ipex));
                        format(szMessage, sizeof(szMessage), "[LAWYER] %s (IP:%s) has paid $%d to %s (IP:%s)", GetPlayerNameEx(playerid), ip, DefendPrice[playerid], GetPlayerNameEx(DefendOffer[playerid]), ipex);
                        Log("logs/pay.log", szMessage);*/
                        PlayerInfo[playerid][pWantedLevel]--;
                        SetPlayerWantedLevel(playerid, PlayerInfo[playerid][pWantedLevel]);
                        SetPlayerToTeamColor(playerid);
                        giveplayer = GetPlayerNameEx(DefendOffer[playerid]);
                        sendername = GetPlayerNameEx(playerid);
                        format(szMessage, sizeof(szMessage), "* Ban da chap nhan bao ve gia $%d tu luat su %s.",DefendPrice[playerid],giveplayer);
                        SendClientMessageEx(playerid, COLOR_LIGHTBLUE, szMessage);
                        format(szMessage, sizeof(szMessage), "* %s chap nhan bao ve, gia $%d da them vao tui tien.",sendername,DefendPrice[playerid]);
                        SendClientMessageEx(DefendOffer[playerid], COLOR_LIGHTBLUE, szMessage);
                        GivePlayerCash( DefendOffer[playerid],DefendPrice[playerid]);
                        GivePlayerCash(playerid, -DefendPrice[playerid]);
                        DefendOffer[playerid] = INVALID_PLAYER_ID;
                        DefendPrice[playerid] = 0;
                        return 1;
                    }
                    return 1;
                }
                else {
                    SendClientMessageEx(playerid, COLOR_GREY, "   You can't afford the Protection!");
                    return 1;
                }
            }
            else {
                SendClientMessageEx(playerid, COLOR_GREY, "   No-one offered you any Protection!");
                return 1;
            }
        }
        else if(strcmp(params, "appeal", true) == 0) {
            if(AppealOffer[playerid] != INVALID_PLAYER_ID) {
                if(IsPlayerConnected(AppealOffer[playerid])) {
                    AppealOfferAccepted[playerid] = 1;
                    giveplayer = GetPlayerNameEx(AppealOffer[playerid]);
                    sendername = GetPlayerNameEx(playerid);
                    format(szMessage, sizeof(szMessage), "* Ban da chap nhan khang cao tu luat su %s.",giveplayer);
                    SendClientMessageEx(playerid, COLOR_LIGHTBLUE, szMessage);
                    format(szMessage, sizeof(szMessage), "* %s da chap nhan don khang cao cua ban, mot tin nhan cho He thong Tu Phap da duoc gui, vui long doi toa an phan xu.",sendername);
                    SendClientMessageEx(AppealOffer[playerid], COLOR_LIGHTBLUE, szMessage);
                    return 1;
                }
                return 1;
            }
            else {
                SendClientMessageEx(playerid, COLOR_GREY, "   No-one offered you any Protection!");
                return 1;
            }
        }
 	    else if(strcmp(params, "rimkit", true) == 0) {
        	if (GetPVarType(playerid, "RimOffer")) {
	            if(GetPlayerCash(playerid) > GetPVarInt(playerid, "RimPrice")) {
	            	if(IsPlayerConnected(GetPVarInt(playerid, "RimOffer"))) {
	            		if (GetPVarInt(playerid, "RimSeller_SQLId") != GetPlayerSQLId(GetPVarInt(playerid, "RimOffer")))
						{
			                return SendClientMessageEx(playerid, COLOR_GREY, "The other person has disconnected.");
						}
						if(PlayerInfo[GetPVarInt(playerid, "RimOffer")][pRimMod] < GetPVarInt(playerid, "RimCount"))	{
							SendClientMessageEx(playerid,COLOR_GREY, "That person does not have that number of rim kits anymore!");
							return 1;
						}
	                    GivePlayerCash(playerid, -GetPVarInt(playerid, "RimPrice"));
	                    GivePlayerCash(GetPVarInt(playerid, "RimOffer"), GetPVarInt(playerid, "RimPrice"));
						GetPlayerName(GetPVarInt(playerid, "RimOffer"), giveplayer, sizeof(giveplayer));
	                    format(szMessage, sizeof(szMessage), "* Ban da mua %d rim kits gia $%d tu %s.",GetPVarInt(playerid, "RimCount"),GetPVarInt(playerid, "RimPrice"),giveplayer);
	                    SendClientMessageEx(playerid, COLOR_LIGHTBLUE, szMessage);
	                    GetPlayerName(playerid, sendername, sizeof(sendername));
	                    format(szMessage, sizeof(szMessage), "* %s da mua %d rim kits cua ban, $%d da duoc them vao tui tien.",sendername,GetPVarInt(playerid, "RimCount"),GetPVarInt(playerid, "RimPrice"));
	                    SendClientMessageEx(GetPVarInt(playerid, "RimOffer"), COLOR_LIGHTBLUE, szMessage);
	                    PlayerInfo[GetPVarInt(playerid, "RimOffer")][pRimMod] -= GetPVarInt(playerid, "RimCount");
	                    PlayerInfo[playerid][pRimMod] += GetPVarInt(playerid, "RimCount");

                        format(szMessage, sizeof(szMessage), "%s(%d) (IP:%s) da mua (%d) rim kits gia $%s tu %s(%d) (IP:%s)", GetPlayerNameEx(playerid), GetPlayerSQLId(playerid), GetPlayerIpEx(playerid), GetPVarInt(playerid, "RimCount"), number_format(GetPVarInt(playerid, "RimPrice")),  GetPlayerNameEx(GetPVarInt(playerid, "RimOffer")), GetPlayerSQLId(GetPVarInt(playerid, "RimOffer")), GetPlayerIpEx(GetPVarInt(playerid, "RimOffer")));
						Log("logs/pay.log", szMessage);

						OnPlayerStatsUpdate(playerid);
						OnPlayerStatsUpdate(GetPVarInt(playerid, "RimOffer"));

	                    DeletePVar(playerid, "RimOffer");
	                    DeletePVar(playerid, "RimPrice");
	                    DeletePVar(playerid, "RimCount");
                    	DeletePVar(playerid, "RimSeller_SQLId");
	                    return 1;
	  				}
	     		}
	      		else
				{
	            	SendClientMessageEx(playerid, COLOR_GREY, "You can't afford that many rim kits!");
	                return 1;
	        	}
       		}
			else
			{
        		SendClientMessageEx(playerid, COLOR_GREY, "No-one offered you any rim kits!");
			}
 	    }
		else if(strcmp(params, "voucher", true) == 0)
		{
			if(!GetPVarType(playerid, "buyingVoucher")) return SendClientMessageEx(playerid, COLOR_GRAD2, "No-one has offered you any vouchers.");

			new sellerid = GetPVarInt(playerid, "sellerVoucher"),
				price = GetPVarInt(playerid, "priceVoucher"),
				amount = GetPVarInt(playerid, "amountVoucher");

			DeletePVar(playerid, "sellVoucher");
			DeletePVar(playerid, "priceVoucher");
			DeletePVar(playerid, "amountVoucher");
			if(GetPlayerCash(playerid) > price)
			{
				if(IsPlayerConnected(sellerid))
				{
					if(GetPVarInt(playerid, "SQLID_Voucher") != GetPlayerSQLId(sellerid)) return SendClientMessageEx(playerid, COLOR_GRAD1, "The seller has disconnected.");
					if(GetPVarInt(playerid, "buyingVoucher") == 1) // Car Voucher
					{
						if(PlayerInfo[sellerid][pVehVoucher] < amount) return SendClientMessageEx(playerid, COLOR_GRAD1, "The seller does not have that many anymore.");

						GivePlayerCash(playerid, -price);
						GivePlayerCash(sellerid, price);
						format(szMessage, sizeof(szMessage), "* Ban da mua %d Car Voucher(s) gia $%s tu %s.", amount, number_format(price), GetPlayerNameEx(sellerid));
						SendClientMessageEx(playerid, COLOR_LIGHTBLUE, szMessage);
						format(szMessage, sizeof(szMessage), "* %s da mua %d Car Voucher(s) tu ban, $%s da them vao tui tien.", GetPlayerNameEx(playerid), amount, number_format(price));
						SendClientMessageEx(sellerid, COLOR_LIGHTBLUE, szMessage);
						format(szMessage, sizeof(szMessage), "%s(%d) (IP:%s) da mua (%d) Car Voucher(s) gia $%s tu %s(%d) (IP:%s)", GetPlayerNameEx(playerid), GetPlayerSQLId(playerid), GetPlayerIpEx(playerid), amount, number_format(price),  GetPlayerNameEx(sellerid), GetPlayerSQLId(sellerid), GetPlayerIpEx(sellerid));
						Log("logs/pay.log", szMessage);
						PlayerInfo[playerid][pVehVoucher] += amount;
						PlayerInfo[sellerid][pVehVoucher] -= amount;

						OnPlayerStatsUpdate(playerid);
						OnPlayerStatsUpdate(sellerid);

						DeletePVar(playerid, "buyingVoucher");
						return 1;
					}
					if(GetPVarInt(playerid, "buyingVoucher") == 2) // Silver VIP Voucher
					{
						if(PlayerInfo[sellerid][pSVIPVoucher] < amount) return SendClientMessageEx(playerid, COLOR_GRAD1, "The seller does not have that many anymore.");

						GivePlayerCash(playerid, -price);
						GivePlayerCash(sellerid, price);
						format(szMessage, sizeof(szMessage), "* Ban da mua %d Silver VIP Voucher(s) gia $%s tu %s.", amount, number_format(price), GetPlayerNameEx(sellerid));
						SendClientMessageEx(playerid, COLOR_LIGHTBLUE, szMessage);
						format(szMessage, sizeof(szMessage), "* %s da mua %d Silver VIP Voucher(s) tu ban, $%s da them vao tui tien.", GetPlayerNameEx(playerid), amount, number_format(price));
						SendClientMessageEx(sellerid, COLOR_LIGHTBLUE, szMessage);
						format(szMessage, sizeof(szMessage), "%s(%d) (IP:%s) da mua (%d) Silver VIP Voucher(s) gia $%s tu %s(%d) (IP:%s)", GetPlayerNameEx(playerid), GetPlayerSQLId(playerid), GetPlayerIpEx(playerid), amount, number_format(price),  GetPlayerNameEx(sellerid), GetPlayerSQLId(sellerid), GetPlayerIpEx(sellerid));
						Log("logs/pay.log", szMessage);
						PlayerInfo[playerid][pSVIPVoucher] += amount;
						PlayerInfo[sellerid][pSVIPVoucher] -= amount;

						OnPlayerStatsUpdate(playerid);
						OnPlayerStatsUpdate(sellerid);

						DeletePVar(playerid, "buyingVoucher");
						return 1;
					}
					if(GetPVarInt(playerid, "buyingVoucher") == 3) // Gold VIP Voucher
					{
						if(PlayerInfo[sellerid][pGVIPVoucher] < amount) return SendClientMessageEx(playerid, COLOR_GRAD1, "The seller does not have that many anymore.");

						GivePlayerCash(playerid, -price);
						GivePlayerCash(sellerid, price);
						format(szMessage, sizeof(szMessage), "* Ban da mua %d Gold VIP Voucher(s) gia $%s tu %s.", amount, number_format(price), GetPlayerNameEx(sellerid));
						SendClientMessageEx(playerid, COLOR_LIGHTBLUE, szMessage);
						format(szMessage, sizeof(szMessage), "* %s da mua %d Gold VIP Voucher(s) tu ban, $%s da them vao tui tien.", GetPlayerNameEx(playerid), amount, number_format(price));
						SendClientMessageEx(sellerid, COLOR_LIGHTBLUE, szMessage);
						format(szMessage, sizeof(szMessage), "%s(%d) (IP:%s) da mua (%d) Gold VIP Voucher(s) gia $%s tu %s(%d) (IP:%s)", GetPlayerNameEx(playerid), GetPlayerSQLId(playerid), GetPlayerIpEx(playerid), amount, number_format(price),  GetPlayerNameEx(sellerid), GetPlayerSQLId(sellerid), GetPlayerIpEx(sellerid));
						Log("logs/pay.log", szMessage);
						PlayerInfo[playerid][pGVIPVoucher] += amount;
						PlayerInfo[sellerid][pGVIPVoucher] -= amount;

						OnPlayerStatsUpdate(playerid);
						OnPlayerStatsUpdate(sellerid);

						DeletePVar(playerid, "buyingVoucher");
						return 1;
					}
					if(GetPVarInt(playerid, "buyingVoucher") == 4) // 1 month PVIP Voucher
					{
						if(PlayerInfo[sellerid][pPVIPVoucher] < amount) return SendClientMessageEx(playerid, COLOR_GRAD1, "The seller does not have that many anymore.");

						GivePlayerCash(playerid, -price);
						GivePlayerCash(sellerid, price);
						format(szMessage, sizeof(szMessage), "* Ban da mua %d 1 month PVIP Voucher(s) gia $%s tu %s.", amount, number_format(price), GetPlayerNameEx(sellerid));
						SendClientMessageEx(playerid, COLOR_LIGHTBLUE, szMessage);
						format(szMessage, sizeof(szMessage), "* %s da mua %d 1 month PVIP Voucher(s) tu ban, $%s da them vao tui tien.", GetPlayerNameEx(playerid), amount, number_format(price));
						SendClientMessageEx(sellerid, COLOR_LIGHTBLUE, szMessage);
						format(szMessage, sizeof(szMessage), "%s(%d) (IP:%s) da mua (%d) 1 month PVIP Voucher(s) gia $%s tu %s(%d) (IP:%s)", GetPlayerNameEx(playerid), GetPlayerSQLId(playerid), GetPlayerIpEx(playerid), amount, number_format(price),  GetPlayerNameEx(sellerid), GetPlayerSQLId(sellerid), GetPlayerIpEx(sellerid));
						Log("logs/pay.log", szMessage);
						PlayerInfo[playerid][pPVIPVoucher] += amount;
						PlayerInfo[sellerid][pPVIPVoucher] -= amount;

						OnPlayerStatsUpdate(playerid);
						OnPlayerStatsUpdate(sellerid);

						DeletePVar(playerid, "buyingVoucher");
						return 1;
					}
					if(GetPVarInt(playerid, "buyingVoucher") == 5) // Restricted Car Voucher
					{
						if(PlayerInfo[sellerid][pCarVoucher] < amount) return SendClientMessageEx(playerid, COLOR_GRAD1, "The seller does not have that many anymore.");

						GivePlayerCash(playerid, -price);
						GivePlayerCash(sellerid, price);
						format(szMessage, sizeof(szMessage), "* Ban da mua %d Restricted Car Voucher(s) gia $%s tu %s.", amount, number_format(price), GetPlayerNameEx(sellerid));
						SendClientMessageEx(playerid, COLOR_LIGHTBLUE, szMessage);
						format(szMessage, sizeof(szMessage), "* %s da mua %d Restricted Car Voucher(s) tu ban, $%s da them vao tui tien.", GetPlayerNameEx(playerid), amount, number_format(price));
						SendClientMessageEx(sellerid, COLOR_LIGHTBLUE, szMessage);
						format(szMessage, sizeof(szMessage), "%s(%d) (IP:%s) da mua (%d) Restricted Car Voucher(s) gia $%s tu %s(%d) (IP:%s)", GetPlayerNameEx(playerid), GetPlayerSQLId(playerid), GetPlayerIpEx(playerid), amount, number_format(price),  GetPlayerNameEx(sellerid), GetPlayerSQLId(sellerid), GetPlayerIpEx(sellerid));
						Log("logs/pay.log", szMessage);
						PlayerInfo[playerid][pCarVoucher] += amount;
						PlayerInfo[sellerid][pCarVoucher] -= amount;

						OnPlayerStatsUpdate(playerid);
						OnPlayerStatsUpdate(sellerid);

						DeletePVar(playerid, "buyingVoucher");
						return 1;
					}
					if(GetPVarInt(playerid, "buyingVoucher") == 6) // Priority Advertisement Voucher
					{
						if(PlayerInfo[sellerid][pAdvertVoucher] < amount) return SendClientMessageEx(playerid, COLOR_GRAD1, "The seller does not have that many anymore.");

						GivePlayerCash(playerid, -price);
						GivePlayerCash(sellerid, price);
						format(szMessage, sizeof(szMessage), "* Ban da mua %d Priority Advertisement Voucher(s) gia $%s tu %s.", amount, number_format(price), GetPlayerNameEx(sellerid));
						SendClientMessageEx(playerid, COLOR_LIGHTBLUE, szMessage);
						format(szMessage, sizeof(szMessage), "* %s da mua %d Priority Advertisement Voucher(s) tu ban, $%s da them vao tui tien.", GetPlayerNameEx(playerid), amount, number_format(price));
						SendClientMessageEx(sellerid, COLOR_LIGHTBLUE, szMessage);
						format(szMessage, sizeof(szMessage), "%s(%d) (IP:%s) da mua (%d) Priority Advertisement Voucher(s) gia $%s tu %s(%d) (IP:%s)", GetPlayerNameEx(playerid), GetPlayerSQLId(playerid), GetPlayerIpEx(playerid), amount, number_format(price),  GetPlayerNameEx(sellerid), GetPlayerSQLId(sellerid), GetPlayerIpEx(sellerid));
						Log("logs/pay.log", szMessage);
						PlayerInfo[playerid][pAdvertVoucher] += amount;
						PlayerInfo[sellerid][pAdvertVoucher] -= amount;

						OnPlayerStatsUpdate(playerid);
						OnPlayerStatsUpdate(sellerid);

						DeletePVar(playerid, "buyingVoucher");
						return 1;
					}
					if(GetPVarInt(playerid, "buyingVoucher") == 7) // 7 Days Silver VIP
					{
						if(PlayerInfo[sellerid][pSVIPExVoucher] < amount) return SendClientMessageEx(playerid, COLOR_GRAD1, "The seller does not have that many anymore.");

						GivePlayerCash(playerid, -price);
						GivePlayerCash(sellerid, price);
						format(szMessage, sizeof(szMessage), "* Ban da mua %d 7 Days Silver VIP Voucher(s) gia $%s tu %s.", amount, number_format(price), GetPlayerNameEx(sellerid));
						SendClientMessageEx(playerid, COLOR_LIGHTBLUE, szMessage);
						format(szMessage, sizeof(szMessage), "* %s da mua %d 7 Days Silver VIP Voucher(s) tu ban, $%s da them vao tui tien.", GetPlayerNameEx(playerid), amount, number_format(price));
						SendClientMessageEx(sellerid, COLOR_LIGHTBLUE, szMessage);
						format(szMessage, sizeof(szMessage), "%s(%d) (IP:%s) da mua (%d) 7 Day Silver VIP Voucher(s) gia $%s tu %s(%d) (IP:%s)", GetPlayerNameEx(playerid), GetPlayerSQLId(playerid), GetPlayerIpEx(playerid), amount, number_format(price),  GetPlayerNameEx(sellerid), GetPlayerSQLId(sellerid), GetPlayerIpEx(sellerid));
						Log("logs/pay.log", szMessage);
						PlayerInfo[playerid][pSVIPExVoucher] += amount;
						PlayerInfo[sellerid][pSVIPExVoucher] -= amount;

						OnPlayerStatsUpdate(playerid);
						OnPlayerStatsUpdate(sellerid);

						DeletePVar(playerid, "buyingVoucher");
						return 1;
					}
					if(GetPVarInt(playerid, "buyingVoucher") == 8) // 7 Days Gold VIP
					{
						if(PlayerInfo[sellerid][pGVIPExVoucher] < amount) return SendClientMessageEx(playerid, COLOR_GRAD1, "The seller does not have that many anymore.");

						GivePlayerCash(playerid, -price);
						GivePlayerCash(sellerid, price);
						format(szMessage, sizeof(szMessage), "* Ban da mua %d 7 Days Gold VIP Voucher(s) gia $%s tu %s.", amount, number_format(price), GetPlayerNameEx(sellerid));
						SendClientMessageEx(playerid, COLOR_LIGHTBLUE, szMessage);
						format(szMessage, sizeof(szMessage), "* %s da mua %d 7 Days Gold VIP Voucher(s) tu ban, $%s da them vao tui tien.", GetPlayerNameEx(playerid), amount, number_format(price));
						SendClientMessageEx(sellerid, COLOR_LIGHTBLUE, szMessage);
						format(szMessage, sizeof(szMessage), "%s(%d) (IP:%s) da mua (%d) 7 Days Gold VIP Voucher(s) gia $%s tu %s(%d) (IP:%s)", GetPlayerNameEx(playerid), GetPlayerSQLId(playerid), GetPlayerIpEx(playerid), amount, number_format(price),  GetPlayerNameEx(sellerid), GetPlayerSQLId(sellerid), GetPlayerIpEx(sellerid));
						Log("logs/pay.log", szMessage);
						PlayerInfo[playerid][pGVIPExVoucher] += amount;
						PlayerInfo[sellerid][pGVIPExVoucher] -= amount;

						OnPlayerStatsUpdate(playerid);
						OnPlayerStatsUpdate(sellerid);

						DeletePVar(playerid, "buyingVoucher");
						return 1;
					}
				}
				else return SendClientMessageEx(playerid, COLOR_GRAD2, "Khong ai cung cap cho ban bat ky phieu thuong nao.");
			}
			else return SendClientMessageEx(playerid, COLOR_GRAD2, "Ban khong co du tien.");
		}
        else if(strcmp(params,"craft",true) == 0) {
            if(CraftOffer[playerid] != INVALID_PLAYER_ID) {
                if(IsPlayerConnected(CraftOffer[playerid])) {
                    if (ProxDetectorS(5.0, playerid, CraftOffer[playerid])) {
                        if(PlayerInfo[playerid][pHospital] > 0) {
                            SendClientMessageEx(playerid, COLOR_GREY, "Ban khong the sinh ra vu khi trong benh vien.");
                            return 1;
                        }

                        if(PlayerInfo[CraftOffer[playerid]][pMats] < CraftMats[playerid]) {

                        	CraftOffer[playerid] = INVALID_PLAYER_ID;
                       		CraftId[playerid] = 0;
                        	CraftMats[playerid] = 0;
                        	return SendClientMessageEx(playerid, COLOR_GREY, "Ban khong du vat lieu de che tao.");
                        }

                        if(IsPlayerInAnyVehicle(playerid)) return SendClientMessageEx(playerid, COLOR_GRAD2, "Vui long thoat khoi xe, truoc khi su dung lenh nay.");
						if(CraftId[playerid] == 17)
						{
							if(PlayerInfo[playerid][pPhousekey] == INVALID_HOUSE_ID && PlayerInfo[playerid][pPhousekey2] == INVALID_HOUSE_ID && PlayerInfo[playerid][pPhousekey3] == INVALID_HOUSE_ID)
							{
								SendClientMessageEx(playerid, COLOR_GREY, "Ban khong so huu mot ngoi nha!");
								SendClientMessageEx(CraftOffer[playerid], COLOR_GREY, "Nguoi mua khong so huu ngoi nha nao!");
								return 1;
							}
							if((IsPlayerInRangeOfPoint(playerid, 50.0, HouseInfo[PlayerInfo[playerid][pPhousekey]][hInteriorX], HouseInfo[PlayerInfo[playerid][pPhousekey]][hInteriorY], HouseInfo[PlayerInfo[playerid][pPhousekey]][hInteriorZ]) && GetPlayerVirtualWorld(playerid) == HouseInfo[PlayerInfo[playerid][pPhousekey]][hIntVW] && GetPlayerInterior(playerid) == HouseInfo[PlayerInfo[playerid][pPhousekey]][hIntIW]) &&
							(IsPlayerInRangeOfPoint(CraftOffer[playerid], 50.0, HouseInfo[PlayerInfo[playerid][pPhousekey]][hInteriorX], HouseInfo[PlayerInfo[playerid][pPhousekey]][hInteriorY], HouseInfo[PlayerInfo[playerid][pPhousekey]][hInteriorZ]) && GetPlayerVirtualWorld(CraftOffer[playerid]) == HouseInfo[PlayerInfo[playerid][pPhousekey]][hIntVW] && GetPlayerInterior(CraftOffer[playerid]) == HouseInfo[PlayerInfo[playerid][pPhousekey]][hIntIW]))
							{
							}
							else if((IsPlayerInRangeOfPoint(playerid, 50.0, HouseInfo[PlayerInfo[playerid][pPhousekey2]][hInteriorX], HouseInfo[PlayerInfo[playerid][pPhousekey2]][hInteriorY], HouseInfo[PlayerInfo[playerid][pPhousekey2]][hInteriorZ]) && GetPlayerVirtualWorld(playerid) == HouseInfo[PlayerInfo[playerid][pPhousekey2]][hIntVW] && GetPlayerInterior(playerid) == HouseInfo[PlayerInfo[playerid][pPhousekey2]][hIntIW]) &&
							(IsPlayerInRangeOfPoint(CraftOffer[playerid], 50.0, HouseInfo[PlayerInfo[playerid][pPhousekey2]][hInteriorX], HouseInfo[PlayerInfo[playerid][pPhousekey2]][hInteriorY], HouseInfo[PlayerInfo[playerid][pPhousekey2]][hInteriorZ]) && GetPlayerVirtualWorld(CraftOffer[playerid]) == HouseInfo[PlayerInfo[playerid][pPhousekey2]][hIntVW] && GetPlayerInterior(CraftOffer[playerid]) == HouseInfo[PlayerInfo[playerid][pPhousekey2]][hIntIW]))
							{
							}
							else if((IsPlayerInRangeOfPoint(playerid, 50.0, HouseInfo[PlayerInfo[playerid][pPhousekey3]][hInteriorX], HouseInfo[PlayerInfo[playerid][pPhousekey3]][hInteriorY], HouseInfo[PlayerInfo[playerid][pPhousekey3]][hInteriorZ]) && GetPlayerVirtualWorld(playerid) == HouseInfo[PlayerInfo[playerid][pPhousekey3]][hIntVW] && GetPlayerInterior(playerid) == HouseInfo[PlayerInfo[playerid][pPhousekey3]][hIntIW]) &&
							(IsPlayerInRangeOfPoint(CraftOffer[playerid], 50.0, HouseInfo[PlayerInfo[playerid][pPhousekey3]][hInteriorX], HouseInfo[PlayerInfo[playerid][pPhousekey3]][hInteriorY], HouseInfo[PlayerInfo[playerid][pPhousekey3]][hInteriorZ]) && GetPlayerVirtualWorld(CraftOffer[playerid]) == HouseInfo[PlayerInfo[playerid][pPhousekey3]][hIntVW] && GetPlayerInterior(CraftOffer[playerid]) == HouseInfo[PlayerInfo[playerid][pPhousekey3]][hIntIW]))
							{
							}
							else
							{
								SendClientMessageEx(playerid, COLOR_GREY, "Tho thu cong khong o trong nha ban!");
								SendClientMessageEx(CraftOffer[playerid], COLOR_GREY, "Ban khong o trong nha cua nguoi mua!");
								return 1;
							}
						}
                        new weaponname[50];
                        format(weaponname, 50, "%s", CraftName[playerid]);
                        switch(CraftId[playerid]) {
                            case 1:
                            {
                                PlayerInfo[playerid][pScrewdriver]++;
                                SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "/sellgun");
                            }
                            case 2:
                            {
                                PlayerInfo[playerid][pSmslog]++;
                                SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "/smslog");
                            }
                            case 3:
                            {
                                PlayerInfo[playerid][pWristwatch]++;
                                SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "/wristwatch");
                            }
                            case 4:
                            {
                                PlayerInfo[playerid][pSurveillance]++;
                                SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "/(p)lace(c)amera /(s)ee(c)amera /(d)estroy(c)amera");
                            }
                            case 5:
                            {
                                PlayerInfo[playerid][pTire]++;
                                SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "/repair");
                            }
                            case 6:
                            {
                                PlayerInfo[playerid][pLock]=1;
                                SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "/lock");
                            }
                            case 7:
                            {
                                PlayerInfo[playerid][pFirstaid]++;
                                SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "/firstaid");
                            }
                            case 8:
                            {
                                GivePlayerValidWeapon(playerid, 43);
                            }
                            case 9:
                            {
                                PlayerInfo[playerid][pRccam]++;
                                SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "/rccam");
                            }
                            case 10:
                            {
                                PlayerInfo[playerid][pReceiver]++;
                                SetPVarInt(playerid, "pReceiverMLeft", 4);
                                SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "Ban se nhan 4 tin nhan radio tiep theo.");
                            }
                            case 11:
                            {
                                PlayerInfo[playerid][pGPS] = 1;
                                SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "/gps");
                            }
                            case 12:
                            {
                                PlayerInfo[playerid][pSweep]++;
                                PlayerInfo[playerid][pSweepLeft] = 3;
                                SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "/sweep");
                            }
                            case 13:
                            {
                                GivePlayerValidWeapon(playerid, 46);
                            }
							case 14:
							{

								if(PlayerInfo[playerid][pTreasureSkill] >=0 && PlayerInfo[playerid][pTreasureSkill] <= 24) PlayerInfo[playerid][pMetalDetector] += 25;
								else if(PlayerInfo[playerid][pTreasureSkill] >=25 && PlayerInfo[playerid][pTreasureSkill] <= 149) PlayerInfo[playerid][pMetalDetector] += 50;
								else if(PlayerInfo[playerid][pTreasureSkill] >=150 && PlayerInfo[playerid][pTreasureSkill] <= 299) PlayerInfo[playerid][pMetalDetector] += 75;
								else if(PlayerInfo[playerid][pTreasureSkill] >=300 && PlayerInfo[playerid][pTreasureSkill] <= 599) PlayerInfo[playerid][pMetalDetector] += 100;
								else if(PlayerInfo[playerid][pTreasureSkill] >=600) PlayerInfo[playerid][pMetalDetector] += 125;
								SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "/search");
							}
                            case 15:
                            {
                                PlayerInfo[playerid][pMailbox]++;
                                SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "Go /placemailbox ban muon dat hop thu o dau.");
                            }
							case 16:
							{
								if(PlayerInfo[playerid][pSyringes] < 3) {
									PlayerInfo[playerid][pSyringes]++;
									SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "/usedrug heroin");
								}
								else
								{
						    		SendClientMessageEx(playerid, COLOR_GREY, "Ban khong the cam ong tiem nua.");
						    		return 1;
								}
							}
							case 17:
							{
								if(IsPlayerInRangeOfPoint(playerid, 50.0, HouseInfo[PlayerInfo[playerid][pPhousekey]][hInteriorX], HouseInfo[PlayerInfo[playerid][pPhousekey]][hInteriorY], HouseInfo[PlayerInfo[playerid][pPhousekey]][hInteriorZ]) && IsPlayerInRangeOfPoint(CraftOffer[playerid], 50.0, HouseInfo[PlayerInfo[playerid][pPhousekey]][hInteriorX], HouseInfo[PlayerInfo[playerid][pPhousekey]][hInteriorY], HouseInfo[PlayerInfo[playerid][pPhousekey]][hInteriorZ]))
								{
									GetPlayerPos(playerid, HouseInfo[PlayerInfo[playerid][pPhousekey]][hClosetX], HouseInfo[PlayerInfo[playerid][pPhousekey]][hClosetY], HouseInfo[PlayerInfo[playerid][pPhousekey]][hClosetZ]);
									if(IsValidDynamic3DTextLabel(HouseInfo[PlayerInfo[playerid][pPhousekey]][hClosetTextID])) DestroyDynamic3DTextLabel(Text3D:HouseInfo[PlayerInfo[playerid][pPhousekey]][hClosetTextID]);
									HouseInfo[PlayerInfo[playerid][pPhousekey]][hClosetTextID] = CreateDynamic3DTextLabel("Tu quan ao\n/closet de dung", 0xFFFFFF88, HouseInfo[PlayerInfo[playerid][pPhousekey]][hClosetX], HouseInfo[PlayerInfo[playerid][pPhousekey]][hClosetY], HouseInfo[PlayerInfo[playerid][pPhousekey]][hClosetZ]+0.5,10.0, .testlos = 1, .worldid = HouseInfo[PlayerInfo[playerid][pPhousekey]][hIntVW], .interiorid = HouseInfo[PlayerInfo[playerid][pPhousekey]][hIntIW], .streamdistance = 10.0);
									SaveHouse(PlayerInfo[playerid][pPhousekey]);
									SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "/closet(add/remove)");
								}
								else if(IsPlayerInRangeOfPoint(playerid, 50.0, HouseInfo[PlayerInfo[playerid][pPhousekey2]][hInteriorX], HouseInfo[PlayerInfo[playerid][pPhousekey2]][hInteriorY], HouseInfo[PlayerInfo[playerid][pPhousekey2]][hInteriorZ]) && IsPlayerInRangeOfPoint(CraftOffer[playerid], 50.0, HouseInfo[PlayerInfo[playerid][pPhousekey2]][hInteriorX], HouseInfo[PlayerInfo[playerid][pPhousekey2]][hInteriorY], HouseInfo[PlayerInfo[playerid][pPhousekey2]][hInteriorZ]))
								{
									GetPlayerPos(playerid, HouseInfo[PlayerInfo[playerid][pPhousekey2]][hClosetX], HouseInfo[PlayerInfo[playerid][pPhousekey2]][hClosetY], HouseInfo[PlayerInfo[playerid][pPhousekey2]][hClosetZ]);
									if(IsValidDynamic3DTextLabel(HouseInfo[PlayerInfo[playerid][pPhousekey2]][hClosetTextID])) DestroyDynamic3DTextLabel(Text3D:HouseInfo[PlayerInfo[playerid][pPhousekey2]][hClosetTextID]);
									HouseInfo[PlayerInfo[playerid][pPhousekey2]][hClosetTextID] = CreateDynamic3DTextLabel("Tu quan ao\n/closet de dung", 0xFFFFFF88, HouseInfo[PlayerInfo[playerid][pPhousekey2]][hClosetX], HouseInfo[PlayerInfo[playerid][pPhousekey2]][hClosetY], HouseInfo[PlayerInfo[playerid][pPhousekey2]][hClosetZ]+0.5,10.0, .testlos = 1, .worldid = HouseInfo[PlayerInfo[playerid][pPhousekey2]][hIntVW], .interiorid = HouseInfo[PlayerInfo[playerid][pPhousekey2]][hIntIW], .streamdistance = 10.0);
									SaveHouse(PlayerInfo[playerid][pPhousekey2]);
									SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "/closet(add/remove)");
								}
								else if(IsPlayerInRangeOfPoint(playerid, 50.0, HouseInfo[PlayerInfo[playerid][pPhousekey3]][hInteriorX], HouseInfo[PlayerInfo[playerid][pPhousekey3]][hInteriorY], HouseInfo[PlayerInfo[playerid][pPhousekey3]][hInteriorZ]) && IsPlayerInRangeOfPoint(CraftOffer[playerid], 50.0, HouseInfo[PlayerInfo[playerid][pPhousekey3]][hInteriorX], HouseInfo[PlayerInfo[playerid][pPhousekey3]][hInteriorY], HouseInfo[PlayerInfo[playerid][pPhousekey3]][hInteriorZ]))
								{
									GetPlayerPos(playerid, HouseInfo[PlayerInfo[playerid][pPhousekey3]][hClosetX], HouseInfo[PlayerInfo[playerid][pPhousekey3]][hClosetY], HouseInfo[PlayerInfo[playerid][pPhousekey3]][hClosetZ]);
									if(IsValidDynamic3DTextLabel(HouseInfo[PlayerInfo[playerid][pPhousekey3]][hClosetTextID])) DestroyDynamic3DTextLabel(Text3D:HouseInfo[PlayerInfo[playerid][pPhousekey3]][hClosetTextID]);
									HouseInfo[PlayerInfo[playerid][pPhousekey3]][hClosetTextID] = CreateDynamic3DTextLabel("Tu quan ao\n/closet de dung", 0xFFFFFF88, HouseInfo[PlayerInfo[playerid][pPhousekey3]][hClosetX], HouseInfo[PlayerInfo[playerid][pPhousekey3]][hClosetY], HouseInfo[PlayerInfo[playerid][pPhousekey3]][hClosetZ]+0.5,10.0, .testlos = 1, .worldid = HouseInfo[PlayerInfo[playerid][pPhousekey3]][hIntVW], .interiorid = HouseInfo[PlayerInfo[playerid][pPhousekey3]][hIntIW], .streamdistance = 10.0);
									SaveHouse(PlayerInfo[playerid][pPhousekey3]);
									SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "/closet(add/remove)");
								}
							}
							case 18:
							{
								PlayerInfo[playerid][pToolBox] += 15;
								SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "Go /pickveh(icle) trong bat ky chiec xe nao de co gang khoa no.");
							}
							case 19:
							{
								PlayerInfo[playerid][pCrowBar] += 25;
								SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "Go /cracktrunk trong bat ky chiec xe nao ban da khoa da chon de mo cop xe.");
							}
							case 20: GivePlayerValidWeapon(playerid, WEAPON_FLOWER);
							case 21: GivePlayerValidWeapon(playerid, WEAPON_BRASSKNUCKLE);
							case 22: GivePlayerValidWeapon(playerid, WEAPON_BAT);
							case 23: GivePlayerValidWeapon(playerid, WEAPON_CANE);
							case 24: GivePlayerValidWeapon(playerid, WEAPON_SHOVEL);
							case 25: GivePlayerValidWeapon(playerid, WEAPON_POOLSTICK);
							case 26: GivePlayerValidWeapon(playerid, WEAPON_KATANA);
							case 27: GivePlayerValidWeapon(playerid, WEAPON_DILDO);
							case 28: GivePlayerValidWeapon(playerid, WEAPON_SPRAYCAN);
							case 29: {
								PlayerInfo[playerid][pRimMod]++;
								SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "Go /userimkit voi tho sua xe trong mot cheic xe.");
							}
                        }
                        format(szMessage, sizeof(szMessage), "   Ban da cho %s, mot %s.", GetPlayerNameEx(playerid),weaponname);
                        PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
                        SendClientMessageEx(CraftOffer[playerid], COLOR_GRAD1, szMessage);
                        format(szMessage, sizeof(szMessage), "   Ban da nhan mot %s tu %s.", weaponname, GetPlayerNameEx(CraftOffer[playerid]));
                        SendClientMessageEx(playerid, COLOR_GRAD1, szMessage);
                        PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
                        format(szMessage, sizeof(szMessage), "* %s da tao ra thu gi do tu vat lieu va dua no cho %s.", GetPlayerNameEx(CraftOffer[playerid]), GetPlayerNameEx(playerid));
                        ProxDetector(30.0, playerid, szMessage, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
                        new ip[32], ipex[32];
                        GetPlayerIp(playerid, ip, sizeof(ip));
                        GetPlayerIp(CraftOffer[playerid], ipex, sizeof(ipex));
                        format(szMessage, sizeof(szMessage), "[CRAFTSMAN DEAL] %s(%d) (IP: %s) da mua a %s from %s(%d) (IP: %s)", GetPlayerNameEx(playerid), GetPlayerSQLId(playerid), ip, weaponname, GetPlayerNameEx(CraftOffer[playerid]), GetPlayerSQLId(CraftOffer[playerid]), ipex);
                        Log("logs/sell.log", szMessage);
                        PlayerInfo[CraftOffer[playerid]][pMats] -= CraftMats[playerid];
                        PlayerInfo[CraftOffer[playerid]][pArmsSkill]++;
                        CraftOffer[playerid] = INVALID_PLAYER_ID;
                        CraftId[playerid] = 0;
                        CraftMats[playerid] = 0;
                        return 1;
                    }
                    else {
                        SendClientMessageEx(playerid, COLOR_GRAD2, "Ban phai o gan nguoi dang ban vu khi cho ban!");
                        return 1;
                    }
                }
                return 1;
            }
            else {
                SendClientMessageEx(playerid, COLOR_GREY, "   Khong ai cung cap cho ban nghe thu cong!");
                return 1;
            }
        }
		else if(strcmp(params,"contract",true) == 0) {
			if(HitOffer[playerid] != INVALID_PLAYER_ID) {
				if(HitToGet[playerid] != INVALID_PLAYER_ID) {
					if(IsPlayerConnected(HitToGet[playerid])) {
						format(szMessage, sizeof(szMessage), "* %s da chap nhan hop dong giet nguoi %s.", GetPlayerNameEx(playerid),GetPlayerNameEx(HitToGet[playerid]));
						SendClientMessageEx(HitOffer[playerid], COLOR_LIGHTBLUE, szMessage);
						format(szMessage, sizeof(szMessage), "* Ban da chap nhan hop dong giet nguoi %s, ban se nhan duoc $%d khi hoan thanh.", GetPlayerNameEx(HitToGet[playerid]), PlayerInfo[HitToGet[playerid]][pHeadValue]);
						SendClientMessageEx(playerid, COLOR_LIGHTBLUE, szMessage);
						format(szMessage, sizeof(szMessage), "%s da duoc giao cho hop dong tren %s, gia $%d.", GetPlayerNameEx(playerid), GetPlayerNameEx(HitToGet[playerid]),  PlayerInfo[HitToGet[playerid]][pHeadValue]);
						foreach(new i : Player) if(IsAHitman(i)) SendClientMessage(i, COLOR_YELLOW, szMessage);
						//SendClientMessage(playerid, COLOR_LIGHTBLUE, "Hit accepted.  Wait 15 seconds for the final go ahead from the Agency.");
						//SetPVarInt(playerid, "HitCooldown", 15);
						GoChase[playerid] = HitToGet[playerid];
						GetChased[HitToGet[playerid]] = playerid;
						GotHit[HitToGet[playerid]] = 1;
						HitToGet[playerid] = INVALID_PLAYER_ID;
						HitOffer[playerid] = INVALID_PLAYER_ID;
						return 1;
					}
					else {
						HitToGet[playerid] = INVALID_PLAYER_ID;
						HitOffer[playerid] = INVALID_PLAYER_ID;
						return 1;
					}
				}
			}
			else {
				SendClientMessageEx(playerid, COLOR_GREY, "   Khong ai cung cap cho ban hop dong!");
				return 1;
			}
		}
        else if(strcmp(params,"sex",true) == 0) {
            if(SexOffer[playerid] != INVALID_PLAYER_ID) {
                if(GetPlayerCash(playerid) > SexPrice[playerid]) {
                    if (IsPlayerConnected(SexOffer[playerid])) {
                        new Car = GetPlayerVehicleID(playerid);
                        if(IsPlayerInAnyVehicle(playerid) && IsPlayerInVehicle(SexOffer[playerid], Car)) {
                            GetPlayerName(SexOffer[playerid], giveplayer, sizeof(giveplayer));
                            GetPlayerName(playerid, sendername, sizeof(sendername));
                            format(szMessage, sizeof(szMessage), "* Ban da co quan he tinh duc voi %s Gai diem, gia $%s.", giveplayer, number_format(SexPrice[playerid]));
                            SendClientMessageEx(playerid, COLOR_LIGHTBLUE, szMessage);
                            format(szMessage, sizeof(szMessage), "* %s da quan he tinh duc voi ban. Ban da kiem duoc $%d.", sendername, SexPrice[playerid]);
                            SendClientMessageEx(SexOffer[playerid], COLOR_LIGHTBLUE, szMessage);

                            new ip[32], ipex[32];
                            GetPlayerIp(playerid, ip, sizeof(ip));
                            GetPlayerIp(SexOffer[playerid], ipex, sizeof(ipex));
                            format(szMessage, sizeof(szMessage), "[SEX] %s(%d) (IP:%s) had sex with %s(%d) (IP:%s) for %d.", GetPlayerNameEx(playerid), GetPlayerSQLId(playerid), ip, GetPlayerNameEx(SexOffer[playerid]), GetPlayerSQLId(SexOffer[playerid]), ipex, SexPrice[playerid]);
                            Log("logs/sell.log", szMessage);

                            if(SexPrice[playerid] >= 25000 && (PlayerInfo[SexOffer[playerid]][pLevel] <= 3 || PlayerInfo[playerid][pLevel] <= 3)) {
                                format(szMessage, sizeof(szMessage), "%s(%d) (IP:%s) had sex with %s(%d) (IP:%s) for $%s in this session.", GetPlayerNameEx(playerid), GetPlayerSQLId(playerid), ip, GetPlayerNameEx(SexOffer[playerid]), GetPlayerSQLId(SexOffer[playerid]), ipex, number_format(SexPrice[playerid]));
                                Log("logs/sell.log", szMessage);
                                format(szMessage, sizeof(szMessage), "%s (IP:%s) had sex with %s (IP:%s) for $%s in this session.", GetPlayerNameEx(playerid), ip, GetPlayerNameEx(SexOffer[playerid]), ipex, number_format(SexPrice[playerid]));
                                ABroadCast(COLOR_YELLOW, szMessage, 2);
                            }

                            ExtortionTurfsWarsZone(SexOffer[playerid], 6, SexPrice[playerid]);
                            GivePlayerCash(SexOffer[playerid], SexPrice[playerid]);
                            GivePlayerCash(playerid, -SexPrice[playerid]);

  							if(PlayerInfo[SexOffer[playerid]][pDoubleEXP] > 0)
							{
								format(szMessage, sizeof(szMessage), "You have gained 2 whore skill points instead of 1. You have %d hours left on the Double EXP token.", PlayerInfo[SexOffer[playerid]][pDoubleEXP]);
								SendClientMessageEx(SexOffer[playerid], COLOR_YELLOW, szMessage);
   								PlayerInfo[SexOffer[playerid]][pSexSkill] += 2;
							}
							else
							{
  								PlayerInfo[SexOffer[playerid]][pSexSkill] += 1;
							}

                            if(PlayerInfo[SexOffer[playerid]][pSexSkill] == 50) {
                                SendClientMessageEx(SexOffer[playerid], COLOR_YELLOW, "* Your Sex Skill is now Level 2, you offer better Sex (health) and less chance on STI.");
                            }
                            else if(PlayerInfo[SexOffer[playerid]][pSexSkill] == 100) {
                                SendClientMessageEx(SexOffer[playerid], COLOR_YELLOW, "* Your Sex Skill is now Level 3, you offer better Sex (health) and less chance on STI.");
                            }
                            else if(PlayerInfo[SexOffer[playerid]][pSexSkill] == 200) {
                                SendClientMessageEx(SexOffer[playerid], COLOR_YELLOW, "* Your Sex Skill is now Level 4, you offer better Sex (health) and less chance on STI.");
                            }
                            else if(PlayerInfo[SexOffer[playerid]][pSexSkill] == 400) {
                                SendClientMessageEx(SexOffer[playerid], COLOR_YELLOW, "* Your Sex Skill is now Level 5, you offer better Sex (health) and less chance on STI.");
                            }

                            if(!GetPVarType(playerid, "STD")) {
                                if(Condom[playerid] == 0) {
                                    new Float:health;
                                    new level = PlayerInfo[SexOffer[playerid]][pSexSkill];
                                    if(level >= 0 && level <= 50) {
                                        GetHealth(playerid, health);
                                        if(health < 100) {
                                            if(health > 90) {
                                                SetHealth(playerid, 100);
                                            }
                                            else {
                                                SetHealth(playerid, health + 10.0);
                                            }
                                        }
                                        new rand = random(sizeof(STD1));
                                        SetPVarInt(playerid, "STD", STD1[rand]);
                                        SetPVarInt(SexOffer[playerid], "STD", STD1[rand]);
                                        if(STD1[rand] == 0) {
                                            SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "* You got 10 Health + no STI while having Sex."); SendClientMessageEx(SexOffer[playerid], COLOR_LIGHTBLUE, "* You haven't got a STI while having Sex.");
                                        }
                                        else if(STD1[rand] == 1) { SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "* You got 10 Health and Chlamydia because of unsafe sex."); SendClientMessageEx(SexOffer[playerid], COLOR_LIGHTBLUE, "* You received Chlamydia because of unsafe sex."); }
                                        else if(STD1[rand] == 2) { SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "* You got 10 Health and Gonorrhea because of unsafe sex."); SendClientMessageEx(SexOffer[playerid], COLOR_LIGHTBLUE, "* You received Gonorrhea because of unsafe sex."); }
                                        else if(STD1[rand] == 3) { SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "* You got 10 Health and Syphilis because of unsafe sex."); SendClientMessageEx(SexOffer[playerid], COLOR_LIGHTBLUE, "* You received Syphilis because of unsafe sex."); }
                                    }
                                    else if(level >= 51 && level <= 100) {
                                        GetHealth(playerid, health);
                                        if(health < 100) {
                                            if(health > 80) {
                                                SetHealth(playerid, 100);
                                            }
                                            else {
                                                SetHealth(playerid, health + 20.0);
                                            }
                                        }
                                        new rand = random(sizeof(STD2));
                                        SetPVarInt(playerid, "STD", STD2[rand]);
                                        SetPVarInt(SexOffer[playerid], "STD", STD2[rand]);
                                        if(STD2[rand] == 0) { SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "* You got 20 Health + no STD while having Sex."); SendClientMessageEx(SexOffer[playerid], COLOR_LIGHTBLUE, "* You haven't got a STI while having Sex."); }
                                        else if(STD2[rand] == 1) { SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "* You got 20 Health and Chlamydia because of unsafe sex."); SendClientMessageEx(SexOffer[playerid], COLOR_LIGHTBLUE, "* You received Chlamydia because of unsafe sex."); }
                                        else if(STD2[rand] == 2) { SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "* You got 20 Health and Gonorrhea because of unsafe sex."); SendClientMessageEx(SexOffer[playerid], COLOR_LIGHTBLUE, "* You received Gonorrhea because of unsafe sex."); }
                                        else if(STD2[rand] == 3) { SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "* You got 20 Health and Syphilis because of unsafe sex."); SendClientMessageEx(SexOffer[playerid], COLOR_LIGHTBLUE, "* You received Syphilis because of unsafe sex."); }
                                    }
                                    else if(level >= 101 && level <= 200) {
                                        GetHealth(playerid, health);
                                        if(health < 100) {
                                            if(health > 70) {
                                                SetHealth(playerid, 100);
                                            }
                                            else {
                                                SetHealth(playerid, health + 30.0);
                                            }
                                        }
                                        new rand = random(sizeof(STD3));
                                        SetPVarInt(playerid, "STD", STD3[rand]);
                                        SetPVarInt(SexOffer[playerid], "STD", STD3[rand]);
                                        if(STD3[rand] == 0) { SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "* You got 30 Health + no STI while having Sex."); SendClientMessageEx(SexOffer[playerid], COLOR_LIGHTBLUE, "* You haven't got a STI while having Sex."); }
                                        else if(STD3[rand] == 1) { SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "* You got 30 Health and Chlamydia because of unsafe sex."); SendClientMessageEx(SexOffer[playerid], COLOR_LIGHTBLUE, "* You received Chlamydia because of unsafe sex."); }
                                        else if(STD3[rand] == 2) { SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "* You got 30 Health and Gonorrhea because of unsafe sex."); SendClientMessageEx(SexOffer[playerid], COLOR_LIGHTBLUE, "* You received Gonorrhea because of unsafe sex."); }
                                        else if(STD3[rand] == 3) { SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "* You got 30 Health and Syphilis because of unsafe sex."); SendClientMessageEx(SexOffer[playerid], COLOR_LIGHTBLUE, "* You received Syphilis because of unsafe sex."); }
                                    }
                                    else if(level >= 201 && level <= 400) {
                                        GetHealth(playerid, health);
                                        if(health < 100) {
                                            if(health > 60) {
                                                SetHealth(playerid, 100);
                                            }
                                            else {
                                                SetHealth(playerid, health + 40.0);
                                            }
                                        }
                                        new rand = random(sizeof(STD4));
                                        SetPVarInt(playerid, "STD", STD4[rand]);
                                        SetPVarInt(SexOffer[playerid], "STD", STD4[rand]);
                                        if(STD4[rand] == 0) { SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "* You got 40 Health + no STI while having Sex."); SendClientMessageEx(SexOffer[playerid], COLOR_LIGHTBLUE, "* You haven't got a STI while having Sex."); }
                                        else if(STD4[rand] == 1) { SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "* You got 40 Health and Chlamydia because of unsafe sex."); SendClientMessageEx(SexOffer[playerid], COLOR_LIGHTBLUE, "* You received Chlamydia because of unsafe sex."); }
                                        else if(STD4[rand] == 2) { SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "* You got 40 Health and Gonorrhea because of unsafe sex."); SendClientMessageEx(SexOffer[playerid], COLOR_LIGHTBLUE, "* You received Gonorrhea because of unsafe sex."); }
                                        else if(STD4[rand] == 3) { SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "* You got 40 Health and Syphilis because of unsafe sex."); SendClientMessageEx(SexOffer[playerid], COLOR_LIGHTBLUE, "* You received Syphilis because of unsafe sex."); }
                                    }
                                    else if(level >= 401) {
                                        GetHealth(playerid, health);
                                        if(health > 50) {
                                            SetHealth(playerid, 100);
                                        }
                                        else {
                                            SetHealth(playerid, health + 50.0);
                                        }
                                        SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "* Your sex skill level was high enough to give them a lot of health and no STD.");
                                        SendClientMessageEx(SexOffer[playerid], COLOR_LIGHTBLUE, "* The whore's sex skill level was high enough to give you a lot of health and no STD.");
                                    }
                                }
                                else {
                                    SendClientMessageEx(SexOffer[playerid], COLOR_LIGHTBLUE, "* The person used a Condom.");
                                    SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "* You used a Condom.");
                                    Condom[playerid] --;
                                }
                            }
                            else {
                                SendClientMessageEx(SexOffer[playerid], COLOR_LIGHTBLUE, "* That person was already infected with a STD, can't get another one.");
								SexOffer[playerid] = INVALID_PLAYER_ID;
                                return 1;
                            }
                            SexOffer[playerid] = INVALID_PLAYER_ID;
                            return 1;
                        }
                        else {
                            SendClientMessageEx(playerid, COLOR_GREY, "   You or the Whore are not both in a Car!");
                            return 1;
                        }
                    }                             //Connected or not
                    return 1;
                }
                else {
                    SendClientMessageEx(playerid, COLOR_GREY, "   You can't afford the Sex!");
                    return 1;
                }
            }
            else {
                SendClientMessageEx(playerid, COLOR_GREY, "   No sex has been offered!");
                return 1;
            }
        }
        else if(strcmp(params,"repair",true) == 0) {
            if(RepairOffer[playerid] != INVALID_PLAYER_ID) {
                if(GetPlayerCash(playerid) > RepairPrice[playerid]) {
                    if(IsPlayerInAnyVehicle(playerid)) {
                        if(IsPlayerConnected(RepairOffer[playerid])) {
                            RepairCar[playerid] = GetPlayerVehicleID(playerid);
                            RepairVehicle(RepairCar[playerid]);
							Vehicle_Armor(RepairCar[playerid]);
                            PlayerInfo[RepairOffer[playerid]][pTire]--;

                            GivePlayerCash(RepairOffer[playerid], RepairPrice[playerid]);
                            GivePlayerCash(playerid, -RepairPrice[playerid]);
                            new ip[32], ipex[32];
                            GetPlayerIp(playerid, ip, sizeof(ip));
                            GetPlayerIp(RepairOffer[playerid], ipex, sizeof(ipex));
                            format(szMessage, sizeof(szMessage), "%s(%d) (IP:%s) has repaired the vehicle from %s(%d) (IP:%s) for $%d", GetPlayerNameEx(playerid), GetPlayerSQLId(playerid), ip, GetPlayerNameEx(RepairOffer[playerid]), GetPlayerSQLId(RepairOffer[playerid]), ipex, RepairPrice[playerid]);
                            Log("logs/sell.log", szMessage);
                            format(szMessage, sizeof(szMessage), "* %s da sua chua chiec xe %s's.", GetPlayerNameEx(RepairOffer[playerid]), GetPlayerNameEx(playerid));
                            ProxDetector(30.0, playerid, szMessage, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
                            format(szMessage, sizeof(szMessage), "* Ban da sua xe cho $%d boi tho sua xe %s.",RepairPrice[playerid],GetPlayerNameEx(RepairOffer[playerid]));
                            SendClientMessageEx(playerid, COLOR_LIGHTBLUE, szMessage);

                            if(RepairPrice[playerid] >= 25000 && (PlayerInfo[RepairOffer[playerid]][pLevel] <= 3 || PlayerInfo[RepairOffer[playerid]][pLevel] <= 3)) {
                                format(szMessage, sizeof(szMessage), "%s(%d) (IP:%s) has repaired %s(%d) (IP:%s) $%d in this session.", GetPlayerNameEx(playerid), GetPlayerSQLId(playerid), ip, GetPlayerNameEx(RepairOffer[playerid]), GetPlayerSQLId(RepairOffer[playerid]), ipex, RepairPrice[playerid]);
                                Log("logs/sell.log", szMessage);
								format(szMessage, sizeof(szMessage), "%s (IP:%s) has repaired %s (IP:%s) $%d in this session.", GetPlayerNameEx(playerid), ip, GetPlayerNameEx(RepairOffer[playerid]), ipex, RepairPrice[playerid]);
                                ABroadCast(COLOR_YELLOW, szMessage, 2);
                            }

                            format(szMessage, sizeof(szMessage), "* Ban da sua xe %s's, gia $%d tien da duoc them vao tui tien!",GetPlayerNameEx(playerid),RepairPrice[playerid]);
                            SendClientMessageEx(RepairOffer[playerid], COLOR_LIGHTBLUE, szMessage);

   							if(PlayerInfo[RepairOffer[playerid]][pDoubleEXP] > 0)
							{
								format(szMessage, sizeof(szMessage), "You have gained 2 mechanic skill points instead of 1. You have %d hours left on the Double EXP token.", PlayerInfo[RepairOffer[playerid]][pDoubleEXP]);
								SendClientMessageEx(RepairOffer[playerid], COLOR_YELLOW, szMessage);
   								PlayerInfo[RepairOffer[playerid]][pMechSkill] += 2;
							}
							else
							{
								PlayerInfo[RepairOffer[playerid]][pMechSkill] += 1;
							}

                            RepairOffer[playerid] = INVALID_PLAYER_ID;
                            RepairPrice[playerid] = 0;
                            return 1;
                        }
                        return 1;
                    }
                    return 1;
                }
                else {
                    SendClientMessageEx(playerid, COLOR_GREY, "   You can't afford the Repair!");
                    return 1;
                }
            }
            else {
                SendClientMessageEx(playerid, COLOR_GREY, "   No-one offered you to Repair your Car!");
                return 1;
            }
        }
        else if(strcmp(params,"doxang",true) == 0) {
            if(RefillOffer[playerid] != INVALID_PLAYER_ID) {
                if(GetPlayerCash(playerid) > RefillPrice[playerid]) {
                    if(IsPlayerInAnyVehicle(playerid)) {
                        if(IsPlayerConnected(RefillOffer[playerid])) {

	      					if(!ProxDetectorS(8.0, RefillOffer[playerid], playerid))
		  					{
								return SendClientMessageEx(playerid, COLOR_GREY, "You are not near the mechanic.");
							}
                            new Float:fueltogive;
                            new level = PlayerInfo[RefillOffer[playerid]][pMechSkill];
                            if(level >= 0 && level < 50) { fueltogive = 2.0; }
                            else if(level >= 50 && level < 100) { fueltogive = 4.0; }
                            else if(level >= 100 && level < 200) { fueltogive = 6.0; }
                            else if(level >= 200 && level < 400) { fueltogive = 8.0; }
                            else if(level >= 400) { fueltogive = 10.0; }
                            GetPlayerName(RefillOffer[playerid], giveplayer, sizeof(giveplayer));
                            GetPlayerName(playerid, sendername, sizeof(sendername));
                            new vehicleid = GetPlayerVehicleID(playerid);
                            VehicleFuel[vehicleid] = floatadd(VehicleFuel[vehicleid], fueltogive);
                            if(VehicleFuel[vehicleid] > 100.0) VehicleFuel[vehicleid] = 100.0;
                            for(new vehicleslot = 0; vehicleslot < MAX_PLAYERVEHICLES; vehicleslot++)
							{
								if(IsPlayerInVehicle(playerid, PlayerVehicleInfo[playerid][vehicleslot][pvId]))
								{
									if(vehicleslot != -1) {
										mysql_format(MainPipeline, szMessage, sizeof(szMessage), "UPDATE `vehicles` SET `pvFuel` = %0.5f WHERE `id` = '%d'", VehicleFuel[vehicleid], PlayerVehicleInfo[playerid][vehicleslot][pvSlotId]);
										mysql_tquery(MainPipeline, szMessage, "OnQueryFinish", "ii", SENDDATA_THREAD, playerid);
									}
								}
							}
                            GivePlayerCash(RefillOffer[playerid], RefillPrice[playerid]);
                            GivePlayerCash(playerid, -RefillPrice[playerid]);
                            new ip[32], ipex[32];
                            GetPlayerIp(playerid, ip, sizeof(ip));
                            GetPlayerIp(RefillOffer[playerid], ipex, sizeof(ipex));
                            format(szMessage, sizeof(szMessage), "%s(%d) (IP:%s) has refilled the vehicle from %s(%d) (IP:%s) for $%d", GetPlayerNameEx(playerid), GetPlayerSQLId(playerid), ip, GetPlayerNameEx(RefillOffer[playerid]), GetPlayerSQLId(RefillOffer[playerid]), ipex, RefillPrice[playerid]);
							Log("logs/sell.log", szMessage);
                            format(szMessage, sizeof(szMessage), "* %s da do xang xe %s's.", GetPlayerNameEx(RefillOffer[playerid]), GetPlayerNameEx(playerid));
                           	ProxChatBubble(playerid, szMessage);
                            // ProxDetector(30.0, playerid, szMessage, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
                            format(szMessage, sizeof(szMessage), "* Ban da them %.2f vao xe cua ban gia $%d boi Tho sua xe %s.",fueltogive,RefillPrice[playerid],GetPlayerNameEx(RefillOffer[playerid]));
                            SendClientMessageEx(playerid, COLOR_LIGHTBLUE, szMessage);
                            format(szMessage, sizeof(szMessage), "* Ban da them %.2f xang vao xe %s's, gia $%d da duoc them vao tui tien!",fueltogive,GetPlayerNameEx(playerid),RefillPrice[playerid]);
                            SendClientMessageEx(RefillOffer[playerid], COLOR_LIGHTBLUE, szMessage);

 							if(PlayerInfo[RefillOffer[playerid]][pDoubleEXP] > 0)
							{
								format(szMessage, sizeof(szMessage), "You have gained 2 mechanic skill points instead of 1. You have %d hours left on the Double EXP token.", PlayerInfo[RefillOffer[playerid]][pDoubleEXP]);
								SendClientMessageEx(RefillOffer[playerid], COLOR_YELLOW, szMessage);
   								PlayerInfo[RefillOffer[playerid]][pMechSkill] += 2;
							}
							else
							{
								PlayerInfo[RefillOffer[playerid]][pMechSkill] += 1;
							}

                            if(RefillPrice[playerid] >= 30000 && (PlayerInfo[playerid][pLevel] <= 3 || PlayerInfo[RefillOffer[playerid]][pLevel] <= 3)) {
                                format(szMessage, sizeof(szMessage), "%s(%d) (IP:%s) has refueled %s(%d) (IP:%s) $%d in this session.", GetPlayerNameEx(playerid), GetPlayerSQLId(playerid), ip, GetPlayerNameEx(RefillOffer[playerid]), GetPlayerSQLId(RefillOffer[playerid]), ipex, RefillPrice[playerid]);
                                Log("logs/sell.log", szMessage);
								format(szMessage, sizeof(szMessage), "%s (IP:%s) has refueled %s (IP:%s) $%d in this session.", GetPlayerNameEx(playerid), ip, GetPlayerNameEx(RefillOffer[playerid]), ipex, RefillPrice[playerid]);
                                ABroadCast(COLOR_YELLOW, szMessage, 2);
                            }

                            RefillOffer[playerid] = INVALID_PLAYER_ID;
                            RefillPrice[playerid] = 0;
                            return 1;
                        }
                        return 1;
                    }
                    return 1;
                }
                else {
                    SendClientMessageEx(playerid, COLOR_GREY, "   You can't afford the refill!");
                    return 1;
                }
            }
            else {
                SendClientMessageEx(playerid, COLOR_GREY, "   No-one offered you to refill your Car!");
                return 1;
            }
        }
		else if(strcmp(params, "backpack", true) == 0) {
			if(GetPVarType(playerid, "sellbackpack") && IsPlayerConnected(GetPVarInt(playerid, "sellbackpack")))
			{
				if(GetPlayerCash(playerid) > GetPVarInt(playerid, "sellbackpackprice"))
				{
					if(PlayerInfo[GetPVarInt(playerid, "sellbackpack")][pBackpack] < 1)	{
						SendClientMessageEx(playerid,COLOR_GREY, "That person does not have a backpack anymore!");
						return 1;
					}
					new btype[8];
					if(PlayerHoldingObject[playerid][9] != 0 || IsPlayerAttachedObjectSlotUsed(playerid, 9))
						RemovePlayerAttachedObject(playerid, 9), PlayerHoldingObject[playerid][9] = 0;
					switch(PlayerInfo[GetPVarInt(playerid, "sellbackpack")][pBackpack])
					{
						case 1:
						{
							btype = "Small";
							SetPlayerAttachedObject(playerid, 9, 371, 1, -0.002, -0.140999, -0.01, 8.69999, 88.8, -8.79993, 1.11, 0.963);
						}
						case 2:
						{
							btype = "Medium";
							SetPlayerAttachedObject(playerid, 9, 371, 1, -0.002, -0.140999, -0.01, 8.69999, 88.8, -8.79993, 1.11, 0.963);
						}
						case 3:
						{
							btype = "Large";
							SetPlayerAttachedObject(playerid, 9, 3026, 1, -0.254999, -0.109, -0.022999, 10.6, -1.20002, 3.4, 1.265, 1.242, 1.062);
						}
					}
					GivePlayerCash(playerid, -GetPVarInt(playerid, "sellbackpackprice"));
					GivePlayerCash(GetPVarInt(playerid, "sellbackpack"), GetPVarInt(playerid, "sellbackpackprice"));
					format(szMessage, sizeof(szMessage), "* Ban da mua mmomt %s Balo gia $%s tu %s.",btype,number_format(GetPVarInt(playerid, "sellbackpackprice")),GetPlayerNameEx(GetPVarInt(playerid, "sellbackpack")));
					SendClientMessageEx(playerid, COLOR_LIGHTBLUE, szMessage);
					format(szMessage, sizeof(szMessage), "* %s da mua Balo cua ban %s , $%s da them vao tui tien.",GetPlayerNameEx(playerid),btype, number_format(GetPVarInt(playerid, "sellbackpackprice")));
					SendClientMessageEx(GetPVarInt(playerid, "sellbackpack"), COLOR_LIGHTBLUE, szMessage);


					PlayerInfo[playerid][pBackpack] = PlayerInfo[GetPVarInt(playerid, "sellbackpack")][pBackpack];
					PlayerInfo[playerid][pBEquipped] = 1;
					PlayerInfo[playerid][pBStoredH] = INVALID_HOUSE_ID;
					PlayerInfo[playerid][pBStoredV] = INVALID_PLAYER_VEHICLE_ID;
					RemovePlayerAttachedObject(GetPVarInt(playerid, "sellbackpack"), 9);

					PlayerInfo[GetPVarInt(playerid, "sellbackpack")][pBackpack] = 0;
					PlayerInfo[GetPVarInt(playerid, "sellbackpack")][pBEquipped] = 0;
					PlayerInfo[GetPVarInt(playerid, "sellbackpack")][pBStoredH] = INVALID_HOUSE_ID;
					PlayerInfo[GetPVarInt(playerid, "sellbackpack")][pBStoredV] = INVALID_PLAYER_VEHICLE_ID;
					for(new i = 0; i < 10; i++)
					{
						PlayerInfo[GetPVarInt(playerid, "sellbackpack")][pBItems][i] = 0;
					}

					format(szMessage, sizeof(szMessage), "%s(%d) (IP:%s) da mua %s Balo gia $%s tu %s(%d) (IP:%s)", GetPlayerNameEx(playerid), GetPlayerSQLId(playerid), GetPlayerIpEx(playerid), btype, number_format(GetPVarInt(playerid, "sellbackpackprice")),  GetPlayerNameEx(GetPVarInt(playerid, "sellbackpack")), GetPlayerSQLId(GetPVarInt(playerid, "sellbackpack")), GetPlayerIpEx(GetPVarInt(playerid, "sellbackpack")));
					Log("logs/pay.log", szMessage);
					Log("logs/backpack.log", szMessage);

					OnPlayerStatsUpdate(playerid);
					OnPlayerStatsUpdate(GetPVarInt(playerid, "sellbackpack"));
					DeletePVar(GetPVarInt(playerid, "sellbackpack"), "sellingbackpack");
					DeletePVar(playerid, "sellbackpack");
					DeletePVar(playerid, "sellbackpackprice");
					return 1;
	     		}
	      		else
				{
	            	SendClientMessageEx(playerid, COLOR_GREY, "You can't afford the backpack!");
					DeletePVar(playerid, "sellbackpack");
	                DeletePVar(playerid, "sellbackpackprice");
	                return 1;
	        	}
			}
		}
        return 1;
    }                                             //not connected
    return 1;
}
CMD:huybo(playerid, params[])
{
	new string[128], choice[32];
	if(sscanf(params, "s[32]", choice))
	{
		SendClientMessageEx(playerid, COLOR_WHITE, "|__________________ Huy bo __________________|");
		SendClientMessageEx(playerid, COLOR_GREY, "USAGE: /huybo [name]");
		SendClientMessageEx(playerid, COLOR_GREY, "Ten co san: Sex, Mats, Cannabis, Crack, Weapon, Craft, Repair, Lawyer, Bodyguard, Live, Refill, Car, Boxing");
		SendClientMessageEx(playerid, COLOR_GREY, "Ten co san: Taxi, Bus, Medic, Mechanic, Ticket, WitNess, Marriage, Drink, House, Shipment, Help, Firstaid, Garbage");
		SendClientMessageEx(playerid, COLOR_GREY, "Ten co san: FoodOffer, RenderAid, DrugRun");
		if(PlayerInfo[playerid][pTut] != -1) SendClientMessageEx(playerid, COLOR_GREY, "Special: objectives");
		if(IsAHitman(playerid)) { SendClientMessageEx(playerid, COLOR_GREY, "Special: contract"); }
		SendClientMessageEx(playerid, COLOR_WHITE, "|____________________________________________|");
		return 1;
	}

	if(strcmp(choice, "objectives", true) == 0 && PlayerInfo[playerid][pTut] >= 15)
	{
		SendClientMessageEx(playerid, COLOR_GREY, "-----------------------------");
		SendClientMessageEx(playerid, COLOR_WHITE, "Ban da huy bo muc tieu huong dan. Chao mung den voi New City Role Play!");
		SendClientMessageEx(playerid, COLOR_GREY, "-----------------------------");
		PlayerInfo[playerid][pTut] = -1;
		DisablePlayerCheckpoint(playerid);
	}

	if(strcmp(choice, "door", true) == 0)
	{
		if(gPlayerLogged{playerid} == 0) return SendClientMessageEx(playerid, COLOR_GREY, "You are not logged into your account.");
		if(DDSalePendingAdmin[playerid] == false && DDSalePendingPlayer[playerid] == false) return SendClientMessageEx(playerid, COLOR_GREY, "Ban khong co ban door dang cho xu ly.");
		ClearDoorSaleVariables(playerid);
	}
	else if(strcmp(choice,"renderaid",true) == 0) DeletePVar(playerid, "renderaid");
	else if(strcmp(choice,"sex",true) == 0) {
		if(GetPVarType(playerid, "SexOfferTo")) {
			SexOffer[GetPVarInt(playerid, "SexOfferTo")] = INVALID_PLAYER_ID;
			SexPrice[GetPVarInt(playerid, "SexOfferTo")] = 0;
			DeletePVar(playerid, "SexOfferTo");
		}
		else {
			SexOffer[playerid] = INVALID_PLAYER_ID; SexPrice[playerid] = 0;
		}
	}
	else if(strcmp(choice,"craft",true) == 0) { CraftOffer[playerid] = INVALID_PLAYER_ID; CraftId[playerid] = 0; }
	else if(strcmp(choice,"repair",true) == 0) {
		if(GetPVarType(playerid, "RepairOfferTo")) {
			RepairOffer[GetPVarInt(playerid, "RepairOfferTo")] = INVALID_PLAYER_ID;
			RepairPrice[GetPVarInt(playerid, "RepairOfferTo")] = 0;
			RepairCar[GetPVarInt(playerid, "RepairOfferTo")] = 0;
			DeletePVar(playerid, "RepairOfferTo");
		}
		else {
			RepairOffer[playerid] = INVALID_PLAYER_ID; RepairPrice[playerid] = 0; RepairCar[playerid] = 0;
		}
	}
	else if(strcmp(choice,"lawyer",true) == 0) { WantLawyer[playerid] = 0; CallLawyer[playerid] = 0; }
	else if(strcmp(choice,"bodyguard",true) == 0) { GuardOffer[playerid] = INVALID_PLAYER_ID; GuardPrice[playerid] = 0; }
	else if(strcmp(choice,"live",true) == 0) { LiveOffer[playerid] = INVALID_PLAYER_ID; }
	else if(strcmp(choice,"refill",true) == 0) { RefillOffer[playerid] = INVALID_PLAYER_ID; RefillPrice[playerid] = 0; }
	else if(strcmp(choice,"car",true) == 0) { VehicleOffer[playerid] = INVALID_PLAYER_ID; VehiclePrice[playerid] = 0; VehicleId[playerid] = -1; }
	else if(strcmp(choice,"house",true) == 0) { HouseOffer[playerid] = INVALID_PLAYER_ID; HousePrice[playerid] = 0; House[playerid] = 0; }
	else if(strcmp(choice,"boxing",true) == 0) { BoxOffer[playerid] = INVALID_PLAYER_ID; }
	else if(strcmp(choice,"witness",true) == 0) { MarryWitnessOffer[playerid] = INVALID_PLAYER_ID; }
	else if(strcmp(choice,"marriage",true) == 0) { DeletePVar(ProposeOffer[playerid], "marriagelastname"), ProposeOffer[playerid] = INVALID_PLAYER_ID, DeletePVar(playerid, "marriagelastname"); }
	//else if(strcmp(choice,"divorce",true) == 0) { DivorceOffer[playerid] = INVALID_PLAYER_ID; }
	else if(strcmp(choice,"drink",true) == 0) { DrinkOffer[playerid] = INVALID_PLAYER_ID; }
	else if(strcmp(choice,"firstaid",true) == 0)
	{
		if(GetPVarInt(playerid, "usingfirstaid"))
		{
			KillTimer(GetPVarInt(playerid, "firstaid5"));
			SetPVarInt(playerid, "usingfirstaid", 0);
		}
	}
	else if(strcmp(choice,"drugrun",true) == 0)
	{
		if(GetPVarInt(playerid, "pDrugRun"))
		{
			Player_KillCheckPoint(playerid);
			DeletePVar(playerid, "pDrugRun");
			DeletePVar(playerid, "pDrugBoat");
			DeletePVar(playerid, "pPotPackages");
			DeletePVar(playerid, "pCrackPackages");
			DeletePVar(playerid, "pMethPackages");
			DeletePVar(playerid, "pEcstasyPackages");
		}
	}
	else if(strcmp(choice,"shipment",true) == 0)
	{
		new vehicleid = GetPlayerVehicleID(playerid);
		if(vehicleid == 0) return SendClientMessageEx(playerid, COLOR_WHITE, "Ban can phai o trong mot chiec xe hop le.");
 		DeletePVar(playerid, "LoadTruckTime");
		DeletePVar(playerid, "TruckDeliver");

		TruckContents{vehicleid} = 0;
		if((0 <= TruckDeliveringTo[vehicleid] < MAX_BUSINESSES)) Businesses[TruckDeliveringTo[vehicleid]][bOrderState] = 0;
		TruckDeliveringTo[vehicleid] = INVALID_BUSINESS_ID;

		TruckUsed[playerid] = INVALID_VEHICLE_ID;
		gPlayerCheckpointStatus[playerid] = CHECKPOINT_NONE;
 		DisablePlayerCheckpoint(playerid);
	}
	else if(strcmp(choice,"garbage",true) == 0)
	{
		new vehicleid = GetPlayerVehicleID(playerid);
		if(vehicleid == 0) return SendClientMessageEx(playerid, COLOR_WHITE, "Ban can phai o trong mot chiec xe hop le.");
 		DeletePVar(playerid, "pGarbageRun");
		DeletePVar(playerid, "pGarbageStage");

 		DisablePlayerCheckpoint(playerid);
	}
	else if(strcmp(choice,"help", true) == 0)
	{
	    if(GetPVarInt(playerid, "COMMUNITY_ADVISOR_REQUEST") == 1)
	    {
		    DeletePVar(playerid, "COMMUNITY_ADVISOR_REQUEST");
			DeletePVar(playerid, "HelpTime");
			DeletePVar(playerid, "HelpReason");
		}
		else {
		    SendClientMessageEx(playerid, COLOR_GRAD2, "Ban da khong yeu cau tro giup.");
		    return 1;
		}
	}
	else if(strcmp(choice,"contract",true) == 0)
	{
		if(GoChase[playerid] != INVALID_PLAYER_ID || HitToGet[playerid] != INVALID_PLAYER_ID) {
			new Float:health;
			GetHealth(playerid, health);
			new hpint = floatround( health, floatround_round );
			if (hpint >=  80)
			{
				HitToGet[playerid] = INVALID_PLAYER_ID;
				HitOffer[playerid] = INVALID_PLAYER_ID;
				GetChased[GoChase[playerid]] = INVALID_PLAYER_ID;
				GotHit[GoChase[playerid]] = 0;
				GoChase[playerid] = INVALID_PLAYER_ID;
				DeletePVar(playerid, "HitCooldown");
			}
			else return SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong the huy bo hop dong voi suc khoe duoi 80 phan tram!");

		}
		else return SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong co hop dong nao hoat dong!");
	}
	else if(strcmp(choice,"ticket",true) == 0) { TicketOffer[playerid] = INVALID_PLAYER_ID; TicketMoney[playerid] = 0; }
	else if(strcmp(choice,"medic",true) == 0) { if(IsPlayerConnected(MedicCall)) { if(MedicCall == playerid) { MedicCall = INVALID_PLAYER_ID; } else { SendClientMessageEx(playerid, COLOR_GREY, "   Ban khong phai la nguoi goi hien tai!"); return 1; } } }
	else if(strcmp(choice,"mechanic",true) == 0) { if(IsPlayerConnected(MechanicCall)) { if(MechanicCall == playerid) { MechanicCall = INVALID_PLAYER_ID; } else { SendClientMessageEx(playerid, COLOR_GREY, "   Ban khong phai la nguoi goi hien tai!"); return 1; } } }
	else if(strcmp(choice,"help",true) == 0) { if(GetPVarInt(playerid, "COMMUNITY_ADVISOR_REQUEST")) { DeletePVar(playerid, "COMMUNITY_ADVISOR_REQUEST"); } else { SendClientMessageEx(playerid, COLOR_GREY, "   Ban khong phai la nguoi goi hien tai!"); return 1; } }
	else if(strcmp(choice,"taxi",true) == 0)
	{
		if(TransportDuty[playerid] == 1 && TaxiCallTime[playerid] > 0)
		{
			GameTextForPlayer(TaxiAccepted[playerid], "~w~Tai xe Taxi~n~~r~Huy bo cuoc goi", 5000, 1);
			DeletePVar(TaxiAccepted[playerid], "TaxiCall");
			TaxiAccepted[playerid] = INVALID_PLAYER_ID;
			GameTextForPlayer(playerid, "~w~Ban da~n~~r~Huy bo cuoc goi", 5000, 1);
			TaxiCallTime[playerid] = 0;
			DisablePlayerCheckpoint(playerid);
		}
		else
		{
			if(GetPVarInt(playerid, "TaxiCall")) DeletePVar(playerid, "TaxiCall");
			else {
				foreach(new i : Player)
				{
					if(TaxiAccepted[i] != INVALID_PLAYER_ID && TaxiAccepted[i] == playerid)
					{
							GameTextForPlayer(i, "~w~Cuoc goi Taxi~n~~r~Huy bo cuoc goi", 5000, 1);
							TaxiCallTime[i] = 0;
							DeletePVar(TaxiAccepted[i], "TaxiCall");
							TaxiAccepted[i] = INVALID_PLAYER_ID;
							DisablePlayerCheckpoint(i);
					}
				}
			}
		}
	}
	else if(strcmp(choice,"bus",true) == 0)
	{
		if(TransportDuty[playerid] == 2 && BusCallTime[playerid] > 0)
		{
			GameTextForPlayer(BusAccepted[playerid], "~w~Tai xe Bus~n~~r~Huy bo cuoc goi", 5000, 1);
			DeletePVar(BusAccepted[playerid], "BusCall");
			BusAccepted[playerid] = INVALID_PLAYER_ID;
			GameTextForPlayer(playerid, "~w~Ban da~n~~r~Huy bo cuoc goi", 5000, 1);
			BusCallTime[playerid] = 0;
			DisablePlayerCheckpoint(playerid);
		}
		else
		{
			foreach(new i : Player)
			{
				if(BusAccepted[i] != INVALID_PLAYER_ID && BusAccepted[i] == playerid)
				{
					GameTextForPlayer(i, "~w~Cuoc goi Bus~n~~r~Huy bo cuoc goi", 5000, 1);
					BusCallTime[i] = 0;
					DeletePVar(BusAccepted[i], "BusCall");
					BusAccepted[i] = INVALID_PLAYER_ID;
					DisablePlayerCheckpoint(i);
				}
			}
		}
	}
	else if(strcmp(choice,"foodoffer",true) == 0) {
		new offeredTo = GetPVarInt(playerid, "OfferedMealTo");
		DeletePVar(offeredTo, "OfferedMeal");
		DeletePVar(offeredTo, "OfferedMealBy");
		DeletePVar(playerid, "OfferingMeal");
		DeletePVar(playerid, "OfferedMealTo");
	}
	else { return 1; }
	format(string, sizeof(string), "* Ban da huy bo: %s.", choice);
	SendClientMessageEx(playerid, COLOR_LIGHTBLUE, string);
	return 1;
}

timer Cooldown_Mechanic[10000](playerid) {
	DeletePVar(playerid, "MCH_CLDWN");
}

CMD:refill(playerid, params[])
{
	if(PlayerInfo[playerid][pJob] != 7 && PlayerInfo[playerid][pJob2] != 7 && PlayerInfo[playerid][pJob3] != 7)
	{
		return SendClientMessageEx(playerid, COLOR_GREY, "Ban khong phai tho sua xe.");
	}

	new string[128];
	if(gettime() < PlayerInfo[playerid][pMechTime])
	{
		format(string, sizeof(string), "Ban phai doi %d giay!", PlayerInfo[playerid][pMechTime]-gettime());
		return SendClientMessageEx(playerid, COLOR_GRAD1,string);
	}
	new giveplayerid, money;
	if(sscanf(params, "ud", giveplayerid, money)) return SendClientMessageEx(playerid, COLOR_GREY, "USAGE: /refill [player] [price]");

	if(!(money >= 1 && money < 100000))
	{
		return SendClientMessageEx(playerid, COLOR_GREY, "Gia chi dinh khong hop le - khong the thap hon $1 hoac cao hon $99,999.");
	}
	if(IsPlayerConnected(giveplayerid))
	{
		if(ProxDetectorS(8.0, playerid, giveplayerid) && IsPlayerInAnyVehicle(giveplayerid))
		{

			new Float: fueltogive;
			switch(PlayerInfo[playerid][pMechSkill])
			{
			case 0 .. 49: fueltogive = 2.0;
			case 50 .. 99: fueltogive = 4.0;
			case 100 .. 199: fueltogive = 6.0;
			case 200 .. 399: fueltogive = 8.0;
			default: fueltogive = 10.0;
			}
			if(giveplayerid == playerid)
			{
				if(PlayerInfo[playerid][pMechSkill] >= 400)
				{
					if(GetPVarType(playerid, "MCH_CLDWN")) return SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong the do xang qua nhanh!");

					SetPVarInt(playerid, "MCH_CLDWN", 1);
					defer Cooldown_Mechanic(playerid);

					new vehicleid = GetPlayerVehicleID(playerid);
					VehicleFuel[vehicleid] = VehicleFuel[vehicleid] + fueltogive;
					if(VehicleFuel[vehicleid] > 100.0) VehicleFuel[vehicleid] = 100.0;
					format(string, sizeof(string), "* %s da do day xe cua ho.", GetPlayerNameEx(playerid));
					ProxChatBubble(playerid, string);
					// ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
					format(string, sizeof(string), "* Ban them %.2f xang vao xe cua ban.",fueltogive);
					SendClientMessageEx(playerid, COLOR_LIGHTBLUE, string);
					for(new vehicleslot = 0; vehicleslot < MAX_PLAYERVEHICLES; vehicleslot++)
					{
						if(IsPlayerInVehicle(playerid, PlayerVehicleInfo[playerid][vehicleslot][pvId]))
						{
							if(vehicleslot != -1) {
								mysql_format(MainPipeline, string, sizeof(string), "UPDATE `vehicles` SET `pvFuel` = %0.5f WHERE `id` = '%d'", VehicleFuel[vehicleid], PlayerVehicleInfo[playerid][vehicleslot][pvSlotId]);
								mysql_tquery(MainPipeline, string, "OnQueryFinish", "ii", SENDDATA_THREAD, playerid);
							}
						}
					}
					return 1;
				}
				SendClientMessageEx(playerid, COLOR_GREY, "Ban khong the de nghi do xang cho chinh ban."); return 1;
			}
			format(string, sizeof(string), "* Ban de nghe %s do xang %.2f chiec xe gia $%d.",GetPlayerNameEx(giveplayerid),fueltogive,money);
			SendClientMessageEx(playerid, COLOR_LIGHTBLUE, string);
			format(string, sizeof(string), "* Tho sua xe %s muon do xang %.2f vao xe cua ban gia $%d, go /chapnhan refill de chap nhan.",GetPlayerNameEx(playerid),fueltogive,money);
			SendClientMessageEx(giveplayerid, COLOR_LIGHTBLUE, string);
			PlayerInfo[playerid][pMechTime] = gettime()+60;
			RefillOffer[giveplayerid] = playerid;
			RefillPrice[giveplayerid] = money;
		}
		else
		{
			SendClientMessageEx(playerid, COLOR_GREY, "That person is not near you, or isn't in a car.");
		}
	}
	else SendClientMessageEx(playerid, COLOR_GREY, "Invalid player specified.");
	return 1;
}

CMD:repair(playerid, params[])
{
	if(PlayerInfo[playerid][pJob] != 7 && PlayerInfo[playerid][pJob2] != 7 && PlayerInfo[playerid][pJob3] != 7)
	{
		SendClientMessageEx(playerid, COLOR_GREY, "   You are not a Car Mechanic!");
		return 1;
	}
	if(IsPlayerInAnyVehicle(playerid)) return SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong the sua chua khi dang trong xe.");

	new string[128];
	if(gettime() < PlayerInfo[playerid][pMechTime])
	{
		format(string, sizeof(string), "Ban phai doi %d giay!", PlayerInfo[playerid][pMechTime]-gettime());
		SendClientMessageEx(playerid, COLOR_GRAD1,string);
		return 1;
	}
	if(GetPVarInt(playerid, "EventToken")) {
		return SendClientMessageEx(playerid, COLOR_GRAD1, "You can't use this while in an event.");
	}
	new giveplayerid, money;
	if(sscanf(params, "ud", giveplayerid, money)) return SendClientMessageEx(playerid, COLOR_GREY, "USAGE: /repair [player] [price]");

	if(PlayerInfo[playerid][pTire] > 0)
	{
		if(money < 1 || money > 10000) { SendClientMessageEx(playerid, COLOR_GREY, "   Gia khong the thap hon $1 hoac cao hon $10,000!"); return 1; }
		if(IsPlayerConnected(giveplayerid))
		{
			if(giveplayerid != INVALID_PLAYER_ID)
			{
			    new closestcar = GetClosestCar(playerid);

	  			if(IsPlayerInRangeOfVehicle(playerid, closestcar, 8.0))
	  			{
					if(ProxDetectorS(8.0, playerid, giveplayerid)&& IsPlayerInAnyVehicle(giveplayerid))
					{
						if(giveplayerid == playerid) { SendClientMessageEx(playerid, COLOR_GREY, "   Khong the lam dieu do!"); return 1; }
	                    if(!IsABike(closestcar) && !IsAPlane(closestcar))
						{
							new engine,lights,alarm,doors,bonnet,boot,objective;
							GetVehicleParamsEx(closestcar,engine,lights,alarm,doors,bonnet,boot,objective);
							if(bonnet == VEHICLE_PARAMS_OFF || bonnet == VEHICLE_PARAMS_UNSET)
							{
								SendClientMessageEx(playerid, COLOR_GRAD1, "Mui xe phai duoc mo de sua chua xe.");
								return 1;
							}
						}
						format(string, sizeof(string), "* Ban de nghi %s sua xe cua ho gia $%d .",GetPlayerNameEx(giveplayerid),money);
						SendClientMessageEx(playerid, COLOR_LIGHTBLUE, string);
						format(string, sizeof(string), "* Tho sua xe %s muon sua xe cua ban gia $%d, (go /chapnhan repair) de chap nhan.",GetPlayerNameEx(playerid),money);
						SendClientMessageEx(giveplayerid, COLOR_LIGHTBLUE, string);
						PlayerInfo[playerid][pMechTime] = gettime()+60;
						SetPVarInt(playerid, "RepairOfferTo", giveplayerid);
						RepairOffer[giveplayerid] = playerid;
						RepairPrice[giveplayerid] = money;
					}
					else
					{
						SendClientMessageEx(playerid, COLOR_GREY, "   That person is not near you / not in a car.");
					}
				}
				else
				{
				    SendClientMessageEx(playerid, COLOR_GREY, "   You are not near any vehicle.");
				}
			}
		}
		else
		{
			SendClientMessageEx(playerid, COLOR_GREY, "   That person is offline.");
		}
	}
	else
	{
		SendClientMessageEx(playerid, COLOR_GREY, "   You do not have any tires, buy one from a craftsman.");
	}
	return 1;
}
