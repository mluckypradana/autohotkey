#Include __Item.ahk
SetKeydelay -1

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

Space & F1::Return ; Mentioned in the hotkeys docs for UP
*Space::Send {Blind}{Space} ; Send it explicitly when no other key is pressed before letting go, including any modifiers being held

#If GetKeyState("Space", "p") ; Autohotkey_L directive for enabling following mappings when key is physically down

;Ultimate initiation
c::
	if(!blinkAllowed())
		Return
	switchTread(1)
	Send scq
	Sleep 900	
	Send exr
	Sleep 300
	Send vv
Return
q::
	switchTread(1)
	Send q
	Sleep 500
	Send vv
Return