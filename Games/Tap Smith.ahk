;#IfWinactive, Nox App player
active:=false

Escape::
	ExitApp
Return

!1::
	active:=true
	while(active)
		Send 34
Return

!2::
	active:=false	
Return