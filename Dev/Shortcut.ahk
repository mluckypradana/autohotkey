#Include ../___Basic.ahk


Capslock & 1::	
	Send, {ALTDOWN}{TAB}{ALTUP}
	Sleep 500
	Send {Space}
Return

Capslock & 2::
	Send {Space}	
	Send, {ALTDOWN}{TAB}{ALTUP}
Return

;#IfWinActive ahk_exe studio64.exe

#!l::
	FileRead, Clipboard, _LinearLayout.txt
	Send, ^v
	Send {Up}
Return
#!i::
	FileRead, Clipboard, _ImageView.txt
	Send, ^v
	Send {Up}
Return
#!t::
	FileRead, Clipboard, _TextView.txt
	Send, ^v
	Send {Up}{Left}
Return

+#t::
	Send {Enter}
	Send tools:text=""
	Send {Left}
Return
+#v::
	Send {Enter}
	Send tools:visibility=""
	Send {Left}
Return

+#b::
	Send {Enter}
	Send tools:srcCompat="@tools:sample/backgrounds/scenic"
Return

;Toggle camel snake case to camel case
#c::
	untapButtons()
	Loop, 5{
		Send +!u
	}
	untapButtons()
Return

#LButton::
	Send !{left}
Return
#MButton::
	closeTab()
Return
#RButton::
	Send !{right}
Return
#Space::
	autoFormat()
	Send !^{F10}
	Send +{F12}
Return
#x::
	closeTab()
Return
runDetekt(){
	Send !{F12}
	pixelWait(1886, 912, 0x3C3F41)
	Send gradlew detekt{Enter}
	Sleep 100
	Send +{Esc}
}
autoFormat(){
	Send !^;
	Send !^o
}
closeTab(){
	autoFormat()
	Send ^{F4}
}

#IfWinActive