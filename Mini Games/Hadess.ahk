

global assistEnabled:=true
global buyEnabled:=false
global hasEnemy:=false

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
		if (WinActive("Hades")){
			;Gift
			if(isColor(1034, 1022, 0xE5D7C3)||isColor(1040, 1008, 0xFFBC0E))
				Send g9
			
			;Call special (1 filled, 2 filled, 3 filled, Last filled)
			if(isColor(120, 1056, 0xFFFFFF) || isColor(194, 1057, 0xFFF929) || isColor(251, 1057, 0xFFF929) 
				|| isColor(349, 1058, 0xFFFFDA) || isColor(347, 1059, 0xFFFFA0))
				Send f
			
			;Cast shot
			if(isColor(342, 1016, 0x9B2929) && !isColor(67, 1056, 0x292929)){ ;If has health and god gauge is full
				Send q
				if(isColor(562, 1016, 0xFFFFFF)||isColor(566, 1011, 0xFFFFFF) || isColor(565, 1021, 0xFFFFFF))
					Send t
			}	
			;Warning low health
			if(isColor(63, 1018, 0x9B2929) && isColor(347, 1016, 0x000000) && !isColor(1165, 277, 0x353432)){
				Send {Esc}
				Sleep 2000
			}
		}
	}
Return


!;::
	buyEnabled := false
	SoundBeep 350, 100
Return
!.::
	click(608, 330)
	click(609, 565)
	click(613, 776)
Return
!o::
	MouseMove 637, 783
	click(637, 783)
	Click, Down
	Sleep 75
	Click, Up

	MouseMove 633, 562
	Sleep 75
	click(633, 562)
	Click, Down
	Sleep 75
	Click, Up

	
	MouseMove 764, 974
	Sleep 75
	click(764, 974)
	Click, Down
	Sleep 75
	Click, Up
Return


#IfWinActive