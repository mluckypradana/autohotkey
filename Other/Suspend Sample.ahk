Escape::
	Suspend, Permit
	Suspend, Off ;Toggle
	SoundBeep 550, 100
Return

Enter::
	Suspend, Permit
	Suspend, On ;Toggle
	SoundBeep 300, 70
	Send {Enter}
Return