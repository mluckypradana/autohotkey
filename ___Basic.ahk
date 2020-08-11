#SingleInstance force
CoordMode, Mouse, Screen
CoordMode, Tooltip, Screen
CoordMode, Pixel, Screen
SetCapsLockState, AlwaysOff
setmousedelay -1
setkeydelay -1

global actualScreenX:=1920
global actualScreenY:=1080
global volumeMuted:=false

equal( c1, c2 ) { ; function by [VxE], return value range = [0, 441.67295593006372]
; that just means that any two colors will have a distance less than 442
   r1 := c1 >> 16
   g1 := c1 >> 8 & 255
   b1 := c1 & 255
   r2 := c2 >> 16
   g2 := c2 >> 8 & 255
   b2 := c2 & 255
   return Sqrt( (r1-r2)**2 + (g1-g2)**2 + (b1-b2)**2 )
}

click(cx, cy){
	MouseGetPos x, y
	Click %cx%, %cy%
	MouseMove x, y
}


clickWhen(px, py, pcolor, cx, cy){
	PixelGetColor, color, coorX(px), coorY(py), RGB
	If (equal(color, pcolor)<4){
		if(cx==0)
			click(coorX(px), coorY(py))
		if(cx>0)
			click(coorX(cx), coorY(cy))
		
		return true
	}
	return false
}

coorX(x){
	return A_ScreenWidth  * x / actualScreenX
}

coorY(y){
	return A_ScreenHeight  * y / actualScreenY
}


takeScreenshot(){
	Send #{PrintScreen}
}


isColor(px, py, pcolor) {
	PixelGetColor, color, %px%, %py%, RGB
	return equal(color, pcolor)<4
}

global detectorX:=0
global detectorY:=0
global detectorColor:=0x000000


^!+1::
	MouseGetPos x, y
	PixelGetColor, color, x, y, RGB
 	clipboard := % x . ", " . y . ", " . color
	SoundBeep 350, 100
return

^!+2::
	MouseGetPos x, y
	clipboard := % x . ", " . y
	SoundBeep 350, 100
Return 

^!+3::
	MouseGetPos x, y
	PixelGetColor, color, x, y, RGB
 	clipboard := % color
	SoundBeep 350, 100
return

^!+4::  
	Winset, Alwaysontop, , A
	SoundBeep 350, 100
Return

^!+5::
	SoundBeep 350, 100
	Send bos.transaksi@gmail.com
Return

^!+6::
	SoundBeep 350, 100
	Send @DK007007
Return

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

+!^`::
	SoundSet, +1, , mute
Return