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

global mouseX:=0
global mouseY:=0
global scale
global initX
global initY
global delay

init(){
	MouseGetPos x, y
	mouseX := x
	mouseY := y
	scale:=1
	initX:=1323*scale
	initY:=391*scale
	delay = 1
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

;Trace
!t::
	copyCoordinate()
	Send ^{v}
	Send {down}{left}
Return

draw(x, y){
	x := x*scale
	y := y*scale
	finalX := mouseX + x - initX
	finalY := mouseY + y - initY
	MouseMove finalX, finalY
	Sleep delay
}
#Include ../___Basic.ahk