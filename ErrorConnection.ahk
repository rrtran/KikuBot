; =============================================================================
; ErrorConnection.ahk
;
; - This script will reconnect the game in cases where network connectivity is
;   lost and the game encounters a connection error.
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
; ==============================================================================


#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#include %A_ScriptDir%\includes\IncludeScript.ahk
; ============================== INITIALIZE ====================================
initGlobals() ; Found in GlobalConstants.ahk
; ==============================================================================


loop
{
	if (detectObject(FANTASICAAPP_BUTTON)) {
    clickAt(BUFFER_X, BUFFER_Y)
	}
  
  if (detectObject(STARTGAME_BUTTON)) {
    clickAt(BUFFER_X, BUFFER_Y)
  }

	if (detectObject(CONNECTIONERROR_BUTTON)) {
    clickAt(BUFFER_X, BUFFER_Y)
	}

	if (detectObject(CONNECTIONERROR_TEXT))
	{
		Send {ESC down}
		Sleep 1000
		Send {ESC up}
	}

	if (detectObject(CONFIRMEXITAPP_BUTTON)) {
    clickAt(BUFFER_X, BUFFER_Y)
	}
}


F1::ExitApp
F2::Pause
F3::Reload
