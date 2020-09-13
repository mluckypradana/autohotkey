#Include ../___Basic.ahk
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

+#c::
	Send {Enter}
	Send tools:srcCompat="@tools:sample/backgrounds/scenic"
Return

#t::
	Send {Enter}
	Send android:text="@{{}{}}"
	Send {Left}{Left}
Return