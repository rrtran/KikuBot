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
	if (DetectObject(LOGINBONUSMYPAGE_BUTTON))
	{
		ClickObject(LOGINBONUSMYPAGE_BUTTON)
	}
	if (DetectObject(LB_TITLE_IMAGE))
	{
		if (DetectObject(LB_SEAROAD_BUTTON))
		{
			ClickObject(LB_SEAROAD_BUTTON)
		}
		else if (DetectObject(LB_OCEANCALL_BUTTON))
		{
			ClickObject(LB_OCEANCALL_BUTTON)
		}
	}
	if (DetectObject(POPUPCLOSE_BUTTON))
	{
		ClickObject(POPUPCLOSE_BUTTON)
	}
	; if (DetectObject(LB_YES_BUTTON))
	; {
		; ClickObject(LB_YES_BUTTON)
	; }
	; if (DetectObject(LB_WALK1_BUTTON))
	; {
		; ClickObject(LB_WALK1_BUTTON)
	; }
	; else if (DetectObject(LB_WALK2_BUTTON))
	; {
		; ClickObject(LB_WALK2_BUTTON)
	; }
	; if (DetectObject(LB_FIGHTYES_BUTTON))
	; {
		; ClickObject(LB_FIGHTYES_BUTTON)
	; }
	; else if (DetectObject(LB_FIGHT_BUTTON))
	; {
		; ClickObject(LB_FIGHT_BUTTON)
	; }
	; if (DetectObject(LB_AUTOBATTLE_BUTTON))
	; {
		; ClickObject(LB_AUTOBATTLE_BUTTON)
	; }
	; if (DetectObject(LB_RESULT1_TEXT))
	; {
		; ClickObject(LB_RESULTBACK_BUTTON)
	; }
	; if (DetectObject(LB_ENEMYLIST_TEXT))
	; {
		; if (DetectObject(LB_FIGHTAGAIN_BUTTON))
		; {
			; ClickObject(LB_FIGHTAGAIN_BUTTON)
		; }
	; }
	; if (DetectObject(LB_RESULT3_TEXT) || DetectObject(LB_RESULT2_TEXT))
	; {
		; ClickObject(LB_COMPLETECLEARBACK_BUTTON)
	; }
	; if (DetectObject(LB_POTION_BUTTON))
	; {
		; ClickObject(LB_BATTLEFIELDBACK_BUTTON)
		; Sleep 2000
		; WaitObject(LB_BATTLEFIELDBACK_BUTTON)
		; ClickObject(LB_BATTLEFIELDBACK_BUTTON)
	; }
	if (DetectObject(FANTASICAAPP_BUTTON))
	{
		LaunchGame()
	}

	if (DetectObject(STARTGAME_BUTTON))
	{
        if (DetectObject(RESUMEQUESTNO_BUTTON))
        {
            ClickObject(RESUMEQUESTNO_BUTTON)
        }
        else
        {
            ClickObject(STARTGAME_BUTTON)
        }
	}
	if (DetectObject(ALLYPENDINGREQUEST_TEXT))
	{
		ClickObject(BACK_BUTTON)
	}
	else if (DetectObject(ALLY_TEXT))
	{
		ClickObject(BACK_BUTTON)
	}
	if (DetectObject(CONNECTIONERROR_BUTTON))
	{
		ClickObject(CONNECTIONERROR_BUTTON)
	}
	if (DetectObject(CONNECTIONERROR_TEXT))
	{
		Send {ESC down}
		Sleep 1000
		Send {ESC up}
	}
	if (DetectObject(CONFIRMEXITAPP_BUTTON))
	{
		ClickObject(CONFIRMEXITAPP_BUTTON)
	}
	if (DetectObject(LOGINBINGO_TEXT))
	{
		if (DetectObject(LOGINBINGORECEIVE_BUTTON))
		{
			ClickObject(LOGINBINGORECEIVE_BUTTON)
		}
		else
		{
			LoginBingoHelperClicker()
		}
	}
	; if (DetectObject(TOP_TITLE_IMAGE))
	; {
		; if (DetectObject(TOP_CLIMBTREE_BUTTON) && !DetectObject(TOP_TRAININGPOINTS_TEXT))
		; {
			; ClickObject(TOP_CLIMBTREE_BUTTON)
		; }
		; else if (DetectObject(TOP_FIGHTBOSS_BUTTON))
		; {
			; ClickObject(TOP_FIGHTBOSS_BUTTON)
		; }
	; }
	; if (DetectObject(TOP_ADVANCE1_BUTTON))
	; {
		; ClickObject(TOP_ADVANCE1_BUTTON)
	; }
	; if (DetectObject(TOP_ADVANCE2_BUTTON))
	; {
		; ClickObject(TOP_ADVANCE2_BUTTON)
	; }
	; if (DetectObject(TOP_FIGHT_BUTTON))
	; {
		; ClickObject(TOP_FIGHT_BUTTON)
	; }
	; if (DetectObject(TOP_UTTON))
	; {
		; ClickObject(TOP_TRAININGBACK_BUTTON)
	; }
	; if (DetectObject(TOP_TRAININGPOINTS_TEXT))
	; {
		; ClickObject(TOP_BACKTOMAINPAGE_BUTTON)
	; }
	
	; ==============================================
	; **********************************************
	; ---------------- MAIN PAGE -------------------
	; **********************************************
	; ==============================================
    if (DetectObject(MYPAGEID_TEXT))
	{
        scrollCount := INBOX_INDEX // 3
        if (CheckInbox)
        {
            scrollCount := INBOX_INDEX // 3
            if (DetectObject(INBOX1_ICON))
            {
                CheckInbox = 0
                SetTimer, Inbox, 3600000
                ClickObject(INBOX1_ICON)
            }
            else if (DetectObject(INBOX2_ICON))
            {
                CheckInbox = 0
                SetTimer, Inbox, 3600000
                ClickObject(INBOX2_ICON)
            }
            else
            {
                loop, %scrollCount%
                {
                    Scroll(MENU_X1, MENU_Y1, MENU_X2, MENU_Y2)
                }
                if (DetectObject(INBOX1_ICON))
                {
                    CheckInbox = 0
                    SetTimer, Inbox, 3600000
                    ClickObject(INBOX1_ICON)
                }
                else if (DetectObject(INBOX2_ICON))
                {
                    CheckInbox = 0
                    SetTimer, Inbox, 3600000
                    ClickObject(INBOX2_ICON)
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
        } ; CHECK INBOX
        else if (RollTheDiceEvent)
        {
            if (DetectObject(DICE_EVENT_ICON))
            {
                ClickObject(DICE_EVENT_ICON)
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
                    if (DetectObject(DICE_EVENT_ICON))
                    {
                        ClickObject(DICE_EVENT_ICON)
                    }
                }
            }
        }
        else if (ColiseumEvent)
        {
            if (DetectObject(COL_EVENT_ICON))
            {
                ClickObject(COL_EVENT_ICON)
                ColiseumEvent = 0
                SetTimer, Coliseum, 600000
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
        } ; COLISEUM EVENT
        else if (FrontlinesEvent)
        {
            if (DetectObject(FL_EVENT_ICON))
            {
                ClickObject(FL_EVENT_ICON)
                FrontlinesEvent = 0
                SetTimer, Frontlines, 3600000
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
        else if (DetectObject(QUESTTIMER_TEXT))
		{
            scrollCount := QUEST_INDEX // 3
			if (DetectObject(QUEST3_ICON, 150))
			{
				ClickObject(QUEST3_ICON, 150)
			}
			else if (DetectObject(QUEST4_ICON, 150))
			{
				ClickObject(QUEST4_ICON, 150)
			}
			else if (DetectObject(QUEST5_ICON, 150))
			{
				ClickObject(QUEST5_ICON, 150)
			}
            else
            {
                loop, %scrollCount%
                {
                    Scroll(MENU_X1, MENU_Y1, MENU_X2, MENU_Y2)
                }
                
                if (DetectObject(QUEST3_ICON, 150))
                {
                    ClickObject(QUEST3_ICON, 150)
                }
                else if (DetectObject(QUEST4_ICON, 150))
                {
                    ClickObject(QUEST4_ICON, 150)
                }
                else if (DetectObject(QUEST5_ICON, 150))
                {
                    ClickObject(QUEST5_ICON, 150)
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
		} ; QUESTING
        else if (TrainingencounterEvent && !DetectObject(DEPLETEDTRAININGPOINTS_TEXT))
        {
            msg := "Searching for Training-Encounter Event Icon"
            SB_SetText(msg)
            
            if (DetectObject(TRNECT_EVENT_ICON))
            {
                ClickObject(TRNECT_EVENT_ICON)
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
            if (DetectObject(TRNECT_EVENT_ICON))
            {
                ClickObject(TRNECT_EVENT_ICON)
            }
        } ; TRAINING-ENCOUNTER
        else if (DetectObject(FULLTRAININGPOINTS_TEXT))
        {
            scrollCount := TRAINING_INDEX // 3
            
            if (DetectObject(TRAINING5_ICON, 150))
            {
                ClickObject(TRAINING5_ICON, 150)
            }
            else if (DetectObject(TRAINING4_ICON, 150))
            {
                ClickObject(TRAINING4_ICON, 150)
            }
            else
            {
                loop, %scrollCount%
                {
                    Scroll(MENU_X1, MENU_Y1, MENU_X2, MENU_Y2)
                }
                
                if (DetectObject(TRAINING5_ICON, 150))
                {
                    ClickObject(TRAINING5_ICON, 150)
                }
                else if (DetectObject(TRAINING4_ICON, 150))
                {
                    ClickObject(TRAINING4_ICON, 150)
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
    ; ------------------------ CLASH OF LEGENDS EVENT PAGE ---------------------
    ; **************************************************************************
    ; ==========================================================================
    if (ClashOfLegendsEvent)
    {
        if (DetectObject(CSH_TITLE))
        {
            if (DetectObject(CSH_ASSIST))
            {
                ClickObject(CSH_ASSIST)
            }
            else if (DetectObject(CSH_BATTLE))
            {
                ClickObject(CSH_BATTLE)
            }
        }
        if (DetectObject(CSH_BATTLESELECTTITLE))
        {
            ; if (DetectObject(CSH_CPBAR4))
            ; {
                if (DetectObject(CSH_RESTORECPPROMPT))
                {
                    ClickObject(CSH_RESTOREYES)
                }
                if (DetectObject(CSH_FIGHTL))
                {
                    ClickObject(CSH_FIGHTL)
                }
                if (DetectObject(CSH_CPBAR4, 100))
                {
                    Scroll(QUEST_X1,QUEST_Y1, QUEST_X2, QUEST_Y2)
                    ClickObject(CSH_FIGHTM)
                }
                else if (DetectObject(CSH_CPBAR3, 50))
                {
                    ;ClickObject(CSH_FIGHT)
                }
            ; }
            ; else
            ; {
            ; }
        }
        if (DetectObject(CSH_START))
        {
            if (DetectObject(CSH_START))
            {
                ClickObject(CSH_START)
            }
        }
        if (DetectObject(CSH_BEGINPROMPT))
        {
            if (DetectObject(CSH_YES))
            {
                ClickObject(CSH_YES)
            }
        }
        if (DetectObject(CSH_RESULTSTITLE))
        {
            if (DetectObject(CSH_NEXT))
            {
                ClickObject(CSH_NEXT)
            }
            if (DetectObject(CSH_TOP))
            {
                ClickObject(CSH_TOP)
            }
        }
        if (DetectObject(CSH_SUPPORT1))
        {
           ClickObject(CSH_SUPPORT1)
        }
        else if (DetectObject(CSH_SUPPORT2))
        {
            ClickObject(CSH_SUPPORT2)
        }
        else if (DetectObject(CSH_SUPPORT3))
        {
            ClickObject(CSH_SUPPORT3)
        }
        else if (DetectObject(CSH_SUPPORT4))
        {
            ClickObject(CSH_SUPPORT4)
        }
        else if (DetectObject(CSH_SKIP))
        {
            ClickObject(CSH_SKIP)
        }
        
    }
    ; ==========================================================================
    ; **************************************************************************
    ; ------------------------ COLISEUM EVENT PAGE -----------------------------
    ; **************************************************************************
    ; ==========================================================================
    if (ColiseumEvent)
    {
        if (DetectObject(COL_EVENTTITLE_IMAGE))
        {
            ClickObject(COL_TOEVENT_BUTTON)
        }
        if (DetectObject(COL_SELECTIONPAGETITLE_TEXT))
        {
            if (DetectObject(COL_COOLDOWN_TEXT))
            {
                Scroll(QUEST_X1, QUEST_Y1, QUEST_X2, QUEST_Y2)
                if (DetectObject(COL_AREA2_BUTTON))
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
            }
        }
        if (DetectObject(COL_SKIP_BUTTON))
        {
            ClickObject(COL_SKIP_BUTTON)
        }
        if (DetectObject(COL_RESULTSPAGETITLE_TEXT))
        {
            ClickObject(BACK_BUTTON)
        }
    }
	
    ; ==========================================================================
    ; **************************************************************************
    ; -------------------------- DICE EVENT PAGE -------------------------------
    ; **************************************************************************
    ; ==========================================================================
    if (RollTheDiceEvent)
    {
        if (DetectObject(DICE_MENU_BUTTON) || DetectObject(DICE_RETREAT_BUTTON))
        {
            ClickAt(CARDMENU_X, CARDMENU_Y)
            Sleep 1000
            shadeVar := 27 ; shade of 
            if (DetectObject(DICE_MOVE1CARD_BUTTON, shadeVar))
            {
                move1Stock1 = 1
                SB_SetText(move1)
                sleep 1000
            }
            if (DetectObject(DICE_MOVE2CARD_BUTTON, shadeVar))
            {
                move2Stock1 = 1
                SB_SetText(move2)
                sleep 1000
            }
            if (DetectObject(DICE_MOVE3CARD_BUTTON, shadeVar))
            {
                move3Stock1 = 1
                SB_SetText(move3)
                sleep 1000
            }
            if (DetectObject(DICE_MOVE4CARD_BUTTON, shadeVar))
            {
                move4Stock1 = 1
                SB_SetText(move4)
                sleep 1000
            }
            if (DetectObject(DICE_MOVE5CARD_BUTTON, shadeVar))
            {
                move5Stock1 = 1
                SB_SetText(move5)
                sleep 1000
            }
            if (DetectObject(DICE_MOVE6CARD_BUTTON), shadeVar)
            {
                move6Stock1 = 1
                SB_SetText(move6)
                sleep 1000
            }
            if (DetectObject(DICE_MOVE10CARD_BUTTON, shadeVar))
            {
                move10Stock1 = 1
                SB_SetText(move10)
                sleep 1000
            }
            if (DetectObject(DICE_PROB1CARD_BUTTON, shadeVar))
            {
                prob1Stock1 = 1
                SB_SetText(prob1Stock1)
                sleep 1000
            }
            if (DetectObject(DICE_PROB2CARD_BUTTON, shadeVar))
            {
                prob2Stock1 := 1
                SB_SetText(prob2Stock1)
                sleep 1000
            }
            if (DetectObject(DICE_HIGHPROBCARD_BUTTON, shadeVar))
            {
                highDiceStock1 = 1
                SB_SetText(highDiceStock1)
                sleep 1000
            }
            if (DetectObject(DICE_LOWPROBCARD_BUTTON, shadeVar))
            {
                lowDiceStock1 = 1
                SB_SetText(LowDiceStock1)
                sleep 1000
            }
            if (DetectObject(DICE_ALLY2CARD_BUTTON, shadeVar))
            {   ally2Stock1 := 1
                SB_SetText(ally2Stock1)
                sleep 1000
            }
            if (DetectObject(DICE_BRONZESTOPCARD_BUTTON, shadeVar))
            {
                bronzestopStock1 := 1
                SB_SetText(bronzestopStock1)
                sleep 1000
            }
            if (DetectObject(DICE_SILVERSTOPCARD_BUTTON), shadeVar)
            {
                silverstopStock1 = 1
                SB_SetText(LowDiceStock1)
                sleep 1000
            }
            ClickObject(DICE_CLOSECARDMENU_BUTTON)
            sleep 1000
        }
        if (DetectObject(DICE_MENU_BUTTON) || DetectObject(DICE_RETREAT_BUTTON))
        {
            ClickAt(DICEMENU_X, DICEMENU_Y)
            Sleep 1000
            if (DetectObject(DICE_SKETCH_BUTTON))
            {
                sketchDiceStock1 = 1
            }
            if (DetectObject(DICE_PORTRAIT_BUTTON))
            {
                portraitDiceStock1 = 1
            }
            if (DetectObject(DICE_MASTER_BUTTON))
            {
                masterDiceStock1 = 1
            }
            ClickObject(DICE_CLOSEDICESMENU_BUTTON)
            sleep 1000
        }
        if (move6Stock1)
        {
            ClickAt(CARDMENU_X, CARDMENU_Y)
            sleep 1000
            ClickObject(DICE_MOVE6CARD_BUTTON, 27)
        }
        if (DetectObject(DICE_TITLE_IMAGE))
        {
            if (DetectObject(DICE_BEGINEVENT_BUTTON))
            {
                if (RollTheDiceDoEvent)
                {
                    ClickObject(DICE_BEGINEVENT_BUTTON)
                }
                else
                {
                    ClickObject(DICE_MPBACK_BUTTON)
                    RollTheDiceEvent = 0
                }
            }
        }
        if (DetectObject(DICE_POTIONPROMPT_TEXT))
        {
            if (RollTheDiceUsePotion)
            {
                ClickObject(DICE_USEPOTIONYES_BUTTON)
            }
            else
            {
                ClickObject(DICE_USEPOTIONNO_BUTTON)
                WaitObject(DICE_GIVEUPYES_BUTTON)
                ClickObject(DICE_GIVEUPYES_BUTTON)
            }
        }
        if (DetectObject(DICE_DISCARD_BUTTON))
        {
            ClickObject(DICE_DISCARD_BUTTON)
            WaitObject(DICE_DISCARDYES_BUTTON)
            ClickObject(DICE_DISCARDYES_BUTTON)
        }
        if (DetectObject(DICE_CLOSEPOPUP_BUTTON))
        {
            ClickObject(DICE_CLOSEPOPUP_BUTTON)
        }
        if (DetectObject(DICE_USECARDYES_BUTTON))
        {
            ClickObject(DICE_USECARDYES_BUTTON)
        }
        else if (DetectObject(DICE_USECARD_BUTTON))
        {
            ClickObject(DICE_USECARD_BUTTON)
        }
        
        else if (DetectObject(DICE_HEAL_BUTTON))
        {
            if (SHOULD_CLICK == 1)
            {
                SendEvent {ClickAt %WAIT_X%, %WAIT_Y%}
            }
            if (RollTheDiceUseDrops)
            {
                if (DetectObject(DICE_DROPSSTOCK0_TEXT))
                {
                    ClickObject(DICE_BOARDBACK_BUTTON)
                    RollTheDiceDoEvent = 0
                    SetTimer, Dice, 3000000
                }
                else
                {
                    ClickObject(DICE_HEAL_BUTTON)
                }
            }
            else
            {
                ClickObject(DICE_BOARDBACK_BUTTON)
                RollTheDiceDoEvent = 0
                SetTimer, Dice, 3000000
            }
        }
        else if (DetectObject(DICE_ROLL_BUTTON))
        {
            ClickObject(DICE_ROLL_BUTTON)
        }
        else if (DetectObject(DICE_MOVE_BUTTON))
        {
            ClickObject(DICE_MOVE_BUTTON)
        }
        else if (DetectObject(DICE_OPENCHEST_BUTTON))
        {
            ClickObject(DICE_OPENCHEST_BUTTON)
        }
        else if (DetectObject(DICE_STOP_BUTTON))
        {
            ClickObject(DICE_STOP_BUTTON)
        }
        if (DetectObject(DICE_FIGHT_BUTTON))
        {
            ClickObject(DICE_FIGHT_BUTTON)
        }
        if (DetectObject(DICE_RESULTS_TITLE))
        {
            if (DetectObject(DICE_WARPBONUSBOARDYES_BUTTON))
            {
                ClickObject(DICE_WARPBONUSBOARDYES_BUTTON)
            }
            else if (DetectObject(DICE_TOBOARD_BUTTON))
            {
                ClickObject(DICE_TOBOARD_BUTTON)
            }
            else if (DetectObject(DICE_NEXT_BUTTON))
            {
                ClickObject(DICE_NEXT_BUTTON)
            }
        }
       if (DetectObject(DICE_LEFT_BUTTON))
       {
            coord := WaitObject(DICE_LEFT_BUTTON)
            ClickAt(coord[1], coord[2])
       }
       else if (DetectObject(DICE_RIGHT_BUTTON))
       {
            coord := WaitObject(DICE_RIGHT_BUTTON)
            Clickat(coord[1], coord[2])
       }
       else if (DetectObject(DICE_UP_BUTTON))
       {
            coord := WaitObject(DICE_UP_BUTTON)
            ClickAt(coord[1], coord[2])
       }
       else if (DetectObject(DICE_DOWN_BUTTON))
       {
            coord := WaitObject(DICE_DOWN_BUTTON)
            ClickAt(coord[1], coord[2])
       }
   }
    ; ==========================================================================
    ; **************************************************************************
    ; ------------------------ FRONTLINES EVENT PAGE ---------------------------
    ; **************************************************************************
    ; ==========================================================================
    if (FrontlinesEvent)
    {
        if (DetectObject(FL_REWARDS_TITLE))
        {
            if (DetectObject(FL_RECEIVE_BUTTON))
            {
                ClickObject(FL_RECEIVE_BUTTON)
            }
            else
            {
                ClickObject(BACK_BUTTON)
            }
        }
        if (DetectObject(FL_TITLE_IMAGE))
        {
            if (DetectObject(FL_REWARDSNOTIFICATION_BUTTON))
            {
                ClickObject(FL_REWARDS_BUTTON)
            }
            if (DetectObject(FL_ASSISTNOTIFICATION_ICON))
            {
                ClickObject(FL_ASSIST_BUTTON)
            }
            if (DetectObject(FL_CPBAR1_TEXT))
            {
                ClickObject(FL_FIGHT_BUTTON)
            }
            if (DetectObject(FL_CPBAR0_TEXT))
            {
                if (FrontlinesHolyWaterCount > 0)
                {
                    ClickObject(FL_FIGHT_BUTTON)
                    WaitObject(FL_HOLYWATER_BUTTON)
                    if (DetectObject(FL_HOLYWATERSTOCK0_TEXT))
                    {
                        ClickObject(FL_CLOSE_BUTTON)
                        FrontlinesHolyWaterCount = 0
                    }
                    else if (DetectObject(FL_HOLYWATER_BUTTON))
                    {
                        ClickObject(FL_HOLYWATER_BUTTON)
                        WaitObject(FL_HOLYWATERYES_BUTTON)
                        ClickOBject(FL_HOLYWATERYES_BUTTON)
                        FrontlinesHolyWaterCount--
                    }
                }
                else
                {
                    ClickObject(FL_MYPAGE_BUTTON)
                }
            }
        }
        if (DetectObject(FL_ASSIST_TITLE))
        {
            if (DetectObject(FL_REQUESTASSISTANCE_BUTTON))
            {
                ClickObject(FL_REQUESTASSISTANCE_BUTTON)
            }
            else if (DetectObject(FL_ASSISTALL_BUTTON))
            {
                ClickObject(FL_ASSISTALL_BUTTON)
            }
            else if (DetectObject(FL_ASSISTBACK_BUTTON))
            {
                ClickObject(FL_ASSISTBACK_BUTTON)
            }
        }
        if (DetectObject(FL_OPPONENTSELECTION_TITLE))
        {
            if (DetectObject(FL_OPPONENT1_BUTTON))
            {
                ClickObject(FL_OPPONENT1_BUTTON)
            }
        }
        if (DetectObject(FL_SKILL1_BUTTON) || DetectObject(FL_SKILL2_BUTTON) || DetectObject(FL_SKILL3_BUTTON))
        {
            if (DetectObject(FL_SKILL1_BUTTON))
            {
                ClickObject(FL_SKILL1_BUTTON)
            }
            if (DetectObject(FL_SKILL2_BUTTON))
            {
                ClickObject(FL_SKILL2_BUTTON)
            }
            if (DetectObject(FL_SKILL3_BUTTON))
            {
                ClickObject(FL_SKILL3_BUTTON)
            }
        }
        else if (DetectObject(FL_SKIP_BUTTON))
        {
            ClickObject(FL_SKIP_BUTTON)
        }
        if (DetectObject(FL_RESULTVICTORY_TEXT) || DetectObject(FL_RESULTDEFEAT_TEXT))
        {
            if (DetectObject(FL_BACK_BUTTON))
            {
                ClickObject(FL_BACK_BUTTON)
            }
        }
    }
    
    ; ==========================================================================
    ; **************************************************************************
    ; --------------------- TRAIN-ENCOUNTER EVENT PAGE -------------------------
    ; **************************************************************************
    ; ==========================================================================
    if (TrainEncounterEvent)
    {
        if (DetectObject(TRNECT_EVENTTITLE_IMAGE))
        {
            deployUnitNum := 0
            pendingAllies := 1
            if (training == 0)
            {
                training--
                WaitObject(TRNECT_TRAIN_BUTTON)
                ClickObject(TRNECT_TRAIN_BUTTON)
                WaitObject(BACK_BUTTON)
                Sleep 2000
            }
            else if (training < 0)
            {
                training++
                WaitObject(TRNECT_ASSISTLIST_BUTTON)
                ClickObject(TRNECT_ASSISTLIST_BUTTON)
            }
        }
        else if (DetectObject(TRNECT_ASSISTALLIES_TEXT))
        {
            if (DetectObject(TRNECT_SENDEVENTITEM_BUTTON))
            {
                WaitObject(TRNECT_SENDEVENTITEM_BUTTON)
                ClickObject(TRNECT_SENDEVENTITEM_BUTTON)
            }
            else if (DetectObject(USEPOTIONYES_BUTTON))
            {
                ClickObject(USEPOTIONYES_BUTTON)
            }
            else if (DetectObject(TRNECT_ASSISTALLY_BUTTON))
            {
                WaitObject(TRNECT_ASSISTALLY_BUTTON)
                ClickObject(TRNECT_ASSISTALLY_BUTTON)
            }
            else if (DetectObject(TRNECT_BOSSLISTFROMASSISTALLIES_BUTTON))
            {
                WaitObject(TRNECT_BOSSLISTFROMASSISTALLIES_BUTTON)
                ClickObject(TRNECT_BOSSLISTFROMASSISTALLIES_BUTTON)
            }
        }
        else if (DetectObject(TRNECT_BOSSLIST_TEXT))
        {
            if (DetectObject(TRNECT_REQUESTASSIST_BUTTON))
            {
                WaitObject(TRNECT_REQUESTASSIST_BUTTON)
                ClickObject(TRNECT_REQUESTASSIST_BUTTON)
            }
            if (TrainEncounterEvent_USEITEM && DetectObject(TRNECT_USEEVENTITEM_BUTTON))
            {
                WaitObject(TRNECT_USEEVENTITEM_BUTTON)
                ClickObject(TRNECT_USEEVENTITEM_BUTTON)
            }
            else if (DetectObject(TRNECT_FIGHT_BUTTON))
            {
                training--
                WaitObject(TRNECT_FIGHT_BUTTON)
                ClickObject(TRNECT_FIGHT_BUTTON)
            }
            else if (DetectObject(TRNECT_POTIONFIGHT_BUTTON))
            {
                training--
                WaitObject(TRNECT_POTIONFIGHT_BUTTON)
                ClickObject(TRNECT_POTIONFIGHT_BUTTON)
            }
            else if (DetectObject(TRNECT_EVENT_BUTTON))
            {
                WaitObject(TRNECT_EVENT_BUTTON)
                ClickObject(TRNECT_EVENT_BUTTON)
            }
        }
        else if (DetectObject(TRNECT_ASSISTLIST2_BUTTON))
        {
            WaitObject(TRNECT_ASSISTLIST2_BUTTON)
            ClickObject(TRNECT_ASSISTLIST2_BUTTON)
        }
    }
	
	; ==========================================================================
	; **************************************************************************
	; ---------------------- QUEST SELECTION PAGE ------------------------------
	; **************************************************************************
	; ==========================================================================		
	if (DetectObject(QUEST_TEXT))
	{
		if (BOTALLQUEST == 1 && !latestEpisode)
		{
			if (DetectObject(SELECTEPISODE_BUTTON))
			{
				ClickObject(SELECTEPISODE_BUTTON)
			}
			else if (DetectObject(EPISODELISTNEXT_BUTTON))
			{
				ClickObject(EPISODELISTNEXT_BUTTON)
			}
			else
			{
				Scroll(QUEST_X1, QUEST_Y1, QUEST_X2, QUEST_Y2)

				if DetectObject(EPISODESELECT10_BUTTON)
				{
					ClickObject(EPISODESELECT10_BUTTON)
				}
				else if DetectObject(EPISODESELECT9_BUTTON)
				{
					ClickObject(EPISODESELECT9_BUTTON)
				}
				else if DetectObject(EPISODESELECT8_BUTTON)
				{
					ClickObject(EPISODESELECT8_BUTTON)
				}
				else if DetectObject(EPISODESELECT7_BUTTON)
				{
					ClickObject(EPISODESELECT7_BUTTON)
				}
				else if DetectObject(EPISODESELECT6_BUTTON)
				{
					ClickObject(EPISODESELECT6_BUTTON)
				}
				else if DetectObject(EPISODESELECT5_BUTTON)
				{
					ClickObject(EPISODESELECT5_BUTTON)
				}
				else if DetectObject(EPISODESELECT4_BUTTON)
				{
					ClickObject(EPISODESELECT4_BUTTON)
				}
				else if DetectObject(EPISODESELECT3_BUTTON)
				{
					ClickObject(EPISODESELECT3_BUTTON)
				}
				else if DetectObject(EPISODESELECT2_BUTTON)
				{
					ClickObject(EPISODESELECT2_BUTTON)
				}
				else if DetectObject(EPISODESELECT1_BUTTON)
				{
					ClickObject(EPISODESELECT1_BUTTON)
				}
				
				QUEST = 1
				latestEpisode = 1
			}
		}
		else
		{		
			if (QUEST >= 4)
			{
			  Scroll(QUEST_X1, QUEST_Y1, QUEST_X2, QUEST_Y2)
			}
			
			questindex := assignquest(QUEST) ; Quest index represents the actual image path of the quest button
			
			scrollCount := 2 ; Introduced to scroll up to the very top of the quest selection
			if (DetectObject(questindex))
			{
				ClickObject(questindex)
			}
			else
			{
				loop, 2
				{
					Scroll(QUEST_X2, QUEST_Y2, QUEST_X1, QUEST_Y1)
				}
			}
		}
	}
	
    
    ; ==========================================================================
    ; **************************************************************************
    ; ------------------------------- INBOX ------------------------------------
    ; **************************************************************************
    ; ==========================================================================
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
    
	; ==========================================================================
	; **************************************************************************
	; ---------------------------- QUEST BATTLE --------------------------------
	; **************************************************************************
	; ==========================================================================
	if (DetectObject(SKIPQUEST_BUTTON) && SKIPQUEST == 1)
	{
		ClickObject(SKIPQUEST_BUTTON)
	}
	if (DetectObject(DEPLOYUNIT_BUTTON) && deployUnitNum < DEPLOY_NUMBER)
	{
		ClickObject(DEPLOYUNIT_BUTTON)
	}
	if (DetectObject(DEPLOY_TEXT))
	{
    if (DetectObject(UNITFAVORITEOFF_BUTTON)) {
      ClickObject(UNITFAVORIATEOFF_BUTTON)
    }

		if (DeployUnit(SORTINDEX, TYPEINDEX))
		{
			deployUnitNum++
		}
	}
	if (DetectObject(CALLALLY_BUTTON) && pendingAllies)
	{
		ClickObject(CALLALLY_BUTTON)
	}

	if (DetectObject(CALLALLYPAGE_TEXT))
	{
		if (CallAlly(SORTINDEX, TYPEINDEX))
		{
			pendingAllies = 1
		}
		else
		{
			pendingAllies = 0
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
	if (DetectObject(ADVANCE_BUTTON))
	{
		WaitObject(ADVANCE_BUTTON)
		ClickObject(ADVANCE_BUTTON)
	}
	if (DetectObject(SENDBRAVE_BUTTON))
	{
		WaitObject(SENDBRAVE_BUTTON)
		ClickObject(SENDBRAVE_BUTTON)
	}
	if (DetectObject(CONTINUETRAINING_BUTTON))
	{
		WaitObject(CONTINUETRAINING_BUTTON)
		ClickObject(CONTINUETRAINING_BUTTON)
	}
    
	if (DetectObject(HEAL_BUTTON) || DetectObject(HEALMID_BUTTON) || DetectObject(HEALDARK_BUTTON)
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
		WaitObject(USEPOTIONYES_BUTTON)
		ClickObject(USEPOTIONYES_BUTTON)
		Sleep 2000
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
		WaitObject(TRAININGSUMMONALLY_BUTTON)
		ClickObject(TRAININGSUMMONALLY_BUTTON)
	}
	if (DetectObject(TRAININGFIGHT_BUTTON))
	{
		WaitObject(TRAININGFIGHT_BUTTON)
		ClickObject(TRAININGFIGHT_BUTTON)
	}
	
	; ==========================================================================
	; **************************************************************************
	; ------------------------ QUEST RESULTS PAGE ------------------------------
	; **************************************************************************
	; ==========================================================================	
	if (DetectObject(QUESTCLEAR_TEXT) || DetectObject(QUESTRESULT_TEXT))
	{
		if (DetectObject(QUESTCLEAR_TEXT) && BOTALLQUEST)
		{
			if (QUEST < 7)
			{
				QUEST++
			}
			else
			{
				latestEpisode = 0
			}
		}
		if (DetectObject(MYPAGE_BUTTON) && BotEvent == 1)
		{
			ClickObject(MYPAGE_BUTTON)
		}
		else if (DetectObject(BACKTOEVENT_BUTTON))
		{
			WaitObject(BACKTOEVENT_BUTTON)
			ClickObject(BACKTOEVENT_BUTTON)
		}
		else if (DetectObject(CHOOSEQUESTCOMPLETED_BUTTON))
		{
			WaitObject(CHOOSEQUESTCOMPLETED_BUTTON)
			ClickObject(CHOOSEQUESTCOMPLETED_BUTTON)
		}
		deployUnitNum = 0
		pendingAllies = 1
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
