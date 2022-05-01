#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#include %A_ScriptDir%\includes\IncludeScript.ahk

;------- INITIALIZE -------------------------
Init_globals() ; Found in GlobalConstants.ahk
;--------------------------------------------

;========================================================
;==================== QUEST START =======================
;========================================================

GROUP1_FIGHT__BUTTON := "FANTASICA IMAGES\Event\PearlsOfTheDeep\CheckBattles\buttonfightgroup1.png"
GROUP1_REQUESTHELP__BUTTON := "FANTASICA IMAGES\Event\PearlsOfTheDeep\CheckBattles\buttonrequesthelpgroup1.png"
GROUP2_FIGHT__BUTTON := "FANTASICA IMAGES\Event\PearlsOfTheDeep\CheckBattles\buttonfightgroup2.png"
GROUP2_REQUESTHELP__BUTTON := "FANTASICA IMAGES\Event\PearlsOfTheDeep\CheckBattles\buttonrequesthelpgroup2.png"
GROUP3_FIGHT__BUTTON := "FANTASICA IMAGES\Event\PearlsOfTheDeep\CheckBattles\buttonfightgroup3.png"
GROUP3_REQUESTHELP_BUTTON := "FANTASICA IMAGES\Event\PearlsOfTheDeep\CheckBattles\buttonrequesthelpgroup3.png"
CHECKBATTLES_BACK_BUTTON := "FANTASICA IMAGES\Event\PearlsOfTheDeep\CheckBattles\buttonback.png"


POTD_DOQUEST_HELPER()
{
	global 
	WaitObject(POTD_SKIP_BUTTON)
	ClickObject(POTD_SKIP_BUTTON)
	
	WaitObject(POTD_RESULTS_TEXT)
	if (DetectObject(POTD_TOPPAGE_BUTTON))
	{
		WaitObject(POTD_TOPPAGE_BUTTON)
		ClickObject(POTD_TOPPAGE_BUTTON)
		return 1
	}
	else
	{
		return 0
	}
}

POTD_DOQUEST()
{
	global 
	WaitObject(POTD_FIGHTBOSS_BUTTON)
	ClickObject(POTD_FIGHTBOSS_BUTTON)
	
	while (POTD_DOQUEST_HELPER() == 0)
	{
		WaitObject(POTD_GROUPSBATTLE_BUTTON)
		ClickObject(POTD_GROUPSBATTLE_BUTTON)
		sleep 5000
		if (DetectObject(POTD_NINESTAR1_TEXT))
		{
			WaitObject(POTD_FIGHTAGAINTE_BUTTON)
			ClickObject(POTD_FIGHTAGAINTE_BUTTON)
			WaitObject(POTD_FIGHTAGAINYES_BUTTON)
			ClickObject(POTD_FIGHTAGAINYES_BUTTON)
		}
		else 
		{
			WaitObject(POTD_REQUESTHELP_BUTTON)
			ClickObject(POTD_REQUESTHELP_BUTTON)
			WaitObject(POTD_FIGHTAGAIN_BUTTON)
			ClickObject(POTD_FIGHTAGAIN_BUTTON)
		}
	}
}

GoToTrainingPageAndWaitMaxTP()
{
	global
	WaitObject(POTD_TRAINING_BUTTON)
	ClickObject(POTD_TRAINING_BUTTON)
	WaitObject(BACK_BUTTON)
	Sleep 1000
}

SelectAndStartLatestTraining()
{
	global
	if (DetectObject(TRAININGCHALLENGE_BUTTON))
	{
		WaitObject(TRAININGCHALLENGE_BUTTON)
		ClickObject(TRAININGCHALLENGE_BUTTON)
	}
	; else if (DetectObject(STARTTRAINING5_BUTTON))
	; {
		; WaitObject(STARTTRAINING5_BUTTON)
		; ClickObject(STARTTRAINING5_BUTTON)
	; }
	; else if (DetectObject(STARTTRAINING4_BUTTON))
	; {
		; WaitObject(STARTTRAINING4_BUTTON)
		; ClickObject(STARTTRAINING4_BUTTON)
	; }
	else if (DetectObject(STARTTRAINING3_BUTTON))
	{
		WaitObject(STARTTRAINING3_BUTTON)
		ClickObject(STARTTRAINING3_BUTTON)
	}
	else if (DetectObject(STARTTRAINING2_BUTTON))
	{
		WaitObject(STARTTRAINING2_BUTTON)
		ClickObject(STARTTRAINING2_BUTTON)
	}
	else if (DetectObject(STARTTRAINING1_BUTTON))
	{
		WaitObject(STARTTRAINING1_BUTTON)
		ClickObject(STARTTRAINING1_BUTTON)
	}
}

SetTimer, RandomPopupOrCrash, 300000 ;handles crashes, popup advertisements every 5 minutes






GoToTrainingPageAndWaitMaxTP()
SelectAndStartLatestTraining()

loop,
{
	SendEvent {Click, %WAIT_X%, %WAIT_Y%}
	if (DetectObject(ADVANCE_BUTTON))
	{
		WaitObject(ADVANCE_BUTTON)
		ClickObject(ADVANCE_BUTTON)
		
		while (not (DetectObject(ADVANCE_BUTTON)))
		{
			SendEvent {Click, %WAIT_X%, %WAIT_Y%}
			if DetectObject(POTD_FIGHTBOSS_BUTTON) ; Succubus appeared
			{
				POTD_DOQUEST()
				Reload
			}
			else if (DetectObject(SENDBRAVE_BUTTON))
			{
				WaitObject(SENDBRAVE_BUTTON)
				ClickObject(SENDBRAVE_BUTTON)
			}
			else if (DetectObject(CONTINUETRAINING_BUTTON))
			{
				WaitObject(CONTINUETRAINING_BUTTON)
				ClickObject(CONTINUETRAINING_BUTTON)
			}
			else if DetectObject(HEAL_BUTTON)
			{
				WaitObject(TRAININGMYPAGE_BUTTON)
				ClickObject(TRAININGMYPAGE_BUTTON)
				WaitObject(POTD_MAINICON_TEXT)
				ClickObject(POTD_MAINICON_TEXT)
				Reload
			}
			else if DetectObject(BACK_BUTTON)
			{
				SelectAndStartLatestTraining()
			}
		}
	}
	else if (DetectObject(TRAININGFIGHT_BUTTON))
	{
		if (DetectObject(TRAININGSUMMONALLY_BUTTON))
		{
			WaitObject(TRAININGSUMMONALLY_BUTTON)
			ClickObject(TRAININGSUMMONALLY_BUTTON)
			sleep 5000
		}
		
		if (DetectObject(TRAININGFIGHT_BUTTON))
		{
			WaitObject(TRAININGFIGHT_BUTTON)
			ClickObject(TRAININGFIGHT_BUTTON)
			sleep 5000
		}
		
		SelectAndStartLatestTraining()
	}
}

Reload


RandomPopupOrCrash:
if (LaunchGame() || ConnectionError() || Maintenance())
	Reload
else
	Advertisement()
return

InitGlobals:
  Init_globals() ; Found in GlobalConstants.ahk
return

;QUEST ENDS HERE
;========================================================




;=====================
TestFunction()
{
	Send { ESC down}
	Sleep 1000
}
TestFunction2()
{
	Roulette()
}
Move(coord1,coord2)
{
	SendEvent {Click 780, 500}
}
F1::ExitApp
F2::Pause
F3::Reload
F4::DetectObject("E:/Programmingasdfsdf")