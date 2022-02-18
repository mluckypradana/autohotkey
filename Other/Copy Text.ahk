#NoEnv
SetWorkingDir %A_ScriptDir%
#SingleInstance force
!a::
	Send ^c
	Send, #^2
	Sleep 300
	Send ^a
	Send ^a
	Send {delete}
	Send ^v
	Send {left}
	Sleep 300
	Send {AppsKey}
	Sleep 300
	Send {down}
	Send {down}
	Send {enter}
	Send, #^1
	Sleep 300
	Send {right}
	Send ^v
	Send {right}
	Send {right}
Return