#Include ../___Basic.ahk
#/::
	WinGetTitle, Title, A
	CenterWindow(Title)
	tooltip("Window moved")
Return

CenterWindow(WinTitle){
    WinGetPos,,, Width, Height, %WinTitle%
    WinMove, %WinTitle%,, (A_ScreenWidth/2)-(Width/2), (A_ScreenHeight/2)-(Height/2)
}