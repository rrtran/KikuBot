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

waitobject(selectepisode_button)

if quest >= 4
{
  global QUEST_X1, QUEST_Y1, QUEST_X2, QUEST_Y2
  scroll(QUEST_X1, QUEST_Y1, QUEST_X2, QUEST_Y2)
}

questindex := assignquest(quest)
waitobject(questindex)
sleep 500

clickobject(questindex)
waitobject(DEPLOYUNIT_BUTTON)

hasDeployedAllAllies := 0
while (A_index <= DEPLOY_NUMBER AND DetectObject(DEPLOYUNIT_BUTTON))
{
	DeployUnit()
  
	if (!hasDeployedAllAllies)
	{		
		while DetectObject(CALLALLY_BUTTON)
		{   
			if DetectObject(BACKQUEST_BUTTON)
			{
				while DetectObject(BACKQUEST_BUTTON)
				{
					WaitObject(BACKQUEST_BUTTON)
					ClickObject(BACKQUEST_BUTTON)
				}
			}
			if (CallAlly(SORTINDEX, TYPEINDEX) == 0)
			{
				hasDeployedAllAllies := 1
				break
			}
		}
	}
}


;quick fix
Sleep 500
if DetectObject(BACKQUEST_BUTTON)
{
	while DetectObject(BACKQUEST_BUTTON)
	{
		WaitObject(BACKQUEST_BUTTON)
		ClickObject(BACKQUEST_BUTTON)
	}
}

WaitObject(CHOOSEQUESTCOMPLETED_BUTTON) ;Basically waits until questing ends and we get our results
ClickObject(CHOOSEQUESTCOMPLETED_BUTTON) ;return to quest selection

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