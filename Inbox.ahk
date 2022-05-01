#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#include %A_ScriptDir%\includes\IncludeScript.ahk
;------- INITIALIZE -------------------------
Init_globals() ; Found in GlobalConstants.ahk
;--------------------------------------------


loop,
{	
	if (SHOULD_CLICK == 1)
	{
		SendEvent {ClickAt %WAIT_X%, %WAIT_Y%}
	}
	
    if (DetectObject(INBOX_TITLE))
    {
        if (DetectObject(INBOX_ALL_BUTTON))
        {
            ClickObject(INBOX_ALL_BUTTON)
        }
        else if (DetectObject(INBOX_ITEMS_BUTTON))
        {
            ClickObject(INBOX_ITEMS_BUTTON)
        }
        else if (DetectObject(INBOX_RECEIVE_BUTTON))
        {
            ClickObject(INBOX_RECEIVE_BUTTON)
        }
        else
        {
            ClickObject(BACK_BUTTON)
        }
    }
    
}
; ==============================================================================

F1::ExitApp
F2::Pause
F3::Reload
F4::ClickAt(800,500)
