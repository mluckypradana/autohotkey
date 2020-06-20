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

;+d::
;Return

;Auto accept + Auto attack
+/::
	active:=true
	SoundBeep 350, 100
	MouseMove 10, 586
	while(active){
		IfWinActive, Dota 2
		{
			;Defaults

			;Accept Party
			PixelGetColor, color, 640, 430
			If (color==0x696151){
				SendEvent {Click 640, 430}
				MouseMove 10, 586
			}
			
			;Accept Party v2
			PixelGetColor, color, 530, 480
			If (color==0x6D6454){
				SendEvent {Click 530, 480}
				MouseMove 10, 586
			}

			;Dismiss invite
			PixelGetColor, color, 432, 366
			If (color==0x4C674B){
				SendEvent {Click 682, 488}
				MouseMove 10, 586
			}

			;Accept Match
			PixelGetColor, color, 600, 370
			If (color==0x495637){
				SendEvent {Click 600,370}
				MouseMove 10, 586
			}

			getLobbySlot()
			exitLobby()

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

			;Timeout
			PixelGetColor, color, 671, 421
			If (color==0xA7A49F) {
				SendEvent {Click 671, 421}
				SendEvent {Click 671, 421}
				MouseMove 10, 586
			}

			;Close lobby dialog
			PixelGetColor, color, 682, 410
			If (color==0x726957) {
				SendEvent {Click 682, 421}	
				SendEvent {Click 682, 421}
				MouseMove 10, 586
			}

			;Reconnect
			PixelGetColor, color, 1260, 730
			If (color==0x93A691) {
				SendEvent {Click 1260, 730}
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

			Sleep 5000
		}
	}
Return

+[::
	active:=true
	while(active) {
		IfWinActive, Dota 2
		{
			SendEvent {Click, 584, 221, R}
			Sleep 200
			SendEvent {Click, 776, 221, R}
			Sleep 200
			SendEvent {Click, 776, 418, R}
			Sleep 200
			SendEvent {Click, 584, 418, R}
			Sleep 200
		}
		else
			Return
	}
Return

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
	}
}

isInLobby(){
	PixelGetColor, color, 855, 64
	return (color==0x25211E)
}

isInLobbySlot(){
	PixelSearch, Px, Py, 1074, 132, 1326, 289, 0x4949B1, 1, Fast
	If !ErrorLevel{
		return true
	}
	else
		return false
}

exitLobby(){
	PixelGetColor, color, 1210, 735
	If (color==0x7A492F) {
		SendEvent {Click 1200, 700}
		SendEvent {Click 207, 27}
		SendEvent {Click 485, 473}
	}
}