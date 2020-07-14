;#if WinActive("ahk_exe Bluestacks.exe")
#SingleInstance force
setmousedelay -1
setkeydelay -1
active:=true
hasEnemy:=false

!h::
	WinGet, winid
MsgBox, winid=%winid%
;do some stuff
WinActivate ahk_pid %winid%
Return

;Escape::
;	ExitApp
;Return

;!s::Suspend

equal( c1, c2 ) ; find the distance between 2 colors
{ ; function by [VxE], return value range = [0, 441.67295593006372]
; that just means that any two colors will have a distance less than 442
   r1 := c1 >> 16
   g1 := c1 >> 8 & 255
   b1 := c1 & 255
   r2 := c2 >> 16
   g2 := c2 >> 8 & 255
   b2 := c2 & 255
   return Sqrt( (r1-r2)**2 + (g1-g2)**2 + (b1-b2)**2 )
}

^+1::
	Send mluckypradana@gmail.com
Return
;Allpasswords
^+q::
	Send januariMoonton
Return
^+2::
	Send luckypradana32@gmail.com
Return
^+3::
	Send venmupsg@gmail.com
Return
^+4::
	Send ron88idn@gmail.com ;idron88123
Return
^+5::
	Send maleskuliahid@gmail.com ;jujuku11
Return
^+6::
	Send iqueue4@gmail.com
Return
^+7::
	Send bgsprg@gmail.com
Return
^+e::
	Send Gembl0n9302
Return

!c::
	follow()
	Sleep 100
	commendEveryone()
Return

!v::
	follow()
Return


;Watch ads
!'::
	active:=false
	SoundBeep 350, 100
Return
!/::
	active:=true
	SoundBeep 350, 100
	while(active){
		;[Done] Get gold chest
		if(clickWhen(618, 345, 0xFF3E4D, 581, 373)) {
			Sleep 1000
			continue
		}
		;[Done] Get free chest
		if(clickWhen(615, 449, 0xFF354E, 580, 477)) {
			Sleep 1000
			continue
		}
		;Claim all activity
		if(clickWhen(1380, 275, 0xDBA16A, 0, 0)){
			Sleep 3000	
			continue
		}
		;Claim chess
		if(clickWhen(1413, 328, 0xAB835D, 1359, 317))
			continue
		;Watch video
		if(clickWhen(1449, 287, 0x84CEFE, 0, 0)){
			Sleep 500
			click(1449, 287)
			Sleep 5000
		}
		;Close diamond dialog
		if(clickWhen(899, 733, 0x879AFC, 1380, 319))
			continue
		;Receive reward
		if(clickWhen(959, 746, 0xD99F69, 959, 746)){
			Sleep 500
		}
		;Receive usable reward
		clickWhen(718, 744, 0xA8825C, 718, 744)
		;Enter game
		clickWhen(1053, 728, 0xBE9D64, 1053, 728)
		;Send Agate
		if(clickWhen(724, 519, 0xF54789, 1153, 644)){
			Sleep 200
			click(1084, 671)
			Sleep 2000
			continue
		}

		;Force like
		if(clickWhen(1203, 798, 0x88A9FD, 0, 0)){
			Sleep 1000
			continue
		}
		;Force like profile
		if(clickWhen(1176, 325, 0x3D3D3D, -1, -1)){
			PixelGetColor, color, 1443, 621, RGB
			If (equal(color, 0x274071)<4){
				click(1442, 621)
				Sleep 1000
			}
			continue
		}
	}
Return

!+d::	
	;Claim chess
Return

;Ignore invite
!a::
	click(839, 683)
	click(841, 610)
	Sleep 300
	click(768, 549)
	click(955, 675)
Return

;Buy roam item
!f::
click(1464, 24)
Sleep 100
click(485, 722)
Sleep 100
click(810, 326)
Sleep 100
click(1233, 542)
Sleep 100
click(1377, 821)
Sleep 100
click(484, 345)
Sleep 100
click(1462, 271)
Return



;Prioritize 
!g::
click(1465, 23)
Sleep 100
click(475, 407)
Sleep 100
click(804, 638)
Sleep 100
click(1394, 454)
Sleep 100
click(1405, 353)
Sleep 100
click(483, 350)
Sleep 100
click(1464, 268)
Return

;Closest target
!d::
MouseGetPos x, y
click(634, 49)
Sleep 100
click(483, 162)
Sleep 100
click(1229, 706)
Sleep 100
click(481, 23)
MouseMove x, y
Return


;Lowest HP
!s::
	click(634, 49)
	Sleep 100
	click(483, 162)
	Sleep 100
	click(953, 705)
	Sleep 100
	click(481, 23)
Return

!r::
	;In general chat
	if(clickWhen(503, 754, 0x307BC8, 0, 0))
		Return
	;In profile dialog
	if(clickWhen(829, 582, 0x9CADD5, 0, 0))
		Return
	;In chat box
	if(clickWhen(1129, 799, 0x192C46, 0, 0))
		Return
Return

!Enter::
	if(isColor(1463, 991, 0xFFFFFF)){
		click(1195, 803)
		Sleep 200
	}
	clickWhen(1127, 800, 0x192C46, 1249, 801)
Return

;Mute
!m::
	click(956, 18)
	Sleep 100
	m1:=isColor(889, 398, 0x5BC6CE)
	m2:=isColor(881, 479, 0x5BC6CF)
	m3:=isColor(882, 570, 0x3AB2BA)
	m4:=isColor(875, 641, 0x59C5CD)
	m5:=isColor(874, 721, 0x5BC6CE)
	m6:=isColor(1023, 399, 0x59C4CD)
	m7:=isColor(1024, 479, 0x5BC6CE)
	m8:=isColor(1024, 560, 0x5AC5CE)
	m9:=isColor(1024, 640, 0x5CC6CF)
	m10:=isColor(1024, 721, 0x5BC6CE)
	if(m2)
		click(875, 478)
	if(m1)
		click(889, 398)
	if(m3)
		click(882, 570)
	if(m4)
		click(875, 641)
	if(m5)
		click(874, 721)
	if(m6)
		click(1023, 399)
	if(m7)
		click(1024, 479)
	if(m8)
		click(1024, 560)
	if(m9)
		click(1024, 640)
	if(m10)
		click(1024, 721)
	Sleep 100
	click(1474, 258)
Return

!^1::
	click(686, 593)
	Sleep 1000
	click(701, 786)
	Sleep 300
	click(484, 263)
	Sleep 500
	click(484, 263)
Return

!^2::
	click(908, 595)
	Sleep 1000
	click(701, 786)
	Sleep 100
	click(484, 263)
	Sleep 500
	click(484, 263)
	Sleep 500
	click(484, 263)
Return

!1::
	quickChatDrag(1446, 340)
Return
!2::
	quickChatDrag(1367, 265)
Return
!3::
	quickChatDrag(1340, 178)
Return
!4::
	quickChatDrag(1367, 91)
Return
!5::
	quickChatDrag(1452, 36)
Return
!t::
	thumbsUp()
Return


thumbsUp(){
	if(isColor(1467, 213, 0x9ECDE2)) {
		Click, up, right
		MouseGetPos cx, cy
		MouseMove 1469, 222
		SetMouseDelay 22
		MouseClickDrag, Left, 1469, 222, 1396, 12
		SetMouseDelay -1
		MouseMove %cx%, %cy%
		Click, down, right
	}
}

quickChatDrag(x, y){
	if(isColor(1467, 118, 0xE8B4B4)){
		Click, up, right
		MouseGetPos cx, cy
		MouseMove 1467, 118
		SetMouseDelay 22
		MouseClickDrag, Left, 1467 ,118, %x%, %y%
		SetMouseDelay -1
		MouseMove %cx%, %cy%
		Click, down, right
	}
}

click(cx, cy){
	MouseGetPos x, y
	Click %cx%, %cy%
	MouseMove x, y
}

commendEveryone(){
	Loop 2{
		click(449,432)
		click(449,716)
		click(449,501)
		click(449,648)
		click(449,576)
	}
	click(561, 426)
	click(1357, 425)
}

isColor(px, py, pcolor) {
	PixelGetColor, color, %px%, %py%, RGB
	return equal(color, pcolor)<4
}

clickWhen(px, py, pcolor, cx, cy){
	PixelGetColor, color, %px%, %py%, RGB
	If (equal(color, pcolor)<4){
		if(cx==0)
			click(px, py)
		if(cx>0)
			click(cx, cy)
		
		return true
	}
	return false
}

follow(){
	;1 (Done)
	clickWhen(613, 406, 0xC95189, 496, 422)
	clickWhen(613, 406, 0xBF4F85, 496, 422)
	;2 (Done)
	clickWhen(613, 479, 0xB14A7E, 496, 494)
	clickWhen(613, 479, 0xA9477B, 496, 494)
	;3 (Done)
	clickWhen(614, 551, 0xE55894, 496, 567)
	clickWhen(614, 551, 0xE15692, 496, 567)
	;4 (Done)
	clickWhen(614, 620, 0xCA6095, 496, 639)
	;5 (Done)
	clickWhen(613, 695, 0xB84D83, 496, 715)
	clickWhen(613, 696, 0xCF518B, 496, 715)
	;6
	clickWhen(1306, 406, 0xD05289, 1421, 430)
	clickWhen(1307, 407, 0xD8518C, 1421, 430)
	;7 
	clickWhen(1307, 475, 0xBA5685, 1423, 496)
	clickWhen(1306, 479, 0xCD4F86, 1423, 496)
	clickWhen(1306, 478, 0xD95690, 1423, 496)
	;8 (Done)
	clickWhen(1306, 551, 0xE55995, 1424, 569)
	;9 
	clickWhen(1306, 624, 0xD6518A, 1422, 641)
	;10
	clickWhen(1306, 695, 0xC34E81, 1420, 716)
	clickWhen(1306, 696, 0xD25088, 1420, 716)
}

followAll(){
	;1
	click(583, 431)
	;2
	click(582, 502)
	;3
	click(582, 577)
	;4
	click(582, 643)
	;5
	click(582, 719)

	;6
	click(1333, 426)
	;7
	click(1334, 503)
	;8
	click(1336, 575)
	;9
	click(1336, 650)
	;10
	click(1333, 718)
}