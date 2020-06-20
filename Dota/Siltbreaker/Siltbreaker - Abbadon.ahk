#Include Basic.ahk
#Include __Item.ahk
SetMouseDelay 3
SetKeyDelay -1
MiddleX = 683
MiddleY = 350 ;379
ItemY = 723
Item1X = 828
Item2X = 863
Item3X = 900
Midd = 472731

Escape::
	ExitApp
Return

;Magic Wand
+z::
	switchTread2(2)
	Send zv
Return

+c::
	send zc
Return

Space & w::
	switchTread2(1)
	Send !{w}
	Sleep 500
	Send vv
Return

Space & q::
	switchTread2(1)
	Send q
	Sleep 500
	Send vv
Return