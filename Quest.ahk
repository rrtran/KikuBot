; =============================================================================
; Quest.ahk
;
; - This script automates questing features including quest selection, 
;   deploying units, returning to the selection screen from the results
;   page, and also entering the quest selection menu from the home screen.
;
;
; The MIT License
;
; Copyright (c) 2016 Ricky Tran <rickytran991@gmail.com>
;
; Permission is hereby granted, free of charge, to any person obtaining a copy
; of this software and associated documentation files (the "Software"), to deal
; in the Software without restriction, including without limitation the rights
; to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
; copies of the Software, and to permit persons to whom the Software is
; furnished to do so, subject to the following conditions:
; 
; The above copyright notice and this permission notice shall be included in
; all copies or substantial portions of the Software.
; 
; THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
; IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
; FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
; AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
; LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
; OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
; THE SOFTWARE.
; =============================================================================


#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%

#Include %A_ScriptDir%\includes\IncludeScript.ahk
;==============================================================================
;Init Global by invoking the following 
;GlobalConstants.ahk function.

initGlobals() ; Found in GlobalConstants.ahk
;==============================================================================
SetDefaultMouseSpeed 0


; =============================================================================
; ------------------------- Define variables here -----------------------------
deployUnitNum := 0
pendingAllies := 1
; =============================================================================


loop,
{
  if (detectObject(QUESTTIMER_TEXT))
	{
    scrollCount := QUEST_INDEX // 3
    if (detectObject(QUEST3_ICON, 150))
    {
      clickAt(BUFFER_X, BUFFER_Y)
    }
    else if (detectObject(QUEST4_ICON, 150))
    {
      clickAt(BUFFER_X, BUFFER_Y)
    }
    else if (detectObject(QUEST5_ICON, 150))
    {
      clickAt(BUFFER_X, BUFFER_Y)
    }
    else
    {
      loop, %scrollCount%
      {
        scroll(MENU_X1, MENU_Y1, MENU_X2, MENU_Y2)
      }
      
      if (detectObject(QUEST3_ICON, 150))
      {
        clickAt(BUFFER_X, BUFFER_Y)
      }
      else if (detectObject(QUEST4_ICON, 150))
      {
        clickAt(BUFFER_X, BUFFER_Y)
      }
      else if (detectObject(QUEST5_ICON, 150))
      {
        clickAt(BUFFER_X, BUFFER_Y)
      }
      else 
      {   
        scrollCount++
        loop, %scrollCount%
        {
            scroll(MENU_X2, MENU_Y2, MENU_X1, MENU_Y1)
        }
      }
    }
  }

	; ==========================================================================
	; **************************************************************************
	; ---------------------- QUEST SELECTION PAGE ------------------------------
	; **************************************************************************
	; ==========================================================================		
	if (detectObject(QUEST_TEXT))
	{
		if (BOTALLQUEST == 1 && !latestEpisode)
		{
			if (detectObject(SELECTEPISODE_BUTTON))
			{
        clickAt(BUFFER_X, BUFFER_Y)
			}
			else if (detectObject(EPISODELISTNEXT_BUTTON))
			{
         clickAt(BUFFER_X, BUFFER_Y)
			}
			else
			{
				scroll(QUEST_X1, QUEST_Y1, QUEST_X2, QUEST_Y2)

  			if (detectObject(EPISODESELECT10_BUTTON))
				{
          clickAt(BUFFER_X, BUFFER_Y)
				}
				else if (detectObject(EPISODESELECT9_BUTTON))
				{
          clickAt(BUFFER_X, BUFFER_Y)
				}
				else if (detectObject(EPISODESELECT8_BUTTON))
				{
          clickAt(BUFFER_X, BUFFER_Y)
				}
				else if (detectObject(EPISODESELECT7_BUTTON))
				{
          clickAt(BUFFER_X, BUFFER_Y)
				}
				else if (detectObject(EPISODESELECT6_BUTTON))
				{
          clickAt(BUFFER_X, BUFFER_Y)
				}
				else if (detectObject(EPISODESELECT5_BUTTON))
				{
          clickAt(BUFFER_X, BUFFER_Y)
				}
				else if (detectObject(EPISODESELECT4_BUTTON))
				{
          clickAt(BUFFER_X, BUFFER_Y)
				}
				else if (detectObject(EPISODESELECT3_BUTTON))
				{
          clickAt(BUFFER_X, BUFFER_Y)
				}
				else if (detectObject(EPISODESELECT2_BUTTON))
				{
          clickAt(BUFFER_X, BUFFER_Y)
				}
				else if (detectObject(EPISODESELECT1_BUTTON))
				{
          clickAt(BUFFER_X, BUFFER_Y)
				}
				
				QUEST = 1
				latestEpisode = 1
			}
		}
		else
		{
			if (QUEST >= 4) {
			  scroll(QUEST_X1, QUEST_Y1, QUEST_X2, QUEST_Y2)
			}
			
			questindex := assignquest(QUEST)
			
			scrollCount := 2 ; Introduced to scroll up to the very top of the quest selection
			if (detectObject(questindex))
			{
        clickAt(BUFFER_X, BUFFER_Y)
			}
			else
			{
				loop, 2
				{
					scroll(QUEST_X2, QUEST_Y2, QUEST_X1, QUEST_Y1)
				}
			}
		}
	}
; ====================================================
; ------------------- QUEST BATTLE -------------------
; ====================================================
	if (detectObject(SKIPQUEST_BUTTON) && SKIPQUEST == 1) {
    clickAt(BUFFER_X, BUFFER_Y)
	}

  if (detectObject(DEPLOYUNIT_BUTTON) && deployUnitNum < DEPLOY_NUMBER) {
    clickAt(BUFFER_X, BUFFER_Y)
  }

  if (detectObject(DEPLOY_TEXT)) {
    if (detectObject(UNITFAVORITEOFF_BUTTON)) {
      clickAt(BUFFER_X, BUFFER_Y)
    }

    if (deployUnit(ATTACK_TYPE, ATTRIB_TYPE)) {
      deployUnitNum++
    }
    else {
      deployUnitNum := DEPLOY_NUMBER
    }
  }

	if (detectObject(CALLALLY_BUTTON) && pendingAllies)	{
    clickAt(BUFFER_X, BUFFER_Y)
	}

	if (detectObject(CALLALLYPAGE_TEXT))
	{
		if (deployAlly(ATTACK_TYPE, ATTRIB_TYPE)) {
			pendingAllies = 1
		}
		else {
			pendingAllies = 0
		}
  }

	; ==========================================================================
	; **************************************************************************
	; ------------------------ QUEST RESULTS PAGE ------------------------------
	; **************************************************************************
	; ==========================================================================	
	if (detectObject(QUESTCLEAR_TEXT) || detectObject(QUESTRESULT_TEXT))
	{
		if (detectObject(QUESTCLEAR_TEXT) && BOTALLQUEST)
		{
			if (QUEST < 7) {
				QUEST++
			}
			else {
				latestEpisode = 0
			}
		}

		if (detectObject(MYPAGE_BUTTON) && BotEvent == 1) {
      clickAt(BUFFER_X, BUFFER_Y)
		}
		else if (detectObject(CHOOSEQUESTCOMPLETED_BUTTON)) {
      clickAt(BUFFER_X, BUFFER_Y)
		}

		deployUnitNum = 0
		pendingAllies = 1
	}
}


F1::ExitApp
F2::PAUSE
F3::Reload
