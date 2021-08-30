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
global detectorX:=0
global detectorY:=0
global detectorColor:=0x000000
global shakeMouseEnabled:=false
global lastWindowId:=0
global lastX:=0
global lastY:=0
global currentDisplay:=1


!Esc::
	file:=A_ScriptDir . "\" . A_ScriptName
	tooltip(file)
	Run % file, , , processId
Return
Capslock & /::
	;Debug
Return
Capslock & \::ExitApp

Capslock & LButton::
	Send ^#{Left}
	Send {Ctrl up}
Return

Capslock & RButton::
	Send ^#{Right}
	Send {Ctrl up}
Return
Capslock & e::
	Send {Volume_up}
Return
Capslock & r::
	copy()
	Process, Close, nircmd.exe
	runCommand("nircmd speak text ~$clipboard$ 3")
Return
copy(){
	Send,^c
	Send,^c
	tooltip(clipboard)
	ClipWait
}
Capslock & d::
	Send {Volume_down}
Return
;Toggle main display
Capslock & g::
	currentDisplay := currentDisplay == 1 ? 2 : 1
	runCommand("nircmd setprimarydisplay " . currentDisplay)
Return
Capslock & t::
	SoundSet, +1, , mute
Return
;Always on top
Capslock & a::  
	Winset, Alwaysontop, , A
	beep()
Return
;Streamer mode
Capslock & s::
	untapButtons()
	runCommand("nircmd setdefaultsounddevice ""CABLE-B Input""")
	runCommand("nircmd setdefaultsounddevice ""CABLE Output"" 1")
Return
;Headset mode
Capslock & q::
	untapButtons()
	Run cmd /c "nircmd" setdefaultsounddevice Headset
	runCommand("nircmd setdefaultsounddevice ""Headset Microphone"" 1")
Return
;Amplifier mode
Capslock & w::
	untapButtons()
	Run cmd /c "nircmd" setdefaultsounddevice Amplifier
Return
runCommand(command){
	Run cmd.exe, , , processId
	WinWait, ahk_pid %processId%
	Send %command%{enter}
	Sleep 50
	Process, Close, %processId%
}
Capslock & Up::moveMouse(0, -1)
Capslock & Down::moveMouse(0, 1)
Capslock & Left::moveMouse(-1, 0)
Capslock & Right::moveMouse(1, 0)
;Numpad5::moveMouse(0, -20)
;Numpad2::moveMouse(0, 20)
;Numpad1::moveMouse(-20, 0)
;Numpad3::moveMouse(20, 0)
;Numpad0::Click L
;NumpadDot::Click R
;NumpadEnter::Return

;Only for development========================
Capslock & 1::
	MouseGetPos x, y
	PixelGetColor, color, x, y, RGB
 	clipboard := % "c(" . x . ", " . y . ", " . color . ")"
	Send %clipboard%
return
Capslock & 2::
	Send {Space}&&{Space} 
Return 
Capslock & 4::
	MouseGetPos x, y
	clipboard := % "click(" . x . ", " . y . ")"
	Send %clipboard%
Return 
Capslock & 3::
	;Send {Right}
	Send {Space}{{}
	Send {Enter}
	Send return true
	Send {Home}
	Send {Enter}{up}
Return
;Development
Capslock & z::
	MouseGetPos x, y
	PixelGetColor, color, x, y, RGB
 	clipboard := % x . ", " . y . ", " . color
 	tooltip(clipboard)
return
Capslock & x::
	copyCoordinate()
Return
copyCoordinate(){
	MouseGetPos x, y
	clipboard := % x . ", " . y
 	tooltip(clipboard)
}
Capslock & c::
	MouseGetPos x, y
	PixelGetColor, color, x, y, RGB
 	clipboard := % color
 	tooltip(clipboard)
return

;Detect color difference
Capslock & F1::
	beep()
	MouseGetPos x, y
	PixelGetColor, color, %x%, %y%, RGB
	detectorX:=x
	detectorY:=y
	detectorColor:=color
	colorDetectorEnabled:=true
	while(colorDetectorEnabled){
		Sleep 1000
		if(!isColor(detectorX, detectorY, detectorColor)){
			beep()
		}
	}
Return

Capslock & F2::
	colorDetectorEnabled:=false
	beep()
Return


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

focusLastWindow(){
	if(lastWindowId!=0){	
		WinGet, PID, PID, A
		if(PID!=lastWindowId){
			WinActivate, ahk_pid %lastWindowId%		
			WinWait ahk_pid , lastWindowId, 3
		}
	}
}
saveLastWindow(){
	WinGet, PID, PID, A
	lastWindowId := PID
}
;Click with mouse
click(cx, cy){
	;untapMouse()
	saveLastWindow()
	saveLastCursor()
	;msgbox %cx% %cy%
	;MouseMove %cx%, %cy%
	Click %cx%, %cy%
	loadLastCursor()
	focusLastWindow()
}
move(x, y){
	saveLastCursor()
	MouseMove x, y
	loadLastCursor()
}
beep(){
	SoundBeep 200, 30
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
	beep()
}


isColor(px, py, pcolor) {
	PixelGetColor, color, %px%, %py%, RGB
	return equal(color, pcolor)<4
}
c(px, py, pcolor){
	return isColor(px, py, pcolor)
}
isColorS(px, py, pcolor, sensitivity) {
	PixelGetColor, color, %px%, %py%, RGB
	return equal(color, pcolor)<sensitivity
}

moveMouse(dx, dy){
	MouseGetPos x, y
	x:=x+dx
	y:=y+dy
	MouseMove x, y
}
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
saveLastCursor(){
	MouseGetPos x, y
	lastX := x
	lastY := y
}
loadLastCursor(){
	MouseMove lastX, lastY
}
drag(sx, sy, dx, dy){
	saveLastCursor()
	MouseMove sx, sy
	SetMouseDelay 15
	MouseClickDrag, Left, sx, sy, dx, dy
	SetMouseDelay -1
	loadLastCursor()
}
untapButtons(){
	Send {LShift Up}{LCtrl Up}{LAlt Up}{LWin up}
	Send {RAlt Up}{LWin Up}{RCtrl Up}{RShift Up}
	untapMouse()
}
untapMouse(){
	If GetKeyState("LButton", "P") {
   		Click, Up, Left
	}
	If GetKeyState("RButton", "P") {
   		Click, Up, Right
	}
}

;Wait for pixel to match exact color
pixelWait(x, y, color){
	pixelWaitTime(x, y, color, 1000)
}
pixelWaitTime(x, y, color, wait){
	pixelWait:=0
	wait:=wait/30
	Loop {
		if(c(x, y, color))
			break
		pixelWait++
		if(pixelWait>=wait){
			break
		}
	}
}
pixelWaitNot(x, y, color){
	pixelWaitNotTime(x, y, color, 1000)
}
pixelWaitNotTime(x, y, color, wait){
	pixelWait:=0
	wait:=wait/30
	Loop {
		if(!c(x, y, color))
			break
		pixelWait++
		if(pixelWait>=wait){
			break
		}
	}
}
waitClick(x, y, color){
	pixelWait(x, y, color)
	clickWhen(x, y, color, 0, 0)
}
clickWait(x, y, color){
	click(x, y)
	pixelWait(x, y, color)
}
tooltip(message){
	ToolTip %message%
	settimer, clearTooltip, -1000
}
clearTooltip:
	Tooltip
Return
closeThreads(threadTotal, prefix){
	DetectHiddenWindows, On
	try {
		total := threadTotal+0
		Loop %total% {
			file:=a_scriptdir . "\" . prefix . A_Index . ".ahk"
			tooltip(file)
			WinClose, %file% ahk_class AutoHotkey
		}
	} catch e {
	}
}
closeThread(fileName){
	file:=a_scriptdir . "\" . fileName . ".ahk"
	tooltip(file)
	WinClose, %file% ahk_class AutoHotkey
}
runThread(fileName){
	file:=fileName . ".ahk"
	tooltip(file)
	Run % file, , , processId
}
runThreads(threadTotal, prefix){
	DetectHiddenWindows, On 
	total := threadTotal+0
	Loop %total% {
		try {
			file:=prefix . A_Index . ".ahk"
			tooltip(file)
			Run % file, , , processId
		} catch e {
		}
	}
}