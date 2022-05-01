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
latestEpisode := 1
loop,
{	
    if (DetectObject(MYPAGEID_TEXT))
    {
        if (DetectObject(QUESTTIMER_TEXT))
		{
            scrollCount := QUEST_INDEX // 3
			if (DetectObject(QUEST5_ICON, 150))
			{
				ClickObject(QUEST5_ICON, 150)
			}
            else
            {
                loop, %scrollCount%
                {
                    Scroll(MENU_X1, MENU_Y1, MENU_X2, MENU_Y2)
                }
                
                if (DetectObject(QUEST5_ICON, 150))
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
            if (QUEST >= 6)
            {
                Scroll(QUEST_X1, QUEST_Y1, QUEST_X2, QUEST_Y2)
            }
            if (QUEST >= 7)
            {
                Scroll(QUEST_X1, QUEST_Y1, QUEST_X2, QUEST_Y2)
            }
            sleep 2000
			questindex := assignquest(QUEST) ; Quest index represents the actual image path of the quest button
			
			scrollCount := 4 ; Introduced to scroll up to the very top of the quest selection screen
			if (DetectObject(questindex))
			{
				ClickObject(questindex)
			}
			else
			{
				loop, %scrollCount%
				{
					Scroll(QUEST_X2, QUEST_Y2, QUEST_X1, QUEST_Y1)
				}
			}
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