#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#include %A_ScriptDir%\includes\IncludeScript.ahk
;------- INITIALIZE -------------------------
Init_globals() ; Found in GlobalConstants.ahk
;--------------------------------------------
SetDefaultMouseSpeed 0

; ======================
; === Variables here ===
DICE_ROLL := Decorate("FANTASICA IMAGES/Event/Dice/board/roll.png")
DICE_STOP := Decorate("FANTASICA IMAGES/Event/Dice/board/stop.png")
DICE_FIGHT := Decorate("FANTASICA IMAGES/Event/Dice/board/fight.png")
DICE_NEXT := Decorate("FANTASICA IMAGES/Event/Dice/result/next.png")
DICE_BOARD := Decorate("FANTASICA IMAGES/Event/Dice/result/board.png")
DICE_CLOSE := Decorate("FANTASICA IMAGES/Event/Dice/board/close.png")
DICE_MOVE := Decorate("FANTASICA IMAGES/Event/Dice/board/move.png")
DICE_ARROW := Decorate("FANTASICA IMAGES/Event/Dice/board/arrow.png")
DICE_OPEN := Decorate("FANTASICA IMAGES/Event/Dice/board/open.png")
DICE_DICEMENU := Decorate("FANTASICA IMAGES/Event/Dice/board/dice.png")
DICE_DOUBLEDIE := Decorate("FANTASICA IMAGES/Event/Dice/board/doubledie.png")
DICE_CLOSEDIEMENU := Decorate("FANTASICA IMAGES/Event/Dice/board/closediemenu.png")
selectedDice := 0
; ======================
loop
{ 
  if (detectObject(DICE_DOUBLEDIE)) {
	  clickObject(DICE_DOUBLEDIE)
    selectedDice := 1
  }
	
  if (detectObject(DICE_CLOSEDIEMENU)) {
	  clickObject(DICE_CLOSEDIEMENU)
  }

  if (detectObject(DICE_DICEMENU, 20)) {
	  clickObject(DICE_DICEMENU, 20)
  }
  
  if (detectObject(DICE_ROLL)) {
    clickObject(DICE_ROLL)
  }

  if (detectObject(DICE_STOP)) {
    clickObject(DICE_STOP)
    selectedDice := 0
  }

  if (detectObject(DICE_FIGHT)) {
    clickObject(DICE_FIGHT)
  }

  if (detectObject(DICE_NEXT)) {
    clickObject(DICE_NEXT)
  }

  if (detectObject(DICE_BOARD)) {
    clickObject(DICE_BOARD)
  }

  if (detectObject(DICE_CLOSE)) {
    clickObject(DICE_CLOSE)
  }

  if (detectObject(DICE_MOVE)) {
    clickObject(DICE_MOVE)
  }
  
  if (detectObject(DICE_ARROW,50)) {
	  clickObject(DICE_ARROW, 50)
  }
  
  if (detectObject(DICE_OPEN)) {
	  clickObject(DICE_OPEN)
  }
}
; ==============================================================================

F1::ExitApp
F2::Pause
F3::Reload
