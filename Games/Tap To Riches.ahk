;#IfWinactive, Nox App player

global allowTap:=true
global tapColor := 0x5255A5
global buyColor := 0x31A24A
global newBuyColor := 0xba8b15
global newBuyColor2 := 0xaf851c
global newBuyColor3 := 0x835f14
global newBuyColor4 := 0xbb921c
global newBuyColor5 := 0x7b5a13
global newBuyColor6 := 0xa47e17


SetMouseDelay, -1 ;remove delays from mouse action

active:=false

+`::
	active:=false
Return

+1::
	active:=true
	allowTap:=true
	while(active){
		delay:=false
		delay := buyCurrentBuilding() || delay
		delay := buyNewBuilding() || delay
		delay := businessBonus() || delay
		delay := closeDialog() || delay

		if(delay)
			sleep 400
		else
			tapRide()
	}
Return

+2::
	active:=true
	while(active){
		tapRide()
		Sleep 50
	}
Return

tapRide() {
	Click 576, 582
}

buyCurrentBuilding(){
	PixelSearch, Px, Py, 459, 104, 873, 630, %buyColor%, 0, RGB, Fast
	if !ErrorLevel{
		addedX:= Px + 60
		MouseGetPos x, y
		Click %addedX%, %Py%
		MouseMove x, y
		return true
	}
	return false
}

buyNewBuilding(){
	PixelSearch, Px, Py, 459, 104, 873, 630, %newBuyColor%, 0, RGB, Fast
	if !ErrorLevel{
		addedX:= Px + 60
		MouseGetPos x, y
		Click %addedX%, %Py%
		;MouseMove x, y
		return true
	}
	PixelSearch, Px, Py, 459, 104, 873, 630, %newBuyColor2%, 0, RGB, Fast
	if !ErrorLevel{
		addedX:= Px + 60
		MouseGetPos x, y
		Click %addedX%, %Py%
		;MouseMove x, y
		return true
	}
	PixelSearch, Px, Py, 459, 104, 873, 630, %newBuyColor3%, 0, RGB, Fast
	if !ErrorLevel{
		addedX:= Px + 60
		MouseGetPos x, y
		Click %addedX%, %Py%
		;MouseMove x, y
		return true
	}
	PixelSearch, Px, Py, 459, 104, 873, 630, %newBuyColor4%, 0, RGB, Fast
	if !ErrorLevel{
		addedX:= Px + 60
		MouseGetPos x, y
		Click %addedX%, %Py%
		;MouseMove x, y
		return true
	}
	PixelSearch, Px, Py, 459, 104, 873, 630, %newBuyColor5%, 0, RGB, Fast
	if !ErrorLevel{
		addedX:= Px + 60
		MouseGetPos x, y
		Click %addedX%, %Py%
		;MouseMove x, y
		return true
	}
	PixelSearch, Px, Py, 459, 104, 873, 630, %newBuyColor6%, 0, RGB, Fast
	if !ErrorLevel{
		addedX:= Px + 60
		MouseGetPos x, y
		Click %addedX%, %Py%
		;MouseMove x, y
		return true
	}
	return false
}

businessBonus(){
	PixelGetColor, color, 559, 128 , RGB
	if (color==0x59AD4A){
		Click 509, 126
		Sleep 3000
		Click 834, 195
		;allowTap:=false
		Send {esc}
		return true
	}
	return false
}

closeDialog(){
	PixelGetColor, color, 843, 157, RGB
	if (color==0xCE2C29){
		Click 843, 157
		return
	}

	PixelGetColor, color, 822, 190, RGB
	if (color==0xCE2C29){
		Click 822, 190
		return
	}
}

closeVideo(){
	;White
	PixelGetColor, color, 868, 48, RGB
	if (color==0xE8E8E8){
;		msgbox closing whitebox
		Sleep 1000
		Click 868, 48
		allowTap:=true
		return true
	}
	;bLACK
	PixelGetColor, color, 866, 47, RGB
	if (color==0x121212){
;		msgbox closing blackbox
		Sleep 1000
		Click 859, 53
		allowTap:=true
		return true
	}
	;Other gem
	PixelGetColor, color, 859, 53, RGB
	if (color==0x795253){
;		msgbox closing otherbox
		Sleep 1000
		Click 859, 53
		allowTap:=true
		return true
	}
	return false
}