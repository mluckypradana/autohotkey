active:=false
SetKeyDelay -1

Escape::
	ExitApp
Return

+,::
	active:=false
Return

+.::
	active:=true
	while(active){
		Send I want level 3 PA arcana and Lina arcana, please trade with me
		Send {Enter}
	}
Return