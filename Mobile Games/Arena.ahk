global sensitivity:=4
global aiEnabled:=true
arenaColor:=0x000000
deadColor:=0x000000
hasEnemy:=false

#Include __Basic.ahk
#IfWinActive BlueStacks

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

Space & F1::Return ; Mentioned in the hotkeys docs for UP
*Space::Send {Blind}{Space} ; Send it explicitly when no other key is pressed before letting go, including any modifiers being held

#If GetKeyState("Space", "p") ; Autohotkey_L directive for enabling following mappings when key is physically down

a::
	drag(685, 1002)
Return
s::
	drag(791, 996)
Return
d::
	drag(883, 997)
Return
q::
	drag(1039, 1001)
Return
w::
	drag(1136, 1007)
Return
e::
	drag(1238, 1004)
Return
