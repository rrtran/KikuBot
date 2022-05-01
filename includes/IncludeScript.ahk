#NoEnv 
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#include UserInput.txt
#include %A_ScriptDir%\includes\lib\GlobalConstants.ahk
#include %A_ScriptDir%\includes\lib\GuiConstructor.ahk
#include %A_ScriptDir%\includes\lib\ObjectInteraction.ahk 
#include %A_ScriptDir%\includes\lib\QuestProcedures.ahk
#include %A_ScriptDir%\includes\lib\Log.ahk
#include %A_ScriptDir%\includes\lib\Decorate.ahk
#include %A_ScriptDir%\includes\lib\SB.ahk
