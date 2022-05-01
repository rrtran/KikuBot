; =============================================================================
; Tactics.ahk
;
; - Automates the tactics event
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
; ============================ Variables here =================================
TACTICS_EVENTICON := Decorate("FANTASICA IMAGES/Event/Tactics/eventicon.png")
TACTICS_BATTLE := Decorate("FANTASICA IMAGES/Event/Tactics/battle.png")
TACTICS_SKIP_PRESSED := Decorate("FANTASICA IMAGES/Event/Tactics/battle/skippressed.png")
TACTICS_SKIP:= Decorate("FANTASICA IMAGES/Event/Tactics/battle/skip.png")
TACTICS_NEXT := Decorate("FANTASICA IMAGES/Event/Tactics/results/next.png")
TACTICS_TOP := Decorate("FANTASICA IMAGES/Event/Tactics/results/top.png")
TACTICS_BOSS := Decorate("FANTASICA IMAGES/Event/Tactics/boss.png")
TACTICS_NO := Decorate("FANTASICA IMAGES/Event/Tactics/no.png")
TACTICS_FORMTEAM := Decorate("FANTASICA IMAGES/Event/Tactics/formteam.png")
TACTICS_ALL := Decorate("FANTASICA IMAGES/Event/Tactics/battle/all.png")
TACTICS_AUTO := Decorate("FANTASICA IMAGES/Event/Tactics/battle/auto.png")
; =============================================================================

loop
{
  if (detectObject(TACTICS_EVENTICON)) {
    clickAt(BUFFER_X, BUFFER_Y)
  }  

  if (detectObject(TACTICS_FORMTEAM)) {
    clickAt(BUFFER_X, BUFFER_Y)
  }

  if (detectObject(TACTICS_BATTLE)) {
    clickAt(BUFFER_X, BUFFER_Y)
  }

  if (detectObject(TACTICS_BOSS)) {
    clickAt(BUFFER_X, BUFFER_Y)
  }

  if (detectObject(TACTICS_NO)) {
    clickAt(BUFFER_X, BUFFER_Y)
  }

  if (detectObject(TACTICS_AUTO)) {
    clickAt(BUFFER_X, BUFFER_Y)
  }

  if (detectObject(TACTICS_SKIP)) {
    clickAt(BUFFER_X, BUFFER_Y)
  }

  if (detectObject(TACTICS_ALL, 75)) {
    ; Sometimes bosses are large and clicking on the icon won't 'target' them. So we need to add an offset to the buffer coord.
    clickAt(BUFFER_X - 50, BUFFER_Y + 100)
  }

  if (detectObject(TACTICS_TOP)) {
    clickAt(BUFFER_X, BUFFER_Y)
  }

  if (detectObject(TACTICS_NEXT)) {
    clickAt(BUFFER_X, BUFFER_Y)
  }
}

F1::ExitApp
F2::Pause
F3::Reload
