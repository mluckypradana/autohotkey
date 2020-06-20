CoordMode, mouse, screen ; does NOT use active window coords
CoordMode, Pixel, screen
SetMouseDelay -1

currentColor:=0x000000
started:=0
enabled:=false
color:=0x262b91


+x::
	Send ^c	
	Sleep 120
	Send !{tab}		
	Sleep 120
	Send ^v	
	Sleep 120
	Send {tab}
	Sleep 120
	Send !{tab}	
	Sleep 120
	Send {tab}	
	Sleep 120

return
+c::
Loop, 35 {
	Send ^c	
	Sleep 120
	Send !{tab}		
	Sleep 120
	Send ^v	
	Sleep 120
	Send {tab}
	Sleep 120
	Send !{tab}	
	Sleep 120
	Send {tab}	
	Sleep 120
}
return