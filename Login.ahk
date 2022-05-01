; =============================================================================
; Login.ahk
;
; - Handles login-related tasks
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

; =============================================================================
initGlobals() ; Found in GlobalConstants.ahk
; =============================================================================


loop
{
	if (detectObject(LOGINBINGO_TEXT))
	{
    if (detectObject(LOGINBINGOMYPAGE_BUTTON)) {
      clickAt(BUFFER_X, BUFFER_Y)
    }
		else if (detectObject(LOGINBINGORECEIVE_BUTTON)) {
      clickAt(BUFFER_X, BUFFER_Y)
		}
		else if (detectObject(LOGINBINGOPANEL_ICON), 50) {
      clickAt(BUFFER_X, BUFFER_Y)
		}
	}	

	if (detectObject(LOGINBONUSMYPAGE_BUTTON)) {
    clickAt(BUFFER_X, BUFFER_Y)
	}

	if (detectObject(ALLYPENDINGREQUEST_TEXT)) {
    clickAt(BUFFER_X, BUFFER_Y)
	}
	else if (detectObject(ALLY_TEXT))	{
    clickAt(BUFFER_X, BUFFER_Y)
	}

	if (detectObject(POPUPCLOSE_BUTTON)) {
    clickAt(BUFFER_X, BUFFER_Y)
	}
}


F1::ExitApp
F2::Pause
F3::Reload
