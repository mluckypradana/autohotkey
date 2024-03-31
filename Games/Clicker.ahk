
global clickerEnabled:=false
global xSource := 0
global ySource := 0
global xRand1 := 0
global xRand2 := 0
global yRand1 := 0
global yRand2 := 0
global speed :=1

!p::
	ExitApp
Return
XButton1::msgbox xbutton1


;Regular click
~$XButton2::
	;Soundbeep 350, 100
	;clickerEnabled:=true
	;while(clickerEnabled){
	while(GetKeyState("XButton2", "P")) {
		Click
		Sleep % speed
	}
Return

;Stop
!s::
	;Soundbeep 350, 100
	clickerEnabled:=false
Return

!2::
	if(speed>0)
		speed := speed - 100
Return
!1::
	speed := speed + 100
Return

;Define source
!z::
	Soundbeep 350, 100
	MouseGetPos x, y
	xSource := x
	ySource := y
Return

;First random
!q::
	Soundbeep 350, 100
	MouseGetPos x, y
	xRand1 := x
	yRand1 := y
Return

;Last random
!w::
	Soundbeep 350, 100
	MouseGetPos x, y
	xRand2 := x
	yRand2 := y
Return

rangeInvalid(){
	return xRand1==0||yRand1==0||xRand2==0||yRand2==0
}

;Random click
!e::
	Soundbeep 350, 100
	if(rangeInvalid()){
		Soundbeep 350, 100
		Return	
	}
	clickerEnabled:=true
	While(clickerEnabled){
		Random, xRand, xRand1, xRand2
		Random, yRand, yRand1, yRand2
		Click %xRand% %yRand%
	}
Return
;Random move
!d::
	Soundbeep 350, 100
	if(rangeInvalid()){
		Soundbeep 350, 100
		Return	
	}
	clickerEnabled:=true
	While(clickerEnabled){
		Random, xRand, xRand1, xRand2
		Random, yRand, yRand1, yRand2
		MouseMove %xRand%, %yRand%
	}
Return
;Random swipe

;Random move
!x::
	Soundbeep 350, 100
	if(rangeInvalid()){
		Soundbeep 350, 100
		Return	
	}
	clickerEnabled:=true
	While(clickerEnabled){
		Random, xRand, xRand1, xRand2
		Random, yRand, yRand1, yRand2
		Random, ra, 1, 6
		if(ra==1)
			MouseClickDrag, L, %xSource%, %ySource%, %xRand%, %yRand%
		else
			Click %xRand% %yRand%

	}
Return
#Include ../___Basic.ahk