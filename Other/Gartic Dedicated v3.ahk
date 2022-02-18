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
global space:=7
global x1:=0
global y1:=0
global x2:=0
global y2:=0
global paintColor:=-1
global stop:=true
global mouseX:=0
global mouseY:=0
global scaleDraw:=1.0
global initX:=0
global initY:=0
global delaySleep:=60

esc::ExitApp
;#if (getKeyState("F23", "P"))
;F23::return
!a::click(433, 285) ;Pencil
!x::click(428, 401) ;Line
!c::click(470, 364)
!b::click(473, 404)
!n::
	click(383, 442)
	pixelWait(666, 363, 0x007AFF)
	click(847, 713)
Return
!g::
	MouseGetPos x, y
	PixelGetColor, color, %x%, %y%, RGB
	splitRgbColor(color, red, green, blue)
	pickColor(red, green, blue)
	click(473, 404)
Return
pickColor(red, green, blue){
	click(482, 719)
	Sleep 100
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
			colorCode := blackGrayWhite(red, green, blue)
			if(colorCode < 9){
				xDraw := xStart + (x-x1)
				yDraw := yStart + (y-y1)
				if(paintColor != colorCode) {
					if(colorCode == 0)
						useBlack()
					else if(colorCode == 1)
						useGray()
					if(0==0){
						 if(colorCode == 3)
							useRed()
						else if(colorCode == 4)
							useGreen()
						else if(colorCode == 5)
							useBlue()
						else if(colorCode == 6)
							useYellow()
						else if(colorCode == 7)
							useCyan()
						else if(colorCode == 8)
							useMagenta()
					}
					paintColor := colorCode
				}
				MouseClick Left, %xDraw%, %yDraw%
			}
			x := x + space
		}
		y := y + space
	}
Return
useBlack(){
	MouseClick Left, 423, 532
}
useGray(){
	MouseClick Left, 455, 566
}
useRed(){
	MouseClick Left, 448, 622
}
useGreen(){
	MouseClick Left, 428, 617
}
useBlue(){
	MouseClick Left, 482, 539
}
useYellow(){
	MouseClick Left, 432, 679
}
useCyan(){
	MouseClick Left, 481, 565
}
useMagenta(){
	MouseClick Left, 459, 673
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


;Draw-----------------------------------------------------;


!+d::
	scaleDraw:=1
Return
!^d::
	scaleDraw:=scaleDraw-0.2
Return

;Trace
!t::
	copyCoordinate()
	Send ^{v}
	Send {down}{left}
Return

init(){
	MouseGetPos x, y
	mouseX := x
	mouseY := y
	initX:=1323*scaleDraw
	initY:=391*scaleDraw
}


draw(x, y){
	x := x*scaleDraw
	y := y*scaleDraw
	finalX := mouseX + x - initX
	finalY := mouseY + y - initY
	MouseMove finalX, finalY
	Sleep delaySleep
}

;Draw
!d::
	init()
	;Head
	click Down
	draw(1325, 390)
	draw(1363, 396)
	draw(1388, 426)
	draw(1397, 466)
	draw(1397, 493)
	draw(1381, 546)
	draw(1339, 570)
	draw(1309, 568)
	draw(1267, 544)
	draw(1254, 501)
	draw(1249, 470)
	draw(1256, 443)
	draw(1271, 414)
	draw(1292, 396)
	draw(1307, 392)
	draw(1327, 389)
	click Up
	
	;Body
	draw(1338, 569)
	click Down
	draw(1338, 569)
	draw(1344, 577)
	draw(1366, 582)
	draw(1352, 631)
	draw(1355, 648)
	draw(1325, 656)
	draw(1293, 647)
	draw(1296, 629)
	draw(1281, 583)
	draw(1302, 580)
	draw(1311, 568)
	click Up

	;Hand right
	draw(1365, 585)
	click Down
	draw(1365, 585)
	draw(1383, 624)
	draw(1374, 633)
	draw(1397, 651)
	draw(1402, 645)
	draw(1415, 647)
	draw(1414, 655)
	draw(1403, 657)
	draw(1401, 651)
	draw(1403, 646)
	draw(1384, 625)
	draw(1376, 633)
	draw(1358, 611)
	click Up

	;Hand left
	draw(1285, 583)
	click Down
	draw(1285, 583)
	draw(1265, 624)
	draw(1274, 632)
	draw(1249, 653)
	draw(1244, 646)
	draw(1236, 646)
	draw(1232, 652)
	draw(1242, 657)
	draw(1249, 653)
	draw(1247, 645)
	draw(1264, 626)
	draw(1275, 633)
	draw(1292, 611)
	click Up

	;Torso
	draw(1354, 647)
	click Down
	draw(1362, 668)
	draw(1334, 680)
	draw(1315, 679)
	draw(1286, 670)
	draw(1294, 648)
	click Up

	;Leg Right
	draw(1362, 667)
	click Down
	draw(1361, 704)
	draw(1346, 708)
	draw(1346, 725)
	draw(1354, 739)
	draw(1350, 752)
	draw(1350, 761)
	draw(1381, 762)
	draw(1382, 755)
	draw(1367, 743)
	draw(1366, 740)
	draw(1370, 716)
	draw(1362, 706)
	draw(1347, 710)
	draw(1333, 678)
	click Up

	;Leg Left
	draw(1287, 668)
	click Down
	draw(1287, 706)
	draw(1303, 709)
	draw(1303, 725)
	draw(1294, 740)
	draw(1295, 745)
	draw(1300, 759)
	draw(1268, 761)
	draw(1267, 753)
	draw(1282, 745)
	draw(1284, 740)
	draw(1279, 726)
	draw(1280, 713)
	draw(1286, 706)
	draw(1301, 709)
	draw(1318, 679)
	click Up

	;Ear right
	draw(1397, 505)
	click Down
	draw(1405, 506)
	draw(1404, 524)
	draw(1397, 535)
	draw(1384, 539)
	click Up

	;Ear left
	draw(1253, 502)
	click Down
	draw(1246, 505)
	draw(1245, 523)
	draw(1256, 536)
	draw(1264, 538)
	click Up
return




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