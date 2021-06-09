/*

	 /$$   /$$  /$$$$$$          /$$$$$$$  /$$$$$$$
	| $$$ | $$ /$$__  $$        | $$__  $$| $$__  $$
	| $$$$| $$| $$  \__/        | $$  \ $$| $$  \ $$
	| $$ $$ $$| $$ /$$$$ /$$$$$$| $$$$$$$/| $$$$$$$/
	| $$  $$$$| $$|_  $$|______/| $$__  $$| $$____/
	| $$\  $$$| $$  \ $$        | $$  \ $$| $$
	| $$ \  $$|  $$$$$$/        | $$  | $$| $$
	|__/  \__/ \______/         |__/  |__/|__/

						Tutorial System
								Winterfield

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

new TutorialTime[MAX_PLAYERS];

AdvanceTutorial(playerid) 
{
	switch(PlayerInfo[playerid][pTut])
	{
		case -1:
		{
			TogglePlayerSpectating(playerid, false);
			SetPlayerPos(playerid, 1715.0687, -1899.5597, 13.5665);
			SetPlayerFacingAngle(playerid, 0);
			SetPlayerSkin(playerid, PlayerInfo[playerid][pModel]);
			SetPlayerInterior(playerid, 0);
			SetPlayerVirtualWorld(playerid, 0);
			SetHealth(playerid, 100);
			ClearChatbox(playerid);
		}
		case 0:
		{
			IsSpawned[playerid] = 1;
			ClearChatbox(playerid);
			TogglePlayerSpectating(playerid, 1);

			SetPlayerInterior(playerid, 0);
			SetPlayerVirtualWorld(playerid, playerid + 1);

			InterpolateCameraPos(playerid, 1333.5521, -1388.1493, 67.2808, 1387.4829, -923.4698, 90.6020, 15000, CAMERA_MOVE);
			InterpolateCameraLookAt(playerid, 1333.5950, -1387.1521, 67.3258, 1387.7191, -922.5004, 90.4920, 15000, CAMERA_MOVE);

			KillTimer(TutorialTime[playerid]);
			SetPVarInt(playerid, "pTutorialTimer", 3);
			TutorialTime[playerid] = SetTimerEx("TutorialTimer", 1000, true, "i", playerid);
			ShowTutorialDialog(playerid, 0);
		}
		case 1:
		{
			InterpolateCameraPos(playerid, 725.9147, -1610.8770, 3.0359, 734.8999, -1962.6320, -6.3299, 15000, CAMERA_MOVE);
			InterpolateCameraLookAt(playerid, 725.9500, -1611.8734, 3.0057, 734.9311, -1963.6292, -6.5201, 15000, CAMERA_MOVE);

			KillTimer(TutorialTime[playerid]);
			SetPVarInt(playerid, "pTutorialTimer", 3);
			TutorialTime[playerid] = SetTimerEx("TutorialTimer", 1000, true, "i", playerid);
			ShowTutorialDialog(playerid, 1);
		}
		case 2:
		{
			InterpolateCameraPos(playerid, 1104.7491, -1401.8911, 14.6202, 1145.8008, -1471.2203, 27.1695, 15000, CAMERA_MOVE);
			InterpolateCameraLookAt(playerid, 1105.5040, -1402.5443, 14.5450, 1145.2341, -1470.3988, 26.7043, 15000, CAMERA_MOVE);

			KillTimer(TutorialTime[playerid]);
			SetPVarInt(playerid, "pTutorialTimer", 3);
			TutorialTime[playerid] = SetTimerEx("TutorialTimer", 1000, true, "i", playerid);
			ShowTutorialDialog(playerid, 2);
		}
		case 3:
		{
			InterpolateCameraPos(playerid, 1517.0358, -1616.2576, 17.8788, 1520.4496, -1715.3738, 18.1261, 15000, CAMERA_MOVE);
			InterpolateCameraLookAt(playerid, 1517.4991, -1617.1411, 17.8737, 1521.0973, -1714.6147, 18.0459, 15000, CAMERA_MOVE);

			KillTimer(TutorialTime[playerid]);
			SetPVarInt(playerid, "pTutorialTimer", 3);
			TutorialTime[playerid] = SetTimerEx("TutorialTimer", 1000, true, "i", playerid);
			ShowTutorialDialog(playerid, 3);
		}
		case 4:
		{
			InterpolateCameraPos(playerid, 938.9750, -1324.3108, 14.0205, 1039.5808, -1324.3224, 14.4793, 15000, CAMERA_MOVE);
			InterpolateCameraLookAt(playerid, 939.9739, -1324.3015, 14.0254, 1040.5797, -1324.3134, 14.4891, 15000, CAMERA_MOVE);

			KillTimer(TutorialTime[playerid]);
			SetPVarInt(playerid, "pTutorialTimer", 3);
			TutorialTime[playerid] = SetTimerEx("TutorialTimer", 1000, true, "i", playerid);
			ShowTutorialDialog(playerid, 4);
		}
		case 5:
		{
			InterpolateCameraPos(playerid, 366.2238, -1798.2668, 9.5036, 369.1093, -2030.7736, 8.7837, 15000, CAMERA_MOVE);
			InterpolateCameraLookAt(playerid, 366.3326, -1799.2593, 9.5184, 369.2533, -2031.7618, 8.7687, 15000, CAMERA_MOVE);

			ShowTutorialDialog(playerid, 5);
		}
		case 6 .. 10: ShowTutorialDialog(playerid, PlayerInfo[playerid][pTut]);
		case 11:
		{
			InterpolateCameraPos(playerid, 1457.7699, -870.9628, 63.1767, 1525.9520, -805.8469, 72.9416, 15000, CAMERA_MOVE);
			InterpolateCameraLookAt(playerid, 1458.4862, -870.2654, 63.1212, 1526.6012, -805.0862, 72.9162, 15000, CAMERA_MOVE);

			ShowTutorialDialog(playerid, 11);
			SetPlayerInterior(playerid, 0);
		}
		case 12:
		{
			InterpolateCameraPos(playerid, 1569.0149, -1812.5513, 16.1676, 1568.5962, -1889.8837, 13.8242, 15000, CAMERA_MOVE);
			InterpolateCameraLookAt(playerid, 1569.0370, -1813.5509, 16.1273, 1568.5488, -1890.8818, 13.7888, 15000, CAMERA_MOVE);

			ShowTutorialDialog(playerid, 12);
		}
		case 13:
		{
			AdjustActor(playerid, 2);
			CharacterCreation(playerid);

			InterpolateCameraPos(playerid, 237.6108, 1822.9670, 7.8454, 224.6772, 1820.0587, 7.6625, 5000, CAMERA_MOVE);
			InterpolateCameraLookAt(playerid, 236.6068, 1822.9495, 7.7454, 223.7760, 1820.5018, 7.6224, 5000, CAMERA_MOVE);
			SetPlayerInterior(playerid, 0);
		}
		case 14: CharacterCreation(playerid);
		case 15:
		{
			if(IsSpawned[playerid] == 0) return 1;
			SendClientMessageEx(playerid, COLOR_GREY, "-----------------------------");
			SendClientMessageEx(playerid, COLOR_WHITE, "Nhiem vu: Hay mua mot chiec xe.");
			SendClientMessageEx(playerid, COLOR_WHITE, "Hay di den vi tri do tren map va mua mot chiec xe.");
			SendClientMessageEx(playerid, COLOR_GREY, "-----------------------------");

			SetPlayerCheckpoint(playerid, 1645.9091,-1897.6914,13.5521, 5.0);

		}
		case 16:
		{
			if(IsSpawned[playerid] == 0) return 1;
			SendClientMessageEx(playerid, COLOR_GREY, "-----------------------------");
			SendClientMessageEx(playerid, COLOR_WHITE, "Nhiem vu: Rut tien trong ngan hang.");
			SendClientMessageEx(playerid, COLOR_WHITE, "Hay di den vi tri do tren map va rut tien.");
			SendClientMessageEx(playerid, COLOR_GREY, "-----------------------------");
			SetPlayerCheckpoint(playerid, 1457.0022,-1011.3710,26.8438, 5.0);
		}
		case 17:
		{
			if(IsSpawned[playerid] == 0) return 1;
			SendClientMessageEx(playerid, COLOR_GREY, "-----------------------------");
			SendClientMessageEx(playerid, COLOR_WHITE, "Nhiem vu: Mua mot chiec dien thoai.");
			SendClientMessageEx(playerid, COLOR_WHITE, "Hay di den vi tri do tren map va mua mot chiec dien thoai.");
			SendClientMessageEx(playerid, COLOR_GREY, "-----------------------------");

			SetPlayerCheckpoint(playerid, 999.6548,-919.9871,42.3281, 5.0);
		}
		case 18:
		{
			if(IsSpawned[playerid] == 0) return 1;
			SendClientMessageEx(playerid, COLOR_GREY, "-----------------------------");
			SendClientMessageEx(playerid, COLOR_WHITE, "Ban da hoan thanh nhiem vu co ban. Chao mung ban den voi vlxx.tv!");
			SendClientMessageEx(playerid, COLOR_GREY, "-----------------------------");

			PlayerInfo[playerid][pTut] = -1;
		}
	}
	return 1;
}

CharacterCreation(playerid)
{
	switch(PlayerInfo[playerid][pTut])
	{
		case 13:
		{
			szMiscArray[0] = 0;
			new genderstring[12];

			switch(PlayerInfo[playerid][pSex])
			{
				case 1: genderstring = "Nam";
				case 2: genderstring = "Nu";
				default: genderstring = "Khong";
			}

			format(szMiscArray, sizeof(szMiscArray), "Ten:\t%s\n\
				Gioi tinh:\t%s\n\
				Ngay sinh\t%s\n\
				Quoc gia\t%s\n\
				Giong noi:\t%s\n\
				Trang phuc ID:\t%i\n\
				Hoan tat",
				GetPlayerNameEx(playerid),
				genderstring,
				PlayerInfo[playerid][pBirthDate],
				GetPlayerNation(playerid),
				GetPlayerAccent(playerid),
				PlayerInfo[playerid][pModel]);
			return ShowPlayerDialogEx(playerid, DIALOG_REGISTER_CREATION, DIALOG_STYLE_TABLIST, "NC-RP | Tao nhan vat", szMiscArray, "Chon", "");
		}
		case 14: {

			DestroyActor(GetPVarInt(playerid, "pActor"));
			TogglePlayerSpectating(playerid, false);
			SetPlayerPos(playerid, 1715.0687, -1899.5597, 13.5665);
			SetPlayerFacingAngle(playerid, 0);
			SetPlayerSkin(playerid, PlayerInfo[playerid][pModel]);
			SetPlayerInterior(playerid, 0);
			SetPlayerVirtualWorld(playerid, 0);
			SetHealth(playerid, 100);
			ClearChatbox(playerid);

			ShowPlayerDialogEx(playerid, DIALOG_TUTORIAL, DIALOG_STYLE_MSGBOX, "NC-RP Huong dan - Chao mung", "Xin chao, ban co muon chung minh huong dan ban mot vong may chu khong?", "Co, lam on!", "Khong, cam on.");
		}
	}
	return 1;
}

ShowTutorialDialog(playerid, stage)
{
	new countstring[10];

	if(GetPVarInt(playerid, "pTutorialTimer") == 0) { format(countstring, 10, "Tiep tuc"); }
	else valstr(countstring, GetPVarInt(playerid, "pTutorialTimer"));

	switch(stage)
	{
		case 0:
		{
			if(betaserver == 0) {
				szMiscArray = "{FFFFFF}___________________________________________________________________________________________________________________________________\n\n\n";
				strcat(szMiscArray, "{7091B8}Chao mung den voi NC-RP!{FFFFFF}\n\n");
				strcat(szMiscArray, "Chung toi la mot cong dong Gta Online Viet Nam. Tai LSR, chung toi chuyen ve Roleplay, hanh dong dam nhan vai tro cua mot nhan vat do.\n");
				strcat(szMiscArray, "Nhu cuoc song that. Tren duong di, nhan vat cua ban hoc duoc thong tin moi va cho phep ho phat trien.\n\n");
				strcat(szMiscArray, "Nhu mot cong dong, Chung toi da co mat tu nam 2021 va da phat trien dang ke tu do.\n\n");
				strcat(szMiscArray, "{FF0000}Dich vu lien quan LSR{FFFFFF}:\n");
				strcat(szMiscArray, "\t{F69500}Website{FFFFFF}: lsr.vn - Dang ky tren dien dan cua chung toi va tuong tac voi cong dong!\n");
				strcat(szMiscArray, "\t{F69500}Quan ly tai khoan{FFFFFF}: ucp.lsr.vn - tai khoan cua ban va thuc hien cac bien phap de dam bao an toan cho tai khoan cua ban!\n");
				strcat(szMiscArray, "\t{F69500}Shop{FFFFFF}: shop.lsr.vn - Mua Credits tu cua hang va mua vat pham trong tro choi!\n");
				strcat(szMiscArray, "Hay dam bao rang ban da doc nhung huong dan nay vi ban se phai tra loi cau hoi o phan cuoi.");
				strcat(szMiscArray, "\n\n\n{FFFFFF}______________________________________________________________________________________________________________________________");
				ShowPlayerDialogEx(playerid, DIALOG_TUTORIAL, DIALOG_STYLE_MSGBOX, "LSR Huong Dan - Chao Mung", szMiscArray, countstring, "");
			}
			else {
				szMiscArray = "{FFFFFF}___________________________________________________________________________________________\n\n\n";
				strcat(szMiscArray, "{7091B8}Chao mung toi Los Santos Role Play!{FFFFFF}\n\n");
				strcat(szMiscArray, "Ban khong bat buoc phai ngoi xem qua huong dan ma chi can nhan \"Got it\" o phia duoi.\n");
				strcat(szMiscArray, "Ban se duoc dua thang toi man hinh tao nhan vat.\n\n");
				strcat(szMiscArray, "\n\n\n{FFFFFF}_______________________________________________________________________________");
				ShowPlayerDialogEx(playerid, DIALOG_TUTORIAL, DIALOG_STYLE_MSGBOX, "LSR.VN - Chao Mung", szMiscArray, "Got It", "");
			}
		}
		case 1:
		{
			szMiscArray = "{FFFFFF}_______________________________________________________________________________________________________________________________________________________\n\n\n";
			strcat(szMiscArray, "{F69500}Roleplay{FFFFFF}\n\n");
			strcat(szMiscArray, "De nhap vai, ban nen tao mot nhan vat. Moi nhan vat nen co mot cau chuyen, moi nhan vat can mot cau chuyen! Ho la ai? Ho den\n");
			strcat(szMiscArray, "tu dau? Tai sao ho o San Andreas? Do la tat ca vao ban!\n\n");
			strcat(szMiscArray, "Nhung truoc tien, ban nen biet mot so luat cua may chu Los Santos Role Play.\n\n");
			strcat(szMiscArray, "\t{FF0000}In Character (IC){FFFFFF}: La ban se nhap vai vao nhan vat trong tro choi cua ban, ban se di lam viec, kiem tien, tham gia cac hoat dong nhu ngoai doi,.v.v.\n");
			strcat(szMiscArray, "\t\tVi Du: Nhan vat cua ban dang noi chuyen voi nhan vat khac. Ban co the noi \"Xin chao, ban ten gi?\" Cuoc tro chuyen nhu doi thuc.\n\n");
			strcat(szMiscArray, "\t{FF0000}Out Of Character (OOC){FFFFFF}: Day la ban dang noi, khong phai nhan vat cua ban! Bat cu dieu gi lien quan den ca nhan ban deu bi coi la khong co nhap vai. Noi\n");
			strcat(szMiscArray, "\tcach khac Out of Character phai luon co 'OOC Brackets': (( Cuoc tro chuyen nay hien la OOC do co dau ngoac kep )).\n");
			strcat(szMiscArray, "\t\tVi du: Ban dang noi voi ban cua minh ve tran bong da hom qua. Ban co the noi, \"(( Ban co thay tran da do tuyet voi khong? ))\". Dieu nay\n");
			strcat(szMiscArray, "\t\tduoc coi la khong nhap vai vao nhan vat vi viec su dung dau ngoac kep OOC.\n\n");
			strcat(szMiscArray, "Ban cung nen hoc 2 lenh thuong duoc dung nhat khi nhap vai vao nhan vat.\n\n");
			strcat(szMiscArray, "\t{FF0000}/me [hanh dong]{FFFFFF} - Dieu nay cho phep nhan vat cua ban thuc hien mot hanh dong, no se phat mot thong diep den nhung nguoi choi khac xung quanh ban.\n");
			strcat(szMiscArray, "\t\tVi du: /me nhat mot cay gay tu mat dat.\n");
			strcat(szMiscArray, "\t{FF0000}/do [suy nghi]{FFFFFF} - Lenh nay mo ta mot hanh dong hoac cau lenh, no cung duoc su dung de lay thong tin ve cac ky tu khac trong ky tu.\n");
			strcat(szMiscArray, "\t\tVi du: /do Cay gay mau nau.\n\n");
			strcat(szMiscArray, "Hay doc ky cac dinh nghia nay vi ban se duoc hoi ve chung sau do.");
			strcat(szMiscArray, "\n\n\n{FFFFFF}_______________________________________________________________________________________________________________________________________________________");
			ShowPlayerDialogEx(playerid, DIALOG_TUTORIAL, DIALOG_STYLE_MSGBOX, "LSR Huong Dan - Luat RolePlay", szMiscArray, countstring, "");
		}
		case 2:
		{
			szMiscArray = "{FFFFFF}_______________________________________________________________________________________________________________________________________________________\n\n\n";
			strcat(szMiscArray, "{F69500}Luat Le{FFFFFF}\n\n");
			strcat(szMiscArray, "Tiep theo, ban nen tim hieu mot so quy tac nhap vai chung rat quan trong trong viec dam bao ban co trai nghiem tot nhat co the tai LSR.\n\n");
			strcat(szMiscArray, "\t{FF0000}Metagaming (MG){FFFFFF}: Tron thong tin IC voi thong tin OOC hoac nguoc lai.\n");
			strcat(szMiscArray, "\t\tVi du: Kiet_Le khong biet Ngoc_Nhu, nhung anh ay da bao cao viec lam cua co ay voi canh sat va noi ten co ay la Ngoc_Nhu.\n");
			strcat(szMiscArray, "\t\tVi du: Kiet_Le thuc su kho chiu, vi vay anh ay quyet dinh dat mot khuon mat cau co trong cuoc tro chuyen nhan vat.\n\n");
			strcat(szMiscArray, "\t{FF0000}Powergaming (PG){FFFFFF}: Ep buoc nguoi khac nhap vai va nhap vai vao mot dieu khong the xay ra.\n");
			strcat(szMiscArray, "\t\tVi du: Kiet_le su dung lenh /tie tren Ngoc_Nhu, ma khong can nhap vai hoac cho co ay du thoi gian tra loi.\n\n");
			strcat(szMiscArray, "\t{FF0000}Deathmatching (DM){FFFFFF}: Co gang giet nguoi choi khac ma khong nhap vai va khong co ly do.\n");
			strcat(szMiscArray, "\t\tVi du: Kiet_Le tien den Ngoc_Nhu va bat dau ban vao co ay khi chua nhap vai.\n\n");
			strcat(szMiscArray, "\t{FF0000}Killing On Sight (KoS){FFFFFF}: Su dung sung o noi dong nguoi ma khong co ly do nhap vai.\n");
			strcat(szMiscArray, "\t\tVi du: Kiet_Le goes up to Ngoc_Nhu and begins to shoot at her after she stole his car without roleplaying it first.\n\n");
			strcat(szMiscArray, "\t{FF0000}Revenge Killing (RK){FFFFFF}: Returning to the last place you died or engaging roleplay with the person(s) who were responsible for your death.\n");
			strcat(szMiscArray, "\t\tVi du: Ngoc_Nhu kills Kiet_Le, Kiet_Le goes back up to Ngoc_Nhu and roleplays killing her.\n\n");
			strcat(szMiscArray, "Please read these rules carefully as you will be quizzed on them afterwards, and you may be punished if you break one!");
			strcat(szMiscArray, "\n\n\n{FFFFFF}_______________________________________________________________________________________________________________________________________________________");
			ShowPlayerDialogEx(playerid, DIALOG_TUTORIAL, DIALOG_STYLE_MSGBOX, "LSR Tutorial - Rules", szMiscArray, countstring, "");
		}
		case 3:
		{
			szMiscArray = "{FFFFFF}_______________________________________________________________________________________________________________________________________________________\n\n\n";
			strcat(szMiscArray, "{F69500}Groups{FFFFFF}\n\n");
			strcat(szMiscArray, "It's fun to be a civilian, but it's more fun to join a group.\n\n");
			strcat(szMiscArray, "\tAt Next Generation Gaming, we offer more of a diverse selection of groups that players can join. There are many different types of groups:\n");
			strcat(szMiscArray, "\t{FF0000}Government (GOV){FFFFFF}: The government imposes new laws and manages the budget of San Andreas.\n");
			strcat(szMiscArray, "\t{FF0000}Judicial (JUD){FFFFFF}: They manage the constitution of San Andreas and manage court cases against people and agencies.\n");
			strcat(szMiscArray, "\t{FF0000}Law Enforcement Agency (LEA){FFFFFF}: They enfroce the laws written by the government and arrest violators of the law.\n");
			strcat(szMiscArray, "\t{FF0000}Medic (MED){FFFFFF}: The medics respond to distress calls of those in need and bring them to the hospital.\n");
			strcat(szMiscArray, "\t{FF0000}News Agency{FFFFFF}: News reporters will broadcast live news to the whole server regarding different incidents daily.\n");
			strcat(szMiscArray, "\t{FF0000}Towing & Reposession{FFFFFF}: They go around San Andreas towing illegally parked cars or ones with outstanding tickets, impounding them.\n");
			strcat(szMiscArray, "\t{FF0000}Transportation{FFFFFF}: They taxi around individuals who service them in exchange for a small fee.\n");
			strcat(szMiscArray, "\t{FF0000}Contract Agency{FFFFFF}: They perform illegal contract hits on those who have them.\n");
			strcat(szMiscArray, "\t{FF0000}Criminal{FFFFFF}: A group of criminals who do illegal things.\n\n");
			strcat(szMiscArray, "Some groups allow you to apply to join them once you meet certain requirements! Check out all the groups at ng-gaming.net.");
			strcat(szMiscArray, "\n\n\n{FFFFFF}_______________________________________________________________________________________________________________________________________________________");
			ShowPlayerDialogEx(playerid, DIALOG_TUTORIAL, DIALOG_STYLE_MSGBOX, "LSR Tutorial - Groups", szMiscArray, countstring, "");
		}
		case 4:
		{
			szMiscArray = "{FFFFFF}_______________________________________________________________________________________________________________________________________________________\n\n\n";
			strcat(szMiscArray, "{F69500}Property{FFFFFF}\n\n");
			strcat(szMiscArray, "Players can own different property around the server, some cost more than others. Properties are meant to enhance your roleplay experience.\n\n");
			strcat(szMiscArray, "\tThere are several different types of properties:\n");
			strcat(szMiscArray, "\t{FF0000}Housing{FFFFFF}: Represented by a green icon, houses are everywhere around the server.\n");
			strcat(szMiscArray, "\t{FF0000}Businesses{FFFFFF}: These are represented by a variety of different icons depending upon their type, but these allow you to purchase different things.\n");
			strcat(szMiscArray, "\t{FF0000}Doors{FFFFFF}: Used for any purpose, they have an exterior and an interior and are typically marked by a floating downwards arrow but can have different icons.\n");
			strcat(szMiscArray, "\t{FF0000}Garages{FFFFFF}: These are used for entering and exiting with a vehicle and are represented by a text label marked \"Garage\".\n");
			strcat(szMiscArray, "\t{FF0000}Vehicles{FFFFFF}: Players may purchase vehicles from dealerships at any time, and use them when they wish.\n\n");
			strcat(szMiscArray, "You can enter and exit property by pressing 'N' on your keyboard when near the icon.");
			strcat(szMiscArray, "\n\n\n{FFFFFF}_______________________________________________________________________________________________________________________________________________________");
			ShowPlayerDialogEx(playerid, DIALOG_TUTORIAL, DIALOG_STYLE_MSGBOX, "LSR Tutorial - Groups", szMiscArray, countstring, "");
		}
		case 5:
		{
			szMiscArray = "{FFFFFF}_______________________________________________________________________________________________________________________________________________________\n\n\n";
			strcat(szMiscArray, "{F69500}Finished{FFFFFF}\n\n");
			strcat(szMiscArray, "We are now finished with the tutorial. You will now be quizzed on many of the aspects covered in the tutorial.\n\n");
			strcat(szMiscArray, "\tIf you feel you are not ready to take the quiz, you make repeat the tutorial by pressing \"Repeat\". Otherwise, hit \"Continue\".\n");
			strcat(szMiscArray, "\tIf you get any question wrong, you will be forced to retake the tutorial and will be quizzed again afterwards.\n\n");
			strcat(szMiscArray, "{FF0000}What would you like to do?{FFFFFF}");
			strcat(szMiscArray, "\n\n\n{FFFFFF}_______________________________________________________________________________________________________________________________________________________");
			ShowPlayerDialogEx(playerid, DIALOG_TUTORIAL, DIALOG_STYLE_MSGBOX, "LSR Tutorial - Groups", szMiscArray, "Tiep tuc", "Xem lai");
		}
		case 6:
		{
			SetPlayerCameraPos(playerid, -2026.9594, -117.1733, 1036.1282);
			SetPlayerCameraLookAt(playerid, -2026.5365, -116.2688, 1035.9733);
			SetPlayerInterior(playerid, 3);

			SendClientMessage(playerid, -1, "Bay gio ban dang o trong huong dan. Doc cac cau hoi va cau tra loi can than. Neu ban bo lo mot cau hoi, ban se buoc phai lap lai huong dan!");

			ShowPlayerDialogEx(playerid, DIALOG_TUTORIAL, DIALOG_STYLE_LIST, "Cach chinh xac de viet mot tuyen bo ra khoi nhan vat la gi?", "Viet no trong hop tro chuyen.\n\"Danh dau ngoac kep xung quanh no\".\n**(( Su dung dau ngoac kep. ))", "tiep tuc", "");
		}
		case 7: ShowPlayerDialogEx(playerid, DIALOG_TUTORIAL, DIALOG_STYLE_LIST, "Dinh nghia cua {FF0000}Metagaming?", "**Tron thong tin IC voi OOC.\nChoi nhieu game cung mot luc.\nBuoc nguoi choi khac vao tinh huong nhap vai.", "Tiep tuc", "");
		case 8: ShowPlayerDialogEx(playerid, DIALOG_TUTORIAL, DIALOG_STYLE_LIST, "Dinh nghia cua {FF0000}Powergaming?", "Dang nhap bang mot hoac nhieu tai khoan cung luc.\nChoi nhieu game cung mot luc.\n**Buoc nguoi choi khac vao tinh huong nhap vai.", "Tiep tuc", "");
		case 9: ShowPlayerDialogEx(playerid, DIALOG_TUTORIAL, DIALOG_STYLE_LIST, "Dinh nghia cua {FF0000}Deathmatching?", "Giet chinh minh de tranh mot tinh huong.\nKhi ban chay tron canh sat.\n**Giet nguoi ma khong co ly do nhap vai thich hop.", "Tiep tuc", "");
		case 10: ShowPlayerDialogEx(playerid, DIALOG_TUTORIAL, DIALOG_STYLE_LIST, "Dinh nghia cua {FF0000}Killing on Sight?", "Giet chinh minh de tranh mot tinh huong.\n**Giet nguoi ma khong nhap vai dung cach thuc hien truoc.\nGiet mot si quan canh sat.", "Tiep tuc", "");
		case 11:
		{
			szMiscArray = "{FFFFFF}_______________________________________________________________________________________________________________________________________________________\n\n\n";
			strcat(szMiscArray, "{F69500}Useful Commands{FFFFFF}\n\n");
			strcat(szMiscArray, "At Next Generation Gaming, we have a lot of commands you can use to enhance your experience. You may use /help to refer to some of these.\n\n");
			strcat(szMiscArray, "\t{FF0000}/newb(ie){FFFFFF} - Ask a question, and one of our Advisors will answer it!\n");
			strcat(szMiscArray, "\t{FF0000}/(cancel)report{FFFFFF} - Contact an administrator if you need one or report another player for breaking the rules.\n");
			strcat(szMiscArray, "\t{FF0000}/stats{FFFFFF} - View various information attached to your account.\n");
			strcat(szMiscArray, "\t{FF0000}/inv(entory){FFFFFF} - Find out how much of each item you have in your inventory.\n");
			strcat(szMiscArray, "\t{FF0000}/interact{FFFFFF} - Interact with another player by giving/selling items, etc. (You may also use RMB+Y over a player to perform this)\n");
			strcat(szMiscArray, "\t{FF0000}/pay{FFFFFF} - Pay another player a certain amount of money.\n");
			strcat(szMiscArray, "\n\n\n{FFFFFF}_______________________________________________________________________________________________________________________________________________________");
			ShowPlayerDialogEx(playerid, DIALOG_TUTORIAL, DIALOG_STYLE_MSGBOX, "LSR Tutorial - Commands", szMiscArray, "Continue", "");
		}
		case 12:
		{
			szMiscArray = "{FFFFFF}_______________________________________________________________________________________________________________________________________________________\n\n\n";
			strcat(szMiscArray, "You are now completely finished with the tutorial. Press the next button to be taken to the character creation menu.\n\n");
			strcat(szMiscArray, "\t{F69521}Developers\n");
			strcat(szMiscArray, "\t\t{F69521}Director of Development{FFFFFF}:\n\t\t\tShane\n\n");
			strcat(szMiscArray, "\t\t{F69521}Developers{FFFFFF}:\n\
				\t\t\tMiguel\n\
				\t\t\tFarva\n\
				\t\t\tHector\n\
				\t\t\tThomas\n\
				\t\t{F69500}Past Developers{FFFFFF}:\n\
				\t\t\tAkatony\tJohn\t\tBrendan\n\
				\t\t\tBrian\t\tScott\t\tGhoulSlayer\n\
				\t\t\tZhao\t\tDonuts\t\tMo Cena\n\
				\t\t\tCalgon\t\tNeo\t\tThomasJ\n\
				\t\t\tBeren\t\tKareemtastic\tSew Sumi\n\
				\t\t\tRazbit\t\tAlexR\t\tAustin\n\
				\t\t\tDom\t\tRothschild\tWinterfield\n\
				\t\t\tJingles\tBehemoth\tWesten\n\
				\t\t\tConnolly\n");
			strcat(szMiscArray, "\n\n{FFFFFF}_______________________________________________________________________________________________________________________________________________________");
			ShowPlayerDialogEx(playerid, DIALOG_TUTORIAL, DIALOG_STYLE_MSGBOX, "LSR - Developers", szMiscArray, "Continue", "");
		}
	}
	return 1;
}

hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[]) {

	if(arrAntiCheat[playerid][ac_iFlags][AC_DIALOGSPOOFING] > 0) return 1;
	switch(dialogid)
	{
		case DIALOG_TUTORIAL:
		{
			switch(PlayerInfo[playerid][pTut])
			{
				case 0 .. 4:
				{
					if(betaserver == 0) {
						if(GetPVarInt(playerid, "pTutorialTimer") != 0) return ShowTutorialDialog(playerid, PlayerInfo[playerid][pTut]);
						else
						{
							PlayerInfo[playerid][pTut]++;
							AdvanceTutorial(playerid);
						}
					} else {
						PlayerInfo[playerid][pTut] = 13;
						AdvanceTutorial(playerid);
					}
				}
				case 5:
				{
					if(!response)
					{
						PlayerInfo[playerid][pTut] = 0;
						AdvanceTutorial(playerid);

						SendClientMessage(playerid, -1, "Ban da quyet dinh lap lai huong dan. Vui long dam bao doc moi thu can than truoc khi tiep tuc!");
					}
					else
					{
						PlayerInfo[playerid][pTut]++;
						AdvanceTutorial(playerid);
					}
				}
				case 6:
				{
					if(!response) return AdvanceTutorial(playerid);
					switch(listitem)
					{
						case 0, 1:
						{
							PlayerInfo[playerid][pTut] = 0;
							AdvanceTutorial(playerid);

							SendClientMessage(playerid, -1, "Do la cau tra loi sai! Bay gio ban phai lam lai huong dan. Hay chu y hon o lan nay!");
						}
						default:
						{
							PlayerInfo[playerid][pTut]++;
							AdvanceTutorial(playerid);
						}
					}
				}
				case 7:
				{
					if(!response) return AdvanceTutorial(playerid);
					switch(listitem)
					{
						case 1, 2:
						{
							PlayerInfo[playerid][pTut] = 0;
							AdvanceTutorial(playerid);

							SendClientMessage(playerid, -1, "Do la cau tra loi sai! Bay gio ban phai lam lai huong dan. Hay chu y hon o lan nay!");
						}
						default:
						{
							PlayerInfo[playerid][pTut]++;
							AdvanceTutorial(playerid);
						}
					}
				}
				case 8:
				{
					if(!response) return AdvanceTutorial(playerid);
					switch(listitem)
					{
						case 0, 1:
						{
							PlayerInfo[playerid][pTut] = 0;
							AdvanceTutorial(playerid);

							SendClientMessage(playerid, -1, "Do la cau tra loi sai! Bay gio ban phai lam lai huong dan. Hay chu y hon o lan nay!");
						}
						default:
						{
							PlayerInfo[playerid][pTut]++;
							AdvanceTutorial(playerid);
						}
					}
				}
				case 9:
				{
					if(!response) return AdvanceTutorial(playerid);
					switch(listitem)
					{
						case 0, 1:
						{
							PlayerInfo[playerid][pTut] = 0;
							AdvanceTutorial(playerid);

							SendClientMessage(playerid, -1, "Do la cau tra loi sai! Bay gio ban phai lam lai huong dan. Hay chu y hon o lan nay!");
						}
						default:
						{
							PlayerInfo[playerid][pTut]++;
							AdvanceTutorial(playerid);
						}
					}
				}
				case 10:
				{
					if(!response) return AdvanceTutorial(playerid);
					switch(listitem)
					{
						case 0, 2:
						{
							PlayerInfo[playerid][pTut] = 0;
							AdvanceTutorial(playerid);

							SendClientMessage(playerid, -1, "Do la cau tra loi sai! Bay gio ban phai lam lai huong dan. Hay chu y hon o lan nay!");
						}
						default:
						{
							PlayerInfo[playerid][pTut]++;
							AdvanceTutorial(playerid);
						}
					}
				}
				case 11, 12:
				{
					PlayerInfo[playerid][pTut]++;
					AdvanceTutorial(playerid);
				}
				case 13: CharacterCreation(playerid);
				case 14:
				{
					if(!response) 
					{
						PlayerInfo[playerid][pTut] = -1;
						DisablePlayerCheckpoint(playerid);
						return SendClientMessageEx(playerid, -1, "Chao mung ban den New City Role Play! Nho su dung /help neu ban can xem lai cac lenh hoac /newb(ie) de nho tro giup!");
					}
					else
					{
						PlayerInfo[playerid][pTut]++;
						AdvanceTutorial(playerid);
						SendClientMessageEx(playerid, COLOR_WHITE, "Ban da chon muc tiep. Vui long go \"/cancel objectives\" de huy bat cu luc nao.");
					}
				}
			}
		}
		case DIALOG_REGISTER_CREATION:
		{
			if(!response) return CharacterCreation(playerid);
			switch(listitem)
			{
				case 0: return CharacterCreation(playerid);
				case 1: return ShowPlayerDialogEx(playerid, DIALOG_REGISTER_SEX, DIALOG_STYLE_LIST, "LSR Tao nhan vat | Chon gioi tinh", "Nam\nNu", "Lua chon", "<<");
				case 2: return ShowPlayerDialogEx(playerid, DIALOG_REGISTER_MONTH, DIALOG_STYLE_LIST, "{FF0000}Nhan vat cua ban sinh vao thang may?", "Thang 1\nThang 2\nThang 3\nThang 4\nThang 5\nThang 6\nThang 7\nThang 8\nThang 9\nThang 10\nThang 11\nThang 12", "Lua chon", "<<");
				case 3: return ShowPlayerDialogEx(playerid, DIALOG_REGISTER_NATION, DIALOG_STYLE_LIST, "LSR Tao nhan vat | Quoc gia", "San Andreas", "Lua chon", "<<");
				case 4:
				{
					szMiscArray[0] = 0;
					szMiscArray = "Khong giong\n\
					British accent\n\
					Japanese accent\n\
					Chinese accent\n\
					Korean accent\n\
					Scottish accent\n\
					Irish accent\n\
					Russian accent\n\
					American accent\n\
					Spanish accent\n\
					Southern accent\n\
					Italian accent\n\
					Southern accent\n\
					Gangster accent\n\
					Australian accent\n\
					Arabic accent\n\
					Balkan accent\n\
					Canadian accent\n\
					Jamaican accent\n\
					Israeli accent\n\
					Dutch accent\n\
					Brazilian accent\n\
					German accent\n\
					Turkish accent\n\
					Kiwi accent\n\
					French accent\n\
					Korean accent\n\
					Thai accent";
					return ShowPlayerDialogEx(playerid, DIALOG_REGISTER_ACCENT, DIALOG_STYLE_LIST, "LSR Tao nhan vat | Giong", szMiscArray, "Lua chon", "<<");
				}
				case 5:
				{
					if(PlayerInfo[playerid][pSex] == 0) { 
						SendClientMessage(playerid, COLOR_YELLOW, "Vui long chon gioi tinh truoc.");
						return ShowPlayerDialogEx(playerid, DIALOG_REGISTER_SEX, DIALOG_STYLE_LIST, "LSR Tao nhan vat | Kieu trang phuc", "Nam\nNu", "Lua chon", "<<");
					}

               		ShowPlayerDialogEx(playerid, DIALOG_REGISTER_SKIN, DIALOG_STYLE_INPUT, "LSR Tao nhan vat | Kieu trang phuc", "Vui long nhap ID trang phuc cua ban vao.", "Lua chon", "<<");
               	}
				
				case 6:
				{
					if(PlayerInfo[playerid][pSex] == 0)
					{
						SendClientMessage(playerid, COLOR_YELLOW, "Vui long chon mot gioi tinh.");
						return ShowPlayerDialogEx(playerid, DIALOG_REGISTER_SEX, DIALOG_STYLE_LIST, "LSR Tao nhan vat | Kieu trang phuc", "Nam\nNu", "Lua chon", "<<");

					}
					if(strcmp(PlayerInfo[playerid][pBirthDate], "0000-00-00") == 0)
					{
						SendClientMessage(playerid, COLOR_YELLOW, "Vui long ghi ro ngay sinh cua ban.");
						return ShowPlayerDialogEx(playerid, DIALOG_REGISTER_MONTH, DIALOG_STYLE_LIST, "{FF0000}Nhan vat cua ban sinh vao thang may?", "Thang 1\nThang 2\nThang 3\nThang 4\nThang 5\nThang 6\nThang 7\nThang 8\nThang 9\nThang 10\nThang 11\nThang 12", "Lua chon", "<<");
					}

					if(PlayerInfo[playerid][pNation] != 0 && PlayerInfo[playerid][pNation] != 1) return ShowPlayerDialogEx(playerid, DIALOG_REGISTER_NATION, DIALOG_STYLE_LIST, "LSR Tao nhan vat | Quoc gia", "San Andreas", "Lua chon", "<<");

					ShowPlayerDialogEx(playerid, DIALOG_REGISTER_REFERRED, DIALOG_STYLE_INPUT, "{FF0000}He thong chuyen tuyen", "Ban da duoc mot trong nhung nguoi choi cua chung toi gioi thieu den may chu cua chung toi chua?\nNeu vay vui long nhap ten nguoi choi do.\n\nNeu ban chua duoc ai gioi thieu, ban co the nhan nut bo qua.\n\n{FF0000}Ghi chu: Ban phai nhap ten nguoi choi voi dau gach duoi (Vi du: Ho_Ten)", "Nhap", "Bo qua");
					return 1;
				}
			}
		}
		case DIALOG_REGISTER_SKIN: {

			if(response && !isnull(inputtext) && IsNumeric(inputtext) && IsValidSkin(strval(inputtext))) {

			    PlayerInfo[playerid][pModel] = strval(inputtext);
				AdjustActor(playerid, strval(inputtext));
			}
			CharacterCreation(playerid);
		}
		case DIALOG_REGISTER_SEX:
	    {
		    if(response)
		    {
			    if(listitem == 0) {
					PlayerInfo[playerid][pSex] = 1;
					PlayerInfo[playerid][pModel] = 2;
					AdjustActor(playerid, 2);
					SendClientMessage(playerid, COLOR_YELLOW2, "Duoc roi, ban la nam!");
					CharacterCreation(playerid);
				}
				else if(listitem == 1) {
					PlayerInfo[playerid][pSex] = 2;
					PlayerInfo[playerid][pModel] = 91;
					AdjustActor(playerid, 91);
					SendClientMessage(playerid, COLOR_YELLOW2, "Duoc roi, ban la nu!");
					CharacterCreation(playerid);
				}
			}
			else ShowPlayerDialogEx(playerid, DIALOG_REGISTER_SEX, DIALOG_STYLE_LIST, "{FF0000}Nhan vat cua ban la nam hay nu?", "Nam\nNu", "Chon", "");
		}
		case DIALOG_REGISTER_NATION: 
		{
			if(response) 
			{
				PlayerInfo[playerid][pNation] = listitem;
				switch(listitem) 
				{
					case 0: SendClientMessageEx(playerid, COLOR_GRAD1, "Ban hien la cong dan cua San Andreas.");
					case 1: SendClientMessageEx(playerid, COLOR_GRAD1, "Ban hien la cong dan cua New Robada.");
				}
			}
			CharacterCreation(playerid);
		}
		case DIALOG_REGISTER_MONTH:
	    {
			if(response)
			{
				szMiscArray[0] = 0;
				new month = listitem+1;
				SetPVarInt(playerid, "RegisterMonth", month);

				new lastdate;
				if(listitem == 0 || listitem == 2 || listitem == 4 || listitem == 6 || listitem == 7 || listitem == 9 || listitem == 11) lastdate = 32;
				else if(listitem == 3 || listitem == 5 || listitem == 8 || listitem == 10) lastdate = 31;
				else lastdate = 29;
				for(new x = 1; x < lastdate; x++)
				{
					format(szMiscArray, sizeof(szMiscArray), "%s%d\n", szMiscArray, x);
				}
				ShowPlayerDialogEx(playerid, DIALOG_REGISTER_DAY, DIALOG_STYLE_LIST, "{FF0000}Nhan vat cua ban sinh ra vao ngay nao?", szMiscArray, "Gui", "");
			}
			else return CharacterCreation(playerid);
		}
		case DIALOG_REGISTER_DAY:
	    {
	    	szMiscArray[0] = 0;
			if(response)
			{
				new setday = listitem+1;
				SetPVarInt(playerid, "RegisterDay", setday);

				new month, day, year;
				getdate(year,month,day);
				new startyear = year-100;
				for(new x = startyear; x < year; x++)
				{
					format(szMiscArray, sizeof(szMiscArray), "%s%d\n", szMiscArray, x);
				}
				ShowPlayerDialogEx(playerid, DIALOG_REGISTER_YEAR, DIALOG_STYLE_LIST, "{FF0000}Nhan vat cua ban sinh ra nam nao?", szMiscArray, "Gui", "");
			}
			else ShowPlayerDialogEx(playerid, DIALOG_REGISTER_MONTH, DIALOG_STYLE_LIST, "{FF0000}Nhan vat cua ban sinh ra thang nao?", "Thang 1\nThang 2\nThang 3\nThang 4\nThang 5\nThang 6\nThang 7\nThang 8\nThang 9\nThang 10\nThang 11\nThang 12", "Chon", "");
		}
		case DIALOG_REGISTER_YEAR:
	    {
	    	szMiscArray[0] = 0;
			new month, day, year;
			getdate(year,month,day);
			new startyear = year-100;
			if(response)
			{
				new setyear = listitem+startyear;
				format(PlayerInfo[playerid][pBirthDate], 11, "%d-%02d-%02d", setyear, GetPVarInt(playerid, "RegisterMonth"), GetPVarInt(playerid, "RegisterDay"));
				DeletePVar(playerid, "RegisterMonth");
				DeletePVar(playerid, "RegisterDay");
				SendClientMessage(playerid, COLOR_LIGHTRED, "Ngay sinh cua nhan vat ban da thiet lap thanh cong.");
				return CharacterCreation(playerid);
			}
			else
			{
				for(new x = startyear; x < year; x++)
				{
					format(szMiscArray, sizeof(szMiscArray), "%s%d\n", szMiscArray, x);
				}
				ShowPlayerDialogEx(playerid, DIALOG_REGISTER_YEAR, DIALOG_STYLE_LIST, "{FF0000}Nhan vat cua ban sinh ra nam nao?", szMiscArray, "Gui", "");
			}
		}
		case DIALOG_REGISTER_ACCENT:
		{
			if(response)
			{
				if(listitem == 0) PlayerInfo[playerid][pAccent] = listitem;
				if(listitem > 0) PlayerInfo[playerid][pAccent] = listitem+1;
			}
			return CharacterCreation(playerid);
		}
		case DIALOG_REGISTER_REFERRED:
		{
		    if(response)
		    {
		        if(IsNumeric(inputtext))
		        {
		            ShowPlayerDialogEx(playerid, DIALOG_REGISTER_REFERRED, DIALOG_STYLE_INPUT, "{FF0000}Loi - Ten nhan vat khong hop le", "Day khong phai la mot ten nhap vai\nVui long nhap ten Roleplay thich hop.\n\nVi du: Ho_Ten", "Nhap", "Bo qua");
		            return 1;
				}
				if(strfind(inputtext, "_", true) == -1)
				{
				    ShowPlayerDialogEx(playerid, DIALOG_REGISTER_REFERRED, DIALOG_STYLE_INPUT, "{FF0000}Loi - Ten nhan vat khong hop le", "Day khong phai la mot ten nhap vai\nVui long nhap ten Roleplay thich hop.\n\nVi du: Ho_Ten", "Nhap", "Bo qua");
		            return 1;
		        }
		        if(strlen(inputtext) > 20)
		        {
		            ShowPlayerDialogEx(playerid, DIALOG_REGISTER_REFERRED, DIALOG_STYLE_INPUT, "{FF0000}Loi - Ten nhan vat khong hop le", "Cai ten do qua dai\nVui long rut ngan ten.\n\nVi du: Ho_Ten (20 ky tu toi da)", "Nhap", "Bo qua");
		            return 1;
		        }
		        if(strcmp(inputtext, GetPlayerNameExt(playerid), true) == 0)
		        {
		            ShowPlayerDialogEx(playerid, DIALOG_REGISTER_REFERRED, DIALOG_STYLE_INPUT, "{FF0000}Loi", "Ban khong the them minh lam nguoi gioi thieu.\nVui long nhap ten nguoi gioi thieu hoac nhan 'Bo qua'.\n\nVi du: Ho_Ten (20 ky tu toi da)", "Nhap", "Bo qua");
		            return 1;
		        }
				for(new sz = 0; sz < strlen(inputtext); sz++)
				{
				    if(inputtext[sz] == ' ')
				    {
					    ShowPlayerDialogEx(playerid, DIALOG_REGISTER_REFERRED, DIALOG_STYLE_INPUT, "{FF0000}Loi - Ten nhan vat khong hop le", "Day khong phai la mot ten nhap vai\nVui long nhap ten Roleplay thich hop.\n\nVi du: Ho_Ten", "Nhap", "Bo qua");
			            return 1;
			        }
			    }
			  	mysql_escape_string(inputtext, szMiscArray);
                format(PlayerInfo[playerid][pReferredBy], MAX_PLAYER_NAME, "%s", szMiscArray);
                mysql_format(MainPipeline, szMiscArray, sizeof(szMiscArray), "SELECT `Username` FROM `accounts` WHERE `Username` = '%e'", inputtext);
         		mysql_tquery(MainPipeline, szMiscArray, "OnQueryFinish", "iii", MAIN_REFERRAL_THREAD, playerid, g_arrQueryHandle{playerid});
			}
			else
			{
			    format(szMiscArray, sizeof(szMiscArray), "Nobody");
				strmid(PlayerInfo[playerid][pReferredBy], szMiscArray, 0, strlen(szMiscArray), MAX_PLAYER_NAME);
				PlayerInfo[playerid][pTut] = 14;
				AdvanceTutorial(playerid);
				SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "Cam on ban da dien vao tat ca thong tin!");
			}
		}
	}
	return 0;
}

hook OnPlayerEnterCheckpoint(playerid)
{
	if(PlayerInfo[playerid][pTut] >= 0)
	{
		switch(PlayerInfo[playerid][pTut])
		{
			case 15:
			{
				DisablePlayerCheckpoint(playerid);
				SendClientMessage(playerid, COLOR_WHITE, "Vao bat ky chiec xe ban co du so tien de mua!");
			}
			case 16:
			{
				DisablePlayerCheckpoint(playerid);
				SendClientMessage(playerid, COLOR_WHITE, "Vao ngan hang, lai quay nhan vien de chuot phai nhan 'Y' de tuong tac voi nhan vien ngan hang!");
			}
			case 17:
			{
				DisablePlayerCheckpoint(playerid);
				SendClientMessage(playerid, COLOR_WHITE, "Vao cua hang go /mua de mua dien thoai.");
			}
		}
	}
}

forward AdjustActor(playerid, skinid);
public AdjustActor(playerid, skinid) 
{
	new id;
	if(PlayerInfo[playerid][pTut] == 13 && GetPVarType(playerid, "pActor")) 
	{
		id = GetPVarInt(playerid, "pActor");
		if(IsValidActor(id)) DestroyActor(id);
	}

	id = CreateActor(skinid, 221.1730, 1823.6620, 7.5124, 270.0);
	SetPVarInt(playerid, "pActor", id);
	SetActorVirtualWorld(id, playerid + 1);
	SetPlayerSkin(playerid, skinid);
	return 1;
}

forward TutorialTimer(playerid);
public TutorialTimer(playerid)
{
	if(GetPVarInt(playerid, "pTutorialTimer") > 0) 
	{
		SetPVarInt(playerid, "pTutorialTimer", GetPVarInt(playerid, "pTutorialTimer") - 1);
		ShowTutorialDialog(playerid, PlayerInfo[playerid][pTut]);
	}
	else KillTimer(TutorialTime[playerid]);
	return 1;
}

GetPlayerAccent(iPlayerID) 
{
	new accent[26];
	switch(PlayerInfo[iPlayerID][pAccent]) 	
	{
		case 0, 1: accent = "";
		case 2: accent = "British accent";
		case 3: accent = "Japanese accent";
		case 4: accent = "Chinese accent";
		case 5: accent = "Korean accent";
		case 6: accent = "Scottish accent";
		case 7: accent = "Irish accent";
		case 8: accent = "Russian accent";
		case 9: accent = "American accent";
		case 10, 12: accent = "Spanish accent";
		case 11: accent = "Southern accent";
		case 13: accent = "Italian accent";
		case 14: accent = "Gangster accent";
		case 15: accent = "Australian accent";
		case 16: accent = "Arabic accent";
		case 17: accent = "Balkan accent";
		case 18: accent = "Canadian accent";
		case 19: accent = "Jamaican accent";
		case 20: accent = "Israeli accent";
		case 21: accent = "Dutch accent";
		case 22: accent = "Brazilian accent";
		case 23: accent = "German accent";
		case 24: accent = "Turkish accent";
		case 25: accent = "Kiwi accent";
		case 26: accent = "French accent";
		case 27: accent = "Korean accent";
		case 28: accent = "Thai accent";
	}
	return accent;
}

hook OnPlayerDisconnect(playerid, reason)
{
	if(GetPVarType(playerid, "pActor")) DestroyActor(GetPVarInt(playerid, "pActor"));
	return 1;
}

CMD:forcetutorial(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] >= 3)
	{
		new id;
		if(sscanf(params, "u", id)) return SendClientMessageEx(playerid, COLOR_WHITE, "SYNTAX: /forcetutorial [playerid]");

		if(IsPlayerConnected(id))
		{
			szMiscArray[0] = 0;
			switch(PlayerInfo[id][pTut])
			{
				case 0 .. 12:
				{
					PlayerInfo[id][pTut] = 13;
					AdvanceTutorial(id);

					format(szMiscArray, 128, "Ban da gui %s vao Menu tao nhan vat.", GetPlayerNameEx(id));
					SendClientMessage(playerid, COLOR_WHITE, szMiscArray);
					format(szMiscArray, 128, "Administrator %s da thiet lap ban vao Menu tao nhan vat.", GetPlayerNameEx(playerid));
					SendClientMessage(id, COLOR_WHITE, szMiscArray);
				}
				case 13: return SendClientMessage(playerid, COLOR_WHITE, "This player is currently in the character creation menu, please wait.");
				case 14 .. 18:
				{
					PlayerInfo[id][pTut] = -1;
					AdvanceTutorial(id);

					format(szMiscArray, 128, "You have forced %s out of the tutorial.", GetPlayerNameEx(id));
					SendClientMessage(playerid, COLOR_WHITE, szMiscArray);
					format(szMiscArray, 128, "Administrator %s has forced you out of the tutorial.", GetPlayerNameEx(playerid));
					SendClientMessage(id, COLOR_WHITE, szMiscArray);
				}
				default: return SendClientMessage(playerid, COLOR_WHITE, "This player is not in the tutorial.");
			}
		}
		else return SendClientMessage(playerid, COLOR_WHITE, "This player is not connected!");
	}
	else SendClientMessage(playerid, COLOR_WHITE, "You are not authorized to perform this command!");
	return 1;
}
