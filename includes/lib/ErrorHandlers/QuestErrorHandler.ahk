#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

Advertisement()
{
	global DECLINEADVERTISEMENT_BUTTON, DECLINEADVERTISEMENTMYPAGE_BUTTON
	if DetectObject(DECLINEADVERTISEMENT_BUTTON)
	{
		WaitObject(DECLINEADVERTISEMENT_BUTTON)
		ClickObject(DECLINEADVERTISEMENT_BUTTON)
	}
	else if DetectObject(DECLINEADVERTISEMENTMYPAGE_BUTTON)
	{
		WaitObject(DECLINEADVERTISEMENTMYPAGE_BUTTON)
		ClickObject(DECLINEADVERTISEMENTMYPAGE_BUTTON)
	}
}

ConnectionError()
{
	global CONFIRMEXITAPP_BUTTON, CONNECTIONERROR_BUTTON, CONNECTIONERROR_TEXT, STARTGAME_BUTTON
	if (DetectObject(CONNECTIONERROR_BUTTON) || DetectObject(CONNECTIONERROR_TEXT))
	{
		SB_SetText("Detected a Connection error. Handling it right now.")
		Sleep 1000
		
		while not DetectObject(STARTGAME_BUTTON)
		{
			if (DetectObject(CONNECTIONERROR_BUTTON) || DetectObject(CONNECTIONERROR_TEXT))
			{
				SB_SetText("Detected a Connection error. Handling it right now. Pressing down ESC")
				Send {ESC down}
				Sleep 1000
				Send {ESC up}
			}
			if DetectObject(CONFIRMEXITAPP_BUTTON)
			{
				WaitObject(CONFIRMEXITAPP_BUTTON)
				ClickObject(CONFIRMEXITAPP_BUTTON)
				
				Reload
			}
			; code may not be reached
			if LaunchGame()
				Reload
		}
	}
	return 0
}

;ConnectionError() is imbedded in the LaunchGame procedure
LaunchGame()
{
	global ALLYPENDINGREQUEST_TEXT, ANNOUNCEMENT_BUTTON, ALLY_TEXT, BACK_BUTTON, MYPAGEID_TEXT, MYPAGEID2_TEXT, QUEST1_ICON, QUEST2_ICON, SELECTEPISODE_BUTTON, CLOSEADVERTISEMENT_BUTTON
	global SLEEPTIME, STARTGAME_BUTTON, TRAINING_TEXT, TRAINING1_ICON, TRAINING2_ICON, MAYBELATERADVERTISEMENT_BUTTON, CANCELADVERTISEMENT_BUTTON, FANTASICALOADPAGE_TEXT, FORCECLOSEAPP_BUTTON, RESUMEQUESTNO_BUTTON
	global LOGINBONUSMYPAGE_BUTTON
	global FANTASICAAPP_BUTTON
	
	;Launch fantastica if at bluestack home screen and some other stuff
	
	if DetectObject(FANTASICAAPP_BUTTON)
	{
		ClickObject(FANTASICAAPP_BUTTON)
		
		loop, 120
		{
			countdownToResume := 121 - A_INDEX
			SB_SetText("Resuming in " . countdownToResume . " seconds.")
			Sleep 1000
			if GetKeyState("F8")
			{
				break
			}
			if DetectObject(FORCECLOSEAPP_BUTTON)
			{
				WaitObject(FORCECLOSEAPP_BUTTON)
				ClickObject(FORCECLOSEAPP_BUTTON)
				loop, 10
				{
					remainingTime := 11 - A_INDEX
					SB_SetText("I saw force closed button, I pressed it. Reloading in " . remainingTime . " seconds")
					Sleep 1000
				}
				Reload
			}
		}
		
		if DetectObject(FANTASICALOADPAGE_TEXT) ; The launch process is expected to has passed this page 40 seconds into the launch process, therefore, skipping the body of this if-statement
		{
			Send {ESC}
			
			loop, 10
			{
				remainingTime := 10 - A_INDEX
				SB_SetText("Some dumb loading issue due to internet connection has occured, exiting app and reloading in " . remainingTime . " seconds.")
				Sleep 1000
			}
			Reload
		}
		
		while DetectObject(FANTASICAAPP_BUTTON)
		{
			ClickObject(FANTASICAAPP_BUTTON)
		}
		
		while not DetectObject(STARTGAME_BUTTON)
		{
			;check maintenance
			Maintenance()
			
			;Decline advertisements
			if DetectObject(MAYBELATERADVERTISEMENT_BUTTON)
			{
				WaitObject(MAYBELATERADVERTISEMENT_BUTTON)
				ClickObject(MAYBELATERADVERTISEMENT_BUTTON)
			}
			else if (DetectObject(CANCELADVERTISEMENT_BUTTON))
			{
				WaitObject(CANCELADVERTISEMENT_BUTTON)
				ClickObject(CANCELADVERTISEMENT_BUTTON)
			}
			else if (DetectObject(CLOSEADVERTISEMENT_BUTTON))
			{
				WaitObject(CLOSEADVERTISEMENT_BUTTON)
				ClickObject(CLOSEADVERTISEMENT_BUTTON)
			}
			Sleep 500
		}
	
		WaitObject(STARTGAME_BUTTON)
		ClickObject(STARTGAME_BUTTON)
		
		while not (DetectObject(MYPAGEID_TEXT) || DetectObject(MYPAGEID2_TEXT))
		{
			ConnectionError()
		
			LoginBingo()
			Roulette()
			
			if DetectObject(LOGINBONUSMYPAGE_BUTTON)
			{
				ClickObject(LOGINBONUSMYPAGE_BUTTON)
				
				Sleep 5000
			}
			else if DetectObject(ALLYPENDINGREQUEST_TEXT)
			{
				while DetectObject(ALLYPENDINGREQUEST_TEXT)
				{
					WaitObject(BACK_BUTTON)
					ClickObject(BACK_BUTTON)
					Sleep 5000
				}
			}
			else if DetectObject(ALLY_TEXT)
			{	
				while DetectObject(ALLY_TEXT)
				{
					WaitObject(BACK_BUTTON)
					ClickObject(BACK_BUTTON)
					Sleep 5000
				}
			}
			else if DetectObject(RESUMEQUESTNO_BUTTON)
			{
				WaitObject(RESUMEQUESTNO_BUTTON)
				ClickObject(RESUMEQUESTNO_BUTTON)
				
				Sleep 5000
				
				;if bug happens around this line of code, uncomment the following code as it should fix the bug (if any)
				;while DetectObject(RESUMEQUESTNO_BUTTON)
				;{
				;	Sleep SLEEPTIME
				;}
			}
		}
		
		Sleep 5000
		
		; while DetectObject(MYPAGEID2_TEXT)
		; {
			; ConnectionError()
			
			; if DetectObject(ANNOUNCEMENT_BUTTON)
			; {
				; WaitObject(ANNOUNCEMENT_BUTTON)
				; ClickObject(ANNOUNCEMENT_BUTTON)
			; }
			; else 
			; {
				; ClickAt(224, 444)
			; }
		; }
		
		; while not DetectObject(SELECTEPISODE_BUTTON)
		; {
			; ConnectionError()
			
			; if DetectObject(ANNOUNCEMENT_BUTTON)
			; {
				; WaitObject(ANNOUNCEMENT_BUTTON)
				; ClickObject(ANNOUNCEMENT_BUTTON)
			; }
			; else if DetectObject(QUEST1_ICON)
			; {
				; WaitObject(QUEST1_ICON)
				; ClickObject(QUEST1_ICON)
			; }
			; else if DetectObject(QUEST2_ICON)
			; {
				; WaitObject(QUEST2_ICON)
				; ClickObject(QUEST2_ICON)
			; }	
		; }
		Return 1
	}
	Return 0
}

Maintenance()
{
	global MAINTENANCEOPTION_BUTTON, MAINTENANCEYES_BUTTON, MAINTENANCE_TEXT, CONFIRMEXITAPP_BUTTON, STARTGAME_BUTTON
	
	if (DetectObject(MAINTENANCEYES_BUTTON) || DetectObject(MAINTENANCE_TEXT) || DetectObject(MAINTENANCEOPTION_BUTTON))
	{
		loop, 5
		{
			maintenanceTimeoutMinutes := 5 - A_INDEX
			loop, 61
			{
				maintenanceTimeoutSeconds := 61 - A_INDEX
				if GetKeyState("F8")
				{
					break
				}
				sleep 1000
				SB_SetText("Detected maintenenace. Relaunching in " . maintenanceTimeoutMinutes . " minutes and " . maintenanceTimeoutSeconds . " seconds.")
			}
		}
		
		while not DetectObject(STARTGAME_BUTTON)
		{	
			Send {ESC}
			if DetectObject(CONFIRMEXITAPP_BUTTON)
			{
			
				WaitObject(CONFIRMEXITAPP_BUTTON)
				ClickObject(CONFIRMEXITAPP_BUTTON)
				Reload
			}
			else if LaunchGame()
			{
				Reload
			}
		}
	}
	return 0
}