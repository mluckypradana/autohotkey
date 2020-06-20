#Include _Basic.ahk

SetKeydelay 5
SetMouseDelay 5

;Magic wand
+z::
	Send ss
	Sleep 300
	Send {F1}
	Send {F1}

	;Item 2
	setMouseDelay -1
	mouseMove %slot2X%, %slot1Y%
	setMouseDelay 5
	MouseClickDrag, left, %slot2X%, %slot1Y%, %mid1X%, %mid1Y%
	;Item 3
	setMouseDelay -1
	mouseMove %Item3X%, %slot1Y%
	setMouseDelay 5
	MouseClickDrag, left, %slot3X%, %slot1Y%, %mid2X%, %mid1Y%
	;Item 4
	setMouseDelay -1
	mouseMove %Item2X%, %slot1Y%
	setMouseDelay 5
	MouseClickDrag, left, %slot1X%, %slot2Y%, %mid1X%, %mid2Y%
	
	Send z
	setmousedelay -1
	Sleep 50
	SendEvent {Click ,%mid1X%, %mid1Y%, R}
	Sleep 50
	SendEvent {Click ,%mid2X%, %mid1Y%, R}
	Sleep 50
	SendEvent {Click ,%mid1X%, %mid2Y%, R}
	setMouseDelay 5
Return

;Arcane
+x::
	Send ss
	Sleep 300
	Send {F1}
	Send {F1}	

	;Item 1
	setMouseDelay -1
	mouseMove %Item2X%, %slot1Y%
	setMouseDelay 5
	MouseClickDrag, left, %slot1X%, %slot1Y%, %mid1X%, %mid1Y%
	;Item 3
	setMouseDelay -1
	mouseMove %Item3X%, %slot1Y%
	setMouseDelay 5
	MouseClickDrag, left, %slot3X%, %slot1Y%, %mid2X%, %mid1Y%
	;Item 4
	setMouseDelay -1
	mouseMove %Item2X%, %slot1Y%
	setMouseDelay 5
	MouseClickDrag, left, %slot1X%, %slot2Y%, %mid1X%, %mid2Y%
	
	Send x
	setmousedelay -1
	Sleep 50
	SendEvent {Click ,%mid1X%, %mid1Y%, R}
	Sleep 50
	SendEvent {Click ,%mid2X%, %mid1Y%, R}
	Sleep 50
	SendEvent {Click ,%mid1X%, %mid2Y%, R}
	setMouseDelay 5
Return



;Soul Ring in C
+c::
	Send ss
	Sleep 300
	Send {F1}
	Send {F1}	

	;Item 1
	setMouseDelay -1
	mouseMove %Item2X%, %slot1Y%
	setMouseDelay 5
	MouseClickDrag, left, %slot1X%, %slot1Y%, %mid1X%, %mid1Y%
	;Item 2
	setMouseDelay -1
	mouseMove %Item2X%, %slot1Y%
	setMouseDelay 5
	MouseClickDrag, left, %slot2X%, %slot1Y%, %mid2X%, %mid1Y%
	;Item 3
	setMouseDelay -1
	mouseMove %Item3X%, %slot1Y%
	setMouseDelay 5
	MouseClickDrag, left, %slot1X%, %slot2Y%, %mid1X%, %mid2Y%
	
	Send c
	setmousedelay -1
	Sleep 50
	SendEvent {Click ,%mid1X%, %mid1Y%, R}
	Sleep 50
	SendEvent {Click ,%mid2X%, %mid1Y%, R}
	Sleep 50
	SendEvent {Click ,%mid1X%, %mid2Y%, R}
	setMouseDelay 5
Return

;Soul Ring
+v::
	Send ss
	Sleep 300
	Send {F1}
	Send {F1}	

	;Item 1
	setMouseDelay -1
	mouseMove %Item2X%, %slot1Y%
	setMouseDelay 5
	MouseClickDrag, left, %slot1X%, %slot1Y%, %mid1X%, %mid1Y%
	;Item 2
	setMouseDelay -1
	mouseMove %Item2X%, %slot1Y%
	setMouseDelay 5
	MouseClickDrag, left, %slot2X%, %slot1Y%, %mid2X%, %mid1Y%
	;Item 3
	setMouseDelay -1
	mouseMove %Item3X%, %slot1Y%
	setMouseDelay 5
	MouseClickDrag, left, %slot3X%, %slot1Y%, %mid1X%, %mid2Y%
	
	Send v
	setmousedelay -1
	Sleep 50
	SendEvent {Click ,%mid1X%, %mid1Y%, R}
	Sleep 50
	SendEvent {Click ,%mid2X%, %mid1Y%, R}
	Sleep 50
	SendEvent {Click ,%mid1X%, %mid2Y%, R}
	setMouseDelay 5
Return