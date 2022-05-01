; =============================================================================
; GlobalConstants.ahk
;
; - This script is responsible for initializing the variables used by other
;   scripts within this system.
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

SetWinDelay, 0


; initGlobals - Discovers the window's width and height dimensions and initialize
;               values appropriately.
; @return string - Returns a blank value (empty string) to its caller
initGlobals()
{
	; Declare that call variables in this function are global variables
	global

	; Discover the window title
  BLUESTACK_WINDOW_TITLE := ""
	if (winExist("BlueStacks App Player"))
	{
		BLUESTACK_WINDOW_TITLE := "BlueStacks App Player"
		WinActivate, %BLUESTACK_WINDOW_TITLE%
		WinWaitActive, %BLUESTACK_WINDOW_TITLE%, , 2
	}
	else if (winExist("Bluestacks App Player"))
	{
		BLUESTACK_WINDOW_TITLE := "Bluestacks App Player"
		WinActivate, %BLUESTACK_WINDOW_TITLE%
		WinWaitActive, %BLUESTACK_WINDOW_TITLE%, , 2
	}
	else
	{
    msg := "Check to see if your Bluestack's title is one of the following: `n"
            . " BlueStacks App Player`n"
            . " Bluestacks App Player"
		MsgBox,, "Error", msg
    ExitApp
	}

	; Obtain the window size in terms of width and height.
	; We use the width and height to set the bot's parameters such as
	; initial scan coordinates, the location to idly click, and image paths.
	WinGetPos,,,width, height, %BLUESTACK_WINDOW_TITLE%
	if (width == 0 || height == 0)
	{
		MsgBox,, "Error", "Invalid window size"
    ExitApp
	}
	else 
  {
    X2 := width
	  Y2 := height
  }


	if (width == 632 && height == 1030)
	{
		; The two coordinates tells the bot where it should idly click
		WAIT_X := 325
		WAIT_Y := 380

		; The first two parameters are coordinates taht tell the bot where 
		; the first bingo tile is located. 
		; The third parameter tells the bot the dimension (in pixels) of 
		; the square bingo tile.
		BINGO_START_X := 110
		BINGO_START_Y := 235
		BINGO_TILE_SIZE := 100

		; These four parameters are start and end coordinates used in the
		; quest procedure to control the amount of scrolling the bot should
		; perform (specified in pixels).
		QUEST_X1 := 293
		QUEST_Y1 := 840
		QUEST_X2 := 293
		QUEST_Y2 := 130

		MENU_X1 := 500
		MENU_Y1 := 975
		MENU_X2 := 50
		MENU_Y2 := 975
		
		; The first two parameters are coordinates used in the quest procedure's
		; findCoordinate functions and tells the bot where it should begin its
		; scan for a valid unit placement.
		; The third parameter tells the bot how large a unit tile roughly is.
		SCAN_START_X := 95
		SCAN_START_Y := 72
    SCAN_TILE_HEIGHT := 36
    SCAN_TILE_WIDTH := 36
	}
	else if (width == 677 && height == 1102)
	{
		WAIT_X := 100
		WAIT_Y := 420

		BINGO_START_X := 110
		BINGO_START_Y := 265
		BINGO_TILE_SIZE := 110

		QUEST_X1 := 293
		QUEST_Y1 := 840
		QUEST_X2 := 293
		QUEST_Y2 := 130

		MENU_X1 := 520
		MENU_Y1 := 975
		MENU_X2 := 30
		MENU_Y2 := 975
		
		SCAN_START_X := 102
		SCAN_START_Y := 68
    SCAN_TILE_HEIGHT := 40
		SCAN_TILE_WIDTH := 39
        
    CARDMENU_X := 100
		CARDMENU_Y := 800
	}
	else if (width == 1282 && height == 749)
	{
		WAIT_X := 490
		WAIT_Y := 300

		BINGO_START_X := 491
		BINGO_START_Y := 233
		BINGO_TILE_SIZE := 70

		QUEST_X1 := 500
		QUEST_Y1 := 238
		QUEST_X2 := 500
		QUEST_Y2 := 163

		MENU_X1 := 760
		MENU_Y1 := 710
		MENU_X2 := 700
		MENU_Y2 := 710
		
		SCAN_START_X := 465
		SCAN_START_Y := 99
		SCAN_TILE_SIZE := 51
	}
	else if (width == 1920 && height == 1080)
	{
		WAIT_X := 735
		WAIT_Y := 425

		BINGO_START_X := 745
		BINGO_START_Y := 330
		BINGO_TILE_SIZE := 100

		QUEST_X1 := 840
		QUEST_Y1 := 870
		QUEST_X2 := 840
		QUEST_Y2 := 190

		SCAN_START_X := 702
		SCAN_START_Y := 132
		SCAN_TILE_SIZE := 75
	}
	else
	{
		WAIT_X := 325
		WAIT_Y := 450

		BINGO_START_X := 491
		BINGO_START_Y := 233
		BINGO_TILE_SIZE := 70

		QUEST_X1 := 293
		QUEST_Y1 := 840
		QUEST_X2 := 293
		QUEST_Y2 := 130

		SCAN_START_X := 167
		SCAN_START_Y := 68
		SCAN_TILE_SIZE := 78
	}
  
	FANTASICAAPP_BUTTON := "FANTASICA IMAGES\Bluestack\appfantasica-" . width . "_" . height . ".png"
	POPUPCLOSE_BUTTON := "FANTASICA IMAGES\MainPage\buttonpopupclose-"  . width . "_" . height . ".png"
	
	QUEST1_ICON := "FANTASICA IMAGES\MainPage\iconquest1-" . width . "_" . height . ".png" ;Quest icon on home page	
	QUEST2_ICON := "FANTASICA IMAGES\MainPage\iconquest2-" . width . "_" . height . ".png" ;Quest icon on home page
	QUEST3_ICON := "FANTASICA IMAGES\MainPage\iconquest3-" . width . "_" . height . ".png" ;Quest icon on home page
	QUEST4_ICON := "FANTASICA IMAGES\MainPage\iconquest4-" . width . "_" . height . ".png" ;Quest icon on home page
	QUEST5_ICON := "FANTASICA IMAGES\MainPage\iconquest5-" . width . "_" . height . ".png" ;Quest icon on home page
	QUESTTIMER_TEXT := "FANTASICA IMAGES\MainPage\textquesttimer-" . width . "_" . height . ".png"
	
  BATTLE_ICON := "FANTASICA IMAGES\MainPage\battle-" . width . "_" . height . ".png"
  BATTLE_SELECT_TITLE := "FANTASICA IMAGES\Battle\SelectOpponent\title-" . width . "_" . height . ".png"
  BATTLE_SELECT := "FANTASICA IMAGES\Battle\SelectOpponent\select-" . width . "_" . height . ".png"
  BATTLE_TITLE := "FANTASICA IMAGES\Battle\Battle\title-" . width . "_" . height . ".png"
  BATTLE_BUTTON := "FANTASICA IMAGES\Battle\Battle\battle-" . width . "_" . height . ".png"
  BATTLE_RESULTS_TITLE := "FANTASICA IMAGES\Battle\Results\title-" . width . "_" . height . ".png"
  BATTLE_MYPAGE := "FANTASICA IMAGES\Battle\Results\mypage-" . width . "_" . height . ".png"
  BATTLE_TIMER := "FANTASICA IMAGES\Battle\timer-" . width . "_" . height . ".png"
    
	EPISODESELECT1_BUTTON := "FANTASICA IMAGES\Quest\EpisodeSelection\buttonselectepisode1-" . width . "_" . height . ".png"
	EPISODESELECT2_BUTTON := "FANTASICA IMAGES\Quest\EpisodeSelection\buttonselectepisode2-" . width . "_" . height . ".png"
	EPISODESELECT3_BUTTON := "FANTASICA IMAGES\Quest\EpisodeSelection\buttonselectepisode3-" . width . "_" . height . ".png"
	EPISODESELECT4_BUTTON := "FANTASICA IMAGES\Quest\EpisodeSelection\buttonselectepisode4-" . width . "_" . height . ".png"
	EPISODESELECT5_BUTTON := "FANTASICA IMAGES\Quest\EpisodeSelection\buttonselectepisode5-" . width . "_" . height . ".png"
	EPISODESELECT6_BUTTON := "FANTASICA IMAGES\Quest\EpisodeSelection\buttonselectepisode6-" . width . "_" . height . ".png"
	EPISODESELECT7_BUTTON := "FANTASICA IMAGES\Quest\EpisodeSelection\buttonselectepisode7-" . width . "_" . height . ".png"
	EPISODESELECT8_BUTTON := "FANTASICA IMAGES\Quest\EpisodeSelection\buttonselectepisode8-" . width . "_" . height . ".png"
	EPISODESELECT9_BUTTON := "FANTASICA IMAGES\Quest\EpisodeSelection\buttonselectepisode9-" . width . "_" . height . ".png"
	EPISODESELECT10_BUTTON := "FANTASICA IMAGES\Quest\EpisodeSelection\buttonselectepisode10-" . width . "_" . height . ".png"
	
	EPISODELISTNEXT_BUTTON := "FANTASICA IMAGES\Quest\EpisodeSelection\buttonnextpage-" . width . "_" . height . ".png"
	EPISODELISTNONEXT_BUTTON := "FANTASICA IMAGES\Quest\EpisodeSelection\buttonnonextpage-" . width . "_" . height . ".png"
	
	QUEST_TEXT := "FANTASICA IMAGES\Quest\QuestSelection\textquest-" . width . "_" . height . ".png"
	SELECTEPISODE_BUTTON := "FANTASICA IMAGES\Quest\QuestSelection\buttonselectepisode-" . width . "_" . height . ".png" ;The 'Select Episode' button for quest
  QUEST1 := "FANTASICA IMAGES\Quest\QuestSelection\quest1-" . width . "_" . height . ".png"
  QUEST2 := "FANTASICA IMAGES\Quest\QuestSelection\quest2-" . width . "_" . height . ".png"
  QUEST3 := "FANTASICA IMAGES\Quest\QuestSelection\quest3-" . width . "_" . height . ".png"
  QUEST4 := "FANTASICA IMAGES\Quest\QuestSelection\quest4-" . width . "_" . height . ".png"
  QUEST5 := "FANTASICA IMAGES\Quest\QuestSelection\quest5-" . width . "_" . height . ".png"
  QUEST6 := "FANTASICA IMAGES\Quest\QuestSelection\quest6-" . width . "_" . height . ".png"
  QUEST7 := "FANTASICA IMAGES\Quest\QuestSelection\quest7-" . width . "_" . height . ".png"
  QUEST8 := "FANTASICA IMAGES\Quest\QuestSelection\quest8-" . width . "_" . height . ".png"
  QUEST9 := "FANTASICA IMAGES\Quest\QuestSelection\quest9-" . width . "_" . height . ".png"
  QUEST10 := "FANTASICA IMAGES\Quest\QuestSelection\quest10-" . width . "_" . height . ".png"
	STARTQUEST1_BUTTON := "FANTASICA IMAGES\Quest\QuestSelection\buttonstartquest1-" . width . "_" . height . ".png" ;quest #1
	STARTQUEST2_BUTTON := "FANTASICA IMAGES\Quest\QuestSelection\buttonstartquest2-" . width . "_" . height . ".png" ;quest #2
	STARTQUEST3_BUTTON := "FANTASICA IMAGES\Quest\QuestSelection\buttonstartquest3-" . width . "_" . height . ".png" ;quest #3
	STARTQUEST4_BUTTON := "FANTASICA IMAGES\Quest\QuestSelection\buttonstartquest4-" . width . "_" . height . ".png" ;quest #4
	STARTQUEST5_BUTTON := "FANTASICA IMAGES\Quest\QuestSelection\buttonstartquest5-" . width . "_" . height . ".png" ;quest #5
	STARTQUEST6_BUTTON := "FANTASICA IMAGES\Quest\QuestSelection\buttonstartquest6-" . width . "_" . height . ".png" ;quest #6
	STARTQUEST7_BUTTON := "FANTASICA IMAGES\Quest\QuestSelection\buttonstartquest7-" . width . "_" . height . ".png" ;quest #7
  STARTQUEST8_BUTTON := "FANTASICA IMAGES\Quest\QuestSelection\buttonstartquest8-" . width . "_" . height . ".png" ;quest #8
  STARTQUEST9_BUTTON := "FANTASICA IMAGES\Quest\QuestSelection\buttonstartquest9-" . width . "_" . height . ".png" ;quest #9
  STARTQUEST10_BUTTON := "FANTASICA IMAGES\Quest\QuestSelection\buttonstartquest10-" . width . "_" . height . ".png" ;quest #10
	
	STARTTRAINING1_BUTTON := "FANTASICA IMAGES\Training\TrainingSelection\buttonstarttraining1-" . width . "_" . height . ".png"
	STARTTRAINING2_BUTTON := "FANTASICA IMAGES\Training\TrainingSelection\buttonstarttraining2-" . width . "_" . height . ".png" 
	STARTTRAINING3_BUTTON := "FANTASICA IMAGES\Training\TrainingSelection\buttonstarttraining3-" . width . "_" . height . ".png"
	STARTTRAINING4_BUTTON := "FANTASICA IMAGES\Training\TrainingSelection\buttonstarttraining4-" . width . "_" . height . ".png" 
	STARTTRAINING5_BUTTON := "FANTASICA IMAGES\Training\TrainingSelection\buttonstarttraining5-" . width . "_" . height . ".png"
	TRAININGCHALLENGE_BUTTON := "FANTASICA IMAGES\Training\TrainingSelection\buttonstarttrainingboss-" . width . "_" . height . ".png"
	TRAINING_TEXT := "FANTASICA IMAGES\Training\TrainingSelection\texttraining-" . width . "_" . height . ".png"
	ADVANCE_BUTTON := "FANTASICA IMAGES\Training\ActualTraining\buttonadvance-" . width . "_" . height . ".png" 
	SENDBRAVE_BUTTON := "FANTASICA IMAGES\Training\ActualTraining\buttonsendbrave-" . width . "_" . height . ".png"
	HEAL_BUTTON := "FANTASICA IMAGES\Training\ActualTraining\buttonheal-" . width . "_" . height . ".png"
	HEALMID_BUTTON := "FANTASICA IMAGES\Training\ActualTraining\buttonhealmid-" . width . "_" . height . ".png"
	HEALDARK_BUTTON := "FANTASICA IMAGES\Training\ActualTraining\buttonhealdark-" . width . "_" . height . ".png" 
  HEALMOBACOIN_BUTTON := "FANTASICA IMAGES\Training\ActualTraining\buttonhealmobacoin-" . width . "_" . height . ".png"
  HEALMOBACOINMID_BUTTON := "FANTASICA IMAGES\Training\ActualTraining\buttonhealmobacoinmid-" . width . "_" . height . ".png"
  HEALMOBACOINDARK_BUTTON := "FANTASICA IMAGES\Training\ActualTraining\buttonhealmobacoindark-" . width . "_" . height . ".png"
	USEPOTIONYES_BUTTON := "FANTASICA IMAGES\Training\ActualTraining\buttonpotionyes-" . width . "_" . height . ".png" 
	OUTOFTP_TEXT := "FANTASICA IMAGES\Training\ActualTraining\texttrainingpoints-" . width . "_" . height . ".png"
	CONTINUETRAINING_BUTTON := "FANTASICA IMAGES\Training\ActualTraining\buttoncontinuetraining-" . width . "_" . height . ".png"
	TRAININGMYPAGE_BUTTON := "FANTASICA IMAGES\Training\ActualTraining\buttonmypage-" . width . "_" . height . ".png"
	TRAININGFIGHT_BUTTON := "FANTASICA IMAGES\Training\ActualTraining\buttonfight-" . width . "_" . height . ".png"
	TRAININGSUMMONALLY_BUTTON := "FANTASICA IMAGES\Training\ActualTraining\buttonsummonally-" . width . "_" . height . ".png"
	TRAININGPROGRESSCOMPLETE_TEXT := "FANTASICA IMAGES\Training\ActualTraining\textprogresscomplete-" . width . "_" . height . ".png"
    
	CALLALLY_BUTTON := "FANTASICA IMAGES\Quest\QuestBattle\buttoncallally-" . width . "_" . height . ".png" ;the call ally button in questing
	CANCELPLACEMENT_BUTTON := "FANTASICA IMAGES\Quest\QuestBattle\buttoncancelplacement-" . width . "_" . height . ".png" ; the cancel placement button
	CONFIRMUNITPLACEMENT_BUTTON := "FANTASICA IMAGES\Quest\QuestBattle\buttonconfirmunitplacement-" . width . "_" . height . ".png" ;confirm the location to place unit
	DEPLOYUNIT_BUTTON := "FANTASICA IMAGES\Quest\QuestBattle\buttondeployunit-" . width . "_" . height . ".png"	;The 'Deploy' button during questing
	SKIPQUEST_BUTTON := "FANTASICA IMAGES\Quest\QuestBattle\buttonskip-" . width . "_" . height . ".png"
	
	DEPLOY_TEXT := "FANTASICA IMAGES\Quest\QuestBattle\Unit\textdeploy-" . width . "_" . height . ".png"
	DEPLOYUNIT1_BUTTON := "FANTASICA IMAGES\Quest\QuestBattle\Unit\buttondeployunit1-" . width . "_" . height . ".png" ;first unit in the 'Deploy List'
	DEPLOYUNIT2_BUTTON := "FANTASICA IMAGES\Quest\QuestBattle\Unit\buttondeployunit2-" . width . "_" . height . ".png" ;second unit in the 'Deploy List'
	DEPLOYUNIT3_BUTTON := "FANTASICA IMAGES\Quest\QuestBattle\Unit\buttondeployunit3-" . width . "_" . height . ".png" ;third unit in the 'Deploy List'
	DEPLOYUNIT4_BUTTON := "FANTASICA IMAGES\Quest\QuestBattle\Unit\buttondeployunit4-" . width . "_" . height . ".png" ;fourth unit in the 'Deploy List'
	UNITFAVORITEON_BUTTON := "FANTASICA IMAGES\Quest\QuestBattle\Unit\buttonunitfavoriteon-" . width . "_" . height . ".png" ;favorite on
	UNITFAVORITEOFF_BUTTON := "FANTASICA IMAGES\Quest\QuestBattle\Unit\buttonunitfavoriteoff-" . width . "_" . height . ".png" ;favorite on
	UNIT1_INVISIBLEBUTTON := "FANTASICA IMAGES\Quest\QuestBattle\Unit\invisiblebuttonunit1-" . width . "_" . height . ".png" ;first unit when unable to deploy (due to insufficient unit cost)
	UNIT2_INVISIBLEBUTTON := "FANTASICA IMAGES\Quest\QuestBattle\Unit\invisiblebuttonunit2-" . width . "_" . height . ".png" ;second unit when unable to deploy (due to insufficient unit cost)
	UNIT3_INVISIBLEBUTTON := "FANTASICA IMAGES\Quest\QuestBattle\Unit\invisiblebuttonunit3-" . width . "_" . height . ".png" ;third unit when unable to deploy (due to insufficient unit cost)
	UNIT4_INVISIBLEBUTTON := "FANTASICA IMAGES\Quest\QuestBattle\Unit\invisiblebuttonunit4-" . width . "_" . height . ".png" ;fourth unit when unable to deploy (due to insufficient unit cost)
	
	DEPLOYALLY1_BUTTON := "FANTASICA IMAGES\Quest\QuestBattle\Ally\buttondeployally1-" . width . "_" . height . ".png"    ;ally1 top of the list
	DEPLOYALLY2_BUTTON := "FANTASICA IMAGES\Quest\QuestBattle\Ally\buttondeployally2-" . width . "_" . height . ".png" ;ally2 second on the list
	DEPLOYALLY3_BUTTON := "FANTASICA IMAGES\Quest\QuestBattle\Ally\buttondeployally3-" . width . "_" . height . ".png" ;ally3 third on the list
	NEXTPAGE_BUTTON := "FANTASICA IMAGES\Quest\QuestBattle\Ally\buttonnextpage(allylist)-" . width . "_" . height . ".png" ;the 'next page' button on the ally selection
	NONEXTPAGE_BUTTON := "FANTASICA IMAGES\Quest\QuestBattle\Ally\buttonnonextpage(allylist)-" . width . "_" . height . ".png" ;the 'no next page' button on the ally selection
	
	CALLALLYPAGE_TEXT := "FANTASICA IMAGES\Quest\QuestBattle\Ally\textcallallypage-" . width . "_" . height . ".png" ;the page titled 'Call Ally'
	
	BACKQUEST_BUTTON := "FANTASICA IMAGES\Quest\QuestBattle\BothUnitAlly\buttonbackallyselection-" . width . "_" . height . ".png" ;the back button found in quest's unit selection
	SORTBYDEFAULT_BUTTON := "FANTASICA IMAGES\Quest\QuestBattle\BothUnitAlly\buttonsortbydefault-" . width . "_" . height . ".png" ;no specific sort
	SORTBYGROUNDATK_BUTTON := "FANTASICA IMAGES\Quest\QuestBattle\BothUnitAlly\buttonsortbygroundatk-" . width . "_" . height . ".png" ;Sort unit by strongest land to weakest
	SORTBYAIRATK_BUTTON := "FANTASICA IMAGES\Quest\QuestBattle\BothUnitAlly\buttonsortbyairatk-" . width . "_" . height . ".png" ;sort unit by strongest air to weakest
	SORTBYSEAATK_BUTTON := "FANTASICA IMAGES\Quest\QuestBattle\BothUnitAlly\buttonsortbyseaatk-" . width . "_" . height . ".png" ;sort unit by strongest sea to weakest
	UNITALL_BUTTON := "FANTASICA IMAGES\Quest\QuestBattle\BothUnitAlly\buttonunitall-" . width . "_" . height . ".png" ;type all
	UNITMELEE_BUTTON := "FANTASICA IMAGES\Quest\QuestBattle\BothUnitally\buttonunitmelee-" . width . "_" . height . ".png" ; type melee
	UNITMISSILE_BUTTON := "FANTASICA IMAGES\Quest\QuestBattle\BothUnitally\buttonunitmissile-" . width . "_" . height . ".png" ;type missile
	UNITMAGIC_BUTTON := "FANTASICA IMAGES\Quest\QuestBattle\BothUnitally\buttonunitmagic-" . width . "_" . height . ".png" ;type magic
	
	BACKTOEVENT_BUTTON := "FANTASICA IMAGES\Quest\QuestResult\buttonbacktoevent(completed)-" . width . "_" . height . ".png" ; The 'Back to Event' button after defeating a event boss encountered during training
	CHOOSEQUESTCOMPLETED_BUTTON := "FANTASICA IMAGES\Quest\QuestResult\buttonchoosequest(completed)-" . width . "_" . height . ".png" ;The 'Choose Quest' button on the results page after completing a quest
	MYPAGE_BUTTON := "FANTASICA IMAGES\Quest\QuestResult\buttonmypage-" . width . "_" . height . ".png" ;The 'My Page' button on the results page after questing
	TOWERCOMPLETEREWARDCARDBACK_BUTTON := "FANTASICA IMAGES\Quest\QuestResult\buttonbacktowercompleterewardcard-" . width . "_" . height . ".png" ;The back button on reward card received upon completion of the tower
	QUESTCLEAR_TEXT := "FANTASICA IMAGES\Quest\QuestResult\textquestclear-" . width . "_" . height . ".png"
	QUESTRESULT_TEXT := "FANTASICA IMAGES\Quest\QuestResult\textquestresult-" . width . "_" . height . ".png"
	
	CONNECTIONERROR_BUTTON := "FANTASICA IMAGES\ErrorRelated\buttonconnectionerror-" . width . "_" . height . ".png" ;The 'Yes' button when a connection error has occured.	
	FORCECLOSEAPP_BUTTON := "FANTASICA IMAGES\ErrorRelated\buttonforcecloseapp-" . width . "_" . height . ".png" ;force closes the app
	CONNECTIONERROR_TEXT := "FANTASICA IMAGES\ErrorRelated\textconnectionerror-" . width . "_" . height . ".png" ;the dialog which indicates we need to restart the app
	FANTASICALOADPAGE_TEXT := "FANTASICA IMAGES\ErrorRelated\textfantasicaloadpage-" . width . "_" . height . ".png" ;the background image while fantasica is launching/loading
	
	MAINTENANCEYES_BUTTON := "FANTASICA IMAGES\Maintenance\buttonmaintenanceyes-" . width . "_" . height . ".png"
	MAINTENANCEOPTION_BUTTON := "FANTASICA IMAGES\Maintenance\buttonoption.png"
	MAINTENANCE_TEXT := "FANTASICA IMAGES\Maintenance\textmaintenance-" . width . "_" . height . ".png"
	
	CONFIRMEXITAPP_BUTTON := "FANTASICA IMAGES\Bluestack\buttonconfirmexitapp-" . width . "_" . height . ".png" ;The 'yes' button when exiting the bluestack app
	
	DECLINEADVERTISEMENT_BUTTON := "FANTASICA IMAGES\StartScreen\buttondeclineadvertisement-" . width . "_" . height . ".png" ;the 'No Thanks' button when an advertisement pops up
	STARTGAME_BUTTON := "FANTASICA IMAGES\StartScreen\buttonstartgame-" . width . "_" . height . ".png" ;start game button 
	RESUMEQUESTNO_BUTTON := "FANTASICA IMAGES\StartScreen\buttonresumequestno-" . width . "_" . height . ".png" ;do not resume an interrupted quest
	
	DECLINEADVERTISEMENTMYPAGE_BUTTON := "FANTASICA IMAGES\Advertisement\buttondeclineadvertisement(mypage)-" . width . "_" . height . ".png" ;advertisement on mypage	
	MAYBELATERADVERTISEMENT_BUTTON := "FANTASICA IMAGES\Advertisement\buttonmaybelateradvertisement-" . width . "_" . height . ".png" ;the 'maybe' button for the advertisement for other apps at the start screen
	CANCELADVERTISEMENT_BUTTON := "FANTASICA IMAGES\Advertisement\buttoncanceladvertisement-" . width . "_" . height . ".png" ;cancel button for advertisement of other apps at the start screen
	CLOSEADVERTISEMENT_BUTTON := "FANTASICA IMAGES\Advertisement\buttoncloseadvertisement-" . width . "_" . height . ".png" ;closes the advertisement by clicking the 'x' button
	
	ANNOUNCEMENT_BUTTON := "FANTASICA IMAGES\Maintenance\buttonannouncement-" . width . "_" . height . ".png"
	
	ALLY_TEXT := "FANTASICA IMAGES\Ally\AllyList\textallies-" . width . "_" . height . ".png" ;the title of the ally list page
	ALLYPENDINGREQUEST_TEXT := "FANTASICA IMAGES\Ally\AllyPendingRequest\textallywaitingapproval-" . width . "_" . height . ".png" ; the text title of the ally requests pending page
	
	MYPAGEID_TEXT := "FANTASICA IMAGES\MainPage\textmypageid-" . width . "_" . height . ".png" ;The text called "id" at the very top of the fantasica homepage
	MYPAGEID2_TEXT := "FANTASICA IMAGES\MainPage\textmypageidarena-" . width . "_" . height . ".png" ;The text called "id" at the very topof the fantasica homepage, but offset due to arena info
	
	FULLTRAININGPOINTS_TEXT := "FANTASICA IMAGES\MainPage\textmaxtrainingpoints-" . width . "_" . height . ".png"
	DEPLETEDTRAININGPOINTS_TEXT := "FANTASICA IMAGES\MainPage\texttrainingpoints-" . width . "_" . height . ".png"
	TRAINING1_ICON := "FANTASICA IMAGES\MainPage\icontraining1-" . width . "_" . height . ".png" ;Training icon on homepage at index 1 (starting with index 0)
	TRAINING2_ICON := "FANTASICA IMAGES\MainPage\icontraining2-" . width . "_" . height . ".png" ;Training icon on homepage at index 2 (starting with index 0)
	TRAINING3_ICON := "FANTASICA IMAGES\MainPage\icontraining3-" . width . "_" . height . ".png" ;Training icon on homepage at index 3 (starting with index 0)	
	TRAINING4_ICON := "FANTASICA IMAGES\MainPage\icontraining4-" . width . "_" . height . ".png" ;Training icon on homepage at index 4 (starting with index 0)	
  TRAINING5_ICON := "FANTASICA IMAGES\MainPage\icontraining5-" . width . "_" . height . ".png" ;Training icon on homepage at index 5 (starting with index 0)	
	LOGINBINGOPANEL_ICON := "FANTASICA IMAGES\MainPage\Bingo\iconbingopanel-" . width . "_" . height . ".png" ;login bingo panel
	LOGINBINGOMYPAGE_BUTTON := "FANTASICA IMAGES\MainPage\Bingo\buttonbingomypage-" . width . "_" . height . ".png" ;button to return to mypage from login bingo
	LOGINBINGORECEIVE_BUTTON := "FANTASICA IMAGES\MainPage\Bingo\buttonbingoreceive-" . width . "_" . height . ".png" ; receive button when you click a panel in the daily login bingo
	LOGINBINGO_TEXT := "FANTASICA IMAGES\MainPage\Bingo\textbingo-" . width . "_" . height . ".png" ;"Login Bingo"
	
  INBOX1_ICON := "FANTASICA IMAGES\MainPage\iconinbox15-" . width . "_" . height . ".png"
  INBOX2_ICON := "FANTASICA IMAGES\MainPage\iconinbox16-" . width . "_" . height . ".png"
  INBOX_TITLE := "FANTASICA IMAGES\Inbox\texttitle-" . width . "_" . height . ".png"
  INBOX_ALL_BUTTON := "FANTASICA IMAGES\Inbox\buttonall-" . width . "_" . height . ".png"
  INBOX_ITEMS_BUTTON := "FANTASICA IMAGES\Inbox\buttonitems-" . width . "_" . height . ".png"
  INBOX_RECEIVE_BUTTON := "FANTASICA IMAGES\Inbox\buttonreceive-" . width . "_" . height . ".png"
    
  DAILY_BONUS := "FANTASICA IMAGES\MainPage\Bonus\dailybonus-" . width . "_" . height . ".png"
	LOGINBONUSMYPAGE_BUTTON := "FANTASICA IMAGES\MainPage\Bonus\buttonmypage-" . width . "_" . height . ".png"
	
	BACK_BUTTON := "FANTASICA IMAGES\_GeneralPupose\buttonback-" . width . "_" . height . ".png" ;The back button found in the bottom right corner of the app screen (not the corner of bluestack screen)
}
