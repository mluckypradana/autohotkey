CoordMode, mouse, screen ; does NOT use active window coords
CoordMode, Pixel, screen
SetMouseDelay -1

currentColor:=0x000000
started:=0
enabled:=false
color:=0x262b91

;Escape::
;	ExitApp
;Return

MButton::
		Send, {RButton down}
		KeyWait MButton
		Send, {RButton up}
return

!z::
	MouseGetPos x, y
	Click, 446, 63, L
	Sleep 200
	Click, 586, 323, L
	Click, 344, 19, L
	MouseMove x, y
return

!x::
	MouseGetPos x, y
	Click, 446, 63, L
	Sleep 200
	Click, 661, 323, L
	Click, 344, 19, L
	MouseMove x, y
return

!q::
	MouseGetPos x, y
	Click, 424, 73, L
	Click, 1012, 165, L
	Sleep 200
	Click, 547, 427, L
	Click, 547, 476, L
	Sleep 200
	Click, 789, 491, L
	Sleep 200
	Click, 307, 25, L
	MouseMove x, y
Return

!w::
	MouseGetPos x, y
	Click, 424, 73, L
	Click, 1012, 165, L
	Sleep 200
	Click, 661, 427, L
	Click, 661, 476, L
	Sleep 200
	Click, 789, 491, L
	Sleep 200
	Click, 307, 25, L
	MouseMove x, y
Return

!e::
	MouseGetPos x, y
	Click, 424, 73, L
	Click, 1012, 165, L
	Sleep 200
	Click, 772, 427, L
	Click, 772, 476, L
	Sleep 200
	Click, 789, 491, L
	Sleep 200
	Click, 307, 25, L
	MouseMove x, y
Return


;Closest first
!s::
	MouseGetPos x, y
	Click, 424, 73, L
	Sleep 100
	Click, 315, 125, L
	Sleep 100
	Click, 832, 521, L
	Click, 307, 25, L
	MouseMove x, y
Return

;Distance 15
^!a::
	started:=1
	SoundBeep 350, 100
	MouseGetPos, x, y
	currentX:=x
	currentY:=y
	PixelGetColor, color, %x%, %y%
	currentColor:=color
	while(true) {
		Click L
	}
Return


^!s::
	SoundBeep 300, 100
	started:=0
Return


;Hilda passive
!h::
	started:=1
	SoundBeep 350, 100

	while(true) {
		color:=0x877a35
		color2:=0x877a35
		PixelGetColor, color, 761, 669, rgb
		PixelGetColor, color2, 725, 669, rgb
		while(color!=0xFDFCD8 && color2!=0xFEFCD9){
			PixelGetColor, color, 761, 669, rgb
			PixelGetColor, color2, 725, 669, rgb
			SoundBeep 250, 100
			Sleep 500
		}
	}
Return


;Angela only
!d::
	MouseGetPos, x, y
	MouseMove 1006, 569
	Send % "{Click " . ( GetKeyState("LButton") ? "Up}" : "Down}" )
	;MouseMove x, y
Return

!c::
	commendTeam()
Return

!v::
	commendEnemies()
Return

commendTeam(){
	Click 442, 305, L
	Click 442, 354, L
	Click 442, 413, L
	Click 442, 463, L
	Click 442, 515, L

	Click 442, 305, L
	Click 442, 354, L
	Click 442, 413, L
	Click 442, 463, L
	Click 442, 515, L

	Click 442, 305, L
	Click 442, 354, L
	Click 442, 413, L
	Click 442, 463, L
	Click 442, 515, L
}

commendEnemies(){
	Click 919, 305, L
	Click 919, 354, L
	Click 919, 413, L
	Click 919, 463, L
	Click 919, 515, L

	Click 919, 305, L
	Click 919, 354, L
	Click 919, 413, L
	Click 919, 463, L
	Click 919, 515, L
	
	Click 919, 305, L
	Click 919, 354, L
	Click 919, 413, L
	Click 919, 463, L
	Click 919, 515, L
}