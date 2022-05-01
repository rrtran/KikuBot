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
	global ALLYPENDINGREQUEST_TEXT, ANNOUNCEMENT_BUTTON, ALLY_TEXT, BACK_BUTTON, MYPAGEID_TEXT, MYPAGEID2_TEXT, EVENT_ICON, SELECTEPISODE_BUTTON
	global SLEEPTIME, STARTGAME_BUTTON, TRAINING_TEXT, TRAINING1_ICON, TRAINING2_ICON, MAYBELATERADVERTISEMENT_BUTTON, CANCELADVERTISEMENT_BUTTON
	;Launch fantastica if at bluestack home screen and some other stuff
	PixelGetColor, borderColor, 40, 500
	if (borderColor <> 0x000000)
	{
		SB_SetText("Error encountered. Attempting to relaunch the Fantasica.")
		while (borderColor <> 0x000000)
		{	
			Click 620, 150 down ;My app button
			Sleep 500
			Click up

			Sleep 500
			
			Click 860, 300 down ;Fantasica Icon 
			Sleep 500
			Click up
	
			PixelGetColor, borderColor, 40, 500
		}
		
		loop, 120
		{
			countdownToResume := 121 - A_INDEX
			SB_SetText("Resuming in " . countdownToResume . " seconds.")
			Sleep 1000
			if GetKeyState("F8")
			{
				break
			}
		}		
			
		PixelGetColor, borderColor, 40, 500
		while (borderColor <> 0x000000)
		{
			Click 620, 150 down ;My app button
			Sleep 500
			Click up

			Sleep 500

			Click 860, 300 down ;Fantasica Icon 
			Sleep 500
			Click up
	
			PixelGetColor, borderColor, 40, 500
		}
		
		ConnectionError()
		
		;Wait for start game button to appear	
		PixelGetColor, startGameColor, 800, 700
		while startGameColor <> 0xE7F6F4
		{
			;check maintenance
			Maintenance()
			
			;Decline advertisements
			PixelGetColor, startGameColor, 800, 700
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
			Sleep 500
			Click up
		}
	
		WaitObject(STARTGAME_BUTTON)
		ClickObject(STARTGAME_BUTTON)
		
		while not (DetectObject(MYPAGEID_TEXT) || DetectObject(MYPAGEID2_TEXT))
		{
			ConnectionError()
		
			LoginBingo()
			
			if DetectObject(ALLYPENDINGREQUEST_TEXT)
			{
				WaitObject(BACK_BUTTON)
				ClickObject(BACK_BUTTON)
				
				while DetectObject(ALLYPENDINGREQUEST_TEXT)
				{
					Sleep SLEEPTIME
				}
			}
			
			else if DetectObject(ALLY_TEXT)
			{
				WaitObject(BACK_BUTTON)
				ClickObject(BACK_BUTTON)
				
				while DetectObject(ALLY_TEXT)
				{
					Sleep SLEEPTIME
				}
			} 
		}
		
		Sleep 5000
		
		while DetectObject(MYPAGEID2_TEXT)
		{
			ConnectionError()
			
			
			
			if DetectObject(ANNOUNCEMENT_BUTTON)
			{
				WaitObject(ANNOUNCEMENT_BUTTON)
				ClickObject(ANNOUNCEMENT_BUTTON)
			}
			else 
			{
				ClickAt(600, 840)
			}
		}
		Return 1
	}
	Return 0
}

Maintenance()
{
	global MAINTENANCEOPTION_BUTTON, MAINTENANCEYES_BUTTON, MAINTENANCE_TEXT, CONFIRMEXITAPP_BUTTON, STARTGAME_BUTTON
	
	if (DetectObject(MAINTENANCEYES_BUTTON) || DetectObject(MAINTENANCE_TEXT) || DetectObject(MAINTENANCEOPTION_BUTTON))
	{
		loop, 16
		{
			maintenanceTimeoutMinutes := 16 - A_INDEX
			loop, 61
			{
				maintenanceTimeoutSeconds := 61 - A_INDEX
				sleep 1000
				SB_SetText("Detected maintenenace. Relaunching in " . maintenanceTimeoutMinutes . " minutes and " . maintenanceTimeoutSeconds . " seconds.")
			}
		}
		
		while not DetectObject(STARTGAME_BUTTON)
		{	
			Send {ESC down}
			if DetectObject(CONFIRMEXITAPP_BUTTON)
			{
				WaitObject(CONFIRMEXITAPP_BUTTON)
				ClickObject(CONFIRMEXITAPP_BUTTON)
				Send {ESC up}
				Reload
			}
			else if LaunchGame()
			{
				Reload
			}
			else 
			{
				sleep 1000
			}
		}
	}
	return 0
}