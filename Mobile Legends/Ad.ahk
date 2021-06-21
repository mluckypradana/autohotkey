global sensitivity:=4
global aiEnabled:=true
arenaColor:=0x000000
deadColor:=0x000000
hasEnemy:=false

#Include __Basic.ahk
#IfWinActive BlueStacks
!7::
	aiEnabled:=false
	SoundBeep 350, 100
Return

;Auto accept + Auto attack
!8::
	aiEnabled:=true
	SoundBeep 350, 100	
	while(aiEnabled){
		;Close game at top left
		if(isColor(472, 51, 0xEDEFF0)){
			if(isColor(1444, 1026, 0x231F17) || isColor(1437, 1018, 0x333B46))
				click(499, 77)
		}
	}
Return
#IfWinActive

