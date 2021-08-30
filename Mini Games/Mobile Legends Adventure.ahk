

global assistEnabled:=true
global tapEnabled:=true
global buyEnabled:=false
global hasEnemy:=false
global withQ:=true
global isFastForward:=false
global clickerEnabled:=false

#Include ../___Basic.ahk

!p::ExitApp

!'::
	assistEnabled:=false
	SoundBeep 350, 100
Return
!/::
	SetKeyDelay, 0, 10
	SetMouseDelay, 1, 1
	assistEnabled:=true
	SoundBeep 350, 100
	while(assistEnabled){
		;Click twice auto
		if(c(1321, 182, 0x868686)){
			click(1452, 168)
		}
		
		;Level up
		if(c(980, 268, 0xFFE4A8) && c(1049, 308, 0xFFF7DF)){
			click(950, 835)
		}

		;Victory prompt
		if(c(519, 858, 0xA4C9E2) && c(1256, 418, 0xC5C1C1))
			click(1173, 836)

		;Idle Rewards
		if(c(1175, 247, 0xD4D4D4) && c(677, 833, 0xFFC065))
			click(799, 813)

		;In quests
		if(c(910, 170, 0xA13BC5) && c(457, 167, 0xEDEDFD)){
			clickWhen(1361, 702, 0xFFC66B, 0, 0)
			clickWhen(1362, 586, 0xFEC56A, 0, 0)
			clickWhen(1356, 470, 0xFFC066, 0, 0)
			clickWhen(736, 237, 0x3FCFE5, 736, 281) ;Claim first chest
			clickWhen(925, 236, 0x47D6E9, 925, 277) ;Claim second chest
		}

		;Close reward
		if(c(874, 324, 0xFEFFFF) && c(959, 293, 0xC2C097))
		click(986, 385)
	}
Return


!a::
	Soundbeep 350, 100
	clickerEnabled:=true
	while(clickerEnabled){
		Click L
	}
Return

;Stop
!s::
	Soundbeep 350, 100
	clickerEnabled:=false
Return