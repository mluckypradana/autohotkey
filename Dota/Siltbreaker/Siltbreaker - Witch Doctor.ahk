;#Include Basic.ahk
SetMouseDelay 5
SetKeyDelay -1
Mid1 := 683-7
Mid2 := 683+7
MiddleY = 354 ;379
MidY1 := 354-14
MidY2 := 354+14
ItemY = 723
Item2Y = 760
Item1X = 828
Item2X = 863
Item3X = 900
Midd = 472731

!s::Suspend

Escape::
	ExitApp
Return

;Wand
+z::
	Send ss
	Sleep 300
	MouseClickDrag, left, %Item2X%, %ItemY%, %Mid1%, %MidY1%		;Item2
	MouseClickDrag, left, %Item3X%, %ItemY%, %Mid2%, %MidY1%		;Item3
	MouseClickDrag, left, %Item1X%, %Item2Y%, %Mid1%, %MidY2%		;Item4
	MouseClickDrag, left, %Item2X%, %Item2Y%, %Mid2%, %MidY2%		;Item5
	Send z
	SendEvent {Click ,%Mid1%, %MidY1%, R}
	Sleep 50
	SendEvent {Click ,%Mid2%, %MidY1%, R}
	Sleep 50
	SendEvent {Click ,%Mid1%, %MidY2%, R}
	Sleep 50
	SendEvent {Click ,%Mid2%, %MidY2%, R}
Return


;Arcane
+x::
	Send ss
	Sleep 300
	MouseClickDrag, left, %Item1X%, %ItemY%, %Mid1%, %MidY1%		;Item1
	MouseClickDrag, left, %Item3X%, %ItemY%, %Mid2%, %MidY1%		;Item3
	MouseClickDrag, left, %Item1X%, %Item2Y%, %Mid1%, %MidY2%		;Item4
	MouseClickDrag, left, %Item2X%, %Item2Y%, %Mid2%, %MidY2%		;Item5
	Send x
	SendEvent {Click ,%Mid1%, %MidY1%, R}
	Sleep 50
	SendEvent {Click ,%Mid2%, %MidY1%, R}
	Sleep 50
	SendEvent {Click ,%Mid1%, %MidY2%, R}
	Sleep 50
	SendEvent {Click ,%Mid2%, %MidY2%, R}
Return

;Soulring
+v::
	Send ss
	Sleep 300
	MouseClickDrag, left, %Item1X%, %ItemY%, %Mid1%, %MidY1%		;Item1
	MouseClickDrag, left, %Item2X%, %ItemY%, %Mid2%, %MidY1%		;Item2
	MouseClickDrag, left, %Item3X%, %ItemY%, %Mid1%, %MidY2%		;Item3
	MouseClickDrag, left, %Item2X%, %Item2Y%, %Mid2%, %MidY2%		;Item5
	Send v
	SendEvent {Click ,%Mid1%, %MidY1%, R}
	Sleep 50
	SendEvent {Click ,%Mid2%, %MidY1%, R}
	Sleep 50
	SendEvent {Click ,%Mid1%, %MidY2%, R}
	Sleep 50
	SendEvent {Click ,%Mid2%, %MidY2%, R}
Return

;Stun
Space & q::
	Send cvq
Return

;Heal
Space & w::
	PixelSearch, Px, Py, 686,650, 925,674, 0xFEA8FE, 3, Fast
	If ErrorLevel
		Send vw
Return

;Maledict
Space & e::
	Send vce
Return

;ulti
Space & r::
	Send vcr
Return