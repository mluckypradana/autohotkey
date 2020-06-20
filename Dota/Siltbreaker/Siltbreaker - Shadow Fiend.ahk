#Include Basic.ahk
#Include __Item.ahk
SetMouseDelay 5
SetKeyDelay -1

!s::Suspend

Space & q::
	Send {SC027 down}
	Send {Click R}
	Send {SC027 up}
	Sleep 10
	switchTread(1)
	Send q
	Sleep 700
	Send v
Return

Space & w::
	Send {SC027 down}
	Send {Click R}
	Send {SC027 up}
	Sleep 10
	switchTread(1)
	Send w
	Sleep 700
	Send v
Return

Space & e::
	Send {SC027 down}
	Send {Click R}
	Send {SC027 up}
	Sleep 10
	switchTread(1)
	Send e
	Sleep 700
	Send v
Return