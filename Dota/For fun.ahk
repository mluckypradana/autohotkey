Toggle := true
ToggleQ := false
ToggleC := false
ToggleW := false

Escape::
	ExitApp
Return

+s::
	Toggle := false
	ToggleQ := false
	ToggleC := false
	ToggleW := false
Return
+r::
	Toggle := true
	While(Toggle){
		IfWinActive, Dota 2
		{
			if(ToggleC)
				Send c
			if(ToggleQ)
				Send q
			if(ToggleW)
				Send w
			Sleep 100
		}
	}
Return
+c::
	ToggleC := !ToggleC
Return
+q::
	ToggleQ := !ToggleQ
Return
+w::
	ToggleW := !ToggleW
Return