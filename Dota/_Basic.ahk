SetCapsLockState, AlwaysOff

SetMouseDelay -1
global centerX:=674
global centerY:=388

;Essential
global Radiant:=true
global active:=false
global courierDetector:=false

;Skill
skill1X:=621
skill2X:=668
skill3X:=716
skill4X:=759
skillY:=691

;Slot item
global slot1X:=829
global slot2X:=870
global slot3X:=916
global slot1Y:=674
global slot2Y:=706

;Center screen
global mid1X:=680-14
global mid2X:=680+14
global mid1Y:=382-14
global mid2Y:=382+20

;Middle map
global pos1X:=27
global pos1Y:=613
global pos2X:=94
global pos2Y:=672
global pos3X:=174
global pos3Y:=721

;Tower dire
global td1X:=37
global td1Y:=595
global td2X:=105
global td2Y:=667
global td3X:=175
global td3Y:=694
global td4X:=91
global td4Y:=594
global td5X:=128
global td5Y:=646
global td6X:=173
global td6Y:=667
global td7X:=137
global td7Y:=591
global td8X:=151
global td8Y:=624
global td9X:=179
global td9Y:=634

;Tower radiant
global tr1X:=25
global tr1Y:=640
global tr2X:=85
global tr2Y:=684
global tr3X:=169
global tr3Y:=742
global tr4X:=25
global tr4Y:=675
global tr5X:=59
global tr5Y:=700
global tr6X:=107
global tr6Y:=748
global tr7X:=21
global tr7Y:=708
global tr8X:=48
global tr8Y:=718
global tr9X:=59
global tr9Y:=747

CapsLock::
  state := GetKeyState("Capslock", "T")
  if state
    SetCapsLockState, AlwaysOff
  else
    SetCapsLockState, AlwaysOn
return

!s::Suspend

;Alert skills-----------------------------------------
MButton & q::
	SendEvent {Alt up}{Shift up}{Ctrl up}
	Send {Click L}
	Sleep 25
	altClick(621, 691)
	Send {F1}
Return
MButton & w::
	SendEvent {Alt up}{Shift up}{Ctrl up}
	Send {Click L}
	Sleep 25
	altClick(668, 691)
	Send {F1}
Return
MButton & e::
	SendEvent {Alt up}{Shift up}{Ctrl up}
	Send {Click L}
	Sleep 25
	altClick(716, 691)
	Send {F1}
Return
MButton & r::
	SendEvent {Alt up}{Shift up}{Ctrl up}
	Send {Click L}
	Sleep 25
	altClick(759, 691)
	Send {F1}
Return
;Alert item -------------------------------------------
MButton & z::
	altClick(slot1X, slot1Y)
Return
MButton & x::
	altClick(slot2X, slot1Y)
Return
MButton & c::
	altClick(slot3X, slot1Y)
Return
MButton & v::
	altClick(slot1X, slot2Y)
Return
MButton & b::
	altClick(slot2X, slot2Y)
Return
MButton & n::
	altClick(slot3X, slot2Y)
Return
;Alert stats--------------------------------------------
;Alert level
MButton & a::
	SendEvent {Alt up}{Shift up}{Ctrl up}
	Send {Click L}
	Sleep 25
	altClick(445, 740)
	Send {F1}
Return
;Alert health
MButton & s::
	SendEvent {Alt up}{Shift up}{Ctrl up}
	Send {Click L}
	Sleep 25
	altClick(676, 730)
	Send {F1}
Return
;Alert buyback
MButton & d::
	SendEvent {Alt up}{Shift up}{Ctrl up}
	Send {Click L}
	Sleep 25
	altClick(1230, 744)
	Send {F1}
Return
;Buy Status---------------------------------------------
!+a::
	altClick(1200, 710)
Return

;Missing------------------------------------------------
MButton & `::
	Radiant:=!Radiant
	SoundBeep, 450, 100  
	if(!Radiant)
		SoundBeep, 450, 100
Return
MButton & 1::
	if(!Radiant)
		altClick(407, 15)
	else
		altCLick(780, 15)
Return
MButton & 2::
	if(!Radiant)
		altClick(450, 15)
	else
		altCLick(823, 15)
Return
MButton & 3::
	if(!Radiant)
		altClick(496, 15)
	else
		altCLick(871, 15)
Return
MButton & 4:: 
	if(!Radiant)
		altClick(544, 15)
	else
		altCLick(913, 15)
Return
MButton & 5::
	if(!Radiant)
		altClick(585, 15)
	else
		altCLick(959, 15)
Return

;Shop basic tab-------------------------------------------------
!+1::
	openShop()
	MouseGetPos, x, y
	Click 1209, 82
	MouseMove, x, y
Return
;Shop advanced tab
!+2::
	openShop()
	MouseGetPos, x, y
	Click 1295, 82
	MouseMove, x, y
Return
;Deliver
!+3::
	SendEvent {Alt up}{Shift up}{Ctrl up}
	Send +{F3}
	Sleep 100
	Send {F2}
	Sleep 100
	Send +{q}
	Sleep 50
	Send {F1}t
Return
;Shop query
!+4::
	MouseGetPos, x, y
	openShop()
	;Sleep 100
;	Mouseclickdrag left, 1346, 56, 1200, 56
	Click 1346, 56
	Sleep 80
	Click 1346, 56
	Sleep 80
	Click 1346, 56
;	MouseMove 1158, 100
	MouseMove %x%, %y%
Return

;Sendcouriertosecretshop
!+5::
	SendEvent {Alt up}{Shift up}{Ctrl up}
	Send {F2}
	Sleep 100
	Send +{w}
	Sleep 50
	Send {F1}t
Return

;drop item-------------------------------------------------
^!q::
	dropItem(slot1X, slot1Y)
Return
^!w::
	dropItem(slot2X, slot1Y)
Return
^!e::
	dropItem(slot3X, slot1Y)
Return
^!a::
	dropItem(slot1X, slot2Y)
Return
^!s::
	dropItem(slot2X, slot2Y)
Return
^!d::
	dropItem(slot3X, slot2Y)
Return

recenter(){
	Send ss
	Send {F1}
	Send {F1}	
}

dropItem(px, py){
	MouseGetPos, x, y
	recenter()
	setmousedelay -1
	mouseMove %px%, %py%
	setmousedelay 5
	MouseClickDrag, left, %px%, %py%, %centerX%, %centerY%
	setmousedelay -1
	MouseMove, x, y
}

;Click backpack 1
^!1::
	Click, up
	Click, 824, 750, down
	MouseMove 857, 703
Return
;Click backpack 2
^!2::
	Click, up
	Click, 873, 750, down
	MouseMove 857, 703
Return
;Click backpack 3
^!3::
	Click, up
	Click, 920, 750, down
	MouseMove 857, 703
Return

;Shop ward
!+w::
	buyWard()
Return
buyWard(){
	openShop()
	Sleep 200
	MouseGetPos, x, y
	Click 1163, 533, R
	MouseMove %x%, %y%
	Sleep 200
	closeShop()
}
;Shop sentry
!+e::
	openShop()
	MouseGetPos, x, y
	Click 1198, 533, R
	MouseMove %x%, %y%
	closeShop()
Return

;Shop smoke
!+s::
	openShop()
	MouseGetPos, x, y
	Click 1233, 533, R
	MouseMove %x%, %y%
	closeShop()
Return

;Shop dust
!+d::
	openShop()
	MouseGetPos, x, y
	Click 1266, 533, R
	MouseMove %x%, %y%
	closeShop()
Return

;Shop clarity
!+t::
	openShop()
	MouseGetPos, x, y
	Click 1209, 82
	Click 1175, 109, R
	MouseMove %x%, %y%
	closeShop()
Return

;Shop courier
!+c::
	openShop()
	MouseGetPos, x, y
	Click 1209, 82
	Click 1177, 362, R
	MouseMove %x%, %y%
	closeShop()
Return

shopOpened(){
	PixelGetColor, color, 1320, 50
	return (color==0x000000)
}
openShop() {
	if (!shopOpened())
		Send {F4}
	Sleep 50
}
closeShop() {
	Send {F4}
}

^'::
	active:=false
	courierDetector:=false
	Soundbeep 450,100
Return

;Timers------------------------------------------------------
;Support only
^+`::
	active:=true
	while(true){
		IfWinActive, Dota 2
		{
			SoundBeep 450, 100
			buyWard()
		}else{
			Return
		}
		Sleep 150000
	}
Return

;Stacking
^+1::
	Soundbeep 550, 100
	active:=true
	while (active){
		SoundBeep 450, 100
		Sleep 29800
	}
Return

;Timer rune
^+2::
	Soundbeep 550, 100
	active:=true
	while (active){
		SoundBeep 550, 100
		Sleep 119900
	}
Return
;Roshan
^+3::
	Soundbeep 550, 100
	active:=true
	while (active){
		SoundBeep 750, 100
		Sleep 599900
	}
Return

;Autoclick right
^+4::
	
	Loop 51{
		SendEvent {Click, R}
	}
Return

;Courier detector
^+5::
	Soundbeep 550, 100
	courierDetector:=true
	while(courierDetector){
		PixelSearch, Px, Py, 11, 579, 190, 758, 0xffffff, 0, Fast
		If !ErrorLevel{
			Soundbeep 700, 100
			altClick(Px, Py)
			Sleep 3000	
		}
		Sleep 200
	}
Return


;Map
Capslock & 1::
	MouseGetPos x, y
	MouseMove pos1X, pos1Y
	Sleep 50
	Click pos1X, pos1Y
	Sleep 50
	MouseMove x, y
Return

;Map
Capslock & 2::
	MouseGetPos x, y
	MouseMove pos2X, pos2Y
	Sleep 50
	Click pos2X, pos2Y
	Sleep 50
	MouseMove x, y
Return

;Map
Capslock & 3::
	MouseGetPos x, y
	MouseMove pos3X, pos3Y
	Sleep 50
	Click pos3X, pos3Y
	Sleep 50
	MouseMove x, y
Return

;Tower Dire 1
Capslock & q::
	if(Radiant){
		x = %tr1X%
		y = %tr1Y%
	}
	else{
		x = %td1X%
		y = %td1Y%
	}
	showMap(x, y)
Return

;Tower Dire 2
Capslock & w::
	if(Radiant){
		x = %tr2X%
		y = %tr2Y%
	}
	else{
		x = %td2X%
		y = %td2Y%
	}
	showMap(x, y)
Return

;Tower Dire 3
Capslock & e::
	if(Radiant){
		x = %tr3X%
		y = %tr3Y%
	}
	else{
		x = %td3X%
		y = %td3Y%
	}
	showMap(x, y)
Return

;Tower Dire 4
Capslock & a::
	if(Radiant){
		x = %tr4X%
		y = %tr4Y%
	}
	else{
		x = %td4X%
		y = %td4Y%
	}
	showMap(x, y)
Return

;Tower Dire 5
Capslock & s::
	if(Radiant){
		x = %tr5X%
		y = %tr5Y%
	}
	else{
		x = %td5X%
		y = %td5Y%
	}
	showMap(x, y)
Return

;Tower Dire 6
Capslock & d::
	if(Radiant){
		x = %tr6X%
		y = %tr6Y%
	}
	else{
		x = %td6X%
		y = %td6Y%
	}
	showMap(x, y)
Return

;Tower Dire 7
Capslock & z::
	if(Radiant){
		x = %tr7X%
		y = %tr7Y%
	}
	else{
		x = %td7X%
		y = %td7Y%
	}
	showMap(x, y)
Return

;Tower Dire 8
Capslock & x::
	if(Radiant){
		x = %tr8X%
		y = %tr8Y%
	}
	else{
		x = %td8X%
		y = %td8Y%
	}
	showMap(x, y)
Return

;Tower Dire 9
Capslock & c::
	if(Radiant){
		x = %tr9X%
		y = %tr9Y%
	}
	else{
		x = %td9X%
		y = %td9Y%
	}
	showMap(x, y)
Return
;Hover----------------------------------------------------------------
^+z::
	MouseGetPos x, y
	MouseMove %slot1X%, %slot1Y%
	Keywait z
	MouseMove x, y
Return
^+x::
	MouseGetPos x, y
	MouseMove %slot2X%, %slot1Y%
	Keywait x
	MouseMove x, y
Return
^+c::
	MouseGetPos x, y
	MouseMove %slot3X%, %slot1Y%
	Keywait c
	MouseMove x, y
Return
^+v::
	MouseGetPos x, y
	MouseMove %slot1X%, %slot1Y%
	Keywait v
	MouseMove x, y
Return
^+b::
	MouseGetPos x, y
	MouseMove %slot1X%, %slot1Y%
	Keywait b
	MouseMove x, y
Return
^+n::
	MouseGetPos x, y
	MouseMove %slot1X%, %slot1Y%
	Keywait n
	MouseMove x, y
Return
^+q::
	MouseGetPos x, y
	MouseMove %skill1X%, %skillY%
	Keywait q
	MouseMove x, y
Return
^+w::
	MouseGetPos x, y
	MouseMove %skill2X%, %skillY%
	Keywait w
	MouseMove x, y
Return
^+e::
	MouseGetPos x, y
	MouseMove %skill3X%, %skillY%
	Keywait e
	MouseMove x, y
Return
^+r::
	MouseGetPos x, y
	MouseMove %skill4X%, %skillY%
	Keywait r
	MouseMove x, y
Return

;Optional message------------------------------------------------
::zu::
	Send {Enter}
	Sleep 100
	Send Zeus ultimate now
	Send {Enter}
Return

::ok::
	Send {Enter}
	Sleep 100
	Send Okay
	Sleep 100
	Send {Enter}
Return

::co::Commendation submitted: Thank you for helping to improve the Dota 2 community.
::re::Report submitted: Thank you for helping to improve the Dota 2 community.
::tc::Thanks, commend 


showMap(px, py){
	MouseGetPos x, y
	tX = %px%
	tY = %py%
	MouseMove tX, tY
	Sleep 50
	Click tX, tY
	Sleep 50
	MouseMove x, y
}


altClick(px, py){
	MouseGetPos, x, y
	SendEvent {Alt up}{Shift up}{Ctrl up}
	SendEvent {Alt down}
	Sleep 50
	Click %px%, %py%
	Sleep 50
	SendEvent {Alt up}
	MouseMove, x, y
	Setkeydelay -1
}