#SingleInstance force
CoordMode, Mouse, Screen
CoordMode, Tooltip, Screen
CoordMode, Pixel, Screen
SetCapsLockState, AlwaysOff
setmousedelay -1
setkeydelay -1

loop(){
	if c(708, 779, 0xA0886C) ;Usable reward
	|| c(1022, 310, 0xBCDFF7) ;With background (Reward text)
	|| (c(1099, 370, 0xCACDD1) && c(899, 750, 0x9F866B)) ;Reward with no background
	{
		escape()
	}
}

while(true)
	loop()
!p::ExitApp
#Include __Functions.ahk