setmousedelay -1
active:=true
attack:=true
dailyHero:=true
allHeroChallange:=false
specificHero:=false
heroX:=843
heroY:=156

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

;Auto accept + Auto attack
+/::
	active:=true
	SoundBeep 350, 100


	if(isFullParty()){
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
			MouseMove 0, 0
			Sleep 3000

			if(dialogClosed())
				Continue

			if(backToHomeMenu()){
				Continue
			}
			
			if(findMatchAllowed){
				if(isInLobby()&&!isInLobbySlot()){
					findMatchAllowed:=false
					Soundbeep 350, 100
					Continue
				}

				if(matchReconnected())
					Continue

				if(hasPartyInviteInLobby()){
					findMatchAllowed:=false
					Soundbeep 350, 100
					Continue
				}

				if(isInLobby()&&!hasParty()){
					findMatchAllowed:=false
					Soundbeep 350, 100
					Continue
				}

				if(!isInLobby()&&playerIsInSecond()&&!isFullParty()){
					findMatchAllowed:=false
					Soundbeep 350, 100
					Continue
				}

				;TODO If before match
				;TODO Autoclick ability draft
				;TODO Match finished
				;TODO Temporary code below

				;----------------------------------------------------------
				;Suggest in Captain Mode
				PixelGetColor, color, 638, 55
				If (color==0xFFFFFF){
					if(dailyHero){
						PixelSearch, Px, Py, 118, 126, 943, 550, 0xFFCE7A, 1, Fast
						If !ErrorLevel{
							addedX:=Px+5
							addedY:=Py+5
							SendEvent !{Click, %addedX%, %addedY%}
							Sleep 500
							MouseMove 10, 586
						}
					}
					else if(allHeroChallange) {
						PixelSearch, Px, Py, 118, 126, 943, 550, 0xEBB57E, 1, Fast
						If !ErrorLevel{
							addedX:=Px+5
							addedY:=Py+5
							SendEvent !{Click, %addedX%, %addedY%}
							Sleep 500
							MouseMove 10, 586
						}
					}
					else if(specificHero){
						addedX:=Px+5
						addedY:=Py+5
						SendEvent !{Click, %addedX%, %addedY%}
						Sleep 500
						MouseMove 10, 586
					}
					
					
				}
						
				;Pick random hero
				PixelGetColor, color, 1208, 583
				If (color==0xC1C1C1||color==0x5C5C5Ccolor==0x120D0A) {
					
					if(specificHero){
						SendEvent {Click %heroX%, %heroY%}
						Sleep 1000
						SendEvent {Click, 1000, 560}
						Sleep 1000
					}
					
					if(dailyHero){
						PixelSearch, Px, Py, 118, 126, 943, 550, 0xF7CA7A, 1, Fast
						If !ErrorLevel{
							SendEvent {Click, %Px%, %Py%}	
							Sleep 1000
							SendEvent {Click, 1000, 560}
							Sleep 1000
						}
					}
					
					;Click random
					MouseMove 1208, 583
					Sleep 200
					SendEvent {Click}
					Sleep 200
					MouseMove 10, 586
				}
				
				;Autoattack, blank spot
				try := 0
				PixelGetColor, color, 193, 759
				If (color==0x1F1B1B){
					while (try<400){
						Random, randx, 10, 180
						Random, randy, 586, 754
						PixelGetColor, color, %randx%, %randy%
						;Attack
						If (color==0x0000FF){
							SoundBeep 350, 100
							MouseMove randx, randy
							if(attack)
								Send a
							else 
								sendevent {click, R}
							break
						}
						try := try+1
					}
				}
				
				;Captain mode selection
				PixelGetColor, color, 670, 117
				If (color==0xFFFFFF) {
					Sleep 20000

					;Select captains mode hero 1
					PixelGetColor, color, 148, 553
					If (color==0xCCCCCC) 
						SendEvent {Click 148, 553}

					;Select captains mode hero 2
					PixelGetColor, color, 403, 553
					If (color==0xCCCCCC) 
						SendEvent {Click 403, 553}

					;Select captains mode hero 3
					PixelGetColor, color, 658, 553
					If (color==0xCCCCCC) 
						SendEvent {Click 658, 553}

					;Select captains mode hero 4
					PixelGetColor, color, 913, 553
					If (color==0xCCCCCC) 
						SendEvent {Click 913, 553}

					;Select captains mode hero 5
					PixelGetColor, color, 1168, 553
					If (color==0xCCCCCC) 
						SendEvent {Click 1168, 553}
						MouseMove 10, 586
				}

				;Exit match
				PixelGetColor, color, 661, 661
				If (color==0x3D522C) {
					SendEvent {Click 674, 644}
					MouseMove 10, 586
				}

				;Exit match on win wagger
				PixelGetColor, color, 1010, 472
				If (color==0x3D522C) {
					SendEvent {Click 1010, 485}
					MouseMove 10, 586
				}

				PixelGetColor, color, 661, 661
				If (color==0x3D522C) {
					SendEvent {Click 674, 644}
					MouseMove 10, 586
				}
				;---------------------------------------------




			}
			else{
				if(hasPartyInviteInLobby()){
					;TODO Add lobby selection
					acceptParty()
					findMatchAllowed:=true
					Soundbeep 550, 100
					Continue
				}

				if (isInLobby()) {
					getLobbySlot()
					if(!isInLobbySlot() || isLobbyHost()){
						exitLobby()
						if(findMatchAllowed){
							findMatchAllowed:=false
							Soundbeep 350, 100
						}
						Continue
					}

				}
				else{
					if(isBackToLobby())
						Continue

					if(hasParty()){
						leaveParty()
						findMatchAllowed:=false
						Soundbeep 350, 100
						Continue
					}
					else{
						found:=lobbyFound()
						switchChannel()
						if(found){
							Sleep 800
							getLobbySlot()
						}
						else{
							Sleep 800
							lobbyFound()
						}

						Continue
					}

				}
			}
		}
	}
Return

^+1::
	dailyHero:=true
	allHeroChallange:=false
	specificHero:=false
Return

^+2::
	dailyHero:=false
	allHeroChallange:=true
	specificHero:=false
Return

^+3::
	dailyHero:=false
	allHeroChallange:=false
	specificHero:=true
Return

!s::Suspend

+'::
	active:=false
	SoundBeep 350, 100
Return

;AFK Def
+,::
	attack:=false
	SoundBeep 350, 100
Return

;AFK attack
+.::
	attack:=true
	SoundBeep 350, 100
Return

isFullParty(){
	PixelGetColor, color, 318, 737, RGB
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

dialogClosed(){
	PixelGetColor, color, 693, 425, RGB
	;msgbox %color%
	;mousemove 693, 425
	;Timeout, lobby, party
	If (color==0x4B5A62||color==0x4D5C64||COLOR==0X55666F) {
		;msgbox close dialog
		SendEvent {Click 693, 425}
		return true
	}
	else
		return false
}

partyDismissed(){
	PixelGetColor, color, 441, 359, RGB
	If (color==0x4b674c) {
		;msgbox party dismissed
		SendEvent {Click 681, 492}
		return true
	}
	else
		return false
}

backToHomeMenu(){
	PixelGetColor, color, 250, 540, RGB
	If (color==0x000000) {
		SendEvent {Click 200, 26}
		return true
	}
	else
		return false
}


matchReconnected(){
	PixelGetColor, color, 1212, 737, RGB
	If (color==0xFFFFFF) {
		;msgbox match reconnected
		SendEvent {Click 1212, 737}
		return true
	}
	else
		return false
}

isInLobby(){
	PixelGetColor, color, 997, 309, RGB
	return color==0x000000
}

leaveParty(){
	PixelGetColor, color, 164, 722, RGB
	PixelGetColor, playerColor, 172, 737, RGB
	
	;Player is party leader
	if (color==0x44AAff && playerColor==0x657574) {
		SendEvent {Click, 173, 737, R}
	}
	
	;If player is not
	else{
		SendEvent {Click, 210, 737, R}
	}

	;msgbox leave party
	
	Sleep 1500
	SendEvent {Click, 193, 691}
	SendEvent {Click, 608, 741}
}

;TODO CHange this to inside lobby
hasPartyInviteInLobby(){
	PixelGetColor, color, 530, 487, RGB
	return (color==0x4E5d65) 
}

acceptParty(){
	;msgbox accept party
	SendEvent {Click, 596, 489}
}

declineParty(){
	;msgbox decline party
	SendEvent {Click, 783, 489}
}

playerIsInSecond(){
	PixelGetColor, playerColor, 209, 736, RGB
	return playerColor==0x657574
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
			SendEvent {Click, %Px%, %Py%}
			AddedX = % Px + 5
			AddedY = % Py + 1
			MouseMove %AddedX%, %AddedY%
			SendEvent {Click}
			;msgbox lobby found
			Return true
		}

		currentY:=currentY-10
	}
	return false
}

switchChannel(){
	PixelSearch, Px, Py, 469, 460, 800, 560, 0x1E48BF, 3, Fast
	If !ErrorLevel{
		SendEvent {Click, %Px%, %Py%}
		;msgbox siwtch channel
		Sleep 1000
	}
}

isBackToLobby(){
	;Back from lobby if channel exists (not in lobby)
	PixelSearch, Px, Py, 438, 460, 800, 560, 0xE5E492, 3, Fast
	If !ErrorLevel{
		if(!isInLobby()){
			inLobby:=true
			SendEvent {Click 1212, 735}
			;msgbox back to loby
			Return true
		}
	}
	Return false
}

getLobbySlot() {
	;If user doesn't get slot
	if(!isInLobbySlot()){
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

		Sleep 1500
	}
}

isInLobbySlot(){
	PixelSearch, Px, Py, 1074, 132, 1326, 289, 0x4949B1, 1, Fast
	If !ErrorLevel{
		return true
	}
	else
		return false
}

isLobbyHost(){
	PixelGetColor, color, 1220, 745, RGB
	return (color>=0x040404) 
}

exitLobby(){
	;Validate channel is active
	PixelGetColor, color, 472, 467
	If (color==0x000000) {
		SendEvent {Click 1200, 700}
		SendEvent {Click 207, 27}
		switchChannel()
		;SendEvent {Click 485, 473}
	}
}

matchAccepted(){
	;Accept Match
	PixelGetColor, color, 688, 371, RGB
	If (color==0xFFFFFF){
		SendEvent {Click 627, 376}
		;msgbox accept match
		return true
	}
	return false
}

^+d::
	if(isFullParty())
		msgbox true
	else
		msgbox false
Return