global assistEnabled:=false

Escape::
	ExitApp
Return

!a::
	Soundbeep 350, 100
	assistEnabled:=true
	while(assistEnabled){
		Random, rand, 0, 1
		if(rand==0)
			Click, L
		else
			Click, R
	}
Return

!s::
	Soundbeep 350, 100
	assistEnabled:=false
Return