; =============================================================================
; ClashOfLegends.ahk
;
; - Automates the Clash of Legends event
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
; ============================= INITIALIZE ====================================
initGlobals() ; Found in GlobalConstants.ahk
; =============================================================================
SetDefaultMouseSpeed 0


; =============================================================================
; ============================= Variables here ================================
CLASH_FIGHT := Decorate("FANTASICA IMAGES/Event/ClashofLegends/selection/fight.png")
CLASH_NO := Decorate("FANTASICA IMAGES/Event/ClashofLegends/selection/no.png")
CLASH_BREW := Decorate("FANTASICA IMAGES/Event/ClashofLegends/selection/yes.png")
CLASH_START := Decorate("FANTASICA IMAGES/Event/ClashofLegends/preparation/start.png")
CLASH_YES := Decorate("FANTASICA IMAGES/Event/ClashofLegends/preparation/yes.png")
CLASH_SKIP := Decorate("FANTASICA IMAGES/Event/ClashofLegends/battle/skip.png")
CLASH_SKIP_ACTIVE := Decorate("FANTASICA IMAGES/Event/ClashofLegends/battle/skipactive.png")
CLASH_OFFENSIVE_SKILL := Decorate("FANTASICA IMAGES/Event/ClashofLegends/battle/offensiveskill.png")
CLASH_DEFENSIVE_SKILL := Decorate("FANTASICA IMAGES/Event/ClashofLegends/battle/defensiveskill.png")
CLASH_BATTLE := Decorate("FANTASICA IMAGES/Event/ClashofLegends/result/battle.png")
CLASH_RETRY := Decorate("FANTASICA IMAGES/Event/ClashofLegends/battle/potion.png")
CLASH_RETRY_YES := Decorate("FANTASICA IMAGES/Event/ClashofLegends/battle/yes.png")
useBrew := 0
; =============================================================================


; =============================================================================
; ================== Functions and Procedures here ============================
ToggleBrew(ByRef brew)
{
  static x := 0
  x++
  brew := Mod(x,2)

  ; Notify the user of this change
  if (brew) {
    SB_SetText("Brew usage turned on")
  }
  else {
    SB_SetText("Brew usage turned off")
  }
  sleep 1000
}
; =============================================================================

loop
{
  if (detectObject(CLASH_FIGHT)) {
    clickAt(BUFFER_X, BUFFER_Y)
  }

  if (useBrew) 
  {
    if (detectObject(CLASH_BREW)) {
      clickAt(BUFFER_X, BUFFER_Y)
    }
    if (detectObject(CLASH_YES)) {
      clickAt(BUFFER_X, BUFFER_Y)
    }
  }
  else 
  {
    if (detectObject(CLASH_NO)) {
      clickAt(BUFFER_X, BUFFER_Y)
    }
  }

  if (detectObject(CLASH_START)) {
    clickAt(BUFFER_X, BUFFER_Y)
  }

  if (detectObject(CLASH_YES)) {
    clickAt(BUFFER_X, BUFFER_Y)
  }

  if (detectObject(CLASH_SKIP)) {
    clickAt(BUFFER_X, BUFFER_Y)
  }

  if (detectObject(CLASH_SKIP_ACTIVE)) 
  {
    if (detectObject(CLASH_OFFENSIVE_SKILL, 50)) {
      clickAt(BUFFER_X, BUFFER_Y)
    }
    else if (detectObject(CLASH_DEFENSIVE_SKILL, 50)) {
      clickAt(BUFFER_X, BUFFER_Y)
    }
  }
  
  if (detectObject(CLASH_RETRY)) {
    clickAt(BUFFER_X, BUFFER_Y)
  }

  if (detectObject(CLASH_RETRY_YES)) {
    clickAt(BUFFER_X, BUFFER_Y)
  }

  if (detectObject(CLASH_BATTLE)) {
    clickAt(BUFFER_X, BUFFER_Y)
  }
}

F1::ExitApp
F2::Pause
F3::Reload
F4::ToggleBrew(useBrew)
