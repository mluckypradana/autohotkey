CoordMode, Mouse, Screen
CoordMode, Tooltip, Screen
CoordMode, Pixel, Screen
#SingleInstance force
SetCapsLockState, AlwaysOff
setmousedelay -1
setkeydelay -1

global detectorX:=0
global detectorY:=0
global detectorColor:=0x000000

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

;Detect color difference
+!^a::
	SoundBeep 350, 100
	MouseGetPos x, y
	PixelGetColor, color, %x%, %y%, RGB
	detectorX:=x
	detectorY:=y
	detectorColor:=color
	colorDetectorEnabled:=true
	while(colorDetectorEnabled){
		Sleep 1000
		if(!isColor(detectorX, detectorY, detectorColor)){
			SoundBeep 350, 100
		}
	}
Return

+!^s::
	colorDetectorEnabled:=false
	SoundBeep 350, 100
Return


isColor(px, py, pcolor) {
	PixelGetColor, color, %px%, %py%, RGB
	return equal(color, pcolor)<4
}


equal( c1, c2 ) ; find the distance between 2 colors
{ ; function by [VxE], return value range = [0, 441.67295593006372]
; that just means that any two colors will have a distance less than 442
   r1 := c1 >> 16
   g1 := c1 >> 8 & 255
   b1 := c1 & 255
   r2 := c2 >> 16
   g2 := c2 >> 8 & 255
   b2 := c2 & 255
   return Sqrt( (r1-r2)**2 + (g1-g2)**2 + (b1-b2)**2 )
}
