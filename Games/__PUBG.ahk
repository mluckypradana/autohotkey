;#IfWinactive, Bluestacks
CoordMode, mouse, screen ; does NOT use active window coords
CoordMode, Pixel, screen
SetMouseDelay -1
;Open GG
^q::
	Send {f1}
	Click 24, 121, L
Return
^w::
	Click 24, 121, L
Return
^e::
	Click 1052, 247, L
Return
^1::
	Click 997, 160, L
Return
^2::
	Click 940, 627, L
Return
;Execute
^r::
	Click 1074, 538, L
Return
