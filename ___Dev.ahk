CoordMode, Mouse, Screen
CoordMode, Tooltip, Screen
CoordMode, Pixel, Screen
#SingleInstance force
SetCapsLockState, AlwaysOff
setmousedelay -1
setkeydelay -1

!+4::  Winset, Alwaysontop, , A

!+1::
	MouseGetPos x, y
	PixelGetColor, color, x, y, RGB
 	clipboard := % x . ", " . y . ", " . color
	SoundBeep 350, 100
return

!+2::
	MouseGetPos x, y
	clipboard := % x . ", " . y
	SoundBeep 350, 100
Return 

!+3::
	MouseGetPos x, y
	PixelGetColor, color, x, y, RGB
 	clipboard := % color
	SoundBeep 350, 100
return



!+5::
	Send bos.transaksi@gmail.com
Return
;Allpasswords
!+6::
	Send @DK007007
Return

Capslock & F3::
	MouseGetPos x, y
	Loop, 40{
		circle(x, y, A_Index*18, 50)
	}
	MouseMove x, y
Return

circle(xc, yc, degree, radius){
	r := degree * 3.14 / 180
	x := xc-(radius * cos(r))
	y := yc-(radius * sin(r))
	MouseMove x, y
	Sleep 1
}


Capslock & LButton::
	Send ^#{Left}
	Send {Ctrl up}
Return

Capslock & RButton::
	Send ^#{Right}
	Send {Ctrl up}
Return

+!t::
	Send tools:text=""
	Send {Left}
Return

+!c::
	Send tools:srcCompat="@tools:sample/backgrounds/scenic"
Return