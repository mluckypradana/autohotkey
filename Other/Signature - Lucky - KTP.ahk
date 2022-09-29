#Include ../___Functions.ahk
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
	scale:=0.54
	initX:=1415*scale
	initY:=438*scale
	delay = 10
}

;Draw
Numpad0::
	init()
	click Down
	draw(1411, 386)
	draw(1387, 332)
	draw(1333, 316)
	draw(1308, 327)
	draw(1277, 372)
	draw(1265, 419)
	draw(1262, 550)
	draw(1264, 675)
	draw(1275, 588)
	draw(1288, 560)
	draw(1311, 543)
	draw(1321, 540)
	draw(1331, 548)
	draw(1337, 576)
	draw(1340, 600)
	draw(1356, 629)
	draw(1372, 612)
	draw(1386, 588)
	draw(1397, 620)
	draw(1396, 641)
	draw(1419, 603)
	draw(1418, 635)
	draw(1431, 648)
	draw(1451, 632)
	draw(1463, 640)
	draw(1475, 641)
	draw(1514, 588)
	draw(1534, 540)
	draw(1545, 615)
	draw(1534, 671)
	draw(1503, 755)
	draw(1456, 826)
	draw(1423, 854)
	draw(1398, 859)
	draw(1414, 827)
	draw(1583, 574)
	draw(1692, 427)
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