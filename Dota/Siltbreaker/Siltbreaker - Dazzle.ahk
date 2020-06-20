;#Include Basic.ahk
#Include __Item.ahk
SetMouseDelay 5

!s::Suspend

space & q::
	send qv
Return

space & q::
	send qv
Return

;Meele mode
space & q::
	if(isRangedMode())
		Send q
Return

;Ranged mode
space & 1::
	if(!isRangedMode())
		Send q
Return

;Ranged skill
space & 2::
	if(!isRangedMode()){
		Send q
		Sleep 400
	}
	switchTread2(1)
	Send w
	Sleep 100
	Send v
Return

;Meele skill
space & w::
	if(isRangedMode()){
		Send q
		Sleep 400
	}
	switchTread2(1)
	Send w
	Sleep 100
	Send v
Return

isRangedMode() {
	PixelGetColor, color, 640, 740
	return (color==0x4F4E3A)
}