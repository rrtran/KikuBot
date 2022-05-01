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
		WaitObject(TRAININGCHALLENGE_BUTTON)
		ClickObject(TRAININGCHALLENGE_BUTTON)
	}
	else if (DetectObject(STARTTRAINING5_BUTTON))
	{
		WaitObject(STARTTRAINING5_BUTTON)
		ClickObject(STARTTRAINING5_BUTTON)
	}
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

;========================================================
;==================== QUEST START =======================
;========================================================
DoQuest()
{
	global
	hasDeployedAllAllies := 0
	while A_index <= DEPLOY_NUMBER AND DetectObject(DEPLOYUNIT_BUTTON)
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
}


switch := 1
training := 0
deployUnitNum := 0
pendingAllies := 1
latestEpisode := 1

sketchDiceStock1 := 0
portraitDiceStock1 := 0
masterDiceStock1 := 0
move1Stock1 := 0
move2Stock1 := 0
move3Stock1 := 0
move4Stock1 := 0
move5Stock1 := 0
move6Stock1 := 0
move10Stock1 := 0
bronzestopStock1 := 0
silverstopStock1 := 0
lowprobStock1 := 0
highprobStock1 := 0
lowdiceStock1 := 0
highdiceStock1 := 0
ally2Stock1 := 0

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
	}
	if (DetectObject(USEPOTIONYES_BUTTON))
	{
		ClickObject(USEPOTIONYES_BUTTON)
	}
    if (DetectObject(EVO_TRAININGFIGHT_BUTTON))
	{
		ClickObject(EVO_TRAININGFIGHT_BUTTON)
	}
	if (DetectObject(TRAININGSUMMONALLY_BUTTON))
	{
		ClickObject(TRAININGSUMMONALLY_BUTTON)
	}
	if (DetectObject(TRAININGFIGHT_BUTTON))
	{
		ClickObject(TRAININGFIGHT_BUTTON)
	}
    if (DetectObject(EVO_RESULTS_TTILE))
    {
        ClickObject(EVO_BACK_TO_EVENTS)
    }
    if (DetectObject(EVO_MAIN_MENU))
    {
        ClickObject(EVO_TRAINING)
    }
    if (DetectObject(EVO_SKIP))
    {
        ClickObject(EVO_SKIP)
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

Dice:
RollTheDiceEvent = 1
RollTheDiceDoEvent = 1
return

Frontlines:
FrontlinesEvent = 1
return

Inbox:
CheckInbox = 1
return
; ==============================================================================

F1::ExitApp
F2::Pause
F3::Reload
F4::ClickAt(800,500)
