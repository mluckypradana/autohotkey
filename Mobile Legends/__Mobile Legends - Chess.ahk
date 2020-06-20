#if WinActive("ahk_exe Bluestacks.exe")
#SingleInstance force
CoordMode, mouse, screen ; does NOT use active window coords
CoordMode, Pixel, screen
SetMouseDelay -1

;#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
;SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;Space & F1::Return ; Mentioned in the hotkeys docs for UP
;*Space::Send {Blind}{Space} ; Send it explicitly when no other key is pressed before letting go, including any modifiers being held

;#If GetKeyState("Space", "p") ; Autohotkey_L directive for enabling following mappings when key is physically down


currentColor:=0x000000
started:=0
enabled:=false
color:=0x262b91
global actualScreenX:=1920
global actualScreenY:=1080

Esc::
	ExitApp
Return

clickWhenNot(px, py, pcolor, cx, cy){
	PixelGetColor, color, coorX(px), coorY(py), RGB
	If (equal(color, pcolor)>12){
		if(cx==0)
			click(coorX(px), coorY(py))
		if(cx>0)
			click(coorX(cx), coorY(cy))
		
		return true
	}
	return false
}

equal( c1, c2 ) ; find the distance between 2 colors
{ ; function by [VxE], return value range = [0, 441.67295593006372]
; that just means that any two colors will have a distance less than 442
   r1 := c1 >> 16
   g1 := c1 >> 8 & 255
   b1 := c1 & 255
   r2 := c2 >> 16
   g2 := c2 >> 8 & 255
   b2 := c2 & 255
   return Sqrt( (r1-r2)**2 + (g1-g2)**2 + (b1-b2)**2 )
}


coorX(x){
	return A_ScreenWidth  * x / actualScreenX
}

coorY(y){
	return A_ScreenHeight  * y / actualScreenY
}


click(cx, cy){
	;MouseGetPos x, y
	Click %cx%, %cy%
	;MouseMove x, y
}

^1::
	active:=true
	SoundBeep 550, 100
	while(active){
		clear()
		Sleep 200
		buy()
	}
Return

^2::
	active:=false
	SoundBeep 350, 100
Return

+1::
	clear()
Return

+2::
	buy()
Return

clear(){
	;Unfocus
	click(967, 814)

	if(clickWhenNot(695, 732, 0x55644B, 0, 0))
		dump()

	if(clickWhenNot(771, 732, 0x565646, 0, 0))
		dump()
	
	if(clickWhenNot(847, 727, 0x868E75, 0, 0))
		dump()
	
	if(clickWhenNot(923, 734, 0x6E6E62, 0, 0))
		dump()
	
	if(clickWhenNot(999, 736, 0x8C947B, 0, 0))
		dump()
	
	if(clickWhenNot(1074, 736, 0x6D6D54, 0, 0))
	dump()
	
	if(clickWhenNot(1151, 730, 0x8E967E, 0, 0))
		dump()
	
	if(clickWhenNot(1227, 734, 0x605C4C, 0, 0))
		dump()
	
	click(1430, 1012)
	SoundBeep 350, 100
}

buy(){
	clickWhenNot(1430, 1014, 0x5BBFE0, 0, 0)

	;1
	if(clickWhenNot(609, 432, 0x25354E, 0, 0))
		Sleep 120	
	;2
	if(clickWhenNot(779, 417, 0x233349, 0, 0))
		Sleep 120
	;3
	if(clickWhenNot(933, 452, 0x2B4361, 0, 0))
		Sleep 120
	;4
	if(clickWhenNot(1137, 427, 0x2C4969, 0, 0))
		Sleep 120
	;5
	if(clickWhenNot(1297, 438, 0x2D4B6C, 0, 0))
		Sleep 120

	click(1440, 521)
	SoundBeep 350, 100
}

dump(){
	Sleep 120
	click(489, 410)
	Sleep 100
}
