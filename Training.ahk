#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#include %A_ScriptDir%\includes\IncludeScript.ahk
;------- INITIALIZE -------------------------
Init_globals() ; Found in GlobalConstants.ahk
;--------------------------------------------

SelectAndStartLatestTraining()
{
	global
	if (DetectObject(TRAININGCHALLENGE_BUTTON))
	{
		ClickObject(TRAININGCHALLENGE_BUTTON)
	}
	else if (DetectObject(STARTTRAINING5_BUTTON))
	{
		ClickObject(STARTTRAINING5_BUTTON)
	}
	; else if (DetectObject(STARTTRAINING4_BUTTON))
	; {
		; WaitObject(STARTTRAINING4_BUTTON)
		; ClickObject(STARTTRAINING4_BUTTON)
	; }
	else if (DetectObject(STARTTRAINING3_BUTTON))
	{
		ClickObject(STARTTRAINING3_BUTTON)
	}
	else if (DetectObject(STARTTRAINING2_BUTTON))
	{
		ClickObject(STARTTRAINING2_BUTTON)
	}
	else if (DetectObject(STARTTRAINING1_BUTTON))
	{
		ClickObject(STARTTRAINING1_BUTTON)
	}
}

training := 0

loop,
{
	if (SHOULD_CLICK == 1)
	{
		SendEvent {ClickAt %WAIT_X%, %WAIT_Y%}
	}
	; ==============================================
	; **********************************************
	; ---------------- MAIN PAGE -------------------
	; **********************************************
	; ==============================================
    if (DetectObject(MYPAGEID_TEXT))
	{
        if (DetectObject(FULLTRAININGPOINTS_TEXT))
        {
            scrollCount := TRAINING_INDEX // 3
            
            if (DetectObject(TRAINING5_ICON, 100))
            {
                ClickObject(TRAINING5_ICON, 100)
            }
            else
            {
                loop, %scrollCount%
                {
                    Scroll(MENU_X1, MENU_Y1, MENU_X2, MENU_Y2)
                }
                
                if (DetectObject(TRAINING5_ICON, 100))
                {
                    ClickObject(TRAINING5_ICON, 100)
                }
                else
                {
                    scrollCount++
                    loop, %scrollCount%
                    {
                        Scroll(MENU_X2, MENU_Y2, MENU_X1, MENU_Y1)
                    }
                }
            }
        }
	}
	; ==========================================================================
	; **************************************************************************
	; ------------------------ SELECT TRAINNG PAGE ----------------------------
	; **************************************************************************
	; ==========================================================================
	if (DetectObject(TRAINING_TEXT))
	{
		SelectAndStartLatestTraining()
	}
	
	; ==========================================================================
	; **************************************************************************
	; ---------------------------- TRAINING PAGE -------------------------------
	; **************************************************************************
	; ==========================================================================
    if (DetectObject(CONTINUETRAINING_BUTTON))
	{
		ClickObject(CONTINUETRAINING_BUTTON)
	}
    if (DetectObject(SENDBRAVE_BUTTON))
	{
		ClickObject(SENDBRAVE_BUTTON)
	}
	if (DetectObject(ADVANCE_BUTTON))
	{
		ClickObject(ADVANCE_BUTTON)
	}
	
    
	if (DetectObject(HEAL_BUTTON, 50) || DetectObject(HEALMID_BUTTON, 50) || DetectObject(HEALDARK_BUTTON, 50)
        || DetectObject(HEALMOBACOIN_BUTTON) || DetectObject(HEALMOBACOINDARK_BUTTON) || DetectObject(HEALMOBACOINMID_BUTTON))
	{
		if (USE_POTION)
		{
			coord := WaitObject(HEAL_BUTTON)
			ClickAt(coord[1], coord[2])
		}
		else
		{
			WaitObject(TRAININGMYPAGE_BUTTON)
			ClickObject(TRAININGMYPAGE_BUTTON)
		}
		; switch variable is obsolete
		; switch++ 
	}
	if (DetectObject(USEPOTIONYES_BUTTON))
	{
		ClickObject(USEPOTIONYES_BUTTON)
	}
	; if (DetectObject(TRNECT_REGULARBOSS1_IMAGE) || DetectObject(TRNECT_REGULARBOSS2_IMAGE) || DetectObject(TRNECT_REGULARBOSS3_IMAGE))
	; {
		; msgbox % "Hello"
		; ClickObject(TRNECT_TRAININGFLEE_BUTTON)
	; }
	; else 
	; if (DetectObject(TRNECT_LIMITEDBOSS_IMAGE))
	; {
		; ClickObject(TRNECT_TRAININGFIGHT_BUTTON)
	; }
	; else if (DetectObject(TRNECT_SPECIALBOSS_IMAGE) || DetectObject(TRNECT_SPECIALBOSS2_IMAGE))
	; {
		; ClickObject(TRNECT_TRAININGFIGHT_BUTTON)
	; }
	; else if (DetectObject(TRNECT_TRAININGFLEE_BUTTON))
	; {
		; ClickObject(TRNECT_TRAININGFLEE_BUTTON)
	; }
    if (DetectObject(TRNECT_TRAININGFIGHT_BUTTON))
	{
		ClickObject(TRNECT_TRAININGFIGHT_BUTTON)
	}
	if (DetectObject(TRAININGSUMMONALLY_BUTTON))
	{
		ClickObject(TRAININGSUMMONALLY_BUTTON)
	}
	if (DetectObject(TRAININGFIGHT_BUTTON))
	{
		ClickObject(TRAININGFIGHT_BUTTON)
	}
}
; ==============================================================================

F1::ExitApp
F2::Pause
F3::Reload
F4::ClickAt(800,500)
