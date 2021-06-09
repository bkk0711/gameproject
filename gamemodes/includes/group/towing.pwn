/*

	 /$$   /$$  /$$$$$$          /$$$$$$$  /$$$$$$$
	| $$$ | $$ /$$__  $$        | $$__  $$| $$__  $$
	| $$$$| $$| $$  \__/        | $$  \ $$| $$  \ $$
	| $$ $$ $$| $$ /$$$$ /$$$$$$| $$$$$$$/| $$$$$$$/
	| $$  $$$$| $$|_  $$|______/| $$__  $$| $$____/
	| $$\  $$$| $$  \ $$        | $$  \ $$| $$
	| $$ \  $$|  $$$$$$/        | $$  | $$| $$
	|__/  \__/ \______/         |__/  |__/|__/

						Towing Group Type

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
CMD:impound(playerid, params[]) {
	if(IsACop(playerid) || IsATowman(playerid)) {
		if(!IsAtImpoundingPoint(playerid)) return SendClientMessageEx(playerid, COLOR_GREY, "Ban khong o gan diem giam xe, ban khong the giam xe!");
		if(IsTrailerAttachedToVehicle(GetPlayerVehicleID(playerid))) {
			new veh = -1, iVehTowed = GetVehicleTrailer(GetPlayerVehicleID(playerid)), szMessage[128];
			if(!GetVehicleModel(iVehTowed)) return SendClientMessageEx(playerid, COLOR_GREY, "Chiec xe keo nay bo hoang va do do khong the bi tam giu.");
			// Player Vehicle.
			foreach(new i : Player) {
				if((veh = GetPlayerVehicle(i, iVehTowed)) != -1) {
					new iCost = (((PlayerVehicleInfo[i][veh][pvPrice] / 20 + PlayerVehicleInfo[i][veh][pvTicket]) / 100) * 30);
					SetGroupBudget(PlayerInfo[playerid][pMember], iCost);
					--PlayerCars;
					VehicleSpawned[i]--;
					PlayerVehicleInfo[i][veh][pvImpounded] = 1;
					PlayerVehicleInfo[i][veh][pvSpawned] = 0;
					PlayerVehicleInfo[i][veh][pvFuel] = VehicleFuel[iVehTowed];
					GetVehicleHealth(PlayerVehicleInfo[i][veh][pvId], PlayerVehicleInfo[i][veh][pvHealth]);
					DetachTrailerFromVehicle(iVehTowed);
					DestroyVehicle(iVehTowed);
					if(IsValidDynamicArea(iVehEnterAreaID[iVehTowed])) DestroyDynamicArea(iVehEnterAreaID[iVehTowed]);
					PlayerVehicleInfo[i][veh][pvId] = INVALID_PLAYER_VEHICLE_ID;
					g_mysql_SaveVehicle(playerid, veh);

					format(szMessage, sizeof(szMessage),"* Ban da bi giam xe %s's %s.",GetPlayerNameEx(i), VehicleName[PlayerVehicleInfo[i][veh][pvModelId] - 400]);
					SendClientMessageEx(playerid, COLOR_LIGHTBLUE, szMessage);

					format(szMessage, sizeof(szMessage), "%s cua ban da bi giam. Ban co the chuoc xe tai DMV trong Dillimore.", VehicleName[PlayerVehicleInfo[i][veh][pvModelId] - 400]);
					SendClientMessageEx(i, COLOR_LIGHTBLUE, szMessage);

					format(szMessage, sizeof(szMessage), "HQ: %s da giam xe %s's %s ($%s ve chua thanh toan).", GetPlayerNameEx(playerid), GetPlayerNameEx(i), VehicleName[PlayerVehicleInfo[i][veh][pvModelId] - 400], number_format(PlayerVehicleInfo[i][veh][pvTicket]));
					SendGroupMessage(arrGroupData[PlayerInfo[playerid][pMember]][g_iGroupType], RADIO, szMessage);
					
					format(szMessage, sizeof(szMessage), "GIAM XE: %s da giam xe %s's %s va gia $%s", GetPlayerNameEx(playerid), GetPlayerNameEx(i), VehicleName[PlayerVehicleInfo[i][veh][pvModelId] - 400], number_format(iCost));
					GroupLog(PlayerInfo[playerid][pMember], szMessage);
					break;
				}
			}
			// Crate Vehicle.
			if((veh = IsDynamicCrateVehicle(iVehTowed)) != -1) {
				if(ValidGroup(CrateVehicle[veh][cvGroupID])) {
					if(PlayerInfo[playerid][pMember] == CrateVehicle[veh][cvGroupID]) return SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "* To chuc cua ban so huu phuong tien nay ban khong the giam no!");
					new iCost = (((2000000 / 20 + CrateVehicle[veh][cvTickets]) / 100) * 30), Float:vHealth;
					SetGroupBudget(PlayerInfo[playerid][pMember], iCost);
					GetVehicleHealth(CrateVehicle[veh][cvSpawnID], vHealth);
					CrateVehicle[veh][cvHealth] = vHealth;
					CrateVehicle[veh][cvFuel] = VehicleFuel[CrateVehicle[veh][cvSpawnID]];
					CrateVehicle[veh][cvImpound] = 1;
					DetachTrailerFromVehicle(iVehTowed);
					if(CreateCount(veh) > 0) AnnounceRespawn(CrateVehicle[veh][cvGroupID], "impounded", veh, CreateCount(veh));
					DestroyVehicle(CrateVehicle[veh][cvSpawnID]);
					CrateVehicle[veh][cvSpawned] = 0;
					CrateVehicle[veh][cvSpawnID] = INVALID_VEHICLE_ID;
					CrateVehCheck(veh); // Ensure we check for crates!
					SaveCrateVehicle(veh);

					format(szMessage, sizeof(szMessage), "* %s cua ban da bi giam xe ban co chinh xe tu nha de xe cua ban. (( /cvstorage ))", VehicleName[CrateVehicle[veh][cvModel] - 400]);
					foreach(new i : Player) {
						if(PlayerInfo[i][pLeader] == CrateVehicle[veh][cvGroupID]) {
							ChatTrafficProcess(i, arrGroupData[CrateVehicle[veh][cvGroupID]][g_hRadioColour] * 256 + 255, szMessage, 12);
						}
					}

					format(szMessage, sizeof(szMessage),"* Ban da giam xe %s's %s.", arrGroupData[CrateVehicle[veh][cvGroupID]][g_szGroupName], VehicleName[CrateVehicle[veh][cvModel] - 400]);
					SendClientMessageEx(playerid, COLOR_LIGHTBLUE, szMessage);

					format(szMessage, sizeof(szMessage), "HQ: %s da giam xe %s's %s ($%s ve chua thanh toan).", GetPlayerNameEx(playerid), arrGroupData[CrateVehicle[veh][cvGroupID]][g_szGroupName], VehicleName[CrateVehicle[veh][cvModel] - 400], number_format(CrateVehicle[veh][cvTickets]));
					SendGroupMessage(arrGroupData[PlayerInfo[playerid][pMember]][g_iGroupType], RADIO, szMessage);

					format(szMessage, sizeof(szMessage), "GIAM XE: %s da giam xe %s's %s va gia $%s", GetPlayerNameEx(playerid), arrGroupData[CrateVehicle[veh][cvGroupID]][g_szGroupName], VehicleName[CrateVehicle[veh][cvModel] - 400], number_format(iCost));
					GroupLog(PlayerInfo[playerid][pMember], szMessage);

				}
				else veh = -1;
			}
			if(veh == -1) {
				SendClientMessageEx(playerid, COLOR_GRAD1, "Chinh quyen tam giu khong the tim thay bat ky dang ky tren chiec xe va da tra lai no.");
				DetachTrailerFromVehicle(iVehTowed);
				SetVehicleToRespawn(iVehTowed);
			}
			arr_Towing[playerid] = INVALID_VEHICLE_ID;
		}
	}
	return 1;
}