#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#include %A_ScriptDir%\includes\IncludeScript.ahk

;------- INITIALIZE -------------------------
Init_globals() ; Found in GlobalConstants.ahk
;--------------------------------------------

;========================================================
;===================== QUEST START ======================
;========================================================

SetTimer, RandomPopupOrCrash, 300000 ;handles crashes, popup advertisements every 5 minutes

WaitObject(ASSIST_BUTTON)
ClickObject(ASSIST_BUTTON)
WaitObject(ASSIST_BACK_BUTTON)

if DetectObject(REQUESTASSISTANCE_BUTTON)
{
	WaitObject(REQUESTASSISTANCE_BUTTON)
	ClickObject(REQUESTASSISTANCE_BUTTON)
}

WaitObject(ASSIST_BACK_BUTTON)
if DetectObject(ASSIST_ALL_BUTTON)
{
	WaitObject(ASSIST_ALL_BUTTON)
	ClickObject(ASSIST_ALL_BUTTON)
	sleep 5000
}

WaitObject(ASSIST_BACK_BUTTON)
ClickObject(ASSIST_BACK_BUTTON)

waitobject(FIGHT_BUTTON)

while detectObject(CPBAR0_TEXT)
{
	waitObject(CPBAR1_TEXT)
}

waitobject(FIGHT_BUTTON)
ClickObject(FIGHT_BUTTON)

WaitObject(OPPONENT1_BUTTON)
clickObject(OPPONENT1_BUTTON)

waitObject(SPEED_BUTTON)
clickObject(SPEED_BUTTON)
clickObject(CRITICAL_BUTTON)
clickObject(DRAIN_BUTTON)

waitObject(SKIP_BUTTON)
clickObject(SKIP_BUTTON)

while (!DetectObject(FRONTLINEBACK_BUTTON))
{
    if (DetectObject(SPEED_BUTTON))
    {
        waitObject(SPEED_BUTTON)
        clickObject(SPEED_BUTTON)
    }
    if (DetectObject(CRITICAL_BUTTON))
    {
        WaitObject(CRITICAL_BUTTON)
        clickObject(CRITICAL_BUTTON)
    }
    if (DetectObject(DRAIN_BUTTON))
    {
        WaitObject(DRAIN_BUTTON)
        ClickObject(DRAIN_BUTTON)
    }
}

waitObject(FRONTLINEBACK_BUTTON)
clickObject(FRONTLINEBACK_BUTTON)
reload

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