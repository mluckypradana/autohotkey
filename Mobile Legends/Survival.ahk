#Include __Basic.ahk
SetKeydelay -1

#NoEnv  ;
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

Space & F1::Return ; Mentioned in the hotkeys docs for UP
*Space::Send {Blind}{Space} ; Send it explicitly when no other key is pressed before letting go, including any modifiers being held

#If GetKeyState("Space", "p") ; Autohotkey_L directive for enabling following mappings when key is physically down

3::
	click(1362, 135)
	click(1364, 216)
	click(1364, 296)
Return
4::
	click(1362, 135)
Return
5::
	click(1364, 216)
Return

q::
	click(1197, 71)
Return
w::
	click(1239, 80)
Return

x::
	click(975, 1005)
Return
c::
	click(1058, 1012)
Return
v::
	click(975, 1005)
	click(1058, 1012)
Return

g::
	click(1412, 988)
	click(975, 1005)
	Sleep 500
	click(1058, 1012)
	click(1427, 828)
Return
