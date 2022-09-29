#NoEnv
#InstallKeybdHook
SendMode Input

copiedList := []

Loop{
		MouseGetPos x, y
		MouseMove,% MOd(A_Index,2)?1:-1,0,0,R
		Sleep 200000
}
#Include ../___Basic.ahk

Modifier_Up:
For Each, Modifier in ["Shift","Control","LWin","RWin","Alt"]
	If GetKeyState(Modifier) And !GetKeyState(Modifier,"P")
		Send, {%Modifier% Up}
Return

;Paste without - and space char
+^b::
	SetTimer, Modifier_Up, 500
	StringReplace, Clipboard, Clipboard, -, , All
	StringReplace, Clipboard, Clipboard, %A_Space%, , All
	clipSaved := Clipboard
	untapButtons()
	SendRaw, %clipSaved%
Return

+^c::
	;untapButtons()
	send ^c 	
	Sleep 200
	copiedList.Push(clipboard)
	;tooltip(copiedList.length() . ": " . clipboard)
Return

+^v::
	Send % copiedList[1]
	copiedList.RemoveAt(1)
Return

+^r::
	copiedList := []
	tooltip("Reset")
Return

:*?:/thanks::
	text := "Terima kasih atas waktunya " . Clipboard . ". Adios!"
	SendRaw, % text
Return