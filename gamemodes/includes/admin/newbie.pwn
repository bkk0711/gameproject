#include <YSI\y_hooks>

CMD:newb(playerid, params[]) {

	szMiscArray[0] = 0;

	if(PlayerInfo[playerid][pNMute] == 1) return SendClientMessageEx(playerid, COLOR_GREY, "You are muted from the newbie chat channel.");
	if(PlayerInfo[playerid][pToggledChats][0]) return SendClientMessageEx(playerid, COLOR_GREY, "You have the channel toggled, /tog newbie to re-enable!");
	if(PlayerInfo[playerid][pTut] == 0) return SendClientMessageEx(playerid, COLOR_GREY, "Ban khong the lam dieu do ngay bay gio.");
	if(nonewbie) return SendClientMessageEx(playerid, COLOR_GRAD2, "The newbie chat channel has been disabled by an administrator!");

	if(GetPVarType(playerid, "HasNewbQues")) {
		SendClientMessageEx(playerid, COLOR_GREY, "Ban hien dang co mot cau hoi tren kenh newbie.");
		return SendClientMessageEx(playerid, COLOR_GREY, "Go /huybocauhoi de hoi cau moi!");
	}

	ShowPlayerDialogEx(playerid, SEND_NEWBIE, DIALOG_STYLE_INPUT, "Dat cau hoi cua ban", "Vui long nhap cau hoi cua ban\nVui long nhap cau hoi lien quan den kich ban cua chung toi de co cau tra loi chinh xac.", "Gui", "Huy bo");

	return 1;
}

CMD:huybocauhoi(playerid, params[]) {

	SendClientMessageEx(playerid, COLOR_WHITE, "Ban da huy yeu cau cua ban");
	ClearNewbVars(playerid);
	return 1;
}

CMD:xemcauhoi(playerid, params[]) {

	if(PlayerInfo[playerid][pAdmin] >= 1 || PlayerInfo[playerid][pHelper] > 0) {
		GetNewbieQuestions(playerid);
	}

	return 1;
}

CMD:traloicauhoi(playerid, params[]) { 
	
	szMiscArray[0] = 0;

	new id;

	if(sscanf(params, "u", id)) return SendClientMessageEx(playerid, COLOR_GREY, "USAGE: /traloicauhoi [playerid]");
	if(!IsPlayerConnected(id)) return SendClientMessageEx(playerid, COLOR_GREY, "Nguoi choi do da mat ket noi!");
	if(!GetPVarType(id, "HasNewbQues")) return SendClientMessageEx(playerid, COLOR_GREY, "Nguoi choi do da khong hoi cau hoi nao!");
	if(GetPVarType(id, "NewbBeingAnswered")) return SendClientMessageEx(playerid, COLOR_GREY, "Nguoi tro giup khac dang tra loi cau hoi do!");

	if(PlayerInfo[playerid][pAdmin] >= 1 || PlayerInfo[playerid][pHelper] > 0) {

		SetPVarInt(playerid, "AnsweringNewb", id);
		SetPVarInt(id, "NewbBeingAnswered", playerid);
		GetPVarString(id, "HasNewbQues", szMiscArray, 128);
		format(szMiscArray, sizeof(szMiscArray), "%s (ID:%d) Hoi: %s\nVui long nhap cau tra loi cua ban duoi day!", GetPlayerNameEx(id), id, szMiscArray);
		ShowPlayerDialogEx(playerid, ACCEPT_NEWBIE, DIALOG_STYLE_INPUT, "Tra loi cau hoi", szMiscArray, "Tra loi", "");
	}

	return 1;
}

CMD:tuchoicauhoi(playerid, params[]) {
	
	szMiscArray[0] = 0;

	new id;

	if(sscanf(params, "u", id)) return SendClientMessageEx(playerid, COLOR_GREY, "USAGE: /tuchoicauhoi [playerid]");
	if(!IsPlayerConnected(id)) return SendClientMessageEx(playerid, COLOR_GREY, "That player is no longer connected!");
	if(!GetPVarType(id, "HasNewbQues")) return SendClientMessageEx(playerid, COLOR_GREY, "That player hasn't asked a newbie question!");
	if(GetPVarType(id, "NewbBeingAnswered")) return SendClientMessageEx(playerid, COLOR_GREY, "Another helper is answering that request!");


	if(PlayerInfo[playerid][pAdmin] >= 1 || PlayerInfo[playerid][pHelper] > 0) {

		SetPVarInt(playerid, "AnsweringNewb", id);
		SetPVarInt(id, "NewbBeingAnswered", playerid);
		GetPVarString(id, "HasNewbQues", szMiscArray, 128);
		
		ShowPlayerDialogEx(playerid, DENY_NEWBIE, DIALOG_STYLE_LIST, "Why is this not a valid request?", "Not a Question\nIC Matter\nSpam", "Select","");
	}

	return 1;
}

SendNewbQuestionToQueue(iPlayerID, szQuestion[]) {

	szMiscArray[0] = 0;

	SetPVarString(iPlayerID, "HasNewbQues", szQuestion);

	format(szMiscArray, sizeof(szMiscArray), "Newb: %s (ID:%d) Hoi: %s", GetPlayerNameEx(iPlayerID), iPlayerID, szQuestion);

	foreach(new i : Player) {
		if((PlayerInfo[i][pAdmin] >= 1 || PlayerInfo[i][pHelper] > 0))
			
			ChatTrafficProcess(i, COLOR_NEWBIE, szMiscArray, 0);
	}

	SendClientMessageEx(iPlayerID, COLOR_WHITE, "Cau hoi cua ban da duoc gui");

	return 1;
}

ClearNewbVars(iPlayerID) {
	
	DeletePVar(iPlayerID, "HasNewbQues");
	DeletePVar(GetPVarInt(iPlayerID, "NewbBeingAnswered"), "AnsweringNewb");
	DeletePVar(iPlayerID, "NewbBeingAnswered");

	return 1;
}

AnswerNewbie(iPlayerID, iNewbieID, szAnswer[]) {

	szMiscArray[0] = 0;

	if(!GetPVarType(iNewbieID, "HasNewbQues")) return SendClientMessageEx(iPlayerID, COLOR_GREY, "Nguoi choi do khong co cau hoi hoat dong!");

	GetPVarString(iNewbieID, "HasNewbQues", szMiscArray, 128);

	format(szMiscArray, sizeof(szMiscArray), "Hoi: (%s): %s", GetPlayerNameEx(iNewbieID), szMiscArray);
	SendGlobalNewbMsg(szMiscArray);
	Log("logs/newbiechat.log", szMiscArray);

	szMiscArray[0] = 0;

	format(szMiscArray, sizeof(szMiscArray), "Tra loi: (%s): %s", GetPlayerNameEx(iPlayerID), szAnswer);
	SendGlobalNewbMsg(szMiscArray);
	Log("logs/newbiechat.log", szMiscArray);

	if(PlayerInfo[iPlayerID][pHelper] == 1 && PlayerInfo[iPlayerID][pAdmin] < 1) {
		ReportCount[iPlayerID]++;
		ReportHourCount[iPlayerID]++;
		AddCAReportToken(iPlayerID); // Advisor Tokens
	}

	SendClientMessageEx(iNewbieID, COLOR_NEWBIE, "Cau hoi cua ban da duoc tra loi! Neu ban co them cau hoi hoac de duoc ho tro them su dung [/requesthelp]");

	ClearNewbVars(iNewbieID);

	return 1;
}

SendGlobalNewbMsg(szMessage[]) {
	
	foreach(new i : Player) {
		if(PlayerInfo[i][pToggledChats][0] == 0) {
			SendClientMessageEx(i, COLOR_NEWBIE, szMessage);
		}
	}
	return 1;
}

GetNewbieQuestions(iPlayerID) {
	
	szMiscArray[0] = 0;

	SendClientMessageEx(iPlayerID, COLOR_GREEN,"_______________________________________");
	foreach(new i : Player) {
		if(GetPVarType(i, "HasNewbQues")) {
			GetPVarString(i, "HasNewbQues", szMiscArray, 128);
			format(szMiscArray, sizeof(szMiscArray), "Newb: %s (ID:%d) Hoi: %s", GetPlayerNameEx(i), i, szMiscArray);
			SendClientMessageEx(iPlayerID, COLOR_NEWBIE, szMiscArray);
		}
	}
	SendClientMessageEx(iPlayerID, COLOR_GREEN,"_______________________________________");
	return 1;
}

hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[]) {

	if(arrAntiCheat[playerid][ac_iFlags][AC_DIALOGSPOOFING] > 0) return 1;
	switch(dialogid) {
		
		case SEND_NEWBIE: {

			if(response) {
				
				if(isnull(inputtext)) return SendClientMessageEx(playerid, COLOR_GRAD2, "Ban khong the gui cau hoi!");
				if(strlen(inputtext) > 110) return SendClientMessageEx(playerid, COLOR_GRAD2, "Tin nhan do qua dai!");

				SendNewbQuestionToQueue(playerid, inputtext);
			}
		}

		case ACCEPT_NEWBIE: {

			if(response) {
				if(isnull(inputtext)) return SendClientMessageEx(playerid, COLOR_GRAD2, "Ban khong the gui cau hoi!");
				if(strlen(inputtext) > 110) {
					DeletePVar(GetPVarInt(playerid, "AnsweringNewb"), "NewbBeingAnswered");
					DeletePVar(playerid, "AnsweringNewb");
					return SendClientMessageEx(playerid, COLOR_GRAD2, "tin nhan do qua dai!");
				}

				AnswerNewbie(playerid, GetPVarInt(playerid, "AnsweringNewb"), inputtext);
			}
			else {
				
				DeletePVar(GetPVarInt(playerid, "AnsweringNewb"), "NewbBeingAnswered");
				DeletePVar(playerid, "AnsweringNewb");
			}
		}

		case DENY_NEWBIE: {

			if(response) {	
				new id = GetPVarInt(playerid, "AnsweringNewb");

				switch(listitem) {
				
					case 0: {
						SendClientMessageEx(id, COLOR_WHITE, "Tin nhan cau hoi cua ban chua duoc tra loi do no khong phai la cau hoi.");
					}

					case 1: {
						SendClientMessageEx(id, COLOR_WHITE, "Tin nhan cau hoi cua ban chua duoc tra loi do no khong phai la cau hoi lien quan den van de trong game.");
						SendClientMessageEx(id, COLOR_WHITE, "Chung toi chi tra loi nhung cau hoi lien quan den may chu /newb.");
					}

					case 2: {
						SendClientMessageEx(id, COLOR_WHITE, "Tin nhan cau hoi cua ban chua duoc tra loi do no khong phai la cau hoi binh thuong.");
						SendClientMessageEx(id, COLOR_WHITE, "Lam dung nhieu lan se dan den mot hinh phat nang.");
					}

				}

				ClearNewbVars(id);	
			}
			else {
				
				DeletePVar(GetPVarInt(playerid, "AnsweringNewb"), "NewbBeingAnswered");
				DeletePVar(playerid, "AnsweringNewb");
			}
			
		}
	}
	return 0;
}

hook OnPlayerDisconnect(playerid, reason) {

	// cancel newbie report if they have one
	ClearNewbVars(playerid);

	return 1;
}