; =============================================================================
; QuestProcedures.ahk
;
; - A series of functions designed to perform quest-related operations
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


;assignQuest() - A helper function that maps an integer to the path of the 
;                corresponding quest's start button.
;@param int - An integer which is used to determine which path it should return
;@return string - If the argument is valid, returns the path to the quest's 
;                 start button. Otheriwse, terminate the script.
assignQuest(questNum)
{
	global STARTQUEST1_BUTTON, STARTQUEST2_BUTTON, STARTQUEST3_BUTTON
  global STARTQUEST4_BUTTON, STARTQUEST5_BUTTON, STARTQUEST6_BUTTON
  global STARTQUEST7_BUTTON, STARTQUEST8_BUTTON, STARTQUEST9_BUTTON 
  global STARTQUEST10_BUTTON
	
	if (questNum == 1) {
		return %STARTQUEST1_BUTTON%
  }
	else if (questNum == 2) {
		return %STARTQUEST2_BUTTON%
  }
	else if (questNum == 3) {
		return %STARTQUEST3_BUTTON%
  }
	else if (questNum == 4) {
		return %STARTQUEST4_BUTTON%
  }
	else if (questNum == 5) {
		return %STARTQUEST5_BUTTON%
  }
	else if (questNum == 6) {
		return %STARTQUEST6_BUTTON%
  }
	else if (questNum  == 7) {
		return %STARTQUEST7_BUTTON%
  }
  else if (questNum  == 8) {
		return %STARTQUEST8_BUTTON%
  }
  else if (questNum  == 9) {
		return %STARTQUEST9_BUTTON%
  }
  else if (questNum  == 10) {
		return %STARTQUEST10_BUTTON%
  }
  else {
    MsgBox, 0, Invalid Quest Assignment, Soooorrrry, we don't support quest %QuestNum%.
    ExitApp
  }
}

;chooseAlly() - A private helper function for the deployAlly(). Searchs the
;               ally list for any deployable allies. Returns if an ally was
;               selected or the end of the list was reached.
;@return int - Returns 1 if an ally was chosen. Otherwise, returns 0
chooseAlly()
{
	global DEPLOYALLY1_BUTTON, DEPLOYALLY2_BUTTON, DEPLOYALLY3_BUTTON, NEXTPAGE_BUTTON, NONEXTPAGE_BUTTON
	while (!detectObject(NONEXTPAGE_BUTTON))
	{
		if (detectObject(DEPLOYALLY1_BUTTON))
		{
			clickObject(DEPLOYALLY1_BUTTON)
			return 1
		}
		else if (detectObject(DEPLOYALLY2_BUTTON))
		{
			clickObject(DEPLOYALLY2_BUTTON)
			return 1
		}
		else if (detectObject(DEPLOYALLY3_BUTTON))
		{
			clickObject(DEPLOYALLY3_BUTTON)
			return 1
		}
		else if (detectObject(NEXTPAGE_BUTTON))
		{
			clickObject(NEXTPAGE_BUTTON)
			;some lag (hardware-related) may occur here which ends the loop
		}
	}

	if (detectObject(DEPLOYALLY1_BUTTON))
	{
		clickObject(DEPLOYALLY1_BUTTON)
		return 1
	}
	else if (detectObject(DEPLOYALLY2_BUTTON))
	{
		clickObject(DEPLOYALLY2_BUTTON)
		return 1
	}
	else if (detectObject(DEPLOYALLY3_BUTTON))
	{
		clickObject(DEPLOYALLY3_BUTTON)
		return 1
	}
  else 
  {
	  return 0
  }	
}

;deployAlly() - Performs a sequence of steps to deploy an ally.
;@param int - An integer that controls how to sort the list by attack type:
;               0 = Default, 1 = Ground, 2 = Air, 3 = Sea
;@param int - An integer that controls how to filter the list by attribute type:
;               0 = Default, 1 = Melee, 2 = Missile, 3 = Magic
;@return int - Returns 1 if an ally was deployed. Otherwise, returns 0.
deployAlly(attackType = 0, attribType = 0) 
{
  global BACKQUEST_BUTTON, CALLALLYPAGE_TEXT
  global CONFIRMUNITPLACEMENT_BUTTON, CANCELPLACEMENT_BUTTON

  if (detectObject(CALLALLYPAGE_TEXT)) {
    toggleAttackType(attackType)
    toggleAttribType(attribType)
    invariantCheck := ChooseAlly()

    if (invariantCheck)
    {
      if (findCoordinate())
      {
        while (detectObject(CONFIRMUNITPLACEMENT_BUTTON)) {
          clickObject(CONFIRMUNITPLACEMENT_BUTTON)
        }
        return 1
      }
      else {
        clickObject(CANCELPLACEMENT_BUTTON)
        waitObject(BACKQUEST_BUTTON)
        clickObject(BACKQUEST_BUTTON)
        return 0
      }
    }
    else
    {
      clickObject(BACKQUEST_BUTTON)
      return 0
    }
  }
  else
  {
    return 0
  }
}

;deployUnit() - Performs a sequence of steps to deploy a unit. Filter and sort
;              units as specified by the input arguments.
;@param int - Controls how to sort the list by attack type.
;               0 = Default, 1 = Ground, 2 = Air, 3 = Sea
;@param int - Controls how to filter the list by attribute type
;               0 = Default, 1 = Melee, 2 = Missile, 3 = Magic
;@return int - Returns 1 if a unit was deployed. Otherwise, returns 0.
deployUnit(attackType := 0, attribType := 0)
{
  global DEPLOY_TEXT, DEPLOYUNIT1_BUTTON, DEPLOYUNIT2_BUTTON
  global DEPLOYUNIT3_BUTTON, DEPLOYUNIT4_BUTTON
  global BACKQUEST_BUTTON
	global CONFIRMUNITPLACEMENT_BUTTON, CANCELPLACEMENT_BUTTON

  if (detectObject(DEPLOY_TEXT)) {
    toggleAttackType(attackType)
    toggleAttribType(attribType)

    if (detectObject(DEPLOYUNIT1_BUTTON)) {
      clickObject(DEPLOYUNIT1_BUTTON)
    }
    else if (detectObject(DEPLOYUNIT2_BUTTON)) {
      clickObject(DEPLOYUNIT2_BUTTON)
    }
    else if (detectObject(DEPLOYUNIT3_BUTTON)) {
      clickObject(DEPLOYUNIT3_BUTTON)
    }
    else if (detectObject(DEPLOYUNIT4_BUTTON)) {
      clickObject(DEPLOYUNIT4_BUTTON)
    }
    else if (detectObject(BACKQUEST_BUTTON)) 
    {
      clickObject(BACKQUEST_BUTTON)
      return 0
    }
  }

  ; Locate a tile to place the unit
  if (findCoordinate())
  {
    while (detectObject(CONFIRMUNITPLACEMENT_BUTTON)) {
      clickObject(CONFIRMUNITPLACEMENT_BUTTON)
    }
    return 1
  }
  else 
  {
    clickObject(CANCELPLACEMENT_BUTTON)
    waitObject(BACKQUEST_BUTTON)
    clickObject(BACKQUEST_BUTTON)
    return 0
  }
}

;findCoordinate() - Performs a tile-by-tile placement on the map until a valid 
;                   position is found. A valid position is determined by whether
;                   the confirm placement button is visible.
;@return int - If a valid position is found, return 1. Otherwise, return 0
findCoordinate()
{
	global BLUESTACK_WINDOW_TITLE, LEVELBOT, SCAN_START_X
  global SCAN_START_Y, SCAN_TILE_HEIGHT, SCAN_TILE_WIDTH, CONFIRMUNITPLACEMENT_BUTTON

	;declare our static variables
	static currRow:= 0
	static currCol:= 0
  static currPass := 0
  static mapMaxRow := 0
  static mapMaxCol := 0
  static maxPasses := 2
  static tileHeight := 0
  static tileWidth := 0

  if (mapMaxRow == 0 && mapMaxCol == 0) {
    if (LEVELBOT == 1) 
    {
      mapMaxRow := 16 // 2 ; There are 16 tiles, but since we've doubled the 
                           ; size of the tile's dimensions, we halve the 
                           ; total number of tiles to scan
      mapMaxCol := mapMaxRow
      tileWidth := SCAN_TILE_WIDTH * 2
      tileHeight := SCAN_TILE_HEIGHT * 2
    }
    else
    {
      mapMaxRow := 16 ; I counted the tiles on the map, and there are 16 tiles
      mapMaxCol := mapMaxRow
      tileWidth := SCAN_TILE_WIDTH
      tileHeight := SCAN_TILE_HEIGHT
    }
  }
  
  while (currPass < maxPasses) {
    if (winExist(BLUESTACK_WINDOW_TITLE)) {
      WinActivate, %BLUESTACK_WINDOW_TITLE%
    }

    while (currRow < mapMaxRow) {
      if (currRow == 0 && currCol == 0) {
        currCol++
        continue
      }

      ; Compute the y-coordinate
      currYCoord := SCAN_START_Y + (tileHeight * currRow) 
      while (currCol < mapMaxCol) {

        ; Compute the x-coordinate
        currXCoord := SCAN_START_X + (tileWidth * currCol)

        SB_SetText("Click at (x" . currYCoord . ",y" . currXCoord . ")")
        clickAt(currXCoord, currYCoord)
        if (detectObject(CONFIRMUNITPLACEMENT_BUTTON)) 
        {
          if (!LEVELBOT) {
            currCol += 2
          } 
          else {
            currCol++
          }
          currPass := 0
          return 1
        }
        else 
        {
          currCol++
        }
      }
      currRow++
      currCol := 0
    }
    currPass++
    currRow := 0
  }
  currPass := 0
  
  return 0
}

;scroll() - Performs a drag operation starting at the init coordinates
;           and stopping at the end coordinates specified as arguments
;@param int - The x-coordinate where the drag operation will start
;@param int - The y-coordinate where the drag operation will start
;@param int - The x-coordinate where the drag opeartion will end
;@param int - The y-coordinate where the drag operation will end
;@return string - Returns a blank value (empty string) to its caller
scroll(xInit, yInit, xEnd, yEnd)
{
  global SLEEPTIME
  MouseMove, %xInit%, %yInit% 

  SetDefaultMouseSpeed, 100
  SendEvent { Click, %xInit%, %yInit%, down }{ Click, %xEnd%, %yEnd%, up}
  SetDefaultMouseSpeed, 0

	Sleep SLEEPTIME
}

;toggleAttackType - Performs several left-mouse clicks to sort the unit list
;                   by attack type. The target type is specified as an integer
;@param int - An integer between 0 and 3 (inclusive)
;@return string - Returns a blank value (empty string) to its caller
toggleAttackType(attackType := 0)
{
  global SORTBYDEFAULT_BUTTON 
  global SORTBYGROUNDATK_BUTTON, SORTBYAIRATK_BUTTON, SORTBYSEAATK_BUTTON

  checkInvariant := detectObject(SORTBYDEFAULT_BUTTON) || detectObject(SORTBYGROUNDATK_BUTTON) || detectObject(SORTBYAIRATK_BUTTON) || detectObject(SORTBYSEAATK_BUTTON)
  if (checkInvariant == 1)
  {
    if (attackType == 0)
    {
      ;SORT BY DEFAULT
      while (!detectObject(SORTBYDEFAULT_BUTTON))
      {
        if (detectObject(SORTBYSEAATK_BUTTON)) {
          clickObject(SORTBYSEAATK_BUTTON)
        }
        else if (detectObject(SORTBYGROUNDATK_BUTTON)) {
          clickObject(SORTBYGROUNDATK_BUTTON)
        }
        else if (detectObject(SORTBYAIRATK_BUTTON)) {
          clickObject(SORTBYAIRATK_BUTTON)
        }
      }
    }
    else if (attackType == 1)
    {
      ;SORT BY GROUND ATK
      while (!detectObject(SORTBYGROUNDATK_BUTTON))
      {
        if (detectObject(SORTBYDEFAULT_BUTTON)) {
          clickObject(SORTBYDEFAULT_BUTTON)
        }
        else if (detectObject(SORTBYAIRATK_BUTTON)) {
          clickObject(SORTBYAIRATK_BUTTON)
        }
        else if (detectObject(SORTBYSEAATK_BUTTON)) {
          clickObject(SORTBYSEAATK_BUTTON)
        }
      }
    }
    else if (attackType == 2)
    {
      ;SORT BY AIR ATK
      while (!detectObject(SORTBYAIRATK_BUTTON))
      {
        if (detectObject(SORTBYGROUNDATK_BUTTON)) {
          clickObject(SORTBYGROUNDATK_BUTTON)
        }
        else if (detectObject(SORTBYSEAATK_BUTTON)) {
          clickObject(SORTBYSEAATK_BUTTON)
        }
        else if (detectObject(SORTBYDEFAULT_BUTTON)) {
          clickObject(SORTBYDEFAULT_BUTTON)
        }
      }
    }
    else if (attackType == 3)
    {
      ;SORT BY SEA ATK
      while (!detectObject(SORTBYSEAATK_BUTTON))
      {
        if (detectObject(SORTBYAIRATK_BUTTON)) {
          clickObject(SORTBYAIRATK_BUTTON)
        }
        else if (detectObject(SORTBYDEFAULT_BUTTON)) {
          clickObject(SORTBYDEFAULT_BUTTON)
        }
        else if (detectObject(SORTBYGROUNDATK_BUTTON)) {
          clickObject(SORTBYGROUNDATK_BUTTON)
        }
      }
    }
  }
}

;toggleAttribType - Performs several left-mouse clicks to filter a unit list by
;                   attribute type. The target type is specified as an integer
;@param int - An integer between 0 and 3 (inclusive)
;@return string - Returns a blank value (empty string) to its caller
toggleAttribType(attribType := 0)
{
  global UNITALL_BUTTON, UNITMELEE_BUTTON, UNITMISSILE_BUTTON, UNITMAGIC_BUTTON

  checkInvariant := detectObject(UNITALL_BUTTON) || detectObject(UNITMELEE_BUTTON) || detectObject(UNITMISSILE_BUTTON) || detectObject(UNITMAGIC_BUTTON)
  if (checkInvariant == 1)
  {
    if (attribType == 0)
    {
      while (!detectObject(UNITAll_BUTTON))
      {
        if (detectObject(UNITMAGIC_BUTTON)) {
          clickObject(UNITMAGIC_BUTTON)
        }
        else if ((detectObject(UNITMELEE_BUTTON))) {
          clickObject(UNITMELEE_BUTTON)
        }
        else if (detectObject(UNITMISSILE_BUTTON)) {
          clickObject(UNITMISSILE_BUTTON)
        }
      }
    }
    else if (attribType == 1)
    {
      while (!detectObject(UNITMELEE_BUTTON))
      {
        if (detectObject(UNITALL_BUTTON)) {
          clickObject(UNITALL_BUTTON)
        }
        else if (detectObject(UNITMISSILE_BUTTON)) {
          clickObject(UNITMISSILE_BUTTON)
        }
        else if (detectObject(UNITMAGIC_BUTTON)) {
          clickObject(UNITMAGIC_BUTTON)
        }
      }
    }
    else if (attribType == 2)
    {
      while (!detectObject(UNITMISSILE_BUTTON))
      {
        if (detectObject(UNITMELEE_BUTTON)) {
          clickObject(UNITMELEE_BUTTON)
        }
        else if (detectObject(UNITMAGIC_BUTTON)) {
          clickObject(UNITMAGIC_BUTTON)
        }
        else if (detectObject(UNITALL_BUTTON)) {
          clickObject(UNITALL_BUTTON)
        }
      }
    }
    else if (attribType == 3)
    {
      while (!detectObject(UNITMAGIC_BUTTON))
      {
        if (detectObject(UNITMISSILE_BUTTON)) {
          clickObject(UNITMISSILE_BUTTON)
        }
        else if (detectObject(UNITALL_BUTTON)) {
          clickObject(UNITALL_BUTTON)
        }
        else if (detectObject(UNITMELEE_BUTTON)) {
          clickObject(UNITMELEE_BUTTON)
        }
      }
    }
  }
}

;SelectEpisode(CURRENTEPISODE, EPISODE)
;{
;	SetDefaultMouseSpeed, 100
;	i := CURRENTEPISODE - (EPISODE + 5)
;	loop, %i%
;	{
;		SendEvent {Click, 816, 600, down}{Click, 816, 715, up}
;		Sleep 500
;	}
;	
;	if (i = -5)		;current quest
;	{
;		Click 956, 755 down
;		Sleep 500
;		Click up
;	}
;	else if (i = -4)	;1 episode before current quest
;	{
;		Click 956, 629 down
;		Sleep 500
;		Click up
;	}
;	else if (i= -3) 	;2 episodes before current quest
;	{
;		Click 956, 514 down
;		Sleep 500
;		Click up
;	}
;	else if (i= -2)	;3 episodes before current quest
;	{
;		Click 956, 399 down
;		Sleep 500
;		Click up
;	}
;	else if (i= -1)	;4 episodes before current quest
;	{
;		Click 956, 284 down
;		Sleep 500
;		Click up
;	}
;	else			;whichever episode is at the top of the screen
;	{
;		Click 956, 169 down
;		Sleep 500
;		Click up
;	}
;	SetDefaultMouseSpeed, 50
;}
