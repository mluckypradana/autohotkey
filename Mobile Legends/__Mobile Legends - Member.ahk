#if WinActive("ahk_exe Bluestacks.exe")
#SingleInstance force
CoordMode, mouse, screen ; does NOT use active window coords
CoordMode, Pixel, screen
SetMouseDelay -1

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

Space & F1::Return ; Mentioned in the hotkeys docs for UP
*Space::Send {Blind}{Space} ; Send it explicitly when no other key is pressed before letting go, including any modifiers being held

#If GetKeyState("Space", "p") ; Autohotkey_L directive for enabling following mappings when key is physically down

!s::Suspend

global actualScreenX:=1920
global actualScreenY:=1080


clickWhenNot(px, py, pcolor, cx, cy){
	PixelGetColor, color, coorX(px), coorY(py), RGB
	If (equal(color, pcolor)>4){
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

currentColor:=0x000000
started:=0
enabled:=false
color:=0x262b91

click(cx, cy){
	MouseGetPos x, y
	Click %cx%, %cy%
	MouseMove x, y
}

d::
	deleteMember(1444, 746)
	deleteMember(1443, 682)
	deleteMember(1442, 617)
	deleteMember(1443, 553)
	deleteMember(1442, 491)
	deleteMember(1443, 431)
Return

u::
	unfollow()
Return

deleteMember(x, y){
	click(x, y)
	Sleep 500
	click(1182, 673)
	Sleep 800
}

unfollow(){
	clickWhenNot(592, 736, 0xCCD1FF, 1444, 708)
}