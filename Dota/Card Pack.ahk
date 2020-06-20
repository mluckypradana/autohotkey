active:=false
SetKeyDelay -1
SetMouseDelay -1

Escape::
	ExitApp
Return

+,::
	active:=false
Return

+a::
	Send {Click, 675, 400}
	Send {Click, 852, 400}
	Send {Click, 489, 400}
	Send {Click, 1022, 400}
	Send {Click, 340, 400}
Return