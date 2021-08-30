;Magic Chess
#SingleInstance force
CoordMode, Mouse, Screen
CoordMode, Tooltip, Screen
CoordMode, Pixel, Screen
SetCapsLockState, AlwaysOff
setmousedelay -1
setkeydelay -1
global spamBuyMcEnabled:=false
global withMc:=true
global lineupSelected:=true
global mcPlayRemaining:=6
global mcSurrender:=false		;Surrender part
global minRefresh:=2
global maxRefresh:=2
global round:=0
global maxRound:=20
global shouldDeleteHeroes:=0
loop(){
	;Not in match
	if c(959, 90, 0x09080B){
		;Close all kind of dialog
		if c(1373, 250, 0x272E36)
		|| c(1373, 249, 0x343E49){
			tooltip("Close all match dialog")
			escape()
			return
		}
	}
	;Start game
	if(c(443, 816, 0xD5FFFF)){
		if(mcPlayRemaining<=0){
			click(495, 258)
			pixelWait(856, 766, 0xD6A668)
		}
		else{
			click(1436, 661)
		}
		Sleep 2000
		return true
	}

	;Enter match
	if(c(957, 748, 0xCDA564)){
		click(866, 745)
		lineupSelected:=false
		return true
	}

	;Pick item
	if(isColor(821, 416, 0x3D6798)){ ;821, 416, 0x3D6798
		click(1236, 410)
		Sleep 200
		click(673, 411)
		Sleep 200
		click(759, 323)
		Sleep 200
		click(890, 323)
		Sleep 200
		click(1024, 337)
		Sleep 200
		click(1167, 335)
	}

	;Recommend lineup showup
	if(isColor(1462, 293, 0x7CCAFF)){
		if(mcSurrender){
			surrenderMc()	
			return true
		}
		else{
			click(1340, 362)
			Sleep 500
			click(1461, 294)
			Sleep 500	
			afterRecommendLineup()
			return true
		}
	}

	;In inventory
	if(isInInventory()){
		if(mcSurrender){
			surrenderMc()	
			return true
		}
		;Recommend lineup first time
		else if(!lineupSelected){		
			recommendLineup()
			afterRecommendLineup()
		}
		else{
			buyOrRefresh()
			
			;MC Add more slot
			if(isColor(500, 1054, 0x4B9CC6)){
				click(486, 1012)
			}

			;Pick item from monster 
			if(isColor(465, 198, 0xFE1021)){
				if(isColor(506, 580, 0x33445C)){
					assignItems()
				}
				else{
					click(449, 218)
					click(520, 79)
					click(520, 141)
					click(517, 207)
					click(449, 218)
				}
			}	

			;Assign item
			if(isColor(468, 197, 0xFF1324)){
				if(isColor(521, 582, 0x2E475F)){
					assignItems()
				}
			}
		}			
	}

	;If viewing other player, return
	if c(923, 735, 0xBE8F62) && c(942, 1028, 0x40486F) {
		click(921, 731)
	}

	;If commander in low health (564 Magictian)
	if(isColor(541, 564, 0x73E70E)&&isColor(556, 563, 0x151712)){
		loopSpamBuyMc()
		return true
	}

	;Eliminated
	if(isColor(1089, 779, 0x4F78C2)){
		stopSpamBuyMc()
		click(1089, 791)	
		return true
	}

	;Tally up rank
	if(isColor(520, 485, 0xFFFFAC)){
		stopSpamBuyMc()
		click(965, 791)
		return true
	}
	
	;MC Rank summary
	if(isColor(1434, 792, 0xBD945B)){
		spamBuyMcEnabled:=false
		click(1434, 792)
		return true
	}

	;MC exp summary
	if(isColor(1010, 409, 0xC4535A) && isColor(1377, 809, 0xB08C59)){
		click(1377, 809)
		return true
	}

	;MC Statistic
	if(isColor(461, 807, 0xA0CEFF) && isColor(1371, 819, 0xB4895F)){
		click(1390, 817)
		mcPlayRemaining:=mcPlayRemaining-1
		return true
	}
	
	;Close MC Competition
	if(isColor(1195, 657, 0xFFFF5C)){
		click(1412, 364)
	}
}

afterRecommendLineup(){
	shouldDeleteHeroes:=1
	lineupSelected:=true
	round:=0
	isHeroBought()
	openInventory()
	useSpell()
}

assignItems(){
	;Assign item base
	click(509, 91)
	Sleep 200
	click(697, 315)
	Sleep 200

	click(510, 87)	;L
	assignToHero2()
	click(596, 87)	;1
	assignToHero2()
	click(597, 149)	;2
	assignToHero2()
	click(598, 210)	;3
	assignToHero2()
	click(598, 271)	;4
	assignToHero2()
	click(597, 335)	;5
	assignToHero2()

	click(596, 87)	;1
	assignToHero1()
	click(597, 149)	;2
	assignToHero1()
	click(598, 210)	;3
	assignToHero1()
	click(598, 271)	;4
	assignToHero1()
	click(597, 335)	;5
	assignToHero1()
	click(510, 87)	;L
	assignToHero1()

	click(450, 81)
}
assignToHero1(){
	Sleep 100
	click(696, 88)
	Sleep 100
}
assignToHero2(){
	Sleep 100
	click(697, 158)
	Sleep 100
}
buyOrRefresh(){
	if(shouldDeleteHeroes==1){
		delete3Heroes()
		shouldDeleteHeroes:=0
	}
	round:=round+1
	
	Loop %minRefresh% {
		hasDeposit2:=isColor(1413, 18, 0xF5EBAA)

		;Always refresh if round > 11 || Refresh when no hero bought and has deposit 2
		if(round>11 || (!isHeroBought() && hasDeposit2)){
			clickRefresh()		
			Sleep 500
		}
	}
	isHeroBought()

	;Refresh more by deposit 4
	refresh:=0
	if(isColor(1464, 15, 0xF4EAA8))
		refresh:=2
	Loop %refresh% {
		isHeroBought()
		clickRefresh()
		Sleep 500
	}
	isHeroBought()
	
	;Close inventory
	click(1436, 1007)
	Sleep 500
	useSpell()
}
useSpell(){
	click(456, 654)
}
clickRefresh(){
	Sleep 75
	click(1438, 523)
	Sleep 100
}
isHeroBought(){
	buy:=false
	;1
	if(isColor(653, 440, 0xFFFFFF) && c(654, 438, 0xFFFFFF)){
		buy:=true
		click(653, 442)
		Sleep 300
	}
	;2
	if(isColor(825, 439, 0xFFFFFF) && c(831, 443, 0xFFFFFF)){
		buy:=true
		click(830, 441)
		Sleep 300
	}
	;3
	if(isColor(1001, 438, 0xFFFFFC) && c(1009, 443, 0xFFFFFF)){
		buy:=true
		click(1005, 441)
		Sleep 300
	}
	;4
	if(isColor(1181, 442, 0xFFFFFF) && c(1184, 443, 0xFFFFFF)){
		buy:=true
		click(1181, 441)
		Sleep 300
	}
	;5
	if(isColor(1357, 440, 0xFFFFFF) && c(1355, 433, 0xFFFFFF)){
		buy:=true
		click(1356, 439)
		Sleep 300
	}
	return buy
}

clickDelete(){
	pixelWait(462, 417, 0xC33A44)
	click(515, 417)
	click(515, 417)
}
isInInventory(){
	return isColorS(1440, 1040, 0x1F5889, 8)
}
isMcInGrandMaster(){
	return isColor(514, 367, 0x61A5A3)
}
isMcInElite(){
	return isColor(509, 351, 0xADC6CE)
}
recommendLineup(){
	click(461, 598)
	Sleep 1000
	click(475, 414)
	Sleep 1000
	click(1391, 376)
	Sleep 1000

	;Close lineup
	click(1464, 295)
	Sleep 500

	round:=0
}

openInventory(){
	click(1436, 1007)
	Sleep 600
}
openInventoryIfClosed(){
	if(!isColor(1436, 1040, 0x1F5889)){
		openInventory()
		Sleep 750
	}
}



delete3Heroes(){
	openInventory()
	click(453, 79)

	click(694, 594)
	Sleep 500
	click(694, 594)
	Sleep 500
	deleteHero()
	click(715, 535)
	Sleep 500
	deleteHero()
	click(710, 475)
	Sleep 500
	deleteHero()

	openInventory()
}

deleteHero(){
	click(485, 409)
	Sleep 500
}
surrenderMc(){
	Sleep 285000
	if(isColor(1462, 293, 0x7CCBFF)){
		click(1462, 293)
		Sleep 500
	}
	click(537, 13)
	Sleep 2000
	click(1026, 808)
	Sleep 1000
	click(1078, 657)
}

buyIfExists(x, y, color){
	if(!isColorS(x, y, color, 4)){
		click(x, y)
		removeTemporaryHeroes()
		return true
	}
	else return false
}
removeTemporaryHeroes(){
	if(isColor(506, 671, 0xC23942)){
		click(506, 671)
		Sleep 75
	}
}

buyHeroesInInventoryIfExists(){
	if(isInInventory()){
		hasHero:=false
		;5
		if(buyIfExists(1269, 404, 0x2B4C6D)){
			hasHero:=true	
		}
		;4
		if(buyIfExists(1082, 403, 0x2E4768))
			hasHero:=true
		;3
		if(buyIfExists(905, 388, 0x273954))
			hasHero:=true
		;2
		if(buyIfExists(728, 391, 0x25354C))
			hasHero:=true
		;1
		if(buyIfExists(561, 395, 0x223246))
			hasHero:=true
		
		;Refresh and close inventory
		Sleep 150
		clickRefresh()
		Sleep 100
		openInventory()
		
		return true
	}
	else {
		return false
	}
}
deleteHeroesInSlotIfExists(){
	hasHero:=false
	;Match not yet started
	if(c(961, 816, 0x151515)){
		;1st slot
		if(deleteHeroIfExists(681, 699, 0x8E95AE)){
			hasHero:=true
		}
		;2nd slot 
		if(deleteHeroIfExists(762, 697, 0x99A1B2)){
			hasHero:=true
		}
		;3rd slot
		if(deleteHeroIfExists(843, 699, 0x7D859E)){
			hasHero:=true
		}
		;4    
		if(deleteHeroIfExists(920, 703, 0x8A8AA2)){
			hasHero:=true
		}
		;5 
		if(deleteHeroIfExists(1001, 702, 0x9CA3B4)){
			hasHero:=true
		}
		;6 
		if(deleteHeroIfExists(1081, 703, 0x7C849D)){
			hasHero:=true
		}
		;7 
		if(deleteHeroIfExists(1159, 701, 0x99A2BA)){
			hasHero:=true
		}
		;8 
		if(deleteHeroIfExists(1241, 703, 0x97A0B8)){
			hasHero:=true
		}
	}
	;Match started
	else{
		;1st slot
		if(deleteHeroIfExists(695, 732, 0x8E96AF)){
			hasHero:=true
		}
		;2nd slot 
		if(deleteHeroIfExists(772, 731, 0x98A0B4)){
			hasHero:=true
		}
		;3rd slot
		if(deleteHeroIfExists(846, 724, 0x858DA6)){
			hasHero:=true
		}
		;4 
		if(deleteHeroIfExists(923, 724, 0x878FA8)){
			hasHero:=true
		}
		;5 
		if(deleteHeroIfExists(999, 723, 0xA7ADBD)){
			hasHero:=true
		}
		;6 
		if(deleteHeroIfExists(1074, 724, 0x868EA7)){
			hasHero:=true
		}
		;7 
		if(deleteHeroIfExists(1148, 725, 0x9CA5BD)){
			hasHero:=true
		}
		;8 
		if(deleteHeroIfExists(1223, 725, 0x9AA3B8)){
			hasHero:=true
		}
	}

	;Has hero then open inventory
	if(!hasHero){
		openInventoryIfClosed()
	}


	;Eliminated
	if(isColor(1089, 791, 0x447FC9)){
		stopSpamBuyMc()	
	}

	if(isColor(520, 485, 0xFFFFAC)){
		stopSpamBuyMc()
	}
}


deleteHeroIfExists(x, y, color){
	if(!isColor(x, y, color)){
		click(x, y)
		click(x, y)
		clickDelete()
		return true
	} else return false
}
stopSpamBuyMc(){
	spamBuyMcEnabled:=false
	beep()
}
loopSpamBuyMc(){
	spamBuyMcEnabled:=true
	beep()
	while(spamBuyMcEnabled){
		if(!buyHeroesInInventoryIfExists())
			deleteHeroesInSlotIfExists()
	}
}

while(true)
	loop()
!p::ExitApp
#Include __Basic.ahk