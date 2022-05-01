; =============================================================================
; LegionBattle.ahk
;
; - Automates the Legion Battle event
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

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#include %A_ScriptDir%\includes\IncludeScript.ahk

;------- INITIALIZE -------------------------
initGlobals() ; Found in GlobalConstants.ahk
;--------------------------------------------
SetDefaultMouseSpeed 0

; =============================================================================
; ============================== Variables here ===============================
LEGION_SEAAREA := Decorate("FANTASICA IMAGES/Event/LegionBattle/seaarea.png")
LEGION_SPECIAL_AREA := Decorate("FANTASICA IMAGES/Event/LegionBattle/specialarea.png")
LEGION_YESAREA := Decorate("FANTASICA IMAGES/Event/LegionBattle/yes.png")
LEGION_WALK := Decorate("FANTASICA IMAGES/Event/LegionBattle/area/walk.png")
LEGION_HEAL := Decorate("FANTASICA IMAGES/Event/LegionBattle/area/heal.png")
LEGION_SENDBRAVE := Decorate("FANTASICA IMAGES/Event/LegionBattle/area/sendbrave.png")
LEGION_WALK_AFTER_SENT_BRAVE := Decorate("FANTASICA IMAGES/Event/LegionBattle/area/walk_after_sent_brave.png")
LEGION_FIGHT := Decorate("FANTASICA IMAGES/Event/LegionBattle/area/fight.png")
LEGION_YESFIGHT := Decorate("FANTASICA IMAGES/Event/LegionBattle/area/yes.png")
LEGION_AUTOBATTLE := Decorate("FANTASICA IMAGES/Event/LegionBattle/battle/autobattle.png")
LEGION_FIELD_CLEARED := Decorate("FANTASICA IMAGES/Event/LegionBattle/arearesult/fieldcleared.png")
LEGION_FIELD_CLEARED_BACK := Decorate("FANTASICA IMAGES/Event/LegionBattle/arearesult/back.png")
LEGION_BACK := Decorate("FANTASICA IMAGES/Event/LegionBattle/result/back.png")
LEGION_ARCH_ENEMY_LIST := Decorate("FANTASICA IMAGES/Event/LegionBattle/archenemylist/archenemylist.png")
LEGION_RESULT := Decorate("FANTASICA IMAGES/Event/LegionBattle/result/result.png")
LEGION_ENEMY_LIST := Decorate("FANTASICA IMAGES/Event/LegionBattle/enemylist/enemylist.png")
; =============================================================================

loop
{
  if (detectObject(LEGION_ENEMY_LIST)) {
    clickAt(BUFFER_X, BUFFER_Y)
  }  

  if (detectObject(LEGION_RESULT)) {
    clickAt(BUFFER_X, BUFFER_Y)
  }

  if (detectObject(LEGION_SPECIAL_AREA)) {
    clickAt(BUFFER_X, BUFFER_Y)
  } 
  else if (detectObject(LEGION_SEAAREA)) {
    clickAt(BUFFER_X, BUFFER_Y)
  }

  if (detectObject(LEGION_YESAREA)) {
    clickAt(BUFFER_X, BUFFER_Y)
  }

  if (detectObject(LEGION_WALK)) {
    clickAt(BUFFER_X, BUFFER_Y)
  }

  if (detectObject(LEGION_HEAL)) {
    clickAt(BUFFER_X, BUFFER_Y)
  }

  if (detectObject(LEGION_ARCH_ENEMY_LIST)) {
    clickAt(BUFFER_X, BUFFER_Y)
  }

  if (detectObject(LEGION_WALK_AFTER_SENT_BRAVE)) {
    clickAt(BUFFER_X, BUFFER_Y)
  }

  if (detectObject(LEGION_SENDBRAVE)) {
    clickAt(BUFFER_X, BUFFER_Y)
  }

  if (detectObject(LEGION_FIGHT)) {
    clickAt(BUFFER_X, BUFFER_Y)
  }

  if (detectObject(LEGION_YESFIGHT)) {
    clickAt(BUFFER_X, BUFFER_Y)
  }

  if (detectObject(LEGION_AUTOBATTLE)) {
    clickAt(BUFFER_X, BUFFER_Y)
  }

  if (detectObject(LEGION_FIELD_CLEARED)) {
    clickAt(BUFFER_X, BUFFER_Y)
  }

  if (detectObject(LEGION_BACK)) {
    clickAt(BUFFER_X, BUFFER_Y)
  }
}

F1::ExitApp
F2::Pause
F3::Reload
