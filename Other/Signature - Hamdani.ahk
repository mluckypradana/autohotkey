;#Include ../___Basic.ahk
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
	scale:=0.5
	initX:=529*scale
	initY:=317*scale
	delay = 10
}

;Draw
!d::
	init()
	click Down
	draw(529, 317)
	draw(197, 832)
	draw(219, 650)
	draw(204, 483)
	draw(359, 497)
	draw(465, 487)
	draw(489, 470)
	draw(540, 367)
	draw(424, 512)
	draw(344, 640)
	draw(316, 706)
	draw(354, 660)
	draw(433, 568)
	draw(456, 533)
	draw(382, 640)
	draw(374, 665)
	draw(402, 654)
	draw(450, 611)
	draw(475, 574)
	draw(438, 636)
	draw(431, 665)
	draw(477, 621)
	click Up

	draw(505, 786)
	click Down
	draw(535, 769)
	draw(552, 738)
	draw(560, 700)
	draw(553, 666)
	draw(515, 574)
	draw(522, 507)
	draw(555, 443)
	draw(631, 366)
	draw(681, 341)
	draw(706, 338)
	draw(702, 384)
	draw(647, 486)
	draw(541, 616)
	draw(442, 729)
	draw(561, 616)
	draw(642, 532)
	draw(573, 620)
	draw(552, 655)
	draw(565, 663)
	draw(624, 622)
	draw(663, 570)
	draw(627, 624)
	draw(626, 636)
	draw(652, 632)
	draw(668, 628)
	draw(700, 609)
	click Up
return

;Trace
!t::
	Send !+^{2}
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