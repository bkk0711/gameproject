/*

	 /$$   /$$  /$$$$$$          /$$$$$$$  /$$$$$$$
	| $$$ | $$ /$$__  $$        | $$__  $$| $$__  $$
	| $$$$| $$| $$  \__/        | $$  \ $$| $$  \ $$
	| $$ $$ $$| $$ /$$$$ /$$$$$$| $$$$$$$/| $$$$$$$/
	| $$  $$$$| $$|_  $$|______/| $$__  $$| $$____/
	| $$\  $$$| $$  \ $$        | $$  \ $$| $$
	| $$ \  $$|  $$$$$$/        | $$  | $$| $$
	|__/  \__/ \______/         |__/  |__/|__/

						Upgrades System

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

CMD:resetupgrades(playerid, params[]) {
	if(gPlayerLogged{playerid} == 0) {
		SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong dang nhap.");
	}
	else if (GetPlayerCash(playerid) < 10000) {
		SendClientMessageEx(playerid, COLOR_GRAD1, "Ban can $10,000 de thiet lap lai diem nang cap.");
	}
	else if (PlayerInfo[playerid][pLevel] < 2) {
		SendClientMessageEx(playerid, COLOR_GRAD1, "Ban phai co it nhat cap do 2.");
	}
	else {
		PlayerInfo[playerid][gPupgrade] = (PlayerInfo[playerid][pLevel]-1)*2;
		PlayerInfo[playerid][pSHealth] = 0.0;

		if(PlayerInfo[playerid][pPhousekey] != INVALID_HOUSE_ID) {
			HouseInfo[PlayerInfo[playerid][pPhousekey]][hGLUpgrade] = 1;
			SaveHouse(PlayerInfo[playerid][pPhousekey]);
		}
		if(PlayerInfo[playerid][pPhousekey2] != INVALID_HOUSE_ID) {
			HouseInfo[PlayerInfo[playerid][pPhousekey2]][hGLUpgrade] = 1;
			SaveHouse(PlayerInfo[playerid][pPhousekey2]);
		}
		if(PlayerInfo[playerid][pPhousekey3] != INVALID_HOUSE_ID) {
			HouseInfo[PlayerInfo[playerid][pPhousekey3]][hGLUpgrade] = 1;
			SaveHouse(PlayerInfo[playerid][pPhousekey3]);
		}	
		for(new d = 0 ; d < MAX_PLAYERVEHICLES; d++)
		{
			PlayerVehicleInfo[playerid][d][pvWepUpgrade] = 0;
		}

		GivePlayerCash(playerid,-100000);
		PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);

		new	szMessage[73];

		format(szMessage, sizeof(szMessage), "Ban da thiet lap lai nang cap cua ban - bay gio ban co %i diem nang cap.", PlayerInfo[playerid][gPupgrade]);
		SendClientMessageEx(playerid, COLOR_GRAD2, szMessage);
	}
	return 1;
}
// Auto Levels
LevelCheck(playerid)
{
	if (gPlayerLogged{playerid} != 0)
	{
		if(PlayerInfo[playerid][pLevel] >= 0)
		{
			new nxtlevel = PlayerInfo[playerid][pLevel]+1;
			new expamount = nxtlevel*4;

			if (PlayerInfo[playerid][pExp] < expamount)
			{
				return 0;
			}
			else if(PlayerInfo[playerid][pExp] > expamount)
			{
				while(PlayerInfo[playerid][pExp] > expamount) 
				{
					PlayerInfo[playerid][pLevel]++;
					PlayerInfo[playerid][pExp] = PlayerInfo[playerid][pExp]-expamount;
					PlayerInfo[playerid][gPupgrade] = PlayerInfo[playerid][gPupgrade]+2;
					SetPlayerScore(playerid, PlayerInfo[playerid][pLevel]);
					nxtlevel = PlayerInfo[playerid][pLevel]+1;
					expamount = nxtlevel*4;
				}
				SendClientMessageEx(playerid, COLOR_WHITE, "Bay gio ban co qua nhieu diem kinh nghiem, do do cap do cua ban bay gio la %d.", PlayerInfo[playerid][pLevel]);
				return 1;
			}
			else
			{
				new string[92];
				format(string, sizeof(string), "~g~LEN CAP~n~~w~Ban dang o cap do %d", nxtlevel);
				PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
				PlayerInfo[playerid][pLevel]++;
				PlayerInfo[playerid][pExp] = PlayerInfo[playerid][pExp]-expamount;
				PlayerInfo[playerid][gPupgrade] = PlayerInfo[playerid][gPupgrade]+2;
				GameTextForPlayer(playerid, string, 5000, 1);
				format(string, sizeof(string), "Ban da len cap %d, va nhan duoc %i diem nang cap! /upgrade de su dung.", nxtlevel, PlayerInfo[playerid][gPupgrade]);
				SendClientMessageEx(playerid, COLOR_GRAD1, string);
				SetPlayerScore(playerid, PlayerInfo[playerid][pLevel]);
				if(PlayerInfo[playerid][pLevel] == 3)
				{
				    new szQuery[128],
						szString[128],
						szReferrer = ReturnUser(PlayerInfo[playerid][pReferredBy]);

					if(strcmp(PlayerInfo[playerid][pReferredBy], "Nobody") != 0)
					{
					    if(IsPlayerConnected(szReferrer))
					    {
					        if(PlayerInfo[szReferrer][pRefers] < 5 && PlayerInfo[szReferrer][pRefers] > 0)
					        {
					            PlayerInfo[szReferrer][pCredits] += CREDITS_AMOUNT_REFERRAL;
	            				PlayerInfo[szReferrer][pRefers] ++;
								mysql_format(MainPipeline, szQuery, sizeof(szQuery), "UPDATE `accounts` SET `Credits`=%d WHERE `Username` = '%s'", PlayerInfo[szReferrer][pCredits], GetPlayerNameExt(szReferrer));
								mysql_tquery(MainPipeline, szQuery, "OnQueryFinish", "ii", SENDDATA_THREAD, playerid);
								format(szString, sizeof(szString), "%s(%d) da nhan duoc %d credits cho gioi thieu nguoi choi (Nguoi choi dat cap do 3)", GetPlayerNameEx(szReferrer), GetPlayerSQLId(szReferrer), CREDITS_AMOUNT_REFERRAL);
								Log("logs/referral.log", szString);
				        		format(string, sizeof(string), "Nguoi ban '%s' ma ban gioi thieu den may chu da dat den cap do 3. Vi vay, ban da nhan duoc 100 Credits.", GetPlayerNameEx(playerid));
						        SendClientMessageEx(szReferrer, COLOR_LIGHTBLUE, string);
						    }
					        else if(PlayerInfo[szReferrer][pRefers] == 5)
					        {
	            				PlayerInfo[szReferrer][pCredits] += CREDITS_AMOUNT_REFERRAL*5;
	            				PlayerInfo[szReferrer][pRefers] ++;
								mysql_format(MainPipeline, szQuery, sizeof(szQuery), "UPDATE `accounts` SET `Credits`=%d WHERE `Username` = '%s'", PlayerInfo[szReferrer][pCredits], GetPlayerNameExt(szReferrer));
								mysql_tquery(MainPipeline, szQuery, "OnQueryFinish", "ii", SENDDATA_THREAD, playerid);
								format(szString, sizeof(szString), "%s(%d) da nhan duoc %d credits cho gioi thieu nguoi choi (Nguoi choi dat cap do 3)", GetPlayerNameEx(szReferrer), GetPlayerSQLId(szReferrer), CREDITS_AMOUNT_REFERRAL*5);
								Log("logs/referral.log", szString);
				        		format(string, sizeof(string), "Nguoi ban '%s' ma ban gioi thieu den may chu da dat den cap do 3. Vi vay, ban da nhan duoc 500 Credits.", GetPlayerNameEx(playerid));
						        SendClientMessageEx(szReferrer, COLOR_LIGHTBLUE, string);
							}
							else if(PlayerInfo[szReferrer][pRefers] < 10 && PlayerInfo[szReferrer][pRefers] > 5)
					        {
					            PlayerInfo[szReferrer][pCredits] += CREDITS_AMOUNT_REFERRAL;
	            				PlayerInfo[szReferrer][pRefers] ++;
								mysql_format(MainPipeline, szQuery, sizeof(szQuery), "UPDATE `accounts` SET `Credits`=%d WHERE `Username` = '%s'", PlayerInfo[szReferrer][pCredits], GetPlayerNameExt(szReferrer));
								mysql_tquery(MainPipeline, szQuery, "OnQueryFinish", "ii", SENDDATA_THREAD, playerid);
								format(szString, sizeof(szString), "%s(%d) da nhan duoc %d credits cho gioi thieu nguoi choi (Nguoi choi dat cap do 3)", GetPlayerNameEx(szReferrer), GetPlayerSQLId(szReferrer), CREDITS_AMOUNT_REFERRAL);
								Log("logs/referral.log", szString);
				        		format(string, sizeof(string), "Nguoi ban '%s' ma ban gioi thieu den may chu da dat den cap do 3. Vi vay, ban da nhan duoc 100 Credits.", GetPlayerNameEx(playerid));
						        SendClientMessageEx(szReferrer, COLOR_LIGHTBLUE, string);
						    }
							else if(PlayerInfo[szReferrer][pRefers] == 10)
							{
							    PlayerInfo[szReferrer][pCredits] += CREDITS_AMOUNT_REFERRAL*10;
	            				PlayerInfo[szReferrer][pRefers] ++;
								mysql_format(MainPipeline, szQuery, sizeof(szQuery), "UPDATE `accounts` SET `Credits`=%d WHERE `Username` = '%s'", PlayerInfo[szReferrer][pCredits], GetPlayerNameExt(szReferrer));
								mysql_tquery(MainPipeline, szQuery, "OnQueryFinish", "ii", SENDDATA_THREAD, playerid);
								format(szString, sizeof(szString), "%s(%d) da nhan duoc %d credits cho gioi thieu nguoi choi (Nguoi choi dat cap do 3)", GetPlayerNameEx(szReferrer), GetPlayerSQLId(szReferrer), CREDITS_AMOUNT_REFERRAL*10);
								Log("logs/referral.log", szString);
				        		format(string, sizeof(string), "Nguoi ban '%s' ma ban gioi thieu den may chu da dat den cap do 3. Vi vay, ban da nhan duoc 1000 Credits.", GetPlayerNameEx(playerid));
						        SendClientMessageEx(szReferrer, COLOR_LIGHTBLUE, string);
							}
							else if(PlayerInfo[szReferrer][pRefers] < 15 && PlayerInfo[szReferrer][pRefers] > 10)
					        {
					            PlayerInfo[szReferrer][pCredits] += CREDITS_AMOUNT_REFERRAL;
	            				PlayerInfo[szReferrer][pRefers] ++;
								mysql_format(MainPipeline, szQuery, sizeof(szQuery), "UPDATE `accounts` SET `Credits`=%d WHERE `Username` = '%s'", PlayerInfo[szReferrer][pCredits], GetPlayerNameExt(szReferrer));
								mysql_tquery(MainPipeline, szQuery, "OnQueryFinish", "ii", SENDDATA_THREAD, playerid);
								format(szString, sizeof(szString), "%s(%d) da nhan duoc %d credits cho gioi thieu nguoi choi (Nguoi choi dat cap do 3)", GetPlayerNameEx(szReferrer), GetPlayerSQLId(szReferrer), CREDITS_AMOUNT_REFERRAL);
								Log("logs/referral.log", szString);
				        		format(string, sizeof(string), "Nguoi ban '%s' ma ban gioi thieu den may chu da dat den cap do 3. Vi vay, ban da nhan duoc 100 Credits.", GetPlayerNameEx(playerid));
						        SendClientMessageEx(szReferrer, COLOR_LIGHTBLUE, string);
						    }
							else if(PlayerInfo[szReferrer][pRefers] == 15)
							{
							    PlayerInfo[szReferrer][pCredits] += CREDITS_AMOUNT_REFERRAL*15;
	            				PlayerInfo[szReferrer][pRefers] ++;
								mysql_format(MainPipeline, szQuery, sizeof(szQuery), "UPDATE `accounts` SET `Credits`=%d WHERE `Username` = '%s'", PlayerInfo[szReferrer][pCredits], GetPlayerNameExt(szReferrer));
								mysql_tquery(MainPipeline, szQuery, "OnQueryFinish", "ii", SENDDATA_THREAD, playerid);
								format(szString, sizeof(szString), "%s(%d) da nhan duoc %d credits cho gioi thieu nguoi choi (Nguoi choi dat cap do 3)", GetPlayerNameEx(szReferrer), GetPlayerSQLId(szReferrer), CREDITS_AMOUNT_REFERRAL*15);
								Log("logs/referral.log", szString);
				        		format(string, sizeof(string), "Nguoi ban '%s' ma ban gioi thieu den may chu da dat den cap do 3. Vi vay, ban da nhan duoc 1500 Credits.", GetPlayerNameEx(playerid));
						        SendClientMessageEx(szReferrer, COLOR_LIGHTBLUE, string);
							}
							else if(PlayerInfo[szReferrer][pRefers] < 20 && PlayerInfo[szReferrer][pRefers] > 15)
					        {
					            PlayerInfo[szReferrer][pCredits] += CREDITS_AMOUNT_REFERRAL;
	            				PlayerInfo[szReferrer][pRefers] ++;
								mysql_format(MainPipeline, szQuery, sizeof(szQuery), "UPDATE `accounts` SET `Credits`=%d WHERE `Username` = '%s'", PlayerInfo[szReferrer][pCredits], GetPlayerNameExt(szReferrer));
								mysql_tquery(MainPipeline, szQuery, "OnQueryFinish", "ii", SENDDATA_THREAD, playerid);
								format(szString, sizeof(szString), "%s(%d) da nhan duoc %d credits cho gioi thieu nguoi choi (Nguoi choi dat cap do 3)", GetPlayerNameEx(szReferrer), GetPlayerSQLId(szReferrer), CREDITS_AMOUNT_REFERRAL);
								Log("logs/referral.log", szString);
				        		format(string, sizeof(string), "Nguoi ban '%s' ma ban gioi thieu den may chu da dat den cap do 3. Vi vay, ban da nhan duoc 100 Credits.", GetPlayerNameEx(playerid));
						        SendClientMessageEx(szReferrer, COLOR_LIGHTBLUE, string);
						    }
							else if(PlayerInfo[szReferrer][pRefers] == 20)
							{
							    PlayerInfo[szReferrer][pCredits] += CREDITS_AMOUNT_REFERRAL*20;
	            				PlayerInfo[szReferrer][pRefers] ++;
								mysql_format(MainPipeline, szQuery, sizeof(szQuery), "UPDATE `accounts` SET `Credits`=%d WHERE `Username` = '%s'", PlayerInfo[szReferrer][pCredits], GetPlayerNameExt(szReferrer));
								mysql_tquery(MainPipeline, szQuery, "OnQueryFinish", "ii", SENDDATA_THREAD, playerid);
								format(szString, sizeof(szString), "%s(%d) da nhan duoc %d credits cho gioi thieu nguoi choi (Nguoi choi dat cap do 3)", GetPlayerNameEx(szReferrer), GetPlayerSQLId(szReferrer), CREDITS_AMOUNT_REFERRAL*20);
								Log("logs/referral.log", szString);
				        		format(string, sizeof(string), "Nguoi ban '%s' ma ban gioi thieu den may chu da dat den cap do 3. Vi vay, ban da nhan duoc 2000 Credits.", GetPlayerNameEx(playerid));
						        SendClientMessageEx(szReferrer, COLOR_LIGHTBLUE, string);
							}
							else if(PlayerInfo[szReferrer][pRefers] < 25 && PlayerInfo[szReferrer][pRefers] > 20)
					        {
					            PlayerInfo[szReferrer][pCredits] += CREDITS_AMOUNT_REFERRAL;
	            				PlayerInfo[szReferrer][pRefers] ++;
								mysql_format(MainPipeline, szQuery, sizeof(szQuery), "UPDATE `accounts` SET `Credits`=%d WHERE `Username` = '%s'", PlayerInfo[szReferrer][pCredits], GetPlayerNameExt(szReferrer));
								mysql_tquery(MainPipeline, szQuery, "OnQueryFinish", "ii", SENDDATA_THREAD, playerid);
								format(szString, sizeof(szString), "%s(%d) da nhan duoc %d credits cho gioi thieu nguoi choi (Nguoi choi dat cap do 3)", GetPlayerNameEx(szReferrer), GetPlayerSQLId(szReferrer), CREDITS_AMOUNT_REFERRAL);
								Log("logs/referral.log", szString);
				        		format(string, sizeof(string), "Nguoi ban '%s' ma ban gioi thieu den may chu da dat den cap do 3. Vi vay, ban da nhan duoc 100 Credits.", GetPlayerNameEx(playerid));
						        SendClientMessageEx(szReferrer, COLOR_LIGHTBLUE, string);
						    }
							else if(PlayerInfo[szReferrer][pRefers] >= 25)
							{
							    PlayerInfo[szReferrer][pCredits] += CREDITS_AMOUNT_REFERRAL*25;
	            				PlayerInfo[szReferrer][pRefers] ++;
								mysql_format(MainPipeline, szQuery, sizeof(szQuery), "UPDATE `accounts` SET `Credits`=%d WHERE `Username` = '%s'", PlayerInfo[szReferrer][pCredits], GetPlayerNameExt(szReferrer));
								mysql_tquery(MainPipeline, szQuery, "OnQueryFinish", "ii", SENDDATA_THREAD, playerid);
								format(szString, sizeof(szString), "%s(%d) da nhan duoc %d credits cho gioi thieu nguoi choi (Nguoi choi dat cap do 3)", GetPlayerNameEx(szReferrer), GetPlayerSQLId(szReferrer), CREDITS_AMOUNT_REFERRAL*25);
								Log("logs/referral.log", szString);
				        		format(string, sizeof(string), "Nguoi ban '%s' ma ban gioi thieu den may chu da dat den cap do 3. Vi vay, ban da nhan duoc 2500 Credits.", GetPlayerNameEx(playerid));
						        SendClientMessageEx(szReferrer, COLOR_LIGHTBLUE, string);
							}
					    }
					    else {
					        mysql_format(MainPipeline, szQuery, sizeof(szQuery), "UPDATE `accounts` SET `PendingRefReward`=1 WHERE `Username`='%s'", PlayerInfo[playerid][pReferredBy]);
					        mysql_tquery(MainPipeline, szQuery, "OnQueryFinish", "iii", REWARD_REFERRAL_THREAD, playerid, g_arrQueryHandle{playerid});
						}
					}
				}
				if(PlayerInfo[playerid][pLevel] == 6)
				{
				    SendClientMessageEx(playerid, COLOR_WHITE, "Kenh tro chuyen newbie se tu dong tat khi ban dang nhap.");
				}
			}
		}
		return 1;
	}
	else
	{
		SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong dang nhap.");
	}
	return 1;
}

/*
CMD:upgrade(playerid, params[])
{
	if(isnull(params))
	{
		new string[64];
		format(string, sizeof(string), "USAGE: /upgrade [upgradename] (you have %d upgrade points).",PlayerInfo[playerid][gPupgrade]);
		SendClientMessageEx(playerid, COLOR_GREEN,"_______________________________________");
		SendClientMessageEx(playerid, COLOR_WHITE,"*** UPGRADES ***");
		SendClientMessageEx(playerid, COLOR_GRAD2,string);
		SendClientMessageEx(playerid, COLOR_GRAD5, "armor gunlocker gunlocker2 gunlocker3 cargunlocker");
		SendClientMessageEx(playerid, COLOR_GREEN,"_______________________________________");
		return 1;
	}
	if( PlayerInfo[playerid][gPupgrade] >= 1 )
	{
		if (PlayerInfo[playerid][pLevel] >= 1 && strcmp(params, "armor", true) == 0)
		{
			if (PlayerInfo[playerid][pSHealth] < 100)
			{
				new string[51];
				++PlayerInfo[playerid][pSHealth];
				PlayerInfo[playerid][gPupgrade]--;
				format(string, sizeof(string), "New Upgrade: You will now spawn with %.2f armor.",PlayerInfo[playerid][pSHealth]);
				SendClientMessageEx(playerid, COLOR_GRAD6, string);
			}
			else
			{
				SendClientMessageEx(playerid, COLOR_GRAD6, "   You have maximum spawn armor.");
				return 1;
			}
		}
		else if(strcmp(params, "gunlocker", true) == 0)
		{
			new playername[MAX_PLAYER_NAME];
			GetPlayerName(playerid, playername, sizeof(playername));
			if(PlayerInfo[playerid][pPhousekey] != INVALID_HOUSE_ID && HouseInfo[PlayerInfo[playerid][pPhousekey]][hOwnerID] == GetPlayerSQLId(playerid))
			{
				if( PlayerInfo[playerid][gPupgrade] < 2 )
				{
					SendClientMessageEx(playerid, COLOR_GRAD6, "   You need at least 2 upgrade points.");
					return 1;
				}
				switch(HouseInfo[PlayerInfo[playerid][pPhousekey]][hGLUpgrade])
				{
					case 0:
					{
						if(PlayerInfo[playerid][pCash] >= 50000)
						{
							PlayerInfo[playerid][pCash] -= 50000;
							HouseInfo[PlayerInfo[playerid][pPhousekey]][hGLUpgrade] = 1;
							HouseInfo[PlayerInfo[playerid][pPhousekey]][hWeapons][0] = 0;
							SendClientMessageEx(playerid, COLOR_WHITE, "You have purchased a new locker space, you have been charged $50,000.");
							SendClientMessageEx(playerid, COLOR_GRAD2, "HINT: To use your lockers, the commands are /storegun and /getgun. You have 1 locker space available." );
						}
						else
						{
							SendClientMessageEx(playerid, COLOR_WHITE, "You don't have enough ($50,000).");
							return 1;
						}
					}
					case 1:
					{
						if( PlayerInfo[playerid][pCash] >= 50000 )
						{
							PlayerInfo[playerid][pCash] -= 50000;
							HouseInfo[PlayerInfo[playerid][pPhousekey]][hGLUpgrade]++;
							HouseInfo[PlayerInfo[playerid][pPhousekey]][hWeapons][1] = 0;
							SendClientMessageEx(playerid, COLOR_WHITE, "You have purchased a new locker space, you have been charged $50,000.");
							SendClientMessageEx(playerid, COLOR_GRAD2, "HINT: To use your lockers, the commands are /storegun and /getgun. You have 2 locker space available." );
						}
						else
						{
							SendClientMessageEx(playerid, COLOR_WHITE, "You don't have enough ($50,000).");
							return 1;
						}
					}
					case 2:
					{
						if( PlayerInfo[playerid][pCash] >= 50000 )
						{
							PlayerInfo[playerid][pCash] -= 50000;
							HouseInfo[PlayerInfo[playerid][pPhousekey]][hGLUpgrade]++;
							HouseInfo[PlayerInfo[playerid][pPhousekey]][hWeapons][2] = 0;
							SendClientMessageEx(playerid, COLOR_WHITE, "You have purchased a new locker space, you have been charged $50,000.");
							SendClientMessageEx(playerid, COLOR_GRAD2, "HINT: To use your lockers, the commands are /storegun and /getgun. You have 3 locker space available." );
						}
						else
						{
							SendClientMessageEx(playerid, COLOR_WHITE, "You don't have enough ($50,000).");
							return 1;
						}
					}
					case 3:
					{
						if( PlayerInfo[playerid][pCash] >= 50000 )
						{
							PlayerInfo[playerid][pCash] -= 50000;
							HouseInfo[PlayerInfo[playerid][pPhousekey]][hGLUpgrade]++;
							HouseInfo[PlayerInfo[playerid][pPhousekey]][hWeapons][3] = 0;
							SendClientMessageEx(playerid, COLOR_WHITE, "You have purchased a new locker space, you have been charged $50,000.");
							SendClientMessageEx(playerid, COLOR_GRAD2, "HINT: To use your lockers, the commands are /storegun and /getgun. You have 4 locker space available." );
						}
						else
						{
							SendClientMessageEx(playerid, COLOR_WHITE, "You don't have enough ($50,000).");
							return 1;
						}
					}
					case 4:
					{
						if( PlayerInfo[playerid][pCash] >= 50000 )
						{
							PlayerInfo[playerid][pCash] -= 50000;
							HouseInfo[PlayerInfo[playerid][pPhousekey]][hGLUpgrade]++;
							HouseInfo[PlayerInfo[playerid][pPhousekey]][hWeapons][4] = 0;
							SendClientMessageEx(playerid, COLOR_WHITE, "You have purchased a new locker space, you have been charged $50,000.");
							SendClientMessageEx(playerid, COLOR_GRAD2, "HINT: To use your lockers, the commands are /storegun and /getgun. You have 5 locker space available." );
						}
						else
						{
							SendClientMessageEx(playerid, COLOR_WHITE, "You don't have enough ($50,000).");
							return 1;
						}
					}
					case 5:
					{
						SendClientMessageEx(playerid, COLOR_WHITE, "Sorry, there are no more spaces available.");
						return 1;
					}
				}
				PlayerInfo[playerid][gPupgrade]--;
				SaveHouse(PlayerInfo[playerid][pPhousekey]);
			}
			else
			{
				SendClientMessageEx(playerid, COLOR_GRAD2, " You are not a house owner.");
				return 1;
			}
		}

		else if(strcmp(params, "gunlocker2", true) == 0)
		{
			new playername[MAX_PLAYER_NAME];
			GetPlayerName(playerid, playername, sizeof(playername));
			if(PlayerInfo[playerid][pPhousekey2] != INVALID_HOUSE_ID && HouseInfo[PlayerInfo[playerid][pPhousekey2]][hOwnerID] == GetPlayerSQLId(playerid))
			{
				if( PlayerInfo[playerid][gPupgrade] < 2 )
				{
					SendClientMessageEx(playerid, COLOR_GRAD6, "   You need at least 2 upgrade points.");
					return 1;
				}
				switch( HouseInfo[PlayerInfo[playerid][pPhousekey2]][hGLUpgrade] )
				{
					case 0:
					{
						if( PlayerInfo[playerid][pCash] >= 50000 )
						{
							PlayerInfo[playerid][pCash] -= 50000;
							HouseInfo[PlayerInfo[playerid][pPhousekey2]][hGLUpgrade] = 1;
							HouseInfo[PlayerInfo[playerid][pPhousekey2]][hWeapons][0] = 0;
							SendClientMessageEx(playerid, COLOR_WHITE, "You have purchased a new locker space, you have been charged $50,000.");
							SendClientMessageEx(playerid, COLOR_GRAD2, "HINT: To use your lockers, the commands are /storegun and /getgun. You have 1 locker space available." );
						}
						else
						{
							SendClientMessageEx(playerid, COLOR_WHITE, "You don't have enough ($50,000).");
							return 1;
						}
					}
					case 1:
					{
						if( PlayerInfo[playerid][pCash] >= 50000 )
						{
							PlayerInfo[playerid][pCash] -= 50000;
							HouseInfo[PlayerInfo[playerid][pPhousekey2]][hGLUpgrade]++;
							HouseInfo[PlayerInfo[playerid][pPhousekey2]][hWeapons][1] = 0;
							SendClientMessageEx(playerid, COLOR_WHITE, "You have purchased a new locker space, you have been charged $50,000.");
							SendClientMessageEx(playerid, COLOR_GRAD2, "HINT: To use your lockers, the commands are /storegun and /getgun. You have 2 locker space available." );
						}
						else
						{
							SendClientMessageEx(playerid, COLOR_WHITE, "You don't have enough ($50,000).");
							return 1;
						}
					}
					case 2:
					{
						if( PlayerInfo[playerid][pCash] >= 50000 )
						{
							PlayerInfo[playerid][pCash] -= 50000;
							HouseInfo[PlayerInfo[playerid][pPhousekey2]][hGLUpgrade]++;
							HouseInfo[PlayerInfo[playerid][pPhousekey2]][hWeapons][2] = 0;
							SendClientMessageEx(playerid, COLOR_WHITE, "You have purchased a new locker space, you have been charged $50,000.");
							SendClientMessageEx(playerid, COLOR_GRAD2, "HINT: To use your lockers, the commands are /storegun and /getgun. You have 3 locker space available." );
						}
						else
						{
							SendClientMessageEx(playerid, COLOR_WHITE, "You don't have enough ($50,000).");
							return 1;
						}
					}
					case 3:
					{
						if( PlayerInfo[playerid][pCash] >= 50000 )
						{
							PlayerInfo[playerid][pCash] -= 50000;
							HouseInfo[PlayerInfo[playerid][pPhousekey2]][hGLUpgrade]++;
							HouseInfo[PlayerInfo[playerid][pPhousekey2]][hWeapons][3] = 0;
							SendClientMessageEx(playerid, COLOR_WHITE, "You have purchased a new locker space, you have been charged $50,000.");
							SendClientMessageEx(playerid, COLOR_GRAD2, "HINT: To use your lockers, the commands are /storegun and /getgun. You have 4 locker space available." );
						}
						else
						{
							SendClientMessageEx(playerid, COLOR_WHITE, "You don't have enough ($50,000).");
							return 1;
						}
					}
					case 4:
					{
						if( PlayerInfo[playerid][pCash] >= 50000 )
						{
							PlayerInfo[playerid][pCash] -= 50000;
							HouseInfo[PlayerInfo[playerid][pPhousekey2]][hGLUpgrade]++;
							HouseInfo[PlayerInfo[playerid][pPhousekey2]][hWeapons][4] = 0;
							SendClientMessageEx(playerid, COLOR_WHITE, "You have purchased a new locker space, you have been charged $50,000.");
							SendClientMessageEx(playerid, COLOR_GRAD2, "HINT: To use your lockers, the commands are /storegun and /getgun. You have 5 locker space available." );
						}
						else
						{
							SendClientMessageEx(playerid, COLOR_WHITE, "You don't have enough ($50,000).");
							return 1;
						}
					}
					case 5:
					{
						SendClientMessageEx(playerid, COLOR_WHITE, "Sorry, there are no more spaces available.");
						return 1;
					}
				}
				PlayerInfo[playerid][gPupgrade]--;
				SaveHouse(PlayerInfo[playerid][pPhousekey2]);
			}
			else
			{
				SendClientMessageEx(playerid, COLOR_GRAD2, " You don't own a second house.");
				return 1;
			}
		}
		else if(strcmp(params, "gunlocker3", true) == 0)
		{
			new playername[MAX_PLAYER_NAME];
			GetPlayerName(playerid, playername, sizeof(playername));
			if(PlayerInfo[playerid][pPhousekey3] != INVALID_HOUSE_ID && HouseInfo[PlayerInfo[playerid][pPhousekey3]][hOwnerID] == GetPlayerSQLId(playerid))
			{
				if( PlayerInfo[playerid][gPupgrade] < 2 )
				{
					SendClientMessageEx(playerid, COLOR_GRAD6, "   You need at least 2 upgrade points.");
					return 1;
				}
				switch( HouseInfo[PlayerInfo[playerid][pPhousekey3]][hGLUpgrade] )
				{
					case 0:
					{
						if( PlayerInfo[playerid][pCash] >= 50000 )
						{
							PlayerInfo[playerid][pCash] -= 50000;
							HouseInfo[PlayerInfo[playerid][pPhousekey3]][hGLUpgrade] = 1;
							HouseInfo[PlayerInfo[playerid][pPhousekey3]][hWeapons][0] = 0;
							SendClientMessageEx(playerid, COLOR_WHITE, "You have purchased a new locker space, you have been charged $50,000.");
							SendClientMessageEx(playerid, COLOR_GRAD2, "HINT: To use your lockers, the commands are /storegun and /getgun. You have 1 locker space available." );
						}
						else
						{
							SendClientMessageEx(playerid, COLOR_WHITE, "You don't have enough ($50,000).");
							return 1;
						}
					}
					case 1:
					{
						if( PlayerInfo[playerid][pCash] >= 50000 )
						{
							PlayerInfo[playerid][pCash] -= 50000;
							HouseInfo[PlayerInfo[playerid][pPhousekey3]][hGLUpgrade]++;
							HouseInfo[PlayerInfo[playerid][pPhousekey3]][hWeapons][1] = 0;
							SendClientMessageEx(playerid, COLOR_WHITE, "You have purchased a new locker space, you have been charged $50,000.");
							SendClientMessageEx(playerid, COLOR_GRAD2, "HINT: To use your lockers, the commands are /storegun and /getgun. You have 2 locker space available." );
						}
						else
						{
							SendClientMessageEx(playerid, COLOR_WHITE, "You don't have enough ($50,000).");
							return 1;
						}
					}
					case 2:
					{
						if( PlayerInfo[playerid][pCash] >= 50000 )
						{
							PlayerInfo[playerid][pCash] -= 50000;
							HouseInfo[PlayerInfo[playerid][pPhousekey3]][hGLUpgrade]++;
							HouseInfo[PlayerInfo[playerid][pPhousekey3]][hWeapons][2] = 0;
							SendClientMessageEx(playerid, COLOR_WHITE, "You have purchased a new locker space, you have been charged $50,000.");
							SendClientMessageEx(playerid, COLOR_GRAD2, "HINT: To use your lockers, the commands are /storegun and /getgun. You have 3 locker space available." );
						}
						else
						{
							SendClientMessageEx(playerid, COLOR_WHITE, "You don't have enough ($50,000).");
							return 1;
						}
					}
					case 3:
					{
						if( PlayerInfo[playerid][pCash] >= 50000 )
						{
							PlayerInfo[playerid][pCash] -= 50000;
							HouseInfo[PlayerInfo[playerid][pPhousekey3]][hGLUpgrade]++;
							HouseInfo[PlayerInfo[playerid][pPhousekey3]][hWeapons][3] = 0;
							SendClientMessageEx(playerid, COLOR_WHITE, "You have purchased a new locker space, you have been charged $50,000.");
							SendClientMessageEx(playerid, COLOR_GRAD2, "HINT: To use your lockers, the commands are /storegun and /getgun. You have 4 locker space available." );
						}
						else
						{
							SendClientMessageEx(playerid, COLOR_WHITE, "You don't have enough ($50,000).");
							return 1;
						}
					}
					case 4:
					{
						if( PlayerInfo[playerid][pCash] >= 50000 )
						{
							PlayerInfo[playerid][pCash] -= 50000;
							HouseInfo[PlayerInfo[playerid][pPhousekey3]][hGLUpgrade]++;
							HouseInfo[PlayerInfo[playerid][pPhousekey3]][hWeapons][4] = 0;
							SendClientMessageEx(playerid, COLOR_WHITE, "You have purchased a new locker space, you have been charged $50,000.");
							SendClientMessageEx(playerid, COLOR_GRAD2, "HINT: To use your lockers, the commands are /storegun and /getgun. You have 5 locker space available." );
						}
						else
						{
							SendClientMessageEx(playerid, COLOR_WHITE, "You don't have enough ($50,000).");
							return 1;
						}
					}
					case 5:
					{
						SendClientMessageEx(playerid, COLOR_WHITE, "Sorry, there are no more spaces available.");
						return 1;
					}
				}
				PlayerInfo[playerid][gPupgrade]--;
				SaveHouse(PlayerInfo[playerid][pPhousekey3]);
			}
			else
			{
				SendClientMessageEx(playerid, COLOR_GRAD2, " You don't own a second house.");
				return 1;
			}
		}
		else if(strcmp(params, "cargunlocker", true) == 0)
		{
			new Float: x, Float: y, Float: z;
			for(new d = 0 ; d < MAX_PLAYERVEHICLES; d++)
			{
				if(PlayerVehicleInfo[playerid][d][pvId] != INVALID_PLAYER_VEHICLE_ID) GetVehiclePos(PlayerVehicleInfo[playerid][d][pvId], x, y, z);
				if(IsPlayerInRangeOfPoint(playerid, 3.0, x, y, z))
				{
					if( PlayerInfo[playerid][gPupgrade] < 2 )
					{
						SendClientMessageEx(playerid, COLOR_GRAD6, "   You need at least 2 upgrade points.");
						return 1;
					}
					if(PlayerVehicleInfo[playerid][d][pvWepUpgrade] < 2)
					{
						new string[114];
						GameTextForPlayer(playerid,"~r~Vehicle Gunlocker Upgraded!",5000,6);
						PlayerPlaySound(playerid, 1145, 0.0, 0.0, 0.0);
						PlayerVehicleInfo[playerid][d][pvWepUpgrade]++;
						PlayerVehicleInfo[playerid][d][pvWeapons][PlayerVehicleInfo[playerid][d][pvWepUpgrade]] = 0;
						PlayerInfo[playerid][gPupgrade] = PlayerInfo[playerid][gPupgrade]-2;
						SendClientMessageEx(playerid, COLOR_WHITE, "You have purchased a new car locker space.");
						format(string, sizeof(string), "HINT: To use your car lockers, the commands are /trunkput and /trunktake. You have %d locker spaces available.", PlayerVehicleInfo[playerid][d][pvWepUpgrade]+1);
						SendClientMessageEx(playerid, COLOR_GRAD2, string );
						return 1;
					}
					else
					{
						SendClientMessageEx(playerid, COLOR_GREY, "You have already upgraded your car gunlocker slots.");
						return 1;
					}
				}
			}
			SendClientMessageEx(playerid, COLOR_GREY, " You are not near any vehicle that you own.");
			return 1;
		}
		else
		{
			SendClientMessageEx(playerid, COLOR_GRAD6, "   Unrecognized upgrade.");
			return 1;
		}
	}
	else
	{
		SendClientMessageEx(playerid, COLOR_GRAD6, "   You have 0 Upgrade Points.");
		return 1;
	}
	return 1;
}*/
