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
	; ==========================================================================
	; **************************************************************************
	; ------------------------ COLISEUM EVENT PAGE -----------------------------
	; **************************************************************************
	; ==========================================================================
    if (ColiseumEvent)
    {
        if (DetectObject(COL_EVENT_ICON))
        {
            ClickObject(COL_EVENT_ICON)
        }
        else
        {
            if (scrollCount > 0)
            {   
                scrollCount++
                loop, %scrollCount%
                {
                    Scroll(MENU_X2, MENU_Y2, MENU_X1, MENU_Y1)
                }
            }
        }
    
        if (DetectObject(COL_EVENTTITLE_IMAGE))
        {
            ClickObject(COL_TOEVENT_BUTTON)
        }
        if (DetectObject(COL_SELECTIONPAGETITLE_TEXT))
        {
            if (DetectObject(COL_COOLDOWN_TEXT))
            {
                Scroll(QUEST_X1, QUEST_Y1, QUEST_X2, QUEST_Y2)
                if (DetectObject(COL_AREA3_BUTTON))
                {
                    ClickObject(COL_AREA3_BUTTON)
                }
                else if (DetectObject(COL_AREA2_BUTTON))
                {
                    ClickObject(COL_AREA2_BUTTON)
                }
                else if (DetectObject(COL_AREA1_BUTTON))
                {
                    ClickObject(COL_AREA1_BUTTON)
                }
            }
            else
            {
                ClickObject(COL_BATTLEMODE_BUTTON)
            }
        }
        if (DetectObject(COL_HEROSELECTIONPAGETITLE_TEXT))
        {
            ClickObject(COL_CHOOSEHERO1_BUTTON)
        }
        if (DetectObject(COL_BATTLETITLE_TEXT))
        {
            if (DetectObject(COL_BATTLECOOLDOWN_TEXT))
            {
                ClickObject(COL_BATTLE_BUTTON)
            }
            else
            {
                ClickObject(BACK_BUTTON)
                WaitObject(COL_HEROSELECTIONPAGETITLE_TEXT)
                ClickObject(BACK_BUTTON)
                WaitObject(COL_SELECTIONPAGETITLE_TEXT)
                ClickObject(BACK_BUTTON)
                WaitObject(COL_EVENTTITLE_IMAGE)
                ClickObject(BACK_BUTTON)
                ColiseumEvent = 0
                SetTimer, Coliseum, 600000
            }
        }
        if (DetectObject(COL_SKIP_BUTTON))
        {
            ClickObject(COL_SKIP_BUTTON)
        }
        if (DetectObject(COL_YES_BUTTON))
        {
            ClickObject(COL_YES_BUTTON)
        }
        if (DetectObject(COL_RESULTSPAGETITLE_TEXT))
        {
            ClickObject(BACK_BUTTON)
        }
    }
}
; ==============================================================================
; ******************************************************************************
; --------------------------------- LABELS -------------------------------------
; ******************************************************************************
; ==============================================================================
Coliseum:
ColiseumEvent = 1
return

F1::ExitApp
F2::Pause
F3::Reload
F4::ClickAt(800,500)
