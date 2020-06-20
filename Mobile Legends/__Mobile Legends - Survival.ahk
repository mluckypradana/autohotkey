#if WinActive("ahk_exe Bluestacks.exe")
#SingleInstance force
CoordMode, mouse, screen ; does NOT use active window coords
CoordMode, Pixel, screen
SetMouseDelay -1

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

Space & F1::Return ; Mentioned in the hotkeys docs for UP
*Space::Send {Blind}{Space} ; Send it explicitly when no other key is pressed before letting go, including any modifiers being held

#If GetKeyState("Space", "p") ; Autohotkey_L directive for enabling following mappings when key is physically down

!s::Suspend

currentColor:=0x000000
started:=0
enabled:=false
color:=0x262b91

click(cx, cy){
	MouseGetPos x, y
	Click %cx%, %cy%
	MouseMove x, y
}

+1::
	click(1363, 131)
Return
+2::
	click(1355, 209)
Return
+3::
	click(1360, 272)
Return

z::
	click(885, 1006)
Return
x::
	click(971, 1011)
Return
c::
	click(1056, 1010)
Return
r::
	click(1137, 622)
Return
g::
	click(1362, 130)
	click(1354, 203)
Return
1::
	click(1200, 67)
	Sleep 100
	click(1297, 332)
Return

2::
	click(1242, 65)
	Sleep 100
	click(1297, 332)
Return

3::
	click(1284, 63)
	Sleep 100
	click(1297, 332)
Return
4::
	click(1328, 67)
	Sleep 100
	click(1297, 332)
Return
5::
	click(1371, 68)
	Sleep 100
	click(1297, 332)
Return
6::
	click(1416, 64)
	Sleep 100
	click(1297, 332)
Return

