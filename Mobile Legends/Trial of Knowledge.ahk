global sensitivity:=4
global aiEnabled:=true
arenaColor:=0x000000
deadColor:=0x000000
hasEnemy:=false

#Include __Basic.ahk
#IfWinActive BlueStacks
!,::
	aiEnabled:=false
	SoundBeep 350, 100
Return

;Auto accept + Auto attack
!.::
	aiEnabled:=true
	SoundBeep 350, 100	
	while(aiEnabled){
		;If you want to team up with a friend, what should you do? Click Invite	
		if(c(1206, 756, 0x9CBDE5) && c(1195, 759, 0x92B4DA) && c(1131, 761, 0x95B7DE) && c(760, 759, 0x5D7E9E))
			r()
		;Is it true that in the Magic Chess, your hero can be upgraded to 3-star? Yes
		if(c(640, 765, 0xA1B2DA) && c(626, 763, 0x64809F) && c(1247, 751, 0x89B9DA) && c(802, 741, 0x577D9A))
			l()
		;How many members are there in the VenomSquad? 5
		if(c(1185, 750, 0x81A4C7) && c(1081, 751, 0x5C819F) && c(909, 757, 0x436984) && c(1139, 764, 0x98B9E1))
			l()
		;What will you get when Skin Trial Card owned? BP
		if(c(756, 761, 0x6081A1) && c(707, 769, 0x7B99BC) && c(572, 770, 0x8BACCB) && c(1075, 740, 0x6F93B3))
			l()
		;All heroes available in Mayhem? No
		if(c(1073, 748, 0x5D82A0) && c(1060, 756, 0x9ABCE3) && c(948, 764, 0xA2C3EC) && c(651, 749, 0x7896B3))
			r()

		;Survival Victory? Survive end game
		if(c(1274, 748, 0x6390AC) && c(1237, 765, 0x95BEDF) && c(1012, 764, 0x9BBCE4) && c(793, 755, 0x85A8CC))
			r()
		;Claude's Companion name? Dexter
		if(c(968, 751, 0x89ABD0) && c(801, 764, 0x8FB1D7) && c(658, 748, 0x6C8CA8) && c(590, 749, 0x607E9D))
			r()
		;Cyclone Eye respawn? 45s
		if(c(978, 749, 0x93B5DB) && c(920, 764, 0x8DB0D6) && c(851, 764, 0x90B2D9) && c(756, 765, 0xA3BBE5))
			l()
		;Cecillion and Carmila? Gusion
		if(c(1287, 749, 0x7CABCA) && c(1134, 765, 0x9FC0E8) && c(1032, 765, 0xA1C2EB) && c(735, 763, 0x4E718D))
			r()
		;Popol kupa meet? Trap
		if(c(1064, 749, 0x7B9EC0) && c(1004, 763, 0x7296B8) && c(986, 765, 0xA2C3EC) && c(800, 763, 0x6D91B2))
			r()
	}
Return
#IfWinActive

l(){ 
	;clickL(754, 808) 
	MouseMove 754, 808
	SoundBeep 350, 100
}
r(){ 
	;clickL(1135, 810) 
	MouseMove 1135, 810
	SoundBeep 550, 100
}
c(x, y, color){
	return isColor(x, y, color)
}

