#SingleInstance
#Include ../___Basic.ahk

global a:=0
global b:=0

+#z::
	MouseGetPos x, y
	a:=x
	b:=y
Return

+#x::
	MouseGetPos x, y
	drag(a, b, x, y)
	MouseGetPos x, y
	a:=x
	b:=y
Return