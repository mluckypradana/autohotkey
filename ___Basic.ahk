#NoEnv
SetWorkingDir %A_ScriptDir%
#SingleInstance force
CoordMode, Mouse, Screen
CoordMode, Tooltip, Screen
CoordMode, Pixel, Screen
SetCapsLockState, AlwaysOff
SetNumLockState, AlwaysOn
setmousedelay -1
setkeydelay -1

global actualScreenX:=1920
global actualScreenY:=1080
global volumeMuted:=false
global detectorX:=0
global detectorY:=0
global detectorColor:=0x000000
global shakeMouseEnabled:=false
global currentDisplay:=1
global currentDesktop:=1
!Esc::
	file:=A_ScriptDir . "\" . A_ScriptName
	tooltip(file)
	Run % file, , , processId
Return
;Shutdown PC
Pause::
	tooltip("Shutting down")
	runCommand("shutdown /s /f")
Return
Capslock & q::LButton
Capslock & w::RButton
Capslock & e::Click WheelUp
Capslock & d::Click WheelDown
;Hide cursor
ScrollLock::
	runCommand("sc config ""Capability Access Manager Service"" start=disabled")
	runCommand("sc stop ""Capability Access Manager Service""")
Return
Capslock & /::
	;Debug
Return
Capslock & \::ExitApp

Capslock & LButton::
	prevDesktop()
Return
prevDesktop(){
	Send ^#{Left}
	Send {Ctrl up}{Window up}
	SetCapsLockState, AlwaysOff
	global currentWindow:=1
}
Capslock & RButton::
	nextDesktop()
Return
nextDesktop(){
	Send ^#{Right}
	Send {Ctrl up}{Window up}
	SetCapsLockState, AlwaysOff
	global currentWindow:=1
}
Capslock & WheelDown::
	Send #{Up}
	Sleep 25
	Send #{Left}
Return
Capslock & WheelUp::
	Send #{Up}
	Sleep 25
	Send #{Right}
Return
Capslock & F1::
	prevDesktop()
	prevDesktop()
	currentDesktop:=1
Return

Capslock & F2::
		prevDesktop()
		prevDesktop()
		prevDesktop()
		nextDesktop()
	currentDesktop:=2
Return
Capslock & F3::
	nextDesktop()
	nextDesktop()
	currentDesktop:=3
Return
Capslock & r::Volume_up
Capslock & f::Volume_down

copy(){
	Send,^c
	Send,^c
	tooltip(clipboard)
	ClipWait
}
;Toggle main display
Capslock & y::
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
	runCommand("nircmd setdefaultsounddevice ""VoiceMeeter Output""{ENTER}nircmd setdefaultsounddevice ""VoiceMeeter Input"" 1")
Return
;Headset mode
Capslock & Up::moveMouse(0, -1)
Capslock & Down::moveMouse(0, 1)
Capslock & Left::moveMouse(-1, 0)
Capslock & Right::moveMouse(1, 0)
Capslock & v::
	WinGet, TransLevel, Transparent, A
	If (TransLevel = 150) {
		WinSet, Transparent, OFF, A
	} Else {
		WinSet, Transparent, 150, A
	}
Return
;Numpad5::moveMouse(0, -20)
;Numpad2::moveMouse(0, 20)
;Numpad1::moveMouse(-20, 0)
;Numpad3::moveMouse(20, 0)
;Numpad0::Click L
;NumpadDot::Click R
;NumpadEnter::Return

;Only for development========================
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
Capslock & c::
	MouseGetPos x, y
	PixelGetColor, color, x, y, RGB
 	clipboard := % color
 	splitRgbColor(color, red, green, blue)
 	code:=blackGrayWhite(red, green, blue)
 	tooltip(clipboard . ", " . red . " " . green . " " . blue . ", " . code)
return

blackGrayWhite(red, green, blue){
	totalColor := red + green + blue
	color := 0
	if(red>170 && green>170 && blue>170)
		color := 9
	else if(red>170 && red>green && red> blue)
		color :=3
	else if(green>170 && green>red && green> blue)
		color :=4
	else if(blue>170 && blue>red && blue> green)
		color :=5
	else if (totalColor >255)
    	color := 1
	return color
}
splitRgbColor(RGBColor, ByRef Red, ByRef Green, ByRef Blue){
    Red := RGBColor >> 16 & 0xFF
    Green := RGBColor >> 8 & 0xFF
    Blue := RGBColor & 0xFF
}
;Write date
:R*?:~d::
	FormatTime, CurrentDateTime,, yyyyMMdd
	SendInput %CurrentDateTime%
return
;Run google chrome
Capslock & g::
	if WinExist("ahk_exe chrome.exe") {
	  WinActivate
	  ControlFocus, Chrome_AutocompleteEditView1
	  }
	else
	Run, C:\Program Files\Google\Chrome\Application\chrome.exe
Return
Capslock & h::
	saveLastWindow()
	if WinExist("ahk_exe chrome.exe") {
	  WinActivate
	  ControlFocus, Chrome_AutocompleteEditView1
		Send {Left}
	}
	focusLastWindow()
Return

:*?:h2::haha
:*?:h3::hahaha
:*?:w2::wkwk
:*?:w3::wkwkw
:*?:ap2::apa-apa
:*?:/==::==================================
!`::Send 241112
;Mouse function on 
;=========================
#Include ___Functions.ahk
#Include __Emojis.ahk
;#Include C:\Storage\Other\Hotkeys\___2nd Keyboard.ahk
