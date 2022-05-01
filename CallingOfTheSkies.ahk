#NoEnv
SendMode Input

#include %A_ScriptDir%\includes\IncludeScript.ahk
SetDefaultMouseSpeed 0
;============================================
;Init Global by invoking the following
; GlobalConstants.ahk function.

Init_globals() ; Found in GlobalConstants.ahk
;============================================


;===========================================
;------------ Variables here ---------------
;SKIES_TRAIN := Decorate("")
;SKIES_ASSISTS := Decorate("")
;SKIES_ASSIST_ALLY := Decorate("")
;SKIES_ASSIST_ALLIES := Decorate("")
;SKIES_EVENT_BACK := Decorate("")
;===========================================

loop,
{
  if (DetectObject(SKIES_TRAIN)) {
    ClickObject(SKIES_TRAIN)
  }

  if (DetectObject(SKIES_ASSISTS)) {
    ClickObject(SKIES_ASSISTS)
  }

  if (DetectObject(SKIES_ASSIST_ALLY)) {
    ClickObject(SKIES_ASSIST_ALLY)
  }
  else if (DetectObject(SKIES_EVENT_BACK)) {
    ClickObject(SKIES_EVENT_BACK)
  }

  if (DetectObject(SKIES_ASSIST_ALLIES)) {
    ClickObject(SKIES_ASSIST_ALLIES)
  }
}

F1::ExitApp
F2::PAUSE
F3::Reload
