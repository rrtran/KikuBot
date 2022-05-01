; =============================================================================
; Tree.ahk
;
; - This script bots the Tree event
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
TREE_EVENT := Decorate("FANTASICA IMAGES/Event/Tree/eventicon.png")
TREE_START_NEW := Decorate("FANTASICA IMAGES/Event/Tree/startnew.png")
TREE_START_CURRENT := Decorate("FANTASICA IMAGES/Event/Tree/startcurrent.png")
TREE_START_BOSS := Decorate("FANTASICA IMAGES/Event/Tree/fightboss.png")
TREE_ADVANCE := Decorate("FANTASICA IMAGES/Event/Tree/Training/advance.png")
TREE_ADVANCE_AFTER_CARD := Decorate("FANTASICA IMAGES/Event/Tree/Training/cardadvance.png")
TREE_BRAVE := Decorate("FANTASICA IMAGES/Event/Tree/Training/sendbrave.png")
TREE_BACK := Decorate("FANTASICA IMAGES/Event/Tree/Training/back.png")
TREE_FIGHT := Decorate("FANTASICA IMAGES/Event/Tree/Training/fight.png")
TREE_HEAL := Decorate("FANTASICA IMAGES/Event/Tree/Training/heal.png")
TREE_YES := Decorate("FANTASICA IMAGES/Event/Tree/yes.png")
TREE_BACK_TO_EVENT := Decorate("FANTASICA IMAGES/Event/Tree/Result/backtoevent.png")
deployUnitNum := 0
pendingAllies := 1
usePotion := 0
; =============================================================================


; =============================================================================
; -------------------------- Define functions here ---------------------------
togglePotion(ByRef var) 
{
  static x := 1
  var := Mod(x, 2)
  x++

  if (var) {
    SB_SetText("Potion usage is turned on")
  }
  else {
    SB_SetText("Potion usage is turned off")
  }

  sleep 1000
} 
; =============================================================================

loop,
{
  clickAt(WAIT_X, WAIT_Y)

; =========
; Main page
; =========
  if (detectObject(TREE_EVENT)) {
    clickAt(BUFFER_X, BUFFER_Y)
  }

  if (detectObject(TREE_START_NEW) || detectObject(TREE_START_CURRENT) || detectObject(TREE_START_BOSS)) {
    clickAt(BUFFER_X, BUFFER_Y)
    deployUnitNum := 0
    pendingAllies := 1
  }

; ========
; Training
; ========
  if (detectObject(TREE_ADVANCE) || detectObject(TREE_ADVANCE_AFTER_CARD)) {
    clickAt(BUFFER_X, BUFFER_Y)
  }

  if (detectObject(TREE_BRAVE)) {
    clickAt(BUFFER_X, BUFFER_Y)
  }

  if (detectObject(TREE_FIGHT)) {
    clickAt(BUFFER_X, BUFFER_Y)
  }

  if (detectObject(TREE_HEAL)) {
    if (usePotion) {
      clickAt(BUFFER_X, BUFFER_Y)
    }
    else {
      clickObject(TREE_BACK)
    }
  }

  if (detectObject(TREE_YES) && usePotion) {
    clickAt(BUFFER_X, BUFFER_Y)
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
			pendingAllies := 1
		}
		else {
			pendingAllies := 0
		}
  }

	; ==========================================================================
	; **************************************************************************
	; ------------------------ QUEST RESULTS PAGE ------------------------------
	; **************************************************************************
	; ==========================================================================	
  if (detectObject(TREE_BACK_TO_EVENT)) {
    clickAt(BUFFER_X, BUFFER_Y)
  }
}


F1::ExitApp
F2::PAUSE
F3::Reload
F4::togglePotion(usePotion)
