forward Countdown(playerid); //
public Countdown(playerid)
{
	if(PlayerInfo[playerid][pAdmin] >= 3 && PlayerInfo[playerid][pTogReports] == 0) {
	    if(CountDown == 0) {
	 		CountDown++;
	 		SendClientMessageToAll(COLOR_LIGHTBLUE, "** 3");
	 		SetTimerEx("Countdown", 1000, false, "i", playerid);
		} else if(CountDown == 1) {
		    CountDown++;
		    SendClientMessageToAll(COLOR_LIGHTBLUE, "** 2");
		    SetTimerEx("Countdown", 1000, false, "i", playerid);
		} else if(CountDown == 2) {
		    CountDown++;
		    SendClientMessageToAll(COLOR_LIGHTBLUE, "** 1");
		    SetTimerEx("Countdown", 1000, false, "i", playerid);
		} else if(CountDown == 3) {
		    CountDown = 0;
		    SendClientMessageToAll(COLOR_LIGHTBLUE, "** Go Go Go!");
		}
	}
	else if(IsARacer(playerid)){
	    if(CountDown == 0) {
	 		CountDown++;
			ProxDetector(30.0, playerid, "** [Dem nguoc] 3 **", 0xEB41000, 0xEB41000, 0xEB41000, 0xEB41000, 0xEB41000);
			SetTimerEx("Countdown", 1000, false, "i", playerid);
		} else if(CountDown == 1) {
		    CountDown++;
		    ProxDetector(30.0, playerid, "** [Dem nguoc] 2 **", 0xEB41000, 0xEB41000, 0xEB41000, 0xEB41000, 0xEB41000);
		    SetTimerEx("Countdown", 1000, false, "i", playerid);
		} else if(CountDown == 2) {
		    CountDown++;
		    ProxDetector(30.0, playerid, "** [Dem nguoc] 1 **", 0xEB41000, 0xEB41000, 0xEB41000, 0xEB41000, 0xEB41000);
		    SetTimerEx("Countdown", 1000, false, "i", playerid);
		} else if(CountDown == 3) {
		    CountDown = 0;
		    ProxDetector(30.0, playerid, "** [Dem nguoc] Go Go Go! **", 0xEB41000, 0xEB41000, 0xEB41000, 0xEB41000, 0xEB41000);
		}
	}
	else if(IsARacer(playerid) && PlayerInfo[playerid][pTogReports] == 1) {
	    if(CountDown == 0) {
	 		CountDown++;
			ProxDetector(30.0, playerid, "** [Dem nguoc] 3 **", 0xEB41000, 0xEB41000, 0xEB41000, 0xEB41000, 0xEB41000);
			SetTimerEx("Countdown", 1000, false, "i", playerid);
		} else if(CountDown == 1) {
		    CountDown++;
		    ProxDetector(30.0, playerid, "** [Dem nguoc] 2 **", 0xEB41000, 0xEB41000, 0xEB41000, 0xEB41000, 0xEB41000);
		    SetTimerEx("Countdown", 1000, false, "i", playerid);
		} else if(CountDown == 2) {
		    CountDown++;
		    ProxDetector(30.0, playerid, "** [Dem nguoc] 1 **", 0xEB41000, 0xEB41000, 0xEB41000, 0xEB41000, 0xEB41000);
		    SetTimerEx("Countdown", 1000, false, "i", playerid);
		} else if(CountDown == 3) {
		    CountDown = 0;
		    ProxDetector(30.0, playerid, "** [Dem nguoc] Go Go Go! **", 0xEB41000, 0xEB41000, 0xEB41000, 0xEB41000, 0xEB41000);
		}
	}
	return 1;
}
