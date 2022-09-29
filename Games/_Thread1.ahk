#SingleInstance force
CoordMode, Mouse, Screen
CoordMode, Tooltip, Screen
CoordMode, Pixel, Screen
SetCapsLockState, AlwaysOff
setmousedelay -1
setkeydelay -1

loop(){
	if c(955, 307, 0xB4D8F6) || c(945, 311, 0xB6D7EE) ;Obtain reward
	{
		escape()
		Sleep 500
	}
}

while(true)
	loop()
!p::ExitApp
#Include __Basic.ahk