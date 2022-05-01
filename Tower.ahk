; =============================================================================
; Tower.ahk
;
; - Automates the tower event
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
; ==============================================================================


#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#include %A_ScriptDir%\includes\IncludeScript.ahk

; ==============================================================================
; ============================= Initialize Globals =============================
initGlobals() ; Found in GlobalConstants.ahk
; ==============================================================================


; ==============================================================================
; -------------------------- Define variables here -----------------------------
TOWER_ICON := Decorate("FANTASICA IMAGES/Event/Tower/eventicon.png")
TOWER_MYPAGE := Decorate("FANTASICA IMAGES/Event/Tower/buttonmypage.png")
TOWER_BATTLESTART := Decorate("FANTASICA IMAGES/Event/Tower/buttonbattlestart.png")
TOWER_BACK := Decorate("FANTASICA IMAGES/Event/Tower/resultscreen/buttonback.png")
TOWER_USE_TIME_ELIXIR := Decorate("FANTASICA IMAGES/Event/Tower/buttonbattlestartte.png")
TOWER_YES := Decorate("FANTASICA IMAGES/Event/Tower/yes.png")
deployUnitNum := 0
pendingAllies := 1
useTimeElixir := 0
; ==============================================================================


; ==============================================================================
; ------------------------ Define functions here -------------------------------


; toggleTimeElixir - Sets the referenced input variable to either 1 or 0.
;                    Alternates between each call.
; @param ByRef int - The referenced variable to set to either 1 or 0.
; @return string - Returns a blank value (empty string) to its caller.
toggleTimeElixir(ByRef var) 
{
  static x := 1
  var := Mod(x, 2)
  x++
  if (var) {
    SB_SetText("Time Elixir usage turned on")
  }
  else {
    SB_SetText("Time Elixir usage turned off")
  }
}
; ==============================================================================


loop
{
  if (detectObject(TOWER_ICON)) {
    clickAt(BUFFER_X, BUFFER_Y)
  }

	if (detectObject(TOWER_BATTLESTART)) {
    clickAt(BUFFER_X, BUFFER_Y)
    deployUnitNum := 0
    pendingAllies := 1
	}

  if (detectObject(TOWER_USE_TIME_ELIXIR) && useTimeElixir) {
    clickAt(BUFFER_X, BUFFER_Y)
  }

  if (detectObject(TOWER_YES) && useTimeElixir) {
    clickAt(BUFFER_X, BUFFER_Y)
    deployUnitNum := 0
    pendingAllies := 1
  }

	if (detectObject(TOWER_BACK)) {
    clickAt(BUFFER_X, BUFFER_Y)
	}
	
	; ==========================================================================
	; **************************************************************************
	; ---------------------------- QUEST BATTLE --------------------------------
	; **************************************************************************
	; ==========================================================================
	if (detectObject(SKIPQUEST_BUTTON) && SKIPQUEST == 1) {
    clickAt(BUFFER_X, BUFFER_Y)
	}

  if (detectObject(DEPLOYUNIT_BUTTON) && deployUnitNum < DEPLOY_NUMBER) {
    clickAt(BUFFER_X, BUFFER_Y)
  }

  if (detectObject(DEPLOY_TEXT)) 
  {
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

	if (detectObject(CALLALLY_BUTTON) && pendingAllies) {
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
}


F1::ExitApp
F2::Pause
F3::Reload
F4::toggleTimeElixir(useTimeElixir)
