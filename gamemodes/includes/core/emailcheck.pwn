CMD:togemailcheck(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] < 1337) return 1;
	SendClientMessageEx(playerid, -1, emailcheck ? ("Kiem tra Emails bi vo hieu hoa"):("Da bat kiem tra Emails"));
	emailcheck = !emailcheck;
	return 1;
}

InvalidEmailCheck(playerid, email[], task)
{
	if(isnull(email))
		return ShowPlayerDialogEx(playerid, EMAIL_VALIDATION, DIALOG_STYLE_INPUT, "Dang ky E-mail", "Vui long nhap dia chi E-mail cua ban vao ben duoi.", "Gui di", "");
	szMiscArray[0] = 0;
	format(szMiscArray, sizeof(szMiscArray), "%s/email_check.php?t=%d&e=%s", SAMP_WEB, task, email);
	HTTP(playerid, HTTP_GET, szMiscArray, "", "OnInvalidEmailCheck");
	return 1;
}

forward OnInvalidEmailCheck(playerid, response_code, data[]);
public OnInvalidEmailCheck(playerid, response_code, data[])
{
	if(response_code == 200)
	{
		new result = strval(data);
		if(result == 0) // Invalid, Show dialog
			ShowPlayerDialogEx(playerid, EMAIL_VALIDATION, DIALOG_STYLE_INPUT, "Dang ky E-mail - {FF0000}Loi", "Vui long nhap dia chi E-mail cua ban vao ben duoi.", "Gui di", "");
		if(result == 1) // Valid from login check
			if(!GetPVarInt(playerid, "EmailConfirmed"))
			{
				SendClientMessageEx(playerid, COLOR_LIGHTRED, "Email cua ban chua duoc xac nhan. Vui long thuc hien cac buoc de xac nhan no hoac truy cap nc-rp.com de thay doi email cua ban.");
			}
		if(result == 2) // Valid from dialog
		{
			szMiscArray[0] = 0;
			GetPVarString(playerid, "pEmail", szMiscArray, 128);
			mysql_escape_string(szMiscArray, PlayerInfo[playerid][pEmail]);
			mysql_format(MainPipeline, szMiscArray, sizeof(szMiscArray), "UPDATE `accounts` SET `Email` = '%s', `EmailConfirmed` = 0 WHERE `id` = %d", PlayerInfo[playerid][pEmail], PlayerInfo[playerid][pId]);
			mysql_tquery(MainPipeline, szMiscArray, "OnQueryFinish", "i", SENDDATA_THREAD);
			format(szMiscArray, sizeof(szMiscArray), "Mot Email xac nhan se duoc gui den som '%s'.\n\
			Email nay se can duoc xac nhan trong vong 7 ngay hoac ban se duoc nhac nhap mot E-mail moi.\n\
			Vui long co gang xac nhan no vi no se duoc su dung cho cac thay doi va thong bao quan trong lien quan den tai khoan cua ban.", PlayerInfo[playerid][pEmail]);
			ShowPlayerDialogEx(playerid, DIALOG_NOTHING, DIALOG_STYLE_MSGBOX, "Xac nhan Email", szMiscArray, "Okay", "");
			format(szMiscArray, sizeof(szMiscArray), "%s/mail.php?id=%d", CP_WEB, PlayerInfo[playerid][pId]);
			HTTP(playerid, HTTP_HEAD, szMiscArray, "", "");
		}
	}
	return 1;
}

#include <YSI\y_hooks>
hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[]) {

	if(arrAntiCheat[playerid][ac_iFlags][AC_DIALOGSPOOFING] > 0) return 1;
	if(dialogid == EMAIL_VALIDATION)
	{
		if(!response || isnull(inputtext))
			ShowPlayerDialogEx(playerid, EMAIL_VALIDATION, DIALOG_STYLE_INPUT, "Dang ky E-mail - {FF0000}Loi", "Vui long nhap dia chi E-mail cua ban vao ben duoi.", "Gui di", "");
		SetPVarString(playerid, "pEmail", inputtext);
		InvalidEmailCheck(playerid, inputtext, 2);
	}
	return 0;
}