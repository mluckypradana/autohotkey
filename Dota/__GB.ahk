;#IfWinactive, Dota 2

setmousedelay -1
setkeydelay -1
global active:=true
global needDefineAttack:=false
global attack:=true
global withDailyHero:=false
global heroX:=843
global heroY:=156
global maxTimeInLobby:=300000
global timeInLobby:=0
global maxTimePause:=600000
global timePause:=0
global probablyShuffle:=false

;Lobby
ys := [] ; initiate the array object
ys[1] := 728
ys[2] := 716
ys[3] := 701
ys[4] := 684
ys[5] := 668
ys[6] := 653
ys[7] := 637
ys[8] := 621
ys[9] := 604
ys[10] := 588
ys[11] := 574
startX = 373
endX = 801

;Flags
inLobby:=false
findMatchAllowed:=false

+1::
	withDailyHero:=!withDailyHero
	if(withDailyHero)
		SoundBeep 550, 100
	else
		SoundBeep 350, 100
Return

+2::
	findMatchAllowed:=!findMatchAllowed
	if(findMatchAllowed)
		SoundBeep 550, 100
	else
		SoundBeep 350, 100
Return

;Auto accept + Auto attack
^/::
	active:=true
	SoundBeep 350, 100

	if(isFullParty()||isInPreMatch()||isInMatch()){
		findMatchAllowed:=true
		Soundbeep 550, 100
	}
	else{
		findMatchAllowed:=false
		Soundbeep 350, 100
	}

	while(active){
		IfWinActive, Dota 2
		{
			Sleep 3000

			if(summaryDismissed()||partyDismissed()||dialogClosed()||matchAccepted()||backToHomeMenu())
				Continue

			if(isFindingMatch()&&!isFullParty())
				cancelFindMatch()

			if(isInPreMatch()){
				needDefineAttack:=true
				findMatchAllowed:=true
				if(captainsModeHeroSelected())
					Continue

				if(allHeroChallengeSuggested()){
					if(heroPicked())
						Continue
				}

				if(dailyQuestSuggested()){
					if(heroPicked())
						Continue
				}

				
				
				if(randomButtonIsActive())
					pickRandomHero()
					Continue
			}
			
			if(isInMatch()){
				findMatchAllowed:=true

				if(needDefineAttack){
					;defineAttack()	
					needDefineAttack:=false
				}

				if(matchPaused()){
					timePause:=timePause+3000
					if(timePause>=maxTimePause){
						timePause:=0
						Send {f9}
					}
					Continue
				}

				autoAttackHero()
				autoBuyItem()
				autoAddLevel()
				Continue
			}

			if(hasPartyInviteInLobby()){
				acceptParty()
				findMatchAllowed:=true
				Continue
			}

			if(findMatchAllowed){

				if(matchReconnected())
					Continue

				if(hasPartyInviteInLobby()){
					acceptParty()
					findMatchAllowed:=true
					Continue
				}

				if(isInLobby()&&!hasParty()){
					findMatchAllowed:=false
					Continue
				}

				if(!isInLobby() && playerIsInSecond() && !isFullParty()){
					findMatchAllowed:=false
					Continue
				}
				else if(!isInLobby() && !isFullParty()) {
					findMatchAllowed:=false
				}

				
				if(isInLobby()&&!isInLobbySlot()){
					findMatchAllowed:=false
					Continue
				}

				if(matchExited())
					Continue
			}
			else{
				if(hasPartyInviteInLobby()){
					;TODO Add lobby selection
					acceptParty()
					findMatchAllowed:=true
					Continue
				}

				if (isInLobby()) {
					getLobbySlot()
					Sleep 1500
					if(!isInLobbySlot() || isLobbyHost() || timeInLobby>=maxTimeInLobby){
						exitLobby()
						timeInLobby:=0
						if(findMatchAllowed)
							findMatchAllowed:=false
						Continue
					}
					timeInLobby:=timeInLobby+3000
				}
				else if(isInArcadeLobby()){
					exitLobby()
					timeInLobby:=0
					Continue
				}
				else{
					if(isBackToLobby())
						Continue

					if(hasParty()){
						leaveParty()
						findMatchAllowed:=false
						Continue
					}
					else{
						if(focusChannel())
							Continue
						found:=lobbyFound()
						switchChannel()
						if(found){
							Sleep 1500
							getLobbySlot()
							Sleep 1500
						}
						else{
							Sleep 1000
							lobbyFound()
						}

						Continue
					}

				}
			}
		}
	}
Return

!s::Suspend

^'::
	active:=false
	SoundBeep 350, 100
Return

isFullParty(){
	PixelGetColor, color, 312, 738, RGB
	return color!=0x2E3736
}

hasParty(){
	PixelGetColor, color, 207, 737, RGB
	return color!=0x2E3736
}

isFindingMatch(){
	PixelGetColor, color, 1311, 734, RGB
	return color==0x390602
}

cancelFindMatch(){
	MouseGetPos, x, y
	SendEvent {Click, 1311, 734}
	MouseMove %x%, %y%
}

dialogClosed(){
	PixelGetColor, color, 693, 425, RGB
	;Timeout, lobby, party
	If (color==0x4B5A62||color==0x4D5C64||color==0X55666F) {
		MouseGetPos, x, y
		SendEvent {Click 693, 425}
		MouseMove %x%, %y%
		return true
	}

	;Lobby invite
	PixelGetColor, color, 610, 408, RGB
	If (color==0x9EA5A8){
		MouseGetPos, x, y
		SendEvent {Click 610, 418}
		MouseMove %x%, %y%
		return true
	}

	;New timeout
	PixelGetColor, color, 682, 419, RGB
	If (color==0x9EA5A8){
		MouseGetPos, x, y
		SendEvent {Click 682, 434}
		MouseMove %x%, %y%
		return true
	}

	;Receive item
	PixelGetColor, color, 682, 535, RGB
	If (color==0x9EA5A8){
		MouseGetPos, x, y
		SendEvent {Click 682, 550}
		MouseMove %x%, %y%
		return true
	}

	return false
}

partyDismissed(){
	PixelGetColor, color, 441, 359, RGB
	PixelGetColor, color2, 441, 392, RGB

	If (color==0x4b674c||color2==0x4b674c) {
		MouseGetPos, x, y
		SendEvent {Click 681, 492}
		SendEvent {Click 681, 512}	
		MouseMove %x%, %y%
		return true
	}
	else
		return false
}

backToHomeMenu(){
	PixelGetColor, color, 245, 537, RGB
	If (color==0x000000) {
		MouseGetPos, x, y
		SendEvent {Click 200, 26}
		MouseMove %x%, %y%
		return true
	}
	else
		return false
}


matchReconnected(){
	PixelGetColor, color, 1212, 737, RGB
	If (color==0xFFFFFF) {
		;msgbox match reconnected
		MouseGetPos, x, y
		SendEvent {Click 1212, 737}
		MouseMove %x%, %y%
		return true
	}
	else
		return false
}

isInLobby(){
	PixelGetColor, color, 1214, 309, RGB
	return color==0x000000
}

leaveParty(){
	PixelGetColor, color, 164, 722, RGB
	PixelGetColor, playerColor, 172, 737, RGB
	MouseGetPos, x, y
	
	;Player is party leader
	if (color==0x44AAff && playerColor==0xE1E8E2) {
		SendEvent {Click, 173, 737, R}
	}
	
	;If player is not
	else{
		SendEvent {Click, 210, 737, R}
	}

	;msgbox leave party
	MouseMove %x%, %y%
	
	Sleep 1000
	MouseGetPos, x, y
	SendEvent {Click, 193, 691}
	SendEvent {Click, 608, 741}
	MouseMove %x%, %y%
}

;TODO CHange this to inside lobby
hasPartyInviteInLobby(){
	PixelGetColor, color, 587, 472, RGB
	PixelGetColor, color2, 587, 475, RGB
	PixelGetColor, color3, 587, 502, RGB
	return (color==0x9EA5A8||color2==0xC4D8E4||color3==0x9EA5A8) 
}

acceptParty(){
	;msgbox accept party
	MouseGetPos, x, y
	SendEvent {Click, 596, 489}
	SendEvent {Click, 596, 509}
	MouseMove %x%, %y%
}

playerIsInSecond(){
	PixelGetColor, playerColor, 209, 736, RGB
	return playerColor==0x9DAE97
}

lobbyFound() {
	startX = 373
	endX = 801
	startY:=485
	endY:=730
	currentY:=endY
	while (currentY>=startY) {
		addedY:=currentY+15
		PixelSearch, Px, Py, %startX%, %currentY%, %endX%, %addedY%, 0x90C364, 3, Fast
		if !ErrorLevel{
			MouseGetPos, x, y
			SendEvent {Click, %Px%, %Py%}
			AddedX = % Px + 5
			AddedY = % Py + 1
			MouseMove %AddedX%, %AddedY%
			SendEvent {Click}
			;msgbox lobby found
			MouseMove %x%, %y%
			Return true
		}

		currentY:=currentY-10
	}
	return false
}

switchChannel(){
	PixelSearch, Px, Py, 390, 460, 800, 560, 0x1E48BF, 3, Fast
	If !ErrorLevel{
		MouseGetPos, x, y
		SendEvent {Click, %Px%, %Py%}
		MouseMove %x%, %y%
		;msgbox siwtch channel
		Sleep 1000
		AddedY:=Py+120
		MouseGetPos, x, y
		MouseMove %Px%, %AddedY%
		SendEvent {WheelDown 50}
		SendEvent {WheelDown 50}
		SendEvent {WheelDown 50}
		SendEvent {WheelDown 50}
		MouseMove %x%, %y%
	}
}

isBackToLobby(){
	;Back from lobby if channel exists (not in lobby)
	PixelSearch, Px, Py, 438, 460, 800, 560, 0xE5E492, 3, Fast
	If !ErrorLevel{
		if(!isInLobby()){
			inLobby:=true
			MouseGetPos, x, y
			SendEvent {Click 1212, 735}
			MouseMove %x%, %y%
			Return true
		}
	}
	Return false
}

getLobbySlot() {
	;If user doesn't get slot
	if(!isInLobbySlot()){
		MouseGetPos, x, y

		;Get slot
		;10
		PixelGetColor, color, 1127, 282
		If (color==0x1E1918) 
			SendEvent {Click 1110, 282}
		;9
		PixelGetColor, color, 1127, 247
		If (color==0x1F1B19) 
			SendEvent {Click 1110, 247}
		;8
		PixelGetColor, color, 1127, 212
		If (color==0x231F1C) 
			SendEvent {Click 1110, 212}
		;7
		PixelGetColor, color, 1127, 174
		If (color==0x27221F) 
			SendEvent {Click 1110, 174}
		;6
		PixelGetColor, color, 1127, 139
		If (color==0x2b2622) 
			SendEvent {Click 1110, 154}
		;5
		PixelGetColor, color, 886, 282
		If (color==0x1E1A18) 
			SendEvent {Click 1093, 282}
		;4
		PixelGetColor, color, 886, 247
		If (color==0x1F1E19) 
			SendEvent {Click 1093, 247}
		;3
		PixelGetColor, color, 886, 212
		If (color==0x23241C) 
			SendEvent {Click 1093, 212}
		;2
		PixelGetColor, color, 886, 174
		If (color==0x27291F) 
			SendEvent {Click 1093, 174}
		;1
		PixelGetColor, color, 886, 139
		If (color==0x2A3422) 
			SendEvent {Click 1093, 154}

		MouseMove %x%, %y%
	}
}

isInLobbySlot(){
	PixelSearch, Px, Py, 1074, 132, 1088, 289, 0x4949B1, 10, Fast
	If !ErrorLevel
		return true
	PixelSearch, Px, Py, 1314, 132, 1326, 289, 0x3A3883, 10, Fast
	If !ErrorLevel
		return true
	return false
}

isLobbyHost(){
	PixelGetColor, color, 1220, 745, RGB
	return (color>=0x040404) 
}

exitLobby(){
	;Validate channel is active
	MouseGetPos, x, y
	SendEvent {Click 1200, 700}

	;Home
	SendEvent {Click 200, 26}

	;Click channel
	;SendEvent {Click 676, 664}
	;SendEvent {Click 676, 740}

	MouseMove %x%, %y%
	switchChannel()
}

focusChannel(){
	MouseGetPos, x, y
	;Home channel color
	PixelGetColor, color, 675, 673, RGB
	;Other channel color
	PixelGetColor, color2, 876, 542, RGB
	if(color!=0x000000&&color2!=0x000000){
		SendEvent {Click 676, 740}
		MouseMove %x%, %y%
		return true	
	}
	return false
}

summaryDismissed(){
	PixelGetColor, color, 944, 483, RGB
	PixelGetColor, color2, 944, 535, RGB
	PixelGetColor, color3, 944, 511, RGB
	if (color==0x9EA5A8||color2==0x9EA5A8||color3==0x9EA5A8) {
		MouseGetPos, x, y
		SendEvent {Click, 944, 484}
		SendEvent {Click, 944, 512}
		SendEvent {Click, 944, 536}
		MouseMove %x%, %y%
		return true
	}
	return false
}

matchAccepted(){
	;Accept Match
	PixelGetColor, color, 688, 371, RGB
	If (color==0xFFFFFF){
		SoundBeep 450, 100
		SoundBeep 550, 100
		SoundBeep 650, 100
		SoundBeep 750, 100
		MouseGetPos, x, y
		SendEvent {Click 627, 376}
		MouseMove %x%, %y%
		return true
	}
	return false
}

isInPreMatch(){
	PixelGetColor, color, 671, 39, RGB
	If (color==0xFFFFFF){
		return true
	}
	return false
}

allHeroChallengeSuggested(){
	suggested:=false
	PixelSearch, Px, Py, 118, 126, 943, 550, 0xEBB57E, 4, Fast
	If !ErrorLevel
		suggested:=true

	PixelSearch, Px, Py, 118, 126, 943, 550, 0xEFB782, 4, Fast
	If !ErrorLevel{
		suggested:=true
	}

	if(suggested){	
		MouseGetPos, x, y
		addedX:=Px+5
		addedY:=Py+5
		Sleep 500
		SendEvent {Click, %addedX%, %addedY%}
		Sleep 500

		PixelGetColor, color, 1071, 583, RGB
		if(color==0xCCCCCC){
			Click 1071, 583
			Sleep 20000
		}

;		SendEvent {Alt Down}{Click, %addedX%, %addedY%}
;		Sleep 500
;		Send {Alt Up}

		MouseMove %x%, %y%
		return true
	}
	return false
}

dailyQuestSuggested(){
	PixelSearch, Px, Py, 118, 126, 943, 550, 0xFFCE7A, 1, Fast
	If !ErrorLevel{
		MouseGetPos, x, y
		addedX:=Px+5
		addedY:=Py+3
		SendEvent {Click, %addedX%, %addedY%}
		Sleep 500

		PixelGetColor, color, 1071, 583, RGB
		if(color==0xCCCCCC){
			Click 1071, 583
			Sleep 20000
		}

;		SendEvent {Alt Down}{Click, %addedX%, %addedY%}
;		Sleep 500
;		Send {Alt Up}

		MouseMove %x%, %y%
		return true
	}
	return false
}

heroPicked(){
	PixelGetColor, color, 1152, 541, RGB
	PixelGetColor, color2, 970, 541, RGB
	if (color!=0x6F819B&&color2==0x6F819B){
		MouseGetPos, x, y
		SendEvent !{Click, 983, 569}
		MouseMove %x%, %y%
		return true
	}
	return false
}

randomButtonIsActive(){
	PixelGetColor, color, 1152, 541, RGB
	PixelGetColor, color2, 1181, 541, RGB
	return (color!=0x6F819B&&color2==0x6F819B)
}

pickRandomHero(){
	MouseGetPos, x, y
	SendEvent !{Click, 1191, 565}
	MouseMove %x%, %y%
}

captainsModeHeroSelected(){
	;Captains mode selection
	PixelGetColor, color, 670, 117
	If (color==0xFFFFFF) {
		MouseGetPos, x, y
		Sleep 20000

		;Select captains mode hero 1
		PixelGetColor, color, 148, 553
		If (color==0xCCCCCC) {
			SendEvent {Click 148, 553}
			return true
		}

		;Select captains mode hero 2
		PixelGetColor, color, 403, 553
		If (color==0xCCCCCC) {
			SendEvent {Click 403, 553}
			return true
		}

		;Select captains mode hero 3
		PixelGetColor, color, 658, 553
		If (color==0xCCCCCC) {
			SendEvent {Click 658, 553}
			return true
		}

		;Select captains mode hero 4
		PixelGetColor, color, 913, 553
		If (color==0xCCCCCC) {
			SendEvent {Click 913, 553}
			return true
		}

		;Select captains mode hero 5
		PixelGetColor, color, 1168, 553
		If (color==0xCCCCCC) {
			SendEvent {Click 1168, 553}
			return true
		}

		MouseMove %x%, %y%
		return false
	}
}

isInArcadeLobby(){
	PixelGetColor, color, 1234, 160, RGB
	return (color==0x151719)	
}

isInMatch(){
	PixelGetColor, color, 581, 728, RGB
	return (color==0x5AA338)
}

matchPaused(){
	PixelGetColor, color, 616, 303, RGB
	return (color==0xFFFFFF)
}

defineAttack(){
	attack:=false
	PixelSearch, Px, Py, 386, 31, 977, 44, 0xba9a36, 3, Fast
	if !ErrorLevel{
		attack:=true
	}
}

autoAttackHero(){
	;Autoattack, blank spot
	try := 0
	while (try<400){
		Random, randx, 10, 180
		Random, randy, 586, 754
		PixelGetColor, color, %randx%, %randy%, RGB
		;Attack
		If (color==0xFF0000){
			MouseMove randx, randy
			Sleep 200
			if(attack)
				Send a
			else
				send g
			break
		}
		try := try+1
	}

	if(try>398){
		Random, randx, 10, 180
		Random, randy, 586, 754
		MouseMove randx, randy
		Sleep 200
		Send a
	}

	Sleep 5000
}

matchExited(){
	;Exit match
	PixelGetColor, color, 661, 661
	If (color==0x3D522C) {
		MouseGetPos, x, y
		SendEvent {Click 674, 644}
		MouseMove %x%, %y%
		return true
	}
	PixelGetColor, color, 661, 661
	If (color==0x020A42) {
		MouseGetPos, x, y
		SendEvent {Click 674, 644}
		MouseMove %x%, %y%
		return true
	}
	;Exit match on win wagger
	PixelGetColor, color, 1010, 472
	PixelGetColor, color2, 1010, 471
	If (color==0x555555||color2==0x555555) {
		MouseGetPos, x, y
		SendEvent {Click 1010, 485}
		MouseMove %x%, %y%
		return true
	}

	return false
}

defaultPosition(){
	MouseMove 10, 10
}

autoAddLevel(){
	PixelSearch, Px, Py, 598, 639, 869, 664, 0x054566, 1, Fast
	if !ErrorLevel{
		Click %Px%, %Py%
	}
}

autoBuyItem(){
	openShop()
	Random, x, 994, 1120
	Random, y, 118, 386
	MouseMove %x%, %y%
	Sleep 500
	Send {Shift down}
	Sleep 500
	MouseMove %x%, %y%
	Sleep 500
	Click L, %x%, %y%
	Sleep 500
	Send {Shift up}
	Sleep 500
	Send {F5}
	closeShop()
	deliverCourier()
}

deliverCourier(){
	Send +{F3}
	Send {F2}
	Send +{q}
	Send {F1}t
}

shopOpened(){
	PixelGetColor, color, 1320, 50
	return (color==0x000000)
}

openShop() {
	if (!shopOpened())
		Send {F4}
	Sleep 500
}

closeShop() {
	Send {F4}
}


;get slot
MButton & WheelUp::
	getLobbySlot()
Return

;click lobby
MButton & LButton::
	lobbyFound()
	SendEvent {Alt up}
	SendEvent {Ctrl up}
	SendEvent {Shift up}
Return

;Back from lobby
MButton & WheelDown::
	dialogClosed()
	exitLobby()
Return

;Alt tab
MButton & RButton::AltTabMenu

;When miss press "x" at the bottom right before go in game, after accept game. 3 people do it = no penalty
;Dodge
^!d::
	Click 1311, 735
Return

;Dodge
^+d::
	Send When miss press "x" at the bottom right before go in game, after accept game. Don't reconnect. 3 people do it = no penalty.
Return

+8::
	Loop 51{
		SendEvent {Click, R}
	}
Return