#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

image_name := "training.bmp"

IfWinExist, Bluestacks App Player
    WinActivate ; use the window found above
WinGetActiveStats, title, width, height, x, y
ImageSearch, FoundX, FoundY, 0, 0, width, height, %image_name%

if ErrorLevel = 2
    tooltip Could not conduct the search.
else if ErrorLevel = 1
{
    loop, 255
    {
        ImageSearch, FoundX, FoundY, 0, 0, width, height, *%A_Index% %image_name%
        tooltip Iteration %A_Index%: Image could not be found on the screen %width% and %height%.
        
        if (ErrorLevel = 0)
        {
            mousemove, %FoundX%, %FoundY%, 10
            tooltip The image was found at %FoundX%x%FoundY% after %A_Index% iterations.
            ; break
        }
    } 
}
else
{
    mousemove, %FoundX%, %FoundY%, 10
    tooltip The image was found at %FoundX%x%FoundY%.
}


F1::ExitApp
F2::Pause
F3::Reload
