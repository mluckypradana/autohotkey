#Include __Item.ahk
SetKeyDelay, -1
setmousedelay -1

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

Space & F1::Return ; Mentioned in the hotkeys docs for UP
*Space::Send {Blind}{Space} ; Send it explicitly when no other key is pressed before letting go, including any modifiers being held

#If GetKeyState("Space", "p") ; Autohotkey_L directive for enabling following mappings when key is physically down

;Ultimate initiation

global targetX:=0
global targetY:=0

d::
	SoundBeep 350, 100
	MouseGetPos x, y
	targetX:=x
	targetY:=y
Return

e::
	if(targetX==0 || !blinkAllowed()){
		SoundBeep 550, 100
		Return
	}

	Send c
	Sleep 50
	MouseMove %targetX%, %targetY%
	Send e			
Return

c::
	combo()
Return

r::
	combo()
Return

combo(){

	if(targetX==0 || !blinkAllowed()){
		SoundBeep 550, 100
		Return
	}

	Send c
	Sleep 40
	Click, R, %targetX%, %targetY%
	Sleep 220
	Send sr
	Sleep 600
	;Send q
	;Sleep 700
	Send !{w}
}