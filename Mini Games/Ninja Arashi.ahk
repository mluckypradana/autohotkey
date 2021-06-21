#Include ../___Basic.ahk
global assistEnabled:=false

Escape::
	ExitApp
Return

!q::
	Soundbeep 350, 100
	assistEnabled:=true
	while(assistEnabled){
		Send d
		Sleep 100	
	}
Return

!w::
	Soundbeep 350, 100
	assistEnabled:=false
Return