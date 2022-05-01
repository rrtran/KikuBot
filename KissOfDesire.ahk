#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#include %A_ScriptDir%\includes\IncludeScript.ahk

;------- INITIALIZE -------------------------
Init_globals() ; Found in GlobalConstants.ahk
;--------------------------------------------

;========================================================
;=================== QUEST START =====================
;========================================================

KOD_DOQUEST()
{
	global 
	WaitObject(KOD_FIGHT_BUTTON)
	ClickObject(KOD_FIGHT_BUTTON)
	
	waitobject(DEPLOYUNIT_BUTTON)
	hasDeployedAllAllies := 0
	while A_index <= DEPLOY_NUMBER AND DetectObject(DEPLOYUNIT_BUTTON)
	{
		DeployUnit()
	  
		if (!hasDeployedAllAllies)
		{
			while DetectObject(CALLALLY_BUTTON)
			{   
				if (CallAlly(SORTINDEX, TYPEINDEX) == 0)
				{
					hasDeployedAllAllies := 1
					break
				}
			}
		}
	}
	
	WaitObject(KOD_RESULTS_EVENTPAGE_BUTTON)
	ClickObject(KOD_RESULTS_EVENTPAGE_BUTTON)
	while not DetectObject(KOD_MYPAGE_BUTTON)
	{
		if DetectObject(KOD_BACK_BUTTON)
		{
			WaitObject(KOD_BACK_BUTTON)
			ClickObject(KOD_BACK_BUTTON)
		}
	}
}

SetTimer, RandomPopupOrCrash, 300000 ;handles crashes, popup advertisements every 5 minutes

while not (DetectObject(KOD_TRAININGWITHPOTION_BUTTON) || DetectObject(KOD_TRAINING_BUTTON))
{
	SendEvent {Click, %WAIT_X%, %WAIT_Y%}
}

if DetectObject(KOD_TRAININGWITHPOTION_BUTTON)
{
	WaitObject(KOD_TRAININGWITHPOTION_BUTTON)
	ClickObject(KOD_TRAININGWITHPOTION_BUTTON)
	
	WaitObject(KOD_USEPOTIONYES_BUTTON)
	ClickObject(KOD_USEPOTIONYES_BUTTON)
}
else
{
	WaitObject(KOD_MAXTP_TEXT)
	WaitObject(KOD_TRAINING_BUTTON)
	ClickObject(KOD_TRAINING_BUTTON)
}


WaitObject(KOD_EVENTPAGE_BUTTON)

while not DetectObject(KOD_TRAININGPOINTS_TEXT) 
{
	SendEvent {Click, %WAIT_X%, %WAIT_Y%}
	if (DetectObject(KOD_ADVANCE_BUTTON))
	{
		WaitObject(KOD_ADVANCE_BUTTON)
		ClickObject(KOD_ADVANCE_BUTTON)
		
		while (not (DetectObject(KOD_ADVANCE_BUTTON)))
		{
			SendEvent {Click, %WAIT_X%, %WAIT_Y%}
			if DetectObject(KOD_FIGHT_BUTTON) ; Succubus appeared
			{
				KOD_DOQUEST()
				Reload
			}
			else if (DetectObject(KOD_CONTINUETRAINING_BUTTON))
			{
				WaitObject(KOD_CONTINUETRAINING_BUTTON)
				ClickObject(KOD_CONTINUETRAINING_BUTTON)
			}
			else if DetectObject(KOD_HEAL_BUTTON)
			{
				WaitObject(KOD_EVENTPAGE_BUTTON)
				ClickObject(KOD_EVENTPAGE_BUTTON)
				Reload
			}
			else if DetectObject(KOD_MYPAGE_BUTTON)
			{
				Reload
			}
			
		}
	}
	else if DetectObject(KOD_BOSSFIGHT_BUTTON)
	{
		while (DetectObject(KOD_BOSSFIGHT_BUTTON)) ; fight boss
		{
			if DetectObject(KOD_SUMMONALLY_BUTTON)
			{
				WaitObject(KOD_SUMMONALLY_BUTTON)
				ClickObject(KOD_SUMMONALLY_BUTTON)
			}
			else if DetectObject(KOD_SUMMONALLY_BUTTON)
			{
				WaitObject(KOD_SUMMONALLY_BUTTON)
				ClickObject(KOD_SUMMONALLY_BUTTON)
			}
			
			while (not DetectObject(KOD_BOSSFIGHT_BUTTON))
			{
				SendEvent {Click, %WAIT_X%, %WAIT_Y%}
				if DetectObject(KOD_MYPAGE_BUTTON)
				{
					Reload
				}
			}
		}
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