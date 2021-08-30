#Include ../___Basic.ahk
global clickerEnabled:=false
global xSource := 0
global ySource := 0
global xRand1 := 0
global xRand2 := 0
global yRand1 := 0
global yRand2 := 0

!p::
	ExitApp
Return

;Regular click
+q::
	click(1546, 172)
Return
+w::
	click(1653, 168)
Return
+s::
	MouseClickDrag L, 1537, 231, 1816, 225
Return