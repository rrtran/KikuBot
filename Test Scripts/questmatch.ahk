#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

image_name := "questtitle1.bmp"

IfWinExist, Bluestacks App Player
    WinActivate ; use the window found above
WinGetActiveStats, title, width, height, x, y
ImageSearch, FirstPassX, FirstPassY, 0, 0, width, height, %image_name%

if ErrorLevel = 2
    tooltip Could not conduct the search.
else if ErrorLevel = 1
{
    loop, 255
    {
        variation := A_Index
        
        
        loop, 10
        {
            dimension := 16 + A_Index - 1
            ImageSearch, FirstPassX, FirstPassY, 0, 0, width, height, *w%dimension% *h-1 *%variation% %image_name%
            tooltip Outer Iteration %variation%: Image of width and height of %dimension% could not be found on the screen %width% and %height%
            
            if (ErrorLevel = 0)
            {
                mousemove, %FirstPassX%, %FirstPassY%, 10
                tooltip The image of width and height of %dimension% was found at %FirstPassX%x%FirstPassY% after %variation% outer iterations.
                break
            }
        }
        if (ErrorLevel = 0)
        {
            break
        }
        
    }
}
else
{
    mousemove, %FirstPassX%, %FirstPassY%, 10
    tooltip The image was found at %FirstPassX%x%FirstPassY%.
}

sleep 1000

SecondPassX := 0
SecondPassY := 0

image_name := "startquest.bmp"
ImageSearch, SecondPassX, SecondPassY, FirstPassX, FirstPassY, width, height, %image_name%

if (ErrorLevel = 2)
{
    tooltip Could not conduct the search
}
else if (ErrorLevel = 1)
{
    loop, 255
    {
        ImageSearch, SecondPassX, SecondPassY, FirstPassX, FirstPassY, width, height, %image_name%
        tooltip Iteration %A_Index%: Image could not be found on the screen %width% and %height%
        
        if (ErrorLevel = 0)
        {
            mousemove, %SecondPassX%, %SecondPassY%, 10
            tooltip The image was found at %SecondPassX%x%SecondPassY% after %A_Index% iterations.
            break
        }
    }
}
else
{
    mousemove, %SecondPassX%, %SecondPassY%, 10
    tooltip The image was found at %SecondPassX%x%SecondPassY%
}

F1::ExitApp
F2::Pause
F3::Reload
