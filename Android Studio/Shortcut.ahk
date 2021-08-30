#Include ../___Basic.ahk
#IfWinActive ahk_exe studio64.exe

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

#RButton::
	Send !{right}
Return