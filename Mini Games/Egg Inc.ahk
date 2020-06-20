;#IfWinactive, Nox App player

global planeColor := 0xc1984f    ;1b1a1c

SetMouseDelay, -1 ;remove delays from mouse action

active:=false

MButton & WheelUp::
	SoundBeep 550, 100
	active:=true
	while(active){
		catchPlane()
		
		closeDialog()
		dismissCollect()
	}
Return

MButton & WheelDown::
	SoundBeep 350, 100
	active:=false
	closeDialog()
	dismissCollect()
Return

MButton & LButton::
	SoundBeep 550, 100
	accChicken()
Return

MButton & RButton::
	SoundBeep 550, 100
	active:=true

	while(active){
		MouseGetPos x, y
		;Close dialog
		closeDialog()
		dismissCollect()

		;Catch plane
;		catchPlane()

		;Acc chicken
		accChicken()
	}
Return
closedialog(){
;	PixelGetColor, common, 547, 176, RGB
;	if(common==0x276EC6)
;		Return

	;Hide hen house
	PixelGetColor, color, 540, 176, RGB
	if (color==0x276EC6){
		MouseGetPos x, y
		Click 779, 174
		MouseMove x, y
	}
	

	PixelGetColor, color, 102, 149, RGB
	if (color==0x276EC6){
		MouseGetPos x, y
		Click 306, 199
		Click 306, 163
		MouseMove x, y
	}

	;Hide grain
	PixelGetColor, color, 572, 492, RGB
	if (color==0x8600C4){
		MouseGetPos x, y
		Click 751, 174
		MouseMove x, y
	}
}

dismissCollect(){
	PixelGetColor, common, 547, 176, RGB
	if(common==0x276EC6)
		Return

	MouseGetPos x, y
	PixelGetColor, color, 751, 494, RGB
	if (color==0x276EC6){
		Click 751, 494
		MouseMove x, y
	}

	PixelGetColor, color, 737, 520, RGB
	if (color==0x8600C4){
		Click 737, 520
		MouseMove x, y
	}
}

accChicken(){
	PixelGetColor, color, 691, 130, RGB
	;msgbox %color%
	if(color==0x19AC00){
		PixelGetColor, color, 662, 632, RGB
		PixelGetColor, dialog, 797, 350, RGB
		if(color==0xF00D0D && dialog!=0xFFFFFF){
			Mousegetpos x, y
			Click 0,0
			Mousemove x, y
			Sleep 6500
			Mousegetpos x, y
			Click 0,0
			Click 665, 725
			Mousemove x, y
			Sleep 1000
			Click 665, 725
			MouseClickDrag, left, 665, 350, 665, 380
			MouseClickDrag, left, 665, 350, 665, 320
		}
	}
}

catchPlane(){
	plane1:=findPlane(0xc1984f)
	plane2:=findPlane(0x66ff62)
	if(plane1||plane2){
		soundbeep 550, 100
		Sleep 2000
	}
}

findPlane(color){
	PixelSearch, Px, Py, 455, 130, 873, 611, %color%, 0, RGB, Fast
	if !ErrorLevel{
		MouseGetPos x, y
		addY:=Py+5
		Click %Px%, %Py%
		MouseMove x, y
		return true
	}
	return false
}

;debugging-----------------------------------------------------------
+e::
	soundbeep 550, 100
	MouseGetPos x, y
	PixelGetColor, color, %x%, %y%
	planeColor := color
Return

+d::
	soundbeep 550, 100
	PixelSearch, Px, Py, 0, 0, 1366, 768, %planeColor%, 0, Fast
	if !ErrorLevel{
		MouseMove %Px%, %Py%
	}
Return