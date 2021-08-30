Process, Close, IDMan.exe
#SingleInstance force
CoordMode, Mouse, Screen
CoordMode, Tooltip, Screen
CoordMode, Pixel, Screen
SetCapsLockState, AlwaysOff
setmousedelay -1
setkeydelay -1

#IfWinActive
>!>+.::
	closeThreads(10, "_AiThread")
	tooltip("AI Thread Stopped")
Return

;Auto accept + Auto attack
>!.::
	runThreads(10, "_AiThread")
	tooltip("AI Thread Started")
Return
#Include __Basic.ahk