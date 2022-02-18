#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#InstallKeybdHook
#InstallMouseHook ;<--You'll want to use this if you have scripts that use the mouse.
#UseHook On
#MaxHotkeysPerInterval 2000
#SingleInstance force
CoordMode, Mouse, Screen
CoordMode, Tooltip, Screen
CoordMode, Pixel, Screen
SetCapsLockState, AlwaysOff
SetNumLockState, AlwaysOn
setmousedelay -1
setkeydelay -1

;;The lines below are optional. Delete them if you need to.
#HotkeyModifierTimeout 60 ; https://autohotkey.com/docs/commands/_HotkeyModifierTimeout.htm
#KeyHistory 200 ; https://autohotkey.com/docs/commands/_KeyHistory.htm ; useful for debugging.
#MenuMaskKey vk07 ;https://autohotkey.com/boards/viewtopic.php?f=76&t=57683
#WinActivateForce ;https://autohotkey.com/docs/commands/_WinActivateForce.htm ;prevent taskbar flashing.

;=========================Bluestacks=========================
global space:=10
global x1:=0
global y1:=0
global x2:=0
global y2:=0
global paintColor:=-1
global stop:=true
esc::ExitApp
;#if (getKeyState("F23", "P"))
;F23::return
!a::click(185, 432)
!c::click(222, 395)
!b::click(228, 431)
;Reset brush
!r::
	click(189, 750)
	Sleep 200
	click(190, 777)
Return
!q::
	MouseGetPos x, y
	x1 := x
	y1 := y
	tooltip(x . ", " . y)
Return
!w::
	MouseGetPos x, y
	x2 := x
	y2 := y
	tooltip(x . ", " . y)
Return
!s::
	stop:=true
Return
!e::
	stop:=false
	MouseGetPos xStart, yStart
	y:=y1
	While (y < y2) {
		if(stop==true)
			Return
		x := x1
		While (x < x2) {
			if(stop==true)
				Return
			PixelGetColor, color, %x%, %y%, RGB
			splitRgbColor(color, red, green, blue)
			pickColor(red, green, blue)
			xDraw := xStart + (x-x1)
			yDraw := yStart + (y-y1)
			MouseClick Left, %xDraw%, %yDraw%
			x := x + space
		}
		y := y + space
	}
Return
pickColor(red, green, blue){
	MouseClick Left, 473, 710
	Send {tab}
	Send {tab}
	Send {tab}
	Send %red%
	Send {tab}
	Send %green%
	Send {tab}
	Send %blue%
	Sleep 100
	Send {enter}
}
useBlack(){
	MouseClick Left, 423, 537
}
useGray(){
	MouseClick Left, 455, 566
}
useRed(){
	MouseClick Left, 453, 618
}
useGreen(){
	MouseClick Left, 428, 618
}
useBlue(){
	MouseClick Left, 482, 537
}
useYellow(){
	MouseClick Left, 428, 681
}
useCyan(){
	MouseClick Left, 477, 567
}
useMagenta(){
	MouseClick Left, 206, 654
}
blackGrayWhite(red, green, blue){
	totalColor := red + green + blue
	color := 0
	if(red>170 && green>170 && blue>170)
		color := 9
	else if(red>170 && green>170 && blue<85) ;Yellow
		color :=6
	else if(red<85 && green>170 && blue>170) ;Cyan
		color :=7
	else if(red>170 && green<85 && blue>170) ;Magenta
		color :=8
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
;;================= MODIFIERS REMAPPED ======================;;

SC070::tooltip, [F23] Lshift -to-> SC070-International 2
SC071::tooltip, [F23] LCtrl -to-> SC071-Language 2
SC072::tooltip, [F23] LWin -to-> SC072-Language 1
SC073::tooltip, [F23] LAlt -to-> SC073-International 1

SC077::tooltip, [F23] RAlt -to-> SC077-Language 4
SC078::tooltip, [F23] RWin -to-> SC078-Language 3
SC079::tooltip, [F23] AppsKey -to-> SC079-International 4
SC07B::tooltip, [F23] RCtrl -to-> SC07B-International 5
SC07D::tooltip, [F23] RShift -to-> SC07D-International 3

;;================= LOCKING KEYS ======================;;

F20::tooltip, [F23] CapsLock -to-> SC06B-F20
SC05C::tooltip, [F23] NumLock -to-> SC05C-International 6
;Numlock is an AWFUL key. I prefer to leave it permanently on.
;It's been changed to International 6, so you can use it with no fear that it'll mess up your numpad.
SC061::tooltip, [F23] ScrollLock -to-> SC061 %A_thishotKey%

;;;--------------------IMPORTANT: HOW TO USE #IF THINGIES----------------------

;;You can use more than one #if thingy at a time, but it must be done like so:
#if (getKeyState("F23", "P")) and if WinActive("ahk_exe Adobe Premiere Pro.exe")
F1::msgbox, You pressed F1 on your secondary keyboard while inside of Premiere Pro

;; HOWEVER, You still would still need to block F1 using #if (getKeyState("F23", "P"))
;; If you don't, it'll pass through normally, any time Premiere is NOT active.
;; Does that make sense? I sure hope so.

#Include ../___Functions.ahk