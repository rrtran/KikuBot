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

SetTimer, RandomPopupOrCrash, 300000 ;handles crashes, popup advertisements every 5 minutes

; WaitObject(WLO_TOCASTLE_BUTTON)
; ClickObject(WLO_TOCASTLE_BUTTON)

if (doPVP == 1)
{
	WaitObject(WLO_PVPFIGHT_BUTTON)
	ClickObject(WLO_PVPFIGHT_BUTTON)

	WaitObject(WLO_FIGHTHERO1_BUTTON)
	ClickObject(WLO_FIGHTHERO1_BUTTON)

	WaitObject(WLO_BATTLE_BACK_BUTTON)
	WaitObject(WLO_BATTLE_BUTTON)
	ClickObject(WLO_BATTLE_BUTTON)

	WaitObject(WLO_SKIP_BUTTON)
	ClickObject(WLO_SKIP_BUTTON)

	WaitObject(WLO_RESULTBACK_BUTTON)
	ClickObject(WLO_RESULTBACK_BUTTON)

	WaitObject(BACK_BUTTON)
	ClickObject(BACK_BUTTON)
}
if (doARENA == 1)
{
	
	WaitObject(WLO_ARENA1FIGHT_BUTTON)
	ClickObject(WLO_ARENA1FIGHT_BUTTON)

	while not DetectObject(WLO_SKIP_BUTTON)
	{
		if DetectObject(WLO_ARENABOSSYES_BUTTON) 
		{
			WaitObject(WLO_ARENABOSSYES_BUTTON)
			ClickObject(WLO_ARENABUSSYES_BUTTON)
		}
	}

	WaitObject(WLO_SKIP_BUTTON)
	ClickObject(WLO_SKIP_BUTTON)

	WaitObject(WLO_RESULTBACK_BUTTON)
	ClickObject(WLO_RESULTBACK_BUTTON)
}

;WaitObject(BACK_BUTTON)
;ClickObject(BACK_BUTTON)

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