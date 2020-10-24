#Include ../___Basic.ahk


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