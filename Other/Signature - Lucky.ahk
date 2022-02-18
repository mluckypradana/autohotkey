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
	scale:=0.24
	initX:=348*scale
	initY:=445*scale
	delay = 10
}

;Draw
Numpad0::
	init()
	click Down
	draw(346, 420)
	draw(338, 401)
	draw(326, 383)
	draw(309, 375)
	draw(272, 380)
	draw(257, 396)
	draw(243, 435)
	draw(241, 470)
	draw(244, 500)
	draw(249, 522)
	draw(261, 558)
	draw(269, 583)
	draw(283, 612)
	draw(285, 565)
	draw(288, 541)
	draw(290, 530)
	draw(294, 528)
	draw(300, 528)
	draw(310, 536)
	draw(322, 554)
	draw(336, 589)
	draw(347, 568)
	draw(351, 562)
	draw(358, 557)
	draw(364, 558)
	draw(366, 570)
	draw(367, 579)
	draw(372, 583)
	draw(379, 583)
	draw(395, 571)
	draw(391, 576)
	draw(389, 587)
	draw(402, 592)
	draw(409, 580)
	draw(406, 600)
	draw(407, 610)
	draw(416, 596)
	draw(426, 588)
	draw(432, 586)
	draw(437, 574)
	draw(445, 591)
	draw(447, 599)
	draw(452, 600)
	draw(458, 593)
	draw(465, 569)
	draw(471, 544)
	draw(474, 542)
	draw(481, 551)
	draw(490, 580)
	draw(486, 631)
	draw(477, 669)
	draw(459, 711)
	draw(442, 731)
	draw(421, 736)
	draw(402, 733)
	draw(386, 722)
	draw(379, 710)
	draw(379, 696)
	draw(390, 684)
	draw(437, 643)
	draw(504, 574)
	draw(540, 525)
	draw(573, 470)
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