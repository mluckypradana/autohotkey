;#IfWinactive, Nox App player
active:=false
SetMouseDelay -1

MButton::
	MouseGetPos x, y
	Click 685, 425, R
	MouseMove x, y
Return