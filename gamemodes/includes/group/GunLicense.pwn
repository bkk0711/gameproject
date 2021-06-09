#include <YSI\y_hooks> 

/*CMD:gunlicenseapply(playerid, params[]) {

	szMiscArray[0] = 0; 

	if(!IsPlayerInRangeOfPoint(playerid, 5.0, 1464.3099, -1747.5853, 15.6267)) 
		return SendClientMessageEx(playerid, COLOR_GRAD1, "You aren't at the government arms point at City Hall in Los Santos.");

	if(PlayerInfo[playerid][pGunLic] > gettime()) return SendClientMessageEx(playerid, COLOR_GRAD2, "You already have a valid gun license");

	ShowPlayerDialogEx(playerid, APPLY_GUN_LIC, DIALOG_STYLE_MSGBOX, 
		"Gun License Application", 
		"You are about to apply for a gun license\nYou will have a background check for crimes for the last 3 weeks\nThis process will cost $100,000", 
		"Apply", 
		"Cancel"
	);

	return 1;
}*/

CMD:issuegl(playerid, params[]) return cmd_issuegunlicense(playerid, params);
CMD:issuegunlicense(playerid, params[])
{
	if((0 <= PlayerInfo[playerid][pLeader] < MAX_GROUPS) && arrGroupData[PlayerInfo[playerid][pLeader]][g_iGroupType] == GROUP_TYPE_GOV)
	{
		new iTargetID;

		szMiscArray[0] = 0;

		if(sscanf(params, "u", iTargetID)) return SendClientMessageEx(playerid, COLOR_GRAD2, "USAGE: /issuegunlicense [playerid]");

		PlayerInfo[iTargetID][pGunLic] = gettime() + (86400*30);

		format(szMiscArray, sizeof(szMiscArray), "%s da doi moi %s's giay phep sung.", GetPlayerNameEx(playerid), GetPlayerNameEx(iTargetID));

		foreach(new i : Player)
			if((0 <= PlayerInfo[i][pMember] < MAX_GROUPS) && arrGroupData[PlayerInfo[i][pMember]][g_iGroupType] == GROUP_TYPE_GOV)
				SendClientMessageEx(i, COLOR_RED, szMiscArray);

		format(szMiscArray, sizeof(szMiscArray), "%s(%d) (%s) da doi moi %s(%d) (%s) giay phep sung.", GetPlayerNameEx(playerid), GetPlayerSQLId(playerid), GetPlayerIpEx(playerid), GetPlayerNameEx(iTargetID), GetPlayerSQLId(iTargetID),  GetPlayerIpEx(iTargetID));
		Log("logs/licenses.log", szMiscArray);
	}
	else SendClientMessageEx(playerid, COLOR_WHITE, "Ban khong duoc phep su dung lenh nay!");
	return 1;
}

hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[]) {

	if(arrAntiCheat[playerid][ac_iFlags][AC_DIALOGSPOOFING] > 0) return 1;
	switch(dialogid) {

		case APPLY_GUN_LIC: {

			if(!response) return SendClientMessageEx(playerid, COLOR_WHITE, "Ban da chon khong dang ky giay phep su dung sung!");
			else {

				if(GetPlayerCash(playerid) >= 100000) SubmitGunLicApp(playerid);
				else SendClientMessageEx(playerid, COLOR_WHITE, "Ban khong co du tien.");
			}
			
		}
	}
	return 0;
}

SubmitGunLicApp(iPlayerID) {

	szMiscArray[0] = 0;

	mysql_format(MainPipeline, szMiscArray, sizeof(szMiscArray), "SELECT * FROM `mdc` WHERE `id` = '%d' AND (`time` > DATE_SUB(NOW(), INTERVAL 21 DAY))", PlayerInfo[iPlayerID][pId]);
	mysql_tquery(MainPipeline, szMiscArray, "OnSubmitGunLicApp", "i", iPlayerID);

	return 1;
}

forward OnSubmitGunLicApp(iPlayerID);
public OnSubmitGunLicApp(iPlayerID) {

	szMiscArray[0] = 0;
	new iRows;
	cache_get_row_count(iRows);

	if(iRows > 0)  {
		ShowPlayerDialogEx(iPlayerID, DIALOG_NOTHING, DIALOG_STYLE_MSGBOX, "Don xin cap phep sung - Tu choi", 
			"Chung toi da chay kiem tra ly lich va tim thay lich su trong vong 21 ngay qua\nVui long nop don lai sau 21 ngay ke tu lan pham toi cuoi cung cua ban!", 
			"Dong", ""
		);
	}
	else {
		ShowPlayerDialogEx(iPlayerID, DIALOG_NOTHING, DIALOG_STYLE_MSGBOX, "Don xin cap phep sung - Chap nhan", "Giay phep su dung sung cua ban da duoc gia han them 30 ngay nua.\nHave a good day!", "Close", "");

		PlayerInfo[iPlayerID][pGunLic] = gettime() + (86400*30); // 30 days.

		GivePlayerCash(iPlayerID, -100000);
		Tax+=100000;
		format(szMiscArray, sizeof(szMiscArray), "%s da gia han giay phep su dung sung gia $100,000.", GetPlayerNameEx(iPlayerID));
		Log("logs/licenses.log", szMiscArray);
	}

	return 1;
}

