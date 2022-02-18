;AI Base
#SingleInstance force
CoordMode, Mouse, Screen
CoordMode, Tooltip, Screen
CoordMode, Pixel, Screen
SetCapsLockState, AlwaysOff
setmousedelay -1
setkeydelay -1
loop(){
	weekendRevelry()
	dailyReward()
	sevenDayReward()
}
sevenDayReward(){
	if c(1410, 327, 0xE9EEF0) {
		waitClick(982, 770, 0x9D856C)
		Sleep 1000
		waitClick(1410, 327, 0xE9EEF0)
	}
}
dailyReward(){
	clickWhen(1331, 267, 0x9B8369, 0, 0)
}
weekendRevelry(){
	if !c(1432, 365, 0x072445)
		return

	;3rd
	if clickWhen(1319, 639, 0x9E866B, 0, 0){
		weekendRevelry()
		return
	}
	;2nd
	if clickWhen(1319, 529, 0x9F876C, 0, 0){
		weekendRevelry()
		return
	}
	;1st
	if clickWhen(1321, 419, 0x9C856A, 0, 0){
		weekendRevelry()
		return
	}
}

while(true)
	loop()
!p::ExitApp
#Include __Basic.ahk