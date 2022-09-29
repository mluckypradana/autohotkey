;Bene auto-cast passive
#SingleInstance force
CoordMode, Mouse, Screen
CoordMode, Tooltip, Screen
CoordMode, Pixel, Screen
SetCapsLockState, AlwaysOff
setmousedelay -1
setkeydelay -1

global spaceEnabled:=true

loop(){
	if spacePressed()	
		if c(936, 483, 0xD42E2E) || c(938, 519, 0xDB2D2D)
		toggleSpace()
	
}
toggleSpace(){
	Send {Space up}
	Sleep 200
	;tooltip("Released: " . spacePressed())
	Send {Space down}
	;Sleep 1000
}

while(true)
	loop()
!p::ExitApp
spacePressed(){
	return GetKeyState("Space")
}
#Include __Functions.ahk