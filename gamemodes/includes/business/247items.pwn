/*

	 /$$   /$$  /$$$$$$          /$$$$$$$  /$$$$$$$
	| $$$ | $$ /$$__  $$        | $$__  $$| $$__  $$
	| $$$$| $$| $$  \__/        | $$  \ $$| $$  \ $$
	| $$ $$ $$| $$ /$$$$ /$$$$$$| $$$$$$$/| $$$$$$$/
	| $$  $$$$| $$|_  $$|______/| $$__  $$| $$____/
	| $$\  $$$| $$  \ $$        | $$  \ $$| $$
	| $$ \  $$|  $$$$$$/        | $$  | $$| $$
	|__/  \__/ \______/         |__/  |__/|__/

						24/7 Items

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

/*CMD:tie(playerid, params[])
{
	if(PlayerInfo[playerid][pRope] > 0)
	{
		new string[128], giveplayerid;
		if(sscanf(params, "u", giveplayerid)) return SendClientMessageEx(playerid, COLOR_GREY, "USAGE: /tie [player]");

		if(IsPlayerConnected(giveplayerid))
		{
			if(PlayerTied[giveplayerid] > 0)
			{
				SendClientMessageEx(playerid, COLOR_GREY, "   person already Tied!");
				return 1;
			}
			if(PlayerCuffed[giveplayerid] != 0) return SendClientMessageEx(playerid, COLOR_GREY, "You can't tie a cuffed/tazed player.");
			if(PlayerInfo[giveplayerid][pJailTime] > 0)
			{
				SendClientMessageEx(playerid, COLOR_WHITE, "You can't tie a prisoned player." );
				return 1;
			}
			if( PlayerInfo[playerid][pRope] == 0 )
			{
				SendClientMessageEx( playerid, COLOR_WHITE, "You don't have any rope left." );
			}
			else
			{
				if (ProxDetectorS(8.0, playerid, giveplayerid))
				{
					new car = GetPlayerVehicleID(playerid);
					if(giveplayerid == playerid) { SendClientMessageEx(playerid, COLOR_GREY, "You cannot tie up yourself!"); return 1; }
					if(IsPlayerInAnyVehicle(playerid) && GetPlayerState(playerid) == 2 && IsPlayerInVehicle(giveplayerid, car))
					{
						if(PlayerCuffed[giveplayerid] == 1 || PlayerCuffed[giveplayerid] == 2) {
							SendClientMessageEx(playerid, COLOR_GRAD2, "You can't do this right now.");
							return 1;
						}

						format(string, sizeof(string), "* You were tied up by %s.", GetPlayerNameEx(playerid));
						SendClientMessageEx(giveplayerid, COLOR_LIGHTBLUE, string);
						format(string, sizeof(string), "* You tied %s up.", GetPlayerNameEx(giveplayerid));
						SendClientMessageEx(playerid, COLOR_LIGHTBLUE, string);
						switch( PlayerInfo[giveplayerid][pSex] ) {
							case 1: format(string, sizeof(string), "* %s ties %s up, so he won't go anywhere.", GetPlayerNameEx(playerid), GetPlayerNameEx(giveplayerid));
							case 2: format(string, sizeof(string), "* %s ties %s up, so she won't go anywhere.", GetPlayerNameEx(playerid), GetPlayerNameEx(giveplayerid));
						}
						ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
						GameTextForPlayer(giveplayerid, "~r~Tied", 2500, 3);
						SetPVarInt(giveplayerid, "IsFrozen", 1);
						TogglePlayerControllable(giveplayerid, 0);
						PlayerTied[giveplayerid] = 1;
						PlayerInfo[playerid][pRope]--;
					}
					else
					{
						SendClientMessageEx(playerid, COLOR_GREY, "   person not in your Car, or you are not the Driver!");
						return 1;
					}
				}
				else
				{
					SendClientMessageEx(playerid, COLOR_GREY, "Nguoi choi do khong gan ban.");
					return 1;
				}
			}

		}
		else
		{
			SendClientMessageEx(playerid, COLOR_GREY, "Invalid player specified.");
			return 1;
		}
	}
	else
	{
		SendClientMessageEx(playerid, COLOR_GREY, "   You don't have a Rope!");
	}
	return 1;
}

CMD:untie(playerid, params[])
{
	new string[128], giveplayerid;
	if(sscanf(params, "u", giveplayerid)) return SendClientMessageEx(playerid, COLOR_GREY, "USAGE: /untie [player]");

	if(IsPlayerConnected(giveplayerid))
	{
		if (ProxDetectorS(8.0, playerid, giveplayerid))
		{
			if(giveplayerid == playerid) { SendClientMessageEx(playerid, COLOR_GREY, "You cannot Untie yourself!"); return 1; }
			if(PlayerCuffed[giveplayerid] != 0) return SendClientMessageEx(playerid, COLOR_GREY, "You can't untie a cuffed/tazed player.");
			if(PlayerTied[giveplayerid])
			{
				DeletePVar(giveplayerid, "IsFrozen");
				format(string, sizeof(string), "* You were untied by %s.", GetPlayerNameEx(playerid));
				SendClientMessageEx(giveplayerid, COLOR_LIGHTBLUE, string);
				format(string, sizeof(string), "* You untied %s.", GetPlayerNameEx(giveplayerid));
				SendClientMessageEx(playerid, COLOR_LIGHTBLUE, string);
				GameTextForPlayer(giveplayerid, "~g~Untied", 2500, 3);
				TogglePlayerControllable(giveplayerid, 1);
				PlayerTied[giveplayerid] = 0;
			}
			else
			{
				SendClientMessageEx(playerid, COLOR_GREY, "   That person isn't Tied up!");
				return 1;
			}
		}
		else
		{
			SendClientMessageEx(playerid, COLOR_GREY, "That person isn't near you.");
			return 1;
		}
	}
	else
	{
		SendClientMessageEx(playerid, COLOR_GREY, "Invalid player specified.");
		return 1;
	}
	return 1;
}*/


CMD:tie(playerid, params[])
{
	if(PlayerInfo[playerid][pRope] > 0)
	{
		new id;
		if(sscanf(params, "u", id)) return SendClientMessageEx(playerid, COLOR_WHITE, "SYNTAX: /tie [playerid]");

		if(IsPlayerConnected(id))
		{
			if(PlayerTied[id] > 0) return SendClientMessageEx(playerid, -1, "Nguoi choi do dang bi troi.");
			if(GetPVarInt(playerid, "Injured") || PlayerCuffed[playerid] > 0 || GetPVarInt(playerid, "IsInArena") || GetPVarInt(playerid, "EventToken") != 0 || PlayerInfo[playerid][pHospital] > 0) return SendClientMessageEx(playerid, -1, "Ban khong the lam dieu nay ngay bay gio!");
			if(PlayerCuffed[id] != 0) return SendClientMessageEx(playerid, -1, "Ban khong the lam dieu nay voi ho bay gio.");

			if(ProxDetectorS(8.0, playerid, id))
			{
				szMiscArray[0] = 0;

				if(id == playerid) return SendClientMessageEx(playerid, -1, "Ban khong the troi chinh ban!");
				if(GetPVarInt(id, "Injured") == 1) return SendClientMessageEx(playerid, COLOR_GREY, "Ban khong the troi ai do trong tinh trang bi thuong.");
				if(GetPlayerSpecialAction(id) != SPECIAL_ACTION_HANDSUP) return SendClientMessage(playerid, -1, "Nguoi choi nay khong bi go bo.");

				format(szMiscArray, sizeof(szMiscArray), "* %s da su dung day thung de troi %s.", GetPlayerNameEx(playerid), GetPlayerNameEx(id));
				ProxDetector(30.0, playerid, szMiscArray, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);

				ClearAnimationsEx(id);
				SetPlayerSpecialAction(id,SPECIAL_ACTION_NONE);
				SetPlayerSpecialAction(id,SPECIAL_ACTION_CUFFED);

				PlayerTied[id] = 1;
				PlayerInfo[playerid][pRope]--;
			}
			else return SendClientMessageEx(playerid, -1, "Nguoi choi do khong gan ban.");
		}
		else return SendClientMessageEx(playerid, -1, "Nguoi choi do da mat ket noi.");
	}
	else SendClientMessageEx(playerid, -1, "Ban khong co day thung!");
	return 1;
}

CMD:untie(playerid, params[])
{
	new id;
	if(sscanf(params, "u", id)) return SendClientMessageEx(playerid, COLOR_WHITE, "SYNTAX: /untie [playerid]");

	if(IsPlayerConnected(id))
	{
		if(PlayerTied[id] == 0) return SendClientMessageEx(playerid, -1, "Nguoi choi do khong bi troi.");
		if(GetPVarInt(playerid, "Injured") || PlayerCuffed[playerid] > 0 || GetPVarInt(playerid, "IsInArena") || GetPVarInt(playerid, "EventToken") != 0 || PlayerInfo[playerid][pHospital] > 0) return SendClientMessageEx(playerid, -1, "Ban khong the lam dieu nay ngay bay gio!");

		if(ProxDetectorS(8.0, playerid, id))
		{
			szMiscArray[0] = 0;

			if(id == playerid) return SendClientMessageEx(playerid, -1, "Ban khong the coi troi chinh ban!");

			format(szMiscArray, sizeof(szMiscArray), "* %s da coi troi %s.", GetPlayerNameEx(playerid), GetPlayerNameEx(id));
			ProxDetector(30.0, playerid, szMiscArray, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);

			SetPlayerSpecialAction(id,SPECIAL_ACTION_NONE);
			PlayerTied[id] = 0;
		}
		else return SendClientMessageEx(playerid, -1, "Nguoi choi do khong gan ban.");
	}
	else SendClientMessageEx(playerid, -1, "Nguoi choi do mat ket noi.");
	return 1;
}

CMD:blindfold(playerid, params[])
{
	if(PlayerInfo[playerid][pRags] > 0)
	{
		new id;
		if(sscanf(params, "u", id)) return SendClientMessage(playerid, COLOR_WHITE, "SYNTAX: /blindfold [playerid]");

		if(IsPlayerConnected(id))
		{
			if(PlayerTied[id] == 0) return SendClientMessageEx(playerid, -1, "Nguoi ban muon bit mat phai bi troi.");
			if(GetPVarInt(playerid, "Injured") || PlayerCuffed[playerid] > 0 || GetPVarInt(playerid, "IsInArena") || GetPVarInt(playerid, "EventToken") != 0 || PlayerInfo[playerid][pHospital] > 0) return SendClientMessageEx(playerid, -1, "Ban khong the lam dieu nay ngay bay gio!");

			if(ProxDetectorS(8.0, playerid, id))
			{
				switch(GetPVarInt(id, "Blindfolded"))
				{
					case 0:
					{
						szMiscArray[0] = 0;

						if(id == playerid) return SendClientMessageEx(playerid, -1, "Ban khong the bit mat chinh ban!");

						format(szMiscArray, sizeof(szMiscArray), "* %s da dat mot mieng gie xung quanh dau %s's, lam mo mat ho.", GetPlayerNameEx(playerid), GetPlayerNameEx(id));
						ProxDetector(30.0, playerid, szMiscArray, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);

						TextDrawShowForPlayer(id, BFText);
				        SetPVarInt(id, "Blindfolded", 1);
				        PlayerInfo[playerid][pRags]--;
					}
					default:
					{
						szMiscArray[0] = 0;

						if(id == playerid) return SendClientMessageEx(playerid, -1, "Ban khong the mo bit mat chinh ban!");

						format(szMiscArray, sizeof(szMiscArray), "* %s da lay mieng gie xung quanh dau %s's ra ngoai.", GetPlayerNameEx(playerid), GetPlayerNameEx(id));
						ProxDetector(30.0, playerid, szMiscArray, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);

						TextDrawHideForPlayer(id, BFText);
				        DeletePVar(id, "Blindfolded");
					}
				}
			}
			else return SendClientMessageEx(playerid, -1, "Nguoi choi do khong gan ban.");
		}
		else return SendClientMessageEx(playerid, -1, "Nguoi choi do mat ket noi.");
	}
	else SendClientMessage(playerid, COLOR_WHITE, "Ban khong co mieng gie nao!");
	return 1;
}

CMD:usesprunk(playerid, params[])
{
	if(GetPVarType(playerid, "IsInArena")) return SendClientMessageEx(playerid, COLOR_WHITE, "Ban khong the lam dieu nay khi dang o trong mot dau truong!");
	if(HungerPlayerInfo[playerid][hgInEvent] != 0) return SendClientMessageEx(playerid, COLOR_GREY, "   Ban khong the lam dieu nay khi dang o trong Hunger Games Event!");
    #if defined zombiemode
	if(zombieevent == 1 && GetPVarType(playerid, "pIsZombie")) return SendClientMessageEx(playerid, COLOR_GREY, "Zombies can't use this.");
	#endif
	if(PlayerInfo[playerid][pSprunk] > 0)
	{
		if(GetPVarInt(playerid, "UsingSprunk") == 1) return SendClientMessageEx(playerid, COLOR_GRAD1, "You're already drinking a sprunk can.");
		if( PlayerCuffed[playerid] >= 1 || GetPVarInt(playerid, "Injured") == 1 || PlayerInfo[playerid][pHospital] > 0)
		{
			SendClientMessageEx(playerid, COLOR_WHITE, "You can't do this right now.");
			return 1;
		}

		if(IsPlayerInAnyVehicle(playerid))
		{
			if(IsABike(GetPlayerVehicleID(playerid)))
			{
				SendClientMessageEx(playerid, COLOR_WHITE, "You can't do this on a bike.");
				return 1;
			}
		}
		new string[128];
		SetPlayerSpecialAction(playerid,SPECIAL_ACTION_DRINK_SPRUNK);
		format(string, sizeof(string), "* %s opens a can of sprunk.", GetPlayerNameEx(playerid));
		ProxDetector(15.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
		SetPVarInt(playerid, "UsingSprunk", 1);
		SetPVarInt(playerid, "DrinkCooledDown", 1);
		PlayerInfo[playerid][pSprunk]--;
		return 1;
	}
	else
	{
		SendClientMessageEx(playerid, COLOR_GREY, "You don't have any sprunk, buy some from the 24/7!");
		return 1;
	}
}

CMD:usecigar(playerid, params[])
{
	if(PlayerInfo[playerid][pCigar] > 0)
	{
		if( PlayerCuffed[playerid] >= 1 || GetPVarInt(playerid, "Injured") == 1 || PlayerInfo[playerid][pHospital] > 0)
		{
			SendClientMessageEx(playerid, COLOR_WHITE, "You can't do this right now.");
			return 1;
		}
		new string[128];
		SetPlayerSpecialAction(playerid,SPECIAL_ACTION_SMOKE_CIGGY);
		format(string, sizeof(string), "* %s takes out a cigar and lights it.", GetPlayerNameEx(playerid));
		ProxDetector(15.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
		PlayerInfo[playerid][pCigar]--;
		return 1;
	}
	else
	{
		SendClientMessageEx(playerid, COLOR_GREY, "You don't have any cigars, buy some from the 24/7!");
		return 1;
	}
}

CMD:sonxe(playerid, params[])
{
	return cmd_paintcar(playerid, "");
}
CMD:paintcar(playerid, params[]) {
	new iPaintID;
	if(!IsPlayerInAnyVehicle(playerid)) return SendClientMessageEx(playerid, COLOR_GRAD2, "You're not in a vehicle.");
	if(PlayerInfo[playerid][pSpraycan] == 0) return SendClientMessageEx(playerid, COLOR_GRAD2, "Your spraycan is empty.");
	if(sscanf(params, "i", iPaintID)) return SendClientMessageEx(playerid, COLOR_GREY, "USAGE: /paintcar [0-6] (3 to remove a paintjob)");
	if(!(0 <= iPaintID <= 6)) return SendClientMessageEx(playerid, COLOR_GRAD2, "The specified paint job ID must be between 0 and 6.");
	
	for(new i = 0; i < MAX_PLAYERVEHICLES; i++)
	{
		if(IsPlayerInVehicle(playerid, PlayerVehicleInfo[playerid][i][pvId]))
		{
			PlayerVehicleInfo[playerid][i][pvPaintJob] = iPaintID;
			ChangeVehiclePaintjob(PlayerVehicleInfo[playerid][i][pvId], iPaintID);
			PlayerInfo[playerid][pSpraycan]--;
			g_mysql_SaveVehicle(playerid, i);
			return SendClientMessageEx(playerid, COLOR_GRAD2, "Ban da su dung binh son xe thanh cong cho xe cua ban.");
		}
	}
	for(new i = 0; i < sizeof(VIPVehicles); i++)
	{
		if(IsPlayerInVehicle(playerid, VIPVehicles[i]))
		{
			ChangeVehiclePaintjob(VIPVehicles[i], iPaintID);
			PlayerInfo[playerid][pSpraycan]--;
			return SendClientMessageEx(playerid, COLOR_GRAD2, "Ban da su dung binh son xe thanh cong cho xe cua ban.");		
		}
	}
	for(new i = 0; i < sizeof(FamedVehicles); i++)
	{
		if(IsPlayerInVehicle(playerid, FamedVehicles[i]))
		{
			ChangeVehiclePaintjob(FamedVehicles[i], iPaintID);
			PlayerInfo[playerid][pSpraycan]--;
			return SendClientMessageEx(playerid, COLOR_GRAD2, "Ban da su dung binh son xe thanh cong cho xe cua ban.");
		}
	}	
	SendClientMessageEx(playerid, COLOR_GREY, "You can't spray other people's vehicles.");
	return 1;
}

/*CMD:buylock(playerid, params[])
{
    if(IsAt247(playerid))
	{
	    ShowPlayerDialogEx(playerid, DIALOG_CDLOCKBUY, DIALOG_STYLE_LIST, "24/7", "Alarm Lock		$10000\nElectric Lock		$500000\nIndustrial Lock		$50000", "Buy", "Cancel");
		return 1;
	}
	else
	{
	    SendClientMessageEx(playerid, COLOR_GRAD2, "   You are not in a 24-7 !");
	}
	return 1;
}*/
