#SingleInstance force

setmousedelay -1
setkeydelay -1

!a::
	MouseGetPos x, y
	clipboard := % x . ", " . y
Return

^a::
		MouseGetPos x, y
		Click 951, 323
		Click 943, 551
		Click 940, 773
		Click 1410, 775
		Click 1408, 548
		Click 1411, 321
		MouseMove x, y
	
Return