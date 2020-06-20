#Include _SoulRing.ahk

radiant:=true
SetMouseDelay, -1
!`::
	radiant:=!radiant
	SoundBeep, 450, 100  
	if(!radiant)
		SoundBeep, 450, 100
Return
!1::
	if(radiant)
		heal(407, 15)
	else
		heal(780, 15)
Return
!2::
	if(radiant)
		heal(450, 15)
	else
		heal(823, 15)
Return
!3::
	if(radiant)
		heal(496, 15)
	else
		heal(871, 15)
Return
!4::
	if(radiant)
		heal(544, 15)
	else
		heal(913, 15)
Return
!5::
	if(radiant)
		heal(585, 15)
	else
		heal(959, 15)
Return

heal(px, py){
	KeyWait Alt
	MouseGetPos, x, y
	MouseMove, %px%, %py%
	Sleep 50
	MouseMove, %px%, %py%
	Send e
	Sleep 50
	MouseMove, x, y
}