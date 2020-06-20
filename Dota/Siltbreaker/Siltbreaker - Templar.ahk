#Include __Item.ahk
SetMouseDelay 5

!s::Suspend

+z::
	switchTread3(2)
	Send z
Return

;Shield
Space & q::
	switchTread3(1)
	Send qv
Return

;Leak
Space & w::
	Send w
	Sleep 400
	Send a
Return

;Ulti
Space & r::
	switchTread3(1)
	Send r
	Sleep 500
	Send dv
Return