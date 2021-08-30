#SingleInstance force
CoordMode, Mouse, Screen
CoordMode, Tooltip, Screen
CoordMode, Pixel, Screen
SetCapsLockState, AlwaysOff
setmousedelay -1
setkeydelay -1
loop(){
	;Not in match (in lobby)
	if c(960, 101, 0x0B090D) {
		if c(683, 343, 0x7A7B6C) 
		|| c(685, 343, 0x7C7D6E)  
		|| c(685, 341, 0x79796A)  
		|| c(683, 351, 0x7E7F70) {
			escape()
			Sleep 75
			return true
		}
	}
}

while(true)
	loop()
!p::ExitApp
#Include __Functions.ahk