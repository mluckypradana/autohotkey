SetKeyDelay, 0
;Shield
Space & q::
	Send svvqv
Return

;Leak
Space & w::
	Send w
	Send {click R}
Return

;Ulti
Space & r::
	Send svvr
	Sleep 600
	Send dv
Return

;Ultimate initiation
+c::
	;cd prevention
	PixelGetColor, color, 914, 670
	If (color!=0x969595) 
		Return
	
	Send svvqvc
	Sleep 300
	Send bw
	Sleep 400
	Send {RButton}
	Sleep 300
	Send vvr
	Sleep 600
	Send dv
Return