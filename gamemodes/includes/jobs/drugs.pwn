/*

	 /$$   /$$  /$$$$$$          /$$$$$$$  /$$$$$$$
	| $$$ | $$ /$$__  $$        | $$__  $$| $$__  $$
	| $$$$| $$| $$  \__/        | $$  \ $$| $$  \ $$
	| $$ $$ $$| $$ /$$$$ /$$$$$$| $$$$$$$/| $$$$$$$/
	| $$  $$$$| $$|_  $$|______/| $$__  $$| $$____/
	| $$\  $$$| $$  \ $$        | $$  \ $$| $$
	| $$ \  $$|  $$$$$$/        | $$  | $$| $$
	|__/  \__/ \______/         |__/  |__/|__/

						Drugs System

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

/*CMD:useheroin(playerid, params[])
{
	if(PlayerInfo[playerid][pHospital])
		return SendClientMessageEx(playerid, COLOR_GREY, "Ban khong the lam dieu nay vao luc nay.");
	if(PlayerInfo[playerid][pHeroin] < 10)
	    return SendClientMessageEx(playerid, COLOR_GREY, "Ban can it nhat 10milligams heroin.");

	if(PlayerInfo[playerid][pSyringes] == 0)
	    return SendClientMessageEx(playerid, COLOR_GREY, "Ban khong co ong tiem nao.");

    if(gettime()-GetPVarInt(playerid, "HeroinLastUsed") < 300)
		return SendClientMessageEx(playerid, COLOR_GRAD2, "Ban chi co the su dung heroin sau 5 phut.");
	
	if(GetPVarType(playerid, "AttemptingLockPick")) 
		return SendClientMessageEx(playerid, COLOR_WHITE, "Ban dang co gang khoa, vui long cho.");
	
    if(GetPVarInt(playerid, "Injured") != 1) {
		new szMessage[128];

		SetPVarInt(playerid, "HeroinLastUsed", gettime());
		PlayerInfo[playerid][pHeroin] -= 10;
		PlayerInfo[playerid][pSyringes] -= 1;

		SetPVarInt(playerid, "InjectHeroinStanding", SetTimerEx("InjectHeroinStanding", 5000, 0, "i", playerid));

		SendClientMessageEx(playerid, COLOR_GREEN, "Ban da su dung heroin, hieu ung chong mat se bat dau sau 5 giay.");
		format(szMessage, sizeof(szMessage), "* %s da su dung heroin.", GetPlayerNameEx(playerid));
		ProxDetector(25.0, playerid, szMessage, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);

		if(!IsPlayerInAnyVehicle(playerid)) ApplyAnimation(playerid,"SMOKING","M_smkstnd_loop",2.1,0,0,0,0,0);

        return 1;
	}

	new szMessage[128];

	SetPVarInt(playerid, "HeroinLastUsed", gettime());
	PlayerInfo[playerid][pHeroin] -= 10;
	PlayerInfo[playerid][pSyringes] -= 1;

	SetPVarInt(playerid, "Health", 30);
	SetPVarInt(playerid, "InjectHeroin", SetTimerEx("InjectHeroin", 5000, 0, "i", playerid));

	SendClientMessageEx(playerid, COLOR_GREEN, "Ban da su dung heroin, hieu ung chong mat se bat dau sau 5 giay.");
	format(szMessage, sizeof(szMessage), "* %s da su dung heroin.", GetPlayerNameEx(playerid));
	ProxDetector(25.0, playerid, szMessage, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
	return 1;
}*/
