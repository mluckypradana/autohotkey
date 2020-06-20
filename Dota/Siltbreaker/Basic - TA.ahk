#IfWinActive Dota 2

cursorY := 735 ;735
addedCursorX := 50
active := false
lastItemX := 900
lastItemY := 750


!^+s::Suspend

;------------------------------------------------------------Sell item
^!1::
	setmousedelay -1
	mouseGetPos, xPrev, yPrev
	mouseMove 940, 720
	SendEvent {Click, R}
	mouseGetPos, xPos, yPos
	pos := xPos + addedCursorX
	Sleep 50
	SendEvent {Click, %pos%, %cursorY%}
	Sleep 250
	SendEvent {Click, %xPrev%, %yPrev%}
Return

^!2::
	setmousedelay -1
	mouseGetPos, xPrev, yPrev
	mouseMove 940, 740
	SendEvent {Click, R}
	mouseGetPos, xPos, yPos
	pos := xPos + addedCursorX
	Sleep 50
	SendEvent {Click, %pos%, %cursorY%}
	Sleep 250
	SendEvent {Click, %xPrev%, %yPrev%}
Return

^!3::
	setmousedelay -1
	mouseGetPos, xPrev, yPrev
	mouseMove 940, 750
	SendEvent {Click, R}
	mouseGetPos, xPos, yPos
	pos := xPos + addedCursorX
	Sleep 50
	SendEvent {Click, %pos%, %cursorY%}
	Sleep 250
	SendEvent {Click, %xPrev%, %yPrev%}
Return

^!q::
	setmousedelay -1
	mouseGetPos, xPrev, yPrev
	mouseMove 825, 724
	SendEvent {Click, R}
	mouseGetPos, xPos, yPos
	pos := xPos + addedCursorX
	Sleep 50
	SendEvent {Click, %pos%, %cursorY%}
	Sleep 250
	SendEvent {Click, %xPrev%, %yPrev%}
Return

^!w::
	setmousedelay -1
	mouseGetPos, xPrev, yPrev
	mouseMove 866, 724
	SendEvent {Click, R}
	mouseGetPos, xPos, yPos
	pos := xPos + addedCursorX
	Sleep 50
	SendEvent {Click, %pos%, %cursorY%}
	Sleep 250
	SendEvent {Click, %xPrev%, %yPrev%}
Return

^!e::
	setmousedelay -1
	mouseGetPos, xPrev, yPrev
	mouseMove 902, 724
	SendEvent {Click, R}
	mouseGetPos, xPos, yPos
	pos := xPos + addedCursorX
	Sleep 50
	SendEvent {Click, %pos%, %cursorY%}
	Sleep 250
	SendEvent {Click, %xPrev%, %yPrev%}
Return

^!a::
	setmousedelay -1
	mouseGetPos, xPrev, yPrev
	mouseMove 825, 750
	SendEvent {Click, R}
	mouseGetPos, xPos, yPos
	pos := xPos + addedCursorX
	Sleep 50
	SendEvent {Click, %pos%, %cursorY%}
	Sleep 250
	SendEvent {Click, %xPrev%, %yPrev%}
Return

^!s::
	setmousedelay -1
	mouseGetPos, xPrev, yPrev
	mouseMove 866, 750
	SendEvent {Click, R}
	mouseGetPos, xPos, yPos
	pos := xPos + addedCursorX
	Sleep 50
	SendEvent {Click, %pos%, %cursorY%}
	Sleep 250
	SendEvent {Click, %xPrev%, %yPrev%}
Return

^!d::
	setmousedelay -1
	mouseGetPos, xPrev, yPrev
	mouseMove 902, 750
	SendEvent {Click, R}
	mouseGetPos, xPos, yPos
	pos := xPos + addedCursorX
	Sleep 50
	SendEvent {Click, %pos%, %cursorY%}
	Sleep 250
	SendEvent {Click, %xPrev%, %yPrev%}
Return

;------------------------------------------------------------Drop item
!+q::
	Send s
	setmousedelay -1
	mouseGetPos, xPos, yPos
	mouseMove 825, 724
	setmousedelay 5
	SendEvent {Click 825, 724, down}
	MouseMove %xPos%, %yPos%
	setmousedelay -1
Return

!+w::
	Send s
	setmousedelay -1
	mouseGetPos, xPos, yPos
	mouseMove 866, 724
	setmousedelay 5
	SendEvent {Click 866, 724, down}
	MouseMove %xPos%, %yPos%
	setmousedelay -1
Return

!+e::
	Send s
	setmousedelay -1
	mouseGetPos, xPos, yPos
	mouseMove 902, 724
	setmousedelay 5
	SendEvent {Click 902, 724, down}
	MouseMove %xPos%, %yPos%
	setmousedelay -1
Return

!+a::
	Send s
	setmousedelay -1
	mouseGetPos, xPos, yPos
	mouseMove 825, 750
	setmousedelay 5
	SendEvent {Click 825, 750, down}
	MouseMove %xPos%, %yPos%
	setmousedelay -1
Return

!+s::
	Send s
	setmousedelay -1
	mouseGetPos, xPos, yPos
	mouseMove 866, 750
	setmousedelay 5
	SendEvent {Click 866, 750, down}
	MouseMove %xPos%, %yPos%
	setmousedelay -1
Return

!+d::
	Send s
	setmousedelay -1
	mouseGetPos, xPos, yPos
	mouseMove 902, 750
	setmousedelay 5
	SendEvent {Click 902, 750, down}
	MouseMove %xPos%, %yPos%
	setmousedelay -1
Return

!+1::
	Send s
	setmousedelay -1
	mouseGetPos, xPos, yPos
	mouseMove 940, 720
	setmousedelay 5
	SendEvent {Click 940, 720, down}
	MouseMove %xPos%, %yPos%
	setmousedelay -1
Return

!+2::
	Send s
	setmousedelay -1
	mouseGetPos, xPos, yPos
	mouseMove 940, 740
	setmousedelay 5
	SendEvent {Click 940, 740, down}
	MouseMove %xPos%, %yPos%
	setmousedelay -1
Return

!+3::
	Send s
	setmousedelay -1
	mouseGetPos, xPos, yPos
	mouseMove 940, 750
	setmousedelay 5
	SendEvent {Click 940, 750, down}
	MouseMove %xPos%, %yPos%
	setmousedelay -1
Return

^space::
	Send {space}
Return

;------------------------------------------------------------------Switch backpack to last item
^1::
	setmousedelay -1
	mouseGetPos, xPos, yPos
	mouseMove 940, 720
	setmousedelay 8
	MouseClickDrag, left, 940, 720, %lastItemX%, %lastItemY%
	setmousedelay -1
	mouseMove %xPos%, %yPos%
Return
^2::
	setmousedelay -1
	mouseGetPos, xPos, yPos
	mouseMove 940, 740
	setmousedelay 8
	MouseClickDrag, left, 940, 740, %lastItemX%, %lastItemY%
	setmousedelay -1
	mouseMove %xPos%, %yPos%
Return
^3::
	setmousedelay -1
	mouseGetPos, xPos, yPos
	mouseMove 940, 750
	setmousedelay 8
	MouseClickDrag, left, 940, 750, %lastItemX%, %lastItemY%
	setmousedelay -1
	mouseMove %xPos%, %yPos%
Return

::/v::
	Send Who buy Vladimir's Offering?
	Send {Enter}
Return

::/u::
	Send Who has Unhallowed Icon?
	Send {Enter}
Return

::/hp::
	Send Heal me please
	Send {Enter}
Return

::/hi::
	Send Help me build my item.
	Send {Enter}
Return

::/1::
	Send I go first, stay behind.
	Send {Enter}
Return

::/4::
	Send I'll go last, make a queue.
	Send {Enter}
Return