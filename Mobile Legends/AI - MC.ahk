global sensitivity:=4
global brawlMatch:=false
global memberDeleted:=false
global memberSorted:=false
global withSquadInvite:=false
global withGroupInvite:=true
global withDeleteMember:=true
aiEnabled:=false

global lineupSelected:=true
global mcPlayRemaining:=4

Esc::ExitApp

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
		Sleep 1000
		;Start game
		if(isColor(1312, 718, 0xFFD065)){
			if(mcPlayRemaining<=0){
				click(495, 258)
				Sleep 500
			}
			else{
				click(1312, 718)
				Sleep 3000
			}
			Continue
		}

		;Enter match
		if(isColor(1052, 737, 0xB6955F)){
			click(1052, 737)
			lineupSelected:=false
			continue
		}

		;Pick item
		if(isColor(821, 416, 0x3D6798)){
			click(673, 411)
			click(759, 323)
			click(890, 323)
			click(1024, 337)
			click(1167, 335)
			click(1236, 410)
		}

		;Recommend lineup showup
		if(isColor(703, 341, 0xEBE2AD)){
			click(716, 532)
			Sleep 500
			click(1459, 294)
			Sleep 500
			lineupSelected:=true
			continue
		}
	
		;In inventory
		if(isColor(1436, 1038, 0x1F598D)||isColor(1445, 1027, 0x83F5FD)){
			;Recommend lineup first time
			if(!lineupSelected){
				delete3Heroes()
				openInventory()					
	
				recommendLineup()
				lineupSelected:=true
			}
			buyOrRefresh()
		}

		;Pick item from monster
		if(isColor(468, 199, 0xFC0E28)){
			click(520, 79)
			click(520, 141)
			click(517, 207)
			continue
		}

		;Eliminated
		if(isColor(1089, 791, 0x447FC9)){
			click(1089, 791)	
			continue
		}

		;Tally up rank
		if(isColor(520, 485, 0xFFFFAC)){
			click(965, 791)
			continue
		}
		
		;MC Rank summary
		if(isColor(1434, 792, 0xBD945B)){
			click(1434, 792)
			continue
		}

		;MC Statistic
		if(isColor(461, 807, 0xA0CEFF) && isColor(1371, 819, 0xB4895F)){
			click(1390, 817)
			mcPlayRemaining:=mcPlayRemaining-1
			continue
		}
		
		;MC Add more slot
		if(isColor(503, 1052, 0x4A9AC3)){
			click(486, 1012)
			continue
		}
		
		;Close MC Competition
		if(isColor(1195, 657, 0xFFFF5C)){
			click(1412, 364)
		}
	}
Return
#IfWinActive

buyOrRefresh(){
	if(!isHeroBought()){
		;Refresh
		clickRefresh()
		if(!isHeroBought()){
			clickRefresh()
			isHeroBought()
		}
		;Close inventory
		click(1436, 1007)
	}
}
clickRefresh(){
	click(1438, 523)
	Sleep 500
}
isHeroBought(){
	buy:=false
	;1
	if(isColor(653, 442, 0xFFFFFF)){
		buy:=true
		click(653, 442)
		Sleep 600
	}
	;2
	if(isColor(830, 441, 0xFFFFFF)){
		buy:=true
		click(830, 441)
		Sleep 600
	}
	;3
	if(isColor(1005, 441, 0xFFFFFF)){
		buy:=true
		click(1005, 441)
		Sleep 600
	}
	;4
	if(isColor(1181, 441, 0xFFFFFF)){
		buy:=true
		click(1181, 441)
		Sleep 600
	}
	;5
	if(isColor(1356, 439, 0xFFFFFF)){
		buy:=true
		click(1356, 439)
		Sleep 600
	}
	return buy
}

recommendLineup(){
	click(461, 598)
	Sleep 1000
	click(475, 414)
	Sleep 1000
	click(1395, 759)
	Sleep 1000

	;Close lineup
	click(1464, 295)
	Sleep 500
}

openInventory(){
	click(1436, 1007)
}

delete3Heroes(){
	click(681, 703)
	Sleep 500
	deleteHero()
	click(767, 732)
	Sleep 500
	deleteHero()
	click(846, 733)
	Sleep 500
	deleteHero()
}

deleteHero(){
	click(485, 409)
	Sleep 500
}

drag(sx, sy, dx, dy){
	MouseMove sx, sy
	SetMouseDelay 15
	MouseClickDrag, Left, sx, sy, dx, dy
	SetMouseDelay -1
}