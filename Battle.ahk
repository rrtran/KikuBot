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

deployUnitNum := 0
pendingAllies := 1
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
         if (DetectObject(BATTLETIMER_TEXT))
		{
            scrollCount := BATTLE_INDEX // 3
			if (DetectObject(BATTLE_ICON, 150))
			{
				ClickObject(BATTLE_ICON, 150)
			}
            else
            {
                loop, %scrollCount%
                {
                    Scroll(MENU_X1, MENU_Y1, MENU_X2, MENU_Y2)
                }
                
                if (DetectObject(BATTLE_ICON, 150))
                {
                    ClickObject(BATTLE_ICON, 150)
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
		} ; BATTLE
    }
    
    ; ==========================================================================
	; **************************************************************************
	; ---------------------------- SELECT BATTLE --------------------------------
	; **************************************************************************
	; ==========================================================================
    if (DetectObject(BATTLE_SELECT_TITLE))
    {
        ClickObject(BATTLE_SELECT)
    }
    if (DetectObject(BATTLE_TITLE))
    {
        ClickObject(BATTLE_BUTTON)
    }
    
    ; ==========================================================================
	; **************************************************************************
	; ------------------------------ RESULTS -----------------------------------
	; **************************************************************************
	; ==========================================================================
    if (DetectObject(BATTLE_RESULTS_TITLE))
    {
        ClickObject(BATTLE_MYPAGE)
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
			ClickObject(BACKTOEVENT_BUTTON)
		}
		else if (DetectObject(CHOOSEQUESTCOMPLETED_BUTTON))
		{
			ClickObject(CHOOSEQUESTCOMPLETED_BUTTON)
		}
		deployUnitNum = 0
		pendingAllies = 1
	}
}
; ==============================================================================

F1::ExitApp
F2::Pause
F3::Reload