; =============================================================================
; ObjectInteraction.ahk
;
; - A series of functions designed to interact with image-based GUI components
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


;clickAt() - Performs a left-mouse click at the coordinates specified by the arguments
;@param int - The x coordinate
;@param int - The y coordinate
;@return string - Returns a blank value (empty string) to its caller
clickAt(coordX, coordY)
{
	global SLEEPTIME
	global BLUESTACK_WINDOW_TITLE
	
  if (winExist(BLUESTACK_WINDOW_TITLE)) {
	  WinActivate, %BLUESTACK_WINDOW_TITLE%
  }

  SendEvent { Click down %coordX%, %coordY%}
  sleep SLEEPTIME
  SendEvent { Click up }
}

;clickObject() - Searchs for the image specified as an argument. If the image
;                is found, performs a click on the image
;@param string - The path of the image to match
;@param int - The allowed number of shades of variation in either direction for
;             the intensity of the red, green, and blue components of each 
;             pixel's color. Specify between 0 to 255 (inclusive)
;@return string - Returns a blank value (empty string) to its caller
clickObject(path, variation := 0)
{
	global SLEEPTIME, X1,X2,Y1,Y2
	global BLUESTACK_WINDOW_TITLE

  if (winExist(BLUESTACK_WINDOW_TITLE)) {
    WinActivate, %BLUESTACK_WINDOW_TITLE%
  }

	ImageSearch, FoundX, FoundY, X1, Y1, X2, Y2, *%variation% %path%
	if (ErrorLevel = 2)
	{
		msg := "File Missing(ClickObject), We can't seem to find this file: " . path
		SB_SetText(msg)
		Log(msg)
	}
	else if (ErrorLevel = 1)
	{
		msg := "Click Failed, " . path . " could not be found."
		SB_SetText(msg)
		Log(msg)
	}
	else
	{
		SB_SetText("Clicking " . path)
		ClickAt(FoundX, FoundY)
	}
}

;detectObject - Scans the window for the image specified by the argument path.
;               If the image is found, set the global buffer coordinates to the
;               coordinates where the matching image within the window is found
;               and return 1. Otherwise, return 0.
;@param string - The path of the image to match
;@param int - The allowed number of shades of variation in either direction for 
;             the intensity of the red, green, and blue components of each 
;             pixel's color. Specify between 0 to 255 (inclusive)
;@return int - Returns 1 if the image matched within the window. 
;              Otherwise, returns 0.
detectObject(path, variation := 0)
{
	global X1,X2,Y1,Y2, BACK_BUTTON, SLEEEPTIME
	global BLUESTACK_WINDOW_TITLE
	global BUFFER_X, BUFFER_Y

  if (winExist(BLUESTACK_WINDOW_TITLE)) {
	  WinActivate, %BLUESTACK_WINDOW_TITLE%
  }

	ImageSearch, FoundX, FoundY, X1, Y1, X2, Y2, *TransBlack *%variation% %path%
	if (ErrorLevel = 2)
  {
		msg := "File Missing(DetectObject), We can't seem to find this file: " . path
		SB_SetText(msg)
		Log(msg)

		; TODO ADD DRAG n' DROP function here
		Sleep SLEEEPTIME
    return 0
	}
	else if (ErrorLevel = 1)
  {
		msg := "NotFound(DetectObject), Image not detected on the screen: " . path
		SB_SetText(msg)
		;Log(msg)
		return 0
	}
	else
  {
		BUFFER_X := FoundX
		BUFFER_Y := FoundY
		return 1
	}
}

;waitObject - Continuously scans the window for the image specified in the
;               argument until the image is found, then returns a pair object
;               containing the coordinates where the match occurred.
;@param ByRef path - The path of the image which we want to match.
;@return int[2] - If the image is foun, returns a pair object where the first 
;                 element holds the x-coordinate and the second element holds
;                 the y-coordinate. Otherwise, this function never terminates
;                 and loops indefinitely (busy-waiting).
waitObject(ByRef path)
{
	global X1, X2, Y1, Y2, SLEEPTIME
	global WAIT_X, WAIT_Y
	global BLUESTACK_WINDOW_TITLE

  if (winExist(BLUESTACK_WINDOW_TITLE)) {
	  WinActivate, %BLUESTACK_WINDOW_TITLE%
  }

	SB_SetText("Waiting for `n`n" . path)
	ImageSearch, FoundX, FoundY, X1, Y1, X2, Y2, %path%
	while (ErrorLevel == 2)
	{
		msg := "File Missing(WaitObject), We can't seem to find this file: " . path
		SB_SetText(msg)
		Log(msg)
		; TODO ADD DRAG n' DROP function here
	}

	x := ""
	y := ""
	waitStatus := ["*", "* *", "* * *"]
	while (ErrorLevel == 1)
	{
    if (winExist(BLUESTACK_WINDOW_TITLE)) {
			WinActivate, %BLUESTACK_WINDOW_TITLE%
    }

		SB_SetText("Waiting for " . path . waitStatus[mod(A_Index,3)])
		SendEvent {Click %WAIT_X%, %WAIT_Y% }
		ImageSearch, x, y, X1, Y1, X2, Y2, %path%
	}

	array := [x, y]
	return array
}
