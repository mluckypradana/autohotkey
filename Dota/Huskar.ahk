#Include _Basic.ahk
#Include _Armlet.ahk
#Include _MagicWand.ahk
SetKeydelay -1

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

Space & F1::Return ; Mentioned in the hotkeys docs for UP
*Space::Send {Blind}{Space} ; Send it explicitly when no other key is pressed before letting go, including any modifiers being held

#If GetKeyState("Space", "p") ; Autohotkey_L directive for enabling following mappings when key is physically down

q::
	switchTread(1)
	Send !{q}
	Sleep 500
	switchTread(0)
Return

;init
r::
	;switchTread(1)
	;Send !{q}
	;Sleep 500
	switchTread(0)
	Send r
	Sleep 1000
	Send c
	activateArmlet()
Return