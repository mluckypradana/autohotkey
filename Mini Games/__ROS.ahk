CoordMode, mouse, screen ; does NOT use active window coords
CoordMode, Pixel, screen
SetMouseDelay -1

Escape::
	ExitApp
Return

f::
	Send {Alt down}
	Click, 935, 535, L
	Send {Alt up}
Return

g::
	Send {Alt down}
	Click, 961, 283, L
	Send {Alt up}
Return

1::
	Send {Alt down}
	Click, 1190, 90, L
	Send {Alt up}
Return
2::
	Send {Alt down}
	Click, 1190, 159, L
	Send {Alt up}
Return

h::
	Send {Alt down}
	Click, 909, 354, L
	Send {Alt up}
Return

j::
	Send {Alt down}
	Click, 902, 407, L
	Send {Alt up}
Return

!s::
	Send {tab}
	Send {Alt down}
	sleep 1000
	MouseClickDrag, L, 677, 430, 677, 190
	Send {Alt up}
	Send {tab}
Return