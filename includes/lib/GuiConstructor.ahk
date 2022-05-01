#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

Gui, +AlwaysOnTop
Gui, Show, x0 y0 h25 w1000, KikuBot
Gui, Add, Text, x20 y20 h100 w400 , ~~~~~~~~~~~~~
Gui, Add, StatusBar,, Status bar ready!
Gui, Add, Progress, w300 h20 cBlue vMyProgress
SB_SetParts(800, 129)