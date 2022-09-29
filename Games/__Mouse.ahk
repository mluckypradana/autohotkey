SetMouseDelay,-1 ;remove delays from mouse action
SetKeyDelay -1
;#Include __GB.ahk
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

^!+1::
	SoundBeep, 250, 100  ; Play a higher pitch for half a 
	SoundBeep, 250, 100  ; Play a higher pitch for half a 
	Suspend
Return

;Mouse click pagedown
PgDn:: ;:)
	Send {LButton Down}
	KeyWait PgDn
	Send {LButton Up} 
Return

;Mouse click pageup
PgUp:: 
	Send {RButton Down} 
	KeyWait PgUp
	Send {RButton Up}
Return ;End Hotkey

;get slot
MButton & WheelUp::
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
Return

;click lobby
MButton & LButton::
	startY:=485
	endY:=730
	currentY:=endY
	while (currentY>=startY) {
		addedY:=currentY+5
		PixelSearch, Px, Py, %startX%, %currentY%, %endX%, %addedY%, 0x90C364, 3, Fast
		if !ErrorLevel{
			SendEvent {Click, %Px%, %Py%}
			AddedX = % Px + 5
			AddedY = % Py + 1
			MouseMove %AddedX%, %AddedY%
			SendEvent {Click}
			Return
		}

		currentY:=currentY-10
	}
Return

;Back from lobby
MButton & WheelDown::
	SendEvent {Click 1200, 700}
	;Validate channel is active
	PixelGetColor, color, 472, 467
	If (color==0x000000) {
		SendEvent {Click 1200, 700}
		SendEvent {Click 207, 27}
		SendEvent {Click 485, 473}
	}
Return

;Alt tab
MButton & RButton::AltTabMenu
Return

;When miss press "x" at the bottom right before go in game, after accept game. 3 people do it = no penalty
;Dodge
^!d::
	Click 1311, 735
Return

;Dodge
^+d::
	Send When miss press "x" at the bottom right before go in game, after accept game. 3 people do it = no penalty
Return