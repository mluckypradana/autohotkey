SetMouseDelay, -1 ;remove delays from mouse action
Escape::
	ExitApp
Return

+d::
	MaxLoop := 7
	Loop %MaxLoop%{
		yEnd = 730	
		perSegment := yEnd/MaxLoop
		y := (A_Index + 2) * perSegment
		y2 := yEnd  - y
		y1 := yEnd - y - perSegment
		y2 := floor(y2)
		y1 := floor(y1)
		MsgBox %x1%,%y1% and %x2%,%y2%
	}
Return

+a::
	while (true) {
		;Blue pattern
		if (clicked(463, 387, 866, 732, 0xC69F36))
			Continue
		;Gift
		if(clicked(463, 39, 866, 732, 0x3A3DED))
			Continue		

		
		MaxLoop := 10
		Loop %MaxLoop%{
			yEnd = 730	
			perSegment := yEnd/MaxLoop
			y := (A_Index - 1) * perSegment
			y2 := yEnd  - y
			y1 := yEnd - y - perSegment
			y2 := floor(y2)
			y1 := floor(y1)
			clicked(463, y1, 866, y2, 0x000000)
			Continue
		}
	}
Return

clicked(x1, y1, x2, y2, color) {
	;MsgBox %x1%,%y1% and %x2%,%y2%	
	PixelSearch, Px, Py, x1, y1, x2, y2, color, 3, Fast
	if !ErrorLevel {
		Px := Px + 1
		Py := Py + 1
		;SendEvent {Click %Px%, %Py%}
		MouseMove, %Px%, %Py%
		if(clickIsValid(color)) {
			Send {Click}
			return true
		}
	}
	return false
}

clickIsValid(clickableColor){
	MouseGetPos, MouseX, MouseY
	PixelGetColor, color, %MouseX%, %MouseY%
	;Black, Blue, 
	if(clickableColor==0x000000)
		return (color>=2da0f2)
	else
		return (color==clickableColor)
}

+s::  ; Control+Alt+Z hotkey.
	MouseGetPos, MouseX, MouseY
	PixelGetColor, color, %MouseX%, %MouseY%
	MsgBox The color at the current cursor position is %color%.
return
