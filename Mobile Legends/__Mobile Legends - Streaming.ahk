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
	while(active){
		;Defaults
		Sleep 5000

		;Click tournament
		PixelGetColor, color, 532, 155, RGB
		If (color==0xb2cb39){
			Click 287, 434, L
			Continue
		}
		
		;Click arena
		PixelGetColor, color, 917, 323, RGB
		If (color==0x33cfd2) {
			Click 917, 323, L
			Continue
		}

		;Click watch
		PixelGetColor, color, 711, 271, RGB
		If (color==0x3acf4d) {
			Click 711, 271, L
			Continue
		}

		;Click watch ingame
		PixelGetColor, color, 685, 541, RGB
		If (color==0x34c946){
			Click 685, 541, L
			Continue
		}

		;Click treasure
		PixelGetColor, color, 682, 20, RGB
		If (color==0x4f6ad4){
			;Only for active treasure
			PixelGetColor, color, 1056, 68, RGB
			If (color!=0xffd84c)
				Send {F3}
			Continue
		}

		;Click confirm match
		PixelGetColor, color, 1013, 579, RGB
		If (color==0x3ad14b){
			Click 1013, 579, L
			Continue
		}

		;Click back
		PixelGetColor, color, 1044, 587, RGB
		If (color==0x34c947){
			Click 1044, 587, L
			Continue
		}

		;Click okay left
		PixelGetColor, color, 575, 521, RGB
		If (color==0x37cb49){
			Click 575, 521, L
			Continue
		}



		;Click okay
		PixelGetColor, color, 685, 521, RGB
		If (color==0x38ce49){
			Send h
			Continue
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