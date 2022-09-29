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

Escape::
	ExitApp
Return

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

MButton & WheelUp::
	
	;----------------------------------get slot
	;6
	PixelGetColor, color, 1127, 139
	If (color==0x2b2622) 
		SendEvent {Click 1110, 154}
	;7
	PixelGetColor, color, 1127, 174
	If (color==0x27221F) 
		SendEvent {Click 1110, 174}
	;8
	PixelGetColor, color, 1127, 212
	If (color==0x231F1C) 
		SendEvent {Click 1110, 212}
	;9
	PixelGetColor, color, 1127, 247
	If (color==0x1F1B19) 
		SendEvent {Click 1110, 247}
	;10
	PixelGetColor, color, 1127, 282
	If (color==0x1E1918) 
		SendEvent {Click 1110, 282}
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

	While(true){
		Sleep 2000

		;----------------------------------------------Check if get slot failed and show dialog
		PixelGetColor, dialogColor, 683, 407
		If (color1==0xA8A59E) {
			SendEvent {Click 683, 421}
			Continue
		}

		;----------------------------------------Check if user get slot
		PixelGetColor, color1, 879, 138
		PixelGetColor, color2, 879, 174
		PixelGetColor, color3, 879, 210
		PixelGetColor, color4, 879, 246
		PixelGetColor, color5, 879, 282
		PixelGetColor, color6, 1118, 138
		PixelGetColor, color7, 1118, 174
		PixelGetColor, color8, 1118, 210
		PixelGetColor, color9, 1118, 246
		PixelGetColor, color10, 1118, 282
		If (color1!=0x276A3E
				&&color2!=0x276A3E
				&&color3!=0x276A3E
				&&color4!=0x276A3E
				&&color5!=0x276A3E
				&&color6!=0x276A3E
				&&color7!=0x276A3E
				&&color8!=0x276A3E
				&&color9!=0x276A3E
				&&color10!=0x276A3E) {
			;-----------------------------------------------Back from lobby
			SendEvent {Click 1200, 700}
			SendEvent {Click 578, 663}
			Break
		}
		
	}
Return

;click lobby
MButton & LButton::
	Loop, % ys.MaxIndex()-1 {
		PixelSearch, Px, Py, %startX%, ys[A_Index+1], %endX%, ys[A_Index], 0x90C364, 3, Fast
		if !ErrorLevel{
			SendEvent {Click, %Px%, %Py%}
			AddedX = % Px + 5
			AddedY = % Py + 1
			SendEvent {Click, %AddedX%, %AddedY%}
			Return
		}
	}
Return

MButton & WheelDown::
		;----------------------------------------Back from lobby
		SendEvent {Click 1200, 700}
		SendEvent {Click 578, 663}
Return