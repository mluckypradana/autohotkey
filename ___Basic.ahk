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
clickL(cx, cy){
	Click %cx%, %cy%
}

click(cx, cy){
	;msgbox %cx%
	;msgbox %cy%
	MouseGetPos x, y
	Click %cx%, %cy%
	MouseMove x, y
}


clickWhen(px, py, pcolor, cx, cy){
	PixelGetColor, color, coorX(px), coorY(py), RGB
	If (equal(color, pcolor)<4){
		if(cx==0)
			click(px, py)
		if(cx>0)
			click(cx, cy)
		
		return true
	}
	return false
}

coorX(x){
	return x ; A_ScreenWidth  * x / actualScreenX
}

coorY(y){
	return y ; A_ScreenHeight  * y / actualScreenY
}


takeScreenshot(){
	Send #{PrintScreen}
	SoundBeep 350, 50
}


isColor(px, py, pcolor) {
	PixelGetColor, color, %px%, %py%, RGB
	return equal(color, pcolor)<4
}
isColorS(px, py, pcolor, sensitivity) {
	PixelGetColor, color, %px%, %py%, RGB
	return equal(color, pcolor)<sensitivity
}

global detectorX:=0
global detectorY:=0
global detectorColor:=0x000000
global shakeMouseEnabled:=false


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

#+`::
	SoundSet, +1, , mute
Return
#+q::
	Send {Volume_up}
Return
#+a::
	Send {Volume_down}
Return

+!^Up::moveMouse(0, -1)
+!^Down::moveMouse(0, 1)
+!^Left::moveMouse(-1, 0)
+!^Right::moveMouse(1, 0)
moveMouse(dx, dy){
	MouseGetPos x, y
	x:=x+dx
	y:=y+dy
	MouseMove x, y
}

;Shake mouse
;Detect color difference
#+e::
	SoundBeep 350, 100
	shakeMouseEnabled:=true
	while(shakeMouseEnabled){
		MouseGetPos x, y
		if(mod(x, 2)==0)
			x:=x+3
		else
			x:=x-3
		MouseMove x, y
		Sleep 60000
	}
Return

#+d::
	shakeMouseEnabled:=false
	SoundBeep 350, 100
Return


getCurrentDate(){
	FormatTime, currentDate,, dd/MM/yyyy
	return currentDate
}
getDayOfWeek(){
	currentDate := getCurrentDate()
	StringSplit, currentDate, datestring, /
	date := d3 d1 d2
	FormatTime, dayWeek, %date%, dddd
	if(dayWeek=="Monday")
		day:=1
	else if(dayWeek=="Tuesday")
		day:=2
	else if(dayWeek=="Wednesday")
		day:=3
	else if(dayWeek=="Thursday")
		day:=4
	else if(dayWeek=="Friday")
		day:=5
	else if(dayWeek=="Saturday")
		day:=6
	else if(dayWeek=="Sunday")
		day:=7
	return day
}

rand(v1, v2){
	Random, value, v1, v2
	return value
}

drag(sx, sy, dx, dy){
	MouseMove sx, sy
	SetMouseDelay 15
	MouseClickDrag, Left, sx, sy, dx, dy
	SetMouseDelay -1
}