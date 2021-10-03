#SingleInstance force
loop(){
	Sleep 5000
	SoundSet, +1, , mute
	Sleep 250
	SoundSet, +1, , mute
}

while(true)
	loop()
!p::ExitApp