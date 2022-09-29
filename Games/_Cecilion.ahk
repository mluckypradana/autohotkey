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
	if skillReset() {
		alert()
	}
}
alert(){
	SoundBeep 50, 20
	;Sleep 500
}
skillReset(){
	return c(1239, 974, 0xFC89A7)
}
while(true)
	loop()

#IfWinActive ("ahk_exe HD-Player.exe")
!p::ExitApp
spacePressed(){
	return GetKeyState("Shift")
}
#Include __Functions.ahk