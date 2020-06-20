#Include __Item.ahk
SetKeydelay -1

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

Space & F1::Return ; Mentioned in the hotkeys docs for UP
*Space::Send {Blind}{Space} ; Send it explicitly when no other key is pressed before letting go, including any modifiers being held

#If GetKeyState("Space", "p") ; Autohotkey_L directive for enabling following mappings when key is physically down


;SetKeyDelay, 50

;Ultimate initiation
w::
	Send {SC027 down}
	Send {Click R}
	Send {SC027 up}
	Sleep 10
	switchTread(1)
	Send wv
Return

q::
	switchTread(1)
	Send qv
	Sleep 1500
	switchTread(0)
	Sleep 1000
	switchTread(2)
Return

r::
	switchTread(1)
	Send rv
Return


c::
	switchTread(1)
	Send cv
Return