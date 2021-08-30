global sensitivity:=4
global adEnabled:=true
arenaColor:=0x000000
deadColor:=0x000000
hasEnemy:=false

#Include __Basic.ahk
#IfWinActive BlueStacks
!7::
	adEnabled:=false
	SoundBeep 350, 100
Return

;Auto accept + Auto attack
!8::
	adEnabled:=true
	SoundBeep 350, 100	
	while(adEnabled){
		;Close game at top left
		if(c(472, 51, 0xEDEFF0)){
			if(c(1444, 1026, 0x231F17) || c(1437, 1018, 0x333B46))
				click(499, 77)
		}

		;--------------------------------------------------
		;In lobby, go to inventory
		if(c(1058, 255, 0xE5D477))
			click(1344, 812)
		
		;In inventory & not in pack (Y)
		if(c(1073, 243, 0x4CB5DE) && c(699, 256, 0xD0BB92)) {
			if(!c(537, 463, 0x44A2F5))
				click(537, 463)
			
			;Use ad
			if(c(1449, 763, 0xAB845D))
				click(1449, 763)
		}
		
		;Close exit game dialog
		if(c(1148, 753, 0xD8565E) && c(781, 754, 0x248BB1))
			click(787, 751)
		;--------------------------------------------------
		
		;Close reward
		if (c(684, 340, 0x797A6B)
			;Playstore app	
			|| (c(1459, 40, 0x1F1F20) && c(1460, 50, 0x666566))
			;Playstore app black background
			|| (c(1459, 39, 0x0D0D0F) && c(1462, 55, 0x525252))
			;Facebook		
			|| (c(921, 719, 0x046DE4) && c(1475, 51, 0xE6E6E6))
			;White close button
			|| (c(1428, 74, 0xFEFEFE) && c(1425, 80, 0xB4B4B4))	
			;In-game close
			|| (c(1462, 13, 0x696969) && c(1470, 32, 0xFDFDFD))	
			;In-game close with bright background
			|| (c(478, 1003, 0xFFFFFF) && c(1463, 38, 0xFFFFFF) && c(1460, 11, 0x686F72))	
			;Borderless close
			|| (c(1429, 68, 0xFFFFFF) && c(1429, 78, 0xB6B6B6))
			;Borderless close black background
			|| (c(446, 1046, 0xE6E6E6) && c(1458, 38, 0xFCFCFC) && c(1457, 55, 0x020202))
			;Video clip close black background
			|| (c(1445, 54, 0xFFFFFF) && c(1447, 71, 0x3C4043) && c(459, 1035, 0xFFFFFF))			)		
			Send {Esc}
			;
			;
			;
		;Cropped close
		if (c(1465, 20, 0x000000) && c(1460, 13, 0x696969))
			click(1462, 20)
		;Cropped close with play button
		if (c(457, 19, 0xE6E6E6) && c(1444, 19, 0x696969))
			click(1462, 20)
		
		;-------------------------------------------------
		;Mute bottom left sound
		;479, 966, 0x000000
		if(c(486, 979, 0xFFFFFF) && c(480, 218, 0x000000) && c(526, 859, 0x000000)){
			click(486, 979)
			Sleep 3000
		}

		;Sleep 1000
	}
Return
#IfWinActive

