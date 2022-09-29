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
	if hasLingEnergy() {
		alert()
		if half()
			Sleep 10
		else if halfFull()
			Sleep 500
		else
			Sleep 1000
	}
}
addSkill1(){
	return c(1191, 949, 0xFEF2AF)
}
addSkill2(){
	return c(1254, 836, 0xFEF2AF)
}
addSkill3(){
	return c(1366, 774, 0xFEF2AF)
}
halfFull(){
	return c(994, 533, 0x2B2B2B)
}
half(){
	return c(966, 533, 0x2B2B2B)
}
full(){
	return c(1018, 532, 0xB0B0B0)
}
hasLingEnergy(){
	return c(1472, 17, 0xD1C47E)
}
toggleSpace(){
	Send {Shift up}
	Sleep 200
	;tooltip("Released: " . spacePressed())
	Send {Shift down}
	Sleep 1000
}
alert(){
	SoundBeep 50, 20
	;Sleep 500
}
cast(x, y){
	if !hasLingEnergy() 
		return
	saveLastCursor()
	Send {w down}
	MouseMove %x%, %y%
	Sleep 75
	Send {w up}
	loadLastCursor()
}
while(true)
	loop()

#IfWinActive BlueStacks
+s::
	send d
Return
+Tab::
	saveLastCursor()
	Send {q down}
	MouseMove 731, 986
	Sleep 75
	Send {q up}
	loadLastCursor()
Return
+q::cast(696, 308)
+w::cast(960, 302)
+e::cast(1252, 271)
+d::cast(1293, 697)
+c::cast(1074, 883)
+x::cast(961, 815)
+z::cast(837, 900)
+a::cast(655, 657)
!p::ExitApp
spacePressed(){
	return GetKeyState("Shift")
}
#Include __Functions.ahk