﻿#Include __Item.ahk
SetKeydelay -1

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

Space & F1::Return ; Mentioned in the hotkeys docs for UP
*Space::Send {Blind}{Space} ; Send it explicitly when no other key is pressed before letting go, including any modifiers being held

#If GetKeyState("Space", "p") ; Autohotkey_L directive for enabling following mappings when key is physically down

!s::Suspend
w::
	switchTread2(1)
	Send w
	Sleep 500
	Send vv
Return

q::
	switchTread2(1)
	Send q
	Sleep 500
	Send vv
Return

r::
	switchTread2(1)
	Send r
	Sleep 500
	Send vv
Return