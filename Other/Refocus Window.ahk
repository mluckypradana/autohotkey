#NoEnv

#z::
	WinGet, PID , PID, A ; <-- need to identify window A = acitive

	WinGetTitle, Title, A
	clipboard := Title . " | " . PID

	MouseGetPos x, y
	Sleep 3000
	Click L, 998, 506
	Sleep 3000
	MouseMove x, y

	WinActivate, ahk_pid %PID%
	Sleep 1000
	WinGet, winid ,, A ; <-- need to identify window A = acitive

	WinGetTitle, Title, A
	clipboard := Title . " | " . PID
Return

#x::
	WinActivate BlueStacks
	WinGetTitle, Title, A
	msgbox % Title
Return

getWinTitle(){

}
