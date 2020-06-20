;#Include Basic.ahk
SetMouseDelay 5
SetKeyDelay -1
Mid1 := 683-12
Mid2 := 683+12
MiddleY = 354 ;379
MidY1 := 354-14
MidY2 := 354+20
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
	Sleep 400
	setmousedelay -1
	mouseMove %Item2X%, %ItemY%
	setmousedelay 8
	MouseClickDrag, left, %Item2X%, %ItemY%, %Mid1%, %MidY1%		;Item2
	setmousedelay -1
	mouseMove %Item3X%, %ItemY%
	setmousedelay 8
	MouseClickDrag, left, %Item3X%, %ItemY%, %Mid2%, %MidY1%		;Item3
	setmousedelay -1
	mouseMove %Item1X%, %Item2Y%
	setmousedelay 8
	MouseClickDrag, left, %Item1X%, %Item2Y%, %Mid1%, %MidY2%		;Item4
	setmousedelay -1
	mouseMove %Item2X%, %Item2Y%
	setmousedelay 8
	MouseClickDrag, left, %Item2X%, %Item2Y%, %Mid2%, %MidY2%		;Item5
	Send z
	setmousedelay -1
	Sleep 50
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
	Sleep 400
	setmousedelay -1
	mouseMove %Item1X%, %ItemY%
	setmousedelay 8
	MouseClickDrag, left, %Item1X%, %ItemY%, %Mid1%, %MidY2%		;Item1
	setmousedelay -1
	mouseMove %Item3X%, %ItemY%
	setmousedelay 8
	MouseClickDrag, left, %Item3X%, %ItemY%, %Mid2%, %MidY2%		;Item3
	setmousedelay -1
	mouseMove %Item1X%, %Item2Y%
	setmousedelay 8
	MouseClickDrag, left, %Item1X%, %Item2Y%, %Mid1%, %MidY1%		;Item4
	setmousedelay -1
	mouseMove %Item2X%, %Item2Y%
	setmousedelay 8
	MouseClickDrag, left, %Item2X%, %Item2Y%, %Mid2%, %MidY1%		;Item5
	Send x
	setmousedelay -1
	Sleep 50
	SendEvent {Click ,%Mid1%, %MidY2%, R}
	Sleep 50
	SendEvent {Click ,%Mid2%, %MidY2%, R}
	Sleep 50
	SendEvent {Click ,%Mid1%, %MidY1%, R}
	Sleep 50
	SendEvent {Click ,%Mid2%, %MidY1%, R}
Return

;Soulring
+v::
	Send ss
	Sleep 400
	setmousedelay -1
	mouseMove %Item1X%, %ItemY%
	setmousedelay 8
	MouseClickDrag, left, %Item1X%, %ItemY%, %Mid1%, %MidY1%		;Item1
	setmousedelay -1
	mouseMove %Item2X%, %ItemY%
	setmousedelay 8
	MouseClickDrag, left, %Item2X%, %ItemY%, %Mid2%, %MidY1%		;Item2
	setmousedelay -1
	mouseMove %Item3X%, %ItemY%
	setmousedelay 8
	MouseClickDrag, left, %Item3X%, %ItemY%, %Mid1%, %MidY2%		;Item3
	setmousedelay -1
	mouseMove %Item2X%, %Item2Y%
	setmousedelay 8
	MouseClickDrag, left, %Item2X%, %Item2Y%, %Mid2%, %MidY2%		;Item5
	Send v
	setmousedelay -1
	Sleep 50
	SendEvent {Click ,%Mid1%, %MidY1%, R}
	Sleep 50
	SendEvent {Click ,%Mid2%, %MidY1%, R}
	Sleep 50
	SendEvent {Click ,%Mid1%, %MidY2%, R}
	Sleep 50
	SendEvent {Click ,%Mid2%, %MidY2%, R}
Return